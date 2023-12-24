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

st.druid.ferocious = "從西墜之地的許多河爪生物、黑海岸的獸人母親、銀松森林的蒼白格瑞姆森，以及巴倫之地的三個半人馬寶箱獲得。\n\n"
			.."獲得並裝備後，對類人生物造成 20 點流血傷害。再次點擊偶像以最終激活"
st.druid.ursineRage = "聯盟可以在泰達希爾殺死暴怒之爪。部落可以在莫高雷殺死冒險有限公司主管或剛毛入侵者。\n\n"
			.."兩個陣營皆可狩獵平原潛行者、草原狼頭目、利爪俯衝者、狂風女族長與女巫。\n\n看看偶像的提示工具。保持憤怒值！"
st.druid.idolWild = "只要掠奪暴徒即可。然後裝備右鍵點擊。對友善暴徒進行 10 次直接治療。\n現在再次點擊偶像"
st.druid.lunarIdolA = "從 4 等開始接下馬丹特·強橡的奎爾多雷遺跡任務。\n\n"
			.."殺死葛雷金即可獲得月之偶像。裝備。\n\n"
			.."現在殺死 6 個受月火術影響的暴徒。現在再次點擊偶像"
st.druid.lunarIdolH = "前往荊棘刀鋒峽谷。\n\n"
			.."掠奪寶箱並裝備\n\n"
			.."現在殺死 6 個受月火術影響的暴徒。現在再次點擊偶像"
st.druid.naturalPotential = "從莫高雷 (部落) 收集 3 x 草原花朵，從泰達希爾 (聯盟) 收集 3 x 空地花朵。\n\n"
			.."將其結合起來可製作草原/空地王冠。\n\n"
			.."前往座標 (37.60,49.50) (部落) 或 (66.90,57.70) (聯盟)。\n\n"
			.."等待木頭雕像生成。\n對著它使用王冠。殺掉靈魂。掠奪掉落物"
st.druid.lacerate = "聯盟最方便前往洛克莫丹湖畔的卡拉·深水打怪。購買一些彩虹鰭長尾鮪魚誘餌 (5 銀幣)，然後餵食湖中的幼年風暴角龍獸。\n\n"
			.."部落應該前往荒蕪之地，尋找一個廢棄的歐顎巢穴。拿走蛋，然後將蛋放置到一個空的歐顎巢穴中。等待，然後點擊幼龍可獲得戰利品！\n\n"
			.."兩個陣營都可以前往暗影之岸。在黑木暴徒身上找到螃蟹美味，或是直接釣魚。然後餵食給幼年暗礁爬行者 (螃蟹)。\n\n"
			.."或者前往西墜之地，並在迪菲亞暴徒身上找到魔法南瓜種子。種下種子。殺死狂暴南瓜。賺大錢！\n\n"
			.."此外，銀松森林中的月怒白鱗和闇影行者會掉落失衡偶像。請閱讀其提示工具。您需要這三種增益效果累積 5 次。在殺死敵人的過程中使用月火術、治療觸摸或癒合，並變形"
st.druid.runeOfStars = "找到躲在小橋下的格魯吉姆登。然後前往樹樁。只有在樹樁附近，您才能吃蘑菇。其餘步驟照常進行"
st.druid.runeOfTheSun = "部落前往莫高雷，對著三個附近的月之石施放月火術。聯盟必須前往泰達希爾，請注意其中兩個石頭位於樹枝上。現在點擊月之寶箱。沒錯，這很簡單！"
st.druid.swim = "從東側的雕像/地圖圖釘開始。\n"
			.."（如果您分析地形，您就會了解原因）。以水生型態游到西部雕像，爬上去，並點擊以獲得獎勵。\n\n"
			.."如果您以水生型態從東到西前進，您會有充裕的時間"
st.druid.wildGrowth = "在 21 等左右，前往月光林地的訓練師洛加納爾。開始貓頭鷹考驗。\n\n"
			.."請注意：您可以在接下任務之前獲得這三隻貓頭鷹。第一隻貓頭鷹：灰谷，第二隻貓頭鷹：暮色森林，第三隻貓頭鷹：希爾斯布萊德丘陵。\n\n"
			.."直接交出即可獲得您的符文！"
st.hunter.beastMastery = "在西墜之地農場從眾多的野豬牙獲得野豬牙肉，然後用它來召喚銀刺。\n"
			.."擊殺並掠奪它森林之王，西墜之地；或黑海岸的弗柏格來獲得喪屍蟹點心。\n"
			.."然後餵給海岸上的幼年礁爬行者 (A)\n\n"
			.."部落必須擊殺凶猛的灰熊直到灰熊保護者出現，幽暗松林。\n"
			.."擊殺並掠奪，在塔倫米爾北方的貧瘠之地捕捉巡邏的獵豹。\n"
			.."你現在可以殺死它了。豐厚的戰利品！(H)"
st.hunter.carve = "從敦摩羅的戈巴礦場顎岩穴Trollgs 獲得兔子麝香\n"
			.."然後在兔子生物上使用麝香。立即馴服牠。與 DunMorogh 的安珀斯提爾牧場的 Toby 交談以獲得獎勵；\n\n"
			.."在泰達希爾，是樹節精靈暴徒使用鹿麝香。在鹿身上使用。馴服。\n"
			.."與達納薩斯 (A) 的雷拉倫交談；杜洛塔的剃刀鬃毛暴徒獲得蛇加香精。\n"
			.."剃刀丘陵的瑞兹；\n"
			.."莫高雷使用蒼白鬃毛暴徒的草原土撥鼠麝香。\n"
			.."血蹄村 (H) 的塔科達日光鬃。\n\n"
			.."請注意，在馴服你的寵物時，你不需要放棄你當前的同伴"
st.hunter.cobraStrikes = "從在南海鎮和塔倫米爾之間徘徊的 Zixil 購買淡水鱸魚餌。\n\n"
			.."現在在塔倫米爾南邊湖上的小船處使用船。Koartul 出現了！"
st.hunter.explosiveShot = "菲歐迪、艾丹(嚎叫者)、猛爪、老冰鬍、\n"
			.."巨木怪、瓦加斯、丹莫羅、班奈西斯墓地最底層的憤怒之爪、\n"
			.."泰達希爾 (A)；紮營的薩科斯、試練之谷；阿雷洽、幽魂嚎叫、\n"
			.."瑪查納奇、掘墓者、莫高雷 (H)"
st.hunter.flankingStrike = "敦摩羅的冰川湖東側的洞穴 Jorul；\n"
			.."甲骨文空地河流東側的洞穴 Mowgh (A)；\n"
			.."杜洛塔、回聲群島的北方島嶼的 Raluk；\n"
			.."莫高雷、血蹄村西北西邊的 Mokwa (H)\n\n"
			.."要讓稀有生物出現，你必須收集它的食物。查看工具提示\n\n"
			.."這些稀有生物是跨陣營的。符文在擊殺或馴服 (10 級) 時獲得。\n"
			.."熊 (A) 和貓 (H) 技能和數值只是普通。"
st.hunter.heartLion = "Carrodin，濕地 Thelgen 岩洞後方 (A/H)"
st.hunter.killCommand = "這個過程集中在荊棘谷的 Stonetalon Mountains 的 Jixo Madrocket，\n"
			.."朝風切峽谷的路徑上。\n\n"
			.."第一個任務需要你擊殺位於嚎哭洞穴盡頭的吞噬者 Mutanus。\n"
			.."Mutanous 會掉落催眠水晶。WC 地城在貧瘠之地。\n\n"
			.."你還需要一把扭曲的魔法魔杖。從 AH/附魔師好友那裡購買一根較大的魔杖。\n"
			.."與掉落灰谷弗柏格暴徒的野魔法精華組合。\n\n"
			.."第二個任務要求你見證 Jixo 馴服飛龍。太簡單啦！\n\n"
			.."對獵人的好處是我們獲得了一個飛龍馴服魔杖，它使我們能夠在荊棘谷山脈馴服飛龍\n"
			.."我也標記他們了！"
st.hunter.masterMark = "在樹叢上使用獵人的印記。一個偷獵者將生成。殺死它。掠奪它"
st.hunter.sniper = "黑海岸、瑪瑟拉遺跡西方的 Paxnozz；\n"
			.."西墜之地、哨兵山丘的 Defias 偵察兵；\n"
			.."洛丹倫、洛奇湖的 Kackle (A)。\n\n"
			.."貧瘠之地、棘齒城海岸附近的 Bruuz (H)"
st.mage.enlightenment = "聯盟應該朝著艾爾文森林的瑞奇角塔東部前進，雖然任何地方都可能有小動物。如果小動物有野性變形debuff\n"
			.."（而且看起來也會顯得“格格不入”），那就對它使用變形術。當人走開時，你會看到一個閃亮的物品。\n\n"
			.."部落需要在提里斯法林地的任何農場附近尋找奇怪的甜瓜，也要對它使用變形術。\n\n"
			.."物品的工具提示會告訴你需要多少個。將它們結合在一起（使用其中一個）。大功告成！"
st.mage.arcaneBlast = "一份娜迦手稿將從怒尾女巫和海巫身上掉落。\n\n"
			.."在地圖上標記的三個粉紅/紫色碎片處施放奧術爆炸。\n\n雞腿晚餐，你是贏家！"
st.mage.fingers = "聯盟需要從一個流氓畫廊中選擇一些受歡迎的老朋友。Timber、Mangeclaw、Bjarm、\n"
			.."Edan the Howler、Old Icebeard、Hammerspine、Vagash，\n以及新成員Fyodi。都是在丹莫洛。還有Hogger！\n\n"
			.."部落得到Gazz'uz，就在你離開奧格瑪時左邊的洞穴。Echo Isles上的Zalazane對\n"
			.."食人妖來說很方便。還有新成員Gillgar就在死亡之丘的北部。\n\n只需拾取和理解！<3"
st.mage.iceLance = "地圖上的位置。現在是學習「理解」的時候！"
st.mage.icyVeins = "你必須從艾澤拉斯各地收集十本書。\n總共有 16 本書，每個派系各三本\n"
			.."每個派系總共有 13 種可能。\n\n沒有特殊的排序。你把書交給你\n"
			.."給你的圖書館員：幽暗城（H）法師區\n的歐文·薩德（Owen Thadd）或法師區的加里恩·溫德爾（Garion Wendell）\n"
			.."暴風城的塔樓傳送門房間（A）。\n\n歐文和加里安負責計數，讓你可以把手\n"
			.."只要方便就可以。\n\n每筆存款都會產生理解咒！\n\n"
			.."到時候，你就會收到獎勵！"
st.mage.livingBomb = "在 Thelsamar 南部的 Stonesplitter 洞穴中，怪物會掉落一張咬過的法術筆記。\n"
			.."在 Loch Modan 的最北端湖泊中，也有相同的先知生物。\n\n"
			.."部落可以在 Silverpine 森林完成一些任務，獲得確定的獎勵。\n"
			.."問題在於你需要在 Fenris 島上進行任務時，有一個掉落率極低的「說話的頭顱」，\n"
			.."才能開始這個任務鏈。\n\n值得嗎？3% 的掉落率。我寧願割草。"
st.mage.livingFlame = "在丹莫洛，霜鬃暗影施法者（联盟）和霜鬃先知（联盟/部落）会掉落咒文笔记。它们位于地图的西侧，并已被标注。\n\n"
			.."艾尔文森林贾斯伯矿洞及周围的狗头人地卜师（联盟）也有可能掉落。\n\n"
			.."提里斯法林地的血色战士、传教士和狂热者（联盟/部落）已经被标注。\n\n"
			.."杜隆塔尔是充满了部落势力，甚至在奥格瑞玛门前都有火刃族怪物。\n\n"
			.."就像往常一样，拾取并理解！"
st.mage.regeneration = "部落可以在南方的銀松森林中收集達拉然學徒。\n\n"
			.."理論上，聯盟和部落都可以：在貧瘠之地農殺科卡爾半人馬怪物以獲得一把鑰匙，用來打開該區域兩個寶箱之一；\n\n"
			.."檢查洛克摩丹北島上的被偷書籍堆；殺死西境南部的迪菲亞叛逆法師。拾取和理解！"		
st.paladin.banishment = "鎖定 Duskwood 南緣的迪菲亞法師、迪菲亞夜刃\n"
			.."和迪菲亞夜行者。簡單的農怪經驗。\n\n"
			.."掉落聖書時等它。\n\n"
			.."對 5 個敵人施放驅除亡靈，並聖光審判將其擊殺。\n\n"
			.."再次點擊聖書。"
st.paladin.blessings = "到 Loch Modan 的 Thelsamar 酒館。\n它放在那裡的一張桌子上。或者前往 Westfall 擊殺\n"
			.."Jangolode 採礦場或 Gold Coast 採石場的不死礦工。\n\n"
			.."依照聖書的說明行進。完成！"
st.paladin.divineStorm = "你將在北邊 Darkshore 的 Athalaxx 塔頂找到一個法球。\n開啟這個任務。\n\n"
			.."在 Ashenvale 的 Maestra's Post 找尋 Purifier 德格倫。\n\n"
			.."依照指示，前往 Stormwind Cathedral 找到 Katherine the Pure，\n"
			.."他會讓你與躲在法師區後方的 Ursula Deline 交談。\n\n"
			.."Ursula 會派你去 Redridge 收集她的鹽。\n它掉落率很低。回到她身邊。\n\n"
			.."Ursula 現在需要來自 Ashenvale 的細塵。\n\n"
			.."收集到細塵後，將它們帶到 Mannoroth 祭壇。\n它又大又紫。點擊地面繳交細塵。一個破裂的法球出現了。\n"
			.."將它帶給德格倫。終於完成了！"
st.paladin.judgement = "矮人拜訪在鐵爐堡入口的 Bromos Grummner，人類則交談\n"
			.."在北郡修道院兵器大廳中的 Brother Sammuel。\n\n"
			.."你現在必須在 Coldridge Valley 擊殺霜鬃幼龍，或是修道院東邊葡萄園的迪菲亞暴徒。\n\n"
			.."當聖書掉落時，閱讀指令。\n選擇一個聖印法術，對 10 名敵人施放審判。\n\n"
			.."點擊聖書領取你的獎勵。"
st.paladin.justice = "在 Loch Modan 的 Stonesplitter Cave 或 Westfall 最東南角的 迪菲亞無人機\n"
			.."農到聖書。\n\n"
			.."現在依照聖書說明：用你的正義之鎚擊昏 10 個敵人，並重擊他們。\n\n"
			.."再次點擊聖書完成任務！"
st.paladin.runeOfAegis = "前往位於鐵爐堡以西的諾莫瑞根入口，並與受傷的冒險者交談。\n\n"
			.."或者在艾爾文森林的碧玉礦礦場的盡頭找到受傷的冒險者。\n\n"
			.."無論如何，施放淨化 (等級 8+) 即可完成任務！"
st.paladin.martyrdom = "與 Stormwind 的 Brother Romulus 交談。\n\n"
			.."依照他的指示，從西邊的樓梯走進地下墓穴。\n\n"
			.."你可能需要等待釘書出現。\n它在底部的燭台旁邊。\n\n"
			.."Ada 在 Westfall、Duskwood、艾爾文森林的河流交會處。\n\n"
			.."她有你的符文。你知道該做什麼了。"
st.paladin.runeOfRebuke = "與在公園的 Liv Bradford 交談。\n"
			.."你會發現 Stuart 在附近閒逛。\n返回 Liv 處領取你的獎勵"
st.priest.citadel = ""
						  
st.priest.saviour = ""
st.priest.sharedPain = "往南遠東方的鐵樂隊營地的貝爾德船長\n"
			.."艾爾文森林的佛洛斯提德山洞的梅倫納斯領主\n"
st.priest.voidPlague = "葛諾米根附近的痲瘋地精/吉伯威特；艾爾文森林的金牙\n"
			.."泰達希爾的班西斯墓地，葛納平小屋(A)\n"
			.."藏在剃刀嶺東邊的庫爾提拉斯暴徒，薩塔斯&#10;西北方、提里斯法林地的死亡鐘聲，基爾加(H)"
st.rogue.bladeDance = "黑海岸的克里夫斯普林格河洞。鑰匙由克里夫斯普林格暴徒掉落；洛克莫丹的各個鐵矮人。打開鎖箱；扒竊迪菲亞暴徒，可獲得一份神秘信封。前往西瘟疫之地的死亡礦井後門(A)。\n\n"
			.."扒竊南海暴徒，可獲得海盜的火柴盒。前往附近山丘。點燃火藥桶。砰！瞧，你的獎勵就在這裡！(H)"
st.rogue.deadlyBrew = "在 20 等級時，你會收到一封來自「C」的信\n。不必理會。到了 22 等級時，學習閃避和分心術\n"
			.."，並在欺騙大師中獲得五點(第二層的技巧)。強烈建議你學習偽裝(第三層)。再獲得五點！\n\n"
			.."在派爾伍德村莊，劫掠小房子/小屋裡的寶箱。這就是第一個任務的開始(如上)。\n\n"
			.."(別去石爪山脈。只有新手才會去那裡。單槍匹馬進入SFK才夠屌，因為你可是精英份子！)\n\n"
			.."潛行到雷斯戴爾。第一個房間的第一個頭目。前往附近你的 A/H 囚室。打開囚室，但要快閃！和 NPC 對話以打開庭院大門。\n\n"
			.."你需要找到 Gemela 和 Gefell。潛行！如果扒竊反抗，你就會幸運了。做好閃避的準備。必要時，也使用分心術。\n\n"
			.."Gemela 在餐廳裡，廚房附近。扒竊她可獲得姊妹的半把鑰匙。\n\n"
			.."Gefell 在樓上，右轉。他會掉落哥哥的半把鑰匙。\n\n"
			.."將兩把鑰匙結合，成為雙胞胎鑰匙，但請注意你必須再次閃避(或謹慎操作)。\n\n"
			.."回到庭院和馬廄。對著寶箱使用鑰匙。你現在擁有 Xelthos 的號角。\n\n"
			.."出城後，轉進小房子。你現在必須等待第二封信。信件會告訴\n"
			.."你回來這裡領取獎勵！！！\n\n"
			.."因人而異，但據說你必須到城市才能觸發信件。但首先，可以先等候 15 分鐘，並完全退出遊戲。說不定可以省去很多路！\n\n"
			.."(第二個任務(如上)會顯示你是否尚未在收到第二封信後「繳交」)"
st.rogue.envenom = "與克里斯．雷加斯交談。她在杜恩霍爾德堡壘後方。沒有進入堡壘的必要。\n\n"
			.."從她那裡購買「熱門推薦」。你將會需要 75 銀。\n\n"
			.."查看地圖。沿著塔倫米爾東邊的河流，一直走到西瘟疫之地。\n\n"
			.."繼續走到最後 - 瀑布。你的地圖上標記了一個生鏽保險箱的位置"
st.rogue.mutilate = "在黑鐵密探身上扒竊可獲得布萊克瑞特的筆記，地點位於亥爾姆貝德湖的南方，東邊的遙遠處。在加里克．帕佛身上扒竊可獲得庫蒂的筆記，地點位於北郡修道院\n"
			.."梅倫納斯領主，佛洛斯提德山洞，泰達希爾(A)。\n\n"
			.."在燃燒之刃暴徒身上扒竊可獲得巴克索的筆記，地點位於杜洛塔；在貝琳船長身上扒竊可獲得他的筆記，地點位於布瑞爾的南方，提里斯法林地(H)"
st.rogue.precision = "劫掠鐵爐堡的悲慘洞穴；暴風城的割喉巷；泰達希爾的最南邊，葛納平藏匿處(A)。\n\n"
			.."劫掠奧格瑪的拖曳區；提里斯法林地的加龍出沒地的東邊，沉船藏匿處(H)"
st.rogue.quickDraw = "你需要拼湊一張分成四個部分的寶藏地圖。你不能跨區共享部分。\n"
			.."決定你會在哪裡花費大部分時間。扒竊\n\n"
st.rogue.quickDrawDM = "敦摩羅寶藏地圖：\n"
			.."右上角：谷地村寒冷山脊和敦摩羅西邊的霜鬃暴徒\n"
			.."左上角：亥爾姆貝德湖的西南方的岩顎暴徒，敦摩羅的最東南方\n"
			.."右下角：葛諾米根大門的痲瘋地精，敦摩羅的最西邊\n"
			.."左下角：亥爾姆貝德湖南方的黑鐵密探，敦摩羅的最東南方\n"
			.."最終位置：卡拉諾斯到鐵爐堡的路上，橋下"
st.rogue.quickDrawEF = "艾爾文寶藏地圖：\n"
			.."右上角：三個礦洞入口處的土撥鼠暴徒\n"
			.."左上角：橡樹風民宿中間的迪菲亞巫師，到處都是強盜\n"
			.."右下角：橡樹風民宿的東南方海岸邊的半人魚覓食者\n"
			.."左下角：霍格或橡樹風民宿附近的河爪前鋒\n"
			.."最終位置：嶺點塔附近"
st.rogue.quickDrawTel = "泰達希爾寶藏地圖：\n"
			.."右上角：奧瑞克空地河流上的木精靈暴徒，多拉納爾南方湖泊\n"
			.."左上角：葛納平暴徒，班西斯墓地\n"
			.."右下角：奧瑞克空地的鷹身女妖\n"
			.."左下角：佛洛斯提德山洞的仙靈\n"
			.."最終位置：露德村的空心樹樁"
st.rogue.quickDrawDur = "杜洛塔寶藏地圖：\n"
			.."右上角：剃刀嶺東邊的庫爾提拉斯暴徒\n"
			.."左上角：燃燒之刃暴徒。從剃刀嶺前往\n"
			.."右下角：杜洛塔中部的豺狼人\n"
			.."左下角：回音島主要的巨魔\n"
			.."最終位置：回音島南方，雕像腳下"
st.rogue.quickDrawTG = "提里斯法寶藏地圖：\n"
			.."右上角：到處都是的赤紅暴徒，例如，通往修道院\n"
			.."左上角：死亡鐘聲北方的農夫\n"
			.."左下角：加龍出沒地的豺狼人\n"
			.."右下角：沿岸地區的邪惡鰭半人魚"
st.rogue.saberSlash = "黑海岸的奧伯丁燈塔；洛克莫丹石造大壩的平台；西瘟疫之地哨兵之丘旅館後方的山丘(A)。\n\n"
			.."貧瘠之地的北望哨的馬廄屋頂，薩爾塔斯，銀松森林的暗影迷霧堡入口處的平台上的生鏽寶箱(H)"
st.rogue.shiv = "首先從暮光森林南方邊界的迪菲亞暴徒身上扒竊可獲得雕刻金戒指。\n\n"
			.."接著前往墓地，在雕像前/跪下。小心巡邏部隊，選擇時機！"
st.rogue.slaughter = "敦摩羅，卡拉諾斯的旅館上空；艾爾文森林，黃金鎮以北的陰森房屋的屋頂；泰達希爾班西斯墓地的幾個藏匿處位置(A)。\n\n"
			.."杜洛塔乾枯深溝 - 尋找剃刀嶺西北方的圖釘；提里斯法林地，阿格曼德墓穴的聖物寶箱。鑰匙由附近的暴徒掉落"
st.shaman.dyadicIcon = "巨魔/獸人：前往試煉之谷找尋希克瑞克，\n牛頭人：前往納拉齊營地的米拉·黎明行者。\n\n"
			.."巨魔/獸人留在起始區域做任務，\n但牛頭人必須在荊棘刃峽谷擊殺豪毛背薩滿。\n\n"
			.."裝備你的二重圖騰。請閱讀提示。任務怪獸也會掉落。累積十層後點擊你\n"
			.."裝備的圖騰。交還任務可獲得極品戰利品。"
st.shaman.earthenRune = "有兩種方法可以取得。第一種是到荊棘谷的沙漠幻影農場。\n掉落率和刷新率都很棒。牧師們也會在那裡農場。等級 15 的怪物。\n\n"
			.."另外，也可以去銀松森林農場腐皮秘教徒。\n怪物更簡單，但掉落率極低，並且你必須擊殺第二隻召喚的怪物。\n\n"
			.."先去荊棘谷吧！\n\n"
			.."除此之外，它就是一個直接掉落，無需額外任務就能學會符文。"
st.shaman.galvanicIcon = "前往莫高雷或杜塔隆，聆聽雷擊聲。\n\n"
			.."莫高雷的地點靠近荊棘谷。\n\n"
			.."跑到「雷電注入圖騰」前點擊並裝備。\n\n"
			.."用大地的怒火技能殺死 10 隻怪物。\n\n"
			.."點擊插槽。"
st.shaman.kajaricIcon = "在馳騁山丘的東南角的農場裡時，請避開泥鼻豬人\n因為它們不會掉落卡迦瑞圖騰。只有泥鼻薩滿會掉落。\n\n"
			.."裝備（掉落率極低）卡迦瑞圖騰\n\n"
			.."前往奧格瑪並進入憤怒熔爐。小心一點，\n盡可在岩漿中玩耍，雖然有點熱辣。"
st.shaman.lavaLash = "在雷崖主台地上找到波頓·影圖騰。他是一位盜賊訓練師，\n"
			.."第二個能跟你這個菜鳥薩滿打交道的人。\n\n"
			.."他會有三項任務，第一項你會收到一個盜賊風格的「偽裝」。\n\n"
			.."大海元素充能器會從任務標註的探險公司礦車那裡獲得。\n\n"
			.."他很快就讓你了解到盜賊的東西不適合你。很好。\n\n"
			.."風怒錐很難看到，但我幫你標記了一些。\n\n"
			.."最後一項任務需要釣魚。我在地圖上標記了訓練師。\n\n"
			.."瞧 - 雙重特效。雙持武器和大地震擊！！！"
st.shaman.earthShield = "在黑 Fathom 深處殺死阿誇尼斯男爵。\n\n"
			.."帶著法球到索拉姆海岸的吉紐·桑克雷亞那裡。\n\n"
			.."請注意，他的其中一項任務需要藥水。這些不是怪物掉落。你在拍賣行購買或製作。"
st.shaman.runeFury = "只需殺死原始異常即可。\n\n"
			.."在石爪山脈焦炭山谷的周圍遊蕩。\n"
			.."在三種元素形態之間切換。精英怪物，但如果你根據它的元素形態調整你的元素攻擊，\n"
			.."那麼你就可以單獨擊殺它。掉落並學習符文。掉落率很高。"
st.shaman.sulfurousIcon = "前往雷崖西南方的貝爾登挖掘地點，並在那裡打敗貝爾登矮人\n"
			.."以獲得一個儲物櫃鑰匙。盒子里有你的符文。簡單。\n\n"
			.."如果你寧願遭受苦難，那就前往杜塔隆的東海岸，越過剃刀嶺。冷凍馬克魯拉需要五個同時的火焰減益。\n"
			.."由於法師和術士也會去那裡，所以你可能會幸運。\n\n"
			.."執行慣常操作，裝備圖騰。依照說明進行操作。大地的震擊擊殺 10 隻怪物。點擊並學習。成功！"
st.shaman.tempestIcon = "在銀松森林選擇蒼白的格里森，或在荊棘谷農場半人馬以獲得\n"
			.."寶箱鑰匙。這基本上是霍布森的選擇。\n\n"
			.."我想在荊棘谷的科爾卡寶箱。\n\n"
			.."取得掉落後裝備。然後殺死 10 隻怪物，\n確保你使用了自然、火焰、冰霜攻擊。"
st.warlock.metamorphosis = "第一個任務不要求你進入 BFD 團隊副本。你可以打敗遺跡外廢墟中的暮光侍僧，\n"
			.."從索拉安魯克碎片中打出碎片。你確實需要進入 SFK 打敗暗影之牙靈魂使者，\n"
			.."從該生物上打出另一個碎片。\n\n"
			.."(BFD 位於艾薩拉的北岸，而 SFK 位於銀松森林的南邊)\n\n"
			.."「流言四起」會把你送到赤脊山脈東北角的伊爾加拉之塔和黑暗海岸北邊的阿薩雷斯之塔。\n\n"
			.."通過前往艾薩拉東邊的烈焰地獄峽谷可以解開召喚。有了 10 個血量，你可以激活附近的地獄咆哮祭壇，\n"
			.."並在紫色符文光環中使用吸取靈魂技能擊敗幾波惡魔。\n\n"
			.."最後，神秘的旅人會出現。\n\n"
			.."回到杜安那裡，接受最後的任務。獲利！"
