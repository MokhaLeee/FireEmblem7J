#pragma once

/**
 * messed anim declarations
 */

#include "global.h"
#include "proc.h"
#include "unit.h"
#include "battle.h"
#include "anime.h"

#define EFX_BG_WIDTH 66
#define EFX_TILEMAP_LOC(aMap, aX, aY) (aMap + (aX) + EFX_BG_WIDTH * (aY))

enum ekr_battle_unit_position {
    EKR_POS_L,
    EKR_POS_R
};

extern struct Anim * gAnims[4];

enum gEkrDistanceType_index {
    EKR_DISTANCE_CLOSE,
    EKR_DISTANCE_FAR,
    EKR_DISTANCE_FARFAR,
    EKR_DISTANCE_MONOCOMBAT,
    EKR_DISTANCE_PROMOTION
};

enum AnimRoundData_type_identifier {
    ANIM_ROUND_HIT_CLOSE,
    ANIM_ROUND_CRIT_CLOSE,
    ANIM_ROUND_NONCRIT_FAR,
    ANIM_ROUND_CRIT_FAR,
    ANIM_ROUND_TAKING_MISS_CLOSE,
    ANIM_ROUND_TAKING_MISS_FAR,
    ANIM_ROUND_TAKING_HIT_CLOSE,
    ANIM_ROUND_STANDING,
    ANIM_ROUND_TAKING_HIT_FAR,
    ANIM_ROUND_MISS_CLOSE,
    ANIM_ROUND_MAX,

    ANIM_ROUND_INVALID = -1,
};

enum anim_round_type {
    ANIM_ROUND_BIT8 = 0x0100,
    ANIM_ROUND_PIERCE = 0x0200,
    ANIM_ROUND_GREAT_SHIELD = 0x0400,
    ANIM_ROUND_SURE_SHOT = 0x0800,
    ANIM_ROUND_SILENCER = 0x1000,
    ANIM_ROUND_POISON = 0x2000,
    ANIM_ROUND_BIT14 = 0x4000,
    ANIM_ROUND_DEVIL = 0x8000,    
};

enum banim_mode_index {
    BANIM_MODE_NORMAL_ATK,
    BANIM_MODE_NORMAL_ATK_PRIORITY_L,
    BANIM_MODE_CRIT_ATK,
    BANIM_MODE_CRIT_ATK_PRIORITY_L,
    BANIM_MODE_RANGED_ATK,
    BANIM_MODE_RANGED_CRIT_ATK,
    BANIM_MODE_CLOSE_DODGE,
    BANIM_MODE_RANGED_DODGE,
    BANIM_MODE_STANDING,
    BANIM_MODE_STANDING2,
    BANIM_MODE_RANGED_STANDING,
    BANIM_MODE_MISSED_ATK,

    BANIM_MODE_INVALID = -1,
};

extern s16 gEkrDistanceType;

struct BattleAnim {
    char abbr[12];
    int * modes;
    char * script;
    char * oam_r;
    char * oam_l;
    u16 * pal;
};

extern struct BattleAnim banim_data[];

struct BattleAnimCharaPal {
    char abbr[12];
    u16 * pal;
};

extern struct BattleAnimCharaPal character_battle_animation_palette_table[];

struct BattleAnimTerrain {
    char abbr[12];
    char * tileset;
    u16 * palette;
    int null_1; // useless, always 00
};

extern struct BattleAnimTerrain battle_terrain_table[];

struct BanimModeData {
    const u32 * unk0;
    const u32 * img;
    u32 unk2;
};

struct ProcEfx {
    PROC_HEADER;

    /* 29 */ u8 hitted;
    /* 2A */ u8 type;
    /* 2B */ STRUCT_PAD(0x2B, 0x2C);
    /* 2C */ s16 timer;
    /* 2E */ s16 step;
    /* 30 */ s16 unk30;
    /* 32 */ u16 unk32;
    /* 34 */ STRUCT_PAD(0x34, 0x44);
    /* 44 */ u32 unk44;
    /* 48 */ u32 unk48;
    /* 4C */ u32 frame;
    /* 50 */ u32 speed;
    /* 54 */ s16 * unk54;
    /* 58 */ s16 ** unk58;
    /* 5C */ struct Anim * anim;
    STRUCT_PAD(0x60, 0x64);
    ProcPtr unk_64;
};

struct ProcEfxBG {
    PROC_HEADER;

    /* 29 */ u8 unk29;

    STRUCT_PAD(0x2A, 0x2C);

    /* 2C */ s16 timer;
    /* 2E */ s16 terminator;
    /* 30 */ s16 unk30;
    /* 32 */ s16 unk32;
    /* 34 */ s16 unk34;

    STRUCT_PAD(0x36, 0x3C);

    /* 3C */ s16 unk3C;

    STRUCT_PAD(0x3E, 0x44);

    /* 44 */ u32 frame;
    /* 48 */ const u16 * frame_config;
    /* 4C */ u16 ** tsal;
    /* 50 */ u16 ** tsar;
    /* 54 */ u16 ** img;
    /* 58 */ u16 ** pal;
    /* 5C */ struct Anim * anim;
};

struct ProcEfxBGCOL {
    PROC_HEADER;

    STRUCT_PAD(0x29, 0x2C);

    /* 2C */ s16 timer;
    /* 2E */ s16 timer2;
    /* 30 */ s16 terminator;
    /* 32 */ s16 unk32;

    STRUCT_PAD(0x34, 0x44);

    /* 44 */ u32 frame;
    /* 48 */ const u16 * frame_config;
    /* 4C */ void * pal;

    STRUCT_PAD(0x50, 0x5C);

    /* 5C */ struct Anim * anim;
};

struct ProcEfxRST {
    PROC_HEADER;

    STRUCT_PAD(0x29, 0x2C);
    /* 2C */ s16 timer;
    /* 2E */ s16 duration;

    STRUCT_PAD(0x30, 0x5C);

    /* 5C */ struct Anim * anim;

    STRUCT_PAD(0x60, 0x64);

    /* 64 */ struct ProcEfx * efxproc;
};

struct ProcEfxOBJ {
    PROC_HEADER;

    /* 29 */ u8 unk29;
    /* 2A */ u8 unk2A;

    STRUCT_PAD(0x2B, 0x2C);

    /* 2C */ s16 timer;
    /* 2E */ s16 terminator;
    /* 30 */ u16 unk30;
    /* 32 */ u16 unk32;
    /* 34 */ u16 unk34;
    /* 36 */ u16 unk36;
    /* 38 */ u16 unk38;
    /* 3A */ u16 unk3A;
    /* 3C */ u16 unk3C;
    /* 3E */ u16 unk3E;
    /* 40 */ u16 unk40;
    /* 42 */ u16 unk42;
    /* 44 */ int unk44;
    /* 48 */ int unk48;
    /* 4C */ int unk4C;

    STRUCT_PAD(0x50, 0x5C);

    /* 5C */ struct Anim * anim;
    /* 60 */ struct Anim * anim2;
    /* 64 */ struct Anim * anim3;
    /* 68 */ struct Anim * anim4;
};

struct ProcEfxALPHA {
    PROC_HEADER;

    /* 29 */ u8 unk29;

    STRUCT_PAD(0x2A, 0x2C);

    /* 2C */ s16 timer;
    /* 2E */ s16 unk2E;
    /* 30 */ s16 unk30;

    STRUCT_PAD(0x32, 0x5C);

    /* 5C */ struct Anim * anim;
};

struct ProcEfxSCR {
    /* 00 */ PROC_HEADER;

    /* 29 */ STRUCT_PAD(0x29, 0x2C);

    /* 2C */ s16 timer;
    /* 2E */ s16 unk2E;
    /* 34 */ STRUCT_PAD(0x30, 0x44);
    /* 44 */ int unk44;
    /* 48 */ STRUCT_PAD(0x48, 0x5C);
    /* 5C */ struct ProcEfx * unk5C;
};

struct ProcEkrSubAnimeEmulator {
    PROC_HEADER;

    /* 29 */ u8 type;
    /* 2A */ u8 valid;
    /* 2C */ s16 timer;
    /* 2E */ s16 scr_cur;

    STRUCT_PAD(0x30, 0x32);

    /* 32 */ s16 x1;
    /* 34 */ s16 x2;

    STRUCT_PAD(0x36, 0x3A);

    /* 3A */ s16 y1;
    /* 3C */ s16 y2;

    STRUCT_PAD(0x3E, 0x44);

    /* 44 */ u32 * anim_scr;
    /* 48 */ void * sprite;
    /* 4C */ int oam2Base;
    /* 50 */ int oamBase;
};

extern u16 gEfxPal[];
extern const void * gpImgSheet[2];
extern int gEkrDebugUnk2;
extern int gAnimC01Blocking;
extern u32 gBanimDoneFlag[];
extern int * gpBanimModesLeft;
extern int * gpBanimModesRight;
extern u8 gBanimScrLeft[];
extern u8 gBanimScrRight[];
extern u16 gBanimPaletteLeft[0x50];
extern u16 gBanimPaletteRight[0x50];
extern u32 gBanimOaml[0x1600];
extern u32 gBanimOamr2[0x1600];
extern int Unk_02017758;
extern int Unk_03004750;
extern int Unk_0203E088[2];
extern s16 Unk_0203DFEC;
extern short gEkrPairHpInitial[2];
extern short gEfxPairHpBufOffset[];
extern u16 gEkrTsaBuffer[0x1000 / 2];
extern u16 gEfxFrameTmap[0x2520 / 2];
extern s16 gBanimUniquePal[2];
extern s16 gBanimFactionPal[2];
extern s16 gEkrSpellAnimIndex[2];
extern int gEkrBgPosition;
extern s16 gEkrXPosReal[2];
extern s16 gEkrYPosReal[2];
extern u16 gEkrXPosBase[2];
extern u16 gEkrYPosBase[2];
extern struct Vec2 gEkrBg0QuakeVec;
extern struct Vec2 gEkrBg2QuakeVec;
extern s16 gBanimValid[2];
extern int gEkrBg2ScrollFlip;
extern u16 * gpBg2ScrollOffsetStart;
extern u16 * gpBg2ScrollOffset;
extern u16 gpBg2ScrollOffsetTable1[];
extern u16 gpBg2ScrollOffsetTable2[];
extern int gEkrBg1ScrollFlip;
extern u16 * gpBg1ScrollOffsetStart;
extern u16 * gpBg1ScrollOffset;
extern u16 gpBg1ScrollOffsetList1[];
extern u16 gpBg1ScrollOffsetList2[];
extern s16 gBanimIdx[2];
extern struct BattleUnit * gpEkrBattleUnitLeft;
extern struct BattleUnit * gpEkrBattleUnitRight;
extern u16 * gpEfxUnitPaletteBackup[2];

