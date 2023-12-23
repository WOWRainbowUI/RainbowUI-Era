local AddOnName, XIVBar = ...;
local _G = _G;
local xb = XIVBar;
local L = XIVBar.L;

if WOW_PROJECT_ID == WOW_PROJECT_MAINLINE or WOW_PROJECT_ID == WOW_PROJECT_WRATH_CLASSIC then
    ---Proxy for C_CurrencyInfo.GetCurrencyListLink
    function GetCurrencyListLink(index)
        return C_CurrencyInfo.GetCurrencyListLink(index)
    end
end

local CurrencyModule = xb:NewModule("CurrencyModule", 'AceEvent-3.0', 'AceHook-3.0')

function CurrencyModule:GetName()
    return CURRENCY;
end

function CurrencyModule:OnInitialize()
    self.rerollItems = {697, -- Elder Charm of Good Fortune
    752, -- Mogu Rune of Fate
    776, -- Warforged Seal
    994, -- Seal of Tempered Fate
    1129, -- Seal of Inevitable Fate
    1273 -- Seal of Broken Fate
    }

    self.intToOpt = {
        [1] = 'currencyOne',
        [2] = 'currencyTwo',
        [3] = 'currencyThree'
    }

    self.curButtons = {}
    self.curIcons = {}
    self.curText = {}
end

function CurrencyModule:OnEnable()
    if self.currencyFrame == nil then
        self.currencyFrame = CreateFrame("FRAME", nil, xb:GetFrame('bar'))
        xb:RegisterFrame('currencyFrame', self.currencyFrame)
    end

    self.currencyFrame:Show()
    self:CreateFrames()
    self:RegisterFrameEvents()
    self:Refresh()
end

function CurrencyModule:OnDisable()
    self.currencyFrame:Hide()
    self:UnregisterEvent('CURRENCY_DISPLAY_UPDATE')
    self:UnregisterEvent('PLAYER_XP_UPDATE')
    self:UnregisterEvent('PLAYER_LEVEL_UP')
end

