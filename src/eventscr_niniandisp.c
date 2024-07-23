#include "gbafe.h"

struct BmBgxConf CONST_DATA BmBgfxConf_NinianDisp[] = {
    { BMFX_CONFT_PAL,        gUnk_081AD68C, 0x0001, 0 },
    { BMFX_CONFT_ZIMG,       gUnk_081AD6AC, 0x1000, 1 },
    { BMFX_CONFT_ZIMG,       gUnk_081ADE60, 0x1000, 0 },
    { BMFX_CONFT_TSA,        gUnk_081AE528,      0, 1 },
    { BMFX_CONFT_TSA,        gUnk_081AE64C,      0, 2 },
    { BMFX_CONFT_TSA,        gUnk_081AE770,      0, 2 },
    { BMFX_CONFT_TSA,        gUnk_081AE894,      0, 2 },
    { BMFX_CONFT_LOOP_START },
    { BMFX_CONFT_TSA,        gUnk_081AE770,      0, 2 },
    { BMFX_CONFT_TSA,        gUnk_081AE64C,      0, 2 },
    { BMFX_CONFT_TSA,        gUnk_081AE528,      0, 1 },
    { BMFX_CONFT_TSA,        gUnk_081AE64C,      0, 2 },
    { BMFX_CONFT_TSA,        gUnk_081AE770,      0, 2 },
    { BMFX_CONFT_TSA,        gUnk_081AE894,      0, 2 },
    { BMFX_CONFT_LOOP, 0, 0, 255 },
    { BMFX_CONFT_TSA,        gUnk_081AE9B8,      0, 2 },
    { BMFX_CONFT_TSA,        gUnk_081AEADC,      0, 2 },
    { BMFX_CONFT_TSA,        gUnk_081AEC00,      0, 2 },
    { BMFX_CONFT_ZIMG,       gUnk_081AED24, 0x1000, 1 },
    { BMFX_CONFT_ZIMG,       gUnk_081AF718, 0x1000, 0 },
    { BMFX_CONFT_TSA,        gUnk_081B0044,      0, 1 },
    { BMFX_CONFT_TSA,        gUnk_081B0168,      0, 2 },
    { BMFX_CONFT_TSA,        gUnk_081B028C,      0, 2 },
    { BMFX_CONFT_TSA,        gUnk_081B03B0,      0, 2 },
    { BMFX_CONFT_TSA,        gUnk_081B04D4,      0, 2 },
    { BMFX_CONFT_ZIMG,       gUnk_081B05F8, 0x1000, 1 },
    { BMFX_CONFT_ZIMG,       gUnk_081B10CC, 0x1000, 0 },
    { BMFX_CONFT_TSA,        gUnk_081B1660,      0, 1 },
    { BMFX_CONFT_TSA,        gUnk_081B1784,      0, 2 },
    { BMFX_CONFT_TSA,        gUnk_081B18A8,      0, 2 },
    { BMFX_CONFT_ZIMG,       gUnk_081B19CC, 0x1000, 1 },
    { BMFX_CONFT_ZIMG,       gUnk_081B23C8, 0x1000, 0 },
    { BMFX_CONFT_TSA,        gUnk_081B2AD8,      0, 1 },
    { BMFX_CONFT_TSA,        gUnk_081B2BFC,      0, 2 },
    { BMFX_CONFT_TSA,        gUnk_081B2D20,      0, 2 },
    { BMFX_CONFT_ZIMG,       gUnk_081B2E44, 0x1000, 1 },
    { BMFX_CONFT_ZIMG,       gUnk_081B36D8, 0x1000, 0 },
    { BMFX_CONFT_TSA,        gUnk_081B3A88,      0, 1 },
    { BMFX_CONFT_TSA,        gUnk_081B3BAC,      0, 2 },
    { BMFX_CONFT_TSA,        gUnk_081B3CD0,      0, 2 },
    { BMFX_CONFT_END },
};

struct ProcCmd CONST_DATA ProcScr_NinianAppearfx[] = {
    PROC_YIELD,
    PROC_CALL(NinianAppear_Init),
    PROC_CALL(NinianAppear_Anim1),
    PROC_REPEAT(NinianAppear_LoopAnim1),
    PROC_CALL(NinianAppear_EndAnim1),
    PROC_CALL(NinianAppear_Anim2),
    PROC_REPEAT(NinianAppear_LoadUnit),
    PROC_WHILE(CheckBmBgfxDone),
    PROC_CALL(NinianAppear_End),
    PROC_END,
};

void NinianAppear_Init(struct ProcNinianAppear * proc)
{
    proc->timer = 0;

    gDispIo.bg0_ct.priority = 0;
    gDispIo.bg1_ct.priority = 1;
    gDispIo.bg2_ct.priority = 0;
    gDispIo.bg3_ct.priority = 3;

    SetBlendAlpha(0x10, 0x10);
    SetBlendTargetA(0, 0, 1, 0, 0);
    SetBlendTargetB(0, 0, 0, 1, 1);
}

void NinianDisp_FadeIn_Unused(struct ProcNinianAppear * proc)
{
    proc->timer++;
    WriteFadedPaletteFromArchive(
        0x100 - proc->timer,
        0x100 - proc->timer,
        0x100 - proc->timer,
        0xFFFFBFFF);

    if (proc->timer == 0x40)
    {
        proc->timer = 0;
        Proc_Break(proc);
    }
}

