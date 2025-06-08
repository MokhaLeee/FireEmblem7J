#include "gbafe.h"

u8 GetTitleClassReelSet(void)
{
    s32 val;
    s32 i;
    struct PlaySt play_state;

    s32 best = GetGlobalCompletionCount() * 69;

    for (i = 0; i < 3; i++)
    {
        if (!IsSaveValid(i))
        {
            continue;
        }

        ReadGameSavePlaySt(i, &play_state);

        val = play_state.chapterIndex + play_state.unk2C_17 * 69;

        if (best < val)
        {
            best = val;
        }
    }

    if (best <= 4)
        return 0;

    if (best <= 10)
        return 1;

    if (best <= 18)
        return 2;

    if (best <= 26)
        return 3;

    if (best <= 68)
        return 4;

    if (best <= 73)
        return 5;

    if (best <= 79)
        return 6;

    if (best <= 87)
        return 7;

    if (best <= 95)
        return 8;

    if (best <= 137)
        return 9;

    return 10;
}

bool GC_StartClassReel(struct GameCtrlProc * proc)
{
    StartLordSelect(GetTitleClassReelSet(), proc);
    return false;
}

void GC_CheckSramResetKeyCombo(ProcPtr proc)
{
    if (gpKeySt->held == (L_BUTTON | DPAD_RIGHT | SELECT_BUTTON))
        Proc_Goto(proc, 15);
}

void GC_InitSramResetScreen(void)
{
    InitBgs(NULL);
    ApplySystemGraphics();
    gPlaySt.cfgTextSpeed = 1;
    StartMuralBackgroundAlt(PROC_TREE_3, NULL, -1);
}

void GC_InitFastStartCheck(struct GameCtrlProc * proc)
{
    proc->unk_2E = 20;
}

void GC_FastStartCheck(struct GameCtrlProc * proc)
{
    if (!(gpKeySt->held & START_BUTTON))
    {
        Proc_Break(proc);
        return;
    }

    proc->unk_2E--;

    if (proc->unk_2E < 0)
    {
        if (IsValidSuspendSave(SAVE_SUSPEND))
        {
            ReadSuspendSave(SAVE_SUSPEND);
            Proc_Goto(proc, 6);
            return;
        }

        StartBgmCore(SONG_5A, NULL);
        StartBgmVolumeChange(0, 0xC0, 0x3C, NULL);

        Proc_Goto(proc, 4);
    }
}

// clang-format off

struct ProcCmd CONST_DATA ProcScr_Unused_FastStartCheck[] =
{
    PROC_CALL(GC_InitFastStartCheck),
    PROC_REPEAT(GC_FastStartCheck),

    PROC_END,
};

// clang-format on

void EndProcIfNotMarkedB(ProcPtr proc)
{
    if (((struct Proc *)proc)->proc_mark != 11)
        Proc_End(proc);
}

void sub_8012D60(ProcPtr proc)
{
    CpuFastFill16(0, gPal, PLTT_SIZE);
    EnablePalSync();
    Proc_ForAll(EndProcIfNotMarkedB);
    SetMainFunc(OnMain);
}

void sub_8012D98(void)
{
    StartBgmCore(SONG_5A, NULL);
    StartBgmVolumeChange(0, 0xC0, 0x3C, NULL);
}

void sub_8012DB4(ProcPtr unused)
{
    StartBgmVolumeChange(0x100, 0xC0, 0x20, NULL);
}

void GC_PostIntro(struct GameCtrlProc * proc)
{
    s32 tmp;

    switch (proc->next_action)
    {
        case GAME_ACTION_USR_SKIPPED:
            Proc_Goto(proc, 3);
            return;

        case GAME_ACTION_EVENT_RETURN:
            Proc_Goto(proc, 4);
            sub_8012DB4(proc);
            return;

        case GAME_ACTION_CLASS_REEL:
            tmp = proc->idle_status;
            switch (tmp & 1)
            {
                case 0:
                    Proc_Goto(proc, 1);
                    break;
                case 1:
                    Proc_Goto(proc, 0);
                    break;
            }

            proc->idle_status++;
            return;

        case GAME_ACTION_PLAYED_THROUGH:
            Proc_Goto(proc, 21);
            return;
    }
}

void sub_8012E40(struct GameCtrlProc * proc)
{
    switch (proc->next_action)
    {
        case GAME_ACTION_EVENT_RETURN:
            Proc_Goto(proc, 3);
            return;

        case GAME_ACTION_CLASS_REEL:
            Proc_Goto(proc, 0);
            return;
    }
}

