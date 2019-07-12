-- ----------------------------------------------------------------------------
-- AddOn namespace.
-- ----------------------------------------------------------------------------
local FOLDER_NAME, private = ...

-- ----------------------------------------------------------------------------
-- Constants.
-- ----------------------------------------------------------------------------
private.CRATE_SPELL_ID = 126935
private.CRATE_SPELL_NAME = _G.GetSpellInfo(private.CRATE_SPELL_ID)

private.DEFAULT_SETTINGS = {
	profile = {
		general = {
			enabled = true,
			show = true,
			stealthMode = false,
			combathide = true,
			icon = {
				hide = false
			},
			locked = false,
			confirmSolve = true,
			showSkillBar = true,
			sinkOptions = {
				sink20OutputSink = "LibToast-1.0",
			},
			easyCast = false,
			autoLoot = true,
			theme = "Graphical",
			manualTrack = false,
		},
		artifact = {
			show = true,
			position = {
				"TOPRIGHT",
				"TOPRIGHT",
				-400,
				-425
			},
			anchor = "TOPRIGHT",
			positionX = 100,
			positionY = -300,
			scale = 0.75,
			alpha = 1,
			filter = true,
			announce = true,
			keystoneAnnounce = true,
			ping = true,
			keystonePing = true,
			blacklist = {},
			autofill = {},
			style = "Compact",
			borderAlpha = 1,
			bgAlpha = 0.5,
			font = {
				name = "Friz Quadrata TT",
				size = 14,
				shadow = true,
				outline = "",
				color = {
					r = 1,
					g = 1,
					b = 1,
					a = 1
				}
			},
			fragmentFont = {
				name = "Friz Quadrata TT",
				size = 14,
				shadow = true,
				outline = "",
				color = {
					r = 1,
					g = 1,
					b = 1,
					a = 1
				}
			},
			keystoneFont = {
				name = "Friz Quadrata TT",
				size = 12,
				shadow = true,
				outline = "",
				color = {
					r = 1,
					g = 1,
					b = 1,
					a = 1
				}
			},
			fragmentBarColors = {
				["Normal"] = {
					r = 1,
					g = 0.5,
					b = 0
				},
				["Solvable"] = {
					r = 0,
					g = 1,
					b = 0
				},
				["Rare"] = {
					r = 0,
					g = 0.4,
					b = 0.8
				},
				["AttachToSolve"] = {
					r = 1,
					g = 1,
					b = 0
				},
				["FirstTime"] = {
					r = 1,
					g = 1,
					b = 1
				},
			},
			fragmentBarTexture = "Blizzard Parchment",
			borderTexture = "Blizzard Dialog Gold",
			backgroundTexture = "Blizzard Parchment",
		},
		digsite = {
			show = true,
			position = {
				"TOPRIGHT", "TOPRIGHT", -400, -200
			},
			anchor = "TOPRIGHT",
			blacklist = {},
			positionX = 400,
			positionY = -300,
			scale = 0.75,
			alpha = 1,
			style = "Extended",
			sortByDistance = true,
			announceNearest = true,
			displayProgressBar = false,
			distanceIndicator = {
				enabled = true,
				green = 40,
				yellow = 80,
				position = {
					"CENTER",
					"CENTER",
					0,
					0
				},
				anchor = "TOPLEFT",
				undocked = false,
				showSurveyButton = true,
				showCrateButton = true,
				showLorItemButton = true,
				font = {
					name = "Friz Quadrata TT",
					size = 16,
					shadow = false,
					outline = "OUTLINE",
					color = {
						r = 1,
						g = 1,
						b = 1,
						a = 1
					}
				},
			},
			borderAlpha = 1,
			bgAlpha = 0.5,
			font = {
				name = "Friz Quadrata TT",
				size = 18,
				shadow = true,
				outline = "",
				color = {
					r = 1,
					g = 1,
					b = 1,
					a = 1
				}
			},
			zoneFont = {
				name = "Friz Quadrata TT",
				size = 14,
				shadow = true,
				outline = "",
				color = {
					r = 1,
					g = 0.82,
					b = 0,
					a = 1
				}
			},
			minimal = {
				showDistance = false,
				showZone = false,
				showDigCounter = true,
			},
			borderTexture = "Blizzard Dialog Gold",
			backgroundTexture = "Blizzard Parchment",
		},
		minimap = {
			show = true,
			nearest = true,
			fragmentNodes = true,
			fragmentIcon = "CyanDot",
			fragmentColorBySurveyDistance = true,
			useBlobDistance = true,
		},
		tooltip = {
			filterArtifactsByContinent = true,
			filterDigsitesByContinent = true,
			hideDelay = 0.1,
			scale = 1,
		},
		tomtom = {
			crazyArrowEnabled = true,
			distance = 125,
			enabled = true,
			ping = true,
		},
	},
}
