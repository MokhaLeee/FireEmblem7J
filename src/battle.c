#include "global.h"
#include "unit.h"
#include "battle.h"
#include "item.h"
#include "constants/items.h"
#include "action.h"
#include "random.h"
#include "map.h"
#include "bm.h"
#include "arena.h"
#include "support.h"

void BattleGenerateSimulationInternal(struct Unit *actor, struct Unit *target, int x, int y, int actorWpnSlot)
{
    InitBattleUnit(&gBattleActor, actor);
    InitBattleUnit(&gBattleTarget, target);

    gBattleActor.unit.xPos = x;
    gBattleActor.unit.yPos = y;

    gBattleStats.range = RECT_DISTANCE(
        gBattleActor.unit.xPos, gBattleActor.unit.yPos,
        gBattleTarget.unit.xPos, gBattleTarget.unit.yPos
    );

    if (gBattleStats.config & BATTLE_CONFIG_BALLISTA)
        SetBattleUnitWeaponBallista(&gBattleActor);
    else
        SetBattleUnitWeapon(&gBattleActor, actorWpnSlot);

    SetBattleUnitWeapon(&gBattleTarget, BU_ISLOT_AUTO);

    BattleInitTargetCanCounter();
    BattleApplyWeaponTriangleEffect(&gBattleActor, &gBattleTarget);

    DisableAllLightRunes();

    SetBattleUnitTerrainBonusesAuto(&gBattleActor);
    SetBattleUnitTerrainBonusesAuto(&gBattleTarget);

    BattleGenerate(actor, target);

    EnableAllLightRunes();
}

void BattleGenerateRealInternal(struct Unit *actor, struct Unit *target)
{
    InitBattleUnit(&gBattleActor, actor);
    InitBattleUnit(&gBattleTarget, target);

    gBattleStats.range = RECT_DISTANCE(
        gBattleActor.unit.xPos, gBattleActor.unit.yPos,
        gBattleTarget.unit.xPos, gBattleTarget.unit.yPos
    );

    if (gBattleStats.config & BATTLE_CONFIG_BALLISTA)
        SetBattleUnitWeaponBallista(&gBattleActor);
    else
        SetBattleUnitWeapon(&gBattleActor, BU_ISLOT_AUTO);

    SetBattleUnitWeapon(&gBattleTarget, BU_ISLOT_AUTO);

    BattleInitTargetCanCounter();
    BattleApplyWeaponTriangleEffect(&gBattleActor, &gBattleTarget);

    DisableAllLightRunes();

    SetBattleUnitTerrainBonusesAuto(&gBattleActor);
    SetBattleUnitTerrainBonusesAuto(&gBattleTarget);

    BattleGenerate(actor, target);

    EnableAllLightRunes();

    BattleUnitTargetCheckCanCounter(&gBattleTarget);
    BattleUnitTargetSetEquippedWeapon(&gBattleTarget);

    if (gBattleTarget.unit.index) {
        BattleApplyExpGains();
        PidStatsRecordBattleResult();

        PidStatsAddBattleAmt(actor);
        PidStatsAddBattleAmt(target);
    }
}

void BattleApplyGameStateUpdates(void)
{
    BattleApplyUnitUpdates();
    BattleApplyBallistaUpdates();

    BattlePrintDebugUnitInfo(&gBattleActor, &gBattleTarget);
    BattlePrintDebugHitInfo();
}

void BattleGenerateSimulation(struct Unit *actor, struct Unit *target, int x, int y, int slot)
{
    if (x < 0 && y < 0) {
        x = actor->xPos;
        y = actor->yPos;
    }

    gBattleStats.config = BATTLE_CONFIG_SIMULATE;
    BattleGenerateSimulationInternal(actor, target, x, y, slot);
}

void BattleGenerateReal(struct Unit *actor, struct Unit *target)
{
    gBattleStats.config = BATTLE_CONFIG_REAL;
    BattleGenerateRealInternal(actor, target);
}

