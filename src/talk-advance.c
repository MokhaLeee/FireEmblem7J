#include "gbafe.h"

struct ProcCmd CONST_DATA ProcScr_TalkAdvanceDeamon[] = {
    PROC_SET_END_CB(TalkAdvanceDeamon_End),
    PROC_WHILE(TalkAdvanceDeamon_Loop),
    PROC_END,
};

bool TalkAdvanceDeamon_Loop(ProcPtr proc)
{
    return Proc_Exists(ProcScr_TalkAdvance);
}

void TalkAdvanceDeamon_End(ProcPtr proc)
{
    Proc_EndEach(ProcScr_TalkAdvance);
}

struct ProcCmd CONST_DATA ProcScr_TalkAdvance[] = {
    PROC_CALL(TalkAdvance_Init),
    PROC_REPEAT(TalkAdvance_Loop),
    PROC_END,
};

void CleanTalkObjects(int chr, int lines, int _fill, ProcPtr parent)
{
    struct ProcTalkAdvance * proc;
    
    proc = Proc_Start(ProcScr_TalkAdvance, PROC_TREE_VSYNC);

    proc->dst = (0x3FF & chr) * CHR_SIZE + OBJ_VRAM0;
    proc->lines = lines;
    proc->_fill = _fill;
    Proc_StartBlocking(ProcScr_TalkAdvanceDeamon, parent);
}

void TalkAdvance_Init(struct ProcTalkAdvance * proc)
{
    proc->timer = 0;
}

void TalkAdvance_Loop(struct ProcTalkAdvance * proc)
{
    int ix, iy;
    u32 * dst = proc->dst;

    for (ix = 0; ix < proc->lines * 8; ix += 8)
    {
        for (iy = 0; iy <= 0x300; iy += 0x100)
        {
            (dst + ix + iy)[0] = (dst + ix + iy)[1];
            (dst + ix + iy)[1] = (dst + ix + iy)[2];
            (dst + ix + iy)[2] = (dst + ix + iy)[3];
            (dst + ix + iy)[3] = (dst + ix + iy)[4];
            (dst + ix + iy)[4] = (dst + ix + iy)[5];
            (dst + ix + iy)[5] = (dst + ix + iy)[6];
            (dst + ix + iy)[6] = (dst + ix + iy)[7];

            if (iy < 0x300)
                (dst + ix + iy)[7] = (dst + ix + iy)[0x100]; // next line
            else
                (dst + ix + iy)[7] = proc->_fill;
        }
    }

    proc->timer++;
    if (proc->timer > 15)
        Proc_Break(proc);
}
