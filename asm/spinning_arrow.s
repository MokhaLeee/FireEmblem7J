	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_80A9A1C
sub_80A9A1C: @ 0x080A9A1C
	movs r1, #0
	str r1, [r0, #0x2c]
	adds r2, r0, #0
	adds r2, #0x54
	strh r1, [r2]
	str r1, [r0, #0x4c]
	str r1, [r0, #0x44]
	str r1, [r0, #0x3c]
	str r1, [r0, #0x34]
	str r1, [r0, #0x50]
	str r1, [r0, #0x48]
	str r1, [r0, #0x40]
	str r1, [r0, #0x38]
	str r1, [r0, #0x30]
	bx lr
	.align 2, 0

	thumb_func_start sub_80A9A3C
sub_80A9A3C: @ 0x080A9A3C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	adds r5, r0, #0
	ldr r7, [r5, #0x34]
	ldr r0, [r5, #0x3c]
	mov r8, r0
	ldr r1, [r5, #0x38]
	mov sb, r1
	ldr r2, [r5, #0x40]
	mov sl, r2
	ldr r0, [r5, #0x44]
	adds r0, #1
	str r0, [r5, #0x44]
	ldr r0, [r5, #0x48]
	adds r0, #1
	str r0, [r5, #0x48]
	movs r6, #0
_080A9A66:
	lsls r3, r6, #2
	adds r0, r5, #0
	adds r0, #0x4c
	adds r2, r0, r3
	ldr r0, [r2]
	adds r4, r5, #0
	adds r4, #0x44
	cmp r0, #0
	beq _080A9A86
	adds r0, r4, r3
	ldr r1, [r0]
	adds r1, #3
	str r1, [r0]
	ldr r0, [r2]
	adds r0, #1
	str r0, [r2]
_080A9A86:
	adds r1, r4, r3
	ldr r0, [r1]
	asrs r0, r0, #3
	cmp r0, #5
	ble _080A9A94
	movs r0, #0
	str r0, [r1]
_080A9A94:
	adds r6, #1
	cmp r6, #1
	ble _080A9A66
	ldr r3, [r5, #0x2c]
	cmp r3, #0
	bne _080A9B28
	ldr r2, [r5, #0x4c]
	cmp r2, #0
	beq _080A9AB4
	asrs r2, r2, #3
	subs r1, r2, #4
	ldr r0, [r5, #0x34]
	adds r7, r0, r1
	cmp r2, #4
	bne _080A9AB4
	str r3, [r5, #0x4c]
_080A9AB4:
	ldr r2, [r5, #0x50]
	cmp r2, #0
	beq _080A9ACC
	asrs r2, r2, #3
	subs r1, r2, #4
	ldr r0, [r5, #0x38]
	subs r0, r0, r1
	mov sb, r0
	cmp r2, #4
	bne _080A9ACC
	movs r0, #0
	str r0, [r5, #0x50]
_080A9ACC:
	ldr r0, [r5, #0x30]
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _080A9AF6
	ldr r1, _080A9BDC @ =0x000001FF
	ands r1, r7
	movs r2, #0xff
	mov r0, r8
	ands r2, r0
	ldr r3, _080A9BE0 @ =gUnk_08DAE214
	adds r4, r5, #0
	adds r4, #0x54
	ldr r0, [r5, #0x44]
	asrs r0, r0, #3
	ldrh r4, [r4]
	adds r0, r4, r0
	str r0, [sp]
	movs r0, #0xd
	bl PutSpriteExt
_080A9AF6:
	ldr r0, [r5, #0x30]
	movs r1, #2
	ands r0, r1
	cmp r0, #0
	beq _080A9B28
	ldr r1, _080A9BDC @ =0x000001FF
	mov r2, sb
	ands r1, r2
	movs r0, #0x80
	lsls r0, r0, #5
	adds r1, r1, r0
	movs r2, #0xff
	mov r0, sl
	ands r2, r0
	ldr r3, _080A9BE0 @ =gUnk_08DAE214
	adds r4, r5, #0
	adds r4, #0x54
	ldr r0, [r5, #0x48]
	asrs r0, r0, #3
	ldrh r4, [r4]
	adds r0, r4, r0
	str r0, [sp]
	movs r0, #0xd
	bl PutSpriteExt
_080A9B28:
	ldr r0, [r5, #0x2c]
	cmp r0, #1
	bne _080A9BCA
	ldr r2, [r5, #0x4c]
	cmp r2, #0
	beq _080A9B46
	asrs r2, r2, #3
	subs r1, r2, #4
	ldr r0, [r5, #0x3c]
	adds r0, r0, r1
	mov r8, r0
	cmp r2, #4
	bne _080A9B46
	movs r0, #0
	str r0, [r5, #0x4c]
_080A9B46:
	ldr r2, [r5, #0x50]
	cmp r2, #0
	beq _080A9B5E
	asrs r2, r2, #3
	subs r1, r2, #4
	ldr r0, [r5, #0x40]
	subs r0, r0, r1
	mov sl, r0
	cmp r2, #4
	bne _080A9B5E
	movs r0, #0
	str r0, [r5, #0x50]
_080A9B5E:
	ldr r0, [r5, #0x30]
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _080A9B90
	ldr r0, _080A9BDC @ =0x000001FF
	ands r7, r0
	movs r0, #0xff
	mov r1, r8
	ands r1, r0
	mov r8, r1
	ldr r3, _080A9BE4 @ =gUnk_08DAE222
	adds r1, r5, #0
	adds r1, #0x54
	ldr r0, [r5, #0x44]
	asrs r0, r0, #3
	lsls r0, r0, #1
	ldrh r1, [r1]
	adds r0, r1, r0
	str r0, [sp]
	movs r0, #0xd
	adds r1, r7, #0
	mov r2, r8
	bl PutSpriteExt
_080A9B90:
	ldr r0, [r5, #0x30]
	movs r1, #2
	ands r0, r1
	cmp r0, #0
	beq _080A9BCA
	ldr r0, _080A9BDC @ =0x000001FF
	mov r2, sb
	ands r2, r0
	mov sb, r2
	movs r1, #0x80
	lsls r1, r1, #6
	add r1, sb
	movs r0, #0xff
	mov r2, sl
	ands r2, r0
	mov sl, r2
	ldr r3, _080A9BE4 @ =gUnk_08DAE222
	adds r2, r5, #0
	adds r2, #0x54
	ldr r0, [r5, #0x48]
	asrs r0, r0, #3
	lsls r0, r0, #1
	ldrh r2, [r2]
	adds r0, r2, r0
	str r0, [sp]
	movs r0, #0xd
	mov r2, sl
	bl PutSpriteExt
_080A9BCA:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A9BDC: .4byte 0x000001FF
_080A9BE0: .4byte gUnk_08DAE214
_080A9BE4: .4byte gUnk_08DAE222

	thumb_func_start StartUiSpinningArrows
StartUiSpinningArrows: @ 0x080A9BE8
	push {lr}
	adds r1, r0, #0
	ldr r0, _080A9BF8 @ =gUnk_08DAE22C
	bl Proc_Start
	pop {r1}
	bx r1
	.align 2, 0
_080A9BF8: .4byte gUnk_08DAE22C

	thumb_func_start LoadUiSpinningArrowGfx
LoadUiSpinningArrowGfx: @ 0x080A9BFC
	push {r4, r5, r6, r7, lr}
	adds r6, r0, #0
	adds r4, r1, #0
	adds r7, r2, #0
	ldr r0, _080A9C54 @ =gUnk_08DAE22C
	bl Proc_Find
	adds r5, r0, #0
	cmp r5, #0
	beq _080A9C4C
	ldr r0, _080A9C58 @ =gUnk_08428A40
	adds r1, r7, #0
	adds r1, #0x10
	lsls r1, r1, #5
	movs r2, #0x20
	bl ApplyPaletteExt
	cmp r6, #0
	bne _080A9C2C
	ldr r0, _080A9C5C @ =gUnk_08427A48
	ldr r2, _080A9C60 @ =0x06010000
	adds r1, r4, r2
	bl Decompress
_080A9C2C:
	cmp r6, #1
	bne _080A9C3A
	ldr r0, _080A9C64 @ =gUnk_08427974
	ldr r2, _080A9C60 @ =0x06010000
	adds r1, r4, r2
	bl Decompress
_080A9C3A:
	asrs r0, r4, #5
	movs r1, #0xf
	ands r1, r7
	lsls r1, r1, #0xc
	adds r0, r0, r1
	adds r1, r5, #0
	adds r1, #0x54
	strh r0, [r1]
	str r6, [r5, #0x2c]
_080A9C4C:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_080A9C54: .4byte gUnk_08DAE22C
_080A9C58: .4byte gUnk_08428A40
_080A9C5C: .4byte gUnk_08427A48
_080A9C60: .4byte 0x06010000
_080A9C64: .4byte gUnk_08427974

	thumb_func_start SetUiSpinningArrowConfig
SetUiSpinningArrowConfig: @ 0x080A9C68
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _080A9C80 @ =gUnk_08DAE22C
	bl Proc_Find
	cmp r0, #0
	beq _080A9C78
	str r4, [r0, #0x30]
_080A9C78:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A9C80: .4byte gUnk_08DAE22C

	thumb_func_start SetUiSpinningArrowPositions
SetUiSpinningArrowPositions: @ 0x080A9C84
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r6, r2, #0
	adds r7, r3, #0
	ldr r0, _080A9CA8 @ =gUnk_08DAE22C
	bl Proc_Find
	cmp r0, #0
	beq _080A9CA0
	str r4, [r0, #0x34]
	str r5, [r0, #0x3c]
	str r6, [r0, #0x38]
	str r7, [r0, #0x40]
_080A9CA0:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A9CA8: .4byte gUnk_08DAE22C

	thumb_func_start SetUiSpinningArrowFastMaybe
SetUiSpinningArrowFastMaybe: @ 0x080A9CAC
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _080A9CE0 @ =gUnk_08DAE22C
	bl Proc_Find
	adds r1, r0, #0
	cmp r1, #0
	beq _080A9CDA
	cmp r4, #0
	bne _080A9CC4
	movs r0, #1
	str r0, [r1, #0x4c]
_080A9CC4:
	cmp r4, #1
	bne _080A9CCA
	str r4, [r1, #0x50]
_080A9CCA:
	cmp r4, #2
	bne _080A9CD2
	movs r0, #1
	str r0, [r1, #0x4c]
_080A9CD2:
	cmp r4, #3
	bne _080A9CDA
	movs r0, #1
	str r0, [r1, #0x50]
_080A9CDA:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A9CE0: .4byte gUnk_08DAE22C

	thumb_func_start sub_80A9CE4
sub_80A9CE4: @ 0x080A9CE4
	push {lr}
	ldr r0, _080A9CF4 @ =gUnk_08DAE22C
	bl Proc_Find
	bl Proc_End
	pop {r0}
	bx r0
	.align 2, 0
_080A9CF4: .4byte gUnk_08DAE22C
