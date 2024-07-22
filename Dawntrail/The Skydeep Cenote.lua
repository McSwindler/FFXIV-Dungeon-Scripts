--[[
    The Skydeep Cenote Dungeon Waypoints
    v1.1

    The teleporter for the final boss can sometimes mess up with the pathing. 
    Occasionally you might run off the boss platform, 
    or miss the teleporter and just run into the walls.
]]

local zoneId = 1194
local waypoints = {
    {x = 35, y = -35, z = -1}, -- obstacle
    {x = -105, y = -53, z = -81}, -- obstacle
    {x = -105, y = -52, z = -169, checkpoint = true}, -- 1st boss chest
    {x = -165, y = -202, z = -209}, -- drop
    {x = -216, y = -210, z = -50}, -- chest
    {x = -78, y = -210, z = -92}, -- chest
    {x = -85, y = -210, z = -155}, -- 2nd boss
    {x = -70, y = -210, z = -155, checkpoint = true}, -- 2nd boss chest
    {x = 110, y = -190, z = -214}, -- chest
    {x = 100, y = -190, z = -231}, -- teleport
    {x = 137, y = -185, z = -335}, -- chest
    {x = 100, y = -195, z = -364}, -- teleport
    {x = 100, y = -192, z = -434}, -- 3rd boss
    {x = 100, y = -192, z = -437, checkpoint = true}, -- 3rd boss chest
}

DungeonRunner = require("DungeonRunner")

DungeonRunner.ExecuteDungeon(zoneId, waypoints)