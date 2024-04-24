deathlog_strings_ko = {
	-- fonts
	main_font = "Fonts\\2002.ttf",
	class_font = "Fonts\\2002.ttf",
	death_alert_font = "Fonts\\2002.ttf",
	mini_log_font = "Fonts\\2002.ttf",
	menu_font = "Fonts\\2002.ttf",
	deadliest_creature_container_font = "Fonts\\2002.ttf",
	creature_model_quote_font = "Fonts\\MORPHEUS.TTF",
	-- death alerts messages
	death_alert_default_message = "<level>레벨 <race> <class> <name> 가\n<zone> 에서 <source> 에게 죽었습니다.",
	death_alert_default_fall_message = "<level>레벨 <race> <class> <name> 가\n <zone> 에서 낙사로 죽었습니다.",
	death_alert_default_drown_message = "<level>레벨 <race> <class> <name> 가\n <zone> 에서 익사로 죽었습니다.",
	death_alert_default_slime_message = "<level>레벨 <race> <class> <name> 가\n <zone> 에서 산성에 죽었습니다.",
	death_alert_default_lava_message = "<level>레벨 <race> <class> <name> 가\n <zone> 에서 용암에 빠져 죽었습니다.",
	death_alert_default_fire_message = "<level>레벨 <race> <class> <name> 가\n <zone> 에서 불에 타 죽었습니다.",
	death_alert_default_fatigue_message = "<level>레벨 <race> <class> <name> 가\n <zone> 에서 피로사 하였습니다.",
	-- words
	corpse_word = "시체",
	of_word = "~의",
	minimap_btn_left_click = "|cFF666666좌클릭:|r 로그 열기",
	minimap_btn_right_click = "|cFF666666우클릭:|r ",
	class_word = "Class",
	killed_by_word = "Killed by",
	zone_instance_word = "Zone/Instance",
	date_word = "Date",
	last_words_word = "Last words",
	death_word = "Death",
	guild_word = "Guild",
	race_word = "Race",
	name_word = "Name",
	show_heatmap = "사망자 발생 구간 보기",
	-- tables
	class_table = {
		Warrior = "warrior",
		Rogue = "rogue",
		Mage = "mage",
		Priest = "priest",
		Paladin = "paladin",
		Shaman = "shaman",
		Druid = "druid",
		Warlock = "warlock",
		Hunter = "hunter",
	},
	tab_table = {
		{ value = "ClassStatisticsTab", text = "직업 통계" },
		{ value = "CreatureStatisticsTab", text = "사망 통계" },
		{ value = "InstanceStatisticsTab", text = "던전 통계" },
		{ value = "StatisticsTab", text = "지역 통계" },
		{ value = "LogTab", text = "로그" },
	},
	instance_tbl = {
		{ 33, "SHADOWFANGKEEP", "그림자송곳니 성채" },
		{ 36, "DEADMINES", "죽음의 폐광" },
		{ 34, "STORMWINDSTOCKADES", "스톰윈드 지하감옥" },
		{ 43, "WAILINGCAVERNS", "통곡의 동굴" },
		{ 47, "RAZORFENKRAUL", "가시덩굴 우리" },
		{ 48, "BLACKFATHOMDEEPS", "검은심연의 나락" },
		{ 90, "GNOMEREGAN", "놈리건" },
		{ 189, "SCARLETMONASTERY", "붉은십자군 수도원" },
		{ 70, "ULDAMAN", "울다만" },
		{ 109, "SUNKENTEMPLE", "가라앉은 사원" },
		{ 129, "RAZORFENDOWNS", "가시덩굴 구릉" },
		{ 209, "ZULFARAK", "줄파락" },
		{ 229, "BLACKROCKSPIRE", "검은바위 첨탑" },
		{ 230, "BLACKROCKDEPTHS", "검은바위 나락" },
		{ 289, "SCHOLOMANCE", "스칼로맨스" },
		{ 329, "STRATHOLME", "스트라솔름" },
		{ 349, "MARAUDON", "마라우돈" },
		{ 389, "RAGEFIRECHASM", "성난불길 협곡" },
		{ 429, "DIREMAUL", "혈투의 전장" },
		{ 469, "BLACKWINGLAIR", "검은날개 둥지" },
	},
	instance_map = {
		["그림자송곳니 성채"] = 33,
		["스톰윈드 지하감옥"] = 34,
		["죽음의 폐광"] = 36,
		["통곡의 동굴"] = 43,
		["가시덩굴 우리"] = 47,
		["검은심연의 나락"] = 48,
		["울다만"] = 70,
		["놈리건"] = 90,
		["가라앉은 사원"] = 109,
		["가시덩굴 구릉"] = 129,
		["붉은십자군 수도원"] = 189,
		["줄파락"] = 209,
		["검은바위 첨탑"] = 229,
		["검은바위 나락"] = 230,
		["스칼로맨스"] = 289,
		["스트라솔름"] = 329,
		["마라우돈"] = 349,
		["성난불길 협곡"] = 389,
		["혈투의 전장"] = 429,
		["검은날개 둥지"] = 469,
	},
	deathlog_zone_tbl = {
		["아제로스"] = 947,
		["듀로타"] = 1411,
		["멀고어"] = 1412,
		["불모의 땅"] = 1413,
		["칼림도어"] = 1414,
		["동부 왕국"] = 1415,
		["알터랙 산맥"] = 1416,
		["아라시 고원"] = 1417,
		["황야의 땅"] = 1418,
		["저주받은 땅"] = 1419,
		["티리스팔 숲"] = 1420,
		["은빛소나무숲"] = 1421,
		["서부 역병지대"] = 1422,
		["동부 역병지대"] = 1423,
		["힐스브래드 구릉지"] = 1424,
		["동부내륙지"] = 1425,
		["던 모로"] = 1426,
		["이글거리는 협곡"] = 1427,
		["불타는 평원"] = 1428,
		["엘윈 숲"] = 1429,
		["죽음의 고개"] = 1430,
		["그늘숲"] = 1431,
		["모단 호수"] = 1432,
		["붉은마루 산맥"] = 1433,
		["가시덤불 골짜기"] = 1434,
		["슬픔의 늪"] = 1435,
		["서부 몰락지대"] = 1436,
		["저습지"] = 1437,
		["텔드랏실"] = 1438,
		["어둠해안"] = 1439,
		["잿빛 골짜기"] = 1440,
		["버섯구름 봉우리"] = 1441,
		["돌발톱 산맥"] = 1442,
		["잊혀진 땅"] = 1443,
		["페랄라스"] = 1444,
		["먼지진흙 습지대"] = 1445,
		["타나리스"] = 1446,
		["아즈샤라"] = 1447,
		["악령의 숲"] = 1448,
		["운고로 분화구"] = 1449,
		["달의 숲"] = 1450,
		["실리더스"] = 1451,
		["여명의 설원"] = 1452,
	},
	id_to_quote = {
		[6] = "Yiieeeee! Me run!",
		[38] = "I see those fools at the Abbey sent some fresh meat for us.",
		[40] = "You no take candle!",
		[80] = "Yiieeeee! Me run!",
		[95] = "Ah, a chance to use this freshly sharpened blade.",
		[97] = "Grrrr... fresh meat!",
		[98] = "More bones to gnaw on...",
		[117] = "Grrrr... fresh meat!",
		[121] = "Ah, a chance to use this freshly sharpened blade.",
		[122] = "Ah, a chance to use this freshly sharpened blade.",
		[123] = "Grrrr... fresh meat!",
		[124] = "Grrrr... fresh meat!",
		[212] = "I'll crush you!",
		[257] = "Yiieeeee! Me run!",
		[314] = "Aber?  Is that you...?  Oh...I'm so hungry, Aber!  SO HUNGRY!!",
		[315] = "I shall spill your blood, &lt;class&gt;!",
		[327] = "You no take candle!",
		[412] = "DARKSHIRE...I HUNGER!!",
		[423] = "Grrrr... fresh meat!",
		[424] = "Grrrr... fresh meat!",
		[426] = "Grrrr... fresh meat!",
		[429] = "Grrrr... fresh meat!",
		[430] = "Grrrr... fresh meat!",
		[431] = "Grrrr... fresh meat!",
		[432] = "Grrrr... fresh meat!",
		[433] = "Grrrr... fresh meat!",
		[434] = "Grrrr... fresh meat!",
		[445] = "Grrrr... fresh meat!",
		[446] = "Grrrr... fresh meat!",
		[452] = "Grrrr... fresh meat!",
		[475] = "You no take candle!",
		[476] = "You no take candle!",
		[478] = "Grrrr... fresh meat!",
		[481] = "Ah, a chance to use this freshly sharpened blade.",
		[500] = "Grrrr... fresh meat!",
		[504] = "Ah, a chance to use this freshly sharpened blade.",
		[568] = "Grrrr... fresh meat!",
		[580] = "Grrrr... fresh meat!",
		[589] = "Feel the power of the Brotherhood!",
		[590] = "Ah, a chance to use this freshly sharpened blade.",
		[639] = "And stay down!",
		[644] = "VanCleef pay big for you heads!",
		[646] = "D'ah! Now you're making me angry!",
		[8891] = "You can't hide from us.  Prepare to burn!",
		[706] = "I gonna make you into mojo!",
		[709] = "Me smash! You die!",
		[712] = "Grrrr... fresh meat!",
		[946] = "Killing you be easy.",
		[1007] = "Grrrr... fresh meat!",
		[1008] = "Grrrr... fresh meat!",
		[1009] = "Grrrr... fresh meat!",
		[1010] = "Grrrr... fresh meat!",
		[1011] = "Grrrr... fresh meat!",
		[1012] = "Grrrr... fresh meat!",
		[1051] = "Feel the power of the Dark Iron Dwarves!",
		[1052] = "Feel the power of the Dark Iron Dwarves!",
		[1053] = "Feel the power of the Dark Iron Dwarves!",
		[1115] = "Crush!",
		[1117] = "Crush!",
		[1121] = "I gonna make you into mojo!",
		[1123] = "I gonna make you into mojo!",
		[1157] = "A living human... soon to be a dead like me.",
		[1158] = "A living human... soon to be a dead like me.",
		[1161] = "Crush!",
		[1162] = "Crush!",
		[1163] = "Crush!",
		[1164] = "Crush!",
		[1165] = "Crush!",
		[1166] = "Crush!",
		[1167] = "Crush!",
		[1172] = "Me no run from &lt;class&gt; like you!",
		[1173] = "Me no run from &lt;class&gt; like you!",
		[1174] = "Me no run from &lt;class&gt; like you!",
		[1175] = "Me no run from &lt;class&gt; like you!",
		[1176] = "Me no run from &lt;class&gt; like you!",
		[1179] = "I'll crush you!",
		[1180] = "Me smash! You die!",
		[1197] = "Crush!",
		[1202] = "Me no run from &lt;class&gt; like you!",
		[1211] = "I'll cut you!",
		[1222] = "Wahehe! I'm taking you down with me!",
		[1236] = "You no take candle!",
		[9545] = "",
		[9547] = "",
		[1657] = "Here to visit the family?  Die, fool!",
		[1674] = "Grrrr... fresh meat!",
		[1675] = "Grrrr... fresh meat!",
		[1716] = "Tell the Warden this prison is ours now!",
		[1755] = "The Defias shall succeed! No meek adventurer will stop us!",
		[1756] = "A living legend...",
		[1770] = "The Sons of Arugal will rise against all who challenge the power of the Moonrage!",
		[1939] = "Grrrr... fresh meat!",
		[1940] = "Grrrr... fresh meat!",
		[1941] = "Grrrr... fresh meat!",
		[1942] = "Grrrr... fresh meat!",
		[10184] = "How fortuitous. Usually, I must leave my lair in order to feed.",
		[10373] = "What the... nobody cleanses a furbolg in MY camp!  Face the wrath of Xabraxxis!",
		[10440] = "I shall take great pleasure in taking this poor wretch's life!  It's not too late, she needn't suffer in vain.  Turn back and her death shall be merciful!",
		[2252] = "I'll crush you!",
		[2253] = "I'll crush you!",
		[2254] = "I'll crush you!",
		[2287] = "I'll crush you!",
		[2338] = "Carnage!  May I spill blood in His name!",
		[2339] = "Carnage!  May I spill blood in His name!",
		[2564] = "I'll crush you!",
		[2566] = "I'll crush you!",
		[2567] = "I'll crush you!",
		[2691] = "Attack, my sisters! The troll must not escape!",
		[2716] = "I'll crush you!",
		[2717] = "I'll crush you!",
		[2748] = "Awake, ye servants! Defend the Disks!",
		[10940] = "Leave this place!",
		[2775] = "You've plundered our treasures too long.  Prepare to meet your watery grave!",
		[10996] = "Be cleansed by blade, filth!",
		[11075] = "Human flesh... must feed!",
		[2949] = "Grrrr... fresh meat!",
		[2950] = "Grrrr... fresh meat!",
		[2951] = "Grrrr... fresh meat!",
		[11443] = "I'll crush you!",
		[3275] = "I am slain!  Summon Verog!",
		[3276] = "You will be easy prey, &lt;class&gt;.",
		[3277] = "You will be easy prey, &lt;class&gt;.",
		[3278] = "My talons will shred your puny body, Orc.",
		[3282] = "There's the stolen shredder! Stop it or Lugwizzle will have our hides!",
		[3284] = "Get away from there!",
		[3285] = "Get away from there!",
		[11502] = "BY FIRE BE PURGED!",
		[3395] = "I am summoned!  Intruders, come to my tent and face your death!",
		[3397] = "I am slain!  Summon Verog!",
		[3667] = "Finally, my soul may rest... Oh, dearest Cerellean...",
		[3671] = "None can stand against the Serpent Lords!",
		[11886] = "Well, well. Looks like we got ourselves some competition. Get 'em boys!",
		[3927] = "I can't believe it! You've destroyed my pack... Now face my wrath!",
		[3975] = "Ah - I've been waiting for a real challenge!",
		[3976] = "At your side, milady!",
		[4003] = "I think the sounds came from over here. We'd better check it out.",
		[4004] = "What's going on here? Piznik! I knew we shouldn't have let you stick around!",
		[4062] = "No sign of the final explosives shipment to the west either.  Where are those lollygaggers?",
		[4275] = "Another falls!",
		[4287] = "The light condemns all who harbor evil.  Now you will die!",
		[4299] = "The light condemns all who harbor evil.  Now you will die!",
		[4301] = "The light condemns all who harbor evil.  Now you will die!",
		[4484] = "Assassins from that cult you found... Let's get moving before someone else finds us out here.",
		[4494] = "The light condemns all who harbor evil.  Now you will die!",
		[4540] = "The light condemns all who harbor evil.  Now you will die!",
		[12858] = "Everyone ready?",
		[12918] = "No!  You cannot be stronger than the Foulweald!  No!!",
		[12922] = "Alright I'm going! Stop yelling!",
		[4966] = "Please... please... Miss Proudmore. I didn't mean to...",
		[4969] = "All right, boss. You sure though? Just seems like a waste of good practice.",
		[4971] = "Whoa! This is way more than what I bargained for, you're on your own, Slim!",
		[5234] = "I'll crush you!",
		[5239] = "Me smash! You die!",
		[5240] = "I'll crush you!",
		[5255] = "Grrrr... fresh meat!",
		[5474] = "I'll crush you!",
		[6090] = "Ok, enough!  I give up!",
		[6180] = "Feel the power of the Brotherhood!",
		[6182] = "You won't ruin my lands, you scum!",
		[6221] = "A foul trogg if ever I saw one.  Die!",
		[6238] = "Ready when you are, warrior.",
		[6784] = "Okay, okay... gimmie a minute to rest now. You gone and beat me up good.",
		[7033] = "I'll crush you!",
		[7603] = "A foul trogg if ever I saw one.  Die!,",
	},
}
