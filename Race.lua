-- ----------------------------------------------------------------------------
-- Upvalued Lua API.
-- ----------------------------------------------------------------------------
-- Functions
local pairs = _G.pairs

-- Libraries
local math = _G.math

-- ----------------------------------------------------------------------------
-- AddOn namespace.
-- ----------------------------------------------------------------------------
local FOLDER_NAME, private = ...

local LibStub = _G.LibStub
local L = LibStub("AceLocale-3.0"):GetLocale("Archy", false)
local Archy = LibStub("AceAddon-3.0"):GetAddon("Archy")

local Races = {}
private.Races = Races

local RaceArtifactProcessingQueue = {}
private.RaceArtifactProcessingQueue = RaceArtifactProcessingQueue

local RaceKeystoneProcessingQueue = {}
private.RaceKeystoneProcessingQueue = RaceKeystoneProcessingQueue

-- ----------------------------------------------------------------------------
-- Local constants.
-- ----------------------------------------------------------------------------
local Race = {}
local raceMetatable = {
	__index = Race
}

local RaceID = { Unknown = 0 } -- Populated in AddRace
private.RaceID = RaceID

local ArchaeologyRaceLabelFromID = {} -- Populated in AddRace
private.ArchaeologyRaceLabelFromID = ArchaeologyRaceLabelFromID

-- Populated in InitializeRaces
local CurrencyNameFromRaceID = {
	[RaceID.Unknown] = _G.NONE,
}

local KeystoneIDToRace = {} -- Populated in InitializeRaces
private.KeystoneIDToRace = KeystoneIDToRace

local RaceTextureIDToRaceLabel = {
	[461829] = "ArchRaceDraenei",
	[461831] = "ArchRaceDwarf",
	[461833] = "ArchRaceFossil",
	[461835] = "ArchRaceNerubian",
	[461837] = "ArchRaceNightElf",
	[461839] = "ArchRaceTolvir",
	[461841] = "ArchRaceTroll",
	[461843] = "ArchRaceVrykul",
	[462321] = "ArchRaceOrc",
	[633000] = "ArchRaceMogu",
	[633002] = "ArchRacePandaren",
	[839111] = "ArchRaceMantid",
	[1030616] = "ArchRaceArakkoa",
	[1030617] = "ArchRaceDraenorOrc",
	[1030618] = "ArchRaceOgre",
	[1445573] = "ArchRaceDemons",
	[1445575] = "ArchRaceHighborneNightElves",
	[1445577] = "ArchRaceHighmountainTauren",
	[2060051] = "ArchRaceZandalari",
	[2060049] = "ArchRaceDrust",
}

local RaceIDToRaceLabel = {
	[0] = "ArchRaceUnknown",
	[1] = "ArchRaceDrust",
	[2] = "ArchRaceZandalari",
	[3] = "ArchRaceDemons",
	[4] = "ArchRaceHighmountainTauren",
	[5] = "ArchRaceHighborneNightElves",
	[6] = "ArchRaceOgre",
	[7] = "ArchRaceDraenorOrc",
	[8] = "ArchRaceArakkoa",
	[9] = "ArchRaceMogu",
	[10] = "ArchRacePandaren",
	[11] = "ArchRaceMantid",
	[12] = "ArchRaceVrykul",
	[13] = "ArchRaceTroll",
	[14] = "ArchRaceTolvir",
	[15] = "ArchRaceOrc",
	[16] = "ArchRaceNerubian",
	[17] = "ArchRaceNightElf",
	[18] = "ArchRaceFossil",
	[19] = "ArchRaceDraenei",
	[20] = "ArchRaceDwarf",
}
private.RaceIDToRaceLabel = RaceIDToRaceLabel

