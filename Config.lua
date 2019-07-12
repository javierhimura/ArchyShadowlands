-- ----------------------------------------------------------------------------
-- Upvalued Lua API.
-- ----------------------------------------------------------------------------
local pairs = _G.pairs

-- ----------------------------------------------------------------------------
-- AddOn namespace.
-- ----------------------------------------------------------------------------
local FOLDER_NAME, private = ...

local LibStub = _G.LibStub

local Archy = LibStub("AceAddon-3.0"):GetAddon("Archy")
local Dialog = LibStub("LibDialog-1.0")
local L = LibStub("AceLocale-3.0"):GetLocale("Archy", false)
local LSM = LibStub("LibSharedMedia-3.0")

-- ----------------------------------------------------------------------------
-- Constants.
-- ----------------------------------------------------------------------------
local FRAME_ANCHOR_OPTIONS = {
	["TOPLEFT"] = L["Top Left"],
	["TOPRIGHT"] = L["Top Right"],
	["BOTTOMRIGHT"] = L["Bottom Right"],
	["BOTTOMLEFT"] = L["Bottom Left"],
}

local FONT_OUTLINES = {
	[""] = _G.NONE,
	["OUTLINE"] = L["Outline"],
	["THICKOUTLINE"] = L["Thick Outline"],
}

-- ----------------------------------------------------------------------------
-- Config option functions.
-- ----------------------------------------------------------------------------
Dialog:Register("ArchyConfirmThemeChange", {
	text = _G.REQUIRES_RELOAD,
	buttons = {
		{
			text = _G.OKAY,
			on_click = function(self, themeName)
				private.ProfileSettings.general.theme = themeName
				_G.ReloadUI()
			end,
		},
		{
			text = _G.CANCEL,
		},
	},
	show_while_dead = true,
	hide_on_escape = true,
})

local general_options

local function GetGeneralOptions()
	if not general_options then
		local generalSettings = private.ProfileSettings.general

		general_options = {
			type = "group",
			order = 1,
			name = _G.GENERAL_LABEL,
			desc = L["General Options"],
			args = {
				desc = {
					order = 0,
					type = "description",
					name = "Archy",
				},
				show = {
					order = 1,
					name = L["Show Archy"],
					desc = L["Toggle the display of Archy"],
					type = "toggle",
					get = function()
						return generalSettings.show
					end,
					set = function(_, value)
						generalSettings.show = value
						Archy:ConfigUpdated()
					end,
				},
				reset = {
					order = 2,
					name = L["Reset Positions"],
					desc = L["Reset the window positions to defaults"],
					type = "execute",
					func = function()
						private:ResetFramePositions()
					end,
				},
				lock = {
					order = 3,
					name = L["Lock Positions"],
					desc = L["Locks the windows so they cannot be repositioned by accident"],
					type = "toggle",
					get = function()
						return generalSettings.locked
					end,
					set = function(_, value)
						generalSettings.locked = value
						Archy:ConfigUpdated()
					end,
					width = "double",
				},
				archyTheme = {
					order = 4,
					type = "select",
					name = L["Style"],
					desc = L["The style of display for Archy.  This will reload your UI after selecting"],
					get = function()
						return generalSettings.theme
					end,
					set = function(_, value)
						Dialog:Spawn("ArchyConfirmThemeChange", value)
					end,
					values = {
						["Graphical"] = L["Graphical"],
						["Minimal"] = L["Minimal"],
					},
				},
				combathide = {
					order = 5,
					name = L["Auto Hide in Combat"],
					desc = L["Auto Hide Archy Frames in Combat"],
					type = "toggle",
					get = function() return generalSettings.combathide end,
					set = function(k, v)
						generalSettings.combathide = v
						private.regen_update_visibility = generalSettings.combathide or nil
					end,
					width = "double"
				},
				easyCast = {
					order = 7,
					name = L["Enable EasyCast"],
					desc = L["Double right-click on the screen to cast Survey.  This is experimental and may interfere with other addons with similar functionality when enabled."],
					type = "toggle",
					get = function() return generalSettings.easyCast end,
					set = function(_, value)
						generalSettings.easyCast = value
						Archy:ConfigUpdated()
					end,
					width = "full",
				},
				autoLoot = {
					order = 8,
					name = L["AutoLoot Fragments and Key Stones"],
					desc = L["Enable the addon to auto-loot fragments and key stones for you."],
					type = "toggle",
					get = function() return generalSettings.autoLoot end,
					set = function(_, value)
						generalSettings.autoLoot = value
						Archy:ConfigUpdated()
					end,
					width = "full",
				},
				manualTracking = {
					order = 9,
					name = L["Manual tracking"],
					desc = L["Archy will not automate dig site tracking on the minimap, world map and battlefield map."],
					type = "toggle",
					get = function() return generalSettings.manualTrack end,
					set = function(_, value)
						generalSettings.manualTrack = value
					end,
					width = "full",
				},
			},
		}
		general_options.args.output = Archy:GetSinkAce3OptionsDataTable()
		general_options.args.output.guiInline = true
		general_options.args.output.name = L["Announcements Output"]
	end
	return general_options
end

local artifact_options

