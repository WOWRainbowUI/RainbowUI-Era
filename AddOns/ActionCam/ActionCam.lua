
local function eventHandler(self,event,...)
	SetCVar("CameraKeepCharacterCentered", 0)
	SetCVar("test_cameraDynamicPitch", 1)
	SetCVar("test_cameraDynamicPitchBaseFovPad", 0.5) -- 上下偏移距離
end

local frame = CreateFrame("Frame","ActionCamCVarSet")
frame:RegisterEvent("PLAYER_ENTERING_WORLD")
frame:SetScript("OnEvent",eventHandler)


local EventFrame = CreateFrame("Frame")
EventFrame:RegisterEvent("PLAYER_LOGIN")
EventFrame:SetScript("OnEvent", function(self,event,...)
	-- 取消動感鏡頭的確認視窗
	UIParent:UnregisterEvent("EXPERIMENTAL_CVAR_CONFIRMATION_NEEDED")
	SetCVar("CameraKeepCharacterCentered", 0)
	SetCVar("test_cameraDynamicPitch", 1)
	SetCVar("test_cameraDynamicPitchBaseFovPad", 0.5) -- 上下偏移距離
end)