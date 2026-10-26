#pragma once

#include "global.h"
#include "proc.h"

struct SpinningArrowProc
{
    /* 00 */ PROC_HEADER;
    /* 2C */ int kind;
    /* 30 */ int flags;
    /* 34 */ int x[2];
    /* 3C */ int y[2];
    /* 44 */ int unk_44[2];
    /* 4C */ int unk_4c[2];
    /* 54 */ u16 oam2;
};

void UiSpinningArrows_Init(struct SpinningArrowProc * proc);
void UiSpinningArrows_Loop(struct SpinningArrowProc * proc);
ProcPtr StartUiSpinningArrows(ProcPtr parent);
ProcPtr LoadUiSpinningArrowGfx(s32 kind, s32 chr, s32 palId);
void SetUiSpinningArrowConfig(s32 flags);
void SetUiSpinningArrowPositions(s32 x1, s32 y1, s32 x2, s32 y2);
void SetUiSpinningArrowFastMaybe(s32 kind);
void EndUiSpinningArrows(void);

extern u16 CONST_DATA Sprite_UiSpinningArrows_Horizontal[];
extern u16 CONST_DATA Sprite_UiSpinningArrows_Vertical[];
extern struct ProcCmd CONST_DATA ProcScr_UiSpinningArrows[];
