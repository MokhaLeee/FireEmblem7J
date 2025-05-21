#pragma once

#include "global.h"
#include "proc.h"

// sub_80788D0
// sub_80788F0
// sub_80788FC
// sub_8078950
// sub_8078980
// sub_8078984
// sub_80789AC
// sub_80789EC
// sub_8078A8C
// sub_8078ACC
// sub_8078BC4
// sub_8078C48
// sub_8078C90
// sub_8078CDC
// sub_8078CF0
// sub_8078D3C
// sub_8078D80
// sub_8078DC4
// sub_8078E20
// sub_8078E84
// sub_8078EB0
// sub_8078EDC
// sub_8078F08
// sub_8078F30
// sub_8078F64
// sub_8078FC4
// sub_8078FF0
// sub_8079040
// sub_8079058
// sub_8079080
// sub_80790A8
// sub_80790D0
// sub_80790F8
// CheckAvailableTurnEvent
// StartAvailableTurnEvents
// sub_80791CC
// sub_8079210
// sub_8079250
// sub_80792C4
// sub_807931C
// sub_80793A0
// sub_80793E4
// sub_80795CC
// sub_80795E0
// sub_80795FC
// sub_8079624
// sub_8079688
// sub_80796B0
// sub_80796CC
// sub_80796F4
// sub_8079710
// sub_8079738
// sub_8079754
// sub_807977C
// sub_807978C
// sub_8079798
// sub_80797D4
// sub_807982C
// sub_8079884
// sub_8079888
// sub_807988C
// sub_8079890
// sub_8079894
// sub_80798D4
// CheckForWaitEvents
// RunWaitEvents
// sub_8079990
// sub_80799A0
// sub_80799C0
// sub_80799E4
// sub_8079A50
// sub_8079A94
// sub_8079AF0
// sub_8079B38
// sub_8079B80
// CheckBattleTalk
// StartBattleTalk
// sub_8079CE4
// sub_8079D38
// sub_8079DF4
// sub_8079ED4
// sub_8079F04
// nullsub_61
// nullsub_62
// sub_8079F10
// nullsub_63
// sub_8079F18
// sub_8079F1C
// nullsub_64
// nullsub_65
// nullsub_66
// nullsub_67
// nullsub_68
// SetChapterFlag
// CheckPermanentFlag
// ClearChapterFlag
// sub_8079FDC
// SetPermanentFlag
// CheckChapterFlag
// ClearPermanentFlag
// sub_807A0A0
void SetFlag(int flag);
// CheckFlag
void ClearFlag(int flag);
// GetPermanentFlagBits
// sub_807A0FC
// sub_807A100
// sub_807A108
// sub_807A10C
// sub_807A124
// sub_807A160
// sub_807A198
// sub_807A1E4
// sub_807A208
// sub_807A22C
// sub_807A260
// sub_807A26C
// sub_807A284
// sub_807A2E4
// sub_807A344
// sub_807A3A4
// sub_807A3DC
// sub_807A414
// sub_807A44C
// sub_807A494
// sub_807A4D0
// sub_807A4D4
// sub_807A4D8
// sub_807A4DC
// sub_807A4E0
// sub_807A4E4
// sub_807A4E8
// sub_807A4EC
// sub_807A4F0
// sub_807A4F4
// sub_807A4F8
// sub_807A4FC
// sub_807A500
// sub_807A504
// sub_807A508
// sub_807A50C
// sub_807A510
// sub_807A514
// sub_807A518
// sub_807A51C
// sub_807A520
// sub_807A524
// sub_807A528
// sub_807A564
// sub_807A568
// sub_807A590
// sub_807A5D0
// sub_807A620
// sub_807A648
// sub_807A654
// sub_807A670
// sub_807A67C
// sub_807A698
// sub_807A6A4
// sub_807A6BC
// sub_807A6D8
// sub_807A740
// sub_807A754
// sub_807A794
// sub_807A7A4
// sub_807A7B4
// sub_807A7F0
// sub_807A800
// sub_807A810
// sub_807A820
// sub_807A830
// sub_807A840
// sub_807A850
// sub_807A860
// sub_807A870
// sub_807A880
// sub_807A890
// sub_807A8A0
// sub_807A8B0
// sub_807A8C0
// sub_807A8D0
// sub_807A8E0
// sub_807A8F0
// sub_807A900
// sub_807A910
// sub_807A920
// sub_807A930
// sub_807A940
// sub_807A950
// sub_807A960
// sub_807A970
// sub_807A980
// sub_807A990
// sub_807A9C0
// sub_807A9D0
// sub_807A9E0
// sub_807A9F0
// sub_807AA24
// sub_807AA5C
// sub_807AA74
// sub_807AAB0
// sub_807AAEC
// sub_807AB20
// sub_807AB30
// sub_807AB40
// sub_807AB50
// sub_807AB60
// sub_807AB70
// sub_807AB80
// sub_807AB90
// sub_807ABA0
// sub_807ABB0
// sub_807ABC0
// sub_807ABD0
// sub_807ABE0
// sub_807ABF0
// sub_807AC00
// sub_807AC10
// sub_807AC20
// sub_807AC30
// sub_807AC44
// sub_807AC58
// sub_807AC6C
// sub_807AC80
// sub_807AC94
// sub_807ACA8
// sub_807ACEC
// sub_807AD28
// sub_807AD3C
// sub_807AD50
// sub_807AD64
// sub_807AD78
// sub_807AD8C
// sub_807ADA8
// sub_807ADC4
// sub_807ADE0
// sub_807ADFC
// sub_807AE18
// sub_807AE2C
// sub_807AE3C
// sub_807AE4C
// sub_807AE5C
// sub_807AE6C
// sub_807AE7C
// sub_807AE94
// sub_807AEA8
// sub_807AEC4
// sub_807AEC8
// sub_807AEF0
// sub_807AF10
// sub_807AF24
// sub_807AF30
// sub_807AF3C
// sub_807AF50
// sub_807AFA0
// sub_807AFCC
// sub_807B158
// sub_807B1D8
// sub_807B1E0
// sub_807B228
// sub_807B24C
// sub_807B2A8
// sub_807B2DC
// sub_807B304
// sub_807B32C
// sub_807B3AC
// ImmediateDisplayMap
// sub_807B400
// TryLockParentProc
// TryUnlockParentProc
// sub_807B448
// sub_807B478
// sub_807B498
// sub_807B4C0
// sub_807B4E8
// sub_807B534
// sub_807B558

