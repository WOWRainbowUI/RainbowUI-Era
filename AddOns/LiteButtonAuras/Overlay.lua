--[[----------------------------------------------------------------------------

    LiteButtonAuras
    Copyright 2021 Mike "Xodiv" Battersby

    Code for one overlay frame on top of a button. Most of this code is the
    logic for what to display depending on what auras are in LBA.state, see
    LiteButtonAurasOverlayMixin:Update() for the entry point.

----------------------------------------------------------------------------]]--

local _, LBA = ...

local LibBG = LibStub("LibButtonGlow-1.0")


--[[------------------------------------------------------------------------]]--

-- Cache a some things to be faster. This is annoying but it's really a lot
-- faster. Only do this for things that are called in the event loop otherwise
-- it's a pain to maintain.

local DebuffTypeColor = DebuffTypeColor
local GetItemSpell = GetItemSpell
local GetMacroItem = GetMacroItem
local GetMacroSpell = GetMacroSpell
local GetSpellCooldown = GetSpellCooldown
local GetSpellInfo = GetSpellInfo
local GetTime = GetTime
local IsSpellOverlayed = IsSpellOverlayed
local UnitIsFriend = UnitIsFriend
local WOW_PROJECT_ID = WOW_PROJECT_ID

--[[------------------------------------------------------------------------]]--

LiteButtonAurasOverlayMixin = {}

function LiteButtonAurasOverlayMixin:OnLoad()
    -- Bump it so it's on top of the cooldown frame, otherwise the individual
    -- bar integration will need to adjust the level accordingly
    local parent = self:GetParent()
    if parent.cooldown then
        self:SetFrameLevel(parent.cooldown:GetFrameLevel() + 1)
    end
    self:Style()
end

function LiteButtonAurasOverlayMixin:Style()
    local p = LBA.db.profile

    local parent = self:GetParent()
    self:SetSize(parent:GetSize())

    local point, x, y, justifyH

    self.Timer:SetFont(p.fontPath, p.fontSize, p.fontFlags)
    point, x, y, justifyH = unpack(LBA.anchorSettings[p.timerAnchor])
    self.Timer:ClearAllPoints()
    self.Timer:SetPoint(point, self, x*p.timerAdjust, y*p.timerAdjust)
    self.Timer:SetJustifyH(justifyH)

    self.Stacks:SetFont(p.fontPath, p.fontSize, p.fontFlags)
    point, x, y, justifyH = unpack(LBA.anchorSettings[p.stacksAnchor])
    self.Stacks:ClearAllPoints()
    self.Stacks:SetPoint(point, self, x*p.stacksAdjust, y*p.stacksAdjust)
    self.Stacks:SetJustifyH(justifyH)
end

-- This could be optimized (?) slightly be checking if type, id, subType
-- are all the same as before and doing nothing
--
-- In an ideal world GetActionInfo would return the unit as well. Or there
-- would be a GetActionUnit function. If we could find the unit then it
-- would make sense to change LBA.state to be unit-indexed and to collect
-- state for all the units we are interested in rather than a hard coded
-- player and target set. Exactly how to do that efficiently would be a
-- bit of a challenge but I think it's still faster than not keeping the
-- state and each overlay doing its own UnitAura calls.
--
-- Realistically speaking we could scan all the macros for @ and target=
-- and add them to a "wanted units" list. I don't think it would be worth
-- trying to handle auto-self-cast or the new blizzard mouseover cast.