local function GetArtifactOptions()
	if not artifact_options then
		local artifactSettings = private.ProfileSettings.artifact
		local generalSettings = private.ProfileSettings.general

		artifact_options = {
			order = 2,
			type = "group",
			childGroups = "tab",
			name = L["Artifacts"],
			desc = L["Artifact Options"],
			args = {
				options = {
					name = _G.GENERAL_LABEL,
					order = 0,
					type = "group",
					args = {
						desc = {
							order = 0,
							type = "description",
							name = L["Control various aspects of the Artifact options"],
						},
						show = {
							order = 1,
							type = "toggle",
							name = _G.DISPLAY,
							desc = L["Toggles the display of the Artifacts list"],
							get = function()
								return artifactSettings.show
							end,
							set = function(_, value)
								artifactSettings.show = value
								Archy:ConfigUpdated("artifact")
							end,
						},
						showOptions = {
							name = _G.DISPLAY_OPTIONS,
							order = 2,
							type = "group",
							guiInline = true,
							disabled = function()
								return not artifactSettings.show
							end,
							args = {
								filter = {
									order = 1,
									name = L["Filter by Continent"],
									desc = L["Filter the Artifact list by races on the continent"],
									type = "toggle",
									width = "full",
									get = function()
										return artifactSettings.filter
									end,
									set = function(_, value)
										artifactSettings.filter = value
										Archy:ConfigUpdated("artifact")
									end,
								},
								showSkillBar = {
									order = 2,
									name = L["Show Archaeology Skill"],
									desc = L["Show your Archaeology skill on the Artifacts list header"],
									type = "toggle",
									width = "full",
									get = function()
										return generalSettings.showSkillBar
									end,
									set = function(_, value)
										generalSettings.showSkillBar = value
										Archy:ConfigUpdated()
									end,
								},
							},
						},
						announce = {
							order = 3,
							type = "toggle",
							width = "double",
							name = L["Announce when solvable"],
							desc = L["Announce in the chat window when an artifact can be solved with fragments"],
							get = function()
								return artifactSettings.announce
							end,
							set = function(_, value)
								artifactSettings.announce = value
								Archy:ConfigUpdated("artifact")
							end,
						},
						keystoneAnnounce = {
							order = 4,
							type = "toggle",
							name = L["Include key stones"],
							desc = L["Announce in the chat window when an artifact can be solved with fragments and key stones"],
							get = function()
								return artifactSettings.keystoneAnnounce
							end,
							set = function(_, value)
								artifactSettings.keystoneAnnounce = value
								Archy:ConfigUpdated("artifact")
							end,
							disabled = function() return not artifactSettings.announce end,
						},
						blank1 = {
							order = 4.5,
							type = "description",
							name = "",
						},
						ping = {
							order = 5,
							type = "toggle",
							width = "double",
							name = L["Play sound when solvable"],
							desc = L["Play a sound when an artifact can be solved with fragments"],
							get = function()
								return artifactSettings.ping
							end,
							set = function(_, value)
								artifactSettings.ping = value
								Archy:ConfigUpdated("artifact")
							end,
						},
						keystonePing = {
							order = 6,
							type = "toggle",
							name = L["Include key stones"],
							desc = L["Play a sound when an artifact can be solved with fragments and key stones"],
							get = function()
								return artifactSettings.keystonePing
							end,
							set = function(_, value)
								artifactSettings.keystonePing = value
								Archy:ConfigUpdated("artifact")
							end,
							disabled = function() return not artifactSettings.ping end,
						},
						confirmSolve = {
							order = 6.5,
							type = "toggle",
							name = L["Confirm solves near skill cap"],
							desc = L["Ask for confirmation when your skill nears the cap.  When enabled, no confirmation is needed for Illustrious Archaeologists."],
							get = function()
								return generalSettings.confirmSolve
							end,
							set = function(_, value)
								generalSettings.confirmSolve = value
								Archy:ConfigUpdated()
							end,
							width = "full",
						},
					},
				},
				blacklist = {
					order = 1,
					type = "group",
					name = L["Blacklist"],
					args = {
						desc = {
							order = 0,
							type = "description",
							name = L["Allows you to blacklist races from being used by Archy"],
						},
						races = {
							order = 1,
							type = "multiselect",
							tristate = false,
							name = _G.RACES,
							desc = L["Select races to blacklist"],
							values = function()
								local races = {}
								for raceID, race in pairs(private.Races) do
									if raceID ~= private.RaceID.Unknown then
										races[raceID] = race.name
									end
								end

								return races
							end,
							get = function(info, key) return artifactSettings.blacklist[key] end,
							set = function(info, key, value)
								artifactSettings.blacklist[key] = value
								Archy:ConfigUpdated("artifact")
							end,
						},
					},
				},
				autofill = {
					order = 2,
					type = "group",
					name = L["AutoFill Key Stones"],
					args = {
						desc = {
							order = 0,
							type = "description",
							name = L["Allows Archy to autofill key stones as you receive them for you on the races you specify"],
						},
						races = {
							order = 1,
							type = "multiselect",
							tristate = false,
							name = _G.RACES,
							desc = L["Select races to autofill"],
							values = function()
								local races = {}
								for raceID, race in pairs(private.Races) do
									if raceID ~= private.RaceID.Unknown then
										races[raceID] = race.name
									end
								end

								return races
							end,
							get = function(info, key) return artifactSettings.autofill[key] end,
							set = function(info, key, value)
								artifactSettings.autofill[key] = value
								Archy:ConfigUpdated("artifact", "autofill")
							end,
							width = "full",
						},
					},
				},
				frameOptions = {
					order = 4,
					type = "group",
					name = L["Frame Options"],
					--            guiInline = true,
					args = {
						scale = {
							order = 7,
							type = "range",
							name = L["Size"],
							desc = L["Set how large the Artifacts list is"],
							min = 0.25,
							max = 4,
							step = 0.01,
							bigStep = 0.05,
							get = function() return artifactSettings.scale end,
							set = function(_, value)
								artifactSettings.scale = value
								Archy:ConfigUpdated("artifact")
							end,
						},
						alpha = {
							order = 8,
							type = "range",
							name = _G.OPACITY,
							desc = L["Set how transparent or opaque the Artifacts list is"],
							min = 0,
							max = 1,
							step = 0.01,
							bigStep = 0.05,
							get = function() return artifactSettings.alpha end,
							set = function(_, value)
								artifactSettings.alpha = value
								Archy:ConfigUpdated("artifact")
							end,
						},
						anchor = {
							order = 9,
							type = "select",
							name = L["Anchor"],
							desc = L["The corner of the Artifacts list that the frame will grow from."],
							get = function() return artifactSettings.anchor end,
							set = function(_, value)
								artifactSettings.anchor = value
								Archy:SaveFramePosition(private.ArtifactFrame)
							end,
							values = FRAME_ANCHOR_OPTIONS,
						},
						space = {
							order = 12,
							type = "description",
							name = "",
						},
						borderAlpha = {
							order = 13,
							type = "range",
							name = L["Border Opacity"],
							desc = L["Set how transparent or opaque the border for the Artifacts list is"],
							min = 0,
							max = 1,
							step = 0.01,
							bigStep = 0.05,
							get = function() return artifactSettings.borderAlpha end,
							set = function(_, value)
								artifactSettings.borderAlpha = value
								Archy:ConfigUpdated("artifact")
							end,
						},
						bgAlpha = {
							order = 14,
							type = "range",
							name = L["Background Opacity"],
							desc = L["Set how transparent or opaque the background for the Artifacts list is"],
							min = 0,
							max = 1,
							step = 0.01,
							bigStep = 0.05,
							get = function() return artifactSettings.bgAlpha end,
							set = function(_, value)
								artifactSettings.bgAlpha = value
								Archy:ConfigUpdated("artifact")
							end,
						},
						borderTexture = {
							order = 13.5,
							type = "select",
							name = L["Border Texture"],
							desc = L["Set the texture used by the frame border"],
							dialogControl = "LSM30_Border",
							values = LSM:HashTable(LSM.MediaType.BORDER),
							get = function() return artifactSettings.borderTexture end,
							set = function(_, value)
								artifactSettings.borderTexture = value
								Archy:ConfigUpdated("artifact")
							end,
						},
						backgroundTexture = {
							order = 14.5,
							type = "select",
							name = L["Background Texture"],
							desc = L["Set the texture used by the frame background"],
							dialogControl = "LSM30_Border",
							values = LSM:HashTable(LSM.MediaType.BACKGROUND),
							get = function() return artifactSettings.backgroundTexture end,
							set = function(_, value)
								artifactSettings.backgroundTexture = value
								Archy:ConfigUpdated("artifact")
							end,
						},
						fragmentBarTexture = {
							order = 20,
							type = "select",
							name = L["Progress Bar Texture"],
							desc = L["Set the texture used by the progress bars"],
							dialogControl = "LSM30_Statusbar",
							values = LSM:HashTable(LSM.MediaType.STATUSBAR),
							get = function() return artifactSettings.fragmentBarTexture end,
							set = function(_, value)
								artifactSettings.fragmentBarTexture = value
								Archy:ConfigUpdated("artifact")
							end,
						},
					},
				},
				fontOptions = {
					name = L["Font Options"],
					order = 5,
					type = "group",
					args = {
						mainFontOptions = {
							order = 1,
							type = "group",
							name = L["Main Font Options"],
							guiInline = true,
							args = {
								fontName = {
									order = 1,
									type = "select",
									dialogControl = "LSM30_Font",
									name = L["Font"],
									desc = L["The font that will be used"],
									values = _G.AceGUIWidgetLSMlists.font,
									get = function() return artifactSettings.font.name end,
									set = function(_, value)
										artifactSettings.font.name = value
										Archy:ConfigUpdated("artifact")
									end,
								},
								fontSize = {
									order = 2,
									type = "range",
									name = _G.FONT_SIZE,
									desc = L["Control the font size"],
									min = 4,
									max = 30,
									step = 1,
									get = function() return artifactSettings.font.size end,
									set = function(_, value)
										artifactSettings.font.size = value
										Archy:ConfigUpdated("artifact")
									end,
								},
								fontOutline = {
									order = 3,
									type = "select",
									name = L["Font Outline"],
									desc = L["The outline of the font"],
									values = FONT_OUTLINES,
									get = function() return artifactSettings.font.outline end,
									set = function(_, value)
										artifactSettings.font.outline = value
										Archy:ConfigUpdated("artifact")
									end,
								},
								fontShadow = {
									order = 4,
									type = "toggle",
									name = L["Font Shadow"],
									desc = L["Toggles if the font will have a shadow"],
									get = function() return artifactSettings.font.shadow end,
									set = function(_, value)
										artifactSettings.font.shadow = value
										Archy:ConfigUpdated("artifact")
									end,
								},
								fontColor = {
									type = "color",
									order = 5,
									name = L["Font Color"],
									desc = L["The color of the font"],
									hasAlpha = true,
									get = function(info)
										return artifactSettings.font.color.r, artifactSettings.font.color.g, artifactSettings.font.color.b, artifactSettings.font.color.a
									end,
									set = function(info, r, g, b, a)
										artifactSettings.font.color.r = r
										artifactSettings.font.color.g = g
										artifactSettings.font.color.b = b
										artifactSettings.font.color.a = a
										Archy:ConfigUpdated("artifact")
									end,
								},
							},
						},
						fragmentFontOptions = {
							order = 2,
							type = "group",
							name = L["Fragment Font Options"],
							guiInline = true,
							disabled = function() return (generalSettings.theme ~= "Graphical") end,
							args = {
								fontName = {
									order = 1,
									type = "select",
									dialogControl = "LSM30_Font",
									name = L["Font"],
									desc = L["The font that will be used"],
									values = _G.AceGUIWidgetLSMlists.font,
									get = function() return artifactSettings.fragmentFont.name end,
									set = function(_, value)
										artifactSettings.fragmentFont.name = value
										Archy:ConfigUpdated("artifact")
									end,
								},
								fontSize = {
									order = 2,
									type = "range",
									name = _G.FONT_SIZE,
									desc = L["Control the font size"],
									min = 4,
									max = 30,
									step = 1,
									get = function() return artifactSettings.fragmentFont.size end,
									set = function(_, value)
										artifactSettings.fragmentFont.size = value
										Archy:ConfigUpdated("artifact")
									end,
								},
								fontOutline = {
									order = 3,
									type = "select",
									name = L["Font Outline"],
									desc = L["The outline of the font"],
									values = FONT_OUTLINES,
									get = function() return artifactSettings.fragmentFont.outline end,
									set = function(_, value)
										artifactSettings.fragmentFont.outline = value
										Archy:ConfigUpdated("artifact")
									end,
								},
								fontShadow = {
									order = 4,
									type = "toggle",
									name = L["Font Shadow"],
									desc = L["Toggles if the font will have a shadow"],
									get = function() return artifactSettings.fragmentFont.shadow end,
									set = function(_, value)
										artifactSettings.fragmentFont.shadow = value
										Archy:ConfigUpdated("artifact")
									end,
								},
								fontColor = {
									type = "color",
									order = 5,
									name = L["Font Color"],
									desc = L["The color of the font"],
									hasAlpha = true,
									get = function(info)
										return artifactSettings.fragmentFont.color.r, artifactSettings.fragmentFont.color.g, artifactSettings.fragmentFont.color.b, artifactSettings.fragmentFont.color.a
									end,
									set = function(info, r, g, b, a)
										artifactSettings.fragmentFont.color.r = r
										artifactSettings.fragmentFont.color.g = g
										artifactSettings.fragmentFont.color.b = b
										artifactSettings.fragmentFont.color.a = a
										Archy:ConfigUpdated("artifact")
									end,
								},
							},
						},
						keystoneFontOptions = {
							order = 3,
							type = "group",
							name = L["Key Stone Font Options"],
							guiInline = true,
							disabled = function() return (generalSettings.theme ~= "Graphical") end,
							args = {
								fontName = {
									order = 1,
									type = "select",
									dialogControl = "LSM30_Font",
									name = L["Font"],
									desc = L["The font that will be used"],
									values = _G.AceGUIWidgetLSMlists.font,
									get = function() return artifactSettings.keystoneFont.name end,
									set = function(_, value)
										artifactSettings.keystoneFont.name = value
										Archy:ConfigUpdated("artifact")
									end,
								},
								fontSize = {
									order = 2,
									type = "range",
									name = _G.FONT_SIZE,
									desc = L["Control the font size"],
									min = 4,
									max = 30,
									step = 1,
									get = function() return artifactSettings.keystoneFont.size end,
									set = function(_, value)
										artifactSettings.keystoneFont.size = value
										Archy:ConfigUpdated("artifact")
									end,
								},
								fontOutline = {
									order = 3,
									type = "select",
									name = L["Font Outline"],
									desc = L["The outline of the font"],
									values = FONT_OUTLINES,
									get = function() return artifactSettings.keystoneFont.outline end,
									set = function(_, value)
										artifactSettings.keystoneFont.outline = value
										Archy:ConfigUpdated("artifact")
									end,
								},
								fontShadow = {
									order = 4,
									type = "toggle",
									name = L["Font Shadow"],
									desc = L["Toggles if the font will have a shadow"],
									get = function() return artifactSettings.keystoneFont.shadow end,
									set = function(_, value)
										artifactSettings.keystoneFont.shadow = value
										Archy:ConfigUpdated("artifact")
									end,
								},
								fontColor = {
									type = "color",
									order = 5,
									name = L["Font Color"],
									desc = L["The color of the font"],
									hasAlpha = true,
									get = function(info)
										return artifactSettings.keystoneFont.color.r, artifactSettings.keystoneFont.color.g, artifactSettings.keystoneFont.color.b, artifactSettings.keystoneFont.color.a
									end,
									set = function(info, r, g, b, a)
										artifactSettings.keystoneFont.color.r = r
										artifactSettings.keystoneFont.color.g = g
										artifactSettings.keystoneFont.color.b = b
										artifactSettings.keystoneFont.color.a = a
										Archy:ConfigUpdated("artifact")
									end,
								},
							},
						},
					},
				},
				colorOptions = {
					name = L["Color Options"],
					order = 6,
					type = "group",
					args = {
						fragmentBarColor = {
							order = 31,
							name = L["Progress Bar Color"],
							desc = L["Set the color of the progress bar for artifacts you are working on"],
							type = "color",
							get = function(info)
								return artifactSettings.fragmentBarColors["Normal"].r, artifactSettings.fragmentBarColors["Normal"].g, artifactSettings.fragmentBarColors["Normal"].b
							end,
							set = function(info, r, g, b)
								artifactSettings.fragmentBarColors["Normal"].r = r
								artifactSettings.fragmentBarColors["Normal"].g = g
								artifactSettings.fragmentBarColors["Normal"].b = b
								Archy:ConfigUpdated("artifact", "color")
							end,
						},
						fragmentBarFirstTimeColor = {
							order = 32,
							name = L["First Time Color"],
							desc = L["Set the color of the progress bar for artifacts you are working on for the first time"],
							type = "color",
							get = function(info)
								return artifactSettings.fragmentBarColors["FirstTime"].r, artifactSettings.fragmentBarColors["FirstTime"].g, artifactSettings.fragmentBarColors["FirstTime"].b
							end,
							set = function(info, r, g, b)
								artifactSettings.fragmentBarColors["FirstTime"].r = r
								artifactSettings.fragmentBarColors["FirstTime"].g = g
								artifactSettings.fragmentBarColors["FirstTime"].b = b
								Archy:ConfigUpdated("artifact", "color")
							end,
						},
						fragmentBarSolvableColor = {
							order = 33,
							name = L["Solvable Color"],
							desc = L["Set the color of the progress bar for artifacts you can solve"],
							type = "color",
							get = function(info)
								return artifactSettings.fragmentBarColors["Solvable"].r, artifactSettings.fragmentBarColors["Solvable"].g, artifactSettings.fragmentBarColors["Solvable"].b
							end,
							set = function(info, r, g, b)
								artifactSettings.fragmentBarColors["Solvable"].r = r
								artifactSettings.fragmentBarColors["Solvable"].g = g
								artifactSettings.fragmentBarColors["Solvable"].b = b
								Archy:ConfigUpdated("artifact", "color")
							end,
						},
						fragmentBarRareColor = {
							order = 34,
							name = L["Rare Color"],
							desc = L["Set the color of the progress bar for rare artifacts you are working on"],
							type = "color",
							get = function(info)
								return artifactSettings.fragmentBarColors["Rare"].r, artifactSettings.fragmentBarColors["Rare"].g, artifactSettings.fragmentBarColors["Rare"].b
							end,
							set = function(info, r, g, b)
								artifactSettings.fragmentBarColors["Rare"].r = r
								artifactSettings.fragmentBarColors["Rare"].g = g
								artifactSettings.fragmentBarColors["Rare"].b = b
								Archy:ConfigUpdated("artifact", "color")
							end,
						},
						fragmentBarKeystoneColor = {
							order = 35,
							name = L["Solvable With Key Stone Color"],
							desc = L["Set the color of the progress bar for artifacts could solve if you attach key stones to them"],
							type = "color",
							get = function(info)
								return artifactSettings.fragmentBarColors["AttachToSolve"].r, artifactSettings.fragmentBarColors["AttachToSolve"].g, artifactSettings.fragmentBarColors["AttachToSolve"].b
							end,
							set = function(info, r, g, b)
								artifactSettings.fragmentBarColors["AttachToSolve"].r = r
								artifactSettings.fragmentBarColors["AttachToSolve"].g = g
								artifactSettings.fragmentBarColors["AttachToSolve"].b = b
								Archy:ConfigUpdated("artifact", "color")
							end,
						},
					},
				},
			},
		}
	end
	return artifact_options
