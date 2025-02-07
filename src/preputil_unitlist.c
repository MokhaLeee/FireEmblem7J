#include "gbafe.h"

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
