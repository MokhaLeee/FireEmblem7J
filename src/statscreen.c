#include "gbafe.h"

EWRAM_DATA struct StatScreenInfo gStatScreenInfo = {};

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

void StatScreenSprites_Init(struct StatScreenSpritesProc * proc)
{
    proc->x_left = 105;
    proc->x_right = 202;
    proc->clock_right = 0;
    proc->clock_left = 0;
    proc->anim_speed_right = 4;
    proc->anim_speed_left = 4;
}

void StatScreenSprites_BumpCheck(struct StatScreenSpritesProc * proc)
{
    if (gStatScreenSt.page_slide_key_bit & DPAD_LEFT)
    {
        proc->anim_speed_left = 31;
        proc->x_left = 105 - 6;
    }

    if (gStatScreenSt.page_slide_key_bit & DPAD_RIGHT)
    {
        proc->anim_speed_right = 31;
        proc->x_right = 202 + 6;
    }

    gStatScreenSt.page_slide_key_bit = 0;
}

void StatScreenSprites_PutArrows(struct StatScreenSpritesProc * proc)
{
    int base_oam2 = OAM2_CHR(OBCHR_STATSCREEN_240) + OAM2_PAL(OBPAL_STATSCREEN_SPRITES) + OAM2_LAYER(1);

    proc->clock_left += proc->anim_speed_left;
    proc->clock_right += proc->anim_speed_right;

    if (proc->anim_speed_left > 4)
        proc->anim_speed_left--;

    if (proc->anim_speed_right > 4)
        proc->anim_speed_right--;

    if ((GetGameTime() % 4) == 0)
    {
        if (proc->x_left < 105)
            proc->x_left++;

        if (proc->x_right > 202)
            proc->x_right--;
    }

    PutSprite(
        0, gStatScreenSt.x_disp_off + proc->x_left,
        gStatScreenSt.y_disp_off + 6, Sprite_8x16,
        base_oam2 + 0x4A + (proc->clock_left >> 5) % 6);

    PutSprite(
        0, gStatScreenSt.x_disp_off + proc->x_right,
        gStatScreenSt.y_disp_off + 6, Sprite_8x16_HFlipped,
        base_oam2 + 0x4A + (proc->clock_right >> 5) % 6);
}
void StatScreenSprites_PutNumberLabel(struct StatScreenSpritesProc * proc)
{
    enum
    {
        PAGENUM_X = 214,
        PAGENUM_Y = 12
    };

    // page amt
    PutSprite(
        2, gStatScreenSt.x_disp_off + PAGENUM_X + 13,
        gStatScreenSt.y_disp_off + PAGENUM_Y, Sprite_8x8,
        OAM2_CHR(OBCHR_STATSCREEN_240 + 0x64) + OAM2_PAL(OBPAL_STATSCREEN_SPRITES) +
            OAM2_LAYER(3) + gStatScreenSt.page_count);

    // '/'
    PutSprite(
        2, gStatScreenSt.x_disp_off + PAGENUM_X + 7,
        gStatScreenSt.y_disp_off + PAGENUM_Y, Sprite_8x8,
        OAM2_CHR(OBCHR_STATSCREEN_240 + 0x05) + OAM2_PAL(OBPAL_STATSCREEN_SPRITES) +
            OAM2_LAYER(3));

    // page num
    PutSprite(
        2, gStatScreenSt.x_disp_off + PAGENUM_X,
        gStatScreenSt.y_disp_off + PAGENUM_Y, Sprite_8x8,
        OAM2_CHR(OBCHR_STATSCREEN_240 + 0x64) + OAM2_PAL(OBPAL_STATSCREEN_SPRITES) +
            OAM2_LAYER(3) + gStatScreenSt.page + 1);
}

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

