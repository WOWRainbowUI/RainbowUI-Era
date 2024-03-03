if not PetActionBarFrame then return end

--------------------------------------------------------------------------------
-- Pet Bar (Classic)
-- A movable action bar for pets
--------------------------------------------------------------------------------

local AddonName, Addon = ...
local L = LibStub('AceLocale-3.0'):GetLocale(AddonName)

--------------------------------------------------------------------------------
-- Pet Button Setup
--------------------------------------------------------------------------------

local PetButtons = setmetatable({}, {
    __index = function(self, id)
        local button =  _G['PetActionButton' .. id]

        if button then
            button:SetAttribute("commandName", "BONUSACTIONBUTTON" .. id)
            Addon.BindableButton:AddQuickBindingSupport(button)

            self[id] = button
        end

        return button
    end
})

--------------------------------------------------------------------------------
-- The Pet Bar
--------------------------------------------------------------------------------

local PetBar = Addon:CreateClass('Frame', Addon.ButtonBar)

function PetBar:New()
    return PetBar.proto.New(self, 'pet')
end

function PetBar:GetDisplayName()
    return L.PetBarDisplayName
end

function PetBar:IsOverrideBar()
    -- TODO: make overrideBar a property of the bar itself instead of a global
    -- setting
    return Addon.db.profile.possessBar == self.id
end

function PetBar:UpdateOverrideBar()
    self:UpdateDisplayConditions()
end

if Addon:IsBuild('retail', 'wrath') then
    function PetBar:GetDisplayConditions()
        return '[@pet,exists,nopossessbar]show;hide'
    end
else
    function PetBar:GetDisplayConditions()
        if self:IsOverrideBar() then
            return '[@pet,exists][bonusbar:5]show;hide'
        end
        return '[@pet,exists,nobonusbar:5]show;hide'
    end
end

function PetBar:GetDefaults()
    return {
        point = 'BOTTOM',
		x = -480,
		y = 140,
		scale = 0.8,
		columns = 5,
		spacing = 2
    }
end

function PetBar:NumButtons()
    return NUM_PET_ACTION_SLOTS
end

function PetBar:AcquireButton(index)
    return PetButtons[index]
end

function PetBar:OnAttachButton(button)
    button.HotKey:SetAlpha(self:ShowingBindingText() and 1 or 0)
    button:Show()

    Addon:GetModule('ButtonThemer'):Register(button, L.PetBarDisplayName)
    Addon:GetModule('Tooltips'):Register(button)
end

function PetBar:OnDetachButton(button)
    Addon:GetModule('ButtonThemer'):Unregister(button, L.PetBarDisplayName)
    Addon:GetModule('Tooltips'):Unregister(button)
end

-- keybound events
function PetBar:KEYBOUND_ENABLED()
    self:ForButtons("Show")
end

function PetBar:KEYBOUND_DISABLED()
    local petBarShown = PetHasActionBar()

    for _, button in pairs(self.buttons) do
        if petBarShown and GetPetActionInfo(button:GetID()) then
            button:Show()
        else
            button:Hide()
        end
    end
end

PetBar:Extend('OnAcquire', function(self) self:UpdateTransparent(true) end)

function PetBar:OnSetAlpha()
    self:UpdateTransparent()
end

function PetBar:UpdateTransparent(force)
    local transparent = self:GetAlpha() == 0
    if (self.transparent ~= transparent) or force then
        self.transparent = transparent

        if transparent then
            for _, button in pairs(self.buttons) do
                if button.cooldown:GetParent() ~= Addon.ShadowUIParent then
                    button.cooldown:SetParent(Addon.ShadowUIParent)
                end
            end
        else
            for _, button in pairs(self.buttons) do
                if button.cooldown:GetParent() ~= button then
                    button.cooldown:SetParent(button)
                end
            end
        end
    end
end

-- binding text
function PetBar:SetShowBindingText(show)
    show = show and true

    if show == Addon.db.profile.showBindingText then
        self.sets.showBindingText = nil
    else
        self.sets.showBindingText = show
    end

    for _, button in pairs(self.buttons) do
        button.HotKey:SetAlpha(show and 1 or 0)
    end
end

function PetBar:ShowingBindingText()
    local result = self.sets.showBindingText

    if result == nil then
        result = Addon.db.profile.showBindingText
    end

    return result
end

function PetBar:OnCreateMenu(menu)
    local L = LibStub('AceLocale-3.0'):GetLocale('Dominos-Config')

    local layoutPanel = menu:NewPanel(L.Layout)

    layoutPanel:NewCheckButton {
        name = L.ShowBindingText,
        get = function()
            return layoutPanel.owner:ShowingBindingText()
        end,
        set = function(_, enable)
            layoutPanel.owner:SetShowBindingText(enable)
        end
    }

    layoutPanel:AddLayoutOptions()

    menu:AddFadingPanel()
    menu:AddAdvancedPanel()
end

--------------------------------------------------------------------------------
-- the module
--------------------------------------------------------------------------------

local PetBarModule = Addon:NewModule('PetBar')

function PetBarModule:Load()
    self.bar = PetBar:New()
end

function PetBarModule:Unload()
    if self.bar then
        self.bar:Free()
        self.bar = nil
    end
end
