#include "gbafe.h"

int GetLatestUnitIndexInPrepListByUId(void)
{
    int i;

    for (i = 0; i < PrepGetUnitAmount(); i++)
    {
        if (GetLastStatScreenUnitId() == GetUnitFromPrepList(i)->index)
            return i;
    }

    return 0;
}

int PrepGetLatestUnitIndex(void)
{
    int i;

    for (i = 0; i < PrepGetUnitAmount(); i++)
    {
        if (UNIT_CHAR_ID(GetUnitFromPrepList(i)) == PrepGetLatestCharId())
            return i;
    }

    return 0;
}

void ReorderPlayerUnitsBasedOnDeployment(void)
{
    int i;
    struct Unit * unit;

    InitUnitStack(gPrepUnitPool);

    for (i = 1; i < 64; i++)
    {
        unit = GetUnit(i);

        if (UNIT_IS_VALID(unit) && !(0x1000C & unit->state))
            PushUnit(unit);
    }

    for (i = 1; i < 64; i++)
    {
        unit = GetUnit(i);

        if (UNIT_IS_VALID(unit) && (0x1000C & unit->state))
            PushUnit(unit);
    }

    LoadPlayerUnitsFromUnitStack();
}

void SortPlayerUnitsForPrepScreen(void)
{
    int i, state1, state2;
    struct Unit * unit;
    int count = GetChapterAllyUnitCount();
    int _count = 0;

    InitUnitStack(gPrepUnitPool);

    for (i = 1; i < 64; i++)
    {
        unit = GetUnit(i);

        if (!UNIT_IS_VALID(unit))
            continue;

        unit->state &= 0xFDFFFFFF;

        if (IsUnitInCurrentRoster(unit) && IsCharacterForceDeployed(unit->pCharacterData->number))
            PushUnit(unit);
    }

    for (i = 1; i < 64; i++)
    {
        unit = GetUnit(i);

        if (!UNIT_IS_VALID(unit))
            continue;

        if (!IsUnitInCurrentRoster(unit) || !IsCharacterForceDeployed(unit->pCharacterData->number))
            PushUnit(unit);
    }

    LoadPlayerUnitsFromUnitStack();

    for (i = 1; i < 64; i++)
    {
        unit = GetUnit(i);

        if (!UNIT_IS_VALID(unit))
            continue;

        if (!IsUnitInCurrentRoster(unit))
            continue;

        if (sub_808E7D4(unit))
        {
            state1 = unit->state;
            state2 = 0x02000008;
        }
        else
        {
            if (count > _count)
            {
                unit->state &= 0xFFFFFFF7;
                _count++;
                continue;
            }

            state1 = unit->state;
            state2 = 0x08;
        }

        unit->state = state1 | state2;
    }
}

void RemoveSomeUnitItems(void)
{
    int i, j, itemNum, removeItem;

    for (i = 1; i < 0x40; i++) {
        struct Unit *unit = GetUnit(i);

        if (!UNIT_IS_VALID(unit))
            continue;

        removeItem = false;
        unit->state |= 8;

        itemNum = GetUnitItemCount(unit);

        j = 0;
        if ((*(&removeItem)) < itemNum) {
            for (; j < itemNum; j++) {
                switch (GetItemIndex(unit->items[j])) {
                case 0x80:
                case 0x81:
                case 0x82:
                case 0x83:
                case 0x8A:
                    unit->items[j] = 0;
                    removeItem = true;

                default:
                    break;
                }
            }   
        }

        if (removeItem)
            UnitRemoveInvalidItems(unit);
    }
}

void MakePrepUnitList(void)
{
    int i, cur = 0;

    for (i = 1; i < 64; i++) {
        struct Unit *unit = GetUnit(i);

        if (!UNIT_IS_VALID(unit))
            continue;

        if (IsUnitInCurrentRoster(unit)) {
            RegisterPrepUnitList(cur, unit);
            cur++;
        }
    }

    PrepSetUnitAmount(cur);
}

int UnitGetIndexInPrepList(int pid)
{
    int i;

    for (i = 0; i < PrepGetUnitAmount(); i++) {
        struct Unit *unit = GetUnitFromPrepList(i);

        if (UNIT_CHAR_ID(unit) == pid)
            return i;
    }
    return 0;
}

void PrepUpdateSMS(void)
{
    int i;

    ResetUnitSprites();

    for (i = 0; i < PrepGetUnitAmount(); i++) {
        struct Unit *unit = GetUnitFromPrepList(i);

        if (!(unit->state & 8))
            unit->state &= ~2;
        else
            unit->state |= 0xA;

        UseUnitSprite(GetUnitSMSId(unit));
    }

    ForceSyncUnitSpriteSheet();
}

void PrepAutoCapDeployUnits(struct ProcAtMenu *proc)
{
    int i;

    proc->cur_counter = 0;
    proc->unit_count = 0;

    for (i = 0; i < PrepGetUnitAmount(); proc->unit_count++, i++) {
        struct Unit *unit = GetUnitFromPrepList(i);

        if (unit->state & 8)
            continue;

        if (unit->state & US_NOT_DEPLOYED)
            continue;

        if (proc->cur_counter >= proc->max_counter)
            unit->state = 8;
        else
            proc->cur_counter++;
    }

    if (proc->unit_count < proc->max_counter)
        proc->max_counter = proc->unit_count;
}
