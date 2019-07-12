-- ----------------------------------------------------------------------------
-- Upvalued Lua API.
-- ----------------------------------------------------------------------------
-- Functions
local pairs = _G.pairs
local tonumber = _G.tonumber
local tostring = _G.tostring

-- Libraries
local math = _G.math
local table = _G.table

-- ----------------------------------------------------------------------------
-- AddOn namespace.
-- ----------------------------------------------------------------------------
local LibStub = _G.LibStub

local FOLDER_NAME, private = ...
local Archy = LibStub("AceAddon-3.0"):GetAddon("Archy")
local L = LibStub("AceLocale-3.0"):GetLocale("Archy", false)

local QTip = LibStub("LibQTip-1.0")

local LDB_object = LibStub("LibDataBroker-1.1"):NewDataObject("Archy", {
	type = "data source",
	icon = [[Interface\Icons\trade_archaeology]],
	iconCoords = { 0.075, 0.925, 0.075, 0.925 },
	text = "Archy",
})

private.LDB_object = LDB_object

-- ----------------------------------------------------------------------------
-- Constants
-- ----------------------------------------------------------------------------
local MAX_ARCHAEOLOGY_RANK = private.MAX_ARCHAEOLOGY_RANK
local ZONE_DATA = private.ZONE_DATA

local TooltipMode = {
	ArtifactDigsites = 1,
	OverallCompletion = 2,
}

local TOOLTIP_MODES = {}
for name, value in pairs(TooltipMode) do
	TOOLTIP_MODES[value] = name
end

local COUNT_DESCRIPTORS = {
	rare_counts = true,
	common_counts = true,
	total_counts = true
}

-- ----------------------------------------------------------------------------
-- Variables
-- ----------------------------------------------------------------------------
local current_tooltip_mode = TooltipMode.ArtifactDigsites

-- ----------------------------------------------------------------------------
-- Tooltip cell provider.
-- ----------------------------------------------------------------------------
local StatusBarCellProvider, StatusBarCellPrototype = QTip:CreateCellProvider()

local function Archy_cell_script(_, what, button)
	-- header was clicked, cycle display mode
	if what == "mode" then
		local nextMode = current_tooltip_mode + 1
		current_tooltip_mode = TOOLTIP_MODES[nextMode] and nextMode or TooltipMode.ArtifactDigsites
	end
	local key, value = (":"):split(what)
	value = tonumber(value)

	-- Race was clicked. Show/hide uncomplete artifacts lists.
	if key == "raceID" and value then
		for raceID, race in pairs(private.Races) do
			if value ~= raceID then
				race.expand = nil
			else
				race.expand = not race.expand
			end
		end
	end

	-- Project link was clicked.
	if key == "spellID" and value then
		Archy:Print((_G.GetSpellLink(value)))
	end
	Archy:LDBTooltipShow()
end

function StatusBarCellPrototype:InitializeCell()
	local bar = self:CreateTexture(nil, "OVERLAY", self)
	self.bar = bar
	bar:SetWidth(100)
	bar:SetHeight(12)
	bar:SetPoint("LEFT", self, "LEFT", 1, 0)

	local bg = self:CreateTexture(nil, "BACKGROUND")
	self.bg = bg
	bg:SetWidth(102)
	bg:SetHeight(14)
	bg:SetTexture(0, 0, 0, 0.5)
	bg:SetPoint("LEFT", self)

	local fs = self:CreateFontString(nil, "OVERLAY")
	self.fs = fs
	fs:SetAllPoints(self)
	fs:SetFontObject(_G.GameTooltipText)
	fs:SetShadowColor(0, 0, 0)
	fs:SetShadowOffset(1, -1)
	self.r, self.g, self.b = 1, 1, 1
end

