local MRB, C, L = unpack(select(2, ...))
local MODULE_NAME = "config"

--[==[@debug@
MRB.Config = C
--@end-debug@]==]

---------------------------------------------
-- CONSTANTS
---------------------------------------------
local IS_CLASSIC = (WOW_PROJECT_ID == WOW_PROJECT_CLASSIC)
local IS_HORDE = UnitFactionGroup("player")=="Horde"
local IS_PRIEST = select(2,UnitClass("player")) == "PRIEST"
local IS_MAGE = select(2,UnitClass("player")) == "MAGE"
local IS_DRUID = select(2,UnitClass("player")) == "DRUID"

local SHAMAN_PALADIN_TEXTURE_ICON = IS_HORDE and MRB.Media.TextureIcons.CLASS_TEXTURE_ICONS.SHAMAN or MRB.Media.TextureIcons.CLASS_TEXTURE_ICONS.PALADIN

local POWER_WORD_FORTITUDE_SPELLID = 1243
local PRAYER_OF_FORTITUDE_SPELLID = 21562
local DIVINE_SPIRIT_SPELLID = 14752
local PRAYER_OF_SPIRIT_SPELLID = 27681
local SHADOW_PROTECTION_SPELLD = 976
local PRAYER_OF_SHADOW_PROTECTION_SPELLID = 27683
local ARCANE_INTELLECT_SPELLID = 1459
local ARCANE_BRILLIANCE_SPELLID = 23028
local MARK_OF_THE_WILD_SPELLID = 1126
local GIFT_OF_THE_WILD_SPELLID = 21849

