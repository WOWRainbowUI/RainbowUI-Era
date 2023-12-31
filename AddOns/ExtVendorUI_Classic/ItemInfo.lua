local L = LibStub("AceLocale-3.0"):GetLocale("ExtVendor", true);

local CLASS_PROFICIENCIES = {
    ["DRUID"]       = {
        weapons = { LE_ITEM_WEAPON_MACE1H, LE_ITEM_WEAPON_MACE2H, LE_ITEM_WEAPON_POLEARM, LE_ITEM_WEAPON_STAFF, LE_ITEM_WEAPON_DAGGER, LE_ITEM_WEAPON_UNARMED },
    },
    ["HUNTER"]      = {
        weapons = { LE_ITEM_WEAPON_AXE1H, LE_ITEM_WEAPON_SWORD1H, LE_ITEM_WEAPON_AXE2H, LE_ITEM_WEAPON_SWORD2H, LE_ITEM_WEAPON_POLEARM, LE_ITEM_WEAPON_STAFF,
                    LE_ITEM_WEAPON_DAGGER, LE_ITEM_WEAPON_UNARMED, LE_ITEM_WEAPON_BOWS, LE_ITEM_WEAPON_GUNS, LE_ITEM_WEAPON_CROSSBOW },
    },
    ["MAGE"]        = {
        weapons = { LE_ITEM_WEAPON_SWORD1H, LE_ITEM_WEAPON_STAFF, LE_ITEM_WEAPON_DAGGER, LE_ITEM_WEAPON_WAND },
    },
    ["PALADIN"]     = {
        weapons = { LE_ITEM_WEAPON_AXE1H, LE_ITEM_WEAPON_MACE1H, LE_ITEM_WEAPON_SWORD1H, LE_ITEM_WEAPON_AXE2H, LE_ITEM_WEAPON_MACE2H, LE_ITEM_WEAPON_SWORD2H, LE_ITEM_WEAPON_POLEARM },
        canUseShields = true,
    },
    ["PRIEST"]      = {
        weapons = { LE_ITEM_WEAPON_MACE1H, LE_ITEM_WEAPON_DAGGER, LE_ITEM_WEAPON_STAFF, LE_ITEM_WEAPON_WAND },
    },
    ["ROGUE"]       = {
        weapons = { LE_ITEM_WEAPON_AXE1H, LE_ITEM_WEAPON_MACE1H, LE_ITEM_WEAPON_SWORD1H, LE_ITEM_WEAPON_DAGGER, LE_ITEM_WEAPON_UNARMED, LE_ITEM_WEAPON_BOWS, LE_ITEM_WEAPON_GUNS, LE_ITEM_WEAPON_CROSSBOW, LE_ITEM_WEAPON_THROWN },
    },
    ["SHAMAN"]      = {
        weapons = { LE_ITEM_WEAPON_AXE1H, LE_ITEM_WEAPON_MACE1H, LE_ITEM_WEAPON_AXE2H, LE_ITEM_WEAPON_MACE2H, LE_ITEM_WEAPON_DAGGER, LE_ITEM_WEAPON_UNARMED, LE_ITEM_WEAPON_STAFF },
        canUseShields = true,
    },
    ["WARLOCK"]     = {
        weapons = { LE_ITEM_WEAPON_SWORD1H, LE_ITEM_WEAPON_DAGGER, LE_ITEM_WEAPON_STAFF, LE_ITEM_WEAPON_WAND },
    },
    ["WARRIOR"]     = {
        weapons = { LE_ITEM_WEAPON_AXE1H, LE_ITEM_WEAPON_MACE1H, LE_ITEM_WEAPON_SWORD1H, LE_ITEM_WEAPON_AXE2H, LE_ITEM_WEAPON_MACE2H, LE_ITEM_WEAPON_SWORD2H, LE_ITEM_WEAPON_DAGGER,
                    LE_ITEM_WEAPON_UNARMED, LE_ITEM_WEAPON_POLEARM, LE_ITEM_WEAPON_STAFF, LE_ITEM_WEAPON_BOWS, LE_ITEM_WEAPON_GUNS, LE_ITEM_WEAPON_CROSSBOW, LE_ITEM_WEAPON_THROWN },
        canUseShields = true,
    },
	["DEATHKNIGHT"]     = { -- 暫時修正
        weapons = { LE_ITEM_WEAPON_AXE1H, LE_ITEM_WEAPON_SWORD1H, LE_ITEM_WEAPON_AXE2H, LE_ITEM_WEAPON_SWORD2H, LE_ITEM_WEAPON_POLEARM },

    },
};

