-- ----------------------------------------------------------------------------
-- AddOn namespace.
-- ----------------------------------------------------------------------------
local FOLDER_NAME, private = ...

local LibStub = _G.LibStub
local Dialog = LibStub("LibDialog-1.0")

-- ----------------------------------------------------------------------------
-- Handler.
-- ----------------------------------------------------------------------------
local WaypoingHandler = {
	-- ----------------------------------------------------------------------------
	-- Data.
	-- ----------------------------------------------------------------------------
	currentDigsite = nil,
	isActive = false,
	-- ----------------------------------------------------------------------------
	-- Methods.
	-- ----------------------------------------------------------------------------
	ClearWaypoint = function(self, force)
        if not private.ProfileSettings.general.show or not private.ProfileSettings.digsite.announceNearest then
            return false
        end
        if not force and not private.ProfileSettings.digsite.waypointNearest then
            return false
        end
        
        local currentuiMapPoint = C_Map.GetUserWaypoint()
        if not currentuiMapPoint then
            return true
        end
        
        local continent_digsites = private.continent_digsites
        local MAP_CONTINENTS = private.MAP_CONTINENTS
        for continentID, continentData in pairs(MAP_CONTINENTS) do
            for _, digsite in pairs(continent_digsites[continentID]) do
                if digsite.UIMapID == currentuiMapPoint.uiMapID and digsite.coordX == currentuiMapPoint.position.x and digsite.coordY == currentuiMapPoint.position.y then
                    C_Map.ClearUserWaypoint()
                    self.uiMapPoint = nil
                    return true
                end
            end
        end

        return false
	end,
	Refresh = function(self, digsite, force)
        if force then
            self.currentDigsite = nil
        end
		if not digsite or digsite == self.currentDigsite or not self.isActive or not private.ProfileSettings.general.show or not private.ProfileSettings.digsite.announceNearest or not private.ProfileSettings.digsite.waypointNearest then
			return
		end
        
        if not self:ClearWaypoint() then
            return
        end

        if C_Map.CanSetUserWaypointOnMap(digsite.UIMapID) then
            currentuiMapPoint = UiMapPoint.CreateFromCoordinates(digsite.UIMapID, digsite.coordX, digsite.coordY)
            if currentuiMapPoint ~= nil then
                self.currentDigsite = digsite
                C_Map.SetUserWaypoint(currentuiMapPoint)
                C_SuperTrack.SetSuperTrackedUserWaypoint(true)
            end
        end
	end
}

private.WaypoingHandler = WaypoingHandler