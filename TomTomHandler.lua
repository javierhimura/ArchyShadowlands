-- ----------------------------------------------------------------------------
-- AddOn namespace.
-- ----------------------------------------------------------------------------
local FOLDER_NAME, private = ...

local LibStub = _G.LibStub
local Dialog = LibStub("LibDialog-1.0")

-- ----------------------------------------------------------------------------
-- Handler.
-- ----------------------------------------------------------------------------
local TomTomHandler = {
	-- ----------------------------------------------------------------------------
	-- Data.
	-- ----------------------------------------------------------------------------
	currentDigsite = nil,
	hasDisplayedConflictError = false,
	hasPOIIntegration = false,
	hasTomTom = false,
	isActive = false,
	waypoint = nil,
	-- ----------------------------------------------------------------------------
	-- Methods.
	-- ----------------------------------------------------------------------------
	CheckForConflict = function(self)
		if not self.hasDisplayedConflictError and private.ProfileSettings.tomtom.enabled and self.hasPOIIntegration and _G.TomTom.profile.poi.setClosest then
			self.hasDisplayedConflictError = true
			Dialog:Spawn("ArchyTomTomError")
		end
	end,
	ClearWaypoint = function(self)
		if self.waypoint then
			_G.TomTom:RemoveWaypoint(self.waypoint)
			self.waypoint = nil
			self.currentDigsite = nil
		end
	end,
	Refresh = function(self, digsite)
		self:ClearWaypoint()

		if not digsite or digsite == self.currentDigsite or not self.hasTomTom or not self.isActive or not private.ProfileSettings.tomtom.enabled or not private.ProfileSettings.general.show then
			return
		end

		self.currentDigsite = digsite
		self.waypoint = _G.TomTom:AddMFWaypoint(digsite.mapID, nil, digsite.coordX, digsite.coordY, {
			crazy = private.ProfileSettings.tomtom.crazyArrowEnabled,
			title = ("%s %s\n%s"):format(digsite.name, _G.PARENS_TEMPLATE:format(digsite.race.name), digsite.zoneName),
		})
	end
}

private.TomTomHandler = TomTomHandler

Dialog:Register("ArchyTomTomError", {
	text = "",
	on_show = function(self, data)
		self.text:SetFormattedText("An incompatible TomTom setting was detected.\n\nThe \"%s%s|r\" setting will cause %s to lose control of TomTom when approaching quest POIs.\n\nDo you want to reset it?",
			"|cFFFFCC00", _G.TomTomLocals and _G.TomTomLocals["Enable automatic quest objective waypoints"] or "", FOLDER_NAME)
	end,
	buttons = {
		{
			text = _G.YES,
			on_click = function(self, data)
				_G.TomTom.profile.poi.setClosest = false
				_G.TomTom:EnableDisablePOIIntegration()
			end,
		},
		{
			text = _G.NO,
		},
	},
	hide_on_escape = true,
	show_while_dead = true,
	width = 450,
})
