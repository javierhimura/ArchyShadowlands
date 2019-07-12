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
}

-- ----------------------------------------------------------------------------
-- Helpers.
-- ----------------------------------------------------------------------------
function private.InitializeRaces()
	_G.RequestArtifactCompletionHistory()

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

	CurrencyNameFromRaceID[RaceID.ArchRaceArakkoa] = _G.GetCurrencyInfo(829)
	CurrencyNameFromRaceID[RaceID.ArchRaceDemons] = _G.GetCurrencyInfo(1174)
	CurrencyNameFromRaceID[RaceID.ArchRaceDraenei] = _G.GetCurrencyInfo(398)
	CurrencyNameFromRaceID[RaceID.ArchRaceDraenorOrc] = _G.GetCurrencyInfo(821)
	CurrencyNameFromRaceID[RaceID.ArchRaceDwarf] = _G.GetCurrencyInfo(384)
	CurrencyNameFromRaceID[RaceID.ArchRaceFossil] = _G.GetCurrencyInfo(393)
	CurrencyNameFromRaceID[RaceID.ArchRaceHighborneNightElves] = _G.GetCurrencyInfo(1172)
	CurrencyNameFromRaceID[RaceID.ArchRaceHighmountainTauren] = _G.GetCurrencyInfo(1173)
	CurrencyNameFromRaceID[RaceID.ArchRaceMantid] = _G.GetCurrencyInfo(754)
	CurrencyNameFromRaceID[RaceID.ArchRaceMogu] = _G.GetCurrencyInfo(677)
	CurrencyNameFromRaceID[RaceID.ArchRaceNightElf] = _G.GetCurrencyInfo(394)
	CurrencyNameFromRaceID[RaceID.ArchRaceNerubian] = _G.GetCurrencyInfo(400)
	CurrencyNameFromRaceID[RaceID.ArchRaceOgre] = _G.GetCurrencyInfo(828)
	CurrencyNameFromRaceID[RaceID.ArchRaceOrc] = _G.GetCurrencyInfo(397)
	CurrencyNameFromRaceID[RaceID.ArchRacePandaren] = _G.GetCurrencyInfo(676)
	CurrencyNameFromRaceID[RaceID.ArchRaceTolvir] = _G.GetCurrencyInfo(401)
	CurrencyNameFromRaceID[RaceID.ArchRaceTroll] = _G.GetCurrencyInfo(385)
	CurrencyNameFromRaceID[RaceID.ArchRaceVrykul] = _G.GetCurrencyInfo(399)

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
		local artifactName, artifactDescription, artifactRarity, artifactIcon, hoverDescription, keystoneCount, bgTexture, firstCompletionTime, completionCount = _G.GetArtifactInfoByRace(raceID, artifactIndex)
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
		local artifactName, _, _, _, _, _, _, _, completionCount = _G.GetArtifactInfoByRace(self.ID, artifactIndex)
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

	local artifactName, artifactDescription, rarity, icon, spellDescription, numSockets = _G.GetSelectedArtifactInfo()
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

	_G.RequestArtifactCompletionHistory()

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
