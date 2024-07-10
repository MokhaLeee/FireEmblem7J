	.include "macro.inc"
	.syntax unified

    .section .data
	.global ProcScr_NinianTransformToHunman
ProcScr_NinianTransformToHunman:	@ 0x08C03018
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_LABEL
        .short 0xb, 0x0
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_8021820
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80218F8
        @ PROC_GOTO
        .short 0xc, 0x0
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word ClearUi
        @ PROC_LABEL
        .short 0xb, 0x63
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_8021954
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0

    .section .text

	thumb_func_start sub_80217EC
sub_80217EC: @ 0x080217EC
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	adds r6, r2, #0
	movs r2, #0
	lsls r5, r1, #2
_080217F6:
	lsls r0, r2, #5
	adds r4, r2, #1
	movs r1, #3
	adds r0, r0, r5
	adds r0, r0, r6
	adds r3, r0, #3
	lsls r0, r2, #6
	adds r0, r0, r7
	adds r0, #6
_08021808:
	strh r3, [r0]
	subs r3, #1
	subs r0, #2
	subs r1, #1
	cmp r1, #0
	bge _08021808
	adds r2, r4, #0
	cmp r2, #3
	ble _080217F6
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_8021820
sub_8021820: @ 0x08021820
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r6, r0, #0
	adds r7, r6, #0
	adds r7, #0x4a
	ldrh r0, [r7]
	cmp r0, #6
	bne _0802183C
	adds r0, r6, #0
	movs r1, #0x63
	bl Proc_Goto
	b _080218D8
_0802183C:
	bl ClearUi
	ldr r0, [r6, #0x30]
	lsls r0, r0, #5
	ldr r1, [r6, #0x2c]
	adds r0, r0, r1
	lsls r0, r0, #1
	ldr r1, _080218E4 @ =gBg0Tm
	adds r0, r0, r1
	movs r2, #0
	ldrsh r1, [r7, r2]
	movs r4, #0xa2
	lsls r4, r4, #7
	adds r2, r4, #0
	bl sub_80217EC
	ldr r0, [r6, #0x30]
	lsls r0, r0, #5
	ldr r1, [r6, #0x2c]
	adds r0, r0, r1
	lsls r0, r0, #1
	ldr r1, _080218E8 @ =gBg1Tm
	adds r0, r0, r1
	ldrh r1, [r7]
	adds r1, #1
	movs r5, #0
	movs r2, #0
	mov r8, r2
	strh r1, [r7]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	adds r2, r4, #0
	bl sub_80217EC
	ldr r3, _080218EC @ =gDispIo
	movs r0, #0x21
	rsbs r0, r0, #0
	ldrb r1, [r3, #1]
	ands r0, r1
	movs r1, #0x41
	rsbs r1, r1, #0
	ands r0, r1
	movs r1, #0x7f
	ands r0, r1
	strb r0, [r3, #1]
	adds r2, r3, #0
	adds r2, #0x3c
	movs r0, #0x3f
	ldrb r1, [r2]
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r2]
	adds r1, r3, #0
	adds r1, #0x44
	movs r0, #0x10
	strb r0, [r1]
	adds r0, r3, #0
	adds r0, #0x45
	strb r5, [r0]
	adds r0, #1
	strb r5, [r0]
	ldr r0, _080218F0 @ =0x0000FFE0
	ldrh r2, [r3, #0x3c]
	ands r0, r2
	movs r1, #1
	orrs r0, r1
	ldr r1, _080218F4 @ =0x0000E0FF
	ands r0, r1
	movs r2, #0xf0
	lsls r2, r2, #5
	adds r1, r2, #0
	orrs r0, r1
	strh r0, [r3, #0x3c]
	adds r0, r6, #0
	adds r0, #0x4c
	mov r1, r8
	strh r1, [r0]
_080218D8:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080218E4: .4byte gBg0Tm
_080218E8: .4byte gBg1Tm
_080218EC: .4byte gDispIo
_080218F0: .4byte 0x0000FFE0
_080218F4: .4byte 0x0000E0FF

	thumb_func_start sub_80218F8
sub_80218F8: @ 0x080218F8
	push {r4, r5, lr}
	adds r5, r0, #0
	bl GetGameTime
	adds r4, r0, #0
	movs r0, #1
	ands r4, r0
	cmp r4, #0
	bne _08021948
	ldr r0, _08021950 @ =gDispIo
	mov ip, r0
	mov r2, ip
	adds r2, #0x3c
	movs r0, #0x3f
	ldrb r1, [r2]
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r2]
	adds r3, r5, #0
	adds r3, #0x4c
	ldrh r1, [r3]
	movs r0, #0x10
	subs r0, r0, r1
	adds r2, #8
	strb r0, [r2]
	mov r0, ip
	adds r0, #0x45
	strb r1, [r0]
	adds r0, #1
	strb r4, [r0]
	adds r1, #1
	strh r1, [r3]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	cmp r1, #0x10
	ble _08021948
	adds r0, r5, #0
	bl Proc_Break
_08021948:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08021950: .4byte gDispIo

	thumb_func_start sub_8021954
sub_8021954: @ 0x08021954
	push {lr}
	ldr r0, _08021968 @ =gBg0Tm
	movs r1, #0
	bl TmFill
	movs r0, #1
	bl EnableBgSync
	pop {r0}
	bx r0
	.align 2, 0
_08021968: .4byte gBg0Tm

	thumb_func_start NinianStartTransformToHunman
NinianStartTransformToHunman: @ 0x0802196C
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	adds r4, r1, #0
	adds r5, r2, #0
	ldr r0, _080219A8 @ =gUnk_081C2358
	ldr r1, _080219AC @ =0x06002000
	bl Decompress
	ldr r0, _080219B0 @ =gPal + 0x3c0
	movs r1, #0xa0
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r0, _080219B4 @ =ProcScr_NinianTransformToHunman
	adds r1, r6, #0
	bl Proc_StartBlocking
	lsls r4, r4, #1
	subs r4, #1
	str r4, [r0, #0x2c]
	lsls r5, r5, #1
	subs r5, #2
	str r5, [r0, #0x30]
	adds r0, #0x4a
	movs r1, #0
	strh r1, [r0]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080219A8: .4byte gUnk_081C2358
_080219AC: .4byte 0x06002000
_080219B0: .4byte gPal + 0x3c0
_080219B4: .4byte ProcScr_NinianTransformToHunman
