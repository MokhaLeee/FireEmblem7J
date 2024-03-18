	.include "macro.inc"
	.syntax unified

	thumb_func_start SioPollingMsg
SioPollingMsg: @ 0x0803C5E4
	push {r4, r5, lr}
	ldr r4, _0803C5F8 @ =0x03004668
	ldr r3, [r4]
	cmp r3, #0
	beq _0803C600
	cmp r3, #1
	beq _0803C66C
	ldr r0, _0803C5FC @ =0x030013CC
	ldr r0, [r0]
	b _0803C6F6
	.align 2, 0
_0803C5F8: .4byte 0x03004668
_0803C5FC: .4byte 0x030013CC
_0803C600:
	ldr r0, _0803C650 @ =0x04000134
	strh r3, [r0]
	ldr r2, _0803C654 @ =0x04000128
	ldr r0, _0803C658 @ =gSioSt
	ldr r0, [r0]
	ldr r1, _0803C65C @ =0x00001B78
	adds r0, r0, r1
	ldrh r0, [r0]
	mvns r0, r0
	strh r0, [r2, #2]
	ldr r1, _0803C660 @ =0x030013C8
	movs r5, #0xc0
	lsls r5, r5, #7
	adds r0, r5, #0
	ldrb r1, [r1]
	orrs r0, r1
	strh r0, [r2]
	ldrh r0, [r2]
	adds r2, r0, #0
	movs r0, #8
	ands r0, r2
	cmp r0, #0
	beq _0803C6F2
	ldr r1, _0803C664 @ =0x030013CC
	movs r0, #4
	ands r2, r0
	lsls r0, r2, #0x10
	lsrs r0, r0, #0x10
	str r0, [r1]
	cmp r0, #0
	beq _0803C644
	movs r0, #1
	rsbs r0, r0, #0
	str r0, [r1]
_0803C644:
	ldr r0, _0803C668 @ =0x030045D8
	str r3, [r0]
	movs r0, #1
	str r0, [r4]
	b _0803C6F2
	.align 2, 0
_0803C650: .4byte 0x04000134
_0803C654: .4byte 0x04000128
_0803C658: .4byte gSioSt
_0803C65C: .4byte 0x00001B78
_0803C660: .4byte 0x030013C8
_0803C664: .4byte 0x030013CC
_0803C668: .4byte 0x030045D8
_0803C66C:
	ldr r0, _0803C6A0 @ =0x04000128
	ldrh r0, [r0]
	adds r2, r0, #0
	ldr r0, _0803C6A4 @ =0x030045D8
	ldr r0, [r0]
	ldr r3, _0803C6A8 @ =gSioSt
	cmp r0, #0
	beq _0803C6B4
	movs r0, #0x40
	ands r0, r2
	cmp r0, #0
	bne _0803C6B4
	ldr r1, [r3]
	ldr r0, _0803C6AC @ =0x0000FFFF
	ldrh r1, [r1, #0x14]
	cmp r1, r0
	beq _0803C6B4
	ldr r1, _0803C6B0 @ =0x030013CC
	movs r0, #0x30
	ands r2, r0
	lsrs r0, r2, #4
	str r0, [r1]
	movs r1, #2
	str r1, [r4]
	b _0803C6F6
	.align 2, 0
_0803C6A0: .4byte 0x04000128
_0803C6A4: .4byte 0x030045D8
_0803C6A8: .4byte gSioSt
_0803C6AC: .4byte 0x0000FFFF
_0803C6B0: .4byte 0x030013CC
_0803C6B4:
	ldr r2, _0803C6D4 @ =0x04000128
	ldr r0, [r3]
	ldr r1, _0803C6D8 @ =0x00001B78
	adds r0, r0, r1
	ldrh r0, [r0]
	mvns r0, r0
	strh r0, [r2, #2]
	ldr r0, _0803C6DC @ =0x030013CC
	ldr r0, [r0]
	cmp r0, #0
	beq _0803C6E4
	ldr r1, _0803C6E0 @ =0x030013C8
	movs r3, #0xc0
	lsls r3, r3, #7
	adds r0, r3, #0
	b _0803C6EC
	.align 2, 0
_0803C6D4: .4byte 0x04000128
_0803C6D8: .4byte 0x00001B78
_0803C6DC: .4byte 0x030013CC
_0803C6E0: .4byte 0x030013C8
_0803C6E4:
	ldr r1, _0803C6FC @ =0x030013C8
	movs r5, #0xc1
	lsls r5, r5, #7
	adds r0, r5, #0
_0803C6EC:
	ldrb r1, [r1]
	orrs r0, r1
	strh r0, [r2]
_0803C6F2:
	movs r0, #1
	rsbs r0, r0, #0
_0803C6F6:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_0803C6FC: .4byte 0x030013C8

	thumb_func_start GetSioIndex
GetSioIndex: @ 0x0803C700
	ldr r0, _0803C70C @ =0x04000128
	ldrh r1, [r0]
	movs r0, #0x30
	ands r0, r1
	lsrs r0, r0, #4
	bx lr
	.align 2, 0
_0803C70C: .4byte 0x04000128

	thumb_func_start sub_803C710
sub_803C710: @ 0x0803C710
	push {r4, r5, lr}
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	ldr r3, _0803C738 @ =gSioSt
	ldr r3, [r3]
	ldr r5, _0803C73C @ =0x00001B78
	adds r4, r3, r5
	strh r0, [r4]
	ldr r4, _0803C740 @ =0x00001B7A
	adds r0, r3, r4
	strh r1, [r0]
	adds r5, #4
	adds r3, r3, r5
	strh r2, [r3]
	ldr r0, _0803C744 @ =0x030013C8
	strb r1, [r0]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0803C738: .4byte gSioSt
_0803C73C: .4byte 0x00001B78
_0803C740: .4byte 0x00001B7A
_0803C744: .4byte 0x030013C8

	thumb_func_start sub_803C748
sub_803C748: @ 0x0803C748
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	ldr r0, _0803C898 @ =0x030045D4
	movs r3, #0
	str r3, [r0]
	ldr r2, _0803C89C @ =gSioSt
	ldr r0, [r2]
	movs r1, #0
	strh r3, [r0, #0x22]
	strh r3, [r0, #0x24]
	ldr r4, _0803C8A0 @ =0x00001B74
	adds r0, r0, r4
	strb r1, [r0]
	ldr r0, [r2]
	adds r4, #1
	adds r0, r0, r4
	strb r1, [r0]
	ldr r0, [r2]
	adds r4, #1
	adds r0, r0, r4
	strb r1, [r0]
	ldr r0, [r2]
	adds r4, #1
	adds r0, r0, r4
	strb r1, [r0]
	ldr r0, [r2]
	strb r1, [r0, #0x1e]
	ldr r0, [r2]
	strb r1, [r0, #0x1f]
	ldr r0, [r2]
	adds r0, #0x20
	strb r1, [r0]
	ldr r0, [r2]
	strh r3, [r0, #0x30]
	ldr r0, _0803C8A4 @ =0x030013D8
	mov sb, r0
	ldr r1, _0803C8A8 @ =0x030013DA
	mov r8, r1
	adds r5, r2, #0
	movs r4, #0
_0803C79C:
	ldr r0, [r5]
	adds r0, #0xb
	adds r0, r0, r3
	strb r4, [r0]
	ldr r1, [r5]
	lsls r2, r3, #1
	adds r0, r1, #0
	adds r0, #0x12
	adds r0, r0, r2
	strh r4, [r0]
	adds r1, #0x1a
	adds r1, r1, r3
	strb r4, [r1]
	ldr r0, [r5]
	adds r0, #0x26
	adds r0, r0, r2
	strh r4, [r0]
	adds r3, #1
	cmp r3, #3
	ble _0803C79C
	movs r3, #0
	ldr r5, _0803C8AC @ =0x030046D0
	movs r2, #0
	ldr r4, _0803C89C @ =gSioSt
_0803C7CC:
	adds r0, r3, r5
	strb r2, [r0]
	ldr r0, [r4]
	lsls r1, r3, #1
	adds r0, #0x32
	adds r0, r0, r1
	strh r2, [r0]
	adds r3, #1
	cmp r3, #0x7f
	ble _0803C7CC
	movs r4, #0
	ldr r5, _0803C89C @ =gSioSt
	movs r1, #0
	movs r2, #0x9a
	lsls r2, r2, #1
_0803C7EA:
	ldr r0, [r5]
	adds r0, r0, r2
	strb r1, [r0]
	strb r1, [r0, #4]
	movs r3, #0x7f
	adds r0, #0x89
_0803C7F6:
	strb r1, [r0]
	subs r0, #1
	subs r3, #1
	cmp r3, #0
	bge _0803C7F6
	adds r2, #0x8c
	adds r4, #1
	cmp r4, #0x1f
	ble _0803C7EA
	movs r4, #0
	ldr r2, _0803C89C @ =gSioSt
	mov ip, r2
	movs r5, #0
	movs r7, #0x8c
	ldr r6, _0803C8B0 @ =0x000012B4
_0803C814:
	adds r0, r4, #0
	muls r0, r7, r0
	adds r0, r0, r6
	mov r2, ip
	ldr r1, [r2]
	adds r1, r1, r0
	strb r5, [r1]
	strb r5, [r1, #4]
	adds r2, r4, #1
	movs r3, #0x7f
	adds r1, #0x89
_0803C82A:
	strb r5, [r1]
	subs r1, #1
	subs r3, #1
	cmp r3, #0
	bge _0803C82A
	adds r4, r2, #0
	cmp r4, #0xf
	ble _0803C814
	movs r0, #0
	mov r4, r8
	strh r0, [r4]
	mov r1, sb
	strh r0, [r1]
	movs r1, #0
	ldr r0, _0803C8B4 @ =0x0203C508
	movs r3, #0x80
	lsls r3, r3, #2
_0803C84C:
	strh r1, [r0]
	adds r0, #2
	subs r3, #1
	cmp r3, #0
	bne _0803C84C
	movs r4, #0
	ldr r2, _0803C8B8 @ =0x030013E0
	mov r8, r2
	movs r5, #0
	ldr r0, _0803C8BC @ =0x000001FF
	mov ip, r0
	ldr r7, _0803C8C0 @ =0x0203C908
	ldr r6, _0803C8C4 @ =0x030013E8
_0803C866:
	lsls r0, r4, #1
	mov r1, r8
	adds r2, r0, r1
	adds r1, r0, r6
	strh r5, [r1]
	strh r5, [r2]
	adds r2, r4, #1
	adds r0, r0, r7
	mov r3, ip
	adds r3, #1
_0803C87A:
	strh r5, [r0]
	adds r0, #8
	subs r3, #1
	cmp r3, #0
	bne _0803C87A
	adds r4, r2, #0
	cmp r4, #3
	ble _0803C866
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0803C898: .4byte 0x030045D4
_0803C89C: .4byte gSioSt
_0803C8A0: .4byte 0x00001B74
_0803C8A4: .4byte 0x030013D8
_0803C8A8: .4byte 0x030013DA
_0803C8AC: .4byte 0x030046D0
_0803C8B0: .4byte 0x000012B4
_0803C8B4: .4byte 0x0203C508
_0803C8B8: .4byte 0x030013E0
_0803C8BC: .4byte 0x000001FF
_0803C8C0: .4byte 0x0203C908
_0803C8C4: .4byte 0x030013E8

	thumb_func_start sub_803C8C8
sub_803C8C8: @ 0x0803C8C8
	push {r4, lr}
	ldr r2, _0803C924 @ =gSioSt
	ldr r0, [r2]
	movs r4, #0
	strb r4, [r0]
	ldr r0, [r2]
	strb r4, [r0, #1]
	ldr r1, [r2]
	movs r3, #0
	strh r4, [r1, #2]
	strh r4, [r1, #4]
	movs r0, #0xff
	strb r0, [r1, #6]
	ldr r0, [r2]
	strb r3, [r0, #7]
	ldr r0, [r2]
	strb r3, [r0, #8]
	ldr r0, [r2]
	strb r3, [r0, #9]
	ldr r0, [r2]
	strb r3, [r0, #0xf]
	ldr r0, [r2]
	strb r3, [r0, #0x10]
	ldr r0, [r2]
	strb r3, [r0, #0x11]
	ldr r0, [r2]
	adds r0, #0x2e
	strb r3, [r0]
	ldr r0, [r2]
	strb r3, [r0, #0xa]
	ldr r0, _0803C928 @ =0x00006582
	movs r1, #3
	movs r2, #0x88
	bl sub_803C710
	movs r0, #0
	bl sub_803D9B0
	bl sub_803C748
	ldr r0, _0803C92C @ =0x030013D4
	str r4, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0803C924: .4byte gSioSt
_0803C928: .4byte 0x00006582
_0803C92C: .4byte 0x030013D4

	thumb_func_start SioRegisterIrq
SioRegisterIrq: @ 0x0803C930
	push {r4, lr}
	ldr r0, _0803C980 @ =0x04000134
	movs r3, #0
	strh r3, [r0]
	ldr r2, _0803C984 @ =0x04000128
	ldr r1, _0803C988 @ =0x030013C8
	movs r4, #0x80
	lsls r4, r4, #6
	adds r0, r4, #0
	ldrb r1, [r1]
	orrs r0, r1
	strh r0, [r2]
	ldr r0, _0803C98C @ =0x0400010E
	strh r3, [r0]
	ldr r2, _0803C990 @ =0x030045D8
	ldr r1, _0803C994 @ =0x030045D4
	movs r0, #0
	str r0, [r1]
	str r0, [r2]
	ldr r1, _0803C998 @ =0x03004668
	str r0, [r1]
	ldr r1, _0803C99C @ =0x030013CC
	subs r0, #1
	str r0, [r1]
	ldr r1, _0803C9A0 @ =sub_803CA0C
	movs r0, #7
	bl SetIrqFunc
	ldr r1, _0803C9A4 @ =sub_803CD9C
	movs r0, #6
	bl SetIrqFunc
	ldr r2, _0803C9A8 @ =0x04000200
	ldrh r0, [r2]
	movs r1, #0xc0
	orrs r0, r1
	strh r0, [r2]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0803C980: .4byte 0x04000134
_0803C984: .4byte 0x04000128
_0803C988: .4byte 0x030013C8
_0803C98C: .4byte 0x0400010E
_0803C990: .4byte 0x030045D8
_0803C994: .4byte 0x030045D4
_0803C998: .4byte 0x03004668
_0803C99C: .4byte 0x030013CC
_0803C9A0: .4byte sub_803CA0C
_0803C9A4: .4byte sub_803CD9C
_0803C9A8: .4byte 0x04000200

	thumb_func_start sub_803C9AC
sub_803C9AC: @ 0x0803C9AC
	push {lr}
	ldr r1, _0803C9F0 @ =0x04000134
	movs r2, #0x80
	lsls r2, r2, #8
	adds r0, r2, #0
	strh r0, [r1]
	subs r1, #0xc
	movs r0, #0
	strh r0, [r1]
	ldr r2, _0803C9F4 @ =0x030045D8
	ldr r1, _0803C9F8 @ =0x030045D4
	movs r0, #0
	str r0, [r1]
	str r0, [r2]
	ldr r1, _0803C9FC @ =0x03004668
	str r0, [r1]
	ldr r1, _0803CA00 @ =0x030013CC
	subs r0, #1
	str r0, [r1]
	movs r0, #7
	movs r1, #0
	bl SetIrqFunc
	movs r0, #6
	movs r1, #0
	bl SetIrqFunc
	ldr r2, _0803CA04 @ =0x04000200
	ldrh r1, [r2]
	ldr r0, _0803CA08 @ =0x0000FF3F
	ands r0, r1
	strh r0, [r2]
	pop {r0}
	bx r0
	.align 2, 0
_0803C9F0: .4byte 0x04000134
_0803C9F4: .4byte 0x030045D8
_0803C9F8: .4byte 0x030045D4
_0803C9FC: .4byte 0x03004668
_0803CA00: .4byte 0x030013CC
_0803CA04: .4byte 0x04000200
_0803CA08: .4byte 0x0000FF3F

	thumb_func_start sub_803CA0C
sub_803CA0C: @ 0x0803CA0C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	movs r0, #0
	mov sb, r0
	ldr r0, _0803CAA0 @ =0x030045D8
	movs r2, #1
	str r2, [r0]
	ldr r1, _0803CAA4 @ =gSioSt
	ldr r0, [r1]
	mov r3, sb
	strb r3, [r0, #0x1e]
	ldr r0, _0803CAA8 @ =0x030045D4
	str r2, [r0]
	ldr r0, [r1]
	strb r3, [r0, #8]
	ldr r0, _0803CAAC @ =0x0400010E
	mov r5, sb
	strh r5, [r0]
	ldr r2, [r1]
	ldr r3, _0803CAB0 @ =0x04000128
	ldrh r0, [r3]
	lsls r1, r0, #0x10
	strh r0, [r2, #2]
	ldrh r0, [r2, #4]
	cmp r0, #6
	beq _0803CA50
	lsrs r0, r1, #0x14
	movs r1, #3
	ands r0, r1
	strb r0, [r2, #6]
_0803CA50:
	ldr r0, _0803CAB4 @ =0x04000120
	ldr r1, [r0, #4]
	ldr r0, [r0]
	str r0, [sp]
	str r1, [sp, #4]
	ldr r1, _0803CAB8 @ =0x030013C8
	movs r2, #0xc0
	lsls r2, r2, #7
	adds r0, r2, #0
	ldrb r1, [r1]
	orrs r0, r1
	strh r0, [r3]
	ldr r0, _0803CABC @ =0x00007FFF
	strh r0, [r3, #2]
	movs r5, #0
	ldr r3, _0803CAC0 @ =0x0000FFFF
	mov sl, r3
	mov r4, sp
	movs r7, #0
_0803CA76:
	ldrh r0, [r4]
	cmp r0, #0
	beq _0803CAC4
	cmp r0, sl
	beq _0803CAC4
	ldr r1, _0803CAA4 @ =gSioSt
	ldr r0, [r1]
	adds r0, #0xb
	adds r2, r0, r5
	ldrb r0, [r2]
	cmp r0, #0
	bne _0803CA92
	movs r0, #1
	strb r0, [r2]
_0803CA92:
	ldr r1, [r1]
	movs r0, #1
	lsls r0, r5
	ldrb r2, [r1, #8]
	orrs r0, r2
	strb r0, [r1, #8]
	b _0803CAFE
	.align 2, 0
_0803CAA0: .4byte 0x030045D8
_0803CAA4: .4byte gSioSt
_0803CAA8: .4byte 0x030045D4
_0803CAAC: .4byte 0x0400010E
_0803CAB0: .4byte 0x04000128
_0803CAB4: .4byte 0x04000120
_0803CAB8: .4byte 0x030013C8
_0803CABC: .4byte 0x00007FFF
_0803CAC0: .4byte 0x0000FFFF
_0803CAC4:
	lsls r0, r5, #0x18
	lsrs r0, r0, #0x18
	bl sub_803D1CC
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne _0803CAFE
	ldr r0, _0803CAF0 @ =gSioSt
	ldr r1, [r0]
	adds r0, r1, #0
	adds r0, #0x12
	adds r0, r0, r7
	ldrh r0, [r0]
	cmp r0, sl
	bne _0803CAF4
	adds r0, r1, #0
	adds r0, #0x1a
	adds r0, r0, r5
	ldrb r1, [r0]
	adds r1, #1
	b _0803CAFC
	.align 2, 0
_0803CAF0: .4byte gSioSt
_0803CAF4:
	adds r0, r1, #0
	adds r0, #0x1a
	adds r0, r0, r5
	movs r1, #0
_0803CAFC:
	strb r1, [r0]
_0803CAFE:
	ldr r3, _0803CB58 @ =gSioSt
	mov r8, r3
	ldr r6, [r3]
	adds r3, r6, #0
	adds r3, #0x12
	adds r3, r3, r7
	mov ip, r3
	ldr r1, _0803CB5C @ =0x0203C908
	ldr r2, _0803CB60 @ =0x030013E8
	adds r2, r7, r2
	ldrh r3, [r2]
	lsls r0, r3, #3
	adds r0, r7, r0
	adds r0, r0, r1
	ldrh r1, [r4]
	strh r1, [r0]
	ldr r0, _0803CB64 @ =0x0000FFFF
	ldrh r1, [r4]
	ands r0, r1
	mov r3, ip
	strh r0, [r3]
	ldrh r0, [r2]
	adds r0, #1
	ldr r1, _0803CB68 @ =0x000001FF
	mov ip, r1
	mov r3, ip
	ands r0, r3
	strh r0, [r2]
	adds r4, #2
	adds r7, #2
	adds r5, #1
	cmp r5, #3
	ble _0803CA76
	mov r4, r8
	adds r0, r6, #0
	ldrh r5, [r0, #4]
	cmp r5, #4
	bls _0803CC24
	ldrb r0, [r0, #1]
	cmp r0, #1
	beq _0803CB6C
	cmp r0, #3
	beq _0803CBCC
	b _0803CC24
	.align 2, 0
_0803CB58: .4byte gSioSt
_0803CB5C: .4byte 0x0203C908
_0803CB60: .4byte 0x030013E8
_0803CB64: .4byte 0x0000FFFF
_0803CB68: .4byte 0x000001FF
_0803CB6C:
	ldr r0, _0803CBB8 @ =0x030013DA
	ldr r2, _0803CBBC @ =0x030013D8
	ldrh r3, [r2]
	ldrh r0, [r0]
	cmp r0, r3
	beq _0803CB92
	ldr r1, _0803CBC0 @ =0x0203C508
	lsls r0, r3, #1
	adds r0, r0, r1
	ldrh r1, [r0]
	add r0, sp, #8
	strh r1, [r0]
	adds r1, r3, #1
	mov r3, ip
	ands r1, r3
	strh r1, [r2]
	movs r1, #1
	bl SioSend16
_0803CB92:
	ldr r1, [r4]
	movs r0, #6
	ldrsb r0, [r1, r0]
	cmp r0, #0
	bne _0803CC24
	ldr r5, _0803CBC4 @ =0x00001B7C
	adds r2, r1, r5
	ldrh r0, [r2]
	cmp r0, #0
	beq _0803CC24
	ldr r1, _0803CBC8 @ =0x0400010C
	ldrh r2, [r2]
	rsbs r0, r2, #0
	str r0, [r1]
	adds r1, #2
	movs r0, #0xc3
	strh r0, [r1]
	b _0803CC24
	.align 2, 0
_0803CBB8: .4byte 0x030013DA
_0803CBBC: .4byte 0x030013D8
_0803CBC0: .4byte 0x0203C508
_0803CBC4: .4byte 0x00001B7C
_0803CBC8: .4byte 0x0400010C
_0803CBCC:
	movs r0, #6
	ldrsb r0, [r6, r0]
	cmp r0, #0
	beq _0803CBE6
	adds r0, r6, #0
	adds r0, #0x30
	movs r1, #1
	bl SioSend16
	mov r0, r8
	ldr r1, [r0]
	ldr r0, _0803CC3C @ =0x00005FFF
	strh r0, [r1, #0x30]
_0803CBE6:
	movs r5, #0
	ldr r6, _0803CC40 @ =0x00001286
	mov r4, sp
_0803CBEC:
	lsls r0, r5, #0x18
	lsrs r0, r0, #0x18
	bl sub_803D1CC
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0803CC0A
	ldrh r1, [r4]
	cmp r1, r6
	beq _0803CC0A
	mov r0, sb
	adds r0, #1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov sb, r0
_0803CC0A:
	adds r4, #2
	adds r5, #1
	cmp r5, #3
	ble _0803CBEC
	mov r2, sb
	cmp r2, #0
	bne _0803CC24
	ldr r0, _0803CC44 @ =gSioSt
	ldr r0, [r0]
	ldr r3, _0803CC48 @ =0x00001B7E
	adds r0, r0, r3
	movs r1, #1
	strh r1, [r0]
_0803CC24:
	ldr r1, _0803CC4C @ =0x030045D4
	movs r0, #0
	str r0, [r1]
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0803CC3C: .4byte 0x00005FFF
_0803CC40: .4byte 0x00001286
_0803CC44: .4byte gSioSt
_0803CC48: .4byte 0x00001B7E
_0803CC4C: .4byte 0x030045D4

	thumb_func_start sub_803CC50
sub_803CC50: @ 0x0803CC50
	push {r4, r5, r6, lr}
	sub sp, #4
	ldr r0, _0803CC8C @ =gSioSt
	ldr r2, [r0]
	adds r5, r0, #0
	ldrh r0, [r2, #4]
	cmp r0, #4
	bhi _0803CC62
	b _0803CD90
_0803CC62:
	ldrb r0, [r2, #1]
	cmp r0, #0
	bne _0803CC6A
	b _0803CD90
_0803CC6A:
	ldrb r0, [r2, #0x1e]
	adds r0, #1
	strb r0, [r2, #0x1e]
	ldr r1, [r5]
	ldrh r0, [r1, #4]
	cmp r0, #6
	bne _0803CCF8
	adds r0, r1, #0
	adds r0, #0x21
	ldrb r0, [r0]
	cmp r0, #2
	beq _0803CCAA
	cmp r0, #2
	bgt _0803CC90
	cmp r0, #1
	beq _0803CCD0
	b _0803CCF8
	.align 2, 0
_0803CC8C: .4byte gSioSt
_0803CC90:
	cmp r0, #3
	bne _0803CCF8
	ldrb r0, [r1, #0x1e]
	cmp r0, #0x3c
	bls _0803CCAA
	movs r0, #6
	ldrsb r0, [r1, r0]
	adds r1, #0xb
	adds r1, r1, r0
	movs r0, #0
	strb r0, [r1]
	bl sub_80871AC
_0803CCAA:
	ldr r4, _0803CD1C @ =gSioSt
	ldr r0, [r4]
	ldrb r0, [r0, #1]
	cmp r0, #0
	beq _0803CCD0
	bl sub_803D214
	lsls r0, r0, #0x18
	asrs r2, r0, #0x18
	cmp r2, #0
	bne _0803CCD0
	ldr r0, [r4]
	movs r1, #6
	ldrsb r1, [r0, r1]
	adds r0, #0xb
	adds r0, r0, r1
	strb r2, [r0]
	bl sub_80871AC
_0803CCD0:
	movs r4, #0
	ldr r5, _0803CD1C @ =gSioSt
_0803CCD4:
	ldr r0, _0803CD1C @ =gSioSt
	ldr r1, [r0]
	adds r0, r1, #0
	adds r0, #0x1a
	adds r0, r0, r4
	ldrb r0, [r0]
	cmp r0, #0x3c
	bls _0803CCF2
	adds r0, r1, #0
	adds r0, #0xb
	adds r0, r0, r4
	movs r1, #0
	strb r1, [r0]
	bl sub_80871AC
_0803CCF2:
	adds r4, #1
	cmp r4, #3
	ble _0803CCD4
_0803CCF8:
	adds r4, r5, #0
	ldr r1, [r4]
	ldrb r0, [r1, #1]
	adds r6, r0, #0
	cmp r6, #1
	bne _0803CD6C
	ldrb r5, [r1, #0x10]
	cmp r5, #0
	bne _0803CD4E
	ldrb r1, [r1, #0x11]
	cmp r1, #0x3c
	bls _0803CD20
	bl sub_80871AC
	ldr r1, [r4]
	movs r0, #2
	strh r0, [r1, #4]
	b _0803CD90
	.align 2, 0
_0803CD1C: .4byte gSioSt
_0803CD20:
	mov r0, sp
	bl sub_803D6C0
	cmp r0, #0
	beq _0803CD4E
	ldr r1, [sp]
	adds r1, #6
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	bl sub_803D2E4
	lsls r0, r0, #0x10
	cmp r0, #0
	ble _0803CD4E
	ldr r0, [r4]
	strb r5, [r0, #0x10]
	ldr r1, [r4]
	ldrb r0, [r1, #0x11]
	adds r0, #1
	strb r0, [r1, #0x11]
	ldr r0, [r4]
	adds r0, #0x2e
	strb r6, [r0]
_0803CD4E:
	ldr r2, _0803CD68 @ =gSioSt
	ldr r1, [r2]
	ldrb r0, [r1, #0x10]
	adds r0, #1
	strb r0, [r1, #0x10]
	ldr r4, [r2]
	ldrb r0, [r4, #0x10]
	movs r1, #0x26
	bl __umodsi3
	strb r0, [r4, #0x10]
	b _0803CD90
	.align 2, 0
_0803CD68: .4byte gSioSt
_0803CD6C:
	subs r0, #2
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bhi _0803CD90
	movs r0, #6
	ldrsb r0, [r1, r0]
	cmp r0, #0
	bne _0803CD90
	adds r0, r1, #0
	adds r0, #0x30
	movs r1, #1
	rsbs r1, r1, #0
	bl SioSend16
	ldr r1, [r5]
	ldr r0, _0803CD98 @ =0x00005FFF
	strh r0, [r1, #0x30]
_0803CD90:
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0803CD98: .4byte 0x00005FFF

	thumb_func_start sub_803CD9C
sub_803CD9C: @ 0x0803CD9C
	ldr r1, _0803CDB4 @ =0x0400010E
	movs r0, #0
	strh r0, [r1]
	ldr r2, _0803CDB8 @ =0x04000128
	ldr r1, _0803CDBC @ =0x030013C8
	movs r3, #0xc1
	lsls r3, r3, #7
	adds r0, r3, #0
	ldrb r1, [r1]
	orrs r0, r1
	strh r0, [r2]
	bx lr
	.align 2, 0
_0803CDB4: .4byte 0x0400010E
_0803CDB8: .4byte 0x04000128
_0803CDBC: .4byte 0x030013C8

	thumb_func_start sub_803CDC0
sub_803CDC0: @ 0x0803CDC0
	push {r4, r5, lr}
	sub sp, #0x10
	adds r2, r0, #0
	mov r1, sp
	ldr r0, _0803CDF0 @ =gUnk_081D9490
	ldm r0!, {r3, r4, r5}
	stm r1!, {r3, r4, r5}
	ldr r0, [r0]
	str r0, [r1]
	ldr r0, _0803CDF4 @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0803CDE8
	lsls r0, r2, #2
	add r0, sp
	ldrh r0, [r0]
	bl m4aSongNumStart
_0803CDE8:
	add sp, #0x10
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0803CDF0: .4byte gUnk_081D9490
_0803CDF4: .4byte gPlaySt

	thumb_func_start sub_803CDF8
sub_803CDF8: @ 0x0803CDF8
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	ldr r0, _0803CE4C @ =gSioSt
	ldr r2, [r0]
	ldrb r1, [r2, #1]
	cmp r1, #1
	beq _0803CE0A
	b _0803D166
_0803CE0A:
	movs r0, #6
	ldrsb r0, [r2, r0]
	lsls r1, r0
	ldrb r0, [r2, #0xf]
	orrs r1, r0
	strb r1, [r2, #0xf]
	movs r7, #0
_0803CE18:
	lsls r4, r7, #0x18
	asrs r0, r4, #0x18
	ldr r5, _0803CE4C @ =gSioSt
	ldr r1, [r5]
	adds r1, #0x32
	bl sub_803D3DC
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	adds r1, r0, #0
	adds r2, r7, #1
	mov r8, r2
	cmp r0, #0
	bne _0803CE36
	b _0803D15E
_0803CE36:
	cmp r0, #0x16
	beq _0803CE64
	cmp r0, #0x16
	bgt _0803CE50
	cmp r0, #4
	bne _0803CE44
	b _0803CF94
_0803CE44:
	cmp r0, #0xa
	beq _0803CE64
	b _0803D15E
	.align 2, 0
_0803CE4C: .4byte gSioSt
_0803CE50:
	cmp r0, #0x2e
	beq _0803CE64
	cmp r0, #0x2e
	bgt _0803CE5E
	cmp r0, #0x2a
	beq _0803CE64
	b _0803D15E
_0803CE5E:
	cmp r1, #0x80
	beq _0803CE64
	b _0803D15E
_0803CE64:
	ldr r6, _0803CEBC @ =gSioSt
	ldr r3, [r6]
	adds r5, r3, #0
	adds r5, #0x32
	ldrb r0, [r5]
	cmp r0, #0xcc
	beq _0803CEF0
	adds r4, r7, #1
	mov r8, r4
	cmp r0, #0xcf
	beq _0803CE7C
	b _0803D15E
_0803CE7C:
	ldrb r0, [r5, #1]
	ldrb r1, [r5, #1]
	ldrb r2, [r3, #6]
	cmp r1, r2
	bne _0803CE88
	b _0803D15E
_0803CE88:
	lsls r0, r0, #1
	adds r2, r3, #0
	adds r2, #0x26
	adds r0, r2, r0
	ldrh r4, [r5, #2]
	ldrh r0, [r0]
	cmp r4, r0
	beq _0803CEC4
	ldr r0, _0803CEC0 @ =0x030046BC
	movs r1, #0xce
	strb r1, [r0]
	ldrb r3, [r3, #6]
	lsls r1, r3, #4
	ldrb r3, [r5, #1]
	orrs r1, r3
	strb r1, [r0, #1]
	ldrb r5, [r5, #1]
	lsls r1, r5, #1
	adds r1, r2, r1
	ldrh r1, [r1]
	strh r1, [r0, #2]
	movs r1, #4
	bl sub_803D2E4
	b _0803CE18
	.align 2, 0
_0803CEBC: .4byte gSioSt
_0803CEC0: .4byte 0x030046BC
_0803CEC4:
	adds r0, r5, #0
	bl sub_803D64C
	ldr r0, _0803CEEC @ =0x030046BC
	movs r1, #0xce
	strb r1, [r0]
	ldr r2, [r6]
	ldrb r4, [r2, #6]
	lsls r1, r4, #4
	ldrb r3, [r5, #1]
	orrs r1, r3
	strb r1, [r0, #1]
	ldrb r5, [r5, #1]
	lsls r1, r5, #1
	adds r2, #0x26
	adds r2, r2, r1
	ldrh r1, [r2]
	adds r1, #1
	strh r1, [r0, #2]
	b _0803CF84
	.align 2, 0
_0803CEEC: .4byte 0x030046BC
_0803CEF0:
	movs r2, #0
	lsls r1, r7, #4
	adds r0, r7, #1
	mov r8, r0
	ldr r0, _0803CF54 @ =0x0203D908
	subs r1, r1, r7
	adds r3, #0x38
	adds r0, #0xa1
	adds r1, r1, r0
_0803CF02:
	adds r0, r3, r2
	ldrb r0, [r0]
	strb r0, [r1]
	adds r1, #1
	adds r2, #1
	cmp r2, #0xe
	ble _0803CF02
	lsrs r0, r4, #0x18
	bl sub_803D1CC
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0803CF2E
	ldr r0, _0803CF58 @ =gSioSt
	ldr r0, [r0]
	ldrb r1, [r0]
	ldrb r2, [r5, #2]
	cmp r1, r2
	bne _0803CF2E
	ldrh r0, [r0, #4]
	cmp r0, #5
	bls _0803CF3C
_0803CF2E:
	lsrs r0, r4, #0x18
	bl sub_803D1CC
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne _0803CF60
_0803CF3C:
	ldr r0, _0803CF58 @ =gSioSt
	ldr r2, [r0]
	movs r0, #6
	ldrsb r0, [r2, r0]
	cmp r0, #0
	beq _0803CF4A
	b _0803D15E
_0803CF4A:
	ldr r0, _0803CF5C @ =0x030046BC
	movs r1, #0xc6
	strb r1, [r0]
	ldrb r1, [r2, #6]
	b _0803CF80
	.align 2, 0
_0803CF54: .4byte 0x0203D908
_0803CF58: .4byte gSioSt
_0803CF5C: .4byte 0x030046BC
_0803CF60:
	ldr r0, _0803CF8C @ =gSioSt
	ldr r1, [r0]
	movs r0, #6
	ldrsb r0, [r1, r0]
	cmp r0, #0
	beq _0803CF6E
	b _0803D15E
_0803CF6E:
	movs r2, #0xc5
	ldrb r3, [r1]
	ldrb r5, [r5, #2]
	cmp r3, r5
	beq _0803CF7A
	movs r2, #0xc7
_0803CF7A:
	ldr r0, _0803CF90 @ =0x030046BC
	strb r2, [r0]
	ldrb r1, [r1, #6]
_0803CF80:
	strb r1, [r0, #1]
	strh r7, [r0, #2]
_0803CF84:
	movs r1, #4
	bl sub_803D2E4
	b _0803D15E
	.align 2, 0
_0803CF8C: .4byte gSioSt
_0803CF90: .4byte 0x030046BC
_0803CF94:
	ldr r0, [r5]
	adds r5, r0, #0
	adds r5, #0x32
	ldrb r0, [r5]
	subs r0, #0xc4
	cmp r0, #0xa
	bls _0803CFA4
	b _0803D15E
_0803CFA4:
	lsls r0, r0, #2
	ldr r1, _0803CFB0 @ =_0803CFB4
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0803CFB0: .4byte _0803CFB4
_0803CFB4: @ jump table
	.4byte _0803D154 @ case 0
	.4byte _0803D0EC @ case 1
	.4byte _0803D118 @ case 2
	.4byte _0803D0A8 @ case 3
	.4byte _0803D15E @ case 4
	.4byte _0803CFE0 @ case 5
	.4byte _0803D15E @ case 6
	.4byte _0803D15E @ case 7
	.4byte _0803D15E @ case 8
	.4byte _0803D15E @ case 9
	.4byte _0803CFF8 @ case 10
_0803CFE0:
	ldr r0, _0803CFF4 @ =gSioSt
	ldr r1, [r0]
	movs r0, #1
	ldrb r5, [r5, #1]
	lsls r0, r5
	ldrb r4, [r1, #0xa]
	orrs r0, r4
	strb r0, [r1, #0xa]
	b _0803D15A
	.align 2, 0
_0803CFF4: .4byte gSioSt
_0803CFF8:
	ldr r6, _0803D09C @ =gSioSt
	ldr r3, [r6]
	adds r0, r3, #0
	adds r0, #0x2e
	ldrb r0, [r0]
	adds r7, #1
	mov r8, r7
	cmp r0, #0
	bne _0803D00C
	b _0803D15E
_0803D00C:
	ldrb r2, [r5, #1]
	lsrs r4, r2, #4
	movs r1, #6
	ldrsb r1, [r3, r1]
	cmp r4, r1
	bne _0803D01A
	b _0803D15E
_0803D01A:
	movs r0, #0xf
	ands r0, r2
	cmp r0, r1
	beq _0803D024
	b _0803D15E
_0803D024:
	ldrh r0, [r3, #0x24]
	adds r0, #1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldrh r5, [r5, #2]
	cmp r5, r0
	beq _0803D034
	b _0803D15E
_0803D034:
	movs r0, #1
	lsls r0, r4
	ldrb r1, [r3, #0xf]
	orrs r0, r1
	strb r0, [r3, #0xf]
	ldr r0, _0803D0A0 @ =0x030013D0
	ldr r1, [r0]
	ldr r0, [r6]
	ldrb r0, [r0, #0xf]
	strb r0, [r1]
	ldr r4, [r6]
	ldrb r0, [r4, #9]
	ldrb r2, [r4, #0xf]
	ands r0, r2
	ldrb r3, [r4, #9]
	cmp r0, r3
	beq _0803D058
	b _0803D15E
_0803D058:
	ldrh r0, [r4, #0x24]
	adds r0, #1
	movs r3, #0
	strh r0, [r4, #0x24]
	ldr r2, _0803D0A4 @ =0x00001B74
	adds r1, r4, r2
	movs r0, #0x8c
	ldrb r1, [r1]
	muls r0, r1, r0
	adds r0, r4, r0
	movs r4, #0x9c
	lsls r4, r4, #1
	adds r0, r0, r4
	strb r3, [r0]
	ldr r0, [r6]
	adds r0, r0, r2
	ldrb r1, [r0]
	adds r1, #1
	strb r1, [r0]
	ldr r1, [r6]
	adds r1, r1, r2
	movs r0, #0x1f
	ldrb r2, [r1]
	ands r0, r2
	strb r0, [r1]
	ldr r0, [r6]
	adds r0, #0x2e
	strb r3, [r0]
	ldr r0, [r6]
	strb r3, [r0, #0xf]
	strb r3, [r0, #0x11]
	strb r3, [r0, #0x10]
	b _0803D15E
	.align 2, 0
_0803D09C: .4byte gSioSt
_0803D0A0: .4byte 0x030013D0
_0803D0A4: .4byte 0x00001B74
_0803D0A8:
	ldrb r0, [r5, #2]
	bl sub_803D1CC
	lsls r0, r0, #0x18
	adds r7, #1
	mov r8, r7
	cmp r0, #0
	bne _0803D15E
	ldr r3, _0803D0E8 @ =gSioSt
	ldr r0, [r3]
	movs r1, #6
	ldrsb r1, [r0, r1]
	adds r0, #0xb
	adds r0, r0, r1
	movs r2, #2
	strb r2, [r0]
	ldr r1, [r3]
	movs r0, #0x30
	ldrh r4, [r1, #2]
	ands r0, r4
	lsrs r0, r0, #4
	adds r1, #0xb
	adds r1, r1, r0
	strb r2, [r1]
	ldr r0, [r3]
	adds r0, #0xb
	ldrh r5, [r5, #2]
	adds r0, r5, r0
	strb r2, [r0]
	ldr r1, [r3]
	b _0803D10C
	.align 2, 0
_0803D0E8: .4byte gSioSt
_0803D0EC:
	ldrb r0, [r5, #2]
	bl sub_803D1CC
	lsls r0, r0, #0x18
	adds r7, #1
	mov r8, r7
	cmp r0, #0
	bne _0803D15E
	ldr r2, _0803D114 @ =gSioSt
	ldr r0, [r2]
	adds r0, #0xb
	ldrh r5, [r5, #2]
	adds r0, r5, r0
	movs r1, #2
	strb r1, [r0]
	ldr r1, [r2]
_0803D10C:
	movs r0, #6
	strh r0, [r1, #4]
	b _0803D15E
	.align 2, 0
_0803D114: .4byte gSioSt
_0803D118:
	ldr r0, _0803D14C @ =0x0203D908
	adds r0, #0x9c
	ldrh r1, [r5, #2]
	adds r0, r1, r0
	movs r4, #0
	movs r2, #1
	strb r2, [r0]
	ldr r3, _0803D150 @ =gSioSt
	ldr r0, [r3]
	adds r0, #0xb
	ldrh r1, [r5, #2]
	adds r0, r1, r0
	movs r1, #5
	strb r1, [r0]
	ldr r0, [r3]
	ldrh r1, [r5, #2]
	lsls r2, r1
	ldrb r1, [r0, #9]
	orrs r2, r1
	strb r2, [r0, #9]
	ldr r0, [r3]
	adds r0, #0x1a
	ldrh r5, [r5, #2]
	adds r0, r5, r0
	strb r4, [r0]
	b _0803D15A
	.align 2, 0
_0803D14C: .4byte 0x0203D908
_0803D150: .4byte gSioSt
_0803D154:
	ldrb r0, [r5, #1]
	bl sub_803CDC0
_0803D15A:
	adds r7, #1
	mov r8, r7
_0803D15E:
	mov r7, r8
	cmp r7, #3
	bgt _0803D166
	b _0803CE18
_0803D166:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start nullsub_43
nullsub_43: @ 0x0803D170
	bx lr
	.align 2, 0

	thumb_func_start sub_803D174
sub_803D174: @ 0x0803D174
	push {r4, r5, lr}
	movs r5, #0
	movs r4, #0
_0803D17A:
	lsls r0, r4, #0x18
	lsrs r0, r0, #0x18
	bl sub_803D1CC
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne _0803D190
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
_0803D190:
	adds r4, #1
	cmp r4, #3
	ble _0803D17A
	adds r0, r5, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_803D1A0
sub_803D1A0: @ 0x0803D1A0
	push {r4, r5, lr}
	movs r5, #0
	movs r4, #0
_0803D1A6:
	lsls r0, r4, #0x18
	lsrs r0, r0, #0x18
	bl sub_803D1F0
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne _0803D1BC
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
_0803D1BC:
	adds r4, #1
	cmp r4, #3
	ble _0803D1A6
	adds r0, r5, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_803D1CC
sub_803D1CC: @ 0x0803D1CC
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r1, _0803D1E8 @ =gSioSt
	ldr r1, [r1]
	ldrb r1, [r1, #9]
	asrs r1, r0
	adds r0, r1, #0
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	bne _0803D1EC
	movs r0, #0
	b _0803D1EE
	.align 2, 0
_0803D1E8: .4byte gSioSt
_0803D1EC:
	movs r0, #1
_0803D1EE:
	bx lr

	thumb_func_start sub_803D1F0
sub_803D1F0: @ 0x0803D1F0
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r1, _0803D20C @ =gSioSt
	ldr r1, [r1]
	ldrb r1, [r1, #8]
	asrs r1, r0
	adds r0, r1, #0
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	bne _0803D210
	movs r0, #0
	b _0803D212
	.align 2, 0
_0803D20C: .4byte gSioSt
_0803D210:
	movs r0, #1
_0803D212:
	bx lr

	thumb_func_start sub_803D214
sub_803D214: @ 0x0803D214
	push {r4, lr}
	ldr r2, _0803D240 @ =gSioSt
	ldr r3, [r2]
	ldrh r1, [r3, #2]
	movs r0, #0
	strh r0, [r3, #2]
	movs r4, #8
	ands r1, r4
	cmp r1, #0
	bne _0803D248
	ldr r0, _0803D244 @ =0x04000128
	ldrh r1, [r0]
	adds r0, r4, #0
	ands r0, r1
	cmp r0, #0
	bne _0803D248
	adds r1, r3, #0
	adds r1, #0x20
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	b _0803D250
	.align 2, 0
_0803D240: .4byte gSioSt
_0803D244: .4byte 0x04000128
_0803D248:
	ldr r0, [r2]
	adds r0, #0x20
	movs r1, #0
	strb r1, [r0]
_0803D250:
	ldr r0, [r2]
	adds r0, #0x20
	ldrb r0, [r0]
	cmp r0, #0xa
	bhi _0803D25E
	movs r0, #1
	b _0803D260
_0803D25E:
	movs r0, #0
_0803D260:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_803D268
sub_803D268: @ 0x0803D268
	ldr r0, _0803D284 @ =gSioSt
	ldr r0, [r0]
	ldr r2, _0803D288 @ =0x00001B75
	adds r1, r0, r2
	ldr r3, _0803D28C @ =0x00001B74
	adds r0, r0, r3
	ldrb r2, [r1]
	ldrb r3, [r0]
	cmp r2, r3
	bhs _0803D290
	adds r0, r3, #0
	subs r0, #0x20
	subs r0, r2, r0
	b _0803D296
	.align 2, 0
_0803D284: .4byte gSioSt
_0803D288: .4byte 0x00001B75
_0803D28C: .4byte 0x00001B74
_0803D290:
	ldrb r1, [r1]
	ldrb r0, [r0]
	subs r0, r1, r0
_0803D296:
	bx lr

	thumb_func_start sub_803D298
sub_803D298: @ 0x0803D298
	push {r4, lr}
	movs r2, #0
	movs r1, #0
	ldr r4, _0803D2D8 @ =gSioSt
	ldr r0, [r4]
	adds r3, r0, #0
	adds r3, #0xb
_0803D2A6:
	adds r0, r3, r1
	ldrb r0, [r0]
	cmp r0, #5
	bne _0803D2B0
	adds r2, #1
_0803D2B0:
	adds r1, #1
	cmp r1, #3
	ble _0803D2A6
	ldr r0, [r4]
	ldrb r0, [r0, #9]
	cmp r0, #3
	bne _0803D2C2
	cmp r2, #2
	beq _0803D2D2
_0803D2C2:
	cmp r0, #7
	bne _0803D2CA
	cmp r2, #3
	beq _0803D2D2
_0803D2CA:
	cmp r0, #0xf
	bne _0803D2DC
	cmp r2, #4
	bne _0803D2DC
_0803D2D2:
	movs r0, #1
	b _0803D2DE
	.align 2, 0
_0803D2D8: .4byte gSioSt
_0803D2DC:
	movs r0, #0
_0803D2DE:
	pop {r4}
	pop {r1}
	bx r1

	thumb_func_start sub_803D2E4
sub_803D2E4: @ 0x0803D2E4
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	mov sb, r0
	lsls r1, r1, #0x10
	lsrs r5, r1, #0x10
	movs r0, #0
	mov r8, r0
	ldr r0, _0803D384 @ =0x030013DA
	ldrh r3, [r0]
	cmp r5, #0x80
	bhi _0803D37C
	lsrs r5, r1, #0x11
	ldr r1, _0803D388 @ =0x00004FFF
	adds r4, r5, r1
	ldr r2, _0803D38C @ =0x0203C508
	lsls r0, r3, #1
	adds r0, r0, r2
	strh r1, [r0]
	adds r3, #1
	ldr r6, _0803D390 @ =0x000001FF
	ands r3, r6
	ldr r0, _0803D394 @ =0x030013D8
	ldrh r1, [r0]
	mov ip, r2
	mov sl, r0
	cmp r3, r1
	beq _0803D37C
	lsls r0, r3, #1
	add r0, ip
	strh r5, [r0]
	adds r3, #1
	ands r3, r6
	lsls r6, r3, #1
	adds r7, r3, #1
	cmp r3, r1
	beq _0803D37C
	movs r2, #0
	cmp r2, r5
	bge _0803D358
	mov r3, sb
_0803D33A:
	adds r2, #1
	ldrh r0, [r3]
	adds r1, r0, #0
	muls r1, r2, r1
	adds r0, r4, r1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	mvns r1, r1
	add r1, r8
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	mov r8, r1
	adds r3, #2
	cmp r2, r5
	blt _0803D33A
_0803D358:
	mov r1, ip
	adds r0, r6, r1
	strh r4, [r0]
	ldr r4, _0803D390 @ =0x000001FF
	adds r3, r4, #0
	ands r3, r7
	mov r2, sl
	ldrh r1, [r2]
	cmp r3, r1
	beq _0803D37C
	lsls r0, r3, #1
	add r0, ip
	mov r2, r8
	strh r2, [r0]
	adds r3, #1
	ands r3, r4
	cmp r3, r1
	bne _0803D398
_0803D37C:
	movs r0, #1
	rsbs r0, r0, #0
	b _0803D3C8
	.align 2, 0
_0803D384: .4byte 0x030013DA
_0803D388: .4byte 0x00004FFF
_0803D38C: .4byte 0x0203C508
_0803D390: .4byte 0x000001FF
_0803D394: .4byte 0x030013D8
_0803D398:
	movs r2, #0
	cmp r2, r5
	bge _0803D3C0
	mov r8, ip
	adds r7, r4, #0
	mov r4, sb
	mov r6, sl
_0803D3A6:
	lsls r0, r3, #1
	add r0, r8
	ldrh r1, [r4]
	strh r1, [r0]
	adds r3, #1
	ands r3, r7
	ldrh r0, [r6]
	cmp r3, r0
	beq _0803D37C
	adds r4, #2
	adds r2, #1
	cmp r2, r5
	blt _0803D3A6
_0803D3C0:
	ldr r1, _0803D3D8 @ =0x030013DA
	strh r3, [r1]
	lsls r0, r5, #0x10
	asrs r0, r0, #0x10
_0803D3C8:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0803D3D8: .4byte 0x030013DA

	thumb_func_start sub_803D3DC
sub_803D3DC: @ 0x0803D3DC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x10
	str r1, [sp, #4]
	lsls r0, r0, #0x18
	movs r1, #0
	mov r8, r1
	movs r2, #0
	str r2, [sp, #0xc]
	ldr r1, _0803D454 @ =0x030013E0
	lsrs r3, r0, #0x18
	str r3, [sp]
	asrs r2, r0, #0x17
	adds r3, r2, r1
	ldr r0, _0803D458 @ =0x030013E8
	adds r7, r2, r0
	ldrh r5, [r7]
	mov sl, r1
	ldrh r0, [r3]
	cmp r0, r5
	beq _0803D4DE
	ldr r1, _0803D45C @ =0x0203C908
	ldrh r4, [r3]
	lsls r0, r4, #3
	adds r0, r2, r0
	adds r0, r0, r1
	ldr r6, _0803D460 @ =0x00004FFF
	mov sb, r1
	ldrh r0, [r0]
	cmp r0, r6
	beq _0803D468
	cmp r4, r5
	beq _0803D496
	adds r4, r2, #0
	adds r2, r3, #0
	mov ip, r6
	adds r3, r7, #0
	ldr r6, _0803D464 @ =0x000001FF
	mov r5, sb
_0803D430:
	ldrh r0, [r2]
	adds r0, #1
	ands r0, r6
	strh r0, [r2]
	ldrh r1, [r2]
	lsls r0, r1, #3
	adds r0, r4, r0
	adds r0, r0, r5
	ldrh r0, [r0]
	cmp r0, ip
	bne _0803D44C
	ldrh r7, [r3]
	cmp r1, r7
	bne _0803D468
_0803D44C:
	ldrh r0, [r3]
	cmp r1, r0
	bne _0803D430
	b _0803D496
	.align 2, 0
_0803D454: .4byte 0x030013E0
_0803D458: .4byte 0x030013E8
_0803D45C: .4byte 0x0203C908
_0803D460: .4byte 0x00004FFF
_0803D464: .4byte 0x000001FF
_0803D468:
	ldr r1, [sp]
	lsls r0, r1, #0x18
	asrs r1, r0, #0x17
	ldr r3, _0803D488 @ =0x030013E8
	adds r2, r1, r3
	add r1, sl
	ldrh r2, [r2]
	ldrh r1, [r1]
	adds r4, r0, #0
	cmp r2, r1
	bhs _0803D48C
	movs r7, #0x80
	lsls r7, r7, #2
	adds r0, r2, r7
	subs r0, r0, r1
	b _0803D48E
	.align 2, 0
_0803D488: .4byte 0x030013E8
_0803D48C:
	subs r0, r2, r1
_0803D48E:
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	cmp r1, #4
	bhi _0803D49C
_0803D496:
	movs r0, #4
	rsbs r0, r0, #0
	b _0803D584
_0803D49C:
	asrs r0, r4, #0x17
	add r0, sl
	ldrh r3, [r0]
	adds r3, #1
	ldr r0, _0803D4B0 @ =0x000001FF
	cmp r3, r0
	bgt _0803D4B4
	lsls r0, r3, #0x10
	lsrs r0, r0, #0x10
	b _0803D4B6
	.align 2, 0
_0803D4B0: .4byte 0x000001FF
_0803D4B4:
	movs r0, #0
_0803D4B6:
	asrs r4, r4, #0x17
	lsls r0, r0, #3
	adds r0, r4, r0
	add r0, sb
	ldrh r6, [r0]
	cmp r6, #0x80
	bls _0803D4D8
	mov r1, sl
	adds r0, r4, r1
	ldrh r1, [r0]
	adds r1, #1
	ldr r2, _0803D4D4 @ =0x000001FF
	ands r1, r2
	strh r1, [r0]
	b _0803D496
	.align 2, 0
_0803D4D4: .4byte 0x000001FF
_0803D4D8:
	adds r0, r6, #6
	cmp r0, r1
	ble _0803D4E4
_0803D4DE:
	movs r0, #2
	rsbs r0, r0, #0
	b _0803D584
_0803D4E4:
	mov r3, sl
	adds r2, r4, r3
	ldrh r0, [r2]
	adds r0, #2
	ldr r7, _0803D578 @ =0x000001FF
	ands r0, r7
	strh r0, [r2]
	ldrh r1, [r2]
	lsls r0, r1, #3
	adds r0, r4, r0
	add r0, sb
	ldrh r0, [r0]
	str r0, [sp, #8]
	adds r1, #1
	ands r1, r7
	strh r1, [r2]
	ldrh r1, [r2]
	lsls r0, r1, #3
	adds r0, r4, r0
	add r0, sb
	ldrh r0, [r0]
	mov sl, r0
	adds r1, #1
	ands r1, r7
	strh r1, [r2]
	ldr r0, _0803D57C @ =0x00004FFF
	add r0, r8
	adds r0, r6, r0
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov r8, r0
	movs r3, #0
	cmp r3, r6
	bge _0803D566
	mov ip, r4
	adds r4, r2, #0
	ldr r5, [sp, #4]
_0803D52E:
	ldrh r7, [r4]
	lsls r0, r7, #3
	add r0, ip
	add r0, sb
	ldrh r2, [r0]
	adds r3, #1
	adds r1, r2, #0
	muls r1, r3, r1
	mov r7, r8
	adds r0, r7, r1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov r8, r0
	mvns r1, r1
	ldr r0, [sp, #0xc]
	adds r1, r0, r1
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	str r1, [sp, #0xc]
	strh r2, [r5]
	ldrh r0, [r4]
	adds r0, #1
	ldr r1, _0803D578 @ =0x000001FF
	ands r0, r1
	strh r0, [r4]
	adds r5, #2
	cmp r3, r6
	blt _0803D52E
_0803D566:
	ldr r2, [sp, #8]
	cmp r8, r2
	bne _0803D572
	ldr r3, [sp, #0xc]
	cmp r3, sl
	beq _0803D580
_0803D572:
	movs r0, #3
	rsbs r0, r0, #0
	b _0803D584
	.align 2, 0
_0803D578: .4byte 0x000001FF
_0803D57C: .4byte 0x00004FFF
_0803D580:
	lsls r0, r6, #0x11
	asrs r0, r0, #0x10
_0803D584:
	add sp, #0x10
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	thumb_func_start SioSend16
SioSend16: @ 0x0803D594
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0803D5AC @ =gSioSt
	ldr r3, [r0]
	movs r2, #6
	ldrsb r2, [r3, r2]
	movs r0, #1
	rsbs r0, r0, #0
	cmp r2, r0
	bne _0803D5B0
	adds r0, r2, #0
	b _0803D5D2
	.align 2, 0
_0803D5AC: .4byte gSioSt
_0803D5B0:
	ldr r2, _0803D5D8 @ =0x04000128
	ldrh r0, [r4]
	strh r0, [r2, #2]
	movs r0, #6
	ldrsb r0, [r3, r0]
	cmp r0, #0
	bne _0803D5D0
	cmp r1, #0
	bge _0803D5D0
	ldr r1, _0803D5DC @ =0x030013C8
	movs r3, #0xc1
	lsls r3, r3, #7
	adds r0, r3, #0
	ldrb r1, [r1]
	orrs r0, r1
	strh r0, [r2]
_0803D5D0:
	movs r0, #0
_0803D5D2:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0803D5D8: .4byte 0x04000128
_0803D5DC: .4byte 0x030013C8

	thumb_func_start sub_803D5E0
sub_803D5E0: @ 0x0803D5E0
	push {r4, r5, r6, r7, lr}
	adds r2, r1, #0
	ldr r1, _0803D608 @ =0x030013E0
	ldr r0, _0803D60C @ =0x030013E8
	ldrh r3, [r1]
	ldrh r0, [r0]
	cmp r3, r0
	bne _0803D614
	ldr r7, _0803D610 @ =0x00007FFF
	adds r0, r7, #0
	strh r0, [r2]
	adds r2, #2
	strh r0, [r2]
	adds r2, #2
	strh r0, [r2]
	strh r0, [r2, #2]
	movs r0, #2
	rsbs r0, r0, #0
	b _0803D63E
	.align 2, 0
_0803D608: .4byte 0x030013E0
_0803D60C: .4byte 0x030013E8
_0803D610: .4byte 0x00007FFF
_0803D614:
	movs r4, #0
	ldr r6, _0803D644 @ =0x0203C908
	ldr r5, _0803D648 @ =0x000001FF
	adds r3, r1, #0
_0803D61C:
	lsls r0, r4, #1
	ldrh r7, [r3]
	lsls r1, r7, #3
	adds r0, r0, r1
	adds r0, r0, r6
	ldrh r0, [r0]
	strh r0, [r2]
	adds r2, #2
	ldrh r0, [r3]
	adds r0, #1
	ands r0, r5
	strh r0, [r3]
	adds r3, #2
	adds r4, #1
	cmp r4, #3
	ble _0803D61C
	movs r0, #0
_0803D63E:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0803D644: .4byte 0x0203C908
_0803D648: .4byte 0x000001FF

	thumb_func_start sub_803D64C
sub_803D64C: @ 0x0803D64C
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	ldr r3, _0803D6B4 @ =gSioSt
	ldr r2, [r3]
	ldr r0, _0803D6B8 @ =0x00001B77
	adds r1, r2, r0
	movs r0, #0x8c
	ldrb r1, [r1]
	muls r0, r1, r0
	ldr r1, _0803D6BC @ =0x000012B4
	adds r0, r0, r1
	adds r1, r2, r0
	ldrb r0, [r4]
	strb r0, [r1, #4]
	ldrb r0, [r4, #1]
	strb r0, [r1, #5]
	ldrh r0, [r4, #2]
	strh r0, [r1, #6]
	ldrh r0, [r4, #4]
	strh r0, [r1, #8]
	movs r2, #0
	adds r6, r3, #0
	ldrh r0, [r4, #4]
	cmp r2, r0
	bge _0803D694
	adds r5, r1, #0
	adds r5, #0xa
	adds r3, r4, #6
_0803D684:
	adds r0, r5, r2
	adds r1, r3, r2
	ldrb r1, [r1]
	strb r1, [r0]
	adds r2, #1
	ldrh r1, [r4, #4]
	cmp r2, r1
	blt _0803D684
_0803D694:
	ldr r0, [r6]
	ldr r2, _0803D6B8 @ =0x00001B77
	adds r0, r0, r2
	ldrb r1, [r0]
	adds r1, #1
	strb r1, [r0]
	ldr r1, [r6]
	adds r1, r1, r2
	movs r0, #0xf
	ldrb r2, [r1]
	ands r0, r2
	strb r0, [r1]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0803D6B4: .4byte gSioSt
_0803D6B8: .4byte 0x00001B77
_0803D6BC: .4byte 0x000012B4

	thumb_func_start sub_803D6C0
sub_803D6C0: @ 0x0803D6C0
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	ldr r0, _0803D710 @ =gSioSt
	ldr r3, [r0]
	ldr r0, _0803D714 @ =0x00001B74
	adds r4, r3, r0
	movs r6, #0x8c
	ldrb r1, [r4]
	adds r5, r1, #0
	muls r5, r6, r5
	adds r0, r3, r5
	movs r1, #0x9c
	lsls r1, r1, #1
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #0xcf
	bne _0803D71C
	ldr r1, _0803D718 @ =0x030013D0
	movs r2, #0x9a
	lsls r2, r2, #1
	adds r0, r5, r2
	adds r0, r3, r0
	str r0, [r1]
	ldrb r1, [r4]
	adds r0, r1, #0
	muls r0, r6, r0
	adds r0, r3, r0
	movs r1, #0x9e
	lsls r1, r1, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	str r0, [r7]
	ldrb r4, [r4]
	adds r0, r4, #0
	muls r0, r6, r0
	adds r0, r0, r2
	adds r0, r3, r0
	adds r0, #4
	b _0803D71E
	.align 2, 0
_0803D710: .4byte gSioSt
_0803D714: .4byte 0x00001B74
_0803D718: .4byte 0x030013D0
_0803D71C:
	movs r0, #0
_0803D71E:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	thumb_func_start sub_803D724
sub_803D724: @ 0x0803D724
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	mov ip, r0
	lsls r1, r1, #0x10
	lsrs r7, r1, #0x10
	ldr r6, _0803D7C0 @ =0x030013D4
	movs r0, #1
	str r0, [r6]
	ldr r4, _0803D7C4 @ =gSioSt
	ldr r1, [r4]
	ldr r2, _0803D7C8 @ =0x00001B75
	adds r0, r1, r2
	movs r5, #0x8c
	ldrb r0, [r0]
	muls r0, r5, r0
	adds r1, r1, r0
	movs r3, #0x9a
	lsls r3, r3, #1
	adds r1, r1, r3
	movs r0, #0
	strb r0, [r1]
	ldr r1, [r4]
	adds r2, r1, r2
	ldrb r2, [r2]
	adds r0, r2, #0
	muls r0, r5, r0
	adds r0, r0, r3
	adds r5, r1, r0
	adds r2, r5, #4
	movs r0, #0xcf
	strb r0, [r5, #4]
	ldr r0, [r4]
	ldrb r0, [r0, #6]
	strb r0, [r2, #1]
	ldr r1, [r4]
	ldrh r0, [r1, #0x22]
	strh r0, [r2, #2]
	strh r7, [r2, #4]
	ldrh r0, [r1, #0x22]
	adds r0, #1
	strh r0, [r1, #0x22]
	movs r3, #0
	mov r8, r6
	adds r6, r4, #0
	cmp r3, r7
	bhs _0803D798
	adds r2, #6
_0803D784:
	adds r1, r2, r3
	mov r4, ip
	adds r0, r4, r3
	ldrb r0, [r0]
	strb r0, [r1]
	adds r0, r3, #1
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	cmp r3, r7
	blo _0803D784
_0803D798:
	ldr r1, [r6]
	ldr r3, _0803D7C8 @ =0x00001B75
	adds r1, r1, r3
	ldrb r0, [r1]
	adds r2, r0, #1
	movs r4, #0
	strb r2, [r1]
	ldr r2, [r6]
	adds r2, r2, r3
	movs r1, #0x1f
	ldrb r3, [r2]
	ands r1, r3
	strb r1, [r2]
	mov r1, r8
	str r4, [r1]
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0803D7C0: .4byte 0x030013D4
_0803D7C4: .4byte gSioSt
_0803D7C8: .4byte 0x00001B75

	thumb_func_start sub_803D7CC
sub_803D7CC: @ 0x0803D7CC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	mov sb, r0
	str r1, [sp]
	mov sl, r2
_0803D7DE:
	ldr r0, _0803D80C @ =gSioSt
	mov r8, r0
	ldr r2, [r0]
	ldr r7, _0803D810 @ =0x00001B76
	adds r1, r2, r7
	movs r0, #0x8c
	ldrb r1, [r1]
	muls r0, r1, r0
	ldr r1, _0803D814 @ =0x000012B4
	adds r0, r0, r1
	adds r5, r2, r0
	adds r6, r5, #4
	ldrb r3, [r5, #4]
	cmp r3, #0xcf
	bne _0803D806
	ldrb r0, [r6, #1]
	ldrb r1, [r6, #1]
	ldrb r3, [r2, #6]
	cmp r1, r3
	bne _0803D818
_0803D806:
	movs r0, #0
	b _0803D940
	.align 2, 0
_0803D80C: .4byte gSioSt
_0803D810: .4byte 0x00001B76
_0803D814: .4byte 0x000012B4
_0803D818:
	lsls r0, r0, #1
	adds r3, r2, #0
	adds r3, #0x26
	adds r0, r3, r0
	ldrh r1, [r6, #2]
	ldrh r0, [r0]
	cmp r1, r0
	beq _0803D864
	ldr r0, _0803D860 @ =0x030046BC
	movs r1, #0xce
	strb r1, [r0]
	ldrb r2, [r2, #6]
	lsls r1, r2, #4
	ldrb r2, [r6, #1]
	orrs r1, r2
	strb r1, [r0, #1]
	ldrb r6, [r6, #1]
	lsls r1, r6, #1
	adds r1, r3, r1
	ldrh r1, [r1]
	movs r4, #0
	strh r1, [r0, #2]
	movs r1, #4
	bl sub_803D2E4
	strb r4, [r5, #4]
	mov r3, r8
	ldr r0, [r3]
	adds r0, r0, r7
	ldrb r1, [r0]
	adds r1, #1
	strb r1, [r0]
	ldr r1, [r3]
	adds r1, r1, r7
	b _0803D8D2
	.align 2, 0
_0803D860: .4byte 0x030046BC
_0803D864:
	movs r2, #0
	ldrh r3, [r6, #4]
	cmp r2, r3
	bhs _0803D886
	adds r3, r5, #0
	adds r3, #0xa
_0803D870:
	mov r0, sb
	adds r1, r0, r2
	adds r0, r3, r2
	ldrb r0, [r0]
	strb r0, [r1]
	adds r0, r2, #1
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	ldrh r1, [r6, #4]
	cmp r2, r1
	blo _0803D870
_0803D886:
	mov r2, sl
	cmp r2, #0
	beq _0803D8E8
	mov r0, sb
	bl _call_via_sl
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0803D8E8
	ldr r0, _0803D8DC @ =0x030046BC
	movs r1, #0xce
	strb r1, [r0]
	ldr r4, _0803D8E0 @ =gSioSt
	ldr r2, [r4]
	ldrb r3, [r2, #6]
	lsls r1, r3, #4
	ldrb r3, [r6, #1]
	orrs r1, r3
	strb r1, [r0, #1]
	ldrb r3, [r6, #1]
	lsls r1, r3, #1
	adds r2, #0x26
	adds r2, r2, r1
	ldrh r1, [r2]
	movs r5, #0
	strh r1, [r0, #2]
	movs r1, #4
	bl sub_803D2E4
	strb r5, [r6]
	ldr r0, [r4]
	ldr r2, _0803D8E4 @ =0x00001B76
	adds r0, r0, r2
	ldrb r1, [r0]
	adds r1, #1
	strb r1, [r0]
	ldr r1, [r4]
	adds r1, r1, r2
_0803D8D2:
	movs r0, #0xf
	ldrb r2, [r1]
	ands r0, r2
	strb r0, [r1]
	b _0803D7DE
	.align 2, 0
_0803D8DC: .4byte 0x030046BC
_0803D8E0: .4byte gSioSt
_0803D8E4: .4byte 0x00001B76
_0803D8E8:
	movs r0, #0
	strb r0, [r6]
	ldrb r5, [r6, #1]
	ldr r4, _0803D950 @ =gSioSt
	ldr r2, [r4]
	lsls r1, r5, #1
	adds r0, r2, #0
	adds r0, #0x26
	adds r0, r0, r1
	ldrh r1, [r0]
	adds r1, #1
	strh r1, [r0]
	ldr r3, _0803D954 @ =0x00001B76
	adds r2, r2, r3
	ldrb r0, [r2]
	adds r0, #1
	strb r0, [r2]
	ldr r1, [r4]
	adds r1, r1, r3
	movs r0, #0xf
	ldrb r3, [r1]
	ands r0, r3
	strb r0, [r1]
	ldr r0, [sp]
	strb r5, [r0]
	ldr r0, _0803D958 @ =0x030046BC
	movs r1, #0xce
	strb r1, [r0]
	ldr r2, [r4]
	ldrb r3, [r2, #6]
	lsls r1, r3, #4
	ldrb r3, [r6, #1]
	orrs r1, r3
	strb r1, [r0, #1]
	ldrb r3, [r6, #1]
	lsls r1, r3, #1
	adds r2, #0x26
	adds r2, r2, r1
	ldrh r1, [r2]
	strh r1, [r0, #2]
	movs r1, #4
	bl sub_803D2E4
	ldrh r0, [r6, #4]
_0803D940:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0803D950: .4byte gSioSt
_0803D954: .4byte 0x00001B76
_0803D958: .4byte 0x030046BC

	thumb_func_start sub_803D95C
sub_803D95C: @ 0x0803D95C
	push {lr}
	sub sp, #4
	ldr r1, _0803D998 @ =0x00007FFF
	mov r0, sp
	strh r1, [r0]
	ldr r0, _0803D99C @ =gSioSt
	ldr r1, [r0]
	movs r0, #0
	strb r0, [r1, #1]
	mov r0, sp
	movs r1, #1
	bl SioSend16
	ldr r1, _0803D9A0 @ =0x030013DA
	ldr r0, _0803D9A4 @ =0x030013D8
	ldrh r0, [r0]
	strh r0, [r1]
	ldr r3, _0803D9A8 @ =0x030013E0
	ldr r2, _0803D9AC @ =0x030013E8
	movs r1, #3
_0803D984:
	ldrh r0, [r3]
	strh r0, [r2]
	adds r3, #2
	adds r2, #2
	subs r1, #1
	cmp r1, #0
	bge _0803D984
	add sp, #4
	pop {r0}
	bx r0
	.align 2, 0
_0803D998: .4byte 0x00007FFF
_0803D99C: .4byte gSioSt
_0803D9A0: .4byte 0x030013DA
_0803D9A4: .4byte 0x030013D8
_0803D9A8: .4byte 0x030013E0
_0803D9AC: .4byte 0x030013E8

	thumb_func_start sub_803D9B0
sub_803D9B0: @ 0x0803D9B0
	ldr r1, _0803D9BC @ =gSioSt
	ldr r1, [r1]
	adds r1, #0x21
	strb r0, [r1]
	bx lr
	.align 2, 0
_0803D9BC: .4byte gSioSt

	thumb_func_start sub_803D9C0
sub_803D9C0: @ 0x0803D9C0
	push {lr}
	sub sp, #4
	ldr r1, _0803DA14 @ =0x00007FFF
	mov r0, sp
	strh r1, [r0]
	ldr r1, _0803DA18 @ =gSioSt
	ldr r0, [r1]
	movs r2, #0
	strb r2, [r0, #1]
	ldr r0, [r1]
	ldr r1, _0803DA1C @ =0x00001B7C
	adds r0, r0, r1
	strh r2, [r0]
	mov r0, sp
	movs r1, #1
	bl SioSend16
	ldr r1, _0803DA20 @ =0x030013DA
	ldr r0, _0803DA24 @ =0x030013D8
	ldrh r0, [r0]
	strh r0, [r1]
	ldr r3, _0803DA28 @ =0x030013E0
	ldr r2, _0803DA2C @ =0x030013E8
	movs r1, #3
_0803D9F0:
	ldrh r0, [r3]
	strh r0, [r2]
	adds r3, #2
	adds r2, #2
	subs r1, #1
	cmp r1, #0
	bge _0803D9F0
	ldr r0, _0803DA18 @ =gSioSt
	ldr r2, [r0]
	ldr r0, _0803DA30 @ =0x00001B7E
	adds r1, r2, r0
	movs r0, #0
	strh r0, [r1]
	movs r0, #3
	strb r0, [r2, #1]
	add sp, #4
	pop {r0}
	bx r0
	.align 2, 0
_0803DA14: .4byte 0x00007FFF
_0803DA18: .4byte gSioSt
_0803DA1C: .4byte 0x00001B7C
_0803DA20: .4byte 0x030013DA
_0803DA24: .4byte 0x030013D8
_0803DA28: .4byte 0x030013E0
_0803DA2C: .4byte 0x030013E8
_0803DA30: .4byte 0x00001B7E

	thumb_func_start sub_803DA34
sub_803DA34: @ 0x0803DA34
	push {r4, lr}
	sub sp, #4
	ldr r1, _0803DA90 @ =0x00002586
	mov r0, sp
	strh r1, [r0]
	ldr r3, _0803DA94 @ =gSioSt
	ldr r1, [r3]
	movs r2, #0
	movs r0, #0
	strh r0, [r1, #4]
	strb r2, [r1, #1]
	ldr r0, [r3]
	ldr r1, _0803DA98 @ =0x00001B7C
	adds r0, r0, r1
	movs r1, #0x88
	strh r1, [r0]
	ldr r1, _0803DA9C @ =0x030013DA
	ldr r0, _0803DAA0 @ =0x030013D8
	ldrh r0, [r0]
	strh r0, [r1]
	adds r4, r3, #0
	ldr r3, _0803DAA4 @ =0x030013E0
	ldr r2, _0803DAA8 @ =0x030013E8
	movs r1, #3
_0803DA64:
	ldrh r0, [r3]
	strh r0, [r2]
	adds r3, #2
	adds r2, #2
	subs r1, #1
	cmp r1, #0
	bge _0803DA64
	ldr r1, [r4]
	movs r0, #1
	strb r0, [r1, #1]
	ldr r1, [r4]
	movs r0, #6
	strh r0, [r1, #4]
	movs r1, #1
	rsbs r1, r1, #0
	mov r0, sp
	bl SioSend16
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0803DA90: .4byte 0x00002586
_0803DA94: .4byte gSioSt
_0803DA98: .4byte 0x00001B7C
_0803DA9C: .4byte 0x030013DA
_0803DAA0: .4byte 0x030013D8
_0803DAA4: .4byte 0x030013E0
_0803DAA8: .4byte 0x030013E8

	thumb_func_start sub_803DAAC
sub_803DAAC: @ 0x0803DAAC
	push {r4, lr}
	sub sp, #4
	ldr r1, _0803DB08 @ =0x00002586
	mov r0, sp
	strh r1, [r0]
	ldr r3, _0803DB0C @ =gSioSt
	ldr r1, [r3]
	movs r2, #0
	movs r0, #0
	strh r0, [r1, #4]
	strb r2, [r1, #1]
	ldr r0, [r3]
	ldr r1, _0803DB10 @ =0x00001B7C
	adds r0, r0, r1
	movs r1, #0x18
	strh r1, [r0]
	ldr r1, _0803DB14 @ =0x030013DA
	ldr r0, _0803DB18 @ =0x030013D8
	ldrh r0, [r0]
	strh r0, [r1]
	adds r4, r3, #0
	ldr r3, _0803DB1C @ =0x030013E0
	ldr r2, _0803DB20 @ =0x030013E8
	movs r1, #3
_0803DADC:
	ldrh r0, [r3]
	strh r0, [r2]
	adds r3, #2
	adds r2, #2
	subs r1, #1
	cmp r1, #0
	bge _0803DADC
	ldr r1, [r4]
	movs r0, #1
	strb r0, [r1, #1]
	ldr r1, [r4]
	movs r0, #6
	strh r0, [r1, #4]
	movs r1, #1
	rsbs r1, r1, #0
	mov r0, sp
	bl SioSend16
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0803DB08: .4byte 0x00002586
_0803DB0C: .4byte gSioSt
_0803DB10: .4byte 0x00001B7C
_0803DB14: .4byte 0x030013DA
_0803DB18: .4byte 0x030013D8
_0803DB1C: .4byte 0x030013E0
_0803DB20: .4byte 0x030013E8

	thumb_func_start sub_803DB24
sub_803DB24: @ 0x0803DB24
	ldr r0, _0803DB30 @ =0x030013DA
	ldr r1, _0803DB34 @ =0x030013D8
	ldrh r1, [r1]
	strh r1, [r0]
	bx lr
	.align 2, 0
_0803DB30: .4byte 0x030013DA
_0803DB34: .4byte 0x030013D8

	thumb_func_start sub_803DB38
sub_803DB38: @ 0x0803DB38
	push {r4, r5, lr}
	sub sp, #4
	adds r4, r0, #0
	ldr r5, _0803DB94 @ =gSioSt
	ldr r1, [r5]
	adds r2, r1, #0
	adds r2, #0x2e
	movs r0, #0
	strb r0, [r2]
	strh r0, [r1, #0x22]
	strh r0, [r1, #0x24]
	ldr r1, [r5]
	strh r0, [r1, #0x2c]
	strh r0, [r1, #0x2a]
	strh r0, [r1, #0x28]
	strh r0, [r1, #0x26]
	bl sub_803C748
	mov r1, sp
	adds r0, r4, #0
	adds r0, #0x34
	ldrb r0, [r0]
	strb r0, [r1]
	mov r2, sp
	ldrh r1, [r4, #0x36]
	lsrs r0, r1, #8
	strb r0, [r2, #1]
	mov r0, sp
	strb r1, [r0, #2]
	mov r1, sp
	adds r4, #0x3a
	ldrb r0, [r4]
	strb r0, [r1, #3]
	mov r0, sp
	movs r1, #4
	bl sub_803D724
	ldr r0, [r5]
	adds r0, #0x2e
	movs r1, #1
	strb r1, [r0]
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0803DB94: .4byte gSioSt

	thumb_func_start sub_803DB98
sub_803DB98: @ 0x0803DB98
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	ldr r1, [r4, #0x2c]
	cmp r1, #0
	beq _0803DBA6
	bl _call_via_r1
_0803DBA6:
	ldr r5, _0803DC04 @ =gSioSt
	ldr r1, [r5]
	adds r0, r1, #0
	adds r0, #0x2e
	ldrb r6, [r0]
	cmp r6, #0
	bne _0803DBFC
	ldrh r2, [r4, #0x38]
	ldrh r0, [r1, #0x24]
	subs r0, #1
	cmp r2, r0
	beq _0803DBDA
	ldr r0, [r4, #0x30]
	adds r0, #0x7a
	str r0, [r4, #0x30]
	movs r0, #0x64
	muls r0, r2, r0
	ldrh r1, [r4, #0x36]
	bl __divsi3
	adds r1, r4, #0
	adds r1, #0x3b
	strb r0, [r1]
	ldrh r0, [r4, #0x38]
	adds r0, #1
	strh r0, [r4, #0x38]
_0803DBDA:
	ldr r0, [r4, #0x30]
	movs r1, #0x7a
	bl sub_803D724
	ldr r0, [r5]
	adds r0, #0x2e
	movs r1, #1
	strb r1, [r0]
	ldr r0, [r5]
	strb r6, [r0, #0x10]
	ldrh r0, [r4, #0x38]
	ldrh r1, [r4, #0x36]
	cmp r0, r1
	blo _0803DBFC
	adds r0, r4, #0
	bl Proc_Break
_0803DBFC:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0803DC04: .4byte gSioSt

	thumb_func_start sub_803DC08
sub_803DC08: @ 0x0803DC08
	push {lr}
	ldr r2, _0803DC2C @ =gSioSt
	ldr r1, [r2]
	adds r3, r1, #0
	adds r3, #0x2e
	movs r0, #0
	strb r0, [r3]
	strh r0, [r1, #0x22]
	strh r0, [r1, #0x24]
	ldr r1, [r2]
	strh r0, [r1, #0x2c]
	strh r0, [r1, #0x2a]
	strh r0, [r1, #0x28]
	strh r0, [r1, #0x26]
	bl sub_803C748
	pop {r0}
	bx r0
	.align 2, 0
_0803DC2C: .4byte gSioSt

	thumb_func_start sub_803DC30
sub_803DC30: @ 0x0803DC30
	push {r4, lr}
	sub sp, #8
	adds r4, r0, #0
	add r1, sp, #4
	mov r0, sp
	movs r2, #0
	bl sub_803D7CC
	lsls r0, r0, #0x10
	cmp r0, #0
	beq _0803DC6C
	mov r0, sp
	ldrb r1, [r0]
	adds r0, r4, #0
	adds r0, #0x34
	strb r1, [r0]
	mov r0, sp
	ldrb r1, [r0, #1]
	lsls r1, r1, #8
	ldrb r0, [r0, #2]
	adds r0, r0, r1
	strh r0, [r4, #0x36]
	mov r0, sp
	ldrb r0, [r0, #3]
	adds r1, r4, #0
	adds r1, #0x3a
	strb r0, [r1]
	adds r0, r4, #0
	bl Proc_Break
_0803DC6C:
	add sp, #8
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_803DC74
sub_803DC74: @ 0x0803DC74
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r4, r0, #0
	ldr r5, _0803DCB0 @ =gBuf
	ldrh r0, [r4, #0x36]
	subs r0, #1
	ldrh r1, [r4, #0x38]
	cmp r1, r0
	bge _0803DCB4
	ldr r0, [r4, #0x30]
	mov r1, sp
	movs r2, #0
	bl sub_803D7CC
	lsls r0, r0, #0x10
	cmp r0, #0
	beq _0803DCFE
	ldr r0, [r4, #0x30]
	adds r0, #0x7a
	str r0, [r4, #0x30]
	movs r0, #0x64
	ldrh r1, [r4, #0x38]
	muls r0, r1, r0
	ldrh r1, [r4, #0x36]
	bl __divsi3
	adds r1, r4, #0
	adds r1, #0x3b
	strb r0, [r1]
	b _0803DCF8
	.align 2, 0
_0803DCB0: .4byte gBuf
_0803DCB4:
	adds r0, r5, #0
	mov r1, sp
	movs r2, #0
	bl sub_803D7CC
	lsls r0, r0, #0x10
	cmp r0, #0
	beq _0803DCFE
	movs r2, #0
	adds r3, r4, #0
	adds r3, #0x3a
	adds r6, r4, #0
	adds r6, #0x3b
	ldrb r0, [r3]
	cmp r2, r0
	bge _0803DCEA
_0803DCD4:
	ldr r1, [r4, #0x30]
	adds r0, r5, r2
	ldrb r0, [r0]
	strb r0, [r1]
	ldr r0, [r4, #0x30]
	adds r0, #1
	str r0, [r4, #0x30]
	adds r2, #1
	ldrb r1, [r3]
	cmp r2, r1
	blt _0803DCD4
_0803DCEA:
	movs r0, #0x64
	ldrh r1, [r4, #0x38]
	muls r0, r1, r0
	ldrh r1, [r4, #0x36]
	bl __divsi3
	strb r0, [r6]
_0803DCF8:
	ldrh r0, [r4, #0x38]
	adds r0, #1
	strh r0, [r4, #0x38]
_0803DCFE:
	ldr r1, [r4, #0x2c]
	cmp r1, #0
	beq _0803DD0A
	adds r0, r4, #0
	bl _call_via_r1
_0803DD0A:
	ldrh r0, [r4, #0x38]
	ldrh r1, [r4, #0x36]
	cmp r0, r1
	blo _0803DD18
	adds r0, r4, #0
	bl Proc_Break
_0803DD18:
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	thumb_func_start sub_803DD20
sub_803DD20: @ 0x0803DD20
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r7, r0, #0
	adds r4, r1, #0
	mov r8, r2
	lsls r3, r3, #0x18
	lsrs r6, r3, #0x18
	ldr r0, _0803DD3C @ =0x0079FF86
	cmp r4, r0
	bls _0803DD40
	movs r0, #1
	rsbs r0, r0, #0
	b _0803DD92
	.align 2, 0
_0803DD3C: .4byte 0x0079FF86
_0803DD40:
	adds r0, r4, #0
	movs r1, #0x7a
	bl __udivsi3
	adds r0, #1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	adds r0, r4, #0
	movs r1, #0x7a
	bl __umodsi3
	adds r4, r0, #0
	cmp r4, #0
	beq _0803DD62
	adds r0, r5, #1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
_0803DD62:
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	ldr r0, _0803DD9C @ =gUnk_08C07DB0
	ldr r1, [sp, #0x18]
	bl Proc_StartBlocking
	adds r3, r0, #0
	str r7, [r3, #0x30]
	adds r0, #0x34
	movs r2, #0
	strb r6, [r0]
	mov r0, r8
	str r0, [r3, #0x2c]
	movs r1, #0
	strh r5, [r3, #0x36]
	adds r0, r3, #0
	adds r0, #0x3a
	strb r4, [r0]
	adds r0, #1
	strb r1, [r0]
	strh r2, [r3, #0x38]
	adds r0, #1
	strb r1, [r0]
	movs r0, #0
_0803DD92:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0803DD9C: .4byte gUnk_08C07DB0

	thumb_func_start sub_803DDA0
sub_803DDA0: @ 0x0803DDA0
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	adds r1, r2, #0
	ldr r0, _0803DDC8 @ =gUnk_08C07DD0
	bl Proc_StartBlocking
	str r4, [r0, #0x2c]
	str r5, [r0, #0x30]
	adds r2, r0, #0
	adds r2, #0x3b
	movs r1, #0
	strb r1, [r2]
	movs r2, #0
	strh r1, [r0, #0x38]
	adds r0, #0x3c
	strb r2, [r0]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0803DDC8: .4byte gUnk_08C07DD0

	thumb_func_start sub_803DDCC
sub_803DDCC: @ 0x0803DDCC
	push {lr}
	ldr r0, _0803DDE8 @ =gUnk_08C07DB0
	bl Proc_Find
	cmp r0, #0
	bne _0803DDF0
	ldr r0, _0803DDEC @ =gUnk_08C07DD0
	bl Proc_Find
	cmp r0, #0
	bne _0803DDF0
	movs r0, #0
	b _0803DDF2
	.align 2, 0
_0803DDE8: .4byte gUnk_08C07DB0
_0803DDEC: .4byte gUnk_08C07DD0
_0803DDF0:
	movs r0, #1
_0803DDF2:
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start SioStrCpy
SioStrCpy: @ 0x0803DDF8
	movs r3, #0
	b _0803DE04
_0803DDFC:
	strb r2, [r1]
	adds r0, #1
	adds r1, #1
	adds r3, #1
_0803DE04:
	ldrb r2, [r0]
	cmp r2, #0
	bne _0803DDFC
	ldrb r0, [r0]
	strb r0, [r1]
	adds r0, r3, #0
	bx lr
	.align 2, 0

	thumb_func_start SioDrawNumber
SioDrawNumber: @ 0x0803DE14
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r5, r2, #0
	adds r6, r3, #0
	bl Text_SetCursor
	adds r0, r4, #0
	adds r1, r5, #0
	bl Text_SetColor
	adds r0, r4, #0
	adds r1, r6, #0
	bl Text_DrawNumber
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start SioInit
SioInit: @ 0x0803DE38
	push {lr}
	bl SioRegisterIrq
	bl sub_803C8C8
	ldr r2, _0803DE54 @ =gSioSt
	ldr r1, [r2]
	movs r3, #0
	movs r0, #1
	strb r0, [r1, #1]
	ldr r0, [r2]
	strh r3, [r0, #4]
	pop {r0}
	bx r0
	.align 2, 0
_0803DE54: .4byte gSioSt

	thumb_func_start SioPollingMsgAndAck
SioPollingMsgAndAck: @ 0x0803DE58
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r6, r0, #0
	ldr r0, _0803DE9C @ =0x00002586
	mov r1, sp
	strh r0, [r1]
	bl SioPollingMsg
	movs r5, #1
	rsbs r5, r5, #0
	cmp r0, r5
	beq _0803DE94
	ldr r4, _0803DEA0 @ =gSioSt
	ldr r1, [r4]
	movs r0, #0
	strb r0, [r1, #0x11]
	ldr r1, [r4]
	movs r0, #5
	strh r0, [r1, #4]
	bl GetSioIndex
	ldr r1, [r4]
	strb r0, [r1, #6]
	mov r0, sp
	adds r1, r5, #0
	bl SioSend16
	adds r0, r6, #0
	bl Proc_Break
_0803DE94:
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0803DE9C: .4byte 0x00002586
_0803DEA0: .4byte gSioSt

	thumb_func_start SetBmStLinkArenaFlag
SetBmStLinkArenaFlag: @ 0x0803DEA4
	ldr r0, _0803DEB0 @ =gBmSt
	movs r1, #0x40
	ldrb r2, [r0, #4]
	orrs r1, r2
	strb r1, [r0, #4]
	bx lr
	.align 2, 0
_0803DEB0: .4byte gBmSt

	thumb_func_start UnsetBmStLinkArenaFlag
UnsetBmStLinkArenaFlag: @ 0x0803DEB4
	ldr r1, _0803DEC0 @ =gBmSt
	movs r0, #0xbf
	ldrb r2, [r1, #4]
	ands r0, r2
	strb r0, [r1, #4]
	bx lr
	.align 2, 0
_0803DEC0: .4byte gBmSt

	thumb_func_start CheckInLinkArena
CheckInLinkArena: @ 0x0803DEC4
	ldr r0, _0803DED0 @ =gBmSt
	ldrb r0, [r0, #4]
	lsrs r0, r0, #6
	movs r1, #1
	ands r0, r1
	bx lr
	.align 2, 0
_0803DED0: .4byte gBmSt

	thumb_func_start sub_803DED4
sub_803DED4: @ 0x0803DED4
	ldr r1, _0803DEDC @ =0x0203D908
	movs r0, #0xff
	strb r0, [r1, #4]
	bx lr
	.align 2, 0
_0803DEDC: .4byte 0x0203D908

	thumb_func_start sub_803DEE0
sub_803DEE0: @ 0x0803DEE0
	push {r4, lr}
	ldr r3, _0803DF14 @ =0x030027CC
	ldr r1, _0803DF18 @ =0x0000FFE0
	ldrh r2, [r3]
	ands r1, r2
	movs r2, #4
	orrs r1, r2
	ldr r2, _0803DF1C @ =0x0000E0FF
	ands r1, r2
	movs r4, #0xd8
	lsls r4, r4, #5
	adds r2, r4, #0
	orrs r1, r2
	strh r1, [r3]
	movs r1, #0x3f
	ldrb r2, [r3]
	ands r1, r2
	strb r1, [r3]
	movs r1, #0
	strb r1, [r3, #8]
	strb r1, [r3, #9]
	strb r1, [r3, #0xa]
	str r1, [r0, #0x58]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0803DF14: .4byte 0x030027CC
_0803DF18: .4byte 0x0000FFE0
_0803DF1C: .4byte 0x0000E0FF

	thumb_func_start sub_803DF20
sub_803DF20: @ 0x0803DF20
	push {r4, r5, lr}
	ldr r1, [r0, #0x58]
	adds r1, #1
	str r1, [r0, #0x58]
	movs r4, #0x3f
	adds r3, r4, #0
	ands r3, r1
	cmp r3, #0x1f
	ble _0803DF36
	movs r0, #0x40
	subs r3, r0, r3
_0803DF36:
	cmp r3, #0x10
	ble _0803DF3C
	movs r3, #0x10
_0803DF3C:
	ldr r2, _0803DF74 @ =0x030027CC
	ldr r0, _0803DF78 @ =0x0000FFE0
	ldrh r1, [r2]
	ands r0, r1
	movs r1, #4
	orrs r0, r1
	ldr r1, _0803DF7C @ =0x0000E0FF
	ands r0, r1
	movs r5, #0xd8
	lsls r5, r5, #5
	adds r1, r5, #0
	orrs r0, r1
	strh r0, [r2]
	adds r0, r4, #0
	ldrb r1, [r2]
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r2]
	movs r1, #0
	strb r3, [r2, #8]
	movs r0, #0x10
	subs r0, r0, r3
	strb r0, [r2, #9]
	strb r1, [r2, #0xa]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0803DF74: .4byte 0x030027CC
_0803DF78: .4byte 0x0000FFE0
_0803DF7C: .4byte 0x0000E0FF

	thumb_func_start sub_803DF80
sub_803DF80: @ 0x0803DF80
	ldr r0, _0803DF90 @ =gDispIo
	ldrh r1, [r0, #0x20]
	adds r1, #1
	strh r1, [r0, #0x20]
	ldrh r1, [r0, #0x24]
	subs r1, #1
	strh r1, [r0, #0x24]
	bx lr
	.align 2, 0
_0803DF90: .4byte gDispIo

	thumb_func_start sub_803DF94
sub_803DF94: @ 0x0803DF94
	push {lr}
	adds r2, r0, #0
	ldr r0, _0803DFB4 @ =gSioSt
	ldr r0, [r0]
	ldr r1, _0803DFB8 @ =0x00001286
	strh r1, [r0, #0x30]
	ldr r1, _0803DFBC @ =0x00001B7E
	adds r0, r0, r1
	ldrh r0, [r0]
	cmp r0, #0
	beq _0803DFB0
	adds r0, r2, #0
	bl Proc_Break
_0803DFB0:
	pop {r0}
	bx r0
	.align 2, 0
_0803DFB4: .4byte gSioSt
_0803DFB8: .4byte 0x00001286
_0803DFBC: .4byte 0x00001B7E

	thumb_func_start sub_803DFC0
sub_803DFC0: @ 0x0803DFC0
	ldr r0, _0803DFD0 @ =gSioSt
	ldr r2, [r0]
	movs r1, #6
	ldrsb r1, [r2, r1]
	movs r0, #1
	lsls r0, r1
	strb r0, [r2, #0xa]
	bx lr
	.align 2, 0
_0803DFD0: .4byte gSioSt

	thumb_func_start sub_803DFD4
sub_803DFD4: @ 0x0803DFD4
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r0, _0803E014 @ =0x030046BC
	movs r2, #0
	movs r1, #0xc9
	strb r1, [r0]
	ldr r4, _0803E018 @ =gSioSt
	ldr r1, [r4]
	ldrb r1, [r1, #6]
	strb r1, [r0, #1]
	strh r2, [r0, #2]
	movs r1, #4
	bl sub_803D2E4
	ldr r4, [r4]
	ldrb r0, [r4, #9]
	ldrb r1, [r4, #0xa]
	ands r0, r1
	ldrb r1, [r4, #9]
	cmp r0, r1
	bne _0803E00E
	movs r1, #6
	ldrsb r1, [r4, r1]
	movs r0, #1
	lsls r0, r1
	strb r0, [r4, #0xa]
	adds r0, r5, #0
	bl Proc_Break
_0803E00E:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0803E014: .4byte 0x030046BC
_0803E018: .4byte gSioSt

	thumb_func_start sub_803E01C
sub_803E01C: @ 0x0803E01C
	push {lr}
	adds r2, r0, #0
	ldr r1, [r2, #0x30]
	ldr r0, [r2, #0x38]
	cmp r1, r0
	bge _0803E034
	ldr r0, [r2, #0x34]
	cmp r1, r0
	ble _0803E034
	ldr r0, [r2, #0x2c]
	bl sub_804A7EC
_0803E034:
	pop {r0}
	bx r0

	thumb_func_start sub_803E038
sub_803E038: @ 0x0803E038
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r6, r2, #0
	mov r8, r3
	ldr r7, [sp, #0x18]
	ldr r0, _0803E064 @ =gUnk_08C07E98
	adds r1, r4, #0
	bl Proc_Start
	str r5, [r0, #0x2c]
	str r6, [r0, #0x30]
	mov r1, r8
	str r1, [r0, #0x38]
	str r7, [r0, #0x34]
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0803E064: .4byte gUnk_08C07E98

	thumb_func_start sub_803E068
sub_803E068: @ 0x0803E068
	push {lr}
	ldr r0, _0803E074 @ =gUnk_08C07E98
	bl Proc_EndEach
	pop {r0}
	bx r0
	.align 2, 0
_0803E074: .4byte gUnk_08C07E98

	thumb_func_start sub_803E078
sub_803E078: @ 0x0803E078
	ldr r2, [r0, #0x30]
	adds r2, r2, r1
	str r2, [r0, #0x30]
	bx lr

	thumb_func_start ClearSioBG
ClearSioBG: @ 0x0803E080
	push {lr}
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
	ldr r0, _0803E0CC @ =gBg0Tm
	movs r1, #0
	bl TmFill
	ldr r0, _0803E0D0 @ =gBg1Tm
	movs r1, #0
	bl TmFill
	ldr r0, _0803E0D4 @ =gBg2Tm
	movs r1, #0
	bl TmFill
	movs r0, #7
	bl EnableBgSync
	pop {r0}
	bx r0
	.align 2, 0
_0803E0CC: .4byte gBg0Tm
_0803E0D0: .4byte gBg1Tm
_0803E0D4: .4byte gBg2Tm

	thumb_func_start sub_803E0D8
sub_803E0D8: @ 0x0803E0D8
	push {lr}
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
	ldr r0, _0803E12C @ =gBg0Tm
	movs r1, #0
	bl TmFill
	ldr r0, _0803E130 @ =gBg1Tm
	movs r1, #0
	bl TmFill
	ldr r0, _0803E134 @ =gBg2Tm
	movs r1, #0
	bl TmFill
	ldr r0, _0803E138 @ =gBg3Tm
	movs r1, #0
	bl TmFill
	movs r0, #0xf
	bl EnableBgSync
	pop {r0}
	bx r0
	.align 2, 0
_0803E12C: .4byte gBg0Tm
_0803E130: .4byte gBg1Tm
_0803E134: .4byte gBg2Tm
_0803E138: .4byte gBg3Tm

	thumb_func_start sub_803E13C
sub_803E13C: @ 0x0803E13C
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	adds r4, r1, #0
	lsls r1, r4, #3
	ldr r0, _0803E168 @ =gSioTexts2
	adds r5, r1, r0
	adds r0, r5, #0
	bl ClearText
	cmp r6, #0
	bge _0803E170
	lsls r1, r4, #7
	movs r0, #0x80
	lsls r0, r0, #3
	adds r1, r1, r0
	ldr r0, _0803E16C @ =gBg2Tm + 0x2
	adds r1, r1, r0
	adds r0, r5, #0
	bl PutText
	b _0803E196
	.align 2, 0
_0803E168: .4byte gSioTexts2
_0803E16C: .4byte gBg2Tm + 0x2
_0803E170:
	adds r0, r6, #0
	bl DecodeMsg
	adds r1, r0, #0
	adds r0, r5, #0
	bl Text_DrawString
	lsls r1, r4, #7
	movs r0, #0x80
	lsls r0, r0, #3
	adds r1, r1, r0
	ldr r0, _0803E19C @ =gBg2Tm + 0x2
	adds r1, r1, r0
	adds r0, r5, #0
	bl PutText
	movs r0, #4
	bl EnableBgSync
_0803E196:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0803E19C: .4byte gBg2Tm + 0x2

	thumb_func_start sub_803E1A0
sub_803E1A0: @ 0x0803E1A0
	push {r4, r5, lr}
	ldr r5, _0803E1E4 @ =0x0203D96C
	movs r4, #5
_0803E1A6:
	adds r0, r5, #0
	movs r1, #0xc
	bl InitText
	adds r5, #8
	subs r4, #1
	cmp r4, #0
	bge _0803E1A6
	ldr r5, _0803E1E8 @ =0x0203D914
	movs r4, #0xa
_0803E1BA:
	adds r0, r5, #0
	movs r1, #0xc
	bl InitText
	adds r5, #8
	subs r4, #1
	cmp r4, #0
	bge _0803E1BA
	ldr r5, _0803E1EC @ =gSioTexts2
	movs r4, #1
_0803E1CE:
	adds r0, r5, #0
	movs r1, #0x18
	bl InitText
	adds r5, #8
	subs r4, #1
	cmp r4, #0
	bge _0803E1CE
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0803E1E4: .4byte 0x0203D96C
_0803E1E8: .4byte 0x0203D914
_0803E1EC: .4byte gSioTexts2

	thumb_func_start sub_803E1F0
sub_803E1F0: @ 0x0803E1F0
	push {r4, r5, lr}
	sub sp, #8
	adds r5, r0, #0
	ldr r1, _0803E244 @ =gUnk_081DAE7D
	mov r0, sp
	movs r2, #8
	bl memcpy
	movs r1, #0
	movs r4, #4
	adds r0, r5, #0
	adds r0, #0x26
_0803E208:
	strh r1, [r0]
	subs r0, #2
	subs r4, #1
	cmp r4, #0
	bge _0803E208
	movs r4, #0
_0803E214:
	cmp r4, #4
	beq _0803E236
	adds r0, r5, #0
	adds r0, #0x28
	adds r0, r0, r4
	ldrb r0, [r0]
	cmp r0, #0
	beq _0803E236
	mov r1, sp
	adds r0, r1, r4
	movs r1, #0xff
	lsls r1, r1, #8
	ldrb r0, [r0]
	orrs r1, r0
	adds r0, r5, #0
	bl UnitAddItem
_0803E236:
	adds r4, #1
	cmp r4, #7
	ble _0803E214
	add sp, #8
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0803E244: .4byte gUnk_081DAE7D

	thumb_func_start SioPlaySoundEffect
SioPlaySoundEffect: @ 0x0803E248
	push {r4, lr}
	sub sp, #8
	adds r4, r0, #0
	ldr r1, _0803E278 @ =gUnk_081DAE86
	mov r0, sp
	movs r2, #8
	bl memcpy
	ldr r0, _0803E27C @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0803E26E
	lsls r0, r4, #1
	add r0, sp
	ldrh r0, [r0]
	bl m4aSongNumStart
_0803E26E:
	add sp, #8
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0803E278: .4byte gUnk_081DAE86
_0803E27C: .4byte gPlaySt

	thumb_func_start sub_803E280
sub_803E280: @ 0x0803E280
	push {r4, lr}
	ldr r4, _0803E2A0 @ =0x0203D9F4
	adds r0, r4, #0
	bl sub_80A2924
	movs r0, #8
	ldrb r1, [r4]
	orrs r0, r1
	strb r0, [r4]
	adds r0, r4, #0
	bl sub_80A28E8
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0803E2A0: .4byte 0x0203D9F4

	thumb_func_start sub_803E2A4
sub_803E2A4: @ 0x0803E2A4
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	ldr r0, _0803E2C8 @ =gpKeySt
	ldr r0, [r0]
	ldrh r4, [r0, #8]
	adds r3, r4, #0
	cmp r3, #0
	bne _0803E2D4
	ldr r1, _0803E2CC @ =0x0203DC30
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	cmp r0, #0x3b
	ble _0803E328
	ldr r0, _0803E2D0 @ =0x030013F4
	str r3, [r1]
	str r3, [r0]
	b _0803E328
	.align 2, 0
_0803E2C8: .4byte gpKeySt
_0803E2CC: .4byte 0x0203DC30
_0803E2D0: .4byte 0x030013F4
_0803E2D4:
	ldr r0, _0803E308 @ =0x0203DC30
	movs r6, #0
	str r6, [r0]
	ldr r1, _0803E30C @ =0x0203DC10
	ldr r2, _0803E310 @ =0x030013F0
	ldr r0, [r2]
	lsls r0, r0, #1
	adds r0, r0, r1
	strh r4, [r0]
	ldr r1, _0803E314 @ =0x030013F4
	ldr r4, [r1]
	lsls r0, r4, #1
	adds r0, r0, r5
	ldrh r0, [r0]
	cmp r3, r0
	bne _0803E31C
	adds r0, r4, #1
	str r0, [r1]
	lsls r0, r0, #1
	adds r0, r0, r5
	ldr r1, _0803E318 @ =0x0000FFFF
	ldrh r0, [r0]
	cmp r0, r1
	bne _0803E31E
	movs r0, #1
	b _0803E32A
	.align 2, 0
_0803E308: .4byte 0x0203DC30
_0803E30C: .4byte 0x0203DC10
_0803E310: .4byte 0x030013F0
_0803E314: .4byte 0x030013F4
_0803E318: .4byte 0x0000FFFF
_0803E31C:
	str r6, [r1]
_0803E31E:
	ldr r0, [r2]
	adds r0, #1
	movs r1, #0xf
	ands r0, r1
	str r0, [r2]
_0803E328:
	movs r0, #0
_0803E32A:
	pop {r4, r5, r6}
	pop {r1}
	bx r1

	thumb_func_start sub_803E330
sub_803E330: @ 0x0803E330
	push {lr}
	ldr r0, _0803E340 @ =gUnk_08C07ED0
	bl sub_803E2A4
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	pop {r1}
	bx r1
	.align 2, 0
_0803E340: .4byte gUnk_08C07ED0

	thumb_func_start sub_803E344
sub_803E344: @ 0x0803E344
	push {lr}
	adds r1, r0, #0
	ldr r0, _0803E354 @ =gUnk_08C07F98
	bl Proc_StartBlocking
	pop {r0}
	bx r0
	.align 2, 0
_0803E354: .4byte gUnk_08C07F98

	thumb_func_start sub_803E358
sub_803E358: @ 0x0803E358
	mov ip, r0
	mov r2, ip
	adds r2, #0x4a
	movs r3, #0
	movs r1, #0
	movs r0, #0xd8
	strh r0, [r2]
	mov r0, ip
	adds r0, #0x48
	strb r3, [r0]
	mov r0, ip
	str r1, [r0, #0x40]
	str r1, [r0, #0x3c]
	adds r0, #0x52
	strb r3, [r0]
	adds r2, #0xa
	movs r0, #0xff
	ldrb r1, [r2]
	orrs r1, r0
	strb r1, [r2]
	mov r1, ip
	adds r1, #0x53
	ldrb r2, [r1]
	orrs r0, r2
	strb r0, [r1]
	mov r0, ip
	adds r0, #0x4c
	strb r3, [r0]
	bx lr
	.align 2, 0

	thumb_func_start sub_803E394
sub_803E394: @ 0x0803E394
	push {r4, lr}
	ldr r0, _0803E3A0 @ =0x0203D908
	ldrb r0, [r0, #0xa]
	cmp r0, #0
	bne _0803E3A8
	b _0803E3C0
	.align 2, 0
_0803E3A0: .4byte 0x0203D908
_0803E3A4:
	movs r0, #1
	b _0803E3C2
_0803E3A8:
	movs r2, #0
	movs r3, #0x80
	ldr r1, _0803E3C8 @ =0x0203DA60
_0803E3AE:
	adds r0, r3, #0
	ldrb r4, [r1, #0xf]
	ands r0, r4
	cmp r0, #0
	bne _0803E3A4
	adds r1, #0x14
	adds r2, #1
	cmp r2, #9
	ble _0803E3AE
_0803E3C0:
	movs r0, #0
_0803E3C2:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0803E3C8: .4byte 0x0203DA60

	thumb_func_start sub_803E3CC
sub_803E3CC: @ 0x0803E3CC
	push {r4, lr}
	movs r2, #0
	movs r3, #0x80
	ldr r1, _0803E3E4 @ =0x0203DA60
_0803E3D4:
	adds r0, r3, #0
	ldrb r4, [r1, #0xf]
	ands r0, r4
	cmp r0, #0
	bne _0803E3E8
	movs r0, #1
	b _0803E3F2
	.align 2, 0
_0803E3E4: .4byte 0x0203DA60
_0803E3E8:
	adds r1, #0x14
	adds r2, #1
	cmp r2, #9
	ble _0803E3D4
	movs r0, #0
_0803E3F2:
	pop {r4}
	pop {r1}
	bx r1

	thumb_func_start sub_803E3F8
sub_803E3F8: @ 0x0803E3F8
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #0x10
	mov sb, r0
	lsls r1, r1, #0x18
	lsrs r4, r1, #0x18
	movs r7, #0
	ldr r1, _0803E428 @ =gUnk_08C07F80
	lsls r0, r4, #2
	adds r0, r0, r1
	ldr r0, [r0]
	mov r8, r0
	bl InitUnits
	cmp r4, #0
	beq _0803E42C
	cmp r4, #0
	blt _0803E4D6
	cmp r4, #2
	bgt _0803E4D6
	movs r6, #0
	b _0803E498
	.align 2, 0
_0803E428: .4byte gUnk_08C07F80
_0803E42C:
	movs r6, #0
	mov r1, sb
	lsls r0, r1, #4
	mov r1, r8
	adds r5, r0, r1
	movs r0, #1
	mov r8, r0
	movs r7, #0
_0803E43C:
	ldr r0, _0803E458 @ =0x0203DA60
	adds r4, r7, r0
	adds r0, r6, #0
	adds r1, r4, #0
	bl sub_80A25D8
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne _0803E45C
	ldrb r0, [r5, #4]
	strb r0, [r4, #0x10]
	strb r6, [r4, #0xf]
	b _0803E474
	.align 2, 0
_0803E458: .4byte 0x0203DA60
_0803E45C:
	ldr r0, _0803E494 @ =gUnk_081DAE90
	adds r1, r4, #0
	bl SioStrCpy
	ldrb r0, [r5, #5]
	strb r0, [r4, #0x10]
	movs r0, #0x80
	rsbs r0, r0, #0
	adds r1, r0, #0
	adds r0, r6, #0
	orrs r0, r1
	strb r0, [r4, #0xf]
_0803E474:
	mov r0, r8
	bl GetUnit
	adds r1, r0, #0
	adds r0, r6, #0
	mov r2, sp
	bl sub_80A2820
	movs r1, #5
	add r8, r1
	adds r7, #0x14
	adds r6, #1
	cmp r6, #9
	ble _0803E43C
	adds r7, r6, #0
	b _0803E4D6
	.align 2, 0
_0803E494: .4byte gUnk_081DAE90
_0803E498:
	lsls r0, r7, #2
	adds r5, r0, r7
	lsls r1, r5, #2
	ldr r0, _0803E4E8 @ =0x0203DA60
	adds r4, r1, r0
	adds r0, r6, #0
	adds r1, r4, #0
	bl sub_80A25D8
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne _0803E4D0
	mov r1, sb
	lsls r0, r1, #4
	add r0, r8
	ldrb r0, [r0, #4]
	strb r0, [r4, #0x10]
	strb r6, [r4, #0xf]
	adds r0, r5, #1
	bl GetUnit
	adds r1, r0, #0
	adds r0, r6, #0
	mov r2, sp
	bl sub_80A2820
	adds r7, #1
_0803E4D0:
	adds r6, #1
	cmp r6, #9
	ble _0803E498
_0803E4D6:
	adds r0, r7, #0
	add sp, #0x10
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0803E4E8: .4byte 0x0203DA60

	thumb_func_start sub_803E4EC
sub_803E4EC: @ 0x0803E4EC
	push {r4, r5, r6, lr}
	mov r6, sb
	mov r5, r8
	push {r5, r6}
	adds r5, r0, #0
	lsls r0, r5, #3
	mov r8, r0
	ldr r6, _0803E554 @ =0x0203D914
	adds r0, r0, r6
	mov sb, r0
	bl ClearText
	mov r0, sb
	movs r1, #0
	bl Text_SetColor
	lsls r4, r5, #2
	adds r4, r4, r5
	lsls r4, r4, #2
	ldr r0, _0803E558 @ =0x0203DA60
	adds r4, r4, r0
	mov r0, sb
	adds r1, r4, #0
	bl Text_DrawString
	subs r6, #0xc
	add r8, r6
	ldr r1, _0803E55C @ =0x00000FFF
	mov r2, r8
	ldrh r2, [r2, #0xc]
	ands r1, r2
	movs r0, #0xf
	ldrb r4, [r4, #0x10]
	ands r0, r4
	lsls r0, r0, #0xc
	orrs r1, r0
	mov r0, r8
	strh r1, [r0, #0xc]
	lsls r5, r5, #7
	ldr r0, _0803E560 @ =gBg1Tm + 0x16
	adds r5, r5, r0
	mov r0, sb
	adds r1, r5, #0
	bl PutText
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0803E554: .4byte 0x0203D914
_0803E558: .4byte 0x0203DA60
_0803E55C: .4byte 0x00000FFF
_0803E560: .4byte gBg1Tm + 0x16

	thumb_func_start sub_803E564
sub_803E564: @ 0x0803E564
	push {r4, r5, lr}
	adds r5, r0, #0
	movs r4, #0
	b _0803E574
_0803E56C:
	adds r0, r4, #0
	bl sub_803E4EC
	adds r4, #1
_0803E574:
	ldr r0, [r5, #0x38]
	cmp r4, r0
	blt _0803E56C
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start sub_803E580
sub_803E580: @ 0x0803E580
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #8
	adds r4, r0, #0
	lsls r1, r1, #0x18
	ldr r0, _0803E5C0 @ =gUnk_08C07F80
	lsrs r1, r1, #0x16
	adds r1, r1, r0
	ldr r1, [r1]
	mov r8, r1
	movs r6, #0
	ldr r0, [r4, #0x38]
	cmp r6, r0
	bge _0803E60C
	ldr r0, _0803E5C4 @ =0x0203D908
	adds r5, r0, #0
	adds r5, #0xc
	ldr r3, _0803E5C8 @ =0x0203DA60
	movs r2, #0
_0803E5A8:
	ldr r0, _0803E5C8 @ =0x0203DA60
	adds r1, r2, r0
	movs r0, #0x80
	ldrb r7, [r1, #0xf]
	ands r0, r7
	cmp r0, #0
	bne _0803E5CC
	ldr r0, [r4, #0x3c]
	lsls r0, r0, #4
	add r0, r8
	ldrb r0, [r0, #4]
	b _0803E5D4
	.align 2, 0
_0803E5C0: .4byte gUnk_08C07F80
_0803E5C4: .4byte 0x0203D908
_0803E5C8: .4byte 0x0203DA60
_0803E5CC:
	ldr r0, [r4, #0x3c]
	lsls r0, r0, #4
	add r0, r8
	ldrb r0, [r0, #5]
_0803E5D4:
	strb r0, [r1, #0x10]
	ldr r0, _0803E620 @ =0x00000FFF
	adds r1, r0, #0
	ldrh r7, [r5]
	ands r1, r7
	movs r0, #0xf
	ldrb r7, [r3, #0x10]
	ands r0, r7
	lsls r0, r0, #0xc
	orrs r1, r0
	strh r1, [r5]
	lsls r1, r6, #7
	ldr r0, _0803E624 @ =gBg1Tm + 0x16
	adds r1, r1, r0
	adds r0, r5, #0
	str r2, [sp]
	str r3, [sp, #4]
	bl PutText
	adds r5, #8
	ldr r3, [sp, #4]
	adds r3, #0x14
	ldr r2, [sp]
	adds r2, #0x14
	adds r6, #1
	ldr r0, [r4, #0x38]
	cmp r6, r0
	blt _0803E5A8
_0803E60C:
	movs r0, #2
	bl EnableBgSync
	add sp, #8
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0803E620: .4byte 0x00000FFF
_0803E624: .4byte gBg1Tm + 0x16

	thumb_func_start sub_803E628
sub_803E628: @ 0x0803E628
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	adds r7, r0, #0
	ldr r5, [r7, #0x40]
	ldr r1, _0803E6AC @ =gUnk_08C07F80
	ldr r0, _0803E6B0 @ =0x0203D908
	mov sb, r0
	ldrb r2, [r0]
	lsls r0, r2, #2
	adds r0, r0, r1
	ldr r0, [r0]
	mov r8, r0
	lsls r4, r5, #2
	adds r4, r4, r5
	adds r0, r4, #1
	bl GetUnit
	adds r6, r0, #0
	ldr r0, _0803E6B4 @ =0x0203DA60
	lsls r4, r4, #2
	adds r4, r4, r0
	movs r0, #0x7f
	ldrb r3, [r4, #0xf]
	ands r0, r3
	bl sub_80A2658
	adds r0, r5, #0
	adds r1, r6, #0
	adds r2, r4, #0
	bl sub_80A2820
	ldr r0, _0803E6B8 @ =gUnk_081DAE90
	adds r1, r4, #0
	bl SioStrCpy
	ldr r0, [r7, #0x3c]
	lsls r0, r0, #4
	add r0, r8
	ldrb r0, [r0, #5]
	strb r0, [r4, #0x10]
	movs r0, #0x80
	rsbs r0, r0, #0
	adds r1, r0, #0
	adds r0, r5, #0
	orrs r0, r1
	strb r0, [r4, #0xf]
	adds r0, r5, #0
	bl sub_803E4EC
	bl sub_803E3CC
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0803E6BC
	mov r1, sb
	ldrb r0, [r1]
	adds r1, r7, #0
	bl sub_803E7F4
	adds r0, r7, #0
	movs r1, #2
	bl Proc_Goto
	b _0803E6D0
	.align 2, 0
_0803E6AC: .4byte gUnk_08C07F80
_0803E6B0: .4byte 0x0203D908
_0803E6B4: .4byte 0x0203DA60
_0803E6B8: .4byte gUnk_081DAE90
_0803E6BC:
	adds r0, r7, #0
	adds r0, #0x4d
	ldrb r0, [r0]
	cmp r0, #0
	bne _0803E6D0
	mov r2, sb
	ldrb r0, [r2]
	adds r1, r7, #0
	bl sub_803E7F4
_0803E6D0:
	ldr r0, [r7, #0x38]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r1, r7, #0
	adds r1, #0x4a
	ldrh r1, [r1]
	adds r1, #0x28
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	bl sub_8049438
	movs r0, #2
	bl EnableBgSync
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_803E6F8
sub_803E6F8: @ 0x0803E6F8
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	mov sb, r0
	ldr r7, [r0, #0x40]
	adds r0, #0x53
	ldrb r0, [r0]
	mov r8, r0
	ldr r2, _0803E760 @ =0x0203DA60
	lsls r5, r0, #2
	add r5, r8
	lsls r0, r5, #2
	adds r6, r0, r2
	movs r1, #0x7f
	adds r0, r1, #0
	ldrb r3, [r6, #0xf]
	ands r0, r3
	lsls r4, r7, #2
	adds r4, r4, r7
	lsls r4, r4, #2
	adds r4, r4, r2
	ldrb r2, [r4, #0xf]
	ands r1, r2
	bl sub_80A2724
	ldrb r1, [r6, #0x10]
	ldrb r0, [r4, #0x10]
	strb r0, [r6, #0x10]
	strb r1, [r4, #0x10]
	adds r5, #1
	adds r0, r5, #0
	bl GetUnit
	adds r1, r0, #0
	mov r0, r8
	adds r2, r6, #0
	bl sub_80A2820
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0803E768
	ldr r0, _0803E764 @ =gUnk_081DAE90
	adds r1, r6, #0
	bl SioStrCpy
	movs r3, #0x80
	rsbs r3, r3, #0
	adds r1, r3, #0
	mov r0, r8
	orrs r0, r1
	b _0803E76A
	.align 2, 0
_0803E760: .4byte 0x0203DA60
_0803E764: .4byte gUnk_081DAE90
_0803E768:
	mov r0, r8
_0803E76A:
	strb r0, [r6, #0xf]
	lsls r4, r7, #2
	adds r4, r4, r7
	adds r0, r4, #1
	bl GetUnit
	adds r1, r0, #0
	lsls r4, r4, #2
	ldr r0, _0803E7A4 @ =0x0203DA60
	adds r4, r4, r0
	adds r0, r7, #0
	adds r2, r4, #0
	bl sub_80A2820
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0803E7AC
	ldr r0, _0803E7A8 @ =gUnk_081DAE90
	adds r1, r4, #0
	bl SioStrCpy
	movs r2, #0x80
	rsbs r2, r2, #0
	adds r1, r2, #0
	adds r0, r7, #0
	orrs r0, r1
	strb r0, [r4, #0xf]
	b _0803E7AE
	.align 2, 0
_0803E7A4: .4byte 0x0203DA60
_0803E7A8: .4byte gUnk_081DAE90
_0803E7AC:
	strb r7, [r4, #0xf]
_0803E7AE:
	adds r0, r7, #0
	bl sub_803E4EC
	mov r0, r8
	bl sub_803E4EC
	mov r3, sb
	ldr r0, [r3, #0x38]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r1, sb
	adds r1, #0x4a
	ldrh r1, [r1]
	adds r1, #0x28
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	bl sub_8049438
	mov r1, sb
	ldr r0, [r1, #0x30]
	bl Proc_End
	mov r1, sb
	adds r1, #0x52
	movs r0, #4
	strb r0, [r1]
	movs r0, #2
	bl EnableBgSync
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_803E7F4
sub_803E7F4: @ 0x0803E7F4
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #4
	mov r8, r1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r6, #0
	ldr r2, _0803E868 @ =gUnk_08C07F80
	lsls r1, r0, #2
	adds r1, r1, r2
	ldr r7, [r1]
	cmp r0, #1
	bne _0803E878
	ldr r1, _0803E86C @ =0x0203D908
	ldrb r0, [r1, #5]
	adds r0, #2
	cmp r6, r0
	bge _0803E85E
	mov sb, r1
	movs r0, #5
	mov r8, r0
	mov r5, sb
	adds r5, #0x64
	movs r7, #0
_0803E828:
	ldr r4, _0803E870 @ =0x0203DC34
	adds r4, r7, r4
	ldr r0, _0803E874 @ =gUnk_081DAE9C
	adds r1, r4, #0
	bl SioStrCpy
	adds r0, r5, #0
	bl ClearText
	movs r0, #0xa
	str r0, [sp]
	adds r0, r5, #0
	movs r1, #1
	mov r2, r8
	adds r3, r4, #0
	bl sub_8015324
	movs r1, #3
	add r8, r1
	adds r5, #8
	adds r7, #0xf
	adds r6, #1
	mov r1, sb
	ldrb r0, [r1, #5]
	adds r0, #2
	cmp r6, r0
	blt _0803E828
_0803E85E:
	ldr r0, _0803E86C @ =0x0203D908
	ldrb r0, [r0, #5]
	adds r0, #2
	b _0803E8D8
	.align 2, 0
_0803E868: .4byte gUnk_08C07F80
_0803E86C: .4byte 0x0203D908
_0803E870: .4byte 0x0203DC34
_0803E874: .4byte gUnk_081DAE9C
_0803E878:
	lsls r0, r6, #4
	adds r1, r0, r7
	ldr r0, [r1, #8]
	cmp r0, #0
	bne _0803E886
	adds r0, r6, #0
	b _0803E8D8
_0803E886:
	mov r0, r8
	adds r0, #0x4d
	adds r4, r0, r6
	movs r0, #1
	strb r0, [r4]
	movs r5, #0
	ldr r0, [r1, #0xc]
	cmp r0, #0
	beq _0803E8A6
	bl _call_via_r0
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0803E8A6
	strb r5, [r4]
	movs r5, #1
_0803E8A6:
	lsls r4, r6, #3
	ldr r0, _0803E8D4 @ =0x0203D96C
	adds r4, r4, r0
	adds r0, r4, #0
	bl ClearText
	adds r0, r4, #0
	adds r1, r5, #0
	bl Text_SetColor
	lsls r2, r6, #1
	adds r2, #5
	lsls r0, r6, #4
	adds r0, r0, r7
	ldr r3, [r0, #8]
	movs r0, #7
	str r0, [sp]
	adds r0, r4, #0
	movs r1, #1
	bl sub_8015324
	adds r6, #1
	b _0803E878
	.align 2, 0
_0803E8D4: .4byte 0x0203D96C
_0803E8D8:
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_803E8E8
sub_803E8E8: @ 0x0803E8E8
	adds r3, r0, #0
	ldr r2, _0803E904 @ =gUnk_08C07F80
	ldr r0, _0803E908 @ =0x0203D908
	ldrb r1, [r0]
	lsls r0, r1, #2
	adds r0, r0, r2
	ldr r2, [r0]
	cmp r1, #1
	beq _0803E90C
	ldr r0, [r3, #0x3c]
	lsls r0, r0, #4
	adds r0, r0, r2
	ldrh r0, [r0, #2]
	b _0803E91E
	.align 2, 0
_0803E904: .4byte gUnk_08C07F80
_0803E908: .4byte 0x0203D908
_0803E90C:
	ldr r0, [r3, #0x3c]
	cmp r0, #0
	beq _0803E91C
	ldr r0, _0803E918 @ =0x000003C6
	b _0803E91E
	.align 2, 0
_0803E918: .4byte 0x000003C6
_0803E91C:
	ldr r0, _0803E920 @ =0x000003C5
_0803E91E:
	bx lr
	.align 2, 0
_0803E920: .4byte 0x000003C5

	thumb_func_start sub_803E924
sub_803E924: @ 0x0803E924
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #0x10
	adds r7, r0, #0
	ldr r4, _0803EB04 @ =Pal_Text
	bl ClearSioBG
	bl InitSioBG
	ldr r0, _0803EB08 @ =Img_TacticianSelObj
	ldr r1, _0803EB0C @ =0x06014800
	bl Decompress
	movs r0, #0
	movs r1, #2
	bl sub_80483C0
	ldr r0, _0803EB10 @ =gBg2Tm + 0x112
	ldr r1, _0803EB14 @ =gUnk_081CDB10
	movs r2, #0x80
	lsls r2, r2, #5
	bl TmApplyTsa_thm
	ldr r0, _0803EB18 @ =Pal_TacticianSelObj
	movs r1, #0x98
	lsls r1, r1, #2
	movs r2, #0x80
	bl ApplyPaletteExt
	ldr r0, _0803EB1C @ =gUnk_081CBC70
	ldr r1, _0803EB20 @ =0x06016000
	bl Decompress
	ldr r0, _0803EB24 @ =Pal_SysBrownBox
	movs r1, #0x88
	lsls r1, r1, #2
	movs r2, #0x40
	bl ApplyPaletteExt
	ldr r2, _0803EB28 @ =gPal
	adds r1, r2, #0
	adds r1, #0x40
	movs r0, #0
	strh r0, [r1]
	adds r2, #0x42
	movs r3, #2
_0803E982:
	ldrh r0, [r4, #8]
	strh r0, [r2]
	adds r4, #2
	adds r2, #2
	subs r3, #1
	cmp r3, #0
	bge _0803E982
	bl EnablePalSync
	ldr r0, _0803EB2C @ =0x0203DA48
	bl SetTextFont
	bl InitSystemTextFont
	bl ResetTextFont
	bl sub_803E1A0
	bl ApplyUnitSpritePalettes
	bl ResetUnitSprites
	bl sub_8025A0C
	ldr r0, [r7, #0x3c]
	ldr r1, _0803EB30 @ =0x0203D908
	ldrb r1, [r1]
	bl sub_803E3F8
	str r0, [r7, #0x38]
	adds r6, r7, #0
	adds r6, #0x5c
	adds r5, r7, #0
	adds r5, #0x4a
	movs r1, #0
	add r0, sp, #0xc
_0803E9CA:
	strb r1, [r0]
	subs r0, #1
	add r2, sp, #8
	cmp r0, r2
	bge _0803E9CA
	ldr r0, [r7, #0x3c]
	mov r1, sp
	adds r1, r1, r0
	adds r1, #8
	movs r0, #1
	strb r0, [r1]
	ldr r4, _0803EB30 @ =0x0203D908
	ldrb r0, [r4]
	adds r1, r7, #0
	bl sub_803E7F4
	str r0, [r7, #0x34]
	adds r0, r7, #0
	bl sub_803E564
	ldr r1, [r7, #0x34]
	adds r0, r7, #0
	add r2, sp, #8
	bl sub_8048CF0
	str r0, [r7, #0x2c]
	movs r3, #0
	adds r4, #6
	movs r2, #0xff
_0803EA04:
	adds r1, r3, r4
	ldrb r0, [r1]
	orrs r0, r2
	strb r0, [r1]
	adds r3, #1
	cmp r3, #3
	ble _0803EA04
	movs r4, #0
	strb r4, [r6]
	ldrh r2, [r5]
	movs r0, #1
	movs r1, #0
	bl SetBgOffset
	ldr r0, _0803EB34 @ =gDispIo
	mov ip, r0
	movs r0, #0x20
	mov r1, ip
	ldrb r1, [r1, #1]
	orrs r0, r1
	movs r1, #0x40
	orrs r0, r1
	movs r1, #0x7f
	ands r0, r1
	mov r2, ip
	strb r0, [r2, #1]
	mov r0, ip
	adds r0, #0x2d
	strb r4, [r0]
	mov r1, ip
	adds r1, #0x31
	movs r0, #0x28
	strb r0, [r1]
	mov r0, ip
	adds r0, #0x2c
	movs r2, #0xf0
	strb r2, [r0]
	adds r0, #4
	movs r1, #0x88
	strb r1, [r0]
	subs r0, #1
	strb r4, [r0]
	adds r0, #4
	strb r1, [r0]
	subs r0, #5
	strb r2, [r0]
	mov r1, ip
	adds r1, #0x32
	movs r0, #0xa0
	strb r0, [r1]
	mov r5, ip
	adds r5, #0x34
	movs r2, #1
	ldrb r0, [r5]
	orrs r0, r2
	movs r1, #2
	orrs r0, r1
	movs r4, #4
	orrs r0, r4
	movs r3, #8
	orrs r0, r3
	movs r6, #0x10
	orrs r0, r6
	strb r0, [r5]
	movs r0, #0x35
	add r0, ip
	mov r8, r0
	ldrb r0, [r0]
	orrs r0, r2
	movs r5, #3
	rsbs r5, r5, #0
	ands r0, r5
	orrs r0, r4
	orrs r0, r3
	movs r1, #0x11
	rsbs r1, r1, #0
	ands r0, r1
	mov r1, r8
	strb r0, [r1]
	mov r0, ip
	adds r0, #0x36
	ldrb r1, [r0]
	orrs r2, r1
	ands r2, r5
	orrs r2, r4
	orrs r2, r3
	orrs r2, r6
	strb r2, [r0]
	ldr r0, [r7, #0x2c]
	ldr r1, _0803EB38 @ =gUnk_081DAEC8
	ldr r4, _0803EB30 @ =0x0203D908
	ldrb r2, [r4]
	adds r1, r2, r1
	ldrb r1, [r1]
	bl sub_804856C
	ldr r0, _0803EB3C @ =gUnk_08C07F8C
	ldrb r3, [r4]
	lsls r1, r3, #2
	adds r0, r1, r0
	ldr r0, [r0]
	ldr r2, _0803EB40 @ =gUnk_081DAEBC
	adds r1, r1, r2
	ldr r1, [r1]
	str r3, [sp]
	ldr r2, [r7, #0x2c]
	str r2, [sp, #4]
	movs r2, #0
	movs r3, #8
	bl sub_8048670
	adds r0, r7, #0
	bl sub_803E8E8
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	movs r1, #1
	bl sub_803E13C
	movs r0, #0xf
	bl EnableBgSync
	add sp, #0x10
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0803EB04: .4byte Pal_Text
_0803EB08: .4byte Img_TacticianSelObj
_0803EB0C: .4byte 0x06014800
_0803EB10: .4byte gBg2Tm + 0x112
_0803EB14: .4byte gUnk_081CDB10
_0803EB18: .4byte Pal_TacticianSelObj
_0803EB1C: .4byte gUnk_081CBC70
_0803EB20: .4byte 0x06016000
_0803EB24: .4byte Pal_SysBrownBox
_0803EB28: .4byte gPal
_0803EB2C: .4byte 0x0203DA48
_0803EB30: .4byte 0x0203D908
_0803EB34: .4byte gDispIo
_0803EB38: .4byte gUnk_081DAEC8
_0803EB3C: .4byte gUnk_08C07F8C
_0803EB40: .4byte gUnk_081DAEBC

	thumb_func_start sub_803EB44
sub_803EB44: @ 0x0803EB44
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	lsls r1, r1, #0x18
	lsrs r7, r1, #0x18
	lsls r2, r2, #0x18
	lsrs r5, r2, #0x18
	lsls r3, r3, #0x18
	lsrs r6, r3, #0x18
	ldr r1, _0803EBA4 @ =gpKeySt
	ldr r2, [r1]
	ldrh r3, [r2, #6]
	movs r0, #0x40
	ands r0, r3
	cmp r0, #0
	beq _0803EB7A
	ldr r0, [r4]
	cmp r0, r5
	bgt _0803EB6E
	ldrh r2, [r2, #8]
	cmp r3, r2
	bne _0803EB7A
_0803EB6E:
	subs r0, #1
	str r0, [r4]
	cmp r0, #0
	bge _0803EB7A
	subs r0, r6, #1
	str r0, [r4]
_0803EB7A:
	ldr r1, [r1]
	ldrh r2, [r1, #6]
	movs r0, #0x80
	ands r0, r2
	cmp r0, #0
	beq _0803EB9E
	ldr r0, [r4]
	cmp r0, r7
	blt _0803EB92
	ldrh r1, [r1, #8]
	cmp r2, r1
	bne _0803EB9E
_0803EB92:
	adds r0, #1
	str r0, [r4]
	adds r1, r6, #0
	bl __modsi3
	str r0, [r4]
_0803EB9E:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0803EBA4: .4byte gpKeySt

	thumb_func_start sub_803EBA8
sub_803EBA8: @ 0x0803EBA8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	adds r4, r0, #0
	ldr r6, [r4, #0x3c]
	ldr r1, _0803EC74 @ =gUnk_08C07F80
	ldr r0, _0803EC78 @ =0x0203D908
	mov r8, r0
	ldrb r2, [r0]
	lsls r0, r2, #2
	adds r0, r0, r1
	ldr r0, [r0]
	mov sb, r0
	ldr r5, [r4, #0x2c]
	adds r0, r5, #0
	adds r0, #0x44
	movs r3, #0
	mov sl, r3
	movs r7, #1
	strb r7, [r0]
	movs r0, #1
	rsbs r0, r0, #0
	str r0, [r5, #0x48]
	adds r0, r4, #0
	adds r0, #0x3c
	ldr r3, [r4, #0x34]
	subs r1, r3, #1
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	movs r2, #0
	bl sub_803EB44
	ldr r0, [r4, #0x3c]
	cmp r6, r0
	beq _0803EC26
	movs r0, #3
	bl SioPlaySoundEffect
	adds r0, r5, #0
	adds r0, #0x3a
	adds r1, r0, r6
	mov r2, sl
	strb r2, [r1]
	ldr r1, [r4, #0x3c]
	adds r0, r0, r1
	strb r7, [r0]
	mov r3, r8
	ldrb r1, [r3]
	adds r0, r4, #0
	bl sub_803E580
	adds r0, r4, #0
	bl sub_803E8E8
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	movs r1, #1
	bl sub_803E13C
_0803EC26:
	ldr r0, _0803EC7C @ =gpKeySt
	ldr r1, [r0]
	adds r0, r7, #0
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _0803ECB8
	mov r0, r8
	ldrb r0, [r0]
	cmp r0, #1
	beq _0803EC96
	adds r0, r4, #0
	adds r0, #0x4d
	ldr r1, [r4, #0x3c]
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #0
	beq _0803EC8E
	lsls r0, r1, #4
	add r0, sb
	ldrb r0, [r0]
	adds r1, r4, #0
	adds r1, #0x52
	strb r0, [r1]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #7
	bne _0803EC80
	movs r0, #1
	bl SioPlaySoundEffect
	adds r0, r4, #0
	movs r1, #9
	bl Proc_Goto
	movs r0, #0xff
	mov r1, r8
	strb r0, [r1, #3]
	b _0803ED14
	.align 2, 0
_0803EC74: .4byte gUnk_08C07F80
_0803EC78: .4byte 0x0203D908
_0803EC7C: .4byte gpKeySt
_0803EC80:
	movs r0, #2
	bl SioPlaySoundEffect
	adds r0, r4, #0
	bl Proc_Break
	b _0803ECB8
_0803EC8E:
	movs r0, #0
	bl SioPlaySoundEffect
	b _0803ECB8
_0803EC96:
	movs r0, #2
	bl SioPlaySoundEffect
	adds r1, r4, #0
	adds r1, #0x52
	movs r0, #8
	strb r0, [r1]
	ldr r0, [r4, #0x3c]
	adds r1, #1
	strb r0, [r1]
	mov r2, sl
	str r2, [r4, #0x44]
	adds r0, r4, #0
	movs r1, #5
	bl Proc_Goto
	b _0803ED14
_0803ECB8:
	ldr r5, _0803ED24 @ =gpKeySt
	ldr r1, [r5]
	movs r0, #2
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _0803ECDA
	movs r0, #1
	bl SioPlaySoundEffect
	adds r0, r4, #0
	movs r1, #9
	bl Proc_Goto
	ldr r1, _0803ED28 @ =0x0203D908
	movs r0, #0xff
	strb r0, [r1, #3]
_0803ECDA:
	ldr r1, [r5]
	movs r0, #8
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _0803ED14
	adds r0, r4, #0
	adds r0, #0x5c
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _0803ED14
	ldr r0, _0803ED2C @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0803ED06
	ldr r0, _0803ED30 @ =0x0000038A
	bl m4aSongNumStart
_0803ED06:
	ldr r1, _0803ED28 @ =0x0203D908
	movs r0, #0
	strb r0, [r1, #3]
	adds r0, r4, #0
	movs r1, #9
	bl Proc_Goto
_0803ED14:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0803ED24: .4byte gpKeySt
_0803ED28: .4byte 0x0203D908
_0803ED2C: .4byte gPlaySt
_0803ED30: .4byte 0x0000038A

	thumb_func_start sub_803ED34
sub_803ED34: @ 0x0803ED34
	push {r4, lr}
	sub sp, #0x10
	adds r4, r0, #0
	ldr r0, [r4, #0x2c]
	bl Proc_End
	bl sub_8048494
	bl InitUnits
	movs r0, #1
	bl GetUnit
	adds r1, r0, #0
	ldr r3, _0803ED74 @ =0x0203DA60
	ldr r2, [r4, #0x40]
	lsls r0, r2, #2
	adds r0, r0, r2
	lsls r0, r0, #2
	adds r0, r0, r3
	ldrb r0, [r0, #0xf]
	mov r2, sp
	bl sub_80A2820
	adds r0, r4, #0
	bl sub_808B4F0
	add sp, #0x10
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0803ED74: .4byte 0x0203DA60

	thumb_func_start sub_803ED78
sub_803ED78: @ 0x0803ED78
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0803ED94 @ =gUnk_08D8B82C
	bl Proc_Find
	cmp r0, #0
	bne _0803ED8C
	adds r0, r4, #0
	bl Proc_Break
_0803ED8C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0803ED94: .4byte gUnk_08D8B82C

	thumb_func_start sub_803ED98
sub_803ED98: @ 0x0803ED98
	movs r1, #0
	ldr r2, _0803EDB4 @ =0x0203D908
	ldrb r0, [r2, #5]
	adds r0, #2
	cmp r1, r0
	bge _0803EDBE
	adds r3, r2, #6
	adds r2, r0, #0
_0803EDA8:
	adds r0, r1, r3
	ldrb r0, [r0]
	cmp r0, #0xff
	bne _0803EDB8
	movs r0, #0
	b _0803EDC0
	.align 2, 0
_0803EDB4: .4byte 0x0203D908
_0803EDB8:
	adds r1, #1
	cmp r1, r2
	blt _0803EDA8
_0803EDBE:
	movs r0, #1
_0803EDC0:
	bx lr
	.align 2, 0

	thumb_func_start sub_803EDC4
sub_803EDC4: @ 0x0803EDC4
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	adds r7, r0, #0
	ldr r0, [r7, #0x40]
	mov sb, r0
	ldr r1, [r7, #0x2c]
	str r1, [sp, #4]
	ldr r0, _0803EE08 @ =gUnk_08C07EC0
	bl sub_803E2A4
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0803EE10
	ldr r0, _0803EE0C @ =0x0203DA60
	mov r2, sb
	lsls r1, r2, #2
	add r1, sb
	lsls r1, r1, #2
	adds r1, r1, r0
	movs r0, #0x80
	ldrb r1, [r1, #0xf]
	ands r0, r1
	cmp r0, #0
	bne _0803EE10
	adds r0, r7, #0
	movs r1, #8
	bl Proc_Goto
	b _0803F2B4
	.align 2, 0
_0803EE08: .4byte gUnk_08C07EC0
_0803EE0C: .4byte 0x0203DA60
_0803EE10:
	ldr r1, [sp, #4]
	adds r1, #0x44
	movs r0, #0
	strb r0, [r1]
	adds r1, r7, #0
	adds r1, #0x48
	ldr r0, [r7, #0x40]
	ldrb r3, [r1]
	subs r0, r0, r3
	lsls r0, r0, #4
	adds r0, #0x28
	ldr r2, [sp, #4]
	str r0, [r2, #0x48]
	adds r0, r7, #0
	adds r0, #0x4c
	movs r2, #0
	ldrsb r2, [r0, r2]
	mov sl, r1
	str r0, [sp, #8]
	cmp r2, #0
	ble _0803EE72
	adds r4, r7, #0
	adds r4, #0x4a
	ldrh r0, [r4]
	subs r0, #4
	strh r0, [r4]
	ldr r3, [sp, #8]
	ldrb r0, [r3]
	subs r0, #1
	strb r0, [r3]
	ldrh r2, [r4]
	movs r0, #1
	movs r1, #0
	bl SetBgOffset
	ldr r0, [r7, #0x30]
	cmp r0, #0
	beq _0803EE62
	movs r1, #4
	bl sub_803E078
_0803EE62:
	movs r0, #4
	bl sub_8048E60
	ldr r1, [r7, #0x40]
	mov r0, sl
	ldrb r0, [r0]
	subs r1, r1, r0
	b _0803EEB0
_0803EE72:
	cmp r2, #0
	bge _0803EECE
	adds r4, r7, #0
	adds r4, #0x4a
	ldrh r0, [r4]
	adds r0, #4
	strh r0, [r4]
	ldr r1, [sp, #8]
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	ldrh r2, [r4]
	movs r0, #1
	movs r1, #0
	bl SetBgOffset
	ldr r0, [r7, #0x30]
	cmp r0, #0
	beq _0803EEA0
	movs r1, #4
	rsbs r1, r1, #0
	bl sub_803E078
_0803EEA0:
	movs r0, #4
	rsbs r0, r0, #0
	bl sub_8048E60
	ldr r1, [r7, #0x40]
	mov r2, sl
	ldrb r2, [r2]
	subs r1, r1, r2
_0803EEB0:
	lsls r1, r1, #4
	adds r1, #0x28
	movs r0, #0x50
	bl PutUiHand
	ldr r0, [r7, #0x38]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldrh r1, [r4]
	adds r1, #0x28
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	bl sub_8049438
	b _0803F2B4
_0803EECE:
	ldr r1, [r7, #0x40]
	mov r3, sl
	ldrb r3, [r3]
	subs r1, r1, r3
	lsls r1, r1, #4
	adds r1, #0x28
	movs r0, #0x50
	bl PutUiHand
	ldr r0, _0803EF0C @ =gpKeySt
	ldr r1, [r0]
	movs r0, #1
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	bne _0803EEF0
	b _0803F106
_0803EEF0:
	adds r0, r7, #0
	adds r0, #0x52
	ldrb r1, [r0]
	subs r1, #1
	adds r4, r0, #0
	cmp r1, #7
	bls _0803EF00
	b _0803F106
_0803EF00:
	lsls r0, r1, #2
	ldr r1, _0803EF10 @ =_0803EF14
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0803EF0C: .4byte gpKeySt
_0803EF10: .4byte _0803EF14
_0803EF14: @ jump table
	.4byte _0803EF34 @ case 0
	.4byte _0803EF64 @ case 1
	.4byte _0803EF8C @ case 2
	.4byte _0803EFB8 @ case 3
	.4byte _0803F01C @ case 4
	.4byte _0803F02A @ case 5
	.4byte _0803F106 @ case 6
	.4byte _0803F078 @ case 7
_0803EF34:
	ldr r0, _0803EF5C @ =0x0203DA60
	mov r2, sb
	lsls r1, r2, #2
	add r1, sb
	lsls r1, r1, #2
	adds r1, r1, r0
	movs r0, #0x80
	ldrb r1, [r1, #0xf]
	ands r0, r1
	cmp r0, #0
	bne _0803EF4C
	b _0803F070
_0803EF4C:
	movs r0, #2
	bl SioPlaySoundEffect
	ldr r1, _0803EF60 @ =0x0203D908
	ldr r0, [r7, #0x40]
	strb r0, [r1, #3]
	b _0803EF7C
	.align 2, 0
_0803EF5C: .4byte 0x0203DA60
_0803EF60: .4byte 0x0203D908
_0803EF64:
	movs r0, #2
	bl SioPlaySoundEffect
	ldr r2, _0803EF84 @ =0x0203D908
	ldr r1, _0803EF88 @ =0x0203DA60
	mov r3, sb
	lsls r0, r3, #2
	add r0, sb
	lsls r0, r0, #2
	adds r0, r0, r1
	ldrb r0, [r0, #0xf]
	strb r0, [r2, #3]
_0803EF7C:
	adds r0, r7, #0
	bl Proc_Break
	b _0803F2B4
	.align 2, 0
_0803EF84: .4byte 0x0203D908
_0803EF88: .4byte 0x0203DA60
_0803EF8C:
	ldr r0, _0803EFB4 @ =0x0203DA60
	mov r2, sb
	lsls r1, r2, #2
	add r1, sb
	lsls r1, r1, #2
	adds r1, r1, r0
	movs r0, #0x80
	ldrb r1, [r1, #0xf]
	ands r0, r1
	cmp r0, #0
	bne _0803F070
	movs r0, #2
	bl SioPlaySoundEffect
	adds r0, r7, #0
	movs r1, #4
	bl Proc_Goto
	b _0803F2B4
	.align 2, 0
_0803EFB4: .4byte 0x0203DA60
_0803EFB8:
	ldr r0, [r7, #0x38]
	cmp r0, #1
	bgt _0803EFC0
	b _0803F106
_0803EFC0:
	movs r0, #2
	bl SioPlaySoundEffect
	adds r0, r7, #0
	adds r0, #0x53
	mov r3, sb
	strb r3, [r0]
	mov r1, sl
	ldrb r1, [r1]
	subs r2, r3, r1
	lsls r2, r2, #4
	adds r2, #0x28
	movs r0, #0x27
	str r0, [sp]
	adds r0, r7, #0
	movs r1, #0x50
	movs r3, #0x88
	bl sub_803E038
	str r0, [r7, #0x30]
	mov r1, sb
	adds r1, #1
	ldr r0, [r7, #0x38]
	cmp r1, r0
	bge _0803F004
	ldr r0, _0803F000 @ =gpKeySt
	ldr r1, [r0]
	movs r0, #0x80
	ldrh r2, [r1, #6]
	orrs r0, r2
	b _0803F00E
	.align 2, 0
_0803F000: .4byte gpKeySt
_0803F004:
	ldr r0, _0803F018 @ =gpKeySt
	ldr r1, [r0]
	movs r0, #0x40
	ldrh r3, [r1, #6]
	orrs r0, r3
_0803F00E:
	strh r0, [r1, #6]
	movs r0, #5
	strb r0, [r4]
	b _0803F106
	.align 2, 0
_0803F018: .4byte gpKeySt
_0803F01C:
	movs r0, #2
	bl SioPlaySoundEffect
	adds r0, r7, #0
	bl sub_803E6F8
	b _0803F106
_0803F02A:
	ldr r0, _0803F06C @ =0x0203DA60
	mov r2, sb
	lsls r1, r2, #2
	add r1, sb
	lsls r1, r1, #2
	adds r1, r1, r0
	movs r0, #0x80
	ldrb r1, [r1, #0xf]
	ands r0, r1
	cmp r0, #0
	bne _0803F070
	movs r0, #2
	bl SioPlaySoundEffect
	mov r0, sb
	mov r3, sl
	ldrb r3, [r3]
	subs r2, r0, r3
	lsls r2, r2, #4
	adds r2, #0x28
	movs r0, #0x27
	str r0, [sp]
	adds r0, r7, #0
	movs r1, #0x50
	movs r3, #0x88
	bl sub_803E038
	str r0, [r7, #0x30]
	adds r0, r7, #0
	movs r1, #7
	bl Proc_Goto
	b _0803F106
	.align 2, 0
_0803F06C: .4byte 0x0203DA60
_0803F070:
	movs r0, #0
	bl SioPlaySoundEffect
	b _0803F106
_0803F078:
	movs r0, #2
	bl SioPlaySoundEffect
	mov r0, sb
	lsls r4, r0, #2
	add r4, sb
	lsls r4, r4, #2
	ldr r0, _0803F130 @ =0x0203DA60
	adds r4, r4, r0
	movs r1, #0x53
	adds r1, r1, r7
	mov r8, r1
	ldrb r2, [r1]
	lsls r1, r2, #4
	mov r3, r8
	ldrb r3, [r3]
	subs r1, r1, r3
	ldr r6, _0803F134 @ =0x0203DC34
	adds r1, r1, r6
	adds r0, r4, #0
	bl SioStrCpy
	ldr r5, _0803F138 @ =0x0203D908
	adds r0, r5, #6
	mov r1, r8
	ldrb r1, [r1]
	adds r0, r1, r0
	ldrb r1, [r4, #0xf]
	strb r1, [r0]
	mov r2, r8
	ldrb r2, [r2]
	lsls r0, r2, #3
	adds r5, #0x64
	adds r0, r0, r5
	bl ClearText
	mov r3, r8
	ldrb r1, [r3]
	lsls r0, r1, #3
	adds r0, r0, r5
	lsls r2, r1, #1
	adds r2, r2, r1
	adds r2, #5
	lsls r3, r1, #4
	subs r3, r3, r1
	adds r3, r3, r6
	movs r1, #0xa
	str r1, [sp]
	movs r1, #1
	bl sub_8015324
	bl sub_803ED98
	adds r1, r7, #0
	adds r1, #0x5c
	strb r0, [r1]
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0803F0FA
	ldr r1, [sp, #4]
	ldr r0, [r1, #0x40]
	cmp r0, #0
	bne _0803F0FA
	movs r0, #8
	str r0, [r1, #0x40]
_0803F0FA:
	movs r0, #0
	str r0, [r7, #0x44]
	adds r0, r7, #0
	movs r1, #6
	bl Proc_Goto
_0803F106:
	ldr r0, _0803F13C @ =gpKeySt
	ldr r1, [r0]
	movs r0, #2
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _0803F15A
	movs r0, #1
	bl SioPlaySoundEffect
	adds r1, r7, #0
	adds r1, #0x52
	ldrb r0, [r1]
	cmp r0, #5
	bne _0803F140
	movs r0, #4
	strb r0, [r1]
	ldr r0, [r7, #0x30]
	bl Proc_End
	b _0803F2B4
	.align 2, 0
_0803F130: .4byte 0x0203DA60
_0803F134: .4byte 0x0203DC34
_0803F138: .4byte 0x0203D908
_0803F13C: .4byte gpKeySt
_0803F140:
	cmp r0, #8
	beq _0803F14E
	adds r0, r7, #0
	movs r1, #2
	bl Proc_Goto
	b _0803F15A
_0803F14E:
	movs r0, #0
	str r0, [r7, #0x44]
	adds r0, r7, #0
	movs r1, #6
	bl Proc_Goto
_0803F15A:
	ldr r0, _0803F204 @ =gpKeySt
	ldr r1, [r0]
	movs r0, #8
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _0803F196
	adds r0, r7, #0
	adds r0, #0x5c
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _0803F196
	ldr r0, _0803F208 @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0803F188
	ldr r0, _0803F20C @ =0x0000038A
	bl m4aSongNumStart
_0803F188:
	ldr r1, _0803F210 @ =0x0203D908
	movs r0, #0
	strb r0, [r1, #3]
	adds r0, r7, #0
	movs r1, #9
	bl Proc_Goto
_0803F196:
	ldr r0, _0803F204 @ =gpKeySt
	ldr r1, [r0]
	movs r0, #0x40
	ldrh r1, [r1, #6]
	ands r0, r1
	cmp r0, #0
	beq _0803F21E
	mov r2, sl
	ldrb r0, [r2]
	cmp r0, #0
	beq _0803F214
	ldr r0, [r7, #0x40]
	ldrb r3, [r2]
	subs r0, r0, r3
	cmp r0, #1
	bgt _0803F214
	adds r4, r7, #0
	adds r4, #0x4a
	ldrh r0, [r4]
	subs r0, #4
	strh r0, [r4]
	ldr r0, [r7, #0x30]
	cmp r0, #0
	beq _0803F1CC
	movs r1, #4
	bl sub_803E078
_0803F1CC:
	movs r0, #4
	bl sub_8048E60
	mov r1, sl
	ldrb r0, [r1]
	subs r0, #1
	strb r0, [r1]
	movs r0, #3
	ldr r2, [sp, #8]
	strb r0, [r2]
	ldr r0, [r7, #0x40]
	subs r0, #1
	str r0, [r7, #0x40]
	ldrh r2, [r4]
	movs r0, #1
	movs r1, #0
	bl SetBgOffset
	ldr r0, [r7, #0x38]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldrh r1, [r4]
	adds r1, #0x28
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	bl sub_8049438
	b _0803F21E
	.align 2, 0
_0803F204: .4byte gpKeySt
_0803F208: .4byte gPlaySt
_0803F20C: .4byte 0x0000038A
_0803F210: .4byte 0x0203D908
_0803F214:
	ldr r0, [r7, #0x40]
	cmp r0, #0
	ble _0803F21E
	subs r0, #1
	str r0, [r7, #0x40]
_0803F21E:
	ldr r0, _0803F298 @ =gpKeySt
	ldr r1, [r0]
	movs r0, #0x80
	ldrh r1, [r1, #6]
	ands r0, r1
	cmp r0, #0
	beq _0803F2A8
	ldr r1, [r7, #0x38]
	cmp r1, #6
	ble _0803F29C
	mov r3, sl
	ldrb r2, [r3]
	adds r0, r2, #6
	cmp r0, r1
	bge _0803F29C
	ldr r0, [r7, #0x40]
	subs r0, r0, r2
	cmp r0, #3
	ble _0803F29C
	adds r4, r7, #0
	adds r4, #0x4a
	ldrh r0, [r4]
	adds r0, #4
	strh r0, [r4]
	ldr r0, [r7, #0x30]
	cmp r0, #0
	beq _0803F25C
	movs r1, #4
	rsbs r1, r1, #0
	bl sub_803E078
_0803F25C:
	movs r0, #4
	rsbs r0, r0, #0
	bl sub_8048E60
	mov r1, sl
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	movs r0, #0xfd
	ldr r2, [sp, #8]
	strb r0, [r2]
	ldr r0, [r7, #0x40]
	adds r0, #1
	str r0, [r7, #0x40]
	ldrh r2, [r4]
	movs r0, #1
	movs r1, #0
	bl SetBgOffset
	ldr r0, [r7, #0x38]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldrh r1, [r4]
	adds r1, #0x28
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	bl sub_8049438
	b _0803F2A8
	.align 2, 0
_0803F298: .4byte gpKeySt
_0803F29C:
	subs r0, r1, #1
	ldr r1, [r7, #0x40]
	cmp r1, r0
	bge _0803F2A8
	adds r0, r1, #1
	str r0, [r7, #0x40]
_0803F2A8:
	ldr r0, [r7, #0x40]
	cmp sb, r0
	beq _0803F2B4
	movs r0, #3
	bl SioPlaySoundEffect
_0803F2B4:
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_803F2C4
sub_803F2C4: @ 0x0803F2C4
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	rsbs r1, r1, #0
	subs r1, #8
	movs r2, #4
	adds r0, #0x38
_0803F2D0:
	strh r1, [r0]
	subs r0, #2
	subs r2, #1
	cmp r2, #0
	bge _0803F2D0
	bx lr

	thumb_func_start sub_803F2DC
sub_803F2DC: @ 0x0803F2DC
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	ldr r6, [r4, #0x2c]
	ldr r0, _0803F340 @ =gUnk_081DAECB
	ldr r1, [r4, #0x44]
	adds r1, r1, r0
	movs r5, #0
	ldrsb r5, [r1, r5]
	movs r0, #1
	rsbs r0, r0, #0
	cmp r5, r0
	bne _0803F2FC
	adds r0, r4, #0
	movs r1, #3
	bl Proc_Goto
_0803F2FC:
	ldr r0, [r4, #0x44]
	adds r0, #1
	str r0, [r4, #0x44]
	movs r0, #2
	rsbs r0, r0, #0
	cmp r5, r0
	bne _0803F348
	ldr r3, _0803F344 @ =gDispIo
	movs r1, #4
	rsbs r1, r1, #0
	adds r0, r1, #0
	ldrb r2, [r3, #0x10]
	ands r0, r2
	strb r0, [r3, #0x10]
	adds r0, r1, #0
	ldrb r2, [r3, #0x14]
	ands r0, r2
	movs r2, #1
	orrs r0, r2
	strb r0, [r3, #0x14]
	ldrb r0, [r3, #0xc]
	ands r1, r0
	movs r0, #2
	orrs r1, r0
	strb r1, [r3, #0xc]
	movs r0, #3
	ldrb r1, [r3, #0x18]
	orrs r0, r1
	strb r0, [r3, #0x18]
	adds r1, r6, #0
	adds r1, #0x44
	movs r0, #0
	strb r0, [r1]
	b _0803F35C
	.align 2, 0
_0803F340: .4byte gUnk_081DAECB
_0803F344: .4byte gDispIo
_0803F348:
	lsls r1, r5, #0x10
	lsrs r1, r1, #0x10
	movs r0, #0
	movs r2, #0
	bl SetBgOffset
	adds r0, r6, #0
	adds r1, r5, #0
	bl sub_803F2C4
_0803F35C:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_803F364
sub_803F364: @ 0x0803F364
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	ldr r6, [r4, #0x2c]
	ldr r1, _0803F3CC @ =gUnk_081DAECB
	ldr r0, [r4, #0x44]
	adds r0, r0, r1
	movs r5, #0
	ldrsb r5, [r0, r5]
	movs r7, #1
	rsbs r7, r7, #0
	cmp r5, r7
	bne _0803F384
	adds r0, r4, #0
	movs r1, #2
	bl Proc_Goto
_0803F384:
	ldr r0, [r4, #0x44]
	adds r0, #1
	str r0, [r4, #0x44]
	movs r0, #2
	rsbs r0, r0, #0
	cmp r5, r0
	bne _0803F3D4
	ldr r3, _0803F3D0 @ =gDispIo
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
	adds r1, r6, #0
	adds r1, #0x44
	movs r0, #1
	strb r0, [r1]
	str r7, [r6, #0x48]
	b _0803F3E8
	.align 2, 0
_0803F3CC: .4byte gUnk_081DAECB
_0803F3D0: .4byte gDispIo
_0803F3D4:
	lsls r1, r5, #0x10
	lsrs r1, r1, #0x10
	movs r0, #0
	movs r2, #0
	bl SetBgOffset
	adds r0, r6, #0
	adds r1, r5, #0
	bl sub_803F2C4
_0803F3E8:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_803F3F0
sub_803F3F0: @ 0x0803F3F0
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r1, r5, #0
	adds r1, #0x55
	movs r0, #1
	strb r0, [r1]
	bl sub_8049A08
	adds r1, r5, #0
	adds r1, #0x48
	ldr r0, [r5, #0x40]
	ldrb r1, [r1]
	subs r0, r0, r1
	cmp r0, #2
	ble _0803F414
	lsls r0, r0, #1
	subs r0, #2
	b _0803F418
_0803F414:
	lsls r0, r0, #1
	adds r0, #5
_0803F418:
	str r0, [r5, #0x58]
	ldr r4, _0803F448 @ =0x0203D994
	adds r0, r4, #0
	bl ClearText
	ldr r1, _0803F44C @ =gUnk_081DAED8
	adds r0, r4, #0
	bl Text_DrawString
	ldr r1, [r5, #0x58]
	adds r1, #4
	lsls r1, r1, #6
	ldr r0, _0803F450 @ =gBg0Tm + 0x1e
	adds r1, r1, r0
	adds r0, r4, #0
	bl PutText
	movs r0, #1
	bl EnableBgSync
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0803F448: .4byte 0x0203D994
_0803F44C: .4byte gUnk_081DAED8
_0803F450: .4byte gBg0Tm + 0x1e

	thumb_func_start sub_803F454
sub_803F454: @ 0x0803F454
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r1, [r4, #0x58]
	lsls r1, r1, #3
	adds r1, #0x18
	movs r0, #0x60
	bl sub_8049A44
	ldr r0, _0803F4F8 @ =gpKeySt
	ldr r1, [r0]
	movs r0, #0x20
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _0803F486
	adds r1, r4, #0
	adds r1, #0x55
	ldrb r0, [r1]
	cmp r0, #1
	bne _0803F486
	movs r0, #0
	strb r0, [r1]
	movs r0, #3
	bl SioPlaySoundEffect
_0803F486:
	ldr r0, _0803F4F8 @ =gpKeySt
	ldr r1, [r0]
	movs r0, #0x10
	ldrh r1, [r1, #8]
	ands r0, r1
	adds r5, r4, #0
	adds r5, #0x55
	cmp r0, #0
	beq _0803F4A8
	ldrb r0, [r5]
	cmp r0, #0
	bne _0803F4A8
	movs r0, #1
	strb r0, [r5]
	movs r0, #3
	bl SioPlaySoundEffect
_0803F4A8:
	ldrb r1, [r5]
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r0, #0x70
	ldr r1, [r4, #0x58]
	lsls r1, r1, #3
	adds r1, #0x20
	bl PutUiHand
	ldr r0, _0803F4F8 @ =gpKeySt
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0803F500
	movs r0, #1
	bl SioPlaySoundEffect
	ldr r0, [r4, #0x30]
	bl Proc_End
	ldr r0, [r4, #0x58]
	adds r0, #4
	lsls r0, r0, #6
	ldr r1, _0803F4FC @ =gBg0Tm + 0x1e
	adds r0, r0, r1
	movs r1, #0xc
	movs r2, #2
	movs r3, #0
	bl TmFillRect_thm
	movs r0, #1
	bl EnableBgSync
	adds r0, r4, #0
	bl Proc_Break
	b _0803F548
	.align 2, 0
_0803F4F8: .4byte gpKeySt
_0803F4FC: .4byte gBg0Tm + 0x1e
_0803F500:
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0803F548
	ldr r0, [r4, #0x30]
	bl Proc_End
	ldrb r0, [r5]
	cmp r0, #0
	bne _0803F522
	adds r0, r4, #0
	bl sub_803E628
	movs r0, #2
	bl SioPlaySoundEffect
	b _0803F528
_0803F522:
	movs r0, #1
	bl SioPlaySoundEffect
_0803F528:
	ldr r0, [r4, #0x58]
	adds r0, #4
	lsls r0, r0, #6
	ldr r1, _0803F550 @ =gBg0Tm + 0x1e
	adds r0, r0, r1
	movs r1, #0xc
	movs r2, #2
	movs r3, #0
	bl TmFillRect_thm
	movs r0, #1
	bl EnableBgSync
	adds r0, r4, #0
	bl Proc_Break
_0803F548:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0803F550: .4byte gBg0Tm + 0x1e

	thumb_func_start sub_803F554
sub_803F554: @ 0x0803F554
	push {r4, lr}
	sub sp, #0x10
	ldr r4, [r0, #0x40]
	movs r0, #1
	bl GetUnit
	adds r1, r0, #0
	adds r0, r4, #0
	mov r2, sp
	bl sub_80A2820
	add sp, #0x10
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start GetTacticianTextConf
GetTacticianTextConf: @ 0x0803F574
	lsls r0, r0, #0x10
	asrs r0, r0, #0xa
	ldr r1, _0803F580 @ =gTacticianTextConf
	adds r0, r0, r1
	bx lr
	.align 2, 0
_0803F580: .4byte gTacticianTextConf

	thumb_func_start sub_803F584
sub_803F584: @ 0x0803F584
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x10
	mov sl, r0
	mov sb, r1
	movs r0, #0
	str r0, [sp]
	ldrb r0, [r1]
	cmp r0, #0
	beq _0803F626
_0803F59E:
	movs r1, #0
	mov r8, r1
	mov r3, sb
	adds r3, #2
	str r3, [sp, #8]
_0803F5A8:
	mov r5, r8
	lsls r0, r5, #0x10
	asrs r0, r0, #0x10
	bl GetTacticianTextConf
	str r0, [sp, #4]
	movs r7, #0
	mov r6, r8
	ldr r0, _0803F5FC @ =0x00003FFF
	ands r6, r0
	movs r1, #0
	mov ip, r1
_0803F5C0:
	movs r4, #0
	mov r3, sb
	ldrh r3, [r3]
	str r3, [sp, #0xc]
	ldr r2, [sp, #4]
	add r2, ip
	adds r0, r7, #0
	movs r5, #3
	ands r0, r5
	lsls r1, r0, #0xe
	orrs r1, r6
	ldr r3, [sp]
	lsls r0, r3, #1
	adds r0, #0x4c
	mov r5, sl
	adds r3, r0, r5
_0803F5E0:
	ldr r0, [r2]
	ldrh r0, [r0]
	ldr r5, [sp, #0xc]
	cmp r0, r5
	bne _0803F600
	strh r1, [r3]
	mov r0, sl
	adds r0, #0x39
	strb r4, [r0]
	ldr r0, [sp]
	adds r0, #1
	str r0, [sp]
	b _0803F61C
	.align 2, 0
_0803F5FC: .4byte 0x00003FFF
_0803F600:
	adds r2, #4
	adds r4, #1
	cmp r4, #2
	ble _0803F5E0
	movs r1, #0xc
	add ip, r1
	adds r7, #1
	cmp r7, #2
	ble _0803F5C0
	movs r3, #1
	add r8, r3
	mov r5, r8
	cmp r5, #0x50
	ble _0803F5A8
_0803F61C:
	ldr r0, [sp, #8]
	mov sb, r0
	ldrb r0, [r0]
	cmp r0, #0
	bne _0803F59E
_0803F626:
	add sp, #0x10
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
