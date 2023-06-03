	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08019FC0
sub_08019FC0: @ 0x08019FC0
	push {r4, r5, lr}
	adds r5, r0, #0
	lsls r4, r1, #0x18
	lsrs r4, r4, #0x18
	bl GetUnitMovementCost
	bl sub_0801A0C0
	ldr r0, _08019FF4 @ =0x0202E3E0
	ldr r1, [r0]
	ldr r0, _08019FF8 @ =0x03004100
	str r1, [r0]
	movs r0, #0x10
	ldrsb r0, [r5, r0]
	movs r1, #0x11
	ldrsb r1, [r5, r1]
	lsls r4, r4, #0x18
	asrs r4, r4, #0x18
	movs r3, #0xb
	ldrsb r3, [r5, r3]
	adds r2, r4, #0
	bl sub_0801A0E0
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08019FF4: .4byte 0x0202E3E0
_08019FF8: .4byte 0x03004100

	thumb_func_start sub_08019FFC
sub_08019FFC: @ 0x08019FFC
	push {r4, lr}
	adds r4, r0, #0
	bl GetUnitMovementCost
	bl sub_0801A0C0
	ldr r0, _0801A028 @ =0x0202E3E0
	ldr r1, [r0]
	ldr r0, _0801A02C @ =0x03004100
	str r1, [r0]
	movs r0, #0x10
	ldrsb r0, [r4, r0]
	movs r1, #0x11
	ldrsb r1, [r4, r1]
	movs r2, #0x7c
	movs r3, #0
	bl sub_0801A0E0
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0801A028: .4byte 0x0202E3E0
_0801A02C: .4byte 0x03004100

	thumb_func_start sub_0801A030
sub_0801A030: @ 0x0801A030
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r0, r2, #0
	bl sub_0801A0C0
	ldr r0, _0801A058 @ =0x0202E3E4
	ldr r1, [r0]
	ldr r0, _0801A05C @ =0x03004100
	str r1, [r0]
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #0x7c
	movs r3, #0
	bl sub_0801A0E0
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0801A058: .4byte 0x0202E3E4
_0801A05C: .4byte 0x03004100

	thumb_func_start sub_0801A060
sub_0801A060: @ 0x0801A060
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r0, r2, #0
	bl sub_0801A0C0
	ldr r0, _0801A088 @ =0x0202E3E0
	ldr r1, [r0]
	ldr r0, _0801A08C @ =0x03004100
	str r1, [r0]
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #0x7c
	movs r3, #0
	bl sub_0801A0E0
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0801A088: .4byte 0x0202E3E0
_0801A08C: .4byte 0x03004100

	thumb_func_start sub_0801A090
sub_0801A090: @ 0x0801A090
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r6, r2, #0
	mov r8, r3
	bl GetUnitMovementCost
	bl sub_0801A0C0
	movs r3, #0xb
	ldrsb r3, [r4, r3]
	adds r0, r5, #0
	adds r1, r6, #0
	mov r2, r8
	bl sub_0801A0E0
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_0801A0C0
sub_0801A0C0: @ 0x0801A0C0
	push {r4, lr}
	adds r3, r0, #0
	movs r2, #0
	ldr r4, _0801A0DC @ =0x03004310
_0801A0C8:
	adds r0, r2, r4
	adds r1, r3, r2
	ldrb r1, [r1]
	strb r1, [r0]
	adds r2, #1
	cmp r2, #0x40
	ble _0801A0C8
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0801A0DC: .4byte 0x03004310

	thumb_func_start sub_0801A0E0
