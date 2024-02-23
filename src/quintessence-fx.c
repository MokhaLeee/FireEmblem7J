#include "gbafe.h"

struct QuintessenceFxProc
{
    /* 00 */ PROC_HEADER;
    /* 29 */ STRUCT_PAD(0x29, 0x4C);

    /* 4C */ s16 unk_4c;

    /* 4E */ STRUCT_PAD(0x4E, 0x58);

    /* 58 */ int unk_58;
};

void sub_807CA30(struct QuintessenceFxProc * proc)
{
    proc->unk_58++;

    sub_80781C8(sub_8077CEC(1, 0), proc->unk_58, 3, 2, 0, 60, 16);
    sub_80781C8(sub_8077CEC(1, 160), proc->unk_58, 2, 4, 0, 60, 16);

    sub_8077898();
}

void sub_807CA94(struct QuintessenceFxProc * proc)
{
    proc->unk_58 = 0;
}

void sub_807CA9C(struct QuintessenceFxProc * proc)
{
    proc->unk_58++;
    SetBgOffset(BG_2, proc->unk_58 >> 2, proc->unk_58 >> 1);
}

extern struct ProcCmd gUnk_08D6FA14[];

void sub_807CAB8(struct QuintessenceFxProc * proc)
{
    gDispIo.blend_ct.effect = 1;

    gDispIo.blend_coef_a = 0;
    gDispIo.blend_coef_b = 16;
    gDispIo.blend_y = 0;

    SetBlendTargetA(0, 0, 1, 0, 0);
    SetBlendTargetB(0, 0, 0, 1, 0);

    ApplyPalette(gUnk_081BD6C4, 5);
    Decompress(gUnk_08406218, (void *)0x06004000);
    TmApplyTsa_thm(gBg2Tm, gUnk_081BD6E4, 0x5200);

    EnableBgSync(BG2_SYNC_BIT | BG3_SYNC_BIT);
    SetBgOffset(BG_2, 0, 0);

    proc->unk_4c = 0;
    proc->unk_58 = 0;

    sub_807702C();

    SetOnHBlankA(sub_807850C);
    StartParallelWorker(sub_807CA30, proc);

    Proc_Start(gUnk_08D6FA14, PROC_TREE_VSYNC);
}

void sub_807CB80(struct QuintessenceFxProc * proc)
{
    int bld_amt = proc->unk_4c++ >> 1;

    gDispIo.blend_ct.effect = 1;

    gDispIo.blend_coef_a = bld_amt;
    gDispIo.blend_coef_b = 16 - bld_amt;
    gDispIo.blend_y = 0;

    if (bld_amt == 16)
    {
        Proc_Break(proc);
    }
}

void sub_807CBD0(struct QuintessenceFxProc * proc)
{
    gDispIo.blend_ct.effect = 1;

    gDispIo.blend_coef_a = 16;
    gDispIo.blend_coef_b = 0;
    gDispIo.blend_y = 0;

    SetBlendTargetA(0, 0, 1, 0, 0);
    SetBlendTargetB(0, 0, 0, 1, 1);

    proc->unk_4c = 0;
}

void sub_807CC2C(struct QuintessenceFxProc * proc)
{
    int bld_amt = proc->unk_4c++ >> 2;

    gDispIo.blend_ct.effect = 1;

    gDispIo.blend_coef_a = 16 - bld_amt;
    gDispIo.blend_coef_b = bld_amt;
    gDispIo.blend_y = 0;

    if (bld_amt == 10)
    {
        Proc_Break(proc);
    }
}

void sub_807CC7C(struct QuintessenceFxProc * proc)
{
    int bld_amt = proc->unk_4c++ >> 2;

    gDispIo.blend_ct.effect = 1;

    gDispIo.blend_coef_a = 16 - bld_amt;
    gDispIo.blend_coef_b = bld_amt;
    gDispIo.blend_y = 0;

    if (bld_amt == 16)
    {
        Proc_Break(proc);
    }
}

void sub_807CCCC(void)
{
    Proc_End(Proc_Find(gUnk_08D6FA14));

    SetOnHBlankA(NULL);

    SetBgOffset(BG_2, 0, 0);
    TmFill(gBg2Tm, 0);

    EnableBgSync(BG2_SYNC_BIT);

    gDispIo.bg0_ct.priority = 0;
    gDispIo.bg1_ct.priority = 1;
    gDispIo.bg2_ct.priority = 2;
    gDispIo.bg3_ct.priority = 3;
}

extern struct ProcCmd gUnk_08D6FA2C[];

void sub_807CD34(struct Proc * parent)
{
    Proc_Start(gUnk_08D6FA2C, parent);
}

void sub_807CD48(void)
{
    Proc_Goto(Proc_Find(gUnk_08D6FA2C), 0);
}

void sub_807CD60(void)
{
    Proc_Goto(Proc_Find(gUnk_08D6FA2C), 1);
}

void sub_807CD78(void)
{
    Proc_End(Proc_Find(gUnk_08D6FA2C));
}
