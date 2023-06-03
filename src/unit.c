#include "global.h"
#include "unit.h"
#include "bm.h"
#include "terrain.h"
#include "constants/items.h"

static inline struct Unit *_GetUnit(int id)
{
    return gUnitLut[id & 0xFF];
}

static inline const struct ClassData* _GetClassData(int classId) {
    if (classId < 1)
        return NULL;

    return gClassData + (classId - 1);
}

static inline const struct CharacterData* _GetCharacterData(int charId) {
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

void CopyUnit(struct Unit* src, struct Unit *dst)
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

int GetUnitFogViewRange(struct Unit *unit) {
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

void UnitClearInventory(struct Unit *unit)
{
    int i;

    for (i = 0; i < UNIT_ITEM_COUNT; ++i)
        unit->items[i] = 0;
}

void UnitRemoveInvalidItems(struct Unit *unit)
{
    u16 items[UNIT_ITEM_COUNT + 1], i;
    u16* it = items;

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
            UnitAutolevelRealistic(unit);
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
