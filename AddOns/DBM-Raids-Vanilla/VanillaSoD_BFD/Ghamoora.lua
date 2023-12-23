local mod	= DBM:NewMod("GhamooraSoD", "DBM-Raids-Vanilla", 8)
local L		= mod:GetLocalizedStrings()

mod:SetRevision("20231202060752")
mod:SetCreatureID(201722)
mod:SetEncounterID(2697)--2761 is likely 5 man version in instance type 201
mod:SetHotfixNoticeRev(20231201000000)
--mod:SetMinSyncRevision(20231115000000)

mod:RegisterCombat("combat")

mod:RegisterEventsInCombat(
	"SPELL_CAST_START 414370",
	"SPELL_AURA_APPLIED"
)

--Change aqua shell to carefly knockback warning after confirming mechanic/spellId
local warningAquaShell			= mod:NewCastAnnounce(414370, 3)--Aqua Shell cracking/exploding

--local timerSleepCD			= mod:NewAITimer(180, 8399, nil, nil, nil, 3, nil, DBM_COMMON_L.MAGIC_ICON)

--function mod:OnCombatStart(delay)

--end


function mod:SPELL_CAST_START(args)
	if args:IsSpell(414370) then
		warningAquaShell:Show()
	end
end

--[[
function mod:SPELL_AURA_APPLIED(args)
	if args:IsSpell(8399) and args:IsDestTypePlayer() then

	end
end
--]]