/* EWRAM data */
extern struct Unit * gpEkrTriangleUnits[2];
extern u16 * gBanimTriAtkPalettes[2];
extern s16 gBanimUniquePaletteDisabled[2];

void NewEkrLvlupFan(void);
// ??? EkrLvupFanMain
// ??? sub_804C8F4
// ??? sub_804C944
void NewEkrGauge(void);
void EndEkrGauge(void);
void EkrGauge_0804CC28(void);
void EkrGauge_0804CC38(void);
void EkrGauge_0804CC48(void);
void EkrGauge_0804CC58(void);
void EkrGauge_0804CC68(u16 val);
void EkrGauge_0804CC78(s16 x, s16 y);
void EkrGauge_0804CC8C(s16 x, s16 y);
void EkrGauge_SetInitFlag(void);
void EkrGauge_ClrInitFlag(void);
// ??? EnableEkrGauge
// ??? DisableEkrGauge
// ??? sub_804CCE0
// ??? ekrGaugeMain
// ??? sub_804D13C
void NewEkrDispUP(void);
void EndEkrDispUP(void);
// ??? EkrDispUP_0804D584
// ??? EkrDispUP_0804D594
// ??? EkrDispUP_0804D5A4
// ??? EkrDispUP_0804D5B4
void EkrDispUP_SetPositionUnsync(u16 x, u16 y);
void EkrDispUP_SetPositionSync(u16 x, u16 y);
void SyncEkrDispUP(void);
void UnsyncEkrDispUP(void);
void AsyncEkrDispUP(void);
void UnAsyncEkrDispUP(void);
// ??? ekrDispUPMain
// ??? sub_804D738
// ??? sub_804D894
// ??? EfxPrepareScreenFx
// ??? sub_804DC18
// ??? EkrEfxStatusClear
int CheckEkrHitDone(void);
// ??? EkrEfxIsUnitHittedNow
// ??? NewEfxHPBar
// ??? sub_804DE4C
// ??? sub_804DF64
// ??? sub_804E004
// ??? sub_804E048
// ??? sub_804E128
// ??? sub_804E1E8
// ??? sub_804E28C
// ??? NewEfxAvoid
// ??? sub_804E458
// ??? sub_804E474
// ??? sub_804E54C
// ??? NewEfxNoDmage
// ??? sub_804E658
// ??? sub_804E6AC
// ??? sub_804E6D0
// ??? sub_804E7AC
// ??? sub_804E7D8
// ??? sub_804E7F4
// ??? sub_804E81C
// ??? sub_804E89C
// ??? sub_804E8CC
// ??? sub_804E944
// ??? sub_804E9A8
// ??? sub_804E9D0
// ??? sub_804EA10
// ??? sub_804EA54
// ??? sub_804EAC4
// ??? sub_804EAE8
// ??? sub_804EB48
// ??? sub_804EBC0
// ??? sub_804EC74
// ??? sub_804ED50
// ??? sub_804ED88
// ??? sub_804EDB8
// ??? sub_804EE24
// ??? sub_804EEB8
ProcPtr NewEfxQuakePure(int, int);
// ??? sub_804EF58
// ??? NewEfxHitQuakePure
// ??? nullsub_48
void NewEfxQuake(int type);
// ??? sub_804F0DC
// ??? NewEfxHitQuake
// ??? sub_804F464
void NewEfxFlashBgWhite(struct Anim * anim, int duartion);
void NewEfxFlashBgRed(struct Anim * anim, int duartion);
void NewEfxFlashBgBlack(struct Anim * anim, int duartion);
void NewEfxFlashBgDirectly(struct Anim * anim, int duartion);
// ??? EfxFlashBgMain
// ??? EfxFlashRestorePalSync
// ??? NewEfxWhiteOUT
// ??? EfxWhiteOutMain1
// ??? EfxWhiteOutMain2
// ??? EfxWhiteOutRestorePalSync
// ??? NewEfxFlashHPBar
// ??? EfxWhiteInMain1
// ??? sub_804FA30
// ??? sub_804FAC4
// ??? sub_804FB58
// ??? EndEfxHPBarColorChange
// ??? sub_804FC5C
// ??? EfxHpBarColorChange_804FC6C
// ??? sub_804FC7C
// ??? NewEfxFlashUnit
// ??? sub_804FDB0
// ??? sub_804FE1C

struct ProcEfxStatusUnit {
    PROC_HEADER;
    /* 29 */ u8 invalid;

    STRUCT_PAD(0x2A, 0x2C);

    /* 2C */ u16 timer;

    STRUCT_PAD(0x2E, 0x32);

    /* 32 */ s16 red;
    /* 34 */ s16 green;
    /* 36 */ s16 blue;

    STRUCT_PAD(0x38, 0x44);

    /* 44 */ u32 frame;
    /* 48 */ const u16 *frame_lut;
    /* 4C */ u32 debuff;
    /* 50 */ u32 debuf_bak;

    STRUCT_PAD(0x54, 0x5C);

    /* 54 */ u8 _pad_54[0x5C - 0x54];
    /* 5C */ struct Anim * anim;
};

extern struct ProcEfxStatusUnit * gpProcEfxStatusUnits[2];

void NewEfxStatusUnit(struct Anim * anim);
void EndEfxStatusUnits(struct Anim *anim);
void DisableEfxStatusUnits(struct Anim * anim);
void EnableEfxStatusUnits(struct Anim * anim);
void SetUnitEfxDebuff(struct Anim * anim, int debuff);
u32 GetUnitEfxDebuff(struct Anim * anim);
void EfxStatusUnitFlashing(struct Anim * anim, int, int, int);
void EfxStatusUnit_Loop(struct ProcEfxStatusUnit * proc);
// ??? sub_80501E4
void NewEfxWeaponIcon(s16 effective1, s16 effective2);
void EndProcEfxWeaponIcon(void);
void DisableEfxWeaponIcon(void);
void EnableEfxWeaponIcon(void);
// ??? sub_80502B0
// ??? sub_8050318
// ??? sub_8050348
// ??? sub_80503A0
// ??? sub_80503B8
// ??? sub_80503D4
// ??? sub_8050438
// ??? sub_8050478
// ??? sub_80504F8
// ??? sub_8050530
// ??? sub_8050548
// ??? sub_8050560
// ??? sub_805057C
// ??? sub_8050604
// ??? sub_8050654
// ??? sub_80506E0
// ??? sub_805073C
void SpellFx_Begin(void);
void SpellFx_Finish(void);
void SpellFx_SetBG1Position(void);
void SpellFx_ClearBG1(void);
void SpellFx_SetSomeColorEffect(void);
void SpellFx_ClearColorEffects(void);
void StartBattleAnimHitEffectsDefault(struct Anim * anim, int type);
// ??? sub_805092C
void StartBattleAnimHitEffects(struct Anim * anim, int type);
void StartBattleAnimResireHitEffects(struct Anim * anim, int type);
void StartBattleAnimStatusChgHitEffects(struct Anim * anim, int type);
struct Anim * EfxCreateFrontAnim(struct Anim * anim, const AnimScr * scr1, const AnimScr * scr2, const AnimScr * scr3, const AnimScr * scr4);
struct Anim * EfxCreateBackAnim(struct Anim * anim, const AnimScr * scr1, const AnimScr *scr2, const AnimScr * scr3, const AnimScr * scr4);
void SpellFx_WriteBgMap(struct Anim * anim, const u16 * src1, const u16 * src2);
// ??? sub_8050D38
void SpellFx_RegisterObjGfx(const void * img, u32 size);
void SpellFx_RegisterObjPal(const u16 * pal, u32 size);
void SpellFx_RegisterBgGfx(const void * img, u32 size);
void SpellFx_RegisterBgPal(const u16 * pal, u32 size);
// ??? sub_8050E2C
// ??? sub_8050E58
// ??? sub_8050E88
s16 EfxAdvanceFrameLut(s16 *ptime, s16 *pcount, const s16 lut[]);
// ??? sub_8050F48
int EfxGetCamMovDuration(void);
// ??? sub_8050F74
void EfxTmFill(u32 val);
void SetEkrFrontAnimPostion(int pos, s16 x, s16 y);
int sub_8050FE4(void);
void sub_8050FF0(int);
void NewEfxspdquake(struct Anim * anim);
// ??? sub_8051020
// ??? sub_80510F4
bool SetupBanim(void);
void BeginAnimsOnBattleAnimations(void);
// ??? EkrBattleEndRountine
// ??? sub_8051214
// ??? sub_8051288
// ??? sub_805129C
// ??? sub_80513B0
// ??? sub_80514B8
// ??? sub_8051558
// ??? sub_80515A0
// ??? sub_80515DC
// ??? sub_8051630
// ??? sub_8051690
// ??? sub_80516A8
// ??? sub_8051720
// ??? sub_8051774
// ??? sub_80517D0
// ??? sub_8051830
// ??? sub_80518BC
// ??? sub_805194C
// ??? sub_8051A38
// ??? sub_8051A50
// ??? sub_8051E28
void NewEkrUnitKakudai(int identifier);
// ??? UnitKakudai1
// ??? UnitKakudai2
// ??? sub_805226C
void NewEkrWindowAppear(int identifier, int);
bool CheckEkrWindowAppearUnexist(void);
// ??? sub_80522DC
void NewEkrNamewinAppear(int identifier, int duration, int delay);
// ??? sub_80523AC
// ??? sub_80523C0
// ??? sub_80523E0
// ??? sub_805245C
// ??? sub_80524A4
// ??? sub_80524B8
bool PrepareBattleGraphicsMaybe(void);
u16 GetBattleAnimationId_WithUnique(struct Unit * unit, const struct BattleAnimDef * pBattleAnimDef, u16, int * out);
// ??? GetBanimTerrainGround
// ??? sub_8053218
// ??? sub_80532F0
// ??? sub_8053438
void ParseBattleHitToBanimCmd(void);
bool CheckBattleHasHit(void);
s16 GetBattleAnimCharacterUniquePalIndex(struct Unit * unit, int index);
u16 * FilterBattleAnimCharacterPalette(s16 index, u16 item);
int GetAllegienceId(u32 arg);
void EkrPrepareBanimfx(struct Anim * anim, u16 index);
s16 GetBattleAnimRoundType(int index);
s16 GetBattleAnimRoundTypeFlags(int);
s16 GetEfxHp(int index);
s16 GetEfxHpModMaybe(int index);
u16 IsItemDisplayedInBattle(u16 item);
u16 IsWeaponLegency(u16 item);
bool EkrCheckAttackRound(u16 round);
void SetBattleScriptted(void);
void SetBattleUnscriptted(void);
bool CheckBattleScriptted(void);
void BattleAIS_ExecCommands(void);
void AnimScrAdvance(struct Anim * anim);

