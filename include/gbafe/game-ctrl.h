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

// sub_8012BC0
// sub_8012C64
// GC_CheckSramResetKeyCombo
// GC_InitSramResetScreen
// GC_InitFastStartCheck
// GC_FastStartCheck
// sub_8012D4C
void sub_8012D60(int);
// sub_8012D98
// sub_8012DB4
// GC_PostIntro
// sub_8012E40
// GC_PostMainMenu
// sub_8012F2C
// sub_8012F44
// sub_8012F50
// sub_8012F6C
// sub_8012FB0
// sub_8012FCC
// sub_8012FEC
// GC_CheckForGameEnded
// GC_PostLoadSuspend
// GC_InitNextChapter
// sub_80130C0
// sub_80130DC
// GC_DarkenScreen_
// sub_8013128
// sub_8013160
// GC_InitDemo
// GC_DarkenScreen
// StartGame
// sub_80131F0
void SetNextGameAction(int action);
void SetNextChapterId(int chapter_id);
// sub_8013228
// sub_8013240
// sub_8013264
// sub_8013288
void ForceEnableSounds(void);
// sub_80132C8
