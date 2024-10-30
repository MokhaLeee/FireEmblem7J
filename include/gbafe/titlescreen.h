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

void Title_StartFlameAnim(struct ProcTitle * proc);
void TitleFlame_Init(struct Proc * proc);
void TitleFlame_Loop(struct Proc * proc);
// sub_80BB8CC
// sub_80BB940
void SetTitleScreenAnimParamSync(ProcPtr approc, int a, int b, int c, int d, int e, ProcPtr parent);
void sub_80BBAA4(ProcPtr approc, int a, int b, int c, int d, int e, int f, ProcPtr parent);

extern struct ProcCmd ProcScr_TitleScreen[];
extern struct ProcCmd ProcScr_TitleFlame[];
extern struct ProcCmd ProcScr_TitleAnimSpriteCtrl[];
