#!/usr/bin/env python3
"""
Port of Project Zomboid B42.20 tile-depth rasterization (zombie.tileDepth.*) to Python.

Bakes media/depthmaps/DEPTH_<tileset>.png from a tileGeometry.txt.

Java references (pzDecompiled-B42.20.0/source):
  zombie/tileDepth/TileGeometryUtils.java     - camera / projection / ray-solid math
  zombie/tileDepth/CylinderUtils.java         - cylinder intersection
  zombie/tileDepth/TileGeometryFile.java      - geometry parsing + getNormalizedDepthAt dispatch
  zombie/tileDepth/TileDepthTexture.java      - recalculateDepth() min-combine, setBufferedImage() encoding
  zombie/tileDepth/TilesetDepthTexture.java   - sheet layout (8 cols x N rows of 128x256), save()

Encoding (TileDepthTexture.setBufferedImage / TileDepthTexture.load):
  covered texel -> alpha 255, L = floor(min(depth,1) * 255)      (load: depth = B/255)
  empty texel   -> alpha 0, L 0                                  (load: depth = -1)
  8-bit greyscale+alpha PNG (colorType 4), 8 columns x N rows of 128x256 cells.
  No Y flip. clampPixelToUpperFloor and the "byte 0 -> 1" bump happen only on GL
  upload (TileDepthTexture.updateGPUTexture) and are NOT baked into the file.

Reproduce the shipped MarchRidgePreppers bake:
  python bake_depth.py \
    --geometry  "C:/Users/nullv/Zomboid/mods/MarchRidgePreppers/common/media/tileGeometry.txt" \
    --tileset   dwap_tiles_01 --rows 8 \
    --sprite-sheet "C:/Users/nullv/Zomboid/mods/MarchRidgePreppers/SourceTextures/dwap_tiles/dwap_tiles_01.png" \
    --whole-tile   "C:/Program Files (x86)/Steam/steamapps/common/ProjectZomboid/media/depthmaps/DEPTH_whole_tile.png" \
    --out       "C:/Users/nullv/Zomboid/mods/MarchRidgePreppers/common/media/depthmaps/DEPTH_dwap_tiles_01.png"

Other usage:
  python bake_depth.py --geometry <tileGeometry.txt> --tileset <name> --rows <N> --out <DEPTH_x.png>
  python bake_depth.py --geometry ... --tileset ... --tiles 0x9,1x9 --dump-npy <dir>   (validation helper)
"""
import argparse
import math
import os
import re
import sys

import numpy as np

# ---------------------------------------------------------------------------
# tileGeometry.txt parsing  (TileGeometryFile.parseFile / parseCoord)
# ---------------------------------------------------------------------------

COORD_MULT = 10000.0


def strip_comments(text):
    # ScriptParser.stripComments: /* */ block comments
    return re.sub(r"/\*.*?\*/", " ", text, flags=re.S)


class Block:
    def __init__(self, btype=""):
        self.type = btype
        self.values = {}
        self.children = []


def parse_blocks(text):
    """Minimal ScriptParser: `type { key = value, ... nested {...} }`."""
    pos = 0
    n = len(text)

    def parse_body(block):
        nonlocal pos
        token = ""
        while pos < n:
            ch = text[pos]
            if ch == "{":
                pos += 1
                child = Block(token.strip())
                token = ""
                parse_body(child)
                block.children.append(child)
            elif ch == "}":
                pos += 1
                if "=" in token:
                    k, v = token.split("=", 1)
                    block.values[k.strip()] = v.strip()
                return
            elif ch == ",":
                pos += 1
                if "=" in token:
                    k, v = token.split("=", 1)
                    block.values[k.strip()] = v.strip()
                token = ""
            else:
                token += ch
                pos += 1

    root = Block("root")
    parse_body(root)
    return root


def parse_coord(s, version):
    s = s.strip()
    if version == 1:
        try:
            return float(s)
        except ValueError:
            return 0.0
    try:
        return int(s) / COORD_MULT
    except ValueError:
        return 0.0


