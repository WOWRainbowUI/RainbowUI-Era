local localAddonName, Addon = ...
local EngraverDisplayModes = Addon.EngraverDisplayModes 

-- Slash Commands
SLASH_ENGRAVER1, SLASH_ENGRAVER2, SLASH_ENGRAVER3, SLASH_ENGRAVER4, SLASH_ENGRAVER5, SLASH_ENGRAVER6, SLASH_ENGRAVER7 = "/en", "/eng", "/eg", "/re", "/engrave", "/engraver", "/engraving"
SlashCmdList.ENGRAVER = function(msg, editBox)
	Settings.OpenToCategory("符文");
end

EngraverOptions = {} -- SavedVariable
EngraverOptionsCallbackRegistry = CreateFromMixins(CallbackRegistryMixin)
EngraverOptionsCallbackRegistry:OnLoad()
EngraverOptionsCallbackRegistry:SetUndefinedEventsAllowed(true)

local EngraverDisplayModes = {
	{ text = "全部顯示", mixin = EngraverCategoryFrameShowAllMixin },
	{ text = "彈出選單", mixin = EngraverCategoryFramePopUpMenuMixin }
}
Addon.EngraverDisplayModes = EngraverDisplayModes
Addon.GetCurrentDisplayMode = function() return EngraverDisplayModes[EngraverOptions.DisplayMode+1] end

local ENGRAVER_SHOW_HIDE = "顯示/隱藏一鍵符文" -- TODO localization
_G.BINDING_NAME_ENGRAVER_SHOW_HIDE = ENGRAVER_SHOW_HIDE

Addon.EngraverVisibilityModes = {
	["ShowAlways"] = { text = "總是顯示", tooltip = "永遠都能看見一鍵符文。" },
	["HideInCombat"] = { text = "戰鬥中隱藏", tooltip = "戰鬥開始/結束時隱藏/顯示。" },
	["SyncCharacterPane"] = { text = "與角色面板同步", tooltip = "打開/關閉角色面板時顯示/隱藏。" },
	["ToggleKeybind"] = { text = "切換快速鍵", tooltip = string.format("按下 %q 的按鍵綁定時切換顯示。", ENGRAVER_SHOW_HIDE) },
	["HoldKeybind"] = { text = "按住快速鍵", tooltip = string.format("只有按住不放 %q 的按鍵綁定時才顯示。", ENGRAVER_SHOW_HIDE) },
}

local DefaultEngraverOptions = {
	DisplayMode = 1,
	LayoutDirection = 0,
	VisibilityMode = "ShowAlways",
	HideTooltip = false,
	HideDragTab = false,
	ShowFilterSelector = false,
	HideSlotLabels = false,
	EnableRightClickDrag = false,
	UIScale = 1.0,
	CurrentFilter = 0
}

EngraverOptionsFrameMixin = {}

function EngraverOptionsFrameMixin:OnLoad()
	self:RegisterEvent("ADDON_LOADED")
	self.name = localAddonName
	self.category, self.layout = Settings.RegisterCanvasLayoutCategory(self, "符文", localAddonName);
	self.category.ID = localAddonName
	Settings.RegisterAddOnCategory(self.category);
	self:InitSettingsList()
	self:CreateSettingsInitializers()
	self.settingsList:Display(self.initializers);
end

function EngraverOptionsFrameMixin:InitSettingsList()
	self.settingsList.Header.Title:SetText("一鍵符文");	
	self.settingsList.Header.DefaultsButton.Text:SetText(SETTINGS_DEFAULTS);
	self.settingsList.Header.DefaultsButton:SetScript("OnClick", function(button, buttonName, down)
		ShowAppropriateDialog("GAME_SETTINGS_APPLY_DEFAULTS");
	end);
	self.settingsList.Header.KeybindsButton = CreateFrame("Button", nil, self.settingsList.Header, "EngraverKeybindsButtonTemplate")
	self.settingsList.ScrollBox:SetScript("OnMouseWheel", function(scrollBox, delta)
		if not KeybindListener:OnForwardMouseWheel(delta) then
			ScrollControllerMixin.OnMouseWheel(scrollBox, delta);
		end
	end);
	self.settingsList:Show();
end