void StatScreenSprites_PutMuAreaSprites(struct StatScreenSpritesProc * proc)
{
    PutSprite(12,
        gStatScreenSt.x_disp_off,
        gStatScreenSt.y_disp_off,
        Sprite_StatScreenMuAreaBackground,
        OAM2_CHR(OBCHR_STATSCREEN_240 + 0x00) + OAM2_PAL(OBPAL_STATSCREEN_WINDOWFRAME) + OAM2_LAYER(3));

    PutSprite(11,
        gStatScreenSt.x_disp_off + 64,
        gStatScreenSt.y_disp_off + 131,
        Sprite_32x16,
        OAM2_CHR(OBCHR_STATSCREEN_240 + 0x50) + OAM2_PAL(OBPAL_STATSCREEN_SPRITES) + OAM2_LAYER(3));

    PutSpriteExt(2,
        OAM1_X(gStatScreenSt.x_disp_off + 96),
        OAM0_Y(gStatScreenSt.y_disp_off),
        Sprite_StatScreenFaceSideWindow,
        OAM2_CHR(OBCHR_STATSCREEN_60) + OAM2_PAL(OBPAL_STATSCREEN_10) + OAM2_LAYER(1));
}

void StatScreenSprites_PutRescueMarkers(struct StatScreenSpritesProc * proc)
{
    bool display_icon = (GetGameTime() % 32) < 20;

    u16 pal_lut[3] =
    {
        OBPAL_UNITSPRITE_BLUE,
        OBPAL_UNITSPRITE_GREEN,
        OBPAL_UNITSPRITE_RED,
    };

    if (!gStatScreenSt.is_transitioning)
    {
        if ((gStatScreenSt.page == STATSCREEN_PAGE_PERSONALINFO) && (gStatScreenSt.unit->state & US_RESCUING))
        {
            PutSysArrow(120, 40, TRUE);
            PutSysArrow(120, 56, TRUE);

            if (display_icon)
            {
                PutSprite(4,
                    184, 78, Sprite_8x8,
                    OAM2_CHR(3) + OAM2_PAL(pal_lut[gStatScreenSt.unit->rescue >> 6]) + OAM2_LAYER(2));
            }
        }

        if (gStatScreenSt.unit->state & US_RESCUED)
        {
            if (display_icon)
            {
                PutSprite(4,
                    32, 86, Sprite_8x8,
                    OAM2_CHR(3) + OAM2_PAL(pal_lut[gStatScreenSt.unit->rescue >> 6]) + OAM2_LAYER(2));
            }
        }
    }
}

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

void StatScreen_DisableScreen(ProcPtr proc)
{
    SetDispEnable(0, 0, 0, 0, 0);
    SetBlendDarken(0x10);
    SetBlendTargetA(0, 0, 0, 0, 0);
    SetBlendBackdropA(1);
    SetBackdropColor(0);
}


void StatScreen_Init(ProcPtr proc)
{
    u16 bg_config[12] =
    {
        0x0000, 0x6000, 0,
        0x0000, 0x6800, 0,
        0x8000, 0x7000, 0,
        0x8000, 0x7800, 0,
    };

    InitBgs(bg_config);

    SetBlankChr(0x400);
    TmFill(gBg2Tm, 0);
    EnableBgSync(BG2_SYNC_BIT);

    ApplySystemGraphics();
    ApplyUnitSpritePalettes();

    StartMuralBackgroundAlt(NULL, ((void *) VRAM) + 0x8000 + BGCHR_STATSCREEN_BACKMURAL * CHR_SIZE, -1);

    Decompress(Img_StatScreen_0840392C, ((void *) VRAM + 0x10000) + OBCHR_STATSCREEN_240 * CHR_SIZE);

    ApplyIconPalettes(BGPAL_ICONS);
    ApplyUiStatBarPal(BGPAL_STATSCREEN_6);
    ApplyIconPalette(1, 0x10 + OBPAL_STATSCREEN_PAGENAME);

    Decompress(Tsa_StatScreen_0840349C, gBuf);
    TmApplyTsa(gBg1Tm, gBuf, TILEREF(BGCHR_WINDOWFRAME, BGPAL_WINDOWFRAME));

    Decompress(Img_StatScreen_08403730, ((void *) VRAM) + 0x8000 + BGCHR_STATSCREEN_EQUIPSTATFRAME * CHR_SIZE);
    ApplyPalette(Pal_StatScreen_084038AC, BGPAL_STATSCREEN_EQUIPSTATFRAME);

    CpuFastCopy(gPal + 0x10 * BGPAL_WINDOWFRAME, gPal + 0x100 + 0x10 * OBPAL_STATSCREEN_WINDOWFRAME, 0x20);

    ApplyIconPalette(1, 0x10 + OBPAL_STATSCREEN_SPRITES);

    Decompress(Tsa_StatScreen_0840417C, ((void *) VRAM) + BGCHR_STATSCREEN_EQUIPMENTLABEL * CHR_SIZE);
    Decompress(Tsa_StatScreen_0840368C, (OBJ_VRAM0 + OBCHR_STATSCREEN_60 * CHR_SIZE));
    ApplyPalette(Pal_StatScreen_081DBD64, 0x10 + OBPAL_STATSCREEN_10);

    gStatScreenSt.mu = NULL;

    StatScreenUnitSlide_End(proc);
}

