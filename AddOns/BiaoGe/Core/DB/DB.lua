local AddonName, ADDONSELF = ...

local L = ADDONSELF.L

local pt = print

local RR = "|r"
ADDONSELF.RR = RR
local NN = "\n"
ADDONSELF.NN = NN
local RN = "|r\n"
ADDONSELF.RN = RN

local LibBG = LibStub:GetLibrary("LibUIDropDownMenu-4.0") -- 调用库菜单UI
ADDONSELF.LibBG = LibBG

C_ChatInfo.RegisterAddonMessagePrefix("BiaoGe")                                                            -- 注册插件通信频道
C_ChatInfo.RegisterAddonMessagePrefix("BiaoGeYY")                                                          -- 注册插件通信频道（用于YY评价）

BiaoGeFilterTooltip = CreateFrame("GameTooltip", "BiaoGeFilterTooltip", UIParent, "GameTooltipTemplate")   -- 用于收集提示工具文字
BiaoGeFilterTooltip2 = CreateFrame("GameTooltip", "BiaoGeFilterTooltip2", UIParent, "GameTooltipTemplate") -- 用于收集提示工具文字

local l = GetLocale()
if (l == "koKR") then
    BIAOGE_TEXT_FONT = "Fonts\\2002.TTF";
elseif (l == "zhCN") then
    BIAOGE_TEXT_FONT = "Fonts\\ARKai_T.ttf";
elseif (l == "zhTW") then
    BIAOGE_TEXT_FONT = "Fonts\\ARKai_T.ttf";
    -- BIAOGE_TEXT_FONT = "Fonts\\blei00d.TTF";
elseif (l == "ruRU") then
    BIAOGE_TEXT_FONT = "Fonts\\FRIZQT___CYR.TTF";
else
    BIAOGE_TEXT_FONT = "Fonts\\FRIZQT__.TTF";
end

local function Size(t)
    local s = 0;
    for k, v in pairs(t) do
        if v ~= nil then s = s + 1 end
    end
    return s;
end
local function RGB(hex)
    local red = string.sub(hex, 1, 2)
    local green = string.sub(hex, 3, 4)
    local blue = string.sub(hex, 5, 6)

    red = tonumber(red, 16) / 255
    green = tonumber(green, 16) / 255
    blue = tonumber(blue, 16) / 255
    return red, green, blue
end

-- 全局变量
BG = {}

-- 是否经典旧世版本
function BG.IsVanilla()
    if select(4, GetBuildInfo()) <= 20000 then
        return true
    end
end

local RealmId = GetRealmID()
local player = UnitName("player")
local FB

