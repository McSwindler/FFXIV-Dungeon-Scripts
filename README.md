# FFXIV-Dungeon-Scripts

Lua scripts to work with SomethingNeedDoing to run dungeons with Trust NPCs automatically

Loosely based off of [Burnz' dungeon script](<https://github.com/Jaksuhn/SomethingNeedDoing/blob/master/Community%20Scripts/Dungeons/DutySupport_(41)_Stone%20Vigil_Burnz.lua>). This one aims to keep all the logic in a single lua script and each dungeon can be an individual script that only houses the waypoints.

A lot of the heavy lifting is done by additional plugins: BossMod, Rotation Solver, and vnavmesh. All of which are required.

It's a relatively simple script that basically moves you to a waypoint. It will wait for combat to complete before continuing movement. Chest waypoints are provided so you can loot all the things (if you enable Pandora's Box).

Pathing is handled by vnavmesh, Combat is handled by Rotation Solver, and BossMod AI keeps you alive. Plugins are toggled on automatically when running a dungeon script. BossMod AI and Rotation Solver are disabled automatically when the dungeon is finished.

## Setup

### [Something Need Doing](https://github.com/Jaksuhn/SomethingNeedDoing)

Repo: `https://puni.sh/api/repository/croizat`

**Main Script Setup**

1. Create a new macro called `DungeonRunner` (it must be exactly this).
1. Copy the entirety of [DungeonRunner.lua](DungeonRunner.lua) into this macro.
1. Ensure the "Lua script" button is pressed and activated.
1. Do NOT execute this macro by itself, it will not do anything. Continue on with individual dungeon setup.

**Dungeon Setup**

1. Create a new macro. Can be named anything as long as it's unique.
1. Copy the entirety of the dungeon's lua script into this macro.
1. Ensure the "Lua script" button is pressed and activated.
1. Execute this macro inside the given dungeon.

### [BossMod Reborn](https://github.com/FFXIV-CombatReborn/BossmodReborn)

Repo: `https://raw.githubusercontent.com/FFXIV-CombatReborn/CombatRebornRepo/main/pluginmaster.json`

**AI Setup**

- AI Settings
  - Enable "Follow during combat"
  - Enable "Follow during active boss module"
  - Enable "Follow target"

### [Rotation Solver Reborn](https://github.com/FFXIV-CombatReborn/RotationSolverReborn)

Repo: `https://raw.githubusercontent.com/FFXIV-CombatReborn/CombatRebornRepo/main/pluginmaster.json`

**Recommended**

- Target
  - Engage settings
    - All targets that are in range for any abilities

### [vnavmesh](https://github.com/awgil/ffxiv_navmesh/tree/master)

Repo: `https://puni.sh/api/repository/veyn`

### [Pandora's Box](https://github.com/PunishXIV/PandorasBox) (Optional)

Repo: `https://love.puni.sh/ment.json`

- Targets
  - Enable Automatically Open Chests

## Creating your own Dungeon Script

First you need the zoneId of the dungeon and second you need to create the table of waypoints.

I use a simple Lua macro to provide these details:

```Lua
yield("/echo ZoneID: " .. GetZoneID())
yield("/echo Target: {x = " .. string.format("%.0f", GetTargetRawXPos()) .. ", y = " .. string.format("%.0f", GetTargetRawYPos()) .. ", z = " .. string.format("%.0f", GetTargetRawZPos()) .. "},")
yield("/echo Player: {x = " .. string.format("%.0f", GetPlayerRawXPos()) .. ", y = " .. string.format("%.0f", GetPlayerRawYPos()) .. ", z = " .. string.format("%.0f", GetPlayerRawZPos()) .. "},")
```

This will output into chat the current zoneId, the coordinates of your target, and the coordinates of your character. It also outputs in the table format expected by the DungeonRunner script.

Set these to variables and then include and run the main script:

```Lua
local zoneId = 1193
local waypoints = {
 {x = -108, y = 11, z = 110}, -- 1st boss
 ...
 {x = -54, y = 378, z = -213}, -- 3rd boss chest
}

DungeonRunner = require("DungeonRunner")

DungeonRunner.ExecuteDungeon(zoneId, waypoints)
```

If there is something that requires interaction to proceed, you can include the `interact` key in the waypoint table. The value being the exact name of the thing to interact with.

`{x = -170, y = -504, z = 16, interact = "Elevator Console"},`

If there is a timing issue where you need to wait for some cinematic or other event before proceeding, you can include the `wait` key in the waypoint table. The value being the amount of time (in seconds) to wait.

`{x = -69, y = -194, z = -30, wait = 30},`

**Not implemented yet** If there is a waypoint that is considered a checkpoint in the dungeon, such that you can use the 'Shortcut' at the start to return to its position, you can include the `checkpoint` key set to true.

`{x = -0, y = 7, z = -120, checkpoint = true},`

The number of waypoints should be minimal: chests, bosses, and special transitional triggers or interactions. In the simplest dungeon, you could only have 1 waypoint being the final boss, but often times you need extra waypoints to go through area transitions and other obstacles.

### Debugging

If you are in the middle of a dungeon and want to test from a certain waypoint, you can set the `currentWaypointIndex` to the index of the waypoint you want to start from before running the macro. This line should be placed after the `require` but before the `ExecuteDungeon`.

```Lua
DungeonRunner = require("DungeonRunner")
DungeonRunner.currentWaypointIndex = 5 -- run from the 5th waypoint
DungeonRunner.ExecuteDungeon(zoneId, waypoints)
```

### TODO

- Make death recovery better, utilize the shortcut and checkpoints when available.
- Loop the dungeon?
