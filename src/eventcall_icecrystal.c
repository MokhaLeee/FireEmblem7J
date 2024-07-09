#include "gbafe.h"

struct ProcCmd CONST_DATA ProcScr_IceCrystalfx[] = {
    PROC_YIELD,
    PROC_CALL(IceCrystalfx_Start),
    PROC_WHILE(CheckBmBgfxDone),
    PROC_SLEEP(40),
    PROC_CALL(IceCrystalfx_ResetPalette),
    PROC_REPEAT(IceCrystalfx_RefrainPalette),
    PROC_REPEAT(IceCrystalfx_Paluse),
    PROC_END,
};

void IceCrystalfx_Start(struct ProcIceCrystal * proc)
{
    ArchiveCurrentPalettes();
    proc->timer = 0;

    SetBlendAlpha(0x10, 0x10);
    SetBlendTargetA(0, 0, 1, 0, 0);
    SetBlendTargetB(1, 1, 1, 1, 1);

    InitScanlineEffect();
    sub_80780E0(0, 0);

    SetOnHBlankA(NULL);
    SetOnHBlankA(HBlank_Scanline_8078098);

    gDispIo.bg0_ct.priority = 0;
    gDispIo.bg1_ct.priority = 1;
    gDispIo.bg2_ct.priority = 1;
    gDispIo.bg3_ct.priority = 3;

    EnableBgSync(BG0_SYNC_BIT | BG1_SYNC_BIT | BG2_SYNC_BIT);

    StartBmBgfx(
        BmBgfxConf_IceCrystal,
        BG_2,
        0, 0,
        0x1000,
        0x2000,
        0,
        NULL, proc
    );

    PlaySoundEffect(0x2FA);
}

void IceCrystalfx_ResetPalette(struct ProcIceCrystal * proc)
{
    proc->timer = 0x100;
    ArchiveCurrentPalettes();
    StartEventHorizontalQuakefxViolentlyNoSound(proc);
}

void IceCrystalfx_RefrainPalette(struct ProcIceCrystal * proc)
{
    proc->timer += 0x10;

    WriteFadedPaletteFromArchive(proc->timer, proc->timer, proc->timer, 1);

    if (proc->timer == 0x200)
    {
        StartEventHorizontalQuakefxSlightlyNoSound(proc);
        proc->timer = 0;
        Proc_Break(proc);
    }
}

void IceCrystalfx_Paluse(struct ProcIceCrystal * proc)
{
    int time = ++proc->timer >> 2;
    SetBlendAlpha(0x10 - time, 0x10);

    if (time == 0x10)
    {
        TmFill(gBg2Tm, 0);
        EnableBgSync(BG2_SYNC_BIT);

        gDispIo.bg0_ct.priority = 0;
        gDispIo.bg1_ct.priority = 1;
        gDispIo.bg2_ct.priority = 2;
        gDispIo.bg3_ct.priority = 3;

        SetOnHBlankA(NULL);
        Proc_Break(proc);
    }
}

void StartLoadIceCrystal(ProcPtr proc)
{
    Proc_StartBlocking(ProcScr_IceCrystalfx, proc);
}
