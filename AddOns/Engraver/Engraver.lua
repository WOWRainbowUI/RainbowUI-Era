local addonName, Addon = ...

EngraverFrameMixin = {};
EngraverCategoryFrameBaseMixin = {};
EngraverCategoryFrameShowAllMixin = {}
EngraverCategoryFramePopUpMenuMixin = {}
EngraverRuneButtonMixin = {}
EngraverNoRunesFrameMixin = {};

local EngraverDisplayModes = {
	{ text = "顯示全部", mixin = EngraverCategoryFrameShowAllMixin },
	{ text = "彈出選單", mixin = EngraverCategoryFramePopUpMenuMixin }
}
Addon.EngraverDisplayModes = EngraverDisplayModes
Addon.GetCurrentDisplayMode = function() return EngraverDisplayModes[EngraverOptions.DisplayMode+1] end

local EngraverLayoutDirections = {
	{ text = "左到右", categoryPoint = "TOPLEFT", categoryRelativePoint = "BOTTOMLEFT", runePoint = "LEFT", runeRelativePoint = "RIGHT" },
	{ text = "上到下", categoryPoint = "TOPLEFT", categoryRelativePoint = "TOPRIGHT", runePoint = "TOP", runeRelativePoint = "BOTTOM" },
	{ text = "右到左", categoryPoint = "TOPLEFT", categoryRelativePoint = "BOTTOMLEFT", runePoint = "RIGHT", runeRelativePoint = "LEFT" },
	{ text = "下到上", categoryPoint = "TOPLEFT", categoryRelativePoint = "TOPRIGHT", runePoint = "BOTTOM", runeRelativePoint = "TOP" }
}
Addon.EngraverLayoutDirections = EngraverLayoutDirections
Addon.GetCurrentLayoutDirection = function() return EngraverLayoutDirections[EngraverOptions.LayoutDirection+1] end

-------------------
-- EngraverFrame --
-------------------

function EngraverFrameMixin:OnLoad()
	self.categoryFramePool = CreateFramePool("Frame", self, "EngraverCategoryFrameTemplate",  function(framePool, frame)
		FramePool_HideAndClearAnchors(framePool, frame);
	end);
	self:RegisterEvent("PLAYER_ENTERING_WORLD");
	self:RegisterEvent("RUNE_UPDATED");
	self:RegisterEvent("PLAYER_EQUIPMENT_CHANGED");
	self:RegisterEvent("UPDATE_INVENTORY_ALERTS");
	self:RegisterEvent("NEW_RECIPE_LEARNED");
	self:RegisterEvent("PLAYER_REGEN_ENABLED");
	self:RegisterForDrag("RightButton")
end

function EngraverFrameMixin:OnEvent(event, ...)
	if (event == "PLAYER_ENTERING_WORLD") then
		self:Initialize()
	elseif (event == "RUNE_UPDATED") then
		local engravingData = select(1, ...)
		if engravingData then
			self:UpdateCategory(engravingData.equipmentSlot)
		end
	elseif (event == "NEW_RECIPE_LEARNED") then
		self:LoadCategories()
		self:UpdateLayout()
	elseif (event == "PLAYER_EQUIPMENT_CHANGED") then
		self:UpdateCategory(...)
	elseif (event == "UPDATE_INVENTORY_ALERTS") then
		self:UpdateLayout()
	elseif (event == "PLAYER_REGEN_ENABLED") then
		-- Update after leaving combat lockdown in case settings changed during combat
		self:UpdateLayout()
	end
end

function EngraverFrameMixin:Initialize()
	self.equipmentSlotFrameMap = {}
	self:RegisterOptionChangedCallbacks()
	self:LoadCategories()
	self:UpdateLayout()
end

