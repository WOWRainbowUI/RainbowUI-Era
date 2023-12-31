---------------------------------------------------------------------
-- File: Cell\RaidDebuffs\RaidDebuffs_Cata.lua
-- Author: enderneko (enderneko-dev@outlook.com)
-- Created : 2022-08-05 16:11:02 +08:00
-- Modified: 2023-11-27 12:04:37 +08:00
---------------------------------------------------------------------

local _, Cell = ...
local F = Cell.funcs

local debuffs = {
    [75] = { -- 巴拉丁监狱
        ["general"] = {
            105859, -- 穿刺
        },
        [139] = { -- 阿尔加洛斯
        },
        [140] = { -- 欧库塔尔
        },
        [339] = { -- 憎恨女王阿丽萨巴尔
        },
    },

    [72] = { -- 暮光堡垒
        ["general"] = {
        },
        [156] = { -- 哈尔弗斯·碎龙者
        },
        [157] = { -- 瑟纳利昂和瓦里昂娜
        },
        [158] = { -- 升腾者议会
        },
        [167] = { -- 古加尔
        },
    },

    [74] = { -- 风神王座
        ["general"] = {
        },
        [154] = { -- 风之议会
        },
        [155] = { -- 奥拉基尔
        },
    },

    [73] = { -- 黑翼血环
        ["general"] = {
        },
        [169] = { -- 全能金刚防御系统
        },
        [170] = { -- 熔喉
        },
        [171] = { -- 艾卓曼德斯
        },
        [172] = { -- 奇美隆
        },
        [173] = { -- 马洛拉克
        },
        [174] = { -- 奈法利安的末日
        },
    },

    [78] = { -- 火焰之地
        ["general"] = {
        },
        [192] = { -- 贝丝缇拉克
        },
        [193] = { -- 雷奥利斯领主
        },
        [194] = { -- 奥利瑟拉佐尔
        },
        [195] = { -- 沙恩诺克斯
        },
        [196] = { -- 护门人贝尔洛克
        },
        [197] = { -- 管理者鹿盔
        },
        [198] = { -- 拉格纳罗斯
        },
    },

    [187] = { -- 巨龙之魂
        ["general"] = {
        },
        [311] = { -- 莫卓克
        },
        [324] = { -- 督军佐诺兹
        },
        [325] = { -- 不眠的约萨希
        },
        [317] = { -- 缚风者哈格拉
        },
        [331] = { -- 奥卓克希昂
        },
        [332] = { -- 战争大师黑角
        },
        [318] = { -- 死亡之翼的背脊
        },
        [333] = { -- 疯狂的死亡之翼
        },
    },

    [67] = { -- 巨石之核
        ["general"] = {
        },
        [110] = { -- 克伯鲁斯
        },
        [111] = { -- 岩皮
        },
        [112] = { -- 欧泽鲁克
        },
        [113] = { -- 高阶女祭司艾苏尔
        },
    },

    [64] = { -- 影牙城堡
        ["general"] = {
        },
        [96] = { -- 灰葬男爵
        },
        [97] = { -- 席瓦莱恩男爵
        },
        [98] = { -- 指挥官斯普林瓦尔
        },
        [99] = { -- 沃登勋爵
        },
        [100] = { -- 高弗雷勋爵
        },
    },

    [69] = { -- 托维尔失落之城
        ["general"] = {
        },
        [117] = { -- 胡辛姆将军
        },
        [118] = { -- 锁喉
        },
        [119] = { -- 高阶预言者巴林姆
        },
        [122] = { -- 希亚玛特
        },
    },

    [68] = { -- 旋云之巅
        ["general"] = {
            410997, -- 呼啸劲风
            88194,  -- 冷冽摧残
            411003, -- 乱流
            410870, -- 旋风
        },
        [114] = {   -- 大宰相埃尔坦
            86292,  -- 旋风之盾
        },
        [115] = {   -- 阿尔泰鲁斯
            88286,  -- 阿尔泰鲁斯占据上风
            413275, -- 冷锋
            413296, -- 下击暴流
        },
        [116] = {   -- 西风君王阿萨德
            87618,  -- 静电缠握
            87726,  -- 接地场
        },
    },

    [184] = { -- 时光之末
        ["general"] = {
        },
        [340] = { -- 贝恩的残影
        },
        [285] = { -- 吉安娜的残影
        },
        [323] = { -- 希尔瓦娜斯的残影
        },
        [283] = { -- 泰兰德的残影
        },
        [289] = { -- 姆诺兹多
        },
    },

    [186] = { -- 暮光审判
        ["general"] = {
        },
        [322] = { -- 阿奎里恩
        },
        [342] = { -- 埃希拉·黎明克星
        },
        [341] = { -- 大主教本尼迪塔斯
        },
    },

    [71] = { -- 格瑞姆巴托
        ["general"] = {
        },
        [131] = { -- 乌比斯将军
        },
        [132] = { -- 铸炉之主索朗格斯
        },
        [133] = { -- 达加·燃影者
        },
        [134] = { -- 地狱公爵埃鲁达克
        },
    },

    [63] = { -- 死亡矿井
        ["general"] = {
        },
        [89] = { -- 格拉布托克
        },
        [90] = { -- 赫利克斯·破甲
        },
        [91] = { -- 死神5000
        },
        [92] = { -- 撕心狼将军
        },
        [93] = { -- “船长”曲奇
        },
    },

    [185] = { -- 永恒之井
        ["general"] = {
        },
        [290] = { -- 佩罗萨恩
        },
        [291] = { -- 艾萨拉女王
        },
        [292] = { -- 玛诺洛斯与瓦罗森
        },
    },

    [65] = { -- 潮汐王座
        ["general"] = {
            426660, -- 锋齿利喉
            428542, -- 压抑深渊
            426727, -- 强酸轰炸
            426663, -- 暴食追踪
            75992,  -- 闪电澎湃
            426681, -- 电能巨喉
            426808, -- 虚无震爆
            426783, -- 精神鞭笞
            76516, -- 淬毒长矛
            76363, -- 腐蚀波
            426688, -- 不稳定酸液
            426741, -- 破壳者
        },
        [101] = { -- 纳兹夏尔女士
            429263, -- 电震轰击
        },
        [102] = { -- 指挥官乌尔索克，腐烂王子
            427670, -- 粉碎爪击
            427668, -- 腐烂震波
            427559, -- 冒泡的软泥怪
        },
        [103] = { -- 蛊心魔古厄夏
            429048, -- 烈焰震击
            429172, -- 惊魂幻视
        },
        [104] = { -- 厄祖玛特
            428407, -- 污浊轰击
            428868, -- 腐臭咆哮
            428404, -- 污浊黑暗
            428403, -- 脏污
        },
    },

    [76] = { -- 祖尔格拉布
        ["general"] = {
        },
        [175] = { -- 高阶祭司温诺希斯
        },
        [176] = { -- 血领主曼多基尔
        },
        [177] = { -- 疯狂之缘——格里雷克
        },
        [178] = { -- 疯狂之缘——哈扎拉尔
        },
        [179] = { -- 疯狂之缘——雷纳塔基
        },
        [180] = { -- 疯狂之缘——乌苏雷
        },
        [181] = { -- 高阶祭司基尔娜拉
        },
        [184] = { -- 赞吉尔
        },
        [185] = { -- 碎神者金度
        },
    },

    [77] = { -- 祖阿曼
        ["general"] = {
        },
        [186] = { -- 埃基尔松
        },
        [187] = { -- 纳洛拉克
        },
        [188] = { -- 加亚莱
        },
        [189] = { -- 哈尔拉兹
        },
        [190] = { -- 妖术领主玛拉卡斯
        },
        [191] = { -- 达卡拉
        },
    },

    [70] = { -- 起源大厅
        ["general"] = {
        },
        [124] = { -- 神殿守护者安努尔
        },
        [125] = { -- 地怒者塔赫
        },
        [126] = { -- 安拉斐特
        },
        [127] = { -- 伊希斯特，魔法的造物
        },
        [128] = { -- 阿穆纳伊，生命的造物
        },
        [129] = { -- 塞特斯，毁灭的造物
        },
        [130] = { -- 拉夏，太阳的造物
        },
    },

    [66] = { -- 黑石岩窟
        ["general"] = {
        },
        [105] = { -- 摧骨者罗姆欧格
        },
        [106] = { -- 柯尔拉，暮光之兆
        },
        [107] = { -- 卡尔什·断钢
        },
        [108] = { -- 如花
        },
        [109] = { -- 升腾者领主奥西迪斯
        },
    },
}

F:LoadBuiltInDebuffs(debuffs)