void GC_PostMainMenu(struct GameCtrlProc * proc)
{
    switch (proc->next_action)
    {
        case GAME_ACTION_EVENT_RETURN:
        case GAME_ACTION_CLASS_REEL:
        case GAME_ACTION_USR_SKIPPED:
        case GAME_ACTION_PLAYED_THROUGH:
            if (GetNextChapterStatsEntry() == CHAPTER_0B)
            {
                Proc_Goto(proc, 20);
                return;
            }

            if (GetTacticianName()[0] != 0)
            {
                Proc_Goto(proc, 5);
                return;
            }

            if (gPlaySt.tact_enabled)
            {
                Proc_Goto(proc, 18);
                return;
            }

            SetTacticianName(DecodeMsg(MSG_569));
            Proc_Goto(proc, 5);
            return;

        case GAME_ACTION_4:
            Proc_Goto(proc, 6);
            return;

        case GAME_ACTION_5:
            Proc_Goto(proc, 22);
            return;

        case GAME_ACTION_6:
            Proc_Goto(proc, 10);
            return;

        case GAME_ACTION_EXTRA_MAP:
            Proc_Goto(proc, 11);
            return;

        case GAME_ACTION_8:
            Proc_Goto(proc, 12);
            return;

        default:
            return;
    }

    return;
}

void sub_8012F2C(struct GameCtrlProc * proc)
{
    if (proc->next_action == GAME_ACTION_5)
        Proc_Goto(proc, 3);
}

void sub_8012F44(struct GameCtrlProc * proc)
{
    Proc_Goto(proc, 3);
}

void sub_8012F50(struct GameCtrlProc * proc)
{
    if (proc->next_action == GAME_ACTION_EVENT_RETURN)
        return;

    if (proc->next_action == GAME_ACTION_CLASS_REEL)
        Proc_Goto(proc, 16);
}

void sub_8012F6C(struct GameCtrlProc * proc)
{
    if (proc->next_action == GAME_ACTION_5)
    {
        Proc_Goto(proc, 4);
        return;
    }

    InitPlayConfig(0);

    gPlaySt.chapterStateBits |= PLAY_FLAG_TUTORIAL;

    ResetPermanentFlags();
    ResetChapterFlags();
    InitUnits();

    gPlaySt.chapterIndex = proc->next_chapter;
}

void GC_StartExtraMap(void)
{
    sub_80A2BFC();
    ClearPidStats();
    CleanupUnitsBeforeChapter();
    gPlaySt.chapterIndex = 0x30;
}

void sub_8012FCC(ProcPtr proc)
{
    InvalidateSuspendSave(SAVE_SUSPEND);
    gPlaySt.cfgDisableBgm = 0;
}

void sub_8012FEC(struct GameCtrlProc * proc)
{
    EndAllMus();

    switch (proc->next_action)
    {
        case GAME_ACTION_EVENT_RETURN:
            Proc_Goto(proc, 3);
            break;

        case GAME_ACTION_USR_SKIPPED:
            Proc_Goto(proc, 13);
            break;

        case GAME_ACTION_PLAYED_THROUGH:
            Proc_Goto(proc, 19);
            break;

        case GAME_ACTION_4:
        case GAME_ACTION_5:
            Proc_Goto(proc, 13);
            break;

        default:
            break;
    }

    return;
}

void GC_CheckForGameEnded(ProcPtr proc)
{
    if (gPlaySt.chapterStateBits & PLAY_FLAG_COMPLETE)
        Proc_Goto(proc, 14);
}

void GC_PostLoadSuspend(ProcPtr proc)
{
    if (gPlaySt.chapterStateBits & PLAY_FLAG_EXTRA_MAP)
    {
        Proc_Goto(proc, 8);
        return;
    }

    Proc_Goto(proc, 7);
}

void GC_InitNextChapter(struct GameCtrlProc * proc)
{
    RegisterChapterStats(&gPlaySt);
    ComputeChapterRankings();
    gPlaySt.chapterIndex = proc->next_chapter;
    CleanupUnitsBeforeChapter();
}

void GC_CallPostChapterSaveMenu(ProcPtr proc)
{
    if (gPlaySt.chapterIndex != CHAPTER_2F)
        sub_80A5AF8(proc);
}

void GC_SetEliwoodMode(void)
{
    gPlaySt.chapterModeIndex = CHAPTER_MODE_ELIWOOD;
}

