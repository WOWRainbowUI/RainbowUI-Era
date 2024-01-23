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
	self.settingsList.ScrollBox:SetScript("OnMouseWheel", function(scrollBox, delta)
		if not KeybindListener:OnForwardMouseWheel(delta) then
			ScrollControllerMixin.OnMouseWheel(scrollBox, delta);
		end
	end);
	self.settingsList:Show();
end

local DefaultEngraverOptions = {
	DisplayMode = 1,
	LayoutDirection = 0,
	HideTooltip = false,
	HideDragTab = false,
	EnableRightClickDrag = false,
	UIScale = 1.0,
	ShowFilterSelector = false,
	CurrentFilter = 0
}

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
		local variable, name, tooltip = "DisplayMode", "符文顯示方式", "符文顯示方式";
		local setting = AddEngraverOptionsSetting(self, variable, name, Settings.VarType.Number)
		local options = function()
			local container = Settings.CreateControlTextContainer();
			for i, displayMode in ipairs(Addon.EngraverDisplayModes) do
				container:Add(i-1, displayMode.text);
			end
			return container:GetData();
		end
		AddInitializer(self, Settings.CreateDropDownInitializer(setting, options, tooltip))
	end -- DisplayMode
	do -- LayoutDirection
		local variable, name, tooltip = "LayoutDirection", "版面方向", "版面方向";
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
	do -- HideTooltip
		AddInitializer(self, Settings.CreateCheckBoxInitializer(AddEngraverOptionsSetting(self, "HideTooltip", "隱藏浮動提示資訊", Settings.VarType.Boolean), nil, "滑鼠指向符文按鈕時不顯示浮動提示資訊。"))
	end -- HideTooltip
	do -- HideDragTab
		AddInitializer(self, Settings.CreateCheckBoxInitializer(AddEngraverOptionsSetting(self, "HideDragTab", "隱藏拖曳標籤頁", Settings.VarType.Boolean), nil, "不顯示拖曳一鍵符文的標籤頁。"))
	end -- HideDragTab
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
	do -- ShowFilterSelector
		AddInitializer(self, Settings.CreateCheckBoxInitializer(AddEngraverOptionsSetting(self, "ShowFilterSelector", "顯示過濾方式", Settings.VarType.Boolean), nil, "顯示選擇過濾方式的箭頭。"))
	end -- ShowFilterSelector
	AddInitializer(self, CreateSettingsListSectionHeaderInitializer("過濾方式"));
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
