-- ----------------------------------------------------------------------------
-- Upvalued Lua API.
-- ----------------------------------------------------------------------------
-- Libraries
local math = _G.math
local table = _G.table

-- Functions
local pairs = _G.pairs

-- ----------------------------------------------------------------------------
-- AddOn namespace.
-- ----------------------------------------------------------------------------
local FOLDER_NAME, private = ...

local LibStub = _G.LibStub
local Archy = LibStub("AceAddon-3.0"):GetAddon("Archy")

local HereBeDragons = LibStub("HereBeDragons-1.0")
local HereBeDragonsPins = LibStub("HereBeDragons-Pins-1.0")

local L = LibStub("AceLocale-3.0"):GetLocale("Archy", false)

local Digsites = {}
private.Digsites = Digsites

-- ----------------------------------------------------------------------------
-- Local constants.
-- ----------------------------------------------------------------------------
local Digsite = {}
local digsiteMetatable = {
	__index = Digsite
}

-- ----------------------------------------------------------------------------
-- Scripts.
-- ----------------------------------------------------------------------------
local function MapIcon_OnEnter(self)
	if not self.tooltip then
		return
	end
	_G.GameTooltip:SetOwner(self, "ANCHOR_BOTTOMLEFT")
	_G.GameTooltip:SetText(self.tooltip, _G.NORMAL_FONT_COLOR[1], _G.NORMAL_FONT_COLOR[2], _G.NORMAL_FONT_COLOR[3], 1)
end

local function MapIcon_OnLeave(self)
	_G.GameTooltip:Hide()
end

local MapIcon_OnUpdate
do
	local POI_UPDATE_THRESHOLD = 0.1
	local RAD_135 = math.rad(135)
	local SQUARE_HALF = math.sqrt(0.5)

	function MapIcon_OnUpdate(self, elapsed)
		self.onUpdateElapsedTime = self.onUpdateElapsedTime + elapsed

		if self.onUpdateElapsedTime < POI_UPDATE_THRESHOLD then
			return
		end
		self.onUpdateElapsedTime = 0

		if _G.IsInInstance() then
			self:Hide()
			return
		end

		local isOnEdge = HereBeDragonsPins:IsMinimapIconOnEdge(self)

		if self.arrow then
			if isOnEdge then
				local angle = HereBeDragonsPins:GetVectorToIcon(self)
				if not angle then
					self:Hide()
					return
				end
				angle = angle + RAD_135

				self.icon:Hide()
				self.arrow:Show()

				-- Rotate the icon, as required
				if _G.GetCVar("rotateMinimap") == "1" then
					angle = angle - _G.GetPlayerFacing()
				end

				local sin, cos = math.sin(angle) * SQUARE_HALF, math.cos(angle) * SQUARE_HALF
				self.arrow:SetTexCoord(0.5 - sin, 0.5 + cos, 0.5 + cos, 0.5 + sin, 0.5 - cos, 0.5 - sin, 0.5 + sin, 0.5 - cos)
			else
				self.icon:Show()
				self.arrow:Hide()
			end
		elseif isOnEdge then
			self:Hide()
			self.icon:Hide()
		else
			self.icon:Show()
		end
	end
end


-- ----------------------------------------------------------------------------
-- Helpers.
-- ----------------------------------------------------------------------------
local function CreateSurveyNode(digsite, savedNode, nodeIndex)
	local node = _G.CreateFrame("Frame", ("ArchyMinimap_Digsite%sSurveyNode%d"):format(digsite.blobID, nodeIndex), _G.Minimap)
	node:SetSize(8, 8)
	node:Hide()
	node:SetScript("OnEnter", MapIcon_OnEnter)
	node:SetScript("OnLeave", MapIcon_OnLeave)
	node:SetScript("OnUpdate", MapIcon_OnUpdate)

	node.onUpdateElapsedTime = 0
	node.savedData = savedNode
	node.savedIndex = nodeIndex
	node.tooltip = ("%s #%d\n%s\n%s"):format(L["Survey"], nodeIndex, digsite.name, _G.PARENS_TEMPLATE:format(digsite.zoneName))

	local icon = node:CreateTexture("BACKGROUND")
	icon:SetTexture([[Interface\AddOns\Archy\Media\Nodes]])

	-- TODO: Update this when the config option changes.
	if private.ProfileSettings.minimap.fragmentIcon == "Cross" then
		icon:SetTexCoord(0, 0.46875, 0, 0.453125)
	else
		icon:SetTexCoord(0, 0.234375, 0.5, 0.734375)
	end
	icon:SetPoint("CENTER", 0, 0)
	icon:SetSize(8, 8)

	node.icon = icon

	return node
