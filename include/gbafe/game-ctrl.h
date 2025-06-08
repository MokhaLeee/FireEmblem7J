#pragma once

#include "global.h"
#include "proc.h"

enum game_actions {
    GAME_ACTION_EVENT_RETURN = 0, /* Return form event command */
    GAME_ACTION_CLASS_REEL = 1,
    GAME_ACTION_USR_SKIPPED = 2,  /* User press button A/B/START to skip op-anim */
    GAME_ACTION_PLAYED_THROUGH = 3, /* Return if game played through */
    GAME_ACTION_4 = 4,
    GAME_ACTION_5 = 5,
    GAME_ACTION_6 = 6,
    GAME_ACTION_EXTRA_MAP = 7,
    GAME_ACTION_8 = 8,
    GAME_ACTION_9 = 9,
    GAME_ACTION_A = 0xA,
    GAME_ACTION_B = 0xB,
    GAME_ACTION_C = 0xC,
};

struct GameCtrlProc
{
    PROC_HEADER;

    /* 29 */ u8 next_action;
    /* 2A */ u8 next_chapter;
    /* 2B */ u8 idle_status;
    /* 2C */ u8 unk_2C;

    /* 2E */ s16 unk_2E;
    /* 30 */ u8 chapter_id;
};

// GetTitleClassReelSet
// GC_StartClassReel
// GC_CheckSramResetKeyCombo
// GC_InitSramResetScreen
// GC_InitFastStartCheck
// GC_FastStartCheck
// EndProcIfNotMarkedB
void sub_8012D60(ProcPtr);
// sub_8012D98
// sub_8012DB4
// GC_PostIntro
// sub_8012E40
// GC_PostMainMenu
// sub_8012F2C
// sub_8012F44
// sub_8012F50
// sub_8012F6C
// GC_StartExtraMap
// sub_8012FCC
// sub_8012FEC
// GC_CheckForGameEnded
// GC_PostLoadSuspend
// GC_InitNextChapter
// GC_CallPostChapterSaveMenu
// GC_SetEliwoodMode
// GC_DarkenScreen
// sub_8013128
// sub_8013160
// GC_RememberChapterId
// GC_RestoreChapterId
// StartGame
// GetGameControl
void SetNextGameAction(int action);
void SetNextChapterId(int chapter_id);
// HasNextChapter
// sub_8013240
// sub_8013264
// sub_8013288
void ForceEnableSounds(void);
// sub_80132C8
