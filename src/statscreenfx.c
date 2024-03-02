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

struct ProcCmd CONST_DATA ProcScr_BackgroundSlide[] = {
    PROC_CALL(BackgroundSlide_Init),
    PROC_REPEAT(BackgroundSlide_Loop),
    PROC_END,
};

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

struct TextInitInfo CONST_DATA gStatScreenTextList[] =
{
    { gStatScreenSt.text + STATSCREEN_TEXT_PNAME, 7 },
    { gStatScreenSt.text + STATSCREEN_TEXT_JNAME, 7 },
    { gStatScreenSt.text + STATSCREEN_TEXT_UNUSED, 3 },
    { gStatScreenSt.text + STATSCREEN_TEXT_POW, 3 },
    { gStatScreenSt.text + STATSCREEN_TEXT_SKL, 3 },
    { gStatScreenSt.text + STATSCREEN_TEXT_SPD, 3 },
    { gStatScreenSt.text + STATSCREEN_TEXT_LCK, 3 },
    { gStatScreenSt.text + STATSCREEN_TEXT_DEF, 3 },
    { gStatScreenSt.text + STATSCREEN_TEXT_RES, 3 },
    { gStatScreenSt.text + STATSCREEN_TEXT_MOV, 3 },
    { gStatScreenSt.text + STATSCREEN_TEXT_CON, 3 },
    { gStatScreenSt.text + STATSCREEN_TEXT_AID, 3 },
    { gStatScreenSt.text + STATSCREEN_TEXT_RESCUE, 9 },
    { gStatScreenSt.text + STATSCREEN_TEXT_AFFINITY, 7 },
    { gStatScreenSt.text + STATSCREEN_TEXT_STATUS, 9 },
    { gStatScreenSt.text + STATSCREEN_TEXT_ITEM_A, 7 },
    { gStatScreenSt.text + STATSCREEN_TEXT_ITEM_B, 7 },
    { gStatScreenSt.text + STATSCREEN_TEXT_ITEM_C, 7 },
    { gStatScreenSt.text + STATSCREEN_TEXT_ITEM_D, 7 },
    { gStatScreenSt.text + STATSCREEN_TEXT_ITEM_E, 7 },
    { gStatScreenSt.text + STATSCREEN_TEXT_EQUIPRANGE, 6 },
    { gStatScreenSt.text + STATSCREEN_TEXT_EQUIPATTACK, 3 },
    { gStatScreenSt.text + STATSCREEN_TEXT_EQUIPHIT, 3 },
    { gStatScreenSt.text + STATSCREEN_TEXT_EQUIPCRIT, 3 },
    { gStatScreenSt.text + STATSCREEN_TEXT_EQUIPAVOID, 3 },
    { gStatScreenSt.text + STATSCREEN_TEXT_WEXP_A, 2 },
    { gStatScreenSt.text + STATSCREEN_TEXT_WEXP_B, 2 },
    { gStatScreenSt.text + STATSCREEN_TEXT_WEXP_C, 2 },
    { gStatScreenSt.text + STATSCREEN_TEXT_WEXP_D, 2 },
    { gStatScreenSt.text + STATSCREEN_TEXT_SUPPORT_A, 7 },
    { gStatScreenSt.text + STATSCREEN_TEXT_SUPPORT_B, 7 },
    { gStatScreenSt.text + STATSCREEN_TEXT_SUPPORT_C, 7 },
    { gStatScreenSt.text + STATSCREEN_TEXT_SUPPORT_D, 7 },
    { gStatScreenSt.text + STATSCREEN_TEXT_SUPPORT_E, 7 },
    { gStatScreenSt.text + STATSCREEN_TEXT_BWL, 16 },

    { 0 }, // end!
};

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