---------------------------------------------
-- LOCALIZATION
---------------------------------------------
local L_ADDON_NAME = L["Missing Raid Buffs"]
local L_ADDON_DESCRIPTION = L["List missing raid buffs for party & raid members"]
local L_DEBUG = L["Debug"]
local L_DEBUG_DESCRIPTION = L["Enable debugging"]
local L_GENERAL = GENERAL
local L_BUFFS = L["Buffs"]
local L_SHOW = SHOW
local L_SHOW_DESCRIPTION = L["Show the Missing Raid Buffs frame"]
local L_ENABLE = ENABLE
local L_LOCK_WINDOW = L["Lock window"]
local L_LOCK_WINDOW_DESCRIPTION = L["Disable dragging and resizing of the window"]
local L_HIDE_WHEN_EMPTY = L["Hide when empty"]
local L_HIDE_WHEN_EMPTY_DESCRIPTION = L["Hide window when there are no missing buffs"]
local L_HIDE_WHEN_IN_COMBAT = L["Hide frame when in combat"]
local L_HIDE_WHEN_IN_COMBAT_DESCRIPTION = L["Hide window during combat"]
local L_HIDE_WHEN_NOT_IN_GROUP = L["Hide when not in group"]
local L_HIDE_WHEN_NOT_IN_GROUP_DESCRIPTION = L["Hide window when not in party or raid"]
local L_GROUP_ASSIGNMENTS = L["Group Assignments"]
local L_GROUP_ASSIGNMENTS_DISPLAY = DISPLAY
local L_GROUP_ASSIGNMENTS_DISPLAY_DESCRIPTION = L["Determine how your assigned groups are displayed"]
local L_GROUP_ASSIGNMENTS_DISPLAY_SHOW_ASSIGNED_GROUPS = L["Show only my assigned groups"]
local L_GROUP_ASSIGNMENTS_DISPLAY_SHOW_ALL_GROUPS_PREFER_ASSIGNED_GROUPS = L["Show all groups, prioritizing my assigned groups"]
local L_GROUP_ASSIGNMENTS_GROUPSIZE = L["Group size"]
local L_GROUP_ASSIGNMENTS_GROUPSIZE_DESCRIPTION = L["Do not apply group assignments to groups smaller than the selected size"]
local L_GROUP_ASSIGNMENTS_GROUPSIZE_2 = COMPACT_UNIT_FRAME_PROFILE_AUTOACTIVATE2PLAYERS
local L_GROUP_ASSIGNMENTS_GROUPSIZE_3 = COMPACT_UNIT_FRAME_PROFILE_AUTOACTIVATE3PLAYERS
local L_GROUP_ASSIGNMENTS_GROUPSIZE_5 = COMPACT_UNIT_FRAME_PROFILE_AUTOACTIVATE5PLAYERS
local L_GROUP_ASSIGNMENTS_GROUPSIZE_10 = COMPACT_UNIT_FRAME_PROFILE_AUTOACTIVATE10PLAYERS
local L_GROUP_ASSIGNMENTS_GROUPSIZE_15 = COMPACT_UNIT_FRAME_PROFILE_AUTOACTIVATE15PLAYERS
local L_GROUP_ASSIGNMENTS_GROUPSIZE_20 = COMPACT_UNIT_FRAME_PROFILE_AUTOACTIVATE20PLAYERS
local L_GROUP_ASSIGNMENTS_GROUPSIZE_40 = COMPACT_UNIT_FRAME_PROFILE_AUTOACTIVATE40PLAYERS
local L_GROUP = GROUP
local L_RESET_DEFAULTS = L["Reset to Defaults"]
local L_RESET_DEFAULTS_DESCRIPTION = L["Reset all options, frame sizing, and position to defaults"]
local L_TANK = TANK
local L_AURA_FILTER_TANK_DESCRIPTION = L["Buff is required for tank roles"]
local L_HEALER = HEALER
local L_AURA_FILTER_HEALER_DESCRIPTION = L["Buff is required for healer role"]
local L_DAMAGER = DAMAGER
local L_AURA_FILTER_DAMAGER_DESCRIPTION = L["Buff is required for damager role"]
local L_WARRIOR = C_CreatureInfo.GetClassInfo(1).className
local L_AURA_FILTER_WARRIOR_DESCRIPTION = L["Buff is required for Warriors"]
local L_SHAMAN = C_CreatureInfo.GetClassInfo(7).className
local L_AURA_FILTER_SHAMAN_DESCRIPTION = L["Buff is required for Shamans"]
local L_PALADIN = C_CreatureInfo.GetClassInfo(2).className
local L_AURA_FILTER_PALADIN_DESCRIPTION =  L["Buff is required for Paladins"]
local L_HUNTER = C_CreatureInfo.GetClassInfo(3).className
local L_AURA_FILTER_HUNTER_DESCRIPTION = L["Buff is required for Hunters"]
local L_ROGUE = C_CreatureInfo.GetClassInfo(4).className
local L_AURA_FILTER_ROGUE_DESCRIPTION = L["Buff is required for Rogues"]
local L_PRIEST = C_CreatureInfo.GetClassInfo(5).className
local L_AURA_FILTER_PRIEST_DESCRIPTION = L["Buff is required for Priests"]
local L_MAGE = C_CreatureInfo.GetClassInfo(8).className
local L_AURA_FILTER_MAGE_DESCRIPTION = L["Buff is required for Mages"]
local L_WARLOCK = C_CreatureInfo.GetClassInfo(9).className
local L_AURA_FILTER_WARLOCK_DESCRIPTION = L["Buff is required for Warlocks"]
local L_DRUID = C_CreatureInfo.GetClassInfo(11).className
local L_AURA_FILTER_DRUID_DESCRIPTION = L["Buff is required for Druids"]
local L_PROFILES = L["Profiles"]
local L_CURRENT_PROFILE = L["Current profile:"]


---------------------------------------------
-- VARIABLES
---------------------------------------------
local db
local optionListeners = LibStub("CallbackHandler-1.0"):New(C, "RegisterListener", "UnregisterListener", false)
local buffsDatatype


---------------------------------------------
-- UTILITIES
---------------------------------------------
local function clone(instance)
    local obj = {}
    local k,v = next(instance)
    while ( k ~= nil ) do
        obj[k] = ( type(v) == "table" ) and clone(v) or v
        k,v = next(instance, k)
    end
    return obj;
end

local function formatClass(class, str)
    return MRB.Media.TextureIcons.CLASS_TEXTURE_ICONS[class] .. " " .. GetClassColorObj(class):WrapTextInColorCode(str)
end

local function recreateBuffsDatatype()
    buffsDatatype = {
        List = {},
        Mapping = {}
    }

    for key,details in ipairs(db.profile.Auras) do
        if ( details.Enabled ) then
            tinsert(buffsDatatype.List, key)
            for _,spellId in ipairs(details.Spells) do
                local buffname = GetSpellInfo(spellId)
                buffsDatatype.Mapping[buffname] = key
            end
        end
    end

    --DevTools_Dump({buffsDatatype})
