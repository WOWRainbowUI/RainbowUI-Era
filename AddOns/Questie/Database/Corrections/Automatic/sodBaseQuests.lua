---@type SeasonOfDiscovery
local SeasonOfDiscovery = QuestieLoader:ImportModule("SeasonOfDiscovery")
---@type QuestieDB
local QuestieDB = QuestieLoader:ImportModule("QuestieDB")
---@type ZoneDB
local ZoneDB = QuestieLoader:ImportModule("ZoneDB")

--- Load the base quests for Season of Discovery
--- These are generated, do NOT EDIT the data entries here.
--- If you want to edit a quest, do so in sodQuestFixes.lua
function SeasonOfDiscovery:LoadBaseQuests()
    local questKeys = QuestieDB.questKeys
    local zoneIDs = ZoneDB.zoneIDs
    local raceIDs = QuestieDB.raceKeys
    local classIDs = QuestieDB.classKeys
    local sortKeys = QuestieDB.sortKeys

    return {
        [77568] = {
            [questKeys.name] = "A Hunter's Strength",
            [questKeys.startedBy] = {{3596}},
            [questKeys.finishedBy] = {{3596,}},
            [questKeys.requiredLevel] = 2,
            [questKeys.questLevel] = 2,
            [questKeys.requiredRaces] = raceIDs.ALL_ALLIANCE,
            [questKeys.requiredClasses] = classIDs.HUNTER,
            [questKeys.objectivesText] = {"Defeat Githyiss the Vile in Shadowthread Cave and recover the lost rune. Learn the rune, then report back to Ayanna Everstride in Shadowglen."},
            [questKeys.objectives] = {nil,nil,nil,nil,nil,{{410121}}},
        },
        [77571] = {
            [questKeys.name] = "Relics of the Kaldorei",
            [questKeys.startedBy] = {{3597}},
            [questKeys.finishedBy] = {{3597,}},
            [questKeys.requiredLevel] = 2,
            [questKeys.questLevel] = 2,
            [questKeys.requiredRaces] = raceIDs.ALL_ALLIANCE,
            [questKeys.requiredClasses] = classIDs.DRUID,
            [questKeys.objectivesText] = {"Recover the relic from the grellkin in Shadowglen. Follow the relic's guidance to learn a new ability, then report back to Mardant Strongoak."},
            [questKeys.objectives] = {nil,nil,nil,nil,nil,{{410061}}},
        },
        [77585] = {
            [questKeys.name] = "Icons of Power",
            [questKeys.startedBy] = {{3157}},
            [questKeys.finishedBy] = {{3157,}},
            [questKeys.requiredLevel] = 2,
            [questKeys.questLevel] = 2,
            [questKeys.requiredRaces] = raceIDs.ALL_HORDE,
            [questKeys.requiredClasses] = classIDs.SHAMAN,
            [questKeys.objectivesText] = {"Find the stolen icon by slaying scorpids in the Valley of Trials. Learn its power, then report back to Shikrik."},
            [questKeys.objectives] = {nil,nil,nil,nil,nil,{{410094}}},
        },
        [77587] = {
            [questKeys.name] = "Icons of Power",
            [questKeys.startedBy] = {{3157}},
            [questKeys.finishedBy] = {{3157,}},
            [questKeys.requiredLevel] = 2,
            [questKeys.questLevel] = 2,
            [questKeys.requiredRaces] = raceIDs.ALL_HORDE,
            [questKeys.requiredClasses] = classIDs.SHAMAN,
            [questKeys.objectivesText] = {"Find the stolen icon by slaying scorpids in the Valley of Trials. Learn its power, then report back to Shikrik."},
            [questKeys.objectives] = {nil,nil,nil,nil,nil,{{410094}}},
        },
        [77617] = {
            [questKeys.name] = "Relics of the Light",
            [questKeys.startedBy] = {{925}},
            [questKeys.finishedBy] = {{925,}},
            [questKeys.requiredLevel] = 2,
            [questKeys.questLevel] = 2,
            [questKeys.requiredRaces] = raceIDs.ALL_ALLIANCE,
            [questKeys.requiredClasses] = classIDs.PALADIN,
            [questKeys.objectivesText] = {"Recover the libram and follow its guidance to learn a new ability, then return to Brother Sammuel in Northshire."},
            [questKeys.objectives] = {nil,nil,nil,nil,nil,{{410002}}},
        },
        [77648] = {
            [questKeys.name] = "Relics of the Tauren",
            [questKeys.startedBy] = {{3060}},
            [questKeys.finishedBy] = {{3060,}},
            [questKeys.requiredLevel] = 2,
            [questKeys.questLevel] = 2,
            [questKeys.requiredRaces] = raceIDs.ALL_HORDE,
            [questKeys.requiredClasses] = classIDs.DRUID,
            [questKeys.objectivesText] = {"Recover the stolen relic from Brambleblade Ravine. Follow the relic's guidance to learn a new ability, then report back to Gart Mistrunner in Camp Narache."},
            [questKeys.objectives] = {nil,nil,nil,nil,nil,{{410061}}},
        },
        [77649] = {
            [questKeys.name] = "A Hunter's Strength",
            [questKeys.startedBy] = {{3061}},
            [questKeys.finishedBy] = {{3061,}},
            [questKeys.requiredLevel] = 2,
            [questKeys.questLevel] = 2,
            [questKeys.requiredRaces] = raceIDs.ALL_HORDE,
            [questKeys.requiredClasses] = classIDs.HUNTER,
            [questKeys.objectivesText] = {"Find the missing rune by slaying Bristleback Battleboars in Brambleblade Ravine. Use the rune to learn a new ability, then report back to Lanka Farshot in Camp Narache."},
            [questKeys.objectives] = {nil,nil,nil,nil,nil,{{410121}}},
        },
        [77652] = {
            [questKeys.name] = "Icons of Power",
            [questKeys.startedBy] = {{3062}},
            [questKeys.finishedBy] = {{3062,}},
            [questKeys.requiredLevel] = 2,
            [questKeys.questLevel] = 2,
            [questKeys.requiredRaces] = raceIDs.ALL_HORDE,
            [questKeys.requiredClasses] = classIDs.SHAMAN,
            [questKeys.objectivesText] = {"Recover the lost icon from the Bristleback Shamans in Brambleblade Ravine. Learn its power, then report back to Harutt Thunderhorn in Camp Narache."},
            [questKeys.objectives] = {nil,nil,nil,nil,nil,{{410094}}},
        },
        [77666] = {
            [questKeys.name] = "Stolen Power",
            [questKeys.startedBy] = {{460}},
            [questKeys.finishedBy] = {{460,}},
            [questKeys.requiredLevel] = 2,
            [questKeys.questLevel] = 2,
            [questKeys.requiredRaces] = raceIDs.ALL_ALLIANCE,
            [questKeys.requiredClasses] = classIDs.WARLOCK,
            [questKeys.objectivesText] = {"Recover the rune from the group of Troggs, southwest of Anvilmar, and use it to learn a new ability. Then, return to Alamar Grimm in Anvilmar."},
            [questKeys.objectives] = nil,
        },
        [78089] = {
            [questKeys.name] = "Advice From Stormwind",
            [questKeys.startedBy] = {{3663}},
            [questKeys.finishedBy] = {{5492,}},
            [questKeys.requiredLevel] = 1,
            [questKeys.questLevel] = 25,
            [questKeys.requiredRaces] = raceIDs.ALL_ALLIANCE,
            [questKeys.requiredClasses] = classIDs.PALADIN,
            [questKeys.objectivesText] = {"Consult the paladins of Stormwind for advice on the orb."},
            [questKeys.objectives] = nil,
        },
        [78090] = {
            [questKeys.name] = "A Second Opinion",
            [questKeys.startedBy] = {{5492}},
            [questKeys.finishedBy] = {{5495,}},
            [questKeys.requiredLevel] = 1,
            [questKeys.questLevel] = 25,
            [questKeys.requiredRaces] = raceIDs.ALL_ALLIANCE,
            [questKeys.requiredClasses] = classIDs.PALADIN,
            [questKeys.objectivesText] = {"Find the warlock sanctum within Stormwind and seek advice on the orb."},
            [questKeys.objectives] = nil,
        },
        [78091] = {
            [questKeys.name] = "Earning Your Salt",
            [questKeys.startedBy] = {{5495}},
            [questKeys.finishedBy] = {{5495,}},
            [questKeys.requiredLevel] = 1,
            [questKeys.questLevel] = 25,
            [questKeys.requiredRaces] = raceIDs.ALL_ALLIANCE,
            [questKeys.requiredClasses] = classIDs.PALADIN,
            [questKeys.objectivesText] = {"Collect 14 Summoner's Salt from Blackrock Summoners in Redridge Mountains, then return to Ursula Deline in Stormwind."},
            [questKeys.objectives] = {nil,nil,{{209778}}},
        },
        [78092] = {
            [questKeys.name] = "It Must Be Destroyed",
            [questKeys.startedBy] = {{5495}},
            [questKeys.finishedBy] = nil,
            [questKeys.requiredLevel] = 1,
            [questKeys.questLevel] = 25,
            [questKeys.requiredRaces] = raceIDs.ALL_ALLIANCE,
            [questKeys.requiredClasses] = classIDs.PALADIN,
            [questKeys.objectivesText] = {"Find a way to destroy the orb."},
            [questKeys.objectives] = {nil,nil,{{209779}}},
        },
        [78093] = {
            [questKeys.name] = "Return to Delgren",
            [questKeys.startedBy] = {{3663}},
            [questKeys.finishedBy] = {{3663,}},
            [questKeys.requiredLevel] = 1,
            [questKeys.questLevel] = 25,
            [questKeys.requiredRaces] = raceIDs.ALL_ALLIANCE,
            [questKeys.requiredClasses] = classIDs.PALADIN,
            [questKeys.objectivesText] = {"Return the Orb Shards to Delgren."},
            [questKeys.objectives] = nil,
        },
        [78124] = {
            [questKeys.name] = "Nar'thalas Almanac",
            [questKeys.startedBy] = {{211033}},
            [questKeys.finishedBy] = {{211022,211033,}},
            [questKeys.requiredLevel] = 1,
            [questKeys.questLevel] = 20,
            [questKeys.requiredRaces] = raceIDs.NONE,
            [questKeys.requiredClasses] = classIDs.MAGE,
        },
        [78127] = {
            [questKeys.name] = "The Dalaran Digest",
            [questKeys.startedBy] = {{211033}},
            [questKeys.finishedBy] = {{211022,211033,}},
            [questKeys.requiredLevel] = 1,
            [questKeys.questLevel] = 20,
            [questKeys.requiredRaces] = raceIDs.NONE,
            [questKeys.requiredClasses] = classIDs.MAGE,
        },
        [78142] = {
            [questKeys.name] = "Bewitchments and Glamours",
            [questKeys.startedBy] = {{211033}},
            [questKeys.finishedBy] = {{211022,211033,}},
            [questKeys.requiredLevel] = 1,
            [questKeys.questLevel] = 20,
            [questKeys.requiredRaces] = raceIDs.NONE,
            [questKeys.requiredClasses] = classIDs.MAGE,
        },
        [78143] = {
            [questKeys.name] = "Secrets of the Dreamers",
            [questKeys.startedBy] = {{211033}},
            [questKeys.finishedBy] = {{211022,211033,}},
            [questKeys.requiredLevel] = 1,
            [questKeys.questLevel] = 20,
            [questKeys.requiredRaces] = raceIDs.NONE,
            [questKeys.requiredClasses] = classIDs.MAGE,
        },
        [78145] = {
            [questKeys.name] = "Arcanic Systems Manual",
            [questKeys.startedBy] = {{211033}},
            [questKeys.finishedBy] = {{211022,211033,}},
            [questKeys.requiredLevel] = 1,
            [questKeys.questLevel] = 20,
            [questKeys.requiredRaces] = raceIDs.NONE,
            [questKeys.requiredClasses] = classIDs.MAGE,
        },
        [78146] = {
            [questKeys.name] = "Goaz Scrolls",
            [questKeys.startedBy] = {{211033}},
            [questKeys.finishedBy] = {{211022,211033,}},
            [questKeys.requiredLevel] = 1,
            [questKeys.questLevel] = 20,
            [questKeys.requiredRaces] = raceIDs.NONE,
            [questKeys.requiredClasses] = classIDs.MAGE,
        },
        [78147] = {
            [questKeys.name] = "Crimes Against Anatomy",
            [questKeys.startedBy] = {{211033}},
            [questKeys.finishedBy] = {{211022,211033,}},
            [questKeys.requiredLevel] = 1,
            [questKeys.questLevel] = 20,
            [questKeys.requiredRaces] = raceIDs.NONE,
            [questKeys.requiredClasses] = classIDs.MAGE,
        },
        [78148] = {
            [questKeys.name] = "Runes of the Sorceror-Kings",
            [questKeys.startedBy] = {{211033}},
            [questKeys.finishedBy] = {{211022,211033,}},
            [questKeys.requiredLevel] = 1,
            [questKeys.questLevel] = 20,
            [questKeys.requiredRaces] = raceIDs.NONE,
            [questKeys.requiredClasses] = classIDs.MAGE,
        },
        [78149] = {
            [questKeys.name] = "Fury of the Land",
            [questKeys.startedBy] = {{211033}},
            [questKeys.finishedBy] = {{211022,211033,}},
            [questKeys.requiredLevel] = 1,
            [questKeys.questLevel] = 20,
            [questKeys.requiredRaces] = raceIDs.NONE,
            [questKeys.requiredClasses] = classIDs.MAGE,
        },
        [78265] = {
            [questKeys.name] = "Fish Oil",
            [questKeys.startedBy] = {{211653}},
            [questKeys.finishedBy] = {{211653,}},
            [questKeys.requiredLevel] = 20,
            [questKeys.questLevel] = 25,
            [questKeys.requiredRaces] = raceIDs.NONE,
            [questKeys.requiredClasses] = classIDs.NONE,
        },
        [78266] = {
            [questKeys.name] = "Dark Iron Ordinance",
            [questKeys.startedBy] = {{211653}},
            [questKeys.finishedBy] = {{211653,}},
            [questKeys.requiredLevel] = 20,
            [questKeys.questLevel] = 25,
            [questKeys.requiredRaces] = raceIDs.NONE,
            [questKeys.requiredClasses] = classIDs.NONE,
        },
        [78267] = {
            [questKeys.name] = "Shredder Turbochargers",
            [questKeys.startedBy] = {{211653}},
            [questKeys.finishedBy] = {{211653,}},
            [questKeys.requiredLevel] = 20,
            [questKeys.questLevel] = 25,
            [questKeys.requiredRaces] = raceIDs.NONE,
            [questKeys.requiredClasses] = classIDs.NONE,
        },
        [78277] = {
            [questKeys.name] = "A Token of Gratitude",
            [questKeys.startedBy] = {{1498}},
            [questKeys.finishedBy] = {{1498,}},
            [questKeys.requiredLevel] = 12,
            [questKeys.questLevel] = 25,
            [questKeys.requiredRaces] = raceIDs.ALL_HORDE,
            [questKeys.requiredClasses] = classIDs.MAGE,
        },
        [78611] = {
            [questKeys.name] = "A Waylaid Shipment",
            [questKeys.startedBy] = {{214101}},
            [questKeys.finishedBy] = {{213077,214070,214096,214098,214099,214101,}},
            [questKeys.requiredLevel] = 1,
            [questKeys.questLevel] = 8,
            [questKeys.requiredRaces] = raceIDs.NONE,
            [questKeys.requiredClasses] = classIDs.NONE,
            [questKeys.objectivesText] = {"The shipment's missing some items, but it will still be of some use. &nbsp;Thank you, &lt;name&gt;."},
            [questKeys.objectives] = nil,
        },
        [78612] = {
            [questKeys.name] = "A Full Shipment",
            [questKeys.startedBy] = {{214101}},
            [questKeys.finishedBy] = {{213077,214070,214096,214098,214099,214101,}},
            [questKeys.requiredLevel] = 1,
            [questKeys.questLevel] = 9,
            [questKeys.requiredRaces] = raceIDs.NONE,
            [questKeys.requiredClasses] = classIDs.NONE,
            [questKeys.objectivesText] = {"Do you have something for me?"},
            [questKeys.objectives] = {nil,nil,{{211365}}},
        },
        [78872] = {
            [questKeys.name] = "A Full Shipment",
            [questKeys.startedBy] = {{214101}},
            [questKeys.finishedBy] = {{213077,214070,214096,214098,214099,214101,}},
            [questKeys.requiredLevel] = 1,
            [questKeys.questLevel] = 12,
            [questKeys.requiredRaces] = raceIDs.NONE,
            [questKeys.requiredClasses] = classIDs.NONE,
            [questKeys.objectivesText] = {"Do you have something for me?"},
            [questKeys.objectives] = {nil,nil,{{211367}}},
        },
        [78916] = {
            [questKeys.name] = "The Heart of the Void",
            [questKeys.startedBy] = nil,
            [questKeys.finishedBy] = {{4783,}},
            [questKeys.requiredLevel] = 25,
            [questKeys.questLevel] = 25,
            [questKeys.requiredRaces] = raceIDs.ALL_ALLIANCE,
            [questKeys.requiredClasses] = classIDs.NONE,
            [questKeys.objectivesText] = {"Bring the Blackfathom Pearl to Dawnwatcher Selgorm in Darnassus."},
            [questKeys.objectives] = nil,
        },
        [78917] = {
            [questKeys.name] = "The Heart of the Void",
            [questKeys.startedBy] = nil,
            [questKeys.finishedBy] = {{9087,}},
            [questKeys.requiredLevel] = 25,
            [questKeys.questLevel] = 25,
            [questKeys.requiredRaces] = raceIDs.ALL_HORDE,
            [questKeys.requiredClasses] = classIDs.NONE,
            [questKeys.objectivesText] = {"Bring the Blackfathom Pearl to Bashana Runetotem in Thunder Bluff."},
            [questKeys.objectives] = nil,
        },
        [78920] = {
            [questKeys.name] = "Baron Aquanis",
            [questKeys.startedBy] = nil,
            [questKeys.finishedBy] = {{12736,}},
            [questKeys.requiredLevel] = 25,
            [questKeys.questLevel] = 27,
            [questKeys.requiredRaces] = raceIDs.ALL_HORDE,
            [questKeys.requiredClasses] = classIDs.NONE,
            [questKeys.objectivesText] = {"Bring the Strange Water Globe to Je'neu Sancrea at Zoram'gar Outpost, Ashenvale."},
            [questKeys.objectives] = nil,
        },
        [78921] = {
            [questKeys.name] = "Blackfathom Villainy",
            [questKeys.startedBy] = {{4787}},
            [questKeys.finishedBy] = {{4783,}},
            [questKeys.requiredLevel] = 25,
            [questKeys.questLevel] = 27,
            [questKeys.requiredRaces] = raceIDs.ALL_ALLIANCE,
            [questKeys.requiredClasses] = classIDs.NONE,
            [questKeys.objectivesText] = {"Bring the head of Twilight Lord Kelris to Dawnwatcher Selgorm in Darnassus."},
            [questKeys.objectives] = {nil,nil,{{5881}}},
        },
        [78922] = {
            [questKeys.name] = "Blackfathom Villainy",
            [questKeys.startedBy] = {{4787}},
            [questKeys.finishedBy] = {{9087,}},
            [questKeys.requiredLevel] = 25,
            [questKeys.questLevel] = 27,
            [questKeys.requiredRaces] = raceIDs.ALL_HORDE,
            [questKeys.requiredClasses] = classIDs.NONE,
            [questKeys.objectivesText] = {"Bring the head of Twilight Lord Kelris to Bashana Runetotem in Thunder Bluff."},
            [questKeys.objectives] = {nil,nil,{{5881}}},
        },
        [78923] = {
            [questKeys.name] = "Knowledge in the Deeps",
            [questKeys.startedBy] = {{2786}},
            [questKeys.finishedBy] = {{2786,}},
            [questKeys.requiredLevel] = 25,
            [questKeys.questLevel] = 27,
            [questKeys.requiredRaces] = raceIDs.ALL_ALLIANCE,
            [questKeys.requiredClasses] = classIDs.NONE,
            [questKeys.objectivesText] = {"Bring the Lorgalis Manuscript to Gerrig Bonegrip in the Forlorn Cavern in Ironforge."},
            [questKeys.objectives] = {nil,nil,{{5359}}},
        },
        [78925] = {
            [questKeys.name] = "Twilight Falls",
            [questKeys.startedBy] = {{4784}},
            [questKeys.finishedBy] = {{4784,}},
            [questKeys.requiredLevel] = 25,
            [questKeys.questLevel] = 27,
            [questKeys.requiredRaces] = raceIDs.ALL_ALLIANCE,
            [questKeys.requiredClasses] = classIDs.NONE,
            [questKeys.objectivesText] = {"Bring 10 Twilight Pendants to Argent Guard Manados in Darnassus."},
            [questKeys.objectives] = {nil,nil,{{5879}}},
        },
        [78926] = {
            [questKeys.name] = "Researching the Corruption",
            [questKeys.startedBy] = {{8997}},
            [questKeys.finishedBy] = {{8997,}},
            [questKeys.requiredLevel] = 25,
            [questKeys.questLevel] = 27,
            [questKeys.requiredRaces] = raceIDs.ALL_ALLIANCE,
            [questKeys.requiredClasses] = classIDs.NONE,
            [questKeys.objectivesText] = {"Gershala Nightwhisper in Auberdine wants 8 Corrupt Brain stems."},
            [questKeys.objectives] = {nil,nil,{{5952}}},
        },
        [78927] = {
            [questKeys.name] = "Allegiance to the Old Gods",
            [questKeys.startedBy] = {{12736}},
            [questKeys.finishedBy] = {{12736,}},
            [questKeys.requiredLevel] = 25,
            [questKeys.questLevel] = 27,
            [questKeys.requiredRaces] = raceIDs.ALL_HORDE,
            [questKeys.requiredClasses] = classIDs.NONE,
            [questKeys.objectivesText] = {"Kill Lorgus Jett in Blackfathom Deeps and then return to Je'neu Sancrea in Ashenvale."},
            [questKeys.objectives] = nil,
        },
        [79090] = {
            [questKeys.name] = "Repelling Invaders",
            [questKeys.startedBy] = nil,
            [questKeys.finishedBy] = {{212970,}},
            [questKeys.requiredLevel] = 18,
            [questKeys.questLevel] = 25,
            [questKeys.requiredRaces] = raceIDs.ALL_ALLIANCE,
            [questKeys.requiredClasses] = classIDs.NONE,
            [questKeys.objectivesText] = {"Bring the Warsong Outrider Mark to Felore Moonray, Priestess of the Moon, at the Moonwell base in Ashenvale."},
            [questKeys.objectives] = nil,
        },
        [79098] = {
            [questKeys.name] = "Clear the Forest!",
            [questKeys.startedBy] = nil,
            [questKeys.finishedBy] = {{212969,}},
            [questKeys.requiredLevel] = 18,
            [questKeys.questLevel] = 25,
            [questKeys.requiredRaces] = raceIDs.ALL_HORDE,
            [questKeys.requiredClasses] = classIDs.NONE,
            [questKeys.objectivesText] = {"Bring the Silverwing Sentinel Charm to Kazragore, Far Seer, at the Bonfire base in Ashenvale."},
            [questKeys.objectives] = nil,
        },
        [79099] = {
            [questKeys.name] = "Baron Aquanis",
            [questKeys.startedBy] = {{214876}},
            [questKeys.finishedBy] = {{214876,}},
            [questKeys.requiredLevel] = 25,
            [questKeys.questLevel] = 27,
            [questKeys.requiredRaces] = raceIDs.ALL_ALLIANCE,
            [questKeys.requiredClasses] = classIDs.NONE,
            [questKeys.objectivesText] = {"Bring the Strange Water Globe to Davidus Voidstar in Auberdine, Darkshore."},
            [questKeys.objectives] = {nil,nil,{{211818}}},
        },
        [79100] = {
            [questKeys.name] = "A Waylaid Shipment",
            [questKeys.startedBy] = {{214101}},
            [questKeys.finishedBy] = {{213077,214070,214096,214098,214099,214101,}},
            [questKeys.requiredLevel] = 1,
            [questKeys.questLevel] = 15,
            [questKeys.requiredRaces] = raceIDs.NONE,
            [questKeys.requiredClasses] = classIDs.NONE,
            [questKeys.objectivesText] = {"The shipment's missing some items, but it will still be of some use. &nbsp;Thank you, &lt;name&gt;."},
            [questKeys.objectives] = nil,
        },
        [79101] = {
            [questKeys.name] = "A Full Shipment",
            [questKeys.startedBy] = {{214101}},
            [questKeys.finishedBy] = {{213077,214070,214096,214098,214099,214101,}},
            [questKeys.requiredLevel] = 1,
            [questKeys.questLevel] = 18,
            [questKeys.requiredRaces] = raceIDs.NONE,
            [questKeys.requiredClasses] = classIDs.NONE,
            [questKeys.objectivesText] = {"Do you have something for me?"},
            [questKeys.objectives] = {nil,nil,{{211839}}},
        },
        [79102] = {
            [questKeys.name] = "A Full Shipment",
            [questKeys.startedBy] = {{214101}},
            [questKeys.finishedBy] = {{213077,214070,214096,214098,214099,214101,}},
            [questKeys.requiredLevel] = 1,
            [questKeys.questLevel] = 22,
            [questKeys.requiredRaces] = raceIDs.NONE,
            [questKeys.requiredClasses] = classIDs.NONE,
            [questKeys.objectivesText] = {"Do you have something for me?"},
            [questKeys.objectives] = {nil,nil,{{211840}}},
        },
        [79103] = {
            [questKeys.name] = "A Full Shipment",
            [questKeys.startedBy] = {{214101}},
            [questKeys.finishedBy] = {{213077,214070,214096,214098,214099,214101,}},
            [questKeys.requiredLevel] = 1,
            [questKeys.questLevel] = 25,
            [questKeys.requiredRaces] = raceIDs.NONE,
            [questKeys.requiredClasses] = classIDs.NONE,
            [questKeys.objectivesText] = {"Do you have something for me?"},
            [questKeys.objectives] = {nil,nil,{{211841}}},
        },
        [79091] = {
            [questKeys.name] = "Archmage Antonidas: The Unabridged Autobiography",
            [questKeys.startedBy] = {{211033}},
            [questKeys.finishedBy] = {{211033,}},
            [questKeys.requiredLevel] = 1,
            [questKeys.questLevel] = 20,
            [questKeys.requiredRaces] = raceIDs.NONE,
            [questKeys.requiredClasses] = classIDs.MAGE,
        },
        [79092] = {
            [questKeys.name] = "Archmage Theocritus's Research Journal",
            [questKeys.startedBy] = {{211033}},
            [questKeys.finishedBy] = {{211033,}},
            [questKeys.requiredLevel] = 1,
            [questKeys.questLevel] = 20,
            [questKeys.requiredRaces] = raceIDs.NONE,
            [questKeys.requiredClasses] = classIDs.MAGE,
        },
        [79093] = {
            [questKeys.name] = "Rumi of Gnomeregan: The Collected Works",
            [questKeys.startedBy] = {{211033}},
            [questKeys.finishedBy] = {{211033,}},
            [questKeys.requiredLevel] = 1,
            [questKeys.questLevel] = 20,
            [questKeys.requiredRaces] = raceIDs.NONE,
            [questKeys.requiredClasses] = classIDs.MAGE,
        },
        [79094] = {
            [questKeys.name] = "The Lessons of Ta'zo",
            [questKeys.startedBy] = {{211022}},
            [questKeys.finishedBy] = {{211022,}},
            [questKeys.requiredLevel] = 1,
            [questKeys.questLevel] = 20,
            [questKeys.requiredRaces] = raceIDs.NONE,
            [questKeys.requiredClasses] = classIDs.MAGE,
        },
        [79095] = {
            [questKeys.name] = "The Apothecary's Metaphysical Primer",
            [questKeys.startedBy] = {{211022}},
            [questKeys.finishedBy] = {{211022,}},
            [questKeys.requiredLevel] = 1,
            [questKeys.questLevel] = 20,
            [questKeys.requiredRaces] = raceIDs.NONE,
            [questKeys.requiredClasses] = classIDs.MAGE,
        },
        [79096] = {
            [questKeys.name] = "Ataeric: On Arcane Curiosities",
            [questKeys.startedBy] = {{211022}},
            [questKeys.finishedBy] = {{211022,}},
            [questKeys.requiredLevel] = 1,
            [questKeys.questLevel] = 20,
            [questKeys.requiredRaces] = raceIDs.NONE,
            [questKeys.requiredClasses] = classIDs.MAGE,
        },
        [79097] = {
            [questKeys.name] = "Baxtan: On Destructive Magics",
            [questKeys.startedBy] = {{211033}},
            [questKeys.finishedBy] = {{211022,211033,}},
            [questKeys.requiredLevel] = 1,
            [questKeys.questLevel] = 20,
            [questKeys.requiredRaces] = raceIDs.NONE,
            [questKeys.requiredClasses] = classIDs.MAGE,
        },
        [79482] = {
            [questKeys.name] = "Stolen Winter Veil Treats",
            [questKeys.startedBy] = nil,
            [questKeys.finishedBy] = nil,
            [questKeys.requiredLevel] = 25,
            [questKeys.questLevel] = 60,
            [questKeys.requiredRaces] = raceIDs.ALL_ALLIANCE,
            [questKeys.requiredClasses] = classIDs.NONE,
            [questKeys.objectivesText] = {"Locate the Smokywood Pastures investigator that has gone missing in the snowy regions of the Alterac Mountains."},
            [questKeys.objectives] = nil,
        },
        [79483] = {
            [questKeys.name] = "Stolen Winter Veil Treats",
            [questKeys.startedBy] = nil,
            [questKeys.finishedBy] = nil,
            [questKeys.requiredLevel] = 25,
            [questKeys.questLevel] = 60,
            [questKeys.requiredRaces] = raceIDs.ALL_HORDE,
            [questKeys.requiredClasses] = classIDs.NONE,
            [questKeys.objectivesText] = {"Locate the Smokywood Pastures investigator that has gone missing in the snowy regions of the Alterac Mountains."},
            [questKeys.objectives] = nil,
        },
        [79484] = {
            [questKeys.name] = "You're a Mean One...",
            [questKeys.startedBy] = nil,
            [questKeys.finishedBy] = nil,
            [questKeys.requiredLevel] = 25,
            [questKeys.questLevel] = 60,
            [questKeys.requiredRaces] = raceIDs.ALL_ALLIANCE,
            [questKeys.requiredClasses] = classIDs.NONE,
            [questKeys.objectivesText] = {"Locate and return the Stolen Treats to Wulmort Jinglepocket in Ironforge. It was last thought to be in the possession of the Abominable Greench, found somewhere in the snowy regions of the Alterac Mountains."},
            [questKeys.objectives] = nil,
        },
        [79485] = {
            [questKeys.name] = "You're a Mean One...",
            [questKeys.startedBy] = nil,
            [questKeys.finishedBy] = nil,
            [questKeys.requiredLevel] = 25,
            [questKeys.questLevel] = 60,
            [questKeys.requiredRaces] = raceIDs.ALL_HORDE,
            [questKeys.requiredClasses] = classIDs.NONE,
            [questKeys.objectivesText] = {"Locate and return the Stolen Treats to Kaymard Copperpinch in Orgrimmar. It was last thought to be in the possession of the Abominable Greench, found somewhere in the snowy regions of the Alterac Mountains."},
            [questKeys.objectives] = nil,
        },
        [79492] = {
            [questKeys.name] = "Metzen the Reindeer",
            [questKeys.startedBy] = nil,
            [questKeys.finishedBy] = nil,
            [questKeys.requiredLevel] = 25,
            [questKeys.questLevel] = 60,
            [questKeys.requiredRaces] = raceIDs.NONE,
            [questKeys.requiredClasses] = classIDs.NONE,
            [questKeys.objectivesText] = {"Find Metzen the Reindeer.  Use the notes provided to you for clues as to where he is being held.When you find Metzen, have the Pouch of Reindeer Dust in your possession so you can sprinkle some of the dust on him; this should free Metzen from his bonds of captivity.Return the Pouch of Reindeer Dust to Wulmort Jinglepocket in Ironforge once Metzen is freed."},
            [questKeys.objectives] = {nil,nil,{{21211},{21315}}},
        },
        [79495] = {
            [questKeys.name] = "Metzen the Reindeer",
            [questKeys.startedBy] = nil,
            [questKeys.finishedBy] = nil,
            [questKeys.requiredLevel] = 25,
            [questKeys.questLevel] = 60,
            [questKeys.requiredRaces] = raceIDs.NONE,
            [questKeys.requiredClasses] = classIDs.NONE,
            [questKeys.objectivesText] = {"Find Metzen the Reindeer.  Use the notes provided to you for clues as to where he is being held.When you find Metzen, have the Pouch of Reindeer Dust in your possession so you can sprinkle some of the dust on him; this should free Metzen from his bonds of captivity.Return the Pouch of Reindeer Dust to Kaymard Copperpinch in Orgrimmar once Metzen is freed."},
            [questKeys.objectives] = {nil,nil,{{21211},{21315}}},
        },
    }
end