function CurrencyModule:Refresh()
    local db = xb.db.profile
    xb.constants.playerLevel = UnitLevel("player")
    if InCombatLockdown() then
        if xb.constants.playerLevel < GetMaxLevelForExpansionLevel(GetExpansionLevel()) and
            db.modules.currency.showXPbar then
            self.xpBar:SetMinMaxValues(0, UnitXPMax('player'))
            self.xpBar:SetValue(UnitXP('player'))
            self.xpText:SetText(string.upper(LEVEL .. ' ' .. UnitLevel("player") .. ' ' .. UnitClass('player')))
        end
        return
    end
    if self.currencyFrame == nil then
        return;
    end
    if not db.modules.currency.enabled then
        self:Disable();
        return;
    end

    local iconSize = db.text.fontSize + db.general.barPadding
    for i = 1, 3 do
        self.curButtons[i]:Hide()
    end
    self.xpFrame:Hide()

    if xb.constants.playerLevel < GetMaxLevelForExpansionLevel(GetExpansionLevel()) and db.modules.currency.showXPbar then
        -- self.xpFrame = self.xpFrame or CreateFrame("BUTTON", nil, self.currencyFrame)

        local textHeight = floor((xb:GetHeight() - 4) / 2)
        local barHeight = (iconSize - textHeight - 2)
        if barHeight < 2 then
            barHeight = 2
        end
        self.xpIcon:SetTexture(xb.constants.mediaPath .. 'datatexts\\exp')
        self.xpIcon:SetSize(iconSize, iconSize)
        self.xpIcon:SetPoint('LEFT')
        self.xpIcon:SetVertexColor(xb:GetColor('normal'))

        self.xpText:SetFont(xb:GetFont(textHeight))
        self.xpText:SetTextColor(xb:GetColor('normal'))
        self.xpText:SetText(string.upper(LEVEL .. ' ' .. UnitLevel("player") .. ' ' .. UnitClass('player')))
        self.xpText:SetPoint('TOPLEFT', self.xpIcon, 'TOPRIGHT', 5, 0)

        self.xpBar:SetStatusBarTexture("Interface/BUTTONS/WHITE8X8")
        if db.modules.currency.xpBarCC then
            rPerc, gPerc, bPerc, argbHex = xb:GetClassColors()
            self.xpBar:SetStatusBarColor(rPerc, gPerc, bPerc, 1)
        else
            self.xpBar:SetStatusBarColor(xb:GetColor('normal'))
        end
        self.xpBar:SetMinMaxValues(0, UnitXPMax('player'))
        self.xpBar:SetValue(UnitXP('player'))
        self.xpBar:SetSize(self.xpText:GetStringWidth(), barHeight)
        self.xpBar:SetPoint('BOTTOMLEFT', self.xpIcon, 'BOTTOMRIGHT', 5, 0)

        self.xpBarBg:SetAllPoints()
        self.xpBarBg:SetColorTexture(db.color.inactive.r, db.color.inactive.g, db.color.inactive.b, db.color.inactive.a)
        self.currencyFrame:SetSize(iconSize + self.xpText:GetStringWidth() + 5, xb:GetHeight())
        self.xpFrame:SetAllPoints()
        self.xpFrame:Show()
    else -- show xp bar/show currencies
        local iconsWidth = 0
        for i = 1, GetNumWatchedTokens() do
            -- if db.modules.currency[self.intToOpt[i]] ~= '0' then
            local name, count, icon, currencyID = GetBackpackCurrencyInfo(i)
            iconsWidth = iconsWidth + self:StyleCurrencyFrame(currencyID, count, i)
            -- end
            if i == 1 then
                self.curButtons[1]:SetPoint('LEFT')
            elseif i == 2 then
                self.curButtons[2]:SetPoint('LEFT', self.curButtons[1], 'RIGHT', 5, 0)
            elseif i == 3 then
                self.curButtons[3]:SetPoint('LEFT', self.curButtons[2], 'RIGHT', 5, 0)
            end
        end
        self.currencyFrame:SetSize(iconsWidth, xb:GetHeight())
    end -- show currencies

    -- self.currencyFrame:SetSize(self.goldButton:GetSize())
    local relativeAnchorPoint = 'RIGHT'
    local xOffset = db.general.moduleSpacing
    -- For some reason anchorFrame can happen to be nil, in this case, skip this until value gets different from nil
    if anchorFrame ~= nil and not anchorFrame:IsVisible() then
        if xb:GetFrame('clockFrame') and xb:GetFrame('clockFrame'):IsVisible() then
            anchorFrame = xb:GetFrame('clockFrame')
        elseif xb:GetFrame('talentFrame') and xb:GetFrame('talentFrame'):IsVisible() then
            anchorFrame = xb:GetFrame('talentFrame')
        else
            relativeAnchorPoint = 'LEFT'
            xOffset = 0
        end
    end
    self.currencyFrame:SetPoint('LEFT', anchorFrame, relativeAnchorPoint, xOffset, 0)
end

function CurrencyModule:StyleCurrencyFrame(curId, curQuantity, i)
    local db = xb.db.profile
    local iconSize = db.text.fontSize + db.general.barPadding
    local icon = xb.constants.mediaPath .. 'datatexts\\garres'
    if tContains(self.rerollItems, curId) then
        icon = xb.constants.mediaPath .. 'datatexts\\reroll'
    end

    local iconPoint = 'RIGHT'
    local textPoint = 'LEFT'
    local padding = -3

    if xb.db.profile.modules.currency.textOnRight then
        iconPoint = 'LEFT'
        textPoint = 'RIGHT'
        padding = -(padding)
    end

    local buttonWidth = 0
    if curId ~= nil then
        self.curIcons[i]:ClearAllPoints()
        self.curText[i]:ClearAllPoints()

        self.curIcons[i]:SetTexture(icon)
        self.curIcons[i]:SetSize(iconSize, iconSize)
        self.curIcons[i]:SetPoint(iconPoint)
        self.curIcons[i]:SetVertexColor(xb:GetColor('normal'))

        self.curText[i]:SetFont(xb:GetFont(db.text.fontSize))
        self.curText[i]:SetTextColor(xb:GetColor('normal'))
        self.curText[i]:SetText(curQuantity)
        self.curText[i]:SetPoint(iconPoint, self.curIcons[i], textPoint, padding, 0)

        buttonWidth = iconSize + self.curText[i]:GetStringWidth() + 5
        self.curButtons[i]:SetSize(buttonWidth, xb:GetHeight())
        self.curButtons[i]:Show()
    end

    return buttonWidth
