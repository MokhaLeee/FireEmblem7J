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

void sub_807BD6C(int x, int y)
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
        PlaySoundEffect(SONG_F8);
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

void sub_807BFEC(struct ProcDragonFlamefx * proc)
{
    SetBlendAlpha(16, 16);
    SetBlendTargetA(1, 0, 0, 0, 0);
    SetBlendTargetB(1, 1, 1, 1, 1);
    Proc_End(Proc_Find(ProcScr_EventSpriteAnim));

    PutDragonGateFlame(112, 32);
    proc->timer = 0;
    sub_8013EF8(0x200, 0x200, 0x200, 0x100, 0x100, 0x100, -0x10, 4, proc);
}

void sub_807C080(struct ProcDragonFlamefx * proc)
{
    struct Unit * unit;

    CpuFastCopy(PAL_OBJ(13), PAL_OBJ(11), PLTT_SIZE_4BPP);
    EnablePalSync();

    ArchivePalette(0x1B);

    sub_8013EF8(0x100, 0x100, 0x100, 0x200, 0, 0, 0x08000000, 8, proc);

    unit = GetUnitFromCharId(CHARACTER_DA);

    if (unit != NULL)
    {
        StartUnitTornOut(unit, proc);
        unit->state = US_BIT27;
    }

    unit = GetUnitFromCharId(CHARACTER_FIREDRAGON);

    if (unit != NULL)
    {
        StartUnitTornOut(unit, proc);
        unit->state = US_BIT27;
    }

    PlaySoundEffect(SONG_D6);
}

void sub_807C108(struct ProcDragonFlamefx * proc)
{
    s32 blend_amt;

    if (proc->timer == 0)
    {
        sub_807C080(proc);
        sub_807BD6C(200, 64);
    }

    blend_amt = proc->timer++ >> 3;

    SetBlendAlpha(16 - blend_amt, 16);

    if (blend_amt == 16)
    {
        Proc_Break(proc);
    }
}

void sub_807C170(void)
{
    SetOnHBlankA(NULL);

    TmFill(gBg2Tm, 0);
    TmFill(gBg0Tm, 0);
    EnableBgSync(BG0_SYNC_BIT | BG2_SYNC_BIT);

    gDispIo.bg0_ct.priority = 0;
    gDispIo.bg1_ct.priority = 1;
    gDispIo.bg2_ct.priority = 2;
    gDispIo.bg3_ct.priority = 3;

    SetBlendConfig(BLEND_EFFECT_NONE, 0, 0, 0);
}

extern struct ProcCmd ProcScr_DragonFlamefx[];

void StartDragonFlamefx(ProcPtr parent)
{
    Proc_Start(ProcScr_DragonFlamefx, parent);
}

void EndDragonFlamefx(void)
{
    Proc_End(Proc_Find(ProcScr_DragonFlamefx));
}

void DragonFlamefxFlashingOut(void)
{
    Proc_Goto(Proc_Find(ProcScr_DragonFlamefx), 0);
}

struct ProcDeadDragonFlame
{
    /* 00 */ PROC_HEADER;
    /* 29 */ STRUCT_PAD(0x29, 0x39);
    /* 39 */ bool unk_39;
    /* 3A */ STRUCT_PAD(0x3A, 0x4C);
    /* 4C */ s16 unk_4C;
    /* 4E */ STRUCT_PAD(0x4E, 0x50);
    /* 50 */ int unk_50;
    /* 54 */ int unk_54;
};

bool sub_807C228(struct ProcDeadDragonFlame * proc)
{
    if ((proc->unk_39 != 0) && (proc->unk_54 == 1))
    {
        PlaySoundEffect(SONG_E5);
        proc->unk_50 = 0;
        Proc_Goto(proc->proc_parent, 0);
    }

    if ((proc->unk_54 == 0) && !(proc->unk_50 & 31))
    {
        PlaySoundEffect(SONG_F8);
    }

    return false;
}