void StatScreen_InitUnit(ProcPtr proc)
{
    int fid = GetUnitPortraitId(gStatScreenSt.unit);
    if (gStatScreenSt.unit->state & US_BIT23)
        fid++;

    gStatScreenSt.page_count = STATSCREEN_PAGE_MAX;

    ResetText();
    InitIcons();
    InitStatScreenText();

    PutFace80x72(
        proc,
        gBg2Tm + TM_OFFSET(2, 1),
        fid,
        0x400 + BGCHR_STATSCREEN_FACE,
        BGPAL_STATSCREEN_FACE);

    if (GetFaceInfo(fid)->img)
        ApplyPalette(Pal_StatScreenFaceDefault, STATSCREEN_BGPAL_2);
    else
        ApplyPalette(Pal_StatScreenFaceGeneric, STATSCREEN_BGPAL_2);

    EndAllMus();
    gStatScreenSt.mu = StartUiMu(gStatScreenSt.unit, 80, 138);

    PutStatScreenLeftPanelInfo();
    PutStatScreenPage(gStatScreenSt.page);

    TmCopyRect(gUiTmScratchA,
        gBg0Tm + TM_OFFSET(PAGE_FRAME_SCREEN_X, PAGE_FRAME_SCREEN_Y),
        18, 18);

    TmCopyRect(gUiTmScratchB,
        gBg1Tm + TM_OFFSET(PAGE_FRAME_SCREEN_X, PAGE_FRAME_SCREEN_Y),
        18, 18);

    TmCopyRect(gUiTmScratchC,
        gBg2Tm + TM_OFFSET(PAGE_FRAME_SCREEN_X, PAGE_FRAME_SCREEN_Y),
        18, 18);

    EnableBgSync(BG0_SYNC_BIT + BG1_SYNC_BIT + BG2_SYNC_BIT);
}

void StatScreen_Main(ProcPtr proc)
{
    struct Unit * unit;

    if (gpKeySt->pressed & B_BUTTON)
    {
        SetDispEnable(0, 0, 0, 0, 0);
        SetBlendDarken(0x10);
        SetBlendTargetA(0, 0, 0, 0, 0);
        SetBlendBackdropA(1);
        SetBackdropColor(0);

        Proc_Break(proc);

        PlaySoundEffect(0x38B);
    }

    else if (gpKeySt->repeated & DPAD_LEFT)
    {
        gStatScreenSt.page = (gStatScreenSt.page + gStatScreenSt.page_count - 1) % gStatScreenSt.page_count;
        StartStatScreenPageSlide(DPAD_LEFT, gStatScreenSt.page, proc);
        return;
    }

    else if (gpKeySt->repeated & DPAD_RIGHT)
    {
        gStatScreenSt.page = (gStatScreenSt.page + gStatScreenSt.page_count + 1) % gStatScreenSt.page_count;
        StartStatScreenPageSlide(DPAD_RIGHT, gStatScreenSt.page, proc);
    }

    else if (gpKeySt->repeated & DPAD_UP)
    {
        unit = FindNextStatScreenUnit(gStatScreenSt.unit, -1);
        StartStatScreenUnitSlide(unit, -1, proc);
    }

    else if (gpKeySt->repeated & DPAD_DOWN)
    {
        unit = FindNextStatScreenUnit(gStatScreenSt.unit, +1);
        StartStatScreenUnitSlide(unit, +1, proc);
    }

    else if ((gpKeySt->repeated & A_BUTTON) && (gStatScreenSt.unit->rescue != 0))
    {
        unit = GetUnit(gStatScreenSt.unit->rescue);
        StartStatScreenUnitSlide(unit, (gStatScreenSt.unit->state & US_RESCUING) ? +1 : -1, proc);
    }

    else if (gpKeySt->pressed & R_BUTTON)
    {
        Proc_Goto(proc, 0); // goto help idle
        StartStatScreenHelp(gStatScreenSt.page, proc);
    }
}

