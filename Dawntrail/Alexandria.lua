--[[
    Alexandria Dungeon Waypoints
    v1.1
]]

local zoneId = 1199
local waypoints = {
    {x = -116, y = 506, z = -20}, -- 1st boss room
    {x = 852, y = 46, z = 816}, -- 1st boss
    {x = 852, y = 46, z = 815, checkpoint = true}, -- 1st boss chest
    {x = 808, y = 36, z = 724}, -- chest
    {x = 745, y = 65, z = 618}, -- chest
    {x = 745, y = 65, z = 609}, -- 2nd boss room
    {x = -533, y = -466, z = -383}, -- 2nd boss
    {x = -533, y = -466, z = -388, checkpoint = true}, -- 2nd boss chest
    {x = -584, y = -464, z = -510}, -- chest
    {x = -733, y = -474, z = -565}, -- chest
    {x = -759, y = -474, z = -656}, -- 3rd boss
    {x = -759, y = -474, z = -659, checkpoint = true}, -- 3rd boss chest
}

DungeonRunner = require("DungeonRunner")

DungeonRunner.ExecuteDungeon(zoneId, waypoints)