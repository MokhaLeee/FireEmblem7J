#include "gbafe.h"

/**
 * Proc for handling the epilogue cutscene when Zephiel is
 * visited by Jahn in Bern Keep.
 */

void sub_807C66C(char * str)
{
    struct Font font;
    struct Text text;

    InitBgs(NULL);

    ResetText();
    InitTextFont(&font, (void *)0x06009000, 0x80, 0);
    SetTextFont(&font);

    CpuFastFill(0, (void *)0x06000000, CHR_SIZE);
    CpuFastFill(0, (void *)0x06008000, CHR_SIZE);

    InitText(&text, 20);
    PutText(&text, gBg3Tm + TM_OFFSET(5, 9));

    Text_InsertDrawString(&text, GetStringTextCenteredPos(160, str), TEXT_COLOR_SYSTEM_WHITE, str);
    SetTextFont(NULL);
}

struct ProcZephielEpilogue
{
    /* 00 */ PROC_HEADER;
    /* 29 */ STRUCT_PAD(0x29, 0x4C);
    /* 4C */ s16 timer;
    /* 4E */ STRUCT_PAD(0x4E, 0x58);
    /* 58 */ int unk_58;
};

void CandleFlameFx_ScanlineEffect(struct ProcZephielEpilogue * proc)
{
    proc->unk_58 += 2;
    ScanlineRotation(GetScanlineBuf(1, 0), proc->unk_58, 7, 7, 0, 30, 8);
    ScanlineRotation(GetScanlineBuf(1, 160), (proc->unk_58 * 2), 3, 15, 0, 30, 8);
    SwapScanlineBufs();
}

void StartCandleFlameFx(ProcPtr proc)
{
    TmFill(gBg1Tm, TILEREF(0x0, 0));

    Decompress(Img_CandleFlame, (void *)0x06000800);
    TmApplyTsa_thm(gBg1Tm, Tsa_CandleFlame, TILEREF(0x40, 7));
    ApplyPalette(Pal_CandleFlame, 7);
    EnableBgSync(BG1_SYNC_BIT);

    InitScanlineEffect();

    SetOnHBlankA(CandleFlameFx_OnHBlank);
    StartParallelWorker(CandleFlameFx_ScanlineEffect, proc);

    StartMixPalette(gUnk_0857E570, gUnk_08453438, 2, 8, 7, proc);
}

void EndCandleFlamePaletteFx(void)
{
    EndMixPalette();
}

void ZephielEpilogue_Init(struct ProcZephielEpilogue * proc)
{
    int i;

    EndMixPalette();

    SetDispEnable(1, 1, 0, 1, 1);
    SetBlendAlpha(0, 16);
    SetBlendTargetA(0, 0, 0, 1, 0);
    SetBlendTargetB(0, 1, 1, 0, 0);

    // Copy the CG of Zephiel in his keep from BG3 to BG2
    // in preparation for revealing the CG of his visitor (Jahn)

    CpuFastCopy((void *)0x06008000, (void *)0x06001000, 0x5000);
    CpuFastCopy(PAL_BG(8), PAL_BG(0), PLTT_SIZE_4BPP * 7);

    for (i = 0; i < 0x400; i++)
    {
        gBg2Tm[i] = gBg3Tm[i] + TILEREF(0x80, 8);
    }

    EnablePalSync();
    EnableBgSync(BG2_SYNC_BIT);

    proc->timer = 0;
}

void ZephielEpilogue_EnableBg2(void)
{
    SetDispEnable(1, 1, 1, 1, 1);
}

void ZephielEpilogue_LoadNewCg(struct ProcZephielEpilogue * proc)
{
    // Load the CG of Zephiel with Jahn visiting on BG3
    sub_80B7980(gBg3Tm, 0x8000, 8, 8, 0x37);

    EnableBgSync(BG3_SYNC_BIT);

    gDispIo.bg0_ct.priority = 0;
    gDispIo.bg1_ct.priority = 1;
    gDispIo.bg2_ct.priority = 2;
    gDispIo.bg3_ct.priority = 0;

    StartMixPalette(gUnk_08583EE4, gUnk_08453538, 2, 8, 7, proc->proc_parent);
}

void ZephielEpilogue_Loop_BlendCgs(struct ProcZephielEpilogue * proc)
{
    int blend_amt = proc->timer++ >> 1;

    SetBlendAlpha(blend_amt, 16 - blend_amt);

    if (blend_amt == 16)
    {
        Proc_Break(proc);
    }
}

void ZephielEpilogue_End(void)
{
    TmFill(gBg1Tm, TILEREF(0x0, 0));
    TmFill(gBg2Tm, TILEREF(0x0, 0));
    EnableBgSync(BG1_SYNC_BIT | BG2_SYNC_BIT);

    SetBlendConfig(BLEND_EFFECT_NONE, 0, 0, 0);

    gDispIo.bg0_ct.priority = 0;
    gDispIo.bg1_ct.priority = 1;
    gDispIo.bg2_ct.priority = 2;
    gDispIo.bg3_ct.priority = 3;

    EndAllParallelWorkers();
    SetOnHBlankA(NULL);
}

// clang-format off

struct ProcCmd CONST_DATA ProcScr_ZephielEpilogue[] =
{
    PROC_CALL(ZephielEpilogue_Init),
    PROC_YIELD,

    PROC_CALL(ZephielEpilogue_EnableBg2),
    PROC_YIELD,

    PROC_CALL(ZephielEpilogue_LoadNewCg),
    PROC_REPEAT(ZephielEpilogue_Loop_BlendCgs),

    PROC_CALL(ZephielEpilogue_End),

    PROC_END,
};

// clang-format on

void StartZephielJahnEpilogueCg(ProcPtr parent)
{
    Proc_StartBlocking(ProcScr_ZephielEpilogue, parent);
}
