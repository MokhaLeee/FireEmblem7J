#pragma once

#include "global.h"

enum item_kind {
    ITYPE_SWORD = 0,
    ITYPE_LANCE = 1,
    ITYPE_AXE   = 2,
    ITYPE_BOW   = 3,
    ITYPE_STAFF = 4,
    ITYPE_ANIMA = 5,
    ITYPE_LIGHT = 6,
    ITYPE_DARK  = 7,
    ITYPE_BLLST = 8,
    ITYPE_ITEM  = 9,
    ITYPE_DRAGN = 10,

    ITYPE_11    = 11,
    ITYPE_12    = 12,
};

enum weapon_effect {
    WPN_EFFECT_NONE    = 0,
    WPN_EFFECT_POISON  = 1,
    WPN_EFFECT_HPDRAIN = 2,
    WPN_EFFECT_HPHALVE = 3,
    WPN_EFFECT_DEVIL   = 4,
};

enum ItemData_attributes {
    IA_NONE           = 0,

    IA_WEAPON         = (1 << 0),
    IA_MAGIC          = (1 << 1),
    IA_STAFF          = (1 << 2),
    IA_UNBREAKABLE    = (1 << 3),
    IA_UNSELLABLE     = (1 << 4),
    IA_BRAVE          = (1 << 5),
    IA_MAGICDAMAGE    = (1 << 6),
    IA_UNCOUNTERABLE  = (1 << 7),
    IA_REVERTTRIANGLE = (1 << 8),
    IA_HAMMERNE       = (1 << 9), // Defined as Hammerne effect in FE6 Nightmare module, but as ??? in FE7 & FE8.
    IA_LOCK_3         = (1 << 10), // Dragons or Monster depending of game
    IA_LOCK_1         = (1 << 11),
    IA_LOCK_2         = (1 << 12),
    IA_LOCK_0         = (1 << 13), // King in FE6
    IA_NEGATE_FLYING  = (1 << 14),
    IA_NEGATE_CRIT    = (1 << 15),
    IA_UNUSABLE       = (1 << 16),
    IA_NEGATE_DEFENSE = (1 << 17),
    IA_LOCK_4         = (1 << 18),
    IA_LOCK_5         = (1 << 19),
    IA_LOCK_6         = (1 << 20),
    IA_LOCK_7         = (1 << 21),

    // Helpers
    IA_REQUIRES_WEXP = (IA_WEAPON | IA_STAFF),
    IA_LOCK_ANY = (IA_LOCK_0 | IA_LOCK_1 | IA_LOCK_2 | IA_LOCK_3 | IA_LOCK_4 | IA_LOCK_5 | IA_LOCK_6 | IA_LOCK_7 | IA_UNUSABLE)
};

enum weapon_lv_id {
    WPN_LEVEL_0 = 0,
    WPN_LEVEL_E = 1,
    WPN_LEVEL_D = 2,
    WPN_LEVEL_C = 3,
    WPN_LEVEL_B = 4,
    WPN_LEVEL_A = 5,
    WPN_LEVEL_S = 6,
};

enum weapon_lv_exp {
    WPN_EXP_0 = 0,
    WPN_EXP_E = 1,
    WPN_EXP_D = 31,
    WPN_EXP_C = 71,
    WPN_EXP_B = 121,
    WPN_EXP_A = 181,
    WPN_EXP_S = 251,
};

// sub_8016470
int GetItemHpBonus(int item);
int GetItemPowBonus(int item);
int GetItemSklBonus(int item);
int GetItemSpdBonus(int item);
int GetItemDefBonus(int item);
int GetItemResBonus(int item);
int GetItemLckBonus(int item);
int MakeNewItem(int item);
bool CanUnitUseWeapon(struct Unit *unit, int item);
bool CanUnitUseWeaponNow(struct Unit *unit, int item);
bool CanUnitUseStaff(struct Unit *unit, int item);
// sub_80168A4
// sub_80168EC
// sub_8016984
// sub_8016A4C
void DrawItemStatScreenLine(struct Text * text, int item, int nameColor, u16 * mapOut);
u16 GetItemAfterUse(int item);
u16 GetUnitEquippedWeapon(struct Unit *unit);
int GetUnitEquippedWeaponSlot(struct Unit *unit);
bool IsItemCoveringRange(int item, int range);
void EquipUnitItemSlot(struct Unit *unit, int itemSlot);
bool IsItemEffectiveAgainst(u16 item, struct Unit *unit);
char *GetItemDisplayRangeString(int item);
int GetWeaponLevelFromExp(int wexp);
// sub_8016DD8
int GetWeaponLevelSpecialCharFromExp(int wexp);
// sub_8016E60
void GetWeaponExpProgressState(int wexp, int * outValue, int * outMax);
bool IsItemDisplayUsable(struct Unit * unit, int item);
// sub_8016F80
// sub_8016FBC
int GetUnitItemSlot(struct Unit *unit, int itemIndex);
// sub_801718C
// sub_80171B4
// sub_8017208
// sub_8017310
// sub_8017364
// sub_8017420
// sub_80174A0
// sub_80174F4
s32 GetPartyTotalGoldValue(void);
// sub_801759C
// sub_80175CC
int GetItemIndex(int item);
char *GetItemName(int item);
int GetItemDescMsg(int item);
int GetItemUseDescId(int item);
int GetItemType(int item);
int GetItemAttributes(int item);
int GetItemUses(int item);
int GetItemMaxUses(int item);
int GetItemMight(int item);
int GetItemHit(int item);
int GetItemWeight(int item);
int GetItemCrit(int item);
// sub_8017748
// sub_8017774
// sub_801778C
// sub_80177A8
int GetItemRequiredExp(int item);
// sub_80177D8
// sub_80177F0
// GetItemIconId
int GetItemWeaponEffect(int item);
// sub_8017844
int GetItemCostPerUse(int item);
// sub_8017874
int GetItemAwardedExp(int item);
// GetItemData
