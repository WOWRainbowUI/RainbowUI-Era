local _, MySlot = ...

local L = setmetatable({}, {
    __index = function(table, key)
        if key then
            table[key] = tostring(key)
        end
        return tostring(key)
    end,
})


MySlot.L = L

--
-- Use http://www.wowace.com/addons/myslot/localization/ to translate thanks
-- 
local locale = GetLocale()

if locale == 'enUs' then
L["[WARN] Ignore slot due to an unknown error DEBUG INFO = [S=%s T=%s I=%s] Please send Importing Text and DEBUG INFO to %s"] = true
L["[WARN] Ignore unsupported Key Binding [ %s ] , contact %s please"] = true
L["[WARN] Ignore unsupported Slot Type [ %s ] , contact %s please"] = true
L["All slots were restored"] = true
L["Are you SURE to delete '%s'?"] = true
L["Are you SURE to import ?"] = true
L["Bad importing text [CRC32]"] = true
L["Bad importing text [TEXT]"] = true
L["Clear Action before applying"] = true
L["Clear Binding before applying"] = true
L["Clear Macro before applying"] = true
L["Close"] = true
L["DANGEROUS"] = true
L["Export"] = true
L["Feedback"] = true
L["Force Import"] = true
L["Ignore Import/Export Action"] = true
L["Ignore Import/Export Key Binding"] = true
L["Ignore Import/Export Macro"] = true
L["Ignore unattained pet[id=%s], %s"] = true
L["Ignore unlearned skill [id=%s], %s"] = true
L["Import"] = true
L["Import is not allowed when you are in combat"] = true
L["Importing text [ver:%s] is not compatible with current version"] = true
L["Macro %s was ignored, check if there is enough space to create"] = true
L["Minimap Icon"] = true
L["Myslot"] = true
L["Name of exported text"] = true
L["Open Myslot"] = true
L["Please type %s to confirm"] = true
L["Remove all Key Bindings"] = true
L["Remove all Macros"] = true
L["Remove everything in ActionBar"] = true
L["Rename"] = true
L["Skip bad CRC32"] = true
L["Skip CRC32, version and any other validation before importing. May cause unknown behavior"] = true
L["Skip unsupported version"] = true
L["Time"] = true
L["TOC_NOTES"] = "Myslot is for transferring settings between accounts. Feedback farmer1992@gmail.com"
L["Try force importing"] = true
L["Unsaved"] = true
L["Use random mount instead of an unattained mount"] = true

elseif locale == 'zhCN' then
L["[WARN] Ignore slot due to an unknown error DEBUG INFO = [S=%s T=%s I=%s] Please send Importing Text and DEBUG INFO to %s"] = "[WARN] 忽略出错技能 DEBUG INFO = [S=%s T=%s I=%s] 请将出错的字符和 DEBUG INFO 发给作者 %s"
L["[WARN] Ignore unsupported Key Binding [ %s ] , contact %s please"] = "[WARN] 忽略不支持的按键绑定 [ %s ]，请通知作者 %s"
L["[WARN] Ignore unsupported Slot Type [ %s ] , contact %s please"] = "[WARN] 忽略不支持的按键类型 [ %s ]，请通知作者 %s"
L["All slots were restored"] = "所有按钮及按键邦定位置恢复完毕"
L["Are you SURE to delete '%s'?"] = "确定要删除 '%s'"
L["Are you SURE to import ?"] = "你确定要导入吗?"
L["Bad importing text [CRC32]"] = "导入文本校验不合法 [CRC32] 通常是没有复制完全"
L["Bad importing text [TEXT]"] = "导入文本校验不合法 [TEXT]"
L["Clear Action before applying"] = "导入前清空技能摆放"
L["Clear Binding before applying"] = "导入前清空快捷键"
L["Clear Macro before applying"] = "导入前清空宏"
L["Close"] = "关闭"
L["DANGEROUS"] = "危险行为"
L["Export"] = "导出"
L["Feedback"] = "问题/建议"
L["Force Import"] = "强制导入"
L["Ignore Import/Export Action"] = "导入/导出时忽略技能摆放"
L["Ignore Import/Export Key Binding"] = "导入/导出时忽略快捷键"
L["Ignore Import/Export Macro"] = "导入/导出时忽略宏"
L["Ignore unattained pet[id=%s], %s"] = "忽略未开启的战斗宠物[id=%s]：%s"
L["Ignore unlearned skill [id=%s], %s"] = "忽略未掌握技能[id=%s]：%s"
L["Import"] = "导入"
L["Import is not allowed when you are in combat"] = "请在非战斗时候使用导入功能"
L["Importing text [ver:%s] is not compatible with current version"] = "导入文本 [ver:%s] 不兼容当前版本"
L["Macro %s was ignored, check if there is enough space to create"] = "宏 [ %s ] 被忽略，请检查是否有足够的空格创建宏"
L["Minimap Icon"] = "小地图图标"
L["Myslot"] = "Myslot"
L["Name of exported text"] = "导出文本的名字"
L["Open Myslot"] = "打开 Myslot"
L["Please type %s to confirm"] = "请输入 %s 来确认删除"
L["Remove all Key Bindings"] = "删除所有快捷键"
L["Remove all Macros"] = "删除所有宏"
L["Remove everything in ActionBar"] = "清空全部按键摆放"
L["Rename"] = "重命名"
L["Skip bad CRC32"] = "忽略CRC32错误"
L["Skip CRC32, version and any other validation before importing. May cause unknown behavior"] = "忽略CRC32，版本等检查。可能导致未知错误"
L["Skip unsupported version"] = "忽略不兼容的版本"
L["Time"] = "时间"
L["TOC_NOTES"] = "Myslot可以帮助你在账号之间共享配置。反馈：farmer1992@gmail.com"
L["Try force importing"] = "尝试强制导入"
L["Unsaved"] = "未保存"
L["Use random mount instead of an unattained mount"] = "使用随机坐骑代替没有获得的坐骑"

