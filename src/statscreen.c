#include "gbafe.h"

void DrawUiGaugeBitmapEdgeColumn(u8 * bitmap, int pixels_per_line, int column)
{
    bitmap[1 * pixels_per_line + column] = 4;
    bitmap[2 * pixels_per_line + column] = 14;
    bitmap[3 * pixels_per_line + column] = 3;
}

void DrawUiGaugeBitmapBaseColumn(u8 * bitmap, int pixels_per_line, int column)
{
    bitmap[0 * pixels_per_line + column] = 4;
    bitmap[1 * pixels_per_line + column] = 14;
    bitmap[2 * pixels_per_line + column] = 14;
    bitmap[3 * pixels_per_line + column] = 14;
    bitmap[4 * pixels_per_line + column] = 3;
}

void DrawUiGaugeBitmapFilledColumn(u8 * bitmap, int pixels_per_line, int column)
{
    bitmap[1 * pixels_per_line + column] = 1;
    bitmap[2 * pixels_per_line + column] = 5;
}

void DrawUiGaugeBitmapBonusColumn(u8 * bitmap, int pixels_per_line, int column)
{
    bitmap[1 * pixels_per_line + column] = 13;
    bitmap[2 * pixels_per_line + column] = 12;
}

void DrawUiGauge(int chr, int dot_x, int chr_count, int dot_width, int dot_plain, int dot_bonus)
{
    int i;

    u8 * bitmap = gBuf;

    CpuFastFill(0, bitmap, chr_count * 8 * 8);

    DrawUiGaugeBitmapEdgeColumn(bitmap, chr_count * 8, dot_x);
    DrawUiGaugeBitmapEdgeColumn(bitmap, chr_count * 8, dot_x + dot_width + 3);

    for (i = 0; i < dot_width + 2; i++)
    {
        DrawUiGaugeBitmapBaseColumn(bitmap, chr_count * 8, i + 1 + dot_x);
    }

    for (i = 0; i < dot_plain; i++)
    {
        DrawUiGaugeBitmapFilledColumn(bitmap, chr_count * 8, i + 2 + dot_x);
    }

    for (i = 0; i < dot_bonus; i++)
    {
        DrawUiGaugeBitmapBonusColumn(bitmap, chr_count * 8, dot_plain + i + 2 + dot_x);
    }

    ApplyBitmap(bitmap, ((void *) VRAM) + chr * CHR_SIZE, chr_count, 1);
}

void PutDrawUiGauge(int chr, int width, u16 * tm, int tileref, int dot_width, int dot_plain, int dot_bonus)
{
    DrawUiGauge(chr, 2, width, dot_width, dot_plain, dot_bonus);

    tileref += chr & 0x3FF; // TODO: macro?
    PutAppliedBitmap(tm, tileref, width, 1);
}

void BackgroundSlide_Init(struct MuralBackgroundProc * proc)
{
    proc->offset = 0;
}

void BackgroundSlide_Loop(struct MuralBackgroundProc * proc)
{
    proc->offset++;

    SetBgOffset(3, proc->offset / 4, 0);
    REG_BG3HOFS = proc->offset / 4;
}

ProcPtr StartMuralBackgroundAlt(ProcPtr parent, void * vram, int pal)
{
    int i, tileref;
    u16 * tm = gBg3Tm;

    if (vram == NULL)
        vram = ((void*) VRAM) + GetBgChrOffset(3);

    if (pal < 0)
        pal = BGPAL_MURALBACKGROUND;

    if (gBmSt.flags & BM_FLAG_LINKARENA)
        ApplyPalettes(Pal_LinkArenaMuralBackground, pal, 2);
    else
        ApplyPalettes(Pal_MuralBackground, pal, 2);

    Decompress(Img_MuralBackground, vram);

    tileref = ((((uintptr_t) (vram - GetBgChrOffset(3))) / CHR_SIZE) & 0xFFF) + TILE_PAL_SAFE(pal);

    for (i = 0; i < 0x280; i++)
        *tm++ = i + tileref;

    return Proc_Start(ProcScr_BackgroundSlide, parent);
}