void BattleGenerateBallistaSimulation(struct Unit *actor, struct Unit *target, int x, int y)
{
    gBattleStats.config = BATTLE_CONFIG_SIMULATE | BATTLE_CONFIG_BALLISTA;
    BattleGenerateSimulationInternal(actor, target, x, y, 0);
}

void BattleGenerateBallistaReal(struct Unit *actor, struct Unit *target)
{
    gBattleStats.config = BATTLE_CONFIG_REAL | BATTLE_CONFIG_BALLISTA;
    BattleGenerateRealInternal(actor, target);
}

void BattleGenerate(struct Unit *actor, struct Unit *target)
{
    ComputeBattleUnitStats(&gBattleActor, &gBattleTarget);
    ComputeBattleUnitStats(&gBattleTarget, &gBattleActor);

    ComputeBattleUnitEffectiveStats(&gBattleActor, &gBattleTarget);
    ComputeBattleUnitEffectiveStats(&gBattleTarget, &gBattleActor);

    if (target == NULL)
        ComputeBattleObstacleStats();

    if ((gBattleStats.config & BATTLE_CONFIG_REAL) && (gActionSt.battle_scr))
        BattleUnwindScripted();
    else
        BattleUnwind();
}

void BattleGenerateUiStats(struct Unit* unit, s8 itemSlot) {
    gBattleStats.config = BATTLE_CONFIG_BIT2;

    gBattleTarget.weapon = 0;
    gBattleTarget.weaponAttributes = IA_NONE;
    gBattleTarget.weaponType = 0xFF;

    gBattleTarget.unit.pClassData = NULL;

    gBattleActor.wTriangleHitBonus = 0;
    gBattleActor.wTriangleDmgBonus = 0;

    if ((itemSlot >= 0) && (itemSlot < UNIT_ITEM_COUNT)) {
        struct Unit tmpUnit = *unit;

        EquipUnitItemSlot(&tmpUnit, itemSlot);
        itemSlot = 0;

        InitBattleUnit(&gBattleActor, &tmpUnit);
    } else
        InitBattleUnit(&gBattleActor, unit);

    SetBattleUnitTerrainBonusesAuto(&gBattleActor);

    SetBattleUnitWeapon(&gBattleActor, itemSlot);
    ComputeBattleUnitStats(&gBattleActor, &gBattleTarget);

    if (GetItemIndex(gBattleActor.weapon) == ITEM_SWORD_RUNESWORD) {
        gBattleActor.battleAttack -= gBattleActor.unit.pow / 2;

        gBattleActor.battleCritRate = 0;
        gBattleActor.battleEffectiveCritRate = 0;
    }

    if (!gBattleActor.weapon) {
        gBattleActor.battleAttack = 0xFF;
        gBattleActor.battleHitRate = 0xFF;
        gBattleActor.battleCritRate = 0xFF;
    }

    if (GetItemWeaponEffect(gBattleActor.weapon) == WPN_EFFECT_HPHALVE)
        gBattleActor.battleAttack = 0xFF;
}

bool BattleRoll1RN(u16 threshold, bool simulationResult)
{
    if (gBattleStats.config & BATTLE_CONFIG_SIMULATE)
        return simulationResult;

    return RandRoll(threshold);
}

bool BattleRoll2RN(u16 threshold, bool simulationResult)
{
    if (gBattleStats.config & BATTLE_CONFIG_SIMULATE)
        return simulationResult;

    return RandRoll2Rn(threshold);
}

