#include "gbafe.h"

struct Unit * FindNextStatScreenUnit(struct Unit * current_unit, int iter_step)
{
    int faction = UNIT_FACTION(current_unit);
    int i = current_unit->index;

    struct Unit * unit;

    while (TRUE)
    {
        i = (i + iter_step) & 0x3F;

        unit = GetUnit(faction + i);
        if (!UNIT_IS_VALID(unit))
            continue;

        if ((gStatScreenInfo.excluded_unit_flags & STATSCREEN_CONFIG_NONDEAD) && (unit->state & US_DEAD))
            continue;

        if ((gStatScreenInfo.excluded_unit_flags & STATSCREEN_CONFIG_NONBENCHED) && (unit->state & US_NOT_DEPLOYED))
            continue;

        if ((gStatScreenInfo.excluded_unit_flags & STATSCREEN_CONFIG_NONUNK9) && (unit->state & US_CONCEALED))
            continue;

        if ((gStatScreenInfo.excluded_unit_flags & STATSCREEN_CONFIG_NONROOFED) && (unit->state & US_UNDER_A_ROOF))
            continue;

        if ((gStatScreenInfo.excluded_unit_flags & STATSCREEN_CONFIG_NONUNK16) && (unit->state & US_BIT16))
            continue;

        if ((gStatScreenInfo.excluded_unit_flags & STATSCREEN_CONFIG_NONSUPPLY) && (UNIT_CATTRIBUTES(unit) & CA_SUPPLY))
            continue;

        if (UNIT_CLASS_ID(unit) == 0x49)
            continue;

        if (UNIT_CHAR_ID(unit) == 0x9E)
            continue;

        return unit;
    }
}

s8 CONST_DATA gStatScreenPageSlideOffsetLut[] =
{
    // transition page out
    -4, -7, -10, -12, -14,

    INT8_MAX, // draw new page

    // transition page in
    13, 9, 7, 5, 3, 2, 1, 0,

    INT8_MIN, // end
};

void StatScreenPageSlide_Loop(struct StatScreenPageSlideProc * proc)
{
    int off;
    int len, dst_offset, src_offset;

    // clear page frame on bg0, bg1, bg2
    TmFillRect(gBg0Tm + TM_OFFSET(PAGE_FRAME_SCREEN_X, PAGE_FRAME_SCREEN_Y), 18, 18, 0);
    TmFillRect(gBg1Tm + TM_OFFSET(PAGE_FRAME_SCREEN_X, PAGE_FRAME_SCREEN_Y), 18, 18, 0);
    TmFillRect(gBg2Tm + TM_OFFSET(PAGE_FRAME_SCREEN_X, PAGE_FRAME_SCREEN_Y), 18, 18, 0);

    off = gStatScreenPageSlideOffsetLut[proc->clock];

    if (off == INT8_MAX)
    {
        // INT8_MAX offset means switch to displaying next page

        PutStatScreenPage(proc->new_page);

        proc->clock++;
        off = gStatScreenPageSlideOffsetLut[proc->clock];
    }

    // compute len, dst_offset and src_offset
    // len is the length of the display bit of the page
    // dst_offset is the x offset to which to copy the page to
    // src_offset is the x offset from which to copy the page from

    if (proc->key_bit & DPAD_LEFT)
        off = -off;

    len = 18 - abs(off);

    if (off < 0)
    {
        dst_offset = 0;
        src_offset = -off;
    }
    else
    {
        dst_offset = off;
        src_offset = 0;
    }

    TmCopyRect(gUiTmScratchA + src_offset,
        gBg0Tm + dst_offset + TM_OFFSET(PAGE_FRAME_SCREEN_X, PAGE_FRAME_SCREEN_Y),
        len, 18);

    TmCopyRect(gUiTmScratchB + src_offset,
        gBg1Tm + dst_offset + TM_OFFSET(PAGE_FRAME_SCREEN_X, PAGE_FRAME_SCREEN_Y),
        len, 18);

    TmCopyRect(gUiTmScratchC + src_offset,
        gBg2Tm + dst_offset + TM_OFFSET(PAGE_FRAME_SCREEN_X, PAGE_FRAME_SCREEN_Y),
        len, 18);

    EnableBgSync(BG0_SYNC_BIT + BG1_SYNC_BIT + BG2_SYNC_BIT);

    proc->clock++;
    off = gStatScreenPageSlideOffsetLut[proc->clock];

    if (off == INT8_MIN)
        Proc_Break(proc);
}

