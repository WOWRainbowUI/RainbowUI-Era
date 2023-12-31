--Localization.zhTW.lua , by 楓之刃@米奈希爾 補充翻譯 by 三皈依@暗影之月

if ( GetLocale() == "zhTW" ) then

TomTomLocals = {
	["  /ttpaste help - This help message"] = "  /ttpaste help - This help message",
	["  /ttpaste list - List the titles of pages that have been saved"] = "  /ttpaste list - List the titles of pages that have been saved",
	["  /ttpaste load [title] - Load a saved page to the paste window"] = "  /ttpaste load [title] - Load a saved page to the paste window",
	["  /ttpaste remove [title] - Remove a saved page"] = "  /ttpaste remove [title] - Remove a saved page",
	["  /ttpaste save [title] - Save the current contents of the window with the given name"] = "  /ttpaste save [title] - Save the current contents of the window with the given name",
	["  /ttpaste toggle - Show/hide the paste window"] = "  /ttpaste toggle - Show/hide the paste window",
	["%d yards"] = "%d 碼",
	["%s (%.2f, %.2f)"] = "%s (%.2f, %.2f)",
	["%s: (map: %d, zone: %s, continent: %s, world: %s)"] = "%s: (地圖: %d, 區域: %s, 大陸: %s, 世界: %s)",
	["%s yards away"] = "%s 碼距離",
	["%s%s - %s %s %s %s"] = "%s%s - %s %s %s %s",
	["%s%s - %s (map: %d)"] = "%s%s - %s (地圖: %d)",
	["%s: (map: %d, zone: %s, continent: %s, world: %s)"] = "%s: (地圖: %d, 區域: %s, 大陸: %s, 世界: %s)",
	["%s: No coordinate information found for '%s' at this map level"] = "%s: 沒有 '%s' 的坐標資訊，在此地圖等級",
	["%sNo waypoints in this zone"] = "%s在此區域無導航目的地點",
	["Accept waypoints from guild and party members"] = "接受來自公會或團隊的導航目的地點",
	["Allow closest waypoint to be outside current zone"] = "允許跨越當前的區域指向最近的路徑",
	["Allow control-right clicking on map to create new waypoint"] = "允許使用右鍵點擊地圖來創建新的導航目的地點",
	["Allow the corpse arrow to override other waypoints"] = "允許屍體的箭頭覆蓋其他導航目的地點",
    ["Alpha"] = "透明度",
	["Announce new waypoints when they are added"] = "當新的導航目的地點加入時通報",
	["Are you sure you would like to remove ALL TomTom waypoints?"] = "是否確定要刪除所有 TomTom 導航目的地點?",
	["Arrow colors"] = "箭頭顏色",
	["Arrow display"] = "箭頭顯示",
	["Arrow locked"] = "鎖定箭頭",
	["Ask for confirmation on \"Remove All\""] = "\"全部刪除\" 時進行確認",
	["Automatically set a waypoint when I die"] = "當我死亡時自動設定一個導航目的地點",
	["Automatically set to next closest waypoint"] = "自動設定為最接近的導航目的地點",
	["Automatically set waypoint arrow"] = "自動設定導航箭頭",
	["Background color"] = "背景色",
	["Bad color"] = "錯誤顏色",
	["Block height"] = "模組高度",
	["Block width"] = "模組寬度",
	["Border color"] = "邊框顏色",
	["Channel to play the ping through"] = "播放音效的頻道",
	["Clear waypoint distance"] = "清空導航目的地點距離",
	["Clear waypoint from crazy arrow"] = "清除導航箭頭",
	["Controls the frequency of updates for the coordinate LDB feed."] = "控制LDB上坐標更新的頻率。",
	["Controls the frequency of updates for the coordinate block."] = "控制坐標模組更新的頻率。",
	["Controls the frequency of updates for the crazy arrow LDB feed."] = "控制LDB上瘋狂箭頭的更新頻率。",
	["Coordinate Accuracy"] ="坐標精確度",
	["Coordinate Block"] = "坐標模組",
	["Coordinate feed accuracy"] = "坐標供給精確度",
	["Coordinate feed throttle"] = "坐標供給頻率",
	["Coordinates can be displayed as simple XX, YY coordinate, or as more precise XX.XX, YY.YY.  This setting allows you to control that precision"] = "坐標可以顯示簡單的如 XX, YY 坐標, 或是更精確的 XX.XX, YY.YY. 這些設定允許你控制坐標精準度",
	["Coordinates can be slid from the default location, to accomodate other addons.  This setting allows you to control that offset"] = "可以從預設的位置來滑動坐標，以配合其他插件。這個設定允許你控制偏移位置。",
	["Could not find any matches for zone %s."] = "無法找到任何符合的區域 %s.",
	["Crazy Arrow feed throttle"] = "瘋狂箭頭供給頻率",
	["Create note modifier"] = "創建註記組合鍵",
	["Cursor Coordinates"] = "滑鼠坐標",
	["Cursor coordinate accuracy"] = "滑鼠坐標精確度",
	["Cursor coordinate offset"] = "滑鼠坐標偏移",
	["Cursor: ---"] = "座標: ---",
	["Cursor: %s"] = "座標: %s",
	["Data Feed Options"] = "數據供給選項",
	["Disable all mouse input"] = "禁用所有滑鼠輸入",
	["Disables the crazy taxi arrow for mouse input, allowing all clicks to pass through"] = "禁用瘋狂箭頭的滑鼠輸入, 允許所有點擊穿越",
	["Display Settings"] = "顯示設定",
	["Display waypoints from other zones"] = "顯示其他區域的導航目的地點",
	["Enable automatic quest objective waypoints"] = "啟用自動化任務目標導航目的地點",
	["Enable coordinate block"] = "啟用坐標模組",
	["Enable floating waypoint arrow"] = "啟用浮動導航箭頭",
	["Enable minimap waypoints"] = "啟用小地圖導航目的地點",
	["Enable mouseover tooltips"] = "啟用滑鼠提示",
	["Enable quest objective click integration"] = "啟用任務目標點擊整合",
	["Enable showing cursor coordinates"] = "啟用顯示滑鼠坐標",
	["Enable showing player coordinates"] = "啟用顯示玩家坐標",
	["Enable the right-click contextual menu"] = "啟用右鍵選單", --？
	["Enable world map waypoints"] = "啟用世界地圖導航目的地點",
	["Enables a floating block that displays your current position in the current zone"] = "啟用浮動的模組以顯示你在當前區域的當前位置",
	["Enables a menu when right-clicking on a waypoint allowing you to clear or remove waypoints"] = "當右鍵點擊一個導航目的地點時顯示功能表以清除或移動導航目的地點",
	["Enables a menu when right-clicking on the waypoint arrow allowing you to clear or remove waypoints"] = "當右鍵點擊導航箭頭時顯示功能表以清除或移動導航目的地點",
	["Enables the automatic setting of quest objective waypoints based on which objective is closest to your current location.  This setting WILL override the setting of manual waypoints."] = "啟用任務目標導航目的地點的自動化設定，基於哪個目標最靠近你當前的位置，此設定將覆蓋手動導航目的地點的設定.",
	["Enables the setting of waypoints when modified-clicking on quest objectives"] = "啟用當組合鍵點擊任務目標時的導航目的地點設定",
	["Exact color"] = "精確顏色",
	["Font size"] = "字體大小",
	["Found %d possible matches for zone %s.  Please be more specific"] = "找到 %d 可能符合的區域 %s，請進一步指定",
	["Found multiple matches for zone '%s'.  Did you mean: %s"] = "找到多重符合區域 '%s'，是否是指: %s ?",
	["From: %s"] = "來自: %s",
	["General Options"] = "綜合選項",
	["Good color"] = "正確顏色",
	["Hide the crazy arrow display during pet battles"] = "當寵物戰鬥中隱藏瘋狂箭頭",
	["Icon Control"] = "圖示控制",
	["If you have changed the waypoint display settings (minimap, world), this will re-set all waypoints to the current options."] = "如果你已經更改導航目的地點的顯示設定 (小地圖、世界地圖)，此選項會將全部的導航目的地點重置為目前的選項。",
	["If your arrow is covered up by something else, try this to bump it up a layer."] = "如果你的箭頭被其他東西遮住，請使用此選項將箭頭的圖層拉高。",
	["Loaded %d characters from page '%s'"] = "Loaded %d characters from page '%s'",
	["Lock coordinate block"] = "鎖定坐標模組",
	["Lock waypoint arrow"] = "鎖定導航箭頭",
	["Locks the coordinate block so it can't be accidentally dragged to another location"] = "鎖定坐標模組以防止意外拖動",
	["Locks the waypoint arrow, so it can't be moved accidentally"] = "鎖定導航箭頭，防止意外拖動",
	["Middle color"] = "中間顏色",
	["Minimap"] = "小地圖",
	["Minimap Icon"] = "小地圖圖示",
	["Minimap Icon Size"] = "小地圖圖示大小",
	["Must specify a page title to load"] = "Must specify a page title to load",
	["Must specify a page title to remove"] = "Must specify a page title to remove",
	["Must specify page name"] = "Must specify page name",
	["My Corpse"] = "我的屍體",
	["New Gold Blue Dot"] = "新金藍點",
	["New Gold Green Dot"] = "新金綠點",
	["New Gold Purple Dot"] = "新金紫點",
	["New Gold Red Dot"] = "新金紅點",
	["New Purple Ring"] = "新紫環",
	["No"] = "否",
	["No contents to save"] = "No contents to save",
	["No page found with title '%s'"] = "No page found with title '%s'",
	["No pages saved"] = "No pages saved",
	["Normally when TomTom sets the closest waypoint it chooses the waypoint in your current zone. This option will cause TomTom to search for any waypoints on your current continent. This may lead you outside your current zone, so it is disabled by default."] = "通常，當TomTom設置最接近的路徑點時，它將選擇當前區域中的路徑點。 此選項將使TomTom搜索您當前大陸上的所有路標。 這可能會導致您超出當前區域，因此預設情況下它被禁用。",
	["Old Gold Green Dot"] = "舊金綠點",
	["Options profile"] = "設定檔",
	["Options that alter quest objective integration"] = "變更任務目標整合的選項",
	["Options that alter the coordinate block"] = "變更坐標模組的選項",
	["Place the arrow in the HIGH strata"] = "將箭頭放置在較高的圖層層級 (HIGH)",
	["Play a sound when arriving at a waypoint"] = "當到達導航目的地點時播放一個音效",
	["Player Coordinates"] = "玩家坐標",
	["Player coordinate accuracy"] = "玩家坐標精確度",
	["Player coordinate offset"] = "玩家坐標偏移",
	["Player: ---"] =  "玩家: ---",
	["Player: %s"] = "玩家: %s",
	["Profile Options"] = "設定檔選項",
	["Prompt before accepting sent waypoints"] = "發送，接受導航目的地點前進行提示",
	["Provide a LDB data source for coordinates"] = "提供LDB坐標數據來源",
	["Provide a LDB data source for the crazy-arrow"] = "提供LDB瘋狂箭頭數據來源",
	["Quest Objectives"] = "任務目標",
	["Remove all waypoints"] = "刪除全部導航目的地點",
	["Remove all waypoints from this zone"] = "刪除本區域的全部導航目的地點",
	["Remove waypoint"] = "刪除導航目的地點",
	["Removed %d characters from page '%s'"] = "Removed %d characters from page '%s'",
	["Removed %d waypoints from %s"] = "移除 %d 的導航目的地點從 %s",
	["Reset Position"] = "重設位置",
	["Reset waypoint display options to current"] = "導航目的地點的顯示選項重置為當前設定",
	["Resets the position of the waypoint arrow if its been dragged off screen"] = "重設的導航箭頭的位置，如果它被拖離螢幕",
	["Save new waypoints until I remove them"] = "保存新的導航目的地點直到刪除他們",
	["Save profile for TomTom waypoints"] = "儲存 TomTom 導航目的地點設定檔",
	["Save this waypoint between sessions"] = "儲存這個導航目的地點以便在重新登入後可以使用",
	["Saved %d characters to page '%s'"] = "Saved %d characters to page '%s'",
	["Saved pages: %s"] = "Saved pages: %s",
	["Saved profile for TomTom options"] = "儲存 TomTom 選項的設定檔",
	["Scale"] = "比例",
	["Send to battleground"] = "發送到戰場",
	["Send to guild"] = "發送到公會",
	["Send to party"] = "發送到隊伍",
	["Send to raid"] = "發送到團隊",
	["Send waypoint to"] = "發送導航目的地點到",
	["Set as waypoint arrow"] = "設定為導航箭頭",
	["Show estimated time to arrival"] = "顯示估計的到達時間 ",
	["Show the distance to the waypoint"] = "顯示導航目的地點的距離",
	["Shows an estimate of how long it will take you to reach the waypoint at your current speed"] = "顯示以你當前的速度需要多長時間到達導航目的地點",
	["Shows the distance (in yards) to the waypoint"] = "顯示到導航目的地點之間的距離(以碼計)",
	["The color to be displayed when you are halfway between the direction of the active waypoint and the completely wrong direction"] = "當你界於正確與錯誤的導航目的地點方向之間時顯示的顏色",
	["The color to be displayed when you are moving in the direction of the active waypoint"] = "當你朝向導航目的地點方向時顯示的顏色",
	["The color to be displayed when you are moving in the exact direction of the active waypoint"] = "當你精確的朝向導航目的地點方向時顯示的顏色",
	["The color to be displayed when you are moving in the opposite direction of the active waypoint"] = "當你反方向導航目的地點是顯示的顏色",
	["The display of the coordinate block can be customized by changing the options below."] = "通過改變以下選項可以自定義坐標模組顯示.",
	["The floating waypoint arrow can change color depending on whether or nor you are facing your destination.  By default it will display green when you are facing it directly, and red when you are facing away from it.  These colors can be changed in this section.  Setting these options to the same color will cause the arrow to not change color at all"] = "浮動的導航箭頭是否改變顏色取決於你所面對的你的目的地. 默認情況下，你面對它,箭頭會顯示綠色；當你反方向的話箭頭會顯示紅色。這些顏色可以在這裏進行設定。如果設定為相同的顏色， 會導致箭頭在所有狀態下不改變顏色",
	["There were no waypoints to remove in %s"] = " %s 沒有導航目的地點被刪除",
	["These options let you customize the size and opacity of the waypoint arrow, making it larger or partially transparent, as well as limiting the size of the title display."] = "這些選項可以使你自定義導航箭頭的比例尺寸和透明度,同時可以設定標題顯示的極限尺寸.",
	["This option will not remove any waypoints that are currently set to persist, but only effects new waypoints that get set"] = "這些選項不會移除任何目前保留的路徑, 只影響新設定的路徑",
	["This option will toggle whether or not you are asked to confirm removing all waypoints.  If enabled, a dialog box will appear, requiring you to confirm removing the waypoints"] = "這個選項將切換設定當刪除所有導航目的地點時是否進行詢問.  如果起用, 將顯示一個對話方塊, 以使你確認刪除導航目的地點",
	["This setting allows you to change the opacity of the title text, making it transparent or opaque"] = "這個設定可以改變標題文字的透明度, 使之透明或不透明",
	["This setting allows you to change the opacity of the waypoint arrow, making it transparent or opaque"] = "這個設定可以改變導航箭頭的透明度, 使之透明或不透明",
	["This setting allows you to change the scale of the waypoint arrow, making it larger or smaller"] = "這個設定可以改變導航箭頭的比例尺寸, 使之變大或變小",
	["This setting allows you to control the default size of the minimap icon. "] = "This setting allows you to control the default size of the minimap icon. ",
	["This setting allows you to control the default size of the world map icon"] = "這個設定可以控制置世界地圖圖示的預設大小",
	["This setting allows you to select the default icon for the minimap"] = "這個設定可以選擇小地圖的預設圖示",
	["This setting allows you to select the default icon for the world map"] = "這個設定可以選擇世界地圖的預設圖示",
	["This setting allows you to specify the maximum height of the title text.  Any titles that are longer than this height (in game pixels) will be truncated."] = "這個設定可以詳細設定標題文本的最大高度.  任何標題如果大於此高度(遊戲內圖元)將被刪減.",
	["This setting allows you to specify the maximum width of the title text.  Any titles that are longer than this width (in game pixels) will be wrapped to the next line."] = "這個設定可以詳細設定標題文本的最大寬度. 任何標題如果大於此高度(遊戲內圖元)將進行換行處理.",
	["This setting allows you to specify the scale of the title text."] = "這個設定可以指定標題文字的比例.",
	["This setting changes the modifier used by TomTom when right-clicking on a quest objective POI to create a waypoint"] = "這個設定用來更改在任務目標上右鍵的組合鍵以用來創建一個Tomtom導航目的地點",
	["This setting changes the modifier used by TomTom when right-clicking on the world map to create a waypoint"] = "這個設定用來更改在世界地圖上右鍵的組合鍵以用來創建一個Tomtom導航目的地點",
	["This setting will control the distance at which the waypoint arrow switches to a downwards arrow, indicating you have arrived at your destination"] = "這個設定可以設定多少距離時導航箭頭變換為向下,以指示你已經到達目的地",
	["Title Alpha"] = "標題透明度",
	["Title Height"] = "標題高度",
	["Title Scale"] = "標題比例",
	["Title Width"] = "標題寬度",
	["TomTom Waypoint Arrow"] = "TomTom 導航箭頭",
	["TomTom can announce new waypoints to the default chat frame when they are added"] = "當新的導航目的地點加入時，TomTom會通報到聊天視窗",
	["TomTom can automatically set a waypoint when you die, guiding you back to your corpse"] = "在你死亡時TomTom可以自動加入導航目的地點，引導你回到你的屍體.",
	["TomTom can be configured to set waypoints for the quest objectives that are shown in the watch frame and on the world map.  These options can be used to configure these options."] = "TomTom 可以被配置與設定顯示在任務追蹤和世界地圖的任務目標導航目的地點. 這些選項可以用來設定相關的選項。",
	["TomTom can display a tooltip containing information abouto waypoints, when they are moused over.  This setting toggles that functionality"] = "當滑鼠指向導航目的地點時,TomTom 可以顯示包含本導航目的地點資訊的滑鼠提示. 這個設定可以切換本功能",
	["TomTom can display multiple waypoint arrows on the minimap.  These options control the display of these waypoints"] = "TomTom 可以在小地圖上顯示多重導航箭頭.  這些選項可以控制這些導航目的地點的顯示",
	["TomTom can display multiple waypoints on the world map.  These options control the display of these waypoints"] = "TomTom 可以在世界地圖上顯示多重導航目的地點.  這些選項可以控制這些導航目的地點的顯示",
	["TomTom can hide waypoints in other zones, this setting toggles that functionality"] = "TomTom 可以隱藏其他地區的導航目的地點, 這個設定可以切換本功能",
	["TomTom is capable of providing data sources via LibDataBroker, which allows them to be displayed in any LDB compatible display.  These options enable or disable the individual feeds, but will only take effect after a reboot."] = "TomTom能夠通過LibDataBroker提供數據源，從而允許它們在任何LDB相容顯示插件中顯示。 這些選項啟用或禁用各個提供數據，但僅在重新啟動後才生效。",
	["TomTom provides an arrow that can be placed anywhere on the screen.  Similar to the arrow in \"Crazy Taxi\" it will point you towards your next waypoint"] = "TomTom 提供了一個可以放在螢幕任何地方的箭頭.  類似 \"瘋狂巴士\" 箭頭,他將指引你到達下個導航目的地點",
	["TomTom provides you with a floating coordinate display that can be used to determine your current position.  These options can be used to enable or disable this display, or customize the block's display."] = "TomTom 提供了一個浮動的坐標模組,可以顯示你當前的位置坐標. 這些選項可以設定該模組的開關, 或自定義模組的顯示.",
	["TomTom waypoint"] = "TomTom 導航目的地點",
	["TomTom's saved variables are organized so you can have shared options across all your characters, while having different sets of waypoints for each.  These options sections allow you to change the saved variable configurations so you can set up per-character options, or even share waypoints between characters"] = "TomTom 的保存函數是有條理的,所以你可以在你的角色間共用選項, 同時可對每個導航目的地點進行不同的設定.  這些選項部分可以改變保存函數結構所以你可以設定每個角色的選項,乃至在角色之間分配導航目的地點.",
	["Unknown distance"] = "未知的距離",
	["Unknown waypoint"] = "未知的路徑",
	["Unnamed Map"] = "未命名的地圖",
	["Update throttle"] = "更新頻率",
	["Usage: /ttpaste [command]"] = "Usage: /ttpaste [command]",
	["Wayback"] = "回頭路",
	["Waypoint Arrow"] = "導航箭頭",
	["Waypoint Options"] = "導航目的地點選項",
	["Waypoint communication"] = "導航目的地點訊息",
	["Waypoint from %s"] = "導航目的地點於 %s",
	["Waypoints can be automatically cleared when you reach them.  This slider allows you to customize the distance in yards that signals your \"arrival\" at the waypoint.  A setting of 0 turns off the auto-clearing feature\n\nChanging this setting only takes effect after reloading your interface."] = "當你到達導航目的地點時插件會自動清除這些導航目的地點.本項設定可以自定義還有多少碼距離到達你的導航目的地點. 當設定為0時關閉自動清除功能\n\n重載介面就可使設定生效.",
	["Waypoints profile"] = "導航目的地點設定檔",
	["When a 'ping' is played, use the indicated sound channel so the volume can be controlled."] = "播放音效時，使用指定的頻道以便控制音量。",
	["When a new waypoint is added, TomTom can automatically set the new waypoint as the \"Crazy Arrow\" waypoint."] = "當一個新的導航目的地點被添加後, TomTom 可以自動的設定這個新的導航目的地點為 \"瘋狂箭頭\" 模式.",
	["When a pet battle begins, the crazy arrow will be hidden from view. When you exit the pet battle, it will be re-shown."] = "當寵物戰鬥開始的時候, 瘋狂箭頭將會隱藏. 當你離開寵物戰鬥, 它會重新顯示.",
	["When the current waypoint is cleared (either by the user or automatically) and this option is set, TomTom will automatically set the closest waypoint in the current zone as active waypoint."] = "When the current waypoint is cleared (either by the user or automatically) and this option is set, TomTom will automatically set the closest waypoint in the current zone as active waypoint.",
	["When the player is dead and has a waypoint towards their corpse, it will prevent other waypoints from changing the crazy arrow"] = "當玩家死亡時會有個路徑指引他的屍體, 這選項將防止其他導航目的地點影響此箭頭的方向",
	["When you 'arrive' at a waypoint (this distance is controlled by the 'Arrival Distance' setting in this group) a sound can be played to indicate this.  You can enable or disable this sound using this setting."] = "When you 'arrive' at a waypoint (this distance is controlled by the 'Arrival Distance' setting in this group) a sound can be played to indicate this.  You can enable or disable this sound using this setting.",
	["World Map"] = "世界地圖",
	["World Map Icon"] = "世界地圖圖示",
	["World Map Icon Size"] = "世界地圖圖示大小",
	["Yes"] = "是",
	["You are at (%s) in '%s' (map: %d, floor: %d)"] = "你目前在'%s'中的(%s) (地圖: %d, 地層: %d)",
	["\"Arrival Distance\""] = "\"到達距離\"",
	["is"] = "是",
	["list"] = "列出",
	["load"] = "載入",
	["not"] = "不是",
	["remove"] = "移除",
	["save"] = "儲存",
	["set waypoint modifier"] = "設定導航目的地點組合鍵",
	["toggle"] = "toggle",
	["|cffffff78/cway |r - Activate the closest waypoint"] = "|cffffff78/cway |r - 啟用最近的導航目的地點",
	["|cffffff78/tomtom |r - Open the TomTom options panel"] = "|cffffff78/tomtom |r - 打開 TomTom 設定選項",
	["|cffffff78/way /tway /tomtomway |r - Commands to set a waypoint: one should work."] = "|cffffff78/way /tway /tomtomway |r - 設定導航目的地點的指令: 使用其中一種即可。",
	["|cffffff78/way <x> <y> [desc]|r - Adds a waypoint at x,y with descrtiption desc"] = "|cffffff78/way <x> <y> [注釋]|r - 於X，Y坐標處添加一導航目的地點並添加注釋描述",
	["|cffffff78/way <zone> <x> <y> [desc]|r - Adds a waypoint at x,y in zone with description desc"] = "|cffffff78/way <地區> <x> <y> [注釋]|r - 于本地區的X，Y坐標處添加一導航目的地點並添加注釋描述",
	["|cffffff78/way arrow|r - Prints status of the Crazy Arrow"] = "|cffffff78/way arrow|r - 顯示導航箭頭的狀態",
	["|cffffff78/way block|r - Prints status of the Coordinate Block"] = "|cffffff78/way block|r - 顯示坐標區塊的狀態",
	["|cffffff78/way list|r - Lists all active waypoints"] = "|cffffff78/way list|r - 列出所有啟用的導航目的地點",
	["|cffffff78/way local|r - Lists active waypoints in current zone"] = "|cffffff78/way local|r - 列出當前區域啟用的導航目的地點",
	["|cffffff78/way reset <zone>|r - Resets all waypoints in zone"] = "|cffffff78/way reset <地區>|r - 重置區域中所有導航目的地點",
	["|cffffff78/way reset all|r - Resets all waypoints"] = "|cffffff78/way reset all|r - 重置所有導航目的地點",
	["|cffffff78TomTom |r/way |cffffff78Usage:|r"] = "|cffffff78TomTom |r/way |cffffff78Usage:|r",
	["|cffffff78/way reset away|r - Resets all waypoints not in current zone"] = "|cffffff78/way reset away|r - 重置所有不是當前區域的導航目的地點",
	["|cffffff78/way reset not <zone>|r - Resets all waypoints not in zone"] = "|cffffff78/way reset not <zone>|r - 重置所有不在區域中的導航目的地點",
	["|cffffff78/wayb [desc] |r - Save the current position with optional description"] = "|cffffff78/wayb [desc] |r - Save the current position with optional description",
	["|cffffff78TomTom |r/way /tway /tomtomway /cway /wayb /wayback/tomtom |cffffff78Usage:|r"] = "|cffffff78TomTom |r/way /tway /tomtomway /cway /wayb /wayback/tomtom |cffffff78用法:|r",
	["|cffffff78TomTom:|r Added a waypoint (%s%s%s) in %s"] = "|cffffff78TomTom:|r 增加一個導航目的地點 (%s%s%s)在%s",
	["|cffffff78TomTom:|r CoordBlock %s visible"] = "|cffffff78TomTom:|r 坐標區塊 %s 已顯示",
	["|cffffff78TomTom:|r Could not find a closest waypoint in this continent."] = "|cffffff78TomTom:|r 在這個大陸中無法找到最近的導航目的地點。",
	["|cffffff78TomTom:|r Could not find a closest waypoint in this zone."] = "|cffffff78TomTom:|r 在這個區域中無法找到最近的導航目的地點。",
	["|cffffff78TomTom:|r CrazyArrow %s hijacked"] = "|cffffff78TomTom:|r 導航箭頭 %s 被劫持",
	["|cffffff78TomTom:|r CrazyArrow %s visible"] = "|cffffff78TomTom:|r 導航箭頭 %s 已顯示",
	["|cffffff78TomTom:|r Selected waypoint (%s%s%s) in %s"] = "|cffffff78TomTom:|r 已選擇導航目的地點 (%s%s%s) 在 %s",
	["|cffffff78TomTom:|r Waypoint %s valid"] = "|cffffff78TomTom:|r 導航目的地點 %s 無效",
	["|cffffff78TomTom|r: Added '%s' (sent from %s) to zone %s"] = "|cffffff78TomTom|r: 增加 '%s' (發送自 %s) 到區域%s",
	["Old Gold Green Dot"] = "舊的金綠色點",
	["New Gold Blue Dot"] = "新的金藍色點",
	["New Gold Green Dot"] = "新的金綠色點",
	["New Gold Purple Dot"] = "新的金紫色點",
	["New Gold Red Dot"] = "新的金紅色點",
	["New Purple Ring"] = "新的紫色圓圈",
	["Player: ---"] = "玩家: ---",
	["Player: %s"] = "玩家: %s",
	["Cursor: ---"] = "游標: ---",
	["Cursor: %s"] = "游標: %s",

	-- 自行加入
	["TomTom"] = "導航箭頭",
	["TomTom "] = "TomTom 導航箭頭",
	
}

setmetatable(TomTomLocals, {__index=function(t,k) rawset(t, k, k); return k; end})

end