end

local digsite_options

local function GetDigSiteOptions()
	if not digsite_options then
		local digsiteSettings = private.ProfileSettings.digsite
		local generalSettings = private.ProfileSettings.general

		digsite_options = {
			order = 3,
			type = "group",
			childGroups = "tab",
			name = L["Dig Sites"],
			desc = L["Dig Site Options"],
			args = {
				options = {
					name = _G.GENERAL_LABEL,
					order = 0,
					type = "group",
					args = {
						desc = {
							order = 0,
							type = "description",
							name = L["Control various aspects of the Dig Site options"],
						},
						show = {
							order = 1,
							type = "toggle",
							name = _G.DISPLAY,
							desc = L["Toggles the display of the Dig Sites list"],
							get = function() return digsiteSettings.show end,
							set = function(_, value)
								digsiteSettings.show = value
								Archy:ConfigUpdated("digsite")
							end,
						},
						showOptions = {
							name = _G.DISPLAY_OPTIONS,
							order = 2,
							type = "group",
							guiInline = true,
							disabled = function()
								return not digsiteSettings.show
							end,
							args = {
								sortByDistance = {
									order = 1,
									type = "toggle",
									name = L["Sort by distance"],
									desc = L["Sort the dig sites by your distance to them"],
									get = function() return digsiteSettings.sortByDistance end,
									set = function(_, value)
										digsiteSettings.sortByDistance = value
										Archy:ConfigUpdated("digsite")
									end,
								},
							},
						},
						displayProgressBar = {
							order = 3,
							type = "toggle",
							width = "double",
							name = _G.ARCHAEOLOGY_DIGSITE_PROGRESS_BAR_TITLE,
							get = function()
								return digsiteSettings.displayProgressBar
							end,
							set = function(_, value)
								digsiteSettings.displayProgressBar = value

								Archy[value and "EnableProgressBar" or "DisableProgressBar"](Archy)
							end,
						},
						announceNearest = {
							order = 4,
							type = "toggle",
							width = "double",
							name = L["Announce Nearest Dig Site"],
							desc = L["Announces the nearest dig site when it is found"],
							get = function() return digsiteSettings.announceNearest end,
							set = function(_, value)
								digsiteSettings.announceNearest = value
								Archy:ConfigUpdated("digsite")
							end,
						},
						minimalOptions = {
							name = L["Minimal Style Options"],
							type = "group",
							order = 10,
							guiInline = true,
							disabled = function() return (generalSettings.theme == "Graphical") end,
							args = {
								showZone = {
									order = 1,
									type = "toggle",
									name = L["Show Zone"],
									get = function() return digsiteSettings.minimal.showZone end,
									set = function(_, value)
										digsiteSettings.minimal.showZone = value
										Archy:ConfigUpdated("digsite")
									end,
								},
								announceNearest = {
									order = 3,
									type = "toggle",
									name = L["Show Distance"],
									get = function() return digsiteSettings.minimal.showDistance end,
									set = function(_, value)
										digsiteSettings.minimal.showDistance = value
										Archy:ConfigUpdated("digsite")
									end,
								},
							},
						},
					},
				},
				blacklist = {
					order = 1,
					type = "group",
					name = L["Blacklist"],
					args = {
						desc = {
							order = 0,
							type = "description",
							name = L["Allows you to blacklist races from being used by Archy"],
						},
						races = {
							order = 1,
							type = "multiselect",
							tristate = false,
							name = _G.RACES,
							desc = L["Select races to blacklist"],
							values = function()
								local races = {}
								for raceID, race in pairs(private.Races) do
									if raceID ~= private.RaceID.Unknown then
										races[raceID] = race.name
									end
								end

								return races
							end,
							get = function(info, key) return digsiteSettings.blacklist[key] end,
							set = function(info, key, value)
								digsiteSettings.blacklist[key] = value
								Archy:ConfigUpdated("digsite")
							end,
						},
					},
				},
				distanceIndicator = {
					name = L["Survey Distance Indicator"],
					order = 1.5,
					type = "group",
					args = {
						desc = {
							order = 0,
							type = "description",
							name = L["Control various aspects of Survey Distance Indicator options"],
						},
						enable = {
							order = 1,
							type = "toggle",
							name = _G.ENABLE,
							desc = L["Enable the Survey Distance Indicator"],
							get = function() return digsiteSettings.distanceIndicator.enabled end,
							set = function(_, value)
								digsiteSettings.distanceIndicator.enabled = value
								Archy:ConfigUpdated("digsite")
							end,
						},
						docked = {
							order = 1.5,
							type = "toggle",
							name = L["Undock"],
							desc = L["Undock the survey distance indicator from the Dig Sites list"],
							get = function() return digsiteSettings.distanceIndicator.undocked end,
							set = function(_, value)
								digsiteSettings.distanceIndicator.undocked = value
								Archy:ConfigUpdated("digsite")
							end,
						},
						anchor = {
							order = 1.6,
							type = "select",
							name = L["Anchor"],
							desc = L["The corner of the survey distance indicator that the frame will anchor from."],
							get = function() return digsiteSettings.distanceIndicator.anchor end,
							set = function(_, value)
								digsiteSettings.distanceIndicator.anchor = value
								Archy:SaveFramePosition(private.DistanceIndicatorFrame)
							end,
							values = FRAME_ANCHOR_OPTIONS,
							disabled = function() return not digsiteSettings.distanceIndicator.undocked end,
						},
						showSurveyButton = {
							order = 2.1,
							type = "toggle",
							name = L["Show Survey Button"],
							desc = L["Shows a Survey button with the Distance Indicator."],
							get = function() return digsiteSettings.distanceIndicator.showSurveyButton end,
							set = function(_, value)
								digsiteSettings.distanceIndicator.showSurveyButton = value
								Archy:ConfigUpdated("digsite")
							end,
						},
						showCrateButton = {
							order = 2.2,
							type = "toggle",
							name = L["Show Crate Button"],
							desc = L["Shows a Crate button with the Distance Indicator."],
							get = function() return digsiteSettings.distanceIndicator.showCrateButton end,
							set = function(_, value)
								digsiteSettings.distanceIndicator.showCrateButton = value
								Archy:ConfigUpdated("digsite")
							end,
						},
						showLorItemButton = {
							order = 2.3,
							type = "toggle",
							name = L["Show Lorewalker Items Button"],
							desc = L["Shows Lorewalker Items with the Distance Indicator."],
							get = function() return digsiteSettings.distanceIndicator.showLorItemButton end,
							set = function(_, value)
								digsiteSettings.distanceIndicator.showLorItemButton = value
								Archy:ConfigUpdated("digsite")
							end,
						},
						space = {
							order = 3,
							type = "description",
							name = "",
						},
						green = {
							order = 5,
							type = "range",
							name = L["Green Distance Radius"],
							desc = L["Set how large the green area of the survey distance indicator will use"],
							min = 1,
							max = 200,
							step = 1,
							get = function() return digsiteSettings.distanceIndicator.green end,
							set = function(_, value)
								digsiteSettings.distanceIndicator.green = value
								Archy:ConfigUpdated("digsite")
							end,
						},
						yellow = {
							order = 6,
							type = "range",
							name = L["Yellow Distance Radius"],
							desc = L["Set how large the yellow area of the survey distance indicator will use"],
							min = 1,
							max = 200,
							step = 1,
							get = function() return digsiteSettings.distanceIndicator.yellow end,
							set = function(_, value)
								digsiteSettings.distanceIndicator.yellow = value
								Archy:ConfigUpdated("digsite")
							end,
						},
					},
				},
				frameOptions = {
					name = L["Frame Options"],
					order = 2,
					type = "group",
					args = {
						desc = {
							order = 0,
							type = "description",
							name = L["Control various aspects of how the Dig Site list is displayed"],
						},
						scale = {
							order = 7,
							type = "range",
							name = L["Size"],
							desc = L["Set how large the Dig Site list is"],
							min = 0.25,
							max = 4,
							step = 0.01,
							bigStep = 0.05,
							get = function() return digsiteSettings.scale end,
							set = function(_, value)
								digsiteSettings.scale = value
								Archy:ConfigUpdated("digsite")
							end,
						},
						alpha = {
							order = 8,
							type = "range",
							name = _G.OPACITY,
							desc = L["Set how transparent or opaque the Dig Site list is"],
							min = 0,
							max = 1,
							step = 0.01,
							bigStep = 0.05,
							get = function() return digsiteSettings.alpha end,
							set = function(_, value)
								digsiteSettings.alpha = value
								Archy:ConfigUpdated("digsite")
							end,
						},
						anchor = {
							order = 9,
							type = "select",
							name = L["Anchor"],
							desc = L["The corner of the Dig Sites list that the frame will grow from."],
							get = function() return digsiteSettings.anchor end,
							set = function(_, value)
								digsiteSettings.anchor = value
								Archy:SaveFramePosition(private.DigSiteFrame)
							end,
							values = FRAME_ANCHOR_OPTIONS,
						},
						space2 = {
							order = 12,
							type = "description",
							name = "",
						},
						borderAlpha = {
							order = 13,
							type = "range",
							name = L["Border Opacity"],
							desc = L["Set how transparent or opaque the border for the Dig Sites list is"],
							min = 0,
							max = 1,
							step = 0.01,
							bigStep = 0.05,
							get = function() return digsiteSettings.borderAlpha end,
							set = function(_, value)
								digsiteSettings.borderAlpha = value
								Archy:ConfigUpdated("digsite")
							end,
						},
						bgAlpha = {
							order = 14,
							type = "range",
							name = L["Background Opacity"],
							desc = L["Set how transparent or opaque the background for the Dig Sites list is"],
							min = 0,
							max = 1,
							step = 0.01,
							bigStep = 0.05,
							get = function() return digsiteSettings.bgAlpha end,
							set = function(_, value)
								digsiteSettings.bgAlpha = value
								Archy:ConfigUpdated("digsite")
							end,
						},
						borderTexture = {
							order = 13.5,
							type = "select",
							name = L["Border Texture"],
							desc = L["Set the texture used by the frame border"],
							dialogControl = "LSM30_Border",
							values = LSM:HashTable(LSM.MediaType.BORDER),
							get = function() return digsiteSettings.borderTexture end,
							set = function(_, value)
								digsiteSettings.borderTexture = value
								Archy:ConfigUpdated("digsite")
							end,
						},
						backgroundTexture = {
							order = 14.5,
							type = "select",
							name = L["Background Texture"],
							desc = L["Set the texture used by the frame background"],
							dialogControl = "LSM30_Border",
							values = LSM:HashTable(LSM.MediaType.BACKGROUND),
							get = function() return digsiteSettings.backgroundTexture end,
							set = function(_, value)
								digsiteSettings.backgroundTexture = value
								Archy:ConfigUpdated("digsite")
							end,
						},
					},
				},
				fontOptions = {
					name = L["Font Options"],
					order = 5,
					type = "group",
					args = {
						mainFontOptions = {
							order = 1,
							type = "group",
							name = L["Main Font Options"],
							guiInline = true,
							args = {
								fontName = {
									order = 1,
									type = "select",
									dialogControl = "LSM30_Font",
									name = L["Font"],
									desc = L["The font that will be used"],
									values = _G.AceGUIWidgetLSMlists.font,
									get = function() return digsiteSettings.font.name end,
									set = function(_, value)
										digsiteSettings.font.name = value
										Archy:ConfigUpdated("digsite", "font")
									end,
								},
								fontSize = {
									order = 2,
									type = "range",
									name = _G.FONT_SIZE,
									desc = L["Control the font size"],
									min = 4,
									max = 30,
									step = 1,
									get = function() return digsiteSettings.font.size end,
									set = function(_, value)
										digsiteSettings.font.size = value
										Archy:ConfigUpdated("digsite", "font")
									end,
								},
								fontOutline = {
									order = 3,
									type = "select",
									name = L["Font Outline"],
									desc = L["The outline of the font"],
									values = FONT_OUTLINES,
									get = function() return digsiteSettings.font.outline end,
									set = function(_, value)
										digsiteSettings.font.outline = value
										Archy:ConfigUpdated("digsite", "font")
									end,
								},
								fontShadow = {
									order = 4,
									type = "toggle",
									name = L["Font Shadow"],
									desc = L["Toggles if the font will have a shadow"],
									get = function() return digsiteSettings.font.shadow end,
									set = function(_, value)
										digsiteSettings.font.shadow = value
										Archy:ConfigUpdated("digsite", "font")
									end,
								},
								fontColor = {
									type = "color",
									order = 5,
									name = L["Font Color"],
									desc = L["The color of the font"],
									hasAlpha = true,
									get = function(info)
										return digsiteSettings.font.color.r, digsiteSettings.font.color.g, digsiteSettings.font.color.b, digsiteSettings.font.color.a
									end,
									set = function(info, r, g, b, a)
										digsiteSettings.font.color.r = r
										digsiteSettings.font.color.g = g
										digsiteSettings.font.color.b = b
										digsiteSettings.font.color.a = a
										Archy:ConfigUpdated("digsite", "font")
									end,
								},
							},
						},
						zoneFontOptions = {
							order = 2,
							type = "group",
							name = L["Zone Font Options"],
							guiInline = true,
							disabled = function() return (generalSettings.theme ~= "Graphical") end,
							args = {
								fontName = {
									order = 1,
									type = "select",
									dialogControl = "LSM30_Font",
									name = L["Font"],
									desc = L["The font that will be used"],
									values = _G.AceGUIWidgetLSMlists.font,
									get = function() return digsiteSettings.zoneFont.name end,
									set = function(_, value)
										digsiteSettings.zoneFont.name = value
										Archy:ConfigUpdated("digsite", "font")
									end,
								},
								fontSize = {
									order = 2,
									type = "range",
									name = _G.FONT_SIZE,
									desc = L["Control the font size"],
									min = 4,
									max = 30,
									step = 1,
									get = function() return digsiteSettings.zoneFont.size end,
									set = function(_, value)
										digsiteSettings.zoneFont.size = value
										Archy:ConfigUpdated("digsite", "font")
									end,
								},
								fontOutline = {
									order = 3,
									type = "select",
									name = L["Font Outline"],
									desc = L["The outline of the font"],
									values = FONT_OUTLINES,
									get = function() return digsiteSettings.zoneFont.outline end,
									set = function(_, value)
										digsiteSettings.zoneFont.outline = value
										Archy:ConfigUpdated("digsite", "font")
									end,
								},
								fontShadow = {
									order = 4,
									type = "toggle",
									name = L["Font Shadow"],
									desc = L["Toggles if the font will have a shadow"],
									get = function() return digsiteSettings.zoneFont.shadow end,
									set = function(_, value)
										digsiteSettings.zoneFont.shadow = value
										Archy:ConfigUpdated("digsite", "font")
									end,
								},
								fontColor = {
									type = "color",
									order = 5,
									name = L["Font Color"],
									desc = L["The color of the font"],
									hasAlpha = true,
									get = function(info)
										return digsiteSettings.zoneFont.color.r, digsiteSettings.zoneFont.color.g, digsiteSettings.zoneFont.color.b, digsiteSettings.zoneFont.color.a
									end,
									set = function(info, r, g, b, a)
										digsiteSettings.zoneFont.color.r = r
										digsiteSettings.zoneFont.color.g = g
										digsiteSettings.zoneFont.color.b = b
										digsiteSettings.zoneFont.color.a = a
										Archy:ConfigUpdated("digsite", "font")
									end,
								},
							},
						},
					},
				},
			},
		}
	end
	return digsite_options
