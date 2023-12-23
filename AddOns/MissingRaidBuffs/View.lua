local MRB, C, L = unpack(select(2, ...))
local MODULE_NAME = "View"


---------------------------------------------
-- LOCALIZATION
---------------------------------------------
L_MISSING_RAID_BUFFS = L["Missing Raid Buffs"]
local L_CONFIGURE = L["Configure"]
local L_QUICK_SELECT = L["Quick Select"]
local L_SHOW_OPTIONS = L["Show options"]
local L_LEFT_CLICK = L["Left click"]
local L_RIGHT_CLICK = L["Right click"]
local L_DEAD = DEAD
local L_OFFLINE = L["Offline"]


---------------------------------------------
-- CONSTANTS
---------------------------------------------
local BUTTON_HEIGHT = 16
local BUTTON_MARGIN = 0
local TEXTURE_SCALING = 0.04

local FORTITUDE_BUFF_TEXTURE = 135941


---------------------------------------------
-- VARIABLES
---------------------------------------------
local initialized = false
local orderedPlayersWithMissingBuffs = {} -- ordered list of group members that are missing buffs
local useSecureFrames = true -- determines when we can use secure frames or not


---------------------------------------------
-- UTILITIES
---------------------------------------------
local function contains(t, value)
    for i,v in ipairs(t) do
        if ( v == value ) then
            return true
        end
    end
    return false
end


---------------------------------------------
-- LIST VIEW
---------------------------------------------
local function showHideFrame()
    if ( not C:is("Show") ) then
        MissingRaidBuffsListView:Hide()
        return
    end

    -- hide when noone needs a healthstone
    local isEmpty = false -- treat isEmpty as false when HideWhenEmpty == false
    if ( C:is("HideWhenEmpty") ) then
        isEmpty = ( #orderedPlayersWithMissingBuffs == 0 )
    end

    -- hide when in combat
    local inCombat = false -- treat inCombat as false when HideWhenInComat == false
    if ( C:is("HideWhenInCombat") ) then
        inCombat = UnitAffectingCombat("player")
    end

    -- hiding when not in group
    local inParty = true -- treat inParty as true when HideNotInGroup == false
    if ( C:is("HideWhenNotInGroup") ) then
        inParty = UnitInParty("player")
    end

    if ( isEmpty or inCombat or not inParty ) then
        MRB:trace(MODULE_NAME, "HIDE", "isEmpty", isEmpty, "inCombat", inCombat, "inParty", inParty)
        MissingRaidBuffsListView:Hide()
    else
        MRB:trace(MODULE_NAME, "SHOW", "isEmpty", isEmpty, "inCombat", inCombat, "inParty", inParty)
        MissingRaidBuffsListView:Show()
    end
end

local function getGroupId(unit)
    local raidId = UnitInRaid(unit)
    if ( raidId ) then
        return select(3, GetRaidRosterInfo(raidId))
    end

    -- If not in a raid, default to group 1
    return 1
end

local function shouldInclude(unit)
    local groupsize = GetNumGroupMembers()
    local filterGroupSize = C:get("FilterGroupSize")
    local groupid = getGroupId(unit)

    return groupsize < filterGroupSize
        or ( groupsize >= filterGroupSize and C:is("GroupAssignments/group" .. groupid) )
        or ( groupsize >= filterGroupSize and C:is("ShowAllGroups") )
end

local function handleModelUpdate(event, ...)
    orderedPlayersWithMissingBuffs = {}
    MRB.orderedPlayersWithMissingBuffs = orderedPlayersWithMissingBuffs

    -- convert map to array
    for unit,data in pairs(MRB.Model:Get()) do
        if ( shouldInclude(unit) ) then
            tinsert(orderedPlayersWithMissingBuffs, {
                key = unit,
                value = data
            })
        end
    end

    -- sort
    local playerGroup = getGroupId("player")
    table.sort(orderedPlayersWithMissingBuffs, function(e1, e2)
        -- Group assignments
        if ( GetNumGroupMembers() >= C:get("FilterGroupSize") ) then
            local assignedGroup1 = C:is("GroupAssignments/group" .. getGroupId(e1.key))
            local assignedGroup2 = C:is("GroupAssignments/group" .. getGroupId(e2.key))
            if ( assignedGroup1 ~= assignedGroup2 ) then
                return assignedGroup1
            end
        end

        -- Sort by status (live, dead, disconnected)
        if ( e1.value.status ~= e2.value.status ) then
            return e1.value.status < e2.value.status
        end

        -- Number of buffs
        if ( #e1.value.missingBuffs ~= #e2.value.missingBuffs ) then
           return #e1.value.missingBuffs > #e2.value.missingBuffs
        end

        -- group (starting with your own group)
        if ( UnitInRaid("player") ) then
            local group1 = getGroupId(e1.key)
            local group2 = getGroupId(e2.key)
            if( group1 ~= group2 ) then
                if ( group1 < playerGroup ) then
                    group1 = group2 + 8
                end
                if ( group2 < playerGroup ) then
                    group2 = group2 + 8
                end
                return group1 < group2
            end
        end

        -- unit
        return e2.key > e1.key
    end)

    MissingRaidBuffsListView.ScrollFrame:Update()
end

local function handleStartEndCombat(event)
    local self = MissingRaidBuffsListView.ScrollFrame
    local removeButtons = self:GetButtons()
    if ( event == "PLAYER_REGEN_DISABLED" ) then
        -- In combat :: start using insecure frames, hide all secure ones
        useSecureFrames = false

    elseif ( event == "PLAYER_REGEN_ENABLED" ) then
        -- Out of combat :: start using secure frames, hide all insecure ones
        useSecureFrames = true
    end
    local addButtons = self:GetButtons()

    --[[
        There are two major concerns.

            1) Hiding & showing SecureButtons while in combat.
               Buttons must be able to automatically hide and show while in combat in response to combat events.
               This isn't possible with SecureButtons, so as a workaround we use insecure buttons upon entering
               combat, and add them on leaving combat.

            2) Remove the temporary secure status from ListView
               Temporary secure status is set when the frame has secure children, or a secure frame is anchored to it.
               To remove ListView's temporary secure status we must,
                a) Remove the parent for all secure buttons; regardless of their visiblity
                b) Clear anchors for all SecureButton.

        To satisfy both of these conditions we swamp insecure and secure buttons upon enter/leave combat.
    ]]
    if ( removeButtons ~= addButtons ) then
        for i = 1, #removeButtons do
            removeButtons[i]:Hide()
            removeButtons[i]:SetParent(nil)
            removeButtons[i]:ClearAllPoints()
        end
        for i = 1, #addButtons do
            addButtons[i]:SetParent(self:GetParent())
            addButtons[i]:SetAnchors()
        end
    end

    self:Update()
