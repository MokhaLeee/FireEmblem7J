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
void SetEkrDragonDead(struct Anim * anim);
bool CheckEkrDragonDead(struct Anim * anim);

struct ProcEkrDragonFx {
    PROC_HEADER;

    /* 29 */ bool unk29;
    /* 2A */ u16 unk2A;
    /* 2C */ u16 unk2C;

    STRUCT_PAD(0x2E, 0x32);

    /* 32 */ u16 x;
    /* 34 */ s16 y;

    STRUCT_PAD(0x36, 0x3A);

    /* 3A */ s16 unk3A;
    /* 3C */ s16 unk3C;
};

struct ProcEkrDragonMainFx {
    PROC_HEADER;

    /* 29 */ u8 finished;
    /* 2A */ s16 unk2A;
    /* 2C */ s16 timer;
    /* 2E */ s16 unk2E;
    /* 30 */ s16 unk30;
    /* 32 */ s16 unk32;

    STRUCT_PAD(0x34, 0x3A);

    /* 3A */ u16 unk3A;

    STRUCT_PAD(0x3C, 0x44);

    /* 44 */ u32 frame;
    /* 48 */ const s16 * frame_lut;
    /* 4C */ const u16 ** tsa_set;
    /* 50 */ u32 unk50;
    /* 54 */ u32 round_cur;
    /* 58 */ u32 unk58;
    /* 5C */ struct Anim *anim;
    /* 60 */ struct Anim *anim2;
};

struct ProcEkrDragon {
    PROC_HEADER;

    STRUCT_PAD(0x29, 0x2C);

    /* 2C */ s16 timer;
    /* 2E */ s16 terminator;

    STRUCT_PAD(0x30, 0x3A);

    /* 3A */ s16 y;
    /* 3C */ s16 unk3C;

    STRUCT_PAD(0x3E, 0x44);

    /* 44 */ ProcPtr proc44;
    /* 48 */ ProcPtr proc48;
    /* 4C */ ProcPtr proc4C;
    /* 50 */ struct ProcEkrDragonMainFx * mainfxproc;
    /* 54 */ ProcPtr proc54;
    /* 58 */ ProcPtr proc58;
    /* 5C */ struct Anim * anim;
    /* 60 */ ProcPtr sproc1;
    /* 64 */ struct ProcEkrDragonFx * procfx;
    /* 68 */ ProcPtr sproc3;
};

extern struct ProcCmd CONST_DATA ProcScr_EkrDragon[];

void InitEkrDragonStatus(void);
void EkrDragonUpdateFlashingUnit(struct Anim * anim);
void EkrDragonUpdatePal_080654C8(struct Anim * anim);
// ??? EkrDragonUpdatePal_08065510
void NewEkrDragon(struct Anim * anim);
void EkrDragon_Preparefx(struct ProcEkrDragon * proc);
void EkrDragon_CustomBgFadeIn(struct ProcEkrDragon * proc);
void EkrDragon_StartDragonTailIntro(struct ProcEkrDragon * proc);
void EkrDragon_DragonTailDisplay(struct ProcEkrDragon * proc);
void EkrDragon_StartMainBodyIntro(struct ProcEkrDragon * proc);
void EkrDragon_DisplayMainBodyIntro(struct ProcEkrDragon * proc);
void EkrDragon_080657D4(struct ProcEkrDragon * proc);
void EkrDragon_080658F8(struct ProcEkrDragon * proc);
void EkrDragon_08065AB0(struct ProcEkrDragon * proc);
void EkrDragon_TriggerIntroDone(struct ProcEkrDragon * proc);
void EkrDragon_InBattleIDLE(struct ProcEkrDragon * proc);
void EkrDragon_WaitForFadeOut(struct ProcEkrDragon * proc);
void EkrDragon_ReloadTerrainEtc(struct ProcEkrDragon * proc);
void EkrDragon_ReloadCustomBgAndFadeOut(struct ProcEkrDragon * proc);
void EkrDragon_TriggerEnding(struct ProcEkrDragon * proc);
void NewEkrDragonBaseHide(struct Anim * anim);
// ??? sub_08065D5C
// ??? sub_08065DC4
void NewEkrDragonBaseAppear(struct Anim * anim);
// ??? sub_08065E38
// ??? sub_08065EA0
ProcPtr EkrDragonFxHandler_Main(struct Anim * anim);
// ??? sub_08065F0C
ProcPtr sub_08065F38(struct Anim * anim);
// ??? sub_08065F8C
// ??? sub_08065F98
// ??? sub_08065FEC
// ??? sub_08066030
// ??? InitEkrDragonDeadFx
// ??? sub_08066090
// ??? sub_0806609C
// ??? sub_080660C8
ProcPtr sub_080660F4(struct Anim * anim);
// ??? sub_08066118
ProcPtr sub_08066200(struct Anim * anim);
// ??? sub_08066224
ProcPtr sub_080662F4(struct Anim * anim);
// ??? nullsub_53
// ??? nullsub_54
ProcPtr sub_08066380(void);
// ??? sub_08066398
// ??? sub_080663EC
ProcPtr sub_08066414(struct Anim * anim);
// ??? sub_08066480
// ??? sub_0806648C
ProcPtr EkrDragonFxHandler_OnIntro(int, int, int, int);
// ??? sub_08066500
// ??? sub_08066590
void sub_080665B8(int, u16);
// ??? sub_08066634
// ??? sub_08066640
ProcPtr sub_080666A4(struct Anim * anim);
// ??? sub_080666D4
ProcPtr NewEkrDragonBodyBlack(struct Anim * anim);
// ??? sub_08066828
// ??? nullsub_55
// ??? sub_080668B8
// ??? sub_08066950
ProcPtr NewEkrDragonTunk(struct Anim * anim);
// ??? sub_080669E8
// ??? sub_08066AE0
// ??? nullsub_56
void sub_08066CAC(struct Anim * anim, int);
// ??? sub_08066D30
// ??? sub_08066D40
void sub_08066DA0(ProcPtr parent, int, int);
// ??? sub_08066DD8
// ??? sub_08066F80
// ??? sub_08066FC0
// ??? sub_08067030
// ??? sub_08067088
// ??? sub_080670F8

extern u16 Pal_EkrDragon[0x10];
extern u16 Pal_EkrDragon_082E6C60[0x10];
extern u16 Pal_EkrDragon_082EB510[0x10];