struct ProcEkrChienCHR {
    PROC_HEADER;
    STRUCT_PAD(0x29, 0x5C);

    /* 5C */ struct Anim * anim;
};

void NewEkrChienCHR(struct Anim * anim);
void EkrChienCHRMain(struct ProcEkrChienCHR * proc);

void RegisterAISSheetGraphics(struct Anim * anim);
void ApplyBanimUniquePalette(u32 * buf, int pos);
int GetBanimPalette(int banim_id, int pos);
void UpdateBanimFrame(void);
void InitMainAnims(void);
void InitBattleAnimFrame(int round_type_left, int round_type_right);
void InitLeftAnim(int);
void InitRightAnim(int);
void SwitchAISFrameDataFromBARoundType(struct Anim * anim, int);
int GetAISLayerId(struct Anim * anim);
int GetAnimPosition(struct Anim * anim);
int CheckRoundMiss(s16 type);
int CheckRound1(s16 type);
int CheckRound2(s16 type);
int CheckRoundCrit(struct Anim * anim);
struct Anim * GetAnimAnotherSide(struct Anim * anim);
s16 GetAnimRoundType(struct Anim * anim);
s16 GetAnimNextRoundType(struct Anim * anim);
s16 GetAnimRoundTypeAnotherSide(struct Anim * anim);
s16 GetAnimNextRoundTypeAnotherSide(struct Anim * anim);
void SetAnimStateHidden(int pos);
void SetAnimStateUnHidden(int pos);
// ??? sub_80550B4
// ??? sub_8055250
// ??? sub_8055274
// ??? InitMainMiniAnim

/* ekrmainmini */
struct BanimUnkStructComm {
    /* 00 */ s16 unk00; // terrain L
    /* 02 */ s16 unk02; // pal ID L
    /* 04 */ s16 unk04; // chr L
    /* 06 */ s16 unk06; // terrain R
    /* 08 */ s16 unk08; // pal ID R
    /* 0A */ s16 unk0A; // chr R
    /* 0C */ s16 unk0C;
    /* 0E */ s16 unk0E;
    /* 10 */ u16 unk10;
    /* 14 */ ProcPtr proc14; // sub emulator proc a
    /* 18 */ ProcPtr proc18; // sub emulator proc b
    /* 1C */ void * unk1C;
    /* 20 */ void * unk20;
    /* 24 */ void * unk24;
};

struct AnimMagicFxBuffer
{
    /* 00 */ u16 magic_func_idx;
    /* 02 */ u16 x_offset_bg;
    /* 04 */ u16 y_offset_bg;
    /* 06 */ u16 x_offset_obj;
    /* 08 */ u16 y_offset_obj;
    /* 0A */ u16 bg_chr;
    /* 0C */ u16 bg_pal_id;
    /* 0E */ u16 obj_chr;
    /* 10 */ u16 obj_pal_id;
    /* 12 */ u16 bg;
    /* 14 */ u16 * bg_tm_buf;
    /* 18 */ void * bg_img_buf;
    /* 1C */ void * bg_tsa_buf;
    /* 20 */ void * obj_img_buf;
    /* 24 */ void (*reset_callback)(void);
};

struct AnimBuffer {
    /* 00 */ u8 unk_00;
    /* 01 */ u8 genericPalId;
    /* 02 */ u16 xPos;
    /* 04 */ u16 yPos;
    /* 06 */ s16 animId;
    /* 08 */ s16 charPalId;
    /* 0A */ u16 roundType;
    /* 0C */ u16 state2;
    /* 0E */ u16 oam2Tile;
    /* 10 */ u16 oam2Pal;
    /* 14 */ struct Anim * anim1;
    /* 18 */ struct Anim * anim2;
    /* 1C */ void * pImgSheetBuf;
    /* 20 */ void * unk_20; // pal
    /* 24 */ void * unk_24; // rtlOam
    /* 28 */ void * unk_28; // frameData
    /* 2C */ const void * unk_2C; // sheetPointer
    /* 30 */ void * unk_30; // magicEffects
    /* 34 */ void * unk_34; // ProcPtr; Procs_ekrUnitMainMini
};

extern struct BanimUnkStructComm EkrMainMiniConf_0201FAD0;

