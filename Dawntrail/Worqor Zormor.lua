--[[
    Worqor Zormor Dungeon Waypoints
    v1.0
]]

local zoneId = 1193
local waypoints = {
 {x = -108, y = 11, z = 110}, -- 1st boss
 {x = -108, y = 11, z = 103, wait = 1}, -- 1st boss chest
 {x = -60, y = 40, z = 52, wait = 5}, -- teleport
 {x = -34, y = 55, z = 21}, -- Zoraal
 {x = -50, y = 55, z = 16, wait = 5}, -- teleport
 {x = -95, y = 70, z = 48, wait = 1}, -- chest
 {x = -106, y = 70, z = 43, wait = 5}, -- teleport
 {x = -161, y = 80, z = 34, wait = 1}, -- chest
 {x = -57, y = 105, z = -22, wait = 10}, -- teleport
 {x = -53, y = 322, z = -64}, -- 2nd boss
 {x = -69, y = 323, z = -57, wait = 1}, -- 2nd boss chest
 {x = -153, y = 335, z = 1}, -- chest
-- {x = -109, y = 344, z = -50}, -- adds
-- {x = -83, y = 358, z = -107}, -- adds
 {x = -69, y = 358, z = -92, wait = 1}, -- chest
 {x = -54, y = 378, z = -205}, -- 3rd boss
 {x = -54, y = 378, z = -213, wait = 1}, -- 3rd boss chest
}

DungeonRunner = require("DungeonRunner")

DungeonRunner.ExecuteDungeon(zoneId, waypoints)