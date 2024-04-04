local _, ns = ...
L = {}
ns.L = L

ns.locale = GetLocale()

ns.realm = GetNormalizedRealmName() -- On a fresh login this will return null
ns.oceania = { AmanThul = true, Barthilas = true, Caelestrasz = true, DathRemar = true,
			Dreadmaul = true, Frostmourne = true, Gundrak = true, JubeiThos = true, 
			Khazgoroth = true, Nagrand = true, Saurfang = true, Thaurissan = true,
			-- The following are Classic 1.15.x
			Yojamba = true, Remulos = true, Arugal = true, Felstriker = true,
			-- The following are Seasonal Classic 1.15.x
			Penance = true, Shadowstrike = true }
if ns.oceania[ ns.realm ] then
	ns.locale = "enGB"
end

setmetatable( L, { __index = function( L, key ) return key end } )

-- Firstly, translations I often use in all my AddOns

if ns.locale == "zhCN" then
	ns.L["Character"] = "角色"
	ns.L["Account"] = "账号"
	ns.L["Completed"] = "已完成"
	ns.L["Not Completed"] = "未完成"
	ns.L["Options"] = "选项"
	ns.L["Map Pin Size"] = "地图图钉的大小"
	ns.L["The Map Pin Size"] = "地图图钉的大小"
	ns.L["Map Pin Alpha"] = "地图图钉的透明度"
	ns.L["The alpha transparency of the map pins"] = "地图图钉的透明度"
	ns.L["Show Coordinates"] = "显示坐标"
	ns.L["Show Coordinates Description"] = "在世界地图和迷你地图上的工具提示中显示坐标"
	ns.L["Map Pin Selections"] = "地图图钉选择"
	ns.L["Gold"] = "金子"
	ns.L["Red"] = "红"
	ns.L["Blue"] = "蓝"
	ns.L["Green"] = "绿色"
	ns.L["Ring"] = "戒指"
	ns.L["Cross"] = "叉"
	ns.L["Diamond"] = "钻石"
	ns.L["Frost"] = "冰霜"
	ns.L["Cogwheel"] = "齿轮"
	ns.L["White"] = "白色"
	ns.L["Purple"] = "紫色"
	ns.L["Yellow"] = "黄色"
	ns.L["Grey"] = "灰色"
	ns.L["Mana Orb"] = "法力球"
	ns.L["Phasing"] = "同步"
	ns.L["Raptor egg"] = "迅猛龙蛋"
	ns.L["Stars"] = "星星"
	ns.L["Screw"] = "拧"
	ns.L["Left"] = "左"
	ns.L["Right"] = "右"
	ns.L["Try later"] = "目前不可能。稍后再试"