end

local function MapIconFrameGetDistance(self)
	local angle, distance = HereBeDragonsPins:GetVectorToIcon(self)
	return distance
end

function private.AddDigsite(digsiteTemplate, landmarkName, coordX, coordY)
	local existingDigsite = Digsite[digsiteTemplate.blobID]
	if existingDigsite then
		-- TODO: Debug output
		return
	end

	local continentID, zoneID = HereBeDragons:GetCZFromMapID(digsiteTemplate.mapID)

	local digsite = _G.setmetatable({
		blobID = digsiteTemplate.blobID,
		coordX = coordX,
		coordY = coordY,
		continentID = continentID,
		distance = nil,
		level = 0,
		mapID = digsiteTemplate.mapID,
		maxFindCount = digsiteTemplate.maxFindCount,
		name = landmarkName,
		race = private.Races[digsiteTemplate.typeID],
		stats = Archy.db.char.digsites.stats[digsiteTemplate.blobID],
		surveyNodes = {},
		zoneID = zoneID,
		zoneName = HereBeDragons:GetLocalizedMap(digsiteTemplate.mapID) or ("%s %s"):format(_G.UNKNOWN, _G.PARENS_TEMPLATE:format(zoneID)),
	}, digsiteMetatable)

	Digsites[digsite.blobID] = digsite

	local mapIconFrame = _G.CreateFrame("Frame", ("ArchyMinimap_Digsite%sPOI"):format(digsite.blobID), _G.Minimap)
	mapIconFrame:SetSize(10, 10)
	mapIconFrame:Hide()
	mapIconFrame:SetScript("OnEnter", MapIcon_OnEnter)
	mapIconFrame:SetScript("OnLeave", MapIcon_OnLeave)
	mapIconFrame:SetScript("OnUpdate", MapIcon_OnUpdate)

	mapIconFrame.onUpdateElapsedTime = 0
	mapIconFrame.tooltip = ""

	mapIconFrame.GetDistance = MapIconFrameGetDistance

	digsite.mapIconFrame = mapIconFrame

	local mapIcon = mapIconFrame:CreateTexture("BACKGROUND")
	mapIcon:SetTexture([[Interface\Archeology\Arch-Icon-Marker.blp]])
	mapIcon:SetPoint("CENTER", 0, 0)
	mapIcon:SetSize(14, 14)

	mapIconFrame.icon = mapIcon

	local mapIconArrow = mapIconFrame:CreateTexture("BACKGROUND")
	mapIconArrow:SetTexture([[Interface\Minimap\ROTATING-MINIMAPGUIDEARROW.tga]])
	mapIconArrow:SetPoint("CENTER", 0, 0)
	mapIconArrow:SetSize(32, 32)

	mapIconFrame.arrow = mapIconArrow

	local surveyNodes = Archy.db.global.surveyNodes[digsite.blobID]
	if surveyNodes then
		for nodeIndex = 1, #surveyNodes do
			digsite.surveyNodes[nodeIndex] = CreateSurveyNode(digsite, surveyNodes[nodeIndex], nodeIndex)
		end
	end

	return digsite
end

