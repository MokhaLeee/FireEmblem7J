#pragma once

#include "global.h"
#include "proc.h"
#include "anime.h"
#include "banim.h"

struct EkrDragonStatus {

    /* 00 */ u16 type;
    /* 02 */ u16 attr;
    /* 04 */ ProcPtr proc;
    /* 08 */ u32 unk08;
    /* 0C */ struct Anim * anim;
};

enum dragonstatue_attr {
    /* EkrDragonStatus::attr */
    EKRDRGON_ATTR_START = 1 << 0,
    EKRDRGON_ATTR_BANIMFX_PREPARED = 1 << 1,
    EKRDRGON_ATTR_BANIMFINISH = 1 << 2,
    EKRDRGON_ATTR_END = 1 << 3,
    EKRDRGON_ATTR_DEAD = 1 << 12,
};

extern struct EkrDragonStatus gEkrDragonStatusLeft, gEkrDragonStatusRight;

void ResetEkrDragonStatus(void);
struct EkrDragonStatus * GetEkrDragonStatus(struct Anim * anim);
u16 GetEkrDragonStatusAttr(struct Anim * anim);
void AddEkrDragonStatusAttr(struct Anim * anim, u16 attr_bitfile);
u32 GetEkrDragonStatusType(struct Anim * anim);
u32 GetEkrDragonStatusType_(struct Anim * anim);
void AddEkrDragonStatusType(struct Anim * anim, u16 type_bitfile);
int CheckInEkrDragon(void);
void EkrDragonTmCpyHFlip(int x, int y);
void EkrDragonTmCpyExt(int x, int y);
void EkrDragonTmCpyWithDistance(void);
bool EkrDragonIntroDone(struct Anim * anim);
bool CheckEkrDragonEndingDone(struct Anim * anim);
void SetEkrDragonExit(struct Anim * anim);
void SetEfxDragonDeadFallHead(struct Anim * anim);
bool CheckEfxDragonDeadFallHead(struct Anim * anim);

struct ProcEkrDragonIntroFx {
    PROC_HEADER;

    /* 29 */ bool unk29;
    /* 2A */ u16 unk2A;
    /* 2C */ s16 timer;
    /* 2E */ s16 timer2;

    STRUCT_PAD(0x30, 0x32);

    /* 32 */ u16 x;
    /* 34 */ s16 x_hi;

    STRUCT_PAD(0x36, 0x3A);

    /* 3A */ s16 y;
    /* 3C */ s16 y_hi;

    STRUCT_PAD(0x3E, 0x44);

    /* 44 */ int duration;
    /* 48 */ int step;
    /* 4C */ int speed;
    /* 50 */ int unk50;
};

struct ProcEkrDragonFx {
    PROC_HEADER;

    /* 29 */ u8 done;
    /* 2A */ s16 unk2A;
    /* 2C */ s16 timer;
    /* 2E */ s16 step;
    /* 30 */ s16 unk30;
    /* 32 */ s16 x;

    STRUCT_PAD(0x34, 0x3A);

    /* 3A */ u16 y;
    /* 3C */ u16 y_hi;

    STRUCT_PAD(0x3E, 0x44);

    /* 44 */ u32 frame;
    /* 48 */ const s16 * conf;
    /* 4C */ u16 const * const * fx;
    /* 50 */ u32 unk50;
    /* 54 */ u32 round_cur;
    /* 58 */ u32 unk58;
    /* 5C */ struct Anim * anim;
    /* 60 */ struct Anim * anim2;
    /* 64 */ ProcPtr sprocfx;
};

struct ProcEkrDragon {
    PROC_HEADER;

    /* 29 */ u8 done;

    STRUCT_PAD(0x2A, 0x2C);

    /* 2C */ s16 timer;
    /* 2E */ s16 terminator;
    /* 30 */ s16 timer2;
    /* 32 */ s16 x; 

    STRUCT_PAD(0x34, 0x3A);

    /* 3A */ s16 y_lo;
    /* 3C */ s16 y_hi;

    STRUCT_PAD(0x3E, 0x44);

    /* 44 */ ProcPtr sproc_flashingobj;
    /* 48 */ ProcPtr sproc_bg2fx;
    /* 4C */ ProcPtr sproc_bg2scroll;
    /* 50 */ struct ProcEkrDragon * mainfxproc;
    /* 54 */ ProcPtr proc54;
    /* 58 */ ProcPtr sproc_bg2scrollhandle;
    /* 5C */ struct Anim * anim;
    /* 60 */ ProcPtr sproc1;
    /* 64 */ struct ProcEkrDragonIntroFx * procfx;
    /* 68 */ ProcPtr sproc_flashingbg;
};

extern struct ProcCmd CONST_DATA ProcScr_EkrDragon[];

extern u16 gEkrBgPaletteBackup[0x20];

