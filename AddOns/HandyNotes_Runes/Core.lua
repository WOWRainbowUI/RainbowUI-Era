--[[
                                ----o----(||)----oo----(||)----o----

                                                Runes

                                     v1.05 - 16th December 2023
									 
                                Copyright (C) Taraezor / Chris Birch
                                         All Rights Reserved

                                ----o----(||)----oo----(||)----o----
]]

local myName, ns = ...
ns.db = {}
-- From Data.lua
ns.points = {}
ns.textures = {}
ns.scaling = {}
-- Pink theme
ns.colour = {}
ns.colour.prefix	= "\124cFFFF007F" -- Bright Pink
ns.colour.highlight = "\124cFFFF69B4" -- Hot Pink
ns.colour.plaintext = "\124cFFFFB2D0" -- Powder Pink

local defaults = { profile = { iconScale = 2.5, iconAlpha = 1, showCoords = false,
								showOnlyMyClass = true, iconChoice = 7 } }
local continents = {}
local pluginHandler = {}

-- Upvalues
local GameTooltip = _G.GameTooltip
local IsQuestFlaggedCompleted = C_QuestLog.IsQuestFlaggedCompleted
local LibStub = _G.LibStub
local UIParent = _G.UIParent
local formatt, ipairs, next, type = format, ipairs, next, type

local HandyNotes = _G.HandyNotes
ns.name = UnitName( "player" ) or "Character"
ns.faction = UnitFactionGroup( "player" )
ns.classLocal, ns.class = UnitClass( "player" )
ns.raceID = select( 3, UnitRace( "player" ) )

ns.colour.class = "\124c" ..select( 4, GetClassColor( ns.class ) )

continents[ 1414 ] = true -- Kalimdor
continents[ 1415 ] = true -- Eastern Kingdoms

function pluginHandler:OnEnter(mapFile, coord)
	if self:GetCenter() > UIParent:GetCenter() then
		GameTooltip:SetOwner(self, "ANCHOR_LEFT")
	else
		GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
	end

	local completed;
	local pin = ns.points[mapFile] and ns.points[mapFile][coord]
	
	if pin.quickStart then
	
		for k,v in pairs( pin.class ) do

			if k == ns.class then
				GameTooltip:SetText( ns.colour.prefix ..ns.classLocal )
				for j = 1, #v.rune do
					GameTooltip:AddLine( ns.colour.highlight ..v.rune[ j ] .."\n(" ..v.spell[ j ] ..")" )
					GameTooltip:AddLine( ns.colour.plaintext ..v.start[ j ] )
				end
			end
		end

	else
		for i,v in ipairs( pin.class ) do

			if ns.class == v then

				GameTooltip:AddDoubleLine( ns.colour.prefix ..pin.rune[ i ] .."\n(" ..pin.spell[ i ] ..")",
											ns.colour.class ..ns.classLocal )
				GameTooltip:AddLine( ns.colour.highlight ..pin.name .."\n" )

				if pin.quest then
					-- Classes can share the same quest
					local quests = ( pin.quest[ i ] ~= nil ) and pin.quest[ i ] or pin.quest[ 1 ]
					local questsNames = ( pin.questName[ i ] ~= nil ) and pin.questName[ i ] or pin.questName[ 1 ]
					GameTooltip:AddLine( "\n" )
					if type( quests ) == "table" then
						for j,w in ipairs( quests ) do
							completed = IsQuestFlaggedCompleted( w )
							GameTooltip:AddDoubleLine( ns.colour.highlight ..questsNames[ j ],
									( completed == true ) and ( "\124cFF00FF00" .."已完成" .." (" ..ns.name ..")" ) 
									or ( "\124cFFFF0000" .."未完成" .." (" ..ns.name ..")" ) )
						end
					else
						completed = IsQuestFlaggedCompleted( quests )
						GameTooltip:AddDoubleLine( ns.colour.highlight ..questsNames,
								( completed == true ) and ( "\124cFF00FF00" .."已完成" .." (" ..ns.name ..")" ) 
									or ( "\124cFFFF0000" .."未完成" .." (" ..ns.name ..")" ) )
					end
				end
				
				if pin.tip then
					GameTooltip:AddLine( "\n" ..ns.colour.plaintext ..pin.tip )
				end
				
				if pin.guide then
					-- A single guide for all classes is permitted
					GameTooltip:AddLine( "\n" ..ns.colour.highlight .."指南\n\n" ..ns.colour.plaintext
								..( ( pin.guide[ i ] ~= nil ) and pin.guide[ i ] or pin.guide[ 1 ] ) )
				end
			end
		end

		if ( ns.db.showCoords == true ) then
			local mX, mY = HandyNotes:getXY(coord)
			mX, mY = mX*100, mY*100
			GameTooltip:AddLine( ns.colour.highlight .."(" ..format( "%.02f", mX ) .."," ..format( "%.02f", mY ) ..")" )
		end
	end
	
	GameTooltip:Show()