ProcPtr StartMuralBackgroundExt(ProcPtr parent, void * vram, int pal, u8 type)
{
    int i, tileref;
    u16 * tm = gBg3Tm;

    if (vram == NULL)
        vram = ((void*) VRAM) + GetBgChrOffset(3);

    if (pal < 0)
        pal = BGPAL_MURALBACKGROUND;

    if (type != 0)
        ApplyPalettes(Pal_LinkArenaMuralBackground, pal, 2);
    else
        ApplyPalettes(Pal_MuralBackground, pal, 2);

    Decompress(Img_MuralBackground, vram);

    tileref = ((((uintptr_t) (vram - GetBgChrOffset(3))) / CHR_SIZE) & 0xFFF) + TILE_PAL_SAFE(pal);

    for (i = 0; i < 0x280; i++)
        *tm++ = i + tileref;

    return Proc_Start(ProcScr_BackgroundSlide, parent);
}

void EndMuralBackground(void)
{
    Proc_EndEach(ProcScr_BackgroundSlide);
}

int GetLastStatScreenUnitId(void)
{
    return gStatScreenInfo.unit_id;
}

void SetStatScreenLastUnitId(int unit_id)
{
    gStatScreenInfo.unit_id = unit_id;
}

void SetStatScreenExcludedUnitFlags(int flags)
{
    gStatScreenInfo.excluded_unit_flags = flags;
}

void InitStatScreenText(void)
{
    InitTextList(gStatScreenTextList);
}

void PutStatScreenText(struct StatScreenTextInfo const * list)
{
    while (list->text != NULL)
    {
        if (list->str_list != NULL)
        {
            PutDrawText(list->text, list->tm, list->color, list->x_offset, 0, list->str_list[GetLang()]);
        }
        else
        {
            PutText(list->text, list->tm);
        }
        list++;
    }
}

void PutStatScreenLeftPanelInfo(void)
{
    char const * pname_str = DecodeMsg(UNIT_NAME_ID(gStatScreenSt.unit));
    int pname_text_x = GetStringTextCenteredPos(8 * 7, pname_str);

    TmFill(gBg0Tm, 0);

    BattleGenerateUiStats(gStatScreenSt.unit, GetUnitEquippedWeaponSlot(gStatScreenSt.unit));

    // display pname & jname

    PutDrawText(gStatScreenSt.text + STATSCREEN_TEXT_PNAME,
        gBg0Tm + TM_OFFSET(4, 10), TEXT_COLOR_SYSTEM_WHITE, pname_text_x, 0, pname_str);

    PutDrawText(gStatScreenSt.text + STATSCREEN_TEXT_JNAME,
        gBg0Tm + TM_OFFSET(1, 13), TEXT_COLOR_SYSTEM_WHITE, 0, 0, DecodeMsg(gStatScreenSt.unit->pClassData->nameTextId));

    // display level, exp, hp

    PutTwoSpecialChar(gBg0Tm + TM_OFFSET(1, 15), TEXT_COLOR_SYSTEM_GOLD, TEXT_SPECIAL_LV_A, TEXT_SPECIAL_LV_B);
    PutSpecialChar(gBg0Tm + TM_OFFSET(5, 15), TEXT_COLOR_SYSTEM_GOLD, TEXT_SPECIAL_EXP_E);

    PutTwoSpecialChar(gBg0Tm + TM_OFFSET(1, 17), TEXT_COLOR_SYSTEM_GOLD, TEXT_SPECIAL_HP_A, TEXT_SPECIAL_HP_B);
    PutSpecialChar(gBg0Tm + TM_OFFSET(5, 17), TEXT_COLOR_SYSTEM_GOLD, TEXT_SPECIAL_SLASH);

    PutNumberOrBlank(gBg0Tm + TM_OFFSET(4, 15), TEXT_COLOR_SYSTEM_BLUE, gStatScreenSt.unit->level);
    PutNumberOrBlank(gBg0Tm + TM_OFFSET(7, 15), TEXT_COLOR_SYSTEM_BLUE, gStatScreenSt.unit->exp);

    // Display current hp

    if (GetUnitCurrentHp(gStatScreenSt.unit) > 99)
    {
        // Display '--' if current hp > 99
        PutTwoSpecialChar(gBg0Tm + TM_OFFSET(3, 17), TEXT_COLOR_SYSTEM_BLUE,
            TEXT_SPECIAL_DASH, TEXT_SPECIAL_DASH);
    }
    else
    {
        // Display current hp
        PutNumberOrBlank(gBg0Tm + TM_OFFSET(4, 17), TEXT_COLOR_SYSTEM_BLUE,
            GetUnitCurrentHp(gStatScreenSt.unit));
    }

    // Display max hp

    if (GetUnitMaxHp(gStatScreenSt.unit) > 99)
    {
        // Display '--' if max hp > 99
        PutTwoSpecialChar(gBg0Tm + TM_OFFSET(6, 17), TEXT_COLOR_SYSTEM_BLUE,
            TEXT_SPECIAL_DASH, TEXT_SPECIAL_DASH);
    }
    else
    {
        // Display max hp
        PutNumberOrBlank(gBg0Tm + TM_OFFSET(7, 17), TEXT_COLOR_SYSTEM_BLUE,
            GetUnitMaxHp(gStatScreenSt.unit));
    }
}