elseif ns.locale == "zhTW" then
	ns.L["Character"] = "角色"
	ns.L["Account"] = "帳號"
	ns.L["Completed"] = "完成"
	ns.L["Not Completed"] = "未完成"
	ns.L["Options"] = "選項"
	ns.L["Map Pin Size"] = "圖示大小"
	ns.L["The Map Pin Size"] = "地圖圖示的大小"
	ns.L["Map Pin Alpha"] = "圖示透明度"
	ns.L["The alpha transparency"] = "地圖圖示的透明度"
	ns.L["Show Coordinates"] = "顯示坐標"
	ns.L["Show Coordinates Description"] = "在世界地圖和小地圖上的浮動提示資訊中顯示坐標 "
	ns.L["Map Pin Selections"] = "選擇圖示"
	ns.L["Gold"] = "金幣"
	ns.L["Red"] = "紅色"
	ns.L["Blue"] = "藍色"
	ns.L["Green"] = "綠色"
	ns.L["Ring"] = "戒指"
	ns.L["Cross"] = "叉叉"
	ns.L["Diamond"] = "鑽石"
	ns.L["Frost"] = "冰霜"
	ns.L["Cogwheel"] = "齒輪"
	ns.L["White"] = "白色"
	ns.L["Purple"] = "紫色"
	ns.L["Yellow"] = "黃色"
	ns.L["Grey"] = "灰色"
	ns.L["Mana Orb"] = "法力球"
	ns.L["Phasing"] = "鏡像"
	ns.L["Raptor egg"] = "迅猛龍蛋"
	ns.L["Stars"] = "星星"
	ns.L["Screw"] = "螺絲"
	ns.L["Left"] = "左"
	ns.L["Right"] = "右"
	ns.L["Try later"] = "目前無法，請稍後再試。"
	
	-- 自行加入
	ns.L["Guide"] = "指南"
	ns.L["Runes"] = "符文"
	ns.L["Hide if the rune spell was learnt"] = "隱藏已學會的符文"
	ns.L["Will also hide copmpleted Icy Veins books (Mages)"] = "同時也要隱藏冰寒脈動之書 (法師)"
	ns.L["Icon"] = "數字"
	ns.L["Quick Start / Summary"] = "快速開始/總結"
	ns.L["1 = Cyan on Black\n2 = Green on Black\n3 = Magenta on Black\n4 = Red on Black\n5 = Yellow on Black"] = "1 = 天藍色\n2 = 綠色\n3 = 桃紅色\n4 = 紅色\n5 = 黃色"
	ns.L["Season"] = "賽季"
	ns.L["Phase"] = "階段"
	ns.L["Show"] = "顯示"
	ns.L["Will also hide completed Icy Veins books (Mages), Skill Books"] = "同時也會隱藏已完成的冰寒脈動書籍 (法師) 和技能書。"
	ns.L["1 = No Map Pin\n2 = Cyan on Black\n3 = Green on Black\n4 = Magenta on Black\n5 = Red on Black\n6 = Yellow on Black"] = "1 = 不顯示圖示\n2 = 青色黑底\n3 = 綠色黑底\n4 = 洋紅色黑底\n5 = 紅色黑底\n6 = 黃色黑底"

else
	ns.L["Character"] = "Character"
	ns.L["Account"] = "Account"
	ns.L["Completed"] = "Completed"
	ns.L["Not Completed"] = "Not Completed"
	ns.L["Options"] = "Options"
	ns.L["Map Pin Size"] = "Map Pin Size"
	ns.L["The Map Pin Size"] = "The Map Pin Size"
	ns.L["Map Pin Alpha"] = "Map Pin Alpha"
	ns.L["The alpha transparency of the map pins"] = "The alpha transparency of the map pins"
	ns.L["Show Coordinates"] = "Show Coordinates"
	ns.L["Show Coordinates Description"] = "Display coordinates in tooltips on the world map and the mini map"
	ns.L["Map Pin Selections"] = "Map Pin Selections"
	ns.L["Gold"] = "Gold"
	ns.L["Red"] = "Red"
	ns.L["Blue"] = "Blue"
	ns.L["Green"] = "Green"
	ns.L["Ring"] = "Ring"
	ns.L["Cross"] = "Cross"
	ns.L["Diamond"] = "Diamond"
	ns.L["Frost"] = "Frost"
	ns.L["Cogwheel"] = "Cogwheel"
	ns.L["White"] = "White"
	ns.L["Purple"] = "Purple"
	ns.L["Yellow"] = "Yellow"
	ns.L["Grey"] = ( ( ns.locale == "enUS" ) and "Gray" or "Grey" )
	ns.L["Mana Orb"] = "Mana Orb"
	ns.L["Phasing"] = "Phasing"
	ns.L["Raptor egg"] = "Raptor egg"
	ns.L["Stars"] = "Stars"
	ns.L["Screw"] = "Screw"
	ns.L["Left"] = "Left"
	ns.L["Right"] = "Right"
	ns.L["Try later"] = "Not possible at this time. Try later"
end

-- Translations specific to the Runes AddOn

