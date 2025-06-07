#include "gbafe.h"

void ReadGameSavePlaySt(s32, struct PlaySt *);

u8 sub_8012BC0(void)
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

void StartLordSelect(u8, ProcPtr);

bool sub_8012C64(struct GameCtrlProc * proc)
{
    StartLordSelect(sub_8012BC0(), proc);
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

void sub_8003684(int, int);

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

        sub_8003684(SONG_5A, 0);
        StartBgmVolumeChange(0, 0xC0, 0x3C, NULL);

        Proc_Goto(proc, 4);
    }
}

void sub_8012D4C(ProcPtr proc)
{
    if (((struct Proc *)proc)->proc_mark != 11)
        Proc_End(proc);
}

void sub_8004648(ProcFunc func);

void sub_8012D60(ProcPtr proc)
{
    CpuFastFill16(0, gPal, PLTT_SIZE);
    EnablePalSync();
    sub_8004648(sub_8012D4C);
    SetMainFunc(OnMain);
}

void sub_8012D98(void)
{
    sub_8003684(SONG_5A, 0);
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

int sub_80A0580(void);

void GC_PostMainMenu(struct GameCtrlProc * proc)
{
    switch (proc->next_action)
    {
        case GAME_ACTION_EVENT_RETURN:
        case GAME_ACTION_CLASS_REEL:
        case GAME_ACTION_USR_SKIPPED:
        case GAME_ACTION_PLAYED_THROUGH:
            if (sub_80A0580() == 11)
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

void sub_807A0A0(void); // ResetPermanentFlags
void sub_8079FDC(void); // ResetChapterFlags
void InitPlayConfig(int);

void sub_8012F6C(struct GameCtrlProc * proc)
{
    if (proc->next_action == GAME_ACTION_5)
    {
        Proc_Goto(proc, 4);
        return;
    }

    InitPlayConfig(0);

    gPlaySt.chapterStateBits |= PLAY_FLAG_TUTORIAL;

    sub_807A0A0();
    sub_8079FDC();
    InitUnits();

    gPlaySt.chapterIndex = proc->next_chapter;
}

void sub_80A2BFC(void); // NullBmMapHidden_
void ClearPidStats(void);

void sub_8012FB0(void)
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

void sub_80130C0(ProcPtr proc)
{
    if (gPlaySt.chapterIndex != CHAPTER_2F)
        sub_80A5AF8(proc);
}

void sub_80130DC(void)
{
    gPlaySt.chapterModeIndex = CHAPTER_MODE_ELIWOOD;
}

void GC_DarkenScreen_(ProcPtr proc)
{
    SetBlendDarken(16);
    SetBlendTargetA(1, 1, 1, 1, 1);
    SetBlendBackdropA(1);
}

extern EventScr gUnk_08D8A0E0[];
extern EventScr gUnk_08D8A114[];

extern EventScr gUnk_08D8A148[];
extern EventScr gUnk_08D8A1B4[];

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

void GC_InitDemo(struct GameCtrlProc * proc)
{
    proc->chapter_id = gPlaySt.chapterIndex;
}

void GC_DarkenScreen(struct GameCtrlProc * proc)
{
    gPlaySt.chapterIndex = proc->chapter_id;
}

extern struct ProcCmd ProcScr_GameControl[];

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

struct GameCtrlProc * sub_80131F0(void)
{
    return Proc_Find(ProcScr_GameControl);
}

void SetNextGameAction(s32 action)
{
    sub_80131F0()->next_action = action;
}

void SetNextChapterId(s32 chapter_id)
{
    sub_80131F0()->next_chapter = chapter_id;
}

bool sub_8013228(void)
{
    struct GameCtrlProc * proc = sub_80131F0();
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