void sub_8055474(struct AnimBuffer *);
// ??? sub_80555E8
void sub_80555F8(struct AnimBuffer *, s16, s16);
// ??? sub_8055614
// ??? sub_8055624
void sub_8055644(struct AnimBuffer *);
// ??? sub_8055658
void sub_8055670(void);
void EndEfxAnimeDrvProc(void);
// ??? sub_80556A4
void NewEkrUnitMainMini(struct AnimBuffer *);
void sub_80556D8(struct AnimBuffer *);
// ??? sub_80556FC
void sub_8055718(struct BanimUnkStructComm * conf); // FE8U: void sub_805AA68(struct BanimUnkStructComm * buf)
// ??? sub_8055AC4
// ??? sub_8055AF0
// ??? sub_8055B08
// ??? sub_8055C50
// ??? sub_8055CCC
// ??? GetBattleAnimArenaFlag
// ??? sub_8055CE4
// ??? sub_8055D2C
// ??? sub_8055D44
// ??? sub_8055D58
// ??? sub_8055D7C
// ??? sub_8055D94
// ??? sub_8055DA8
// ??? sub_8055E30
// ??? sub_8055EA4
// ??? sub_8055F08
// ??? sub_8055F1C
// ??? sub_8055F34
// ??? sub_8055F60
// ??? sub_8055FC4
// ??? sub_8055FF0
// ??? sub_8056024
// ??? sub_8056038
void StartSpellAnimation(struct Anim * anim);
// ??? nullsub_49
// ??? NewefxRestRST
// ??? sub_80560E8
// ??? efxRestRSTMain
// ??? NewEfxTwobaiRST
// ??? EfxTwobaiRSTMain
// ??? NewDummvRST
// ??? sub_8056228
// ??? DummvRSTMain
// ??? NewEfxRestWIN
// ??? EfxRestWINMain
// ??? sub_80563C8
// ??? sub_80563F0
// ??? sub_8056418
// ??? sub_8056454
// ??? sub_8056490
// ??? NewEfxRestWINH
void NewEfxRestWINH_(struct Anim *anim, int a, int b);
// ??? sub_805660C
// ??? sub_8056618
void NewEfxALPHA(struct Anim * anim, int a, int b, int c, int d, int e);
// ??? sub_8056738
// ??? sub_805683C
// ??? sub_805689C
void StartSpellThing_MagicQuake(struct Anim *, int, int);
// ??? Loop6C_efxMagicQUAKE
// ??? sub_8056BC8
// ??? sub_8056BEC
// ??? sub_8056C40
// ??? sub_8056C78
// ??? sub_8056D14
// ??? sub_8056DB8
// ??? sub_8056E10
// ??? sub_8056E38
// ??? sub_8056EBC
// ??? sub_8056EFC
// ??? sub_8056F40
// ??? sub_8056F50
// ??? sub_8056F98
// ??? sub_8056FD0
// ??? sub_8057088
// ??? sub_80570F0
// ??? sub_8057120
// ??? sub_805717C
// ??? sub_80571D8
// ??? sub_8057234
// ??? sub_8057290
// ??? sub_80572EC
// ??? sub_8057348
// ??? sub_80573A4
// ??? sub_8057400
// ??? sub_805745C
// ??? sub_80574B8
// ??? sub_8057514
// ??? sub_80575BC
// ??? sub_8057634
// ??? sub_8057664
// ??? sub_805769C
// ??? sub_80577AC
// ??? sub_805780C
// ??? sub_8057888
// ??? sub_80578F0
// ??? sub_8057924
// ??? sub_805795C
// ??? sub_8057A6C
// ??? sub_8057ABC
// ??? sub_8057B7C
// ??? sub_8057BF4
// ??? sub_8057C24
// ??? sub_8057C60
// ??? sub_8057CFC
// ??? sub_8057DBC
// ??? sub_8057DF0
// ??? sub_8057E34
// ??? sub_8057EFC
// ??? sub_8057F38
// ??? sub_8057F84
// ??? sub_8057FC0
// ??? sub_805807C
// ??? sub_80580EC
// ??? sub_8058120
// ??? sub_8058158
// ??? sub_8058208
// ??? sub_80582B8
// ??? sub_8058318
// ??? sub_805836C
// ??? sub_80583A0
// ??? sub_80583DC
// ??? sub_805843C
// ??? sub_8058478
// ??? sub_80584F8
// ??? sub_805856C
// ??? sub_8058584
// ??? sub_80585BC
// ??? sub_8058648
// ??? sub_8058698
// ??? sub_80586F0
// ??? sub_805872C
// ??? sub_8058778
// ??? sub_80587F8
// ??? sub_805882C
// ??? sub_8058868
// ??? sub_8058908
// ??? sub_805898C
// ??? sub_8058A10
// ??? sub_8058A4C
// ??? sub_8058A98
// ??? sub_8058AF8
// ??? sub_8058B28
// ??? sub_8058B6C
// ??? sub_8058BB0
// ??? sub_8058CB8
// ??? sub_8058D18
// ??? sub_8058D70
// ??? sub_8058DFC
// ??? sub_8058E44
// ??? sub_8058EC8
// ??? sub_8058F2C
// ??? sub_8058FC4
// ??? sub_8058FF8
// ??? sub_805903C
// ??? sub_8059084
// ??? sub_8059108
// ??? sub_8059138
// ??? sub_8059174
// ??? sub_80592AC
// ??? sub_8059330
// ??? sub_8059394
// ??? sub_8059418
// ??? sub_805947C
// ??? sub_80594E0
// ??? sub_8059510
// ??? sub_805955C
// ??? sub_8059588
// ??? sub_80596E0
// ??? sub_805979C
// ??? sub_80597D8
// ??? sub_8059898
// ??? sub_80598EC
// ??? sub_8059948
// ??? sub_805996C
// ??? sub_80599B0
// ??? sub_80599D4
// ??? sub_80599F8
// ??? sub_8059A2C
// ??? sub_8059A90
// ??? sub_8059B08
// ??? sub_8059B4C
// ??? sub_8059BAC
// ??? nullsub_50
// ??? sub_8059BF4
// ??? sub_8059C30
// ??? sub_8059D20
// ??? sub_8059DD0
// ??? sub_8059E80
// ??? sub_8059EE4
// ??? sub_8059F28
// ??? sub_8059F74
// ??? sub_8059F8C
// ??? sub_8059FC8
// ??? sub_805A004
// ??? sub_805A040
// ??? sub_805A06C
// ??? sub_805A090
// ??? sub_805A0CC
// ??? sub_805A210
// ??? sub_805A29C
// ??? sub_805A33C
// ??? sub_805A3C0
// ??? sub_805A45C
// ??? sub_805A4C8
// ??? sub_805A530
// ??? sub_805A594
// ??? sub_805A5C4
// ??? sub_805A60C
// ??? sub_805A648
// ??? sub_805A700
// ??? sub_805A780
// ??? sub_805A838
// ??? sub_805A87C
// ??? sub_805A8B8
// ??? sub_805A9E8
// ??? sub_805AA38
// ??? sub_805AAB4
// ??? sub_805AAE8
// ??? sub_805AB54
// ??? sub_805ABC0
// ??? sub_805ABD8
// ??? sub_805AC14
// ??? sub_805AE14
// ??? sub_805AE68
// ??? sub_805AEE0
// ??? sub_805AF28
// ??? sub_805AF74
// ??? sub_805AFC8
// ??? sub_805B04C
// ??? sub_805B09C
// ??? sub_805B110
// ??? sub_805B210
// ??? sub_805B264
// ??? sub_805B2C0
// ??? sub_805B32C
// ??? sub_805B384
// ??? sub_805B404
// ??? sub_805B52C
// ??? sub_805B5D8
// ??? sub_805B610
// ??? sub_805B678
// ??? sub_805B6B4
// ??? sub_805B7A4
// ??? sub_805B828
// ??? sub_805B8AC
// ??? sub_805B930
// ??? sub_805B9D4
// ??? sub_805BA48
// ??? sub_805BA78
// ??? sub_805BAB4
// ??? sub_805BC20
// ??? sub_805BCB8
// ??? sub_805BD1C
// ??? sub_805BD74
// ??? sub_805BE48
// ??? sub_805BE90
// ??? sub_805BEDC
// ??? sub_805BF2C
// ??? sub_805BF80
// ??? sub_805C064
// ??? sub_805C0DC
// ??? sub_805C18C
// ??? sub_805C230
// ??? sub_805C260
// ??? sub_805C2B4
// ??? sub_805C35C
// ??? nullsub_51
// ??? sub_805C3D8
// ??? sub_805C414
// ??? sub_805C5B4
// ??? sub_805C624
// ??? sub_805C6A8
// ??? sub_805C700
// ??? sub_805C77C
// ??? sub_805C7F8
// ??? sub_805C810
// ??? sub_805C86C
// ??? sub_805C8C8
// ??? sub_805C924
// ??? sub_805C96C
// ??? sub_805C9CC
// ??? sub_805CA20
// ??? sub_805CA38
// ??? sub_805CA74
// ??? sub_805CC58
// ??? sub_805CCE8
// ??? sub_805CD04
// ??? sub_805CD34
// ??? sub_805CD7C
// ??? sub_805CD8C
// ??? sub_805CDCC
// ??? sub_805CE2C
// ??? sub_805CE60
// ??? sub_805CEF0
// ??? sub_805CF78
// ??? sub_805D044
// ??? sub_805D08C
// ??? sub_805D0D8
// ??? sub_805D158
// ??? sub_805D1D8
// ??? sub_805D200
// ??? sub_805D328
// ??? sub_805D350
// ??? sub_805D4CC
// ??? sub_805D4F4
// ??? sub_805D670
// ??? sub_805D698
// ??? sub_805D824
// ??? sub_805D8E0
// ??? sub_805D994
// ??? sub_805DA04
// ??? sub_805DA74
// ??? sub_805DAE4
// ??? sub_805DB2C
// ??? sub_805DB68
// ??? sub_805DB84
// ??? sub_805DC18
// ??? sub_805DC78
// ??? sub_805DCDC
// ??? sub_805DD10
// ??? sub_805DD44
// ??? sub_805DD78
// ??? sub_805DDC0
// ??? sub_805DE8C
// ??? sub_805DEC0
// ??? sub_805DEF0
// ??? sub_805DF20
// ??? sub_805DFF4
// ??? sub_805E044
// ??? sub_805E0C4
// ??? sub_805E110
// ??? sub_805E158
// ??? sub_805E23C
// ??? sub_805E31C
// ??? sub_805E368
// ??? sub_805E3B0
// ??? sub_805E3EC
// ??? sub_805E510
// ??? sub_805E564
// ??? sub_805E5C8
// ??? sub_805E640
// ??? sub_805E650
// ??? sub_805E68C
// ??? sub_805E794
// ??? sub_805E820
// ??? sub_805E878
// ??? sub_805E8D0
// ??? sub_805E8E8
// ??? sub_805E924
// ??? sub_805EA24
// ??? sub_805EAB0
// ??? sub_805EB08
// ??? sub_805EB60
// ??? sub_805EBA4
// ??? sub_805EBB4
// ??? sub_805EBD8
// ??? sub_805EBF8
// ??? sub_805EC08
// ??? sub_805EC44
// ??? sub_805ED64
// ??? sub_805EDB8
// ??? sub_805EE1C
// ??? sub_805EE74
// ??? sub_805EE84
// ??? sub_805EEC0
// ??? sub_805EFA0
// ??? sub_805F0C0
// ??? sub_805F124
// ??? sub_805F150
// ??? sub_805F1B4
// ??? sub_805F1C4
// ??? sub_805F21C
// ??? sub_805F234
// ??? sub_805F270
// ??? sub_805F2AC
// ??? sub_805F2E8
// ??? sub_805F324
// ??? sub_805F360
// ??? sub_805F39C
// ??? sub_805F3D8
// ??? sub_805F414
// ??? sub_805F450
// ??? sub_805F48C
// ??? sub_805F4C8
// ??? sub_805F594
// ??? sub_805F5F0
// ??? sub_805F648
// ??? sub_805F6A0
// ??? sub_805F6E0
// ??? sub_805F6F8
// ??? sub_805F734
// ??? sub_805F808
// ??? sub_805F860
// ??? sub_805F8C4
// ??? sub_805F950
// ??? sub_805F9E4
// ??? sub_805FA28
// ??? sub_805FA70
// ??? sub_805FAB8
// ??? sub_805FB64
// ??? sub_805FBBC
// ??? sub_805FBE8
// ??? sub_805FC24
// ??? sub_805FE20
// ??? sub_805FE7C
// ??? sub_805FED4
// ??? sub_805FEF4
// ??? sub_805FFB0
// ??? sub_805FFD0
// ??? sub_8060014
// ??? sub_8060108
// ??? sub_8060124
// ??? sub_8060150
// ??? sub_8060198
// ??? sub_80601A8
// ??? sub_80601E8
// ??? sub_806026C
// ??? sub_80602D0
// ??? sub_806030C
// ??? sub_806037C
// ??? sub_8060414
// ??? sub_8060494
// ??? sub_806052C
// ??? sub_806055C
// ??? sub_80605A4
// ??? sub_80605E0
// ??? sub_8060730
// ??? sub_806079C
// ??? sub_80607B8
// ??? sub_806084C
// ??? sub_8060898
// ??? sub_80608B8
// ??? sub_80608FC
// ??? sub_806090C
// ??? sub_8060948
// ??? sub_806096C
// ??? sub_8060A1C
// ??? sub_8060A3C
// ??? sub_8060A80
// ??? sub_8060B64
// ??? sub_8060B80
// ??? sub_8060BA0
// ??? sub_8060BE4
// ??? sub_8060C2C
// ??? sub_8060D10
// ??? sub_8060D2C
// ??? sub_8060D4C
// ??? sub_8060D90
// ??? sub_8060DD8
// ??? sub_8060E44
// ??? sub_8060E70
// ??? sub_8060EAC
// ??? sub_8061094
// ??? sub_8061128
// ??? sub_80611CC
// ??? sub_8061274
// ??? sub_8061290
// ??? sub_80612D4
// ??? sub_806137C
// ??? sub_8061398
// ??? sub_80613B8
// ??? sub_8061400
// ??? sub_8061448
// ??? sub_80614B0
// ??? sub_80614E4
// ??? sub_8061558
// ??? sub_8061570
// ??? sub_806158C
// ??? sub_80615A8
// ??? sub_80615C4
// ??? sub_8061600
// ??? sub_8061758
// ??? sub_80617EC
// ??? sub_8061880
// ??? sub_8061914
// ??? sub_806196C
// ??? sub_8061A50
// ??? sub_8061A6C
// ??? sub_8061A8C
// ??? sub_8061AD4
// ??? sub_8061B1C
// ??? sub_8061B7C
// ??? sub_8061BE0
// ??? sub_8061C1C
// ??? sub_8061D84
// ??? sub_8061DE8
// ??? sub_8061E40
// ??? sub_8061EE8
// ??? sub_8061F04
// ??? sub_8061F48
// ??? sub_8061FC4
// ??? sub_8062028
// ??? sub_806205C
// ??? sub_8062094
// ??? sub_80620FC
// ??? sub_806221C
// ??? sub_8062350
// ??? sub_806238C
// ??? sub_806250C
// ??? sub_8062558
// ??? sub_80625D0
// ??? sub_8062640
// ??? sub_8062658
// ??? sub_80626BC
// ??? sub_80626D4
// ??? sub_80626F0
// ??? sub_8062748
// ??? sub_80627C4
// ??? sub_8062824
// ??? sub_80628F0
// ??? sub_8062940
// ??? sub_80629CC
// ??? sub_8062A2C
// ??? sub_8062A3C
// ??? sub_8062A9C
// ??? sub_8062AAC
// ??? sub_8062AE8
// ??? sub_8062B24
// ??? sub_8062B60
// ??? sub_8062B9C
// ??? sub_8062C68
// ??? sub_8062C9C
// ??? sub_8062CC8
// ??? sub_8062D38
void NewEfxPierceCritical(struct Anim * anim);
// ??? sub_8062D88
// ??? sub_8062DB8
// ??? sub_8062E08
// ??? sub_8062E30
// ??? sub_8062E60
void NewEfxNormalEffect(struct Anim * anim);
// ??? sub_8062EBC
// ??? sub_8062EFC
// ??? sub_8062F88
void NewEfxYushaSpinShield(struct Anim * anim, int type);
// ??? sub_8063008
// ??? sub_8063014
// ??? sub_8063094
// ??? sub_80630FC
// ??? sub_8063124
// ??? sub_8063188
void NewEfxHurtmutEff00(struct Anim * anim);
// ??? sub_80631F4
// ??? sub_8063200
// ??? sub_8063244
// ??? sub_8063290
// ??? sub_80632DC
// ??? sub_8063300
// ??? sub_8063344
// ??? sub_8063390
// ??? sub_80633DC
void NewEfxMagfcast(struct Anim * anim, int);
// ??? sub_8063460
// ??? sub_806347C
// ??? sub_806355C
void NewEfxSunakemuri(struct Anim * anim, int);
// ??? sub_80635E4
// ??? sub_80635F0
// ??? sub_80637D4
void NewEfxLokmsuna(struct Anim * anim);
// ??? sub_8063830
// ??? sub_806383C
// ??? sub_80638C0
void NewEfxKingPika(struct Anim * anim);
// ??? sub_806390C
void NewEfxFlashFX(struct Anim * anim);
// ??? sub_8063998
// ??? sub_80639F8
// ??? sub_8063A6C
// ??? sub_8063ABC
// ??? sub_8063B30
void NewEfxSpecalEffect(struct Anim *anim);
// ??? sub_8063C14
// ??? sub_8063C20
// ??? sub_8063C40
// ??? sub_8063CB0
// ??? sub_8063CFC
// ??? sub_8063D24
// ??? sub_8063D44
// ??? sub_8063DC8
// ??? sub_8063DE8
// ??? sub_8063E2C
// ??? sub_8063E4C
// ??? sub_8063E94
// ??? sub_8063F30
void NewEfxMantBatabata(struct Anim *anim);
// ??? sub_8064140
// ??? sub_806416C
void NewEfxChillEffect(struct Anim *anim);
// ??? sub_80641D0
// ??? sub_8064214
// ??? sub_806426C
// ??? sub_80642C4
// ??? sub_80642F4
void NewEfxChillAnime(struct Anim * anim, int);
// ??? sub_80643DC