sub_0801A0E0: @ 0x0801A0E0
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r5, r0, #0
	adds r7, r1, #0
	ldr r1, _0801A100 @ =0x030045C0
	ldr r0, _0801A104 @ =0x03004110
	str r0, [r1, #4]
	ldr r0, _0801A108 @ =0x030043B0
	str r0, [r1]
	strb r2, [r1, #9]
	adds r6, r1, #0
	cmp r3, #0
	bne _0801A10C
	strb r3, [r6, #8]
	b _0801A112
	.align 2, 0
_0801A100: .4byte 0x030045C0
_0801A104: .4byte 0x03004110
_0801A108: .4byte 0x030043B0
_0801A10C:
	movs r0, #1
	strb r0, [r6, #8]
	strb r3, [r6, #0xa]
_0801A112:
	movs r0, #0
	mov r8, r0
	movs r0, #0x78
	strb r0, [r6, #0xb]
	ldr r4, _0801A160 @ =0x03004100
	ldr r0, [r4]
	movs r1, #1
	rsbs r1, r1, #0
	bl BmMapFillg
	ldr r0, [r6, #4]
	strb r5, [r0]
	ldr r0, [r6, #4]
	strb r7, [r0, #1]
	ldr r1, [r6, #4]
	movs r0, #5
	strb r0, [r1, #2]
	ldr r0, [r6, #4]
	mov r1, r8
	strb r1, [r0, #3]
	ldr r1, [r4]
	lsls r0, r7, #2
	adds r0, r0, r1
	ldr r0, [r0]
	adds r0, r0, r5
	mov r1, r8
	strb r1, [r0]
	ldr r0, [r6, #4]
	adds r0, #4
	str r0, [r6, #4]
	movs r1, #4
	strb r1, [r0, #2]
	bl sub_080042E4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0801A160: .4byte 0x03004100

	thumb_func_start sub_0801A164
sub_0801A164: @ 0x0801A164
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	mov r8, r0
	adds r6, r1, #0
	mov ip, r2
	ldr r5, _0801A228 @ =0x030045C0
	ldr r2, [r5]
	movs r0, #0
	ldrsb r0, [r2, r0]
	adds r6, r6, r0
	movs r0, #1
	ldrsb r0, [r2, r0]
	add ip, r0
	ldr r3, _0801A22C @ =0x03004310
	ldr r0, _0801A230 @ =0x0202E3DC
	ldr r0, [r0]
	mov r1, ip
	lsls r7, r1, #2
	adds r0, r7, r0
	ldr r0, [r0]
	adds r0, r0, r6
	ldrb r0, [r0]
	adds r0, r0, r3
	mov sb, r0
	ldr r4, _0801A234 @ =0x03004100
	ldr r1, [r4]
	ldrb r3, [r2, #1]
	lsls r0, r3, #2
	adds r0, r0, r1
	ldr r0, [r0]
	ldrb r2, [r2]
	adds r0, r2, r0
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	mov r2, sb
	ldrb r2, [r2]
	adds r0, r2, r0
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	asrs r0, r0, #0x10
	adds r1, r7, r1
	ldr r1, [r1]
	adds r1, r1, r6
	ldrb r1, [r1]
	cmp r0, r1
	bge _0801A21C
	movs r0, #8
	ldrsb r0, [r5, r0]
	cmp r0, #0
	beq _0801A1EA
	ldr r0, _0801A238 @ =0x0202E3D8
	ldr r0, [r0]
	adds r0, r7, r0
	ldr r0, [r0]
	adds r0, r0, r6
	ldrb r0, [r0]
	cmp r0, #0
	beq _0801A1EA
	ldrb r3, [r5, #0xa]
	eors r0, r3
	movs r1, #0x80
	ands r0, r1
	cmp r0, #0
	bne _0801A21C
_0801A1EA:
	lsls r0, r2, #0x10
	asrs r0, r0, #0x10
	ldrb r1, [r5, #9]
	cmp r0, r1
	bgt _0801A21C
	ldr r0, [r5, #4]
	strb r6, [r0]
	ldr r0, [r5, #4]
	mov r3, ip
	strb r3, [r0, #1]
	ldr r0, [r5, #4]
	mov r1, r8
	strb r1, [r0, #2]
	ldr r0, [r5, #4]
	strb r2, [r0, #3]
	ldr r0, [r5, #4]
	adds r0, #4
	str r0, [r5, #4]
	ldr r1, [r4]
	mov r3, ip
	lsls r0, r3, #2
	adds r0, r0, r1
	ldr r0, [r0]
	adds r0, r0, r6
	strb r2, [r0]
_0801A21C:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0801A228: .4byte 0x030045C0
_0801A22C: .4byte 0x03004310
_0801A230: .4byte 0x0202E3DC
_0801A234: .4byte 0x03004100
_0801A238: .4byte 0x0202E3D8

	thumb_func_start sub_0801A23C
sub_0801A23C: @ 0x0801A23C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x14
	adds r6, r0, #0
	mov sb, r1
	str r2, [sp, #8]
	str r2, [sp, #0xc]
	movs r0, #0
	mov ip, r0
	ldr r1, _0801A28C @ =0x03004100
	ldr r0, [r1]
	mov r3, sb
	lsls r2, r3, #2
	adds r0, r2, r0
	ldr r0, [r0]
	adds r0, r0, r6
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne _0801A26E
	b _0801A3D2
_0801A26E:
	mov r4, sp
	add r7, sp, #4
	mov sl, r7
	mov r8, r2
_0801A276:
	ldr r0, _0801A290 @ =0x0202E3D4
	movs r2, #0
	ldrsh r0, [r0, r2]
	subs r0, #1
	cmp r6, r0
	bne _0801A294
	movs r0, #0xff
	ldrb r3, [r4]
	orrs r0, r3
	b _0801A29E
	.align 2, 0
_0801A28C: .4byte 0x03004100
_0801A290: .4byte 0x0202E3D4
_0801A294:
	ldr r0, [r1]
	add r0, r8
	ldr r0, [r0]
	adds r0, r6, r0
	ldrb r0, [r0, #1]
_0801A29E:
	strb r0, [r4]
	cmp r6, #0
	bne _0801A2AC
	ldrb r0, [r4, #1]
	movs r7, #0xff
	orrs r0, r7
	b _0801A2B8
_0801A2AC:
	ldr r0, [r1]
	add r0, r8
	ldr r0, [r0]
	adds r0, r6, r0
	subs r0, #1
	ldrb r0, [r0]
_0801A2B8:
	strb r0, [r4, #1]
	ldr r2, _0801A2D0 @ =0x0202E3D4
	movs r3, #2
	ldrsh r0, [r2, r3]
	subs r0, #1
	cmp sb, r0
	bne _0801A2D4
	ldrb r0, [r4, #3]
	movs r7, #0xff
	orrs r0, r7
	b _0801A2DE
	.align 2, 0
_0801A2D0: .4byte 0x0202E3D4
_0801A2D4:
	ldr r0, [r1]
	add r0, r8
	ldr r0, [r0, #4]
	adds r0, r0, r6
	ldrb r0, [r0]
_0801A2DE:
	strb r0, [r4, #3]
	mov r0, sb
	cmp r0, #0
	bne _0801A2EE
	ldrb r0, [r4, #2]
	movs r1, #0xff
	orrs r0, r1
	b _0801A2FA
_0801A2EE:
	ldr r0, [r1]
	add r0, r8
	subs r0, #4
	ldr r0, [r0]
	adds r0, r0, r6
	ldrb r0, [r0]
_0801A2FA:
	strb r0, [r4, #2]
	movs r1, #0x80
	lsls r1, r1, #1
	movs r7, #0
	movs r2, #0
	ldr r3, [sp, #8]
	adds r3, #1
	str r3, [sp, #0x10]
_0801A30A:
	mov r3, sp
	adds r0, r3, r2
	ldrb r0, [r0]
	cmp r1, r0
	ble _0801A316
	adds r1, r0, #0
_0801A316:
	adds r2, #1
	cmp r2, #3
	ble _0801A30A
	movs r2, #0
	adds r5, r1, #0
	add r3, sp, #4
_0801A322:
	mov r1, sp
	adds r0, r1, r2
	ldrb r0, [r0]
	cmp r5, r0
	bne _0801A340
	adds r1, r7, #0
	lsls r0, r1, #0x10
	movs r7, #0x80
	lsls r7, r7, #9
	adds r0, r0, r7
	lsrs r7, r0, #0x10
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	adds r1, r3, r1
	strb r2, [r1]
_0801A340:
	adds r2, #1
	cmp r2, #3
	ble _0801A322
	lsls r0, r7, #0x10
	asrs r0, r0, #0x10
	cmp r0, #2
	beq _0801A366
	cmp r0, #2
	bgt _0801A358
	cmp r0, #1
	beq _0801A362
	b _0801A37A
_0801A358:
	cmp r0, #3
	beq _0801A36A
	cmp r0, #4
	beq _0801A36E
	b _0801A37A
_0801A362:
	mov r0, sl
	b _0801A376
_0801A366:
	movs r0, #2
	b _0801A370
_0801A36A:
	movs r0, #3
	b _0801A370
_0801A36E:
	movs r0, #4
_0801A370:
	bl RandNext
	add r0, sl
_0801A376:
	ldrb r0, [r0]
	mov ip, r0
_0801A37A:
	mov r2, ip
	ldr r1, [sp, #8]
	strb r2, [r1]
	ldr r3, [sp, #0x10]
	str r3, [sp, #8]
	mov r0, ip
	cmp r0, #1
	beq _0801A3A2
	cmp r0, #1
	bgt _0801A394
	cmp r0, #0
	beq _0801A39E
	b _0801A3BC
_0801A394:
	cmp r0, #2
	beq _0801A3B0
	cmp r0, #3
	beq _0801A3A6
	b _0801A3BC
_0801A39E:
	adds r6, #1
	b _0801A3BC
_0801A3A2:
	subs r6, #1
	b _0801A3BC
_0801A3A6:
	movs r7, #4
	add r8, r7
	movs r0, #1
	add sb, r0
	b _0801A3BC
_0801A3B0:
	movs r1, #4
	rsbs r1, r1, #0
	add r8, r1
	movs r2, #1
	rsbs r2, r2, #0
	add sb, r2
_0801A3BC:
	ldr r1, _0801A3EC @ =0x03004100
	ldr r0, [r1]
	add r0, r8
	ldr r0, [r0]
	adds r0, r0, r6
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _0801A3D2
	b _0801A276
_0801A3D2:
	ldr r0, [sp, #0xc]
	ldr r1, [sp, #8]
	bl sub_0801A3F0
	add sp, #0x14
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0801A3EC: .4byte 0x03004100

	thumb_func_start sub_0801A3F0
sub_0801A3F0: @ 0x0801A3F0
	sub sp, #0x40
	adds r3, r0, #0
	mov r2, sp
	cmp r1, r3
	bls _0801A406
_0801A3FA:
	subs r1, #1
	ldrb r0, [r1]
	strb r0, [r2]
	adds r2, #1
	cmp r1, r3
	bhi _0801A3FA
_0801A406:
	movs r0, #4
	strb r0, [r2]
	mov r2, sp
	b _0801A414
_0801A40E:
	strb r0, [r3]
	adds r2, #1
	adds r3, #1
_0801A414:
	ldrb r0, [r2]
	cmp r0, #4
	bne _0801A40E
	movs r0, #4
	strb r0, [r3]
	add sp, #0x40
	bx lr
	.align 2, 0

	thumb_func_start sub_0801A424
sub_0801A424: @ 0x0801A424
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	adds r3, r1, #0
	adds r4, r2, #0
	ldr r5, _0801A438 @ =0x02033DFC
	ldr r6, _0801A43C @ =0x0203A858
	ldr r0, _0801A440 @ =0x0202E3EC
	mov ip, r0
	b _0801A446
	.align 2, 0
_0801A438: .4byte 0x02033DFC
_0801A43C: .4byte 0x0203A858
_0801A440: .4byte 0x0202E3EC
_0801A444:
	adds r5, #1
_0801A446:
	strb r3, [r6, #0xe]
	strb r4, [r6, #0xf]
	ldrb r0, [r5]
	cmp r0, #1
	beq _0801A46E
	cmp r0, #1
	bgt _0801A45A
	cmp r0, #0
	beq _0801A46A
	b _0801A470
_0801A45A:
	cmp r0, #2
	beq _0801A466
	cmp r0, #3
	bne _0801A470
	subs r4, #1
	b _0801A470
_0801A466:
	adds r4, #1
	b _0801A470
_0801A46A:
	subs r3, #1
	b _0801A470
_0801A46E:
	adds r3, #1
_0801A470:
	ldr r0, [r7]
	ldr r2, [r7, #4]
	ldr r1, [r0, #0x28]
	ldr r0, [r2, #0x28]
	orrs r1, r0
	ldr r0, _0801A4A8 @ =0x02001808
	ands r1, r0
	lsls r2, r4, #2
	cmp r1, #0
	bne _0801A4AC
	mov r1, ip
	ldr r0, [r1]
	adds r0, r2, r0
	ldr r1, [r0]
	adds r1, r1, r3
	movs r0, #2
	ldrb r1, [r1]
	ands r0, r1
	cmp r0, #0
	beq _0801A4AC
	movs r0, #4
	strb r0, [r5, #1]
	movs r0, #0x1b
	strb r0, [r6, #0x11]
	strb r3, [r6, #0xe]
	strb r4, [r6, #0xf]
	b _0801A4D4
	.align 2, 0
_0801A4A8: .4byte 0x02001808
_0801A4AC:
	mov r1, ip
	ldr r0, [r1]
	adds r0, r2, r0
	ldr r1, [r0]
	adds r1, r1, r3
	movs r0, #1
	ldrb r1, [r1]
	ands r0, r1
	cmp r0, #0
	beq _0801A4CE
	movs r0, #0xa
	strb r0, [r5]
	movs r0, #4
	strb r0, [r5, #1]
	movs r0, #0x1b
	strb r0, [r6, #0x11]
	b _0801A4D4
_0801A4CE:
	ldrb r0, [r5]
	cmp r0, #4
	bne _0801A444
_0801A4D4:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_0801A4DC
sub_0801A4DC: @ 0x0801A4DC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	ldr r1, _0801A5BC @ =0x0202E3D4
	movs r2, #2
	ldrsh r0, [r1, r2]
	subs r4, r0, #1
	ldr r7, _0801A5C0 @ =0x030045C0
	mov sb, r7
	cmp r4, #0
	blt _0801A5A4
	mov ip, r1
	mov sl, sb
_0801A4FA:
	mov r1, ip
	movs r2, #0
	ldrsh r0, [r1, r2]
	subs r3, r0, #1
	subs r7, r4, #1
	mov r8, r7
	cmp r3, #0
	blt _0801A59E
	lsls r5, r4, #2
	mov r6, sl
_0801A50E:
	ldr r1, _0801A5C4 @ =0x0202E3E0
	ldr r0, [r1]
	adds r0, r5, r0
	ldr r0, [r0]
	adds r1, r0, r3
	ldrb r2, [r1]
	cmp r2, #0x78
	bhi _0801A598
	movs r0, #0
	ldrsb r0, [r1, r0]
	ldrb r2, [r6, #0xb]
	cmp r0, r2
	beq _0801A598
	subs r1, #1
	movs r0, #0
	ldrsb r0, [r1, r0]
	cmp r0, #0
	bge _0801A538
	cmp r3, #0
	beq _0801A538
	strb r2, [r1]
_0801A538:
	ldr r7, _0801A5C4 @ =0x0202E3E0
	ldr r0, [r7]
	adds r0, r5, r0
	ldr r0, [r0]
	adds r1, r3, r0
	movs r0, #1
	ldrsb r0, [r1, r0]
	cmp r0, #0
	bge _0801A55A
	mov r2, ip
	movs r7, #0
	ldrsh r0, [r2, r7]
	subs r0, #1
	cmp r3, r0
	beq _0801A55A
	ldrb r0, [r6, #0xb]
	strb r0, [r1, #1]
_0801A55A:
	ldr r1, _0801A5C4 @ =0x0202E3E0
	ldr r0, [r1]
	adds r0, r5, r0
	subs r0, #4
	ldr r0, [r0]
	adds r1, r0, r3
	movs r0, #0
	ldrsb r0, [r1, r0]
	cmp r0, #0
	bge _0801A576
	cmp r4, #0
	beq _0801A576
	ldrb r0, [r6, #0xb]
	strb r0, [r1]
_0801A576:
	ldr r2, _0801A5C4 @ =0x0202E3E0
	ldr r0, [r2]
	adds r0, r5, r0
	ldr r0, [r0, #4]
	adds r1, r0, r3
	movs r0, #0
	ldrsb r0, [r1, r0]
	cmp r0, #0
	bge _0801A598
	mov r7, ip
	movs r2, #2
	ldrsh r0, [r7, r2]
	subs r0, #1
	cmp r4, r0
	beq _0801A598
	ldrb r0, [r6, #0xb]
	strb r0, [r1]
_0801A598:
	subs r3, #1
	cmp r3, #0
	bge _0801A50E
_0801A59E:
	mov r4, r8
	cmp r4, #0
	bge _0801A4FA
_0801A5A4:
	mov r7, sb
	ldrb r0, [r7, #0xb]
	adds r0, #1
	strb r0, [r7, #0xb]
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0801A5BC: .4byte 0x0202E3D4
_0801A5C0: .4byte 0x030045C0
_0801A5C4: .4byte 0x0202E3E0

	thumb_func_start sub_0801A5C8
sub_0801A5C8: @ 0x0801A5C8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	ldr r1, _0801A6A8 @ =0x0202E3D4
	movs r2, #2
	ldrsh r0, [r1, r2]
	subs r4, r0, #1
	ldr r7, _0801A6AC @ =0x030045C0
	mov sb, r7
	cmp r4, #0
	blt _0801A690
	mov ip, r1
	mov sl, sb
_0801A5E6:
	mov r1, ip
	movs r2, #0
	ldrsh r0, [r1, r2]
	subs r3, r0, #1
	subs r7, r4, #1
	mov r8, r7
	cmp r3, #0
	blt _0801A68A
	lsls r5, r4, #2
	mov r6, sl
_0801A5FA:
	ldr r1, _0801A6B0 @ =0x03004100
	ldr r0, [r1]
	adds r0, r5, r0
	ldr r0, [r0]
	adds r1, r0, r3
	ldrb r2, [r1]
	cmp r2, #0x78
	bhi _0801A684
	movs r0, #0
	ldrsb r0, [r1, r0]
	ldrb r2, [r6, #0xb]
	cmp r0, r2
	beq _0801A684
	subs r1, #1
	movs r0, #0
	ldrsb r0, [r1, r0]
	cmp r0, #0
	bge _0801A624
	cmp r3, #0
	beq _0801A624
	strb r2, [r1]
_0801A624:
	ldr r7, _0801A6B0 @ =0x03004100
	ldr r0, [r7]
	adds r0, r5, r0
	ldr r0, [r0]
	adds r1, r3, r0
	movs r0, #1
	ldrsb r0, [r1, r0]
	cmp r0, #0
	bge _0801A646
	mov r2, ip
	movs r7, #0
	ldrsh r0, [r2, r7]
	subs r0, #1
	cmp r3, r0
	beq _0801A646
	ldrb r0, [r6, #0xb]
	strb r0, [r1, #1]
_0801A646:
	ldr r1, _0801A6B0 @ =0x03004100
	ldr r0, [r1]
	adds r0, r5, r0
	subs r0, #4
	ldr r0, [r0]
	adds r1, r0, r3
	movs r0, #0
	ldrsb r0, [r1, r0]
	cmp r0, #0
	bge _0801A662
	cmp r4, #0
	beq _0801A662
	ldrb r0, [r6, #0xb]
	strb r0, [r1]
_0801A662:
	ldr r2, _0801A6B0 @ =0x03004100
	ldr r0, [r2]
	adds r0, r5, r0
	ldr r0, [r0, #4]
	adds r1, r0, r3
	movs r0, #0
	ldrsb r0, [r1, r0]
	cmp r0, #0
	bge _0801A684
	mov r7, ip
	movs r2, #2
	ldrsh r0, [r7, r2]
	subs r0, #1
	cmp r4, r0
	beq _0801A684
	ldrb r0, [r6, #0xb]
	strb r0, [r1]
_0801A684:
	subs r3, #1
	cmp r3, #0
	bge _0801A5FA
_0801A68A:
	mov r4, r8
	cmp r4, #0
	bge _0801A5E6
_0801A690:
	mov r7, sb
	ldrb r0, [r7, #0xb]
	adds r0, #1
	strb r0, [r7, #0xb]
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0801A6A8: .4byte 0x0202E3D4
_0801A6AC: .4byte 0x030045C0
_0801A6B0: .4byte 0x03004100

	thumb_func_start sub_0801A6B4
sub_0801A6B4: @ 0x0801A6B4
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	str r0, [sp]
	mov sb, r1
	mov r8, r2
	mov sl, r3
	mov r5, r8
	mov r4, sb
	adds r0, r4, r5
	cmp r4, r0
	bgt _0801A734
	ldr r1, _0801A7B0 @ =0x0202E3D4
	movs r2, #2
	ldrsh r0, [r1, r2]
	cmp r4, r0
	bge _0801A734
_0801A6DC:
	ldr r6, [sp]
	subs r1, r6, r5
	lsls r0, r5, #1
	adds r0, #1
	cmp r1, #0
	bge _0801A6EC
	adds r0, r0, r1
	movs r1, #0
_0801A6EC:
	adds r3, r1, r0
	ldr r2, _0801A7B0 @ =0x0202E3D4
	movs r6, #0
	ldrsh r0, [r2, r6]
	cmp r3, r0
	ble _0801A6FA
	adds r3, r0, #0
_0801A6FA:
	adds r2, r1, #0
	subs r5, #1
	adds r7, r4, #1
	mov r6, sb
	add r6, r8
	cmp r2, r3
	bge _0801A724
	ldr r0, _0801A7B4 @ =0x03004100
	mov ip, r0
	lsls r4, r4, #2
_0801A70E:
	mov r1, ip
	ldr r0, [r1]
	adds r0, r4, r0
	ldr r0, [r0]
	adds r0, r0, r2
	ldrb r1, [r0]
	add r1, sl
	strb r1, [r0]
	adds r2, #1
	cmp r2, r3
	blt _0801A70E
_0801A724:
	adds r4, r7, #0
	cmp r4, r6
	bgt _0801A734
	ldr r2, _0801A7B0 @ =0x0202E3D4
	movs r6, #2
	ldrsh r0, [r2, r6]
	cmp r4, r0
	blt _0801A6DC
_0801A734:
	mov r5, r8
	subs r5, #1
	mov r4, sb
	subs r4, #1
	mov r0, sb
	mov r1, r8
	subs r0, r0, r1
	mov r8, r0
	cmp r4, r8
	blt _0801A79E
	cmp r4, #0
	blt _0801A79E
	ldr r2, _0801A7B0 @ =0x0202E3D4
	mov ip, r2
	ldr r6, _0801A7B4 @ =0x03004100
	mov sb, r6
_0801A754:
	ldr r0, [sp]
	subs r1, r0, r5
	lsls r0, r5, #1
	adds r0, #1
	cmp r1, #0
	bge _0801A764
	adds r0, r0, r1
	movs r1, #0
_0801A764:
	adds r3, r1, r0
	mov r2, ip
	movs r6, #0
	ldrsh r0, [r2, r6]
	cmp r3, r0
	ble _0801A772
	adds r3, r0, #0
_0801A772:
	adds r2, r1, #0
	subs r5, #1
	subs r6, r4, #1
	cmp r2, r3
	bge _0801A794
	mov r7, sb
	lsls r4, r4, #2
_0801A780:
	ldr r0, [r7]
	adds r0, r4, r0
	ldr r0, [r0]
	adds r0, r0, r2
	ldrb r1, [r0]
	add r1, sl
	strb r1, [r0]
	adds r2, #1
	cmp r2, r3
	blt _0801A780
_0801A794:
	adds r4, r6, #0
	cmp r6, r8
	blt _0801A79E
	cmp r6, #0
	bge _0801A754
_0801A79E:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0801A7B0: .4byte 0x0202E3D4
_0801A7B4: .4byte 0x03004100

	thumb_func_start sub_0801A7B8
sub_0801A7B8: @ 0x0801A7B8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	str r0, [sp]
	mov sb, r1
	mov r8, r2
	mov sl, r3
	mov r5, r8
	mov r3, sb
	adds r0, r3, r5
	cmp r3, r0
	bgt _0801A834
	ldr r4, _0801A8AC @ =0x0202E3D4
	movs r1, #2
	ldrsh r0, [r4, r1]
	cmp r3, r0
	bge _0801A834
_0801A7E0:
	ldr r2, [sp]
	subs r1, r2, r5
	lsls r0, r5, #1
	adds r0, #1
	cmp r1, #0
	bge _0801A7F0
	adds r0, r0, r1
	movs r1, #0
_0801A7F0:
	adds r2, r1, r0
	ldr r4, _0801A8AC @ =0x0202E3D4
	movs r6, #0
	ldrsh r0, [r4, r6]
	cmp r2, r0
	ble _0801A7FE
	adds r2, r0, #0
_0801A7FE:
	subs r6, r5, #1
	adds r7, r3, #1
	mov r0, sb
	add r0, r8
	mov ip, r0
	cmp r1, r2
	bge _0801A822
	ldr r5, _0801A8B0 @ =0x03004100
	lsls r4, r3, #2
_0801A810:
	ldr r0, [r5]
	adds r0, r4, r0
	ldr r0, [r0]
	adds r0, r0, r1
	mov r3, sl
	strb r3, [r0]
	adds r1, #1
	cmp r1, r2
	blt _0801A810
_0801A822:
	adds r5, r6, #0
	adds r3, r7, #0
	cmp r3, ip
	bgt _0801A834
	ldr r4, _0801A8AC @ =0x0202E3D4
	movs r6, #2
	ldrsh r0, [r4, r6]
	cmp r3, r0
	blt _0801A7E0
_0801A834:
	mov r5, r8
	subs r5, #1
	mov r3, sb
	subs r3, #1
	mov r0, sb
	mov r1, r8
	subs r0, r0, r1
	mov r8, r0
	cmp r3, r8
	blt _0801A89C
	cmp r3, #0
	blt _0801A89C
	ldr r2, _0801A8AC @ =0x0202E3D4
	mov ip, r2
	ldr r4, _0801A8B0 @ =0x03004100
	mov sb, r4
_0801A854:
	ldr r6, [sp]
	subs r1, r6, r5
	lsls r0, r5, #1
	adds r0, #1
	cmp r1, #0
	bge _0801A864
	adds r0, r0, r1
	movs r1, #0
_0801A864:
	adds r2, r1, r0
	mov r4, ip
	movs r6, #0
	ldrsh r0, [r4, r6]
	cmp r2, r0
	ble _0801A872
	adds r2, r0, #0
_0801A872:
	subs r6, r5, #1
	subs r4, r3, #1
	cmp r1, r2
	bge _0801A890
	mov r7, sb
	lsls r5, r3, #2
_0801A87E:
	ldr r0, [r7]
	adds r0, r5, r0
	ldr r0, [r0]
	adds r0, r0, r1
	mov r3, sl
	strb r3, [r0]
	adds r1, #1
	cmp r1, r2
	blt _0801A87E
_0801A890:
	adds r5, r6, #0
	adds r3, r4, #0
	cmp r4, r8
	blt _0801A89C
	cmp r4, #0
	bge _0801A854
_0801A89C:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0801A8AC: .4byte 0x0202E3D4
_0801A8B0: .4byte 0x03004100

	thumb_func_start sub_0801A8B4
sub_0801A8B4: @ 0x0801A8B4
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	mov sb, r0
	movs r1, #1
	rsbs r1, r1, #0
	bl sub_08017310
	subs r0, #1
	cmp r0, #0xe
	bls _0801A8D2
	b _0801AF52
_0801A8D2:
	lsls r0, r0, #2
	ldr r1, _0801A8DC @ =_0801A8E0
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0801A8DC: .4byte _0801A8E0
_0801A8E0: @ jump table
	.4byte _0801A91C @ case 0
	.4byte _0801AAF0 @ case 1
	.4byte _0801A9B8 @ case 2
	.4byte _0801AC28 @ case 3
	.4byte _0801AD60 @ case 4
	.4byte _0801AB8C @ case 5
	.4byte _0801AA54 @ case 6
	.4byte _0801AF52 @ case 7
	.4byte _0801AF52 @ case 8
	.4byte _0801AF52 @ case 9
	.4byte _0801AF52 @ case 10
	.4byte _0801ACC4 @ case 11
	.4byte _0801AE14 @ case 12
	.4byte _0801AF52 @ case 13
	.4byte _0801AECC @ case 14
_0801A91C:
	ldr r0, _0801A9A8 @ =0x0202E3D4
	movs r1, #2
	ldrsh r0, [r0, r1]
	subs r6, r0, #1
	cmp r6, #0
	bge _0801A92A
	b _0801AF52
_0801A92A:
	ldr r0, _0801A9A8 @ =0x0202E3D4
	movs r2, #0
	ldrsh r0, [r0, r2]
	subs r0, #1
	mov r8, r0
	subs r0, r6, #1
	str r0, [sp]
	mov r1, r8
	cmp r1, #0
	blt _0801A9A0
	lsls r5, r6, #2
	lsls r0, r6, #0x10
	asrs r6, r0, #0x10
_0801A944:
	ldr r0, _0801A9AC @ =0x0202E3E0
	ldr r0, [r0]
	adds r0, r5, r0
	ldr r0, [r0]
	add r0, r8
	ldrb r0, [r0]
	cmp r0, #0x78
	bhi _0801A994
	ldr r0, _0801A9B0 @ =0x0202E3D8
	ldr r0, [r0]
	adds r0, r5, r0
	ldr r0, [r0]
	add r0, r8
	ldrb r0, [r0]
	cmp r0, #0
	bne _0801A994
	ldr r0, _0801A9B4 @ =0x0202E3F0
	ldr r0, [r0]
	adds r0, r5, r0
	ldr r0, [r0]
	add r0, r8
	ldrb r0, [r0]
	cmp r0, #0
	bne _0801A994
	mov r2, r8
	lsls r4, r2, #0x10
	asrs r4, r4, #0x10
	adds r0, r4, #0
	adds r1, r6, #0
	movs r2, #1
	movs r3, #1
	bl sub_0801A6B4
	adds r0, r4, #0
	adds r1, r6, #0
	movs r2, #0
	movs r3, #1
	rsbs r3, r3, #0
	bl sub_0801A6B4
_0801A994:
	movs r0, #1
	rsbs r0, r0, #0
	add r8, r0
	mov r1, r8
	cmp r1, #0
	bge _0801A944
_0801A9A0:
	ldr r6, [sp]
	cmp r6, #0
	bge _0801A92A
	b _0801AF52
	.align 2, 0
_0801A9A8: .4byte 0x0202E3D4
_0801A9AC: .4byte 0x0202E3E0
_0801A9B0: .4byte 0x0202E3D8
_0801A9B4: .4byte 0x0202E3F0
_0801A9B8:
	ldr r0, _0801AA44 @ =0x0202E3D4
	movs r2, #2
	ldrsh r0, [r0, r2]
	subs r6, r0, #1
	cmp r6, #0
	bge _0801A9C6
	b _0801AF52
_0801A9C6:
	ldr r0, _0801AA44 @ =0x0202E3D4
	movs r1, #0
	ldrsh r0, [r0, r1]
	subs r0, #1
	mov r8, r0
	subs r2, r6, #1
	str r2, [sp]
	cmp r0, #0
	blt _0801AA3A
	lsls r5, r6, #2
	lsls r0, r6, #0x10
	asrs r6, r0, #0x10
_0801A9DE:
	ldr r0, _0801AA48 @ =0x0202E3E0
	ldr r0, [r0]
	adds r0, r5, r0
	ldr r0, [r0]
	add r0, r8
	ldrb r0, [r0]
	cmp r0, #0x78
	bhi _0801AA2E
	ldr r0, _0801AA4C @ =0x0202E3D8
	ldr r0, [r0]
	adds r0, r5, r0
	ldr r0, [r0]
	add r0, r8
	ldrb r0, [r0]
	cmp r0, #0
	bne _0801AA2E
	ldr r0, _0801AA50 @ =0x0202E3F0
	ldr r0, [r0]
	adds r0, r5, r0
	ldr r0, [r0]
	add r0, r8
	ldrb r0, [r0]
	cmp r0, #0
	bne _0801AA2E
	mov r0, r8
	lsls r4, r0, #0x10
	asrs r4, r4, #0x10
	adds r0, r4, #0
	adds r1, r6, #0
	movs r2, #2
	movs r3, #1
	bl sub_0801A6B4
	adds r0, r4, #0
	adds r1, r6, #0
	movs r2, #0
	movs r3, #1
	rsbs r3, r3, #0
	bl sub_0801A6B4
_0801AA2E:
	movs r1, #1
	rsbs r1, r1, #0
	add r8, r1
	mov r2, r8
	cmp r2, #0
	bge _0801A9DE
_0801AA3A:
	ldr r6, [sp]
	cmp r6, #0
	bge _0801A9C6
	b _0801AF52
	.align 2, 0
_0801AA44: .4byte 0x0202E3D4
_0801AA48: .4byte 0x0202E3E0
_0801AA4C: .4byte 0x0202E3D8
_0801AA50: .4byte 0x0202E3F0
_0801AA54:
	ldr r0, _0801AAE0 @ =0x0202E3D4
	movs r1, #2
	ldrsh r0, [r0, r1]
	subs r6, r0, #1
	cmp r6, #0
	bge _0801AA62
	b _0801AF52
_0801AA62:
	ldr r0, _0801AAE0 @ =0x0202E3D4
	movs r2, #0
	ldrsh r0, [r0, r2]
	subs r0, #1
	mov r8, r0
	subs r0, r6, #1
	str r0, [sp]
	mov r1, r8
	cmp r1, #0
	blt _0801AAD8
	lsls r5, r6, #2
	lsls r0, r6, #0x10
	asrs r6, r0, #0x10
_0801AA7C:
	ldr r0, _0801AAE4 @ =0x0202E3E0
	ldr r0, [r0]
	adds r0, r5, r0
	ldr r0, [r0]
	add r0, r8
	ldrb r0, [r0]
	cmp r0, #0x78
	bhi _0801AACC
	ldr r0, _0801AAE8 @ =0x0202E3D8
	ldr r0, [r0]
	adds r0, r5, r0
	ldr r0, [r0]
	add r0, r8
	ldrb r0, [r0]
	cmp r0, #0
	bne _0801AACC
	ldr r0, _0801AAEC @ =0x0202E3F0
	ldr r0, [r0]
	adds r0, r5, r0
	ldr r0, [r0]
	add r0, r8
	ldrb r0, [r0]
	cmp r0, #0
	bne _0801AACC
	mov r2, r8
	lsls r4, r2, #0x10
	asrs r4, r4, #0x10
	adds r0, r4, #0
	adds r1, r6, #0
	movs r2, #3
	movs r3, #1
	bl sub_0801A6B4
	adds r0, r4, #0
	adds r1, r6, #0
	movs r2, #0
	movs r3, #1
	rsbs r3, r3, #0
	bl sub_0801A6B4
_0801AACC:
	movs r0, #1
	rsbs r0, r0, #0
	add r8, r0
	mov r1, r8
	cmp r1, #0
	bge _0801AA7C
_0801AAD8:
	ldr r6, [sp]
	cmp r6, #0
	bge _0801AA62
	b _0801AF52
	.align 2, 0
_0801AAE0: .4byte 0x0202E3D4
_0801AAE4: .4byte 0x0202E3E0
_0801AAE8: .4byte 0x0202E3D8
_0801AAEC: .4byte 0x0202E3F0
_0801AAF0:
	ldr r0, _0801AB7C @ =0x0202E3D4
	movs r2, #2
	ldrsh r0, [r0, r2]
	subs r6, r0, #1
	cmp r6, #0
	bge _0801AAFE
	b _0801AF52
_0801AAFE:
	ldr r0, _0801AB7C @ =0x0202E3D4
	movs r1, #0
	ldrsh r0, [r0, r1]
	subs r0, #1
	mov r8, r0
	subs r2, r6, #1
	str r2, [sp]
	cmp r0, #0
	blt _0801AB72
	lsls r5, r6, #2
	lsls r0, r6, #0x10
	asrs r6, r0, #0x10
_0801AB16:
	ldr r0, _0801AB80 @ =0x0202E3E0
	ldr r0, [r0]
	adds r0, r5, r0
	ldr r0, [r0]
	add r0, r8
	ldrb r0, [r0]
	cmp r0, #0x78
	bhi _0801AB66
	ldr r0, _0801AB84 @ =0x0202E3D8
	ldr r0, [r0]
	adds r0, r5, r0
	ldr r0, [r0]
	add r0, r8
	ldrb r0, [r0]
	cmp r0, #0
	bne _0801AB66
	ldr r0, _0801AB88 @ =0x0202E3F0
	ldr r0, [r0]
	adds r0, r5, r0
	ldr r0, [r0]
	add r0, r8
	ldrb r0, [r0]
	cmp r0, #0
	bne _0801AB66
	mov r0, r8
	lsls r4, r0, #0x10
	asrs r4, r4, #0x10
	adds r0, r4, #0
	adds r1, r6, #0
	movs r2, #2
	movs r3, #1
	bl sub_0801A6B4
	adds r0, r4, #0
	adds r1, r6, #0
	movs r2, #1
	movs r3, #1
	rsbs r3, r3, #0
	bl sub_0801A6B4
_0801AB66:
	movs r1, #1
	rsbs r1, r1, #0
	add r8, r1
	mov r2, r8
	cmp r2, #0
	bge _0801AB16
_0801AB72:
	ldr r6, [sp]
	cmp r6, #0
	bge _0801AAFE
	b _0801AF52
	.align 2, 0
_0801AB7C: .4byte 0x0202E3D4
_0801AB80: .4byte 0x0202E3E0
_0801AB84: .4byte 0x0202E3D8
_0801AB88: .4byte 0x0202E3F0
_0801AB8C:
	ldr r0, _0801AC18 @ =0x0202E3D4
	movs r1, #2
	ldrsh r0, [r0, r1]
	subs r6, r0, #1
	cmp r6, #0
	bge _0801AB9A
	b _0801AF52
_0801AB9A:
	ldr r0, _0801AC18 @ =0x0202E3D4
	movs r2, #0
	ldrsh r0, [r0, r2]
	subs r0, #1
	mov r8, r0
	subs r0, r6, #1
	str r0, [sp]
	mov r1, r8
	cmp r1, #0
	blt _0801AC10
	lsls r5, r6, #2
	lsls r0, r6, #0x10
	asrs r6, r0, #0x10
_0801ABB4:
	ldr r0, _0801AC1C @ =0x0202E3E0
	ldr r0, [r0]
	adds r0, r5, r0
	ldr r0, [r0]
	add r0, r8
	ldrb r0, [r0]
	cmp r0, #0x78
	bhi _0801AC04
	ldr r0, _0801AC20 @ =0x0202E3D8
	ldr r0, [r0]
	adds r0, r5, r0
	ldr r0, [r0]
	add r0, r8
	ldrb r0, [r0]
	cmp r0, #0
	bne _0801AC04
	ldr r0, _0801AC24 @ =0x0202E3F0
	ldr r0, [r0]
	adds r0, r5, r0
	ldr r0, [r0]
	add r0, r8
	ldrb r0, [r0]
	cmp r0, #0
	bne _0801AC04
	mov r2, r8
	lsls r4, r2, #0x10
	asrs r4, r4, #0x10
	adds r0, r4, #0
	adds r1, r6, #0
	movs r2, #3
	movs r3, #1
	bl sub_0801A6B4
	adds r0, r4, #0
	adds r1, r6, #0
	movs r2, #1
	movs r3, #1
	rsbs r3, r3, #0
	bl sub_0801A6B4
_0801AC04:
	movs r0, #1
	rsbs r0, r0, #0
	add r8, r0
	mov r1, r8
	cmp r1, #0
	bge _0801ABB4
_0801AC10:
	ldr r6, [sp]
	cmp r6, #0
	bge _0801AB9A
	b _0801AF52
	.align 2, 0
_0801AC18: .4byte 0x0202E3D4
_0801AC1C: .4byte 0x0202E3E0
_0801AC20: .4byte 0x0202E3D8
_0801AC24: .4byte 0x0202E3F0
_0801AC28:
	ldr r0, _0801ACB4 @ =0x0202E3D4
	movs r2, #2
	ldrsh r0, [r0, r2]
	subs r6, r0, #1
	cmp r6, #0
	bge _0801AC36
	b _0801AF52
_0801AC36:
	ldr r0, _0801ACB4 @ =0x0202E3D4
	movs r1, #0
	ldrsh r0, [r0, r1]
	subs r0, #1
	mov r8, r0
	subs r2, r6, #1
	str r2, [sp]
	cmp r0, #0
	blt _0801ACAA
	lsls r5, r6, #2
	lsls r0, r6, #0x10
	asrs r6, r0, #0x10
_0801AC4E:
	ldr r0, _0801ACB8 @ =0x0202E3E0
	ldr r0, [r0]
	adds r0, r5, r0
	ldr r0, [r0]
	add r0, r8
	ldrb r0, [r0]
	cmp r0, #0x78
	bhi _0801AC9E
	ldr r0, _0801ACBC @ =0x0202E3D8
	ldr r0, [r0]
	adds r0, r5, r0
	ldr r0, [r0]
	add r0, r8
	ldrb r0, [r0]
	cmp r0, #0
	bne _0801AC9E
	ldr r0, _0801ACC0 @ =0x0202E3F0
	ldr r0, [r0]
	adds r0, r5, r0
	ldr r0, [r0]
	add r0, r8
	ldrb r0, [r0]
	cmp r0, #0
	bne _0801AC9E
	mov r0, r8
	lsls r4, r0, #0x10
	asrs r4, r4, #0x10
	adds r0, r4, #0
	adds r1, r6, #0
	movs r2, #3
	movs r3, #1
	bl sub_0801A6B4
	adds r0, r4, #0
	adds r1, r6, #0
	movs r2, #2
	movs r3, #1
	rsbs r3, r3, #0
	bl sub_0801A6B4
_0801AC9E:
	movs r1, #1
	rsbs r1, r1, #0
	add r8, r1
	mov r2, r8
	cmp r2, #0
	bge _0801AC4E
_0801ACAA:
	ldr r6, [sp]
	cmp r6, #0
	bge _0801AC36
	b _0801AF52
	.align 2, 0
_0801ACB4: .4byte 0x0202E3D4
_0801ACB8: .4byte 0x0202E3E0
_0801ACBC: .4byte 0x0202E3D8
_0801ACC0: .4byte 0x0202E3F0
_0801ACC4:
	ldr r0, _0801AD50 @ =0x0202E3D4
	movs r1, #2
	ldrsh r0, [r0, r1]
	subs r6, r0, #1
	cmp r6, #0
	bge _0801ACD2
	b _0801AF52
_0801ACD2:
	ldr r0, _0801AD50 @ =0x0202E3D4
	movs r2, #0
	ldrsh r0, [r0, r2]
	subs r0, #1
	mov r8, r0
	subs r0, r6, #1
	str r0, [sp]
	mov r1, r8
	cmp r1, #0
	blt _0801AD48
	lsls r5, r6, #2
	lsls r0, r6, #0x10
	asrs r6, r0, #0x10
_0801ACEC:
	ldr r0, _0801AD54 @ =0x0202E3E0
	ldr r0, [r0]
	adds r0, r5, r0
	ldr r0, [r0]
	add r0, r8
	ldrb r0, [r0]
	cmp r0, #0x78
	bhi _0801AD3C
	ldr r0, _0801AD58 @ =0x0202E3D8
	ldr r0, [r0]
	adds r0, r5, r0
	ldr r0, [r0]
	add r0, r8
	ldrb r0, [r0]
	cmp r0, #0
	bne _0801AD3C
	ldr r0, _0801AD5C @ =0x0202E3F0
	ldr r0, [r0]
	adds r0, r5, r0
	ldr r0, [r0]
	add r0, r8
	ldrb r0, [r0]
	cmp r0, #0
	bne _0801AD3C
	mov r2, r8
	lsls r4, r2, #0x10
	asrs r4, r4, #0x10
	adds r0, r4, #0
	adds r1, r6, #0
	movs r2, #0xa
	movs r3, #1
	bl sub_0801A6B4
	adds r0, r4, #0
	adds r1, r6, #0
	movs r2, #2
	movs r3, #1
	rsbs r3, r3, #0
	bl sub_0801A6B4
_0801AD3C:
	movs r0, #1
	rsbs r0, r0, #0
	add r8, r0
	mov r1, r8
	cmp r1, #0
	bge _0801ACEC
_0801AD48:
	ldr r6, [sp]
	cmp r6, #0
	bge _0801ACD2
	b _0801AF52
	.align 2, 0
_0801AD50: .4byte 0x0202E3D4
_0801AD54: .4byte 0x0202E3E0
_0801AD58: .4byte 0x0202E3D8
_0801AD5C: .4byte 0x0202E3F0
_0801AD60:
	ldr r0, _0801AE04 @ =0x0202E3D4
	movs r2, #2
	ldrsh r0, [r0, r2]
	subs r6, r0, #1
	cmp r6, #0
	bge _0801AD6E
	b _0801AF52
_0801AD6E:
	ldr r0, _0801AE04 @ =0x0202E3D4
	movs r1, #0
	ldrsh r0, [r0, r1]
	subs r0, #1
	mov r8, r0
	subs r2, r6, #1
	str r2, [sp]
	cmp r0, #0
	blt _0801ADFC
	lsls r7, r6, #2
	lsls r0, r6, #0x10
	asrs r5, r0, #0x10
_0801AD86:
	ldr r0, _0801AE08 @ =0x0202E3E0
	ldr r0, [r0]
	adds r0, r7, r0
	ldr r0, [r0]
	add r0, r8
	ldrb r0, [r0]
	cmp r0, #0x78
	bhi _0801ADF0
	ldr r0, _0801AE0C @ =0x0202E3D8
	ldr r0, [r0]
	adds r0, r7, r0
	ldr r0, [r0]
	add r0, r8
	ldrb r0, [r0]
	cmp r0, #0
	bne _0801ADF0
	ldr r0, _0801AE10 @ =0x0202E3F0
	ldr r0, [r0]
	adds r0, r7, r0
	ldr r0, [r0]
	add r0, r8
	ldrb r0, [r0]
	cmp r0, #0
	bne _0801ADF0
	mov r0, r8
	lsls r4, r0, #0x10
	asrs r4, r4, #0x10
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #1
	movs r3, #1
	bl sub_0801A6B4
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #0
	movs r3, #1
	rsbs r3, r3, #0
	bl sub_0801A6B4
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #3
	movs r3, #1
	bl sub_0801A6B4
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #2
	movs r3, #1
	rsbs r3, r3, #0
	bl sub_0801A6B4
_0801ADF0:
	movs r1, #1
	rsbs r1, r1, #0
	add r8, r1
	mov r2, r8
	cmp r2, #0
	bge _0801AD86
_0801ADFC:
	ldr r6, [sp]
	cmp r6, #0
	bge _0801AD6E
	b _0801AF52
	.align 2, 0
_0801AE04: .4byte 0x0202E3D4
_0801AE08: .4byte 0x0202E3E0
_0801AE0C: .4byte 0x0202E3D8
_0801AE10: .4byte 0x0202E3F0
_0801AE14:
	ldr r0, _0801AEBC @ =0x0202E3D4
	movs r1, #2
	ldrsh r0, [r0, r1]
	subs r6, r0, #1
	cmp r6, #0
	bge _0801AE22
	b _0801AF52
_0801AE22:
	ldr r0, _0801AEBC @ =0x0202E3D4
	movs r2, #0
	ldrsh r0, [r0, r2]
	subs r0, #1
	mov r8, r0
	subs r0, r6, #1
	str r0, [sp]
	mov r1, r8
	cmp r1, #0
	blt _0801AEB2
	lsls r7, r6, #2
	lsls r0, r6, #0x10
	asrs r5, r0, #0x10
_0801AE3C:
	ldr r0, _0801AEC0 @ =0x0202E3E0
	ldr r0, [r0]
	adds r0, r7, r0
	ldr r0, [r0]
	add r0, r8
	ldrb r0, [r0]
	cmp r0, #0x78
	bhi _0801AEA6
	ldr r0, _0801AEC4 @ =0x0202E3D8
	ldr r0, [r0]
	adds r0, r7, r0
	ldr r0, [r0]
	add r0, r8
	ldrb r0, [r0]
	cmp r0, #0
	bne _0801AEA6
	ldr r0, _0801AEC8 @ =0x0202E3F0
	ldr r0, [r0]
	adds r0, r7, r0
	ldr r0, [r0]
	add r0, r8
	ldrb r0, [r0]
	cmp r0, #0
	bne _0801AEA6
	mov r2, r8
	lsls r4, r2, #0x10
	asrs r4, r4, #0x10
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #1
	movs r3, #1
	bl sub_0801A6B4
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #0
	movs r3, #1
	rsbs r3, r3, #0
	bl sub_0801A6B4
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #0xa
	movs r3, #1
	bl sub_0801A6B4
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #2
	movs r3, #1
	rsbs r3, r3, #0
	bl sub_0801A6B4
_0801AEA6:
	movs r0, #1
	rsbs r0, r0, #0
	add r8, r0
	mov r1, r8
	cmp r1, #0
	bge _0801AE3C
_0801AEB2:
	ldr r6, [sp]
	cmp r6, #0
	bge _0801AE22
	b _0801AF52
	.align 2, 0
_0801AEBC: .4byte 0x0202E3D4
_0801AEC0: .4byte 0x0202E3E0
_0801AEC4: .4byte 0x0202E3D8
_0801AEC8: .4byte 0x0202E3F0
_0801AECC:
	ldr r0, _0801B02C @ =0x0202E3D4
	movs r2, #2
	ldrsh r0, [r0, r2]
	subs r6, r0, #1
	cmp r6, #0
	blt _0801AF52
_0801AED8:
	ldr r0, _0801B02C @ =0x0202E3D4
	movs r1, #0
	ldrsh r0, [r0, r1]
	subs r0, #1
	mov r8, r0
	subs r2, r6, #1
	str r2, [sp]
	cmp r0, #0
	blt _0801AF4C
	lsls r5, r6, #2
	lsls r0, r6, #0x10
	asrs r6, r0, #0x10
_0801AEF0:
	ldr r0, _0801B030 @ =0x0202E3E0
	ldr r0, [r0]
	adds r0, r5, r0
	ldr r0, [r0]
	add r0, r8
	ldrb r0, [r0]
	cmp r0, #0x78
	bhi _0801AF40
	ldr r0, _0801B034 @ =0x0202E3D8
	ldr r0, [r0]
	adds r0, r5, r0
	ldr r0, [r0]
	add r0, r8
	ldrb r0, [r0]
	cmp r0, #0
	bne _0801AF40
	ldr r0, _0801B038 @ =0x0202E3F0
	ldr r0, [r0]
	adds r0, r5, r0
	ldr r0, [r0]
	add r0, r8
	ldrb r0, [r0]
	cmp r0, #0
	bne _0801AF40
	mov r0, r8
	lsls r4, r0, #0x10
	asrs r4, r4, #0x10
	adds r0, r4, #0
	adds r1, r6, #0
	movs r2, #0xa
	movs r3, #1
	bl sub_0801A6B4
	adds r0, r4, #0
	adds r1, r6, #0
	movs r2, #0
	movs r3, #1
	rsbs r3, r3, #0
	bl sub_0801A6B4
_0801AF40:
	movs r1, #1
	rsbs r1, r1, #0
	add r8, r1
	mov r2, r8
	cmp r2, #0
	bge _0801AEF0
_0801AF4C:
	ldr r6, [sp]
	cmp r6, #0
	bge _0801AED8
_0801AF52:
	mov r1, sb
	ldr r0, [r1]
	ldr r1, [r1, #4]
	ldr r0, [r0, #0x28]
	ldr r1, [r1, #0x28]
	orrs r0, r1
	movs r1, #0x80
	ands r0, r1
	cmp r0, #0
	beq _0801B014
	ldr r0, _0801B02C @ =0x0202E3D4
	movs r2, #2
	ldrsh r0, [r0, r2]
	subs r6, r0, #1
	cmp r6, #0
	blt _0801B014
_0801AF72:
	ldr r0, _0801B02C @ =0x0202E3D4
	movs r1, #0
	ldrsh r0, [r0, r1]
	subs r0, #1
	mov r8, r0
	subs r2, r6, #1
	str r2, [sp]
	cmp r0, #0
	blt _0801B00E
	lsls r0, r6, #2
	mov sb, r0
	lsls r0, r6, #0x10
	asrs r0, r0, #0x10
	mov sl, r0
_0801AF8E:
	ldr r0, _0801B030 @ =0x0202E3E0
	ldr r0, [r0]
	add r0, sb
	ldr r0, [r0]
	add r0, r8
	ldrb r0, [r0]
	cmp r0, #0x78
	bhi _0801B002
	ldr r0, _0801B034 @ =0x0202E3D8
	ldr r0, [r0]
	add r0, sb
	ldr r0, [r0]
	add r0, r8
	ldrb r0, [r0]
	cmp r0, #0
	bne _0801B002
	ldr r0, _0801B038 @ =0x0202E3F0
	ldr r0, [r0]
	add r0, sb
	ldr r0, [r0]
	add r0, r8
	ldrb r0, [r0]
	cmp r0, #0
	bne _0801B002
	mov r0, r8
	adds r1, r6, #0
	bl sub_08034BA0
	adds r7, r0, #0
	cmp r7, #0
	beq _0801B002
	mov r1, r8
	lsls r5, r1, #0x10
	asrs r5, r5, #0x10
	bl sub_08017774
	adds r4, r0, #0
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	adds r0, r7, #0
	bl sub_0801778C
	adds r2, r0, #0
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	adds r0, r5, #0
	mov r1, sl
	movs r3, #1
	bl sub_0801A6B4
	subs r4, #1
	adds r0, r5, #0
	mov r1, sl
	adds r2, r4, #0
	movs r3, #1
	rsbs r3, r3, #0
	bl sub_0801A6B4
_0801B002:
	movs r2, #1
	rsbs r2, r2, #0
	add r8, r2
	mov r0, r8
	cmp r0, #0
	bge _0801AF8E
_0801B00E:
	ldr r6, [sp]
	cmp r6, #0
	bge _0801AF72
_0801B014:
	ldr r2, _0801B030 @ =0x0202E3E0
	ldr r1, [r2]
	ldr r0, _0801B03C @ =0x03004100
	str r1, [r0]
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0801B02C: .4byte 0x0202E3D4
_0801B030: .4byte 0x0202E3E0
_0801B034: .4byte 0x0202E3D8
_0801B038: .4byte 0x0202E3F0
_0801B03C: .4byte 0x03004100

	thumb_func_start sub_0801B040
sub_0801B040: @ 0x0801B040
	push {r4, r5, lr}
	adds r2, r0, #0
	movs r4, #0x10
	ldrsb r4, [r2, r4]
	movs r5, #0x11
	ldrsb r5, [r2, r5]
	subs r0, r1, #1
	cmp r0, #0x1f
	bls _0801B054
	b _0801B1E8
_0801B054:
	lsls r0, r0, #2
	ldr r1, _0801B060 @ =_0801B064
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0801B060: .4byte _0801B064
_0801B064: @ jump table
	.4byte _0801B0E4 @ case 0
	.4byte _0801B0FC @ case 1
	.4byte _0801B0EC @ case 2
	.4byte _0801B124 @ case 3
	.4byte _0801B14C @ case 4
	.4byte _0801B110 @ case 5
	.4byte _0801B0F4 @ case 6
	.4byte _0801B1E8 @ case 7
	.4byte _0801B1E8 @ case 8
	.4byte _0801B1E8 @ case 9
	.4byte _0801B1E8 @ case 10
	.4byte _0801B138 @ case 11
	.4byte _0801B17A @ case 12
	.4byte _0801B1E8 @ case 13
	.4byte _0801B1A8 @ case 14
	.4byte _0801B1E8 @ case 15
	.4byte _0801B1E8 @ case 16
	.4byte _0801B1E8 @ case 17
	.4byte _0801B1E8 @ case 18
	.4byte _0801B1E8 @ case 19
	.4byte _0801B1E8 @ case 20
	.4byte _0801B1E8 @ case 21
	.4byte _0801B1E8 @ case 22
	.4byte _0801B1E8 @ case 23
	.4byte _0801B1E8 @ case 24
	.4byte _0801B1E8 @ case 25
	.4byte _0801B1E8 @ case 26
	.4byte _0801B1E8 @ case 27
	.4byte _0801B1E8 @ case 28
	.4byte _0801B1E8 @ case 29
	.4byte _0801B1E8 @ case 30
	.4byte _0801B1C4 @ case 31
_0801B0E4:
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #1
	b _0801B1AE
_0801B0EC:
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #2
	b _0801B1AE
_0801B0F4:
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #3
	b _0801B1AE
_0801B0FC:
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #2
	movs r3, #1
	bl sub_0801A6B4
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #1
	b _0801B1BA
_0801B110:
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #3
	movs r3, #1
	bl sub_0801A6B4
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #1
	b _0801B1BA
_0801B124:
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #3
	movs r3, #1
	bl sub_0801A6B4
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #2
	b _0801B1BA
_0801B138:
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #0xa
	movs r3, #1
	bl sub_0801A6B4
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #2
	b _0801B1BA
_0801B14C:
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #1
	movs r3, #1
	bl sub_0801A6B4
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #0
	movs r3, #1
	rsbs r3, r3, #0
	bl sub_0801A6B4
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #3
	movs r3, #1
	bl sub_0801A6B4
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #2
	b _0801B1BA
_0801B17A:
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #1
	movs r3, #1
	bl sub_0801A6B4
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #0
	movs r3, #1
	rsbs r3, r3, #0
	bl sub_0801A6B4
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #0xa
	movs r3, #1
	bl sub_0801A6B4
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #2
	b _0801B1BA
_0801B1A8:
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #0xa
_0801B1AE:
	movs r3, #1
	bl sub_0801A6B4
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #0
_0801B1BA:
	movs r3, #1
	rsbs r3, r3, #0
	bl sub_0801A6B4
	b _0801B1E8
_0801B1C4:
	adds r0, r2, #0
	bl GetUnitMagBy2Range
	adds r2, r0, #0
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	adds r0, r4, #0
	adds r1, r5, #0
	movs r3, #1
	bl sub_0801A6B4
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #0
	movs r3, #1
	rsbs r3, r3, #0
	bl sub_0801A6B4
_0801B1E8:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_0801B1F0
sub_0801B1F0: @ 0x0801B1F0
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	adds r4, r0, #0
	bl sub_08017420
	adds r5, r0, #0
	adds r0, r4, #0
	bl GetUnitMagBy2Range
	adds r2, r0, #0
	cmp r5, #3
	beq _0801B2B0
	cmp r5, #3
	bgt _0801B218
	cmp r5, #1
	beq _0801B220
	b _0801B3CA
_0801B218:
	cmp r5, #0x20
	bne _0801B21E
	b _0801B340
_0801B21E:
	b _0801B3CA
_0801B220:
	ldr r0, _0801B2A0 @ =0x0202E3D4
	movs r1, #2
	ldrsh r0, [r0, r1]
	subs r1, r0, #1
	cmp r1, #0
	bge _0801B22E
	b _0801B3CA
_0801B22E:
	ldr r0, _0801B2A0 @ =0x0202E3D4
	movs r2, #0
	ldrsh r0, [r0, r2]
	subs r5, r0, #1
	subs r3, r1, #1
	mov r8, r3
	cmp r5, #0
	blt _0801B298
	lsls r6, r1, #2
	lsls r0, r1, #0x10
	asrs r7, r0, #0x10
_0801B244:
	ldr r0, _0801B2A4 @ =0x0202E3E0
	ldr r0, [r0]
	adds r0, r6, r0
	ldr r0, [r0]
	adds r0, r0, r5
	ldrb r0, [r0]
	cmp r0, #0x78
	bhi _0801B292
	ldr r0, _0801B2A8 @ =0x0202E3D8
	ldr r0, [r0]
	adds r0, r6, r0
	ldr r0, [r0]
	adds r0, r0, r5
	ldrb r0, [r0]
	cmp r0, #0
	bne _0801B292
	ldr r0, _0801B2AC @ =0x0202E3F0
	ldr r0, [r0]
	adds r0, r6, r0
	ldr r0, [r0]
	adds r0, r0, r5
	ldrb r0, [r0]
	cmp r0, #0
	bne _0801B292
	lsls r4, r5, #0x10
	asrs r4, r4, #0x10
	adds r0, r4, #0
	adds r1, r7, #0
	movs r2, #1
	movs r3, #1
	bl sub_0801A6B4
	adds r0, r4, #0
	adds r1, r7, #0
	movs r2, #0
	movs r3, #1
	rsbs r3, r3, #0
	bl sub_0801A6B4
_0801B292:
	subs r5, #1
	cmp r5, #0
	bge _0801B244
_0801B298:
	mov r1, r8
	cmp r1, #0
	bge _0801B22E
	b _0801B3CA
	.align 2, 0
_0801B2A0: .4byte 0x0202E3D4
_0801B2A4: .4byte 0x0202E3E0
_0801B2A8: .4byte 0x0202E3D8
_0801B2AC: .4byte 0x0202E3F0
_0801B2B0:
	ldr r0, _0801B330 @ =0x0202E3D4
	movs r1, #2
	ldrsh r0, [r0, r1]
	subs r1, r0, #1
	cmp r1, #0
	bge _0801B2BE
	b _0801B3CA
_0801B2BE:
	ldr r0, _0801B330 @ =0x0202E3D4
	movs r2, #0
	ldrsh r0, [r0, r2]
	subs r5, r0, #1
	subs r3, r1, #1
	mov r8, r3
	cmp r5, #0
	blt _0801B328
	lsls r6, r1, #2
	lsls r0, r1, #0x10
	asrs r7, r0, #0x10
_0801B2D4:
	ldr r0, _0801B334 @ =0x0202E3E0
	ldr r0, [r0]
	adds r0, r6, r0
	ldr r0, [r0]
	adds r0, r0, r5
	ldrb r0, [r0]
	cmp r0, #0x78
	bhi _0801B322
	ldr r0, _0801B338 @ =0x0202E3D8
	ldr r0, [r0]
	adds r0, r6, r0
	ldr r0, [r0]
	adds r0, r0, r5
	ldrb r0, [r0]
	cmp r0, #0
	bne _0801B322
	ldr r0, _0801B33C @ =0x0202E3F0
	ldr r0, [r0]
	adds r0, r6, r0
	ldr r0, [r0]
	adds r0, r0, r5
	ldrb r0, [r0]
	cmp r0, #0
	bne _0801B322
	lsls r4, r5, #0x10
	asrs r4, r4, #0x10
	adds r0, r4, #0
	adds r1, r7, #0
	movs r2, #2
	movs r3, #1
	bl sub_0801A6B4
	adds r0, r4, #0
	adds r1, r7, #0
	movs r2, #0
	movs r3, #1
	rsbs r3, r3, #0
	bl sub_0801A6B4
_0801B322:
	subs r5, #1
	cmp r5, #0
	bge _0801B2D4
_0801B328:
	mov r1, r8
	cmp r1, #0
	bge _0801B2BE
	b _0801B3CA
	.align 2, 0
_0801B330: .4byte 0x0202E3D4
_0801B334: .4byte 0x0202E3E0
_0801B338: .4byte 0x0202E3D8
_0801B33C: .4byte 0x0202E3F0
_0801B340:
	ldr r0, _0801B3D8 @ =0x0202E3D4
	movs r1, #2
	ldrsh r0, [r0, r1]
	subs r1, r0, #1
	cmp r1, #0
	blt _0801B3CA
	lsls r0, r2, #0x10
	asrs r0, r0, #0x10
	mov sl, r0
_0801B352:
	ldr r0, _0801B3D8 @ =0x0202E3D4
	movs r2, #0
	ldrsh r0, [r0, r2]
	subs r5, r0, #1
	subs r3, r1, #1
	mov r8, r3
	cmp r5, #0
	blt _0801B3C4
	lsls r6, r1, #2
	lsls r0, r1, #0x10
	asrs r7, r0, #0x10
	mov r0, sl
	lsls r0, r0, #0x10
	mov sb, r0
_0801B36E:
	ldr r0, _0801B3DC @ =0x0202E3E0
	ldr r0, [r0]
	adds r0, r6, r0
	ldr r0, [r0]
	adds r0, r0, r5
	ldrb r0, [r0]
	cmp r0, #0x78
	bhi _0801B3BE
	ldr r0, _0801B3E0 @ =0x0202E3D8
	ldr r0, [r0]
	adds r0, r6, r0
	ldr r0, [r0]
	adds r0, r0, r5
	ldrb r0, [r0]
	cmp r0, #0
	bne _0801B3BE
	ldr r0, _0801B3E4 @ =0x0202E3F0
	ldr r0, [r0]
	adds r0, r6, r0
	ldr r0, [r0]
	adds r0, r0, r5
	ldrb r0, [r0]
	cmp r0, #0
	bne _0801B3BE
	lsls r4, r5, #0x10
	asrs r4, r4, #0x10
	adds r0, r4, #0
	adds r1, r7, #0
	mov r3, sb
	asrs r2, r3, #0x10
	movs r3, #1
	bl sub_0801A6B4
	adds r0, r4, #0
	adds r1, r7, #0
	movs r2, #0
	movs r3, #1
	rsbs r3, r3, #0
	bl sub_0801A6B4
_0801B3BE:
	subs r5, #1
	cmp r5, #0
	bge _0801B36E
_0801B3C4:
	mov r1, r8
	cmp r1, #0
	bge _0801B352
_0801B3CA:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0801B3D8: .4byte 0x0202E3D4
_0801B3DC: .4byte 0x0202E3E0
_0801B3E0: .4byte 0x0202E3D8
_0801B3E4: .4byte 0x0202E3F0

	thumb_func_start sub_0801B3E8
sub_0801B3E8: @ 0x0801B3E8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp]
	movs r0, #1
	rsbs r0, r0, #0
	mov sl, r0
	ldr r0, _0801B418 @ =0x0202E3E4
	ldr r0, [r0]
	movs r1, #0
	bl BmMapFillg
	bl GetActiveFactionOpposingAlliance
	mov sb, r0
	mov r6, sb
	adds r6, #1
	b _0801B50C
	.align 2, 0
_0801B418: .4byte 0x0202E3E4
_0801B41C:
	adds r0, r6, #0
	bl GetUnit
	adds r4, r0, #0
	cmp r4, #0
	beq _0801B508
	ldr r0, [r4]
	cmp r0, #0
	beq _0801B508
	ldr r1, [sp]
	lsls r0, r1, #0x18
	mov r8, r0
	cmp r0, #0
	beq _0801B444
	adds r0, r4, #0
	bl UnitHasMagicRank
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0801B508
_0801B444:
	ldr r0, _0801B4D4 @ =gPlaySt
	ldrb r0, [r0, #0xd]
	cmp r0, #0
	beq _0801B466
	movs r1, #0x11
	ldrsb r1, [r4, r1]
	ldr r0, _0801B4D8 @ =0x0202E3E8
	ldr r0, [r0]
	lsls r1, r1, #2
	adds r1, r1, r0
	movs r2, #0x10
	ldrsb r2, [r4, r2]
	ldr r0, [r1]
	adds r0, r0, r2
	ldrb r0, [r0]
	cmp r0, #0
	beq _0801B508
_0801B466:
	ldr r5, [r4, #0xc]
	movs r0, #0x80
	ands r5, r0
	cmp r5, #0
	bne _0801B508
	ldr r0, [r4, #4]
	ldrb r2, [r4, #0x1d]
	ldrb r0, [r0, #0x12]
	adds r1, r2, r0
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	adds r0, r4, #0
	bl sub_08019FC0
	movs r1, #0x11
	ldrsb r1, [r4, r1]
	ldr r0, _0801B4DC @ =0x0202E3D8
	ldr r0, [r0]
	lsls r1, r1, #2
	adds r1, r1, r0
	movs r2, #0x10
	ldrsb r2, [r4, r2]
	ldr r0, [r1]
	adds r0, r0, r2
	ldrb r7, [r0]
	strb r5, [r0]
	adds r0, r4, #0
	bl UnitHasMagicRank
	lsls r0, r0, #0x18
	asrs r5, r0, #0x18
	cmp sl, r5
	beq _0801B4BE
	ldr r0, _0801B4E0 @ =0x0202E3F0
	ldr r0, [r0]
	movs r1, #0
	bl BmMapFillg
	cmp r5, #0
	beq _0801B4BC
	movs r0, #1
	bl sub_0801B528
_0801B4BC:
	mov sl, r5
_0801B4BE:
	ldr r0, _0801B4E4 @ =0x0202E3E4
	ldr r1, [r0]
	ldr r0, _0801B4E8 @ =0x03004100
	str r1, [r0]
	mov r0, r8
	cmp r0, #0
	beq _0801B4EC
	adds r0, r4, #0
	bl sub_0801B1F0
	b _0801B4F2
	.align 2, 0
_0801B4D4: .4byte gPlaySt
_0801B4D8: .4byte 0x0202E3E8
_0801B4DC: .4byte 0x0202E3D8
_0801B4E0: .4byte 0x0202E3F0
_0801B4E4: .4byte 0x0202E3E4
_0801B4E8: .4byte 0x03004100
_0801B4EC:
	adds r0, r4, #0
	bl sub_0801A8B4
_0801B4F2:
	movs r1, #0x11
	ldrsb r1, [r4, r1]
	ldr r0, _0801B524 @ =0x0202E3D8
	ldr r0, [r0]
	lsls r1, r1, #2
	adds r1, r1, r0
	movs r2, #0x10
	ldrsb r2, [r4, r2]
	ldr r0, [r1]
	adds r0, r0, r2
	strb r7, [r0]
_0801B508:
	adds r6, #1
	mov r0, sb
_0801B50C:
	adds r0, #0x80
	cmp r6, r0
	bge _0801B514
	b _0801B41C
_0801B514:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0801B524: .4byte 0x0202E3D8

	thumb_func_start sub_0801B528
sub_0801B528: @ 0x0801B528
	push {r4, r5, lr}
	adds r5, r0, #0
	movs r4, #0x81
_0801B52E:
	adds r0, r4, #0
	bl GetUnit
	adds r2, r0, #0
	cmp r2, #0
	beq _0801B562
	ldr r1, [r2]
	cmp r1, #0
	beq _0801B562
	ldr r0, [r2, #4]
	ldr r1, [r1, #0x28]
	ldr r0, [r0, #0x28]
	orrs r1, r0
	movs r0, #0x80
	lsls r0, r0, #0x13
	ands r1, r0
	cmp r1, #0
	beq _0801B562
	movs r0, #0x10
	ldrsb r0, [r2, r0]
	movs r1, #0x11
	ldrsb r1, [r2, r1]
	movs r2, #0xa
	adds r3, r5, #0
	bl sub_0801A7B8
_0801B562:
	adds r4, #1
	cmp r4, #0xbf
	ble _0801B52E
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start SetWorkingBmMap
SetWorkingBmMap: @ 0x0801B570
	ldr r1, _0801B578 @ =0x03004100
	str r0, [r1]
	bx lr
	.align 2, 0
_0801B578: .4byte 0x03004100

	thumb_func_start MapAddInBoundedRange
MapAddInBoundedRange: @ 0x0801B57C
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r6, r1, #0
	adds r4, r2, #0
	adds r2, r3, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	lsls r5, r5, #0x10
	asrs r5, r5, #0x10
	lsls r6, r6, #0x10
	asrs r6, r6, #0x10
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	adds r0, r5, #0
	adds r1, r6, #0
	movs r3, #1
	bl sub_0801A6B4
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	subs r4, #1
	movs r3, #1
	rsbs r3, r3, #0
	adds r0, r5, #0
	adds r1, r6, #0
	adds r2, r4, #0
	bl sub_0801A6B4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start GetWorkingMoveCosts
GetWorkingMoveCosts: @ 0x0801B5BC
	ldr r0, _0801B5C0 @ =0x03004310
	bx lr
	.align 2, 0
_0801B5C0: .4byte 0x03004310