local ARMOR_RANKS = {
    [LE_ITEM_ARMOR_CLOTH] = 1,
    [LE_ITEM_ARMOR_LEATHER] = 2,
    [LE_ITEM_ARMOR_MAIL] = 3,
    [LE_ITEM_ARMOR_PLATE] = 4,
};

--========================================
-- Retrieve additional item info via the
-- item's tooltip
--========================================
function ExtVendor_GetExtendedItemInfo(link)

    --local _FULLSTART = debugprofilestop();
    --local _START = 0;

    -- set up return values
    local isKnown = false;
    local classes = {};
    local isAccountBound = false;
    local isFoodOrDrink = false;
    local foundClasses = false;

    -- generate item tooltip in hidden tooltip object
    ExtVendorHiddenTooltip:SetOwner(UIParent, "ANCHOR_LEFT");
    
    --_START = debugprofilestop();
    local itemId = ExtVendor_GetItemID(link);
    --if (EXTVENDOR.PerfProfile.EII_Tooltip.Enable) then EXTVENDOR.PerfProfile.EII_Tooltip.GetItemID = EXTVENDOR.PerfProfile.EII_Tooltip.GetItemID + (debugprofilestop() - _START); end
    
    --_START = debugprofilestop();
    local ok = pcall(ExtVendor_SetHiddenTooltip, link);
    --ExtVendor_SetHiddenTooltip(link);
    --if (EXTVENDOR.PerfProfile.EII_Tooltip.Enable) then EXTVENDOR.PerfProfile.EII_Tooltip.SetTooltip = EXTVENDOR.PerfProfile.EII_Tooltip.SetTooltip + (debugprofilestop() - _START); end
    
    if (ok) then
    
        for cl = 2, ExtVendorHiddenTooltip:NumLines(), 1 do
            --_START = debugprofilestop();
            local checkLine = _G["ExtVendorHiddenTooltipTextLeft" .. cl]:GetText();
            --if (EXTVENDOR.PerfProfile.EII_Tooltip.Enable) then EXTVENDOR.PerfProfile.EII_Tooltip.GetText = EXTVENDOR.PerfProfile.EII_Tooltip.GetText + (debugprofilestop() - _START); end
            if (checkLine) then
                -- check for "Already Known"
                if (not isKnown) then
                    --_START = debugprofilestop();
                    if (checkLine == ITEM_SPELL_KNOWN) then
                        isKnown = true;
                    end
                    --if (EXTVENDOR.PerfProfile.EII_Tooltip.Enable) then EXTVENDOR.PerfProfile.EII_Tooltip.ParseAlreadyKnown = EXTVENDOR.PerfProfile.EII_Tooltip.ParseAlreadyKnown + (debugprofilestop() - _START); end
                end
                
                -- check if the item is food or drink
                if (not isFoodOrDrink) then
                    --_START = debugprofilestop();
                    if (string.match(checkLine, L["ITEM_USE_FOOD_BASIC"]) or string.match(checkLine, L["ITEM_USE_DRINK_BASIC"]) or string.match(checkLine, L["ITEM_USE_FOOD_DRINK_BASIC"])) then
                        isFoodOrDrink = true;
                    end
                    --if (EXTVENDOR.PerfProfile.EII_Tooltip.Enable) then EXTVENDOR.PerfProfile.EII_Tooltip.ParseFood = EXTVENDOR.PerfProfile.EII_Tooltip.ParseFood + (debugprofilestop() - _START); end
                end
                
                -- check for battle.net account binding
                if (not isAccountBound) then
                    --_START = debugprofilestop();
                    if (string.match(checkLine, ITEM_BIND_TO_BNETACCOUNT) or string.match(checkLine, ITEM_BIND_TO_ACCOUNT)) then
                        isAccountBound = true;
                    end
                    --if (EXTVENDOR.PerfProfile.EII_Tooltip.Enable) then EXTVENDOR.PerfProfile.EII_Tooltip.ParseAccountBound = EXTVENDOR.PerfProfile.EII_Tooltip.ParseAccountBound + (debugprofilestop() - _START); end
                end
                
                -- check for "Classes: xxx"
                if (not foundClasses) then
                    --_START = debugprofilestop();
                    local checkClasses = ExtVendor_GetRequiredClasses(checkLine);
                    if (checkClasses) then
                        classes = checkClasses;
                        foundClasses = true;
                    end
                    --if (EXTVENDOR.PerfProfile.EII_Tooltip.Enable) then EXTVENDOR.PerfProfile.EII_Tooltip.ParseClasses = EXTVENDOR.PerfProfile.EII_Tooltip.ParseClasses + (debugprofilestop() - _START); end
                end
            end
        end
    
    end
    
    --_START = debugprofilestop();
    ExtVendorHiddenTooltip:Hide();
    --if (EXTVENDOR.PerfProfile.EII_Tooltip.Enable) then EXTVENDOR.PerfProfile.EII_Tooltip.HideTooltip = EXTVENDOR.PerfProfile.EII_Tooltip.HideTooltip + (debugprofilestop() - _START); end
    --if (EXTVENDOR.PerfProfile.EII_Tooltip.Enable) then EXTVENDOR.PerfProfile.EII_Tooltip.Total = EXTVENDOR.PerfProfile.EII_Tooltip.Total + (debugprofilestop() - _FULLSTART); end
    --if (EXTVENDOR.PerfProfile.EII_Tooltip.Enable) then EXTVENDOR.PerfProfile.EII_Tooltip.ItemCount = EXTVENDOR.PerfProfile.EII_Tooltip.ItemCount + 1; end
    
    return isKnown, classes, itemId, isAccountBound, isFoodOrDrink;
