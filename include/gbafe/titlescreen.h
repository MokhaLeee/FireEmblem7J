#pragma once

#include "global.h"
#include "proc.h"

struct ProcTitle {
    PROC_HEADER;

    STRUCT_PAD(0x29, 0x30);

    /* 30 */ ProcPtr approcs[6];

    STRUCT_PAD(0x48, 0x50);

    /* 50 */ u8 timer; 
    /* 51 */ s8 mode;
    /* 54 */ int timer_idle;
};

struct TitleSt {
    /* 00 */ int unk_00;
    /* 04 */ int unk_04;
    /* 08 */ int unk_08;
    /* 0C */ int unk_0C;
    /* 10 */ int unk_10;
};

extern struct TitleSt gTitleSt;

void HBlank_TitleScreen(void);
void ResetTitleBgAffin(u8 bg);
void Title_InitSpriteAnim(struct ProcTitle * proc, bool anim_en);
void Title_InitBg(struct ProcTitle * proc);
void Title_Init(struct ProcTitle * proc);
void Title_InitDisp(struct ProcTitle * proc);
void Title_StartBmBgfxAnim(struct ProcTitle * proc);
void Title_BmBgfxAnimIN(struct ProcTitle * proc);
void Title_ResetBmBgfxConf(struct ProcTitle * proc);
void Title_BmBgfxAnimOUT(struct ProcTitle * proc);
void Title_RefrainSprites(struct ProcTitle * proc);
void Title_IDLE(struct ProcTitle * proc);
void Title_End(struct ProcTitle * proc);
void StartTitleScreen_WithMusic(ProcPtr parent);
void StartTitleScreen_FlagFalse(ProcPtr parent);
void StartTitleScreen_FlagTrue(ProcPtr parent);

void Title_StartTextFlame(struct ProcTitle * proc);
void TitleFlame_Init(struct Proc * proc);
void TitleFlame_Loop(struct Proc * proc);

struct ProcTitleSpriteCtrl {
    PROC_HEADER;

    /* 2C */ ProcPtr approc;
    /* 30 */ int timer, duration;
    /* 38 */ int x_step, y_step;
    /* 40 */ int x, y;
    /* 48 */ void (* callback)(ProcPtr proc);
    /* 4C */ u8 mode;
};

void TitleSprite_Init(struct ProcTitleSpriteCtrl * proc);
void TitleSprite_Loop(struct ProcTitleSpriteCtrl * proc);
void TitleSpriteBlendIN(ProcPtr approc, int x_step, int y_step, int x, int y, int duration, ProcPtr parent);
void TitleSpriteBlendOUT(ProcPtr approc, int x_step, int y_step, int x, int y, int duration, void (* callback)(ProcPtr proc), ProcPtr parent);

extern struct ProcCmd ProcScr_TitleScreen[];
extern struct ProcCmd ProcScr_TitleFlame[];
extern struct ProcCmd ProcScr_TitleAnimSpriteCtrl[];