elseif locale == 'zhTW' then
L["[WARN] Ignore slot due to an unknown error DEBUG INFO = [S=%s T=%s I=%s] Please send Importing Text and DEBUG INFO to %s"] = "[WARN] 忽略出錯的欄位：DEBUG INFO = [S=%s T=%s I=%s] 請將出錯的字串與DEBUG INFO發給作者 %s。"
L["[WARN] Ignore unsupported Key Binding [ %s ] , contact %s please"] = "[WARN] 忽略不支援的按鍵設置：K = [ %s ] ，請通知作者 %s"
L["[WARN] Ignore unsupported Slot Type [ %s ] , contact %s please"] = "[WARN] 忽略不支援的欄位設置：K = [ %s ] ，請通知作者 %s"
L["All slots were restored"] = "所有按鍵設定都已恢復完畢"
L["Are you SURE to delete '%s'?"] = "你確定要刪除 %s 嗎？" 
L["Are you SURE to import ?"] = "你確定要匯入嗎?"
L["Bad importing text [CRC32]"] = "錯誤的匯入字串[CRC32]"
L["Bad importing text [TEXT]"] = "錯誤的匯入字串[TEXT]"
L["Clear Action before applying"] = "套用後刪除技能"
L["Clear Binding before applying"] = "套用後刪除按鍵設定" 
L["Clear Macro before applying"] = "套用後刪除巨集" 
L["Close"] = "關閉"
L["DANGEROUS"] = "危險"
L["Export"] = "匯出"
L["Feedback"] = "反饋"
L["Force Import"] = "強制匯入"
L["Ignore Import/Export Action"] = "忽略匯入/匯出技能"
L["Ignore Import/Export Key Binding"] = "忽略匯入/匯出按鍵綁定"
L["Ignore Import/Export Macro"] = "忽略匯入/匯出巨集"
L["Ignore unattained pet[id=%s], %s"] = "忽略沒有的寵物 [id=%s]：%s"
L["Ignore unlearned skill [id=%s], %s"] = "忽略未習得技能 [id=%s], %s"
L["Import"] = "匯入"
L["Import is not allowed when you are in combat"] = "請在非戰鬥狀態時使用匯入功能"
L["Importing text [ver:%s] is not compatible with current version"] = "匯入的字串版本與當前版本不相容。(字串版本號：%s)"
L["Macro %s was ignored, check if there is enough space to create"] = "忽略巨集 [%s] ，請檢查是否有足夠的欄位創建新巨集"
L["Minimap Icon"] = "小地圖按紐" 
L["My-slot"] = "快捷列-切換"
L["Myslot"] = "快速切換快捷列"
L["Name of exported text"] = "匯出文本名"
L["Open Myslot"] = "開啟主視窗"
L["Please type %s to confirm"] = "請輸入 %s 以進行確認"
L["Remove all Key Bindings"] = "移除全部按鍵綁定"
L["Remove all Macros"] = "移除全部巨集"
L["Remove everything in ActionBar"] = "清除全部快捷列"
L["Rename"] = "重新命名"
L["Skip bad CRC32"] = "略過CRC32錯誤"
L["Skip CRC32, version and any other validation before importing. May cause unknown behavior"] = "在匯入前略過CRC32, 版本等驗證. 這將可能會導致未知錯誤"
L["Skip unsupported version"] = "忽略不相容的版本"
L["Time"] = "時間"
L["TOC_NOTES"] = "Myslot可以跨帳號綁定技能與按鍵設置。反饋通道：farmer1992@gmail.com"
L["Try force importing"] = "嘗試強制匯入"
L["Unsaved"] = "未保存"
L["Use random mount instead of an unattained mount"] = "使用隨機座騎代替沒有獲得的座騎"

end