end

local function handleOptionsChanged(option, newValue)
    if ( option == "Locked" ) then
        MissingRaidBuffsListView.TitleBar:EnableMouse(not newValue)
        MissingRaidBuffsListView.ResizeButton:SetShown(not newValue)
        MissingRaidBuffsListView.ResizeButton:SetMovable(not newValue)
        MissingRaidBuffsListView:StopMovingOrSizing()

    elseif ( option == "Show"
            or option == "HideWhenEmpty"
            or option == "HideWhenInCombat"
            or option == "HideWhenNotInGroup" ) then
        MissingRaidBuffsListView.ScrollFrame:Update()
    end
end


---------------------------------------------
-- MIXIN: TITLE BAR
---------------------------------------------
MissingRaidBuffsListViewTitleBarMixIn = {}
function MissingRaidBuffsListViewTitleBarMixIn:OnDragStart()
    self:GetParent():StartMoving()
end

function MissingRaidBuffsListViewTitleBarMixIn:OnDragStop()
    self:GetParent():StopMovingOrSizing()
end


---------------------------------------------
-- MIXIN: CONFIGURE BUTTON MIXIN
---------------------------------------------
MissingRaidBuffsListViewConfigureButtonMixIn  = {}
function MissingRaidBuffsListViewConfigureButtonMixIn:OnLoad()
    self:RegisterForClicks("LeftButtonUp", "RightButtonUp")
end

function MissingRaidBuffsListViewConfigureButtonMixIn:OnEnter()
    self.texture:SetAlpha(1.0)
    GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
    GameTooltip:SetText(L_CONFIGURE)
    GameTooltip:AddDoubleLine(L_QUICK_SELECT, L_LEFT_CLICK, 1, 1, 1, 0.7, 0.7, 0.7)
    GameTooltip:AddDoubleLine(L_SHOW_OPTIONS, L_RIGHT_CLICK, 1, 1, 1, 0.7, 0.7, 0.7)
    GameTooltip:Show()
