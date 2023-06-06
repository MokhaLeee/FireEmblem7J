#include "global.h"
#include "unit.h"
#include "item.h"
#include "battle.h"
#include "map.h"
#include "action.h"
#include "bm.h"
#include "terrain.h"
#include "constants/items.h"
#include "constants/terrains.h"
#include "constants/icons.h"

static inline struct Unit *_GetUnit(int id)
{
    return gUnitLut[id & 0xFF];
}

static inline const struct ClassData *_GetClassData(int classId) {
    if (classId < 1)
        return NULL;

    return gClassData + (classId - 1);
}

static inline const struct CharacterData *_GetCharacterData(int charId) {
    if (charId < 1)
        return NULL;

    return gCharacterData + (charId - 1);
}

void InitUnits(void)
{
    int i;

    for (i = 0; i < 0x100; ++i) {
        struct Unit *unit = _GetUnit(i);

        if (unit) {
            ClearUnit(unit);
            unit->index = i;
        }
    }
}

void ClearUnit(struct Unit *unit)
{
    u8 id = unit->index;
    CpuFill16(0, unit, sizeof(struct Unit));
    unit->index = id;
}

void CopyUnit(struct Unit *src, struct Unit *dst)
{
    u8 id = dst->index;
    memcpy(dst, src, sizeof(struct Unit));
    dst->index = id;
}

struct Unit *GetFreeUnit(int faction)
{
    int i, last = (faction + 0x40);

    for (i = faction + 1; i < last; ++i) {
        struct Unit *unit = _GetUnit(i);

        if (unit->pCharacterData == NULL)
            return unit;
    }

    return NULL;
}

struct Unit *GetFreeBlueUnit(const struct UnitDefinition *info)
{
    int i, last = 0x40;

    if (info->pid == GetPlayerLeaderUnitId())
        ++i;

    for (i = 1; i < last; ++i) {
        struct Unit *unit = _GetUnit(i);

        if (unit->pCharacterData == NULL)
            return unit;
    }

    return NULL;
}

inline int GetUnitMaxHp(struct Unit *unit)
{
    return unit->maxHP + GetItemHpBonus((u16) GetUnitEquippedWeapon(unit));
}

inline int GetUnitCurrentHp(struct Unit *unit)
{
    if (unit->curHP > GetUnitMaxHp(unit))
        unit->curHP = GetUnitMaxHp(unit);

    return unit->curHP;
}

inline int GetUnitPower(struct Unit *unit) {
    return unit->pow + GetItemPowBonus((u16) GetUnitEquippedWeapon(unit));
}

inline int GetUnitSkill(struct Unit *unit) {
    u16 item = GetUnitEquippedWeapon(unit);

    if (unit->state & US_RESCUING)
        return unit->skl / 2 + GetItemSklBonus(item);

    return unit->skl + GetItemSklBonus(item);
}

inline int GetUnitSpeed(struct Unit *unit)
{
    u16 item = GetUnitEquippedWeapon(unit);

    if (unit->state & US_RESCUING)
        return unit->spd / 2 + GetItemSpdBonus(item);

    return unit->spd + GetItemSpdBonus(item);
}

inline int GetUnitDefense(struct Unit *unit)
{
    return unit->def + GetItemDefBonus((u16) GetUnitEquippedWeapon(unit));
}

inline int GetUnitResistance(struct Unit *unit)
{
    return unit->res + GetItemResBonus((u16) GetUnitEquippedWeapon(unit)) + unit->barrierDuration;
}

inline int GetUnitLuck(struct Unit *unit)
{
    return unit->lck + GetItemLckBonus((u16) GetUnitEquippedWeapon(unit));
}

inline int GetUnitPortraitId(struct Unit *unit)
{
    if (unit->pCharacterData->portraitId)
        return unit->pCharacterData->portraitId;

    if (unit->pClassData->defaultPortraitId)
        return unit->pClassData->defaultPortraitId;

    return 0;
}

inline int GetUnitMiniPortraitId(struct Unit *unit)
{
    if (unit->pCharacterData->miniPortrait)
        return 0x7F00 + unit->pCharacterData->miniPortrait;

    return GetUnitPortraitId(unit);
}

inline int GetUnitLeaderCharId(struct Unit *unit)
{
    if (!(unit->index & 0xC0))
        return 0;

    return UNIT_LEADER_CHARACTER(unit);
}

inline void SetUnitLeaderCharId(struct Unit *unit, int charId)
{
    UNIT_LEADER_CHARACTER(unit) = charId;
}

