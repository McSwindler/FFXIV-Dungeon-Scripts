--[[
    The Skydeep Cenote Dungeon Waypoints
    v1.0
]]

local zoneId = 1194
local waypoints = {
 {x = 35, y = -35, z = -1}, -- obstacle
 {x = -105, y = -53, z = -81}, -- obstacle
-- {x = -105, y = -52, z = -164}, -- 1st boss
 {x = -105, y = -52, z = -169, checkpoint = true}, -- 1st boss chest
 {x = -165, y = -202, z = -209}, -- drop
 {x = -216, y = -210, z = -50}, -- chest
 {x = -78, y = -210, z = -92, wait = 5}, -- chest
 {x = -85, y = -210, z = -155, wait = 10}, -- 2nd boss
 {x = -70, y = -210, z = -155, checkpoint = true}, -- 2nd boss chest
 {x = 110, y = -190, z = -214}, -- chest
 {x = 100, y = -190, z = -231}, -- teleport
 {x = 137, y = -185, z = -335}, -- chest
-- {x = 100, y = -195, z = -364}, -- teleport
 {x = 100, y = -192, z = -434}, -- 3rd boss
 {x = 100, y = -192, z = -437, checkpoint = true}, -- 3rd boss chest
}

DungeonRunner = require("DungeonRunner")

DungeonRunner.ExecuteDungeon(zoneId, waypoints)