void DeadDragonFlame_Init(struct ProcDeadDragonFlame * proc)
{
    ArchiveCurrentPalettes();

    proc->unk_4C = 0;

    SetBlendAlpha(0, 16);
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

    proc->unk_4C = 0;

    StartBmBgfx(BmBgfxConf_DeadDragonFlame, BG_2, 0, 0, 0x1000, 0x2800, 0, sub_807C228, proc);
    sub_8013EF8(0x100, 0x100, 0x100, 0x100, 0x80, 0x80, -2, 8, proc);
}

void DeadDragonFlame_Rotation(struct ProcDeadDragonFlame * proc)
{
    s32 blend_amt = ++proc->unk_4C >> 2;

    SetBlendAlpha(blend_amt, blend_amt <= 6 ? 16 - blend_amt : 10);

    if (blend_amt == 16)
    {
        proc->unk_4C = 0;
        Proc_Break(proc);
    }
}

void sub_807C3E8(struct ProcDeadDragonFlame * proc)
{
    s32 blend_amt = ++proc->unk_4C >> 3;

    SetBlendAlpha(16 - blend_amt, 16);

    if (proc->unk_4C == 80)
    {
        sub_8013EF8(0x100, 0x80, 0x80, 0x200, 0x200, 0x200, -2, 8, proc);
    }

    if (blend_amt == 16)
    {
        Proc_Break(proc);
    }
}

void sub_807C464(void)
{
    s32 i;

    for (i = FACTION_GREEN + 1; i < FACTION_PURPLE; i++)
    {
        struct Unit * unit = GetUnit(i);

        if (!UNIT_IS_VALID(unit))
            continue;

        if (unit->pCharacterData->number == CHARACTER_FIREDRAGON)
            continue;

        ClearUnit(unit);
    }
}

void sub_807C490(ProcPtr proc)
{
    TmFill(gBg2Tm, 0);
    EnableBgSync(BG2_SYNC_BIT);

    SetOnHBlankA(NULL);

    SetBlendConfig(BLEND_EFFECT_NONE, 0, 16, 0);

    gDispIo.bg0_ct.priority = 0;
    gDispIo.bg1_ct.priority = 1;
    gDispIo.bg2_ct.priority = 2;
    gDispIo.bg3_ct.priority = 3;

    SetBlendAlpha(16, 16);
    SetBlendTargetA(1, 0, 0, 0, 0);
    SetBlendTargetB(1, 1, 1, 1, 1);

    PutDragonGateFlame(112, 32);
    sub_807C464();

    RefreshEntityMaps();
    RefreshUnitSprites();

    sub_8013EF8(0x200, 0x200, 0x200, 0x100, 0x100, 0x100, 0xFFDFFFFE, 4, proc);
}

void sub_807C58C(struct ProcDeadDragonFlame * proc)
{
    sub_807BD6C(200, 64);
    proc->unk_4C = 0;
}

void sub_807C5A4(struct ProcDeadDragonFlame * proc)
{
    s32 blend_amt = proc->unk_4C++ >> 3;

    SetBlendAlpha(16 - blend_amt, 16);

    if (proc->unk_4C == 8)
    {
        StartUnitTornOut(GetUnitFromCharId(CHARACTER_FIREDRAGON), proc);
    }

    if (proc->unk_4C == 16)
    {
        PlaySoundEffect(SONG_D6);
    }

    if (blend_amt == 16)
    {
        TmFill(gBg0Tm, 0);
        EnableBgSync(BG0_SYNC_BIT);

        SetBlendConfig(0, 0, 0, 0);

        Proc_Break(proc);
    }
}

extern struct ProcCmd ProcScr_DeadDragonFlamefx[];

void StartDeadDragonFlamefx(ProcPtr parent)
{
    Proc_StartBlocking(ProcScr_DeadDragonFlamefx, parent);
}
