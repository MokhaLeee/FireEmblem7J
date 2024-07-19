	.include "macro.inc"

	.syntax unified

	thumb_func_start EventEA_StartMixPalette
EventEA_StartMixPalette: @ 0x08012378
	push {r4, r5, r6, r7, lr}
	sub sp, #8
	adds r5, r0, #0
	ldr r0, [r5, #0x30]
	ldr r6, [r0, #4]
	ldr r7, [r0, #8]
	ldr r4, [r0, #0xc]
	adds r1, r5, #0
	adds r1, #0x5e
	movs r0, #4
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	beq _08012398
	movs r0, #0
	b _080123B2
_08012398:
	movs r1, #0xff
	adds r2, r4, #0
	ands r2, r1
	asrs r3, r4, #0x10
	ands r3, r1
	asrs r0, r4, #0x18
	ands r0, r1
	str r0, [sp]
	str r5, [sp, #4]
	adds r0, r6, #0
	adds r1, r7, #0
	bl StartMixPalette
_080123B2:
	add sp, #8
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start EventEB_EndMixPalette
EventEB_EndMixPalette: @ 0x080123BC
	push {lr}
	bl EndMixPalette
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_80123C8
sub_80123C8: @ 0x080123C8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	adds r6, r0, #0
	mov r8, r1
	mov sb, r2
	mov sl, r3
	ldr r7, [sp, #0x24]
	ldr r5, [sp, #0x2c]
	movs r0, #0
	str r0, [sp]
	ldr r4, _08012438 @ =0x030040F0
	ldr r2, _0801243C @ =0x01000004
	mov r0, sp
	adds r1, r4, #0
	bl CpuFastSet
	movs r0, #3
	ands r5, r0
	lsls r5, r5, #1
	movs r0, #7
	rsbs r0, r0, #0
	ldrb r1, [r4, #3]
	ands r0, r1
	orrs r0, r5
	movs r1, #7
	ands r0, r1
	movs r1, #8
	orrs r0, r1
	strb r0, [r4, #3]
	strb r6, [r4]
	mov r0, r8
	strb r0, [r4, #1]
	mov r1, sb
	strb r1, [r4, #4]
	mov r0, sl
	strb r0, [r4, #5]
	strb r7, [r4, #6]
	add r1, sp, #0x28
	ldrb r1, [r1]
	strb r1, [r4, #7]
	adds r0, r4, #0
	ldr r1, [sp, #0x30]
	bl sub_800A614
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08012438: .4byte 0x030040F0
_0801243C: .4byte 0x01000004

	thumb_func_start sub_8012440
sub_8012440: @ 0x08012440
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r4, r0, #0
	adds r6, r1, #0
	movs r0, #0
	str r0, [sp]
	ldr r5, _08012490 @ =0x030040F0
	ldr r2, _08012494 @ =0x01000004
	mov r0, sp
	adds r1, r5, #0
	bl CpuFastSet
	ldrb r2, [r4, #3]
	movs r1, #6
	ands r1, r2
	movs r0, #7
	rsbs r0, r0, #0
	ldrb r3, [r5, #3]
	ands r0, r3
	orrs r0, r1
	lsrs r2, r2, #3
	lsls r2, r2, #3
	movs r1, #7
	ands r0, r1
	orrs r0, r2
	strb r0, [r5, #3]
	ldrb r0, [r4]
	strb r0, [r5]
	ldrb r0, [r4, #1]
	strb r0, [r5, #1]
	cmp r6, #0
	beq _08012498
	ldrb r0, [r4, #4]
	strb r0, [r5, #4]
	ldrb r0, [r4, #5]
	strb r0, [r5, #5]
	ldrb r1, [r4, #6]
	ldrb r2, [r4, #7]
	b _080124A2
	.align 2, 0
_08012490: .4byte 0x030040F0
_08012494: .4byte 0x01000004
_08012498:
	ldrb r1, [r4, #6]
	strb r1, [r5, #4]
	ldrb r0, [r4, #7]
	strb r0, [r5, #5]
	adds r2, r0, #0
_080124A2:
	ldr r0, _080124B8 @ =0x030040F0
	strb r1, [r0, #6]
	strb r2, [r0, #7]
	adds r1, r6, #0
	bl sub_800A614
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080124B8: .4byte 0x030040F0

	thumb_func_start sub_80124BC
sub_80124BC: @ 0x080124BC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x10
	adds r7, r0, #0
	ldr r1, [r7, #0x54]
	ldrb r0, [r1]
	cmp r0, #0
	bne _080124DA
	adds r0, r7, #0
	bl Proc_End
	b _08012582
_080124DA:
	ldrb r4, [r1, #6]
	str r4, [r7, #0x2c]
	ldrb r3, [r1, #7]
	str r3, [r7, #0x30]
	ldr r6, _08012594 @ =gBmMapUnit
	ldr r1, [r6]
	lsls r0, r3, #2
	adds r0, r0, r1
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r0, [r0]
	cmp r0, #0
	beq _08012578
	movs r0, #0xff
	mov sb, r0
	movs r1, #1
	rsbs r1, r1, #0
	mov sl, r1
	mov r2, sl
	str r2, [sp]
	ldr r2, _08012598 @ =gUnk_08C52B94
	adds r0, r4, #0
	adds r1, r3, #0
	bl GenerateExtendedMovementMap
	movs r5, #0
	ldr r0, _0801259C @ =gBmMapSize
	movs r3, #2
	ldrsh r1, [r0, r3]
	cmp r5, r1
	bge _08012570
	movs r3, #0
	ldrsh r2, [r0, r3]
	str r2, [sp, #8]
	str r1, [sp, #4]
_08012520:
	movs r3, #0
	adds r6, r5, #1
	mov ip, r6
	ldr r0, [sp, #8]
	cmp r3, r0
	bge _08012568
	ldr r1, _080125A0 @ =gBmMapMovement
	ldr r0, [r1]
	lsls r1, r5, #2
	adds r0, r1, r0
	ldr r0, [r0]
	str r0, [sp, #0xc]
	ldr r2, _0801259C @ =gBmMapSize
	movs r6, #0
	ldrsh r4, [r2, r6]
	ldr r0, _08012594 @ =gBmMapUnit
	mov r8, r0
_08012542:
	ldr r2, [sp, #0xc]
	adds r0, r2, r3
	ldrb r2, [r0]
	cmp sb, r2
	ble _08012562
	mov r6, r8
	ldr r0, [r6]
	adds r0, r1, r0
	ldr r0, [r0]
	adds r0, r0, r3
	ldrb r0, [r0]
	cmp r0, #0
	bne _08012562
	mov sb, r2
	str r3, [sp]
	mov sl, r5
_08012562:
	adds r3, #1
	cmp r3, r4
	blt _08012542
_08012568:
	mov r5, ip
	ldr r0, [sp, #4]
	cmp r5, r0
	blt _08012520
_08012570:
	ldr r1, [sp]
	str r1, [r7, #0x2c]
	mov r2, sl
	str r2, [r7, #0x30]
_08012578:
	ldr r1, [r7, #0x2c]
	ldr r2, [r7, #0x30]
	adds r0, r7, #0
	bl EnsureCameraOntoPosition
_08012582:
	add sp, #0x10
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08012594: .4byte gBmMapUnit
_08012598: .4byte gUnk_08C52B94
_0801259C: .4byte gBmMapSize
_080125A0: .4byte gBmMapMovement

	thumb_func_start sub_80125A4
sub_80125A4: @ 0x080125A4
	push {r4, r5, r6, lr}
	sub sp, #0x14
	adds r4, r0, #0
	ldr r5, [r4, #0x54]
	ldr r1, [r4, #0x2c]
	ldr r2, [r4, #0x30]
	movs r0, #1
	str r0, [sp]
	adds r0, r4, #0
	movs r3, #1
	bl StartEventWarpAnim
	add r1, sp, #4
	adds r0, r5, #0
	ldm r0!, {r2, r3, r6}
	stm r1!, {r2, r3, r6}
	ldr r0, [r0]
	str r0, [r1]
	add r2, sp, #4
	adds r1, r2, #0
	ldr r0, [r4, #0x2c]
	strb r0, [r1, #6]
	strb r0, [r2, #4]
	ldr r0, [r4, #0x30]
	strb r0, [r1, #7]
	strb r0, [r2, #5]
	adds r0, r1, #0
	bl LoadUnit
	adds r5, #0x10
	str r5, [r4, #0x54]
	add sp, #0x14
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_80125EC
sub_80125EC: @ 0x080125EC
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08012638 @ =0x0202E3F0
	ldr r0, [r0]
	movs r1, #0
	bl BmMapFillg
	ldr r0, _0801263C @ =ProcScr_Event_08C0169C
	adds r1, r4, #0
	bl Proc_StartBlocking
	adds r2, r0, #0
	ldr r0, [r4, #0x30]
	ldr r0, [r0, #4]
	str r0, [r2, #0x54]
	movs r3, #0
	adds r0, r4, #0
	adds r0, #0x4d
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne _08012628
	adds r1, r4, #0
	adds r1, #0x5e
	movs r0, #4
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	beq _0801262A
_08012628:
	movs r3, #1
_0801262A:
	adds r0, r2, #0
	adds r0, #0x64
	strh r3, [r0]
	movs r0, #2
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08012638: .4byte 0x0202E3F0
_0801263C: .4byte ProcScr_Event_08C0169C