void InitEkrDragonStatus(void);
void EkrDragonUpdateFlashingUnit(struct Anim * anim);
void BanimSetFrontPaletteForDragon(struct Anim * anim);
void EkrDragonUpdatePal_08065510(int ref);
void NewEkrDragon(struct Anim * anim);
void EkrDragon_Preparefx(struct ProcEkrDragon * proc);
void EkrDragon_CustomBgFadeIn(struct ProcEkrDragon * proc);
void EkrDragon_StartDragonTailIntro(struct ProcEkrDragon * proc);
void EkrDragon_DragonTailDisplay(struct ProcEkrDragon * proc);
void EkrDragon_StartMainBodyIntro(struct ProcEkrDragon * proc);
void EkrDragon_PreMainBodyIntro(struct ProcEkrDragon * proc);
void EkrDragon_StartMainBodyFallIn(struct ProcEkrDragon * proc);
void EkrDragon_WaitMainBodyFallIn(struct ProcEkrDragon * proc);
void EkrDragon_PreBattleSpark(struct ProcEkrDragon * proc);
void EkrDragon_TriggerIntroDone(struct ProcEkrDragon * proc);
void EkrDragon_InBattleIDLE(struct ProcEkrDragon * proc);
void EkrDragon_WaitForFadeOut(struct ProcEkrDragon * proc);
void EkrDragon_ReloadTerrainEtc(struct ProcEkrDragon * proc);
void EkrDragon_ReloadCustomBgAndFadeOut(struct ProcEkrDragon * proc);
void EkrDragon_TriggerEnding(struct ProcEkrDragon * proc);

/**
 * EkrDragonFx
 */
/* ekrDragonBaseHide */
extern CONST_DATA struct ProcCmd ProcScr_EkrDragonBaseHide[];
ProcPtr NewEkrDragonBaseHide(struct Anim * anim);
void EkrDragonBaseHide_Loop(struct ProcEkrDragonFx * proc);
void EkrDragonBaseHide_Nop(struct ProcEkrDragonFx * proc);

/* ekrDragonBaseAppear */
extern CONST_DATA struct ProcCmd ProcScr_EkrDragonBaseAppear[];
ProcPtr NewEkrDragonBaseAppear(struct Anim * anim);
void EkrDragonBaseAppear_Loop(struct ProcEkrDragonFx * proc);
void EkrDragonBaseAppear_Nop(struct ProcEkrDragonFx * proc);

/* ekrDragonTunkFace */
extern CONST_DATA struct ProcCmd ProcScr_EkrDragonTunkFace[];
ProcPtr NewEkrDragonTunkFace(struct Anim * anim);
void EkrDragonTunkFace_Loop(struct ProcEkrDragonFx * proc);

/* EfxDragonDeadFallBody */
extern CONST_DATA struct ProcCmd ProcScr_EfxDragonDeadFallBody[];
ProcPtr NewEfxDragonDeadFallBody(struct Anim * anim);
void EfxDragonDeadFallBody_CallBack(struct ProcEkrDragonFx * proc);
void EfxDragonDeadFallBody_Loop1(struct ProcEkrDragonFx * proc);
void EfxDragonDeadFallBody_Loop2(struct ProcEkrDragonFx * proc);
void EfxDragonDeadFallBody_Blocking(struct ProcEkrDragonFx * proc);

/* EfxDragonDeadFallHead */
extern CONST_DATA struct ProcCmd ProcScr_EfxDragonDeadFallHeadFx[];
ProcPtr NewEfxDragonDeadFallHeadFx(struct Anim * anim);
void EfxDragonDeadFallHead_CallBack(struct ProcEkrDragonFx * proc);
void EfxDragonDeadFallHead_Loop1(struct ProcEkrDragonFx * proc);
void EfxDragonDeadFallHead_Loop2(struct ProcEkrDragonFx * proc);

struct ProcEkrDragonStatusFlashing {
    /* This maybe a same type of ProcEkrDragonFx */
    PROC_HEADER;

    /* 29 */ u8 fxtype;

    STRUCT_PAD(0x2A, 0x2C);

    /* 2C */ s16 timer;

    STRUCT_PAD(0x2E, 0x44);

    /* 44 */ u32 frame;
    /* 48 */ const s16 * conf;
    /* 4C */ const u16 * pal;

    STRUCT_PAD(0x50, 0x54);

    /* 54 */ u32 round_cur;

    STRUCT_PAD(0x58, 0x5C);

    /* 5C */ struct Anim * anim;
};

extern CONST_DATA struct ProcCmd ProcScr_EkrDragonFlashingWingBg[];
ProcPtr NewEkrDragonFlashingWingBg(struct Anim * anim);
void EkrDragonFlashingWingBg_Loop(struct ProcEkrDragonStatusFlashing * proc);

extern CONST_DATA struct ProcCmd ProcScr_EkrDragonFlashingWingObj[];
ProcPtr NewEkrDragonFlashingWingObj(struct Anim * anim);
void EkrDragonFlashingWingObj_Loop(struct ProcEkrDragonStatusFlashing * proc);

