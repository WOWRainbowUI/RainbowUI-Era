-------------------------------------------------------------------------------
-- Title: Mik's Scrolling Battle Text Traditional Chinese Localization
-- Author: Mikord
-- Traditional Chinese Translation by: 世界之樹-Myth, yleaf(yaroot@gmail.com)
-------------------------------------------------------------------------------

-- Don't do anything if the locale isn't Traditional Chinese.
if (GetLocale() ~= "zhTW") then return end

-- Local reference for faster access.
local L = MikSBT.translations

-------------------------------------------------------------------------------
-- Traditional Chinese localization
-------------------------------------------------------------------------------

------------------------------
-- Fonts
------------------------------

L.FONT_FILES["MSBT bLEI00D"] = "Fonts\\bLEI00D.TTF"

L.DEFAULT_FONT_NAME = "MSBT bLEI00D"

L.MSBT_MSBT = "戰鬥-捲動文字"
L.MSBT_OPENOPTION = " 開啟捲動戰鬥文字設定"


------------------------------
-- Commands
------------------------------

L.COMMAND_USAGE = {
 "使用方法: " .. MikSBT.COMMAND .. " <指令> [參數]",
 " 指令:",
 "  " .. L.COMMAND_RESET .. " - 重置",
 "  " .. L.COMMAND_DISABLE .. " - 停用",
 "  " .. L.COMMAND_ENABLE .. " - 啟用",
 "  " .. L.COMMAND_SHOWVER .. " - 顯示目前版本",
 "  " .. L.COMMAND_HELP .. " - 說明",
}


------------------------------
-- Output messages
------------------------------

L.MSG_DISABLE				= "停用插件."
L.MSG_ENABLE				= "啟用插件."
L.MSG_PROFILE_RESET			= "重置設定"
L.MSG_HITS					= "擊中"
L.MSG_CRIT					= "爆擊"
L.MSG_CRITS					= "爆擊"
L.MSG_MULTIPLE_TARGETS		= "多數目標"
L.MSG_READY_NOW				= "準備完畢"


------------------------------
-- Scroll area names
------------------------------

L.MSG_INCOMING			= "承受傷害"
L.MSG_OUTGOING			= "輸出傷害"
L.MSG_NOTIFICATION		= "通知訊息"
L.MSG_STATIC			= "靜態訊息"


---------------------------------------
-- Master profile event output messages
---------------------------------------

L.MSG_COMBAT					= "戰鬥"
L.MSG_DISPEL					= "驅散魔法"
L.MSG_CHI_FULL					= "滿真氣"
L.MSG_AC						= "祕法充能"
L.MSG_AC_FULL					= "滿祕法充能"
L.MSG_CP						= "連擊點"
L.MSG_CP_FULL					= "終結技"
L.MSG_HOLY_POWER_FULL			= "滿聖能"
L.MSG_SHADOW_ORBS_FULL			= "滿暗影寶珠"
L.MSG_ESSENCE				= "龍能"
L.MSG_ESSENCE_FULL			= "滿龍能"
L.MSG_KILLING_BLOW				= "擊殺"
L.MSG_TRIGGER_LOW_HEALTH		= "生命值偏低"
L.MSG_TRIGGER_LOW_MANA			= "法力值偏低"
L.MSG_TRIGGER_LOW_PET_HEALTH	= "寵物生命偏低"
