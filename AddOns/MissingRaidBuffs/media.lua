local MRB, C, L = unpack(select(2, ...))
local MODULE_NAME = "media"

MRB.Media = {}


---------------------------------------------
-- CONSTANTS
---------------------------------------------
local POWER_WORD_FORTITUDE_SPELLID = 1243
local PRAYER_OF_FORTITUDE_SPELLID = 21562
local DIVINE_SPIRIT_SPELLID = 14752
local PRAYER_OF_SPIRIT_SPELLID = 27681
local SHADOW_PROTECTION_SPELLD = 976
local PRAYER_OF_SHADOW_PROTECTION_SPELLID = 27683
local ARCANE_INTELLIGENCE_SPELLID = 1459
local ARCANE_BRILLIANCE_SPELLID = 23028
local MARK_OF_THE_WILD_SPELLID = 1126
local GIFT_OF_THE_WILD_SPELLID = 21849

local CLASSICON_TEXTURE = { [[Interface\GLUES\CHARACTERCREATE\UI-CharacterCreate-Classes]], 256, 256 }


---------------------------------------------
-- UTILITIES
---------------------------------------------
local function createTextureIcon(texture, oX, oY, tL, tR, tT, tB)
    local path, tW, tH = unpack(texture)
    return "|T" .. table.concat({ path, 0, 0, oX, oY, tW, tH, tL, tR, tT, tB }, ":") .. "|t"
end


---------------------------------------------
-- SPELLS
---------------------------------------------
MRB.Media.Spells = {}
MRB.Media.Spells.POWER_WORD_FORTITUDE = (GetSpellInfo(POWER_WORD_FORTITUDE_SPELLID))
MRB.Media.Spells.PRAYER_OF_FORTITUDE = (GetSpellInfo(PRAYER_OF_FORTITUDE_SPELLID))
MRB.Media.Spells.DIVINE_SPIRIT = (GetSpellInfo(DIVINE_SPIRIT_SPELLID))
MRB.Media.Spells.PRAYER_OF_SPIRIT = (GetSpellInfo(PRAYER_OF_SPIRIT_SPELLID))
MRB.Media.Spells.SHADOW_PROTECTION = (GetSpellInfo(SHADOW_PROTECTION_SPELLD))
MRB.Media.Spells.PRAYER_OF_SHADOW_PROTECTION = (GetSpellInfo(PRAYER_OF_SHADOW_PROTECTION_SPELLID))
MRB.Media.Spells.ARCANE_INTELLIGENCE = (GetSpellInfo(ARCANE_INTELLIGENCE_SPELLID))
MRB.Media.Spells.ARCANE_BRILLIANCE = (GetSpellInfo(ARCANE_BRILLIANCE_SPELLID))
MRB.Media.Spells.MARK_OF_THE_WILD = (GetSpellInfo(MARK_OF_THE_WILD_SPELLID))
MRB.Media.Spells.GIFT_OF_THE_WILD = (GetSpellInfo(GIFT_OF_THE_WILD_SPELLID))


---------------------------------------------
-- TEXTURES
---------------------------------------------
MRB.Media.Textures = {}
MRB.Media.Textures.POWER_WORD_FORTITUDE = select(2, GetSpellInfo(POWER_WORD_FORTITUDE_SPELLID))
MRB.Media.Textures.DIVINE_SPIRIT = select(2, GetSpellInfo(DIVINE_SPIRIT_SPELLID))
MRB.Media.Textures.SHADOW_PROTECTION = select(2, GetSpellInfo(SHADOW_PROTECTION_SPELLD))
MRB.Media.Textures.ARCANE_INTELLIGENCE = select(2, GetSpellInfo(ARCANE_INTELLIGENCE_SPELLID))
MRB.Media.Textures.MARK_OF_THE_WILD = select(2, GetSpellInfo(MARK_OF_THE_WILD_SPELLID))


---------------------------------------------
-- TEXTURES ICONS
---------------------------------------------
MRB.Media.TextureIcons = {}
MRB.Media.TextureIcons.CLASS_TEXTURE_ICONS = {}
MRB.Media.TextureIcons.CLASS_TEXTURE_ICONS.WARRIOR = createTextureIcon(CLASSICON_TEXTURE, 0, 0, 0, 64, 0, 64)
MRB.Media.TextureIcons.CLASS_TEXTURE_ICONS.MAGE = createTextureIcon(CLASSICON_TEXTURE, 0, 0, 64, 128, 0, 64)
MRB.Media.TextureIcons.CLASS_TEXTURE_ICONS.ROGUE = createTextureIcon(CLASSICON_TEXTURE, 0, 0, 128, 192, 0, 64)
MRB.Media.TextureIcons.CLASS_TEXTURE_ICONS.DRUID = createTextureIcon(CLASSICON_TEXTURE, 0, 0, 192, 256, 0, 64)
MRB.Media.TextureIcons.CLASS_TEXTURE_ICONS.HUNTER = createTextureIcon(CLASSICON_TEXTURE, 0, 0, 0, 64, 64, 128)
MRB.Media.TextureIcons.CLASS_TEXTURE_ICONS.SHAMAN = createTextureIcon(CLASSICON_TEXTURE, 0, 0, 64, 128, 64, 128)
MRB.Media.TextureIcons.CLASS_TEXTURE_ICONS.PRIEST = createTextureIcon(CLASSICON_TEXTURE, 0, 0, 128, 192, 64, 128)
MRB.Media.TextureIcons.CLASS_TEXTURE_ICONS.WARLOCK = createTextureIcon(CLASSICON_TEXTURE, 0, 0, 192, 256, 64, 128)
MRB.Media.TextureIcons.CLASS_TEXTURE_ICONS.PALADIN = createTextureIcon(CLASSICON_TEXTURE, 0, 0, 0, 64, 128, 192)
