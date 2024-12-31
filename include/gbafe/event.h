#pragma once

#include "global.h"
#include "proc.h"

typedef uintptr_t EventScr;

#define NUM_BACKGROUNDS 0x5B

enum event_evbit_idx {
    EVENT_FLAG_UNITCAM = 1 << 0,
    EVENT_FLAG_TEXTSKIPPED = 1 << 1,
    EVENT_FLAG_SKIPPED = 1 << 2,
    EVENT_FLAG_DISABLESKIP = 1 << 3,
    EVENT_FLAG_DISABLETEXTSKIP = 1 << 4,
    EVENT_FLAG_ENDMAPMAIN = 1 << 5,
    EVENT_FLAG_NOAUTOCLEAR = 1 << 6,
    EVENT_FLAG_NOSKIPTALK = 1 << 7,
    EVENT_FLAG_SLOWTALK = 1 << 8,
};

struct EventProc {
    /* 00 */ PROC_HEADER;

    /* 2C */ EventScr const * script_start;
    /* 30 */ EventScr const * script;
    /* 38 */ EventScr const * script_return;

    STRUCT_PAD(0x38, 0x40);

    /* 40 */ void (* idle_func)(struct EventProc * proc);
    /* 44 */ struct UnitDefinition const * unit_info;
    /* 48 */ int talk_auto_msg;
    /* 4C */ s8 background;
    /* 4D */ bool unk_4D;
    /* 4E */ u8 unk_4E;
    /* 4F */ u8 map_change_param;
    /* 50 */ u16 sleep_duration;

    STRUCT_PAD(0x52, 0x55);

    /* 55 */ u8 pid_param; // TODO: what is this exactly?
    /* 56 */ u16 ignore_count;

    STRUCT_PAD(0x58, 0x5C);

    /* 5C */ u16 iid_param;
    /* 5E */ u16 flags;
};

enum event_func_ret_idx {
    EVENT_CMDRET_CONTINUE,
    EVENT_CMDRET_JUMPED,
    EVENT_CMDRET_YIELD,
    EVENT_CMDRET_REPEAT,
};

#define EVT_CMD_ARGV(scr) ((const s16 *)(scr) + 1)

#define SCR_LO16(script_word) (((script_word) & 0x0000FFFF) >> 0)
#define SCR_HI16(script_word) (((script_word) & 0xFFFF0000) >> 16)

#define SCR_LO16_SIGN(script_word) (SCR_LO16(script_word) & 0x8000 ? -1 : SCR_LO16(script_word))
#define SCR_HI16_SIGN(script_word) (SCR_HI16(script_word) & 0x8000 ? -1 : SCR_HI16(script_word))

#define LO8(half) (((half) & 0x00FF) >> 0)
#define HI8(half) (((half) & 0xFF00) >> 8)

