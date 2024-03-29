#include "gbafe.h"

struct QuintessenceFxProc
{
    /* 00 */ PROC_HEADER;
    /* 29 */ STRUCT_PAD(0x29, 0x4C);

    /* 4C */ s16 timer;

    /* 4E */ STRUCT_PAD(0x4E, 0x58);

    /* 58 */ int bg2_offset;
};

void QuintessenceFx_ParallelWorker(struct QuintessenceFxProc * proc)
{
    proc->bg2_offset++;

    sub_80781C8(sub_8077CEC(1, 0), proc->bg2_offset, 3, 2, 0, 60, 16);
    sub_80781C8(sub_8077CEC(1, 160), proc->bg2_offset, 2, 4, 0, 60, 16);

    SwapScanlineBufs();
}

void QuintFxBg2_Init(struct QuintessenceFxProc * proc)
{
    proc->bg2_offset = 0;
}

void QuintFxBg2_Loop(struct QuintessenceFxProc * proc)
{
    proc->bg2_offset++;
    SetBgOffset(BG_2, proc->bg2_offset >> 2, proc->bg2_offset >> 1);
}

// clang-format off

struct ProcCmd CONST_DATA ProcScr_QuintessenceFxBg2Scroll[] = {
    PROC_CALL(QuintFxBg2_Init),
    PROC_REPEAT(QuintFxBg2_Loop),

    PROC_END,
};

// clang-format on

void QuintessenceFx_Init_Main(struct QuintessenceFxProc * proc)
{
    gDispIo.blend_ct.effect = 1;

    gDispIo.blend_coef_a = 0;
    gDispIo.blend_coef_b = 16;
    gDispIo.blend_y = 0;

    SetBlendTargetA(0, 0, 1, 0, 0);
    SetBlendTargetB(0, 0, 0, 1, 0);

    ApplyPalette(Pal_QuintessenceFx, 5);
    Decompress(Img_ChapterIntroFog, (void *)0x06004000);
    TmApplyTsa_thm(gBg2Tm, Tsa_QuintessenceFx, 0x5200);

    EnableBgSync(BG2_SYNC_BIT | BG3_SYNC_BIT);
    SetBgOffset(BG_2, 0, 0);

    proc->timer = 0;
    proc->bg2_offset = 0;

    InitScanlineEffect();

    SetOnHBlankA(QuintessenceFx_OnHBlank);
    StartParallelWorker(QuintessenceFx_ParallelWorker, proc);

    Proc_Start(ProcScr_QuintessenceFxBg2Scroll, PROC_TREE_VSYNC);
}

void QuintessenceFx_Loop_A(struct QuintessenceFxProc * proc)
{
    int bld_amt = proc->timer++ >> 1;

    gDispIo.blend_ct.effect = 1;

    gDispIo.blend_coef_a = bld_amt;
    gDispIo.blend_coef_b = 16 - bld_amt;
    gDispIo.blend_y = 0;

    if (bld_amt == 16)
    {
        Proc_Break(proc);
    }
}

void QuintessenceFx_ResetBlend(struct QuintessenceFxProc * proc)
{
    gDispIo.blend_ct.effect = 1;

    gDispIo.blend_coef_a = 16;
    gDispIo.blend_coef_b = 0;
    gDispIo.blend_y = 0;

    SetBlendTargetA(0, 0, 1, 0, 0);
    SetBlendTargetB(0, 0, 0, 1, 1);

    proc->timer = 0;
}

void QuintessenceFx_Loop_B(struct QuintessenceFxProc * proc)
{
    int bld_amt = proc->timer++ >> 2;

    gDispIo.blend_ct.effect = 1;

    gDispIo.blend_coef_a = 16 - bld_amt;
    gDispIo.blend_coef_b = bld_amt;
    gDispIo.blend_y = 0;

    if (bld_amt == 10)
    {
        Proc_Break(proc);
    }
}

void QuintessenceFx_Loop_C(struct QuintessenceFxProc * proc)
{
    int bld_amt = proc->timer++ >> 2;

    gDispIo.blend_ct.effect = 1;

    gDispIo.blend_coef_a = 16 - bld_amt;
    gDispIo.blend_coef_b = bld_amt;
    gDispIo.blend_y = 0;

    if (bld_amt == 16)
    {
        Proc_Break(proc);
    }
}

void QuintessenceFx_OnEnd(void)
{
    Proc_End(Proc_Find(ProcScr_QuintessenceFxBg2Scroll));

    SetOnHBlankA(NULL);

    SetBgOffset(BG_2, 0, 0);
    TmFill(gBg2Tm, 0);

    EnableBgSync(BG2_SYNC_BIT);

    gDispIo.bg0_ct.priority = 0;
    gDispIo.bg1_ct.priority = 1;
    gDispIo.bg2_ct.priority = 2;
    gDispIo.bg3_ct.priority = 3;
}

// clang-format off

struct ProcCmd CONST_DATA ProcScr_QuintessenceFx[] = {
    PROC_SET_END_CB(QuintessenceFx_OnEnd),

    PROC_CALL(TryLockParentProc),
    PROC_CALL(QuintessenceFx_Init_Main),
    PROC_REPEAT(QuintessenceFx_Loop_A),
    PROC_CALL(TryUnlockParentProc),

    PROC_BLOCK,

PROC_LABEL(0),
    PROC_CALL(TryLockParentProc),
    PROC_CALL(QuintessenceFx_ResetBlend),
    PROC_REPEAT(QuintessenceFx_Loop_B),
    PROC_CALL(TryUnlockParentProc),

    PROC_BLOCK,

PROC_LABEL(1),
    PROC_CALL(TryLockParentProc),
    PROC_CALL(QuintessenceFx_ResetBlend),
    PROC_REPEAT(QuintessenceFx_Loop_C),
    PROC_CALL(TryUnlockParentProc),

    PROC_BLOCK,

    PROC_END,
};

// clang-format on

void StartQuintessenceStealEffect(struct Proc * parent)
{
    Proc_Start(ProcScr_QuintessenceFx, parent);
}

void QuintessenceFx_Goto_B(void)
{
    Proc_Goto(Proc_Find(ProcScr_QuintessenceFx), 0);
}

void QuintessenceFx_Goto_C(void)
{
    Proc_Goto(Proc_Find(ProcScr_QuintessenceFx), 1);
}

void EndQuintessenceStealEffect(void)
{
    Proc_End(Proc_Find(ProcScr_QuintessenceFx));
}