function EngraverFrameMixin:RegisterOptionChangedCallbacks()
	function register(optionName, callback)
		EngraverOptions:RegisterCallback(optionName, function(_, newValue) if not InCombatLockdown() then callback(self, newValue) end end, self)
	end
	register("UIScale", self.SetScale)
	register("DisplayMode", self.UpdateLayout)
	register("LayoutDirection", self.UpdateLayout)
	register("HideDragTab", self.UpdateLayout)
end
	
function EngraverFrameMixin:LoadCategories()
	self:ResetCategories()
	C_Engraving.RefreshRunesList();
	local categories = C_Engraving.GetRuneCategories(true, true);
	if #categories > 0 then
		for c, category in ipairs(categories) do
			local categoryFrame = self.categoryFramePool:Acquire()
			categoryFrame:Show()
			self.equipmentSlotFrameMap[category] = categoryFrame
			categoryFrame:SetCategory(category)
			categoryFrame:SetDisplayMode(Addon.GetCurrentDisplayMode().mixin)
		end
		self.noRunesFrame:Hide();
	else
		self.noRunesFrame:Show();
	end
end

function EngraverFrameMixin:ResetCategories()
	for categoryFrame in self.categoryFramePool:EnumerateActive() do
		if categoryFrame.TearDownDisplayMode then
			categoryFrame:TearDownDisplayMode()
		end
	end
	self.categoryFramePool:ReleaseAll()
end

function EngraverFrameMixin:UpdateCategory(equipmentSlot)
	if self.equipmentSlotFrameMap then
		local categoryFrame = self.equipmentSlotFrameMap[equipmentSlot]
		if categoryFrame and categoryFrame.UpdateCategoryLayout then
			categoryFrame:UpdateCategoryLayout()
		end
	end
end

function EngraverFrameMixin:UpdateLayout(...)
	if not InCombatLockdown() then
		self:SetScale(EngraverOptions.UIScale or 1.0)
		if self.equipmentSlotFrameMap then
			local layoutDirection = Addon.GetCurrentLayoutDirection()
			local displayMode = Addon.GetCurrentDisplayMode()
			local prevCategoryFrame = nil
			for category, categoryFrame in pairs(self.equipmentSlotFrameMap) do
				if categoryFrame then
					categoryFrame:SetDisplayMode(displayMode.mixin)
					if prevCategoryFrame == nil then
						categoryFrame:SetPoint(layoutDirection.categoryPoint)
					else
						categoryFrame:SetPoint(layoutDirection.categoryPoint, prevCategoryFrame, layoutDirection.categoryRelativePoint)
					end
					if categoryFrame.UpdateCategoryLayout then
						categoryFrame:UpdateCategoryLayout()
					end
					prevCategoryFrame = categoryFrame
				end
			end
		end
		if self.dragTab then
			self.dragTab:SetShown(not EngraverOptions.HideDragTab);
		end
	end
end

-----------------------
-- CategoryFrameBase --
-----------------------

function EngraverCategoryFrameBaseMixin:OnLoad()
	self.runeButtonPool = CreateFramePool("Button", self, "EngraverRuneButtonTemplate")
	self.runeButtons = {}
end

function EngraverCategoryFrameBaseMixin:SetCategory(category)
	self.category = category
	local runes = C_Engraving.GetRunesForCategory(category, false);
	local knownRunes = C_Engraving.GetRunesForCategory(category, true);
	self.runeButtonPool:ReleaseAll()
	for r, rune in ipairs(runes) do
		local runeButton = self.runeButtonPool:Acquire()
		self.runeButtons[r] = runeButton
		local isKnown = self:IsRuneKnown(rune, knownRunes)
		runeButton:SetRune(rune, category, isKnown)
	end
	self:LoadEmptyRuneButton(category)
end

function EngraverCategoryFrameBaseMixin:LoadEmptyRuneButton(slotId)
	if self.emptyRuneButton then
		-- TODO figure out how to get slotName from slotId using API or maybe a constant somewhere
		local tempSlotsMap = {
			[INVSLOT_CHEST] = "CHESTSLOT",
			[INVSLOT_LEGS] = "LEGSSLOT",
			[INVSLOT_HAND] = "HANDSSLOT"
		}
		local slotName = tempSlotsMap[slotId]
		local id, textureName, checkRelic = GetInventorySlotInfo(slotName);
		self:SetID(id);
		self.emptyRuneButton.icon:SetTexture(textureName);
	end