st.warlock.channeling = "有很多選擇。對於聯盟來說，最好的方法是找到格雷仙·鐵爐，一個\n"
			.."商人在洛克莫丹的長路上徘徊。他賣了一個惡意餡餅。\n"
			.."吃掉它，肚子痛，然後看看你的包包你贏了！\n\n"
			.."部落最好前往棘齒城西南的荊棘祭壇，\n使用生命虹吸，直至生命值歸零。\n聯盟也可以來這裡。\n\n"
			.."部落在銀松森林也有邪惡的惡魔作為選擇。你將需要施放魯莽詛咒。\n\n"
			.."聯盟/部落也可以在黑暗海岸的阿薩雷斯之塔從暗影線條狂熱者那裡獲得掉落。\n\n"
			.."另一個選擇是在西瘟疫之地農場收割者。你正在與尋常的尋求者和法師雕刻師競爭。\n"
			.."你會將一個備用收割者零件（來自監視者和魔像）和一個來自塵土惡魔的元素核心組合成\n"
			.."一個原型引擎物品。將它安裝到收割者原型。這會啟動它。打敗它。換取戰利品！"
st.warlock.grace = "你需要從以下地方獲得不祥的典籍怪物掉落：\n提瑞斯法林地的阿加曼德磨坊的暗眼骨法師，或者\n"
			.."杜塔隆的迴聲群島上的巫毒/詛咒巨魔（部落）或埃爾文森林的賈斯柏羅德礦場前面的科波爾地質學家或\n"
			.."石凱恩湖上的迪菲亞流氓巫師（聯盟）。\n\n"
st.warlock.graceEF = "還需要獲得角獸人血。合適的地點包括\n霍格營地，但不要去霍格那裡，在\n"
			.."石凱恩湖的西北部很容易，但數量也不多。\n\n還需要一塊狼顎骨。石凱恩湖的北部\n"
			.."或傑斯洛德礦坑的南部是最簡單的。\n\n前往暴風城的屠羊旅店地下室\n"
			.."並在召喚法陣上召喚索伯茲"
st.warlock.graceDM = "同時獲得溫迪戈之血。溫迪戈位於\n卡拉諾斯西部下方。狼顎骨\n"
			.."很豐富。在卡拉諾斯北部有非常多的狼\n，在寒脊山地的也不少。前往\n"
			.."閃爍嶺，你會在那裡找到一個召喚\n法陣。召喚並擊殺索伯茲。恭喜你！"
st.warlock.graceDur = "另外有一些靠近\n奧格瑪的杜洛塔地點也標示\n"
			.."為不祥的典籍掉落地點。\n\n馬克魯拉之腳掉落自沿岸的海蟹。但是，頭骨位於\n"
			.."提拉加德要塞區域。儀式的召喚法陣位於\n主回音島的東南部。召喚並擊殺索伯茲！"
st.warlock.graceTG = "不祥的典籍掉落自艾格蒙德的\n黑眼骨術師。食人妖之血掉落自\n"
			.."加倫斯陰魂的腐皮食人妖。\n\n獵犬的顎骨（不是狼的，儘管\n"
			.."你會在網上看到相反的說法\n）無處不在，但我仍標記了一些\n"
			.."位於艾格蒙德／加倫斯區域之間的位置。\n\n"
			.."當你需要召喚索伯茲時，前往\n幽暗城的下水道入口。法陣\n"
			.."大約位於半路的位置。召喚。擊殺。恭喜你！"
st.warlock.firesWake = "從在南海鎮和陶倫磨坊間來回走的\n札克斯購買炸藥。\n\n"
			.."然後前往杜恩霍爾德堡壘。\n越過橋樑，沿著路徑前進，\n"
			.."然後左轉，進入舊堡壘。\n查看右側，那裡有一堆\n碎石塊。\n\n"
			.."站在上面！！！你剛剛花了 5\n%$@%$ 的金幣！使用你的炸藥。\n\n"
			.."從儲物櫃取得你的符文。\n快點！任何笨蛋都可以偷走它！5g !!!\n\n"
			.."雕刻它。輕輕鬆鬆，手到擒來！"
st.warlock.shadowbolts = "部落只需要到位於荒蕪之地的\n汙泥沼澤的監工洛格維茲\n"
			.."以及奧格瑪的附近。使用你的吸取靈魂。\n取得你的新貪婪之魂並用於\n附近的飢餓雕像。恭喜你！\n\n"
			.."或者前往銀松森林並\n從鴉爪軍團怪物處獲得一個受折磨的靈魂。\n"
			.."獲得後，你必須先使用生命分流。現在\n使用你的受折磨的靈魂。擊殺幽靈。獲勝！\n\n"
			.."若聯盟正在達納蘇斯進行某個任務，聯盟\n可能會自動獲得符文。\n"
			.."我已標記任務的狀態與位置。\n\n聯盟最好前往位於洛克莫丹的\n"
			.."鐵帶採掘點據點。在東南部，你會看到惡魔\n殘骸。以暗影系法術攻擊它。擊殺生成的怪物！\n\n"
			.."或者，沿著西部荒野的南部海岸尋找老墨克眼光。使用你的吸取靈魂\n並獲得海洋之魂。前往海岸上的海洋之像。在它身上使用你的海洋之魂。恭喜你！\n\n"
			.."(我懷疑部落也可以來這裡)\n"
			.."(我想聯盟也可以做兩項部落的任務！)"
st.warlock.tactics = "部落前往提瑞斯法林地\n的死者侍僧。位於湖泊東邊，\n"
			.."接近通往聖光修道院的路徑。\n\n反過來，聯盟在艾爾文森林的\n水晶湖、碧玉 Lode 礦坑末端北方發現死者侍僧。\n"
			.."掠奪死者侍僧。前往布瑞爾（部落）\n加洛斯終點的樓上的魯伯特．博奇，或\n"
			.."金閃鎮（聯盟）獅子驕傲旅館樓下的麥西米利安．克羅。\n\n"
			.."你必須回到\n"
			.."死者侍僧。\n\n接下來，你有 10 分鐘的時間前往\n幽暗城的法師區的凱倫丁．哈爾加（部落）或\n"
			.."暴風城的法師區的地下室的黑暗縛靈者蓋金（聯盟）\n\n"
			.."享受你的獎勵吧！"
st.warlock.soulSiphon = "聯盟必須選擇位於遙遠\n的東南方 Dun Morogh 的\n"
			.."鐵帶營地的貝德隊長或\n艾爾文森林的霍格。\n\n同樣的，部落會選擇\n位於奧格瑪附近的骷髏岩洞穴中的\n"
			.."加茲魯或提瑞斯法林地\n加倫斯陰魂小屋中的蛆眼。\n\n"
			.."你的目標是吸取並取得\n一個腐化的靈魂碎片。\n\n你還需要從任何生物那裡\n"
			.."取得一個純淨的靈魂碎片。\n\n如果你是聯盟，就把兩個碎片都帶給\n卡拉諾斯旅館南方的加克利克．虛空扭曲或\n"
			.."金閃鎮獅子驕傲旅館的達米安．肯恩。\n\n部落會在剃刀嶺兵營中尋找\n"
			.."達瑪克．血嚎或幽暗城法師區的丹頓．布萊威。\n\n你會收到你的靈魂虹吸符文！" 
st.warrior.bloodFrenzy = "一場友好的決鬥。所以直接打敗他！"
st.warrior.consumedRage = "位於後方（當然）\n濕地的 Thelgen 岩洞。等級 25，但\n"
			.."不是特別難。獵人和戰士（聯盟／部落）"
st.warrior.devastate = "在過程中，你會收到以下戰利品。\n每個 NPC 要求三件物品。你可以單獨或\n"
			.."一起交出。\n\n這些物品會在和 NPC 相同的區域中掉落。\n"
			.."部落 NPC 之間有少部分重疊。\n\n以下是 NPC 與地點：\n"
			.."* Junni Steelpass，卡拉諾斯；* Viktoria Woods，西南；\n* Delwynna，達納蘇斯；* Vahi Bonespliter，剃刀嶺；\n"
			.."* Vateya Timberhoof，血蹄；* Dorac Graves，幽暗城。\n\n"
st.warrior.devastateDel = "德爾維娜需要斬斷的老虎頭、斬斷的貓頭鷹頭和斬斷的蜘蛛頭。\n全部都很豐富，\n"
			.."特別是多拉納爾東南方星光林地區域。避開蛛林中的神諭林地。\n"
			.."其他怪物的名字是「軍刀」和「貓頭鷹」。\n\n"
			.."地圖上沒有標記任何一個。太多！"
st.warrior.devastateDor = "多拉克需要一個斬斷的蝙蝠頭，來自\n遍布提瑞斯法林的無數暮光蝙蝠\n"
			.."(除了艾格蒙德磨坊) 沒有在地圖上標記；一個斬斷的食人妖頭，來自\n"
			.."加倫斯陰魂南方和加倫斯陰魂小屋的任何腐皮；以及一個斬斷的魚人頭，來自\n沿岸的任何卑劣鰭"
st.warrior.devastateJunni = "Junni 需要：原始穴居人之心，來自遠東南方岩顎怪物；斬斷的巨魔頭，\n"
			.."遠西南方霜鬃怪物（大多數）；斬斷的溫迪戈掌，來自洞穴裡的溫迪戈"
st.warrior.devastateVah = "瓦希需要一個斬斷的半人馬頭，來自\n南部海岸；一個斬斷的鳥妖頭，來自\n"
			.."位於 Org/Razor 之間的塵風鳥妖飛地；以及一個斬斷的豪豬頭，來自\n剃刀嶺西方的剃刀鬃"
st.warrior.devastateVat = "瓦特亞需要一個斬斷的豪豬頭，來自\n東北方的剛鬃入侵者；\n"
			.."斬斷的鳥妖頭，大多位於莫高雷的北緣的鳥妖；以及\n"
			.."斬斷的食人妖頭，來自血蹄村西部和南方的蒼白鬃"
st.warrior.devastateVik = "維多利亞需要：斬斷的狗頭人頭，來自任何礦場附近的穴居人；\n"
			.."斬斷的魚人頭，來自水晶湖；斬斷的食人妖頭，來自食人妖，\n"
			.."在霍格爾區域周圍大量存在"
st.warrior.endlessRage = "聯盟可以選擇沿著南部\n西泉谷海岸追捕老墨克眼光；\n"
			.."在洛克莫丹東北角與菁英食人魔戰鬥；或\n"
			.."擊敗位於你的任務中心附近的賽多拉克斯女士。\n\n"
			.."部落需要從十字路口旅店旁邊\n取得一個很容易看到的旗幟，\n"
			.."然後挑戰位於北戍堡的石釀中尉或\n在銀松森林的詭譎黑暗洞穴中擊殺一個怪物。\n\n"
			.."做你方便的即可"
st.warrior.frenziedAssault = "與以下其中一位交談：\n賈姆嘉，拖拉，奧格瑪；\n"
			.."內塔莉．普勞溫德，靈魂之昇，雷霆崖；\n"
			.."潘妮．霍金斯，布瑞爾旅館，提瑞斯法林地（部落）或\n"
			.."布魯克．巴利比爾德，鐵爐堡的旅館老闆，莉芙．布拉德福，公園，暴風城；\n"
			.."達納蘇斯泰達希爾的旅館老闆凱爾達米爾（聯盟）\n\n"
			.."他們會要求你彈開某人。很簡單！"
st.warrior.furiousThunder = "兩個陣營都有大量的耕種選擇\n從艾爾文森林的霍格開始。\n\n"
			.."聯盟有艾丹．嚎叫者，費奧迪，老艾斯比爾德，\n"
			.."在 Dun Morogh 中的瓦加什和維傑克；金牙和\n"
			.."格拉夫．迅咬在艾爾文森林中四處遊蕩；\n在大德拉希爾的格納爾派恩儲藏箱中掠奪！\n\n"
			.."部落也可以選擇死亡撕裂者和閃電皮革怪物，\n加茲魯（位於 Org 附近）和杜洛塔的薩科斯；\n"
			.."阿拉契亞怪物，潛伏者，蛇矛，耙子和\n在莫高雷的姊妹仇恨者；不要忘記\n"
			.."提瑞斯法林地的吉爾加。天哪！掠奪和學習！"
st.warrior.harenTip = "當任何 Mo'grosh 食人魔王掉落戰鬥圖騰時，\n"
			.."使用它來挑戰哈倫．迅蹄進行決鬥，哈倫．迅蹄運行接近 The Loch"
st.warrior.quickStrike = "部落應該前往棘齒城的小克，購買一根\nFishing Harpoon，然後游出去用魚叉捕捉\n"
			.."布魯茲。\n\n同樣的，聯盟的選項包括以扭曲的魚叉擊敗\n"
			.."帕克索茲。地點位於達克夏東方的馬西亞拉遺跡，\n"
			.."但首先要從一隻死烏龜頭上掠奪。\n\n"
			.."聯盟也可以從西泉谷的任何迪菲亞斯怪物那裡獲得一瓶魚鰩汁，\n"
			.."用它來殺死沿著南海岸的魚人以取得靈魂之海，\n然後前往美杜莎雕像，然後殺死下一個怪物。\n\n"
			.."更簡單的是，在洛克莫丹的德爾薩瑪西方的穴居人。\n他們會掉落一塊地球。最好查看我提供的工具提示"
st.warrior.ragingBlow = "三件要取回的物品。頭盔位於\n影牙城堡，位於銀松森林南方的 22-30 級地下城。\n"
			.."它位於第 4 位首領司令春谷後的長椅上。\n\n"
			.."「黑鐵企業家」銷售長矛。他位於\n"
			.."濕地的洞穴模組，靠近阿拉希高地的邊界。\n\n"
			.."盾牌很方便地掛在牆上，\n"
			.."位於紅脊山的石望堡中的加錫爾佐格的後面。\n"
			.."部落應該在聯盟標記怪物後復活，哈哈。"
 
st.agon = "你需要殺死阿貢，一頭野豬。\n"
			.."只有一個人可以獲得掉落物，單獨或組隊。\n重生成很快，2-3 分鐘"
st.allClass = { "DRUID", "HUNTER", "MAGE", "PALADIN", "PRIEST", "ROGUE", "SHAMAN", "WARLOCK", "WARRIOR" }
																																
																											  
st.allSpellG = { "Survival of the Fittest", "Lone Wolf", "Rewind Time", "Divine Sacrifice", "Serendipity", "Main Gauche",
				"Dual Wield Specialization", "Demonic Pact", "Warbringer" }
																														 
																									   
								   
st.allSpellACA = { "Skull Bash", "Serpent Spread", "Arcane Surge", "Beacon of Light", "Mind Sear", "Just a Flesh Wound",
					"Healing Rain", "Everlasting Affliction", "Single-Minded Fury" }
st.duskwoodCrypts = "標記要首先進入哪個地穴的地圖標記。\n\n在第一個地穴中左轉。點擊灰塵寶箱並拾取破舊的護身符。離開\n\n在第二個地穴中，右轉進入王座\n"
			.."房間。對沉睡的骨頭使用護身符。\n\n你剛喚醒了一個 25 級的巫妖。戰利品！"
st.frozen = "部落前往剃刀嶺以東的凍原馬庫拉\n或前往提瑞斯法林地西北方光明水湖的凍原魚人\n\n聯盟也尋找凍原魚人，地點位於艾爾文森林的石墓湖中，或者他們會\n"
			.."前往丹莫羅的格爾巴採石場中找到凍原穴居怪。\n\n"
			.."這些都需要除霜，你需要協助\n施加足夠的烈焰減益"
st.grizzby = "棘齒城裡的灰比在 20 級以上的等級上有三個任務。\n然後你可以購買符文。\n\n"
			.."第一個任務會將你傳送到石爪山脈。\n掉落率約為 2/3，或灰谷 (A)。\n\n"
			.."前往濕地進行第二個任務。\n\n最終任務是魚油。可在整個\n"
			.."艾澤拉斯獲得。我標記了費伍德森林、索拉查盆地、凄涼之地和荊棘谷。所有掉落率皆超過 40\n"
			.."％。或者，如果你很有錢，那就交易或去拍賣行吧！"
st.starterZoneClass = "所有地點都在你開始的區域，\n來自你的職業訓練師。你絕對不會錯過它！\n目標也已標示"
st.supplyFaction = "到達友好的艾澤拉斯商業權威 (A) 或杜塔爾補給和\n後勤 (H)。現在你可以購買\n符文！"
st.woundedAdventurer = "前往灰熊洞穴，丹莫羅；傑羅德著陸點以東的山丘；\n森林以東的先知林地，泰達希爾(A)\n\n透過冒險公司北部出口的懸崖到達\n礦場，莫高雷；科爾卡懸崖，辛精村以西，杜塔爾\n\n點擊骨骸。另一個人點擊召喚傳送門。\n\n"
			.."點擊精神以獲得戰利品"
st.woundedAdventurerStart = "艾爾文森林，閃金鎮東南 (A)，卡拉諾斯，\n丹莫羅 (A)，西北泰達希爾 (A)，杜塔爾，辛精以西\n"
			.."(H)，莫高雷，北方冒險公司礦場 (H)"
st.zixil = "他的限量物品清單是艾澤拉斯最廣泛的。\n最好現在就儲備！"

--=======================================================================================================
--
-- QUICK START / MAIN DATA STRUCTURE
--
--=======================================================================================================

st.supplyFactionStart = "Elaine Compton, \"Azeroth Commerce Authority Vendor\", Stormwind (A),\n"
			.."Jornah, \"Durotar Supply and Logistics Vendor\", Orgrimmar (H)"
st.twoPlusHealers = "2+ Players - Healers. First step: Find Adventurer's Remains/Spirit: \n"

