local _, ADDONSELF = ...

local Size = ADDONSELF.Size
local RGB = ADDONSELF.RGB
local GetClassRGB = ADDONSELF.GetClassRGB
local SetClassCFF = ADDONSELF.SetClassCFF
local Maxb = ADDONSELF.Maxb
local Maxi = ADDONSELF.Maxi
local BossNum = ADDONSELF.BossNum
local FrameHide = ADDONSELF.FrameHide

local pt = print

local p = {}
local preWidget
local framedown
local frameright
local red, greed, blue = 1, 1, 1
local touming1, touming2 = 0.2, 0.4

function BG.TOCUI(FB)
    local bn = {
        [1] = 5,
        [2] = 5,
        [3] = 5,
        [4] = 5,
        [5] = 5,
        [6] = 7,
        [7] = 8,
        [8] = 12,
        [9] = Maxi[FB],
        [10] = 8,
        [11] = 5,
    }

    for t = 1, 3 do
        local bb
        if t == 2 then
            bb = 3 -- 第二列boss有3个
        else
            bb = 5 -- 第一列boss有5个
        end
        for b = 1, bb do
            if t == 3 and b == 4 then -- 第三列第四个boss就不再创建
                break
            end

            local ii = bn[BossNum(FB, b, t)]
            for i = 1, ii do
                BG.FBBiaoTiUI(FB, t, b, bb, i, ii)
                BG.HistoryBiaoTiUI(FB, t, b, bb, i, ii)
                BG.ReceiveBiaoTiUI(FB, t, b, bb, i, ii)

                BG.FBZhuangBeiUI(FB, t, b, bb, i, ii)
                BG.HistoryZhuangBeiUI(FB, t, b, bb, i, ii)
                BG.ReceiveZhuangBeiUI(FB, t, b, bb, i, ii)

                BG.FBMaiJiaUI(FB, t, b, bb, i, ii)
                BG.HistoryMaiJiaUI(FB, t, b, bb, i, ii)
                BG.ReceiveMaiJiaUI(FB, t, b, bb, i, ii)

                BG.FBJinEUI(FB, t, b, bb, i, ii)
                BG.HistoryJinEUI(FB, t, b, bb, i, ii)
                BG.ReceiveJinEUI(FB, t, b, bb, i, ii)

                BG.FBDiSeUI(FB, t, b, bb, i, ii)
                BG.HistoryDiSeUI(FB, t, b, bb, i, ii)
                BG.ReceiveDiSeUI(FB, t, b, bb, i, ii)
            end

            -- 对账
            do
                for i = 1, ii do
                    BG.DuiZhangBiaoTiUI(FB, t, b, bb, i, ii)
                    if BossNum(FB, b, t) <= Maxb[FB] then
                        BG.DuiZhangZhuangBeiUI(FB, t, b, bb, i, ii)
                        BG.DuiZhangMyJinEUI(FB, t, b, bb, i, ii)
                        BG.DuiZhangOtherJinEUI(FB, t, b, bb, i, ii)
                        BG.DuiZhangDiSeUI(FB, t, b, bb, i, ii)
                    end
                end

                if BossNum(FB, b, t) == Maxb[FB] + 1 then
                    local ii = 2
                    for i = 1, ii do
                        BG.DuiZhangZhuangBeiUI(FB, t, b, bb, i, ii)
                        BG.DuiZhangMyJinEUI(FB, t, b, bb, i, ii)
                        BG.DuiZhangOtherJinEUI(FB, t, b, bb, i, ii)
                        BG.DuiZhangDiSeUI(FB, t, b, bb, i, ii)
                    end
                end
                BG.DuiZhangBossNameUI(FB, t, b, bb, i, ii)
            end

            BG.FBBossNameUI(FB, t, b, bb, i, ii)
            BG.HistoryBossNameUI(FB, t, b, bb, i, ii)
            BG.ReceiveBossNameUI(FB, t, b, bb, i, ii)

            BG.FBJiShaUI(FB, t, b, bb, i, ii)
            BG.HistoryJiShaUI(FB, t, b, bb, i, ii)
            BG.ReceiveJiShaUI(FB, t, b, bb, i, ii)
        end
    end
    BG.FBZhiChuZongLanGongZiUI(FB)
    BG.HistoryZhiChuZongLanGongZiUI(FB)
    BG.ReceiveZhiChuZongLanGongZiUI(FB)

    -- BOSS模型
    do
        local model = CreateFrame("PlayerModel", nil, BG["Frame" .. FB])
        model:SetWidth(200)
        model:SetHeight(250)
        model:SetPoint("TOP", BG.Frame[FB].boss5.zhuangbei1, "TOPLEFT", -15, 70)
        model:SetFrameLevel(101)
        model:SetAlpha(0.8)
        model:SetPortraitZoom(-0.2)
        model:SetCreature(34564)
        -- model:SetCreature(34564, 29268)
        -- model:SetDisplayInfo(29268)
        model:SetHitRectInsets(50, 70, 60, 100)

        local time = GetTime()
        local c = 1
        local s = 1
        local ss = { 16234, 16235, 16236, 16237, 16238 }
        local clicktime
        model:SetScript("OnMouseUp", function()
            BG.MainFrame:GetScript("OnMouseUp")(BG.MainFrame)
            if GetTime() - clicktime >= 0.2 then return end

            if c == 1 then
                PlaySound(ss[s], "Master")
                if s == #ss then
                    s = 1
                else
                    s = s + 1
                end
                time = GetTime()
                c = 2
            elseif GetTime() - time >= 4 then
                PlaySound(ss[s], "Master")
                if s == #ss then
                    s = 1
                else
                    s = s + 1
                end
                time = GetTime()
            end
        end)
        model:SetScript("OnMouseDown", function()
            BG.MainFrame:GetScript("OnMouseDown")(BG.MainFrame)
            clicktime = GetTime()
        end)
    end
end