void GC_DarkenScreen(ProcPtr proc)
{
    SetBlendDarken(16);
    SetBlendTargetA(1, 1, 1, 1, 1);
    SetBlendBackdropA(1);
}

void sub_8013128(void)
{
    InitBgs(NULL);

    switch (gPlaySt.chapterModeIndex)
    {
        case CHAPTER_MODE_ELIWOOD:
            StartEvent(gUnk_08D8A0E0);
            return;

        case CHAPTER_MODE_HECTOR:
            StartEvent(gUnk_08D8A114);
            return;
    }
}

void sub_8013160(void)
{
    InitBgs(NULL);

    switch (gPlaySt.chapterModeIndex)
    {
        case CHAPTER_MODE_ELIWOOD:
            StartEvent(gUnk_08D8A148);
            return;

        case CHAPTER_MODE_HECTOR:
            StartEvent(gUnk_08D8A1B4);
            return;
    }
}

void GC_RememberChapterId(struct GameCtrlProc * proc)
{
    proc->chapter_id = gPlaySt.chapterIndex;
}

void GC_RestoreChapterId(struct GameCtrlProc * proc)
{
    gPlaySt.chapterIndex = proc->chapter_id;
}

// clang-format off

struct ProcCmd CONST_DATA ProcScr_GameControl[] =
{
    PROC_19,
    PROC_MARK(11),
    PROC_19,

    PROC_CALL(GC_CheckSramResetKeyCombo),
    PROC_CALL(GC_InitFastStartCheck),
    PROC_REPEAT(GC_FastStartCheck),

    // fallthrough

PROC_LABEL(0),
    PROC_CALL(ForceEnableSounds),
    PROC_START_CHILD_BLOCKING(ProcScr_OpeningSeqence),

    PROC_CALL(GC_PostIntro),
    PROC_YIELD,

    PROC_GOTO(3),

PROC_LABEL(1),
    PROC_CALL_2(GC_StartClassReel),
    PROC_CALL(sub_8012E40),
    PROC_YIELD,

    PROC_GOTO(0),

PROC_LABEL(2),
    PROC_YIELD,
    PROC_CALL(sub_8012D60),

    PROC_CALL(sub_8012E40),
    PROC_YIELD,

    PROC_GOTO(0),

PROC_LABEL(3),
    PROC_CALL(ForceEnableSounds),
    PROC_CALL(StartTitleScreen_WithMusic),

    PROC_GOTO(23),

PROC_LABEL(21),
    PROC_CALL(ForceEnableSounds),
    PROC_CALL(StartTitleScreen_FlagTrue),

    PROC_GOTO(23),

PROC_LABEL(22),
    PROC_CALL(ForceEnableSounds),
    PROC_CALL(StartTitleScreen_FlagFalse),

    PROC_GOTO(23),

PROC_LABEL(23),
    PROC_YIELD,

    PROC_CALL(GC_PostIntro),
    PROC_YIELD,

    PROC_GOTO(0),

PROC_LABEL(18),
    PROC_CALL(StartTacticianInfo),
    PROC_YIELD,

    PROC_GOTO(5),

PROC_LABEL(4),
    PROC_CALL(ForceEnableSounds),
    PROC_CALL(StartMainMenu),
    PROC_YIELD,

    PROC_CALL(GC_PostMainMenu),
    PROC_YIELD,

    // fallthrough

PROC_LABEL(5),
    PROC_CALL(GC_CheckForGameEnded),
    PROC_CALL(GC_RememberChapterId),

    PROC_START_CHILD_BLOCKING(ProcScr_StartWorldMapEvent),
    PROC_CALL(GC_DarkenScreen),
    PROC_YIELD,

    PROC_CALL(StartBattleMap),
    PROC_YIELD,

    // fallthrough

PROC_LABEL(7),
    PROC_YIELD,
    PROC_CALL(sub_8012FEC),
    PROC_YIELD,

    PROC_CALL(GC_RestoreChapterId),

    // fallthrough

PROC_LABEL(16),
    PROC_CALL(GC_InitNextChapter),

    PROC_CALL(GC_CallPostChapterSaveMenu),
    PROC_YIELD,

    PROC_GOTO(5),

PROC_LABEL(19),
    PROC_YIELD,

    PROC_START_CHILD_BLOCKING(ProcScr_Unk_08DB7EB0),
    PROC_CALL(TransferLynModeUnits),
    PROC_YIELD,

    PROC_CALL(GC_SetEliwoodMode),
    PROC_CALL(StartModeSelect),
    PROC_YIELD,

