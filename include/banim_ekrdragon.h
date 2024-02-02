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

struct ProcEkrDragon {
    PROC_HEADER;

    /* 29 */ u8 _pad_29[0x2C - 0x29];

    /* 2C */ s16 timer;
    /* 2E */ s16 tcounter;

    /* 30 */ u8 _pad_30[0x50 - 0x30];

    /* 50 */ ProcPtr fxproc;

    /* 54 */ u8 _pad_54[0x5C - 0x54];

    /* 5C */ struct Anim * anim;
};

extern struct ProcCmd CONST_DATA ProcScr_EkrDragon[];

void InitEkrDragonStatus(void);
void EkrDragonUpdateFlashingUnit(struct Anim * anim);
void EkrDragonUpdatePal_080654C8(struct Anim * anim);
// ??? EkrDragonUpdatePal_08065510
void NewEkrDragon(struct Anim * anim);
void EkrDragon_Preparefx(struct ProcEkrDragon * proc);
void EkrDragon_CustomBgFadeIn(struct ProcEkrDragon * proc);
void EkrDragon_080655A0(struct ProcEkrDragon * proc);
void EkrDragon_08065660(struct ProcEkrDragon * proc);
void EkrDragon_080656D8(struct ProcEkrDragon * proc);
void EkrDragon_0806574C(struct ProcEkrDragon * proc);
void EkrDragon_080657D4(struct ProcEkrDragon * proc);
void EkrDragon_080658F8(struct ProcEkrDragon * proc);
void EkrDragon_08065AB0(struct ProcEkrDragon * proc);
void EkrDragon_08065BA0(struct ProcEkrDragon * proc);
void EkrDragon_08065BC0(struct ProcEkrDragon * proc);
void EkrDragon_08065C14(struct ProcEkrDragon * proc);
void EkrDragon_08065C34(struct ProcEkrDragon * proc);
void EkrDragon_08065CC8(struct ProcEkrDragon * proc);
void EkrDragon_08065D20(struct ProcEkrDragon * proc);
void sub_08065D38(struct Anim * anim);
// ??? sub_08065D5C
// ??? sub_08065DC4
// ??? sub_08065DD0
// ??? sub_08065E38
// ??? sub_08065EA0
// ??? sub_08065EAC
// ??? sub_08065F0C
// ??? sub_08065F38
// ??? sub_08065F8C
// ??? sub_08065F98
// ??? sub_08065FEC
// ??? sub_08066030
// ??? sub_0806603C
// ??? sub_08066090
// ??? sub_0806609C
// ??? sub_080660C8
// ??? sub_080660F4
// ??? sub_08066118
// ??? sub_08066200
// ??? sub_08066224
// ??? sub_080662F4
// ??? nullsub_53
// ??? nullsub_54

extern u16 Pal_EkrDragon[0x10];
extern u16 Pal_EkrDragon_082E6C60[0x10];
extern u16 Pal_EkrDragon_082EB510[0x10];