// sub_800A604
// void LoadUnitCore(struct UnitDefinition * udef, );
// sub_800A70C
// sub_800A720
// sub_800A7A4
// sub_800A7C0
// sub_800A7D0
// sub_800A7E8
// sub_800A8EC
// sub_800A9C0
// sub_800A9F4
// sub_800AA64
// sub_800AA80
// sub_800AAA8
// sub_800AAC4
// sub_800AAE0
// sub_800AC34
// sub_800AC6C
// sub_800ACC4
// sub_800ACD0
// sub_800ACDC
// sub_800ACE8
// sub_800AD04
// sub_800AD50
// sub_800AD60
// sub_800AD78
void Event_FadeOutOfBackgroundTalk(struct EventProc * proc);
void Event_FadeOutOfSkip(struct EventProc * proc);
// sub_800ADAC
// sub_800ADC0
// sub_800ADDC
// sub_800ADF8
// sub_800AE34
void StartEvent();
// StartEventLocking
// StartEventInternal
// sub_800B02C
// sub_800B040
// sub_800B04C
// sub_800B06C
// sub_800B0BC
// sub_800B0D4
// sub_800B100
// sub_800B12C
// sub_800B148
// sub_800B15C
// sub_800B188
// sub_800B200
// sub_800B244
// sub_800B2CC
// sub_800B3DC
// EvtCmd_Sleep
// EvtCmd_SleepFast
// EvtCmd_SleepText
// EvtCmd_Background
// EvtCmd_BackgroundLynModeDeath
// EvtCmd_BackgroundRandom
// EvtCmd_BackgroundMore
// EvtCmd_ClearTalk
// EvtCmd_ClearSkip
// EvtCmd_ClearSkipFadeToPrep
// EvtCmd_FadeFromOpening
void DisplayBackground(int background);
void DisplayBackgroundNoClear(int background);
// EventStartTalk
// sub_800B8CC
// sub_800B900
// sub_800B93C
// sub_800B994
// sub_800B9B8
// sub_800B9E8
// sub_800BA34
// Event14_TalkContinue
// sub_800BA8C
// sub_800BAD4
// sub_800BB64
// sub_800BBB0
// sub_800BBF8
// sub_800BC48
// sub_800BC98
// sub_800BCE4
// EventEndTalk
// Event20
// sub_800BDFC
// sub_800BE6C
// sub_800BEEC
// CanDisplayUnitMovement
// sub_800BF68
// sub_800C06C
// sub_800C16C
// sub_800C214
// sub_800C2C4
// sub_800C374
// sub_800C3FC
// sub_800C4C0
// sub_800C54C
// sub_800C5F4
// sub_800C70C
// sub_800C7CC
// sub_800C868
// sub_800C8BC
// EvtCmd_MovePidNextTo
// TryMoveUnit
// TryMoveUnitDisplayed
// DisplayMovement
// nullsub_26
// WaitForMu_OnLoop
// sub_800CC74
// sub_800CCB8
// sub_800CCFC
// sub_800CD68
// sub_800CD90
// sub_800CDCC
// sub_800CE54
// sub_800CEBC
// sub_800CEF4
// sub_800CF2C
// sub_800CFA8
// sub_800D044
// sub_800D168
// sub_800D204
// sub_800D22C
// sub_800D268
// sub_800D278
// Event3C_ASMC1
// Event3D_ASMC2
// Event3E_ASMC3
// Event3F_ASMC4
// Event40_ASMC5
// Event41_Halt
// Event42_Nop
// sub_800D384
// Event43_Goto
// sub_800D3F0
// sub_800D434
// sub_800D478
// sub_800D484
// sub_800D4A0
// sub_800D4AC
// sub_800D4C8
// sub_800D4EC
// sub_800D510
// sub_800D57C
// sub_800D5E8
// sub_800D678
// sub_800D69C
// sub_800D6C0
// sub_800D704
// sub_800D724
// sub_800D744
// sub_800D774
// sub_800D7CC
// sub_800D7F0
// sub_800D828
// sub_800D834
// sub_800D840
// sub_800D858
// sub_800D864
// sub_800D87C
// sub_800D894
// sub_800D8BC
// sub_800D8DC
// sub_800D8FC
// sub_800D994
// sub_800DA64
// sub_800DA9C
// sub_800DAF4
// sub_800DB18
// sub_800DB8C
// sub_800DBD4
// sub_800DC44
// sub_800DC94
// sub_800DCCC
// sub_800DCD4
// sub_800DD08
// sub_800DD70
// sub_800DD90
// sub_800DDA4
// sub_800DDD4
// sub_800DE5C
// sub_800DE98
// sub_800DF64
// sub_800DFE0
// sub_800E00C
// sub_800E078
// sub_800E098
// sub_800E0B4
// sub_800E0D0
// sub_800E0F8
// sub_800E120
// sub_800E160
// sub_800E1C4
// sub_800E23C
// sub_800E24C
// sub_800E25C
// sub_800E284
// sub_800E32C
// sub_800E35C
// sub_800E36C
// sub_800E390
// sub_800E3B4
// sub_800E3DC
// sub_800E40C
// sub_800E43C
// sub_800E44C
// Event80_CompleteGame
// sub_800E4A8
// sub_800E4C0
// sub_800E510
// sub_800E520
// sub_800E570
// sub_800E598
// sub_800E5C0
// sub_800E5EC
// sub_800E60C
// sub_800E628
// sub_800E65C
// sub_800E698
// sub_800E6D4
// sub_800E6F8
// sub_800E71C
// sub_800E750
// sub_800E774
// sub_800E798
// sub_800E7A4
// Event93
// sub_800E7D8
// sub_800E800
// sub_800E854
// sub_800EA10
// sub_800EA44
// sub_800EA58
// sub_800EA68
// sub_800EA74
// sub_800EA7C
// sub_800EA9C
// sub_800EAD4
// sub_800EAE4
// sub_800EB0C
// sub_800EB1C
// sub_800EB3C
// Event00_
// Event01
void EventClearTalkDisplayed(struct EventProc * proc);
void ClearTalk(void);
// nullsub_27
// nullsub_28
bool IsEventRunning();
// sub_800EC40
// sub_800EC58
void sub_800EC74();
void sub_800EC84(int);
// sub_800EC9C
// sub_800ECB8
// sub_800ECD4
// sub_800ECEC
// sub_800ED10
// sub_800ED34
// sub_800ED58
// sub_800ED9C
// sub_800EDBC
// StartStoleItemPopup
// sub_800EE48
// sub_800EE60
// sub_800EEA8
// sub_800EEBC
// sub_800EED8
// sub_800EEF4
// sub_800EF1C
// sub_800EF34
// sub_800EF50
// sub_800EF78
void sub_800EF98();
// GetChapterAllyUnitCount
// sub_800EFD4
// sub_800F070
// sub_800F0CC
// nullsub_29
// sub_800F188
// sub_800F200
// sub_800F208
// sub_800F224
// sub_800F230
// sub_800F23C
// sub_800F250
// sub_800F264
// sub_800F278
// sub_800F2E0
// sub_800F324
// sub_800F330
// sub_800F384
// sub_800F3A0
// sub_800F3F8
// sub_800F44C
// sub_800F46C
// nullsub_13
// nullsub_14
// sub_800F4C0
// nullsub_15
// nullsub_16
// sub_800F518
// sub_800F528
// sub_800F568
// sub_800F588
// sub_800F5A8
// sub_800F5C4
// sub_800F63C
// sub_800F67C
// sub_800F6C4
// sub_800F708
// sub_800F710
// sub_800F72C
// sub_800F734
// sub_800F750
// sub_800F790
// sub_800F7D0
// sub_800F810
// sub_800F850
// sub_800F8A4
// sub_800F8BC
// sub_800F93C
// sub_800F95C
// sub_800F9DC
// sub_800F9FC
// sub_800FA74
// sub_800FA84
// sub_800FA94
// sub_800FAA0
// sub_800FAB8
// sub_800FAE4
// sub_800FAFC
// sub_800FBA4
// sub_800FC40
// sub_800FC5C
// sub_800FC6C
// sub_800FC88
// sub_800FCBC
// sub_800FD04
// sub_800FD78
// sub_800FDC4
// EventCD_Warp
// sub_800FE60
// sub_800FEC8
// sub_800FF38
// sub_800FF74
// sub_801001C
// sub_8010028
// sub_801006C
// sub_801009C
// sub_80100F0
// sub_801012C
// nullsub_30
// sub_80101C8
// sub_8010230
// nullsub_31
// sub_80102DC
// sub_8010310
// sub_8010364
// sub_8010404
// sub_8010440
// sub_8010480
// sub_80104B8
// sub_80104D4
// sub_8010540
// sub_8010550
// sub_80105A8
// sub_8010600
// sub_8010630
// nullsub_32
// sub_80108C8
// sub_80108F0
// sub_801096C
// sub_80109F4
// sub_8010A70
// sub_8010ACC
// sub_8010AF4
// sub_8010BF4
// sub_8010C5C
// sub_8010CB0
// sub_8010D88
// sub_8010DC4
// sub_8010E14
// sub_8010EA0
// sub_8010EEC
// sub_8010F48
// sub_8010F74
// sub_8011038
// sub_80110E4
// sub_8011130
// sub_80111A8
// sub_80111E8
// sub_8011214
// sub_8011248
// sub_8011298
// sub_801135C
// sub_801140C
// sub_8011458
// sub_80114A4
// sub_80114EC
// sub_8011508

