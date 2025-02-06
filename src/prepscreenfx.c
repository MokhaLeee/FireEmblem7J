#include "gbafe.h"

void PrepRestartMuralBackground(void)
{
    if (CheckInLinkArena())
        StartMuralBackgroundAlt(NULL, NULL, 10);
    else
        StartPrepMuralBackground(NULL, 10);
}

void EndMuralBackground_(void)
{
    if (CheckInLinkArena())
        EndMuralBackground();
    else
        EndPrepMuralBackground();
}

void nullsub_76(void) {}

void Prep_DrawChapterGoal(int vram_offset, int pal_bank)
{
    int msg;
    const char *str;
    struct Font font;
    struct Text th;

    InitSpriteTextFont(&font, OBJ_VRAM0 + vram_offset, pal_bank);
    ApplyPalette(Pal_Text, 0x10 + pal_bank);
    InitSpriteText(&th);
    SetTextFont(&font);
    SetTextFontGlyphs(0);
    SpriteText_DrawBackgroundExt(&th, 0);

    msg = GetChapterInfo(gPlaySt.chapterIndex)->goalWindowTextId;
    str = DecodeMsg(msg);

    Text_InsertDrawString(
        &th,
        GetStringTextCenteredPos(0x60, str),
        0, str);

    SetTextFont(NULL);
}

void PrepAtMenu_OnInit(struct ProcAtMenu *proc)
{
	PrepSetLatestCharId(0);
	proc->xDiff = 0;
	*((u16*)&proc->yDiff) = 0;

    if (CheckInLinkArena())
        proc->max_counter = 5;
    else
        proc->max_counter = GetChapterAllyUnitCount();

    proc->unk_30 = 0;
    proc->unk_31 = 0;
    proc->unk_32 = 0;
    proc->state = 0;
    proc->do_help = 0;
    proc->end_prep = 0;
    proc->cur_cmd = 0;
    proc->hand_pos = 0;
}

struct ProcCmd CONST_DATA ProcScr_PrepMenuDescHandler[] = {
    PROC_CALL(PrepMenuDescOnInit),
    PROC_SLEEP(1),
    PROC_CALL(PrepMenuDescOnParse),
    PROC_YIELD,
    PROC_CALL(PrepMenuDescOnDraw),
    PROC_END,
};

void ResetPrepMenuDescTexts(void)
{
    int i = 0;

    for (i = 0; i < 5; i++)
        ClearText(&gPrepMainMenuTexts[i + 5]);

    TmFillRect(
        gBg2Tm + TM_OFFSET(0xE, 0x6),
        0xF, 0xA, 0);

    EnableBgSync(BG2_SYNC_BIT);
}

void ParsePrepMenuDescTexts(int msg)
{
    struct Text *th = &gPrepMainMenuTexts[5];
    const char *str = DecodeMsg(msg);

    while (1) {
        if ('\0' == *str)        /* End for fetext */
            return;

        if ('\1' == *str) {      /* '\n' for fetext */
            th++;
            str++;
            continue;
        }

        str = Text_DrawCharacter(th, str);
    }
}

void DrawPrepMenuDescTexts()
{
    int i;

    for (i = 0; i < 5; i++)
        PutText(
            &gPrepMainMenuTexts[i + 5],
            gBg2Tm + TM_OFFSET(0xE, 2 * i + 6));

    EnableBgSync(BG2_SYNC_BIT);
}

void PrepMenuDescOnInit(struct ProcPrepMenuDesc * proc)
{
    proc->unk4C = 0;
    ResetPrepMenuDescTexts();
}

void PrepMenuDescOnParse(struct ProcPrepMenuDesc * proc)
{
    ParsePrepMenuDescTexts(proc->msg);
}

void PrepMenuDescOnDraw(void)
{
    DrawPrepMenuDescTexts();
}

void StartPrepMenuDescHandler(int msg, ProcPtr parent)
{
    struct ProcPrepMenuDesc * proc;

    proc = Proc_Find(ProcScr_PrepMenuDescHandler);
    if (proc)
        Proc_End(proc);
    
    proc = Proc_Start(ProcScr_PrepMenuDescHandler, parent);
    proc->msg = msg;
}

void StartPrepAtSubMenuUI(struct ProcAtMenu * proc)
{
    EndSysBlackBoxs();
    EndPrepSpecialCharEffect();
    EndMuralBackground_();
    proc->cur_cmd = GetActivePrepMenuItemIndex();
    EndPrepScreenMenu();
}