void StatScreen_BackUpStatus(ProcPtr proc)
{
    gPlaySt.chapterStateBits = (gPlaySt.chapterStateBits & ~PLAY_FLAG_STATSCREENPAGE_MASK) | (gStatScreenSt.page & PLAY_FLAG_STATSCREENPAGE_MASK);
    gStatScreenInfo.unit_id = gStatScreenSt.unit->index;
    SetOnVMatch(NULL);
}

void StatScreen_UpdateLastHelpInfo(ProcPtr proc)
{
    gStatScreenSt.help = GetLastHelpBoxInfo();
}

void SyncStatScreenBgOffset(void)
{
    int y_bg = 0xFF & -gStatScreenSt.y_disp_off;

    SetBgOffset(BG_0, 0, y_bg);
    SetBgOffset(BG_1, 0, y_bg);
    SetBgOffset(BG_2, 0, y_bg);
}

void StatScreen_CleanUp(ProcPtr proc)
{
    EndMuralBackground();
}

struct ProcCmd CONST_DATA ProcScr_SyncStatScreenBgOffset[] = {
    PROC_REPEAT(SyncStatScreenBgOffset),
    PROC_END,
};

struct ProcCmd CONST_DATA ProcScr_StatScreen[] = {
    PROC_SET_END_CB(StatScreen_CleanUp),
    PROC_CALL(StatScreen_DisableScreen),
    PROC_CALL(LockBmDisplay),
    PROC_SLEEP(1),
    PROC_CALL(StatScreen_Init),
    PROC_CALL(StartGreenText),
    PROC_CALL(StatScreen_InitUnit),
    PROC_START_CHILD(ProcScr_StatScreenPageName),
    PROC_START_CHILD(ProcScr_StatScreenSprites),
    PROC_START_CHILD(ProcScr_SyncStatScreenBgOffset),
    PROC_GOTO(1),
PROC_LABEL(0),
    PROC_CALL(StatScreen_UpdateLastHelpInfo),
PROC_LABEL(1),
    PROC_REPEAT(StatScreen_Main),
PROC_LABEL(10),
    PROC_CALL(StatScreen_BackUpStatus),
    PROC_CALL(UnlockBmDisplay),
    PROC_CALL(EndAllMus),
    PROC_CALL(EndGreenText),
    PROC_END,
};

void StartStatScreen(struct Unit * unit, ProcPtr parent)
{
    gStatScreenSt.x_disp_off = 0;
    gStatScreenSt.y_disp_off = 0;
    gStatScreenSt.page = (gPlaySt.chapterStateBits >> PLAY_FLAG_STATSCREENPAGE_SHIFT) & PLAY_FLAG_STATSCREENPAGE_MASK;
    gStatScreenSt.unit = unit;
    gStatScreenSt.help = NULL;
    gStatScreenSt.page_slide_key_bit = 0;
    gStatScreenSt.is_transitioning = FALSE;

    PidStatsAddStatView(unit->pCharacterData->number);

    PlaySoundEffect(0x38A);

    Proc_StartBlocking(ProcScr_StatScreen, parent);
}

