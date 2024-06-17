#include "gbafe.h"

void SpinRotation_Init(struct ProcSpinRotation * proc)
{
    proc->unk_39 = 0;
    proc->ro = 0;
    proc->unk_35 = 0;
    proc->unk_36 = 0;
    proc->unk_37 = 0;
    proc->unk_38 = 0;
    proc->unk_3A = 0;
    proc->unk_3B = 0;
    proc->unk_3D = 0;
    proc->unk_34 = 0;
}

void SpinRotation_Loop(struct ProcSpinRotation * proc)
{
    proc->ro++;
    proc->angle -= 4;

    sub_80AACB0(2, proc->angle, 0, 0, 0x180, 0x180);
    sub_80AAD44(2, 0x200, 0x100);
    sub_80AAD94(2, 0x78, 0xA0, 0x4C, 0x4C);

    SyncDispIo();
}

struct ProcCmd CONST_DATA ProcScr_SpinRotation[] = {
    PROC_NAME_DEBUG("SpinRotation"),
    PROC_MARK(13),
    PROC_CALL(SpinRotation_Init),
    PROC_REPEAT(SpinRotation_Loop),
    PROC_END,
};

ProcPtr StartSpinRotation(ProcPtr parent)
{
    struct ProcSpinRotation * proc;
    proc = Proc_Start(ProcScr_SpinRotation, PROC_TREE_VSYNC);
    proc->savedraw = parent;
    return proc;
}
