#include "gbafe.h"

void EventDragonsSpritefx_Init(struct ProcEventDragonsSpritefx * proc)
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

void EventDragonsSpritefx_End(struct ProcEventDragonsSpritefx * proc)
{
    int i;
    for (i = 0; i < 3; i++)
    {
        if (proc->approc[i])
            EndSpriteAnimProc(proc->approc[i]);
    }
}

struct ProcCmd CONST_DATA ProcScr_EventDragonsSpritefx[] = {
    PROC_CALL(EventDragonsSpritefx_Init),
    PROC_SET_END_CB(EventDragonsSpritefx_End),
    PROC_REPEAT(EventDragonsSpritefx_Loop),
    PROC_END,
};
