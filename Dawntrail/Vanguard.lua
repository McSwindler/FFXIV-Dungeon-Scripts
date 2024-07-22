--[[
    Vanguard Dungeon Waypoints
    v1.0
]]

local zoneId = 1198
local waypoints = {
    {x = -100, y = 7, z = 195}, -- 1st boss
    {x = -100, y = 7, z = 191, checkpoint = true}, -- 1st boss chest
    {x = -41, y = 7, z = 94}, -- chest
    {x = 6, y = 7, z = -46}, -- chest
    {x = 0, y = 7, z = -110}, -- 2nd boss
    {x = -0, y = 7, z = -120, checkpoint = true}, -- 2nd boss chest
    {x = 19, y = 7, z = -327}, -- chest
    {x = 99, y = 7, z = -348}, -- chest
    {x = 90, y = 12, z = -440}, -- 3rd boss
    {x = 90, y = 12, z = -439, checkpoint = true}, -- 3rd boss chest
}

DungeonRunner = require("DungeonRunner")

DungeonRunner.ExecuteDungeon(zoneId, waypoints)