if ns.locale == "zhCN" then
	ns.L["AddOn Description"] = "所有 SoD 符文。 （和更多！）。"
	ns.L["Arcane"] = "奥术"
	ns.L["Demonic"] = "恶魔"
	ns.L["Duty"] = "义务"
	ns.L["Hide if learnt"] = "如果学习了符文则隐藏"
	ns.L["Map Pin"] = "地图图钉"
	ns.L["Mjolnir"] = "雷神"
	ns.L["Phase 1 Summary"] = "第一阶段总结"
	ns.L["Phase 2 Summary"] = "第二阶段总结"
	ns.L["Runes"] = "符文"
	ns.L["Skill Book"] = "技能书"
	-- Druid Phase 1
	ns.L["Fury of Stormrage"] = "怒风之怒"
	ns.L["Lacerate"] = "割伤"
	ns.L["Lifebloom"] = "生命绽放"
	ns.L["Living Seed"] = "生命之种"
	ns.L["Mangle"] = "割碎"
	ns.L["Savage Roar"] = "野蛮咆哮"
	ns.L["Skull Bash"] = "迎头痛击"
	ns.L["Starsurge"] = "星涌术"
	ns.L["Sunfire"] = "阳炎术"
	ns.L["Survival of the Fittest"] = "优胜劣汰"
	ns.L["Wild Growth"] = "野性成长"
	ns.L["Wild Strikes"] = "狂野打击"
	-- Druid Phase 2
	ns.L["Berserk"] = "狂暴"
	ns.L["Deeper Wilds"] = "野性深远"
	ns.L["Dreamstate"] = "迷梦"
	ns.L["Eclipse"] = "日月之蚀"
	ns.L["Enhanced Restoration"] = "强化恢复"
	ns.L["King of the Jungle"] = "丛林之王"
	ns.L["Nourish"] = "滋养"
	ns.L["Revive"] = "起死回生"
	ns.L["Survival Instincts"] = "生存本能"
	-- Hunter Phase 1
	ns.L["Beast Mastery"] = "野兽控制"
	ns.L["Carve"] = "削凿"
	ns.L["Chimera Shot"] = "奇美拉射击"
	ns.L["Cobra Strikes"] = "眼镜蛇打击"
	ns.L["Explosive Shot"] = "爆炸射击"
	ns.L["Flanking Strike"] = "侧翼打击"
	ns.L["Heart of the Lion"] = "雄狮之心"
	ns.L["Kill Command"] = "杀戮命令"
	ns.L["Lone Wolf"] = "独来独往"
	ns.L["Master Marksman"] = "神射手"
	ns.L["Serpent Spread"] = "毒蛇扩散"
	ns.L["Sniper Training"] = "狙击训练"
	-- Hunter Phase 2
	ns.L["Aspect of the Viper"] = "蝰蛇守护"
	ns.L["Dual Wield Specialization"] = "双武器专精"
	ns.L["Expose Weakness"] = "破甲虚弱"
	ns.L["Invigoration"] = "鼓舞"
	ns.L["Melee Specialist"] = "近战专家"
	ns.L["Steady Shot"] = "稳固射击"
	ns.L["Trap Launcher"] = "陷阱发射器"
	-- Mage Phase 1
	ns.L["Arcane Blast"] = "奥术冲击"
	ns.L["Arcane Surge"] = "奥术涌动"
	ns.L["Burnout"] = "燃尽"
	ns.L["Enlightenment"] = "启迪"
	ns.L["Fingers of Frost"] = "寒冰指"
	ns.L["Ice Lance"] = "冰枪术"
	ns.L["Icy Veins"] = "冰冷血脉"
	ns.L["Living Bomb"] = "活动炸弹"
	ns.L["Living Flame"] = "活体烈焰"
	ns.L["Mass Regeneration"] = "群体再生"
	ns.L["Regeneration"] = "再生"
	ns.L["Rewind Time"] = "时光倒转"
	-- Mage Phase 2
	ns.L["Brain Freeze"] = "冰冷智慧"
	ns.L["Chronostatic Preservation"] = "凝时恩护"
	ns.L["Expanded Intellect"] = "智慧延展"
	ns.L["Frostfire Bolt"] = "霜火之箭"
	ns.L["Hot Streak"] = "炽热连击"
	ns.L["Missile Barrage"] = "飞弹连射"
	ns.L["Spell Power"] = "法术强权"
	ns.L["Spellfrost Bolt"] = "法术冰霜箭"
	-- Paladin Phase 1
	ns.L["Aegis"] = "神盾"
	ns.L["Avenger's Shield"] = "复仇者之盾"
	ns.L["Beacon of Light"] = "圣光道标"
	ns.L["Crusader Strike"] = "十字军打击"
	ns.L["Exorcist"] = "驱魔人"
	ns.L["Divine Sacrifice"] = "神圣牺牲"
	ns.L["Divine Storm"] = "神圣风暴"
	ns.L["Hand of Reckoning"] = "清算之手"
	ns.L["Horn of Lordaeron"] = "洛丹伦号角"
	ns.L["Inspiration Exemplar"] = "激励典范"
	ns.L["Rebuke"] = "责难"
	ns.L["Seal of Martyrdom"] = "殉道圣印"
	-- Paladin Phase 2
	ns.L["Enhanced Blessings"] = "强化祝福"
	ns.L["Enlightened Judgements"] = "开明审判"
	ns.L["Guarded by the Light"] = "圣光守护"
	ns.L["Infusion of Light"] = "圣光灌注"
	ns.L["Sacred Shield"] = "圣洁护盾"
	ns.L["Sheath of Light"] = "圣光出鞘"
	ns.L["The Art of War"] = "战争艺术"
	-- Priest Phase 1
	ns.L["Circle of Healing"] = "治疗之环"
	ns.L["Homunculi"] = "裂魂魔"
	ns.L["Mind Sear"] = "精神灼烧"
	ns.L["Penance"] = "苦修"
	ns.L["Power Word: Barrier"] = "真言术：障"
	ns.L["Prayer of Mending"] = "愈合祷言"
	ns.L["Serendipity"] = "妙手回春"
	ns.L["Shadow Word: Death"] = "暗言术：灭"
	ns.L["Shared Pain"] = "分担痛苦"
	ns.L["Strength of Soul"] = "灵魂之力"
	ns.L["Twisted Faith"] = "扭曲信仰"
	ns.L["Void Plague"] = "虚空疫病"
	-- Priest Phase 2
	ns.L["Dispersion"] = "消散"
	ns.L["Empowered Renew"] = "恢复增效"
	ns.L["Increased Fortitude"] = "强化坚韧"
	ns.L["Mind Spike"] = "心灵尖刺"
	ns.L["Pain Suppression"] = "痛苦压制"
	ns.L["Renewed Hope"] = "新生希望"
	ns.L["Shadowfiend"] = "暗影魔"
	ns.L["Spirit of the Redeemer"] = "救赎者之魂"
	-- Rogue Phase 1
	ns.L["Between the Eyes"] = "正中眉心"
	ns.L["Blade Dance"] = "刃舞"
	ns.L["Deadly Brew"] = "致命阴谋"
	ns.L["Envenom"] = "毒伤"
	ns.L["Just a Flesh Wound"] = "只是皮肉伤"
	ns.L["Main Gauche"] = "左右开弓"
	ns.L["Mutilate"] = "毁伤"
	ns.L["Quick Draw"] = "速射"
	ns.L["Saber Slash"] = "军刀猛刺"
	ns.L["Shadowstrike"] = "暗影打击"
	ns.L["Slaughter from the Shadows"] = "暗影杀手"
	ns.L["Shiv"] = "毒刃"
	-- Rogue Phase 2
	ns.L["Master of Subtlety"] = "敏锐大师"
	ns.L["Poisoned Knife"] = "剧毒之刃"
	ns.L["Redirect"] = "转嫁"
	ns.L["Rolling with the Punches"] = "闪转腾挪"
	ns.L["Shadowstep"] = "暗影步"
	ns.L["Shuriken Toss"] = "飞镖投掷"
	ns.L["Waylay"] = "埋伏"
	-- Shaman Phase 1
	ns.L["Ancestral Guidance"] = "先祖指引"
	ns.L["Dual Wield Specialization"] = "双武器专精"
	ns.L["Earth Shield"] = "大地之盾"
	ns.L["Healing Rain"] = "治疗之雨"
	ns.L["Lava Burst"] = "熔岩爆裂"
	ns.L["Lava Lash"] = "熔岩猛击"
	ns.L["Molten Blast"] = "熔火爆裂"
	ns.L["Overload"] = "过载"
	ns.L["Shamanistic Rage"] = "萨满之怒"
	ns.L["Shield Mastery"] = "盾牌精通"
	ns.L["Way of Earth"] = "土之道"
	ns.L["Water Shield"] = "水之护盾"
	-- Shaman Phase 2
	ns.L["Ancestral Awakening"] = "先祖复苏"
	ns.L["Decoy Totem"] = "诱饵图腾"
	ns.L["Fire Nova"] = "火焰新星"
	ns.L["Maelstrom Weapon"] = "漩涡武器"
	ns.L["Power Surge"] = "能量涌动"
	ns.L["Spirit of the Alpha"] = "头狼之魂"
	ns.L["Totemic Projection"] = "图腾投射"
	ns.L["Two-Handed Mastery"] = "双手精通"
	-- Warlock Phase 1
	ns.L["Chaos Bolt"] = "混乱之箭"
	ns.L["Demonic Grace"] = "恶魔优雅"
	ns.L["Demonic Pact"] = "恶魔契约"
	ns.L["Demonic Tactics"] = "恶魔战术"
	ns.L["Everlasting Affliction"] = "持久痛苦"
	ns.L["Haunt"] = "鬼影缠身"
	ns.L["Incinerate"] = "烧尽"
	ns.L["Lake of Fire"] = "火焰之湖"
	ns.L["Master Channeler"] = "引导大师"
	ns.L["Metamorphosis"] = "恶魔变形"
	ns.L["Shadow Bolt Volley"] = "暗影箭雨"
	ns.L["Soul Siphon"] = "灵魂虹吸"
	-- Warlock Phase 2
	ns.L["Dance of the Wicked"] = "堕落之舞"
	ns.L["Demonic Knowledge"] = "恶魔知识"
	ns.L["Grimoire of Synergy"] = "协同魔典"
	ns.L["Invocation"] = "祈告"
	ns.L["Portal of Summoning"] = "召唤传送门"
	ns.L["Shadow and Flame"] = "影与焰"
	ns.L["Shadowflame"] = "暗影烈焰"
	ns.L["Soul Harvesting"] = "灵魂收割"
	-- Warrior Phase 1
	ns.L["Blood Frenzy"] = "血之狂暴"
	ns.L["Consumed by Rage"] = "噬心狂怒"
	ns.L["Devastate"] = "毁灭打击"
	ns.L["Endless Rage"] = "无尽怒气"
	ns.L["Flagellation"] = "狂热鞭笞"
	ns.L["Frenzied Assault"] = "狂乱攻击"
	ns.L["Furious Thunder"] = "狂怒雷霆"
	ns.L["Quick Strike"] = "迅捷打击"
	ns.L["Raging Blow"] = "怒击"
	ns.L["Single-Minded Fury"] = "鲁莽怒火"
	ns.L["Victory Rush"] = "乘胜追击"
	ns.L["Warbringer"] = "战神"
	-- Warrior Phase 2
	ns.L["Blood Surge"] = "血涌"
	ns.L["Commanding Shout"] = "命令怒吼"
	ns.L["Enraged Regeneration"] = "狂怒回复"
	ns.L["Focused Rage"] = "怒火聚焦"
	ns.L["Intervene"] = "援护"
	ns.L["Precise Timing"] = "精准猛击"
	ns.L["Rallying Cry"] = "集结呐喊"

