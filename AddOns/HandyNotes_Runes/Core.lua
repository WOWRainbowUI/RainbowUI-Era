--[[
                                ----o----(||)----oo----(||)----o----

                                                Runes

                                     v1.11 - 25th December 2023
									 
                                Copyright (C) Taraezor / Chris Birch
                                         All Rights Reserved

                                ----o----(||)----oo----(||)----o----
]]

local myName, ns = ...
ns.db = {}
-- From Data.lua
ns.points = {}
ns.textures = {}
ns.texturesNum = {}
ns.scaling = {}
ns.scalingNum = 0
-- Pink theme
ns.colour = {}
ns.colour.prefix	= "\124cFFFF007F" -- Bright Pink
ns.colour.highlight = "\124cFFFF69B4" -- Hot Pink
ns.colour.plaintext = "\124cFFFFB2D0" -- Powder Pink

local defaults = { profile = { iconScale = 2.5, iconAlpha = 1, showCoords = false,
								hideIfRuneLearnt = true, iconChoice = 15 } }
local continents = {}
local pluginHandler = {}

-- Upvalues
local GameTooltip = _G.GameTooltip
local IsKnownRuneSpell = C_Engraving.IsKnownRuneSpell
local IsQuestFlaggedCompleted = C_QuestLog.IsQuestFlaggedCompleted
local LibStub = _G.LibStub
local UIParent = _G.UIParent
local UnitLevel = UnitLevel
local formatt, ipairs, next, type = format, ipairs, next, type
local HandyNotes = _G.HandyNotes

ns.name = UnitName( "player" ) or "角色"
ns.faction = UnitFactionGroup( "player" )
ns.classLocal, ns.class = UnitClass( "player" )
ns.raceList = { "Human", "Orc", "Dwarf", "Night Elf", "Undead", "Tauren", "Gnome", "Troll" }
ns.race = ns.raceList[ select( 3, UnitRace( "player" ) ) ]
ns.colour.class = "\124c" ..select( 4, GetClassColor( ns.class ) )

continents[ 1414 ] = true -- Kalimdor
continents[ 1415 ] = true -- Eastern Kingdoms

local function ShowPinForThisClassQuest( quests, level, forceCheck )

	if forceCheck == false and ns.db.hideIfRuneLearnt == false then return true end
	
	if level > ( UnitLevel( "player" ) + 1 ) then return false end

	if not HandyNotes_RunesDB then return true end -- too soon for the server
	if HandyNotes_RunesDB.questsDone == nil then HandyNotes_RunesDB.questsDone = {} end
	if HandyNotes_RunesDB.questsDone[ ns.class ] == nil then HandyNotes_RunesDB.questsDone[ ns.class ] = {} end
	if HandyNotes_RunesDB.questsDone[ ns.class ].quests == nil then HandyNotes_RunesDB.questsDone[ ns.class ].quests = {} end

	local completed = false
	
	if type( quests ) == "table" then
		for j,w in ipairs( quests ) do
			if w > 0 then
				if HandyNotes_RunesDB.questsDone[ ns.class ].quests[ w ] then
					completed = true
				else
					completed = IsQuestFlaggedCompleted( w )
					if completed == true then
						HandyNotes_RunesDB.questsDone[ ns.class ].quests[ w ] = true
					else
						return true
					end
				end
			end
		end
		return false
	elseif ( type( quests ) == "number" ) and ( quests > 0 ) then
		if HandyNotes_RunesDB.questsDone[ ns.class ].quests[ quests ] then
			return false
		end
		completed = IsQuestFlaggedCompleted( quests )
		if completed == true then
			HandyNotes_RunesDB.questsDone[ ns.class ].quests[ quests ] = true
			return false
		end
		return true
	else
		return false
	end
end