end


---------------------------------------------
-- CONFIG METHODS
---------------------------------------------
function C:is(option)
    local value = C:get(option)
    --assert(type(value) == "boolean", "boolean type of required for is(..)")
    return value == true
end

function C:get(option)
    if ( db ) then
        -- Walk the path until we have a final value
        local path = { strsplit("./", option) }
        local obj = db.profile
        for _,v in ipairs(path) do
            obj = obj[v]
            if ( obj == nil ) then
                error("Failed to find option '" .. option .. "'")
            end
        end
        return obj
    end

    return nil
end

function C:GetBuffMapping()
    return buffsDatatype.Mapping
end

function C:GetEnabledBuffs()
    return buffsDatatype.List
end

function C:GetAllBuffs()
    return db.profile.Auras
end

function C:BuffIsEnabled(buffIndex)
    return db.profile.Auras[buffIndex].Enabled
end

function C:BuffIsRequiredForClass(playerName, buff)
    local unitclass = select(2, UnitClass(playerName))
    return db.profile.Auras[buff].Enabled and db.profile.Auras[buff].Filters[unitclass]
end

function C:ToggleBuff(buffIndex)
    local buff = db.profile.Auras[buffIndex]
    buff.Enabled = not buff.Enabled
    recreateBuffsDatatype()
    optionListeners:Fire("updateBuffs")
end

function C:GetBuffInfo(buffIndex)
    local buff = db.profile.Auras[buffIndex]
    local spellName, _, texture = GetSpellInfo(buff.Spells[1])
    return buff.Enabled, spellName, texture
end


---------------------------------------------
-- OPTIONS
---------------------------------------------
local CURRENT_DB_VERSION = 1
C.DEFAULT_DB = {
    profile = {
        ["Show"] = true,
        ["Locked"] = false,
        ["HideWhenEmpty"] = false, -- false by default so initial users can position windows
        ["HideWhenInCombat"] = false,
        ["HideWhenNotInGroup"] = false,
        ["FilterGroupSize"] = 15,
        ["ShowAllGroups"] = false,
        ["GroupAssignments"] = {
            ["group1"] = true,
            ["group2"] = true,
            ["group3"] = true,
            ["group4"] = true,
            ["group5"] = true,
            ["group6"] = true,
            ["group7"] = true,
            ["group8"] = true
        },
        ["Auras"] = {
            { -- "Power Word: Fortitude"
                ["Enabled"] = IS_PRIEST,
                Spells = {
                    POWER_WORD_FORTITUDE_SPELLID,
                    PRAYER_OF_FORTITUDE_SPELLID
                },
                Filters = {
                    ["DRUID"] = true,
                    ["HUNTER"] = true,
                    ["MAGE"] = true,
                    ["PALADIN"] = true,
                    ["PRIEST"] = true,
                    ["ROGUE"] = true,
                    ["SHAMAN"] = true,
                    ["WARLOCK"] = true,
                    ["WARRIOR"] = true,
                },
            },
            { -- "Divine Spirit"
                ["Enabled"] = IS_PRIEST, -- and has divine spirit talent
                Spells = {
                    DIVINE_SPIRIT_SPELLID,
                    PRAYER_OF_SPIRIT_SPELLID
                },
                Filters = {
                    ["DRUID"] = true,
                    ["HUNTER"] = true,
                    ["MAGE"] = true,
                    ["PALADIN"] = true,
                    ["PRIEST"] = true,
                    ["ROGUE"] = false,
                    ["SHAMAN"] = true,
                    ["WARLOCK"] = true,
                    ["WARRIOR"] = false,
                },
            },
            { -- "Shadow Protection"
                ["Enabled"] = false,
                Spells = {
                    SHADOW_PROTECTION_SPELLD,
                    PRAYER_OF_SHADOW_PROTECTION_SPELLID
                },
                Filters = {
                    ["DRUID"] = true,
                    ["HUNTER"] = true,
                    ["MAGE"] = true,
                    ["PALADIN"] = true,
                    ["PRIEST"] = true,
                    ["ROGUE"] = true,
                    ["SHAMAN"] = true,
                    ["WARLOCK"] = true,
                    ["WARRIOR"] = true,
                },
            },
            { -- "Arcane Intellect"
                ["Enabled"] = IS_MAGE,
                Spells = {
                    ARCANE_INTELLECT_SPELLID,
                    ARCANE_BRILLIANCE_SPELLID
                },
                Filters = {
                    ["DRUID"] = true,
                    ["HUNTER"] = true,
                    ["MAGE"] = true,
                    ["PALADIN"] = true,
                    ["PRIEST"] = true,
                    ["ROGUE"] = false,
                    ["SHAMAN"] = true,
                    ["WARLOCK"] = true,
                    ["WARRIOR"] = false,
                },
            },
            { -- "Mark of the Wild"
                ["Enabled"] = IS_DRUID,
                Spells = {
                    MARK_OF_THE_WILD_SPELLID,
                    GIFT_OF_THE_WILD_SPELLID
                },
                Filters = {
                    ["DRUID"] = true,
                    ["HUNTER"] = true,
                    ["MAGE"] = true,
                    ["PALADIN"] = true,
                    ["PRIEST"] = true,
                    ["ROGUE"] = true,
                    ["SHAMAN"] = true,
                    ["WARLOCK"] = true,
                    ["WARRIOR"] = true,
                },
            },
        },
    }
}