struct ProcEfxDrsmmoyaBG {
    PROC_HEADER;

    STRUCT_PAD(0x29, 0x2C);

    /* 2C */ s16 timer;

    STRUCT_PAD(0x2E, 0x44);

    /* 44 */ u32 frame;
    /* 48 */ const u16 * frame_config;
    /* 4C */ u16 ** tsal;
    /* 50 */ u16 ** tsar;
    /* 54 */ u16 ** img;
    /* 58 */ u16 * img_bak;
    /* 5C */ struct Anim * anim;
};

struct ProcEfxDrsmmoyaScroll {
    PROC_HEADER;

    STRUCT_PAD(0x29, 0x2C);

    /* 2C */ s16 timer;
    /* 2E */ s16 step;

    STRUCT_PAD(0x30, 0x44);

    /* 44 */ int duration;
    /* 48 */ int speed;

    STRUCT_PAD(0x4C, 0x5C);

    /* 5C */ struct Anim * anim;
};

struct ProcEfxDrsmmoyaScrollCOL {
    PROC_HEADER;

    STRUCT_PAD(0x29, 0x2C);

    /* 2C */ s16 timer;

    STRUCT_PAD(0x2E, 0x44);

    /* 44 */ int duration1;
    /* 48 */ int duration2;
    /* 4C */ int duration3;

    STRUCT_PAD(0x50, 0x5C);

    /* 5C */ struct Anim * anim;

    STRUCT_PAD(0x60, 0x64);

    /* 64 */ struct ProcEfxDrsmmoyaScroll * procefx;
};

void NewEfxDrsmmoya(struct Anim * anim);
void EfxDrsmmoya_Loop(struct ProcEfx * proc);
void NewEfxDrsmmoyaBG(struct Anim * anim);
void EfxDrsmmoyaBG_Loop(struct ProcEfxDrsmmoyaBG * proc);
ProcPtr NewEfxDrsmmoyaScroll(struct Anim * anim, int type);
void EfxDrsmmoyaScroll_Loop(struct ProcEfxDrsmmoyaScroll * proc);
void NewEfxDrsmmoyaScrollCOL(struct Anim * anim, struct ProcEfxDrsmmoyaScroll * procefx, int duration1, int duration2, int duration3);
void EfxDrsmmoyaScrollCOL_Loop1(struct ProcEfxDrsmmoyaScrollCOL * proc);
void EfxDrsmmoyaScrollCOL_Delay(struct ProcEfxDrsmmoyaScrollCOL * proc);
void EfxDrsmmoyaScrollCOL_Loop3(struct ProcEfxDrsmmoyaScrollCOL * proc);
void sub_80647C8(void);
// ??? sub_80647DC
// ??? sub_80647F8
// ??? sub_8064814
// ??? sub_8064820
// ??? sub_806482C
// ??? sub_8064834
// ??? sub_806488C
// ??? sub_80648BC
// ??? sub_8064910
// ??? sub_806497C
// ??? sub_80649AC
// ??? sub_80649D4
// ??? sub_8064A04
// ??? sub_8064A2C
// ??? nullsub_52
// ??? sub_8064A54
// ??? sub_8064A74
// ??? sub_8064A94
// ??? sub_8064AD0
// ??? sub_8064AF4
// ??? sub_8064B40
// ??? sub_8064BC0
// ??? sub_8064BE4
// ??? sub_8064C04
// ??? sub_8064C2C
// ??? sub_8064C88
// ??? sub_8064D0C
// ??? sub_8064D40
// ??? sub_8064D80
// ??? sub_8064DFC
// ??? sub_8064E20
// ??? sub_8064E3C
// ??? sub_8064EB0
// ??? sub_8064F04
// ??? sub_8064F50
// ??? sub_8064F84
// ??? sub_8064FC4
// ??? sub_8064FF4
// ??? sub_8065010
// ??? sub_8065094
// ??? sub_80650F8
// ??? sub_8065120
// ??? sub_8065140
// ??? sub_8065158
// ??? sub_80651B0

/* banim_ekrdragon.h */

/* efxutils */
void sub_8067128(u16 * tm, u16 width, u16 height, int pal, int chr);
void FillBGRect(u16 * tm, u16 width, u16 height, int pal, int chr);
void sub_80671E0(u16 * tm, u16 width, u16 height, int pal, int chr);
void EfxTmModifyPal(u16 * tm, u16 width, u16 height);
void EfxTmCpyBG(const void * ptr1, void * ptr2, u16 width, u16 height, int pal, int chr);
void EfxTmCpyBgHFlip(const u16 * tsa, u16 * tm, u16 width, u16 height, int pal, int chr);
void EfxTmCpyExt(const u16 * src, s16 src_width, u16 * dst, s16 dst_width, u16 width, u16 hight, int pal, int chr);
void EfxTmCpyExtHFlip(const u16 * src, s16 src_width, u16 * dst, s16 dst_width, u16 width, u16 hight, int pal, int chr);
void sub_806748C(u16 * tm, int arg1, int arg2);
void EkrModifyBarfx(u16 * tm, int arg);
bool EkrPalModifyUnused(u16 * pal_start, u16 * pal_end, u16 * dst, u16 amount, u16 start, u16 end);
void EfxPalBlackInOut(u16 * pal_buf, int line, int length, int ref);
void EfxPalWhiteInOut(u16 * pal_buf, int line, int length, int ref);
void EfxPalFlashingInOut(u16 * pal_buf, int line, int length, int r0, int g0, int b0);
void EfxPalModifyPetrifyEffect(u16 * pal_buf, int line, int length);
void EfxSplitColor(u16 * pal, u8 * dst, u32 length);
void EfxSplitColorPetrify(u16 * src, u8 * dst, u32 length);
void sub_8067998(s8 * src1, s8 * src2, u16 * pal, u32 length, int ref);
void EfxDecodeSplitedPalette(u16 * dst, s8 * src1, s8 * src2, s16 * src3, u32 length, int ref, int unk);
void EfxChapterMapFadeOUT(int speed);
int sub_8067AD4(int a);
struct ProcEkrSubAnimeEmulator * NewEkrsubAnimeEmulator(int x, int y, u32 * anim_scr, int type, int oam2Base, int oamBase, ProcPtr parent);
void EkrsubAnimeEmulatorMain(struct ProcEkrSubAnimeEmulator * proc);
int GetAnimSpriteRotScaleX(u32 header);
int GetAnimSpriteRotScaleY(u32 header);
void BanimUpdateSpriteRotScale(void * src, struct AnimSpriteData * out, s16 x, s16 y, int unused);

/* efxsound */
struct ProcEfxSoundSE {
    PROC_HEADER;

    STRUCT_PAD(0x29, 0x2C);

    /* 2C */ s16 timer;

    STRUCT_PAD(0x2E, 0x44);

    /* 44 */ int volume;
    /* 48 */ int index;
};