function LiteButtonAurasOverlayMixin:SetUpAction()

    local type, id, subType = self:GetActionInfo()

    if type == 'spell' then
        self.name = GetSpellInfo(id)
        self.spellID = id
        return
    end

    if type == 'item' then
        self.name, self.spellID = GetItemSpell(id)
        return
    end

    if type == 'macro' then
        if subType == 'spell' then
            self.spellID = id
            self.name = GetSpellInfo(self.spellID)
            return
        elseif subType == 'item' then
            -- 10.2 GetActionInfo() seems bugged for this case. In an ideal
            -- world id would be the itemID but it seemds to be actionID-1.
            -- This workaround assumes no two macros have the same name. Maybe
            -- there's a better way.
            local actionID = self:GetActionID()
            if actionID then
                local macroName = GetActionText(actionID)
                local macroID = GetMacroIndexByName(macroName or "")
                if macroID then
                    local _, itemLink = GetMacroItem(macroID)
                    self.name, self.spellID = GetItemSpell(itemLink)
                    return
                end
            end
        elseif not subType then
            local itemName = GetMacroItem(id)
            if itemName then
                local name, spellID = GetItemSpell(itemName)
                self.spellID = spellID
                self.name = name or itemName
                return
            else
                self.spellID = GetMacroSpell(id)
                self.name = GetSpellInfo(self.spellID)
                return
            end
        end
    end

    self.spellID = nil
    self.name = nil
end

local function IsDeniedSpell(spellID)
    return spellID and LBA.db.profile.denySpells[spellID]
end

function LiteButtonAurasOverlayMixin:Update(stateOnly)
    local show = false

    self.expireTime = nil
    self.stackCount = nil
    self.displayGlow = nil
    self.displaySuggestion = nil

    if self:HasAction() then

        -- Even though the action might be the same, what it contains could have
        -- changed due to the dynamic nature of macros and some spells.
        if not stateOnly then
            self:SetUpAction()
        end

        local state = LBA.state

        if self.name and not IsDeniedSpell(self.spellID) then
            if self:TrySetAsSoothe() then
                show = true
            elseif self:TrySetAsInterrupt() then
                show = true
            elseif state.player.totems[self.name] then
                self:SetAsTotem(state.player.totems[self.name])
                show = true
            elseif self:TrySetAsTaunt() then
                show = true
            elseif state.player.buffs[self.name] then
                self:SetAsBuff(state.player.buffs[self.name])
                show = true
            elseif state.pet.buffs[self.name] then
                if LBA.PlayerPetBuffs[self.name] then
                    self:SetAsBuff(state.pet.buffs[self.name])
                    show = true
                end
            elseif state.target.debuffs[self.name] then
                if self.name ~= LBA.state.player.channel then
                    self:SetAsDebuff(state.target.debuffs[self.name])
                    show = true
                end
            elseif state.player.weaponEnchants[self.name] then
                self:SetAsBuff(state.player.weaponEnchants[self.name])
                show = true
            elseif self:TrySetAsDispel(self) then
                show = true
            end
        end

        -- We want to try to avoid doubling up on buttons Blizzard are already
        -- showing their overlay on, because it looks terrible.

        if WOW_PROJECT_ID == 1 then
            self.displayGlow = self.displayGlow and not (self.spellID and IsSpellOverlayed(self.spellID))
        else
            local parent = self:GetParent()
            self.displayGlow = self.displayGlow and not (parent.overlay and parent.overlay:IsShown())
        end
    end

    self:ShowGlow(self.displayGlow)
    self:ShowTimer(self.expireTime ~= nil and LBA.db.profile.showTimers)
    self:ShowStacks(self.stackCount ~= nil and LBA.db.profile.showStacks)
    self:ShowSuggestion(self.displaySuggestion and LBA.db.profile.showSuggestions)
    self:SetShown(show)
end


-- Aura Config -----------------------------------------------------------------

-- [ 1] name,
-- [ 2] icon,
-- [ 3] count,
-- [ 4] debuffType,
-- [ 5] duration,
-- [ 6] expirationTime,
-- [ 7] source,
-- [ 8] isStealable,
-- [ 9] nameplateShowPersonal,
-- [10] spellId,
-- [11] canApplyAura,
-- [12] isBossDebuff,
-- [13] castByPlayer,
-- [14] nameplateShowAll,
-- [15] timeMod,
--      ...
--  = UnitAura(unit, index, filter)

function LiteButtonAurasOverlayMixin:SetAsAura(auraData)
    -- Anything that's too short is just annoying
    if auraData.duration > 0 and auraData.duration < LBA.db.profile.minAuraDuration then
        return
    end
    self.displayGlow = true
    if auraData.expirationTime and auraData.expirationTime ~= 0 then
        self.expireTime = auraData.expirationTime
        self.timeMod = auraData.timeMod
    end
    if auraData.applications and auraData.applications > 1 then
        self.stackCount = auraData.applications
    end