elseif ns.locale == "zhTW" then
	ns.L["AddOn Description"] = "所有 SoD 符文。 （和更多！）。"
	ns.L["Arcane"] = "奧術"
	ns.L["Demonic"] = "惡魔"
	ns.L["Duty"] = "義務"
	ns.L["Hide if learnt"] = "隱藏已學會的符文"
	ns.L["Map Pin"] = "地圖圖示"
	ns.L["Mjolnir"] = "雷神"
	ns.L["Phase 1 Summary"] = "第一階段總結"
	ns.L["Phase 2 Summary"] = "第二階段總結"
	ns.L["Runes"] = "符文"
	ns.L["Skill Book"] = "技能書"
	-- Druid Phase 1
	ns.L["Fury of Stormrage"] = "怒風之怒"
	ns.L["Lacerate"] = "割傷"
	ns.L["Lifebloom"] = "生命綻放"
	ns.L["Living Seed"] = "生命之種"
	ns.L["Mangle"] = "割碎"
	ns.L["Savage Roar"] = "野蠻咆哮"
	ns.L["Skull Bash"] = "迎頭痛擊"
	ns.L["Starsurge"] = "星湧術"
	ns.L["Sunfire"] = "陽炎術"
	ns.L["Survival of the Fittest"] = "優勝劣汰"
	ns.L["Wild Growth"] = "野性成長"
	ns.L["Wild Strikes"] = "狂野打擊"
	-- Druid Phase 2
	ns.L["Berserk"] = "狂暴"
	ns.L["Deeper Wilds"] = "野性深遠"
	ns.L["Dreamstate"] = "迷夢"
	ns.L["Eclipse"] = "日月之蝕"
	ns.L["Enhanced Restoration"] = "強化恢復"
	ns.L["King of the Jungle"] = "叢林之王"
	ns.L["Nourish"] = "滋養"
	ns.L["Revive"] = "起死回生"
	ns.L["Survival Instincts"] = "生存本能"
	-- Hunter Phase 1
	ns.L["Beast Mastery"] = "野獸控制"
	ns.L["Carve"] = "削鑿"
	ns.L["Chimera Shot"] = "奇美拉射擊"
	ns.L["Cobra Strikes"] = "眼鏡蛇打擊"
	ns.L["Explosive Shot"] = "爆炸射擊"
	ns.L["Flanking Strike"] = "側翼打擊"
	ns.L["Heart of the Lion"] = "雄獅之心"
	ns.L["Kill Command"] = "殺戮命令"
	ns.L["Lone Wolf"] = "獨來獨往"
	ns.L["Master Marksman"] = "神射手"
	ns.L["Serpent Spread"] = "毒蛇擴散"
	ns.L["Sniper Training"] = "狙擊訓練"
	-- Hunter Phase 2
	ns.L["Aspect of the Viper"] = "蝰蛇守護"
	ns.L["Dual Wield Specialization"] = "雙武器專精"
	ns.L["Expose Weakness"] = "破甲虛弱"
	ns.L["Invigoration"] = "鼓舞"
	ns.L["Melee Specialist"] = "近戰專家"
	ns.L["Steady Shot"] = "穩固射擊"
	ns.L["Trap Launcher"] = "陷阱發射器"
	-- Mage Phase 1
	ns.L["Arcane Blast"] = "奧術衝擊"
	ns.L["Arcane Surge"] = "奧術湧動"
	ns.L["Burnout"] = "燃盡"
	ns.L["Enlightenment"] = "啟迪"
	ns.L["Fingers of Frost"] = "寒冰指"
	ns.L["Ice Lance"] = "冰槍術"
	ns.L["Icy Veins"] = "冰冷血脈"
	ns.L["Living Bomb"] = "活動炸彈"
	ns.L["Living Flame"] = "活體烈焰"
	ns.L["Mass Regeneration"] = "群體再生"
	ns.L["Regeneration"] = "再生"
	ns.L["Rewind Time"] = "時光倒轉"
	-- Mage Phase 2
	ns.L["Brain Freeze"] = "冰冷智慧"
	ns.L["Chronostatic Preservation"] = "凝時恩護"
	ns.L["Expanded Intellect"] = "智慧延展"
	ns.L["Frostfire Bolt"] = "霜火之箭"
	ns.L["Hot Streak"] = "熾熱連擊"
	ns.L["Missile Barrage"] = "飛彈連射"
	ns.L["Spell Power"] = "法術強權"
	ns.L["Spellfrost Bolt"] = "法術冰霜箭"
	-- Paladin Phase 1
	ns.L["Aegis"] = "神盾"
	ns.L["Avenger's Shield"] = "復仇者之盾"
	ns.L["Beacon of Light"] = "聖道標"
	ns.L["Crusader Strike"] = "十字軍打擊"
	ns.L["Exorcist"] = "驅魔人"
	ns.L["Divine Sacrifice"] = "神聖犧牲"
	ns.L["Divine Storm"] = "神聖風暴"
	ns.L["Hand of Reckoning"] = "清算之手"
	ns.L["Horn of Lordaeron"] = "洛丹倫號角"
	ns.L["Inspiration Exemplar"] = "激勵典範"
	ns.L["Rebuke"] = "責難"
	ns.L["Seal of Martyrdom"] = "殉道聖印"
	-- Paladin Phase 2
	ns.L["Enhanced Blessings"] = "強化祝福"
	ns.L["Enlightened Judgements"] = "開明審判"
	ns.L["Guarded by the Light"] = "聖光守護"
	ns.L["Infusion of Light"] = "聖光灌注"
	ns.L["Sacred Shield"] = "聖潔護盾"
	ns.L["Sheath of Light"] = "聖光出鞘"
	ns.L["The Art of War"] = "戰爭藝術"
	-- Priest Phase 1
	ns.L["Circle of Healing"] = "治療之環"
	ns.L["Homunculi"] = "裂魂魔"
	ns.L["Mind Sear"] = "精神灼燒"
	ns.L["Penance"] = "苦修"
	ns.L["Power Word: Barrier"] = "真言術：障"
	ns.L["Prayer of Mending"] = "癒合禱言"
	ns.L["Serendipity"] = "妙手回春"
	ns.L["Shadow Word: Death"] = "暗言術：滅"
	ns.L["Shared Pain"] = "分擔痛苦"
	ns.L["Strength of Soul"] = "靈魂之力"
	ns.L["Twisted Faith"] = "扭曲信仰"
	ns.L["Void Plague"] = "虛空疫病"
	-- Priest Phase 2
	ns.L["Dispersion"] = "消散"
	ns.L["Empowered Renew"] = "恢復增效"
	ns.L["Increased Fortitude"] = "強化堅韌"
	ns.L["Mind Spike"] = "心靈尖刺"
	ns.L["Pain Suppression"] = "痛苦壓制"
	ns.L["Renewed Hope"] = "新生希望"
	ns.L["Shadowfiend"] = "暗影魔"
	ns.L["Spirit of the Redeemer"] = "救贖者之魂"
	-- Rogue Phase 1
	ns.L["Between the Eyes"] = "正中眉心"
	ns.L["Blade Dance"] = "刃舞"
	ns.L["Deadly Brew"] = "致命陰謀"
	ns.L["Envenom"] = "毒傷"
	ns.L["Just a Flesh Wound"] = "只是皮肉傷"
	ns.L["Main Gauche"] = "左右開弓"
	ns.L["Mutilate"] = "毀傷"
	ns.L["Quick Draw"] = "速射"
	ns.L["Saber Slash"] = "軍刀猛刺"
	ns.L["Shadowstrike"] = "暗影打擊"
	ns.L["Slaughter from the Shadows"] = "暗影殺手"
	ns.L["Shiv"] = "毒刃"
	-- Rogue Phase 2
	ns.L["Master of Subtlety"] = "敏銳大師"
	ns.L["Poisoned Knife"] = "劇毒之刃"
	ns.L["Redirect"] = "轉嫁"
	ns.L["Rolling with the Punches"] = "閃轉騰挪"
	ns.L["Shadowstep"] = "暗影步"
	ns.L["Shuriken Toss"] = "飛鏢投擲"
	ns.L["Waylay"] = "埋伏"
	-- Shaman Phase 1
	ns.L["Ancestral Guidance"] = "先祖指引"
	ns.L["Dual Wield Specialization"] = "雙武器專精"
	ns.L["Earth Shield"] = "大地之盾"
	ns.L["Healing Rain"] = "治療之雨"
	ns.L["Lava Burst"] = "熔岩爆裂"
	ns.L["Lava Lash"] = "熔岩猛擊"
	ns.L["Molten Blast"] = "熔火爆裂"
	ns.L["Overload"] = "過載"
	ns.L["Shamanistic Rage"] = "薩滿之怒"
	ns.L["Shield Mastery"] = "盾牌精通"
	ns.L["Way of Earth"] = "土之道"
	ns.L["Water Shield"] = "水之護盾"
	-- Shaman Phase 2
	ns.L["Ancestral Awakening"] = "先祖復甦"
	ns.L["Decoy Totem"] = "誘餌圖騰"
	ns.L["Fire Nova"] = "火焰新星"
	ns.L["Maelstrom Weapon"] = "漩渦武器"
	ns.L["Power Surge"] = "能量湧動"
	ns.L["Spirit of the Alpha"] = "頭狼之魂"
	ns.L["Totemic Projection"] = "圖騰投射"
	ns.L["Two-Handed Mastery"] = "雙手精通"
	-- Warlock Phase 1
	ns.L["Chaos Bolt"] = "混亂之箭"
	ns.L["Demonic Grace"] = "惡魔優雅"
	ns.L["Demonic Pact"] = "惡魔契約"
	ns.L["Demonic Tactics"] = "惡魔戰術"
	ns.L["Everlasting Affliction"] = "持久痛苦"
	ns.L["Haunt"] = "鬼影纏身"
	ns.L["Incinerate"] = "燒盡"
	ns.L["Lake of Fire"] = "火焰之湖"
	ns.L["Master Channeler"] = "引導大師"
	ns.L["Metamorphosis"] = "惡魔變形"
	ns.L["Shadow Bolt Volley"] = "暗影箭雨"
	ns.L["Soul Siphon"] = "靈魂虹吸"
	-- Warlock Phase 2
	ns.L["Dance of the Wicked"] = "墮落之舞"
	ns.L["Demonic Knowledge"] = "惡魔知識"
	ns.L["Grimoire of Synergy"] = "協同魔典"
	ns.L["Invocation"] = "祈告"
	ns.L["Portal of Summoning"] = "召喚傳送門"
	ns.L["Shadow and Flame"] = "影與焰"
	ns.L["Shadowflame"] = "暗影烈焰"
	ns.L["Soul Harvesting"] = "靈魂收割"
	-- Warrior Phase 1
	ns.L["Blood Frenzy"] = "血之狂暴"
	ns.L["Consumed by Rage"] = "噬心狂怒"
	ns.L["Devastate"] = "毀滅打擊"
	ns.L["Endless Rage"] = "無盡怒氣"
	ns.L["Flagellation"] = "狂熱鞭笞"
	ns.L["Frenzied Assault"] = "狂亂攻擊"
	ns.L["Furious Thunder"] = "狂怒雷霆"
	ns.L["Quick Strike"] = "迅捷打擊"
	ns.L["Raging Blow"] = "怒擊"
	ns.L["Single-Minded Fury"] = "魯莽怒火"
	ns.L["Victory Rush"] = "乘勝追擊"
	ns.L["Warbringer"] = "戰神"
	-- Warrior Phase 2
	ns.L["Blood Surge"] = "血湧"
	ns.L["Commanding Shout"] = "命令怒吼"
	ns.L["Enraged Regeneration"] = "狂怒回覆"
	ns.L["Focused Rage"] = "怒火聚焦"
	ns.L["Intervene"] = "援助"
	ns.L["Precise Timing"] = "精準猛擊"
	ns.L["Rallying Cry"] = "集結吶喊"
	ns.L["Rallying Cry"] = "集結吶喊"

else
	ns.L["AddOn Description"] = "All the SoD Runes. (And more!)"
	ns.L["Hide if learnt"] = "Hide if the rune was learnt"
end