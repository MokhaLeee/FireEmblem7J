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

	thumb_func_start EkrBattleDeamonCallBack
EkrBattleDeamonCallBack: @ 0x0804B9DC
	push {lr}
	ldr r1, _0804B9EC @ =0x0203DFD8
	movs r0, #0
	str r0, [r1]
	bl sub_08015794
	pop {r0}
	bx r0
	.align 2, 0
_0804B9EC: .4byte 0x0203DFD8

	thumb_func_start nullsub_45
nullsub_45: @ 0x0804B9F0
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
	ldr r0, _0804BA48 @ =0x02017724
	movs r1, #0
	str r1, [r0]
	ldr r0, _0804BA4C @ =0x02000018
	str r1, [r0]
	ldr r0, _0804BA50 @ =0x0200001C
	str r1, [r0]
	ldr r0, _0804BA54 @ =0x02000020
	str r1, [r0]
	ldr r0, _0804BA58 @ =0x02000024
	str r1, [r0]
	ldr r0, _0804BA5C @ =0x0203DFE0
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	bne _0804BA34
	bl sub_08068634
_0804BA34:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0804BA3C: .4byte 0x02000064
_0804BA40: .4byte 0x08C09D08
_0804BA44: .4byte InBattleMainRoutine
_0804BA48: .4byte 0x02017724
_0804BA4C: .4byte 0x02000018
_0804BA50: .4byte 0x0200001C
_0804BA54: .4byte 0x02000020
_0804BA58: .4byte 0x02000024
_0804BA5C: .4byte 0x0203DFE0

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
	ldr r0, _0804BAA4 @ =0x02017724
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
_0804BAA4: .4byte 0x02017724
_0804BAA8:
	ldr r0, _0804BAB4 @ =0x0203DFE0
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	bne _0804BAE4
	b _0804BAC2
	.align 2, 0
_0804BAB4: .4byte 0x0203DFE0
_0804BAB8:
	ldr r0, _0804BAD0 @ =0x0203DFE0
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
_0804BAD0: .4byte 0x0203DFE0
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
	bl sub_08067EB0
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
	ldr r1, _0804BB78 @ =0x0201FAF8
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
_0804BB78: .4byte 0x0201FAF8
_0804BB7C: .4byte 0x02000018

	thumb_func_start nullsub_46
nullsub_46: @ 0x0804BB80
	bx lr
	.align 2, 0

	thumb_func_start sub_0804BB84
sub_0804BB84: @ 0x0804BB84
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, _0804BBA4 @ =0x0201FB00
	movs r0, #0
	str r0, [r1]
	ldr r0, _0804BBA8 @ =0x02017744
	ldr r0, [r0]
	cmp r0, #0
	bne _0804BBB6
	ldr r0, _0804BBAC @ =0x0203E004
	ldrh r0, [r0]
	cmp r0, #1
	bne _0804BBB0
	movs r0, #0x20
	rsbs r0, r0, #0
	b _0804BBB4
	.align 2, 0
_0804BBA4: .4byte 0x0201FB00
_0804BBA8: .4byte 0x02017744
_0804BBAC: .4byte 0x0203E004
_0804BBB0:
	movs r0, #0xf0
	rsbs r0, r0, #0
_0804BBB4:
	str r0, [r1]
_0804BBB6:
	bl InitBothAIS
	bl sub_0806546C
	ldr r0, _0804BBD0 @ =0x02000024
	movs r1, #1
	str r1, [r0]
	bl sub_08055CD8
	cmp r0, #1
	bne _0804BBD4
	movs r0, #0
	b _0804BBD6
	.align 2, 0
_0804BBD0: .4byte 0x02000024
_0804BBD4:
	movs r0, #0x1e