end

function CurrencyModule:CreateFrames()
    for i = 1, 3 do
        self.curButtons[i] = self.curButtons[i] or CreateFrame("BUTTON", nil, self.currencyFrame)
        self.curIcons[i] = self.curIcons[i] or self.curButtons[i]:CreateTexture(nil, 'OVERLAY')
        self.curText[i] = self.curText[i] or self.curButtons[i]:CreateFontString(nil, "OVERLAY")
        self.curButtons[i]:Hide()
    end

    self.xpFrame = self.xpFrame or CreateFrame("BUTTON", nil, self.currencyFrame)
    self.xpIcon = self.xpIcon or self.xpFrame:CreateTexture(nil, 'OVERLAY')
    self.xpText = self.xpText or self.xpFrame:CreateFontString(nil, 'OVERLAY')
    self.xpBar = self.xpBar or CreateFrame('STATUSBAR', nil, self.xpFrame)
    self.xpBarBg = self.xpBarBg or self.xpBar:CreateTexture(nil, 'BACKGROUND')
    self.xpFrame:Hide()
end

function CurrencyModule:RegisterFrameEvents()

    for i = 1, 3 do
        self.curButtons[i]:EnableMouse(true)
        self.curButtons[i]:RegisterForClicks("AnyUp")
        self.curButtons[i]:SetScript('OnEnter', function()
            if InCombatLockdown() then
                return;
            end
            self.curText[i]:SetTextColor(unpack(xb:HoverColors()))
            if xb.db.profile.modules.currency.showTooltip then
                self:ShowTooltip()
            end
        end)
        self.curButtons[i]:SetScript('OnLeave', function()
            if InCombatLockdown() then
                return;
            end
            local db = xb.db.profile
            self.curText[i]:SetTextColor(xb:GetColor('normal'))
            if db.modules.currency.showTooltip then
                GameTooltip:Hide()
            end
        end)
        self.curButtons[i]:SetScript('OnClick', function()
            if InCombatLockdown() then
                return;
            end
            ToggleCharacter('TokenFrame')
        end)
    end
    self:RegisterEvent('CURRENCY_DISPLAY_UPDATE', 'Refresh')
    self:RegisterEvent('PLAYER_XP_UPDATE', 'Refresh')
    self:RegisterEvent('PLAYER_LEVEL_UP', 'Refresh')
    self:SecureHook('BackpackTokenFrame_Update', 'Refresh') -- Ugh, why is there no event for this?

    self.currencyFrame:EnableMouse(true)
    self.currencyFrame:SetScript('OnEnter', function()
        if xb.db.profile.modules.currency.showTooltip then
            self:ShowTooltip()
        end
    end)
    self.currencyFrame:SetScript('OnLeave', function()
        if xb.db.profile.modules.currency.showTooltip then
            GameTooltip:Hide()
        end
    end)

    self.xpFrame:SetScript('OnEnter', function()
        if InCombatLockdown() then
            return;
        end
        self.xpText:SetTextColor(unpack(xb:HoverColors()))
        if xb.db.profile.modules.currency.showTooltip then
            self:ShowTooltip()
        end
    end)

    self.xpFrame:SetScript('OnLeave', function()
        if InCombatLockdown() then
            return;
        end
        local db = xb.db.profile
        self.xpText:SetTextColor(xb:GetColor('normal'))
        if xb.db.profile.modules.currency.showTooltip then
            GameTooltip:Hide()
        end
    end)

    self:RegisterMessage('XIVBar_FrameHide', function(_, name)
        if name == 'tradeskillFrame' then
            self:Refresh()
        end
    end)

    self:RegisterMessage('XIVBar_FrameShow', function(_, name)
        if name == 'tradeskillFrame' then
            self:Refresh()
        end
    end)
end