local function ShowPinForThisClassSpell( spell, forceCheck )

	if forceCheck == false and ns.db.hideIfRuneLearnt == false then return true end

	if not HandyNotes_RunesDB then return true end -- too soon for the server
	if HandyNotes_RunesDB.runesKnown == nil then HandyNotes_RunesDB.runesKnown = {} end
	if HandyNotes_RunesDB.runesKnown[ ns.class ] == nil then HandyNotes_RunesDB.runesKnown[ ns.class ] = {} end
	if HandyNotes_RunesDB.runesKnown[ ns.class ].spells == nil then HandyNotes_RunesDB.runesKnown[ ns.class ].spells = {} end

	if HandyNotes_RunesDB.runesKnown[ ns.class ].spells[ spell ] then
		return false
	end
	if not ns.runeCategories then
		ns.runeCategories = C_Engraving.GetRuneCategories( false, false ) -- returns 5, 7, 10
		if ns.runeCategories == nil then return true end -- too soon for the server
	end

	for _,cat in ipairs( ns.runeCategories ) do
		local engravingData = C_Engraving.GetRunesForCategory( cat, true )
		for _,ed in ipairs( engravingData ) do
			if ed.name == spell then
				HandyNotes_RunesDB.runesKnown[ ns.class ].spells[ spell ] = true
				return false
			end
		end
	end
	return true
end