void InitBattleUnit(struct BattleUnit *bu, struct Unit *unit)
{
    if (!unit)
        return;

    bu->unit = *unit;

    bu->unit.maxHP = GetUnitMaxHp(unit);
    bu->unit.pow = GetUnitPower(unit);
    bu->unit.skl = GetUnitSkill(unit);
    bu->unit.spd = GetUnitSpeed(unit);
    bu->unit.def = GetUnitDefense(unit);
    bu->unit.lck = GetUnitLuck(unit);
    bu->unit.res = GetUnitResistance(unit);
    bu->unit.conBonus = UNIT_CON(unit);
    bu->unit.movBonus = UNIT_MOV(unit);

    bu->levelPrevious = bu->unit.level;
    bu->expPrevious = bu->unit.exp;

    bu->hpInitial = bu->unit.curHP;
    bu->statusOut = 0xFF;

    bu->changeHP = 0;
    bu->changePow = 0;
    bu->changeSkl = 0;
    bu->changeSpd = 0;
    bu->changeDef = 0;
    bu->changeRes = 0;
    bu->changeLck = 0;
    bu->changeCon = 0;

    gBattleActor.wexpMultiplier = 0;
    gBattleTarget.wexpMultiplier = 0;

    bu->wTriangleHitBonus = 0;
    bu->wTriangleDmgBonus = 0;

    bu->nonZeroDamage = false;

    gBattleActor.weaponBroke = false;
    gBattleTarget.weaponBroke = false;

    gBattleActor.expGain = 0;
    gBattleTarget.expGain = 0;
}

void InitBattleUnitWithoutBonuses(struct BattleUnit *bu, struct Unit *unit)
{
    InitBattleUnit(bu, unit);

    bu->unit.maxHP = unit->maxHP;
    bu->unit.pow = unit->pow;
    bu->unit.skl = unit->skl;
    bu->unit.spd = unit->spd;
    bu->unit.def = unit->def;
    bu->unit.lck = unit->lck;
    bu->unit.res = unit->res;

    bu->unit.conBonus = UNIT_CON_BASE(unit);
}

void SetBattleUnitTerrainBonuses(struct BattleUnit *bu, int terrain)
{
    bu->terrainId = terrain;

    bu->terrainAvoid      = bu->unit.pClassData->pTerrainAvoidLookup[bu->terrainId];
    bu->terrainDefense    = bu->unit.pClassData->pTerrainDefenseLookup[bu->terrainId];
    bu->terrainResistance = bu->unit.pClassData->pTerrainResistanceLookup[bu->terrainId];
}

void SetBattleUnitTerrainBonusesAuto(struct BattleUnit *bu)
{
    bu->terrainId = gBmMapTerrain[bu->unit.yPos][bu->unit.xPos];

    bu->terrainAvoid      = bu->unit.pClassData->pTerrainAvoidLookup[bu->terrainId];
    bu->terrainDefense    = bu->unit.pClassData->pTerrainDefenseLookup[bu->terrainId];
    bu->terrainResistance = bu->unit.pClassData->pTerrainResistanceLookup[bu->terrainId];
}

