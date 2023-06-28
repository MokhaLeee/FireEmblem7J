#pragma once

#include "anime.h"

extern struct Anim *gAnims[4];

enum gEkrDistanceType_index {
    EKR_DISTANCE_CLOSE,
    EKR_DISTANCE_FAR,
    EKR_DISTANCE_FARFAR,
    EKR_DISTANCE_3,
    EKR_DISTANCE_PROMOTION
};

extern s16 gEkrDistanceType;

extern const void *gpImgSheet[2];
extern int gEkrDebugUnk2;
extern int gEkrDebugUnk3;
extern u32 gBanimDoneFlag[];
extern u8 gBanimRoundScripts[];
extern u8 gBanimScr_81DE208[];
extern int *gpBanimModesLeft;
extern int *gpBanimModesRight;
extern u8 gBanimScrLeft[];
extern u8 gBanimScrRight[];
extern int Unk_02017758;
extern int Unk_03004750;
extern int Unk_0203E088[2];

int GetAISSubjectId(struct Anim *anim);
int GetAISLayerId(struct Anim *anim);
void RegisterAISSheetGraphics(struct Anim *anim);
s16 GetSomeAnimIndex(struct Anim *anim);
void SwitchAISFrameDataFromBARoundType(struct Anim *anim, int);
void sub_080546F0(struct Anim *anim);
s16 GetBattleAnimRoundType(int index);
s16 GetSomeAISRelatedIndexMaybe(struct Anim *anim);
int sub_0804DD50(void);
int sub_08050FE4(void);
void sub_08050FF0(int);
void NewEfxSpecalEffect(struct Anim *anim);
struct Anim *GetCoreAIStruct(struct Anim *anim);
int EkrCheckHitOrMiss(s16);
void StartBattleAnimHitEffectsDefault(struct Anim *anim, int type);
void StartSpellAnimation(struct Anim *anim);
s16 sub_08055010(struct Anim *anim);
s16 sub_080684B0(struct Anim *anim);
s16 GetBattleAnimRoundTypeFlags(int);
void NewEfxChillEffect(struct Anim *anim);
void NewEfxPierceCritical(struct Anim *anim);
void NewEkrChienCHR(struct Anim *anim);
void NewEfxQuake(int type);
void NewEfxNormalEffect(struct Anim *anim);
void NewEfxYushaSpinShield(struct Anim *anim, int type);
void NewEfxHurtmutEff00(struct Anim *anim);
void NewEfxChillAnime(struct Anim *anim, int);
void NewEfxMagfcast(struct Anim *anim, int);
void NewEfxSunakemuri(struct Anim *anim, int);
void NewEfxKingPika(struct Anim *anim);
void NewEfxspdquake(struct Anim *anim);
void sub_08064458(struct Anim *anim);
void NewEfxMantBatabata(struct Anim *anim);
void NewEfxLokmsuna(struct Anim *anim);
void EfxPlaySEwithCmdCtrl(struct Anim *anim, int);
void NewEfxFlashFX(struct Anim *anim);
