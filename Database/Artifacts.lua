-- ----------------------------------------------------------------------------
-- Upvalued Lua API.
-- ----------------------------------------------------------------------------
-- Functions
local pairs = _G.pairs

-- ----------------------------------------------------------------------------
-- AddOn namespace.
-- ----------------------------------------------------------------------------
local FOLDER_NAME, private = ...

local LibStub = _G.LibStub
local L = LibStub("AceLocale-3.0"):GetLocale("Archy", false)
local Archy = LibStub("AceAddon-3.0"):GetAddon("Archy")

-- ----------------------------------------------------------------------------
-- Constants
-- ----------------------------------------------------------------------------

-- Extracted from ResearchProject.db2
-- ItemIDs obtained by matching ResearchProject name against known item-sparse names
function private.InitializeArtifactTemplates()
	local RaceID = private.RaceID

	local ARTIFACT_TEMPLATES = {
		-- ----------------------------------------------------------------------------
		-- Arakkoa
		-- ----------------------------------------------------------------------------
		[RaceID.ArchRaceArakkoa] = {
			[117354] = {
				-- Ancient Nest Guardian
				isRare = true,
				itemID = 117354,
				spellID = 172460,
			},
			[114204] = {
				-- Apexis Crystal
				itemID = 114204,
				spellID = 168328,
                pristineQuestId = 36778,
                pristineItemId = 114222,
			},
			[114205] = {
				-- Apexis Hieroglyph
				itemID = 114205,
				spellID = 168329,
                pristineQuestId = 36779,
                pristineItemId = 114223,
			},
			[114206] = {
				-- Apexis Scroll
				itemID = 114206,
				spellID = 168330,
                pristineQuestId = 36780,
                pristineItemId = 114224,
			},
			[114207] = {
				-- Beakbreaker of Terokk
				isRare = true,
				itemID = 114207,
				spellID = 168331,
			},
			[114198] = {
				-- Burial Urn
				itemID = 114198,
				spellID = 168322,
                pristineQuestId = 235346,
                pristineItemId = 114216,
			},
			[114199] = {
				-- Decree Scrolls
				itemID = 114199,
				spellID = 168323,
                pristineQuestId = 36773,
                pristineItemId = 114217,
			},
			[114197] = {
				-- Dreamcatcher
				itemID = 114197,
				spellID = 168321,
                pristineQuestId = 36771,
                pristineItemId = 114215,
			},
			[114203] = {
				-- Outcast Dreamcatcher
				itemID = 114203,
				spellID = 168327,
                pristineQuestId = 36777,
                pristineItemId = 114221,
			},
			[114200] = {
				-- Solar Orb
				itemID = 114200,
				spellID = 168324,
                pristineQuestId = 36774,
                pristineItemId = 114218,
			},
			[114201] = {
				-- Sundial
				itemID = 114201,
				spellID = 168325,
                pristineQuestId = 36775,
                pristineItemId = 114219,
			},
			[114202] = {
				-- Talonpriest Mask
				itemID = 114202,
				spellID = 168326,
                pristineQuestId = 36776,
                pristineItemId = 114220,
			},
		},

		-- ----------------------------------------------------------------------------
		-- Demons
		-- ----------------------------------------------------------------------------
		[RaceID.ArchRaceDemons] = {
			[131743] = {
				-- Blood of Young Mannoroth
				isRare = true,
				itemID = 131743,
				spellID = 223857,
			},
			[131724] = {
				-- Crystalline Eye of Undravius
				isRare = true,
				itemID = 131724,
				spellID = 223854,
			},
			[130917] = {
				-- Flayed-Skin Chronicle
				itemID = 130917,
				spellID = 196481,
                pristineQuestId = 40360,
                pristineItemId = 130932,
			},
			[130920] = {
				-- Houndstooth Hauberk
				itemID = 130920,
				spellID = 196484,
                pristineQuestId = 40363,
                pristineItemId = 130935,
			},
			[131735] = {
				-- Imp Generator
				isRare = true,
				itemID = 131735,
				spellID = 223855,
			},
			[130916] = {
				-- Imp's Cup
				itemID = 130916,
				spellID = 196480,
                pristineQuestId = 40359,
                pristineItemId = 130931,
			},
			[136922] = {
				-- Infernal Device
				isRare = true,
				itemID = 136922,
				spellID = 223856,
			},
			[130918] = {
				-- Malformed Abyssal
				itemID = 130918,
				spellID = 196482,
                pristineQuestId = 40361,
                pristineItemId = 130933,
			},
			[130919] = {
				-- Orb of Inner Chaos
				itemID = 130919,
				spellID = 196483,
                pristineQuestId = 40362,
                pristineItemId = 130934,
			},
			[131732] = {
				-- Purple Hills of Mac'Aree
				isRare = true,
				itemID = 131732,
				spellID = 223858,
			},
		},

		-- ----------------------------------------------------------------------------
		-- Draenei
		-- ----------------------------------------------------------------------------
		[RaceID.ArchRaceDraenei] = {
			[64440] = {
				-- Anklet with Golden Bells
				itemID = 64440,
				spellID = 90853,
			},
			[64456] = {
				-- Arrival of the Naaru
				isRare = true,
				itemID = 64456,
				spellID = 90983,
			},
			[64453] = {
				-- Baroque Sword Scabbard
				itemID = 64453,
				spellID = 90968,
			},
			[64442] = {
				-- Carved Harp of Exotic Wood
				itemID = 64442,
				spellID = 90860,
			},
			[64455] = {
				-- Dignified Portrait
				itemID = 64455,
				spellID = 90975,
			},
			[64454] = {
				-- Fine Crystal Candelabra
				itemID = 64454,
				spellID = 90974,
			},
			[64458] = {
				-- Plated Elekk Goad
				itemID = 64458,
				spellID = 90987,
			},
			[64444] = {
				-- Scepter of the Nathrezim
				itemID = 64444,
				spellID = 90864,
			},
			[64443] = {
				-- Strange Silver Paperweight
				itemID = 64443,
				spellID = 90861,
			},
			[64457] = {
				-- The Last Relic of Argus
				isRare = true,
				itemID = 64457,
				spellID = 90984,
			},
		},

		-- ----------------------------------------------------------------------------
		-- DraenorClans
		-- ----------------------------------------------------------------------------
		[RaceID.ArchRaceDraenorOrc] = {
			[116985] = {
				-- Headdress of the First Shaman
				isRare = true,
				itemID = 116985,
				spellID = 172459,
			},
			[114171] = {
				-- Ancestral Talisman
				itemID = 114171,
				spellID = 168305,
                pristineQuestId = 36756,
                pristineItemId = 114172,
			},
			[114163] = {
				-- Barbed Fishing Hook
				itemID = 114163,
				spellID = 168301,
                pristineQuestId = 235326,
                pristineItemId = 114164,
			},
			[114157] = {
				-- Blackrock Razor
				itemID = 114157,
				spellID = 168298,
                pristineQuestId = 36750,
                pristineItemId = 114158,
			},
			[114165] = {
				-- Calcified Eye In a Jar
				itemID = 114165,
				spellID = 168302,
                pristineQuestId = 36754,
                pristineItemId = 114166,
			},
			[114167] = {
				-- Ceremonial Tattoo Needles
				itemID = 114167,
				spellID = 168303,
                pristineQuestId = 36755,
                pristineItemId = 114168,
			},
			[114169] = {
				-- Cracked Ivory Idol
				itemID = 114169,
				spellID = 168304,
                pristineQuestId = 36757,
                pristineItemId = 114170,
			},
			[114177] = {
				-- Doomsday Prophecy
				itemID = 114177,
				spellID = 168308,
                pristineQuestId = 235333,
                pristineItemId = 114178,
			},
			[114155] = {
				-- Elemental Bellows
				itemID = 114155,
				spellID = 168297,
                pristineQuestId = 36749,
                pristineItemId = 114156,
			},
			[114141] = {
				-- Fang-Scarred Frostwolf Axe
				itemID = 114141,
				spellID = 168290,
                pristineQuestId = 36725,
                pristineItemId = 114142,
			},
			[114173] = {
				-- Flask of Blazegrease
				itemID = 114173,
				spellID = 168306,
                pristineQuestId = 36758,
                pristineItemId = 114174,
			},
			[114143] = {
				-- Frostwolf Ancestry Scrimshaw
				itemID = 114143,
				spellID = 168291,
                pristineQuestId = 36743,
                pristineItemId = 114144,
			},
			[117380] = {
				-- Frostwolf Ghostpup
				isRare = true,
				itemID = 117380,
				spellID = 172466,
			},
			[114175] = {
				-- Gronn-Tooth Necklace
				itemID = 114175,
				spellID = 168307,
                pristineQuestId = 36759,
                pristineItemId = 114176,
			},
			[114161] = {
				-- Hooked Dagger
				itemID = 114161,
				spellID = 168300,
                pristineQuestId = 36752,
                pristineItemId = 114162,
			},
			[114153] = {
				-- Metalworker's Hammer
				itemID = 114153,
				spellID = 168296,
                pristineQuestId = 36748,
                pristineItemId = 114154,
			},
			[114149] = {
				-- Screaming Bullroarer
				itemID = 114149,
				spellID = 168294,
                pristineQuestId = 36746,
                pristineItemId = 114150,
			},
			[114147] = {
				-- Warsinger's Drums
				itemID = 114147,
				spellID = 168293,
                pristineQuestId = 36745,
                pristineItemId = 114148,
			},
			[114151] = {
				-- Warsong Ceremonial Pike
				itemID = 114151,
				spellID = 168295,
                pristineQuestId = 36747,
                pristineItemId = 114152,
			},
			[114159] = {
				-- Weighted Chopping Axe
				itemID = 114159,
				spellID = 168299,
                pristineQuestId = 36751,
                pristineItemId = 114160,
			},
			[114145] = {
				-- Wolfskin Snowshoes
				itemID = 114145,
				spellID = 168292,
                pristineQuestId = 36744,
                pristineItemId = 114146,
			},
		},
		
		-- ----------------------------------------------------------------------------
		-- Drust
		-- ----------------------------------------------------------------------------
		[RaceID.ArchRaceDrust] = {

			[154921] = {
				-- Ceremonial Bonesaw
				itemID = 154921,
				spellID = 257715,
                pristineQuestId = 51950,
                pristineItemId = 154926,
			},
			[154922] = {
				-- Ancient Runebound Tome
				itemID = 154922,
				spellID = 257716,
                pristineQuestId = 51951,
                pristineItemId = 154927,
			},
			[154923] = {
				-- Disembowling Sickle
				itemID = 154923,
				spellID = 257717,
                pristineQuestId = 51952,
                pristineItemId = 154928,
			},
			[154924] = {
				-- Jagged Blade of the Drust
				itemID = 154924,
				spellID = 257718,
                pristineQuestId = 51953,
                pristineItemId = 154929,
			},
			[154925] = {
				-- Ritual Fetish
				itemID = 154925,
				spellID = 257719,
                pristineQuestId = 51954,
                pristineItemId = 154930,
			},
			[160741] = {
				-- Soul Coffer
				itemID = 160741,
				spellID = 273851,
                pristineQuestId = 51955,
                pristineItemId = 160742,
			},
			[160751] = {
				-- Dance of the Dead
				isRare = true,
				itemID = 160751,
				spellID = 273852,
			},
			[161089] = {
				-- Pile of Bones
				isRare = true,
				itemID = 161089,
				spellID = 273854,
			},
			[160833] = {
				-- Fetish of the Tormented Mind
				isRare = true,
				itemID = 160833,
				spellID = 273855,
			},
		},

		-- ----------------------------------------------------------------------------
		-- Dwarf
		-- ----------------------------------------------------------------------------
		[RaceID.ArchRaceDwarf] = {
			[63113] = {
				-- Belt Buckle with Anvilmar Crest
				itemID = 63113,
				spellID = 88910,
			},
			[64339] = {
				-- Bodacious Door Knocker
				itemID = 64339,
				spellID = 90411,
			},
			[63112] = {
				-- Bone Gaming Dice
				itemID = 63112,
				spellID = 86866,
			},
			[64340] = {
				-- Boot Heel with Scrollwork
				itemID = 64340,
				spellID = 90412,
			},
			[63409] = {
				-- Ceramic Funeral Urn
				itemID = 63409,
				spellID = 86864,
			},
			[64373] = {
				-- Chalice of the Mountain Kings
				isRare = true,
				itemID = 64373,
				spellID = 90553,
			},
			[64372] = {
				-- Clockwork Gnome
				isRare = true,
				itemID = 64372,
				spellID = 90521,
			},
			[64362] = {
				-- Dented Shield of Horuz Killcrow
				itemID = 64362,
				spellID = 90504,
			},
			[66054] = {
				-- Dwarven Baby Socks
				itemID = 66054,
				spellID = 93440,
			},
			[64342] = {
				-- Golden Chamber Pot
				itemID = 64342,
				spellID = 90413,
			},
			[64344] = {
				-- Ironstar's Petrified Shield
				itemID = 64344,
				spellID = 90419,
			},
			[64368] = {
				-- Mithril Chain of Angerforge
				itemID = 64368,
				spellID = 90518,
			},
			[63414] = {
				-- Moltenfist's Jeweled Goblet
				itemID = 63414,
				spellID = 89717,
			},
			[64337] = {
				-- Notched Sword of Tunadil the Redeemer
				itemID = 64337,
				spellID = 90410,
			},
			[63408] = {
				-- Pewter Drinking Cup
				itemID = 63408,
				spellID = 86857,
			},
			[64659] = {
				-- Pipe of Franclorn Forgewright
				itemID = 64659,
				spellID = 91793,
			},
			[64487] = {
				-- Scepter of Bronzebeard
				itemID = 64487,
				spellID = 91225,
			},
			[64367] = {
				-- Scepter of Charlga Razorflank
				itemID = 64367,
				spellID = 90509,
			},
			[64366] = {
				-- Scorched Staff of Shadow Priest Anund
				itemID = 64366,
				spellID = 90506,
			},
			[64483] = {
				-- Silver Kris of Korl
				itemID = 64483,
				spellID = 91219,
			},
			[63411] = {
				-- Silver Neck Torc
				itemID = 63411,
				spellID = 88181,
			},
			[64371] = {
				-- Skull Staff of Shadowforge
				itemID = 64371,
				spellID = 90519,
			},
			[64485] = {
				-- Spiked Gauntlets of Anvilrage
				itemID = 64485,
				spellID = 91223,
			},
			[64489] = {
				-- Staff of Sorcerer-Thane Thaurissan
				isRare = true,
				itemID = 64489,
				spellID = 91227,
			},
			[63410] = {
				-- Stone Gryphon
				itemID = 63410,
				spellID = 88180,
			},
			[64488] = {
				-- The Innkeeper's Daughter
				isRare = true,
				itemID = 64488,
				spellID = 91226,
			},
			[64484] = {
				-- Warmaul of Burningeye
				itemID = 64484,
				spellID = 91221,
			},
			[64343] = {
				-- Winged Helm of Corehammer
				itemID = 64343,
				spellID = 90415,
			},
			[63111] = {
				-- Wooden Whistle
				itemID = 63111,
				spellID = 88909,
			},
			[64486] = {
				-- Word of Empress Zoe
				itemID = 64486,
				spellID = 91224,
			},
			[63110] = {
				-- Worn Hunting Knife
				itemID = 63110,
				spellID = 86865,
			},
		},

		-- ----------------------------------------------------------------------------
		-- Fossil
		-- ----------------------------------------------------------------------------
		[RaceID.ArchRaceFossil] = {
			[69776] = {
				-- Ancient Amber
				isRare = true,
				itemID = 69776,
				spellID = 98560,
			},
			[64355] = {
				-- Ancient Shark Jaws
				itemID = 64355,
				spellID = 90452,
			},
			[63121] = {
				-- Beautiful Preserved Fern
				itemID = 63121,
				spellID = 88930,
			},
			[63109] = {
				-- Black Trilobite
				itemID = 63109,
				spellID = 88929,
			},
			[64349] = {
				-- Devilsaur Tooth
				itemID = 64349,
				spellID = 90432,
			},
			[69764] = {
				-- Extinct Turtle Shell
				isRare = true,
				itemID = 69764,
				spellID = 98533,
			},
			[64385] = {
				-- Feathered Raptor Arm
				itemID = 64385,
				spellID = 90617,
			},
			[60955] = {
				-- Fossilized Hatchling
				isRare = true,
				itemID = 60955,
				spellID = 89693,
			},
			[60954] = {
				-- Fossilized Raptor
				isRare = true,
				itemID = 60954,
				spellID = 90619,
			},
			[64473] = {
				-- Imprint of a Kraken Tentacle
				itemID = 64473,
				spellID = 91132,
			},
			[64350] = {
				-- Insect in Amber
				itemID = 64350,
				spellID = 90433,
			},
			[64468] = {
				-- Proto-Drake Skeleton
				itemID = 64468,
				spellID = 91089,
			},
			[69821] = {
				-- Pterrordax Hatchling
				isRare = true,
				itemID = 69821,
				spellID = 98582,
			},
			[66056] = {
				-- Shard of Petrified Wood
				itemID = 66056,
				spellID = 93442,
			},
			[66057] = {
				-- Strange Velvet Worm
				itemID = 66057,
				spellID = 93443,
			},
			[63527] = {
				-- Twisted Ammonite Shell
				itemID = 63527,
				spellID = 89895,
			},
			[64387] = {
				-- Vicious Ancient Fish
				itemID = 64387,
				spellID = 90618,
			},
		},

		-- ----------------------------------------------------------------------------
		-- Highborne Night Elves
		-- ----------------------------------------------------------------------------
		[RaceID.ArchRaceHighborneNightElves] = {
			[131740] = {
				-- Crown Jewels of Suramar
				isRare = true,
				itemID = 131740,
				spellID = 223846,
			},
			[130907] = {
				-- Inert Leystone Charm
				itemID = 130907,
				spellID = 196471,
                pristineQuestId = 40350,
                pristineItemId = 130922,
			},
			[131745] = {
				-- Key of Kalyndras
				isRare = true,
				itemID = 131745,
				spellID = 223848,
			},
			[131744] = {
				-- Key to Nar'thalas Academy
				isRare = true,
				itemID = 131744,
				spellID = 223850,
			},
			[130910] = {
				-- Nobleman's Letter Opener
				itemID = 130910,
				spellID = 196474,
                pristineQuestId = 40353,
                pristineItemId = 130925,
			},
			[134078] = {
				-- Orb of Sciallax
				isRare = true,
				itemID = 134078,
				spellID = 223849,
			},
			[130909] = {
				-- Pre-War Highborne Tapestry
				itemID = 130909,
				spellID = 196473,
                pristineQuestId = 40352,
                pristineItemId = 130924,
			},
			[130908] = {
				-- Quietwine Vial
				itemID = 130908,
				spellID = 196472,
                pristineQuestId = 40351,
                pristineItemId = 130923,
			},
			[131717] = {
				-- Starlight Beacon
				isRare = true,
				itemID = 131717,
				spellID = 223844,
			},
			[130906] = {
				-- Violetglass Vessel
				itemID = 130906,
				spellID = 196470,
                pristineQuestId = 40349,
                pristineItemId = 130921,
			},
		},

		-- ----------------------------------------------------------------------------
		-- Highmountain Tauren
		-- ----------------------------------------------------------------------------
		[RaceID.ArchRaceHighmountainTauren] = {
			[130914] = {
				-- Drogbar Gem-Roller
				itemID = 130914,
				spellID = 196478,
                pristineQuestId = 40357,
                pristineItemId = 130929,
			},
			[130913] = {
				-- Hand-Smoothed Pyrestone
				itemID = 130913,
				spellID = 196477,
                pristineQuestId = 40356,
                pristineItemId = 130928,
			},
			[130912] = {
				-- Moosebone Fish-Hook
				itemID = 130912,
				spellID = 196476,
                pristineQuestId = 40355,
                pristineItemId = 130927,
			},
			[131736] = {
				-- Prizerock Neckband
				isRare = true,
				itemID = 131736,
				spellID = 223852,
			},
			[131733] = {
				-- Spear of Rethu
				isRare = true,
				itemID = 131733,
				spellID = 223851,
			},
			[131734] = {
				-- Spirit of Eche'ro
				isRare = true,
				itemID = 131734,
				spellID = 223853,
			},
			[130915] = {
				-- Stonewood Bow
				itemID = 130915,
				spellID = 196479,
                pristineQuestId = 40358,
                pristineItemId = 130930,
			},
			[130911] = {
				-- Trailhead Drum
				itemID = 130911,
				spellID = 196475,
                pristineQuestId = 40354,
                pristineItemId = 130926,
			},
		},

		-- ----------------------------------------------------------------------------
		-- Mantid
		-- ----------------------------------------------------------------------------
		[RaceID.ArchRaceMantid] = {
			[95376] = {
				-- Ancient Sap Feeder
				itemID = 95376,
				spellID = 139779,
                pristineQuestId = 32687,
                pristineItemId = 95384,
			},
			[95375] = {
				-- Banner of the Mantid Empire
				itemID = 95375,
				spellID = 139776,
                pristineQuestId = 32686,
                pristineItemId = 95383,
			},
			[95378] = {
				-- Inert Sound Beacon
				itemID = 95378,
				spellID = 139781,
                pristineQuestId = 32689,
                pristineItemId = 95386,
			},
			[95382] = {
				-- Kypari Sap Container
				itemID = 95382,
				spellID = 139785,
                pristineQuestId = 32693,
                pristineItemId = 95390,
			},
			[95380] = {
				-- Mantid Lamp
				itemID = 95380,
				spellID = 139783,
                pristineQuestId = 32691,
                pristineItemId = 95388,
			},
			[95391] = {
				-- Mantid Sky Reaver
				isRare = true,
				itemID = 95391,
				spellID = 139786,
			},
			[95381] = {
				-- Pollen Collector
				itemID = 95381,
				spellID = 139784,
                pristineQuestId = 32692,
                pristineItemId = 95389,
			},
			[95379] = {
				-- Remains of a Paragon
				itemID = 95379,
				spellID = 139782,
                pristineQuestId = 32690,
                pristineItemId = 95387,
			},
			[95392] = {
				-- Sonic Pulse Generator
				isRare = true,
				itemID = 95392,
				spellID = 139787,
			},
			[95377] = {
				-- The Praying Mantid
				itemID = 95377,
				spellID = 139780,
                pristineQuestId = 95385,
                pristineItemId = 32688,
			},
		},

		-- ----------------------------------------------------------------------------
		-- Mogu
		-- ----------------------------------------------------------------------------
		[RaceID.ArchRaceMogu] = {
			[89614] = {
				-- Anatomical Dummy
				isRare = true,
				itemID = 89614,
				spellID = 113993,
			},
			[89611] = {
				-- Quilen Statuette
				isRare = true,
				itemID = 89611,
				spellID = 113992,
			},
			[79909] = {
				-- Cracked Mogu Runestone
				itemID = 79909,
				spellID = 113983,
                pristineQuestId = 31787,
                pristineItemId = 89170,
			},
			[79913] = {
				-- Edicts of the Thunder King
				itemID = 79913,
				spellID = 113987,
                pristineQuestId = 31791,
                pristineItemId = 89174,
			},
			[79914] = {
				-- Iron Amulet
				itemID = 79914,
				spellID = 113988,
                pristineQuestId = 31792,
                pristineItemId = 89175,
			},
			[79908] = {
				-- Manacles of Rebellion
				itemID = 79908,
				spellID = 113982,
                pristineQuestId = 31786,
                pristineItemId = 89169,
			},
			[79916] = {
				-- Mogu Coin
				itemID = 79916,
				spellID = 113990,
                pristineQuestId = 31794,
                pristineItemId = 85477,
			},
			[79911] = {
				-- Petrified Bone Whip
				itemID = 79911,
				spellID = 113985,
                pristineQuestId = 31789,
                pristineItemId = 89172,
			},
			[79910] = {
				-- Terracotta Arm
				itemID = 79910,
				spellID = 113984,
                pristineQuestId = 31788,
                pristineItemId = 89171,
			},
			[79912] = {
				-- Thunder King Insignia
				itemID = 79912,
				spellID = 113986,
                pristineQuestId = 31790,
                pristineItemId = 89173,
			},
			[79915] = {
				-- Warlord's Branding Iron
				itemID = 79915,
				spellID = 113989,
                pristineQuestId = 89176,
                pristineItemId = 31793,
			},
			[79917] = {
				-- Worn Monument Ledger
				itemID = 79917,
				spellID = 113991,
                pristineQuestId = 31805, -- Another Quest? 32105
                pristineItemId = 89209,
			},
		},

		-- ----------------------------------------------------------------------------
		-- Nerubian
		-- ----------------------------------------------------------------------------
		[RaceID.ArchRaceNerubian] = {
			[64481] = {
				-- Blessing of the Old God
				isRare = true,
				itemID = 64481,
				spellID = 91214,
			},
			[64479] = {
				-- Ewer of Jormungar Blood
				itemID = 64479,
				spellID = 91209,
			},
			[64477] = {
				-- Gruesome Heart Box
				itemID = 64477,
				spellID = 91191,
			},
			[64476] = {
				-- Infested Ruby Ring
				itemID = 64476,
				spellID = 91188,
			},
			[64482] = {
				-- Puzzle Box of Yogg-Saron
				isRare = true,
				itemID = 64482,
				spellID = 91215,
			},
			[64475] = {
				-- Scepter of Nezar'Azret
				itemID = 64475,
				spellID = 91170,
			},
			[64478] = {
				-- Six-Clawed Cornice
				itemID = 64478,
				spellID = 91197,
			},
			[64474] = {
				-- Spidery Sundial
				itemID = 64474,
				spellID = 91133,
			},
			[64480] = {
				-- Vizier's Scrawled Streamer
				itemID = 64480,
				spellID = 91211,
			},
		},

		-- ----------------------------------------------------------------------------
		-- Night Elf
		-- ----------------------------------------------------------------------------
		[RaceID.ArchRaceNightElf] = {
			[64646] = {
				-- Bones of Transformation
				isRare = true,
				itemID = 64646,
				spellID = 91761,
			},
			[64647] = {
				-- Carcanet of the Hundred Magi
				itemID = 64647,
				spellID = 91762,
			},
			[64379] = {
				-- Chest of Tiny Glass Animals
				itemID = 64379,
				spellID = 90610,
			},
			[63407] = {
				-- Cloak Clasp with Antlers
				itemID = 63407,
				spellID = 89696,
			},
			[63525] = {
				-- Coin from Eldre'Thalas
				itemID = 63525,
				spellID = 89893,
			},
			[64381] = {
				-- Cracked Crystal Vial
				itemID = 64381,
				spellID = 90611,
			},
			[64357] = {
				-- Delicate Music Box
				itemID = 64357,
				spellID = 90458,
			},
			[64361] = {
				-- Druid and Priest Statue Set
				isRare = true,
				itemID = 64361,
				spellID = 90493,
			},
			[63528] = {
				-- Green Dragon Ring
				itemID = 63528,
				spellID = 89896,
			},
			[64356] = {
				-- Hairpin of Silver and Malachite
				itemID = 64356,
				spellID = 90453,
			},
			[63129] = {
				-- Highborne Pyxis
				itemID = 63129,
				spellID = 89009,
			},
			[64358] = {
				-- Highborne Soul Mirror
				isRare = true,
				itemID = 64358,
				spellID = 90464,
			},
			[63130] = {
				-- Inlaid Ivory Comb
				itemID = 63130,
				spellID = 89012,
			},
			[64354] = {
				-- Kaldorei Amphora
				itemID = 64354,
				spellID = 90451,
			},
			[64383] = {
				-- Kaldorei Wind Chimes
				isRare = true,
				itemID = 64383,
				spellID = 90614,
			},
			[66055] = {
				-- Necklace with Elune Pendant
				itemID = 66055,
				spellID = 93441,
			},
			[64643] = {
				-- Queen Azshara's Dressing Gown
				isRare = true,
				itemID = 64643,
				spellID = 90616,
			},
			[63131] = {
				-- Scandalous Silk Nightgown
				itemID = 63131,
				spellID = 89014,
			},
			[64382] = {
				-- Scepter of Xavius
				itemID = 64382,
				spellID = 90612,
			},
			[63526] = {
				-- Shattered Glaive
				itemID = 63526,
				spellID = 89894,
			},
			[64648] = {
				-- Silver Scroll Case
				itemID = 64648,
				spellID = 91766,
			},
			[64378] = {
				-- String of Small Pink Pearls
				itemID = 64378,
				spellID = 90609,
			},
			[64645] = {
				-- Tyrande's Favorite Doll
				isRare = true,
				itemID = 64645,
				spellID = 91757,
			},
			[64650] = {
				-- Umbra Crescent
				itemID = 64650,
				spellID = 91769,
			},
			[64651] = {
				-- Wisp Amulet
				isRare = true,
				itemID = 64651,
				spellID = 91773,
			},
		},

		-- ----------------------------------------------------------------------------
		-- Ogre
		-- ----------------------------------------------------------------------------
		[RaceID.ArchRaceOgre] = {
			[114191] = {
				-- Eye of Har'gunn the Blind
				itemID = 114191,
				spellID = 168315,
                pristineQuestId = 36767,
                pristineItemId = 114210,
			},
			[114189] = {
				-- Gladiator's Shield
				itemID = 114189,
				spellID = 168313,
                pristineQuestId = 36765,
                pristineItemId = 114208,
			},
			[114194] = {
				-- Imperial Decree Stele
				itemID = 114194,
				spellID = 168318,
                pristineQuestId = 36770,
                pristineItemId = 114213,
			},
			[114190] = {
				-- Mortar and Pestle
				itemID = 114190,
				spellID = 168314,
                pristineQuestId = 36766,
                pristineItemId = 114209,
			},
			[114185] = {
				-- Ogre Figurine
				itemID = 114185,
				spellID = 168311,
                pristineQuestId = 36763,
                pristineItemId = 114186,
			},
			[114187] = {
				-- Pictogram Carving
				itemID = 114187,
				spellID = 168312,
                pristineQuestId = 36764,
                pristineItemId = 114188,
			},
			[114193] = {
				-- Rylak Riding Harness
				itemID = 114193,
				spellID = 168317,
                pristineQuestId = 36769,
                pristineItemId = 114212,
			},
			[114195] = {
				-- Sorcerer-King Toe Ring
				isRare = true,
				itemID = 114195,
				spellID = 168319,
			},
			[114192] = {
				-- Stone Dentures
				itemID = 114192,
				spellID = 168316,
                pristineQuestId = 36768,
                pristineItemId = 114211,
			},
			[114183] = {
				-- Stone Manacles
				itemID = 114183,
				spellID = 168310,
                pristineQuestId = 36762,
                pristineItemId = 114184,
			},
			[114181] = {
				-- Stonemaul Succession Stone
				itemID = 114181,
				spellID = 168309,
                pristineQuestId = 36761,
                pristineItemId = 114182,
			},
			[114196] = {
				-- Warmaul of the Warmaul Chieftain
				isRare = true,
				itemID = 114196,
				spellID = 168320,
			},
		},

		-- ----------------------------------------------------------------------------
		-- Orc
		-- ----------------------------------------------------------------------------
		[RaceID.ArchRaceOrc] = {
			[64436] = {
				-- Fiendish Whip
				itemID = 64436,
				spellID = 90831,
			},
			[64421] = {
				-- Fierce Wolf Figurine
				itemID = 64421,
				spellID = 90734,
			},
			[64418] = {
				-- Gray Candle Stub
				itemID = 64418,
				spellID = 90728,
			},
			[64644] = {
				-- Headdress of the First Shaman
				isRare = true,
				itemID = 64644,
				spellID = 90843,
			},
			[64417] = {
				-- Maul of Stone Guard Mur'og
				itemID = 64417,
				spellID = 90720,
			},
			[64419] = {
				-- Rusted Steak Knife
				itemID = 64419,
				spellID = 90730,
			},
			[64420] = {
				-- Scepter of Nekros Skullcrusher
				itemID = 64420,
				spellID = 90732,
			},
			[64438] = {
				-- Skull Drinking Cup
				itemID = 64438,
				spellID = 90833,
			},
			[64437] = {
				-- Tile of Glazed Clay
				itemID = 64437,
				spellID = 90832,
			},
			[64389] = {
				-- Tiny Bronze Scorpion
				itemID = 64389,
				spellID = 90622,
			},
		},

		-- ----------------------------------------------------------------------------
		-- Pandaren
		-- ----------------------------------------------------------------------------
		[RaceID.ArchRacePandaren] = {
			[79903] = {
				-- Apothecary Tins
				itemID = 79903,
				spellID = 113977,
                pristineQuestId = 31802,
                pristineItemId = 89183,
			},
			[79901] = {
				-- Carved Bronze Mirror
				itemID = 79901,
				spellID = 113975,
                pristineQuestId = 31800,
                pristineItemId = 89181,
			},
			[79900] = {
				-- Empty Keg
				itemID = 79900,
				spellID = 113974,
                pristineQuestId = 31799,
                pristineItemId = 89180,
			},
			[79902] = {
				-- Gold-Inlaid Figurine
				itemID = 79902,
				spellID = 113976,
                pristineQuestId = 31801,
                pristineItemId = 89182,
			},
			[79897] = {
				-- Pandaren Game Board
				itemID = 79897,
				spellID = 113971,
                pristineQuestId = 31796,
                pristineItemId = 85558,
			},
			[79896] = {
				-- Pandaren Tea Set
				itemID = 79896,
				spellID = 113968,
                pristineQuestId = 31795,
                pristineItemId = 85557,
			},
			[79904] = {
				-- Pearl of Yu'lon
				itemID = 79904,
				spellID = 113978,
                pristineQuestId = 31803,
                pristineItemId = 89184,
			},
			[79907] = {
				-- Spear of Xuen
				isRare = true,
				itemID = 79907,
				spellID = 113981,
			},
			[79905] = {
				-- Standard of Niuzao
				itemID = 79905,
				spellID = 113979,
                pristineQuestId = 31804,
                pristineItemId = 89185,
			},
			[79898] = {
				-- Twin Stein Set
				itemID = 79898,
				spellID = 113972,
                pristineQuestId = 31797,
                pristineItemId = 89178,
			},
			[79906] = {
				-- Umbrella of Chi-Ji
				isRare = true,
				itemID = 79906,
				spellID = 113980,
			},
			[79899] = {
				-- Walking Cane
				itemID = 79899,
				spellID = 113973,
                pristineQuestId = 31798,
                pristineItemId = 89179,
			},
		},

		-- ----------------------------------------------------------------------------
		-- Tolvir
		-- ----------------------------------------------------------------------------
		[RaceID.ArchRaceTolvir] = {
			[64657] = {
				-- Canopic Jar
				itemID = 64657,
				spellID = 91790,
			},
			[64652] = {
				-- Castle of Sand
				itemID = 64652,
				spellID = 91775,
			},
			[64653] = {
				-- Cat Statue with Emerald Eyes
				itemID = 64653,
				spellID = 91779,
			},
			[60847] = {
				-- Crawling Claw
				isRare = true,
				itemID = 60847,
				projectName = L["ProjectNames/Mummified Monkey Paw"],
				spellID = 92137,
			},
			[64656] = {
				-- Engraved Scimitar Hilt
				itemID = 64656,
				spellID = 91785,
			},
			[64881] = {
				-- Pendant of the Scarab Storm
				isRare = true,
				itemID = 64881,
				spellID = 92145,
			},
			[64904] = {
				-- Ring of the Boy Emperor
				isRare = true,
				itemID = 64904,
				spellID = 92168,
			},
			[64883] = {
				-- Scepter of Azj'Aqir
				isRare = true,
				itemID = 64883,
				spellID = 92148,
			},
			[64885] = {
				-- Scimitar of the Sirocco
				isRare = true,
				itemID = 64885,
				spellID = 92163,
			},
			[64658] = {
				-- Sketch of a Desert Palace
				itemID = 64658,
				spellID = 91792,
			},
			[64654] = {
				-- Soapstone Scarab Necklace
				itemID = 64654,
				spellID = 91780,
			},
			[64880] = {
				-- Staff of Ammunae
				isRare = true,
				itemID = 64880,
				spellID = 92139,
			},
			[64655] = {
				-- Tiny Oasis Mosaic
				itemID = 64655,
				spellID = 91782,
			},
		},

		-- ----------------------------------------------------------------------------
		-- Troll
		-- ----------------------------------------------------------------------------
		[RaceID.ArchRaceTroll] = {
			[64348] = {
				-- Atal'ai Scepter
				itemID = 64348,
				spellID = 90429,
			},
			[64346] = {
				-- Bracelet of Jade and Coins
				itemID = 64346,
				spellID = 90421,
			},
			[63524] = {
				-- Cinnabar Bijou
				itemID = 63524,
				spellID = 89891,
			},
			[64375] = {
				-- Drakkari Sacrificial Knife
				itemID = 64375,
				spellID = 90581,
			},
			[63523] = {
				-- Eerie Smolderthorn Idol
				itemID = 63523,
				spellID = 89890,
			},
			[63413] = {
				-- Feathered Gold Earring
				itemID = 63413,
				spellID = 89711,
			},
			[63120] = {
				-- Fetish of Hir'eek
				itemID = 63120,
				spellID = 88907,
			},
			[66058] = {
				-- Fine Bloodscalp Dinnerware
				itemID = 66058,
				spellID = 93444,
			},
			[64347] = {
				-- Gahz'rilla Figurine
				itemID = 64347,
				spellID = 90423,
			},
			[69777] = {
				-- Haunted War Drum
				isRare = true,
				itemID = 69777,
				spellID = 98556,
			},
			[63412] = {
				-- Jade Asp with Ruby Eyes
				itemID = 63412,
				spellID = 89701,
			},
			[63118] = {
				-- Lizard Foot Charm
				itemID = 63118,
				spellID = 88908,
			},
			[64345] = {
				-- Skull-Shaped Planter
				itemID = 64345,
				spellID = 90420,
			},
			[64374] = {
				-- Tooth with Gold Filling
				itemID = 64374,
				spellID = 90558,
			},
			[69824] = {
				-- Voodoo Figurine
				isRare = true,
				itemID = 69824,
				spellID = 98588,
			},
			[63115] = {
				-- Zandalari Voodoo Doll
				itemID = 63115,
				spellID = 88262,
			},
			[64377] = {
				-- Zin'rokh, Destroyer of Worlds
				isRare = true,
				itemID = 64377,
				spellID = 90608,
			},
		},

		-- ----------------------------------------------------------------------------
		-- Vrykul
		-- ----------------------------------------------------------------------------
		[RaceID.ArchRaceVrykul] = {
			[64464] = {
				-- Fanged Cloak Pin
				itemID = 64464,
				spellID = 91014,
			},
			[64462] = {
				-- Flint Striker
				itemID = 64462,
				spellID = 91012,
			},
			[64459] = {
				-- Intricate Treasure Chest Key
				itemID = 64459,
				spellID = 90988,
			},
			[64460] = {
				-- Nifflevar Bearded Axe
				isRare = true,
				itemID = 64460,
				spellID = 90997,
			},
			[64461] = {
				-- Scramseax
				itemID = 64461,
				spellID = 91008,
			},
			[64467] = {
				-- Thorned Necklace
				itemID = 64467,
				spellID = 91084,
			},
			[69775] = {
				-- Vrykul Drinking Horn
				isRare = true,
				itemID = 69775,
				spellID = 98569,
				usesItemForProjectName = true,
			},
		},

		-- ----------------------------------------------------------------------------
		-- Zandalari
		-- ----------------------------------------------------------------------------
		[RaceID.ArchRaceZandalari] = {		
			[154913] = {
				-- Akun'Jar Vase
				itemID = 154913,
				spellID = 257720,
                pristineQuestId = 51926,
                pristineItemId = 154931,
			},
			[154914] = {
				-- Urn of Passage
				itemID = 154914,
				spellID = 257721,
                pristineQuestId = 51929,
                pristineItemId = 154932,
			},
			[154915] = {
				-- Rezan Idol
				itemID = 154915,
				spellID = 257722,
                pristineQuestId = 51932,
                pristineItemId = 154933,
			},
			[154916] = {
				-- High Apothecary's Hood
				itemID = 154916,
				spellID = 257723,
                pristineQuestId = 51934,
                pristineItemId = 154934,
			},
			[154917] = {
				-- Bwonsamdi Voodoo Mask
				itemID = 154917,
				spellID = 257724,
                pristineQuestId = 51936,
                pristineItemId = 154935,
			},
			[160740] = {
				-- Croak Crock
				isRare = true,
				itemID = 160740,
				spellID = 273815,
			},
			[160743] = {
				-- Blowgun of the Sethra
				itemID = 160743,
				spellID = 273812,
                pristineQuestId = 51937,
                pristineItemId = 160744,
			},
			[160753] = {
				-- Sanguinating Totem
				isRare = true,
				itemID = 160753,
				spellID = 273819,
			},
			[161080] = {
				-- Intact Direhorn Hatchling
				isRare = true,
				itemID = 161080,
				spellID = 273817,
			},
		},
	}

	private.ARTIFACT_TEMPLATES = ARTIFACT_TEMPLATES

    local PRISTINE_ARTIFACT_TO_QUESTID = {}
	for raceID = 1, _G.GetNumArchaeologyRaces() do
		local artifactTemplates = private.ARTIFACT_TEMPLATES[raceID]

		if artifactTemplates then
			local race = private.Races[raceID]

			for itemID, template in pairs(artifactTemplates) do
				if not race:AddOrUpdateArtifactFromTemplate(template) then
					private.RaceArtifactProcessingQueue[template] = race
					Archy:RegisterEvent("GET_ITEM_INFO_RECEIVED")
				end
                if template.pristineItemId then
                    PRISTINE_ARTIFACT_TO_QUESTID[template.pristineItemId] = template.pristineQuestId
                end
			end

			race:UpdateCurrentProject()
		end
	end
	private.PRISTINE_ARTIFACT_TO_QUESTID = PRISTINE_ARTIFACT_TO_QUESTID
end