void NinianDisp_FadeOut_Unused(struct ProcNinianAppear * proc)
{
    proc->timer++;
    WriteFadedPaletteFromArchive(
        proc->timer + 0xC0,
        proc->timer + 0xC0,
        proc->timer + 0xC0,
        0xFFFFBFFF);

    if (proc->timer == 0x40)
    {
        proc->timer = 0;
        Proc_Break(proc);
    }
}

void NinianDisp_AnimLoopEnd_Unused(struct ProcNinianAppear * proc)
{
    if (++proc->timer == 1000)
    {
        BmBgfxSetLoopEN(false);
        Proc_Break(proc);
    }
}

void NinianAppear_Anim1(struct ProcNinianAppear * proc)
{
    int i;

    Decompress(Img_NinianDispfx, OBJ_VRAM0 + OBCHR_NINIANDISP * CHR_SIZE);
    ApplyPalette(Pal_NinianDispfx, 0x10 + OBPAL_NINIANDISP);

    for (i = 0; i < 8; i++)
        proc->approc[i] = StartSpriteAnimProc(
                            SpritAnim_NinianDispfx,
                            0x180,
                            0,
                            OAM2_CHR(OBCHR_NINIANDISP) + OAM2_PAL(OBPAL_NINIANDISP),
                            0,
                            4);

    proc->timer = 0;
}

void NinianAppear_LoopAnim1(struct ProcNinianAppear * proc)
{
    int i, ix, iy;
    int frc, terminator;
    int val1, val2, base_angle;

    terminator = 0xA0;

    ++proc->timer;
    ix = OAM1_X(SCREEN_TILE_IX(proc->x) + 8);
    iy = OAM0_Y(SCREEN_TILE_IY(proc->y) + 8);
    frc = 160 - proc->timer;
    val1 = (frc * 120 * frc) / 0x6400;
    val2 = (frc * 256 * frc) / 0x6400;

    base_angle = 272 - val2;
    for (i = 0; i < 8; i++)
    {
        int angle = (base_angle + 0x20 * i);
        int _x = 120 - ((COS_Q12(angle & 0xFF) * val1) >> 0xC);
        int _y = 80 - ((SIN_Q12(angle) * val1) >> 0xC);

        SetSpriteAnimProcParameters(
            proc->approc[i],
            OAM1_X(_x),
            OAM0_Y(_y) + OAM0_BLEND,
            -1
        );
    }

    if (proc->timer == (terminator / 3))
        StartSpriteAnimProc(
            SpritAnim_NinianDispfx,
            ix,
            iy + OAM0_BLEND,
            OAM2_CHR(OBCHR_NINIANDISP) + OAM2_PAL(OBPAL_NINIANDISP),
            1,
            4);

    if (proc->timer == terminator)
        Proc_Break(proc);
}

void NinianAppear_EndAnim1(struct ProcNinianAppear * proc)
{
    int i;
    for (i = 0; i < 8; i++)
        EndSpriteAnimProc(proc->approc[i]);
}

void NinianAppear_Anim2(struct ProcNinianAppear * proc)
{
#if BUGFIX
    int ix = OAM1_X(SCREEN_TILE_IX(proc->x) - 0x28);
#else
    int ix = OAM0_Y(SCREEN_TILE_IX(proc->x) - 0x28);
#endif
    int iy = OAM0_Y(SCREEN_TILE_IY(proc->y) - 0x28);

    StartBmBgfx(
        BmBgfxConf_NinianDisp,
        BG_2,
        ix, iy,
        0,
        0x2000,
        BGPAL_NINIANDISP,
        NULL,
        proc
    );

    proc->timer = 0;
}

void NinianAppear_LoadUnit(struct ProcNinianAppear * proc)
{
    void * unk;

    proc->timer++;

    unk = NULL;
    if (proc->timer == 20)
    {
        EventLoadUnit(
            0xDC, // todo: pid
            0x40, // todo: jid
            proc->x,
            proc->y,
            proc->x,
            proc->y,
            FACTION_ID_GREEN,
            unk
        );
    }

    if (proc->timer == 0x28)
    {
        proc->timer = 0;
        BmBgfxSetLoopEN(false);
        Proc_Break(proc);
    }
}

void NinianAppear_End(struct ProcNinianAppear * proc)
{
#if BUGFIX
    SetBlendNone();
#else
    SetBlendConfig(BLEND_EFFECT_NONE, 0, 0x10, 0);
#endif

    InitBmBgLayers();
}

int EventE4_NinianDisplay(struct EventProc * proc)
{
    struct ProcNinianAppear * procfx;
    int x = proc->script[1];
    int y = proc->script[2];

    if (proc->flags & EVENT_FLAG_SKIPPED)
    {
        EventLoadUnit(0xDC, 0x54, x, y, x, y, FACTION_ID_GREEN, NULL);
        return EVENT_CMDRET_CONTINUE;
    }

    procfx = Proc_StartBlocking(ProcScr_NinianAppearfx, proc);
    procfx->x = x;
    procfx->y = y;
    return EVENT_CMDRET_YIELD;
}
