#include "gbafe.h"

struct ProcDragonFlamefx {
    PROC_HEADER;

    STRUCT_PAD(0x29, 0x4C);

    /* 4C */ s16 timer;

    STRUCT_PAD(0x4E, 0x58);

    /* 58 */ int sound_round;

    STRUCT_PAD(0x5C, 0x64);

    /* 64 */ s16 sound_en;
};

void PutDragonGateFlame(int ix, int iy)
{
    ix = (gBmSt.camera.x - ix) & 0xFF;
    iy = (gBmSt.camera.y - iy) & 0xFF;

    ApplyPalette(Pal_DragonGateFlame, BGPAL_BM_0);
    Decompress(Img_DragonGateFlame, (void *)BG_VRAM + 0x800);
    TmApplyTsa(gBg0Tm, Tsa_DragonGateFlame, 0x0040);

    EnableBgSync(BG0_SYNC_BIT);
    SetBgOffset(BG_0, ix, iy);
    EnableBgSync(BG0_SYNC_BIT);
}

void sub_807BD6C(int x, int y, int c)
{
#if NONMATCHING
    StartSpriteAnimfx(
        Img_DragonFlameSmallFire,
        Pal_DragonFlameSmallFire,
        SpriteConf_DragonFlameSmallFire,
        OAM1_X(x),
        OAM0_Y(y),
        0,
        5, // pal_bank
        1, // pal_size
        0x680, // oam2
        4
    );
#else
    int _x = x - gBmSt.camera.x;
    int _oam1 = 0x1FF;
    int _y = y - gBmSt.camera.y;
    int _oam0 = 0x0FF;

    u8  * img = Img_DragonFlameSmallFire;
    u16 * pal = Pal_DragonFlameSmallFire;
    u16 * ap  = SpriteConf_DragonFlameSmallFire;

    _x &= _oam1;
    _y &= _oam0;

    StartSpriteAnimfx(
        img, pal, ap,
        _x, _y,
        0,
        5, // pal_bank
        1, // pal_size
        0x680, // oam2
        4
    );
#endif
}

void DragonFlamefx_Handler(struct ProcDragonFlamefx * proc)
{
    proc->sound_round++;

    if (proc->sound_en != false && (proc->sound_round % 0x20) == 0)
    {
        PlaySoundEffect(0xF8);
    }
}

void DragonFlamefx_Init(struct ProcDragonFlamefx * proc)
{
    EndMixPalette();
    ArchiveCurrentPalettes();

    proc->timer = 0;

    SetBlendAlpha(0, 0x10);
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

    proc->timer = 0;

    StartBmBgfx(
        BmBgfxConf_DragonFlame,
        BG_2,
        0, 0,
        0x4000,
        0x1000,
        0,
        NULL, proc
    );

    sub_8013EF8(0x100, 0x100, 0x100, 0x100, 0x80, 0x80, -0x10, 8, proc);

    proc->sound_round = 0;
    proc->sound_en = true;
    StartParallelWorker(DragonFlamefx_Handler, proc);
}

void DragonFlamefx_Rotation(struct ProcDragonFlamefx * proc)
{
    int time = ++proc->timer >> 1;

    SetBlendAlpha(time, 0x10);

    if (time == 0x10)
    {
        proc->timer = 0;
        Proc_Break(proc);
    }
}

void DragonFlamefx_EndRing(struct ProcDragonFlamefx * proc)
{
    proc->timer = 0;
    BmBgfxSetLoopEN(false);

    sub_8013EF8(0x100, 0x100, 0x100, 0x200, 0x200, 0x200, -0x10, 4, proc);
    proc->sound_en = false;
}

void DragonFlamefx_RefrainBlendAlpha(struct ProcDragonFlamefx * proc)
{
    int time = ++proc->timer >> 1;

    SetBlendAlpha(0x10 - time, 0x10);

    if (time == 0x10)
        Proc_Break(proc);
}
