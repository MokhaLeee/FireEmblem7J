#include "gbafe.h"

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
    /* 4C */ s16 unk_4C;
    /* 4E */ STRUCT_PAD(0x4E, 0x58);
    /* 58 */ int unk_58;
};

void sub_807C6F0(struct ProcZephielEpilogue * proc)
{
    proc->unk_58 += 2;
    ScanlineRotation(GetScanlineBuf(1, 0), proc->unk_58, 7, 7, 0, 30, 8);
    ScanlineRotation(GetScanlineBuf(1, 160), (proc->unk_58 * 2), 3, 15, 0, 30, 8);
    SwapScanlineBufs();
}

void sub_807C754(ProcPtr proc)
{
    TmFill(gBg1Tm, TILEREF(0x0, 0));

    Decompress(gUnk_08452D90, (void *)0x06000800);
    TmApplyTsa_thm(gBg1Tm, gUnk_08452E90, TILEREF(0x40, 7));
    ApplyPalette(gUnk_08452E70, 7);
    EnableBgSync(BG1_SYNC_BIT);

    InitScanlineEffect();

    SetOnHBlankA(sub_8078130);
    StartParallelWorker(sub_807C6F0, proc);

    StartMixPalette(gUnk_0857E570, gUnk_08453438, 2, 8, 7, proc);
}

void sub_807C7DC(void)
{
    EndMixPalette();
}

void sub_807C7E8(struct ProcZephielEpilogue * proc)
{
    int i;

    EndMixPalette();

    SetDispEnable(1, 1, 0, 1, 1);
    SetBlendAlpha(0, 16);
    SetBlendTargetA(0, 0, 0, 1, 0);
    SetBlendTargetB(0, 1, 1, 0, 0);

    CpuFastCopy((void *)0x06008000, (void *)0x06001000, 0x5000);
    CpuFastCopy(PAL_BG(8), PAL_BG(0), PLTT_SIZE_4BPP * 7);

    for (i = 0; i < 0x400; i++)
    {
        gBg2Tm[i] = gBg3Tm[i] + TILEREF(0x80, 8);
    }

    EnablePalSync();
    EnableBgSync(BG2_SYNC_BIT);

    proc->unk_4C = 0;
}

void sub_807C8BC(void)
{
    SetDispEnable(1, 1, 1, 1, 1);
}

void sub_807C8DC(struct ProcZephielEpilogue * proc)
{
    sub_80B7980(gBg3Tm, 0x8000, 8, 8, 0x37);

    EnableBgSync(BG3_SYNC_BIT);

    gDispIo.bg0_ct.priority = 0;
    gDispIo.bg1_ct.priority = 1;
    gDispIo.bg2_ct.priority = 2;
    gDispIo.bg3_ct.priority = 0;

    StartMixPalette(gUnk_08583EE4, gUnk_08453538, 2, 8, 7, proc->proc_parent);
}

void sub_807C954(struct ProcZephielEpilogue * proc)
{
    int blend_amt = proc->unk_4C++ >> 1;

    SetBlendAlpha(blend_amt, 16 - blend_amt);

    if (blend_amt == 16)
    {
        Proc_Break(proc);
    }
}

void sub_807C9A4(void)
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

struct ProcCmd CONST_DATA gUnk_08D6F9D4[] =
{
    PROC_CALL(sub_807C7E8),
    PROC_YIELD,

    PROC_CALL(sub_807C8BC),
    PROC_YIELD,

    PROC_CALL(sub_807C8DC),
    PROC_REPEAT(sub_807C954),

    PROC_CALL(sub_807C9A4),

    PROC_END,
};

// clang-format on

void sub_807CA1C(ProcPtr parent)
{
    Proc_StartBlocking(gUnk_08D6F9D4, parent);
}