do
    if BG.IsVanilla() then
        BG.FB1 = "BD"
        BG.BDname = GetRealZoneText(48)
        BG.TheEndBossID = 2891

        BG.FBtable = {
            "BD",
        }
        BG.FBtable2 = {
            { FB = "BD", ID = 48, localName = GetRealZoneText(48) },
        }
        BG.FBIDtable = {
            [48] = "BD", -- 黑暗深渊
        }
    else
        BG.FB1 = "ICC"
        BG.NAXXname = GetRealZoneText(533)
        BG.ULDname = GetRealZoneText(603)
        BG.TOCname = GetRealZoneText(649)
        BG.ICCname = GetRealZoneText(631)
        BG.TheEndBossID = 856

        BG.FBtable = {
            "NAXX",
            "ULD",
            "TOC",
            "ICC",
        }
        BG.FBtable2 = {
            { FB = "NAXX", ID = 533, localName = GetRealZoneText(533) },
            { FB = "ULD", ID = 603, localName = GetRealZoneText(603) },
            { FB = "TOC", ID = 649, localName = GetRealZoneText(649) },
            { FB = "ICC", ID = 631, localName = GetRealZoneText(631) },
        }
        BG.FBIDtable = {
            [533] = "NAXX", -- 纳克萨玛斯
            [615] = "NAXX", -- 黑曜石圣殿
            [616] = "NAXX", -- 永恒之眼
            [603] = "ULD",  -- 奥杜尔
            [649] = "TOC",  -- 十字军的试炼
            [249] = "TOC",  -- 奥妮克希亚的巢穴
            [631] = "ICC",  -- 冰冠堡垒
            [724] = "ICC",  -- 红玉圣殿
        }
    end
    FB = BG.FBtable

    BG.Movetable = {}
    BG.options = {}
    BG.dropDown = LibBG:Create_UIDropDownMenu(nil, UIParent)

    BG.OnEnterAlpha = 0.1
    BG.HighLightAlpha = 0.2

    BG.ver = ADDONSELF.ver
    BG.instructionsText = ADDONSELF.instructionsText
    BG.upDateText = ADDONSELF.upDateText

    -- 表格
    do
        -- 表格UI
        BG.Frame = {}
        for index, value in ipairs(FB) do
            BG.Frame[value] = {}
            for b = 1, 22 do
                BG.Frame[value]["boss" .. b] = {}
            end
        end

        -- 底色
        BG.FrameDs = {}
        for index, value in ipairs(FB) do
            for i = 1, 3, 1 do
                BG.FrameDs[value .. i] = {}
                for b = 1, 22 do
                    BG.FrameDs[value .. i]["boss" .. b] = {}
                end
            end
        end

        -- 心愿UI
        BG.HopeFrame = {}
        for index, value in ipairs(FB) do
            BG.HopeFrame[value] = {}
            for n = 1, 4 do
                BG.HopeFrame[value]["nandu" .. n] = {}
                for b = 1, 22 do
                    BG.HopeFrame[value]["nandu" .. n]["boss" .. b] = {}
                end
            end
        end

        -- 心愿底色
        BG.HopeFrameDs = {}
        for index, value in ipairs(FB) do
            for t = 1, 3, 1 do
                BG.HopeFrameDs[value .. t] = {}
                for n = 1, 4 do
                    BG.HopeFrameDs[value .. t]["nandu" .. n] = {}
                    for b = 1, 22 do
                        BG.HopeFrameDs[value .. t]["nandu" .. n]["boss" .. b] = {}
                    end
                end
            end
        end

        -- 历史UI
        BG.HistoryFrame = {}
        for index, value in ipairs(FB) do
            BG.HistoryFrame[value] = {}
            for b = 1, 22 do
                BG.HistoryFrame[value]["boss" .. b] = {}
            end
        end

        -- 历史底色
        BG.HistoryFrameDs = {}
        for index, value in ipairs(FB) do
            for i = 1, 3, 1 do
                BG.HistoryFrameDs[value .. i] = {}
                for b = 1, 22 do
                    BG.HistoryFrameDs[value .. i]["boss" .. b] = {}
                end
            end
        end

        -- 接收UI
        BG.ReceiveFrame = {}
        for index, value in ipairs(FB) do
            BG.ReceiveFrame[value] = {}
            for b = 1, 22 do
                BG.ReceiveFrame[value]["boss" .. b] = {}
            end
        end

        -- 接收底色
        BG.ReceiveFrameDs = {}
        for index, value in ipairs(FB) do
            for i = 1, 3, 1 do
                BG.ReceiveFrameDs[value .. i] = {}
                for b = 1, 22 do
                    BG.ReceiveFrameDs[value .. i]["boss" .. b] = {}
                end
            end
        end

        -- 对账UI
        BG.DuiZhangFrame = {}
        for index, value in ipairs(FB) do
            BG.DuiZhangFrame[value] = {}
            for b = 1, 22 do
                BG.DuiZhangFrame[value]["boss" .. b] = {}
            end
        end

        -- 对账底色
        BG.DuiZhangFrameDs = {}
        for index, value in ipairs(FB) do
            for i = 1, 3, 1 do
                BG.DuiZhangFrameDs[value .. i] = {}
                for b = 1, 22 do
                    BG.DuiZhangFrameDs[value .. i]["boss" .. b] = {}
                end
            end
        end
    end

    -- 字体
    do
        BG.FontBlue1 = CreateFont("BG.FontBlue1")
        BG.FontBlue1:SetTextColor(RGB("00BFFF"))
        BG.FontBlue1:SetFont(BIAOGE_TEXT_FONT, 15, "OUTLINE")

        BG.FontBlue1Left = CreateFont("BG.FontBlue1Left")
        BG.FontBlue1Left:SetTextColor(RGB("00BFFF"))
        BG.FontBlue1Left:SetJustifyH("LEFT")
        BG.FontBlue1Left:SetFont(BIAOGE_TEXT_FONT, 15, "OUTLINE")

        BG.FontGold1 = CreateFont("BG.FontGold1")
        BG.FontGold1:SetTextColor(RGB("FFD100"))
        BG.FontGold1:SetFont(BIAOGE_TEXT_FONT, 15, "OUTLINE")

        local color = "Green15" -- BG.FontGreen15
        BG["Font" .. color] = CreateFont("BG.Font" .. color)
        BG["Font" .. color]:SetTextColor(RGB("00FF00"))
        BG["Font" .. color]:SetFont(BIAOGE_TEXT_FONT, 15, "OUTLINE")
        local color = "Green25" -- BG.FontGreen25
        BG["Font" .. color] = CreateFont("BG.Font" .. color)
        BG["Font" .. color]:SetTextColor(RGB("00FF00"))
        BG["Font" .. color]:SetFont(BIAOGE_TEXT_FONT, 25, "OUTLINE")

        BG.FontRed1 = CreateFont("BG.FontRed1")
        BG.FontRed1:SetTextColor(RGB("FF0000"))
        BG.FontRed1:SetFont(BIAOGE_TEXT_FONT, 15, "OUTLINE")

        BG.FontRed2 = CreateFont("BG.FontRed2")
        BG.FontRed2:SetTextColor(RGB("DC143C"))
        BG.FontRed2:SetFont(BIAOGE_TEXT_FONT, 15, "OUTLINE")

        BG.FontFen1 = CreateFont("BG.FontFen1")
        BG.FontFen1:SetTextColor(RGB("FF69B4"))
        BG.FontFen1:SetFont(BIAOGE_TEXT_FONT, 15, "OUTLINE")

        local color = "While25" -- BG.FontWhile25
        BG["Font" .. color] = CreateFont("BG.Font" .. color)
        BG["Font" .. color]:SetTextColor(RGB("FFFFFF"))
        BG["Font" .. color]:SetFont(BIAOGE_TEXT_FONT, 25, "OUTLINE")
        local color = "While18" -- BG.FontWhile18
        BG["Font" .. color] = CreateFont("BG.Font" .. color)
        BG["Font" .. color]:SetTextColor(RGB("FFFFFF"))
        BG["Font" .. color]:SetFont(BIAOGE_TEXT_FONT, 18, "OUTLINE")
        local color = "While15" -- BG.FontWhile15
        BG["Font" .. color] = CreateFont("BG.Font" .. color)
        BG["Font" .. color]:SetTextColor(RGB("FFFFFF"))
        BG["Font" .. color]:SetFont(BIAOGE_TEXT_FONT, 15, "OUTLINE")
        local color = "While13" -- BG.FontWhile13
        BG["Font" .. color] = CreateFont("BG.Font" .. color)
        BG["Font" .. color]:SetTextColor(RGB("FFFFFF"))
        BG["Font" .. color]:SetFont(BIAOGE_TEXT_FONT, 13, "OUTLINE")

        BG.FontHilight = CreateFont("BG.FontHilight")
        BG.FontHilight:SetTextColor(RGB("FFFFFF"))
        BG.FontHilight:SetFont(BIAOGE_TEXT_FONT, 15, "OUTLINE")

        BG.FontHilightLeft = CreateFont("BG.FontHilightLeft")
        BG.FontHilightLeft:SetTextColor(RGB("FFFFFF"))
        BG.FontHilightLeft:SetJustifyH("LEFT")
        BG.FontHilightLeft:SetFont(BIAOGE_TEXT_FONT, 15, "OUTLINE")

        BG.FontDisabled = CreateFont("BG.FontDisabled")
        BG.FontDisabled:SetTextColor(RGB("808080"))
        BG.FontDisabled:SetFont(BIAOGE_TEXT_FONT, 15, "OUTLINE")
    end

    -- 函数：给文本上颜色
    do
        BG.b1 = "00BFFF"
        function BG.STC_b1(text)
            if text then
                local t
                t = "|cff" .. "00BFFF" .. text .. "|r"
                return t
            end
        end

        BG.r1 = "FF0000"
        function BG.STC_r1(text)
            if text then
                local t
                t = "|cff" .. "FF0000" .. text .. "|r"
                return t
            end
        end

        BG.r2 = "FF1493"
        function BG.STC_r2(text)
            if text then
                local t
                t = "|cff" .. "FF1493" .. text .. "|r"
                return t
            end
        end

        BG.r3 = "FF69B4"
        function BG.STC_r3(text)
            if text then
                local t
                t = "|cff" .. "FF69B4" .. text .. "|r"
                return t
            end
        end

        BG.g1 = "00FF00"
        function BG.STC_g1(text)
            if text then
                local t
                t = "|cff" .. "00FF00" .. text .. "|r"
                return t
            end
        end

        BG.g2 = "90EE90"
        function BG.STC_g2(text)
            if text then
                local t
                t = "|cff" .. "90EE90" .. text .. "|r"
                return t
            end
        end

        BG.y1 = "FFFF00"
        function BG.STC_y1(text) -- yellow
            if text then
                local t
                t = "|cff" .. "FFFF00" .. text .. "|r"
                return t
            end
        end

        BG.y2 = "FFD100"
        function BG.STC_y2(text) -- gold
            if text then
                local t
                t = "|cff" .. "FFD100" .. text .. "|r"
                return t
            end
        end

        BG.w1 = "FFFFFF"
        function BG.STC_w1(text) -- 白色
            if text then
                local t
                t = "|cff" .. "FFFFFF" .. text .. "|r"
                return t
            end
        end

        BG.dis = "808080"
        function BG.STC_dis(text) -- 灰色
            if text then
                local t
                t = "|cff" .. "808080" .. text .. "|r"
                return t
            end
        end
    end

    -- 声音
    do
        BG.sound1 = SOUNDKIT.GS_TITLE_OPTION_OK -- 按键音效
        BG.sound2 = 569593                      -- 升级音效
        BG.sound_paimai = "Interface\\AddOns\\BiaoGe\\Media\\sound\\paimai.mp3"
        BG.sound_hope = "Interface\\AddOns\\BiaoGe\\Media\\sound\\hope.mp3"
        BG.sound_qingkong = "Interface\\AddOns\\BiaoGe\\Media\\sound\\qingkong.mp3"
        BG.sound_cehuiqingkong = "Interface\\AddOns\\BiaoGe\\Media\\sound\\cehuiqingkong.mp3"
    end