end

local tomtom_options

local function GetTomTomOptions()
	if not tomtom_options then
		local tomtomSettings = private.ProfileSettings.tomtom

		tomtom_options = {
			order = 4,
			type = "group",
			name = "TomTom",
			desc = L["TomTom Options"],
			args = {
				desc = {
					order = 0,
					type = "description",
					name = L["Control various aspects of TomTom integration"],
				},
				enable = {
					order = 1,
					type = "toggle",
					name = L["Enable TomTom integration"],
					desc = L["Toggle if Archy will send the nearest dig site waypoint information to TomTom"],
					width = "double",
					get = function() return tomtomSettings.enabled end,
					set = function(_, value)
						tomtomSettings.enabled = value
						Archy:ConfigUpdated("tomtom")
					end,
				},
				crazyArrowEnabled = {
					order = 2,
					type = "toggle",
					name = L["Enable TomTom Crazy Arrow"],
					width = "double",
					get = function()
						return tomtomSettings.crazyArrowEnabled
					end,
					set = function(_, value)
						tomtomSettings.crazyArrowEnabled = value
						Archy:ConfigUpdated("tomtom")
					end,
					disabled = function()
						return not tomtomSettings.enabled or not private.TomTomHandler.hasTomTom
					end,
				},
				arrivalDistance = {
					order = 3,
					type = "range",
					name = L["\"Arrival Distance\""],
					desc = L["This setting will control the distance at which the waypoint arrow switches to a downwards arrow, indicating you have arrived at your destination.\nNOTE: This may not work with emulation addons if they do not support this."],
					min = 0,
					max = 150,
					step = 5,
					get = function() return tomtomSettings.distance end,
					set = function(_, value)
						tomtomSettings.distance = value
						Archy:ConfigUpdated("tomtom")
					end,
					disabled = function()
						return not tomtomSettings.enabled or not private.TomTomHandler.hasTomTom
					end,
				},
				arrivalPing = {
					order = 4,
					type = "toggle",
					name = L["Play a sound when arriving at a waypoint"],
					desc = L["When you 'arrive' at a waypoint (this distance is controlled by the 'Arrival Distance' setting in this group) a sound can be played to indicate this.  You can enable or disable this sound using this setting."],
					width = "double",
					get = function() return tomtomSettings.ping end,
					set = function(_, value)
						tomtomSettings.ping = value
						Archy:ConfigUpdated("tomtom")
					end,
					disabled = function()
						return not tomtomSettings.enabled or not private.TomTomHandler.hasTomTom
					end,
					width = "double"
				},
			},
		}
	end
	return tomtom_options
