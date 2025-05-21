#include "gbafe.h"

void SetFlag_145(void)
{
    SetFlag(0x91);
}

void ClearFlag_145(void)
{
    ClearFlag(0x91);
}

struct ProcDragonGateFx
{
    /* 00 */ PROC_HEADER;
    /* 29 */ STRUCT_PAD(0x29, 0x4C);
    /* 4C */ s16 unk_4c;
    /* 4E */ STRUCT_PAD(0x4E, 0x58);
    /* 58 */ int unk_58;
    /* 5C */ STRUCT_PAD(0x5C, 0x64);
    /* 64 */ s16 unk_64;
};

void DragonGatefx_DistortionHandler(struct ProcDragonGateFx * proc)
{
    proc->unk_58++;

    sub_8077714(GetScanlineBuf(1, 0), proc->unk_58, 8, 3);
    sub_8077794(GetScanlineBuf(1, 160), proc->unk_58, 8, 3, GetBgXOffset(BG_3));
    SwapScanlineBufs();

    SetBgOffset(proc->unk_64, GetBgXOffset(BG_3), 0);
}

void DragonGatefx_DrawLight(struct ProcDragonGateFx * proc)
{
    proc->unk_58 = 0;
    proc->unk_4c = 0;

    SetBgOffset(BG_1, 0, 0);
    SetBgOffset(BG_2, 0, 0);

    gDispIo.bg0_ct.priority = 0;
    gDispIo.bg1_ct.priority = 1;
    gDispIo.bg2_ct.priority = 3;
    gDispIo.bg3_ct.priority = 2;

    Decompress(Img_DragonGateLight, (void *)0x06004000);
    TmApplyTsa_thm(gBg2Tm, Tsa_DragonGateLight, TILEREF(0x200, 6));
    ApplyPalette(Pal_DragonGateLight, 6);
    EnableBgSync(BG2_SYNC_BIT);

    StartMixPalette(Pal_DragonGateLight, gUnk_081C0A70, 2, 6, 1, proc);

    InitScanlineEffect();

    SetOnHBlankA(DragonGatefx_LightHBlank);
    StartParallelWorker(DragonGatefx_DistortionHandler, proc);

    proc->unk_64 = 2;
}

void DragonGatefx_DrawDragon(struct ProcDragonGateFx * proc)
{
    SetOnHBlankA(DragonGatefx_DragonHBlank);

    SetBlendAlpha(0, 16);

    gDispIo.bg0_ct.priority = 0;
    gDispIo.bg1_ct.priority = 3;
    gDispIo.bg2_ct.priority = 3;
    gDispIo.bg3_ct.priority = 2;

    SetBlendTargetA(0, 1, 0, 0, 0);
    SetBlendTargetB(0, 0, 1, 0, 0);

    Decompress(Img_DragonGateDragon, (void *)0x06003000);
    TmApplyTsa_thm(gBg1Tm, Tsa_DragonGateDragon, TILEREF(0x180, 7));
    ApplyPalette(Pal_DragonGateDragon, 7);
    EnableBgSync(BG1_SYNC_BIT);

    proc->unk_4c = 0;

    TryLockProc(proc->proc_parent);

    proc->unk_64 = 1;
}

void DragonGatefx_MergeDragon(struct ProcDragonGateFx * proc)
{
    s32 blend_amt = ++proc->unk_4c >> 2;

    SetBlendAlpha(blend_amt, 16 - blend_amt);

    if (blend_amt == 16)
    {
        Proc_Break(proc);
        TmFill(gBg2Tm, TILEREF(0x0, 0));
        EnableBgSync(BG2_SYNC_BIT);
    }
}

void sub_807BB48(struct ProcDragonGateFx * proc)
{
    SetBlendConfig(BLEND_EFFECT_NONE, 16, 0, 0);

    CpuFastCopy((void *)0x06003000, (void *)0x06004000, 0x1000);

    TmApplyTsa_thm(gBg2Tm, Tsa_DragonGateDragon, TILEREF(0x200, 7));
    EnableBgSync(BG2_SYNC_BIT);

    TmFill(gBg1Tm, TILEREF(0x0, 0));
    EnableBgSync(BG1_SYNC_BIT);

    gDispIo.bg0_ct.priority = 0;
    gDispIo.bg1_ct.priority = 1;
    gDispIo.bg2_ct.priority = 3;
    gDispIo.bg3_ct.priority = 2;

    TryUnlockProc(proc->proc_parent);

    proc->unk_64 = 2;
}

void DragonGatefxSetHBlank(void)
{
    SetOnHBlankA(DragonGatefx_LightHBlank);
}

void DragonGatefx_End(void)
{
    CpuFastFill(0, (void *)0x06003000, 0x3000);
    SetOnHBlankA(NULL);

    gDispIo.bg0_ct.priority = 0;
    gDispIo.bg1_ct.priority = 1;
    gDispIo.bg2_ct.priority = 2;
    gDispIo.bg3_ct.priority = 3;
}

// clang-format off

struct ProcCmd CONST_DATA ProcScr_DragonGatefx[] =
{
    PROC_SET_END_CB(DragonGatefx_End),
    PROC_CALL(DragonGatefx_DrawLight),

    PROC_BLOCK,

PROC_LABEL(0),
    PROC_CALL(DragonGatefx_DrawDragon),
    PROC_REPEAT(DragonGatefx_MergeDragon),

    PROC_CALL(sub_807BB48),
    PROC_SLEEP(1),

    PROC_CALL(DragonGatefxSetHBlank),
    PROC_BLOCK,

    PROC_END,
};

// clang-format on

void EventCall_StartDragonGatefx(ProcPtr parent)
{
    Proc_Start(ProcScr_DragonGatefx, parent);
}

void DrawDragonGateDragonfx(void)
{
    Proc_Goto(Proc_Find(ProcScr_DragonGatefx), 0);
}

void EndDragonGatefx(void)
{
    Proc_End(Proc_Find(ProcScr_DragonGatefx));
}

struct DragonSpriteBlinkingProc
{
    /* 00 */ PROC_HEADER;
    /* 29 */ STRUCT_PAD(0x29, 0x4C);
    /* 4C */ s16 timer;
};

void DragonSpriteBlinking_Init(struct DragonSpriteBlinkingProc * proc)
{
    proc->timer = 0;
}

void DragonSpriteBlinking_Loop(struct DragonSpriteBlinkingProc * proc)
{
    struct Unit * unit = GetUnitFromCharId(0x86);

    proc->timer++;

    if ((unit != NULL) && (proc->timer & 1))
    {
        if (!(unit->state & US_NOT_DEPLOYED))
        {
            unit->state ^= US_HIDDEN;
            RefreshEntityMaps();
            RefreshUnitSprites();
        }
    }
}

// clang-format off

struct ProcCmd CONST_DATA ProcScr_DragonSpriteBlinking[] =
{
    PROC_CALL(DragonSpriteBlinking_Init),
    PROC_REPEAT(DragonSpriteBlinking_Loop),
    /* BUG: no end? */
};

// clang-format on

void StartDragonSpriteBlinking(ProcPtr parent)
{
    Proc_Start(ProcScr_DragonSpriteBlinking, parent);
}

void EndDragonSpriteBlinking(void)
{
    Proc_End(Proc_Find(ProcScr_DragonSpriteBlinking));
}
