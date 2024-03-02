#include "gbafe.h"

EWRAM_DATA struct BattleStats gBattleStats = {};
EWRAM_DATA struct BattleUnit gBattleActor = {};
EWRAM_DATA struct BattleUnit gBattleTarget = {};
EWRAM_DATA struct BattleHit gBattleHitArray[BATTLE_HIT_MAX] = {};
EWRAM_DATA struct BattleHit *gBattleHitIterator = 0;
EWRAM_DATA struct unk_type_0203A50C gUnk_0203A50C = {};

CONST_DATA struct WeaponTriangleRule WeaponTriangleRules[] = {
    { ITYPE_SWORD, ITYPE_LANCE, -15, -1 },
    { ITYPE_SWORD, ITYPE_AXE,   +15, +1 },

    { ITYPE_LANCE, ITYPE_AXE,   -15, -1 },
    { ITYPE_LANCE, ITYPE_SWORD, +15, +1 },

    { ITYPE_AXE,   ITYPE_SWORD, -15, -1 },
    { ITYPE_AXE,   ITYPE_LANCE, +15, +1 },

    { ITYPE_ANIMA, ITYPE_DARK,  -15, -1 },
    { ITYPE_ANIMA, ITYPE_LIGHT, +15, +1 },

    { ITYPE_LIGHT, ITYPE_ANIMA, -15, -1 },
    { ITYPE_LIGHT, ITYPE_DARK,  +15, +1 },

    { ITYPE_DARK,  ITYPE_LIGHT, -15, -1 },
    { ITYPE_DARK,  ITYPE_ANIMA, +15, +1 },

    { -1 },
};

CONST_DATA struct ProcCmd ProcScr_BattleAnimSimpleLock[] = {
    PROC_SLEEP(1),
    PROC_CALL(UpdateActorFromBattle),
    PROC_END
};

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