struct ProcEventQuakeHandler {
    PROC_HEADER;

    STRUCT_PAD(0x29, 0x4C);

    /* 4C */ s8 quake_type;
};

struct ProcEventQuakefx {
    PROC_HEADER;

    STRUCT_PAD(0x29, 0x4C);

    /* 4C */ s16 timer;
};

void EventQuakefxHorizon_ViolentLoop(struct Proc * procfx);
void EventQuakefxHorizon_SlightLoop(struct Proc * procfx);
void EventQuakefxVeritical_Loop(struct Proc * procfx);
void StartEventVeriticalQuakefx(ProcPtr parent);
void StartEventHorizontalQuakefxViolently(ProcPtr parent);
void StartEventHorizontalQuakefxSlightly(ProcPtr parent);
void StartEventHorizontalQuakefxViolentlyNoSound(ProcPtr parent);
void StartEventHorizontalQuakefxSlightlyNoSound(ProcPtr parent);
void EndEventHorizontalQuakefx(ProcPtr parent);
void EndEventVerticalQuakefx(ProcPtr parent);
void EventQuakefx_Init(struct ProcEventQuakefx * procfx);
void EventQuakefx_Loop(struct ProcEventQuakefx * procfx);
void StartEventQuakefx(ProcPtr proc);
void EndEventQuakefx(ProcPtr proc);

