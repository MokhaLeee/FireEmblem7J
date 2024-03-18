#pragma once

#include "global.h"
#include "proc.h"

typedef uintptr_t EventScr;

enum event_evbit_idx {
    EVENT_FLAG_UNITCAM = 1 << 0,
    EVENT_FLAG_TEXTSKIPPED = 1 << 1,
    EVENT_FLAG_SKIPPED = 1 << 2,
    EVENT_FLAG_DISABLESKIP = 1 << 3,
    EVENT_FLAG_DISABLETEXTSKIP = 1 << 4,
    EVENT_FLAG_ENDMAPMAIN = 1 << 5,
    EVENT_FLAG_NOAUTOCLEAR = 1 << 6,
};

struct EventProc {
    /* 00 */ PROC_HEADER;

    /* 2C */ EventScr const * script_start;
    /* 30 */ EventScr const * script;

    STRUCT_PAD(0x34, 0x5E);

    /* 5E */ u16 evbits;
};

enum event_func_ret_idx {
    EVENT_CMDRET_CONTINUE,
    EVENT_CMDRET_JUMPED,
    EVENT_CMDRET_YIELD,
    EVENT_CMDRET_REPEAT,
};

#define EVT_CMD_ARGV(scr) ((const s16 *)(scr) + 1)

// sub_800A508
// sub_800A520
// sub_800A530
// sub_800A578
// sub_800A580
// sub_800A604
// sub_800A614
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
// sub_800AD84
// sub_800AD98
// sub_800ADAC
// sub_800ADC0
// sub_800ADDC
// sub_800ADF8
// sub_800AE34
// StartEvent
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
// sub_800B404
// sub_800B434
// sub_800B464
// sub_800B494
// sub_800B4F4
// sub_800B578
// sub_800B5AC
// sub_800B5F0
// sub_800B63C
// sub_800B678
// sub_800B70C
// sub_800B72C
// sub_800B7BC
// sub_800B848
// sub_800B8CC
// sub_800B900
// sub_800B93C
// sub_800B994
// sub_800B9B8
// sub_800B9E8
// sub_800BA34
// sub_800BA5C
// sub_800BA8C
// sub_800BAD4
// sub_800BB64
// sub_800BBB0
// sub_800BBF8
// sub_800BC48
// sub_800BC98
// sub_800BCE4
// sub_800BCF0
// sub_800BD84
// sub_800BDFC
// sub_800BE6C
// sub_800BEEC
// sub_800BF1C
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
// sub_800C92C
// sub_800C9F8
// sub_800CA84
// sub_800CB6C
// nullsub_26
// sub_800CC28
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
// sub_800D28C
// sub_800D2B0
// sub_800D2E4
// sub_800D31C
// sub_800D34C
// sub_800D37C
// sub_800D380
// sub_800D384
// sub_800D3E0
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
// sub_800E490
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
// sub_800E7B0
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
// sub_800EBB0
// sub_800EBBC
// ResetDialogueScreen
// nullsub_27
// nullsub_28
// IsEventRunning
// sub_800EC40
// sub_800EC58
// sub_800EC74
// sub_800EC84
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
// sub_800EF98
// sub_800EFB8
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
// sub_800FDD8
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

// sub_8011B4C
// sub_8011BD4
// sub_8011C08
// sub_8011C38
// sub_8011C5C
// sub_8011CBC
// sub_8011DD8
// sub_8011DF4
// sub_8011E48
// sub_8011E8C
// sub_8011EC0
// sub_8011F10
// sub_8011F20
// sub_8011FD4
// sub_8012030
// sub_801206C
// sub_80120D8
// sub_80120E0
// sub_8012150
// EventE5
// sub_80121F0
// sub_80121FC

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
int EndEventSpriteAnim(void);
bool EventSpriteAnimExists(void);

// sub_8012378
// sub_80123BC
// sub_80123C8
// sub_8012440
void sub_80124BC(ProcPtr proc);
void sub_80125A4(ProcPtr proc);
// sub_80125EC

extern struct BmBgxConf CONST_DATA BmBgfxConf_EventThunder[];
extern struct ProcCmd CONST_DATA ProcScr_EventThunderfx[];
// ??? gUnk_08C013F0
// ??? gUnk_08C015DC
// ??? gUnk_08C0162C
// ??? gUnk_08C01654
extern struct ProcCmd CONST_DATA ProcScr_EventSpriteAnim[];
extern struct ProcCmd CONST_DATA ProcScr_Event_08C0169C[];
