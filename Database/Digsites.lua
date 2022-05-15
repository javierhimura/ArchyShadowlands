-- ----------------------------------------------------------------------------
-- Upvalued Lua API.
-- ----------------------------------------------------------------------------
-- Functions
local pairs = _G.pairs
local tonumber = _G.tonumber

-- ----------------------------------------------------------------------------
-- AddOn namespace.
-- ----------------------------------------------------------------------------
local FOLDER_NAME, private = ...

-- ----------------------------------------------------------------------------
-- Constants
-- ----------------------------------------------------------------------------
function private.InitializeDigsiteTemplates()
	local RaceID = private.RaceID

	local DIGSITE_TEMPLATES = {
		-- ----------------------------------------------------------------------------
		-- Kalimdor
		-- ----------------------------------------------------------------------------
		["13:0.554639:0.842079"] = {
			-- Abyssal Sands Fossil Ridge
			blobID = 56375,
			mapID = 71, -- Tanaris
			raceID = RaceID.ArchRaceFossil,
		},
		["13:0.490535:0.938357"] = {
			-- Akhenet Fields Digsite
			blobID = 60356,
			mapID = 249, -- Uldum
			raceID = RaceID.ArchRaceTolvir,
		},
		["13:0.524584:0.687758"] = {
			-- Bael Modan Digsite
			blobID = 55410,
			mapID = 199, -- Southern Barrens
			raceID = RaceID.ArchRaceDwarf,
		},
		["13:0.434366:0.674429"] = {
			-- Broken Commons Digsite
			blobID = 56329,
			mapID = 69, -- Feralas
			raceID = RaceID.ArchRaceNightElf,
		},
		["13:0.568525:0.846115"] = {
			-- Broken Pillar Digsite
			blobID = 56367,
			mapID = 71, -- Tanaris
			raceID = RaceID.ArchRaceTroll,
		},
		["13:0.477519:0.337294"] = {
			-- Constellas Digsite
			blobID = 56343,
			mapID = 77, -- Felwood
			raceID = RaceID.ArchRaceNightElf,
		},
		["13:0.539286:0.932202"] = {
			-- Cursed Landing Digsite
			blobID = 60352,
			mapID = 249, -- Uldum
			raceID = RaceID.ArchRaceTolvir,
		},
		["13:0.438198:0.730965"] = {
			-- Darkmist Digsite
			blobID = 56337,
			mapID = 69, -- Feralas
			raceID = RaceID.ArchRaceNightElf,
		},
		["13:0.427981:0.705815"] = {
			-- Dire Maul Digsite
			blobID = 56327,
			mapID = 69, -- Feralas
			raceID = RaceID.ArchRaceNightElf,
		},
		["13:0.543661:0.885734"] = {
			-- Dunemaul Fossil Ridge
			blobID = 56373,
			mapID = 71, -- Tanaris
			raceID = RaceID.ArchRaceFossil,
		},
		["13:0.556432:0.883452"] = {
			-- Eastmoon Ruins Digsite
			blobID = 56369,
			mapID = 71, -- Tanaris
			raceID = RaceID.ArchRaceTroll,
		},
		["13:0.396377:0.534088"] = {
			-- Ethel Rethor Digsite
			blobID = 55420,
			mapID = 66, -- Desolace
			raceID = RaceID.ArchRaceNightElf,
		},
		["13:0.518117:0.602282"] = {
			-- Fields of Blood Fossil Bank
			blobID = 56358,
			mapID = 199, -- Southern Barrens
			raceID = RaceID.ArchRaceFossil,
		},
		["13:0.548498:0.403449"] = {
			-- Forest Song Digsite
			blobID = 55402,
			siteID = 175,
			mapID = 63, -- Ashenvale
			raceID = RaceID.ArchRaceNightElf,
		},
		["13:0.592655:0.306642"] = {
			-- Frostwhisper Gorge Digsite
			blobID = 56356,
			mapID = 83, -- Winterspring
			raceID = RaceID.ArchRaceNightElf,
		},
		["13:0.510834:0.314223"] = {
			-- Grove of Aessina Digsite
			blobID = 56570,
			mapID = 198, -- Mount Hyjal
			raceID = RaceID.ArchRaceNightElf,
		},
		["13:0.496378:0.277090"] = {
			-- Ironwood Digsite
			blobID = 56349,
			mapID = 77, -- Felwood
			raceID = RaceID.ArchRaceNightElf,
		},
		["13:0.477791:0.321805"] = {
			-- Jaedenar Digsite
			blobID = 56347,
			mapID = 77, -- Felwood
			raceID = RaceID.ArchRaceNightElf,
		},
		["13:0.530862:0.926699"] = {
			-- Keset Pass Digsite
			blobID = 60354,
			mapID = 249, -- Uldum
			raceID = RaceID.ArchRaceTolvir,
		},
		["13:0.506323:0.886183"] = {
			-- Khartut's Tomb Digsite
			blobID = 56591,
			mapID = 249, -- Uldum
			raceID = RaceID.ArchRaceTolvir,
		},
		["13:0.413714:0.576154"] = {
			-- Kodo Graveyard
			blobID = 55426,
			siteID = 199,
			mapID = 66, -- Desolace
			raceID = RaceID.ArchRaceFossil,
		},
		["13:0.574177:0.255976"] = {
			-- Lake Kel'Theril Digsite
			blobID = 56351,
			mapID = 83, -- Winterspring
			raceID = RaceID.ArchRaceNightElf,
		},
		["13:0.502193:0.796060"] = {
			-- Lower Lakkari Tar Pits
			blobID = 56380,
			mapID = 78, -- Un'Goro Crater
			raceID = RaceID.ArchRaceFossil,
		},
		["13:0.412057:0.598124"] = {
			-- Mannoroc Coven Digsite
			blobID = 55424,
			mapID = 66, -- Desolace
			raceID = RaceID.ArchRaceNightElf,
		},
		["13:0.518389:0.830585"] = {
			-- Marshlands Fossil Bank
			blobID = 56388,
			mapID = 78, -- Un'Goro Crater
			raceID = RaceID.ArchRaceFossil,
		},
		["13:0.508687:0.366886"] = {
			-- Morlos'Aran Digsite
			blobID = 56345,
			mapID = 77, -- Felwood
			raceID = RaceID.ArchRaceNightElf,
		},
		["13:0.439747:0.333789"] = {
			-- Nazj'vel Digsite
			blobID = 55354,
			mapID = 62, -- Darkshore
			raceID = RaceID.ArchRaceNightElf,
		},
		["13:0.478932:0.984906"] = {
			-- Neferset Digsite
			blobID = 56597,
			mapID = 249, -- Uldum
			raceID = RaceID.ArchRaceTolvir,
		},
		["13:0.524285:0.590665"] = {
			-- Nightmare Scar Digsite
			blobID = 56362,
			mapID = 199, -- Southern Barrens
			raceID = RaceID.ArchRaceNightElf,
		},
		["13:0.431323:0.724035"] = {
			-- North Isildien Digsite
			blobID = 56341,
			mapID = 69, -- Feralas
			raceID = RaceID.ArchRaceNightElf,
		},
		["13:0.506677:0.897433"] = {
			-- Obelisk of the Stars Digsite
			blobID = 60358,
			mapID = 249, -- Uldum
			raceID = RaceID.ArchRaceTolvir,
		},
		["13:0.415888:0.647527"] = {
			-- Oneiros Digsite
			blobID = 56333,
			mapID = 69, -- Feralas
			raceID = RaceID.ArchRaceNightElf,
		},
		["13:0.464801:0.918425"] = {
			-- Orsis Digsite
			blobID = 56599,
			mapID = 249, -- Uldum
			raceID = RaceID.ArchRaceTolvir,
		},
		["13:0.598036:0.292620"] = {
			-- Owl Wing Thicket Digsite
			blobID = 56354,
			mapID = 83, -- Winterspring
			raceID = RaceID.ArchRaceNightElf,
		},
		["13:0.559231:0.684945"] = {
			-- Quagmire Fossil Field
			blobID = 55757,
			mapID = 70, -- Dustwallow Marsh
			raceID = RaceID.ArchRaceFossil,
		},
		["13:0.390236:0.641127"] = {
			-- Ravenwind Digsite
			blobID = 56331,
			mapID = 69, -- Feralas
			raceID = RaceID.ArchRaceNightElf,
		},
		["13:0.508144:0.978751"] = {
			-- River Delta Digsite
			blobID = 60350,
			mapID = 249, -- Uldum
			raceID = RaceID.ArchRaceTolvir,
		},
		["13:0.474367:0.874077"] = {
			-- Ruins of Ahmtul Digsite
			blobID = 56607,
			mapID = 249, -- Uldum
			raceID = RaceID.ArchRaceTolvir,
		},
		["13:0.451513:0.957066"] = {
			-- Ruins of Ammon Digsite
			blobID = 56601,
			mapID = 249, -- Uldum
			raceID = RaceID.ArchRaceTolvir,
		},
		["13:0.661732:0.352457"] = {
			-- Ruins of Arkkoran
			blobID = 55414,
			mapID = 76, -- Azshara
			raceID = RaceID.ArchRaceNightElf,
		},
		["13:0.603905:0.379930"] = {
			-- Ruins of Eldarath
			blobID = 55412,
			siteID = 185,
			mapID = 76, -- Azshara
			raceID = RaceID.ArchRaceNightElf,
		},
		["13:0.434937:0.502743"] = {
			-- Ruins of Eldre'Thar
			blobID = 55406,
			mapID = 65, -- Stonetalon Mountains
			raceID = RaceID.ArchRaceNightElf,
		},
		["13:0.455916:0.877786"] = {
			-- Ruins of Khintaset Digsite
			blobID = 56603,
			mapID = 249, -- Uldum
			raceID = RaceID.ArchRaceTolvir,
		},
		["13:0.546133:0.291234"] = {
			-- Ruins of Lar'donir Digsite
			blobID = 56566,
			mapID = 198, -- Mount Hyjal
			raceID = RaceID.ArchRaceNightElf,
		},
		["13:0.463823:0.378463"] = {
			-- Ruins of Ordil'Aran
			blobID = 55398,
			mapID = 63, -- Ashenvale
			raceID = RaceID.ArchRaceNightElf,
		},
		["13:0.470426:0.436588"] = {
			-- Ruins of Stardust
			blobID = 55400,
			siteID = 173,
			mapID = 63, -- Ashenvale
			raceID = RaceID.ArchRaceNightElf,
		},
		["13:0.481242:0.884512"] = {
			-- Sahket Wastes Digsite
			blobID = 60361,
			mapID = 249, -- Uldum
			raceID = RaceID.ArchRaceTolvir,
		},
		["13:0.519775:0.341003"] = {
			-- Sanctuary of Malorne Digsite
			blobID = 56572,
			mapID = 198, -- Mount Hyjal
			raceID = RaceID.ArchRaceNightElf,
		},
		["13:0.439584:0.529238"] = {
			-- Sargeron Digsite
			blobID = 55428,
			mapID = 66, -- Desolace
			raceID = RaceID.ArchRaceNightElf,
		},
		["13:0.432328:0.950096"] = {
			-- Schnottz's Landing
			blobID = 60363,
			mapID = 249, -- Uldum
			raceID = RaceID.ArchRaceTolvir,
		},
		["13:0.550481:0.333259"] = {
			-- Scorched Plain Digsite
			blobID = 56574,
			siteID = 469,
			mapID = 198, -- Mount Hyjal
			raceID = RaceID.ArchRaceNightElf,
		},
		["13:0.483253:0.796590"] = {
			-- Screaming Reaches Fossil Field
			blobID = 56386,
			mapID = 78, -- Un'Goro Crater
			raceID = RaceID.ArchRaceFossil,
		},
		["13:0.522410:0.305949"] = {
			-- Shrine of Goldrinn Digsite
			blobID = 56568,
			mapID = 198, -- Mount Hyjal
			raceID = RaceID.ArchRaceNightElf,
		},
		["13:0.385969:0.540773"] = {
			-- Slitherblade Shore Digsite
			blobID = 55418,
			mapID = 66, -- Desolace
			raceID = RaceID.ArchRaceNightElf,
		},
		["13:0.366268:0.719103"] = {
			-- Solarsal Digsite
			blobID = 56335,
			mapID = 69, -- Feralas
			raceID = RaceID.ArchRaceNightElf,
		},
		["13:0.428008:0.746046"] = {
			-- South Isildien Digsite
			blobID = 56339,
			mapID = 69, -- Feralas
			raceID = RaceID.ArchRaceNightElf,
		},
		["13:0.545237:0.896740"] = {
			-- Southmoon Ruins Digsite
			blobID = 56371,
			mapID = 71, -- Tanaris
			raceID = RaceID.ArchRaceTroll,
		},
		["13:0.454122:0.813384"] = {
			-- Southwind Village Digsite
			blobID = 56390,
			mapID = 81, -- Silithus
			raceID = RaceID.ArchRaceNightElf,
		},
		["13:0.522737:0.937379"] = {
			-- Steps of Fate Digsite
			blobID = 56595,
			mapID = 249, -- Uldum
			raceID = RaceID.ArchRaceTolvir,
		},
		["13:0.424693:0.419346"] = {
			-- Stonetalon Peak
			blobID = 55404,
			mapID = 65, -- Stonetalon Mountains
			raceID = RaceID.ArchRaceNightElf,
		},
		["13:0.454258:0.899186"] = {
			-- Temple of Uldum Digsite
			blobID = 56605,
			mapID = 249, -- Uldum
			raceID = RaceID.ArchRaceTolvir,
		},
		["13:0.482573:0.840286"] = {
			-- Terror Run Fossil Field
			blobID = 56384,
			mapID = 78, -- Un'Goro Crater
			raceID = RaceID.ArchRaceFossil,
		},
		["13:0.523063:0.924376"] = {
			-- Tombs of the Precursors Digsite
			blobID = 56593,
			mapID = 249, -- Uldum
			raceID = RaceID.ArchRaceTolvir,
		},
		["13:0.480345:0.505719"] = {
			-- Unearthed Grounds
			blobID = 55408,
			mapID = 65, -- Stonetalon Mountains
			raceID = RaceID.ArchRaceFossil,
		},
		["13:0.497519:0.784565"] = {
			-- Upper Lakkari Tar Pits
			blobID = 56382,
			mapID = 78, -- Un'Goro Crater
			raceID = RaceID.ArchRaceFossil,
		},
		["13:0.427193:0.610638"] = {
			-- Valley of Bones
			blobID = 55422,
			mapID = 66, -- Desolace
			raceID = RaceID.ArchRaceFossil,
		},
		["13:0.558606:0.709891"] = {
			-- Wyrmbog Fossil Field
			blobID = 55755,
			mapID = 70, -- Dustwallow Marsh
			raceID = RaceID.ArchRaceFossil,
		},
		["13:0.439312:0.359957"] = {
			-- Zoram Strand Digsite
			blobID = 55356,
			siteID = 169,
			mapID = 63, -- Ashenvale
			raceID = RaceID.ArchRaceNightElf,
		},
		["13:0.543117:0.801114"] = {
			-- Zul'Farrak Digsite
			blobID = 56364,
			siteID = 315,
			mapID = 71, -- Tanaris
			raceID = RaceID.ArchRaceTroll,
		},
		
		-- ----------------------------------------------------------------------------
		-- Eastern Kingdoms
		-- ----------------------------------------------------------------------------
		["14:0.498463:0.405910"] = {
			-- Aerie Peak Digsite
			blobID = 54136,
			mapID = 26, -- The Hinterlands
			raceID = RaceID.ArchRaceDwarf,
		},
		["14:0.528555:0.396444"] = {
			-- Agol'watha Digsite
			blobID = 54141,
			mapID = 26, -- The Hinterlands
			raceID = RaceID.ArchRaceTroll,
		},
		["14:0.529488:0.420533"] = {
			-- Altar of Zul Digsite
			blobID = 54138,
			mapID = 26, -- The Hinterlands
			raceID = RaceID.ArchRaceTroll,
		},
		["14:0.471218:0.365394"] = {
			-- Andorhal Fossil Bank
			blobID = 55482,
			mapID = 22, -- Western Plaguelands
			raceID = RaceID.ArchRaceFossil,
		},
		["14:0.436756:0.853650"] = {
			-- Bal'lal Ruins Digsite
			blobID = 55458,
			mapID = 50, -- Northern Stranglethorn
			raceID = RaceID.ArchRaceTroll,
		},
		["14:0.463707:0.872840"] = {
			-- Balia'mah Digsite
			blobID = 55460,
			mapID = 50, -- Northern Stranglethorn
			raceID = RaceID.ArchRaceTroll,
		},
		["14:0.515424:0.833798"] = {
			-- Dreadmaul Fossil Field
			blobID = 55436,
			mapID = 17, -- Blasted Lands
			raceID = RaceID.ArchRaceFossil,
		},
		["14:0.474016:0.457587"] = {
			-- Dun Garok Digsite
			blobID = 54134,
			siteID = 20,
			mapID = 25, -- Hillsbrad Foothills
			raceID = RaceID.ArchRaceDwarf,
		},
		["14:0.570552:0.584292"] = {
			-- Dunwald Ruins Digsite
			blobID = 56583,
			mapID = 241, -- Twilight Highlands
			raceID = RaceID.ArchRaceDwarf,
		},
		["14:0.498807:0.698105"] = {
			-- Eastern Ruins of Thaurissan
			blobID = 55444,
			mapID = 36, -- Burning Steppes
			raceID = RaceID.ArchRaceDwarf,
		},
		["14:0.432240:0.839175"] = {
			-- Eastern Zul'Kunda Digsite
			blobID = 55454,
			mapID = 50, -- Northern Stranglethorn
			raceID = RaceID.ArchRaceTroll,
		},
		["14:0.466701:0.888863"] = {
			-- Eastern Zul'Mamwe Digsite
			blobID = 55464,
			mapID = 50, -- Northern Stranglethorn
			raceID = RaceID.ArchRaceTroll,
		},
		["14:0.474630:0.348157"] = {
			-- Felstone Fossil Field
			blobID = 55478,
			mapID = 22, -- Western Plaguelands
			raceID = RaceID.ArchRaceFossil,
		},
		["14:0.521069:0.543813"] = {
			-- Greenwarden's Fossil Bank
			blobID = 54127,
			mapID = 56, -- Wetlands
			raceID = RaceID.ArchRaceFossil,
		},
		["14:0.488252:0.669339"] = {
			-- Grimsilt Digsite
			blobID = 55438,
			mapID = 32, -- Searing Gorge
			raceID = RaceID.ArchRaceDwarf,
		},
		["14:0.438327:0.894682"] = {
			-- Gurubashi Arena Digsite
			blobID = 55474,
			mapID = 210, -- The Cape of Stranglethorn
			raceID = RaceID.ArchRaceTroll,
		},
		["14:0.529095:0.647865"] = {
			-- Hammertoe's Digsite
			blobID = 54832,
			mapID = 15, -- Badlands
			raceID = RaceID.ArchRaceDwarf,
		},
		["14:0.560341:0.521087"] = {
			-- Humboldt Conflagration Digsite
			blobID = 56587,
			mapID = 241, -- Twilight Highlands
			raceID = RaceID.ArchRaceDwarf,
		},
		["14:0.550131:0.336812"] = {
			-- Infectis Scar Fossil Field
			blobID = 55452,
			mapID = 23, -- Eastern Plaguelands
			raceID = RaceID.ArchRaceFossil,
		},
		["14:0.541343:0.620130"] = {
			-- Ironband's Excavation Site
			blobID = 54097,
			mapID = 48, -- Loch Modan
			raceID = RaceID.ArchRaceDwarf,
		},
		["14:0.500402:0.516335"] = {
			-- Ironbeard's Tomb
			blobID = 54124,
			mapID = 56, -- Wetlands
			raceID = RaceID.ArchRaceDwarf,
		},
		["14:0.547062:0.424069"] = {
			-- Jintha'Alor Lower City Digsite
			blobID = 54139,
			mapID = 26, -- The Hinterlands
			raceID = RaceID.ArchRaceTroll,
		},
		["14:0.541932:0.427274"] = {
			-- Jintha'Alor Upper City Digsite
			blobID = 54140,
			mapID = 26, -- The Hinterlands
			raceID = RaceID.ArchRaceTroll,
		},
		["14:0.507029:0.767830"] = {
			-- Lakeridge Highway Fossil Bank
			blobID = 55416,
			siteID = 189,
			mapID = 49, -- Redridge Mountains
			raceID = RaceID.ArchRaceFossil,
		},
		["14:0.548732:0.813171"] = {
			-- Misty Reed Fossil Bank
			blobID = 54864,
			mapID = 51, -- Swamp of Sorrows
			raceID = RaceID.ArchRaceFossil,
		},
		["14:0.435235:0.921239"] = {
			-- Nek'mani Wellspring Digsite
			blobID = 55476,
			mapID = 210, -- The Cape of Stranglethorn
			raceID = RaceID.ArchRaceTroll,
		},
		["14:0.485699:0.325357"] = {
			-- Northridge Fossil Field
			blobID = 55480,
			mapID = 22, -- Western Plaguelands
			raceID = RaceID.ArchRaceFossil,
		},
		["14:0.538079:0.298359"] = {
			-- Plaguewood Digsite
			blobID = 60444,
			mapID = 23, -- Eastern Plaguelands
			raceID = RaceID.ArchRaceNerubian,
		},
		["14:0.475980:0.660978"] = {
			-- Pyrox Flats Digsite
			blobID = 55440,
			siteID = 209,
			mapID = 32, -- Searing Gorge
			raceID = RaceID.ArchRaceDwarf,
		},
		["14:0.549026:0.288929"] = {
			-- Quel'Lithien Lodge Digsite
			blobID = 55450,
			mapID = 23, -- Eastern Plaguelands
			raceID = RaceID.ArchRaceNightElf,
		},
		["14:0.532311:0.872840"] = {
			-- Red Reaches Fossil Bank
			blobID = 55434,
			mapID = 17, -- Blasted Lands
			raceID = RaceID.ArchRaceFossil,
		},
		["14:0.453668:0.915198"] = {
			-- Ruins of Aboraz
			blobID = 55470,
			mapID = 210, -- The Cape of Stranglethorn
			raceID = RaceID.ArchRaceTroll,
		},
		["14:0.445519:0.903191"] = {
			-- Ruins of Jubuwal
			blobID = 55472,
			mapID = 210, -- The Cape of Stranglethorn
			raceID = RaceID.ArchRaceTroll,
		},
		["14:0.440119:0.859691"] = {
			-- Savage Coast Raptor Fields
			blobID = 55468,
			mapID = 50, -- Northern Stranglethorn
			raceID = RaceID.ArchRaceFossil,
		},
		["14:0.517215:0.423664"] = {
			-- Shadra'Alor Digsite
			blobID = 54137,
			mapID = 26, -- The Hinterlands
			raceID = RaceID.ArchRaceTroll,
		},
		["14:0.468837:0.430073"] = {
			-- Southshore Fossil Field
			blobID = 54135,
			siteID = 21,
			mapID = 25, -- Hillsbrad Foothills
			raceID = RaceID.ArchRaceFossil,
		},
		["14:0.540337:0.800427"] = {
			-- Sunken Temple Digsite
			blobID = 54862,
			mapID = 51, -- Swamp of Sorrows
			raceID = RaceID.ArchRaceTroll,
		},
		["14:0.518835:0.710886"] = {
			-- Terror Wing Fossil Field
			blobID = 55446,
			mapID = 36, -- Burning Steppes
			raceID = RaceID.ArchRaceFossil,
		},
		["14:0.516013:0.297438"] = {
			-- Terrorweb Tunnel Digsite
			blobID = 60442,
			mapID = 23, -- Eastern Plaguelands
			raceID = RaceID.ArchRaceNerubian,
		},
		["14:0.506735:0.502891"] = {
			-- Thandol Span
			blobID = 54133,
			mapID = 56, -- Wetlands
			raceID = RaceID.ArchRaceDwarf,
		},
		["14:0.488890:0.436740"] = {
			-- Thoradin's Wall
			blobID = 54129,
			mapID = 14, -- Arathi Highlands
			raceID = RaceID.ArchRaceDwarf,
		},
		["14:0.570896:0.533978"] = {
			-- Thundermar Ruins Digsite
			blobID = 56585,
			mapID = 241, -- Twilight Highlands
			raceID = RaceID.ArchRaceDwarf,
		},
		["14:0.529365:0.664698"] = {
			-- Tomb of the Watchers Digsite
			blobID = 54834,
			mapID = 15, -- Badlands
			raceID = RaceID.ArchRaceDwarf,
		},
		["14:0.457080:0.797333"] = {
			-- Twilight Grove Digsite
			blobID = 55350,
			mapID = 47, -- Duskwood
			raceID = RaceID.ArchRaceNightElf,
		},
		["14:0.525831:0.635232"] = {
			-- Uldaman Entrance Digsite
			blobID = 54838,
			mapID = 15, -- Badlands
			raceID = RaceID.ArchRaceDwarf,
		},
		["14:0.448857:0.817149"] = {
			-- Vul'Gol Fossil Bank
			blobID = 55352,
			mapID = 47, -- Duskwood
			raceID = RaceID.ArchRaceFossil,
		},
		["14:0.492155:0.698253"] = {
			-- Western Ruins of Thaurissan
			blobID = 55442,
			mapID = 36, -- Burning Steppes
			raceID = RaceID.ArchRaceDwarf,
		},
		["14:0.428804:0.840170"] = {
			-- Western Zul'Kunda Digsite
			blobID = 55456,
			mapID = 50, -- Northern Stranglethorn
			raceID = RaceID.ArchRaceTroll,
		},
		["14:0.462185:0.888089"] = {
			-- Western Zul'Mamwe Digsite
			blobID = 55466,
			mapID = 50, -- Northern Stranglethorn
			raceID = RaceID.ArchRaceTroll,
		},
		["14:0.490486:0.540093"] = {
			-- Whelgar's Excavation Site
			blobID = 54126,
			siteID = 12,
			mapID = 56, -- Wetlands
			raceID = RaceID.ArchRaceDwarf,
		},
		["14:0.526469:0.477661"] = {
			-- Witherbark Digsite
			blobID = 54132,
			mapID = 14, -- Arathi Highlands
			raceID = RaceID.ArchRaceTroll,
		},
		["14:0.457301:0.878770"] = {
			-- Ziata'jai Digsite
			blobID = 55462,
			mapID = 50, -- Northern Stranglethorn
			raceID = RaceID.ArchRaceTroll,
		},
		["14:0.566404:0.287382"] = {
			-- Zul'Mashar Digsite
			blobID = 55448,
			siteID = 217,
			mapID = 23, -- Eastern Plaguelands
			raceID = RaceID.ArchRaceTroll,
		},
		
		-- ----------------------------------------------------------------------------
		-- Outland
		-- ----------------------------------------------------------------------------
		["101:0.238263:0.685266"] = {
			-- Ancestral Grounds Digsite
			blobID = 56412,
			siteID = 359,
			mapID = 107, -- Nagrand
			raceID = RaceID.ArchRaceOrc,
		},
		["101:0.560123:0.262942"] = {
			-- Arklon Ruins Digsite
			blobID = 56408,
			mapID = 109, -- Netherstorm
			raceID = RaceID.ArchRaceDraenei,
		},
		["101:0.400138:0.781807"] = {
			-- Bleeding Hollow Ruins Digsite
			blobID = 56428,
			mapID = 108, -- Terokkar Forest
			raceID = RaceID.ArchRaceOrc,
		},
		["101:0.329479:0.525166"] = {
			-- Boha'mu Ruins Digsite
			blobID = 56402,
			mapID = 102, -- Zangarmarsh
			raceID = RaceID.ArchRaceDraenei,
		},
		["101:0.485685:0.768494"] = {
			-- Bone Wastes Digsite
			blobID = 56432,
			mapID = 108, -- Terokkar Forest
			raceID = RaceID.ArchRaceDraenei,
		},
		["101:0.543174:0.749856"] = {
			-- Bonechewer Ruins Digsite
			blobID = 56430,
			mapID = 108, -- Terokkar Forest
			raceID = RaceID.ArchRaceOrc,
		},
		["101:0.387369:0.716616"] = {
			-- Burning Blade Digsite
			blobID = 56420,
			mapID = 107, -- Nagrand
			raceID = RaceID.ArchRaceOrc,
		},
		["101:0.647274:0.756383"] = {
			-- Coilskar Point Digsite
			blobID = 56441,
			mapID = 104, -- Shadowmoon Valley
			raceID = RaceID.ArchRaceDraenei,
		},
		["101:0.721254:0.860569"] = {
			-- Dragonmaw Fortress
			blobID = 56455,
			siteID = 399,
			mapID = 104, -- Shadowmoon Valley
			raceID = RaceID.ArchRaceOrc,
		},
		["101:0.470110:0.786789"] = {
			-- East Auchindoun Digsite
			blobID = 56434,
			mapID = 108, -- Terokkar Forest
			raceID = RaceID.ArchRaceDraenei,
		},
		["101:0.647961:0.882814"] = {
			-- Eclipse Point Digsite
			blobID = 56448,
			mapID = 104, -- Shadowmoon Valley
			raceID = RaceID.ArchRaceDraenei,
		},
		["101:0.559035:0.593964"] = {
			-- Gor'gaz Outpost Digsite
			blobID = 56392,
			mapID = 100, -- Hellfire Peninsula
			raceID = RaceID.ArchRaceOrc,
		},
		["101:0.460261:0.709917"] = {
			-- Grangol'var Village Digsite
			blobID = 56424,
			mapID = 108, -- Terokkar Forest
			raceID = RaceID.ArchRaceOrc,
		},
		["101:0.288995:0.635278"] = {
			-- Halaa Digsite
			blobID = 56422,
			mapID = 107, -- Nagrand
			raceID = RaceID.ArchRaceDraenei,
		},
		["101:0.561154:0.525767"] = {
			-- Hellfire Basin Digsite
			blobID = 56396,
			mapID = 100, -- Hellfire Peninsula
			raceID = RaceID.ArchRaceOrc,
		},
		["101:0.575068:0.527914"] = {
			-- Hellfire Citadel Digsite
			blobID = 56398,
			mapID = 100, -- Hellfire Peninsula
			raceID = RaceID.ArchRaceOrc,
		},
		["101:0.597114:0.834630"] = {
			-- Illidari Point Digsite
			blobID = 56439,
			siteID = 385,
			mapID = 104, -- Shadowmoon Valley
			raceID = RaceID.ArchRaceDraenei,
		},
		["101:0.298501:0.565363"] = {
			-- Laughing Skull Digsite
			blobID = 56418,
			mapID = 107, -- Nagrand
			raceID = RaceID.ArchRaceOrc,
		},
		["101:0.682718:0.783782"] = {
			-- Ruins of Baa'ri Digsite
			blobID = 56446,
			mapID = 104, -- Shadowmoon Valley
			raceID = RaceID.ArchRaceDraenei,
		},
		["101:0.539567:0.202217"] = {
			-- Ruins of Enkaat Digsite
			blobID = 56406,
			mapID = 109, -- Netherstorm
			raceID = RaceID.ArchRaceDraenei,
		},
		["101:0.600377:0.100351"] = {
			-- Ruins of Farahlon Digsite
			blobID = 56410,
			mapID = 109, -- Netherstorm
			raceID = RaceID.ArchRaceDraenei,
		},
		["101:0.468278:0.545093"] = {
			-- Sha'naar Digsite
			blobID = 56400,
			mapID = 100, -- Hellfire Peninsula
			raceID = RaceID.ArchRaceDraenei,
		},
		["101:0.255040:0.631928"] = {
			-- Sunspring Post Digsite
			blobID = 56416,
			siteID = 363,
			mapID = 107, -- Nagrand
			raceID = RaceID.ArchRaceOrc,
		},
		["101:0.504008:0.680456"] = {
			-- Tuurem Digsite
			blobID = 56426,
			mapID = 108, -- Terokkar Forest
			raceID = RaceID.ArchRaceDraenei,
		},
		["101:0.338583:0.482822"] = {
			-- Twin Spire Ruins Digsite
			blobID = 56404,
			mapID = 102, -- Zangarmarsh
			raceID = RaceID.ArchRaceDraenei,
		},
		["101:0.688788:0.819857"] = {
			-- Warden's Cage Digsite
			blobID = 56450,
			mapID = 104, -- Shadowmoon Valley
			raceID = RaceID.ArchRaceOrc,
		},
		["101:0.452130:0.788678"] = {
			-- West Auchindoun Digsite
			blobID = 56437,
			mapID = 108, -- Terokkar Forest
			raceID = RaceID.ArchRaceDraenei,
		},
		["101:0.624713:0.584688"] = {
			-- Zeth'Gor Digsite
			blobID = 56394,
			mapID = 100, -- Hellfire Peninsula
			raceID = RaceID.ArchRaceOrc,
		},
		
		-- ----------------------------------------------------------------------------
		-- Northrend
		-- ----------------------------------------------------------------------------
		["113:0.760625:0.411718"] = {
			-- Altar of Quetz'lun Digsite
			blobID = 56539,
			siteID = 435,
			mapID = 121, -- Zul'Drak
			raceID = RaceID.ArchRaceTroll,
		},
		["113:0.665477:0.371495"] = {
			-- Altar of Sseratus Digsite
			blobID = 56533,
			mapID = 121, -- Zul'Drak
			raceID = RaceID.ArchRaceTroll,
		},
		["113:0.816113:0.768901"] = {
			-- Baleheim Digsite
			blobID = 56512,
			siteID = 409,
			mapID = 117, -- Howling Fjord
			raceID = RaceID.ArchRaceVrykul,
		},
		["113:0.611679:0.306430"] = {
			-- Brunnhildar Village Digsite
			blobID = 56549,
			siteID = 445,
			mapID = 120, -- The Storm Peaks
			raceID = RaceID.ArchRaceVrykul,
		},
		["113:0.793467:0.505175"] = {
			-- Drakil'Jin Ruins Digsite
			blobID = 56547,
			mapID = 116, -- Grizzly Hills
			raceID = RaceID.ArchRaceTroll,
		},
		["113:0.315702:0.564494"] = {
			-- En'kilah Digsite
			blobID = 56522,
			siteID = 419,
			mapID = 114, -- Borean Tundra
			raceID = RaceID.ArchRaceNerubian,
		},
		["113:0.720065:0.671641"] = {
			-- Gjalerbron Digsite
			blobID = 56516,
			mapID = 117, -- Howling Fjord
			raceID = RaceID.ArchRaceVrykul,
		},
		["113:0.769018:0.816474"] = {
			-- Halgrind Digsite
			blobID = 56506,
			siteID = 403,
			mapID = 117, -- Howling Fjord
			raceID = RaceID.ArchRaceVrykul,
		},
		["113:0.282578:0.301614"] = {
			-- Jotunheim Digsite
			blobID = 56562,
			siteID = 457,
			mapID = 118, -- Icecrown
			raceID = RaceID.ArchRaceVrykul,
		},
		["113:0.722093:0.468586"] = {
			-- Kolramas Digsite
			blobID = 56524,
			siteID = 421,
			mapID = 121, -- Zul'Drak
			raceID = RaceID.ArchRaceNerubian,
		},
		["113:0.385894:0.611983"] = {
			-- Moonrest Gardens Digsite
			blobID = 56520,
			siteID = 417,
			mapID = 115, -- Dragonblight
			raceID = RaceID.ArchRaceNightElf,
		},
		["113:0.830704:0.815545"] = {
			-- Nifflevar Digsite
			blobID = 56514,
			mapID = 117, -- Howling Fjord
			raceID = RaceID.ArchRaceVrykul,
		},
		["113:0.315082:0.237731"] = {
			-- Njorndar Village Digsite
			blobID = 56564,
			siteID = 459,
			mapID = 118, -- Icecrown
			raceID = RaceID.ArchRaceVrykul,
		},
		["113:0.482337:0.286066"] = {
			-- Pit of Fiends Digsite
			blobID = 60367,
			siteID = 587,
			mapID = 118, -- Icecrown
			raceID = RaceID.ArchRaceNerubian,
		},
		["113:0.398569:0.584352"] = {
			-- Pit of Narjun Digsite
			blobID = 56518,
			siteID = 415,
			mapID = 115, -- Dragonblight
			raceID = RaceID.ArchRaceNerubian,
		},
		["113:0.194416:0.775830"] = {
			-- Riplash Ruins Digsite
			blobID = 56526,
			mapID = 114, -- Borean Tundra
			raceID = RaceID.ArchRaceNightElf,
		},
		["113:0.562049:0.441800"] = {
			-- Ruins of Shandaral Digsite
			blobID = 56530,
			mapID = 127, -- Crystalsong Forest
			raceID = RaceID.ArchRaceNightElf,
		},
		["113:0.207485:0.701216"] = {
			-- Sands of Nasam
			blobID = 60369,
			mapID = 114, -- Borean Tundra
			raceID = RaceID.ArchRaceNerubian,
		},
		["113:0.485548:0.323499"] = {
			-- Scourgeholme Digsite
			blobID = 56555,
			mapID = 118, -- Icecrown
			raceID = RaceID.ArchRaceNerubian,
		},
		["113:0.800847:0.902242"] = {
			-- Shield Hill Digsite
			blobID = 56510,
			siteID = 407,
			mapID = 117, -- Howling Fjord
			raceID = RaceID.ArchRaceVrykul,
		},
		["113:0.577766:0.319359"] = {
			-- Sifreldar Village Digsite
			blobID = 56551,
			mapID = 120, -- The Storm Peaks
			raceID = RaceID.ArchRaceVrykul,
		},
		["113:0.751386:0.735270"] = {
			-- Skorn Digsite
			blobID = 56504,
			siteID = 401,
			mapID = 117, -- Howling Fjord
			raceID = RaceID.ArchRaceVrykul,
		},
		["113:0.261171:0.528075"] = {
			-- Talramas Digsite
			blobID = 56541,
			mapID = 114, -- Borean Tundra
			raceID = RaceID.ArchRaceNerubian,
		},
		["113:0.514109:0.272545"] = {
			-- Valkyrion Digsite
			blobID = 56553,
			mapID = 120, -- The Storm Peaks
			raceID = RaceID.ArchRaceVrykul,
		},
		["113:0.462113:0.410957"] = {
			-- Violet Stand Digsite
			blobID = 56528,
			mapID = 127, -- Crystalsong Forest
			raceID = RaceID.ArchRaceNightElf,
		},
		["113:0.666998:0.651107"] = {
			-- Voldrune Digsite
			blobID = 56543,
			mapID = 116, -- Grizzly Hills
			raceID = RaceID.ArchRaceVrykul,
		},
		["113:0.796509:0.809038"] = {
			-- Wyrmskull Digsite
			blobID = 56508,
			mapID = 117, -- Howling Fjord
			raceID = RaceID.ArchRaceVrykul,
		},
		["113:0.413722:0.301191"] = {
			-- Ymirheim Digsite
			blobID = 56560,
			mapID = 118, -- Icecrown
			raceID = RaceID.ArchRaceVrykul,
		},
		["113:0.719783:0.370312"] = {
			-- Zim'Rhuk Digsite
			blobID = 56535,
			siteID = 431,
			mapID = 121, -- Zul'Drak
			raceID = RaceID.ArchRaceTroll,
		},
		["113:0.771722:0.348849"] = {
			-- Zol'Heb Digsite
			blobID = 56537,
			siteID = 433,
			mapID = 121, -- Zul'Drak
			raceID = RaceID.ArchRaceTroll,
		},
		
		-- ----------------------------------------------------------------------------
		-- Pandaria
		-- ----------------------------------------------------------------------------
		["424::0.270692:0.822365"] = {
			-- Amber Quarry Digsite
			blobID = 177517,
			siteID = 1495,
			mapID = 422, -- Dread Wastes
			raceID = RaceID.ArchRaceMantid,
		},
		["424::0.491570:0.453632"] = {
			-- Chow Farmstead Digsite
			blobID = 66987,
			mapID = 379, -- Kun-Lai Summit
			raceID = RaceID.ArchRacePandaren,
		},
		["424::0.764011:0.661878"] = {
			-- Den of Sorrow Digsite
			blobID = 67035,
			siteID = 1047,
			mapID = 371, -- The Jade Forest
			raceID = RaceID.ArchRacePandaren,
		},
		["424::0.542101:0.327176"] = {
			-- Destroyed Village Digsite
			blobID = 66979,
			siteID = 1015,
			mapID = 379, -- Kun-Lai Summit
			raceID = RaceID.ArchRacePandaren,
		},
		["424::0.411391:0.317218"] = {
			-- East Snow Covered Hills Digsite
			blobID = 66971,
			siteID = 1009,
			mapID = 379, -- Kun-Lai Summit
			raceID = RaceID.ArchRaceMogu,
		},
		["424::0.199987:0.382090"] = {
			-- East Sra'vess Digsite
			blobID = 177495,
			siteID = 1473,
			mapID = 388, -- Townlong Steppes
			raceID = RaceID.ArchRaceMantid,
		},
		["424::0.551060:0.536969"] = {
			-- East Summer Fields Digsite
			blobID = 92166,
			siteID = 1326,
			mapID = 1530, -- Vale of Eternal Blossoms
			raceID = RaceID.ArchRaceMogu,
		},
		["424::0.483578:0.549441"] = {
			-- Emperor's Approach Digsite
			blobID = 92156,
			siteID = 1318,
			mapID = 1530, -- Vale of Eternal Blossoms
			raceID = RaceID.ArchRaceMogu,
		},
		["424::0.699043:0.406936"] = {
			-- Emperor's Omen Digsite
			blobID = 66817,
			siteID = 936,
			mapID = 371, -- The Jade Forest
			raceID = RaceID.ArchRacePandaren,
		},
		["424::0.461858:0.762617"] = {
			-- Fallsong Village Digsite
			blobID = 66943,
			siteID = 981,
			mapID = 418, -- Krasarang Wilds
			raceID = RaceID.ArchRaceMogu,
		},
		["424::0.348808:0.361787"] = {
			-- Fire Camp Osul Digsite
			blobID = 92178,
			siteID = 1338,
			mapID = 388, -- Townlong Steppes
			raceID = RaceID.ArchRaceMogu,
		},
		["424::0.431952:0.535132"] = {
			-- Five Sisters Digsite
			blobID = 92026,
			siteID = 1288,
			mapID = 1530, -- Vale of Eternal Blossoms
			raceID = RaceID.ArchRacePandaren,
		},
		["424::0.677516:0.454985"] = {
			-- Forest Heart Digsite
			blobID = 67021,
			siteID = 1033,
			mapID = 371, -- The Jade Forest
			raceID = RaceID.ArchRacePandaren,
		},
		["424::0.476553:0.470454"] = {
			-- Gate to Golden Valley Digsite
			blobID = 66967,
			siteID = 1005,
			mapID = 379, -- Kun-Lai Summit
			raceID = RaceID.ArchRaceMogu,
		},
		["424::0.648512:0.473161"] = {
			-- Gong of Hope Digsite
			blobID = 67023,
			siteID = 1035,
			mapID = 371, -- The Jade Forest
			raceID = RaceID.ArchRacePandaren,
		},
		["424::0.699365:0.539386"] = {
			-- Great Bridge Digsite
			blobID = 67025,
			siteID = 1037,
			mapID = 371, -- The Jade Forest
			raceID = RaceID.ArchRacePandaren,
		},
		["424::0.533722:0.384700"] = {
			-- Grumblepaw Ranch Digsite
			blobID = 66985,
			siteID = 1019,
			mapID = 379, -- Kun-Lai Summit
			raceID = RaceID.ArchRacePandaren,
		},
		["424::0.401724:0.458466"] = {
			-- Hatred's Vice Digsite
			blobID = 92180,
			mapID = 388, -- Townlong Steppes
			raceID = RaceID.ArchRaceMogu,
		},
		["424::0.173239:0.353570"] = {
			-- Ikz'ka Ridge Digsite
			blobID = 177501,
			siteID = 1479,
			mapID = 388, -- Townlong Steppes
			raceID = RaceID.ArchRaceMantid,
		},
		["424::0.713803:0.558142"] = {
			-- Jade Temple Grounds Digsite
			blobID = 67031,
			siteID = 1043,
			mapID = 371, -- The Jade Forest
			raceID = RaceID.ArchRacePandaren,
		},
		["424::0.327668:0.556981"] = {
			-- Kor'vess Digsite
			blobID = 177485,
			siteID = 1463,
			mapID = 422, -- Dread Wastes
			raceID = RaceID.ArchRaceMantid,
		},
		["424::0.508972:0.783500"] = {
			-- Krasarang Wilds Digsite
			blobID = 66949,
			siteID = 987,
			mapID = 418, -- Krasarang Wilds
			raceID = RaceID.ArchRaceMogu,
		},
		["424::0.427118:0.300203"] = {
			-- Kun-Lai Peak Digsite
			blobID = 67005,
			siteID = 1029,
			mapID = 379, -- Kun-Lai Summit
			raceID = RaceID.ArchRacePandaren,
		},
		["424::0.386190:0.573030"] = {
			-- Kypari Vor Digsite
			blobID = 177529,
			siteID = 1507,
			mapID = 422, -- Dread Wastes
			raceID = RaceID.ArchRaceMantid,
		},
		["424::0.348228:0.689528"] = {
			-- Kypari'ik Digsite
			blobID = 177511,
			siteID = 1489,
			mapID = 422, -- Dread Wastes
			raceID = RaceID.ArchRaceMantid,
		},
		["424::0.368079:0.720659"] = {
			-- Kypari'zar Digsite
			blobID = 177523,
			siteID = 1501,
			mapID = 422, -- Dread Wastes
			raceID = RaceID.ArchRaceMantid,
		},
		["424::0.201470:0.411287"] = {
			-- Kzzok Warcamp Digsite
			blobID = 177493,
			siteID = 1471,
			mapID = 388, -- Townlong Steppes
			raceID = RaceID.ArchRaceMantid,
		},
		["424::0.387673:0.691752"] = {
			-- Lake of Stars Digsite
			blobID = 177525,
			siteID = 1503,
			mapID = 422, -- Dread Wastes
			raceID = RaceID.ArchRaceMantid,
		},
		["424::0.400886:0.725589"] = {
			-- Lake of Stars Digsite
			blobID = 92200,
			mapID = 422, -- Dread Wastes
			raceID = RaceID.ArchRaceMogu,
		},
		["424::0.578517:0.720755"] = {
			-- Lost Dynasty Digsite
			blobID = 66951,
			siteID = 989,
			mapID = 418, -- Krasarang Wilds
			raceID = RaceID.ArchRaceMogu,
		},
		["424::0.465918:0.571773"] = {
			-- Mistfall Village Digsite
			blobID = 92022,
			siteID = 1286,
			mapID = 1530, -- Vale of Eternal Blossoms
			raceID = RaceID.ArchRacePandaren,
		},
		["424::0.240334:0.430719"] = {
			-- Niuzao Temple Digsite
			blobID = 92174,
			mapID = 388, -- Townlong Steppes
			raceID = RaceID.ArchRacePandaren,
		},
		["424::0.481258:0.635775"] = {
			-- North Fruited Fields Digsite
			blobID = 66935,
			siteID = 973,
			mapID = 376, -- Valley of the Four Winds
			raceID = RaceID.ArchRacePandaren,
		},
		["424::0.416677:0.658881"] = {
			-- North Great Wall Digsite
			blobID = 66919,
			siteID = 957,
			mapID = 376, -- Valley of the Four Winds
			raceID = RaceID.ArchRaceMogu,
		},
		["424::0.542874:0.753626"] = {
			-- North Ruins of Dojan Digsite
			blobID = 92212,
			siteID = 1358,
			mapID = 418, -- Krasarang Wilds
			raceID = RaceID.ArchRaceMogu,
		},
		["424::0.457153:0.499651"] = {
			-- North Ruins of Guo-Lai Digsite
			blobID = 92030,
			siteID = 1292,
			mapID = 1530, -- Vale of Eternal Blossoms
			raceID = RaceID.ArchRaceMogu,
		},
		["424::0.268307:0.503905"] = {
			-- North Sik'vess Digsite
			blobID = 177507,
			siteID = 1485,
			mapID = 388, -- Townlong Steppes
			raceID = RaceID.ArchRaceMantid,
		},
		["424::0.543326:0.520630"] = {
			-- North Summer Fields Digsite
			blobID = 92162,
			siteID = 1322,
			mapID = 1530, -- Vale of Eternal Blossoms
			raceID = RaceID.ArchRaceMogu,
		},
		["424::0.502334:0.809603"] = {
			-- North Temple of the Red Crane Digsite
			blobID = 66957,
			siteID = 995,
			mapID = 418, -- Krasarang Wilds
			raceID = RaceID.ArchRacePandaren,
		},
		["424::0.537138:0.465717"] = {
			-- Old Village Digsite
			blobID = 66983,
			siteID = 1017,
			mapID = 379, -- Kun-Lai Summit
			raceID = RaceID.ArchRacePandaren,
		},
		["424::0.723793:0.507965"] = {
			-- Orchard Digsite
			blobID = 67027,
			siteID = 1039,
			mapID = 371, -- The Jade Forest
			raceID = RaceID.ArchRacePandaren,
		},
		["424::0.432596:0.623013"] = {
			-- Paoquan Hollow Digsite
			blobID = 66933,
			mapID = 376, -- Valley of the Four Winds
			raceID = RaceID.ArchRacePandaren,
		},
		["424::0.552929:0.604934"] = {
			-- Pools of Purity Digsite
			blobID = 66941,
			siteID = 979,
			mapID = 376, -- Valley of the Four Winds
			raceID = RaceID.ArchRacePandaren,
		},
		["424::0.503365:0.234751"] = {
			-- Remote Village Digsite
			blobID = 66973,
			mapID = 379, -- Kun-Lai Summit
			raceID = RaceID.ArchRacePandaren,
		},
		["424::0.669073:0.360724"] = {
			-- Ruins of Gan Shi Digsite
			blobID = 66795,
			siteID = 934,
			mapID = 371, -- The Jade Forest
			raceID = RaceID.ArchRaceMogu,
		},
		["424::0.444907:0.792974"] = {
			-- Ruins of Korja Digsite
			blobID = 66945,
			siteID = 983,
			mapID = 418, -- Krasarang Wilds
			raceID = RaceID.ArchRaceMogu,
		},
		["424::Setting Sun Garrison Digsite"] = {
			-- NEEDS UPDATE
			blobID = 92020,
			mapID = 1530, -- Vale of Eternal Blossoms
			raceID = RaceID.ArchRaceMogu,
		},
		["424::0.225768:0.253507"] = {
			-- Shanze'Dao Digsite
			blobID = 92196,
			siteID = 1342,
			mapID = 388, -- Townlong Steppes
			raceID = RaceID.ArchRaceMogu,
		},
		["424::Shrine Meadow Digsite"] = {
			-- NEEDS UPDATE
			blobID = 67037,
			mapID = 371, -- The Jade Forest
			raceID = RaceID.ArchRacePandaren,
		},
		["424::0.709484:0.457596"] = {
			-- Shrine of the Dawn Digsite
			blobID = 66789,
			siteID = 928,
			mapID = 371, -- The Jade Forest
			raceID = RaceID.ArchRacePandaren,
		},
		["424::0.283582:0.508255"] = {
			-- Sik'vess Digsite
			blobID = 177503,
			siteID = 1481,
			mapID = 388, -- Townlong Steppes
			raceID = RaceID.ArchRaceMantid,
		},
		["424::0.454188:0.654820"] = {
			-- Singing Marshes Digsite
			blobID = 66917,
			siteID = 955,
			mapID = 376, -- Valley of the Four Winds
			raceID = RaceID.ArchRaceMogu,
		},
		["424::0.376523:0.352313"] = {
			-- Small Gate Digsite
			blobID = 66991,
			mapID = 379, -- Kun-Lai Summit
			raceID = RaceID.ArchRacePandaren,
		},
		["424::0.398888:0.323212"] = {
			-- Snow Covered Hills Digsite
			blobID = 66969,
			siteID = 1007,
			mapID = 379, -- Kun-Lai Summit
			raceID = RaceID.ArchRaceMogu,
		},
		["424::0.473330:0.672319"] = {
			-- South Fruited Fields Digsite
			blobID = 66939,
			mapID = 376, -- Valley of the Four Winds
			raceID = RaceID.ArchRacePandaren,
		},
		["424::0.414292:0.711184"] = {
			-- South Great Wall Digsite
			blobID = 66923,
			siteID = 961,
			mapID = 376, -- Valley of the Four Winds
			raceID = RaceID.ArchRaceMogu,
		},
		["424::0.673584:0.621660"] = {
			-- South Orchard Digsite
			blobID = 67033,
			siteID = 1045,
			mapID = 371, -- The Jade Forest
			raceID = RaceID.ArchRacePandaren,
		},
		["424::0.539201:0.771318"] = {
			-- South Ruins of Dojan Digsite
			blobID = 92210,
			siteID = 1356,
			mapID = 418, -- Krasarang Wilds
			raceID = RaceID.ArchRaceMogu,
		},
		["424::0.441168:0.523821"] = {
			-- South Ruins of Guo-Lai Digsite
			blobID = 92032,
			siteID = 1294,
			mapID = 1530, -- Vale of Eternal Blossoms
			raceID = RaceID.ArchRaceMogu,
		},
		["424::0.266695:0.405293"] = {
			-- Sra'thik Digsite
			blobID = 92172,
			siteID = 1332,
			mapID = 388, -- Townlong Steppes
			raceID = RaceID.ArchRacePandaren,
		},
		["424::0.201792:0.347865"] = {
			-- Sra'thik Swarmdock Digsite
			blobID = 177487,
			siteID = 1465,
			mapID = 388, -- Townlong Steppes
			raceID = RaceID.ArchRaceMantid,
		},
		["424::0.422993:0.580378"] = {
			-- Terrace of Gurthan Digsite
			blobID = 92202,
			siteID = 1348,
			mapID = 422, -- Dread Wastes
			raceID = RaceID.ArchRaceMogu,
		},
		["424::0.707937:0.493077"] = {
			-- The Arboretum Digsite
			blobID = 66854,
			siteID = 938,
			mapID = 371, -- The Jade Forest
			raceID = RaceID.ArchRacePandaren,
		},
		["424::0.303305:0.752369"] = {
			-- The Briny Muck Digsite
			blobID = 177519,
			siteID = 1497,
			mapID = 422, -- Dread Wastes
			raceID = RaceID.ArchRaceMantid,
		},
		["424::0.333984:0.637128"] = {
			-- The Clutches of Shek'zeer Digsite
			blobID = 177509,
			mapID = 422, -- Dread Wastes
			raceID = RaceID.ArchRaceMantid,
		},
		["424::0.179233:0.413704"] = {
			-- The Feeding Pits Digsite
			blobID = 177491,
			siteID = 1469,
			mapID = 388, -- Townlong Steppes
			raceID = RaceID.ArchRaceMantid,
		},
		["424::0.574327:0.555338"] = {
			-- The Spring Road Digsite
			blobID = 66929,
			siteID = 967,
			mapID = 433, -- The Veiled Stair
			raceID = RaceID.ArchRaceMogu,
		},
		["424::0.328699:0.412060"] = {
			-- The Underbough Digsite
			blobID = 177497,
			siteID = 1475,
			mapID = 388, -- Townlong Steppes
			raceID = RaceID.ArchRaceMantid,
		},
		["424::0.651284:0.629684"] = {
			-- Thunderwood Digsite
			blobID = 66890,
			siteID = 941,
			mapID = 371, -- The Jade Forest
			raceID = RaceID.ArchRaceMogu,
		},
		["424::0.655344:0.401909"] = {
			-- Tian Digsite
			blobID = 66784,
			siteID = 923,
			mapID = 371, -- The Jade Forest
			raceID = RaceID.ArchRacePandaren,
		},
		["424::0.611130:0.476351"] = {
			-- Tiger's Wood Digsite
			blobID = 66767,
			siteID = 918,
			mapID = 371, -- The Jade Forest
			raceID = RaceID.ArchRacePandaren,
		},
		["424::0.439686:0.734000"] = {
			-- Torjari Pit Digsite
			blobID = 66925,
			siteID = 963,
			mapID = 376, -- Valley of the Four Winds
			raceID = RaceID.ArchRaceMogu,
		},
		["424::0.484545:0.569260"] = {
			-- Tu Shen Digsite
			blobID = 92038,
			siteID = 1300,
			mapID = 1530, -- Vale of Eternal Blossoms
			raceID = RaceID.ArchRaceMogu,
		},
		["424::0.479647:0.294692"] = {
			-- Valley of Kings Digsite
			blobID = 66965,
			siteID = 1003,
			mapID = 379, -- Kun-Lai Summit
			raceID = RaceID.ArchRaceMogu,
		},
		["424::0.261346:0.655980"] = {
			-- Venomous Ledge Digsite
			blobID = 177515,
			siteID = 1493,
			mapID = 422, -- Dread Wastes
			raceID = RaceID.ArchRaceMantid,
		},
		["424::Veridian Grove Digsite"] = {
			-- NEEDS UPDATE
			blobID = 67039,
			mapID = 371, -- The Jade Forest
			raceID = RaceID.ArchRacePandaren,
		},
		["424::West Old Village Digsite"] = {
			-- NEEDS UPDATE
			blobID = 66989,
			mapID = 379, -- Kun-Lai Summit
			raceID = RaceID.ArchRacePandaren,
		},
		["424::0.442844:0.504195"] = {
			-- West Ruins of Guo-Lai Digsite
			blobID = 92046,
			siteID = 1308,
			mapID = 1530, -- Vale of Eternal Blossoms
			raceID = RaceID.ArchRaceMogu,
		},
		["424::0.261539:0.516763"] = {
			-- West Sik'vess Digsite
			blobID = 177505,
			siteID = 1483,
			mapID = 388, -- Townlong Steppes
			raceID = RaceID.ArchRaceMantid,
		},
		["424::0.177107:0.393594"] = {
			-- West Sra'vess Digsite
			blobID = 177489,
			siteID = 1467,
			mapID = 388, -- Townlong Steppes
			raceID = RaceID.ArchRaceMantid,
		},
		["424::0.451481:0.551857"] = {
			-- Winterbough Digsite
			blobID = 92150,
			mapID = 390, -- Vale of Eternal Blossoms
			raceID = RaceID.ArchRaceMogu,
		},
		["424::0.398952:0.659654"] = {
			-- Writhingwood Digsite
			blobID = 92206,
			siteID = 1352,
			mapID = 422, -- Dread Wastes
			raceID = RaceID.ArchRaceMogu,
		},
		["424::0.250325:0.757590"] = {
			-- Zan'vess Digsite
			blobID = 177513,
			siteID = 1491,
			mapID = 422, -- Dread Wastes
			raceID = RaceID.ArchRaceMantid,
		},
		["424::0.601140:0.688851"] = {
			-- Zhu Province Digsite
			blobID = 66961,
			siteID = 999,
			mapID = 418, -- Krasarang Wilds
			raceID = RaceID.ArchRacePandaren,
		},
		
		-- ----------------------------------------------------------------------------
		-- Draenor
		-- ----------------------------------------------------------------------------
		["572:0.225739:0.548585"] = {
			-- Ancestral Grounds Digsite
			blobID = 307987,
			mapID = 550, -- Nagrand
			raceID = RaceID.ArchRaceDraenorOrc,
		},
		["572:0.389797:0.665823"] = {
			-- Ango'rosh Digsite
			blobID = 307971,
			siteID = 1786,
			mapID = 535, -- Talador
			raceID = RaceID.ArchRaceOgre,
		},
		["572:0.524607:0.664305"] = {
			-- Anguish Fortress Digsite
			blobID = 307928,
			siteID = 1744,
			mapID = 539, -- Shadowmoon Valley
			raceID = RaceID.ArchRaceDraenorOrc,
		},
		["572:0.427447:0.718207"] = {
			-- Apexis Excavation Digsite
			blobID = 307958,
			siteID = 1774,
			mapID = 542, -- Spires of Arak
			raceID = RaceID.ArchRaceArakkoa,
		},
		["572:0.453309:0.823504"] = {
			-- Bloodmane Pridelands Digsite
			blobID = 307950,
			siteID = 1766,
			mapID = 542, -- Spires of Arak
			raceID = RaceID.ArchRaceArakkoa,
		},
		["572:0.464349:0.806878"] = {
			-- Bloodmane Valley Digsite
			blobID = 307954,
			siteID = 1770,
			mapID = 542, -- Spires of Arak
			raceID = RaceID.ArchRaceArakkoa,
		},
		["572:0.568634:0.746906"] = {
			-- Burial Fields Digsite
			blobID = 307926,
			mapID = 539, -- Shadowmoon Valley
			raceID = RaceID.ArchRaceDraenorOrc,
		},
		["572:0.295101:0.439066"] = {
			-- Burning Plateau Digsite
			blobID = 307997,
			siteID = 1812,
			mapID = 550, -- Nagrand
			raceID = RaceID.ArchRaceDraenorOrc,
		},
		["572:0.354214:0.244702"] = {
			-- Coldsnap Bluffs Digsite
			blobID = 307922,
			siteID = 1738,
			mapID = 525, -- Frostfire Ridge
			raceID = RaceID.ArchRaceDraenorOrc,
		},
		["572:0.502351:0.612515"] = {
			-- Cursed Woods Digsite
			blobID = 307930,
			siteID = 1746,
			mapID = 539, -- Shadowmoon Valley
			raceID = RaceID.ArchRaceDraenorOrc,
		},
		["572:0.301478:0.231573"] = {
			-- Daggermaw Flows Digsite
			blobID = 264227,
			siteID = 1685,
			mapID = 525, -- Frostfire Ridge
			raceID = RaceID.ArchRaceDraenorOrc,
		},
		["572:0.458060:0.365833"] = {
			-- Deadgrin Ruins Digsite
			blobID = 308005,
			siteID = 1820,
			mapID = 543, -- Gorgrond
			raceID = RaceID.ArchRaceDraenorOrc,
		},
		["572:0.316213:0.441111"] = {
			-- Drowning Plateau Digsite
			blobID = 307995,
			siteID = 1810,
			mapID = 550, -- Nagrand
			raceID = RaceID.ArchRaceDraenorOrc,
		},
		["572:0.461974:0.588764"] = {
			-- Duskfall Island Digsite
			blobID = 307964,
			siteID = 1780,
			mapID = 535, -- Talador
			raceID = RaceID.ArchRaceOgre,
		},
		["572:0.378317:0.236851"] = {
			-- East Coldsnap Bluffs Digsite
			blobID = 307920,
			siteID = 1736,
			mapID = 525, -- Frostfire Ridge
			raceID = RaceID.ArchRaceDraenorOrc,
		},
		["572:0.370268:0.595823"] = {
			-- Forgotten Ogre Ruin Digsite
			blobID = 307973,
			siteID = 1788,
			mapID = 535, -- Talador
			raceID = RaceID.ArchRaceOgre,
		},
		["572:0.242496:0.327765"] = {
			-- Frostboar Drifts Digsite
			blobID = 307916,
			siteID = 1732,
			mapID = 525, -- Frostfire Ridge
			raceID = RaceID.ArchRaceDraenorOrc,
		},
		["572:0.316872:0.343533"] = {
			-- Frostwind Crag Digsite
			blobID = 264237,
			mapID = 525, -- Frostfire Ridge
			raceID = RaceID.ArchRaceDraenorOrc,
		},
		["572:0.276847:0.342082"] = {
			-- Frozen Lake Digsite
			blobID = 264223,
			mapID = 525, -- Frostfire Ridge
			raceID = RaceID.ArchRaceDraenorOrc,
		},
		["572:0.559706:0.645238"] = {
			-- Gloomshade Digsite
			blobID = 307940,
			mapID = 539, -- Shadowmoon Valley
			raceID = RaceID.ArchRaceDraenorOrc,
		},
		["572:0.465053:0.648471"] = {
			-- Gordal Fortress Digsite
			blobID = 307960,
			siteID = 1776,
			mapID = 535, -- Talador
			raceID = RaceID.ArchRaceOgre,
		},
		["572:0.363583:0.375729"] = {
			-- Grom'gar Digsite
			blobID = 264233,
			siteID = 1691,
			mapID = 525, -- Frostfire Ridge
			raceID = RaceID.ArchRaceDraenorOrc,
		},
		["572:0.287140:0.497124"] = {
			-- Highmaul Watchtower Digsite
			blobID = 308001,
			siteID = 1816,
			mapID = 550, -- Nagrand
			raceID = RaceID.ArchRaceOgre,
		},
		["572:0.327604:0.471064"] = {
			-- Howling Plateau Digsite
			blobID = 307991,
			siteID = 1806,
			mapID = 550, -- Nagrand
			raceID = RaceID.ArchRaceDraenorOrc,
		},
		["572:0.374623:0.316286"] = {
			-- Icewind Drifts Digsite
			blobID = 307918,
			siteID = 1734,
			mapID = 525, -- Frostfire Ridge
			raceID = RaceID.ArchRaceDraenorOrc,
		},
		["572:0.258154:0.586718"] = {
			-- Kag'ah Digsite
			blobID = 307985,
			siteID = 1800,
			mapID = 550, -- Nagrand
			raceID = RaceID.ArchRaceDraenorOrc,
		},
		["572:0.275440:0.244834"] = {
			-- Lashwind Cleft Digsite
			blobID = 264229,
			siteID = 1687,
			mapID = 525, -- Frostfire Ridge
			raceID = RaceID.ArchRaceDraenorOrc,
		},
		["572:0.328220:0.587840"] = {
			-- Mar'gok's Overwatch Digsite
			blobID = 308003,
			siteID = 1818,
			mapID = 550, -- Nagrand
			raceID = RaceID.ArchRaceOgre,
		},
		["572:0.247247:0.557029"] = {
			-- North Spirit Woods Digsite
			blobID = 307983,
			siteID = 1798,
			mapID = 550, -- Nagrand
			raceID = RaceID.ArchRaceDraenorOrc,
		},
		["572:0.266863:0.472119"] = {
			-- Overgrown Highmaul Road Digsite
			blobID = 307977,
			mapID = 550, -- Nagrand
			raceID = RaceID.ArchRaceOgre,
		},
		["572:0.500724:0.364250"] = {
			-- Overlook Ruins Digsite
			blobID = 308011,
			mapID = 543, -- Gorgrond
			raceID = RaceID.ArchRaceOgre,
		},
		["572:0.474949:0.867443"] = {
			-- Pinchwhistle Point Digsite
			blobID = 307952,
			siteID = 1768,
			mapID = 542, -- Spires of Arak
			raceID = RaceID.ArchRaceArakkoa,
		},
		["572:0.303194:0.521007"] = {
			-- Razed Warsong Outpost Digsite
			blobID = 307979,
			siteID = 1794,
			mapID = 550, -- Nagrand
			raceID = RaceID.ArchRaceDraenorOrc,
		},
		["572:0.317620:0.529452"] = {
			-- Ring of Trials Sludge Digsite
			blobID = 307989,
			siteID = 1804,
			mapID = 550, -- Nagrand
			raceID = RaceID.ArchRaceDraenorOrc,
		},
		["572:0.254680:0.512232"] = {
			-- Ruins of Na'gwa Digsite
			blobID = 307975,
			mapID = 550, -- Nagrand
			raceID = RaceID.ArchRaceOgre,
		},
		["572:0.498524:0.393081"] = {
			-- Ruins of the First Bastion Digsite
			blobID = 308015,
			mapID = 543, -- Gorgrond
			raceID = RaceID.ArchRaceOgre,
		},
		["572:0.329540:0.452525"] = {
			-- Rumbling Plateau Digsite
			blobID = 307993,
			siteID = 1808,
			mapID = 550, -- Nagrand
			raceID = RaceID.ArchRaceDraenorOrc,
		},
		["572:0.499360:0.749875"] = {
			-- Sethekk Hollow North Digsite
			blobID = 307944,
			siteID = 1760,
			mapID = 542, -- Spires of Arak
			raceID = RaceID.ArchRaceArakkoa,
		},
		["572:0.513303:0.773231"] = {
			-- Sethekk Hollow South Digsite
			blobID = 307942,
			siteID = 1758,
			mapID = 542, -- Spires of Arak
			raceID = RaceID.ArchRaceArakkoa,
		},
		["572:0.549413:0.767359"] = {
			-- Shaz'gul Digsite
			blobID = 307924,
			siteID = 1740,
			mapID = 539, -- Shadowmoon Valley
			raceID = RaceID.ArchRaceDraenorOrc,
		},
		["572:0.617544:0.762938"] = {
			-- Shimmering Moor Digsite
			blobID = 307936,
			siteID = 1752,
			mapID = 539, -- Shadowmoon Valley
			raceID = RaceID.ArchRaceArakkoa,
		},
		["572:0.380517:0.407529"] = {
			-- Southwind Cliffs Digsite
			blobID = 308018,
			siteID = 1832,
			mapID = 525, -- Frostfire Ridge
			raceID = RaceID.ArchRaceDraenorOrc,
		},
		["572:0.291098:0.541459"] = {
			-- Stonecrag Excavation Digsite
			blobID = 307981,
			mapID = 550, -- Nagrand
			maxFindCount = 13,
			raceID = RaceID.ArchRaceOgre,
		},
		["572:0.474597:0.356333"] = {
			-- The Broken Spine Digsite
			blobID = 308007,
			siteID = 1822,
			mapID = 543, -- Gorgrond
			raceID = RaceID.ArchRaceOgre,
		},
		["572:0.357337:0.290951"] = {
			-- The Crackling Plains Digsite
			blobID = 264231,
			siteID = 1689,
			mapID = 525, -- Frostfire Ridge
			raceID = RaceID.ArchRaceDraenorOrc,
		},
		["572:0.597795:0.623269"] = {
			-- Umbrafen Digsite
			blobID = 307934,
			siteID = 1750,
			mapID = 539, -- Shadowmoon Valley
			raceID = RaceID.ArchRaceOgre,
		},
		["572:0.447328:0.711148"] = {
			-- Veil Akraz Digsite
			blobID = 307946,
			siteID = 1762,
			mapID = 542, -- Spires of Arak
			raceID = RaceID.ArchRaceArakkoa,
		},
		["572:0.483174:0.606907"] = {
			-- Veil Shadar Digsite
			blobID = 307962,
			siteID = 1778,
			mapID = 535, -- Talador
			raceID = RaceID.ArchRaceArakkoa,
		},
		["572:0.492235:0.796520"] = {
			-- Veil Zekk Digsite
			blobID = 307956,
			mapID = 542, -- Spires of Arak
			raceID = RaceID.ArchRaceArakkoa,
		},
		["572:0.522232:0.293722"] = {
			-- Wildwood Wash Dam Digsite
			blobID = 308013,
			siteID = 1828,
			mapID = 543, -- Gorgrond
			raceID = RaceID.ArchRaceOgre,
		},
		["572:0.266599:0.371771"] = {
			-- Wor'gol Ridge Digsite
			blobID = 264225,
			siteID = 1683,
			mapID = 525, -- Frostfire Ridge
			raceID = RaceID.ArchRaceDraenorOrc,
		},
		["572:0.418738:0.766039"] = {
			-- Writhing Mire Digsite
			blobID = 307948,
			siteID = 1764,
			mapID = 542, -- Spires of Arak
			raceID = RaceID.ArchRaceOgre,
		},
		["572:0.499096:0.520875"] = {
			-- Zangarra Digsite
			blobID = 307966,
			siteID = 1782,
			mapID = 535, -- Talador
			raceID = RaceID.ArchRaceOgre,
		},
		
		-- ----------------------------------------------------------------------------
		-- Broken Isles
		-- ----------------------------------------------------------------------------
		["619:0.575008:0.301631"] = {
			-- Digsite: Aggramar's Vault
			blobID = 346440,
			siteID = 1880,
			mapID = 634, -- Stormheim
			raceID = RaceID.ArchRaceDemons,
		},
		["619:0.574158:0.341444"] = {
			-- Digsite: Amberfall Mesa
			blobID = 353961,
			siteID = 1939,
			mapID = 634, -- Stormheim
			raceID = RaceID.ArchRaceDemons,
		},
		["619:0.385605:0.348530"] = {
			-- Digsite: Andu'talah
			blobID = 346508,
			siteID = 1900,
			mapID = 641, -- Val'sharah
			raceID = RaceID.ArchRaceHighborneNightElves,
		},
		["619:0.461090:0.417884"] = {
			-- Digsite: Anora Hollow
			blobID = 363064,
			siteID = 2049,
			mapID = 680, -- Suramar
			raceID = RaceID.ArchRaceDemons,
		},
		["619:0.401371:0.295898"] = {
			-- Digsite: Ashmane's Fall
			blobID = 354089,
			siteID = 2002,
			mapID = 641, -- Val'sharah
			raceID = RaceID.ArchRaceHighborneNightElves,
		},
		["619:0.298442:0.338099"] = {
			-- Digsite: Black Rook Hold
			blobID = 354080,
			siteID = 1998,
			mapID = 641, -- Val'sharah
			raceID = RaceID.ArchRaceHighborneNightElves,
		},
		["619:0.459232:0.148113"] = {
			-- Digsite: Bloodhunt Highland
			blobID = 353983,
			siteID = 1957,
			mapID = 650, -- Highmountain
			raceID = RaceID.ArchRaceHighmountainTauren,
		},
		["619:0.291329:0.359200"] = {
			-- Digsite: Bradensbrook
			blobID = 346502,
			siteID = 1894,
			mapID = 641, -- Val'sharah,
			raceID = RaceID.ArchRaceHighborneNightElves,
		},
		["619:0.658986:0.340886"] = {
			-- Digsite: Citrine Bay
			blobID = 353967,
			siteID = 1945,
			mapID = 634, -- Stormheim
			raceID = RaceID.ArchRaceDemons,
		},
		["619:0.593003:0.399809"] = {
			-- Digsite: Cliffpaw Ridge
			blobID = 353970,
			siteID = 1947,
			mapID = 634, -- Stormheim
			raceID = RaceID.ArchRaceDemons,
		},
		["619:0.534983:0.435322"] = {
			-- Digsite: Crimson Thicket
			blobID = 363027,
			siteID = 2045,
			mapID = 680, -- Suramar
			raceID = RaceID.ArchRaceHighborneNightElves,
		},
		["619:0.543476:0.479594"] = {
			-- Digsite: Crimson Thicket
			blobID = 363060,
			mapID = 680, -- Suramar
			raceID = RaceID.ArchRaceDemons,
		},
		["619:0.473618:0.188563"] = {
			-- Digsite: Darkfeather Valley
			blobID = 353987,
			siteID = 1961,
			mapID = 650, -- Highmountain
			raceID = RaceID.ArchRaceHighmountainTauren,
		},
		["619:0.505627:0.296137"] = {
			-- Digsite: Dragon's Falls
			blobID = 353993,
			siteID = 1967,
			mapID = 650, -- Highmountain
			raceID = RaceID.ArchRaceHighmountainTauren,
		},
		["619:0.371007:0.306647"] = {
			-- Digsite: Dreadroot
			blobID = 354251,
			siteID = 2017,
			mapID = 641, -- Val'sharah,
			raceID = RaceID.ArchRaceDemons,
		},
		["619:0.427701:0.432854"] = {
			-- Digsite: Eastern Ambervale
			blobID = 363017,
			siteID = 2027,
			mapID = 680, -- Suramar
			raceID = RaceID.ArchRaceHighborneNightElves,
		},
		["619:0.631011:0.303383"] = {
			-- Digsite: Fallen Kings
			blobID = 353965,
			siteID = 1943,
			mapID = 634, -- Stormheim
			raceID = RaceID.ArchRaceDemons,
		},
		["619:0.399354:0.506587"] = {
			-- Digsite: Farondale
			blobID = 354020,
			siteID = 1971,
			mapID = 630, -- Azsuna
			raceID = RaceID.ArchRaceDemons,
		},
		["619:0.405724:0.383008"] = {
			-- Digsite: Feathermane Hunting Grounds
			blobID = 346527,
			siteID = 1910,
			mapID = 680, -- Suramar
			raceID = RaceID.ArchRaceDemons,
		},
		["619:0.440175:0.528006"] = {
			-- Digsite: Felsoul Hold
			blobID = 363056,
			siteID = 2041,
			mapID = 680, -- Suramar
			raceID = RaceID.ArchRaceDemons,
		},
		["619:0.425896:0.184582"] = {
			-- Digsite: Fields of An'she
			blobID = 346475,
			siteID = 1888,
			mapID = 650, -- Highmountain
			raceID = RaceID.ArchRaceHighmountainTauren,
		},
		["619:0.378757:0.617903"] = {
			-- Digsite: Garden of Elune
			blobID = 354033,
			siteID = 1984,
			mapID = 630, -- Azsuna
			raceID = RaceID.ArchRaceHighborneNightElves,
		},
		["619:0.465284:0.449814"] = {
			-- Digsite: Gates of the City
			blobID = 363021,
			siteID = 2031,
			mapID = 680, -- Suramar
			raceID = RaceID.ArchRaceHighborneNightElves,
		},
		["619:0.640035:0.370825"] = {
			-- Digsite: Gates of Valor
			blobID = 350063,
			mapID = 634, -- Stormheim
			raceID = RaceID.ArchRaceDemons,
		},
		["619:0.305502:0.443922"] = {
			-- Digsite: Kal'delar
			blobID = 346504,
			siteID = 1896,
			mapID = 641, -- Val'sharah
			raceID = RaceID.ArchRaceHighborneNightElves,
		},
		["619:0.403229:0.475374"] = {
			-- Digsite: Koralune Estate
			blobID = 363029,
			siteID = 2075,
			mapID = 680, -- Suramar
			raceID = RaceID.ArchRaceHighborneNightElves,
		},
		["619:0.308262:0.602774"] = {
			-- Digsite: Legion Camp: Chaos
			blobID = 346517,
			siteID = 1906,
			mapID = 630, -- Azsuna
			raceID = RaceID.ArchRaceDemons,
		},
		["619:0.358267:0.435959"] = {
			-- Digsite: Lightsong
			blobID = 346506,
			mapID = 641, -- Val'sharah
			raceID = RaceID.ArchRaceHighborneNightElves,
		},
		["619:0.366973:0.540268"] = {
			-- Digsite: Llothien
			blobID = 346522,
			siteID = 1908,
			mapID = 630, -- Azsuna
			raceID = RaceID.ArchRaceHighborneNightElves,
		},
		["619:0.329283:0.547355"] = {
			-- Digsite: Llothien Highlands
			blobID = 354018,
			mapID = 630, -- Azsuna
			raceID = RaceID.ArchRaceDemons,
		},
		["619:0.387145:0.642268"] = {
			-- Digsite: Makrana
			blobID = 354031,
			siteID = 1982,
			mapID = 630, -- Azsuna
			raceID = RaceID.ArchRaceDemons,
		},
		["619:0.453181:0.482381"] = {
			-- Digsite: Meredil
			blobID = 363025,
			siteID = 2039,
			mapID = 680, -- Suramar
			raceID = RaceID.ArchRaceHighborneNightElves,
		},
		["619:0.436884:0.467172"] = {
			-- Digsite: Meredil
			blobID = 363036,
			mapID = 680, -- Suramar
			raceID = RaceID.ArchRaceDemons,
		},
		["619:0.443997:0.390095"] = {
			-- Digsite: Moonwhisper Gulch
			blobID = 346531,
			siteID = 1912,
			mapID = 680, -- Suramar
			raceID = RaceID.ArchRaceHighborneNightElves,
		},
		["619:0.307094:0.555477"] = {
			-- Digsite: Nor'Danil Wellspring
			blobID = 354049,
			siteID = 1996,
			mapID = 630, -- Azsuna
			raceID = RaceID.ArchRaceHighborneNightElves,
		},
		["619:0.600169:0.284432"] = {
			-- Digsite: Northern Helmouth Shallows
			blobID = 346449,
			siteID = 1886,
			mapID = 634, -- Stormheim
			raceID = RaceID.ArchRaceDemons,
		},
		["619:0.396859:0.408170"] = {
			-- Digsite: Northern Moonfall Retreat
			blobID = 363019,
			siteID = 2029,
			mapID = 680, -- Suramar
			raceID = RaceID.ArchRaceHighborneNightElves,
		},
		["619:0.479245:0.265640"] = {
			-- Digsite: Northern Snowblind Mesa
			blobID = 353991,
			siteID = 1965,
			mapID = 650, -- Highmountain
			raceID = RaceID.ArchRaceHighmountainTauren,
		},
		["619:0.324187:0.693149"] = {
			-- Digsite: Northern Watcher Isle
			blobID = 354027,
			siteID = 1978,
			mapID = 630, -- Azsuna
			raceID = RaceID.ArchRaceDemons,
		},
		["619:0.335282:0.621327"] = {
			-- Digsite: Old Coast Path
			blobID = 354041,
			siteID = 1988,
			mapID = 630, -- Azsuna
			raceID = RaceID.ArchRaceHighborneNightElves,
		},
		["619:0.442936:0.203692"] = {
			-- Digsite: Pinerock Basin
			blobID = 353979,
			mapID = 650, -- Highmountain
			raceID = RaceID.ArchRaceHighmountainTauren,
		},
		["619:0.457852:0.230685"] = {
			-- Digsite: Prowler's Scratch
			blobID = 353977,
			siteID = 1951,
			mapID = 650, -- Highmountain
			raceID = RaceID.ArchRaceHighmountainTauren,
		},
		["619:0.355985:0.475055"] = {
			-- Digsite: Rhut'van Passage
			blobID = 354022,
			mapID = 630, -- Azsuna
			raceID = RaceID.ArchRaceDemons,
		},
		["619:0.371113:0.474498"] = {
			-- Digsite: Ruins of Zarkhenar
			blobID = 354045,
			siteID = 1992,
			mapID = 630, -- Azsuna
			raceID = RaceID.ArchRaceHighborneNightElves,
		},
		["619:0.461780:0.195092"] = {
			-- Digsite: Screeching Bend
			blobID = 346478,
			siteID = 1890,
			mapID = 650, -- Highmountain
			raceID = RaceID.ArchRaceHighmountainTauren,
		},
		["619:0.358957:0.295420"] = {
			-- Digsite: Shala'nir
			blobID = 346512,
			siteID = 1902,
			mapID = 641, -- Val'sharah
			raceID = RaceID.ArchRaceDemons,
		},
		["619:0.608344:0.373214"] = {
			-- Digsite: Skold-Ashil
			blobID = 353972,
			siteID = 1949,
			mapID = 634, -- Stormheim
			raceID = RaceID.ArchRaceDemons,
		},
		["619:0.495754:0.193739"] = {
			-- Digsite: Sky Sepulcher
			blobID = 353989,
			siteID = 1963,
			mapID = 650, -- Highmountain
			raceID = RaceID.ArchRaceHighmountainTauren,
		},
		["619:0.603089:0.307842"] = {
			-- Digsite: Southern Helmouth Shallows
			blobID = 346447,
			siteID = 1884,
			mapID = 634, -- Stormheim
			raceID = RaceID.ArchRaceDemons,
		},
		["619:0.481050:0.247008"] = {
			-- Digsite: Southern Snowblind Mesa
			blobID = 346481,
			siteID = 1892,
			mapID = 650, -- Highmountain
			raceID = RaceID.ArchRaceHighmountainTauren,
		},
		["619:0.428284:0.569650"] = {
			-- Digsite: Southern Suramar
			blobID = 363058,
			siteID = 2043,
			mapID = 680, -- Suramar
			raceID = RaceID.ArchRaceDemons,
		},
		["619:0.365752:0.446868"] = {
			-- Digsite: Southern Wash
			blobID = 354093,
			siteID = 2004,
			mapID = 641, -- Val'sharah
			raceID = RaceID.ArchRaceHighborneNightElves,
		},
		["619:0.340059:0.751514"] = {
			-- Digsite: Southern Watcher Isle
			blobID = 354029,
			siteID = 1980,
			mapID = 630, -- Azsuna
			raceID = RaceID.ArchRaceDemons,
		},
		["619:0.611582:0.262217"] = {
			-- Digsite: Storm's Reach
			blobID = 353963,
			siteID = 1941,
			mapID = 634, -- Stormheim
			raceID = RaceID.ArchRaceDemons,
		},
		["619:0.582864:0.270020"] = {
			-- Digsite: Stormdrake Peak
			blobID = 346445,
			siteID = 1882,
			mapID = 634, -- Stormheim
			raceID = RaceID.ArchRaceDemons,
		},
		["619:0.393408:0.457537"] = {
			-- Digsite: Sundered Shoals
			blobID = 363062,
			siteID = 2047,
			mapID = 680, -- Suramar
			raceID = RaceID.ArchRaceDemons,
		},
		["619:0.398611:0.333481"] = {
			-- Digsite: Sundersong Glade
			blobID = 354087,
			siteID = 2000,
			mapID = 641, -- Val'sharah
			raceID = RaceID.ArchRaceHighborneNightElves,
		},
		["619:0.369362:0.683355"] = {
			-- Digsite: Temple of a Thousand Lights
			blobID = 354043,
			siteID = 1990,
			mapID = 630, -- Azsuna
			raceID = RaceID.ArchRaceHighborneNightElves,
		},
		["619:0.331194:0.395509"] = {
			-- Digsite: Thas'talah
			blobID = 354245,
			siteID = 2011,
			mapID = 641, -- Val'sharah,
			raceID = RaceID.ArchRaceDemons,
		},
		["619:0.323603:0.347018"] = {
			-- Digsite: The Crescent Vale
			blobID = 346514,
			siteID = 1904,
			mapID = 641, -- Val'sharah,
			raceID = RaceID.ArchRaceDemons,
		},
		["619:0.484341:0.153289"] = {
			-- Digsite: The Haglands
			blobID = 353985,
			siteID = 1959,
			mapID = 650, -- Highmountain
			raceID = RaceID.ArchRaceHighmountainTauren,
		},
		["619:0.401902:0.599032"] = {
			-- Digsite: The Ruined Sancum
			blobID = 354037,
			mapID = 630, -- Azsuna
			raceID = RaceID.ArchRaceHighborneNightElves,
		},
		["619:0.301361:0.459210"] = {
			-- Digsite: The Tidal Marsh
			blobID = 354047,
			siteID = 1994,
			mapID = 630, -- Azsuna
			raceID = RaceID.ArchRaceHighborneNightElves,
		},
		["619:0.360337:0.374966"] = {
			-- Digsite: The Wildwood
			blobID = 354249,
			siteID = 2279,
			mapID = 641, -- Val'sharah
			raceID = RaceID.ArchRaceDemons,
		},
		["619:0.442458:0.131551"] = {
			-- Digsite: The Witchwood
			blobID = 353981,
			siteID = 1955,
			mapID = 650, -- Highmountain
			raceID = RaceID.ArchRaceHighmountainTauren,
		},
		["619:0.302635:0.495598"] = {
			-- Digsite: Timeworn Strand
			blobID = 350662,
			mapID = 630, -- Azsuna
			raceID = RaceID.ArchRaceHighborneNightElves,
		},
		["619:0.287507:0.534615"] = {
			-- Digsite: Timeworn Strand
			blobID = 354025,
			mapID = 630, -- Azsuna
			raceID = RaceID.ArchRaceDemons,
		},
		["619:0.575008:0.234029"] = {
			-- Digsite: Warden's Bluff
			blobID = 353957,
			siteID = 1937,
			mapID = 634, -- Stormheim
			raceID = RaceID.ArchRaceDemons,
		},
		["619:0.434973:0.269303"] = {
			-- Digsite: Whitewater Wash
			blobID = 344517,
			siteID = 1877,
			mapID = 650, -- Highmountain
			raceID = RaceID.ArchRaceHighmountainTauren,
		},
		["619:0.308634:0.407135"] = {
			-- Digsite: Wretched Hollow
			blobID = 354247,
			siteID = 2013,
			mapID = 641, -- Val'sharah,
			raceID = RaceID.ArchRaceDemons,
		},
	}

	local CONTINENT_RACES = {}
	private.CONTINENT_RACES = CONTINENT_RACES

	for siteKey, site in pairs(DIGSITE_TEMPLATES) do
		if site.raceID ~= RaceID.Unknown then
			local continentID = tonumber(((":"):split(siteKey)))
			CONTINENT_RACES[continentID] = CONTINENT_RACES[continentID] or {}
			CONTINENT_RACES[continentID][site.raceID] = true
		end
	end


	private.DIGSITE_TEMPLATES = DIGSITE_TEMPLATES
end
