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

extern struct BattleUnit gBattleActor, gBattleTarget;

enum {
    // For use with BattleStats:config

    BATTLE_CONFIG_REAL = (1 << 0),
    BATTLE_CONFIG_SIMULATE = (1 << 1),
    BATTLE_CONFIG_BIT2 = (1 << 2),
    BATTLE_CONFIG_BALLISTA = (1 << 3),
    BATTLE_CONFIG_PROMOTION = (1 << 4),
    BATTLE_CONFIG_ARENA = (1 << 5),
    BATTLE_CONFIG_REFRESH = (1 << 6),
    BATTLE_CONFIG_MAPANIMS = (1 << 7),
    BATTLE_CONFIG_PROMOTION_PREP = (1 << 8),
    BATTLE_CONFIG_DANCERING = (1 << 9),
};

struct BattleStats {
    /* 00 */ u16 config;

    /* 02 */ u8 range;

    /* 04 */ short damage;
    /* 06 */ short attack;
    /* 08 */ short defense;
    /* 0A */ short hitRate;
    /* 0C */ short critRate;
    /* 0E */ short silencerRate;

    /* 10 */ struct Unit *taUnitA;
    /* 14 */ struct Unit *taUnitB;
};

extern struct BattleStats gBattleStats;

enum {
    BATTLE_HIT_ATTR_CRIT      = (1 << 0),
    BATTLE_HIT_ATTR_MISS      = (1 << 1),
    BATTLE_HIT_ATTR_FOLLOWUP  = (1 << 2),
    BATTLE_HIT_ATTR_RETALIATE = (1 << 3),
    BATTLE_HIT_ATTR_BRAVE     = (1 << 4),
    BATTLE_HIT_ATTR_5         = (1 << 5), // unused?
    BATTLE_HIT_ATTR_POISON    = (1 << 6),
    BATTLE_HIT_ATTR_DEVIL     = (1 << 7),
    BATTLE_HIT_ATTR_HPSTEAL   = (1 << 8),
    BATTLE_HIT_ATTR_HPHALVE   = (1 << 9),
    BATTLE_HIT_ATTR_TATTACK   = (1 << 10), // triangle attack!
    BATTLE_HIT_ATTR_SILENCER  = (1 << 11),
    BATTLE_HIT_ATTR_12        = (1 << 12), // unused?
    BATTLE_HIT_ATTR_PETRIFY   = (1 << 13),
    BATTLE_HIT_ATTR_SURESHOT  = (1 << 14),
    BATTLE_HIT_ATTR_GREATSHLD = (1 << 15),
    BATTLE_HIT_ATTR_PIERCE    = (1 << 16),
    BATTLE_HIT_ATTR_17        = (1 << 17), // unused?
    BATTLE_HIT_ATTR_18        = (1 << 18), // unused?
};

enum {
    BATTLE_HIT_INFO_BEGIN        = (1 << 0),
    BATTLE_HIT_INFO_FINISHES     = (1 << 1),
    BATTLE_HIT_INFO_KILLS_TARGET = (1 << 2),
    BATTLE_HIT_INFO_RETALIATION  = (1 << 3),
    BATTLE_HIT_INFO_END          = (1 << 4),
};

struct BattleHit {
    /* 00:18 */ unsigned attributes : 19;
    /* 19:23 */ unsigned info       : 5;
    /* 24:31 */ signed   hpChange   : 8;
};

#define BATTLE_HIT_MAX 7
extern struct BattleHit gBattleHitArray[BATTLE_HIT_MAX];
extern struct BattleHit *gBattleHitIterator;

enum {
    // Special item slot identifiers understood by SetBattleUnitWeapon and other functions

    BU_ISLOT_AUTO           = -1,
    BU_ISLOT_OVERFLOW       = UNIT_ITEM_COUNT + 0,
    BU_ISLOT_ARENA_PLAYER   = UNIT_ITEM_COUNT + 1,
    BU_ISLOT_ARENA_OPPONENT = UNIT_ITEM_COUNT + 2,
    BU_ISLOT_BALLISTA       = UNIT_ITEM_COUNT + 3,
};