ns.runes = {
		
	["DRUID"] = {			
		["Fury of Stormrage"]={ rune="Lunar Idol", spellID=414799, level=2, icon=1,
			start="Grellkin mobs, Shadowglen (A). Chest in Brambleblade Ravine, The Barrens (H)" },
		["Living Seed"]={ rune="Rune of Natural Potential", spellID=414677, level=2, icon=2,
			start="Gather Glade Flowers from all over Teldrassil (A); Gather Prairie Flowers from all over Mulgore (H)" },
		["Sunfire"]={ rune="Rune of The Sun", spellID=414684, level=4, icon=3,
			start="White Lunar Stones: south-east Teldrassil (A); south-west Mulgore (H)" },
		["Lifebloom"]={ rune="Rune of Life", spellID=408124, level=7, icon=4,
			start=st.twoPlusHealers .."Oracle Glade, Teldrassil (A); near northern exit, Venture Co cave, Mulgore (H)" },
		["Mangle"]={ rune="Idol of Ursine Rage", spellID=409828, level=10, icon=5,
			start="Rageclaw, near Ban'ethil Barrow Den, Teldrassil; Flatland Prowler mobs, north and north-east of Mulgore (H)" },
		["Wild Strikes"]={ rune="Idol of the Wild", spellID=407977, level=14, icon=6,
			start="Grimtotem mobs, south-east entrance/exit of Stonetalon Mountains" },
		["Lacerate"]={ rune="Rune of Lacerate", spellID=414644, level=15, icon=7,
			start="Khara Deepwater, The Loch, Loch Modan (A)\n"
				.."Crab Treats from coastal Furlbogs, Darkshore; Abandoned Snapjaw Nest, Forgotten Pools, The Barrens" },
		["Savage Roar"]={ rune="Ferocious Idol", spellID=407988, level=15, icon=8,
			start="Den Mother, west of Bashal'aran, Darkshore; Kolkar's Booty in centaur camps, The Barrens (H)" },
		["Skull Bash"]={ rune="Rune of Skull Bash", spellID=410176, level=15, icon=9,
			start=st.supplyFactionStart },
		["Starsurge"]={ rune="Rune of the Stars", spellID=417157, level=20, icon=10,
			start="Speak to Grugimdern, under a bridge, north-east Wetlands" },
		["Survival of the Fittest"]={ rune="Rune of Survival", spellID=411115, level=20, icon=11,
			start="Grizzby @ Ratchet, The Barrens" },
		["Wild Growth"]={ rune="Rune of Wild Growth", spellID=408120, level=20, icon=12,
			start="Speak to Loganaar, Nighthaven, Moonglade" },
		
		spells={ "Fury of Stormrage", "Living Seed", "Sunfire", "Lifebloom", "Mangle",
			"Wild Strikes", "Lacerate", "Savage Roar", "Skull Bash", "Starsurge",
			"Survival of the Fittest", "Wild Growth" },
	},

	["HUNTER"] = {
		["Chimera Shot"]={ rune="Rune of Chimera", spellID=409433, level=2, icon=1,
				start="Thorgas Grimson, Anvilmar, Coldridge Valley; Ayanna Everstride, Aldrassil, Shadowglen (A).\n"
					.."Jen'Shan, Valley of the Trials; Lanka Farshot, Red Cloud Mesa (H)" },
		["Explosive Shot"]={ rune="Rune of Explosive Shot", spellID=409552, level=5, icon=2,
				start="Various Elites/Rares in Dun Morogh (A) and Mulgore (H); Rageclaw, in the Ban'ethil Barrow Den, Teldrassil (A)" },
		["Master Marksman"]={ rune="Rune of Marksmanshi", spellID=409428, level=6, icon=3,
				start="Rustling Bush: off the path towards Oracle Grove, Teldrassil; south of Brewnall Village, Dun Morogh (A)\n"
					.."West from Razor Hill, veering south; east of Bloodhoof Village, near the lake, Mulgore (H)" },
		["Flanking Strike"]={ rune="Rune of Flanking", spellID=415320, level=8, icon=4,
				start="Jorul, east of Brewnall Village, near the cave, Dun Morogh; Mowgh, northern Teldrassil, opposite the Glade (A)\n"
					.."Raul, northern Echo Isles, Durotar; Mokwa, north-west of Bloodhoof Village, Mulgore" },
		["Carve"]={ rune="Rune of Carve", spellID=425711, level=10, icon=5,
				start="Tame animals with reagent: Amberstill Ranch, Dun Morogh; Relaeron, Darnassus (A)\n"
					.."Razzil, Razor Hill, Durotar; Takoda Sunmane, Bloodhoof Village, Mulgore (H)" },
		["Beast Mastery"]={ rune="Rune of Beast Mastery", spellID=409368, level=15, icon=6,
				start="Furbolg camp, Darkshore; Farstrider Lodge, Loch Modan; Silverspur, north of Gold Coast Quarry, Westfall (A)\n"
					.."Ferocious Grizzled Bear, northern Silverpine Forest; Patrolling Cheetah, north of Taurajo, The Barrens (H)" },
		["Serpent Spread"]={ rune="Rune of Serpent Spread", spellID=425738, level=15, icon=7,
				start=st.supplyFactionStart },
		["Kill Command"]={ rune="Rune of Kill Command", spellID=409379, level=20, icon=8,
				start="Jixo Madrocket, near Sun Rock Retreat, Stonetalon Mountains (A/H)" },
		["Sniper Training"]={ rune="Rune of the Sniper", spellID=415399, level=20, icon=9,
				start="Gnarled Harpoon, west of the Ruins of Mathystra, Darkshore; Kackle, in The Loch (south), Loch Modan;\n"
					.."Defias Scout, Sentinel Hill, Westfall (A); Kilxx, Ratchet, The Barrens (H)" },		
		["Lone Wolf"]={ rune="Rune of Lone wolf", spellID=415370, level=20, icon=10,
				start="Grizzby @ Ratchet, The Barrens" },
		["Heart of the Lion"]={ rune="Rune of Heart of the Lion", spellID=409580, level=25, icon=11,
				start="Carrodin, rear of the Thelgen Rock Cave, Wetlands (A/H)" },
		["Cobra Strikes"]={ rune="Rune of Cobra Strikes", spellID=425713, level=25, icon=12,
				start="Zixil, wanders between Tarren Mill and Southshore, Hillsbrad Foothills (A/H)" },

		spells={ "Chimera Shot", "Explosive Shot", "Master Marksman", "Flanking Strike", "Carve",
			"Beast Mastery", "Serpent Spread", "Kill Command", "Sniper Training", "Lone Wolf",
			"Heart of the Lion", "Cobra Strikes" },
	},
				
	["MAGE"] = {
		["Ice Lance"]={ rune="Spell Notes: Ice Lance", spellID=400640, level=2, icon=1,
				start="Marryk Nurrbit, back of Anvilmar, Dun Morogh; Khelden Bremen, Northshire Abbey, Elwynn Forest (A)\n"
					.."Mai'ah, Valley of Trials, Durotar; Isabella, Deathknell, Tirisfal Glades (H)" },
		["Living Flame"]={ rune="Spell Notes: Living Flame", spellID=401556, level=8, icon=2,
				start="Kobold mobs near Jasperlode Mine, Elwynn Forest; Frostmane mobs north-west of Kharanos, Dun Morogh (A)\n"
					.."Burning Blade mobs, Skull Rock, Durotar; Scarlet mobs, Solliden Farm, Tirisfal Glades (H)" },
		["Enlightenment"]={ rune="Spell Notes: Enlightenment", spellID=412324, level=8, icon=3,
				start="Any critter in Elwynn Forest but near Ridgepoint Tower is suggested.\n"
					.."Or Odd Melons you see around any farm in Tirisfal Glades" },
		["Burnout"]={ rune="Spell Notes: Burnout", spellID=412286, level=9, icon=4,
				start="Frozen: Trogg, Gol'bolar quarry, Dun Morogh; Murloc, Stonecairn Lake, Elwynn Forest (A)\n"
					.."Makrura, east of Razor Hill, Durotar; Murloc, north-west of Brightwater Lake, Tirisfal Glades (H)" },
		["Fingers of Frost"]={ rune="Spell Notes: Fingers of Frost", spellID=400647, level=10, icon=5,
				start="Several elite/rares in Dun Morogh; Hogger Elwynn Forest (A),\n"
					.."Zalazane, Echo Isles, Duratar; Gazz'uz, cave near Orgrimmar, Durotar; Gillgar, Tirisfal Glades (H)" },
		["Living Bomb"]={ rune="Spell Notes: Living Bomb", spellID=400613, level=12, icon=6,
				start="Stonesplitter caves and northern lake, Loch Modan (A/H);\n"
					.."Extra reward from a small quest chain. Begin: \"A Talking Head\" mob drop on Fenris Isle, Silverpine (H)" },
		["Arcane Surge"]={ rune="Spell Notes: Arcane Surge", spellID=425124, level=15, icon=7,
				start=st.supplyFactionStart },
		["Regeneration"]={ rune="Spell Notes: Regeneration", spellID=401417, level=15, icon=8,
				start="Stack of books in the south hut of the northern island, The Loch, Loch Modan; Defias Pillager, Westfall (A)\n"
					.."Dalaran Apprentice, Silverpine Forest; Kolkar's Booty in centaur camps, The Barrens (H)" },
		["Arcane Blast"]={ rune="Spell Notes: Arcane Blast", spellID=400574, level=18, icon=9,
				start="Naga Manuscript from Wrathtail Naga, Zoram Strand, north coast of Ashenvale (A/H)" },
		["Icy Veins"]={ rune="Spell Notes: Icy Veins", spellID=425121, level=20, icon=10,
				start="Collect 10 books across Azeroth, too numerous to list here, but...\n"
					.."see my detailed guide at: Garion Wendell in the Stormwind Mage Tower\n"
					.."portal room (A) or Owen Thadd in the Mages Quarter of Undercity (H)" },
		["Rewind Time"]={ rune="Spell Notes: Rewind Time", spellID=401462, level=20, icon=11,
				start="Grizzby @ Ratchet, The Barrens" },
		["Mass Regeneration"]={ rune="Spell Notes: Mass Regeneration", spellID=412510, level=25, icon=12,
				start="Crypts in the Raven Hill Cemetary, Duskwood" },

		spells={ "Ice Lance", "Living Flame", "Enlightenment", "Burnout", "Fingers of Frost", "Living Bomb", "Arcane Surge",
				"Regeneration", "Arcane Blast", "Icy Veins", "Rewind Time", "Mass Regeneration" },
	},
					
	["PALADIN"] = {
		["Crusader Strike"]={ rune="Libram of Judgement", spellID=407676, level=4, icon=1,
				start="Bromos Grummner, Anvilmar, Dun Morogh; Brother Sammuel, Northshire Abbey, Elwynn Forest" },
		["Inspiration Exemplar"]={ rune="Rune of Inspiration", spellID=407880, level=5, icon=2,
				start=st.twoPlusHealers .."Wendigo Cave, Dun Morogh; east of Jarod's Landing, Elwynn Forest" },
		["Rebuke"]={ rune="Rune of Rebuke", spellID=425609, level=8, icon=3,
				start="Liv Bradford, The Park in Stormwind City" },
		["Aegis"]={ rune="Rune of Aegis", spellID=425589, level=8, icon=4,
				start="Entrance to Gnomeregan (don't go in), Dun Morogh; deep inside the Jasperloade Mine, Elwynn Forest" },
		["Horn of Lordaeron"]={ rune="Libram of Blessings", spellID=425600, level=10, icon=5,
				start="On a bench in Thelsamar Tavern, Loch Modan; Undying Laborer, Jangalode Mine, Westfall" },
		["Seal of Martyrdom"]={ rune="Rune of Martyrdom", spellID=407798, level=10, icon=6,
				start="Brother Romulus, Stormwind Cathedral" },
		["Beacon of Light"]={ rune="Rune of Beckoning Light", spellID=407613, level=15, icon=7,
				start=st.supplyFactionStart },
		["Hand of Reckoning"]={ rune="Libram of Justice", spellID=407631, level=15, icon=8,
				start="Far south cave in Stonesplitter Valley, Loch Modan; Defias Drone, far south-east corner of Westfall" },
		["Divine Sacrifice"]={ rune="Rune of Sacrifice", spellID=407804, level=20, icon=9,
				start="Grizzby @ Ratchet, The Barrens" },
		["Avenger's Shield"]={ rune="Rune of the Avenger", spellID=407669, level=23, icon=10,
				start="Dro'zem the Blasphemous, Redridge Mountians. Well south of the\n",
			"Tower of Althalaxx, northern Darkshore" },
		["Divine Storm"]={ rune="Divine Storm Rune", spellID=407778, level=25, icon=11,
				start="Top of the Tower of Althalaxx, northern Darkshore" },
		["Exorcist"]={ rune="Libram of Banishmen", spellID=415076, level=25, icon=12,
				start="Defias mobs on the souther border of Duskwood" },

		spells={ "Crusader Strike", "Inspiration Exemplar", "Rebuke", "Aegis", "Horn of Lordaeron",
			"Seal of Martyrdom", "Beacon of Light", "Hand of Reckoning", "Divine Sacrifice",
			"Avenger's Shield", "Divine Storm", "Exorcist" },
	},

	["PRIEST"] = {
		["Penance"]={ rune="Memory of a Troubled Acolyte", spellID=402174, level=2, icon=1,
				start= "Branstock Khalder, Anvilmar, Coldridge Valley; Kobolds, Echo Ridge Mine, Northshire; Shanda, Shadowglen (A)\n"
					.."Ken'Jai, Valley of Trials; Dark Cleric Duesten, Deathknell" },
		["Prayer of Mending"]={ rune="Reciprocal Epiphany", spellID=401859, level=7, icon=2,
				start=st.twoPlusHealers
					.."Grizzled Den, Dun Morogh; southern Elwynn Forest; Oracle Glade, Teldrassil (A)\n"
					.."South of and outside of the Valley of Trials, Durotar; near northern exit, Venture Co cave, Mulgore (H)" },
		["Void Plague"]={ rune="Memory of a Dark Purpose", spellID=425204, level=7, icon=3,
				start="Leper Gnome/Gibblewit near Gnomeregan; Goldtooth in Elwynn Forest; Gnarlpine Cache, Ban'ethil Barrow Den, "
					.."Teldrassil (A)\nKul Tiras mob, east of Razor Hill, Durotar; Gillgar, north-west from Deathknell, Tirisfal GladeS (H)" },
		["Homunculi"]={ rune="Prophecy of a Desecrated Citadel", spellID=402799, level=8, icon=4,
				start="Shimmer Ridge, Dun Morogh; Defias Rogue Wizard, Elwynn Forest; Rascal Sprite, Fel Rock Cave, Teldrassil (A);\n"
					.."Voodoo Troll, Echo Isle, Duratar; Scarlet mobs near Solliden Farmstead, Tirisfal Glades (H)" },
		["Shared Pain"]={ rune="Memory of an Imprisoned Saviour", spellID=401969, level=8, icon=5,
				start="Defeat Captain Beld, far south-east Dun Morogh; Kobold Miner mobs, mines, Elwynn Forest; Lord Melenas, Teldrassil (A)\n"
					.."Gazz'uz or Makasgar, Mulgore; Tirisfal Farmer mobs, Tirisfal Glades (H)" },
		["Mind Sear"]={ rune="Tenebrous Epiphany", spellID=413259, level=15, icon=6,
				start=st.supplyFactionStart },
		["Twisted Faith"]={ rune="Memory of a Devout Champion", spellID=425198, level=15, icon=7,
				start="Naga mobs around Ruins of Mathystra, Darkshore; Silverstream Mine, Loch Modan; Gold Coast Quarry, Westfall (A)\n"
					.."Wailing Spirit, southern Silverpine Forest; Razormane mobs, The Barrens (H)" },
		["Shadow Word: Death"]={ rune="Prophecy of a King's Demise", spellID=401955, level=20, icon=8,
				start="Orb, coast, Darkshore; Mo'grosh Stronghold, Loch Modan; Leprithus, Westfall (A)\n"
					.."Thule Ravenclaw, Fenris Isle, Silverpine Forest; Desert Mirage, The Barrens (H)" },
		["Serendipity"]={ rune="Harmonious Epiphany", spellID=413248, level=20, icon=9,
				start="Grizzby @ Ratchet, The Barrens" },
		["Power Word: Barrier"]={ rune="Prophecy of a City Enthralled", spellID=425207, level=23, icon=10,
				start="Blackrock Shadowcaster, Stone watch, Redridge Mountains (A/H)" },
		["Strength of Soul"]={ rune="Prophecy of Seven Visitors", spellID=415739, level=23, icon=11,
				start="Primal Insight from Thistlefur mobs, Ashenvale (A/H)" },
		["Circle of Healing"]={ rune="Prophecy of a Thousand Lights", spellID=401946, level=25, icon=12,
				start="Obtain Dark Insight from Defias mobs in Duskwood (A/H)" },

		spells={ "Penance", "Prayer of Mending", "Void Plague", "Homunculi", "Shared Pain",
			"Mind Sear", "Twisted Faith", "Shadow Word: Death", "Serendipity", 
			"Power Word: Barrier", "Strength of Soul", "Circle of Healing" },
	},
			
	["ROGUE"] = {
		["Shadowstrike"]={ rune="Rune of Shadowstrike", spellID=399985, level=2, icon=1,
				start="Solm Hargrin, Anvilmar, Coldridge Valley; Jorik Kerridan, behind the Northshire Abbey, Northshire\n"
					.."Frahun Shadewhisper, Shadowglen (A). Rwag, Valley of Trials; David Trias, Deathknell (H)" },
		["Quick Draw"]={ rune="Rune of Quick Draw", spellID=398196, level=8, icon=2,
				start="Loot/Pp four segments of a map. See the Tooltip at the turn-in location for details: Dun Morogh: Under\n"
					.."a bridge between Kharanos and Ironforge; Ridgepoint Tower, Elwynn; Rut'theran Village, Teldrassil (A)\n"
					.."Far South, Echo Isles, Durotar; West of Brill, under the bridge, west side, Tirisfal Glades (H)" },
		["Slaughter from the Shadows"]={ rune="Rune of Slaughter", spellID=424925, level=8, icon=3,
				start="Chest above Kharanos Inn, Dun Morogh; above the spooky house north of Goldshire, Elwynn; Gnarlpine Chache,\n"
					.."Barrow Den, Teldrassil (A); Chest at Drygulch Ravine, Durotar; Relic Coffer, Agamand Crypts, Tirisfal (H)" },
		["Mutilate"]={ rune="Rune of Mutilation", spellID=399960, level=8, icon=4,
				start="Pickpocket Dark Iron mobs, far south-east of Dun Morogh; Pp Garrick Padfoot, Northshire (A); Pp Captain\n"
					.."Perrine, west of Unercity (H). Kill Lord Melenas, Teldrassil (A); Speak to Ba'so, south of Razer Hill (H)" },
		["Between the Eyes"]={ rune="Rune of Precision", spellID=400009, level=10, icon=5,
				start="Dusty Chest, Forlorn Cavern, IF; Dusty Chest, Dwarven District, SW; Gnarlpine Stash key from Gnarlines,\n"
					.."Teldrassil (A); Dusty Chest, The Drag, Org; Shipwreck Cache, Tirisfal (H). See Tooltips for details" },
		["Saber Slash"]={ rune="Rune of Saber Slash", spellID=424785, level=15, icon=6,
				start="Auberdine Lighthouse, Darkshore; Stonewrought Dam, Loch Modan; Defias Scout, Sentinel Hill, Westfall (A);\n"
					.."Northwatch Hold, The Barrens; entrance of SFK, Silverpine Forest. Lots more details. See tooltips" },
		["Blade Dance"]={ rune="Rune of Blade Dance", spellID=400012, level=15, icon=7,
				start="Kill Naga at Cliffspring River Cave, Darkshore; Pp Dark Iron Dwarves, Loch Modan; Pp Defias, Westfall (A)\n"
					.."Pp Southsea Pirates, south of Ratchet, The Barrens (H). Lots more details,. See tooltips" },
		["Just a Flesh Wound"]={ rune="Rune of Teasing", spellID=400014, level=15, icon=8,
				start=st.supplyFactionStart },
		["Envenom"]={ rune="Rune of Venom", spellID=399963, level=20, icon=9,
				start="Purchase a Hot Tip from a vendor lurking behind Durnholde Keep, Hillsbrad Foothills" },
		["Main Gauche"]={ rune="Rune of Main Gauche", spellID=424919, level=20, icon=10,
				start="Grizzby @ Ratchet, The Barrens" },
		["Deadly Brew"]={ rune="Rune of Deadly Brew", spellID=399965, level=22, icon=11,
				start="Pyrewood Village, Silverpine Forest. Lengthy, with quests. See tooltip for details" },		
		["Shiv"]={ rune="Rune of Shiving", spellID=424800, level=25, icon=12,
				start="Pickpocket Defias Night Runner in Duskwood. South of the Raven Hill Cemetary" },

		spells={ "Shadowstrike", "Quick Draw", "Slaughter from the Shadows",  "Mutilate", "Between the Eyes", "Saber Slash",
			"Blade Dance", "Just a Flesh Wound", "Envenom", "Main Gauche", "Deadly Brew", "Shiv" },
	},
			
	["SHAMAN"] = {
		["Overload"]={ rune="Dyadic Icon", spellID=408438, level=2, icon=1,
				start="Troll/Orc: Shikrik in Valley of Trials, Durotar; Tauren: Meela Dawnstrider in Camp Narache, Mulgore" },
		["Lava Lash"]={ rune="Lava Lash", spellID=408507, level=4, icon=2,
				start="Speak to Boarton Shadetotem, main Thunder Bluff mesa, Mulgore" },
		["Shield Mastery"]={ rune="Galvanic Iron", spellID=408524, level=6, icon=3,
				start="Randomly spawned Galvanic Totems in Durotar and Mulgore. Listen and look for them as you quest. Don't delay" },
		["Ancestral Guidance"]={ rune="Echo of the Ancestors", spellID=409324, level=7, icon=4,
				start=st.twoPlusHealers .."Kolkar Crag, far south-west Durotar; on an overlook, via Venture Co Mine, Mulgore" },
		["Molten Blast"]={ rune="Sulfurous Icon", spellID=425339, level=8, icon=5,
				start="Frozen Makrura, Durotar; Bael'Dun Digsite, south-west of Thunder Bluff" },
		["Way of Earth"]={ rune="Earthen Rune", spellID=408531, level=12, icon=6,
				start="Purge Desert Mirage, west of Ratchet, The Barrens; Rot Hide Mystics, Silverpine Forest" },
		["Healing Rain"]={ rune="Rune of Healing Rain", spellID=415236, level=15, icon=7,
				start=st.supplyFactionStart },
		["Water Shield"]={ rune="Tempest Icon", spellID=408510, level=15, icon=8,
				start="Kolkar's Booty in centaur camps, The Barrens; Grimson the Pale, Deep Elem Mine, Silverpine Forest" },
		["Dual Wield Specialization"]={ rune="Rune of Dual Wield Specialization", spellID=408496, level=20, icon=9,
				start="Grizzby @ Ratchet, The Barrens" },
		["Lava Burst"]={ rune="Kajaric Icon", spellID=408490, level=25, icon=10,
				start="Mudsnout Shaman, Hillsbrad Foothills" },
		["Shamanistic Rage"]={ rune="Rune of Primordial Fury", spellID=425336, level=25, icon=11,
				start="Primordial Anomaly, south of the Charred Vale, Stonetalon Mountains. More details. See tooltip" },
		["Earth Shield"]={ rune="Rune of Earth Shield", spellID=408514, level=25, icon=12,
				start="Kill Baron Aquanis in Blackfathom Deeps" },

		spells={ "Overload", "Lava Lash", "Shield Mastery", "Ancestral Guidance", "Molten Blast",
			"Way of Earth", "Healing Rain", "Water Shield", "Dual Wield Specialization",
			"Lava Burst", "Shamanistic Rage", "Earth Shield" },
	},

	["WARLOCK"] = {
		["Haunt"]={ rune="Rune of Haunting", spellID=403501, level=2, icon=1,
				start="Speak to Alamar Grimm, Anvilmar, Coldridge Valley; Drusilla La Salle, Northshire (A).\n"
					.."Nartok, Valley of Trials; Maximillion, Deathknell (H)" },
		["Chaos Bolt"]={ rune="Rune of Chaos Bolt", spellID=403629, level=6, icon=2,
				start="Frozen: Trogg, Gol'bolar quarry, Dun Morogh; Murloc, Stonecairn Lake, Elwynn Forest (A)\n"
					.."Makrura, east of Razor Hill, Durotar; Murloc, north-west of Brightwater Lake, Tirisfal Glades (H)" },
		["Demonic Grace"]={ rune="Rune of Grace", spellID=425463, level=8, icon=3,
				start="Ominous Tome drops from: Frostmane Shadowcaster, cave west of Brewnall, Dun Morogh; Lasperlode Mine Kobolds,\n"
					.."Elwynn Forest (A). Voodoo Doll on Echo Isles, Durotar; Darkeye Bonecaster, Agamand Mills, Tirisfal (H)" },
		["Demonic Tactics"]={ rune="Rune of Tactics", spellID=412727, level=8, icon=4,
				start="Dead Acolyte near Jasperlode Mine, Elwynn Forest (A);\n"
					.."Dead Acolyte, towards the Monastery, Tirisfal Glades (H)" },
		["Soul Siphon"]={ rune="Rune of Soul Siphon", spellID=403511, level=10, icon=5,
				start="Use Drain Soul twice. See these tooltips: Captain Beld, far south-east Dun Morogh; Hogger, Elwynn Forest (A)\n"
					.."Gazz'uz, cave outside Orgrimmar; Maggot Eye, Garren's Haunt, Tirisfal Glades (H)" },
		["Master Channeler"]={ rune="Rune of Channeling", spellID=403668, level=12, icon=6,
				start="Greishan Ironstove, long path, Loch Modan; Dark Strand Fanatics, Tower of Athalaxx, Darkshore (A)\n"
					.."Altar of Thorns, Thorn Hill, The Barrens; Sadistic Fiend, Deep Elm Mine, Silverpine Forest (H)" },
		["Everlasting Affliction"]={ rune="Rune of Everlasting Affliction", spellID=412689, level=15, icon=7,
				start=st.supplyFactionStart },
		["Lake of Fire"]={ rune="Rune of Fires Wake", spellID=403666, level=20, icon=8,
				start="Zixil, wanders between Tarren Mill and Southshore, Hillsbrad Foothills (A/H)" },
		["Shadow Bolt Volley"]={ rune="Rune of Shadowbolts", spellID=403628, level=20, icon=9,
				start="Delmanis the Hated, Tower of Athalaxx, Darkshore; Demonic Remains, Ironbands Excavation, Loch Modan (A)\n"
					.."Supervisor Lugwizzle, Sludge Fen, The Barrens; Ravenclaw mobs, Beren's Peril cave, Silverpine Forest (H)" },
		["Demonic Pact"]={ rune="Rune of the Pact", spellID=425464, level=20, icon=10,
				start="Grizzby @ Ratchet, The Barrens" },
		["Incinerate"]={ rune="Rune of Incinerate", spellID=412758, level=23, icon=11,
				start="Incinerator Gar'im, cave south-east corner of Redridge (A/H)" },
		["Metamorphosis"]={ rune="Rune of Metamorphosis", spellID=403789, level=25, icon=12,
				start="Doan Karhan, near Camp Taurajo, southern Barrens" },

		spells={ "Haunt", "Chaos Bolt", "Demonic Grace", "Demonic Tactics", "Soul Siphon",
			"Master Channeler", "Everlasting Affliction", "Lake of Fire", "Shadow Bolt Volley",
			"Demonic Pact", "Incinerate", "Metamorphosis" },
	},

	["WARRIOR"] = {
		["Victory Rush"]={ rune="Rune of Victory Rush", spellID=402927, level=2, icon=1,
				start="You'll stumble across the stash / quest while questing in your starting zone" },
		["Blood Frenzy"]={ rune="Rune of Blood Frenzy", spellID=412507, level=7, icon=2,
				start="Wandering Swordsman: Westbrook Garrison, Elwynn Forest (A); Bladescar Highlands, Durotar (H). Other locations" },
		["Furious Thunder"]={ rune="Rune of Furious Thunder", spellID=403219, level=7, icon=3,
				start="Various Elites/Rares in Dun Morogh (A) and Durotar, Mulgore (H); Goldtooth, Mother Fang in Elwynn Forest (A)\n"
				.."Gnarlpine Cache, Ban'ethil Barrow Den, Teldrassil (A); Gillgar, west of Soliden Farmstead, Tirisfal (H)" },
		["Devastate"]={ rune="Rune of Devastate", spellID=403196, level=8, icon=4,
				start="Junni Steelpass, Kharanos; Viktoria Woods, SW; Delwynna, Darn; Vahi Bonespliter, Razor Hill;\n"
				.."Vateya Timberhoof, Bloodhoof; Dorac Graves, UC. Each one will accept three items you'll\n"
				.."loot as you quest normally. Alliance side there's no overlap, Horde - a little overlap.\n"
				.."Check each NPC above for complete, localised, details as way too many too list here" },
		["Frenzied Assault"]={ rune="Rune of Frenzied Assault", spellID=425412, level=10, icon=5,
				start="Simply help one of six people, mostly Innkeepers, one in each main city" },
		["Single-Minded Fury"]={ rune="Rune of Single-Minded Fury", spellID=413404, level=15, icon=6,
				start=st.supplyFactionStart },
		["Endless Rage"]={ rune="Rune of Endless Rage", spellID=403218, level=20, icon=7,
				start="Old Murk-eye, southern coast, Westfall; Lady Sedorax, Darkshore (A);\n"
				.."Horde Warbanner, The Crossroads; Skittering Dark Cave, Silverpine Forest (H)" },
		["Quick Strike"]={ rune="Rune of Quick Strike", spellID=429765, level=20, icon=8,
				start="Paxnozz, Mathystra, Darkshore; Defias in Westfall (A); Kilxx @ Ratchet (H);\n"
				.."Troggs west of Thelsamar, Loch Modan" },
		["Warbringer"]={ rune="Rune of the Warbringer", spellID=425421, level=20, icon=9,
				start="Grizzby @ Ratchet, The Barrens" },
		["Consumed by Rage"]={ rune="Rune of Consuming Rage", spellID=425418, level=25, icon=10,
				start="Carrodin @ Thelgen Rock Cave, Wetlands" },
		["Flagellation"]={ rune="Rune of Flagellation", spellID=402877, level=25, icon=11,
				start="Crypts in the Raven Hill Cemetary, Duskwood" },
		["Raging Blow"]={ rune="Rune of Raging Blow", spellID=402911, level=25, icon=12,
				start="Alonso, Ashenvale @ the path to Stonetalon Mountains" },

		spells={ "Victory Rush", "Blood Frenzy", "Furious Thunder", "Devastate",
			"Frenzied Assault", "Single-Minded Fury", "Endless Rage", "Quick Strike", 
			"Warbringer", "Consumed by Rage", "Flagellation", "Raging Blow" },
	},
}

--=======================================================================================================
--
-- EASTERN KINGDOMS
--
--=======================================================================================================