end

function LiteButtonAurasOverlayMixin:SetAsBuff(auraData)
    local color = LBA.db.profile.color.buff
    local alpha = LBA.db.profile.glowAlpha
    self.Glow:SetVertexColor(color.r, color.g, color.b, alpha)
    -- self.Stacks:SetTextColor(color.r, color.g, color.b, 1.0)
    self:SetAsAura(auraData)
end

function LiteButtonAurasOverlayMixin:SetAsDebuff(auraData)
    local color = LBA.db.profile.color.debuff
    local alpha = LBA.db.profile.glowAlpha
    self.Glow:SetVertexColor(color.r, color.g, color.b, alpha)
    -- self.Stacks:SetTextColor(color.r, color.g, color.b, 1.0)
    self:SetAsAura(auraData)
end


-- Totem Config ----------------------------------------------------------------

function LiteButtonAurasOverlayMixin:SetAsTotem(expireTime)
    local color = LBA.db.profile.color.buff
    local alpha = LBA.db.profile.glowAlpha
    self.Glow:SetVertexColor(color.r, color.g, color.b, alpha)
    self.expireTime, self.modTime = expireTime, nil
    self.displayGlow = true
end


-- Interrupt Config ------------------------------------------------------------

-- Assuming no interrupt spells are of the "enabled" type
-- https://wowpedia.fandom.com/wiki/API_GetSpellCooldown

function LiteButtonAurasOverlayMixin:ReadyBefore(endTime)
    if endTime == 0 then
        -- Indefinite enrage, such as from the Raging M+ affix
        return true
    else
        local start, duration = GetSpellCooldown(self.spellID)
        return start + duration < endTime
    end
end

function LiteButtonAurasOverlayMixin:TrySetAsInterrupt()
    if LBA.state.target.interrupt then
        if self.name and LBA.Interrupts[self.name] then
            local castEnds = LBA.state.target.interrupt
            if self:ReadyBefore(castEnds) then
                self.expireTime = castEnds
                self.displaySuggestion = true
                return true
            end
        end
    end
end

-- Soothe Config ---------------------------------------------------------------

--[[
function LiteButtonAurasOverlayMixin:SetAsSoothe(auraData)
    local color = LBA.db.profile.color.enrage
    self.Glow:SetVertexColor(color.r, color.g, color.b, 0.7)
    -- self.Stacks:SetTextColor(color.r, color.g, color.b, 1.0)
    self:SetAsAura(auraData)
end
]]

function LiteButtonAurasOverlayMixin:TrySetAsSoothe()
    if not self.name or not LBA.Soothes[self.name] then return end
    if UnitIsFriend('player', 'target') then return end

    for _, auraData in pairs(LBA.state.target.buffs) do
        if auraData.isStealable and auraData.dispelName == "" and self:ReadyBefore(auraData.expirationTime) then
            self.expireTime = auraData.expirationTime
            self.displaySuggestion = true
            return true
        end
    end
end

-- Taunt Config ----------------------------------------------------------------

function LiteButtonAurasOverlayMixin:TrySetAsTaunt()
    if not self.name or not LBA.Taunts[self.name] then return end
    if UnitIsFriend('player', 'target') then return end

    for _, auraData in pairs(LBA.state.target.debuffs) do
        if LBA.Taunts[auraData.name] then
            self:SetAsDebuff(auraData)
            return true
        end
    end
end

-- Dispel Config ---------------------------------------------------------------

function LiteButtonAurasOverlayMixin:SetAsDispel(auraData)
    local color = DebuffTypeColor[auraData.dispelName or ""]
    local alpha = LBA.db.profile.glowAlpha
    self.Glow:SetVertexColor(color.r, color.g, color.b, alpha)
    -- self.Stacks:SetTextColor(color.r, color.g, color.b, 1.0)
    self:SetAsAura(auraData)
end

