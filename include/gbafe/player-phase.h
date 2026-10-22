#pragma once

#include "global.h"

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

enum {
    PLAYER_SELECT_NOUNIT = 0,
    PLAYER_SELECT_TURNENDED = 1,
    PLAYER_SELECT_CONTROL = 2,
    PLAYER_SELECT_NOCONTROL = 3,
    PLAYER_SELECT_4 = 4,
};

void PlayerPhase_Suspend(void);
void HandlePlayerCursorMovement(void);
bool CanShowUnitStatScreen(struct Unit * unit);
void PlayerPhase_MainIdle(ProcPtr proc);
// sub_801C8D4
// sub_801C980
// sub_801CA28
// sub_801CA60
// sub_801CACC
// sub_801CDA8
// sub_801CDC0
// sub_801CE3C
// sub_801CF9C
// sub_801D050
// sub_801D06C
// sub_801D094
// sub_801D154
// sub_801D184
// sub_801D1C0
int GetPlayerSelectKind(struct Unit * unit);
// sub_801D2F8
// sub_801D374
// sub_801D39C
// sub_801D3B8
// sub_801D44C
// sub_801D47C
// sub_801D4CC
// sub_801D50C
// sub_801D5E8
// sub_801D66C
// DisplayMoveRangeGraphics
// HideMoveRangeGraphics
// TrySetCursorOn
void TrySwitchViewedUnit(int x, int y);
// sub_801D7B0
