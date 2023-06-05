#pragma once

#include "global.h"
#include "unit.h"

struct BattleUnit {
    /* 00 */ struct Unit unit;

    /* 48 */ u16 weapon;
    /* 4A */ u16 weaponBefore;
    /* 4C */ u32 weaponAttributes;
    /* 50 */ u8 weaponType;
    /* 51 */ u8 weaponSlotIndex;

    /* 52 */ s8 canCounter;

    /* 53 */ s8 wTriangleHitBonus;
    /* 54 */ s8 wTriangleDmgBonus;

    /* 55 */ u8 terrainId;
    /* 56 */ s8 terrainDefense;
    /* 57 */ s8 terrainAvoid;
    /* 58 */ s8 terrainResistance;
    /* 59 */ /* pad */

    /* 5A */ short battleAttack;
    /* 5C */ short battleDefense;
    /* 5E */ short battleSpeed;
    /* 60 */ short battleHitRate;
    /* 62 */ short battleAvoidRate;
    /* 64 */ short battleEffectiveHitRate;
    /* 66 */ short battleCritRate;
    /* 68 */ short battleDodgeRate;
    /* 6A */ short battleEffectiveCritRate;
    /* 6C */ short battleSilencerRate;

    /* 6E */ s8 expGain;
    /* 6F */ s8 statusOut;
    /* 70 */ s8 levelPrevious;
    /* 71 */ s8 expPrevious;

    /* 72 */ s8 hpInitial;

    /* 73 */ s8 changeHP;
    /* 74 */ s8 changePow;
    /* 75 */ s8 changeSkl;
    /* 76 */ s8 changeSpd;
    /* 77 */ s8 changeDef;
    /* 78 */ s8 changeRes;
    /* 79 */ s8 changeLck;
    /* 7A */ s8 changeCon;

    /* 7B */ s8 wexpMultiplier;
    /* 7C */ s8 nonZeroDamage;
    /* 7D */ s8 weaponBroke;

    /* 7E */ s8 hasItemEffectTarget;
    /* 7F */ /* pad */
};