function LiteButtonAurasOverlayMixin:TrySetAsDispel()
    if not self.name then
        return
    end

    if UnitIsFriend('player', 'target') then
        return
    end

    local dispels = LBA.HostileDispels[self.name]
    if dispels then
        for k in pairs(dispels) do
            for _, auraData in pairs(LBA.state.target.buffs) do
                if auraData.dispelName == k then
                    self:SetAsDispel(auraData)
                    return true
                end
            end
        end
    end
end

-- Glow Display ----------------------------------------------------------------

function LiteButtonAurasOverlayMixin:ShowGlow(isShown)
    self.Glow:SetShown(isShown)
end

-- Suggestion Display-----------------------------------------------------------

if WOW_PROJECT_ID == 1 then
    function LiteButtonAurasOverlayMixin:ShowSuggestion(isShown)
        if isShown then
            -- Taken from ActionButton_ShowOverlayGlow(self) but we don't want the
            -- start animation because it takes 0.7s before the button starts to
            -- glow which is awful for time-sensitive things like interrupts (and
            -- in my opinion awful in general).
            ActionButton_SetupOverlayGlow(self)
            self.SpellActivationAlert.ProcStartFlipbook:SetAlpha(0)
            self.SpellActivationAlert.ProcLoop:Play()
            self.SpellActivationAlert:Show()
        else
            ActionButton_HideOverlayGlow(self)
        end
    end
else
    function LiteButtonAurasOverlayMixin:ShowSuggestion(isShown)
        if isShown then
            LibBG.ShowOverlayGlow(self)
        else
            LibBG.HideOverlayGlow(self)
        end
    end
end


-- Count Display ---------------------------------------------------------------

function LiteButtonAurasOverlayMixin:ShowStacks(isShown)
    if isShown then
        self.Stacks:SetText(self.stackCount)
    end
    self.Stacks:SetShown(isShown)
end


-- Timer Display ---------------------------------------------------------------

local ceil = math.ceil

local function TimerAbbrev(duration)
    if duration >= 86400 then
        return "%dd", ceil(duration/86400)
    elseif duration >= 3600 then
        return "%dh", ceil(duration/3600)
    elseif duration >= 60 then
        return "%dm", ceil(duration/60)
    elseif duration >= 3 or not LBA.db.profile.decimalTimers then
        return "%d", ceil(duration)
    else
        -- printf uses round (not available in lua) so do our own
        -- ceil and avoid a discontinuity at the break
        duration = ceil(duration*10)/10
        return "%.1f", duration
    end
end

-- BuffFrame does it this way, SetFormattedText on every frame. If its
-- good enough for them it's good enough for me.
--
-- /console scriptprofile 1
-- /reload
--
-- UpdateAddOnCPUUsage()
-- t,n = GetFunctionCPUUsage(LiteButtonAurasOverlayMixin.UpdateTimer, true)
-- print(t*1000/n) -> ~14 ns
--

function LiteButtonAurasOverlayMixin:UpdateTimer()
    local duration = self.expireTime - GetTime()
    if self.timeMod and self.timeMod > 0 then
        duration = duration / self.timeMod
    end
    if duration >= 0 then
        self.Timer:SetFormattedText(TimerAbbrev(duration))
        if LBA.db.profile.colorTimers then
            self.Timer:SetTextColor(LBA.TimerRGB(duration))
        else
            self.Timer:SetTextColor(1, 1, 1)
        end
    else
        self.Timer:Hide()
        self:SetScript('OnUpdate', nil)
    end
end

function LiteButtonAurasOverlayMixin:ShowTimer(isShown)
    if isShown then
        self:SetScript('OnUpdate', self.UpdateTimer)
        self.Timer:Show()
    else
        self:SetScript('OnUpdate', nil)
        self.Timer:Hide()
    end
end

function LiteButtonAurasOverlayMixin:Dump(force)
    if self.name or force then
        print(string.format("%d. %s = %s (%d)",
                            self:GetActionID(),
                            self:GetParent():GetName(),
                            self.name or NONE,
                            self.spellID or 0))
    end
end