// BattleGenerateSimulationInternal
// BattleGenerateRealInternal
// BattleApplyGameStateUpdates
// BattleGenerateSimulation
// BattleGenerateReal
// BattleGenerateBallistaSimulation
// BattleGenerateBallistaReal
void BattleGenerate(struct Unit *actor, struct Unit *target);
// BattleGenerateUiStats
// BattleRoll1RN
// BattleRoll2RN
void InitBattleUnit(struct BattleUnit *bu, struct Unit *unit);
// InitBattleUnitWithoutBonuses
// SetBattleUnitTerrainBonuses
void SetBattleUnitTerrainBonusesAuto(struct BattleUnit *bu);
void SetBattleUnitWeapon(struct BattleUnit *bu, int itemSlot);
void SetBattleUnitWeaponBallista(struct BattleUnit *bu);
// nullsub_42
void ComputeBattleUnitStats(struct BattleUnit *attacker, struct BattleUnit *defender);
void ComputeBattleUnitEffectiveStats(struct BattleUnit *attacker, struct BattleUnit *defender);
void ComputeBattleUnitSupportBonuses(struct BattleUnit *attacker, struct BattleUnit *defender);
void ComputeBattleUnitDefense(struct BattleUnit *attacker, struct BattleUnit *defender);
void ComputeBattleUnitBaseDefense(struct BattleUnit *bu);
void ComputeBattleUnitStatusBonuses(struct BattleUnit *bu);
void ComputeBattleUnitSpecialWeaponStats(struct BattleUnit *attacker, struct BattleUnit *defender);
void ClearBattleHits(void);
void ComputeBattleUnitAttack(struct BattleUnit *attacker, struct BattleUnit *defender);
void ComputeBattleUnitSpeed(struct BattleUnit *bu);
void ComputeBattleUnitHitRate(struct BattleUnit *bu);
void ComputeBattleUnitAvoidRate(struct BattleUnit *bu);
void ComputeBattleUnitCritRate(struct BattleUnit *bu);
void ComputeBattleUnitDodgeRate(struct BattleUnit *bu);
void ComputeBattleUnitEffectiveHitRate(struct BattleUnit *attacker, struct BattleUnit *defender);
void ComputeBattleUnitEffectiveCritRate(struct BattleUnit *attacker, struct BattleUnit *defender);
void ComputeBattleUnitSilencerRate(struct BattleUnit *attacker, struct BattleUnit *defender);
void ComputeBattleUnitWeaponRankBonuses(struct BattleUnit *bu);
void ComputeBattleUnitStatusBonuses(struct BattleUnit *bu);
// ComputeBattleUnitSpecialWeaponStats
// sub_08029434
void BattleUnwind(void);
// sub_080294D8
// sub_080294EC
// sub_08029568
// sub_080295C4
// sub_080295D8
// sub_080295FC
// sub_080296E4
// sub_08029714
// sub_080297D4
// sub_0802984C
// sub_08029988
void BattleApplyExpGains(void);
// GetStatIncrease
// GetAutoleveledStatIncrease
// sub_08029AE4
// sub_08029B10
// sub_08029CC8
// sub_08029DB4
// sub_08029E20
void BattleApplyUnitUpdates(void);
// sub_08029FA8
// sub_08029FAC
// sub_0802A098
// sub_0802A0D4
// sub_0802A1BC
void BattleApplyBallistaUpdates(void);
// sub_0802A21C
// sub_0802A22C
// sub_0802A24C
// sub_0802A27C
// sub_0802A2B8
// sub_0802A2E0
// sub_0802A324
// sub_0802A3C0
// sub_0802A42C
// sub_0802A4A8
// sub_0802A50C
void BattleUnitTargetSetEquippedWeapon(struct BattleUnit *bu);
void BattleUnitTargetCheckCanCounter(struct BattleUnit *bu);
// sub_0802A5D0
void BattleApplyWeaponTriangleEffect(struct BattleUnit *actor, struct BattleUnit *target);
void BattleInitTargetCanCounter(void);
// sub_0802A704
void ComputeBattleObstacleStats(void);
// sub_0802A7C4
// sub_0802A860
// sub_0802A8BC
// sub_0802A8E0
void BattlePrintDebugUnitInfo(struct BattleUnit *actor, struct BattleUnit *target);
void BattlePrintDebugHitInfo(void);
// sub_0802A964
// sub_0802AA10
// sub_0802AA64
// sub_0802AA80
// sub_0802AA9C
// sub_0802AB1C
// sub_0802AB90
// sub_0802ACB4
// sub_0802ACC4
// sub_0802ACE0
// sub_0802ACEC
void BattleUnwindScripted(void);
// sub_0802AE44
void BattleHitAdvance(void);
void BattleHitTerminate(void);
