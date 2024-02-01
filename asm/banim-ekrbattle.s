	.include "macro.inc"
	.syntax unified

	thumb_func_start SetBanimLinkArenaFlag
SetBanimLinkArenaFlag: @ 0x0804B970
	ldr r1, _0804B978 @ =0x0203DFD4
	str r0, [r1]
	bx lr
	.align 2, 0
_0804B978: .4byte 0x0203DFD4

	thumb_func_start GetBanimLinkArenaFlag
GetBanimLinkArenaFlag: @ 0x0804B97C
	ldr r0, _0804B984 @ =0x0203DFD4
	ldr r0, [r0]
	bx lr
	.align 2, 0
_0804B984: .4byte 0x0203DFD4

	thumb_func_start NewEkrBattleDeamon
NewEkrBattleDeamon: @ 0x0804B988
	push {r4, lr}
	ldr r4, _0804B9A8 @ =0x0203DFDC
	ldr r0, _0804B9AC @ =0x08C09CE8
	movs r1, #3
	bl Proc_Start
	str r0, [r4]
	ldr r1, _0804B9B0 @ =0x0203DFD8
	movs r0, #1
	str r0, [r1]
	bl sub_08015784
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0804B9A8: .4byte 0x0203DFDC
_0804B9AC: .4byte 0x08C09CE8
_0804B9B0: .4byte 0x0203DFD8

	thumb_func_start EndEkrBattleDeamon
EndEkrBattleDeamon: @ 0x0804B9B4
	push {lr}
	ldr r0, _0804B9C4 @ =0x0203DFDC
	ldr r0, [r0]
	bl Proc_End
	pop {r0}
	bx r0
	.align 2, 0
_0804B9C4: .4byte 0x0203DFDC

	thumb_func_start IsBattleDeamonActive
IsBattleDeamonActive: @ 0x0804B9C8
	ldr r0, _0804B9D4 @ =0x0203DFD8
	ldr r0, [r0]
	cmp r0, #1
	beq _0804B9D8
	movs r0, #0
	b _0804B9DA
	.align 2, 0
_0804B9D4: .4byte 0x0203DFD8
_0804B9D8:
	movs r0, #1
_0804B9DA:
	bx lr

	thumb_func_start EkrBattleDeamon_OnEnd
EkrBattleDeamon_OnEnd: @ 0x0804B9DC
	push {lr}
	ldr r1, _0804B9EC @ =0x0203DFD8
	movs r0, #0
	str r0, [r1]
	bl sub_08015794
	pop {r0}
	bx r0
	.align 2, 0
_0804B9EC: .4byte 0x0203DFD8

	thumb_func_start EkrBattleDeamonMain
EkrBattleDeamonMain: @ 0x0804B9F0
	bx lr
	.align 2, 0

	thumb_func_start NewEkrBattle
NewEkrBattle: @ 0x0804B9F4
	push {r4, lr}
	bl AnimClearAll
	ldr r4, _0804BA3C @ =0x02000064
	ldr r0, _0804BA40 @ =0x08C09D08
	movs r1, #3
	bl Proc_Start
	str r0, [r4]
	ldr r0, _0804BA44 @ =InBattleMainRoutine
	bl SetMainFunc
	bl EkrEfxStatusClear
	ldr r0, _0804BA48 @ =gEkrBattleEndFlag
	movs r1, #0
	str r1, [r0]
	ldr r0, _0804BA4C @ =0x02000018
	str r1, [r0]
	ldr r0, _0804BA50 @ =0x0200001C
	str r1, [r0]
	ldr r0, _0804BA54 @ =0x02000020
	str r1, [r0]
	ldr r0, _0804BA58 @ =gAnimC01Blocking
	str r1, [r0]
	ldr r0, _0804BA5C @ =gEkrDebugModeMaybe
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	bne _0804BA34
	bl EkrPlayMainBGM
_0804BA34:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0804BA3C: .4byte 0x02000064
_0804BA40: .4byte 0x08C09D08
_0804BA44: .4byte InBattleMainRoutine
_0804BA48: .4byte gEkrBattleEndFlag
_0804BA4C: .4byte 0x02000018
_0804BA50: .4byte 0x0200001C
_0804BA54: .4byte 0x02000020
_0804BA58: .4byte gAnimC01Blocking
_0804BA5C: .4byte gEkrDebugModeMaybe

	thumb_func_start InBattleMainRoutine
InBattleMainRoutine: @ 0x0804BA60
	push {lr}
	ldr r0, _0804BA78 @ =gpKeySt
	ldr r0, [r0]
	bl RefreshKeySt
	ldr r0, _0804BA7C @ =0x0200001C
	ldr r0, [r0]
	cmp r0, #0
	bne _0804BA80
	bl MainUpdateEkrBattle
	b _0804BA8C
	.align 2, 0
_0804BA78: .4byte gpKeySt
_0804BA7C: .4byte 0x0200001C
_0804BA80:
	ldr r0, _0804BAA0 @ =0x02000020
	ldr r0, [r0]
	cmp r0, #1
	bne _0804BA8C
	bl MainUpdateEkrBattle
_0804BA8C:
	ldr r0, _0804BAA4 @ =gEkrBattleEndFlag
	ldr r0, [r0]
	cmp r0, #1
	beq _0804BAA8
	cmp r0, #1
	blo _0804BAE4
	cmp r0, #2
	beq _0804BAB8
	b _0804BAE4
	.align 2, 0
_0804BAA0: .4byte 0x02000020
_0804BAA4: .4byte gEkrBattleEndFlag
_0804BAA8:
	ldr r0, _0804BAB4 @ =gEkrDebugModeMaybe
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	bne _0804BAE4
	b _0804BAC2
	.align 2, 0
_0804BAB4: .4byte gEkrDebugModeMaybe
_0804BAB8:
	ldr r0, _0804BAD0 @ =gEkrDebugModeMaybe
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	bne _0804BAD8
_0804BAC2:
	ldr r0, _0804BAD4 @ =0x02000064
	ldr r0, [r0]
	bl Proc_End
	bl EkrBattleEndRountine
	b _0804BAE4
	.align 2, 0
_0804BAD0: .4byte gEkrDebugModeMaybe
_0804BAD4: .4byte 0x02000064
_0804BAD8:
	ldr r0, _0804BAF8 @ =0x02000064
	ldr r0, [r0]
	bl Proc_End
	bl EndEkrGauge
