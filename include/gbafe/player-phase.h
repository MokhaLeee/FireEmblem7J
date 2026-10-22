#pragma once

#include "global.h"
#include "proc.h"

enum {
    PL_PLAYERPHASE_BEGIN = 0,
    PL_PLAYERPHASE_MOVE = 1,
    PL_PLAYERPHASE_ACTION_MENU = 2,
    PL_PLAYERPHASE_END = 3,
    PL_PLAYERPHASE_FADE_TO_MOVE = 4,
    PL_PLAYERPHASE_AFTER_STATSCREEN = 5,
    PL_PLAYERPHASE_RESUME_RANGE = 6,
    PL_PLAYERPHASE_ACTION = 7,
    PL_PLAYERPHASE_AFTER_END_EVENT = 8,
    PL_PLAYERPHASE_IDLE = 9,
    PL_PLAYERPHASE_ADJUST_CAMERA = 10,
    PL_PLAYERPHASE_SEE_RANGE = 11,
    PL_PLAYERPHASE_DANGER_ZONE = 12,
};

struct MoveLimitViewProc {
    /* 00 */ PROC_HEADER;

    /* 29 */ STRUCT_PAD(0x29, 0x4A);
    /* 4A */ s16 flags;
};

struct MoveLimitViewChangeProc {
    /* 00 */ PROC_HEADER;

    /* 29 */ STRUCT_PAD(0x29, 0x4C);
    /* 4C */ s16 frame;
};

enum {
    PLAYER_SELECT_NOUNIT = 0,
    PLAYER_SELECT_TURNENDED = 1,
    PLAYER_SELECT_CONTROL = 2,
    PLAYER_SELECT_NOCONTROL = 3,
    PLAYER_SELECT_4 = 4,
};

enum {
    LIMITVIEW_BLUE = (1 << 0),
    LIMITVIEW_RED = (1 << 1),
    LIMITVIEW_GREEN = (1 << 2),
    // (1 << 3)
    LIMITVIEW_UNK = (1 << 4),
};

void PlayerPhase_Suspend(void);
void HandlePlayerCursorMovement(void);
bool CanShowUnitStatScreen(struct Unit * unit);
void PlayerPhase_MainIdle(ProcPtr proc);
void DisplayUnitEffectRange(struct Unit * unit);
void PlayerPhase_InitUnitMovementSelect(void);
void DisplayActiveUnitEffectRange(ProcPtr proc);
void PlayerPhase_DisplayDangerZone(void);
void PlayerPhase_RangeDisplayIdle(ProcPtr proc);
void PlayerPhase_CancelAction(ProcPtr proc);
void PlayerPhase_BackToMove(ProcPtr proc);
s8 PlayerPhase_PrepareAction(ProcPtr proc);
bool TryMakeCantoUnit(ProcPtr proc);
bool RunPotentialWaitEvents(void);
bool EnsureCameraOntoActiveUnitPosition(ProcPtr proc);
void PlayerPhase_FinishAction(ProcPtr proc);
void EventApplyPlayerUnitMove(void);
void PlayerPhase_OpenActionMenu(ProcPtr proc);
void PlayerPhase_ApplyUnitMovement(ProcPtr proc);
int GetPlayerSelectKind(struct Unit * unit);
bool CanMoveActiveUnitTo(int x, int y);
void PlayerPhase_DisplayUnitMovement(void);
void PlayerPhase_WaitForUnitMovement(ProcPtr proc);
void PlayerPhase_ResumeRangeDisplay(ProcPtr proc);
void PlayerPhase_ReReadGameSaveGfx(void);
void MoveLimitViewChange_OnInit(struct MoveLimitViewChangeProc * proc);
void MoveLimitViewChange_OnLoop(struct MoveLimitViewChangeProc * proc);
void MoveLimitView_OnInit(ProcPtr proc);
void MoveLimitView_OnLoop(struct MoveLimitViewProc * proc);
// sub_801D66C
void DisplayMoveRangeGraphics(int flags);
void HideMoveRangeGraphics(void);
// TrySetCursorOn
void TrySwitchViewedUnit(int x, int y);
// sub_801D7B0

extern const u8 * CONST_DATA gOpenLimitViewImgLut[];