inline void SetUnitHp(struct Unit *unit, int value)
{
    unit->curHP = value;

    if (unit->curHP > GetUnitMaxHp(unit))
        unit->curHP = GetUnitMaxHp(unit);
}

inline void AddUnitHp(struct Unit *unit, int amount)
{
    int hp = unit->curHP;

    hp += amount;

    if (hp > GetUnitMaxHp(unit))
        hp = GetUnitMaxHp(unit);

    if (hp < 0)
        hp = 0;

    unit->curHP = hp;
}

int GetUnitFogViewRange(struct Unit *unit)
{
    int result = gPlaySt.chapterVisionRange;

    if (UNIT_CATTRIBUTES(unit) & CA_THIEF)
        result += 5;

    return result + unit->torchDuration;
}

void SetUnitStatus(struct Unit *unit, int status)
{
    if (status == 0) {
        unit->statusIndex    = 0;
        unit->statusDuration = 0;
    } else {
        unit->statusIndex    = status;
        unit->statusDuration = 5;
    }
}

void SetUnitStatusExt(struct Unit *unit, int status, int duration)
{
    unit->statusIndex    = status;
    unit->statusDuration = duration;
}

int GetUnitSMSId(struct Unit *unit)
{
    if (!(unit->state & US_IN_BALLISTA))
        return unit->pClassData->SMSId;

    switch (GetTrap(unit->ballistaIndex)->extra) {
    case ITEM_BALLISTA_REGULAR:
        return 0x4F;

    case ITEM_BALLISTA_LONG:
        return 0x50;

    case ITEM_BALLISTA_KILLER:
        return 0x51;

    default:
        return 0;
    }
}

bool UnitAddItem(struct Unit *unit, int item)
{
    int i;

    for (i = 0; i < UNIT_ITEM_COUNT; ++i) {
        if (unit->items[i] == 0) {
            unit->items[i] = item;
            return true;
        }
    }

    return false;
}

static inline void UnitRemoveItem(struct Unit *unit, int slot)
{
    unit->items[slot] = 0;
    UnitRemoveInvalidItems(unit);
}

void UnitClearInventory(struct Unit *unit)
{
    int i;

    for (i = 0; i < UNIT_ITEM_COUNT; ++i)
        unit->items[i] = 0;
}

void UnitRemoveInvalidItems(struct Unit *unit)
{
    u16 items[UNIT_ITEM_COUNT + 1], i;
    u16 *it = items;

    // Build item buffer by iterating through unit's items and skipping blanks

    for (i = 0; i < UNIT_ITEM_COUNT; ++i) {
        if (unit->items[i])
            *it++ = unit->items[i];

        unit->items[i] = 0; // Null the item from the unit
    }

    *it = 0; // null-terminate buffer

    // Write buffered items

    for (i = 0; i < UNIT_ITEM_COUNT; ++i) {
        if (!items[i])
            return; // Stop now if we reached end of buffer

        unit->items[i] = items[i];
    }
}

int GetUnitItemCount(struct Unit *unit)
{
    int i;

    for (i = (UNIT_ITEM_COUNT - 1); i >= 0; --i)
        if (unit->items[i])
            return i + 1;

    return 0;
}

bool UnitHasItem(struct Unit *unit, int item)
{
    int i;
    item = GetItemIndex(item);

    for (i = 0; (i < UNIT_ITEM_COUNT) && unit->items[i]; ++i)
        if (GetItemIndex(unit->items[i]) == item)
            return true;

    return false;
}

int LoadUnits(const struct UnitDefinition *info)
{
    int count = 0;

    while (info->pid) {
        LoadUnit(info);

        info++;
        count++;
    }

    return count;
}

void sub_08017B44(struct Unit *unit)
{
    if (unit->pow >= 4)
        unit->pow /= 2;

    if (unit->def >= 4)
        unit->def /= 2;

    if (unit->res >= 4)
        unit->res /= 2;
}

struct Unit *LoadUnit(struct UnitDefinition const *info)
{
    int hp;
    struct Unit *unit = NULL;

    switch (info->faction_id) {
    case FACTION_ID_BLUE:
        unit = GetFreeBlueUnit(info);
        break;

    case FACTION_ID_RED:
        unit = GetFreeUnit(FACTION_RED);
        break;

    case FACTION_ID_GREEN:
        unit = GetFreeUnit(FACTION_GREEN);
        break;
    }

    if (!unit)
        return NULL;

    ClearUnit(unit);
    UnitInitFromDefinition(unit, info);
    UnitLoadStatsFromChracter(unit, unit->pCharacterData);
    UnitHideIfUnderRoof(unit);

