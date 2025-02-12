	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_809E190
sub_809E190: @ 0x0809E190
	push {r4, lr}
	ldrb r3, [r1]
	str r3, [r0, #8]
	ldrb r4, [r1, #2]
	lsls r2, r4, #8
	ldrb r1, [r1, #1]
	orrs r2, r1
	str r2, [r0, #4]
	str r3, [r0, #0xc]
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_809E1A8
sub_809E1A8: @ 0x0809E1A8
	ldr r2, [r0, #8]
	strb r2, [r1]
	ldr r0, [r0, #4]
	strb r0, [r1, #1]
	asrs r0, r0, #0x10
	strb r0, [r1, #2]
	bx lr
	.align 2, 0

	thumb_func_start sub_809E1B8
sub_809E1B8: @ 0x0809E1B8
	adds r2, r0, #0
	ldr r1, [r2, #0xc]
	movs r0, #0xd
	muls r0, r1, r0
	adds r0, #1
	movs r1, #0xff
	ands r0, r1
	str r0, [r2, #0xc]
	bx lr
	.align 2, 0

	thumb_func_start sub_809E1CC
sub_809E1CC: @ 0x0809E1CC
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	adds r7, r1, #0
	ldr r0, _0809E208 @ =0x020143FC
	str r4, [r0]
	ldr r1, _0809E20C @ =0x02014400
	movs r0, #1
	lsls r0, r4
	subs r0, #1
	str r0, [r1]
	ldr r6, _0809E210 @ =0x02014404
	movs r0, #0x1e
	adds r1, r4, #0
	bl __divsi3
	adds r5, r0, #0
	str r5, [r6]
	movs r0, #0x1e
	adds r1, r4, #0
	bl __modsi3
	cmp r0, #0
	ble _0809E1FE
	adds r0, r5, #1
	str r0, [r6]
_0809E1FE:
	ldr r0, _0809E214 @ =0x02014408
	str r7, [r0]
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0809E208: .4byte 0x020143FC
_0809E20C: .4byte 0x02014400
_0809E210: .4byte 0x02014404
_0809E214: .4byte 0x02014408

	thumb_func_start sub_809E218
sub_809E218: @ 0x0809E218
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	ldr r0, _0809E240 @ =0x020143FC
	ldr r4, [r0]
	adds r0, r5, #0
	adds r1, r4, #0
	bl __divsi3
	adds r6, r0, #0
	adds r0, r5, #0
	adds r1, r4, #0
	bl __modsi3
	cmp r0, #0
	ble _0809E238
	adds r6, #1
_0809E238:
	adds r0, r6, #0
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_0809E240: .4byte 0x020143FC

	thumb_func_start sub_809E244
sub_809E244: @ 0x0809E244
	ldr r2, _0809E258 @ =0x02014434
	ldr r1, [r2]
	movs r0, #0xd
	muls r0, r1, r0
	adds r0, #1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [r2]
	bx lr
	.align 2, 0
_0809E258: .4byte 0x02014434

	thumb_func_start sub_809E25C
sub_809E25C: @ 0x0809E25C
	push {r4, r5, r6, lr}
	movs r4, #0
	ldr r1, _0809E290 @ =0x02014404
	ldr r0, [r1]
	cmp r4, r0
	bge _0809E288
	ldr r6, _0809E294 @ =0x02014438
	adds r5, r1, #0
_0809E26C:
	ldr r0, [r5]
	adds r0, r4, r0
	lsls r1, r4, #1
	adds r0, r0, r1
	adds r0, r0, r6
	ldrb r3, [r0]
	adds r2, r4, r6
	ldrb r1, [r2]
	strb r1, [r0]
	strb r3, [r2]
	adds r4, #1
	ldr r0, [r5]
	cmp r4, r0
	blt _0809E26C
_0809E288:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0809E290: .4byte 0x02014404
_0809E294: .4byte 0x02014438

	thumb_func_start sub_809E298
sub_809E298: @ 0x0809E298
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	str r0, [sp]
	mov sl, r1
	mov r8, r2
	mov sb, r3
	bl sub_809E244
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	add r8, r0
	movs r0, #1
	mov r1, sb
	lsls r0, r1
	subs r0, #1
	mov r1, r8
	ands r1, r0
	mov r8, r1
	movs r2, #0
	cmp r2, sb
	bge _0809E318
_0809E2CA:
	ldr r0, _0809E328 @ =0x020143FC
	mov r1, sl
	ldr r6, [r1]
	ldr r4, [r0]
	adds r0, r6, #0
	adds r1, r4, #0
	str r2, [sp, #4]
	bl __divsi3
	ldr r1, [sp]
	adds r7, r1, r0
	movs r5, #1
	ldr r2, [sp, #4]
	lsls r5, r2
	mov r0, r8
	ands r5, r0
	asrs r5, r2
	adds r0, r6, #0
	adds r1, r4, #0
	bl __modsi3
	adds r1, r0, #0
	ldr r2, [sp, #4]
	cmp r1, #0
	bge _0809E2FE
	adds r0, r1, #7
_0809E2FE:
	asrs r0, r0, #3
	lsls r0, r0, #3
	subs r0, r1, r0
	lsls r5, r0
	ldrb r1, [r7]
	orrs r5, r1
	strb r5, [r7]
	adds r0, r6, #1
	mov r1, sl
	str r0, [r1]
	adds r2, #1
	cmp r2, sb
	blt _0809E2CA
_0809E318:
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0809E328: .4byte 0x020143FC

	thumb_func_start sub_809E32C
sub_809E32C: @ 0x0809E32C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	str r0, [sp]
	mov r8, r1
	mov sb, r2
	movs r0, #0
	mov sl, r0
	movs r7, #0
	cmp sl, sb
	bge _0809E390
_0809E348:
	ldr r0, _0809E3B8 @ =0x020143FC
	mov r1, r8
	ldr r6, [r1]
	ldr r4, [r0]
	adds r0, r6, #0
	adds r1, r4, #0
	bl __divsi3
	ldr r2, [sp]
	adds r0, r2, r0
	ldrb r5, [r0]
	adds r0, r6, #0
	adds r1, r4, #0
	bl __modsi3
	adds r1, r0, #0
	cmp r1, #0
	bge _0809E36E
	adds r0, r1, #7
_0809E36E:
	asrs r0, r0, #3
	lsls r0, r0, #3
	subs r0, r1, r0
	movs r1, #1
	lsls r1, r0
	ands r5, r1
	asrs r5, r0
	lsls r5, r7
	mov r0, sl
	orrs r0, r5
	mov sl, r0
	adds r0, r6, #1
	mov r1, r8
	str r0, [r1]
	adds r7, #1
	cmp r7, sb
	blt _0809E348
_0809E390:
	bl sub_809E244
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov r2, sl
	subs r0, r2, r0
	movs r1, #1
	mov r2, sb
	lsls r1, r2
	subs r1, #1
	ands r0, r1
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0809E3B8: .4byte 0x020143FC

	thumb_func_start sub_809E3BC
sub_809E3BC: @ 0x0809E3BC
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r3, r1, #0
	movs r2, #0
	movs r1, #0
	cmp r2, r3
	bge _0809E3E2
_0809E3CA:
	adds r0, r4, r1
	ldrb r6, [r0]
	adds r5, r6, #0
	muls r5, r6, r5
	adds r0, r5, #0
	adds r1, #1
	muls r0, r1, r0
	adds r0, r2, r0
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	cmp r1, r3
	blt _0809E3CA
_0809E3E2:
	lsrs r0, r2, #8
	adds r0, r2, r0
	asrs r1, r2, #0x10
	adds r0, r0, r1
	ldr r2, _0809E3F8 @ =0x000003FF
	adds r1, r2, #0
	ands r0, r1
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_0809E3F8: .4byte 0x000003FF

	thumb_func_start sub_809E3FC
sub_809E3FC: @ 0x0809E3FC
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	movs r6, #0
	ldr r0, _0809E434 @ =0x02014404
	ldr r0, [r0]
	ldr r5, _0809E438 @ =0x02014438
	adds r0, r0, r5
	ldr r4, _0809E43C @ =0x020144D8
	ldrh r1, [r4, #6]
	bl sub_809E3BC
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov sb, r0
	adds r7, r5, #0
	mov r8, r4
_0809E420:
	adds r0, r6, #0
	movs r1, #3
	bl __modsi3
	adds r5, r0, #0
	cmp r5, #0
	bne _0809E440
	mov r0, r8
	ldrh r4, [r0]
	b _0809E458
	.align 2, 0
_0809E434: .4byte 0x02014404
_0809E438: .4byte 0x02014438
_0809E43C: .4byte 0x020144D8
_0809E440:
	cmp r5, #1
	bne _0809E454
	mov r0, r8
	ldrh r4, [r0, #2]
	adds r0, r6, #0
	movs r1, #3
	bl __divsi3
	adds r1, r5, #0
	b _0809E462
_0809E454:
	mov r0, r8
	ldrh r4, [r0, #4]
_0809E458:
	adds r0, r6, #0
	movs r1, #3
	bl __divsi3
	movs r1, #1
_0809E462:
	lsls r1, r0
	ands r4, r1
	asrs r4, r0
	ldr r5, _0809E4C0 @ =0x020143FC
	ldr r1, [r5]
	adds r0, r6, #0
	bl __modsi3
	lsls r4, r0
	ldrb r0, [r7]
	orrs r4, r0
	strb r4, [r7]
	adds r6, #1
	ldr r1, [r5]
	adds r0, r6, #0
	bl __modsi3
	cmp r0, #0
	bne _0809E48A
	adds r7, #1
_0809E48A:
	cmp r6, #0x1e
	bne _0809E420
	movs r2, #0
	ldr r3, _0809E4C4 @ =0x02014404
	ldr r0, [r3]
	cmp r2, r0
	bge _0809E4B0
	ldr r5, _0809E4C8 @ =0x02014438
	ldr r4, _0809E4CC @ =0x02014400
_0809E49C:
	adds r0, r2, r5
	ldrb r1, [r0]
	add r1, sb
	ldrb r6, [r4]
	ands r1, r6
	strb r1, [r0]
	adds r2, #1
	ldr r0, [r3]
	cmp r2, r0
	blt _0809E49C
_0809E4B0:
	bl sub_809E25C
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0809E4C0: .4byte 0x020143FC
_0809E4C4: .4byte 0x02014404
_0809E4C8: .4byte 0x02014438
_0809E4CC: .4byte 0x02014400

	thumb_func_start sub_809E4D0
sub_809E4D0: @ 0x0809E4D0
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	movs r0, #0
	mov sl, r0
	movs r7, #0
	bl sub_809E25C
	ldr r4, _0809E568 @ =0x02014404
	ldr r0, [r4]
	ldr r5, _0809E56C @ =0x02014438
	adds r0, r0, r5
	ldr r1, _0809E570 @ =0x020144D8
	ldrh r1, [r1, #6]
	bl sub_809E3BC
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	movs r2, #0
	ldr r0, [r4]
	cmp sl, r0
	bge _0809E51A
	mov r8, r5
	ldr r5, _0809E574 @ =0x02014400
_0809E504:
	mov r1, r8
	adds r0, r2, r1
	ldrb r6, [r0]
	subs r1, r6, r3
	ldrb r6, [r5]
	ands r1, r6
	strb r1, [r0]
	adds r2, #1
	ldr r0, [r4]
	cmp r2, r0
	blt _0809E504
_0809E51A:
	ldr r0, _0809E570 @ =0x020144D8
	movs r1, #0
	strh r1, [r0]
	strh r1, [r0, #2]
	strh r1, [r0, #4]
	ldr r1, _0809E56C @ =0x02014438
	ldr r2, _0809E578 @ =0x020143FC
	mov sb, r2
	mov r8, r0
	mov r0, sl
	adds r6, r0, r1
_0809E530:
	adds r0, r7, #0
	movs r1, #3
	bl __modsi3
	adds r5, r0, #0
	cmp r5, #0
	bne _0809E57C
	ldrb r4, [r6]
	mov r2, sb
	ldr r1, [r2]
	adds r0, r7, #0
	bl __modsi3
	asrs r4, r0
	movs r0, #1
	ands r4, r0
	adds r0, r7, #0
	movs r1, #3
	bl __divsi3
	lsls r4, r0
	mov r0, r8
	ldrh r0, [r0]
	orrs r4, r0
	mov r1, r8
	strh r4, [r1]
	b _0809E5CC
	.align 2, 0
_0809E568: .4byte 0x02014404
_0809E56C: .4byte 0x02014438
_0809E570: .4byte 0x020144D8
_0809E574: .4byte 0x02014400
_0809E578: .4byte 0x020143FC
_0809E57C:
	cmp r5, #1
	bne _0809E5A6
	ldrb r4, [r6]
	mov r2, sb
	ldr r1, [r2]
	adds r0, r7, #0
	bl __modsi3
	asrs r4, r0
	ands r4, r5
	adds r0, r7, #0
	movs r1, #3
	bl __divsi3
	lsls r4, r0
	mov r0, r8
	ldrh r0, [r0, #2]
	orrs r4, r0
	mov r1, r8
	strh r4, [r1, #2]
	b _0809E5CC
_0809E5A6:
	ldrb r4, [r6]
	mov r2, sb
	ldr r1, [r2]
	adds r0, r7, #0
	bl __modsi3
	asrs r4, r0
	movs r0, #1
	ands r4, r0
	adds r0, r7, #0
	movs r1, #3
	bl __divsi3
	lsls r4, r0
	mov r0, r8
	ldrh r0, [r0, #4]
	orrs r4, r0
	mov r1, r8
	strh r4, [r1, #4]
_0809E5CC:
	adds r7, #1
	mov r2, sb
	ldr r1, [r2]
	adds r0, r7, #0
	bl __modsi3
	cmp r0, #0
	bne _0809E5DE
	adds r6, #1
_0809E5DE:
	cmp r7, #0x1e
	bne _0809E530
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_809E5F0
sub_809E5F0: @ 0x0809E5F0
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r3, r0, #0
	movs r0, #0
	str r0, [sp]
	ldr r6, _0809E6A8 @ =0x02014438
	ldr r5, _0809E6AC @ =0x02014404
	adds r2, r6, #0
	movs r1, #0
	adds r0, r6, #0
	adds r0, #0x9f
_0809E606:
	strb r1, [r0]
	subs r0, #1
	cmp r0, r2
	bge _0809E606
	ldr r1, [r5]
	adds r1, r1, r6
	mov r0, sp
	bl _call_via_r3
	ldr r0, [sp]
	bl sub_809E218
	ldr r4, _0809E6B0 @ =0x020144D8
	strh r0, [r4, #6]
	ldr r0, [r5]
	adds r0, r0, r6
	ldrh r1, [r4, #6]
	bl sub_809E3BC
	strh r0, [r4, #2]
	bl GetGameTime
	lsrs r0, r0, #3
	ldrh r1, [r4, #2]
	adds r0, r1, r0
	ldr r5, _0809E6B4 @ =0x000003FF
	ands r0, r5
	strh r0, [r4]
	ldr r1, _0809E6B8 @ =0x02014434
	ldrh r0, [r4]
	str r0, [r1]
	bl sub_809E244
	ldrh r1, [r4, #2]
	adds r0, r0, r1
	ands r0, r5
	strh r0, [r4, #2]
	movs r5, #0
	ldrh r4, [r4, #6]
	cmp r5, r4
	bge _0809E67C
	adds r4, r6, #0
_0809E65A:
	bl sub_809E244
	ldr r1, _0809E6AC @ =0x02014404
	ldr r2, [r1]
	adds r2, r5, r2
	adds r2, r2, r4
	ldrb r1, [r2]
	adds r0, r1, r0
	ldr r1, _0809E6BC @ =0x02014400
	ldrb r1, [r1]
	ands r0, r1
	strb r0, [r2]
	adds r5, #1
	ldr r0, _0809E6B0 @ =0x020144D8
	ldrh r0, [r0, #6]
	cmp r5, r0
	blt _0809E65A
_0809E67C:
	ldr r0, _0809E6AC @ =0x02014404
	ldr r0, [r0]
	ldr r1, _0809E6A8 @ =0x02014438
	adds r0, r0, r1
	ldr r5, _0809E6B0 @ =0x020144D8
	ldrh r1, [r5, #6]
	bl sub_809E3BC
	adds r4, r0, #0
	bl sub_809E244
	adds r4, r4, r0
	ldr r1, _0809E6B4 @ =0x000003FF
	adds r0, r1, #0
	ands r4, r0
	strh r4, [r5, #4]
	bl sub_809E3FC
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0809E6A8: .4byte 0x02014438
_0809E6AC: .4byte 0x02014404
_0809E6B0: .4byte 0x020144D8
_0809E6B4: .4byte 0x000003FF
_0809E6B8: .4byte 0x02014434
_0809E6BC: .4byte 0x02014400

	thumb_func_start sub_809E6C0
sub_809E6C0: @ 0x0809E6C0
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #8
	mov sb, r0
	movs r0, #0
	str r0, [sp, #4]
	bl sub_809E4D0
	ldr r1, _0809E76C @ =0x02014434
	ldr r4, _0809E770 @ =0x020144D8
	ldrh r0, [r4]
	str r0, [r1]
	ldr r0, _0809E774 @ =0x02014404
	ldr r0, [r0]
	ldr r7, _0809E778 @ =0x02014438
	adds r0, r0, r7
	ldrh r1, [r4, #6]
	bl sub_809E3BC
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	bl sub_809E244
	mov r1, sp
	strh r0, [r1]
	movs r5, #0
	add r0, sp, #4
	mov r8, r0
	ldrh r4, [r4, #6]
	cmp r5, r4
	bge _0809E726
	adds r4, r7, #0
_0809E704:
	bl sub_809E244
	ldr r1, _0809E774 @ =0x02014404
	ldr r2, [r1]
	adds r2, r5, r2
	adds r2, r2, r4
	ldrb r1, [r2]
	subs r0, r1, r0
	ldr r1, _0809E77C @ =0x02014400
	ldrb r1, [r1]
	ands r0, r1
	strb r0, [r2]
	adds r5, #1
	ldr r0, _0809E770 @ =0x020144D8
	ldrh r0, [r0, #6]
	cmp r5, r0
	blt _0809E704
_0809E726:
	bl sub_809E244
	mov r1, sp
	strh r0, [r1, #2]
	ldr r5, _0809E774 @ =0x02014404
	ldr r1, [r5]
	ldr r4, _0809E778 @ =0x02014438
	adds r1, r1, r4
	mov r0, r8
	bl _call_via_r9
	ldr r0, [r5]
	adds r0, r0, r4
	ldr r4, _0809E770 @ =0x020144D8
	ldrh r1, [r4, #6]
	bl sub_809E3BC
	mov r1, sp
	ldrh r1, [r1]
	adds r0, r1, r0
	ldr r1, _0809E780 @ =0x000003FF
	adds r2, r1, #0
	ands r0, r2
	mov r1, sp
	ldrh r1, [r1, #2]
	adds r6, r6, r1
	ands r6, r2
	ldrh r1, [r4, #2]
	cmp r1, r0
	bne _0809E768
	ldrh r4, [r4, #4]
	cmp r4, r6
	beq _0809E784
_0809E768:
	movs r0, #0
	b _0809E786
	.align 2, 0
_0809E76C: .4byte 0x02014434
_0809E770: .4byte 0x020144D8
_0809E774: .4byte 0x02014404
_0809E778: .4byte 0x02014438
_0809E77C: .4byte 0x02014400
_0809E780: .4byte 0x000003FF
_0809E784:
	movs r0, #1
_0809E786:
	add sp, #8
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	thumb_func_start sub_809E794
sub_809E794: @ 0x0809E794
	adds r3, r0, #0
	movs r2, #0
	movs r0, #0
	ldrsb r0, [r1, r0]
	cmp r0, #0
	beq _0809E7BA
	ldrh r3, [r3]
_0809E7A2:
	ldrh r0, [r1]
	cmp r0, r3
	bne _0809E7AE
	lsls r0, r2, #0x10
	lsrs r0, r0, #0x10
	b _0809E7BC
_0809E7AE:
	adds r1, #2
	adds r2, #1
	movs r0, #0
	ldrsb r0, [r1, r0]
	cmp r0, #0
	bne _0809E7A2
_0809E7BA:
	ldr r0, _0809E7C0 @ =0x0000FFFF
_0809E7BC:
	bx lr
	.align 2, 0
_0809E7C0: .4byte 0x0000FFFF

	thumb_func_start sub_809E7C4
sub_809E7C4: @ 0x0809E7C4
	push {r4, r5, r6, lr}
	adds r2, r0, #0
	adds r6, r1, #0
	movs r5, #0
	movs r0, #0
	ldrsb r0, [r2, r0]
	cmp r0, #0
	beq _0809E7F0
	adds r4, r2, #0
_0809E7D6:
	adds r0, r4, #0
	adds r1, r6, #0
	bl sub_809E794
	ldr r1, _0809E7F8 @ =0x02014438
	adds r1, r5, r1
	strb r0, [r1]
	adds r4, #2
	adds r5, #1
	movs r0, #0
	ldrsb r0, [r4, r0]
	cmp r0, #0
	bne _0809E7D6
_0809E7F0:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0809E7F8: .4byte 0x02014438

	thumb_func_start sub_809E7FC
sub_809E7FC: @ 0x0809E7FC
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	adds r5, r1, #0
	ldr r1, _0809E8E4 @ =0x02014434
	ldr r0, _0809E8E8 @ =0x02014408
	ldr r0, [r0]
	str r0, [r1]
	ldr r4, _0809E8EC @ =0x020144E0
	ldrb r2, [r4]
	adds r0, r5, #0
	adds r1, r6, #0
	movs r3, #2
	bl sub_809E298
	ldrb r2, [r4, #1]
	adds r0, r5, #0
	adds r1, r6, #0
	movs r3, #1
	bl sub_809E298
	ldrb r2, [r4, #2]
	adds r0, r5, #0
	adds r1, r6, #0
	movs r3, #1
	bl sub_809E298
	ldrb r2, [r4, #0xa]
	adds r0, r5, #0
	adds r1, r6, #0
	movs r3, #8
	bl sub_809E298
	bl GetGameTime
	adds r2, r0, #0
	adds r0, r5, #0
	adds r1, r6, #0
	movs r3, #5
	bl sub_809E298
	ldrb r2, [r4, #3]
	adds r0, r5, #0
	adds r1, r6, #0
	movs r3, #3
	bl sub_809E298
	ldrb r2, [r4, #4]
	adds r0, r5, #0
	adds r1, r6, #0
	movs r3, #3
	bl sub_809E298
	ldrb r2, [r4, #5]
	adds r0, r5, #0
	adds r1, r6, #0
	movs r3, #3
	bl sub_809E298
	ldrb r2, [r4, #6]
	adds r0, r5, #0
	adds r1, r6, #0
	movs r3, #3
	bl sub_809E298
	ldrb r2, [r4, #7]
	adds r0, r5, #0
	adds r1, r6, #0
	movs r3, #3
	bl sub_809E298
	ldrb r2, [r4, #9]
	adds r0, r5, #0
	adds r1, r6, #0
	movs r3, #8
	bl sub_809E298
	ldrb r2, [r4, #8]
	adds r0, r5, #0
	adds r1, r6, #0
	movs r3, #6
	bl sub_809E298
	ldrh r2, [r4, #0xc]
	adds r0, r5, #0
	adds r1, r6, #0
	movs r3, #0xa
	bl sub_809E298
	ldrb r2, [r4, #0xe]
	adds r0, r5, #0
	adds r1, r6, #0
	movs r3, #6
	bl sub_809E298
	ldrb r2, [r4, #0xf]
	adds r0, r5, #0
	adds r1, r6, #0
	movs r3, #6
	bl sub_809E298
	ldrb r2, [r4, #0xb]
	adds r0, r5, #0
	adds r1, r6, #0
	movs r3, #8
	bl sub_809E298
	ldr r2, [r4, #0x10]
	adds r0, r5, #0
	adds r1, r6, #0
	movs r3, #0x18
	bl sub_809E298
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0809E8E4: .4byte 0x02014434
_0809E8E8: .4byte 0x02014408
_0809E8EC: .4byte 0x020144E0

	thumb_func_start sub_809E8F0
sub_809E8F0: @ 0x0809E8F0
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	adds r4, r1, #0
	ldr r1, _0809E9D0 @ =0x02014434
	ldr r0, _0809E9D4 @ =0x02014408
	ldr r0, [r0]
	str r0, [r1]
	adds r0, r4, #0
	adds r1, r6, #0
	movs r2, #2
	bl sub_809E32C
	ldr r5, _0809E9D8 @ =0x020144E0
	strb r0, [r5]
	adds r0, r4, #0
	adds r1, r6, #0
	movs r2, #1
	bl sub_809E32C
	strb r0, [r5, #1]
	adds r0, r4, #0
	adds r1, r6, #0
	movs r2, #1
	bl sub_809E32C
	strb r0, [r5, #2]
	adds r0, r4, #0
	adds r1, r6, #0
	movs r2, #8
	bl sub_809E32C
	strb r0, [r5, #0xa]
	adds r0, r4, #0
	adds r1, r6, #0
	movs r2, #5
	bl sub_809E32C
	adds r0, r4, #0
	adds r1, r6, #0
	movs r2, #3
	bl sub_809E32C
	strb r0, [r5, #3]
	adds r0, r4, #0
	adds r1, r6, #0
	movs r2, #3
	bl sub_809E32C
	strb r0, [r5, #4]
	adds r0, r4, #0
	adds r1, r6, #0
	movs r2, #3
	bl sub_809E32C
	strb r0, [r5, #5]
	adds r0, r4, #0
	adds r1, r6, #0
	movs r2, #3
	bl sub_809E32C
	strb r0, [r5, #6]
	adds r0, r4, #0
	adds r1, r6, #0
	movs r2, #3
	bl sub_809E32C
	strb r0, [r5, #7]
	adds r0, r4, #0
	adds r1, r6, #0
	movs r2, #8
	bl sub_809E32C
	strb r0, [r5, #9]
	adds r0, r4, #0
	adds r1, r6, #0
	movs r2, #6
	bl sub_809E32C
	strb r0, [r5, #8]
	adds r0, r4, #0
	adds r1, r6, #0
	movs r2, #0xa
	bl sub_809E32C
	strh r0, [r5, #0xc]
	adds r0, r4, #0
	adds r1, r6, #0
	movs r2, #6
	bl sub_809E32C
	strb r0, [r5, #0xe]
	adds r0, r4, #0
	adds r1, r6, #0
	movs r2, #6
	bl sub_809E32C
	strb r0, [r5, #0xf]
	adds r0, r4, #0
	adds r1, r6, #0
	movs r2, #8
	bl sub_809E32C
	strb r0, [r5, #0xb]
	adds r0, r4, #0
	adds r1, r6, #0
	movs r2, #0x18
	bl sub_809E32C
	str r0, [r5, #0x10]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0809E9D0: .4byte 0x02014434
_0809E9D4: .4byte 0x02014408
_0809E9D8: .4byte 0x020144E0

	thumb_func_start sub_809E9DC
sub_809E9DC: @ 0x0809E9DC
	push {r4, r5, r6, lr}
	sub sp, #0x1c
	adds r5, r0, #0
	adds r6, r1, #0
	add r0, sp, #0x18
	movs r1, #0
	strh r1, [r0]
	ldr r4, _0809EA94 @ =0x020144E0
	ldr r2, _0809EA98 @ =0x0100000A
	adds r1, r4, #0
	bl CpuSet
	mov r0, sp
	adds r1, r5, #0
	adds r2, r6, #0
	bl sub_809FC60
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0809EAA0
	strb r5, [r4]
	strb r6, [r4, #2]
	mov r0, sp
	ldrb r0, [r0]
	lsls r0, r0, #0x19
	lsrs r0, r0, #0x1d
	strb r0, [r4, #3]
	mov r0, sp
	ldrh r0, [r0]
	lsls r0, r0, #0x16
	lsrs r0, r0, #0x1d
	strb r0, [r4, #4]
	mov r0, sp
	ldrb r1, [r0, #1]
	lsls r0, r1, #0x1b
	lsrs r0, r0, #0x1d
	strb r0, [r4, #5]
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x1d
	strb r1, [r4, #6]
	strb r1, [r4, #7]
	mov r0, sp
	ldrh r0, [r0, #2]
	lsrs r0, r0, #7
	strb r0, [r4, #9]
	mov r0, sp
	ldrh r0, [r0, #0xa]
	lsls r0, r0, #0x15
	lsrs r0, r0, #0x1a
	strb r0, [r4, #8]
	mov r0, sp
	ldrb r0, [r0, #2]
	lsls r0, r0, #0x19
	lsrs r0, r0, #0x1f
	strb r0, [r4, #1]
	ldr r0, [sp, #4]
	lsls r0, r0, #0xf
	lsrs r0, r0, #0x16
	strh r0, [r4, #0xc]
	mov r0, sp
	ldrb r0, [r0, #6]
	lsls r0, r0, #0x19
	lsrs r0, r0, #0x1a
	strb r0, [r4, #0xe]
	mov r0, sp
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x13
	lsrs r0, r0, #0x1a
	strb r0, [r4, #0xf]
	mov r0, sp
	ldrb r0, [r0, #7]
	lsrs r2, r0, #5
	ldr r0, [sp, #8]
	ldr r1, _0809EA9C @ =0x001FFFFF
	ands r0, r1
	lsls r0, r0, #3
	orrs r0, r2
	str r0, [r4, #0x10]
	mov r0, sp
	ldrb r0, [r0, #0x17]
	strb r0, [r4, #0xa]
	mov r2, sp
	ldrb r1, [r2, #3]
	lsrs r1, r1, #7
	movs r0, #0x7f
	ldrb r2, [r2, #4]
	ands r0, r2
	lsls r0, r0, #1
	orrs r0, r1
	strb r0, [r4, #0xb]
	movs r0, #1
	b _0809EAA2
	.align 2, 0
_0809EA94: .4byte 0x020144E0
_0809EA98: .4byte 0x0100000A
_0809EA9C: .4byte 0x001FFFFF
_0809EAA0:
	movs r0, #0
_0809EAA2:
	add sp, #0x1c
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_809EAAC
sub_809EAAC: @ 0x0809EAAC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x14
	str r0, [sp, #0xc]
	mov r8, r1
	add r1, sp, #8
	movs r0, #0
	strb r0, [r1, #2]
	movs r0, #4
	bl EnableBgSync
	movs r0, #0
	str r0, [sp, #0x10]
	add r7, sp, #8
	movs r1, #0xe0
	lsls r1, r1, #1
	mov sl, r1
	mov sb, r0
	movs r6, #0
_0809EAD8:
	ldr r2, [sp, #0xc]
	adds r0, r2, r6
	bl ClearText
	movs r5, #2
	bl InitTalkTextFont
	movs r4, #0
_0809EAE8:
	mov r0, sb
	adds r2, r0, r4
	ldr r1, _0809EB64 @ =0x020144D8
	ldr r0, _0809EB68 @ =0x02014404
	ldr r0, [r0]
	ldrh r1, [r1, #6]
	adds r0, r1, r0
	cmp r2, r0
	beq _0809EB54
	ldr r1, _0809EB6C @ =0x02014438
	adds r1, r2, r1
	ldrb r2, [r1]
	lsls r0, r2, #1
	add r0, r8
	ldrb r0, [r0]
	strb r0, [r7]
	ldrb r1, [r1]
	lsls r0, r1, #1
	add r0, r8
	ldrb r0, [r0, #1]
	strb r0, [r7, #1]
	movs r0, #0
	str r0, [sp]
	add r1, sp, #8
	str r1, [sp, #4]
	ldr r2, [sp, #0xc]
	adds r0, r2, r6
	ldr r1, _0809EB70 @ =gBg2Tm + 0x8
	add r1, sl
	movs r2, #1
	adds r3, r5, #0
	bl PutDrawText
	adds r5, #0xb
	adds r4, #1
	adds r0, r4, #0
	movs r1, #5
	bl __modsi3
	cmp r0, #0
	bne _0809EB3C
	adds r5, #0xb
_0809EB3C:
	cmp r4, #0xd
	ble _0809EAE8
	movs r0, #0xc0
	add sl, r0
	movs r1, #0xe
	add sb, r1
	adds r6, #8
	ldr r2, [sp, #0x10]
	adds r2, #1
	str r2, [sp, #0x10]
	cmp r2, #2
	ble _0809EAD8
_0809EB54:
	add sp, #0x14
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0809EB64: .4byte 0x020144D8
_0809EB68: .4byte 0x02014404
_0809EB6C: .4byte 0x02014438
_0809EB70: .4byte gBg2Tm + 0x8

	thumb_func_start sub_809EB74
sub_809EB74: @ 0x0809EB74
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	adds r6, r0, #0
	lsls r4, r6, #6
	ldr r7, _0809EC6C @ =gBg2Tm + 0x4
	adds r0, r4, r7
	ldr r5, _0809EC70 @ =0x020144E0
	ldrb r2, [r5]
	movs r1, #2
	bl PutNumberOrBlank
	adds r0, r7, #6
	mov r8, r0
	adds r0, r4, r0
	ldrb r2, [r5, #2]
	movs r1, #2
	bl PutNumberOrBlank
	movs r1, #0x14
	adds r1, r1, r7
	mov sl, r1
	adds r0, r4, r1
	ldrb r2, [r5, #0xb]
	movs r1, #2
	bl PutNumberOrBlank
	movs r0, #0x1e
	adds r0, r0, r7
	mov sb, r0
	add r4, sb
	ldrb r2, [r5, #0xa]
	adds r0, r4, #0
	movs r1, #2
	bl PutNumberOrBlank
	adds r4, r6, #2
	lsls r4, r4, #6
	adds r0, r4, r7
	ldrb r2, [r5, #3]
	movs r1, #2
	bl PutNumberOrBlank
	add r8, r4
	ldrb r2, [r5, #4]
	mov r0, r8
	movs r1, #2
	bl PutNumberOrBlank
	movs r1, #0xc
	adds r1, r1, r7
	mov r8, r1
	adds r0, r4, r1
	ldrb r2, [r5, #5]
	movs r1, #2
	bl PutNumberOrBlank
	adds r0, r7, #0
	adds r0, #0x12
	adds r0, r4, r0
	ldrb r2, [r5, #6]
	movs r1, #2
	bl PutNumberOrBlank
	adds r0, r7, #0
	adds r0, #0x18
	adds r0, r4, r0
	ldrb r2, [r5, #7]
	movs r1, #2
	bl PutNumberOrBlank
	add sb, r4
	ldrb r2, [r5, #9]
	mov r0, sb
	movs r1, #2
	bl PutNumberOrBlank
	adds r0, r7, #0
	adds r0, #0x24
	adds r4, r4, r0
	ldrb r2, [r5, #8]
	adds r0, r4, #0
	movs r1, #2
	bl PutNumberOrBlank
	adds r6, #4
	lsls r6, r6, #6
	add r8, r6
	ldr r2, [r5, #0x10]
	mov r0, r8
	movs r1, #2
	bl PutNumber
	add sl, r6
	ldrh r2, [r5, #0xc]
	mov r0, sl
	movs r1, #2
	bl PutNumber
	adds r0, r7, #0
	adds r0, #0x1a
	adds r0, r6, r0
	ldrb r2, [r5, #0xe]
	movs r1, #2
	bl PutNumber
	adds r0, r7, #0
	adds r0, #0x20
	adds r6, r6, r0
	ldrb r2, [r5, #0xf]
	adds r0, r6, #0
	movs r1, #2
	bl PutNumber
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0809EC6C: .4byte gBg2Tm + 0x4
_0809EC70: .4byte 0x020144E0

	thumb_func_start sub_809EC74
sub_809EC74: @ 0x0809EC74
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r6, r0, #0
	movs r0, #0
	bl InitBgs
	bl ResetTextFont
	bl ResetText
	ldr r4, _0809ED6C @ =gDispIo
	movs r2, #1
	ldrb r0, [r4, #1]
	orrs r0, r2
	movs r3, #2
	orrs r0, r3
	movs r1, #4
	orrs r0, r1
	movs r1, #8
	orrs r0, r1
	movs r1, #0x11
	rsbs r1, r1, #0
	ands r0, r1
	strb r0, [r4, #1]
	adds r1, #0xd
	adds r0, r1, #0
	ldrb r5, [r4, #0xc]
	ands r0, r5
	orrs r0, r2
	strb r0, [r4, #0xc]
	adds r0, r1, #0
	ldrb r2, [r4, #0x10]
	ands r0, r2
	orrs r0, r3
	strb r0, [r4, #0x10]
	ldrb r5, [r4, #0x14]
	ands r1, r5
	strb r1, [r4, #0x14]
	movs r0, #3
	ldrb r1, [r4, #0x18]
	orrs r0, r1
	strb r0, [r4, #0x18]
	bl UnpackUiWindowFrameGraphics
	bl EnablePalSync
	ldr r0, _0809ED70 @ =gBg0Tm
	movs r1, #0
	bl TmFill
	ldr r0, _0809ED74 @ =gBg1Tm
	movs r1, #0
	bl TmFill
	ldr r0, _0809ED78 @ =gBg2Tm
	movs r1, #0
	bl TmFill
	ldr r0, _0809ED7C @ =gBg3Tm
	movs r1, #0
	bl TmFill
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
	movs r0, #3
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	movs r0, #0x21
	rsbs r0, r0, #0
	ldrb r2, [r4, #1]
	ands r0, r2
	movs r1, #0x41
	rsbs r1, r1, #0
	ands r0, r1
	movs r1, #0x7f
	ands r0, r1
	strb r0, [r4, #1]
	movs r0, #2
	str r0, [sp]
	movs r1, #6
	movs r2, #0x1a
	movs r3, #7
	bl DrawUiFrame2
	movs r0, #0xf
	bl EnableBgSync
	ldr r5, _0809ED80 @ =0x0201440C
	movs r4, #2
_0809ED44:
	adds r0, r5, #0
	movs r1, #0x1b
	bl InitText
	adds r5, #8
	subs r4, #1
	cmp r4, #0
	bge _0809ED44
	ldr r0, [r6, #0x30]
	ldr r1, [r6, #0x34]
	bl sub_809E9DC
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0809ED84
	adds r0, r6, #0
	movs r1, #0x63
	bl Proc_Goto
	b _0809EDA6
	.align 2, 0
_0809ED6C: .4byte gDispIo
_0809ED70: .4byte gBg0Tm
_0809ED74: .4byte gBg1Tm
_0809ED78: .4byte gBg2Tm
_0809ED7C: .4byte gBg3Tm
_0809ED80: .4byte 0x0201440C
_0809ED84:
	movs r0, #5
	movs r1, #0x11
	bl sub_809E1CC
	ldr r0, _0809EDB0 @ =sub_809E7FC
	bl sub_809E5F0
	ldr r0, _0809EDB4 @ =0x0201440C
	ldr r1, _0809EDB8 @ =gUnk_08D8E040
	bl sub_809EAAC
	movs r0, #0
	movs r1, #0
	movs r2, #0xa
	bl StartMuralBackgroundAlt
	str r0, [r6, #0x2c]
_0809EDA6:
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0809EDB0: .4byte sub_809E7FC
_0809EDB4: .4byte 0x0201440C
_0809EDB8: .4byte gUnk_08D8E040

	thumb_func_start nullsub_80
nullsub_80: @ 0x0809EDBC
	bx lr
	.align 2, 0

	thumb_func_start sub_809EDC0
sub_809EDC0: @ 0x0809EDC0
	push {lr}
	ldr r0, [r0, #0x2c]
	bl Proc_End
	ldr r2, _0809EDEC @ =gDispIo
	movs r0, #2
	rsbs r0, r0, #0
	ldrb r1, [r2, #1]
	ands r0, r1
	movs r1, #3
	rsbs r1, r1, #0
	ands r0, r1
	subs r1, #2
	ands r0, r1
	subs r1, #4
	ands r0, r1
	subs r1, #8
	ands r0, r1
	strb r0, [r2, #1]
	pop {r0}
	bx r0
	.align 2, 0
_0809EDEC: .4byte gDispIo

	thumb_func_start sub_809EDF0
sub_809EDF0: @ 0x0809EDF0
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r1, r2, #0
	ldr r0, _0809EE08 @ =gUnk_08D8E084
	bl Proc_StartBlocking
	str r4, [r0, #0x30]
	str r5, [r0, #0x34]
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_0809EE08: .4byte gUnk_08D8E084

	thumb_func_start sub_809EE0C
sub_809EE0C: @ 0x0809EE0C
	ldr r0, _0809EE14 @ =0x0203E768
	movs r1, #0
	strb r1, [r0]
	bx lr
	.align 2, 0
_0809EE14: .4byte 0x0203E768

	thumb_func_start nullsub_81
nullsub_81: @ 0x0809EE18
	bx lr

	.align 2, 0
