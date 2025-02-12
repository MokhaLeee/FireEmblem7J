#pragma once

#include "global.h"
#include "proc.h"

// ??? UiCursorHand_Init
// ??? UiCursorHand_Loop
ProcPtr StartUiCursorHand(ProcPtr parent);
void SetUiCursorHandConfig(int index, int x, int y, u8 flags);
void UiCursorHand_SetPosition(int index, int x_start, int y_start, int x_end, int y_end);
void DisableUiCursorHand(int index);
// ??? DisableAllUiCursorHand
// ??? BlockUiCursorHand
// ??? UnblockUiCursorHand
// ??? EndUiCursorHand
