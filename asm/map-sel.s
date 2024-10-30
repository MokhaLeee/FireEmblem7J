
	.include "macro.inc"
	.syntax unified

	thumb_func_start BeginTargetList
BeginTargetList: @ 0x0804B4C0
	ldr r2, _0804B4D0 @ =0x0203DCCC
	movs r3, #0
	strh r0, [r2]
	strh r1, [r2, #2]
	ldr r0, _0804B4D4 @ =0x0203DFD0
	str r3, [r0]
	bx lr
	.align 2, 0
_0804B4D0: .4byte 0x0203DCCC
_0804B4D4: .4byte 0x0203DFD0

	thumb_func_start EnlistTarget
EnlistTarget: @ 0x0804B4D8
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	ldr r4, _0804B524 @ =0x0203DCD0
	mov r8, r4
	ldr r6, _0804B528 @ =0x0203DFD0
	ldr r5, [r6]
	lsls r4, r5, #1
	adds r4, r4, r5
	lsls r4, r4, #2
	add r4, r8
	strb r0, [r4]
	ldr r4, [r6]
	lsls r0, r4, #1
	adds r0, r0, r4
	lsls r0, r0, #2
	add r0, r8
	strb r1, [r0, #1]
	ldr r1, [r6]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	add r0, r8
	strb r2, [r0, #2]
	ldr r1, [r6]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	add r0, r8
	strb r3, [r0, #3]
	ldr r0, [r6]
	adds r0, #1
	str r0, [r6]
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0804B524: .4byte 0x0203DCD0
_0804B528: .4byte 0x0203DFD0

	thumb_func_start sub_804B52C
sub_804B52C: @ 0x0804B52C
	push {r4, r5, r6, lr}
	movs r2, #0
	ldr r0, _0804B56C @ =0x0203DFD0
	ldr r1, [r0]
	adds r6, r0, #0
	ldr r4, _0804B570 @ =0x0203DCD0
	cmp r2, r1
	bge _0804B556
	adds r5, r6, #0
	adds r3, r4, #0
	adds r3, #0xc
	adds r1, r4, #0
	subs r1, #0xc
_0804B546:
	str r1, [r1, #0x14]
	str r3, [r1, #0x10]
	adds r3, #0xc
	adds r1, #0xc
	adds r2, #1
	ldr r0, [r5]
	cmp r2, r0
	blt _0804B546
_0804B556:
	ldr r1, [r6]
	subs r1, #1
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r4
	str r0, [r4, #8]
	str r4, [r0, #4]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0804B56C: .4byte 0x0203DFD0
_0804B570: .4byte 0x0203DCD0

	thumb_func_start sub_804B574
sub_804B574: @ 0x0804B574
	ldr r3, [r0, #0x30]
	movs r0, #0
	ldrsb r0, [r3, r0]
	lsls r0, r0, #4
	str r0, [r1]
	movs r0, #1
	ldrsb r0, [r3, r0]
	lsls r0, r0, #4
	str r0, [r2]
	bx lr

	thumb_func_start sub_804B588
sub_804B588: @ 0x0804B588
	push {r4, r5, lr}
	sub sp, #8
	adds r4, r0, #0
	adds r1, r4, #0
	adds r1, #0x34
	movs r0, #0x40
	ldrb r1, [r1]
	ands r0, r1
	cmp r0, #0
	beq _0804B5B2
	add r2, sp, #4
	adds r0, r4, #0
	mov r1, sp
	bl sub_804B574
	ldr r0, [sp]
	ldr r1, [sp, #4]
	movs r2, #4
	bl sub_8015DE8
	b _0804B64E
_0804B5B2:
	adds r0, r4, #0
	bl sub_804B710
	adds r0, r4, #0
	bl sub_804B78C
	adds r5, r0, #0
	movs r0, #2
	ands r0, r5
	cmp r0, #0
	beq _0804B5CE
	adds r0, r4, #0
	bl sub_804B6DC
_0804B5CE:
	movs r0, #4
	ands r0, r5
	cmp r0, #0
	beq _0804B5E8
	ldr r0, _0804B658 @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0804B5E8
	ldr r0, _0804B65C @ =0x0000038A
	bl m4aSongNumStart
_0804B5E8:
	movs r0, #8
	ands r0, r5
	cmp r0, #0
	beq _0804B602
	ldr r0, _0804B658 @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0804B602
	ldr r0, _0804B660 @ =0x0000038B
	bl m4aSongNumStart
_0804B602:
	movs r0, #0x10
	ands r0, r5
	cmp r0, #0
	beq _0804B60E
	bl ClearUi
_0804B60E:
	movs r0, #0x20
	ands r0, r5
	cmp r0, #0
	beq _0804B61C
	movs r0, #0
	bl EndFaceById
_0804B61C:
	movs r0, #1
	ands r0, r5
	cmp r0, #0
	bne _0804B64E
	add r2, sp, #4
	adds r0, r4, #0
	mov r1, sp
	bl sub_804B574
	ldr r1, [sp]
	asrs r1, r1, #4
	ldr r2, [sp, #4]
	asrs r2, r2, #4
	adds r0, r4, #0
	bl EnsureCameraOntoPosition
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	beq _0804B64E
	ldr r0, [sp]
	ldr r1, [sp, #4]
	movs r2, #2
	bl sub_8015DE8
_0804B64E:
	add sp, #8
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0804B658: .4byte gPlaySt
_0804B65C: .4byte 0x0000038A
_0804B660: .4byte 0x0000038B

	thumb_func_start sub_804B664
sub_804B664: @ 0x0804B664
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	bl LockGame
	ldr r0, _0804B6C4 @ =gUnk_08C09C80
	movs r1, #3
	bl Proc_Start
	adds r5, r0, #0
	adds r1, r5, #0
	adds r1, #0x34
	movs r6, #0
	movs r0, #1
	strb r0, [r1]
	str r4, [r5, #0x2c]
	bl sub_804B938
	str r0, [r5, #0x30]
	str r6, [r5, #0x38]
	ldr r0, [r5, #0x2c]
	ldr r1, [r0]
	cmp r1, #0
	beq _0804B698
	adds r0, r5, #0
	bl _call_via_r1
_0804B698:
	ldr r0, [r5, #0x2c]
	ldr r1, [r0, #8]
	cmp r1, #0
	beq _0804B6A6
	adds r0, r5, #0
	bl _call_via_r1
_0804B6A6:
	ldr r0, [r5, #0x2c]
	ldr r2, [r0, #0xc]
	cmp r2, #0
	beq _0804B6B6
	ldr r1, [r5, #0x30]
	adds r0, r5, #0
	bl _call_via_r2
_0804B6B6:
	ldr r0, _0804B6C8 @ =gpKeySt
	ldr r0, [r0]
	strh r6, [r0, #8]
	adds r0, r5, #0
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_0804B6C4: .4byte gUnk_08C09C80
_0804B6C8: .4byte gpKeySt

	thumb_func_start sub_804B6CC
sub_804B6CC: @ 0x0804B6CC
	push {r4, lr}
	adds r4, r1, #0
	bl sub_804B664
	str r4, [r0, #0x38]
	pop {r4}
	pop {r1}
	bx r1

	thumb_func_start sub_804B6DC
sub_804B6DC: @ 0x0804B6DC
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x2c]
	ldr r1, [r0, #4]
	cmp r1, #0
	beq _0804B6EE
	adds r0, r4, #0
	bl _call_via_r1
_0804B6EE:
	adds r1, r4, #0
	adds r1, #0x34
	movs r0, #1
	ldrb r1, [r1]
	ands r0, r1
	cmp r0, #0
	beq _0804B700
	bl UnlockGame
_0804B700:
	adds r0, r4, #0
	bl Proc_End
	ldr r0, [r4, #0x14]
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_804B710
sub_804B710: @ 0x0804B710
	push {r4, lr}
	adds r4, r0, #0
	ldr r3, [r4, #0x30]
	ldr r2, _0804B780 @ =gpKeySt
	ldr r1, [r2]
	movs r0, #0x60
	ldrh r1, [r1, #6]
	ands r0, r1
	cmp r0, #0
	beq _0804B72C
	ldr r0, [r3, #4]
	cmp r0, #0
	beq _0804B72C
	str r0, [r4, #0x30]
_0804B72C:
	ldr r1, [r2]
	movs r0, #0x90
	ldrh r1, [r1, #6]
	ands r0, r1
	cmp r0, #0
	beq _0804B742
	ldr r0, [r4, #0x30]
	ldr r0, [r0, #8]
	cmp r0, #0
	beq _0804B742
	str r0, [r4, #0x30]
_0804B742:
	ldr r0, [r4, #0x30]
	cmp r0, r3
	beq _0804B77A
	ldr r0, [r4, #0x2c]
	ldr r2, [r0, #0x10]
	cmp r2, #0
	beq _0804B758
	adds r0, r4, #0
	adds r1, r3, #0
	bl _call_via_r2
_0804B758:
	ldr r0, [r4, #0x2c]
	ldr r2, [r0, #0xc]
	cmp r2, #0
	beq _0804B768
	ldr r1, [r4, #0x30]
	adds r0, r4, #0
	bl _call_via_r2
_0804B768:
	ldr r0, _0804B784 @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0804B77A
	ldr r0, _0804B788 @ =0x00000387
	bl m4aSongNumStart
_0804B77A:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0804B780: .4byte gpKeySt
_0804B784: .4byte gPlaySt
_0804B788: .4byte 0x00000387

	thumb_func_start sub_804B78C
sub_804B78C: @ 0x0804B78C
	push {r4, lr}
	adds r2, r0, #0
	movs r4, #0
	ldr r0, _0804B7AC @ =gpKeySt
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0804B7B0
	ldr r3, [r2, #0x38]
	cmp r3, #0
	bne _0804B7D0
	ldr r0, [r2, #0x2c]
	ldr r3, [r0, #0x14]
	b _0804B7CC
	.align 2, 0
_0804B7AC: .4byte gpKeySt
_0804B7B0:
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0804B7BE
	ldr r0, [r2, #0x2c]
	ldr r3, [r0, #0x18]
	b _0804B7CC
_0804B7BE:
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0804B7DC
	ldr r0, [r2, #0x2c]
	ldr r3, [r0, #0x1c]
_0804B7CC:
	cmp r3, #0
	beq _0804B7DC
_0804B7D0:
	ldr r1, [r2, #0x30]
	adds r0, r2, #0
	bl _call_via_r3
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
_0804B7DC:
	adds r0, r4, #0
	pop {r4}
	pop {r1}
	bx r1

	thumb_func_start sub_804B7E4
sub_804B7E4: @ 0x0804B7E4
	push {lr}
	ldr r0, _0804B800 @ =gUnk_08C09C80
	bl Proc_Find
	cmp r0, #0
	beq _0804B7FA
	adds r0, #0x34
	movs r1, #0x40
	ldrb r2, [r0]
	orrs r1, r2
	strb r1, [r0]
_0804B7FA:
	pop {r0}
	bx r0
	.align 2, 0
_0804B800: .4byte gUnk_08C09C80

	thumb_func_start sub_804B804
sub_804B804: @ 0x0804B804
	push {lr}
	ldr r0, _0804B820 @ =gUnk_08C09C80
	bl Proc_Find
	cmp r0, #0
	beq _0804B81C
	adds r1, r0, #0
	adds r1, #0x34
	movs r0, #0xbf
	ldrb r2, [r1]
	ands r0, r2
	strb r0, [r1]
_0804B81C:
	pop {r0}
	bx r0
	.align 2, 0
_0804B820: .4byte gUnk_08C09C80

	thumb_func_start sub_804B824
sub_804B824: @ 0x0804B824
	push {r4, r5, r6, r7, lr}
	movs r7, #0
	ldr r5, _0804B85C @ =0x0203DCD0
	ldr r0, _0804B860 @ =0x0203DFD0
	ldr r0, [r0]
	cmp r7, r0
	bge _0804B87A
	ldr r1, _0804B864 @ =0x0203DCCC
	mov ip, r1
	movs r2, #0
	ldrsh r6, [r1, r2]
	adds r4, r0, #0
_0804B83C:
	movs r0, #0
	ldrsb r0, [r5, r0]
	subs r2, r6, r0
	cmp r2, #0
	bge _0804B848
	subs r2, r0, r6
_0804B848:
	mov r0, ip
	movs r1, #2
	ldrsh r3, [r0, r1]
	movs r0, #1
	ldrsb r0, [r5, r0]
	subs r1, r3, r0
	cmp r1, #0
	blt _0804B868
	adds r0, r2, r1
	b _0804B86C
	.align 2, 0
_0804B85C: .4byte 0x0203DCD0
_0804B860: .4byte 0x0203DFD0
_0804B864: .4byte 0x0203DCCC
_0804B868:
	subs r0, r0, r3
	adds r0, r2, r0
_0804B86C:
	cmp r7, r0
	bge _0804B872
	adds r7, r0, #0
_0804B872:
	subs r4, #1
	adds r5, #0xc
	cmp r4, #0
	bne _0804B83C
_0804B87A:
	adds r0, r7, #0
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_804B884
sub_804B884: @ 0x0804B884
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	movs r7, #0
	movs r5, #0
	movs r4, #0
	ldr r0, _0804B918 @ =0x0203DFD0
	mov sb, r0
	ldr r1, _0804B91C @ =0x0203DCCC
	mov r8, r1
	ldr r3, _0804B920 @ =gUnk_08C09CB0
	mov sl, r3
_0804B8A2:
	mov r6, r8
	movs r0, #0
	ldrsh r2, [r6, r0]
	lsls r1, r4, #2
	add r1, sl
	movs r0, #0
	ldrsb r0, [r1, r0]
	adds r2, r2, r0
	str r2, [sp]
	movs r3, #2
	ldrsh r2, [r6, r3]
	movs r0, #1
	ldrsb r0, [r1, r0]
	adds r2, r2, r0
	movs r1, #0
	ldr r3, _0804B924 @ =0x0203DCD0
	mov r6, sb
	ldr r0, [r6]
	adds r4, #1
	cmp r1, r0
	bge _0804B8FC
	mov ip, sb
_0804B8CE:
	movs r0, #0
	ldrsb r0, [r3, r0]
	ldr r6, [sp]
	cmp r6, r0
	bne _0804B8F0
	movs r0, #1
	ldrsb r0, [r3, r0]
	cmp r2, r0
	bne _0804B8F0
	str r5, [r3, #4]
	cmp r5, #0
	beq _0804B8E8
	str r3, [r5, #8]
_0804B8E8:
	cmp r7, #0
	bne _0804B8EE
	adds r7, r3, #0
_0804B8EE:
	adds r5, r3, #0
_0804B8F0:
	adds r1, #1
	adds r3, #0xc
	mov r6, ip
	ldr r0, [r6]
	cmp r1, r0
	blt _0804B8CE
_0804B8FC:
	cmp r4, #0xc
	ble _0804B8A2
	str r5, [r7, #4]
	str r7, [r5, #8]
	adds r0, r7, #0
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0804B918: .4byte 0x0203DFD0
_0804B91C: .4byte 0x0203DCCC
_0804B920: .4byte gUnk_08C09CB0
_0804B924: .4byte 0x0203DCD0

	thumb_func_start sub_804B928
sub_804B928: @ 0x0804B928
	push {lr}
	bl sub_804B52C
	ldr r0, _0804B934 @ =0x0203DCD0
	pop {r1}
	bx r1
	.align 2, 0
_0804B934: .4byte 0x0203DCD0

	thumb_func_start sub_804B938
sub_804B938: @ 0x0804B938
	push {lr}
	bl sub_804B824
	cmp r0, #2
	bgt _0804B948
	bl sub_804B884
	b _0804B94C
_0804B948:
	bl sub_804B928
_0804B94C:
	pop {r1}
	bx r1

	thumb_func_start sub_804B950
sub_804B950: @ 0x0804B950
	ldr r0, _0804B958 @ =0x0203DFD0
	ldr r0, [r0]
	bx lr
	.align 2, 0
_0804B958: .4byte 0x0203DFD0

	thumb_func_start sub_804B95C
sub_804B95C: @ 0x0804B95C
	adds r1, r0, #0
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _0804B96C @ =0x0203DCD0
	adds r0, r0, r1
	bx lr
	.align 2, 0
_0804B96C: .4byte 0x0203DCD0