end

local minimap_options

local function GetMinimapOptions()
	if not minimap_options then
		local LDBI = LibStub("LibDBIcon-1.0")
		local generalSettings = private.ProfileSettings.general
		local minimapSettings = private.ProfileSettings.minimap

		minimap_options = {
			order = 5,
			type = "group",
			name = _G.MINIMAP_LABEL,
			desc = L["Minimap Options"],
			args = {
				desc = {
					order = 0,
					type = "description",
					name = L["Control various aspects of Minimap options"],
				},
				show = {
					order = 1,
					type = "toggle",
					name = L["Show Dig Sites"],
					desc = L["Show your dig sites on the minimap"],
					get = function() return minimapSettings.show end,
					set = function(_, value)
						minimapSettings.show = value
						Archy:ConfigUpdated("minimap")
					end,
				},
				nearest = {
					order = 2,
					type = "toggle",
					name = L["Nearest only"],
					desc = L["Show only the nearest dig site on the minimap"],
					get = function() return minimapSettings.nearest end,
					set = function(_, value)
						minimapSettings.nearest = value
						Archy:ConfigUpdated("minimap")
					end,
					disabled = function() return not minimapSettings.show end,
				},
				fragmentNodes = {
					order = 3,
					type = "toggle",
					width = "full",
					name = L["Show Fragment Nodes"],
					desc = L["Show the locations where you have collected fragments"],
					get = function() return minimapSettings.fragmentNodes end,
					set = function(_, value)
						minimapSettings.fragmentNodes = value
						Archy:ConfigUpdated("minimap")
					end,
				},
				fragmentColorBySurveyDistance = {
					order = 3.5,
					name = L["Color Node Icons On Survey"],
					desc = L["Color code the fragment node icon based on the survey distance"],
					type = "toggle",
					width = "double",
					get = function() return minimapSettings.fragmentColorBySurveyDistance end,
					set = function(_, value)
						minimapSettings.fragmentColorBySurveyDistance = value
						Archy:ConfigUpdated("minimap")
					end,
				},
				fragmentIcon = {
					order = 4,
					name = L["Node Icon"],
					desc = L["Icon to use for the fragment node icon"],
					type = "select",
					values = {
						["CyanDot"] = L["Light Blue Dot"],
						["Cross"] = L["Cross"],
					},
					get = function()
						return minimapSettings.fragmentIcon
					end,
					set = function(_, value)
						minimapSettings.fragmentIcon = value
						Archy:ConfigUpdated("minimap")
					end,
				},
				icon = {
					order = 5,
					name = L["Hide Minimap Button"],
					desc = L["Toggles the display of the Minimap Icon"],
					type = "toggle",
					get = function()
						return generalSettings.icon.hide
					end,
					set = function(k, v)
						generalSettings.icon.hide = v
						if generalSettings.icon.hide then
							LDBI:Hide("Archy")
						else
							LDBI:Show("Archy")
						end
					end,
					width = "double"
				},
			},
		}
	end
	return minimap_options
