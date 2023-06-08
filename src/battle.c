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

    bu->nonZeroDamage = FALSE;

    gBattleActor.weaponBroke = FALSE;
    gBattleTarget.weaponBroke = FALSE;

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
    
    bu->canCounter = TRUE;

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