void StatScreenPageSlide_End(struct StatScreenPageSlideProc * proc)
{
    gStatScreenSt.is_transitioning = FALSE;
}

struct ProcCmd CONST_DATA ProcScr_StatScreenPageSlide[] =
{
    PROC_REPEAT(StatScreenPageSlide_Loop),
    PROC_CALL(StatScreenPageSlide_End),
    PROC_END,
};

void StartStatScreenPageSlide(u16 key_bit, int new_page, ProcPtr parent)
{
    struct StatScreenPageSlideProc * proc;

    if (Proc_Find(ProcScr_StatScreenPageSlide) != NULL)
        return;

    PlaySoundEffect(0x38F);

    proc = Proc_StartBlocking(ProcScr_StatScreenPageSlide, parent);

    proc->clock = 0;
    proc->new_page = new_page;
    proc->key_bit = key_bit;

    gStatScreenSt.page_slide_key_bit = key_bit;
    gStatScreenSt.help = NULL;
    gStatScreenSt.is_transitioning = TRUE;
}

void StatScreenUnitSlide_FadeOutInit(struct StatScreenUnitSlideProc * proc)
{
    gStatScreenSt.is_transitioning = TRUE;

    proc->clock = 4;

    // TODO: macro?
    gDispIo.bg0_ct.priority = 1;
    gDispIo.bg1_ct.priority = 3;
    gDispIo.bg2_ct.priority = 2;
    gDispIo.bg3_ct.priority = 0;

    SetBlendTargetA(0, 0, 0, 1, 0);
    SetBlendTargetB(1, 1, 1, 0, 1); SetBlendBackdropB(0);

    if (proc->direction > 0)
    {
        proc->y_disp_init = 0;
        proc->y_disp_fini = -60;
    }
    else
    {
        proc->y_disp_init = 0;
        proc->y_disp_fini = +60;
    }
}

void StatScreenUnitSlide_FadeOutLoop(struct StatScreenUnitSlideProc * proc)
{
    enum { CLOCK_STEP = 3, CLOCK_END = 0x10 };

    SetBlendAlpha(proc->clock * 0x10 / CLOCK_END, (CLOCK_END - proc->clock) * 0x10 / CLOCK_END);

    SetMuScreenPosition(gStatScreenSt.mu, 80, 138 + gStatScreenSt.y_disp_off);

    gStatScreenSt.y_disp_off = Interpolate(INTERPOLATE_CUBIC, proc->y_disp_init, proc->y_disp_fini, proc->clock, CLOCK_END);

    proc->clock += CLOCK_STEP;

    if (proc->clock > CLOCK_END)
        Proc_Break(proc);
}

void StatScreenUnitSlide_FadeInInit(struct StatScreenUnitSlideProc * proc)
{
    proc->clock = 1;

    // TODO: macro?
    gDispIo.bg0_ct.priority = 1;
    gDispIo.bg1_ct.priority = 3;
    gDispIo.bg2_ct.priority = 2;
    gDispIo.bg3_ct.priority = 0;

    SetBlendTargetA(0, 0, 0, 1, 0);
    SetBlendTargetB(1, 1, 1, 0, 1);

    if (proc->direction > 0)
    {
        proc->y_disp_init = +60;
        proc->y_disp_fini = 0;
    }
    else
    {
        proc->y_disp_init = -60;
        proc->y_disp_fini = 0;
    }
}

void StatScreenUnitSlide_FadeInLoop(struct StatScreenUnitSlideProc * proc)
{
    enum { CLOCK_STEP = 3, CLOCK_END = 0x10 };

    SetBlendAlpha((CLOCK_END - proc->clock) * 0x10 / CLOCK_END, proc->clock * 0x10 / CLOCK_END);

    SetMuScreenPosition(gStatScreenSt.mu, 80, 138 + gStatScreenSt.y_disp_off);

    gStatScreenSt.y_disp_off = Interpolate(INTERPOLATE_RCUBIC, proc->y_disp_init, proc->y_disp_fini, proc->clock, CLOCK_END);

    proc->clock += CLOCK_STEP;

    if (proc->clock >= CLOCK_END)
        Proc_Break(proc);
}

void StatScreenUnitSlide_ChangeUnit(struct StatScreenUnitSlideProc * proc)
{
    gStatScreenSt.unit = GetUnit(proc->new_unit_id);
    StatScreen_InitUnit(Proc_Find(ProcScr_StatScreen));
    Proc_Break(proc);
}

