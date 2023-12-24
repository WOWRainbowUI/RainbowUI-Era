local AddonName, ADDONSELF = ...

local LibBG = ADDONSELF.LibBG
local L = ADDONSELF.L

local RR = ADDONSELF.RR
local NN = ADDONSELF.NN
local RN = ADDONSELF.RN
local Size = ADDONSELF.Size
local RGB = ADDONSELF.RGB
local RGB_16 = ADDONSELF.RGB_16
local GetClassRGB = ADDONSELF.GetClassRGB
local SetClassCFF = ADDONSELF.SetClassCFF
local GetText_T = ADDONSELF.GetText_T
local FrameDongHua = ADDONSELF.FrameDongHua
local FrameHide = ADDONSELF.FrameHide
local AddTexture = ADDONSELF.AddTexture
local GetItemID = ADDONSELF.GetItemID

local Width = ADDONSELF.Width
local Height = ADDONSELF.Height
local Maxb = ADDONSELF.Maxb
local Maxi = ADDONSELF.Maxi
local HopeMaxn = ADDONSELF.HopeMaxn
local HopeMaxb = ADDONSELF.HopeMaxb
local HopeMaxi = ADDONSELF.HopeMaxi

local pt = print
local RealmId = GetRealmID()
local player = UnitName("player")