    if (info->autolevel) {
        if (UNIT_FACTION(unit) == FACTION_BLUE) {
            UnitAutolevelPlayer(unit);
            UnitAutolevelWExp(unit, info);
        } else {
            UnitAutolevel(unit);
            UnitAutolevelWExp(unit, info);
            unit->supports[UNIT_SUPPORT_MAX_COUNT - 1] = info->pid_lead;
        }
    }

    FixROMUnitStructPtr(unit);
    UnitLoadSupports(unit);

    if (UNIT_CATTRIBUTES(unit) & (0x80 << 0x14)) {
        unit->state |= (0x80 << 0x5);
    }

    UnitCheckStatCaps(unit);

    hp = unit->maxHP + GetItemHpBonus(GetUnitEquippedWeapon(unit));
    unit->curHP = hp;
    return unit;
}

void UnitInitFromDefinition(struct Unit *unit, const struct UnitDefinition *info)
{
    int i;

    unit->pCharacterData = _GetCharacterData(info->pid);

    if (info->jid != 0)
        unit->pClassData = _GetClassData(info->jid);
    else
        unit->pClassData = _GetClassData(unit->pCharacterData->defaultClass);

    unit->level = info->level;

    unit->xPos = info->x_move;
    unit->yPos = info->y_move;

    for (i = 0; (i < (int) ARRAY_COUNT(info->items)) && info->items[i]; ++i)
        UnitAddItem(unit, MakeNewItem(info->items[i]));

    CharStoreAI(unit, info);
}

void UnitLoadItemsFromDefinition(struct Unit *unit, const struct UnitDefinition *info) {
    int i;

    UnitClearInventory(unit);

    for (i = 0; (i < UNIT_DEFINITION_ITEM_COUNT) && (info->items[i]); ++i)
        UnitAddItem(unit, MakeNewItem(info->items[i]));
}

void UnitLoadStatsFromChracter(struct Unit *unit, const struct CharacterData *character)
{
    int i;

    unit->maxHP = character->baseHP + unit->pClassData->baseHP;
    unit->pow   = character->basePow + unit->pClassData->basePow;
    unit->skl   = character->baseSkl + unit->pClassData->baseSkl;
    unit->spd   = character->baseSpd + unit->pClassData->baseSpd;
    unit->def   = character->baseDef + unit->pClassData->baseDef;
    unit->res   = character->baseRes + unit->pClassData->baseRes;
    unit->lck   = character->baseLck;

    unit->conBonus = 0;

    for (i = 0; i < 8; ++i) {
        unit->ranks[i] = unit->pClassData->baseRanks[i];

        if (unit->pCharacterData->baseRanks[i])
            unit->ranks[i] = unit->pCharacterData->baseRanks[i];
    }

    if (UNIT_FACTION(unit) == FACTION_BLUE && (unit->level != UNIT_LEVEL_MAX) && (unit->pCharacterData->number != 0x28)) // todo
        unit->exp = 0;
    else
        unit->exp = UNIT_EXP_DISABLED;
}

void FixROMUnitStructPtr(struct Unit *unit) {
    // TODO: investigate why

    if (UNIT_CATTRIBUTES(unit) & CA_BIT_23)
        unit->pCharacterData = _GetCharacterData(unit->pCharacterData->number - 1);
}

void UnitLoadSupports(struct Unit *unit) {
    int i, count = GetUnitSupporterCount(unit);

    for (i = 0; i < count; ++i)
        unit->supports[i] = GetUnitSupporterInitialExp(unit, i);
}

void UnitAutolevelWExp(struct Unit *unit, const struct UnitDefinition *uDef)
{
    if (uDef->autolevel) {
        int i;

        for (i = 0; i < GetUnitItemCount(unit); ++i) {
            int wType, item = unit->items[i];

            if (!(GetItemAttributes(item) & IA_REQUIRES_WEXP))
                continue;

            if (GetItemAttributes(item) & IA_WEAPON)
                if (CanUnitUseWeapon(unit, item))
                    continue;

            if (GetItemAttributes(item) & IA_STAFF)
                if (CanUnitUseStaff(unit, item))
                    continue;

            if (GetItemAttributes(item) & IA_LOCK_ANY)
                continue;

            wType = GetItemType(item);

            if (unit->ranks[wType] == 0)
                item = 0;

            unit->ranks[wType] = GetItemRequiredExp(item);
        }
    }
}

