	.include "macro.inc"
	.syntax unified

	thumb_func_start SetupBanim
SetupBanim: @ 0x08051170
	push {lr}
	bl PrepareBattleGraphicsMaybe
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start BeginAnimsOnBattleAnimations
BeginAnimsOnBattleAnimations: @ 0x08051180
	push {lr}
	bl sub_08055CD8
	cmp r0, #1
	bne _08051190
	bl sub_08055D58
	b _080511D0
_08051190:
	bl sub_0806BF78
	cmp r0, #1
	bne _0805119E
	bl sub_0806BF94
	b _080511D0
_0805119E:
	bl NewEkrBattleDeamon
	bl AnimClearAll
	bl sub_0804DC18
	ldr r1, _080511D4 @ =0x02017744
	str r0, [r1]
	bl sub_08051288
	ldr r0, _080511D8 @ =gAnims
	movs r1, #0
	str r1, [r0]
	str r1, [r0, #4]
	str r1, [r0, #8]
	str r1, [r0, #0xc]
	ldr r0, _080511DC @ =0x02000010
	str r1, [r0]
	str r1, [r0, #4]
	ldr r0, _080511E0 @ =sub_08051214
	bl SetMainFunc
	movs r0, #0
	bl SetOnHBlankA
_080511D0:
	pop {r0}
	bx r0
	.align 2, 0
_080511D4: .4byte 0x02017744
_080511D8: .4byte gAnims
_080511DC: .4byte 0x02000010
_080511E0: .4byte sub_08051214

	thumb_func_start EkrBattleEndRountine
EkrBattleEndRountine: @ 0x080511E4
	push {lr}
	bl sub_08055CD8
	cmp r0, #1
	bne _080511F4
	bl sub_08055D7C
	b _0805120C
_080511F4:
	bl sub_0806BF78
	cmp r0, #1
	bne _08051202
	bl sub_0806BFB8
	b _0805120C
_08051202:
	bl sub_08051690
	ldr r0, _08051210 @ =sub_08051214
	bl SetMainFunc
_0805120C:
	pop {r0}
	bx r0
	.align 2, 0
_08051210: .4byte sub_08051214

	thumb_func_start sub_08051214
sub_08051214: @ 0x08051214
	push {r4, lr}
	ldr r0, _08051278 @ =gpKeySt
	ldr r0, [r0]
	bl RefreshKeySt
	bl ClearSprites
	ldr r4, _0805127C @ =0x02026A28
	ldr r0, [r4, #4]
	bl Proc_Run
	bl sub_080157A4
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0805123A
	ldr r0, [r4, #8]
	bl Proc_Run
_0805123A:
	ldr r0, [r4, #0xc]
	bl Proc_Run
	ldr r0, [r4, #0x14]
	bl Proc_Run
	movs r0, #0
	bl PushSpriteLayerObjects
	ldr r0, [r4, #0x10]
	bl Proc_Run
	bl AnimUpdateAll
	bl BattleAIS_ExecCommands
	movs r0, #0xd
	bl PushSpriteLayerObjects
	ldr r1, _08051280 @ =gBmSt
	movs r0, #1
	strb r0, [r1]
	ldr r0, _08051284 @ =0x04000006
	ldrh r0, [r0]
	strh r0, [r1, #6]
	bl VBlankIntrWait
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08051278: .4byte gpKeySt
_0805127C: .4byte 0x02026A28
_08051280: .4byte gBmSt
_08051284: .4byte 0x04000006

	thumb_func_start sub_08051288
sub_08051288: @ 0x08051288
	push {lr}
	ldr r0, _08051298 @ =0x08C0A350
	movs r1, #3
	bl Proc_Start
	pop {r0}
	bx r0
	.align 2, 0
_08051298: .4byte 0x08C0A350

	thumb_func_start sub_0805129C
sub_0805129C: @ 0x0805129C
	push {r4, r5, r6, lr}
	mov r6, sl
	mov r5, sb
	mov r4, r8
	push {r4, r5, r6}
	sub sp, #4
	adds r5, r0, #0
	movs r4, #0
	movs r3, #0
	strh r3, [r5, #0x2c]
	movs r0, #0xf
	strh r0, [r5, #0x2e]
	ldr r2, _0805139C @ =0x0203E006
	movs r1, #0
	ldrsh r0, [r2, r1]
	movs r6, #4
	ldrsh r1, [r2, r6]
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r0, #8
	strh r0, [r5, #0x34]
	strh r0, [r5, #0x32]
	movs r1, #2
	ldrsh r0, [r2, r1]
	movs r6, #6
	ldrsh r1, [r2, r6]
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r0, #8
	strh r0, [r5, #0x3c]
	strh r0, [r5, #0x3a]
	str r3, [sp]
	ldr r1, _080513A0 @ =gBg2Tm
	ldr r2, _080513A4 @ =0x01000200
	mov r0, sp
	bl CpuFastSet
	movs r0, #4
	bl EnableBgSync
	ldr r6, _080513A8 @ =gDispIo
	adds r1, r6, #0
	adds r1, #0x3c
	movs r0, #0xc0
	ldrb r2, [r1]
	orrs r0, r2
	strb r0, [r1]
	adds r0, r6, #0
	adds r0, #0x44
	strb r4, [r0]
	adds r0, #1
	strb r4, [r0]
	adds r1, #0xa
	movs r0, #4
	mov sl, r0
	movs r0, #4
	strb r0, [r1]
	ldr r0, _080513AC @ =0x0000FFE0
	ldrh r1, [r6, #0x3c]
	ands r0, r1
	movs r1, #8
	orrs r0, r1
	strh r0, [r6, #0x3c]
	movs r2, #0x20
	mov sb, r2
	mov r0, sb
	ldrb r1, [r6, #1]
	orrs r0, r1
	movs r1, #0x41
	rsbs r1, r1, #0
	ands r0, r1
	movs r1, #0x7f
	ands r0, r1
	strb r0, [r6, #1]
	adds r0, r6, #0
	adds r0, #0x2d
	strb r4, [r0]
	adds r0, #4
	strb r4, [r0]
	adds r1, r6, #0
	adds r1, #0x2c
	movs r0, #0xf0
	strb r0, [r1]
	adds r1, #4
	movs r0, #0xa0
	strb r0, [r1]
	movs r2, #0x34
	adds r2, r2, r6
	mov r8, r2
	movs r0, #1
	ldrb r1, [r2]
	orrs r1, r0
	movs r4, #2
	orrs r1, r4
	mov r2, sl
	orrs r1, r2
	movs r3, #8
	orrs r1, r3
	movs r2, #0x10
	orrs r1, r2
	adds r6, #0x36
	ldrb r2, [r6]
	orrs r0, r2
	orrs r0, r4
	mov r2, sl
	orrs r0, r2
	orrs r0, r3
	movs r2, #0x11
	rsbs r2, r2, #0
	ands r0, r2
	subs r2, #0x10
	ands r1, r2
	mov r2, r8
	strb r1, [r2]
	mov r1, sb
	orrs r0, r1
	strb r0, [r6]
	adds r0, r5, #0
	bl Proc_Break
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0805139C: .4byte 0x0203E006
_080513A0: .4byte gBg2Tm
_080513A4: .4byte 0x01000200
_080513A8: .4byte gDispIo
_080513AC: .4byte 0x0000FFE0

	thumb_func_start sub_080513B0
sub_080513B0: @ 0x080513B0
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #4
	adds r7, r0, #0
	ldrh r0, [r7, #0x2c]
	ldrh r1, [r7, #0x2e]
	cmp r0, r1
	beq _080513C8
	adds r0, #1
	strh r0, [r7, #0x2c]
_080513C8:
	movs r0, #0x32
	ldrsh r2, [r7, r0]
	movs r1, #0x2c
	ldrsh r3, [r7, r1]
	movs r1, #0x2e
	ldrsh r0, [r7, r1]
	str r0, [sp]
	movs r0, #0
	movs r1, #0
	bl Interpolate
	adds r6, r0, #0
	movs r0, #0x3a
	ldrsh r2, [r7, r0]
	movs r1, #0x2c
	ldrsh r3, [r7, r1]
	movs r1, #0x2e
	ldrsh r0, [r7, r1]
	str r0, [sp]
	movs r0, #0
	movs r1, #0
	bl Interpolate
	adds r5, r0, #0
	movs r0, #0x34
	ldrsh r2, [r7, r0]
	movs r1, #0x2c
	ldrsh r3, [r7, r1]
	movs r1, #0x2e
	ldrsh r0, [r7, r1]
	str r0, [sp]
	movs r0, #0
	movs r1, #0xf0
	bl Interpolate
	adds r4, r0, #0
	movs r0, #0x3c
	ldrsh r2, [r7, r0]
	movs r1, #0x2c
	ldrsh r3, [r7, r1]
	movs r1, #0x2e
	ldrsh r0, [r7, r1]
	str r0, [sp]
	movs r0, #0
	movs r1, #0xa0
	bl Interpolate
	ldr r1, _080514B0 @ =gDispIo
	movs r2, #0x2d
	adds r2, r2, r1
	mov r8, r2
	movs r2, #0
	mov sb, r2
	mov r2, r8
	strb r6, [r2]
	adds r6, r1, #0
	adds r6, #0x31
	strb r5, [r6]
	adds r5, r1, #0
	adds r5, #0x2c
	strb r4, [r5]
	adds r4, r1, #0
	adds r4, #0x30
	strb r0, [r4]
	ldrh r0, [r7, #0x2c]
	ldrh r2, [r7, #0x2e]
	cmp r0, r2
	bne _080514A0
	adds r2, r1, #0
	adds r2, #0x36
	movs r0, #1
	ldrb r1, [r2]
	orrs r0, r1
	movs r1, #2
	orrs r0, r1
	movs r1, #4
	orrs r0, r1
	movs r1, #8
	orrs r0, r1
	movs r1, #0x10
	orrs r0, r1
	strb r0, [r2]
	movs r0, #0
	bl InitOam
	bl sub_0802D874
	mov r0, sb
	mov r2, r8
	strb r0, [r2]
	strb r0, [r6]
	movs r0, #0xf0
	strb r0, [r5]
	movs r0, #0xa0
	strb r0, [r4]
	ldr r0, _080514B4 @ =gPal
	movs r1, #6
	movs r2, #0xa
	movs r3, #4
	bl sub_080676D4
	bl EnablePalSync
	bl MU_EndAll
	adds r0, r7, #0
	bl Proc_Break
_080514A0:
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080514B0: .4byte gDispIo
_080514B4: .4byte gPal

	thumb_func_start sub_080514B8
sub_080514B8: @ 0x080514B8
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r0, _080514E4 @ =0x0203DFE0
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	bne _0805151C
	bl sub_0804C9AC
	bl sub_0804D540
	ldr r0, _080514E8 @ =gEkrDistanceType
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #3
	beq _080514EC
	cmp r0, #3
	ble _0805151C
	cmp r0, #4
	beq _08051514
	b _0805151C
	.align 2, 0
_080514E4: .4byte 0x0203DFE0
_080514E8: .4byte gEkrDistanceType
_080514EC:
	ldr r4, _08051510 @ =0x0203DFE8
	movs r1, #0
	ldrsh r0, [r4, r1]
	cmp r0, #0
	bne _080514FE
	bl sub_0804CC48
	bl sub_0804D5A4
_080514FE:
	movs r1, #2
	ldrsh r0, [r4, r1]
	cmp r0, #0
	bne _0805151C
	bl sub_0804CC58
	bl sub_0804D5B4
	b _0805151C
	.align 2, 0
_08051510: .4byte 0x0203DFE8
_08051514:
	bl sub_0804CC48
	bl sub_0804D5A4
_0805151C:
	bl sub_0804D738
	movs r0, #0
	bl NewEkrUnitKakudai
	movs r0, #0
	bl sub_08051A50
	movs r0, #0
	movs r1, #0xb
	bl sub_08052278
	movs r0, #0
	movs r1, #0xb
	movs r2, #0
	bl sub_0805235C
	movs r0, #0
	movs r1, #0xb
	bl sub_0805245C
	movs r0, #0
	strh r0, [r5, #0x2c]
	adds r0, r5, #0
	bl Proc_Break
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_08051558
sub_08051558: @ 0x08051558
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0xb
	ble _08051598
	ldr r0, _08051588 @ =0x0203DFE2
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	beq _0805157C
	bl sub_080652AC
	cmp r0, #0
	beq _0805158C
_0805157C:
	bl NewEkrBattle
	adds r0, r4, #0
	bl Proc_End
	b _08051598
	.align 2, 0
_08051588: .4byte 0x0203DFE2
_0805158C:
	strh r0, [r4, #0x2c]
	bl NewEkrBattle
	adds r0, r4, #0
	bl Proc_Break
_08051598:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_080515A0
sub_080515A0: @ 0x080515A0
	push {r4, lr}
	sub sp, #4
	adds r4, r0, #0
	movs r0, #0x2c
	ldrsh r3, [r4, r0]
	movs r0, #8
	str r0, [sp]
	movs r0, #0
	movs r1, #4
	movs r2, #0x10
	bl Interpolate
	bl sub_08067AB0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #9
	bne _080515D4
	movs r0, #0
	strh r0, [r4, #0x2c]
	adds r0, r4, #0
	bl Proc_Break
_080515D4:
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_080515DC
sub_080515DC: @ 0x080515DC
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _080515F0 @ =0x0203DFE6
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	bne _080515F8
	ldr r1, _080515F4 @ =0x0201FACC
	movs r0, #6
	b _080515FC
	.align 2, 0
_080515F0: .4byte 0x0203DFE6
_080515F4: .4byte 0x0201FACC
_080515F8:
	ldr r1, _08051624 @ =0x0201FACC
	movs r0, #0xa
_080515FC:
	str r0, [r1]
	ldr r0, _08051628 @ =0x0203DFE2
	movs r1, #0
	ldrsh r0, [r0, r1]
	subs r0, #1
	bl sub_0806B800
	ldr r0, _0805162C @ =gPal
	movs r1, #6
	movs r2, #0xa
	movs r3, #0x10
	bl sub_080676D4
	adds r0, r4, #0
	bl Proc_Break
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08051624: .4byte 0x0201FACC
_08051628: .4byte 0x0203DFE2
_0805162C: .4byte gPal

	thumb_func_start sub_08051630
sub_08051630: @ 0x08051630
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	movs r0, #0x2c
	ldrsh r3, [r5, r0]
	movs r0, #8
	str r0, [sp]
	movs r0, #0
	movs r1, #0x10
	movs r2, #0
	bl Interpolate
	adds r4, r0, #0
	ldr r0, _08051688 @ =0x0203DFE2
	movs r1, #0
	ldrsh r0, [r0, r1]
	subs r0, #1
	bl sub_0806B7DC
	ldr r0, _0805168C @ =gPal
	movs r1, #6
	movs r2, #0xa
	adds r3, r4, #0
	bl sub_080676D4
	bl EnablePalSync
	ldrh r0, [r5, #0x2c]
	adds r0, #1
	strh r0, [r5, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #9
	bne _0805167E
	movs r0, #0
	strh r0, [r5, #0x2c]
	adds r0, r5, #0
	bl Proc_Break
_0805167E:
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08051688: .4byte 0x0203DFE2
_0805168C: .4byte gPal

	thumb_func_start sub_08051690
sub_08051690: @ 0x08051690
	push {lr}
	ldr r0, _080516A4 @ =0x08C0A398
	movs r1, #3
	bl Proc_Start
	movs r1, #0
	strh r1, [r0, #0x2c]
	pop {r0}
	bx r0
	.align 2, 0
_080516A4: .4byte 0x08C0A398

	thumb_func_start sub_080516A8
sub_080516A8: @ 0x080516A8
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r5, r0, #0
	ldr r7, _080516CC @ =0x0203DFE2
	movs r1, #0
	ldrsh r0, [r7, r1]
	cmp r0, #0
	beq _080516C2
	bl sub_080652AC
	adds r6, r0, #0
	cmp r6, #0
	beq _080516D0
_080516C2:
	adds r0, r5, #0
	bl Proc_Break
	b _08051714
	.align 2, 0
_080516CC: .4byte 0x0203DFE2
_080516D0:
	movs r0, #0x2c
	ldrsh r3, [r5, r0]
	movs r0, #8
	str r0, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #0x10
	bl Interpolate
	adds r4, r0, #0
	movs r1, #0
	ldrsh r0, [r7, r1]
	subs r0, #1
	bl sub_0806B7DC
	ldr r0, _0805171C @ =gPal
	movs r1, #6
	movs r2, #0xa
	adds r3, r4, #0
	bl sub_080676D4
	bl EnablePalSync
	ldrh r0, [r5, #0x2c]
	adds r0, #1
	strh r0, [r5, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #9
	bne _08051714
	strh r6, [r5, #0x2c]
	adds r0, r5, #0
	bl Proc_Break
_08051714:
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0805171C: .4byte gPal

	thumb_func_start sub_08051720
sub_08051720: @ 0x08051720
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08051740 @ =0x0203DFE2
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	beq _08051736
	bl sub_080652AC
	cmp r0, #0
	beq _08051744
_08051736:
	adds r0, r4, #0
	bl Proc_Break
	b _0805176A
	.align 2, 0
_08051740: .4byte 0x0203DFE2
_08051744:
	ldr r0, _08051770 @ =gPlaySt
	ldrb r0, [r0, #0xe]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl sub_080195BC
	movs r0, #0x10
	bl sub_08067AB0
	bl RenderMap
	movs r0, #3
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	adds r0, r4, #0
	bl Proc_Break
_0805176A:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08051770: .4byte gPlaySt

	thumb_func_start sub_08051774
sub_08051774: @ 0x08051774
	push {r4, r5, lr}
	sub sp, #4
	adds r4, r0, #0
	ldr r0, _08051798 @ =0x0203DFE2
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	beq _0805178E
	bl sub_080652AC
	adds r5, r0, #0
	cmp r5, #0
	beq _0805179C
_0805178E:
	adds r0, r4, #0
	bl Proc_Break
	b _080517C8
	.align 2, 0
_08051798: .4byte 0x0203DFE2
_0805179C:
	movs r0, #0x2c
	ldrsh r3, [r4, r0]
	movs r0, #8
	str r0, [sp]
	movs r0, #0
	movs r1, #0x10
	movs r2, #4
	bl Interpolate
	bl sub_08067AB0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #9
	bne _080517C8
	strh r5, [r4, #0x2c]
	adds r0, r4, #0
	bl Proc_Break
_080517C8:
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start sub_080517D0
sub_080517D0: @ 0x080517D0
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0
	strh r0, [r4, #0x2c]
	ldr r2, _0805182C @ =0x0203E006
	movs r1, #0
	ldrsh r0, [r2, r1]
	movs r3, #4
	ldrsh r1, [r2, r3]
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r0, #8
	strh r0, [r4, #0x34]
	strh r0, [r4, #0x32]
	movs r1, #2
	ldrsh r0, [r2, r1]
	movs r3, #6
	ldrsh r1, [r2, r3]
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r0, #8
	strh r0, [r4, #0x3c]
	strh r0, [r4, #0x3a]
	bl AnimClearAll
	movs r0, #1
	bl NewEkrUnitKakudai
	movs r0, #1
	bl sub_08051A50
	movs r0, #1
	movs r1, #0xb
	bl sub_08052278
	movs r0, #1
	movs r1, #0xb
	bl sub_0805245C
	adds r0, r4, #0
	bl Proc_Break
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0805182C: .4byte 0x0203E006

	thumb_func_start sub_08051830
sub_08051830: @ 0x08051830
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	movs r5, #0
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0xc
	ble _080518B0
	bl EndEkrGauge
	adds r0, r4, #0
	bl Proc_Break
	bl InitBmBgLayers
	ldr r0, _080518B8 @ =gDispIo
	mov ip, r0
	movs r0, #0x20
	mov r1, ip
	ldrb r1, [r1, #1]
	orrs r0, r1
	movs r1, #0x41
	rsbs r1, r1, #0
	ands r0, r1
	movs r1, #0x7f
	ands r0, r1
	mov r2, ip
	strb r0, [r2, #1]
	mov r0, ip
	adds r0, #0x2d
	strb r5, [r0]
	adds r0, #4
	strb r5, [r0]
	subs r0, #5
	strb r5, [r0]
	adds r0, #4
	strb r5, [r0]
	mov r5, ip
	adds r5, #0x34
	movs r1, #1
	ldrb r0, [r5]
	orrs r0, r1
	movs r6, #2
	orrs r0, r6
	movs r4, #4
	orrs r0, r4
	movs r3, #8
	orrs r0, r3
	movs r2, #0x10
	orrs r0, r2
	strb r0, [r5]
	mov r2, ip
	adds r2, #0x36
	ldrb r0, [r2]
	orrs r1, r0
	orrs r1, r6
	orrs r1, r4
	orrs r1, r3
	movs r0, #0x11
	rsbs r0, r0, #0
	ands r1, r0
	strb r1, [r2]
_080518B0:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080518B8: .4byte gDispIo

	thumb_func_start sub_080518BC
sub_080518BC: @ 0x080518BC
	push {r4, r5, lr}
	adds r5, r0, #0
	movs r4, #0
	movs r0, #0
	strh r0, [r5, #0x2c]
	movs r0, #0xf
	strh r0, [r5, #0x2e]
	bl sub_08025184
	bl sub_0802E7E0
	bl RefreshUnitSprites
	bl sub_08025A0C
	bl ApplyUnitSpritePalettes
	ldr r2, _08051944 @ =gDispIo
	adds r1, r2, #0
	adds r1, #0x3c
	movs r0, #0xc0
	ldrb r3, [r1]
	orrs r0, r3
	strb r0, [r1]
	adds r0, r2, #0
	adds r0, #0x44
	strb r4, [r0]
	adds r0, #1
	strb r4, [r0]
	adds r1, #0xa
	movs r0, #4
	strb r0, [r1]
	ldr r0, _08051948 @ =0x0000FFE0
	ldrh r1, [r2, #0x3c]
	ands r0, r1
	movs r1, #8
	orrs r0, r1
	strh r0, [r2, #0x3c]
	adds r1, r2, #0
	adds r1, #0x34
	movs r0, #0x21
	rsbs r0, r0, #0
	ldrb r3, [r1]
	ands r0, r3
	strb r0, [r1]
	adds r1, #2
	movs r0, #0x20
	ldrb r2, [r1]
	orrs r0, r2
	strb r0, [r1]
	bl sub_08055CD8
	cmp r0, #1
	beq _0805192C
	bl sub_08019624
_0805192C:
	bl GetBanimLinkArenaFlag
	cmp r0, #1
	bne _08051938
	bl sub_080457A8
_08051938:
	adds r0, r5, #0
	bl Proc_Break
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08051944: .4byte gDispIo
_08051948: .4byte 0x0000FFE0

	thumb_func_start sub_0805194C
sub_0805194C: @ 0x0805194C
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #8
	adds r7, r0, #0
	ldrh r0, [r7, #0x2c]
	ldrh r1, [r7, #0x2e]
	cmp r0, r1
	beq _08051964
	adds r0, #1
	strh r0, [r7, #0x2c]
_08051964:
	movs r2, #0x32
	ldrsh r1, [r7, r2]
	movs r0, #0x2c
	ldrsh r3, [r7, r0]
	movs r2, #0x2e
	ldrsh r0, [r7, r2]
	str r0, [sp]
	movs r0, #0
	movs r2, #0
	bl Interpolate
	adds r6, r0, #0
	movs r0, #0x3a
	ldrsh r1, [r7, r0]
	movs r2, #0x2c
	ldrsh r3, [r7, r2]
	movs r2, #0x2e
	ldrsh r0, [r7, r2]
	str r0, [sp]
	movs r0, #0
	movs r2, #0
	bl Interpolate
	adds r5, r0, #0
	movs r0, #0x34
	ldrsh r1, [r7, r0]
	movs r2, #0x2c
	ldrsh r3, [r7, r2]
	movs r2, #0x2e
	ldrsh r0, [r7, r2]
	str r0, [sp]
	movs r0, #0
	movs r2, #0xf0
	bl Interpolate
	adds r4, r0, #0
	movs r0, #0x3c
	ldrsh r1, [r7, r0]
	movs r2, #0x2c
	ldrsh r3, [r7, r2]
	movs r2, #0x2e
	ldrsh r0, [r7, r2]
	str r0, [sp]
	movs r0, #0
	movs r2, #0xa0
	bl Interpolate
	ldr r1, _08051A2C @ =gDispIo
	movs r2, #0x2d
	adds r2, r2, r1
	mov sb, r2
	movs r2, #0
	mov r8, r2
	mov r2, sb
	strb r6, [r2]
	adds r6, r1, #0
	adds r6, #0x31
	strb r5, [r6]
	adds r5, r1, #0
	adds r5, #0x2c
	strb r4, [r5]
	adds r4, r1, #0
	adds r4, #0x30
	strb r0, [r4]
	mov r0, r8
	str r0, [sp, #4]
	ldr r1, _08051A30 @ =gBg2Tm
	ldr r2, _08051A34 @ =0x01000200
	add r0, sp, #4
	bl CpuFastSet
	movs r0, #4
	bl EnableBgSync
	ldrh r1, [r7, #0x2c]
	ldrh r2, [r7, #0x2e]
	cmp r1, r2
	bne _08051A1E
	movs r0, #0
	mov r1, r8
	strh r1, [r7, #0x2c]
	mov r2, sb
	strb r0, [r2]
	strb r0, [r6]
	movs r0, #0xf0
	strb r0, [r5]
	movs r0, #0xa0
	strb r0, [r4]
	bl EnablePalSync
	adds r0, r7, #0
	bl Proc_Break
_08051A1E:
	add sp, #8
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08051A2C: .4byte gDispIo
_08051A30: .4byte gBg2Tm
_08051A34: .4byte 0x01000200

	thumb_func_start sub_08051A38
sub_08051A38: @ 0x08051A38
	push {r4, lr}
	adds r4, r0, #0
	bl EndEkrBattleDeamon
	bl sub_0802E768
	adds r0, r4, #0
	bl Proc_Break
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_08051A50
sub_08051A50: @ 0x08051A50
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	ldr r3, _08051AB8 @ =gDispIo
	adds r1, r3, #0
	adds r1, #0x3c
	movs r0, #0x3f
	ldrb r2, [r1]
	ands r0, r2
	strb r0, [r1]
	adds r1, #8
	movs r2, #0
	movs r0, #0xa
	strb r0, [r1]
	adds r1, #1
	movs r0, #6
	strb r0, [r1]
	adds r0, r3, #0
	adds r0, #0x46
	strb r2, [r0]
	ldr r0, _08051ABC @ =0x0000FFE0
	ldrh r4, [r3, #0x3c]
	ands r0, r4
	ldr r1, _08051AC0 @ =0x0000E0FF
	ands r0, r1
	movs r2, #0xc0
	lsls r2, r2, #4
	adds r1, r2, #0
	orrs r0, r1
	strh r0, [r3, #0x3c]
	adds r1, r3, #0
	adds r1, #0x3d
	movs r0, #0x20
	ldrb r3, [r1]
	orrs r0, r3
	strb r0, [r1]
	ldr r0, _08051AC4 @ =0x0203E006
	movs r4, #0
	ldrsh r3, [r0, r4]
	movs r1, #4
	ldrsh r2, [r0, r1]
	cmp r3, r2
	bne _08051AC8
	movs r2, #2
	ldrsh r1, [r0, r2]
	movs r3, #6
	ldrsh r0, [r0, r3]
	movs r4, #2
	cmp r1, r0
	blt _08051AF4
	movs r4, #6
	b _08051AF4
	.align 2, 0
_08051AB8: .4byte gDispIo
_08051ABC: .4byte 0x0000FFE0
_08051AC0: .4byte 0x0000E0FF
_08051AC4: .4byte 0x0203E006
_08051AC8:
	movs r4, #2
	ldrsh r1, [r0, r4]
	movs r4, #6
	ldrsh r0, [r0, r4]
	cmp r1, r0
	bne _08051ADE
	movs r4, #4
	cmp r3, r2
	bge _08051AF4
	movs r4, #0
	b _08051AF4
_08051ADE:
	cmp r3, r2
	bge _08051AEC
	movs r4, #1
	cmp r1, r0
	blt _08051AF4
	movs r4, #7
	b _08051AF4
_08051AEC:
	movs r4, #3
	cmp r1, r0
	blt _08051AF4
	movs r4, #5
_08051AF4:
	ldr r0, _08051B08 @ =gEkrDistanceType
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #3
	bgt _08051B0C
	cmp r0, #1
	bge _08051B18
	cmp r0, #0
	beq _08051B10
	b _08051B18
	.align 2, 0
_08051B08: .4byte gEkrDistanceType
_08051B0C:
	cmp r0, #4
	bne _08051B18
_08051B10:
	ldr r0, _08051B14 @ =0x08C0A400
	b _08051B1A
	.align 2, 0
_08051B14: .4byte 0x08C0A400
_08051B18:
	ldr r0, _08051B4C @ =0x08C0A420
_08051B1A:
	lsls r1, r4, #2
	adds r0, r1, r0
	ldr r0, [r0]
	adds r6, r1, #0
	ldr r1, _08051B50 @ =0x06010000
	bl LZ77UnCompVram
	ldr r0, _08051B54 @ =0x081EDC6C
	ldr r1, _08051B58 @ =0x02022AE0
	movs r2, #1
	bl CpuFastSet
	bl EnablePalSync
	ldr r0, _08051B5C @ =gEkrDistanceType
	movs r2, #0
	ldrsh r0, [r0, r2]
	cmp r0, #4
	bls _08051B42
	b _08051E1E
_08051B42:
	lsls r0, r0, #2
	ldr r1, _08051B60 @ =_08051B64
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08051B4C: .4byte 0x08C0A420
_08051B50: .4byte 0x06010000
_08051B54: .4byte 0x081EDC6C
_08051B58: .4byte 0x02022AE0
_08051B5C: .4byte gEkrDistanceType
_08051B60: .4byte _08051B64
_08051B64: @ jump table
	.4byte _08051B78 @ case 0
	.4byte _08051C18 @ case 1
	.4byte _08051C18 @ case 2
	.4byte _08051D84 @ case 3
	.4byte _08051B78 @ case 4
_08051B78:
	ldr r0, _08051BC8 @ =0x08C0A3E8
	movs r1, #3
	bl Proc_Start
	adds r5, r0, #0
	str r7, [r5, #0x44]
	adds r1, r5, #0
	adds r1, #0x29
	movs r0, #0
	strb r0, [r1]
	strh r0, [r5, #0x2c]
	movs r0, #0xb
	strh r0, [r5, #0x2e]
	ldr r2, _08051BCC @ =0x0203E006
	movs r3, #0
	ldrsh r0, [r2, r3]
	movs r4, #4
	ldrsh r1, [r2, r4]
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r0, #8
	strh r0, [r5, #0x32]
	movs r1, #2
	ldrsh r0, [r2, r1]
	movs r3, #6
	ldrsh r1, [r2, r3]
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r0, #8
	strh r0, [r5, #0x3a]
	movs r0, #0x78
	strh r0, [r5, #0x34]
	movs r0, #0x68
	strh r0, [r5, #0x3c]
	ldr r0, [r5, #0x44]
	cmp r0, #0
	bne _08051BD4
	ldr r0, _08051BD0 @ =0x08C0A440
	b _08051BD6
	.align 2, 0
_08051BC8: .4byte 0x08C0A3E8
_08051BCC: .4byte 0x0203E006
_08051BD0: .4byte 0x08C0A440
_08051BD4:
	ldr r0, _08051C04 @ =0x08C0A4A0
_08051BD6:
	adds r0, r6, r0
	ldr r0, [r0]
	movs r1, #0x64
	bl AnimCreate
	adds r2, r0, #0
	str r2, [r5, #0x5c]
	movs r0, #0x90
	lsls r0, r0, #7
	strh r0, [r2, #8]
	ldr r0, [r2, #0x1c]
	movs r1, #0x80
	lsls r1, r1, #3
	orrs r0, r1
	str r0, [r2, #0x1c]
	ldr r0, [r5, #0x44]
	cmp r0, #0
	bne _08051C08
	ldrh r0, [r5, #0x32]
	strh r0, [r2, #2]
	ldrh r0, [r5, #0x3a]
	b _08051C0E
	.align 2, 0
_08051C04: .4byte 0x08C0A4A0
_08051C08:
	ldrh r0, [r5, #0x34]
	strh r0, [r2, #2]
	ldrh r0, [r5, #0x3c]
_08051C0E:
	strh r0, [r2, #4]
	ldr r0, _08051C14 @ =0x08C0A500
	b _08051E12
	.align 2, 0
_08051C14: .4byte 0x08C0A500
_08051C18:
	ldr r0, _08051C74 @ =0x08C0A3E8
	movs r1, #3
	bl Proc_Start
	adds r5, r0, #0
	str r7, [r5, #0x44]
	adds r1, r5, #0
	adds r1, #0x29
	movs r0, #0
	strb r0, [r1]
	strh r0, [r5, #0x2c]
	movs r0, #0xb
	strh r0, [r5, #0x2e]
	ldr r1, _08051C78 @ =0x0203E006
	movs r4, #0
	ldrsh r0, [r1, r4]
	lsls r0, r0, #4
	adds r0, #8
	strh r0, [r5, #0x32]
	movs r2, #2
	ldrsh r0, [r1, r2]
	lsls r0, r0, #4
	adds r0, #8
	strh r0, [r5, #0x3a]
	movs r2, #0x48
	strh r2, [r5, #0x34]
	movs r0, #0x68
	strh r0, [r5, #0x3c]
	ldr r0, _08051C7C @ =0x02017744
	ldr r0, [r0]
	cmp r0, #1
	bne _08051C6A
	ldr r1, _08051C80 @ =0x081DE218
	ldr r0, _08051C84 @ =gEkrDistanceType
	movs r3, #0
	ldrsh r0, [r0, r3]
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	subs r0, r2, r0
	strh r0, [r5, #0x34]
_08051C6A:
	ldr r0, [r5, #0x44]
	cmp r0, #0
	bne _08051C8C
	ldr r0, _08051C88 @ =0x08C0A460
	b _08051C8E
	.align 2, 0
_08051C74: .4byte 0x08C0A3E8
_08051C78: .4byte 0x0203E006
_08051C7C: .4byte 0x02017744
_08051C80: .4byte 0x081DE218
_08051C84: .4byte gEkrDistanceType
_08051C88: .4byte 0x08C0A460
_08051C8C:
	ldr r0, _08051CBC @ =0x08C0A4C0
_08051C8E:
	adds r0, r6, r0
	ldr r0, [r0]
	movs r1, #0x64
	bl AnimCreate
	adds r2, r0, #0
	str r2, [r5, #0x5c]
	movs r0, #0x90
	lsls r0, r0, #7
	strh r0, [r2, #8]
	ldr r0, [r2, #0x1c]
	movs r1, #0x80
	lsls r1, r1, #3
	orrs r0, r1
	str r0, [r2, #0x1c]
	ldr r0, [r5, #0x44]
	cmp r0, #0
	bne _08051CC0
	ldrh r0, [r5, #0x32]
	strh r0, [r2, #2]
	ldrh r0, [r5, #0x3a]
	b _08051CC6
	.align 2, 0
_08051CBC: .4byte 0x08C0A4C0
_08051CC0:
	ldrh r0, [r5, #0x34]
	strh r0, [r2, #2]
	ldrh r0, [r5, #0x3c]
_08051CC6:
	strh r0, [r2, #4]
	ldr r0, _08051D34 @ =0x08C0A520
	adds r0, r6, r0
	ldr r0, [r0]
	str r0, [r5, #0x60]
	movs r4, #0
	strh r4, [r5, #0x3e]
	strh r4, [r5, #0x36]
	ldr r0, _08051D38 @ =0x08C0A3E8
	movs r1, #3
	bl Proc_Start
	adds r5, r0, #0
	str r7, [r5, #0x44]
	adds r1, r5, #0
	adds r1, #0x29
	movs r0, #1
	strb r0, [r1]
	strh r4, [r5, #0x2c]
	movs r0, #0xb
	strh r0, [r5, #0x2e]
	ldr r1, _08051D3C @ =0x0203E006
	movs r4, #4
	ldrsh r0, [r1, r4]
	lsls r0, r0, #4
	adds r0, #8
	strh r0, [r5, #0x32]
	movs r2, #6
	ldrsh r0, [r1, r2]
	lsls r0, r0, #4
	adds r0, #8
	strh r0, [r5, #0x3a]
	movs r0, #0xa8
	strh r0, [r5, #0x34]
	movs r0, #0x68
	strh r0, [r5, #0x3c]
	ldr r0, _08051D40 @ =0x02017744
	ldr r0, [r0]
	cmp r0, #0
	bne _08051D28
	ldr r1, _08051D44 @ =0x081DE218
	ldr r0, _08051D48 @ =gEkrDistanceType
	movs r3, #0
	ldrsh r0, [r0, r3]
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	adds r0, #0xa8
	strh r0, [r5, #0x34]
_08051D28:
	ldr r0, [r5, #0x44]
	cmp r0, #0
	bne _08051D50
	ldr r0, _08051D4C @ =0x08C0A480
	b _08051D52
	.align 2, 0
_08051D34: .4byte 0x08C0A520
_08051D38: .4byte 0x08C0A3E8
_08051D3C: .4byte 0x0203E006
_08051D40: .4byte 0x02017744
_08051D44: .4byte 0x081DE218
_08051D48: .4byte gEkrDistanceType
_08051D4C: .4byte 0x08C0A480
_08051D50:
	ldr r0, _08051D80 @ =0x08C0A4E0
_08051D52:
	adds r0, r6, r0
	ldr r0, [r0]
	movs r1, #0x64
	bl AnimCreate
	adds r2, r0, #0
	str r2, [r5, #0x5c]
	movs r0, #0x90
	lsls r0, r0, #7
	strh r0, [r2, #8]
	ldr r0, [r2, #0x1c]
	movs r1, #0x80
	lsls r1, r1, #3
	orrs r0, r1
	str r0, [r2, #0x1c]
	ldr r0, [r5, #0x44]
	cmp r0, #0
	bne _08051E08
	ldrh r0, [r5, #0x32]
	strh r0, [r2, #2]
	ldrh r0, [r5, #0x3a]
	b _08051E0E
	.align 2, 0
_08051D80: .4byte 0x08C0A4E0
_08051D84:
	ldr r0, _08051DC8 @ =0x08C0A3E8
	movs r1, #3
	bl Proc_Start
	adds r5, r0, #0
	str r7, [r5, #0x44]
	adds r1, r5, #0
	adds r1, #0x29
	movs r0, #0
	strb r0, [r1]
	strh r0, [r5, #0x2c]
	movs r0, #0xb
	strh r0, [r5, #0x2e]
	ldr r1, _08051DCC @ =0x0203E006
	movs r4, #4
	ldrsh r0, [r1, r4]
	lsls r0, r0, #4
	adds r0, #8
	strh r0, [r5, #0x32]
	movs r2, #6
	ldrsh r0, [r1, r2]
	lsls r0, r0, #4
	adds r0, #8
	strh r0, [r5, #0x3a]
	movs r0, #0x78
	strh r0, [r5, #0x34]
	movs r0, #0x68
	strh r0, [r5, #0x3c]
	ldr r0, [r5, #0x44]
	cmp r0, #0
	bne _08051DD4
	ldr r0, _08051DD0 @ =0x08C0A480
	b _08051DD6
	.align 2, 0
_08051DC8: .4byte 0x08C0A3E8
_08051DCC: .4byte 0x0203E006
_08051DD0: .4byte 0x08C0A480
_08051DD4:
	ldr r0, _08051E04 @ =0x08C0A4E0
_08051DD6:
	adds r0, r6, r0
	ldr r0, [r0]
	movs r1, #0x64
	bl AnimCreate
	adds r2, r0, #0
	str r2, [r5, #0x5c]
	movs r0, #0x90
	lsls r0, r0, #7
	strh r0, [r2, #8]
	ldr r0, [r2, #0x1c]
	movs r1, #0x80
	lsls r1, r1, #3
	orrs r0, r1
	str r0, [r2, #0x1c]
	ldr r0, [r5, #0x44]
	cmp r0, #0
	bne _08051E08
	ldrh r0, [r5, #0x32]
	strh r0, [r2, #2]
	ldrh r0, [r5, #0x3a]
	b _08051E0E
	.align 2, 0
_08051E04: .4byte 0x08C0A4E0
_08051E08:
	ldrh r0, [r5, #0x34]
	strh r0, [r2, #2]
	ldrh r0, [r5, #0x3c]
_08051E0E:
	strh r0, [r2, #4]
	ldr r0, _08051E24 @ =0x08C0A540
_08051E12:
	adds r0, r6, r0
	ldr r0, [r0]
	str r0, [r5, #0x60]
	movs r0, #0
	strh r0, [r5, #0x3e]
	strh r0, [r5, #0x36]
_08051E1E:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08051E24: .4byte 0x08C0A540

	thumb_func_start sub_08051E28
sub_08051E28: @ 0x08051E28
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r4, r0, #0
	ldr r5, [r4, #0x5c]
	movs r0, #0x2c
	ldrsh r1, [r4, r0]
	movs r2, #0x2e
	ldrsh r0, [r4, r2]
	cmp r1, r0
	blt _08051E4A
	adds r0, r5, #0
	bl sub_080064E0
	adds r0, r4, #0
	bl Proc_Break
	b _08051EBA
_08051E4A:
	ldr r0, [r4, #0x44]
	cmp r0, #0
	bne _08051E74
	movs r3, #0x32
	ldrsh r1, [r4, r3]
	movs r6, #0x34
	ldrsh r2, [r4, r6]
	movs r0, #0x2c
	ldrsh r3, [r4, r0]
	movs r6, #0x2e
	ldrsh r0, [r4, r6]
	str r0, [sp]
	movs r0, #0
	bl Interpolate
	strh r0, [r5, #2]
	movs r0, #0x3a
	ldrsh r1, [r4, r0]
	movs r3, #0x3c
	ldrsh r2, [r4, r3]
	b _08051E96
_08051E74:
	movs r0, #0x34
	ldrsh r1, [r4, r0]
	movs r3, #0x32
	ldrsh r2, [r4, r3]
	movs r6, #0x2c
	ldrsh r3, [r4, r6]
	movs r6, #0x2e
	ldrsh r0, [r4, r6]
	str r0, [sp]
	movs r0, #0
	bl Interpolate
	strh r0, [r5, #2]
	movs r0, #0x3c
	ldrsh r1, [r4, r0]
	movs r3, #0x3a
	ldrsh r2, [r4, r3]
_08051E96:
	movs r6, #0x2c
	ldrsh r3, [r4, r6]
	movs r6, #0x2e
	ldrsh r0, [r4, r6]
	str r0, [sp]
	movs r0, #0
	bl Interpolate
	strh r0, [r5, #4]
	ldrh r2, [r4, #0x2c]
	movs r0, #0x2c
	ldrsh r1, [r4, r0]
	movs r3, #0x2e
	ldrsh r0, [r4, r3]
	cmp r1, r0
	bgt _08051EBA
	adds r0, r2, #1
	strh r0, [r4, #0x2c]
_08051EBA:
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start NewEkrUnitKakudai
NewEkrUnitKakudai: @ 0x08051EC4
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r0, _08051EF0 @ =0x08C0A560
	movs r1, #3
	bl Proc_Start
	adds r4, r0, #0
	str r5, [r4, #0x44]
	movs r1, #0
	str r1, [r4, #0x50]
	str r1, [r4, #0x4c]
	ldr r0, _08051EF4 @ =gEkrDistanceType
	movs r2, #0
	ldrsh r0, [r0, r2]
	cmp r0, #0
	blt _08051F32
	cmp r0, #3
	ble _08051EF8
	cmp r0, #4
	beq _08051F20
	b _08051F32
	.align 2, 0
_08051EF0: .4byte 0x08C0A560
_08051EF4: .4byte gEkrDistanceType
_08051EF8:
	ldr r0, _08051F1C @ =0x0203DFE8
	movs r1, #0
	ldrsh r5, [r0, r1]
	cmp r5, #1
	bne _08051F0C
	bl sub_080652AC
	cmp r0, #0
	bne _08051F0C
	str r5, [r4, #0x4c]
_08051F0C:
	ldr r0, _08051F1C @ =0x0203DFE8
	movs r2, #2
	ldrsh r0, [r0, r2]
	cmp r0, #1
	bne _08051F32
	str r0, [r4, #0x50]
	b _08051F32
	.align 2, 0
_08051F1C: .4byte 0x0203DFE8
_08051F20:
	cmp r5, #0
	bne _08051F2C
	str r1, [r4, #0x4c]
	movs r0, #1
	str r0, [r4, #0x50]
	b _08051F32
_08051F2C:
	movs r0, #1
	str r0, [r4, #0x4c]
	str r1, [r4, #0x50]
_08051F32:
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start UnitKakudai1
UnitKakudai1: @ 0x08051F38
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	ldr r1, _08052048 @ =gBanimScr_81DE208
	ldr r0, _0805204C @ =gEkrDistanceType
	movs r2, #0
	ldrsh r0, [r0, r2]
	adds r0, r0, r1
	ldr r1, _08052050 @ =gBanimRoundScripts
	ldrb r0, [r0]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldrb r6, [r0]
	bl UpdateBanimFrame
	ldr r0, [r4, #0x44]
	cmp r0, #0
	bne _08051F70
	ldr r1, _08052054 @ =gBattleStats
	movs r0, #0x40
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	beq _08051F70
	ldr r0, _08052058 @ =gPal
	movs r1, #0x17
	movs r2, #1
	bl sub_0806788C
_08051F70:
	ldr r5, _0805205C @ =0x0203DFE8
	ldrh r3, [r5]
	cmp r3, #1
	bne _08051F96
	ldr r0, _08052060 @ =gpBanimModesLeft
	ldr r1, [r0]
	lsls r0, r6, #2
	adds r0, r0, r1
	ldr r1, [r0]
	ldr r0, _08052064 @ =gBanimScrLeft
	adds r1, r1, r0
	ldr r0, [r1, #4]
	ldr r1, [r1, #8]
	ldr r2, _08052068 @ =0x020041C8
	adds r1, r1, r2
	str r1, [r4, #0x54]
	ldr r1, _0805206C @ =0x02000088
	bl LZ77UnCompWram
_08051F96:
	ldrh r5, [r5, #2]
	cmp r5, #1
	bne _08051FBA
	ldr r0, _08052070 @ =gpBanimModesRight
	ldr r1, [r0]
	lsls r0, r6, #2
	adds r0, r0, r1
	ldr r1, [r0]
	ldr r0, _08052074 @ =0x02011BC8
	adds r1, r1, r0
	ldr r0, [r1, #4]
	ldr r1, [r1, #8]
	ldr r2, _08052078 @ =0x020099C8
	adds r1, r1, r2
	str r1, [r4, #0x58]
	ldr r1, _0805207C @ =0x02002088
	bl LZ77UnCompWram
_08051FBA:
	ldr r5, _08052080 @ =Unk_0203E088
	ldr r0, [r5]
	cmp r0, #0
	beq _08051FC8
	ldr r1, _08052084 @ =0x02001088
	bl LZ77UnCompWram
_08051FC8:
	ldr r0, [r5, #4]
	cmp r0, #0
	beq _08051FD4
	ldr r1, _08052088 @ =0x02003088
	bl LZ77UnCompWram
_08051FD4:
	ldr r1, _0805208C @ =0x06014000
	ldr r0, _0805206C @ =0x02000088
	movs r2, #0x80
	lsls r2, r2, #7
	bl RegisterDataMove
	movs r0, #0
	strh r0, [r4, #0x2c]
	movs r0, #0xb
	strh r0, [r4, #0x2e]
	ldr r1, _08052090 @ =0x0203E006
	movs r5, #0
	ldrsh r0, [r1, r5]
	lsls r0, r0, #4
	adds r0, #8
	strh r0, [r4, #0x32]
	movs r2, #2
	ldrsh r0, [r1, r2]
	lsls r0, r0, #4
	adds r0, #8
	strh r0, [r4, #0x3a]
	movs r3, #4
	ldrsh r0, [r1, r3]
	lsls r0, r0, #4
	adds r0, #8
	strh r0, [r4, #0x34]
	movs r5, #6
	ldrsh r0, [r1, r5]
	lsls r0, r0, #4
	adds r0, #8
	strh r0, [r4, #0x3c]
	ldr r1, _08052094 @ =0x081DE20D
	ldr r2, _0805204C @ =gEkrDistanceType
	movs r3, #0
	ldrsh r0, [r2, r3]
	adds r0, r0, r1
	ldrb r5, [r0]
	strh r5, [r4, #0x36]
	ldr r1, _08052098 @ =0x081DE212
	movs r3, #0
	ldrsh r0, [r2, r3]
	adds r0, r0, r1
	ldrb r3, [r0]
	strh r3, [r4, #0x38]
	ldr r0, _0805209C @ =0x02017744
	ldr r0, [r0]
	cmp r0, #0
	bne _080520A4
	ldr r0, _080520A0 @ =0x081DE218
	movs r5, #0
	ldrsh r1, [r2, r5]
	lsls r1, r1, #1
	adds r1, r1, r0
	ldrh r1, [r1]
	adds r0, r1, r3
	strh r0, [r4, #0x38]
	b _080520B4
	.align 2, 0
_08052048: .4byte gBanimScr_81DE208
_0805204C: .4byte gEkrDistanceType
_08052050: .4byte gBanimRoundScripts
_08052054: .4byte gBattleStats
_08052058: .4byte gPal
_0805205C: .4byte 0x0203DFE8
_08052060: .4byte gpBanimModesLeft
_08052064: .4byte gBanimScrLeft
_08052068: .4byte 0x020041C8
_0805206C: .4byte 0x02000088
_08052070: .4byte gpBanimModesRight
_08052074: .4byte 0x02011BC8
_08052078: .4byte 0x020099C8
_0805207C: .4byte 0x02002088
_08052080: .4byte Unk_0203E088
_08052084: .4byte 0x02001088
_08052088: .4byte 0x02003088
_0805208C: .4byte 0x06014000
_08052090: .4byte 0x0203E006
_08052094: .4byte 0x081DE20D
_08052098: .4byte 0x081DE212
_0805209C: .4byte 0x02017744
_080520A0: .4byte 0x081DE218
_080520A4:
	ldr r0, _080520C0 @ =0x081DE218
	movs r3, #0
	ldrsh r1, [r2, r3]
	lsls r1, r1, #1
	adds r1, r1, r0
	ldrh r1, [r1]
	subs r0, r5, r1
	strh r0, [r4, #0x36]
_080520B4:
	adds r0, r4, #0
	bl Proc_Break
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080520C0: .4byte 0x081DE218

	thumb_func_start UnitKakudai2
UnitKakudai2: @ 0x080520C4
	push {r4, r5, r6, r7, lr}
	ldr r4, _080520E4 @ =0xFFFFFCB4
	add sp, r4
	adds r4, r0, #0
	add r5, sp, #0x304
	ldrh r2, [r4, #0x2c]
	movs r0, #0x2c
	ldrsh r1, [r4, r0]
	movs r3, #0x2e
	ldrsh r0, [r4, r3]
	cmp r1, r0
	blt _080520E8
	adds r0, r4, #0
	bl Proc_Break
	b _0805225E
	.align 2, 0
_080520E4: .4byte 0xFFFFFCB4
_080520E8:
	adds r0, r2, #1
	strh r0, [r4, #0x2c]
	ldr r0, [r4, #0x44]
	cmp r0, #0
	bne _08052100
	movs r1, #0x94
	lsls r1, r1, #2
	movs r2, #0x80
	lsls r2, r2, #1
	movs r6, #0x2c
	ldrsh r3, [r4, r6]
	b _0805210C
_08052100:
	movs r1, #0x80
	lsls r1, r1, #1
	movs r2, #0x94
	lsls r2, r2, #2
	movs r0, #0x2c
	ldrsh r3, [r4, r0]
_0805210C:
	movs r6, #0x2e
	ldrsh r0, [r4, r6]
	str r0, [sp]
	movs r0, #0
	bl Interpolate
	lsls r0, r0, #0x10
	lsrs r7, r0, #0x10
	ldr r0, [r4, #0x4c]
	cmp r0, #1
	bne _080521BE
	ldr r0, [r4, #0x54]
	lsls r3, r7, #0x10
	asrs r3, r3, #0x10
	movs r1, #0
	str r1, [sp]
	add r1, sp, #4
	adds r2, r3, #0
	bl sub_08067C30
	ldr r0, [r4, #0x44]
	cmp r0, #0
	bne _0805216A
	movs r0, #0x32
	ldrsh r1, [r4, r0]
	movs r3, #0x36
	ldrsh r2, [r4, r3]
	movs r6, #0x2c
	ldrsh r3, [r4, r6]
	movs r6, #0x2e
	ldrsh r0, [r4, r6]
	str r0, [sp]
	movs r0, #0
	bl Interpolate
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	movs r0, #0x3a
	ldrsh r1, [r4, r0]
	movs r2, #0x2c
	ldrsh r3, [r4, r2]
	movs r2, #0x2e
	ldrsh r0, [r4, r2]
	str r0, [sp]
	movs r0, #0
	movs r2, #0x58
	b _08052198
_0805216A:
	movs r3, #0x36
	ldrsh r1, [r4, r3]
	movs r6, #0x32
	ldrsh r2, [r4, r6]
	movs r0, #0x2c
	ldrsh r3, [r4, r0]
	movs r6, #0x2e
	ldrsh r0, [r4, r6]
	str r0, [sp]
	movs r0, #0
	bl Interpolate
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	movs r0, #0x3a
	ldrsh r2, [r4, r0]
	movs r1, #0x2c
	ldrsh r3, [r4, r1]
	movs r1, #0x2e
	ldrsh r0, [r4, r1]
	str r0, [sp]
	movs r0, #0
	movs r1, #0x58
_08052198:
	bl Interpolate
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	add r2, sp, #4
	str r2, [r5, #0x3c]
	movs r0, #0
	strh r6, [r5, #2]
	strh r1, [r5, #4]
	movs r1, #0x80
	lsls r1, r1, #3
	strh r1, [r5, #0xc]
	movs r1, #0xe4
	lsls r1, r1, #7
	strh r1, [r5, #8]
	str r0, [r5, #0x1c]
	adds r0, r5, #0
	bl sub_0800650C
_080521BE:
	ldr r1, [r4, #0x50]
	cmp r1, #1
	bne _0805225E
	ldr r0, [r4, #0x58]
	lsls r3, r7, #0x10
	asrs r3, r3, #0x10
	str r1, [sp]
	add r1, sp, #4
	adds r2, r3, #0
	bl sub_08067C30
	ldr r0, [r4, #0x44]
	cmp r0, #0
	bne _0805220A
	movs r3, #0x34
	ldrsh r1, [r4, r3]
	movs r6, #0x38
	ldrsh r2, [r4, r6]
	movs r0, #0x2c
	ldrsh r3, [r4, r0]
	movs r6, #0x2e
	ldrsh r0, [r4, r6]
	str r0, [sp]
	movs r0, #0
	bl Interpolate
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	movs r0, #0x3c
	ldrsh r1, [r4, r0]
	movs r2, #0x2c
	ldrsh r3, [r4, r2]
	movs r2, #0x2e
	ldrsh r0, [r4, r2]
	str r0, [sp]
	movs r0, #0
	movs r2, #0x58
	b _08052238
_0805220A:
	movs r3, #0x38
	ldrsh r1, [r4, r3]
	movs r6, #0x34
	ldrsh r2, [r4, r6]
	movs r0, #0x2c
	ldrsh r3, [r4, r0]
	movs r6, #0x2e
	ldrsh r0, [r4, r6]
	str r0, [sp]
	movs r0, #0
	bl Interpolate
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	movs r0, #0x3c
	ldrsh r2, [r4, r0]
	movs r1, #0x2c
	ldrsh r3, [r4, r1]
	movs r1, #0x2e
	ldrsh r0, [r4, r1]
	str r0, [sp]
	movs r0, #0
	movs r1, #0x58
_08052238:
	bl Interpolate
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	add r2, sp, #4
	str r2, [r5, #0x3c]
	movs r0, #0
	strh r6, [r5, #2]
	strh r1, [r5, #4]
	movs r1, #0x80
	lsls r1, r1, #3
	strh r1, [r5, #0xc]
	movs r1, #0x93
	lsls r1, r1, #8
	strh r1, [r5, #8]
	str r0, [r5, #0x1c]
	adds r0, r5, #0
	bl sub_0800650C
_0805225E:
	movs r3, #0xd3
	lsls r3, r3, #2
	add sp, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_0805226C
sub_0805226C: @ 0x0805226C
	push {lr}
	bl Proc_Break
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_08052278
sub_08052278: @ 0x08052278
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	ldr r0, _080522BC @ =0x08C0A588
	movs r1, #3
	bl Proc_Start
	str r5, [r0, #0x44]
	movs r1, #0
	strh r1, [r0, #0x2c]
	strh r4, [r0, #0x2e]
	movs r1, #0x39
	strh r1, [r0, #0x30]
	movs r2, #0
	cmp r5, #0
	bne _0805229A
	movs r2, #0x39
_0805229A:
	ldr r1, _080522C0 @ =0x02000038
	movs r3, #0
	ldrsh r0, [r1, r3]
	ldrh r1, [r1, #2]
	adds r1, r1, r2
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	bl sub_0804CC78
	ldr r1, _080522C4 @ =0x0201FAC0
	movs r0, #1
	str r0, [r1]
	bl sub_0804CCB0
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080522BC: .4byte 0x08C0A588
_080522C0: .4byte 0x02000038
_080522C4: .4byte 0x0201FAC0

	thumb_func_start sub_080522C8
sub_080522C8: @ 0x080522C8
	ldr r0, _080522D4 @ =0x0201FAC0
	ldr r0, [r0]
	cmp r0, #0
	beq _080522D8
	movs r0, #0
	b _080522DA
	.align 2, 0
_080522D4: .4byte 0x0201FAC0
_080522D8:
	movs r0, #1
_080522DA:
	bx lr

	thumb_func_start sub_080522DC
sub_080522DC: @ 0x080522DC
	push {r4, lr}
	sub sp, #4
	adds r4, r0, #0
	ldrh r2, [r4, #0x2c]
	movs r0, #0x2c
	ldrsh r1, [r4, r0]
	movs r3, #0x2e
	ldrsh r0, [r4, r3]
	cmp r1, r0
	blt _08052308
	ldr r1, _08052304 @ =0x0201FAC0
	movs r0, #0
	str r0, [r1]
	bl sub_0804CCA0
	adds r0, r4, #0
	bl Proc_Break
	b _08052350
	.align 2, 0
_08052304: .4byte 0x0201FAC0
_08052308:
	adds r0, r2, #1
	strh r0, [r4, #0x2c]
	ldr r0, [r4, #0x44]
	cmp r0, #0
	bne _08052326
	movs r0, #0x30
	ldrsh r1, [r4, r0]
	movs r2, #0x2c
	ldrsh r3, [r4, r2]
	movs r2, #0x2e
	ldrsh r0, [r4, r2]
	str r0, [sp]
	movs r0, #1
	movs r2, #0
	b _08052338
_08052326:
	movs r3, #0x30
	ldrsh r2, [r4, r3]
	movs r0, #0x2c
	ldrsh r3, [r4, r0]
	movs r1, #0x2e
	ldrsh r0, [r4, r1]
	str r0, [sp]
	movs r0, #4
	movs r1, #0
_08052338:
	bl Interpolate
	adds r2, r0, #0
	ldr r1, _08052358 @ =0x02000038
	movs r3, #0
	ldrsh r0, [r1, r3]
	ldrh r1, [r1, #2]
	adds r1, r1, r2
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	bl sub_0804CC78
_08052350:
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08052358: .4byte 0x02000038

	thumb_func_start sub_0805235C
sub_0805235C: @ 0x0805235C
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r6, r2, #0
	ldr r0, _0805238C @ =0x08C0A5A0
	movs r1, #3
	bl Proc_Start
	str r4, [r0, #0x44]
	movs r1, #0
	strh r1, [r0, #0x2c]
	strh r5, [r0, #0x2e]
	strh r6, [r0, #0x30]
	subs r1, #0x31
	str r1, [r0, #0x48]
	cmp r4, #0
	bne _08052390
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	movs r0, #0
	bl sub_0804D5C4
	b _08052398
	.align 2, 0
_0805238C: .4byte 0x08C0A5A0
_08052390:
	movs r0, #0
	movs r1, #0
	bl sub_0804D5C4
_08052398:
	ldr r1, _080523A8 @ =0x0201FAC4
	movs r0, #1
	str r0, [r1]
	bl sub_0804D5FC
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080523A8: .4byte 0x0201FAC4

	thumb_func_start sub_080523AC
sub_080523AC: @ 0x080523AC
	ldr r0, _080523B8 @ =0x0201FAC4
	ldr r0, [r0]
	cmp r0, #0
	beq _080523BC
	movs r0, #0
	b _080523BE
	.align 2, 0
_080523B8: .4byte 0x0201FAC4
_080523BC:
	movs r0, #1
_080523BE:
	bx lr

	thumb_func_start sub_080523C0
sub_080523C0: @ 0x080523C0
	push {lr}
	adds r1, r0, #0
	ldrh r0, [r1, #0x2c]
	ldrh r2, [r1, #0x30]
	cmp r0, r2
	bne _080523D8
	movs r0, #0
	strh r0, [r1, #0x2c]
	adds r0, r1, #0
	bl Proc_Break
	b _080523DC
_080523D8:
	adds r0, #1
	strh r0, [r1, #0x2c]
_080523DC:
	pop {r0}
	bx r0

	thumb_func_start sub_080523E0
sub_080523E0: @ 0x080523E0
	push {r4, lr}
	sub sp, #4
	adds r4, r0, #0
	ldrh r2, [r4, #0x2c]
	movs r0, #0x2c
	ldrsh r1, [r4, r0]
	movs r3, #0x2e
	ldrsh r0, [r4, r3]
	cmp r1, r0
	blt _08052414
	ldr r0, _08052410 @ =0x0201FAC4
	movs r1, #0
	str r1, [r0]
	bl sub_0804D5EC
	ldr r0, [r4, #0x44]
	cmp r0, #2
	bne _08052408
	bl sub_0804D570
_08052408:
	adds r0, r4, #0
	bl Proc_Break
	b _08052452
	.align 2, 0
_08052410: .4byte 0x0201FAC4
_08052414:
	adds r0, r2, #1
	strh r0, [r4, #0x2c]
	ldr r0, [r4, #0x44]
	cmp r0, #0
	bne _08052434
	ldr r1, [r4, #0x48]
	movs r0, #0x2c
	ldrsh r3, [r4, r0]
	movs r2, #0x2e
	ldrsh r0, [r4, r2]
	str r0, [sp]
	movs r0, #1
	movs r2, #0
	bl Interpolate
	b _08052448
_08052434:
	ldr r2, [r4, #0x48]
	movs r0, #0x2c
	ldrsh r3, [r4, r0]
	movs r1, #0x2e
	ldrsh r0, [r4, r1]
	str r0, [sp]
	movs r0, #4
	movs r1, #0
	bl Interpolate
_08052448:
	lsls r1, r0, #0x10
	lsrs r1, r1, #0x10
	movs r0, #0
	bl sub_0804D5C4
_08052452:
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_0805245C
sub_0805245C: @ 0x0805245C
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r0, _08052480 @ =0x08C0A5C0
	movs r1, #3
	bl Proc_Start
	str r4, [r0, #0x44]
	movs r1, #0
	strh r1, [r0, #0x2c]
	strh r5, [r0, #0x2e]
	cmp r4, #0
	bne _08052488
	ldr r2, _08052484 @ =0x0000FFA8
	movs r0, #2
	bl SetBgOffset
	b _08052492
	.align 2, 0
_08052480: .4byte 0x08C0A5C0
_08052484: .4byte 0x0000FFA8
_08052488:
	movs r0, #2
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
_08052492:
	ldr r1, _080524A0 @ =0x0201FAC8
	movs r0, #1
	str r0, [r1]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080524A0: .4byte 0x0201FAC8

	thumb_func_start sub_080524A4
sub_080524A4: @ 0x080524A4
	ldr r0, _080524B0 @ =0x0201FAC8
	ldr r0, [r0]
	cmp r0, #0
	beq _080524B4
	movs r0, #0
	b _080524B6
	.align 2, 0
_080524B0: .4byte 0x0201FAC8
_080524B4:
	movs r0, #1
_080524B6:
	bx lr

	thumb_func_start sub_080524B8
sub_080524B8: @ 0x080524B8
	push {r4, lr}
	sub sp, #4
	adds r4, r0, #0
	ldrh r2, [r4, #0x2c]
	movs r0, #0x2c
	ldrsh r1, [r4, r0]
	movs r3, #0x2e
	ldrsh r0, [r4, r3]
	cmp r1, r0
	blt _080524E0
	ldr r1, _080524DC @ =0x0201FAC8
	movs r0, #0
	str r0, [r1]
	adds r0, r4, #0
	bl Proc_Break
	b _08052524
	.align 2, 0
_080524DC: .4byte 0x0201FAC8
_080524E0:
	adds r0, r2, #1
	strh r0, [r4, #0x2c]
	ldr r0, [r4, #0x44]
	cmp r0, #0
	bne _08052502
	movs r1, #0x50
	rsbs r1, r1, #0
	movs r0, #0x2c
	ldrsh r3, [r4, r0]
	movs r2, #0x2e
	ldrsh r0, [r4, r2]
	str r0, [sp]
	movs r0, #1
	movs r2, #0
	bl Interpolate
	b _08052518
_08052502:
	movs r2, #0x50
	rsbs r2, r2, #0
	movs r0, #0x2c
	ldrsh r3, [r4, r0]
	movs r1, #0x2e
	ldrsh r0, [r4, r1]
	str r0, [sp]
	movs r0, #4
	movs r1, #0
	bl Interpolate
_08052518:
	lsls r2, r0, #0x10
	lsrs r2, r2, #0x10
	movs r0, #2
	movs r1, #0
	bl SetBgOffset
_08052524:
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start PrepareBattleGraphicsMaybe
PrepareBattleGraphicsMaybe: @ 0x0805252C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x2c
	movs r0, #1
	str r0, [sp, #0x20]
	bl sub_08065214
	ldr r1, _08052554 @ =gBattleStats
	movs r0, #0x20
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _08052558
	movs r0, #0
	bl sub_08055CCC
	b _0805255E
	.align 2, 0
_08052554: .4byte gBattleStats
_08052558:
	movs r0, #1
	bl sub_08055CCC
_0805255E:
	ldr r1, _08052574 @ =gBmSt
	movs r0, #0x40
	ldrb r1, [r1, #4]
	ands r0, r1
	cmp r0, #0
	bne _08052578
	movs r0, #0
	bl SetBanimLinkArenaFlag
	b _0805257E
	.align 2, 0
_08052574: .4byte gBmSt
_08052578:
	movs r0, #1
	bl SetBanimLinkArenaFlag
_0805257E:
	ldr r1, _08052598 @ =gBattleStats
	movs r0, #0x10
	ldrh r1, [r1]
	ands r0, r1
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	cmp r2, #0
	beq _080525A0
	ldr r1, _0805259C @ =gEkrDistanceType
	movs r0, #4
	strh r0, [r1]
	adds r0, r1, #0
	b _080525A4
	.align 2, 0
_08052598: .4byte gBattleStats
_0805259C: .4byte gEkrDistanceType
_080525A0:
	ldr r0, _080525D0 @ =gEkrDistanceType
	strh r2, [r0]
_080525A4:
	ldrh r0, [r0]
	cmp r0, #4
	bne _080525EC
	ldr r1, _080525D4 @ =gpEkrBattleUnitLeft
	ldr r0, _080525D8 @ =gBattleActor
	str r0, [r1]
	str r0, [sp, #8]
	ldr r1, _080525DC @ =gpEkrBattleUnitRight
	ldr r0, _080525E0 @ =gBattleTarget
	str r0, [r1]
	str r0, [sp, #0xc]
	ldr r1, _080525E4 @ =0x0203DFEC
	movs r0, #0
	strh r0, [r1, #2]
	strh r0, [r1]
	ldr r0, _080525E8 @ =0x0203DFE8
	movs r1, #1
	strh r1, [r0]
	strh r1, [r0, #2]
	ldr r7, [sp, #8]
	adds r3, r0, #0
	b _080526E6
	.align 2, 0
_080525D0: .4byte gEkrDistanceType
_080525D4: .4byte gpEkrBattleUnitLeft
_080525D8: .4byte gBattleActor
_080525DC: .4byte gpEkrBattleUnitRight
_080525E0: .4byte gBattleTarget
_080525E4: .4byte 0x0203DFEC
_080525E8: .4byte 0x0203DFE8
_080525EC:
	ldr r5, _08052624 @ =gBattleActor
	movs r4, #0x40
	rsbs r4, r4, #0
	adds r0, r4, #0
	ldrb r1, [r5, #0xb]
	ands r0, r1
	bl sub_08053A80
	lsls r0, r0, #0x10
	lsrs r7, r0, #0x10
	ldr r0, _08052628 @ =gBattleTarget
	ldrb r0, [r0, #0xb]
	ands r4, r0
	adds r0, r4, #0
	bl sub_08053A80
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	ldr r1, _0805262C @ =gBattleStats
	movs r0, #0x40
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	beq _08052630
	movs r2, #2
	str r2, [sp, #0x20]
	b _08052654
	.align 2, 0
_08052624: .4byte gBattleActor
_08052628: .4byte gBattleTarget
_0805262C: .4byte gBattleStats
_08052630:
	adds r1, r5, #0
	adds r1, #0x4a
	ldrh r0, [r1]
	cmp r0, #0
	bne _08052640
	movs r3, #2
	str r3, [sp, #0x20]
	b _08052654
_08052640:
	ldrh r0, [r1]
	bl GetItemIndex
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl sub_0806C1D8
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp, #0x20]
_08052654:
	ldr r1, _080526A8 @ =0x0203DFE8
	movs r0, #1
	strh r0, [r1, #2]
	strh r0, [r1]
	movs r4, #0
	bl GetBanimLinkArenaFlag
	cmp r0, #1
	beq _0805267C
	lsls r0, r7, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0
	beq _0805267A
	cmp r0, #2
	beq _0805267A
	cmp r0, #1
	bne _0805267C
	cmp r6, #1
	bne _0805267C
_0805267A:
	movs r4, #1
_0805267C:
	adds r2, r4, #0
	cmp r2, #1
	bne _080526C0
	ldr r1, _080526AC @ =gpEkrBattleUnitLeft
	ldr r0, _080526B0 @ =gBattleTarget
	str r0, [r1]
	str r0, [sp, #8]
	ldr r1, _080526B4 @ =gpEkrBattleUnitRight
	ldr r0, _080526B8 @ =gBattleActor
	str r0, [r1]
	str r0, [sp, #0xc]
	ldr r0, _080526BC @ =0x0203DFEC
	movs r1, #0
	strh r2, [r0]
	strh r1, [r0, #2]
	ldr r7, [sp, #0xc]
	ldr r3, _080526A8 @ =0x0203DFE8
	ldr r4, [sp, #0x20]
	cmp r4, #1
	bne _080526E6
	strh r1, [r3]
	b _080526E6
	.align 2, 0
_080526A8: .4byte 0x0203DFE8
_080526AC: .4byte gpEkrBattleUnitLeft
_080526B0: .4byte gBattleTarget
_080526B4: .4byte gpEkrBattleUnitRight
_080526B8: .4byte gBattleActor
_080526BC: .4byte 0x0203DFEC
_080526C0:
	ldr r1, _0805279C @ =gpEkrBattleUnitLeft
	ldr r0, _080527A0 @ =gBattleActor
	str r0, [r1]
	str r0, [sp, #8]
	ldr r1, _080527A4 @ =gpEkrBattleUnitRight
	ldr r0, _080527A8 @ =gBattleTarget
	str r0, [r1]
	str r0, [sp, #0xc]
	ldr r1, _080527AC @ =0x0203DFEC
	movs r2, #0
	strh r2, [r1]
	movs r0, #1
	strh r0, [r1, #2]
	ldr r7, [sp, #8]
	ldr r3, _080527B0 @ =0x0203DFE8
	ldr r0, [sp, #0x20]
	cmp r0, #1
	bne _080526E6
	strh r2, [r3, #2]
_080526E6:
	ldr r1, [sp, #8]
	mov sl, r1
	ldr r2, [sp, #0xc]
	str r2, [sp, #0x18]
	ldr r4, [r1]
	str r4, [sp, #0x10]
	ldr r0, [r2]
	str r0, [sp, #0x14]
	movs r1, #0
	mov sb, r1
	mov r8, r1
	ldrh r1, [r3, #2]
	ldrh r2, [r3]
	str r2, [sp, #0x1c]
	movs r4, #0
	ldrsh r6, [r3, r4]
	cmp r6, #0
	beq _08052712
	mov r2, sl
	ldr r0, [r2, #4]
	ldr r0, [r0, #0x34]
	mov r8, r0
_08052712:
	lsls r0, r1, #0x10
	asrs r5, r0, #0x10
	str r0, [sp, #0x28]
	cmp r5, #0
	beq _08052724
	ldr r3, [sp, #0x18]
	ldr r0, [r3, #4]
	ldr r0, [r0, #0x34]
	mov sb, r0
_08052724:
	cmp r6, #0
	beq _08052750
	ldr r3, _080527B4 @ =0x0203E006
	mov r4, sl
	movs r0, #0x10
	ldrsb r0, [r4, r0]
	lsls r0, r0, #4
	ldr r2, _080527B8 @ =gBmSt
	movs r4, #0xc
	ldrsh r1, [r2, r4]
	subs r0, r0, r1
	asrs r0, r0, #4
	strh r0, [r3]
	mov r1, sl
	movs r0, #0x11
	ldrsb r0, [r1, r0]
	lsls r0, r0, #4
	movs r4, #0xe
	ldrsh r1, [r2, r4]
	subs r0, r0, r1
	asrs r0, r0, #4
	strh r0, [r3, #2]
_08052750:
	cmp r5, #0
	beq _0805277C
	ldr r3, _080527B4 @ =0x0203E006
	ldr r1, [sp, #0x18]
	movs r0, #0x10
	ldrsb r0, [r1, r0]
	lsls r0, r0, #4
	ldr r2, _080527B8 @ =gBmSt
	movs r4, #0xc
	ldrsh r1, [r2, r4]
	subs r0, r0, r1
	asrs r0, r0, #4
	strh r0, [r3, #4]
	ldr r1, [sp, #0x18]
	movs r0, #0x11
	ldrsb r0, [r1, r0]
	lsls r0, r0, #4
	movs r4, #0xe
	ldrsh r1, [r2, r4]
	subs r0, r0, r1
	asrs r0, r0, #4
	strh r0, [r3, #6]
_0805277C:
	ldr r4, _080527BC @ =gEkrDistanceType
	ldrh r0, [r4]
	cmp r0, #4
	beq _0805284A
	adds r0, r7, #0
	adds r0, #0x4a
	ldrh r0, [r0]
	bl GetItemAttributes
	movs r1, #0x80
	ands r1, r0
	cmp r1, #0
	beq _080527C0
	movs r0, #2
	strh r0, [r4]
	b _08052842
	.align 2, 0
_0805279C: .4byte gpEkrBattleUnitLeft
_080527A0: .4byte gBattleActor
_080527A4: .4byte gpEkrBattleUnitRight
_080527A8: .4byte gBattleTarget
_080527AC: .4byte 0x0203DFEC
_080527B0: .4byte 0x0203DFE8
_080527B4: .4byte 0x0203E006
_080527B8: .4byte gBmSt
_080527BC: .4byte gEkrDistanceType
_080527C0:
	movs r0, #3
	strh r0, [r4]
	adds r0, r6, r5
	cmp r0, #2
	bne _08052842
	ldr r0, _080527E4 @ =0x0203E006
	movs r2, #0
	ldrsh r1, [r0, r2]
	movs r3, #4
	ldrsh r2, [r0, r3]
	subs r1, r1, r2
	adds r2, r0, #0
	cmp r1, #0
	blt _080527E8
	ldrh r4, [r2]
	ldrh r1, [r2, #4]
	subs r0, r4, r1
	b _080527EE
	.align 2, 0
_080527E4: .4byte 0x0203E006
_080527E8:
	ldrh r3, [r2, #4]
	ldrh r4, [r2]
	subs r0, r3, r4
_080527EE:
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	adds r3, r0, #0
	movs r1, #2
	ldrsh r0, [r2, r1]
	movs r4, #6
	ldrsh r1, [r2, r4]
	subs r0, r0, r1
	cmp r0, #0
	blt _08052808
	ldrh r1, [r2, #2]
	ldrh r4, [r2, #6]
	b _0805280C
_08052808:
	ldrh r1, [r2, #6]
	ldrh r4, [r2, #2]
_0805280C:
	subs r0, r1, r4
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	lsls r1, r3, #0x10
	asrs r1, r1, #0x10
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	adds r0, r1, r0
	cmp r0, #1
	bgt _0805282C
	ldr r1, _08052828 @ =gEkrDistanceType
	movs r0, #0
	b _08052840
	.align 2, 0
_08052828: .4byte gEkrDistanceType
_0805282C:
	cmp r0, #3
	bgt _0805283C
	ldr r1, _08052838 @ =gEkrDistanceType
	movs r0, #1
	b _08052840
	.align 2, 0
_08052838: .4byte gEkrDistanceType
_0805283C:
	ldr r1, _08052880 @ =gEkrDistanceType
	movs r0, #2
_08052840:
	strh r0, [r1]
_08052842:
	ldr r0, _08052880 @ =gEkrDistanceType
	ldrh r0, [r0]
	cmp r0, #4
	bne _0805288C
_0805284A:
	ldr r0, [sp, #8]
	adds r0, #0x48
	ldrh r2, [r0]
	mov r0, sl
	mov r1, r8
	mov r3, sp
	bl sub_08053040
	ldr r5, _08052884 @ =0x0203E066
	ldr r4, _08052888 @ =0x0203DFF0
	strh r0, [r4]
	strh r0, [r5]
	ldr r0, [sp, #0xc]
	adds r0, #0x48
	ldrh r2, [r0]
	add r3, sp, #4
	ldr r0, [sp, #0x18]
	mov r1, sb
	bl sub_08053040
	strh r0, [r4, #2]
	strh r0, [r5, #2]
	ldr r0, [sp, #0x1c]
	lsls r0, r0, #0x10
	str r0, [sp, #0x24]
	b _080528CC
	.align 2, 0
_08052880: .4byte gEkrDistanceType
_08052884: .4byte 0x0203E066
_08052888: .4byte 0x0203DFF0
_0805288C:
	ldr r1, [sp, #0x1c]
	lsls r0, r1, #0x10
	str r0, [sp, #0x24]
	cmp r0, #0
	beq _080528AE
	ldr r0, [sp, #8]
	adds r0, #0x4a
	ldrh r2, [r0]
	mov r0, sl
	mov r1, r8
	mov r3, sp
	bl sub_08053040
	ldr r2, _08052A18 @ =0x0203E066
	ldr r1, _08052A1C @ =0x0203DFF0
	strh r0, [r1]
	strh r0, [r2]
_080528AE:
	ldr r2, [sp, #0x28]
	cmp r2, #0
	beq _080528CC
	ldr r0, [sp, #0xc]
	adds r0, #0x4a
	ldrh r2, [r0]
	add r3, sp, #4
	ldr r0, [sp, #0x18]
	mov r1, sb
	bl sub_08053040
	ldr r2, _08052A18 @ =0x0203E066
	ldr r1, _08052A1C @ =0x0203DFF0
	strh r0, [r1, #2]
	strh r0, [r2, #2]
_080528CC:
	ldr r3, [sp, #0x24]
	asrs r7, r3, #0x10
	cmp r7, #0
	beq _080528E0
	ldr r1, [sp]
	mov r0, sl
	bl sub_08053A14
	ldr r1, _08052A20 @ =0x0203DFF4
	strh r0, [r1]
_080528E0:
	ldr r4, [sp, #0x28]
	asrs r4, r4, #0x10
	mov r8, r4
	cmp r4, #0
	beq _080528F6
	ldr r1, [sp, #4]
	ldr r0, [sp, #0x18]
	bl sub_08053A14
	ldr r1, _08052A20 @ =0x0203DFF4
	strh r0, [r1, #2]
_080528F6:
	cmp r7, #0
	beq _0805290E
	ldr r0, _08052A18 @ =0x0203E066
	movs r1, #0
	ldrsh r0, [r0, r1]
	ldr r1, [sp, #8]
	adds r1, #0x4a
	ldrh r1, [r1]
	bl sub_08053A38
	ldr r1, _08052A24 @ =0x0203E080
	str r0, [r1]
_0805290E:
	mov r2, r8
	cmp r2, #0
	beq _08052928
	ldr r0, _08052A18 @ =0x0203E066
	movs r3, #2
	ldrsh r0, [r0, r3]
	ldr r1, [sp, #0xc]
	adds r1, #0x4a
	ldrh r1, [r1]
	bl sub_08053A38
	ldr r1, _08052A24 @ =0x0203E080
	str r0, [r1, #4]
_08052928:
	ldr r4, _08052A28 @ =0x0203E0B0
	mov sb, r4
	ldr r2, [sp, #8]
	adds r2, #0x55
	ldrb r0, [r2]
	strh r0, [r4]
	ldr r6, [sp, #0xc]
	adds r6, #0x55
	ldrb r0, [r6]
	strh r0, [r4, #2]
	ldr r5, _08052A2C @ =0x0203E000
	ldr r1, _08052A30 @ =0x0000FFFF
	adds r0, r1, #0
	ldrh r1, [r5, #2]
	orrs r1, r0
	strh r1, [r5, #2]
	ldrh r3, [r5]
	orrs r0, r3
	strh r0, [r5]
	cmp r7, #0
	beq _0805296A
	ldrb r4, [r2]
	ldr r0, _08052A34 @ =gPlaySt
	ldrb r0, [r0, #0xe]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl GetROMChapterStruct
	ldrb r1, [r0, #0x13]
	adds r0, r4, #0
	bl sub_0805313C
	strh r0, [r5]
_0805296A:
	mov r4, r8
	cmp r4, #0
	beq _08052988
	ldrb r4, [r6]
	ldr r0, _08052A34 @ =gPlaySt
	ldrb r0, [r0, #0xe]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl GetROMChapterStruct
	ldrb r1, [r0, #0x13]
	adds r0, r4, #0
	bl sub_0805313C
	strh r0, [r5, #2]
_08052988:
	ldr r1, _08052A38 @ =gBmSt
	movs r0, #0x40
	ldrb r1, [r1, #4]
	ands r0, r1
	cmp r0, #0
	beq _080529D6
	movs r0, #0x30
	mov r1, sb
	strh r0, [r1]
	strh r0, [r1, #2]
	cmp r7, #0
	beq _080529B6
	ldr r0, _08052A34 @ =gPlaySt
	ldrb r0, [r0, #0xe]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl GetROMChapterStruct
	ldrb r1, [r0, #0x13]
	movs r0, #0x30
	bl sub_0805313C
	strh r0, [r5]
_080529B6:
	mov r2, r8
	cmp r2, #0
	beq _080529D6
	mov r3, sb
	ldrh r4, [r3, #2]
	ldr r0, _08052A34 @ =gPlaySt
	ldrb r0, [r0, #0xe]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl GetROMChapterStruct
	ldrb r1, [r0, #0x13]
	adds r0, r4, #0
	bl sub_0805313C
	strh r0, [r5, #2]
_080529D6:
	bl sub_0806BF78
	cmp r0, #1
	bne _080529EE
	ldr r1, _08052A2C @ =0x0203E000
	movs r0, #0x14
	strh r0, [r1, #2]
	strh r0, [r1]
	ldr r1, _08052A28 @ =0x0203E0B0
	movs r0, #0x30
	strh r0, [r1, #2]
	strh r0, [r1]
_080529EE:
	ldr r0, _08052A3C @ =gEkrDistanceType
	movs r4, #0
	ldrsh r0, [r0, r4]
	cmp r0, #0
	blt _08052A06
	cmp r0, #3
	ble _08052A06
	cmp r0, #4
	bne _08052A06
	ldr r1, _08052A2C @ =0x0203E000
	ldrh r0, [r1, #2]
	strh r0, [r1]
_08052A06:
	ldr r0, _08052A34 @ =gPlaySt
	ldrb r0, [r0, #0x15]
	cmp r0, #2
	bgt _08052A44
	cmp r0, #1
	blt _08052A44
	ldr r1, _08052A40 @ =0x0203DFE6
	movs r0, #1
	b _08052A48
	.align 2, 0
_08052A18: .4byte 0x0203E066
_08052A1C: .4byte 0x0203DFF0
_08052A20: .4byte 0x0203DFF4
_08052A24: .4byte 0x0203E080
_08052A28: .4byte 0x0203E0B0
_08052A2C: .4byte 0x0203E000
_08052A30: .4byte 0x0000FFFF
_08052A34: .4byte gPlaySt
_08052A38: .4byte gBmSt
_08052A3C: .4byte gEkrDistanceType
_08052A40: .4byte 0x0203DFE6
_08052A44:
	ldr r1, _08052AC4 @ =0x0203DFE6
	movs r0, #0
_08052A48:
	strh r0, [r1]
	ldr r0, [sp, #0x24]
	asrs r4, r0, #0x10
	cmp r4, #0
	beq _08052A60
	ldr r0, _08052AC8 @ =0x0203E0B4
	mov r2, sl
	ldr r1, [r2, #4]
	ldrb r1, [r1, #0x11]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	strh r1, [r0]
_08052A60:
	ldr r3, [sp, #0x28]
	asrs r5, r3, #0x10
	cmp r5, #0
	beq _08052A76
	ldr r0, _08052AC8 @ =0x0203E0B4
	ldr r2, [sp, #0x18]
	ldr r1, [r2, #4]
	ldrb r1, [r1, #0x11]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	strh r1, [r0, #2]
_08052A76:
	cmp r4, #0
	beq _08052A92
	ldr r1, _08052ACC @ =0x0203E090
	ldr r0, [sp, #8]
	adds r0, #0x72
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	strh r0, [r1]
	ldr r1, _08052AD0 @ =0x0203E094
	mov r3, sl
	movs r0, #0x12
	ldrsb r0, [r3, r0]
	strh r0, [r1]
_08052A92:
	cmp r5, #0
	beq _08052AAE
	ldr r1, _08052ACC @ =0x0203E090
	ldr r0, [sp, #0xc]
	adds r0, #0x72
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	strh r0, [r1, #2]
	ldr r1, _08052AD0 @ =0x0203E094
	ldr r2, [sp, #0x18]
	movs r0, #0x12
	ldrsb r0, [r2, r0]
	strh r0, [r1, #2]
_08052AAE:
	bl sub_08053484
	ldr r0, _08052AD4 @ =gEkrDistanceType
	ldrh r0, [r0]
	cmp r0, #4
	bne _08052ADC
	ldr r1, _08052AD8 @ =0x0203DFFC
	movs r0, #1
	strh r0, [r1, #2]
	strh r0, [r1]
	b _08052B48
	.align 2, 0
_08052AC4: .4byte 0x0203DFE6
_08052AC8: .4byte 0x0203E0B4
_08052ACC: .4byte 0x0203E090
_08052AD0: .4byte 0x0203E094
_08052AD4: .4byte gEkrDistanceType
_08052AD8: .4byte 0x0203DFFC
_08052ADC:
	cmp r4, #0
	beq _08052AF4
	mov r3, sl
	ldr r0, [r3, #4]
	ldrb r0, [r0, #4]
	ldr r1, [sp, #8]
	adds r1, #0x4a
	ldrh r1, [r1]
	bl sub_080532F0
	ldr r1, _08052DA4 @ =0x0203DFFC
	strh r0, [r1]
_08052AF4:
	cmp r5, #0
	beq _08052B0C
	ldr r4, [sp, #0x18]
	ldr r0, [r4, #4]
	ldrb r0, [r0, #4]
	ldr r1, [sp, #0xc]
	adds r1, #0x4a
	ldrh r1, [r1]
	bl sub_080532F0
	ldr r1, _08052DA4 @ =0x0203DFFC
	strh r0, [r1, #2]
_08052B0C:
	ldr r1, _08052DA8 @ =gBattleStats
	movs r0, #0x40
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	beq _08052B48
	ldr r0, [sp, #0xc]
	adds r0, #0x4a
	ldrh r0, [r0]
	bl IsItemDisplayedInBattle
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _08052B48
	ldr r1, [sp, #0x18]
	ldr r0, [r1, #4]
	ldrb r0, [r0, #4]
	cmp r0, #0x41
	bne _08052B38
	ldr r1, _08052DA4 @ =0x0203DFFC
	movs r0, #0xe
	strh r0, [r1, #2]
_08052B38:
	ldr r2, [sp, #0x18]
	ldr r0, [r2, #4]
	ldrb r0, [r0, #4]
	cmp r0, #0x40
	bne _08052B48
	ldr r1, _08052DA4 @ =0x0203DFFC
	movs r0, #0xf
	strh r0, [r1, #2]
_08052B48:
	ldr r3, [sp, #0x24]
	cmp r3, #0
	beq _08052B5C
	ldr r0, _08052DA4 @ =0x0203DFFC
	ldr r1, [sp, #8]
	adds r1, #0x4a
	ldrh r2, [r1]
	movs r1, #0
	bl sub_08053438
_08052B5C:
	ldr r4, [sp, #0x28]
	cmp r4, #0
	beq _08052B70
	ldr r0, _08052DAC @ =0x0203DFFE
	ldr r1, [sp, #0xc]
	adds r1, #0x4a
	ldrh r2, [r1]
	movs r1, #1
	bl sub_08053438
_08052B70:
	ldr r0, _08052DB0 @ =gEkrDistanceType
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	blt _08052B92
	cmp r0, #2
	bgt _08052B92
	mov r2, sl
	ldr r0, [r2, #4]
	ldrb r0, [r0, #4]
	cmp r0, #0x46
	bne _08052B92
	ldr r0, _08052DB4 @ =gAnims
	ldr r0, [r0]
	movs r1, #1
	bl sub_08065294
_08052B92:
	ldr r3, [sp, #0x24]
	asrs r5, r3, #0x10
	cmp r5, #0
	beq _08052BAC
	movs r0, #0x40
	rsbs r0, r0, #0
	mov r4, sl
	ldrb r4, [r4, #0xb]
	ands r0, r4
	bl sub_08053A80
	ldr r1, _08052DB8 @ =0x0203DFF8
	strh r0, [r1]
_08052BAC:
	ldr r0, [sp, #0x28]
	asrs r4, r0, #0x10
	cmp r4, #0
	beq _08052BC6
	movs r0, #0x40
	rsbs r0, r0, #0
	ldr r1, [sp, #0x18]
	ldrb r1, [r1, #0xb]
	ands r0, r1
	bl sub_08053A80
	ldr r1, _08052DB8 @ =0x0203DFF8
	strh r0, [r1, #2]
_08052BC6:
	ldr r1, _08052DBC @ =0x0203E074
	movs r3, #0
	strb r3, [r1, #1]
	strb r3, [r1]
	cmp r5, #0
	beq _08052BD8
	ldr r2, [sp, #0x10]
	ldrb r0, [r2, #4]
	strb r0, [r1]
_08052BD8:
	cmp r4, #0
	beq _08052BE2
	ldr r2, [sp, #0x14]
	ldrb r0, [r2, #4]
	strb r0, [r1, #1]
_08052BE2:
	ldr r0, _08052DC0 @ =0x0203E09C
	mov r8, r0
	cmp r5, #0
	beq _08052BF4
	ldr r0, [sp, #8]
	adds r0, #0x64
	ldrh r0, [r0]
	mov r1, r8
	strh r0, [r1]
_08052BF4:
	cmp r4, #0
	beq _08052C02
	ldr r0, [sp, #0xc]
	adds r0, #0x64
	ldrh r0, [r0]
	mov r2, r8
	strh r0, [r2, #2]
_08052C02:
	mov r4, r8
	ldrh r0, [r4]
	adds r1, r0, #0
	cmp r1, #0xff
	bne _08052C10
	ldr r0, _08052DC4 @ =0x0000FFFF
	strh r0, [r4]
_08052C10:
	mov r2, r8
	ldrh r0, [r2, #2]
	adds r4, r0, #0
	cmp r4, #0xff
	bne _08052C1E
	ldr r0, _08052DC4 @ =0x0000FFFF
	strh r0, [r2, #2]
_08052C1E:
	cmp r5, #0
	beq _08052C46
	ldr r2, _08052DC8 @ =0x0203E0A0
	ldr r1, [sp, #8]
	adds r1, #0x5a
	ldr r0, [sp, #0xc]
	adds r0, #0x5c
	ldrh r4, [r1]
	ldrh r0, [r0]
	subs r0, r4, r0
	strh r0, [r2]
	lsls r0, r0, #0x10
	cmp r0, #0
	bge _08052C3C
	strh r3, [r2]
_08052C3C:
	ldrh r1, [r1]
	cmp r1, #0xff
	bne _08052C46
	ldr r0, _08052DC4 @ =0x0000FFFF
	strh r0, [r2]
_08052C46:
	ldr r0, [sp, #0x28]
	cmp r0, #0
	beq _08052C72
	ldr r2, _08052DC8 @ =0x0203E0A0
	ldr r1, [sp, #0xc]
	adds r1, #0x5a
	ldr r0, [sp, #8]
	adds r0, #0x5c
	ldrh r3, [r1]
	ldrh r0, [r0]
	subs r0, r3, r0
	strh r0, [r2, #2]
	lsls r0, r0, #0x10
	cmp r0, #0
	bge _08052C68
	movs r0, #0
	strh r0, [r2, #2]
_08052C68:
	ldrh r1, [r1]
	cmp r1, #0xff
	bne _08052C72
	ldr r0, _08052DC4 @ =0x0000FFFF
	strh r0, [r2, #2]
_08052C72:
	ldr r4, [sp, #0x24]
	asrs r7, r4, #0x10
	ldr r3, _08052DCC @ =0x0203E0A4
	cmp r7, #0
	beq _08052C84
	ldr r0, [sp, #8]
	adds r0, #0x6a
	ldrh r0, [r0]
	strh r0, [r3]
_08052C84:
	ldr r0, [sp, #0x28]
	asrs r6, r0, #0x10
	cmp r6, #0
	beq _08052C94
	ldr r0, [sp, #0xc]
	adds r0, #0x6a
	ldrh r0, [r0]
	strh r0, [r3, #2]
_08052C94:
	adds r1, r3, #0
	ldrh r0, [r1]
	cmp r0, #0xff
	bne _08052CA0
	ldr r0, _08052DC4 @ =0x0000FFFF
	strh r0, [r1]
_08052CA0:
	ldrh r0, [r1, #2]
	cmp r0, #0xff
	bne _08052CAA
	ldr r0, _08052DC4 @ =0x0000FFFF
	strh r0, [r1, #2]
_08052CAA:
	ldr r0, _08052DB0 @ =gEkrDistanceType
	ldrh r0, [r0]
	cmp r0, #4
	bne _08052CCC
	ldr r2, _08052DC4 @ =0x0000FFFF
	adds r1, r2, #0
	mov r4, r8
	ldrh r0, [r4, #2]
	orrs r0, r1
	strh r0, [r4, #2]
	ldr r2, _08052DC8 @ =0x0203E0A0
	ldrh r0, [r2, #2]
	orrs r0, r1
	strh r0, [r2, #2]
	ldrh r0, [r3, #2]
	orrs r1, r0
	strh r1, [r3, #2]
_08052CCC:
	cmp r7, #0
	beq _08052CDE
	ldr r1, _08052DD0 @ =0x0203E0A8
	ldr r0, [sp, #8]
	adds r0, #0x71
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	strh r0, [r1]
_08052CDE:
	cmp r6, #0
	beq _08052CF0
	ldr r1, _08052DD0 @ =0x0203E0A8
	ldr r0, [sp, #0xc]
	adds r0, #0x71
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	strh r0, [r1, #2]
_08052CF0:
	cmp r7, #0
	beq _08052D02
	ldr r1, _08052DD4 @ =0x0203E0AC
	ldr r0, [sp, #8]
	adds r0, #0x6e
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	strh r0, [r1]
_08052D02:
	cmp r6, #0
	beq _08052D14
	ldr r1, _08052DD4 @ =0x0203E0AC
	ldr r0, [sp, #0xc]
	adds r0, #0x6e
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	strh r0, [r1, #2]
_08052D14:
	ldr r1, _08052DD8 @ =0x0203E0B8
	movs r5, #0
	strh r5, [r1, #2]
	strh r5, [r1]
	cmp r7, #0
	beq _08052D2C
	ldr r0, [sp, #8]
	adds r0, #0x53
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	strh r0, [r1]
_08052D2C:
	cmp r6, #0
	beq _08052D3C
	ldr r0, [sp, #0xc]
	adds r0, #0x53
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	strh r0, [r1, #2]
_08052D3C:
	ldr r4, _08052DDC @ =0x0203E0BC
	strh r5, [r4, #2]
	strh r5, [r4]
	cmp r7, #0
	beq _08052D58
	ldr r0, [sp, #8]
	adds r0, #0x48
	ldrh r0, [r0]
	ldr r1, [sp, #0x18]
	bl IsItemEffectiveAgainst
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	strh r0, [r4]
_08052D58:
	cmp r6, #0
	beq _08052D6E
	ldr r0, [sp, #0xc]
	adds r0, #0x48
	ldrh r0, [r0]
	mov r1, sl
	bl IsItemEffectiveAgainst
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	strh r0, [r4, #2]
_08052D6E:
	ldr r4, _08052DE0 @ =Unk_0203E088
	str r5, [r4, #4]
	str r5, [r4]
	cmp r7, #0
	beq _08052DF8
	ldr r0, [sp, #8]
	adds r0, #0x4a
	ldrh r0, [r0]
	bl GetItemIndex
	cmp r0, #0x36
	bgt _08052DF8
	cmp r0, #0x34
	blt _08052DF8
	mov r1, sl
	ldr r0, [r1, #4]
	ldrb r0, [r0, #4]
	cmp r0, #0x19
	beq _08052DE4
	cmp r0, #0x19
	ble _08052DF8
	cmp r0, #0x1a
	beq _08052DEC
	cmp r0, #0x1b
	beq _08052DF4
	b _08052DF8
	.align 2, 0
_08052DA4: .4byte 0x0203DFFC
_08052DA8: .4byte gBattleStats
_08052DAC: .4byte 0x0203DFFE
_08052DB0: .4byte gEkrDistanceType
_08052DB4: .4byte gAnims
_08052DB8: .4byte 0x0203DFF8
_08052DBC: .4byte 0x0203E074
_08052DC0: .4byte 0x0203E09C
_08052DC4: .4byte 0x0000FFFF
_08052DC8: .4byte 0x0203E0A0
_08052DCC: .4byte 0x0203E0A4
_08052DD0: .4byte 0x0203E0A8
_08052DD4: .4byte 0x0203E0AC
_08052DD8: .4byte 0x0203E0B8
_08052DDC: .4byte 0x0203E0BC
_08052DE0: .4byte Unk_0203E088
_08052DE4:
	ldr r0, _08052DE8 @ =0x081DFED8
	b _08052DF6
	.align 2, 0
_08052DE8: .4byte 0x081DFED8
_08052DEC:
	ldr r0, _08052DF0 @ =0x081E034C
	b _08052DF6
	.align 2, 0
_08052DF0: .4byte 0x081E034C
_08052DF4:
	ldr r0, _08052E28 @ =0x081E07EC
_08052DF6:
	str r0, [r4]
_08052DF8:
	ldr r2, [sp, #0x28]
	cmp r2, #0
	beq _08052E52
	ldr r0, [sp, #0xc]
	adds r0, #0x4a
	ldrh r0, [r0]
	bl GetItemIndex
	cmp r0, #0x36
	bgt _08052E52
	cmp r0, #0x34
	blt _08052E52
	ldr r3, [sp, #0x18]
	ldr r0, [r3, #4]
	ldrb r0, [r0, #4]
	cmp r0, #0x19
	beq _08052E2C
	cmp r0, #0x19
	ble _08052E52
	cmp r0, #0x1a
	beq _08052E3C
	cmp r0, #0x1b
	beq _08052E4C
	b _08052E52
	.align 2, 0
_08052E28: .4byte 0x081E07EC
_08052E2C:
	ldr r1, _08052E34 @ =Unk_0203E088
	ldr r0, _08052E38 @ =0x081DFED8
	b _08052E50
	.align 2, 0
_08052E34: .4byte Unk_0203E088
_08052E38: .4byte 0x081DFED8
_08052E3C:
	ldr r1, _08052E44 @ =Unk_0203E088
	ldr r0, _08052E48 @ =0x081E034C
	b _08052E50
	.align 2, 0
_08052E44: .4byte Unk_0203E088
_08052E48: .4byte 0x081E034C
_08052E4C:
	ldr r1, _08052E6C @ =Unk_0203E088
	ldr r0, _08052E70 @ =0x081E07EC
_08052E50:
	str r0, [r1, #4]
_08052E52:
	bl GetBanimLinkArenaFlag
	cmp r0, #1
	beq _08052E66
	ldr r0, _08052E74 @ =gPlaySt
	adds r0, #0x40
	ldrb r0, [r0]
	lsls r0, r0, #0x1f
	cmp r0, #0
	beq _08052E7C
_08052E66:
	ldr r1, _08052E78 @ =0x0203E0C0
	movs r0, #1
	b _08052E80
	.align 2, 0
_08052E6C: .4byte Unk_0203E088
_08052E70: .4byte 0x081E07EC
_08052E74: .4byte gPlaySt
_08052E78: .4byte 0x0203E0C0
_08052E7C:
	ldr r1, _08052EA4 @ =0x0203E0C0
	movs r0, #0
_08052E80:
	strh r0, [r1, #2]
	strh r0, [r1]
	ldr r5, _08052EA8 @ =0x0203DFE2
	movs r0, #0
	strh r0, [r5]
	bl GetBattleAnimType
	cmp r0, #3
	bne _08052ECE
	ldr r0, _08052EAC @ =0x0203DFE8
	movs r4, #0
	ldrsh r0, [r0, r4]
	cmp r0, #0
	beq _08052EB4
	ldr r0, _08052EB0 @ =0x0203E0B0
	ldrh r4, [r0]
	b _08052EB8
	.align 2, 0
_08052EA4: .4byte 0x0203E0C0
_08052EA8: .4byte 0x0203DFE2
_08052EAC: .4byte 0x0203DFE8
_08052EB0: .4byte 0x0203E0B0
_08052EB4:
	ldr r0, _0805300C @ =0x0203E0B0
	ldrh r4, [r0, #2]
_08052EB8:
	ldr r0, _08053010 @ =gPlaySt
	ldrb r0, [r0, #0xe]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl GetROMChapterStruct
	ldrb r1, [r0, #0x13]
	adds r0, r4, #0
	bl sub_08053218
	strh r0, [r5]
_08052ECE:
	bl sub_0806BF78
	cmp r0, #1
	bne _08052EDC
	ldr r1, _08053014 @ =0x0203DFE2
	movs r0, #0x3c
	strh r0, [r1]
_08052EDC:
	movs r4, #0
	bl GetBattleAnimType
	cmp r0, #0
	bne _08052EE8
	movs r4, #1
_08052EE8:
	bl GetBattleAnimType
	cmp r0, #3
	bne _08052EF2
	movs r4, #1
_08052EF2:
	bl GetBattleAnimType
	cmp r0, #1
	bne _08052F28
	ldr r0, _08053018 @ =gEkrDistanceType
	ldrh r0, [r0]
	cmp r0, #4
	bne _08052F04
	movs r4, #1
_08052F04:
	bl sub_08055CD8
	cmp r0, #1
	bne _08052F0E
	movs r4, #1
_08052F0E:
	mov r1, sl
	ldr r0, [r1, #4]
	ldrb r0, [r0, #4]
	cmp r0, #0x46
	bne _08052F1A
	movs r4, #1
_08052F1A:
	bl sub_08053C28
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne _08052F28
	movs r4, #1
_08052F28:
	bl sub_08053C1C
	ldr r0, _08053018 @ =gEkrDistanceType
	ldrh r0, [r0]
	cmp r0, #4
	beq _08052F60
	mov r2, sl
	ldr r0, [r2, #0xc]
	movs r1, #0x80
	lsls r1, r1, #4
	ands r0, r1
	cmp r0, #0
	bne _08053008
	ldr r3, [sp, #0x18]
	ldr r0, [r3, #0xc]
	ands r0, r1
	cmp r0, #0
	bne _08053008
	mov r1, sl
	ldr r0, [r1]
	ldrb r0, [r0, #4]
	cmp r0, #0x28
	beq _08053008
	ldr r2, [sp, #0x18]
	ldr r0, [r2]
	ldrb r0, [r0, #4]
	cmp r0, #0x28
	beq _08053008
_08052F60:
	ldr r3, [sp, #0x20]
	cmp r3, #1
	beq _08052F70
	mov r1, sl
	ldr r0, [r1, #4]
	ldrb r0, [r0, #4]
	cmp r0, #0x46
	beq _0805302C
_08052F70:
	cmp r4, #0
	beq _08053008
	ldr r0, _0805301C @ =0x0203DFE8
	adds r3, r0, #0
	ldrh r2, [r3]
	cmp r2, #1
	bne _08052FC0
	mov r1, sl
	adds r1, #0x30
	movs r0, #0xf
	ldrb r1, [r1]
	ands r0, r1
	cmp r0, #4
	beq _08053008
	ldr r0, _08053020 @ =0x0203E066
	movs r4, #0
	ldrsh r0, [r0, r4]
	movs r2, #1
	rsbs r2, r2, #0
	cmp r0, r2
	beq _08053008
	ldr r0, _08053024 @ =0x0203DFFC
	movs r4, #0
	ldrsh r1, [r0, r4]
	movs r0, #2
	rsbs r0, r0, #0
	cmp r1, r0
	beq _08053008
	ldr r0, _08053028 @ =0x0203E000
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, r2
	beq _08053008
	ldr r0, _0805300C @ =0x0203E0B0
	movs r2, #0
	ldrsh r0, [r0, r2]
	cmp r0, #0x1b
	beq _08053008
	cmp r0, #0x33
	beq _08053008
_08052FC0:
	ldrh r3, [r3, #2]
	cmp r3, #1
	bne _0805302C
	ldr r1, [sp, #0x18]
	adds r1, #0x30
	movs r0, #0xf
	ldrb r1, [r1]
	ands r0, r1
	cmp r0, #4
	beq _08053008
	ldr r0, _08053020 @ =0x0203E066
	movs r3, #2
	ldrsh r0, [r0, r3]
	movs r2, #1
	rsbs r2, r2, #0
	cmp r0, r2
	beq _08053008
	ldr r0, _08053024 @ =0x0203DFFC
	movs r4, #2
	ldrsh r1, [r0, r4]
	movs r0, #2
	rsbs r0, r0, #0
	cmp r1, r0
	beq _08053008
	ldr r0, _08053028 @ =0x0203E000
	movs r1, #2
	ldrsh r0, [r0, r1]
	cmp r0, r2
	beq _08053008
	ldr r0, _0805300C @ =0x0203E0B0
	movs r2, #2
	ldrsh r0, [r0, r2]
	cmp r0, #0x1b
	beq _08053008
	cmp r0, #0x33
	bne _0805302C
_08053008:
	movs r0, #0
	b _0805302E
	.align 2, 0
_0805300C: .4byte 0x0203E0B0
_08053010: .4byte gPlaySt
_08053014: .4byte 0x0203DFE2
_08053018: .4byte gEkrDistanceType
_0805301C: .4byte 0x0203DFE8
_08053020: .4byte 0x0203E066
_08053024: .4byte 0x0203DFFC
_08053028: .4byte 0x0203E000
_0805302C:
	movs r0, #1
_0805302E:
	add sp, #0x2c
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_08053040
sub_08053040: @ 0x08053040
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	adds r5, r0, #0
	adds r4, r1, #0
	mov sb, r3
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	mov r8, r2
	movs r0, #0
	mov sl, r0
	cmp r4, #0
	beq _08053076
	mov r0, r8
	bl GetItemType
	cmp r0, #9
	bne _08053080
	mov r0, r8
	bl IsItemDisplayedInBattle
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _08053080
_08053076:
	ldr r0, _0805307C @ =0x0000FFFF
	b _0805312C
	.align 2, 0
_0805307C: .4byte 0x0000FFFF
_08053080:
	mov r1, r8
	cmp r1, #0
	bne _0805308A
	movs r3, #9
	b _08053094
_0805308A:
	mov r0, r8
	bl GetItemType
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
_08053094:
	str r4, [sp]
	ldr r2, [r5]
	ldr r1, [r5, #4]
	ldr r0, [r2, #0x28]
	ldr r1, [r1, #0x28]
	orrs r0, r1
	lsrs r0, r0, #8
	movs r1, #1
	ands r0, r1
	adds r2, #0x25
	adds r2, r2, r0
	ldrb r0, [r2]
	cmp r0, #0
	beq _080530BA
	ldr r1, _080530CC @ =0x08D6136C
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	str r0, [sp]
_080530BA:
	movs r0, #0
	mov r2, sb
	str r0, [r2]
	movs r7, #0
	movs r1, #0
_080530C4:
	ldr r5, [sp]
	movs r6, #0
	b _08053114
	.align 2, 0
_080530CC: .4byte 0x08D6136C
_080530D0:
	cmp r7, #0
	bne _080530D8
	cmp r0, #0xff
	bhi _08053110
_080530D8:
	cmp r7, #1
	bne _080530E2
	ldrh r4, [r5]
	cmp r4, #0xff
	bls _08053110
_080530E2:
	ldrh r4, [r5]
	mov r0, r8
	str r1, [sp, #4]
	str r3, [sp, #8]
	bl GetItemIndex
	ldr r1, [sp, #4]
	ldr r3, [sp, #8]
	cmp r4, r0
	beq _08053100
	ldrh r2, [r5]
	ldr r4, _0805310C @ =0xFFFFFF00
	adds r0, r2, r4
	cmp r0, r3
	bne _08053110
_08053100:
	ldrh r5, [r5, #2]
	mov sl, r5
	mov r0, sb
	str r6, [r0]
	movs r1, #1
	b _0805311A
	.align 2, 0
_0805310C: .4byte 0xFFFFFF00
_08053110:
	adds r5, #4
	adds r6, #1
_08053114:
	ldrh r0, [r5]
	cmp r0, #0
	bne _080530D0
_0805311A:
	cmp r1, #1
	beq _08053124
	adds r7, #1
	cmp r7, #1
	ble _080530C4
_08053124:
	mov r0, sl
	subs r0, #1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
_0805312C:
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	thumb_func_start sub_0805313C
sub_0805313C: @ 0x0805313C
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	lsls r1, r1, #0x10
	lsrs r0, r1, #0x10
	cmp r0, #0xe
	bhi _08053204
	lsls r0, r0, #2
	ldr r1, _08053154 @ =_08053158
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08053154: .4byte _08053158
_08053158: @ jump table
	.4byte _08053204 @ case 0
	.4byte _08053194 @ case 1
	.4byte _0805319C @ case 2
	.4byte _080531A4 @ case 3
	.4byte _080531AC @ case 4
	.4byte _080531B4 @ case 5
	.4byte _080531BC @ case 6
	.4byte _080531C4 @ case 7
	.4byte _080531CC @ case 8
	.4byte _080531D4 @ case 9
	.4byte _080531DC @ case 10
	.4byte _080531E4 @ case 11
	.4byte _080531EC @ case 12
	.4byte _080531F4 @ case 13
	.4byte _080531FC @ case 14
_08053194:
	ldr r0, _08053198 @ =0x08C53B93
	b _08053206
	.align 2, 0
_08053198: .4byte 0x08C53B93
_0805319C:
	ldr r0, _080531A0 @ =0x08C53BD4
	b _08053206
	.align 2, 0
_080531A0: .4byte 0x08C53BD4
_080531A4:
	ldr r0, _080531A8 @ =0x08C53C15
	b _08053206
	.align 2, 0
_080531A8: .4byte 0x08C53C15
_080531AC:
	ldr r0, _080531B0 @ =0x08C53C56
	b _08053206
	.align 2, 0
_080531B0: .4byte 0x08C53C56
_080531B4:
	ldr r0, _080531B8 @ =0x08C53C97
	b _08053206
	.align 2, 0
_080531B8: .4byte 0x08C53C97
_080531BC:
	ldr r0, _080531C0 @ =0x08C53CD8
	b _08053206
	.align 2, 0
_080531C0: .4byte 0x08C53CD8
_080531C4:
	ldr r0, _080531C8 @ =0x08C53D19
	b _08053206
	.align 2, 0
_080531C8: .4byte 0x08C53D19
_080531CC:
	ldr r0, _080531D0 @ =0x08C53D5A
	b _08053206
	.align 2, 0
_080531D0: .4byte 0x08C53D5A
_080531D4:
	ldr r0, _080531D8 @ =0x08C53D9B
	b _08053206
	.align 2, 0
_080531D8: .4byte 0x08C53D9B
_080531DC:
	ldr r0, _080531E0 @ =0x08C53DDC
	b _08053206
	.align 2, 0
_080531E0: .4byte 0x08C53DDC
_080531E4:
	ldr r0, _080531E8 @ =0x08C53E1D
	b _08053206
	.align 2, 0
_080531E8: .4byte 0x08C53E1D
_080531EC:
	ldr r0, _080531F0 @ =0x08C53E5E
	b _08053206
	.align 2, 0
_080531F0: .4byte 0x08C53E5E
_080531F4:
	ldr r0, _080531F8 @ =0x08C53E9F
	b _08053206
	.align 2, 0
_080531F8: .4byte 0x08C53E9F
_080531FC:
	ldr r0, _08053200 @ =0x08C53EE0
	b _08053206
	.align 2, 0
_08053200: .4byte 0x08C53EE0
_08053204:
	ldr r0, _08053214 @ =0x08C53B52
_08053206:
	adds r0, r2, r0
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r0, #1
	bx lr
	.align 2, 0
_08053214: .4byte 0x08C53B52

	thumb_func_start sub_08053218
sub_08053218: @ 0x08053218
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	lsls r1, r1, #0x10
	lsrs r0, r1, #0x10
	cmp r0, #0xe
	bhi _080532E0
	lsls r0, r0, #2
	ldr r1, _08053230 @ =_08053234
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08053230: .4byte _08053234
_08053234: @ jump table
	.4byte _080532E0 @ case 0
	.4byte _08053270 @ case 1
	.4byte _08053278 @ case 2
	.4byte _08053280 @ case 3
	.4byte _08053288 @ case 4
	.4byte _08053290 @ case 5
	.4byte _08053298 @ case 6
	.4byte _080532A0 @ case 7
	.4byte _080532A8 @ case 8
	.4byte _080532B0 @ case 9
	.4byte _080532B8 @ case 10
	.4byte _080532C0 @ case 11
	.4byte _080532C8 @ case 12
	.4byte _080532D0 @ case 13
	.4byte _080532D8 @ case 14
_08053270:
	ldr r0, _08053274 @ =0x08C53F62
	b _080532E2
	.align 2, 0
_08053274: .4byte 0x08C53F62
_08053278:
	ldr r0, _0805327C @ =0x08C53FA3
	b _080532E2
	.align 2, 0
_0805327C: .4byte 0x08C53FA3
_08053280:
	ldr r0, _08053284 @ =0x08C53FE4
	b _080532E2
	.align 2, 0
_08053284: .4byte 0x08C53FE4
_08053288:
	ldr r0, _0805328C @ =0x08C54025
	b _080532E2
	.align 2, 0
_0805328C: .4byte 0x08C54025
_08053290:
	ldr r0, _08053294 @ =0x08C54066
	b _080532E2
	.align 2, 0
_08053294: .4byte 0x08C54066
_08053298:
	ldr r0, _0805329C @ =0x08C540A7
	b _080532E2
	.align 2, 0
_0805329C: .4byte 0x08C540A7
_080532A0:
	ldr r0, _080532A4 @ =0x08C540E8
	b _080532E2
	.align 2, 0
_080532A4: .4byte 0x08C540E8
_080532A8:
	ldr r0, _080532AC @ =0x08C54129
	b _080532E2
	.align 2, 0
_080532AC: .4byte 0x08C54129
_080532B0:
	ldr r0, _080532B4 @ =0x08C5416A
	b _080532E2
	.align 2, 0
_080532B4: .4byte 0x08C5416A
_080532B8:
	ldr r0, _080532BC @ =0x08C541AB
	b _080532E2
	.align 2, 0
_080532BC: .4byte 0x08C541AB
_080532C0:
	ldr r0, _080532C4 @ =0x08C541EC
	b _080532E2
	.align 2, 0
_080532C4: .4byte 0x08C541EC
_080532C8:
	ldr r0, _080532CC @ =0x08C5422D
	b _080532E2
	.align 2, 0
_080532CC: .4byte 0x08C5422D
_080532D0:
	ldr r0, _080532D4 @ =0x08C5426E
	b _080532E2
	.align 2, 0
_080532D4: .4byte 0x08C5426E
_080532D8:
	ldr r0, _080532DC @ =0x08C542AF
	b _080532E2
	.align 2, 0
_080532DC: .4byte 0x08C542AF
_080532E0:
	ldr r0, _080532EC @ =0x08C53F21
_080532E2:
	adds r0, r2, r0
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bx lr
	.align 2, 0
_080532EC: .4byte 0x08C53F21

	thumb_func_start sub_080532F0
sub_080532F0: @ 0x080532F0
	push {r4, lr}
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	adds r0, r1, #0
	bl GetItemIndex
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldr r3, _0805330C @ =0x08D61678
	ldrh r1, [r3]
	ldr r2, _08053310 @ =0x0000FFFF
	b _08053318
	.align 2, 0
_0805330C: .4byte 0x08D61678
_08053310: .4byte 0x0000FFFF
_08053314:
	adds r3, #0x10
	ldrh r1, [r3]
_08053318:
	cmp r1, r2
	beq _08053320
	cmp r1, r0
	bne _08053314
_08053320:
	ldrh r2, [r3, #4]
	ldrh r3, [r3, #4]
	cmp r3, #3
	beq _0805332A
	b _0805342E
_0805332A:
	subs r0, r4, #7
	cmp r0, #0x31
	bls _08053332
	b _0805342E
_08053332:
	lsls r0, r0, #2
	ldr r1, _0805333C @ =_08053340
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0805333C: .4byte _08053340
_08053340: @ jump table
	.4byte _08053410 @ case 0
	.4byte _0805342E @ case 1
	.4byte _0805342E @ case 2
	.4byte _0805342E @ case 3
	.4byte _0805342E @ case 4
	.4byte _0805342E @ case 5
	.4byte _0805342E @ case 6
	.4byte _0805342E @ case 7
	.4byte _0805342E @ case 8
	.4byte _0805342E @ case 9
	.4byte _0805342E @ case 10
	.4byte _0805342E @ case 11
	.4byte _0805342E @ case 12
	.4byte _0805342E @ case 13
	.4byte _0805342E @ case 14
	.4byte _0805342C @ case 15
	.4byte _0805342C @ case 16
	.4byte _0805342E @ case 17
	.4byte _0805342E @ case 18
	.4byte _0805342E @ case 19
	.4byte _0805342E @ case 20
	.4byte _0805342E @ case 21
	.4byte _0805342E @ case 22
	.4byte _0805342E @ case 23
	.4byte _0805342E @ case 24
	.4byte _0805342E @ case 25
	.4byte _0805342E @ case 26
	.4byte _0805342E @ case 27
	.4byte _0805342E @ case 28
	.4byte _0805342E @ case 29
	.4byte _0805342E @ case 30
	.4byte _0805342E @ case 31
	.4byte _0805342E @ case 32
	.4byte _08053408 @ case 33
	.4byte _08053408 @ case 34
	.4byte _08053414 @ case 35
	.4byte _08053418 @ case 36
	.4byte _0805342E @ case 37
	.4byte _0805342E @ case 38
	.4byte _0805342E @ case 39
	.4byte _0805342E @ case 40
	.4byte _0805342E @ case 41
	.4byte _0805342E @ case 42
	.4byte _0805341C @ case 43
	.4byte _08053420 @ case 44
	.4byte _08053424 @ case 45
	.4byte _08053424 @ case 46
	.4byte _08053428 @ case 47
	.4byte _08053428 @ case 48
	.4byte _0805340C @ case 49
_08053408:
	movs r2, #4
	b _0805342E
_0805340C:
	movs r2, #5
	b _0805342E
_08053410:
	movs r2, #0xc
	b _0805342E
_08053414:
	movs r2, #6
	b _0805342E
_08053418:
	movs r2, #0xd
	b _0805342E
_0805341C:
	movs r2, #7
	b _0805342E
_08053420:
	movs r2, #8
	b _0805342E
_08053424:
	movs r2, #9
	b _0805342E
_08053428:
	movs r2, #0xa
	b _0805342E
_0805342C:
	movs r2, #0xb
_0805342E:
	lsls r0, r2, #0x10
	asrs r0, r0, #0x10
	pop {r4}
	pop {r1}
	bx r1

	thumb_func_start sub_08053438
sub_08053438: @ 0x08053438
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r0, r2, #0
	lsls r1, r1, #0x10
	lsrs r5, r1, #0x10
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl GetItemIndex
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	movs r0, #0
	ldrsh r1, [r4, r0]
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	bne _0805345E
	movs r0, #0
	strh r0, [r4]
_0805345E:
	ldr r0, _08053480 @ =0x0203DFE4
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, r5
	beq _08053478
	cmp r2, #0x53
	blt _08053478
	cmp r2, #0x55
	ble _08053474
	cmp r2, #0x57
	bne _08053478
_08053474:
	movs r0, #0
	strh r0, [r4]
_08053478:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08053480: .4byte 0x0203DFE4

	thumb_func_start sub_08053484
sub_08053484: @ 0x08053484
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x20
	ldr r0, _080534DC @ =gBattleHitArray
	mov sb, r0
	movs r2, #0
	ldr r4, _080534E0 @ =0x0203E00E
	ldr r5, _080534E4 @ =0x0203E078
	ldr r6, _080534E8 @ =gEkrDistanceType
	ldr r1, _080534EC @ =0x0000FFFF
	adds r3, r1, #0
	adds r1, r4, #0
_080534A2:
	ldrh r0, [r1]
	orrs r0, r3
	strh r0, [r1]
	adds r1, #2
	adds r2, #1
	cmp r2, #0x13
	bls _080534A2
	movs r2, #0
	ldr r0, _080534F0 @ =0x0203E03A
	ldr r1, _080534EC @ =0x0000FFFF
	adds r3, r1, #0
	adds r1, r0, #4
_080534BA:
	ldrh r0, [r1]
	orrs r0, r3
	strh r0, [r1]
	adds r1, #2
	adds r2, #1
	cmp r2, #0x13
	bls _080534BA
	movs r2, #0
	str r2, [r5, #4]
	str r2, [r5]
	movs r5, #0
	ldrsh r0, [r6, r5]
	cmp r0, #4
	bne _080534F4
	strh r0, [r4]
	strh r0, [r4, #2]
	b _080539E6
	.align 2, 0
_080534DC: .4byte gBattleHitArray
_080534E0: .4byte 0x0203E00E
_080534E4: .4byte 0x0203E078
_080534E8: .4byte gEkrDistanceType
_080534EC: .4byte 0x0000FFFF
_080534F0: .4byte 0x0203E03A
_080534F4:
	ldr r1, _08053508 @ =gBattleStats
	movs r0, #0x40
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	beq _0805350C
	movs r0, #6
	strh r0, [r4]
	strh r2, [r4, #2]
	b _080539E6
	.align 2, 0
_08053508: .4byte gBattleStats
_0805350C:
	ldrh r6, [r6]
	str r6, [sp, #0x14]
	str r6, [sp, #0x18]
	ldr r0, _080535BC @ =gpEkrBattleUnitLeft
	ldr r0, [r0]
	str r0, [sp, #4]
	ldr r0, _080535C0 @ =gpEkrBattleUnitRight
	ldr r0, [r0]
	str r0, [sp, #8]
	ldr r0, [sp, #4]
	adds r0, #0x4a
	ldrh r0, [r0]
	bl GetItemIndex
	cmp r0, #0x11
	bne _08053534
	cmp r6, #0
	bne _08053534
	movs r0, #1
	str r0, [sp, #0x14]
_08053534:
	ldr r4, [sp, #8]
	adds r4, #0x4a
	ldrh r0, [r4]
	bl GetItemIndex
	adds r5, r4, #0
	cmp r0, #0x11
	bne _0805354E
	ldr r1, [sp, #0x18]
	cmp r1, #0
	bne _0805354E
	movs r2, #1
	str r2, [sp, #0x18]
_0805354E:
	ldr r4, [sp, #4]
	adds r4, #0x4a
	ldrh r0, [r4]
	bl GetItemIndex
	cmp r0, #0x28
	bne _08053566
	ldr r0, [sp, #0x14]
	cmp r0, #0
	bne _08053566
	movs r1, #1
	str r1, [sp, #0x14]
_08053566:
	ldrh r0, [r5]
	bl GetItemIndex
	cmp r0, #0x28
	bne _0805357A
	ldr r2, [sp, #0x18]
	cmp r2, #0
	bne _0805357A
	movs r0, #1
	str r0, [sp, #0x18]
_0805357A:
	ldrh r0, [r4]
	bl GetItemIndex
	cmp r0, #0x29
	bne _0805358E
	ldr r1, [sp, #0x14]
	cmp r1, #0
	bne _0805358E
	movs r2, #1
	str r2, [sp, #0x14]
_0805358E:
	ldrh r0, [r5]
	bl GetItemIndex
	cmp r0, #0x29
	bne _080535A2
	ldr r5, [sp, #0x18]
	cmp r5, #0
	bne _080535A2
	movs r0, #1
	str r0, [sp, #0x18]
_080535A2:
	ldr r2, _080535C4 @ =0x0203E03A
	ldr r1, _080535C8 @ =0x0203E090
	ldrh r0, [r1]
	strh r0, [r2]
	ldrh r0, [r1, #2]
	strh r0, [r2, #2]
	movs r1, #0
	str r1, [sp, #0xc]
	mov r8, r1
	movs r7, #0
	mov r5, sb
	ldrb r1, [r5, #2]
	b _080539DC
	.align 2, 0
_080535BC: .4byte gpEkrBattleUnitLeft
_080535C0: .4byte gpEkrBattleUnitRight
_080535C4: .4byte 0x0203E03A
_080535C8: .4byte 0x0203E090
_080535CC:
	movs r0, #8
	ands r0, r1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	rsbs r0, r0, #0
	lsrs r0, r0, #0x1f
	str r0, [sp, #0x10]
	ldr r0, _08053604 @ =0x0203DFEC
	movs r1, #0
	ldrsh r0, [r0, r1]
	ldr r2, [sp, #0x10]
	cmp r0, r2
	bne _0805360C
	mov r5, sp
	movs r0, #2
	add r0, sp
	mov sl, r0
	ldr r4, [sp, #0x14]
	ldr r1, [sp, #0x18]
	str r1, [sp, #0x1c]
	ldr r6, [sp, #4]
	movs r3, #0
	ldr r2, [sp, #0xc]
	cmp r2, #0
	bne _08053628
	ldr r0, _08053608 @ =0x0203DFE4
	strh r2, [r0]
	b _08053628
	.align 2, 0
_08053604: .4byte 0x0203DFEC
_08053608: .4byte 0x0203DFE4
_0805360C:
	mov r5, sp
	adds r5, #2
	mov sl, sp
	ldr r4, [sp, #0x18]
	ldr r0, [sp, #0x14]
	str r0, [sp, #0x1c]
	ldr r6, [sp, #8]
	movs r3, #0
	ldr r1, [sp, #0xc]
	cmp r1, #0
	bne _08053628
	ldr r1, _08053660 @ =0x0203DFE4
	movs r0, #1
	strh r0, [r1]
_08053628:
	movs r2, #0x80
	lsls r2, r2, #3
	adds r0, r2, #0
	mov r1, sb
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	beq _08053644
	ldr r2, _08053664 @ =0x0203E078
	ldr r1, _08053668 @ =gBattleStats
	ldr r0, [r1, #0x10]
	str r0, [r2]
	ldr r0, [r1, #0x14]
	str r0, [r2, #4]
_08053644:
	mov r2, sb
	ldrh r1, [r2]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _08053678
	adds r0, r6, #0
	bl UnitHasMagicRank
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08053670
	ldr r0, _0805366C @ =0x081DE190
	b _080536F2
	.align 2, 0
_08053660: .4byte 0x0203DFE4
_08053664: .4byte 0x0203E078
_08053668: .4byte gBattleStats
_0805366C: .4byte 0x081DE190
_08053670:
	ldr r0, _08053674 @ =0x081DE1B8
	b _080536F2
	.align 2, 0
_08053674: .4byte 0x081DE1B8
_08053678:
	movs r2, #0x80
	lsls r2, r2, #4
	adds r0, r2, #0
	ands r0, r1
	cmp r0, #0
	beq _080536A0
	adds r0, r6, #0
	bl UnitHasMagicRank
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08053698
	ldr r0, _08053694 @ =0x081DE190
	b _080536F2
	.align 2, 0
_08053694: .4byte 0x081DE190
_08053698:
	ldr r0, _0805369C @ =0x081DE1B8
	b _080536F2
	.align 2, 0
_0805369C: .4byte 0x081DE1B8
_080536A0:
	lsls r0, r3, #0x10
	cmp r0, #0
	blt _080536C4
	adds r0, r6, #0
	bl UnitHasMagicRank
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080536BC
	ldr r0, _080536B8 @ =0x081DE17C
	b _080536F2
	.align 2, 0
_080536B8: .4byte 0x081DE17C
_080536BC:
	ldr r0, _080536C0 @ =0x081DE1AE
	b _080536F2
	.align 2, 0
_080536C0: .4byte 0x081DE1AE
_080536C4:
	movs r0, #2
	bl sub_08067AD4
	cmp r0, #1
	beq _080536E8
	cmp r0, #1
	bgt _080536D8
	cmp r0, #0
	beq _080536DE
	b _080536FC
_080536D8:
	cmp r0, #2
	beq _080536F0
	b _080536FC
_080536DE:
	ldr r0, _080536E4 @ =0x081DE1C2
	b _080536F2
	.align 2, 0
_080536E4: .4byte 0x081DE1C2
_080536E8:
	ldr r0, _080536EC @ =0x081DE1CC
	b _080536F2
	.align 2, 0
_080536EC: .4byte 0x081DE1CC
_080536F0:
	ldr r0, _08053718 @ =0x081DE1D6
_080536F2:
	lsls r1, r4, #0x10
	asrs r1, r1, #0xf
	adds r1, r1, r0
	ldrh r0, [r1]
	strh r0, [r5]
_080536FC:
	movs r0, #2
	mov r1, sb
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	beq _08053738
	adds r0, r6, #0
	bl UnitHasMagicRank
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08053720
	ldr r0, _0805371C @ =0x081DE186
	b _08053722
	.align 2, 0
_08053718: .4byte 0x081DE1D6
_0805371C: .4byte 0x081DE186
_08053720:
	ldr r0, _08053730 @ =0x081DE1AE
_08053722:
	lsls r1, r4, #0x10
	asrs r1, r1, #0xf
	adds r1, r1, r0
	ldrh r0, [r1]
	strh r0, [r5]
	ldr r0, _08053734 @ =0x081DE19A
	b _0805373A
	.align 2, 0
_08053730: .4byte 0x081DE1AE
_08053734: .4byte 0x081DE19A
_08053738:
	ldr r0, _080537BC @ =0x081DE1A4
_0805373A:
	ldr r2, [sp, #0x1c]
	lsls r1, r2, #0x10
	asrs r1, r1, #0xf
	adds r1, r1, r0
	ldrh r0, [r1]
	mov r5, sl
	strh r0, [r5]
	ldr r1, _080537C0 @ =0x0203E00E
	ldr r2, [sp, #0xc]
	lsls r0, r2, #2
	adds r5, r0, r1
	mov r0, sp
	ldrh r0, [r0]
	movs r6, #0
	strh r0, [r5]
	lsls r0, r2, #1
	adds r0, #1
	lsls r0, r0, #1
	adds r4, r0, r1
	mov r1, sp
	ldrh r0, [r1, #2]
	strh r0, [r4]
	mov r2, sb
	ldrh r1, [r2]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _08053774
	b _080539CE
_08053774:
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _08053810
	ldr r0, _080537C4 @ =0x0203DFEC
	movs r1, #0
	ldrsh r0, [r0, r1]
	ldr r2, [sp, #0x10]
	cmp r0, r2
	bne _080537D0
	lsls r0, r7, #1
	bl GetEfxHp
	mov r2, sb
	movs r1, #3
	ldrsb r1, [r2, r1]
	subs r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	cmp r0, #0
	bge _080537A0
	movs r2, #0
_080537A0:
	adds r0, r7, #1
	lsls r0, r0, #0x10
	lsrs r7, r0, #0x10
	lsls r0, r7, #2
	ldr r1, _080537C8 @ =0x0203E03A
	adds r0, r0, r1
	strh r2, [r0]
	ldr r2, _080537CC @ =0xFFFF8000
	adds r0, r2, #0
	ldrh r1, [r5]
	orrs r0, r1
	strh r0, [r5]
	b _080539CE
	.align 2, 0
_080537BC: .4byte 0x081DE1A4
_080537C0: .4byte 0x0203E00E
_080537C4: .4byte 0x0203DFEC
_080537C8: .4byte 0x0203E03A
_080537CC: .4byte 0xFFFF8000
_080537D0:
	mov r2, r8
	lsls r0, r2, #1
	adds r0, #1
	bl GetEfxHp
	mov r5, sb
	movs r1, #3
	ldrsb r1, [r5, r1]
	subs r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	cmp r0, #0
	bge _080537EC
	movs r2, #0
_080537EC:
	mov r0, r8
	adds r0, #1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov r8, r0
	lsls r0, r0, #1
	adds r0, #1
	lsls r0, r0, #1
	ldr r1, _08053808 @ =0x0203E03A
	adds r0, r0, r1
	strh r2, [r0]
	ldr r2, _0805380C @ =0xFFFF8000
	b _080539C6
	.align 2, 0
_08053808: .4byte 0x0203E03A
_0805380C: .4byte 0xFFFF8000
_08053810:
	movs r2, #0x80
	lsls r2, r2, #1
	adds r0, r2, #0
	ands r0, r1
	cmp r0, #0
	beq _080538F8
	ldr r0, _08053884 @ =0x0203DFEC
	movs r5, #0
	ldrsh r0, [r0, r5]
	ldr r1, [sp, #0x10]
	cmp r0, r1
	bne _08053890
	mov r2, r8
	lsls r0, r2, #1
	adds r0, #1
	bl GetEfxHp
	mov r5, sb
	movs r1, #3
	ldrsb r1, [r5, r1]
	subs r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	cmp r0, #0
	bge _08053844
	movs r2, #0
_08053844:
	mov r0, r8
	adds r0, #1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov r8, r0
	ldr r4, _08053888 @ =0x0203E03A
	lsls r0, r0, #1
	adds r0, #1
	lsls r0, r0, #1
	adds r0, r0, r4
	strh r2, [r0]
	lsls r0, r7, #1
	bl GetEfxHp
	mov r2, sb
	movs r1, #3
	ldrsb r1, [r2, r1]
	adds r0, r0, r1
	lsls r0, r0, #0x10
	ldr r3, _0805388C @ =0x0203E094
	lsrs r2, r0, #0x10
	ldrh r5, [r3]
	lsls r1, r5, #0x10
	cmp r0, r1
	ble _08053878
	ldrh r2, [r3]
_08053878:
	adds r0, r7, #1
	lsls r0, r0, #0x10
	lsrs r7, r0, #0x10
	lsls r0, r7, #2
	b _080538E8
	.align 2, 0
_08053884: .4byte 0x0203DFEC
_08053888: .4byte 0x0203E03A
_0805388C: .4byte 0x0203E094
_08053890:
	lsls r0, r7, #1
	bl GetEfxHp
	mov r2, sb
	movs r1, #3
	ldrsb r1, [r2, r1]
	subs r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	cmp r0, #0
	bge _080538A8
	movs r2, #0
_080538A8:
	adds r0, r7, #1
	lsls r0, r0, #0x10
	lsrs r7, r0, #0x10
	ldr r4, _080538F0 @ =0x0203E03A
	lsls r0, r7, #2
	adds r0, r0, r4
	strh r2, [r0]
	mov r5, r8
	lsls r0, r5, #1
	adds r0, #1
	bl GetEfxHp
	mov r2, sb
	movs r1, #3
	ldrsb r1, [r2, r1]
	adds r0, r0, r1
	lsls r0, r0, #0x10
	ldr r3, _080538F4 @ =0x0203E094
	lsrs r2, r0, #0x10
	ldrh r5, [r3, #2]
	lsls r1, r5, #0x10
	cmp r0, r1
	ble _080538D8
	ldrh r2, [r3, #2]
_080538D8:
	mov r0, r8
	adds r0, #1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov r8, r0
	lsls r0, r0, #1
	adds r0, #1
	lsls r0, r0, #1
_080538E8:
	adds r0, r0, r4
	strh r2, [r0]
	b _080539CE
	.align 2, 0
_080538F0: .4byte 0x0203E03A
_080538F4: .4byte 0x0203E094
_080538F8:
	ldr r0, _0805396C @ =0x0203DFEC
	movs r1, #0
	ldrsh r0, [r0, r1]
	ldr r2, [sp, #0x10]
	cmp r0, r2
	bne _08053974
	mov r1, r8
	lsls r0, r1, #1
	adds r0, #1
	bl GetEfxHp
	mov r2, sb
	movs r1, #3
	ldrsb r1, [r2, r1]
	subs r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	cmp r0, #0
	bge _08053920
	movs r2, #0
_08053920:
	mov r0, r8
	adds r0, #1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov r8, r0
	lsls r0, r0, #1
	adds r0, #1
	lsls r0, r0, #1
	ldr r1, _08053970 @ =0x0203E03A
	adds r0, r0, r1
	strh r2, [r0]
	movs r0, #0x40
	mov r2, sb
	ldrh r2, [r2]
	ands r0, r2
	cmp r0, #0
	beq _0805394E
	movs r1, #0x80
	lsls r1, r1, #6
	adds r0, r1, #0
	ldrh r2, [r4]
	orrs r0, r2
	strh r0, [r4]
_0805394E:
	movs r1, #0x80
	lsls r1, r1, #4
	adds r0, r1, #0
	mov r2, sb
	ldrh r2, [r2]
	ands r0, r2
	cmp r0, #0
	beq _080539CE
	movs r1, #0x80
	lsls r1, r1, #5
	adds r0, r1, #0
	ldrh r2, [r5]
	orrs r0, r2
	strh r0, [r5]
	b _080539CE
	.align 2, 0
_0805396C: .4byte 0x0203DFEC
_08053970: .4byte 0x0203E03A
_08053974:
	lsls r0, r7, #1
	bl GetEfxHp
	mov r2, sb
	movs r1, #3
	ldrsb r1, [r2, r1]
	subs r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	cmp r0, #0
	bge _0805398C
	movs r2, #0
_0805398C:
	adds r0, r7, #1
	lsls r0, r0, #0x10
	lsrs r7, r0, #0x10
	lsls r0, r7, #2
	ldr r1, _080539F8 @ =0x0203E03A
	adds r0, r0, r1
	strh r2, [r0]
	movs r0, #0x40
	mov r2, sb
	ldrh r2, [r2]
	ands r0, r2
	cmp r0, #0
	beq _080539B2
	movs r1, #0x80
	lsls r1, r1, #6
	adds r0, r1, #0
	ldrh r2, [r5]
	orrs r0, r2
	strh r0, [r5]
_080539B2:
	movs r5, #0x80
	lsls r5, r5, #4
	adds r0, r5, #0
	mov r1, sb
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	beq _080539CE
	movs r2, #0x80
	lsls r2, r2, #5
_080539C6:
	adds r0, r2, #0
	ldrh r5, [r4]
	orrs r0, r5
	strh r0, [r4]
_080539CE:
	movs r0, #4
	add sb, r0
	ldr r1, [sp, #0xc]
	adds r1, #1
	str r1, [sp, #0xc]
	mov r2, sb
	ldrb r1, [r2, #2]
_080539DC:
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	bne _080539E6
	b _080535CC
_080539E6:
	add sp, #0x20
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080539F8: .4byte 0x0203E03A

	thumb_func_start sub_080539FC
sub_080539FC: @ 0x080539FC
	ldr r1, _08053A0C @ =gBattleHitArray
	movs r0, #2
	ldrb r1, [r1, #2]
	ands r0, r1
	cmp r0, #0
	bne _08053A10
	movs r0, #0
	b _08053A12
	.align 2, 0
_08053A0C: .4byte gBattleHitArray
_08053A10:
	movs r0, #1
_08053A12:
	bx lr

	thumb_func_start sub_08053A14
sub_08053A14: @ 0x08053A14
	ldr r3, _08053A34 @ =0x030014D8
	ldr r2, [r0]
	ldr r1, [r0, #4]
	ldr r0, [r2, #0x28]
	ldr r1, [r1, #0x28]
	orrs r0, r1
	lsrs r0, r0, #8
	movs r1, #1
	ands r0, r1
	adds r2, #0x23
	adds r2, r2, r0
	ldrb r0, [r2]
	strh r0, [r3]
	subs r0, #1
	bx lr
	.align 2, 0
_08053A34: .4byte 0x030014D8

	thumb_func_start sub_08053A38
sub_08053A38: @ 0x08053A38
	push {lr}
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x8b
	bne _08053A78
	adds r0, r1, #0
	bl GetItemIndex
	cmp r0, #0x35
	beq _08053A68
	cmp r0, #0x35
	bgt _08053A5A
	cmp r0, #0x34
	beq _08053A60
	b _08053A78
_08053A5A:
	cmp r0, #0x36
	beq _08053A70
	b _08053A78
_08053A60:
	ldr r0, _08053A64 @ =0x081DFE98
	b _08053A7A
	.align 2, 0
_08053A64: .4byte 0x081DFE98
_08053A68:
	ldr r0, _08053A6C @ =0x081DFE78
	b _08053A7A
	.align 2, 0
_08053A6C: .4byte 0x081DFE78
_08053A70:
	ldr r0, _08053A74 @ =0x081DFEB8
	b _08053A7A
	.align 2, 0
_08053A74: .4byte 0x081DFEB8
_08053A78:
	movs r0, #0
_08053A7A:
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_08053A80
sub_08053A80: @ 0x08053A80
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r1, r0, #0
	cmp r0, #0x40
	beq _08053A9C
	cmp r0, #0x40
	ble _08053AA4
	cmp r1, #0x80
	beq _08053A98
	cmp r1, #0xc0
	beq _08053AA0
	b _08053AA4
_08053A98:
	movs r0, #1
	b _08053AA6
_08053A9C:
	movs r0, #2
	b _08053AA6
_08053AA0:
	movs r0, #3
	b _08053AA6
_08053AA4:
	movs r0, #0
_08053AA6:
	bx lr

	thumb_func_start sub_08053AA8
sub_08053AA8: @ 0x08053AA8
	push {r4, r5, lr}
	adds r5, r0, #0
	lsls r4, r1, #0x10
	lsrs r4, r4, #0x10
	bl GetAISSubjectId
	ldr r1, _08053AD0 @ =0x0203E066
	lsls r0, r0, #1
	adds r0, r0, r1
	strh r4, [r0]
	bl UpdateBanimFrame
	adds r0, r5, #0
	movs r1, #6
	bl SwitchAISFrameDataFromBARoundType
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08053AD0: .4byte 0x0203E066

	thumb_func_start GetBattleAnimRoundType
GetBattleAnimRoundType: @ 0x08053AD4
	ldr r1, _08053AF0 @ =0x0203E00E
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r2, [r0]
	movs r3, #0
	ldrsh r1, [r0, r3]
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	beq _08053AF8
	ldr r0, _08053AF4 @ =0x00000FFF
	ands r0, r2
	b _08053AFA
	.align 2, 0
_08053AF0: .4byte 0x0203E00E
_08053AF4: .4byte 0x00000FFF
_08053AF8:
	adds r0, r1, #0
_08053AFA:
	bx lr

	thumb_func_start GetBattleAnimRoundTypeFlags
GetBattleAnimRoundTypeFlags: @ 0x08053AFC
	ldr r1, _08053B1C @ =0x0203E00E
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r2, [r0]
	movs r3, #0
	ldrsh r1, [r0, r3]
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	beq _08053B24
	ldr r0, _08053B20 @ =0xFFFFF000
	ands r0, r2
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	b _08053B26
	.align 2, 0
_08053B1C: .4byte 0x0203E00E
_08053B20: .4byte 0xFFFFF000
_08053B24:
	movs r0, #0
_08053B26:
	bx lr

	thumb_func_start GetEfxHp
GetEfxHp: @ 0x08053B28
	ldr r1, _08053B38 @ =0x0203E03A
	lsls r0, r0, #1
	adds r0, r0, r1
	ldr r1, _08053B3C @ =0x00000FFF
	ldrh r0, [r0]
	ands r1, r0
	adds r0, r1, #0
	bx lr
	.align 2, 0
_08053B38: .4byte 0x0203E03A
_08053B3C: .4byte 0x00000FFF

	thumb_func_start sub_08053B40
sub_08053B40: @ 0x08053B40
	ldr r1, _08053B54 @ =0x0203E03A
	lsls r0, r0, #1
	adds r0, r0, r1
	ldr r1, _08053B58 @ =0xFFFFF000
	ldrh r0, [r0]
	ands r1, r0
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	adds r0, r1, #0
	bx lr
	.align 2, 0
_08053B54: .4byte 0x0203E03A
_08053B58: .4byte 0xFFFFF000

	thumb_func_start IsItemDisplayedInBattle
IsItemDisplayedInBattle: @ 0x08053B5C
	push {r4, r5, lr}
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	adds r5, r4, #0
	adds r0, r4, #0
	bl GetItemIndex
	cmp r0, #0x7c
	beq _08053B90
	adds r0, r4, #0
	bl GetItemIndex
	cmp r0, #0x7d
	beq _08053B90
	adds r0, r4, #0
	bl GetItemIndex
	cmp r0, #0x7e
	beq _08053B90
	adds r0, r5, #0
	bl GetItemIndex
	cmp r0, #0x7f
	beq _08053B90
	movs r0, #0
	b _08053B92
_08053B90:
	movs r0, #1
_08053B92:
	pop {r4, r5}
	pop {r1}
	bx r1

	thumb_func_start sub_08053B98
sub_08053B98: @ 0x08053B98
	push {r4, r5, lr}
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	adds r5, r4, #0
	adds r0, r4, #0
	bl GetItemIndex
	cmp r0, #0x84
	beq _08053BCC
	adds r0, r4, #0
	bl GetItemIndex
	cmp r0, #0x85
	beq _08053BCC
	adds r0, r4, #0
	bl GetItemIndex
	cmp r0, #0x86
	beq _08053BCC
	adds r0, r5, #0
	bl GetItemIndex
	cmp r0, #0x3c
	beq _08053BCC
	movs r0, #0
	b _08053BCE
_08053BCC:
	movs r0, #1
_08053BCE:
	pop {r4, r5}
	pop {r1}
	bx r1

	thumb_func_start sub_08053BD4
sub_08053BD4: @ 0x08053BD4
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	cmp r2, #0x13
	bgt _08053C0C
	ldr r1, _08053C00 @ =0x0203E00E
	lsls r0, r2, #1
	adds r0, r0, r1
_08053BE2:
	movs r3, #0
	ldrsh r1, [r0, r3]
	cmp r1, #0
	beq _08053BFA
	cmp r1, #1
	beq _08053BFA
	cmp r1, #2
	beq _08053BFA
	cmp r1, #3
	beq _08053BFA
	cmp r1, #9
	bne _08053C04
_08053BFA:
	movs r0, #1
	b _08053C0E
	.align 2, 0
_08053C00: .4byte 0x0203E00E
_08053C04:
	adds r0, #4
	adds r2, #2
	cmp r2, #0x13
	ble _08053BE2
_08053C0C:
	movs r0, #0
_08053C0E:
	bx lr

	thumb_func_start sub_08053C10
sub_08053C10: @ 0x08053C10
	ldr r1, _08053C18 @ =0x0203E0C4
	movs r0, #1
	str r0, [r1]
	bx lr
	.align 2, 0
_08053C18: .4byte 0x0203E0C4

	thumb_func_start sub_08053C1C
sub_08053C1C: @ 0x08053C1C
	ldr r1, _08053C24 @ =0x0203E0C4
	movs r0, #0
	str r0, [r1]
	bx lr
	.align 2, 0
_08053C24: .4byte 0x0203E0C4

	thumb_func_start sub_08053C28
sub_08053C28: @ 0x08053C28
	ldr r0, _08053C34 @ =0x0203E0C4
	ldr r0, [r0]
	cmp r0, #0
	beq _08053C38
	movs r0, #1
	b _08053C3A
	.align 2, 0
_08053C34: .4byte 0x0203E0C4
_08053C38:
	movs r0, #0
_08053C3A:
	bx lr