def parse_vec3(s, version):
    parts = s.strip().split("x")
    return np.array([parse_coord(parts[0], version),
                     parse_coord(parts[1], version),
                     parse_coord(parts[2], version)], dtype=np.float64)


class Box:
    kind = "box"

    def __init__(self, translate, rotate, vmin, vmax):
        self.translate, self.rotate, self.min, self.max = translate, rotate, vmin, vmax


class Cylinder:
    kind = "cylinder"

    def __init__(self, translate, rotate, radius1, radius2, height):
        self.translate, self.rotate = translate, rotate
        self.radius1, self.radius2, self.height = radius1, radius2, height


POLYGON_TILES = []


def load_geometry(path, tileset_name):
    del POLYGON_TILES[:]
    with open(path, "r", encoding="utf-8", errors="replace") as f:
        text = f.read()
    root = parse_blocks(strip_comments(text))
    top = root.children[0]          # tileGeometry { ... }
    version = int(top.values.get("VERSION", "2"))

    tiles = {}
    for ts in top.children:
        if ts.type != "tileset" or ts.values.get("name") != tileset_name:
            continue
        for t in ts.children:
            if t.type != "tile":
                continue
            col, row = (int(v) for v in t.values["xy"].split("x"))
            geoms = []
            has_poly = False
            for g in t.children:
                if g.type == "box":
                    geoms.append(Box(parse_vec3(g.values["translate"], version),
                                     parse_vec3(g.values["rotate"], version),
                                     parse_vec3(g.values["min"], version),
                                     parse_vec3(g.values["max"], version)))
                elif g.type == "cylinder":
                    geoms.append(Cylinder(parse_vec3(g.values["translate"], version),
                                          parse_vec3(g.values["rotate"], version),
                                          parse_coord(g.values["radius1"], version),
                                          parse_coord(g.values["radius2"], version),
                                          parse_coord(g.values["height"], version)))
                elif g.type == "polygon":
                    has_poly = True
            if has_poly:
                # Polygon rasterization (Clipper triangulation) is not ported; such
                # tiles are skipped rather than baked wrong.
                POLYGON_TILES.append((col, row))
                continue
            if geoms:
                tiles[(col, row)] = geoms
    return tiles


# ---------------------------------------------------------------------------
# JOML-equivalent matrix helpers
# ---------------------------------------------------------------------------

def mat_ortho(left, right, bottom, top, znear, zfar):
    """JOML Matrix4f.setOrtho (OpenGL, zZeroToOne=false)."""
    m = np.eye(4)
    m[0, 0] = 2.0 / (right - left)
    m[1, 1] = 2.0 / (top - bottom)
    m[2, 2] = 2.0 / (znear - zfar)
    m[0, 3] = -(right + left) / (right - left)
    m[1, 3] = -(top + bottom) / (top - bottom)
    m[2, 3] = (zfar + znear) / (znear - zfar)
    return m


def mat_translation(v):
    m = np.eye(4)
    m[0:3, 3] = v
    return m


def _rx(a):
    c, s = math.cos(a), math.sin(a)
    return np.array([[1, 0, 0, 0], [0, c, -s, 0], [0, s, c, 0], [0, 0, 0, 1]], dtype=np.float64)


def _ry(a):
    c, s = math.cos(a), math.sin(a)
    return np.array([[c, 0, s, 0], [0, 1, 0, 0], [-s, 0, c, 0], [0, 0, 0, 1]], dtype=np.float64)


def _rz(a):
    c, s = math.cos(a), math.sin(a)
    return np.array([[c, -s, 0, 0], [s, c, 0, 0], [0, 0, 1, 0], [0, 0, 0, 1]], dtype=np.float64)