_0804BAE4:
	ldr r1, _0804BAFC @ =gBmSt
	movs r0, #1
	strb r0, [r1]
	ldr r0, _0804BB00 @ =0x04000006
	ldrh r0, [r0]
	strh r0, [r1, #6]
	bl VBlankIntrWait
	pop {r0}
	bx r0
	.align 2, 0
_0804BAF8: .4byte 0x02000064
_0804BAFC: .4byte gBmSt
_0804BB00: .4byte 0x04000006

	thumb_func_start MainUpdateEkrBattle
MainUpdateEkrBattle: @ 0x0804BB04
	push {r4, lr}
	bl ClearSprites
	bl UnregisterEfxSoundSeExist
	bl sub_080157A4
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0804BB20
	ldr r0, _0804BB70 @ =0x02026A28
	ldr r0, [r0, #8]
	bl Proc_Run
_0804BB20:
	ldr r4, _0804BB70 @ =0x02026A28
	ldr r0, [r4, #0xc]
	bl Proc_Run
	ldr r0, [r4, #0x14]
	bl Proc_Run
	movs r0, #0
	bl PushSpriteLayerObjects
	ldr r0, [r4, #4]
	bl Proc_Run
	bl AnimUpdateAll
	bl BattleAIS_ExecCommands
	ldr r0, [r4, #0x10]
	bl Proc_Run
	ldr r1, _0804BB74 @ =0x02000020
	movs r0, #0
	str r0, [r1]
	ldr r1, _0804BB78 @ =gBanimDoneFlag
	ldr r0, [r1]
	ldr r1, [r1, #4]
	adds r0, r0, r1
	cmp r0, #2
	beq _0804BB62
	ldr r1, _0804BB7C @ =0x02000018
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
_0804BB62:
	movs r0, #0xd
	bl PushSpriteLayerObjects
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0804BB70: .4byte 0x02026A28
_0804BB74: .4byte 0x02000020
_0804BB78: .4byte gBanimDoneFlag
_0804BB7C: .4byte 0x02000018

	thumb_func_start EkrBattle_End
EkrBattle_End: @ 0x0804BB80
	bx lr
	.align 2, 0

	thumb_func_start EkrBattle_Init
EkrBattle_Init: @ 0x0804BB84
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, _0804BBA4 @ =gEkrBgPosition
	movs r0, #0
	str r0, [r1]
	ldr r0, _0804BBA8 @ =gEkrInitPosReal
	ldr r0, [r0]
	cmp r0, #0
	bne _0804BBB6
	ldr r0, _0804BBAC @ =gEkrDistanceType
	ldrh r0, [r0]
	cmp r0, #1
	bne _0804BBB0
	movs r0, #0x20
	rsbs r0, r0, #0
	b _0804BBB4
	.align 2, 0
_0804BBA4: .4byte gEkrBgPosition
_0804BBA8: .4byte gEkrInitPosReal
_0804BBAC: .4byte gEkrDistanceType
_0804BBB0:
	movs r0, #0xf0
	rsbs r0, r0, #0
_0804BBB4:
	str r0, [r1]
_0804BBB6:
	bl InitMainAnims
	bl InitEkrDragonStatus
	ldr r0, _0804BBD0 @ =gAnimC01Blocking
	movs r1, #1
	str r1, [r0]
	bl GetBattleAnimArenaFlag
	cmp r0, #1
	bne _0804BBD4
	movs r0, #0
	b _0804BBD6
	.align 2, 0
_0804BBD0: .4byte gAnimC01Blocking
_0804BBD4:
	movs r0, #0x1e
_0804BBD6:
	strh r0, [r4, #0x2c]
	ldr r0, _0804BBEC @ =gEkrInitialHitSide
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	bne _0804BBF4
	ldr r1, _0804BBF0 @ =gEkrPids
	ldrb r0, [r1]
	ldrb r1, [r1, #1]
	b _0804BBFA
	.align 2, 0
_0804BBEC: .4byte gEkrInitialHitSide
_0804BBF0: .4byte gEkrPids
_0804BBF4:
	ldr r1, _0804BC14 @ =gEkrPids
	ldrb r0, [r1, #1]
	ldrb r1, [r1]
_0804BBFA:
	bl CheckBattleTalk
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	str r0, [r4, #0x54]
	movs r0, #0
	str r0, [r4, #0x58]
	adds r0, r4, #0
	bl Proc_Break
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0804BC14: .4byte gEkrPids

	thumb_func_start EkrBattle_Main
EkrBattle_Main: @ 0x0804BC18
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x1f
	bne _0804BC60
	bl GetBanimLinkArenaFlag
	cmp r0, #1
	beq _0804BC58
	ldr r0, [r4, #0x54]
	cmp r0, #1
	beq _0804BC3E
	ldr r0, [r4, #0x58]
	cmp r0, #1
	bne _0804BC58
_0804BC3E:
	movs r0, #1
	movs r1, #7
	bl NewEkrWindowAppear
	movs r0, #1
	movs r1, #7
	movs r2, #0
	bl NewEkrNamewinAppear
	ldr r0, _0804BC54 @ =EkrBattleStartBattleQuote
	b _0804BC5A
	.align 2, 0
_0804BC54: .4byte EkrBattleStartBattleQuote
_0804BC58:
	ldr r0, _0804BC68 @ =EkrBattlePreDragonIntro
_0804BC5A:
	str r0, [r4, #0xc]
	movs r0, #0
	strh r0, [r4, #0x2c]
_0804BC60:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0804BC68: .4byte EkrBattlePreDragonIntro

	thumb_func_start EkrBattleStartBattleQuote
EkrBattleStartBattleQuote: @ 0x0804BC6C
	push {r4, lr}
	sub sp, #4
	adds r4, r0, #0
	bl CheckEkrWindowAppearUnexist
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne _0804BCF6
	bl EnableEkrGauge
	bl EkrGauge_0804D60C
	movs r0, #0
	str r0, [sp]
	ldr r1, _0804BCD0 @ =gBg0Tm
	ldr r2, _0804BCD4 @ =0x01000200
	mov r0, sp
	bl CpuFastSet
	ldr r0, _0804BCD8 @ =0x02000038
	ldrh r1, [r0]
	ldrh r2, [r0, #2]
	movs r0, #0
	bl SetBgOffset
	movs r0, #1
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	movs r0, #1
	bl EnableBgSync
	bl EkrGauge_0804CC38
	ldr r0, [r4, #0x54]
	cmp r0, #1
	bne _0804BCF2
	ldr r0, _0804BCDC @ =gEkrInitialHitSide
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	bne _0804BCE4
	ldr r1, _0804BCE0 @ =gEkrPids
	ldrb r0, [r1]
	ldrb r1, [r1, #1]
	bl StartBattleTalk
	b _0804BCEE
	.align 2, 0
_0804BCD0: .4byte gBg0Tm
_0804BCD4: .4byte 0x01000200
_0804BCD8: .4byte 0x02000038
_0804BCDC: .4byte gEkrInitialHitSide
_0804BCE0: .4byte gEkrPids
_0804BCE4:
	ldr r1, _0804BD00 @ =gEkrPids
	ldrb r0, [r1, #1]
	ldrb r1, [r1]
	bl StartBattleTalk
_0804BCEE:
	movs r0, #0
	str r0, [r4, #0x54]
_0804BCF2:
	ldr r0, _0804BD04 @ =EkrBattleWaitBattleQuote
	str r0, [r4, #0xc]
_0804BCF6:
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0804BD00: .4byte gEkrPids
_0804BD04: .4byte EkrBattleWaitBattleQuote

	thumb_func_start EkrBattleWaitBattleQuote
EkrBattleWaitBattleQuote: @ 0x0804BD08
	push {r4, lr}
	adds r4, r0, #0
	bl IsEventRunning
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0804BD42
	bl EfxPrepareScreenFx
	movs r0, #1
	bl EnableBgSync
	movs r0, #0
	movs r1, #7
	bl NewEkrWindowAppear
	movs r0, #0
	movs r1, #7
	movs r2, #0
	bl NewEkrNamewinAppear
	bl DisableEkrGauge
	bl EkrGauge_0804D61C
	bl EkrGauge_0804CC28
	ldr r0, _0804BD48 @ =EkrBattleWaitWindowAppear
	str r0, [r4, #0xc]
_0804BD42:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0804BD48: .4byte EkrBattleWaitWindowAppear

	thumb_func_start EkrBattleWaitWindowAppear
EkrBattleWaitWindowAppear: @ 0x0804BD4C
	push {r4, lr}
	adds r4, r0, #0
	bl CheckEkrWindowAppearUnexist
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne _0804BD64
	ldr r0, _0804BD6C @ =EkrBattlePreDragonIntro
	str r0, [r4, #0xc]
	movs r0, #0
	strh r0, [r4, #0x2c]
_0804BD64:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0804BD6C: .4byte EkrBattlePreDragonIntro

	thumb_func_start EkrBattlePreDragonIntro
EkrBattlePreDragonIntro: @ 0x0804BD70
	ldr r1, _0804BD84 @ =gEkrInitialHitSide
	movs r2, #0
	ldrsh r1, [r1, r2]
	str r1, [r0, #0x44]
	movs r1, #0
	str r1, [r0, #0x48]
	ldr r1, _0804BD88 @ =EkrBattleExecDragonIntro
	str r1, [r0, #0xc]
	bx lr
	.align 2, 0
_0804BD84: .4byte gEkrInitialHitSide
_0804BD88: .4byte EkrBattleExecDragonIntro

	thumb_func_start EkrBattleExecDragonIntro
EkrBattleExecDragonIntro: @ 0x0804BD8C
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x48]
	cmp r0, #2
	bne _0804BDA0
	ldr r0, _0804BD9C @ =EkrBattlePostDragonIntro
	str r0, [r4, #0xc]
	b _0804BDEE
	.align 2, 0
_0804BD9C: .4byte EkrBattlePostDragonIntro
_0804BDA0:
	ldr r0, [r4, #0x44]
	cmp r0, #0
	bne _0804BDCC
	ldr r0, _0804BDC4 @ =gAnims
	ldr r0, [r0]
	str r0, [r4, #0x5c]
	bl GetEkrDragonStatusType
	cmp r0, #0
	beq _0804BDBE
	ldr r0, [r4, #0x5c]
	bl NewEkrDragon
	ldr r0, _0804BDC8 @ =EkrBattleWaitDragonIntro
	str r0, [r4, #0xc]
_0804BDBE:
	movs r0, #1
	b _0804BDE6
	.align 2, 0
_0804BDC4: .4byte gAnims
_0804BDC8: .4byte EkrBattleWaitDragonIntro
_0804BDCC:
	ldr r0, _0804BDF4 @ =gAnims
	ldr r0, [r0, #8]
	str r0, [r4, #0x5c]
	bl GetEkrDragonStatusType
	cmp r0, #0
	beq _0804BDE4
	ldr r0, [r4, #0x5c]
	bl NewEkrDragon
	ldr r0, _0804BDF8 @ =EkrBattleWaitDragonIntro
	str r0, [r4, #0xc]
_0804BDE4:
	movs r0, #0
_0804BDE6:
	str r0, [r4, #0x44]
	ldr r0, [r4, #0x48]
	adds r0, #1
	str r0, [r4, #0x48]
_0804BDEE:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0804BDF4: .4byte gAnims
_0804BDF8: .4byte EkrBattleWaitDragonIntro

	thumb_func_start EkrBattleWaitDragonIntro
EkrBattleWaitDragonIntro: @ 0x0804BDFC
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x5c]
	bl EkrDragonIntroDone
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne _0804BE12
	ldr r0, _0804BE18 @ =EkrBattleExecDragonIntro
	str r0, [r4, #0xc]
_0804BE12:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0804BE18: .4byte EkrBattleExecDragonIntro

	thumb_func_start EkrBattlePostDragonIntro
EkrBattlePostDragonIntro: @ 0x0804BE1C
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0804BE48 @ =gEkrInitialHitSide
	movs r2, #0
	ldrsh r1, [r0, r2]
	ldr r0, _0804BE4C @ =gEkrInitPosReal
	ldr r0, [r0]
	cmp r1, r0
	beq _0804BE58
	ldr r1, _0804BE50 @ =gAnims
	lsls r0, r0, #3
	adds r0, r0, r1
	ldr r0, [r0]
	movs r1, #1
	rsbs r1, r1, #0
	bl sub_0804EC74
	movs r0, #0
	strh r0, [r4, #0x2c]
	ldr r0, _0804BE54 @ =sub_0804BE68
	b _0804BE5A
	.align 2, 0
_0804BE48: .4byte gEkrInitialHitSide
_0804BE4C: .4byte gEkrInitPosReal
_0804BE50: .4byte gAnims
_0804BE54: .4byte sub_0804BE68
_0804BE58:
	ldr r0, _0804BE64 @ =sub_0804BE84
_0804BE5A:
	str r0, [r4, #0xc]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0804BE64: .4byte sub_0804BE84

	thumb_func_start sub_0804BE68
sub_0804BE68: @ 0x0804BE68
	adds r1, r0, #0
	ldrh r0, [r1, #0x2c]
	adds r0, #1
	strh r0, [r1, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #8
	bne _0804BE7C
	ldr r0, _0804BE80 @ =sub_0804BE84
	str r0, [r1, #0xc]
_0804BE7C:
	bx lr
	.align 2, 0
_0804BE80: .4byte sub_0804BE84

	thumb_func_start sub_0804BE84
sub_0804BE84: @ 0x0804BE84
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r4, _0804BEC8 @ =gAnims
	ldr r0, [r4]
	bl sub_0804FE74
	ldr r0, [r4, #8]
	bl sub_0804FE74
	ldr r1, _0804BECC @ =0x0203E0BC
	movs r2, #0
	ldrsh r0, [r1, r2]
	movs r2, #2
	ldrsh r1, [r1, r2]
	bl sub_0805022C
	ldr r1, _0804BED0 @ =gBattleStats
	movs r0, #0x40
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	beq _0804BEB6
	ldr r0, [r4]
	bl sub_0804FFAC
_0804BEB6:
	ldr r0, [r4]
	bl sub_0804FB58
	ldr r0, _0804BED4 @ =sub_0804BED8
	str r0, [r5, #0xc]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0804BEC8: .4byte gAnims
_0804BECC: .4byte 0x0203E0BC
_0804BED0: .4byte gBattleStats
_0804BED4: .4byte sub_0804BED8

	thumb_func_start sub_0804BED8
sub_0804BED8: @ 0x0804BED8
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0804BEF0 @ =gpEkrTriangleUnits
	ldr r0, [r0]
	cmp r0, #0
	beq _0804BEFC
	ldr r0, _0804BEF4 @ =gAnims
	ldr r0, [r0, #8]
	bl sub_0806AC9C
	ldr r0, _0804BEF8 @ =sub_0804BF0C
	b _0804BEFE
	.align 2, 0
_0804BEF0: .4byte gpEkrTriangleUnits
_0804BEF4: .4byte gAnims
_0804BEF8: .4byte sub_0804BF0C
_0804BEFC:
	ldr r0, _0804BF08 @ =sub_0804BF34
_0804BEFE:
	str r0, [r4, #0xc]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0804BF08: .4byte sub_0804BF34

	thumb_func_start sub_0804BF0C
sub_0804BF0C: @ 0x0804BF0C
	push {r4, lr}
	adds r4, r0, #0
	bl sub_0806AC84
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne _0804BF28
	bl nullsub_10
	movs r0, #0x1e
	strh r0, [r4, #0x2c]
	ldr r0, _0804BF30 @ =sub_0804BF34
	str r0, [r4, #0xc]
_0804BF28:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0804BF30: .4byte sub_0804BF34

	thumb_func_start sub_0804BF34
sub_0804BF34: @ 0x0804BF34
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	ldrh r0, [r5, #0x2c]
	adds r0, #1
	movs r7, #0
	strh r0, [r5, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x1e
	ble _0804BFA0
	ldr r6, _0804BFA8 @ =0x0203DFE8
	ldrh r0, [r6]
	cmp r0, #1
	bne _0804BF70
	ldr r3, _0804BFAC @ =gAnims
	ldr r4, [r3]
	movs r2, #0x80
	lsls r2, r2, #8
	strh r2, [r4, #0x10]
	movs r0, #0x80
	lsls r0, r0, #7
	adds r1, r0, #0
	ldrh r0, [r4, #0xc]
	orrs r0, r1
	strh r0, [r4, #0xc]
	ldr r4, [r3, #4]
	strh r2, [r4, #0x10]
	ldrh r0, [r4, #0xc]
	orrs r1, r0
	strh r1, [r4, #0xc]
_0804BF70:
	ldrh r6, [r6, #2]
	cmp r6, #1
	bne _0804BF96
	ldr r3, _0804BFAC @ =gAnims
	ldr r4, [r3, #8]
	movs r2, #0x80
	lsls r2, r2, #8
	strh r2, [r4, #0x10]
	movs r0, #0x80
	lsls r0, r0, #7
	adds r1, r0, #0
	ldrh r0, [r4, #0xc]
	orrs r0, r1
	strh r0, [r4, #0xc]
	ldr r4, [r3, #0xc]
	strh r2, [r4, #0x10]
	ldrh r0, [r4, #0xc]
	orrs r1, r0
	strh r1, [r4, #0xc]
_0804BF96:
	ldr r0, _0804BFB0 @ =gBanimDoneFlag
	str r7, [r0]
	str r7, [r0, #4]
	ldr r0, _0804BFB4 @ =sub_0804BFB8
	str r0, [r5, #0xc]
_0804BFA0:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0804BFA8: .4byte 0x0203DFE8
_0804BFAC: .4byte gAnims
_0804BFB0: .4byte gBanimDoneFlag
_0804BFB4: .4byte sub_0804BFB8

	thumb_func_start sub_0804BFB8
sub_0804BFB8: @ 0x0804BFB8
	ldr r2, _0804BFC4 @ =gAnimC01Blocking
	movs r1, #0
	str r1, [r2]
	ldr r1, _0804BFC8 @ =sub_0804BFCC
	str r1, [r0, #0xc]
	bx lr
	.align 2, 0
_0804BFC4: .4byte gAnimC01Blocking
_0804BFC8: .4byte sub_0804BFCC

	thumb_func_start sub_0804BFCC
sub_0804BFCC: @ 0x0804BFCC
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0804BFE4 @ =gEkrDistanceType
	ldrh r0, [r0]
	cmp r0, #4
	bne _0804BFF0
	ldr r0, _0804BFE8 @ =gAnims
	ldr r0, [r0, #8]
	bl sub_08068A38
	ldr r0, _0804BFEC @ =sub_0804C008
	b _0804BFFA
	.align 2, 0
_0804BFE4: .4byte gEkrDistanceType
_0804BFE8: .4byte gAnims
_0804BFEC: .4byte sub_0804C008
_0804BFF0:
	adds r1, r4, #0
	adds r1, #0x29
	movs r0, #0
	strb r0, [r1]
	ldr r0, _0804C004 @ =sub_0804C034
_0804BFFA:
	str r0, [r4, #0xc]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0804C004: .4byte sub_0804C034

	thumb_func_start sub_0804C008
sub_0804C008: @ 0x0804C008
	push {r4, r5, lr}
	adds r5, r0, #0
	bl sub_08068A0C
	lsls r0, r0, #0x18
	asrs r4, r0, #0x18
	cmp r4, #1
	bne _0804C024
	bl sub_08068A24
	ldr r0, _0804C02C @ =gEkrPairExpGain
	strh r4, [r0]
	ldr r0, _0804C030 @ =EkrBattleExecEkrLvup
	str r0, [r5, #0xc]
_0804C024:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0804C02C: .4byte gEkrPairExpGain
_0804C030: .4byte EkrBattleExecEkrLvup

	thumb_func_start sub_0804C034
sub_0804C034: @ 0x0804C034
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	movs r4, #0
	ldr r0, _0804C064 @ =gpKeySt
	ldr r1, [r0]
	movs r0, #2
	ldrh r1, [r1, #4]
	ands r0, r1
	cmp r0, #0
	beq _0804C050
	adds r1, r6, #0
	adds r1, #0x29
	movs r0, #1
	strb r0, [r1]
_0804C050:
	ldr r0, _0804C068 @ =gEkrDistanceType
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #3
	beq _0804C10C
	cmp r0, #3
	ble _0804C06C
	cmp r0, #4
	beq _0804C118
	b _0804C11A
	.align 2, 0
_0804C064: .4byte gpKeySt
_0804C068: .4byte gEkrDistanceType
_0804C06C:
	cmp r0, #0
	blt _0804C11A
	ldr r0, _0804C0B4 @ =gBanimDoneFlag
	ldr r1, [r0]
	ldr r0, [r0, #4]
	adds r1, r1, r0
	cmp r1, #2
	bne _0804C11A
	bl GetBattleAnimArenaFlag
	cmp r0, #0
	beq _0804C118
	ldr r5, _0804C0B8 @ =gEkrPairExpGain
	ldr r0, _0804C0BC @ =gpEkrBattleUnitLeft
	ldr r0, [r0]
	adds r0, #0x6e
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	strh r0, [r5]
	ldr r0, _0804C0C0 @ =gpEkrBattleUnitRight
	ldr r0, [r0]
	adds r0, #0x6e
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	strh r0, [r5, #2]
	ldr r1, _0804C0C4 @ =gEkrPairHpInitial
	movs r2, #0
	ldrsh r0, [r1, r2]
	cmp r0, #0
	bne _0804C0C8
	movs r0, #1
	bl sub_0802F5B8
	b _0804C118
	.align 2, 0
_0804C0B4: .4byte gBanimDoneFlag
_0804C0B8: .4byte gEkrPairExpGain
_0804C0BC: .4byte gpEkrBattleUnitLeft
_0804C0C0: .4byte gpEkrBattleUnitRight
_0804C0C4: .4byte gEkrPairHpInitial
_0804C0C8:
	movs r2, #2
	ldrsh r0, [r1, r2]
	cmp r0, #0
	bne _0804C0DA
	movs r0, #2
_0804C0D2:
	bl sub_0802F5B8
	strh r4, [r5, #2]
	b _0804C118
_0804C0DA:
	adds r0, r6, #0
	adds r0, #0x29
	ldrb r0, [r0]
	cmp r0, #1
	bne _0804C0EC
	bl sub_08055D44
	movs r0, #4
	b _0804C0D2
_0804C0EC:
	bl sub_0802F5C4
	bl ParseBattleHitToBanimCmd
	bl AnimClearAll
	bl UpdateBanimFrame
	bl InitMainAnims
	strh r4, [r6, #0x2c]
	ldr r0, _0804C108 @ =sub_0804BF34
	str r0, [r6, #0xc]
	b _0804C11A
	.align 2, 0
_0804C108: .4byte sub_0804BF34
_0804C10C:
	ldr r0, _0804C128 @ =gBanimDoneFlag
	ldr r1, [r0]
	ldr r0, [r0, #4]
	adds r1, r1, r0
	cmp r1, #1
	bne _0804C11A
_0804C118:
	movs r4, #1
_0804C11A:
	cmp r4, #1
	bne _0804C122
	ldr r0, _0804C12C @ =sub_0804C130
	str r0, [r6, #0xc]
_0804C122:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0804C128: .4byte gBanimDoneFlag
_0804C12C: .4byte sub_0804C130

	thumb_func_start sub_0804C130
sub_0804C130: @ 0x0804C130
	adds r2, r0, #0
	adds r2, #0x29
	movs r1, #0
	strb r1, [r2]
	ldr r1, _0804C140 @ =sub_0804C144
	str r1, [r0, #0xc]
	bx lr
	.align 2, 0
_0804C140: .4byte sub_0804C144

	thumb_func_start sub_0804C144
sub_0804C144: @ 0x0804C144
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	ldr r0, _0804C1B0 @ =0x02017728
	ldr r0, [r0]
	cmp r0, #0
	bne _0804C1AA
	ldr r0, _0804C1B4 @ =0x02017738
	ldr r4, [r0]
	cmp r4, #0
	bne _0804C1AA
	bl sub_080523AC
	lsls r0, r0, #0x18
	asrs r6, r0, #0x18
	cmp r6, #1
	bne _0804C1AA
	strh r4, [r5, #0x2c]
	ldr r0, _0804C1B8 @ =sub_0804C1C8
	str r0, [r5, #0xc]
	ldr r4, _0804C1BC @ =gAnims
	ldr r0, [r4]
	bl CheckEkrDragonDead
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0804C1AA
	ldr r0, _0804C1C0 @ =gEkrPairExpGain
	movs r1, #0
	ldrsh r0, [r0, r1]
	movs r2, #1
	cmp r0, #0
	beq _0804C186
	movs r2, #0
_0804C186:
	ldr r3, _0804C1C4 @ =gEkrInitPosReal
	ldr r0, [r3]
	adds r1, r5, #0
	adds r1, #0x29
	cmp r2, r0
	beq _0804C194
	strb r6, [r1]
_0804C194:
	ldrb r1, [r1]
	cmp r1, #1
	bne _0804C1AA
	ldr r0, [r3]
	lsls r0, r0, #3
	adds r0, r0, r4
	ldr r0, [r0]
	movs r1, #1
	rsbs r1, r1, #0
	bl sub_0804EC74
_0804C1AA:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0804C1B0: .4byte 0x02017728
_0804C1B4: .4byte 0x02017738
_0804C1B8: .4byte sub_0804C1C8
_0804C1BC: .4byte gAnims
_0804C1C0: .4byte gEkrPairExpGain
_0804C1C4: .4byte gEkrInitPosReal

	thumb_func_start sub_0804C1C8
sub_0804C1C8: @ 0x0804C1C8
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x1d
	ble _0804C200
	bl GetBanimLinkArenaFlag
	cmp r0, #1
	beq _0804C1FC
	ldr r0, _0804C1F4 @ =gEkrPairExpGain
	movs r2, #0
	ldrsh r1, [r0, r2]
	movs r2, #2
	ldrsh r0, [r0, r2]
	cmn r1, r0
	beq _0804C1FC
	ldr r0, _0804C1F8 @ =sub_0804C20C
	b _0804C1FE
	.align 2, 0
_0804C1F4: .4byte gEkrPairExpGain
_0804C1F8: .4byte sub_0804C20C
_0804C1FC:
	ldr r0, _0804C208 @ =EkrBattleExecPopup
_0804C1FE:
	str r0, [r4, #0xc]
_0804C200:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0804C208: .4byte EkrBattleExecPopup

	thumb_func_start sub_0804C20C
sub_0804C20C: @ 0x0804C20C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	str r0, [sp, #8]
	ldr r0, _0804C314 @ =0x02019484
	movs r1, #0x80
	lsls r1, r1, #1
	adds r0, r0, r1
	mov sl, r0
	movs r0, #1
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	ldr r7, _0804C318 @ =gDispIo
	movs r0, #0x20
	ldrb r2, [r7, #1]
	orrs r0, r2
	movs r1, #0x41
	rsbs r1, r1, #0
	ands r0, r1
	movs r1, #0x7f
	ands r0, r1
	strb r0, [r7, #1]
	adds r1, r7, #0
	adds r1, #0x2d
	movs r0, #0
	strb r0, [r1]
	adds r0, r7, #0
	adds r0, #0x31
	movs r2, #0x94
	strb r2, [r0]
	subs r1, #1
	movs r0, #0xf0
	strb r0, [r1]
	adds r0, r7, #0
	adds r0, #0x30
	strb r2, [r0]
	movs r3, #1
	mov r8, r3
	mov r1, r8
	ldr r6, _0804C31C @ =0x030027C4
	ldrb r6, [r6]
	orrs r1, r6
	movs r0, #2
	mov sb, r0
	mov r2, sb
	orrs r1, r2
	movs r5, #4
	orrs r1, r5
	movs r4, #8
	orrs r1, r4
	movs r3, #0x10
	orrs r1, r3
	movs r6, #0x36
	mov r0, r8
	ldrb r2, [r6, r7]
	orrs r0, r2
	movs r2, #3
	rsbs r2, r2, #0
	ands r0, r2
	orrs r0, r5
	orrs r0, r4
	orrs r0, r3
	subs r2, #0x1e
	ands r1, r2
	ldr r3, _0804C31C @ =0x030027C4
	strb r1, [r3]
	ands r0, r2
	strb r0, [r6, r7]
	ldr r0, _0804C320 @ =0x081DF464
	ldr r1, _0804C324 @ =0x06002000
	movs r2, #0xc0
	lsls r2, r2, #2
	bl RegisterDataMove
	ldr r0, _0804C328 @ =0x081DFBC4
	ldr r1, _0804C32C @ =0x020238AC
	movs r2, #1
	str r2, [sp]
	adds r2, #0xff
	str r2, [sp, #4]
	movs r2, #0x12
	movs r3, #3
	bl EfxTmCpyBG
	ldr r0, _0804C330 @ =0x081DFC30
	ldr r1, _0804C334 @ =0x02022880
	movs r2, #8
	bl CpuFastSet
	movs r0, #2
	bl EnableBgSync
	bl EnablePalSync
	movs r1, #4
	rsbs r1, r1, #0
	adds r0, r1, #0
	ldrb r6, [r7, #0x10]
	ands r0, r6
	strb r0, [r7, #0x10]
	adds r0, r1, #0
	ldrb r2, [r7, #0xc]
	ands r0, r2
	mov r3, r8
	orrs r0, r3
	strb r0, [r7, #0xc]
	ldrb r6, [r7, #0x14]
	ands r1, r6
	mov r0, sb
	orrs r1, r0
	strb r1, [r7, #0x14]
	movs r0, #3
	ldrb r1, [r7, #0x18]
	orrs r0, r1
	strb r0, [r7, #0x18]
	movs r0, #1
	bl EkrGauge_0804CC68
	ldr r0, _0804C338 @ =gEkrPairExpGain
	movs r2, #0
	ldrsh r0, [r0, r2]
	cmp r0, #0
	beq _0804C340
	ldr r0, _0804C33C @ =gEkrPairExpPrevious
	movs r3, #0
	ldrsh r0, [r0, r3]
	b _0804C346
	.align 2, 0
_0804C314: .4byte 0x02019484
_0804C318: .4byte gDispIo
_0804C31C: .4byte 0x030027C4
_0804C320: .4byte 0x081DF464
_0804C324: .4byte 0x06002000
_0804C328: .4byte 0x081DFBC4
_0804C32C: .4byte 0x020238AC
_0804C330: .4byte 0x081DFC30
_0804C334: .4byte 0x02022880
_0804C338: .4byte gEkrPairExpGain
_0804C33C: .4byte gEkrPairExpPrevious
_0804C340:
	ldr r0, _0804C3DC @ =gEkrPairExpPrevious
	movs r6, #2
	ldrsh r0, [r0, r6]
_0804C346:
	movs r1, #0x64
	bl DivRem
	adds r6, r0, #0
	movs r1, #0xa
	bl Div
	adds r5, r0, #0
	lsls r0, r5, #2
	adds r0, r0, r5
	lsls r0, r0, #1
	subs r4, r6, r0
	cmp r5, #0
	bne _0804C364
	movs r5, #0xa
_0804C364:
	ldr r0, _0804C3E0 @ =0x02019484
	adds r1, r6, #0
	bl EkrModifyBarfx
	lsls r5, r5, #5
	mov r8, r5
	lsls r4, r4, #5
	mov sb, r4
	mov r5, sl
	ldr r4, _0804C3E0 @ =0x02019484
	ldr r7, _0804C3E4 @ =0x081DF764
	movs r6, #0xc
_0804C37C:
	ldrh r1, [r4]
	lsls r0, r1, #5
	adds r0, r0, r7
	adds r1, r5, #0
	movs r2, #8
	bl CpuFastSet
	adds r5, #0x20
	adds r4, #2
	subs r6, #1
	cmp r6, #0
	bge _0804C37C
	ldr r4, _0804C3E8 @ =0x081DFA64
	mov r2, r8
	adds r0, r2, r4
	movs r1, #0xd0
	lsls r1, r1, #1
	add r1, sl
	movs r2, #8
	bl CpuFastSet
	add r4, sb
	movs r1, #0xe0
	lsls r1, r1, #1
	add r1, sl
	adds r0, r4, #0
	movs r2, #8
	bl CpuFastSet
	ldr r1, _0804C3EC @ =0x060020E0
	movs r2, #0xf0
	lsls r2, r2, #1
	mov r0, sl
	bl RegisterDataMove
	movs r0, #0
	ldr r3, [sp, #8]
	strh r0, [r3, #0x2c]
	ldr r0, _0804C3F0 @ =sub_0804C3F4
	str r0, [r3, #0xc]
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0804C3DC: .4byte gEkrPairExpPrevious
_0804C3E0: .4byte 0x02019484
_0804C3E4: .4byte 0x081DF764
_0804C3E8: .4byte 0x081DFA64
_0804C3EC: .4byte 0x060020E0
_0804C3F0: .4byte sub_0804C3F4

	thumb_func_start sub_0804C3F4
sub_0804C3F4: @ 0x0804C3F4
	adds r2, r0, #0
	ldrh r1, [r2, #0x2c]
	adds r1, #1
	strh r1, [r2, #0x2c]
	lsls r0, r1, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0xc
	ble _0804C414
	movs r0, #0
	strh r0, [r2, #0x2c]
	ldr r0, _0804C410 @ =sub_0804C440
	str r0, [r2, #0xc]
	b _0804C43A
	.align 2, 0
_0804C410: .4byte sub_0804C440
_0804C414:
	ldr r3, _0804C43C @ =gDispIo
	adds r2, r3, #0
	adds r2, #0x2d
	movs r0, #0
	strb r0, [r2]
	movs r2, #0x6c
	rsbs r2, r2, #0
	adds r0, r2, #0
	subs r0, r0, r1
	adds r2, r3, #0
	adds r2, #0x31
	strb r0, [r2]
	subs r2, #5
	movs r0, #0xf0
	strb r0, [r2]
	subs r1, #0x6c
	adds r0, r3, #0
	adds r0, #0x30
	strb r1, [r0]
_0804C43A:
	bx lr
	.align 2, 0
_0804C43C: .4byte gDispIo

	thumb_func_start sub_0804C440
sub_0804C440: @ 0x0804C440
	push {r4, lr}
	adds r1, r0, #0
	ldrh r0, [r1, #0x2c]
	adds r0, #1
	strh r0, [r1, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0xa
	ble _0804C49C
	ldr r2, _0804C464 @ =gEkrPairExpGain
	ldrh r3, [r2]
	movs r4, #0
	ldrsh r0, [r2, r4]
	cmp r0, #0
	beq _0804C46C
	ldr r0, _0804C468 @ =gEkrPairExpPrevious
	ldrh r0, [r0]
	b _0804C47A
	.align 2, 0
_0804C464: .4byte gEkrPairExpGain
_0804C468: .4byte gEkrPairExpPrevious
_0804C46C:
	ldrh r3, [r2, #2]
	movs r4, #2
	ldrsh r0, [r2, r4]
	cmp r0, #0
	beq _0804C480
	ldr r0, _0804C4A4 @ =gEkrPairExpPrevious
	ldrh r0, [r0, #2]
_0804C47A:
	strh r0, [r1, #0x2c]
	adds r0, r0, r3
	strh r0, [r1, #0x2e]
_0804C480:
	ldr r0, _0804C4A8 @ =sub_0804C4AC
	str r0, [r1, #0xc]
	movs r4, #0xe5
	lsls r4, r4, #2
	movs r1, #0x80
	lsls r1, r1, #1
	adds r0, r4, #0
	bl EfxPlaySE
	adds r0, r4, #0
	movs r1, #0x78
	movs r2, #0
	bl M4aPlayWithPostionCtrl
_0804C49C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0804C4A4: .4byte gEkrPairExpPrevious
_0804C4A8: .4byte sub_0804C4AC

	thumb_func_start sub_0804C4AC
sub_0804C4AC: @ 0x0804C4AC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	adds r7, r0, #0
	ldr r0, _0804C574 @ =0x02019484
	mov r8, r0
	movs r1, #0x80
	lsls r1, r1, #1
	add r1, r8
	mov sl, r1
	movs r2, #0x2c
	ldrsh r0, [r7, r2]
	movs r1, #0x64
	bl DivRem
	adds r5, r0, #0
	movs r1, #0xa
	bl Div
	adds r4, r0, #0
	lsls r0, r4, #2
	adds r0, r0, r4
	lsls r0, r0, #1
	subs r6, r5, r0
	cmp r4, #0
	bne _0804C4E8
	movs r4, #0xa
_0804C4E8:
	mov r0, r8
	adds r1, r5, #0
	bl EkrModifyBarfx
	lsls r4, r4, #5
	mov sb, r4
	lsls r6, r6, #5
	str r6, [sp]
	mov r6, sl
	mov r5, r8
	ldr r0, _0804C578 @ =0x081DF764
	mov r8, r0
	movs r4, #0xc
_0804C502:
	ldrh r1, [r5]
	lsls r0, r1, #5
	add r0, r8
	adds r1, r6, #0
	movs r2, #8
	bl CpuFastSet
	adds r6, #0x20
	adds r5, #2
	subs r4, #1
	cmp r4, #0
	bge _0804C502
	ldr r4, _0804C57C @ =0x081DFA64
	mov r2, sb
	adds r0, r2, r4
	movs r1, #0xd0
	lsls r1, r1, #1
	add r1, sl
	movs r2, #8
	bl CpuFastSet
	ldr r0, [sp]
	adds r4, r0, r4
	movs r1, #0xe0
	lsls r1, r1, #1
	add r1, sl
	adds r0, r4, #0
	movs r2, #8
	bl CpuFastSet
	ldr r1, _0804C580 @ =0x060020E0
	movs r2, #0xf0
	lsls r2, r2, #1
	mov r0, sl
	bl RegisterDataMove
	ldrh r0, [r7, #0x2c]
	adds r0, #1
	strh r0, [r7, #0x2c]
	lsls r0, r0, #0x10
	ldrh r2, [r7, #0x2e]
	lsls r1, r2, #0x10
	cmp r0, r1
	ble _0804C562
	movs r0, #0
	strh r0, [r7, #0x2c]
	ldr r0, _0804C584 @ =sub_0804C588
	str r0, [r7, #0xc]
_0804C562:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0804C574: .4byte 0x02019484
_0804C578: .4byte 0x081DF764
_0804C57C: .4byte 0x081DFA64
_0804C580: .4byte 0x060020E0
_0804C584: .4byte sub_0804C588

	thumb_func_start sub_0804C588
sub_0804C588: @ 0x0804C588
	push {r4, lr}
	adds r4, r0, #0
	movs r1, #0x2c
	ldrsh r0, [r4, r1]
	cmp r0, #0
	bne _0804C59C
	movs r0, #0xe5
	lsls r0, r0, #2
	bl DoM4aSongNumStop
_0804C59C:
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x1e
	ble _0804C5B2
	movs r0, #0
	strh r0, [r4, #0x2c]
	ldr r0, _0804C5B8 @ =sub_0804C5BC
	str r0, [r4, #0xc]
_0804C5B2:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0804C5B8: .4byte sub_0804C5BC

	thumb_func_start sub_0804C5BC
sub_0804C5BC: @ 0x0804C5BC
	adds r1, r0, #0
	ldrh r2, [r1, #0x2c]
	adds r2, #1
	strh r2, [r1, #0x2c]
	lsls r0, r2, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0xc
	ble _0804C5DC
	movs r0, #0
	strh r0, [r1, #0x2c]
	ldr r0, _0804C5D8 @ =EkrBattleLvupHanlder
	str r0, [r1, #0xc]
	b _0804C602
	.align 2, 0
_0804C5D8: .4byte EkrBattleLvupHanlder
_0804C5DC:
	ldr r3, _0804C604 @ =gDispIo
	adds r1, r3, #0
	adds r1, #0x2d
	movs r0, #0
	strb r0, [r1]
	adds r0, r2, #0
	subs r0, #0x78
	adds r1, #4
	strb r0, [r1]
	subs r1, #5
	movs r0, #0xf0
	strb r0, [r1]
	movs r1, #0x60
	rsbs r1, r1, #0
	adds r0, r1, #0
	subs r0, r0, r2
	adds r1, r3, #0
	adds r1, #0x30
	strb r0, [r1]
_0804C602:
	bx lr
	.align 2, 0
_0804C604: .4byte gDispIo

	thumb_func_start EkrBattleLvupHanlder
EkrBattleLvupHanlder: @ 0x0804C608
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x18
	bne _0804C64C
	ldr r2, _0804C630 @ =gEkrPairExpGain
	movs r1, #0
	ldrsh r0, [r2, r1]
	cmp r0, #0
	beq _0804C638
	ldr r0, _0804C634 @ =gEkrPairExpPrevious
	movs r3, #0
	ldrsh r1, [r0, r3]
	movs r3, #0
	ldrsh r0, [r2, r3]
	b _0804C642
	.align 2, 0
_0804C630: .4byte gEkrPairExpGain
_0804C634: .4byte gEkrPairExpPrevious
_0804C638:
	ldr r0, _0804C6B8 @ =gEkrPairExpPrevious
	movs r3, #2
	ldrsh r1, [r0, r3]
	movs r3, #2
	ldrsh r0, [r2, r3]
_0804C642:
	adds r1, r1, r0
	cmp r1, #0x63
	ble _0804C64C
	bl NewEkrLvlupFan
_0804C64C:
	movs r1, #0x2c
	ldrsh r0, [r4, r1]
	cmp r0, #0x28
	ble _0804C6E4
	bl SpellFx_ClearBG1
	movs r0, #0
	bl EkrGauge_0804CC68
	ldr r3, _0804C6BC @ =gDispIo
	movs r1, #4
	rsbs r1, r1, #0
	adds r0, r1, #0
	ldrb r2, [r3, #0xc]
	ands r0, r2
	strb r0, [r3, #0xc]
	adds r0, r1, #0
	ldrb r2, [r3, #0x10]
	ands r0, r2
	movs r2, #1
	orrs r0, r2
	strb r0, [r3, #0x10]
	ldrb r0, [r3, #0x14]
	ands r1, r0
	movs r0, #2
	orrs r1, r0
	strb r1, [r3, #0x14]
	movs r0, #3
	ldrb r1, [r3, #0x18]
	orrs r0, r1
	strb r0, [r3, #0x18]
	adds r1, r3, #0
	adds r1, #0x2d
	movs r0, #0
	strb r0, [r1]
	adds r1, #4
	strb r0, [r1]
	subs r1, #5
	movs r0, #0xf0
	strb r0, [r1]
	adds r1, #4
	movs r0, #0xa0
	strb r0, [r1]
	ldr r2, _0804C6C0 @ =gEkrPairExpGain
	movs r3, #0
	ldrsh r0, [r2, r3]
	cmp r0, #0
	beq _0804C6C4
	ldr r0, _0804C6B8 @ =gEkrPairExpPrevious
	movs r3, #0
	ldrsh r1, [r0, r3]
	movs r3, #0
	ldrsh r0, [r2, r3]
	b _0804C6CE
	.align 2, 0
_0804C6B8: .4byte gEkrPairExpPrevious
_0804C6BC: .4byte gDispIo
_0804C6C0: .4byte gEkrPairExpGain
_0804C6C4:
	ldr r0, _0804C6D8 @ =gEkrPairExpPrevious
	movs r3, #2
	ldrsh r1, [r0, r3]
	movs r3, #2
	ldrsh r0, [r2, r3]
_0804C6CE:
	adds r1, r1, r0
	cmp r1, #0x63
	ble _0804C6E0
	ldr r0, _0804C6DC @ =EkrBattleExecEkrLvup
	b _0804C6E2
	.align 2, 0
_0804C6D8: .4byte gEkrPairExpPrevious
_0804C6DC: .4byte EkrBattleExecEkrLvup
_0804C6E0:
	ldr r0, _0804C6EC @ =EkrBattleExecPopup
_0804C6E2:
	str r0, [r4, #0xc]
_0804C6E4:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0804C6EC: .4byte EkrBattleExecPopup

	thumb_func_start EkrBattleExecEkrLvup
EkrBattleExecEkrLvup: @ 0x0804C6F0
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0804C704 @ =gEkrPairExpGain
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	beq _0804C70C
	ldr r0, _0804C708 @ =gAnims
	ldr r0, [r0]
	b _0804C710
	.align 2, 0
_0804C704: .4byte gEkrPairExpGain
_0804C708: .4byte gAnims
_0804C70C:
	ldr r0, _0804C720 @ =gAnims
	ldr r0, [r0, #8]
_0804C710:
	bl NewEkrLevelup
	ldr r0, _0804C724 @ =EkrBattleWaitLvup
	str r0, [r4, #0xc]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0804C720: .4byte gAnims
_0804C724: .4byte EkrBattleWaitLvup

	thumb_func_start EkrBattleWaitLvup
EkrBattleWaitLvup: @ 0x0804C728
	push {r4, lr}
	adds r4, r0, #0
	bl CheckEkrLvupDone
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne _0804C740
	bl EndEkrLevelUp
	ldr r0, _0804C748 @ =EkrBattleExecPopup
	str r0, [r4, #0xc]
_0804C740:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0804C748: .4byte EkrBattleExecPopup

	thumb_func_start EkrBattleExecPopup
EkrBattleExecPopup: @ 0x0804C74C
	push {r4, lr}
	adds r4, r0, #0
	bl NewEkrPopup
	ldr r0, _0804C760 @ =EkrBattleWaitPopup
	str r0, [r4, #0xc]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0804C760: .4byte EkrBattleWaitPopup

	thumb_func_start EkrBattleWaitPopup
EkrBattleWaitPopup: @ 0x0804C764
	push {r4, lr}
	adds r4, r0, #0
	bl CheckEkrPopupDone
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne _0804C77C
	bl EndEkrPopup
	ldr r0, _0804C784 @ =EkrBattlePrepareEnding
	str r0, [r4, #0xc]
_0804C77C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0804C784: .4byte EkrBattlePrepareEnding

	thumb_func_start EkrBattlePrepareEnding
EkrBattlePrepareEnding: @ 0x0804C788
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r4, _0804C7B8 @ =gAnims
	ldr r0, [r4]
	bl EndEfxStatusUnits
	ldr r0, [r4, #8]
	bl EndEfxStatusUnits
	bl EndProcEfxWeaponIcon
	bl EndEfxHPBarColorChange
	ldr r0, _0804C7BC @ =gEkrInitialHitSide
	movs r1, #0
	ldrsh r0, [r0, r1]
	str r0, [r5, #0x44]
	movs r0, #0
	str r0, [r5, #0x48]
	ldr r0, _0804C7C0 @ =EkrBattleStartDragonEnding
	str r0, [r5, #0xc]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0804C7B8: .4byte gAnims
_0804C7BC: .4byte gEkrInitialHitSide
_0804C7C0: .4byte EkrBattleStartDragonEnding

	thumb_func_start EkrBattleStartDragonEnding
EkrBattleStartDragonEnding: @ 0x0804C7C4
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x48]
	cmp r0, #2
	bne _0804C7D8
	ldr r0, _0804C7D4 @ =EkrBattlePostDragonEnding
	str r0, [r4, #0xc]
	b _0804C826
	.align 2, 0
_0804C7D4: .4byte EkrBattlePostDragonEnding
_0804C7D8:
	ldr r0, [r4, #0x44]
	cmp r0, #0
	bne _0804C804
	ldr r0, _0804C7FC @ =gAnims
	ldr r0, [r0]
	str r0, [r4, #0x5c]
	bl GetEkrDragonStatusType
	cmp r0, #0
	beq _0804C7F6
	ldr r0, [r4, #0x5c]
	bl SetEkrDragonExit
	ldr r0, _0804C800 @ =EkrBattleWaitDragonEnding
	str r0, [r4, #0xc]
_0804C7F6:
	movs r0, #1
	b _0804C81E
	.align 2, 0
_0804C7FC: .4byte gAnims
_0804C800: .4byte EkrBattleWaitDragonEnding
_0804C804:
	ldr r0, _0804C82C @ =gAnims
	ldr r0, [r0, #8]
	str r0, [r4, #0x5c]
	bl GetEkrDragonStatusType
	cmp r0, #0
	beq _0804C81C
	ldr r0, [r4, #0x5c]
	bl SetEkrDragonExit
	ldr r0, _0804C830 @ =EkrBattleWaitDragonEnding
	str r0, [r4, #0xc]
_0804C81C:
	movs r0, #0
_0804C81E:
	str r0, [r4, #0x44]
	ldr r0, [r4, #0x48]
	adds r0, #1
	str r0, [r4, #0x48]
_0804C826:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0804C82C: .4byte gAnims
_0804C830: .4byte EkrBattleWaitDragonEnding

	thumb_func_start EkrBattleWaitDragonEnding
EkrBattleWaitDragonEnding: @ 0x0804C834
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x5c]
	bl CheckEkrDragonEndingDone
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne _0804C84A
	ldr r0, _0804C850 @ =EkrBattleStartDragonEnding
	str r0, [r4, #0xc]
_0804C84A:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0804C850: .4byte EkrBattleStartDragonEnding

	thumb_func_start EkrBattlePostDragonEnding
EkrBattlePostDragonEnding: @ 0x0804C854
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, _0804C880 @ =gEkrBattleEndFlag
	movs r0, #1
	str r0, [r1]
	ldr r0, _0804C884 @ =gEkrDebugModeMaybe
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	bne _0804C876
	movs r0, #2
	movs r1, #7
	movs r2, #0
	bl NewEkrNamewinAppear
	bl EkrRestoreBGM
_0804C876:
	ldr r0, _0804C888 @ =EkrBattlePostEndDelay
	str r0, [r4, #0xc]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0804C880: .4byte gEkrBattleEndFlag
_0804C884: .4byte gEkrDebugModeMaybe
_0804C888: .4byte EkrBattlePostEndDelay

	thumb_func_start EkrBattlePostEndDelay
EkrBattlePostEndDelay: @ 0x0804C88C
	bx lr
	.align 2, 0
