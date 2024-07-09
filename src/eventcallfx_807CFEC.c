#include "gbafe.h"

/**
 * Unit torn out
 */
struct ProcCmd CONST_DATA ProcScr_UnitTornOut[] = {
    PROC_YIELD,
    PROC_CALL(UnitTornOut_Init),
    PROC_REPEAT(UnitTornOut_Loop),
    PROC_END,
};

void UnitTornOut_Init(struct ProcUnitTornOut * proc)
{
    proc->counter = 0;
}

void UnitTornOut_Loop(struct ProcUnitTornOut * proc)
{
    struct Unit * unit = proc->unit;
    int count = proc->counter;

    TornOutUnitSprite(unit, count);

    if (proc->counter++ == 63)
    {
        unit->state |= US_HIDDEN | US_NOT_DEPLOYED;
        RefreshEntityMaps();
        RefreshUnitSprites();
        Proc_Break(proc);
    }
}

void StartUnitTornOut(struct Unit * unit, ProcPtr parent)
{
    struct ProcUnitTornOut * proc;
    proc = Proc_Start(ProcScr_UnitTornOut, parent);
    proc->unit = unit;
}

bool sub_807CDEC(void)
{
    if (sub_809F9F8() > 0)
        return true;

    return false;
}

bool sub_807CE00(void)
{
    if (sub_809F9F8() > 1)
        return true;

    return false;
}

struct ProcCmd CONST_DATA ProcScr_08D6FAE4[] = {
    PROC_YIELD,
    PROC_CALL(sub_807CE90),
    PROC_REPEAT(sub_807CF94),
    PROC_REPEAT(sub_807CFEC),
    PROC_REPEAT(sub_807D088),
    PROC_CALL(sub_807D0E0),
    PROC_END,
};

void sub_807CE14(struct Proc_08D6FAE4 * proc)
{
    proc->bg_offset += 8;

    ScanlineRotation(GetScanlineBuf(1, 0), proc->bg_offset, 2, 2, GetBgYOffset(BG_0), 0x50, 1);
    ScanlineRotation(GetScanlineBuf(1, 0xA0), proc->bg_offset, 3, 2, GetBgXOffset(BG_0), 0x50, 1);

    SwapScanlineBufs();
}

void sub_807CE90(struct Proc_08D6FAE4 * proc)
{
    u8 * tsalut[2] = {
        Tsa_081A7F20,
        Tsa_081A8764
    };

    gDispIo.bg0_ct.priority = 0;
    gDispIo.bg1_ct.priority = 1;
    gDispIo.bg2_ct.priority = 2;
    gDispIo.bg3_ct.priority = 3;

    SetBlendAlpha(0, 0x10);

    SetBlendTargetA(1, 0, 0, 0, 0);
    SetBlendTargetB(0, 1, 1, 1, 1);

    Decompress(Img_081A7634, (void *)BG_VRAM + 0x800);
    ApplyPalette(Pal_081A7F00, 5);
    TmApplyTsa(gBg0Tm, tsalut[proc->type], 0x5040);

    SetBgOffset(BG_0, (-proc->x) & 0xFF, (-proc->y) & 0xFF);
    EnableBgSync(BG0_SYNC_BIT);
    proc->timer = 0;

    InitScanlineEffect();
    SetOnHBlankA(HBlank_Scanline_80782AC);
    StartParallelWorker(sub_807CE14, proc);
}

void sub_807CF94(struct Proc_08D6FAE4 * proc)
{
    int time = proc->timer++ * 2;
    SetBlendAlpha(time, 0x10 - time / 2);

    if (time == 0x10)
    {
        proc->timer = 0;
        Proc_Break(proc);
    }
}