struct ProcEventSnowStormfx {
    PROC_HEADER;

    /* 2C */ int paluse_duration;
    /* 30 */ int timer;
    /* 34 */ int bg_offset;

    STRUCT_PAD(0x38, 0x3C);

    /* 3C */ int x, y;
};

void EventSnowStormfx_Init(struct ProcEventSnowStormfx * proc);
void EventSnowStormfx_Loop1(struct ProcEventSnowStormfx * proc);
void EventSnowStormfx_Loop2(struct ProcEventSnowStormfx * proc);
void EventSnowStormfx_Loop3(struct ProcEventSnowStormfx * proc);
void EventSnowStormfx_End(struct ProcEventSnowStormfx * proc);
int EventDF_SnowStormfx(struct EventProc * proc);

// sub_80117DC
// sub_80118A8
// sub_8011900
// sub_8011954
// sub_80119C4
// EventE1

struct ProcEventThunderfx {
    PROC_HEADER;

    STRUCT_PAD(0x29, 0x30);

    /* 30 */ int unk30;

    STRUCT_PAD(0x34, 0x3C);

    /* 3C */ int x, y;
};

void EventThunderfx_Init(struct ProcEventThunderfx * proc);
void EventThunderfx_End(struct ProcEventThunderfx * proc);
int EventE2_Thunderfx(struct EventProc * proc);
bool EventThunderfxExists(void);

