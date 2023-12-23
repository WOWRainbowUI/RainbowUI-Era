local mod	= DBM:NewMod("BaronAuanisSoD", "DBM-Raids-Vanilla", 8)
local L		= mod:GetLocalizedStrings()

mod:SetRevision("20231202060752")
mod:SetCreatureID(202699)
mod:SetEncounterID(2694)--2765 is likely 5 man version in instance type 201 (which has Old Serra'kis instead of Baron)
mod:SetHotfixNoticeRev(20231201000000)
--mod:SetMinSyncRevision(20231115000000)

mod:RegisterCombat("combat")

mod:RegisterEventsInCombat(
	"SPELL_CAST_START",
	"SPELL_AURA_APPLIED"
)

--local warningSleep			= mod:NewTargetNoFilterAnnounce(8399, 2)

--local timerSleepCD			= mod:NewAITimer(180, 8399, nil, nil, nil, 3, nil, DBM_COMMON_L.MAGIC_ICON)

--function mod:OnCombatStart(delay)

--end

--[[
function mod:SPELL_CAST_START(args)
	if args:IsSpell(8399) and args:IsSrcTypeHostile() then

	end
end

function mod:SPELL_AURA_APPLIED(args)
	if args:IsSpell(8399) and args:IsDestTypePlayer() then

	end
end
--]]