void BattleGenerateUiStats(struct Unit * unit, s8 itemSlot)
{
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

/**
 * battle-calc
 */

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

    if (sub_8028620(&bu->unit))
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

        if (sub_8028620(&bu->unit))
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

void BattleGenerateHitAttributes(struct BattleUnit *attacker)
{
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

void BattleGenerateHitEffects(struct BattleUnit *attacker, struct BattleUnit *defender)
{
    attacker->wexpMultiplier++;

    if (!(gBattleHitIterator->attributes & BATTLE_HIT_ATTR_MISS)) {
        switch (GetItemWeaponEffect(attacker->weapon)) {
        case WPN_EFFECT_POISON:
            defender->statusOut = UNIT_STATUS_POISON;
            gBattleHitIterator->attributes |= BATTLE_HIT_ATTR_POISON;
            break;

        case WPN_EFFECT_HPHALVE:
            gBattleHitIterator->attributes |= BATTLE_HIT_ATTR_HPHALVE;
            break;
        }

        if ((GetItemWeaponEffect(attacker->weapon) == WPN_EFFECT_DEVIL) && (BattleRoll1RN(31 - attacker->unit.lck, false))) {
            gBattleHitIterator->attributes |= BATTLE_HIT_ATTR_DEVIL;

            attacker->unit.curHP -= gBattleStats.damage;

            if (attacker->unit.curHP < 0)
                attacker->unit.curHP = 0;
        } else {
            if (gBattleStats.damage > defender->unit.curHP)
                gBattleStats.damage = defender->unit.curHP;

            defender->unit.curHP -= gBattleStats.damage;

            if (defender->unit.curHP < 0)
                defender->unit.curHP = 0;
        }

        if (GetItemWeaponEffect(attacker->weapon) == WPN_EFFECT_HPDRAIN) {
            attacker->unit.curHP += gBattleStats.damage;

            if (attacker->unit.curHP > attacker->unit.maxHP)
                attacker->unit.curHP = attacker->unit.maxHP;

            gBattleHitIterator->attributes |= BATTLE_HIT_ATTR_HPSTEAL;
        }
    }

    gBattleHitIterator->hpChange = gBattleStats.damage;

    if (!(gBattleHitIterator->attributes & BATTLE_HIT_ATTR_MISS) || attacker->weaponAttributes & (IA_UNCOUNTERABLE | IA_MAGIC)) {
        attacker->weapon = GetItemAfterUse(attacker->weapon);

        if (!attacker->weapon)
            attacker->weaponBroke = true;
    }
}

bool BattleGenerateHit(struct BattleUnit *attacker, struct BattleUnit *defender)
{
    if (attacker == &gBattleTarget)
        gBattleHitIterator->info |= BATTLE_HIT_INFO_RETALIATION;

    BattleUpdateBattleStats(attacker, defender);

    BattleGenerateHitTriangleAttack(attacker, defender);
    BattleGenerateHitAttributes(attacker);
    BattleGenerateHitEffects(attacker, defender);

    if (attacker->unit.curHP == 0 || defender->unit.curHP == 0) {
        attacker->wexpMultiplier++;

        gBattleHitIterator->info |= BATTLE_HIT_INFO_FINISHES;

        if (gBattleTarget.unit.curHP == 0)
        	gBattleHitIterator->info |= BATTLE_HIT_INFO_KILLS_TARGET;

        gBattleHitIterator++;
        return true;
    }

    gBattleHitIterator++;
    return false;
}

/**
 * battle-lvup
 */

void BattleApplyExpGains(void)
{
    if ((UNIT_FACTION(&gBattleActor.unit) != FACTION_BLUE) || (UNIT_FACTION(&gBattleTarget.unit) != FACTION_BLUE)) {
        if (!(gPlaySt.chapterStateBits & PLAY_FLAG_EXTRA_MAP)) {
            gBattleActor.expGain  = GetBattleUnitExpGain(&gBattleActor, &gBattleTarget);
            gBattleTarget.expGain = GetBattleUnitExpGain(&gBattleTarget, &gBattleActor);

            gBattleActor.unit.exp  += gBattleActor.expGain;
            gBattleTarget.unit.exp += gBattleTarget.expGain;

            CheckBattleUnitLevelUp(&gBattleActor);
            CheckBattleUnitLevelUp(&gBattleTarget);
        }
    }
}

int GetStatIncrease(int growth) {
    int result = 0;

    while (growth > 100) {
        result++;
        growth -= 100;
    }

    if (RandRoll(growth))
        result++;

    return result;
}

int GetAutoleveledStatIncrease(int growth, int levels)
{
    return GetStatIncrease(growth * levels + (RandNext(growth * levels / 4) - growth * levels / 8));
}

bool CanBattleUnitGainLevels(struct BattleUnit *bu)
{
    if (gBmSt.flags & BM_FLAG_LINKARENA)
        return true;

    if (bu->unit.exp == UNIT_EXP_DISABLED)
        return false;

    if (UNIT_FACTION(&bu->unit) != FACTION_BLUE)
        return false;

    return true;
}

void CheckBattleUnitLevelUp(struct BattleUnit* bu) {
    if (CanBattleUnitGainLevels(bu) && bu->unit.exp >= 100) {
        int growthBonus, statGainTotal;

        bu->unit.exp -= 100;
        bu->unit.level++;

        if (bu->unit.level == UNIT_LEVEL_MAX) {
            bu->expGain -= bu->unit.exp;
            bu->unit.exp = UNIT_EXP_DISABLED;
        }

        growthBonus = (bu->unit.state & US_GROWTH_BOOST) ? 5: 0;
        statGainTotal = 0;

        bu->changeHP  = GetStatIncrease(bu->unit.pCharacterData->growthHP + growthBonus);
        statGainTotal += bu->changeHP;

        bu->changePow = GetStatIncrease(bu->unit.pCharacterData->growthPow + growthBonus);
        statGainTotal += bu->changePow;

        bu->changeSkl = GetStatIncrease(bu->unit.pCharacterData->growthSkl + growthBonus);
        statGainTotal += bu->changeSkl;

        bu->changeSpd = GetStatIncrease(bu->unit.pCharacterData->growthSpd + growthBonus);
        statGainTotal += bu->changeSpd;

        bu->changeDef = GetStatIncrease(bu->unit.pCharacterData->growthDef + growthBonus);
        statGainTotal += bu->changeDef;

        bu->changeRes = GetStatIncrease(bu->unit.pCharacterData->growthRes + growthBonus);
        statGainTotal += bu->changeRes;

        bu->changeLck = GetStatIncrease(bu->unit.pCharacterData->growthLck + growthBonus);
        statGainTotal += bu->changeLck;

        if (statGainTotal == 0) {
            for (statGainTotal = 0; statGainTotal < 2; ++statGainTotal) {
                bu->changeHP = GetStatIncrease(bu->unit.pCharacterData->growthHP);

                if (bu->changeHP)
                    break;

                bu->changePow = GetStatIncrease(bu->unit.pCharacterData->growthPow);

                if (bu->changePow)
                    break;

                bu->changeSkl = GetStatIncrease(bu->unit.pCharacterData->growthSkl);

                if (bu->changeSkl)
                    break;

                bu->changeSpd = GetStatIncrease(bu->unit.pCharacterData->growthSpd);

                if (bu->changeSpd)
                    break;

                bu->changeDef = GetStatIncrease(bu->unit.pCharacterData->growthDef);

                if (bu->changeDef)
                    break;

                bu->changeRes = GetStatIncrease(bu->unit.pCharacterData->growthRes);

                if (bu->changeRes)
                    break;

                bu->changeLck = GetStatIncrease(bu->unit.pCharacterData->growthLck);

                if (bu->changeLck)
                    break;
            }
        }

        CheckBattleUnitStatCaps(GetUnit(bu->unit.index), bu);
    }
}

void UnitPromote(struct Unit *unit)
{
    const struct ClassData *promotedClass = GetClassData(unit->pClassData->promotion);

    int baseClassId = unit->pClassData->number;
    int promClassId = promotedClass->number;

    int i;

    // Apply stat ups

    unit->maxHP += promotedClass->promotionHp;

    if (unit->maxHP > promotedClass->maxHP)
        unit->maxHP = promotedClass->maxHP;

    unit->pow += promotedClass->promotionPow;

    if (unit->pow > promotedClass->maxPow)
        unit->pow = promotedClass->maxPow;

    unit->skl += promotedClass->promotionSkl;

    if (unit->skl > promotedClass->maxSkl)
        unit->skl = promotedClass->maxSkl;

    unit->spd += promotedClass->promotionSpd;

    if (unit->spd > promotedClass->maxSpd)
        unit->spd = promotedClass->maxSpd;

    unit->def += promotedClass->promotionDef;

    if (unit->def > promotedClass->maxDef)
        unit->def = promotedClass->maxDef;

    unit->res += promotedClass->promotionRes;

    if (unit->res > promotedClass->maxRes)
        unit->res = promotedClass->maxRes;

    // Remove base class' base wexp from unit wexp
    for (i = 0; i < 8; ++i)
        unit->ranks[i] -= unit->pClassData->baseRanks[i];

    // Update unit class
    unit->pClassData = promotedClass;

    // Add promoted class' base wexp to unit wexp
    for (i = 0; i < 8; i++) {
        int wexp = unit->ranks[i];

        wexp += unit->pClassData->baseRanks[i];

        if (wexp > WPN_EXP_S)
            wexp = WPN_EXP_S;

        unit->ranks[i] = wexp;
    }

    unit->level = 1;
    unit->exp   = 0;
}

void GenerateBattleUnitStatGainsComparatively(struct BattleUnit *bu, struct Unit *unit)
{
    bu->changeHP  = bu->unit.maxHP - unit->maxHP;
    bu->changePow = bu->unit.pow   - unit->pow;
    bu->changeSkl = bu->unit.skl   - unit->skl;
    bu->changeSpd = bu->unit.spd   - unit->spd;
    bu->changeDef = bu->unit.def   - unit->def;
    bu->changeRes = bu->unit.res   - unit->res;
    bu->changeLck = bu->unit.lck   - unit->lck;
    bu->changeCon = bu->unit.conBonus - unit->conBonus;
}

void CheckBattleUnitStatCaps(struct Unit *unit, struct BattleUnit *bu)
{
    if ((unit->maxHP + bu->changeHP) > UNIT_MHP_MAX(unit))
        bu->changeHP = UNIT_MHP_MAX(unit) - unit->maxHP;

    if ((unit->pow + bu->changePow) > UNIT_POW_MAX(unit))
        bu->changePow = UNIT_POW_MAX(unit) - unit->pow;

    if ((unit->skl + bu->changeSkl) > UNIT_SKL_MAX(unit))
        bu->changeSkl = UNIT_SKL_MAX(unit) - unit->skl;

    if ((unit->spd + bu->changeSpd) > UNIT_SPD_MAX(unit))
        bu->changeSpd = UNIT_SPD_MAX(unit) - unit->spd;

    if ((unit->def + bu->changeDef) > UNIT_DEF_MAX(unit))
        bu->changeDef = UNIT_DEF_MAX(unit) - unit->def;

    if ((unit->res + bu->changeRes) > UNIT_RES_MAX(unit))
        bu->changeRes = UNIT_RES_MAX(unit) - unit->res;

    if ((unit->lck + bu->changeLck) > UNIT_LCK_MAX(unit))
        bu->changeLck = UNIT_LCK_MAX(unit) - unit->lck;
}

void BattleApplyUnitUpdates(void)
{
    struct Unit *actor  = GetUnit(gBattleActor.unit.index);
    struct Unit *target = GetUnit(gBattleTarget.unit.index);

    if (gBattleActor.canCounter)
        gBattleActor.unit.items[gBattleActor.weaponSlotIndex] = gBattleActor.weapon;

    if (gBattleTarget.canCounter)
        gBattleTarget.unit.items[gBattleTarget.weaponSlotIndex] = gBattleTarget.weapon;

    UpdateUnitFromBattle(actor, &gBattleActor);

    if (target)
        UpdateUnitFromBattle(target, &gBattleTarget);
    else
        UpdateObstacleFromBattle(&gBattleTarget);
}

bool sub_8029FA8(void)
{
    return true;
}

int GetBattleUnitUpdatedWeaponExp(struct BattleUnit* bu)
{
    int i, result;

    if (UNIT_FACTION(&bu->unit) != FACTION_BLUE)
        return -1;

    if (bu->unit.curHP == 0)
        return -1;
    
    if (gPlaySt.chapterStateBits & PLAY_FLAG_EXTRA_MAP)
        return -1;
    
    if (gBmSt.flags & BM_FLAG_LINKARENA)
        return -1;
    
    if (!(gBattleStats.config & BATTLE_CONFIG_ARENA)) {
        if (!bu->canCounter)
            return -1;

        if (!(bu->weaponAttributes & IA_REQUIRES_WEXP))
            return -1;

        if (bu->weaponAttributes & (IA_MAGICDAMAGE | IA_LOCK_3))
            return -1;
    }

    result = bu->unit.ranks[bu->weaponType];
    result += GetItemAwardedExp(bu->weapon) * bu->wexpMultiplier;

    for (i = 0; i < 8; ++i) {
        if (i == bu->weaponType)
            continue;

        if (bu->unit.pClassData->baseRanks[i] == WPN_EXP_S)
            continue;

        if (bu->unit.ranks[i] < WPN_EXP_S)
            continue;

        if (result >= WPN_EXP_S)
            result = (WPN_EXP_S - 1);

        break;
    }

    if (UNIT_CATTRIBUTES(&bu->unit) & CA_PROMOTED) {
        if (result > WPN_EXP_S)
            result = WPN_EXP_S;
    } else {
        if (result > WPN_EXP_A)
            result = WPN_EXP_A;
    }

    return result;
}

bool HasBattleUnitGainedWeaponLevel(struct BattleUnit *bu)
{
    int oldWexp = bu->unit.ranks[bu->weaponType];
    int newWexp = GetBattleUnitUpdatedWeaponExp(bu);

    if (newWexp < 0)
        return false;

    return GetWeaponLevelFromExp(oldWexp) != GetWeaponLevelFromExp(newWexp);
}

void UpdateUnitFromBattle(struct Unit *unit, struct BattleUnit *bu)
{
    int tmp;

    unit->level = bu->unit.level;
    unit->exp   = bu->unit.exp;
    unit->curHP = bu->unit.curHP;
    unit->state = bu->unit.state;

    gArenaLevelBackup = UNIT_ARENA_LEVEL(unit);

    if (bu->statusOut >= 0)
        SetUnitStatus(unit, bu->statusOut);

    unit->maxHP += bu->changeHP;
    unit->pow   += bu->changePow;
    unit->skl   += bu->changeSkl;
    unit->spd   += bu->changeSpd;
    unit->def   += bu->changeDef;
    unit->res   += bu->changeRes;
    unit->lck   += bu->changeLck;

    UnitCheckStatCaps(unit);

    tmp = GetBattleUnitUpdatedWeaponExp(bu);

    if (tmp > 0)
        unit->ranks[bu->weaponType] = tmp;

    for (tmp = 0; tmp < UNIT_ITEM_COUNT; ++tmp)
        unit->items[tmp] = bu->unit.items[tmp];

    UnitRemoveInvalidItems(unit);

    if (bu->expGain)
        PidStatsAddExpGained(unit->pCharacterData->number, bu->expGain);
}

void UpdateUnitDuringBattle(struct Unit *unit, struct BattleUnit *bu)
{
    int wexp;

    unit->curHP = bu->unit.curHP;

    wexp = GetBattleUnitUpdatedWeaponExp(bu);

    if (wexp > 0)
        unit->ranks[bu->weaponType] = wexp;
}

void BattleApplyBallistaUpdates(void)
{
    if (gBattleStats.config & BATTLE_CONFIG_BALLISTA) {
        int uses = GetItemUses(gBattleActor.weapon);
        GetTrap(gBattleActor.unit.ballistaIndex)->data[2] = uses;
    }
}

void sub_802A21C(void)
{
    gUnk_0203A50C.unk00 = 0;
    gUnk_0203A50C.unk01 = 0;
    gUnk_0203A50C.unk02 = 0;
}

int GetUnitExpLevel(struct Unit *unit)
{
    int result = unit->level;

    if (UNIT_CATTRIBUTES(unit) & CA_PROMOTED)
        result += 20;

    return result;
}

int GetUnitRoundExp(struct Unit *actor, struct Unit *target)
{
    int expLevel;

    expLevel = GetUnitExpLevel(actor);
    expLevel = expLevel - GetUnitExpLevel(target);
    expLevel = 31 - expLevel;

    if (expLevel < 0)
        expLevel = 0;

    return expLevel / actor->pClassData->classRelativePower;
}

int GetUnitPowerLevel(struct Unit *unit)
{
    int result = unit->level * unit->pClassData->classRelativePower;

    if (UNIT_CATTRIBUTES(unit) & CA_PROMOTED)
        result = result + 20 * GetClassData(unit->pClassData->promotion)->classRelativePower;

    return result;
}

int GetUnitClassKillExpBonus(struct Unit* actor, struct Unit* target) {
    int result = 0;

    if (UNIT_CATTRIBUTES(target) & CA_THIEF)
        result += 20;

    if (UNIT_CATTRIBUTES(target) & CA_BOSS)
        result += 40;

    return result;
}

int GetUnitExpMultiplier(struct Unit* actor, struct Unit* target) {
    int i;

    if (!(UNIT_CATTRIBUTES(actor) & CA_ASSASSIN))
        return 1;

    for (i = 0; i < BATTLE_HIT_MAX; ++i)
        if (gBattleHitArray[i].attributes & BATTLE_HIT_ATTR_SILENCER)
            return 2;

    return 1;
}

int GetUnitKillExpBonus(struct Unit* actor, struct Unit* target) {
    int result;

    if (target->curHP != 0)
        return 0;

    result = 20;

    // TODO: All the definitions
    if ((gPlaySt.chapterModeIndex == 1) || (gPlaySt.chapterStateBits & PLAY_FLAG_HARD)) {
        result = GetUnitPowerLevel(target);

        result += 20;
        result -= GetUnitPowerLevel(actor);
    } else {
        int local = GetUnitPowerLevel(target);

        if (local <= GetUnitPowerLevel(actor))
            local = GetUnitPowerLevel(target) - GetUnitPowerLevel(actor) / 2;
        else
            local = GetUnitPowerLevel(target) - GetUnitPowerLevel(actor);

        result += local;
    }

    result += GetUnitClassKillExpBonus(actor, target);
    result *= GetUnitExpMultiplier(actor, target);

    if (result < 0)
        result = 0;

    return result;
}

int GetBattleUnitExpGain(struct BattleUnit *actor, struct BattleUnit *target)
{
    int result;

    if (!CanBattleUnitGainLevels(actor) || (actor->unit.curHP == 0) || UNIT_CATTRIBUTES(&target->unit) & CA_NEGATE_LETHALITY)
        return 0;

    if (!actor->nonZeroDamage)
        return 1;

    result = GetUnitRoundExp(&actor->unit, &target->unit);
    result += GetUnitKillExpBonus(&actor->unit, &target->unit);

    if (result > 100)
        result = 100;

    if (result < 0)
        result = 0;

    return result;
}

void BattleApplyItemExpGains(void)
{
    if (!(gPlaySt.chapterStateBits & PLAY_FLAG_EXTRA_MAP)) {
        if (gBattleActor.weaponAttributes & IA_STAFF) {
            if (UNIT_FACTION(&gBattleActor.unit) == FACTION_BLUE)
                gBattleActor.wexpMultiplier++;

            gBattleActor.expGain = GetBattleUnitStaffExp(&gBattleActor);
            gBattleActor.unit.exp += gBattleActor.expGain;

            CheckBattleUnitLevelUp(&gBattleActor);
        } else if ((gBattleActor.weaponType == ITYPE_12) && (gBattleActor.unit.exp != UNIT_EXP_DISABLED)) {
            gBattleActor.expGain = 20;
            gBattleActor.unit.exp += 20;

            CheckBattleUnitLevelUp(&gBattleActor);
        }
    }
}

int GetBattleUnitStaffExp(struct BattleUnit *bu)
{
    int result;

    if (!CanBattleUnitGainLevels(bu))
        return 0;

    if (gBattleHitArray->attributes & BATTLE_HIT_ATTR_MISS)
        return 1;

    result = 10 + GetItemCostPerUse(bu->weapon) / 20;

    if (UNIT_CATTRIBUTES(&bu->unit) & CA_PROMOTED)
        result = result / 2;

    if (result > 100)
        result = 100;

    return result;
}

void BattleApplyMiscActionExpGains(void)
{
    if (UNIT_FACTION(&gBattleActor.unit) != FACTION_BLUE)
        return;

    if (!CanBattleUnitGainLevels(&gBattleActor))
        return;

    if (gPlaySt.chapterStateBits & PLAY_FLAG_EXTRA_MAP)
        return;

    gBattleActor.expGain = 10;
    gBattleActor.unit.exp += 10;

    CheckBattleUnitLevelUp(&gBattleActor);
}

void BattleUnitTargetSetEquippedWeapon(struct BattleUnit *bu)
{
    int i;

    if (bu->weaponBefore)
        return;

    bu->weaponBefore = GetUnitEquippedWeapon(&bu->unit);

    if (bu->weaponBefore)
        return;

    if (!UnitHasMagicRank(&bu->unit))
        return;

    for (i = 0; i < UNIT_ITEM_COUNT; ++i) {
        if (CanUnitUseStaff(&bu->unit, bu->unit.items[i]) == TRUE) {
            bu->weaponBefore = bu->unit.items[i];
            break;
        }
    }
}

void BattleUnitTargetCheckCanCounter(struct BattleUnit *bu)
{
    if (!bu->canCounter) {
        bu->battleAttack = 0xFF;
        bu->battleHitRate = 0xFF;
        bu->battleEffectiveHitRate = 0xFF;
        bu->battleCritRate = 0xFF;
        bu->battleEffectiveCritRate = 0xFF;
    }
}

void BattleApplyReaverEffect(struct BattleUnit *attacker, struct BattleUnit *defender)
{
    if (!(attacker->weaponAttributes & IA_REVERTTRIANGLE) || !(defender->weaponAttributes & IA_REVERTTRIANGLE)) {
        attacker->wTriangleHitBonus = -(attacker->wTriangleHitBonus * 2);
        attacker->wTriangleDmgBonus = -(attacker->wTriangleDmgBonus * 2);
        defender->wTriangleHitBonus = -(defender->wTriangleHitBonus * 2);
        defender->wTriangleDmgBonus = -(defender->wTriangleDmgBonus * 2);
    }
}

void BattleApplyWeaponTriangleEffect(struct BattleUnit* attacker, struct BattleUnit* defender)
{
    const struct WeaponTriangleRule* it;

    for (it = WeaponTriangleRules; it->attackerWeaponType >= 0; ++it) {
        if ((attacker->weaponType == it->attackerWeaponType) && (defender->weaponType == it->defenderWeaponType)) {
            attacker->wTriangleHitBonus = it->hitBonus;
            attacker->wTriangleDmgBonus = it->atkBonus;

            defender->wTriangleHitBonus = -it->hitBonus;
            defender->wTriangleDmgBonus = -it->atkBonus;

            break;
        }
    }

    if (attacker->weaponAttributes & IA_REVERTTRIANGLE)
        BattleApplyReaverEffect(attacker, defender);

    if (defender->weaponAttributes & IA_REVERTTRIANGLE)
        BattleApplyReaverEffect(attacker, defender);
}

void BattleInitTargetCanCounter(void)
{
    // Target cannot counter if either units are using "uncounterable" weapons

    if ((gBattleActor.weaponAttributes | gBattleTarget.weaponAttributes) & IA_UNCOUNTERABLE) {
        gBattleTarget.weapon = 0;
        gBattleTarget.canCounter = FALSE;
    }

    // Target cannot counter if a berserked player unit is attacking another player unit

    if (gBattleActor.unit.statusIndex == UNIT_STATUS_BERSERK) {
        if ((UNIT_FACTION(&gBattleActor.unit) == FACTION_BLUE) && (UNIT_FACTION(&gBattleTarget.unit) == FACTION_BLUE)) {
            gBattleTarget.weapon = 0;
            gBattleTarget.canCounter = FALSE;
        }
    }
}

void InitObstacleBattleUnit(void) {
    ClearUnit(&gBattleTarget.unit);

    gBattleTarget.unit.index = 0;

    gBattleTarget.unit.pClassData = GetClassData(CLASS_OBSTACLE);

    gBattleTarget.unit.maxHP = GetROMChapterStruct(gPlaySt.chapterIndex)->mapCrackedWallHeath;
    gBattleTarget.unit.curHP = gActionSt.extra; // TODO: better

    gBattleTarget.unit.xPos  = gActionSt.x_target;
    gBattleTarget.unit.yPos  = gActionSt.y_target;

    switch (gBmMapTerrain[gBattleTarget.unit.yPos][gBattleTarget.unit.xPos]) {

    case TERRAIN_WALL_BREAKABLE:
        gBattleTarget.unit.pCharacterData = GetCharacterData(CHARACTER_WALL);

        break;

    case TERRAIN_SNAG:
        gBattleTarget.unit.pCharacterData = GetCharacterData(CHARACTER_SNAG);
        gBattleTarget.unit.maxHP = 20;

        break;

    } // switch
}

void ComputeBattleObstacleStats(void)
{
    gBattleActor.battleEffectiveHitRate = 100;
    gBattleActor.battleEffectiveCritRate = 0;

    gBattleTarget.battleSpeed = 0xFF;
    gBattleTarget.hpInitial = gBattleTarget.unit.curHP;

    gBattleTarget.wTriangleHitBonus = 0;
    gBattleTarget.wTriangleDmgBonus = 0;
}

void UpdateObstacleFromBattle(struct BattleUnit *bu)
{
    struct Trap *trap = GetTrapAt(bu->unit.xPos, bu->unit.yPos);

    if (!trap)
        trap = GetTrapAt(bu->unit.xPos, bu->unit.yPos - 1);

    trap->extra = bu->unit.curHP;

    if (trap->extra == 0) {
        int mapChangeId = GetMapChangeIdAt(trap->xPos, trap->yPos);

        if (gBmMapTerrain[bu->unit.yPos][bu->unit.xPos] == TERRAIN_SNAG)
            PlaySoundEffect(0x2D7);

        RenderMapForFade();
        ApplyMapChange(mapChangeId);
        trap->type = TRAP_NONE;
        AddMapChangeTrap(mapChangeId);
        RefreshTerrainMap();
        RenderMap();
        StartMapFade(false);
    }
}

void BeginBattleAnimations(void)
{
    TmFill(gBg2Tm, 0);
    EnableBgSync(1 << 2);

    gPal[0] = 0;
    EnablePalSync();

    RenderMap();

    if (SetupBanim()) {
        SetBanimLinkArenaFlag(0);
        BeginAnimsOnBattleAnimations();
    } else {
        MU_EndAll();
        RenderMap();
        StartBattleManim();

        gBattleStats.config |= BATTLE_CONFIG_MAPANIMS;
    }
}

int GetUnitSoloBattleAnimType(struct Unit *unit)
{
    // TODO: battle anim type constants

    if (unit->state & US_SOLOANIM_1)
        return 0;

    if (unit->state & US_SOLOANIM_2)
        return 3;

    return 1;
}

int GetBattleAnimType(void)
{
    // TODO: battle anim type constants

    // If not solo anim, return global type
    if (gPlaySt.cfgAnimationType != 2)
        return gPlaySt.cfgAnimationType;

    // If both units are players, use actor solo anim type
    if (UNIT_FACTION(&gBattleActor.unit) == FACTION_BLUE)
        if (UNIT_FACTION(&gBattleTarget.unit) == FACTION_BLUE)
            return GetUnitSoloBattleAnimType(&gBattleActor.unit);

    // If neither are players, return 1
    if (UNIT_FACTION(&gBattleActor.unit) != FACTION_BLUE)
        if (UNIT_FACTION(&gBattleTarget.unit) != FACTION_BLUE)
            return 1;

    // Return solo anim type for the one that is a player unit
    if (UNIT_FACTION(&gBattleActor.unit) == FACTION_BLUE)
        return GetUnitSoloBattleAnimType(&gBattleActor.unit);
    else
        return GetUnitSoloBattleAnimType(&gBattleTarget.unit);
}

void BattlePrintDebugUnitInfo(struct BattleUnit *actor, struct BattleUnit *target)
{
    // prints battle unit information to debug output
    return;
}

void BattlePrintDebugHitInfo(void)
{
    struct BattleHit* it;

    for (it = gBattleHitArray; !(it->info & BATTLE_HIT_INFO_END); ++it) {
        // prints battle rounds information to debug output
    }
}

void BattleInitItemEffect(struct Unit *actor, int itemSlot)
{
    int item = actor->items[itemSlot];

    if (itemSlot < 0)
        item = 0;

    gBattleStats.config = 0;

    InitBattleUnit(&gBattleActor, actor);

    SetBattleUnitTerrainBonusesAuto(&gBattleActor);
    ComputeBattleUnitBaseDefense(&gBattleActor);
    ComputeBattleUnitSupportBonuses(&gBattleActor, NULL);

    gBattleActor.battleAttack = 0xFF;
    gBattleActor.battleEffectiveHitRate = 100;
    gBattleActor.battleEffectiveCritRate = 0xFF;

    gBattleActor.weapon = item;
    gBattleActor.weaponBefore = item;
    gBattleActor.weaponSlotIndex = itemSlot;
    gBattleActor.weaponType = GetItemType(item);
    gBattleActor.weaponAttributes = GetItemAttributes(item);

    gBattleActor.canCounter = TRUE;
    gBattleActor.hasItemEffectTarget = FALSE;

    gBattleActor.statusOut = -1;
    gBattleTarget.statusOut = -1;

    ClearBattleHits();
}

void BattleInitItemEffectTarget(struct Unit *unit)
{
    InitBattleUnit(&gBattleTarget, unit);

    SetBattleUnitTerrainBonusesAuto(&gBattleTarget);
    ComputeBattleUnitBaseDefense(&gBattleTarget);
    ComputeBattleUnitSupportBonuses(&gBattleTarget, NULL);

    gBattleTarget.battleAttack = 0xFF;
    gBattleTarget.battleEffectiveHitRate = 0xFF;
    gBattleTarget.battleEffectiveCritRate = 0xFF;

    gBattleTarget.weaponBefore = 0;

    BattleUnitTargetSetEquippedWeapon(&gBattleTarget);

    gBattleActor.hasItemEffectTarget = TRUE;
}

void UpdateActorFromBattle(void)
{
    UpdateUnitFromBattle(GetUnit(gBattleActor.unit.index), &gBattleActor);
}

void BattleApplyMiscAction(ProcPtr proc)
{
    BattleApplyMiscActionExpGains();
    Proc_StartBlocking(ProcScr_BattleAnimSimpleLock, proc);
}

void BattleApplyItemEffect(ProcPtr proc)
{
    (++gBattleHitIterator)->info = BATTLE_HIT_INFO_END;

    BattleApplyItemExpGains();

    if (gBattleActor.canCounter) {
        if (GetItemAttributes(gBattleActor.weapon) & IA_STAFF)
            gBattleActor.weaponBroke = TRUE;

        gBattleActor.weapon = GetItemAfterUse(gBattleActor.weapon);
        gBattleActor.unit.items[gBattleActor.weaponSlotIndex] = gBattleActor.weapon;

        if (gBattleActor.weapon)
            gBattleActor.weaponBroke = FALSE;
    }

    Proc_StartBlocking(ProcScr_BattleAnimSimpleLock, proc);
}

int GetOffensiveStaffAccuracy(struct Unit *actor, struct Unit *target)
{
    int baseAccuracy = (GetUnitPower(actor) - GetUnitResistance(target)) * 5;
    int unitSkill = GetUnitSkill(actor);
    int distance = RECT_DISTANCE(actor->xPos, actor->yPos, target->xPos, target->yPos);

    int result = baseAccuracy + 30 + unitSkill - distance * 2;

    if (target->pClassData->number == 0x46)
        return 0;
    
    if (target->pClassData->number == 0x45)
        return 0;

    if (result < 0)
        result = 0;

    if (result > 100)
        result = 100;

    return result;
}

void BattleGenerateArena(struct Unit* actor)
{
    struct Unit* target = gArenaSt.opponent;
    int something = gBmSt.just_resumed;

    gBattleStats.config = BATTLE_CONFIG_REAL | BATTLE_CONFIG_ARENA;

    InitBattleUnit(&gBattleActor, actor);
    InitBattleUnit(&gBattleTarget, target);

    if (gActionSt.extra) {
        gBattleTarget.unit.curHP = gActionSt.extra;
        gBattleTarget.hpInitial = gActionSt.extra;
    }

    gBattleStats.range = gArenaSt.range;

    gBattleTarget.unit.xPos = gBattleActor.unit.xPos + gArenaSt.range;
    gBattleTarget.unit.yPos = gBattleActor.unit.yPos;

    SetBattleUnitWeapon(&gBattleActor, BU_ISLOT_ARENA_PLAYER);
    SetBattleUnitWeapon(&gBattleTarget, BU_ISLOT_ARENA_OPPONENT);

    BattleApplyWeaponTriangleEffect(&gBattleActor, &gBattleTarget);

    gActionSt.suspend_point = SUSPEND_POINT_DURING_ARENA;
    WriteSuspendSave(0x3);

    SetBattleUnitTerrainBonusesAuto(&gBattleActor);
    SetBattleUnitTerrainBonuses(&gBattleTarget, 8); // TODO: terrain id constants

    BattleGenerate(actor, target);

    if (gBattleTarget.unit.curHP == 0)
        BattleApplyExpGains();

    UpdateUnitDuringBattle(actor, &gBattleActor);

    if (!something || (gBattleTarget.unit.curHP == 0)) {
        PidStatsRecordBattleResult();

        actor->state = (actor->state &~ (US_BIT17 | US_BIT18 | US_BIT19))
            + ((((UNIT_ARENA_LEVEL(actor) + 1) <= 7) ? (UNIT_ARENA_LEVEL(actor) + 1) << 17 : 7 << 17));

        gArenaLevelBackup = UNIT_ARENA_LEVEL(actor);
    }

    BattlePrintDebugUnitInfo(&gBattleActor, &gBattleTarget);
}

bool BattleIsTriangleAttack(void)
{
    return (gBattleHitArray->attributes & BATTLE_HIT_ATTR_TATTACK) != 0;
}

bool DidBattleUnitBreakWeapon(struct BattleUnit *bu)
{
    if (bu->unit.curHP == 0)
        return FALSE;

    return bu->weaponBroke;
}

void SetScriptedBattle(struct BattleHit *hits)
{
    gActionSt.battle_scr = hits;
}

void BattleGenerateHitScriptedDamage(struct BattleUnit *bu)
{
    gBattleStats.damage = 0;

    if (!(gBattleHitIterator->attributes & BATTLE_HIT_ATTR_MISS)) {
        gBattleStats.damage = gBattleStats.attack - gBattleStats.defense;
        if (gBattleHitIterator->attributes & BATTLE_HIT_ATTR_CRIT)
            gBattleStats.damage = 3 * gBattleStats.damage;

        if (gBattleStats.damage > BATTLE_MAX_DAMAGE)
            gBattleStats.damage = BATTLE_MAX_DAMAGE;

        if (gBattleStats.damage < 0)
            gBattleStats.damage = 0;

        if (gBattleStats.damage != 0)
            bu->nonZeroDamage = TRUE;
    }
}

void BattleUnwindScripted(void)
{
    struct BattleUnit *attacker;
    struct BattleUnit *defender;

    struct BattleHit *itIn;
    struct BattleHit *itOut;

    itIn = gActionSt.battle_scr;
    itOut = gBattleHitArray;

    while (!(itIn->info & BATTLE_HIT_INFO_END))
        *itOut++ = *itIn++;

    *itOut = *itIn;

    for (gBattleHitIterator = gBattleHitArray; !(gBattleHitIterator->info & BATTLE_HIT_INFO_END); ++gBattleHitIterator) {
        if (gBattleHitIterator->info & BATTLE_HIT_INFO_RETALIATION) {
            attacker = &gBattleTarget;
            defender = &gBattleActor;
        } else {
            attacker = &gBattleActor;
            defender = &gBattleTarget;
        }

        BattleUpdateBattleStats(attacker, defender);
        BattleGenerateHitScriptedDamage(attacker);
        BattleGenerateHitEffects(attacker, defender);

        if ((attacker->unit.curHP == 0) || (defender->unit.curHP == 0)) {
            attacker->wexpMultiplier++;

            gBattleHitIterator->info |= BATTLE_HIT_INFO_FINISHES;

            if (gBattleTarget.unit.curHP == 0)
                gBattleHitIterator->info |= BATTLE_HIT_INFO_KILLS_TARGET;

            (gBattleHitIterator + 1)->info = BATTLE_HIT_INFO_END;

            break;
        }
    }

    gActionSt.battle_scr = NULL;
}

void UnitLevelUp(struct Unit *unit)
{
    if (unit->level != 20) {
        int hpGain, powGain, sklGain, spdGain, defGain, resGain, lckGain;
        int growthBonus;
        int totalGain;

        unit->exp = 0;
        unit->level++;

        if (unit->level == 20 || unit->pCharacterData->number == CHARACTER_28)
            unit->exp = UNIT_EXP_DISABLED;

        growthBonus = (unit->state & US_GROWTH_BOOST) ? 5: 0;
        totalGain = 0;

        hpGain  = GetStatIncrease(growthBonus + unit->pCharacterData->growthHP);
        totalGain += hpGain;

        powGain = GetStatIncrease(growthBonus + unit->pCharacterData->growthPow);
        totalGain += powGain;

        sklGain = GetStatIncrease(growthBonus + unit->pCharacterData->growthSkl);
        totalGain += sklGain;

        spdGain = GetStatIncrease(growthBonus + unit->pCharacterData->growthSpd);
        totalGain += spdGain;

        defGain = GetStatIncrease(growthBonus + unit->pCharacterData->growthDef);
        totalGain += defGain;

        resGain = GetStatIncrease(growthBonus + unit->pCharacterData->growthRes);
        totalGain += resGain;

        lckGain = GetStatIncrease(growthBonus + unit->pCharacterData->growthLck);
        totalGain += lckGain;

        if (totalGain == 0) {
            for (totalGain = 0; totalGain < 2; ++totalGain) {
                hpGain = GetStatIncrease(unit->pCharacterData->growthHP);

                if (hpGain)
                    break;

                powGain = GetStatIncrease(unit->pCharacterData->growthPow);

                if (powGain)
                    break;

                sklGain = GetStatIncrease(unit->pCharacterData->growthSkl);

                if (sklGain)
                    break;

                spdGain = GetStatIncrease(unit->pCharacterData->growthSpd);

                if (spdGain)
                    break;

                defGain = GetStatIncrease(unit->pCharacterData->growthDef);

                if (defGain)
                    break;

                resGain = GetStatIncrease(unit->pCharacterData->growthRes);

                if (resGain)
                    break;

                lckGain = GetStatIncrease(unit->pCharacterData->growthLck);

                if (lckGain)
                    break;
            }
        }

        if ((unit->maxHP + hpGain) > UNIT_MHP_MAX(unit))
            hpGain = UNIT_MHP_MAX(unit) - unit->maxHP;

        if ((unit->pow + powGain) > UNIT_POW_MAX(unit))
            powGain = UNIT_POW_MAX(unit) - unit->pow;

        if ((unit->skl + sklGain) > UNIT_SKL_MAX(unit))
            sklGain = UNIT_SKL_MAX(unit) - unit->skl;

        if ((unit->spd + spdGain) > UNIT_SPD_MAX(unit))
            spdGain = UNIT_SPD_MAX(unit) - unit->spd;

        if ((unit->def + defGain) > UNIT_DEF_MAX(unit))
            defGain = UNIT_DEF_MAX(unit) - unit->def;

        if ((unit->res + resGain) > UNIT_RES_MAX(unit))
            resGain = UNIT_RES_MAX(unit) - unit->res;

        if ((unit->lck + lckGain) > UNIT_LCK_MAX(unit))
            lckGain = UNIT_LCK_MAX(unit) - unit->lck;

        unit->maxHP += hpGain;
        unit->pow += powGain;
        unit->skl += sklGain;
        unit->spd += spdGain;
        unit->def += defGain;
        unit->res += resGain;
        unit->lck += lckGain;
    }
}

void BattleHitAdvance(void)
{
    gBattleHitIterator++;
}

void BattleHitTerminate(void)
{
    gBattleHitIterator++;
    gBattleHitIterator->info = BATTLE_HIT_INFO_END;
}