void UnitAutolevelCore(struct Unit *unit, u8 classId, int levelCount)
{
    if (levelCount) {
        unit->maxHP += GetAutoleveledStatIncrease(unit->pClassData->growthHP,  levelCount);
        unit->pow   += GetAutoleveledStatIncrease(unit->pClassData->growthPow, levelCount);
        unit->skl   += GetAutoleveledStatIncrease(unit->pClassData->growthSkl, levelCount);
        unit->spd   += GetAutoleveledStatIncrease(unit->pClassData->growthSpd, levelCount);
        unit->def   += GetAutoleveledStatIncrease(unit->pClassData->growthDef, levelCount);
        unit->res   += GetAutoleveledStatIncrease(unit->pClassData->growthRes, levelCount);

        // ???
        // unit->lck   += GetAutoleveledStatIncrease(unit->pClassData->growthLck, levelCount);
    }
}

void UnitApplyBonusLevels(struct Unit *unit, int levelCount) {
    UnitAutolevelCore(unit, unit->pClassData->number, levelCount);
    UnitCheckStatCaps(unit);
    unit->curHP = GetUnitMaxHp(unit);
}

void UnitAutolevel(struct Unit *unit)
{
    if (UNIT_CATTRIBUTES(unit) & CA_PROMOTED)
        UnitAutolevelCore(unit, unit->pClassData->promotion, GetCurrentPromotedLevelBonus());

    UnitAutolevelCore(unit, unit->pClassData->number, unit->level - 1);
}

void UnitAutolevelPlayer(struct Unit *unit)
{
    int i, ret;
    int level = unit->level;
    int base_level = unit->pCharacterData->baseLevel;

    if (UNIT_CATTRIBUTES(unit) & 0x100)
        ret = (level + 0xE) - base_level;
    else
        ret = level - base_level;

    for (i = 0; i < ret; ++i) {
        unit->maxHP += GetStatIncrease(unit->pCharacterData->growthHP);
        unit->pow   += GetStatIncrease(unit->pCharacterData->growthPow);
        unit->skl   += GetStatIncrease(unit->pCharacterData->growthSkl);
        unit->spd   += GetStatIncrease(unit->pCharacterData->growthSpd);
        unit->def   += GetStatIncrease(unit->pCharacterData->growthDef);
        unit->res   += GetStatIncrease(unit->pCharacterData->growthRes);
        unit->lck   += GetStatIncrease(unit->pCharacterData->growthLck);
    }
}

void UnitCheckStatCaps(struct Unit *unit)
{
    if (unit->maxHP > UNIT_MHP_MAX(unit))
        unit->maxHP = UNIT_MHP_MAX(unit);

    if (unit->pow > UNIT_POW_MAX(unit))
        unit->pow = UNIT_POW_MAX(unit);

    if (unit->skl > UNIT_SKL_MAX(unit))
        unit->skl = UNIT_SKL_MAX(unit);

    if (unit->spd > UNIT_SPD_MAX(unit))
        unit->spd = UNIT_SPD_MAX(unit);

    if (unit->def > UNIT_DEF_MAX(unit))
        unit->def = UNIT_DEF_MAX(unit);

    if (unit->res > UNIT_RES_MAX(unit))
        unit->res = UNIT_RES_MAX(unit);

    if (unit->lck > UNIT_LCK_MAX(unit))
        unit->lck = UNIT_LCK_MAX(unit);

    if (unit->conBonus > (UNIT_CON_MAX(unit) - UNIT_CON_BASE(unit)))
        unit->conBonus = (UNIT_CON_MAX(unit) - UNIT_CON_BASE(unit));

    if (unit->movBonus > (UNIT_MOV_MAX(unit) - UNIT_MOV_BASE(unit)))
        unit->movBonus = (UNIT_MOV_MAX(unit) - UNIT_MOV_BASE(unit));
}

struct Unit *GetUnitFromCharId(int charId)
{
    int i;

    for (i = 1; i < 0x100; ++i) {
        struct Unit *unit = _GetUnit(i);

        if (UNIT_IS_VALID(unit) && unit->pCharacterData->number == charId)
            return unit;
    }

    return NULL;
}

struct Unit *GetUnitFromCharIdAndFaction(int charId, int faction)
{
    int i, last = faction + 0x40;

    for (i = faction + 1; i < last; ++i) {
        struct Unit *unit = _GetUnit(i);

        if (UNIT_IS_VALID(unit) && unit->pCharacterData->number == charId)
            return unit;
    }

    return NULL;
}

bool CanUnitRescue(struct Unit *actor, struct Unit *target)
{
    int actorAid  = GetUnitAid(actor);
    int targetCon = UNIT_CON(target);

    return (actorAid >= targetCon) ? TRUE : FALSE;
}