points[ 1426 ] = { -- Dun Morogh
																										  
															
																											 
																													
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
					quest={ 77657, {}, ( ( ns.raceID == 3 ) and 77655 or 77656 ) },
					questName={ "Relics of the Light", {}, "The Lost Rune" },
					guide={ st.paladin.judgement, st.rogue.quickDraw ..st.rogue.quickDrawDM, st.starterZoneClass } },
	[23407860] = { name="Ragged Wolf (Various)", class={ "WARLOCK" }, faction="Alliance",
					spell={ "Demonic Grace" }, guide={ st.warlock.grace ..st.warlock.graceDM }, tip="Wolf Jawbone" },
	[24607440] = { npc=724, name="Burly Rockjaw Trogg", class={ "ROGUE" }, faction="Alliance",
					tip="Pick Pocket Top-Left Map Piece",
					spell={ "Quick Draw" }, guide={ st.rogue.quickDraw ..st.rogue.quickDrawDM } },
	[25204440] = { name="Leper Gnome / Gibblewilt", class={ "PRIEST", "ROGUE" }, faction="Alliance",
					tip={ nil, "Leper Gnomes only. Pick pocket\nand kill. Bottom-Right Map Piece" },
					spell={ "Void Plague", "Quick Draw" }, 
					guide={ st.priest.voidPlague, st.rogue.quickDraw .. st.rogue.quickDrawDM } },
	[25405100] = { npc=1124, name="Frostmane Shadowcaster", faction="Alliance", class={ "MAGE", "PRIEST", "WARLOCK", "WARRIOR" },
																							 
							
					spell={ "Living Flame", "Homunculi", "Demonic Grace", "Devastate" },
					guide={ st.mage.livingFlame, st.priest.citadel, st.warlock.grace ..st.warlock.graceDM,
							st.warrior.devastate ..st.warrior.devastateJunni },
														 
					tip={ nil, nil, "Ominous Tome", "Severed Troll Head"} },
	[25604350] = { npc=208802, name="Wounded Adventurer", class={ "PALADIN" }, faction="Alliance",
					spell={ "Aegis" }, guide={ st.paladin.runeOfAegis } }, 
	[26006940] = { name="Wolves (Various)", class={ "WARLOCK" }, faction="Alliance",
					spell={ "Demonic Grace" }, guide={ st.warlock.grace ..st.warlock.graceDM }, tip="Wolf Jawbone" },
																										  
															
																											 
																													
	[26607440] = { name="Wolves (Various)", class={ "WARLOCK" }, faction="Alliance",
					spell={ "Demonic Grace" }, guide={ st.warlock.grace ..st.warlock.graceDM }, tip="Wolf Jawbone" },
	[26737255] = { object=405633, name="Rockjaw Footlocker", class={ "MAGE", "WARLOCK" },  faction="Alliance",
														   
					spell={ "Ice Lance", "Haunt" }, guide={ st.starterZoneClass },
					quest={ 77667, 77666 }, questName={ "Spell Research", "Stolen Power" } },
	[26807620] = { name="Ragged Wolf (Various)", class={ "WARLOCK" }, faction="Alliance",
					spell={ "Demonic Grace" }, guide={ st.warlock.grace ..st.warlock.graceDM }, tip="Wolf Jawbone" },
	[27007840] = { npc=706, name="Frostmane Troll Whelp", class={ "PALADIN", "ROGUE", "WARRIOR" }, faction="Alliance",
					tip={ nil, "Pick Pocket Top-Right Map Piece", nil },
					spell={ "Crusader Strike", "Quick Draw", "Victory Rush" },
					quest={ 77657, {}, ( ( ns.raceID == 3 ) and 77655 or 77656 ) },
					questName={ "Relics of the Light", {}, "The Lost Rune" },
					guide={ st.paladin.judgement, st.rogue.quickDraw ..st.rogue.quickDrawDM, st.starterZoneClass } },
	[27603680] = { name="Leper Gnome / Gibblewilt", class={ "PRIEST", "ROGUE" }, faction="Alliance",
					tip={ nil, "Leper Gnomes only. Pick pocket\nand kill. Bottom-Right Map Piece" },
					spell={ "Void Plague", "Quick Draw" }, 
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
					spell={ "Penance" }, guide={ st.starterZoneClass } },
	[28656615] = { npc=460, name="Alamar Grimm", class={ "WARLOCK" }, faction="Alliance",
					spell={ "Haunt" }, guide={ st.starterZoneClass }, quest={ 77666 },
					questName={ "Stolen Power" } },
	[28716637] = { npc=944, name="Marryk Nurribit", class={ "MAGE" },
					quest={ 77667 }, questName={ "Spell Research" },
					faction="Alliance", spell={ "Ice Lance" }, guide={ st.starterZoneClass } },
	[28804960] = { npc=208975, name="Rustling Bush", class={ "HUNTER" }, faction="Alliance",
					spell={ "Master Marksman" }, guide={ st.hunter.masterMark } },
	[28808060] = { npc=706, name="Frostmane Troll Whelp", class={ "PALADIN", "ROGUE", "WARRIOR" }, faction="Alliance",
					tip={ nil, "Pick Pocket Top-Right Map Piece", nil },
					spell={ "Crusader Strike", "Quick Draw", "Victory Rush" },
					quest={ 77657, {}, ( ( ns.raceID == 3 ) and 77655 or 77656 ) },
					questName={ "Relics of the Light", {}, "The Lost Rune" },
					guide={ st.paladin.judgement, st.rogue.quickDraw ..st.rogue.quickDrawDM, st.starterZoneClass } },
																	   
																					 
	[28836724] = { npc=912, name="Thran Khorman", class={ "WARRIOR" }, rfaction="Alliance",
					spell={ "Victory Rush" }, guide={ st.starterZoneClass },
					quest={ ( ( ns.raceID == 3 ) and 77655 or 77656 ) } },
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
					guide={ st.woundedAdventurer  }, tip="In the Grizzled Den" },
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
	[46605360] = { npc=208652, name="Junni Steelpass", class={ "WARRIOR" }, faction="Alliance",
					spell={ "Devastate" }, guide={ st.warrior.devastate ..st.warrior.devastateJunni } },
	[46964373] = { name="Rune of Quick Draw", faction="Alliance", class={ "ROGUE" }, tip="Final Rune location. Under a bridge",
					spell={ "Quick Draw" }, guide={ st.rogue.quickDraw ..st.rogue.quickDrawTel } },
	[47005200] = { object=387466, name="Rusty Lockbox", class={ "ROGUE" }, faction="Alliance",
					spell={ "Slaughter from the Shadows" }, guide={ st.rogue.slaughter },
					tip="On the roof of the Inn" },
	[47205360] = { npc=209002, name="Gaklik Voidtwist", class={ "WARLOCK" }, faction="Alliance",
					spell={ "Soul Siphon" }, guide={ st.warlock.soulSiphon } },
	[50004580] = { name="Wolves (Various)", class={ "WARLOCK" }, faction="Alliance",
					spell={ "Demonic Grace" }, guide={ st.warlock.grace ..st.warlock.graceDM }, tip="Wolf Jawbone" },
	[50605160] = { name="Wolves (Various)", class={ "WARLOCK" }, faction="Alliance",
					spell={ "Demonic Grace" }, guide={ st.warlock.grace ..st.warlock.graceDM }, tip="Wolf Jawbone" },
	[50805940] = { npc=1130, name="Bjarn", class={ "MAGE" }, faction="Alliance",
					spell={ "Fingers of Frost" }, guide={ st.mage.fingers } },
	[51804000] = { name="Wolves (Various)", class={ "WARLOCK" }, faction="Alliance",
					spell={ "Demonic Grace" }, guide={ st.warlock.grace ..st.warlock.graceDM }, tip="Wolf Jawbone" },
	[51804180] = { npc=203079, name="Wandering Swordsman", class={ "WARRIOR" },
					spell={ "Blood Frenzy" }, guide={ st.warrior.bloodFrenzy } },
	[53804720] = { npc=203079, name="Wandering Swordsman", class={ "WARRIOR" },
					spell={ "Blood Frenzy" }, guide={ st.warrior.bloodFrenzy } },
	[54805640] = { npc=1130, name="Bjarn", class={ "MAGE" }, faction="Alliance",
					spell={ "Fingers of Frost" }, guide={ st.mage.fingers } },
	[55805960] = { npc=1130, name="Bjarn", class={ "MAGE" }, faction="Alliance",
					spell={ "Fingers of Frost" }, guide={ st.mage.fingers } },
	[57204520] = { npc=208886, name="Blackrat", class={ "ROGUE" }, faction="Alliance", tip="Stealthed. In the boat",
					spell={ "Mutilate" }, guide={ st.rogue.mutilate } },
	[57605740] = { npc=1130, name="Bjarn", class={ "MAGE" }, faction="Alliance",
					spell={ "Fingers of Frost" }, guide={ st.mage.fingers } },
	[50805940] = { npc=1130, name="Bjarn", class={ "MAGE" }, faction="Alliance",
					spell={ "Fingers of Frost" }, guide={ st.mage.fingers } },
	[58806230] = { npc=1130, name="Bjarn", class={ "MAGE" }, faction="Alliance",
					spell={ "Fingers of Frost" }, guide={ st.mage.fingers } },
	[59804940] = { npc=1388, name="Vagash", class={ "HUNTER", "MAGE", "WARRIOR" }, faction="Alliance",
																								 
					spell={ "Explosive Shot", "Fingers of Frost", "Furious Thunder" },
					guide={ st.hunter.explosiveShot, st.mage.fingers, st.warrior.furiousThunder } },
	[61405940] = { npc=1130, name="Bjarn", class={ "MAGE" }, faction="Alliance", spell={ "Fingers of Frost" },
															   
																								   
																								 
																	   
					guide={ st.hunter.explosiveShot, st.mage.fingers, st.warrior.furiousThunder } },
	[62604620] = { npc=1388, name="Vagash", class={ "HUNTER", "MAGE", "WARRIOR" }, faction="Alliance",
																								 
					spell={ "Explosive Shot", "Fingers of Frost", "Furious Thunder" },
					guide={ st.hunter.explosiveShot, st.mage.fingers, st.warrior.furiousThunder } },
	[62605640] = { npc=1130, name="Bjarn", class={ "MAGE" }, faction="Alliance",
					spell={ "Fingers of Frost" }, guide={ st.mage.fingers } },
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
																													   
															  
																		 
	[71605140] = { npc=1119, name="Hammerspine", class={ "MAGE" }, faction="Alliance",
					spell={ "Fingers of Frost" }, guide={ st.mage.fingers } },
	[71805040] = { name="Rockjaw mobs (Various)", class={ "ROGUE", "WARRIOR" }, faction="Alliance",
					tip={ "Pick Pocket Top-Left Map Piece", "Pristine Trogg Heart" }, spell={ "Quick Draw", "Devastate" },
					guide={ st.rogue.quickDraw ..st.rogue.quickDrawDM, st.warrior.devastate ..st.warrior.devastateJunni } },
	[72805380] = { npc=1119, name="Hammerspine", class={ "MAGE" }, faction="Alliance",
					spell={ "Fingers of Frost" }, guide={ st.mage.fingers } },
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
	[79003710] = { npc=1961, name="Mangeclaw", class={ "HUNTER", "MAGE" }, faction="Alliance",
					spell={ "Explosive Shot", "Fingers of Frost" }, 
					guide={ st.hunter.explosiveShot, st.mage.fingers } },
}
points[ 1431 ] = { -- Duskwood
	[04402840] = { npc=205153, name="Ada Gelhardt", class={ "PALADIN" }, faction="Alliance",
					spell={ "Seal of Martyrdom" }, guide={ st.paladin.martyrdom } },
	[16702850] = { object=409735, name="Spellbook", class={ "MAGE" },
					spell={ "Icy Veins" }, guide={ st.mage.icyVeins },
					quest={ 78147 }, questName={ "Crimes Against Anatomy" },
					tip="In the last room of the Dawning Wood\nCatacombs. The western building" },
	[17603740] = { object=411328, name="Slumbering Bones", class={ "MAGE", "WARRIOR" },
					spell={ "Mass Regeneration", "Flagellation" }, guide={ st.duskwoodCrypts },
																				
					tip="This Crypt second" },
	[19904550] = { npc=215, name="Defias Night Runner", class={ "ROGUE" },
					tip="/kneel here at the statue, after\nyou obtain an Engraved Gold Ring",
					spell={ "Shiv" }, guide={ st.rogue.shiv } },
	[21406360] = { name="Defias Mobs (Various)", class={ "PALADIN" }, faction="Alliance",
					spell={ "Exorcist" }, guide={ st.paladin.banishment } },
	[21407280] = { name="Defias Mobs (Various)", class={ "PALADIN" }, faction="Alliance",
					spell={ "Exorcist" }, guide={ st.paladin.banishment } },
	[22606880] = { name="Defias Mobs (Various)", class={ "PALADIN" }, faction="Alliance",
					spell={ "Exorcist" }, guide={ st.paladin.banishment } },
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
	[47807600] = { name="Defias Mobs (Various)", class={ "PALADIN" }, faction="Alliance",
					spell={ "Exorcist" }, guide={ st.paladin.banishment } },
	[49207160] = { name="Defias Mobs (Various)", class={ "PALADIN" }, faction="Alliance",
					spell={ "Exorcist" }, guide={ st.paladin.banishment } },
	[49207860] = { name="Defias Mobs (Various)", class={ "PALADIN" }, faction="Alliance",
					spell={ "Exorcist" }, guide={ st.paladin.banishment } },
	[50807100] = { npc=215, name="Defias Night Runner", class={ "ROGUE" },
					tip="Pp to obtain a Engraved Gold Ring",
					spell={ "Shiv" }, guide={ st.rogue.shiv } },
	[51207400] = { name="Defias Mobs (Various)", class={ "PALADIN" }, faction="Alliance",
					spell={ "Exorcist" }, guide={ st.paladin.banishment } },
	[52007700] = { name="Defias Mobs (Various)", class={ "PALADIN" }, faction="Alliance",
					spell={ "Exorcist" }, guide={ st.paladin.banishment } },
	[56607220] = { name="Defias Mobs (Various)", class={ "PALADIN" }, faction="Alliance",
					spell={ "Exorcist" }, guide={ st.paladin.banishment } },
	[61403040] = { item=210043, name="Symbol of the Second Owl", class={ "DRUID" },
					spell={ "Wild Growth" }, guide={ st.druid.wildGrowth }, tip=st.agon },
	[65003440] = { item=210043, name="Symbol of the Second Owl", class={ "DRUID" },
					spell={ "Wild Growth" }, guide={ st.druid.wildGrowth }, tip=st.agon },
	[65402600] = { item=210043, name="Symbol of the Second Owl", class={ "DRUID" },
					spell={ "Wild Growth" }, guide={ st.druid.wildGrowth }, tip=st.agon },
	[67202940] = { item=210043, name="Symbol of the Second Owl", class={ "DRUID" },
					spell={ "Wild Growth" }, guide={ st.druid.wildGrowth }, tip=st.agon },
}
points[ 1429 ] = { -- Elwynn Forest
	[22607320] = { npc=203079, name="Wandering Swordsman", class={ "WARRIOR" },
					spell={ "Blood Frenzy" }, guide={ st.warrior.bloodFrenzy } },
	[23609180] = { npc=100, name="Gruff Swiftbite", class={ "WARRIOR" }, faction="Alliance",
					spell={ "Furious Thunder" }, guide={ st.warrior.furiousThunder } },
	[24409460] = { name="Riverpaw Runt/Outrunner", class={ "WARLOCK", "WARRIOR" }, faction="Alliance",				
													
											 
					guide={ st.warlock.grace ..st.warlock.graceEF, st.warrior.devastate ..st.warrior.devastateVik },
					spell={ "Demonic Grace", "Devastate" }, tip={ "Gnoll Blood", "Severed Gnoll Head"} },
																	  
	[25207060] = { npc=203079, name="Wandering Swordsman", class={ "WARRIOR" },
					spell={ "Blood Frenzy" }, guide={ st.warrior.bloodFrenzy } },
	[25408820] = { name="Riverpaw Runt/Outrunner", class={ "WARLOCK", "WARRIOR" }, faction="Alliance",
													
											 
					guide={ st.warlock.grace ..st.warlock.graceEF, st.warrior.devastate ..st.warrior.devastateVik },
					spell={ "Demonic Grace", "Devastate" }, tip={ "Gnoll Blood", "Severed Gnoll Head"} },
																	  
	[25607420] = { npc=203079, name="Wandering Swordsman", class={ "WARRIOR" },
					spell={ "Blood Frenzy" }, guide={ st.warrior.bloodFrenzy } },
	[26608420] = { name="Riverpaw Runt/Outrunner", class={ "WARLOCK", "WARRIOR" }, faction="Alliance",
													
											 
					guide={ st.warlock.grace ..st.warlock.graceEF, st.warrior.devastate ..st.warrior.devastateVik },
					spell={ "Demonic Grace", "Devastate" }, tip={ "Gnoll Blood", "Severed Gnoll Head"} },
																	  
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
	[27808860] = { name="Riverpaw Runt/Outrunner", class={ "WARLOCK", "WARRIOR" }, faction="Alliance",
													
											 
					guide={ st.warlock.grace ..st.warlock.graceEF, st.warrior.devastate ..st.warrior.devastateVik },
					spell={ "Demonic Grace", "Devastate" }, tip={ "Gnoll Blood", "Severed Gnoll Head"} },
																	  
	[28009580] = { npc=100, name="Gruff Swiftbite", class={ "WARRIOR" }, faction="Alliance",
					spell={ "Furious Thunder" }, guide={ st.warrior.furiousThunder } },
	[29807480] = { npc=203079, name="Wandering Swordsman", class={ "WARRIOR" },
					spell={ "Blood Frenzy" }, guide={ st.warrior.bloodFrenzy } },
	[30608300] = { name="Riverpaw Runt/Outrunner", class={ "WARLOCK", "WARRIOR" }, faction="Alliance",
													
											 
					guide={ st.warlock.grace ..st.warlock.graceEF, st.warrior.devastate ..st.warrior.devastateVik },
					spell={ "Demonic Grace", "Devastate" }, tip={ "Gnoll Blood", "Severed Gnoll Head"} },
																	  
	[30608820] = { npc=100, name="Gruff Swiftbite", class={ "WARRIOR" }, faction="Alliance",
					spell={ "Furious Thunder" }, guide={ st.warrior.furiousThunder } },
	[31205720] = { npc=116, name="Defias Bandit", faction="Alliance", class={ "ROGUE" }, tip="Pick Pocket or kill. Top-Left Map Piece",
					spell={ "Quick Draw" }, guide={ st.rogue.quickDraw ..st.rogue.quickDrawEF } },
	[41208820] = { name="Riverpaw Runt/Outrunner", class={ "WARLOCK", "WARRIOR" }, faction="Alliance",
													
											 
					guide={ st.warlock.grace ..st.warlock.graceEF, st.warrior.devastate ..st.warrior.devastateVik },
														
					spell={ "Demonic Grace", "Devastate" }, tip={ "Gnoll Blood", "Severed Gnoll Head"} },
	[36008260] = { npc=475, name="Kobold Tunneler", faction="Alliance", class={ "ROGUE", "WARRIOR" },
					tip={ "Pick Pocket or kill. Top-Right Map Piece", "Severed Kobold Head" }, spell={ "Quick Draw", "Devastate" },
					guide={ st.rogue.quickDraw ..st.rogue.quickDrawEF, st.warrior.devastate ..st.warrior.devastateVik } },
	[36208060] = { npc=203079, name="Wandering Swordsman", class={ "WARRIOR" },
					spell={ "Blood Frenzy" }, guide={ st.warrior.bloodFrenzy } },
	[38607560] = { npc=203079, name="Wandering Swordsman", class={ "WARRIOR" },
					spell={ "Blood Frenzy" }, guide={ st.warrior.bloodFrenzy } },
	[41607660] = { npc=203079, name="Wandering Swordsman", class={ "WARRIOR" },
					spell={ "Blood Frenzy" }, guide={ st.warrior.bloodFrenzy } },
	[41607800] = { npc=327, name="Goldtooth", class={ "PRIEST", "WARRIOR", "WARRIOR" }, faction="Alliance",
																			  
					spell={ "Void Plague", "Furious Thunder", "Devastate" }, tip={ nil, nil, "Severed Kobold Head" },
																	  
					guide={ st.priest.voidPlague, st.warrior.furiousThunder, st.warrior.devastate ..st.warrior.devastateVik } },
									
	[41607880] = { npc=40, name="Kobold Miner", faction="Alliance", class={ "PRIEST", "ROGUE", "WARRIOR" },
					tip={ nil, "Pick Pocket or kill. Top-Right Map Piece", "Severed Kobold Head" },
					spell={ "Shared Pain", "Quick Draw", "Devastate" },
					guide={ st.priest.sharedPain, st.rogue.quickDraw ..st.rogue.quickDrawEF, 
							st.warrior.devastate ..st.warrior.devastateVik } },
	[44006620] = { npc=204256, name="Damien Kane", class={ "WARLOCK" }, faction="Alliance",
					spell={ "Soul Siphon" }, guide={ st.warlock.soulSiphon },
					tip= "Go to the basement of the Lion's Pride\nInn in Goldshire. Or go upstairs for ERP.\n"
						.."Truly a Season of Discovery! :O" },
	[44406600] = { npc=906, name="Maximillian Crowe", class={ "WARLOCK" }, faction="Alliance",
					spell={ "Demonic Tactics" }, guide={ st.warlock.tactics } },
	[46206210] = { object=387466, name="Rusty Lockbox", class={ "ROGUE" }, faction="Alliance",
					spell={ "Slaughter from the Shadows" }, guide={ st.rogue.slaughter },
					tip="On the roof of the spooky house north of Goldshire" },
	[46807460] = { npc=116, name="Defias Bandit", faction="Alliance", class={ "ROGUE" }, tip="Pick Pocket or kill. Top-Left Map Piece",
					spell={ "Quick Draw" }, guide={ st.rogue.quickDraw ..st.rogue.quickDrawEF } },
	[48402920] = { npc=80, name="Kobold Laborer", class={ "PRIEST" }, faction="Alliance",
					tip="Look for a buff after a kill", spell={ "Penance" }, 
					guide={ st.starterZoneClass }, quest={ 77619 }, questName={ "Meditation on the Light" } },
	[49008320] = { name="Defias Bandit/Bodyguard", faction="Alliance", class={ "ROGUE" }, tip="Pick Pocket or kill. Top-Left Map Piece",
					spell={ "Quick Draw" }, guide={ st.rogue.quickDraw ..st.rogue.quickDrawEF } },
	[49206560] = { name="Crystal Lake Murlocs (Various)", faction="Alliance", class={ "WARRIOR" }, tip="Severed Murloc Head",
					spell={ "Devastate" }, guide={ st.warrior.devastate ..st.warrior.devastateVik } },
	[49603960] = { npc=198, name="Khelden Bremen", class={ "MAGE" }, quest={ 77620 },
					faction="Alliance", spell={ "Ice Lance" }, guide={ st.starterZoneClass }, questName={ "Spell Research" } },
	[49804260] = { npc=459, name="Drusilla La Salle", class={ "WARLOCK" }, faction="Alliance",
					spell={ "Haunt" }, guide={ st.starterZoneClass }, quest={ 77621 },
					questName={ "Stolen Power" } },
	[49805200] = { npc=201854, name="Cutty", class={ "ROGUE" }, faction="Alliance",
					tip="Stealthed. Outside of and leaning\nagainst the Northshire wall",
					spell={ "Mutilate" }, guide={ st.rogue.mutilate } },
	[49813949] = { npc=915, name="Priestess Anetta", class={ "PRIEST" }, faction="Alliance",
					tip="In the Library Wing. As you enter,\nit's on th left at the back",
					spell={ "Penance" }, 
					guide={ st.starterZoneClass }, quest={ 77619 }, questName={ "Meditation on the Light" } },
	[50003500] = { npc=257, name="Kobold Worker", faction="Alliance", class={ "ROGUE" }, tip="Pick Pocket or kill. Top-Right Map Piece",
					spell={ "Quick Draw" }, guide={ st.rogue.quickDraw ..st.rogue.quickDrawEF } },
	[50406100] = { name="Crystal Lake Murlocs (Various)", faction="Alliance", class={ "WARRIOR" }, tip="Severed Murloc Head",
					spell={ "Devastate" }, guide={ st.warrior.devastate ..st.warrior.devastateVik } },
	[50582724] = { object=397987, name="Kobold Stashbox", class={ "WARRIOR" },
					spell={ "Victory Rush" }, guide={ st.starterZoneClass }, tip="Go to the very back", faction="Alliance" },
	[50604000] = { npc=915, name="Jorik Kerridan", class={ "ROGUE" }, faction="Alliance",
					tip="Skulking behind the Abbey",
					spell={ "Shadowstrike" }, guide={ st.starterZoneClass }, quest={ 77618 }, questName={ "Thrice stolen" } },
	[51206140] = { name="Crystal Lake Murlocs (Various)", faction="Alliance", class={ "WARRIOR" }, tip="Severed Murloc Head",
					spell={ "Devastate" }, guide={ st.warrior.devastate ..st.warrior.devastateVik } },
	[51804120] = { npc=38, name="Defias Thug", class={ "MAGE", "PALADIN" }, faction="Alliance",	
					spell={ "Ice Lance", "Crusader Strike" }, quest={ { 77620 }, { 77617 } }, 
					questName={ { "Spell Research" }, { "Relics of the Light" } },
					guide={ st.starterZoneClass, st.paladin.judgement } },
	[52505190] = { object=387477, name="Defias Stashbox", class={ "WARLOCK" }, faction="Alliance",
					spell={ "Haunt" }, guide={ st.starterZoneClass }, quest={ 77621 },
					questName={ "Stolen Power" } },
	[52605180] = { object=387477, name="Defias Stashbox", class={ "ROGUE" }, faction="Alliance",
					tip="Between two dunnies, after the vineyard",
					spell={ "Shadowstrike" }, guide={ st.starterZoneClass }, quest={ 77618 }, questName={ "Thrice stolen" } },
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
					spell={ "Lifebloom", "Inspiration Exemplar", "Prayer of Mending", "Ancestral Guidance" }, guide={ st.woundedAdventurer  } },
	[52805980] = { npc=116, name="Defias Bandit", faction="Alliance", class={ "ROGUE" }, tip="Pick Pocket or kill. Top-Left Map Piece",
					spell={ "Quick Draw" }, guide={ st.rogue.quickDraw ..st.rogue.quickDrawEF } },
	[54005200] = { npc=38, name="Defias Thug", class={ "MAGE", "PALADIN" }, faction="Alliance",	
					spell={ "Ice Lance", "Crusader Strike" }, quest={ {}, { 77617 } }, questName={ {}, { "Relics of the Light" } },
					guide={ st.starterZoneClass, st.paladin.judgement } },
	[55204720] = { npc=38, name="Defias Thug", class={ "MAGE", "PALADIN" }, faction="Alliance",	
					spell={ "Ice Lance", "Crusader Strike" }, quest={ {}, { 77617 } }, questName={ {}, { "Relics of the Light" } },
					guide={ st.starterZoneClass, st.paladin.judgement } },
	[56805770] = { npc=204503, name="Dead Acolyte", class={ "WARLOCK" }, faction="Alliance",
					spell={ "Demonic Tactics" }, guide={ st.warlock.tactics } },
	[56806220] = { name="Crystal Lake Murlocs (Various)", faction="Alliance", class={ "WARRIOR" }, tip="Severed Murloc Head",
					spell={ "Devastate" }, guide={ st.warrior.devastate ..st.warrior.devastateVik } },
	[57004780] = { npc=38, name="Defias Thug", class={ "MAGE", "PALADIN" }, faction="Alliance",	
					spell={ "Ice Lance", "Crusader Strike" }, quest={ {}, { 77617 } }, questName={ {}, { "Relics of the Light" } },
					guide={ st.starterZoneClass, st.paladin.judgement } },
	[57404820] = { npc=103, name="Garrick Proudfoot", class={ "ROGUE" }, faction="Alliance", tip="Near a shack. East of the Vineyards",
					spell={ "Mutilate" }, guide={ st.rogue.mutilate } },
	[58006840] = { name="Crystal Lake Murlocs (Various)", faction="Alliance", class={ "WARRIOR" }, tip="Severed Murloc Head",
					spell={ "Devastate" }, guide={ st.warrior.devastate ..st.warrior.devastateVik } },
	[58206520] = { name="Crystal Lake Murlocs (Various)", faction="Alliance", class={ "WARRIOR" }, tip="Severed Murloc Head",
					spell={ "Devastate" }, guide={ st.warrior.devastate ..st.warrior.devastateVik } },
	[58406480] = { npc=1922, name="Gray Forest Wolf", class={ "WARLOCK" }, faction="Alliance",
					spell={ "Demonic Grace" }, guide={ st.warlock.grace ..st.warlock.graceEF }, tip="Wolf Jawbone" },
	[59606940] = { npc=1922, name="Gray Forest Wolf", class={ "WARLOCK" }, faction="Alliance",
					spell={ "Demonic Grace" }, guide={ st.warlock.grace ..st.warlock.graceEF }, tip="Wolf Jawbone" },
																												
																													 
	[60405920] = { npc=1922, name="Gray Forest Wolf", class={ "WARLOCK" }, faction="Alliance",
					spell={ "Demonic Grace" }, guide={ st.warlock.grace ..st.warlock.graceEF }, tip="Wolf Jawbone" },
	[60805660] = { npc=476, name="Kobold Geomancer", class={ "MAGE", "WARLOCK" }, faction="Alliance",
					spell={ "Living Flame", "Demonic Grace" },
					guide={ st.mage.livingFlame, st.warlock.grace ..st.warlock.graceDM } },
	[61004920] = { npc=476, name="Kobold Geomancer", class={ "MAGE", "WARLOCK" }, faction="Alliance",
					spell={ "Living Flame", "Demonic Grace" },
					guide={ st.mage.livingFlame, st.warlock.grace ..st.warlock.graceDM } },
																												
																													 
	[61605380] = { npc=476, name="Kobold Geomancer", class={ "MAGE", "WARLOCK" }, faction="Alliance",
					spell={ "Living Flame", "Demonic Grace" },
					guide={ st.mage.livingFlame, st.warlock.grace ..st.warlock.graceDM } },
	[61904730] = { npc=204989, name="Wounded Adventurer", class={ "PALADIN" }, faction="Alliance",
					spell={ "Aegis" }, guide={ st.paladin.runeOfAegis } },
	[63005680] = { npc=40, name="Kobold Miner", faction="Alliance", class={ "PRIEST", "ROGUE", "WARRIOR" },
					tip={ nil, "Pick Pocket or kill. Top-Right Map Piece", "Severed Kobold Head" },
					spell={ "Shared Pain", "Quick Draw", "Devastate" },
					guide={ st.priest.sharedPain, st.rogue.quickDraw ..st.rogue.quickDrawEF, 
							st.warrior.devastate ..st.warrior.devastateVik } },
	[63605660] = { npc=476, name="Kobold Geomancer", class={ "MAGE", "WARLOCK" }, faction="Alliance",
					spell={ "Living Flame", "Demonic Grace" },
					guide={ st.mage.livingFlame, st.warlock.grace ..st.warlock.graceDM } },
	[63605860] = { npc=476, name="Kobold Geomancer", class={ "MAGE", "WARLOCK" }, faction="Alliance",
					spell={ "Living Flame", "Demonic Grace" },
					guide={ st.mage.livingFlame, st.warlock.grace ..st.warlock.graceDM } },
	[63806960] = { npc=1922, name="Gray Forest Wolf", class={ "WARLOCK" }, faction="Alliance",
					spell={ "Demonic Grace" }, guide={ st.warlock.grace ..st.warlock.graceEF }, tip="Wolf Jawbone" },
																												
																													 
	[65205840] = { npc=1922, name="Gray Forest Wolf", class={ "WARLOCK" }, faction="Alliance",
					spell={ "Demonic Grace" }, guide={ st.warlock.grace ..st.warlock.graceEF }, tip="Wolf Jawbone" },
	[65404460] = { npc=118, name="Prowler", class={ "WARLOCK" }, faction="Alliance",
					spell={ "Demonic Grace" }, guide={ st.warlock.grace ..st.warlock.graceEF }, tip="Wolf Jawbone" },
	[65407010] = { object=386759, name="Library Book", class={ "MAGE" }, faction="Alliance",
					spell={ "Icy Veins" }, guide={ st.mage.icyVeins },
					quest={ 79092 }, questName={ "Archmage Theocritus's Research Journal" },
					tip="Halfway up the Tower of Azora" },
	[65608400] = { npc=46, name="Murloc Forager", faction="Alliance", class={ "ROGUE" }, tip="Pick Pocket or kill. Bottom-Right Map Piece",
					spell={ "Quick Draw" }, guide={ st.rogue.quickDraw ..st.rogue.quickDrawEF } },
	[66404380] = { name="Riverpaw Runt/Outrunner", class={ "WARLOCK", "WARRIOR" }, faction="Alliance",
													
											 
					guide={ st.warlock.grace ..st.warlock.graceEF, st.warrior.devastate ..st.warrior.devastateVik },
					spell={ "Demonic Grace", "Devastate" }, tip={ "Gnoll Blood", "Severed Gnoll Head"} },
																	  
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
																	  
	[73436313] = { npc=925, name="Brother Sammuel", class={ "PALADIN" }, faction="Alliance",
					spell={ "Crusader Strike" }, quest={ 77617 }, questName={ "Relics of the Light" },
					guide={ st.paladin.judgement } },
	[74403860] = { npc=118, name="Prowler", class={ "WARLOCK" }, faction="Alliance",
					spell={ "Demonic Grace" }, guide={ st.warlock.grace ..st.warlock.graceEF }, tip="Wolf Jawbone" },
	[74805200] = { npc=474, name="Defias Rogue Wizard", faction="Alliance", class={ "ROGUE", "WARLOCK" },
					tip={ "Pick Pocket or kill. Top-Left Map Piece",  "Ominous Tome" }, spell={ "Quick Draw", "Demonic Grace" },
					guide={ st.rogue.quickDraw ..st.rogue.quickDrawEF, st.warlock.grace ..st.warlock.graceEF } },
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
					tip="Reports of plent at Ridgepoint\nTower but they can be anywhere" },
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
	[79704090] = { name="Rubble Pile/Storage Locker", class={ "WARLOCK" },
					spell={ "Lake of Fire" }, guide={ st.warlock.firesWake }, 
					tip="Aim carefully or bye bye 5 gold... QQ" },
	[80003900] = { npc=3536, name="Kris Legace", class={ "ROGUE" },
					tip="She sells a range of limited supply / rare leathers\nMaybe for you or the AH!",
					spell={ "Envenom" }, guide={ st.rogue.envenom } },
}
points[ 1455 ] = { -- Ironforge
	[24606720] = { npc=214099, name="Tamelyn Aldridge", faction="Alliance",
					class=st.allClass, spell=st.allSpellACA, guide={ st.supplyFaction } },
	[51901280] = { object=405946, name="Dusty Chest", class={ "ROGUE" }, faction="Alliance", guide={ st.rogue.precision },
					spell={ "Slaughter from the Shadows" } },
	[72107650] = { npc=5570, name="Bruuk Barleybeard", class={ "WARRIOR" }, faction="Alliance",
					spell={ "Frenzied Assault" }, guide={ st.warrior.frenziedAssault },
					tip="Speak to Bruuk first, and then\nspeak to Bruart, who is nearby" },
	[72607600] = { npc=209004, name="Bruart", class={ "WARRIOR" }, faction="Alliance",
					spell={ "Frenzied Assault" }, guide={ st.warrior.frenziedAssault },
					tip="He'll be wandering around the \"Bruuk's Corner\" vicinity.\n"
						.."Speak to Bruuk first if you haven't already done so" },
	[76301040] = { object=386691, name="Library Book", class={ "MAGE" }, faction="Alliance",
					spell={ "Icy Veins" }, guide={ st.mage.icyVeins },
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
					spell={ "Icy Veins" }, guide={ st.mage.icyVeins },
					quest={ 79093 }, questName={ "Rumi of Gnomeregan: The Collected Works" },
					tip="On a table behind the Inn keeper" },
	[35804950] = { object=407844, name="Libram Of Blessings", class={ "PALADIN" },
					faction="Alliance", spell={ "Horn of Lordaeron" }, tip="Lower room", guide={ st.paladin.blessings } },
	[36208620] = { npc=1163, name="Stonesplitter Skullthumper", class={ "WARRIOR" },
					spell={ "Quick Strike" }, guide={ st.warrior.quickStrike },
					tip="They will crack open your Skull-Shaped Geode" },				
	[36407800] = { npc=1166, name="Stonesplitter Seer", class={ "MAGE" },
					spell={ "Living Bomb" }, guide={ st.mage.livingBomb } },
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
	[72601940] = { name="Mo'grosh Ogres", class={ "WARRIOR" }, faction="Alliance", tip=st.warrior.harenTip,
					spell={ "Endless Rage" }, guide={ st.warrior.endlessRage } },
	[72606880] = { npc=209954, name="Demonic Remains", class={ "WARLOCK" }, faction="Alliance",
					spell={ "Shadow Bolt Volley" }, guide={ st.warlock.shadowbolts }, tip="Must use a Shadow spell" },
	[75803260] = { npc=1178, name="Mo'grosh Ogres", class={ "WARRIOR" }, faction="Alliance", tip=st.warrior.harenTip,
					spell={ "Endless Rage" }, guide={ st.warrior.endlessRage } },
	[77451416] = { object=409731, name="Scrolls", class={ "MAGE" },
					spell={ "Icy Veins" }, guide={ st.mage.icyVeins },
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
points[ 1421 ] = { -- Silverpine Forest
	[34800780] = { npc=210802, name="Webbed Victim", class={ "WARRIOR" }, faction="Horde",
					spell={ "Endless Rage" }, guide={ st.warriorEndlessRage },
					tip="In the Skittering Dark Cave you'll easily\nsee the vicitms. Click on then and defeat\n"
						.."the crazed Lost Adventurer.\n\nBut so many spiders to contend with" },
	[43402260] = { npc=1773, name="Rot Hide Mystic", class={ "SHAMAN" }, faction="Horde",
					spell={ "Way of Earth" }, guide={ st.shaman.earthenRune } },
	[43404120] = { object=410299, name="Arcane Secrets", class={ "MAGE" }, faction="Horde",
					spell={ "Icy Veins" }, guide={ st.mage.icyVeins },
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
	[47107110] = { object=410369, name="Dead Drop", class={ "ROGUE" },
					quest={ { 78261, 78307 } }, spell={ "Deadly Brew" }, guide={ st.rogue.deadlyBrew },
					questName={ { "The Horn of Xelthos (Main)", "The Horn of Xelthos (Reward)" } } },
																				 
	[48004060] = { npc=1769, name="Moonrage Whitescalp", class={ "DRUID" },
					spell={ "Lacerate" }, guide={ st.druid.lacerate } },
	[48203360] = { npc=1769, name="Moonrage Whitescalp", class={ "DRUID" },
					spell={ "Lacerate" }, guide={ st.druid.lacerate } },
	[49203420] = { npc=1769, name="Moonrage Whitescalp", class={ "DRUID" },
					spell={ "Lacerate" }, guide={ st.druid.lacerate } },
	[49403680] = { npc=1778, name="Ferocious Grizzled Bear", class={ "HUNTER" },
					spell={ "Beast Mastery" }, guide={ st.hunter.beastMastery } },
																											
																				 
	[49404000] = { npc=1769, name="Moonrage Whitescalp", class={ "DRUID" },
					spell={ "Lacerate" }, guide={ st.druid.lacerate } },
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
	[59407040] = { name="Ravenclaw Mobs (Various)", class={ "WARLOCK" },
					spell={ "Shadow Bolt Volley" }, guide={ st.warlock.shadowbolts } },
	[60607260] = { name="Ravenclaw Mobs (Various)", class={ "WARLOCK" },
					spell={ "Shadow Bolt Volley" }, guide={ st.warlock.shadowbolts } },
	[63506310] = { object=409501, name="Dalaran Digest", class={ "MAGE" },
					spell={ "Icy Veins" }, guide={ st.mage.icyVeins },
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
	[21405860] = { npc=203478, name="Stuart", class={ "PALADIN", "WARRIOR" }, faction="Alliance",
					spell={ "Rebuke", "Frenzied Assault" },
					guide={ st.paladin.runeOfRebuke, st.warrior.frenziedAssault },
					tip= "He'll be wandering around The Park. Speak to Liv\n"
						.."Bradford first if you haven't already done so" },
	[22606460] = { npc=203475, name="Liv Bradford", class={ "PALADIN", "WARRIOR" }, faction="Alliance",
					spell={ "Rebuke", "Frenzied Assault" },
					guide={ st.paladin.runeOfRebuke, st.warrior.frenziedAssault },
					tip="Speak to Liv first, and then\nspeak to Stuart, who is nearby" },
	[23205320] = { npc=203478, name="Stuart", class={ "PALADIN", "WARRIOR" }, faction="Alliance",
					spell={ "Rebuke", "Frenzied Assault" },
					guide={ st.paladin.runeOfRebuke, st.warrior.frenziedAssault },
					tip= "He'll be wandering around The Park. Speak to Liv\nBradford first if you haven't already done so" },
	[25407860] = { npc=6122, name="Gakin the Darkbinder", class={ "WARLOCK" }, faction="Alliance",
					spell={ "Soul Siphon" }, guide={ st.warlock.soulSiphon } },
	[25007740] = { npc=204070, name="Soboz", class={ "WARLOCK" }, faction="Alliance",
					spell={ "Demonic Grace" }, guide={ st.warlock.grace ..st.warlock.graceEF }, tip="Slaughtered Lamb" },
	[26107750] = { npc=5495, name="Ursula Deline", class={ "PALADIN" }, faction="Alliance",
					spell={ "Divine Storm" }, quest={ { 78088, 78089, 78090, 78091, 78092, 78093 } },
					questName={ { "A Strange Artifact", "Advice from Stormwind", "A Second Opinion", "Earning Your Salt", 
						"It Must Be Destroyed", "Return to Delgren" } }, guide={ st.paladin.divineStorm } },
	[37603180] = { npc=5492, name="Ketherine the Pure", class={ "PALADIN" }, faction="Alliance",
					spell={ "Divine Storm" }, quest={ { 78088, 78089, 78090, 78091, 78092, 78093 } },
					questName={ { "A Strange Artifact", "Advice from Stormwind", "A Second Opinion", "Earning Your Salt", 
						"It Must Be Destroyed", "Return to Delgren" } }, guide={ st.paladin.divineStorm } },
	[37808100] = { npc=211033, name="Garion Wendell", class={ "MAGE" }, faction="Alliance",
					spell={ "Icy Veins" }, guide={ st.mage.icyVeins },		
					quest={ { 78145, 79091, 79092, 79097, 78142, 78147, 78149, 78146, 78124, 79093, 78148, 78143, 78127, 78150 } },
					questName={ { "Arcanic Systems Manual\n" ..colourPlaintext .."The Sludge Fen, The Barrens",
						"Archmage Antonidas: The Unabridged ...\n" ..colourPlaintext .."Hall of Explorers, Ironforge",
						"Archmage Theocritus's Research Journal\n"..colourPlaintext .."Tower of Azora, Elwynn Forest",
						"Baxtan: On Destructive Magics\n" ..colourPlaintext .."Next to Gazlove, Ratchet, The Barrens",
						"Bewitchments and Glamours\n" ..colourPlaintext .."Moonbrook, Westfall",
						"Crimes Against Anatomy\n" ..colourPlaintext .."Raven Hill Crypt, Duskwood",
						"Fury of the Land\n" ..colourPlaintext .."Near Grimtotems in Stonetalon Mountains",
						"Goaz Scrolls\n" ..colourPlaintext .."Whelgar's Excavation Site, Wetlands",
						"Nar'thalas Almanac\n" ..colourPlaintext .."Darkshore Ruins",
						"Rumi of Gnomeregan: The Collected Works\n" ..colourPlaintext .."Thelsamar or Westfall Inn",
						"Runes of the Sorcerer-Kings\n" ..colourPlaintext .."The Ogre Cave in Loch Modan",
						"Secrets of the Dreamers\n" ..colourPlaintext .."Near the Wailing Caverns portal",
						"The Dalaran Digest\n" ..colourPlaintext .."Amber Mill, Silverpine Forest",
						"Friend of the Library\n" ..colourPlaintext .."The final step!" } } },
	[38602880] = { npc=205278, name="Brother Romulus", class={ "PALADIN" }, faction="Alliance",
					spell={ "Seal of Martyrdom" }, guide={ st.paladin.martyrdom } },
	[55006160] = { npc=213077, name="Elaine Compton", faction="Alliance",
					class=st.allClass, spell=st.allSpellACA, guide={ st.supplyFaction } },
	[61602910] = { object=386777, name="Dusty Chest", class={ "ROGUE" }, faction="Alliance", guide={ st.rogue.precision },
					spell={ "Slaughter from the Shadows" }, tip="Upper level of the house in\nCutthroat Alley, Stormwind" },
	[69805000] = { npc=203226, name="Viktoria Woods", class={ "WARRIOR" }, faction="Alliance",
					spell={ "Devastate" }, guide={ st.warrior.devastate ..st.warrior.devastateVik }, }
}
points[ 1434 ] = { -- Stranglethorn Vale
	[36001800] = { name="Murkgill Mobs (Various)", class=st.allClass, spell=st.allSpellG,
					guide={ st.grizzby }, quest={ 78265 }, questName={ "Fish Oil" } },
	[33402080] = { name="Murkgill Mobs (Various)", class=st.allClass, spell=st.allSpellG,
					guide={ st.grizzby }, quest={ 78265 }, questName={ "Fish Oil" } },
	[34202480] = { name="Murkgill Mobs (Various)", class=st.allClass, spell=st.allSpellG,
					guide={ st.grizzby }, quest={ 78265 }, questName={ "Fish Oil" } },
	[37002460] = { name="Murkgill Mobs (Various)", class=st.allClass, spell=st.allSpellG,
					guide={ st.grizzby }, quest={ 78265 }, questName={ "Fish Oil" } },
	[37202200] = { name="Murkgill Mobs (Various)", class=st.allClass, spell=st.allSpellG,
					guide={ st.grizzby }, quest={ 78265 }, questName={ "Fish Oil" } },
}
points[ 1435 ] = { -- Swamp of Sorrows
	[60608680] = { name="Marsh Mobs (Various Murlocs)", class=st.allClass, spell=st.allSpellG,
					guide={ st.grizzby }, quest={ 78265 }, questName={ "Fish Oil" } },
	[60808360] = { name="Marsh Mobs (Various Murlocs)", class=st.allClass, spell=st.allSpellG,
					guide={ st.grizzby }, quest={ 78265 }, questName={ "Fish Oil" } },
	[62408040] = { name="Marsh Mobs (Various Murlocs)", class=st.allClass, spell=st.allSpellG,
					guide={ st.grizzby }, quest={ 78265 }, questName={ "Fish Oil" } },
	[63608700] = { name="Marsh Mobs (Various Murlocs)", class=st.allClass, spell=st.allSpellG,
					guide={ st.grizzby }, quest={ 78265 }, questName={ "Fish Oil" } },
	[63808340] = { name="Marsh Mobs (Various Murlocs)", class=st.allClass, spell=st.allSpellG,
					guide={ st.grizzby }, quest={ 78265 }, questName={ "Fish Oil" } },
	[63809160] = { name="Marsh Mobs (Various Murlocs)", class=st.allClass, spell=st.allSpellG,
					guide={ st.grizzby }, quest={ 78265 }, questName={ "Fish Oil" } },
	[67007440] = { name="Marsh Mobs (Various Murlocs)", class=st.allClass, spell=st.allSpellG,
					guide={ st.grizzby }, quest={ 78265 }, questName={ "Fish Oil" } },
	[79809380] = { name="Marsh Mobs (Various Murlocs)", class=st.allClass, spell=st.allSpellG,
					guide={ st.grizzby }, quest={ 78265 }, questName={ "Fish Oil" } },
	[81409180] = { name="Marsh Mobs (Various Murlocs)", class=st.allClass, spell=st.allSpellG,
					guide={ st.grizzby }, quest={ 78265 }, questName={ "Fish Oil" } },
	[82609460] = { name="Marsh Mobs (Various Murlocs)", class=st.allClass, spell=st.allSpellG,
					guide={ st.grizzby }, quest={ 78265 }, questName={ "Fish Oil" } },
	[83208620] = { name="Marsh Mobs (Various Murlocs)", class=st.allClass, spell=st.allSpellG,
					guide={ st.grizzby }, quest={ 78265 }, questName={ "Fish Oil" } },
	[83408280] = { name="Marsh Mobs (Various Murlocs)", class=st.allClass, spell=st.allSpellG,
					guide={ st.grizzby }, quest={ 78265 }, questName={ "Fish Oil" } },
	[83609160] = { name="Marsh Mobs (Various Murlocs)", class=st.allClass, spell=st.allSpellG,
					guide={ st.grizzby }, quest={ 78265 }, questName={ "Fish Oil" } },
	[85208500] = { name="Marsh Mobs (Various Murlocs)", class=st.allClass, spell=st.allSpellG,
					guide={ st.grizzby }, quest={ 78265 }, questName={ "Fish Oil" } },
	[85608880] = { name="Marsh Mobs (Various Murlocs)", class=st.allClass, spell=st.allSpellG,
					guide={ st.grizzby }, quest={ 78265 }, questName={ "Fish Oil" } },
	[86407840] = { name="Marsh Mobs (Various Murlocs)", class=st.allClass, spell=st.allSpellG,
					guide={ st.grizzby }, quest={ 78265 }, questName={ "Fish Oil" } },
	[87208180] = { name="Marsh Mobs (Various Murlocs)", class=st.allClass, spell=st.allSpellG,
					guide={ st.grizzby }, quest={ 78265 }, questName={ "Fish Oil" } },
	[89807600] = { name="Marsh Mobs (Various Murlocs)", class=st.allClass, spell=st.allSpellG,
					guide={ st.grizzby }, quest={ 78265 }, questName={ "Fish Oil" } },
	[91007080] = { name="Marsh Mobs (Various Murlocs)", class=st.allClass, spell=st.allSpellG,
					guide={ st.grizzby }, quest={ 78265 }, questName={ "Fish Oil" } },
	[92606760] = { name="Marsh Mobs (Various Murlocs)", class=st.allClass, spell=st.allSpellG,
					guide={ st.grizzby }, quest={ 78265 }, questName={ "Fish Oil" } },
	[93206100] = { name="Marsh Mobs (Various Murlocs)", class=st.allClass, spell=st.allSpellG,
					guide={ st.grizzby }, quest={ 78265 }, questName={ "Fish Oil" } },
	[93805560] = { name="Marsh Mobs (Various Murlocs)", class=st.allClass, spell=st.allSpellG,
					guide={ st.grizzby }, quest={ 78265 }, questName={ "Fish Oil" } },
	[94006480] = { name="Marsh Mobs (Various Murlocs)", class=st.allClass, spell=st.allSpellG,
					guide={ st.grizzby }, quest={ 78265 }, questName={ "Fish Oil" } },
	[94604800] = { name="Marsh Mobs (Various Murlocs)", class=st.allClass, spell=st.allSpellG,
					guide={ st.grizzby }, quest={ 78265 }, questName={ "Fish Oil" } },
	[95805220] = { name="Marsh Mobs (Various Murlocs)", class=st.allClass, spell=st.allSpellG,
					guide={ st.grizzby }, quest={ 78265 }, questName={ "Fish Oil" } },
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
					spell={ "Penance" }, guide={ st.starterZoneClass }, quest={ 77670 }, questName={ "Meditation on Undeath" } },
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
	[37404920] = { name="Tirisfal Farmers (Various)", faction="Horde", class={ "ROGUE" }, tip="Pick Pocket or kill. Top-Left Map Piece",
					spell={ "Quick Draw" }, guide={ st.rogue.quickDraw ..st.rogue.quickDrawTG } },
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
	[48006540] = { npc=1536, name="Scarlet Missionary", class={ "MAGE" },
					spell={ "Living Flame" }, guide={ st.mage.livingFlame } },
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
	[50606740] = { name="Scarlet mobs (Various)", faction="Horde", class={ "ROGUE" }, tip="Pick Pocket or kill. Top-Right Map Piece",
					spell={ "Quick Draw" }, guide={ st.rogue.quickDraw ..st.rogue.quickDrawTG } },
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
	[53606900] = { npc=1536, name="Scarlet Missionary", class={ "MAGE" },
					spell={ "Living Flame" }, guide={ st.mage.livingFlame } },
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
	[56604660] = { name="Rot Hide (Various)", class={ "ROGUE", "ROGUE", "WARLOCK", "WARRIOR" }, faction="Horde",
																					 
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
					spell={ "Icy Veins" }, guide={ st.mage.icyVeins },
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
}
points[ 1458 ] = { -- Undercity
	[24004160] = { npc=204070, name="Soboz", class={ "WARLOCK" }, faction="Horde",
					spell={ "Demonic Grace" }, guide={ st.warlock.grace ..st.warlock.graceTG },
					tip="Undercity Sewer" },
	[48007060] = { npc=208619, name="Dorac Graves", class={ "WARRIOR" }, faction="Horde",
					spell={ "Devastate" }, guide={ st.warrior.devastate ..st.warrior.devastateDor }, },
	[64603820] = { npc=214098, name="Gishah", faction="Horde",
					class=st.allClass, spell=st.allSpellACA, guide={ st.supplyFaction } },
	[73603300] = { npc=211022, name="Owen Thadd", class={ "MAGE" }, faction="Horde",
					spell={ "Icy Veins" }, guide={ st.mage.icyVeins },
					quest={ { 78145, 79096, 79097, 78142, 78147, 78149, 78146, 78124, 78148, 78143, 79095, 78127, 79094, 78150 } },
					questName={ { "Arcanic Systems Manual\n" ..colourPlaintext .."The Sludge Fen, The Barrens",
						"Ataeric: On Arcane Curiosities\n"..colourPlaintext .."Sepulcher",
						"Baxtan: On Destructive Magics\n" ..colourPlaintext .."Next to Gazlove, Ratchet, The Barrens",
						"Bewitchments and Glamours\n" ..colourPlaintext .."Moonbrook, Westfall",
						"Crimes Against Anatomy\n" ..colourPlaintext .."Raven Hill Crypt, Duskwood",
						"Fury of the Land\n" ..colourPlaintext .."Near Grimtotems in Stonetalon Mountains",
						"Goaz Scrolls\n" ..colourPlaintext .."Whelgar's Excavation Site, Wetlands",
						"Nar'thalas Almanac\n" ..colourPlaintext .."Darkshore Ruins",
						"Runes of the Sorcerer-Kings\n" ..colourPlaintext .."The Ogre Cave in Loch Modan",
						"Secrets of the Dreamers\n" ..colourPlaintext .."Near the Wailing Caverns portal",
						"The Apothecary's Metaphysical Primer\n" ..colourPlaintext .."Brill alchemy Shop",
						"The Dalaran Digest\n" ..colourPlaintext .."Amber Mill, Silverpine Forest",
						"The Lessons of Ta'zo\n" ..colourPlaintext .."Valley of Sprits, Orgrimmar",
						"Friend of the Library\n" ..colourPlaintext .."The final step!" } } },
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
	[28004800] = { name="Riverpaw Mobs (Various Gnolls)", class={ "DRUID" },
					spell={ "Savage Roar" }, guide={ st.druid.ferocious } },
	[28206820] = { name="Riverpaw Mobs (Various Gnolls)", class={ "DRUID" },
					spell={ "Savage Roar" }, guide={ st.druid.ferocious } },
	[28405160] = { name="Riverpaw Mobs (Various Gnolls)", class={ "DRUID" },
					spell={ "Savage Roar" }, guide={ st.druid.ferocious } },
	[29005040] = { object=210537, name="Undying Laborer", class={ "PALADIN" }, faction="Alliance",
					spell={ "Horn of Lordaeron" }, tip="Lower room", guide={ st.paladin.blessings } },
	[29204520] = { name="Riverpaw Mobs (Various Gnolls)", class={ "DRUID" },
					spell={ "Savage Roar" }, guide={ st.druid.ferocious } },
	[29405700] = { name="Riverpaw Mobs (Various Gnolls)", class={ "DRUID" },
					spell={ "Savage Roar" }, guide={ st.druid.ferocious } },
	[29505150] = { name="Defias Mobs (Various)", class={ "DRUID", "ROGUE", "WARRIOR" }, faction="Alliance",
					guide={ st.druid.lacerate, st.rogue.bladeDance, st.warrior.quickStrike },
					spell={ "Lacerate", "Blade Dance", "Quick Strike" },
					tip={ "Magic Pumpkin Seed", "Pp for Discrete Envelope\nand Equipment Stash Key", "Gillsbane" } },
																			 
	[29804660] = { object=210537, name="Undying Laborer", class={ "PALADIN" }, faction="Alliance",
					spell={ "Horn of Lordaeron" }, tip="Lower room", guide={ st.paladin.blessings } },
	[29807920] = { npc=391, name="Old Murk-Eye", class={ "WARLOCK", "WARRIOR" }, faction="Alliance",
					spell={ "Shadow Bolt Volley", "Endless Rage" },
					guide={ st.warlock.shadowbolts, st.starterZoneClass },
					tip={ "Must use Drain Soul", nil } },
	[30606380] = { name="Riverpaw Mobs (Various Gnolls)", class={ "DRUID" },
					spell={ "Savage Roar" }, guide={ st.druid.ferocious } },
	[30606820] = { name="Riverpaw Mobs (Various Gnolls)", class={ "DRUID" },
					spell={ "Savage Roar" }, guide={ st.druid.ferocious } },
	[31005000] = { name="Riverpaw Mobs (Various Gnolls)", class={ "DRUID" },
					spell={ "Savage Roar" }, guide={ st.druid.ferocious } },
	[31604460] = { name="Defias Mobs (Various)", class={ "DRUID", "ROGUE", "WARRIOR" }, faction="Alliance",
					guide={ st.druid.lacerate, st.rogue.bladeDance, st.warrior.quickStrike },
					spell={ "Lacerate", "Blade Dance", "Quick Strike" },
					tip={ "Magic Pumpkin Seed", "Pp for Discrete Envelope\nand Equipment Stash Key", "Gillsbane" } },
																			 
	[31604680] = { npc=832, name="Dust Devil", class={ "WARLOCK" },
					spell={ "Master Channeler" }, guide={ st.warlock.channeling } },
	[31607260] = { name="Riverpaw Mobs (Various Gnolls)", class={ "DRUID" },
					spell={ "Savage Roar" }, guide={ st.druid.ferocious } },
	[31804500] = { object=210537, name="Undying Laborer", class={ "PALADIN" }, faction="Alliance",
					spell={ "Horn of Lordaeron" }, tip="Lower room", guide={ st.paladin.blessings } },
	[32003160] = { name="Riverpaw Mobs (Various Gnolls)", class={ "DRUID" },
					spell={ "Savage Roar" }, guide={ st.druid.ferocious } },
	[32204240] = { object=210537, name="Undying Laborer", class={ "PALADIN" }, faction="Alliance",
					spell={ "Horn of Lordaeron" }, tip="Lower room", guide={ st.paladin.blessings } },
	[32402700] = { name="Riverpaw Mobs (Various Gnolls)", class={ "DRUID" },
					spell={ "Savage Roar" }, guide={ st.druid.ferocious } },
	[32408740] = { npc=391, name="Old Murk-Eye", class={ "WARLOCK", "WARRIOR" }, faction="Alliance",
					spell={ "Shadow Bolt Volley", "Endless Rage" },
					guide={ st.warlock.shadowbolts, st.starterZoneClass },
					tip={ "Must use Drain Soul", nil } },
	[32604600] = { name="Riverpaw Mobs (Various Gnolls)", class={ "DRUID" },
					spell={ "Savage Roar" }, guide={ st.druid.ferocious } },
	[32603360] = { name="Defias Mobs (Various)", class={ "DRUID", "ROGUE", "WARRIOR" }, faction="Alliance",
					guide={ st.druid.lacerate, st.rogue.bladeDance, st.warrior.quickStrike },
					spell={ "Lacerate", "Blade Dance", "Quick Strike" },
					tip={ "Magic Pumpkin Seed", "Pp for Discrete Envelope\nand Equipment Stash Key", "Gillsbane" } },
																			 
	[32606100] = { name="Riverpaw Mobs (Various Gnolls)", class={ "DRUID" },
					spell={ "Savage Roar" }, guide={ st.druid.ferocious } },
	[33005540] = { name="Riverpaw Mobs (Various Gnolls)", class={ "DRUID" },
					spell={ "Savage Roar" }, guide={ st.druid.ferocious } },
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
	[34806040] = { name="Riverpaw Mobs (Various Gnolls)", class={ "DRUID" },
					spell={ "Savage Roar" }, guide={ st.druid.ferocious } },
	[35003960] = { npc=210533, name="Silverspur", class={ "HUNTER" },
					spell={ "Beast Mastery" }, guide={ st.hunter.beastMastery},
					tip= "You must farm Young Goretusk (to the north and east\nof here) or Goretusk (to the south and east of here).\n"
						.."They are far too numerous to mark with pins. You are\nwanting to loot Goretusk Haunch. Bring it to here to\n"
						.."spawn Silverspur.\n\n" },
	[35003240] = { npc=832, name="Dust Devil", class={ "WARLOCK" },
					spell={ "Master Channeler" }, guide={ st.warlock.channeling } },
	[35003940] = { npc=832, name="Dust Devil", class={ "WARLOCK" },
					spell={ "Master Channeler" }, guide={ st.warlock.channeling } },
	[35405100] = { name="Watchers & Golems", class={ "WARLOCK" },
					spell={ "Master Channeler" }, guide={ st.warlock.channeling } },
	[35605220] = { npc=210501, name="Harvest Reaper Prototype", class={ "WARLOCK" },
					spell={ "Master Channeler" }, guide={ st.warlock.channeling } },
	[35802700] = { name="Riverpaw Mobs (Various Gnolls)", class={ "DRUID" },
					spell={ "Savage Roar" }, guide={ st.druid.ferocious } },
	[36005400] = { name="Defias Mobs (Various)", class={ "DRUID", "ROGUE", "WARRIOR" }, faction="Alliance",
					guide={ st.druid.lacerate, st.rogue.bladeDance, st.warrior.quickStrike },
					spell={ "Lacerate", "Blade Dance", "Quick Strike" },
					tip={ "Magic Pumpkin Seed", "Pp for Discrete Envelope\nand Equipment Stash Key", "Gillsbane" } },
																			 
	[36005660] = { name="Riverpaw Mobs (Various Gnolls)", class={ "DRUID" },
					spell={ "Savage Roar" }, guide={ st.druid.ferocious } },
	[36008600] = { npc=391, name="Old Murk-Eye", class={ "WARLOCK", "WARRIOR" }, faction="Alliance",
					spell={ "Shadow Bolt Volley", "Endless Rage" },
					guide={ st.warlock.shadowbolts, st.starterZoneClass },
					tip={ "Must use Drain Soul", nil } },
	[36205220] = { name="Riverpaw Mobs (Various Gnolls)", class={ "DRUID" },
					spell={ "Savage Roar" }, guide={ st.druid.ferocious } },
	[36206440] = { name="Riverpaw Mobs (Various Gnolls)", class={ "DRUID" },
					spell={ "Savage Roar" }, guide={ st.druid.ferocious } },
	[36603200] = { name="Riverpaw Mobs (Various Gnolls)", class={ "DRUID" },
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
	[37606140] = { name="Riverpaw Mobs (Various Gnolls)", class={ "DRUID" },
					spell={ "Savage Roar" }, guide={ st.druid.ferocious } },
	[38005720] = { name="Defias Mobs (Various)", class={ "DRUID", "ROGUE", "WARRIOR" }, faction="Alliance",
					guide={ st.druid.lacerate, st.rogue.bladeDance, st.warrior.quickStrike },
					spell={ "Lacerate", "Blade Dance", "Quick Strike" },
					tip={ "Magic Pumpkin Seed", "Pp for Discrete Envelope\nand Equipment Stash Key", "Gillsbane" } },
																			 
	[38603820] = { name="Riverpaw Mobs (Various Gnolls)", class={ "DRUID" },
					spell={ "Savage Roar" }, guide={ st.druid.ferocious } },
	[39602520] = { name="Riverpaw Mobs (Various Gnolls)", class={ "DRUID" },
					spell={ "Savage Roar" }, guide={ st.druid.ferocious } },
	[39605680] = { name="Watchers & Golems", class={ "WARLOCK" },
					spell={ "Master Channeler" }, guide={ st.warlock.channeling } },
	[40605420] = { name="Watchers & Golems", class={ "WARLOCK" },
					spell={ "Master Channeler" }, guide={ st.warlock.channeling } },
	[40802040] = { name="Riverpaw Mobs (Various Gnolls)", class={ "DRUID" },
					spell={ "Savage Roar" }, guide={ st.druid.ferocious } },
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
	[42801960] = { name="Riverpaw Mobs (Various Gnolls)", class={ "DRUID" },
					spell={ "Savage Roar" }, guide={ st.druid.ferocious } },
	[42802320] = { name="Riverpaw Mobs (Various Gnolls)", class={ "DRUID" },
					spell={ "Savage Roar" }, guide={ st.druid.ferocious } },
	[43001500] = { name="Riverpaw Mobs (Various Gnolls)", class={ "DRUID" },
					spell={ "Savage Roar" }, guide={ st.druid.ferocious } },
	[43603180] = { name="Riverpaw Mobs (Various Gnolls)", class={ "DRUID" },
					spell={ "Savage Roar" }, guide={ st.druid.ferocious } },
	[43805620] = { npc=832, name="Dust Devil", class={ "WARLOCK" },
					spell={ "Master Channeler" }, guide={ st.warlock.channeling } },
	[44002340] = { name="Defias Mobs (Various)", class={ "DRUID", "ROGUE", "WARRIOR" }, faction="Alliance",
					guide={ st.druid.lacerate, st.rogue.bladeDance, st.warrior.quickStrike },
					spell={ "Lacerate", "Blade Dance", "Quick Strike" },
					tip={ "Magic Pumpkin Seed", "Pp for Discrete Envelope\nand Equipment Stash Key", "Gillsbane" } },
																			 
	[44002680] = { object=210537, name="Undying Laborer", class={ "PALADIN" }, faction="Alliance",
					spell={ "Horn of Lordaeron" }, tip="Lower room", guide={ st.paladin.blessings } },
	[44002850] = { name="Riverpaw Mobs (Various Gnolls)", class={ "DRUID" },
					spell={ "Savage Roar" }, guide={ st.druid.ferocious } },
	[44403920] = { npc=210501, name="Harvest Reaper Prototype", class={ "WARLOCK" },
					spell={ "Master Channeler" }, guide={ st.warlock.channeling } },
	[44404660] = { npc=832, name="Dust Devil", class={ "WARLOCK" },
					spell={ "Master Channeler" }, guide={ st.warlock.channeling } },
	[44601940] = { name="Defias Mobs (Various)", class={ "DRUID", "ROGUE", "WARRIOR" }, faction="Alliance",
					guide={ st.druid.lacerate, st.rogue.bladeDance, st.warrior.quickStrike },
					spell={ "Lacerate", "Blade Dance", "Quick Strike" },
					tip={ "Magic Pumpkin Seed", "Pp for Discrete Envelope\nand Equipment Stash Key", "Gillsbane" } },
																			 
	[44602000] = { object=210537, name="Undying Laborer", class={ "PALADIN" }, faction="Alliance",
					spell={ "Horn of Lordaeron" }, tip="Lower room", guide={ st.paladin.blessings } },
	[44802780] = { name="Defias Mobs (Various)", class={ "DRUID", "ROGUE", "WARRIOR" }, faction="Alliance",
					guide={ st.druid.lacerate, st.rogue.bladeDance, st.warrior.quickStrike },
					spell={ "Lacerate", "Blade Dance", "Quick Strike" },
					tip={ "Magic Pumpkin Seed", "Pp for Discrete Envelope\nand Equipment Stash Key", "Gillsbane" } },
																			 
	[45002280] = { object=210537, name="Undying Laborer", class={ "PALADIN" }, faction="Alliance",
					spell={ "Horn of Lordaeron" }, tip="Lower room", guide={ st.paladin.blessings } },
	[45003980] = { name="Watchers & Golems", class={ "WARLOCK" },
					spell={ "Master Channeler" }, guide={ st.warlock.channeling } },
	[45004080] = { npc=210501, name="Harvest Reaper Prototype", class={ "WARLOCK" },
					spell={ "Master Channeler" }, guide={ st.warlock.channeling } },
	[45201260] = { name="Riverpaw Mobs (Various Gnolls)", class={ "DRUID" },
					spell={ "Savage Roar" }, guide={ st.druid.ferocious } },
	[45203240] = { name="Watchers & Golems", class={ "WARLOCK" },
					spell={ "Master Channeler" }, guide={ st.warlock.channeling } },
	[45407020] = { name="Defias Mobs (Various)", class={ "DRUID", "ROGUE", "WARRIOR" }, faction="Alliance",
					guide={ st.druid.lacerate, st.rogue.bladeDance, st.warrior.quickStrike },
					spell={ "Lacerate", "Blade Dance", "Quick Strike" },
					tip={ "Magic Pumpkin Seed", "Pp for Discrete Envelope\nand Equipment Stash Key", "Gillsbane" } },
																			 
	[45407050] = { object=409562, name="Spellbook", class={ "MAGE" },
					spell={ "Icy Veins" }, guide={ st.mage.icyVeins },
					quest={ 78142 }, questName={ "Bewitchments and Glamours" },
					tip="In the first hut on the left as you enter Moonbrook.\nRed book on the bottom of a bookshelf" },
	[45603900] = { npc=210501, name="Harvest Reaper Prototype", class={ "WARLOCK" },
					spell={ "Master Channeler" }, guide={ st.warlock.channeling } },
	[45801760] = { name="Riverpaw Mobs (Various Gnolls)", class={ "DRUID" },
					spell={ "Savage Roar" }, guide={ st.druid.ferocious } },
	[45806680] = { name="Defias Mobs (Various)", class={ "DRUID", "ROGUE", "WARRIOR" }, faction="Alliance",
					guide={ st.druid.lacerate, st.rogue.bladeDance, st.warrior.quickStrike },
					spell={ "Lacerate", "Blade Dance", "Quick Strike" },
					tip={ "Magic Pumpkin Seed", "Pp for Discrete Envelope\nand Equipment Stash Key", "Gillsbane" } },
																			 
	[46001860] = { object=210537, name="Undying Laborer", class={ "PALADIN" }, faction="Alliance",
					spell={ "Horn of Lordaeron" }, tip="Lower room", guide={ st.paladin.blessings } },
	[46601460] = { name="Riverpaw Mobs (Various Gnolls)", class={ "DRUID" },
					spell={ "Savage Roar" }, guide={ st.druid.ferocious } },
	[46603760] = { name="Defias Mobs (Various)", class={ "DRUID", "ROGUE", "WARRIOR" }, faction="Alliance",
					guide={ st.druid.lacerate, st.rogue.bladeDance, st.warrior.quickStrike },
					spell={ "Lacerate", "Blade Dance", "Quick Strike" },
					tip={ "Magic Pumpkin Seed", "Pp for Discrete Envelope\nand Equipment Stash Key", "Gillsbane" } },
																			 
	[46802960] = { object=210537, name="Undying Laborer", class={ "PALADIN" }, faction="Alliance",
					spell={ "Horn of Lordaeron" }, tip="Lower room", guide={ st.paladin.blessings } },
	[46805220] = { name="Defias Mobs (Various)", class={ "DRUID", "ROGUE", "WARRIOR" }, faction="Alliance",
					guide={ st.druid.lacerate, st.rogue.bladeDance, st.warrior.quickStrike },
					spell={ "Lacerate", "Blade Dance", "Quick Strike" },
					tip={ "Magic Pumpkin Seed", "Pp for Discrete Envelope\nand Equipment Stash Key", "Gillsbane" } },
																			 
	[47004640] = { name="Defias Mobs (Various)", class={ "DRUID", "ROGUE", "WARRIOR" }, faction="Alliance",
					guide={ st.druid.lacerate, st.rogue.bladeDance, st.warrior.quickStrike },
					spell={ "Lacerate", "Blade Dance", "Quick Strike" },
					tip={ "Magic Pumpkin Seed", "Pp for Discrete Envelope\nand Equipment Stash Key", "Gillsbane" } },
																			 
	[47005160] = { npc=832, name="Dust Devil", class={ "WARLOCK" },
					spell={ "Master Channeler" }, guide={ st.warlock.channeling } },
	[47603560] = { name="Watchers & Golems", class={ "WARLOCK" },
					spell={ "Master Channeler" }, guide={ st.warlock.channeling } },
	[48602160] = { name="Defias Mobs (Various)", class={ "DRUID", "ROGUE", "WARRIOR" }, faction="Alliance",
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
	[52601860] = { name="Riverpaw Mobs (Various Gnolls)", class={ "DRUID" },
					spell={ "Savage Roar" }, guide={ st.druid.ferocious } },
	[52801420] = { name="Riverpaw Mobs (Various Gnolls)", class={ "DRUID" },
					spell={ "Savage Roar" }, guide={ st.druid.ferocious } },
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
	[55401560] = { name="Riverpaw Mobs (Various Gnolls)", class={ "DRUID" },
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
	[62405200] = { npc=832, name="Dust Devil", class={ "WARLOCK" },
					spell={ "Master Channeler" }, guide={ st.warlock.channeling } },
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
	[31271830] = { name="Vodyanoi / Stump", class={ "DRUID" },
					spell={ "Starsurge" }, tip="Stay a while and listen", guide={ st.druid.runeOfStars } },
	[33634786] = { object=409717, name="Scrolls", class={ "MAGE" },
					spell={ "Icy Veins" }, guide={ st.mage.icyVeins },
					quest={ 78146 }, questName={ "Goaz Scrolls" }, tip="Lowest level in a big urn" },
	[36891521] = { npc=212186, name="Grugimdern", class={ "DRUID" },
					spell={ "Starsurge" }, tip="He's under a bridge", guide={ st.druid.runeOfStars } },
	[46401640] = { name="Dark Iron Demolitionist/Dwarf/Saboteur/Tunneler", class=st.allClass, spell=st.allSpellG,
					guide={ st.grizzby }, quest={ 78266 }, questName={ "Dark Iron Ordinance" } },
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
	[60002480] = { name="Dark Iron Demolitionist/Dwarf/Saboteur/Tunneler", class=st.allClass, spell=st.allSpellG,
					guide={ st.grizzby }, quest={ 78266 }, questName={ "Dark Iron Ordinance" } },
	[62202980] = { name="Dark Iron Demolitionist/Dwarf/Saboteur/Tunneler", class=st.allClass, spell=st.allSpellG,
					guide={ st.grizzby }, quest={ 78266 }, questName={ "Dark Iron Ordinance" } },
	[62602600] = { name="Dark Iron Demolitionist/Dwarf/Saboteur/Tunneler", class=st.allClass, spell=st.allSpellG,
					guide={ st.grizzby }, quest={ 78266 }, questName={ "Dark Iron Ordinance" } },
	[64002740] = { name="Dark Iron Demolitionist/Dwarf/Saboteur/Tunneler", class=st.allClass, spell=st.allSpellG,
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
	[32004300] = { npc=3924, name="Thistlefur Shaman", class={ "HUNTER" }, spell={ "Kill Command" },
					guide={ st.hunter.killCommand }, tip="Drops Wild Magic Essence",
					quest={ 78114, 78121 }, questName={ "Wild Wyvern Wrangling", "Wrangling a Wild Wyvern" } },
	[33603880] = { npc=3924, name="Thistlefur Shaman", class={ "HUNTER" }, spell={ "Kill Command" },
					guide={ st.hunter.killCommand }, tip="Drops Wild Magic Essence",
					quest={ 78114, 78121 }, questName={ "Wild Wyvern Wrangling", "Wrangling a Wild Wyvern" } },
	[40803340] = { npc=3922, name="Thistlefur Totemic", class={ "HUNTER" }, spell={ "Kill Command" },
					guide={ st.hunter.killCommand }, tip="Drops Wild Magic Essence",
					quest={ 78114, 78121 }, questName={ "Wild Wyvern Wrangling", "Wrangling a Wild Wyvern" } },
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
	[89507700] = { object=409315, name="Shattered Orb", class={ "PALADIN" },
					faction="Alliance", tip="Click below the weapons",
					spell={ "Divine Storm" }, quest={ { 78088, 78089, 78090, 78091, 78092, 78093 } },
					questName={ { "A Strange Artifact", "Advice from Stormwind", "A Second Opinion", "Earning Your Salt", 
						"It Must Be Destroyed", "Return to Delgren" } }, guide={ st.paladin.divineStorm } },
}
points[ 1439 ] = { -- Darkshore
	[32803710] = { object=414624, name="Lighthouse Stash", class={ "ROGUE" }, faction="Alliance",
					tip="Between the roots of a large tree\non a small island with a lighthouse",
																									
					spell={ "Saber Slash" }, guide={ st.rogue.saberSlash } },
	[37005360] = { npc=2234, name="Young Reef Crawler", class={ "DRUID", "HUNTER" },
					spell={ "Lacerate", "Beast Mastery" }, guide={ st.druid.lacerate, st.hunter.beastMastery } },
																									
														 
	[38603160] = { npc=2234, name="Young Reef Crawler", class={ "DRUID", "HUNTER" },
					spell={ "Lacerate", "Beast Mastery" }, guide={ st.druid.lacerate, st.hunter.beastMastery } },
																									
														 
																									
														 
	[38665689] = { name="Furbolg mobs (Various)", class={ "HUNTER" },
					spell={ "Beast Mastery" }, guide={ st.hunter.beastMastery} },
	[39005360] = { name="Blackwood Mobs (Various Furlbog)", class={ "DRUID" },
					spell={ "Lacerate" }, guide={ st.druid.lacerate } },
	[40605280] = { name="Blackwood Mobs (Various Furlbog)", class={ "DRUID" },
					spell={ "Lacerate" }, guide={ st.druid.lacerate } },
	[40605620] = { name="Blackwood Mobs (Various Furlbog)", class={ "DRUID" },
					spell={ "Lacerate" }, guide={ st.druid.lacerate } },
	[40608860] = { name="Blackwood Mobs (Various Furlbog)", class={ "DRUID" },
					spell={ "Lacerate" }, guide={ st.druid.lacerate } },
	[42608280] = { name="Blackwood Mobs (Various Furlbog)", class={ "DRUID" },
					spell={ "Lacerate" }, guide={ st.druid.lacerate } },
	[42808660] = { name="Blackwood Mobs (Various Furlbog)", class={ "DRUID" },
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
	[59612213] = { object=409496, name="Scrolls", class={ "MAGE" },
					spell={ "Icy Veins" }, guide={ st.mage.icyVeins },
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
	[26000720] = { name="Slitherblade Mobs (Various)", class=st.allClass, spell=st.allSpellG,
					guide={ st.grizzby }, quest={ 78265 }, questName={ "Fish Oil" } },
	[27600960] = { name="Slitherblade Mobs (Various)", class=st.allClass, spell=st.allSpellG,
					guide={ st.grizzby }, quest={ 78265 }, questName={ "Fish Oil" } },
	[28800520] = { name="Slitherblade Mobs (Various)", class=st.allClass, spell=st.allSpellG,
					guide={ st.grizzby }, quest={ 78265 }, questName={ "Fish Oil" } },
	[30201800] = { name="Slitherblade Mobs (Various)", class=st.allClass, spell=st.allSpellG,
					guide={ st.grizzby }, quest={ 78265 }, questName={ "Fish Oil" } },
	[30400660] = { name="Slitherblade Mobs (Various)", class=st.allClass, spell=st.allSpellG,
					guide={ st.grizzby }, quest={ 78265 }, questName={ "Fish Oil" } },
	[30402420] = { name="Slitherblade Mobs (Various)", class=st.allClass, spell=st.allSpellG,
					guide={ st.grizzby }, quest={ 78265 }, questName={ "Fish Oil" } },
	[30601400] = { name="Slitherblade Mobs (Various)", class=st.allClass, spell=st.allSpellG,
					guide={ st.grizzby }, quest={ 78265 }, questName={ "Fish Oil" } },
	[31001100] = { name="Slitherblade Mobs (Various)", class=st.allClass, spell=st.allSpellG,
					guide={ st.grizzby }, quest={ 78265 }, questName={ "Fish Oil" } },
	[31202060] = { name="Slitherblade Mobs (Various)", class=st.allClass, spell=st.allSpellG,
					guide={ st.grizzby }, quest={ 78265 }, questName={ "Fish Oil" } },
	[32200660] = { name="Slitherblade Mobs (Various)", class=st.allClass, spell=st.allSpellG,
					guide={ st.grizzby }, quest={ 78265 }, questName={ "Fish Oil" } },
	[32202560] = { name="Slitherblade Mobs (Various)", class=st.allClass, spell=st.allSpellG,
					guide={ st.grizzby }, quest={ 78265 }, questName={ "Fish Oil" } },
	[33403000] = { name="Slitherblade Mobs (Various)", class=st.allClass, spell=st.allSpellG,
					guide={ st.grizzby }, quest={ 78265 }, questName={ "Fish Oil" } },
	[34200440] = { name="Slitherblade Mobs (Various)", class=st.allClass, spell=st.allSpellG,
					guide={ st.grizzby }, quest={ 78265 }, questName={ "Fish Oil" } },
	[34802580] = { name="Slitherblade Mobs (Various)", class=st.allClass, spell=st.allSpellG,
					guide={ st.grizzby }, quest={ 78265 }, questName={ "Fish Oil" } },
	[34803120] = { name="Slitherblade Mobs (Various)", class=st.allClass, spell=st.allSpellG,
					guide={ st.grizzby }, quest={ 78265 }, questName={ "Fish Oil" } },
	[35600520] = { name="Slitherblade Mobs (Various)", class=st.allClass, spell=st.allSpellG,
					guide={ st.grizzby }, quest={ 78265 }, questName={ "Fish Oil" } },
	[36000860] = { name="Slitherblade Mobs (Various)", class=st.allClass, spell=st.allSpellG,
					guide={ st.grizzby }, quest={ 78265 }, questName={ "Fish Oil" } },
	[36402260] = { name="Slitherblade Mobs (Various)", class=st.allClass, spell=st.allSpellG,
					guide={ st.grizzby }, quest={ 78265 }, questName={ "Fish Oil" } },
	[36602660] = { name="Slitherblade Mobs (Various)", class=st.allClass, spell=st.allSpellG,
					guide={ st.grizzby }, quest={ 78265 }, questName={ "Fish Oil" } },
	[36803180] = { name="Slitherblade Mobs (Various)", class=st.allClass, spell=st.allSpellG,
					guide={ st.grizzby }, quest={ 78265 }, questName={ "Fish Oil" } },
	[38201840] = { name="Slitherblade Mobs (Various)", class=st.allClass, spell=st.allSpellG,
					guide={ st.grizzby }, quest={ 78265 }, questName={ "Fish Oil" } },
	[39602220] = { name="Slitherblade Mobs (Various)", class=st.allClass, spell=st.allSpellG,
					guide={ st.grizzby }, quest={ 78265 }, questName={ "Fish Oil" } },
	[39602500] = { name="Slitherblade Mobs (Various)", class=st.allClass, spell=st.allSpellG,
					guide={ st.grizzby }, quest={ 78265 }, questName={ "Fish Oil" } },
}
points[ 1411 ] = { -- Durotar
	[35204860] = { npc=5823, name="Death Flayer", class={ "WARRIOR" }, faction="Horde",
					spell={ "Furious Thunder" }, guide={ st.warrior.furiousThunder } },
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
	[39005180] = { npc=5823, name="Death Flayer", class={ "WARRIOR" }, faction="Horde",
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
	[40002420] = { npc=3131, name="Lightning Hide", class={ "WARRIOR" }, faction="Horde",
					spell={ "Furious Thunder" }, guide={ st.warrior.furiousThunder } },

	[40605200] = { npc=208179, name="Rustling Bush", class={ "HUNTER" }, faction="Horde",
					spell={ "Master Marksman" }, guide={ st.hunter.masterMark } },
	[40606760] = { npc=3281, name="Sarkoth", class={ "HUNTER", "WARRIOR" }, faction="Horde",
					spell={ "Explosive Shot", "Furious Thunder" },
					guide={ st.hunter.explosiveShot, st.warrior.furiousThunder } },

	[40606840] = { npc=3156, name="Nartok", class={ "WARLOCK" }, faction="Horde",
					spell={ "Haunt" }, guide={ st.starterZoneClass }, quest={ 77586 },
					questName={ "Stolen Power" } },
	[40806400] = { npc=3124, name="Scorpid Worker", class={ "HUNTER", "SHAMAN" }, faction="Horde",
					spell={ "Chimera Shot", "Overload" }, 
					guide={ st.starterZoneClass, st.shaman.dyadicIcon },
					quest={ ( ( ns.class == "TROLL" ) and 77590 or 77584 ), ( ( ns.class == "ORC" ) and 77585 or 77587 ) },
					questName={ ( ( ns.class == "TROLL" ) and "Rugged Terrain" or "Hunt for the Rune" ), "Icons of Power" } },
	[41204960] = { npc=203079, name="Wandering Swordsman", class={ "WARRIOR" },
					spell={ "Blood Frenzy" }, guide={ st.warrior.bloodFrenzy } },

	[41206800] = { npc=3155, name="Rwag", class={ "ROGUE" }, faction="Horde",
					quest={ 77583 }, questName={ "Atop the Cliffs" },
							
																				
																											
														
													   
																 
														  
																										  
																											 
					spell={ "Shadowstrike" }, guide={ st.starterZoneClass } },
																		  
	[42002660] = { name="Burning Blade mobs (Various)", class={ "MAGE", "ROGUE" }, faction="Horde",
															   
																							   
																		 
					spell={ "Living Flame", "Mutilate" },
					tip="Ignore the map. To get to here, exit\nfrom Razor Hill and take the eastern\npath that goes up and north"
																  
														  
						..( ( ns.class == "ROGUE" ) and "\n\nPick Pocket. Don't need to kill" or "" ),					
					guide={ st.mage.livingFlame, st.rogue.mutilate } },
	[42406880] = { npc=3707, name="Ken'jai", class={ "PRIEST" }, faction="Horde",
					spell={ "Penance" }, guide={ st.starterZoneClass }, quest={ 77642 }, questName={ "Wisdom of the Loa" } },
																		  
	[42406900] = { npc=3157, name="Shikrik", class={ "SHAMAN" }, faction="Horde",
					spell={ "Overload" }, quest={ ( ( ns.class == "ORC" ) and 77585 or 77587 ) }, guide={ st.shaman.dyadicIcon },
					questName={ "Icons of Power" } },
	[42606900] = { npc=5884, name="Mai'ah", class={ "MAGE" }, faction="Horde",
					spell={ "Ice Lance" }, questName={ "Spell Research" }, quest={ 77643 }, guide={ st.starterZoneClass } },
	[42802380] = { npc=3131, name="Lightning Hide", class={ "WARRIOR" }, faction="Horde",
					spell={ "Furious Thunder" }, guide={ st.warrior.furiousThunder } },
	[42806920] = { npc=3154, name="Jen'shan", class={ "HUNTER" }, faction="Horde",
					quest={ ( ( ns.class == "TROLL" ) and 77590 or 77584 ) },
					questName={ ( ( ns.class == "TROLL" ) and "Rugged Terrain" or "Hunt for the Rune" ) },
					spell={ "Chimera Shot" }, guide={ st.starterZoneClass } },					
	[42806940] = { npc=3153, name="Frang", class={ "WARRIOR" }, faction="Horde",
					spell={ "Victory Rush" }, guide={ st.starterZoneClass },
					quest={ ( ( ns.class == "TROLL" ) and 77588 or 77582 ) }, questName={ "A Trial of Fitness" } },					
																 
														  
																										  
	[43005440] = { object=404695, name="Waterlogged Stashbox", class={ "MAGE", "WARLOCK" }, faction="Horde",
					spell={ "Ice Lance", "Haunt" },
					guide={ st.starterZoneClass }, quest={ { 77643 }, { 77586 } },
					questName={ { "Spell Research" }, { "Stolen Power" } }, tip="In the pond at the foot of the waterfall" },
																											 
																					  
																			 
	[43206960] = { object=404911, name="Hidden Cache", class={ "ROGUE", "WARRIOR" }, faction="Horde",
					spell={ "Shadowstrike", "Victory Rush" },
					quest={ 77583, ( ( ns.class == "TROLL" ) and 77588 or 77582 ) }, questName={ "Atop the Cliffs", "A Trial of Fitness" },
					guide={ st.starterZoneClass  },
					tip="Locate the Warrior Trainer Frang. If you stand well\n"
						.."back from him and look up at a ledge to the south-\n"
						.."east of Frang then you can see the Cache up there!\n\n"
						.."Simply go north and bear left / anti-clockwise. Jump\n"
						.."across a gap and then down and Voilà. Grab the lewt!" },
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
																												   
																									   
							
																				
																											
														
													   
																 
														  
																										  
	[45803380] = { name="Dustwind harpies (Various)", class={ "WARRIOR" }, faction="Horde",
					spell={ "Devastate" }, guide={ st.warrior.devastate ..st.warrior.devastateVah },
					tip="Severed Harpy Head" },
	[47006280] = { npc=3124, name="Scorpid Worker", class={ "HUNTER", "SHAMAN" }, faction="Horde",
					spell={ "Chimera Shot", "Overload" }, 
					guide={ st.starterZoneClass, st.shaman.dyadicIcon },
					quest={ ( ( ns.class == "TROLL" ) and 77590 or 77584 ), ( ( ns.class == "ORC" ) and 77585 or 77587 ) },
					questName={ ( ( ns.class == "TROLL" ) and "Rugged Terrain" or "Hunt for the Rune" ), "Icons of Power" } },
	[47403140] = { name="Dustwind harpies (Various)", class={ "WARRIOR" }, faction="Horde",
					spell={ "Devastate" }, guide={ st.warrior.devastate ..st.warrior.devastateVah },
					tip="Severed Harpy Head" },
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
					spell={ "Lifebloom", "Inspiration Exemplar", "Prayer of Mending", "Ancestral Guidance" }, guide={ st.woundedAdventurer  } },
	[48603300] = { name="Dustwind harpies (Various)", class={ "WARRIOR" }, faction="Horde",
					spell={ "Devastate" }, guide={ st.warrior.devastate ..st.warrior.devastateVah },
					tip="Severed Harpy Head" },
	[49602120] = { name="Dustwind harpies (Various)", class={ "WARRIOR" }, faction="Horde",
					spell={ "Devastate" }, guide={ st.warrior.devastate ..st.warrior.devastateVah },
					tip="Severed Harpy Head" },
																							 
																		 
												  
																									
																  
														  
																										
	[50002740] = { name="Dustwind harpies (Various)", class={ "WARRIOR" }, faction="Horde",
					spell={ "Devastate" }, guide={ st.warrior.devastate ..st.warrior.devastateVah },
					tip="Severed Harpy Head" },
	[50007920] = { name="Kolkar centaurs (Various)", class={ "WARRIOR" }, faction="Horde",
					spell={ "Devastate" }, guide={ st.warrior.devastate ..st.warrior.devastateVah },
					tip="Severed Centaur Head" },
	[50005160] = { name="Lightning Infused Totem", class={ "SHAMAN" }, faction="Horde",
					spell={ "Shield Mastery" }, guide={ st.shaman.galvanicIcon } },
																								   
																		 
												  
																									
																  
														  
																										
	[50603180] = { name="Dustwind harpies (Various)", class={ "WARRIOR" }, faction="Horde",
					spell={ "Devastate" }, guide={ st.warrior.devastate ..st.warrior.devastateVah },
					tip="Severed Harpy Head" },
	[51401040] = { name="Burning Blade (Various)", class={ "MAGE", "ROGUE" }, faction="Horde",
					spell={ "Living Flame", "Quick Draw" }, tip={ nil, "Pick Pocket or Kill. Top-Left Map Piece" },
					guide={ st.mage.livingFlame, st.rogue.quickDraw ..st.rogue.quickDrawDur } },
	[51402800] = { name="Dustwind harpies (Various)", class={ "WARRIOR" }, faction="Horde",
					spell={ "Devastate" }, guide={ st.warrior.devastate ..st.warrior.devastateVah },
					tip="Severed Harpy Head" },
	[51408460] = { name="Makrura (Various)", class={ "WARLOCK" }, faction="Horde",
					spell={ "Demonic Grace" }, guide={ st.warlock.grace ..st.warlock.graceDur }, tip="Makrura Leg" },
	[51600800] = { npc=3198, name="Burning Blade Apprentice", class={ "ROGUE", "ROGUE", "WARLOCK" }, faction="Horde",
					spell={ "Mutilate", "Quick Draw", "Demonic Grace" },
					guide={ st.rogue.mutilate, st.warlock.grace ..st.warlock.graceDur },
					tip={ "Pick Pocket or Kill. Top-Left Map Piece", "Must Pick Pocket the Note from Ba'so", "Ominous Tome" } },
	[51601900] = { npc=3118, name="Dustwind Storm Witch", class={ "WARLOCK" }, faction="Horde",
					spell={ "Demonic Grace" }, guide={ st.warlock.grace ..st.warlock.graceDur }, tip="Ominous Tome" },
	[51806580] = { name="Burning Blade (Various)", class={ "MAGE", "ROGUE" }, faction="Horde",
					spell={ "Living Flame", "Quick Draw" }, tip={ nil, "Pick Pocket or Kill. Top-Left Map Piece" },
					guide={ st.mage.livingFlame, st.rogue.quickDraw ..st.rogue.quickDrawDur } },
	[52005840] = { npc=208036, name="Ba'so", class={ "ROGUE" }, faction="Horde", spell={ "Mutilate" },
					tip="West of Tiragarde Keep, at the hills", guide={ st.rogue.mutilate } },
	[52174395] = { npc=208184, name="Razzil", class={ "HUNTER" }, spell={ "Carve" },
					guide={ st.hunter.carve } },
	[52200920] = { npc=3204, name="Gazz'uz", class={ "MAGE", "PRIEST", "WARLOCK", "WARRIOR" }, faction="Horde",
																								   
					spell={ "Fingers of Frost", "Shared Pain", "Soul Siphon", "Furious Thunder" },
					guide={ st.mage.fingers, st.priest.saviour, st.warlock.soulSiphon, st.warrior.furiousThunder },
					tip="He's level 14 and has a Voidwalker.\nSeveral classes need him!" },
	[52202680] = { name="Burning Blade mobs (Various)", class={ "MAGE", "ROGUE", "ROGUE" }, faction="Horde",
					spell={ "Living Flame", "Mutilate", "Quick Draw" },
					tip="Ignore the map. To get to here, exit\nfrom Razor Hill and take the eastern\npath that goes up and north"
						..( ( ns.class == "ROGUE" ) and "\n\nPick Pocket. Don't need to kill" or "" ),					
					guide={ st.mage.livingFlame, st.rogue.mutilate, st.rogue.quickDraw ..st.rogue.quickDrawDur } },
	[52408260] = { name="Kolkar centaurs (Various)", class={ "WARRIOR" }, faction="Horde",
					spell={ "Devastate" }, guide={ st.warrior.devastate ..st.warrior.devastateVah },
					tip="Severed Centaur Head" },
	[52607640] = { name="Kolkar centaurs (Various)", class={ "WARRIOR" }, faction="Horde",
					spell={ "Devastate" }, guide={ st.warrior.devastate ..st.warrior.devastateVah },
					tip="Severed Centaur Head" },
	[52802960] = { name="Burning Blade (Various)", class={ "MAGE" }, faction="Horde",
					spell={ "Living Flame" }, guide={ st.mage.livingFlame } },
	[52852903] = { name="Dustwind Cave mobs (various)", class={ "ROGUE" }, faction="Horde",
					spell={ "Mutilate" }, guide={ st.rogue.mutilate } },
	[53004360] = { npc=207957, name="Vhi Bonesplitter", class={ "WARRIOR" }, faction="Horde",
					spell={ "Devastate" }, guide={ st.warrior.devastate ..st.warrior.devastateVah } },
	[53202460] = { npc=3118, name="Dustwind Storm Witch", class={ "WARLOCK" }, faction="Horde",
					spell={ "Demonic Grace" }, guide={ st.warlock.grace ..st.warlock.graceDur }, tip="Ominous Tome" },
	[53600860] = { name="Burning Blade (Various)", class={ "MAGE", "ROGUE" }, faction="Horde",
					spell={ "Living Flame", "Quick Draw" }, tip={ nil, "Pick Pocket or Kill. Top-Left Map Piece" },
					guide={ st.mage.livingFlame, st.rogue.quickDraw ..st.rogue.quickDrawDur } },
	[54002700] = { name="Dustwind harpies (Various)", class={ "WARRIOR" }, faction="Horde",
					spell={ "Devastate" }, guide={ st.warrior.devastate ..st.warrior.devastateVah },
					tip="Severed Harpy Head" },
	[54002740] = { object=387466, name="Rusty Lockbox", class={ "ROGUE" }, faction="Horde",
					spell={ "Slaughter from the Shadows" }, guide={ st.rogue.slaughter },
					tip= "Approach from Razor Hill: Go north but veer right and up.\n"
							.."When you get to a clearing/plateau you'll see a cave in\n"
							.."the distance. Veer to the right of the cave. You'll come\n"
							.."to a flat/smooth rock ledge. Jump across for your lewt!" },
	[54002360] = { name="Dustwind harpies (Various)", class={ "WARRIOR" }, faction="Horde",
					spell={ "Devastate" }, guide={ st.warrior.devastate ..st.warrior.devastateVah },
					tip="Severed Harpy Head" },
	[55407250] = { object=208309, name="Loa Altar", class={ "PRIEST" }, faction="Horde",
					tip="/kneel and wait a bit",
					spell={ "Penance" }, guide={ st.starterZoneClass }, quest={ 77642 }, questName={ "Wisdom of the Loa" } },
	[54600880] = { npc=3198, name="Burning Blade Apprentice", class={ "WARLOCK" }, faction="Horde",
					spell={ "Demonic Grace" }, guide={ st.warlock.grace ..st.warlock.graceDur }, tip="Ominous Tome" },
	[54604160] = { npc=208226, name="Darmak Bloodhowl", class={ "WARLOCK" }, faction="Horde",
					spell={ "Soul Siphon" }, guide={ st.warlock.soulSiphon }, tip="In the Barracks" },
	[55803840] = { npc=203079, name="Wandering Swordsman", class={ "WARRIOR" },
					spell={ "Blood Frenzy" }, guide={ st.warrior.bloodFrenzy } },
																												
																										  
	[55808220] = { name="Makrura (Various)", class={ "WARLOCK" }, faction="Horde",
					spell={ "Demonic Grace" }, guide={ st.warlock.grace ..st.warlock.graceDur }, tip="Makrura Leg" },
																												
																										  
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
	[58674592] = { npc=208275, name="Frozen Makrura", class={ "MAGE", "SHAMAN", "WARLOCK" }, faction="Horde",
																			 
					tip="Needs about five separate Fire debuffs to defrost",
					spell={ "Burnout", "Molten Blast", "Chaos Bolt" }, guide={ st.frozen, st.shaman.sulfurousIcon, st.frozen } },
	[58808460] = { name="Makrura (Various)", class={ "WARLOCK" }, faction="Horde",
					spell={ "Demonic Grace" }, guide={ st.warlock.grace ..st.warlock.graceDur }, tip="Makrura Leg" },
	[59005800] = { name="Lightning Infused Totem", class={ "SHAMAN" }, faction="Horde",
					spell={ "Shield Mastery" }, guide={ st.shaman.galvanicIcon } },
	[59007760] = { name="Makrura (Various)", class={ "WARLOCK" }, faction="Horde",
					spell={ "Demonic Grace" }, guide={ st.warlock.grace ..st.warlock.graceDur }, tip="Makrura Leg" },
																												
																										  
	[61405220] = { name="Makrura (Various)", class={ "WARLOCK" }, faction="Horde",
					spell={ "Demonic Grace" }, guide={ st.warlock.grace ..st.warlock.graceDur }, tip="Makrura Leg" },
	[61604500] = { name="Makrura (Various)", class={ "WARLOCK" }, faction="Horde",
					spell={ "Demonic Grace" }, guide={ st.warlock.grace ..st.warlock.graceDur }, tip="Makrura Leg" },
	[61607060] = { name="Makrura (Various)", class={ "WARLOCK" }, faction="Horde",
					spell={ "Demonic Grace" }, guide={ st.warlock.grace ..st.warlock.graceDur }, tip="Makrura Leg" },
	[51408460] = { name="Makrura (Various)", class={ "WARLOCK" }, faction="Horde",
					spell={ "Demonic Grace" }, guide={ st.warlock.grace ..st.warlock.graceDur }, tip="Makrura Leg" },
	[61609580] = { name="Makrura (Various)", class={ "WARLOCK" }, faction="Horde",
					spell={ "Demonic Grace" }, guide={ st.warlock.grace ..st.warlock.graceDur }, tip="Makrura Leg" },
	[62004980] = { name="Makrura (Various)", class={ "WARLOCK" }, faction="Horde",
					spell={ "Demonic Grace" }, guide={ st.warlock.grace ..st.warlock.graceDur }, tip="Makrura Leg" },
	[62109480] = { name="Rune of Quick Draw", faction="Horde", class={ "ROGUE" }, tip="Final location",
					spell={ "Quick Draw" }, guide={ st.rogue.quickDraw ..st.rogue.quickDrawDur } },
	[62605260] = { name="Makrura (Various)", class={ "WARLOCK" }, faction="Horde",
					spell={ "Demonic Grace" }, guide={ st.warlock.grace ..st.warlock.graceDur }, tip="Makrura Leg" },
	[62606260] = { name="Makrura (Various)", class={ "WARLOCK" }, faction="Horde",
					spell={ "Demonic Grace" }, guide={ st.warlock.grace ..st.warlock.graceDur }, tip="Makrura Leg" },
	[62607720] = { name="Makrura (Various)", class={ "WARLOCK" }, faction="Horde",
					spell={ "Demonic Grace" }, guide={ st.warlock.grace ..st.warlock.graceDur }, tip="Makrura Leg" },
	[62608820] = { name="Makrura (Various)", class={ "WARLOCK" }, faction="Horde",
					spell={ "Demonic Grace" }, guide={ st.warlock.grace ..st.warlock.graceDur }, tip="Makrura Leg" },
	[65205020] = { name="Makrura (Various)", class={ "WARLOCK" }, faction="Horde",
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
	[67608780] = { npc=3205, name="Zalazane", class={ "MAGE" }, faction="Horde",
					spell={ "Fingers of Frost" }, guide={ st.mage.fingers } },
	[67808860] = { npc=204070, name="Soboz", class={ "WARLOCK" }, faction="Horde",
					spell={ "Demonic Grace" }, guide={ st.warlock.grace ..st.warlock.graceDur }, tip="Zalazane" },
	[68608280] = { name="Hexed/Voodoo Trolls", class={ "WARLOCK" }, faction="Horde",
					spell={ "Demonic Grace" }, guide={ st.warlock.grace ..st.warlock.graceDur }, tip="Ominous Tome" },
	[68009080] = { name="Makrura (Various)", class={ "WARLOCK" }, faction="Horde",
					spell={ "Demonic Grace" }, guide={ st.warlock.grace ..st.warlock.graceDur }, tip="Makrura Leg" },
	[68707140] = { npc=208124, name="Raluk", class={ "HUNTER" }, spell={ "Flanking Strike" },
					guide={ st.hunter.flankingStrike }, tip="Farm Durotar Pig Meat from nearby Dire Mottled Boars" },
	[71007040] = { name="Makrura (Various)", class={ "WARLOCK" }, faction="Horde",
					spell={ "Demonic Grace" }, guide={ st.warlock.grace ..st.warlock.graceDur }, tip="Makrura Leg" },
}
points[ 1444 ] = { -- Feralas
	[23406420] = { name="Hatecrest Mobs (Various)", class=st.allClass, spell=st.allSpellG,
					guide={ st.grizzby }, quest={ 78265 }, questName={ "Fish Oil" } },
	[24606680] = { name="Hatecrest Mobs (Various)", class=st.allClass, spell=st.allSpellG,
					guide={ st.grizzby }, quest={ 78265 }, questName={ "Fish Oil" } },
	[24806240] = { name="Hatecrest Mobs (Various)", class=st.allClass, spell=st.allSpellG,
					guide={ st.grizzby }, quest={ 78265 }, questName={ "Fish Oil" } },
	[25205420] = { name="Hatecrest Mobs (Various)", class=st.allClass, spell=st.allSpellG,
					guide={ st.grizzby }, quest={ 78265 }, questName={ "Fish Oil" } },
	[25404940] = { name="Hatecrest Mobs (Various)", class=st.allClass, spell=st.allSpellG,
					guide={ st.grizzby }, quest={ 78265 }, questName={ "Fish Oil" } },
	[25605580] = { name="Hatecrest Mobs (Various)", class=st.allClass, spell=st.allSpellG,
					guide={ st.grizzby }, quest={ 78265 }, questName={ "Fish Oil" } },
	[25805200] = { name="Hatecrest Mobs (Various)", class=st.allClass, spell=st.allSpellG,
					guide={ st.grizzby }, quest={ 78265 }, questName={ "Fish Oil" } },
	[26006720] = { name="Hatecrest Mobs (Various)", class=st.allClass, spell=st.allSpellG,
					guide={ st.grizzby }, quest={ 78265 }, questName={ "Fish Oil" } },
	[26206300] = { name="Hatecrest Mobs (Various)", class=st.allClass, spell=st.allSpellG,
					guide={ st.grizzby }, quest={ 78265 }, questName={ "Fish Oil" } },
	[26805040] = { name="Hatecrest Mobs (Various)", class=st.allClass, spell=st.allSpellG,
					guide={ st.grizzby }, quest={ 78265 }, questName={ "Fish Oil" } },
	[27006420] = { name="Hatecrest Mobs (Various)", class=st.allClass, spell=st.allSpellG,
					guide={ st.grizzby }, quest={ 78265 }, questName={ "Fish Oil" } },
	[27206940] = { name="Hatecrest Mobs (Various)", class=st.allClass, spell=st.allSpellG,
					guide={ st.grizzby }, quest={ 78265 }, questName={ "Fish Oil" } },
	[27405380] = { name="Hatecrest Mobs (Various)", class=st.allClass, spell=st.allSpellG,
					guide={ st.grizzby }, quest={ 78265 }, questName={ "Fish Oil" } },
	[28205760] = { name="Hatecrest Mobs (Various)", class=st.allClass, spell=st.allSpellG,
					guide={ st.grizzby }, quest={ 78265 }, questName={ "Fish Oil" } },
	[28405060] = { name="Hatecrest Mobs (Various)", class=st.allClass, spell=st.allSpellG,
					guide={ st.grizzby }, quest={ 78265 }, questName={ "Fish Oil" } },
	[28607060] = { name="Hatecrest Mobs (Various)", class=st.allClass, spell=st.allSpellG,
					guide={ st.grizzby }, quest={ 78265 }, questName={ "Fish Oil" } },
	[29605260] = { name="Hatecrest Mobs (Various)", class=st.allClass, spell=st.allSpellG,
					guide={ st.grizzby }, quest={ 78265 }, questName={ "Fish Oil" } },
	[29605520] = { name="Hatecrest Mobs (Various)", class=st.allClass, spell=st.allSpellG,
					guide={ st.grizzby }, quest={ 78265 }, questName={ "Fish Oil" } },
	[29605700] = { name="Hatecrest Mobs (Various)", class=st.allClass, spell=st.allSpellG,
					guide={ st.grizzby }, quest={ 78265 }, questName={ "Fish Oil" } },
	[31205660] = { name="Hatecrest Mobs (Various)", class=st.allClass, spell=st.allSpellG,
					guide={ st.grizzby }, quest={ 78265 }, questName={ "Fish Oil" } },
	[32605600] = { name="Hatecrest Mobs (Various)", class=st.allClass, spell=st.allSpellG,
					guide={ st.grizzby }, quest={ 78265 }, questName={ "Fish Oil" } },
	[33105400] = { name="Hatecrest Mobs (Various)", class=st.allClass, spell=st.allSpellG,
					guide={ st.grizzby }, quest={ 78265 }, questName={ "Fish Oil" } },
	[34004960] = { name="Hatecrest Mobs (Various)", class=st.allClass, spell=st.allSpellG,
					guide={ st.grizzby }, quest={ 78265 }, questName={ "Fish Oil" } },
}
points[ 1450 ] = { -- Moonglade
	[52404060] = { npc=12042, name="Loganaar", class={ "DRUID" },
					spell={ "Wild Growth" }, guide={ st.druid.wildGrowth },
					quest={ 78229 }, questName={ "Trial of the Owls" } },
}
points[ 1412 ] = { -- Mulgore					
	[29472353] = { name="Windfury Cones", class={ "SHAMAN" }, faction="Horde",
					spell={ "Lava Lash" }, guide={ st.shaman.lavaLash }, quest={ { 76156, 76160, 76240 } },
					questName={ { "Stalk With The Earthmother", "Stalk With The Earthmother", "Stalk With The Earthmother" } },
					tip="Use Taraezor's \"Ground Clutter\" AddOn\nto smoothly toggle GC on/off FTW!" },
	[29632615] = { name="Windfury Cones", class={ "SHAMAN" }, faction="Horde",
					spell={ "Lava Lash" }, guide={ st.shaman.lavaLash }, quest={ { 76156, 76160, 76240 } },
					questName={ { "Stalk With The Earthmother", "Stalk With The Earthmother", "Stalk With The Earthmother" } },
					tip="Use Taraezor's \"Ground Clutter\" AddOn\nto smoothly toggle GC on/off FTW!" },
	[29802080] = { npc=2965, name="Windfury Matriarch", class={ "WARRIOR" }, faction="Horde",
					spell={ "Devastate" }, guide={ st.warrior.devastate ..st.warrior.devastateVat }, tip="Severed Harpy Head" },
	[30402360] = { npc=5785, name="Sister Hatelash", class={ "WARRIOR" }, faction="Horde",
					spell={ "Furious Thunder" }, guide={ st.warrior.furiousThunder } },
	[30806040] = { name="Palemane mobs (Various)", class={ "WARRIOR" }, faction="Horde",
					spell={ "Devastate" }, guide={ st.warrior.devastate ..st.warrior.devastateVat }, 
					tip="Severed Gnoll Head" },
	[30806160] = { npc=207515, name="Lurkmane", class={ "WARRIOR" }, faction="Horde",
					spell={ "Furious Thunder" }, guide={ st.warrior.furiousThunder } },
	[30862288] = { name="Windfury Cones", class={ "SHAMAN" }, faction="Horde",
					spell={ "Lava Lash" }, guide={ st.shaman.lavaLash }, quest={ { 76156, 76160, 76240 } },
					questName={ { "Stalk With The Earthmother", "Stalk With The Earthmother", "Stalk With The Earthmother" } },
					tip="Use Taraezor's \"Ground Clutter\" AddOn\nto smoothly toggle GC on/off FTW!" },
	[31001980] = { npc=5785, name="Sister Hatelash", class={ "WARRIOR" }, faction="Horde",
					spell={ "Furious Thunder" }, guide={ st.warrior.furiousThunder } },
	[31002280] = { name="Windfury Matriarch/Sorceress", class={ "DRUID" },
					spell={ "Mangle" }, guide={ st.druid.ursineRage } },
	[31404980] = { name="Bael'dun Digger/Appraiser", class={ "SHAMAN" }, faction="Horde",
					spell={ "Molten Blast" }, guide={ st.shaman.sulfurousIcon }, tip="Drops the storage key" },
	[31602400] = { npc=3056, name="Ghost Howl", class={ "HUNTER" },
					spell={ "Explosive Shot" }, guide={ st.hunter.explosiveShot } },
	[31604950] = { object=404352, name="Artifact Storage", class={ "SHAMAN" }, faction="Horde",
					spell={ "Molten Blast" }, guide={ st.shaman.sulfurousIcon } },
	[31802660] = { npc=2965, name="Windfury Matriarch", class={ "WARRIOR" }, faction="Horde",
					spell={ "Devastate" }, guide={ st.warrior.devastate ..st.warrior.devastateVat }, tip="Severed Harpy Head" },
	[32004740] = { name="Bael'dun Digger/Appraiser", class={ "SHAMAN" }, faction="Horde",
					spell={ "Molten Blast" }, guide={ st.shaman.sulfurousIcon }, tip="Drops the storage key" },
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
	[34804220] = { npc=3068, name="Mazzranache", class={ "HUNTER" },
					spell={ "Explosive Shot" }, guide={ st.hunter.explosiveShot } },
	[34804640] = { name="Bael'dun Digger/Appraiser", class={ "SHAMAN" }, faction="Horde",
					spell={ "Molten Blast" }, guide={ st.shaman.sulfurousIcon }, tip="Drops the storage key" },
	[35507060] = { npc=207577, name="Lunar Stone", class={ "DRUID" }, faction="Horde",
					spell={ "Sunfire" }, guide={ st.druid.runeOfTheSun } },
	[35606360] = { name="Palemane mobs (Various)", class={ "WARRIOR" }, faction="Horde",
					spell={ "Devastate" }, guide={ st.warrior.devastate ..st.warrior.devastateVat }, 
					tip="Severed Gnoll Head" },
	[35606820] = { npc=207577, name="Lunar Stone", class={ "DRUID" }, faction="Horde",
					spell={ "Sunfire" }, guide={ st.druid.runeOfTheSun } },
	[36001000] = { npc=5785, name="Sister Hatelash", class={ "WARRIOR" }, faction="Horde",
					spell={ "Furious Thunder" }, guide={ st.warrior.furiousThunder } },
	[36005700] = { npc=205382, name="Mokwa", class={ "HUNTER" }, spell={ "Flanking Strike" },
					guide={ st.hunter.flankingStrike }, tip="Farm Mulgore Bird Meat from nearby Swoops" },
	[36600960] = { npc=2965, name="Windfury Matriarch", class={ "WARRIOR" }, faction="Horde",
					spell={ "Devastate" }, guide={ st.warrior.devastate ..st.warrior.devastateVat }, tip="Severed Harpy Head" },
	[36604100] = { npc=3056, name="Ghost Howl", class={ "HUNTER" },
					spell={ "Explosive Shot" }, guide={ st.hunter.explosiveShot } },
	[36800940] = { name="Windfury Matriarch/Sorceress", class={ "DRUID" },
					spell={ "Mangle" }, guide={ st.druid.ursineRage } },
	[38001440] = { npc=3056, name="Ghost Howl", class={ "HUNTER" },
					spell={ "Explosive Shot" }, guide={ st.hunter.explosiveShot } },
	[39600520] = { npc=2965, name="Windfury Matriarch", class={ "WARRIOR" }, faction="Horde",
					spell={ "Devastate" }, guide={ st.warrior.devastate ..st.warrior.devastateVat }, tip="Severed Harpy Head" },
	[37201260] = { npc=5785, name="Sister Hatelash", class={ "WARRIOR" }, faction="Horde",
					spell={ "Furious Thunder" }, guide={ st.warrior.furiousThunder } },
	[37401860] = { name="Flatland Prowler/Taloned Swoop/Prairie Wolf Alpha", class={ "DRUID" },
					spell={ "Mangle" }, guide={ st.druid.ursineRage } },
	[37505250] = { name="Lightning Infused Totem", class={ "SHAMAN" }, faction="Horde",
					spell={ "Shield Mastery" }, guide={ st.shaman.galvanicIcon } },
	[37604950] = { npc=206248, name="Wooden Effigy", class={ "DRUID" }, faction="Horde",
					spell={ "Living Seed" }, tip="Approximately a 5 min timer", guide={ st.druid.naturalPotential } },
	[38000800] = { name="Windfury Matriarch/Sorceress", class={ "DRUID" },
					spell={ "Mangle" }, guide={ st.druid.ursineRage } },
	[39401260] = { name="Flatland Prowler/Taloned Swoop/Prairie Wolf Alpha", class={ "DRUID" },
					spell={ "Mangle" }, guide={ st.druid.ursineRage } },
	[39885161] = { item=206469, name="Prairie Flower", class={ "DRUID" }, faction="Horde",
					spell={ "Living Seed" }, tip="Various locations", guide={ st.druid.naturalPotential } },
	[40004400] = { npc=3068, name="Mazzranache", class={ "HUNTER" },
					spell={ "Explosive Shot" }, guide={ st.hunter.explosiveShot } },
	[40201560] = { npc=2979, name="Venture Co Supervisor", class={ "DRUID" }, faction="Horde",
					spell={ "Mangle" }, guide={ st.druid.ursineRage } },
	[40405380] = { npc=203079, name="Wandering Swordsman", class={ "WARRIOR" },
					spell={ "Blood Frenzy" }, guide={ st.warrior.bloodFrenzy } },
	[41366326] = { item=206469, name="Prairie Flower", class={ "DRUID" }, faction="Horde",
					spell={ "Living Seed" }, tip="Various locations", guide={ st.druid.naturalPotential } },
	[42201480] = { npc=2979, name="Venture Co Supervisor", class={ "DRUID" }, faction="Horde",
					spell={ "Mangle" }, guide={ st.druid.ursineRage } },
	[42802000] = { name="Flatland Prowler/Taloned Swoop/Prairie Wolf Alpha", class={ "DRUID" },
					spell={ "Mangle" }, guide={ st.druid.ursineRage } },
	[44202960] = { name="Flatland Prowler/Taloned Swoop/Prairie Wolf Alpha", class={ "DRUID" },
					spell={ "Mangle" }, guide={ st.druid.ursineRage } },
	[44207580] = { npc=3061, name="Lanka Farshot", class={ "HUNTER" }, faction="Horde",
					spell={ "Chimera Shot" }, guide={ st.starterZoneClass },
					quest={ 77949 }, questName={ "A Hunter's Strength" } },
	[44601500] = { name="Flatland Prowler/Taloned Swoop/Prairie Wolf Alpha", class={ "DRUID" },
					spell={ "Mangle" }, guide={ st.druid.ursineRage } },
	[44604160] = { npc=3056, name="Ghost Howl", class={ "HUNTER" },
					spell={ "Explosive Shot" }, guide={ st.hunter.explosiveShot } },
	[44964688] = { item=206469, name="Prairie Flower", class={ "DRUID" }, faction="Horde",
					spell={ "Living Seed" }, tip="Various locations", guide={ st.druid.naturalPotential } },
	[45027594] = { npc=3062, name="Meela Dawnstrider", class={ "SHAMAN" }, faction="Horde",
					faction="Horde",
					spell={ "Overload" }, quest={ 77652 }, questName={ "Icons of Power" }, guide={ st.shaman.dyadicIcon } },
	[45403700] = { npc=203079, name="Wandering Swordsman", class={ "WARRIOR" },
					spell={ "Blood Frenzy" }, guide={ st.warrior.bloodFrenzy } },
	[45806820] = { npc=5786, name="Snagglespear", class={ "WARRIOR" }, faction="Horde",
					spell={ "Furious Thunder" }, guide={ st.warrior.furiousThunder } },
	[46003460] = { name="Flatland Prowler/Taloned Swoop/Prairie Wolf Alpha", class={ "DRUID" },
					spell={ "Mangle" }, guide={ st.druid.ursineRage } },
	[4620606] = { npc=205635, name="Takoda Sunmane", class={ "HUNTER" }, spell={ "Carve" },
					guide={ st.hunter.carve } },
	[46406180] = { npc=207637, name="Vateya Timberhoof", class={ "WARRIOR" }, faction="Horde",
					spell={ "Devastate" }, guide={ st.warrior.devastate ..st.warrior.devastateVat }, },
	[46601020] = { name="Flatland Prowler/Taloned Swoop/Prairie Wolf Alpha", class={ "DRUID" },
					spell={ "Mangle" }, guide={ st.druid.ursineRage } },
	[46604220] = { npc=3068, name="Mazzranache", class={ "HUNTER" },
					spell={ "Explosive Shot" }, guide={ st.hunter.explosiveShot } },
	[46801760] = { npc=3058, name="Arra'chea", class={ "HUNTER", "WARRIOR" },
					spell={ "Explosive Shot", "Furious Thunder" },
					guide={ st.hunter.explosiveShot, st.warrior.furiousThunder } },
	[47002000] = { name="Flatland Prowler/Taloned Swoop/Prairie Wolf Alpha", class={ "DRUID" },
					spell={ "Mangle" }, guide={ st.druid.ursineRage } },
	[47407040] = { name="Palemane mobs (Various)", class={ "WARRIOR" }, faction="Horde",
					spell={ "Devastate" }, guide={ st.warrior.devastate ..st.warrior.devastateVat }, 
					tip="Severed Gnoll Head" },
	[47407220] = { npc=5786, name="Snagglespear", class={ "WARRIOR" }, faction="Horde",
					spell={ "Furious Thunder" }, guide={ st.warrior.furiousThunder } },
	[48001560] = { name="Flatland Prowler/Taloned Swoop/Prairie Wolf Alpha", class={ "DRUID" },
					spell={ "Mangle" }, guide={ st.druid.ursineRage } },
	[48207240] = { name="Palemane mobs (Various)", class={ "HUNTER" }, spell={ "Carve" },
					guide={ st.hunter.carve } },
	[48401980] = { npc=5807, name="The Rake", class={ "HUNTER", "WARRIOR" },
					spell={ "Explosive Shot", "Furious Thunder" },
					guide={ st.hunter.explosiveShot, st.warrior.furiousThunder } },
	[48607360] = { name="Palemane mobs (Various)", class={ "WARRIOR" }, faction="Horde",
					spell={ "Devastate" }, guide={ st.warrior.devastate ..st.warrior.devastateVat }, 
					tip="Severed Gnoll Head" },
	[48803340] = { name="Flatland Prowler/Taloned Swoop/Prairie Wolf Alpha", class={ "DRUID" },
					spell={ "Mangle" }, guide={ st.druid.ursineRage } },
	[49401360] = { npc=3058, name="Arra'chea", class={ "HUNTER", "WARRIOR" },
					spell={ "Explosive Shot", "Furious Thunder" },
					guide={ st.hunter.explosiveShot, st.warrior.furiousThunder } },
	[49600780] = { name="Flatland Prowler/Taloned Swoop/Prairie Wolf Alpha", class={ "DRUID" },
					spell={ "Mangle" }, guide={ st.druid.ursineRage } },
	[49601920] = { npc=3058, name="Arra'chea", class={ "HUNTER", "WARRIOR" },
					spell={ "Explosive Shot", "Furious Thunder" },
					guide={ st.hunter.explosiveShot, st.warrior.furiousThunder } },
	[49801580] = { npc=5807, name="The Rake", class={ "HUNTER", "WARRIOR" },
					spell={ "Explosive Shot", "Furious Thunder" },
					guide={ st.hunter.explosiveShot, st.warrior.furiousThunder } },
	[49802160] = { npc=5807, name="The Rake", class={ "HUNTER", "WARRIOR" },
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
	[51402620] = { npc=3058, name="Arra'chea", class={ "HUNTER", "WARRIOR" },
					spell={ "Explosive Shot", "Furious Thunder" },
					guide={ st.hunter.explosiveShot, st.warrior.furiousThunder } },
	[51603300] = { npc=3058, name="Arra'chea", class={ "HUNTER", "WARRIOR" },
					spell={ "Explosive Shot", "Furious Thunder" },
					guide={ st.hunter.explosiveShot, st.warrior.furiousThunder } },
	[51746717] = { item=206469, name="Prairie Flower", class={ "DRUID" }, faction="Horde",
					spell={ "Living Seed" }, tip="Various locations", guide={ st.druid.naturalPotential } },
	[51803920] = { npc=203079, name="Wandering Swordsman", class={ "WARRIOR" },
					spell={ "Blood Frenzy" }, guide={ st.warrior.bloodFrenzy } },
	[52001100] = { npc=3058, name="Arra'chea", class={ "HUNTER", "WARRIOR" },
					spell={ "Explosive Shot", "Furious Thunder" },
					guide={ st.hunter.explosiveShot, st.warrior.furiousThunder } },
	[52600540] = { name="Windfury Matriarch/Sorceress", class={ "DRUID" },
					spell={ "Mangle" }, guide={ st.druid.ursineRage } },
	[52607300] = { name="Palemane mobs (Various)", class={ "WARRIOR" }, faction="Horde",
					spell={ "Devastate" }, guide={ st.warrior.devastate ..st.warrior.devastateVat }, 
					tip="Severed Gnoll Head" },
	[53007400] = { npc=5786, name="Snagglespear", class={ "WARRIOR" }, faction="Horde",
					spell={ "Furious Thunder" }, guide={ st.warrior.furiousThunder } },
	[53402160] = { name="Flatland Prowler/Taloned Swoop/Prairie Wolf Alpha", class={ "DRUID" },
					spell={ "Mangle" }, guide={ st.druid.ursineRage } },
	[53004460] = { npc=3068, name="Mazzranache", class={ "HUNTER" },
					spell={ "Explosive Shot" }, guide={ st.hunter.explosiveShot } },
	[53480937] = { name="Windfury Cones", class={ "SHAMAN" }, faction="Horde",
					spell={ "Lava Lash" }, guide={ st.shaman.lavaLash }, quest={ { 76156, 76160, 76240 } },
					questName={ { "Stalk With The Earthmother", "Stalk With The Earthmother", "Stalk With The Earthmother" } },
					tip="Use Taraezor's \"Ground Clutter\" AddOn\nto smoothly toggle GC on/off FTW!" },
	[53602080] = { npc=5807, name="The Rake", class={ "HUNTER", "WARRIOR" },
					spell={ "Explosive Shot", "Furious Thunder" },
					guide={ st.hunter.explosiveShot, st.warrior.furiousThunder } },
	[53801380] = { npc=5785, name="Sister Hatelash", class={ "WARRIOR" }, faction="Horde",
					spell={ "Furious Thunder" }, guide={ st.warrior.furiousThunder } },
	[54001620] = { name="Flatland Prowler/Taloned Swoop/Prairie Wolf Alpha", class={ "DRUID" },
					spell={ "Mangle" }, guide={ st.druid.ursineRage } },
	[54403240] = { name="Flatland Prowler/Taloned Swoop/Prairie Wolf Alpha", class={ "DRUID" },
					spell={ "Mangle" }, guide={ st.druid.ursineRage } },
	[54601040] = { npc=5785, name="Sister Hatelash", class={ "WARRIOR" }, faction="Horde",
					spell={ "Furious Thunder" }, guide={ st.warrior.furiousThunder } },
	[54601540] = { npc=3058, name="Arra'chea", class={ "HUNTER", "WARRIOR" },
					spell={ "Explosive Shot", "Furious Thunder" },
					guide={ st.hunter.explosiveShot, st.warrior.furiousThunder } },
	[54801720] = { npc=5807, name="The Rake", class={ "HUNTER", "WARRIOR" },
					spell={ "Explosive Shot", "Furious Thunder" },
					guide={ st.hunter.explosiveShot, st.warrior.furiousThunder } },
	[55001100] = { npc=2965, name="Windfury Matriarch", class={ "WARRIOR" }, faction="Horde",
					spell={ "Devastate" }, guide={ st.warrior.devastate ..st.warrior.devastateVat }, tip="Severed Harpy Head" },
	[55002200] = { npc=3058, name="Arra'chea", class={ "HUNTER", "WARRIOR" },
					spell={ "Explosive Shot", "Furious Thunder" },
					guide={ st.hunter.explosiveShot, st.warrior.furiousThunder } },
	[55003280] = { npc=3058, name="Arra'chea", class={ "HUNTER", "WARRIOR" },
					spell={ "Explosive Shot", "Furious Thunder" },
					guide={ st.hunter.explosiveShot, st.warrior.furiousThunder } },
	[55407100] = { name="Palemane mobs (Various)", class={ "HUNTER" }, spell={ "Carve" },
					guide={ st.hunter.carve } },
	[55601160] = { npc=5785, name="Sister Hatelash", class={ "WARRIOR" }, faction="Horde",
					spell={ "Furious Thunder" }, guide={ st.warrior.furiousThunder } },
	[55602820] = { npc=3058, name="Arra'chea", class={ "HUNTER", "WARRIOR" },
					spell={ "Explosive Shot", "Furious Thunder" },
					guide={ st.hunter.explosiveShot, st.warrior.furiousThunder } },
	[55606980] = { npc=5786, name="Snagglespear", class={ "WARRIOR" }, faction="Horde",
					spell={ "Furious Thunder" }, guide={ st.warrior.furiousThunder } },
	[55807300] = { name="Palemane mobs (Various)", class={ "WARRIOR" }, faction="Horde",
					spell={ "Devastate" }, guide={ st.warrior.devastate ..st.warrior.devastateVat }, 
					tip="Severed Gnoll Head" },
	[56001500] = { npc=5785, name="Sister Hatelash", class={ "WARRIOR" }, faction="Horde",
					spell={ "Furious Thunder" }, guide={ st.warrior.furiousThunder } },
	[56201320] = { name="Windfury Matriarch/Sorceress", class={ "DRUID" },
					spell={ "Mangle" }, guide={ st.druid.ursineRage } },
	[56801740] = { name="Flatland Prowler/Taloned Swoop/Prairie Wolf Alpha", class={ "DRUID" },
					spell={ "Mangle" }, guide={ st.druid.ursineRage } },
	[57603360] = { name="Flatland Prowler/Taloned Swoop/Prairie Wolf Alpha", class={ "DRUID" },
					spell={ "Mangle" }, guide={ st.druid.ursineRage } },
	[58885118] = { item=206469, name="Prairie Flower", class={ "DRUID" }, faction="Horde",
					spell={ "Living Seed" }, tip="Various locations", guide={ st.druid.naturalPotential } },
	[59407820] = { npc=2953, name="Bristleback Shaman", class={ "SHAMAN" }, faction="Horde",
					faction="Horde",
					spell={ "Overload" }, quest={ 77652 }, questName={ "Icons of Power" }, guide={ st.shaman.dyadicIcon } },

	[59005460] = { npc=205692, name="Rustling Bush", class={ "HUNTER" }, faction="Horde",
					spell={ "Master Marksman" }, guide={ st.hunter.masterMark } },
	[59607520] = { npc=2953, name="Bristleback Shaman", class={ "SHAMAN" }, faction="Horde",
					faction="Horde",
					spell={ "Overload" }, quest={ 77652 }, questName={ "Icons of Power" }, guide={ st.shaman.dyadicIcon } },
	[60002000] = { npc=3232, name="Bristleback Interloper", class={ "DRUID" }, faction="Horde",
					spell={ "Mangle" }, guide={ st.druid.ursineRage } },
	[60206760] = { npc=203079, name="Wandering Swordsman", class={ "WARRIOR" },
					spell={ "Blood Frenzy" }, guide={ st.warrior.bloodFrenzy } },
	[60402260] = { npc=3232, name="Bristleback Interloper", class={ "DRUID" }, faction="Horde",
					spell={ "Mangle" }, guide={ st.druid.ursineRage } },
	[60403360] = { npc=204827, name="Adventurer's Remains", class={ "DRUID", "PALADIN", "PRIEST", "SHAMAN" }, faction="Horde",
																			 
					spell={ "Lifebloom", "Inspiration Exemplar", "Prayer of Mending", "Ancestral Guidance" }, guide={ st.woundedAdventurer  } },
	[60406380] = { name="Flatland Prowler/Taloned Swoop/Prairie Wolf Alpha", class={ "DRUID" },
					spell={ "Mangle" }, guide={ st.druid.ursineRage } },
	[60608020] = { npc=2954, name="Bristleback Battleboar", class={ "HUNTER" }, faction="Horde",
					spell={ "Chimera Shot" }, guide={ st.starterZoneClass },
					quest={ 77949 }, questName={ "A Hunter's Strength" } },
	[60802040] = { npc=3232, name="Bristleback Interloper", class={ "WARRIOR" }, faction="Horde",
					spell={ "Devastate" }, guide={ st.warrior.devastate ..st.warrior.devastateVat },
					tip="Severed Quillboar Head" },
	[61002300] = { npc=2965, name="Windfury Matriarch", class={ "WARRIOR" }, faction="Horde",
					spell={ "Devastate" }, guide={ st.warrior.devastate ..st.warrior.devastateVat },
					tip="Severed Harpy Head" },
	[61004700] = { item=206157, name="Seaforium Mining Charges", class={ "SHAMAN" }, faction="Horde",
					spell={ "Lava Lash" }, guide={ st.shaman.lavaLash }, quest={ { 76156, 76160, 76240 } },
					questName={ { "Stalk With The Earthmother", "Stalk With The Earthmother", "Stalk With The Earthmother" } },
					tip="\"It doesn't seem like much of a disguise...\"" },
	[61402200] = { npc=2965, name="Windfury Matriarch", class={ "WARRIOR" }, faction="Horde",
					spell={ "Devastate" }, guide={ st.warrior.devastate ..st.warrior.devastateVat },
					tip="Severed Harpy Head" },
	[61402740] = { name="Flatland Prowler/Taloned Swoop/Prairie Wolf Alpha", class={ "DRUID" },
					spell={ "Mangle" }, guide={ st.druid.ursineRage } },
	[61407060] = { name="Flatland Prowler/Taloned Swoop/Prairie Wolf Alpha", class={ "DRUID" },
					spell={ "Mangle" }, guide={ st.druid.ursineRage } },
	[61407580] = { npc=2953, name="Bristleback Shaman", class={ "SHAMAN" }, faction="Horde",
					faction="Horde",
					spell={ "Overload" }, quest={ 77652 }, questName={ "Icons of Power" }, guide={ st.shaman.dyadicIcon } },
	[61601940] = { npc=3232, name="Bristleback Interloper", class={ "DRUID" }, faction="Horde",
					spell={ "Mangle" }, guide={ st.druid.ursineRage } },
	[61602140] = { npc=3232, name="Bristleback Interloper", class={ "DRUID" }, faction="Horde",
					spell={ "Mangle" }, guide={ st.druid.ursineRage } },
	[61602320] = { name="Flatland Prowler/Taloned Swoop/Prairie Wolf Alpha", class={ "DRUID" },
					spell={ "Mangle" }, guide={ st.druid.ursineRage } },
	[61604780] = { npc=2979, name="Venture Co Supervisor", class={ "DRUID" }, faction="Horde",
					spell={ "Mangle" }, guide={ st.druid.ursineRage } },
	[61607200] = { name="Windfury mobs (Various)", class={ "WARRIOR" }, faction="Horde",
					spell={ "Devastate" }, guide={ st.warrior.devastate ..st.warrior.devastateVat }, tip="Severed Harpy Head" },
	[61607600] = { object=403102, name="Bristleback Loot Cache", class={ "DRUID", "WARRIOR" }, faction="Horde",
					spell={ "Fury of Stormrage", "Victory Rush" },
					guide={ st.druid.lunarIdolH, st.starterZoneClass }, tip="High up, no need for parkour!" },
	[62004220] = { npc=2979, name="Venture Co Supervisor", class={ "DRUID" }, faction="Horde",
					spell={ "Mangle" }, guide={ st.druid.ursineRage } },
	[62205960] = { name="Flatland Prowler/Taloned Swoop/Prairie Wolf Alpha", class={ "DRUID" },
					spell={ "Mangle" }, guide={ st.druid.ursineRage } },
	[63006700] = { name="Flatland Prowler/Taloned Swoop/Prairie Wolf Alpha", class={ "DRUID" },
					spell={ "Mangle" }, guide={ st.druid.ursineRage } },
	[63204440] = { npc=2979, name="Venture Co Supervisor", class={ "DRUID" }, faction="Horde",
					spell={ "Mangle" }, guide={ st.druid.ursineRage } },
	[63208260] = { npc=2953, name="Bristleback Shaman", class={ "SHAMAN" }, faction="Horde",
					faction="Horde",
					spell={ "Overload" }, quest={ 77652 }, questName={ "Icons of Power" }, guide={ st.shaman.dyadicIcon } },
	[63607640] = { npc=2953, name="Bristleback Shaman", class={ "SHAMAN" }, faction="Horde",
					faction="Horde",
					spell={ "Overload" }, quest={ 77652 }, questName={ "Icons of Power" }, guide={ st.shaman.dyadicIcon } },
	[63808100] = { npc=2953, name="Bristleback Shaman", class={ "SHAMAN" }, faction="Horde",
					faction="Horde",
					spell={ "Overload" }, quest={ 77652 }, questName={ "Icons of Power" }, guide={ st.shaman.dyadicIcon } },
	[64605960] = { name="Flatland Prowler/Taloned Swoop/Prairie Wolf Alpha", class={ "DRUID" },
					spell={ "Mangle" }, guide={ st.druid.ursineRage } },
	[66007780] = { npc=2953, name="Bristleback Shaman", class={ "SHAMAN" }, faction="Horde",
					faction="Horde",
					spell={ "Overload" }, quest={ 77652 }, questName={ "Icons of Power" }, guide={ st.shaman.dyadicIcon } },
	[67006600] = { name="Lightning Infused Totem", class={ "SHAMAN" }, faction="Horde",
					spell={ "Shield Mastery" }, guide={ st.shaman.galvanicIcon } },
	[67806920] = { name="Windfury mobs (Various)", class={ "WARRIOR" }, faction="Horde",
					spell={ "Devastate" }, guide={ st.warrior.devastate ..st.warrior.devastateVat }, tip="Severed Harpy Head" },
}
points[ 1454 ] = { -- Orgrimmar
	[38707840] = { item=409731, name="The Lessons of Ta'zo", class={ "MAGE" }, faction="Horde",
					spell={ "Icy Veins" }, guide={ st.mage.icyVeins },
					quest={ 79094 }, questName={ "The Lessons of Ta'zo" },
					tip="It's a large rock tablet with red writing, leaning against the wall.\n"
						.."Valley of Wisdom. On th eleft side as you approach the Mage trainers" },
	[51606460] = { npc=214070, name="Jornah", faction="Horde",
					class=st.allClass, spell=st.allSpellACA, guide={ st.supplyFaction } },
	[55904470] = { object=404830, name="Dusty Chest", class={ "ROGUE" }, faction="Horde",
					spell={ "Slaughter from the Shadows" }, guide={ st.rogue.precision },
					tip="The Drag, across from The\nValley of Honor archway" },
	[57004460] = { npc=208023, name="Gru'ark", class={ "WARRIOR" }, faction="Horde",
					spell={ "Frenzied Assault" },
					guide={ st.warrior.frenziedAssault },
					tip= "He'll be wandering around The Drag. Speak to\nZamja first if you haven't already done so" },
	[57605360] = { npc=3399, name="Zamja", class={ "WARRIOR" }, faction="Horde",
					spell={ "Frenzied Assault" },
					guide={ st.paladin.runeOfRebuke, st.warrior.frenziedAssault },
					tip="Speak to Zamja first, and then speak to Gru'ark,\nwho is wandering around The Drag" },
	[57605700] = { npc=208023, name="Gru'ark", class={ "WARRIOR" }, faction="Horde",
					spell={ "Frenzied Assault" },
					guide={ st.warrior.frenziedAssault },
					tip= "He'll be wandering around The Drag. Speak to\nZamja first if you haven't already done so" },
	[58605140] = { npc=208023, name="Gru'ark", class={ "WARRIOR" }, faction="Horde",
					spell={ "Frenzied Assault" },
					guide={ st.warrior.frenziedAssault },
					tip= "He'll be wandering around The Drag. Speak to\nZamja first if you haven't already done so" },
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
					spell={ "Icy Veins" }, guide={ st.mage.icyVeins },
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
points[ 1438 ] = { -- Teldrassil
	[33603560] = { npc=204827, name="Adventurer's Remains", class={ "DRUID", "PALADIN", "PRIEST", "SHAMAN" }, faction="Alliance",
					spell={ "Lifebloom", "Inspiration Exemplar", "Prayer of Mending", "Ancestral Guidance" }, guide={ st.woundedAdventurer  } },
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
					spell={ "Shared Pain", "Mutilate" }, guide={ st.priest.saviour, st.rogue.mutilate } },
	[52807200] = { name="Timberling mobs (Various)", faction="Alliance", class={ "ROGUE" }, tip="Pick Pocket or kill. Top-Right Map Piece",
					spell={ "Quick Draw" }, guide={ st.rogue.quickDraw ..st.rogue.quickDrawTel } },
	[52807880] = { object=404433, name="Lunar Chest", class={ "DRUID" }, faction="Alliance",
					spell={ "Sunfire" }, guide={ st.druid.runeOfTheSun } },
	[52807980] = { npc=207577, name="Lunar Stone", class={ "DRUID" }, faction="Alliance",
					spell={ "Sunfire" }, guide={ st.druid.runeOfTheSun } },
	[53805040] = { name="Sprite (Various)", faction="Alliance", class={ "ROGUE" }, tip="Pick Pocket or kill. Bottom-Left Map Piece",
					spell={ "Quick Draw" }, guide={ st.rogue.quickDraw ..st.rogue.quickDrawTel } },
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
	[56602600] = { npc=1994, name="Githyiss the Vile", class={ "HUNTER" }, faction="Alliance", tip="Chance of a 6 slot bag!",
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
	[58604060] = { npc=3596, name="Ayanna Everstride", class={ "HUNTER" }, faction="Alliance", tip="Inside Aldrassil. Ascend to the first level",
					quest={ 77568 }, questName={ "A Hunter's Strength" },
					spell={ "Chimera Shot" }, guide={ st.starterZoneClass } },
	[58703550] = { name="Moonwell", class={ "PRIEST" }, faction="Alliance",
					tip="/kneel and wait a bit",
					quest={ 77574 }, questName={ "Meditation on Elune" },
					spell={ "Penance" }, guide={ st.starterZoneClass } },
	[59184044] = { npc=3595, name="Shanda", class={ "PRIEST" }, faction="Alliance",
					tip="Inside Aldrassil. Go up the ramp to the first landing",
					quest={ 77574 }, questName={ "Meditation on Elune" },
					spell={ "Penance" }, guide={ st.starterZoneClass } },
	[59603860] = { npc=3593, name="Alyissia", class={ "WARRIOR" }, faction="Alliance",
					spell={ "Victory Rush" }, guide={ st.starterZoneClass }, quest={ 77575 },
					questName={ "Amidst the Shadowed Webs" } },
	[59643866] = { npc=3594, name="Frahun Shadewhisper", class={ "ROGUE" }, faction="Alliance",
					tip="Inside Aldrassil. At the rear from the entrance, on the \"ground\" level",
					quest={ 77573 }, questName={ "Second-Story Work" },
					spell={ "Shadowstrike" }, guide={ st.starterZoneClass } },
	[59704260] = { object=406006, name="Idol", class={ "ROGUE" }, faction="Alliance", tip="First roof, main building",
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
					spell={ "Icy Veins" }, guide={ st.mage.icyVeins },
					quest={ 78143 }, questName={ "Secrets of the Dreamers" },
					tip="Go to the same cavern with the Wailing Caverns\nentrance portal. The scroll is on the opposite side" },
	[48204020] = { name="Oasis Snapjaw Nest/Hatchling", class={ "DRUID" }, faction="Horde",
					spell={ "Lacerate" }, guide={ st.druid.lacerate } },
	[49205720] = { npc=6247, name="Doan Karhan", class={ "WARLOCK" },
					spell={ "Metamorphosis" }, guide={ st.warlock.metamorphosis },
					quest={ { 1740, 78680, 78681, 78684, 78702 } }, questName={ { "The Orb of Soran'ruk", "Rumors Abound",
						"The Conjuring", "The Mysterious Traveler", "Raszel Ander" } }, guide={ st.warlock.metamorphosis } },
	[52003100] = { object=208739, name="Horde Warbanner", class={ "WARRIOR" }, faction="Horde",
					spell={ "Endless Rage" }, guide={ st.warrior.endlessRage } },
	[54803580] = { npc=209742, name="Desert Mirage", class={ "SHAMAN" }, faction="Horde",
					spell={ "Way of Earth" }, guide={ st.shaman.earthenRune } },
	[55804220] = { name="Oasis Snapjaw Nest/Hatchling", class={ "DRUID" }, faction="Horde",
					spell={ "Lacerate" }, guide={ st.druid.lacerate } },
	[56200860] = { npc=3445, name="Supervisor Lugwizzle", class={ "WARLOCK" },
					spell={ "Shadow Bolt Volley" }, guide={ st.warlock.shadowbolts }, tip="Must use Drain Soul" },
	[56300880] = { object=409700, name="Manual", class={ "MAGE" },
					spell={ "Icy Veins" }, guide={ st.mage.icyVeins },
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
	[61803940] = { npc=211653, name="Grizzby", class=st.allClass, spell=st.allSpellG,
					guide={ st.grizzby }, quest={ { 78267, 78266, 78265 } },
					questName={ { "Shredder Turbochargers", "Dark Iron Ordinance", "Fish Oil" } } },
	[62604620] = { name="Southsea Mobs (Various)", class={ "ROGUE" },
					guide={ st.rogue.bladeDance }, spell={ "Blade Dance" },
					tip={ "Pp for Buccaneer's Matchbox. Now climb the\nhill nearby. Explode the gunpowder!" } },
	[62703630] = { object=211033, name="Goblin Tome", class={ "MAGE" },
					spell={ "Icy Veins" }, guide={ st.mage.icyVeins },
					quest={ 79097 }, questName={ "Baxtan: On Destructive Magics" },
					tip="Right next to Gazlove" },
	[62803820] = { npc=3497, name="Kilxx", class={ "HUNTER", "WARRIOR" }, faction="Horde",
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

points[ 1456 ] = { -- Thunder Bluff
	[27001880] = { npc=207754, name="Mooart", class={ "WARRIOR" }, faction="Horde",
					spell={ "Frenzied Assault" },
					guide={ st.warrior.frenziedAssault },
					tip= "He'll be wandering around The Spirit Rise. Speak to\nNetali first if you haven't already done so" },
	[28202220] = { npc=207754, name="Mooart", class={ "WARRIOR" }, faction="Horde",
					spell={ "Frenzied Assault" },
					guide={ st.warrior.frenziedAssault },
					tip= "He'll be wandering around The Spirit Rise. Speak to\nNetali first if you haven't already done so" },
	[28601860] = { npc=207743, name="Netali Proudwind", class={ "WARRIOR" }, faction="Horde",
					spell={ "Frenzied Assault" }, guide={ st.warrior.frenziedAssault },
					tip="Speak to Netali first, and then speak to Mooart,\nwho is wandering around The Spirit Rise" },
	[39606580] = { npc=205729, name="Boarton Shadetotem", class={ "SHAMAN" }, faction="Horde",
					spell={ "Lava Lash" }, guide={ st.shaman.lavaLash }, quest={ { 76156, 76160, 76240 } },
					questName={ { "Stalk With The Earthmother", "Stalk With The Earthmother", "Stalk With The Earthmother" } },
					tip="\"Hmm... perhaps disguises are not your strength\"" },
	[39805340] = { npc=214096, name="Dokimi", faction="Horde",
					class=st.allClass, spell=st.allSpellACA, guide={ st.supplyFaction } },
	[56004680] = { npc=3028, name="Kah Mistrunner", class={ "SHAMAN" }, faction="Horde",
					spell={ "Lava Lash" }, guide={ st.shaman.lavaLash }, quest={ { 76156, 76160, 76240 } },
					questName={ { "Stalk With The Earthmother", "Stalk With The Earthmother", "Stalk With The Earthmother" } },
					tip="If you need to learn fishing. You do of\ncourse use my Cod Do Batter fishing AddOn?" },
}


--=======================================================================================================
--
-- MISCELLANY
--
--=======================================================================================================

									
		  
			   
																										   
																												
																											   
																												
																					 
																								   
																												  
																							 
																								  
																													
					
			  
																											
																										  
																									   
																												  
																													
																						
																		   
																									
																						  
																			 
																  
																											  
								
																		  
																			   
																			 
															  
																													  
												   
																		   
																											  
				 
																							  
																												 
																											
								  
																											
																								 
						 
																				   
																			 
																								   
																										  
															   
				
																									   
																												   
																												  
																										 
																									
					 
																								
																	 
																										
																							 
																										   
																		   
				 
																										
																										  
																													
							   
																										
																											  
					 
																				  
																									
																						  
														  
																					  
																				
																  
																		
																								
																
																		  
																					
															 
																										
				 
																								
																								 
																							   
																									  
																											   
																										   
																						 
											 
																									
																								  
																								  
															   
																												
																										 
																			  
															   
																				   
											  
																				  
																				   
										
  
 

points[ 1414 ] = { -- Kalimdor
	[69005000] = "Quick Start"
}
points[ 1415 ] = { -- Eastern Kingdoms
	[69005000] = "Quick Start"
}
points[ 947 ] = { -- Azeroth
	[60003500] = "Quick Start"
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
ns.textures[15] = "Interface\\AddOns\\HandyNotes_Runes\\Adrenaline"
ns.textures[16] = "Interface\\AddOns\\HandyNotes_Runes\\Arcane"
ns.textures[17] = "Interface\\AddOns\\HandyNotes_Runes\\Demonic"
ns.textures[18] = "Interface\\AddOns\\HandyNotes_Runes\\Duty"

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

ns.texturesNum[1] = "Interface\\AddOns\\HandyNotes_Runes\\Textures\\1"
ns.texturesNum[2] = "Interface\\AddOns\\HandyNotes_Runes\\Textures\\2"
ns.texturesNum[3] = "Interface\\AddOns\\HandyNotes_Runes\\Textures\\3"
ns.texturesNum[4] = "Interface\\AddOns\\HandyNotes_Runes\\Textures\\4"
ns.texturesNum[5] = "Interface\\AddOns\\HandyNotes_Runes\\Textures\\5"
ns.texturesNum[6] = "Interface\\AddOns\\HandyNotes_Runes\\Textures\\6"
ns.texturesNum[7] = "Interface\\AddOns\\HandyNotes_Runes\\Textures\\7"
ns.texturesNum[8] = "Interface\\AddOns\\HandyNotes_Runes\\Textures\\8"
ns.texturesNum[9] = "Interface\\AddOns\\HandyNotes_Runes\\Textures\\9"
ns.texturesNum[10] = "Interface\\AddOns\\HandyNotes_Runes\\Textures\\10"
ns.texturesNum[11] = "Interface\\AddOns\\HandyNotes_Runes\\Textures\\11"
ns.texturesNum[12] = "Interface\\AddOns\\HandyNotes_Runes\\Textures\\12"
ns.scalingNum = 0.4