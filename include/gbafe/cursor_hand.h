#pragma once

#include "global.h"
#include "proc.h"

struct ProcCursorHand {
	PROC_HEADER;

	STRUCT_PAD(0x29, 0x2C);

	/* 2C */ struct { u8 x_start, y_start, x_end, y_end; } configs[4];
	/* 3C */ u8 flag[4];
	/* 40 */ s16 x[4], y[4];
};

void UiCursorHand_Init(struct ProcCursorHand *proc);
void UiCursorHand_Loop(struct ProcCursorHand *proc);
ProcPtr StartUiCursorHand(ProcPtr parent);
void SetUiCursorHandConfig(int index, int x, int y, u8 flags);
void UiCursorHand_SetPosition(int index, int x_start, int y_start, int x_end, int y_end);
void DisableUiCursorHand(int index);
void DisableAllUiCursorHand(void);
void BlockUiCursorHand(void);
void UnblockUiCursorHand(void);
void EndUiCursorHand(void);

extern u16 CONST_DATA Sprite_CursorHand1[];
extern u16 CONST_DATA Sprite_CursorHand2[];
extern struct ProcCmd CONST_DATA ProcScr_UiCursorHand[];