local function AddEngraverOptionsSetting(self, variable, name, varType)
	local setting = Settings.RegisterAddOnSetting(self.category, name, variable, varType, DefaultEngraverOptions[variable]);
	self.engraverOptionsSettings[variable] = setting
	Settings.SetOnValueChangedCallback(variable, function (_, _, newValue, ...)
		EngraverOptions[variable] = newValue;
		EngraverOptionsCallbackRegistry:TriggerEvent(variable, newValue)
	end, self)
	return setting
end

local function AddInitializer(self, initializer)
	if initializer then	
		table.insert(self.initializers, initializer);
		if initializer.GetName then
			initializer:AddSearchTags(initializer:GetName():gmatch("%S+"))
		end
	end
end

function EngraverOptionsFrameMixin:CreateSettingsInitializers()
	self.engraverOptionsSettings = {}
	self.initializers = {}
	do -- DisplayMode
		local variable, name, tooltip = "DisplayMode", "符文顯示方式", "符文按鈕要如何呈現。";
		local tooltips = { "總是顯示符文。", "每個可銘刻的裝備部位只顯示一個按鈕，將游標移至按鈕上查看可用的符文。" }
		local setting = AddEngraverOptionsSetting(self, variable, name, Settings.VarType.Number)
		local options = function()
			local container = Settings.CreateControlTextContainer();
			for i, displayMode in ipairs(Addon.EngraverDisplayModes) do
				container:Add(i-1, displayMode.text, tooltips[i]);
			end
			return container:GetData();
		end
		AddInitializer(self, Settings.CreateDropDownInitializer(setting, options, tooltip))
	end -- DisplayMode
	do -- LayoutDirection
		local variable, name, tooltip = "LayoutDirection", "版面方向", "符文按鈕要朝哪個方向展開。";
		local setting = AddEngraverOptionsSetting(self, variable, name, Settings.VarType.Number)
		local options = function()
			local container = Settings.CreateControlTextContainer();
			for i, direction in ipairs(Addon.EngraverLayoutDirections) do
				container:Add(i-1, direction.text);
			end
			return container:GetData();
		end
		AddInitializer(self, Settings.CreateDropDownInitializer(setting, options, tooltip))
	end -- LayoutDirection
	do -- VisibilityMode
		local variable, name, tooltip = "VisibilityMode", "何時顯示", "何時要顯示/隱藏一鍵符文。";
		local setting = AddEngraverOptionsSetting(self, variable, name, Settings.VarType.Number)
		local options = function()
			local container = Settings.CreateControlTextContainer();
			for name, mode in pairs(Addon.EngraverVisibilityModes) do
				container:Add(name, mode.text, mode.tooltip);
			end
			return container:GetData();
		end
		AddInitializer(self, Settings.CreateDropDownInitializer(setting, options, tooltip))
	end -- VisibilityMode
	do -- HideTooltip
		AddInitializer(self, Settings.CreateCheckBoxInitializer(AddEngraverOptionsSetting(self, "HideTooltip", "隱藏浮動提示資訊", Settings.VarType.Boolean), nil, "滑鼠指向符文按鈕時不顯示浮動提示資訊。"))
	end -- HideTooltip
	do -- HideDragTab
		local dragTabSetting = AddEngraverOptionsSetting(self, "HideDragTab", "隱藏拖曳標籤頁", Settings.VarType.Boolean)
		local dragTabInitializer = Settings.CreateCheckBoxInitializer(dragTabSetting, nil, "拖曳標籤頁讓你可以用滑鼠拖曳移動一鍵符文的框架。")
		AddInitializer(self, dragTabInitializer)
		do -- ShowFilterSelector
			local setting = AddEngraverOptionsSetting(self, "ShowFilterSelector", "顯示過濾方式", Settings.VarType.Boolean)
			local initializer = Settings.CreateCheckBoxInitializer(setting, nil, "啟用時，拖曳標籤頁會顯示當前的過濾方式。\n標籤頁兩旁的箭頭可以用來切換過濾方式。")
			initializer:SetParentInitializer(dragTabInitializer, function() return not dragTabSetting:GetValue() end)
			initializer.IsParentInitializerInCurrentSettingsCategory = function() return true; end -- forces indent and small font
			AddInitializer(self, initializer)
		end -- ShowFilterSelector
	end -- HideDragTab
	do -- HideSlotLabels
		AddInitializer(self, Settings.CreateCheckBoxInitializer(AddEngraverOptionsSetting(self, "HideSlotLabels", "隱藏欄位文字", Settings.VarType.Boolean)))
	end -- HideSlotLabels
	do -- EnableRightClickDrag
		AddInitializer(self, Settings.CreateCheckBoxInitializer(AddEngraverOptionsSetting(self, "EnableRightClickDrag", "啟用右鍵點擊拖曳", Settings.VarType.Boolean), nil, "可以透過右鍵點擊並按住任何符文按鈕來拖曳框架。"))
	end -- EnableRightClickDrag
	do -- UIScale
		local variable, name, tooltip = "UIScale", "介面縮放", "調整一鍵符文使用介面的縮放大小。";
		local setting = AddEngraverOptionsSetting(self, variable, name, Settings.VarType.Number)
		local options = Settings.CreateSliderOptions(0.01, 2.5, 0.00) -- minValue, maxValue, step 
		options:SetLabelFormatter(MinimalSliderWithSteppersMixin.Label.Right, FormatPercentage);
		AddInitializer(self, Settings.CreateSliderInitializer(setting, options, tooltip))
	end	-- UIScale
	do -- FiltersHeader
		local filtersHeaderData = { 
			name = "過濾方式", 
			tooltipSections = {
				{ 
					header = "建立過濾方式", 
					lines = {
						"按下新增建立新的過濾方式，並且輸入容易辨識的名稱。",
						"選擇過濾方式啟用時要看到的符文，其餘的會隱藏。"
					}
				},
				{ 
					header = "啟用過濾方式", 
					lines = {
						"一次只能啟用一個過濾方式，或不過濾。",
						"當前的過濾方式會在下方的清單中顯示綠色標記。",
						"右鍵點下方清單中的過濾方式來啟用或停用。",
						"也可以使用拖曳標籤頁旁的箭頭來切換當前的過濾方式。 "
					}
				}
			}
		}
		AddInitializer(self, Settings.CreateElementInitializer("SettingsListSectionHeaderWithInfoTemplate", filtersHeaderData));
	end -- FiltersHeader
	do -- FilterEditor
		table.insert(self.initializers, Settings.CreateElementInitializer("EngraverOptionsFilterEditorTemplate", { settings = {} } ));
	end -- FilterEditor
