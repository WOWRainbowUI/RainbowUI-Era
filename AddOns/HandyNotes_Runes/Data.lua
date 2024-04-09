local _, ns = ...
local points = ns.points
local colourPrefix		= ns.colour.prefix
local colourHighlight	= ns.colour.highlight
local colourPlaintext	= ns.colour.plaintext

--=======================================================================================================
--
-- LOCAL TEXT
--
--=======================================================================================================

local st = { druid={}, hunter={}, mage={}, paladin={}, priest={}, rogue={}, shaman={}, warlock={}, warrior={} }

-- Druid Phase 1
st.druid.ferocious = "可從西部荒野的許多河爪怪物、黑海岸的巢穴之母、銀松森林的蒼白者格里姆森，以及貧瘠之地三個半人馬寶箱中獲得。\n\n獲得並裝備後，對人形生物造成 20 次流血傷害。再次點擊神像以最終激活。"

st.druid.ursineRage = "聯盟可以殺死泰達希爾的怒爪。部落可以殺死莫高雷的風險投資公司主管或剛毛野豬入侵者。\n\n兩個陣營都可以刷平原徘徊者、草原狼首領、利爪俯衝者、風怒女族長和女巫。\n\n查看神像的工具提示。保持怒氣！"

st.druid.idolWild = "只需拾取怪物掉落的物品。然後裝備/右鍵點擊。對友方生物進行 10 次直接治療。現在再次點擊神像。"

st.druid.lunarIdolA = "從 4 級以上的瑪丹特·強戈奧克那裡獲得卡多雷的遺物任務。\n\n殺死格雷爾金以獲得月神神像。裝備。\n\n現在殺死 6 個受月火術影響的怪物。現在再次點擊神像。"

st.druid.lunarIdolH = "前往荊棘葉峽谷。\n\n拾取寶箱並裝備。\n\n現在殺死 6 個受月火術影響的怪物。現在再次點擊神像。"
st.druid.naturalPotential = "收集 3 個莫高雷的草原花朵（部落）或 3 個泰達希爾的林間花朵（聯盟）。\n\n將它們組合成一個草原/林間花冠。\n\n前往 (37.60,49.50)（部落）或 (66.90,57.70)（聯盟）。\n\n等待木質雕像生成。對它使用花冠。殺死靈魂。拾取掉落物。"

st.druid.lacerate = "聯盟最好前往洛克莫丹湖邊的卡拉·深水。購買一些彩虹鰭金槍魚誘餌（5 銀），然後將其餵給湖中的幼年瑟雷薩登。\n\n部落應該前往貧瘠之地，尋找一個廢棄的迅猛龍巢穴。拿起蛋，然後將其放入一個空的迅猛龍巢穴中。等待，然後點擊幼龍以獲得你的掉落物！\n\n兩個陣營都可以前往黑海岸。從黑木怪物身上刷取螃蟹零食，或者釣魚獲得。然後餵給幼年礁石爬行者（螃蟹）。\n\n或者前往西部荒野，從迪菲亞怪物身上刷取魔法南瓜種子。種植一個種子。殺死攻擊性的南瓜幼苗。獲利！\n\n銀松森林的月怒白頭皮和暗影行者也會掉落一個不平衡的神像。閱讀其工具提示。你需要 5 層三種增益效果。使用你的月火術、癒合之觸或生命之種，並在殺戮時變形。"

st.druid.runeOfStars = "找到格魯吉姆登，在一座小橋下。然後前往樹樁。只有在樹樁處才應該吃蘑菇。剩下的就順理成章了。\n\n在幫助或靈魂奔跑的情況下可以提前完成。"

st.druid.runeOfTheSun = "部落前往莫高雷，對三個附近的月石施放月火術。聯盟必須前往泰達希爾，注意其中兩個石頭在樹枝上。現在點擊月神寶箱。是的，這很簡單！"
st.druid.swim = "從東邊的雕像/地圖標記開始。\n（如果你分析地形，你就會明白為什麼）。以水生形態游到西邊的雕像，爬上去點擊以獲得獎勵。以水生形態從東到西，你會有充足的時間。"

st.druid.wildGrowth = "大約 21 級以上時，前往月光林地的訓練師洛加納爾。開始貓頭鷹試煉。\n注意：你可以在接取任務之前獲得三隻貓頭鷹。第一隻貓頭鷹：灰谷，第二隻貓頭鷹：暮色森林，第三隻貓頭鷹：希爾斯布萊德。只需交還任務即可獲得你的符文！"
-- Druid Phase 2
st.druid.berserk = "在扎伊恩基／野獸雕像的位置使用挑戰咆哮（28級）。殺死怪物並獲利。"
st.druid.dreamstate = "殺死科爾卡半人馬（30-31級）\n直到他們掉落乾枯的種子莢。\n\n"
			.."向南走，在任何池塘中游泳，直到它\n重新水化 ->  薩特草球莖。\n\n"
			.."現在向北前往薩格隆廢墟，\n將球莖種植在沙壤土堆中。\n"
			.."點擊它即可獲得你的 phat lewt 符文！"
st.druid.nourish = "殺死 40 級的腐爛古樹，以獲得\n腐爛的種子並開始“失落的古樹”。\n\n"
			.."你現在必須與月光林地的奧羅凱交談。\n\n小心，因為後續任務有 1 小時的時間限制\n"
			.."你在此期間不能死亡、使用爐石、傳送、接受\n法師傳送門等。\n\n（（船/飛艇/飛行\n"
			.."路徑是可以的，但在 PvP 伺服器上受限））\n\n你必須在奧特蘭克山脈、阿拉希高地、\n悲伤沼澤和荊棘谷澆灌一棵古樹幼苗，順序任意。最佳\n"
			.."順序是將荊棘谷留到最後，因為你必須\n然後返回奧羅凱"
-- Druid Phase 3
st.druid.efflorescence = "從菲拉斯的泰里修斯那裡接取“守護者的智慧”（45級）。你現在必須拜訪三位守護者之魂。\n\n"
			.."艾薩拉：殺死遊蕩的阿帕羅之子。免疫法術，所以要用熊/貓形態進行物理攻擊。在野獸之祠祭壇上獻上\n"
			.."掉落的心臟。召喚並殺死低語之翼。\n\n"
			.."菲拉斯：對自己使用移除詛咒和治療毒藥。\n與食人魔和刺lash者戰鬥以獲得這些效果。完成後，你將\n"
			.."獲得典獄官標記增益效果。在神殿殺死枯萎樹皮。\n\n辛特蘭：在月梟化身處對自己施放寧靜\n"
			.."然後施放颶風。賢者之羽將會出現。殺死它。"
st.druid.elunesFires = "前往艾薩拉西部哈達爾營地山頂上的破敗神廟。\n\n"
			.."拾取旅行者的背包：凱爾達拉的\n日誌和研缽和研杵。\n\n"
			.."從神廟\n場地獲得 3 個薩特草樣本。使用研缽和研杵 ->  酊劑。\n\n"
			.."對西北方向發現的腐化的（綠色的）角鷹獸施放休眠，\n現在使用酊劑。\n\n檢查你的背包以獲取戰利品"
st.druid.improvedBarkskin = "學習樹皮術（44級）後，前往\n塔納利斯西南角，並農\n"
			.."薊灌木露水收集者（47-48級）\n以獲得狂暴蹒跚者的偶像。\n\n"
			.."裝備偶像。在\n樹皮術增益效果下擊敗 5 個敵人。這會在偶像上\n"
			.."充能五次。右鍵點擊它"

-- Hunter Phase 1
st.hunter.beastMastery = "在西部荒野刷取許多戈雷塔斯克野豬的戈雷塔斯克豬腿，然後用它來生成銀色駿馬。殺死並拾取戰利品，西部荒野；或者在黑海岸刷取熊怪的螃蟹零食。然後將其餵給海岸上的幼年礁石爬行者（聯盟）；\n\n部落必須殺死銀松森林的兇猛灰熊，直到生成一個灰熊保護者。殺死，拾取戰利品；在陶拉祖營地北部的貧瘠之地，誘捕一隻巡邏的獵豹。現在你可以殺死它。豐厚的戰利品！（部落）"

st.hunter.carve = "從丹莫羅的戈爾巴採石場的岩石下巴穴居人身上獲得兔子麝香，然後將麝香用於一隻兔子生物。現在馴服它。與丹莫羅琥珀靜農場的托比交談以獲得獎勵；\n\n在泰達希爾，從 gnarlpine 怪物身上獲得鹿麝香。用於鹿。馴服。與達納蘇斯的雷拉隆交談（聯盟）；在杜洛塔爾，從剃刀沼澤怪物身上獲得蝰蛇費洛蒙。與剃刀嶺的拉齊爾交談；在莫高雷，從白鬃怪物身上獲得草原土撥鼠麝香。與血蹄村的塔科達·日鬃交談（部落）。\n\n注意，當你馴服你的生物時，你不需要放棄你當前的寵物。"

st.hunter.cobraStrikes = "從在南海鎮和塔倫米爾之間游走的齊克希爾那裡購買淡水鯛魚餌。\n\n現在在塔倫米爾南部湖上的小船上... 使用小船。科阿圖爾會生成！"

st.hunter.explosiveShot = "丹莫羅的菲奧迪、嚎叫者埃丹、 mangeclaw、老冰鬍子、木材、瓦加什；泰達希爾巴尼希爾墓穴底部的怒爪（聯盟）； heavily camped 的薩科斯，試煉谷；莫高雷的阿拉切亞、幽靈嚎叫、馬扎納奇、耙子（部落）"
st.hunter.flankingStrike = "喬魯爾，位於丹莫羅冰流湖東側的洞穴中；莫格，位於聯盟神諭林地河流東側的洞穴中；拉魯克，位於杜洛塔爾回音群島的北部島嶼上；莫克瓦，位於莫高雷血蹄村西北偏西方向（部落）\n\n要生成稀有精英，你必須刷取它的食物。請參閱工具提示。\n\n這些稀有精英是跨陣營的。殺死或馴服（10 級）後可獲得符文。熊（聯盟）和貓（部落）的技能和屬性只是中等水平。"

st.hunter.heartLion = "卡羅丁，位於濕地塞爾根岩洞的後方（聯盟/部落）"

st.hunter.killCommand = "這個過程以石爪山脈的吉克索·瘋狂火箭為中心，位於通往風剪懸崖的路上。\n\n第一個任務需要你殺死位於哀嚎洞穴盡頭的吞噬者穆塔努斯。穆塔努斯會掉落催眠水晶。哀嚎洞穴位於貧瘠之地。\n\n你還需要一根 gnarled 的野性魔法棒。從拍賣行/附魔師朋友那裡購買一根高級魔法棒。與灰谷熊怪掉落的野性魔法精華組合。\n\n第二個任務需要你見證吉克索馴服一隻雙足飛龍。輕而易舉！\n\n獵人的獎勵是我們獲得一根雙足飛龍馴服棒，它可以讓我們馴服石爪山脈的幼年驕傲之翼。我也標記了它們！"

st.hunter.masterMark = "對沙沙作響的灌木叢使用獵人標記。一個偷獵者會生成。殺死它。拾取掉落物。"

st.hunter.sniper = "帕克斯諾茲，位於黑海岸瑪西斯特拉廢墟的西邊；迪菲亞斥候，位於西部荒野的哨兵嶺；卡克爾，位於洛克莫丹的湖中（聯盟）。\n\n布魯茲，位於貧瘠之地棘齒城海岸附近（部落）"
-- Hunter Phase 2
st.hunter.dualWield = "在此位置，你將獲得“危險！”增益效果。\n\n在這個區域徘徊，使用你的“照明彈”（32級）\n"
			.."直到你找到血頭皮游擊隊（34級）。\n也使用追踪隱形。\n\n殺死並拾取"
st.hunter.expose = "農食人魔和穴居人，直到掉落原始繪畫\n然後前往荊棘谷北部赫米特·奈辛瓦里的營地。\n"
			.."他會把你送回\n荒蕪之地並給你一個籠子。\n\n"
			.."在下次遭遇之前，捕捉任何小動物。\n\n回到荒蕪之地，找到大型巢穴並\n"
			.."召喚加里克，一隻 40 級的鳥。馴服或擊敗它以\n獲得深紅色獎盃羽毛筆。返回赫米特"
-- Hunter Phase 3
st.hunter.calefactus = "追踪野獸是你的朋友。可馴服（50級）。\n一隻綠色的熔火之心風格的熔岩犬！\n為了任務，必須殺死 :("
st.hunter.catlike = "在雪人洞穴後部上層角落\n找到幼崽。餵牠泰拉比姆香蕉或軟\n香蕉麵包。\n\n"
			.."你有十分鐘的時間護送幼崽到牠\n附近的母親身邊。幼崽具有攻擊性，所以預計\n一路上會發生戰鬥。\n\n"
			.."母親在外面的一個小土丘上"
st.hunter.focusFire = "地圖位置附近有一座橋，橋附近\n有一根樹枝，上面有一個巢。拾取鳥蛋。\n\n"
			.."殺死生成的狂怒風鴉。拾取 ->  獲利"
st.hunter.rapidKilling = "進入灼熱峽谷西北角的火 watch嶺洞穴。\n上部中間部分。\n與柱子上的風化蝕刻互動。\n\n現在前往詛咒之地與林諾雷會面。\n"
			.."她在悲伤沼澤路徑盡頭的最北端，\n在恐懼魔堡壘一側。\n\n"
			.."對於她的第一個任務，避開她西南方的暗影盟約儀式者，\n因為他們更強。\n\n"
			.."卡萊法克圖斯是一個獨特的熔岩犬模型，你也可以\n在完成“帶到腳跟”時馴服它。\n\n"
			.."請注意，你會收到一個很棒的小飾品，它專門\n幫助馴服熔火之心的熔岩犬。BoPU"

-- Mage
st.mage.books = "從艾澤拉斯各地收集書籍可以獲得三個符文。任何列出的書籍\n"
			.."都算數。你將發現的每本書都交給幽暗城的歐文·薩德（部落）或暴風城的加里恩·溫德爾。\n\n"
			.."你可以一次交一本書或一次交幾本書。當你交的書足夠獲得一個符文時，\n"
			.."一個微不足道的完成任務將會獎勵你你的符文。"
st.mage.booksQuestIDsA = { 79953, 81955, 79949, 78145, 79091, 79092, 79535, 79097, 78142, 81956, 
						78147, 79948, 79950, 81952, 78149, 79947, 78146, 81949, 79951, 78124, 
						79093, 78148, 79952, 81947, 78143, 81953, 78127, 81951, 81954, 78150, 79536, 82208 }
st.mage.booksQuestNamesA = {
						"盧迪特寵物護理指南" ..colourPlaintext .."    在悲伤沼澤農失落者",
						"金屬之心" ..colourPlaintext .."    在灼熱峽谷的一個帳篷裡的桌子上",
						"謊言之網：揭穿神話和傳說" ..colourPlaintext .."    在阿拉希的冬泉谷村莊的一個帳篷旁邊",
						"奧術系統手冊" ..colourPlaintext .."    貧瘠之地的污泥沼澤",
						"大法師安東尼達斯：未刪節版..." ..colourPlaintext .."    鐵爐堡的探險者大廳",
						"大法師西奧克里圖斯的研究日誌"..colourPlaintext .."    艾爾文森林的阿祖拉之塔",
						"蛇怪：應該害怕石化嗎？" ..colourPlaintext .."    荊棘谷水晶礦脈入口",
						"巴克斯坦：論毀滅魔法" ..colourPlaintext .."    在貧瘠之地棘齒城的加茲洛夫旁邊",
						"迷惑和魅力" ..colourPlaintext .."    西部荒野的月溪鎮",
						" conjurer法典" ..colourPlaintext .."    去詛咒之地",
						"違反解剖學的罪行" ..colourPlaintext .."    暮色森林的烏鴉嶺地穴",
						"防禦魔法 101" ..colourPlaintext .."    奧特蘭克山脈的食人魔塔",
						"惡魔和你" ..colourPlaintext .."    在雷霆之斧要塞內",
						"日常禮儀" ..colourPlaintext .."    艾薩拉的赫爾達爾營地",
						"大地之怒" ..colourPlaintext .."    在石爪山脈的恐怖圖騰附近",
						"地質學：冰冷的真相" ..colourPlaintext .."    在千針石林的黑暗雲端峰的一個小屋內",
						"戈阿茲卷軸" ..colourPlaintext .."    濕地的維爾加挖掘場",
						"潮汐賢者的傳說" ..colourPlaintext .."    在塔納利斯海盜灣的一座建築物內",
						"木乃伊：令人討厭的不死生物指南" ..colourPlaintext .."    荒蕪之地台地內的地穴",
						"納薩拉斯年鑑" ..colourPlaintext .."    黑海岸遺址",
						"諾莫瑞根的魯米：作品集" ..colourPlaintext .."    塞爾薩瑪或西部荒野的旅館",
						"巫妖王的符文" ..colourPlaintext .."    洛克莫丹的食人魔洞穴",
						"RwlRwlRwlRwl" ..colourPlaintext .."    悲伤沼澤的女巫山魚人營地",
						"血腥魔法" ..colourPlaintext .."    在悲伤沼澤的沉沒神廟頂部",
						"夢境者的秘密" ..colourPlaintext .."    在哀嚎洞穴傳送門附近",
						"石雕設計" ..colourPlaintext .."    在黑石山的弗蘭克羅恩·鍛造者的祭壇上",
						"達拉然文摘" ..colourPlaintext .."    銀松森林的琥珀磨坊",
						"邊緣與奧術" ..colourPlaintext .."    在菲拉斯的奧妮羅斯，但僅限於夢魘入侵期間",
						"毒液之旅" ..colourPlaintext .."    在辛特蘭的一堵棕色牆後面",
						"圖書館之友" ..colourPlaintext .."    獲得冰冷血脈的最後一步！", 
						"圖書館高級之友" ..colourPlaintext .."    獲得法術強度的最後一步！",
						"圖書館高級之友" ..colourPlaintext .."    獲得深度凍結的最後一步！" }
st.mage.booksQuestIDsH = { 79953, 81955, 79949, 78145, 79096, 79535, 79097, 78142, 81956, 78147, 
						79948, 79950, 81952, 78149, 79947, 78146, 81949, 79951, 78124, 78148, 
						79952, 81947, 78143, 81953, 79095, 78127, 79094, 81951, 81954, 78150, 79536, 82208 }
st.mage.booksQuestNamesH = {
						"盧迪特寵物護理指南" ..colourPlaintext .."    在悲伤沼澤農失落者",
						"金屬之心" ..colourPlaintext .."    在灼熱峽谷的一個帳篷裡的桌子上",
						"謊言之網：揭穿神話和傳說" ..colourPlaintext .."    在阿拉希的冬泉谷村莊的一個帳篷旁邊",
						"奧術系統手冊" ..colourPlaintext .."    貧瘠之地的污泥沼澤",
						"阿塔里克：論奧術珍品"..colourPlaintext .."    墓穴",
						"蛇怪：應該害怕石化嗎？" ..colourPlaintext .."    荊棘谷水晶礦脈入口",
						"巴克斯坦：論毀滅魔法" ..colourPlaintext .."    在貧瘠之地棘齒城的加茲洛夫旁邊",
						"迷惑和魅力" ..colourPlaintext .."    西部荒野的月溪鎮",
						" conjurer法典" ..colourPlaintext .."    去詛咒之地",
						"違反解剖學的罪行" ..colourPlaintext .."    暮色森林的烏鴉嶺地穴",
						"防禦魔法 101" ..colourPlaintext .."    奧特蘭克山脈的食人魔塔",
						"惡魔和你" ..colourPlaintext .."    在雷霆之斧要塞內",
						"日常禮儀" ..colourPlaintext .."    艾薩拉的赫爾達爾營地",
						"大地之怒" ..colourPlaintext .."    在石爪山脈的恐怖圖騰附近",
						"地質學：冰冷的真相" ..colourPlaintext .."    在千針石林的黑暗雲端峰的一個小屋內",
						"戈阿茲卷軸" ..colourPlaintext .."    濕地的維爾加挖掘場",
						"潮汐賢者的傳說" ..colourPlaintext .."    在塔納利斯海盜灣的一座建築物內",
						"木乃伊：令人討厭的不死生物指南" ..colourPlaintext .."    荒蕪之地台地內的地穴",
						"納薩拉斯年鑑" ..colourPlaintext .."    黑海岸遺址",
						"巫妖王的符文" ..colourPlaintext .."    洛克莫丹的食人魔洞穴",
						"RwlRwlRwlRwl" ..colourPlaintext .."    悲伤沼澤的女巫山魚人營地",
						"血腥魔法" ..colourPlaintext .."    在悲伤沼澤的沉沒神廟頂部",
						"夢境者的秘密" ..colourPlaintext .."    在哀嚎洞穴傳送門附近",
						"石雕設計" ..colourPlaintext .."    在黑石山的弗蘭克羅恩·鍛造者的祭壇上",
						"藥劑師的形而上學入門" ..colourPlaintext .."    布瑞爾煉金術商店",
						"達拉然文摘" ..colourPlaintext .."    銀松森林的琥珀磨坊",
						"塔佐的教訓" ..colourPlaintext .."    奧格瑞瑪的精神谷",
						"邊緣與奧術" ..colourPlaintext .."    在菲拉斯的奧妮羅斯，但僅限於夢魘入侵期間",
						"毒液之旅" ..colourPlaintext .."    在辛特蘭的一堵棕色牆後面",
						"圖書館之友" ..colourPlaintext .."    獲得冰冷血脈的最後一步！", 
						"圖書館高級之友" ..colourPlaintext .."    獲得法術強度的最後一步！",
						"圖書館高級之友" ..colourPlaintext .."    獲得深度凍結的最後一步！" }

-- Mage Phase 1
st.mage.enlightenment = "聯盟應該前往艾爾文森林最東邊的嶺點\n塔，儘管任何有\n"
			.."小動物的地方都是有可能的。如果小動物身上有\n野生變形減益效果（而且它看起來也“不\n"
			.."正常”），那麼就對它施放變形術。當這個人\n走開時，你會看到一個閃閃發光的物體。\n\n"
			.."部落需要在提瑞斯法林地任何\n農場周圍尋找奇怪的瓜，並對它也施放變形術。\n\n"
			.."該物品的工具提示將說明你需要多少個。\n將它們組合在一起（使用其中一個）。瞧！"
st.mage.arcaneBlast = "娜迦手稿將從怒尾\n女巫和海巫身上掉落。\n\n"
			.."在你地圖上標記的三個粉紅色/紫色\n碎片處施放奧術爆炸。\n\n雞肉晚餐，你是贏家！"
st.mage.fingers = "聯盟需要從一系列受歡迎的\n老朋友那裡獲得掉落物。提姆伯、曼格克勞、比亞姆、\n"
			.."嚎叫者埃丹、老冰鬍子、鐵脊、瓦加什\n以及新加入的菲奧迪。都在丹莫羅。還有霍格！\n\n"
			.."部落獲得加茲烏茲，在你離開奧格瑞瑪時\n左邊的洞穴。回音群島上的扎拉贊恩\n"
			.."對巨魔來說很方便。介紹一下吉爾加，就在\n喪鐘鎮北部。\n\n只需拾取並理解！<3"
st.mage.livingBomb = "被咀嚼過的法術筆記將從\n洛克莫丹塞爾薩瑪最南端的\n碎石者洞穴中的怪物身上掉落。同樣的先知也居住在\n洛克莫 丹最北端的湖泊中。\n\n"
			.."部落可以選擇在銀松森林完成一些任務，以獲得保證的獎勵。\n"
			.."問題是，你需要一個非常低的掉落\n率“會說話的頭”在你\n"
			.."在芬里斯島上進行任務時掉落，才能開始\n任務鏈。\n\n值得嗎？3% 的掉落率。我寧願去割草坪。"
st.mage.livingFlame = "丹莫羅的霜鬃暗影施法者（聯盟）和霜鬃\n先知（聯盟/部落）將掉落\n"
			.."法術筆記。它們在地圖的西側\n並且已被固定。\n\n"
			.."艾爾文森林碧玉礦及其周圍的\n狗頭人地卜師（聯盟）也是可能的。\n\n"
			.."在提瑞斯法林地，猩紅戰士、\n傳教士和狂熱者（均為聯盟/部落）已被\n固定。\n\n"
			.."杜隆塔爾到處都是部落，燃燒之刃\n怪物甚至就在奧格瑞瑪\n的外面。\n\n"
			.."和往常一樣，拾取並理解！"
st.mage.regeneration = "部落可以農達拉然學徒，\n銀松森林南部。\n\n"
			.."理論上，聯盟/部落都可以：在貧瘠之地農科爾卡半人馬\n怪物以獲得鑰匙來打開該地區\n"
			.."兩個箱子中的一個；檢查洛克\n莫丹北部島嶼上的一堆\n被盜書籍；在西部荒野南部殺死迪菲亞叛徒法師。拾取並理解！"
-- Mage Phase 2
st.mage.chronostatic = "3 或 4 個法師必須對千針石林中的三個不同\n怪物施放冰霜法術，才能使它們\n"
			.."受到“冷卻”減益效果。殺死並拾取。\n\n請注意，美洲獅被關在籠子裡，需要一把鑰匙，\n"
			.."該鑰匙從加拉克掠奪者半人馬怪物身上掉落。\n\n所有三個怪物都會掉落部分法術筆記，這些筆記必須\n"
			.."組合起來"
st.mage.hotStreak = "在斯坦恩布萊德鐵匠鋪，使用火焰法術點燃\n兩個風箱。\n\n"
			.."一個古老的火元素將會出現。殺死並拾取"
st.mage.fireAndFrost = "在荊棘谷殺死碎顱者秘術師"
-- Mage Phase 3
st.mage.booksBM = "像你通常跑黑石深淵或熔火之心一樣\n進入黑石山。\n\n"
			.."這本書在弗蘭克羅恩·鍛造者的祭壇房間裡。\n\n你不必死就能看到這本書！;)"
st.mage.temporal = "從辛特蘭的梟獸身上收集1 x 完美的梟獸羽毛筆，從\n菲拉斯東南部的希利蘇斯收集5 x 祖卡什\n"
			.."樹脂，以及從祖爾法拉克的殭屍身上收集8 x 法拉基紙莎草。\n\n"
			.."額外獎勵是一本個人法術書。最後，\n你可以召喚理解符咒了！！！"

-- Paladin Phase 1
st.paladin.banishment = "Target the Defias Enchanters, Defias Night Blades\n"
			.."and Defias Night Runners along the southern edge of\nDuskwood. Easy grind.\n\nEquip the Libram when it drops.\n\n"
			.."Cast Turn Undead on five enemies and kill them with\nExorcism.\n\nClick on the Libram again"
st.paladin.blessings = "Go to the Thelsamar Tavern in Loch Modan.\nIt's sitting on a table there. Or else go\n"
			.."to Westfall and kill Undying Laborers in the\nJangolode Mine or the Gold Coast Quarry\n\n"
			.."Follow the Libram's Tooltip instructions. Done!"
st.paladin.divineStorm = "You'll find an Orb at the top of the Athalaxx Tower in northern Darkshore. Starts a quest.\n\n"
			.."Seek out Delgren the Purifier at Maestra's Post in Ashenvale.\n\n"
			.."As instructed, go to Katherine the Pure in the Stormwind Cathedral who'll send you to speak to\n"
			.."Ursula Deline at the back of the Mages Quarter.\n\n"
			.."Ursula sends you to Redridge to collect her Salt. It has a low drop rate QQ. Return to her.\n\n"
			.."Ursula now needs Motes from Ashenvale.\n\n"
			.."After collecting the Motes take them to the Altar of Mannoroth. It's big and purple. Click on\n"
			.."the ground to turn the Motes in. A Shattered Orb appears. Take it to Delgren. Finally!"
st.paladin.judgement = "Dwarves visit Bromos Grummner at the Anvilmar\nentrance and humans speak to Brother Sammuel\n"
			.."in the Hall of Arms in the Northsire Abbey.\n\nYou're now tasked with dispatching Frostmane\n"
			.."Troll Whelps in Coldridge Valley or the Defias\nThugs in the vineyard to the east of the Abbey.\n\n"
			.."When the Libram drops, read the instructions.\nSelect a Seal spell, cast Judgement on 10 x foes.\n\n"
			.."Click on your Libram for your reward"
st.paladin.justice = "Farm the Libram in a Stonesplitter Cave in\nLoch Modan or from the Defias Drones in\n"
			.."the far south-east corner of Westfall.\n\nNow follow the Libram's Tooltip: Slam\n"
			.."10 x foes that have been stunned with your\nHammer of Justice.\n\nClick on the Libram again FTW!"
st.paladin.runeOfAegis = "Go to the entrance to Gnomeregan, far west from\nIronforge, and speak to a Wounded Adventurer.\n\n"
			.."Or find the Wounded Adventurer at the far end\nof the Jasperlode Mines in Elwynn Forest.\n\n"
			.."Either way, cast Purify (level 8+) and done!"
st.paladin.martyrdom = "Speak to Brother Romulus in Stormwind.\n\nFollow his instructions, taking the\n"
			.."western starircase to the crypts.\n\nYou may need to wait for the note to spawn.\n"
			.."It's next to the candle at the bottom.\n\nAda is at the river junction of Westfall,\n"
			.."Duskwood, Elwynn Forest.\n\nShe has your rune. You know the score"
-- Paladin Phase 2
st.paladin.guardedLight = "You must have learnt Divine Intervention (L30).\n\nUpon clicking the skeleton and looting the Dormant\n"
			.."Holy Rune, cast Divine Intervention upon yourself\nand die. You may do this anywhere convenient.\n\n"
			.."Another player must resurrect you, not necessarily\na Paladin. You will auto acquire the rune.\n\n"
			.."Note that Soulstones do not work for this"
st.paladin.judgements = "The Dark Iron Bombadiers and Suppliers have the best\n(albeit bad) drop rates for all three Tarnished\n"
			.."Prayer Bead I/II/III.\n\nPurify I with Blessing of Might cast while in combat.\n"
			.."Purify II with Divine Shield at <10% health.\nPurify III with Seal of Justice and Judgment while fleeing.\n\n"
			.."Now combine -> Rosary of the Light. Take the Rosary to\nBrother Atticus in Stromgarde Keep"
st.paladin.sacredShield = "On a bench that's inside Brother Anton's building.\n\nEquip and then use Blessing of Freedom (L18) on\n"
			.."other players/NPCs five times. MUST be movement\nimpairing roots. Not slows, for example.\n\n"
			.."Nets are great - Murloc Netters in Westfall or the\nDragonmaw area of Wetlands, Magram Wranglers near\n"
			.."Maraudon, Greymist netters in Darkshore, etc.\n\nCan be your same friend over and over again!"
st.paladin.sheathLight = "Must have obtained the Divine Storm rune. Later you'll need a Cathedral Wing key to\n"
			.."Scarlet Monastery.\n\n"
			.."At Mannoroc Cove loot an ornate warhammer which starts the quest \"The Broken Hammer\".\n\n"
			.."Now farm the nearby Burning Blade Summoners (L38-39) for a Torn Letter. Go to Katherine\n"
			.."the Pure (first room on the left) in the SW Cathedral. Listen to her for \"A Lost Brother\".\n\n"
			.."Set your hearth to Stormwind then go to Menethil Harbor wharf, Wetlands and talk to Harold Riggs.\n\n"
			.."Take an extremely long swim south to Newman's Landing. You'll see a building and a wharf.\n"
			.."This is the far south-west corner of Dun Morogh.\n\n"
			.."You'll be ambushed. Loot the Orders and pickup the quest and hearth to SW. Speak to Katherine.\n\n"
			.."Now defeat High Inquisitor Whtemane in the Cathedral Wing of Scarlet Monastery. Locate\n"
			.."Aeonas before you leave! Now hearth again and Katherine again and you're pretty much done."
-- Paladin Phase 3
st.paladin.fanaticism = "Pick up the quest from Aeonis the Vindicated.\nHe's in the Stormwind Cathedral. Proceed to\n"
			.."Theramore and give Elrick a whooping.\n\nSpeak to the Stern-Faced Bar Patron.\n\n"
			.."Back at Katherine the Pure in the Cathedral,\nand she'll reward you grandly"
st.paladin.hammerRighteous = "In Felwood you climb up the rope to reach Aeonis.\nNext speak with Gregory and accept the quest.\n\n"
			.."Go north and farm the Shatter Scale Vale for 3 x\nFiery Infernal Core. Next meet the Tauren Brave\n"
			.."Stonetorch, to the north of Tarren Mill in the Hillsbrad\nFoothills. You'll obtain the Symbol of Faith.\n\n"
			.."The Shimmering Grave Dust is from a Grave Mound,\nobtained after killing Princess Theradras in\nMaraudon.\n\n"
			.."The Tripple-Brewed Molten Lager you purchase from\nPlugger Spazzring at the Grim Guzzler tavern, well\n"
			.."into Blackrock Depths. That's one mighty series of\ncorpse runs for solo players.\n\n"
			.."Return to Gregory for the hand in. Accept your Rune!"
st.paladin.wrath = "North of Quel'Danil Lodge in The Hinterlands is\nwhere Paladins will use their Sense Undead to\n"
			.."locate a Vengeful Spirit (L45). Kill it.\n\nSpeak to Magister Falath in the Mystic Ward of\nIronforge. Enjoy!"

-- Priest Phase 1
st.priest.circle = "從迪菲亞怪物身上獲得黑暗洞察力，\n然後在隱蔽的墳墓中使用它"
st.priest.citadel = "霜鬃怪物，丹莫羅的閃光嶺；\n迪菲亞流氓巫師，艾爾文森林的石cairn湖\n"
			.."森林，精靈，泰達希爾的魔岩洞穴（聯盟）；\n杜隆塔爾的各種巨魔、豺狼人、鷹身女妖；\n"
			.."提瑞斯法林地的索利登農場的猩紅怪物（部落）"
st.priest.penanceMed = "\n\n記住！在嘗試學習符文時，\n始終要保持冥想增益效果處於活動狀態。最初，\n"
			.."你必須堅持你的種族位置。\n\n人類可以使用任何神聖的位置，\n"
			.."矮人可以使用任何光明祭壇。暗夜\n精靈可以使用任何月井！部落方面，\n"
			.."不死族需要去任何墓地！巨魔可以使用 loa 祭壇，例如十字路口！\n\n"
			.."在 17 級時，你必須完成一個任務才能\n獲得第二個冥想增益效果。這\n"
			.."對於學習更難的符文是必要的。\n\n稍後在 16 級時會在地圖上標記詳細信息。\n\n"
			.."注意：可以通过另一個牧師获得第二个增益效果：\n    玩家 1：/下跪；\n"
			.."    玩家 2：/祈禱。\n現在交換角色。瞧！\n\n（/祈禱會傳遞你所有的冥想！）"
st.priest.penanceDM = "\n\n布蘭斯托克·卡爾德讓你\n掠奪一個岩石下巴的儲物櫃。你將獲得一個未激活的\n"
			.."符文。返回他身邊。\n\n在他附近有一個光明祭壇。/下跪。\n獲得增益效果後，點擊你的符文即可獲勝！"
			..st.priest.penanceMed
st.priest.penanceDur = "與肯賈伊交談並接收你的未激活的\n符文。前往 loa 祭壇，它\n"
			.."位於森賈伊村莊\n的北部一點，并在它面前下跪。獲得增益效果後，點擊\n你的符文。瞧！"
			..st.priest.penanceMed
st.priest.penanceEF = "\n\n具體來說，人類牧師將拜訪\n北郡修道院的牧師安妮塔。\n"
			.."然後你前往回音嶺礦井並\n殺死狗頭人勞工，直到掉落一個\n"
			.."陷入困境的侍僧的記憶。\n\n返回修道院。/下跪。一旦你\n"
			.."獲得增益效果，點擊拾取的\n記憶來學習符文！" ..st.priest.penanceMed
st.priest.penanceTel = "\n\n珊達位於奧達希爾樹中。\n與她交談，然後前往\n"
			.."奧達希爾北部和洞穴東部的月井。\n/下跪。獲得增益效果後，點擊你的符文！" ..st.priest.penanceMed
st.priest.penanceTG = "\n\n與黑暗牧師杜斯滕交談後，你將\n需要前往附近的墓地。\n"
			.."在墓地中/下跪，獲得增益效果後，\n你只需點擊你的符文即可！" ..st.priest.penanceMed
st.priest.sharedPain = "貝爾德隊長和鐵脊，赫爾姆之床湖，\n丹莫羅最東端，吉布爾威爾特，丹莫羅\n"
			.."最西端；狗頭人怪物，母獠牙，捕獸者魯克，\n艾爾文森林碧玉礦區域；\n"
			.."泰達希爾魔岩洞穴的梅萊納斯領主（聯盟）。\n\n馬卡斯加爾、扎拉贊恩、科爾卡尼斯、斯科恩、加茲烏茲\n"
			.." - 都在杜隆塔爾；提瑞斯法林地農民怪物，\n提瑞斯法林地索利登農場區域（部落）\n"
st.priest.strength = "從熊怪怪物身上獲得原始洞察力，\n然後爬上地圖上標記的樹"
st.priest.twisted = "請參閱快速入門指南以了解位置。\n\n"
st.priest.twistedBarr = "農剃刀鬃毛怪物以獲得幫助之手。\n它的工具提示就是提示！使用一級\n"
			.."復活術復活一名倒下的冒險者。\n你也可以復活他/她的寵物！" 
st.priest.twistedDark = "殺死風暴鱗片娜迦，直到掉落碎矛\n祭品。前往附近的水域，跳\n"
			.."進去並點擊碎矛偶像。瞧！" 
st.priest.twistedLM = "在銀溪礦井中農隧道鼠以獲得一枚祭品硬幣。前往出口，\n"
			.."但在到達之前，向右尋找一個壁龕。\n將硬幣扔進井裡，你就...\n"
			.."做得好！現在刪除這個插件，因為它\n太糟糕了" 
st.priest.twistedSil = "最簡單的版本。殺死並拾取\n遺憾的是，15 分鐘的重生計時器" 
st.priest.twistedWest = "殺死“不死”勞工，一個骷髏，\n但當它試圖復活時，你必須\n"
			.."用任何神聖傷害殺死它。拾取即可獲勝！" 
st.priest.voidPlague = "諾莫瑞根附近的麻風侏儒/吉布爾威特；艾爾文森林的金牙；\n"
			.."泰達希爾的巴尼希爾墓穴的 gnarlpine 儲藏室（聯盟）\n庫爾提拉斯怪物，杜隆塔爾剃刀嶺以東；吉爾加，\n"
			.."提瑞斯法林地喪鐘鎮西北（部落）"
-- Priest Phase 2
st.priest.dispersion = "Ask a Rogue to pickppocket a Mysterious\nTroll Scroll from any Bloodscalp troll. The\n"
			.."Rogue must have the Mastery of Subtlety Rune\nand Jani's Charm. The Scroll may be on the AH.\n\n"
			.."Ask a Mage to use a Comprehension Charm to\ndecipher the Scroll -> Deciphered Troll Scroll\n"
			.."or just buy on the AH.\n\nThis starts the quest \"The Troll Scroll\".\n\n"
			.."Grab Holy Spring Water from the fountain as\nper the map. Go to the north-west corner and\n"
			.."with TWO Meditation buffs use the Holy Water\non a fountain near to and at the rear of\n"
			.."Gan'zulah (L41). Obtain your lewt!\n\nNote: The quest is shareable, allowing priests\n"
			.."to skip the Rogue/Mage help. The Scrolls are\ntradeable / on the AH. Lord Sakrasis (L45re)\n"
			.."might be up at the Holy Spring. Your Homonculi\n(L18 rune) can keep Gan'zulah busy or why not\n"
			.."die and rez on top of the correct fountain!\nWith smarts you can go STRAIGHT TO the Gan'zulah\n"
			.."step, skipping the quest and Mage/Rogue help!!!"
st.priest.empowered = "As simple as farming the indicated mobs"
st.priest.painSuppression = "Collect \"echos\" in the Swamp of Sorrows, Arathi\nHighlands and Dustwallow Marsh.\n\n"
			.."Collect a fourth in the Scarlet Monastery Graveyard\nwing. Proceed to the SM Library wing and activate an\n"
			.."Echo at each of the statues, in the following order:\n\n1) Warrior - Swamp Echo\n2) Mage - Arathi Echo\n"
			.."3) Paladin - Theramore Echo\n4) Priest - Graveyard Echo\n\nA brilliant sphere appears. Click on it for phat lewt!"
st.priest.renewedHope = "Farm the Slitherblade naga mobs along the Desolace\ncoast until an Unsettling Vision drops.\n\n"
			.."Now use Mind Control (L30) on a Slitherblade\nTide Priestess (L33-34). You must be no more\n"
			.."than 2 levels below this mob for MC to work.\n\nNow use your Unsettling Vision to learn!"
-- Priest Phase 3
st.priest.eyeOfVoid = "Collect seven eyes from around Azeroth: Blasted Lands,\nFelwood, Feralas, Searing Gorge, Stranglethorn Vale,\n"
			.."Tanaris, and The Hinterlands.\n\nAfterwards go to the far north-east promontory of\n"
			.."Azshara and locate the Shrine of the Watcher.\n\n/kneel to receive a quest. (Reload if bugged).\n"
			.."Hand in for your phat reward"
st.priest.surgeLight = "Between the server hours of 9pm and 3am the\nEcho of a Lost Soul will spawn at: the Gadgetzan\n"
			.."Graveyard in Tanaris, the Ruins of Alboraz in\nStranglethorn, the Graveyard south east of\n"
			.."Stonard, the graveyard north west of Revantusk\nVillage.\n\nThe Echo is immune to most damage except Arcane.\n"
			.."Kill and loot.\n\nRespawn is very fast so if you do not see the Echo\nthen you are standing there at the wrong time"

-- Rogue Phase 1
st.rogue.bladeDance = "Cliffspring River Cave, Darkshore. Keys drops\noff Cliffspring mobs; Pp Dark Iron Dwarves in\n"
			.."Loch Modan. Open the lockbox; Pick Pocket Defias\nmobs for a Discreet Envelope. Go to the back\n"
			.."entrance of the Deadmines, Westfall (A).\n\nPp Southsea mobs for Buccaneer's Matchbox. Go\n"
			.."up the nearby hill. Light the gunpowder bucket.\nKaboom! Voilà, your reward awaits! (H)"
st.rogue.deadlyBrew = "At L20 you'll receive a letter from \"C\". Ignore it. At L22 learn Vanish and Distract\n"
			.."and have five points in Master of Deception (Tier 1 Subtlety). Camouflage (T2) is strongly\n"
			.."suggested. Another 5 points!\n\n"
			.."At Pyrewood Village loot the chest in the little house/hut. Thus begins the first quest (above).\n\n"
			.."(Don't go to Stonetalon Mountains. Noobs do that. Enter SFK alone ftw coz you my friend are l33t!)\n\n"
			.."Stealth to Rethilgore. First boss in the first room. Go to your A/H cell nearby. Open the cell\n"
			.."but quickly Vanish! Talk to the NPC to open the Courtyard Gate.\n\n"
			.."You need to locate Gemela and Gefell. Stealth! You may luck out with a Pick Pocket resist. Be\n"
			.."ready to Vanish. Use Distract too as necessary.\n\n"
			.."Gemela is in the Dining Room, near the Kitchen. Pp her to receive Sister's Half-Key.\n\n"
			.."Gefell is upstairs, take a right. He drops the Brother's Half-Key.\n\n"
			.."Combine the two for Twin Key but note that you'll need to Vanish again (or do it safely).\n\n"
			.."Back to the Courtyard and the Stables. Use the key on the chest. You now have the Horn of Xelthos.\n\n"
			.."Outside the dungeon, turn in at the little house. You must now wait for a second mail. It will tell\n"
			.."you to come back to here for your reward!!!\n\n"
			.."YMMV but reports are that you must go to a city to trigger the letter. But first try waiting 15 minutes\n"
			.."including a full Exit game. Might save a long walk!\n\n"
			.."(The second quest (above) indicates if you have yet to \"hand in\" after the second letter)"
st.rogue.envenom = "Speak to Kris Legace. She's behind Durnholde\nKeep. There's no need to enter it.\n\n"
			.."Buy \"Hot Tip\" from her. You'll need 75s.\n\nCheck your map. Follow the river east of Tarren\n"
			.."Mill all the way into the Western Plaguelands.\n\nContinue right to the end - the waterfall. The\n"
			.."location of a Rusty Safe is marked on your map"
st.rogue.mutilate = "Pp Dark Iron Spies for Blackrat's Note, south of\nHelm's Bed Lake, far east Dun Morogh; Pp Garrick\n"
			.."Padfoot for Cutty's Note, Northshire Vineyards;\nLord Melenas, Fel Rock Cave, Teldrassil (A).\n\n"
			.."Pp Burning Blade mobs for Ba'kso's Note, Durotar;\nPp Captain Perrine, south of Brill, Tirisfal Glades (H)"
st.rogue.precision = "Loot from the Forlorn Cavern, Ironforge; Cutthroat\nAlley, Stormwind; Gnarlpine Stash, far south,\nTeldrassil (A).\n\n"
			.."Chest in The Drag, Orgrimmar; Shipwreck Cache,\neast of Garron's Haunt, Tirisfal Glades (H)"
st.rogue.quickDraw = "You need to piece together a Treasure Map that is in\nfour segments. You cannot share segments across zones.\n"
			.."Decide where you will be mostly spending your time. Pick Pocket.\n\n"
st.rogue.quickDrawDM = "Dun Morogh Treasure Map:\n"
			.."    Top-Right: Frostmane mobs in Coldridge Valley and westerm Dun Morogh\n"
			.."    Top-Left: Rockjaw mobs south/west of Helm's Bed Lake, far south-east Dun Morogh\n"
			.."    Bottom-Right: Leper Gnome, Gates of Gnomeregan, far west Dun Morogh\n"
			.."    Bottom-Left: Dark Iron Spy, south of Helm's Bed Lake, far south-east Dun Morogh\n"
			.."    Final location: Under a bridge, road from Kharanos to Ironforge"
st.rogue.quickDrawEF = "Elwynn Treasure Map:\n"
			.."    Top-Right: Kobold mobs at the entrance to the three mines\n"
			.."    Top-Left: Defias Wizard middle of Stonecairn Lake, Bandits everywhere\n"
			.."    Bottom-Right: Murloc Forager east side of Stonecairn Lake, south-east coast\n"
			.."    Bottom-Left: Riverpaw Outrunner near Hogger or Stonecairn Lake\n"
			.."    Final location: Near Ridgepoint Tower"
st.rogue.quickDrawTel = "Teldrassil Treasure Map:\n"
			.."    Top-Right: Timberling mobs at the Orcale Glade river, lake south of Dolanaar\n"
			.."    Top-Left: Gnarlinepine mobs, Ban'ethil Barrow Den\n"
			.."    Bottom-Right: Harpies, Oracle Glade\n"
			.."    Bottom-Left: Sprites, Fel Rock Cave\n"
			.."    Final location: Hollow stump, Rut'theran Village"
st.rogue.quickDrawDur = "Durotar Treasure Map:\n"
			.."    Top-Right: Kul Tiran mobs, east of Razor Hill\n"
			.."    Top-Left: Burning Blade mobs. Approach via Razor Hill\n"
			.."    Bottom-Right: Gnolls, central Durotar\n"
			.."    Bottom-Left: Trolls, main Echo Isle\n"
			.."    Final location: At the foot of a statue, southern Echo Isles"
st.rogue.quickDrawTG = "Tirisfal Treasure Map:\n"
			.."    Top-Right: Scarlet mobs all over, eg, towards the Monastery\n"
			.."    Top-Left: Farmers north of Deathknell\n"
			.."    Bottom-Left: Gnolls at Garren's Haunt\n"
			.."    Bottom-Right: Vile Fin murlocs, coastal areas\n"
st.rogue.saberSlash = "Auberdine lighthouse, Darkshore; platform,\nStonewrought Dam, Loch Modan; hill behind\n"
			.."the Sentinel Hill Inn, Westfall (A).\n\nstable roof, Northwatch Hold, The Barrens\n"
			.."Rusty Chest on a platform at the entrance\nto Shadowfang Keep, Silverpine Forest (H)"
st.rogue.shiv = "First obtain an Engraved Gold Ring from Pick\nPocketing the Defias mobs along the southern\nborder of Duskwood.\n\n"
			.."Then go up to the cemetary and /kneel at the\nstatue. Careful of the pats, choose your moment!"
st.rogue.slaughter = "Above the Inn, Kharanos, Dun Morogh; Roof of the\nspooky house north of Goldshire, Elwynn Forest;\n"
			.."several cache locations inside the Ban'ethil Barrow\nDen, Teldrassil (A).\n\n"
			.."Drygulch Ravine, Durotar - look for a pin north\nnorth-west of Razor Hill; Relic Coffer in the\n"
			.."Agamand Crypts, Tirisfal Glades. The key drops off\nnearby mobs"
-- Rogue Phase 2
st.rogue.punches = "Simply pick the strongboxes within\nstrongboxes. The most difficult requires\n"
			.."Level 55 Lockpicking. You may discard\nthe notes you'll find"
st.rogue.shadowstep = "At L20 you'll receive a letter from \"C\", assuming you've already obtained Deadly Brew.\n\n"
			.."Once again, head to the Dead Drop location in Pyrewood Village in Silverpine and pickup \"The\n"
			.."Eye of Bhossca\" part 2.\n\n"
			.."The Supply Locker is near the stables in the Monastery grounds (Outside the instance).\n"
			.."Pick (100) and loot the disguise.\n\n"
			.."Enter SC GY Wing solo, don the disguise and PP a Scarlet Scryer for a key. Enter the Lib wing\n"
			.."and open the Personal Letterbox in the Athanaeum for a Confidential Message. Enter the\n"
			.."GY Wing. /sit on a bench in the Forloin Cloister then cross the room and /sit on the other side.\n\n"
			.."Now walk north and loot the Stone Coffer from a mausoleum niche for another Key.\n\n"
			.."Go to the Gallery of Treasures in the Lib Wing and loot the Padlocked Reliquary -> Eye of Bhossca.\n\n"
			.."Back in Pyrewood, place the Eye in the Dead Drop chest. Hearth to a MAJOR city. Check mail (relog).\n"
			.."Yup... back to the Dead Drop. Grab your phat lewt"
st.rogue.shurikenToss = "Near the marked chest spawn location will\nbe a Poison Dart trap. Use Disarm Trap (L30)\n"
			.."or wait for another Rogue to do it for you.\n\nDon't walk in front of the trap!!!\n\n"
			.."The Chest will appear, containing phat lewt!"
st.rogue.subtlety = "Enter the stone tower in the Kurzen compound\nand speak to Wendel Mathers.\n\n"
			.."Kill Kurzen mobs in the cave to the north\nfor a Compound Cage Key. Free Mathers.\n\n"
			.."At Booty Bay speak to Captain Aransas.\n\nNote that the cave also has a chest (125)\n"
			.."that you can pick"
-- Rogue Phase 3
st.rogue.honorThieves = "Upon receiving the quest you'll go to Ravenholdt\nManor in Alterac Mountains. Fahrad there will send you\n"
			.."to Zul'Farrak.\n\nEnter the Zul'Farrak SOLO. (It's a special version just\nfor Rogues doing this).\n\n"
			.."Look in tents for two Vile Concoctions in Clay Vessels.\nNote that throwing the Concoctions into a cauldron will\n"
			.."not break stealth.\n\nUse one near Antu'sul then loot the Offering of Bone from\n"
			.."his bag. Likewise Witch Doctor Zum'rah for the Ward of\nthe dead. Equip this trinket and you'll see a grave. Loot\n"
			.."the Offering of Flesh from it.\n\nCombine both Offerings -> Blood Magic Essence.\n\n"
			.."To the right of the \"Stair Event\" is a stone block.\nJump up. Walk to a balcony with a chest. Obtain the\n"
			.."Hollow Emblem. Combine this with the Blood Essence ->\nEmblem of Blood Magic.\n\n"
			.."At the top of the pyramid loot the War Chest for a\nTalisman of Kazdor. Well done. Return to Ravenholdt.\n\n"
			.."Now take your Modified Talisman to the Pyrewood\nVillage Dead Drop. Now back to Ravenholdt where Fahrad\n"
			.."will reward you with your Rune AND a great Agility cloak!"
st.rogue.unfair = "Pickpocket the pirate mobs at the Cove in Tanaris\nuntil you score a Kidnapper's Coin Purse with a\n"
			.."Precious Medallion.\n\nTake to Jabbey at the Steamwheedle Port and he'll\nhappily exchange it for a Rune of Foul Play!"

-- Shaman Phase 1
st.shaman.dyadicIcon = "巨魔/獸人：在試煉谷與希克里克會面，牛頭人：在納拉奇營地與米拉·黎明行者會面。\n\n巨魔/獸人留在他們的起始區域完成任務，但牛頭人需要在荊棘葉峽谷殺死剛毛野豬薩滿。\n\n裝備你的二元神像。注意工具提示。這裡可以使用相同的任務怪物。在十層時點擊你裝備的神像。交還任務以獲得豐厚的戰利品。"

st.shaman.earthenRune = "獲得這個符文有兩種方法。第一種是在貧瘠之地刷沙漠幻影。掉落率和生成率都很高。牧師也會在那裡刷怪。15 級怪物。\n\n或者刷銀松森林的腐皮秘術師。怪物更容易殺死，但掉落率要低得多，你需要殺死第二個生成的怪物。\n\n去貧瘠之地吧！\n\n除此之外，它是一個直接掉落和學習的符文，沒有額外任務。"

st.shaman.galvanicIcon = "前往莫高雷或杜洛塔爾，尋找並聆聽雷擊。\n\n莫高雷的位置靠近貧瘠之地。\n\n跑到一個“閃電灌注的圖騰”並點擊裝備。\n\n用閃電打擊殺死 10 個怪物。\n\n點擊裝備欄。"

st.shaman.kajaricIcon = "在希爾斯布萊德丘陵東南角的農場刷薩滿豺狼人時，請避開泥 snout 豺狼人，因為它們不會掉落卡加里克神像。只有泥 snout 薩滿才會掉落。\n\n裝備（掉落率低）卡加里克神像。\n\n前往奧格瑪並進入怒焰裂谷。小心地在熔岩中玩耍以獲得勝利，儘管會變得更脆一點。"
st.shaman.lavaLash = "在雷霆崖的主台地上與博爾頓·暗影圖騰會面。他是盜賊訓練師，被派來處理你這個小小的薩滿。\n\n他會有三個任務，第一個任務你會收到一個盜賊風格的“偽裝”。\n\n海福林炸藥是從標記的風險投資公司礦井中的推車中獲得的。\n\n他很快就會讓你明白，盜賊的東西不適合你。好吧。\n\n風怒錐很難看到，但我為你標記了一些。\n\n最後一個任務需要釣魚。我在地圖上標記了訓練師。\n\n瞧 - 雙重驚喜。雙持和熔岩鞭笞！！"

st.shaman.earthShield = "在黑 Fathom 深淵中殺死阿夸尼斯男爵。\n\n將地球儀帶到佐拉姆海岸的吉努·聖克里亞。\n\n注意，他的任務之一需要藥劑。這些不是怪物掉落的。你可以在拍賣行上購買或製作它們。"

st.shaman.runeFury = "只需殺死原始異常體。\n\n它在石爪山脈的焦灼山谷中游蕩。\n\n它在三種元素形態之間振盪。精英怪物，但如果你根據它的元素形態調整你的元素攻擊，你就可以單獨擊敗它。掉落並學習符文。掉落率很高。"

st.shaman.sulfurousIcon = "前往雷霆崖西南部的貝爾敦挖掘場，在那裡掠奪貝爾敦矮人以獲得一個儲物櫃鑰匙。箱子裡面是你的符文。很容易。\n\n如果你喜歡痛苦，那就去杜洛塔爾東海岸，與剃刀嶺隔海相望。冰凍的馬庫拉需要五個同時存在的火焰減益效果。由於法師和術士也會去那裡，所以你可能會很幸運。\n\n像往常一樣，裝備神像。按照說明進行。用地震術殺死 10 個怪物。點擊並學習。勝利者！"

st.shaman.tempestIcon = "選擇銀松森林的蒼白者格里姆森或在貧瘠之地刷半人馬以獲得箱子的鑰匙。本質上是一個 Hobson 的選擇。\n\n我猜是貧瘠之地的科爾卡箱子。\n\n獲得掉落物後裝備。然後殺死 10 個怪物，確保你使用了自然、火焰和冰霜攻擊。"
-- Shaman Phase 2
st.shaman.decoyTotem = "在千針石林刷取 10 根堅固的鳥身女妖羽毛和 3 個雲端翔龍尖牙。\n\n從貿易供應商那裡購買一根絲線。\n\n在風靈祭壇將它們組合在一起。你現在擁有一個 30 秒的增益效果“風靈祭品”。\n\n立即從台地上跳下！檢查你的包包！"

st.shaman.fireNova = "在淒涼之地雷霆之斧要塞的北邊，你會找到火焰先知杜貝倫。殺死他。拾取腐化的火焰圖騰。\n\n前往奧格瑪，與智慧谷的佐爾·孤木交談。現在前往淒涼之地的瑪拉頓。\n\n你不需要進入地牢。你將從紫色/粉紅色/左側前廳和橙色/紅色/右側前廳拾取塞拉德拉斯之淚。眼淚是藍色的，隱藏在紫色/橙色水晶結構中。\n\n最好使用轉生術（30 級）/屍體奔跑。\n\n返回佐爾·孤木。然後拜訪雷霆崖長者高地的哈穆爾·符文圖騰，然後在塔爾的幫助下飛往月光林地。\n\n與守護者雷姆洛斯交談，按照指示，盒子 -> 小瓶 -> 軟膏 -> 淨化 -> 豐厚的戰利品！"

st.shaman.maelstrom = "擊敗 RFK 的最終 Boss，查爾加·剃刀側翼（33 級精英），並獲得一個筆記。這將開始“破爛的筆記”。\n\n交還給自由風哨站的勞·懸崖奔跑者，並接受“元素援助”。\n\n在奧特蘭克山脈找到風暴觀察者巴斯拉，並祈禱。你會獲得三個“力量...”任務。\n\n這三個任務需要在淒涼之地、荒蕪之地和塵泥沼澤刷怪。請參閱地圖以獲取信息。\n\n返回巴斯拉，同時帶上一個水晶小瓶。他會提供兩個後續任務，讓你回到勞那裡。\n\n你會與尼絲交談，進行一次特殊的飛行，殺死一隻豪豬，然後殺死一個肆虐風暴（38 級精英）。回到勞那裡。\n\n還有一個任務，是的，去巴斯拉那裡。終於，你的符文！"
st.shaman.maelstromQ = { 79358, 79360, 79362, 79363, 79361, 79364, 79365, 79366, 79442 }
st.shaman.maelstromQN = { "破爛的筆記", "元素的援助", "大地之力", "水之力", "風之力", 
			"一個簡單的容器", "乘风破浪", "暴风雨前的平静", "迎頭趕上" }
st.shaman.powerSurge = "殺死巨槌食人魔，直到掉落一個食人魔闪电棒\n將它插在附近山頂的軟土中。對它施放闪电箭 10\n次 -  塔姆卡爾（37 級精英）將會出現。\n\n"
			.."注意：塔姆卡爾在 30 秒后會自動死亡，所以\n專注于治療他所有的闪电箭。\n\n"
			.."确保你標記了！也就是說，至少擊中一次。拾取！"
st.shaman.spiritAlpha = "從飛行管理员那里，走北邊的\n橋，然后走過下層的橋，\n"
			.."這座橋會轉向哨所。\n\n向下看，你會看到箱子。跳\n"
			.."下去。幽灵狼可能会有用。\n\n符文在箱子里" 
-- Shaman Phase 3
st.shaman.overcharged = "艾薩拉：農哈達爾怪物以獲得被水浸濕的\n薩滿筆記，這將開始一個任務。跑到\n"
			.."靈石，喝下渾濁的水之精華\n（它會出現在你的背包中），與腐化的\n"
			.."水之顯化戰鬥。在附近，將你的\n任務交給元素。接取“回應\n"
			.."水的呼喚”。你稍後會交這個任務。\n\n灼熱峽谷/塔納利斯/辛特蘭：\n"
			.."相同的步驟，但分別具有火、土和\n空氣的味道。\n\n"
			.."你現在有四個“回應 X 的呼喚”任務\n以及每個元素 3 個元素碎片。\n\n"
			.."菲拉斯：農水元素怪物以獲得 12 個元素\n精華，每個元素碎片 3 個，這些碎片是你\n"
			.."一路上收集的。一邊農一邊組合。\n菲拉斯四根柱子：當且僅當\n"
			.."你滿足所有要求並且可以擊敗\n 50 級的怪物時才來這裡。不要浪費你的努力。\n\n"
			.."點擊你背包中的四個碎片。砰！\n\n注意：如果你在那裡遇到一個友好的薩滿，\n就有可能跳過最後的戰鬥。給他/她一些金幣\n吧！"
st.shaman.tidalWaves = "在標記位置的帳篷外有一個小盒子。你將獲得一把舊鑰匙。\n\n"
			.."在附近的湖泊/瀑布中，游到\n一艘沉船並掠奪舊箱子。\n\n"
			.."別那麼快！四個閃光的元素\n將會出現（41-42 級）。準備好游走！" 
-- Warlock Phase 1
st.warlock.metamorphosis = "第一個任務**不需要**進入黑石深淵副本。你可以在副本外的廢墟中，從暮光教徒身上拾取索蘭魯克碎片。但你需要進入影牙城堡，從影牙黑暗靈魂身上拾取另一個碎片。\n\n（黑石深淵位於灰谷的北海岸，影牙城堡位於銀松森林的南部。）\n\n“流言四起”任務會派你前往赤脊山東北角的伊爾加拉之塔，以及黑海岸北部的阿薩拉克斯之塔。\n\n召喚儀式需要前往灰谷東部的費爾伍德峽谷。使用 10 個鮮血，你可以在附近的地獄咆哮祭壇上啟動儀式，並在站在紫色符文光環內使用吸取靈魂技能擊敗幾波惡魔。\n\n最終，神秘的旅行者會出現。\n\n回到多安那裡，接受最後的任務。恭喜你！"

st.warlock.channeling = "有很多選擇。聯盟玩家最好找到格雷森·鐵爐，一個在洛克莫丹漫長道路上游走的商人。他出售惡毒派。吃了它，肚子疼之後檢查你的包包，你就是勝利者！\n\n部落玩家最好前往棘齒城西南部的荊棘祭壇，使用生命虹吸直到生命值降為零。聯盟玩家也可以來這裡。\n\n部落玩家也可以選擇銀松森林的虐待狂。你需要對他施放魯莽詛咒。\n\n聯盟和部落玩家都可以在黑海岸的阿薩拉克斯之塔，從黑暗海岸狂熱者身上獲得掉落物。\n\n另一個選擇是在西部荒野刷收割者。你將與其他玩家和法師雕文師競爭。你需要收集一個備用收割者零件（從守望者和魔像身上掉落）和一個元素核心（從沙塵暴身上掉落），製作一個原型引擎物品。將它安裝到收割者原型機中，啟動它，然後擊敗它，拾取掉落物！"

st.warlock.grace = "你需要獲得一本不祥之書，它可以從以下怪物身上掉落：提瑞斯法林地阿加曼德磨坊的暗眼骨術師、杜洛塔爾回音群島的巫毒/被詛咒的巨魔（部落）、艾爾文森林碧玉礦洞前的狗頭人地卜師或石碑湖的迪菲亞盜賊巫師（聯盟）。\n\n"
st.warlock.graceEF = "同時需要獲得豺狼人血液。好的地點包括霍格的營地（但不是霍格本人），以及石碑湖西北部，那裡很容易找到，但數量不多。\n\n也需要一個狼顎骨。石碑湖的北部或碧玉礦洞的南部最容易找到。\n\n前往暴風城西南部的被宰的羔羊旅館地下室，在召喚法陣上召喚索博茲。"

st.warlock.graceDM = "同時需要獲得溫迪戈血液。溫迪戈位於卡拉諾斯下方/西部。狼顎骨很豐富。卡拉諾斯北部有很多狼，但寒脊山脈也有容易找到的。前往閃光嶺，在那裡你會找到一個召喚法陣。召喚並殺死索博茲。恭喜！"

st.warlock.graceDur = "杜洛塔爾靠近奧格瑪的一些額外地點也被標記為不祥之書的掉落點。\n\n馬庫拉腿部掉落自海灘上的螃蟹。然而，頭骨位於提拉加德城堡區域。召喚儀式用的法陣位於主回音群島的東南角。召喚並殺死索博茲！"

st.warlock.graceTG = "不祥之書從阿加曼德的暗眼骨術師身上掉落。豺狼人血液從加倫的鬼屋的腐皮豺狼人身上掉落。\n\n獵犬顎骨（不是你在網上看到的狼）隨處可見，但我在地圖上標記了一些位於阿加曼德/加倫區域之間的位置。\n\n當需要召喚索博茲時，前往幽暗城下水道入口。法陣位於大約一半的位置。召喚。殺死。恭喜！"

st.warlock.firesWake = "從在南海鎮和塔倫米爾之間游走的齊克希爾那裡購買炸藥。\n\n然後前往敦霍爾德城堡。穿過橋，沿著小路前進，左轉，然後進入舊堡壘。向右看，有一堆瓦礫。\n\n站在它上面！！！你剛剛花了 1 個金幣！使用你的炸藥。\n\n從儲物櫃中拾取你的符文。快點！任何混蛋都可以偷走它！5 金幣！！！\n\n雕刻它。輕鬆獲勝，雞肉晚餐！"
st.warlock.shadowbolts = "部落玩家只需前往貧瘠之地污泥沼澤的盧格維澤爾主管，就在奧格瑪附近。使用你的吸取靈魂。拿走你新的貪婪之魂，並在附近的飢餓神像上使用。恭喜！\n\n或者前往銀松森林，從 Ravenclaw 怪物身上獲得一個折磨的靈魂。獲得後，你必須首先使用生命分流。現在使用你的折磨的靈魂。殺死幽靈。勝利！\n\n聯盟玩家如果在黑海岸做一個特定的任務，可能會自動獲得符文。我已經標記了位置和任務狀態。\n\n聯盟玩家最好前往洛克莫丹的鐵環挖掘場。你會在東南角看到惡魔遺骸。用暗影法術攻擊它。殺死生成的怪物！\n\n或者，沿著西部荒野的南部海岸尋找老 Murk-Eye。使用你的吸取靈魂並獲得一個海洋之魂。前往海岸上的海洋神像。對它使用你的海洋之魂。恭喜！\n\n（我懷疑部落玩家也可以來這裡）\n\n（我認為聯盟玩家可以做兩個部落任務！）"

st.warlock.tactics = "部落玩家前往提瑞斯法林地的一個死去的教徒。在湖的東邊，靠近通往血色修道院的路。\n\n聯盟玩家則在艾爾文森林碧玉礦洞盡頭的水晶湖以北找到死去的教徒。\n\n拾取死去的教徒。前往布瑞爾絞刑架之末樓上的魯珀特·博赫（部落）或金郡獅王之傲旅館樓下的馬克西米利安·克羅（聯盟）。\n\n你需要返回死去的教徒。\n\n接下來，你將有 10 分鐘的時間前往幽暗城法師區的卡倫丁·哈爾加（部落）或暴風城法師區被宰的羔羊旅館地下室的黑暗束縛者加金（聯盟）。\n\n享受你的獎勵！"

st.warlock.soulSiphon = "聯盟玩家必須選擇丹莫羅東南角的鐵環營地的貝爾德隊長或艾爾文森林的霍格。\n\n部落玩家同樣會選擇奧格瑪外的骷髏岩洞穴中的加茲烏茲，或者提瑞斯法林地加倫鬼屋的房子裡的蛆眼。\n\n你的目標是吸取並獲得一個污染的靈魂碎片。\n\n你還需要從任何生物身上獲得一個純淨的靈魂碎片。\n\n將兩個碎片帶到卡拉諾斯旅館以南的加克利克·虛空扭曲者，或者如果你是聯盟，則帶到金郡獅王之傲旅館的達米安·凱恩。\n\n部落玩家將前往剃刀嶺兵營的達馬克·血嚎或幽暗城法師區的丹頓·布萊克威。\n\n你會收到你的靈魂虹吸符文！"
-- Warlock Phase 2
st.warlock.dance = "在奧特蘭克山脈、淒涼之地、荊棘谷或\n"
			.."千針石林找到一具魯莽術士的屍體，並拾取一块硫磺雕刻。\n\n現在對自己使用地獄烈焰（30 級）。有隨機\n"
			.."機會將雕刻“轉變”為\n邪惡符文。獲利！"
st.warlock.invocation = "從激流堡的 conjurer 身上獲得 10 個 conjurer 的吊墜。然后去附近房子的\n"
			.."樓上，在虚空棱鏡處組合吊墜。一个虚空追尋者將會出現。\n"
			.."殺死并拾取"
st.warlock.shadowflame = "站在淒涼之地東南部暗影裂口的\n獻祭祭壇處，施放暗影\n"
			.."防护、獻祭和灵魂连接，然后與祭壇互動。\n\n"
			.."在引导結束時，誘惑者希娜\n將會出現。殺死并拾取她"
st.warlock.synergy = "你必須獲得變形\n符文。如果沒有，那么請與貧瘠之地\n"
			.."南部的多安·卡漢交談。\n\n你可能收到了郵件。無論如何，去\n"
			.."貧瘠之地南部的拉澤爾·安德那里，\n開始“堅實的基礎”任務，它會帶你\n"
			.."去灰谷的暗影樹枝。\n\n你回到拉澤爾那里，開始“靈魂容器”\n"
			.."任務，它需要一个灵魂容器（工程學 205），\n可以在拍賣行找到。在淒涼之地的\n"
			.."瑪諾洛克洞穴交任務。\n最後一個任務，擊敗德薩爾泰克（40 級）-> 符文"
-- Warlock Phase 3
st.warlock.pandemic = "在一個死去的\n患病的恐怖圖騰薩滿附近找到一個恐怖圖騰的箱子。拾取。\n\n"
			.."往西走，在主東西路徑\n的北邊一點找到一個斜坡。上去\n"
			.."經過木爪巢穴。向北走，你會找到一個死去的患病的木爪\n"
			.."秘術師和一個木爪包。拾取。\n\n組合成一個患病的自然法杖，\n"
			.."并用它來喚醒位於主路\n"
			.."以東和以南的患病的森林行者。殺死。獲得豐厚的戰利品！"

-- Warrior Phase 1
st.warrior.bloodFrenzy = "只是一場友好的決鬥。所以去打敗他吧！"

st.warrior.consumedRage = "位於濕地塞爾根岩洞的後方（當然）。25 級，但不是特別難。獵人和戰士（聯盟/部落）"

st.warrior.devastate = "一路上你會收到以下戰利品。每個 NPC 需要三個物品。你可以單獨或一起交還。\n\n物品掉落在與 NPC 相同的區域。部落 NPC 之間有一點重疊。\n\nNPC 和位置如下：\n* 朱尼·鋼鐵通行證，卡拉諾斯；* 維多利亞·伍茲，暴風城；* 德爾溫娜，達納蘇斯；* 瓦希·碎骨者，剃刀嶺；* 瓦特亞·木材蹄，血蹄村；* 多拉克·格雷夫斯，幽暗城。\n\n"

st.warrior.devastateDel = "德爾溫娜需要一個被砍下的老虎頭、被砍下的貓頭鷹頭和被砍下的蜘蛛頭。所有這些都很豐富，特別是在多拉納爾東南部的星風村地區。避開神諭林地，因為那裡有網木蜘蛛。其他怪物被命名為“劍齒”和“尖嘯”。\n\n地圖上沒有標記任何一個。太多了！"

st.warrior.devastateDor = "多拉克需要一個被砍下的蝙蝠頭，來自提瑞斯法林地各處的無數黃昏蝙蝠（阿加曼德磨坊除外），地圖上沒有標記；一個被砍下的豺狼人頭，來自加倫鬼屋南部和那裡的任何腐皮豺狼人；以及一個被砍下的魚人頭，來自海岸上的任何邪惡鰭魚人。"

st.warrior.devastateJunni = "朱尼需要：來自東南角岩石下巴怪物的原始穴居人心臟；被砍下的巨魔頭，來自西南角的霜鬃怪物（大部分）；來自溫迪戈洞穴的溫迪戈的被砍下的溫迪戈爪子。"

st.warrior.devastateVah = "瓦希需要一個來自南部海岸的被砍下的半人馬頭；一個來自奧格瑪/剃刀嶺之間的塵風鳥身女妖飛地的被砍下的鳥身女妖頭；以及來自剃刀嶺以西的剃刀沼澤野豬的被砍下的野豬頭。"

st.warrior.devastateVat = "瓦特亞需要一個來自東北部剛毛野豬入侵者的被砍下的野豬頭；一個來自莫高雷北部邊緣的鳥身女妖的被砍下的鳥身女妖頭；以及一個來自血蹄村西部和南部的白鬃豺狼人的被砍下的豺狼人頭。"
st.warrior.devastateVik = "維多利亞需要：來自任何礦井附近的穴居人的被砍下的狗頭人頭；來自水晶湖的被砍下的魚人頭；來自豺狼人的被砍下的豺狼人頭， 在霍格附近有很多。"

st.warrior.endlessRage = "聯盟可以選擇追捕西部荒野南部海岸的老Murk-eye；與洛克莫丹東北角的精英食人魔戰鬥，或者擊敗你任務中心的Sedorax 女士。\n\n部落需要從十字路 口旅館旁grab 一個容易看到的旗幟，然後挑戰北望堡的Stonebrew 中尉，或者殺死銀松森林Skittering 黑暗洞穴中的一個怪物。\n\n做任何方便的事。"

st.warrior.frenziedAssault = "與以下其中一位交談：奧格瑪The Drag 的Zamja；雷霆崖Spirit Rise 的Netali Proudwind；提瑞斯法林地佈瑞爾旅館的Penny Hawkins（部落）或鐵爐堡旅館 老闆Bruuk Barleybeard、暴風城The Park 的Liv Bradford；泰達希爾Dolanaar 的旅館老闆Keldamyr（聯盟）\n\n他們會要求你彈飛某人。很簡單！"

st.warrior.furiousThunder = "艾爾文森林的Hogger（聯盟/部落）。\n\n丹莫羅的嚎叫者Edan、Fyodi、老冰鬍子、Vagash 和Vejrek；艾爾文森林的金牙、 Gruff Swiftbite；泰達希爾的Gnarlpine 儲藏處（聯盟）\n\n杜洛塔爾的死亡剝皮者、閃電皮怪物；杜洛塔爾骷髏岩洞穴的Felweaver Scornn（稀有）、Gazz'uz；杜洛 塔爾試煉谷的Sarkoth；莫高雷的Arra'chea 怪物、Lurkmane、Snagglespear、The Rake、Sister Hatelash；提瑞斯法林地的Gillgar（部落）。\n\n呼！拾取並學習！"

st.warrior.harenTip = "當戰鬥圖騰從任何 Mo'grosh 食人魔身上掉落時，使用它來挑戰在湖附近奔跑的 Haren Swifthoof 進行決鬥。"

st.warrior.quickStrike = "部落應該去棘齒城的Kilxx，購買一個魚叉，然後遊出去用魚叉捕獲Bruuz。\n\n聯盟的選擇包括，類似地，用一個gnarled 魚叉擊敗Paxnozz。 位置在黑海岸瑪西斯特拉廢墟的西邊，但首先要從一隻死海龜的頭上拾取戰利品。\n\n聯盟也可以從西部荒野的任何迪菲亞怪物身上獲得一個鰓毒，用 它殺死南部海岸的魚人以獲得一個海洋之魂，然後前往美杜莎雕像，然後殺死下一個怪物。\n\n更簡單的是洛克莫丹塞爾薩瑪爾以西的穴居人。 他們會掉落一個晶洞。最好看看我提供的工具提示。"

st.warrior.ragingBlow = "需要取得三個物品。頭盔位於銀松森林南部的影牙城堡，這是一個22-30 級的地牢。它在第四個Boss 指揮官斯普林維爾身後的長凳 上。\n\n「黑鐵企業家」出售長矛。他位於濕地的Dun Modr，就在阿拉希高地邊界附近。\n\n盾牌很方便地掛在牆上，在赤脊山脈Stonewatch 城堡 的Gath'ilzogg 後面。部落應該在聯盟標記怪物後復活，哈哈。"
-- Warrior Phase 2
st.warrior.bloodSurge = "從巨槌（阿拉希）或碎脊（奧特蘭克）怪物\n身上獲得難以辨認的食譜后，\n"
			.."前往阿拉希高地的斯孔克。\n\n斯孔克會讓你\n在阿拉希高地、荒蕪之地、希爾斯布萊德丘陵\n"
			.."和悲伤沼澤尋找食物。\n\n"
			.."回到斯孔克并擊敗他，以獲得你的豐厚戰利品。\n\n你還將獲得一把藍色的單手錘！"
st.warrior.focusedRage = "首先殺死枯萎樹皮怪物（32-35 級），直到\n掉落枯萎樹皮木槌。現在進入附近的\n"
			.."洞穴，前往枯萎樹皮鑼。使用\n木槌敲擊鑼。這將生成一個枯萎樹皮\n"
			.."巨人（35 級）。殺死。拾取"
st.warrior.intervene = "有三個戰鬥假人。你必須對第一個假人使用\n處決（24 級），對第二個假人使用\n"
			.."嘲諷（10 級），對第三個假人使用盾牌猛擊（12 級）。\n\n一個箱子會神奇地出現。裡面有豐厚的戰利品！\n\n"
			.."最簡單的方法是從劍和盾開始。這不是\n比賽，但要順利完成以確保成功。"
st.warrior.rallyingCry = "搜索區域很大。你可以組隊，\n但要確保在開始時你們都在附近" 
-- Warrior Phase 3
st.warrior.gladiator = "從加基森的菲茲巴茲·秘銀那裡\n接取第一個任務。然后你將前往\n"
			.."艾薩拉的卡金德。你必須擊敗藍龍\n塞魯里奧斯（50 級），它也在艾薩拉。返回加基森，\n"
			.."你的最後一個任務是在\n加基森競技場擊敗卡金德。交任務以獲得你的豐厚戰利品"
st.warrior.tasteForBlood = "收集地圖上標記的四個構造部件。一直往東走\n"
			.."以組裝/召喚湮灭者艾歐達克斯（50 級）。\n\n最好組隊，但在 50 級時可以單獨完成。\n\n"
			.."報告說你可以跳過收集，\n直接組隊去打艾歐達克斯 ;)" 

-- Common Phase 1			
st.agon = "你需要殺死阿貢，一頭野豬。只有一個人會獲得掉落物，無論是單獨還是組隊。重生速度很快，2-3 分鐘。"
st.allClass = { "DRUID", "HUNTER", "MAGE", "PALADIN", "PRIEST", "ROGUE", "SHAMAN", "WARLOCK", "WARRIOR" }
st.allSpellG = { "Survival of the Fittest", "Lone Wolf", "Rewind Time", "Divine Sacrifice", "Serendipity", "Main Gauche",
				"Dual Wield Specialization", "Demonic Pact", "Warbringer" }
st.allSpellACA = { "Skull Bash", "Serpent Spread", "Arcane Surge", "Beacon of Light", "Mind Sear", "Just a Flesh Wound",
					"Healing Rain", "Everlasting Affliction", "Single-Minded Fury" }

st.duskwoodCrypts = "地圖標記指示首先進入哪個地下室。\n\n在第一個地下室左轉。點擊塵封的箱子，拿起破舊的護符盒。退出。\n\n在第二個地下室右轉進入王座室。在沉睡的骨頭上使用護符盒。\n\n你剛剛喚醒了一個 25 級的巫妖。拾取掉落物！"

st.frozen = "部落前往剃刀嶺以東的冰凍馬庫拉，或提瑞斯法林地布萊特沃特湖西北部的冰凍魚人。\n\n聯盟也尋找冰凍魚人，在艾爾文森林的石碑湖，或者他們會去丹莫羅戈爾巴採石場的冰凍穴居人。\n\n這些需要解凍，你需要幫助施加足夠的火焰減益效果。"
st.grizzby = "棘齒城的格里茲比在 20 級以上時有三個任務。然後你可以購買符文。\n\n第一個任務派你前往石爪山脈。掉落率約為 2/3，或者灰谷（聯盟）。\n\n前往濕地完成第二個任務。\n\n最後一個任務是魚油。可從艾澤拉斯各地獲得。我標記了費拉拉斯、悲傷沼澤、淒涼之地和荊棘谷。所有這些地方的掉落率都超過 40%。或者，如果你很富有，可以交易或在拍賣行上購買！"

st.livAndStuart = "斯圖爾特通常站在樓梯腳下。如果你還沒有和利夫·布拉德福德交談過，請先和她交談。\n\n快速重生。兩者都在未命名的旅館裡。"

st.secretCoven = "在被宰的羔羊旅館地下室的“秘密”術士結社中"

st.starterZoneClass = "所有位置都在你的起始區域，從你的職業訓練師那裡。你不可能錯過！目標也標記了。"

st.supplyFaction = "與艾澤拉斯商業管理局（聯盟）或杜洛塔爾供應和後勤（部落）達到友好聲望。現在你可以購買符文了！\n\n（任務需要 8/9 級）"

st.woundedAdventurer = "前往丹莫羅的灰熊巢穴；艾爾文森林傑羅德登陸場以東的山丘；泰達希爾神諭林地以東（聯盟）。\n\n通過莫高雷風險投資公司礦井的北出口到達壁架；杜洛塔爾森金村以西的科爾卡懸崖。\n\n點擊骨架。另一個人點擊召喚門戶。\n\n點擊靈魂以獲得戰利品。"

st.zixil = "他擁有艾澤拉斯所有限量庫存物品中最廣泛的清單。最好現在就囤積！"

-- Common Phase 2
st.amaryllis = "首先前往悲傷沼澤的阿瑪麗利斯·韋伯，在那裡你可以購買一個昆蟲學入門套件，50 銀。\n\n按任意順序，在荊棘谷納茲費里蒂伐木營地以東和東南方向捕捉一隻樹棲狼蛛；在阿拉希高地的一個穀倉或馬廄中捕捉一隻乾草象鼻蟲；在淒涼之地的科多獸骨墓地捕捉一隻食肉甲蟲。\n\n返回阿瑪麗利斯以獲得豐厚的戰利品。"

st.dalaranAgent = "前往死亡之風山口的阿里登營地。它靠近悲傷沼澤的路徑。\n\n與達拉然特工交談，從她那裡獲得阿里登的印記。裝備它。現在你必須找到並殺死 7 個黑暗騎士（41 級），並拾取他們的遺物。\n\n當黑暗騎士在附近時，你會收到一個黑暗存在增益效果。\n\n區域包括：阿拉希高地、荒蕪之地、死亡之風山口、淒涼之地、暮色森林、悲傷沼澤和貧瘠之地。\n\n完成後，返回達拉然特工並交還每個“任務”。最後一個任務會獎勵你叢林之王符文。\n\n黑暗騎士的重生時間為 5 分鐘。"

st.dalaranRelic = "奇怪的達拉然遺物（"

st.dalaranSpeakTo = "與死亡之風山口阿里登營地的達拉然特工交談"
st.dalaranQuest = { 80098, 80147, 80148, 80149, 80150, 80151, 80152, 80120 }
st.dalaranQuestName = { st.dalaranRelic .."好奇的)", st.dalaranRelic .."閃閃發光的)",
						st.dalaranRelic .."嗡嗡作響的)", st.dalaranRelic .."奇怪的)", 
						st.dalaranRelic .."沉重的)", st.dalaranRelic .."令人毛骨悚然的)", 
						st.dalaranRelic .."濕滑的)", "為達拉然服務" } 
st.dungeonDrops = "剃刀沼澤、奧達曼、血色修道院（所有側廳）\n中所有首領的掉落物"					
st.pillaged = "在科多獸墓地西北\n找到被洗劫的營火。接受任務，\n"
			.."然后去找比布利·富茨巴克，他在\n科爾梅克小屋附近。他會給你“逃亡中”\n讓你完成。\n\n"
			.."提示會讓你去找藏寶海灣\n鹹水手酒館酒吧里的托卡爾。她會\n"
			.."讓你完成“櫻桃換你的想法”。\n"
			.."從酒保那裡買櫻桃烈酒，然后接取\n“盜亦有道”。\n\n"
			.."你需要去從阿拉希高地\n通往濕地的橋。穿過附近的\n"
			.."小繩橋，然后走到水邊。登上船（點擊它）。\n\n"
			.."你被傳送到了最東邊的\n海岸。與 40 級的伊拉里·暮羽交談。\n"
			.."她會逃跑/被殺死，留下一個掉落的\n小包，裡面裝著她戰利品箱的鑰匙。\n"
			.."拿走鑲嵌寶石的盒子并打開它，\n以獲得你的符文！"
-- Common Phase 3
st.enragedVoidWalker = "從荒野流浪者暗影法師身上農編碼術士筆記，\n從荒野流浪者盜賊身上農荒野流浪者密碼。在加基森的東南方。\n\n組合-> 解密術士筆記。 前往\n"
.."附近的召喚密卷並使用\n筆記。擊敗狂怒的虛空行者（43 級精英）\n"
.."並拾取即可獲勝！\n\n如果組隊，那麼只需要一個人\n擁有這兩件物品，它們可以在拍賣行買到。\n\n"
.."牧師和薩滿都需要這個，所以不要\n驚訝在那裡看到其他職業"
st.enragedVoidWalkerStart = "塔納利斯的加基森東南方，是你要農\n荒野流浪者怪物的地方。稍後，一個 43 級精英會出現"
st.felPortals = "\n邪能傳送門：灰谷、黑海岸、淒涼之地、赤脊山、銀松森林、悲傷沼澤、貧瘠之地、西部荒野。"
st.getCGM = "\n位置太多。使用塔拉埃佐爾的插件“箱子、裝備和更多”來獲取所有已知位置，\n以及其他很酷的東西！"
st.emeraldSpell = { "Gore", "T.N.T.", "Molten Armor", "Improved Hammer of Wrath", "Void Zone", "Cut to the Chase",
					"Burn", "Unstable Affliction", "Shield Mastery" }
st.emeraldWardens = "Purchasable from an Emerald Warden Quartermaster at Friendly rep in Ashenvale, Duskwood,\n"
			.."Feralas, The Hinterlands. Obtain rep through group/solo questing via portals in the same zones."
st.nightmareIncursions = "Duskwood: Level 23+, Ashenvale: 37+, Feralas: 47+, The Hinterlands: 47+\n\n"
			.."Go to the marked location and speak to a Field Captain.\nAfter completing the quests, which require defeating\n"
			.."demonic creatures near to portals as well as speaking\nto an agent, you'll progress to entering the portal to\n"
			.."complete a variety of challenges. All of this rewards\nEmerald Wardens reputation.\n\n"
			.."The quests may be shared with up to four people. It is\nstrongly recommended to group up and share quests. Thus,\n"
			.."the group will complete several tasks at the same time.\n\n"
st.leylineGuide = "Visit four Leyline Confluxes in each of Azshara, Feralas,\nThe Hinterlands and Searing Gorge.\n\n"
			.."Use either a Warlock's Worldcore Fragment (from Imp\nexplorations) or a Mage's Scroll of Geomancy.\n\n"
			.."An Enraged Leywalker (L47e) will spawn. Immune to arcane\ndamage. It will drop a Leycryst. Combine all four. Voilà!\n\n"
			.."Paladins/Priests must group up to do this"
st.leylineSummary = "At Azshara, Feralas, The Hinterlands and Searing Gorge you must \"attune\" to a leyline with\n"
					.."a Scroll of Geomancy (Mage decipher) or Worldcore Fragments (Warlock Imp explorations)"
st.leylineSummaryExtra = ".\nPaladins and Priests must group with one or more Mages/Warlocks"
st.wildGods = "Find the Shadowtooth Emissary @ the Emerald\nSanctuary, southern Felwood. Accept \"The Wild Gods\".\n\n"
			.."Kill Vilebranch mobs (L45e-51e) @ Jinth'Alor,\nsouth-east Hinterlands, to obtain a Wildwhisper\nDraught.\n\n"
			.."In Razorfen Downs (far south Barrens), do a full\nclear of the last boss. Drink the Draught. Speak to\n"
			.."the Spirit of Agamaggan and hand in / pick up parts\none and two of The Wild Gods. You'll receive Agamaggan's\nRoar.\n\n"
			.."You must now do a full clear within the following\ndungeon areas. You will know when fully cleared as there'll\n"
			.."be a chat message \"You feel a shadowed presence\". Blow\nthe horn and the NPC becomes hostile (L52e). Kill and loot\n"
			.."a Wild Offering. Return to the Shadowtooth Emissary.\n\nZul'Farrak's stair event - complete all waves and\n"
			.."Nekrum Gutchewer and Shadowpriest Sezz'ziz. Now enter\nGahz'rilla's pool area. Blow your horn near the Ghostly\n"
			.."Spider. Gahz'rilla kill is not necessary.\n\nMaraudon: The water near Princess Theradras. Clear to\n"
			.."spawn a Ghostly Raptor. Blow your horn.\n\nBlackrock Depths: Defeat Gerstahn, Grebmar and the Ring of Law"
st.wildGodsSpells = { "Improved Frenzied Regeneration", "Lock and Load", "Advanced Warding",
				"Improved Sanctuary", "Divine Aegis", "Combat Potency", "Riptide", "Vengeance",
				"Sword and Board" }
st.wildGodsStart = "首先與費伍德森林南部翡翠聖地的暗牙使者交談" 

--=======================================================================================================
--
-- QUICK START / MAIN DATA STRUCTURE
--
--=======================================================================================================

st.dungeonSummary = "從血色修道院、剃刀沼澤和奧達曼的命名精英/Boss 身上掉落。"

st.supplyFactionStart = "伊萊恩·康普頓，“艾澤拉斯商業管理局供應商”，暴風城（聯盟），\n喬娜，“杜洛塔爾供應和後勤供應商”，奧格瑪（部落）"

st.twoPlusHealers = "2+ 玩家 - 治療者。第一步：找到冒險者的遺骸/靈魂：\n"

ns.runes = {
		
	["DRUID"] = {
		-- Phase 1
		["Fury of Stormrage"]={ rune="Lunar Idol", phase=1, spellID=414799, level=2, icon=1, slot=5,
				start="Grellkin mobs, Shadowglen (A). Chest in Brambleblade Ravine, The Barrens (H)" },
		["Living Seed"]={ rune="Rune of Natural Potential", phase=1, spellID=414677, level=2, icon=2, slot=5,
				start="Gather Glade Flowers from all over Teldrassil (A); Gather Prairie Flowers from all over Mulgore (H)" },
		["Sunfire"]={ rune="Rune of The Sun", phase=1, spellID=414684, level=4, icon=3, slot=10,
				start="White Lunar Stones: south-east Teldrassil (A); south-west Mulgore (H)" },
		["Lifebloom"]={ rune="Rune of Life", phase=1, spellID=408124, level=7, icon=4, slot=7,
				start=st.twoPlusHealers .."Oracle Glade, Teldrassil (A); near northern exit, Venture Co cave, Mulgore (H)" },
		["Mangle"]={ rune="Idol of Ursine Rage", phase=1, spellID=409828, level=10, icon=5, slot=10,
				start="Rageclaw, near Ban'ethil Barrow Den, Teldrassil; Flatland Prowler mobs, north and north-east of Mulgore (H)" },
		["Wild Strikes"]={ rune="Idol of the Wild", phase=1, spellID=407977, level=14, icon=6, slot=5,
				start="Grimtotem mobs, south-east entrance/exit of Stonetalon Mountains" },
		["Lacerate"]={ rune="Rune of Lacerate", phase=1, spellID=414644, level=15, icon=7, slot=10,
				start="Khara Deepwater, The Loch, Loch Modan (A)\n"
					.."Crab Treats from coastal Furlbogs, Darkshore; Abandoned Snapjaw Nest, Forgotten Pools, The Barrens" },
		["Skull Bash"]={ rune="Rune of Skull Bash", phase=1, spellID=410176, level=15, icon=8, slot=7,
				start=st.supplyFactionStart },
		["Starsurge"]={ rune="Rune of the Stars", phase=1, spellID=417157, level=20, icon=9, slot=7,
				start="Speak to Grugimdern, under a bridge, north-east Wetlands" },
		["Savage Roar"]={ rune="Ferocious Idol", phase=1, spellID=407988, level=20, icon=10, slot=7,
				start="Den Mother, west of Bashal'aran, Darkshore; Kolkar's Booty in centaur camps, The Barrens (H)" },
		["Survival of the Fittest"]={ rune="Rune of Survival", phase=1, spellID=411115, level=20, icon=11, slot=5,
				start="Grizzby @ Ratchet, The Barrens" },
		["Wild Growth"]={ rune="Rune of Wild Growth", phase=1, spellID=408120, level=25, icon=12, slot=10,
				start="Speak to Loganaar, Nighthaven, Moonglade" },
		-- Phase 2
		["Survival Instincts"]={ rune="Rune of Instinct", phase=2, spellID=408024, level=27, icon=13, slot=8,
				start="Go to Amaryllis Webb in the Swamp of Sorrows to obtain a catching kit. No killing" },
		["Dreamstate"]={ rune="Rune of the Dreamer", phase=2, spellID=408258, level=27, icon=14, slot=8,
				start="Kill Kolkar Centaurs in Desolace for a Desiccated Seed Pod" },
		["Berserk"]={ rune="Idol of the Heckler", phase=2, spellID=417141, level=28, icon=15, slot=6,
				start="Use Challenging Roar on the Beastly Effigy in Thousand Needles" },
		["Eclipse"]={ rune="Rune of Eclipse", phase=2, spellID=408248, level=30, icon=16, slot=6,
				start="Go to a pillaged campsite in Desolace" },
		["Nourish"]={ rune="Rune of Nourishing", phase=2, spellID=408247, level=35, icon=17, slot=6,
				start="Kill a Rotting Ancient in Dustwallow Marsh to obtain a Rotten Seed / short quest chain" },
		["King of the Jungle"]={ rune="Rune of the Jungle King", phase=2, spellID=417046, level=40, icon=18, slot=8,
				start=st.dalaranSpeakTo },
		-- Phase 2 Skill Books
		["Deeper Wilds"]={ skillBook="Leaflet of Deeper Wilds", spellID=436956, level=1, start= st.dungeonSummary },
		["Enhanced Restoration"]={ skillBook="Leaflet of Enhanced Restoration", spellID=417123, level=1, start= st.dungeonSummary },
		["Revive"]={ skillBook="Leaflet of Revive", spellID=437138, level=1, start= st.dungeonSummary },
		-- Phase 3
		["Gore"]={ rune="Rune of Bloodshed", phase=3, spellID=417145, level="23/37/47", icon=19, slot=1, start=st.emeraldWardens },
		["Gale Winds"]={ rune="Rune of the Windstorm", phase=3, spellID=417135, level=40, icon=20, slot=1,
				start="Loot the rune from Namida Grimtotem (L43e), Windtotem Compound, Feralas. West of Camp Mojache" },
		["Elune's Fires"]={ rune="Rune of the Moon Goddess", phase=3, spellID=414719, level=44, icon=21, slot=9,
				start="Go to western Azshara and locate a Traveller's Knapsack, which is inside a temple" },
		["Improved Barkskin"]={ rune="Idol of the Raging Shambler", phase=3, spellID=431388, level=44, icon=22, slot=1,
				start="Learn Barkskin (L44). Kill Thistleshrub Dew Collectors (L47-48) in their Valley in south-west Tanaris" },
		["Efflorescence"]={ rune="Rune of Efflorescence", phase=3, spellID=417149, level=45, icon=23, slot=9,
				start="Go to the far south of Feralas and speak to Tyrisius, who is in a tower" },
		["Improved Frenzied Regeneration"]={ rune="Rune of Primal Energy", phase=3, spellID=431389, level=50, icon=24, slot=9,
				start=st.wildGodsStart },
		
		spells={ "Fury of Stormrage", "Living Seed", "Sunfire", "Lifebloom", "Mangle", "Wild Strikes",
				"Lacerate", "Skull Bash", "Starsurge", "Savage Roar", "Survival of the Fittest",
				"Wild Growth", "Survival Instincts", "Dreamstate", "Berserk", "Eclipse", "Nourish",
				"King of the Jungle", "Gore", "Gale Winds", "Elune's Fires", "Improved Barkskin",
				"Efflorescence", "Improved Frenzied Regeneration", },
		skillBooks={ "Deeper Wilds", "Enhanced Restoration", "Revive" },
	},

	["HUNTER"] = {
		-- Phase 1
		["Chimera Shot"]={ rune="Rune of Chimera", phase=1, spellID=409433, level=2, icon=1, slot=10,
				start="Thorgas Grimson, Anvilmar, Coldridge Valley; Ayanna Everstride, Aldrassil, Shadowglen (A).\n"
					.."Jen'Shan, Valley of the Trials; Lanka Farshot, Red Cloud Mesa (H)" },
		["Explosive Shot"]={ rune="Rune of Explosive Shot", phase=1, spellID=409552, level=5, icon=2, slot=10,
				start="Various Elites/Rares in Dun Morogh (A) and Mulgore (H); Rageclaw, in the Ban'ethil Barrow Den, Teldrassil (A)" },
		["Master Marksman"]={ rune="Rune of Marksmanshi", phase=1, spellID=409428, level=6, icon=3, slot=5,
				start="Rustling Bush: off the path towards Oracle Grove, Teldrassil; south of Brewnall Village, Dun Morogh (A)\n"
					.."West from Razor Hill, veering south; east of Bloodhoof Village, near the lake, Mulgore (H)" },
		["Flanking Strike"]={ rune="Rune of Flanking", phase=1, spellID=415320, level=8, icon=4, slot=7,
				start="Jorul, east of Brewnall Village, near the cave, Dun Morogh; Mowgh, northern Teldrassil, opposite the Glade (A)\n"
					.."Raul, northern Echo Isles, Durotar; Mokwa, north-west of Bloodhoof Village, Mulgore" },
		["Carve"]={ rune="Rune of Carve", phase=1, spellID=425711, level=10, icon=5, slot=10,
				start="Tame animals with reagent: Amberstill Ranch, Dun Morogh; Relaeron, Darnassus (A)\n"
					.."Razzil, Razor Hill, Durotar; Takoda Sunmane, Bloodhoof Village, Mulgore (H)" },
		["Beast Mastery"]={ rune="Rune of Beast Mastery", phase=1, spellID=409368, level=15, icon=6, slot=10,
				start="Furbolg camp, Darkshore; Farstrider Lodge, Loch Modan; Silverspur, north of Gold Coast Quarry, Westfall (A)\n"
					.."Ferocious Grizzled Bear, northern Silverpine Forest; Patrolling Cheetah, north of Taurajo, The Barrens (H)" },
		["Serpent Spread"]={ rune="Rune of Serpent Spread", phase=1, spellID=425738, level=15, icon=7, slot=7,
				start=st.supplyFactionStart },
		["Kill Command"]={ rune="Rune of Kill Command", phase=1, spellID=409379, level=20, icon=8, slot=7,
				start="Jixo Madrocket, near Sun Rock Retreat, Stonetalon Mountains (A/H)" },
		["Sniper Training"]={ rune="Rune of the Sniper", phase=1, spellID=415399, level=20, icon=9, slot=7,
				start="Gnarled Harpoon, west of the Ruins of Mathystra, Darkshore; Kackle, in The Loch (south), Loch Modan;\n"
					.."Defias Scout, Sentinel Hill, Westfall (A); Kilxx, Ratchet, The Barrens (H)" },		
		["Lone Wolf"]={ rune="Rune of Lone wolf", phase=1, spellID=415370, level=20, icon=10, slot=5,
				start="Grizzby @ Ratchet, The Barrens" },
		["Heart of the Lion"]={ rune="Rune of Heart of the Lion", phase=1, spellID=409580, level=25, icon=11, slot=5,
				start="Carrodin, rear of the Thelgen Rock Cave, Wetlands (A/H)" },
		["Cobra Strikes"]={ rune="Rune of Cobra Strikes", phase=1, spellID=425713, level=25, icon=12, slot=5,
				start="Zixil, wanders between Tarren Mill and Southshore, Hillsbrad Foothills (A/H)" },
		-- Phase 2
		["Expose Weaknesss"]={ rune="Rune of Expose Weakness", phase=2, spellID=409504, level=26, icon=13, slot=6,
				start="Kill Ogres (L36-43) and Troggs (L39-41) in the Badlands" },
		["Invigoration"]={ rune="Rune of Invigoration", phase=2, spellID=437997, level=27, icon=14, slot=8,
				start="Go to Amaryllis Webb in the Swamp of Sorrows to obtain a catching kit. No killing" },
		["Trap Launcher"]={ rune="Rune of the Trapper", phase=2, spellID=409541, level=30, icon=15, slot=8,
				start="Go to a pillaged campsite in Desolace" },
		["Dual Wield Specialization"]={ rune="Rune of the Scrapper", phase=2, spellID=409687, level=32, icon=16, slot=8,
				start="Go to a location south-west from Hemet Nesingwary's camp in Stranglethorn Vale" },
		["Steady Shot"]={ rune="Rune of Steady Shot", phase=2, spellID=437123, level=33, icon=17, slot=6,
				start="Kill Needletooth (L35). Witherbark Village lake, Arathi Highlands" },
		["Melee Specialist"]={ rune="Rune of Close Combat", phase=2, spellID=415352, level=40, icon=18, slot=6,
				start=st.dalaranSpeakTo },
		-- Phase 2 Skill Books
		["Aspect of the Viper"]={ skillBook="Treatise on Aspect of the Viper", spellID=415423, level=1, start= st.dungeonSummary },
		-- Phase 3
		["T.N.T."]={ rune="Rune of Detonation", phase=3, spellID=428717, level="23/37/47", icon=19, slot=9, start=st.emeraldWardens },
		["Raptor Fury"]={ rune="Rune of the Raptor", phase=3, spellID=415358, level=40, icon=20, slot=9,
				start="Drops off Zopilote (L43e), just south of Gadgetzan, across all of northern Tanaris" },
		["Catlike Reflexes"]={ rune="Rune of the Jungle Cat", phase=3, spellID=415428, level=40, icon=21, slot=1,
				start="At the back of the Yeti cave in Feralas. Feed a Groddoc Infant Tel'Abim Banana or Soft Banana Bread. Escort" },
		["Rapid Killing"]={ rune="Rune of the Ravenous", phase=3, spellID=415405, level=45, icon=22, slot=1,
				start="Explore inside the Firewatch Cave, far north-western corner of the Searing Gorge" },
		["Focus Fire"]={ rune="Rune of Focused Fire", phase=3, spellID=428726, level=45, icon=23, slot=9,
				start="Loot a Stormcrow Egg from the Stormcrow Nest in the Searing Gorge. Then kill the Enraged Stormcrow" },
		["Lock and Load"]={ rune="Rune of Firepower", phase=3, spellID=415413, level=50, icon=24, slot=9, start=st.wildGodsStart },

		spells={ "Chimera Shot", "Explosive Shot", "Master Marksman", "Flanking Strike", "Carve",
				"Beast Mastery", "Serpent Spread", "Kill Command", "Sniper Training", "Lone Wolf",
				"Heart of the Lion", "Cobra Strikes", "Expose Weaknesss", "Invigoration", "Trap Launcher",
				"Dual Wield Specialization", "Steady Shot", "Melee Specialist", "T.N.T.", "Raptor Fury",
				"Catlike Reflexes", "Rapid Killing", "Focus Fire", "Lock and Load", },
		skillBooks={ "Aspect of the Viper" },
	},
								
	["MAGE"] = {
		-- Phase 1
		["Ice Lance"]={ rune="Spell Notes: Ice Lance (CALE ENCI)", phase=1, spellID=400640, level=2, icon=1, slot=10,
				start="Marryk Nurrbit, back of Anvilmar, Dun Morogh; Khelden Bremen, Northshire Abbey, Elwynn Forest (A)\n"
					.."Mai'ah, Valley of Trials, Durotar; Isabella, Deathknell, Tirisfal Glades (H)" },
		["Living Flame"]={ rune="Spell Notes: Living Flame (MILEGIN VALF)", phase=1, spellID=401556, level=8, icon=2, slot=7,
				start="Kobold mobs near Jasperlode Mine, Elwynn Forest; Frostmane mobs north-west of Kharanos, Dun Morogh (A)\n"
					.."Burning Blade mobs, Skull Rock, Durotar; Scarlet mobs, Solliden Farm, Tirisfal Glades (H)" },
		["Enlightenment"]={ rune="Spell Notes: Enlightenment", phase=1, spellID=412324, level=8, icon=3, slot=5,
				start="Any critter in Elwynn Forest but near Ridgepoint Tower is suggested.\n"
					.."Or Odd Melons you see around any farm in Tirisfal Glades" },
		["Burnout"]={ rune="Spell Notes: Burnout", phase=1, spellID=412286, level=9, icon=4, slot=5,
				start="Frozen: Trogg, Gol'bolar quarry, Dun Morogh; Murloc, Stonecairn Lake, Elwynn Forest (A)\n"
					.."Makrura, east of Razor Hill, Durotar; Murloc, north-west of Brightwater Lake, Tirisfal Glades (H)" },
		["Fingers of Frost"]={ rune="Spell Notes: Fingers of Frost (RING SEFF OSTROF)", phase=1, spellID=400647, level=10, icon=5,
				slot=5, start="Several elite/rares in Dun Morogh; Hogger Elwynn Forest (A),\n"
					.."Zalazane, Echo Isles, Duratar; Gazz'uz, cave near Orgrimmar, Durotar; Gillgar, Tirisfal Glades (H)" },
		["Living Bomb"]={ rune="Spell Notes: BIVOLG NIMB", phase=1, spellID=400613, level=12, icon=6, slot=10,
				start="Stonesplitter caves and northern lake, Loch Modan (A/H);\n"
					.."Extra reward from a small quest chain. Begin: \"A Talking Head\" mob drop on Fenris Isle, Silverpine (H)" },
		["Arcane Surge"]={ rune="Spell Notes: Arcane Surge", phase=1, spellID=425124, level=15, icon=7, slot=7,
				start=st.supplyFactionStart },
		["Regeneration"]={ rune="Spell Notes: Regeneration (TENGI RONEERA)", phase=1, spellID=401417, level=15, icon=8, slot=5,
				start="Stack of books in the south hut of the northern island, The Loch, Loch Modan; Defias Pillager, Westfall (A)\n"
					.."Dalaran Apprentice, Silverpine Forest; Kolkar's Booty in centaur camps, The Barrens (H)" },
		["Arcane Blast"]={ rune="Spell Notes: Arcane Blast", phase=1, spellID=400574, level=18, icon=9, slot=10,
				start="Naga Manuscript from Wrathtail Naga, Zoram Strand, north coast of Ashenvale (A/H)" },
		["Icy Veins"]={ rune="Icy Veins", phase=1, spellID=425121, level=20, icon=10, slot=7,
				start="Collect 10 books across Azeroth, too numerous to list here, but...\n"
					.."see my detailed guide at: Garion Wendell in the Stormwind Mage Tower\n"
					.."portal room (A) or Owen Thadd in the Mages Quarter of Undercity (H)" },
		["Rewind Time"]={ rune="Spell Notes: Rewind Time (TERWEM DINI)", phase=1, spellID=401462, level=20, icon=11, slot=10,
				start="Grizzby @ Ratchet, The Barrens" },
		["Mass Regeneration"]={ rune="Spell Notes: Mass Regeneration", phase=1, spellID=412510, level=25, icon=12, slot=7,
				start="Crypts in the Raven Hill Cemetary, Duskwood" },
		-- Phase 2
		["Chronostatic Preservation"]={ rune="Spell Notes: Chronostatic Preservation", phase=2, spellID=436516, level=26, icon=13,
				slot=8, start="Three separate mob drops in Thousand Needles. Requires three to four mages" },
		["Brain Freeze"]={ rune="Spell Notes: Brain Freeze", phase=2, spellID=400731, level=30, icon=14, slot=8,
				start="Go to a pillaged campsite in Desolace" },
		["Hot Streak"]={ rune="Spell Notes: Hot Streak", phase=2, spellID=400624, level=33, icon=15, slot=6,
				start="Kill the Ancient Fire Elemental (L34/35) in the Alterac Mountains" },
		["Spell Power"]={ rune="Spell Power", phase=2, spellID=412322, level=33, icon=16, slot=8, 
				start="Collect 20 books across Azeroth, too numerous to list here, but...\n"
					.."see my detailed guide at: Garion Wendell in the Stormwind Mage Tower\n"
					.."portal room (A) or Owen Thadd in the Mages Quarter of Undercity (H)" },
		["Frostfire Bolt"]={ rune="Spell Notes: Frostfire Bolt (TROFF IRESTBOL)", phase=2, spellID=401502, level=37, icon=17, slot=6,
				start="Drops from Skullsplitter Mystics, Stranglethorn Vale" },
		["Spellfrost Bolt"]={ rune="Spell Notes: Spellfrost Bolt (PELFRB STOLLOTS)", phase=2, spellID=412532, level=37, icon=18,
				slot=6, start="Drops from Skullsplitter Mystics, Stranglethorn Vale" },
		["Missile Barrage"]={ rune="Spell Notes: Missile Barrage", phase=2, spellID=400588, level=40, icon=19, slot=6,
				start=st.dalaranSpeakTo },
		-- Phase 2 Skill Books
		["Expanded Intellect"]={ skillBook="Tome of Expanded Intellect", spellID=436949, level=1, start=st.dungeonSummary },
		-- Phase 3
		["Molten Armor"]={ rune="Spell Notes: Molten Armor", phase=3, spellID=428741, level="23/37/47", icon=20, slot=9,
				start=st.emeraldWardens },
		["Balefire Bolt"]={ rune="Spell Notes: Balefire Bolt", phase=3, spellID=428878, level=34, icon=21, slot=9,
				start="Obtain a Scroll of Spatial Mending (AH). Locate a Fel Portal and close it." ..st.felPortals ..st.getCGM },
		["Temporal Anomaly"]={ rune="Temporal Anomaly", phase=3, spellID=428885, level=42, icon=22, slot=1,
				start="Garion Wendell (A) or Owen Thadd (H), your friendly librarian, will have a fetch quest at L42." },
		["Deep Freeze"]={ rune="Deep Freeze", phase=3, spellID=428739, level=45, icon=23, slot=1,
				start="Collect 25 books across Azeroth, too numerous to list here, but...\n"
					.."see my detailed guide at: Garion Wendell in the Stormwind Mage Tower\n"
					.."portal room (A) or Owen Thadd in the Mages Quarter of Undercity (H)" },
		["Displacement"]={ rune="Scroll of Controlled Displacement", phase=3, spellID=428861, level=47, icon=24, slot=9,
				start=st.leylineSummary },
		["Advanced Warding"]={ rune="Spell Notes: Advanced Warding", phase=3, spellID=428738, level=50, icon=25, slot=1,
				start=st.wildGodsStart },
		
		spells={ "Ice Lance", "Living Flame", "Enlightenment", "Burnout", "Fingers of Frost", "Living Bomb",
				"Arcane Surge", "Regeneration", "Arcane Blast", "Icy Veins", "Rewind Time", "Mass Regeneration",
				"Chronostatic Preservation", "Brain Freeze", "Hot Streak", "Spell Power", "Frostfire Bolt",
				"Spellfrost Bolt", "Missile Barrage", "Molten Armor", "Balefire Bolt", "Temporal Anomaly",
				"Deep Freeze", "Displacement", "Advanced Warding",  },
		skillBooks={ "Expanded Intellect" },
	},
					
	["PALADIN"] = {
		-- Phase 1
		["Crusader Strike"]={ rune="Libram of Judgement", phase=1, spellID=407676, level=4, icon=1, slot=10,
				start="Bromos Grummner, Anvilmar, Dun Morogh; Brother Sammuel, Northshire Abbey, Elwynn Forest" },
		["Inspiration Exemplar"]={ rune="Rune of Inspiration", phase=1, spellID=407880, level=5, icon=2, slot=7,
				start=st.twoPlusHealers .."Wendigo Cave, Dun Morogh; east of Jerod's Landing, Elwynn Forest" },
		["Rebuke"]={ rune="Rune of Rebuke", phase=1, spellID=425609, level=8, icon=3, slot=7,
				start="Liv Bradford, The Park in Stormwind City" },
		["Aegis"]={ rune="Rune of Aegis", phase=1, spellID=425589, level=8, icon=4, slot=5,
				start="Entrance to Gnomeregan (don't go in), Dun Morogh; deep inside the Jasperloade Mine, Elwynn Forest" },
		["Horn of Lordaeron"]={ rune="Libram of Blessings", phase=1, spellID=425600, level=10, icon=5, slot=5,
				start="On a bench in Thelsamar Tavern, Loch Modan; Undying Laborer, Jangalode Mine, Westfall" },
		["Seal of Martyrdom"]={ rune="Rune of Martyrdom", phase=1, spellID=407798, level=10, icon=6, slot=5,
				start="Brother Romulus, Stormwind Cathedral" },
		["Beacon of Light"]={ rune="Rune of Beckoning Light", phase=1, spellID=407613, level=15, icon=7, slot=10,
				start=st.supplyFactionStart },
		["Hand of Reckoning"]={ rune="Libram of Justice", phase=1, spellID=407631, level=15, icon=8, slot=10,
				start="Far south cave in Stonesplitter Valley, Loch Modan; Leprithus and Defias Drone, Westfall" },
		["Divine Sacrifice"]={ rune="Rune of Sacrifice", phase=1, spellID=407804, level=20, icon=9, slot=7,
				start="Grizzby @ Ratchet, The Barrens" },
		["Avenger's Shield"]={ rune="Rune of the Avenger", phase=1, spellID=407669, level=23, icon=10, slot=7,
				start="Dro'zem the Blasphemous, Redridge Mountians. Well south of the\n",
			"Tower of Althalaxx, northern Darkshore" },
		["Divine Storm"]={ rune="Divine Storm Rune", phase=1, spellID=407778, level=25, icon=11, slot=5,
				start="Top of the Tower of Althalaxx, northern Darkshore" },
		["Exorcist"]={ rune="Libram of Banishmen", phase=1, spellID=415076, level=25, icon=12, slot=7,
				start="Defias mobs on the souther border of Duskwood" },
		-- Phase 2
		["Sacred Shield"]={ rune="Libram of Deliverance", phase=2, spellID=412019, level=18, icon=13, slot=8,
				start="Loot the Libram of Deliverance in Nigel's Point, Desolace" },
		["Guarded by the Light"]={ rune="Rune of the Guardian", phase=2, spellID=415059, level=30, icon=14, slot=8,
				start="Loot the Dormant Holy Rune in the Alterac Mountains. Later, requires a helper" },
		["The Art of War"]={ rune="Rune of Warfare", phase=2, spellID=426157, level=30, icon=15, slot=8,
				start="Go to a pillaged campsite in Desolace" },
		["Enlightened Judgements"]={ rune="Rune of Piety", phase=2, spellID=426173, level=34, icon=16, slot=6, 
				start="Farm mobs in Arathi Highlands (wetlands) for three types of beads. Purify and then combine the beads" },
		["Infusion of Light"]={ rune="Rune of Infusions", phase=2, spellID=426065, level=40, icon=17, slot=6, start=st.dalaranSpeakTo },
		["Sheath of Light"]={ rune="Sheath of Light", phase=2, spellID=426158, level=40, icon=18, slot=6,
				start="Find a Broken Hammer in Mannoroc Cove in Desolace to commence a quest chain. Requires Cathedral wing access to SM" },
		-- Phase 2 Skill Books
		["Enhanced Blessings"]={ skillBook="Testament of Enhanced Blessings", spellID=435984, level=1, start=st.dungeonSummary },
		-- Phase 3
		["Improved Hammer of Wrath"]={ rune="Rune of the Hammer", phase=3, spellID=429152, level="23/37/47", icon=19, slot=9,
				start=st.emeraldWardens },
		["Wrath"]={ rune="Rune of Wrath", phase=3, spellID=429139, level=42, icon=20, slot=1,
				start="With Sense Undead learnt, go to north of Quel'Danil Lodge, The Hinterlands, between 9pm and 3am\n"
					.."server time. Kill a Vengeful Spirit (L45). Go to the Mystic Ward in Ironforge for the turn in" },
		["Improved Sanctuary"]={ rune="Improved Sanctuary", phase=3, spellID=429133, level=40, icon=21, slot=1,
				start=st.wildGodsStart },
		["Fanaticism"]={ rune="Fanaticism", phase=3, spellID=429142, level=44, icon=22, slot=1,
				start="Learn the Sheath of Light rune prior. Speak to Aeonas the Vindicated in the SW Cathedral. Must be L44" },
		["Purifying Power"]={ rune="Purifying Power", phase=3, spellID=429144, level=47, icon=23, slot=9,
				start=st.leylineSummary ..st.leylineSummaryExtra },		
		["Hammer of the Righteous"]={ rune="Hammer of the Righteous", phase=3, spellID=409922, level=50, icon=24, slot=9,
				start="Learn Fanaticism prior. Speak to Aeonas the Vindicated at the Bloodvenom Falls, Felwood. Must be L44.\n"
					.."Along the way you'll go to the Grim Guzzler, inside Blackrock Depths, and Maraudon (group for that)" },
		["Light's Grace"]={ rune="Rune of Grace", phase=3, spellID=428909, level=100, icon=25, slot=1,
				start="Unknown. People consider that it's probably not worth the effort of discovering" },

		spells={ "Crusader Strike", "Inspiration Exemplar", "Rebuke", "Aegis", "Horn of Lordaeron",
			"Seal of Martyrdom", "Beacon of Light", "Hand of Reckoning", "Divine Sacrifice",
			"Avenger's Shield", "Divine Storm", "Exorcist", "Sacred Shield", "Guarded by the Light",
			"The Art of War", "Enlightened Judgements", "Infusion of Light", "Sheath of Light",
			"Improved Hammer of Wrath", "Wrath", "Improved Sanctuary", "Fanaticism", "Purifying Power",
			"Hammer of the Righteous", "Light's Grace", },
		skillBooks={ "Enhanced Blessings" },
	},

	["PRIEST"] = {
		-- Phase 1
		["Penance"]={ rune="Memory of a Troubled Acolyte", phase=1, spellID=402174, level=2, icon=1, slot=10,
				start= "Branstock Khalder, Anvilmar, Coldridge Valley; Priestess Anetta, Northshire Abbey; Shanda, Shadowglen (A)\n"
					.."Ken'Jai, Valley of Trials; Dark Cleric Duesten, Deathknell" },
		["Prayer of Mending"]={ rune="Reciprocal Epiphany", phase=1, spellID=401859, level=7, icon=2, slot=7,
				start=st.twoPlusHealers
					.."Grizzled Den, Dun Morogh; east of Jarod's Landing, southern Elwynn Forest; Oracle Glade, Teldrassil (A)\n"
					.."South of and outside of the Valley of Trials, Durotar; near northern exit, Venture Co cave, Mulgore (H)" },
		["Void Plague"]={ rune="Memory of a Dark Purpose", phase=1, spellID=425204, level=7, icon=3, slot=5,
				start="Leper Gnome/Gibblewit near Gnomeregan; Goldtooth in Elwynn Forest; Gnarlpine Cache, Ban'ethil Barrow Den, "
					.."Teldrassil (A)\nKul Tiras mob, east of Razor Hill, Durotar; Gillgar, north-west from Deathknell, Tirisfal GladeS (H)" },
		["Homunculi"]={ rune="Prophecy of a Desecrated Citadel", phase=1, spellID=402799, level=8, icon=4, slot=7,
				start="Shimmer Ridge, Dun Morogh; Defias Rogue Wizard, Elwynn Forest; Rascal Sprite, Fel Rock Cave, Teldrassil (A);\n"
					.."Voodoo Troll, Echo Isle, Duratar; Scarlet mobs near Solliden Farmstead, Tirisfal Glades (H)\n"
					.."Needs two Meditations" },
		["Shared Pain"]={ rune="Memory of an Imprisoned Saviour", phase=1, spellID=401969, level=8, icon=5, slot=7,
				start="Defeat Captain Beld, far south-east Dun Morogh; Kobold mobs, mines, Elwynn Forest; Lord Melenas, Teldrassil (A)\n"
					.."Gazz'uz or Makasgar, Mulgore; Tirisfal Farmer mobs, Tirisfal Glades (H)" },
		["Mind Sear"]={ rune="Tenebrous Epiphany", phase=1, spellID=413259, level=15, icon=6, slot=10,
				start=st.supplyFactionStart },
		["Twisted Faith"]={ rune="Memory of a Devout Champion", phase=1, spellID=425198, level=15, icon=7, slot=5,
				start="Naga mobs, Ruins of Mathystra, Darkshore; Silverstream Mine, Loch Modan; Gold Coast Quarry and\n"
					.."Jangolode Mine, Westfall (A). Wailing Spirit, southern Silverpine Forest; Razormane mobs, The Barrens (H)" },
		["Shadow Word: Death"]={ rune="Prophecy of a King's Demise", phase=1, spellID=401955, level=20, icon=8, slot=10,
				start="Orb, coast, Darkshore; Mo'grosh Stronghold, Loch Modan (A)\n"
					.."Thule Ravenclaw, Fenris Isle, Silverpine Forest; Desert Mirage, The Barrens (H)\n"
					.."Needs two Meditations" },
		["Serendipity"]={ rune="Harmonious Epiphany", phase=1, spellID=413248, level=20, icon=9, slot=5,
				start="Grizzby @ Ratchet, The Barrens" },
		["Power Word: Barrier"]={ rune="Prophecy of a City Enthralled", phase=1, spellID=425207, level=23, icon=10, slot=7,
				start="Blackrock Shadowcaster, Stone watch, Redridge Mountains (A/H). Needs two Meditations" },
		["Strength of Soul"]={ rune="Prophecy of Seven Visitors", phase=1, spellID=415739, level=23, icon=11, slot=5,
				start="Primal Insight from Thistlefur mobs, Ashenvale (A/H). Needs two Meditations" },
		["Circle of Healing"]={ rune="Prophecy of a Thousand Lights", phase=1, spellID=401946, level=25, icon=12, slot=10,
				start="Obtain Dark Insight from Defias mobs in Duskwood (A/H). Needs two Meditations" },
		-- Phase 2
		["Empowered Renew"]={ rune="Prophecy of the quickened Path", phase=2, spellID=425266, level=26, icon=13, slot=6,
				start="Farm Grimtotem mobs (L25-28) in Thousand Needles for the rune. Or else Crushridge Ogres (L34-36) in Arathi" },
		["Mind Spike"]={ rune="Psychosophic Epiphany", phase=2, spellID=431655, level=30, icon=14, slot=6,
				start="Go to a pillaged campsite in Desolace" },
		["Renewed Hope"]={ rune="Unsettling Vision", phase=2, spellID=425280, level=32, icon=15, slot=6,
				start="Kill nagas in northern Desolace until the Unsettling Vision drops. Then activate it via Mind Control" },	
		["Pain Suppression"]={ rune="Memory of a Leader's Betrayal", phase=2, spellID=402004, level=35, icon=16, slot=8,
				start="look for \"Echos\" in Arathi, Dustwallow, SM graveyard, Swamp of Sorrows. Then complete a ritual in the SM Library wing " },
		["Spirit of the Redeemer"]={ rune="Luminous Epiphany", phase=2, spellID=425284, level=40, icon=17, slot=8, start=st.dalaranSpeakTo },
		["Dispersion"]={ rune="Prophecy of Imprisoned Malice", phase=2, spellID=425294, level=18, icon=18, slot=8,
				start="Officially you need a mage and rogue to help with tasks in Stranglethorn Vale. See that map also for HACKS!" },
		-- Phase 2 Skill Books
		["Increased Fortitude"]={ skillBook="Scroll Increased Fortitude", spellID=436951, level=1, start=st.dungeonSummary },
		["Shadowfiend"]={ skillBook="Scroll of Shadowfiend", spellID=401977, level=1, start=st.dungeonSummary },
		-- Phase 3
		["Void Zone"]={ rune="Nihilist Epiphany", phase=3, spellID=431681, level="23/37/47", icon=19, slot=9,
				start=st.emeraldWardens },
		["Surge of Light"]={ rune="Prophecy of the Lost Tribe", phase=3, spellID=431664, level=40, icon=20, slot=9,
				start="Between 9pm and 3am server time, an Echo of a Lost Soul will appear in the Swamp of Sorrows, Stranglethorn\n"
					.."Vale, Tanaris, The Hinterlands. Must be killed with Arcane damage although Holy might eventually work" },
		["Divine Aegis"]={ rune="Resolute Epiphany", phase=3, spellID=431622, level=40, icon=21, slot=1, start=st.wildGodsStart },
		["Pain and Suffering"]={ rune="Prophecy of the Verdant Winter", phase=3, spellID=413251, level=43, icon=22, slot=1,
				start=st.enragedVoidWalkerStart },
		["Despair"]={ rune="Despair", phase=3, spellID=431670, level=47, icon=23, slot=9,
				start=st.leylineSummary ..st.leylineSummaryExtra },		
		["Eye of the Void"]={ rune="Prophecy of Awakened Chaos", phase=3, spellID=402789, level=47, icon=24, slot=1,
				start="Collect seven eyes from around Azeroth: Blasted Lands, Felwood, Feralas, Searing Gorge,\n"
					.."Stranglethorn Vale, Tanaris, The Hinterlands. Afterwards go to Azshara for the hand in" },

		spells={ "Penance", "Prayer of Mending", "Void Plague", "Homunculi", "Shared Pain", "Mind Sear",
			"Twisted Faith", "Shadow Word: Death", "Serendipity", "Power Word: Barrier",
			"Strength of Soul", "Circle of Healing", "Empowered Renew", "Mind Spike", "Renewed Hope",
			"Pain Suppression", "Spirit of the Redeemer", "Dispersion", "Void Zone", "Surge of Light",
			"Divine Aegis", "Pain and Suffering", "Despair", "Eye of the Void", },
		skillBooks={ "Increased Fortitude", "Shadowfiend" },
	},
			
	["ROGUE"] = {
		-- Phase 1
		["Shadowstrike"]={ rune="Rune of Shadowstrike", phase=1, spellID=399985, level=2, icon=1, slot=10,
				start="Solm Hargrin, Anvilmar, Coldridge Valley; Jorik Kerridan, behind the Northshire Abbey, Northshire\n"
					.."Frahun Shadewhisper, Shadowglen (A). Rwag, Valley of Trials; David Trias, Deathknell (H)" },
		["Quick Draw"]={ rune="Rune of Quick Draw", phase=1, spellID=398196, level=8, icon=2, slot=5,
				start="Loot/Pp four segments of a map. See the Tooltip at the turn-in location for details: Dun Morogh: Under\n"
					.."a bridge between Kharanos and Ironforge; Ridgepoint Tower, Elwynn; Rut'theran Village, Teldrassil (A)\n"
					.."Far South, Echo Isles, Durotar; West of Brill, under the bridge, west side, Tirisfal Glades (H)" },
		["Slaughter from the Shadows"]={ rune="Rune of Slaughter", phase=1, spellID=424925, level=8, icon=3, slot=5,
				start="Chest above Kharanos Inn, Dun Morogh; above the spooky house north of Goldshire, Elwynn; Gnarlpine Chache,\n"
					.."Barrow Den, Teldrassil (A); Chest at Drygulch Ravine, Durotar; Relic Coffer, Agamand Crypts, Tirisfal (H)" },
		["Mutilate"]={ rune="Rune of Mutilation", phase=1, spellID=399960, level=8, icon=4, slot=10,
				start="Pickpocket Dark Iron mobs, far south-east of Dun Morogh; Pp Garrick Padfoot, Northshire (A); Pp Captain\n"
					.."Perrine, west of Unercity (H). Kill Lord Melenas, Teldrassil (A); Speak to Ba'so, south of Razer Hill (H)" },
		["Between the Eyes"]={ rune="Rune of Precision", phase=1, spellID=400009, level=10, icon=5, slot=7,
				start="Dusty Chest, Forlorn Cavern, IF; Dusty Chest, Dwarven District, SW; Gnarlpine Stash key from Gnarlines,\n"
					.."Teldrassil (A); Dusty Chest, The Drag, Org; Shipwreck Cache, Tirisfal (H). See Tooltips for details" },
		["Saber Slash"]={ rune="Rune of Saber Slash", phase=1, spellID=424785, level=15, icon=6, slot=10,
				start="Auberdine Lighthouse, Darkshore; Stonewrought Dam, Loch Modan; Defias Scout, Sentinel Hill, Westfall (A);\n"
					.."Northwatch Hold, The Barrens; entrance of SFK, Silverpine Forest. Lots more details. See tooltips" },
		["Blade Dance"]={ rune="Rune of Blade Dance", phase=1, spellID=400012, level=15, icon=7, slot=7,
				start="Kill Naga at Cliffspring River Cave, Darkshore; Pp Dark Iron Dwarves, Loch Modan; Pp Defias, Westfall (A)\n"
					.."Pp Southsea Pirates, south of Ratchet, The Barrens (H). Lots more details,. See tooltips" },
		["Just a Flesh Wound"]={ rune="Rune of Teasing", phase=1, spellID=400014, level=15, icon=8, slot=5,
				start=st.supplyFactionStart },
		["Envenom"]={ rune="Rune of Venom", phase=1, spellID=399963, level=20, icon=9, slot=7,
				start="Purchase a Hot Tip from a vendor lurking behind Durnholde Keep, Hillsbrad Foothills" },
		["Main Gauche"]={ rune="Rune of Main Gauche", phase=1, spellID=424919, level=20, icon=10, slot=10,
				start="Grizzby @ Ratchet, The Barrens" },
		["Deadly Brew"]={ rune="Rune of Deadly Brew", phase=1, spellID=399965, level=22, icon=11, slot=5,
				start="Pyrewood Village, Silverpine Forest. Lengthy, with quests. See tooltip for details" },		
		["Shiv"]={ rune="Rune of Shiving", phase=1, spellID=424800, level=25, icon=12, slot=10,
				start="Pickpocket Defias Night Runner in Duskwood. South of the Raven Hill Cemetary" },
		-- Phase 2
		["Poisoned Knife"]={ rune="Rune of the Poisoned Blade", phase=2, spellID=425012, level=30, icon=13, slot=6,
				start="Go to a pillaged campsite in Desolace" },
		["Shadowstep"]={ rune="Rune of Shadowstep", phase=2, spellID=400029, level=30, icon=14, slot=6,
				start="Pyrewood Village, Silverpine Forest. Lengthy, with quests. Scarlet Monastery Library Wing. See tooltips for details" },
		["Shuriken Toss"]={ rune="Rune of the Assassin", phase=2, spellID=399986, level=30, icon=15, slot=6,
				start="Disarm (L30) a Poison Dart trap in the Swamp of Sorrows so that you may then loot a chest" },
		["Rolling with the Punches"]={ rune="Rune of the Southpaw", phase=2, spellID=400016, level=30, icon=16, slot=8,
				start="With Lockpicking @ L55 go to Camp E'Thok in Thousand Needles" },
		["Waylay"]={ rune="Rune of the Assailant", phase=2, spellID=408700, level=40, icon=17, slot=8, start=st.dalaranSpeakTo },
		["Master of Subtlety"]={ rune="Rune of Subtlety", phase=2, spellID=425096, level=40, icon=18, slot=8,
				start="Head to a tower in Kurzen's Compound, far north Stranglethorn Vale" },
		-- Phase 2 Skill Books
		["Redirect"]={ skillBook="Manual of Redirect", spellID=438040, level=1, start=st.dungeonSummary },
		-- Phase 3
		["Cut to the Chase"]={ rune="Rune of Alacrity", phase=3, spellID=432271, level="23/37/47", icon=19, slot=9,
				start=st.emeraldWardens },
		["Focused Attacks"]={ rune="Rune of Focus", phase=3, spellID=432256, level=34, icon=20, slot=1,
				start="Use Blind (L34) on a Vilebranch Mask and loot its chest, The Hinterlands" },
		["Carnage"]={ rune="Rune of Carnage", phase=3, spellID=432276, level=40, icon=21, slot=9,
				start="Head to near Dreadmaul Hold in the Blasted Lands and climb a tower and lockpick (L225) a chest" },
		["Unfair Advantage"]={ rune="Rune of Foul Play", phase=3, spellID=432300, level=42, icon=22, slot=9,
				start="Pickpocket pirates (L44-45) in Tanaris for a Kidnapper's Coin Purse. Turn in at Steamwheedle Port" },
		["Combat Potency"]={ rune="Rune of Potency", phase=3, spellID=432259, level=40, icon=23, slot=1, start=st.wildGodsStart },
		["Honor Among Thieves"]={ rune="Rune of the Coterie", phase=3, spellID=432264, level=45, icon=24, slot=1,
				start="You need to have visited Ravenholdt previously and to have completed the Pyrewood Dead Drop quests/runes.\n"
					.."Then at L45 you'll receive a letter sending you back to Ravenholdt Manor" },

		spells={ "Shadowstrike", "Quick Draw", "Slaughter from the Shadows",  "Mutilate",
			"Between the Eyes", "Saber Slash", "Blade Dance", "Just a Flesh Wound", "Envenom",
			"Main Gauche", "Deadly Brew", "Shiv", "Poisoned Knife", "Shadowstep",
			"Shuriken Toss", "Rolling with the Punches", "Waylay", "Master of Subtlety",
			"Cut to the Chase", "Focused Attacks", "Carnage", "Unfair Advantage", "Combat Potency",
			"Honor Among Thieves", },
		skillBooks={ "Redirect" },
	},
			
	["SHAMAN"] = {
		-- Phase 1
		["Overload"]={ rune="Dyadic Icon", phase=1, spellID=408438, level=2, icon=1, slot=5,
				start="Troll/Orc: Shikrik in Valley of Trials, Durotar; Tauren: Meela Dawnstrider in Camp Narache, Mulgore" },
		["Lava Lash"]={ rune="Lava Lash", phase=1, spellID=408507, level=4, icon=2, slot=10,
				start="Speak to Boarton Shadetotem, main Thunder Bluff mesa, Mulgore" },
		["Shield Mastery"]={ rune="Galvanic Iron", phase=1, spellID=408524, level=6, icon=3, slot=5,
				start="Randomly spawned Galvanic Totems in Durotar and Mulgore. Listen and look for them as you quest. Don't delay" },
		["Ancestral Guidance"]={ rune="Echo of the Ancestors", phase=1, spellID=409324, level=7, icon=4, slot=7,
				start=st.twoPlusHealers .."Kolkar Crag, far south-west Durotar; on an overlook, via Venture Co Mine, Mulgore" },
		["Molten Blast"]={ rune="Sulfurous Icon", phase=1, spellID=425339, level=8, icon=5, slot=10,
				start="Frozen Makrura, Durotar; Bael'Dun Digsite, south-west of Thunder Bluff" },
		["Way of Earth"]={ rune="Earthen Rune", phase=1, spellID=408531, level=12, icon=6, slot=7,
				start="Purge Desert Mirage, west of Ratchet, The Barrens; Rot Hide Mystics, Silverpine Forest" },
		["Healing Rain"]={ rune="Rune of Healing Rain", phase=1, spellID=415236, level=15, icon=7, slot=5,
				start=st.supplyFactionStart },
		["Water Shield"]={ rune="Tempest Icon", phase=1, spellID=408510, level=15, icon=8, slot=10,
				start="Kolkar's Booty in centaur camps, The Barrens; Grimson the Pale, Deep Elem Mine, Silverpine Forest" },
		["Dual Wield Specialization"]={ rune="Rune of Dual Wield Specialization", phase=1, spellID=408496, level=20, icon=9, slot=5,
				start="Grizzby @ Ratchet, The Barrens" },
		["Lava Burst"]={ rune="Kajaric Icon", phase=1, spellID=408490, level=25, icon=10, slot=10,
				start="Mudsnout Shaman, Hillsbrad Foothills" },
		["Shamanistic Rage"]={ rune="Rune of Primordial Fury", phase=1, spellID=425336, level=25, icon=11, slot=7,
				start="Primordial Anomaly, south of the Charred Vale, Stonetalon Mountains. More details. See tooltip" },
		["Earth Shield"]={ rune="Rune of Earth Shield", phase=1, spellID=408514, level=25, icon=12, slot=7,
				start="Kill Baron Aquanis in Blackfathom Deeps" },
		-- Phase 2
		["Spirit of the Alpha"]={ rune="Rune of the Alpha", phase=2, spellID=408696, level=25, icon=13, slot=8,
				start="Light parkour near Freewind Post in Thousand Needles" },
		["Decoy Totem"]={ rune="Decoy Totem", phase=2, spellID=425874, level=27, icon=14, slot=8,
				start="Farm items in Thousand Needles (L25-30), make an Altar offering, profit" },				
		["Ancestral Awakening"]={ rune="Rune of Ancestral Awakening", phase=2, spellID=425858, level=30, icon=15, slot=8,
				start="Go to a pillaged campsite in Desolace" },		
		["Fire Nova"]={ rune="Brimstone Icon", phase=2, spellID=408339, level=33, icon=16, slot=6,
				start="Kill Flameseer Dubelen (L35e) in Desolace. Then 2 x Maraudon antechamber corpse runs" },
		["Power Surge"]={ rune="Rune of Power", phase=2, spellID=415100, level=34, icon=17, slot=6,
				start="Search for Bouldefist Ogres (L32-33) in Arathi Highlands. Can be grouped" },
		["Maelstrom Weapon"]={ rune="Rune of the Storm", phase=2, spellID=408498, level=36, icon=18, slot=6,
				start="Obtain a Tattered Note off Charlga Razorflank in RFK and complete a quest chain" },				
		["Two-Handed Mastery"]={ rune="Rune of Two-Handed Mastery", phase=2, spellID=436364, level=40, icon=19, slot=5,
				start=st.dalaranSpeakTo },
		-- Phase 2 Skill Books
		["Totemic Projection"]={ skillBook="Revelation of Totemic Projection", spellID=437009, level=1, start=st.dungeonSummary },
		-- Phase 3
		["Burn"]={ rune="Rune of Burn", phase=3, spellID=415231, level="23/37/47", icon=20, slot=1, start=st.emeraldWardens },
		["Tidal Waves"]={ rune="Rune of Tidal Waves", phase=3, spellID=432042, level=37, icon=21, slot=9,
				start="Look for a crate and an empty tent past the lakes south of Camp Mojache in Feralas.\nFighting not necessary" },
		["Static Shock"]={ rune="Rune of Static Shock", phase=3, spellID=432235, level=42, icon=22, slot=9,
				start="Two players, both of whom can ideally deliver nature damage, are essential. Not necessarily\nanother Shammy. "
					.."Proceed to the southern ogre area of Feralas" },
		["Riptide"]={ rune="Rune of Riptide", phase=3, spellID=409954, level=40, icon=23, slot=9, start=st.wildGodsStart },
		["Mental Dexterity"]={ rune="Rune of Mental Dexterity", phase=3, spellID=415140, level=43, icon=24, slot=1,
				start=st.enragedVoidWalkerStart },
		["Rolling Thunder"]={ rune="Rune of Rolling Thunder", phase=3, spellID=432235, level=43, icon=25, slot=9,
				start="Abyssal Sands, Tanaris. Simple mob run through... except you have a 50% damage\ntaken debuff. Mobs are L43-45" },
		["Overcharged"]={ rune="Rune of Overcharged", phase=3, spellID=432240, level=45, icon=26, slot=9,
				start="Fetch quests in Azshara, Searing Gorge, Tanaris & The Hinterlands. Final hand in is in Feralas" },

		spells={ "Overload", "Lava Lash", "Shield Mastery", "Ancestral Guidance", "Molten Blast",
			"Way of Earth", "Healing Rain", "Water Shield", "Dual Wield Specialization",
			"Lava Burst", "Shamanistic Rage", "Earth Shield", "Spirit of the Alpha", "Decoy Totem",
			"Ancestral Awakening", "Fire Nova", "Power Surge", "Maelstrom Weapon", "Two-Handed Mastery",
			"Burn", "Tidal Waves", "Static Shock", "Riptide", "Mental Dexterity", "Rolling Thunder",
			"Overcharged" },
		skillBooks={ "Totemic Projection" },
	},

	["WARLOCK"] = {
		-- Phase 1
		["Haunt"]={ rune="Rune of Haunting", phase=1, spellID=403501, level=2, icon=1, slot=10,
				start="Speak to Alamar Grimm, Anvilmar, Coldridge Valley; Drusilla La Salle, Northshire (A).\n"
					.."Nartok, Valley of Trials; Maximillion, Deathknell (H)" },
		["Chaos Bolt"]={ rune="Rune of Chaos Bolt", phase=1, spellID=403629, level=6, icon=2, slot=10,
				start="Frozen: Trogg, Gol'bolar quarry, Dun Morogh; Murloc, Stonecairn Lake, Elwynn Forest (A)\n"
					.."Makrura, east of Razor Hill, Durotar; Murloc, north-west of Brightwater Lake, Tirisfal Glades (H)" },
		["Demonic Grace"]={ rune="Rune of Grace", phase=1, spellID=425463, level=8, icon=3, slot=7,
				start="Ominous Tome drops from: Frostmane Shadowcaster, cave west of Brewnall, Dun Morogh; Lasperlode Mine Kobolds,\n"
					.."Elwynn Forest (A). Voodoo Doll on Echo Isles, Durotar; Darkeye Bonecaster, Agamand Mills, Tirisfal (H)" },
		["Demonic Tactics"]={ rune="Rune of Tactics", phase=1, spellID=412727, level=8, icon=4, slot=5,
				start="Dead Acolyte near Jasperlode Mine, Elwynn Forest (A);\n"
					.."Dead Acolyte, towards the Monastery, Tirisfal Glades (H)" },
		["Soul Siphon"]={ rune="Rune of Soul Siphon", phase=1, spellID=403511, level=10, icon=5, slot=5,
				start="Use Drain Soul twice. See these tooltips: Captain Beld, far south-east Dun Morogh; Hogger, Elwynn Forest (A)\n"
					.."Gazz'uz, cave outside Orgrimmar; Maggot Eye, Garren's Haunt, Tirisfal Glades (H)" },
		["Master Channeler"]={ rune="Rune of Channeling", phase=1, spellID=403668, level=12, icon=6, slot=5,
				start="Greishan Ironstove, long path, Loch Modan; Dark Strand Fanatics, Tower of Athalaxx, Darkshore (A)\n"
					.."Altar of Thorns, Thorn Hill, The Barrens; Sadistic Fiend, Deep Elm Mine, Silverpine Forest (H)" },
		["Everlasting Affliction"]={ rune="Rune of Everlasting Affliction", phase=1, spellID=412689, level=15, icon=7, slot=7,
				start=st.supplyFactionStart },
		["Lake of Fire"]={ rune="Rune of Fires Wake", phase=1, spellID=403666, level=20, icon=8, slot=5,
				start="Zixil, wanders between Tarren Mill and Southshore, Hillsbrad Foothills (A/H)" },
		["Shadow Bolt Volley"]={ rune="Rune of Shadowbolts", phase=1, spellID=403628, level=20, icon=9, slot=10,
				start="Delmanis the Hated, Tower of Athalaxx, Darkshore; Demonic Remains, Ironbands Excavation, Loch Modan (A)\n"
					.."Supervisor Lugwizzle, Sludge Fen, The Barrens; Ravenclaw mobs, Beren's Peril cave, Silverpine Forest (H)" },
		["Demonic Pact"]={ rune="Rune of the Pact", phase=1, spellID=425464, level=20, icon=10, slot=7,
				start="Grizzby @ Ratchet, The Barrens" },
		["Incinerate"]={ rune="Rune of Incinerate", phase=1, spellID=412758, level=23, icon=11, slot=7,
				start="Incinerator Gar'im, cave south-east corner of Redridge (A/H)" },
		["Metamorphosis"]={ rune="Rune of Metamorphosis", phase=1, spellID=403789, level=25, icon=12, slot=10,
				start="Doan Karhan, near Camp Taurajo, southern Barrens" },
		-- Phase 2
		["Dance of the Wicked"]={ rune="Rune of Wickedness", phase=2, spellID=412798, level=30, icon=13, slot=8,
				start="With Hellfire learnt, interact with a dead ogre in Stranglethorn, Alterac, Desolace or Thousand Needles" },
		["Shadow and Flame"]={ rune="Rune of Burning Darkness", phase=2, spellID=426316, level=30, icon=14, slot=6, 
				start="Go to a pillaged campsite in Desolace" },
		["Grimoire of Synergy"]={ rune="Rune of Synergy", phase=2, spellID=426301, level=32, icon=15, slot=6,
				start="Raszel Ander, near Camp Taurajo, southern Barrens" },
		["Invocation"]={ rune="Rune of Invocation", phase=2, spellID=426243, level=34, icon=16, slot=6,
				start="Go to Stromgarde Keep in Arathi Highlands and begin by killing Syndicate Conjurors" },
		["Shadowflame"]={ rune="Rune of Shadowflames", phase=2, spellID=426320, level=38, icon=17, slot=8,
				start="Go to Shadowbreak Ravine in Desolace and do Warlock stuff" },
		["Demonic Knowledge"]={ rune="Rune of Forbidden Knowledge", phase=2, spellID=412732, level=40, icon=18, slot=8,
				start=st.dalaranSpeakTo },
		-- Phase 2 Skill Books
		["Portal Summoning"]={ skillBook="Grimoire of Portal Summoning", spellID=437169, level=1, start=st.dungeonSummary },
		["Soul Harvesting"]={ skillBook="Grimoire of Soul Harvesting", spellID=437032, level=1, start=st.dungeonSummary },
		-- Phase 3
		["Summon Felguard"]={ rune="Rune of the Felguard", phase=3, spellID=427733, level=10, icon=19, slot=9,
				start="Acquire an Explorer Imp, randomly after using Drain Soul (L10). Stand near a Fel Portal\n"
					.."Summon and send your Imp through. Loot bag has a chance to contain the rune." ..st.felPortals ..st.getCGM },
		["Unstable Affliction"]={ rune="Rune of Affliction", phase=3, spellID=427717, level="23/37/47", icon=20, slot=9,
				start=st.emeraldWardens },
		["Immolation Aura"]={ rune="Rune of Immolation Aura", phase=3, spellID=427726, level=38, icon=21, slot=9,
				start="Farm mobs (L40) in the far north-east Bough Shadow corner of Ashenvale, for components to combine" },
		["Pandemic"]={ rune="Rune of Pandemic", phase=3, spellID=427712, level=40, icon=22, slot=1,
				start="Around the path west of Camp Mojache, loot two containers and defeat a Diseased Forest Walker (L43-44)" },
		["Vengeance"]={ rune="Rune of Vengeance", phase=3, spellID=426470, level=40, icon=23, slot=1, start=st.wildGodsStart },
		["Backdraft"]={ rune="Backdraft", phase=3, spellID=427713, level=47, icon=24, slot=1, start=st.leylineSummary },

		spells={ "Haunt", "Chaos Bolt", "Demonic Grace", "Demonic Tactics", "Soul Siphon",
			"Master Channeler", "Everlasting Affliction", "Lake of Fire", "Shadow Bolt Volley",
			"Demonic Pact", "Incinerate", "Metamorphosis", "Dance of the Wicked", "Shadow and Flame",
			"Grimoire of Synergy", "Invocation", "Shadowflame", "Demonic Knowledge", "Summon Felguard",
			"Unstable Affliction", "Immolation Aura", "Pandemic", "Vengeance", "Backdraft" },
		skillBooks={ "Portal Summoning", "Soul Harvesting" },
	},

	["WARRIOR"] = {
		["Victory Rush"]={ rune="Rune of Victory Rush", phase=1, spellID=402927, level=2, icon=1, slot=10,
				start="You'll stumble across the stash / quest while questing in your starting zone" },
		["Blood Frenzy"]={ rune="Rune of Blood Frenzy", phase=1, spellID=412507, level=7, icon=2, slot=5,
				start="Wandering Swordsman: Westbrook Garrison, Elwynn Forest (A); Bladescar Highlands, Durotar (H). Other locations" },
		["Furious Thunder"]={ rune="Rune of Furious Thunder", phase=1, spellID=403219, level=7, icon=3, slot=7,
				start="Various Elites/Rares in Dun Morogh (A) and Durotar, Mulgore (H); Goldtooth, Mother Fang in Elwynn Forest (A)\n"
				.."Gnarlpine Cache, Ban'ethil Barrow Den, Teldrassil (A); Gillgar, west of Soliden Farmstead, Tirisfal (H)" },
		["Devastate"]={ rune="Rune of Devastate", phase=1, spellID=403196, level=8, icon=4, slot=10,
				start="Junni Steelpass, Kharanos; Viktoria Woods, SW; Delwynna, Darn; Vahi Bonespliter, Razor Hill;\n"
				.."Vateya Timberhoof, Bloodhoof; Dorac Graves, UC. Each one will accept three items you'll\n"
				.."loot as you quest normally. Alliance side there's no overlap, Horde - a little overlap.\n"
				.."Check each NPC above for complete, localised, details as way too many too list here" },
		["Frenzied Assault"]={ rune="Rune of Frenzied Assault", phase=1, spellID=425412, level=10, icon=5, slot=7,
				start="Simply help one of six people, mostly Innkeepers, one in each main city" },
		["Single-Minded Fury"]={ rune="Rune of Single-Minded Fury", phase=1, spellID=413404, level=15, icon=6, slot=10,
				start=st.supplyFactionStart },
		["Endless Rage"]={ rune="Rune of Endless Rage", phase=1, spellID=403218, level=20, icon=7, slot=10,
				start="Old Murk-eye, southern coast, Westfall; Lady Sedorax, Darkshore (A);\n"
				.."Horde Warbanner, The Crossroads; Skittering Dark Cave, Silverpine Forest (H)" },
		["Quick Strike"]={ rune="Rune of Quick Strike", phase=1, spellID=429765, level=20, icon=8, slot=10,
				start="Paxnozz, Mathystra, Darkshore; Defias in Westfall (A); Kilxx @ Ratchet (H);\n"
				.."Troggs west of Thelsamar, Loch Modan" },
		["Warbringer"]={ rune="Rune of the Warbringer", phase=1, spellID=425421, level=20, icon=9, slot=5,
				start="Grizzby @ Ratchet, The Barrens" },
		["Consumed by Rage"]={ rune="Rune of Consuming Rage", phase=1, spellID=425418, level=25, icon=10, slot=7,
				start="Carrodin @ Thelgen Rock Cave, Wetlands" },
		["Flagellation"]={ rune="Rune of Flagellation", phase=1, spellID=402877, level=25, icon=11, slot=5,
				start="Crypts in the Raven Hill Cemetary, Duskwood" },
		["Raging Blow"]={ rune="Rune of Raging Blow", phase=1, spellID=402911, level=25, icon=12, slot=5,
				start="Alonso, Ashenvale @ the path to Stonetalon Mountains" },
		-- Phase 2
		["Intervene"]={ rune="Rune of Intervention", phase=2, spellID=403338, level=24, icon=13, slot=8,
				start="Strike three combat dummies in Thousand Needles in a specific manner" },
		["Enraged Regeneration"]={ rune="Rune of Healing Rage", phase=2, spellID=402913, level=30, icon=14, slot=8,
				start="Go to a pillaged campsite in Desolace" },
		["Focused Rage"]={ rune="Rune of Focused Rage", phase=2, spellID=29787, level=33, icon=15, slot=6,
				start="Head to Witherbark Village in Arathi Highlands and slay Witherbark mobs" },
		["Blood Surge"]={ rune="Rune of Blood Surge", phase=2, spellID=413380, level=36, icon=16, slot=6,
				start="Begin by slaying elite Boulderfist Maulers (Arathi) or Crushridge Mages (Alterac) (L37)" },
		["Rallying Cry"]={ rune="Rune of the Commander", phase=2, spellID=426490, level=39, icon=17, slot=8,
				start="Drops of the Wandering Swordsman (L40) in the Badlands" },
		["Precise Timing"]={ rune="Rune of Ruthless Precision", phase=2, spellID=402922, level=40, icon=18, slot=6,
				start=st.dalaranSpeakTo },
		-- Phase 2 Skill Books
		["Commanding Shout"]={ skillBook="Handbook of Commanding Shout", spellID=403215, level=1, start=st.dungeonSummary },
		-- Phase 3
		["Shield Mastery"]={ rune="Rune of the Protector",phase=3,  spellID=426980, level="23/37/47", icon=19, slot=1,
				start=st.emeraldWardens },
		["Wrecking Crew"]={ rune="Rune of Demolition", phase=3, spellID=427065, level=38, icon=20, slot=1,
				start="Head to The Hinterlands and farm Witherbark Troll mobs (L40-45) for a Geode Hammer" },
		["Sword and Board"]={ rune="Rune of the Knight", phase=3, spellID=426978, level=40, icon=21, slot=9,
				start=st.wildGodsStart },
		["Rampage"]={ rune="Rune of the Unbridled", phase=3, spellID=427081, level=43, icon=22, slot=9,
				start="Kill Ohk'zi (L43e). Inside a Gordunni Outpost cave. North of Camp Majache, Feralas" },
		["Gladiator Stance"]={ rune="Rune of the Gladiator", phase=3, spellID=412513, level=46, icon=23, slot=9,
				start="Must have Blood Frenzy & Rallying Cry. Go pick up a quest from Fizbuz Mithril in Gadgetzan, Tanaris" },
		["Taste for Blood"]={ rune="Rune of the Bloodthirsty", phase=3, spellID=426953, level=50, icon=24, slot=1,
				start="Head to the Searing Gorge, collect some constructor parts, summon Iodax (L50). Defeat. Loot" },
		["Vigilance"]={ rune="Rune of the Watchman", phase=3, spellID=426972, level=50, icon=25, slot=1,
				start="Defeat the Tyrant of the Hive (L46e) in the Writhing Deep, Feralas. Best to group up" },

		spells={ "Victory Rush", "Blood Frenzy", "Furious Thunder", "Devastate", "Frenzied Assault",
			"Single-Minded Fury", "Endless Rage", "Quick Strike", "Warbringer", "Consumed by Rage", 
			"Flagellation", "Raging Blow", "Intervene", "Enraged Regeneration", "Focused Rage",
			"Blood Surge", "Rallying Cry", "Precise Timing", "Shield Mastery", "Wrecking Crew",
			"Sword and Board", "Rampage", "Gladiator Stance", "Taste for Blood", "Vigilance",  },
		skillBooks={ "Commanding Shout" },
	},
}

--=======================================================================================================
--
-- EASTERN KINGDOMS
--
--=======================================================================================================

points[ 1416 ] = { -- Alterac Mountains
	[39606080] = { item=213452, name="Dormant Holy Rune", class={ "PALADIN" }, spell={ "Guarded by the Light" },
					guide={ st.paladin.guardedLight } },
	[40604700] = { name="Crushridge mobs (Various)", class={ "WARRIOR" }, spell={ "Blood Surge" }, guide={ st.warrior.bloodSurge },
					quest={ { 79624, 79677, 79678 } }, questName={ { "Anyone Can Cook", "A Quick Grocery Run", "Taste Testing" } } },
	[48505770] = { object=423896, name="Manual", class={ "MAGE" },
					spell={ "Spell Power" }, guide={ st.mage.books }, alsoTestQuest=true,
					tip="On a crate, just inside the tower",
					quest={ { 79948 } }, questName={ { "Defensive Magics 101" } } },
	[51004020] = { name="Crushridge ogres (various)", class={ "PRIEST" }, spell={ "Empowered Renew" },
					tip="Farming Grimtotem mobs in Thousand\nNeedles is much easier", guide={ st.priest.empowered }, },
	[51605640] = { name="Crushridge ogres (various)", class={ "PRIEST" }, spell={ "Empowered Renew" },
					tip="Farming Grimtotem mobs in Thousand\nNeedles is much easier", guide={ st.priest.empowered }, },
	[54604940] = { npc=217620, name="Reckless Warlock", class={ "WARLOCK" }, spell={ "Dance of the Wicked" }, guide={ st.warlock.dance },
					tip="At the back of the cave" },
	[61004760] = { npc=217305, name="Ancient Fire Elemental", class={ "MAGE" }, spell={ "Hot Streak" }, guide={ st.mage.hotStreak } },
	[80406680] = { npc=6176, name="Bath'rah the Windwatcher", class={ "SHAMAN" }, spell={ "Maelstrom Weapon" },
					guide={ st.shaman.maelstrom }, quest={ st.shaman.maelstromQ }, questName={ st.shaman.maelstromQN } },
	[84608020] = { name="Fahrad / Zan Shivsproket", class={ "ROGUE" }, spell={ "Honor Among Thieves" }, guide={ st.rogue.honorThieves },
					quest={ { 6681, 80526, 80411, 80453, 80454, 80455 } }, preRune={ { "Deadly Brew", "Shadowstep" } },
					questName={ { "The Manor, Ravenholdt", "Fool Me Twice", "The Talisman of Kazdor", "Best Laid Plans",
						"One Last Drop", "Biding Our Time" } } },
}
points[ 1417 ] = { -- Arathi Highlands
	[21508390] = { object=422911, name="Sealed Barrel", class={ "WARRIOR" }, spell={ "Blood Surge" }, guide={ st.warrior.bloodSurge },
					tip="Lowest level of the boat. Nearby\nnaga (L40) can root you for 10s.\nLoot the Smuggler's Spice Blend",
					quest={ { 79624, 79677, 79678 } }, questName={ { "Anyone Can Cook", "A Quick Grocery Run", "Taste Testing" } } },
	[22206760] = { name="Boulderfist mobs (Various)", class={ "WARRIOR" }, spell={ "Blood Surge" }, guide={ st.warrior.bloodSurge },
					quest={ { 79624, 79677, 79678 } }, questName={ { "Anyone Can Cook", "A Quick Grocery Run", "Taste Testing" } } },
	[26006360] = { npc=2590, name="Syndicate Conjuror", class={ "WARLOCK" },
					tip="you need 10 x Conjuror's Pendant.\nYou may safely group with other warlocks",
					spell={ "Invocation" }, guide={ st.warlock.invocation } },
	[53009100] = { object=420055, name="Rowboat", class={ "DRUID", "HUNTER", "MAGE", "PALADIN", "PRIEST", "ROGUE",
					"SHAMAN", "WARLOCK", "WARRIOR" }, spell={ "Eclipse", "Trap Launcher", "Brain Freeze", "The Art of War",
					"Mind Spike", "Poisoned Knife", "Ancestral Awakening", "Shadow and Flame", "Enraged Regeneration" },
					guide={ st.pillaged }, quest={ { 79229, 79235, 79236, 79242 } }, 
					questName={ { "Highway Robbery", "On the Lam", "Cherry for Your Thoughts", "No Honor Among Thieves" } } },
	[27205700] = { npc=217387, name="Brother Atticus", class={ "PALADIN" },
					spell={ "Enlightened Judgements" }, guide={ st.paladin.judgements } },
	[30802860] = { npc=217589, name="Hay Weevil", class={ "DRUID", "HUNTER" },
					spell={ "Survival Instincts", "Invigoration" }, guide={ st.amaryllis } },
	[31406480] = { object=422911, name="Sealed Barrel", class={ "WARRIOR" }, spell={ "Blood Surge" }, guide={ st.warrior.bloodSurge },
					tip="Cave entrance through to the sunken boat",
					quest={ { 79624, 79677, 79678 } }, questName={ { "Anyone Can Cook", "A Quick Grocery Run", "Taste Testing" } } },
	[34004400] = { npc=2562, name="Boulderfist Ogre", class={ "SHAMAN" }, spell={ "Power Surge" }, guide={ st.shaman.powerSurge } },
	[48608860] = { name="Dark Iron (Various)", class={ "PALADIN" },
					spell={ "Enlightened Judgements" }, guide={ st.paladin.judgements } },
	[55603920] = { npc=217589, name="Hay Weevil", class={ "DRUID", "HUNTER" },
					spell={ "Survival Instincts", "Invigoration" }, guide={ st.amaryllis } },
	[57607460] = { npc=217300, name="Skonk", class={ "WARRIOR" }, spell={ "Blood Surge" }, guide={ st.warrior.bloodSurge },
					quest={ { 79624, 79677, 79678 } }, questName={ { "Anyone Can Cook", "A Quick Grocery Run", "Taste Testing" } } },
	[61604100] = { npc=218931, name="Dark Rider", tip="Search this area",
					class={ "DRUID", "HUNTER", "MAGE", "PALADIN", "PRIEST", "ROGUE",
					"SHAMAN", "WARLOCK", "WARRIOR" }, spell={ "King of the Jungle", "Melee Specialist", "Missile Barrage",
					"Infusion of Light", "Spirit of the Redeemer", "Waylay", "Two-Handed Mastery", "Demonic Knowledge",
					"Precise Timing" }, guide={ st.dalaranAgent }, quest={ st.dalaranQuest }, questName={ st.dalaranQuestName } },
	[61905570] = { npc=217589, name="Hay Weevil", class={ "DRUID", "HUNTER" },
					spell={ "Survival Instincts", "Invigoration" }, guide={ st.amaryllis } },
	[62205450] = { object=424267, name="Grave", class={ "PRIEST" }, tip="Arathi Echo",
					spell={ "Pain Suppression" }, guide={ st.priest.painSuppression } },
	[68006440] = { npc=217836, name="Needletooth", class={ "HUNTER" }, spell={ "Steady Shot" }, guide={ st.druid.steadyShot } },
	[68257142] = { name="Witherbark mobs (Various)", class={ "WARRIOR" }, spell={ "Focused Rage" }, guide={ st.warrior.focusedRage } },
	[73606520] = { object=423897, name="Scrolls", class={ "MAGE" },
					spell={ "Spell Power" }, guide={ st.mage.books }, alsoTestQuest=true,
					tip="Just to the right of a tent entrance at\nWinterbark Village, Arathi Highlands",
					quest={ { 79949 } }, questName={ { "A Web of Lies: Debunking Myths and Legends" } } },
	[93807160] = { npc=215655, name="Illari Duskfeather", class={ "DRUID", "HUNTER", "MAGE", "PALADIN", "PRIEST", "ROGUE",
					"SHAMAN", "WARLOCK", "WARRIOR" }, spell={ "Eclipse", "Trap Launcher", "Brain Freeze", "The Art of War",
					"Mind Spike", "Poisoned Knife", "Ancestral Awakening", "Shadow and Flame", "Enraged Regeneration" },
					guide={ st.pillaged }, quest={ { 79229, 79235, 79236, 79242 } }, 
					questName={ { "Highway Robbery", "On the Lam", "Cherry for Your Thoughts", "No Honor Among Thieves" } } },
	[94106930] = { object=418855, name="Illari's Loot Cache", class={ "DRUID", "HUNTER", "MAGE", "PALADIN", "PRIEST", "ROGUE",
					"SHAMAN", "WARLOCK", "WARRIOR" }, spell={ "Eclipse", "Trap Launcher", "Brain Freeze", "The Art of War",
					"Mind Spike", "Poisoned Knife", "Ancestral Awakening", "Shadow and Flame", "Enraged Regeneration" },
					guide={ st.pillaged }, quest={ { 79229, 79235, 79236, 79242 } }, 
					questName={ { "Highway Robbery", "On the Lam", "Cherry for Your Thoughts", "No Honor Among Thieves" } } },
}
points[ 1418 ] = { -- Badlands
	[04008060] = { name="Rock Elementals (Various)", class={ "SHAMAN" }, spell={ "Maelstrom Weapon" },
					guide={ st.shaman.maelstrom }, quest={ st.shaman.maelstromQ }, questName={ st.shaman.maelstromQN } },
	[17404080] = { name="Rock Elementals (Various)", class={ "SHAMAN" }, spell={ "Maelstrom Weapon" },
					guide={ st.shaman.maelstrom }, quest={ st.shaman.maelstromQ }, questName={ st.shaman.maelstromQN } },
	[20005460] = { npc=218273, name="Wandering Swordsman", class={ "WARRIOR" },
					spell={ "Rallying Cry" }, guide={ st.warrior.rallyingCry } },
	[22406670] = { object=413699, name="Large Nest", class={ "HUNTER" }, spell={ "Expose Weaknesss" },
					tip="On top of a small mesa. Approach from the east",
					guide={ st.hunter.expose }, quest={ { 78823, 78830 } },
					questName={ { "Terror of the Desert Skies", "Terror of the Desert Skies" } } },
	[25406120] = { npc=218273, name="Wandering Swordsman", class={ "WARRIOR" },
					spell={ "Rallying Cry" }, guide={ st.warrior.rallyingCry } },
	[27206960] = { npc=218273, name="Wandering Swordsman", class={ "WARRIOR" },
					spell={ "Rallying Cry" }, guide={ st.warrior.rallyingCry } },
	[30805760] = { name="Dustbelcher (Various), Stonevault (Various)", class={ "HUNTER" }, spell={ "Expose Weaknesss" },
					tip="Farm until the Primitive Drawing drops.\nDustbelcher Ogres/Brutes have the\nfar better drop rate (1 in 8)",
					guide={ st.hunter.expose }, quest={ { 78823, 78830 } },
					questName={ { "Terror of the Desert Skies", "Terror of the Desert Skies" } } },
	[33606800] = { npc=218273, name="Wandering Swordsman", class={ "WARRIOR" },
					spell={ "Rallying Cry" }, guide={ st.warrior.rallyingCry } },
	[35805840] = { npc=218273, name="Wandering Swordsman", class={ "WARRIOR" },
					spell={ "Rallying Cry" }, guide={ st.warrior.rallyingCry } },
	[41502810] = { object=422919, name="Tapped Shadowforge Keg", class={ "WARRIOR" }, spell={ "Blood Surge" }, guide={ st.warrior.bloodSurge },
					tip="Descend to the basement of Angor Fortress.\nLoot the Balmy Brew",
					quest={ { 79624, 79677, 79678 } }, questName={ { "Anyone Can Cook", "A Quick Grocery Run", "Taste Testing" } } },
	[43007860] = { name="Rock Elementals (Various)", class={ "SHAMAN" }, spell={ "Maelstrom Weapon" },
					guide={ st.shaman.maelstrom }, quest={ st.shaman.maelstromQ }, questName={ st.shaman.maelstromQN } },
	[44001600] = { name="Skillbooks", tip="Uldaman", skillBook=true, guide={ st.dungeonDrops }, 
					class={ "DRUID", "DRUID", "DRUID", "HUNTER", "MAGE", "PALADIN", "PRIEST", "PRIEST", "ROGUE", "SHAMAN",
						"WARLOCK", "WARLOCK", "WARRIOR" },	
					spell={ "Deeper Wilds", "Enhanced Restoration", "Revive", "Aspect of the Viper", "Expanded Intellect",
							"Enhanced Blessings", "Increased Fortitude", "Shadowfiend", "Redirect", "Totemic Projection",
							"Portal Summoning", "Soul Harvesting", "Commanding Shout" }, },
	[56405540] = { npc=218931, name="Dark Rider", tip="Search this area",
					class={ "DRUID", "HUNTER", "MAGE", "PALADIN", "PRIEST", "ROGUE",
					"SHAMAN", "WARLOCK", "WARRIOR" }, spell={ "King of the Jungle", "Melee Specialist", "Missile Barrage",
					"Infusion of Light", "Spirit of the Redeemer", "Waylay", "Two-Handed Mastery", "Demonic Knowledge",
					"Precise Timing" }, guide={ st.dalaranAgent }, quest={ st.dalaranQuest }, questName={ st.dalaranQuestName } },
	[56703990] = { object=423899, name="Scrolls", class={ "MAGE" },
					spell={ "Spell Power" }, guide={ st.mage.books }, alsoTestQuest=true,
					tip="Approach via the path to the south. Inside the crypt",
					quest={ { 79951 } }, questName={ { "Mummies: A Guide to the Unsavory Undead" } } },
	[63207000] = { name="Dustbelcher (Various), Stonevault (Various)", class={ "HUNTER" }, spell={ "Expose Weaknesss" },
					tip="Farm until the Primitive Drawing drops.\nDustbelcher Ogres/Brutes have the\nfar better drop rate (1 in 8)",
					guide={ st.hunter.expose }, quest={ { 78823, 78830 } },
					questName={ { "Terror of the Desert Skies", "Terror of the Desert Skies" } } },
	[65504330] = { name="Skillbooks", tip="Uldaman Back Entrance", skillBook=true, guide={ st.dungeonDrops }, 
					class={ "DRUID", "DRUID", "DRUID", "HUNTER", "MAGE", "PALADIN", "PRIEST", "PRIEST", "ROGUE", "SHAMAN",
						"WARLOCK", "WARLOCK", "WARRIOR" },	
					spell={ "Deeper Wilds", "Enhanced Restoration", "Revive", "Aspect of the Viper", "Expanded Intellect",
							"Enhanced Blessings", "Increased Fortitude", "Shadowfiend", "Redirect", "Totemic Projection",
							"Portal Summoning", "Soul Harvesting", "Commanding Shout" }, },
}
points[ 1419 ] = { -- Blasted Lands
	[45301640] = { object=442405, name="Abandoned Cache", class={ "ROGUE" }, spell={ "Carnage" },
					guide={ "Climb the tower, lockpick the chest.\nSurprise! A Murderous Lost One (L46).\nKill for your phat lewt!" }, },
	[45405420] = { npc=221740, name="Calefactus the Unleashed", class={ "HUNTER" }, spell={ "Rapid Killing" },
					quest={ { 81900, 81917, 81919 } }, questName={ { "The Burning Beast", "Chains That Bind", "Brought to Heel" } },
					guide={ st.hunter.rapidKilling }, tip={ st.hunter.calefactus } },
	[49001400] = { item=223331, name="Pulsating Eye", class={ "PRIEST" }, spell={ "Eye of the Void" },
					quest={ { 82316 } }, questName={ { "Seven Eyes I Seek..." } }, guide={ st.priest.eyeOfVoid } },
	[50003900] = { npc=221740, name="Calefactus the Unleashed", class={ "HUNTER" }, spell={ "Rapid Killing" },
					quest={ { 81900, 81917, 81919 } }, questName={ { "The Burning Beast", "Chains That Bind", "Brought to Heel" } },
					guide={ st.hunter.rapidKilling }, tip={ st.hunter.calefactus } },
	[50601420] = { npc=7506, name="Bloodmage Lynnore", class={ "HUNTER" }, spell={ "Rapid Killing" },
					quest={ { 81900, 81917, 81919 } }, questName={ { "The Burning Beast", "Chains That Bind", "Brought to Heel" } },
					guide={ st.hunter.rapidKilling } },
	[55303220] = { item=220353, name="Conjurer's Codex", class={ "MAGE" },
					spell={ "Deep Freeze" }, guide={ st.mage.books }, alsoTestQuest=true,
					quest={ { 81956 } }, questName={ { "Conjurer's Codex" } } },
	[64404680] = { npc=7506, name="Shadowsworn mobs (Various)", class={ "HUNTER" }, spell={ "Rapid Killing" },
					quest={ { 81900, 81917, 81919 } }, questName={ { "The Burning Beast", "Chains That Bind", "Brought to Heel" } },
					guide={ st.hunter.rapidKilling }, tip={ "These are L51-53" } },
	[66603120] = { npc=7506, name="Shadowsworn mobs (Various)", class={ "HUNTER" }, spell={ "Rapid Killing" },
					quest={ { 81900, 81917, 81919 } }, questName={ { "The Burning Beast", "Chains That Bind", "Brought to Heel" } },
					guide={ st.hunter.rapidKilling }, tip={ "These are L51-53" } },
}
points[ 1428 ] = { -- Burning Steppes
	[28002900] = { item=220349, name="Stonewrought Design", class={ "MAGE" },
					spell={ "Deep Freeze" }, guide={ st.mage.books }, alsoTestQuest=true, tip=st.mage.booksBM,
					quest={ { 81953 } }, questName={ { "Stonewrought Design" } } },
}
points[ 1430 ] = { -- Deadwind Pass
	[52003440] = { 
		npc = 218920, 
		name = "達拉然特工",
		class = { "DRUID", "HUNTER", "MAGE", "PALADIN", "PRIEST", "ROGUE",
			"SHAMAN", "WARLOCK", "WARRIOR" }, 
		spell = { "King of the Jungle", "Melee Specialist", "Missile Barrage",
			"Infusion of Light", "Spirit of the Redeemer", "Waylay", "Two-Handed Mastery", "Demonic Knowledge",
			"Precise Timing" }, 
		guide = { st.dalaranAgent }, 
		quest = { st.dalaranQuest }, 
		questName = { st.dalaranQuestName } 
	},
	[43803380] = { 
		npc = 218931, 
		name = "達拉然特工", 
		tip = "沿著頂部路徑以及從這裡往北都可以看到",
		class = { "DRUID", "HUNTER", "MAGE", "PALADIN", "PRIEST", "ROGUE",
			"SHAMAN", "WARLOCK", "WARRIOR" }, 
		spell = { "King of the Jungle", "Melee Specialist", "Missile Barrage",
			"Infusion of Light", "Spirit of the Redeemer", "Waylay", "Two-Handed Mastery", "Demonic Knowledge",
			"Precise Timing" }, 
		guide = { st.dalaranAgent }, 
		quest = { st.dalaranQuest }, 
		questName = { st.dalaranQuestName } 
	},
}
points[ 1426 ] = { -- Dun Morogh
	[18007450] = { name="紐曼碼頭", class={ "PALADIN" }, spell={ "Sheath of Light" }, guide={ st.paladin.sheathLight },
					quest={ { 79939, 79940, 79945, 79970 } },
					questName={ { "The Broken Hammer", "A Lost Brother", "Orders from the Grand Crusader", "Aeonas the Vindicated" } } },
	[21205380] = { npc=1124, name="Frostmane Shadowcaster", faction="Alliance", class={ "MAGE", "PRIEST", "WARLOCK", "WARRIOR" },				
					spell={ "Living Flame", "Homunculi", "Demonic Grace", "Devastate" },
					guide={ st.mage.livingFlame, st.priest.citadel, st.warlock.grace ..st.warlock.graceDM,
							st.warrior.devastate ..st.warrior.devastateJunni },
					tip={ nil, nil, "Ominous Tome", "Severed Troll Head"} },
	[21607360] = { npc=724, name="Burly Rockjaw Trogg", class={ "ROGUE" }, faction="Alliance",
					tip="Pick Pocket Top-Left Map Piece",
					spell={ "Quick Draw" }, guide={ st.rogue.quickDraw ..st.rogue.quickDrawDM } },
	[22005300] = { name="Frostmane mobs (Various)", class={ "ROGUE" }, faction="Alliance",
					tip="Pick Pocket Top-Right Map Piece", spell={ "Quick Draw" },
					guide={ st.rogue.quickDraw ..st.rogue.quickDrawDM } },
	[22607840] = { npc=706, name="Frostmane Troll Whelp", class={ "PALADIN", "ROGUE", "WARRIOR" }, faction="Alliance",
					tip={ nil, "Pick Pocket Top-Right Map Piece", nil },
					spell={ "Crusader Strike", "Quick Draw", "Victory Rush" },
					quest={ 77657, {}, ( ( ns.race == "Dwarf" ) and 77655 or 77656 ) },
					questName={ "Relics of the Light", {}, "The Lost Rune" },
					guide={ st.paladin.judgement, st.rogue.quickDraw ..st.rogue.quickDrawDM, st.starterZoneClass } },
	[23407860] = { name="Ragged Wolf (Various)", class={ "WARLOCK" }, faction="Alliance",
					spell={ "Demonic Grace" }, guide={ st.warlock.grace ..st.warlock.graceDM }, tip="Wolf Jawbone" },
	[24607440] = { npc=724, name="Burly Rockjaw Trogg", class={ "ROGUE" }, faction="Alliance",
					tip="Pick Pocket Top-Left Map Piece",
					spell={ "Quick Draw" }, guide={ st.rogue.quickDraw ..st.rogue.quickDrawDM } },
	[25405100] = { npc=1124, name="Frostmane Shadowcaster", faction="Alliance", class={ "MAGE", "PRIEST", "WARLOCK", "WARRIOR" },
					spell={ "Living Flame", "Homunculi", "Demonic Grace", "Devastate" },
					guide={ st.mage.livingFlame, st.priest.citadel, st.warlock.grace ..st.warlock.graceDM,
							st.warrior.devastate ..st.warrior.devastateJunni },
					tip={ nil, nil, "Ominous Tome", "Severed Troll Head"} },
	[25604350] = { npc=208802, name="Wounded Adventurer", class={ "PALADIN" }, faction="Alliance",
					spell={ "Aegis" }, guide={ st.paladin.runeOfAegis } }, 
	[25804440] = { npc=8503, name="Gibblewilt", class={ "PRIEST" }, faction="Alliance",
					spell={ "Shared Pain" }, guide={ st.priest.sharedPain } },
	[26006940] = { name="Wolves (Various)", class={ "WARLOCK" }, faction="Alliance",
					spell={ "Demonic Grace" }, guide={ st.warlock.grace ..st.warlock.graceDM }, tip="Wolf Jawbone" },
	[26607440] = { name="Wolves (Various)", class={ "WARLOCK" }, faction="Alliance",
					spell={ "Demonic Grace" }, guide={ st.warlock.grace ..st.warlock.graceDM }, tip="Wolf Jawbone" },
	[26737255] = { object=405633, name="Rockjaw Footlocker", class={ "MAGE", "PRIEST", "WARLOCK" },  faction="Alliance",
					spell={ "Ice Lance", "Penance", "Haunt" },
					guide={ st.starterZoneClass, st.starterZoneClass ..st.priest.penanceDM, st.starterZoneClass },
					quest={ 77667, 77661, 77666 }, questName={ "Spell Research", "Meditation on the Light", "Stolen Power" } },
	[26807620] = { name="Ragged Wolf (Various)", class={ "WARLOCK" }, faction="Alliance",
					spell={ "Demonic Grace" }, guide={ st.warlock.grace ..st.warlock.graceDM }, tip="Wolf Jawbone" },
	[27007840] = { npc=706, name="Frostmane Troll Whelp", class={ "PALADIN", "ROGUE", "WARRIOR" }, faction="Alliance",
					tip={ nil, "Pick Pocket Top-Right Map Piece", nil },
					spell={ "Crusader Strike", "Quick Draw", "Victory Rush" },
					quest={ 77657, {}, ( ( ns.race == "Dwarf" ) and 77655 or 77656 ) },
					questName={ "Relics of the Light", {}, "The Lost Rune" },
					guide={ st.paladin.judgement, st.rogue.quickDraw ..st.rogue.quickDrawDM, st.starterZoneClass } },
	[27603700] = { npc=1211, name="Leper Gnome", class={ "PRIEST", "ROGUE" }, faction="Alliance",
					tip={ nil, "Pick pocket\nand kill. Bottom-Right Map Piece" }, spell={ "Void Plague", "Quick Draw" }, 
					guide={ st.priest.voidPlague, st.rogue.quickDraw .. st.rogue.quickDrawDM } },
	[27607560] = { npc=6113, name="Vejrek", class={ "WARRIOR" }, faction="Alliance",
					tip="The quest is a normal levelling quest, for your convenience.\n"
						.."Obtain from Muren Stormpike, Military Wing, Ironforge",
					quest={ 1679 }, questName={ "Vejrek" }, spell={ "Furious Thunder" }, guide={ st.warrior.furiousThunder } },
	[28376751] = { npc=916, name="Solm Hargrin", class={ "ROGUE" }, faction="Alliance", tip="Inside Anvlimar",
					quest={ ( ( ns.class == "DWARF" ) and 77658 or 77659 ) }, questName={ "Thrice Stolen" },
					spell={ "Shadowstrike" }, guide={ st.starterZoneClass } },
	[28606638] = { npc=837, name="Branstock Khalder", class={ "PRIEST" }, faction="Alliance", tip="Inside Anvilmar",
					quest={ 77661 }, questName={ "Meditation on the Light" },
					spell={ "Penance" }, guide={ st.starterZoneClass ..st.priest.penanceDM } },
	[28656615] = { npc=460, name="Alamar Grimm", class={ "WARLOCK" }, faction="Alliance",
					spell={ "Haunt" }, guide={ st.starterZoneClass }, quest={ 77666 },
					questName={ "Stolen Power" } },
	[28716637] = { npc=944, name="Marryk Nurribit", class={ "MAGE" },
					quest={ 77667 }, questName={ "Spell Research" },
					faction="Alliance", spell={ "Ice Lance" }, guide={ st.starterZoneClass } },
	[28854986] = { npc=208975, name="Rustling Bush", class={ "HUNTER" }, faction="Alliance",
					spell={ "Master Marksman" }, guide={ st.hunter.masterMark } },
	[28808060] = { npc=706, name="Frostmane Troll Whelp", class={ "PALADIN", "ROGUE", "WARRIOR" }, faction="Alliance",
					tip={ nil, "Pick Pocket Top-Right Map Piece", nil },
					spell={ "Crusader Strike", "Quick Draw", "Victory Rush" },
					quest={ 77657, {}, ( ( ns.race == "Dwarf" ) and 77655 or 77656 ) },
					questName={ "Relics of the Light", {}, "The Lost Rune" },
					guide={ st.paladin.judgement, st.rogue.quickDraw ..st.rogue.quickDrawDM, st.starterZoneClass } },
	[28836724] = { npc=912, name="Thran Khorman", class={ "WARRIOR" }, rfaction="Alliance",
					spell={ "Victory Rush" }, guide={ st.starterZoneClass },
					quest={ ( ( ns.race == "Dwarf" ) and 77655 or 77656 ) } },
	[28836833] = { npc=926, name="Bromos Grummner", class={ "PALADIN" }, faction="Alliance",
					spell={ "Crusader Strike" }, quest={ 77657 }, questName={ "Relics of the Light" }, tip="Inside Anvilmar",
					guide={ st.paladin.judgement } },
	[29186745] = { npc=895, name="Thorgas Grimson", class={ "HUNTER" }, faction="Alliance", tip="Inside Anvlimar",
					quest={ 77660 }, questName={ "Trek Through the Caves" },
					spell={ "Chimera Shot" }, guide={ st.starterZoneClass } },
	[29404260] = { npc=1119, name="Fyodi", class={ "HUNTER", "MAGE", "WARRIOR" }, faction="Alliance",
					spell={ "Explosive Shot", "Fingers of Frost", "Furious Thunder" },
					guide={ st.hunter.explosiveShot, st.mage.fingers, st.warrior.furiousThunder } },
	[29807460] = { name="Ragged Wolf (Various)", class={ "WARLOCK" }, faction="Alliance",
					spell={ "Demonic Grace" }, guide={ st.warlock.grace ..st.warlock.graceDM }, tip="Wolf Jawbone" },
	[30008240] = { npc=946, name="Frostmane Novice", class={ "ROGUE" }, faction="Alliance",
					tip="Pick Pocket Top-Right Map Piece", spell={ "Quick Draw" },
					guide={ st.rogue.quickDraw ..st.rogue.quickDrawDM } },
	[30607500] = { npc=724, name="Burly Rockjaw Trogg", class={ "ROGUE" }, faction="Alliance",
					tip="Pick Pocket Top-Left Map Piece",
					spell={ "Quick Draw" }, guide={ st.rogue.quickDraw ..st.rogue.quickDrawDM } },
	[30748008] = { object=405628, name="Frostmane Loot Cache", class={ "HUNTER", "ROGUE" }, faction="Alliance",
					quest={ 77660, ( ( ns.class == "DWARF" ) and 77658 or 77659 ) },
					questName={ "Trek Through the Caves", "Thrice Stolen" },
					spell={ "Chimera Shot", "Shadowstrike" }, guide={ st.starterZoneClass },
					tip="Behind Grik'nir the Cold, deep in the cave" },
	[31607000] = { name="Wolves (Various)", class={ "WARLOCK" }, faction="Alliance",
					spell={ "Demonic Grace" }, guide={ st.warlock.grace ..st.warlock.graceDM }, tip="Wolf Jawbone" },
	[31804400] = { name="Wolves (Various)", class={ "WARLOCK" }, faction="Alliance",
					spell={ "Demonic Grace" }, guide={ st.warlock.grace ..st.warlock.graceDM }, tip="Wolf Jawbone" },
	[32803980] = { npc=1132, name="Timber", class={ "HUNTER", "MAGE" }, faction="Alliance",
					spell={ "Explosive Shot", "Fingers of Frost" }, guide={ st.hunter.explosiveShot, st.mage.fingers } },
	[32404020] = { name="Wolves (Various)", class={ "WARLOCK" }, faction="Alliance",
					spell={ "Demonic Grace" }, guide={ st.warlock.grace ..st.warlock.graceDM }, tip="Wolf Jawbone" },
	[33404540] = { npc=1132, name="Timber", class={ "HUNTER", "MAGE" }, faction="Alliance",
					spell={ "Explosive Shot", "Fingers of Frost" }, 
					guide={ st.hunter.explosiveShot, st.mage.fingers } },
	[35203500] = { npc=1119, name="Fyodi", class={ "HUNTER", "MAGE", "WARRIOR" }, faction="Alliance",
					spell={ "Explosive Shot", "Fingers of Frost", "Furious Thunder" },
					guide={ st.hunter.explosiveShot, st.mage.fingers, st.warrior.furiousThunder } },
	[35604500] = { name="Wolves (Various)", class={ "WARLOCK" }, faction="Alliance",
					spell={ "Demonic Grace" }, guide={ st.warlock.grace ..st.warlock.graceDM }, tip="Wolf Jawbone" },
	[36003880] = { name="Wolves (Various)", class={ "WARLOCK" }, faction="Alliance",
					spell={ "Demonic Grace" }, guide={ st.warlock.grace ..st.warlock.graceDM }, tip="Wolf Jawbone" },
	[37203880] = { npc=1132, name="Timber", class={ "HUNTER", "MAGE" }, faction="Alliance",
					spell={ "Explosive Shot", "Fingers of Frost" }, 
					guide={ st.hunter.explosiveShot, st.mage.fingers } },
	[37904250] = { npc=208812, name="Jorul", class={ "HUNTER" }, spell={ "Flanking Strike" },
					guide={ st.hunter.flankingStrike }, tip="Farm Dun Morogh Pig Meat from nearby boars" },
	[38405400] = { npc=1271, name="Old Icebeard", class={ "HUNTER", "MAGE", "WARRIOR" }, faction="Alliance",
					tip="Six minutes in the cave, 45 seconds outside. Cycle",
					spell={ "Explosive Shot", "Fingers of Frost", "Furious Thunder" },
					guide={ st.hunter.explosiveShot, st.mage.fingers, st.warrior.furiousThunder } },
	[39604600] = { npc=1137, name="Edan the Howler", class={ "HUNTER", "MAGE", "WARRIOR" }, faction="Alliance",
					spell={ "Explosive Shot", "Fingers of Frost", "Furious Thunder" }, tip="In the Grizzled Den",
					guide={ st.hunter.explosiveShot, st.mage.fingers, st.warrior.furiousThunder } },
	[40603660] = { npc=1397, name="Frostmane Seer", faction="Alliance", class={ "MAGE", "PRIEST", "WARLOCK", "WARRIOR" },
					spell={ "Living Flame", "Homunculi", "Demonic Grace", "Devastate" },
					guide={ st.mage.livingFlame, st.priest.citadel, st.warlock.grace ..st.warlock.graceDM,
							st.warrior.devastate ..st.warrior.devastateJunni },
					tip={ nil, nil, "Ominous Tome", "Severed Troll Head" } },
	[40604340] = { npc=1397, name="Frostmane Seer", faction="Alliance", class={ "MAGE", "PRIEST", "WARLOCK", "WARRIOR" },
					spell={ "Living Flame", "Homunculi", "Demonic Grace", "Devastate" },
					guide={ st.mage.livingFlame, st.priest.citadel, st.warlock.grace ..st.warlock.graceDM,
							st.warrior.devastate ..st.warrior.devastateJunni },
					tip={ nil, nil, "Ominous Tome", "Severed Troll Head" } },
	[41403600] = { name="Frostmane mobs (Various)", class={ "ROGUE" }, faction="Alliance",
					tip="Pick Pocket Top-Right Map Piece", spell={ "Quick Draw" },
					guide={ st.rogue.quickDraw ..st.rogue.quickDrawDM } },
	[41405560] = { npc=1134, name="Young Wendigo", faction="Alliance", class={ "WARLOCK", "WARRIOR" },
					spell={ "Demonic Grace", "Devastate" },
					guide={ st.warlock.grace ..st.warlock.graceDM, st.warrior.devastate  ..st.warrior.devastateJunni },
					tip={ "Wendigo Blood", "Severed Wendigo Paw"} },
	[41604380] = { name="Frostmane mobs (Various)", class={ "ROGUE" }, faction="Alliance",
					tip="Pick Pocket Top-Right Map Piece", spell={ "Quick Draw" },
					guide={ st.rogue.quickDraw ..st.rogue.quickDrawDM } },
	[41805140] = { npc=1135, name="Wendigo", faction="Alliance", class={ "WARLOCK", "WARRIOR" },
					spell={ "Demonic Grace", "Devastate" },
					guide={ st.warlock.grace ..st.warlock.graceDM, st.warrior.devastate  ..st.warrior.devastateJunni },
					tip={ "Wendigo Blood", "Severed Wendigo Paw"} },
	[42004560] = { npc=1397, name="Frostmane Seer", faction="Alliance", class={ "MAGE", "PRIEST", "WARLOCK", "WARRIOR" },
					spell={ "Living Flame", "Homunculi", "Demonic Grace", "Devastate" },
					guide={ st.mage.livingFlame, st.priest.citadel, st.warlock.grace ..st.warlock.graceDM,
							st.warrior.devastate ..st.warrior.devastateJunni },
					tip={ nil, nil, "Ominous Tome", "Severed Troll Head" } },
	[42203560] = { npc=204070, name="Soboz", class={ "WARLOCK" }, faction="Alliance",
					spell={ "Demonic Grace" }, guide={ st.warlock.grace ..st.warlock.graceDM }, tip="Shimmer Ridge" },
	[42204740] = { npc=1135, name="Wendigo", faction="Alliance", class={ "WARLOCK", "WARRIOR" },
					spell={ "Demonic Grace", "Devastate" },
					guide={ st.warlock.grace ..st.warlock.graceDM, st.warrior.devastate  ..st.warrior.devastateJunni },
					tip={ "Wendigo Blood", "Severed Wendigo Paw"} },
	[42603380] = { npc=1397, name="Frostmane Seer", faction="Alliance", class={ "MAGE", "PRIEST", "WARLOCK", "WARRIOR" },
					spell={ "Living Flame", "Homunculi", "Demonic Grace", "Devastate" },
					guide={ st.mage.livingFlame, st.priest.citadel, st.warlock.grace ..st.warlock.graceDM,
							st.warrior.devastate ..st.warrior.devastateJunni},
					tip={ nil, nil, "Ominous Tome", "Severed Troll Head" } },
	[43004760] = { name="Wolves (Various)", class={ "WARLOCK" }, faction="Alliance",
					spell={ "Demonic Grace" }, guide={ st.warlock.grace ..st.warlock.graceDM }, tip="Wolf Jawbone" },
	[43004960] = { npc=204827, name="Adventurer's Remains", class={ "DRUID", "PALADIN", "PRIEST", "SHAMAN" }, faction="Alliance",
					spell={ "Lifebloom", "Inspiration Exemplar", "Prayer of Mending", "Ancestral Guidance" }, 
					guide={ st.woundedAdventurer }, tip="In the Grizzled Den" },
	[43204960] = { npc=1137, name="Edan the Howler", class={ "HUNTER", "MAGE", "WARRIOR" }, faction="Alliance",
					spell={ "Explosive Shot", "Fingers of Frost", "Furious Thunder" },
					guide={ st.hunter.explosiveShot, st.mage.fingers, st.warrior.furiousThunder } },
	[43605560] = { npc=1134, name="Young Wendigo", faction="Alliance", class={ "WARLOCK", "WARRIOR" },
					spell={ "Demonic Grace", "Devastate" },
					guide={ st.warlock.grace ..st.warlock.graceDM, st.warrior.devastate  ..st.warrior.devastateJunni },
					tip={ "Wendigo Blood", "Severed Wendigo Paw"} },
	[45604320] = { name="Wolves (Various)", class={ "WARLOCK" }, faction="Alliance",
					spell={ "Demonic Grace" }, guide={ st.warlock.grace ..st.warlock.graceDM }, tip="Wolf Jawbone" },
	[46604760] = { name="Wolves (Various)", class={ "WARLOCK" }, faction="Alliance",
					spell={ "Demonic Grace" }, guide={ st.warlock.grace ..st.warlock.graceDM }, tip="Wolf Jawbone" },
	[46615334] = { npc=208652, name="Junni Steelpass", class={ "WARRIOR" }, faction="Alliance",
					spell={ "Devastate" }, guide={ st.warrior.devastate ..st.warrior.devastateJunni } },
	[46964373] = { name="Rune of Quick Draw", faction="Alliance", class={ "ROGUE" }, tip="Final Rune location. Under a bridge",
					spell={ "Quick Draw" }, guide={ st.rogue.quickDraw ..st.rogue.quickDrawTel } },
	[47005200] = { object=387466, name="Rusty Lockbox", class={ "ROGUE" }, faction="Alliance",
					spell={ "Slaughter from the Shadows" }, guide={ st.rogue.slaughter },
					tip="On the roof of the Inn" },
	[47355355] = { npc=209002, name="Gaklik Voidtwist", class={ "WARLOCK" }, faction="Alliance",
					spell={ "Soul Siphon" }, guide={ st.warlock.soulSiphon } },
	[50004580] = { name="Wolves (Various)", class={ "WARLOCK" }, faction="Alliance",
					spell={ "Demonic Grace" }, guide={ st.warlock.grace ..st.warlock.graceDM }, tip="Wolf Jawbone" },
	[50605160] = { name="Wolves (Various)", class={ "WARLOCK" }, faction="Alliance",
					spell={ "Demonic Grace" }, guide={ st.warlock.grace ..st.warlock.graceDM }, tip="Wolf Jawbone" },
	[528057900] = { npc=1130, name="Bjarn", class={ "MAGE" }, faction="Alliance",
					spell={ "Fingers of Frost" }, guide={ st.mage.fingers } },
	[51804000] = { name="Wolves (Various)", class={ "WARLOCK" }, faction="Alliance",
					spell={ "Demonic Grace" }, guide={ st.warlock.grace ..st.warlock.graceDM }, tip="Wolf Jawbone" },
	[51804180] = { npc=203079, name="Wandering Swordsman", class={ "WARRIOR" },
					spell={ "Blood Frenzy" }, guide={ st.warrior.bloodFrenzy } },
	[53804720] = { npc=203079, name="Wandering Swordsman", class={ "WARRIOR" },
					spell={ "Blood Frenzy" }, guide={ st.warrior.bloodFrenzy } },
	[54983192] = { npc=214099, name="Tamelyn Aldridge", faction="Alliance",
					class=st.allClass, spell=st.allSpellACA, guide={ st.supplyFaction } },
	[56705850] = { npc=1130, name="Bjarn", class={ "MAGE" }, faction="Alliance",
					spell={ "Fingers of Frost" }, guide={ st.mage.fingers } },
	[57204520] = { npc=208886, name="Blackrat", class={ "ROGUE" }, faction="Alliance", tip="Stealthed. In the boat",
					spell={ "Mutilate" }, guide={ st.rogue.mutilate } },
	[50805940] = { npc=1130, name="Bjarn", class={ "MAGE" }, faction="Alliance",
					spell={ "Fingers of Frost" }, guide={ st.mage.fingers } },
	[60106080] = { npc=1130, name="Bjarn", class={ "MAGE" }, faction="Alliance",
					spell={ "Fingers of Frost" }, guide={ st.mage.fingers } },
	[59412327] = { object=405946, name="Dusty Chest", class={ "ROGUE" }, faction="Alliance", guide={ st.rogue.precision },
					tip="In an alcove to the right of the stairs", spell={ "Slaughter from the Shadows" } },
	[59804940] = { npc=1388, name="Vagash", class={ "HUNTER", "MAGE", "WARRIOR" }, faction="Alliance",
					spell={ "Explosive Shot", "Fingers of Frost", "Furious Thunder" },
					guide={ st.hunter.explosiveShot, st.mage.fingers, st.warrior.furiousThunder } },
	[62604620] = { npc=1388, name="Vagash", class={ "HUNTER", "MAGE", "WARRIOR" }, faction="Alliance",
					spell={ "Explosive Shot", "Fingers of Frost", "Furious Thunder" },
					guide={ st.hunter.explosiveShot, st.mage.fingers, st.warrior.furiousThunder } },
	[62605640] = { npc=1130, name="Bjarn", class={ "MAGE" }, faction="Alliance",
					spell={ "Fingers of Frost" }, guide={ st.mage.fingers } },
	[62723345] = { npc=5570, name="Bruuk Barleybeard", class={ "WARRIOR" }, faction="Alliance",					
					spell={ "Frenzied Assault" }, guide={ st.warrior.frenziedAssault },
					tip="Speak to Bruuk first, and then\nspeak to Bruart, who is nearby.\n"
						.."They are in the inn Bruuk's\nCorner, to the left of the\n"
						.."entrance to the Military Wing" },
	[63282278] = { object=386691, name="Library Book", class={ "MAGE" }, faction="Alliance",
					spell={ "Icy Veins" }, guide={ st.mage.books }, alsoTestQuest=true,
					quest={ 79091 }, questName={ "Archmage Antonidas: The Unabridged Autobiography" },
					tip="The Ironforge Library of course!" },
	[63605020] = { npc=208711, name="Toby", class={ "HUNTER" }, spell={ "Carve" },
					guide={ st.hunter.carve } },
	[65005960] = { npc=1130, name="Bjarn", class={ "MAGE" }, faction="Alliance",
					spell={ "Fingers of Frost" }, guide={ st.mage.fingers } },
	[67005960] = { name="Rockjaw mobs (Various)", class={ "ROGUE", "WARRIOR" }, faction="Alliance",
					tip={ "Pick Pocket Top-Left Map Piece", "Pristine Trogg Heart" }, spell={ "Quick Draw", "Devastate" },
					guide={ st.rogue.quickDraw ..st.rogue.quickDrawDM, st.warrior.devastate ..st.warrior.devastateJunni } },
	[69405220] = { name="Rockjaw mobs (Various)", class={ "ROGUE", "WARRIOR" }, faction="Alliance",
					tip={ "Pick Pocket Top-Left Map Piece", "Pristine Trogg Heart" }, spell={ "Quick Draw", "Devastate" },
					guide={ st.rogue.quickDraw ..st.rogue.quickDrawDM, st.warrior.devastate ..st.warrior.devastateJunni } },
	[69605820] = { npc=208752, name="Frozen Trogg", class={ "MAGE", "WARLOCK" }, faction="Alliance",
					tip="Needs about five separate Fire debuffs to defrost",
					spell={ "Burnout", "Chaos Bolt" }, guide={ st.frozen } },
	[69805900] = { npc=1118, name="Rockjaw Trogg mobs (Various)", class={ "HUNTER" }, spell={ "Carve" },
					guide={ st.hunter.carve } },
	[70005640] = { name="Rockjaw mobs (Various)", class={ "ROGUE", "WARRIOR" }, faction="Alliance",
					tip={ "Pick Pocket Top-Left Map Piece", "Pristine Trogg Heart" }, spell={ "Quick Draw", "Devastate" },
					guide={ st.rogue.quickDraw ..st.rogue.quickDrawDM, st.warrior.devastate ..st.warrior.devastateJunni } },
	[71805040] = { name="Rockjaw mobs (Various)", class={ "ROGUE", "WARRIOR" }, faction="Alliance",
					tip={ "Pick Pocket Top-Left Map Piece", "Pristine Trogg Heart" }, spell={ "Quick Draw", "Devastate" },
					guide={ st.rogue.quickDraw ..st.rogue.quickDrawDM, st.warrior.devastate ..st.warrior.devastateJunni } },
	[72605140] = { npc=1119, name="Hammerspine", class={ "MAGE", "PRIEST" }, faction="Alliance",
					spell={ "Fingers of Frost", "Shared Pain" }, guide={ st.mage.fingers, st.priest.sharedPain } },
	[73005920] = { name="Rockjaw mobs (Various)", class={ "ROGUE", "WARRIOR" }, faction="Alliance",
					tip={ "Pick Pocket Top-Left Map Piece", "Pristine Trogg Heart" }, spell={ "Quick Draw", "Devastate" },
					guide={ st.rogue.quickDraw ..st.rogue.quickDrawDM, st.warrior.devastate ..st.warrior.devastateJunni } },
	[75005800] = { name="Rockjaw mobs (Various)", class={ "ROGUE", "WARRIOR" }, faction="Alliance",
					tip={ "Pick Pocket Top-Left Map Piece", "Pristine Trogg Heart" }, spell={ "Quick Draw", "Devastate" },
					guide={ st.rogue.quickDraw ..st.rogue.quickDrawDM, st.warrior.devastate ..st.warrior.devastateJunni } },
	[77506080] = { npc=6123, name="Dark Iron Spy", class={ "ROGUE", "ROGUE" }, faction="Alliance", tip="Pickpocket",
					tip={ nil, "Pp and kill. Bottom-Left Map Piece" }, spell={ "Mutilate", "Quick Draw" },
					guide={ st.rogue.mutilate, st.rogue.quickDraw ..st.rogue.quickDrawDM } },
	[78206230] = { npc=6124, name="Captain Beld", class={ "PRIEST", "WARLOCK" }, faction="Alliance",
					spell={ "Shared Pain", "Soul Siphon" }, guide={ st.priest.sharedPain, st.warlock.soulSiphon } },

	[62605640] = { 
	  npc=1130, 
	  name="比亞恩", 
	  class={ "MAGE" }, 
	  faction="Alliance",
	  spell={ "Fingers of Frost" }, 
	  guide={ st.mage.fingers } 
	},

	[62723345] = { 
	  npc=5570, 
	  name="布魯克·大麥鬍", 
	  class={ "WARRIOR" }, 
	  faction="Alliance",					
	  spell={ "Frenzied Assault" }, 
	  guide={ st.warrior.frenziedAssault },
	  tip="先跟布魯克說話，然後\n再跟附近的布魯亞特說話。\n"
		  .."他們在布魯克的角落旅館裡，\n在軍情處入口的左側。" 
	},

	[63282278] = { 
	  object=386691, 
	  name="圖書館書籍", 
	  class={ "MAGE" }, 
	  faction="Alliance",
	  spell={ "Icy Veins" }, 
	  guide={ st.mage.icyVeins }, 
	  alsoTestQuest=true,
	  quest={ 79091 }, 
	  questName={ "大法師安東尼達斯：未刪節自傳" },
	  tip="當然是在鐵爐堡圖書館！" 
	},

	[63605020] = { 
	  npc=208711, 
	  name="托比", 
	  class={ "HUNTER" }, 
	  spell={ "Carve" },
	  guide={ st.hunter.carve } 
	},

	[65005960] = { 
	  npc=1130, 
	  name="比亞恩", 
	  class={ "MAGE" }, 
	  faction="Alliance",
	  spell={ "Fingers of Frost" }, 
	  guide={ st.mage.fingers } 
	},

	[67005960] = { 
	  name="碎石顎生物（多種）", 
	  class={ "ROGUE", "WARRIOR" }, 
	  faction="Alliance",
	  tip={ "扒竊左上角地圖碎片", "原始食人妖之心臟" }, 
	  spell={ "Quick Draw", "Devastate" },
	  guide={ st.rogue.quickDraw ..st.rogue.quickDrawDM, st.warrior.devastate ..st.warrior.devastateJunni } 
	},

	[69405220] = { 
	  name="碎石顎生物（多種）", 
	  class={ "ROGUE", "WARRIOR" }, 
	  faction="Alliance",
	  tip={ "扒竊左上角地圖碎片", "原始食人妖之心臟" }, 
	  spell={ "Quick Draw", "Devastate" },
	  guide={ st.rogue.quickDraw ..st.rogue.quickDrawDM, st.warrior.devastate ..st.warrior.devastateJunni } 
	},

	[69605820] = { 
	  npc=208752, 
	  name="冰凍的食人妖", 
	  class={ "MAGE", "WARLOCK" }, 
	  faction="Alliance",
	  tip="需要大約五個不同的火焰減益效果才能解凍",
	  spell={ "Burnout", "Chaos Bolt" }, 
	  guide={ st.frozen } 
	},

	[69805900] = { 
	  npc=1118, 
	  name="碎石顎食人妖生物（多種）", 
	  class={ "HUNTER" }, 
	  spell={ "Carve" },
	  guide={ st.hunter.carve } 
	},
	[70005640] = { 
	  name="碎石顎生物（多種）", 
	  class={ "ROGUE", "WARRIOR" }, 
	  faction="Alliance",
	  tip={ "扒竊左上角地圖碎片", "原始食人妖之心臟" }, 
	  spell={ "Quick Draw", "Devastate" },
	  guide={ st.rogue.quickDraw ..st.rogue.quickDrawDM, st.warrior.devastate ..st.warrior.devastateJunni } 
	},

	[71805040] = { 
	  name="碎石顎生物（多種）", 
	  class={ "ROGUE", "WARRIOR" }, 
	  faction="Alliance",
	  tip={ "扒竊左上角地圖碎片", "原始食人妖之心臟" }, 
	  spell={ "Quick Draw", "Devastate" },
	  guide={ st.rogue.quickDraw ..st.rogue.quickDrawDM, st.warrior.devastate ..st.warrior.devastateJunni } 
	},

	[72605140] = { 
	  npc=1119, 
	  name="錘脊", 
	  class={ "MAGE", "PRIEST" }, 
	  faction="Alliance",
	  spell={ "Fingers of Frost", "Shared Pain" }, 
	  guide={ st.mage.fingers, st.priest.sharedPain } 
	},

	[73005920] = { 
	  name="碎石顎生物（多種）", 
	  class={ "ROGUE", "WARRIOR" }, 
	  faction="Alliance",
	  tip={ "扒竊左上角地圖碎片", "原始食人妖之心臟" }, 
	  spell={ "Quick Draw", "Devastate" },
	  guide={ st.rogue.quickDraw ..st.rogue.quickDrawDM, st.warrior.devastate ..st.warrior.devastateJunni } 
	},

	[75005800] = { 
	  name="碎石顎生物（多種）", 
	  class={ "ROGUE", "WARRIOR" }, 
	  faction="Alliance",
	  tip={ "扒竊左上角地圖碎片", "原始食人妖之心臟" }, 
	  spell={ "Quick Draw", "Devastate" },
	  guide={ st.rogue.quickDraw ..st.rogue.quickDrawDM, st.warrior.devastate ..st.warrior.devastateJunni } 
	},

	[77506080] = { 
	  npc=6123, 
	  name="黑鐵間諜", 
	  class={ "ROGUE", "ROGUE" }, 
	  faction="Alliance", 
	  tip="Pickpocket",
	  tip={ nil, "Pp and kill. Bottom-Left Map Piece" }, 
	  spell={ "Mutilate", "Quick Draw" },
	  guide={ st.rogue.mutilate, st.rogue.quickDraw ..st.rogue.quickDrawDM } 
	},

	[78206230] = { 
	  npc=6124, 
	  name="貝爾德隊長", 
	  class={ "PRIEST", "WARLOCK" }, 
	  faction="Alliance",
	  spell={ "Shared Pain", "Soul Siphon" }, 
	  guide={ st.priest.sharedPain, st.warlock.soulSiphon } 
	},

	[79003710] = { 
	  npc=1961, 
	  name="曼格克勞", 
	  class={ "HUNTER", "MAGE" }, 
	  faction="Alliance",
	  spell={ "Explosive Shot", "Fingers of Frost" }, 
	  guide={ st.hunter.explosiveShot, st.mage.fingers } 
	},
}
points[ 1431 ] = { -- Duskwood
	[04402840] = { npc=205153, name="Ada Gelhardt", class={ "PALADIN" }, faction="Alliance",
					spell={ "Seal of Martyrdom" }, guide={ st.paladin.martyrdom } },
	[16702850] = { object=409735, name="Spellbook", class={ "MAGE" },
					spell={ "Icy Veins" }, guide={ st.mage.books }, alsoTestQuest=true,
					quest={ 78147 }, questName={ "Crimes Against Anatomy" },
					tip="In the last room of the Dawning Wood\nCatacombs. The western building" },
	[17603740] = { object=411328, name="Slumbering Bones", class={ "MAGE", "WARRIOR" },
					spell={ "Mass Regeneration", "Flagellation" }, guide={ st.duskwoodCrypts },
					tip="This Crypt second" },
	[19904550] = { npc=215, name="Statue", class={ "ROGUE" },
					tip="/kneel here at the statue, after\nyou obtain an Engraved Gold Ring",
					spell={ "Shiv" }, guide={ st.rogue.shiv } },
	[21804640] = { npc=218931, name="Dark Rider", tip="Seen throughout the Raven Hill cemetary",
					class={ "DRUID", "HUNTER", "MAGE", "PALADIN", "PRIEST", "ROGUE",
					"SHAMAN", "WARLOCK", "WARRIOR" }, spell={ "King of the Jungle", "Melee Specialist", "Missile Barrage",
					"Infusion of Light", "Spirit of the Redeemer", "Waylay", "Two-Handed Mastery", "Demonic Knowledge",
					"Precise Timing" }, guide={ st.dalaranAgent }, quest={ st.dalaranQuest }, questName={ st.dalaranQuestName } },
	[22606880] = { name="Defias Mobs (Various)", class={ "PALADIN", "PRIEST" },
					spell={ "Exorcist", "Circle of Healing" }, guide={ st.paladin.banishment, st.priest.circle } },
	[22806560] = { npc=215, name="Defias Night Runner", class={ "ROGUE" },
					tip="Pp to obtain a Engraved Gold Ring",
					spell={ "Shiv" }, guide={ st.rogue.shiv } },
	[22836560] = { name="Defias Mobs (Various)", class={ "PALADIN" }, faction="Alliance", -- offset to avoid duplicate pin
					spell={ "Exorcist" }, guide={ st.paladin.banishment } },
	[23607320] = { name="Defias Mobs (Various)", class={ "PALADIN" }, faction="Alliance",
					spell={ "Exorcist" }, guide={ st.paladin.banishment } },
	[26003090] = { object=411348, name="Dusty Coffer", class={ "MAGE", "WARRIOR" },
					spell={ "Mass Regeneration", "Flagellation" }, guide={ st.duskwoodCrypts },
					tip="This Crypt first" },
	[45605120] = { name="Quartermaster Falinar / Field Captain Palandar", class=st.allClass, spell=st.emeraldSpell,
					guide={ st.nightmareIncursions } },
	[50607540] = { name="Defias Mobs (Various)", class={ "PALADIN", "PRIEST" },
					spell={ "Exorcist", "Circle of Healing" }, guide={ st.paladin.banishment, st.priest.circle } },
	[50807100] = { npc=215, name="Defias Night Runner", class={ "ROGUE" },
					tip="Pp to obtain a Engraved Gold Ring",
					spell={ "Shiv" }, guide={ st.rogue.shiv } },
	[61403040] = { item=210043, name="Symbol of the Second Owl", class={ "DRUID" },
					spell={ "Wild Growth" }, guide={ st.druid.wildGrowth }, tip=st.agon },
	[65003440] = { item=210043, name="Symbol of the Second Owl", class={ "DRUID" },
					spell={ "Wild Growth" }, guide={ st.druid.wildGrowth }, tip=st.agon },
	[65402600] = { item=210043, name="Symbol of the Second Owl", class={ "DRUID" },
					spell={ "Wild Growth" }, guide={ st.druid.wildGrowth }, tip=st.agon },
	[67202940] = { item=210043, name="Symbol of the Second Owl", class={ "DRUID" },
					spell={ "Wild Growth" }, guide={ st.druid.wildGrowth }, tip=st.agon },
	[91103060] = { name="Secluded Grave", class={ "PRIEST" },
					spell={ "Circle of Healing" }, guide={ st.priest.circle } },
}
points[ 1429 ] = { -- Elwynn Forest
	[13213968] = { npc=203475, name="Liv Bradford", class={ "PALADIN", "WARRIOR" }, faction="Alliance",
					spell={ "Rebuke", "Frenzied Assault" },
					guide={ st.livAndStuart, st.warrior.frenziedAssault .."\n\n" ..st.livAndStuart } },
	[14184463] = { npc=204070, name="Soboz", class={ "WARLOCK" }, faction="Alliance",
					spell={ "Demonic Grace" }, guide={ st.warlock.grace ..st.warlock.graceEF },
					tip="He's" ..st.secretCoven ..".\n\nTake the ramp next to Gakin and descend\n"
						.."into the crypts. Take the first right turn and\ngo down. Now the first left turn down. Voilà!\n\n"
						.."Stand on the magenta rune and summon!" },
	[14234510] = { npc=6122, name="Gakin the Darkbinder", class={ "WARLOCK" }, faction="Alliance",
					spell={ "Soul Siphon" }, guide={ st.warlock.soulSiphon }, tip="He's" ..st.secretCoven },
	[14574457] = { npc=5495, name="Ursula Deline", class={ "PALADIN" }, faction="Alliance",
					spell={ "Divine Storm" }, quest={ { 78088, 78089, 78090, 78091, 78092, 78093 } }, tip="She's" ..st.secretCoven,
					questName={ { "A Strange Artifact", "Advice from Stormwind", "A Second Opinion", "Earning Your Salt", 
						"It Must Be Destroyed", "Return to Delgren" } }, guide={ st.paladin.divineStorm } },
	[18862699] = { npc=5492, name="Katherine the Pure", class={ "PALADIN", "PALADIN" }, faction="Alliance",
					spell={ "Divine Storm", "Sheath of Light" }, tip="First room on the left",
					quest={ { 78088, 78089, 78090, 78091, 78092, 78093 }, { 79939, 79940, 79945, 79970 } },					
					questName={ { "A Strange Artifact", "Advice from Stormwind", "A Second Opinion", "Earning Your Salt", 
						"It Must Be Destroyed", "Return to Delgren" }, { "The Broken Hammer", "A Lost Brother",
						"Orders from the Grand Crusader", "Aeonas the Vindicated" } },
						guide={ st.paladin.divineStorm, st.paladin.sheathLight } },
	[17604413] = { npc=211033, name="Garion Wendell", class={ "MAGE" }, faction="Alliance",
					spell={ "Icy Veins" }, tip="Collect any 10 books", guide={ st.mage.books },
					quest={ st.mage.booksQuestIDsA }, questName={ st.mage.booksQuestNamesA }, },
	[19104563] = { npc=211033, name="Garion Wendell", class={ "MAGE" }, faction="Alliance",
					spell={ "Spell Power" }, tip="Collect any 20 books", guide={ st.mage.books },
					quest={ st.mage.booksQuestIDsA }, questName={ st.mage.booksQuestNamesA }, },
	[20604713] = { npc=211033, name="Garion Wendell", class={ "MAGE" }, faction="Alliance",
					spell={ "Deep Freeze" }, tip="Collect any 25 books", guide={ st.mage.books },
					quest={ st.mage.booksQuestIDsA }, questName={ st.mage.booksQuestNamesA, }, },					
	[17604713] = { npc=211033, name="Garion Wendell", class={ "MAGE" }, faction="Alliance",
					spell={ "Temporal Anomaly" }, guide={ st.mage.temporal },
					quest={ 82084 }, questName={ "A Lesson in Literacy" }, },					
	[19212554] = { npc=205278, name="Brother Romulus", class={ "PALADIN" }, faction="Alliance",
					spell={ "Seal of Martyrdom" }, guide={ st.paladin.martyrdom } },
	[22607320] = { npc=203079, name="Wandering Swordsman", class={ "WARRIOR" },
					spell={ "Blood Frenzy" }, guide={ st.warrior.bloodFrenzy } },
	[23609180] = { npc=100, name="Gruff Swiftbite", class={ "WARRIOR" }, faction="Alliance",
					spell={ "Furious Thunder" }, guide={ st.warrior.furiousThunder } },
	[24409460] = { name="Riverpaw Runt/Outrunner", class={ "WARLOCK", "WARRIOR" }, faction="Alliance",				
					guide={ st.warlock.grace ..st.warlock.graceEF, st.warrior.devastate ..st.warrior.devastateVik },
					spell={ "Demonic Grace", "Devastate" }, tip={ "Gnoll Blood", "Severed Gnoll Head"} },
	[25408820] = { name="Riverpaw Runt/Outrunner", class={ "WARLOCK", "WARRIOR" }, faction="Alliance",
					guide={ st.warlock.grace ..st.warlock.graceEF, st.warrior.devastate ..st.warrior.devastateVik },
					spell={ "Demonic Grace", "Devastate" }, tip={ "Gnoll Blood", "Severed Gnoll Head"} },
	[25573835] = { npc=213077, name="Elaine Compton", faction="Alliance",
					tip="Standing near the street corner, easily missed",
					class=st.allClass, spell=st.allSpellACA, guide={ st.supplyFaction } },
	[25607420] = { npc=203079, name="Wandering Swordsman", class={ "WARRIOR" },
					spell={ "Blood Frenzy" }, guide={ st.warrior.bloodFrenzy } },
	[26609360] = { npc=448, name="Hogger", class={ "MAGE", "WARLOCK", "WARRIOR" },
					spell={ "Fingers of Frost", "Soul Siphon", "Furious Thunder" },
					guide={ st.mage.fingers, st.warlock.soulSiphon, st.warrior.furiousThunder },
					tip="Pin marks his camp. Frequently kited" },
	[26808620] = { npc=100, name="Gruff Swiftbite", class={ "WARRIOR" }, faction="Alliance",
					spell={ "Furious Thunder" }, guide={ st.warrior.furiousThunder } },
	[27408020] = { npc=478, name="Riverpaw Outrunner", faction="Alliance", class={ "ROGUE" }, tip="Pick Pocket or kill. Bottom-Left Map Piece",
					spell={ "Quick Draw" }, guide={ st.rogue.quickDraw ..st.rogue.quickDrawEF } },
	[27409200] = { npc=478, name="Riverpaw Outrunner", faction="Alliance", class={ "ROGUE" }, tip="Pick Pocket or kill. Bottom-Left Map Piece",
					spell={ "Quick Draw" }, guide={ st.rogue.quickDraw ..st.rogue.quickDrawEF } },
	[28009580] = { npc=100, name="Gruff Swiftbite", class={ "WARRIOR" }, faction="Alliance",
					spell={ "Furious Thunder" }, guide={ st.warrior.furiousThunder } },
	[28362596] = { object=386777, name="Dusty Chest", class={ "ROGUE" }, faction="Alliance", guide={ st.rogue.precision },
					spell={ "Slaughter from the Shadows" }, tip="Upper level of the house in\nCutthroat Alley, Stormwind" },
	[29807480] = { npc=203079, name="Wandering Swordsman", class={ "WARRIOR" },
					spell={ "Blood Frenzy" }, guide={ st.warrior.bloodFrenzy } },
	[30608300] = { name="Riverpaw Runt/Outrunner", class={ "WARLOCK", "WARRIOR" }, faction="Alliance",
					guide={ st.warlock.grace ..st.warlock.graceEF, st.warrior.devastate ..st.warrior.devastateVik },
					spell={ "Demonic Grace", "Devastate" }, tip={ "Gnoll Blood", "Severed Gnoll Head"} },
	[30608820] = { npc=100, name="Gruff Swiftbite", class={ "WARRIOR" }, faction="Alliance",
					spell={ "Furious Thunder" }, guide={ st.warrior.furiousThunder } },
	[31205720] = { npc=116, name="Defias Bandit", faction="Alliance", class={ "ROGUE" }, tip="Pick Pocket or kill. Top-Left Map Piece",
					spell={ "Quick Draw" }, guide={ st.rogue.quickDraw ..st.rogue.quickDrawEF } },
	[31443441] = { npc=203226, name="Viktoria Woods", class={ "WARRIOR" }, faction="Alliance",
					spell={ "Devastate" }, guide={ st.warrior.devastate ..st.warrior.devastateVik }, },
	[41208820] = { name="Riverpaw Runt/Outrunner", class={ "WARLOCK", "WARRIOR" }, faction="Alliance",
					guide={ st.warlock.grace ..st.warlock.graceEF, st.warrior.devastate ..st.warrior.devastateVik },
					spell={ "Demonic Grace", "Devastate" }, tip={ "Gnoll Blood", "Severed Gnoll Head"} },
	[36008260] = { npc=475, name="Kobold Tunneler", faction="Alliance", class={ "ROGUE", "WARRIOR" },
					tip={ "Pick Pocket or kill. Top-Right Map Piece", "Severed Kobold Head" }, spell={ "Quick Draw", "Devastate" },
					guide={ st.rogue.quickDraw ..st.rogue.quickDrawEF, st.warrior.devastate ..st.warrior.devastateVik } },
	[36208000] = { npc=203079, name="Wandering Swordsman", class={ "WARRIOR" },
					spell={ "Blood Frenzy" }, guide={ st.warrior.bloodFrenzy } },
	[38607560] = { npc=203079, name="Wandering Swordsman", class={ "WARRIOR" },
					spell={ "Blood Frenzy" }, guide={ st.warrior.bloodFrenzy } },
	[40808020] = { npc=40, name="Kobold Miner", faction="Alliance", class={ "PRIEST", "ROGUE", "WARRIOR" },
					tip={ nil, "Pick Pocket or kill. Top-Right Map Piece", "Severed Kobold Head" },
					spell={ "Shared Pain", "Quick Draw", "Devastate" },
					guide={ st.priest.sharedPain, st.rogue.quickDraw ..st.rogue.quickDrawEF, 
							st.warrior.devastate ..st.warrior.devastateVik } },
	[41607600] = { npc=203079, name="Wandering Swordsman", class={ "WARRIOR" },
					spell={ "Blood Frenzy" }, guide={ st.warrior.bloodFrenzy } },
	[41607800] = { npc=327, name="Goldtooth", class={ "PRIEST", "WARRIOR", "WARRIOR" }, faction="Alliance",
					spell={ "Void Plague", "Furious Thunder", "Devastate" }, tip={ nil, nil, "Severed Kobold Head" },
					guide={ st.priest.voidPlague, st.warrior.furiousThunder, st.warrior.devastate ..st.warrior.devastateVik } },
	[44096632] = { npc=204256, name="Damien Kane", class={ "WARLOCK" }, faction="Alliance",
					spell={ "Soul Siphon" }, guide={ st.warlock.soulSiphon },
					tip= "Basement of the Lion's Pride, hiding behind barrels.\nOr go upstairs for ERP. "
						.."Truly a Season of Discovery! :O" },
	[44396624] = { npc=906, name="Maximillian Crowe", class={ "WARLOCK" }, faction="Alliance",
					tip="Basement of the Lion's Pride,\nvia the kitchen backroom",
					spell={ "Demonic Tactics" }, guide={ st.warlock.tactics } },
	[46176213] = { object=387466, name="Rusty Lockbox", class={ "ROGUE" }, faction="Alliance",
					spell={ "Slaughter from the Shadows" }, guide={ st.rogue.slaughter },
					tip="On the roof of the spooky house north of Goldshire.\nNext to the chimney so can be difficult to see.\n"
						.."Use the crates at the side of the house to jump" },
	[46807460] = { npc=116, name="Defias Bandit", faction="Alliance", class={ "ROGUE" }, tip="Pick Pocket or kill. Top-Left Map Piece",
					spell={ "Quick Draw" }, guide={ st.rogue.quickDraw ..st.rogue.quickDrawEF } },
	[48402920] = { npc=80, name="Kobold Laborer", class={ "PRIEST" }, faction="Alliance",
					tip="You want a Memory of a Troubled Acolyte to drop", spell={ "Penance" }, 
					guide={ st.starterZoneClass ..st.priest.penanceEF }, quest={ 77619 }, questName={ "Meditation on the Light" } },
	[49008320] = { name="Defias Bandit/Bodyguard", faction="Alliance", class={ "ROGUE" }, tip="Pick Pocket or kill. Top-Left Map Piece",
					spell={ "Quick Draw" }, guide={ st.rogue.quickDraw ..st.rogue.quickDrawEF } },
	[49206560] = { name="Crystal Lake Murlocs (Various)", faction="Alliance", class={ "WARRIOR" }, tip="Severed Murloc Head",
					spell={ "Devastate" }, guide={ st.warrior.devastate ..st.warrior.devastateVik } },
	[49663941] = { npc=198, name="Khelden Bremen", class={ "MAGE" }, faction="Alliance",
					tip="Enter the Abbey and bear left.\nHe is upstairs in the Library Wing",
					spell={ "Ice Lance" }, guide={ st.starterZoneClass }, quest={ 77620 }, questName={ "Spell Research" } },
	[49874265] = { npc=459, name="Drusilla La Salle", class={ "WARLOCK" }, faction="Alliance",
					spell={ "Haunt" }, guide={ st.starterZoneClass }, quest={ 77621 },
					questName={ "Stolen Power" } },
	[49985201] = { npc=201854, name="Cutty", class={ "ROGUE" }, faction="Alliance",
					tip="Stealthed. Outside of and leaning\nagainst the Northshire wall. Far\neastern edge, past the river",
					spell={ "Mutilate" }, guide={ st.rogue.mutilate } },
	[49813949] = { npc=915, name="Priestess Anetta", class={ "PRIEST" }, faction="Alliance",
					tip="Enter the Abbey and bear left. Enter the\nLibrary Wing and she's in the back room", spell={ "Penance" }, 
					guide={ st.starterZoneClass ..st.priest.penanceEF }, quest={ 77619 }, questName={ "Meditation on the Light" } },
	[50003500] = { npc=257, name="Kobold Worker", faction="Alliance", class={ "ROGUE" }, tip="Pick Pocket or kill. Top-Right Map Piece",
					spell={ "Quick Draw" }, guide={ st.rogue.quickDraw ..st.rogue.quickDrawEF } },
	[50406100] = { name="Crystal Lake Murlocs (Various)", faction="Alliance", class={ "WARRIOR" }, tip="Severed Murloc Head",
					spell={ "Devastate" }, guide={ st.warrior.devastate ..st.warrior.devastateVik } },
	[50434212] = { npc=925, name="Brother Sammuel", class={ "PALADIN" }, faction="Alliance",
					tip="Enter the Abbey and bear right.\nIn the Hall of Arms, a back room",
					spell={ "Crusader Strike" }, quest={ 77617 }, questName={ "Relics of the Light" },
					guide={ st.paladin.judgement } },
	[50642727] = { object=397987, name="Kobold Stashbox", class={ "WARRIOR" }, faction="Alliance",
					spell={ "Victory Rush" }, guide={ st.starterZoneClass }, 
					tip="Go to the very back.\nBattered Chest can spawn nearby!", },
	[50313992] = { npc=915, name="Jorik Kerridan", class={ "ROGUE" }, faction="Alliance",
					tip="Skulking behind the Abbey in the stables",
					spell={ "Shadowstrike" }, guide={ st.starterZoneClass }, quest={ 77618 }, questName={ "Thrice stolen" } },
	[52545192] = { object=387477, name="Defias Stashbox", class={ "ROGUE", "WARLOCK" }, faction="Alliance",
					tip="Between two dunnies, after the vineyard",
					spell={ "Shadowstrike", "Haunt" }, guide={ st.starterZoneClass }, quest={ 77618, 77621 },
					questName={ "Thrice stolen", "Stolen Power" } },
	[53406220] = { name="Crystal Lake Murlocs (Various)", faction="Alliance", class={ "WARRIOR" }, tip="Severed Murloc Head",
					spell={ "Devastate" }, guide={ st.warrior.devastate ..st.warrior.devastateVik } },
	[54004480] = { npc=38, name="Defias Thug", class={ "MAGE", "PALADIN" }, faction="Alliance",	
					spell={ "Ice Lance", "Crusader Strike" }, quest={ {}, { 77617 } }, questName={ {}, { "Relics of the Light" } },
					guide={ st.starterZoneClass, st.paladin.judgement } },
	[54006880] = { name="Crystal Lake Murlocs (Various)", faction="Alliance", class={ "WARRIOR" }, tip="Severed Murloc Head",
					spell={ "Devastate" }, guide={ st.warrior.devastate ..st.warrior.devastateVik } },
	[54804020] = { npc=38, name="Defias Thug", class={ "MAGE", "PALADIN" }, faction="Alliance",	
					spell={ "Ice Lance", "Crusader Strike" }, quest={ {}, { 77617 } }, questName={ {}, { "Relics of the Light" } },
					guide={ st.starterZoneClass, st.paladin.judgement } },
	[52205160] = { npc=38, name="Defias Thug", class={ "MAGE", "PALADIN" }, faction="Alliance",	
					spell={ "Ice Lance", "Crusader Strike" }, quest={ {}, { 77617 } }, questName={ {}, { "Relics of the Light" } },
					guide={ st.starterZoneClass, st.paladin.judgement } },
	[52208460] = { npc=204827, name="Adventurer's Remains", class={ "DRUID", "PALADIN", "PRIEST", "SHAMAN" }, faction="Alliance",
					spell={ "Lifebloom", "Inspiration Exemplar", "Prayer of Mending", "Ancestral Guidance" }, guide={ st.woundedAdventurer } },
	[52805980] = { npc=116, name="Defias Bandit", faction="Alliance", class={ "ROGUE" }, tip="Pick Pocket or kill. Top-Left Map Piece",
					spell={ "Quick Draw" }, guide={ st.rogue.quickDraw ..st.rogue.quickDrawEF } },
	[56805770] = { npc=204503, name="Dead Acolyte", class={ "WARLOCK" }, faction="Alliance",
					spell={ "Demonic Tactics" }, guide={ st.warlock.tactics } },
	[56806220] = { name="Crystal Lake Murlocs (Various)", faction="Alliance", class={ "WARRIOR" }, tip="Severed Murloc Head",
					spell={ "Devastate" }, guide={ st.warrior.devastate ..st.warrior.devastateVik } },
	[57514826] = { npc=103, name="Garrick Proudfoot", class={ "ROGUE" }, faction="Alliance", 
					tip="At a shack. East of the Vineyards.\nBeware, extremely fast respawn.\nBattered chest can spawn nearby",
					spell={ "Mutilate" }, guide={ st.rogue.mutilate } },
	[58006840] = { name="Crystal Lake Murlocs (Various)", faction="Alliance", class={ "WARRIOR" }, tip="Severed Murloc Head",
					spell={ "Devastate" }, guide={ st.warrior.devastate ..st.warrior.devastateVik } },
	[58406480] = { npc=1922, name="Gray Forest Wolf", class={ "WARLOCK" }, faction="Alliance",
					spell={ "Demonic Grace" }, guide={ st.warlock.grace ..st.warlock.graceEF }, tip="Wolf Jawbone" },
	[59606940] = { npc=1922, name="Gray Forest Wolf", class={ "WARLOCK" }, faction="Alliance",
					spell={ "Demonic Grace" }, guide={ st.warlock.grace ..st.warlock.graceEF }, tip="Wolf Jawbone" },
	[60405920] = { npc=1922, name="Gray Forest Wolf", class={ "WARLOCK" }, faction="Alliance",
					spell={ "Demonic Grace" }, guide={ st.warlock.grace ..st.warlock.graceEF }, tip="Wolf Jawbone" },
	[60804700] = { npc=471, name="Mother Fang", class={ "PRIEST" }, faction="Alliance",
					spell={ "Shared Pain" }, guide={ st.priest.sharedPain } },
	[61605380] = { npc=40, name="Kobold Miner", faction="Alliance", class={ "PRIEST", "ROGUE", "WARRIOR" },
					tip={ nil, "Pick Pocket or kill. Top-Right Map Piece", "Severed Kobold Head" },
					spell={ "Shared Pain", "Quick Draw", "Devastate" },
					guide={ st.priest.sharedPain, st.rogue.quickDraw ..st.rogue.quickDrawEF, 
							st.warrior.devastate ..st.warrior.devastateVik } },
	[61904730] = { npc=204989, name="Wounded Adventurer", class={ "PALADIN" }, faction="Alliance",
					spell={ "Aegis" }, guide={ st.paladin.runeOfAegis } },
	[63605540] = { npc=476, name="Kobold Geomancer", class={ "MAGE", "PRIEST", "WARLOCK" }, faction="Alliance",
					spell={ "Living Flame", "Shared Pain", "Demonic Grace" },
					guide={ st.mage.livingFlame, st.priest.sharedPain, st.warlock.grace ..st.warlock.graceDM } },
	[63806960] = { npc=1922, name="Gray Forest Wolf", class={ "WARLOCK" }, faction="Alliance",
					spell={ "Demonic Grace" }, guide={ st.warlock.grace ..st.warlock.graceEF }, tip="Wolf Jawbone" },
	[65205840] = { npc=1922, name="Gray Forest Wolf", class={ "WARLOCK" }, faction="Alliance",
					spell={ "Demonic Grace" }, guide={ st.warlock.grace ..st.warlock.graceEF }, tip="Wolf Jawbone" },
	[65404460] = { npc=118, name="Prowler", class={ "WARLOCK" }, faction="Alliance",
					spell={ "Demonic Grace" }, guide={ st.warlock.grace ..st.warlock.graceEF }, tip="Wolf Jawbone" },
	[65467007] = { object=386759, name="Library Book", class={ "MAGE" }, faction="Alliance",
					spell={ "Icy Veins" }, guide={ st.mage.books }, alsoTestQuest=true,
					tip="Halfway up the Tower of Azora. Sparkles, you can't miss it.\nContinue up to click on the "
						.."Eye of Azora. Harmless fun!\n\nOverall a very safe book to collect early. Nothing to fight",
					quest={ 79092 }, questName={ "Archmage Theocritus's Research Journal" } },
	[65608400] = { npc=46, name="Murloc Forager", faction="Alliance", class={ "ROGUE" }, tip="Pick Pocket or kill. Bottom-Right Map Piece",
					spell={ "Quick Draw" }, guide={ st.rogue.quickDraw ..st.rogue.quickDrawEF } },
	[67005800] = { npc=60, name="Ruklar the Trapper", class={ "PRIEST" }, faction="Alliance",
					spell={ "Shared Pain" }, guide={ st.priest.sharedPain } },
	[67803840] = { name="Riverpaw Runt/Outrunner", class={ "WARLOCK", "WARRIOR" }, faction="Alliance",
					guide={ st.warlock.grace ..st.warlock.graceEF, st.warrior.devastate ..st.warrior.devastateVik },
					spell={ "Demonic Grace", "Devastate" }, tip={ "Gnoll Blood", "Severed Gnoll Head"} },
	[68204520] = { npc=478, name="Riverpaw Outrunner", faction="Alliance", class={ "ROGUE" }, tip="Pick Pocket or kill. Bottom-Left Map Piece",
					spell={ "Quick Draw" }, guide={ st.rogue.quickDraw ..st.rogue.quickDrawEF } },
	[68204580] = { name="Riverpaw Runt/Outrunner", class={ "WARLOCK", "WARRIOR" }, faction="Alliance",
					guide={ st.warlock.grace ..st.warlock.graceEF, st.warrior.devastate ..st.warrior.devastateVik },
					spell={ "Demonic Grace", "Devastate" }, tip={ "Gnoll Blood", "Severed Gnoll Head"} },
	[68605080] = { name="Riverpaw Runt/Outrunner", class={ "WARLOCK", "WARRIOR" }, faction="Alliance",
					guide={ st.warlock.grace ..st.warlock.graceEF, st.warrior.devastate ..st.warrior.devastateVik },
					spell={ "Demonic Grace", "Devastate" }, tip={ "Gnoll Blood", "Severed Gnoll Head"} },
	[68807860] = { npc=116, name="Defias Bandit", faction="Alliance", class={ "ROGUE" }, tip="Pick Pocket or kill. Top-Left Map Piece",
					spell={ "Quick Draw" }, guide={ st.rogue.quickDraw ..st.rogue.quickDrawEF } },
	[69806740] = { npc=1922, name="Gray Forest Wolf", class={ "WARLOCK" }, faction="Alliance",
					spell={ "Demonic Grace" }, guide={ st.warlock.grace ..st.warlock.graceEF }, tip="Wolf Jawbone" },
	[70606160] = { npc=1922, name="Gray Forest Wolf", class={ "WARLOCK" }, faction="Alliance",
					spell={ "Demonic Grace" }, guide={ st.warlock.grace ..st.warlock.graceEF }, tip="Wolf Jawbone" },
	[72803860] = { name="Riverpaw Runt/Outrunner", class={ "WARLOCK", "WARRIOR" }, faction="Alliance",
					guide={ st.warlock.grace ..st.warlock.graceEF, st.warrior.devastate ..st.warrior.devastateVik },
					spell={ "Demonic Grace", "Devastate" }, tip={ "Gnoll Blood", "Severed Gnoll Head"} },
	[74403860] = { npc=118, name="Prowler", class={ "WARLOCK" }, faction="Alliance",
					spell={ "Demonic Grace" }, guide={ st.warlock.grace ..st.warlock.graceEF }, tip="Wolf Jawbone" },
	[74805200] = { npc=474, name="Defias Rogue Wizard", faction="Alliance", class={ "PRIEST", "ROGUE", "WARLOCK" },
					tip={ nil, "Pick Pocket or kill. Top-Left Map Piece",  "Ominous Tome" }, spell={ "Homunculi", "Quick Draw", "Demonic Grace" },
					guide={ st.priest.citadel, st.rogue.quickDraw ..st.rogue.quickDrawEF, st.warlock.grace ..st.warlock.graceEF } },
	[74806440] = { npc=1922, name="Gray Forest Wolf", class={ "WARLOCK" }, faction="Alliance",
					spell={ "Demonic Grace" }, guide={ st.warlock.grace ..st.warlock.graceEF }, tip="Wolf Jawbone" },
	[76608580] = { npc=46, name="Murloc Forager", faction="Alliance", class={ "ROGUE" }, tip="Pick Pocket or kill. Bottom-Right Map Piece",
					spell={ "Quick Draw" }, guide={ st.rogue.quickDraw ..st.rogue.quickDrawEF } },
	[77005180] = { npc=202060, name="Frozen Murloc", class={ "MAGE", "WARLOCK" }, faction="Alliance",
					tip="Needs about five separate Fire debuffs to defrost",
					spell={ "Burnout", "Chaos Bolt" }, guide={ st.frozen } },
	[78805900] = { npc=46, name="Murloc Forager", faction="Alliance", class={ "ROGUE" }, tip="Pick Pocket or kill. Bottom-Right Map Piece",
					spell={ "Quick Draw" }, guide={ st.rogue.quickDraw ..st.rogue.quickDrawEF } },
	[80004160] = { npc=118, name="Prowler", class={ "WARLOCK" }, faction="Alliance",
					spell={ "Demonic Grace" }, guide={ st.warlock.grace ..st.warlock.graceEF }, tip="Wolf Jawbone" },
	[80204700] = { npc=46, name="Murloc Forager", faction="Alliance", class={ "ROGUE" }, tip="Pick Pocket or kill. Bottom-Right Map Piece",
					spell={ "Quick Draw" }, guide={ st.rogue.quickDraw ..st.rogue.quickDrawEF } },
	[80307942] = { name="Rune of Quick Draw", faction="Alliance", class={ "ROGUE" }, tip="Final Rune location. Ridgepoint Tower grounds",
					spell={ "Quick Draw" }, guide={ st.rogue.quickDraw ..st.rogue.quickDrawTel } },
	[84607960] = { name="Critters with Wild Polymorph debuff", class={ "MAGE" },
					spell={ "Enlightenment" }, guide={ st.mage.enlightenment },
					tip="Reports of plenty at Ridgepoint\nTower but they can be anywhere" },
	[89607800] = { npc=116, name="Defias Bandit", faction="Alliance", class={ "ROGUE" }, tip="Pick Pocket or kill. Top-Left Map Piece",
					spell={ "Quick Draw" }, guide={ st.rogue.quickDraw ..st.rogue.quickDrawEF } },
}
points[ 1424 ] = { -- Hillsbrad Foothills
	[36917614] = { item=210026, name="Symbol of the Third Owl", class={ "DRUID" },
					spell={ "Wild Growth" }, guide={ st.druid.wildGrowth }, tip=st.druid.swim },
	[50504970] = { npc=3537, name="Zixil", class={ "HUNTER", "WARLOCK" }, tip=st.zixil,
					spell={ "Cobra Strikes", "Lake of Fire" }, guide={ st.hunter.cobraStrikes, st.warlock.firesWake } },
	[52704130] = { npc=3537, name="Zixil", class={ "HUNTER", "WARLOCK" }, tip=st.zixil,
					spell={ "Cobra Strikes", "Lake of Fire" }, guide={ st.hunter.cobraStrikes, st.warlock.firesWake } },
	[54438201] = { item=210026, name="Symbol of the Third Owl", class={ "DRUID" },
					spell={ "Wild Growth" }, guide={ st.druid.wildGrowth }, tip=st.druid.swim },
	[55501880] = { npc=3537, name="Zixil", class={ "HUNTER", "WARLOCK" }, tip=st.zixil,
					spell={ "Cobra Strikes", "Lake of Fire" }, guide={ st.hunter.cobraStrikes, st.warlock.firesWake } },
	[55602660] = { npc=3537, name="Zixil", class={ "HUNTER", "WARLOCK" }, tip=st.zixil,
					spell={ "Cobra Strikes", "Lake of Fire" }, guide={ st.hunter.cobraStrikes, st.warlock.firesWake } },
	[55603460] = { npc=3537, name="Zixil", class={ "HUNTER", "WARLOCK" }, tip=st.zixil,
					spell={ "Cobra Strikes", "Lake of Fire" }, guide={ st.hunter.cobraStrikes, st.warlock.firesWake } },
	[60603140] = { npc=211951, name="Koartul", class={ "HUNTER", "WARLOCK" },
					spell={ "Cobra Strikes", "Lake of Fire" }, guide={ st.hunter.cobraStrikes, st.warlock.firesWake } },
	[60702020] = { npc=3537, name="Zixil", class={ "HUNTER", "WARLOCK" }, tip=st.zixil,
					spell={ "Cobra Strikes", "Lake of Fire" }, guide={ st.hunter.cobraStrikes, st.warlock.firesWake } },
	[62206360] = { npc=2373, name="Kajaric Icon", class={ "SHAMAN" },
					spell={ "Lava Burst" }, guide={ st.shaman.kajaricIcon } },
	[62805680] = { npc=2373, name="Kajaric Icon", class={ "SHAMAN" },
					spell={ "Lava Burst" }, guide={ st.shaman.kajaricIcon } },
	[63606100] = { npc=2373, name="Kajaric Icon", class={ "SHAMAN" },
					spell={ "Lava Burst" }, guide={ st.shaman.kajaricIcon } },
	[65606040] = { npc=2373, name="Kajaric Icon", class={ "SHAMAN" },
					spell={ "Lava Burst" }, guide={ st.shaman.kajaricIcon } },
	[65606300] = { npc=2373, name="Kajaric Icon", class={ "SHAMAN" },
					spell={ "Lava Burst" }, guide={ st.shaman.kajaricIcon } },
	[67601500] = { npc=214529, name="Brave Stonetorch", class={ "PALADIN" }, preRune={ { "Fanaticism" } },
					quest={ { 81790 } }, questName={ { "Materials of Significance" } }, spell={ "Hammer of the Righteous" },
					tip="Yes, a Tauren Paladin. Nice\nlead in to Horde Paladins!", guide={ st.paladin.hammerRighteous } },
	[78603860] = { name="Wild Gryphon/Kurdros/Granistad", class={ "WARRIOR" }, spell={ "Blood Surge" }, guide={ st.warrior.bloodSurge },
					quest={ { 79624, 79677, 79678 } }, questName={ { "Anyone Can Cook", "A Quick Grocery Run", "Taste Testing" } } },
	[79704090] = { name="Rubble Pile/Storage Locker", class={ "WARLOCK" },
					spell={ "Lake of Fire" }, guide={ st.warlock.firesWake }, 
					tip="Aim carefully or bye bye 5 gold... QQ" },
	[80003900] = { npc=3536, name="Kris Legace", class={ "ROGUE" },
					tip="She sells a range of limited supply / rare leathers\nMaybe for you or the AH!",
					spell={ "Envenom" }, guide={ st.rogue.envenom } },
	[88604120] = { name="Wild Gryphon/Kurdros/Granistad", class={ "WARRIOR" }, spell={ "Blood Surge" }, guide={ st.warrior.bloodSurge },
					tip="Loot a Hybrid Haunch",
					quest={ { 79624, 79677, 79678 } }, questName={ { "Anyone Can Cook", "A Quick Grocery Run", "Taste Testing" } } },
}
points[ 1455 ] = { -- Ironforge
	[24276747] = { npc=214099, name="Tamelyn Aldridge", faction="Alliance",
					class=st.allClass, spell=st.allSpellACA, guide={ st.supplyFaction } },
	[27601120] = { npc=221827, name="Magister Falath", class={ "PALADIN" }, spell={ "Wrath" },
					guide={ st.paladin.wrath }, },
	[51901360] = { object=405946, name="Dusty Chest", class={ "ROGUE" }, faction="Alliance", guide={ st.rogue.precision },
					tip="In an alcove to the right of the stairs", spell={ "Slaughter from the Shadows" } },
	[72537696] = { npc=5570, name="Bruuk Barleybeard", class={ "WARRIOR" }, faction="Alliance",					
					spell={ "Frenzied Assault" }, guide={ st.warrior.frenziedAssault },
					tip="Speak to Bruuk first, and then\nspeak to Bruart, who is nearby.\n"
						.."They are in the inn Bruuk's\nCorner, to the left of the\n"
						.."entrance to the Military Wing" },
	[72417361] = { npc=209004, name="Bruart", class={ "WARRIOR" }, faction="Alliance",
					spell={ "Frenzied Assault" }, guide={ st.warrior.frenziedAssault },
					tip="Speak to Bruuk first, and then\nspeak to Bruart, who is nearby.\n"
						.."They are in the inn Bruuk's\nCorner, to the left of the\n"
						.."entrance to the Military Wing" },
	[75971056] = { object=386691, name="Library Book", class={ "MAGE" }, faction="Alliance",
					spell={ "Icy Veins" }, guide={ st.mage.books }, alsoTestQuest=true,
					quest={ 79091 }, questName={ "Archmage Antonidas: The Unabridged Autobiography" },
					tip="The Ironforge Library of course!" },
}
points[ 1432 ] = { -- Loch Modan
	[22807080] = { npc=3291, name="Greishan Ironstove", class={ "WARLOCK" }, faction="Alliance",
					spell={ "Master Channeler" }, guide={ st.warlock.channeling } },
	[26606460] = { npc=3291, name="Greishan Ironstove", class={ "WARLOCK" }, faction="Alliance",
					spell={ "Master Channeler" }, guide={ st.warlock.channeling } },
	[27004660] = { name="Stonesplitter Scout/Trogg", class={ "WARRIOR" },
					spell={ "Quick Strike" }, guide={ st.warrior.quickStrike },
					tip="Skull-Shaped Geode. Then get hit by a\nStonesplitter Skullthumper in the caves" },				
	[27205100] = { name="Stonesplitter Scout/Trogg", class={ "WARRIOR" },
					spell={ "Quick Strike" }, guide={ st.warrior.quickStrike },
					tip="Skull-Shaped Geode. Then get hit by a\nStonesplitter Skullthumper in the caves" },				
	[27408560] = { npc=1166, name="Stonesplitter Seer", class={ "MAGE" },
					spell={ "Living Bomb" }, guide={ st.mage.livingBomb } },
	[27605480] = { name="Stonesplitter Scout/Trogg", class={ "WARRIOR" },
					spell={ "Quick Strike" }, guide={ st.warrior.quickStrike },
					tip="Skull-Shaped Geode. Then get hit by a\nStonesplitter Skullthumper in the caves" },				
	[28008120] = { npc=1166, name="Stonesplitter Seer", class={ "MAGE" },
					spell={ "Living Bomb" }, guide={ st.mage.livingBomb } },
	[29206080] = { npc=3291, name="Greishan Ironstove", class={ "WARLOCK" }, faction="Alliance",
					spell={ "Master Channeler" }, guide={ st.warlock.channeling } },
	[29208320] = { npc=1163, name="Stonesplitter Skullthumper", class={ "WARRIOR" },
					spell={ "Quick Strike" }, guide={ st.warrior.quickStrike },
					tip="They will crack open your Skull-Shaped Geode" },				
	[29208760] = { npc=1166, name="Stonesplitter Seer", class={ "MAGE" },
					spell={ "Living Bomb" }, guide={ st.mage.livingBomb } },
	[30008380] = { npc=1166, name="Stonesplitter Seer", class={ "MAGE" },
					spell={ "Living Bomb" }, guide={ st.mage.livingBomb } },
	[30203300] = { npc=3291, name="Greishan Ironstove", class={ "WARLOCK" }, faction="Alliance",
					spell={ "Master Channeler" }, guide={ st.warlock.channeling } },
	[30208200] = { name="Stonesplitter Scout/Trogg", class={ "WARRIOR" },
					spell={ "Quick Strike" }, guide={ st.warrior.quickStrike },
					tip="Skull-Shaped Geode. Then get hit by a\nStonesplitter Skullthumper in the caves" },				
	[30404710] = { npc=3291, name="Greishan Ironstove", class={ "WARLOCK" }, faction="Alliance",
					spell={ "Master Channeler" }, guide={ st.warlock.channeling } },
	[30407520] = { name="Stonesplitter Scout/Trogg", class={ "WARRIOR" },
					spell={ "Quick Strike" }, guide={ st.warrior.quickStrike },
					tip="Skull-Shaped Geode. Then get hit by a\nStonesplitter Skullthumper in the caves" },				
	[31705420] = { npc=3291, name="Greishan Ironstove", class={ "WARLOCK" }, faction="Alliance",
					spell={ "Master Channeler" }, guide={ st.warlock.channeling } },
	[32208720] = { npc=1166, name="Stonesplitter Seer", class={ "MAGE" },
					spell={ "Living Bomb" }, guide={ st.mage.livingBomb } },
	[33607140] = { name="Stonesplitter Scout/Trogg", class={ "WARRIOR" },
					spell={ "Quick Strike" }, guide={ st.warrior.quickStrike },
					tip="Skull-Shaped Geode. Then get hit by a\nStonesplitter Skullthumper in the caves" },				
	[34204760] = { npc=3291, name="Greishan Ironstove", class={ "WARLOCK" }, faction="Alliance",
					spell={ "Master Channeler" }, guide={ st.warlock.channeling } },
	[34408160] = { npc=1166, name="Stonesplitter Seer", class={ "MAGE" },
					spell={ "Living Bomb" }, guide={ st.mage.livingBomb } },
	[34807640] = { name="Stonesplitter Scout/Trogg", class={ "WARRIOR" },
					spell={ "Quick Strike" }, guide={ st.warrior.quickStrike },
					tip="Skull-Shaped Geode. Then get hit by a\nStonesplitter Skullthumper in the caves" },				
	[35009060] = { npc=1166, name="Stonesplitter Seer", class={ "MAGE" },
					spell={ "Living Bomb" }, guide={ st.mage.livingBomb } },
	[35208100] = { npc=1163, name="Stonesplitter Skullthumper", class={ "WARRIOR" },
					spell={ "Quick Strike" }, guide={ st.warrior.quickStrike },
					tip="They will crack open your Skull-Shaped Geode" },				
	[35604890] = { object=408014, name="Gnomish Tome", class={ "MAGE" }, faction="Alliance",
					spell={ "Icy Veins" }, guide={ st.mage.books }, alsoTestQuest=true,
					quest={ 79093 }, questName={ "Rumi of Gnomeregan: The Collected Works" },
					tip="On a table behind the Inn keeper" },
	[35804950] = { object=407844, name="Libram Of Blessings", class={ "PALADIN" },
					faction="Alliance", spell={ "Horn of Lordaeron" }, tip="Lower room", guide={ st.paladin.blessings } },
	[36208620] = { npc=1163, name="Stonesplitter Skullthumper", class={ "WARRIOR" },
					spell={ "Quick Strike" }, guide={ st.warrior.quickStrike },
					tip="They will crack open your Skull-Shaped Geode" },				
	[36407800] = { npc=1166, name="Stonesplitter Seer", class={ "MAGE" },
					spell={ "Living Bomb" }, guide={ st.mage.livingBomb } },
	[36602560] = { name="Tunnel Rat mobs (Various)", class={ "PRIEST" }, faction="Alliance",
					spell={ "Twisted Faith" }, guide={ st.priest.twisted ..st.priest.twistedLM } },
	[36809160] = { object=407850, name="Sunken Reliquary", class={ "PALADIN" }, faction="Alliance",
					spell={ "Hand of Reckoning" }, guide={ st.paladin.justice },
					tip="Hug the left side of the cave.\nGo to the very back.\nAt the bottom of the waterfall" },
	[37208560] = { npc=1166, name="Stonesplitter Seer", class={ "MAGE" },
					spell={ "Living Bomb" }, guide={ st.mage.livingBomb } },
	[39403920] = { npc=1684, name="Khara Deepwater", class={ "DRUID" }, faction="Alliance",
					spell={ "Lacerate" }, guide={ st.druid.lacerate } },
	[43003780] = { npc=1224, name="Young Threshadon", class={ "DRUID" }, faction="Alliance",
					spell={ "Lacerate" }, guide={ st.druid.lacerate } },
	[44404920] = { npc=1224, name="Young Threshadon", class={ "DRUID" }, faction="Alliance",
					spell={ "Lacerate" }, guide={ st.druid.lacerate } },
	[44603020] = { npc=1224, name="Young Threshadon", class={ "DRUID" }, faction="Alliance",
					spell={ "Lacerate" }, guide={ st.druid.lacerate } },
	[45204420] = { npc=1224, name="Young Threshadon", class={ "DRUID" }, faction="Alliance",
					spell={ "Lacerate" }, guide={ st.druid.lacerate } },
	[46402700] = { npc=1224, name="Young Threshadon", class={ "DRUID" }, faction="Alliance",
					spell={ "Lacerate" }, guide={ st.druid.lacerate } },
	[46501270] = { object=407731, name="Stonemason's Toolbox", class={ "ROGUE" }, faction="Alliance",
					tip="There's an escape rope nearby!",
					spell={ "Saber Slash" }, guide={ st.rogue.saberSlash } },
	[47202780] = { npc=1166, name="Stonesplitter Seer", class={ "MAGE" },
					spell={ "Living Bomb" }, guide={ st.mage.livingBomb } },
	[47401960] = { npc=1166, name="Stonesplitter Seer", class={ "MAGE" },
					spell={ "Living Bomb" }, guide={ st.mage.livingBomb } },
	[47806380] = { npc=1224, name="Young Threshadon", class={ "DRUID" }, faction="Alliance",
					spell={ "Lacerate" }, guide={ st.druid.lacerate } },
	[48202360] = { npc=1166, name="Stonesplitter Seer", class={ "MAGE" },
					spell={ "Living Bomb" }, guide={ st.mage.livingBomb } },
	[49602980] = { npc=1166, name="Stonesplitter Seer", class={ "MAGE" },
					spell={ "Living Bomb" }, guide={ st.mage.livingBomb } },
	[50602500] = { npc=1166, name="Stonesplitter Seer", class={ "MAGE" },
					spell={ "Living Bomb" }, guide={ st.mage.livingBomb } },
	[50805880] = { npc=1224, name="Young Threshadon", class={ "DRUID" }, faction="Alliance",
					spell={ "Lacerate" }, guide={ st.druid.lacerate } },
	[51003950] = { npc=1224, name="Young Threshadon", class={ "DRUID" }, faction="Alliance",
					spell={ "Lacerate" }, guide={ st.druid.lacerate } },
	[51203340] = { npc=1224, name="Young Threshadon", class={ "DRUID" }, faction="Alliance",
					spell={ "Lacerate" }, guide={ st.druid.lacerate } },
	[51504720] = { npc=1224, name="Young Threshadon", class={ "DRUID" }, faction="Alliance",
					spell={ "Lacerate" }, guide={ st.druid.lacerate } },
	[54202700] = { object=407983, name="Pile of Stolen Books", class={ "MAGE" },
					spell={ "Regeneration" }, guide={ st.mage.regeneration } },
	[54206740] = { npc=1178, name="Haren Swifthoof", class={ "WARRIOR" }, faction="Alliance", tip=st.warrior.harenTip,
					spell={ "Endless Rage" }, guide={ st.warrior.endlessRage } },
	[55005400] = { npc=210107, name="Kackle", class={ "HUNTER" }, faction="Alliance",
					spell={ "Sniper Training" }, guide={ st.hunter.sniper } },
	[55206160] = { npc=1224, name="Young Threshadon", class={ "DRUID" }, faction="Alliance",
					spell={ "Lacerate" }, guide={ st.druid.lacerate } },
	[55505250] = { npc=1224, name="Young Threshadon", class={ "DRUID" }, faction="Alliance",
					spell={ "Lacerate" }, guide={ st.druid.lacerate } },
	[56201420] = { npc=1178, name="Haren Swifthoof", class={ "WARRIOR" }, faction="Alliance", tip=st.warrior.harenTip,
					spell={ "Endless Rage" }, guide={ st.warrior.endlessRage } },
	[56601420] = { name="Dark Iron mobs (Various)", class={ "ROGUE" }, faction="Alliance",
					tip="Eventually you'll score a\nDark Iron Lockbox from Pp.",
					spell={ "Blade Dance" }, guide={ st.rogue.bladeDance } },
	[57804280] = { npc=1224, name="Young Threshadon", class={ "DRUID" }, faction="Alliance",
					spell={ "Lacerate" }, guide={ st.druid.lacerate } },
	[59201820] = { npc=1178, name="Haren Swifthoof", class={ "WARRIOR" }, faction="Alliance", tip=st.warrior.harenTip,
					spell={ "Endless Rage" }, guide={ st.warrior.endlessRage } },
	[59602380] = { npc=1178, name="Haren Swifthoof", class={ "WARRIOR" }, faction="Alliance", tip=st.warrior.harenTip,
					spell={ "Endless Rage" }, guide={ st.warrior.endlessRage } },
	[61204440] = { npc=1224, name="Young Threshadon", class={ "DRUID" }, faction="Alliance",
					spell={ "Lacerate" }, guide={ st.druid.lacerate } },
	[61403360] = { npc=1178, name="Haren Swifthoof", class={ "WARRIOR" }, faction="Alliance", tip=st.warrior.harenTip,
					spell={ "Endless Rage" }, guide={ st.warrior.endlessRage } },
	[61405560] = { npc=1224, name="Young Threshadon", class={ "DRUID" }, faction="Alliance",
					spell={ "Lacerate" }, guide={ st.druid.lacerate } },
	[61605940] = { npc=1178, name="Haren Swifthoof", class={ "WARRIOR" }, faction="Alliance", tip=st.warrior.harenTip,
					spell={ "Endless Rage" }, guide={ st.warrior.endlessRage } },
	[62404180] = { npc=1178, name="Haren Swifthoof", class={ "WARRIOR" }, faction="Alliance", tip=st.warrior.harenTip,
					spell={ "Endless Rage" }, guide={ st.warrior.endlessRage } },
	[64205240] = { npc=1178, name="Haren Swifthoof", class={ "WARRIOR" }, faction="Alliance", tip=st.warrior.harenTip,
					spell={ "Endless Rage" }, guide={ st.warrior.endlessRage } },
	[68003480] = { npc=1178, name="Mo'grosh Ogres", class={ "WARRIOR" }, faction="Alliance", tip=st.warrior.harenTip,
					spell={ "Endless Rage" }, guide={ st.warrior.endlessRage } },
	[68202360] = { npc=1178, name="Mo'grosh Ogres", class={ "WARRIOR" }, faction="Alliance", tip=st.warrior.harenTip,
					spell={ "Endless Rage" }, guide={ st.warrior.endlessRage } },
	[71802760] = { npc=209908, name="Heretic Idol", class={ "PRIEST" }, faction="Alliance", 
					spell={ "Shadow Word: Death" }, guide={ "/kneel at the Idol. Done!" } },
	[72601940] = { name="Mo'grosh Ogres", class={ "WARRIOR" }, faction="Alliance", tip=st.warrior.harenTip,
					spell={ "Endless Rage" }, guide={ st.warrior.endlessRage } },
	[72606880] = { npc=209954, name="Demonic Remains", class={ "WARLOCK" }, faction="Alliance",
					spell={ "Shadow Bolt Volley" }, guide={ st.warlock.shadowbolts }, tip="Must use a Shadow spell" },
	[75803260] = { npc=1178, name="Mo'grosh Ogres", class={ "WARRIOR" }, faction="Alliance", tip=st.warrior.harenTip,
					spell={ "Endless Rage" }, guide={ st.warrior.endlessRage } },
	[77451416] = { object=409731, name="Scrolls", class={ "MAGE" },
					spell={ "Icy Veins" }, guide={ st.mage.books }, alsoTestQuest=true,
					quest={ 78148 }, questName={ "Runes of the Sorceror-Kings" },
					tip="Keep to the left as you walk in" },
	[83406520] = { npc=1187, name="Daryl the Youngling", class={ "HUNTER" },
					spell={ "Beast Mastery" }, guide={ st.hunter.beastMastery } },
}
points[ 1433 ] = { -- Redridge Mountains
	[26001400] = { name="Blackrock Mobs (Various)", class={ "PALADIN" }, faction="Alliance",
					spell={ "Divine Storm" }, quest={ { 78088, 78089, 78090, 78091, 78092, 78093 } },
					questName={ { "A Strange Artifact", "Advice from Stormwind", "A Second Opinion", "Earning Your Salt", 
						"It Must Be Destroyed", "Return to Delgren" } }, guide={ st.paladin.divineStorm } },
	[27200940] = { name="Blackrock Mobs (Various)", class={ "PALADIN" }, faction="Alliance",
					spell={ "Divine Storm" }, quest={ { 78088, 78089, 78090, 78091, 78092, 78093 } },
					questName={ { "A Strange Artifact", "Advice from Stormwind", "A Second Opinion", "Earning Your Salt", 
						"It Must Be Destroyed", "Return to Delgren" } }, guide={ st.paladin.divineStorm } },
	[28601160] = { name="Blackrock Mobs (Various)", class={ "PALADIN" }, faction="Alliance",
					spell={ "Divine Storm" }, quest={ { 78088, 78089, 78090, 78091, 78092, 78093 } },
					questName={ { "A Strange Artifact", "Advice from Stormwind", "A Second Opinion", "Earning Your Salt", 
						"It Must Be Destroyed", "Return to Delgren" } }, guide={ st.paladin.divineStorm } },
	[28601760] = { name="Blackrock Mobs (Various)", class={ "PALADIN" }, faction="Alliance",
					spell={ "Divine Storm" }, quest={ { 78088, 78089, 78090, 78091, 78092, 78093 } },
					questName={ { "A Strange Artifact", "Advice from Stormwind", "A Second Opinion", "Earning Your Salt", 
						"It Must Be Destroyed", "Return to Delgren" } }, guide={ st.paladin.divineStorm } },
	[30801540] = { name="Blackrock Mobs (Various)", class={ "PALADIN" }, faction="Alliance",
					spell={ "Divine Storm" }, quest={ { 78088, 78089, 78090, 78091, 78092, 78093 } },
					questName={ { "A Strange Artifact", "Advice from Stormwind", "A Second Opinion", "Earning Your Salt", 
						"It Must Be Destroyed", "Return to Delgren" } }, guide={ st.paladin.divineStorm } },
	[31000960] = { name="Blackrock Mobs (Various)", class={ "PALADIN" }, faction="Alliance",
					spell={ "Divine Storm" }, quest={ { 78088, 78089, 78090, 78091, 78092, 78093 } },
					questName={ { "A Strange Artifact", "Advice from Stormwind", "A Second Opinion", "Earning Your Salt", 
						"It Must Be Destroyed", "Return to Delgren" } }, guide={ st.paladin.divineStorm } },
	[31400640] = { name="Blackrock Mobs (Various)", class={ "PALADIN" }, faction="Alliance",
					spell={ "Divine Storm" }, quest={ { 78088, 78089, 78090, 78091, 78092, 78093 } },
					questName={ { "A Strange Artifact", "Advice from Stormwind", "A Second Opinion", "Earning Your Salt", 
						"It Must Be Destroyed", "Return to Delgren" } }, guide={ st.paladin.divineStorm } },
	[34400680] = { npc=214456, name="Dro'zem the Blasphemous", class={ "PALADIN" },
					faction="Alliance", spell={ "Avenger's Shield" }, guide={ "50% drop chance" } },
	[36001060] = { name="Blackrock Mobs (Various)", class={ "PALADIN" }, faction="Alliance",
					spell={ "Divine Storm" }, quest={ { 78088, 78089, 78090, 78091, 78092, 78093 } },
					questName={ { "A Strange Artifact", "Advice from Stormwind", "A Second Opinion", "Earning Your Salt", 
						"It Must Be Destroyed", "Return to Delgren" } }, guide={ st.paladin.divineStorm } },
	[37401280] = { name="Blackrock Mobs (Various)", class={ "PALADIN" }, faction="Alliance",
					spell={ "Divine Storm" }, quest={ { 78088, 78089, 78090, 78091, 78092, 78093 } },
					questName={ { "A Strange Artifact", "Advice from Stormwind", "A Second Opinion", "Earning Your Salt", 
						"It Must Be Destroyed", "Return to Delgren" } }, guide={ st.paladin.divineStorm } },
	[39601480] = { name="Blackrock Mobs (Various)", class={ "PALADIN" }, faction="Alliance",
					spell={ "Divine Storm" }, quest={ { 78088, 78089, 78090, 78091, 78092, 78093 } },
					questName={ { "A Strange Artifact", "Advice from Stormwind", "A Second Opinion", "Earning Your Salt", 
						"It Must Be Destroyed", "Return to Delgren" } }, guide={ st.paladin.divineStorm } },
	[42201760] = { name="Blackrock Mobs (Various)", class={ "PALADIN" }, faction="Alliance",
					spell={ "Divine Storm" }, quest={ { 78088, 78089, 78090, 78091, 78092, 78093 } },
					questName={ { "A Strange Artifact", "Advice from Stormwind", "A Second Opinion", "Earning Your Salt", 
						"It Must Be Destroyed", "Return to Delgren" } }, guide={ st.paladin.divineStorm } },
	[44001980] = { name="Blackrock Mobs (Various)", class={ "PALADIN" }, faction="Alliance",
					spell={ "Divine Storm" }, quest={ { 78088, 78089, 78090, 78091, 78092, 78093 } },
					questName={ { "A Strange Artifact", "Advice from Stormwind", "A Second Opinion", "Earning Your Salt", 
						"It Must Be Destroyed", "Return to Delgren" } }, guide={ st.paladin.divineStorm } },
	[62404360] = { npc=214456, name="Dro'zem the Blasphemous", class={ "PALADIN" },
					faction="Alliance", spell={ "Avenger's Shield" }, guide={ "50% drop chance" } },
	[63206300] = { name="Blackrock Mobs (Various)", class={ "PALADIN" }, faction="Alliance",
					spell={ "Divine Storm" }, quest={ { 78088, 78089, 78090, 78091, 78092, 78093 } },
					questName={ { "A Strange Artifact", "Advice from Stormwind", "A Second Opinion", "Earning Your Salt", 
						"It Must Be Destroyed", "Return to Delgren" } }, guide={ st.paladin.divineStorm } },
	[64204500] = { npc=214456, name="Dro'zem the Blasphemous", class={ "PALADIN" },
					faction="Alliance", spell={ "Avenger's Shield" }, guide={ "50% drop chance" } },
	[64605160] = { name="Blackrock Mobs (Various)", class={ "PALADIN" }, faction="Alliance",
					spell={ "Divine Storm" }, quest={ { 78088, 78089, 78090, 78091, 78092, 78093 } },
					questName={ { "A Strange Artifact", "Advice from Stormwind", "A Second Opinion", "Earning Your Salt", 
						"It Must Be Destroyed", "Return to Delgren" } }, guide={ st.paladin.divineStorm } },
	[65004840] = { npc=214456, name="Dro'zem the Blasphemous", class={ "PALADIN" },
					faction="Alliance", spell={ "Avenger's Shield" }, guide={ "50% drop chance" } },
	[65204840] = { name="Blackrock Mobs (Various)", class={ "PALADIN" }, faction="Alliance",
					spell={ "Divine Storm" }, quest={ { 78088, 78089, 78090, 78091, 78092, 78093 } },
					questName={ { "A Strange Artifact", "Advice from Stormwind", "A Second Opinion", "Earning Your Salt", 
						"It Must Be Destroyed", "Return to Delgren" } }, guide={ st.paladin.divineStorm } },
	[65405480] = { name="Blackrock Mobs (Various)", class={ "PALADIN" }, faction="Alliance",
					spell={ "Divine Storm" }, quest={ { 78088, 78089, 78090, 78091, 78092, 78093 } },
					questName={ { "A Strange Artifact", "Advice from Stormwind", "A Second Opinion", "Earning Your Salt", 
						"It Must Be Destroyed", "Return to Delgren" } }, guide={ st.paladin.divineStorm } },
	[66006060] = { name="Blackrock Mobs (Various)", class={ "PALADIN" }, faction="Alliance",
					spell={ "Divine Storm" }, quest={ { 78088, 78089, 78090, 78091, 78092, 78093 } },
					questName={ { "A Strange Artifact", "Advice from Stormwind", "A Second Opinion", "Earning Your Salt", 
						"It Must Be Destroyed", "Return to Delgren" } }, guide={ st.paladin.divineStorm } },
	[67405600] = { name="Blackrock Mobs (Various)", class={ "PALADIN" }, faction="Alliance",
					spell={ "Divine Storm" }, quest={ { 78088, 78089, 78090, 78091, 78092, 78093 } },
					questName={ { "A Strange Artifact", "Advice from Stormwind", "A Second Opinion", "Earning Your Salt", 
						"It Must Be Destroyed", "Return to Delgren" } }, guide={ st.paladin.divineStorm } },
	[67604860] = { name="Blackrock Mobs (Various)", class={ "PALADIN" }, faction="Alliance",
					spell={ "Divine Storm" }, quest={ { 78088, 78089, 78090, 78091, 78092, 78093 } },
					questName={ { "A Strange Artifact", "Advice from Stormwind", "A Second Opinion", "Earning Your Salt", 
						"It Must Be Destroyed", "Return to Delgren" } }, guide={ st.paladin.divineStorm } },
	[67605260] = { name="Blackrock Mobs (Various)", class={ "PALADIN" }, faction="Alliance",
					spell={ "Divine Storm" }, quest={ { 78088, 78089, 78090, 78091, 78092, 78093 } },
					questName={ { "A Strange Artifact", "Advice from Stormwind", "A Second Opinion", "Earning Your Salt", 
						"It Must Be Destroyed", "Return to Delgren" } }, guide={ st.paladin.divineStorm } },
	[68405600] = { npc=436, name="Blackrock Shadowcaster", class={ "PRIEST" },
					spell={ "Power Word: Barrier" }, guide={ "Low drop rate. Sucks to be Horde" } },
	[68805740] = { name="Blackrock Mobs (Various)", class={ "PALADIN" }, faction="Alliance",
					spell={ "Divine Storm" }, quest={ { 78088, 78089, 78090, 78091, 78092, 78093 } },
					questName={ { "A Strange Artifact", "Advice from Stormwind", "A Second Opinion", "Earning Your Salt", 
						"It Must Be Destroyed", "Return to Delgren" } }, guide={ st.paladin.divineStorm } },
	[69805400] = { name="Blackrock Mobs (Various)", class={ "PALADIN" }, faction="Alliance",
					spell={ "Divine Storm" }, quest={ { 78088, 78089, 78090, 78091, 78092, 78093 } },
					questName={ { "A Strange Artifact", "Advice from Stormwind", "A Second Opinion", "Earning Your Salt", 
						"It Must Be Destroyed", "Return to Delgren" } }, guide={ st.paladin.divineStorm } },
	[69805580] = { npc=409754, name="Wall-Mounted Shield", class={ "WARRIOR" },
					spell={ "Raging Blow" }, guide={ st.warrior.ragingBlow }, quest={ 78132, 78134, 78133, 78144 },
					questName={ "Dragonslayer's Helm", "Dragonslayer's Lance", "Dragonslayer's Shield",
						"Alonso the Dragonslayer" } },
	[72808060] = { npc=214456, name="Dro'zem the Blasphemous", class={ "PALADIN" },
					faction="Alliance", spell={ "Avenger's Shield" }, guide={ "50% drop chance" } },
	[74008220] = { npc=214519, name="Incinerator Gar'im", class={ "WARLOCK" },
					spell={ "Incinerate" }, tip="Loot and learn. Level 23\nElite with lots of adds" },
	[74607360] = { npc=214456, name="Dro'zem the Blasphemous", class={ "PALADIN" },
					faction="Alliance", spell={ "Avenger's Shield" }, guide={ "50% drop chance" } },
	[75407780] = { npc=214456, name="Dro'zem the Blasphemous", class={ "PALADIN" },
					faction="Alliance", spell={ "Avenger's Shield" }, guide={ "50% drop chance" } },
	[75408220] = { npc=214456, name="Dro'zem the Blasphemous", class={ "PALADIN" },
					faction="Alliance", spell={ "Avenger's Shield" }, guide={ "50% drop chance" } },
	[77607400] = { npc=214456, name="Dro'zem the Blasphemous", class={ "PALADIN" },
					faction="Alliance", spell={ "Avenger's Shield" }, guide={ "50% drop chance" } },
	[77608660] = { npc=214519, name="Incinerator Gar'im", class={ "WARLOCK" },
					spell={ "Incinerate" }, tip="Loot and learn. Level 23\nElite with lots of adds" },
	[78006960] = { npc=214456, name="Dro'zem the Blasphemous", class={ "PALADIN" },
					faction="Alliance", spell={ "Avenger's Shield" }, guide={ "50% drop chance" } },
	[80007000] = { npc=214456, name="Dro'zem the Blasphemous", class={ "PALADIN" },
					faction="Alliance", spell={ "Avenger's Shield" }, guide={ "50% drop chance" } },
	[80204950] = { item=210765, name="Orb of Des", class={ "WARLOCK" },
					spell={ "Metamorphosis" }, guide={ st.warlock.metamorphosis },
					tip="Top of the Tower of Ilgalar,\nin a Demonic Reliquary",
					quest={ { 1740, 78680, 78681, 78684, 78702 } }, questName={ { "The Orb of Soran'ruk", "Rumors Abound",
						"The Conjuring", "The Mysterious Traveler", "Raszel Ander" } } },
}
points[ 1427 ] = { -- Searing Gorge
	[14503650] = { object=441061, name="Weathered Etching", class={ "HUNTER" }, spell={ "Rapid Killing" },
					quest={ { 81900, 81917, 81919 } }, questName={ { "The Burning Beast", "Chains That Bind", "Brought to Heel" } },
					guide={ st.hunter.rapidKilling } },
	[24207280] = { npc=222620, name="Corrupt Moderate Manifestation of Fire", class={ "SHAMAN" }, spell={ "Overcharged" },
					guide={ st.shaman.overcharged },
					quest={ { 82073, 82076, 82071, 82074, 82072, 82075, 81960, 81968 } },
					questName={ { "Cleansing Water", "Answering Water's Call", "Purifying Fire", "Answering Fire's Call",
						"Purging Earth", "Answering Earth's Call", "Clarifying Air", "Answering Air's Call" } } },
	[30008200] = { item=220349, name="Stonewrought Design", class={ "MAGE" },
					spell={ "Deep Freeze" }, guide={ st.mage.books }, alsoTestQuest=true, tip=st.mage.booksBM,
					quest={ { 81953 } }, questName={ { "Stonewrought Design" } } },
	[31807340] = { name="Magma / Inferno Elemental", class={ "SHAMAN" }, spell={ "Overcharged" }, guide={ st.shaman.overcharged },
					quest={ { 82073, 82076, 82071, 82074, 82072, 82075, 81960, 81968 } },
					questName={ { "Cleansing Water", "Answering Water's Call", "Purifying Fire", "Answering Fire's Call",
						"Purging Earth", "Answering Earth's Call", "Clarifying Air", "Answering Air's Call" } } },
	[37804950] = { object=441253, name="Book", class={ "MAGE" }, tip="Look inside the tent. On the table",
					spell={ "Deep Freeze" }, guide={ st.mage.books }, alsoTestQuest=true,
					quest={ { 81955 } }, questName={ { "A Mind of Metal" } } },
	[42994469] = { object=441915, name="Giant Golem Arm (left)", class={ "WARRIOR" }, spell={ "Taste for Blood" },
					guide={ st.warrior.tasteForBlood } },
	[42503050] = { object=441913, name="Giant Golem Foot (left)", class={ "WARRIOR" }, spell={ "Taste for Blood" },
					guide={ st.warrior.tasteForBlood }, tip="At the back of the cave" },
	[43804580] = { item=223332, name="Vibrating Eye", class={ "PRIEST" }, spell={ "Eye of the Void" },
					quest={ { 82316 } }, questName={ { "Seven Eyes I Seek..." } }, guide={ st.priest.eyeOfVoid },
					tip="In a cave. You'll need to drop down" },
	[44003290] = { object=441912, name="Giant Golem Foot (right)", class={ "WARRIOR" }, spell={ "Taste for Blood" },
					guide={ st.warrior.tasteForBlood }, tip="Inside the slag pits" },
	[49703740] = { object=441914, name="Giant Golem Arm (right)", class={ "WARRIOR" }, spell={ "Taste for Blood" },
					guide={ st.warrior.tasteForBlood }, tip="In the lower cave" },
	[53105590] = { name="Stormcrow Nest/Egg", class={ "HUNTER" }, spell={ "Focus Fire" }, guide={ st.hunter.focusFire } },
	[55006500] = { item=221319, name="Blackrock Leycryst", class={ "MAGE", "PALADIN", "PRIEST", "WARLOCK" },
					spell={ "Displacement", "Purifying Power", "Despair", "Backdraft" }, guide={ st.leylineGuide },
					tip="Near to The Forlorn Ridge" },
	[66604500] = { npc=222546, name="Iodax the Obliterator", class={ "WARRIOR" }, spell={ "Taste for Blood" },
					guide={ st.warrior.tasteForBlood }, },
}
points[ 1421 ] = { -- Silverpine Forest
	[34800780] = { npc=210802, name="Webbed Victim", class={ "WARRIOR" }, faction="Horde",
					spell={ "Endless Rage" }, guide={ st.warriorEndlessRage },
					tip="In the Skittering Dark Cave you'll easily\nsee the vicitms. Click on then and defeat\n"
						.."the crazed Lost Adventurer.\n\nBut so many spiders to contend with" },
	[43402260] = { npc=1773, name="Rot Hide Mystic", class={ "SHAMAN" }, faction="Horde",
					spell={ "Way of Earth" }, guide={ st.shaman.earthenRune } },
	[43404120] = { object=410299, name="Arcane Secrets", class={ "MAGE" }, faction="Horde",
					spell={ "Icy Veins" }, guide={ st.mage.books }, alsoTestQuest=true,
					quest={ 79096 }, questName={ "Ataeric: On Arcane Curiosities" },
					tip="Inside the tomb, near Sebastian Meloche" },
	[44401940] = { npc=1773, name="Rot Hide Mystic", class={ "SHAMAN" }, faction="Horde",
					spell={ "Way of Earth" }, guide={ st.shaman.earthenRune } },
	[45002360] = { npc=1773, name="Rot Hide Mystic", class={ "SHAMAN" }, faction="Horde",
					spell={ "Way of Earth" }, guide={ st.shaman.earthenRune } },
	[45306730] = { object=409131, name="Rusty Chest", class={ "ROGUE" }, faction="Horde",
					tip="On a small platform near the entrance",
					spell={ "Saber Slash" }, guide={ st.rogue.saberSlash } },
	[45602160] = { npc=1773, name="Rot Hide Mystic", class={ "SHAMAN" }, faction="Horde",
					spell={ "Way of Earth" }, guide={ st.shaman.earthenRune } },
	[45604720] = { npc=1778, name="Ferocious Grizzled Bear", class={ "HUNTER" },
					spell={ "Beast Mastery" }, guide={ st.hunter.beastMastery } },
	[46802660] = { npc=1778, name="Ferocious Grizzled Bear", class={ "HUNTER" },
					spell={ "Beast Mastery" }, guide={ st.hunter.beastMastery } },
	[47107110] = { object=410369, name="Dead Drop", class={ "ROGUE", "ROGUE" },
					spell={ "Deadly Brew", "Shadowstep" },
					guide={ st.rogue.deadlyBrew, st.rogue.shadowstep },
					preRune={ {}, {}, { "Deadly Brew", "Shadowstep" } },
					quest={ { 78261, 78307 }, { 78699,78676 } },
					questName={ { "The Horn of Xelthos (Main)", "The Horn of Xelthos (Reward)" },
						{ "The Eye of Bhossca (Dead Drop)", "The Eye of Bhossca (SM)" }, } },
	[48607260] = { object=410369, name="Dead Drop", class={ "ROGUE" }, spell={ "Honor Among Thieves" },
					guide={ st.rogue.honorThieves },preRune={ { "Deadly Brew", "Shadowstep" } },
					quest={ { 6681, 80526, 80411, 80453, 80454, 80455 } },
					questName={ { "The Manor, Ravenholdt", "Fool Me Twice", "The Talisman of Kazdor", "Best Laid Plans",
						"One Last Drop", "Biding Our Time" } } },
	[48004060] = { npc=1769, name="Moonrage Whitescalp", class={ "DRUID" },
					spell={ "Lacerate" }, guide={ st.druid.lacerate } },
	[48203360] = { npc=1769, name="Moonrage Whitescalp", class={ "DRUID" },
					spell={ "Lacerate" }, guide={ st.druid.lacerate } },
	[49403680] = { npc=1778, name="Ferocious Grizzled Bear", class={ "HUNTER" },
					spell={ "Beast Mastery" }, guide={ st.hunter.beastMastery } },
	[49606860] = { npc=1867, name="Dalaran Apprentice", class={ "MAGE" },
					spell={ "Regeneration" }, guide={ st.mage.regeneration }, faction="Horde" },
	[50201560] = { npc=1778, name="Ferocious Grizzled Bear", class={ "HUNTER" },
					spell={ "Beast Mastery" }, guide={ st.hunter.beastMastery } },
	[50806160] = { npc=1867, name="Dalaran Apprentice", class={ "MAGE" },
					spell={ "Regeneration" }, guide={ st.mage.regeneration }, faction="Horde" },
	[51804420] = { npc=1769, name="Moonrage Whitescalp", class={ "DRUID" },
					spell={ "Lacerate" }, guide={ st.druid.lacerate } },
	[52202720] = { npc=1769, name="Moonrage Whitescalp", class={ "DRUID" },
					spell={ "Lacerate" }, guide={ st.druid.lacerate } },
	[52602060] = { npc=1778, name="Ferocious Grizzled Bear", class={ "HUNTER" },
					spell={ "Beast Mastery" }, guide={ st.hunter.beastMastery } },
	[53604760] = { npc=1778, name="Ferocious Grizzled Bear", class={ "HUNTER" },
					spell={ "Beast Mastery" }, guide={ st.hunter.beastMastery } },
	[54603880] = { npc=1778, name="Ferocious Grizzled Bear", class={ "HUNTER" },
					spell={ "Beast Mastery" }, guide={ st.hunter.beastMastery } },
	[54801960] = { npc=1769, name="Moonrage Whitescalp", class={ "DRUID" },
					spell={ "Lacerate" }, guide={ st.druid.lacerate } },
	[55404080] = { npc=1769, name="Moonrage Whitescalp", class={ "DRUID" },
					spell={ "Lacerate" }, guide={ st.druid.lacerate } },
	[55607280] = { npc=1867, name="Dalaran Apprentice", class={ "MAGE" },
					spell={ "Regeneration" }, guide={ st.mage.regeneration }, faction="Horde" },
	[56806540] = { npc=1867, name="Dalaran Apprentice", class={ "MAGE" },
					spell={ "Regeneration" }, guide={ st.mage.regeneration }, faction="Horde" },
	[57404480] = { npc=1972, name="Grimson the Pale", class={ "DRUID" }, faction="Horde",
					spell={ "Savage Roar", "Water Shield" }, guide={ st.druid.ferocious, st.shaman.tempestIcon } },
	[57806980] = { name="Ravenclaw Mobs (Various)", class={ "WARLOCK" },
					spell={ "Shadow Bolt Volley" }, guide={ st.warlock.shadowbolts } },
	[58204520] = { npc=212763, name="Sadistic Fiend", class={ "WARLOCK" }, faction="Horde",
					spell={ "Master Channeler" }, guide={ st.warlock.channeling },
					tip= "In the same cave as Grimson the Pale so\nit'll be busy with rune engravers. This\n"
						.."helps with clearing the cave of trash" },
	[59307210] = { npc=212809, name="Wailing Spirit", class={ "PRIEST" },
					spell={ "Twisted Faith" }, guide={ st.priest.twisted ..st.priest.twistedSil } },
	[59407040] = { name="Ravenclaw Mobs (Various)", class={ "WARLOCK" },
					spell={ "Shadow Bolt Volley" }, guide={ st.warlock.shadowbolts } },
	[60607260] = { name="Ravenclaw Mobs (Various)", class={ "WARLOCK" },
					spell={ "Shadow Bolt Volley" }, guide={ st.warlock.shadowbolts } },
	[63506310] = { object=409501, name="Dalaran Digest", class={ "MAGE" },
					spell={ "Icy Veins" }, guide={ st.mage.books }, alsoTestQuest=true,
					quest={ 78127 }, questName={ "The Dalaran Digest" },
					tip="On a bookshelf in the main Amber Mill building" },
	[64402300] = { name="Rot Hide mobs (Various)", class={ "MAGE" }, faction="Horde",
					spell={ "Living Bomb" }, guide={ st.mage.livingBomb }, tip="Look for \"A Talking Head\"",
					quest={ { 460, 461, 491, 78277 } },
					questName={ { "Resting in Pieces", "The Hidden Niche", "Wand to Bethor", "A Token of Gratitude" } } },
	[65302480] = { name="Rot Hide mobs (Various)", class={ "MAGE" }, faction="Horde",
					spell={ "Living Bomb" }, guide={ st.mage.livingBomb }, tip="Look for \"A Talking Head\"",
					quest={ { 460, 461, 491, 78277 } }, tip="Location of \"The Hidden Niche\"",
					questName={ { "Resting in Pieces", "The Hidden Niche", "Wand to Bethor", "A Token of Gratitude" } } },
	[65602420] = { npc=1947, name="Thule Ravenclaw", class={ "PRIEST" }, faction="Alliance", 
					spell={ "Shadow Word: Death" }, guide={ "On the desk nearby. No kill needed" } },
	[65603140] = { name="Rot Hide mobs (Various)", class={ "MAGE" }, faction="Horde",
					spell={ "Living Bomb" }, guide={ st.mage.livingBomb }, tip="Look for \"A Talking Head\"",
					quest={ { 460, 461, 491, 78277 } },
					questName={ { "Resting in Pieces", "The Hidden Niche", "Wand to Bethor", "A Token of Gratitude" } } },
	[65802700] = { name="Rot Hide mobs (Various)", class={ "MAGE" }, faction="Horde",
					spell={ "Living Bomb" }, guide={ st.mage.livingBomb }, tip="Look for \"A Talking Head\"",
					quest={ { 460, 461, 491, 78277 } },
					questName={ { "Resting in Pieces", "The Hidden Niche", "Wand to Bethor", "A Token of Gratitude" } } },
	[67003660] = { name="Rot Hide mobs (Various)", class={ "MAGE" }, faction="Horde",
					spell={ "Living Bomb" }, guide={ st.mage.livingBomb }, tip="Look for \"A Talking Head\"",
					quest={ { 460, 461, 491, 78277 } },
					questName={ { "Resting in Pieces", "The Hidden Niche", "Wand to Bethor", "A Token of Gratitude" } } },
	[67802480] = { object=1599, name="Shallow Grave", class={ "MAGE" }, faction="Horde",
					spell={ "Living Bomb" }, guide={ st.mage.livingBomb }, tip="Look for \"A Talking Head\"",
					quest={ { 460, 461, 491, 78277 } }, tip="Turn in \"Resting in Pieces\" here",
					questName={ { "Resting in Pieces", "The Hidden Niche", "Wand to Bethor", "A Token of Gratitude" } } },
	[68003160] = { name="Rot Hide mobs (Various)", class={ "MAGE" }, faction="Horde",
					spell={ "Living Bomb" }, guide={ st.mage.livingBomb }, tip="Look for \"A Talking Head\"",
					quest={ { 460, 461, 491, 78277 } },
					questName={ { "Resting in Pieces", "The Hidden Niche", "Wand to Bethor", "A Token of Gratitude" } } },
	[69803480] = { name="Rot Hide mobs (Various)", class={ "MAGE" }, faction="Horde",
					spell={ "Living Bomb" }, guide={ st.mage.livingBomb }, tip="Look for \"A Talking Head\"",
					quest={ { 460, 461, 491, 78277 } },
					questName={ { "Resting in Pieces", "The Hidden Niche", "Wand to Bethor", "A Token of Gratitude" } } },
}
points[ 1453 ] = { -- Stormwind City
	[21216279] = { npc=203478, name="Stuart", class={ "PALADIN", "WARRIOR" }, faction="Alliance",
					spell={ "Rebuke", "Frenzied Assault" },
					guide={ st.livAndStuart, st.warrior.frenziedAssault .."\n\n" ..st.livAndStuart } },
	[22616463] = { npc=203475, name="Liv Bradford", class={ "PALADIN", "WARRIOR" }, faction="Alliance",
					spell={ "Rebuke", "Frenzied Assault" },
					guide={ st.livAndStuart, st.warrior.frenziedAssault .."\n\n" ..st.livAndStuart } },
	[25267860] = { npc=6122, name="Gakin the Darkbinder", class={ "WARLOCK" }, faction="Alliance",
					spell={ "Soul Siphon" }, guide={ st.warlock.soulSiphon }, tip="He's" ..st.secretCoven },
	[25127738] = { npc=204070, name="Soboz", class={ "WARLOCK" }, faction="Alliance",
					spell={ "Demonic Grace" }, guide={ st.warlock.grace ..st.warlock.graceEF },
					tip="He's" ..st.secretCoven ..".\n\nTake the ramp next to Gakin and descend\n"
						.."into the crypts. Take the first right turn and\ngo down. Now the first left turn down. Voilà!\n\n"
						.."Stand on the magenta rune and summon!" },
	[26127723] = { npc=5495, name="Ursula Deline", class={ "PALADIN" }, faction="Alliance",
					spell={ "Divine Storm" }, quest={ { 78088, 78089, 78090, 78091, 78092, 78093 } }, tip="She's" ..st.secretCoven,
					questName={ { "A Strange Artifact", "Advice from Stormwind", "A Second Opinion", "Earning Your Salt", 
						"It Must Be Destroyed", "Return to Delgren" } }, guide={ st.paladin.divineStorm } },
	[36327847] = { npc=211033, name="Garion Wendell", class={ "MAGE" }, faction="Alliance",
					spell={ "Icy Veins" }, tip="Collect any 10 books", guide={ st.mage.books },
					quest={ st.mage.booksQuestIDsA }, questName={ st.mage.booksQuestNamesA }, },
	[37223185] = { npc=5492, name="Katherine the Pure", class={ "PALADIN", "PALADIN" }, faction="Alliance",
					spell={ "Divine Storm", "Sheath of Light" }, tip="First room on the left",
					quest={ { 78088, 78089, 78090, 78091, 78092, 78093 }, { 79939, 79940, 79945, 79970 } },					
					questName={ { "A Strange Artifact", "Advice from Stormwind", "A Second Opinion", "Earning Your Salt", 
						"It Must Be Destroyed", "Return to Delgren" }, { "The Broken Hammer", "A Lost Brother",
						"Orders from the Grand Crusader", "Aeonas the Vindicated" } },
						guide={ st.paladin.divineStorm, st.paladin.sheathLight } },
	[37603160] = { name="Aeonas the Vindicated / Katherine the Pure", class={ "PALADIN" }, faction="Alliance",
					quest={ { 81764, 81766 } }, questName={ { "The Mysterious Merchant", "The Bloody Missive" } }, 
					spell={ "Fanaticism" }, guide={ st.paladin.fanaticism },  preRune={ { "Sheath of Light" } }, },
	[37827997] = { npc=211033, name="Garion Wendell", class={ "MAGE" }, faction="Alliance",
					spell={ "Spell Power" }, tip="Collect any 20 books", guide={ st.mage.books },
					quest={ st.mage.booksQuestIDsA }, questName={ st.mage.booksQuestNamesA }, },
	[39328147] = { npc=211033, name="Garion Wendell", class={ "MAGE" }, faction="Alliance",
					spell={ "Deep Freeze" }, tip="Collect any 25 books", guide={ st.mage.books },
					quest={ st.mage.booksQuestIDsA }, questName={ st.mage.booksQuestNamesA, }, },					
	[36328147] = { npc=211033, name="Garion Wendell", class={ "MAGE" }, faction="Alliance",
					spell={ "Temporal Anomaly" }, guide={ st.mage.temporal },
					quest={ 82084 }, questName={ "A Lesson in Literacy" }, },					
	[38102809] = { npc=205278, name="Brother Romulus", class={ "PALADIN" }, faction="Alliance",
					spell={ "Seal of Martyrdom" }, guide={ st.paladin.martyrdom } },
	[54536118] = { npc=213077, name="Elaine Compton", faction="Alliance",
					tip="Standing near the street corner, easily missed",
					class=st.allClass, spell=st.allSpellACA, guide={ st.supplyFaction } },
	[56692985] = { name="Cutthroat Alley", class={ "ROGUE" }, faction="Alliance", guide={ st.rogue.precision },
					spell={ "Slaughter from the Shadows" }, tip="Begin by entering this empty shop" },
	[61732920] = { object=386777, name="Dusty Chest", class={ "ROGUE" }, faction="Alliance", guide={ st.rogue.precision },
					spell={ "Slaughter from the Shadows" }, tip="Upper level of the house in\nCutthroat Alley, Stormwind" },
	[69695102] = { npc=203226, name="Viktoria Woods", class={ "WARRIOR" }, faction="Alliance",
					spell={ "Devastate" }, guide={ st.warrior.devastate ..st.warrior.devastateVik }, }
}
points[ 1434 ] = { -- Stranglethorn Vale
	[23800860] = { npc=1061,name="Gan'zulah", class={ "PRIEST" }, spell={ "Dispersion" }, guide={ st.priest.dispersion } },
	[27007720] = { npc=215643, name="Tokal", class={ "DRUID", "HUNTER", "MAGE", "PALADIN", "PRIEST", "ROGUE",
					"SHAMAN", "WARLOCK", "WARRIOR" }, spell={ "Eclipse", "Trap Launcher", "Brain Freeze", "The Art of War",
					"Mind Spike", "Poisoned Knife", "Ancestral Awakening", "Shadow and Flame", "Enraged Regeneration" },
					guide={ st.pillaged }, quest={ { 79229, 79235, 79236, 79242 } }, 
					questName={ { "Highway Robbery", "On the Lam", "Cherry for Your Thoughts", "No Honor Among Thieves" } } },
	[27607660] = { npc=218229,name="CaptainAransas", class={ "ROGUE" }, spell={ "Master of Subtlety" }, guide={ st.rogue.subtlety } },
	[28906200] = { item=737,name="Holy Water", class={ "PRIEST" }, spell={ "Dispersion" }, guide={ st.priest.dispersion } },
	[30804700] = { npc=217620, name="Reckless Warlock", class={ "WARLOCK" }, spell={ "Dance of the Wicked" }, guide={ st.warlock.dance },
					tip="Western side of the Gurubashi Arena" },
	[31801570] = { npc=217783, name="Bloodscalp Guerrilla", class={ "HUNTER" },
					spell={ "Dual Wield Specialization" }, guide={ st.hunter.dualWield } },
	[33001380] = { name="Bloodscalp trolls (Various)", class={ "PRIEST" }, spell={ "Dispersion" }, guide={ st.priest.dispersion } },
	[33008800] = { item=223333, name="Baleful Eye", class={ "PRIEST" }, spell={ "Eye of the Void" },
					quest={ { 82316 } }, questName={ { "Seven Eyes I Seek..." } }, guide={ st.priest.eyeOfVoid },
					tip="Directly behind Captain Stillwater" },
	[35601080] = { npc=715, name="Hemet Nesingwary", class={ "HUNTER", "PRIEST" }, spell={ "Expose Weaknesss", "Dispersion" },
					guide={ st.hunter.expose, st.priest.dispersion }, quest={ { 78823, 78830 }, {} },
					questName={ { "Terror of the Desert Skies", "Terror of the Desert Skies" }, {} } },
	[36001800] = { name="Murkgill Mobs (Various)", class=st.allClass, spell=st.allSpellG,
					guide={ st.grizzby }, quest={ 78265 }, questName={ "Fish Oil" } },
	[34602180] = { name="Murkgill Mobs (Various)", class=st.allClass, spell=st.allSpellG,
					guide={ st.grizzby }, quest={ 78265 }, questName={ "Fish Oil" } },
	[37002460] = { name="Murkgill Mobs (Various)", class=st.allClass, spell=st.allSpellG,
					guide={ st.grizzby }, quest={ 78265 }, questName={ "Fish Oil" } },
	[40705850] = { npc=223591, name="Echo of a Lost Soul", class={ "PRIEST" }, spell={ "Surge of Light" },
					tip="Outside these hours the Lost Soul might be seen on\nthe beach at the end of the Blood Moon PvP event. YMMV",
					guide={ st.priest.surgeLight } },
	[41505090] = { object=421526, name="Research Notes", class={ "MAGE" },
					spell={ "Spell Power" }, guide={ st.mage.books }, alsoTestQuest=true,
					tip="On a bench to the right of the cave entrance",
					quest={ { 79535 } }, questName={ { "Basilisks: Should Petrification be Feared?" } } },
	[42203620] = { npc=780, name="Skullsplitter Mystic", class={ "MAGE", "MAGE" }, spell={ "Frostfire Bolt", "Spellfrost Bolt" },
					guide={ st.mage.fireAndFrost } },
	[44200800] = { npc=218230,name="Wendel Mathers", class={ "ROGUE" }, spell={ "Master of Subtlety" }, guide={ st.rogue.subtlety } },
	[45001900] = { npc=217588, name="Arbor Tarantula", class={ "DRUID", "HUNTER" },
					spell={ "Survival Instincts", "Invigoration" }, guide={ st.amaryllis } },
	[47003080] = { npc=780, name="Skullsplitter Mystic", class={ "MAGE", "MAGE" }, spell={ "Frostfire Bolt", "Spellfrost Bolt" },
					guide={ st.mage.fireAndFrost } },
	[48003960] = { npc=780, name="Skullsplitter Mystic", class={ "MAGE", "MAGE" }, spell={ "Frostfire Bolt", "Spellfrost Bolt" },
					guide={ st.mage.fireAndFrost } },
	[49600770] = { name="Kurzen mobs (Various)", class={ "ROGUE" }, spell={ "Master of Subtlety" }, guide={ st.rogue.subtlety } },
}
points[ 1435 ] = { -- Swamp of Sorrows
	[16805380] = { object=424265, name="Grave", class={ "PRIEST" }, tip="Swamp Echo",
					spell={ "Pain Suppression" }, guide={ st.priest.painSuppression } },
	[25105400] = { npc=217412, name="Amaryllis Webb", class={ "DRUID", "HUNTER" },
					spell={ "Survival Instincts", "Invigoration" }, guide={ st.amaryllis } },
	[42603070] = { object=428228, name="Conspicuous Cache", class={ "ROGUE" },
					spell={ "Shuriken Toss" }, guide={ st.rogue.shurikenToss } },
	[50106200] = { npc=223591, name="Echo of a Lost Soul", class={ "PRIEST" }, spell={ "Surge of Light" },
					guide={ st.priest.surgeLight } },
	[56307620] = { item=220345, name="Sanguine Sorcery", class={ "MAGE" },
					spell={ "Deep Freeze" }, guide={ st.mage.books }, alsoTestQuest=true,
					quest={ { 81947 } }, questName={ { "Sanguine Sorcery" } } },
	[58406220] = { npc=769, name="Deathstrike Tarantula", class={ "WARRIOR" }, spell={ "Blood Surge" }, guide={ st.warrior.bloodSurge },
					tip="Loot the Viscous Venom",
					quest={ { 79624, 79677, 79678 } }, questName={ { "Anyone Can Cook", "A Quick Grocery Run", "Taste Testing" } } },
	[61602240] = { object=423901, name="Book", class={ "MAGE" },
					spell={ "Spell Power" }, guide={ st.mage.books }, alsoTestQuest=true,
					tip="Farm nearby Lost Ones for a Rusted\nCage Key to open the Rusted Cage",
					quest={ { 79953 } }, questName={ { "A Ludite's Guide to Caring for Your Demonic Pet" } } },
	[62308350] = { name="Marsh Mobs (Various Murlocs)", class=st.allClass, spell=st.allSpellG,
					guide={ st.grizzby }, quest={ 78265 }, questName={ "Fish Oil" } },
	[63809160] = { name="Marsh Mobs (Various Murlocs)", class=st.allClass, spell=st.allSpellG,
					guide={ st.grizzby }, quest={ 78265 }, questName={ "Fish Oil" } },
	[67007440] = { name="Marsh Mobs (Various Murlocs)", class=st.allClass, spell=st.allSpellG,
					guide={ st.grizzby }, quest={ 78265 }, questName={ "Fish Oil" } },
	[69402880] = { npc=218931, name="Dark Rider", name="Dark Rider", tip="Search this area",
					class={ "DRUID", "HUNTER", "MAGE", "PALADIN", "PRIEST", "ROGUE",
					"SHAMAN", "WARLOCK", "WARRIOR" }, spell={ "King of the Jungle", "Melee Specialist", "Missile Barrage",
					"Infusion of Light", "Spirit of the Redeemer", "Waylay", "Two-Handed Mastery", "Demonic Knowledge",
					"Precise Timing" }, guide={ st.dalaranAgent }, quest={ st.dalaranQuest }, questName={ st.dalaranQuestName } },
	[82609460] = { name="Marsh Mobs (Various Murlocs)", class=st.allClass, spell=st.allSpellG,
					guide={ st.grizzby }, quest={ 78265 }, questName={ "Fish Oil" } },
	[83208620] = { name="Marsh Mobs (Various Murlocs)", class=st.allClass, spell=st.allSpellG,
					guide={ st.grizzby }, quest={ 78265 }, questName={ "Fish Oil" } },
	[86407840] = { name="Marsh Mobs (Various Murlocs)", class=st.allClass, spell=st.allSpellG,
					guide={ st.grizzby }, quest={ 78265 }, questName={ "Fish Oil" } },
	[91007080] = { name="Marsh Mobs (Various Murlocs)", class=st.allClass, spell=st.allSpellG,
					guide={ st.grizzby }, quest={ 78265 }, questName={ "Fish Oil" } },
	[93206100] = { name="Marsh Mobs (Various Murlocs)", class=st.allClass, spell=st.allSpellG,
					guide={ st.grizzby }, quest={ 78265 }, questName={ "Fish Oil" } },
	[95805220] = { name="Marsh Mobs (Various Murlocs)", class=st.allClass, spell=st.allSpellG,
					guide={ st.grizzby }, quest={ 78265 }, questName={ "Fish Oil" } },
}
points[ 1425 ] = { -- The Hinterlands
	[24605780] = { name="Witherbark Mobs (Various)", class={ "WARRIOR" }, spell={ "Wrecking Crew" },
					guide={ "Far west The Hinterlands is where you'll be\nfarming any Witherbark troll mobs for a Geode\n"
						.."Hammer.\n\nEquip and continue pwning the mobs. The Hammer\nwill break. Right click for phat profit!\n\n"
						.."Don't go east to Shadra'Alor as the Sadists\nthere are much tougher. Stay south of Aerie Peak" } },
	[28606120] = { name="Owlbeast Mobs (Various)", class={ "MAGE" }, spell={ "Temporal Anomaly" },
					guide={ st.mage.temporal }, quest={ 82082 }, questName={ "A Lesson in Literacy" } },
	[33004400] = { npc=221828, name="Vengeful Spirit", class={ "PALADIN" }, spell={ "Wrath" },
					guide={ st.paladin.wrath }, tip="Use Sense Undead to see.\nRespawn is about 10 minutes" },
	[36007270] = { object=441252, name="Book", class={ "MAGE" },
					spell={ "Deep Freeze" }, guide={ st.mage.books }, alsoTestQuest=true, tip="Behind a wall",
					quest={ { 81954 } }, questName={ { "Venomous Journeys" } } },
	[44006360] = { name="Owlbeast Mobs (Various)", class={ "MAGE" }, spell={ "Temporal Anomaly" },
					guide={ st.mage.temporal }, quest={ 82082 }, questName={ "A Lesson in Literacy" } },
	[47404740] = { name="Owlbeast Mobs (Various)", class={ "MAGE" }, spell={ "Temporal Anomaly" },
					guide={ st.mage.temporal }, quest={ 82082 }, questName={ "A Lesson in Literacy" } },
	[48005900] = { item=221320, name="Hinterlands Leycryst", class={ "MAGE", "PALADIN", "PRIEST", "WARLOCK" },
					spell={ "Displacement", "Purifying Power", "Despair", "Backdraft" }, guide={ st.leylineGuide },
					tip="North of the Altar of Zul" },
	[51004690] = { npc=222232, name="Corrupt Moderate Manifestation of Air", class={ "SHAMAN" }, spell={ "Overcharged" },
					guide={ st.shaman.overcharged },
					quest={ { 82073, 82076, 82071, 82074, 82072, 82075, 81960, 81968 } },
					questName={ { "Cleansing Water", "Answering Water's Call", "Purifying Fire", "Answering Fire's Call",
						"Purging Earth", "Answering Earth's Call", "Clarifying Air", "Answering Air's Call" } } },
	[50005080] = { name="Green Sludge, Jade Ooze", class={ "SHAMAN" }, spell={ "Overcharged" }, guide={ st.shaman.overcharged },
					quest={ { 82073, 82076, 82071, 82074, 82072, 82075, 81960, 81968 } },
					questName={ { "Cleansing Water", "Answering Water's Call", "Purifying Fire", "Answering Fire's Call",
						"Purging Earth", "Answering Earth's Call", "Clarifying Air", "Answering Air's Call" } } },
	[58407270] = { item=223334, name="Glowing Eye", class={ "PRIEST" }, spell={ "Eye of the Void" },
					quest={ { 82316 } }, questName={ { "Seven Eyes I Seek..." } }, guide={ st.priest.eyeOfVoid } },
	[61403450] = { name="Quartermaster Alandra / Field Captain Korlian", class=st.allClass, spell=st.emeraldSpell,
					guide={ st.nightmareIncursions } },
	[64006680] = { name="Vilebranch Trolls (Various)", class=st.allClass, spell=st.wildGodsSpells, guide={ st.wildGods },
					quest={ { 82043, 82044 } }, questName={ { "The Wild Gods (Part 1)", "The Wild Gods (Part 2)" } } },
	[61405140] = { name="Owlbeast Mobs (Various)", class={ "MAGE" }, spell={ "Temporal Anomaly" },
					guide={ st.mage.temporal }, quest={ 82082 }, questName={ "A Lesson in Literacy" } },
	[66005300] = { npc=221933, name="Moonkin Avatar", class={ "DRUID" }, spell={ "Efflorescence" },
					guide={ st.druid.efflorescence }, quest={ 81924 }, questName={ "Wisdom of the Guardians" } },
	[72506870] = { npc=223591, name="Echo of a Lost Soul", class={ "PRIEST" }, spell={ "Surge of Light" },
					guide={ st.priest.surgeLight } },
	[72605280] = { npc=222695, name="Vilebranch Mask", class={ "ROGUE" },
					spell={ "Focused Attacks" }, guide={ "Use Blind (L34). Loot the chest\nThere are stealthed wolves in the area" } },
}
points[ 1420 ] = { -- Tirisfal Glades
	[24705945] = { object=406736, name="Lost Stash", class={ "WARLOCK", "WARRIOR" }, faction="Horde",
					spell={ "Haunt", "Victory Rush" }, guide={ st.starterZoneClass } },
	[25604860] = { npc=208196, name="Gillgar", class={ "MAGE", "PRIEST", "WARRIOR" }, faction="Horde",
					spell={ "Fingers of Frost", "Void Plague", "Furious Thunder" },
					guide={ st.mage.fingers, st.priest.voidPlague, st.warrior.furiousThunder } },
	[27204640] = { npc=208196, name="Gillgar", class={ "MAGE", "PRIEST", "WARRIOR" }, faction="Horde",
					spell={ "Fingers of Frost", "Void Plague", "Furious Thunder" },
					guide={ st.mage.fingers, st.priest.voidPlague, st.warrior.furiousThunder } },
	[29404520] = {  name="Vile Fin mobs (Various)", class={ "ROGUE", "ROGUE", "WARRIOR" }, faction="Horde",
					spell={ "Quick Draw", "Between the Eyes", "Devastate" },
					guide={ st.rogue.quickDraw ..st.rogue.quickDrawTG, st.rogue.precision, 
						st.warrior.devastate ..st.warrior.devastateDor },
					tip={ "Bottom-Right Map Piece (Drop or Pickpocketing).\nShipwreck Cache Key (mostly) Pickpocketing",
							"Key for the Cache", "Severed Murloc Head" } },
	[29804600] = { npc=208196, name="Gillgar", class={ "MAGE", "PRIEST", "WARRIOR" }, faction="Horde",
					spell={ "Fingers of Frost", "Void Plague", "Furious Thunder" },
					guide={ st.mage.fingers, st.priest.voidPlague, st.warrior.furiousThunder } },
	[30405080] = { npc=1535, name="Scarlet Warrior", class={ "MAGE" },
					spell={ "Living Flame" }, guide={ st.mage.livingFlame } },
	[30806600] = { npc=2124, name="Isabella", class={ "MAGE" }, questName={ "Spell Research" },
					quest={ 77671 }, faction="Horde", spell={ "Ice Lance" }, guide={ st.starterZoneClass } },
	[30806620] = { npc=3156, name="Maximillion", class={ "WARLOCK" }, faction="Horde",
					spell={ "Haunt" }, guide={ st.starterZoneClass }, quest={ 77672 }, questName={ "The Lost Rune" } },
	[31004620] = { npc=1535, name="Scarlet Warrior", class={ "MAGE" },
					spell={ "Living Flame" }, guide={ st.mage.livingFlame } },
	[31006600] = { npc=2123, name="Dark Cleric Duesten", class={ "PRIEST" }, faction="Horde",
					tip="After picking up the quest, go to the Graveyard\njust next door and /kneel. Check your bag. Done",
					spell={ "Penance" }, guide={ st.starterZoneClass ..st.priest.penanceTG }, 
					quest={ 77670 }, questName={ "Meditation on Undeath" } },
	[32604860] = { npc=1535, name="Scarlet Warrior", faction="Horde", class={ "ROGUE" }, tip="Pick Pocket or kill. Top-Right Map Piece",
					spell={ "Quick Draw" }, guide={ st.rogue.quickDraw ..st.rogue.quickDrawTG } },
	[32606560] = { npc=2122, name="David Trias", class={ "ROGUE" }, faction="Horde",
					spell={ "Shadowstrike" }, guide={ st.starterZoneClass }, quest={ 77669 }, questName={ "The Scarlet Rune" } },
	[33205160] = { npc=1535, name="Scarlet Warrior", class={ "MAGE" },
					spell={ "Living Flame" }, guide={ st.mage.livingFlame } },
	[33604980] = { npc=208712, name="Odd Melon", class={ "MAGE" }, faction="Horde",
					spell={ "Enlightenment" }, guide={ st.mage.enlightenment } },
	[34604900] = { npc=1535, name="Scarlet Warrior", class={ "MAGE" },
					spell={ "Living Flame" }, guide={ st.mage.livingFlame } },
	[34804480] = {  name="Vile Fin mobs (Various)", class={ "ROGUE", "ROGUE", "WARRIOR" }, faction="Horde",
					spell={ "Quick Draw", "Between the Eyes", "Devastate" },
					guide={ st.rogue.quickDraw ..st.rogue.quickDrawTG, st.rogue.precision, 
						st.warrior.devastate ..st.warrior.devastateDor }, 
					tip={ "Bottom-Right Map Piece (Drop or Pickpocketing).\nShipwreck Cache Key (mostly) Pickpocketing",
							nil, "Severed Murloc Head" } },
	[35604750] = { npc=208712, name="Odd Melon", class={ "MAGE" }, faction="Horde",
					spell={ "Enlightenment" }, guide={ st.mage.enlightenment } },
	[36406840] = { npc=1507, name="Scarlet Initiate", class={ "MAGE" }, faction="Horde",
					spell={ "Ice Lance" }, questName={ "Spell Research" }, quest={ 77671 }, guide={ st.starterZoneClass } },
	[36803980] = {  name="Vile Fin mobs (Various)", class={ "ROGUE", "ROGUE", "WARRIOR" }, faction="Horde",
					spell={ "Quick Draw", "Between the Eyes", "Devastate" },
					guide={ st.rogue.quickDraw ..st.rogue.quickDrawTG, st.rogue.precision, 
						st.warrior.devastate ..st.warrior.devastateDor }, 
					tip={ "Bottom-Right Map Piece (Drop or Pickpocketing).\nShipwreck Cache Key (mostly) Pickpocketing",
							"Key for the Cache", "Severed Murloc Head" } },
	[36805100] = { npc=208712, name="Odd Melon", class={ "MAGE" }, faction="Horde",
					spell={ "Enlightenment" }, guide={ st.mage.enlightenment } },
	[36806660] = { npc=1506, name="Scarlet Convert", class={ "ROGUE" }, faction="Horde",
					tip="Pickpocket. Don't kill. Quest says to \"steal\"",
					spell={ "Shadowstrike" }, guide={ st.starterZoneClass }, quest={ 77669 }, questName={ "The Scarlet Rune" } },
	[37404920] = { name="Tirisfal Farmers (Various)", faction="Horde", class={ "PRIEST", "ROGUE" },
					tip={ nil, "Pick Pocket or kill. Top-Left Map Piece" }, spell={ "Shared Pain", "Quick Draw" },
					guide={ st.priest.sharedPain, st.rogue.quickDraw ..st.rogue.quickDrawTG } },
	[37607160] = { npc=1507, name="Scarlet Initiate", class={ "MAGE" }, faction="Horde",
					spell={ "Ice Lance" }, questName={ "Spell Research" }, quest={ 77671 },
					guide={ st.starterZoneClass } },
	[37806980] = { npc=1506, name="Scarlet Convert", class={ "ROGUE" }, faction="Horde",
					tip="Pickpocket. Don't kill", quest={ 77669 }, questName={ "The Scarlet Rune" },
					spell={ "Shadowstrike" }, guide={ st.starterZoneClass } },
	[38606700] = { npc=1507, name="Scarlet Initiate", class={ "MAGE" }, faction="Horde",
					spell={ "Ice Lance" }, questName={ "Spell Research" }, quest={ 77671 },
					guide={ st.starterZoneClass } },
	[39204880] = { npc=1535, name="Scarlet Warrior", class={ "MAGE" },
					spell={ "Living Flame" }, guide={ st.mage.livingFlame } },
	[42603220] = { npc=1522, name="Darkeye Bonecaster", class={ "WARLOCK" }, faction="Horde",
					spell={ "Demonic Grace" }, guide={ st.warlock.grace ..st.warlock.graceTG }, tip="Ominous Tome" },
	[42004300] = { name="Darkhound (Various)", class={ "WARLOCK" }, faction="Horde",
					spell={ "Demonic Grace" }, guide={ st.warlock.grace ..st.warlock.graceTG }, tip="Hound Jawbone" },
	[43806520] = { npc=1536, name="Scarlet Missionary", class={ "MAGE" },
					spell={ "Living Flame" }, guide={ st.mage.livingFlame } },
	[44403760] = { npc=1522, name="Darkeye Bonecaster", class={ "WARLOCK" }, faction="Horde",
					spell={ "Demonic Grace" }, guide={ st.warlock.grace ..st.warlock.graceTG }, tip="Ominous Tome" },
	[44804560] = { name="Darkhound (Various)", class={ "WARLOCK" }, faction="Horde",
					spell={ "Demonic Grace" }, guide={ st.warlock.grace ..st.warlock.graceTG }, tip="Hound Jawbone" },
	[45404260] = { npc=1522, name="Darkeye Bonecaster", class={ "WARLOCK" }, faction="Horde",
					spell={ "Demonic Grace" }, guide={ st.warlock.grace ..st.warlock.graceTG }, tip="Ominous Tome" },
	[45605460] = { name="Darkhound (Various)", class={ "WARLOCK" }, faction="Horde",
					spell={ "Demonic Grace" }, guide={ st.warlock.grace ..st.warlock.graceTG }, tip="Hound Jawbone" },
	[46002920] = { npc=1522, name="Darkeye Bonecaster", class={ "WARLOCK" }, faction="Horde",
					spell={ "Demonic Grace" }, guide={ st.warlock.grace ..st.warlock.graceTG }, tip="Ominous Tome" },
	[47003240] = { npc=1522, name="Darkeye Bonecaster", class={ "WARLOCK" }, faction="Horde",
					spell={ "Demonic Grace" }, guide={ st.warlock.grace ..st.warlock.graceTG }, tip="Ominous Tome" },
	[48006540] = { npc=1536, name="Scarlet Missionary", class={ "MAGE", "PRIEST" },
					spell={ "Living Flame", "Homunculi" }, guide={ st.mage.livingFlame, st.priest.citadel } },
	[48203940] = { npc=1522, name="Darkeye Bonecaster", class={ "WARLOCK" }, faction="Horde",
					spell={ "Demonic Grace" }, guide={ st.warlock.grace ..st.warlock.graceTG }, tip="Ominous Tome" },
	[48604960] = { name="Darkhound (Various)", class={ "WARLOCK" }, faction="Horde",
					spell={ "Demonic Grace" }, guide={ st.warlock.grace ..st.warlock.graceTG }, tip="Hound Jawbone" },
	[49203180] = { npc=1522, name="Darkeye Bonecaster", class={ "WARLOCK" }, faction="Horde",
					spell={ "Demonic Grace" }, guide={ st.warlock.grace ..st.warlock.graceTG }, tip="Ominous Tome" },
	[49206700] = { npc=1537, name="Scarlet Zealot", class={ "MAGE" },
					spell={ "Living Flame" }, guide={ st.mage.livingFlame } },
	[50406960] = { npc=1536, name="Scarlet Missionary", class={ "MAGE" },
					spell={ "Living Flame" }, guide={ st.mage.livingFlame } },
	[50606740] = { name="Scarlet mobs (Various)", faction="Horde", class={ "PRIEST", "ROGUE" },
					tip={ "Warriors and Missionaries", "Pick Pocket or kill. Top-Right Map Piece" },
					spell={ "Homunculi", "Quick Draw" }, guide={ st.priest.citadel, st.rogue.quickDraw ..st.rogue.quickDrawTG } },
	[50806440] = { npc=1536, name="Scarlet Missionary", class={ "MAGE" },
					spell={ "Living Flame" }, guide={ st.mage.livingFlame } },
	[51206540] = { npc=1537, name="Scarlet Zealot", class={ "MAGE" },
					spell={ "Living Flame" }, guide={ st.mage.livingFlame } },
	[51405720] = { npc=208712, name="Odd Melon", class={ "MAGE" }, faction="Horde",
					spell={ "Enlightenment" }, guide={ st.mage.enlightenment } },
	[51407000] = { npc=1537, name="Scarlet Zealot", class={ "MAGE" },
					spell={ "Living Flame" }, guide={ st.mage.livingFlame } },
	[51806740] = { npc=1662, name="Captain Perrine", class={ "ROGUE" }, faction="Horde", spell={ "Mutilate" },
					tip="Pick Pocket Captain Perrine for his Signet Ring.\nThen go to the Brill Town Hall and make a forged \n"
						.."document. Hand it to Jamie Nore nearby", guide={ st.rogue.mutilate } },
	[52502580] = { object=404941, name="Relic Coffer", class={ "ROGUE" }, faction="Horde",
					spell={ "Slaughter from the Shadows" }, guide={ st.rogue.slaughter },
					tip="Obtain the key from any of the Rot Hide Gnolls\nand named Undead, Shambling Horror, etc" },
	[52905400] = { name="Rune of Quick Draw", faction="Horde", class={ "ROGUE" }, 
					tip="Final location West of Brill,\nunder the bridge west side",
					spell={ "Quick Draw" }, guide={ st.rogue.quickDraw ..st.rogue.quickDrawTG } },
	[53404380] = { name="Rot Hide (Various)", class={ "ROGUE", "ROGUE", "WARLOCK", "WARRIOR" }, faction="Horde",
					spell={ "Quick Draw", "Slaughter from the Shadows", "Demonic Grace", "Devastate" },
					guide={ st.rogue.quickDraw ..st.rogue.quickDrawTG, st.rogue.slaughter, 
						st.warlock.grace ..st.warlock.graceTG, st.warrior.devastate ..st.warrior.devastateDor },
					tip={ "Bottom-Left Map Piece\nAgamand Relic Coffer Key\n(Drop or Pickpocketing)",
							nil, "Gnoll Blood", "Severed Gnoll Head" } },
	[53606800] = { npc=1537, name="Scarlet Zealot", class={ "MAGE" },
					spell={ "Living Flame" }, guide={ st.mage.livingFlame } },
	[53606900] = { npc=1536, name="Scarlet Missionary", class={ "MAGE", "PRIEST" },
					spell={ "Living Flame", "Homunculi" }, guide={ st.mage.livingFlame, st.priest.citadel } },
	[53805980] = { npc=208712, name="Odd Melon", class={ "MAGE" }, faction="Horde",
					spell={ "Enlightenment" }, guide={ st.mage.enlightenment } },
	[54005540] = { npc=208712, name="Odd Melon", class={ "MAGE" }, faction="Horde",
					spell={ "Enlightenment" }, guide={ st.mage.enlightenment } },
	[55005240] = { name="Darkhound (Various)", class={ "WARLOCK" }, faction="Horde",
					spell={ "Demonic Grace" }, guide={ st.warlock.grace ..st.warlock.graceTG }, tip="Hound Jawbone" },
	[55804140] = { name="Rot Hide (Various)", class={ "ROGUE", "ROGUE", "WARLOCK", "WARRIOR" }, faction="Horde",
					spell={ "Quick Draw", "Slaughter from the Shadows", "Demonic Grace", "Devastate" },
					guide={ st.rogue.quickDraw ..st.rogue.quickDrawTG, st.rogue.slaughter, 
						st.warlock.grace ..st.warlock.graceTG, st.warrior.devastate ..st.warrior.devastateDor },
					tip={ "Bottom-Left Map Piece\nAgamand Relic Coffer Key\n(Drop or Pickpocketing)",
							nil, "Gnoll Blood", "Severed Gnoll Head" } },
	[56604660] = { name="Rot Hide (Various)", class={ "ROGUE", "ROGUE", "WARLOCK", "WARRIOR" }, faction="Horde",
					spell={ "Quick Draw", "Slaughter from the Shadows", "Demonic Grace", "Devastate" },
					guide={ st.rogue.quickDraw ..st.rogue.quickDrawTG, st.rogue.slaughter, 
						st.warlock.grace ..st.warlock.graceTG, st.warrior.devastate ..st.warrior.devastateDor },
					tip={ "Bottom-Left Map Piece\nAgamand Relic Coffer Key\n(Drop or Pickpocketing)",
							nil, "Gnoll Blood", "Severed Gnoll Head" } },
	[57003400] = { name="Rot Hide (Various)", class={ "ROGUE", "ROGUE", "WARLOCK", "WARRIOR" }, faction="Horde",
					spell={ "Quick Draw", "Slaughter from the Shadows", "Demonic Grace", "Devastate" },
					guide={ st.rogue.quickDraw ..st.rogue.quickDrawTG, st.rogue.slaughter, 
						st.warlock.grace ..st.warlock.graceTG, st.warrior.devastate ..st.warrior.devastateDor },
					tip={ "Bottom-Left Map Piece\nAgamand Relic Coffer Key\n(Drop or Pickpocketing)",
							nil, "Gnoll Blood", "Severed Gnoll Head" } },
	[57602820] = {  name="Vile Fin mobs (Various)", class={ "ROGUE", "ROGUE", "WARRIOR" }, faction="Horde",
					spell={ "Quick Draw", "Between the Eyes", "Devastate" },
					guide={ st.rogue.quickDraw ..st.rogue.quickDrawTG, st.rogue.precision, 
						st.warrior.devastate ..st.warrior.devastateDor }, 
					tip={ "Bottom-Right Map Piece (Drop or Pickpocketing).\nShipwreck Cache Key (mostly) Pickpocketing",
							"Key for the Cache", "Severed Murloc Head" } },
	[57803700] = { name="Rot Hide (Various)", class={ "ROGUE", "ROGUE", "WARLOCK", "WARRIOR" }, faction="Horde",
					spell={ "Quick Draw", "Slaughter from the Shadows", "Demonic Grace", "Devastate" },
					guide={ st.rogue.quickDraw ..st.rogue.quickDrawTG, st.rogue.slaughter, 
						st.warlock.grace ..st.warlock.graceTG, st.warrior.devastate ..st.warrior.devastateDor },
					tip={ "Bottom-Left Map Piece\nAgamand Relic Coffer Key\n(Drop or Pickpocketing)",
							nil, "Gnoll Blood", "Severed Gnoll Head" } },
	[58003600] = { npc=208712, name="Odd Melon", class={ "MAGE" }, faction="Horde",
					spell={ "Enlightenment" }, guide={ st.mage.enlightenment } },
	[58503050] = { npc=1753, name="Maggot Eye", class={ "WARLOCK" }, faction="Horde",
					spell={ "Soul Siphon" }, guide={ st.warlock.soulSiphon },
					tip="It's level 10. Two classes need it!\nInside the house in Garren's Haunt" },
	[59204440] = { name="Rot Hide (Various)", class={ "ROGUE", "ROGUE", "WARLOCK", "WARRIOR" }, faction="Horde",
					spell={ "Quick Draw", "Slaughter from the Shadows", "Demonic Grace", "Devastate" },
					guide={ st.rogue.quickDraw ..st.rogue.quickDrawTG, st.rogue.slaughter, 
						st.warlock.grace ..st.warlock.graceTG, st.warrior.devastate ..st.warrior.devastateDor },
					tip={ "Bottom-Left Map Piece\nAgamand Relic Coffer Key\n(Drop or Pickpocketing)",
							nil, "Gnoll Blood", "Severed Gnoll Head" } },
	[59505230] = { object=405879, name="Apothecary Society Primer", class={ "MAGE" }, faction="Horde",
					spell={ "Icy Veins" }, guide={ st.mage.books }, alsoTestQuest=true,
					quest={ 79095 }, questName={ "The Apothecary's Metaphysical Primer" },
					tip="On the shelf next to Apothecary Johaan" },
	[59803250] = { npc=208712, name="Odd Melon", class={ "MAGE" }, faction="Horde",
					spell={ "Enlightenment" }, guide={ st.mage.enlightenment } },
	[59903710] = { npc=208712, name="Odd Melon", class={ "MAGE" }, faction="Horde",
					spell={ "Enlightenment" }, guide={ st.mage.enlightenment } },
	[60403900] = { name="Rot Hide (Various)", class={ "ROGUE", "ROGUE", "WARLOCK", "WARRIOR" }, faction="Horde",
					spell={ "Quick Draw", "Slaughter from the Shadows", "Demonic Grace", "Devastate" },
					guide={ st.rogue.quickDraw ..st.rogue.quickDrawTG, st.rogue.slaughter, 
						st.warlock.grace ..st.warlock.graceTG, st.warrior.devastate ..st.warrior.devastateDor },
					tip={ "Bottom-Left Map Piece\nAgamand Relic Coffer Key\n(Drop or Pickpocketing)",
							nil, "Gnoll Blood", "Severed Gnoll Head" } },
	[60605060] = { npc=2310, name="Jamie Nore", class={ "ROGUE" }, faction="Horde", spell={ "Mutilate" },
					tip="Pick Pocket Captain Perrine for a Signet Ring.\nThen go to the Brill Town Hall and make a forged\n"
						.."document. Hand it to Jamie Nore nearby", guide={ st.rogue.mutilate } },
	[60803580] = { name="Rot Hide (Various)", class={ "ROGUE", "ROGUE", "WARLOCK", "WARRIOR" }, faction="Horde",
					spell={ "Quick Draw", "Slaughter from the Shadows", "Demonic Grace", "Devastate" },
					guide={ st.rogue.quickDraw ..st.rogue.quickDrawTG, st.rogue.slaughter, 
						st.warlock.grace ..st.warlock.graceTG, st.warrior.devastate ..st.warrior.devastateDor },
					tip={ "Bottom-Left Map Piece\nAgamand Relic Coffer Key\n(Drop or Pickpocketing)",
							nil, "Gnoll Blood", "Severed Gnoll Head" } },
	[61602800] = {  name="Vile Fin mobs (Various)", class={ "ROGUE", "ROGUE", "WARRIOR" }, faction="Horde",
					spell={ "Quick Draw", "Between the Eyes", "Devastate" },
					guide={ st.rogue.quickDraw ..st.rogue.quickDrawTG, st.rogue.precision, 
						st.warrior.devastate ..st.warrior.devastateDor }, 
					tip={ "Bottom-Right Map Piece (Drop or Pickpocketing).\nShipwreck Cache Key (mostly) Pickpocketing",
							"Key for the Cache", "Severed Murloc Head" } },
	[61605240] = { npc=2127, name="Rupert Boch", class={ "WARLOCK" }, faction="Horde",
					spell={ "Demonic Tactics" }, guide={ st.warlock.tactics } },
	[61805200] = { npc=208920, name="Penny Hawkins", class={ "WARRIOR" }, faction="Horde",
					spell={ "Frenzied Assault" }, guide={ st.warrior.frenziedAssault },
					tip="Speak to Penny Hawkins first, and then speak\nto Blueheart, who is in the basement" },
	[61805160] = { npc=208919, name="Blueheart", class={ "WARRIOR" }, faction="Horde",
					spell={ "Frenzied Assault" },
					guide={ st.warrior.frenziedAssault },
					tip= "He'll be in the Inn's basement. Speak to Penny\nfirst if you haven't already done so" },
	[60507350] = { npc=211033, name="Owen Thadd", class={ "MAGE" }, faction="Horde",
					spell={ "Icy Veins" }, tip="Collect any 10 books", guide={ st.mage.books },
					quest={ st.mage.booksQuestIDsH }, questName={ st.mage.booksQuestNamesH }, },
	[62007500] = { npc=211033, name="Owen Thadd", class={ "MAGE" }, faction="Horde",
					spell={ "Spell Power" }, tip="Collect any 20 books", guide={ st.mage.books },
					quest={ st.mage.booksQuestIDsH }, questName={ st.mage.booksQuestNamesH }, },
	[63507650] = { npc=211033, name="Owen Thadd", class={ "MAGE" }, faction="Horde",
					spell={ "Deep Freeze" }, tip="Collect any 25 books", guide={ st.mage.books },
					quest={ st.mage.booksQuestIDsH }, questName={ st.mage.booksQuestNamesH, }, },					
	[60507650] = { npc=211033, name="Owen Thadd", class={ "MAGE" }, faction="Horde",
					spell={ "Temporal Anomaly" }, guide={ st.mage.temporal },
					quest={ 82084 }, questName={ "A Lesson in Literacy" }, },					
	[63603080] = {  name="Vile Fin mobs (Various)", class={ "ROGUE", "ROGUE", "WARRIOR" }, faction="Horde",
					spell={ "Quick Draw", "Between the Eyes", "Devastate" },
					guide={ st.rogue.quickDraw ..st.rogue.quickDrawTG, st.rogue.precision, 
						st.warrior.devastate ..st.warrior.devastateDor }, 
					tip={ "Bottom-Right Map Piece (Drop or Pickpocketing).\nShipwreck Cache Key (mostly) Pickpocketing",
							"Key for the Cache", "Severed Murloc Head" } },
	[66204000] = { npc=202060, name="Frozen Murloc", class={ "MAGE", "WARLOCK" }, faction="Horde",
					tip="Needs about five separate Fire debuffs to defrost",
					spell={ "Burnout", "Chaos Bolt" }, guide={ st.frozen } },
	[66702460] = {  object=405201, name="Shipwreck Cache", class={ "ROGUE" }, faction="Horde",
					spell={ "Between the Eyes" }, guide={ st.rogue.precision }, 
					tip="Find the Shipwreck Cache Key from the Vile Fin Murlocs" },
	[69202500] = {  name="Vile Fin mobs (Various)", class={ "ROGUE", "ROGUE", "WARRIOR" }, faction="Horde",
					spell={ "Quick Draw", "Between the Eyes", "Devastate" },
					guide={ st.rogue.quickDraw ..st.rogue.quickDrawTG, st.rogue.precision, 
						st.warrior.devastate ..st.warrior.devastateDor }, 
					tip={ "Bottom-Right Map Piece (Drop or Pickpocketing).\nShipwreck Cache Key (mostly) Pickpocketing",
							"Key for the Cache", "Severed Murloc Head" } },
	[73802680] = {  name="Vile Fin mobs (Various)", class={ "ROGUE", "ROGUE", "WARRIOR" }, faction="Horde",
					spell={ "Quick Draw", "Between the Eyes", "Devastate" },
					guide={ st.rogue.quickDraw ..st.rogue.quickDrawTG, st.rogue.precision, 
						st.warrior.devastate ..st.warrior.devastateDor }, 
					tip={ "Bottom-Right Map Piece (Drop or Pickpocketing).\nShipwreck Cache Key (mostly) Pickpocketing",
							"Key for the Cache", "Severed Murloc Head" } },
	[74506160] = { npc=208712, name="Odd Melon", class={ "MAGE" }, faction="Horde",
					spell={ "Enlightenment" }, guide={ st.mage.enlightenment } },
	[75505840] = { npc=208712, name="Odd Melon", class={ "MAGE" }, faction="Horde",
					spell={ "Enlightenment" }, guide={ st.mage.enlightenment } },
	[76604480] = { npc=208927, name="Dead Acolyte", class={ "WARLOCK" }, faction="Horde",
					spell={ "Demonic Tactics" }, guide={ st.warlock.tactics } },
	[76806100] = { npc=208712, name="Odd Melon", class={ "MAGE" }, faction="Horde",
					spell={ "Enlightenment" }, guide={ st.mage.enlightenment } },
	[77005520] = { npc=1537, name="Scarlet Zealot", class={ "MAGE" },
					spell={ "Living Flame" }, guide={ st.mage.livingFlame } },
	[79003200] = { name="Scarlet mobs (Various)", faction="Horde", class={ "ROGUE" }, tip="Pick Pocket or kill. Top-Right Map Piece",
					spell={ "Quick Draw" }, guide={ st.rogue.quickDraw ..st.rogue.quickDrawTG } },
	[79805540] = { name="Scarlet mobs (Various)", faction="Horde", class={ "ROGUE" }, tip="Pick Pocket or kill. Top-Right Map Piece",
					spell={ "Quick Draw" }, guide={ st.rogue.quickDraw ..st.rogue.quickDrawTG } },
	[80005540] = { npc=1537, name="Scarlet Zealot", class={ "MAGE" },
					spell={ "Living Flame" }, guide={ st.mage.livingFlame } },
	[81203210] = { object=412147, name="Supply Locker", class={ "ROGUE" }, spell={ "Shadowstep" }, guide={ st.rogue.shadowstep },
					quest={ { 78699,78676 } }, questName={ { "The Eye of Bhossca (Dead Drop)", "The Eye of Bhossca (SM)" } } },
	[84002900] = { name="Skillbooks", tip="Scarlet Monastery", skillBook=true, guide={ st.dungeonDrops }, 
					class={ "DRUID", "DRUID", "DRUID", "HUNTER", "MAGE", "PALADIN", "PRIEST", "PRIEST", "ROGUE", "SHAMAN",
						"WARLOCK", "WARLOCK", "WARRIOR" },	
					spell={ "Deeper Wilds", "Enhanced Restoration", "Revive", "Aspect of the Viper", "Expanded Intellect",
							"Enhanced Blessings", "Increased Fortitude", "Shadowfiend", "Redirect", "Totemic Projection",
							"Portal Summoning", "Soul Harvesting", "Commanding Shout" }, },
}
points[ 1458 ] = { -- Undercity
	[24004160] = { npc=204070, name="Soboz", class={ "WARLOCK" }, faction="Horde",
					spell={ "Demonic Grace" }, guide={ st.warlock.grace ..st.warlock.graceTG },
					tip="Undercity Sewer" },
	[48007060] = { npc=208619, name="Dorac Graves", class={ "WARRIOR" }, faction="Horde",
					spell={ "Devastate" }, guide={ st.warrior.devastate ..st.warrior.devastateDor }, },
	[64603820] = { npc=214098, name="Gishah", faction="Horde",
					class=st.allClass, spell=st.allSpellACA, guide={ st.supplyFaction } },
	[72103150] = { npc=211033, name="Owen Thadd", class={ "MAGE" }, faction="Horde",
					spell={ "Icy Veins" }, tip="Collect any 10 books", guide={ st.mage.books },
					quest={ st.mage.booksQuestIDsH }, questName={ st.mage.booksQuestNamesH }, },
	[73603300] = { npc=211033, name="Owen Thadd", class={ "MAGE" }, faction="Horde",
					spell={ "Spell Power" }, tip="Collect any 20 books", guide={ st.mage.books },
					quest={ st.mage.booksQuestIDsH }, questName={ st.mage.booksQuestNamesH }, },
	[75103450] = { npc=211033, name="Owen Thadd", class={ "MAGE" }, faction="Horde",
					spell={ "Deep Freeze" }, tip="Collect any 25 books", guide={ st.mage.books },
					quest={ st.mage.booksQuestIDsH }, questName={ st.mage.booksQuestNamesH, }, },					
	[72103450] = { npc=211033, name="Owen Thadd", class={ "MAGE" }, faction="Horde",
					spell={ "Temporal Anomaly" }, guide={ st.mage.temporal },
					quest={ 82084 }, questName={ "A Lesson in Literacy" }, },					
	[83602620] = { npc=208682, name="Denton Bleakway", class={ "WARLOCK" }, faction="Horde",
					spell={ "Soul Siphon" }, guide={ st.warlock.soulSiphon } },
	[84601620] = { npc=1498, name="Bethor Iceshard", class={ "MAGE" }, faction="Horde",
					spell={ "Living Bomb" }, guide={ st.mage.livingBomb },
					quest={ { 460, 461, 491, 78277 } },
					questName={ { "Resting in Pieces", "The Hidden Niche", "Wand to Bethor", "A Token of Gratitude" } } },
	[84802660] = { npc=5675, name="Carendin Halgar", class={ "WARLOCK" }, faction="Horde",
					spell={ "Soul Siphon" }, guide={ st.warlock.soulSiphon } },
}
points[ 1422 ] = { -- Western Plaguelands
	[59408460] = { object=410847, name="Rusty Safe", class={ "ROGUE" }, tip={ "In the water. Jump down" },
					spell={ "Envenom" }, guide={ st.rogue.envenom } },
}
points[ 1436 ] = { -- Westfall
	[26006950] = { object=408799, name="Idol of the Deep", class={ "WARLOCK", "WARRIOR" }, faction="Alliance",
					spell={ "Shadow Bolt Volley", "Quick Strike" },
					guide={ st.warlock.shadowbolts, st.warrior.quickStrike },
					tip={ "Must use Soul of the Sea", "You must have killed a nearby\nmurloc with your Gillsbane" } },				
	[26206320] = { npc=391, name="Old Murk-Eye", class={ "WARLOCK", "WARRIOR" }, faction="Alliance",
					spell={ "Shadow Bolt Volley", "Endless Rage" },
					guide={ st.warlock.shadowbolts, st.starterZoneClass },
					tip={ "Must use Drain Soul", nil } },
	[27806200] = { name="Riverpaw Mobs (Various Gnolls)", class={ "DRUID" },
					spell={ "Savage Roar" }, guide={ st.druid.ferocious } },
	[27807470] = { npc=391, name="Old Murk-Eye", class={ "WARLOCK", "WARRIOR" }, faction="Alliance",
					spell={ "Shadow Bolt Volley", "Endless Rage" },
					guide={ st.warlock.shadowbolts, st.starterZoneClass },
					tip={ "Must use Drain Soul", nil } },
	[28206820] = { name="Riverpaw Mobs (Various Gnolls)", class={ "DRUID" },
					spell={ "Savage Roar" }, guide={ st.druid.ferocious } },
	[29204520] = { name="Riverpaw Mobs (Various Gnolls)", class={ "DRUID" },
					spell={ "Savage Roar" }, guide={ st.druid.ferocious } },
	[29405500] = { name="Riverpaw Mobs (Various Gnolls)", class={ "DRUID" },
					spell={ "Savage Roar" }, guide={ st.druid.ferocious } },
	[29505150] = { name="Defias Mobs (Various)", class={ "DRUID", "ROGUE", "WARRIOR" }, faction="Alliance",
					guide={ st.druid.lacerate, st.rogue.bladeDance, st.warrior.quickStrike },
					spell={ "Lacerate", "Blade Dance", "Quick Strike" },
					tip={ "Magic Pumpkin Seed", "Pp for Discrete Envelope\nand Equipment Stash Key", "Gillsbane" } },
	[29807920] = { npc=391, name="Old Murk-Eye", class={ "WARLOCK", "WARRIOR" }, faction="Alliance",
					spell={ "Shadow Bolt Volley", "Endless Rage" },
					guide={ st.warlock.shadowbolts, st.starterZoneClass },
					tip={ "Must use Drain Soul", nil } },
	[31404400] = { object=210537, name="Undying Laborer", class={ "PALADIN", "PRIEST" }, faction="Alliance",
					spell={ "Horn of Lordaeron", "Twisted Faith" },
					guide={ st.paladin.blessings, st.priest.twisted ..st.priest.twistedWest } },
	[31604460] = { name="Defias Mobs (Various)", class={ "DRUID", "ROGUE", "WARRIOR" }, faction="Alliance",
					guide={ st.druid.lacerate, st.rogue.bladeDance, st.warrior.quickStrike },
					spell={ "Lacerate", "Blade Dance", "Quick Strike" },
					tip={ "Magic Pumpkin Seed", "Pp for Discrete Envelope\nand Equipment Stash Key", "Gillsbane" } },
	[31604680] = { npc=832, name="Dust Devil", class={ "WARLOCK" },
					spell={ "Master Channeler" }, guide={ st.warlock.channeling } },
	[31607260] = { name="Riverpaw Mobs (Various Gnolls)", class={ "DRUID" },
					spell={ "Savage Roar" }, guide={ st.druid.ferocious } },
	[32003160] = { name="Riverpaw Mobs (Various Gnolls)", class={ "DRUID" },
					spell={ "Savage Roar" }, guide={ st.druid.ferocious } },
	[32408740] = { npc=391, name="Old Murk-Eye", class={ "WARLOCK", "WARRIOR" }, faction="Alliance",
					spell={ "Shadow Bolt Volley", "Endless Rage" },
					guide={ st.warlock.shadowbolts, st.starterZoneClass },
					tip={ "Must use Drain Soul", nil } },
	[32803420] = { name="Defias Mobs (Various)", class={ "DRUID", "ROGUE", "WARRIOR" }, faction="Alliance",
					guide={ st.druid.lacerate, st.rogue.bladeDance, st.warrior.quickStrike },
					spell={ "Lacerate", "Blade Dance", "Quick Strike" },
					tip={ "Magic Pumpkin Seed", "Pp for Discrete Envelope\nand Equipment Stash Key", "Gillsbane" } },
	[33207000] = { npc=832, name="Dust Devil", class={ "WARLOCK" },
					spell={ "Master Channeler" }, guide={ st.warlock.channeling } },
	[33805320] = { npc=832, name="Dust Devil", class={ "WARLOCK" },
					spell={ "Master Channeler" }, guide={ st.warlock.channeling } },
	[34008220] = { npc=391, name="Old Murk-Eye", class={ "WARLOCK", "WARRIOR" }, faction="Alliance",
					spell={ "Shadow Bolt Volley", "Endless Rage" },
					guide={ st.warlock.shadowbolts, st.starterZoneClass },
					tip={ "Must use Drain Soul", nil } },
	[34804840] = { name="Riverpaw Mobs (Various Gnolls)", class={ "DRUID" },
					spell={ "Savage Roar" }, guide={ st.druid.ferocious } },
	[35003240] = { npc=832, name="Dust Devil", class={ "WARLOCK" },
					spell={ "Master Channeler" }, guide={ st.warlock.channeling } },
	[35003940] = { npc=832, name="Dust Devil", class={ "WARLOCK" },
					spell={ "Master Channeler" }, guide={ st.warlock.channeling } },
	[35003960] = { npc=210533, name="Silverspur", class={ "HUNTER" },
					spell={ "Beast Mastery" }, guide={ st.hunter.beastMastery},
					tip= "You must farm Young Goretusk (to the north and east\nof here) or Goretusk (to the south and east of here).\n"
						.."They are far too numerous to mark with pins. You are\nwanting to loot Goretusk Haunch. Bring it to here to\n"
						.."spawn Silverspur.\n\n" },
	[35405100] = { name="Watchers & Golems", class={ "WARLOCK" },
					spell={ "Master Channeler" }, guide={ st.warlock.channeling } },
	[35505690] = { name="Riverpaw Mobs (Various Gnolls)", class={ "DRUID" },
					spell={ "Savage Roar" }, guide={ st.druid.ferocious } },
	[35605220] = { npc=210501, name="Harvest Reaper Prototype", class={ "WARLOCK" },
					spell={ "Master Channeler" }, guide={ st.warlock.channeling } },
	[35802700] = { name="Riverpaw Mobs (Various Gnolls)", class={ "DRUID" },
					spell={ "Savage Roar" }, guide={ st.druid.ferocious } },
	[36005370] = { name="Defias Mobs (Various)", class={ "DRUID", "ROGUE", "WARRIOR" }, faction="Alliance",
					guide={ st.druid.lacerate, st.rogue.bladeDance, st.warrior.quickStrike },
					spell={ "Lacerate", "Blade Dance", "Quick Strike" },
					tip={ "Magic Pumpkin Seed", "Pp for Discrete Envelope\nand Equipment Stash Key", "Gillsbane" } },
	[36008600] = { npc=391, name="Old Murk-Eye", class={ "WARLOCK", "WARRIOR" }, faction="Alliance",
					spell={ "Shadow Bolt Volley", "Endless Rage" },
					guide={ st.warlock.shadowbolts, st.starterZoneClass },
					tip={ "Must use Drain Soul", nil } },
	[36206440] = { name="Riverpaw Mobs (Various Gnolls)", class={ "DRUID" },
					spell={ "Savage Roar" }, guide={ st.druid.ferocious } },
	[36603760] = { name="Riverpaw Mobs (Various Gnolls)", class={ "DRUID" },
					spell={ "Savage Roar" }, guide={ st.druid.ferocious } },
	[36606660] = { npc=832, name="Dust Devil", class={ "WARLOCK" },
					spell={ "Master Channeler" }, guide={ st.warlock.channeling } },
	[37008260] = { npc=450, name="Defias Renegade Mage", class={ "DRUID", "WARRIOR" }, faction="Alliance",
					guide={ st.druid.lacerate, st.warrior.quickStrike },
					spell={ "Lacerate", "Quick Strike" }, tip={ "Magic Pumpkin Seed", "Gillsbane" } },
	[37205460] = { name="Watchers & Golems", class={ "WARLOCK" },
					spell={ "Master Channeler" }, guide={ st.warlock.channeling } },
	[37404740] = { name="Watchers & Golems", class={ "WARLOCK" },
					spell={ "Master Channeler" }, guide={ st.warlock.channeling } },
	[37602140] = { name="Riverpaw Mobs (Various Gnolls)", class={ "DRUID" },
					spell={ "Savage Roar" }, guide={ st.druid.ferocious } },
	[37602580] = { npc=832, name="Dust Devil", class={ "WARLOCK" },
					spell={ "Master Channeler" }, guide={ st.warlock.channeling } },
	[39605680] = { name="Watchers & Golems", class={ "WARLOCK" },
					spell={ "Master Channeler" }, guide={ st.warlock.channeling } },
	[40605420] = { name="Watchers & Golems", class={ "WARLOCK" },
					spell={ "Master Channeler" }, guide={ st.warlock.channeling } },
	[40808020] = { objext=408718, name="Equipment Stash", class={ "ROGUE" }, faction="Alliance",
					guide={ st.rogue.bladeDance }, spell={ "Blade Dance" },
					tip={ "Location of the Equipment Stash.\nMust have Pp the key" } },
	[41004060] = { npc=832, name="Dust Devil", class={ "WARLOCK" },
					spell={ "Master Channeler" }, guide={ st.warlock.channeling } },
	[41004980] = { name="Watchers & Golems", class={ "WARLOCK" },
					spell={ "Master Channeler" }, guide={ st.warlock.channeling } },
	[41202780] = { name="Riverpaw Mobs (Various Gnolls)", class={ "DRUID" },
					spell={ "Savage Roar" }, guide={ st.druid.ferocious } },
	[41603760] = { name="Riverpaw Mobs (Various Gnolls)", class={ "DRUID" },
					spell={ "Savage Roar" }, guide={ st.druid.ferocious } },
	[41604400] = { name="Defias Mobs (Various)", class={ "DRUID", "ROGUE", "WARRIOR" }, faction="Alliance",
					guide={ st.druid.lacerate, st.rogue.bladeDance, st.warrior.quickStrike },
					spell={ "Lacerate", "Blade Dance", "Quick Strike" },
					tip={ "Magic Pumpkin Seed", "Pp for Discrete Envelope\nand Equipment Stash Key", "Gillsbane" } },
	[41606160] = { npc=832, name="Dust Devil", class={ "WARLOCK" },
					spell={ "Master Channeler" }, guide={ st.warlock.channeling } },
	[42002360] = { npc=832, name="Dust Devil", class={ "WARLOCK" },
					spell={ "Master Channeler" }, guide={ st.warlock.channeling } },
	[42206940] = { name="Defias Mobs (Various)", class={ "DRUID", "ROGUE", "WARRIOR" }, faction="Alliance",
					guide={ st.druid.lacerate, st.rogue.bladeDance, st.warrior.quickStrike },
					spell={ "Lacerate", "Blade Dance", "Quick Strike" },
					tip={ "Magic Pumpkin Seed", "Pp for Discrete Envelope\nand Equipment Stash Key", "Gillsbane" } },
	[42403660] = { name="Watchers & Golems", class={ "WARLOCK" },
					spell={ "Master Channeler" }, guide={ st.warlock.channeling } },
	[43001500] = { name="Riverpaw Mobs (Various Gnolls)", class={ "DRUID" },
					spell={ "Savage Roar" }, guide={ st.druid.ferocious } },
	[43203160] = { npc=572, name="Leprithus", class={ "PALADIN" }, faction="Alliance",
					spell={ "Hand of Reckoning" }, guide={ st.paladin.justice } },
	[43805620] = { npc=832, name="Dust Devil", class={ "WARLOCK" },
					spell={ "Master Channeler" }, guide={ st.warlock.channeling } },
	[44403920] = { npc=210501, name="Harvest Reaper Prototype", class={ "WARLOCK" },
					spell={ "Master Channeler" }, guide={ st.warlock.channeling } },
	[44404660] = { npc=832, name="Dust Devil", class={ "WARLOCK" },
					spell={ "Master Channeler" }, guide={ st.warlock.channeling } },
	[44601940] = { name="Defias Mobs (Various)", class={ "DRUID", "ROGUE", "WARRIOR" }, faction="Alliance",
					guide={ st.druid.lacerate, st.rogue.bladeDance, st.warrior.quickStrike },
					spell={ "Lacerate", "Blade Dance", "Quick Strike" },
					tip={ "Magic Pumpkin Seed", "Pp for Discrete Envelope\nand Equipment Stash Key", "Gillsbane" } },
	[44602480] = { object=210537, name="Undying Laborer", class={ "PALADIN", "PRIEST" }, faction="Alliance",
					spell={ "Horn of Lordaeron", "Twisted Faith" },
					guide={ st.paladin.blessings, st.priest.twisted ..st.priest.twistedWest } },
	[44802780] = { name="Defias Mobs (Various)", class={ "DRUID", "ROGUE", "WARRIOR" }, faction="Alliance",
					guide={ st.druid.lacerate, st.rogue.bladeDance, st.warrior.quickStrike },
					spell={ "Lacerate", "Blade Dance", "Quick Strike" },
					tip={ "Magic Pumpkin Seed", "Pp for Discrete Envelope\nand Equipment Stash Key", "Gillsbane" } },
	[45003980] = { name="Watchers & Golems", class={ "WARLOCK" },
					spell={ "Master Channeler" }, guide={ st.warlock.channeling } },
	[45004080] = { npc=210501, name="Harvest Reaper Prototype", class={ "WARLOCK" },
					spell={ "Master Channeler" }, guide={ st.warlock.channeling } },
	[45203240] = { name="Watchers & Golems", class={ "WARLOCK" },
					spell={ "Master Channeler" }, guide={ st.warlock.channeling } },
	[45407050] = { object=409562, name="Spellbook", class={ "MAGE" },
					spell={ "Icy Veins" }, guide={ st.mage.books }, alsoTestQuest=true,
					quest={ 78142 }, questName={ "Bewitchments and Glamours" },
					tip="In the first hut on the left as you enter Moonbrook.\nRed book on the bottom of a bookshelf" },
	[45603900] = { npc=210501, name="Harvest Reaper Prototype", class={ "WARLOCK" },
					spell={ "Master Channeler" }, guide={ st.warlock.channeling } },
	[45806680] = { name="Defias Mobs (Various)", class={ "DRUID", "ROGUE", "WARRIOR" }, faction="Alliance",
					guide={ st.druid.lacerate, st.rogue.bladeDance, st.warrior.quickStrike },
					spell={ "Lacerate", "Blade Dance", "Quick Strike" },
					tip={ "Magic Pumpkin Seed", "Pp for Discrete Envelope\nand Equipment Stash Key", "Gillsbane" } },
	[46603760] = { name="Defias Mobs (Various)", class={ "DRUID", "ROGUE", "WARRIOR" }, faction="Alliance",
					guide={ st.druid.lacerate, st.rogue.bladeDance, st.warrior.quickStrike },
					spell={ "Lacerate", "Blade Dance", "Quick Strike" },
					tip={ "Magic Pumpkin Seed", "Pp for Discrete Envelope\nand Equipment Stash Key", "Gillsbane" } },
	[46805220] = { name="Defias Mobs (Various)", class={ "DRUID", "ROGUE", "WARRIOR" }, faction="Alliance",
					guide={ st.druid.lacerate, st.rogue.bladeDance, st.warrior.quickStrike },
					spell={ "Lacerate", "Blade Dance", "Quick Strike" },
					tip={ "Magic Pumpkin Seed", "Pp for Discrete Envelope\nand Equipment Stash Key", "Gillsbane" } },
	[47005160] = { npc=832, name="Dust Devil", class={ "WARLOCK" },
					spell={ "Master Channeler" }, guide={ st.warlock.channeling } },
	[47603560] = { name="Watchers & Golems", class={ "WARLOCK" },
					spell={ "Master Channeler" }, guide={ st.warlock.channeling } },
	[47802360] = { name="Defias Mobs (Various)", class={ "DRUID", "ROGUE", "WARRIOR" }, faction="Alliance",
					guide={ st.druid.lacerate, st.rogue.bladeDance, st.warrior.quickStrike },
					spell={ "Lacerate", "Blade Dance", "Quick Strike" },
					tip={ "Magic Pumpkin Seed", "Pp for Discrete Envelope\nand Equipment Stash Key", "Gillsbane" } },
	[49401920] = { name="Watchers & Golems", class={ "WARLOCK" },
					spell={ "Master Channeler" }, guide={ st.warlock.channeling } },
	[50001840] = { name="Defias Mobs (Various)", class={ "DRUID", "ROGUE", "WARRIOR" }, faction="Alliance",
					guide={ st.druid.lacerate, st.rogue.bladeDance, st.warrior.quickStrike },
					spell={ "Lacerate", "Blade Dance", "Quick Strike" },
					tip={ "Magic Pumpkin Seed", "Pp for Discrete Envelope\nand Equipment Stash Key", "Gillsbane" } },
	[50201500] = { name="Riverpaw Mobs (Various Gnolls)", class={ "DRUID" },
					spell={ "Savage Roar" }, guide={ st.druid.ferocious } },
	[50201740] = { npc=210501, name="Harvest Reaper Prototype", class={ "WARLOCK" },
					spell={ "Master Channeler" }, guide={ st.warlock.channeling } },
	[50402560] = { name="Watchers & Golems", class={ "WARLOCK" },
					spell={ "Master Channeler" }, guide={ st.warlock.channeling } },
	[50404740] = { npc=210501, name="Defias Scout", class={ "HUNTER", "ROGUE" }, faction="Alliance",
					tip={ "Pick Pocket, don't kill her. Use stealth to approach", nil },
					spell={ "Sniper Training", "Saber Slash" }, guide={ st.hunter.sniper, st.rogue.saberSlash } },
	[50601880] = { npc=210501, name="Harvest Reaper Prototype", class={ "WARLOCK" },
					spell={ "Master Channeler" }, guide={ st.warlock.channeling } },
	[50904720] = { name="Defias Mobs (Various)", class={ "DRUID", "ROGUE", "WARRIOR" }, faction="Alliance",
					guide={ st.druid.lacerate, st.rogue.bladeDance, st.warrior.quickStrike },
					spell={ "Lacerate", "Blade Dance", "Quick Strike" },
					tip={ "Magic Pumpkin Seed", "Pp for Discrete Envelope\nand Equipment Stash Key", "Gillsbane" } },
	[51204080] = { name="Defias Mobs (Various)", class={ "DRUID", "ROGUE", "WARRIOR" }, faction="Alliance",
					guide={ st.druid.lacerate, st.rogue.bladeDance, st.warrior.quickStrike },
					spell={ "Lacerate", "Blade Dance", "Quick Strike" },
					tip={ "Magic Pumpkin Seed", "Pp for Discrete Envelope\nand Equipment Stash Key", "Gillsbane" } },
	[51205500] = { npc=210501, name="Defias Scout", class={ "HUNTER", "ROGUE" },
					tip={ "Pick Pocket, don't kill her. Use stealth to approach", nil }, faction="Alliance",
					spell={ "Sniper Training", "Saber Slash" }, guide={ st.hunter.sniper, st.rogue.saberSlash } },
	[51803400] = { npc=210501, name="Harvest Reaper Prototype", class={ "WARLOCK" },
					spell={ "Master Channeler" }, guide={ st.warlock.channeling } },
	[52403020] = { name="Watchers & Golems", class={ "WARLOCK" },
					spell={ "Master Channeler" }, guide={ st.warlock.channeling } },
	[52803300] = { npc=210501, name="Harvest Reaper Prototype", class={ "WARLOCK" },
					spell={ "Master Channeler" }, guide={ st.warlock.channeling } },
	[53602360] = { name="Watchers & Golems", class={ "WARLOCK" },
					spell={ "Master Channeler" }, guide={ st.warlock.channeling } },
	[53604000] = { npc=832, name="Dust Devil", class={ "WARLOCK" },
					spell={ "Master Channeler" }, guide={ st.warlock.channeling } },
	[53007880] = { npc=450, name="Defias Renegade Mage", class={ "MAGE" },
					spell={ "Regeneration" }, guide={ st.mage.regeneration } },
	[54603660] = { name="Watchers & Golems", class={ "WARLOCK" },
					spell={ "Master Channeler" }, guide={ st.warlock.channeling } },
	[54604360] = { npc=832, name="Dust Devil", class={ "WARLOCK" },
					spell={ "Master Channeler" }, guide={ st.warlock.channeling } },
	[55401280] = { name="Riverpaw Mobs (Various Gnolls)", class={ "DRUID" },
					spell={ "Savage Roar" }, guide={ st.druid.ferocious } },
	[56003120] = { name="Watchers & Golems", class={ "WARLOCK" },
					spell={ "Master Channeler" }, guide={ st.warlock.channeling } },
	[56802260] = { name="Watchers & Golems", class={ "WARLOCK" },
					spell={ "Master Channeler" }, guide={ st.warlock.channeling } },
	[58201000] = { name="Riverpaw Mobs (Various Gnolls)", class={ "DRUID" },
					spell={ "Savage Roar" }, guide={ st.druid.ferocious } },
	[58601540] = { name="Riverpaw Mobs (Various Gnolls)", class={ "DRUID" },
					spell={ "Savage Roar" }, guide={ st.druid.ferocious } },
	[58601740] = { name="Watchers & Golems", class={ "WARLOCK" },
					spell={ "Master Channeler" }, guide={ st.warlock.channeling } },
	[60403560] = { npc=832, name="Dust Devil", class={ "WARLOCK" },
					spell={ "Master Channeler" }, guide={ st.warlock.channeling } },
	[61305810] = { npc=210501, name="Harvest Reaper Prototype", class={ "WARLOCK" },
					spell={ "Master Channeler" }, guide={ st.warlock.channeling } },
	[61607540] = { npc=572, name="Leprithus", class={ "PALADIN" }, faction="Alliance",
					spell={ "Hand of Reckoning" }, guide={ st.paladin.justice } },
	[62405200] = { npc=832, name="Dust Devil", class={ "WARLOCK" },
					spell={ "Master Channeler" }, guide={ st.warlock.channeling } },
	[65206320] = { npc=572, name="Leprithus", class={ "PALADIN" }, faction="Alliance",
					spell={ "Hand of Reckoning" }, guide={ st.paladin.justice } },
	[65206700] = { npc=7050, name="Defias Drone", class={ "PALADIN" }, faction="Alliance",
					spell={ "Hand of Reckoning" }, guide={ st.paladin.justice } },
	[66607040] = { npc=7050, name="Defias Drone", class={ "PALADIN" }, faction="Alliance",
					spell={ "Hand of Reckoning" }, guide={ st.paladin.justice } },
	[68407360] = { npc=832, name="Dust Devil", class={ "WARLOCK" },
					spell={ "Master Channeler" }, guide={ st.warlock.channeling } },
	[68607060] = { npc=7050, name="Defias Drone", class={ "PALADIN" }, faction="Alliance",
					spell={ "Hand of Reckoning" }, guide={ st.paladin.justice } },
	[69407310] = { npc=7050, name="Defias Drone", class={ "PALADIN" }, faction="Alliance",
					spell={ "Hand of Reckoning" }, guide={ st.paladin.justice } },
	[69407560] = { npc=7050, name="Defias Drone", class={ "PALADIN" }, faction="Alliance",
					spell={ "Hand of Reckoning" }, guide={ st.paladin.justice } },
	[71607220] = { npc=7050, name="Defias Drone", class={ "PALADIN" }, faction="Alliance",
					spell={ "Hand of Reckoning" }, guide={ st.paladin.justice } },
	[73607360] = { npc=7050, name="Defias Drone", class={ "PALADIN" }, faction="Alliance",
					spell={ "Hand of Reckoning" }, guide={ st.paladin.justice } },
}
points[ 1437 ] = { -- Wetlands
	[08205860] = { npc=3179, name="Harold Riggs", class={ "PALADIN" },
					spell={ "Sheath of Light" }, guide={ st.paladin.sheathLight },
					quest={ { 79939, 79940, 79945, 79970 } },
					tip="After Harold you'll need to swim south to Dun Morogh\nto an area otherwise (almost) inaccessible",
					questName={ { "The Broken Hammer", "A Lost Brother", "Orders from the Grand Crusader", "Aeonas the Vindicated" } } },
	[31271830] = { name="Vodyanoi / Stump", class={ "DRUID" },
					spell={ "Starsurge" }, tip="Stay a while and listen", guide={ st.druid.runeOfStars } },
	[33634786] = { object=409717, name="Scrolls", class={ "MAGE" },
					spell={ "Icy Veins" }, guide={ st.mage.books }, alsoTestQuest=true,
					quest={ 78146 }, questName={ "Goaz Scrolls" }, tip="Lowest level in a big urn" },
	[36891521] = { npc=212186, name="Grugimdern", class={ "DRUID" },
					spell={ "Starsurge" }, tip="He's under a bridge", guide={ st.druid.runeOfStars } },
	[46601820] = { npc=3180, name="Dark Iron Entrepreneur", class={ "WARRIOR" },
					spell={ "Raging Blow" }, guide={ st.warrior.ragingBlow }, quest={ 78132, 78134, 78133, 78144 },
					questName={ "Dragonslayer's Helm", "Dragonslayer's Lance", "Dragonslayer's Shield",
						"Alonso the Dragonslayer" } },
	[47606480] = { npc=211965, name="Carrodin", class={ "HUNTER", "WARRIOR" }, tip="Back of the cave. Level 25",
					spell={ "Heart of the Lion", "Consumed by Rage" }, guide={ st.hunter.heartLion, st.warrior.consumedRage } },
	[48001540] = { name="Dark Iron Demolitionist/Dwarf/Saboteur/Tunneler", class=st.allClass, spell=st.allSpellG,
					guide={ st.grizzby }, quest={ 78266 }, questName={ "Dark Iron Ordinance" } },
	[48001860] = { name="Dark Iron Demolitionist/Dwarf/Saboteur/Tunneler", class=st.allClass, spell=st.allSpellG,
					guide={ st.grizzby }, quest={ 78266 }, questName={ "Dark Iron Ordinance" } },
	[58310694] = { object=420055, name="Rowboat", class={ "DRUID", "HUNTER", "MAGE", "PALADIN", "PRIEST", "ROGUE",
					"SHAMAN", "WARLOCK", "WARRIOR" }, spell={ "Eclipse", "Trap Launcher", "Brain Freeze", "The Art of War",
					"Mind Spike", "Poisoned Knife", "Ancestral Awakening", "Shadow and Flame", "Enraged Regeneration" },
					guide={ st.pillaged }, quest={ { 79229, 79235, 79236, 79242 } }, 
					questName={ { "Highway Robbery", "On the Lam", "Cherry for Your Thoughts", "No Honor Among Thieves" } } },
	[60002480] = { name="Dark Iron Demolitionist/Dwarf/Saboteur/Tunneler", class=st.allClass, spell=st.allSpellG,
					guide={ st.grizzby }, quest={ 78266 }, questName={ "Dark Iron Ordinance" } },
	[62202980] = { name="Dark Iron Demolitionist/Dwarf/Saboteur/Tunneler", class=st.allClass, spell=st.allSpellG,
					guide={ st.grizzby }, quest={ 78266 }, questName={ "Dark Iron Ordinance" } },
	[62602600] = { name="Dark Iron Demolitionist/Dwarf/Saboteur/Tunneler", class=st.allClass, spell=st.allSpellG,
					guide={ st.grizzby }, quest={ 78266 }, questName={ "Dark Iron Ordinance" } },
}

--=======================================================================================================
--
-- KALIMDOR
--
--=======================================================================================================

points[ 1440 ] = { -- Ashenvale
	[07201320] = { name="Wrathtail Naga (Various)", class={ "MAGE" },
					spell={ "Living Bomb" }, guide={ st.mage.arcaneBlast } },
	[09602760] = { name="Wrathtail Naga (Various)", class={ "MAGE" },
					spell={ "Living Bomb" }, guide={ st.mage.arcaneBlast } },
	[11201380] = { name="Wrathtail Naga (Various)", class={ "MAGE" },
					spell={ "Living Bomb" }, guide={ st.mage.arcaneBlast } },
	[11603420] = { npc=12736, name="Je'neu Sancrea", class={ "SHAMAN" }, faction="Horde",
					spell={ "Earth Shield" }, quest={ { 78506, 78537, 78561, 78575 } },
					questName={ { "Elemental Distress", "Elixir of Insight", "Elixir of Insight", "Hirzek" } },
					guide={ st.shaman.earthShield } },
	[11803200] = { name="Wrathtail Naga (Various)", class={ "MAGE" },
					spell={ "Living Bomb" }, guide={ st.mage.arcaneBlast } },
	[13003000] = { name="Wrathtail Naga (Various)", class={ "MAGE" },
					spell={ "Living Bomb" }, guide={ st.mage.arcaneBlast } },
	[13072486] = { name="Arcane Shard", class={ "MAGE" },
					spell={ "Living Bomb" }, guide={ st.mage.arcaneBlast } },
	[13501577] = { name="Arcane Shard", class={ "MAGE" },
					spell={ "Living Bomb" }, guide={ st.mage.arcaneBlast } },
	[14061982] = { name="Arcane Shard", class={ "MAGE" },
					spell={ "Living Bomb" }, guide={ st.mage.arcaneBlast } },
	[14201520] = { name="Wrathtail Naga (Various)", class={ "MAGE" },
					spell={ "Living Bomb" }, guide={ st.mage.arcaneBlast } },
	[14202580] = { name="Wrathtail Naga (Various)", class={ "MAGE" },
					spell={ "Living Bomb" }, guide={ st.mage.arcaneBlast } },
	[14802080] = { name="Wrathtail Naga (Various)", class={ "MAGE" },
					spell={ "Living Bomb" }, guide={ st.mage.arcaneBlast } },
	[26203860] = { npc=3663, name="Delgren the Purifier", class={ "PALADIN" }, faction="Alliance",
					spell={ "Divine Storm" }, quest={ { 78088, 78089, 78090, 78091, 78092, 78093 } },
					questName={ { "A Strange Artifact", "Advice from Stormwind", "A Second Opinion", "Earning Your Salt", 
						"It Must Be Destroyed", "Return to Delgren" } }, guide={ st.paladin.divineStorm } },
	[32004300] = { npc=3924, name="Thistlefur Shaman", class={ "HUNTER", "PRIEST" },
					spell={ "Kill Command", "Strength of Soul" },
					guide={ st.hunter.killCommand, st.priest.strength }, tip={ "Drops Wild Magic Essence", nil },
					quest={ { 78114, 78121 }, {} }, questName={ { "Wild Wyvern Wrangling", "Wrangling a Wild Wyvern" }, {} } },
	[38002600] = { name="This way to the Dream Catcher", class={ "PRIEST" },
					tip= "Go north through a large Wooden Gate,\nveering a little east as you go north.\n"
						.."straight through a stone gate. Up the\ntree and go right at the first fork.\n"
						.."Now take the left branch. Obscured by\nleaves, you'll eventually find some\n"
						.."dreamcatchers. Use your Primal Insight",
					spell={ "Strength of Soul" }, guide={ st.priest.strength } },
	[40003280] = { name="Thistlefur Shaman/Totemic", class={ "HUNTER", "PRIEST" },
					spell={ "Kill Command", "Strength of Soul" },
					guide={ st.hunter.killCommand, st.priest.strength }, tip={ "Drops Wild Magic Essence", nil },
					quest={ { 78114, 78121 }, {} }, questName={ { "Wild Wyvern Wrangling", "Wrangling a Wild Wyvern" }, {} } },
	[42407000] = { npc=210995, name="Alonso", class={ "WARRIOR" },
					spell={ "Raging Blow" }, guide={ st.warrior.ragingBlow }, quest={ 78132, 78134, 78133, 78144 },
					questName={ "Dragonslayer's Helm", "Dragonslayer's Lance", "Dragonslayer's Shield",
						"Alonso the Dragonslayer" } },
	[45006960] = { npc=3917, name="Befouled water Elemental", class={ "SHAMAN" }, faction="Horde",
					spell={ "Earth Shield" }, quest={ { 78506, 78537, 78561, 78575 } },
					questName={ { "Elemental Distress", "Elixir of Insight", "Elixir of Insight", "Hirzek" } },
					guide={ st.shaman.earthShield }, tip="Mote of Torential Rage" },
	[47206720] = { npc=3917, name="Befouled water Elemental", class={ "SHAMAN" }, faction="Horde",
					spell={ "Earth Shield" }, quest={ { 78506, 78537, 78561, 78575 } },
					questName={ { "Elemental Distress", "Elixir of Insight", "Elixir of Insight", "Hirzek" } },
					guide={ st.shaman.earthShield }, tip="Mote of Torential Rage" },
	[47607060] = { npc=3917, name="Befouled water Elemental", class={ "SHAMAN" }, faction="Horde",
					spell={ "Earth Shield" }, quest={ { 78506, 78537, 78561, 78575 } },
					questName={ { "Elemental Distress", "Elixir of Insight", "Elixir of Insight", "Hirzek" } },
					guide={ st.shaman.earthShield }, tip="Mote of Torential Rage" },
	[49606920] = { npc=3917, name="Befouled water Elemental", class={ "SHAMAN" }, faction="Horde",
					spell={ "Earth Shield" }, quest={ { 78506, 78537, 78561, 78575 } },
					questName={ { "Elemental Distress", "Elixir of Insight", "Elixir of Insight", "Hirzek" } },
					guide={ st.shaman.earthShield }, tip="Mote of Torential Rage" },
	[50807120] = { npc=3917, name="Befouled water Elemental", class={ "SHAMAN" }, faction="Horde",
					spell={ "Earth Shield" }, quest={ { 78506, 78537, 78561, 78575 } },
					questName={ { "Elemental Distress", "Elixir of Insight", "Elixir of Insight", "Hirzek" } },
					guide={ st.shaman.earthShield }, tip="Mote of Torential Rage" },
	[51205900] = { name="Thistlefur Totemic / Foulweald Shaman", class={ "HUNTER" }, spell={ "Kill Command" },
					guide={ st.hunter.killCommand }, tip="Drops Wild Magic Essence",
					quest={ 78114, 78121 }, questName={ "Wild Wyvern Wrangling", "Wrangling a Wild Wyvern" } },
	[51606840] = { npc=3917, name="Befouled water Elemental", class={ "SHAMAN" }, faction="Horde",
					spell={ "Earth Shield" }, quest={ { 78506, 78537, 78561, 78575 } },
					questName={ { "Elemental Distress", "Elixir of Insight", "Elixir of Insight", "Hirzek" } },
					guide={ st.shaman.earthShield }, tip="Mote of Torential Rage" },
	[52607220] = { npc=3917, name="Befouled water Elemental", class={ "SHAMAN" }, faction="Horde",
					spell={ "Earth Shield" }, quest={ { 78506, 78537, 78561, 78575 } },
					questName={ { "Elemental Distress", "Elixir of Insight", "Elixir of Insight", "Hirzek" } },
					guide={ st.shaman.earthShield }, tip="Mote of Torential Rage" },
	[54606300] = { npc=3750, name="Foulweald STotemic", class={ "PRIEST" },
					spell={ "Strength of Soul" }, guide={ st.priest.strength } },
	[56206400] = { name="Thistlefur Totemic / Foulweald Shaman", class={ "HUNTER" }, spell={ "Kill Command" },
					guide={ st.hunter.killCommand }, tip="Drops Wild Magic Essence",
					quest={ 78114, 78121 }, questName={ "Wild Wyvern Wrangling", "Wrangling a Wild Wyvern" } },
	[69608380] = { npc=11684, name="Warsong Shredder", class=st.allClass, spell=st.allSpellG,
					guide={ st.grizzby }, quest={ 78267 }, questName={ "Shredder Turbochargers" } },
	[71208140] = { npc=11684, name="Warsong Shredder", class=st.allClass, spell=st.allSpellG,
					guide={ st.grizzby }, quest={ 78267 }, questName={ "Shredder Turbochargers" } },
	[73207940] = { npc=11684, name="Warsong Shredder", class=st.allClass, spell=st.allSpellG,
					guide={ st.grizzby }, quest={ 78267 }, questName={ "Shredder Turbochargers" } },
	[78008360] = { name="Mannoroc Lasher + (Infernals, Felguards, Hounds)", class={ "PALADIN", "WARLOCK" },
					faction="Alliance",
					spell={ "Divine Storm", "Metamorphosis" }, guide={ st.paladin.divineStorm, st.warlock.metamorphosis },
					quest={ { 78088, 78089, 78090, 78091, 78092, 78093 }, { 1740, 78680, 78681, 78684, 78702 } },
					questName={ { "A Strange Artifact", "Advice from Stormwind", "A Second Opinion", "Earning Your Salt", 
						"It Must Be Destroyed", "Return to Delgren" }, { "The Orb of Soran'ruk", "Rumors Abound",
						"The Conjuring", "The Mysterious Traveler", "Raszel Ander" } } },
	[79008020] = { npc=213444, name="The Mysterious Traveler", class={ "WARLOCK" },			
					spell={ "Metamorphosis" }, quest={ { 78684 } }, questName={ { "Mysterious Traveler" } },
					guide={ st.warlock.metamorphosis } },
	[79808060] = { name="Mannoroc Lasher + (Infernals, Felguards, Hounds)", class={ "PALADIN", "WARLOCK" },
					faction="Alliance",
					spell={ "Divine Storm", "Metamorphosis" }, guide={ st.paladin.divineStorm, st.warlock.metamorphosis },
					quest={ { 78088, 78089, 78090, 78091, 78092, 78093 }, { 1740, 78680, 78681, 78684, 78702 } },
					questName={ { "A Strange Artifact", "Advice from Stormwind", "A Second Opinion", "Earning Your Salt", 
						"It Must Be Destroyed", "Return to Delgren" }, { "The Orb of Soran'ruk", "Rumors Abound",
						"The Conjuring", "The Mysterious Traveler", "Raszel Ander" } } },
	[80206480] = { name="Mannoroc Lasher + (Infernals, Felguards, Hounds)", class={ "PALADIN", "WARLOCK" },
					faction="Alliance",
					spell={ "Divine Storm", "Metamorphosis" }, guide={ st.paladin.divineStorm, st.warlock.metamorphosis },
					quest={ { 78088, 78089, 78090, 78091, 78092, 78093 }, { 1740, 78680, 78681, 78684, 78702 } },
					questName={ { "A Strange Artifact", "Advice from Stormwind", "A Second Opinion", "Earning Your Salt", 
						"It Must Be Destroyed", "Return to Delgren" }, { "The Orb of Soran'ruk", "Rumors Abound",
						"The Conjuring", "The Mysterious Traveler", "Raszel Ander" } } },
	[81006860] = { name="Mannoroc Lasher + (Infernals, Felguards, Hounds)", class={ "PALADIN", "WARLOCK" },
					faction="Alliance",
					spell={ "Divine Storm", "Metamorphosis" }, guide={ st.paladin.divineStorm, st.warlock.metamorphosis },
					quest={ { 78088, 78089, 78090, 78091, 78092, 78093 }, { 1740, 78680, 78681, 78684, 78702 } },
					questName={ { "A Strange Artifact", "Advice from Stormwind", "A Second Opinion", "Earning Your Salt", 
						"It Must Be Destroyed", "Return to Delgren" }, { "The Orb of Soran'ruk", "Rumors Abound",
						"The Conjuring", "The Mysterious Traveler", "Raszel Ander" } } },
	[82406480] = { name="Mannoroc Lasher + (Infernals, Felguards, Hounds)", class={ "PALADIN", "WARLOCK" },
					faction="Alliance",
					spell={ "Divine Storm", "Metamorphosis" }, guide={ st.paladin.divineStorm, st.warlock.metamorphosis },
					quest={ { 78088, 78089, 78090, 78091, 78092, 78093 }, { 1740, 78680, 78681, 78684, 78702 } },
					questName={ { "A Strange Artifact", "Advice from Stormwind", "A Second Opinion", "Earning Your Salt", 
						"It Must Be Destroyed", "Return to Delgren" }, { "The Orb of Soran'ruk", "Rumors Abound",
						"The Conjuring", "The Mysterious Traveler", "Raszel Ander" } } },
	[82407160] = { name="Mannoroc Lasher + (Infernals, Felguards, Hounds)", class={ "PALADIN", "WARLOCK" },
					faction="Alliance",
					spell={ "Divine Storm", "Metamorphosis" }, guide={ st.paladin.divineStorm, st.warlock.metamorphosis },
					quest={ { 78088, 78089, 78090, 78091, 78092, 78093 }, { 1740, 78680, 78681, 78684, 78702 } },
					questName={ { "A Strange Artifact", "Advice from Stormwind", "A Second Opinion", "Earning Your Salt", 
						"It Must Be Destroyed", "Return to Delgren" }, { "The Orb of Soran'ruk", "Rumors Abound",
						"The Conjuring", "The Mysterious Traveler", "Raszel Ander" } } },
	[83007840] = { name="Mannoroc Lasher + (Infernals, Felguards, Hounds)", class={ "PALADIN", "WARLOCK" },
					faction="Alliance",
					spell={ "Divine Storm", "Metamorphosis" }, guide={ st.paladin.divineStorm, st.warlock.metamorphosis },
					quest={ { 78088, 78089, 78090, 78091, 78092, 78093 }, { 1740, 78680, 78681, 78684, 78702 } },
					questName={ { "A Strange Artifact", "Advice from Stormwind", "A Second Opinion", "Earning Your Salt", 
						"It Must Be Destroyed", "Return to Delgren" }, { "The Orb of Soran'ruk", "Rumors Abound",
						"The Conjuring", "The Mysterious Traveler", "Raszel Ander" } } },
	[83606760] = { name="Mannoroc Lasher + (Infernals, Felguards, Hounds)", class={ "PALADIN", "WARLOCK" },
					faction="Alliance",
					spell={ "Divine Storm", "Metamorphosis" }, guide={ st.paladin.divineStorm, st.warlock.metamorphosis },
					quest={ { 78088, 78089, 78090, 78091, 78092, 78093 }, { 1740, 78680, 78681, 78684, 78702 } },
					questName={ { "A Strange Artifact", "Advice from Stormwind", "A Second Opinion", "Earning Your Salt", 
						"It Must Be Destroyed", "Return to Delgren" }, { "The Orb of Soran'ruk", "Rumors Abound",
						"The Conjuring", "The Mysterious Traveler", "Raszel Ander" } } },
	[84205920] = { npc=11684, name="Warsong Shredder", class=st.allClass, spell=st.allSpellG,
					guide={ st.grizzby }, quest={ 78267 }, questName={ "Shredder Turbochargers" } },
	[84606260] = { npc=11684, name="Warsong Shredder", class=st.allClass, spell=st.allSpellG,
					guide={ st.grizzby }, quest={ 78267 }, questName={ "Shredder Turbochargers" } },
	[84607060] = { name="Mannoroc Lasher + (Infernals, Felguards, Hounds)", class={ "PALADIN", "WARLOCK" },
					faction="Alliance",
					spell={ "Divine Storm", "Metamorphosis" }, guide={ st.paladin.divineStorm, st.warlock.metamorphosis },
					quest={ { 78088, 78089, 78090, 78091, 78092, 78093 }, { 1740, 78680, 78681, 78684, 78702 } },
					questName={ { "A Strange Artifact", "Advice from Stormwind", "A Second Opinion", "Earning Your Salt", 
						"It Must Be Destroyed", "Return to Delgren" }, { "The Orb of Soran'ruk", "Rumors Abound",
						"The Conjuring", "The Mysterious Traveler", "Raszel Ander" } } },
	[84607500] = { name="Mannoroc Lasher + (Infernals, Felguards, Hounds)", class={ "PALADIN", "WARLOCK" },
					faction="Alliance",
					spell={ "Divine Storm", "Metamorphosis" }, guide={ st.paladin.divineStorm, st.warlock.metamorphosis },
					quest={ { 78088, 78089, 78090, 78091, 78092, 78093 }, { 1740, 78680, 78681, 78684, 78702 } },
					questName={ { "A Strange Artifact", "Advice from Stormwind", "A Second Opinion", "Earning Your Salt", 
						"It Must Be Destroyed", "Return to Delgren" }, { "The Orb of Soran'ruk", "Rumors Abound",
						"The Conjuring", "The Mysterious Traveler", "Raszel Ander" } } },
	[86007860] = { name="Mannoroc Lasher + (Infernals, Felguards, Hounds)", class={ "PALADIN", "WARLOCK" },
					faction="Alliance",
					spell={ "Divine Storm", "Metamorphosis" }, guide={ st.paladin.divineStorm, st.warlock.metamorphosis },
					quest={ { 78088, 78089, 78090, 78091, 78092, 78093 }, { 1740, 78680, 78681, 78684, 78702 } },
					questName={ { "A Strange Artifact", "Advice from Stormwind", "A Second Opinion", "Earning Your Salt", 
						"It Must Be Destroyed", "Return to Delgren" }, { "The Orb of Soran'ruk", "Rumors Abound",
						"The Conjuring", "The Mysterious Traveler", "Raszel Ander" } } },
	[86205440] = { npc=11684, name="Warsong Shredder", class=st.allClass, spell=st.allSpellG,
					guide={ st.grizzby }, quest={ 78267 }, questName={ "Shredder Turbochargers" } },
	[86606160] = { npc=11684, name="Warsong Shredder", class=st.allClass, spell=st.allSpellG,
					guide={ st.grizzby }, quest={ 78267 }, questName={ "Shredder Turbochargers" } },
	[86954316] = { item=210044, name="Symbol of the First Owl", class={ "DRUID" },
					spell={ "Wild Growth" }, guide={ st.druid.wildGrowth },
					tip="You need to \"channel\" the statue. Then three\nwaves appear. Enough delay between each wave to\n"
						.."eat, whatever. You'll have a wisp which tries to\nhelp you. It basically tanks. You can't heal it\n"
						.."so you may need to go bear and taunt" },
	[88405680] = { npc=11684, name="Warsong Shredder", class=st.allClass, spell=st.allSpellG,
					guide={ st.grizzby }, quest={ 78267 }, questName={ "Shredder Turbochargers" } },
	[89205420] = { npc=11684, name="Warsong Shredder", class=st.allClass, spell=st.allSpellG,
					guide={ st.grizzby }, quest={ 78267 }, questName={ "Shredder Turbochargers" } },
	[89504060] = { name="Quartermaster Kyleen / Field Captain Hannalah", class=st.allClass, spell=st.emeraldSpell,
					guide={ st.nightmareIncursions } },
	[89507700] = { object=409315, name="Shattered Orb", class={ "PALADIN" },
					faction="Alliance", tip="Click below the weapons",
					spell={ "Divine Storm" }, quest={ { 78088, 78089, 78090, 78091, 78092, 78093 } },
					questName={ { "A Strange Artifact", "Advice from Stormwind", "A Second Opinion", "Earning Your Salt", 
						"It Must Be Destroyed", "Return to Delgren" } }, guide={ st.paladin.divineStorm } },
	[92504040] = { object=414197, name="Bough of Shadows", class={ "WARLOCK" },
					tip="Three possible locations. it's\na purple tree with sparkles.\nUse your Invisibility Potion.\n"
						.."You will receive a nasty debuff.\nUsing Shadow Ward will help",
					spell={ "Grimoire of Synergy" }, guide={ st.warlock.synergy },
					quest={ { 78994, 78914, 79298 } }, questName={ { "A Solid Foundation", "Soul Vessel", "Tempting Fate" } } },
	[94003840] = { name="Dreampyre Imp, Emberspark Dreamsworn, Dreamhunter Hound", class={ "WARLOCK" },
					spell={ "Immolation Aura" }, guide={ "Farm Dreampyre Imps for a Dreampyre Fire,\n"
						.."Emberspark Dreamsworn for a Dreamsworn Horn,\nDreamhunter Hound for a Dreamhunter Fang.\n\n"
						.."Combine and Voilà!" } },
}
points[ 1447 ] = { -- Azshara
	[14804990] = { npc=222004, name="Corrupt Moderate Manifestation of Water", class={ "SHAMAN" }, spell={ "Overcharged" },
					guide={ st.shaman.overcharged },
					quest={ { 82073, 82076, 82071, 82074, 82072, 82075, 81960, 81968 } },
					questName={ { "Cleansing Water", "Answering Water's Call", "Purifying Fire", "Answering Fire's Call",
						"Purging Earth", "Answering Earth's Call", "Clarifying Air", "Answering Air's Call" } } },
	[20206200] = { name="Haldarr mobs (Various)", class={ "SHAMAN" }, spell={ "Overcharged" }, guide={ st.shaman.overcharged },
					quest={ { 82073, 82076, 82071, 82074, 82072, 82075, 81960, 81968 } },
					questName={ { "Cleansing Water", "Answering Water's Call", "Purifying Fire", "Answering Fire's Call",
						"Purging Earth", "Answering Earth's Call", "Clarifying Air", "Answering Air's Call" } } },
	[20606197] = { object=441865, name="Traveller's Knapsack", class={ "DRUID" }, spell={ "Elune's Fires" },
					guide={ st.druid.elunesFires }, tip="Don't forget to loot two items:\nKeldara's Log and the Mortar & Pestle" },
	[20806200] = { object=441250, name="Book", class={ "MAGE" }, tip="On a crate in the Haldarr Encampment",
					spell={ "Deep Freeze" }, guide={ st.mage.books }, alsoTestQuest=true,
					quest={ { 81952 } }, questName={ { "Everyday Etiquette" } } },
	[22007900] = { item=221318, name="Azshara Leycryst", class={ "MAGE", "PALADIN", "PRIEST", "WARLOCK" },
					spell={ "Displacement", "Purifying Power", "Despair", "Backdraft" }, guide={ st.leylineGuide },
					tip="Near to The Forlorn Ridge" },
	[25456612] = { npc=221400, name="Kajind", class={ "WARRIOR" }, tip="Up in a mountain, path is from the east",
					spell={ "Gladiator Stance" }, guide={ st.warrior.gladiator }, preRune={ { "Blood Frenzy", "Rallying Cry" } },
					quest={ { 81682, 81697, 81801, 81877 } }, 
					questName={ { "The Old Champ", "Defanged", "Return to the Arena", "Fight Night" } } },
	[34004900] = { name="Shrine of the Beast", class={ "DRUID" }, spell={ "Efflorescence" },
					guide={ st.druid.efflorescence }, quest={ 81924 }, questName={ "Wisdom of the Guardians" } },
	[36207000] = { npc=221651, name="Ceruleos", class={ "WARRIOR" }, spell={ "Gladiator Stance" },
					guide={ st.warrior.gladiator }, preRune={ { "Blood Frenzy", "Rallying Cry" } },
					quest={ { 81682, 81697, 81801, 81877 } }, 
					questName={ { "The Old Champ", "Defanged", "Return to the Arena", "Fight Night" } } },
	[42607160] = { npc=221651, name="Ceruleos", class={ "WARRIOR" }, spell={ "Gladiator Stance" },
					guide={ st.warrior.gladiator }, preRune={ { "Blood Frenzy", "Rallying Cry" } },
					quest={ { 81682, 81697, 81801, 81877 } }, 
					questName={ { "The Old Champ", "Defanged", "Return to the Arena", "Fight Night" } } },
	[43003000] = { npc=222580, name="Child of Apa'ro", class={ "DRUID" }, spell={ "Efflorescence" },
					guide={ st.druid.efflorescence }, quest={ 81924 }, questName={ "Wisdom of the Guardians" } },
	[89003300] = { npc=223590, name="Shrine of the Watcher", class={ "PRIEST" }, spell={ "Eye of the Void" },
					quest={ { 82316 } }, questName={ { "Seven Eyes I Seek..." } }, guide={ st.priest.eyeOfVoid } },
}
points[ 1439 ] = { -- Darkshore
	[30404800] = { npc=414646, name="Remnant", class={ "PRIEST" }, faction="Alliance", 
					spell={ "Shadow Word: Death" }, guide={ "Just click the glowing orb already!" } },
	[32803710] = { object=414624, name="Lighthouse Stash", class={ "ROGUE" }, faction="Alliance",
					tip="Between the roots of a large tree\non a small island with a lighthouse",
					spell={ "Saber Slash" }, guide={ st.rogue.saberSlash } },
	[37005360] = { npc=2234, name="Young Reef Crawler", class={ "DRUID", "HUNTER" },
					spell={ "Lacerate", "Beast Mastery" }, guide={ st.druid.lacerate, st.hunter.beastMastery } },
	[38603160] = { npc=2234, name="Young Reef Crawler", class={ "DRUID", "HUNTER" },
					spell={ "Lacerate", "Beast Mastery" }, guide={ st.druid.lacerate, st.hunter.beastMastery } },
	[38665689] = { name="Furbolg mobs (Various)", class={ "HUNTER" },
					spell={ "Beast Mastery" }, guide={ st.hunter.beastMastery} },
	[39805280] = { name="Blackwood Mobs (Various Furlbog)", class={ "DRUID" },
					spell={ "Lacerate" }, guide={ st.druid.lacerate } },
	[40605620] = { name="Blackwood Mobs (Various Furlbog)", class={ "DRUID" },
					spell={ "Lacerate" }, guide={ st.druid.lacerate } },
	[40608860] = { name="Blackwood Mobs (Various Furlbog)", class={ "DRUID" },
					spell={ "Lacerate" }, guide={ st.druid.lacerate } },
	[42608280] = { name="Blackwood Mobs (Various Furlbog)", class={ "DRUID" },
					spell={ "Lacerate" }, guide={ st.druid.lacerate } },
	[45008900] = { name="Blackwood Mobs (Various Furlbog)", class={ "DRUID" },
					spell={ "Lacerate" }, guide={ st.druid.lacerate } },
	[48001650] = { object=408802, name="Gnarled Harpoon", class={ "HUNTER", "WARRIOR" }, faction="Alliance",
					tip="Inside the head of a dead seas turtle",
					spell={ "Sniper Training", "Quick Strike" },
					guide={ st.hunter.sniper, st.warrior.quickStrike }, tip="Use it on Paxnozz" },
	[50001360] = { npc=210482, name="Paxnozz", class={ "HUNTER", "WARRIOR" }, faction="Alliance",
					spell={ "Sniper Training", "Quick Strike" },
					guide={ st.hunter.sniper, st.warrior.quickStrike },
					tip="Obtain a Gnarled Harpoon from nearby, then use it" },
	[50603560] = { name="Blackwood Mobs (Various Furlbog)", class={ "DRUID" },
					spell={ "Lacerate" }, guide={ st.druid.lacerate } },
	[51603760] = { npc=6788, name="Den Mother", class={ "DRUID" }, faction="Alliance",
					spell={ "Savage Roar" }, guide={ st.druid.ferocious } },
	[52803460] = { name="Blackwood Mobs (Various Furlbog)", class={ "DRUID" },
					spell={ "Lacerate" }, guide={ st.druid.lacerate } },
	[55002760] = { npc=2336, name="Dark Strand Fiend", class={ "WARLOCK" },
					spell={ "Master Channeler" }, guide={ st.warlock.channeling } },
	[55003260] = { npc=219451, name="Lady Sedorax", class={ "WARRIOR" }, faction="Alliance",
					spell={ "Endless Rage" }, guide={ st.warrior.endlessRage } },
	[55803420] = { npc=219451, name="Lady Sedorax", class={ "WARRIOR" }, faction="Alliance",
					spell={ "Endless Rage" }, guide={ st.warrior.endlessRage } },
	[56202640] = { name="Tower of Athalaxx", class={ "PALADIN" }, faction="Alliance",
					spell={ "Divine Storm" }, quest={ { 78088, 78089, 78090, 78091, 78092, 78093 } },
					questName={ { "A Strange Artifact", "Advice from Stormwind", "A Second Opinion", "Earning Your Salt", 
						"It Must Be Destroyed", "Return to Delgren" } }, guide={ st.paladin.divineStorm } },
	[56302640] = { item=210763, name="Bough of Altek", class={ "WARLOCK" },
					spell={ "Metamorphosis" }, guide={ st.warlock.metamorphosis }, tip="Top of the Tower of Athalaxx",
					quest={ { 1740, 78680, 78681, 78684, 78702 } }, questName={ { "The Orb of Soran'ruk", "Rumors Abound",
						"The Conjuring", "The Mysterious Traveler", "Raszel Ander" } } },
	[56303890] = { object=414532, name="Cliffspring Chest", class={ "ROGUE" }, faction="Alliance",
					tip= "On a ledge with a few mobs and the chest at\nthe back of the cave. The Cliffspring mobs\n"
						.."will drop the necessary Cliffspring Key",
					spell={ "Blade Dance" }, guide={ st.rogue.bladeDance } },
	[57202600] = { npc=3662, name="Delmanis the Hated", class={ "WARLOCK" },
					spell={ "Shadow Bolt Volley" }, guide={ st.warlock.shadowbolts }, quest={ { 4763 } },
					questName={ { "The Blackwood Corrupted" } }, faction="Alliance" },
	[57602600] = { npc=2336, name="Dark Strand Fiend", class={ "WARLOCK" },
					spell={ "Master Channeler" }, guide={ st.warlock.channeling } },
	[57001920] = { name="Stormscale mobs (Various)", class={ "PRIEST" },
					spell={ "Twisted Faith" }, guide={ st.priest.twisted ..st.priest.twistedDark } },
	[59202260] = { object=414663, name="Shatterspear Idol", class={ "PRIEST" },
					spell={ "Twisted Faith" }, guide={ st.priest.twisted ..st.priest.twistedDark } },
	[59612213] = { object=409496, name="Scrolls", class={ "MAGE" },
					spell={ "Icy Veins" }, guide={ st.mage.books }, alsoTestQuest=true,
					quest={ 78124 }, questName={ "Nar'thalas Almanac" }, tip="Go down the stairs at the Ruins of Mathystra" },
}
points[ 1457 ] = { -- Darnassus
	[39800940] = { npc=209948, name="Relaeron", class={ "HUNTER" }, spell={ "Carve" },
					guide={ st.hunter.carve } },
	[60005640] = { npc=214101, name="Marcy Baker", faction="Alliance",
					class=st.allClass, spell=st.allSpellACA, guide={ st.supplyFaction } },
	[64002200] = { npc=209608, name="Delwynna", class={ "WARRIOR" }, faction="Alliance",
					spell={ "Devastate" }, guide={ st.warrior.devastate ..st.warrior.devastateJunni }, }
}

points[ 1443 ] = { -- Desolace
	[29006300] = { name="Maraudon", class={ "SHAMAN" }, spell={ "Fire Nova" }, guide={ st.shaman.fireNova } },
	[32802140] = { name="Slitherblade Mobs (Various)", class=st.allClass, spell=st.allSpellG,
					guide={ st.grizzby }, quest={ 78265 }, questName={ "Fish Oil" } },
	[37602420] = { name="Slitherblade Mobs (Various)", class={ "PRIEST" }, spell={ "Renewed Hope" },
					guide={ st.priest.renewedHope } },
	[45804860] = { name="Wind Elementals (Various)", class={ "SHAMAN" }, spell={ "Maelstrom Weapon" },
					guide={ st.shaman.maelstrom }, quest={ st.shaman.maelstromQ }, questName={ st.shaman.maelstromQN } },
	[46602760] = { name="Wind Elementals (Various)", class={ "SHAMAN" }, spell={ "Maelstrom Weapon" },
					guide={ st.shaman.maelstrom }, quest={ st.shaman.maelstromQ }, questName={ st.shaman.maelstromQN } },
	[47505760] = { name="Extinguished Campfire", class={ "DRUID", "HUNTER", "MAGE", "PALADIN", "PRIEST", "ROGUE",
					"SHAMAN", "WARLOCK", "WARRIOR" }, spell={ "Eclipse", "Trap Launcher", "Brain Freeze", "The Art of War",
					"Mind Spike", "Poisoned Knife", "Ancestral Awakening", "Shadow and Flame", "Enraged Regeneration" },
					guide={ st.pillaged }, quest={ { 79229, 79235, 79236, 79242 } }, 
					questName={ { "Highway Robbery", "On the Lam", "Cherry for Your Thoughts", "No Honor Among Thieves" } } },
	[51005900] = { npc=217590, name="Flesh Picker", class={ "DRUID", "HUNTER" },
					spell={ "Survival Instincts", "Invigoration" }, guide={ st.amaryllis } },
	[51208260] = { npc=215974, name="Des'Altek", class={ "WARLOCK" },
					tip="Walk through the story. Kill. Loot",
					spell={ "Grimoire of Synergy" }, guide={ st.warlock.synergy },
					quest={ { 78994, 78914, 79298 } }, questName={ { "A Solid Foundation", "Soul Vessel", "Tempting Fate" } } },
	[52608480] = { item=215441, name="Broken Hammer", class={ "PALADIN" },
					spell={ "Sheath of Light" }, guide={ st.paladin.sheathLight },
					quest={ { 79939, 79940, 79945, 79970 } },
					questName={ { "The Broken Hammer", "A Lost Brother", "Orders from the Grand Crusader", "Aeonas the Vindicated" } } },
	[55102620] = { object=423898, name="Mysterious Book", class={ "MAGE" },
					spell={ "Spell Power" }, guide={ st.mage.books }, alsoTestQuest=true,
					tip="On a bench alongside a cauldron inside the building",
					quest={ { 79950 } }, questName={ { "Demons and You" } } },
	[58202140] = { npc=217392, name="Flameseer Dubelen", class={ "SHAMAN" }, spell={ "Fire Nova" }, guide={ st.shaman.fireNova } },
	[59736704] = { npc=4632, name="Pond for rehydration", class={ "DRUID" }, spell={ "Dreamstate" }, guide={ st.druid.dreamstate } },
	[6200510] = { name="Wind Elementals (Various)", class={ "SHAMAN" }, spell={ "Maelstrom Weapon" },
					guide={ st.shaman.maelstrom }, quest={ st.shaman.maelstromQ }, questName={ st.shaman.maelstromQN } },
	[62203880] = { npc=11438, name="Bibbly F'utzbuckle", class={ "DRUID", "HUNTER", "MAGE", "PALADIN", "PRIEST", "ROGUE",
					"SHAMAN", "WARLOCK", "WARRIOR" }, spell={ "Eclipse", "Trap Launcher", "Brain Freeze", "The Art of War",
					"Mind Spike", "Poisoned Knife", "Ancestral Awakening", "Shadow and Flame", "Enraged Regeneration" },
					guide={ st.pillaged }, quest={ { 79229, 79235, 79236, 79242 } }, 
					questName={ { "Highway Robbery", "On the Lam", "Cherry for Your Thoughts", "No Honor Among Thieves" } } },
	[65802440] = { npc=218931, name="Dark Rider", name="Dark Rider", tip="Search this area",
					class={ "DRUID", "HUNTER", "MAGE", "PALADIN", "PRIEST", "ROGUE",
					"SHAMAN", "WARLOCK", "WARRIOR" }, spell={ "King of the Jungle", "Melee Specialist", "Missile Barrage",
					"Infusion of Light", "Spirit of the Redeemer", "Waylay", "Two-Handed Mastery", "Demonic Knowledge",
					"Precise Timing" }, guide={ st.dalaranAgent }, quest={ st.dalaranQuest }, questName={ st.dalaranQuestName } },
	[66002900] = { npc=4632, name="Pond for rehydration", class={ "DRUID" }, spell={ "Dreamstate" }, guide={ st.druid.dreamstate } },
	[66500750] = { object=423695, name="Libram of Deliverance", class={ "PALADIN" }, spell={ "Sacred Shield" },
					guide={ st.paladin.sacredShield } },
	[69007300] = { name="Wind Elementals (Various)", class={ "SHAMAN" }, spell={ "Maelstrom Weapon" },
					guide={ st.shaman.maelstrom }, quest={ st.shaman.maelstromQ }, questName={ st.shaman.maelstromQN } },
	[69604860] = { npc=4632, name="Kolkar Centaur", class={ "DRUID" }, spell={ "Dreamstate" }, guide={ st.druid.dreamstate } },
	[70004120] = { npc=4632, name="Kolkar Centaur", class={ "DRUID" }, spell={ "Dreamstate" }, guide={ st.druid.dreamstate } },
	[70007000] = { npc=4632, name="Pond for rehydration", class={ "DRUID" }, spell={ "Dreamstate" }, guide={ st.druid.dreamstate } },
	[74471897] = { object=404401, name="Sandy Loam", class={ "DRUID" }, spell={ "Dreamstate" }, tip={ "There are several mounds" },
					guide={ st.druid.dreamstate } },
	[74801330] = { npc=217620, name="Reckless Warlock", class={ "WARLOCK" }, spell={ "Dance of the Wicked" }, guide={ st.warlock.dance }, },
	[81007900] = { object=419741, name="Sacrifical Altar", class={ "WARLOCK" }, spell={ "Shadowflame" }, guide={ st.warlock.shadowflame }, },
}
points[ 1411 ] = { -- Durotar
	[35205240] = { npc=5823, name="Death Flayer", class={ "WARRIOR" }, faction="Horde",
					spell={ "Furious Thunder" }, guide={ st.warrior.furiousThunder } },
	[36004740] = { npc=203079, name="Wandering Swordsman", class={ "WARRIOR" },
					spell={ "Blood Frenzy" }, guide={ st.warrior.bloodFrenzy } },
	[36605560] = { npc=5823, name="Death Flayer", class={ "WARRIOR" }, faction="Horde",
					spell={ "Furious Thunder" }, guide={ st.warrior.furiousThunder } },
	[38804620] = { npc=5823, name="Death Flayer", class={ "WARRIOR" }, faction="Horde",
					spell={ "Furious Thunder" }, guide={ st.warrior.furiousThunder } },
	[39002660] = { npc=3131, name="Lightning Hide", class={ "WARRIOR" }, faction="Horde",
					spell={ "Furious Thunder" }, guide={ st.warrior.furiousThunder } },
	[39005360] = { npc=3113, name="Razormane Dustrunner", class={ "PRIEST" }, faction="Horde",
					spell={ "Homunculi" }, guide={ st.priest.citadel } },
	[39435007] = { name="Lightning Infused Totem", class={ "SHAMAN" }, faction="Horde",
					spell={ "Shield Mastery" }, guide={ st.shaman.galvanicIcon } },
	[39605260] = { npc=3114, name="Razormane Battleguard", class={ "HUNTER", "ROGUE", "WARRIOR" }, faction="Horde",
					spell={ "Carve", "Quick Draw", "Devastate" },
					guide={ st.hunter.carve, st.rogue.quickDraw ..st.rogue.quickDrawDur, 
						st.warrior.devastate ..st.warrior.devastateVah },
					tip={ "Adder Pheromone", "Bottom-Right Map Piece\n(Drop or Pickpocketing)", "Severed Quillboar Head" } },
	[40605200] = { npc=208179, name="Rustling Bush", class={ "HUNTER" }, faction="Horde",
					spell={ "Master Marksman" }, guide={ st.hunter.masterMark } },
	[40606760] = { npc=3281, name="Sarkoth", class={ "HUNTER", "WARRIOR" }, faction="Horde",
					spell={ "Explosive Shot", "Furious Thunder" },
					tip="Sarkoth is strongly suggested for your rune.\nNo travelling - in the Valley of Trials!",
					guide={ st.hunter.explosiveShot, st.warrior.furiousThunder } },
	[40656851] = { npc=3156, name="Nartok", class={ "WARLOCK" }, faction="Horde",
					spell={ "Haunt" }, guide={ st.starterZoneClass }, quest={ 77586 },
					questName={ "Stolen Power" } },
	[40716506] = { object=404911, name="Hidden Cache", class={ "ROGUE", "WARRIOR" }, faction="Horde",
					spell={ "Shadowstrike", "Victory Rush" }, guide={ st.starterZoneClass },
					quest={ 77583, ( ( ns.class == "TROLL" ) and 77588 or 77582 ) }, questName={ "Atop the Cliffs", "A Trial of Fitness" },
					tip= "Cut through this pass but beware of Sarkoth.\n\nLook at your Minimap. Run towards\nthe pin for Rwag, below.\n\n"
							.."Then run towards the pin for the Cache!\nYou'll figure out how to jump down!" },
	[40806400] = { npc=3124, name="Scorpid Worker", class={ "HUNTER", "SHAMAN" }, faction="Horde",
					spell={ "Chimera Shot", "Overload" }, 
					guide={ st.starterZoneClass, st.shaman.dyadicIcon },
					quest={ ( ( ns.class == "TROLL" ) and 77590 or 77584 ), ( ( ns.class == "ORC" ) and 77585 or 77587 ) },
					questName={ ( ( ns.class == "TROLL" ) and "Rugged Terrain" or "Hunt for the Rune" ), "Icons of Power" } },
	[41204960] = { npc=203079, name="Wandering Swordsman", class={ "WARRIOR" },
					spell={ "Blood Frenzy" }, guide={ st.warrior.bloodFrenzy } },

	[41276800] = { npc=3155, name="Rwag", class={ "ROGUE" }, faction="Horde",
					quest={ 77583 }, questName={ "Atop the Cliffs" },
					spell={ "Shadowstrike" }, guide={ st.starterZoneClass } },
	[42002660] = { name="Burning Blade mobs (Various)", class={ "MAGE", "ROGUE" }, faction="Horde",
					spell={ "Living Flame", "Mutilate" },
					tip="Ignore the map. To get to here, exit\nfrom Razor Hill and take the eastern\npath that goes up and north"
						..( ( ns.class == "ROGUE" ) and "\n\nPick Pocket. Don't need to kill" or "" ),					
					guide={ st.mage.livingFlame, st.rogue.mutilate } },
	[42366882] = { npc=3707, name="Ken'jai", class={ "PRIEST" }, faction="Horde",
					spell={ "Penance" }, guide={ st.starterZoneClass ..st.priest.penanceDur },
					quest={ 77642 }, questName={ "Wisdom of the Loa" } },
	[42396900] = { npc=3157, name="Shikrik", class={ "SHAMAN" }, faction="Horde",
					spell={ "Overload" }, quest={ ( ( ns.class == "ORC" ) and 77585 or 77587 ) }, guide={ st.shaman.dyadicIcon },
					questName={ "Icons of Power" } },
	[42516904] = { npc=5884, name="Mai'ah", class={ "MAGE" }, faction="Horde",
					spell={ "Ice Lance" }, questName={ "Spell Research" }, quest={ 77643 }, guide={ st.starterZoneClass } },
	[42802380] = { npc=3131, name="Lightning Hide", class={ "WARRIOR" }, faction="Horde",
					spell={ "Furious Thunder" }, guide={ st.warrior.furiousThunder } },
	[42846933] = { npc=3154, name="Jen'shan", class={ "HUNTER" }, faction="Horde",
					quest={ ( ( ns.class == "TROLL" ) and 77590 or 77584 ) },
					questName={ ( ( ns.class == "TROLL" ) and "Rugged Terrain" or "Hunt for the Rune" ) },
					spell={ "Chimera Shot" }, guide={ st.starterZoneClass } },					
	[42896944] = { npc=3153, name="Frang", class={ "WARRIOR" }, faction="Horde",
					spell={ "Victory Rush" }, guide={ st.starterZoneClass },
					quest={ ( ( ns.class == "TROLL" ) and 77588 or 77582 ) }, questName={ "A Trial of Fitness" } },					
	[43015446] = { object=404695, name="Waterlogged Stashbox", class={ "MAGE", "WARLOCK" }, faction="Horde",
					spell={ "Ice Lance", "Haunt" },
					guide={ st.starterZoneClass }, quest={ { 77643 }, { 77586 } },
					questName={ { "Spell Research" }, { "Stolen Power" } },
					tip="Deep in the pond at the foot of the waterfall.\nThere are several ponds/waterfalls. Trust in\n"
						.."the accuracy of this pin" },
	[43206960] = { object=404911, name="Hidden Cache", class={ "ROGUE", "WARRIOR" }, faction="Horde",
					spell={ "Shadowstrike", "Victory Rush" },
					quest={ 77583, ( ( ns.class == "TROLL" ) and 77588 or 77582 ) }, questName={ "Atop the Cliffs", "A Trial of Fitness" },
					guide={ st.starterZoneClass  },
					tip= "High up on a ledge. To appreciate the location,\nrun north from here back to about where Kaltunk\n"
						.."is standing. Now, you'll noticed a ledge that's\nslightly higher and to the right of the Cache.\n"
						.."You'll jump down onto that ledge.\n\nFrom Kaltunk, look north north-east. Run in\n"
						.."that direction and then turn left and keep\nbearing left. Effectively a U-turn." },
	[43616620] = { object=404911, name="Hidden Cache", class={ "ROGUE", "WARRIOR" }, faction="Horde",
					spell={ "Shadowstrike", "Victory Rush" },
					quest={ 77583, ( ( ns.class == "TROLL" ) and 77588 or 77582 ) }, questName={ "Atop the Cliffs", "A Trial of Fitness" },
					guide={ st.starterZoneClass  }, tip= "As stated previously, keep bearing left" },
	[43805960] = { npc=3124, name="Scorpid Worker", class={ "HUNTER", "SHAMAN" }, faction="Horde",
					spell={ "Chimera Shot", "Overload" }, 
					guide={ st.starterZoneClass, st.shaman.dyadicIcon },
					quest={ ( ( ns.class == "TROLL" ) and 77590 or 77584 ), ( ( ns.class == "ORC" ) and 77585 or 77587 ) },
					questName={ ( ( ns.class == "TROLL" ) and "Rugged Terrain" or "Hunt for the Rune" ), "Icons of Power" } },
	[44003740] = { npc=3114, name="Razormane Battleguard", class={ "HUNTER", "ROGUE", "WARRIOR" }, faction="Horde",
					spell={ "Carve", "Quick Draw", "Devastate" },
					guide={ st.hunter.carve, st.rogue.quickDraw ..st.rogue.quickDrawDur, 
						st.warrior.devastate ..st.warrior.devastateVah }, 
					tip={ "Adder Pheromone", "Bottom-Right Map Piece\n(Drop or Pickpocketing)", "Severed Quillboar Head" } },
	[44203920] = { npc=3113, name="Razormane Dustrunner", class={ "PRIEST" }, faction="Horde",
					spell={ "Homunculi" }, guide={ st.priest.citadel } },
	[45603000] = { name="Dustwind harpies (Various)", class={ "WARRIOR" }, faction="Horde",
					spell={ "Devastate" }, guide={ st.warrior.devastate ..st.warrior.devastateVah },
					tip="Severed Harpy Head" },
	[46190370] = { npc=214070, name="Jornah", faction="Horde",
					class=st.allClass, spell=st.allSpellACA, guide={ st.supplyFaction } },
	[47006280] = { npc=3124, name="Scorpid Worker", class={ "HUNTER", "SHAMAN" }, faction="Horde",
					spell={ "Chimera Shot", "Overload" }, 
					guide={ st.starterZoneClass, st.shaman.dyadicIcon },
					quest={ ( ( ns.class == "TROLL" ) and 77590 or 77584 ), ( ( ns.class == "ORC" ) and 77585 or 77587 ) },
					questName={ ( ( ns.class == "TROLL" ) and "Rugged Terrain" or "Hunt for the Rune" ), "Icons of Power" } },
	[47404960] = { name="Razormane mobs (Various)", class={ "HUNTER" }, spell={ "Carve" },
					guide={ st.hunter.carve } },
	[47608060] = { name="Kolkar centaurs (Various)", class={ "WARRIOR" }, faction="Horde",
					spell={ "Devastate" }, guide={ st.warrior.devastate ..st.warrior.devastateVah },
					tip="Severed Centaur Head" },
	[47804740] = { name="Razormane Quillboar/Scout", class={ "HUNTER", "ROGUE", "WARRIOR" }, faction="Horde",
					spell={ "Carve", "Quick Draw", "Devastate" },
					guide={ st.hunter.carve, st.rogue.quickDraw ..st.rogue.quickDrawDur, 
						st.warrior.devastate ..st.warrior.devastateVah }, 
					tip={ "Adder Pheromone", "Bottom-Right Map Piece\n(Drop or Pickpocketing)", "Severed Quillboar Head" } },
	[48007960] = { npc=204827, name="Adventurer's Remains", class={ "DRUID", "PALADIN", "PRIEST", "SHAMAN" }, faction="Horde",
					spell={ "Lifebloom", "Inspiration Exemplar", "Prayer of Mending", "Ancestral Guidance" }, guide={ st.woundedAdventurer } },
	[48603300] = { name="Dustwind harpies (Various)", class={ "WARRIOR" }, faction="Horde",
					spell={ "Devastate" }, guide={ st.warrior.devastate ..st.warrior.devastateVah },
					tip="Severed Harpy Head" },
	[49407980] = { npc=5808, name="Warlord Kolkanis", class={ "MAGE", "PRIEST" }, faction="Horde",
					spell={ "Fingers of Frost", "Shared Pain" }, guide={ st.mage.fingers, st.priest.sharedPain } },
	[49602120] = { name="Dustwind harpies (Various)", class={ "WARRIOR" }, faction="Horde",
					spell={ "Devastate" }, guide={ st.warrior.devastate ..st.warrior.devastateVah },
					tip="Severed Harpy Head" },
	[50002740] = { name="Dustwind harpies (Various)", class={ "WARRIOR" }, faction="Horde",
					spell={ "Devastate" }, guide={ st.warrior.devastate ..st.warrior.devastateVah },
					tip="Severed Harpy Head" },
	[50005160] = { name="Lightning Infused Totem", class={ "SHAMAN" }, faction="Horde",
					spell={ "Shield Mastery" }, guide={ st.shaman.galvanicIcon } },
	[51408460] = { name="Makrura (Various)", class={ "WARLOCK" }, faction="Horde",
					spell={ "Demonic Grace" }, guide={ st.warlock.grace ..st.warlock.graceDur }, tip="Makrura Leg" },
	[51601900] = { npc=3118, name="Dustwind Storm Witch", class={ "WARLOCK" }, faction="Horde",
					spell={ "Demonic Grace" }, guide={ st.warlock.grace ..st.warlock.graceDur }, tip="Ominous Tome" },
	[51806580] = { name="Burning Blade (Various)", class={ "MAGE", "ROGUE" }, faction="Horde",
					spell={ "Living Flame", "Quick Draw" }, tip={ nil, "Pick Pocket or Kill. Top-Left Map Piece" },
					guide={ st.mage.livingFlame, st.rogue.quickDraw ..st.rogue.quickDrawDur } },
	[51910959] = { npc=3204, name="Gazz'uz", class={ "MAGE", "PRIEST", "WARLOCK", "WARRIOR" }, faction="Horde",
					spell={ "Fingers of Frost", "Shared Pain", "Soul Siphon", "Furious Thunder" },
					guide={ st.mage.fingers, st.priest.sharedPain, st.warlock.soulSiphon, st.warrior.furiousThunder },
					tip="He's level 14 and has a Voidwalker.\nSeveral classes need him!" },
	[52005840] = { npc=208036, name="Ba'so", class={ "ROGUE" }, faction="Horde", spell={ "Mutilate" },
					tip="West of Tiragarde Keep, at the hills", guide={ st.rogue.mutilate } },
	[52164401] = { npc=208184, name="Razzil", class={ "HUNTER" }, spell={ "Carve" },
					guide={ st.hunter.carve } },					
	[52202680] = { name="Burning Blade mobs (Various)", class={ "MAGE", "ROGUE", "ROGUE" }, faction="Horde",
					spell={ "Living Flame", "Mutilate", "Quick Draw" },
					tip={ "Ignore the map. To get to here, exit\nfrom Razor Hill and take the eastern\npath that goes up and north",
						"Pick Pocket. Don't need to kill", nil },					
					guide={ st.mage.livingFlame, st.rogue.mutilate, st.rogue.quickDraw ..st.rogue.quickDrawDur } },
	[52408260] = { name="Kolkar centaurs (Various)", class={ "WARRIOR" }, faction="Horde",
					spell={ "Devastate" }, guide={ st.warrior.devastate ..st.warrior.devastateVah },
					tip="Severed Centaur Head" },
	[52600880] = { npc=5822, name="Felweaver Scornn", class={ "PRIEST", "WARRIOR" }, faction="Horde",
					tip="Rare spawn. Huge clear needed to get to the\nlocation and then... likely not there. Whatever,\n"
						.."your call. Take the right side path and always\ngo upwards",
					spell={ "Shared Pain", "Furious Thunder" }, guide={ st.priest.sharedPain, st.warrior.furiousThunder } },
	[52607640] = { name="Kolkar centaurs (Various)", class={ "WARRIOR" }, faction="Horde",
					spell={ "Devastate" }, guide={ st.warrior.devastate ..st.warrior.devastateVah },
					tip="Severed Centaur Head" },
	[52852903] = { name="Dustwind Cave mobs (various)", class={ "ROGUE" }, faction="Horde",
					spell={ "Mutilate" }, guide={ st.rogue.mutilate } },
	[52880756] = { npc=3198, name="Burning Blade Apprentice", class={ "WARLOCK" }, faction="Horde",
					spell={ "Demonic Grace" }, tip="Ominous Tome", guide={ st.warlock.grace ..st.warlock.graceDur } },
	[52900750] = { name="Burning Blade (Various)", class={ "MAGE", "ROGUE", "ROGUE" }, faction="Horde",
					spell={ "Living Flame", "Mutilate", "Quick Draw" },
					tip={ nil, "Must Pick Pocket the \"Note from Ba'so\"", "Pick Pocket or Kill. Top-Left Map Piece" },
					guide={ st.mage.livingFlame, st.rogue.mutilate, st.rogue.quickDraw ..st.rogue.quickDrawDur } },
	[53144352] = { npc=207957, name="Vahi Bonesplitter", class={ "WARRIOR" }, faction="Horde",
					spell={ "Devastate" }, guide={ st.warrior.devastate ..st.warrior.devastateVah } },
	[53202460] = { npc=3118, name="Dustwind Storm Witch", class={ "WARLOCK" }, faction="Horde",
					spell={ "Demonic Grace" }, guide={ st.warlock.grace ..st.warlock.graceDur }, tip="Ominous Tome" },
	[54002700] = { name="Dustwind harpies (Various)", class={ "WARRIOR" }, faction="Horde",
					spell={ "Devastate" }, guide={ st.warrior.devastate ..st.warrior.devastateVah },
					tip="Severed Harpy Head" },
	[53742714] = { object=387466, name="Rusty Lockbox", class={ "ROGUE" }, faction="Horde",
					spell={ "Slaughter from the Shadows" }, guide={ st.rogue.slaughter },
					tip= "Approach from Razor Hill: Go north but veer right and up.\n"
							.."When you get to a clearing/plateau you'll see a cave in\n"
							.."the distance. Veer to the right of the cave. You'll come\n"
							.."to smoother textured rocks. Jump across for your lewt!\n"
							.."Trust the pin location - it's very precise!\n\n"
							.."Directly below is a passage back to the central road\n"
							.."between Razor Hill and Orgrimmar. But when you do jump\n"
							.."down off the Lockbox ledge, you'll need to run away\n"
							.."from level 10 harpies" },
	[54002360] = { name="Dustwind harpies (Various)", class={ "WARRIOR" }, faction="Horde",
					spell={ "Devastate" }, guide={ st.warrior.devastate ..st.warrior.devastateVah },
					tip="Severed Harpy Head" },					
	[55040968] = { name="Skull Rock Cave Entrance", class={ "MAGE", "PRIEST", "ROGUE", "ROGUE", "WARLOCK", "WARRIOR" }, faction="Horde",
					spell={ "Living Flame", "Shared Pain", "Mutilate", "Quick Draw", "Demonic Grace", "Furious Thunder" },
					tip={ nil, "Must Pick Pocket the Note from Ba'so", "Pick Pocket or Kill. Top-Left Map Piece", "Ominous Tome" },
					guide={ st.mage.livingFlame, st.priest.sharedPain, st.rogue.mutilate, st.rogue.quickDraw ..st.rogue.quickDrawDur,
						st.warlock.grace ..st.warlock.graceDur, st.warrior.furiousThunder } },						
	[55407277] = { object=208309, name="Loa Altar", class={ "PRIEST" }, faction="Horde",
					tip="/kneel and wait a bit", guide={ st.starterZoneClass ..st.priest.penanceDur}, 
					spell={ "Penance" }, quest={ 77642 }, questName={ "Wisdom of the Loa" } },
	[54674170] = { npc=208226, name="Darmak Bloodhowl", class={ "WARLOCK" }, faction="Horde",
					spell={ "Soul Siphon" }, guide={ st.warlock.soulSiphon }, tip="Behind the Barracks" },
	[55803840] = { npc=203079, name="Wandering Swordsman", class={ "WARRIOR" },
					spell={ "Blood Frenzy" }, guide={ st.warrior.bloodFrenzy } },
	[56602660] = { npc=203079, name="Wandering Swordsman", class={ "WARRIOR" },
					spell={ "Blood Frenzy" }, guide={ st.warrior.bloodFrenzy } },
	[56802160] = { npc=203079, name="Wandering Swordsman", class={ "WARRIOR" },
					spell={ "Blood Frenzy" }, guide={ st.warrior.bloodFrenzy } },
	[57004668] = { name="Lightning Infused Totem", class={ "SHAMAN" }, faction="Horde",
					spell={ "Shield Mastery" }, guide={ st.shaman.galvanicIcon } },
	[57405660] = { name="Kul Tiras Mobs (Various)", class={ "PRIEST", "ROGUE", "WARLOCK" }, faction="Horde",
					spell={ "Void Plague", "Quick Draw", "Demonic Grace" },
					guide={ st.priest.voidPlague, st.rogue.quickDraw ..st.rogue.quickDrawDur, 
						st.warlock.grace ..st.warlock.graceDur },
					tip={ nil, "Pick Pocket or kill. Top-Right Map Piece", "Kul Tiran Skull" } },
	[58704553] = { npc=208275, name="Frozen Makrura", class={ "MAGE", "SHAMAN", "WARLOCK" }, faction="Horde",
					tip="Needs about five separate Fire debuffs to defrost",
					spell={ "Burnout", "Molten Blast", "Chaos Bolt" }, guide={ st.frozen, st.shaman.sulfurousIcon, st.frozen } },
	[58808460] = { name="Makrura (Various)", class={ "WARLOCK" }, faction="Horde",
					spell={ "Demonic Grace" }, guide={ st.warlock.grace ..st.warlock.graceDur }, tip="Makrura Leg" },
	[59005800] = { name="Lightning Infused Totem", class={ "SHAMAN" }, faction="Horde",
					spell={ "Shield Mastery" }, guide={ st.shaman.galvanicIcon } },
	[61006940] = { npc=13157, name="Makasgar", class={ "PRIEST" }, faction="Horde",
					spell={ "Shared Pain" }, guide={ st.priest.sharedPain } },
	[61604500] = { name="Makrura (Various)", class={ "WARLOCK" }, faction="Horde",
					spell={ "Demonic Grace" }, guide={ st.warlock.grace ..st.warlock.graceDur }, tip="Makrura Leg" },
	[61607060] = { name="Makrura (Various)", class={ "WARLOCK" }, faction="Horde",
					spell={ "Demonic Grace" }, guide={ st.warlock.grace ..st.warlock.graceDur }, tip="Makrura Leg" },
	[61609580] = { name="Makrura (Various)", class={ "WARLOCK" }, faction="Horde",
					spell={ "Demonic Grace" }, guide={ st.warlock.grace ..st.warlock.graceDur }, tip="Makrura Leg" },
	[62109480] = { name="Rune of Quick Draw", faction="Horde", class={ "ROGUE" }, tip="Final location",
					spell={ "Quick Draw" }, guide={ st.rogue.quickDraw ..st.rogue.quickDrawDur } },
	[62206520] = { npc=13157, name="Makasgar", class={ "PRIEST" }, faction="Horde",
					spell={ "Shared Pain" }, guide={ st.priest.sharedPain } },
	[62606260] = { name="Makrura (Various)", class={ "WARLOCK" }, faction="Horde",
					spell={ "Demonic Grace" }, guide={ st.warlock.grace ..st.warlock.graceDur }, tip="Makrura Leg" },
	[65605360] = { name="Makrura (Various)", class={ "WARLOCK" }, faction="Horde",
					spell={ "Demonic Grace" }, guide={ st.warlock.grace ..st.warlock.graceDur }, tip="Makrura Leg" },
	[64808050] = { name="Hexed/Voodoo Trolls", class={ "WARLOCK" }, faction="Horde",
					spell={ "Demonic Grace" }, guide={ st.warlock.grace ..st.warlock.graceDur }, tip="Ominous Tome" },
	[65308600] = { name="Hexed/Voodoo Trolls", class={ "WARLOCK" }, faction="Horde",
					spell={ "Demonic Grace" }, guide={ st.warlock.grace ..st.warlock.graceDur }, tip="Ominous Tome" },
	[67007380] = { name="Makrura (Various)", class={ "WARLOCK" }, faction="Horde",
					spell={ "Demonic Grace" }, guide={ st.warlock.grace ..st.warlock.graceDur }, tip="Makrura Leg" },
	[67608360] = { name="Trolls (Various)", faction="Horde", class={ "ROGUE" }, tip="Pick Pocket or kill. Bottom-Left Map Piece",
					spell={ "Quick Draw" }, guide={ st.rogue.quickDraw ..st.rogue.quickDrawDur } },
	[67608780] = { npc=3205, name="Zalazane", class={ "MAGE", "PRIEST" }, faction="Horde",
					spell={ "Fingers of Frost", "Shared Pain" }, guide={ st.mage.fingers, st.priest.sharedPain } },
	[67458782] = { npc=204070, name="Soboz", class={ "WARLOCK" }, faction="Horde",
					tip="The circle is on a rise that's to\nthe south side of Zalazane's camp",
					spell={ "Demonic Grace" }, guide={ st.warlock.grace ..st.warlock.graceDur } },
	[68608280] = { name="Hexed/Voodoo Trolls", class={ "WARLOCK" }, faction="Horde",
					spell={ "Demonic Grace" }, guide={ st.warlock.grace ..st.warlock.graceDur }, tip="Ominous Tome" },
	[68009080] = { name="Makrura (Various)", class={ "WARLOCK" }, faction="Horde",
					spell={ "Demonic Grace" }, guide={ st.warlock.grace ..st.warlock.graceDur }, tip="Makrura Leg" },
	[68707140] = { npc=208124, name="Raluk", class={ "HUNTER" }, spell={ "Flanking Strike" },
					guide={ st.hunter.flankingStrike }, tip="Farm Durotar Pig Meat from nearby Dire Mottled Boars" },
}
points[ 1445 ] = { -- Dustwallow Marsh
	[39403780] = { name="Withervine Elementals (Various)", class={ "SHAMAN" }, spell={ "Maelstrom Weapon" },
					guide={ st.shaman.maelstrom }, quest={ st.shaman.maelstromQ }, questName={ st.shaman.maelstromQN } },
	[39802180] = { name="Withervine Elementals (Various)", class={ "SHAMAN" }, spell={ "Maelstrom Weapon" },
					guide={ st.shaman.maelstrom }, quest={ st.shaman.maelstromQ }, questName={ st.shaman.maelstromQN } },
	[42804320] = { npc=216310, name="Rotting Ancient", class={ "DRUID" }, spell={ "Nourish" }, guide={ st.druid.nourish },
					quest={ { 79348, 79377 } }, questName={ { "The Lost Ancient", "The Lost Saplings" } } },
	[44605640] = { name="Withervine Elementals (Various)", class={ "SHAMAN" }, spell={ "Maelstrom Weapon" },
					guide={ st.shaman.maelstrom }, quest={ st.shaman.maelstromQ }, questName={ st.shaman.maelstromQN } },
	[57202080] = { object=423900, name="Waterlogged Book", class={ "MAGE" },
					spell={ "Spell Power" }, guide={ st.mage.books }, alsoTestQuest=true,
					tip="Discarded on the ground on the\neastern side of the murloc camp",
					quest={ { 79952 } }, questName={ { "RwlRwlRwlRwl" } } },
	[63704250] = { object=424264, name="Grave", class={ "PRIEST" }, tip="Theramore Echo",
					spell={ "Pain Suppression" }, guide={ st.priest.painSuppression } },
	[66604520] = { npc=221575, name="Elrick", class={ "PALADIN" }, faction="Alliance", preRune={ { "Sheath of Light" } },
					quest={ { 81764, 81766 } }, questName={ { "The Mysterious Merchant", "The Bloody Missive" } }, 
					spell={ "Fanaticism" }, guide={ st.paladin.fanaticism }, },
}
points[ 1448 ] = { -- Felwood
	[35305870] = { item=223336, name="Piercing Eye", class={ "PRIEST" }, spell={ "Eye of the Void" },
					quest={ { 82316 } }, questName={ { "Seven Eyes I Seek..." } }, guide={ st.priest.eyeOfVoid } },
	[41304360] = { npc=222408, name="Shadowtooth Emissary", class=st.allClass, spell=st.wildGodsSpells, guide={ st.wildGods },
					quest={ { 82043, 82044 } }, questName={ { "The Wild Gods (Part 1)", "The Wild Gods (Part 2)" } } },
	[42604140] = { name="Infernal / Entropic Beast", class={ "PALADIN" }, preRune={ { "Fanaticism" } },
					quest={ { 81790 } }, questName={ { "Materials of Significance" } }, spell={ "Hammer of the Righteous" },
					guide={ st.paladin.hammerRighteous } },
	[43005700] = { name="Rope / Aeonus", class={ "PALADIN" }, preRune={ { "Fanaticism" } },
					tip="Reports indicate that Aeonus' horse is interactive\nand located at the Emerald Santuary to the south",
					quest={ { 81790 } }, questName={ { "Materials of Significance" } }, spell={ "Hammer of the Righteous" },
					guide={ st.paladin.hammerRighteous } },
	[44605200] = { npc=221636, name="Gregory", class={ "PALADIN" }, preRune={ { "Fanaticism" } },
					quest={ { 81790 } }, questName={ { "Materials of Significance" } }, spell={ "Hammer of the Righteous" },
					guide={ st.paladin.hammerRighteous } },
}
points[ 1444 ] = { -- Feralas
	[22207050] = { name="Treant Avatar / Blightbark", class={ "DRUID" }, spell={ "Efflorescence" },
					guide={ st.druid.efflorescence }, quest={ 81924 }, questName={ "Wisdom of the Guardians" } },
	[23406420] = { name="Hatecrest Mobs (Various)", class=st.allClass, spell=st.allSpellG,
					guide={ st.grizzby }, quest={ 78265 }, questName={ "Fish Oil" } },
	[25404940] = { name="Hatecrest Mobs (Various)", class=st.allClass, spell=st.allSpellG,
					guide={ st.grizzby }, quest={ 78265 }, questName={ "Fish Oil" } },
	[25605580] = { name="Hatecrest Mobs (Various)", class=st.allClass, spell=st.allSpellG,
					guide={ st.grizzby }, quest={ 78265 }, questName={ "Fish Oil" } },
	[27006420] = { name="Hatecrest Mobs (Various)", class=st.allClass, spell=st.allSpellG,
					guide={ st.grizzby }, quest={ 78265 }, questName={ "Fish Oil" } },
	[28607060] = { name="Hatecrest Mobs (Various)", class=st.allClass, spell=st.allSpellG,
					guide={ st.grizzby }, quest={ 78265 }, questName={ "Fish Oil" } },
	[29605260] = { name="Hatecrest Mobs (Various)", class=st.allClass, spell=st.allSpellG,
					guide={ st.grizzby }, quest={ 78265 }, questName={ "Fish Oil" } },
	[32605600] = { name="Hatecrest Mobs (Various)", class=st.allClass, spell=st.allSpellG,
					guide={ st.grizzby }, quest={ 78265 }, questName={ "Fish Oil" } },
	[34004960] = { name="Hatecrest Mobs (Various)", class=st.allClass, spell=st.allSpellG,
					guide={ st.grizzby }, quest={ 78265 }, questName={ "Fish Oil" } },
	[35603350] = { name="Four Pillars", class={ "SHAMAN" }, spell={ "Overcharged" }, guide={ st.shaman.overcharged },
					quest={ { 82073, 82076, 82071, 82074, 82072, 82075, 81960, 81968 } },
					questName={ { "Cleansing Water", "Answering Water's Call", "Purifying Fire", "Answering Fire's Call",
						"Purging Earth", "Answering Earth's Call", "Clarifying Air", "Answering Air's Call" } } },
	[41603840] = { name="Sea Spray / Elemental", class={ "SHAMAN" }, spell={ "Overcharged" },
					guide={ st.shaman.overcharged },
					quest={ { 82073, 82076, 82071, 82074, 82072, 82075, 81960, 81968 } },
					questName={ { "Cleansing Water", "Answering Water's Call", "Purifying Fire", "Answering Fire's Call",
						"Purging Earth", "Answering Earth's Call", "Clarifying Air", "Answering Air's Call" } } },
	[48601250] = { name="Quartermaster Valdane / Field Captain Arunnel", class=st.allClass, spell=st.emeraldSpell,
					guide={ st.nightmareIncursions } },
	[50631568] = { object=441249, name="Book", class={ "MAGE" },
					spell={ "Deep Freeze" }, guide={ st.mage.books }, alsoTestQuest=true,
					tip="You MUST be in the Nightmare /\nEmerald Dream version of Feralas",
					quest={ { 81951 } }, questName={ { "The Liminal and the Arcane" } } },
	[57006000] = { item=221317, name="Feralas Leycryst", class={ "MAGE", "PALADIN", "PRIEST", "WARLOCK" },
					spell={ "Displacement", "Purifying Power", "Despair", "Backdraft" }, guide={ st.leylineGuide },
					tip="At The High Wilderness" },
	[57206900] = { npc=221985, name="Tyrisius", class={ "DRUID" }, spell={ "Efflorescence" },
					guide={ st.druid.efflorescence }, quest={ 81924 }, questName={ "Wisdom of the Guardians" } },
	[57206870] = { item=223337, name="Burning Eye", class={ "PRIEST" }, spell={ "Eye of the Void" },
					quest={ { 82316 } }, questName={ { "Seven Eyes I Seek..." } }, guide={ st.priest.eyeOfVoid },
					tip="In a tower in the Ruins of Isildien" },
	[58705240] = { name="Shrine of the Warden", class={ "DRUID" }, spell={ "Efflorescence" },
					guide={ st.druid.efflorescence }, quest={ 81924 }, questName={ "Wisdom of the Guardians" } },
	[53006000] = { npc=222376, name="Groddoc Infant", class={ "HUNTER" }, spell={ "Catlike Reflexes" },
					guide={ st.hunter.catlike } },
	[59135852] = { npc=222406, name="Groddoc Matriarch", class={ "HUNTER" }, spell={ "Catlike Reflexes" },
					guide={ st.hunter.catlike } },
	[60006680] = { npc=223061, name="Charged Totem", class={ "SHAMAN" }, spell={ "Static Shock" },
					guide={ "Both of you must stand close to the Charged Totem\nso that it may \"arc\" to you. activate it. Kill\n"
						.."the nearby mobs with Nature damage so that you\nbuild up Static Buildup buffs. Stay close to the\n"
						.."Totem!\n\nEventually a Whirling Tempest (L44) will spawn.\nKill. Loot. Profit" } },
	[66405090] = { object=443728, name="Woodpaw Bag", class={ "WARLOCK" }, spell={ "Pandemic" },
					guide={ st.warlock.pandemic } },
	[66603840] = { npc=222286, name="Namida Grimtotem", class={ "DRUID" }, spell={ "Gale Winds" },
					guide={ "Kill and loot. L43e. At the top\nof a trail, in a large hut" } },
	[69604330] = { object=443727, name="Grimtotem Chest", class={ "WARLOCK" }, spell={ "Pandemic" },
					guide={ st.warlock.pandemic } },
	[72605080] = { npc=223123, name="Diseased Forest Walker", class={ "WARLOCK" }, spell={ "Pandemic" },
					guide={ st.warlock.pandemic } },
	[74802490] = { npc=222233, name="Ohk'zi", class={ "WARRIOR" }, spell={ "Rampage" },
					guide={ "From Camp Majache go north and through the\nGordunni Ogre mobs (L40-43) and enter a cave.\n"
						.."Kill Ohk'zi. Loot. Voilà!" } },
	[76604800] = { object=442688, name="Old Crate", class={ "SHAMAN" }, spell={ "Tidal Waves" },
					guide={ st.shaman.tidalWaves } },
	[76606300] = { name="Zukk'ash Mobs (Various)", class={ "MAGE" }, spell={ "Temporal Anomaly" },
					guide={ st.mage.temporal }, quest={ 82082 }, questName={ "A Lesson in Literacy" } },
	[77606200] = { npc=222726, name="Tyrant of the Hive", class={ "WARRIOR" }, spell={ "Vigilance" },
					guide={ "He'll be inside the round chamber. Hits very hard" } },
	[79204950] = { object=442685, name="Old Chest", class={ "SHAMAN" }, spell={ "Tidal Waves" },
					guide={ st.shaman.tidalWaves } },
}
points[ 1450 ] = { -- Moonglade
	[41304360] = { npc=216289, name="Orokai", class={ "DRUID" }, spell={ "Nourish" }, guide={ st.druid.nourish },
					quest={ { 79348, 79377 } }, questName={ { "The Lost Ancient", "The Lost Saplings" } } },
	[52404060] = { npc=12042, name="Loganaar", class={ "DRUID" }, spell={ "Wild Growth" }, guide={ st.druid.wildGrowth },
					quest={ 78229 }, questName={ "Trial of the Owls" } },
}
points[ 1412 ] = { -- Mulgore					
	[29472353] = { name="Windfury Cones", class={ "SHAMAN" }, faction="Horde",
					spell={ "Lava Lash" }, guide={ st.shaman.lavaLash }, quest={ { 76156, 76160, 76240 } },
					questName={ { "Stalk With The Earthmother", "Stalk With The Earthmother", "Stalk With The Earthmother" } },
					tip="Use Taraezor's \"Ground Clutter\" AddOn\nto smoothly toggle GC on/off FTW!" },
	[29802080] = { npc=2965, name="Windfury Matriarch", class={ "WARRIOR" }, faction="Horde",
					spell={ "Devastate" }, guide={ st.warrior.devastate ..st.warrior.devastateVat }, tip="Severed Harpy Head" },
	[30402360] = { npc=5785, name="Sister Hatelash", class={ "WARRIOR" }, faction="Horde",
					spell={ "Furious Thunder" }, guide={ st.warrior.furiousThunder } },
	[30806160] = { npc=207515, name="Lurkmane", class={ "WARRIOR" }, faction="Horde",
					spell={ "Furious Thunder" }, guide={ st.warrior.furiousThunder } },
	[31001980] = { npc=5785, name="Sister Hatelash", class={ "WARRIOR" }, faction="Horde",
					spell={ "Furious Thunder" }, guide={ st.warrior.furiousThunder } },
	[31002280] = { name="Windfury Matriarch/Sorceress", class={ "DRUID" },
					spell={ "Mangle" }, guide={ st.druid.ursineRage } },
	[31602400] = { npc=3056, name="Ghost Howl", class={ "HUNTER" },
					spell={ "Explosive Shot" }, guide={ st.hunter.explosiveShot } },
	[31604950] = { object=404352, name="Artifact Storage", class={ "SHAMAN" }, faction="Horde",
					spell={ "Molten Blast" }, guide={ st.shaman.sulfurousIcon } },
	[31802660] = { npc=2965, name="Windfury Matriarch", class={ "WARRIOR" }, faction="Horde",
					spell={ "Devastate" }, guide={ st.warrior.devastate ..st.warrior.devastateVat }, tip="Severed Harpy Head" },
	[32601980] = { name="Flatland Prowler/Taloned Swoop/Prairie Wolf Alpha", class={ "DRUID" },
					spell={ "Mangle" }, guide={ st.druid.ursineRage } },
	[32602760] = { name="Windfury Matriarch/Sorceress", class={ "DRUID" },
					spell={ "Mangle" }, guide={ st.druid.ursineRage } },
	[33002800] = { npc=3056, name="Ghost Howl", class={ "HUNTER" },
					spell={ "Explosive Shot" }, guide={ st.hunter.explosiveShot } },
	[33406180] = { name="Palemane mobs (Various)", class={ "WARRIOR" }, faction="Horde",
					spell={ "Devastate" }, guide={ st.warrior.devastate ..st.warrior.devastateVat }, 
					tip="Severed Gnoll Head" },
	[33606180] = { name="Palemane mobs (Various)", class={ "HUNTER" }, spell={ "Carve" },
					guide={ st.hunter.carve } },
	[33803980] = { name="Bael'dun Digger/Appraiser", class={ "SHAMAN" }, faction="Horde",
					spell={ "Molten Blast" }, guide={ st.shaman.sulfurousIcon }, tip="Drops the storage key" },
	[34204300] = { name="Windfury mobs (Various)", class={ "WARRIOR" }, faction="Horde",
					spell={ "Devastate" }, guide={ st.warrior.devastate ..st.warrior.devastateVat }, tip="Severed Harpy Head" },
	[34804640] = { name="Bael'dun Digger/Appraiser", class={ "SHAMAN" }, faction="Horde",
					spell={ "Molten Blast" }, guide={ st.shaman.sulfurousIcon }, tip="Drops the storage key" },
	[35126955] = { npc=207577, name="Lunar Stone", class={ "DRUID" }, faction="Horde",
					spell={ "Sunfire" }, guide={ st.druid.runeOfTheSun } },
	[35517057] = { npc=207577, name="Lunar Stone", class={ "DRUID" }, faction="Horde",
					spell={ "Sunfire" }, guide={ st.druid.runeOfTheSun } },
	[35606360] = { name="Palemane mobs (Various)", class={ "WARRIOR" }, faction="Horde",
					spell={ "Devastate" }, guide={ st.warrior.devastate ..st.warrior.devastateVat }, 
					tip="Severed Gnoll Head" },
	[35606808] = { npc=207577, name="Lunar Stone", class={ "DRUID" }, faction="Horde",
					spell={ "Sunfire" }, guide={ st.druid.runeOfTheSun } },
	[35652049] = { npc=207743, name="Netali Proudwind", class={ "WARRIOR" }, faction="Horde",
					spell={ "Frenzied Assault" }, guide={ st.warrior.frenziedAssault },
					tip="Speak to Netali first, and\nthen speak to Mooart, nearby" },
	[35704160] = { name="Mazzranache / Ghost Howl", class={ "HUNTER" },
					spell={ "Explosive Shot" }, guide={ st.hunter.explosiveShot } },
	[36005700] = { npc=205382, name="Mokwa", class={ "HUNTER" }, spell={ "Flanking Strike" },
					guide={ st.hunter.flankingStrike }, tip="Farm Mulgore Bird Meat from nearby Swoops" },
	[36600960] = { npc=2965, name="Windfury Matriarch", class={ "WARRIOR" }, faction="Horde",
					spell={ "Devastate" }, guide={ st.warrior.devastate ..st.warrior.devastateVat }, tip="Severed Harpy Head" },
	[36800940] = { name="Windfury Matriarch/Sorceress", class={ "DRUID" },
					spell={ "Mangle" }, guide={ st.druid.ursineRage } },
	[37201260] = { npc=5785, name="Sister Hatelash", class={ "WARRIOR" }, faction="Horde",
					spell={ "Furious Thunder" }, guide={ st.warrior.furiousThunder } },
	[37401860] = { name="Flatland Prowler/Taloned Swoop/Prairie Wolf Alpha", class={ "DRUID" },
					spell={ "Mangle" }, guide={ st.druid.ursineRage } },
	[37505250] = { name="Lightning Infused Totem", class={ "SHAMAN" }, faction="Horde",
					spell={ "Shield Mastery" }, guide={ st.shaman.galvanicIcon } },
	[37604950] = { npc=206248, name="Wooden Effigy", class={ "DRUID" }, faction="Horde",
					spell={ "Living Seed" }, tip="Approximately a 5 min timer", guide={ st.druid.naturalPotential } },
	[37812768] = { npc=214096, name="Dokimi", faction="Horde",
					class=st.allClass, spell=st.allSpellACA, guide={ st.supplyFaction } },
	[37823022] = { npc=205729, name="Boarton Shadetotem", class={ "SHAMAN" }, faction="Horde",
					spell={ "Lava Lash" }, guide={ st.shaman.lavaLash }, quest={ { 76156, 76160, 76240 } },
					questName={ { "Stalk With The Earthmother", "Stalk With The Earthmother", "Stalk With The Earthmother" } },
					tip="\"Hmm... perhaps disguises are not your strength\"" }, -- Location based upon online screencap
	[38001440] = { npc=3056, name="Ghost Howl", class={ "HUNTER" },
					spell={ "Explosive Shot" }, guide={ st.hunter.explosiveShot } },
	[39401260] = { name="Flatland Prowler/Taloned Swoop/Prairie Wolf Alpha", class={ "DRUID" },
					spell={ "Mangle" }, guide={ st.druid.ursineRage } },
	[39600520] = { npc=2965, name="Windfury Matriarch", class={ "WARRIOR" }, faction="Horde",
					spell={ "Devastate" }, guide={ st.warrior.devastate ..st.warrior.devastateVat }, tip="Severed Harpy Head" },
	[39885161] = { item=206469, name="Prairie Flower", class={ "DRUID" }, faction="Horde",
					spell={ "Living Seed" }, tip="Various locations", guide={ st.druid.naturalPotential } },
	[40004400] = { name="Mazzranache / Ghost Howl", class={ "HUNTER" },
					spell={ "Explosive Shot" }, guide={ st.hunter.explosiveShot } },
	[40405380] = { npc=203079, name="Wandering Swordsman", class={ "WARRIOR" },
					spell={ "Blood Frenzy" }, guide={ st.warrior.bloodFrenzy } },
	[41212627] = { npc=3028, name="Kah Mistrunner", class={ "SHAMAN" }, faction="Horde",
					spell={ "Lava Lash" }, guide={ st.shaman.lavaLash }, quest={ { 76156, 76160, 76240 } },
					questName={ { "Stalk With The Earthmother", "Stalk With The Earthmother", "Stalk With The Earthmother" } },
					tip="If you need to learn fishing. You do of\ncourse use my Cod Do Batter fishing AddOn?" },
	[41366326] = { item=206469, name="Prairie Flower", class={ "DRUID" }, faction="Horde",
					spell={ "Living Seed" }, tip="Various locations", guide={ st.druid.naturalPotential } },
	[42201480] = { npc=2979, name="Venture Co Supervisor", class={ "DRUID" }, faction="Horde",
					spell={ "Mangle" }, guide={ st.druid.ursineRage } },
	[42802000] = { name="Flatland Prowler/Taloned Swoop/Prairie Wolf Alpha", class={ "DRUID" },
					spell={ "Mangle" }, guide={ st.druid.ursineRage } },
	[44267569] = { npc=3061, name="Lanka Farshot", class={ "HUNTER" }, faction="Horde",
					spell={ "Chimera Shot" }, guide={ st.starterZoneClass },
					quest={ 77949 }, questName={ "A Hunter's Strength" } },
	[44964688] = { item=206469, name="Prairie Flower", class={ "DRUID" }, faction="Horde",
					spell={ "Living Seed" }, tip="Various locations", guide={ st.druid.naturalPotential } },
	[45027594] = { npc=3062, name="Meela Dawnstrider", class={ "SHAMAN" }, faction="Horde",
					faction="Horde",
					spell={ "Overload" }, quest={ 77652 }, questName={ "Icons of Power" }, guide={ st.shaman.dyadicIcon } },
	[45103210] = { name="Flatland Prowler/Taloned Swoop/Prairie Wolf Alpha", class={ "DRUID" },
					spell={ "Mangle" }, guide={ st.druid.ursineRage } },
	[45403700] = { npc=203079, name="Wandering Swordsman", class={ "WARRIOR" },
					spell={ "Blood Frenzy" }, guide={ st.warrior.bloodFrenzy } },
	[45604190] = { name="Mazzranache / Ghost Howl", class={ "HUNTER" },
					spell={ "Explosive Shot" }, guide={ st.hunter.explosiveShot } },
	[45806820] = { npc=5786, name="Snagglespear", class={ "WARRIOR" }, faction="Horde",
					spell={ "Furious Thunder" }, guide={ st.warrior.furiousThunder } },
	[46196044] = { npc=205635, name="Takoda Sunmane", class={ "HUNTER" }, spell={ "Carve" },
					guide={ st.hunter.carve } },
	[46406180] = { npc=207637, name="Vateya Timberhoof", class={ "WARRIOR" }, faction="Horde",
					spell={ "Devastate" }, guide={ st.warrior.devastate ..st.warrior.devastateVat }, },
	[47501780] = { name="Flatland Prowler / Taloned Swoop / Prairie Wolf Alpha", class={ "DRUID" },
					spell={ "Mangle" }, guide={ st.druid.ursineRage } },
	[48100900] = { name="Flatland Prowler/Taloned Swoop/Prairie Wolf Alpha", class={ "DRUID" },
					spell={ "Mangle" }, guide={ st.druid.ursineRage } },
	[48207240] = { name="Palemane mobs (Various)", class={ "HUNTER" }, spell={ "Carve" },
					guide={ st.hunter.carve } },
	[48607360] = { name="Palemane mobs (Various)", class={ "WARRIOR" }, faction="Horde",
					spell={ "Devastate" }, guide={ st.warrior.devastate ..st.warrior.devastateVat }, 
					tip="Severed Gnoll Head" },
	[49601920] = { name="Arra'chea / The Rake", class={ "HUNTER", "WARRIOR" },
					spell={ "Explosive Shot", "Furious Thunder" },
					guide={ st.hunter.explosiveShot, st.warrior.furiousThunder } },
	[50006880] = { npc=5786, name="Snagglespear", class={ "WARRIOR" }, faction="Horde",
					spell={ "Furious Thunder" }, guide={ st.warrior.furiousThunder } },
	[50944598] = { item=206469, name="Prairie Flower", class={ "DRUID" }, faction="Horde",
					spell={ "Living Seed" }, tip="Various locations", guide={ st.druid.naturalPotential } },
	[51001620] = { npc=3056, name="Ghost Howl", class={ "HUNTER" },
					spell={ "Explosive Shot" }, guide={ st.hunter.explosiveShot } },
	[51206000] = { npc=2965, name="Windfury Matriarch", class={ "WARRIOR" }, faction="Horde",
					spell={ "Devastate" }, guide={ st.warrior.devastate ..st.warrior.devastateVat }, tip="Severed Harpy Head" },
	[51603290] = { name="Flatland Prowler/Taloned Swoop/Prairie Wolf Alpha", class={ "DRUID" },
					spell={ "Mangle" }, guide={ st.druid.ursineRage } },
	[51603300] = { npc=3058, name="Arra'chea", class={ "HUNTER", "WARRIOR" },
					spell={ "Explosive Shot", "Furious Thunder" },
					guide={ st.hunter.explosiveShot, st.warrior.furiousThunder } },
	[51746717] = { item=206469, name="Prairie Flower", class={ "DRUID" }, faction="Horde",
					spell={ "Living Seed" }, tip="Various locations", guide={ st.druid.naturalPotential } },
	[51803920] = { npc=203079, name="Wandering Swordsman", class={ "WARRIOR" },
					spell={ "Blood Frenzy" }, guide={ st.warrior.bloodFrenzy } },
	[52600540] = { name="Windfury Matriarch/Sorceress", class={ "DRUID" },
					spell={ "Mangle" }, guide={ st.druid.ursineRage } },
	[53007400] = { npc=5786, name="Snagglespear", class={ "WARRIOR" }, faction="Horde",
					spell={ "Furious Thunder" }, guide={ st.warrior.furiousThunder } },
	[53004460] = { npc=3068, name="Mazzranache", class={ "HUNTER" },
					spell={ "Explosive Shot" }, guide={ st.hunter.explosiveShot } },
	[53402160] = { name="Flatland Prowler / Taloned Swoop / Prairie Wolf Alpha", class={ "DRUID" },
					spell={ "Mangle" }, guide={ st.druid.ursineRage } },
	[53480937] = { name="Windfury Cones", class={ "SHAMAN" }, faction="Horde",
					spell={ "Lava Lash" }, guide={ st.shaman.lavaLash }, quest={ { 76156, 76160, 76240 } },
					questName={ { "Stalk With The Earthmother", "Stalk With The Earthmother", "Stalk With The Earthmother" } },
					tip="Use Taraezor's \"Ground Clutter\" AddOn\nto smoothly toggle GC on/off FTW!" },
	[54601540] = { npc=3058, name="Arra'chea / Sister Hatelash", class={ "HUNTER", "WARRIOR" },
					spell={ "Explosive Shot", "Furious Thunder" },
					guide={ st.hunter.explosiveShot, st.warrior.furiousThunder } },
	[55001100] = { npc=2965, name="Windfury Matriarch", class={ "WARRIOR" }, faction="Horde",
					spell={ "Devastate" }, guide={ st.warrior.devastate ..st.warrior.devastateVat }, tip="Severed Harpy Head" },
	[55002200] = { npc=3058, name="Arra'chea / The Rake", class={ "HUNTER", "WARRIOR" },
					spell={ "Explosive Shot", "Furious Thunder" },
					guide={ st.hunter.explosiveShot, st.warrior.furiousThunder } },
	[55407100] = { name="Palemane mobs (Various)", class={ "HUNTER" }, spell={ "Carve" },
					guide={ st.hunter.carve } },
	[55606980] = { npc=5786, name="Snagglespear", class={ "WARRIOR" }, faction="Horde",
					spell={ "Furious Thunder" }, guide={ st.warrior.furiousThunder } },
	[55807300] = { name="Palemane mobs (Various)", class={ "WARRIOR" }, faction="Horde",
					spell={ "Devastate" }, guide={ st.warrior.devastate ..st.warrior.devastateVat }, 
					tip="Severed Gnoll Head" },
	[56003300] = { name="Flatland Prowler/Taloned Swoop/Prairie Wolf Alpha", class={ "DRUID" },
					spell={ "Mangle" }, guide={ st.druid.ursineRage } },
	[56001550] = { name="Windfury Matriarch / Sorceress / Flatland Prowler /\nTaloned Swoop / Prairie Wolf Alpha", class={ "DRUID" },
					spell={ "Mangle" }, guide={ st.druid.ursineRage } },
	[58885118] = { item=206469, name="Prairie Flower", class={ "DRUID" }, faction="Horde",
					spell={ "Living Seed" }, tip="Various locations", guide={ st.druid.naturalPotential } },
	[59005460] = { npc=205692, name="Rustling Bush", class={ "HUNTER" }, faction="Horde",
					spell={ "Master Marksman" }, guide={ st.hunter.masterMark } },
	[60087535] = { object=403102, name="Bristleback Loot Cache", class={ "DRUID", "WARRIOR" }, faction="Horde",
					spell={ "Fury of Stormrage", "Victory Rush" },
					guide={ st.druid.lunarIdolH, st.starterZoneClass }, tip="The path begins here" },
	[60206760] = { npc=203079, name="Wandering Swordsman", class={ "WARRIOR" },
					spell={ "Blood Frenzy" }, guide={ st.warrior.bloodFrenzy } },
	[60403360] = { npc=204827, name="Adventurer's Remains", class={ "DRUID", "PALADIN", "PRIEST", "SHAMAN" }, faction="Horde",
					spell={ "Lifebloom", "Inspiration Exemplar", "Prayer of Mending", "Ancestral Guidance" }, guide={ st.woundedAdventurer } },
	[60608020] = { npc=2954, name="Bristleback Battleboar", class={ "HUNTER" }, faction="Horde",
					spell={ "Chimera Shot" }, guide={ st.starterZoneClass },
					quest={ 77949 }, questName={ "A Hunter's Strength" } },
	[60802040] = { name="Bristleback Interloper / Windfury Matriarch", class={ "WARRIOR" }, faction="Horde",
					spell={ "Devastate" }, guide={ st.warrior.devastate ..st.warrior.devastateVat },
					tip="Severed Quillboar Head" },
	[60902500] = { npc=3232, name="Bristleback Interloper / Flatland Prowler/\nTaloned Swoop / Prairie Wolf Alpha",
					class={ "DRUID" }, faction="Horde", spell={ "Mangle" }, guide={ st.druid.ursineRage } },
	[61004700] = { item=206157, name="Seaforium Mining Charges", class={ "SHAMAN" }, faction="Horde",
					spell={ "Lava Lash" }, guide={ st.shaman.lavaLash }, quest={ { 76156, 76160, 76240 } },
					questName={ { "Stalk With The Earthmother", "Stalk With The Earthmother", "Stalk With The Earthmother" } },
					tip="\"It doesn't seem like much of a disguise...\"" },
	[61407060] = { name="Flatland Prowler/Taloned Swoop/Prairie Wolf Alpha", class={ "DRUID" },
					spell={ "Mangle" }, guide={ st.druid.ursineRage } },
	[61604780] = { npc=2979, name="Venture Co Supervisor", class={ "DRUID" }, faction="Horde",
					spell={ "Mangle" }, guide={ st.druid.ursineRage } },
	[61607200] = { name="Windfury mobs (Various)", class={ "WARRIOR" }, faction="Horde",
					spell={ "Devastate" }, guide={ st.warrior.devastate ..st.warrior.devastateVat }, tip="Severed Harpy Head" },
	[61617603] = { object=403102, name="Bristleback Loot Cache", class={ "DRUID", "WARRIOR" }, faction="Horde",
					spell={ "Fury of Stormrage", "Victory Rush" },
					guide={ st.druid.lunarIdolH, st.starterZoneClass }, tip="High up, no need for parkour!" },
	[61706540] = { name="Flatland Prowler/Taloned Swoop/Prairie Wolf Alpha", class={ "DRUID" },
					spell={ "Mangle" }, guide={ st.druid.ursineRage } },
	[62004220] = { npc=2979, name="Venture Co Supervisor", class={ "DRUID" }, faction="Horde",
					spell={ "Mangle" }, guide={ st.druid.ursineRage } },
	[63405960] = { name="Flatland Prowler/Taloned Swoop/Prairie Wolf Alpha", class={ "DRUID" },
					spell={ "Mangle" }, guide={ st.druid.ursineRage } },
	[63607640] = { npc=2953, name="Bristleback Shaman", class={ "SHAMAN" }, faction="Horde",
					faction="Horde",
					spell={ "Overload" }, quest={ 77652 }, questName={ "Icons of Power" }, guide={ st.shaman.dyadicIcon } },
	[67006600] = { name="Lightning Infused Totem", class={ "SHAMAN" }, faction="Horde",
					spell={ "Shield Mastery" }, guide={ st.shaman.galvanicIcon } },
	[67806920] = { name="Windfury mobs (Various)", class={ "WARRIOR" }, faction="Horde",
					spell={ "Devastate" }, guide={ st.warrior.devastate ..st.warrior.devastateVat }, tip="Severed Harpy Head" },
}
points[ 1454 ] = { -- Orgrimmar
	[38707840] = { object=405149, name="Mural of Ta'zo", class={ "MAGE" }, faction="Horde", alsoTestQuest=true,
					spell={ "Icy Veins" }, guide={ st.mage.books }, quest={ 79094 }, questName={ "The Lessons of Ta'zo" },
					tip="It's a large rock tablet with red writing, leaning against the wall.\n"
						.."Valley of Spirits. On the left side as you approach the Mage trainers" },
	[39003800] = { npc=4047, name="Zor Lonetree", class={ "SHAMAN" }, spell={ "Fire Nova" }, guide={ st.shaman.fireNova } },
	[51646370] = { npc=214070, name="Jornah", faction="Horde",
					class=st.allClass, spell=st.allSpellACA, guide={ st.supplyFaction } },
	[55864491] = { object=404830, name="Dusty Chest", class={ "ROGUE" }, faction="Horde",
					spell={ "Slaughter from the Shadows" }, guide={ st.rogue.precision },
					tip="The Drag, across from The\nValley of Honor archway" },
	[57395395] = { npc=3399, name="Zamja", class={ "WARRIOR" }, faction="Horde",
					spell={ "Frenzied Assault" }, guide={ st.warrior.frenziedAssault },
					tip="Speak to Zamja first, and then speak to\nGru'ark who is just outside" },
	[58085119] = { npc=208023, name="Gru'ark", class={ "WARRIOR" }, faction="Horde", spell={ "Frenzied Assault" },
					guide={ st.warrior.frenziedAssault }, tip= "Upper level - same level as Zamja" },
}
points[ 1442 ] = { -- Stonetalon Mountains
	[27406520] = { name="Earth/Fire Elementals (Various)", class={ "SHAMAN" }, faction="Horde",
					spell={ "Earth Shield" }, quest={ { 78506, 78537, 78561, 78575 } },
					questName={ { "Elemental Distress", "Elixir of Insight", "Elixir of Insight", "Hirzek" } },
					guide={ st.shaman.earthShield }, tip="Mote of Infernal/Seismic Rage" },
	[28207120] = { name="Earth/Fire Elementals (Various)", class={ "SHAMAN" }, faction="Horde",
					spell={ "Earth Shield" }, quest={ { 78506, 78537, 78561, 78575 } },
					questName={ { "Elemental Distress", "Elixir of Insight", "Elixir of Insight", "Hirzek" } },
					guide={ st.shaman.earthShield }, tip="Mote of Infernal/Seismic Rage" },
	[28407240] = { npc=212837, name="Primordial Anomaly", class={ "SHAMAN" }, faction="Horde",
					spell={ "Shamanistic Rage" }, guide={ st.shaman.runeFury } },
	[28606200] = { npc=212837, name="Primordial Anomaly", class={ "SHAMAN" }, faction="Horde",
					spell={ "Shamanistic Rage" }, guide={ st.shaman.runeFury } },
	[30206820] = { name="Earth/Fire Elementals (Various)", class={ "SHAMAN" }, faction="Horde",
					spell={ "Earth Shield" }, quest={ { 78506, 78537, 78561, 78575 } },
					questName={ { "Elemental Distress", "Elixir of Insight", "Elixir of Insight", "Hirzek" } },
					guide={ st.shaman.earthShield }, tip="Mote of Infernal/Seismic Rage" },
	[30606540] = { name="Earth/Fire Elementals (Various)", class={ "SHAMAN" }, faction="Horde",
					spell={ "Earth Shield" }, quest={ { 78506, 78537, 78561, 78575 } },
					questName={ { "Elemental Distress", "Elixir of Insight", "Elixir of Insight", "Hirzek" } },
					guide={ st.shaman.earthShield }, tip="Mote of Infernal/Seismic Rage" },
	[31407360] = { name="Earth/Fire Elementals (Various)", class={ "SHAMAN" }, faction="Horde",
					spell={ "Earth Shield" }, quest={ { 78506, 78537, 78561, 78575 } },
					questName={ { "Elemental Distress", "Elixir of Insight", "Elixir of Insight", "Hirzek" } },
					guide={ st.shaman.earthShield }, tip="Mote of Infernal/Seismic Rage" },
	[32606660] = { npc=212837, name="Primordial Anomaly", class={ "SHAMAN" }, faction="Horde",
					spell={ "Shamanistic Rage" }, guide={ st.shaman.runeFury } },
	[33206980] = { name="Earth/Fire Elementals (Various)", class={ "SHAMAN" }, faction="Horde",
					spell={ "Earth Shield" }, quest={ { 78506, 78537, 78561, 78575 } },
					questName={ { "Elemental Distress", "Elixir of Insight", "Elixir of Insight", "Hirzek" } },
					guide={ st.shaman.earthShield }, tip="Mote of Infernal/Seismic Rage" },
	[34006440] = { name="Earth/Fire Elementals (Various)", class={ "SHAMAN" }, faction="Horde",
					spell={ "Earth Shield" }, quest={ { 78506, 78537, 78561, 78575 } },
					questName={ { "Elemental Distress", "Elixir of Insight", "Elixir of Insight", "Hirzek" } },
					guide={ st.shaman.earthShield }, tip="Mote of Infernal/Seismic Rage" },
	[34207360] = { name="Earth/Fire Elementals (Various)", class={ "SHAMAN" }, faction="Horde",
					spell={ "Earth Shield" }, quest={ { 78506, 78537, 78561, 78575 } },
					questName={ { "Elemental Distress", "Elixir of Insight", "Elixir of Insight", "Hirzek" } },
					guide={ st.shaman.earthShield }, tip="Mote of Infernal/Seismic Rage" },
	[34606060] = { npc=4036, name="Rogue Flame Spirit", class={ "SHAMAN" }, faction="Horde",
					spell={ "Earth Shield" }, quest={ { 78506, 78537, 78561, 78575 } },
					questName={ { "Elemental Distress", "Elixir of Insight", "Elixir of Insight", "Hirzek" } },
					guide={ st.shaman.earthShield }, tip="Mote of Infernal Rage" },
	[35605360] = { npc=4036, name="Rogue Flame Spirit", class={ "SHAMAN" }, faction="Horde",
					spell={ "Earth Shield" }, quest={ { 78506, 78537, 78561, 78575 } },
					questName={ { "Elemental Distress", "Elixir of Insight", "Elixir of Insight", "Hirzek" } },
					guide={ st.shaman.earthShield }, tip="Mote of Infernal Rage" },
	[36006200] = { npc=212837, name="Primordial Anomaly", class={ "SHAMAN" }, faction="Horde",
					spell={ "Shamanistic Rage" }, guide={ st.shaman.runeFury } },
	[36606340] = { name="Earth/Fire Elementals (Various)", class={ "SHAMAN" }, faction="Horde",
					spell={ "Earth Shield" }, quest={ { 78506, 78537, 78561, 78575 } },
					questName={ { "Elemental Distress", "Elixir of Insight", "Elixir of Insight", "Hirzek" } },
					guide={ st.shaman.earthShield }, tip="Mote of Infernal/Seismic Rage" },
	[36606820] = { name="Earth/Fire Elementals (Various)", class={ "SHAMAN" }, faction="Horde",
					spell={ "Earth Shield" }, quest={ { 78506, 78537, 78561, 78575 } },
					questName={ { "Elemental Distress", "Elixir of Insight", "Elixir of Insight", "Hirzek" } },
					guide={ st.shaman.earthShield }, tip="Mote of Infernal/Seismic Rage" },
	[36607240] = { npc=212837, name="Primordial Anomaly", class={ "SHAMAN" }, faction="Horde",
					spell={ "Shamanistic Rage" }, guide={ st.shaman.runeFury } },
	[37204820] = { npc=4036, name="Rogue Flame Spirit", class={ "SHAMAN" }, faction="Horde",
					spell={ "Earth Shield" }, quest={ { 78506, 78537, 78561, 78575 } },
					questName={ { "Elemental Distress", "Elixir of Insight", "Elixir of Insight", "Hirzek" } },
					guide={ st.shaman.earthShield }, tip="Mote of Infernal Rage" },
	[37205000] = { npc=4036, name="Rogue Flame Spirit", class={ "SHAMAN" }, faction="Horde",
					spell={ "Earth Shield" }, quest={ { 78506, 78537, 78561, 78575 } },
					questName={ { "Elemental Distress", "Elixir of Insight", "Elixir of Insight", "Hirzek" } },
					guide={ st.shaman.earthShield }, tip="Mote of Infernal Rage" },
	[37607200] = { name="Earth/Fire Elementals (Various)", class={ "SHAMAN" }, faction="Horde",
					spell={ "Earth Shield" }, quest={ { 78506, 78537, 78561, 78575 } },
					questName={ { "Elemental Distress", "Elixir of Insight", "Elixir of Insight", "Hirzek" } },
					guide={ st.shaman.earthShield }, tip="Mote of Infernal/Seismic Rage" },
	[44003980] = { npc=4036, name="Rogue Flame Spirit", class={ "SHAMAN" }, faction="Horde",
					spell={ "Earth Shield" }, quest={ { 78506, 78537, 78561, 78575 } },
					questName={ { "Elemental Distress", "Elixir of Insight", "Elixir of Insight", "Hirzek" } },
					guide={ st.shaman.earthShield }, tip="Mote of Infernal Rage" },
	[45004360] = { npc=4036, name="Rogue Flame Spirit", class={ "SHAMAN" }, faction="Horde",
					spell={ "Earth Shield" }, quest={ { 78506, 78537, 78561, 78575 } },
					questName={ { "Elemental Distress", "Elixir of Insight", "Elixir of Insight", "Hirzek" } },
					guide={ st.shaman.earthShield }, tip="Mote of Infernal Rage" },
	[59206260] = { npc=210845, name="Jixo Madrocket", class={ "HUNTER" }, spell={ "Kill Command" },
					guide={ st.hunter.killCommand },
					quest={ 78114, 78121 }, questName={ "Wild Wyvern Wrangling", "Wrangling a Wild Wyvern" } },
	[59405100] = { npc=214129, name="Venture Co. Light Shredder", class=st.allClass, spell=st.allSpellG,
					guide={ st.grizzby }, quest={ 78267 }, questName={ "Shredder Turbochargers" } },
	[61006020] = { npc=4011, name="Young Pridewing", class={ "HUNTER" }, spell={ "Kill Command" },
					guide={ st.hunter.killCommand }, tip="After both quests are completed\nyou may tame these. Not too shabby!",
					quest={ 78114, 78121 }, questName={ "Wild Wyvern Wrangling", "Wrangling a Wild Wyvern" } },
	[61206760] = { npc=4011, name="Young Pridewing", class={ "HUNTER" }, spell={ "Kill Command" },
					guide={ st.hunter.killCommand }, tip="After both quests are completed\nyou may tame these. Not too shabby!",
					quest={ 78114, 78121 }, questName={ "Wild Wyvern Wrangling", "Wrangling a Wild Wyvern" } },
	[61605020] = { npc=4011, name="Young Pridewing", class={ "HUNTER" }, spell={ "Kill Command" },
					guide={ st.hunter.killCommand }, tip="After both quests are completed\nyou may tame these. Not too shabby!",
					quest={ 78114, 78121 }, questName={ "Wild Wyvern Wrangling", "Wrangling a Wild Wyvern" } },
	[62605280] = { npc=214129, name="Venture Co. Light Shredder", class=st.allClass, spell=st.allSpellG,
					guide={ st.grizzby }, quest={ 78267 }, questName={ "Shredder Turbochargers" } },
	[65205760] = { npc=4011, name="Young Pridewing", class={ "HUNTER" }, spell={ "Kill Command" },
					guide={ st.hunter.killCommand }, tip="After both quests are completed\nyou may tame these. Not too shabby!",
					quest={ 78114, 78121 }, questName={ "Wild Wyvern Wrangling", "Wrangling a Wild Wyvern" } },
	[66604760] = { npc=214129, name="Venture Co. Light Shredder", class=st.allClass, spell=st.allSpellG,
					guide={ st.grizzby }, quest={ 78267 }, questName={ "Shredder Turbochargers" } },
	[67405740] = { npc=214129, name="Venture Co. Light Shredder", class=st.allClass, spell=st.allSpellG,
					guide={ st.grizzby }, quest={ 78267 }, questName={ "Shredder Turbochargers" } },
	[70605580] = { npc=214129, name="Venture Co. Light Shredder", class=st.allClass, spell=st.allSpellG,
					guide={ st.grizzby }, quest={ 78267 }, questName={ "Shredder Turbochargers" } },
	[71004820] = { npc=214129, name="Venture Co. Light Shredder", class=st.allClass, spell=st.allSpellG,
					guide={ st.grizzby }, quest={ 78267 }, questName={ "Shredder Turbochargers" } },
	[72008620] = { npc=11913, name="Grimtotem Sorcerer", class={ "DRUID" },
					spell={ "Wild Strikes" }, tip="Various locations", guide={ st.druid.idolWild } },
	[74408570] = { object=409711, name="Scrolls", class={ "MAGE" },
					spell={ "Icy Veins" }, guide={ st.mage.books }, alsoTestQuest=true,
					quest={ 78149 }, questName={ "Fury of the Land" }, tip="On top of a small barrel in a tent" },
	[74808560] = { npc=11913, name="Grimtotem Sorcerer", class={ "DRUID" },
					spell={ "Wild Strikes" }, tip="Various locations", guide={ st.druid.idolWild } },
	[76609080] = { npc=11913, name="Grimtotem Sorcerer", class={ "DRUID" },
					spell={ "Wild Strikes" }, tip="Various locations", guide={ st.druid.idolWild } },
	[77004340] = { npc=4011, name="Young Pridewing", class={ "HUNTER" }, spell={ "Kill Command" },
					guide={ st.hunter.killCommand }, tip="After both quests are completed\nyou may tame these. Not too shabby!",
					quest={ 78114, 78121 }, questName={ "Wild Wyvern Wrangling", "Wrangling a Wild Wyvern" } },
	[77805260] = { npc=4011, name="Young Pridewing", class={ "HUNTER" }, spell={ "Kill Command" },
					guide={ st.hunter.killCommand }, tip="After both quests are completed\nyou may tame these. Not too shabby!",
					quest={ 78114, 78121 }, questName={ "Wild Wyvern Wrangling", "Wrangling a Wild Wyvern" } },
	[79608580] = { npc=11913, name="Grimtotem Sorcerer", class={ "DRUID" },
					spell={ "Wild Strikes" }, tip="Various locations", guide={ st.druid.idolWild } },
	[80609520] = { npc=11910, name="Grimtotem Ruffian", class={ "DRUID" },
					spell={ "Wild Strikes" }, tip="Various locations", guide={ st.druid.idolWild } },
	[82009040] = { npc=11910, name="Grimtotem Ruffian", class={ "DRUID" },
					spell={ "Wild Strikes" }, tip="Various locations", guide={ st.druid.idolWild } },
	[83608640] = { npc=11910, name="Grimtotem Ruffian", class={ "DRUID" },
					spell={ "Wild Strikes" }, tip="Various locations", guide={ st.druid.idolWild } },
}
points[ 1446 ] = { -- Tanaris
	[30006540] = { npc=5481, name="Thistleshrub Dew Collector", class={ "DRUID" }, spell={ "Improved Barkskin" },
					guide={ st.druid.improvedBarkskin } },
	[43004120] = { npc=222856, name="Odd Totem (south-west)", class={ "SHAMAN" }, spell={ "Rolling Thunder" },
					guide={ "Click on the Odd Totem (southern) which is at\none end of the huge skeleton. You'll receive a\n"
						.."Ghost Wolf 40% speed buff but also a +50% damage\ntaken debuff.\n\n"
						.."You must run quickly to the other end of the\nskeleton and click the Odd Totem there. A chest\n"
						.."will spawn. Open it, loot, profit!\n\nBring friends to distract if you must. Otherwise\n"
						.."just preclear ftw!" } },
	[43803200] = { npc=222243, name="Zopilote", class={ "HUNTER" }, spell={ "Raptor Fury" }, guide={ "Kill Zopilote" } },
	[51602760] = { npc=220984, name="Fizbuz Mithril", class={ "WARRIOR" }, spell={ "Gladiator Stance" },
					guide={ st.warrior.gladiator }, preRune={ { "Blood Frenzy", "Rallying Cry" } },
					quest={ { 81682, 81697, 81801, 81877 } }, 
					questName={ { "The Old Champ", "Defanged", "Return to the Arena", "Fight Night" } } },
	[52803640] = { npc=222243, name="Zopilote", class={ "HUNTER" }, spell={ "Raptor Fury" }, guide={ "Kill Zopilote" } },
	[53802880] = { npc=223591, name="Echo of a Lost Soul", class={ "PRIEST" }, spell={ "Surge of Light" },
					guide={ st.priest.surgeLight } },
	[56407370] = { item=223335, name="Oozing Eye", class={ "PRIEST" }, spell={ "Eye of the Void" },
					quest={ { 82316 } }, questName={ { "Seven Eyes I Seek..." } }, guide={ st.priest.eyeOfVoid },
					tip="In the hive in The Gaping Chasm" },
	[59003650] = { name="Cryptic Scroll of Summoning", class={ "PRIEST", "SHAMAN" },
					spell={ "Pain and Suffering", "Mental Dexterity" }, guide={ st.enragedVoidWalker } },
	[61605420] = { name="Blisterpaw Hyena, Glashide Glazer, Land Rager", class={ "SHAMAN" }, spell={ "Overcharged" },
					guide={ st.shaman.overcharged },
					quest={ { 82073, 82076, 82071, 82074, 82072, 82075, 81960, 81968 } },
					questName={ { "Cleansing Water", "Answering Water's Call", "Purifying Fire", "Answering Fire's Call",
						"Purging Earth", "Answering Earth's Call", "Clarifying Air", "Answering Air's Call" } } },
	[62006260] = { npc=222625, name="Corrupt Moderate Manifestation of Earth", class={ "SHAMAN" }, spell={ "Overcharged" },
					guide={ st.shaman.overcharged },
					quest={ { 82073, 82076, 82071, 82074, 82072, 82075, 81960, 81968 } },
					questName={ { "Cleansing Water", "Answering Water's Call", "Purifying Fire", "Answering Fire's Call",
						"Purging Earth", "Answering Earth's Call", "Clarifying Air", "Answering Air's Call" } } },
	[63803100] = { name="Wastewander mobs (Various)", class={ "PRIEST", "SHAMAN" },
					spell={ "Pain and Suffering", "Mental Dexterity" }, guide={ st.enragedVoidWalker } },
	[67002200] = { npc=8139, name="Jabbey", class={ "ROGUE" }, spell={ "Unfair Advantage" }, guide={ st.rogue.unfair } },
	[72704780] = { object=441248, name="Book", class={ "MAGE" }, tip="In a bookshelf, middle pirate building",
					spell={ "Deep Freeze" }, guide={ st.mage.books }, alsoTestQuest=true,
					quest={ { 81949 } }, questName={ { "Legends of the Tidesages" } } },
	[73404580] = { name="Southsea Pirates (Various)", class={ "ROGUE" }, spell={ "Unfair Advantage" }, guide={ st.rogue.unfair } },
}
points[ 1438 ] = { -- Teldrassil
	[33603560] = { npc=204827, name="Adventurer's Remains", class={ "DRUID", "PALADIN", "PRIEST", "SHAMAN" }, faction="Alliance",
					spell={ "Lifebloom", "Inspiration Exemplar", "Prayer of Mending", "Ancestral Guidance" }, guide={ st.woundedAdventurer } },
	[34802820] = { name="Harpies (Various)", faction="Alliance", class={ "ROGUE" }, faction="Alliance", 
					tip="Pick Pocket or kill. Bottom-Right Map Piece",
					spell={ "Quick Draw" }, guide={ st.rogue.quickDraw ..st.rogue.quickDrawTel } },
	[37908250] = { object=407352, name="Gnarlpine Cache", class={ "ROGUE" }, faction="Alliance",
					spell={ "Between the Eyes" }, guide={ st.rogue.precision } },
	[38604100] = { name="Harpies (Various)", faction="Alliance", class={ "ROGUE" }, faction="Alliance",
					tip="Pick Pocket or kill. Bottom-Right Map Piece",
					spell={ "Quick Draw" }, guide={ st.rogue.quickDraw ..st.rogue.quickDrawTel } },
	[39803740] = { npc=203079, name="Wandering Swordsman", class={ "WARRIOR" },
					spell={ "Blood Frenzy" }, guide={ st.warrior.bloodFrenzy }, faction="Alliance" },
	[39806960] = { npc=203079, name="Wandering Swordsman", class={ "WARRIOR" },
					spell={ "Blood Frenzy" }, guide={ st.warrior.bloodFrenzy }, faction="Alliance" },
	[41607760] = { name="Gnarlpine mobs (Various)", class={ "HUNTER" }, spell={ "Carve" }, faction="Alliance",
					guide={ st.hunter.carve } },
	[42007980] = { name="Gnarlpine mobs (Various)", faction="Alliance", class={ "ROGUE" }, tip="Pick Pocket or kill. Top-Left Map Piece",
					spell={ "Quick Draw" }, guide={ st.rogue.quickDraw ..st.rogue.quickDrawTel } },
	[43203920] = { name="Timberling mobs (Various)", faction="Alliance", class={ "ROGUE" }, tip="Pick Pocket or kill. Top-Right Map Piece",
					spell={ "Quick Draw" }, guide={ st.rogue.quickDraw ..st.rogue.quickDrawTel } },
	[43807700] = { npc=203079, name="Wandering Swordsman", class={ "WARRIOR" },
					spell={ "Blood Frenzy" }, guide={ st.warrior.bloodFrenzy }, faction="Alliance" },
	[44705900] = { object=407734, name="Gnarlpine Cache", class={ "PRIEST", "ROGUE", "WARRIOR" }, faction="Alliance",
					spell={ "Void Plague", "Slaughter from the Shadows", "Furious Thunder" }, tip="Several locations in the Barrows",
					guide={ st.priest.voidPlague, st.rogue.slaughter, st.warrior.furiousThunder } },
	[44805600] = { name="Gnarlpine mobs (Various)", class={ "HUNTER" }, spell={ "Carve" }, faction="Alliance",
					guide={ st.hunter.carve } },
	[45605920] = { npc=7318, name="Rageclaw", class={ "DRUID", "HUNTER" }, faction="Alliance", tip="Bottom of Ban'ethil Barrow",
					spell={ "Mangle", "Explosive Shot" }, guide={ st.druid.ursineRage } },
	[45805820] = { name="Gnarlpine mobs (Various)", faction="Alliance", class={ "ROGUE" }, tip="Pick Pocket or kill. Top-Left Map Piece",
					spell={ "Quick Draw" }, guide={ st.rogue.quickDraw ..st.rogue.quickDrawTel } },
	[46604620] = { npc=209811, name="Rustling Bush", class={ "HUNTER" }, faction="Alliance",
					spell={ "Master Marksman" }, guide={ st.hunter.masterMark } },
	[48303140] = { npc=209928, name="Mowgh", class={ "HUNTER" }, spell={ "Flanking Strike" },
					guide={ st.hunter.flankingStrike }, tip="Farm Teldrassil Bird Meat from nearby Strigid Owls" },
	[52604960] = { npc=2038, name="Lord Melenas", class={ "PRIEST", "ROGUE" }, faction="Alliance",
					spell={ "Shared Pain", "Mutilate" }, guide={ st.priest.sharedPain, st.rogue.mutilate } },
	[52807200] = { name="Timberling mobs (Various)", faction="Alliance", class={ "ROGUE" }, tip="Pick Pocket or kill. Top-Right Map Piece",
					spell={ "Quick Draw" }, guide={ st.rogue.quickDraw ..st.rogue.quickDrawTel } },
	[52807880] = { object=404433, name="Lunar Chest", class={ "DRUID" }, faction="Alliance",
					spell={ "Sunfire" }, guide={ st.druid.runeOfTheSun } },
	[52807980] = { npc=207577, name="Lunar Stone", class={ "DRUID" }, faction="Alliance",
					spell={ "Sunfire" }, guide={ st.druid.runeOfTheSun } },
	[53805040] = { name="Sprite (Various)", faction="Alliance", class={ "PRIEST", "ROGUE" },
					tip={ nil, "Pick Pocket or kill. Bottom-Left Map Piece" },
					spell={ "Homunculi", "Quick Draw" }, guide={ st.priest.citadel, st.rogue.quickDraw ..st.rogue.quickDrawTel } },
	[55004220] = { npc=1989, name="Grellkin", class={ "DRUID" }, faction="Alliance",
					spell={ "Fury of Stormrage" }, guide={ st.druid.lunarIdolA }, quest={ 77571 },
					questName={ "Relics of the Kaldorei" } },
	[55339084] = { name="Rune of Quick Draw", faction="Alliance", class={ "ROGUE" }, tip="Final Rune location. Hollow stump, Rut'theran Village",
					spell={ "Quick Draw" }, guide={ st.rogue.quickDraw ..st.rogue.quickDrawTel } },
	[55403280] = { npc=1986, name="Webwood Spider", class={ "WARRIOR" }, faction="Alliance",
					spell={ "Victory Rush" }, guide={ st.starterZoneClass }, quest={ 77575 },
					questName={ "Amidst the Shadowed Webs" } },
	[55602800] = { npc=1986, name="Webwood Spider", class={ "WARRIOR" }, faction="Alliance",
					spell={ "Victory Rush" }, guide={ st.starterZoneClass }, quest={ 77575 },
					questName={ "Amidst the Shadowed Webs" } },
	[55605980] = { npc=6736, name="Innkeeper Keldamyr", class={ "WARRIOR" }, faction="Alliance",
					spell={ "Frenzied Assault" }, guide={ st.warrior.frenziedAssault },
					tip="Speak to Keldamyr first, and then\nspeak to Syllart, who is upstairs" },
	[56202480] = { npc=1986, name="Webwood Spider", class={ "WARRIOR" }, faction="Alliance",
					spell={ "Victory Rush" }, guide={ st.starterZoneClass }, quest={ 77575 },
					questName={ "Amidst the Shadowed Webs" } },
	[56662631] = { npc=1994, name="Githyiss the Vile", class={ "HUNTER" }, faction="Alliance", tip="Chance of a 6 slot bag!",
					quest={ 77568 }, questName={ "A Hunter's Strength" },
					spell={ "Chimera Shot" }, guide={ st.starterZoneClass } },
	[56605780] = { npc=209872, name="Syllart", class={ "WARRIOR" }, faction="Alliance",
					spell={ "Frenzied Assault" }, guide={ st.warrior.frenziedAssault },
					tip= "He'll be wandering around upstairs. Speak to Inkeeper\nKeldamyr first if you haven't already done so" },
	[57006500] = { item=208609, name="Glade Flower", class={ "DRUID" }, faction="Alliance",
					spell={ "Living Seed" }, tip="Various locations", guide={ st.druid.naturalPotential } },
	[57602900] = { npc=1986, name="Webwood Spider", class={ "WARRIOR" }, faction="Alliance",
					spell={ "Victory Rush" }, guide={ st.starterZoneClass }, quest={ 77575 },
					questName={ "Amidst the Shadowed Webs" } },
	[57802660] = { npc=1986, name="Webwood Spider", class={ "WARRIOR" }, faction="Alliance",
					spell={ "Victory Rush" }, guide={ st.starterZoneClass }, quest={ 77575 },
					questName={ "Amidst the Shadowed Webs" } },
	[58003460] = { npc=1986, name="Webwood Spider", class={ "WARRIOR" }, faction="Alliance",
					spell={ "Victory Rush" }, guide={ st.starterZoneClass }, quest={ 77575 },
					questName={ "Amidst the Shadowed Webs" } },
	[58604040] = { npc=3597, name="Mardant Strongoak", class={ "DRUID" }, faction="Alliance",
					spell={ "Fury of Stormrage" }, guide={ st.druid.lunarIdolA }, quest={ 77571 },
					questName={ "Relics of the Kaldorei" } },
	[58664045] = { npc=3596, name="Ayanna Everstride", class={ "HUNTER" }, faction="Alliance", tip="Inside Aldrassil. Ascend to the first level",
					quest={ 77568 }, questName={ "A Hunter's Strength" },
					spell={ "Chimera Shot" }, guide={ st.starterZoneClass } },
	[59943304] = { name="Moonwell", class={ "PRIEST" }, faction="Alliance",
					tip="/kneel and wait a bit", quest={ 77574 }, questName={ "Meditation on Elune" },
					spell={ "Penance" }, guide={ st.starterZoneClass ..st.priest.penanceTel } },
	[59174044] = { npc=3595, name="Shanda", class={ "PRIEST" }, faction="Alliance",
					tip="Inside Aldrassil Inn. Take the ramp at the entrance.\nShe's at the back",
					quest={ 77574 }, questName={ "Meditation on Elune" },
					spell={ "Penance" }, guide={ st.starterZoneClass ..st.priest.penanceTel } },
	[59643844] = { npc=3593, name="Alyissia", class={ "WARRIOR" }, faction="Alliance", tip="Back room of the Aldrassil Inn, ground level", 
					spell={ "Victory Rush" }, guide={ st.starterZoneClass }, quest={ 77575 },
					questName={ "Amidst the Shadowed Webs" } },
	[59643866] = { npc=3594, name="Frahun Shadewhisper", class={ "ROGUE" }, faction="Alliance",
					tip="Back room of the Aldrassil Inn, ground level",
					quest={ 77573 }, questName={ "Second-Story Work" },
					spell={ "Shadowstrike" }, guide={ st.starterZoneClass } },
	[59684262] = { object=406006, name="Idol", class={ "ROGUE" }, faction="Alliance", tip="First roof, main building. An owl",
					quest={ 77573 }, questName={ "Second-Story Work" },
					spell={ "Shadowstrike" }, guide={ st.starterZoneClass } },
	[61005400] = { item=208609, name="Glade Flower", class={ "DRUID" }, faction="Alliance",
					spell={ "Living Seed" }, tip="Various locations", guide={ st.druid.naturalPotential } },
	[62603680] = { npc=1989, name="Grellkin", class={ "DRUID" }, faction="Alliance",
					spell={ "Fury of Stormrage" }, guide={ st.druid.lunarIdolA }, quest={ 77571 },
					questName={ "Relics of the Kaldorei" } },
	[62607180] = { npc=203079, name="Wandering Swordsman", class={ "WARRIOR" },
					spell={ "Blood Frenzy" }, guide={ st.warrior.bloodFrenzy }, faction="Alliance" }, 
	[66555152] = { item=208609, name="Glade Flower", class={ "DRUID" }, faction="Alliance",
					spell={ "Living Seed" }, tip="Various locations", guide={ st.druid.naturalPotential } },
	[66905770] = { npc=206248, name="Wooden Effigy", class={ "DRUID" }, faction="Alliance",
					spell={ "Living Seed" }, tip="Approximately a 5 min timer", guide={ st.druid.naturalPotential } },
}
points[ 1413 ] = { -- The Barrens
	[43002350] = { object=152608, name="Kolkar's Booty", class={ "DRUID", "MAGE", "SHAMAN" },
					spell={ "Savage Roar", "Regeneration", "Water Shield" }, tip="The nearby centaurs drop a key",
					guide={ st.druid.ferocious, st.shaman.tempestIcon, st.mage.regeneration } },
	[43207860] = { npc=212694, name="Hirzek", class={ "SHAMAN" }, faction="Horde",
					spell={ "Earth Shield" }, quest={ { 78506, 78537, 78561, 78575 } },
					questName={ { "Elemental Distress", "Elixir of Insight", "Elixir of Insight", "Hirzek" } },
					guide={ st.shaman.earthShield } },
	[44303770] = { object=152608, name="Kolkar's Booty", class={ "DRUID", "MAGE", "SHAMAN" },
					spell={ "Savage Roar", "Regeneration", "Water Shield" }, tip="The nearby centaurs drop a key",
					guide={ st.druid.ferocious, st.shaman.tempestIcon, st.mage.regeneration } },
	[44605560] = { npc=209524, name="Patrolling Cheetah", class={ "HUNTER" },
					spell={ "Beast Mastery" }, guide={ st.hunter.beastMastery } },
	[44732217] = { object=407117, name="Abandoned Snapjaw Nest", class={ "DRUID" }, faction="Horde",
					spell={ "Lacerate" }, guide={ st.druid.lacerate } },
	[46203440] = { item=209846, name="Secrets of the Dreamers", class={ "MAGE" },
					spell={ "Icy Veins" }, guide={ st.mage.books }, alsoTestQuest=true,
					quest={ 78143 }, questName={ "Secrets of the Dreamers" },
					tip="Go to the same cavern with the Wailing Caverns\nentrance portal. The scroll is on the opposite side" },
	[48204020] = { name="Oasis Snapjaw Nest/Hatchling", class={ "DRUID" }, faction="Horde",
					spell={ "Lacerate" }, guide={ st.druid.lacerate } },
	[49009600] = { name="Skillbooks", tip="Razorfen Downs", skillBook=true, guide={ st.dungeonDrops }, 
					class={ "DRUID", "DRUID", "DRUID", "HUNTER", "MAGE", "PALADIN", "PRIEST", "PRIEST", "ROGUE", "SHAMAN",
						"WARLOCK", "WARLOCK", "WARRIOR" },	
					spell={ "Deeper Wilds", "Enhanced Restoration", "Revive", "Aspect of the Viper", "Expanded Intellect",
							"Enhanced Blessings", "Increased Fortitude", "Shadowfiend", "Redirect", "Totemic Projection",
							"Portal Summoning", "Soul Harvesting", "Commanding Shout" }, },
	[49205720] = { npc=6247, name="Doan Karhan", class={ "WARLOCK" },
					spell={ "Metamorphosis" }, guide={ st.warlock.metamorphosis },
					quest={ { 1740, 78680, 78681, 78684, 78702 } }, questName={ { "The Orb of Soran'ruk", "Rumors Abound",
						"The Conjuring", "The Mysterious Traveler", "Raszel Ander" } } },
	[49255725] = { npc=213445, name="Raszel Ander", class={ "WARLOCK" },
					tip="Can't see Raszel? Use Metamorphosis",
					spell={ "Grimoire of Synergy" }, guide={ st.warlock.synergy },
					quest={ { 78994, 78914, 79298 } }, questName={ { "A Solid Foundation", "Soul Vessel", "Tempting Fate" } } },
	[52203640] = { npc=218931, name="Dark Rider", name="Dark Rider", tip="Search this area",
					class={ "DRUID", "HUNTER", "MAGE", "PALADIN", "PRIEST", "ROGUE",
					"SHAMAN", "WARLOCK", "WARRIOR" }, spell={ "King of the Jungle", "Melee Specialist", "Missile Barrage",
					"Infusion of Light", "Spirit of the Redeemer", "Waylay", "Two-Handed Mastery", "Demonic Knowledge",
					"Precise Timing" }, guide={ st.dalaranAgent }, quest={ st.dalaranQuest }, questName={ st.dalaranQuestName } },
	[52283108] = { object=208739, name="Horde Warbanner", class={ "WARRIOR" }, faction="Horde",
					tip="To the back of Sergra Darkthorn",
					spell={ "Endless Rage" }, guide={ st.warrior.endlessRage } },
	[54202560] = { name="Razormane Quillboar mobs (Various)", class={ "PRIEST" }, faction="Horde",
					spell={ "Twisted Faith" }, guide={ st.priest.twisted ..st.priest.twistedBarr } },
	[54803580] = { npc=209742, name="Desert Mirage", class={ "PRIEST", "SHAMAN" }, faction="Horde",
					spell={ "Shadow Word: Death", "Way of Earth" }, guide={ "Cast Dispel on it", st.shaman.earthenRune } },
	[55804220] = { name="Oasis Snapjaw Nest/Hatchling", class={ "DRUID" }, faction="Horde",
					spell={ "Lacerate" }, guide={ st.druid.lacerate } },
	[56200860] = { npc=3445, name="Supervisor Lugwizzle", class={ "WARLOCK" },
					spell={ "Shadow Bolt Volley" }, guide={ st.warlock.shadowbolts }, tip="Must use Drain Soul" },
	[56300880] = { object=409700, name="Manual", class={ "MAGE" },
					spell={ "Icy Veins" }, guide={ st.mage.books }, alsoTestQuest=true,
					quest={ 78145 }, questName={ "Arcanic Systems Manual" },
					tip="Control room at the top of the\noil rig in The Sludge Fen" },
	[57080973] = { object=407312, name="Hungry Idol", class={ "WARLOCK" },
					spell={ "Shadow Bolt Volley" }, guide={ st.warlock.shadowbolts }, tip="Must use the Soul of Greed" },
	[57603560] = { npc=209742, name="Desert Mirage", class={ "SHAMAN" }, faction="Horde",
					spell={ "Way of Earth" }, guide={ st.shaman.earthenRune } },
	[57803880] = { npc=209742, name="Desert Mirage", class={ "SHAMAN" }, faction="Horde",
					spell={ "Way of Earth" }, guide={ st.shaman.earthenRune } },
	[58202670] = { name="Altar of Thorns", class={ "WARLOCK" },
					spell={ "Master Channeler" }, guide={ st.warlock.channeling } },
	[61405480] = { npc=209607, name="Lieutenant Stonebrew", class={ "WARRIOR" }, faction="Horde",
					spell={ "Endless Rage" }, guide={ st.warrior.endlessRage },
					tip="Only come here if you obtained the Horde Warbanner\n"
						.."from The Crossroads. Then at Northwatch Hold, replace\n"
						.."the Alliance banner with yours. When Lieutenant\n"
						.."Stonebrew arrives... do what you will FTW!" },
	[61005480] = { name="Crate", class={ "ROGUE" }, faction="Horde",
					tip="In a chest on the Northwatch Hold's stable's roof",
					spell={ "Saber Slash" }, guide={ st.rogue.saberSlash } },
	[61923933] = { npc=211653, name="Grizzby", class=st.allClass, spell=st.allSpellG,
					guide={ st.grizzby }, quest={ { 78267, 78266, 78265 } },
					questName={ { "Shredder Turbochargers", "Dark Iron Ordinance", "Fish Oil" } } },
	[62604620] = { name="Southsea Mobs (Various)", class={ "ROGUE" },
					guide={ st.rogue.bladeDance }, spell={ "Blade Dance" },
					tip={ "Pp for Buccaneer's Matchbox. Now climb the\nhill nearby. Explode the gunpowder!" } },
	[62703630] = { object=211033, name="Goblin Tome", class={ "MAGE" },
					spell={ "Icy Veins" }, guide={ st.mage.books }, alsoTestQuest=true,
					quest={ 79097 }, questName={ "Baxtan: On Destructive Magics" },
					tip="Right next to Gazlove" },
	[62773824] = { npc=3497, name="Kilxx", class={ "HUNTER", "WARRIOR" }, faction="Horde",
					spell={ "Sniper Training", "Quick Strike" },
					guide={ st.hunter.sniper, st.warrior.quickStrike },
					tip="Buy a Fishing Harpoon then swim out to the sunken boat" },
	[63603840] = { npc=209797, name="Bruuz", class={ "HUNTER", "WARRIOR" }, faction="Horde",
					spell={ "Sniper Training", "Quick Strike" },
					guide={ st.hunter.sniper, st.warrior.quickStrike },
					tip="Swimming near the boat. Throw the\nharpoon you bought from Kilxx" },
	[65203960] = { npc=209797, name="Bruuz", class={ "HUNTER", "WARRIOR" }, faction="Horde",
					spell={ "Sniper Training", "Quick Strike" },
					guide={ st.hunter.sniper, st.warrior.quickStrike },
					tip="Swimming near the boat. Throw the\nharpoon you bought from Kilxx" },
}
points[ 1441 ] = { -- Thousand Needles
	[10803990] = { npc=217703, name="Singed Highperch Consort", class={ "MAGE" },
					spell={ "Chronostatic Preservation" }, guide={ st.mage.chronostatic }, },
	[10804080] = { npc=217620, name="Reckless Warlock", class={ "WARLOCK" }, spell={ "Dance of the Wicked" },
					guide={ st.warlock.dance }, },
	[18602090] = { name="Strongboxes", class={ "ROGUE" }, spell={ "Rolling with the Punches" }, guide={ st.rogue.punches } },
	[23504000] = { npc=4118, name="Venomous Cloud Serpent", class={ "SHAMAN" }, tip="3 x Cloud Serpent Fangs",
					spell={ "Decoy Totem" }, guide={ st.shaman.decoyTotem }, },
	[23802340] = { npc=217711, name="Seared Needles Cougar", class={ "MAGE" },
					spell={ "Chronostatic Preservation" }, guide={ st.mage.chronostatic },
					tip="The cougar is caged. You must first\nobtain a key from a Galak Mauler", },
	[24602720] = { npc=4118, name="Venomous Cloud Serpent", class={ "SHAMAN" }, tip="3 x Cloud Serpent Fangs",
					spell={ "Decoy Totem" }, guide={ st.shaman.decoyTotem }, },
	[26704700] = { npc=217669, name="Scorched Screeching Roguefeather", class={ "MAGE" },
					spell={ "Chronostatic Preservation" }, guide={ st.mage.chronostatic }, },
	[28005120] = { name="Screeching harpies (various)", class={ "MAGE" }, tip="10 x Strong Harpy Feathers",
					spell={ "Chronostatic Preservation" }, guide={ st.mage.chronostatic }, },
	[34504000] = { object=423895, name="Scrolls", class={ "MAGE" },
					spell={ "Spell Power" }, guide={ st.mage.books }, alsoTestQuest=true,
					tip="Inside a hut on Darkcloud Pinnacle mesa",
					quest={ { 79947 } }, questName={ { "Geomancy: The Stone-Cold Truth" } } },
	[35003160] = { name="Grimtotem (various)", class={ "PRIEST" }, spell={ "Empowered Renew" }, guide={ st.priest.empowered }, },
	[38405660] = { name="Venomous Cloud Serpent / Cloud Serpent", class={ "SHAMAN" }, tip="3 x Cloud Serpent Fangs",
					spell={ "Decoy Totem" }, guide={ st.shaman.decoyTotem }, },
	[39404200] = { name="Altar of the Wind Spirit", class={ "SHAMAN" },
					spell={ "Decoy Totem" }, guide={ st.shaman.decoyTotem }, },
	[40003480] = { npc=4117, name="Cloud Serpent", class={ "SHAMAN" }, tip="3 x Cloud Serpent Fangs",
					spell={ "Decoy Totem" }, guide={ st.shaman.decoyTotem }, },
	[43403080] = { name="Skillbooks", tip="Razorfen Downs", skillBook=true, guide={ st.dungeonDrops }, 
					class={ "DRUID", "DRUID", "DRUID", "HUNTER", "MAGE", "PALADIN", "PRIEST", "PRIEST", "ROGUE", "SHAMAN",
						"WARLOCK", "WARLOCK", "WARRIOR" },	
					spell={ "Deeper Wilds", "Enhanced Restoration", "Revive", "Aspect of the Viper", "Expanded Intellect",
							"Enhanced Blessings", "Increased Fortitude", "Shadowfiend", "Redirect", "Totemic Projection",
							"Portal Summoning", "Soul Harvesting", "Commanding Shout" }, },
	[46005160] = { npc=4722, name="Rau Cliffrunner", class={ "SHAMAN" },
					spell={ "Maelstrom Weapon" }, guide={ st.shaman.maelstrom },
					quest={ { 79358, 79360, 79362, 79363, 79361, 79364, 79365, 79366, 79442 } },
					questName={ { "Tattered Note", "Elemental Aid", "Power of da Earth", "Power of da Water",
						"Power of da Wind", "A Simple Container", "With Wind Beneath Your Wings", "Calm Before the Storm",
						"Catching Up" } } },
	[46805350] = { object=421568, name="Weathered Cache", class={ "SHAMAN" },
					spell={ "Spirit of the Alpha" }, guide={ st.shaman.spiritAlpha }, },
	[55004200] = { npc=216474, name="Ravaging Tempest", class={ "SHAMAN" }, spell={ "Maelstrom Weapon" },
					tip="Hits hard, has knockback and helpers.\nIf you die, you MUST ask to be sent back.\n"
						.."Loot his rare gem and then go to Rau, not Bath'rah",
					guide={ st.shaman.maelstrom }, quest={ st.shaman.maelstromQ }, questName={ st.shaman.maelstromQN } },
	[56605020] = { npc=4119, name="Elder Cloud Serpent", class={ "SHAMAN" }, tip="3 x Cloud Serpent Fangs",
					spell={ "Decoy Totem" }, guide={ st.shaman.decoyTotem }, },
	[66008800] = { name="Combat Dummy x 3", class={ "WARRIOR" }, spell={ "Intervene" }, guide={ st.warrior.intervene }, },
	[68605550] = { npc=217418, name="Zai'enki", class={ "DRUID" },
					spell={ "Berserk" }, guide={ st.druid.berserk }, },
}
points[ 1456 ] = { -- Thunder Bluff
	[26191866] = { npc=207754, name="Mooart", class={ "WARRIOR" }, faction="Horde",
					spell={ "Frenzied Assault" },
					guide={ st.warrior.frenziedAssault },
					tip= "Speak to Netali first if you\nhaven't already done so" },
	[28761792] = { npc=207743, name="Netali Proudwind", class={ "WARRIOR" }, faction="Horde",
					spell={ "Frenzied Assault" }, guide={ st.warrior.frenziedAssault },
					tip="Speak to Netali first, and\nthen speak to Mooart, nearby" },
	[39446584] = { npc=205729, name="Boarton Shadetotem", class={ "SHAMAN" }, faction="Horde",
					spell={ "Lava Lash" }, guide={ st.shaman.lavaLash }, quest={ { 76156, 76160, 76240 } },
					questName={ { "Stalk With The Earthmother", "Stalk With The Earthmother", "Stalk With The Earthmother" } },
					tip="\"Hmm... perhaps disguises are not your strength\"" }, -- Location based upon online screencap
	[39405333] = { npc=214096, name="Dokimi", faction="Horde",
					class=st.allClass, spell=st.allSpellACA, guide={ st.supplyFaction } },
	[56144638] = { npc=3028, name="Kah Mistrunner", class={ "SHAMAN" }, faction="Horde",
					spell={ "Lava Lash" }, guide={ st.shaman.lavaLash }, quest={ { 76156, 76160, 76240 } },
					questName={ { "Stalk With The Earthmother", "Stalk With The Earthmother", "Stalk With The Earthmother" } },
					tip="If you need to learn fishing. You do of\ncourse use my Cod Do Batter fishing AddOn?" },
}

--=======================================================================================================
--
-- MISCELLANY
--
--=======================================================================================================

ns.pointsBase[ 1414 ] = { -- Kalimdor
	[69005000] = { phase=1 },
	[72005000] = { phase=2 },
	[75005000] = { phase=3 },
}
ns.pointsBase[ 1415 ] = { -- Eastern Kingdoms
	[69005000] = { phase=1 },
	[72005000] = { phase=2 },
	[75005000] = { phase=3 },
}
ns.pointsBase[ 947 ] = { -- Azeroth
	[58003500] = { phase=1 },
	[61003500] = { phase=2 },
	[64003500] = { phase=3 },
}
	
-- Choice of texture
-- Note that these textures are all repurposed and as such have non-uniform sizing
-- I should also allow for non-uniform origin placement as well as adjust the x,y offsets
ns.textures[1] = "Interface\\PlayerFrame\\MonkLightPower"
ns.textures[2] = "Interface\\PlayerFrame\\MonkDarkPower"
ns.textures[3] = "Interface\\Common\\Indicator-Red"
ns.textures[4] = "Interface\\Common\\Indicator-Yellow"
ns.textures[5] = "Interface\\Common\\Indicator-Green"
ns.textures[6] = "Interface\\Common\\Indicator-Gray"
ns.textures[7] = "Interface\\Common\\Friendship-ManaOrb"	
ns.textures[8] = "Interface\\TargetingFrame\\UI-PhasingIcon"
ns.textures[9] = "Interface\\Store\\Category-icon-pets"
ns.textures[10] = "Interface\\Store\\Category-icon-featured"
ns.textures[11] = "Interface\\HelpFrame\\HelpIcon-CharacterStuck"	
ns.textures[12] = "Interface\\PlayerFrame\\UI-PlayerFrame-DeathKnight-Frost"
ns.textures[13] = "Interface\\TargetingFrame\\PetBadge-Magical"
ns.textures[14] = "Interface\\Vehicles\\UI-Vehicles-Raid-Icon"
ns.textures[15] = "Interface\\AddOns\\HandyNotes_Runes\\Textures\\Adrenaline"
ns.textures[16] = "Interface\\AddOns\\HandyNotes_Runes\\Textures\\Arcane"
ns.textures[17] = "Interface\\AddOns\\HandyNotes_Runes\\Textures\\Demonic"
ns.textures[18] = "Interface\\AddOns\\HandyNotes_Runes\\Textures\\Duty"

ns.scaling[1] = 0.41
ns.scaling[2] = 0.41
ns.scaling[3] = 0.41
ns.scaling[4] = 0.41
ns.scaling[5] = 0.41
ns.scaling[6] = 0.41
ns.scaling[7] = 0.49
ns.scaling[8] = 0.46
ns.scaling[9] = 0.56
ns.scaling[10] = 0.56
ns.scaling[11] = 0.43
ns.scaling[12] = 0.37
ns.scaling[13] = 0.36
ns.scaling[14] = 0.32
ns.scaling[15] = 0.33
ns.scaling[16] = 0.33
ns.scaling[17] = 0.33
ns.scaling[18] = 0.33