def rot_xyz(deg):
    """JOML rotationXYZ / the RHS of rotateXYZ:  RX * RY * RZ."""
    ax, ay, az = (math.radians(d) for d in deg)
    return _rx(ax) @ _ry(ay) @ _rz(az)


def solid_matrix(translate, rotate):
    """boxMatrix.translation(center).rotateXYZ(rotation)  ->  T * RX*RY*RZ"""
    return mat_translation(translate) @ rot_xyz(rotate)


# ---------------------------------------------------------------------------
# TileGeometryUtils
# ---------------------------------------------------------------------------

TILE_W, TILE_H = 128, 256
TILE_SCALE = 2          # Core.tileScale


def calc_matrices_for_square():
    s = math.sqrt(2.0)
    proj = mat_ortho(-1.0 * s / 2.0, 1.0 * s / 2.0, -2.0 * s / 2.0, 2.0 * s / 2.0, -2.0, 2.0)
    proj = proj @ mat_translation(np.array([0.0, -2.0 * s * 0.375, 0.0]))
    mv = rot_xyz((30.0, 315.0, 0.0))
    return proj, mv


PROJ, MV = calc_matrices_for_square()
MVP = PROJ @ MV
INV_MVP = np.linalg.inv(MVP)


def _unproject_inv(inv, ndc_x, ndc_y, ndc_z):
    """JOML Matrix4f.unprojectInv (viewport already folded into ndc)."""
    x = inv[0, 0] * ndc_x + inv[0, 1] * ndc_y + inv[0, 2] * ndc_z + inv[0, 3]
    y = inv[1, 0] * ndc_x + inv[1, 1] * ndc_y + inv[1, 2] * ndc_z + inv[1, 3]
    z = inv[2, 0] * ndc_x + inv[2, 1] * ndc_y + inv[2, 2] * ndc_z + inv[2, 3]
    w = inv[3, 0] * ndc_x + inv[3, 1] * ndc_y + inv[3, 2] * ndc_z + inv[3, 3]
    invw = 1.0 / w
    return np.stack([x * invw, y * invw, z * invw], axis=-1)


# The shipped vanilla DEPTH_*.png sheets are byte-exact against this port only when
# the cell is sampled one whole pixel to the RIGHT of the texel centre in x
# (i.e. vanilla texel x holds the depth the math produces for tileX = x + 1.5).
# y needs no such correction. Verified against 200+ vanilla tilesets; see report.
X_SAMPLE_OFFSET = float(os.environ.get("PZ_X_SAMPLE_OFFSET", "1.0"))
Y_SAMPLE_OFFSET = 0.0


def make_pixel_rays():
    """Camera rays for the 128x256 texel centres. Returns (origins[H,W,3], direction[3])."""
    xs = (np.arange(TILE_W, dtype=np.float64) + 0.5 + X_SAMPLE_OFFSET)
    ys = (np.arange(TILE_H, dtype=np.float64) + 0.5 + Y_SAMPLE_OFFSET)
    gx, gy = np.meshgrid(xs, ys)                       # [H,W]
    tile_x = gx * (1.0 / (64.0 * TILE_SCALE))
    tile_y = gy * (2.0 / (128.0 * TILE_SCALE))
    ui_x = tile_x
    ui_y = 2.0 - tile_y
    # viewport = {0,0,1,2}
    ndc_x = ui_x / 1.0 * 2.0 - 1.0
    ndc_y = ui_y / 2.0 * 2.0 - 1.0
    start = _unproject_inv(INV_MVP, ndc_x, ndc_y, np.full_like(ndc_x, -1.0))
    end = _unproject_inv(INV_MVP, ndc_x, ndc_y, np.full_like(ndc_x, 1.0))
    d = end - start
    d = d / np.linalg.norm(d, axis=-1, keepdims=True)
    return start, d


RAY_ORIGIN, RAY_DIR = make_pixel_rays()


def _depth_of_scene_point(p):
    v = MVP @ np.array([p[0], p[1], p[2], 1.0])
    return v[2]