local frame = CreateFrame("Frame")
frame:RegisterEvent("ADDON_LOADED")
frame:SetScript("OnEvent", function(self, event, addonName)
    if addonName ~= AddonName then return end
    -- 拾取事件通报到屏幕中上
    local name = "lootTime"
    BG.options[name .. "reset"] = 8
    local f = CreateFrame("ScrollingMessageFrame", "BG.FrameLootMsg", UIParent, "BackdropTemplate")
    f:SetSpacing(3)                                                       -- 行间隔
    f:SetFadeDuration(1)                                                  -- 淡出动画的时间
    f:SetTimeVisible(BiaoGe.options[name] or BG.options[name .. "reset"]) -- 可见时间
    f:SetJustifyH("LEFT")                                                 -- 对齐格式
    f:SetSize(700, 200)                                                   -- 大小
    f:SetFont(BIAOGE_TEXT_FONT, BiaoGe.options["lootFontSize"] or 20, "OUTLINE")
    f:SetFrameStrata("FULLSCREEN_DIALOG")
    f:SetFrameLevel(130)
    f:SetClampedToScreen(true)
    f:SetHyperlinksEnabled(true)
    f.name = L["装备记录通知"]
    f.homepoin = { "TOPLEFT", nil, "TOP", -200, 0 }
    if BiaoGe.point[f:GetName()] then
        f:SetPoint(unpack(BiaoGe.point[f:GetName()]))
    else
        f:SetPoint(unpack(f.homepoin)) --设置显示位置
    end
    tinsert(BG.Movetable, f)
    BG.FrameLootMsg = f

    f.name = f:CreateFontString()
    f.name:SetFont(BIAOGE_TEXT_FONT, 15, "OUTLINE")
    f.name:SetTextColor(1, 1, 1, 1)
    f.name:SetText(L["装备记录通知"])
    f.name:SetPoint("TOP", 0, -5)
    f.name:Hide()

    BG.FrameLootMsg:SetScript("OnHyperlinkEnter", function(self, link, text, button)
        GameTooltip:SetOwner(self, "ANCHOR_CURSOR", 0, 0)
        GameTooltip:ClearLines()
        local itemID = GetItemInfoInstant(link)
        if itemID then
            GameTooltip:SetItemByID(itemID)
            GameTooltip:Show()
        end
    end)
    BG.FrameLootMsg:SetScript("OnHyperlinkLeave", function(self, link, text, button)
        GameTooltip:Hide()
    end)
    BG.FrameLootMsg:SetScript("OnHyperlinkClick", function(self, link, text, button)
        local name, link, quality, level, _, _, _, _, _, Texture, _, typeID = GetItemInfo(link)

        if button == "RightButton" then -- 右键清除关注
            if BG.FB2 then
                for b = 1, Maxb[BG.FB2] do
                    for i = 1, Maxi[BG.FB2] do
                        if BG.Frame[BG.FB2]["boss" .. b]["zhuangbei" .. i] then
                            if GetItemID(link) == GetItemID(BG.Frame[BG.FB2]["boss" .. b]["zhuangbei" .. i]:GetText()) then
                                BiaoGe[BG.FB2]["boss" .. b]["guanzhu" .. i] = nil
                                BG.Frame[BG.FB2]["boss" .. b]["guanzhu" .. i]:Hide()
                                BG.FrameLootMsg:AddMessage(BG.STC_r1(format("已取消关注装备：%s",
                                    AddTexture(Texture) .. link)))
                                return
                            end
                        end
                    end
                end
            end
        end
        if IsShiftKeyDown() then
            ChatEdit_ActivateChat(ChatEdit_ChooseBoxForSend())
            ChatEdit_InsertLink(text)
            return
        end
        if IsAltKeyDown() then
            if BG.FB2 then
                for b = 1, Maxb[BG.FB2] do
                    for i = 1, Maxi[BG.FB2] do
                        if BG.Frame[BG.FB2]["boss" .. b]["zhuangbei" .. i] then
                            if GetItemID(link) == GetItemID(BG.Frame[BG.FB2]["boss" .. b]["zhuangbei" .. i]:GetText()) then
                                BiaoGe[BG.FB2]["boss" .. b]["guanzhu" .. i] = true
                                BG.Frame[BG.FB2]["boss" .. b]["guanzhu" .. i]:Show()
                                BG.FrameLootMsg:AddMessage(BG.STC_g2(format(L["已成功关注装备：%s。团长拍卖此装备时会提醒"],
                                    AddTexture(Texture) .. link)))
                                return
                            end
                        end
                    end
                end
            end
        end
    end)


    local trade
    local buy
    local quest

    local f = CreateFrame("Frame")
    f:RegisterEvent("TRADE_ACCEPT_UPDATE")
    f:RegisterEvent("TRADE_CLOSED")
    f:RegisterEvent("MERCHANT_UPDATE")
    f:RegisterEvent("QUEST_TURNED_IN")
    f:RegisterEvent("QUEST_FINISHED")
    f:SetScript("OnEvent", function(self, even, arg1, arg2)
        if even == "TRADE_ACCEPT_UPDATE" then -- 屏蔽交易添加
            if arg1 == 1 or arg2 == 1 then
                trade = true
            else
                trade = nil
            end
        elseif even == "TRADE_CLOSED" then
            trade = nil
        elseif even == "MERCHANT_UPDATE" then -- 屏蔽购买物品
            buy = true
            C_Timer.After(0.5, function()
                buy = nil
            end)
        elseif even == "QUEST_TURNED_IN" or even == "QUEST_FINISHED" then -- 屏蔽任务物品
            quest = true
            C_Timer.After(0.5, function()
                quest = nil
            end)
        end
    end)

    local numb
    local lasttime = 0
    local time
    local start

    local function PrintLootBoss(FB, even, numb, text)
        if BiaoGe.options["autoLoot"] ~= 1 then return end
        SendSystemMessage(BG.STC_b1("<BiaoGe>") .. " " .. text .. "，" .. L["当前装备自动记录位置："] ..
            "|cff" .. BG.Boss[FB]["boss" .. numb].color .. BG.Boss[FB]["boss" .. numb].name2 .. RR)
    end

    -- 获取BOSS战ID
    local f = CreateFrame("Frame")
    f:RegisterEvent("ENCOUNTER_START")
    f:RegisterEvent("ENCOUNTER_END")
    f:SetScript("OnEvent", function(self, even, bossId, _, _, _, success)
        local FB = BG.FB2
        if not FB then return end
        if even == "ENCOUNTER_START" then
            start = true
            for key, value in pairs(BG.Loot.encounterID[FB]) do
                if bossId and tonumber(key) and (bossId == tonumber(key)) then
                    numb = value
                    lasttime = GetTime()
                    local text = BG.STC_g1(L["BOSS战开始"])
                    PrintLootBoss(FB, even, numb, text)
                    break
                end
            end
        elseif even == "ENCOUNTER_END" and success == 1 then
            for key, value in pairs(BG.Loot.encounterID[FB]) do
                if bossId and tonumber(key) and (bossId == tonumber(key)) then
                    numb = value
                    lasttime = GetTime()
                    start = nil
                    local text = BG.STC_g1(L["BOSS击杀成功"])
                    PrintLootBoss(FB, even, numb, text)
                    break
                end
            end
        elseif even == "ENCOUNTER_END" and success ~= 1 then -- 团灭
            numb = BG.Loot.encounterID[FB]["zaxiang"]
            start = nil
            local text = BG.STC_r1(L["BOSS击杀失败"])
            PrintLootBoss(FB, even, numb, text)
        end
    end)
    local f = CreateFrame("Frame")
    f:RegisterEvent("PLAYER_REGEN_DISABLED") -- 进入战斗
    f:SetScript("OnEvent", function(self, even, ID)
        local FB = BG.FB2
        if not FB then return end
        if start then return end
        time = GetTime()
        if numb ~= BG.Loot.encounterID[FB]["zaxiang"] then
            if time - lasttime >= 30 then -- 击杀BOSS 30秒后进入下一次战斗，就变回杂项
                numb = BG.Loot.encounterID[FB]["zaxiang"]
                local text = BG.STC_r1(L["非BOSS战"])
                PrintLootBoss(FB, even, numb, text)
            end
        end
    end)

    -- 记录物品进表格
    local function AddLootItem(FB, numb, link, Texture, level, Hope)
        local icon, IsSP = BG.LootFilterClassItem(link, BiaoGeFilterTooltip)
        for i = 1, Maxi[FB] do
            local zb = BG.Frame[FB]["boss" .. numb]["zhuangbei" .. i]
            local zb1 = BG.Frame[FB]["boss" .. numb]["zhuangbei" .. (i + 1)]
            local duizhangzb = BG.DuiZhangFrame[FB]["boss" .. numb]["zhuangbei" .. i]
            if zb and zb:GetText() == "" then
                zb:SetText(link)
                duizhangzb:SetText(link)
                BiaoGe[FB]["boss" .. numb]["zhuangbei" .. i] = link
                if IsSP then
                    C_Timer.After(0.01, function()
                        icon = BG.LootFilterClassItem(link, BiaoGeFilterTooltip)
                        BG.FrameLootMsg:AddMessage(icon .. "|cff00BFFF" ..
                            format(L["已自动记入表格：%s%s(%s) => %s< %s >%s"], RR, (AddTexture(Texture) .. link), level, "|cffFF1493", BG.Boss[FB]["boss" .. numb]["name2"], RR) .. icon)
                    end)
                else
                    BG.FrameLootMsg:AddMessage(icon .. "|cff00BFFF" ..
                        format(L["已自动记入表格：%s%s(%s) => %s< %s >%s"], RR, (AddTexture(Texture) .. link), level, "|cffFF1493", BG.Boss[FB]["boss" .. numb]["name2"], RR) .. icon)
                end
                if Hope then
                    BiaoGe[FB]["boss" .. numb]["guanzhu" .. i] = true
                    BG.Frame[FB]["boss" .. numb]["guanzhu" .. i]:Show()
                    BG.FrameLootMsg:AddMessage(BG.STC_g2(format(L["自动关注心愿装备：%s。团长拍卖此装备时会提醒"],
                        (AddTexture(Texture) .. link))))
                end
                return true
            elseif zb and not zb1 then
                if IsSP then
                    C_Timer.After(0.01, function()
                        icon = BG.LootFilterClassItem(link, BiaoGeFilterTooltip)
                        BG.FrameLootMsg:AddMessage(icon .. format(
                            "|cffDC143C" .. L["自动记录失败：%s%s(%s)。因为%s< %s >%s的格子满了。。"], RR, (AddTexture(Texture) .. link), level, "|cffFF1493", BG.Boss[FB]["boss" .. numb]["name2"], RR) .. icon)
                    end)
                else
                    BG.FrameLootMsg:AddMessage(icon .. format(
                        "|cffDC143C" .. L["自动记录失败：%s%s(%s)。因为%s< %s >%s的格子满了。。"], RR, (AddTexture(Texture) .. link), level, "|cffFF1493", BG.Boss[FB]["boss" .. numb]["name2"], RR) .. icon)
                end
                if Hope then
                    BG.FrameLootMsg:AddMessage(format("|cffDC143C" .. L["自动关注心愿装备失败：%s%s"],
                        RR, ((AddTexture(Texture) .. link))))
                end
                return true
            end
        end
    end
    BG.AddLootItem = AddLootItem


    -- 物品黑名单
    local blacklist = {
        45897, --[重铸的远古王者之锤]
        50226, --[烂肠的酸性血液]
        50231, --[腐面的酸性血液]
        52006, --[冰霜珍宝袋]
        51315, --[密封的箱子]相关物品
        51316, --[密封的箱子]相关物品
        51317, --[密封的箱子]相关物品
        51318, --[密封的箱子]相关物品
        51319, --[密封的箱子]相关物品
        51320, --[密封的箱子]相关物品
        51321, --[密封的箱子]相关物品
    }
    -- 物品白名单
    local whitelist = {
        45087, --[宝珠]
        47556, --[宝珠]
        49908, --[宝珠]

        -- 211454, --[奇怪的水球]
    }

    -- 拾取事件监听
    local f = CreateFrame("Frame")
    f:RegisterEvent("CHAT_MSG_LOOT")
    f:SetScript("OnEvent", function(self, even, msg, ...)
        local FB = BG.FB2
        if BiaoGe.options["autoLoot"] ~= 1 then -- 有没勾选自动记录功能
            return
        end

        if BG.DeBug then
            if BG.IsVanilla() then
                FB = "BD"
            else
                FB = "ICC"
            end
        else
            if not FB then -- 有没FB
                return
            end
        end

        if trade then -- 是否刚交易完
            return
        end

        local lootplayer, link, count
        link, count = strmatch(msg, string.gsub(string.gsub(LOOT_ITEM_SELF_MULTIPLE, "%%s", "(.+)"), "%%d", "(%%d+)"));
        if (not link) then
            link, count = strmatch(msg, string.gsub(string.gsub(LOOT_ITEM_PUSHED_SELF_MULTIPLE, "%%s", "(.+)"), "%%d", "(%%d+)"));
            if (not link) then
                link = msg:match(LOOT_ITEM_SELF:gsub("%%s", "(.+)"));
                if (not link) then
                    link = msg:match(LOOT_ITEM_PUSHED_SELF:gsub("%%s", "(.+)"));

                    if (not link) then
                        lootplayer, link, count = strmatch(msg, string.gsub(string.gsub(LOOT_ITEM_MULTIPLE, "%%s", "(.+)"), "%%d", "(%%d+)"));
                        if (not link) then
                            lootplayer, link, count = strmatch(msg, string.gsub(string.gsub(LOOT_ITEM_PUSHED_MULTIPLE, "%%s", "(.+)"), "%%d", "(%%d+)"));
                            if (not link) then
                                lootplayer, link = msg:match("^" .. LOOT_ITEM:gsub("%%s", "(.+)"));
                                if (not link) then
                                    lootplayer, link = msg:match("^" .. LOOT_ITEM_PUSHED:gsub("%%s", "(.+)"));
                                end
                            end
                        end
                    end
                end
            end
        end

        if buy and not lootplayer then -- 你是否刚购买了物品
            return
        end

        if quest and not lootplayer then -- 是否获得了任务物品
            return
        end

        if not link then
            return
        end

        if not count then
            count = 1
        end

        local name, _, quality, level, _, _, _, _, _, Texture, _, typeID, subclassID = GetItemInfo(link)
        local itemId = GetItemInfoInstant(link)

        for i, id in ipairs(blacklist) do -- 过滤黑名单物品
            if itemId == id then
                return
            end
        end

        local Iswhitelist
        for i, id in ipairs(whitelist) do -- 过滤白名单物品
            if itemId == id then
                Iswhitelist = true
            end
        end

        if not Iswhitelist then
            if BG.IsVanilla() then
                if (not BG.DeBug) and quality < 3 then -- 是不是蓝装、紫装或橙装
                    return
                end
            else
                if (not BG.DeBug) and quality < 4 then -- 是不是紫装或橙装
                    return
                end
            end
        end

        if (not BG.DeBug) and (typeID == 7 and (subclassID == 12 or subclassID == 0))
        then -- 是不是附魔分解的物品（例如：深渊水晶）、subclassID==0是60年代的附魔材料子分类
            return
        end

        if typeID == 9 or typeID == 10 or typeID == 3 then -- 是不是图纸或牌子或宝石
            return
        end

        if not BG.IsVanilla() then
            for i, _itemId in ipairs(BG.Loot.ICC.Faction["1156"]) do -- 过滤ICC声望戒指
                if itemId == _itemId then
                    return
                end
            end
        end

        -- 更新心愿汇总已掉落显示
        BG.UpdateItemLib_RightHope_IsLooted_All()

        -- 心愿装备
        local Hope
        for n = 1, HopeMaxn[FB] do
            for b = 1, HopeMaxb[FB] do
                for i = 1, HopeMaxi do
                    local bt = BG.HopeFrame[FB]["nandu" .. n]["boss" .. b]["zhuangbei" .. i]
                    if bt then
                        if GetItemID(link) == GetItemID(bt:GetText()) then
                            BG.FrameLootMsg:AddMessage(BG.STC_g1(format(L["你的心愿达成啦！！！>>>>> %s(%s) <<<<<"], (AddTexture(Texture) .. link), level)))
                            bt.looted:Show()
                            Hope = true
                            PlaySoundFile(BG.sound_hope, "Master")
                            break
                        end
                    end
                end
                if Hope then
                    break
                end
            end
            if Hope then
                break
            end
        end

        -- 特殊物品记到杂项里
        local item
        if itemId == 45038 or itemId == 50274 then                        -- 如果掉落装备为橙片
            item = "ChengPian"
        elseif itemId == 45087 or itemId == 47556 or itemId == 49908 then -- 如果掉落装备为符文宝珠
            item = "BaoZhu"
        end
        if item then
            local numb = Maxb[FB] - 1
            local yes_zb, yes_i, yes_duizhangzb
            if not BiaoGe[FB][item] then
                for i = 1, Maxi[FB] do
                    local zb = BG.Frame[FB]["boss" .. numb]["zhuangbei" .. i]
                    if zb and zb:GetText() == "" then
                        yes_i = i
                        yes_zb = BG.Frame[FB]["boss" .. numb]["zhuangbei" .. i]
                        yes_duizhangzb = BG.DuiZhangFrame[FB]["boss" .. numb]["zhuangbei" .. i]
                        break
                    end
                    local zb1 = BG.Frame[FB]["boss" .. numb]["zhuangbei" .. (i + 1)]
                    if zb and not zb1 then
                        BG.FrameLootMsg:AddMessage(format("|cffDC143C" .. L["自动记录失败：%s%s(%s)。因为%s< %s >%s的格子满了。。"], RR, (AddTexture(Texture) .. link), level, "|cffFF1493",
                            BG.Boss[FB]["boss" .. numb]["name2"], RR))
                        if Hope then
                            BG.FrameLootMsg:AddMessage(format("|cffDC143C" .. L["自动关注心愿装备失败：%s%s"], RR, ((AddTexture(Texture) .. link))))
                        end
                        return
                    end
                end
            else
                for i = 1, Maxi[FB] do
                    local zb = BG.Frame[FB]["boss" .. numb]["zhuangbei" .. i]
                    if zb and (GetItemID(zb:GetText()) == GetItemID(link)) then
                        yes_i = i
                        yes_zb = BG.Frame[FB]["boss" .. numb]["zhuangbei" .. i]
                        yes_duizhangzb = BG.DuiZhangFrame[FB]["boss" .. numb]["zhuangbei" .. i]
                        break
                    end
                end
            end
            if yes_i then
                local i = yes_i
                BiaoGe[FB][item] = (BiaoGe[FB][item] or 0) + count
                yes_zb:SetText(link .. "x" .. BiaoGe[FB][item])
                yes_duizhangzb:SetText(link .. "x" .. BiaoGe[FB][item])
                BiaoGe[FB]["boss" .. numb]["zhuangbei" .. i] = link .. "x" .. BiaoGe[FB][item]
                BG.FrameLootMsg:AddMessage(format("|cff00BFFF" .. L["已自动记入表格：%s%s(%s) x%d => %s< %s >%s"], RR, (AddTexture(Texture) .. link), level, BiaoGe[FB][item], "|cffFF1493",
                    BG.Boss[FB]["boss" .. numb]["name2"], RR))
                if Hope then
                    BiaoGe[FB]["boss" .. numb]["guanzhu" .. i] = true
                    BG.Frame[FB]["boss" .. numb]["guanzhu" .. i]:Show()
                    BG.FrameLootMsg:AddMessage(BG.STC_g2(format("自动关注心愿装备：%s。团长拍卖此装备时会提醒", (AddTexture(Texture) .. link))))
                end
                return
            end
        end

        -- TOC嘉奖宝箱通过读取掉落列表来记录装备
        if FB == "TOC" and itemId ~= 47242 then
            local nanduID = GetRaidDifficultyID()
            local H
            if nanduID == 6 or nanduID == 194 then     -- 25H
                H = "H25"
            elseif nanduID == 5 or nanduID == 193 then -- 10H
                H = "H10"
            end
            if H then
                for index, value in ipairs(BG.Loot.TOC[H].boss6) do
                    if itemId == value then
                        local numb = 6
                        if AddLootItem(FB, numb, link, Texture, level, Hope) then return end
                    end
                end
            end
        end

        -- ICC小怪掉落
        if FB == "ICC" then
            for key, value in pairs(BG.Loot.ICC.H25.boss14) do
                if itemId == value then
                    local numb = 14
                    if AddLootItem(FB, numb, link, Texture, level, Hope) then return end
                end
            end
        end

        -- 正常拾取
        if not numb then
            numb = BG.Loot.encounterID[FB]["zaxiang"] -- 第一个boss前的小怪设为杂项
        end

        local zaxiang
        if itemId == 47242 then -- 如果掉落装备为北伐奖章
            zaxiang = Maxb[FB] - 1
        end
        local numb = zaxiang or numb
        if AddLootItem(FB, numb, link, Texture, level, Hope) then return end
    end)
end)
