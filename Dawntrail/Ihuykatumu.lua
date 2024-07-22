--[[
    Ihuykatumu Dungeon Waypoints
    v1.1

    This one is janky with the boat and ladders, 
    but hopefully works most of the time.
]]

local zoneId = 1167
local waypoints = {
    {x = -69, y = -194, z = -30, wait = 30}, -- boat adds
    {x = -54, y = -203, z = -31}, --get off the boat
    {x = 35, y = -203, z = -105}, -- 1st boss
    {x = 35, y = -203, z = -113, checkpoint = true}, -- 1st boss chest
    {x = 150, y = -195, z = -20}, -- chest
    {x = 157, y = -195, z = -24}, -- ladder
    {x = 203, y = -159, z = 117}, -- chest
    {x = 126, y = -153, z = 112}, -- ladder
    {x = 80, y = -134, z = 43}, -- 2nd boss
    {x = 67, y = -134, z = 41, checkpoint = true}, -- 2nd boss chest
    {x = 35, y = -131, z = 37}, -- ladder
    {x = 11, y = -111, z = 149}, -- chest
    {x = -97, y = -115, z = 337}, -- chest
    {x = -107, y = -118, z = 255}, -- 3rd boss
    {x = -107, y = -118, z = 253, checkpoint = true}, -- 3rd boss chest
}

DungeonRunner = require("DungeonRunner")

DungeonRunner.ExecuteDungeon(zoneId, waypoints)
