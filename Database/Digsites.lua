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
		["1:0.554639:0.842079"] = {
			-- Abyssal Sands Fossil Ridge
			blobID = 56375,
			mapID = 161,
			typeID = RaceID.ArchRaceFossil,
		},
		["1:0.490535:0.938357"] = {
			-- Akhenet Fields Digsite
			blobID = 60356,
			mapID = 720,
			typeID = RaceID.ArchRaceTolvir,
		},
		["1:0.524584:0.687758"] = {
			-- Bael Modan Digsite
			blobID = 55410,
			mapID = 607,
			typeID = RaceID.ArchRaceDwarf,
		},
		["1:0.434366:0.674429"] = {
			-- Broken Commons Digsite
			blobID = 56329,
			mapID = 121,
			typeID = RaceID.ArchRaceNightElf,
		},
		["1:0.568525:0.846115"] = {
			-- Broken Pillar Digsite
			blobID = 56367,
			mapID = 161,
			typeID = RaceID.ArchRaceTroll,
		},
		["1:0.477519:0.337294"] = {
			-- Constellas Digsite
			blobID = 56343,
			mapID = 182,
			typeID = RaceID.ArchRaceNightElf,
		},
		["1:0.539286:0.932202"] = {
			-- Cursed Landing Digsite
			blobID = 60352,
			mapID = 720,
			typeID = RaceID.ArchRaceTolvir,
		},
		["1:0.438198:0.730965"] = {
			-- Darkmist Digsite
			blobID = 56337,
			mapID = 121,
			typeID = RaceID.ArchRaceNightElf,
		},
		["1:0.427981:0.705815"] = {
			-- Dire Maul Digsite
			blobID = 56327,
			mapID = 121,
			typeID = RaceID.ArchRaceNightElf,
		},
		["1:0.543661:0.885734"] = {
			-- Dunemaul Fossil Ridge
			blobID = 56373,
			mapID = 161,
			typeID = RaceID.ArchRaceFossil,
		},
		["1:0.556432:0.883452"] = {
			-- Eastmoon Ruins Digsite
			blobID = 56369,
			mapID = 161,
			typeID = RaceID.ArchRaceTroll,
		},
		["1:0.396377:0.534088"] = {
			-- Ethel Rethor Digsite
			blobID = 55420,
			mapID = 101,
			typeID = RaceID.ArchRaceNightElf,
		},
		["1:0.518117:0.602282"] = {
			-- Fields of Blood Fossil Bank
			blobID = 56358,
			mapID = 607,
			typeID = RaceID.ArchRaceFossil,
		},
		["1:0.548498:0.403449"] = {
			-- Forest Song Digsite
			blobID = 55402,
			mapID = 43,
			typeID = RaceID.ArchRaceNightElf,
		},
		["1:0.592655:0.306642"] = {
			-- Frostwhisper Gorge Digsite
			blobID = 56356,
			mapID = 281,
			typeID = RaceID.ArchRaceNightElf,
		},
		["1:0.510834:0.314223"] = {
			-- Grove of Aessina Digsite
			blobID = 56570,
			mapID = 606,
			typeID = RaceID.ArchRaceNightElf,
		},
		["1:0.496378:0.277090"] = {
			-- Ironwood Digsite
			blobID = 56349,
			mapID = 182,
			typeID = RaceID.ArchRaceNightElf,
		},
		["1:0.477791:0.321805"] = {
			-- Jaedenar Digsite
			blobID = 56347,
			mapID = 182,
			typeID = RaceID.ArchRaceNightElf,
		},
		["1:0.530862:0.926699"] = {
			-- Keset Pass Digsite
			blobID = 60354,
			mapID = 720,
			typeID = RaceID.ArchRaceTolvir,
		},
		["1:0.506323:0.886183"] = {
			-- Khartut's Tomb Digsite
			blobID = 56591,
			mapID = 720,
			typeID = RaceID.ArchRaceTolvir,
		},
		["1:0.413714:0.576154"] = {
			-- Kodo Graveyard
			blobID = 55426,
			mapID = 101,
			typeID = RaceID.ArchRaceFossil,
		},
		["1:0.574177:0.255976"] = {
			-- Lake Kel'Theril Digsite
			blobID = 56351,
			mapID = 281,
			typeID = RaceID.ArchRaceNightElf,
		},
		["1:0.502193:0.796060"] = {
			-- Lower Lakkari Tar Pits
			blobID = 56380,
			mapID = 201,
			typeID = RaceID.ArchRaceFossil,
		},
		["1:0.412057:0.598124"] = {
			-- Mannoroc Coven Digsite
			blobID = 55424,
			mapID = 101,
			typeID = RaceID.ArchRaceNightElf,
		},
		["1:0.518389:0.830585"] = {
			-- Marshlands Fossil Bank
			blobID = 56388,
			mapID = 201,
			typeID = RaceID.ArchRaceFossil,
		},
		["1:0.508687:0.366886"] = {
			-- Morlos'Aran Digsite
			blobID = 56345,
			mapID = 182,
			typeID = RaceID.ArchRaceNightElf,
		},
		["1:0.439747:0.333789"] = {
			-- Nazj'vel Digsite
			blobID = 55354,
			mapID = 42,
			typeID = RaceID.ArchRaceNightElf,
		},
		["1:0.478932:0.984906"] = {
			-- Neferset Digsite
			blobID = 56597,
			mapID = 720,
			typeID = RaceID.ArchRaceTolvir,
		},
		["1:0.524285:0.590665"] = {
			-- Nightmare Scar Digsite
			blobID = 56362,
			mapID = 607,
			typeID = RaceID.ArchRaceNightElf,
		},
		["1:0.431323:0.724035"] = {
			-- North Isildien Digsite
			blobID = 56341,
			mapID = 121,
			typeID = RaceID.ArchRaceNightElf,
		},
		["1:0.506677:0.897433"] = {
			-- Obelisk of the Stars Digsite
			blobID = 60358,
			mapID = 720,
			typeID = RaceID.ArchRaceTolvir,
		},
		["1:0.415888:0.647527"] = {
			-- Oneiros Digsite
			blobID = 56333,
			mapID = 121,
			typeID = RaceID.ArchRaceNightElf,
		},
		["1:0.464801:0.918425"] = {
			-- Orsis Digsite
			blobID = 56599,
			mapID = 720,
			typeID = RaceID.ArchRaceTolvir,
		},
		["1:0.598036:0.292620"] = {
			-- Owl Wing Thicket Digsite
			blobID = 56354,
			mapID = 281,
			typeID = RaceID.ArchRaceNightElf,
		},
		["1:0.559231:0.684945"] = {
			-- Quagmire Fossil Field
			blobID = 55757,
			mapID = 141,
			typeID = RaceID.ArchRaceFossil,
		},
		["1:0.390236:0.641127"] = {
			-- Ravenwind Digsite
			blobID = 56331,
			mapID = 121,
			typeID = RaceID.ArchRaceNightElf,
		},
		["1:0.508144:0.978751"] = {
			-- River Delta Digsite
			blobID = 60350,
			mapID = 720,
			typeID = RaceID.ArchRaceTolvir,
		},
		["1:0.474367:0.874077"] = {
			-- Ruins of Ahmtul Digsite
			blobID = 56607,
			mapID = 720,
			typeID = RaceID.ArchRaceTolvir,
		},
		["1:0.451513:0.957066"] = {
			-- Ruins of Ammon Digsite
			blobID = 56601,
			mapID = 720,
			typeID = RaceID.ArchRaceTolvir,
		},
		["1:0.661732:0.352457"] = {
			-- Ruins of Arkkoran
			blobID = 55414,
			mapID = 181,
			typeID = RaceID.ArchRaceNightElf,
		},
		["1:0.603905:0.379930"] = {
			-- Ruins of Eldarath
			blobID = 55412,
			mapID = 181,
			typeID = RaceID.ArchRaceNightElf,
		},
		["1:0.434937:0.502743"] = {
			-- Ruins of Eldre'Thar
			blobID = 55406,
			mapID = 81,
			typeID = RaceID.ArchRaceNightElf,
		},
		["1:0.455916:0.877786"] = {
			-- Ruins of Khintaset Digsite
			blobID = 56603,
			mapID = 720,
			typeID = RaceID.ArchRaceTolvir,
		},
		["1:0.546133:0.291234"] = {
			-- Ruins of Lar'donir Digsite
			blobID = 56566,
			mapID = 606,
			typeID = RaceID.ArchRaceNightElf,
		},
		["1:0.463823:0.378463"] = {
			-- Ruins of Ordil'Aran
			blobID = 55398,
			mapID = 43,
			typeID = RaceID.ArchRaceNightElf,
		},
		["1:0.470426:0.436588"] = {
			-- Ruins of Stardust
			blobID = 55400,
			mapID = 43,
			typeID = RaceID.ArchRaceNightElf,
		},
		["1:0.481242:0.884512"] = {
			-- Sahket Wastes Digsite
			blobID = 60361,
			mapID = 720,
			typeID = RaceID.ArchRaceTolvir,
		},
		["1:0.519775:0.341003"] = {
			-- Sanctuary of Malorne Digsite
			blobID = 56572,
			mapID = 606,
			typeID = RaceID.ArchRaceNightElf,
		},
		["1:0.439584:0.529238"] = {
			-- Sargeron Digsite
			blobID = 55428,
			mapID = 101,
			typeID = RaceID.ArchRaceNightElf,
		},
		["1:0.432328:0.950096"] = {
			-- Schnottz's Landing
			blobID = 60363,
			mapID = 720,
			typeID = RaceID.ArchRaceTolvir,
		},
		["1:0.550481:0.333259"] = {
			-- Scorched Plain Digsite
			blobID = 56574,
			mapID = 606,
			typeID = RaceID.ArchRaceNightElf,
		},
		["1:0.483253:0.796590"] = {
			-- Screaming Reaches Fossil Field
			blobID = 56386,
			mapID = 201,
			typeID = RaceID.ArchRaceFossil,
		},
		["1:0.522410:0.305949"] = {
			-- Shrine of Goldrinn Digsite
			blobID = 56568,
			mapID = 606,
			typeID = RaceID.ArchRaceNightElf,
		},
		["1:0.385969:0.540773"] = {
			-- Slitherblade Shore Digsite
			blobID = 55418,
			mapID = 101,
			typeID = RaceID.ArchRaceNightElf,
		},
		["1:0.366268:0.719103"] = {
			-- Solarsal Digsite
			blobID = 56335,
			mapID = 121,
			typeID = RaceID.ArchRaceNightElf,
		},
		["1:0.428008:0.746046"] = {
			-- South Isildien Digsite
			blobID = 56339,
			mapID = 121,
			typeID = RaceID.ArchRaceNightElf,
		},
		["1:0.545237:0.896740"] = {
			-- Southmoon Ruins Digsite
			blobID = 56371,
			mapID = 161,
			typeID = RaceID.ArchRaceTroll,
		},
		["1:0.454122:0.813384"] = {
			-- Southwind Village Digsite
			blobID = 56390,
			mapID = 261,
			typeID = RaceID.ArchRaceNightElf,
		},
		["1:0.522737:0.937379"] = {
			-- Steps of Fate Digsite
			blobID = 56595,
			mapID = 720,
			typeID = RaceID.ArchRaceTolvir,
		},
		["1:0.424693:0.419346"] = {
			-- Stonetalon Peak
			blobID = 55404,
			mapID = 81,
			typeID = RaceID.ArchRaceNightElf,
		},
		["1:0.454258:0.899186"] = {
			-- Temple of Uldum Digsite
			blobID = 56605,
			mapID = 720,
			typeID = RaceID.ArchRaceTolvir,
		},
		["1:0.482573:0.840286"] = {
			-- Terror Run Fossil Field
			blobID = 56384,
			mapID = 201,
			typeID = RaceID.ArchRaceFossil,
		},
		["1:0.523063:0.924376"] = {
			-- Tombs of the Precursors Digsite
			blobID = 56593,
			mapID = 720,
			typeID = RaceID.ArchRaceTolvir,
		},
		["1:0.480345:0.505719"] = {
			-- Unearthed Grounds
			blobID = 55408,
			mapID = 81,
			typeID = RaceID.ArchRaceFossil,
		},
		["1:0.497519:0.784565"] = {
			-- Upper Lakkari Tar Pits
			blobID = 56382,
			mapID = 201,
			typeID = RaceID.ArchRaceFossil,
		},
		["1:0.427193:0.610638"] = {
			-- Valley of Bones
			blobID = 55422,
			mapID = 101,
			typeID = RaceID.ArchRaceFossil,
		},
		["1:0.558606:0.709891"] = {
			-- Wyrmbog Fossil Field
			blobID = 55755,
			mapID = 141,
			typeID = RaceID.ArchRaceFossil,
		},
		["1:0.439312:0.359957"] = {
			-- Zoram Strand Digsite
			blobID = 55356,
			mapID = 43,
			typeID = RaceID.ArchRaceNightElf,
		},
		["1:0.543117:0.801114"] = {
			-- Zul'Farrak Digsite
			blobID = 56364,
			mapID = 161,
			typeID = RaceID.ArchRaceTroll,
		},

		-- ----------------------------------------------------------------------------
		-- Eastern Kingdoms
		-- ----------------------------------------------------------------------------
		["2:0.498463:0.405910"] = {
			-- Aerie Peak Digsite
			blobID = 54136,
			mapID = 26,
			typeID = RaceID.ArchRaceDwarf,
		},
		["2:0.528555:0.396444"] = {
			-- Agol'watha Digsite
			blobID = 54141,
			mapID = 26,
			typeID = RaceID.ArchRaceTroll,
		},
		["2:0.529488:0.420533"] = {
			-- Altar of Zul Digsite
			blobID = 54138,
			mapID = 26,
			typeID = RaceID.ArchRaceTroll,
		},
		["2:0.471218:0.365394"] = {
			-- Andorhal Fossil Bank
			blobID = 55482,
			mapID = 22,
			typeID = RaceID.ArchRaceFossil,
		},
		["2:0.436756:0.853650"] = {
			-- Bal'lal Ruins Digsite
			blobID = 55458,
			mapID = 37,
			typeID = RaceID.ArchRaceTroll,
		},
		["2:0.463707:0.872840"] = {
			-- Balia'mah Digsite
			blobID = 55460,
			mapID = 37,
			typeID = RaceID.ArchRaceTroll,
		},
		["2:0.515424:0.833798"] = {
			-- Dreadmaul Fossil Field
			blobID = 55436,
			mapID = 19,
			typeID = RaceID.ArchRaceFossil,
		},
		["2:0.474016:0.457587"] = {
			-- Dun Garok Digsite
			blobID = 54134,
			mapID = 24,
			typeID = RaceID.ArchRaceDwarf,
		},
		["2:0.570552:0.584292"] = {
			-- Dunwald Ruins Digsite
			blobID = 56583,
			mapID = 700,
			typeID = RaceID.ArchRaceDwarf,
		},
		["2:0.498807:0.698105"] = {
			-- Eastern Ruins of Thaurissan
			blobID = 55444,
			mapID = 29,
			typeID = RaceID.ArchRaceDwarf,
		},
		["2:0.432240:0.839175"] = {
			-- Eastern Zul'Kunda Digsite
			blobID = 55454,
			mapID = 37,
			typeID = RaceID.ArchRaceTroll,
		},
		["2:0.466701:0.888863"] = {
			-- Eastern Zul'Mamwe Digsite
			blobID = 55464,
			mapID = 37,
			typeID = RaceID.ArchRaceTroll,
		},
		["2:0.474630:0.348157"] = {
			-- Felstone Fossil Field
			blobID = 55478,
			mapID = 22,
			typeID = RaceID.ArchRaceFossil,
		},
		["2:0.521069:0.543813"] = {
			-- Greenwarden's Fossil Bank
			blobID = 54127,
			mapID = 40,
			typeID = RaceID.ArchRaceFossil,
		},
		["2:0.488252:0.669339"] = {
			-- Grimsilt Digsite
			blobID = 55438,
			mapID = 28,
			typeID = RaceID.ArchRaceDwarf,
		},
		["2:0.438327:0.894682"] = {
			-- Gurubashi Arena Digsite
			blobID = 55474,
			mapID = 673,
			typeID = RaceID.ArchRaceTroll,
		},
		["2:0.529095:0.647865"] = {
			-- Hammertoe's Digsite
			blobID = 54832,
			mapID = 17,
			typeID = RaceID.ArchRaceDwarf,
		},
		["2:0.560341:0.521087"] = {
			-- Humboldt Conflagration Digsite
			blobID = 56587,
			mapID = 700,
			typeID = RaceID.ArchRaceDwarf,
		},
		["2:0.550131:0.336812"] = {
			-- Infectis Scar Fossil Field
			blobID = 55452,
			mapID = 23,
			typeID = RaceID.ArchRaceFossil,
		},
		["2:0.541343:0.620130"] = {
			-- Ironband's Excavation Site
			blobID = 54097,
			mapID = 35,
			typeID = RaceID.ArchRaceDwarf,
		},
		["2:0.500402:0.516335"] = {
			-- Ironbeard's Tomb
			blobID = 54124,
			mapID = 40,
			typeID = RaceID.ArchRaceDwarf,
		},
		["2:0.547062:0.424069"] = {
			-- Jintha'Alor Lower City Digsite
			blobID = 54139,
			mapID = 26,
			typeID = RaceID.ArchRaceTroll,
		},
		["2:0.541932:0.427274"] = {
			-- Jintha'Alor Upper City Digsite
			blobID = 54140,
			mapID = 26,
			typeID = RaceID.ArchRaceTroll,
		},
		["2:0.507029:0.767830"] = {
			-- Lakeridge Highway Fossil Bank
			blobID = 55416,
			mapID = 36,
			typeID = RaceID.ArchRaceFossil,
		},
		["2:0.548732:0.813171"] = {
			-- Misty Reed Fossil Bank
			blobID = 54864,
			mapID = 38,
			typeID = RaceID.ArchRaceFossil,
		},
		["2:0.435235:0.921239"] = {
			-- Nek'mani Wellspring Digsite
			blobID = 55476,
			mapID = 673,
			typeID = RaceID.ArchRaceTroll,
		},
		["2:0.485699:0.325357"] = {
			-- Northridge Fossil Field
			blobID = 55480,
			mapID = 22,
			typeID = RaceID.ArchRaceFossil,
		},
		["2:0.538079:0.298359"] = {
			-- Plaguewood Digsite
			blobID = 60444,
			mapID = 23,
			typeID = RaceID.ArchRaceNerubian,
		},
		["2:0.475980:0.660978"] = {
			-- Pyrox Flats Digsite
			blobID = 55440,
			mapID = 28,
			typeID = RaceID.ArchRaceDwarf,
		},
		["2:0.549026:0.288929"] = {
			-- Quel'Lithien Lodge Digsite
			blobID = 55450,
			mapID = 23,
			typeID = RaceID.ArchRaceNightElf,
		},
		["2:0.532311:0.872840"] = {
			-- Red Reaches Fossil Bank
			blobID = 55434,
			mapID = 19,
			typeID = RaceID.ArchRaceFossil,
		},
		["2:0.453668:0.915198"] = {
			-- Ruins of Aboraz
			blobID = 55470,
			mapID = 673,
			typeID = RaceID.ArchRaceTroll,
		},
		["2:0.445519:0.903191"] = {
			-- Ruins of Jubuwal
			blobID = 55472,
			mapID = 673,
			typeID = RaceID.ArchRaceTroll,
		},
		["2:0.440119:0.859691"] = {
			-- Savage Coast Raptor Fields
			blobID = 55468,
			mapID = 37,
			typeID = RaceID.ArchRaceFossil,
		},
		["2:0.517215:0.423664"] = {
			-- Shadra'Alor Digsite
			blobID = 54137,
			mapID = 26,
			typeID = RaceID.ArchRaceTroll,
		},
		["2:0.468837:0.430073"] = {
			-- Southshore Fossil Field
			blobID = 54135,
			mapID = 24,
			typeID = RaceID.ArchRaceFossil,
		},
		["2:0.540337:0.800427"] = {
			-- Sunken Temple Digsite
			blobID = 54862,
			mapID = 38,
			typeID = RaceID.ArchRaceTroll,
		},
		["2:0.518835:0.710886"] = {
			-- Terror Wing Fossil Field
			blobID = 55446,
			mapID = 29,
			typeID = RaceID.ArchRaceFossil,
		},
		["2:0.516013:0.297438"] = {
			-- Terrorweb Tunnel Digsite
			blobID = 60442,
			mapID = 23,
			typeID = RaceID.ArchRaceNerubian,
		},
		["2:0.506735:0.502891"] = {
			-- Thandol Span
			blobID = 54133,
			mapID = 40,
			typeID = RaceID.ArchRaceDwarf,
		},
		["2:0.488890:0.436740"] = {
			-- Thoradin's Wall
			blobID = 54129,
			mapID = 16,
			typeID = RaceID.ArchRaceDwarf,
		},
		["2:0.570896:0.533978"] = {
			-- Thundermar Ruins Digsite
			blobID = 56585,
			mapID = 700,
			typeID = RaceID.ArchRaceDwarf,
		},
		["2:0.529365:0.664698"] = {
			-- Tomb of the Watchers Digsite
			blobID = 54834,
			mapID = 17,
			typeID = RaceID.ArchRaceDwarf,
		},
		["2:0.457080:0.797333"] = {
			-- Twilight Grove Digsite
			blobID = 55350,
			mapID = 34,
			typeID = RaceID.ArchRaceNightElf,
		},
		["2:0.525831:0.635232"] = {
			-- Uldaman Entrance Digsite
			blobID = 54838,
			mapID = 17,
			typeID = RaceID.ArchRaceDwarf,
		},
		["2:0.448857:0.817149"] = {
			-- Vul'Gol Fossil Bank
			blobID = 55352,
			mapID = 34,
			typeID = RaceID.ArchRaceFossil,
		},
		["2:0.492155:0.698253"] = {
			-- Western Ruins of Thaurissan
			blobID = 55442,
			mapID = 29,
			typeID = RaceID.ArchRaceDwarf,
		},
		["2:0.428804:0.840170"] = {
			-- Western Zul'Kunda Digsite
			blobID = 55456,
			mapID = 37,
			typeID = RaceID.ArchRaceTroll,
		},
		["2:0.462185:0.888089"] = {
			-- Western Zul'Mamwe Digsite
			blobID = 55466,
			mapID = 37,
			typeID = RaceID.ArchRaceTroll,
		},
		["2:0.490486:0.540093"] = {
			-- Whelgar's Excavation Site
			blobID = 54126,
			mapID = 40,
			typeID = RaceID.ArchRaceDwarf,
		},
		["2:0.526469:0.477661"] = {
			-- Witherbark Digsite
			blobID = 54132,
			mapID = 16,
			typeID = RaceID.ArchRaceTroll,
		},
		["2:0.457301:0.878770"] = {
			-- Ziata'jai Digsite
			blobID = 55462,
			mapID = 37,
			typeID = RaceID.ArchRaceTroll,
		},
		["2:0.566404:0.287382"] = {
			-- Zul'Mashar Digsite
			blobID = 55448,
			mapID = 23,
			typeID = RaceID.ArchRaceTroll,
		},

		-- ----------------------------------------------------------------------------
		-- Outland
		-- ----------------------------------------------------------------------------
		["3:0.238263:0.685266"] = {
			-- Ancestral Grounds Digsite
			blobID = 56412,
			mapID = 477,
			typeID = RaceID.ArchRaceOrc,
		},
		["3:0.560123:0.262942"] = {
			-- Arklon Ruins Digsite
			blobID = 56408,
			mapID = 479,
			typeID = RaceID.ArchRaceDraenei,
		},
		["3:0.400138:0.781807"] = {
			-- Bleeding Hollow Ruins Digsite
			blobID = 56428,
			mapID = 478,
			typeID = RaceID.ArchRaceOrc,
		},
		["3:0.329479:0.525166"] = {
			-- Boha'mu Ruins Digsite
			blobID = 56402,
			mapID = 467,
			typeID = RaceID.ArchRaceDraenei,
		},
		["3:0.485685:0.768494"] = {
			-- Bone Wastes Digsite
			blobID = 56432,
			mapID = 478,
			typeID = RaceID.ArchRaceDraenei,
		},
		["3:0.543174:0.749856"] = {
			-- Bonechewer Ruins Digsite
			blobID = 56430,
			mapID = 478,
			typeID = RaceID.ArchRaceOrc,
		},
		["3:0.387369:0.716616"] = {
			-- Burning Blade Digsite
			blobID = 56420,
			mapID = 477,
			typeID = RaceID.ArchRaceOrc,
		},
		["3:0.647274:0.756383"] = {
			-- Coilskar Point Digsite
			blobID = 56441,
			mapID = 473,
			typeID = RaceID.ArchRaceDraenei,
		},
		["3:0.721254:0.860569"] = {
			-- Dragonmaw Fortress
			blobID = 56455,
			mapID = 473,
			typeID = RaceID.ArchRaceOrc,
		},
		["3:0.470110:0.786789"] = {
			-- East Auchindoun Digsite
			blobID = 56434,
			mapID = 478,
			typeID = RaceID.ArchRaceDraenei,
		},
		["3:0.647961:0.882814"] = {
			-- Eclipse Point Digsite
			blobID = 56448,
			mapID = 473,
			typeID = RaceID.ArchRaceDraenei,
		},
		["3:0.559035:0.593964"] = {
			-- Gor'gaz Outpost Digsite
			blobID = 56392,
			mapID = 465,
			typeID = RaceID.ArchRaceOrc,
		},
		["3:0.460261:0.709917"] = {
			-- Grangol'var Village Digsite
			blobID = 56424,
			mapID = 478,
			typeID = RaceID.ArchRaceOrc,
		},
		["3:0.288995:0.635278"] = {
			-- Halaa Digsite
			blobID = 56422,
			mapID = 477,
			typeID = RaceID.ArchRaceDraenei,
		},
		["3:0.561154:0.525767"] = {
			-- Hellfire Basin Digsite
			blobID = 56396,
			mapID = 465,
			typeID = RaceID.ArchRaceOrc,
		},
		["3:0.575068:0.527914"] = {
			-- Hellfire Citadel Digsite
			blobID = 56398,
			mapID = 465,
			typeID = RaceID.ArchRaceOrc,
		},
		["3:0.597114:0.834630"] = {
			-- Illidari Point Digsite
			blobID = 56439,
			mapID = 473,
			typeID = RaceID.ArchRaceDraenei,
		},
		["3:0.298501:0.565363"] = {
			-- Laughing Skull Digsite
			blobID = 56418,
			mapID = 477,
			typeID = RaceID.ArchRaceOrc,
		},
		["3:0.682718:0.783782"] = {
			-- Ruins of Baa'ri Digsite
			blobID = 56446,
			mapID = 473,
			typeID = RaceID.ArchRaceDraenei,
		},
		["3:0.539567:0.202217"] = {
			-- Ruins of Enkaat Digsite
			blobID = 56406,
			mapID = 479,
			typeID = RaceID.ArchRaceDraenei,
		},
		["3:0.600377:0.100351"] = {
			-- Ruins of Farahlon Digsite
			blobID = 56410,
			mapID = 479,
			typeID = RaceID.ArchRaceDraenei,
		},
		["3:0.468278:0.545093"] = {
			-- Sha'naar Digsite
			blobID = 56400,
			mapID = 465,
			typeID = RaceID.ArchRaceDraenei,
		},
		["3:0.255040:0.631928"] = {
			-- Sunspring Post Digsite
			blobID = 56416,
			mapID = 477,
			typeID = RaceID.ArchRaceOrc,
		},
		["3:0.504008:0.680456"] = {
			-- Tuurem Digsite
			blobID = 56426,
			mapID = 478,
			typeID = RaceID.ArchRaceDraenei,
		},
		["3:0.338583:0.482822"] = {
			-- Twin Spire Ruins Digsite
			blobID = 56404,
			mapID = 467,
			typeID = RaceID.ArchRaceDraenei,
		},
		["3:0.688788:0.819857"] = {
			-- Warden's Cage Digsite
			blobID = 56450,
			mapID = 473,
			typeID = RaceID.ArchRaceOrc,
		},
		["3:0.452130:0.788678"] = {
			-- West Auchindoun Digsite
			blobID = 56437,
			mapID = 478,
			typeID = RaceID.ArchRaceDraenei,
		},
		["3:0.624713:0.584688"] = {
			-- Zeth'Gor Digsite
			blobID = 56394,
			mapID = 465,
			typeID = RaceID.ArchRaceOrc,
		},

		-- ----------------------------------------------------------------------------
		-- Northrend
		-- ----------------------------------------------------------------------------
		["4:0.760625:0.411718"] = {
			-- Altar of Quetz'lun Digsite
			blobID = 56539,
			mapID = 496,
			typeID = RaceID.ArchRaceTroll,
		},
		["4:0.665477:0.371495"] = {
			-- Altar of Sseratus Digsite
			blobID = 56533,
			mapID = 496,
			typeID = RaceID.ArchRaceTroll,
		},
		["4:0.816113:0.768901"] = {
			-- Baleheim Digsite
			blobID = 56512,
			mapID = 491,
			typeID = RaceID.ArchRaceVrykul,
		},
		["4:0.611679:0.306430"] = {
			-- Brunnhildar Village Digsite
			blobID = 56549,
			mapID = 495,
			typeID = RaceID.ArchRaceVrykul,
		},
		["4:0.793467:0.505175"] = {
			-- Drakil'Jin Ruins Digsite
			blobID = 56547,
			mapID = 490,
			typeID = RaceID.ArchRaceTroll,
		},
		["4:0.315702:0.564494"] = {
			-- En'kilah Digsite
			blobID = 56522,
			mapID = 486,
			typeID = RaceID.ArchRaceNerubian,
		},
		["4:0.720065:0.671641"] = {
			-- Gjalerbron Digsite
			blobID = 56516,
			mapID = 491,
			typeID = RaceID.ArchRaceVrykul,
		},
		["4:0.769018:0.816474"] = {
			-- Halgrind Digsite
			blobID = 56506,
			mapID = 491,
			typeID = RaceID.ArchRaceVrykul,
		},
		["4:0.282578:0.301614"] = {
			-- Jotunheim Digsite
			blobID = 56562,
			mapID = 492,
			typeID = RaceID.ArchRaceVrykul,
		},
		["4:0.722093:0.468586"] = {
			-- Kolramas Digsite
			blobID = 56524,
			mapID = 496,
			typeID = RaceID.ArchRaceNerubian,
		},
		["4:0.385894:0.611983"] = {
			-- Moonrest Gardens Digsite
			blobID = 56520,
			mapID = 488,
			typeID = RaceID.ArchRaceNightElf,
		},
		["4:0.830704:0.815545"] = {
			-- Nifflevar Digsite
			blobID = 56514,
			mapID = 491,
			typeID = RaceID.ArchRaceVrykul,
		},
		["4:0.315082:0.237731"] = {
			-- Njorndar Village Digsite
			blobID = 56564,
			mapID = 492,
			typeID = RaceID.ArchRaceVrykul,
		},
		["4:0.482337:0.286066"] = {
			-- Pit of Fiends Digsite
			blobID = 60367,
			mapID = 492,
			typeID = RaceID.ArchRaceNerubian,
		},
		["4:0.398569:0.584352"] = {
			-- Pit of Narjun Digsite
			blobID = 56518,
			mapID = 488,
			typeID = RaceID.ArchRaceNerubian,
		},
		["4:0.194416:0.775830"] = {
			-- Riplash Ruins Digsite
			blobID = 56526,
			mapID = 486,
			typeID = RaceID.ArchRaceNightElf,
		},
		["4:0.562049:0.441800"] = {
			-- Ruins of Shandaral Digsite
			blobID = 56530,
			mapID = 510,
			typeID = RaceID.ArchRaceNightElf,
		},
		["4:0.207485:0.701216"] = {
			-- Sands of Nasam
			blobID = 60369,
			mapID = 486,
			typeID = RaceID.ArchRaceNerubian,
		},
		["4:0.485548:0.323499"] = {
			-- Scourgeholme Digsite
			blobID = 56555,
			mapID = 492,
			typeID = RaceID.ArchRaceNerubian,
		},
		["4:0.800847:0.902242"] = {
			-- Shield Hill Digsite
			blobID = 56510,
			mapID = 491,
			typeID = RaceID.ArchRaceVrykul,
		},
		["4:0.577766:0.319359"] = {
			-- Sifreldar Village Digsite
			blobID = 56551,
			mapID = 495,
			typeID = RaceID.ArchRaceVrykul,
		},
		["4:0.751386:0.735270"] = {
			-- Skorn Digsite
			blobID = 56504,
			mapID = 491,
			typeID = RaceID.ArchRaceVrykul,
		},
		["4:0.261171:0.528075"] = {
			-- Talramas Digsite
			blobID = 56541,
			mapID = 486,
			typeID = RaceID.ArchRaceNerubian,
		},
		["4:0.514109:0.272545"] = {
			-- Valkyrion Digsite
			blobID = 56553,
			mapID = 495,
			typeID = RaceID.ArchRaceVrykul,
		},
		["4:0.462113:0.410957"] = {
			-- Violet Stand Digsite
			blobID = 56528,
			mapID = 510,
			typeID = RaceID.ArchRaceNightElf,
		},
		["4:0.666998:0.651107"] = {
			-- Voldrune Digsite
			blobID = 56543,
			mapID = 490,
			typeID = RaceID.ArchRaceVrykul,
		},
		["4:0.796509:0.809038"] = {
			-- Wyrmskull Digsite
			blobID = 56508,
			mapID = 491,
			typeID = RaceID.ArchRaceVrykul,
		},
		["4:0.413722:0.301191"] = {
			-- Ymirheim Digsite
			blobID = 56560,
			mapID = 492,
			typeID = RaceID.ArchRaceVrykul,
		},
		["4:0.719783:0.370312"] = {
			-- Zim'Rhuk Digsite
			blobID = 56535,
			mapID = 496,
			typeID = RaceID.ArchRaceTroll,
		},
		["4:0.771722:0.348849"] = {
			-- Zol'Heb Digsite
			blobID = 56537,
			mapID = 496,
			typeID = RaceID.ArchRaceTroll,
		},

		-- ----------------------------------------------------------------------------
		-- Pandaria
		-- ----------------------------------------------------------------------------
		["6:0.270692:0.822365"] = {
			-- Amber Quarry Digsite
			blobID = 177517,
			mapID = 858,
			typeID = RaceID.ArchRaceMantid,
		},
		["6:0.491570:0.453632"] = {
			-- Chow Farmstead Digsite
			blobID = 66987,
			mapID = 809,
			typeID = RaceID.ArchRacePandaren,
		},
		["6:0.764011:0.661878"] = {
			-- Den of Sorrow Digsite
			blobID = 67035,
			mapID = 806,
			typeID = RaceID.ArchRacePandaren,
		},
		["6:0.542101:0.327176"] = {
			-- Destroyed Village Digsite
			blobID = 66979,
			mapID = 809,
			typeID = RaceID.ArchRacePandaren,
		},
		["6:0.411391:0.317218"] = {
			-- East Snow Covered Hills Digsite
			blobID = 66971,
			mapID = 809,
			typeID = RaceID.ArchRaceMogu,
		},
		["6:0.199987:0.382090"] = {
			-- East Sra'vess Digsite
			blobID = 177495,
			mapID = 810,
			typeID = RaceID.ArchRaceMantid,
		},
		["6:0.551060:0.536969"] = {
			-- East Summer Fields Digsite
			blobID = 92166,
			mapID = 811,
			typeID = RaceID.ArchRaceMogu,
		},
		["6:0.483578:0.549441"] = {
			-- Emperor's Approach Digsite
			blobID = 92156,
			mapID = 811,
			typeID = RaceID.ArchRaceMogu,
		},
		["6:0.699043:0.406936"] = {
			-- Emperor's Omen Digsite
			blobID = 66817,
			mapID = 806,
			typeID = RaceID.ArchRacePandaren,
		},
		["6:0.461858:0.762617"] = {
			-- Fallsong Village Digsite
			blobID = 66943,
			mapID = 857,
			typeID = RaceID.ArchRaceMogu,
		},
		["6:0.348808:0.361787"] = {
			-- Fire Camp Osul Digsite
			blobID = 92178,
			mapID = 810,
			typeID = RaceID.ArchRaceMogu,
		},
		["6:0.431952:0.535132"] = {
			-- Five Sisters Digsite
			blobID = 92026,
			mapID = 811,
			typeID = RaceID.ArchRacePandaren,
		},
		["6:0.677516:0.454985"] = {
			-- Forest Heart Digsite
			blobID = 67021,
			mapID = 806,
			typeID = RaceID.ArchRacePandaren,
		},
		["6:0.476553:0.470454"] = {
			-- Gate to Golden Valley Digsite
			blobID = 66967,
			mapID = 809,
			typeID = RaceID.ArchRaceMogu,
		},
		["6:0.648512:0.473161"] = {
			-- Gong of Hope Digsite
			blobID = 67023,
			mapID = 806,
			typeID = RaceID.ArchRacePandaren,
		},
		["6:0.699365:0.539386"] = {
			-- Great Bridge Digsite
			blobID = 67025,
			mapID = 806,
			typeID = RaceID.ArchRacePandaren,
		},
		["6:0.533722:0.384700"] = {
			-- Grumblepaw Ranch Digsite
			blobID = 66985,
			mapID = 809,
			typeID = RaceID.ArchRacePandaren,
		},
		["6:0.401724:0.458466"] = {
			-- Hatred's Vice Digsite
			blobID = 92180,
			mapID = 810,
			typeID = RaceID.ArchRaceMogu,
		},
		["6:0.173239:0.353570"] = {
			-- Ikz'ka Ridge Digsite
			blobID = 177501,
			mapID = 810,
			typeID = RaceID.ArchRaceMantid,
		},
		["6:0.713803:0.558142"] = {
			-- Jade Temple Grounds Digsite
			blobID = 67031,
			mapID = 806,
			typeID = RaceID.ArchRacePandaren,
		},
		["6:0.327668:0.556981"] = {
			-- Kor'vess Digsite
			blobID = 177485,
			mapID = 858,
			typeID = RaceID.ArchRaceMantid,
		},
		["6:0.508972:0.783500"] = {
			-- Krasarang Wilds Digsite
			blobID = 66949,
			mapID = 857,
			typeID = RaceID.ArchRaceMogu,
		},
		["6:0.427118:0.300203"] = {
			-- Kun-Lai Peak Digsite
			blobID = 67005,
			mapID = 809,
			typeID = RaceID.ArchRacePandaren,
		},
		["6:0.386190:0.573030"] = {
			-- Kypari Vor Digsite
			blobID = 177529,
			mapID = 858,
			typeID = RaceID.ArchRaceMantid,
		},
		["6:0.348228:0.689528"] = {
			-- Kypari'ik Digsite
			blobID = 177511,
			mapID = 858,
			typeID = RaceID.ArchRaceMantid,
		},
		["6:0.368079:0.720659"] = {
			-- Kypari'zar Digsite
			blobID = 177523,
			mapID = 858,
			typeID = RaceID.ArchRaceMantid,
		},
		["6:0.201470:0.411287"] = {
			-- Kzzok Warcamp Digsite
			blobID = 177493,
			mapID = 810,
			typeID = RaceID.ArchRaceMantid,
		},
		["6:0.387673:0.691752"] = {
			-- Lake of Stars Digsite
			blobID = 177525,
			mapID = 858,
			typeID = RaceID.ArchRaceMantid,
		},
		["6:0.400886:0.725589"] = {
			-- Lake of Stars Digsite
			blobID = 92200,
			mapID = 858,
			typeID = RaceID.ArchRaceMogu,
		},
		["6:0.578517:0.720755"] = {
			-- Lost Dynasty Digsite
			blobID = 66951,
			mapID = 857,
			typeID = RaceID.ArchRaceMogu,
		},
		["6:0.465918:0.571773"] = {
			-- Mistfall Village Digsite
			blobID = 92022,
			mapID = 811,
			typeID = RaceID.ArchRacePandaren,
		},
		["6:0.240334:0.430719"] = {
			-- Niuzao Temple Digsite
			blobID = 92174,
			mapID = 810,
			typeID = RaceID.ArchRacePandaren,
		},
		["6:0.481258:0.635775"] = {
			-- North Fruited Fields Digsite
			blobID = 66935,
			mapID = 807,
			typeID = RaceID.ArchRacePandaren,
		},
		["6:0.416677:0.658881"] = {
			-- North Great Wall Digsite
			blobID = 66919,
			mapID = 807,
			typeID = RaceID.ArchRaceMogu,
		},
		["6:0.542874:0.753626"] = {
			-- North Ruins of Dojan Digsite
			blobID = 92212,
			mapID = 857,
			typeID = RaceID.ArchRaceMogu,
		},
		["6:0.457153:0.499651"] = {
			-- North Ruins of Guo-Lai Digsite
			blobID = 92030,
			mapID = 811,
			typeID = RaceID.ArchRaceMogu,
		},
		["6:0.268307:0.503905"] = {
			-- North Sik'vess Digsite
			blobID = 177507,
			mapID = 810,
			typeID = RaceID.ArchRaceMantid,
		},
		["6:0.543326:0.520630"] = {
			-- North Summer Fields Digsite
			blobID = 92162,
			mapID = 811,
			typeID = RaceID.ArchRaceMogu,
		},
		["6:0.502334:0.809603"] = {
			-- North Temple of the Red Crane Digsite
			blobID = 66957,
			mapID = 857,
			typeID = RaceID.ArchRacePandaren,
		},
		["6:0.537138:0.465717"] = {
			-- Old Village Digsite
			blobID = 66983,
			mapID = 809,
			typeID = RaceID.ArchRacePandaren,
		},
		["6:0.723793:0.507965"] = {
			-- Orchard Digsite
			blobID = 67027,
			mapID = 806,
			typeID = RaceID.ArchRacePandaren,
		},
		["6:0.432596:0.623013"] = {
			-- Paoquan Hollow Digsite
			blobID = 66933,
			mapID = 807,
			typeID = RaceID.ArchRacePandaren,
		},
		["6:0.552929:0.604934"] = {
			-- Pools of Purity Digsite
			blobID = 66941,
			mapID = 807,
			typeID = RaceID.ArchRacePandaren,
		},
		["6:0.503365:0.234751"] = {
			-- Remote Village Digsite
			blobID = 66973,
			mapID = 809,
			typeID = RaceID.ArchRacePandaren,
		},
		["6:0.669073:0.360724"] = {
			-- Ruins of Gan Shi Digsite
			blobID = 66795,
			mapID = 806,
			typeID = RaceID.ArchRaceMogu,
		},
		["6:0.444907:0.792974"] = {
			-- Ruins of Korja Digsite
			blobID = 66945,
			mapID = 857,
			typeID = RaceID.ArchRaceMogu,
		},
		["6:Setting Sun Garrison Digsite"] = {
			-- NEEDS UPDATE
			blobID = 92020,
			mapID = 811,
			typeID = RaceID.ArchRaceMogu,
		},
		["6:0.225768:0.253507"] = {
			-- Shanze'Dao Digsite
			blobID = 92196,
			mapID = 810,
			typeID = RaceID.ArchRaceMogu,
		},
		["6:Shrine Meadow Digsite"] = {
			-- NEEDS UPDATE
			blobID = 67037,
			mapID = 806,
			typeID = RaceID.ArchRacePandaren,
		},
		["6:0.709484:0.457596"] = {
			-- Shrine of the Dawn Digsite
			blobID = 66789,
			mapID = 806,
			typeID = RaceID.ArchRacePandaren,
		},
		["6:0.283582:0.508255"] = {
			-- Sik'vess Digsite
			blobID = 177503,
			mapID = 810,
			typeID = RaceID.ArchRaceMantid,
		},
		["6:0.454188:0.654820"] = {
			-- Singing Marshes Digsite
			blobID = 66917,
			mapID = 807,
			typeID = RaceID.ArchRaceMogu,
		},
		["6:0.376523:0.352313"] = {
			-- Small Gate Digsite
			blobID = 66991,
			mapID = 809,
			typeID = RaceID.ArchRacePandaren,
		},
		["6:0.398888:0.323212"] = {
			-- Snow Covered Hills Digsite
			blobID = 66969,
			mapID = 809,
			typeID = RaceID.ArchRaceMogu,
		},
		["6:0.473330:0.672319"] = {
			-- South Fruited Fields Digsite
			blobID = 66939,
			mapID = 807,
			typeID = RaceID.ArchRacePandaren,
		},
		["6:0.414292:0.711184"] = {
			-- South Great Wall Digsite
			blobID = 66923,
			mapID = 807,
			typeID = RaceID.ArchRaceMogu,
		},
		["6:0.673584:0.621660"] = {
			-- South Orchard Digsite
			blobID = 67033,
			mapID = 806,
			typeID = RaceID.ArchRacePandaren,
		},
		["6:0.539201:0.771318"] = {
			-- South Ruins of Dojan Digsite
			blobID = 92210,
			mapID = 857,
			typeID = RaceID.ArchRaceMogu,
		},
		["6:0.441168:0.523821"] = {
			-- South Ruins of Guo-Lai Digsite
			blobID = 92032,
			mapID = 811,
			typeID = RaceID.ArchRaceMogu,
		},
		["6:0.266695:0.405293"] = {
			-- Sra'thik Digsite
			blobID = 92172,
			mapID = 810,
			typeID = RaceID.ArchRacePandaren,
		},
		["6:0.201792:0.347865"] = {
			-- Sra'thik Swarmdock Digsite
			blobID = 177487,
			mapID = 810,
			typeID = RaceID.ArchRaceMantid,
		},
		["6:0.422993:0.580378"] = {
			-- Terrace of Gurthan Digsite
			blobID = 92202,
			mapID = 858,
			typeID = RaceID.ArchRaceMogu,
		},
		["6:0.707937:0.493077"] = {
			-- The Arboretum Digsite
			blobID = 66854,
			mapID = 806,
			typeID = RaceID.ArchRacePandaren,
		},
		["6:0.303305:0.752369"] = {
			-- The Briny Muck Digsite
			blobID = 177519,
			mapID = 858,
			typeID = RaceID.ArchRaceMantid,
		},
		["6:0.333984:0.637128"] = {
			-- The Clutches of Shek'zeer Digsite
			blobID = 177509,
			mapID = 858,
			typeID = RaceID.ArchRaceMantid,
		},
		["6:0.179233:0.413704"] = {
			-- The Feeding Pits Digsite
			blobID = 177491,
			mapID = 810,
			typeID = RaceID.ArchRaceMantid,
		},
		["6:0.574327:0.555338"] = {
			-- The Spring Road Digsite
			blobID = 66929,
			mapID = 873,
			typeID = RaceID.ArchRaceMogu,
		},
		["6:0.328699:0.412060"] = {
			-- The Underbough Digsite
			blobID = 177497,
			mapID = 810,
			typeID = RaceID.ArchRaceMantid,
		},
		["6:0.651284:0.629684"] = {
			-- Thunderwood Digsite
			blobID = 66890,
			mapID = 806,
			typeID = RaceID.ArchRaceMogu,
		},
		["6:0.655344:0.401909"] = {
			-- Tian Digsite
			blobID = 66784,
			mapID = 806,
			typeID = RaceID.ArchRacePandaren,
		},
		["6:0.611130:0.476351"] = {
			-- Tiger's Wood Digsite
			blobID = 66767,
			mapID = 806,
			typeID = RaceID.ArchRacePandaren,
		},
		["6:0.439686:0.734000"] = {
			-- Torjari Pit Digsite
			blobID = 66925,
			mapID = 807,
			typeID = RaceID.ArchRaceMogu,
		},
		["6:0.484545:0.569260"] = {
			-- Tu Shen Digsite
			blobID = 92038,
			mapID = 811,
			typeID = RaceID.ArchRaceMogu,
		},
		["6:0.479647:0.294692"] = {
			-- Valley of Kings Digsite
			blobID = 66965,
			mapID = 809,
			typeID = RaceID.ArchRaceMogu,
		},
		["6:0.261346:0.655980"] = {
			-- Venomous Ledge Digsite
			blobID = 177515,
			mapID = 858,
			typeID = RaceID.ArchRaceMantid,
		},
		["6:Veridian Grove Digsite"] = {
			-- NEEDS UPDATE
			blobID = 67039,
			mapID = 806,
			typeID = RaceID.ArchRacePandaren,
		},
		["6:West Old Village Digsite"] = {
			-- NEEDS UPDATE
			blobID = 66989,
			mapID = 809,
			typeID = RaceID.ArchRacePandaren,
		},
		["6:0.442844:0.504195"] = {
			-- West Ruins of Guo-Lai Digsite
			blobID = 92046,
			mapID = 811,
			typeID = RaceID.ArchRaceMogu,
		},
		["6:0.261539:0.516763"] = {
			-- West Sik'vess Digsite
			blobID = 177505,
			mapID = 810,
			typeID = RaceID.ArchRaceMantid,
		},
		["6:0.177107:0.393594"] = {
			-- West Sra'vess Digsite
			blobID = 177489,
			mapID = 810,
			typeID = RaceID.ArchRaceMantid,
		},
		["6:0.451481:0.551857"] = {
			-- Winterbough Digsite
			blobID = 92150,
			mapID = 811,
			typeID = RaceID.ArchRaceMogu,
		},
		["6:0.398952:0.659654"] = {
			-- Writhingwood Digsite
			blobID = 92206,
			mapID = 858,
			typeID = RaceID.ArchRaceMogu,
		},
		["6:0.250325:0.757590"] = {
			-- Zan'vess Digsite
			blobID = 177513,
			mapID = 858,
			typeID = RaceID.ArchRaceMantid,
		},
		["6:0.601140:0.688851"] = {
			-- Zhu Province Digsite
			blobID = 66961,
			mapID = 857,
			typeID = RaceID.ArchRacePandaren,
		},

		-- ----------------------------------------------------------------------------
		-- Draenor
		-- ----------------------------------------------------------------------------
		["7:0.225739:0.548585"] = {
			-- Ancestral Grounds Digsite
			blobID = 307987,
			mapID = 950,
			typeID = RaceID.ArchRaceDraenorOrc,
		},
		["7:0.389797:0.665823"] = {
			-- Ango'rosh Digsite
			blobID = 307971,
			mapID = 946,
			typeID = RaceID.ArchRaceOgre,
		},
		["7:0.524607:0.664305"] = {
			-- Anguish Fortress Digsite
			blobID = 307928,
			mapID = 947,
			typeID = RaceID.ArchRaceDraenorOrc,
		},
		["7:0.427447:0.718207"] = {
			-- Apexis Excavation Digsite
			blobID = 307958,
			mapID = 948,
			typeID = RaceID.ArchRaceArakkoa,
		},
		["7:0.453309:0.823504"] = {
			-- Bloodmane Pridelands Digsite
			blobID = 307950,
			mapID = 948,
			typeID = RaceID.ArchRaceArakkoa,
		},
		["7:0.464349:0.806878"] = {
			-- Bloodmane Valley Digsite
			blobID = 307954,
			mapID = 948,
			typeID = RaceID.ArchRaceArakkoa,
		},
		["7:0.568634:0.746906"] = {
			-- Burial Fields Digsite
			blobID = 307926,
			mapID = 947,
			typeID = RaceID.ArchRaceDraenorOrc,
		},
		["7:0.295101:0.439066"] = {
			-- Burning Plateau Digsite
			blobID = 307997,
			mapID = 950,
			typeID = RaceID.ArchRaceDraenorOrc,
		},
		["7:0.354214:0.244702"] = {
			-- Coldsnap Bluffs Digsite
			blobID = 307922,
			mapID = 941,
			typeID = RaceID.ArchRaceDraenorOrc,
		},
		["7:0.502351:0.612515"] = {
			-- Cursed Woods Digsite
			blobID = 307930,
			mapID = 947,
			typeID = RaceID.ArchRaceDraenorOrc,
		},
		["7:0.301478:0.231573"] = {
			-- Daggermaw Flows Digsite
			blobID = 264227,
			mapID = 941,
			typeID = RaceID.ArchRaceDraenorOrc,
		},
		["7:0.458060:0.365833"] = {
			-- Deadgrin Ruins Digsite
			blobID = 308005,
			mapID = 949,
			typeID = RaceID.ArchRaceDraenorOrc,
		},
		["7:0.316213:0.441111"] = {
			-- Drowning Plateau Digsite
			blobID = 307995,
			mapID = 950,
			typeID = RaceID.ArchRaceDraenorOrc,
		},
		["7:0.461974:0.588764"] = {
			-- Duskfall Island Digsite
			blobID = 307964,
			mapID = 946,
			typeID = RaceID.ArchRaceOgre,
		},
		["7:0.378317:0.236851"] = {
			-- East Coldsnap Bluffs Digsite
			blobID = 307920,
			mapID = 941,
			typeID = RaceID.ArchRaceDraenorOrc,
		},
		["7:0.370268:0.595823"] = {
			-- Forgotten Ogre Ruin Digsite
			blobID = 307973,
			mapID = 946,
			typeID = RaceID.ArchRaceOgre,
		},
		["7:0.242496:0.327765"] = {
			-- Frostboar Drifts Digsite
			blobID = 307916,
			mapID = 941,
			typeID = RaceID.ArchRaceDraenorOrc,
		},
		["7:0.316872:0.343533"] = {
			-- Frostwind Crag Digsite
			blobID = 264237,
			mapID = 941,
			typeID = RaceID.ArchRaceDraenorOrc,
		},
		["7:0.276847:0.342082"] = {
			-- Frozen Lake Digsite
			blobID = 264223,
			mapID = 941,
			typeID = RaceID.ArchRaceDraenorOrc,
		},
		["7:0.559706:0.645238"] = {
			-- Gloomshade Digsite
			blobID = 307940,
			mapID = 947,
			typeID = RaceID.ArchRaceDraenorOrc,
		},
		["7:0.465053:0.648471"] = {
			-- Gordal Fortress Digsite
			blobID = 307960,
			mapID = 946,
			typeID = RaceID.ArchRaceOgre,
		},
		["7:0.363583:0.375729"] = {
			-- Grom'gar Digsite
			blobID = 264233,
			mapID = 941,
			typeID = RaceID.ArchRaceDraenorOrc,
		},
		["7:0.287140:0.497124"] = {
			-- Highmaul Watchtower Digsite
			blobID = 308001,
			mapID = 950,
			typeID = RaceID.ArchRaceOgre,
		},
		["7:0.327604:0.471064"] = {
			-- Howling Plateau Digsite
			blobID = 307991,
			mapID = 950,
			typeID = RaceID.ArchRaceDraenorOrc,
		},
		["7:0.374623:0.316286"] = {
			-- Icewind Drifts Digsite
			blobID = 307918,
			mapID = 941,
			typeID = RaceID.ArchRaceDraenorOrc,
		},
		["7:0.258154:0.586718"] = {
			-- Kag'ah Digsite
			blobID = 307985,
			mapID = 950,
			typeID = RaceID.ArchRaceDraenorOrc,
		},
		["7:0.275440:0.244834"] = {
			-- Lashwind Cleft Digsite
			blobID = 264229,
			mapID = 941,
			typeID = RaceID.ArchRaceDraenorOrc,
		},
		["7:0.328220:0.587840"] = {
			-- Mar'gok's Overwatch Digsite
			blobID = 308003,
			mapID = 950,
			typeID = RaceID.ArchRaceOgre,
		},
		["7:0.247247:0.557029"] = {
			-- North Spirit Woods Digsite
			blobID = 307983,
			mapID = 950,
			typeID = RaceID.ArchRaceDraenorOrc,
		},
		["7:0.266863:0.472119"] = {
			-- Overgrown Highmaul Road Digsite
			blobID = 307977,
			mapID = 950,
			typeID = RaceID.ArchRaceOgre,
		},
		["7:0.500724:0.364250"] = {
			-- Overlook Ruins Digsite
			blobID = 308011,
			mapID = 949,
			typeID = RaceID.ArchRaceOgre,
		},
		["7:0.474949:0.867443"] = {
			-- Pinchwhistle Point Digsite
			blobID = 307952,
			mapID = 948,
			typeID = RaceID.ArchRaceArakkoa,
		},
		["7:0.303194:0.521007"] = {
			-- Razed Warsong Outpost Digsite
			blobID = 307979,
			mapID = 950,
			typeID = RaceID.ArchRaceDraenorOrc,
		},
		["7:0.317620:0.529452"] = {
			-- Ring of Trials Sludge Digsite
			blobID = 307989,
			mapID = 950,
			typeID = RaceID.ArchRaceDraenorOrc,
		},
		["7:0.254680:0.512232"] = {
			-- Ruins of Na'gwa Digsite
			blobID = 307975,
			mapID = 950,
			typeID = RaceID.ArchRaceOgre,
		},
		["7:0.498524:0.393081"] = {
			-- Ruins of the First Bastion Digsite
			blobID = 308015,
			mapID = 949,
			typeID = RaceID.ArchRaceOgre,
		},
		["7:0.329540:0.452525"] = {
			-- Rumbling Plateau Digsite
			blobID = 307993,
			mapID = 950,
			typeID = RaceID.ArchRaceDraenorOrc,
		},
		["7:0.499360:0.749875"] = {
			-- Sethekk Hollow North Digsite
			blobID = 307944,
			mapID = 948,
			typeID = RaceID.ArchRaceArakkoa,
		},
		["7:0.513303:0.773231"] = {
			-- Sethekk Hollow South Digsite
			blobID = 307942,
			mapID = 948,
			typeID = RaceID.ArchRaceArakkoa,
		},
		["7:0.549413:0.767359"] = {
			-- Shaz'gul Digsite
			blobID = 307924,
			mapID = 947,
			typeID = RaceID.ArchRaceDraenorOrc,
		},
		["7:0.617544:0.762938"] = {
			-- Shimmering Moor Digsite
			blobID = 307936,
			mapID = 947,
			typeID = RaceID.ArchRaceArakkoa,
		},
		["7:0.380517:0.407529"] = {
			-- Southwind Cliffs Digsite
			blobID = 308018,
			mapID = 941,
			typeID = RaceID.ArchRaceDraenorOrc,
		},
		["7:0.291098:0.541459"] = {
			-- Stonecrag Excavation Digsite
			blobID = 307981,
			mapID = 950,
			maxFindCount = 13,
			typeID = RaceID.ArchRaceOgre,
		},
		["7:0.474597:0.356333"] = {
			-- The Broken Spine Digsite
			blobID = 308007,
			mapID = 949,
			typeID = RaceID.ArchRaceOgre,
		},
		["7:0.357337:0.290951"] = {
			-- The Crackling Plains Digsite
			blobID = 264231,
			mapID = 941,
			typeID = RaceID.ArchRaceDraenorOrc,
		},
		["7:0.597795:0.623269"] = {
			-- Umbrafen Digsite
			blobID = 307934,
			mapID = 947,
			typeID = RaceID.ArchRaceOgre,
		},
		["7:0.447328:0.711148"] = {
			-- Veil Akraz Digsite
			blobID = 307946,
			mapID = 948,
			typeID = RaceID.ArchRaceArakkoa,
		},
		["7:0.483174:0.606907"] = {
			-- Veil Shadar Digsite
			blobID = 307962,
			mapID = 946,
			typeID = RaceID.ArchRaceArakkoa,
		},
		["7:0.492235:0.796520"] = {
			-- Veil Zekk Digsite
			blobID = 307956,
			mapID = 948,
			typeID = RaceID.ArchRaceArakkoa,
		},
		["7:0.522232:0.293722"] = {
			-- Wildwood Wash Dam Digsite
			blobID = 308013,
			mapID = 949,
			typeID = RaceID.ArchRaceOgre,
		},
		["7:0.266599:0.371771"] = {
			-- Wor'gol Ridge Digsite
			blobID = 264225,
			mapID = 941,
			typeID = RaceID.ArchRaceDraenorOrc,
		},
		["7:0.418738:0.766039"] = {
			-- Writhing Mire Digsite
			blobID = 307948,
			mapID = 948,
			typeID = RaceID.ArchRaceOgre,
		},
		["7:0.499096:0.520875"] = {
			-- Zangarra Digsite
			blobID = 307966,
			mapID = 946,
			typeID = RaceID.ArchRaceOgre,
		},
		-- ----------------------------------------------------------------------------
		-- Broken Isles
		-- ----------------------------------------------------------------------------
		["8:0.575008:0.301631"] = {
			-- Digsite: Aggramar's Vault
			blobID = 346440,
			mapID = 1017,
			typeID = RaceID.ArchRaceDemons
		},
		["8:0.574158:0.341444"] = {
			-- Digsite: Amberfall Mesa
			blobID = 353961,
			mapID = 1017,
			typeID = RaceID.ArchRaceDemons
		},
		["8:0.385605:0.348530"] = {
			-- Digsite: Andu'talah
			blobID = 346508,
			mapID = 1018,
			typeID = RaceID.ArchRaceHighborneNightElves,
		},
		["8:0.461090:0.417884"] = {
			-- Digsite: Anora Hollow
			blobID = 363064,
			mapID = 1033,
			typeID = RaceID.ArchRaceDemons,
		},
		["8:0.401371:0.295898"] = {
			-- Digsite: Ashmane's Fall
			blobID = 354089,
			mapID = 1018,
			typeID = RaceID.ArchRaceHighborneNightElves,
		},
		["8:0.298442:0.338099"] = {
			-- Digsite: Black Rook Hold
			blobID = 354080,
			mapID = 1018,
			typeID = RaceID.ArchRaceHighborneNightElves,
		},
		["8:0.459232:0.148113"] = {
			-- Digsite: Bloodhunt Highland
			blobID = 353983,
			mapID = 1024,
			typeID = RaceID.ArchRaceHighmountainTauren,
		},
		["8:0.291329:0.359200"] = {
			-- Digsite: Bradensbrook
			blobID = 346502,
			mapID = 1018,
			typeID = RaceID.ArchRaceHighborneNightElves,
		},
		["8:0.658986:0.340886"] = {
			-- Digsite: Citrine Bay
			blobID = 353967,
			mapID = 1017,
			typeID = RaceID.ArchRaceDemons
		},
		["8:0.593003:0.399809"] = {
			-- Digsite: Cliffpaw Ridge
			blobID = 353970,
			mapID = 1017,
			typeID = RaceID.ArchRaceDemons
		},
		["8:0.534983:0.435322"] = {
			-- Digsite: Crimson Thicket
			blobID = 363027,
			mapID = 1033,
			typeID = RaceID.ArchRaceHighborneNightElves,
		},
		["8:0.543476:0.479594"] = {
			-- Digsite: Crimson Thicket
			blobID = 363060,
			mapID = 1033,
			typeID = RaceID.ArchRaceDemons,
		},
		["8:0.473618:0.188563"] = {
			-- Digsite: Darkfeather Valley
			blobID = 353987,
			mapID = 1024,
			typeID = RaceID.ArchRaceHighmountainTauren,
		},
		["8:0.505627:0.296137"] = {
			-- Digsite: Dragon's Falls
			blobID = 353993,
			mapID = 1024,
			typeID = RaceID.ArchRaceHighmountainTauren,
		},
		["8:0.371007:0.306647"] = {
			-- Digsite: Dreadroot
			blobID = 354251,
			mapID = 1018,
			typeID = RaceID.ArchRaceDemons,
		},
		["8:0.427701:0.432854"] = {
			-- Digsite: Eastern Ambervale
			blobID = 363017,
			mapID = 1033,
			typeID = RaceID.ArchRaceHighborneNightElves,
		},
		["8:0.631011:0.303383"] = {
			-- Digsite: Fallen Kings
			blobID = 353965,
			mapID = 1017,
			typeID = RaceID.ArchRaceDemons
		},
		["8:0.399354:0.506587"] = {
			-- Digsite: Farondale
			blobID = 354020,
			mapID = 1015,
			typeID = RaceID.ArchRaceDemons,
		},
		["8:0.405724:0.383008"] = {
			-- Digsite: Feathermane Hunting Grounds
			blobID = 346527,
			mapID = 1033,
			typeID = RaceID.ArchRaceDemons,
		},
		["8:0.440175:0.528006"] = {
			-- Digsite: Felsoul Hold
			blobID = 363056,
			mapID = 1033,
			typeID = RaceID.ArchRaceDemons,
		},
		["8:0.425896:0.184582"] = {
			-- Digsite: Fields of An'she
			blobID = 346475,
			mapID = 1024,
			typeID = RaceID.ArchRaceHighmountainTauren,
		},
		["8:0.378757:0.617903"] = {
			-- Digsite: Garden of Elune
			blobID = 354033,
			mapID = 1015,
			typeID = RaceID.ArchRaceHighborneNightElves,
		},
		["8:0.465284:0.449814"] = {
			-- Digsite: Gates of the City
			blobID = 363021,
			mapID = 1033,
			typeID = RaceID.ArchRaceHighborneNightElves,
		},
		["8:0.640035:0.370825"] = {
			-- Digsite: Gates of Valor
			blobID = 350063,
			mapID = 1017,
			typeID = RaceID.ArchRaceDemons,
		},
		["8:0.305502:0.443922"] = {
			-- Digsite: Kal'delar
			blobID = 346504,
			mapID = 1018,
			typeID = RaceID.ArchRaceHighborneNightElves,
		},
		["8:0.403229:0.475374"] = {
			-- Digsite: Koralune Estate
			blobID = 363029,
			mapID = 1033,
			typeID = RaceID.ArchRaceHighborneNightElves,
		},
		["8:0.308262:0.602774"] = {
			-- Digsite: Legion Camp: Chaos
			blobID = 346517,
			mapID = 1015,
			typeID = RaceID.ArchRaceDemons,
		},
		["8:0.358267:0.435959"] = {
			-- Digsite: Lightsong
			blobID = 346506,
			mapID = 1018,
			typeID = RaceID.ArchRaceHighborneNightElves,
		},
		["8:0.366973:0.540268"] = {
			-- Digsite: Llothien
			blobID = 346522,
			mapID = 1015,
			typeID = RaceID.ArchRaceHighborneNightElves,
		},
		["8:0.329283:0.547355"] = {
			-- Digsite: Llothien Highlands
			blobID = 354018,
			mapID = 1015,
			typeID = RaceID.ArchRaceDemons,
		},
		["8:0.387145:0.642268"] = {
			-- Digsite: Makrana
			blobID = 354031,
			mapID = 1015,
			typeID = RaceID.ArchRaceDemons,
		},
		["8:0.453181:0.482381"] = {
			-- Digsite: Meredil
			blobID = 363025,
			mapID = 1033,
			typeID = RaceID.ArchRaceHighborneNightElves,
		},
		["8:0.436884:0.467172"] = {
			-- Digsite: Meredil
			blobID = 363036,
			mapID = 1033,
			typeID = RaceID.ArchRaceDemons,
		},
		["8:0.443997:0.390095"] = {
			-- Digsite: Moonwhisper Gulch
			blobID = 346531,
			mapID = 1033,
			typeID = RaceID.ArchRaceHighborneNightElves,
		},
		["8:0.307094:0.555477"] = {
			-- Digsite: Nor'Danil Wellspring
			blobID = 354049,
			mapID = 1015,
			typeID = RaceID.ArchRaceHighborneNightElves,
		},
		["8:0.600169:0.284432"] = {
			-- Digsite: Northern Helmouth Shallows
			blobID = 346449,
			mapID = 1017,
			typeID = RaceID.ArchRaceDemons
		},
		["8:0.396859:0.408170"] = {
			-- Digsite: Northern Moonfall Retreat
			blobID = 363019,
			mapID = 1033,
			typeID = RaceID.ArchRaceHighborneNightElves,
		},
		["8:0.479245:0.265640"] = {
			-- Digsite: Northern Snowblind Mesa
			blobID = 353991,
			mapID = 1024,
			typeID = RaceID.ArchRaceHighmountainTauren,
		},
		["8:0.324187:0.693149"] = {
			-- Digsite: Northern Watcher Isle
			blobID = 354027,
			mapID = 1015,
			typeID = RaceID.ArchRaceDemons,
		},
		["8:0.335282:0.621327"] = {
			-- Digsite: Old Coast Path
			blobID = 354041,
			mapID = 1015,
			typeID = RaceID.ArchRaceHighborneNightElves,
		},
		["8:0.442936:0.203692"] = {
			-- Digsite: Pinerock Basin
			blobID = 353979,
			mapID = 1024,
			typeID = RaceID.ArchRaceHighmountainTauren,
		},
		["8:0.457852:0.230685"] = {
			-- Digsite: Prowler's Scratch
			blobID = 353977,
			mapID = 1024,
			typeID = RaceID.ArchRaceHighmountainTauren,
		},
		["8:0.355985:0.475055"] = {
			-- Digsite: Rhut'van Passage
			blobID = 354022,
			mapID = 1015,
			typeID = RaceID.ArchRaceDemons,
		},
		["8:0.371113:0.474498"] = {
			-- Digsite: Ruins of Zarkhenar
			blobID = 354045,
			mapID = 1015,
			typeID = RaceID.ArchRaceHighborneNightElves,
		},
		["8:0.461780:0.195092"] = {
			-- Digsite: Screeching Bend
			blobID = 346478,
			mapID = 1024,
			typeID = RaceID.ArchRaceHighmountainTauren
		},
		["8:0.358957:0.295420"] = {
			-- Digsite: Shala'nir
			blobID = 346512,
			mapID = 1018,
			typeID = RaceID.ArchRaceDemons,
		},
		["8:0.608344:0.373214"] = {
			-- Digsite: Skold-Ashil
			blobID = 353972,
			mapID = 1017,
			typeID = RaceID.ArchRaceDemons
		},
		["8:0.495754:0.193739"] = {
			-- Digsite: Sky Sepulcher
			blobID = 353989,
			mapID = 1024,
			typeID = RaceID.ArchRaceHighmountainTauren,
		},
		["8:0.603089:0.307842"] = {
			-- Digsite: Southern Helmouth Shallows
			blobID = 346447,
			mapID = 1017,
			typeID = RaceID.ArchRaceDemons
		},
		["8:0.481050:0.247008"] = {
			-- Digsite: Southern Snowblind Mesa
			blobID = 346481,
			mapID = 1024,
			typeID = RaceID.ArchRaceHighmountainTauren,
		},
		["8:0.428284:0.569650"] = {
			-- Digsite: Southern Suramar
			blobID = 363058,
			mapID = 1033,
			typeID = RaceID.ArchRaceDemons,
		},
		["8:0.365752:0.446868"] = {
			-- Digsite: Southern Wash
			blobID = 354093,
			mapID = 1018,
			typeID = RaceID.ArchRaceHighborneNightElves,
		},
		["8:0.340059:0.751514"] = {
			-- Digsite: Southern Watcher Isle (copy)
			blobID = 354029,
			mapID = 1015,
			typeID = RaceID.ArchRaceDemons,
		},
		["8:0.611582:0.262217"] = {
			-- Digsite: Storm's Reach
			blobID = 353963,
			mapID = 1017,
			typeID = RaceID.ArchRaceDemons
		},
		["8:0.582864:0.270020"] = {
			-- Digsite: Stormdrake Peak
			blobID = 346445,
			mapID = 1017,
			typeID = RaceID.ArchRaceDemons
		},
		["8:0.393408:0.457537"] = {
			-- Digsite: Sundered Shoals
			blobID = 363062,
			mapID = 1033,
			typeID = RaceID.ArchRaceDemons,
		},
		["8:0.398611:0.333481"] = {
			-- Digsite: Sundersong Glade
			blobID = 354087,
			mapID = 1018,
			typeID = RaceID.ArchRaceHighborneNightElves,
		},
		["8:0.369362:0.683355"] = {
			-- Digsite: Temple of a Thousand Lights
			blobID = 354043,
			mapID = 1015,
			typeID = RaceID.ArchRaceHighborneNightElves,
		},
		["8:0.331194:0.395509"] = {
			-- Digsite: Thas'talah
			blobID = 354245,
			mapID = 1018,
			typeID = RaceID.ArchRaceDemons,
		},
		["8:0.323603:0.347018"] = {
			-- Digsite: The Crescent Vale
			blobID = 346514,
			mapID = 1018,
			typeID = RaceID.ArchRaceDemons,
		},
		["8:0.484341:0.153289"] = {
			-- Digsite: The Haglands
			blobID = 353985,
			mapID = 1024,
			typeID = RaceID.ArchRaceHighmountainTauren,
		},
		["8:0.401902:0.599032"] = {
			-- Digsite: The Ruined Sancum
			blobID = 354037,
			mapID = 1015,
			typeID = RaceID.ArchRaceHighborneNightElves,
		},
		["8:0.301361:0.459210"] = {
			-- Digsite: The Tidal Marsh
			blobID = 354047,
			mapID = 1015,
			typeID = RaceID.ArchRaceHighborneNightElves,
		},
		["8:0.360337:0.374966"] = {
			-- Digsite: The Wildwood
			blobID = 354249,
			mapID = 1018,
			typeID = RaceID.ArchRaceDemons,
		},
		["8:0.442458:0.131551"] = {
			-- Digsite: The Witchwood
			blobID = 353981,
			mapID = 1024,
			typeID = RaceID.ArchRaceHighmountainTauren,
		},
		["8:0.302635:0.495598"] = {
			-- Digsite: Timeworn Strand
			blobID = 350662,
			mapID = 1015,
			typeID = RaceID.ArchRaceHighborneNightElves,
		},
		["8:0.287507:0.534615"] = {
			-- Digsite: Timeworn Strand
			blobID = 354025,
			mapID = 1015,
			typeID = RaceID.ArchRaceDemons,
		},
		["8:0.575008:0.234029"] = {
			-- Digsite: Warden's Bluff
			blobID = 353957,
			mapID = 1017,
			typeID = RaceID.ArchRaceDemons
		},
		["8:0.434973:0.269303"] = {
			-- Digsite: Whitewater Wash
			blobID = 344517,
			mapID = 1024,
			typeID = RaceID.ArchRaceHighmountainTauren,
		},
		["8:0.308634:0.407135"] = {
			-- Digsite: Wretched Hollow
			blobID = 354247,
			mapID = 1018,
			typeID = RaceID.ArchRaceDemons,
		},
	}

	local CONTINENT_RACES = {}
	private.CONTINENT_RACES = CONTINENT_RACES

	for siteKey, site in pairs(DIGSITE_TEMPLATES) do
		if site.typeID ~= RaceID.Unknown then
			local continentID = tonumber(((":"):split(siteKey)))
			CONTINENT_RACES[continentID] = CONTINENT_RACES[continentID] or {}
			CONTINENT_RACES[continentID][site.typeID] = true
		end
	end


	private.DIGSITE_TEMPLATES = DIGSITE_TEMPLATES
end
