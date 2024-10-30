	.include "macro.inc"
	.syntax unified

	thumb_func_start TitleFlame_Loop
TitleFlame_Loop: @ 0x080BB7FC
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r5, r0, #0
	adds r4, r5, #0
	adds r4, #0x66
	ldrh r1, [r4]
	lsls r0, r1, #0x10
	asrs r0, r0, #0x11
	cmp r0, #0x10
	bgt _080BB86E
	adds r0, r1, #1
	strh r0, [r4]
	lsls r2, r0, #0x10
	asrs r0, r2, #0x10
	cmp r0, #0x10
	bgt _080BB83E
	asrs r0, r2, #0x13
	movs r3, #8
	rsbs r3, r3, #0
	adds r1, r3, #0
	subs r1, r1, r0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	asrs r0, r2, #0x12
	movs r6, #0x30
	rsbs r6, r6, #0
	adds r2, r6, #0
	subs r2, r2, r0
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	movs r0, #1
	bl SetBgOffset
_080BB83E:
	ldr r3, _080BB8C4 @ =gDispIo
	adds r2, r3, #0
	adds r2, #0x3c
	movs r0, #0x3f
	ldrb r7, [r2]
	ands r0, r7
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r2]
	ldrh r4, [r4]
	lsls r1, r4, #0x10
	asrs r2, r1, #0x11
	adds r0, r3, #0
	adds r0, #0x44
	strb r2, [r0]
	asrs r1, r1, #0x12
	movs r0, #0x10
	subs r0, r0, r1
	adds r1, r3, #0
	adds r1, #0x45
	strb r0, [r1]
	adds r1, #1
	movs r0, #0
	strb r0, [r1]
