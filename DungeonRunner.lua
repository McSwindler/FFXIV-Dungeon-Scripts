--[[
  Fully working Script for Auto Dungeons (tested with Trust NPCs)

  Requires: 
    - BossMod Reborn
    - Rotation Solver Reborn
    - vnavmesh
    - Pandora's Box (for opening chests)

  Repo: https://raw.githubusercontent.com/FFXIV-CombatReborn/CombatRebornRepo/main/pluginmaster.json
    BossMod Reborn
      AI Settings:
        - Follow during combat
        - Follow during active boss module
        - Follow target

    Rotation Solver Reborn
      Recommended: (assuming doing this with Trust NPCs)
        Target -> Engage settings -> All targets that are in range for any abilities

  Repo: https://puni.sh/api/repository/veyn
    vnavmesh

  Repo: https://love.puni.sh/ment.json
    Pandora's Box
      Targets -> Automatically Open Chests
]]

local DungeonRunner = {
    currentWaypointIndex = 1,
    currentCheckpointIndex = 1
}

function DungeonRunner.CheckDeath()
    if IsPlayerDead() then
    LogInfo("[DungeonRunner] Death Detected, resetting")
        PathStop()
        yield("/wait 5")
        DungeonRunner.currentWaypointIndex = 1

        DungeonRunner.Startup()
        -- TODO: use shortcut if available
    end
end

function DungeonRunner.Startup()
    -- enable rotation solver
    yield("/rsr auto") 
    -- enable boss mod AI
    yield("/bmrai on") 

    -- enable pathing movement
    if not PathGetMovementAllowed() then
        PathSetMovementAllowed(true)
    end
end

function DungeonRunner.Shutdown()
    PathStop()
    yield("/rsr off")
    yield("/bmrai off")
    yield("/pcraft stop")
end

function DungeonRunner.MeshCheck()
    if not NavIsReady() then
        NavRebuild()
        while not NavIsReady() do
            LogDebug("[DungeonRunner]Building navmesh, currently at " .. string.format("%.1f", NavBuildProgress() * 100) .. "%")
            yield("/wait 1")
            if NavIsReady() then
                LogDebug("[DungeonRunner]Navmesh ready!")
            end
        end
    end
end

function DungeonRunner.ExecuteDungeon(zoneId, waypoints)
    DungeonRunner.Startup()

    local hasPathed = false
    local i = 0
    while DungeonRunner.currentWaypointIndex <= #waypoints do
        if not IsInZone(zoneId) then
            yield("/echo Not in Zone, stopping")
            DungeonRunner.Shutdown()
        end
        
        DungeonRunner.MeshCheck()
        if IsLocalPlayerNull() then
            PathStop()
        end
        DungeonRunner.CheckDeath()

        local waypoint = waypoints[DungeonRunner.currentWaypointIndex]

        --hack to allow exiting script at any point
        yield("/wait 0.1")
        
--[[
        LogDebug("[DungeonRunner] Current Waypoint: " .. tostring(waypoint.x) .. "," .. tostring(waypoint.y) .. "," .. tostring(waypoint.z) .. 
            " Combat: " .. tostring(GetCharacterCondition(26)) .. 
            " Occupied: " .. tostring(IsPlayerOccupied()) .. 
            " HasPathed: " .. tostring(hasPathed) ..
            " PathfindInProgress: " .. tostring(PathfindInProgress()) ..
            " PathIsRunning: " .. tostring(PathIsRunning()))
]]

        -- Check for combat condition
        if GetCharacterCondition(26) then
            -- stop navigating in combat, let bossmod take over
            if PathIsRunning() then
                PathStop()
                hasPathed = false
            end

            if not HasTarget() then
                TargetClosestEnemy()
            end
        else
            -- Waypoint navigation
            
            local distanceToWaypoint = GetDistanceToPoint(waypoint.x, waypoint.y, waypoint.z)
            if distanceToWaypoint <= 1.5 then
                if waypoint.wait then
                    yield("/wait " .. waypoint.wait)
                end
                if waypoint.checkpoint then
                    DungeonRunner.currentCheckpointIndex = DungeonRunner.currentWaypointIndex
                end
                if waypoint.interact then
                    yield("/target " .. waypoint.interact)
                    yield("/wait 0.1")
                    yield("/interact")
                end
            end
            if not IsPlayerOccupied() then
                -- if the path finished, and we're not busy, assume we can move to the next waypoint
                if hasPathed and not PathfindInProgress() and not PathIsRunning() and not GetCharacterCondition(26) then
                    LogInfo("[DungeonRunner] Continuing to next waypoint " .. tostring(DungeonRunner.currentWaypointIndex + 1))
                    DungeonRunner.currentWaypointIndex = DungeonRunner.currentWaypointIndex + 1
                    hasPathed = false
                elseif i % 10 == 0 then
                    LogDebug("[DungeonRunner] Moving to " .. tostring(waypoint.x) .. "," .. tostring(waypoint.y) .. "," .. tostring(waypoint.z))
                    PathfindAndMoveTo(waypoint.x, waypoint.y, waypoint.z)
                    hasPathed = true
                end
            end
            
            
        end
        i = i + 1

    end


    DungeonRunner.Shutdown()

end

return DungeonRunner