enum
{
    BGPAL_NINIANDISP = 0x0F,
    OBPAL_NINIANDISP = 0x05,
    OBCHR_NINIANDISP = 0x40,
};

struct ProcNinianAppear {
    PROC_HEADER;

    /* 2C */ int unk2C;
    /* 30 */ int timer;

    STRUCT_PAD(0x34, 0x3C);

    /* 3C */ int x, y;
    /* 44 */ ProcPtr approc[8];
};

void NinianAppear_Init(struct ProcNinianAppear * proc);
void NinianDisp_FadeIn_Unused(struct ProcNinianAppear * proc);
void NinianDisp_FadeOut_Unused(struct ProcNinianAppear * proc);
void NinianDisp_AnimLoopEnd_Unused(struct ProcNinianAppear * proc);
void NinianAppear_Anim1(struct ProcNinianAppear * proc);
void NinianAppear_LoopAnim1(struct ProcNinianAppear * proc);
void NinianAppear_EndAnim1(struct ProcNinianAppear * proc);
void NinianAppear_Anim2(struct ProcNinianAppear * proc);
void NinianAppear_LoadUnit(struct ProcNinianAppear * proc);
void NinianAppear_End(struct ProcNinianAppear * proc);
int EventE4_NinianDisplay(struct EventProc * proc);

struct ProcScreenFlashing {
    PROC_HEADER;
    int duration;
    int mask;
    int speed_fadein;
    int speed_fadeout;
    int timer;
    int r, b, g;
};

void ScreenFlash_Init(struct ProcScreenFlashing * proc);
void ScreenFlash_FadeIn(struct ProcScreenFlashing * proc);
void ScreenFlash_FadeOut(struct ProcScreenFlashing * proc);
void StartScreenFlashing(int mask, int duration, int speed_fadein, int speed_fadeout, int r, int g, int b, ProcPtr parent);
int EventE3_ScreenFlashing(struct EventProc * proc);

struct ProcEventFade {
    PROC_HEADER;
    STRUCT_PAD(0x29, 0x30);

    /* 30 */ u32 mask;
    /* 34 */ int speed, timer;
    /* 3C */ int r0, g0, b0;
    /* 48 */ int r1, g1, b1;
};

void EventFadefx_Init(struct ProcEventFade * proc);
void EventFadefx_Loop(struct ProcEventFade * proc);
void NewEventFadefx(u32 mask, int speed, int r, int g, int b, ProcPtr parent);
int EventE7_FadeSteps(struct EventProc * proc);
int EventE6_StartFade(struct EventProc * proc);
int EventE7_EndFade(struct EventProc * proc);

struct EventSpriteAnimConf {
    /* 00 */ const u16 * pal;
    /* 04 */ const u8  * img;
    /* 08 */ const u8  * ap_conf;
    /* 0C */ u16 oam0, oam2;
    /* 10 */ u8 pal_bank, pal_size;

