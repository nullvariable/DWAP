TODO
    * Ekron farm - x99,y8934,z0
        * has well, would be interesting to add a basement with a big generator
    * Echo creek gas station has a water tank in the basement, could add generator✔
    * Rosewood gas station basement✔
    * Maybe mad dan's?
    * Brandenberg mansion 1293,7408
        * big house to extend generator coverage
        * add a water tank
        * could be a basement addon
    * ekron farmhouse with basement
        * water tank in basement, lake next to house
        * easy to add generator
        * x1907,y9956
    * scrap yard between echo and irvington
        * 2953,12559
        * has two generators, spring water next doorsss
    * paddle boat has two generators and water tanks and a pump
    * school basement in ekron has gen and wt, would be cool to add a "secret" shelter" inside
        * 744, 9841, -1


* Add Ekron Community College basement+config
* W Lville Pawn Shop 12321, 1326, 0
    * Add Basement under back stairs
* For lease auto shop center Lville 13147, 3024, 0
    * Add Basement in backroom
* E Lville farm house 14580, 3039, 0
    * Add Basement under stairs

Rosewood, elem school basement
Rosewood, bank basement area

ekron industrial basement 575 9379
## 42.20 update — deferred work (audited 2026-07-30)

### Deferred modernizations (do after 42.20 compat release is verified)
* `DWAPPowerSystem_server.lua` `getSquarePowerDrain` (~568-657): replace the hard-coded per-appliance
  drain table ("mirrors IsoGenerator as of 42.10") with the new 42.20 per-object API:
  `obj:couldBePoweredByGenerator()` + `obj:getGeneratorPowerConsumption()`. Tracks future vanilla
  drain changes automatically. Keep `getPoweredItemName` for the UI list.
* Same file, `powerScan` z-range math: use new `IsoGenerator.getMinAffectedLevel()`/`getMaxAffectedLevel()`
  where a generator instance is in hand.
* Optional cleanup: drop inert `entityscript=DWAP/dwap_entities` line from mod.info (module is empty);
  remove dead `[201]` sentinel entry in `StashDescriptions/DWAPStashDesc.lua`.
* Legacy (pre-v17) save support was removed for 42.20 (42.20 map update broke old saves anyway).
  The `getSaveVersion() < 17` guards left in the server systems / client objects / SolarSupport /
  ISAPatches are intentional safeties that simply deactivate the mod on an impossibly-old save.

### Known multiplayer issues (SP unaffected; fix before any MP release)
* `DWAPAddFuel.lua:7`, `DWAPFixGenerator.lua`, `DWAPSiphonFuel.lua`: `require "DWAP/DWAPPowerSystem_client"`
  is a wrong path (file is at `lua/client/DWAPPowerSystem_client.lua`) and the code then uses the global
  `DWAPPowerSystem`, which only the *server* file defines. Works in SP by accident; errors on an MP client.
* `server/DWAP/LootSpawning/Events.lua` (`checkHasRoom`): `container:hasRoomFor(getPlayer(), 1)` —
  `getPlayer()` is nil on a dedicated server.
* 42.20 gates `OnFillWorldObjectContextMenu` on MP safehouse permissions (`fetch.safehouseAllowInteract`),
  so DWAP context menus won't fire on protected squares in MP.
* Client-side world mutation (`Props.lua`, `BaseKeys.lua`, `PreventStories.lua`) runs per-client in MP.
  `DWAPUtils.lua` world-seed rewrite via `WorldGenParams` runs on whichever side loads it.
* ISA integration nits: dead `wrappedUpdatePowerbanks` code in `ISAPatches.lua`; `Powerbank` vs `PowerBank`
  require-path case inconsistency; `ISAUIMenuPatch.lua` checks `contains("ISA")` without the leading `\`.