end

function ExtVendor_ScanItemTooltip(link)
    ExtVendorHiddenTooltip:SetOwner(UIParent, "ANCHOR_LEFT");
    local itemId = ExtVendor_GetItemID(link);
    
    local ok = pcall(ExtVendor_SetHiddenTooltip, link);
    if (ok) then
        for cl = 2, ExtVendorHiddenTooltip:NumLines(), 1 do
            local checkLine = _G["ExtVendorHiddenTooltipTextLeft" .. cl]:GetText();
            if (checkLine) then
                print("[" .. cl .. "] " .. checkLine);
                if (string.match(checkLine, L["ITEM_USE_FOOD_BASIC"]) or string.match(checkLine, L["ITEM_USE_DRINK_BASIC"]) or string.match(checkLine, L["ITEM_USE_FOOD_DRINK_BASIC"])) then
                    print("THIS ITEM IS FOOD/DRINK");
                end
            end
        end
    end
    ExtVendorHiddenTooltip:Hide();
end

--========================================
-- Returns an item's ID from the given
-- link
--========================================
function ExtVendor_GetItemID(link)
    if (link) then
        local w;
        for w in string.gmatch(link, "item:(%d+):") do
            return tonumber(w);
        end
    end
    return nil;
end

--========================================
-- Returns a list of required classes
-- based on the "Classes:" line of an
-- item tooltip
--========================================
function ExtVendor_GetRequiredClasses(tooltipString)
    if (string.find(tooltipString, L["CLASSES"])) then
        local out = {};
        local i;
        local className = "";
        for i = string.len(L["CLASSES"]) + 1, string.len(tooltipString), 1 do
            local chr = string.sub(tooltipString, i, i);
            local skipChar = false;
            local finishName = false;
            if (chr == ",") then
                finishName = true;
                skipChar = true;
            elseif (i == string.len(tooltipString)) then
                finishName = true;
            end
            if (not skipChar) then
                className = className .. chr;
            end
            if (finishName) then
                table.insert(out, string.trim(className));
                className = "";
            end
        end

        return out;
    end
    return nil;
end

--========================================
-- Returns whether or not the specified
-- class is in the given list of classes
--========================================
function ExtVendor_ClassIsAllowed(class, classes)
    if (table.maxn(classes) > 0) then
        for index, name in pairs(classes) do
            if (class == name) then
                return true;
            end
        end
        return false;
    end
    return true;
end

--========================================
-- Returns whether or not the character's
-- class can EVER wear armor of the given
-- type (e.g. mages can NEVER wear
-- leather or higher, shamans can NEVER
-- wear plate, etc.)
--========================================
function ExtVendor_IsUsableArmorType(itemClassId, itemSubClassId, slot)
    local maxArmor = select(2, ExtVendor_GetOptimalArmorType());

    if ((itemClassId == LE_ITEM_CLASS_ARMOR) and (slot ~= "INVTYPE_CLOAK")) then
        if ((itemSubClassId == LE_ITEM_ARMOR_CLOTH) or (itemSubClassId == LE_ITEM_ARMOR_LEATHER) or (itemSubClassId == LE_ITEM_ARMOR_MAIL) or (itemSubClassId == LE_ITEM_ARMOR_PLATE)) then
            if (ARMOR_RANKS[itemSubClassId] > ARMOR_RANKS[maxArmor]) then
                return false;
            end
        elseif (itemSubClassId == LE_ITEM_ARMOR_SHIELD) then
            local cls = select(2, UnitClass("player"));
            if (CLASS_PROFICIENCIES[cls].canUseShields) then
                return true;
            end
            return false;
        end
    end
    return true;