_080BB86E:
	movs r0, #1
	movs r1, #0
	bl GetScanlineBuf
	adds r5, #0x64
	movs r2, #0
	ldrsh r1, [r5, r2]
	ldr r4, _080BB8C8 @ =gTitleSt
	movs r3, #4
	ldrsh r2, [r4, r3]
	movs r6, #0
	ldrsh r3, [r4, r6]
	movs r6, #0
	str r6, [sp]
	bl sub_8077794
	movs r0, #1
	movs r1, #0xa0
	bl GetScanlineBuf
	movs r7, #0
	ldrsh r1, [r5, r7]
	movs r3, #0xc
	ldrsh r2, [r4, r3]
	movs r7, #8
	ldrsh r3, [r4, r7]
	str r6, [sp]
	bl sub_8077794
	bl SwapScanlineBufs
	ldrh r2, [r4, #0x10]
	movs r0, #0
	movs r1, #0
	bl SetBgOffset
	ldrh r0, [r5]
	adds r0, #1
	strh r0, [r5]
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080BB8C4: .4byte gDispIo
_080BB8C8: .4byte gTitleSt

	thumb_func_start sub_80BB8CC
sub_80BB8CC: @ 0x080BB8CC
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r0, #0x4c
	ldrb r0, [r0]
	cmp r0, #0
	beq _080BB928
	ldr r3, _080BB934 @ =gDispIo
	adds r2, r3, #0
	adds r2, #0x3c
	movs r0, #0x3f
	ldrb r1, [r2]
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r2]
	adds r0, r3, #0
	adds r0, #0x44
	movs r1, #0
	strb r1, [r0]
	movs r5, #0x45
	movs r0, #0x10
	strb r0, [r5, r3]
	adds r0, r3, #0
	adds r0, #0x46
	strb r1, [r0]
	ldr r0, _080BB938 @ =0x0000FFE0
	ldrh r1, [r3, #0x3c]
	ands r0, r1
	ldr r1, _080BB93C @ =0x0000E0FF
	ands r0, r1
	movs r5, #0xf8
	lsls r5, r5, #5
	adds r1, r5, #0
	orrs r0, r1
	strh r0, [r3, #0x3c]
	movs r0, #0x21
	rsbs r0, r0, #0
	ldrb r1, [r2]
	ands r0, r1
	strb r0, [r2]
	adds r1, r3, #0
	adds r1, #0x3d
	movs r0, #0x20
	ldrb r2, [r1]
	orrs r0, r2
	strb r0, [r1]
_080BB928:
	movs r0, #0
	str r0, [r4, #0x30]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080BB934: .4byte gDispIo
_080BB938: .4byte 0x0000FFE0
_080BB93C: .4byte 0x0000E0FF

	thumb_func_start sub_80BB940
sub_80BB940: @ 0x080BB940
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	adds r5, r0, #0
	ldr r0, [r5, #0x30]
	adds r0, #1
	str r0, [r5, #0x30]
	ldr r1, [r5, #0x48]
	cmp r1, #0
	beq _080BB95C
	adds r0, r5, #0
	bl _call_via_r1
_080BB95C:
	ldr r6, [r5, #0x30]
	ldr r7, [r5, #0x34]
	cmp r6, r7
	blt _080BB97A
	adds r0, r5, #0
	bl Proc_Break
	ldr r0, [r5, #0x2c]
	ldr r1, [r5, #0x40]
	ldr r2, [r5, #0x44]
	movs r3, #1
	rsbs r3, r3, #0
	bl SetSpriteAnimProcParameters
	b _080BBA56
_080BB97A:
	subs r4, r7, r6
	ldr r0, [r5, #0x38]
	muls r0, r4, r0
	ldr r1, [r5, #0x40]
	muls r1, r6, r1
	adds r0, r0, r1
	adds r1, r7, #0
	bl __divsi3
	mov sb, r0
	ldr r0, _080BB9D0 @ =0x000001FF
	mov r1, sb
	ands r1, r0
	mov sb, r1
	ldr r0, [r5, #0x3c]
	muls r0, r4, r0
	ldr r1, [r5, #0x44]
	muls r1, r6, r1
	adds r0, r0, r1
	adds r1, r7, #0
	bl __divsi3
	mov r8, r0
	movs r0, #0xff
	mov r1, r8
	ands r1, r0
	mov r8, r1
	lsls r0, r6, #4
	adds r1, r7, #0
	bl __divsi3
	adds r4, r0, #0
	adds r0, r5, #0
	adds r0, #0x4c
	ldrb r0, [r0]
	cmp r0, #1
	beq _080BB9DA
	cmp r0, #1
	bgt _080BB9D4
	cmp r0, #0
	beq _080BBA48
	b _080BBA56
	.align 2, 0
_080BB9D0: .4byte 0x000001FF
_080BB9D4:
	cmp r0, #2
	beq _080BBA08
	b _080BBA56
_080BB9DA:
	ldr r3, _080BBA04 @ =gDispIo
	adds r2, r3, #0
	adds r2, #0x3c
	movs r0, #0x3f
	ldrb r1, [r2]
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r2]
	adds r0, r3, #0
	adds r0, #0x44
	movs r1, #0
	strb r4, [r0]
	movs r0, #0x10
	subs r0, r0, r4
	adds r2, #9
	strb r0, [r2]
	adds r0, r3, #0
	adds r0, #0x46
	strb r1, [r0]
	b _080BBA30
	.align 2, 0
_080BBA04: .4byte gDispIo
_080BBA08:
	ldr r3, _080BBA44 @ =gDispIo
	adds r2, r3, #0
	adds r2, #0x3c
	movs r0, #0x3f
	ldrb r1, [r2]
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r2]
	movs r0, #0x10
	subs r0, r0, r4
	adds r1, r3, #0
	adds r1, #0x44
	movs r2, #0
	strb r0, [r1]
	adds r0, r3, #0
	adds r0, #0x45
	strb r4, [r0]
	adds r0, #1
	strb r2, [r0]
_080BBA30:
	ldr r0, [r5, #0x2c]
	movs r2, #0x80
	lsls r2, r2, #3
	add r2, r8
	movs r3, #1
	rsbs r3, r3, #0
	mov r1, sb
	bl SetSpriteAnimProcParameters
	b _080BBA56
	.align 2, 0
_080BBA44: .4byte gDispIo
_080BBA48:
	ldr r0, [r5, #0x2c]
	movs r3, #1
	rsbs r3, r3, #0
	mov r1, sb
	mov r2, r8
	bl SetSpriteAnimProcParameters
_080BBA56:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start SetTitleScreenAnimParamSync
SetTitleScreenAnimParamSync: @ 0x080BBA64
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r6, r2, #0
	mov r8, r3
	ldr r7, [sp, #0x18]
	ldr r1, [sp, #0x20]
	ldr r0, _080BBAA0 @ =ProcScr_TitleAnimSpriteCtrl
	bl Proc_Start
	str r4, [r0, #0x2c]
	str r5, [r0, #0x38]
	str r6, [r0, #0x3c]
	mov r1, r8
	str r1, [r0, #0x40]
	str r7, [r0, #0x44]
	ldr r1, [sp, #0x1c]
	str r1, [r0, #0x34]
	movs r1, #0
	str r1, [r0, #0x48]
	adds r0, #0x4c
	movs r1, #1
	strb r1, [r0]
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080BBAA0: .4byte ProcScr_TitleAnimSpriteCtrl

	thumb_func_start sub_80BBAA4
sub_80BBAA4: @ 0x080BBAA4
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	adds r5, r0, #0
	adds r6, r1, #0
	mov r8, r2
	mov sb, r3
	ldr r7, [sp, #0x1c]
	ldr r4, [sp, #0x24]
	ldr r1, [sp, #0x28]
	ldr r0, _080BBAE8 @ =ProcScr_TitleAnimSpriteCtrl
	bl Proc_Start
	str r5, [r0, #0x2c]
	str r6, [r0, #0x38]
	mov r1, r8
	str r1, [r0, #0x3c]
	mov r1, sb
	str r1, [r0, #0x40]
	str r7, [r0, #0x44]
	str r4, [r0, #0x48]
	ldr r1, [sp, #0x20]
	str r1, [r0, #0x34]
	adds r0, #0x4c
	movs r1, #0
	strb r1, [r0]
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080BBAE8: .4byte ProcScr_TitleAnimSpriteCtrl