-- ----------------------------------------------------------------------------
-- Digsite methods.
-- ----------------------------------------------------------------------------
function Digsite:AddSurveyNode(mapID, mapLevel, coordX, coordY)
	local surveyNodes = Archy.db.global.surveyNodes[self.blobID]
	if not surveyNodes then
		surveyNodes = {}
		Archy.db.global.surveyNodes[self.blobID] = surveyNodes
	end

	for nodeIndex = 1, #surveyNodes do
		local node = surveyNodes[nodeIndex]
		local distance = HereBeDragons:GetZoneDistance(mapID, mapLevel, coordX, coordY, node.m, node.f, node.x, node.y)
		if not distance or _G.IsInInstance() then
			distance = 0
		end

		if distance <= 10 then
			-- Found a match, or close enough. Bail.
			return
		end
	end

	-- Didn't find a match in the loop, or we wouldn't be here.
	local newSavedNode = {
		m = mapID,
		f = mapLevel,
		x = coordX,
		y = coordY
	}

	table.insert(surveyNodes, newSavedNode)

	local nodeIndex = #surveyNodes
	self.surveyNodes[nodeIndex] = CreateSurveyNode(self, newSavedNode, nodeIndex)
end

function Digsite:DisableMapIcon()
	local mapIcon = self.mapIconFrame
	mapIcon.isEnabled = nil
	mapIcon:Hide()

	HereBeDragonsPins:RemoveMinimapIcon(self, mapIcon)
end

function Digsite:DisableSurveyNodes()
	for nodeIndex = 1, #self.surveyNodes do
		local node = self.surveyNodes[nodeIndex]
		node.isEnabled = nil
		node:Hide()

		HereBeDragonsPins:RemoveMinimapIcon(self, node)
	end
end

function Digsite:EnableMapIcon(tooltipText)
	local mapIcon = self.mapIconFrame
	if not mapIcon.isEnabled then
		mapIcon.isEnabled = true
		mapIcon.tooltip = tooltipText or ("%s %s\n%s"):format(self.name, _G.PARENS_TEMPLATE:format(self.race.name), self.zoneName)
		mapIcon:Show()

		HereBeDragonsPins:AddMinimapIconMF(self, self.mapIconFrame, self.mapID, self.level, self.coordX, self.coordY, true)

		MapIcon_OnUpdate(mapIcon, 5)
	end
end

function Digsite:EnableSurveyNodes()
	for nodeIndex = 1, #self.surveyNodes do
		local node = self.surveyNodes[nodeIndex]
		if not node.isEnabled then
			node.isEnabled = true
			node:Show()

			local savedData = node.savedData
			HereBeDragonsPins:AddMinimapIconMF(self, node, savedData.m, savedData.f, savedData.x, savedData.y)

			MapIcon_OnUpdate(node, 5)
		end
	end
end

function Digsite:IsBlacklisted()
	return Archy.db.char.digsites.blacklist[self.blobID] or self.race:IsOnDigSiteBlacklist()
end

function Digsite:ToggleBlacklistStatus()
	local blacklist = Archy.db.char.digsites.blacklist

	if blacklist[self.blobID] then
		blacklist[self.blobID] = nil
	else
		blacklist[self.blobID] = true
	end
end

function Digsite:UpdateSurveyNodeDistanceColors()
	local profileSettings = private.ProfileSettings
	if not profileSettings.minimap.fragmentColorBySurveyDistance then
		return
	end

	local indicatorSettings = profileSettings.digsite.distanceIndicator
	local minGreen, maxGreen = 0, indicatorSettings.green or 0
	local minYellow, maxYellow = maxGreen, indicatorSettings.yellow or 0
	local minRed, maxRed = maxYellow, 500

	for nodeIndex = 1, #self.surveyNodes do
		local node = self.surveyNodes[nodeIndex]

		local angle, distance = HereBeDragonsPins:GetVectorToIcon(node)

		if distance then
			if distance >= minGreen and distance <= maxGreen then
				node.icon:SetTexCoord(0.75, 1, 0.5, 0.734375)
			elseif distance >= minYellow and distance <= maxYellow then
				node.icon:SetTexCoord(0.5, 0.734375, 0.5, 0.734375)
			elseif distance >= minRed and distance <= maxRed then
				node.icon:SetTexCoord(0.25, 0.484375, 0.5, 0.734375)
			end
		end
	end
end