-- ----------------------------------------------------------------------------
-- Helpers.
-- ----------------------------------------------------------------------------
function private.InitializeRaces()

	for raceID = 1, _G.GetNumArchaeologyRaces() do
		local race = private.AddRace(raceID)

		KeystoneIDToRace[race.keystone.ID] = race
	end

	Races[RaceID.Unknown] = _G.setmetatable({
		Artifacts = {},
		currentProject = nil,
		fragmentsCollected = 0,
		ID = RaceID.Unknown,
		label = _G.UNKNOWN,
		maxFragments = 0,
		name = _G.UNKNOWN,
		numArtifacts = 0,
		texture = [[Interface\LFGFRAME\BattlenetWorking1]],
		keystone = {
			ID = 0,
			name = _G.NONE,
			texture = [[Interface\LFGFRAME\BattlenetWorking4]],
		},
		keystonesInInventory = 0,
	}, raceMetatable)

	CurrencyNameFromRaceID[RaceID.ArchRaceArakkoa] = C_CurrencyInfo.GetCurrencyInfo(829).quantity
	CurrencyNameFromRaceID[RaceID.ArchRaceDemons] = C_CurrencyInfo.GetCurrencyInfo(1174).quantity
	CurrencyNameFromRaceID[RaceID.ArchRaceDraenei] = C_CurrencyInfo.GetCurrencyInfo(398).quantity
	CurrencyNameFromRaceID[RaceID.ArchRaceDraenorOrc] = C_CurrencyInfo.GetCurrencyInfo(821).quantity
	CurrencyNameFromRaceID[RaceID.ArchRaceDrust] = C_CurrencyInfo.GetCurrencyInfo(1535).quantity
	CurrencyNameFromRaceID[RaceID.ArchRaceDwarf] = C_CurrencyInfo.GetCurrencyInfo(384).quantity
	CurrencyNameFromRaceID[RaceID.ArchRaceFossil] = C_CurrencyInfo.GetCurrencyInfo(393).quantity
	CurrencyNameFromRaceID[RaceID.ArchRaceHighborneNightElves] = C_CurrencyInfo.GetCurrencyInfo(1172).quantity
	CurrencyNameFromRaceID[RaceID.ArchRaceHighmountainTauren] = C_CurrencyInfo.GetCurrencyInfo(1173).quantity
	CurrencyNameFromRaceID[RaceID.ArchRaceMantid] = C_CurrencyInfo.GetCurrencyInfo(754).quantity
	CurrencyNameFromRaceID[RaceID.ArchRaceMogu] = C_CurrencyInfo.GetCurrencyInfo(677).quantity
	CurrencyNameFromRaceID[RaceID.ArchRaceNightElf] = C_CurrencyInfo.GetCurrencyInfo(394).quantity
	CurrencyNameFromRaceID[RaceID.ArchRaceNerubian] = C_CurrencyInfo.GetCurrencyInfo(400).quantity
	CurrencyNameFromRaceID[RaceID.ArchRaceOgre] = C_CurrencyInfo.GetCurrencyInfo(828).quantity
	CurrencyNameFromRaceID[RaceID.ArchRaceOrc] = C_CurrencyInfo.GetCurrencyInfo(397).quantity
	CurrencyNameFromRaceID[RaceID.ArchRacePandaren] = C_CurrencyInfo.GetCurrencyInfo(676).quantity
	CurrencyNameFromRaceID[RaceID.ArchRaceTolvir] = C_CurrencyInfo.GetCurrencyInfo(401).quantity
	CurrencyNameFromRaceID[RaceID.ArchRaceTroll] = C_CurrencyInfo.GetCurrencyInfo(385).quantity
	CurrencyNameFromRaceID[RaceID.ArchRaceVrykul] = C_CurrencyInfo.GetCurrencyInfo(399).quantity
	CurrencyNameFromRaceID[RaceID.ArchRaceZandalari] = C_CurrencyInfo.GetCurrencyInfo(1534).quantity
	
	for raceID, currencyName in pairs(CurrencyNameFromRaceID) do
		Races[raceID].currencyName = currencyName
	end

	private.InitializeRaces = nil
end