void UnitRescue(struct Unit *actor, struct Unit *target)
{
    actor->state  |= US_RESCUING;
    target->state |= US_RESCUED | US_HIDDEN;

    actor->rescue = target->index;
    target->rescue = actor->index;

    target->xPos = actor->xPos;
    target->yPos = actor->yPos;
}

void UnitDrop(struct Unit *actor, int xTarget, int yTarget)
{
    struct Unit *target = _GetUnit(actor->rescue);

    actor->state = actor->state &~ (US_RESCUING | US_RESCUED);
    target->state = target->state &~ (US_RESCUING | US_RESCUED | US_HIDDEN);

    if (UNIT_FACTION(target) == gPlaySt.faction)
        target->state |= US_UNSELECTABLE; // TODO: US_GRAYED

    actor->rescue = 0;
    target->rescue = 0;

    target->xPos = xTarget;
    target->yPos = yTarget;
}

bool UnitGive(struct Unit *actor, struct Unit *target) {
    struct Unit *rescuee = _GetUnit(actor->rescue);

    // no used be needed to match etc
    int couldGive = CanUnitRescue(target, rescuee);

    UnitDrop(actor, 0, 0);
    UnitRescue(target, rescuee);

    // return couldGive; // devs probably forgot to add this
}

inline const char *GetUnitRescueName(struct Unit* unit) {
    if (unit->rescue == 0)
        return StatusNameStringLut[UNIT_STATUS_NONE];

    return DecodeMsg(_GetUnit(unit->rescue)->pCharacterData->nameTextId);
}

inline const char *GetUnitStatusName(struct Unit* unit)
{
    return StatusNameStringLut[unit->statusIndex];
}

void UnitKill(struct Unit *unit)
{
    if (UNIT_FACTION(unit) == FACTION_BLUE) {
        unit->state |= US_DEAD | US_HIDDEN;
        ClearUnitSupports(unit);
    } else
        unit->pCharacterData = NULL;
}

void UnitChangeFaction(struct Unit *unit, int faction) {
    struct Unit *newUnit = GetFreeUnit(faction);

    if (gActiveUnit == unit)
        gActiveUnit = newUnit;

    CopyUnit(unit, newUnit);
    ClearUnit(unit);

    if (newUnit->exp == UNIT_EXP_DISABLED) {
        if ((faction == FACTION_BLUE) && (newUnit->level != UNIT_LEVEL_MAX))
            newUnit->exp = 0;
        else
            newUnit->exp = UNIT_EXP_DISABLED;
    }

    newUnit->state = newUnit->state &~ US_DROP_ITEM;

    if (newUnit->rescue)
        _GetUnit(newUnit->rescue)->rescue = newUnit->index;
}

static inline s8 _CanUnitCrossTerrain(struct Unit *unit, int terrain)
{
    const s8* lookup = GetUnitMovementCost(unit);
    return (lookup[terrain] > 0) ? TRUE : FALSE;
}

void UnitSyncMovement(struct Unit *unit)
{
    if (unit->state & US_RESCUING) {
        struct Unit *rescuee = _GetUnit(unit->rescue);

        rescuee->xPos = unit->xPos;
        rescuee->yPos = unit->yPos;
    }

    if (unit->state & US_IN_BALLISTA) {
        struct Trap *trap = GetTrap(unit->ballistaIndex);

        trap->xPos = unit->xPos;
        trap->yPos = unit->yPos;
    }
}

void UnitGetDeathDropLocation(struct Unit *unit, int *xOut, int *yOut)
{
    int iy, ix, minDistance = 9999;
    struct Unit *rescuee = _GetUnit(unit->rescue);

    // Fill the movement map
    GenerateExtendedMovementMap(unit->xPos, unit->yPos, MoveTable_Flying);

    // Put the active unit on the unit map (kinda, just marking its spot)
    gBmMapUnit[gActiveUnit->yPos][gActiveUnit->xPos] = 0xFF;

    // Remove the actor unit from the unit map (why?)
    gBmMapUnit[unit->yPos][unit->xPos] = 0;

    for (iy = gBmMapSize.y - 1; iy >= 0; --iy) {
        for (ix = gBmMapSize.x - 1; ix >= 0; --ix) {
            int distance;

            if (gBmMapMovement[iy][ix] > MAP_MOVEMENT_MAX)
                continue;

            if (gBmMapUnit[iy][ix] != 0)
                continue;

            if (gBmMapHidden[iy][ix] & HIDDEN_BIT_UNIT)
                continue;

            if (!_CanUnitCrossTerrain(rescuee, gBmMapTerrain[iy][ix]))
                continue;

            distance = RECT_DISTANCE(ix, iy, unit->xPos, unit->yPos);

            if (minDistance >= distance) {
                minDistance = distance;

                *xOut = ix;
                *yOut = iy;
            }
        }
    }

    // Remove the active unit from the unit map again
    gBmMapUnit[gActiveUnit->yPos][gActiveUnit->xPos] = 0;
}

