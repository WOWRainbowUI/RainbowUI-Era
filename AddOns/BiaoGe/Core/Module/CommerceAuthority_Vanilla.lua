if not BG.IsVanilla() then return end

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

local function GetPrice(itemID)
    itemID = tostring(itemID)
    local realmName = GetRealmName()
    local faction = UnitFactionGroup("player")
    if AUCTIONATOR_PRICE_DATABASE and AUCTIONATOR_PRICE_DATABASE[realmName .. " " .. faction] and
        AUCTIONATOR_PRICE_DATABASE[realmName .. " " .. faction][itemID] then
        return AUCTIONATOR_PRICE_DATABASE[realmName .. " " .. faction][itemID].m
    end
end

local function SetTooltipText(itemID, tooltip)
    for _itemID, v in pairs(BG.CommerceAuthority) do
        _itemID = tonumber(_itemID)
        if _itemID == itemID then
            tooltip:AddLine(" ", 1, 1, 1, true)
            if v.isfullitem then
                tooltip:AddDoubleLine(L["声望奖励"], v.fullgive, 1, 0.82, 0, 1, 1, 1)
                tooltip:Show()
            else
                if v.usetoitem then
                    local _, link = GetItemInfo(v.usetoitem)
                    if link then
                        tooltip:AddDoubleLine(L["可用于"], link, 1, 0.82, 0, 1, 1, 1)
                        tooltip:AddDoubleLine(L["需要数量"], v.needcount, 1, 0.82, 0, 1, 1, 1)
                    end
                end
                if v.needitem and IsAddOnLoaded("Auctionator") then
                    local name, link = GetItemInfo(v.needitem)
                    if name then
                        local money = GetPrice(v.needitem)
                        if money then
                            tooltip:AddDoubleLine(name, GetMoneyString(money, true), 1, 0.82, 0, 1, 1, 1)
                        else
                            tooltip:AddDoubleLine(name, L["没有价格"], 1, 0.82, 0, 1, 1, 1)
                        end
                    end
                end
                tooltip:AddDoubleLine(L["空载时声望奖励"], v.emptygive, 1, 0.82, 0, 1, 1, 1)
                tooltip:AddDoubleLine(L["补足时声望奖励"], v.fullgive, 1, 0.82, 0, 1, 1, 1)
                tooltip:Show()
            end
            return
        end
    end
end

local function AddInfo(self)
    if BiaoGe.options["commerceAuthorityTooltip"] ~= 1 then return end
    local _, link = self:GetItem()
    if not link then return end
    local itemID = GetItemInfoInstant(link)
    SetTooltipText(itemID, GameTooltip)
end

local function AddItemRefInfo(ItemRefLink)
    if BiaoGe.options["commerceAuthorityTooltip"] ~= 1 then return end
    if not ItemRefTooltip:IsVisible() then return end
    local item, link, quality, level, _, _, _, _, _, Texture, _, typeID = GetItemInfo(ItemRefLink)
    if not link then return end
    local itemID = GetItemInfoInstant(link)
    SetTooltipText(itemID, ItemRefTooltip)
end

GameTooltip:HookScript("OnTooltipSetItem", AddInfo)

hooksecurefunc("SetItemRef", AddItemRefInfo)