end

function pluginHandler:OnLeave()
	GameTooltip:Hide()
end

do	
	local function iterator(t, prev)
		if not t then return end
		local coord, pin = next(t, prev)
		while coord do
			if pin then
				if pin.quickStart then
					for k,v in pairs( pin.class ) do
						if k == ns.class then
							return coord, nil, ns.textures[ 15 ],
								ns.db.iconScale * ns.scaling[ 15 ] * 2, ns.db.iconAlpha
						end
					end
				else
					-- class and rune are aways 1:1 with indexing/existence
					for i,v in ipairs( pin.class ) do
						if ns.class == v then
							if pin.faction then
								if pin.faction == ns.faction then
									return coord, nil, ns.textures[ns.db.iconChoice],
										ns.db.iconScale * ns.scaling[ns.db.iconChoice], ns.db.iconAlpha
								end
							else
								return coord, nil, ns.textures[ns.db.iconChoice],
									ns.db.iconScale * ns.scaling[ns.db.iconChoice], ns.db.iconAlpha
							end
						end
					end
				end
			end
			coord, pin = next(t, coord)
		end
	end
	function pluginHandler:GetNodes2(mapID)
		return iterator, ns.points[mapID]
	end
end

-- Interface -> Addons -> Handy Notes -> Plugins -> Runes options
ns.options = {
	type = "group",
	name = "符文",
	desc = "探索賽季的所有符文",
	get = function(info) return ns.db[info[#info]] end,
	set = function(info, v)
		ns.db[info[#info]] = v
		pluginHandler:Refresh()
	end,
	args = {
		options = {
			type = "group",
			name = " 選項",
			inline = true,
			args = {
				iconScale = {
					type = "range",
					name = "圖示大小",
					desc = "地圖圖示的大小",
					min = 1, max = 4, step = 0.1,
					arg = "iconScale",
					order = 1,
				},
				iconAlpha = {
					type = "range",
					name = "圖示透明度",
					desc = "地圖圖示的透明度",
					min = 0, max = 1, step = 0.01,
					arg = "iconAlpha",
					order = 2,
				},
				showCoords = {
					type = "toggle",
					name = "顯示座標",
					desc = "顯示座標說明\n"
							..ns.colour.highlight .."(xx.xx,yy.yy)",
					width = "full",
					arg = "showCoords",
					order = 3,
				},
				showOnlyMyClass = {
					name = "只顯示我的職業",
					desc = "此選項目前還沒有作用",
					type = "toggle",
					width = "full",
					arg = "showOnlyMyClass",
					order = 4,
				},
			},
		},
		icon = {
			type = "group",
			name = "圖示選項",
			inline = true,
			args = {
				iconChoice = {
					type = "range",
					name = "選擇圖示",
					desc = "White\n2 = 紫色\n3 = 紅色\n4 = 黃色\n5 = 綠色\n6 = 灰色"
							.."\n7 = 法力球\n8 = 鏡像\n9 = 猛禽蛋\n10 = 星星"
							.."\n11 = 齒輪\n12 = 雪花\n13 = 鑽石\n14 = 螺絲"
							.."\n15 = 符文\n16 = 祕法符文\n17 = 惡魔符文\n18 = 任務符文",
					min = 1, max = 18, step = 1,
					arg = "iconChoice",
					order = 5,
				},
			},
		},
	},
}

function pluginHandler:OnEnable()
	local HereBeDragons = LibStub("HereBeDragons-2.0", true)
	if not HereBeDragons then return end
	
	for continentMapID in next, continents do
		local children = C_Map.GetMapChildrenInfo(continentMapID, nil, true)
		for _, map in next, children do
			local coords = ns.points[map.mapID]
			if coords then
				for coord, pin in next, coords do
					local function AddToContinent()
						local mx, my = HandyNotes:getXY(coord)
						local cx, cy = HereBeDragons:TranslateZoneCoordinates(mx, my, map.mapID, continentMapID)
						if cx and cy then
							ns.points[continentMapID] = ns.points[continentMapID] or {}
							ns.points[continentMapID][HandyNotes:getCoord(cx, cy)] = pin
						end
					end
					if pin.outdoors then
						if pin.outdoors == IsOutdoors() then
							AddToContinent()
						end
					else
						AddToContinent()
					end
				end
			end
		end
	end
	HandyNotes:RegisterPluginDB("Runes", pluginHandler, ns.options)
	ns.db = LibStub("AceDB-3.0"):New("HandyNotes_RunesDB", defaults, "Default").profile
	pluginHandler:Refresh()
end

function pluginHandler:Refresh()
	self:SendMessage("HandyNotes_NotifyUpdate", "Runes")
end

LibStub("AceAddon-3.0"):NewAddon(pluginHandler, "HandyNotes_RunesDB", "AceEvent-3.0")