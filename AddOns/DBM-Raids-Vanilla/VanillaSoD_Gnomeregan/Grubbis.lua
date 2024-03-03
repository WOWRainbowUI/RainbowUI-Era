local mod	= DBM:NewMod("GrubbisSoD", "DBM-Raids-Vanilla", 8)
local L		= mod:GetLocalizedStrings()

mod:SetRevision("20240220023630")
mod:SetCreatureID(217280)--217956 Chomper, 217216 Grubbis Controller
mod:SetEncounterID(2925)
mod:SetHotfixNoticeRev(20240212000000)
mod:SetMinSyncRevision(20240212000000)

mod:RegisterCombat("combat")
mod:SetWipeTime(30)--Combat drops between adds waves

mod:RegisterEventsInCombat(
	"SPELL_CAST_START 436027 436100 436059",
	"SPELL_CAST_SUCCESS 435520 435525 435526 436168 435361 435362 435363",
	"SPELL_SUMMON 435832 435835",
	"SPELL_AURA_APPLIED 434941 3019 436074 434165 436027",
--	"SPELL_AURA_APPLIED_DOSE",
	"SPELL_AURA_REMOVED 434941 436074 436027",
--	"SPELL_PERIODIC_DAMAGE",
--	"SPELL_PERIODIC_MISSED",
	"UNIT_DIED"
)

--NOTE: timers seem to be a sequence of sorts, but variable due to how fast you kill adds and such cause certain things activate no cooldown windows. Timers for this will need a large subset of data and may even involve counting add deaths to pause/unpause timers
--In other words, do not code in random timers that look good from one log. that's not how fight works, outside of of petrify cause it's an add timer
--TODO, obviously clean up staging even more with transcriptor and add initial adds timer for the RP at beginning
--TODO, add auto add marking for ambushers and Pillagers in stage 2?
--[[
 (ability.id = 436027 or ability.id = 436100 or ability.id = 436059 or ability.id = 436074) and type = "begincast"
 or (ability.id = 435520 or ability.id = 435525 or ability.id = 435526 or ability.id = 436168 or ability.id = 434168 or ability.id = 434927 or ability.id = 435361 or ability.id = 435362 or ability.id = 435363 or ability.id = 435832 or ability.id = 435835) and type = "cast"
 or (target.id = 217956 or target.id = 217280) and type = "death"
 or (ability.id = 434941 or ability.id = 436027 or ability.id = 436074) and (type = "applybuff" or type = "removebuff")
 or ability.id = 434165
 or (source.type = "NPC" and source.firstSeen = timestamp) or (target.type = "NPC" and target.firstSeen = timestamp)
--]]
--Stage 1/2
local warnEnrage				= mod:NewTargetNoFilterAnnounce(3019, 3, nil, "RemoveMagic")
local warnIrradiatedCloud		= mod:NewSpellAnnounce(434168, 3)--Spawn
local warnIrradiatedCloudTarget	= mod:NewTargetAnnounce(434168, 3)

local specWarnIrradiatedCloud	= mod:NewSpecialWarningYou(434168, nil, nil, nil, 1, 2)--Clouds fixate on players
local yellrradiatedCloud		= mod:NewYell(434168)
--local specWarnGTFO				= mod:NewSpecialWarningGTFO(438732, nil, nil, nil, 1, 8)

--Stage 3
local warnToxicVigor			= mod:NewTargetNoFilterAnnounce(434941, 3)
local warnToxicVigorOver		= mod:NewFadesAnnounce(434941, 1)
local warnTroggRage				= mod:NewTargetNoFilterAnnounce(436074, 4)
local warnTroggRageOver			= mod:NewFadesAnnounce(436074, 1)

local specWarnGrubbisMad		= mod:NewSpecialWarningCount(436027, nil, nil, nil, 2, 2)
local specWarnRadiation			= mod:NewSpecialWarningDodge(436059, nil, nil, nil, 2, 2)
local specWarnPetrify			= mod:NewSpecialWarningInterrupt(436100, "HasInterrupt", nil, nil, 1, 2)
local specWarnAdds				= mod:NewSpecialWarningAdds(435832, "-Healer", nil, nil, 1, 2)

--local timerAdds				= mod:NewAddsCustomTimer(30, 435832)--next wave based on previous wave defeat, so maybe mob death counting then starting timer for next wave on all dead?
local timerGrubbisMad			= mod:NewBuffActiveTimer(5, 436027, nil, nil, nil, 5, nil, DBM_COMMON_L.HEALER_ICON)--also no CD timer, far too variable. i think it does have a CD, but it also has many conditions that disable it?
local timerPetrifyCD			= mod:NewCDTimer(22.6, 434941, nil, nil, nil, 4, nil, DBM_COMMON_L.INTERRUPT_ICON)
local timerToxicVigor			= mod:NewBuffActiveTimer(30, 436100, nil, nil, nil, 6)
local timerTroggRage			= mod:NewBuffActiveTimer(10, 436074, nil, nil, nil, 5, nil, DBM_COMMON_L.ENRAGE_ICON)--CD was anywhere from 25-100, so no CD timer

mod.vb.quakeCount = 0
mod.vb.madCount = 0