end

function MissingRaidBuffsListViewConfigureButtonMixIn:OnLeave()
    self.texture:SetAlpha(0.75)
    GameTooltip_Hide()
end

function MissingRaidBuffsListViewConfigureButtonMixIn:OnMouseDown()
    self.texture:SetPoint("TOPLEFT", 1, -1)
end

function MissingRaidBuffsListViewConfigureButtonMixIn:OnMouseUp()
    self.texture:SetPoint("TOPLEFT", 0, 0)
end

function MissingRaidBuffsListViewConfigureButtonMixIn:OnClick(button)
    -- show popup quickselect
    if ( button == "LeftButton") then
        MissingRaidBuffsListView.QuickSelect:SetShown(not MissingRaidBuffsListView.QuickSelect:IsShown())
        MissingRaidBuffsListView.QuickSelect:Update()
    elseif ( button == "RightButton" ) then
        InterfaceOptionsFrame_OpenToCategory(C.GENERAL_OPTIONS);
        if ( not C.GENERAL_OPTIONS:IsShown() ) then
            InterfaceOptionsFrame_OpenToCategory(C.GENERAL_OPTIONS);
        end
    end
end


---------------------------------------------
-- MIXIN: QUICK SELECT MIXIN
---------------------------------------------
MissingRaidBuffsListViewQuickSelectMixIn = {}

function MissingRaidBuffsListViewQuickSelectMixIn:OnLoad()
    self.buttons = CreateFramePool("BUTTON", self, "MissingRaidBuffsListViewQuickSelectButtonTemplate")
end

function MissingRaidBuffsListViewQuickSelectMixIn:Update()
    self.buttons:ReleaseAll()
    if ( not self:IsVisible() ) then
        return
    end

    local previous = nil
    for index,buff in ipairs(C:GetAllBuffs()) do
        local button = self.buttons:Acquire()
        button:SetID(index)

        local enabled, spellName, texture = C:GetBuffInfo(index)
        button.tooltipText = spellName
        button.Icon:SetTexture(texture)
        button.Icon:SetDesaturated( not buff.Enabled)
        button.Highlight:SetShown(buff.Enabled)

        if ( previous == nil ) then
            button:SetPoint("RIGHT", self, "RIGHT", -5, 0)
        else
            button:SetPoint("RIGHT", previous, "LEFT", -5, 0)
        end
        button:Show()

        previous = button
    end
end


---------------------------------------------
-- MIXIN: QUICK SELECT BUTTON MIXIN
---------------------------------------------
MissingRaidBuffsListViewQuickSelectButtonMixIn =  {}
function MissingRaidBuffsListViewQuickSelectButtonMixIn:OnClick()
    C:ToggleBuff(self:GetID())
    self:GetParent():Update()
end

function MissingRaidBuffsListViewQuickSelectButtonMixIn:OnMouseDown()
    self.Icon:SetPoint("TOPLEFT", 1, -1)
    self.Icon:SetPoint("BOTTOMRIGHT", 1, -1)
end

function MissingRaidBuffsListViewQuickSelectButtonMixIn:OnMouseUp()
    self.Icon:SetPoint("TOPLEFT", 0, 0)
    self.Icon:SetPoint("BOTTOMRIGHT", 0, 0)
end

function MissingRaidBuffsListViewQuickSelectButtonMixIn:OnEnter()
    GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
    GameTooltip:SetText(self.tooltipText)
    GameTooltip:Show()
end

function MissingRaidBuffsListViewQuickSelectButtonMixIn:OnLeave()
    GameTooltip_Hide()
end


---------------------------------------------
-- MIXIN: BUTTON
---------------------------------------------
MissingRaidBuffsListViewButtonMixIn = {}
function MissingRaidBuffsListViewButtonMixIn:SetAnchors()
    local listView = self:GetParent()
    local scrollFrame = listView.ScrollFrame

    local buttons = self:IsProtected() and scrollFrame.secureButtons or scrollFrame.buttons
    self:SetPoint("RIGHT", listView)
    if self:GetID() == 1 then
        self:SetPoint("TOPLEFT", scrollFrame)
    else
        self:SetPoint("TOPLEFT", buttons[self:GetID() - 1], "BOTTOMLEFT", 0, -BUTTON_MARGIN)
    end
end