end


-- 数据库（保存至本地）
local function DataBase()
    -- WLK和Plus数据库互通检测
    do
        if BiaoGe and type(BiaoGe) == "table" then
            if BG.IsVanilla() then
                if BiaoGe.ICC then
                    -- 如果是赛季服但数据库里有ICC表，就清空数据库
                    BiaoGe = nil
                end
            else
                if BiaoGe.BD then
                    -- 如果是WLK但数据库里有BD表，就清空数据库
                    BiaoGe = nil
                end
            end
        end
    end

    -- 开始
    do
        if BiaoGe then
            if type(BiaoGe) ~= "table" then
                BiaoGe = {}
            end
        else
            BiaoGe = {}
        end
        if not BiaoGe.point then
            BiaoGe.point = {}
        end
        if not BiaoGe.duizhang then
            BiaoGe.duizhang = {}
        end
        if not BiaoGe.BossFrame then
            BiaoGe.BossFrame = {}
        end
        for index, value in ipairs(FB) do
            if not BiaoGe[value] then
                BiaoGe[value] = {}
            end
            for b = 1, 22 do
                if not BiaoGe[value]["boss" .. b] then
                    BiaoGe[value]["boss" .. b] = {}
                end
            end
        end

        if not BiaoGe.HistoryList then
            BiaoGe.HistoryList = {}
        end
        for index, value in ipairs(FB) do
            if not BiaoGe.HistoryList[value] then
                BiaoGe.HistoryList[value] = {}
            end
        end

        if not BiaoGe.History then
            BiaoGe.History = {}
        end
        for index, value in ipairs(FB) do
            if not BiaoGe.History[value] then
                BiaoGe.History[value] = {}
            end
        end

        for index, value in ipairs(FB) do
            if not BiaoGe.BossFrame[value] then
                BiaoGe.BossFrame[value] = {}
            end
        end

        if not BiaoGe.options then
            BiaoGe.options = {}
        end
        if not BiaoGe.options.SearchHistory then
            BiaoGe.options.SearchHistory = {}
        end

        -- 高亮天赋装备
        if not BiaoGe.filterClassNum then
            BiaoGe.filterClassNum = {}
        end
        if not BiaoGe.filterClassNum[RealmId] then
            BiaoGe.filterClassNum[RealmId] = {}
        end
        if not BiaoGe.filterClassNum[RealmId][player] then
            BiaoGe.filterClassNum[RealmId][player] = 0
        end
        if BiaoGeA and BiaoGeA.filterClassNum then
            BiaoGe.filterClassNum[RealmId][player] = BiaoGeA.filterClassNum
            BiaoGeA.filterClassNum = nil
        end

        -- 心愿清单
        if not BiaoGe.Hope then
            BiaoGe.Hope = {}
        end

        if not BiaoGe.Hope[RealmId] then
            BiaoGe.Hope[RealmId] = {}
        end
        if not BiaoGe.Hope[RealmId][player] then
            BiaoGe.Hope[RealmId][player] = {}
        end
        for index, fb in ipairs(FB) do
            if not BiaoGe.Hope[RealmId][player][fb] then
                BiaoGe.Hope[RealmId][player][fb] = {}
            end
            for n = 1, 4 do
                if not BiaoGe.Hope[RealmId][player][fb]["nandu" .. n] then
                    BiaoGe.Hope[RealmId][player][fb]["nandu" .. n] = {}
                    for b = 1, 22 do
                        if not BiaoGe.Hope[RealmId][player][fb]["nandu" .. n]["boss" .. b] then
                            BiaoGe.Hope[RealmId][player][fb]["nandu" .. n]["boss" .. b] = {}
                        end
                    end
                end
            end
        end
        if BiaoGeA and BiaoGeA.Hope then
            for k, v in pairs(BiaoGeA.Hope) do
                BiaoGe.Hope[RealmId][player][k] = v
            end
            BiaoGeA.Hope = nil
        end
    end