    PROC_CALL(SetPostLynModeChapter),
    PROC_START_CHILD_BLOCKING(ProcScr_Unk_08DB8088),
    PROC_YIELD,

    PROC_CALL(sub_8012F2C),

    // fallthrough

PROC_LABEL(20),
    PROC_START_CHILD_BLOCKING(ProcScr_Unk_08DB8048),

    PROC_GOTO(5),

PROC_LABEL(6),
    PROC_CALL(GC_DarkenScreen),
    PROC_CALL(ResumeChapterFromSuspend),
    PROC_YIELD,

    PROC_CALL(GC_RememberChapterId),
    PROC_CALL(GC_PostLoadSuspend),

    PROC_GOTO(7),

PROC_LABEL(12),
    PROC_CALL(GC_StartExtraMap),
    PROC_CALL(StartBattleMap),

    PROC_YIELD,

PROC_LABEL(8),
    PROC_YIELD,

    PROC_CALL(sub_8012FEC),
    PROC_YIELD,

    PROC_CALL(sub_8012FCC),
    PROC_SLEEP(30),

    PROC_CALL(sub_80BAAB8),
    PROC_YIELD,

    PROC_GOTO(3),

PROC_LABEL(10),
    PROC_CALL(sub_8043290),
    PROC_YIELD,

    PROC_CALL(sub_8012D98),

    PROC_GOTO(4),

PROC_LABEL(11),
    PROC_CALL(sub_80448B8),
    PROC_YIELD,

    PROC_CALL(sub_8012D98),

    PROC_GOTO(4),

PROC_LABEL(13),
    PROC_CALL(sub_802EB7C),
    PROC_CALL(sub_8013128),
    PROC_YIELD,

PROC_LABEL(14),
    PROC_CALL(sub_8013160),
    PROC_YIELD,

    PROC_WHILE(IsEventRunning),

    PROC_CALL(sub_802EBA0),
    PROC_CALL(sub_80B9C0C),
    PROC_SLEEP(30),

    PROC_GOTO(3),

PROC_LABEL(15),
    PROC_CALL(GC_InitSramResetScreen),

    PROC_CALL(StartMidLockingFadeToBlack),
    PROC_REPEAT(WaitForFade),

    PROC_CALL(sub_8043948),
    PROC_YIELD,

    PROC_CALL(StartMidFadeFromBlack),
    PROC_REPEAT(WaitForFade),

    PROC_CALL(EndMuralBackground),

    PROC_GOTO(0),

    PROC_END,
};

// clang-format on

void StartGame(void)
{
    struct GameCtrlProc * proc;

    SetMainFunc(OnMain);
    SetOnVBlank(OnVBlank);

    proc = Proc_Start(ProcScr_GameControl, PROC_TREE_3);

    proc->next_action = 0;
    proc->next_chapter = 0;
    proc->idle_status = 0;
}

struct GameCtrlProc * GetGameControl(void)
{
    return Proc_Find(ProcScr_GameControl);
}

void SetNextGameAction(s32 action)
{
    GetGameControl()->next_action = action;
}

void SetNextChapterId(s32 chapter_id)
{
    GetGameControl()->next_chapter = chapter_id;
}

bool HasNextChapter(void)
{
    struct GameCtrlProc * proc = GetGameControl();
    return proc->next_chapter == 0 ? false : true;
}

void sub_8013240(void)
{
    Proc_EndEach(ProcScr_GameControl);
    Proc_Goto(Proc_Start(ProcScr_GameControl, PROC_TREE_3), 5);
}

void sub_8013264(void)
{
    Proc_EndEach(ProcScr_GameControl);
    Proc_Goto(Proc_Start(ProcScr_GameControl, PROC_TREE_3), 6);
}

void sub_8013288(void)
{
    Proc_EndEach(ProcScr_GameControl);
    Proc_Goto(Proc_Start(ProcScr_GameControl, PROC_TREE_3), 15);
}

void ForceEnableSounds(void)
{
    gPlaySt.cfgDisableBgm = 0;
    gPlaySt.cfgDisableSoundEffects = 0;
}

void sub_80132C8(void)
{
    gPlaySt.cfgAnimationType = 0;
    gPlaySt.cfgTextSpeed = 1;
    gPlaySt.cfgGameSpeed = 0;
    gPlaySt.cfgDisableBgm = 0;
    gPlaySt.cfgDisableSoundEffects = 1;
    gPlaySt.config_window_theme = 0;
    gPlaySt.cfgUnitColor = 0;
}