function mod:OnCombatStart(delay)
	self.vb.quakeCount = 0
	self.vb.madCount = 0
	self:SetStage(1)
	--Adds instantly on pull
end

function mod:SPELL_CAST_START(args)
	if args:IsSpell(436027) then
		self.vb.madCount = self.vb.madCount + 1
		specWarnGrubbisMad:Show(self.vb.madCount)
		specWarnGrubbisMad:Play("aesoon")
	elseif args:IsSpell(436100) then
		timerPetrifyCD:Start()
		if self:CheckInterruptFilter(args.sourceGUID, false, true) then
			specWarnPetrify:Show(args.sourceName)
			specWarnPetrify:Play("kickcast")
		end
	elseif args:IsSpell(436059) then
		specWarnRadiation:Show()
		specWarnRadiation:Play("shockwave")
	end
end

function mod:SPELL_CAST_SUCCESS(args)
	if args:IsSpell(435520, 435525, 435526) and self:AntiSpam(3, 1) then
		warnIrradiatedCloud:Show()
	elseif args:IsSpell(436168) then--Trogg Quake
		self:SetStage(0)--Auto increments stage to 2, and then 3 for quakes 1 and 2
		--Stage 1, initial cave opening and 3x waves
		--Stage 2, first quake breaking down second cave and 3x more waves
		--Stage 3, second quake and boss and his pet coming in, and then he also does 3x waves
		--https://www.wowhead.com/classic/spells/name-extended:grubbis?filter=21;2;11501
		--^scripts for reference
		if self:GetStage(3) then
			timerPetrifyCD:Start(6.8)--6.8-8 (small sample)
		end
	elseif args:IsSpell(435361, 435362, 435363) and self:AntiSpam(3, 2) then
		specWarnAdds:Show()
		specWarnAdds:Play("killmob")
	end
end

--[[
--Use for future add marking stuff
function mod:SPELL_SUMMON(args)
	if args:IsSpell(435832) then--Spawn Caverndeep Ambusher
--		if self.Options.SetIconOnGoo then
--			self:ScanForMobs(args.destGUID, 2, self.vb.gooIcon, 1, nil, 12, "SetIconOnGoo")
--		end
	elseif args:IsSpell(435835) then--Spawn Caverndeep Pillager
--		if self.Options.SetIconOnGoo then
--			self:ScanForMobs(args.destGUID, 2, self.vb.gooIcon, 1, nil, 12, "SetIconOnGoo")
--		end
	end
end
--]]

function mod:SPELL_AURA_APPLIED(args)
	if args:IsSpell(434941) then
		warnToxicVigor:Show(args.destName)
		timerToxicVigor:Start()
	elseif args:IsSpell(3019) and args:IsDestTypeHostile() then
		warnEnrage:Show(args.destName)
	elseif args:IsSpell(436074) then
		warnTroggRage:Show(args.destName)
		timerTroggRage:Start()
	elseif args:IsSpell(436027) then
		timerGrubbisMad:Start()
	elseif args:IsSpell(434165) and self:AntiSpam(3, args.destName) then
		if args:IsPlayer() then
			specWarnIrradiatedCloud:Show()
			specWarnIrradiatedCloud:Play("targetyou")
			yellrradiatedCloud:Yell()
		else
			warnIrradiatedCloudTarget:Show(args.destName)
		end
	end
end
--mod.SPELL_AURA_APPLIED_DOSE = mod.SPELL_AURA_APPLIED

function mod:SPELL_AURA_REMOVED(args)
	if args:IsSpell(434941) then
		warnToxicVigorOver:Show()
		timerToxicVigor:Stop()
	elseif args:IsSpell(436074) then
		warnTroggRageOver:Show()
		timerTroggRage:Stop()
	elseif args:IsSpell(436027) then
		timerGrubbisMad:Stop()
	end
end

--[[
function mod:SPELL_PERIODIC_DAMAGE(_, _, _, _, destGUID, _, _, _, spellId, spellName)
	if spellId == 438732 and destGUID == UnitGUID("player") and self:AntiSpam(3, 4) then--Toxic Ventilation (assumed since it's the boss with vent mechanic)
		specWarnGTFO:Show(spellName)
		specWarnGTFO:Play("watchfeet")
	end
end
mod.SPELL_PERIODIC_MISSED = mod.SPELL_PERIODIC_DAMAGE
--]]

function mod:UNIT_DIED(args)
	if self:GetCIDFromGUID(args.destGUID) == 217956 then--Can he die before boss?
		timerPetrifyCD:Stop()
	end
end

--[[
--Most of these will likely be UNIT_SPELLCAST events and not in combat log, so not drycoding em yet
--https://www.wowhead.com/classic/spells/name-extended:grubbis?filter=21;2;11501
function mod:UNIT_SPELLCAST_SUCCEEDED(uId, _, spellId)
	if spellId == 411583 then--Replace Stand with Swim
		self:SendSync("PhaseChange")
	end
end

function mod:OnSync(msg)
	if not self:IsInCombat() then return end
	if msg == "PhaseChange" and self:AntiSpam(30, 2) then

	end
end
--]]