_DEPTH_NW = abs(_depth_of_scene_point((-0.5, 0.0, -0.5)))
_NORM_SCALE = (1.0 / _DEPTH_NW) * 0.25
_NORM_OFFSET = 0.75


def normalize_depth(depth):
    """TileGeometryUtils.getNormalizedDepth"""
    return depth * _NORM_SCALE + _NORM_OFFSET


def _scene_z(points):
    """z component of MVP * point (ortho, no perspective divide)."""
    return (MVP[2, 0] * points[..., 0] + MVP[2, 1] * points[..., 1]
            + MVP[2, 2] * points[..., 2] + MVP[2, 3])


def _xform_pos(m, p):
    return (p @ m[0:3, 0:3].T) + m[0:3, 3]


def _xform_dir(m, d):
    return d @ m[0:3, 0:3].T


def intersect_ray_aab(o, d, vmin, vmax):
    """TileGeometryUtils.intersectRayAab, vectorised. Returns (ok, tNear)."""
    with np.errstate(divide="ignore", invalid="ignore"):
        inv = 1.0 / d
        t_near = np.where(inv[..., 0] >= 0.0,
                          (vmin[0] - o[..., 0]) * inv[..., 0],
                          (vmax[0] - o[..., 0]) * inv[..., 0])
        t_far = np.where(inv[..., 0] >= 0.0,
                         (vmax[0] - o[..., 0]) * inv[..., 0],
                         (vmin[0] - o[..., 0]) * inv[..., 0])
        tymin = np.where(inv[..., 1] >= 0.0,
                         (vmin[1] - o[..., 1]) * inv[..., 1],
                         (vmax[1] - o[..., 1]) * inv[..., 1])
        tymax = np.where(inv[..., 1] >= 0.0,
                         (vmax[1] - o[..., 1]) * inv[..., 1],
                         (vmin[1] - o[..., 1]) * inv[..., 1])
        tzmin = np.where(inv[..., 2] >= 0.0,
                         (vmin[2] - o[..., 2]) * inv[..., 2],
                         (vmax[2] - o[..., 2]) * inv[..., 2])
        tzmax = np.where(inv[..., 2] >= 0.0,
                         (vmax[2] - o[..., 2]) * inv[..., 2],
                         (vmin[2] - o[..., 2]) * inv[..., 2])

        ok = ~((t_near > tymax) | (tymin > t_far))
        ok &= ~((t_near > tzmax) | (tzmin > t_far))

        # tNear = (!(tymin > tNear) && !isNaN(tNear)) ? tNear : tymin
        keep = (~(tymin > t_near)) & (~np.isnan(t_near))
        t_near = np.where(keep, t_near, tymin)
        keep = (~(tymax < t_far)) & (~np.isnan(t_far))
        t_far = np.where(keep, t_far, tymax)
        t_near = np.where(tzmin > t_near, tzmin, t_near)
        t_far = np.where(tzmax < t_far, tzmax, t_far)

        ok &= (t_near < t_far) & (t_far >= 0.0)
    return ok, t_near


def normalized_depth_box(box):
    """TileGeometryUtils.getNormalizedDepthOnBoxAt over the whole 128x256 cell."""
    m = solid_matrix(box.translate, box.rotate)
    minv = np.linalg.inv(m)
    o = _xform_pos(minv, RAY_ORIGIN)
    d = _xform_dir(minv, np.broadcast_to(RAY_DIR, o.shape))
    ok, t_near = intersect_ray_aab(o, d, box.min, box.max)
    hit = o + d * np.where(ok, t_near, 0.0)[..., None]
    scene = _xform_pos(m, hit)
    depth = _scene_z(scene)
    return np.where(ok, normalize_depth(depth), -1.0)