end

-- 其他
do
    local Width = {}
    local Height = {}
    local Maxb = {}
    local Maxi = {}

    Width["BG.MainFrame"] = 1710
    Width["ICC"] = 1290
    Width["TOC"] = 1290
    Width["ULD"] = 1290
    Width["NAXX"] = 1710
    Width["BD"] = 1290
    ADDONSELF.Width = Width

    Height["BG.MainFrame"] = 945
    Height["ICC"] = 875
    Height["TOC"] = 835
    Height["ULD"] = 875
    Height["NAXX"] = 945
    Height["BD"] = 835
    ADDONSELF.Height = Height

    Maxb["ICC"] = 15
    Maxb["TOC"] = 9
    Maxb["ULD"] = 16
    Maxb["NAXX"] = 19
    Maxb["BD"] = 9
    ADDONSELF.Maxb = Maxb

    Maxi["ICC"] = 16
    Maxi["TOC"] = 14
    Maxi["ULD"] = 8
    Maxi["NAXX"] = 11
    Maxi["BD"] = 11
    BG.Maxi = 30
    ADDONSELF.Maxi = Maxi

    local HopeMaxi
    if BG.IsVanilla() then
        HopeMaxi = 4
    else
        HopeMaxi = 3
    end
    local HopeMaxb = {}
    local HopeMaxn = {}

    ADDONSELF.HopeMaxi = HopeMaxi

    HopeMaxb["ICC"] = Maxb["ICC"] - 1
    HopeMaxb["TOC"] = Maxb["TOC"] - 1
    HopeMaxb["ULD"] = Maxb["ULD"] - 1
    HopeMaxb["NAXX"] = Maxb["NAXX"] - 1
    HopeMaxb["BD"] = Maxb["BD"] - 1
    ADDONSELF.HopeMaxb = HopeMaxb

    HopeMaxn["ICC"] = 4
    HopeMaxn["TOC"] = 4
    HopeMaxn["ULD"] = 2
    HopeMaxn["NAXX"] = 2
    HopeMaxn["BD"] = 1
    ADDONSELF.HopeMaxn = HopeMaxn
end



local frame = CreateFrame("Frame")
frame:RegisterEvent("ADDON_LOADED")
frame:SetScript("OnEvent", function(self, event, addonName)
    if addonName == AddonName then
        DataBase()
    end
end)