end

function EngraverCategoryFrameBaseMixin:IsRuneKnown(runeToCheck, knownRunes)
	for r, rune in ipairs(knownRunes) do
		if rune.skillLineAbilityID == runeToCheck.skillLineAbilityID then
			return true
		end
	end
end

function EngraverCategoryFrameBaseMixin:GetRuneButton(skillLineAbilityID)
	if self.runeButtons then
		for r, runeButton in ipairs(self.runeButtons) do
			if runeButton.skillLineAbilityID == skillLineAbilityID then
				return runeButton
			end
		end
	end
end

function EngraverCategoryFrameBaseMixin:UpdateCategoryLayout()
	self:DetermineActiveAndInactiveButtons()
	if self.activeButton then
		local isBroken = GetInventoryItemBroken("player", self.category)
		self.activeButton:SetBlinking(isBroken, 1.0, 0.0, 0.0)
	end
	if self.UpdateCategoryLayoutImpl then
		self:UpdateCategoryLayoutImpl() -- implemented by "subclasses"/mixins
	end
end

function EngraverCategoryFrameBaseMixin:DetermineActiveAndInactiveButtons()
	self.activeButton = nil
	self.inactiveButtons = {}
	if self.runeButtons then
		for r, runeButton in ipairs(self.runeButtons) do
			if C_Engraving.IsRuneEquipped(runeButton.skillLineAbilityID) then
				self.activeButton = runeButton
			else
				table.insert(self.inactiveButtons, runeButton)
			end
		end
	end
end

function EngraverCategoryFrameBaseMixin:SetDisplayMode(displayModeMixin)
	if self.TearDownDisplayMode then
		self:TearDownDisplayMode()
	end
	Mixin(self, displayModeMixin)
	if self.SetUpDisplayMode then
		self:SetUpDisplayMode()
	end
end

--------------------------
-- CategoryFrameShowAll --
--------------------------

function EngraverCategoryFrameShowAllMixin:UpdateCategoryLayoutImpl()
	-- update position of each button and highlight the active one
	if self.runeButtons then
		for r, runeButton in ipairs(self.runeButtons) do
			runeButton:ClearAllPoints()
		end
		for r, runeButton in ipairs(self.runeButtons) do
			runeButton:SetShown(true)
			runeButton:SetHighlighted(false)
			if r == 1 then
				runeButton:SetAllPoints()
			else
				local LayoutDirection = Addon.GetCurrentLayoutDirection()
				runeButton:SetPoint(LayoutDirection.runePoint, self.runeButtons[r-1], LayoutDirection.runeRelativePoint)
			end
			if self.activeButton == nil then
				runeButton:SetBlinking(runeButton.isKnown)
			end
		end
		if self.activeButton and not self.activeButton.isBlinking then
			self.activeButton:SetHighlighted(true)
		end
	end
end

function EngraverCategoryFrameShowAllMixin:SetUpDisplayMode()
	-- do nothing for now
end

function EngraverCategoryFrameShowAllMixin:TearDownDisplayMode()
	if self.runeButtons then
		for r, runeButton in ipairs(self.runeButtons) do
			runeButton:SetHighlighted(false)
			runeButton:ResetColors();
			runeButton:SetBlinking(false)
		end
	end
end

----------------------------
-- CategoryFramePopUpMenu --
----------------------------