void StatScreenUnitSlide_End(struct StatScreenUnitSlideProc * proc)
{
    if (gStatScreenSt.mu != NULL)
    {
        SetMuScreenPosition(gStatScreenSt.mu, 80, 138);
    }

    // TODO: macro?
    gDispIo.bg0_ct.priority = 1;
    gDispIo.bg1_ct.priority = 3;
    gDispIo.bg2_ct.priority = 2;
    gDispIo.bg3_ct.priority = 3;

    SetBlendTargetA(0, 0, 1, 0, 0);
    SetBlendTargetB(0, 0, 0, 1, 0);
    SetBlendAlpha(6, 8);

    gStatScreenSt.is_transitioning = FALSE;
}

struct ProcCmd CONST_DATA ProcScr_StatScreenUnitSlide[] =
{
    PROC_SLEEP(0),
    PROC_CALL(StatScreenUnitSlide_FadeOutInit),
    PROC_REPEAT(StatScreenUnitSlide_FadeOutLoop),
    PROC_CALL(StatScreenUnitSlide_ChangeUnit),
    PROC_CALL(StatScreenUnitSlide_FadeInInit),
    PROC_REPEAT(StatScreenUnitSlide_FadeInLoop),
    PROC_CALL(StatScreenUnitSlide_End),
    PROC_END,
};

void StartStatScreenUnitSlide(struct Unit * unit, int direction, ProcPtr parent)
{
    struct StatScreenUnitSlideProc * proc;

    proc = Proc_StartBlocking(ProcScr_StatScreenUnitSlide, parent);

    proc->new_unit_id = unit->index;
    proc->direction = direction;

    PlaySoundEffect(0xC8);
}

u16 CONST_DATA Sprite_StatScreenPageName[] =
{
    3,
    OAM0_SHAPE_32x16 + OAM0_AFFINE_ENABLE, OAM1_SIZE_32x16 + OAM1_AFFINE_ID(8), 0,
    OAM0_SHAPE_32x16 + OAM0_AFFINE_ENABLE, OAM1_SIZE_32x16 + OAM1_X(32) + OAM1_AFFINE_ID(8), OAM2_CHR(0x4),
    OAM0_SHAPE_32x16 + OAM0_AFFINE_ENABLE, OAM1_SIZE_32x16 + OAM1_X(64) + OAM1_AFFINE_ID(8), OAM2_CHR(0x8),
};

u16 CONST_DATA gStatScreenPageNameChrOffsetLut[] =
{
    OAM2_CHR(0x14),
    OAM2_CHR(0x08),
    OAM2_CHR(0x54),
};

void PutUpdateStatScreenPageName(int page_id)
{
    int color_num;

    PutSprite(4,
        109 + gStatScreenSt.x_disp_off,
        5 + gStatScreenSt.y_disp_off,
        Sprite_StatScreenPageName,
        OAM2_CHR(OBCHR_STATSCREEN_240) + OAM2_PAL(OBPAL_STATSCREEN_PAGENAME) + gStatScreenPageNameChrOffsetLut[page_id] + OAM2_LAYER(3));

    color_num = (GetGameTime() / 4) % 16;

    CpuCopy16(
        Pals_StatScreen_Title[page_id] + color_num,
        gPal + (0x10 + OBPAL_STATSCREEN_PAGENAME) * 0x10 + 4,
        sizeof(u16) * 11);

    EnablePalSync();
}

struct ProcCmd CONST_DATA ProcScr_StatScreenPageName[] = {
    PROC_CALL(StatScreenPageName_Init),
PROC_LABEL(0),
    PROC_REPEAT(StatScreenPageName_Main),
    PROC_REPEAT(StatScreenPageName_CloseMain),
    PROC_SLEEP(1),
    PROC_REPEAT(StatScreenPageName_OpenMain),
    PROC_GOTO(0),
    PROC_END,
};

