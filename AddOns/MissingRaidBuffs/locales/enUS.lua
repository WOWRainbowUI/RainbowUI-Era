local ADDON_NAME = ...

local silent = false
--[==[@debug@
silent = true -- do not show localization errors in dev
--@end-debug@]==]

local L = LibStub("AceLocale-3.0"):NewLocale(ADDON_NAME, "enUS", true --[[isDefault]], silent)

if not L then
    return
end

L["Buff is required for damager role"] = true
L["Buff is required for Druids"] = true
L["Buff is required for healer role"] = true
L["Buff is required for Hunters"] = true
L["Buff is required for Mages"] = true
L["Buff is required for Paladins"] = true
L["Buff is required for Priests"] = true
L["Buff is required for Rogues"] = true
L["Buff is required for Shamans"] = true
L["Buff is required for tank roles"] = true
L["Buff is required for Warlocks"] = true
L["Buff is required for Warriors"] = true
L["Buffs"] = true
L["Configure"] = true
L["Current profile:"] = true
L["Debug"] = true
L["Determine how your assigned groups are displayed"] = true
L["Disable dragging and resizing of the window"] = true
L["Do not apply group assignments to groups smaller than the selected size"] = true
L["Enable debugging"] = true
L["Group Assignments"] = true
L["Group size"] = true
L["Hide frame when in combat"] = true
L["Hide when empty"] = true
L["Hide when not in group"] = true
L["Hide window during combat"] = true
L["Hide window when not in party or raid"] = true
L["Hide window when there are no missing buffs"] = true
L["Left click"] = true
L["List missing raid buffs for party & raid members"] = true
L["Lock window"] = true
L["Missing Raid Buffs"] = true
L["Offline"] = true
L["Profiles"] = true
L["Quick Select"] = true
L["Reset all options, frame sizing, and position to defaults"] = true
L["Reset to Defaults"] = true
L["Right click"] = true
L["Show all groups, prioritizing my assigned groups"] = true
L["Show only my assigned groups"] = true
L["Show options"] = true
L["Show the Missing Raid Buffs frame"] = true