function private.AddRace(raceID)
	local existingRace = Races[raceID]
	if existingRace then
		-- TODO: Debug output
		return
	end

	local raceName, raceTextureID, keystoneItemID, fragmentsCollected, _, maxFragments = _G.GetArchaeologyRaceInfo(raceID)
	local raceLabel = RaceTextureIDToRaceLabel[raceTextureID]
	local keystoneName, _, _, _, _, _, _, _, _, keystoneTexture, _ = _G.GetItemInfo(keystoneItemID)

	RaceID[raceLabel] = raceID
	ArchaeologyRaceLabelFromID[raceID] = raceLabel

	local race = _G.setmetatable({
		Artifacts = {},
		currentProject = nil,
		fragmentsCollected = fragmentsCollected,
		ID = raceID,
		label = raceLabel,
		maxFragments = maxFragments,
		name = raceName,
		numArtifacts = _G.GetNumArtifactsByRace(raceID) or 0,
		texture = raceTextureID,
		keystone = {
			ID = keystoneItemID,
			name = keystoneName,
			texture = keystoneTexture,
		},
		keystonesInInventory = 0,
	}, raceMetatable)

	Races[raceID] = race

	if keystoneItemID and keystoneItemID > 0 and (not keystoneName or keystoneName == "") then
		RaceKeystoneProcessingQueue[race] = keystoneItemID
		Archy:RegisterEvent("GET_ITEM_INFO_RECEIVED")
	end

	for artifactIndex = 1, race.numArtifacts do
		local artifactName, _, artifactRarity, artifactIcon, _, _, _, _, _, completionCount = _G.GetArtifactInfoByRace(raceID, artifactIndex)
		local artifact = {
			ID = artifactIndex,
			completionCount = completionCount or 0,
			isRare = artifactRarity ~= 0,
			name = artifactName,
			texture = artifactIcon,
		}

		race.Artifacts[artifactName:lower()] = artifact
	end

	return Races[raceID]
end

-- ----------------------------------------------------------------------------
-- Race methods.
-- ----------------------------------------------------------------------------
function Race:AddOrUpdateArtifactFromTemplate(template)
	local projectName = template.projectName or (template.usesItemForProjectName and _G.GetItemInfo(template.itemID) or _G.GetSpellInfo(template.spellID))

	if projectName then
		local projectNameLower = projectName:lower()
		local artifact = self.Artifacts[projectNameLower]

		if artifact then
			artifact.isRare = template.isRare
			artifact.itemID = template.itemID
			artifact.spellID = template.spellID
		else
			self.Artifacts[projectNameLower] = {
				completionCount = self:GetArtifactCompletionCountByName(projectName),
				isRare = template.isRare,
				itemID = template.itemID,
				name = projectName,
				spellID = template.spellID,
			}
		end

		return true
	end

	return false
end

function Race:GetArtifactCompletionCountByName(targetArtifactName)
	if not targetArtifactName or targetArtifactName == "" or self.numArtifacts == 0 then
		return 0
	end

	for artifactIndex = 1, self.numArtifacts do
		local artifactName, _, _, _, _, _, _, _, _, completionCount = _G.GetArtifactInfoByRace(self.ID, artifactIndex)
		if artifactName == targetArtifactName then
			return completionCount or 0
		end
	end

	return 0
end

function Race:IsOnArtifactBlacklist()
	return private.ProfileSettings.artifact.blacklist[self.ID]
end

function Race:IsOnDigSiteBlacklist()
	return private.ProfileSettings.digsite.blacklist[self.ID]
end

function Race:KeystoneSocketOnClick(mouseButtonName)
	local artifact = self.currentProject

	if mouseButtonName == "LeftButton" and artifact.keystones_added < artifact.sockets and artifact.keystones_added < self.keystonesInInventory then
		artifact.keystones_added = artifact.keystones_added + 1
	elseif mouseButtonName == "RightButton" and artifact.keystones_added > 0 then
		artifact.keystones_added = artifact.keystones_added - 1
	end

	self:UpdateCurrentProject()
end