void PutStatScreenItemsPage(void)
{
    int i, item;

    Decompress(Tsa_Statscreen_Pag1_08403560, gBuf);
    TmApplyTsa(gUiTmScratchB, gBuf, TILEREF(BGCHR_WINDOWFRAME, BGPAL_WINDOWFRAME));

    Decompress(Tsa_Statscreen_Pag1_084038CC, gBuf);
    TmApplyTsa(gUiTmScratchC + TM_OFFSET(1, 11), gBuf, TILEREF(BGCHR_STATSCREEN_EQUIPSTATFRAME, BGPAL_STATSCREEN_EQUIPSTATFRAME));

    PutStatScreenText(gStatScreenEquipmentLabelsInfo);

    for (i = 0; (i < ITEMSLOT_INV_COUNT) && (item = gStatScreenSt.unit->items[i]); i++)
    {
        int color;
        if ((gStatScreenSt.unit->state & US_DROP_ITEM) && (i == GetUnitItemCount(gStatScreenSt.unit) - 1))
            color = TEXT_COLOR_SYSTEM_GREEN;
        else
            color = IsItemDisplayUsable(gStatScreenSt.unit, item)
                ? TEXT_COLOR_SYSTEM_WHITE
                : TEXT_COLOR_SYSTEM_GRAY;

        DrawItemStatScreenLine(
            &gStatScreenSt.text[STATSCREEN_TEXT_ITEM_A + i],
            item, color,
            gUiTmScratchA + TM_OFFSET(1, 1 + i * 2));
    }

    i = GetUnitEquippedWeaponSlot(gStatScreenSt.unit);
    item = 0;

    if (i >= 0)
    {
        PutSpecialChar(
            gUiTmScratchA + TM_OFFSET(16, 1 + i * 2),
            0, TEXT_SPECIAL_EXP_E);

        TmApplyTsa(
            gUiTmScratchC + TM_OFFSET(1, 2 + i * 2),
            Tsa_Statscreen_Pag1_08403908, TILEREF(BGCHR_STATSCREEN_EQUIPSTATFRAME, BGPAL_STATSCREEN_EQUIPSTATFRAME));

        item = gStatScreenSt.unit->items[i];
    }

    PutNumberOrBlank(gUiTmScratchA + TM_OFFSET(8,  13),
        TEXT_COLOR_SYSTEM_BLUE, gBattleActor.battleAttack);

    PutNumberOrBlank(gUiTmScratchA + TM_OFFSET(8,  15),
        TEXT_COLOR_SYSTEM_BLUE, gBattleActor.battleHitRate);

    PutNumberOrBlank(gUiTmScratchA + TM_OFFSET(15, 13),
        TEXT_COLOR_SYSTEM_BLUE, gBattleActor.battleCritRate);

    PutNumberOrBlank(gUiTmScratchA + TM_OFFSET(15, 15),
        TEXT_COLOR_SYSTEM_BLUE, gBattleActor.battleAvoidRate);

    Text_InsertDrawString(gStatScreenSt.text + STATSCREEN_TEXT_EQUIPRANGE,
        16, TEXT_COLOR_SYSTEM_BLUE, GetItemDisplayRangeString(item));

    for (i = 0; i < 8; ++i)
    {
        gUiTmScratchA[TM_OFFSET(2 + i, 11)] = TILEREF(0x278 + i, BGPAL_ICONS + 1);
        gUiTmScratchA[TM_OFFSET(2 + i, 12)] = TILEREF(0x270 + i, BGPAL_ICONS + 1);
    }
}

