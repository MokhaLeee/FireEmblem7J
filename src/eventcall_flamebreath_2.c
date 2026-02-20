#include "gbafe.h"

void StartFlameBreathfx(int type, int x, int y, ProcPtr parent)
{
    struct ProcFlameBreathfx *proc;

    proc = Proc_StartBlocking(ProcScr_FlameBreathfx, parent);

    proc->type = type;
    proc->x = x;
    proc->y = y;
}
