#include "gbafe.h"

void EventSpriteAnimfx_Init(struct ProcEventSpriteAnimfx * proc)
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

void EventSpriteAnimfx_End(struct ProcEventSpriteAnimfx * proc)
{
    int i;
    for (i = 0; i < 3; i++)
    {
        if (proc->approc[i])
            EndSpriteAnimProc(proc->approc[i]);
    }
}

struct ProcCmd CONST_DATA ProcScr_EventSpriteAnimfx[] = {
    PROC_CALL(EventSpriteAnimfx_Init),
    PROC_SET_END_CB(EventSpriteAnimfx_End),
    PROC_REPEAT(EventSpriteAnimfx_Loop),
    PROC_END,
};