_0804BBD6:
	strh r0, [r4, #0x2c]
	ldr r0, _0804BBEC @ =0x0203DFE4
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	bne _0804BBF4
	ldr r1, _0804BBF0 @ =0x0203E074
	ldrb r0, [r1]
	ldrb r1, [r1, #1]
	b _0804BBFA
	.align 2, 0
_0804BBEC: .4byte 0x0203DFE4
_0804BBF0: .4byte 0x0203E074
_0804BBF4:
	ldr r1, _0804BC14 @ =0x0203E074
	ldrb r0, [r1, #1]
	ldrb r1, [r1]
_0804BBFA:
	bl sub_08079BC8
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
_0804BC14: .4byte 0x0203E074

	thumb_func_start sub_0804BC18
sub_0804BC18: @ 0x0804BC18
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
	bl sub_08052278
	movs r0, #1
	movs r1, #7
	movs r2, #0
	bl sub_0805235C
	ldr r0, _0804BC54 @ =sub_0804BC6C
	b _0804BC5A
	.align 2, 0
_0804BC54: .4byte sub_0804BC6C
_0804BC58:
	ldr r0, _0804BC68 @ =sub_0804BD70
_0804BC5A:
	str r0, [r4, #0xc]
	movs r0, #0
	strh r0, [r4, #0x2c]
_0804BC60:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0804BC68: .4byte sub_0804BD70

	thumb_func_start sub_0804BC6C
sub_0804BC6C: @ 0x0804BC6C
	push {r4, lr}
	sub sp, #4
	adds r4, r0, #0
	bl sub_080522C8
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne _0804BCF6
	bl sub_0804CCC0
	bl sub_0804D60C
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
	bl sub_0804CC38
	ldr r0, [r4, #0x54]
	cmp r0, #1
	bne _0804BCF2
	ldr r0, _0804BCDC @ =0x0203DFE4
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	bne _0804BCE4
	ldr r1, _0804BCE0 @ =0x0203E074
	ldrb r0, [r1]
	ldrb r1, [r1, #1]
	bl sub_08079C34
	b _0804BCEE
	.align 2, 0
_0804BCD0: .4byte gBg0Tm
_0804BCD4: .4byte 0x01000200
_0804BCD8: .4byte 0x02000038
_0804BCDC: .4byte 0x0203DFE4
_0804BCE0: .4byte 0x0203E074
_0804BCE4:
	ldr r1, _0804BD00 @ =0x0203E074
	ldrb r0, [r1, #1]
	ldrb r1, [r1]
	bl sub_08079C34
_0804BCEE:
	movs r0, #0
	str r0, [r4, #0x54]
_0804BCF2:
	ldr r0, _0804BD04 @ =sub_0804BD08
	str r0, [r4, #0xc]
_0804BCF6:
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0804BD00: .4byte 0x0203E074
_0804BD04: .4byte sub_0804BD08

	thumb_func_start sub_0804BD08
sub_0804BD08: @ 0x0804BD08
	push {r4, lr}
	adds r4, r0, #0
	bl sub_0800EC2C
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0804BD42
	bl sub_0804D9B0
	movs r0, #1
	bl EnableBgSync
	movs r0, #0
	movs r1, #7
	bl sub_08052278
	movs r0, #0
	movs r1, #7
	movs r2, #0
	bl sub_0805235C
	bl sub_0804CCD0
	bl sub_0804D61C
	bl sub_0804CC28
	ldr r0, _0804BD48 @ =sub_0804BD4C
	str r0, [r4, #0xc]
_0804BD42:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0804BD48: .4byte sub_0804BD4C

	thumb_func_start sub_0804BD4C
sub_0804BD4C: @ 0x0804BD4C
	push {r4, lr}
	adds r4, r0, #0
	bl sub_080522C8
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne _0804BD64
	ldr r0, _0804BD6C @ =sub_0804BD70
	str r0, [r4, #0xc]
	movs r0, #0
	strh r0, [r4, #0x2c]
_0804BD64:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0804BD6C: .4byte sub_0804BD70

	thumb_func_start sub_0804BD70
sub_0804BD70: @ 0x0804BD70
	ldr r1, _0804BD84 @ =0x0203DFE4
	movs r2, #0
	ldrsh r1, [r1, r2]
	str r1, [r0, #0x44]
	movs r1, #0
	str r1, [r0, #0x48]
	ldr r1, _0804BD88 @ =sub_0804BD8C
	str r1, [r0, #0xc]
	bx lr
	.align 2, 0
_0804BD84: .4byte 0x0203DFE4
_0804BD88: .4byte sub_0804BD8C

	thumb_func_start sub_0804BD8C
sub_0804BD8C: @ 0x0804BD8C
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x48]
	cmp r0, #2
	bne _0804BDA0
	ldr r0, _0804BD9C @ =sub_0804BE1C
	str r0, [r4, #0xc]
	b _0804BDEE
	.align 2, 0
_0804BD9C: .4byte sub_0804BE1C
_0804BDA0:
	ldr r0, [r4, #0x44]
	cmp r0, #0
	bne _0804BDCC
	ldr r0, _0804BDC4 @ =gAnims
	ldr r0, [r0]
	str r0, [r4, #0x5c]
	bl sub_0806527C
	cmp r0, #0
	beq _0804BDBE
	ldr r0, [r4, #0x5c]
	bl sub_08065400
	ldr r0, _0804BDC8 @ =sub_0804BDFC
	str r0, [r4, #0xc]
_0804BDBE:
	movs r0, #1
	b _0804BDE6
	.align 2, 0
_0804BDC4: .4byte gAnims
_0804BDC8: .4byte sub_0804BDFC
_0804BDCC:
	ldr r0, _0804BDF4 @ =gAnims
	ldr r0, [r0, #8]
	str r0, [r4, #0x5c]
	bl sub_0806527C
	cmp r0, #0
	beq _0804BDE4
	ldr r0, [r4, #0x5c]
	bl sub_08065400
	ldr r0, _0804BDF8 @ =sub_0804BDFC
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
_0804BDF8: .4byte sub_0804BDFC

	thumb_func_start sub_0804BDFC
sub_0804BDFC: @ 0x0804BDFC
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x5c]
	bl sub_080653C8
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne _0804BE12
	ldr r0, _0804BE18 @ =sub_0804BD8C
	str r0, [r4, #0xc]
_0804BE12:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0804BE18: .4byte sub_0804BD8C

	thumb_func_start sub_0804BE1C
sub_0804BE1C: @ 0x0804BE1C
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0804BE48 @ =0x0203DFE4
	movs r2, #0
	ldrsh r1, [r0, r2]
	ldr r0, _0804BE4C @ =0x02017744
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
_0804BE48: .4byte 0x0203DFE4
_0804BE4C: .4byte 0x02017744
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
	ldr r0, _0804BEF0 @ =0x0203E078
	ldr r0, [r0]
	cmp r0, #0
	beq _0804BEFC
	ldr r0, _0804BEF4 @ =gAnims
	ldr r0, [r0, #8]
	bl sub_0806AC9C
	ldr r0, _0804BEF8 @ =sub_0804BF0C
	b _0804BEFE
	.align 2, 0
_0804BEF0: .4byte 0x0203E078
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
	ldr r0, _0804BFB0 @ =0x0201FAF8
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
_0804BFB0: .4byte 0x0201FAF8
_0804BFB4: .4byte sub_0804BFB8

	thumb_func_start sub_0804BFB8
sub_0804BFB8: @ 0x0804BFB8
	ldr r2, _0804BFC4 @ =0x02000024
	movs r1, #0
	str r1, [r2]
	ldr r1, _0804BFC8 @ =sub_0804BFCC
	str r1, [r0, #0xc]
	bx lr
	.align 2, 0
_0804BFC4: .4byte 0x02000024
_0804BFC8: .4byte sub_0804BFCC

	thumb_func_start sub_0804BFCC
sub_0804BFCC: @ 0x0804BFCC
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0804BFE4 @ =0x0203E004
	ldrh r0, [r0]
	cmp r0, #4
	bne _0804BFF0
	ldr r0, _0804BFE8 @ =gAnims
	ldr r0, [r0, #8]
	bl sub_08068A38
	ldr r0, _0804BFEC @ =sub_0804C008
	b _0804BFFA
	.align 2, 0
_0804BFE4: .4byte 0x0203E004
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
	ldr r0, _0804C02C @ =0x0203E0AC
	strh r4, [r0]
	ldr r0, _0804C030 @ =sub_0804C6F0
	str r0, [r5, #0xc]
_0804C024:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0804C02C: .4byte 0x0203E0AC
_0804C030: .4byte sub_0804C6F0

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
	ldr r0, _0804C068 @ =0x0203E004
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
_0804C068: .4byte 0x0203E004
_0804C06C:
	cmp r0, #0
	blt _0804C11A
	ldr r0, _0804C0B4 @ =0x0201FAF8
	ldr r1, [r0]
	ldr r0, [r0, #4]
	adds r1, r1, r0
	cmp r1, #2
	bne _0804C11A
	bl sub_08055CD8
	cmp r0, #0
	beq _0804C118
	ldr r5, _0804C0B8 @ =0x0203E0AC
	ldr r0, _0804C0BC @ =0x0203E06C
	ldr r0, [r0]
	adds r0, #0x6e
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	strh r0, [r5]
	ldr r0, _0804C0C0 @ =0x0203E070
	ldr r0, [r0]
	adds r0, #0x6e
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	strh r0, [r5, #2]
	ldr r1, _0804C0C4 @ =0x0203E090
	movs r2, #0
	ldrsh r0, [r1, r2]
	cmp r0, #0
	bne _0804C0C8
	movs r0, #1
	bl sub_0802F5B8
	b _0804C118
	.align 2, 0
_0804C0B4: .4byte 0x0201FAF8
_0804C0B8: .4byte 0x0203E0AC
_0804C0BC: .4byte 0x0203E06C
_0804C0C0: .4byte 0x0203E070
_0804C0C4: .4byte 0x0203E090
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
	bl sub_08053484
	bl AnimClearAll
	bl UpdateBanimFrame
	bl InitBothAIS
	strh r4, [r6, #0x2c]
	ldr r0, _0804C108 @ =sub_0804BF34
	str r0, [r6, #0xc]
	b _0804C11A
	.align 2, 0
_0804C108: .4byte sub_0804BF34
_0804C10C:
	ldr r0, _0804C128 @ =0x0201FAF8
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
_0804C128: .4byte 0x0201FAF8
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
	bl sub_0806544C
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0804C1AA
	ldr r0, _0804C1C0 @ =0x0203E0AC
	movs r1, #0
	ldrsh r0, [r0, r1]
	movs r2, #1
	cmp r0, #0
	beq _0804C186
	movs r2, #0
_0804C186:
	ldr r3, _0804C1C4 @ =0x02017744
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
_0804C1C0: .4byte 0x0203E0AC
_0804C1C4: .4byte 0x02017744

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
	ldr r0, _0804C1F4 @ =0x0203E0AC
	movs r2, #0
	ldrsh r1, [r0, r2]
	movs r2, #2
	ldrsh r0, [r0, r2]
	cmn r1, r0
	beq _0804C1FC
	ldr r0, _0804C1F8 @ =sub_0804C20C
	b _0804C1FE
	.align 2, 0
_0804C1F4: .4byte 0x0203E0AC
_0804C1F8: .4byte sub_0804C20C
_0804C1FC:
	ldr r0, _0804C208 @ =sub_0804C74C
_0804C1FE:
	str r0, [r4, #0xc]
_0804C200:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0804C208: .4byte sub_0804C74C

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
	bl sub_080672B8
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
	bl sub_0804CC68
	ldr r0, _0804C338 @ =0x0203E0AC
	movs r2, #0
	ldrsh r0, [r0, r2]
	cmp r0, #0
	beq _0804C340
	ldr r0, _0804C33C @ =0x0203E0A8
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
_0804C338: .4byte 0x0203E0AC
_0804C33C: .4byte 0x0203E0A8
_0804C340:
	ldr r0, _0804C3DC @ =0x0203E0A8
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
	bl sub_08067564
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
_0804C3DC: .4byte 0x0203E0A8
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
	ldr r2, _0804C464 @ =0x0203E0AC
	ldrh r3, [r2]
	movs r4, #0
	ldrsh r0, [r2, r4]
	cmp r0, #0
	beq _0804C46C
	ldr r0, _0804C468 @ =0x0203E0A8
	ldrh r0, [r0]
	b _0804C47A
	.align 2, 0
_0804C464: .4byte 0x0203E0AC
_0804C468: .4byte 0x0203E0A8
_0804C46C:
	ldrh r3, [r2, #2]
	movs r4, #2
	ldrsh r0, [r2, r4]
	cmp r0, #0
	beq _0804C480
	ldr r0, _0804C4A4 @ =0x0203E0A8
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
	bl sub_08067DB4
	adds r0, r4, #0
	movs r1, #0x78
	movs r2, #0
	bl sub_08067ED4
_0804C49C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0804C4A4: .4byte 0x0203E0A8
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
	bl sub_08067564
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
	bl sub_08067E68
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
	ldr r0, _0804C5D8 @ =sub_0804C608
	str r0, [r1, #0xc]
	b _0804C602
	.align 2, 0
_0804C5D8: .4byte sub_0804C608
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

	thumb_func_start sub_0804C608
sub_0804C608: @ 0x0804C608
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x18
	bne _0804C64C
	ldr r2, _0804C630 @ =0x0203E0AC
	movs r1, #0
	ldrsh r0, [r2, r1]
	cmp r0, #0
	beq _0804C638
	ldr r0, _0804C634 @ =0x0203E0A8
	movs r3, #0
	ldrsh r1, [r0, r3]
	movs r3, #0
	ldrsh r0, [r2, r3]
	b _0804C642
	.align 2, 0
_0804C630: .4byte 0x0203E0AC
_0804C634: .4byte 0x0203E0A8
_0804C638:
	ldr r0, _0804C6B8 @ =0x0203E0A8
	movs r3, #2
	ldrsh r1, [r0, r3]
	movs r3, #2
	ldrsh r0, [r2, r3]
_0804C642:
	adds r1, r1, r0
	cmp r1, #0x63
	ble _0804C64C
	bl sub_0804C890
_0804C64C:
	movs r1, #0x2c
	ldrsh r0, [r4, r1]
	cmp r0, #0x28
	ble _0804C6E4
	bl SpellFx_ClearBG1
	movs r0, #0
	bl sub_0804CC68
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
	ldr r2, _0804C6C0 @ =0x0203E0AC
	movs r3, #0
	ldrsh r0, [r2, r3]
	cmp r0, #0
	beq _0804C6C4
	ldr r0, _0804C6B8 @ =0x0203E0A8
	movs r3, #0
	ldrsh r1, [r0, r3]
	movs r3, #0
	ldrsh r0, [r2, r3]
	b _0804C6CE
	.align 2, 0
_0804C6B8: .4byte 0x0203E0A8
_0804C6BC: .4byte gDispIo
_0804C6C0: .4byte 0x0203E0AC
_0804C6C4:
	ldr r0, _0804C6D8 @ =0x0203E0A8
	movs r3, #2
	ldrsh r1, [r0, r3]
	movs r3, #2
	ldrsh r0, [r2, r3]
_0804C6CE:
	adds r1, r1, r0
	cmp r1, #0x63
	ble _0804C6E0
	ldr r0, _0804C6DC @ =sub_0804C6F0
	b _0804C6E2
	.align 2, 0
_0804C6D8: .4byte 0x0203E0A8
_0804C6DC: .4byte sub_0804C6F0
_0804C6E0:
	ldr r0, _0804C6EC @ =sub_0804C74C
_0804C6E2:
	str r0, [r4, #0xc]
_0804C6E4:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0804C6EC: .4byte sub_0804C74C

	thumb_func_start sub_0804C6F0
sub_0804C6F0: @ 0x0804C6F0
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0804C704 @ =0x0203E0AC
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	beq _0804C70C
	ldr r0, _0804C708 @ =gAnims
	ldr r0, [r0]
	b _0804C710
	.align 2, 0
_0804C704: .4byte 0x0203E0AC
_0804C708: .4byte gAnims
_0804C70C:
	ldr r0, _0804C720 @ =gAnims
	ldr r0, [r0, #8]
_0804C710:
	bl sub_08069770
	ldr r0, _0804C724 @ =sub_0804C728
	str r0, [r4, #0xc]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0804C720: .4byte gAnims
_0804C724: .4byte sub_0804C728

	thumb_func_start sub_0804C728
sub_0804C728: @ 0x0804C728
	push {r4, lr}
	adds r4, r0, #0
	bl sub_080692E8
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne _0804C740
	bl sub_08069300
	ldr r0, _0804C748 @ =sub_0804C74C
	str r0, [r4, #0xc]
_0804C740:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0804C748: .4byte sub_0804C74C

	thumb_func_start sub_0804C74C
sub_0804C74C: @ 0x0804C74C
	push {r4, lr}
	adds r4, r0, #0
	bl sub_0806BBF8
	ldr r0, _0804C760 @ =sub_0804C764
	str r0, [r4, #0xc]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0804C760: .4byte sub_0804C764

	thumb_func_start sub_0804C764
sub_0804C764: @ 0x0804C764
	push {r4, lr}
	adds r4, r0, #0
	bl sub_0806B848
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne _0804C77C
	bl sub_0806B85C
	ldr r0, _0804C784 @ =sub_0804C788
	str r0, [r4, #0xc]
_0804C77C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0804C784: .4byte sub_0804C788

	thumb_func_start sub_0804C788
sub_0804C788: @ 0x0804C788
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r4, _0804C7B8 @ =gAnims
	ldr r0, [r4]
	bl sub_0804FF70
	ldr r0, [r4, #8]
	bl sub_0804FF70
	bl sub_08050274
	bl sub_0804FC48
	ldr r0, _0804C7BC @ =0x0203DFE4
	movs r1, #0
	ldrsh r0, [r0, r1]
	str r0, [r5, #0x44]
	movs r0, #0
	str r0, [r5, #0x48]
	ldr r0, _0804C7C0 @ =sub_0804C7C4
	str r0, [r5, #0xc]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0804C7B8: .4byte gAnims
_0804C7BC: .4byte 0x0203DFE4
_0804C7C0: .4byte sub_0804C7C4

	thumb_func_start sub_0804C7C4
sub_0804C7C4: @ 0x0804C7C4
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x48]
	cmp r0, #2
	bne _0804C7D8
	ldr r0, _0804C7D4 @ =sub_0804C854
	str r0, [r4, #0xc]
	b _0804C826
	.align 2, 0
_0804C7D4: .4byte sub_0804C854
_0804C7D8:
	ldr r0, [r4, #0x44]
	cmp r0, #0
	bne _0804C804
	ldr r0, _0804C7FC @ =gAnims
	ldr r0, [r0]
	str r0, [r4, #0x5c]
	bl sub_0806527C
	cmp r0, #0
	beq _0804C7F6
	ldr r0, [r4, #0x5c]
	bl sub_08065430
	ldr r0, _0804C800 @ =sub_0804C834
	str r0, [r4, #0xc]
_0804C7F6:
	movs r0, #1
	b _0804C81E
	.align 2, 0
_0804C7FC: .4byte gAnims
_0804C800: .4byte sub_0804C834
_0804C804:
	ldr r0, _0804C82C @ =gAnims
	ldr r0, [r0, #8]
	str r0, [r4, #0x5c]
	bl sub_0806527C
	cmp r0, #0
	beq _0804C81C
	ldr r0, [r4, #0x5c]
	bl sub_08065430
	ldr r0, _0804C830 @ =sub_0804C834
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
_0804C830: .4byte sub_0804C834

	thumb_func_start sub_0804C834
sub_0804C834: @ 0x0804C834
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x5c]
	bl sub_080653E4
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne _0804C84A
	ldr r0, _0804C850 @ =sub_0804C7C4
	str r0, [r4, #0xc]
_0804C84A:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0804C850: .4byte sub_0804C7C4

	thumb_func_start sub_0804C854
sub_0804C854: @ 0x0804C854
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, _0804C880 @ =0x02017724
	movs r0, #1
	str r0, [r1]
	ldr r0, _0804C884 @ =0x0203DFE0
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	bne _0804C876
	movs r0, #2
	movs r1, #7
	movs r2, #0
	bl sub_0805235C
	bl sub_080688C8
_0804C876:
	ldr r0, _0804C888 @ =nullsub_47
	str r0, [r4, #0xc]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0804C880: .4byte 0x02017724
_0804C884: .4byte 0x0203DFE0
_0804C888: .4byte nullsub_47

	thumb_func_start nullsub_47
nullsub_47: @ 0x0804C88C
	bx lr
	.align 2, 0

	thumb_func_start sub_0804C890
sub_0804C890: @ 0x0804C890
	push {lr}
	ldr r0, _0804C8A8 @ =0x08C09D30
	movs r1, #3
	bl Proc_Start
	movs r1, #0
	strh r1, [r0, #0x2c]
	movs r0, #0x80
	bl SetBgmVolume
	pop {r0}
	bx r0
	.align 2, 0
_0804C8A8: .4byte 0x08C09D30

	thumb_func_start sub_0804C8AC
sub_0804C8AC: @ 0x0804C8AC
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x10
	bne _0804C8DC
	ldr r4, _0804C8D8 @ =0x0000037B
	movs r1, #0x80
	lsls r1, r1, #1
	adds r0, r4, #0
	bl sub_08067DB4
	adds r0, r4, #0
	movs r1, #0x78
	movs r2, #0
	bl sub_08067ED4
	b _0804C8EE
	.align 2, 0
_0804C8D8: .4byte 0x0000037B
_0804C8DC:
	cmp r0, #0x74
	bne _0804C8EE
	movs r0, #0x80
	lsls r0, r0, #1
	bl SetBgmVolume
	adds r0, r4, #0
	bl Proc_Break
_0804C8EE:
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_0804C8F4
sub_0804C8F4: @ 0x0804C8F4
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r4, r0, #0
	adds r7, r1, #0
	movs r6, #0
	adds r5, r7, #0
_0804C900:
	movs r0, #0xf
	ldrh r1, [r4]
	cmp r1, #0xff
	beq _0804C90A
	ldrh r0, [r4]
_0804C90A:
	lsls r0, r0, #5
	ldr r1, _0804C93C @ =0x081DF024
	adds r0, r0, r1
	adds r1, r5, #0
	movs r2, #8
	bl CpuFastSet
	adds r4, #2
	adds r5, #0x20
	adds r6, #1
	cmp r6, #0xa
	bls _0804C900
	movs r0, #0
	str r0, [sp]
	movs r0, #0xc0
	lsls r0, r0, #1
	adds r1, r7, r0
	ldr r2, _0804C940 @ =0x01000008
	mov r0, sp
	bl CpuFastSet
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0804C93C: .4byte 0x081DF024
_0804C940: .4byte 0x01000008

	thumb_func_start sub_0804C944
sub_0804C944: @ 0x0804C944
	push {r4, r5, r6, lr}
	adds r5, r1, #0
	lsls r0, r0, #0x10
	asrs r6, r0, #0x10
	movs r0, #1
	rsbs r0, r0, #0
	cmp r6, r0
	bne _0804C960
	movs r0, #0xb
	strh r0, [r5]
	movs r0, #0xa
	strh r0, [r5, #2]
	strh r0, [r5, #4]
	b _0804C9A6
_0804C960:
	adds r0, r6, #0
	movs r1, #0x64
	bl Div
	strh r0, [r5]
	movs r0, #0x64
	ldrh r1, [r5]
	adds r4, r1, #0
	muls r4, r0, r4
	subs r4, r6, r4
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	adds r0, r4, #0
	movs r1, #0xa
	bl Div
	strh r0, [r5, #2]
	lsls r0, r0, #2
	ldrh r2, [r5, #2]
	adds r0, r0, r2
	lsls r0, r0, #1
	subs r4, r4, r0
	strh r4, [r5, #4]
	adds r1, r2, #0
	ldrh r2, [r5]
	adds r0, r1, r2
	cmp r0, #0
	bne _0804C99C
	movs r0, #0xb
	strh r0, [r5, #2]
_0804C99C:
	ldrh r0, [r5]
	cmp r0, #0
	bne _0804C9A6
	movs r0, #0xb
	strh r0, [r5]
_0804C9A6:
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	thumb_func_start sub_0804C9AC
sub_0804C9AC: @ 0x0804C9AC
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #8
	ldr r4, _0804C9F8 @ =0x02000068
	ldr r0, _0804C9FC @ =0x08C09D48
	movs r1, #1
	bl Proc_Start
	str r0, [r4]
	movs r0, #0
	bl sub_0804CC68
	bl sub_0804CC28
	bl sub_0804CCD0
	bl sub_0804CCB0
	ldr r1, _0804CA00 @ =0x02000038
	movs r2, #0
	ldrsh r0, [r1, r2]
	movs r2, #2
	ldrsh r1, [r1, r2]
	bl sub_0804CC78
	ldr r0, _0804CA04 @ =0x0203E090
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0x50
	ble _0804CA10
	ldr r0, _0804CA08 @ =0x081DF3A4
	ldr r1, _0804CA0C @ =0x02022BC0
	movs r2, #0x10
	bl CpuSet
	b _0804CA24
	.align 2, 0
_0804C9F8: .4byte 0x02000068
_0804C9FC: .4byte 0x08C09D48
_0804CA00: .4byte 0x02000038
_0804CA04: .4byte 0x0203E090
_0804CA08: .4byte 0x081DF3A4
_0804CA0C: .4byte 0x02022BC0
_0804CA10:
	ldr r0, _0804CA3C @ =0x0203DFF8
	movs r2, #0
	ldrsh r0, [r0, r2]
	lsls r0, r0, #5
	ldr r1, _0804CA40 @ =0x081DF224
	adds r0, r0, r1
	ldr r1, _0804CA44 @ =0x02022BC0
	movs r2, #0x10
	bl CpuSet
_0804CA24:
	ldr r0, _0804CA48 @ =0x0203E090
	movs r1, #2
	ldrsh r0, [r0, r1]
	cmp r0, #0x50
	ble _0804CA54
	ldr r0, _0804CA4C @ =0x081DF3A4
	ldr r1, _0804CA50 @ =0x02022BE0
	movs r2, #0x10
	bl CpuSet
	b _0804CA68
	.align 2, 0
_0804CA3C: .4byte 0x0203DFF8
_0804CA40: .4byte 0x081DF224
_0804CA44: .4byte 0x02022BC0
_0804CA48: .4byte 0x0203E090
_0804CA4C: .4byte 0x081DF3A4
_0804CA50: .4byte 0x02022BE0
_0804CA54:
	ldr r0, _0804CBB8 @ =0x0203DFF8
	movs r2, #2
	ldrsh r0, [r0, r2]
	lsls r0, r0, #5
	ldr r1, _0804CBBC @ =0x081DF224
	adds r0, r0, r1
	ldr r1, _0804CBC0 @ =0x02022BE0
	movs r2, #0x10
	bl CpuSet
_0804CA68:
	ldr r1, _0804CBC4 @ =0x0203E098
	ldr r2, _0804CBC8 @ =0x0000FFFF
	adds r0, r2, #0
	ldrh r2, [r1]
	orrs r2, r0
	strh r2, [r1]
	ldrh r2, [r1, #2]
	orrs r0, r2
	strh r0, [r1, #2]
	ldr r0, _0804CBCC @ =0x081DEC94
	ldr r1, _0804CBD0 @ =0x06013800
	bl LZ77UnCompVram
	ldr r0, _0804CBD4 @ =0x081DED34
	ldr r1, _0804CBD8 @ =0x06013C00
	bl LZ77UnCompVram
	ldr r6, _0804CBB8 @ =0x0203DFF8
	movs r1, #0
	ldrsh r0, [r6, r1]
	lsls r0, r0, #5
	ldr r5, _0804CBDC @ =0x081DEFA4
	adds r0, r0, r5
	ldr r4, _0804CBE0 @ =0x02022B00
	adds r1, r4, #0
	movs r2, #8
	bl CpuFastSet
	movs r2, #2
	ldrsh r0, [r6, r2]
	lsls r0, r0, #5
	adds r0, r0, r5
	adds r4, #0x20
	adds r1, r4, #0
	movs r2, #8
	bl CpuFastSet
	bl EnablePalSync
	ldr r6, _0804CBE4 @ =0x0203E09C
	movs r1, #0
	ldrsh r0, [r6, r1]
	ldr r7, _0804CBE8 @ =0x02017700
	adds r1, r7, #0
	bl sub_0804C944
	ldr r5, _0804CBEC @ =0x0203E0A0
	movs r2, #0
	ldrsh r0, [r5, r2]
	adds r1, r7, #6
	bl sub_0804C944
	ldr r4, _0804CBF0 @ =0x0203E0A4
	movs r1, #0
	ldrsh r0, [r4, r1]
	adds r1, r7, #0
	adds r1, #0xc
	bl sub_0804C944
	movs r2, #2
	ldrsh r0, [r6, r2]
	adds r1, r7, #0
	adds r1, #0x12
	bl sub_0804C944
	movs r1, #2
	ldrsh r0, [r5, r1]
	adds r1, r7, #0
	adds r1, #0x18
	bl sub_0804C944
	movs r2, #2
	ldrsh r0, [r4, r2]
	adds r1, r7, #0
	adds r1, #0x1e
	bl sub_0804C944
	movs r0, #0
	str r0, [sp]
	ldr r1, _0804CBF4 @ =0x020169C8
	ldr r2, _0804CBF8 @ =0x01000100
	mov r0, sp
	bl CpuFastSet
	movs r6, #0
	mov sb, r7
_0804CB14:
	movs r5, #0
	lsls r3, r6, #1
	adds r0, r6, #1
	mov r8, r0
	lsls r4, r6, #7
_0804CB1E:
	adds r0, r3, r6
	adds r0, r0, r5
	lsls r0, r0, #1
	add r0, sb
	ldrh r0, [r0]
	lsls r0, r0, #5
	ldr r1, _0804CBFC @ =0x081DEDE4
	adds r0, r0, r1
	ldr r7, _0804CBF4 @ =0x020169C8
	adds r1, r4, r7
	movs r2, #0x10
	str r3, [sp, #4]
	bl CpuSet
	adds r4, #0x20
	adds r5, #1
	ldr r3, [sp, #4]
	cmp r5, #2
	bls _0804CB1E
	mov r6, r8
	cmp r6, #5
	bls _0804CB14
	ldr r1, _0804CC00 @ =0x06013A00
	movs r4, #0xc0
	lsls r4, r4, #1
	adds r0, r7, #0
	adds r2, r4, #0
	bl RegisterDataMove
	adds r0, r7, r4
	ldr r1, _0804CC04 @ =0x06013E00
	adds r2, r4, #0
	bl RegisterDataMove
	bl InitIcons
	movs r0, #0
	movs r1, #0x1d
	bl ApplyIconPalette
	movs r0, #0
	movs r1, #0x1e
	bl ApplyIconPalette
	ldr r0, _0804CC08 @ =0x0203E06C
	ldr r0, [r0]
	adds r0, #0x4a
	ldrh r0, [r0]
	bl sub_08017808
	movs r1, #0xee
	lsls r1, r1, #1
	bl PutIconObjImg
	ldr r0, _0804CC0C @ =0x0203E070
	ldr r0, [r0]
	adds r0, #0x4a
	ldrh r0, [r0]
	bl sub_08017808
	movs r1, #0xef
	lsls r1, r1, #1
	bl PutIconObjImg
	ldr r0, _0804CC10 @ =0x0818FE70
	movs r1, #0x80
	lsls r1, r1, #2
	movs r2, #0x20
	bl ApplyPaletteExt
	add sp, #8
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0804CBB8: .4byte 0x0203DFF8
_0804CBBC: .4byte 0x081DF224
_0804CBC0: .4byte 0x02022BE0
_0804CBC4: .4byte 0x0203E098
_0804CBC8: .4byte 0x0000FFFF
_0804CBCC: .4byte 0x081DEC94
_0804CBD0: .4byte 0x06013800
_0804CBD4: .4byte 0x081DED34
_0804CBD8: .4byte 0x06013C00
_0804CBDC: .4byte 0x081DEFA4
_0804CBE0: .4byte 0x02022B00
_0804CBE4: .4byte 0x0203E09C
_0804CBE8: .4byte 0x02017700
_0804CBEC: .4byte 0x0203E0A0
_0804CBF0: .4byte 0x0203E0A4
_0804CBF4: .4byte 0x020169C8
_0804CBF8: .4byte 0x01000100
_0804CBFC: .4byte 0x081DEDE4
_0804CC00: .4byte 0x06013A00
_0804CC04: .4byte 0x06013E00
_0804CC08: .4byte 0x0203E06C
_0804CC0C: .4byte 0x0203E070
_0804CC10: .4byte 0x0818FE70

	thumb_func_start EndEkrGauge
EndEkrGauge: @ 0x0804CC14
	push {lr}
	ldr r0, _0804CC24 @ =0x02000068
	ldr r0, [r0]
	bl Proc_End
	pop {r0}
	bx r0
	.align 2, 0
_0804CC24: .4byte 0x02000068

	thumb_func_start sub_0804CC28
sub_0804CC28: @ 0x0804CC28
	ldr r0, _0804CC34 @ =0x02000068
	ldr r1, [r0]
	movs r0, #0
	str r0, [r1, #0x4c]
	str r0, [r1, #0x50]
	bx lr
	.align 2, 0
_0804CC34: .4byte 0x02000068

	thumb_func_start sub_0804CC38
sub_0804CC38: @ 0x0804CC38
	ldr r0, _0804CC44 @ =0x02000068
	ldr r1, [r0]
	movs r0, #1
	str r0, [r1, #0x4c]
	str r0, [r1, #0x50]
	bx lr
	.align 2, 0
_0804CC44: .4byte 0x02000068

	thumb_func_start sub_0804CC48
sub_0804CC48: @ 0x0804CC48
	ldr r0, _0804CC54 @ =0x02000068
	ldr r1, [r0]
	movs r0, #1
	str r0, [r1, #0x4c]
	bx lr
	.align 2, 0
_0804CC54: .4byte 0x02000068

	thumb_func_start sub_0804CC58
sub_0804CC58: @ 0x0804CC58
	ldr r0, _0804CC64 @ =0x02000068
	ldr r1, [r0]
	movs r0, #1
	str r0, [r1, #0x50]
	bx lr
	.align 2, 0
_0804CC64: .4byte 0x02000068

	thumb_func_start sub_0804CC68
sub_0804CC68: @ 0x0804CC68
	lsls r0, r0, #0x10
	ldr r1, _0804CC74 @ =0x02000068
	ldr r1, [r1]
	lsrs r0, r0, #6
	str r0, [r1, #0x44]
	bx lr
	.align 2, 0
_0804CC74: .4byte 0x02000068

	thumb_func_start sub_0804CC78
sub_0804CC78: @ 0x0804CC78
	ldr r2, _0804CC88 @ =0x02000068
	ldr r2, [r2]
	movs r3, #0
	strh r0, [r2, #0x32]
	strh r1, [r2, #0x3a]
	adds r2, #0x29
	strb r3, [r2]
	bx lr
	.align 2, 0
_0804CC88: .4byte 0x02000068

	thumb_func_start sub_0804CC8C
sub_0804CC8C: @ 0x0804CC8C
	ldr r2, _0804CC9C @ =0x02000068
	ldr r2, [r2]
	strh r0, [r2, #0x32]
	strh r1, [r2, #0x3a]
	adds r2, #0x29
	movs r0, #1
	strb r0, [r2]
	bx lr
	.align 2, 0
_0804CC9C: .4byte 0x02000068

	thumb_func_start sub_0804CCA0
sub_0804CCA0: @ 0x0804CCA0
	ldr r0, _0804CCAC @ =0x02000068
	ldr r0, [r0]
	adds r0, #0x29
	movs r1, #1
	strb r1, [r0]
	bx lr
	.align 2, 0
_0804CCAC: .4byte 0x02000068

	thumb_func_start sub_0804CCB0
sub_0804CCB0: @ 0x0804CCB0
	ldr r0, _0804CCBC @ =0x02000068
	ldr r0, [r0]
	adds r0, #0x29
	movs r1, #0
	strb r1, [r0]
	bx lr
	.align 2, 0
_0804CCBC: .4byte 0x02000068

	thumb_func_start sub_0804CCC0
sub_0804CCC0: @ 0x0804CCC0
	ldr r0, _0804CCCC @ =0x02000068
	ldr r0, [r0]
	adds r0, #0x2a
	movs r1, #1
	strb r1, [r0]
	bx lr
	.align 2, 0
_0804CCCC: .4byte 0x02000068

	thumb_func_start sub_0804CCD0
sub_0804CCD0: @ 0x0804CCD0
	ldr r0, _0804CCDC @ =0x02000068
	ldr r0, [r0]
	adds r0, #0x2a
	movs r1, #0
	strb r1, [r0]
	bx lr
	.align 2, 0
_0804CCDC: .4byte 0x02000068

	thumb_func_start sub_0804CCE0
sub_0804CCE0: @ 0x0804CCE0
	adds r3, r0, #0
	cmp r1, #0
	ble _0804CD08
	cmp r2, #1
	beq _0804CCF8
	cmp r2, #1
	bhs _0804CD00
	ldr r0, _0804CCF4 @ =0x08C09E68
	b _0804CD22
	.align 2, 0
_0804CCF4: .4byte 0x08C09E68
_0804CCF8:
	ldr r0, _0804CCFC @ =0x08C09E80
	b _0804CD22
	.align 2, 0
_0804CCFC: .4byte 0x08C09E80
_0804CD00:
	ldr r0, _0804CD04 @ =0x08C09E98
	b _0804CD22
	.align 2, 0
_0804CD04: .4byte 0x08C09E98
_0804CD08:
	cmp r2, #1
	beq _0804CD18
	cmp r2, #1
	bhs _0804CD20
	ldr r0, _0804CD14 @ =0x08C09EB0
	b _0804CD22
	.align 2, 0
_0804CD14: .4byte 0x08C09EB0
_0804CD18:
	ldr r0, _0804CD1C @ =0x08C09EC8
	b _0804CD22
	.align 2, 0
_0804CD1C: .4byte 0x08C09EC8
_0804CD20:
	ldr r0, _0804CD28 @ =0x08C09EE0
_0804CD22:
	str r0, [r3, #0x3c]
	bx lr
	.align 2, 0
_0804CD28: .4byte 0x08C09EE0

	thumb_func_start sub_0804CD2C
sub_0804CD2C: @ 0x0804CD2C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x120
	mov sb, r0
	movs r0, #0
	str r0, [sp, #0xd8]
	bl GetGameTime
	lsrs r0, r0, #3
	movs r1, #3
	bl DivRem
	str r0, [sp, #0xe4]
	mov r0, sb
	adds r0, #0x2a
	ldrb r0, [r0]
	cmp r0, #1
	bne _0804CD58
	b _0804D4FC
_0804CD58:
	mov r0, sb
	adds r0, #0x29
	ldrb r1, [r0]
	str r0, [sp, #0x108]
	cmp r1, #0
	bne _0804CE46
	mov r1, sb
	ldrh r1, [r1, #0x3a]
	lsls r0, r1, #0x10
	asrs r4, r0, #0x13
	lsls r0, r4, #5
	movs r2, #0xd0
	lsls r2, r2, #1
	adds r7, r0, r2
	cmp r7, #0
	bge _0804CD7A
	movs r7, #0
_0804CD7A:
	adds r6, r4, #7
	cmp r6, #7
	ble _0804CD82
	movs r6, #7
_0804CD82:
	movs r0, #7
	subs r0, r0, r6
	lsls r1, r0, #4
	subs r1, r1, r0
	lsls r1, r1, #1
	mov sl, r1
	ldr r0, _0804CDA4 @ =0x0203E004
	movs r3, #0
	ldrsh r0, [r0, r3]
	cmp r0, #0
	blt _0804CDA8
	cmp r0, #2
	bgt _0804CDA8
	movs r4, #0
	movs r0, #0xf
	str r0, [sp, #0xdc]
	b _0804CDAE
	.align 2, 0
_0804CDA4: .4byte 0x0203E004
_0804CDA8:
	movs r1, #8
	str r1, [sp, #0xdc]
	movs r4, #8
_0804CDAE:
	ldr r2, _0804CE94 @ =0x02022FA0
	mov r8, r2
	movs r0, #0x9f
	str r0, [sp]
	mov r0, r8
	movs r1, #0x1e
	movs r2, #8
	movs r3, #0
	bl sub_080671A0
	mov r3, sb
	ldr r0, [r3, #0x4c]
	cmp r0, #0
	bne _0804CE00
	ldr r0, _0804CE98 @ =0x081DEA10
	add r0, sl
	lsls r5, r7, #1
	lsls r1, r4, #1
	ldr r2, _0804CE9C @ =0xFFFFFCC0
	add r2, r8
	adds r1, r1, r2
	adds r5, r5, r1
	lsls r4, r6, #0x10
	lsrs r4, r4, #0x10
	movs r1, #1
	rsbs r1, r1, #0
	str r1, [sp]
	str r1, [sp, #4]
	adds r1, r5, #0
	movs r2, #0xf
	adds r3, r4, #0
	bl sub_080672B8
	movs r0, #0x80
	str r0, [sp]
	adds r0, r5, #0
	movs r1, #0xf
	adds r2, r4, #0
	movs r3, #2
	bl sub_08067128
_0804CE00:
	mov r4, sb
	ldr r0, [r4, #0x50]
	cmp r0, #0
	bne _0804CE40
	ldr r0, _0804CEA0 @ =0x081DEAE4
	add r0, sl
	lsls r5, r7, #1
	ldr r2, [sp, #0xdc]
	lsls r1, r2, #1
	ldr r2, _0804CE9C @ =0xFFFFFCC0
	add r2, r8
	adds r1, r1, r2
	adds r5, r5, r1
	lsls r4, r6, #0x10
	lsrs r4, r4, #0x10
	movs r1, #1
	rsbs r1, r1, #0
	str r1, [sp]
	str r1, [sp, #4]
	adds r1, r5, #0
	movs r2, #0x10
	adds r3, r4, #0
	bl sub_080672B8
	movs r0, #0x80
	str r0, [sp]
	adds r0, r5, #0
	movs r1, #0x10
	adds r2, r4, #0
	movs r3, #3
	bl sub_08067128
_0804CE40:
	movs r0, #1
	bl EnableBgSync
_0804CE46:
	ldr r1, _0804CEA4 @ =0x0203E098
	ldr r0, _0804CEA8 @ =0x0203E090
	ldrh r2, [r0]
	adds r5, r0, #0
	ldrh r3, [r1]
	ldrh r4, [r5]
	cmp r3, r4
	beq _0804CE5A
	movs r0, #1
	str r0, [sp, #0xd8]
_0804CE5A:
	ldrh r0, [r5, #2]
	ldrh r3, [r1, #2]
	cmp r3, r0
	beq _0804CE66
	movs r4, #1
	str r4, [sp, #0xd8]
_0804CE66:
	strh r2, [r1]
	strh r0, [r1, #2]
	ldrh r7, [r5]
	ldr r0, _0804CEAC @ =0x0203E094
	ldrh r6, [r0]
	ldrh r1, [r5, #2]
	mov r8, r1
	ldrh r0, [r0, #2]
	str r0, [sp, #0xd4]
	ldr r0, _0804CEB0 @ =0x0203E004
	movs r2, #0
	ldrsh r0, [r0, r2]
	cmp r0, #3
	beq _0804CEB4
	cmp r0, #3
	bgt _0804CED4
	cmp r0, #0
	blt _0804CED4
	mov r3, sb
	movs r4, #0x32
	ldrsh r3, [r3, r4]
	mov sl, r3
	b _0804CEDE
	.align 2, 0
_0804CE94: .4byte 0x02022FA0
_0804CE98: .4byte 0x081DEA10
_0804CE9C: .4byte 0xFFFFFCC0
_0804CEA0: .4byte 0x081DEAE4
_0804CEA4: .4byte 0x0203E098
_0804CEA8: .4byte 0x0203E090
_0804CEAC: .4byte 0x0203E094
_0804CEB0: .4byte 0x0203E004
_0804CEB4:
	ldr r0, _0804CEC8 @ =0x0203DFE8
	ldrh r0, [r0]
	cmp r0, #1
	bne _0804CECC
	mov r1, sb
	movs r2, #0x32
	ldrsh r0, [r1, r2]
	adds r0, #0x38
	b _0804CEDC
	.align 2, 0
_0804CEC8: .4byte 0x0203DFE8
_0804CECC:
	mov r3, sb
	movs r4, #0x32
	ldrsh r0, [r3, r4]
	b _0804CEDA
_0804CED4:
	mov r1, sb
	movs r2, #0x32
	ldrsh r0, [r1, r2]
_0804CEDA:
	subs r0, #0x38
_0804CEDC:
	mov sl, r0
_0804CEDE:
	ldr r3, [sp, #0x108]
	ldrb r0, [r3]
	cmp r0, #0
	bne _0804CEF8
	ldr r4, _0804CEF4 @ =0x0000FFF8
	mov r0, sb
	ldrh r1, [r0, #0x3a]
	ands r1, r4
	str r1, [sp, #0xe0]
	b _0804CF00
	.align 2, 0
_0804CEF4: .4byte 0x0000FFF8
_0804CEF8:
	mov r2, sb
	movs r3, #0x3a
	ldrsh r2, [r2, r3]
	str r2, [sp, #0xe0]
_0804CF00:
	adds r4, r5, #0
	movs r1, #0
	ldrsh r0, [r4, r1]
	movs r1, #0xa
	bl Div
	add r2, sp, #0x68
	strh r0, [r2]
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #1
	ldrh r3, [r4]
	subs r1, r3, r1
	strh r1, [r2, #2]
	lsls r0, r0, #0x10
	adds r3, r2, #0
	cmp r0, #0
	bne _0804CF28
	movs r0, #0xb
	strh r0, [r3]
_0804CF28:
	movs r1, #2
	ldrsh r0, [r4, r1]
	movs r1, #0xa
	str r3, [sp, #0x11c]
	bl Div
	ldr r3, [sp, #0x11c]
	strh r0, [r3, #4]
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #1
	ldrh r2, [r4, #2]
	subs r1, r2, r1
	strh r1, [r3, #6]
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _0804CF4E
	movs r0, #0xb
	strh r0, [r3, #4]
_0804CF4E:
	movs r1, #0
	ldrsh r0, [r4, r1]
	cmp r0, #0x50
	ble _0804CF5C
	movs r0, #0xc
	strh r0, [r3]
	strh r0, [r3, #2]
_0804CF5C:
	movs r2, #2
	ldrsh r0, [r5, r2]
	cmp r0, #0x50
	ble _0804CF6A
	movs r0, #0xc
	strh r0, [r3, #4]
	strh r0, [r3, #6]
_0804CF6A:
	mov r4, sl
	adds r4, #9
	str r4, [sp, #0xf4]
	ldr r0, [sp, #0xe0]
	adds r0, #0x91
	str r0, [sp, #0x114]
	mov r1, sl
	adds r1, #0x81
	str r1, [sp, #0x110]
	lsls r2, r7, #0x10
	str r2, [sp, #0xf8]
	lsls r6, r6, #0x10
	str r6, [sp, #0xfc]
	adds r4, #0x14
	str r4, [sp, #0x10c]
	mov r0, r8
	lsls r0, r0, #0x10
	str r0, [sp, #0x100]
	ldr r1, [sp, #0xd4]
	lsls r1, r1, #0x10
	str r1, [sp, #0x104]
	mov r2, sl
	adds r2, #0x95
	str r2, [sp, #0x118]
	ldr r4, [sp, #0xd8]
	cmp r4, #1
	bne _0804CFFC
	add r0, sp, #0xd0
	movs r1, #0
	str r1, [r0]
	ldr r1, _0804D034 @ =0x02016DC8
	ldr r2, _0804D038 @ =0x01000020
	str r3, [sp, #0x11c]
	bl CpuFastSet
	movs r0, #0
	ldr r3, [sp, #0x11c]
_0804CFB4:
	adds r1, r0, #1
	mov r8, r1
	lsls r5, r0, #6
	lsls r0, r0, #2
	adds r4, r0, r3
	movs r6, #1
_0804CFC0:
	ldrh r2, [r4]
	lsls r0, r2, #5
	ldr r1, _0804D03C @ =0x081DEDE4
	adds r0, r0, r1
	ldr r7, _0804D034 @ =0x02016DC8
	adds r1, r5, r7
	movs r2, #0x10
	str r3, [sp, #0x11c]
	bl CpuSet
	adds r5, #0x20
	adds r4, #2
	subs r6, #1
	ldr r3, [sp, #0x11c]
	cmp r6, #0
	bge _0804CFC0
	mov r0, r8
	cmp r0, #1
	ble _0804CFB4
	ldr r1, _0804D040 @ =0x060139C0
	adds r0, r7, #0
	movs r2, #0x40
	bl RegisterDataMove
	adds r0, r7, #0
	adds r0, #0x40
	ldr r1, _0804D044 @ =0x06013DC0
	movs r2, #0x40
	bl RegisterDataMove
_0804CFFC:
	add r0, sp, #8
	movs r4, #0
	ldr r1, _0804D048 @ =0x000051CE
	strh r1, [r0, #8]
	adds r2, r0, #0
	mov r3, sb
	ldr r0, [r3, #0x44]
	orrs r0, r1
	strh r0, [r2, #8]
	adds r0, r2, #0
	add r1, sp, #0xf4
	ldrh r1, [r1]
	strh r1, [r0, #2]
	add r2, sp, #0x114
	ldrh r2, [r2]
	strh r2, [r0, #4]
	strh r4, [r0, #0xc]
	movs r0, #0
	bl CheckEfxHpBarExist
	lsls r0, r0, #0x10
	asrs r3, r0, #0x10
	cmp r3, #1
	beq _0804D050
	ldr r0, _0804D04C @ =0x08C09D90
	str r0, [sp, #0x44]
	str r4, [sp, #0x24]
	b _0804D07A
	.align 2, 0
_0804D034: .4byte 0x02016DC8
_0804D038: .4byte 0x01000020
_0804D03C: .4byte 0x081DEDE4
_0804D040: .4byte 0x060139C0
_0804D044: .4byte 0x06013DC0
_0804D048: .4byte 0x000051CE
_0804D04C: .4byte 0x08C09D90
_0804D050:
	add r1, sp, #0x70
	str r1, [sp, #0x44]
	movs r0, #0x80
	lsls r0, r0, #2
	str r0, [sp, #0x24]
	add r2, sp, #8
	adds r0, r2, #0
	ldrh r0, [r0, #2]
	subs r0, #8
	strh r0, [r2, #2]
	adds r0, r2, #0
	ldrh r0, [r0, #4]
	subs r0, #8
	strh r0, [r2, #4]
	ldr r0, _0804D0C4 @ =0x08C09D90
	movs r2, #0x80
	lsls r2, r2, #1
	str r3, [sp]
	movs r3, #0x80
	bl sub_08067C30
_0804D07A:
	mov r3, sb
	ldr r0, [r3, #0x4c]
	cmp r0, #0
	bne _0804D088
	add r0, sp, #8
	bl sub_0800650C
_0804D088:
	movs r4, #0
	str r4, [sp, #0x24]
	add r0, sp, #8
	ldr r1, _0804D0C8 @ =0x000061EE
	strh r1, [r0, #8]
	adds r2, r0, #0
	mov r3, sb
	ldr r0, [r3, #0x44]
	orrs r0, r1
	strh r0, [r2, #8]
	adds r0, r2, #0
	add r1, sp, #0x110
	ldrh r1, [r1]
	strh r1, [r0, #2]
	add r2, sp, #0x114
	ldrh r2, [r2]
	strh r2, [r0, #4]
	strh r4, [r0, #0xc]
	movs r0, #1
	bl CheckEfxHpBarExist
	lsls r0, r0, #0x10
	asrs r3, r0, #0x10
	cmp r3, #1
	beq _0804D0CC
	ldr r0, _0804D0C4 @ =0x08C09D90
	str r0, [sp, #0x44]
	str r4, [sp, #0x24]
	b _0804D0F6
	.align 2, 0
_0804D0C4: .4byte 0x08C09D90
_0804D0C8: .4byte 0x000061EE
_0804D0CC:
	add r1, sp, #0x70
	str r1, [sp, #0x44]
	movs r0, #0x80
	lsls r0, r0, #2
	str r0, [sp, #0x24]
	add r2, sp, #8
	adds r0, r2, #0
	ldrh r0, [r0, #2]
	subs r0, #8
	strh r0, [r2, #2]
	adds r0, r2, #0
	ldrh r0, [r0, #4]
	subs r0, #8
	strh r0, [r2, #4]
	ldr r0, _0804D1F0 @ =0x08C09D90
	movs r2, #0x80
	lsls r2, r2, #1
	str r3, [sp]
	movs r3, #0x80
	bl sub_08067C30
_0804D0F6:
	mov r3, sb
	ldr r0, [r3, #0x50]
	cmp r0, #0
	bne _0804D104
	add r0, sp, #8
	bl sub_0800650C
_0804D104:
	ldr r4, [sp, #0xf8]
	ldr r0, _0804D1F4 @ =0xFFD80000
	adds r1, r4, r0
	ldr r2, [sp, #0xfc]
	adds r0, r2, r0
	lsrs r5, r0, #0x10
	lsrs r7, r4, #0x10
	lsrs r2, r2, #0x10
	mov r8, r2
	lsrs r6, r1, #0x10
	asrs r1, r1, #0x10
	cmp r1, #0x28
	ble _0804D120
	movs r6, #0x28
_0804D120:
	lsls r0, r5, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x28
	ble _0804D12A
	movs r5, #0x28
_0804D12A:
	lsls r0, r6, #0x10
	cmp r0, #0
	bge _0804D132
	movs r6, #0
_0804D132:
	lsls r0, r5, #0x10
	cmp r0, #0
	bge _0804D13A
	movs r5, #0
_0804D13A:
	lsls r0, r7, #0x10

	thumb_func_start sub_0804D13C
sub_0804D13C: @ 0x0804D13C
	asrs r0, r0, #0x10
	cmp r0, #0x28
	ble _0804D144
	movs r7, #0x28
_0804D144:
	mov r3, r8
	lsls r0, r3, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x28
	ble _0804D152
	movs r4, #0x28
	mov r8, r4
_0804D152:
	add r0, sp, #8
	movs r3, #0
	movs r1, #0xb0
	lsls r1, r1, #8
	strh r1, [r0, #8]
	adds r2, r0, #0
	mov r4, sb
	ldr r0, [r4, #0x44]
	orrs r0, r1
	strh r0, [r2, #8]
	str r3, [sp, #0x24]
	adds r0, r2, #0
	add r1, sp, #0x10c
	ldrh r1, [r1]
	strh r1, [r0, #2]
	ldr r0, _0804D1F8 @ =0x08C09D60
	str r0, [sp, #0x44]
	ldr r2, [r4, #0x4c]
	str r2, [sp, #0xe8]
	cmp r2, #0
	bne _0804D228
	lsls r0, r5, #0x10
	asrs r2, r0, #0x10
	add r4, sp, #0x50
	cmp r2, #0
	beq _0804D1C2
	lsls r1, r6, #0x10
	asrs r1, r1, #0x10
	adds r0, r4, #0
	bl sub_0806748C
	ldr r3, [sp, #0xd8]
	cmp r3, #1
	bne _0804D19E
	ldr r1, _0804D1FC @ =0x02016E48
	adds r0, r4, #0
	bl sub_0804C8F4
_0804D19E:
	add r1, sp, #8
	ldr r0, [sp, #0xe0]
	adds r0, #0x8e
	strh r0, [r1, #4]
	adds r2, r1, #0
	movs r0, #0xfc
	lsls r0, r0, #8
	ldrh r1, [r1, #8]
	ands r0, r1
	strh r0, [r2, #8]
	adds r1, r2, #0
	strh r0, [r1, #8]
	adds r0, r1, #0
	add r1, sp, #0xe8
	ldrh r1, [r1]
	strh r1, [r0, #0xc]
	bl sub_0800650C
_0804D1C2:
	lsls r1, r7, #0x10
	asrs r1, r1, #0x10
	mov r3, r8
	lsls r2, r3, #0x10
	asrs r2, r2, #0x10
	adds r0, r4, #0
	bl sub_0806748C
	ldr r0, [sp, #0xd8]
	cmp r0, #1
	bne _0804D1E0
	ldr r1, _0804D200 @ =0x02017248
	adds r0, r4, #0
	bl sub_0804C8F4
_0804D1E0:
	cmp r5, #0
	beq _0804D204
	add r1, sp, #8
	ldr r0, [sp, #0xe0]
	adds r0, #0x95
	strh r0, [r1, #4]
	b _0804D20C
	.align 2, 0
_0804D1F0: .4byte 0x08C09D90
_0804D1F4: .4byte 0xFFD80000
_0804D1F8: .4byte 0x08C09D60
_0804D1FC: .4byte 0x02016E48
_0804D200: .4byte 0x02017248
_0804D204:
	add r0, sp, #8
	add r1, sp, #0x114
	ldrh r1, [r1]
	strh r1, [r0, #4]
_0804D20C:
	add r2, sp, #8
	adds r1, r2, #0
	movs r0, #0xfc
	lsls r0, r0, #8
	ldrh r1, [r1, #8]
	ands r0, r1
	movs r3, #0
	movs r1, #0x20
	orrs r0, r1
	strh r0, [r2, #8]
	adds r0, r2, #0
	strh r3, [r0, #0xc]
	bl sub_0800650C
_0804D228:
	ldr r2, [sp, #0x100]
	ldr r3, _0804D320 @ =0xFFD80000
	adds r1, r2, r3
	ldr r4, [sp, #0x104]
	adds r0, r4, r3
	lsrs r5, r0, #0x10
	lsrs r7, r2, #0x10
	lsrs r4, r4, #0x10
	mov r8, r4
	lsrs r6, r1, #0x10
	asrs r1, r1, #0x10
	cmp r1, #0x28
	ble _0804D244
	movs r6, #0x28
_0804D244:
	lsls r0, r5, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x28
	ble _0804D24E
	movs r5, #0x28
_0804D24E:
	lsls r0, r6, #0x10
	cmp r0, #0
	bge _0804D256
	movs r6, #0
_0804D256:
	lsls r0, r5, #0x10
	cmp r0, #0
	bge _0804D25E
	movs r5, #0
_0804D25E:
	lsls r0, r7, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x28
	ble _0804D268
	movs r7, #0x28
_0804D268:
	mov r1, r8
	lsls r0, r1, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x28
	ble _0804D276
	movs r2, #0x28
	mov r8, r2
_0804D276:
	add r0, sp, #8
	movs r3, #0
	mov ip, r3
	movs r1, #0xc0
	lsls r1, r1, #8
	strh r1, [r0, #8]
	adds r2, r0, #0
	mov r4, sb
	ldr r0, [r4, #0x44]
	add r4, sp, #0xec
	strh r3, [r4]
	orrs r0, r1
	strh r0, [r2, #8]
	mov r0, ip
	str r0, [sp, #0x24]
	adds r0, r2, #0
	add r1, sp, #0x118
	ldrh r1, [r1]
	strh r1, [r0, #2]
	ldr r0, _0804D324 @ =0x08C09D60
	str r0, [sp, #0x44]
	mov r2, sb
	ldr r2, [r2, #0x50]
	str r2, [sp, #0xf0]
	cmp r2, #0
	bne _0804D354
	lsls r0, r5, #0x10
	asrs r2, r0, #0x10
	adds r5, r0, #0
	add r4, sp, #0x50
	cmp r2, #0
	beq _0804D2F2
	lsls r1, r6, #0x10
	asrs r1, r1, #0x10
	adds r0, r4, #0
	bl sub_0806748C
	ldr r3, [sp, #0xd8]
	cmp r3, #1
	bne _0804D2CE
	ldr r1, _0804D328 @ =0x02017048
	adds r0, r4, #0
	bl sub_0804C8F4
_0804D2CE:
	add r1, sp, #8
	ldr r0, [sp, #0xe0]
	adds r0, #0x8e
	strh r0, [r1, #4]
	adds r2, r1, #0
	movs r0, #0xfc
	lsls r0, r0, #8
	ldrh r1, [r1, #8]
	ands r0, r1
	movs r1, #0x10
	orrs r0, r1
	strh r0, [r2, #8]
	adds r0, r2, #0
	add r1, sp, #0xf0
	ldrh r1, [r1]
	strh r1, [r0, #0xc]
	bl sub_0800650C
_0804D2F2:
	lsls r1, r7, #0x10
	asrs r1, r1, #0x10
	mov r3, r8
	lsls r2, r3, #0x10
	asrs r2, r2, #0x10
	adds r0, r4, #0
	bl sub_0806748C
	ldr r0, [sp, #0xd8]
	cmp r0, #1
	bne _0804D310
	ldr r1, _0804D32C @ =0x02017448
	adds r0, r4, #0
	bl sub_0804C8F4
_0804D310:
	cmp r5, #0
	beq _0804D330
	add r1, sp, #8
	ldr r0, [sp, #0xe0]
	adds r0, #0x95
	strh r0, [r1, #4]
	b _0804D338
	.align 2, 0
_0804D320: .4byte 0xFFD80000
_0804D324: .4byte 0x08C09D60
_0804D328: .4byte 0x02017048
_0804D32C: .4byte 0x02017448
_0804D330:
	add r0, sp, #8
	add r1, sp, #0x114
	ldrh r1, [r1]
	strh r1, [r0, #4]
_0804D338:
	add r2, sp, #8
	adds r1, r2, #0
	movs r0, #0xfc
	lsls r0, r0, #8
	ldrh r1, [r1, #8]
	ands r0, r1
	movs r3, #0
	movs r1, #0x30
	orrs r0, r1
	strh r0, [r2, #8]
	adds r0, r2, #0
	strh r3, [r0, #0xc]
	bl sub_0800650C
_0804D354:
	ldr r2, [sp, #0xd8]
	cmp r2, #1
	bne _0804D366
	ldr r0, _0804D50C @ =0x02016E48
	ldr r1, _0804D510 @ =0x06013000
	movs r2, #0x80
	lsls r2, r2, #4
	bl RegisterDataMove
_0804D366:
	mov r3, sb
	ldr r4, [r3, #0x4c]
	cmp r4, #0
	bne _0804D3C4
	str r4, [sp, #0x24]
	ldr r0, _0804D514 @ =0x08C09DA8
	str r0, [sp, #0x44]
	add r0, sp, #8
	ldr r1, _0804D518 @ =0x000051D0
	strh r1, [r0, #8]
	adds r2, r0, #0
	ldr r0, [r3, #0x44]
	orrs r0, r1
	strh r0, [r2, #8]
	adds r1, r2, #0
	mov r0, sl
	adds r0, #0xf
	strh r0, [r1, #2]
	ldr r0, [sp, #0xe0]
	adds r0, #0x70
	strh r0, [r1, #4]
	adds r0, r1, #0
	strh r4, [r0, #0xc]
	bl sub_0800650C
	str r4, [sp, #0x24]
	ldr r0, _0804D51C @ =0x08C09DD8
	str r0, [sp, #0x44]
	add r0, sp, #8
	ldr r1, _0804D520 @ =0x000051C0
	strh r1, [r0, #8]
	adds r2, r0, #0
	mov r3, sb
	ldr r0, [r3, #0x44]
	orrs r0, r1
	strh r0, [r2, #8]
	adds r1, r2, #0
	mov r0, sl
	adds r0, #0x65
	strh r0, [r1, #2]
	ldr r0, [sp, #0xe0]
	adds r0, #0x78
	strh r0, [r1, #4]
	adds r0, r1, #0
	strh r4, [r0, #0xc]
	bl sub_0800650C
_0804D3C4:
	mov r0, sb
	ldr r4, [r0, #0x50]
	cmp r4, #0
	bne _0804D424
	str r4, [sp, #0x24]
	ldr r0, _0804D514 @ =0x08C09DA8
	str r0, [sp, #0x44]
	add r0, sp, #8
	ldr r1, _0804D524 @ =0x000061F0
	strh r1, [r0, #8]
	adds r2, r0, #0
	mov r3, sb
	ldr r0, [r3, #0x44]
	orrs r0, r1
	strh r0, [r2, #8]
	adds r1, r2, #0
	mov r0, sl
	adds r0, #0xd7
	strh r0, [r1, #2]
	ldr r0, [sp, #0xe0]
	adds r0, #0x70
	strh r0, [r1, #4]
	adds r0, r1, #0
	strh r4, [r0, #0xc]
	bl sub_0800650C
	str r4, [sp, #0x24]
	ldr r0, _0804D528 @ =0x08C09E14
	str r0, [sp, #0x44]
	add r0, sp, #8
	ldr r1, _0804D52C @ =0x000061C0
	strh r1, [r0, #8]
	adds r2, r0, #0
	mov r3, sb
	ldr r0, [r3, #0x44]
	orrs r0, r1
	strh r0, [r2, #8]
	adds r1, r2, #0
	mov r0, sl
	adds r0, #0x87
	strh r0, [r1, #2]
	ldr r0, [sp, #0xe0]
	adds r0, #0x78
	strh r0, [r1, #4]
	adds r0, r1, #0
	strh r4, [r0, #0xc]
	bl sub_0800650C
_0804D424:
	mov r0, sb
	ldr r4, [r0, #0x4c]
	cmp r4, #0
	bne _0804D490
	str r4, [sp, #0x24]
	ldr r1, _0804D530 @ =0x0203E0B8
	movs r2, #0
	ldrsh r0, [r1, r2]
	ldr r5, [sp, #0xe0]
	adds r5, #0x7a
	cmp r0, #0
	beq _0804D46A
	adds r1, r0, #0
	add r0, sp, #8
	ldr r2, [sp, #0xe4]
	bl sub_0804CCE0
	add r0, sp, #8
	movs r1, #0xe5
	lsls r1, r1, #1
	strh r1, [r0, #8]
	adds r2, r0, #0
	mov r3, sb
	ldr r0, [r3, #0x44]
	orrs r0, r1
	strh r0, [r2, #8]
	adds r1, r2, #0
	mov r0, sl
	adds r0, #0x36
	strh r0, [r1, #2]
	adds r0, r1, #0
	strh r5, [r0, #4]
	strh r4, [r0, #0xc]
	bl sub_0800650C
_0804D46A:
	ldr r0, _0804D534 @ =0x08C09E50
	str r0, [sp, #0x44]
	add r0, sp, #8
	ldr r1, _0804D538 @ =0x0000D1DC
	strh r1, [r0, #8]
	adds r2, r0, #0
	mov r3, sb
	ldr r0, [r3, #0x44]
	orrs r0, r1
	strh r0, [r2, #8]
	adds r1, r2, #0
	mov r0, sl
	adds r0, #0x2c
	strh r0, [r1, #2]
	adds r0, r1, #0
	strh r5, [r0, #4]
	strh r4, [r0, #0xc]
	bl sub_0800650C
_0804D490:
	mov r0, sb
	ldr r4, [r0, #0x50]
	cmp r4, #0
	bne _0804D4FC
	str r4, [sp, #0x24]
	ldr r1, _0804D530 @ =0x0203E0B8
	movs r2, #2
	ldrsh r0, [r1, r2]
	ldr r5, [sp, #0xe0]
	adds r5, #0x7a
	cmp r0, #0
	beq _0804D4D6
	adds r1, r0, #0
	add r0, sp, #8
	ldr r2, [sp, #0xe4]
	bl sub_0804CCE0
	add r0, sp, #8
	movs r1, #0xe5
	lsls r1, r1, #1
	strh r1, [r0, #8]
	adds r2, r0, #0
	mov r3, sb
	ldr r0, [r3, #0x44]
	orrs r0, r1
	strh r0, [r2, #8]
	adds r1, r2, #0
	mov r0, sl
	adds r0, #0x85
	strh r0, [r1, #2]
	adds r0, r1, #0
	strh r5, [r0, #4]
	strh r4, [r0, #0xc]
	bl sub_0800650C
_0804D4D6:
	ldr r0, _0804D534 @ =0x08C09E50
	str r0, [sp, #0x44]
	add r0, sp, #8
	ldr r1, _0804D53C @ =0x0000E1DE
	strh r1, [r0, #8]
	adds r2, r0, #0
	mov r3, sb
	ldr r0, [r3, #0x44]
	orrs r0, r1
	strh r0, [r2, #8]
	adds r1, r2, #0
	mov r0, sl
	adds r0, #0x7b
	strh r0, [r1, #2]
	adds r0, r1, #0
	strh r5, [r0, #4]
	strh r4, [r0, #0xc]
	bl sub_0800650C
_0804D4FC:
	add sp, #0x120
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0804D50C: .4byte 0x02016E48
_0804D510: .4byte 0x06013000
_0804D514: .4byte 0x08C09DA8
_0804D518: .4byte 0x000051D0
_0804D51C: .4byte 0x08C09DD8
_0804D520: .4byte 0x000051C0
_0804D524: .4byte 0x000061F0
_0804D528: .4byte 0x08C09E14
_0804D52C: .4byte 0x000061C0
_0804D530: .4byte 0x0203E0B8
_0804D534: .4byte 0x08C09E50
_0804D538: .4byte 0x0000D1DC
_0804D53C: .4byte 0x0000E1DE

	thumb_func_start sub_0804D540
sub_0804D540: @ 0x0804D540
	push {r4, lr}
	ldr r4, _0804D568 @ =0x0200006C
	ldr r0, _0804D56C @ =0x08C09EF8
	movs r1, #5
	bl Proc_Start
	str r0, [r4]
	movs r0, #0
	movs r1, #0
	bl sub_0804D5C4
	bl sub_0804D584
	bl sub_0804D61C
	bl sub_0804D5FC
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0804D568: .4byte 0x0200006C
_0804D56C: .4byte 0x08C09EF8

	thumb_func_start sub_0804D570
sub_0804D570: @ 0x0804D570
	push {lr}
	ldr r0, _0804D580 @ =0x0200006C
	ldr r0, [r0]
	bl Proc_End
	pop {r0}
	bx r0
	.align 2, 0
_0804D580: .4byte 0x0200006C

	thumb_func_start sub_0804D584
sub_0804D584: @ 0x0804D584
	ldr r0, _0804D590 @ =0x0200006C
	ldr r1, [r0]
	movs r0, #0
	str r0, [r1, #0x4c]
	str r0, [r1, #0x50]
	bx lr
	.align 2, 0
_0804D590: .4byte 0x0200006C

	thumb_func_start sub_0804D594
sub_0804D594: @ 0x0804D594
	ldr r0, _0804D5A0 @ =0x0200006C
	ldr r1, [r0]
	movs r0, #1
	str r0, [r1, #0x4c]
	str r0, [r1, #0x50]
	bx lr
	.align 2, 0
_0804D5A0: .4byte 0x0200006C

	thumb_func_start sub_0804D5A4
sub_0804D5A4: @ 0x0804D5A4
	ldr r0, _0804D5B0 @ =0x0200006C
	ldr r1, [r0]
	movs r0, #1
	str r0, [r1, #0x4c]
	bx lr
	.align 2, 0
_0804D5B0: .4byte 0x0200006C

	thumb_func_start sub_0804D5B4
sub_0804D5B4: @ 0x0804D5B4
	ldr r0, _0804D5C0 @ =0x0200006C
	ldr r1, [r0]
	movs r0, #1
	str r0, [r1, #0x50]
	bx lr
	.align 2, 0
_0804D5C0: .4byte 0x0200006C

	thumb_func_start sub_0804D5C4
sub_0804D5C4: @ 0x0804D5C4
	ldr r2, _0804D5D4 @ =0x0200006C
	ldr r2, [r2]
	movs r3, #0
	strh r0, [r2, #0x32]
	strh r1, [r2, #0x3a]
	adds r2, #0x29
	strb r3, [r2]
	bx lr
	.align 2, 0
_0804D5D4: .4byte 0x0200006C

	thumb_func_start sub_0804D5D8
sub_0804D5D8: @ 0x0804D5D8
	ldr r2, _0804D5E8 @ =0x0200006C
	ldr r2, [r2]
	strh r0, [r2, #0x32]
	strh r1, [r2, #0x3a]
	adds r2, #0x29
	movs r0, #1
	strb r0, [r2]
	bx lr
	.align 2, 0
_0804D5E8: .4byte 0x0200006C

	thumb_func_start sub_0804D5EC
sub_0804D5EC: @ 0x0804D5EC
	ldr r0, _0804D5F8 @ =0x0200006C
	ldr r0, [r0]
	adds r0, #0x29
	movs r1, #1
	strb r1, [r0]
	bx lr
	.align 2, 0
_0804D5F8: .4byte 0x0200006C

	thumb_func_start sub_0804D5FC
sub_0804D5FC: @ 0x0804D5FC
	ldr r0, _0804D608 @ =0x0200006C
	ldr r0, [r0]
	adds r0, #0x29
	movs r1, #0
	strb r1, [r0]
	bx lr
	.align 2, 0
_0804D608: .4byte 0x0200006C

	thumb_func_start sub_0804D60C
sub_0804D60C: @ 0x0804D60C
	ldr r0, _0804D618 @ =0x0200006C
	ldr r0, [r0]
	adds r0, #0x2a
	movs r1, #1
	strb r1, [r0]
	bx lr
	.align 2, 0
_0804D618: .4byte 0x0200006C

	thumb_func_start sub_0804D61C
sub_0804D61C: @ 0x0804D61C
	ldr r0, _0804D628 @ =0x0200006C
	ldr r0, [r0]
	adds r0, #0x2a
	movs r1, #0
	strb r1, [r0]
	bx lr
	.align 2, 0
_0804D628: .4byte 0x0200006C

	thumb_func_start sub_0804D62C
sub_0804D62C: @ 0x0804D62C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	adds r7, r0, #0
	adds r0, #0x2a
	ldrb r0, [r0]
	cmp r0, #1
	beq _0804D71C
	adds r0, r7, #0
	adds r0, #0x29
	ldrb r0, [r0]
	cmp r0, #0
	bne _0804D71C
	ldrh r1, [r7, #0x3a]
	lsls r0, r1, #0x10
	asrs r0, r0, #0x13
	lsls r2, r0, #5
	mov r8, r2
	cmp r2, #0
	bge _0804D65E
	movs r1, #0
	mov r8, r1
_0804D65E:
	adds r6, r0, #7
	cmp r6, #6
	ble _0804D666
	movs r6, #6
_0804D666:
	movs r0, #6
	subs r0, r0, r6
	lsls r1, r0, #4
	subs r1, r1, r0
	lsls r1, r1, #1
	mov sl, r1
	ldr r0, _0804D684 @ =0x0203E004
	movs r2, #0
	ldrsh r0, [r0, r2]
	cmp r0, #0
	blt _0804D688
	cmp r0, #2
	bgt _0804D688
	movs r4, #0
	b _0804D68A
	.align 2, 0
_0804D684: .4byte 0x0203E004
_0804D688:
	movs r4, #0xf
_0804D68A:
	ldr r0, _0804D72C @ =gBg0Tm
	mov sb, r0
	movs r0, #0x9f
	str r0, [sp]
	mov r0, sb
	movs r1, #0x1e
	movs r2, #7
	movs r3, #0
	bl sub_080671A0
	cmp r6, #0
	ble _0804D716
	ldr r0, [r7, #0x4c]
	cmp r0, #0
	bne _0804D6DC
	ldr r0, _0804D730 @ =0x081DE8A8
	add r0, sl
	mov r1, r8
	lsls r5, r1, #1
	lsls r1, r4, #1
	add r1, sb
	adds r5, r5, r1
	lsls r4, r6, #0x10
	lsrs r4, r4, #0x10
	movs r1, #1
	rsbs r1, r1, #0
	str r1, [sp]
	str r1, [sp, #4]
	adds r1, r5, #0
	movs r2, #0xf
	adds r3, r4, #0
	bl sub_080672B8
	movs r0, #0x80
	str r0, [sp]
	adds r0, r5, #0
	movs r1, #0xf
	adds r2, r4, #0
	movs r3, #2
	bl sub_08067128
_0804D6DC:
	ldr r0, [r7, #0x50]
	cmp r0, #0
	bne _0804D716
	ldr r0, _0804D734 @ =0x081DE95C
	add r0, sl
	mov r2, r8
	lsls r5, r2, #1
	movs r2, #0xf
	lsls r1, r2, #1
	add r1, sb
	adds r5, r5, r1
	lsls r4, r6, #0x10
	lsrs r4, r4, #0x10
	movs r1, #1
	rsbs r1, r1, #0
	str r1, [sp]
	str r1, [sp, #4]
	adds r1, r5, #0
	adds r3, r4, #0
	bl sub_080672B8
	movs r0, #0x80
	str r0, [sp]
	adds r0, r5, #0
	movs r1, #0xf
	adds r2, r4, #0
	movs r3, #3
	bl sub_08067128
_0804D716:
	movs r0, #1
	bl EnableBgSync
_0804D71C:
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0804D72C: .4byte gBg0Tm
_0804D730: .4byte 0x081DE8A8
_0804D734: .4byte 0x081DE95C

	thumb_func_start sub_0804D738
sub_0804D738: @ 0x0804D738
	push {r4, r5, r6, lr}
	sub sp, #0x10
	ldr r4, _0804D82C @ =gDispIo
	movs r2, #8
	rsbs r2, r2, #0
	ldrb r0, [r4]
	ands r2, r0
	movs r5, #1
	ldrb r0, [r4, #1]
	orrs r0, r5
	movs r6, #2
	orrs r0, r6
	movs r1, #4
	orrs r0, r1
	movs r1, #8
	orrs r0, r1
	movs r1, #0x10
	orrs r0, r1
	strb r0, [r4, #1]
	movs r0, #0x41
	rsbs r0, r0, #0
	ands r2, r0
	strb r2, [r4]
	movs r0, #0
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	movs r0, #1
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	movs r0, #2
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	movs r0, #0
	movs r1, #0
	bl SetBgChrOffset
	movs r0, #1
	movs r1, #0
	bl SetBgChrOffset
	movs r0, #2
	movs r1, #0
	bl SetBgChrOffset
	movs r1, #0x80
	lsls r1, r1, #8
	movs r0, #3
	bl SetBgChrOffset
	movs r1, #0xc0
	lsls r1, r1, #7
	movs r0, #0
	bl SetBgTilemapOffset
	movs r1, #0xd0
	lsls r1, r1, #7
	movs r0, #1
	bl SetBgTilemapOffset
	movs r1, #0xe0
	lsls r1, r1, #7
	movs r0, #2
	bl SetBgTilemapOffset
	movs r1, #0xf0
	lsls r1, r1, #7
	movs r0, #3
	bl SetBgTilemapOffset
	movs r1, #4
	rsbs r1, r1, #0
	adds r0, r1, #0
	ldrb r2, [r4, #0xc]
	ands r0, r2
	strb r0, [r4, #0xc]
	adds r0, r1, #0
	ldrb r2, [r4, #0x10]
	ands r0, r2
	orrs r0, r5
	strb r0, [r4, #0x10]
	ldrb r0, [r4, #0x14]
	ands r1, r0
	orrs r1, r6
	strb r1, [r4, #0x14]
	movs r0, #3
	ldrb r1, [r4, #0x18]
	orrs r0, r1
	strb r0, [r4, #0x18]
	movs r4, #0
	str r4, [sp]
	ldr r1, _0804D830 @ =gBg0Tm
	ldr r5, _0804D834 @ =0x01000200
	mov r0, sp
	adds r2, r5, #0
	bl CpuFastSet
	str r4, [sp, #4]
	add r0, sp, #4
	ldr r1, _0804D838 @ =gBg1Tm
	adds r2, r5, #0
	bl CpuFastSet
	str r4, [sp, #8]
	add r0, sp, #8
	ldr r6, _0804D83C @ =gBg2Tm
	adds r1, r6, #0
	adds r2, r5, #0
	bl CpuFastSet
	bl sub_08055CD8
	cmp r0, #0
	bne _0804D840
	bl sub_0804D894
	b _0804D84C
	.align 2, 0
_0804D82C: .4byte gDispIo
_0804D830: .4byte gBg0Tm
_0804D834: .4byte 0x01000200
_0804D838: .4byte gBg1Tm
_0804D83C: .4byte gBg2Tm
_0804D840:
	str r4, [sp, #0xc]
	add r0, sp, #0xc
	adds r1, r6, #0
	adds r2, r5, #0
	bl CpuFastSet
_0804D84C:
	bl sub_0804D9B0
	bl EnablePalSync
	movs r0, #1
	bl EnableBgSync
	movs r0, #2
	bl EnableBgSync
	movs r0, #4
	bl EnableBgSync
	ldr r3, _0804D890 @ =gDispIo
	adds r1, r3, #0
	adds r1, #0x3c
	movs r0, #0x3f
	ldrb r2, [r1]
	ands r0, r2
	strb r0, [r1]
	adds r1, #8
	movs r2, #0
	movs r0, #0x10
	strb r0, [r1]
	adds r0, r3, #0
	adds r0, #0x45
	strb r2, [r0]
	adds r0, #1
	strb r2, [r0]
	add sp, #0x10
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0804D890: .4byte gDispIo

	thumb_func_start sub_0804D894
sub_0804D894: @ 0x0804D894
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	ldr r4, _0804D8D4 @ =0x0201FAD0
	ldr r2, _0804D8D8 @ =0x0203E000
	movs r0, #0
	ldrsh r1, [r2, r0]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #3
	ldr r3, _0804D8DC @ =0x08FC0008
	adds r5, r0, r3
	movs r6, #2
	ldrsh r1, [r2, r6]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r3, r0, r3
	ldr r0, _0804D8E0 @ =0x0203E004
	movs r7, #0
	ldrsh r1, [r0, r7]
	mov r8, r2
	adds r6, r0, #0
	cmp r1, #3
	bgt _0804D8E8
	cmp r1, #1
	bge _0804D90C
	cmp r1, #0
	beq _0804D8F0
	ldr r0, _0804D8E4 @ =0x020145C8
	b _0804D91E
	.align 2, 0
_0804D8D4: .4byte 0x0201FAD0
_0804D8D8: .4byte 0x0203E000
_0804D8DC: .4byte 0x08FC0008
_0804D8E0: .4byte 0x0203E004
_0804D8E4: .4byte 0x020145C8
_0804D8E8:
	ldr r7, _0804D904 @ =0x020145C8
	mov ip, r7
	cmp r1, #4
	bne _0804D920
_0804D8F0:
	ldr r0, _0804D908 @ =0x0200003C
	ldr r1, _0804D904 @ =0x020145C8
	str r1, [r0]
	movs r7, #0x80
	lsls r7, r7, #5
	adds r2, r1, r7
	str r2, [r0, #4]
	mov ip, r1
	b _0804D920
	.align 2, 0
_0804D904: .4byte 0x020145C8
_0804D908: .4byte 0x0200003C
_0804D90C:
	ldr r0, _0804D990 @ =0x0200003C
	ldr r1, _0804D994 @ =0x02014DC8
	str r1, [r0]
	movs r7, #0x80
	lsls r7, r7, #5
	adds r2, r1, r7
	str r2, [r0, #4]
	ldr r0, _0804D998 @ =0xFFFFF800
	adds r0, r0, r1
_0804D91E:
	mov ip, r0
_0804D920:
	ldr r0, _0804D99C @ =gPlaySt
	ldrb r0, [r0, #0x15]
	ldr r0, _0804D9A0 @ =0x0200004C
	ldr r1, [r5, #0x10]
	str r1, [r0]
	ldr r1, [r3, #0x10]
	str r1, [r0, #4]
	ldr r2, _0804D9A4 @ =0x02000044
	ldr r1, _0804D9A8 @ =0x08C0A5E8
	movs r3, #0
	ldrsh r0, [r6, r3]
	lsls r0, r0, #3
	adds r0, r0, r1
	ldr r0, [r0]
	str r0, [r2]
	movs r7, #0
	ldrsh r0, [r6, r7]
	lsls r0, r0, #1
	adds r0, #1
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	str r0, [r2, #4]
	mov r1, r8
	ldrh r0, [r1]
	movs r2, #0
	strh r0, [r4]
	movs r0, #4
	strh r0, [r4, #2]
	movs r1, #0xa0
	lsls r1, r1, #2
	strh r1, [r4, #4]
	mov r3, r8
	ldrh r0, [r3, #2]
	strh r0, [r4, #6]
	movs r0, #5
	strh r0, [r4, #8]
	strh r1, [r4, #0xa]
	ldrh r0, [r6]
	strh r0, [r4, #0xc]
	movs r0, #2
	strh r0, [r4, #0xe]
	str r2, [r4, #0x1c]
	mov r6, ip
	str r6, [r4, #0x20]
	ldr r0, _0804D9AC @ =0x0203DFE6
	ldrh r0, [r0]
	strh r0, [r4, #0x10]
	adds r0, r4, #0
	bl sub_08055718
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0804D990: .4byte 0x0200003C
_0804D994: .4byte 0x02014DC8
_0804D998: .4byte 0xFFFFF800
_0804D99C: .4byte gPlaySt
_0804D9A0: .4byte 0x0200004C
_0804D9A4: .4byte 0x02000044
_0804D9A8: .4byte 0x08C0A5E8
_0804D9AC: .4byte 0x0203DFE6

	thumb_func_start sub_0804D9B0
sub_0804D9B0: @ 0x0804D9B0
	push {r4, r5, r6, lr}
	sub sp, #8
	ldr r4, _0804D9F0 @ =0x081901C8
	adds r0, r4, #0
	movs r1, #0x40
	movs r2, #0x20
	bl ApplyPaletteExt
	adds r0, r4, #0
	movs r1, #0x60
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r0, _0804D9F4 @ =0x02017648
	ldr r1, _0804D9F8 @ =0x06001400
	movs r2, #0xa0
	movs r3, #2
	bl InitTextFont
	bl sub_08005984
	ldr r0, _0804D9FC @ =0x081DE528
	ldr r1, _0804DA00 @ =0x06001000
	bl LZ77UnCompVram
	ldr r0, _0804DA04 @ =0x0203DFE8
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	bne _0804DA0C
	ldr r5, _0804DA08 @ =0x08C09CE4
	b _0804DA1A
	.align 2, 0
_0804D9F0: .4byte 0x081901C8
_0804D9F4: .4byte 0x02017648
_0804D9F8: .4byte 0x06001400
_0804D9FC: .4byte 0x081DE528
_0804DA00: .4byte 0x06001000
_0804DA04: .4byte 0x0203DFE8
_0804DA08: .4byte 0x08C09CE4
_0804DA0C:
	ldr r0, _0804DA54 @ =0x0203E06C
	ldr r0, [r0]
	ldr r0, [r0]
	ldrh r0, [r0]
	bl DecodeMsg
	adds r5, r0, #0
_0804DA1A:
	ldr r4, _0804DA58 @ =0x02017660
	adds r0, r4, #0
	movs r1, #6
	bl sub_08005344
	movs r0, #0x30
	adds r1, r5, #0
	bl sub_08005564
	adds r1, r0, #0
	adds r0, r4, #0
	bl sub_08005444
	ldr r0, _0804DA5C @ =0x081DE730
	ldr r1, _0804DA60 @ =0x06001400
	bl LZ77UnCompVram
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_080055DC
	ldr r0, _0804DA64 @ =0x0203DFE8
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	bne _0804DA6C
	ldr r5, _0804DA68 @ =0x08C09CE4
	b _0804DA7A
	.align 2, 0
_0804DA54: .4byte 0x0203E06C
_0804DA58: .4byte 0x02017660
_0804DA5C: .4byte 0x081DE730
_0804DA60: .4byte 0x06001400
_0804DA64: .4byte 0x0203DFE8
_0804DA68: .4byte 0x08C09CE4
_0804DA6C:
	ldr r0, _0804DAB4 @ =0x0203E06C
	ldr r0, [r0]
	adds r0, #0x4a
	ldrh r0, [r0]
	bl GetItemName
	adds r5, r0, #0
_0804DA7A:
	ldr r4, _0804DAB8 @ =0x02017670
	adds r0, r4, #0
	movs r1, #7
	bl sub_08005344
	movs r0, #0x38
	adds r1, r5, #0
	bl sub_08005564
	adds r1, r0, #0
	adds r0, r4, #0
	bl sub_08005444
	ldr r0, _0804DABC @ =0x081DE780
	ldr r1, _0804DAC0 @ =0x06001580
	bl LZ77UnCompVram
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_080055DC
	ldr r0, _0804DAC4 @ =0x0203DFE8
	movs r1, #2
	ldrsh r0, [r0, r1]
	cmp r0, #0
	bne _0804DACC
	ldr r5, _0804DAC8 @ =0x08C09CE4
	b _0804DADA
	.align 2, 0
_0804DAB4: .4byte 0x0203E06C
_0804DAB8: .4byte 0x02017670
_0804DABC: .4byte 0x081DE780
_0804DAC0: .4byte 0x06001580
_0804DAC4: .4byte 0x0203DFE8
_0804DAC8: .4byte 0x08C09CE4
_0804DACC:
	ldr r0, _0804DB14 @ =0x0203E070
	ldr r0, [r0]
	ldr r0, [r0]
	ldrh r0, [r0]
	bl DecodeMsg
	adds r5, r0, #0
_0804DADA:
	ldr r4, _0804DB18 @ =0x02017678
	adds r0, r4, #0
	movs r1, #6
	bl sub_08005344
	movs r0, #0x30
	adds r1, r5, #0
	bl sub_08005564
	adds r1, r0, #0
	adds r0, r4, #0
	bl sub_08005444
	ldr r0, _0804DB1C @ =0x081DE7EC
	ldr r1, _0804DB20 @ =0x06001740
	bl LZ77UnCompVram
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_080055DC
	ldr r0, _0804DB24 @ =0x0203DFE8
	movs r1, #2
	ldrsh r0, [r0, r1]
	cmp r0, #0
	bne _0804DB2C
	ldr r5, _0804DB28 @ =0x08C09CE4
	b _0804DB3A
	.align 2, 0
_0804DB14: .4byte 0x0203E070
_0804DB18: .4byte 0x02017678
_0804DB1C: .4byte 0x081DE7EC
_0804DB20: .4byte 0x06001740
_0804DB24: .4byte 0x0203DFE8
_0804DB28: .4byte 0x08C09CE4
_0804DB2C:
	ldr r0, _0804DBF0 @ =0x0203E070
	ldr r0, [r0]
	adds r0, #0x4a
	ldrh r0, [r0]
	bl GetItemName
	adds r5, r0, #0
_0804DB3A:
	ldr r4, _0804DBF4 @ =0x02017668
	adds r0, r4, #0
	movs r1, #7
	bl sub_08005344
	movs r0, #0x38
	adds r1, r5, #0
	bl sub_08005564
	adds r1, r0, #0
	adds r0, r4, #0
	bl sub_08005444
	ldr r0, _0804DBF8 @ =0x081DE83C
	ldr r1, _0804DBFC @ =0x060018C0
	bl LZ77UnCompVram
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_080055DC
	ldr r4, _0804DC00 @ =gBg0Tm
	adds r0, r4, #0
	movs r1, #0x9f
	bl TmFill
	ldr r0, _0804DC04 @ =0x081DEBC4
	adds r6, r4, #0
	adds r6, #0x3c
	movs r1, #1
	rsbs r1, r1, #0
	str r1, [sp]
	str r1, [sp, #4]
	adds r1, r6, #0
	movs r2, #2
	movs r3, #0x14
	bl sub_080672B8
	adds r4, #0x3e
	movs r5, #0x80
	str r5, [sp]
	adds r0, r4, #0
	movs r1, #1
	movs r2, #0x14
	movs r3, #2
	bl sub_08067128
	str r5, [sp]
	adds r0, r6, #0
	movs r1, #1
	movs r2, #0x14
	movs r3, #3
	bl sub_08067128
	movs r0, #1
	bl EnableBgSync
	ldr r6, _0804DC08 @ =0x0203DFF8
	movs r1, #0
	ldrsh r0, [r6, r1]
	lsls r0, r0, #5
	ldr r5, _0804DC0C @ =0x081DEC14
	adds r0, r0, r5
	ldr r4, _0804DC10 @ =0x020228A0
	adds r1, r4, #0
	movs r2, #8
	bl CpuFastSet
	movs r1, #2
	ldrsh r0, [r6, r1]
	lsls r0, r0, #5
	adds r0, r0, r5
	adds r4, #0x20
	adds r1, r4, #0
	movs r2, #8
	bl CpuFastSet
	bl EnablePalSync
	ldr r1, _0804DC14 @ =0x02000038
	movs r0, #0
	strh r0, [r1]
	strh r0, [r1, #2]
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	add sp, #8
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0804DBF0: .4byte 0x0203E070
_0804DBF4: .4byte 0x02017668
_0804DBF8: .4byte 0x081DE83C
_0804DBFC: .4byte 0x060018C0
_0804DC00: .4byte gBg0Tm
_0804DC04: .4byte 0x081DEBC4
_0804DC08: .4byte 0x0203DFF8
_0804DC0C: .4byte 0x081DEC14
_0804DC10: .4byte 0x020228A0
_0804DC14: .4byte 0x02000038

	thumb_func_start sub_0804DC18
sub_0804DC18: @ 0x0804DC18
	push {r4, r5, lr}
	ldr r0, _0804DC30 @ =0x0203E004
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #4
	bhi _0804DC58
	lsls r0, r0, #2
	ldr r1, _0804DC34 @ =_0804DC38
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0804DC30: .4byte 0x0203E004
_0804DC34: .4byte _0804DC38
_0804DC38: @ jump table
	.4byte _0804DCA0 @ case 0
	.4byte _0804DC4C @ case 1
	.4byte _0804DC58 @ case 2
	.4byte _0804DCA0 @ case 3
	.4byte _0804DCA0 @ case 4
_0804DC4C:
	ldr r0, _0804DC54 @ =0x0203DFE4
	movs r2, #0
	ldrsh r0, [r0, r2]
	b _0804DCA2
	.align 2, 0
_0804DC54: .4byte 0x0203DFE4
_0804DC58:
	movs r1, #0
	movs r5, #0
	ldr r0, _0804DC88 @ =0x0203DFE0
	movs r2, #0
	ldrsh r0, [r0, r2]
	cmp r0, #0
	bne _0804DC80
	ldr r4, _0804DC8C @ =0x0203E074
	ldrb r0, [r4]
	ldrb r1, [r4, #1]
	bl sub_08079BC8
	lsls r0, r0, #0x18
	asrs r5, r0, #0x18
	ldrb r0, [r4, #1]
	ldrb r1, [r4]
	bl sub_08079BC8
	lsls r0, r0, #0x18
	asrs r1, r0, #0x18
_0804DC80:
	cmp r5, #1
	bne _0804DC90
	movs r0, #0
	b _0804DCA2
	.align 2, 0
_0804DC88: .4byte 0x0203DFE0
_0804DC8C: .4byte 0x0203E074
_0804DC90:
	cmp r1, #1
	beq _0804DCA0
	ldr r0, _0804DC9C @ =0x0203DFE4
	movs r1, #0
	ldrsh r0, [r0, r1]
	b _0804DCA2
	.align 2, 0
_0804DC9C: .4byte 0x0203DFE4
_0804DCA0:
	movs r0, #1
_0804DCA2:
	pop {r4, r5}
	pop {r1}
	bx r1

	thumb_func_start EkrEfxStatusClear
EkrEfxStatusClear: @ 0x0804DCA8
	ldr r1, _0804DD04 @ =0x02017728
	movs r0, #0
	str r0, [r1]
	ldr r1, _0804DD08 @ =0x0201772C
	str r0, [r1]
	ldr r1, _0804DD0C @ =0x02017730
	str r0, [r1]
	ldr r1, _0804DD10 @ =0x02017738
	str r0, [r1]
	ldr r1, _0804DD14 @ =0x0201773C
	str r0, [r1]
	ldr r1, _0804DD18 @ =0x02017740
	str r0, [r1]
	ldr r1, _0804DD1C @ =0x02017748
	str r0, [r1]
	ldr r1, _0804DD20 @ =0x0201774C
	str r0, [r1]
	ldr r1, _0804DD24 @ =0x02017750
	str r0, [r1]
	ldr r1, _0804DD28 @ =0x02017754
	str r0, [r1]
	ldr r1, _0804DD2C @ =0x02017758
	str r0, [r1]
	ldr r1, _0804DD30 @ =0x0201775C
	str r0, [r1]
	ldr r1, _0804DD34 @ =0x02017760
	strh r0, [r1]
	strh r0, [r1, #2]
	ldr r1, _0804DD38 @ =0x02017764
	strh r0, [r1]
	strh r0, [r1, #2]
	ldr r1, _0804DD3C @ =0x02017768
	strh r0, [r1]
	strh r0, [r1, #2]
	ldr r1, _0804DD40 @ =0x02017780
	strh r0, [r1]
	strh r0, [r1, #2]
	ldr r1, _0804DD44 @ =0x0201776C
	str r0, [r1]
	str r0, [r1, #4]
	ldr r1, _0804DD48 @ =0x02017778
	str r0, [r1]
	ldr r1, _0804DD4C @ =0x0201777C
	str r0, [r1]
	bx lr
	.align 2, 0
_0804DD04: .4byte 0x02017728
_0804DD08: .4byte 0x0201772C
_0804DD0C: .4byte 0x02017730
_0804DD10: .4byte 0x02017738
_0804DD14: .4byte 0x0201773C
_0804DD18: .4byte 0x02017740
_0804DD1C: .4byte 0x02017748
_0804DD20: .4byte 0x0201774C
_0804DD24: .4byte 0x02017750
_0804DD28: .4byte 0x02017754
_0804DD2C: .4byte 0x02017758
_0804DD30: .4byte 0x0201775C
_0804DD34: .4byte 0x02017760
_0804DD38: .4byte 0x02017764
_0804DD3C: .4byte 0x02017768
_0804DD40: .4byte 0x02017780
_0804DD44: .4byte 0x0201776C
_0804DD48: .4byte 0x02017778
_0804DD4C: .4byte 0x0201777C

	thumb_func_start sub_0804DD50
sub_0804DD50: @ 0x0804DD50
	ldr r0, _0804DD64 @ =0x02017728
	ldr r0, [r0]
	cmp r0, #0
	bne _0804DD6C
	ldr r0, _0804DD68 @ =0x0201772C
	ldr r0, [r0]
	cmp r0, #0
	bne _0804DD6C
	movs r0, #1
	b _0804DD6E
	.align 2, 0
_0804DD64: .4byte 0x02017728
_0804DD68: .4byte 0x0201772C
_0804DD6C:
	movs r0, #0
_0804DD6E:
	bx lr
