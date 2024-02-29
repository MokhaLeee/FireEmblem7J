#include "gbafe.h"

void EventDragonsDownfx_Init(struct ProcEventDragonsDownfx * proc)
{
    int i;
    proc->unk6B = 0;

    for (i = 0; i < 3; i++)
    {
        proc->approc[i] = NULL;
        proc->unk38[i] |= 0xFFFF;
        proc->unk5C[i] = 0;
    }
}

void EventDragonsDownfx_End(struct ProcEventDragonsDownfx * proc)
{
    int i;
    for (i = 0; i < 3; i++)
    {
        if (proc->approc[i])
            EndSpriteAnimProc(proc->approc[i]);
    }
}

struct ProcCmd CONST_DATA ProcScr_EventDragonsDownfx[] = {
    PROC_CALL(EventDragonsDownfx_Init),
    PROC_SET_END_CB(EventDragonsDownfx_End),
    PROC_REPEAT(EventDragonsDownfx_Loop),
    PROC_END,
};
