	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_807CFEC
sub_807CFEC: @ 0x0807CFEC
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r0, #0x4c
	ldrh r1, [r0]
	adds r1, #2
	strh r1, [r0]
	movs r2, #0
	ldrsh r1, [r0, r2]
	adds r0, r1, #0
	cmp r1, #0
	bge _0807D004
	adds r0, #0xf
_0807D004:
	asrs r0, r0, #4
	lsls r0, r0, #4
	subs r0, r1, r0
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #7
	bgt _0807D02A
	adds r0, r1, #0
	cmp r1, #0
	bge _0807D01A
	adds r0, r1, #7
_0807D01A:
	asrs r0, r0, #3
	lsls r0, r0, #3
	subs r0, r1, r0
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r1, #0x10
	subs r4, r1, r0
	b _0807D040
_0807D02A:
	adds r0, r1, #0
	cmp r1, #0
	bge _0807D032
	adds r0, r1, #7
_0807D032:
	asrs r0, r0, #3
	lsls r0, r0, #3
	subs r0, r1, r0
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	adds r4, r0, #0
	adds r4, #8
_0807D040:
	ldr r3, _0807D084 @ =gDispIo
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
	movs r2, #0
	strb r4, [r0]
	asrs r1, r4, #1
	movs r0, #0x10
	subs r0, r0, r1
	adds r1, r3, #0
	adds r1, #0x45
	strb r0, [r1]
	adds r0, r3, #0
	adds r0, #0x46
	strb r2, [r0]
	adds r0, r5, #0
	adds r0, #0x4c
	ldrh r1, [r0]
	cmp r1, #0x10
	bne _0807D07E
	strh r2, [r0]
	adds r0, r5, #0
	bl Proc_Break
_0807D07E:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0807D084: .4byte gDispIo

	thumb_func_start sub_807D088
sub_807D088: @ 0x0807D088
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r1, r5, #0
	adds r1, #0x4c
	ldrh r2, [r1]
	adds r0, r2, #1
	strh r0, [r1]
	lsls r2, r2, #0x10
	asrs r2, r2, #0x11
	lsls r2, r2, #0x10
	asrs r4, r2, #0x10
	ldr r0, _0807D0DC @ =gDispIo
	mov ip, r0
	mov r3, ip
	adds r3, #0x3c
	movs r0, #0x3f
	ldrb r1, [r3]
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r3]
	movs r0, #0x10
	subs r0, r0, r4
	mov r1, ip
	adds r1, #0x44
	movs r3, #0
	strb r0, [r1]
	asrs r2, r2, #0x11
	adds r2, #8
	mov r0, ip
	adds r0, #0x45
	strb r2, [r0]
	adds r0, #1
	strb r3, [r0]
	cmp r4, #0x10
	bne _0807D0D6
	adds r0, r5, #0
	bl Proc_Break
_0807D0D6:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0807D0DC: .4byte gDispIo

	thumb_func_start sub_807D0E0
sub_807D0E0: @ 0x0807D0E0
	push {lr}
	ldr r0, _0807D118 @ =gBg0Tm
	movs r1, #0
	bl TmFill
	movs r0, #1
	bl EnableBgSync
	movs r0, #0
	bl SetOnHBlankA
	ldr r2, _0807D11C @ =gDispIo
	adds r1, r2, #0
	adds r1, #0x3c
	movs r0, #0x3f
	ldrb r3, [r1]
	ands r0, r3
	strb r0, [r1]
	adds r0, r2, #0
	adds r0, #0x44
	movs r1, #0
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	pop {r0}
	bx r0
	.align 2, 0
_0807D118: .4byte gBg0Tm
_0807D11C: .4byte gDispIo

	thumb_func_start sub_807D120
sub_807D120: @ 0x0807D120
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r6, r2, #0
	adds r1, r3, #0
	ldr r0, _0807D13C @ =ProcScr_08D6FAE4
	bl Proc_StartBlocking
	str r4, [r0, #0x58]
	str r5, [r0, #0x2c]
	str r6, [r0, #0x30]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0807D13C: .4byte ProcScr_08D6FAE4
