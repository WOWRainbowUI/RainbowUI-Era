local ADDON_NAME, ADDON = ...
local MODULE_NAME = "addon"

ADDON[1] = {} -- MRB, Addon
ADDON[2] = {} -- C, Config
ADDON[3] = LibStub("AceLocale-3.0"):GetLocale(ADDON_NAME, true) -- L, Locale
local MRB, C, L = unpack(ADDON)

--[==[@debug@
_G["MRB"] = MRB --Expose internals on the Plugin lib
--@end-debug@]==]


---------------------------------------------
-- CONSTANTS
---------------------------------------------
MRB.ADDON_NAME = ADDON_NAME
MRB.VERSION = GetAddOnMetadata(ADDON_NAME, "Version")

MRB.IS_RELEASE_VERSION = MRB.VERSION:match("^%d+.%d+.%d+$") ~= nil
--[==[@debug@
MRB.IS_RELEASE_VERSION = false
--@end-debug@]==]


---------------------------------------------
-- VARIABLES
---------------------------------------------
MRB.isDebug = false


---------------------------------------------
-- METHODS
---------------------------------------------
function MRB:debug(...)
    if ( MRB.isDebug ) then
        print("[" .. MRB.ADDON_NAME .. "]", ...)
    end
end

function MRB:trace(...)
    --[=[@alpha@
    MRB:debug(...)
    --@end-alpha@]=]
end


---------------------------------------------
-- EVENTS & CALLBACKS
---------------------------------------------
MRB.callbacks = LibStub("CallbackHandler-1.0"):New(MRB)
MRB.eventCallbacks = LibStub("CallbackHandler-1.0"):New(MRB, "RegisterEvent", "UnregisterEvent", false)

local frame = CreateFrame("frame")
frame:SetScript("OnEvent", function(self, event, ...)
    MRB.eventCallbacks:Fire(event, ...)
end)

function MRB.eventCallbacks:OnUsed(target, event)
    frame:RegisterEvent(event)
end
function MRB.eventCallbacks:OnUnused(target, event)
    frame:UnregisterEvent(event)
end


---------------------------------------------
-- INITIALIZE
---------------------------------------------
--[==[@debug@
LoadAddOn("Blizzard_DebugTools")
--@end-debug@]==]

MRB.RegisterEvent(MODULE_NAME, "ADDON_LOADED", function(event, addonName)
    if ( addonName == MRB.ADDON_NAME ) then
        MRB.UnregisterEvent(MODULE_NAME, "ADDON_LOADED")

        C:Load()
        --[[if ( not MissingRaidBuffsDB ) then
            --[=[@alpha@
            print("[" .. MRB.ADDON_NAME .. "]", "DB not found, using default configurations")
            --@end-alpha@]=]
            --MissingRaidBuffsDB = C.DEFAULT_DB
        end]]
        --C:upgradeDB()

        -- Register debug listener for all options
        --[[local i = next(MissingRaidBuffsDB)
        while ( i ) do
            C:RegisterListener(i, function(...) MRB:debug(...) end)
            i = next(MissingRaidBuffsDB, i)
        end]]

        -- Initialize addon modules
        MRB.callbacks:Fire("initialize")
    end
end)