function StatusBarCellPrototype:SetupCell(tooltip, data, justification, font, r, g, b)
	local barTexture = [[Interface\TargetingFrame\UI-StatusBar]]
	local bar = self.bar
	local fs = self.fs
	local perc
	local barColors = private.ProfileSettings.artifact.fragmentBarColors
	local color

	if current_tooltip_mode == TooltipMode.ArtifactDigsites then
		perc = math.min((data.fragments + data.keystone_adjustment) / data.fragments_required * 100, 100)

		if data.canSolve then
			color = barColors["Solvable"]
		elseif data.canSolveInventory then
			color = barColors["AttachToSolve"]
		elseif data.isRare then
			color = barColors["Rare"]
		else
			color = barColors["Normal"]
		end

		local adjust = ""
		if data.keystone_adjustment > 0 then
			adjust = "(+" .. tostring(data.keystone_adjustment) .. ")"
		end

		fs:SetFormattedText("%d%s / %d", data.fragments, adjust, data.fragments_required)
	elseif current_tooltip_mode == TooltipMode.OverallCompletion then
		perc = math.min((data[1] / data[2]) * 100, 100)

		if data[1] > 0 and data[1] == data[2] then
			color = barColors["Solvable"]
		elseif data[1] > 0 and data[1] < data[2] then
			color = barColors["AttachToSolve"]
		else
			self.r, self.g, self.b = 0.0, 0.0, 0.0
		end

		fs:SetFormattedText("%d / %d", data[1], data[2])
	end

	if perc > 0 then
		if color then
			self.r, self.g, self.b = color.r, color.g, color.b
		end

		bar:SetWidth(perc)
		bar:SetVertexColor(self.r, self.g, self.b)
		bar:SetTexture(barTexture)
		bar:Show()
	else
		bar:Hide()
	end
	fs:SetFontObject(font or tooltip:GetFont())
	fs:SetJustifyH("CENTER")
	fs:SetTextColor(1, 1, 1)
	fs:Show()

	return bar:GetWidth() + 2, bar:GetHeight() + 2
end

function StatusBarCellPrototype:ReleaseCell()
	self.r, self.g, self.b = 1, 1, 1
end

function StatusBarCellPrototype:getContentHeight()
	return self.bar:GetHeight() + 2
end

-- ----------------------------------------------------------------------------
-- Helper functions.
-- ----------------------------------------------------------------------------
local function GetAchievementProgress()
	local rareAchievementName, commonAchievementName = _G.NONE, _G.NONE
	local rareAchievementID = 4854 -- "I had it in my hand" (Title: Assistant Professor)
	local commonAchievementID = 5315 -- "Digger"
	local _, achievementName, isCompleted, rewardText

	-- local id, name, points, completed, month, day, year, description, flags, icon, rewardText = GetAchievementInfo(achID);
	_, achievementName, _, isCompleted, _, _, _, _, _, _, rewardText = _G.GetAchievementInfo(rareAchievementID)
	if isCompleted then
		rareAchievementName = rewardText
		rareAchievementID, isCompleted = _G.GetNextAchievement(rareAchievementID)

		while rareAchievementID and isCompleted do
			_, _, _, isCompleted, _, _, _, _, _, _, rewardText = _G.GetAchievementInfo(rareAchievementID)
			rareAchievementName = rewardText
			rareAchievementID, isCompleted = _G.GetNextAchievement(rareAchievementID)
		end
	end

	_, achievementName, _, isCompleted, _, _, _, _, _, _, rewardText = _G.GetAchievementInfo(commonAchievementID)
	if isCompleted then
		commonAchievementName = achievementName
		commonAchievementID, isCompleted = _G.GetNextAchievement(commonAchievementID)

		while commonAchievementID and isCompleted do
			_, achievementName, _, isCompleted, _, _, _, _, _, _, rewardText = _G.GetAchievementInfo(commonAchievementID)
			commonAchievementName = achievementName
			commonAchievementID, isCompleted = _G.GetNextAchievement(commonAchievementID)
		end
	end
	return rareAchievementName:gsub("^.+:", ""):trim(), commonAchievementName
end