function MissingRaidBuffsListViewButtonMixIn:OnUpdate()
    local inRange, checkedRange = UnitInRange(self.unit);
    self.OutOfRangeIcon:SetShown(checkedRange and not inRange)
    if ( checkedRange and not inRange ) then
        self:SetAlpha(0.55);
    else
        self:SetAlpha(1);
    end
end

function MissingRaidBuffsListViewButtonMixIn:SetPlayerBuffs(unit, data)
    local playerName = UnitName(unit)
    self.Name:SetText(playerName)
    self.Background:SetStatusBarColor(GetClassColorObj(select(2,UnitClass(unit))):GetRGB())

    self.unit = unit
    if ( self:IsProtected() ) then
        self:SetAttribute("unit", unit)
        self:SetAttribute("type1", "target");
        if ( data.status == MRB.Model.Status.ALIVE ) then
            -- find first misingbuff that the player can cast
            -- cast group buff if 3 or more group members need that buff
            -- else cast individual buff
        end
    end

    -- Show hide PreferredIcon
    local unitGroupId = getGroupId(unit)
    local isPreferred = GetNumGroupMembers() >= C:get("FilterGroupSize")
            and C:is("GroupAssignments/group" .. unitGroupId)
            and C:is("ShowAllGroups")
    self.PreferredTexture:SetShown(isPreferred)

    if ( data.status == MRB.Model.Status.DEAD ) then
        self.Status:SetText(L_DEAD)
    elseif ( data.status == MRB.Model.Status.DISCONNECTED ) then
        self.Status:SetText(L_OFFLINE)
    else
        self.Status:SetText("")
        local previous = null
        for _,buff in ipairs(data.missingBuffs) do
            local texture = MissingRaidBuffsListView.ScrollFrame.auraTexturePool:Acquire()
            texture:SetDrawLayer("ARTWORK", 2) -- change the texture sublevel so it renders above the statusbar

            local enabled, spellNamme, spellTexture = C:GetBuffInfo(buff)
            texture:SetTexture(spellTexture)
            texture:SetTexCoord(0+TEXTURE_SCALING, 1-TEXTURE_SCALING, 0+TEXTURE_SCALING, 1-TEXTURE_SCALING)
            texture:SetSize(14, 14)
            texture:SetParent(self)
            if ( previous == nil ) then
                texture:SetPoint("RIGHT", self, "RIGHT", -2, 0)
            else
                texture:SetPoint("RIGHT", previous, "LEFT", -2, 0)
            end
            texture:Show()
            previous = texture
        end
    end
end


---------------------------------------------
-- MIXIN: RESIZE BUTTON
---------------------------------------------
MissingRaidBuffsListViewResizeButtonMixIn = {}
function MissingRaidBuffsListViewResizeButtonMixIn:OnMouseDown()
    self:SetButtonState("PUSHED", true);
    self:GetHighlightTexture():Hide();
    self:GetParent():StartSizing("BOTTOMRIGHT");
end

function MissingRaidBuffsListViewResizeButtonMixIn:OnMouseUp()
    self:SetButtonState("NORMAL", false);
    self:GetHighlightTexture():Show();
    self:GetParent():StopMovingOrSizing();
end


---------------------------------------------
-- MIXIN: SCROLL FRAME
---------------------------------------------
MissingRaidBuffsListViewScrollFrameMixIn = {}
function MissingRaidBuffsListViewScrollFrameMixIn:OnLoad()
    self.buttons = {}
    self.secureButtons = {}
    self.auraTexturePool = CreateTexturePool(self, "ARTWORK", 0)
end

function MissingRaidBuffsListViewScrollFrameMixIn:OnVerticalScroll(offset)
    FauxScrollFrame_OnVerticalScroll(self, offset, BUTTON_HEIGHT+BUTTON_MARGIN, self.Update);
end


function MissingRaidBuffsListViewScrollFrameMixIn:GetButtons()
    local buttons = ( useSecureFrames ) and self.secureButtons or self.buttons
    local template = ( useSecureFrames ) and "MissingRaidBuffsListViewSecureButtonTemplate" or "MissingRaidBuffsListViewButtonTemplate"
    return buttons, template
end

function MissingRaidBuffsListViewScrollFrameMixIn:GetButton(i)
    local buttons, template = self:GetButtons()
    local parent = self:GetParent()

    if ( not buttons[i] ) then
        local button = CreateFrame("Button", nil, parent, template)
        button:SetID(i)
        button:SetHeight(BUTTON_HEIGHT)
        button:SetAnchors()
        button:Hide()
        tinsert(buttons, button)
    end

    return buttons[i]