def intersect_cylinder(o, d, radius, height):
    """CylinderUtils.intersect, vectorised. Returns (ok, t)."""
    with np.errstate(divide="ignore", invalid="ignore"):
        a = d[..., 0] ** 2 + d[..., 1] ** 2
        b = 2.0 * (d[..., 0] * o[..., 0] + d[..., 1] * o[..., 1])
        c = o[..., 0] ** 2 + o[..., 1] ** 2 - radius ** 2
        disc = b * b - 4.0 * a * c
        sq = np.sqrt(np.where(disc >= 0.0, disc, 0.0))
        r1 = (-b + sq) / (2.0 * a)
        r2 = (-b - sq) / (2.0 * a)
        t1 = np.minimum(r1, r2)
        t2 = (height / 2.0 - o[..., 2]) / d[..., 2]
        t3 = (-height / 2.0 - o[..., 2]) / d[..., 2]

        cand = np.sort(np.stack([t1, t2, t3], axis=-1), axis=-1)   # NaNs sort last (as Java)
        found = np.zeros(t1.shape, dtype=bool)
        tsel = np.zeros(t1.shape, dtype=np.float64)
        for k in range(3):
            x = cand[..., k]
            loc = o + d * x[..., None]
            is_t1 = (x == t1)
            cond = np.where(is_t1,
                            np.abs(loc[..., 2]) < height / 2.0,
                            (loc[..., 0] ** 2 + loc[..., 1] ** 2 - radius ** 2) <= 0.0)
            take = cond & ~found
            tsel = np.where(take, x, tsel)
            found |= take

        ok = found & (disc >= 0.0)
    return ok, tsel


def normalized_depth_cylinder(cyl):
    """TileGeometryUtils.getNormalizedDepthOnCylinderAt over the whole 128x256 cell."""
    m = solid_matrix(cyl.translate, cyl.rotate)
    minv = np.linalg.inv(m)
    o = _xform_pos(minv, RAY_ORIGIN)
    d = _xform_dir(minv, np.broadcast_to(RAY_DIR, o.shape))
    ok, t = intersect_cylinder(o, d, cyl.radius1, cyl.height)
    hit = o + d * np.where(ok, t, 0.0)[..., None]
    scene = _xform_pos(m, hit)
    depth = _scene_z(scene)
    return np.where(ok, normalize_depth(depth), -1.0)


def normalized_depth(geom):
    if geom.kind == "box":
        return normalized_depth_box(geom)
    return normalized_depth_cylinder(geom)


# ---------------------------------------------------------------------------
# TileDepthTexture.recalculateDepth
# ---------------------------------------------------------------------------

def bake_tile(geoms):
    """Returns float[256,128], -1 where no geometry (TileDepthTexture 'no depth')."""
    pixels = np.full((TILE_H, TILE_W), 1000.0)
    for g in geoms:
        nd = normalized_depth(g)
        hit = nd >= 0.0
        pixels = np.where(hit, np.minimum(pixels, nd), pixels)
    return np.where(pixels != 1000.0, pixels, -1.0)


def load_whole_tile(path):
    """DEPTH_whole_tile.png -> float[256,128] (-1 = no coverage).

    This is TileDepthTextureManager's default depth texture: the depth a sprite
    gets today when it has no depth texture of its own (IsoSprite.setupTileDepth
    -> getDefaultDepthTexture). The in-game Tile Geometry editor also seeds a new
    cell with it (proven: the editor-written DEPTH_dwap_tiles_01.png cell 1x2 is
    byte-identical to DEPTH_whole_tile.png inside the sprite's alpha mask).
    """
    from PIL import Image
    a = np.array(Image.open(path).convert("LA"))
    # +0.5 LSB so encode_cell's floor(p*255) round-trips the original byte exactly.
    lum = (a[..., 0].astype(np.float64) + 0.5) / 255.0
    return np.where(a[..., 1] > 0, lum, -1.0)


