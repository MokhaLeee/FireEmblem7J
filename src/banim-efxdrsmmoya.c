#include "gbafe.h"

struct ProcCmd CONST_DATA ProcScr_EfxDrsmmoya[] = {
    PROC_19,
    PROC_REPEAT(EfxDrsmmoya_Loop),
    PROC_END,
};

void NewEfxDrsmmoya(struct Anim * anim)
{
    struct ProcEfx * proc;

    SpellFx_ClearBG1Position();
    proc = Proc_Start(ProcScr_EfxDrsmmoya, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
}

void EfxDrsmmoya_Loop(struct ProcEfx * proc);
