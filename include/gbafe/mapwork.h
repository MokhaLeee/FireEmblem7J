#pragma once

#include "global.h"
#include "mu.h"

void GenerateUnitMovementMapExt(struct Unit * unit, s8 movement);
// ??? sub_8019FFC
// ??? MapFloodRange_Unitless
// ??? GenerateExtendedMovementMap
// ??? sub_801A090
// ??? sub_801A0C0
// ??? sub_801A0E0
// ??? sub_801A164
// ??? BuildBestMoveScript
// ??? sub_801A3F0
// ??? sub_801A424
// ??? sub_801A4DC
// ??? sub_801A5C8
// ??? sub_801A6B4
// ??? sub_801A7B8
void GenerateUnitCompleteAttackRange(struct Unit * unit);
// ??? sub_801B040
void GenerateUnitCompleteStaffRange(struct Unit * unit);
// ??? sub_801B3E8
void GenerateMagicSealMap(int value);
// ??? SetWorkingBmMap
// ??? MapAddInBoundedRange
// ??? GetWorkingMoveCosts

extern u8 gWorkingMoveScr[MOVE_SCRIPT_MAX_LENGTH];