void UnitBeginAction(struct Unit *unit)
{
    gActiveUnit = unit;
    gActiveUnitId = unit->index;

    gActiveUnitMoveOrigin.x = unit->xPos;
    gActiveUnitMoveOrigin.y = unit->yPos;

    gActionSt.instigator = unit->index;
    gActionSt.id = ACTION_NONE;
    gActionSt.move_count = 0;

    gBmSt.partial_actions_taken = 0;
    gBmSt.unk_3F = 0xFF;

    sub_0802A21C();

    gActiveUnit->state |= US_HIDDEN;
    gBmMapUnit[unit->yPos][unit->xPos] = 0;
}

void UnitBeginCantoAction(struct Unit *unit)
{
    gActiveUnit = unit;
    gActiveUnitId = unit->index;

    gActiveUnitMoveOrigin.x = unit->xPos;
    gActiveUnitMoveOrigin.y = unit->yPos;

    gActionSt.id = ACTION_NONE;

    gBmSt.partial_actions_taken = 0;

    sub_0802A21C();

    gActiveUnit->state |= US_HIDDEN;
    gBmMapUnit[unit->yPos][unit->xPos] = 0;
}

void MoveActiveUnit(int x, int y)
{
    gActiveUnit->xPos = x;
    gActiveUnit->yPos = y;

    if (UNIT_CHAR_ID(gActiveUnit) != 0xCD)
        gActiveUnit->state |= US_UNSELECTABLE;
    else
        gActiveUnit->state &= ~(US_UNSELECTABLE | US_HAS_MOVED | US_HAS_MOVED_AI);

    PidStatsAddMove(gActiveUnit->pCharacterData->number, gActionSt.move_count);

    if (GetUnitCurrentHp(gActiveUnit) != 0)
        gActiveUnit->state &= ~US_HIDDEN;

    UnitSyncMovement(gActiveUnit);
}

void ClearActiveFactionGrayedStates(void)
{
    int i;

    if (gPlaySt.faction == FACTION_BLUE) {
        int i;

        for (i = 1; i < 0x40; ++i) {
            struct Unit *unit = _GetUnit(i);

            if (!UNIT_IS_VALID(unit))
                continue;

            if (UNIT_CATTRIBUTES(unit) & CA_SUPPLY)
                continue;

            if (unit->state & (US_UNAVAILABLE | US_UNSELECTABLE))
                continue;

            PidStatsSubFavval08(unit->pCharacterData->number);
        }
    }

    for (i = gPlaySt.faction + 1; i < gPlaySt.faction + 0x40; ++i) {
        struct Unit *unit = _GetUnit(i);

        if (UNIT_IS_VALID(unit))
            unit->state = unit->state &~ (US_UNSELECTABLE | US_HAS_MOVED | US_HAS_MOVED_AI);
    }
}

void TickActiveFactionTurn(void)
{
    int i, displayMapChange = false;

    BeginTargetList(0, 0);

    for (i = gPlaySt.faction + 1; i < gPlaySt.faction + 0x40; ++i) {
        struct Unit *unit = _GetUnit(i);

        if (!UNIT_IS_VALID(unit))
            continue;

        if (unit->state & (US_UNAVAILABLE | US_RESCUED))
            continue;

        if (unit->barrierDuration != 0)
            unit->barrierDuration--;

        if (unit->torchDuration != 0) {
            unit->torchDuration--;
            displayMapChange = true;
        }

        if (unit->statusDuration != 0) {
            unit->statusDuration--;

            if (unit->statusDuration == 0)
                EnlistTarget(unit->xPos, unit->yPos, unit->index, 0);
        }
    }

    if (displayMapChange) {
        RenderMapForFade();
        RefreshEntityMaps();
        RenderMap();
        StartMapFade(true);
        RefreshUnitSprites();
    }
}

void SetAllUnitNotBackSprite(void) {
    int i;

    for (i = 1; i < 0xC0; i++) {
        struct Unit *unit = _GetUnit(i);

        if (UNIT_IS_VALID(unit))
            unit->state &= ~US_SEEN;
    }
}

void UnitUpdateUsedItem(struct Unit *unit, int itemSlot)
{
    if (unit->items[itemSlot]) {
        unit->items[itemSlot] = GetItemAfterUse(unit->items[itemSlot]);
        UnitRemoveInvalidItems(unit);
    }
}