def encode_cell(pixels):
    """TileDepthTexture.setBufferedImage: a=255,L=floor(min(p,1)*255) when p>=0 else a=0."""
    p = np.minimum(pixels, 1.0)
    lum = np.floor(p * 255.0).astype(np.int64) & 0xFF
    valid = pixels >= 0.0
    lum = np.where(valid, lum, 0).astype(np.uint8)
    alpha = np.where(valid, 255, 0).astype(np.uint8)
    return lum, alpha


# ---------------------------------------------------------------------------

def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--geometry", required=True)
    ap.add_argument("--tileset", required=True)
    ap.add_argument("--rows", type=int, default=None,
                    help="rows in the tilesheet (sheet height = rows*256); default = max row+1")
    ap.add_argument("--out", default=None)
    ap.add_argument("--dump-npy", default=None, help="write per-tile float arrays here")
    ap.add_argument("--tiles", default=None, help="comma list of COLxROW to restrict to")
    ap.add_argument("--sprite-sheet", default=None,
                    help="RGBA tilesheet (same 8xN cell layout). If given, the baked cell is "
                         "masked to the sprite's opaque pixels, exactly like vanilla depthmaps.")
    ap.add_argument("--whole-tile", default=None,
                    help="DEPTH_whole_tile.png; fills sprite pixels the geometry does not cover "
                         "(the engine default those pixels already use). Requires --sprite-sheet.")
    args = ap.parse_args()

    tiles = load_geometry(args.geometry, args.tileset)
    if not tiles:
        sys.exit("no geometry found for tileset %s" % args.tileset)
    if args.tiles:
        want = set()
        for s in args.tiles.split(","):
            c, r = s.split("x")
            want.add((int(c), int(r)))
        tiles = {k: v for k, v in tiles.items() if k in want}

    rows = args.rows or (max(r for _, r in tiles) + 1)
    cols = 8
    lum_sheet = np.zeros((rows * TILE_H, cols * TILE_W), dtype=np.uint8)
    a_sheet = np.zeros_like(lum_sheet)

    sprite = None
    if args.sprite_sheet:
        from PIL import Image
        sprite = np.array(Image.open(args.sprite_sheet).convert("RGBA"))
    whole = load_whole_tile(args.whole_tile) if args.whole_tile else None
    unfilled_total = 0

    for (col, row), geoms in sorted(tiles.items(), key=lambda kv: (kv[0][1], kv[0][0])):
        f = bake_tile(geoms)
        if sprite is not None:
            y0, x0 = row * TILE_H, col * TILE_W
            alpha = sprite[y0:y0 + TILE_H, x0:x0 + TILE_W, 3] > 0
            if whole is not None:
                f = np.where(f >= 0.0, f, whole)
            f = np.where(alpha, f, -1.0)
            unfilled_total += int((alpha & (f < 0.0)).sum())
        if args.dump_npy:
            os.makedirs(args.dump_npy, exist_ok=True)
            np.save(os.path.join(args.dump_npy, "%s_%dx%d.npy" % (args.tileset, col, row)), f)
        lum, alpha = encode_cell(f)
        y0, x0 = row * TILE_H, col * TILE_W
        lum_sheet[y0:y0 + TILE_H, x0:x0 + TILE_W] = lum
        a_sheet[y0:y0 + TILE_H, x0:x0 + TILE_W] = alpha
        print("baked %s %dx%d (index %d): %d/%d covered"
              % (args.tileset, col, row, col + row * 8, int((alpha > 0).sum()), TILE_W * TILE_H))

    if unfilled_total:
        print("WARNING: %d opaque sprite pixels have no depth and will be discarded by the shader"
              % unfilled_total)

    if args.out:
        from PIL import Image
        img = Image.merge("LA", (Image.fromarray(lum_sheet, "L"), Image.fromarray(a_sheet, "L")))
        os.makedirs(os.path.dirname(os.path.abspath(args.out)), exist_ok=True)
        img.save(args.out)
        print("wrote %s (%dx%d, LA)" % (args.out, cols * TILE_W, rows * TILE_H))


if __name__ == "__main__":
    main()