void DisplayBwl(void)
{
    struct PidStats * bwl;
    bwl = GetPidStats(UNIT_CHAR_ID(gStatScreenSt.unit));

    if (!bwl)
        return;

    if (gBmSt.flags & BM_FLAG_LINKARENA)
        return;

    if (gPlaySt.chapterStateBits & PLAY_FLAG_TUTORIAL)
        return;

    if (gPlaySt.chapterStateBits & PLAY_FLAG_EXTRA_MAP)
        return;

    if (IsFirstPlaythrough() == TRUE)
        return;

    if (UNIT_FACTION(gStatScreenSt.unit) != FACTION_BLUE)
        return;

    ClearText(&gStatScreenSt.text[STATSCREEN_TEXT_BWL]);

    Text_InsertDrawString(&gStatScreenSt.text[STATSCREEN_TEXT_BWL],
        0x18, TEXT_COLOR_SYSTEM_GOLD, "戦");

    Text_InsertDrawString(&gStatScreenSt.text[STATSCREEN_TEXT_BWL],
        0x38, TEXT_COLOR_SYSTEM_GOLD, "勝");

    Text_InsertDrawString(&gStatScreenSt.text[STATSCREEN_TEXT_BWL],
        0x58, TEXT_COLOR_SYSTEM_GOLD, "敗");

    PutText(&gStatScreenSt.text[STATSCREEN_TEXT_BWL],
        gUiTmScratchA + TM_OFFSET(3, 14));

    PutNumber(gUiTmScratchA + TM_OFFSET(5, 14),
        TEXT_COLOR_SYSTEM_BLUE, bwl->battle_count);

    PutNumber(gUiTmScratchA + TM_OFFSET(9, 14),
        TEXT_COLOR_SYSTEM_BLUE, bwl->win_count);

    PutNumber(gUiTmScratchA + TM_OFFSET(13, 14),
        TEXT_COLOR_SYSTEM_BLUE, bwl->loss_count);

    TmApplyTsa(gUiTmScratchC + TM_OFFSET(2, 14), Tsa_Statscreen_08404124, 0x1060);
}

void PutStatScreenStatWithBar(int num, int x, int y, int base, int total, int max)
{
    int bonus = total - base;

    PutNumberOrBlank(gUiTmScratchA + TM_OFFSET(x, y),
        (base == max) ? TEXT_COLOR_SYSTEM_GREEN : TEXT_COLOR_SYSTEM_BLUE, base);

    PutNumberBonus(bonus, gUiTmScratchA + TM_OFFSET(x + 1, y));

    if (total > 30)
    {
        total = 30;
        bonus = total - base;
    }

    PutDrawUiGauge(0x400 + 1 + num*6, 6,
        gUiTmScratchC + TM_OFFSET(x - 2, y + 1),
        TILEREF(0, BGPAL_STATSCREEN_6), max * 41 / 30, base * 41 / 30, bonus * 41 / 30);
}

