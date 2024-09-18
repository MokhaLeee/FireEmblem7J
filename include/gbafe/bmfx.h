#pragma once

#include "global.h"
#include "proc.h"

struct ProcBmFx {
    PROC_HEADER;

    STRUCT_PAD(0x29, 0x4C);

    /* 4C */ s16 timer;

    STRUCT_PAD(0x4E, 0x64);

    /* 64 */ s16 xPos;
    /* 66 */ s16 yPos;
};

// GetSomeFacingDirection
// sub_801D808
// sub_801D844
// sub_801D880
// sub_801D8D4
// sub_801D920
// sub_801D958
// sub_801D9F0
// StartMapFade
// sub_801DA38
// sub_801DA50
// sub_801DAA4
// sub_801DB0C
// sub_801DB80
// sub_801DBB0
// sub_801DBF8
// sub_801DC24
// sub_801DC34
// sub_801DC48
// sub_801DC64
// sub_801DCB4
// sub_801DD54
// sub_801DD60
// sub_801DDA4
// sub_801DDF8
// sub_801DE18
// sub_801DE6C
// sub_801DEB0
// sub_801DEFC
// sub_801DF38
// sub_801DF68
// sub_801E110
// sub_801E2A0
// sub_801E364
// sub_801E650
// sub_801E660
// sub_801E6E4
// sub_801E7E0
// sub_801E804
// sub_801E83C
// sub_801E858
// sub_801E89C
// sub_801E8E0
// sub_801E924
// sub_801E94C
// sub_801E98C
// sub_801E9F0
// sub_801EA54
// sub_801EA6C
// sub_801EA74
// sub_801EB48
// sub_801EC1C
// sub_801EC24
// sub_801ECAC
// sub_801ED30
// sub_801ED50
// sub_801EDFC
// sub_801EEF8
// sub_801EF94
// sub_801EFC8
// sub_801F088
// sub_801F0B8
// sub_801F114
// sub_801F144
// sub_801F174
// sub_801F208
// sub_801F260
// sub_801F2CC
// sub_801F2E8
// sub_801F314
// sub_801F350
// sub_801F38C
// sub_801F400
// sub_801F44C
// sub_801F454
// sub_801F484
// sub_801F514
// sub_801F650
// sub_801F70C
// sub_801F71C
// sub_801F72C
// sub_801F748
// sub_801F758
// sub_801F7B0
// sub_801F81C
// sub_801F8F0
// sub_801F9D8
// sub_801FB94
// sub_801FBD8
// sub_801FC6C
// sub_801FCD0
// sub_801FD78
// sub_801FDB8
// sub_801FE34
// sub_801FE3C
// sub_801FE98
// sub_801FEF0
// sub_801FF18
// sub_801FF3C
// sub_801FFA8
// sub_801FFD0
// sub_801FFE0
// sub_80200CC
// sub_8020144
// sub_80202A8
// sub_80202B0
// sub_80202FC
// sub_8020304
// sub_8020350
// sub_802037C
// sub_80203D0
// sub_8020478
// sub_80204F8
// sub_8020500
// sub_8020508
// sub_8020538
// sub_8020540
// sub_8020580
// sub_80205C0
// sub_8020630
// sub_8020674
// sub_80207BC
// sub_80207F0
// sub_80207FC
// sub_8020838
// sub_8020870
// sub_802089C
// sub_80208E0
// sub_8020904
// sub_80209D0
// sub_8020A48
// StartLightRuneAnim3
// ProcDanceAnim_Init
// ProcDanceAnim_Loop
// ProcDanceAnim_ResetTimer
// ProcDanceAnim_Loop_Blend
// StartDanceringAnim
// ProcEventWrapAnim_Init
// ProcEventWrapAnim_Loop
// ProcEventWrapAnim_End
// StartEventWarpAnim
// sub_8020ECC
bool sub_8020F20(ProcPtr proc);
// sub_8020F38
// sub_8020FEC
// sub_8021064
// sub_802107C
// nullsub_40
// sub_80210C8
// sub_8021184
// sub_80211D8
// sub_80212A0
// sub_80212D4
// sub_8021348
// sub_8021390
// sub_80214E8
// sub_8021550
// sub_80215B8
// sub_80215D0
void SwingSwordfx_Init(struct ProcBmFx * proc);
void SwingSwordfx_Loop(struct ProcBmFx * proc);
void SwingSwordfx_End(struct ProcBmFx * proc);
// StartSwingSwordfx
void ProcMineFxFunc();
void StartMineAnim(ProcPtr proc, int x_target, int y_target);
void sub_80217EC(u16 * tilemap, int x, int y);
void sub_8021820(struct Proc * proc);
void sub_80218F8(struct Proc * proc);
void sub_8021954();
void NinianStartTransformToHunman(struct Proc * parent, int x, int y);

extern struct BmBgxConf CONST_DATA BmBgfxConf_GameTitle[];
extern struct BmBgxConf CONST_DATA BmBgfxConf_OpAnim[];
extern struct BmBgxConf CONST_DATA BmBgfxConf_DeadDragonFlame[];
extern struct BmBgxConf CONST_DATA BmBgfxConf_DragonFlame[];