void SetBattleUnitWeapon(struct BattleUnit *bu, int itemSlot)
{
    if (itemSlot == BU_ISLOT_AUTO)
        itemSlot = GetUnitEquippedWeaponSlot(&bu->unit);

    if (bu->unit.state & US_IN_BALLISTA)
        itemSlot = BU_ISLOT_BALLISTA;
    
    bu->canCounter = true;

    switch (itemSlot) {
    case 0 ... 4:
        bu->weaponSlotIndex = itemSlot;
        bu->weapon = bu->unit.items[bu->weaponSlotIndex];
        break;
    
    case BU_ISLOT_OVERFLOW:
        bu->weaponSlotIndex = 0xFF;
        bu->weapon = gBmSt.inventory_item_overflow;
        break;
    
    case BU_ISLOT_ARENA_PLAYER:
        bu->weaponSlotIndex = 0;
        bu->weapon = gArenaSt.player_weapon;
        bu->canCounter = false;
        break;
    
    case BU_ISLOT_ARENA_OPPONENT:
        bu->weaponSlotIndex = 0;
        bu->weapon = gArenaSt.opponent_weapon;
        bu->canCounter = false;

        break;

    case BU_ISLOT_BALLISTA:
        bu->weaponSlotIndex = 0xFF;
        bu->weapon = GetBallistaItemAt(bu->unit.xPos, bu->unit.yPos);
        bu->canCounter = false;
        break;
    
    default:
        bu->weaponSlotIndex = 0xFF;
        bu->weapon = 0;
        bu->canCounter = false;
        break;
    }

    bu->weaponBefore = bu->weapon;
    bu->weaponAttributes = GetItemAttributes(bu->weapon);
    bu->weaponType = GetItemType(bu->weapon);

    if (!(gBattleStats.config & BATTLE_CONFIG_BIT2)) {
        if (bu->weaponAttributes & IA_MAGICDAMAGE) {
            switch (GetItemIndex(bu->weapon)) {
            case ITEM_SWORD_WINDSWORD:
                if (gBattleStats.range == 2)
                    bu->weaponType = ITYPE_ANIMA;
                else
                    bu->weaponAttributes = bu->weaponAttributes &~ IA_MAGICDAMAGE;

                break;

            case ITEM_SWORD_LIGHTBRAND:
                if (gBattleStats.range == 2)
                    bu->weaponType = ITYPE_LIGHT;
                else
                    bu->weaponAttributes = bu->weaponAttributes &~ IA_MAGICDAMAGE;

                break;

            case ITEM_SWORD_RUNESWORD:
                bu->weaponType = ITYPE_DARK;
                break;

            } // switch (GetItemIndex(bu->weapon))
        } // if (bu->weaponAttributes & IA_MAGICDAMAGE)

        if (!IsItemCoveringRange(bu->weapon, gBattleStats.range) || bu->weaponSlotIndex == 0xFF) {
            bu->weapon = 0;
            bu->canCounter = false;
        }

        if (bu->unit.statusIndex == UNIT_STATUS_SLEEP) {
            bu->weapon = 0;
            bu->canCounter = false;
        }
    }
}

void SetBattleUnitWeaponBallista(struct BattleUnit *bu)
{
    bu->weapon = GetBallistaItemAt(bu->unit.xPos, bu->unit.yPos);
    bu->weaponBefore = bu->weapon;
    bu->weaponAttributes = GetItemAttributes(bu->weapon);
    bu->weaponType = GetItemType(bu->weapon);
    bu->canCounter = false;
}

void nullsub_42()
{
    return;
}

void ComputeBattleUnitStats(struct BattleUnit *attacker, struct BattleUnit *defender)
{
    ComputeBattleUnitDefense(attacker, defender);
    ComputeBattleUnitAttack(attacker, defender);
    ComputeBattleUnitSpeed(attacker);
    ComputeBattleUnitHitRate(attacker);
    ComputeBattleUnitAvoidRate(attacker);
    ComputeBattleUnitCritRate(attacker);
    ComputeBattleUnitDodgeRate(attacker);
    ComputeBattleUnitSupportBonuses(attacker, defender);
    ComputeBattleUnitWeaponRankBonuses(attacker);
    ComputeBattleUnitStatusBonuses(attacker);
}

void ComputeBattleUnitEffectiveStats(struct BattleUnit *attacker, struct BattleUnit *defender)
{
    ComputeBattleUnitEffectiveHitRate(attacker, defender);
    ComputeBattleUnitEffectiveCritRate(attacker, defender);
    ComputeBattleUnitSilencerRate(attacker, defender);
    ComputeBattleUnitSpecialWeaponStats(attacker, defender);
}

void ComputeBattleUnitSupportBonuses(struct BattleUnit *attacker, struct BattleUnit *defender)
{
    if (!(gBattleStats.config & BATTLE_CONFIG_ARENA) || gPlaySt.chapterWeatherId) {
        struct SupportBonuses tmpBonuses;

        GetUnitSupportBonuses(&attacker->unit, &tmpBonuses);

        attacker->battleAttack    += tmpBonuses.bonus_attack;
        attacker->battleDefense   += tmpBonuses.bonus_defense;
        attacker->battleHitRate   += tmpBonuses.bonus_hit;
        attacker->battleAvoidRate += tmpBonuses.bonus_avoid;
        attacker->battleCritRate  += tmpBonuses.bonus_crit;
        attacker->battleDodgeRate += tmpBonuses.bonus_dodge;
    }
}