void PutStatScreenPersonalInfoPage(void)
{
    Decompress(Tsa_StatScreenPage0, gBuf);
    TmApplyTsa(gUiTmScratchB, gBuf, TILEREF(BGCHR_WINDOWFRAME, BGPAL_WINDOWFRAME));

    PutStatScreenText(gStatScreenPersonalInfoLabelsInfo);

    // display strength/magic labels

    if (UnitHasMagicRank(gStatScreenSt.unit))
    {
        // magic
        PutDrawText(gStatScreenSt.text + STATSCREEN_TEXT_POW,
            gUiTmScratchA + TM_OFFSET(1, 1),
            TEXT_COLOR_SYSTEM_GOLD, 0, 0,
            TEXT("魔力", "Mag"));
    }
    else
    {
        // strength
        PutDrawText(gStatScreenSt.text + STATSCREEN_TEXT_POW,
            gUiTmScratchA + TM_OFFSET(1, 1),
            TEXT_COLOR_SYSTEM_GOLD, 4, 0,
            TEXT("力", "Str"));
    }

    // display strength/magic stat value
    PutStatScreenStatWithBar(0, 5, 1,
        gStatScreenSt.unit->pow,
        GetUnitPower(gStatScreenSt.unit),
        UNIT_POW_MAX(gStatScreenSt.unit));

    // display skill stat value
    PutStatScreenStatWithBar(1, 5, 3,
        gStatScreenSt.unit->state & US_RESCUING
            ? gStatScreenSt.unit->skl / 2 : gStatScreenSt.unit->skl,
        GetUnitSkill(gStatScreenSt.unit),
        gStatScreenSt.unit->state & US_RESCUING
            ? UNIT_SKL_MAX(gStatScreenSt.unit) / 2 : UNIT_SKL_MAX(gStatScreenSt.unit));

    // display speed stat value
    PutStatScreenStatWithBar(2, 5, 5,
        gStatScreenSt.unit->state & US_RESCUING
            ? gStatScreenSt.unit->spd/2 : gStatScreenSt.unit->spd,
        GetUnitSpeed(gStatScreenSt.unit),
        gStatScreenSt.unit->state & US_RESCUING
            ? UNIT_SPD_MAX(gStatScreenSt.unit) / 2 : UNIT_SPD_MAX(gStatScreenSt.unit));

    // display luck stat value
    PutStatScreenStatWithBar(3, 5, 7,
        gStatScreenSt.unit->lck,
        GetUnitLuck(gStatScreenSt.unit),
        UNIT_LCK_MAX(gStatScreenSt.unit));

    // display defense stat value
    PutStatScreenStatWithBar(4, 5, 9,
        gStatScreenSt.unit->def,
        GetUnitDefense(gStatScreenSt.unit),
        UNIT_DEF_MAX(gStatScreenSt.unit));

    // display resistance stat value
    PutStatScreenStatWithBar(5, 5, 11,
        gStatScreenSt.unit->res,
        GetUnitResistance(gStatScreenSt.unit),
        UNIT_RES_MAX(gStatScreenSt.unit));

    // display movement stat value
    PutStatScreenStatWithBar(6, 13, 1,
        UNIT_MOV_BASE(gStatScreenSt.unit),
        UNIT_MOV(gStatScreenSt.unit),
        UNIT_MOV_MAX(gStatScreenSt.unit));

    // display constitution stat value
    PutStatScreenStatWithBar(7, 13, 3,
        UNIT_CON_BASE(gStatScreenSt.unit),
        UNIT_CON(gStatScreenSt.unit),
        UNIT_CON_MAX(gStatScreenSt.unit));

    // display unit aid
    PutNumber(gUiTmScratchA + TM_OFFSET(13, 5), TEXT_COLOR_SYSTEM_BLUE,
        GetUnitAid(gStatScreenSt.unit));

    // display unit aid icon
    PutIcon(gUiTmScratchA + TM_OFFSET(14, 5),
        GetUnitAidIconId(UNIT_CATTRIBUTES(gStatScreenSt.unit)),
        TILEREF(0, BGPAL_ICONS + 1));

    // display unit rescue name
    Text_InsertDrawString(gStatScreenSt.text + STATSCREEN_TEXT_RESCUE,
        24, TEXT_COLOR_SYSTEM_BLUE,
        GetUnitRescueName(gStatScreenSt.unit));

    // display status name
    Text_InsertDrawString(gStatScreenSt.text + STATSCREEN_TEXT_STATUS,
        24, TEXT_COLOR_SYSTEM_BLUE,
        GetUnitStatusName(gStatScreenSt.unit));

    // display status turns

    if (gStatScreenSt.unit->statusIndex != UNIT_STATUS_NONE)
    {
        PutNumberSmall(gUiTmScratchA + TM_OFFSET(16, 11),
            TEXT_COLOR_SYSTEM_WHITE,
            gStatScreenSt.unit->statusDuration);
    }

    // display affininity icon and name

    PutIcon(gUiTmScratchA + TM_OFFSET(12, 9),
        GetUnitAffinityIcon(gStatScreenSt.unit),
        TILEREF(0, BGPAL_ICONS + 1));

    Text_InsertDrawString(gStatScreenSt.text + STATSCREEN_TEXT_AFFINITY,
        40, TEXT_COLOR_SYSTEM_BLUE, GetAffinityName(gStatScreenSt.unit->pCharacterData->affinity));

    DisplayBwl();
}