int GetUnitAid(struct Unit *unit) {
    if (!(UNIT_CATTRIBUTES(unit) & CA_MOUNTEDAID))
        return UNIT_CON(unit) - 1;

    if (UNIT_CATTRIBUTES(unit) & CA_FEMALE)
        return 20 - UNIT_CON(unit);
    else
        return 25 - UNIT_CON(unit);
}

int GetUnitMagRange(struct Unit *unit)
{
    int ret;

    ret = GetUnitPower(unit) / 2;
    if (ret < 5)
        ret = 5;
    
    return ret;
}

bool UnitHasMagicRank(struct Unit *unit)
{
    u8 combinedRanks = 0;

    combinedRanks |= unit->ranks[ITYPE_STAFF];
    combinedRanks |= unit->ranks[ITYPE_ANIMA];
    combinedRanks |= unit->ranks[ITYPE_LIGHT];
    combinedRanks |= unit->ranks[ITYPE_DARK];

    return combinedRanks ? true : false;
}

void sub_080188F4(struct Unit *unit, int x, int y)
{
    if (!(unit->state & US_UNDER_A_ROOF)) {
        unit->state = unit->state &~ (US_HIDDEN | US_NOT_DEPLOYED);

        unit->xPos = x;
        unit->yPos = y;
    }
}

int GetUnitKeyItemSlotForTerrain(struct Unit *unit, int terrain) {
    int slot, item = 0;

    if (UNIT_CATTRIBUTES(unit) & CA_THIEF) {
        int slot = GetUnitItemSlot(unit, ITEM_LOCKPICK);

        if (slot >= 0)
            return slot;
    }

    switch (terrain) {

    case TERRAIN_CHEST:
        slot = GetUnitItemSlot(unit, ITEM_CHESTKEY);

        if (slot < 0)
            slot = GetUnitItemSlot(unit, ITEM_CHESTKEY_BUNDLE);

        return slot;

    case TERRAIN_DOOR:
        item = ITEM_DOORKEY;
        break;

    } // switch (terrain)

    return GetUnitItemSlot(unit, item);
}

int GetUnitAidIconId(u32 attributes) {
    // TODO: use icon id constants

    if (attributes & CA_MOUNTED)
        return ICON_AID_MOUNT;

    if (attributes & CA_PEGASUS)
        return ICON_AID_PEGASUS;

    if (attributes & CA_WYVERN)
        return ICON_AID_WYVERN;

    return ICON_NONE;
}

int GetUnitWeaponUsabilityBits(struct Unit *unit) {
    int i, item, result = 0;

    for (i = 0; (i < UNIT_ITEM_COUNT) && (item = unit->items[i]); ++i) {
        if ((GetItemAttributes(item) & IA_WEAPON) && CanUnitUseWeapon(unit, item))
            result |= UNIT_USEBIT_WEAPON;

        if ((GetItemAttributes(item) & IA_STAFF) && CanUnitUseStaff(unit, item))
            result |= UNIT_USEBIT_STAFF;
    }

    return result;
}

int GetCombinedEnemyWeaponUsabilityBits(void) {
    int i, ret = 0;

    for (i = FACTION_RED + 1; i < FACTION_RED + 0x40; ++i) {
        struct Unit *unit = _GetUnit(i);

        if (UNIT_IS_VALID(unit))
            ret |= GetUnitWeaponUsabilityBits(unit);
    }

    return ret;
}

const char Unk_8AC9228[] = "ーーー";

bool CanActiveUnitStillMove(void)
{
    s8 adjLookup[4 * 2] = {
        -1, 0,
        0, -1,
        +1, 0,
        0, +1,
    };

    int move = UNIT_MOV(gActiveUnit) - gActionSt.move_count;

    int xUnit = gActiveUnit->xPos;
    int yUnit = gActiveUnit->yPos;

    int i;

    for (i = 0; i < 4; i++) {
        int xLocal = xUnit + adjLookup[i * 2 + 0];
        int yLocal = yUnit + adjLookup[i * 2 + 1];

        int cost;

        if (gBmMapUnit[yLocal][xLocal] & FACTION_RED)
            continue;

        cost = GetUnitMovementCost(gActiveUnit)[gBmMapTerrain[yLocal][xLocal]];

        if ((cost < 0) || (cost > move))
            continue;

        return true;
    }

    return false;
}