function CurrencyModule:ShowTooltip()
    if not xb.db.profile.modules.currency.showTooltip then
        return
    end

    local r, g, b, _ = unpack(xb:HoverColors())

    GameTooltip:SetOwner(self.currencyFrame, 'ANCHOR_' .. xb.miniTextPosition)

    if xb.constants.playerLevel < GetMaxLevelForExpansionLevel(GetExpansionLevel()) and
        xb.db.profile.modules.currency.showXPbar then
        GameTooltip:AddLine("|cFFFFFFFF[|r" .. POWER_TYPE_EXPERIENCE .. "|cFFFFFFFF]|r", r, g, b)
        GameTooltip:AddLine(" ")

        local curXp = UnitXP('player')
        local maxXp = UnitXPMax('player')
        local rested = GetXPExhaustion()
        -- XP
        GameTooltip:AddDoubleLine(XP .. ':',
            string.format('%d / %d (%d%%)', curXp, maxXp, floor((curXp / maxXp) * 100)), r, g, b, 1, 1, 1)
        -- Remaining
        GameTooltip:AddDoubleLine(L['Remaining'] .. ':',
            string.format('%d (%d%%)', (maxXp - curXp), floor(((maxXp - curXp) / maxXp) * 100)), r, g, b, 1, 1, 1)
        -- Rested
        if rested then
            GameTooltip:AddDoubleLine(L['Rested'] .. ':',
                string.format('+%d (%d%%)', rested, floor((rested / maxXp) * 100)), r, g, b, 1, 1, 1)
        end
    else
        GameTooltip:AddLine("|cFFFFFFFF[|r" .. CURRENCY .. "|cFFFFFFFF]|r", r, g, b)
        GameTooltip:AddLine(" ")

        for i = 1, GetNumWatchedTokens() do
            local name, count, icon, currencyID = GetBackpackCurrencyInfo(i)
            GameTooltip:AddDoubleLine(name, string.format('%d', count), r, g, b, 1, 1, 1)
        end

        GameTooltip:AddLine(" ")
        GameTooltip:AddDoubleLine('<' .. L['Left-Click'] .. '>', BINDING_NAME_TOGGLECURRENCY, r, g, b, 1, 1, 1)
    end

    GameTooltip:Show()
end

function CurrencyModule:GetDefaultOptions()
    return 'currency', {
        enabled = false,
        showXPbar = true,
        xpBarCC = false,
        showTooltip = true,
        textOnRight = true
    }
end

function CurrencyModule:GetConfig()
    return {
        name = self:GetName(),
        type = "group",
        args = {
            enable = {
                name = ENABLE,
                order = 0,
                type = "toggle",
                get = function()
                    return xb.db.profile.modules.currency.enabled;
                end,
                set = function(_, val)
                    xb.db.profile.modules.currency.enabled = val
                    if val then
                        self:Enable()
                    else
                        self:Disable()
                    end
                end,
                width = "full"
            },
            showXPbar = {
                name = L['Show XP Bar Below Max Level'],
                order = 1,
                type = "toggle",
                get = function()
                    return xb.db.profile.modules.currency.showXPbar;
                end,
                set = function(_, val)
                    xb.db.profile.modules.currency.showXPbar = val;
                    self:Refresh();
                end
            },
            xpBarCC = {
                name = L['Use Class Colors for XP Bar'],
                order = 2,
                type = "toggle",
                get = function()
                    return xb.db.profile.modules.currency.xpBarCC;
                end,
                set = function(_, val)
                    xb.db.profile.modules.currency.xpBarCC = val;
                    self:Refresh();
                end,
                disabled = function()
                    return not xb.db.profile.modules.currency.showXPbar
                end
            },
            showTooltip = {
                name = L['Show Tooltips'],
                order = 3,
                type = "toggle",
                get = function()
                    return xb.db.profile.modules.currency.showTooltip;
                end,
                set = function(_, val)
                    xb.db.profile.modules.currency.showTooltip = val;
                    self:Refresh();
                end
            },
            textOnRight = {
                name = L['Text on Right'],
                order = 4,
                type = "toggle",
                get = function()
                    return xb.db.profile.modules.currency.textOnRight;
                end,
                set = function(_, val)
                    xb.db.profile.modules.currency.textOnRight = val;
                    self:Refresh();
                end
            }
        }
    }
end