void ComputeBattleUnitDefense(struct BattleUnit *attacker, struct BattleUnit *defender)
{
    if (GetItemAttributes(defender->weapon) & IA_MAGICDAMAGE)
        attacker->battleDefense = attacker->terrainResistance + attacker->unit.res;
    else if (GetItemAttributes(defender->weapon) & IA_MAGIC)
        attacker->battleDefense = attacker->terrainResistance + attacker->unit.res;
    else
        attacker->battleDefense = attacker->terrainDefense + attacker->unit.def;
}

void ComputeBattleUnitBaseDefense(struct BattleUnit *bu)
{
    bu->battleDefense = bu->terrainDefense + bu->unit.def;
}

void ComputeBattleUnitAttack(struct BattleUnit *attacker, struct BattleUnit *defender)
{
    attacker->battleAttack = GetItemMight(attacker->weapon) + attacker->wTriangleDmgBonus;
    if (IsItemEffectiveAgainst(attacker->weapon, &defender->unit) == true) {
        switch (GetItemIndex(attacker->weapon)) {
        case ITEM_SWORD_DURANDAL:
        case ITEM_AXE_ARMADS:
        case ITEM_SWORD_WYRMSLAYER:
        case ITEM_ANIMA_FORBLAZE:
        case ITEM_SWORD_SOL_KATTI:
            attacker->battleAttack *= 2;
            break;

        default:
            attacker->battleAttack *= 3; 
            break;
        }
    }

    attacker->battleAttack += attacker->unit.pow;
}

void ComputeBattleUnitSpeed(struct BattleUnit *bu)
{
    int effWt = GetItemWeight(bu->weaponBefore);

    effWt -= bu->unit.conBonus;
    if (effWt < 0)
        effWt = 0;

    bu->battleSpeed = bu->unit.spd - effWt;
    if (bu->battleSpeed < 0)
        bu->battleSpeed = 0;
}

void ComputeBattleUnitHitRate(struct BattleUnit *bu)
{
    int ret;

    bu->battleHitRate = 
        bu->unit.skl * 2 +
        GetItemHit(bu->weapon) +
        bu->unit.lck / 2 +
        bu->wTriangleHitBonus;

    if (gPlaySt.unk_2B_00 == 0)
        return;

    if (gPlaySt.chapterModeIndex == 0x1)
        return;

    if (gBmSt.flags & BM_FLAG_LINKARENA)
        return;

    if (UNIT_FACTION(&bu->unit))
        return;

    if (Unk_081C8FCC[gPlaySt.unk_2B_04][gPlaySt.unk_2B_01] == bu->unit.pCharacterData->affinity) {
        ret = gPlaySt.unk2C_11 / 0xC;
        if (ret > 10)
            ret = 10;

        bu->battleHitRate += ret;
    }

    if (sub_08028620(&bu->unit))
        bu->battleHitRate += 10;
}

void ComputeBattleUnitAvoidRate(struct BattleUnit *bu)
{
    int ret;

    bu->battleAvoidRate = bu->battleSpeed * 2 + bu->terrainAvoid + (bu->unit.lck);

    if (gPlaySt.unk_2B_00 != 0 && gPlaySt.chapterModeIndex != 0x1 && !(gBmSt.flags & BM_FLAG_LINKARENA) && UNIT_FACTION(&bu->unit) == 0) {
        if (Unk_081C8FCC[gPlaySt.unk_2B_04][gPlaySt.unk_2B_01] == bu->unit.pCharacterData->affinity) {
            ret = gPlaySt.unk2C_11 / 0xC;
            if (ret > 10)
                ret = 10;

            bu->battleAvoidRate += ret;
        }

        if (sub_08028620(&bu->unit))
            bu->battleAvoidRate += 10;
    }

    if (bu->battleAvoidRate < 0)
        bu->battleAvoidRate = 0;
}