bool IsPositionMagicSealed(int x, int y)
{
    int i;

    for (i = 0x81; i < 0xC0; ++i) {
        struct Unit *unit = _GetUnit(i);

        if (!UNIT_IS_VALID(unit))
            continue;

        if (!(UNIT_CATTRIBUTES(unit) & CA_MAGICSEAL))
            continue;

        if (RECT_DISTANCE(unit->xPos, unit->yPos, x, y) <= 10)
            return true;
    }

    return false;
}

bool IsUnitMagicSealed(struct Unit *unit)
{
    if (unit->statusIndex == UNIT_STATUS_SILENCED)
        return true;

    if (IsPositionMagicSealed(unit->xPos, unit->yPos))
        return true;

    return false;
}

int GetUnitLastItem(struct Unit *unit)
{
    return unit->items[GetUnitItemCount(unit) - 1];
}

const s8 *GetUnitMovementCost(struct Unit *unit)
{
    if (unit->state & US_IN_BALLISTA)
        return MoveTable_Ballista;

    switch (gPlaySt.chapterWeatherId) {

    case WEATHER_RAIN:
        return unit->pClassData->pMovCostTable[1];

    case WEATHER_SNOW:
    case WEATHER_SNOWSTORM:
        return unit->pClassData->pMovCostTable[2];

    default:
        return unit->pClassData->pMovCostTable[0];

    } // switch (gPlaySt.chapterWeatherId)
}

int GetClassSMSId(int jid)
{
    return _GetClassData(jid)->SMSId;
}

void UpdatePrevDeployStates(void)
{
    int i;

    for (i = 1; i < 0x40; ++i) {
        struct Unit *unit = _GetUnit(i);

        if (!UNIT_IS_VALID(unit))
            continue;

        if (unit->state & US_DEAD) {
            unit->state |= US_BIT20;
            unit->state &= ~US_DEAD;
        } else
            unit->state &= ~US_BIT20;
    }

    sub_0807B32C();
}

void sub_08018C78(void)
{
    int i;
    for (i = 1; i < 0x40; ++i) {
        struct Unit *unit = _GetUnit(i);

        if (!UNIT_IS_VALID(unit))
            continue;

        if (unit->state & US_BIT20) {
            unit->state |= US_DEAD;
            unit->state &= ~US_BIT20;
        } else
            unit->state &= ~US_BIT20;
    }
}

void sub_08018CC4(void)
{
    int i;

    for (i = 1; i < 0x40; ++i) {
        struct Unit *unit = _GetUnit(i);

        if (!UNIT_IS_VALID(unit))
            continue;

        if (unit->state & US_NOT_DEPLOYED)
            unit->state |= US_BIT21;
        else
            unit->state &= ~US_BIT21;
        
        if (unit->state & US_BIT16)
            unit->state |= US_BIT26;
        else
            unit->state &= ~US_BIT26;
    }

    if (gPlaySt.chapterStateBits & PLAY_FLAG_PREPSCREEN) {
        for (i = 1; i < 0x40; i++) {
            u8 *buf;
            struct Unit *unit = _GetUnit(i);

            if (!UNIT_IS_VALID(unit))
                continue;
            
            buf = (void *)&unit->ai3And4;
            buf[0] = unit->xPos;
            buf[1] = unit->yPos;
        }
    }

    sub_0807B32C();
}

void sub_08018D70(void)
{
    int i, j;

    sub_0807B32C();

    for (i = 1; i < 0x40; ++i) {
        struct Unit *unit = _GetUnit(i);

        if (!UNIT_IS_VALID(unit))
            continue;
        
        if (unit->state & US_BIT22) {
            ClearUnit(unit);
            continue;
        }

        if (unit->state & US_BIT21)
            unit->state |= US_NOT_DEPLOYED;
        else
            unit->state &= ~US_NOT_DEPLOYED;
        
        if (unit->state & 0x4000000)
            unit->state |= US_BIT16;
        else
            unit->state &= ~US_BIT16;

        unit->state |= 0x1;
    }

    if (gPlaySt.chapterStateBits & PLAY_FLAG_PREPSCREEN) {
        for (j = 1; j < 0x40; j++) {
            u8 *buf;
            struct Unit *unit = _GetUnit(j);

            if (!UNIT_IS_VALID(unit))
                continue;
            
            buf = (void *)&unit->ai3And4;
            unit->xPos = buf[0];
            unit->yPos = buf[1];
            unit->ai3And4 = 0;
        }
    }

    for (i = 0x41; i < 0xC0; i++) {
        struct Unit *unit = _GetUnit(i);

        if (!UNIT_IS_VALID(unit))
            continue;

        ClearUnit(unit);
    }

    sub_080799E4();
}