function Race:UpdateCurrentProject()
	if private.notInWorld or self.ID == 0 or _G.GetNumArtifactsByRace(self.ID) == 0 then
		return
	end

	if _G.ArchaeologyFrame and _G.ArchaeologyFrame:IsVisible() then
		_G.ArchaeologyFrame_ShowArtifact(self.ID)
	end

	_G.SetSelectedArtifact(self.ID)
	local artifactName, artifactDescription, rarity, icon, spellDescription, numSockets, _, _ = _G.GetSelectedArtifactInfo()

	local artifact = self.Artifacts[artifactName:lower()]
	if not artifact then
		private.Debug("Missing data for %s artifact \"%s\"", self.name, artifactName)
		return
	end

	local completionCount = 0
	local project = self.currentProject or artifact

	if project then
		if project.name ~= artifactName then
			if not private.isLoading then
				project.hasAnnounced = nil
				project.hasPinged = nil

				completionCount = self:GetArtifactCompletionCountByName(project.name)
				Archy:Pour(L["You have solved |cFFFFFF00%s|r Artifact - |cFFFFFF00%s|r (Times completed: %d)"]:format(self.name, project.name, completionCount),
					1, 1, 1, nil, nil, nil, nil, nil, project.icon)
			end
		else
			completionCount = self:GetArtifactCompletionCountByName(artifactName)
		end
	end

	project = artifact

	self.currentProject = project

	local baseFragments, adjustedFragments, totalFragments = _G.GetArtifactProgress()

	project.canSolve = _G.CanSolveArtifact()
	project.canSolveInventory = nil
	project.canSolveStone = nil
	project.completionCount = completionCount
	project.fragments = baseFragments
	project.fragments_required = totalFragments
	project.icon = icon
	project.isRare = (rarity ~= 0)
	project.keystone_adjustment = 0
	project.keystones_added = project.keystones_added or 0
	project.name = artifactName
	project.sockets = numSockets
	project.tooltip = spellDescription

	self.keystonesInInventory = _G.GetItemCount(self.keystone.ID) or 0

	local keystoneInventory = self.keystonesInInventory
	local prevAdded = math.min(project.keystones_added, keystoneInventory, numSockets)
	local artifactSettings = private.ProfileSettings.artifact

	if artifactSettings.autofill[self.ID] then
		prevAdded = math.min(keystoneInventory, numSockets)
	end

	project.keystones_added = math.min(keystoneInventory, numSockets)

	-- TODO: This whole section looks like a needlessly convoluted way of doing things.
	if project.keystones_added > 0 and numSockets > 0 then
		for index = 1, math.min(project.keystones_added, numSockets) do
			_G.SocketItemToArtifact()

			if not _G.ItemAddedToArtifact(index) then
				break
			end

			if index == prevAdded then
				local _, adjustedFragments = _G.GetArtifactProgress()
				project.keystone_adjustment = adjustedFragments
				project.canSolveStone = _G.CanSolveArtifact()
			end
		end

		project.canSolveInventory = _G.CanSolveArtifact()

		if prevAdded > 0 and project.keystone_adjustment <= 0 then
			local _, adjustedFragments = _G.GetArtifactProgress()
			project.keystone_adjustment = adjustedFragments
			project.canSolveStone = _G.CanSolveArtifact()
		end
	end

	project.keystones_added = prevAdded

	if not private.isLoading and private.ProfileSettings.general.show and not self:IsOnArtifactBlacklist() then
		local currencyOwned = project.fragments + project.keystone_adjustment
		local currencyRequired = project.fragments_required

		if currencyOwned > 0 and currencyRequired > 0 then
			if not project.hasAnnounced and ((artifactSettings.announce and project.canSolve) or (artifactSettings.keystoneAnnounce and project.canSolveInventory)) then
				project.hasAnnounced = true
				Archy:Pour(L["You can solve %s Artifact - %s (Fragments: %d of %d)"]:format("|cFFFFFF00" .. self.name .. "|r", "|cFFFFFF00" .. project.name .. "|r", currencyOwned, currencyRequired),
					1, 1, 1, nil, nil, nil, nil, nil, project.icon)
			end

			if not project.hasPinged and ((artifactSettings.ping and project.canSolve) or (artifactSettings.keystonePing and project.canSolveInventory)) then
				project.hasPinged = true
				_G.PlaySoundFile([[Interface\AddOns\Archy\Media\dingding.mp3]])
			end
		end
	end
end