void DrawAtMenuUpfx(int tile, int pal)
{
    /* "Cahpter 0", "Infomaion" */
    Decompress(Img_PrepAtMenuUpfx, OBJ_VRAM0 + tile);
    ApplyPalette(Pal_PrepAtMenuUpfx, pal + 0x10);

	CpuFastFill(0, PAL_OBJ(0) + PAL_OFFSET(pal + 1), 0x20);
}

void AtMenu_Reinitialize(struct ProcAtMenu * proc)
{
    int i;

	InitBgs(gBgConfig_PrepScreen);
	ResetText();
	UnpackUiWindowFrameGraphics();
	LoadHelpBoxGfx(NULL, 0xE);
	SetDispEnable(0, 0, 0, 0, 0);
	ApplySystemObjectsGraphics();
	ResetUnitSprites();
	MakePrepUnitList();
    PrepAutoCapDeployUnits(proc);
    ReorderPlayerUnitsBasedOnDeployment();

    TmFill(gBg0Tm, 0);
    TmFill(gBg1Tm, 0);
    TmFill(gBg2Tm, 0);

    for (i = 0; i < 5; i++)
        InitText(&gPrepMainMenuTexts[i + 5], 0xE);
    for (i = 0; i < 4; i++)
        InitText(&gPrepMainMenuTexts[i + 1], 0x8);
	InitText(&gPrepMainMenuTexts[0], 10);

    /* "Preparations" */
    Decompress(Img_PrepScreenTitle, OBJ_VRAM0 + 0x4800);

#if (PROJECT == FE7)
    ApplyPalettes(Pal_SysBrownBox, 0x12, 2);
#elif (PROJECT == FE8)
    ApplyPalettes(Pal_SysBrownBox, 0x19, 2);
#endif

	DrawAtMenuUpfx(0x7000, 0x06);

    /* "Menu", "Start" button */
    Decompress(Img_PrepScreenTitleSprites, OBJ_VRAM0 + 0x6000);
    ApplyPalette(Pal_PrepScreenTitleSprites, 0x14);

    EnablePalSync();

    gDispIo.bg0_ct.priority = 0;
    gDispIo.bg1_ct.priority = 2;
    gDispIo.bg2_ct.priority = 1;
    gDispIo.bg3_ct.priority = 3;

	SetWinEnable(0, 0, 0);

    SetBgOffset(0, 0, 0);
    SetBgOffset(1, 0, 0);
    SetBgOffset(2, 0, 0);

    InitPrepScreenMainMenu(proc);
    EnableBgSync(0xF);

#if (PROJECT == FE7)
    SetBlendAlpha(0xE, 0x8);
	SetBlendTargetA(0, 0, 0, 0, 0);
	SetBlendTargetB(0, 0, 0, 1, 0);
	PrepSpecialChar_BlinkButtonB(proc);
#elif (PROJECT == FE8)
	SetBlendNone();
#endif

	PrepRestartMuralBackground();

	ApplyPalette(Pal_0841D100, 3);
	Decompress(Img_0841D120, (void *)(BG_VRAM + 0x7800));
	TmApplyTsa(gBg1Tm + TM_OFFSET(0xC, 0x4), Tsa_0841D614, OAM2_PAL(3) + OAM2_CHR(0x7800 / 0x20));

#if (PROJECT == FE7)
	Prep_DrawChapterGoal(0x5000, 0xB);
#elif (PROJECT == FE8)
	Prep_DrawChapterGoal(0x5800, 0xB);
#endif

	NewSysBlackBoxHandler(proc);
	SysBlackBoxSetGfx(0x6800);

#if (PROJECT == FE7)
	EnableSysBlackBox(0, 4, 0x480, 11, 3, 0xC00);
#endif

    proc->unk_35 = GetActivePrepMenuItemIndex();
    ParsePrepMenuDescTexts(GetPrepMainMenuInfoxMsg());
    DrawPrepMenuDescTexts();
}

void EndPrepAtMenuIfNoUnitAvailable(struct ProcAtMenu * proc)
{
    int i;
    u8 counter = 0;

    SetDispEnable(0, 0, 0, 0, 0);

    for (i = 1; i < 64; i++) {
        struct Unit *unit = GetUnit(i);

        if (!UNIT_IS_VALID(unit))
            continue;

        if (IsUnitInCurrentRoster(unit))
            counter++;
    }

    if (0 == counter) {
        proc->end_prep = TRUE;
        Proc_Goto(proc, 6);
    }
}