void ComputeBattleUnitCritRate(struct BattleUnit *bu)
{
    bu->battleCritRate = GetItemCrit(bu->weapon) + (bu->unit.skl / 2);

    if (UNIT_CATTRIBUTES(&bu->unit) & CA_CRITBONUS)
        bu->battleCritRate += 15;
}

void ComputeBattleUnitDodgeRate(struct BattleUnit *bu)
{
    bu->battleDodgeRate = bu->unit.lck;
}

void ComputeBattleUnitEffectiveHitRate(struct BattleUnit *attacker, struct BattleUnit *defender)
{
    attacker->battleEffectiveHitRate = attacker->battleHitRate - defender->battleAvoidRate;

    if (attacker->battleEffectiveHitRate > 100)
        attacker->battleEffectiveHitRate = 100;

    if (attacker->battleEffectiveHitRate < 0)
        attacker->battleEffectiveHitRate = 0;
}

void ComputeBattleUnitEffectiveCritRate(struct BattleUnit *attacker, struct BattleUnit *defender)
{
    int ret, item, i;

    attacker->battleEffectiveCritRate = attacker->battleCritRate - defender->battleDodgeRate;

    if (gPlaySt.unk_2B_00 != 0 && gPlaySt.chapterModeIndex != 0x1 && !(gBmSt.flags & BM_FLAG_LINKARENA) && UNIT_FACTION(&defender->unit) == 0) {
        ret = gPlaySt.unk2C_11 / 0xC;
        if (ret > 10)
            ret = 10;

        attacker->battleEffectiveCritRate -= ret;
    }

    if (attacker->battleEffectiveCritRate < 0)
        attacker->battleEffectiveCritRate = 0;

    for (i = 0; (i < UNIT_ITEM_COUNT) && (item = defender->unit.items[i]); i++) {
        if (GetItemAttributes(item) & IA_NEGATE_CRIT) {
            attacker->battleEffectiveCritRate = 0;
            break;
        }
    }
}

void ComputeBattleUnitSilencerRate(struct BattleUnit *attacker, struct BattleUnit *defender)
{
    if (!(UNIT_CATTRIBUTES(&attacker->unit) & CA_ASSASSIN)) {
        attacker->battleSilencerRate = 0;
        return;
    }

    attacker->battleSilencerRate = 50;

    if (UNIT_CATTRIBUTES(&defender->unit) & CA_BOSS)
        attacker->battleSilencerRate = 25;

    if (UNIT_CATTRIBUTES(&defender->unit) & CA_NEGATE_LETHALITY)
        attacker->battleSilencerRate = 0;
}

void ComputeBattleUnitWeaponRankBonuses(struct BattleUnit *bu)
{
    if (bu->weapon) {
        int wType = GetItemType(bu->weapon);

        if (wType < 8 && bu->unit.ranks[wType] >= WPN_EXP_S) {
            bu->battleHitRate += 5;
            bu->battleCritRate += 5;
        }
    }
}

void ComputeBattleUnitStatusBonuses(struct BattleUnit *bu) {
    switch (bu->unit.statusIndex) {

    case UNIT_STATUS_ATTACK:
        bu->battleAttack += 10;
        break;

    case UNIT_STATUS_DEFENSE:
        bu->battleDefense += 10;
        break;

    case UNIT_STATUS_CRIT:
        bu->battleCritRate += 10;
        break;

    case UNIT_STATUS_AVOID:
        bu->battleAvoidRate += 10;
        break;

    }
}