local function GetArtifactsDelta(race, missing_data)
	local rare_count, common_count, total_count = 0, 0, 0
	local rare_missing, common_missing, total_missing = 0, 0, 0

	table.wipe(missing_data)

	for artifactName, artifact in pairs(race.Artifacts) do
		if artifact.isRare then
			rare_count = rare_count + 1
		else
			common_count = common_count + 1
		end
		total_count = total_count + 1
		missing_data[artifact.name] = artifact


		-- then remove the ones we've already solved at least once so we have the actual missing.
		local artifact_index = 1
		local artifactName, _, _, _, _, _, _, _, completionCount = _G.GetArtifactInfoByRace(race.ID, artifact_index)

		-- TODO: Maybe display "in progress" but not yet obtained artifacts different?
		if artifactName and completionCount > 0 and missing_data[artifactName] then
			missing_data[artifactName] = nil
			artifact_index = artifact_index + 1
		end

		while artifactName do
			artifactName, _, _, _, _, _, _, _, completionCount = _G.GetArtifactInfoByRace(race.ID, artifact_index)
			if artifactName and completionCount > 0 and missing_data[artifactName] then
				missing_data[artifactName] = nil
			end
			artifact_index = artifact_index + 1
		end
	end

	for artifactName, artifact in pairs(missing_data) do
		if artifact.isRare then
			rare_missing = rare_missing + 1
		else
			common_missing = common_missing + 1
		end
		total_missing = total_missing + 1
	end
	missing_data["rare_counts"] = { rare_count - rare_missing, rare_count }
	missing_data["common_counts"] = { common_count - common_missing, common_count }
	missing_data["total_counts"] = { total_count - total_missing, total_count }

	return rare_count - rare_missing, rare_count, common_count - common_missing, common_count, total_count - total_missing, total_count
end

local progress_data, missing_data = {}, {}

