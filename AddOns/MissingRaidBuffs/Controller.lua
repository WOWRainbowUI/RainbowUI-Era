local MRB, C, L = unpack(select(2, ...))
local MODULE_NAME = "Controller"


---------------------------------------------
-- CONSTANTS
---------------------------------------------
local PLAYER_NAME = UnitName("player")
local COMBATLOG_OBJECT_AFFILIATION_RAID_OR_PARTY = bit.bor(COMBATLOG_OBJECT_AFFILIATION_RAID, COMBATLOG_OBJECT_AFFILIATION_PARTY, COMBATLOG_OBJECT_AFFILIATION_MINE)


---------------------------------------------
-- UTILITIES
---------------------------------------------
local function isUnitAllowed(unit)
    if ( UnitInRaid("player") ) then
        return unit:match("^raid%d+$")
    elseif ( UnitInParty("player") ) then
        return unit:match("^party%d+$") or unit == "player"
    end

    return unit == "player"
end


---------------------------------------------
-- TRACK BUFFS
---------------------------------------------
local function updateUnitBuffs(unit)
    if ( not isUnitAllowed(unit) ) then
        return
    end

    local unitname = UnitName(unit)

    local buffMapping = C:GetBuffMapping()
    local requiredBuffs = C:GetEnabledBuffs()
    local missingBuffs = {}
    for _,requiredBuff in ipairs(requiredBuffs) do
        if C:BuffIsRequiredForClass(unitname, requiredBuff) then
            missingBuffs[requiredBuff] = true
        end
    end

    -- Determine what required buffs are missing
    for buffId = 1,BUFF_MAX_DISPLAY do
        local name, icon, _, debuffType, _, _, _, _, _, spellId = UnitBuff(unit, buffId)
        if ( not name ) then
            break
        end
        if ( buffMapping[name] ) then -- unit has buff that is required
            missingBuffs[buffMapping[name]] = nil
        end
    end

    -- Determine unit status
    local status = MRB.Model.Status.ALIVE
    if ( not UnitIsConnected(unit) ) then
        status = MRB.Model.Status.DISCONNECTED
    elseif ( UnitIsDeadOrGhost(unit) ) then
        status = MRB.Model.Status.DEAD
    end


    -- Translate to sorted list
    local missing = {}
    for _,required in ipairs(requiredBuffs) do
        if ( missingBuffs[required] ) then
            tinsert(missing, required)
        end
    end
    MRB.Model:SetPlayerBuff(unit, missing, status)
end

local function updateUnitStatus(unit)
    if ( not isUnitAllowed(unit) ) then
        return
    end

    -- Determine unit status
    local status = MRB.Model.Status.ALIVE
    if ( not UnitIsConnected(unit) ) then
        status = MRB.Model.Status.DISCONNECTED
    elseif ( UnitIsDeadOrGhost(unit) ) then
        status = MRB.Model.Status.DEAD
    end

    MRB.Model:SetPlayerStatus(unit, status)
end

local function refreshAllPartyRaidBuffs(...)
    MRB.Model:RemoveAll()
    if ( UnitInRaid("player") ) then
        for raidId = 1,GetNumGroupMembers() do
            updateUnitBuffs("raid"..raidId)
        end

    elseif ( UnitInParty("player") ) then
        for partyId = 1,GetNumSubgroupMembers() do
            updateUnitBuffs("party"..partyId)
        end
        updateUnitBuffs("player")

    else
        updateUnitBuffs("player")
    end

end


---------------------------------------------
-- INITIALIZE
---------------------------------------------
MRB.RegisterCallback(MODULE_NAME, "initialize", function()
    -- Watch for buff applied/removed
    MRB.RegisterEvent(MODULE_NAME, "UNIT_AURA", function(event, unit)
        updateUnitBuffs(unit)
    end)
    -- Make sure to update unit status when flags updated
    MRB.RegisterEvent(MODULE_NAME, "UNIT_HEALTH", function(event, unit)
        updateUnitStatus(unit)
    end)

    -- Reload all buffs when we first enter the world
    MRB.RegisterEvent(MODULE_NAME, "PLAYER_ENTERING_WORLD", refreshAllPartyRaidBuffs)

    -- Reload all buffs when group updates
    MRB.RegisterEvent(MODULE_NAME, "GROUP_ROSTER_UPDATE", refreshAllPartyRaidBuffs)

    -- Reload all buffs when configured buffs upates
    C.RegisterListener(MODULE_NAME, "updateBuffs", refreshAllPartyRaidBuffs)
end)