void ComputeBattleUnitSpecialWeaponStats(struct BattleUnit *attacker, struct BattleUnit *defender)
{
    if (attacker->weaponAttributes & IA_MAGICDAMAGE) {
        switch (GetItemIndex(attacker->weapon)) {
        case ITEM_SWORD_LIGHTBRAND:
        case ITEM_SWORD_RUNESWORD:
        case ITEM_SWORD_WINDSWORD:
            attacker->battleAttack -= attacker->unit.pow / 2;
            attacker->battleCritRate = 0;
            attacker->battleEffectiveCritRate = 0;
        }
        return;
    }

    if (GetItemWeaponEffect(attacker->weaponBefore) == WPN_EFFECT_HPHALVE) {
        attacker->battleAttack = (defender->unit.curHP + 1) >> 1;

        if (attacker->battleAttack == 0)
            attacker->battleAttack = 1;

        defender->battleDefense = 0;

        attacker->battleCritRate = 0;
        attacker->battleEffectiveCritRate = 0;
    }

    if (attacker->weaponAttributes & IA_NEGATE_DEFENSE)
        defender->battleDefense = 0;
}

void ClearBattleHits(void)
{
    int i;

    for (i = 0; i < BATTLE_HIT_MAX; i++) {
        gBattleHitArray[i].attributes = 0;
        gBattleHitArray[i].info = 0;
        gBattleHitArray[i].hpChange = 0;
    }

    gBattleHitIterator = gBattleHitArray;
}

void BattleUnwind(void)
{
    ClearBattleHits();

    // this do { ... } while (0); is required for match
    // which is kind of neat because it implies scrapped plans for supporting some accost kind of thing

    do {
        struct BattleUnit *attacker;
        struct BattleUnit *defender;

        BattleGetBattleUnitOrder(&attacker, &defender);

        gBattleHitIterator->info |= BATTLE_HIT_INFO_BEGIN;

        if (!BattleGenerateRoundHits(attacker, defender)) {
            gBattleHitIterator->attributes |= BATTLE_HIT_ATTR_RETALIATE;

            if (!BattleGenerateRoundHits(defender, attacker) && BattleGetFollowUpOrder(&attacker, &defender)) {
                gBattleHitIterator->attributes = BATTLE_HIT_ATTR_FOLLOWUP;

                BattleGenerateRoundHits(attacker, defender);
            }
        }
    } while (false);

    gBattleHitIterator->info |= BATTLE_HIT_INFO_END;
}

void BattleGetBattleUnitOrder(struct BattleUnit **outAttacker, struct BattleUnit **outDefender)
{
    *outAttacker = &gBattleActor;
    *outDefender = &gBattleTarget;
}

bool BattleGetFollowUpOrder(struct BattleUnit **outAttacker, struct BattleUnit **outDefender)
{
    if (gBattleTarget.battleSpeed > 250)
        return false;

    if (ABS(gBattleActor.battleSpeed - gBattleTarget.battleSpeed) < 4)
        return false;

    if (gBattleActor.battleSpeed > gBattleTarget.battleSpeed) {
        *outAttacker = &gBattleActor;
        *outDefender = &gBattleTarget;
    } else {
        *outAttacker = &gBattleTarget;
        *outDefender = &gBattleActor;
    }

    if (GetItemWeaponEffect((*outAttacker)->weaponBefore) == WPN_EFFECT_HPHALVE)
        return false;

    return true;
}

bool BattleGenerateRoundHits(struct BattleUnit *attacker, struct BattleUnit *defender)
{
    int i, count;
    u16 attrs;

    if (!attacker->weapon)
        return false;

    attrs = gBattleHitIterator->attributes;
    count = GetBattleUnitHitCount(attacker);

    for (i = 0; i < count; ++i) {
        gBattleHitIterator->attributes |= attrs;

        if (BattleGenerateHit(attacker, defender))
            return true;
    }

    return false;
}

int GetBattleUnitHitCount(struct BattleUnit *attacker)
{
    int result = 1;
    result <<= BattleCheckBraveEffect(attacker);
    return result;
}

int BattleCheckBraveEffect(struct BattleUnit *attacker)
{
    if (!(attacker->weaponAttributes & IA_BRAVE))
        return false;

    gBattleHitIterator->attributes |= BATTLE_HIT_ATTR_BRAVE;
    return true;
}