/* Fire BG */
extern CONST_DATA struct ProcCmd ProcScr_EkrDragonFireBG2[];
ProcPtr NewEkrDragonFireBG2(struct Anim * anim);
void EkrDragonFireBG2_CallBackNop(struct ProcEkrDragonFx * proc);
void EkrDragonFireBG2_Blocking(struct ProcEkrDragonFx * proc);

/* Maybe Fire BG move position */
extern CONST_DATA struct ProcCmd ProcScr_EkrDragonBg2ScrollHandler[];
ProcPtr NewEkrDragonBg2ScrollHandler(void);
void EkrDragonBg2ScrollHandler_Loop(struct ProcEkrDragonFx * proc);

/* Fire BG special effect ? */
extern CONST_DATA struct ProcCmd ProcScr_EkrDragonBg2ScrollExt[];
void EkrDragonBg2Scroll_OnVBlank(void);
ProcPtr NewEkrDragonBg2ScrollExt(struct Anim * anim);
void EkrDragonBg2ScrollExt_CallBack(void);
void EkrDragonBg2ScrollExt_Loop(void);

/* Fire BG1 on intro */
extern CONST_DATA struct ProcCmd ProcScr_EkrDragonBg3HfScrollHandler[];
ProcPtr NewEkrDragonBg3HfScrollHandler(int, int, int, int);
void EkrDragonBg3HfScrollHandler_Loop(struct ProcEkrDragonIntroFx * proc);

extern struct ProcCmd CONST_DATA ProcScr_EkrDragonBg3HfScroll[];
void EkrDragonBg3HfScroll_OnVBlank(void);
void NewEkrDragonBg3HfScroll(int, u16);
void EkrDragonBg3HfScroll_Nop(struct ProcEkrDragonIntroFx * proc);
void EkrDragonBg3HfScroll_Loop(struct ProcEkrDragonIntroFx * proc);

extern CONST_DATA struct ProcCmd ProcScr_EkrDragonFxMain[];
extern CONST_DATA const u16 * Tsas_EkrDragon_08C48874[];
ProcPtr NewEkrDragonFxMain(struct Anim * anim);
void EkrDragonFxMainHandler(struct ProcEkrDragonFx * proc);

extern CONST_DATA struct ProcCmd ProcScr_EkrDragonBodyBlack[];
ProcPtr NewEkrDragonBodyBlack(struct Anim * anim);
void EkrDragonBodyBlack_Loop(struct ProcEkrDragonFx * proc);
void EkrDragonBodyBlack_Nop(struct ProcEkrDragonFx * proc);

ProcPtr NewEkrDragonTunk(struct Anim * anim);
void sub_80668B8(int x, int y);
void sub_8066950(int x, int y);
void EkrDragonTunk_Loop1(struct ProcEkrDragon * proc);
void EkrDragonTunk_Loop2(struct ProcEkrDragon * proc);
void EkrDragonTunk_NopLoop(struct ProcEkrDragon * proc);

void NewEkrDragonFireBg3(struct Anim * anim, int);
// ??? sub_8066D30
// ??? sub_8066D40
void sub_8066DA0(ProcPtr parent, int, int);
// ??? sub_8066DD8
void NewEkrDragonProc_8066F80(int, int, int);
// ??? sub_8066FC0
// ??? sub_8067030
// ??? sub_8067088
// ??? sub_80670F8

extern u16 Pal_EkrDragon[0x10];
extern const u16 Pals_EkrDragonFlashingWingBg[];
extern u16 Pal_EkrDragonFireBG2[0x10];

extern CONST_DATA struct ProcCmd ProcScr_EkrDragonTunk[];
extern CONST_DATA struct ProcCmd ProcScr_EkrDragonFireBg2[];
extern CONST_DATA struct ProcCmd ProcScr_EkrDragon_08C488E4[];
extern CONST_DATA struct ProcCmd ProcScr_EkrDragon_08C488FC[];
extern CONST_DATA struct ProcCmd ProcScr_EkrDragonFlashingWingBg[];
extern CONST_DATA struct ProcCmd ProcScr_EkrDragonFlashingWingBg[];
extern CONST_DATA struct ProcCmd ProcScr_EkrDragonFlashingWingBg[];
extern AnimScr AnimScr_EfxDragonDeadFallBody[];
extern AnimScr AnimScr_08C49F4C[];
extern AnimScr AnimScr_EkrDragonHead[];
extern AnimScr AnimScr_EfxDragonDeadFallBody2[];
extern AnimScr AnimScr_EfxDragonDeadFallHeadFx[];
extern s16 gUnk_08C4A008[];
// ??? gUnk_08C4A288
// ??? gUnk_08C4A29C
// ??? gUnk_08C4A2B4
// ??? gUnk_08C4A2CC
// ??? gUnk_08C4A674
// ??? gUnk_08C4A690
// ??? gUnk_08C4A6AC
// ??? gUnk_08C4A6C8
// ??? gUnk_08C4A6E4
// ??? gUnk_08C4A704
// ??? gUnk_08C4A71C
// ??? gUnk_08C4A778
