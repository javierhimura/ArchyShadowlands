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
	ClearWaypoint = function(self)
        -- Only clear user map point if it was created by Archy
        local currentuiMapPoint = C_Map.GetUserWaypoint()
        if currentuiMapPoint then
            C_Map.ClearUserWaypoint()
            self.uiMapPoint = nil
        end
	end,
	Refresh = function(self, digsite)
		if not digsite or digsite == self.currentDigsite or not self.isActive or not private.ProfileSettings.general.show then
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