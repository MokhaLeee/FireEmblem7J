#include "gbafe.h"

/**
 * Unit torn out
 */
struct ProcCmd CONST_DATA ProcScr_UnitTornOut[] = {
    PROC_YIELD,
    PROC_CALL(UnitTornOut_Init),
    PROC_REPEAT(UnitTornOut_Loop),
    PROC_END,
};

void UnitTornOut_Init(struct ProcUnitTornOut * proc)
{
    proc->counter = 0;
}

void UnitTornOut_Loop(struct ProcUnitTornOut * proc)
{
    struct Unit * unit = proc->unit;
    int count = proc->counter;

    TornOutUnitSprite(unit, count);

    if (proc->counter++ == 63)
    {
        unit->state |= US_HIDDEN | US_NOT_DEPLOYED;
        RefreshEntityMaps();
        RefreshUnitSprites();
        Proc_Break(proc);
    }
}

void StartUnitTornOut(struct Unit * unit, ProcPtr parent)
{
    struct ProcUnitTornOut * proc;
    proc = Proc_Start(ProcScr_UnitTornOut, parent);
    proc->unit = unit;
}

bool sub_807CDEC(void)
{
    if (sub_809F9F8() > 0)
        return true;

    return false;
}

bool sub_807CE00(void)
{
    if (sub_809F9F8() > 1)
        return true;

    return false;
}