// SetFlag_145
// ClearFlag_145
// DragonGatefx_DistortionHandler
// DragonGatefx_DrawLight
// DragonGatefx_DrawDragon
// DragonGatefx_MergeDragon
// sub_807BB48
// DragonGatefxSetHBlank
// DragonGatefx_End
// EventCall_StartDragonGatefx
// DrawDragonGateDragonfx
// EndDragonGatefx
// DragonSpriteBlinking_Init
// DragonSpriteBlinking_Loop
// StartDragonSpriteBlinking
// EndDragonSpriteBlinking
// PutDragonGateFlame
// sub_807BD6C
// DragonFlamefx_Handler
// DragonFlamefx_Init
// DragonFlamefx_Rotation
// DragonFlamefx_EndRing
// DragonFlamefx_RefrainBlendAlpha
// sub_807BFEC
// sub_807C080
// sub_807C108
// sub_807C170
// StartDragonFlamefx
// EndDragonFlamefx
// DragonFlamefxFlashingOut
// sub_807C228
// DeadDragonFlame_Init
// DeadDragonFlame_Rotation
// sub_807C3E8
// sub_807C464
// sub_807C490
// sub_807C58C
// sub_807C5A4
// StartDeadDragonFlamefx
// sub_807C66C
// CandleFlameFx_ScanlineEffect
// StartCandleFlameFx
// EndCandleFlamePaletteFx
// ZephielEpilogue_Init
// ZephielEpilogue_EnableBg2
// ZephielEpilogue_LoadNewCg
// ZephielEpilogue_Loop_BlendCgs
// ZephielEpilogue_End
// StartZephielJahnEpilogueCg

struct ProcEventAnimfx
{
    PROC_HEADER;
    STRUCT_PAD(0x29, 0x4C);

    /* 4C */ s16 timer;

    STRUCT_PAD(0x4E, 0x58);

    /* 58 */ int bg2_offset;
};

void QuintessenceFx_ParallelWorker(struct ProcEventAnimfx * proc);
void QuintFxBg2_Init(struct ProcEventAnimfx * proc);
void QuintFxBg2_Loop(struct ProcEventAnimfx * proc);
void QuintessenceFx_Init_Main(struct ProcEventAnimfx * proc);
void QuintessenceFx_Loop_A(struct ProcEventAnimfx * proc);
void QuintessenceFx_ResetBlend(struct ProcEventAnimfx * proc);
void QuintessenceFx_Loop_B(struct ProcEventAnimfx * proc);
void QuintessenceFx_Loop_C(struct ProcEventAnimfx * proc);
void QuintessenceFx_OnEnd(void);
void StartQuintessenceStealEffect(struct Proc * parent);
void QuintessenceFx_Goto_B(void);
void QuintessenceFx_Goto_C(void);
void EndQuintessenceStealEffect(void);

struct ProcUnitTornOut {
    PROC_HEADER;
    STRUCT_PAD(0x29, 0x4C);

    /* 4C */ s16 counter;

    STRUCT_PAD(0x4E, 0x54);

    /* 54 */ struct Unit * unit;
};

void UnitTornOut_Init(struct ProcUnitTornOut * proc);
void UnitTornOut_Loop(struct ProcUnitTornOut * proc);
void StartUnitTornOut(struct Unit * unit, ProcPtr parent);

struct ProcFlameBreathfx {
    PROC_HEADER;

    /* 2C */ int x, y;

    STRUCT_PAD(0x34, 0x4C);

    /* 4C */ s16 timer;

    STRUCT_PAD(0x50, 0x58);

    /* 58 */ int type;

    STRUCT_PAD(0x5C, 0x64);

    /* 64 */ s16 bg_offset;
};

// sub_807CDEC
// sub_807CE00
// sub_807CE14

void sub_807CE90(struct ProcFlameBreathfx * proc);
void sub_807CF94(struct ProcFlameBreathfx * proc);
void sub_807CFEC(struct ProcFlameBreathfx * proc);
void sub_807D088(struct ProcFlameBreathfx * proc);
void sub_807D0E0(struct ProcFlameBreathfx * proc);
void StartFlameBreathfx(int type, int x, int y, ProcPtr parent);

struct ProcIceCrystal {
    PROC_HEADER;

    STRUCT_PAD(0x29, 0x4C);

    /* 4C */ s16 timer;

    STRUCT_PAD(0x4E, 0x58);

    /* 58 */ int bg2_offset;
};