end

function MissingRaidBuffsListViewScrollFrameMixIn:OnSizeChanged()
    -- recalculate number of displayed buttons
    self.numDisplayedButtons = math.floor(self:GetHeight() / (BUTTON_HEIGHT+BUTTON_MARGIN))

    -- hide buttons that are no longer needed
    local buttons = self:GetButtons()
    if ( #buttons > self.numDisplayedButtons ) then
        for i = self.numDisplayedButtons, #buttons, 1 do
            buttons[i]:Hide()
        end
    end

    self:Update()
end

function MissingRaidBuffsListViewScrollFrameMixIn:Update()
    if ( not initialized ) then
        return
    end

    local parent = self:GetParent()
    local scrollBar = FauxScrollFrame_GetChildFrames(self)

    showHideFrame()
    MissingRaidBuffsListView.ScrollFrame.auraTexturePool:ReleaseAll()
    if ( parent:IsShown() ) then
        local numItems = #orderedPlayersWithMissingBuffs
        local numButtons = #self:GetButtons()
        FauxScrollFrame_Update(self, numItems, self.numDisplayedButtons, BUTTON_HEIGHT+BUTTON_MARGIN)

        local offset = FauxScrollFrame_GetOffset(self)
        for i = 1, self.numDisplayedButtons do
            local index = i + offset
            if ( index <= numItems ) then
                local button = self:GetButton(i)
                button:SetPlayerBuffs(orderedPlayersWithMissingBuffs[index].key, orderedPlayersWithMissingBuffs[index].value)
                button:SetAnchors()
                if ( scrollBar:IsVisible() ) then
                    button:SetPoint("Right", scrollBar, "LEFT")
                end
                button:Show()
            elseif ( index <= numButtons ) then
                local button = self:GetButton(i)
                button:Hide()
            end
        end

        parent.QuickSelect:Update()
    end
end


---------------------------------------------
-- INITIALIZE
---------------------------------------------
MRB.RegisterCallback(MODULE_NAME, "initialize", function()
    initialized = true

    -- Receive healthstone updates
    MRB.Model.RegisterCallback(MODULE_NAME, "updatedModel", handleModelUpdate)

    -- Recieve group updates
    MRB.RegisterEvent(MODULE_NAME, "GROUP_ROSTER_UPDATE", showHideFrame)

    -- Receive combat updates
    MRB.RegisterEvent(MODULE_NAME, "PLAYER_REGEN_DISABLED", handleStartEndCombat)
    MRB.RegisterEvent(MODULE_NAME, "PLAYER_REGEN_ENABLED", handleStartEndCombat)

    -- Receive options updates
    C.RegisterListener(MODULE_NAME, "Show", handleOptionsChanged)
    C.RegisterListener(MODULE_NAME, "Locked", handleOptionsChanged)
    C.RegisterListener(MODULE_NAME, "HideWhenEmpty", handleOptionsChanged)
    C.RegisterListener(MODULE_NAME, "HideWhenInCombat", handleOptionsChanged)
    C.RegisterListener(MODULE_NAME, "HideWhenNotInGroup", handleOptionsChanged)

    C.RegisterListener(MODULE_NAME, "FilterGroupSize", handleModelUpdate)
    C.RegisterListener(MODULE_NAME, "ShowAllGroups", handleModelUpdate)
    C.RegisterListener(MODULE_NAME, "GroupAssignments/group1", handleModelUpdate)
    C.RegisterListener(MODULE_NAME, "GroupAssignments/group2", handleModelUpdate)
    C.RegisterListener(MODULE_NAME, "GroupAssignments/group3", handleModelUpdate)
    C.RegisterListener(MODULE_NAME, "GroupAssignments/group4", handleModelUpdate)
    C.RegisterListener(MODULE_NAME, "GroupAssignments/group5", handleModelUpdate)
    C.RegisterListener(MODULE_NAME, "GroupAssignments/group6", handleModelUpdate)
    C.RegisterListener(MODULE_NAME, "GroupAssignments/group7", handleModelUpdate)
    C.RegisterListener(MODULE_NAME, "GroupAssignments/group8", handleModelUpdate)
    handleOptionsChanged("Locked", C:is("Locked"))
end)