end

local tooltip_options

local function GetTooltipOptions()
	if not tooltip_options then
		local tooltipSettings = private.ProfileSettings.tooltip

		tooltip_options = {
			order = 6,
			type = "group",
			name = "Tooltips",
			desc = L["Tooltip Options"],
			args = {
				filterTooltipArtifacts = {
					order = 1,
					type = "toggle",
					width = "full",
					name = L["TOOLTIP_FILTER_LABEL_FORMAT"]:format(L["Artifacts"]),
					desc = L["TOOLTIP_FILTER_DESC_FORMAT"]:format(L["Artifacts"]),
					get = function()
						return tooltipSettings.filterArtifactsByContinent
					end,
					set = function(_, value)
						tooltipSettings.filterArtifactsByContinent = value
						Archy:ConfigUpdated("artifact", "tooltip")
					end,
				},
				filterTooltipDigsites = {
					order = 2,
					type = "toggle",
					width = "full",
					name = L["TOOLTIP_FILTER_LABEL_FORMAT"]:format(L["Dig Sites"]),
					desc = L["TOOLTIP_FILTER_DESC_FORMAT"]:format(L["Dig Sites"]),
					get = function()
						return tooltipSettings.filterDigsitesByContinent
					end,
					set = function(_, value)
						tooltipSettings.filterDigsitesByContinent = value
						Archy:ConfigUpdated("digsite", "tooltip")
					end,
				},
				scale = {
					order = 3,
					type = "range",
					width = "full",
					name = L["Tooltip Scale"],
					desc = L["Move the slider to adjust the scale of the tooltip."],
					min = 0.5,
					max = 1.5,
					step = 0.01,
					get = function()
						return tooltipSettings.scale
					end,
					set = function(info, value)
						tooltipSettings.scale = _G.math.max(0.5, _G.math.min(1.5, value))
					end,
				},
				hideDelay = {
					order = 4,
					type = "range",
					width = "full",
					name = L.TOOLTIP_HIDEDELAY_LABEL,
					desc = L.TOOLTIP_HIDEDELAY_DESC,
					min = 0.01,
					max = 2,
					step = 0.01,
					get = function()
						return tooltipSettings.hideDelay
					end,
					set = function(info, value)
						tooltipSettings.hideDelay = _G.math.max(0, _G.math.min(2, value))
					end,
				},
			},
		}
	end
	return tooltip_options