void EfxPlaySE(int songid, int volume);
void Loop6C_efxSoundSE(struct ProcEfxSoundSE * proc);
// ??? DoM4aSongNumStop
// ??? EfxOverrideBgm
// ??? StopBGM1
// ??? UnregisterEfxSoundSeExist
// ??? RegisterEfxSoundSeExist
// ??? CheckEfxSoundSeExist
// ??? M4aPlayWithPostionCtrl
void EfxPlaySEwithCmdCtrl(struct Anim * anim, int);
// ??? GetEfxSoundType1FromTerrain
// ??? IsAnimSoundInPositionMaybe
// ??? GetEfxSoundType2FromBaseCon
s16 sub_80684B0(struct Anim * anim);
// ??? EfxPlayHittedSFX
// ??? EfxPlayCriticalHittedSFX
// ??? EfxCheckRetaliation
// ??? GetEfxHpChangeType
// ??? EkrPlayMainBGM
// ??? EkrRestoreBGM
// ??? GetBanimBossBGM
// ??? GetProperAnimSoundLocation
void PlaySFX(int, int, int, int);
// ??? PlaySfxAutomatically

/* ekrclasschg */
// ??? sub_8068A0C
// ??? sub_8068A24
// ??? sub_8068A38
// ??? sub_8068A68
// ??? sub_8068D24
// ??? sub_8068D2C
// ??? sub_8068D70
// ??? sub_8068DB4
// ??? sub_8068E24
// ??? sub_8068E40
// ??? sub_8068EA8
// ??? sub_8068EC4
// ??? sub_8068F28
// ??? sub_8068F74
// ??? sub_8068F8C
// ??? sub_80690A0
// ??? sub_80690F8
// ??? sub_8069118
// ??? nullsub_57
// ??? sub_8069180
// ??? sub_80691B8
// ??? sub_806925C
// ??? sub_80692A0
// ??? CheckEkrLvupDone
// ??? EndEkrLevelUp
// ??? sub_8069314
// ??? sub_80696A0
// ??? sub_80696F8
// ??? sub_8069730
// ??? NewEkrLevelup
// ??? sub_80697C4
// ??? sub_8069830
// ??? sub_8069A84
// ??? sub_8069BB4
// ??? sub_8069BE4
// ??? sub_8069C28
// ??? sub_8069D50
// ??? sub_8069D7C
// ??? sub_8069DDC
// ??? sub_8069E64
// ??? sub_8069EB8
// ??? sub_8069F38
// ??? sub_8069F68
// ??? sub_806A05C
// ??? sub_806A08C
// ??? sub_806A098
// ??? sub_806A160
// ??? EkrLvup_OnEnd
// ??? NewEfxPartsofScroll
// ??? sub_806A2EC
// ??? nullsub_58
// ??? sub_806A364
// ??? sub_806A370
// ??? nullsub_59
// ??? sub_806A38C
// ??? sub_806A414
// ??? sub_806A4E0
// ??? sub_806A4EC
// ??? sub_806A4F8
// ??? sub_806A584
// ??? sub_806A5C0
// ??? sub_806A610
// ??? sub_806A658
// ??? sub_806A6B0
// ??? sub_806A6FC
// ??? sub_806A740
// ??? sub_806A7A0
// ??? sub_806A7AC
// ??? sub_806A7E0
// ??? sub_806A844
// ??? sub_806A880
// ??? sub_806A888
// ??? sub_806A8D8
// ??? sub_806A93C
// ??? sub_806A958
// ??? sub_806A9C0
// ??? sub_806AAA0
// ??? sub_806ABB4
// ??? sub_806AC24
// ??? sub_806AC5C
// ??? sub_806AC84
// ??? nullsub_10
// ??? sub_806AC9C
// ??? sub_806ACC0
// ??? sub_806AEC4
// ??? sub_806AEFC
// ??? sub_806AFB4
// ??? sub_806B040
// ??? sub_806B088
// ??? sub_806B134
// ??? sub_806B15C
// ??? sub_806B194
// ??? sub_806B264
// ??? sub_806B3E8
// ??? sub_806B440
// ??? sub_806B550
// ??? sub_806B598
// ??? sub_806B5C0
// ??? sub_806B5F8
// ??? sub_806B778
// ??? sub_806B798
// ??? sub_806B7DC
// ??? sub_806B800
// ??? CheckEkrPopupDone
// ??? EndEkrPopup
// ??? EfxPlaySound5AVol100
// ??? sub_806B88C
// ??? MakeBattlePopupTileMapFromTSA
// ??? DrawBattlePopup
// ??? NewEkrPopup
// ??? EkrPopup_Delay
// ??? EkrPopup_DrawWRankUp
// ??? ekrPopup_WaitWRankUp
// ??? ekrPopup_DrawWRankUp2
// ??? sub_806BDE0
// ??? sub_806BE18
// ??? sub_806BE40
// ??? sub_806BE78
// ??? sub_806BEA0
// ??? sub_806BEDC
// ??? nullsub_60
// ??? sub_806BF10
// ??? sub_806BF3C
// ??? sub_806BF78
// ??? sub_806BF94
// ??? sub_806BFB8