function Archy:LDBTooltipShow()
	local num_columns
	local tooltip = self.LDB_Tooltip

	if current_tooltip_mode == TooltipMode.ArtifactDigsites then
		num_columns = 10
		tooltip = QTip:Acquire("ArchyTooltip", num_columns, "CENTER", "LEFT", "LEFT", "LEFT", "RIGHT", "RIGHT", "RIGHT", "RIGHT", "RIGHT")
	elseif current_tooltip_mode == TooltipMode.OverallCompletion then
		num_columns = 6
		tooltip = QTip:Acquire("ArchyTooltip", num_columns, "CENTER", "LEFT", "LEFT", "LEFT", "RIGHT")
	end
	tooltip:Hide()
	tooltip:Clear()

	local line = tooltip:AddHeader(".")
	tooltip:SetCell(line, 1, ("%s%s%s"):format(_G.ORANGE_FONT_COLOR_CODE, "Archy", "|r") .. "*", "CENTER", num_columns)
	tooltip:SetCellScript(line, 1, "OnMouseDown", Archy_cell_script, "mode")

	if private.hasArchaeology then
		if current_tooltip_mode == TooltipMode.ArtifactDigsites then
			line = tooltip:AddLine(".")

			local rank, maxRank = private.GetArchaeologyRank()
			local skill = ("%d/%d"):format(rank, maxRank)

			if maxRank < MAX_ARCHAEOLOGY_RANK and (maxRank - rank) <= 25 then
				skill = ("%s - |cFFFF0000%s|r"):format(skill, L["Visit a trainer!"])
			elseif maxRank == MAX_ARCHAEOLOGY_RANK and rank == maxRank then
				skill = ("%s%s|r"):format(_G.GREEN_FONT_COLOR_CODE, "MAX")
			end
			tooltip:SetCell(line, 1, ("%s%s|r%s"):format(_G.NORMAL_FONT_COLOR_CODE, _G.SKILL .. ": ", skill), "CENTER", num_columns)

			if private.ProfileSettings.general.show then
				line = tooltip:AddLine(".")
				tooltip:SetCell(line, 1, ("%s%s|r"):format("|cFFFFFF00", L["Artifacts"]), "LEFT", num_columns)
				tooltip:AddSeparator()

				line = tooltip:AddLine(".")
				tooltip:SetCell(line, 1, " ", "LEFT", 1)
				tooltip:SetCell(line, 2, _G.NORMAL_FONT_COLOR_CODE .. _G.RACE .. "|r", "LEFT", 1)
				tooltip:SetCell(line, 3, " ", "LEFT", 1)
				tooltip:SetCell(line, 4, _G.NORMAL_FONT_COLOR_CODE .. L["Artifact"] .. "|r", "LEFT", 2)
				tooltip:SetCell(line, 6, _G.NORMAL_FONT_COLOR_CODE .. L["Progress"] .. "|r", "CENTER", 1)
				tooltip:SetCell(line, 7, _G.NORMAL_FONT_COLOR_CODE .. L["Keys"] .. "|r", "CENTER", 1)
				tooltip:SetCell(line, 8, _G.NORMAL_FONT_COLOR_CODE .. L["Sockets"] .. "|r", "CENTER", 1)
				tooltip:SetCell(line, 9, _G.NORMAL_FONT_COLOR_CODE .. L["Completed"] .. "|r", "CENTER", 2)

				local currentContinentRaces = private.CONTINENT_RACES[private.CurrentContinentID]

				for raceID, race in pairs(private.Races) do
					local project = race.currentProject
					if project then
						local continentHasRace = not private.ProfileSettings.tooltip.filterArtifactsByContinent or (currentContinentRaces and currentContinentRaces[raceID])

						if continentHasRace and project.fragments_required > 0 then
							local race = private.Races[raceID]

							line = tooltip:AddLine(" ")
							tooltip:SetCell(line, 1, " " .. ("|T%s:18:18:0:1:128:128:4:60:4:60|t"):format(race.texture), "LEFT", 1)
							tooltip:SetCell(line, 2, race.name, "LEFT", 1)
							tooltip:SetCell(line, 3, " " .. ("|T%s:18:18|t"):format(project.icon), "LEFT", 1)

							local artifactName = project.name

							if project.isRare then
								artifactName = ("%s%s|r"):format("|cFF0070DD", artifactName)
							end

							tooltip:SetCell(line, 4, artifactName, "LEFT", 2)

							progress_data.fragments = project.fragments
							progress_data.keystone_adjustment = project.keystone_adjustment
							progress_data.fragments_required = project.fragments_required
							progress_data.race_keystone_inventory = race.keystonesInInventory
							progress_data.sockets = project.sockets
							progress_data.keystones_added = project.keystones_added
							progress_data.canSolve = project.canSolve
							progress_data.canSolveStone = project.canSolveStone
							progress_data.canSolveInventory = project.canSolveInventory
							progress_data.isRare = project.isRare

							tooltip:SetCell(line, 6, progress_data, StatusBarCellProvider, 1, 0, 0)
							tooltip:SetCell(line, 7, (race.keystonesInInventory > 0) and race.keystonesInInventory or "", "CENTER", 1)
							tooltip:SetCell(line, 8, (project.sockets > 0) and project.sockets or "", "CENTER", 1)

							tooltip:SetCell(line, 9, project.completionCount or _G.UNKNOWN, "CENTER", 2)
						end
					end
				end

				line = tooltip:AddLine(" ")
				line = tooltip:AddLine(" ")

				tooltip:SetCell(line, 1, ("%s%s|r"):format("|cFFFFFF00", L["Dig Sites"]), "LEFT", num_columns)
				tooltip:AddSeparator()

				for continentID, continentDigsites in pairs(private.continent_digsites) do
					if #continentDigsites > 0 and (not private.ProfileSettings.tooltip.filterDigsitesByContinent or continentID == private.CurrentContinentID) then
						local continent_name
						for _, zone in pairs(ZONE_DATA) do
							if zone.continentID == continentID and zone.ID == 0 then
								continent_name = zone.name
								break
							end
						end

						if continent_name then
							line = tooltip:AddLine(" ")
							tooltip:SetCell(line, 1, "  " .. _G.ORANGE_FONT_COLOR_CODE .. continent_name .. "|r", "LEFT", num_columns)
						end
						line = tooltip:AddLine(" ")
						tooltip:SetCell(line, 1, " ", "LEFT", 1)
						tooltip:SetCell(line, 2, _G.NORMAL_FONT_COLOR_CODE .. L["Fragment"] .. "|r", "LEFT", 2)
						tooltip:SetCell(line, 4, _G.NORMAL_FONT_COLOR_CODE .. L["Dig Site"] .. "|r", "LEFT", 1)
						tooltip:SetCell(line, 5, _G.NORMAL_FONT_COLOR_CODE .. _G.ZONE .. "|r", "LEFT", 2)
						tooltip:SetCell(line, 7, _G.NORMAL_FONT_COLOR_CODE .. L["Surveys"] .. "|r", "CENTER", 1)
						tooltip:SetCell(line, 8, _G.NORMAL_FONT_COLOR_CODE .. L["Digs"] .. "|r", "CENTER", 1)
						tooltip:SetCell(line, 9, _G.NORMAL_FONT_COLOR_CODE .. _G.ARCHAEOLOGY_RUNE_STONES .. "|r", "CENTER", 1)
						tooltip:SetCell(line, 10, _G.NORMAL_FONT_COLOR_CODE .. L["Keys"] .. "|r", "CENTER", 1)

						for _, digsite in pairs(continentDigsites) do
							local race = digsite.race

							line = tooltip:AddLine(" ")
							tooltip:SetCell(line, 1, " " .. ("|T%s:18:18:0:1:128:128:4:60:4:60|t"):format(race.texture), "LEFT", 1)
							tooltip:SetCell(line, 2, race.name, "LEFT", 2)
							tooltip:SetCell(line, 4, digsite.name, "LEFT", 1)
							tooltip:SetCell(line, 5, digsite.zoneName, "LEFT", 2)
							tooltip:SetCell(line, 7, digsite.stats.surveys, "CENTER", 1)
							tooltip:SetCell(line, 8, digsite.stats.looted, "CENTER", 1)
							tooltip:SetCell(line, 9, digsite.stats.fragments, "CENTER", 1)
							tooltip:SetCell(line, 10, digsite.stats.keystones, "CENTER", 1)
						end
						line = tooltip:AddLine(" ")
					end
				end
			end
		elseif current_tooltip_mode == TooltipMode.OverallCompletion then
			local rareAchievementName, commonAchievementName = GetAchievementProgress()
			local achiev = ("%s%s|r - %s%s|r"):format(_G.ITEM_QUALITY_COLORS[3].hex, rareAchievementName, _G.ITEM_QUALITY_COLORS[1].hex, commonAchievementName)

			line = tooltip:AddLine(".")
			tooltip:SetCell(line, 1, ("%s%s|r%s"):format(_G.NORMAL_FONT_COLOR_CODE, _G.ACHIEVEMENTS .. ": ", achiev), "CENTER", num_columns)

			if private.ProfileSettings.general.show then
				line = tooltip:AddLine(".")
				tooltip:SetCell(line, 1, ("%s%s|r"):format("|cFFFFFF00", _G.ACHIEVEMENT_CATEGORY_PROGRESS), "LEFT", num_columns)
				tooltip:AddSeparator()

				line = tooltip:AddLine(".")
				tooltip:SetCell(line, 1, " ", "LEFT", 1)
				tooltip:SetCell(line, 2, _G.NORMAL_FONT_COLOR_CODE .. _G.RACE .. "|r", "LEFT", 1)
				tooltip:SetCell(line, 3, _G.NORMAL_FONT_COLOR_CODE .. _G.ITEM_QUALITY3_DESC .. "|r", "LEFT", 1)
				tooltip:SetCell(line, 5, _G.NORMAL_FONT_COLOR_CODE .. _G.ITEM_QUALITY1_DESC .. "|r", "LEFT", 1)
				tooltip:SetCell(line, 6, _G.NORMAL_FONT_COLOR_CODE .. L["Total"] .. "|r", "RIGHT", 1)

				local all_rare_done, all_rare_count, all_common_done, all_common_count, all_total_done, all_total_count = 0, 0, 0, 0, 0, 0
				for raceID, race in pairs(private.Races) do
					local rare_done, rare_count, common_done, common_count, total_done, total_count = GetArtifactsDelta(race, missing_data)

					if total_count > 0 then
						line = tooltip:AddLine(" ")
						tooltip:SetCell(line, 1, " " .. ("|T%s:18:18:0:1:128:128:4:60:4:60|t"):format(race.texture), "LEFT", 1)
						tooltip:SetCell(line, 2, race.name .. "*", "LEFT", 1)
						tooltip:SetCell(line, 3, missing_data.rare_counts, StatusBarCellProvider, 1, 0, 0)
						tooltip:SetCell(line, 5, missing_data.common_counts, StatusBarCellProvider, 1, 0, 0)
						tooltip:SetCell(line, 6, total_done .. "/" .. total_count, "RIGHT", 1)

						tooltip:SetCellScript(line, 2, "OnMouseDown", Archy_cell_script, "raceID:" .. raceID)

						all_rare_done = all_rare_done + rare_done
						all_rare_count = all_rare_count + rare_count
						all_common_done = all_common_done + common_done
						all_common_count = all_common_count + common_count
						all_total_done = all_total_done + total_done
						all_total_count = all_total_count + total_count
					end
				end

				if all_rare_done > 0 or all_rare_count > 0 or all_common_done > 0 or all_common_count > 0 or all_total_done > 0 or all_total_count > 0 then
					tooltip:AddSeparator()
					line = tooltip:AddLine(" ")
					tooltip:SetCell(line, 1, " ", "LEFT", 1)
					tooltip:SetCell(line, 2, _G.NORMAL_FONT_COLOR_CODE .. L["Total"] .. "|r", "LEFT", 1)
					tooltip:SetCell(line, 3, all_rare_done .. "/" .. all_rare_count, "LEFT", 1)
					tooltip:SetCell(line, 5, all_common_done .. "/" .. all_common_count, "LEFT", 1)
					tooltip:SetCell(line, 6, all_total_done .. "/" .. all_total_count, "RIGHT", 1)
				end

				for raceID, race in pairs(private.Races) do
					if race.expand then
						line = tooltip:AddLine(" ")
						line = tooltip:AddLine(" ")
						tooltip:SetCell(line, 1, ("%s%s|r"):format("|cFFFFFF00", race.name), "LEFT", num_columns)

						tooltip:AddSeparator()

						line = tooltip:AddLine(" ")
						tooltip:SetCell(line, 1, " ", "LEFT", 1)
						tooltip:SetCell(line, 2, _G.NORMAL_FONT_COLOR_CODE .. _G.ITEM_MISSING:format(_G.ITEM_QUALITY3_DESC) .. "|r", "LEFT", 1)
						tooltip:SetCell(line, 3, _G.NORMAL_FONT_COLOR_CODE .. _G.ITEM_MISSING:format(_G.ITEM_QUALITY1_DESC) .. "|r", "LEFT", 2)

						GetArtifactsDelta(race, missing_data)

						local start_line, end_line

						-- Rares first
						for artifactName, artifact in pairs(missing_data) do
							if not COUNT_DESCRIPTORS[artifactName] and artifact.isRare then
								line = tooltip:AddLine(" ")
								tooltip:SetCell(line, 1, " ", "LEFT", 1)
								tooltip:SetCell(line, 2, ("%s%s|r"):format(_G.ITEM_QUALITY_COLORS[3].hex, artifactName) .. "*", "LEFT", 1)
								tooltip:SetCellScript(line, 2, "OnMouseDown", Archy_cell_script, "spellID:" .. artifact.spellID)

								if not start_line then
									start_line = line
								end
								end_line = line
							end
						end

						-- Commons next (not exhaustive)
						if end_line and end_line >= start_line then
							local line, cell = start_line, 3

							for artifactName, artifact in pairs(missing_data) do
								if not COUNT_DESCRIPTORS[artifactName] and not artifact.isRare then
									if line <= end_line and cell <= 5 then
										tooltip:SetCell(line, cell, ("%s%s|r"):format(_G.ITEM_QUALITY_COLORS[1].hex, artifactName), "LEFT", 2)
										cell = cell + 2

										if cell > 5 then
											line = line + 1
											cell = 3
										end
									else
										break
									end
								end
							end
						end
						break
					end
				end
			end
		end
	else
		line = tooltip:AddLine(" ")
		tooltip:SetCell(line, 1, L["Learn Archaeology in your nearest major city!"], "CENTER", num_columns)
	end

	line = tooltip:AddLine(" ")
	line = tooltip:AddLine(" ") tooltip:SetCell(line, 1, "|cFF00FF00" .. L["*Interactive tooltip region(s)"] .. "|r", "LEFT", num_columns)
	line = tooltip:AddLine(" ") tooltip:SetCell(line, 1, "|cFF00FF00" .. L["Left-Click to toggle Archy"] .. "|r", "LEFT", num_columns)
	line = tooltip:AddLine(" ") tooltip:SetCell(line, 1, "|cFF00FF00" .. L["Shift Left-Click to toggle Archy's on-screen lists"] .. "|r", "LEFT", num_columns)
	line = tooltip:AddLine(" ") tooltip:SetCell(line, 1, "|cFF00FF00" .. L["Ctrl Left-Click to open Archy's options"] .. "|r", "LEFT", num_columns)
	line = tooltip:AddLine(" ") tooltip:SetCell(line, 1, "|cFF00FF00" .. L["Right-Click to lock/unlock Archy"] .. "|r", "LEFT", num_columns)
	line = tooltip:AddLine(" ") tooltip:SetCell(line, 1, "|cFF00FF00" .. L["Middle-Click to display the Archaeology window"] .. "|r", "LEFT", num_columns)

	tooltip:Show()

	if tooltip:GetPoint() then
		tooltip:UpdateScrolling()
	end