function pluginHandler:OnEnter(mapFile, coord)
	if self:GetCenter() > UIParent:GetCenter() then
		GameTooltip:SetOwner(self, "ANCHOR_LEFT")
	else
		GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
	end

	local completed, quests, questNames;
	local pin = ns.points[mapFile] and ns.points[mapFile][coord]
	local previousEntry, spaceBeforeQuests = false, false
	
	if pin == "Quick Start" then	
		for k,v in pairs( ns.runes ) do
			if k == ns.class then
				local completed;
				GameTooltip:SetText( ns.colour.class ..ns.classLocal .." 快速開始 - " ..ns.name )
				for r,s in ipairs( v.spells ) do	
					completed = not ShowPinForThisClassSpell( s, true )
					GameTooltip:AddDoubleLine( ns.colour.prefix ..s .."   (" ..v[s].level .."+)",
							( completed == true ) and "\124cFF00FF00已完成" or "\124cFFFF0000未完成" )
					GameTooltip:AddLine( ns.colour.highlight ..v[s].rune )
					GameTooltip:AddLine( ns.colour.plaintext ..v[s].start )
				end
			end
		end

	else
		
		for i,v in ipairs( pin.class ) do

			if ns.class == v then
			
				-- Data will be typical spells or the new levelled quests type (currently only for priests)
			
				if not pin.level then			
					if previousEntry == true then GameTooltip:AddLine( "\n" ) end
					previousEntry = true
					GameTooltip:AddDoubleLine( ns.colour.prefix ..pin.spell[ i ] ..ns.colour.highlight .."\n(" 
												..ns.runes[ v ][ pin.spell[ i ] ].rune ..")",
												ns.colour.class ..ns.classLocal )
					GameTooltip:AddLine( ns.colour.highlight ..pin.name .."\n" )
				end
				
				-- Quests are listed as: (a) part of collecting the rune or (b) as a non-rune levelling guide
				-- If (a) then there must be a 1:1 spell and quest (single or table) for each class v
				-- If (b) then there must be a 1:1 quest (single or table) for each class v

				if pin.quest then
					-- Single quest for all classes is permitted. Always a table. Table within a table or number
					-- To avoid a class with no quest being given pin.quest[ 1 ], use {} - can't use nil 
					quests = ( pin.quest[ i ] ~= nil ) and pin.quest[ i ] or pin.quest[ 1 ]
					questsNames = ( pin.questName[ i ] ~= nil ) and pin.questName[ i ] or pin.questName[ 1 ]

					if type( quests ) == "table" then				
						-- Note that a class with a {} for quests will safely drop through here, thus not pulling in any quests
						for j,w in ipairs( quests ) do
							if pin.level then
								if previousEntry == false then
									previousEntry = true
									GameTooltip:AddDoubleLine( ns.colour.prefix ..pin.name, 
											ns.colour.highlight .."Level = " ..pin.level )
								end
							end
							if spaceBeforeQuests == false then GameTooltip:AddLine( "\n" ) end
							spaceBeforeQuests = true
							completed = IsQuestFlaggedCompleted( w )
							GameTooltip:AddDoubleLine( ns.colour.highlight ..questsNames[ j ],
									( completed == true ) and ( "\124cFF00FF00" .."已完成" .." (" ..ns.name ..")" ) 
									or ( "\124cFFFF0000" .."未完成" .." (" ..ns.name ..")" ) )
						end
					else
						if pin.level then
							if previousEntry == false then
								previousEntry = true
								GameTooltip:AddDoubleLine( ns.colour.prefix ..pin.name, 
										ns.colour.highlight .."Level = " ..pin.level )
							end
						end
						GameTooltip:AddLine( "\n" )
						completed = IsQuestFlaggedCompleted( quests )
						GameTooltip:AddDoubleLine( ns.colour.highlight ..questsNames,
								( completed == true ) and ( "\124cFF00FF00" .."已完成" .." (" ..ns.name ..")" ) 
									or ( "\124cFFFF0000" .."未完成" .." (" ..ns.name ..")" ) )
					end
				end
				
				if pin.level and ( previousEntry == true ) or not pin.level then
					if pin.tip then
						-- Table or string
						if type( pin.tip ) == "table" then
							if pin.tip[ i ] ~= nil then
								GameTooltip:AddLine( "\n" ..ns.colour.plaintext ..pin.tip[ i ] )
							end
						else
							-- Single tip for all classes is permitted
							GameTooltip:AddLine( "\n" ..ns.colour.plaintext ..pin.tip )
						end
					end
					
					if pin.guide then
						-- Single guide for all classes is permitted. Always a table
						GameTooltip:AddLine( "\n" ..ns.colour.highlight .."指南\n\n" ..ns.colour.plaintext
									..( ( pin.guide[ i ] ~= nil ) and pin.guide[ i ] or pin.guide[ 1 ] ) )
					end
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
			if pin == "Quick Start" then
				for k,v in pairs( ns.runes ) do
					if k == ns.class then
						return coord, nil, ns.textures[ ns.db.iconChoice ],
							ns.db.iconScale * ns.scaling[ ns.db.iconChoice ] * 2, ns.db.iconAlpha
					end
				end
			else
				-- class and spell are aways 1:1 with indexing/existence
				-- BUT... I added level 17 priest help and that has no spell
				for i,v in ipairs( pin.class ) do
					if ns.class == v then
						if pin.faction then
							if pin.faction == ns.faction then
								if pin.spell then
									if ShowPinForThisClassSpell( pin.spell[ i ], false ) then
										return coord, nil, ns.texturesNum[ ns.runes[ v ][ pin.spell[ i ] ].icon ],
											ns.db.iconScale * ns.scalingNum, ns.db.iconAlpha
									end
								else
									return coord, nil, ns.textures[ ns.db.iconChoice ],
										ns.db.iconScale * ns.scaling[ ns.db.iconChoice ], ns.db.iconAlpha
								end
							end
						elseif pin.spell then
							if ShowPinForThisClassSpell( pin.spell[ i ], false ) then
								return coord, nil, ns.texturesNum[ ns.runes[ v ][ pin.spell[ i ] ].icon ],
									ns.db.iconScale * ns.scalingNum, ns.db.iconAlpha
							end
						elseif ShowPinForThisClassQuest( pin.quest[ i ], pin.level, false ) then
							return coord, nil, ns.textures[ ns.db.iconChoice ],
								ns.db.iconScale * ns.scaling[ ns.db.iconChoice ], ns.db.iconAlpha
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
					for i,v in ipairs( pin.class ) do
						if ns.class == v then
							if pin.faction then
								if pin.faction == ns.faction then
									if pin.level then
										AddToContinent()
									elseif ShowPinForThisClassSpell( pin.spell[ i ], false ) then
										AddToContinent()
									end
								end
							elseif pin.level then
								if ShowPinForThisClassQuest( pin.quest[ i ], pin.level, false ) then
									AddToContinent()
								end
							elseif ShowPinForThisClassSpell( pin.spell[ i ], false ) then
								AddToContinent()
							end
						end
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