void StartStatScreenHelp(int page_id, ProcPtr proc)
{
    LoadHelpBoxGfx(NULL, -1);

    if (gStatScreenSt.help == NULL)
    {
        switch (page_id) {
        case STATSCREEN_PAGE_PERSONALINFO:
            gStatScreenSt.help = &HelpInfo_StatScreenPersonalInfo_Pow;
            break;
        
        case STATSCREEN_PAGE_ITEMS:
            gStatScreenSt.help = &HelpInfo_StatScreenItems_ItemA;
            break;

        case STATSCREEN_PAGE_WEXPANDSUPPORTS:
            gStatScreenSt.help = &HelpInfo_StatScreenWeaponExp_WExpA;
            break;
        }
    }
    StartMovingHelpBox(gStatScreenSt.help, proc);
}

void HelpBoxPopulateStatScreenItem(struct HelpBoxProc * proc)
{
    int item = gStatScreenSt.unit->items[proc->info->msg];

    proc->item = item;
    proc->msg = GetItemDescMsg(item);
}

void HelpBoxPopulateStatScreenStatus(struct HelpBoxProc * proc)
{
    switch (gStatScreenSt.unit->statusIndex)
    {

    case UNIT_STATUS_NONE:
        proc->msg = 0x273;
        break;

    case UNIT_STATUS_POISON:
        proc->msg = 0x274;
        break;

    case UNIT_STATUS_SLEEP:
        proc->msg = 0x275;
        break;

    case UNIT_STATUS_SILENCED:
        proc->msg = 0x277;
        break;

    case UNIT_STATUS_BERSERK:
        proc->msg = 0x276;
        break;

    case UNIT_STATUS_ATTACK:
        proc->msg = 0x278;
        break;

    case UNIT_STATUS_DEFENSE:
        proc->msg = 0x279;
        break;

    case UNIT_STATUS_CRIT:
        proc->msg = 0x27A;
        break;

    case UNIT_STATUS_AVOID:
        proc->msg = 0x27B;
        break;
    }
}

void HelpBoxPopulateStatScreenPower(struct HelpBoxProc * proc)
{
    if (UnitHasMagicRank(gStatScreenSt.unit))
        proc->msg = 0x268;
    else
        proc->msg = 0x267;
}

void HelpBoxRedirectStatScreenItem(struct HelpBoxProc * proc)
{
    if (gStatScreenSt.unit->items[0] == 0)
        HelpBoxTryRelocateLeft(proc);

    if (gStatScreenSt.unit->items[proc->info->msg] == 0)
    {
        if (proc->move_key_bit == 0 || proc->move_key_bit == DPAD_RIGHT || proc->move_key_bit == DPAD_UP)
            HelpBoxTryRelocateUp(proc);
        else if (proc->move_key_bit == DPAD_DOWN)
            HelpBoxTryRelocateDown(proc);
    }
}

void HelpBoxPopulateStatScreenWeaponExp(struct HelpBoxProc * proc)
{
    u16 item_kind_msg_lut[] =
    {
        [ITYPE_SWORD] = 0x34B,
        [ITYPE_LANCE] = 0x34C,
        [ITYPE_AXE]   = 0x34D,
        [ITYPE_BOW]   = 0x34E,
        [ITYPE_STAFF] = 0x350,
        [ITYPE_ANIMA] = 0x351,
        [ITYPE_LIGHT] = 0x352,
        [ITYPE_DARK]  = 0x34F,
    };

    int item_kind = proc->info->msg;

    if (UnitHasMagicRank(gStatScreenSt.unit))
        item_kind += 4;

    proc->msg = item_kind_msg_lut[item_kind];
}

void HelpBoxPopulateStatScreenPInfo(struct HelpBoxProc * proc)
{
    int msg_desc = gStatScreenSt.unit->pCharacterData->descTextId;

    if (msg_desc != 0)
        proc->msg = msg_desc;
    else
        proc->msg = 0x39B;
}

void HelpBoxPopulateStatScreenJInfo(struct HelpBoxProc * proc)
{
    proc->msg = gStatScreenSt.unit->pClassData->descTextId;
}

void HelpBoxRedirectStatScreenSupports(struct HelpBoxProc * proc)
{
    if (GetUnitTotalSupportLevel(gStatScreenSt.unit) == 0)
    {
        if (proc->move_key_bit == DPAD_DOWN)
            HelpBoxTryRelocateDown(proc);
        else
            HelpBoxTryRelocateUp(proc);
    }
}