function EngraverCategoryFramePopUpMenuMixin:UpdateCategoryLayoutImpl()
	-- update visibility and position of each button
	if self.emptyRuneButton then
		self.emptyRuneButton:Hide()
	end
	if self.runeButtons then
		local showInactives = self:IsMouseOverAnyButtons()
		self.activeButton = self.activeButton or self.emptyRuneButton
		for r, runeButton in ipairs(self.runeButtons) do
			runeButton:ClearAllPoints()
		end
		if self.activeButton then
			self.activeButton:SetShown(true)
			self.activeButton:SetAllPoints()
			if self.inactiveButtons then
				local prevButton = self.activeButton
				for r, runeButton in ipairs(self.inactiveButtons) do
					runeButton:SetShown(showInactives)
					runeButton:ClearAllPoints()
					local LayoutDirection = Addon.GetCurrentLayoutDirection()
					runeButton:SetPoint(LayoutDirection.runePoint, prevButton, LayoutDirection.runeRelativePoint)
					prevButton = runeButton
				end
			end
		end
	end
end

function EngraverCategoryFramePopUpMenuMixin:SetUpDisplayMode()
	if self.emptyRuneButton then
		self.emptyRuneButton:RegisterCallback("PostOnEnter", self.OnRuneButtonPostEnter, self)
		self.emptyRuneButton:RegisterCallback("PostOnLeave", self.OnRuneButtonPostLeave, self)
	end
	if self.runeButtons then
		for r, runeButton in ipairs(self.runeButtons) do
			runeButton:RegisterCallback("PostOnEnter", self.OnRuneButtonPostEnter, self)
			runeButton:RegisterCallback("PostOnLeave", self.OnRuneButtonPostLeave, self)
		end
	end
end

function EngraverCategoryFramePopUpMenuMixin:TearDownDisplayMode()
	if self.emptyRuneButton then
		self.emptyRuneButton:UnregisterCallback("PostOnEnter", self)
		self.emptyRuneButton:UnregisterCallback("PostOnLeave", self)
		self.emptyRuneButton:Hide()
	end
	if self.runeButtons then
		for r, runeButton in ipairs(self.runeButtons) do
			runeButton:UnregisterCallback("PostOnEnter", self)
			runeButton:UnregisterCallback("PostOnLeave", self)
		end
	end
end

function EngraverCategoryFramePopUpMenuMixin:OnRuneButtonPostEnter()
	self:SetInactiveButtonsShown(true) 
end

function EngraverCategoryFramePopUpMenuMixin:OnRuneButtonPostLeave()
	self:SetInactiveButtonsShown(self:IsMouseOverAnyButtons())
end

function EngraverCategoryFramePopUpMenuMixin:IsMouseOverAnyButtons()
	if self.emptyRuneButton and self.emptyRuneButton:IsMouseOver() then
		return true
	end
	if self.runeButtons then
		for r, runeButton in ipairs(self.runeButtons) do
			if runeButton:IsMouseOver() then
				return true
			end
		end
	end
	return false
end

function EngraverCategoryFramePopUpMenuMixin:SetInactiveButtonsShown(isShown)
	if not InCombatLockdown() then
		for r, runeButton in ipairs(self.inactiveButtons) do
			runeButton:SetShown(isShown)
		end
	end
end

----------------
-- RuneButton --
----------------

function EngraverRuneButtonMixin:OnLoad()
	self.Border:SetVertexColor(0.0, 1.0, 0.0);
	Mixin(self, CallbackRegistryMixin);
	self:SetUndefinedEventsAllowed(true)
	self:OnLoad() -- NOTE not an infinite loop because mixing in CallbackRegistryMixin redefines OnLoad
end

function EngraverRuneButtonMixin:SetRune(rune, category, isKnown)
	self.category = category
	self.icon:SetTexture(rune.iconTexture);
	self.tooltipName = rune.name;
	self.skillLineAbilityID = rune.skillLineAbilityID;
	self.isKnown = isKnown;
	self:RegisterForClicks("LeftButtonUp", "RightButtonDown", "RightButtonUp")
	if self.icon then
		self.icon:SetAllPoints()
	end
	self:ResetColors()
end