end

--========================================
-- Returns whether or not the character's
-- class can use the given weapon type
-- based on class proficiencies
--========================================
function ExtVendor_IsUsableWeaponType(itemClassId, itemSubClassId, slot)
    if (itemClassId == LE_ITEM_CLASS_WEAPON) then
        if ((itemSubClassId ~= LE_ITEM_WEAPON_GENERIC) and (itemSubClassId ~= LE_ITEM_WEAPON_FISHINGPOLE)) then
            local cls = select(2, UnitClass("player"));
            for index, wt in pairs(CLASS_PROFICIENCIES[cls].weapons) do
                if (wt == itemSubClassId) then
                    return true;
                end
            end
            return false;
        end
    end
    return true;
end

--========================================
-- Determine if a piece of armor is the
-- best type for the player's class
-- (cloth/leather/mail/plate)
--========================================
function ExtVendor_IsOptimalArmor(itemClassId, itemSubClassId, slot)
    if (itemClassId == LE_ITEM_CLASS_ARMOR) then
        if (slot == "INVTYPE_CLOAK") then
            return true;
        end
        if ((itemSubClassId == LE_ITEM_ARMOR_CLOTH) or (itemSubClassId == LE_ITEM_ARMOR_LEATHER) or (itemSubClassId == LE_ITEM_ARMOR_MAIL) or (itemSubClassId == LE_ITEM_ARMOR_PLATE)) then
            local opt = ExtVendor_GetOptimalArmorType();
            if opt and (ARMOR_RANKS[itemSubClassId] < ARMOR_RANKS[opt]) then
                --DebugMessage("ExtVendor_IsOptimalArmor(\"" .. type .. "\", \"" .. subType .. "\", \"" .. slot .. "\") = FALSE");
                return false;
            end
        end
    end
    --DebugMessage("ExtVendor_IsOptimalArmor(\"" .. type .. "\", \"" .. subType .. "\", \"" .. slot .. "\") = TRUE");
    return true;
end

--========================================
-- Returns the optimal armor type for the
-- player's class (factors in level for
-- hunters, shamans, paladins and
-- warriors), as well as the highest
-- armor type the class can ever wear
-- (regardless of level)
--========================================
function ExtVendor_GetOptimalArmorType()

    local __, cls = UnitClass("player");
    local lvl = UnitLevel("player");

    local optArmor, maxArmor;

    if ((cls == "MAGE") or (cls == "WARLOCK") or (cls == "PRIEST")) then
        optArmor = LE_ITEM_ARMOR_CLOTH;
        maxArmor = LE_ITEM_ARMOR_CLOTH;
    elseif ((cls == "ROGUE") or (cls == "DRUID")) then
        optArmor = LE_ITEM_ARMOR_LEATHER;
        maxArmor = LE_ITEM_ARMOR_LEATHER;
    elseif ((cls == "HUNTER") or (cls == "SHAMAN")) then
        if (lvl >= 40) then
            optArmor = LE_ITEM_ARMOR_MAIL;
        else
            optArmor = LE_ITEM_ARMOR_LEATHER;
        end
        maxArmor = LE_ITEM_ARMOR_MAIL;
    elseif ((cls == "PALADIN") or (cls == "WARRIOR") or (cls == "DEATHKNIGHT")) then -- 暫時修正
        if (lvl >= 40) then
            optArmor = LE_ITEM_ARMOR_PLATE;
        else
            optArmor = LE_ITEM_ARMOR_MAIL;
        end
        maxArmor = LE_ITEM_ARMOR_PLATE;
    end
    return optArmor, maxArmor;
end

--========================================
-- Returns if a given level is 'outdated'
-- (e.g. below a previous level cap from
-- the player's current level)
--========================================
function ExtVendor_IsOutdatedItemLevel(itemLevel, playerLevel)
    local i;
    local itemExpac, playerExpac;
    for i = #MAX_PLAYER_LEVEL_TABLE, 0, -1 do
        if (playerLevel <= MAX_PLAYER_LEVEL_TABLE[i]) then
            playerExpac = i;
        end
    end
    for i = #MAX_PLAYER_LEVEL_TABLE, 0, -1 do
        if (itemLevel <= MAX_PLAYER_LEVEL_TABLE[i]) then
            itemExpac = i;
        end
    end
    if (itemExpac > playerExpac) then
        return false, itemExpac, playerExpac;
    elseif (itemExpac < (playerExpac - 1)) then
        return true, itemExpac, playerExpac;
    else
        return (itemLevel <= playerLevel - 10), itemExpac, playerExpac;
    end
end