local function setDefaults(DB, DEFAULTS)
    -- find any nil values and set to default values
    for k,v in pairs(DEFAULTS) do
        if ( DB[k] == nil ) then
            if ( type(v) == "table") then
                DB[k] = {}
            else
                DB[k] = v
            end
        end

        if ( type(DB[k]) == "table" ) then
            setDefaults(DB[k], v)
        end
    end

    -- clean up unknown values
    for k,v in pairs(DB) do
        if ( DEFAULTS[k] == nil ) then
            DB[k] = nil
        end
    end
end

function C:upgradeDB()
    if ( db.profile.DBVersion == nil ) then
        db.profile.DBVersion = CURRENT_DB_VERSION
    end
end

local function getOption(info)
    return C:get(info.arg)
end

local function setOption(info, value)
    if ( db ) then
        -- Walk the path until we have a final value
        local path = { strsplit("./", info.arg) }
        local o = db.profile
        local finalArg = tremove(path, #path)
        for _,v in ipairs(path) do
            o = o[v]
        end
        o[finalArg] = value

        optionListeners:Fire(info.arg, value)
    end
end

---------------------------------------------
-- CONFIG
---------------------------------------------
local AceConfigRegistry = LibStub("AceConfigRegistry-3.0")
local MRBConfigTable = {
    type = "group",
    name = L_ADDON_NAME,
    args = {
        general = {
            order = 1,
            type = "group",
            name = L_GENERAL,
            args = {
                resetDefaults = {
                    order = 9000,
                    type = "execute",
                    name = L_RESET_DEFAULTS,
                    desc = L_RESET_DEFAULTS_DESCRIPTION,
                    func = function()
                        MissingRaidBuffsListView:ClearAllPoints()
                        MissingRaidBuffsListView:SetPoint("CENTER", UIParent)
                        MissingRaidBuffsListView:SetSize(150, 100)
                        db:ResetProfile()
                        --MissingRaidBuffsDB = clone(C.DEFAULT_DB)
                        optionListeners:Fire("Locked", C:get("Locked"))
                    end
                },
                desc = {
                    order = 1,
                    type = "description",
                    name = L_ADDON_DESCRIPTION,
                    width = "full"
                },
                emptySpace = {
                    order = 3,
                    type = "description",
                    name = " ",
                    width = "full"
                },
                show = {
                    order = 10,
                    type = "toggle",
                    name = L_SHOW,
                    desc = L_SHOW_DESCRIPTION,
                    set = setOption,
                    get = getOption,
                    width = "full",
                    arg = "Show"
                },
                lock = {
                    order = 20,
                    type = "toggle",
                    name = L_LOCK_WINDOW,
                    desc = L_LOCK_WINDOW_DESCRIPTION,
                    set = setOption,
                    get = getOption,
                    width = "full",
                    arg = "Locked"
                },
                hideWhenEmpty = {
                    order = 30,
                    type = "toggle",
                    name = L_HIDE_WHEN_EMPTY,
                    desc = L_HIDE_WHEN_EMPTY_DESCRIPTION,
                    set = setOption,
                    get = getOption,
                    width = "full",
                    arg = "HideWhenEmpty"
                },
                hideWhenInCombat = {
                    order = 40,
                    type = "toggle",
                    name = L_HIDE_WHEN_IN_COMBAT,
                    desc = L_HIDE_WHEN_IN_COMBAT_DESCRIPTION,
                    set = setOption,
                    get = getOption,
                    width = "full",
                    arg = "HideWhenInCombat"
                },
                hideWhenNotInGroup = {
                    order = 60,
                    type = "toggle",
                    name = L_HIDE_WHEN_NOT_IN_GROUP,
                    desc = L_HIDE_WHEN_NOT_IN_GROUP_DESCRIPTION,
                    set = setOption,
                    get = getOption,
                    width = "full",
                    arg = "HideWhenNotInGroup"
                },
                debug = {
                    order = 100,
                    type = "toggle",
                    name = L_DEBUG,
                    desc = L_DEBUG_DESCRIPTION,
                    set = function(info, value) MRB.isDebug = value end,
                    get = function(info) return MRB.isDebug end,
                    hidden = MRB.IS_RELEASE_VERSION,
                    width = "normal",
                },
                debug_spacer = {
                    order = 101,
                    type = "description",
                    name = "",
                    width = "double"
                },
                groupAssignments = {
                    order = 200,
                    type = "group",
                    name = L_GROUP_ASSIGNMENTS,
                    inline = true,
                    args = {
                        filterGroupSize = {
                            order = 10,
                            type = "select",
                            name = L_GROUP_ASSIGNMENTS_GROUPSIZE,
                            desc = L_GROUP_ASSIGNMENTS_GROUPSIZE_DESCRIPTION,
                            set = setOption,
                            get = getOption,
                            values = {
                                [2] = L_GROUP_ASSIGNMENTS_GROUPSIZE_2,
                                [3] = L_GROUP_ASSIGNMENTS_GROUPSIZE_3,
                                [5] = L_GROUP_ASSIGNMENTS_GROUPSIZE_5,
                                [10] = L_GROUP_ASSIGNMENTS_GROUPSIZE_10,
                                [15] = L_GROUP_ASSIGNMENTS_GROUPSIZE_15,
                                [20] = L_GROUP_ASSIGNMENTS_GROUPSIZE_20,
                                [40] = L_GROUP_ASSIGNMENTS_GROUPSIZE_40,
                            },
                            width = "normal",
                            arg = "FilterGroupSize"
                        },
                        filterGroupSize_spacer = {
                            order = 19,
                            type = "description",
                            name = "",
                            width = "double",
                        },
                        showAllGroups = {
                            order = 20,
                            type = "select",
                            name = L_GROUP_ASSIGNMENTS_DISPLAY,
                            desc = L_GROUP_ASSIGNMENTS_DISPLAY_DESCRIPTION,
                            set = setOption,
                            get = getOption,
                            values = {
                                [false] = L_GROUP_ASSIGNMENTS_DISPLAY_SHOW_ASSIGNED_GROUPS,
                                [true] = L_GROUP_ASSIGNMENTS_DISPLAY_SHOW_ALL_GROUPS_PREFER_ASSIGNED_GROUPS,
                            },
                            width = "double",
                            arg = "ShowAllGroups"
                        },
                        showAllGroups_spacer = {
                            order = 29,
                            type = "description",
                            name = "",
                            width = "normal",
                        },
                        group_spacer = {
                            order = 30,
                            type = "description",
                            name = " ",
                            width = "full"
                        },
                        group1 = {
                            order = 40,
                            type = "toggle",
                            name = L_GROUP .. " 1",
                            desc = L_GROUP_1_DESCRIPTION,
                            set = setOption,
                            get = getOption,
                            width = "normal",
                            arg = "GroupAssignments/group1"
                        },
                        group2 = {
                            order = 45,
                            type = "toggle",
                            name = L_GROUP .. " 2",
                            desc = L_GROUP_2_DESCRIPTION,
                            set = setOption,
                            get = getOption,
                            width = "normal",
                            arg = "GroupAssignments/group2"
                        },
                        row1spacer = {
                            order = 49,
                            type = "description",
                            name = "",
                            width = "normal",
                        },
                        group3 = {
                            order = 50,
                            type = "toggle",
                            name = L_GROUP .. " 3",
                            desc = L_GROUP_3_DESCRIPTION,
                            set = setOption,
                            get = getOption,
                            width = "normal",
                            arg = "GroupAssignments/group3"
                        },
                        group4 = {
                            order = 55,
                            type = "toggle",
                            name = L_GROUP .. " 4",
                            desc = L_GROUP_4_DESCRIPTION,
                            set = setOption,
                            get = getOption,
                            width = "normal",
                            arg = "GroupAssignments/group4"
                        },
                        row2spacer = {
                            order = 59,
                            type = "description",
                            name = "",
                            width = "normal",
                        },
                        group5 = {
                            order = 60,
                            type = "toggle",
                            name = L_GROUP .. " 5",
                            desc = L_GROUP_5_DESCRIPTION,
                            set = setOption,
                            get = getOption,
                            width = "normal",
                            arg = "GroupAssignments/group5"
                        },
                        group6 = {
                            order = 65,
                            type = "toggle",
                            name = L_GROUP .. " 6",
                            desc = L_GROUP_6_DESCRIPTION,
                            set = setOption,
                            get = getOption,
                            width = "normal",
                            arg = "GroupAssignments/group6"
                        },
                        row3spacer = {
                            order = 69,
                            type = "description",
                            name = "",
                            width = "normal",
                        },
                        group7 = {
                            order = 70,
                            type = "toggle",
                            name = L_GROUP .. " 7",
                            desc = L_GROUP_7_DESCRIPTION,
                            set = setOption,
                            get = getOption,
                            width = "normal",
                            arg = "GroupAssignments/group7"
                        },
                        group8 = {
                            order = 75,
                            type = "toggle",
                            name = L_GROUP .. " 8",
                            desc = L_GROUP_8_DESCRIPTION,
                            set = setOption,
                            get = getOption,
                            width = "normal",
                            arg = "GroupAssignments/group8"
                        },
                        row4spacer = {
                            order = 79,
                            type = "description",
                            name = "",
                            width = "normal",
                        },
                    },
                },
            },
        },
        --[[auras = {
            order = 20,
            type = "group",
            name = L_BUFFS,
            args = {
                -- dynamically generated based on DB.Auras
            },
        },]]
        profiles = {
            order = 30,
            type = "group",
            name = L_PROFILES,
            args = {
                currentProfileLabel = {
                    order = 1,
                    type = "description",
                    name = L_CURRENT_PROFILE,
                    width = "normal"
                },
                currentProfile = {
                    order = 1,
                    type = "description",
                    name = function() return db:GetCurrentProfile() end,
                    width = "double"
                },
            }
        },
    },
}
AceConfigRegistry:RegisterOptionsTable(MRB.ADDON_NAME, MRBConfigTable, MRB.IS_RELEASE_VERSION)

local AceConfigDialog = LibStub("AceConfigDialog-3.0")
local configPanes = {}
configPanes.general = AceConfigDialog:AddToBlizOptions(MRB.ADDON_NAME, L_ADDON_NAME, nil, "general")
configPanes.profiles = AceConfigDialog:AddToBlizOptions(MRB.ADDON_NAME, L_PROFILES, L_ADDON_NAME, "profiles")
--configPanes.auras = AceConfigDialog:AddToBlizOptions(MRB.ADDON_NAME, L_BUFFS, MRB.ADDON_NAME, "auras")
C.GENERAL_OPTIONS = configPanes.general


function refreshConfig(db, ...)
    print("refreshConfig", db, ...)
end

function C:reloadDB()
    self:upgradeDB()
    recreateBuffsDatatype()
end

---------------------------------------------
-- INITIALIZE
---------------------------------------------
function C:Load()
    db = LibStub("AceDB-3.0"):New("MissingRaidBuffsDB", C.DEFAULT_DB)
    db.RegisterCallback(C, "OnProfileChanged", "reloadDB")
    db.RegisterCallback(C, "OnProfileCopied", "reloadDB")
    db.RegisterCallback(C, "OnProfileReset", "reloadDB")
    C:upgradeDB()
end

MRB.RegisterCallback(MODULE_NAME, "initialize", function()
    C:reloadDB()
end)