void IceCrystalfx_Start(struct ProcIceCrystal * proc);
void IceCrystalfx_ResetPalette(struct ProcIceCrystal * proc);
void IceCrystalfx_RefrainPalette(struct ProcIceCrystal * proc);
void IceCrystalfx_Paluse(struct ProcIceCrystal * proc);
// StartLoadIceCrystal
// sub_807D328
// sub_807D370
// sub_807D3E0
// sub_807D424
// sub_807D478
// sub_807D4B8
// sub_807D534
// sub_807D59C
// sub_807D5B0
// sub_807D668
// sub_807D698
// sub_807D6BC
// sub_807D6E0
// sub_807D7D0
// sub_807D848
// sub_807D870
// sub_807D8E4
// sub_807D938
// sub_807D94C
// sub_807D95C
// sub_807D96C
// sub_807D97C
// sub_807D990
// sub_807D9AC
// sub_807D9E8
// sub_807D9FC
// sub_807DA28
// sub_807DA3C
// sub_807DA48
// sub_807DA64
// sub_807DA74
// sub_807DA84
// sub_807DA94
// sub_807DAA8
// sub_807DAC4
// sub_807DAD4
// sub_807DAF4
// sub_807DB20
// sub_807DB3C
// sub_807DB8C
// sub_807DBB0
// sub_807DBC8
// sub_807DC80
// sub_807DC9C
// sub_807DCD0
// sub_807DD0C
// sub_807DD24
// sub_807DD3C
// sub_807DD54
// sub_807DD84
// sub_807DDAC
// sub_807DDBC
// sub_807DDCC
// sub_807DDDC
// nullsub_69
// sub_807DE0C
// sub_807DE3C
// sub_807DE6C
// sub_807DE80
// sub_807DEA4
// sub_807DEC0
// sub_807DEFC
// sub_807DF0C
// sub_807DF44
// sub_807DF88
// sub_807DFDC
// sub_807DFF4
// sub_807E018
// sub_807E038
// sub_807E050
// sub_807E074
// sub_807E090
// sub_807E0A0
// sub_807E0C4
// sub_807E0D4
// sub_807E14C
// sub_807E178
// sub_807E188
// sub_807E1C4
// sub_807E1E8
// sub_807E27C
// sub_807E2A0
// sub_807E2CC
// sub_807E2F0
// sub_807E340
// sub_807E378
// sub_807E3BC
// sub_807E3E8
// nullsub_70
// sub_807E414
// sub_807E428
// sub_807E444
// sub_807E4A4
// sub_807E4C0
// sub_807E4E8
// sub_807E514
// sub_807E540
// sub_807E574
// sub_807E584
// sub_807E5D4
// sub_807E5E0
// sub_807E624
// EventCall_SwingSwordfx
// sub_807E658
// sub_807E694
// sub_807E6A4
// sub_807E71C
// sub_807E734
// sub_807E750
// sub_807E774
// sub_807E7A4
// sub_807E7F8
// sub_807E81C
// sub_807E838
// sub_807E854
// nullsub_20
// sub_807E908
// sub_807E934
// sub_807E950
// sub_807E9A4
// sub_807E9C4
// sub_807E9E0
// sub_807EA0C
// sub_807EB44
// sub_807EB80
// sub_807EB9C
// sub_807EBCC
// sub_807EC58
// sub_807ECD4
// sub_807ED8C
// sub_807EE34
// sub_807EED8
// sub_807EF5C
// sub_807EF68
// sub_807EF7C
// sub_807F104
// sub_807F16C
// sub_807F198
// sub_807F1B8
// ForceDisplayDragonSprite

struct ProcEventDragonsSpritefx {
    PROC_HEADER;

    /* 2C */ struct ProcSpriteAnim * approc[3];
    /* 38 */ s16 x_1[3];
    /* 3E */ s16 y_1[3];
    /* 44 */ s16 x_2[3];
    /* 4A */ s16 y_2[3];
    /* 50 */ s16 speed[3];
    /* 56 */ s16 progress[3];
    /* 5C */ u16 oam0[3];
    /* 62 */ u8 facing[3];

    STRUCT_PAD(0x65, 0x6A);

    /* 6A */ u8 kind;
    /* 6B */ u8 timer;
};

enum fire_dragon_sprite_action_idx {
    FIREDRAGONSPRIT_ACTION_NORMAL = 0,
    FIREDRAGONSPRIT_ACTION_BARK,
    FIREDRAGONSPRIT_ACTION_FELL,
    FIREDRAGONSPRIT_ACTION_FADEOUT,
    FIREDRAGONSPRIT_ACTION_RESTAND,
};

struct ProcDragonFlameImpact {
    PROC_HEADER;

    /* 2C */ int x, y;

    STRUCT_PAD(0x34, 0x4C);

    /* 4C */ s16 timer;
};