end

function Archy:SetupOptions()
	local ACFG = LibStub("AceConfig-3.0")
	ACFG:RegisterOptionsTable("Archy General", GetGeneralOptions)
	ACFG:RegisterOptionsTable("Archy Artifacts", GetArtifactOptions)
	ACFG:RegisterOptionsTable("Archy Dig Sites", GetDigSiteOptions)
	ACFG:RegisterOptionsTable("Archy TomTom", GetTomTomOptions)
	ACFG:RegisterOptionsTable("Archy Minimap", GetMinimapOptions)
	ACFG:RegisterOptionsTable("Archy Tooltips", GetTooltipOptions)
	ACFG:RegisterOptionsTable("Archy Profiles", LibStub("AceDBOptions-3.0"):GetOptionsTable(self.db))

	local ACD = LibStub("AceConfigDialog-3.0")
	ACD:AddToBlizOptions("Archy General", _G.GENERAL_LABEL, "Archy")
	ACD:AddToBlizOptions("Archy Artifacts", L["Artifacts"], "Archy")
	ACD:AddToBlizOptions("Archy Dig Sites", L["Dig Sites"], "Archy")
	ACD:AddToBlizOptions("Archy TomTom", L["TomTom Support"], "Archy")
	ACD:AddToBlizOptions("Archy Minimap", _G.MINIMAP_LABEL, "Archy")
	ACD:AddToBlizOptions("Archy Tooltips", L["Tooltip"], "Archy")
	ACD:AddToBlizOptions("Archy Profiles", L["Profiles"], "Archy")
end