function EngraverRuneButtonMixin:ResetColors()
	self.SpellHighlightTexture:SetVertexColor(1.0, 1.0, 1.0);
	if self.isKnown then
		self.icon:SetVertexColor(1.0, 1.0, 1.0);
		self.NormalTexture:SetVertexColor(1.0, 1.0, 1.0);
	else
		self.icon:SetVertexColor(0.2, 0.0, 0.0);
		self.NormalTexture:SetVertexColor(0.2, 0.0, 0.0);
	end
end

function EngraverRuneButtonMixin:OnClick()
	local buttonClicked = GetMouseButtonClicked();
	if buttonClicked == "LeftButton" then
		self:TryEngrave()
	elseif buttonClicked  == "RightButton" and EngraverOptions.EnableRightClickDrag then
		if IsKeyDown(buttonClicked) then
			EngraverFrame:StartMoving()
		else
			EngraverFrame:StopMovingOrSizing()
		end
	end
end

-- TODO find this mapping a different way
local CharacterSlotButtons = {}
CharacterSlotButtons[INVSLOT_CHEST] = CharacterChestSlot
CharacterSlotButtons[INVSLOT_LEGS] = CharacterLegsSlot
CharacterSlotButtons[INVSLOT_HAND] = CharacterHandsSlot

function EngraverRuneButtonMixin:TryEngrave()
	if self.category and self.skillLineAbilityID and not InCombatLockdown() then
		local characterSlotButton = CharacterSlotButtons[self.category]
		if characterSlotButton then
			local itemId, unknown = GetInventoryItemID("player", self.category)
			if itemId then
				ClearCursor()
				C_Engraving.CastRune(self.skillLineAbilityID);
				characterSlotButton:Click(); 
				StaticPopup1Button1:Click(); -- will it always be StaticPopup1?
				ClearCursor()
			else
				UIErrorsFrame:AddExternalErrorMessage("Cannot engrave rune, equipment slot is empty!")
			end
		end
	end
end

function EngraverRuneButtonMixin:SetHighlighted(isHighlighted)
	if self.isKnown then
		if ( isHighlighted ) then
			self.Border:SetShown(true)
			self.icon:SetVertexColor(1.0, 1.0, 1.0)
			self.NormalTexture:SetVertexColor(1.0, 1.0, 1.0);
		else
			self.Border:SetShown(false)
			self.icon:SetVertexColor(0.5, 0.5, 0.5)
			self.NormalTexture:SetVertexColor(0.5, 0.5, 0.5);
		end
	end
end

function EngraverRuneButtonMixin:SetBlinking(isBlinking, r, g, b)
	self.isBlinking = isBlinking
	self.SpellHighlightTexture:SetVertexColor(r or 1.0, g or 1.0, b or 1.0)
	SharedActionButton_RefreshSpellHighlight(self, isBlinking)
end

function EngraverRuneButtonMixin:OnEnter()
	if self.skillLineAbilityID and EngraverOptions.HideTooltip ~= true then
		GameTooltip:SetOwner(self, "ANCHOR_RIGHT");
		GameTooltip:SetEngravingRune(self.skillLineAbilityID);
		self.showingTooltip = true;
		GameTooltip:Show();
	end
	self:TriggerEvent("PostOnEnter")
end

function EngraverRuneButtonMixin:OnLeave()
	GameTooltip_Hide();
	self.showingTooltip = false;
	self:TriggerEvent("PostOnLeave")
end

-------------
-- DragTab --
-------------

EngraverDragTabMixin = {}

function EngraverDragTabMixin:OnMouseDown(button)
	if button == "RightButton" then
		Settings.OpenToCategory(addonName);
	elseif button == "LeftButton" then
		local parent = self:GetParent()
		if parent and parent.StartMoving then
			parent:StartMoving();
		end
	end
end

function EngraverDragTabMixin:OnMouseUp(button)
	local parent = self:GetParent()
	if parent and parent.StopMovingOrSizing then
		parent:StopMovingOrSizing();
	end
end