void EventDragonsSpritefx_Init(struct ProcEventDragonsSpritefx * proc);
void EventDragonsSpritefx_End(struct ProcEventDragonsSpritefx * proc);
void EventDragonsSpritefx_Loop(struct ProcEventDragonsSpritefx * proc);
void StartEventDragonsSpriteDeamon(int kind, ProcPtr parent);
void EndEventDragonsSpritefx(void);
void PutFireDragonSpritefx(int index, int ap_idx, int x, int y, int action, int speed);
void RemoveFireDragonSpritefx(int idx);
void sub_807F590(int idx);
void EventCall_PutFireDragonSprite(ProcPtr proc);
void Move2ndFireDragon(void);
void Move3rdFireDragon(void);
void ReputFireDragonSprite(ProcPtr proc);
void FireDragonSpriteRetreated(void);
void sub_807F6B0(void);
void sub_807F6D0(ProcPtr proc);
void sub_807F718(void);
void sub_807F738(void);
void sub_807F758(ProcPtr proc);
void sub_807F78C(ProcPtr proc);
void StartEventDragonsSpriteMovefx(ProcPtr proc);
void DragonFlameImpact_Init(struct ProcDragonFlameImpact * proc);
void DragonFlameImpact_Loop(struct ProcDragonFlameImpact * proc);
void DragonFlameImpact_End(struct ProcDragonFlameImpact * proc);
void StartDragonFlameImpact(ProcPtr parent);
void EndDragonFlameImpact(void);

void EventCall_FireDragonScreamingInPain(ProcPtr proc);
void EventCall_FireDragonFellWeakly(ProcPtr proc);
void EventCall_FireDragonFadeOut(ProcPtr proc);
void EventCall_FinalFireDragonReStandUp(ProcPtr proc);

// sub_807F9EC
// sub_807FA64
// sub_807FAE8
// ForceCenteredDragon
// sub_807FB34
// sub_807FB40
// sub_807FB54
// sub_807FB68
// sub_807FB6C
// sub_807FB80
// sub_807FB98
// sub_807FBB0
// sub_807FBCC
// sub_807FBE8
bool GetLynModeDeathFlag(void);
void SetLynModeDeathFlag(void);
// sub_807FC20
// sub_807FC3C
// sub_807FC58
// sub_807FC74
// sub_807FC88
// sub_807FC9C
// sub_807FCB0
// sub_807FCC4
// sub_807FCFC
// sub_807FD18
// sub_807FD34
// sub_807FD58
// sub_807FD9C
// sub_807FE8C
// sub_807FEBC
// sub_807FF4C
// sub_807FF5C
// sub_807FF6C
// sub_807FF7C
// sub_807FF8C
// sub_807FF9C
// sub_807FFE4
// sub_8080090
// sub_80800E0
// sub_808014C
// sub_80801D0
// sub_8080214
// sub_8080228
// sub_80802C4
// sub_808034C
// sub_80803B8
// sub_80803D0
// sub_808043C
// sub_808046C
// sub_8080480

extern struct ProcCmd ProcScr_EventHorizontalQuakefx[];
extern struct ProcCmd ProcScr_EventVerticalQuakefx[];
extern struct ProcCmd ProcScr_EventQuakefx[];
// ??? ProcScr_DragonGatefx
// ??? ProcScr_DragonSpriteBlinking
// ??? ProcScr_DragonFlamefx
// ??? ProcScr_DeadDragonFlamefx
// ??? ProcScr_ZephielEpilogue
extern struct ProcCmd ProcScr_QuintessenceFxBg2Scroll[];
extern struct ProcCmd ProcScr_QuintessenceFx[];
// ??? ProcScr_UnitTornOut
// ??? ProcScr_FlameBreathfx
extern struct ProcCmd ProcScr_IceCrystalfx[];
// ??? gUnk_08D6FB5C
// ??? gUnk_08D6FC14
// ??? gUnk_08D6FC44
// ??? gUnk_08D80D24
// ??? gUnk_08D80D2E
// ??? gUnk_08D837E8
// ??? ProcScr_08D837F8
// ??? gUnk_08D87684
extern struct ProcCmd ProcScr_EventDragonsSpritefx[];
// ??? ProcScr_DragonFlameImpact
// ??? gUnk_08D87F68
extern EventScr EventScr_DeathQuoteOnEnd[];
// ??? gUnk_08D8977C
// ??? gUnk_08D897EC
// ??? gUnk_08D8A0E0
// ??? gUnk_08D8A114
// ??? gUnk_08D8A148
// ??? gUnk_08D8A1B4