void PutStatScreenSupportList(void)
{
    int count, i;

    int y_tm = 6;
    int line = 0;

    int text_color = GetUnitTotalSupportLevel(gStatScreenSt.unit) == MAX_SIMULTANEOUS_SUPPORT_COUNT_PER_UNIT
        ? TEXT_COLOR_SYSTEM_GREEN : TEXT_COLOR_SYSTEM_WHITE;

    for (count = GetUnitSupporterCount(gStatScreenSt.unit), i = 0; i < count; i++)
    {
        int support_level = GetUnitSupportLevel(gStatScreenSt.unit, i);

        if (support_level != 0)
        {
            int rank_color;

            u8 pid = GetUnitSupportPid(gStatScreenSt.unit, i);

            PutIcon(gUiTmScratchA + TM_OFFSET(4, y_tm),
                GetAffinityIconByPid(pid),
                TILEREF(0, BGPAL_ICONS + 1));

            PutDrawText(gStatScreenSt.text + STATSCREEN_TEXT_SUPPORT_A + line,
                gUiTmScratchA + TM_OFFSET(7, y_tm),
                text_color, 0, 0, DecodeMsg(GetCharacterData(pid)->nameTextId));

            rank_color = TEXT_COLOR_SYSTEM_BLUE;

            if (support_level == SUPPORT_LEVEL_A)
                rank_color = TEXT_COLOR_SYSTEM_GREEN;

            if (text_color == TEXT_COLOR_SYSTEM_GREEN)
                rank_color = TEXT_COLOR_SYSTEM_GREEN;

            PutSpecialChar(gUiTmScratchA + TM_OFFSET(13, y_tm),
                rank_color, GetSupportLevelSpecialChar(support_level));

            y_tm += 2;
            line++;
        }
    }
}

void PutStatScreenWeaponExpBar(int num, int x, int y, int item_kind)
{
    int progress, progressMax, color;
    int wexp = gStatScreenSt.unit->ranks[item_kind];

    PutIcon(gUiTmScratchA + TM_OFFSET(x, y),
        0x70 + item_kind, // TODO: icon id definitions
        TILEREF(0, BGPAL_ICONS + 1));

    color = (wexp >= WPN_EXP_S)
        ? TEXT_COLOR_SYSTEM_GREEN
        : TEXT_COLOR_SYSTEM_BLUE;

    // display rank letter
    PutSpecialChar(
        gUiTmScratchA + TM_OFFSET(x + 5, y),
        color,
        GetWeaponLevelSpecialCharFromExp(wexp));

    GetWeaponExpProgressState(wexp, &progress, &progressMax);

    PutDrawUiGauge(
        0x400 + 1 + num*6, 5,
        gUiTmScratchC + TM_OFFSET(x + 3, y + 1),
        TILEREF(0, BGPAL_STATSCREEN_6),
        34,
        (progress*34)/(progressMax-1), 0);
}

void PutStatScreenWeaponExpAndSupportsPage(void)
{
    Decompress(Tsa_StatScreen_084035D0, gBuf);
    TmApplyTsa(gUiTmScratchB, gBuf, TILEREF(BGCHR_WINDOWFRAME, BGPAL_WINDOWFRAME));

    if (UnitHasMagicRank(gStatScreenSt.unit))
    {
        PutStatScreenText(gStatScreenWeaponExpLabelsMagicalInfo);

        PutStatScreenWeaponExpBar(0, 1, 1, ITYPE_ANIMA);
        PutStatScreenWeaponExpBar(1, 1, 3, ITYPE_LIGHT);
        PutStatScreenWeaponExpBar(2, 9, 1, ITYPE_DARK);
        PutStatScreenWeaponExpBar(3, 9, 3, ITYPE_STAFF);
    }
    else
    {
        PutStatScreenText(gStatScreenWeaponExpLabelsPhysicalInfo);

        PutStatScreenWeaponExpBar(0, 1, 1, ITYPE_SWORD);
        PutStatScreenWeaponExpBar(1, 1, 3, ITYPE_LANCE);
        PutStatScreenWeaponExpBar(2, 9, 1, ITYPE_AXE);
        PutStatScreenWeaponExpBar(3, 9, 3, ITYPE_BOW);
    }

    PutStatScreenSupportList();
}

void PutStatScreenPage(int page_id)
{
    typedef void (* PutPageFunc)(void);

    PutPageFunc func_table[4] =
    {
        PutStatScreenPersonalInfoPage,
        PutStatScreenItemsPage,
        PutStatScreenWeaponExpAndSupportsPage,
        PutStatScreenPersonalInfoPage,
    };

    CpuFastFill(0, gUiTmScratchA, sizeof(u16) * 0x20 * 20);
    CpuFastFill(0, gUiTmScratchC, sizeof(u16) * 0x20 * 18);

    func_table[page_id]();
}