// ??? gUnk_08C09CE4
// ??? gUnk_08C09CE8
// ??? gUnk_08C09D08
// ??? gUnk_08C09D30
// ??? gUnk_08C09D48
// ??? gUnk_08C09D60
// ??? gUnk_08C09D90
// ??? gUnk_08C09DA8
// ??? gUnk_08C09DD8
// ??? gUnk_08C09E14
// ??? gUnk_08C09E50
// ??? gUnk_08C09E68
// ??? gUnk_08C09E80
// ??? gUnk_08C09E98
// ??? gUnk_08C09EB0
// ??? gUnk_08C09EC8
// ??? gUnk_08C09EE0
extern struct ProcCmd ProcScr_ekrDispUP[];
extern struct ProcCmd ProcScr_efxHPBar[];
// ??? gUnk_08C09F38
// ??? gUnk_08C09F70
// ??? gUnk_08C09F98
// ??? gUnk_08C09FC0
// ??? gUnk_08C09FE8
// ??? gUnk_08C0A000
// ??? gUnk_08C0A030
// ??? gUnk_08C0A068
// ??? gUnk_08C0A088
// ??? gUnk_08C0A0A0
// ??? gUnk_08C0A0B8
extern struct ProcCmd ProcScr_EfxQuakePure[];
// ??? gUnk_08C0A0F8
// ??? gUnk_08C0A150
// ??? gUnk_08C0A168
extern struct ProcCmd ProcScr_EfxHitQuake[];
extern struct ProcCmd ProcScr_efxFlashBG[];
extern struct ProcCmd ProcScr_efxWhiteOUT[];
extern struct ProcCmd ProcScr_efxWhiteIN[];
// ??? gUnk_08C0A218
// ??? gUnk_08C0A238
extern struct ProcCmd ProcScr_efxStatusUnit[];
extern struct ProcCmd ProcScr_EfxWeaponIcon[];
// ??? gUnk_08C0A2B0
// ??? gUnk_08C0A2E0
// ??? gUnk_08C0A320
// ??? gUnk_08C0A330
// ??? gUnk_08C0A350
// ??? gUnk_08C0A398
// ??? gUnk_08C0A3E8
// ??? gUnk_08C0A400
// ??? gUnk_08C0A420
// ??? gUnk_08C0A440
// ??? gUnk_08C0A460
// ??? gUnk_08C0A480
// ??? gUnk_08C0A4A0
// ??? gUnk_08C0A4C0
// ??? gUnk_08C0A4E0
// ??? gUnk_08C0A500
// ??? gUnk_08C0A520
// ??? gUnk_08C0A540
// ??? gUnk_08C0A560
// ??? gUnk_08C0A588
// ??? gUnk_08C0A5A0
// ??? gUnk_08C0A5C0
extern CONST_DATA AnimScr AnimScr_DefaultAnim[];
// ??? TsaConfs_BanimTmA
extern struct ProcCmd ProcScr_EkrChienCHR[];
// ??? gUnk_08C0A628
// ??? gUnk_08C0A640
// ??? gUnk_08C0A658
// ??? gUnk_08C0A688
// ??? gUnk_08C0A6B0
// ??? gUnk_08C0A6C8
// ??? gUnk_08C0BD7C
// ??? gUnk_08C0BE44
// ??? gUnk_08C0BED0
// ??? gUnk_08C0BF50
// ??? gUnk_08C0BFD0
// ??? gUnk_08C0CD3C
// ??? gUnk_08C0CDB0
// ??? gUnk_08C0D608
// ??? gUnk_08C0D638
// ??? gUnk_08C0D668
// ??? gUnk_08C0D684
// ??? gUnk_08C0D6C0
// ??? gEkrSpellAnimLut
// ??? gUnk_08C10828
extern struct ProcCmd ProcScr_efxRestRST[];
extern struct ProcCmd ProcScr_efxTwobaiRST[];
extern struct ProcCmd ProcScr_DummvRST[];
extern struct ProcCmd ProcScr_EfxRestWIN[];
// ??? gUnk_08C108A0
extern struct ProcCmd ProcScr_efxALPHA[];
// ??? gUnk_08C108D8
// ??? gUnk_08C108F0
// ??? gUnk_08C10908
// ??? gUnk_08C10920
// ??? gUnk_08C10938
// ??? gUnk_08C10958
// ??? gUnk_08C10970
// ??? gUnk_08C10990
// ??? gUnk_08C109A8
// ??? gUnk_08C109C0
// ??? gUnk_08C109D8
// ??? gUnk_08C109F0
// ??? gUnk_08C10A08
// ??? gUnk_08C10A20
// ??? gUnk_08C10A8C
// ??? gUnk_08C10AF8
// ??? gUnk_08C10B10
// ??? gUnk_08C10B28
// ??? gUnk_08C10B40
// ??? gUnk_08C10B58
// ??? gUnk_08C10B70
// ??? gUnk_08C10B88
// ??? gUnk_08C10BA0
// ??? gUnk_08C10BC0
// ??? gUnk_08C10BD8
// ??? gUnk_08C10BF0
// ??? gUnk_08C10C08
// ??? gUnk_08C10C20
// ??? gUnk_08C10C38
// ??? gUnk_08C10C58
// ??? gUnk_08C10C70
// ??? gUnk_08C10C90
// ??? gUnk_08C10CA8
// ??? gUnk_08C10CC0
// ??? gUnk_08C10CF0
// ??? gUnk_08C10D10
// ??? gUnk_08C10D28
// ??? gUnk_08C10D40
// ??? gUnk_08C10D58
// ??? gUnk_08C10D60
// ??? gUnk_08C10D68
// ??? gUnk_08C10D88
// ??? gUnk_08C10DA0
// ??? gUnk_08C10DB8
// ??? gUnk_08C10DD0
// ??? gUnk_08C10E00
// ??? gUnk_08C10E30
// ??? gUnk_08C10E48
// ??? gUnk_08C10E60
// ??? gUnk_08C10EB4
// ??? gUnk_08C10F08
// ??? gUnk_08C10F20
// ??? gUnk_08C10F40
// ??? gUnk_08C10F58
// ??? gUnk_08C10F70
// ??? gUnk_08C10F88
// ??? gUnk_08C10FA0
// ??? gUnk_08C10FB8
// ??? gUnk_08C10FD0
// ??? gUnk_08C10FFC
// ??? gUnk_08C11028
// ??? gUnk_08C11040
// ??? gUnk_08C11058
// ??? gUnk_08C11070
// ??? gUnk_08C11088
// ??? gUnk_08C110A0
// ??? gUnk_08C110CC
// ??? gUnk_08C110F8
// ??? gUnk_08C11120
// ??? gUnk_08C11160
// ??? gUnk_08C11180
// ??? gUnk_08C11198
// ??? gUnk_08C111B0
// ??? gUnk_08C11254
// ??? gUnk_08C112F8
// ??? gUnk_08C11340
// ??? gUnk_08C11370
// ??? gUnk_08C11388
// ??? gUnk_08C113B8
// ??? gUnk_08C113D0
// ??? gUnk_08C1149C
// ??? gUnk_08C11568
// ??? gUnk_08C11580
// ??? gUnk_08C11598
// ??? gUnk_08C115B0
// ??? gUnk_08C11634
// ??? gUnk_08C116B8
// ??? gUnk_08C1173C
// ??? gUnk_08C11754
// ??? gUnk_08C1176C
// ??? gUnk_08C118A4
// ??? gUnk_08C119DC
// ??? gUnk_08C11B14
// ??? gUnk_08C11B34
// ??? gUnk_08C11B6C
// ??? gUnk_08C11B8C
// ??? gUnk_08C11BA4
// ??? gUnk_08C11BBC
// ??? gUnk_08C11BEC
// ??? gUnk_08C11C0C
// ??? gUnk_08C11C24
// ??? gUnk_08C11C38
// ??? gUnk_08C11C4C
// ??? gUnk_08C11C64
// ??? gUnk_08C11C7C
// ??? gUnk_08C11C94
// ??? gUnk_08C11CA0
// ??? gUnk_08C11CAC
// ??? gUnk_08C11CC4
// ??? gUnk_08C11CDC
// ??? gUnk_08C11CF4
// ??? gUnk_08C11D0C
// ??? gUnk_08C11D24
// ??? gUnk_08C11D74
// ??? gUnk_08C11DC4
// ??? gUnk_08C11DD0
// ??? gUnk_08C11DDC
// ??? gUnk_08C11E30
// ??? gUnk_08C11E84
// ??? gUnk_08C11E9C
// ??? gUnk_08C11EB4
// ??? gUnk_08C11ECC
// ??? gUnk_08C11EE0
// ??? gUnk_08C11EF4
// ??? gUnk_08C11F0C
// ??? gUnk_08C11F2C
// ??? gUnk_08C11F44
// ??? gUnk_08C11F5C
// ??? gUnk_08C11F74
// ??? gUnk_08C11F8C
// ??? gUnk_08C11FA4
// ??? gUnk_08C11FBC
// ??? gUnk_08C11FD4
// ??? gUnk_08C12040
// ??? gUnk_08C120AC
// ??? gUnk_08C120F4
// ??? gUnk_08C1210C
// ??? gUnk_08C12124
// ??? gUnk_08C12144
// ??? gUnk_08C1215C
// ??? gUnk_08C1217C
// ??? gUnk_08C121A4
// ??? gUnk_08C121BC
// ??? gUnk_08C121D4
// ??? gUnk_08C122A0
// ??? gUnk_08C1236C
// ??? gUnk_08C12384
// ??? gUnk_08C1239C
// ??? gUnk_08C123BC
// ??? gUnk_08C123D4
// ??? gUnk_08C123EC
// ??? gUnk_08C12404
// ??? gUnk_08C1241C
// ??? gUnk_08C12434
// ??? gUnk_08C12454
// ??? gUnk_08C12474
// ??? gUnk_08C1248C
// ??? gUnk_08C124AC
// ??? gUnk_08C124CC
// ??? gUnk_08C124E4
// ??? gUnk_08C124FC
// ??? gUnk_08C1250C
// ??? gUnk_08C1252C
// ??? gUnk_08C12544
// ??? gUnk_08C12548
// ??? gUnk_08C12568
// ??? gUnk_08C12580
// ??? gUnk_08C12598
// ??? gUnk_08C125CC
// ??? gUnk_08C12600
// ??? gUnk_08C12620
// ??? gUnk_08C12638
// ??? gUnk_08C12650
// ??? gUnk_08C12698
// ??? gUnk_08C126B8
// ??? gUnk_08C126D0
// ??? gUnk_08C126E8
// ??? gUnk_08C12728
// ??? gUnk_08C12748
// ??? gUnk_08C12768
// ??? gUnk_08C127B0
// ??? gUnk_08C127C8
// ??? gUnk_08C127E0
// ??? gUnk_08C12814
// ??? gUnk_08C12848
// ??? gUnk_08C12868
// ??? gUnk_08C12880
// ??? gUnk_08C12898
// ??? gUnk_08C128B8
// ??? gUnk_08C12970
// ??? gUnk_08C12988
// ??? gUnk_08C129A0
// ??? gUnk_08C129B4
// ??? gUnk_08C129D4
// ??? gUnk_08C129F4
// ??? gUnk_08C12A0C
// ??? gUnk_08C12A24
// ??? gUnk_08C12A28
// ??? gUnk_08C12A2C
// ??? gUnk_08C12A30
// ??? gUnk_08C12A48
// ??? gUnk_08C12A6C
// ??? gUnk_08C12A8C
// ??? gUnk_08C12AA4
// ??? gUnk_08C12AB4
// ??? gUnk_08C12ACC
// ??? gUnk_08C12AE4
// ??? gUnk_08C12AFC
// ??? gUnk_08C12B00
// ??? gUnk_08C12B18
// ??? gUnk_08C12B30
// ??? gUnk_08C12BF0
// ??? gUnk_08C12C10
// ??? gUnk_08C12C38
// ??? gUnk_08C12C50
// ??? gUnk_08C12C80
// ??? gUnk_08C12CB0
// ??? gUnk_08C12CE0
// ??? gUnk_08C12CF8
// ??? gUnk_08C12D10
// ??? gUnk_08C12D40
// ??? gUnk_08C12D68
// ??? gUnk_08C12D80
// ??? gUnk_08C12D98
// ??? gUnk_08C12E98
// ??? gUnk_08C12EB8
// ??? gUnk_08C12ED8
// ??? gUnk_08C12EF8
// ??? gUnk_08C12F18
// ??? gUnk_08C12F30
// ??? gUnk_08C12F48
// ??? gUnk_08C12F60
// ??? gUnk_08C12F90
// ??? gUnk_08C12FB0
// ??? gUnk_08C12FD0
// ??? gUnk_08C12FF0
// ??? gUnk_08C13008
// ??? gUnk_08C13050
// ??? gUnk_08C13068
// ??? gUnk_08C13080
// ??? gUnk_08C130F0
// ??? gUnk_08C13110
// ??? gUnk_08C13130
// ??? gUnk_08C13148
// ??? gUnk_08C13178
// ??? gUnk_08C131A8
// ??? gUnk_08C131C0
// ??? gUnk_08C131D8
// ??? gUnk_08C13208
// ??? gUnk_08C13228
// ??? gUnk_08C13240
// ??? gUnk_08C13258
// ??? gUnk_08C13270
// ??? gUnk_08C13288
// ??? gUnk_08C132A8
// ??? gUnk_08C13378
// ??? gUnk_08C13390
// ??? gUnk_08C133B0
// ??? gUnk_08C133E0
// ??? gUnk_08C133F8
// ??? gUnk_08C13420
// ??? gUnk_08C13448
// ??? gUnk_08C13460
// ??? gUnk_08C13488
// ??? gUnk_08C134B0
// ??? gUnk_08C134C8
// ??? gUnk_08C134E8
// ??? gUnk_08C13508
// ??? gUnk_08C13520
// ??? gUnk_08C13538
// ??? gUnk_08C13550
// ??? gUnk_08C13568
// ??? gUnk_08C13580
// ??? gUnk_08C135A0
// ??? gUnk_08C135B8
// ??? gUnk_08C135D0
// ??? gUnk_08C135F8
// ??? gUnk_08C13610
// ??? gUnk_08C13640
// ??? gUnk_08C13658
// ??? gUnk_08C13690
// ??? gUnk_08C136C8
// ??? gUnk_08C136E0
// ??? gUnk_08C136F8
// ??? gUnk_08C13710
// ??? gUnk_08C13750
// ??? gUnk_08C13768
// ??? gUnk_08C13780
// ??? gUnk_08C13798
// ??? gUnk_08C137B0
// ??? gUnk_08C137C8
// ??? gUnk_08C137E0
// ??? gUnk_08C137F8
// ??? gUnk_08C13810
// ??? gUnk_08C13828
// ??? gUnk_08C13840
// ??? gUnk_08C13858
// ??? gUnk_08C13870
// ??? gUnk_08C13888
// ??? gUnk_08C13978
// ??? gUnk_08C13990
// ??? gUnk_08C139A8
// ??? gUnk_08C139B8
// ??? gUnk_08C139D8
// ??? gUnk_08C139F0
// ??? gUnk_08C13A08
// ??? gUnk_08C13A14
// ??? gUnk_08C13A34
extern struct ProcCmd ProcScr_EfxDrsmmoya[];
extern struct ProcCmd ProcScr_EfxDrsmmoyaBG[];
extern u16 * TsaSet_EfxDrsmmoyaBgLeft[];
extern u16 * TsaSet_EfxDrsmmoyaBgRight[];
extern struct ProcCmd ProcScr_EfxDrsmmoyaScroll[];
extern struct ProcCmd ProcScr_EfxDrsmmoyaScrollCOL[];
// ??? gUnk_08C13B24
// ??? gUnk_08C13B44
// ??? gUnk_08C13B6C
// ??? gUnk_08C13B84
// ??? gUnk_08C13BB4
// ??? gUnk_08C13BCC
// ??? gUnk_08C13BF4
// ??? gUnk_08C13C0C
// ??? gUnk_08C13C14
// ??? gUnk_08C13C34
// ??? gUnk_08C13C4C
// ??? gUnk_08C13C74
// ??? gUnk_08C13C8C
// ??? gUnk_08C13C90
// ??? gUnk_08C13CB0
// ??? gUnk_08C13CD0
// ??? gUnk_08C13CE8
// ??? gUnk_08C13D10
// ??? gUnk_08C13D28
// ??? gUnk_08C13DAC
// ??? gUnk_08C13E30
// ??? gUnk_08C1419C
// ??? gUnk_08C141F8
// ??? gUnk_08C14218
// ??? gUnk_08C14534
// ??? gUnk_08C14590
// ??? gUnk_08C145B0
// ??? gUnk_08C14650
// ??? gUnk_08C14660
// ??? gUnk_08C146DC
// ??? gUnk_08C146EC
// ??? gUnk_08C148D0
// ??? gUnk_08C14B24
// ??? gUnk_08C14D84
// ??? gUnk_08C14FE4
// ??? gUnk_08C150E8
// ??? gUnk_08C15184
// ??? gUnk_08C1597C
// ??? gUnk_08C159AC
// ??? gUnk_08C16604
// ??? gUnk_08C17264
// ??? gUnk_08C1757C
// ??? gUnk_08C175C4
// ??? gUnk_08C178E8
// ??? gUnk_08C17930
// ??? gUnk_08C17BD0
// ??? gUnk_08C17BE0
// ??? gUnk_08C17E2C
// ??? gUnk_08C17E3C
// ??? gUnk_08C189F4
// ??? gUnk_08C195F4
// ??? gUnk_08C1A224
// ??? gUnk_08C1AE54
// ??? gUnk_08C1BA90
// ??? gUnk_08C1CC3C
// ??? gUnk_08C1CD40
// ??? gUnk_08C1CD68
// ??? gUnk_08C1DEDC
// ??? gUnk_08C1DFE0
// ??? gUnk_08C1E008
// ??? gUnk_08C1F1AC
// ??? gUnk_08C1F2B0
// ??? gUnk_08C1F2D8
// ??? gUnk_08C2047C
// ??? gUnk_08C20580
// ??? gUnk_08C205A8
// ??? gUnk_08C2066C
// ??? gUnk_08C20710
// ??? gUnk_08C207B4
// ??? gUnk_08C20858
// ??? gUnk_08C208FC
// ??? gUnk_08C209A0
// ??? gUnk_08C20B34
// ??? gUnk_08C20CC8
// ??? gUnk_08C20E74
// ??? gUnk_08C21020
// ??? gUnk_08C211CC
// ??? gUnk_08C21374
// ??? gUnk_08C214B0
// ??? gUnk_08C215E8
// ??? gUnk_08C2184C
// ??? gUnk_08C21AB4
// ??? gUnk_08C21BD8
// ??? gUnk_08C21CFC
// ??? gUnk_08C22750
// ??? gUnk_08C2327C
// ??? gUnk_08C23694
// ??? gUnk_08C236C0
// ??? gUnk_08C23A1C
// ??? gUnk_08C23A48
// ??? gUnk_08C24818
// ??? gUnk_08C25638
// ??? gUnk_08C265CC
// ??? gUnk_08C28508
// ??? gUnk_08C28574
// ??? gUnk_08C285D4
// ??? gUnk_08C285DC
// ??? gUnk_08C28848
// ??? gUnk_08C28880
// ??? gUnk_08C289CC
// ??? gUnk_08C28DC4
// ??? gUnk_08C28DF8
// ??? gUnk_08C28E80
// ??? gUnk_08C29458
// ??? gUnk_08C29618
// ??? gUnk_08C29920
// ??? gUnk_08C29C1C
// ??? gUnk_08C2A8B4
// ??? gUnk_08C2A8E0
// ??? gUnk_08C2A90C
// ??? gUnk_08C2ACB0
// ??? gUnk_08C2D9FC
// ??? gUnk_08C2DA8C
// ??? gUnk_08C2EFA8
// ??? gUnk_08C2F01C
// ??? gUnk_08C305A8
// ??? gUnk_08C3061C
// ??? gUnk_08C33390
// ??? gUnk_08C3365C
// ??? gUnk_08C36340
// ??? gUnk_08C3B3AC
// ??? gUnk_08C3B52C
// ??? gUnk_08C3BAE0
// ??? gUnk_08C3BAF4
// ??? gUnk_08C3BB08
// ??? gUnk_08C3BB1C
// ??? gUnk_08C3BB30
// ??? gUnk_08C3BEA4
// ??? gUnk_08C3BEB0
// ??? gUnk_08C3BEBC
// ??? gUnk_08C3BEC8
// ??? gUnk_08C3BED4
// ??? gUnk_08C3FF94
// ??? gUnk_08C400E4
// ??? gUnk_08C40B04
// ??? gUnk_08C40B0C
// ??? gUnk_08C40B14
// ??? gUnk_08C40B1C
// ??? gUnk_08C40B40
// ??? gUnk_08C40B8C
// ??? gUnk_08C40BA8
// ??? gUnk_08C417A4
// ??? gUnk_08C417AC
// ??? gUnk_08C417B4
// ??? gUnk_08C417BC
// ??? gUnk_08C417C4
// ??? gUnk_08C417CC
// ??? gUnk_08C4181C
// ??? gUnk_08C41828
// ??? gUnk_08C41AF8
// ??? gUnk_08C41D18
// ??? gUnk_08C41D50
// ??? gUnk_08C41F78
// ??? gUnk_08C42AA4
// ??? gUnk_08C43190
// ??? gUnk_08C435EC
// ??? gUnk_08C43640
// ??? gUnk_08C4364C
// ??? gUnk_08C44720
// ??? gUnk_08C447B8
// ??? gUnk_08C44990
// ??? gUnk_08C44B94
// ??? gUnk_08C44F48
// ??? gUnk_08C452FC
// ??? gUnk_08C46040
// ??? gUnk_08C46060
// ??? gUnk_08C463C4
// ??? gUnk_08C463DC
// ??? gUnk_08C48338
// ??? gUnk_08C48524
// ??? gUnk_08C48648
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
// ??? gUnk_08C4A7D4
// ??? gUnk_08C4A830
// ??? gUnk_08C4A848
// ??? gUnk_08C4A860
// ??? gUnk_08C4A880
// ??? gUnk_08C4A898
// ??? gUnk_08C4A8B8
// ??? gUnk_08C4A8D0
// ??? gUnk_08C4A8E8
// ??? gUnk_08C4A908
extern struct ProcCmd ProcScr_EfxPartsofScroll[];
// ??? gUnk_08C4A9D8
// ??? gUnk_08C4A9F8
// ??? gUnk_08C4AA38
// ??? gUnk_08C4AA60
// ??? gUnk_08C4AA78
// ??? gUnk_08C4AAA4
// ??? gUnk_08C4AAD0
// ??? gUnk_08C4AAE8
// ??? gUnk_08C4AB00
// ??? gUnk_08C4AB20
// ??? gUnk_08C4AB40
// ??? gUnk_08C4AB58
// ??? gUnk_08C4AB80
// ??? gUnk_08C4AB98
// ??? gUnk_08C4ABB0
// ??? gUnk_08C4ABC8
// ??? gUnk_08C4ABE0
// ??? gUnk_08C4ABF8
// ??? gUnk_08C4AC10
// ??? gUnk_08C4AC28
// ??? gUnk_08C4AC48
// ??? gUnk_08C4B110
// ??? gUnk_08C4B444
// ??? gUnk_08C4B4DC
// ??? gUnk_08C4B56C
// ??? gUnk_08C4B5FC
// ??? gUnk_08C4B688
// ??? gUnk_08C4B778
// ??? gUnk_08C4B8F0
// ??? gUnk_08C4BA44
// ??? gUnk_08C4BD0C
// ??? gUnk_08C4BD70
// ??? gUnk_08C4C058
// ??? gUnk_08C4C060
// ??? gUnk_08C4C0C8
// ??? gUnk_08C4C100
// ??? gUnk_08C4C124
// ??? gUnk_08C4C130
// ??? gUnk_08C4C158
// ??? gUnk_08C51538
// ??? gUnk_08C52B94
// ??? gUnk_08C52C98
// ??? gUnk_08C53805
// ??? gUnk_08C53846
// ??? gUnk_08C53AD0
// ??? gUnk_08C53B11
// ??? gUnk_08C53B52
// ??? gUnk_08C53B93
// ??? gUnk_08C53BD4
// ??? gUnk_08C53C15
// ??? gUnk_08C53C56
// ??? gUnk_08C53C97
// ??? gUnk_08C53CD8
// ??? gUnk_08C53D19
// ??? gUnk_08C53D5A
// ??? gUnk_08C53D9B
// ??? gUnk_08C53DDC
// ??? gUnk_08C53E1D
// ??? gUnk_08C53E5E
// ??? gUnk_08C53E9F
// ??? gUnk_08C53EE0
// ??? gUnk_08C53F21
// ??? gUnk_08C53F62
// ??? gUnk_08C53FA3
// ??? gUnk_08C53FE4
// ??? gUnk_08C54025
// ??? gUnk_08C54066
// ??? gUnk_08C540A7
// ??? gUnk_08C540E8
// ??? gUnk_08C54129
// ??? gUnk_08C5416A
// ??? gUnk_08C541AB
// ??? gUnk_08C541EC
// ??? gUnk_08C5422D
// ??? gUnk_08C5426E
// ??? gUnk_08C542AF

extern const u8 BanimDefaultModeConfig[ANIM_ROUND_MAX * 4];
extern const u8 BattleTypeToAnimModeEndOfDodge[5];
extern const u8 BanimTypesPosLeft[5];
extern const u8 BanimTypesPosRight[5];
