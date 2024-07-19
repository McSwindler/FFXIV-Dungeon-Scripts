--[[
    Ihuykatumu Dungeon Waypoints
    v1.0
]]

local zoneId = 1167
local waypoints = {
 {x = -69, y = -194, z = -30, wait = 30}, -- boat adds
 {x = -55, y = -202, z = -31}, --get off the boat
 {x = 35, y = -203, z = -105}, -- 1st boss
 {x = 35, y = -203, z = -113}, -- 1st boss chest
-- {x = 139, y = -203, z = -110}, -- adds
 {x = 150, y = -195, z = -20}, -- chest
 {x = 157, y = -195, z = -24}, -- ladder
-- {x = 203, y = -159, z = 116}, -- chest + slime adds
 {x = 126, y = -153, z = 112}, -- ladder
 {x = 80, y = -134, z = 43}, -- 2nd boss
 {x = 67, y = -134, z = 41}, -- 2nd boss chest
 {x = 36, y = -134, z = 36, wait = 10}, -- ladder
-- {x = -21, y = -113, z = 98}, -- adds
 {x = 11, y = -111, z = 149}, -- chest
-- {x = -7, y = -112, z = 178}, -- adds
-- {x = -42, y = -111, z = 293}, -- adds
 {x = -97, y = -115, z = 337}, -- adds + chest
 {x = -107, y = -118, z = 255}, -- 3rd boss
 {x = -107, y = -118, z = 253}, -- 3rd boss chest
}

DungeonRunner = require("DungeonRunner")

DungeonRunner.ExecuteDungeon(zoneId, waypoints)