    /* 12 */ u8 _pad_[2];
};

struct ProcEventSpriteAnim {
    PROC_HEADER;

    /* 2C */ int x, y;
    /* 34 */ ProcPtr approc;
    /* 38 */ const struct EventSpriteAnimConf * priv;
};

void EventSpriteAnim_Init(struct ProcEventSpriteAnim * proc);
void EventSpriteAnim_Loop(struct ProcEventSpriteAnim * proc);
void EventSpriteAnim_End(struct ProcEventSpriteAnim * proc);
int EventE8_StartSpriteAnim(struct EventProc * proc);
int EventE9_EndEventSpriteAnim(void);
bool EventSpriteAnimExists(void);

// EventEA_StartMixPalette
// EventEB_EndMixPalette
void EventLoadUnit(int pid, int jid, int x_load, int y_load, int x_move, int y_move, int faction_id, void * unk);
// sub_8012440
void sub_80124BC(ProcPtr proc);
void sub_80125A4(ProcPtr proc);
// sub_80125EC

extern u32 CONST_DATA gUnk_08BFFE88;
// ??? gUnk_08BFFE8C
// ??? gUnk_08BFFE90
// ??? gUnk_08BFFEF0
// ??? gUnk_08BFFEF8
// ??? gUnk_08BFFF30
// ??? gUnk_08BFFF58
extern struct ProcCmd ProcScr_UnkEvt[];
// ??? gUnk_08C00018
// ??? gEventCmdTable
// ??? gUnk_08C0003C
// ??? gUnk_08C0024C

struct BackgroundInfo
{
    u8 const * img;
    u8 const * tsa;
    u16 const * pal;
};

extern struct BackgroundInfo gBackgroundTable[];

// ??? gUnk_08C00C18
// ??? gUnk_08C00C28
// ??? gUnk_08C00C48
// ??? gUnk_08C00C60
// ??? gUnk_08C00C88
// ??? gUnk_08C00CC8
// ??? gUnk_08C00CE8
// ??? gUnk_08C00CF8
// ??? gUnk_08C00D20
// ??? gUnk_08C00D44
// ??? gUnk_08C00D84
// ??? gUnk_08C00DC4
// ??? gUnk_08C00DEC
// ??? gUnk_08C00E24
// ??? gUnk_08C00E5C
// ??? gUnk_08C00E9C
// ??? gUnk_08C00EDC
// ??? gUnk_08C00F1C
// ??? gUnk_08C00F5C
// ??? gUnk_08C00F7C
// ??? gUnk_08C00FAC
// ??? gUnk_08C00FC4
// ??? gUnk_08C00FE0
// ??? gUnk_08C00FF8
// ??? gUnk_08C01004
// ??? gUnk_08C01020
// ??? gUnk_08C01094
// ??? gUnk_08C010BC
// ??? gUnk_08C010EC
// ??? gUnk_08C01124
// ??? gUnk_08C01144
// ??? gUnk_08C0115C
// ??? gUnk_08C0117C
// ??? gUnk_08C011CC
// ??? gUnk_08C01224
// ??? ProcScr_EventSnowStormfx
// ??? gUnk_08C012BC
extern struct BmBgxConf CONST_DATA  BmBgfxConf_IceCrystal[];
// ??? gUnk_08DBAD14
// ??? gUnk_08DC0390

extern struct BmBgxConf CONST_DATA BmBgfxConf_EventThunder[];
extern struct ProcCmd CONST_DATA ProcScr_EventThunderfx[];
extern struct BmBgxConf CONST_DATA BmBgfxConf_NinianDisp[];
extern struct ProcCmd CONST_DATA ProcScr_NinianAppearfx[];
extern struct ProcCmd CONST_DATA ProcScr_ScreenFlashing[];
extern struct ProcCmd CONST_DATA ProcScr_EventFadefx[];
extern struct ProcCmd CONST_DATA ProcScr_EventSpriteAnim[];
extern struct ProcCmd CONST_DATA ProcScr_Event_08C0169C[];