end

function EngraverOptionsFrameMixin:OnEvent(event, ...)
	if event == "ADDON_LOADED" then
		self:HandleAddonLoaded(...)
	end
end

function EngraverOptionsFrameMixin:HandleAddonLoaded(addonName)
	if addonName == localAddonName then
		self:SetOptionsToDefault(false)
	end
end

function EngraverOptionsFrameMixin:OnDefault()
	EngraverOptions = {}
	self:SetOptionsToDefault(true)
end

function EngraverOptionsFrameMixin:SetOptionsToDefault(force)
	EngraverOptions = EngraverOptions or {}
	for k, v in pairs(DefaultEngraverOptions) do
		if force or EngraverOptions[k] == nil then
			if type(v) == "table" then 
				-- TODO recursive deep copy?
			end
			EngraverOptions[k] = v
		end
	end
end

function EngraverOptionsFrameMixin:OnRefresh()
	if self.engraverOptionsSettings then
		for variable, setting in pairs(self.engraverOptionsSettings) do
			if setting.SetValue then
				setting:SetValue(EngraverOptions[variable])
			end
		end
	end
end

---------------------------------------
-- SettingsListSectionHeaderWithInfo --
---------------------------------------

SettingsListSectionHeaderWithInfoMixin = CreateFromMixins(SettingsListSectionHeaderMixin)

function SettingsListSectionHeaderWithInfoMixin:Init(initializer)
	SettingsListSectionHeaderMixin.Init(self, initializer)
	self.TooltipSections = initializer:GetData().tooltipSections
end

function SettingsListSectionHeaderInfoButton_OnEnter(self)
	SettingsTooltip:SetOwner(self, "ANCHOR_RIGHT",-22,-22);
	local sections = self:GetParent().TooltipSections
	for i, section in ipairs(sections) do
		GameTooltip_AddHighlightLine(SettingsTooltip, section.header);
		for _, line in ipairs(section.lines) do
			GameTooltip_AddNormalLine(SettingsTooltip, line);
		end
		if i < #sections then
			GameTooltip_AddBlankLinesToTooltip(SettingsTooltip, 1)
		end
	end
	SettingsTooltip:Show();
end
