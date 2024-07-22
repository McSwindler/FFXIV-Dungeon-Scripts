--[[
    Origenics Dungeon Waypoints
    v1.1
]]

local zoneId = 1208
local waypoints = {
    {x = 30, y = 302, z = 140}, -- floor transition
    {x = -170, y = -504, z = 16, wait = 1, interact = "Elevator Console"},
    {x = -100, y = -500, z = 148}, -- 1st boss (floor transition)
    {x = -75, y = -120, z = -180, checkpoint = true}, -- 1st boss chest
    {x = 44, y = -120, z = -130}, -- chest
    {x = 85, y = -120, z = -110}, -- teleport
    {x = -187, y = -94, z = -86}, -- chest
    {x = -172, y = -94, z = -152}, -- 2nd boss
    {x = -172, y = -94, z = -160, checkpoint = true}, -- 2nd boss chest
    {x = -172, y = -90, z = -231}, -- teleport
    {x = 103, y = -0, z = 221}, -- chest
    {x = 157, y = -0, z = 180}, -- chest
    {x = 190, y = -0, z = -10}, -- 3rd boss
    {x = 190, y = -0, z = -12, checkpoint = true}, -- 3rd boss chest
}

DungeonRunner = require("DungeonRunner")
DungeonRunner.currentWaypointIndex = 2
DungeonRunner.ExecuteDungeon(zoneId, waypoints)