bool BattleCheckTriangleAttack(struct BattleUnit *attacker, struct BattleUnit *defender)
{
    s8 adjacentLookup[] = {
        -1,  0,
         0, -1,
        +1,  0,
         0, +1
    };

    int i, count = 0;

    int triangleAttackAttr = CA_TRIANGLEATTACK_ANY & UNIT_CATTRIBUTES(&attacker->unit);

    int x = defender->unit.xPos;
    int y = defender->unit.yPos;

    int faction = UNIT_FACTION(&attacker->unit);

    gBattleStats.taUnitA = NULL;
    gBattleStats.taUnitB = NULL;

    for (i = 0; i < 4; i++) {
        int uId = gBmMapUnit[adjacentLookup[i*2 + 1] + y][adjacentLookup[i*2 + 0] + x];
        struct Unit* unit;

        if (!uId)
            continue;

        unit = GetUnit(uId);

        if ((uId & 0xC0) != faction)
            continue;

        if (unit->statusIndex == UNIT_STATUS_SLEEP)
            continue;

        if (UNIT_CATTRIBUTES(unit) & triangleAttackAttr) {
            ++count;

            if (!gBattleStats.taUnitA)
                gBattleStats.taUnitA = unit;
            else if (!gBattleStats.taUnitB)
                gBattleStats.taUnitB = unit;
        }
    }

    return count >= 2 ? TRUE : FALSE;
}

void BattleUpdateBattleStats(struct BattleUnit *attacker, struct BattleUnit *defender)
{
    gBattleStats.attack = attacker->battleAttack;
    gBattleStats.defense = defender->battleDefense;
    gBattleStats.hitRate = attacker->battleEffectiveHitRate;
    gBattleStats.critRate = attacker->battleEffectiveCritRate;
    gBattleStats.silencerRate = attacker->battleSilencerRate;
}

void BattleGenerateHitAttributes(struct BattleUnit *attacker, struct BattleUnit *defender)
{
    short attack, defense;

    gBattleStats.damage = 0;

    if (BattleRoll2RN(gBattleStats.hitRate, TRUE) == false) {
        gBattleHitIterator->attributes |= BATTLE_HIT_ATTR_MISS;
        return;
    }

    gBattleStats.damage = gBattleStats.attack - gBattleStats.defense;

    if (BattleRoll1RN(gBattleStats.critRate, FALSE) == TRUE) {
        if (BattleRoll1RN(gBattleStats.silencerRate, FALSE) == TRUE) {
            gBattleHitIterator->attributes |= BATTLE_HIT_ATTR_SILENCER;
            gBattleStats.damage = BATTLE_MAX_DAMAGE;
        } else {
            gBattleHitIterator->attributes = gBattleHitIterator->attributes | BATTLE_HIT_ATTR_CRIT;
            gBattleStats.damage = gBattleStats.damage * 3;
        }
    }

    LIMIT_AREA(gBattleStats.damage, 0, BATTLE_MAX_DAMAGE);

    if (gBattleStats.damage != 0)
        attacker->nonZeroDamage = TRUE;
}

void BattleGenerateHitTriangleAttack(struct BattleUnit *attacker, struct BattleUnit *defender)
{
    if (!(UNIT_CATTRIBUTES(&attacker->unit) & CA_TRIANGLEATTACK_ANY))
        return;

    if (gBattleStats.range != 1)
        return;

    if (!(gBattleHitIterator->info & BATTLE_HIT_INFO_BEGIN))
        return;

    if (attacker->unit.statusIndex == UNIT_STATUS_BERSERK)
        return;

    if (gBattleStats.config & BATTLE_CONFIG_ARENA)
        return;

    if (!BattleCheckTriangleAttack(attacker, defender))
        return;

    gBattleHitIterator->attributes |= BATTLE_HIT_ATTR_TATTACK;

    gBattleStats.critRate = 100;
    gBattleStats.hitRate  = 100;
}