u16 CONST_DATA Sprite_StatScreenMuAreaBackground[] = {
    12,
    OAM0_SHAPE_32x8 + OAM0_Y(128) + OAM0_BLEND, OAM1_SIZE_32x8 + OAM1_X(8), OAM2_CHR(0x45),
    OAM0_SHAPE_32x8 + OAM0_Y(128) + OAM0_BLEND, OAM1_SIZE_32x8 + OAM1_X(32), OAM2_CHR(0x46),
    OAM0_SHAPE_32x8 + OAM0_Y(144) + OAM0_BLEND, OAM1_SIZE_32x8 + OAM1_X(8), OAM2_CHR(0x45),
    OAM0_SHAPE_32x8 + OAM0_Y(144) + OAM0_BLEND, OAM1_SIZE_32x8 + OAM1_X(32), OAM2_CHR(0x46),
    OAM0_SHAPE_32x32 + OAM0_Y(104) + OAM0_BLEND, OAM1_SIZE_32x32, 0,
    OAM0_SHAPE_32x32 + OAM0_Y(104) + OAM0_BLEND, OAM1_SIZE_32x32 + OAM1_X(32), 0,
    OAM0_SHAPE_32x32 + OAM0_Y(104) + OAM0_BLEND, OAM1_SIZE_32x32 + OAM1_X(64), 0,
    OAM0_SHAPE_32x32 + OAM0_Y(120) + OAM0_BLEND, OAM1_SIZE_32x32, 0,
    OAM0_SHAPE_32x32 + OAM0_Y(120) + OAM0_BLEND, OAM1_SIZE_32x32 + OAM1_X(32), 0,
    OAM0_SHAPE_32x32 + OAM0_Y(120) + OAM0_BLEND, OAM1_SIZE_32x32 + OAM1_X(64), 0,
    OAM0_SHAPE_8x32 + OAM0_Y(104) + OAM0_BLEND, OAM1_SIZE_8x32 + OAM1_X(96), OAM2_CHR(0x4),
    OAM0_SHAPE_8x32 + OAM0_Y(120) + OAM0_BLEND, OAM1_SIZE_8x32 + OAM1_X(96) + OAM1_VFLIP, OAM2_CHR(0x4),
};

u16 CONST_DATA Sprite_StatScreenFaceSideWindow[] = {
    17,
    OAM0_SHAPE_8x8, OAM1_SIZE_8x8 + OAM1_X(424) + OAM1_HFLIP, 0,
    OAM0_SHAPE_16x8, OAM1_SIZE_16x8 + OAM1_X(432), OAM2_CHR(0x6),
    OAM0_SHAPE_32x8, OAM1_SIZE_32x8 + OAM1_X(448), OAM2_CHR(0x6),
    OAM0_SHAPE_32x8, OAM1_SIZE_32x8 + OAM1_X(480), OAM2_CHR(0x6),
    OAM0_SHAPE_8x8, OAM1_SIZE_8x8, 0,
    OAM0_SHAPE_8x8 + OAM0_Y(8), OAM1_SIZE_8x8, OAM2_CHR(0x1),
    OAM0_SHAPE_8x8 + OAM0_Y(16), OAM1_SIZE_8x8, OAM2_CHR(0x1),
    OAM0_SHAPE_8x8 + OAM0_Y(24), OAM1_SIZE_8x8, OAM2_CHR(0x1),
    OAM0_SHAPE_8x8 + OAM0_Y(32), OAM1_SIZE_8x8, OAM2_CHR(0x1),
    OAM0_SHAPE_8x8 + OAM0_Y(40), OAM1_SIZE_8x8, OAM2_CHR(0x1),
    OAM0_SHAPE_8x8 + OAM0_Y(48), OAM1_SIZE_8x8, OAM2_CHR(0x1),
    OAM0_SHAPE_8x8 + OAM0_Y(56), OAM1_SIZE_8x8, OAM2_CHR(0x1),
    OAM0_SHAPE_8x8 + OAM0_Y(64), OAM1_SIZE_8x8, OAM2_CHR(0x1),
    OAM0_SHAPE_8x8 + OAM0_Y(72), OAM1_SIZE_8x8, OAM2_CHR(0x1),
    OAM0_SHAPE_8x8 + OAM0_Y(80), OAM1_SIZE_8x8, OAM2_CHR(0x2),
    OAM0_SHAPE_8x8 + OAM0_Y(88), OAM1_SIZE_8x8, OAM2_CHR(0x3),
    OAM0_SHAPE_8x8 + OAM0_Y(96), OAM1_SIZE_8x8, OAM2_CHR(0x4),
};

struct ProcCmd CONST_DATA ProcScr_StatScreenSprites[] = {
    PROC_CALL(StatScreenSprites_Init),
PROC_LABEL(0),
    PROC_YIELD,
    PROC_CALL(StatScreenSprites_BumpCheck),
    PROC_CALL(StatScreenSprites_PutArrows),
    PROC_CALL(StatScreenSprites_PutNumberLabel),
    PROC_CALL(StatScreenSprites_PutMuAreaSprites),
    PROC_CALL(StatScreenSprites_PutRescueMarkers),
    PROC_GOTO(0),
    PROC_END,
};