end

-- ----------------------------------------------------------------------------
-- LDB_object methods
-- ----------------------------------------------------------------------------
local function Tooltip_OnRelease()
	Archy.LDB_Tooltip = nil
end

function LDB_object:OnEnter()
	if private.IsTaintable() then
		return
	end
	local tooltip = QTip:Acquire("ArchyTooltip")
	tooltip:SetScale(private.ProfileSettings.tooltip.scale)
	tooltip:SetAutoHideDelay(private.ProfileSettings.tooltip.hideDelay, self, Tooltip_OnRelease)
	tooltip:EnableMouse()
	tooltip:SmartAnchorTo(self)

	Archy.LDB_Tooltip = tooltip
	Archy:LDBTooltipShow()
end

function LDB_object:OnLeave()
	-- This empty function is required for LDB displays which refuse to call an OnEnter without an OnLeave.
end

function LDB_object:OnClick(button, down)
	local generalSettings = private.ProfileSettings.general
	if button == "LeftButton" then
		if _G.IsShiftKeyDown() then
			generalSettings.stealthMode = not generalSettings.stealthMode
			Archy:ConfigUpdated()
		elseif _G.IsControlKeyDown() then
			_G.InterfaceOptionsFrame_OpenToCategory(Archy.optionsFrame)
		else
			generalSettings.show = not generalSettings.show
			Archy:LDBTooltipShow()

			if generalSettings.show and generalSettings.stealthMode and not private.stealthWarned then
				Archy:Print(L["In stealth mode. Shift-click the button or type /archy stealth if you wanted to show the Artifact and Digsite frames."]) -- we warn only once/session
				private.stealthWarned = true
			end

			Archy:ConfigUpdated()
		end
	elseif button == "RightButton" then
		generalSettings.locked = not generalSettings.locked
		Archy:Pour(_G.SUBTITLE_FORMAT:format(_G.LOCKED, generalSettings.locked and _G.YES or _G.NO))
		Archy:ConfigUpdated()
	elseif button == "MiddleButton" then
		Archy:ShowArchaeology()
	end
end

