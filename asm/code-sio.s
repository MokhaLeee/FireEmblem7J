	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_803C5E4
sub_803C5E4: @ 0x0803C5E4
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
	ldr r0, _0803C658 @ =gUnk_08C07DAC
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
_0803C658: .4byte gUnk_08C07DAC
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
	ldr r3, _0803C6A8 @ =gUnk_08C07DAC
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
_0803C6A8: .4byte gUnk_08C07DAC
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

	thumb_func_start sub_803C700
sub_803C700: @ 0x0803C700
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
	ldr r3, _0803C738 @ =gUnk_08C07DAC
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
_0803C738: .4byte gUnk_08C07DAC
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
	ldr r2, _0803C89C @ =gUnk_08C07DAC
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
	ldr r4, _0803C89C @ =gUnk_08C07DAC
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
	ldr r5, _0803C89C @ =gUnk_08C07DAC
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
	ldr r2, _0803C89C @ =gUnk_08C07DAC
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
_0803C89C: .4byte gUnk_08C07DAC
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
	ldr r2, _0803C924 @ =gUnk_08C07DAC
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
_0803C924: .4byte gUnk_08C07DAC
_0803C928: .4byte 0x00006582
_0803C92C: .4byte 0x030013D4

	thumb_func_start sub_803C930
sub_803C930: @ 0x0803C930
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
	ldr r1, _0803CAA4 @ =gUnk_08C07DAC
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
	ldr r1, _0803CAA4 @ =gUnk_08C07DAC
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
_0803CAA4: .4byte gUnk_08C07DAC
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
	ldr r0, _0803CAF0 @ =gUnk_08C07DAC
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
_0803CAF0: .4byte gUnk_08C07DAC
_0803CAF4:
	adds r0, r1, #0
	adds r0, #0x1a
	adds r0, r0, r5
	movs r1, #0
_0803CAFC:
	strb r1, [r0]
_0803CAFE:
	ldr r3, _0803CB58 @ =gUnk_08C07DAC
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
_0803CB58: .4byte gUnk_08C07DAC
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
	bl sub_803D594
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
	bl sub_803D594
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
	ldr r0, _0803CC44 @ =gUnk_08C07DAC
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
_0803CC44: .4byte gUnk_08C07DAC
_0803CC48: .4byte 0x00001B7E
_0803CC4C: .4byte 0x030045D4

	thumb_func_start sub_803CC50
sub_803CC50: @ 0x0803CC50
	push {r4, r5, r6, lr}
	sub sp, #4
	ldr r0, _0803CC8C @ =gUnk_08C07DAC
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
_0803CC8C: .4byte gUnk_08C07DAC
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
	ldr r4, _0803CD1C @ =gUnk_08C07DAC
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
	ldr r5, _0803CD1C @ =gUnk_08C07DAC
_0803CCD4:
	ldr r0, _0803CD1C @ =gUnk_08C07DAC
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
_0803CD1C: .4byte gUnk_08C07DAC
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
	ldr r2, _0803CD68 @ =gUnk_08C07DAC
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
_0803CD68: .4byte gUnk_08C07DAC
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
	bl sub_803D594
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
	ldr r0, _0803CE4C @ =gUnk_08C07DAC
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
	ldr r5, _0803CE4C @ =gUnk_08C07DAC
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
_0803CE4C: .4byte gUnk_08C07DAC
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
	ldr r6, _0803CEBC @ =gUnk_08C07DAC
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
_0803CEBC: .4byte gUnk_08C07DAC
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
	ldr r0, _0803CF58 @ =gUnk_08C07DAC
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
	ldr r0, _0803CF58 @ =gUnk_08C07DAC
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
_0803CF58: .4byte gUnk_08C07DAC
_0803CF5C: .4byte 0x030046BC
_0803CF60:
	ldr r0, _0803CF8C @ =gUnk_08C07DAC
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
_0803CF8C: .4byte gUnk_08C07DAC
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
	ldr r0, _0803CFF4 @ =gUnk_08C07DAC
	ldr r1, [r0]
	movs r0, #1
	ldrb r5, [r5, #1]
	lsls r0, r5
	ldrb r4, [r1, #0xa]
	orrs r0, r4
	strb r0, [r1, #0xa]
	b _0803D15A
	.align 2, 0
_0803CFF4: .4byte gUnk_08C07DAC
_0803CFF8:
	ldr r6, _0803D09C @ =gUnk_08C07DAC
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
_0803D09C: .4byte gUnk_08C07DAC
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
	ldr r3, _0803D0E8 @ =gUnk_08C07DAC
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
_0803D0E8: .4byte gUnk_08C07DAC
_0803D0EC:
	ldrb r0, [r5, #2]
	bl sub_803D1CC
	lsls r0, r0, #0x18
	adds r7, #1
	mov r8, r7
	cmp r0, #0
	bne _0803D15E
	ldr r2, _0803D114 @ =gUnk_08C07DAC
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
_0803D114: .4byte gUnk_08C07DAC
_0803D118:
	ldr r0, _0803D14C @ =0x0203D908
	adds r0, #0x9c
	ldrh r1, [r5, #2]
	adds r0, r1, r0
	movs r4, #0
	movs r2, #1
	strb r2, [r0]
	ldr r3, _0803D150 @ =gUnk_08C07DAC
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
_0803D150: .4byte gUnk_08C07DAC
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
	ldr r1, _0803D1E8 @ =gUnk_08C07DAC
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
_0803D1E8: .4byte gUnk_08C07DAC
_0803D1EC:
	movs r0, #1
_0803D1EE:
	bx lr

	thumb_func_start sub_803D1F0
sub_803D1F0: @ 0x0803D1F0
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r1, _0803D20C @ =gUnk_08C07DAC
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
_0803D20C: .4byte gUnk_08C07DAC
_0803D210:
	movs r0, #1
_0803D212:
	bx lr

	thumb_func_start sub_803D214
sub_803D214: @ 0x0803D214
	push {r4, lr}
	ldr r2, _0803D240 @ =gUnk_08C07DAC
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
_0803D240: .4byte gUnk_08C07DAC
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
	ldr r0, _0803D284 @ =gUnk_08C07DAC
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
_0803D284: .4byte gUnk_08C07DAC
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
	ldr r4, _0803D2D8 @ =gUnk_08C07DAC
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
_0803D2D8: .4byte gUnk_08C07DAC
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

	thumb_func_start sub_803D594
sub_803D594: @ 0x0803D594
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0803D5AC @ =gUnk_08C07DAC
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
_0803D5AC: .4byte gUnk_08C07DAC
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
	ldr r3, _0803D6B4 @ =gUnk_08C07DAC
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
_0803D6B4: .4byte gUnk_08C07DAC
_0803D6B8: .4byte 0x00001B77
_0803D6BC: .4byte 0x000012B4

	thumb_func_start sub_803D6C0
sub_803D6C0: @ 0x0803D6C0
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	ldr r0, _0803D710 @ =gUnk_08C07DAC
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
_0803D710: .4byte gUnk_08C07DAC
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
	ldr r4, _0803D7C4 @ =gUnk_08C07DAC
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
_0803D7C4: .4byte gUnk_08C07DAC
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
	ldr r0, _0803D80C @ =gUnk_08C07DAC
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
_0803D80C: .4byte gUnk_08C07DAC
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
	ldr r4, _0803D8E0 @ =gUnk_08C07DAC
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
_0803D8E0: .4byte gUnk_08C07DAC
_0803D8E4: .4byte 0x00001B76
_0803D8E8:
	movs r0, #0
	strb r0, [r6]
	ldrb r5, [r6, #1]
	ldr r4, _0803D950 @ =gUnk_08C07DAC
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
_0803D950: .4byte gUnk_08C07DAC
_0803D954: .4byte 0x00001B76
_0803D958: .4byte 0x030046BC

	thumb_func_start sub_803D95C
sub_803D95C: @ 0x0803D95C
	push {lr}
	sub sp, #4
	ldr r1, _0803D998 @ =0x00007FFF
	mov r0, sp
	strh r1, [r0]
	ldr r0, _0803D99C @ =gUnk_08C07DAC
	ldr r1, [r0]
	movs r0, #0
	strb r0, [r1, #1]
	mov r0, sp
	movs r1, #1
	bl sub_803D594
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
_0803D99C: .4byte gUnk_08C07DAC
_0803D9A0: .4byte 0x030013DA
_0803D9A4: .4byte 0x030013D8
_0803D9A8: .4byte 0x030013E0
_0803D9AC: .4byte 0x030013E8

	thumb_func_start sub_803D9B0
sub_803D9B0: @ 0x0803D9B0
	ldr r1, _0803D9BC @ =gUnk_08C07DAC
	ldr r1, [r1]
	adds r1, #0x21
	strb r0, [r1]
	bx lr
	.align 2, 0
_0803D9BC: .4byte gUnk_08C07DAC

	thumb_func_start sub_803D9C0
sub_803D9C0: @ 0x0803D9C0
	push {lr}
	sub sp, #4
	ldr r1, _0803DA14 @ =0x00007FFF
	mov r0, sp
	strh r1, [r0]
	ldr r1, _0803DA18 @ =gUnk_08C07DAC
	ldr r0, [r1]
	movs r2, #0
	strb r2, [r0, #1]
	ldr r0, [r1]
	ldr r1, _0803DA1C @ =0x00001B7C
	adds r0, r0, r1
	strh r2, [r0]
	mov r0, sp
	movs r1, #1
	bl sub_803D594
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
	ldr r0, _0803DA18 @ =gUnk_08C07DAC
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
_0803DA18: .4byte gUnk_08C07DAC
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
	ldr r3, _0803DA94 @ =gUnk_08C07DAC
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
	bl sub_803D594
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0803DA90: .4byte 0x00002586
_0803DA94: .4byte gUnk_08C07DAC
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
	ldr r3, _0803DB0C @ =gUnk_08C07DAC
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
	bl sub_803D594
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0803DB08: .4byte 0x00002586
_0803DB0C: .4byte gUnk_08C07DAC
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
	ldr r5, _0803DB94 @ =gUnk_08C07DAC
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
_0803DB94: .4byte gUnk_08C07DAC

	thumb_func_start sub_803DB98
sub_803DB98: @ 0x0803DB98
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	ldr r1, [r4, #0x2c]
	cmp r1, #0
	beq _0803DBA6
	bl _call_via_r1
_0803DBA6:
	ldr r5, _0803DC04 @ =gUnk_08C07DAC
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
_0803DC04: .4byte gUnk_08C07DAC

	thumb_func_start sub_803DC08
sub_803DC08: @ 0x0803DC08
	push {lr}
	ldr r2, _0803DC2C @ =gUnk_08C07DAC
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
_0803DC2C: .4byte gUnk_08C07DAC

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

	thumb_func_start sub_803DDF8
sub_803DDF8: @ 0x0803DDF8
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

	thumb_func_start sub_803DE14
sub_803DE14: @ 0x0803DE14
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

	thumb_func_start sub_803DE38
sub_803DE38: @ 0x0803DE38
	push {lr}
	bl sub_803C930
	bl sub_803C8C8
	ldr r2, _0803DE54 @ =gUnk_08C07DAC
	ldr r1, [r2]
	movs r3, #0
	movs r0, #1
	strb r0, [r1, #1]
	ldr r0, [r2]
	strh r3, [r0, #4]
	pop {r0}
	bx r0
	.align 2, 0
_0803DE54: .4byte gUnk_08C07DAC

	thumb_func_start sub_803DE58
sub_803DE58: @ 0x0803DE58
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r6, r0, #0
	ldr r0, _0803DE9C @ =0x00002586
	mov r1, sp
	strh r0, [r1]
	bl sub_803C5E4
	movs r5, #1
	rsbs r5, r5, #0
	cmp r0, r5
	beq _0803DE94
	ldr r4, _0803DEA0 @ =gUnk_08C07DAC
	ldr r1, [r4]
	movs r0, #0
	strb r0, [r1, #0x11]
	ldr r1, [r4]
	movs r0, #5
	strh r0, [r1, #4]
	bl sub_803C700
	ldr r1, [r4]
	strb r0, [r1, #6]
	mov r0, sp
	adds r1, r5, #0
	bl sub_803D594
	adds r0, r6, #0
	bl Proc_Break
_0803DE94:
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0803DE9C: .4byte 0x00002586
_0803DEA0: .4byte gUnk_08C07DAC

	thumb_func_start sub_803DEA4
sub_803DEA4: @ 0x0803DEA4
	ldr r0, _0803DEB0 @ =gBmSt
	movs r1, #0x40
	ldrb r2, [r0, #4]
	orrs r1, r2
	strb r1, [r0, #4]
	bx lr
	.align 2, 0
_0803DEB0: .4byte gBmSt

	thumb_func_start sub_803DEB4
sub_803DEB4: @ 0x0803DEB4
	ldr r1, _0803DEC0 @ =gBmSt
	movs r0, #0xbf
	ldrb r2, [r1, #4]
	ands r0, r2
	strb r0, [r1, #4]
	bx lr
	.align 2, 0
_0803DEC0: .4byte gBmSt

	thumb_func_start sub_803DEC4
sub_803DEC4: @ 0x0803DEC4
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
	ldr r0, _0803DFB4 @ =gUnk_08C07DAC
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
_0803DFB4: .4byte gUnk_08C07DAC
_0803DFB8: .4byte 0x00001286
_0803DFBC: .4byte 0x00001B7E

	thumb_func_start sub_803DFC0
sub_803DFC0: @ 0x0803DFC0
	ldr r0, _0803DFD0 @ =gUnk_08C07DAC
	ldr r2, [r0]
	movs r1, #6
	ldrsb r1, [r2, r1]
	movs r0, #1
	lsls r0, r1
	strb r0, [r2, #0xa]
	bx lr
	.align 2, 0
_0803DFD0: .4byte gUnk_08C07DAC

	thumb_func_start sub_803DFD4
sub_803DFD4: @ 0x0803DFD4
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r0, _0803E014 @ =0x030046BC
	movs r2, #0
	movs r1, #0xc9
	strb r1, [r0]
	ldr r4, _0803E018 @ =gUnk_08C07DAC
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
_0803E018: .4byte gUnk_08C07DAC

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
	bl sub_8004748
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

	thumb_func_start sub_803E080
sub_803E080: @ 0x0803E080
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
	ldr r0, _0803E168 @ =0x0203DBF0
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
_0803E168: .4byte 0x0203DBF0
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
	ldr r5, _0803E1EC @ =0x0203DBF0
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
_0803E1EC: .4byte 0x0203DBF0

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

	thumb_func_start sub_803E248
sub_803E248: @ 0x0803E248
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
	bl sub_803DDF8
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
	bl sub_803DDF8
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
	bl sub_803DDF8
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
	bl sub_803DDF8
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
	bl sub_803DDF8
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
	bl sub_803E080
	bl sub_8048320
	ldr r0, _0803EB08 @ =gUnk_081CB3E0
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
	ldr r0, _0803EB18 @ =gUnk_081CD798
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
_0803EB08: .4byte gUnk_081CB3E0
_0803EB0C: .4byte 0x06014800
_0803EB10: .4byte gBg2Tm + 0x112
_0803EB14: .4byte gUnk_081CDB10
_0803EB18: .4byte gUnk_081CD798
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
	bl sub_803E248
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
	bl sub_803E248
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
	bl sub_803E248
	adds r0, r4, #0
	bl Proc_Break
	b _0803ECB8
_0803EC8E:
	movs r0, #0
	bl sub_803E248
	b _0803ECB8
_0803EC96:
	movs r0, #2
	bl sub_803E248
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
	bl sub_803E248
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
	bl DisplayUiHand
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
	bl DisplayUiHand
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
	bl sub_803E248
	ldr r1, _0803EF60 @ =0x0203D908
	ldr r0, [r7, #0x40]
	strb r0, [r1, #3]
	b _0803EF7C
	.align 2, 0
_0803EF5C: .4byte 0x0203DA60
_0803EF60: .4byte 0x0203D908
_0803EF64:
	movs r0, #2
	bl sub_803E248
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
	bl sub_803E248
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
	bl sub_803E248
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
	bl sub_803E248
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
	bl sub_803E248
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
	bl sub_803E248
	b _0803F106
_0803F078:
	movs r0, #2
	bl sub_803E248
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
	bl sub_803DDF8
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
	bl sub_803E248
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
	bl sub_803E248
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
	bl sub_803E248
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
	bl sub_803E248
_0803F4A8:
	ldrb r1, [r5]
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r0, #0x70
	ldr r1, [r4, #0x58]
	lsls r1, r1, #3
	adds r1, #0x20
	bl DisplayUiHand
	ldr r0, _0803F4F8 @ =gpKeySt
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0803F500
	movs r0, #1
	bl sub_803E248
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
	bl sub_803E248
	b _0803F528
_0803F522:
	movs r0, #1
	bl sub_803E248
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

	thumb_func_start sub_803F574
sub_803F574: @ 0x0803F574
	lsls r0, r0, #0x10
	asrs r0, r0, #0xa
	ldr r1, _0803F580 @ =gUnk_081D94A0
	adds r0, r0, r1
	bx lr
	.align 2, 0
_0803F580: .4byte gUnk_081D94A0

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
	bl sub_803F574
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

	thumb_func_start sub_803F638
sub_803F638: @ 0x0803F638
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	movs r6, #0
	adds r4, r0, #0
	adds r4, #0x31
	ldr r1, _0803F714 @ =0x0203D9F8
	mov r8, r1
	adds r7, r0, #0
	adds r7, #0x30
_0803F652:
	ldrb r3, [r4]
	lsls r0, r3, #2
	adds r0, r0, r3
	adds r0, r6, r0
	lsls r0, r0, #3
	add r0, r8
	bl ClearText
	ldrb r1, [r4]
	lsls r0, r1, #2
	adds r0, r0, r1
	adds r0, r6, r0
	lsls r0, r0, #3
	add r0, r8
	movs r1, #0
	bl Text_SetColor
	movs r2, #0
	lsls r3, r6, #4
	mov sb, r3
	lsls r0, r6, #1
	mov sl, r0
	adds r1, r6, #1
	str r1, [sp]
_0803F682:
	mov r3, sb
	subs r0, r3, r6
	adds r0, r0, r2
	lsls r0, r0, #1
	ldr r1, _0803F718 @ =gUnk_081DACFE
	adds r0, r0, r1
	movs r3, #0
	ldrsh r0, [r0, r3]
	lsls r0, r0, #6
	ldr r1, _0803F71C @ =gUnk_081D94A0
	adds r5, r0, r1
	ldrb r1, [r7]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r5, r0
	ldr r0, [r0]
	ldrb r0, [r0]
	cmp r0, #0
	beq _0803F6DC
	ldrb r3, [r4]
	lsls r0, r3, #2
	adds r0, r0, r3
	adds r0, r6, r0
	lsls r0, r0, #3
	add r0, r8
	ldrh r1, [r5, #0x30]
	str r2, [sp, #4]
	bl Text_SetCursor
	ldrb r1, [r4]
	lsls r0, r1, #2
	adds r0, r0, r1
	adds r0, r6, r0
	lsls r0, r0, #3
	add r0, r8
	ldrb r3, [r7]
	lsls r1, r3, #1
	adds r1, r1, r3
	lsls r1, r1, #2
	adds r1, r5, r1
	ldr r1, [r1]
	bl Text_DrawString
	ldr r2, [sp, #4]
_0803F6DC:
	adds r2, #1
	cmp r2, #0xe
	ble _0803F682
	ldrb r1, [r4]
	lsls r0, r1, #2
	adds r0, r0, r1
	adds r0, r6, r0
	lsls r0, r0, #3
	add r0, r8
	mov r1, sl
	adds r1, #9
	lsls r1, r1, #6
	ldr r2, _0803F720 @ =gBg1Tm
	adds r1, r1, r2
	bl PutText
	ldr r6, [sp]
	cmp r6, #4
	ble _0803F652
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0803F714: .4byte 0x0203D9F8
_0803F718: .4byte gUnk_081DACFE
_0803F71C: .4byte gUnk_081D94A0
_0803F720: .4byte gBg1Tm

	thumb_func_start sub_803F724
sub_803F724: @ 0x0803F724
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r4, #0x3d
	ldr r5, _0803F76C @ =0x0203DC00
	adds r0, r5, #0
	bl ClearText
	ldrb r0, [r4]
	cmp r0, #0
	beq _0803F756
	adds r6, r5, #0
	movs r5, #0
_0803F73C:
	adds r0, r6, #0
	adds r1, r5, #0
	bl Text_SetCursor
	adds r0, r6, #0
	adds r1, r4, #0
	bl Text_DrawCharacter
	adds r4, r0, #0
	adds r5, #9
	ldrb r0, [r4]
	cmp r0, #0
	bne _0803F73C
_0803F756:
	ldr r0, _0803F76C @ =0x0203DC00
	ldr r1, _0803F770 @ =gBg0Tm + 0x158
	bl PutText
	movs r0, #1
	bl EnableBgSync
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0803F76C: .4byte 0x0203DC00
_0803F770: .4byte gBg0Tm + 0x158

	thumb_func_start sub_803F774
sub_803F774: @ 0x0803F774
	adds r1, r0, #0
	movs r2, #0
	b _0803F77E
_0803F77A:
	adds r2, #1
	adds r1, #2
_0803F77E:
	ldrb r0, [r1]
	cmp r0, #0
	bne _0803F77A
	adds r0, r2, #0
	bx lr

	thumb_func_start sub_803F788
sub_803F788: @ 0x0803F788
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x2c
	adds r6, r0, #0
	ldr r1, _0803F800 @ =gUnk_081DAEE9
	add r0, sp, #8
	movs r2, #0xa
	bl memcpy
	bl sub_803E080
	bl sub_8048320
	ldr r0, _0803F804 @ =gUnk_081CB3E0
	ldr r1, _0803F808 @ =0x06014800
	bl Decompress
	ldr r0, _0803F80C @ =gUnk_081CD798
	movs r1, #0x98
	lsls r1, r1, #2
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r0, _0803F810 @ =gUnk_081CD9D8
	movs r1, #0xa0
	lsls r1, r1, #2
	movs r2, #0x20
	bl ApplyPaletteExt
	movs r0, #0
	movs r1, #0
	bl sub_80483C0
	ldr r0, _0803F814 @ =gBg2Tm + 0x200
	ldr r1, _0803F818 @ =gUnk_081CDD60
	movs r2, #0x80
	lsls r2, r2, #5
	bl TmApplyTsa_thm
	ldr r0, _0803F81C @ =0x0203DA48
	bl SetTextFont
	bl InitSystemTextFont
	bl ResetTextFont
	bl sub_803DEC4
	lsls r0, r0, #0x18
	asrs r1, r0, #0x18
	cmp r1, #0
	beq _0803F820
	adds r1, r6, #0
	adds r1, #0x3c
	movs r0, #7
	b _0803F82A
	.align 2, 0
_0803F800: .4byte gUnk_081DAEE9
_0803F804: .4byte gUnk_081CB3E0
_0803F808: .4byte 0x06014800
_0803F80C: .4byte gUnk_081CD798
_0803F810: .4byte gUnk_081CD9D8
_0803F814: .4byte gBg2Tm + 0x200
_0803F818: .4byte gUnk_081CDD60
_0803F81C: .4byte 0x0203DA48
_0803F820:
	ldr r0, _0803F9A4 @ =0x0203D908
	strb r1, [r0]
	adds r1, r6, #0
	adds r1, #0x3c
	movs r0, #5
_0803F82A:
	strb r0, [r1]
	movs r4, #0
	adds r5, r1, #0
	ldrb r2, [r1]
	lsls r0, r2, #1
	adds r0, #1
	movs r3, #0x38
	adds r3, r3, r6
	mov sb, r3
	ldr r7, _0803F9A8 @ =0x0203DC00
	mov ip, r7
	adds r2, r6, #0
	adds r2, #0x30
	str r2, [sp, #0x28]
	movs r3, #0x39
	adds r3, r3, r6
	mov r8, r3
	movs r7, #0x31
	adds r7, r7, r6
	mov sl, r7
	adds r2, #2
	str r2, [sp, #0x24]
	cmp r4, r0
	bge _0803F86E
	adds r2, #0xb
	movs r3, #0
_0803F85E:
	adds r0, r2, r4
	strb r3, [r0]
	adds r4, #1
	ldrb r7, [r5]
	lsls r0, r7, #1
	adds r0, #1
	cmp r4, r0
	blt _0803F85E
_0803F86E:
	movs r4, #0
	ldrb r0, [r1]
	cmp r4, r0
	bge _0803F888
	movs r2, #0
	adds r0, r6, #0
	adds r0, #0x4c
_0803F87C:
	strh r2, [r0]
	adds r0, #2
	adds r4, #1
	ldrb r3, [r1]
	cmp r4, r3
	blt _0803F87C
_0803F888:
	movs r0, #0
	mov r4, sb
	strb r0, [r4]
	mov r0, ip
	movs r1, #8
	bl InitText
	movs r0, #1
	ldr r7, [sp, #0x28]
	strb r0, [r7]
	movs r4, #0
	movs r0, #6
	strh r0, [r6, #0x34]
	bl sub_803F574
	ldrh r1, [r0, #0x30]
	subs r1, #4
	ldrh r2, [r0, #0x32]
	adds r2, #1
	adds r0, r6, #0
	bl sub_8048FC4
	str r0, [r6, #0x2c]
	mov r0, r8
	strb r4, [r0]
	ldr r5, _0803F9AC @ =0x0203D9F8
	movs r4, #9
_0803F8BE:
	adds r0, r5, #0
	movs r1, #0x1a
	bl InitText
	adds r5, #8
	subs r4, #1
	cmp r4, #0
	bge _0803F8BE
	ldr r4, _0803F9B0 @ =0x0203D994
	adds r0, r4, #0
	movs r1, #0xc
	bl InitText
	ldr r0, [r6, #0x2c]
	movs r1, #3
	bl sub_804856C
	subs r4, #0x8c
	ldrb r0, [r4]
	str r0, [sp]
	ldr r0, [r6, #0x2c]
	str r0, [sp, #4]
	add r0, sp, #8
	movs r1, #0xa
	movs r2, #0
	movs r3, #8
	bl sub_8048670
	ldr r1, _0803F9B4 @ =0x0203DC08
	movs r0, #0
	strb r0, [r1]
	movs r0, #0
	mov r1, sl
	strb r0, [r1]
	adds r0, r6, #0
	bl sub_803F638
	ldr r2, [sp, #0x24]
	ldrb r0, [r2]
	cmp r0, #0
	beq _0803F98C
	movs r5, #0
	bl sub_802EBB0
	adds r2, r0, #0
	ldrb r0, [r2]
	add r3, sp, #0x14
	mov sl, r3
	movs r4, #0x33
	adds r4, r4, r6
	mov r8, r4
	cmp r0, #0
	beq _0803F962
	adds r3, r6, #0
	adds r3, #0x3d
	mov ip, sl
_0803F92E:
	movs r4, #1
_0803F930:
	adds r1, r3, r5
	ldrb r0, [r2]
	strb r0, [r1]
	mov r7, ip
	adds r1, r7, r5
	ldrb r0, [r2]
	strb r0, [r1]
	adds r2, #1
	adds r5, #1
	subs r4, #1
	cmp r4, #0
	bge _0803F930
	mov r0, sb
	ldrb r1, [r0]
	adds r1, #2
	mov r4, r8
	ldrb r4, [r4]
	lsls r0, r4, #1
	cmp r1, r0
	bgt _0803F95C
	mov r7, sb
	strb r1, [r7]
_0803F95C:
	ldrb r0, [r2]
	cmp r0, #0
	bne _0803F92E
_0803F962:
	adds r0, r6, #0
	mov r1, sl
	bl sub_803F584
	adds r0, r6, #0
	bl sub_803F724
	mov r1, r8
	ldrb r1, [r1]
	lsls r0, r1, #1
	subs r0, #2
	add r0, sl
	movs r1, #0
	strb r1, [r0]
	mov r0, sl
	bl sub_803F774
	ldr r2, [r6, #0x2c]
	lsls r1, r0, #3
	adds r1, r1, r0
	str r1, [r2, #0x40]
_0803F98C:
	movs r0, #0xf
	bl EnableBgSync
	add sp, #0x2c
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0803F9A4: .4byte 0x0203D908
_0803F9A8: .4byte 0x0203DC00
_0803F9AC: .4byte 0x0203D9F8
_0803F9B0: .4byte 0x0203D994
_0803F9B4: .4byte 0x0203DC08

	thumb_func_start sub_803F9B8
sub_803F9B8: @ 0x0803F9B8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	mov sl, r0
	mov sb, r1
	movs r0, #0x81
	bl GetUnit
	mov r8, r0
	mov r4, r8
	movs r6, #4
_0803F9D2:
	adds r0, r4, #0
	bl ClearUnit
	adds r4, #0x48
	subs r6, #1
	cmp r6, #0
	bge _0803F9D2
	movs r6, #0
	mov r7, r8
_0803F9E4:
	ldr r0, _0803FA34 @ =0x0203E760
	adds r0, r6, r0
	ldrb r0, [r0]
	cmp r0, #0
	beq _0803FA12
	bl GetUnitFromCharId
	adds r5, r0, #0
	ldr r4, [r5, #0xc]
	movs r0, #8
	ands r4, r0
	cmp r4, #0
	bne _0803FA12
	adds r0, r5, #0
	movs r1, #0
	bl SetUnitStatus
	str r4, [r5, #0xc]
	adds r0, r5, #0
	adds r1, r7, #0
	movs r2, #0x48
	bl sub_801530C
_0803FA12:
	adds r7, #0x48
	adds r6, #1
	cmp r6, #4
	ble _0803F9E4
	mov r0, sb
	mov r1, r8
	mov r2, sl
	bl sub_80A27C0
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0803FA34: .4byte 0x0203E760

	thumb_func_start sub_803FA38
sub_803FA38: @ 0x0803FA38
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	lsls r5, r1, #1
	adds r2, #0x36
	adds r2, r2, r5
	ldrh r4, [r2]
	movs r1, #0
	ldrsh r0, [r2, r1]
	lsls r0, r0, #6
	ldr r6, _0803FA8C @ =gUnk_081D94A0
	adds r2, r0, r6
	adds r1, r7, #0
	adds r1, #0x30
	ldrb r3, [r1]
	lsls r0, r3, #1
	adds r0, r0, r3
	lsls r3, r0, #2
	adds r0, r2, r3
	ldr r0, [r0]
	ldrb r0, [r0]
	cmp r0, #0
	bne _0803FA82
	adds r1, r5, #0
	adds r5, r6, #0
_0803FA68:
	adds r0, r2, #0
	adds r0, #0x36
	adds r0, r0, r1
	ldrh r4, [r0]
	movs r2, #0
	ldrsh r0, [r0, r2]
	lsls r0, r0, #6
	adds r2, r0, r5
	adds r0, r2, r3
	ldr r0, [r0]
	ldrb r0, [r0]
	cmp r0, #0
	beq _0803FA68
_0803FA82:
	strh r4, [r7, #0x34]
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0803FA8C: .4byte gUnk_081D94A0

	thumb_func_start sub_803FA90
sub_803FA90: @ 0x0803FA90
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r5, r0, #0
	adds r7, r1, #0
	adds r6, r5, #0
	adds r6, #0x38
	movs r0, #0x3c
	adds r0, r0, r5
	mov r8, r0
	ldrb r1, [r0]
	lsls r0, r1, #1
	ldrb r2, [r6]
	cmp r2, r0
	bge _0803FB18
	movs r0, #2
	bl sub_803E248
	adds r4, r5, #0
	adds r4, #0x30
	ldrb r3, [r4]
	lsls r0, r3, #1
	adds r0, r0, r3
	lsls r0, r0, #2
	adds r0, r7, r0
	ldr r0, [r0]
	ldrb r1, [r6]
	adds r1, #0x3d
	adds r1, r5, r1
	bl sub_803DDF8
	ldrb r1, [r6]
	lsrs r0, r1, #1
	lsls r0, r0, #1
	adds r2, r5, #0
	adds r2, #0x4c
	adds r2, r2, r0
	ldr r1, _0803FB00 @ =0x00003FFF
	ldrh r3, [r5, #0x34]
	ands r1, r3
	movs r0, #3
	ldrb r4, [r4]
	ands r0, r4
	lsls r0, r0, #0xe
	orrs r1, r0
	strh r1, [r2]
	ldrb r1, [r6]
	adds r1, #2
	mov r2, r8
	ldrb r2, [r2]
	lsls r0, r2, #1
	cmp r1, r0
	bge _0803FB04
	strb r1, [r6]
	b _0803FB08
	.align 2, 0
_0803FB00: .4byte 0x00003FFF
_0803FB04:
	movs r0, #5
	strh r0, [r5, #0x34]
_0803FB08:
	adds r0, r5, #0
	bl sub_803F724
	adds r1, r5, #0
	adds r1, #0x39
	movs r0, #0
	strb r0, [r1]
	b _0803FB1E
_0803FB18:
	movs r0, #0
	bl sub_803E248
_0803FB1E:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_803FB28
sub_803FB28: @ 0x0803FB28
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r4, r5, #0
	adds r4, #0x38
	ldrb r0, [r4]
	cmp r0, #0
	beq _0803FB78
	movs r0, #2
	bl sub_803E248
	ldrb r1, [r4]
	lsrs r0, r1, #1
	lsls r0, r0, #1
	adds r2, r5, #0
	adds r2, #0x4c
	adds r0, r2, r0
	ldrh r0, [r0]
	cmp r0, #0
	bne _0803FB52
	subs r0, r1, #2
	strb r0, [r4]
_0803FB52:
	ldrb r1, [r4]
	adds r0, r1, r5
	adds r0, #0x3d
	movs r1, #0
	strb r1, [r0]
	ldrb r4, [r4]
	lsrs r0, r4, #1
	lsls r0, r0, #1
	adds r0, r2, r0
	movs r2, #0
	movs r1, #0
	strh r1, [r0]
	adds r0, r5, #0
	adds r0, #0x39
	strb r2, [r0]
	adds r0, r5, #0
	bl sub_803F724
	b _0803FB7E
_0803FB78:
	movs r0, #0
	bl sub_803E248
_0803FB7E:
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start sub_803FB84
sub_803FB84: @ 0x0803FB84
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r4, r5, #0
	adds r4, #0x3d
	ldrb r0, [r4]
	cmp r0, #0
	beq _0803FBC2
	movs r0, #2
	bl sub_803E248
	bl sub_803DEC4
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0803FBB4
	ldr r0, _0803FBB0 @ =0x0203D908
	ldrb r1, [r0, #3]
	adds r0, r4, #0
	bl sub_803F9B8
	b _0803FBBA
	.align 2, 0
_0803FBB0: .4byte 0x0203D908
_0803FBB4:
	adds r0, r4, #0
	bl sub_802EBB8
_0803FBBA:
	adds r0, r5, #0
	bl Proc_Break
	b _0803FBC8
_0803FBC2:
	movs r0, #0
	bl sub_803E248
_0803FBC8:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_803FBD0
sub_803FBD0: @ 0x0803FBD0
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	adds r5, r0, #0
	adds r4, r1, #0
	mov sb, r2
	adds r7, r3, #0
	adds r0, #0x30
	ldrb r0, [r0]
	cmp r0, #1
	bls _0803FBFC
	cmp r7, #0
	bne _0803FBFC
	movs r0, #2
	bl sub_803E248
	adds r0, r5, #0
	adds r1, r4, #0
	bl sub_803FA90
	b _0803FC9E
_0803FBFC:
	adds r6, r5, #0
	adds r6, #0x38
	ldrb r0, [r6]
	cmp r0, #0
	beq _0803FC94
	ldrb r0, [r6]
	lsrs r2, r0, #1
	lsls r1, r2, #1
	adds r4, r5, #0
	adds r4, #0x4c
	adds r1, r4, r1
	ldr r3, _0803FC84 @ =0x00003FFF
	adds r0, r3, #0
	ldrh r1, [r1]
	ands r0, r1
	movs r1, #1
	mov r8, r1
	cmp r0, #0
	beq _0803FC26
	movs r0, #0
	mov r8, r0
_0803FC26:
	mov r0, r8
	subs r1, r2, r0
	lsls r1, r1, #1
	adds r1, r4, r1
	adds r0, r3, #0
	ldrh r1, [r1]
	ands r0, r1
	bl sub_803F574
	ldrb r2, [r6]
	lsrs r1, r2, #1
	mov r3, r8
	subs r1, r1, r3
	lsls r1, r1, #1
	adds r1, r4, r1
	ldrh r1, [r1]
	lsrs r2, r1, #0xe
	lsls r1, r2, #1
	adds r1, r1, r2
	add r1, sb
	lsls r1, r1, #2
	adds r4, r0, r1
	ldr r0, [r4]
	ldrb r0, [r0]
	cmp r0, #0
	beq _0803FC88
	movs r0, #2
	bl sub_803E248
	ldr r0, [r4]
	ldrb r1, [r6]
	adds r1, #0x3d
	adds r1, r5, r1
	mov r3, r8
	lsls r2, r3, #1
	subs r1, r1, r2
	bl sub_803DDF8
	adds r0, r5, #0
	bl sub_803F724
	adds r0, r5, #0
	adds r0, #0x39
	mov r1, sb
	strb r1, [r0]
	movs r0, #1
	b _0803FCA0
	.align 2, 0
_0803FC84: .4byte 0x00003FFF
_0803FC88:
	cmp r7, #0
	bne _0803FC9E
	movs r0, #0
	bl sub_803E248
	b _0803FC9E
_0803FC94:
	cmp r7, #0
	bne _0803FC9E
	movs r0, #0
	bl sub_803E248
_0803FC9E:
	movs r0, #0
_0803FCA0:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	thumb_func_start sub_803FCAC
sub_803FCAC: @ 0x0803FCAC
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	adds r6, r1, #0
	ldr r4, _0803FD2C @ =gpKeySt
	ldr r1, [r4]
	movs r0, #0x40
	ldrh r1, [r1, #6]
	ands r0, r1
	cmp r0, #0
	beq _0803FCCA
	adds r0, r5, #0
	movs r1, #0
	adds r2, r6, #0
	bl sub_803FA38
_0803FCCA:
	ldr r1, [r4]
	movs r0, #0x80
	ldrh r1, [r1, #6]
	ands r0, r1
	cmp r0, #0
	beq _0803FCE0
	adds r0, r5, #0
	movs r1, #1
	adds r2, r6, #0
	bl sub_803FA38
_0803FCE0:
	ldr r1, [r4]
	movs r0, #0x20
	ldrh r1, [r1, #6]
	ands r0, r1
	cmp r0, #0
	beq _0803FCF6
	adds r0, r5, #0
	movs r1, #2
	adds r2, r6, #0
	bl sub_803FA38
_0803FCF6:
	ldr r1, [r4]
	movs r0, #0x10
	ldrh r1, [r1, #6]
	ands r0, r1
	cmp r0, #0
	beq _0803FD0C
	adds r0, r5, #0
	movs r1, #3
	adds r2, r6, #0
	bl sub_803FA38
_0803FD0C:
	ldr r1, [r4]
	movs r0, #1
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _0803FE02
	adds r0, r6, #0
	adds r0, #0x3e
	ldrb r0, [r0]
	cmp r0, #7
	bhi _0803FE02
	lsls r0, r0, #2
	ldr r1, _0803FD30 @ =_0803FD34
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0803FD2C: .4byte gpKeySt
_0803FD30: .4byte _0803FD34
_0803FD34: @ jump table
	.4byte _0803FD54 @ case 0
	.4byte _0803FD88 @ case 1
	.4byte _0803FDA4 @ case 2
	.4byte _0803FDCA @ case 3
	.4byte _0803FD5E @ case 4
	.4byte _0803FD68 @ case 5
	.4byte _0803FD72 @ case 6
	.4byte _0803FD7A @ case 7
_0803FD54:
	adds r0, r5, #0
	adds r1, r6, #0
	bl sub_803FA90
	b _0803FE02
_0803FD5E:
	adds r0, r5, #0
	adds r1, r6, #0
	bl sub_803FB28
	b _0803FE02
_0803FD68:
	adds r0, r5, #0
	adds r1, r6, #0
	bl sub_803FB84
	b _0803FE02
_0803FD72:
	adds r0, r5, #0
	adds r1, r6, #0
	movs r2, #1
	b _0803FD80
_0803FD7A:
	adds r0, r5, #0
	adds r1, r6, #0
	movs r2, #2
_0803FD80:
	movs r3, #0
	bl sub_803FBD0
	b _0803FE02
_0803FD88:
	adds r4, r5, #0
	adds r4, #0x30
	ldrb r0, [r4]
	cmp r0, #0
	beq _0803FDC2
	movs r0, #2
	bl sub_803E248
	movs r0, #0
	strb r0, [r4]
	adds r1, r5, #0
	adds r1, #0x39
	strb r0, [r1]
	b _0803FEE0
_0803FDA4:
	adds r4, r5, #0
	adds r4, #0x30
	ldrb r0, [r4]
	cmp r0, #1
	beq _0803FDC2
	movs r0, #2
	bl sub_803E248
	movs r1, #0
	movs r0, #1
	strb r0, [r4]
	adds r0, r5, #0
	adds r0, #0x39
	strb r1, [r0]
	b _0803FEE0
_0803FDC2:
	movs r0, #0
	bl sub_803E248
	b _0803FE02
_0803FDCA:
	adds r4, r5, #0
	adds r4, #0x30
	ldrb r0, [r4]
	subs r0, #2
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bls _0803FDFC
	movs r0, #2
	bl sub_803E248
	movs r0, #2
	strb r0, [r4]
	adds r0, r5, #0
	adds r0, #0x32
	ldrb r0, [r0]
	cmp r0, #0
	beq _0803FDF2
	movs r0, #3
	strb r0, [r4]
_0803FDF2:
	adds r1, r5, #0
	adds r1, #0x39
	movs r0, #0
	strb r0, [r1]
	b _0803FEE0
_0803FDFC:
	movs r0, #0
	bl sub_803E248
_0803FE02:
	ldr r0, _0803FE1C @ =gpKeySt
	ldr r1, [r0]
	movs r0, #0x80
	lsls r0, r0, #1
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _0803FE4A
	adds r0, r5, #0
	adds r0, #0x39
	ldrb r7, [r0]
	adds r4, r0, #0
	b _0803FE32
	.align 2, 0
_0803FE1C: .4byte gpKeySt
_0803FE20:
	ldrb r2, [r4]
	adds r0, r5, #0
	adds r1, r6, #0
	movs r3, #1
	bl sub_803FBD0
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0803FE4A
_0803FE32:
	ldrb r0, [r4]
	adds r0, #1
	strb r0, [r4]
	ldrb r0, [r4]
	movs r1, #3
	bl __umodsi3
	strb r0, [r4]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r7, r0
	bne _0803FE20
_0803FE4A:
	ldr r4, _0803FEEC @ =gpKeySt
	ldr r1, [r4]
	movs r0, #0x80
	lsls r0, r0, #2
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _0803FE62
	adds r0, r5, #0
	adds r1, r6, #0
	bl sub_803FB28
_0803FE62:
	ldr r1, [r4]
	movs r0, #8
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _0803FE78
	movs r0, #3
	bl sub_803E248
	movs r0, #5
	strh r0, [r5, #0x34]
_0803FE78:
	ldr r0, [r4]
	ldrh r1, [r0, #8]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	beq _0803FEF4
	movs r0, #2
	bl sub_803E248
	adds r1, r5, #0
	adds r1, #0x30
	ldrb r2, [r1]
	adds r2, #1
	strb r2, [r1]
	lsls r0, r2, #0x18
	lsrs r0, r0, #0x18
	adds r3, r1, #0
	cmp r0, #2
	bne _0803FEAC
	adds r0, r5, #0
	adds r0, #0x32
	ldrb r0, [r0]
	cmp r0, #0
	beq _0803FEAC
	adds r0, r2, #1
	strb r0, [r3]
_0803FEAC:
	adds r2, r3, #0
	movs r0, #3
	ldrb r1, [r2]
	ands r0, r1
	strb r0, [r2]
	ldr r0, [r5, #0x30]
	ldr r1, _0803FEF0 @ =0x00FF00FF
	ands r0, r1
	cmp r0, #3
	bne _0803FEC4
	movs r0, #0
	strb r0, [r2]
_0803FEC4:
	ldrb r1, [r3]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r6, r0
	ldr r0, [r0]
	ldrb r0, [r0]
	cmp r0, #0
	bne _0803FEE0
	adds r0, r5, #0
	movs r1, #2
	adds r2, r6, #0
	bl sub_803FA38
_0803FEE0:
	adds r0, r5, #0
	movs r1, #1
	bl Proc_Goto
	b _0803FF28
	.align 2, 0
_0803FEEC: .4byte gpKeySt
_0803FEF0: .4byte 0x00FF00FF
_0803FEF4:
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0803FF28
	adds r0, r5, #0
	adds r0, #0x38
	ldrb r0, [r0]
	cmp r0, #0
	beq _0803FF10
	adds r0, r5, #0
	adds r1, r6, #0
	bl sub_803FB28
	b _0803FF28
_0803FF10:
	bl sub_803DEC4
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0803FF28
	movs r0, #1
	bl sub_803E248
	adds r0, r5, #0
	movs r1, #3
	bl Proc_Goto
_0803FF28:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_803FF30
sub_803FF30: @ 0x0803FF30
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #8
	add r7, sp, #8
	adds r4, r0, #0
	mov r8, sp
	movs r0, #0x3c
	adds r0, r0, r4
	mov sb, r0
	ldrb r1, [r0]
	lsls r0, r1, #1
	adds r0, #4
	lsrs r0, r0, #2
	lsls r0, r0, #2
	mov r2, sp
	subs r2, r2, r0
	mov sp, r2
	add r6, sp, #8
	movs r1, #0x34
	ldrsh r0, [r4, r1]
	bl sub_803F574
	adds r5, r0, #0
	ldrh r0, [r4, #0x34]
	strh r0, [r4, #0x36]
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_803FCAC
	ldrh r2, [r4, #0x36]
	ldrh r0, [r4, #0x34]
	cmp r2, r0
	beq _0803FF7C
	movs r0, #3
	bl sub_803E248
_0803FF7C:
	movs r1, #0x34
	ldrsh r0, [r4, r1]
	bl sub_803F574
	adds r5, r0, #0
	adds r0, r4, #0
	adds r0, #0x3d
	adds r1, r6, #0
	bl sub_803DDF8
	mov r2, sb
	ldrb r2, [r2]
	lsls r0, r2, #1
	subs r0, #2
	adds r0, r6, r0
	movs r1, #0
	strb r1, [r0]
	adds r0, r6, #0
	bl sub_803F774
	lsls r1, r0, #3
	adds r3, r1, r0
	ldr r6, [r4, #0x2c]
	ldrh r1, [r5, #0x30]
	subs r1, #4
	ldrh r2, [r5, #0x32]
	adds r2, #1
	adds r0, r5, #0
	adds r0, #0x34
	ldrb r0, [r0]
	str r0, [sp]
	adds r0, r4, #0
	adds r0, #0x30
	ldrb r4, [r0]
	cmp r4, #1
	bhi _0803FFC8
	ldrb r0, [r0]
	b _0803FFCA
_0803FFC8:
	movs r0, #2
_0803FFCA:
	str r0, [sp, #4]
	adds r0, r6, #0
	bl sub_8049004
	mov sp, r8
	add sp, #8
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_803FFE4
sub_803FFE4: @ 0x0803FFE4
	ldr r0, _0804000C @ =0x04000006
	ldrh r0, [r0]
	adds r0, #1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0xa0
	bhi _08040030
	cmp r0, #0x27
	bhi _08040018
	ldr r1, _08040010 @ =0x04000050
	movs r2, #0x84
	lsls r2, r2, #4
	adds r0, r2, #0
	strh r0, [r1]
	adds r1, #2
	ldr r2, _08040014 @ =0x00000F08
	adds r0, r2, #0
	strh r0, [r1]
	b _08040030
	.align 2, 0
_0804000C: .4byte 0x04000006
_08040010: .4byte 0x04000050
_08040014: .4byte 0x00000F08
_08040018:
	ldr r1, _08040034 @ =0x04000050
	ldr r2, _08040038 @ =0x00000442
	adds r0, r2, #0
	strh r0, [r1]
	ldr r2, _0804003C @ =0x04000052
	ldr r0, _08040040 @ =0x030013F8
	ldrb r1, [r0]
	movs r0, #0xf
	subs r0, r0, r1
	lsls r0, r0, #8
	adds r1, r1, r0
	strh r1, [r2]
_08040030:
	bx lr
	.align 2, 0
_08040034: .4byte 0x04000050
_08040038: .4byte 0x00000442
_0804003C: .4byte 0x04000052
_08040040: .4byte 0x030013F8

	thumb_func_start sub_8040044
sub_8040044: @ 0x08040044
	push {lr}
	adds r0, #0x3a
	movs r1, #0
	strb r1, [r0]
	ldr r0, _08040058 @ =sub_803FFE4
	bl SetOnHBlankA
	pop {r0}
	bx r0
	.align 2, 0
_08040058: .4byte sub_803FFE4

	thumb_func_start sub_804005C
sub_804005C: @ 0x0804005C
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r6, r0, #0
	ldr r4, _08040098 @ =0x030013F8
	adds r5, r6, #0
	adds r5, #0x3a
	ldrb r3, [r5]
	movs r0, #8
	str r0, [sp]
	movs r0, #0
	movs r1, #0xf
	movs r2, #0
	bl Interpolate
	strb r0, [r4]
	ldrb r0, [r5]
	adds r0, #1
	strb r0, [r5]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #8
	bls _0804008E
	adds r0, r6, #0
	bl Proc_Break
_0804008E:
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08040098: .4byte 0x030013F8

	thumb_func_start sub_804009C
sub_804009C: @ 0x0804009C
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r2, r4, #0
	adds r2, #0x31
	ldrb r0, [r2]
	adds r0, #1
	movs r5, #0
	movs r1, #1
	ands r0, r1
	strb r0, [r2]
	adds r0, r4, #0
	bl sub_803F638
	movs r0, #2
	bl EnableBgSync
	adds r4, #0x3a
	strb r5, [r4]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_80400C8
sub_80400C8: @ 0x080400C8
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r6, r0, #0
	ldr r4, _08040108 @ =0x030013F8
	adds r5, r6, #0
	adds r5, #0x3a
	ldrb r3, [r5]
	movs r0, #8
	str r0, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #0xf
	bl Interpolate
	strb r0, [r4]
	ldrb r0, [r5]
	adds r0, #1
	strb r0, [r5]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #8
	bls _08040100
	movs r0, #0
	bl SetOnHBlankA
	adds r0, r6, #0
	bl Proc_Break
_08040100:
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08040108: .4byte 0x030013F8

	thumb_func_start sub_804010C
sub_804010C: @ 0x0804010C
	push {r4, lr}
	adds r0, #0x3b
	movs r1, #1
	strb r1, [r0]
	bl sub_8049A08
	ldr r4, _0804013C @ =0x0203D994
	adds r0, r4, #0
	bl ClearText
	ldr r1, _08040140 @ =gUnk_081DAEF4
	adds r0, r4, #0
	bl Text_DrawString
	ldr r1, _08040144 @ =gBg0Tm + 0x316
	adds r0, r4, #0
	bl PutText
	movs r0, #1
	bl EnableBgSync
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0804013C: .4byte 0x0203D994
_08040140: .4byte gUnk_081DAEF4
_08040144: .4byte gBg0Tm + 0x316

	thumb_func_start sub_8040148
sub_8040148: @ 0x08040148
	push {r4, r5, lr}
	adds r5, r0, #0
	movs r0, #0x40
	movs r1, #0x58
	bl sub_8049A44
	ldr r0, _080401D8 @ =gpKeySt
	ldr r1, [r0]
	movs r0, #0x20
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _08040176
	adds r1, r5, #0
	adds r1, #0x3b
	ldrb r0, [r1]
	cmp r0, #1
	bne _08040176
	movs r0, #0
	strb r0, [r1]
	movs r0, #3
	bl sub_803E248
_08040176:
	ldr r0, _080401D8 @ =gpKeySt
	ldr r1, [r0]
	movs r0, #0x10
	ldrh r1, [r1, #8]
	ands r0, r1
	adds r4, r5, #0
	adds r4, #0x3b
	cmp r0, #0
	beq _08040198
	ldrb r0, [r4]
	cmp r0, #0
	bne _08040198
	movs r0, #1
	strb r0, [r4]
	movs r0, #3
	bl sub_803E248
_08040198:
	ldrb r1, [r4]
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r0, #0x50
	movs r1, #0x60
	bl DisplayUiHand
	ldr r0, _080401D8 @ =gpKeySt
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _080401E0
	movs r0, #1
	bl sub_803E248
	ldr r0, _080401DC @ =gBg0Tm + 0x316
	movs r1, #0xc
	movs r2, #2
	movs r3, #0
	bl TmFillRect_thm
	movs r0, #1
	bl EnableBgSync
	adds r0, r5, #0
	bl Proc_Break
	b _08040226
	.align 2, 0
_080401D8: .4byte gpKeySt
_080401DC: .4byte gBg0Tm + 0x316
_080401E0:
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _08040226
	ldrb r0, [r4]
	cmp r0, #0
	bne _08040208
	movs r0, #2
	bl sub_803E248
	ldr r1, _08040204 @ =0x0203DC08
	movs r0, #1
	strb r0, [r1]
	adds r0, r5, #0
	movs r1, #2
	bl Proc_Goto
	b _0804020E
	.align 2, 0
_08040204: .4byte 0x0203DC08
_08040208:
	movs r0, #1
	bl sub_803E248
_0804020E:
	ldr r0, _0804022C @ =gBg0Tm + 0x316
	movs r1, #0xc
	movs r2, #2
	movs r3, #0
	bl TmFillRect_thm
	movs r0, #1
	bl EnableBgSync
	adds r0, r5, #0
	bl Proc_Break
_08040226:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0804022C: .4byte gBg0Tm + 0x316

	thumb_func_start sub_8040230
sub_8040230: @ 0x08040230
	push {lr}
	bl sub_803DEC4
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08040240
	bl sub_8048494
_08040240:
	pop {r0}
	bx r0

	thumb_func_start sub_8040244
sub_8040244: @ 0x08040244
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x40
	ldrh r0, [r0]
	adds r1, r4, #0
	adds r1, #0x42
	ldrb r2, [r1]
	lsls r1, r2, #3
	movs r3, #0xc0
	lsls r3, r3, #1
	adds r1, r1, r3
	adds r2, #0xa
	bl sub_8006E54
	movs r0, #0
	str r0, [r4, #0x3c]
	subs r0, #0x26
	str r0, [r4, #0x34]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_8040270
sub_8040270: @ 0x08040270
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	adds r6, r0, #0
	ldr r4, [r6, #0x2c]
	ldr r0, [r4, #0x64]
	cmp r0, #0
	bne _08040294
	ldr r0, [r6, #0x3c]
	cmp r0, #0x20
	ble _0804028E
	adds r0, r6, #0
	bl Proc_Break
_0804028E:
	ldr r0, [r4, #0x64]
	cmp r0, #0
	beq _0804029A
_08040294:
	ldr r0, [r6, #0x34]
	adds r0, #1
	str r0, [r6, #0x34]
_0804029A:
	ldr r0, [r6, #0x38]
	subs r0, #1
	str r0, [r6, #0x38]
	cmp r0, #0
	bge _080402A8
	movs r0, #0
	str r0, [r6, #0x38]
_080402A8:
	ldr r4, [r6, #0x38]
	cmp r4, #0
	beq _080402B0
	b _080403C0
_080402B0:
	ldr r3, [r6, #0x3c]
	cmp r3, #0x20
	bgt _080402C8
	movs r1, #0x50
	rsbs r1, r1, #0
	movs r0, #0x20
	str r0, [sp]
	movs r0, #4
	movs r2, #0
	bl Interpolate
	str r0, [r6, #0x30]
_080402C8:
	ldr r0, [r6, #0x3c]
	adds r0, #1
	str r0, [r6, #0x3c]
	ldr r1, [r6, #0x30]
	ldr r2, [r6, #0x34]
	subs r2, #0x10
	ldr r3, _08040374 @ =gUnk_08C081C8
	movs r0, #0x43
	adds r0, r0, r6
	mov r8, r0
	ldrb r5, [r0]
	lsls r0, r5, #2
	adds r0, r0, r3
	ldr r3, [r0]
	str r4, [sp]
	movs r0, #4
	bl sub_8006884
	ldr r1, [r6, #0x30]
	adds r1, #0x48
	ldr r2, [r6, #0x34]
	subs r2, #6
	ldr r3, _08040378 @ =gUnk_08C081B8
	adds r5, r6, #0
	adds r5, #0x42
	ldrb r7, [r5]
	lsls r0, r7, #2
	adds r0, r0, r3
	ldr r3, [r0]
	str r4, [sp]
	movs r0, #4
	bl sub_8006884
	ldr r1, [r6, #0x30]
	adds r1, #0x60
	ldr r2, [r6, #0x34]
	adds r2, #8
	ldr r3, _0804037C @ =gUnk_081DAF4C
	str r4, [sp]
	movs r0, #4
	bl sub_8006884
	ldr r1, [r6, #0x30]
	adds r1, #0x40
	ldr r2, [r6, #0x34]
	adds r2, #8
	ldr r3, _08040380 @ =gUnk_081DAF82
	mov r4, r8
	ldrb r4, [r4]
	lsls r0, r4, #2
	adds r0, #0x50
	str r0, [sp]
	movs r0, #4
	bl sub_8006884
	ldr r1, [r6, #0x30]
	rsbs r1, r1, #0
	adds r1, #0x70
	ldr r2, [r6, #0x34]
	subs r2, #8
	ldr r3, _08040384 @ =gUnk_081DAF54
	movs r0, #0xf
	ldrb r7, [r5]
	ands r0, r7
	lsls r0, r0, #0xc
	movs r4, #0x80
	lsls r4, r4, #3
	adds r0, r0, r4
	str r0, [sp]
	movs r0, #4
	bl sub_8006884
	ldr r0, [r6, #0x30]
	rsbs r0, r0, #0
	adds r1, r0, #0
	adds r1, #0x7c
	ldr r2, [r6, #0x34]
	ldr r3, _08040388 @ =gUnk_081DAF6E
	ldrb r0, [r5]
	cmp r0, #3
	beq _0804038C
	lsls r0, r0, #3
	ldrb r4, [r5]
	adds r0, r0, r4
	b _0804038E
	.align 2, 0
_08040374: .4byte gUnk_08C081C8
_08040378: .4byte gUnk_08C081B8
_0804037C: .4byte gUnk_081DAF4C
_08040380: .4byte gUnk_081DAF82
_08040384: .4byte gUnk_081DAF54
_08040388: .4byte gUnk_081DAF6E
_0804038C:
	movs r0, #0x40
_0804038E:
	str r0, [sp]
	movs r0, #4
	bl sub_8006884
	ldr r1, [r6, #0x30]
	rsbs r1, r1, #0
	adds r1, #0xd0
	ldr r2, [r6, #0x34]
	subs r2, #8
	ldr r3, _080403CC @ =gUnk_081DAF8A
	ldrb r4, [r5]
	adds r0, r4, #0
	adds r0, #0xa
	movs r5, #0xf
	ands r0, r5
	lsls r0, r0, #0xc
	lsls r4, r4, #3
	movs r5, #0xc0
	lsls r5, r5, #1
	adds r4, r4, r5
	adds r0, r0, r4
	str r0, [sp]
	movs r0, #5
	bl sub_8006884
_080403C0:
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080403CC: .4byte gUnk_081DAF8A

	thumb_func_start sub_80403D0
sub_80403D0: @ 0x080403D0
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	adds r5, r0, #0
	ldr r1, [r5, #0x30]
	ldr r2, [r5, #0x34]
	subs r2, #0x10
	ldr r3, _08040480 @ =gUnk_08C081C8
	movs r0, #0x43
	adds r0, r0, r5
	mov r8, r0
	ldrb r4, [r0]
	lsls r0, r4, #2
	adds r0, r0, r3
	ldr r3, [r0]
	movs r4, #0
	str r4, [sp]
	movs r0, #4
	bl sub_8006884
	ldr r1, [r5, #0x30]
	adds r1, #0x48
	ldr r2, [r5, #0x34]
	subs r2, #6
	ldr r3, _08040484 @ =gUnk_08C081B8
	adds r6, r5, #0
	adds r6, #0x42
	ldrb r7, [r6]
	lsls r0, r7, #2
	adds r0, r0, r3
	ldr r3, [r0]
	str r4, [sp]
	movs r0, #4
	bl sub_8006884
	ldr r1, [r5, #0x30]
	adds r1, #0x60
	ldr r2, [r5, #0x34]
	adds r2, #8
	ldr r3, _08040488 @ =gUnk_081DAF4C
	str r4, [sp]
	movs r0, #4
	bl sub_8006884
	ldr r1, [r5, #0x30]
	adds r1, #0x40
	ldr r2, [r5, #0x34]
	adds r2, #8
	ldr r3, _0804048C @ =gUnk_081DAF82
	mov r4, r8
	ldrb r4, [r4]
	lsls r0, r4, #2
	adds r0, #0x50
	str r0, [sp]
	movs r0, #4
	bl sub_8006884
	ldr r1, [r5, #0x30]
	rsbs r1, r1, #0
	adds r1, #0x70
	ldr r2, [r5, #0x34]
	subs r2, #8
	ldr r3, _08040490 @ =gUnk_081DAF54
	movs r0, #0xf
	ldrb r7, [r6]
	ands r0, r7
	lsls r0, r0, #0xc
	movs r4, #0x80
	lsls r4, r4, #3
	adds r0, r0, r4
	str r0, [sp]
	movs r0, #4
	bl sub_8006884
	ldr r0, [r5, #0x30]
	rsbs r0, r0, #0
	adds r1, r0, #0
	adds r1, #0x7c
	ldr r2, [r5, #0x34]
	ldr r3, _08040494 @ =gUnk_081DAF6E
	ldrb r0, [r6]
	cmp r0, #3
	beq _08040498
	lsls r0, r0, #3
	ldrb r6, [r6]
	adds r0, r0, r6
	b _0804049A
	.align 2, 0
_08040480: .4byte gUnk_08C081C8
_08040484: .4byte gUnk_08C081B8
_08040488: .4byte gUnk_081DAF4C
_0804048C: .4byte gUnk_081DAF82
_08040490: .4byte gUnk_081DAF54
_08040494: .4byte gUnk_081DAF6E
_08040498:
	movs r0, #0x40
_0804049A:
	str r0, [sp]
	movs r0, #4
	bl sub_8006884
	ldr r1, [r5, #0x30]
	rsbs r1, r1, #0
	adds r1, #0xd0
	ldr r2, [r5, #0x34]
	subs r2, #8
	ldr r3, _080404DC @ =gUnk_081DAF8A
	adds r0, r5, #0
	adds r0, #0x42
	ldrb r4, [r0]
	adds r0, r4, #0
	adds r0, #0xa
	movs r5, #0xf
	ands r0, r5
	lsls r0, r0, #0xc
	lsls r4, r4, #3
	movs r5, #0xc0
	lsls r5, r5, #1
	adds r4, r4, r5
	adds r0, r0, r4
	str r0, [sp]
	movs r0, #5
	bl sub_8006884
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080404DC: .4byte gUnk_081DAF8A

	thumb_func_start sub_80404E0
sub_80404E0: @ 0x080404E0
	push {r4, r5, r6, lr}
	mov r6, sb
	mov r5, r8
	push {r5, r6}
	mov r8, r0
	mov sb, r1
	adds r4, r2, #0
	adds r6, r3, #0
	ldr r5, [sp, #0x18]
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	lsls r6, r6, #0x18
	lsrs r6, r6, #0x18
	lsls r5, r5, #0x18
	lsrs r5, r5, #0x18
	ldr r0, _0804052C @ =gUnk_08C081D8
	mov r1, r8
	bl Proc_Start
	adds r1, r0, #0
	mov r0, r8
	str r0, [r1, #0x2c]
	mov r0, sb
	str r0, [r1, #0x38]
	adds r0, r1, #0
	adds r0, #0x40
	strh r4, [r0]
	adds r0, #3
	strb r5, [r0]
	subs r0, #1
	strb r6, [r0]
	adds r0, r1, #0
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_0804052C: .4byte gUnk_08C081D8

	thumb_func_start sub_8040530
sub_8040530: @ 0x08040530
	push {r4, r5, r6, r7, lr}
	adds r2, r0, #0
	adds r0, #0x40
	ldrb r5, [r0]
	ldr r6, _08040570 @ =gBg2Tm
	adds r3, r2, #0
	adds r3, #0x42
	adds r4, r2, #0
	adds r4, #0x41
	ldrb r1, [r4]
	subs r1, #1
	lsls r0, r1, #3
	adds r0, r2, r0
	adds r0, #0x44
	ldrb r3, [r3]
	ldrb r0, [r0]
	cmp r3, r0
	bne _08040580
	ldr r2, _08040574 @ =gUnk_081DAF98
	lsls r0, r1, #1
	lsls r1, r5, #3
	adds r0, r0, r1
	adds r0, r0, r2
	movs r1, #0
	ldrsh r0, [r0, r1]
	lsls r0, r0, #6
	adds r0, r0, r6
	ldr r1, _08040578 @ =gUnk_081CDA58
	ldr r2, _0804057C @ =0x00002060
	bl TmApplyTsa_thm
	b _080405AA
	.align 2, 0
_08040570: .4byte gBg2Tm
_08040574: .4byte gUnk_081DAF98
_08040578: .4byte gUnk_081CDA58
_0804057C: .4byte 0x00002060
_08040580:
	movs r2, #0
	ldr r7, _080405B0 @ =gUnk_081DAF98
	adds r3, r4, #0
	lsls r1, r5, #3
	ldr r5, _080405B4 @ =0x00001034
	adds r4, r5, #0
_0804058C:
	ldrb r0, [r3]
	subs r0, #1
	lsls r0, r0, #1
	adds r0, r0, r1
	adds r0, r0, r7
	movs r5, #0
	ldrsh r0, [r0, r5]
	lsls r0, r0, #5
	adds r0, r0, r2
	lsls r0, r0, #1
	adds r0, r0, r6
	strh r4, [r0]
	adds r2, #1
	cmp r2, #0x5f
	ble _0804058C
_080405AA:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080405B0: .4byte gUnk_081DAF98
_080405B4: .4byte 0x00001034

	thumb_func_start sub_80405B8
sub_80405B8: @ 0x080405B8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	str r0, [sp]
	adds r0, #0x40
	ldrb r0, [r0]
	mov sb, r0
	ldr r0, _0804060C @ =0x02000C60
	bl SetTextFont
	movs r5, #0
	cmp r5, sb
	bge _08040646
	mov sl, r5
	movs r0, #0x98
	mov r8, r0
	movs r7, #0
	movs r6, #0
_080405E2:
	ldr r0, _08040610 @ =0x0203D9A9
	adds r4, r6, r0
	adds r0, r4, #0
	bl GetStringTextLen
	adds r1, r0, #0
	movs r0, #0x48
	subs r0, r0, r1
	lsrs r1, r0, #0x1f
	adds r0, r0, r1
	asrs r1, r0, #1
	cmp r5, #2
	bgt _08040618
	adds r1, r7, r1
	ldr r0, _08040614 @ =0x0203D9F8
	movs r2, #0
	adds r3, r4, #0
	bl Text_InsertDrawString
	b _08040622
	.align 2, 0
_0804060C: .4byte 0x02000C60
_08040610: .4byte 0x0203D9A9
_08040614: .4byte 0x0203D9F8
_08040618:
	ldr r0, _08040658 @ =0x0203DA00
	movs r2, #0
	adds r3, r4, #0
	bl Text_InsertDrawString
_08040622:
	ldr r0, [sp]
	adds r0, #0x48
	add r0, sl
	ldr r3, [r0]
	ldr r0, _08040658 @ =0x0203DA00
	mov r1, r8
	movs r2, #2
	bl sub_803DE14
	movs r0, #8
	add sl, r0
	movs r0, #0x20
	add r8, r0
	adds r7, #0x48
	adds r6, #0xf
	adds r5, #1
	cmp r5, sb
	blt _080405E2
_08040646:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08040658: .4byte 0x0203DA00

	thumb_func_start sub_804065C
sub_804065C: @ 0x0804065C
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0804067C @ =gUnk_08C08258
	adds r1, r4, #0
	bl Proc_Start
	adds r1, r0, #0
	adds r0, r4, #0
	adds r0, #0x42
	adds r4, #0x44
	ldrb r0, [r0]
	ldrb r4, [r4]
	cmp r0, r4
	bne _08040680
	movs r0, #1
	b _08040682
	.align 2, 0
_0804067C: .4byte gUnk_08C08258
_08040680:
	movs r0, #0
_08040682:
	str r0, [r1, #0x58]
	adds r0, r1, #0
	pop {r4}
	pop {r1}
	bx r1

	thumb_func_start sub_804068C
sub_804068C: @ 0x0804068C
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r6, r0, #0
	bl sub_803E080
	bl sub_8048320
	ldr r0, _080407F0 @ =gUnk_081CB3E0
	ldr r1, _080407F4 @ =0x06014800
	bl Decompress
	ldr r0, _080407F8 @ =gUnk_081CC680
	ldr r1, _080407FC @ =0x06016000
	bl Decompress
	ldr r0, _08040800 @ =gUnk_081CC8AC
	ldr r1, _08040804 @ =0x06016800
	bl Decompress
	ldr r0, _08040808 @ =gUnk_081CD798
	movs r1, #0x98
	lsls r1, r1, #2
	movs r2, #0x80
	bl ApplyPaletteExt
	ldr r0, _0804080C @ =gUnk_081CD938
	movs r1, #0xb8
	lsls r1, r1, #2
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r0, _08040810 @ =gUnk_081CD028
	ldr r1, _08040814 @ =0x06000C00
	bl Decompress
	ldr r0, _08040818 @ =gUnk_081CD978
	movs r1, #0x40
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r4, _0804081C @ =gUnk_081CF7FC
	movs r0, #3
	bl GetBgChrOffset
	adds r1, r0, #0
	movs r0, #0xc0
	lsls r0, r0, #0x13
	adds r1, r1, r0
	adds r0, r4, #0
	bl Decompress
	ldr r0, _08040820 @ =gUnk_081D0E50
	movs r1, #0xa0
	lsls r1, r1, #1
	movs r2, #0x80
	bl ApplyPaletteExt
	ldr r0, _08040824 @ =gBg3Tm
	ldr r1, _08040828 @ =gUnk_081D0ED0
	movs r2, #0
	bl TmApplyTsa_thm
	ldr r0, _0804082C @ =0x02000C60
	ldr r1, _08040830 @ =0x06012000
	movs r2, #0xe
	bl InitSpriteTextFont
	ldr r0, _08040834 @ =Pal_Text
	movs r1, #0xf0
	lsls r1, r1, #2
	movs r2, #0x20
	bl ApplyPaletteExt
	movs r0, #0
	bl SetTextFontGlyphs
	bl ResetTextFont
	ldr r4, _08040838 @ =0x0203D9F8
	movs r5, #1
_0804072C:
	adds r0, r4, #0
	bl InitSpriteText
	adds r0, r4, #0
	movs r1, #0
	bl SpriteText_DrawBackgroundExt
	adds r4, #8
	subs r5, #1
	cmp r5, #0
	bge _0804072C
	ldr r0, _0804083C @ =gUnk_08C07DAC
	ldr r0, [r0]
	ldrb r2, [r0, #7]
	adds r1, r6, #0
	adds r1, #0x40
	movs r3, #0
	strb r2, [r1]
	ldrb r1, [r0, #7]
	adds r2, r6, #0
	adds r2, #0x41
	strb r1, [r2]
	ldrb r0, [r0, #6]
	adds r1, r6, #0
	adds r1, #0x42
	strb r0, [r1]
	mov r0, sp
	movs r5, #0
	strh r3, [r0]
	adds r4, r6, #0
	adds r4, #0x44
	ldr r2, _08040840 @ =0x01000010
	adds r1, r4, #0
	bl CpuSet
	adds r0, r4, #0
	bl sub_80448E8
	adds r0, r6, #0
	bl sub_80405B8
	movs r0, #0xb0
	str r0, [r6, #0x64]
	movs r0, #2
	movs r1, #0
	movs r2, #0xb0
	bl SetBgOffset
	ldr r3, _08040844 @ =gDispIo
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
	adds r0, r3, #0
	adds r0, #0x44
	movs r1, #8
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r0, #1
	strb r5, [r0]
	ldr r0, _08040848 @ =0x0000FFE0
	ldrh r2, [r3, #0x3c]
	ands r0, r2
	movs r1, #4
	orrs r0, r1
	ldr r1, _0804084C @ =0x0000E0FF
	ands r0, r1
	movs r2, #0x80
	lsls r2, r2, #4
	adds r1, r2, #0
	orrs r0, r1
	strh r0, [r3, #0x3c]
	adds r0, r6, #0
	bl sub_804065C
	movs r0, #8
	bl EnableBgSync
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080407F0: .4byte gUnk_081CB3E0
_080407F4: .4byte 0x06014800
_080407F8: .4byte gUnk_081CC680
_080407FC: .4byte 0x06016000
_08040800: .4byte gUnk_081CC8AC
_08040804: .4byte 0x06016800
_08040808: .4byte gUnk_081CD798
_0804080C: .4byte gUnk_081CD938
_08040810: .4byte gUnk_081CD028
_08040814: .4byte 0x06000C00
_08040818: .4byte gUnk_081CD978
_0804081C: .4byte gUnk_081CF7FC
_08040820: .4byte gUnk_081D0E50
_08040824: .4byte gBg3Tm
_08040828: .4byte gUnk_081D0ED0
_0804082C: .4byte 0x02000C60
_08040830: .4byte 0x06012000
_08040834: .4byte Pal_Text
_08040838: .4byte 0x0203D9F8
_0804083C: .4byte gUnk_08C07DAC
_08040840: .4byte 0x01000010
_08040844: .4byte gDispIo
_08040848: .4byte 0x0000FFE0
_0804084C: .4byte 0x0000E0FF

	thumb_func_start sub_8040850
sub_8040850: @ 0x08040850
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r4, r0, #0
	adds r0, #0x40
	ldrb r6, [r0]
	ldr r2, [r4, #0x64]
	subs r2, #1
	str r2, [r4, #0x64]
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	movs r0, #2
	movs r1, #0
	bl SetBgOffset
	bl sub_80498BC
	adds r5, r4, #0
	adds r5, #0x41
	ldrb r0, [r5]
	cmp r0, #0
	beq _080408DA
	ldr r2, [r4, #0x64]
	asrs r2, r2, #3
	ldr r3, _080408F0 @ =gUnk_081DAF98
	ldrb r0, [r5]
	subs r0, #1
	lsls r0, r0, #1
	lsls r1, r6, #3
	adds r0, r0, r1
	adds r0, r0, r3
	movs r1, #0
	ldrsh r0, [r0, r1]
	adds r0, #4
	cmp r2, r0
	bne _080408DA
	adds r0, r4, #0
	bl sub_8040530
	movs r0, #4
	bl EnableBgSync
	ldr r2, _080408F4 @ =0x0203DC74
	ldrb r1, [r5]
	subs r1, #1
	lsls r0, r1, #3
	adds r0, r4, r0
	adds r0, #0x44
	ldrb r3, [r0]
	lsls r0, r3, #1
	adds r2, #0x24
	adds r0, r0, r2
	ldrh r2, [r0]
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	str r1, [sp]
	adds r0, r4, #0
	movs r1, #0x28
	bl sub_80404E0
	ldrb r2, [r5]
	subs r2, #1
	lsls r2, r2, #2
	adds r1, r4, #0
	adds r1, #0x2c
	adds r1, r1, r2
	str r0, [r1]
	ldrb r0, [r5]
	subs r0, #1
	strb r0, [r5]
_080408DA:
	ldr r0, [r4, #0x64]
	cmp r0, #0
	bne _080408E6
	adds r0, r4, #0
	bl Proc_Break
_080408E6:
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080408F0: .4byte gUnk_081DAF98
_080408F4: .4byte 0x0203DC74

	thumb_func_start sub_80408F8
sub_80408F8: @ 0x080408F8
	push {r4, lr}
	adds r4, r0, #0
	bl sub_80498BC
	ldr r0, _08040934 @ =gpKeySt
	ldr r1, [r0]
	movs r0, #1
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _0804092E
	ldr r2, _08040938 @ =gUnk_086EA858
	ldr r1, _0804093C @ =gUnk_086EA8D0
	ldr r0, _08040940 @ =0x0000040C
	adds r1, r1, r0
	ldrh r3, [r1]
	lsls r0, r3, #1
	adds r0, r0, r3
	lsls r0, r0, #2
	adds r0, r0, r2
	ldr r0, [r0]
	movs r1, #1
	bl m4aMPlayFadeOut
	adds r0, r4, #0
	bl Proc_Break
_0804092E:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08040934: .4byte gpKeySt
_08040938: .4byte gUnk_086EA858
_0804093C: .4byte gUnk_086EA8D0
_08040940: .4byte 0x0000040C

	thumb_func_start sub_8040944
sub_8040944: @ 0x08040944
	push {lr}
	ldr r0, [r0, #0x58]
	cmp r0, #0
	beq _08040958
	movs r0, #0x2d
	movs r1, #0
	movs r2, #0
	bl sub_8003788
	b _08040962
_08040958:
	movs r0, #0x2e
	movs r1, #0
	movs r2, #0
	bl sub_8003788
_08040962:
	ldr r0, _08040978 @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08040974
	movs r0, #0x81
	bl m4aSongNumStart
_08040974:
	pop {r0}
	bx r0
	.align 2, 0
_08040978: .4byte gPlaySt

	thumb_func_start sub_804097C
sub_804097C: @ 0x0804097C
	push {lr}
	movs r0, #0x2e
	movs r1, #0
	movs r2, #0
	bl sub_8003788
	pop {r0}
	bx r0

	thumb_func_start sub_804098C
sub_804098C: @ 0x0804098C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	mov sb, r1
	mov sl, r2
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp]
	adds r4, r3, #0
	movs r2, #0
	ldr r1, _080409C0 @ =0x0203DB28
_080409A8:
	ldr r0, [r1]
	lsrs r0, r0, #5
	cmp r0, r4
	bhs _080409C4
	adds r7, r2, #0
	movs r2, #9
	lsls r3, r3, #5
	str r3, [sp, #4]
	cmp r2, r7
	ble _08040A40
	b _080409D2
	.align 2, 0
_080409C0: .4byte 0x0203DB28
_080409C4:
	adds r1, #0x14
	adds r2, #1
	cmp r2, #9
	ble _080409A8
	movs r0, #1
	rsbs r0, r0, #0
	b _08040AA4
_080409D2:
	ldr r6, _08040AB4 @ =0x0203DB28
	lsls r1, r2, #2
	adds r1, r1, r2
	lsls r1, r1, #2
	adds r5, r1, r6
	subs r2, #1
	mov r8, r2
	lsls r4, r2, #2
	add r4, r8
	lsls r4, r4, #2
	adds r4, r4, r6
	ldrb r0, [r4]
	lsls r2, r0, #0x1e
	lsrs r2, r2, #0x1e
	movs r0, #4
	rsbs r0, r0, #0
	ldrb r3, [r5]
	ands r0, r3
	orrs r0, r2
	strb r0, [r5]
	ldr r3, [r4]
	lsrs r3, r3, #5
	lsls r3, r3, #5
	ldr r0, [r5]
	movs r2, #0x1f
	ands r0, r2
	orrs r0, r3
	str r0, [r5]
	movs r2, #0xc
	ldrb r0, [r4]
	ands r2, r0
	movs r0, #0xd
	rsbs r0, r0, #0
	ldrb r3, [r5]
	ands r0, r3
	orrs r0, r2
	strb r0, [r5]
	movs r3, #0x10
	ldrb r4, [r4]
	ands r3, r4
	movs r2, #0x11
	rsbs r2, r2, #0
	ands r0, r2
	orrs r0, r3
	strb r0, [r5]
	adds r0, r6, #0
	subs r0, #0x10
	adds r0, r1, r0
	adds r6, #4
	adds r1, r1, r6
	bl sub_803DDF8
	mov r2, r8
	cmp r2, r7
	bgt _080409D2
_08040A40:
	ldr r5, _08040AB4 @ =0x0203DB28
	lsls r1, r7, #2
	adds r1, r1, r7
	lsls r1, r1, #2
	adds r4, r1, r5
	movs r3, #3
	ldr r2, [sp]
	ands r2, r3
	movs r0, #4
	rsbs r0, r0, #0
	ldrb r6, [r4]
	ands r0, r6
	orrs r0, r2
	strb r0, [r4]
	ldr r0, [r4]
	movs r2, #0x1f
	ands r0, r2
	ldr r2, [sp, #4]
	orrs r0, r2
	str r0, [r4]
	mov r6, sb
	ands r6, r3
	lsls r2, r6, #2
	movs r0, #0xd
	rsbs r0, r0, #0
	ldrb r3, [r4]
	ands r0, r3
	orrs r0, r2
	movs r2, #1
	mov r6, sl
	ands r6, r2
	lsls r3, r6, #4
	movs r2, #0x11
	rsbs r2, r2, #0
	ands r0, r2
	orrs r0, r3
	strb r0, [r4]
	ldr r0, _08040AB8 @ =gUnk_08C07DAC
	ldr r0, [r0]
	movs r2, #6
	ldrsb r2, [r0, r2]
	lsls r0, r2, #4
	subs r0, r0, r2
	ldr r2, _08040ABC @ =0x0203D9A9
	adds r0, r0, r2
	adds r5, #4
	adds r1, r1, r5
	bl sub_803DDF8
	adds r0, r7, #0
_08040AA4:
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_08040AB4: .4byte 0x0203DB28
_08040AB8: .4byte gUnk_08C07DAC
_08040ABC: .4byte 0x0203D9A9

	thumb_func_start sub_8040AC0
sub_8040AC0: @ 0x08040AC0
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	adds r7, r0, #0
	ldr r0, _08040B30 @ =0x0203D908
	adds r1, r0, #0
	adds r1, #0xec
	ldrb r1, [r1]
	lsls r5, r1, #0x1e
	lsrs r5, r5, #0x1f
	adds r0, #0xa0
	ldrb r0, [r0]
	subs r0, #1
	mov sb, r0
	bl sub_8045A7C
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	ldr r1, _08040B34 @ =0x0203DC74
	ldr r0, _08040B38 @ =gUnk_08C07DAC
	ldr r0, [r0]
	ldrb r0, [r0, #6]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r0, r0, #2
	adds r1, #0x14
	adds r0, r0, r1
	ldr r0, [r0]
	mov r8, r0
	ldr r6, _08040B3C @ =0x0203DB28
	adds r0, r6, #0
	bl sub_80A28C0
	adds r0, r4, #0
	mov r1, sb
	adds r2, r5, #0
	mov r3, r8
	bl sub_804098C
	str r0, [r7, #0x58]
	adds r0, r6, #0
	bl sub_80A2884
	ldr r1, [r7, #0x58]
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	beq _08040B40
	adds r0, r1, #0
	adds r1, r7, #0
	bl sub_8042680
	b _08040B46
	.align 2, 0
_08040B30: .4byte 0x0203D908
_08040B34: .4byte 0x0203DC74
_08040B38: .4byte gUnk_08C07DAC
_08040B3C: .4byte 0x0203DB28
_08040B40:
	movs r0, #1
	bl FadeBgmOut
_08040B46:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_8040B54
sub_8040B54: @ 0x08040B54
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	ldr r1, _08040BD8 @ =gUnk_081DAFC0
	mov r0, sp
	movs r2, #3
	bl memcpy
	bl InitUnits
	movs r6, #0
	ldr r1, _08040BDC @ =0x0203D908
	ldrb r0, [r1, #5]
	adds r0, #2
	cmp r6, r0
	bge _08040C2C
	mov sb, r1
_08040B7C:
	lsls r4, r6, #6
	adds r4, #1
	adds r0, r4, #0
	bl GetUnit
	adds r5, r0, #0
	mov r0, sb
	adds r0, #6
	adds r0, r6, r0
	ldrb r0, [r0]
	lsls r2, r6, #4
	subs r2, r2, r6
	ldr r1, _08040BE0 @ =0x0203D9A9
	adds r2, r2, r1
	adds r1, r5, #0
	bl sub_80A2820
	movs r7, #0
	adds r2, r6, #1
	mov sl, r2
	lsls r0, r6, #1
	ldr r1, _08040BE4 @ =0x0203DC98
	adds r0, r0, r1
	mov r8, r0
_08040BAC:
	adds r0, r4, #0
	bl GetUnit
	adds r5, r0, #0
	movs r2, #0
	strb r2, [r5, #9]
	movs r1, #0
	bl SetUnitStatus
	movs r0, #0
	strb r0, [r5, #0x1b]
	movs r0, #4
	ldr r1, _08040BE8 @ =0x0203D9F4
	ldrb r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _08040BEC
	adds r0, r5, #0
	bl sub_803E1F0
	b _08040BF2
	.align 2, 0
_08040BD8: .4byte gUnk_081DAFC0
_08040BDC: .4byte 0x0203D908
_08040BE0: .4byte 0x0203D9A9
_08040BE4: .4byte 0x0203DC98
_08040BE8: .4byte 0x0203D9F4
_08040BEC:
	adds r0, r5, #0
	bl sub_80495F4
_08040BF2:
	cmp r7, #0
	bne _08040C00
	adds r0, r5, #0
	bl GetUnitMiniPortraitId
	mov r2, r8
	strh r0, [r2]
_08040C00:
	strb r4, [r5, #0xb]
	cmp r6, #0
	beq _08040C18
	movs r0, #1
	ldr r1, _08040C64 @ =0x0203D9F4
	ldrb r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _08040C18
	movs r0, #0x80
	lsls r0, r0, #2
	str r0, [r5, #0xc]
_08040C18:
	adds r4, #1
	adds r7, #1
	cmp r7, #4
	ble _08040BAC
	mov r6, sl
	mov r2, sb
	ldrb r0, [r2, #5]
	adds r0, #2
	cmp r6, r0
	blt _08040B7C
_08040C2C:
	ldr r0, _08040C68 @ =0x0203DC74
	movs r1, #0
	strb r1, [r0]
	ldr r2, _08040C6C @ =gUnk_08C07DAC
	ldr r0, [r2]
	strb r1, [r0, #6]
	ldr r3, [r2]
	ldr r1, _08040C70 @ =0x0203D908
	ldrb r0, [r1, #5]
	add r0, sp
	ldrb r0, [r0]
	strb r0, [r3, #9]
	ldr r2, [r2]
	ldrb r0, [r1, #5]
	adds r0, #2
	strb r0, [r2, #7]
	ldrb r0, [r1, #5]
	adds r0, #2
	adds r1, #0xa0
	strb r0, [r1]
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08040C64: .4byte 0x0203D9F4
_08040C68: .4byte 0x0203DC74
_08040C6C: .4byte gUnk_08C07DAC
_08040C70: .4byte 0x0203D908

	thumb_func_start sub_8040C74
sub_8040C74: @ 0x08040C74
	push {lr}
	ldr r0, _08040C84 @ =gUnk_08C09444
	movs r1, #2
	bl Proc_Start
	pop {r0}
	bx r0
	.align 2, 0
_08040C84: .4byte gUnk_08C09444

	thumb_func_start sub_8040C88
sub_8040C88: @ 0x08040C88
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r0, _08040CC0 @ =gUnk_08C09444
	bl Proc_Find
	cmp r0, #0
	bne _08040CBA
	ldr r5, _08040CC4 @ =0x0203D908
	ldrb r0, [r5, #0xb]
	cmp r0, #1
	bne _08040CA6
	adds r0, r4, #0
	movs r1, #1
	bl Proc_Goto
_08040CA6:
	ldrb r5, [r5, #0xb]
	cmp r5, #2
	bne _08040CB4
	adds r0, r4, #0
	movs r1, #4
	bl Proc_Goto
_08040CB4:
	adds r0, r4, #0
	bl Proc_Break
_08040CBA:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08040CC0: .4byte gUnk_08C09444
_08040CC4: .4byte 0x0203D908

	thumb_func_start sub_8040CC8
sub_8040CC8: @ 0x08040CC8
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	mov r8, r0
	adds r4, r1, #0
	adds r5, r2, #0
	adds r6, r3, #0
	bl sub_8007DF4
	bl sub_800968C
	bl ResetTextFont
	adds r0, r4, #0
	adds r1, r5, #0
	mov r2, r8
	adds r3, r6, #0
	bl sub_8007E08
	movs r0, #1
	bl sub_8007F84
	movs r0, #1
	bl sub_8007F24
	movs r0, #2
	bl sub_8007F24
	movs r0, #4
	bl sub_8007F24
	movs r0, #2
	bl sub_8007F68
	movs r0, #1
	bl sub_8008CB8
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	thumb_func_start sub_8040D1C
sub_8040D1C: @ 0x08040D1C
	push {lr}
	ldr r0, _08040D34 @ =gUnk_08C07E20
	bl sub_8004748
	ldr r0, _08040D38 @ =gUnk_08C07E48
	bl sub_8004748
	ldr r0, _08040D3C @ =gUnk_08C07DF8
	bl sub_8004748
	pop {r0}
	bx r0
	.align 2, 0
_08040D34: .4byte gUnk_08C07E20
_08040D38: .4byte gUnk_08C07E48
_08040D3C: .4byte gUnk_08C07DF8

	thumb_func_start sub_8040D40
sub_8040D40: @ 0x08040D40
	push {lr}
	bl sub_803C9AC
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_8040D4C
sub_8040D4C: @ 0x08040D4C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	movs r6, #0
	ldr r0, _08040DC4 @ =0x0203D908
	mov sb, r0
	movs r1, #0x98
	lsls r1, r1, #2
	mov r8, r1
	movs r0, #0xa1
	add r0, sb
	mov sl, r0
	movs r7, #5
_08040D6C:
	mov r0, sb
	adds r0, #0x9c
	adds r5, r6, r0
	ldr r0, _08040DC8 @ =gUnk_08C07DAC
	ldr r0, [r0]
	adds r0, #0xb
	adds r0, r0, r6
	ldrb r0, [r0]
	ldrb r1, [r5]
	cmp r1, r0
	beq _08040DF8
	strb r0, [r5]
	lsls r1, r6, #3
	mov r0, sb
	adds r0, #0xc
	adds r4, r1, r0
	adds r0, r4, #0
	bl ClearText
	adds r0, r4, #0
	movs r1, #0
	bl Text_SetColor
	ldrb r0, [r5]
	cmp r0, #4
	bhi _08040DD4
	ldr r1, _08040DCC @ =gUnk_08C07E68
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r3, [r0]
	movs r0, #0xa
	str r0, [sp]
	adds r0, r4, #0
	movs r1, #0xa
	adds r2, r7, #0
	bl sub_8015324
	ldr r0, _08040DD0 @ =gUnk_081CD9F8
	mov r1, r8
	movs r2, #0x20
	bl ApplyPaletteExt
	b _08040DF2
	.align 2, 0
_08040DC4: .4byte 0x0203D908
_08040DC8: .4byte gUnk_08C07DAC
_08040DCC: .4byte gUnk_08C07E68
_08040DD0: .4byte gUnk_081CD9F8
_08040DD4:
	movs r0, #0xa
	str r0, [sp]
	adds r0, r4, #0
	movs r1, #0xa
	adds r2, r7, #0
	mov r3, sl
	bl sub_8015324
	lsls r0, r6, #5
	ldr r1, _08040E18 @ =gUnk_081CD798
	adds r0, r0, r1
	mov r1, r8
	movs r2, #0x20
	bl ApplyPaletteExt
_08040DF2:
	movs r0, #1
	bl EnableBgSync
_08040DF8:
	movs r1, #0x20
	add r8, r1
	movs r0, #0xf
	add sl, r0
	adds r7, #3
	adds r6, #1
	cmp r6, #3
	ble _08040D6C
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08040E18: .4byte gUnk_081CD798

	thumb_func_start sub_8040E1C
sub_8040E1C: @ 0x08040E1C
	push {r4, r5, r6, lr}
	sub sp, #0x18
	adds r6, r0, #0
	bl sub_803E080
	bl sub_8048320
	ldr r0, _08040F38 @ =gUnk_081CB3E0
	ldr r1, _08040F3C @ =0x06014800
	bl Decompress
	ldr r0, _08040F40 @ =gUnk_081CC680
	ldr r1, _08040F44 @ =0x06016000
	bl Decompress
	ldr r0, _08040F48 @ =gUnk_081CBC70
	ldr r1, _08040F4C @ =0x06016800
	bl Decompress
	movs r4, #0x98
	lsls r4, r4, #2
	movs r5, #3
_08040E48:
	ldr r0, _08040F50 @ =gUnk_081CD9F8
	adds r1, r4, #0
	movs r2, #0x20
	bl ApplyPaletteExt
	adds r4, #0x20
	subs r5, #1
	cmp r5, #0
	bge _08040E48
	movs r0, #0
	movs r1, #2
	bl sub_80483C0
	ldr r4, _08040F54 @ =0x0203D908
	ldrb r0, [r4, #3]
	add r1, sp, #8
	bl sub_80A25D8
	ldr r0, _08040F58 @ =0x0203DA48
	bl SetTextFont
	bl InitSystemTextFont
	bl ResetTextFont
	bl sub_803E1A0
	movs r5, #0
	adds r4, #0x9c
	movs r2, #0xff
_08040E84:
	adds r1, r5, r4
	ldrb r0, [r1]
	orrs r0, r2
	strb r0, [r1]
	adds r5, #1
	cmp r5, #3
	ble _08040E84
	bl sub_8040D4C
	movs r5, #0
	ldr r2, _08040F5C @ =0x030045E6
_08040E9A:
	adds r0, r5, r2
	mov r1, sp
	adds r1, r1, r5
	adds r1, #8
	ldrb r1, [r1]
	strb r1, [r0]
	adds r5, #1
	cmp r5, #0xe
	ble _08040E9A
	movs r0, #0
	str r0, [r6, #0x34]
	str r0, [r6, #0x30]
	movs r0, #0xc0
	movs r1, #0x10
	adds r2, r6, #0
	bl sub_80482D0
	movs r0, #0x48
	movs r1, #0x20
	adds r2, r6, #0
	bl sub_804984C
	str r0, [r6, #0x2c]
	ldr r0, _08040F60 @ =gUnk_08C08348
	bl sub_80069E0
	movs r0, #2
	str r0, [sp]
	movs r0, #3
	movs r1, #0xdf
	movs r2, #0xd0
	movs r3, #0x50
	bl sub_8006AC4
	ldr r0, [r6, #0x2c]
	ldr r1, _08040F64 @ =gUnk_081DAEC8
	ldr r4, _08040F54 @ =0x0203D908
	ldrb r2, [r4]
	adds r1, r2, r1
	ldrb r1, [r1]
	bl sub_804856C
	ldr r0, _08040F68 @ =gUnk_08C07F8C
	ldrb r3, [r4]
	lsls r1, r3, #2
	adds r0, r1, r0
	ldr r0, [r0]
	ldr r2, _08040F6C @ =gUnk_081DAEBC
	adds r1, r1, r2
	ldr r1, [r1]
	str r3, [sp]
	ldr r2, [r6, #0x2c]
	str r2, [sp, #4]
	movs r2, #0
	movs r3, #8
	bl sub_8048670
	ldr r0, [r6, #0x30]
	ldr r1, _08040F70 @ =0x000003CB
	adds r0, r0, r1
	movs r1, #1
	bl sub_803E13C
	ldr r2, _08040F74 @ =gDispIo
	movs r0, #0x21
	rsbs r0, r0, #0
	ldrb r1, [r2, #1]
	ands r0, r1
	movs r1, #0x41
	rsbs r1, r1, #0
	ands r0, r1
	movs r1, #0x7f
	ands r0, r1
	strb r0, [r2, #1]
	add sp, #0x18
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08040F38: .4byte gUnk_081CB3E0
_08040F3C: .4byte 0x06014800
_08040F40: .4byte gUnk_081CC680
_08040F44: .4byte 0x06016000
_08040F48: .4byte gUnk_081CBC70
_08040F4C: .4byte 0x06016800
_08040F50: .4byte gUnk_081CD9F8
_08040F54: .4byte 0x0203D908
_08040F58: .4byte 0x0203DA48
_08040F5C: .4byte 0x030045E6
_08040F60: .4byte gUnk_08C08348
_08040F64: .4byte gUnk_081DAEC8
_08040F68: .4byte gUnk_08C07F8C
_08040F6C: .4byte gUnk_081DAEBC
_08040F70: .4byte 0x000003CB
_08040F74: .4byte gDispIo

	thumb_func_start sub_8040F78
sub_8040F78: @ 0x08040F78
	push {r4, lr}
	sub sp, #4
	adds r4, r0, #0
	ldr r1, _08040FB0 @ =0x00002586
	mov r0, sp
	strh r1, [r0]
	ldr r0, _08040FB4 @ =gUnk_08C07E20
	movs r1, #0
	bl Proc_Start
	ldr r0, _08040FB8 @ =gUnk_08C07E48
	adds r1, r4, #0
	bl Proc_Start
	ldr r0, _08040FBC @ =gUnk_08C07DF8
	adds r1, r4, #0
	bl Proc_Start
	movs r1, #1
	rsbs r1, r1, #0
	mov r0, sp
	bl sub_803D594
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08040FB0: .4byte 0x00002586
_08040FB4: .4byte gUnk_08C07E20
_08040FB8: .4byte gUnk_08C07E48
_08040FBC: .4byte gUnk_08C07DF8

	thumb_func_start sub_8040FC0
sub_8040FC0: @ 0x08040FC0
	push {r4, r5, r6, lr}
	sub sp, #8
	adds r4, r0, #0
	movs r6, #0
	movs r1, #0
	ldr r5, [r4, #0x2c]
	ldr r0, _08041000 @ =0x0203DC0C
	str r1, [r0]
	mov r0, sp
	strb r1, [r0]
	bl sub_8040D4C
	ldr r0, _08041004 @ =gUnk_08C07DF8
	bl Proc_Find
	cmp r0, #0
	beq _0804100C
	ldr r0, _08041008 @ =gpKeySt
	ldr r1, [r0]
	movs r0, #2
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	bne _08040FF2
	b _080411D6
_08040FF2:
	movs r0, #1
	bl sub_803E248
	bl sub_8048300
	b _08041040
	.align 2, 0
_08041000: .4byte 0x0203DC0C
_08041004: .4byte gUnk_08C07DF8
_08041008: .4byte gpKeySt
_0804100C:
	bl sub_8048300
	ldr r2, _08041054 @ =gUnk_08C07DAC
	ldr r1, [r2]
	movs r0, #6
	ldrsb r0, [r1, r0]
	str r0, [r5, #0x34]
	movs r3, #0
	adds r1, #0x1a
	adds r5, r2, #0
_08041020:
	adds r0, r1, r3
	ldrb r0, [r0]
	cmp r0, #0x3c
	bls _0804102A
	adds r6, #1
_0804102A:
	adds r3, #1
	cmp r3, #3
	ble _08041020
	ldr r0, [r5]
	movs r1, #6
	ldrsb r1, [r0, r1]
	adds r0, #0xb
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #2
	bne _08041058
_08041040:
	bl sub_8040D1C
	bl sub_8040D40
	adds r0, r4, #0
	movs r1, #2
	bl Proc_Goto
	b _080411D6
	.align 2, 0
_08041054: .4byte gUnk_08C07DAC
_08041058:
	bl sub_803D214
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0804106E
	ldr r0, [r5]
	ldrb r1, [r0, #0x1e]
	cmp r1, #0x3c
	bhi _0804106E
	cmp r6, #0
	beq _08041098
_0804106E:
	bl sub_8040D1C
	bl sub_8040D40
	adds r0, r4, #0
	bl sub_8040F78
	movs r0, #0
	str r0, [r4, #0x30]
	ldr r0, _08041094 @ =0x000003CB
	movs r1, #1
	bl sub_803E13C
	movs r0, #0xc0
	movs r1, #0x10
	adds r2, r4, #0
	bl sub_80482D0
	b _080411D6
	.align 2, 0
_08041094: .4byte 0x000003CB
_08041098:
	ldrb r0, [r0, #6]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne _0804112C
	bl sub_803D298
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne _0804112C
	ldr r0, [r4, #0x30]
	cmp r0, #2
	beq _080410C0
	movs r0, #2
	str r0, [r4, #0x30]
	ldr r0, _0804111C @ =0x000003CD
	movs r1, #1
	bl sub_803E13C
_080410C0:
	ldr r0, _08041120 @ =gpKeySt
	ldr r1, [r0]
	movs r0, #8
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _08041140
	ldr r0, [r5]
	movs r2, #0
	movs r1, #6
	strh r1, [r0, #4]
	strb r2, [r0, #0x1e]
	movs r3, #0
	adds r2, r5, #0
	movs r1, #0
_080410DE:
	ldr r0, [r2]
	adds r0, #0x1a
	adds r0, r0, r3
	strb r1, [r0]
	adds r3, #1
	cmp r3, #3
	ble _080410DE
	movs r0, #2
	bl sub_803E248
	bl sub_803D174
	ldr r2, _08041124 @ =gUnk_08C07DAC
	ldr r1, [r2]
	strb r0, [r1, #7]
	ldr r0, _08041128 @ =0x0203D908
	ldr r1, [r2]
	ldrb r1, [r1, #7]
	adds r0, #0xa0
	strb r1, [r0]
	bl sub_803DB24
	mov r1, sp
	movs r0, #0x18
	strb r0, [r1]
	mov r0, sp
	movs r1, #4
	bl sub_803D724
	str r0, [r4, #0x34]
	b _0804119E
	.align 2, 0
_0804111C: .4byte 0x000003CD
_08041120: .4byte gpKeySt
_08041124: .4byte gUnk_08C07DAC
_08041128: .4byte 0x0203D908
_0804112C:
	ldr r0, [r4, #0x30]
	cmp r0, #1
	beq _08041140
	movs r0, #1
	str r0, [r4, #0x30]
	movs r0, #0xf3
	lsls r0, r0, #2
	movs r1, #1
	bl sub_803E13C
_08041140:
	ldr r5, _080411A8 @ =gUnk_08C07DAC
	ldr r1, [r5]
	movs r0, #6
	ldrsb r0, [r1, r0]
	cmp r0, #0
	beq _080411B0
	ldrb r0, [r1, #6]
	bl sub_803D1CC
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080411B0
	add r1, sp, #4
	mov r0, sp
	movs r2, #0
	bl sub_803D7CC
	lsls r0, r0, #0x10
	cmp r0, #0
	beq _080411B0
	ldr r0, [r5]
	movs r2, #0
	movs r1, #6
	strh r1, [r0, #4]
	strb r2, [r0, #0x1e]
	movs r3, #0
	adds r2, r5, #0
	movs r1, #0
_08041178:
	ldr r0, [r2]
	adds r0, #0x1a
	adds r0, r0, r3
	strb r1, [r0]
	adds r3, #1
	cmp r3, #3
	ble _08041178
	bl sub_803D174
	ldr r2, _080411A8 @ =gUnk_08C07DAC
	ldr r1, [r2]
	strb r0, [r1, #7]
	ldr r0, _080411AC @ =0x0203D908
	ldr r1, [r2]
	ldrb r1, [r1, #7]
	adds r0, #0xa0
	strb r1, [r0]
	bl sub_803DB24
_0804119E:
	adds r0, r4, #0
	bl Proc_Break
	b _080411D6
	.align 2, 0
_080411A8: .4byte gUnk_08C07DAC
_080411AC: .4byte 0x0203D908
_080411B0:
	bl GetGameTime
	movs r1, #0x26
	bl __umodsi3
	cmp r0, #0
	bne _080411D6
	ldr r0, _080411E0 @ =0x030045E0
	movs r1, #0xcc
	strb r1, [r0]
	ldr r1, _080411E4 @ =gUnk_08C07DAC
	ldr r2, [r1]
	ldrb r1, [r2, #6]
	strb r1, [r0, #1]
	ldrb r1, [r2]
	strh r1, [r0, #2]
	movs r1, #0x16
	bl sub_803D2E4
_080411D6:
	add sp, #8
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080411E0: .4byte 0x030045E0
_080411E4: .4byte gUnk_08C07DAC

	thumb_func_start sub_80411E8
sub_80411E8: @ 0x080411E8
	push {r4, lr}
	adds r4, r0, #0
	bl sub_8040D4C
	ldr r1, _08041240 @ =0x0203DC0C
	ldr r0, [r1]
	adds r3, r0, #1
	str r3, [r1]
	ldr r0, _08041244 @ =0x0203D908
	adds r0, #0xa0
	ldr r1, _08041248 @ =gUnk_08C07DAC
	ldr r2, [r1]
	ldrb r0, [r0]
	ldrb r1, [r2, #7]
	cmp r0, r1
	bne _08041210
	movs r0, #0x96
	lsls r0, r0, #2
	cmp r3, r0
	ble _08041250
_08041210:
	bl sub_8040D1C
	bl sub_8040D40
	adds r0, r4, #0
	bl sub_8040F78
	movs r0, #0
	str r0, [r4, #0x30]
	ldr r0, _0804124C @ =0x000003CB
	movs r1, #1
	bl sub_803E13C
	movs r0, #0xc0
	movs r1, #0x10
	adds r2, r4, #0
	bl sub_80482D0
	adds r0, r4, #0
	movs r1, #3
	bl Proc_Goto
	b _08041274
	.align 2, 0
_08041240: .4byte 0x0203DC0C
_08041244: .4byte 0x0203D908
_08041248: .4byte gUnk_08C07DAC
_0804124C: .4byte 0x000003CB
_08041250:
	movs r0, #6
	ldrsb r0, [r2, r0]
	cmp r0, #0
	bne _0804127C
	ldr r1, [r4, #0x34]
	movs r0, #0x8c
	muls r0, r1, r0
	adds r0, r2, r0
	movs r1, #0x9a
	lsls r1, r1, #1
	adds r0, r0, r1
	ldrb r1, [r2, #9]
	ldrb r0, [r0]
	ands r1, r0
	adds r0, r1, #0
	ldrb r2, [r2, #9]
	cmp r0, r2
	bne _08041282
_08041274:
	adds r0, r4, #0
	bl Proc_Break
	b _08041282
_0804127C:
	adds r0, r4, #0
	bl Proc_Break
_08041282:
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_8041288
sub_8041288: @ 0x08041288
	push {r4, r5, r6, r7, lr}
	sub sp, #0x10
	adds r7, r0, #0
	movs r0, #0xf3
	lsls r0, r0, #2
	movs r1, #1
	bl sub_803E13C
	ldr r0, _08041320 @ =gUnk_08C07DAC
	ldr r0, [r0]
	ldrb r0, [r0, #6]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne _0804130A
	bl GetGameTime
	ldr r4, _08041324 @ =0x0203D908
	adds r5, r4, #0
	adds r5, #0xa0
	ldrb r1, [r5]
	bl __umodsi3
	adds r6, r7, #0
	adds r6, #0x3b
	strb r0, [r6]
	bl RandNextB
	movs r1, #3
	ands r1, r0
	adds r1, #4
	ldrb r5, [r5]
	adds r3, r5, #0
	muls r3, r1, r3
	ldrb r0, [r6]
	adds r3, r0, r3
	adds r0, r7, #0
	adds r0, #0x39
	strb r3, [r0]
	mov r2, sp
	adds r4, #0xec
	ldrb r1, [r4]
	lsls r0, r1, #0x1f
	lsrs r0, r0, #0x1f
	strb r0, [r2]
	lsls r0, r1, #0x1d
	lsrs r0, r0, #0x1f
	strb r0, [r2, #1]
	mov r0, sp
	lsls r1, r1, #0x1e
	lsrs r1, r1, #0x1f
	strb r1, [r0, #2]
	mov r1, sp
	ldrb r0, [r6]
	strb r0, [r1, #3]
	mov r0, sp
	strb r3, [r0, #4]
	adds r0, #6
	bl RandGetSt
	mov r0, sp
	movs r1, #0x10
	bl sub_803D724
	str r0, [r7, #0x34]
_0804130A:
	adds r0, r7, #0
	adds r0, #0x3a
	movs r1, #0
	strb r1, [r0]
	subs r0, #2
	strb r1, [r0]
	add sp, #0x10
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08041320: .4byte gUnk_08C07DAC
_08041324: .4byte 0x0203D908

	thumb_func_start sub_8041328
sub_8041328: @ 0x08041328
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	adds r5, r0, #0
	ldr r7, [r5, #0x2c]
	ldr r0, _08041364 @ =gUnk_08C07DAC
	ldr r2, [r0]
	movs r4, #6
	ldrsb r4, [r2, r4]
	cmp r4, #0
	bne _0804136C
	ldr r1, [r5, #0x34]
	movs r0, #0x8c
	muls r0, r1, r0
	adds r0, r2, r0
	movs r1, #0x9a
	lsls r1, r1, #1
	adds r0, r0, r1
	ldrb r0, [r0]
	ldrb r2, [r2, #9]
	cmp r0, r2
	bne _080413EC
	ldr r0, _08041368 @ =0x000003D1
	movs r1, #1
	bl sub_803E13C
	str r4, [r7, #0x38]
	adds r0, r5, #0
	bl Proc_Break
	b _080413EC
	.align 2, 0
_08041364: .4byte gUnk_08C07DAC
_08041368: .4byte 0x000003D1
_0804136C:
	bl GetGameTime
	movs r1, #0x26
	bl __umodsi3
	adds r6, r0, #0
	cmp r6, #0
	bne _080413EC
	add r1, sp, #0x10
	mov r0, sp
	movs r2, #0
	bl sub_803D7CC
	lsls r0, r0, #0x10
	cmp r0, #0
	beq _080413EC
	ldr r4, _080413F4 @ =0x0203D908
	mov r0, sp
	adds r4, #0xec
	movs r3, #1
	ldrb r1, [r0]
	ands r1, r3
	movs r0, #2
	rsbs r0, r0, #0
	ldrb r2, [r4]
	ands r0, r2
	orrs r0, r1
	mov r1, sp
	ldrb r1, [r1, #1]
	ands r1, r3
	lsls r1, r1, #2
	movs r2, #5
	rsbs r2, r2, #0
	ands r0, r2
	orrs r0, r1
	mov r1, sp
	ldrb r1, [r1, #2]
	ands r1, r3
	lsls r1, r1, #1
	adds r2, #2
	ands r0, r2
	orrs r0, r1
	strb r0, [r4]
	mov r0, sp
	ldrb r0, [r0, #3]
	adds r1, r5, #0
	adds r1, #0x3b
	strb r0, [r1]
	mov r0, sp
	ldrb r0, [r0, #4]
	subs r1, #2
	strb r0, [r1]
	mov r0, sp
	adds r0, #6
	bl RandSetSt
	ldr r0, _080413F8 @ =0x000003D1
	movs r1, #1
	bl sub_803E13C
	str r6, [r7, #0x38]
	adds r0, r5, #0
	bl Proc_Break
_080413EC:
	add sp, #0x14
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080413F4: .4byte 0x0203D908
_080413F8: .4byte 0x000003D1

	thumb_func_start sub_80413FC
sub_80413FC: @ 0x080413FC
	push {r4, r5, r6, r7, lr}
	adds r6, r0, #0
	ldr r7, [r6, #0x2c]
	adds r1, r6, #0
	adds r1, #0x38
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x10
	bls _080414A0
	movs r0, #0
	strb r0, [r1]
	adds r4, r6, #0
	adds r4, #0x3a
	ldrb r0, [r4]
	adds r0, #1
	strb r0, [r4]
	ldr r1, _08041478 @ =0x0203D908
	adds r1, #0xa0
	ldrb r0, [r4]
	ldrb r1, [r1]
	bl __umodsi3
	strb r0, [r4]
	adds r5, r6, #0
	adds r5, #0x39
	ldrb r0, [r5]
	subs r0, #1
	strb r0, [r5]
	ldrb r0, [r4]
	str r0, [r7, #0x38]
	ldr r0, _0804147C @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08041450
	movs r0, #0x7d
	bl m4aSongNumStart
_08041450:
	ldrb r0, [r5]
	cmp r0, #0
	bne _080414A0
	adds r0, r6, #0
	adds r0, #0x3b
	ldr r1, _08041480 @ =gUnk_08C07DAC
	ldr r1, [r1]
	ldrb r2, [r0]
	adds r4, r0, #0
	ldrb r0, [r4]
	ldrb r1, [r1, #6]
	cmp r0, r1
	beq _08041488
	ldr r1, _08041484 @ =0x000003D3
	adds r0, r2, r1
	movs r1, #1
	bl sub_803E13C
	b _08041490
	.align 2, 0
_08041478: .4byte 0x0203D908
_0804147C: .4byte gPlaySt
_08041480: .4byte gUnk_08C07DAC
_08041484: .4byte 0x000003D3
_08041488:
	ldr r0, _080414A8 @ =0x000003D2
	movs r1, #1
	bl sub_803E13C
_08041490:
	ldrb r0, [r4]
	str r0, [r7, #0x38]
	ldr r1, _080414AC @ =0x0203DC74
	ldrb r0, [r4]
	strb r0, [r1]
	adds r0, r6, #0
	bl Proc_Break
_080414A0:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080414A8: .4byte 0x000003D2
_080414AC: .4byte 0x0203DC74

	thumb_func_start sub_80414B0
sub_80414B0: @ 0x080414B0
	push {lr}
	ldr r0, _080414C8 @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080414C4
	movs r0, #0x7e
	bl m4aSongNumStart
_080414C4:
	pop {r0}
	bx r0
	.align 2, 0
_080414C8: .4byte gPlaySt

	thumb_func_start sub_80414CC
sub_80414CC: @ 0x080414CC
	push {r4, r5, lr}
	adds r5, r0, #0
	movs r4, #0
	strb r4, [r5, #9]
	movs r1, #0
	bl SetUnitStatus
	strb r4, [r5, #0x1b]
	ldr r1, _080414F4 @ =0x0203D908
	adds r1, #0xec
	movs r0, #4
	ldrb r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _080414F8
	adds r0, r5, #0
	bl sub_803E1F0
	b _080414FE
	.align 2, 0
_080414F4: .4byte 0x0203D908
_080414F8:
	adds r0, r5, #0
	bl sub_80495F4
_080414FE:
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start sub_8041504
sub_8041504: @ 0x08041504
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	mov sb, r0
	ldr r0, _080415C0 @ =gUnk_08C07DAC
	ldr r0, [r0]
	ldrb r0, [r0, #6]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r0, r0, #6
	adds r0, #1
	mov r8, r0
	ldr r1, _080415C4 @ =0x0203DC0C
	movs r0, #0
	str r0, [r1]
	bl InitUnits
	ldr r0, _080415C8 @ =0x0203D908
	ldrb r0, [r0, #3]
	ldr r4, _080415CC @ =gUnk_08C08368
	ldr r1, [r4]
	bl sub_80A25A4
	movs r6, #0
	ldr r0, _080415D0 @ =0x0203DC98
	mov sl, r0
	movs r7, #0x10
_0804153E:
	mov r1, r8
	adds r4, r1, r6
	adds r0, r4, #0
	bl GetUnit
	adds r5, r0, #0
	bl ClearUnit
	ldr r1, _080415CC @ =gUnk_08C08368
	ldr r0, [r1]
	adds r0, r0, r7
	adds r1, r5, #0
	bl LoadSavedUnit
	adds r0, r5, #0
	bl sub_80414CC
	strb r4, [r5, #0xb]
	cmp r6, #0
	bne _0804157C
	adds r0, r5, #0
	bl GetUnitMiniPortraitId
	ldr r1, _080415C0 @ =gUnk_08C07DAC
	ldr r1, [r1]
	ldrb r1, [r1, #6]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	lsls r1, r1, #1
	add r1, sl
	strh r0, [r1]
_0804157C:
	adds r7, #0x24
	adds r6, #1
	cmp r6, #4
	ble _0804153E
	ldr r2, _080415C0 @ =gUnk_08C07DAC
	mov r3, sb
	adds r3, #0x64
	mov r4, sb
	adds r4, #0x4c
	ldr r0, _080415C8 @ =0x0203D908
	movs r1, #0
	movs r6, #3
	adds r0, #0x9f
_08041596:
	strb r1, [r0]
	subs r0, #1
	subs r6, #1
	cmp r6, #0
	bge _08041596
	ldr r2, [r2]
	movs r1, #6
	ldrsb r1, [r2, r1]
	movs r0, #1
	lsls r0, r1
	movs r1, #0
	strb r0, [r2, #0xa]
	strh r1, [r3]
	strh r1, [r4]
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080415C0: .4byte gUnk_08C07DAC
_080415C4: .4byte 0x0203DC0C
_080415C8: .4byte 0x0203D908
_080415CC: .4byte gUnk_08C08368
_080415D0: .4byte 0x0203DC98

	thumb_func_start sub_80415D4
sub_80415D4: @ 0x080415D4
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x28
	mov r8, r0
	movs r0, #0
	mov sl, r0
	mov r0, r8
	adds r0, #0x4c
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	bne _08041604
	ldr r0, _08041740 @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08041604
	movs r0, #0x7c
	bl m4aSongNumStart
_08041604:
	mov r1, r8
	adds r1, #0x4c
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x17
	ble _0804161A
	movs r0, #0
	strh r0, [r1]
_0804161A:
	mov r4, r8
	adds r4, #0x64
	movs r3, #0
	ldrsh r0, [r4, r3]
	cmp r0, #4
	bgt _0804165A
	ldr r2, _08041744 @ =gUnk_08C08368
	lsls r1, r0, #3
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, #0x10
	ldr r0, [r2]
	adds r0, r0, r1
	movs r1, #0x28
	bl sub_803D724
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r3, r8
	str r0, [r3, #0x58]
	ldrh r2, [r4]
	adds r2, #1
	strh r2, [r4]
	ldr r1, _08041748 @ =0x0203D908
	ldr r0, _0804174C @ =gUnk_08C07DAC
	ldr r0, [r0]
	ldrb r0, [r0, #6]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r1, #0x9c
	adds r0, r0, r1
	strb r2, [r0]
_0804165A:
	bl GetGameTime
	movs r1, #0x26
	bl __umodsi3
	cmp r0, #0
	bne _0804172E
	add r6, sp, #0x24
	mov r0, sp
	adds r1, r6, #0
	movs r2, #0
	bl sub_803D7CC
	lsls r0, r0, #0x10
	cmp r0, #0
	beq _080416EA
	ldrb r0, [r6]
	lsls r4, r0, #6
	adds r4, #1
	ldr r1, _08041748 @ =0x0203D908
	mov sb, r1
	mov r7, sb
	adds r7, #0x9c
	adds r0, r0, r7
	ldrb r0, [r0]
	adds r0, r0, r4
	bl GetUnit
	adds r5, r0, #0
	bl ClearUnit
	mov r0, sp
	adds r1, r5, #0
	bl LoadSavedUnit
	adds r0, r5, #0
	bl sub_80414CC
	ldrb r3, [r6]
	adds r0, r3, r7
	ldrb r0, [r0]
	adds r4, r0, r4
	strb r4, [r5, #0xb]
	ldrb r1, [r6]
	adds r0, r1, r7
	ldrb r0, [r0]
	cmp r0, #0
	bne _080416CC
	adds r0, r5, #0
	bl GetUnitMiniPortraitId
	ldr r1, _08041750 @ =0x0203DC74
	ldrb r3, [r6]
	lsls r2, r3, #1
	adds r1, #0x24
	adds r2, r2, r1
	strh r0, [r2]
_080416CC:
	mov r1, sb
	adds r1, #0xec
	movs r0, #1
	ldrb r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _080416E0
	movs r0, #0x80
	lsls r0, r0, #2
	str r0, [r5, #0xc]
_080416E0:
	ldrb r6, [r6]
	adds r1, r6, r7
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
_080416EA:
	movs r4, #0
	ldr r5, _08041754 @ =0x0203D9A4
_080416EE:
	lsls r0, r4, #0x18
	lsrs r0, r0, #0x18
	bl sub_803D1CC
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0804170E
	adds r0, r4, r5
	ldrb r0, [r0]
	cmp r0, #4
	bhi _0804170E
	mov r0, sl
	adds r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov sl, r0
_0804170E:
	adds r4, #1
	cmp r4, #3
	ble _080416EE
	mov r0, sl
	cmp r0, #0
	bne _0804172E
	ldr r0, _0804174C @ =gUnk_08C07DAC
	ldr r2, [r0]
	movs r1, #6
	ldrsb r1, [r2, r1]
	movs r0, #1
	lsls r0, r1
	strb r0, [r2, #0xa]
	mov r0, r8
	bl Proc_Break
_0804172E:
	add sp, #0x28
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08041740: .4byte gPlaySt
_08041744: .4byte gUnk_08C08368
_08041748: .4byte 0x0203D908
_0804174C: .4byte gUnk_08C07DAC
_08041750: .4byte 0x0203DC74
_08041754: .4byte 0x0203D9A4

	thumb_func_start sub_8041758
sub_8041758: @ 0x08041758
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r0, #0x4c
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	bne _08041778
	ldr r0, _080417EC @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08041778
	movs r0, #0x7c
	bl m4aSongNumStart
_08041778:
	adds r1, r5, #0
	adds r1, #0x4c
	ldrh r0, [r1]
	adds r0, #1
	movs r6, #0
	strh r0, [r1]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x17
	ble _0804178E
	strh r6, [r1]
_0804178E:
	ldr r0, _080417F0 @ =0x0203DC0C
	ldr r1, [r0]
	adds r1, #1
	str r1, [r0]
	movs r0, #0x96
	lsls r0, r0, #2
	cmp r1, r0
	ble _080417A2
	bl sub_80871AC
_080417A2:
	ldr r0, _080417F4 @ =0x030046BC
	movs r1, #0xc9
	strb r1, [r0]
	ldr r4, _080417F8 @ =gUnk_08C07DAC
	ldr r1, [r4]
	ldrb r1, [r1, #6]
	strb r1, [r0, #1]
	strh r6, [r0, #2]
	movs r1, #4
	bl sub_803D2E4
	ldr r4, [r4]
	ldr r1, [r5, #0x58]
	movs r0, #0x8c
	muls r0, r1, r0
	adds r0, r4, r0
	movs r1, #0x9a
	lsls r1, r1, #1
	adds r0, r0, r1
	ldrb r1, [r4, #9]
	ldrb r2, [r0]
	cmp r2, r1
	bne _080417E4
	ldrb r0, [r4, #0xa]
	ands r0, r1
	cmp r0, r2
	bne _080417E4
	ldr r0, _080417FC @ =gUnk_08C07E80
	bl sub_8004748
	adds r0, r5, #0
	bl Proc_Break
_080417E4:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080417EC: .4byte gPlaySt
_080417F0: .4byte 0x0203DC0C
_080417F4: .4byte 0x030046BC
_080417F8: .4byte gUnk_08C07DAC
_080417FC: .4byte gUnk_08C07E80

	thumb_func_start sub_8041800
sub_8041800: @ 0x08041800
	push {r4, r5, lr}
	adds r5, r0, #0
	bl sub_803E080
	bl sub_8048320
	bl sub_804989C
	movs r0, #3
	bl EndFaceById
	ldr r4, _08041854 @ =0x0203D95C
	adds r0, r4, #0
	bl ClearText
	adds r0, r4, #0
	movs r1, #0
	bl Text_SetColor
	ldr r1, _08041858 @ =gUnk_081DADEC
	adds r0, r4, #0
	bl Text_DrawString
	ldr r1, _0804185C @ =gBg2Tm + 0x312
	adds r0, r4, #0
	bl PutText
	ldr r0, _08041860 @ =gUnk_08C07E80
	adds r1, r5, #0
	bl Proc_Start
	movs r0, #0
	movs r1, #0
	bl sub_80483C0
	movs r0, #0xf
	bl EnableBgSync
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08041854: .4byte 0x0203D95C
_08041858: .4byte gUnk_081DADEC
_0804185C: .4byte gBg2Tm + 0x312
_08041860: .4byte gUnk_08C07E80

	thumb_func_start sub_8041864
sub_8041864: @ 0x08041864
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #0xc
	mov sb, r0
	bl sub_803E080
	bl sub_8048320
	ldr r4, _08041980 @ =gUnk_081CC2AC
	movs r0, #1
	bl GetBgChrOffset
	adds r1, r0, #0
	ldr r0, _08041984 @ =0x06000C00
	adds r1, r1, r0
	adds r0, r4, #0
	bl Decompress
	ldr r0, _08041988 @ =gUnk_081CD818
	movs r1, #0xc0
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r0, _0804198C @ =gUnk_081CB3E0
	ldr r1, _08041990 @ =0x06014800
	bl Decompress
	ldr r0, _08041994 @ =gUnk_081CD798
	movs r1, #0x98
	lsls r1, r1, #2
	movs r2, #0x80
	bl ApplyPaletteExt
	movs r0, #0
	bl sub_8048424
	ldr r0, _08041998 @ =0x0203DA48
	bl SetTextFont
	bl ResetTextFont
	bl sub_803E1A0
	add r0, sp, #8
	bl sub_8042698
	movs r0, #1
	movs r1, #0xfe
	movs r2, #0
	bl SetBgOffset
	movs r5, #0
	movs r7, #0xc0
	lsls r7, r7, #1
	ldr r6, _0804199C @ =gUnk_081DAFC4
_080418D6:
	lsls r4, r5, #3
	ldr r1, _080419A0 @ =0x0203D914
	mov r8, r1
	add r4, r8
	adds r0, r4, #0
	bl ClearText
	adds r0, r4, #0
	movs r1, #0
	bl Text_SetColor
	ldr r1, [r6]
	adds r0, r4, #0
	bl Text_DrawString
	ldr r1, _080419A4 @ =gBg0Tm + 0xc
	adds r1, r7, r1
	adds r0, r4, #0
	bl PutText
	mov r0, sp
	adds r0, r0, r5
	adds r0, #8
	ldrb r1, [r0]
	adds r0, r5, #0
	bl sub_80426F8
	adds r7, #0xc0
	adds r6, #0x14
	adds r5, #1
	cmp r5, #2
	ble _080418D6
	ldr r5, _0804199C @ =gUnk_081DAFC4
	ldr r0, [r5, #0x18]
	lsls r0, r0, #1
	ldr r4, _080419A8 @ =gBg1Tm + 0x23c
	adds r0, r0, r4
	movs r1, #0
	bl sub_8041EA8
	ldr r0, [r5, #0x1c]
	lsls r0, r0, #1
	adds r0, r0, r4
	movs r1, #1
	bl sub_8041EA8
	ldr r0, _080419AC @ =gUnk_081DAEC8
	mov r4, r8
	subs r4, #0xc
	ldrb r2, [r4]
	adds r0, r2, r0
	ldrb r1, [r0]
	mov r0, sb
	bl sub_804856C
	ldr r0, _080419B0 @ =gUnk_08C07F8C
	ldrb r3, [r4]
	lsls r1, r3, #2
	adds r0, r1, r0
	ldr r0, [r0]
	ldr r2, _080419B4 @ =gUnk_081DAEBC
	adds r1, r1, r2
	ldr r1, [r1]
	str r3, [sp]
	mov r2, sb
	str r2, [sp, #4]
	movs r2, #0
	movs r3, #8
	bl sub_8048670
	ldr r0, _080419B8 @ =0x000003CE
	movs r1, #1
	bl sub_803E13C
	movs r0, #0xf
	bl EnableBgSync
	add sp, #0xc
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08041980: .4byte gUnk_081CC2AC
_08041984: .4byte 0x06000C00
_08041988: .4byte gUnk_081CD818
_0804198C: .4byte gUnk_081CB3E0
_08041990: .4byte 0x06014800
_08041994: .4byte gUnk_081CD798
_08041998: .4byte 0x0203DA48
_0804199C: .4byte gUnk_081DAFC4
_080419A0: .4byte 0x0203D914
_080419A4: .4byte gBg0Tm + 0xc
_080419A8: .4byte gBg1Tm + 0x23c
_080419AC: .4byte gUnk_081DAEC8
_080419B0: .4byte gUnk_08C07F8C
_080419B4: .4byte gUnk_081DAEBC
_080419B8: .4byte 0x000003CE

	thumb_func_start sub_80419BC
sub_80419BC: @ 0x080419BC
	push {lr}
	movs r0, #3
	bl sub_803D9B0
	pop {r0}
	bx r0

	thumb_func_start sub_80419C8
sub_80419C8: @ 0x080419C8
	push {lr}
	movs r0, #0
	bl sub_803D9B0
	pop {r0}
	bx r0

	thumb_func_start sub_80419D4
sub_80419D4: @ 0x080419D4
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x74
	adds r7, r0, #0
	movs r0, #0
	str r0, [sp, #0x5c]
	add r5, sp, #0x50
	ldr r1, _08041AB0 @ =gUnk_081DB000
	adds r0, r5, #0
	movs r2, #6
	bl memcpy
	bl sub_803E080
	bl sub_8048320
	ldr r0, _08041AB4 @ =gUnk_081CB3E0
	ldr r1, _08041AB8 @ =0x06014800
	bl Decompress
	movs r0, #0
	movs r1, #4
	bl sub_80483C0
	ldr r0, _08041ABC @ =0x0203DA48
	bl SetTextFont
	bl InitSystemTextFont
	bl ResetTextFont
	movs r0, #0xc0
	movs r1, #0x10
	adds r2, r7, #0
	bl sub_80482D0
	ldr r4, _08041AC0 @ =0x0203DBF0
	adds r0, r4, #0
	movs r1, #0x18
	bl InitText
	adds r4, #8
	adds r0, r4, #0
	movs r1, #0x18
	bl InitText
	ldr r0, _08041AC4 @ =0x000003CF
	movs r1, #0
	bl sub_803E13C
	movs r0, #0xf4
	lsls r0, r0, #2
	movs r1, #1
	bl sub_803E13C
	movs r0, #1
	rsbs r0, r0, #0
	str r0, [r7, #0x4c]
	movs r1, #2
	mov sb, r1
	mov r2, sp
	adds r2, #0x58
	str r2, [sp, #0x60]
	movs r6, #8
	mov r4, sp
	adds r4, #0x5a
	adds r5, r7, #0
	adds r5, #0x40
_08041A62:
	movs r0, #0
	strb r0, [r4]
	mov r0, sb
	bl IsSaveValid
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08041B2E
	mov r0, sb
	add r1, sp, #8
	bl ReadGameSavePlaySt
	add r0, sp, #8
	bl sub_8082F30
	adds r2, r7, #0
	adds r2, #0x2c
	adds r1, r2, r6
	str r0, [r1]
	add r1, sp, #8
	movs r0, #0x40
	ldrb r1, [r1, #0x14]
	ands r0, r1
	mov sl, r2
	cmp r0, #0
	beq _08041A9E
	movs r0, #4
	ldrb r1, [r4]
	orrs r0, r1
	strb r0, [r4]
_08041A9E:
	add r0, sp, #8
	ldrb r0, [r0, #0x1b]
	cmp r0, #2
	beq _08041AD2
	cmp r0, #2
	bgt _08041AC8
	cmp r0, #1
	beq _08041ACE
	b _08041AE2
	.align 2, 0
_08041AB0: .4byte gUnk_081DB000
_08041AB4: .4byte gUnk_081CB3E0
_08041AB8: .4byte 0x06014800
_08041ABC: .4byte 0x0203DA48
_08041AC0: .4byte 0x0203DBF0
_08041AC4: .4byte 0x000003CF
_08041AC8:
	cmp r0, #3
	beq _08041ADA
	b _08041AE2
_08041ACE:
	movs r0, #0x10
	b _08041ADC
_08041AD2:
	movs r0, #0x20
	ldrb r1, [r4]
	orrs r0, r1
	b _08041AE0
_08041ADA:
	movs r0, #0x40
_08041ADC:
	ldrb r2, [r4]
	orrs r0, r2
_08041AE0:
	strb r0, [r4]
_08041AE2:
	add r0, sp, #8
	bl sub_80A1398
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08041AFE
	mov r1, sl
	adds r0, r1, r6
	ldr r0, [r0]
	str r0, [r5]
	movs r2, #0x38
	adds r2, r2, r7
	mov r8, r2
	b _08041B0A
_08041AFE:
	movs r0, #1
	rsbs r0, r0, #0
	str r0, [r5]
	movs r1, #0x38
	adds r1, r1, r7
	mov r8, r1
_08041B0A:
	mov r2, r8
	adds r0, r2, r6
	ldr r0, [r0]
	movs r1, #1
	rsbs r1, r1, #0
	cmp r0, r1
	beq _08041B44
	ldr r2, [sp, #0x5c]
	cmp r2, #0
	bne _08041B28
	mov r0, sb
	str r0, [r7, #0x50]
	movs r1, #1
	str r1, [sp, #0x5c]
	b _08041B44
_08041B28:
	mov r2, sb
	str r2, [r7, #0x4c]
	b _08041B44
_08041B2E:
	adds r1, r7, #0
	adds r1, #0x2c
	adds r0, r1, r6
	movs r2, #1
	rsbs r2, r2, #0
	str r2, [r5]
	str r2, [r0]
	mov sl, r1
	movs r0, #0x38
	adds r0, r0, r7
	mov r8, r0
_08041B44:
	subs r5, #4
	subs r6, #4
	subs r4, #1
	movs r1, #1
	rsbs r1, r1, #0
	add sb, r1
	mov r2, sb
	cmp r2, #0
	bge _08041A62
	adds r0, r1, #0
	ldr r1, [r7, #0x4c]
	cmp r1, r0
	bne _08041B66
	ldr r0, [r7, #0x50]
	str r0, [r7, #0x4c]
	str r0, [r7, #0x48]
	b _08041B68
_08041B66:
	str r1, [r7, #0x48]
_08041B68:
	movs r0, #1
	movs r1, #4
	movs r2, #0
	bl SetBgOffset
	movs r0, #0xd0
	lsls r0, r0, #1
	bl sub_8082E6C
	movs r0, #0
	mov sb, r0
	movs r1, #0xa0
	lsls r1, r1, #1
	str r1, [sp, #0x64]
	mov r2, sl
	str r2, [sp, #0x68]
	movs r0, #0x80
	lsls r0, r0, #1
	str r0, [sp, #0x6c]
	ldr r6, [sp, #0x60]
	movs r1, #0
	str r1, [sp, #0x70]
	movs r2, #0x88
	lsls r2, r2, #7
	mov sl, r2
_08041B9A:
	ldr r0, [sp, #0x70]
	add r0, r8
	ldr r1, [r0]
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	bne _08041BB0
	movs r0, #2
	ldrb r1, [r6]
	orrs r0, r1
	strb r0, [r6]
_08041BB0:
	movs r0, #1
	ldrb r2, [r6]
	orrs r0, r2
	mov r4, sb
	adds r4, #4
	adds r1, r4, #0
	bl sub_8082DB8
	ldrb r0, [r6]
	mov r5, sb
	adds r5, #7
	adds r1, r5, #0
	bl sub_8082DB8
	ldr r0, _08041C64 @ =gBg1Tm + 0x4
	ldr r1, [sp, #0x6c]
	adds r0, r1, r0
	adds r1, r4, #0
	bl sub_8082EEC
	mov r2, sl
	lsls r0, r2, #0xf
	lsrs r0, r0, #0x14
	ldr r2, [sp, #0x68]
	ldm r2!, {r1}
	str r2, [sp, #0x68]
	bl sub_8082E2C
	ldr r0, _08041C68 @ =gBg0Tm + 0x6
	ldr r1, [sp, #0x64]
	adds r0, r1, r0
	adds r1, r5, #0
	bl sub_8082ECC
	ldr r2, [sp, #0x64]
	movs r0, #0x80
	lsls r0, r0, #1
	adds r2, r2, r0
	str r2, [sp, #0x64]
	ldr r1, [sp, #0x6c]
	adds r1, r1, r0
	str r1, [sp, #0x6c]
	adds r6, #1
	ldr r2, [sp, #0x70]
	adds r2, #4
	str r2, [sp, #0x70]
	movs r0, #0x80
	lsls r0, r0, #4
	add sl, r0
	movs r1, #1
	add sb, r1
	mov r2, sb
	cmp r2, #2
	ble _08041B9A
	ldr r2, _08041C6C @ =gDispIo
	movs r0, #0x21
	rsbs r0, r0, #0
	ldrb r1, [r2, #1]
	ands r0, r1
	movs r1, #0x41
	rsbs r1, r1, #0
	ands r0, r1
	movs r1, #0x7f
	ands r0, r1
	strb r0, [r2, #1]
	adds r0, r7, #0
	movs r1, #1
	bl sub_804856C
	ldr r0, _08041C70 @ =0x0203D908
	ldrb r0, [r0]
	str r0, [sp]
	str r7, [sp, #4]
	add r0, sp, #0x50
	movs r1, #6
	movs r2, #0
	movs r3, #8
	bl sub_8048670
	movs r0, #0xf
	bl EnableBgSync
	add sp, #0x74
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08041C64: .4byte gBg1Tm + 0x4
_08041C68: .4byte gBg0Tm + 0x6
_08041C6C: .4byte gDispIo
_08041C70: .4byte 0x0203D908

	thumb_func_start sub_8041C74
sub_8041C74: @ 0x08041C74
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	adds r5, r3, #0
	ldr r0, [sp, #0x14]
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	mov ip, r1
	lsls r2, r2, #0x18
	lsrs r6, r2, #0x18
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	ldr r1, _08041CFC @ =gpKeySt
	ldr r3, [r1]
	ldrh r2, [r3, #6]
	movs r0, #0x40
	ands r0, r2
	cmp r0, #0
	beq _08041CC2
	ldr r0, [r4]
	cmp r0, r6
	bgt _08041CA4
	ldrh r3, [r3, #8]
	cmp r2, r3
	bne _08041CC2
_08041CA4:
	subs r2, r7, #1
	movs r3, #1
	rsbs r3, r3, #0
_08041CAA:
	ldr r0, [r4]
	subs r0, #1
	str r0, [r4]
	cmp r0, #0
	bge _08041CB6
	str r2, [r4]
_08041CB6:
	ldr r0, [r4]
	lsls r0, r0, #2
	adds r0, r0, r5
	ldr r0, [r0]
	cmp r0, r3
	beq _08041CAA
_08041CC2:
	ldr r1, [r1]
	ldrh r2, [r1, #6]
	movs r0, #0x80
	ands r0, r2
	cmp r0, #0
	beq _08041CF6
	ldr r0, [r4]
	cmp r0, ip
	blt _08041CDA
	ldrh r1, [r1, #8]
	cmp r2, r1
	bne _08041CF6
_08041CDA:
	ldr r0, [r4]
	adds r0, #1
	str r0, [r4]
	adds r1, r7, #0
	bl __modsi3
	str r0, [r4]
	lsls r0, r0, #2
	adds r0, r0, r5
	ldr r1, [r0]
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	beq _08041CDA
_08041CF6:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08041CFC: .4byte gpKeySt

	thumb_func_start sub_8041D00
sub_8041D00: @ 0x08041D00
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r6, r0, #0
	ldr r5, [r6, #0x48]
	adds r0, #0x48
	ldr r1, [r6, #0x50]
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	ldr r2, [r6, #0x4c]
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	adds r3, r6, #0
	adds r3, #0x38
	movs r4, #3
	str r4, [sp]
	bl sub_8041C74
	ldr r1, [r6, #0x48]
	lsls r1, r1, #5
	adds r1, #0x28
	movs r0, #0x18
	bl DisplayUiHand
	ldr r0, [r6, #0x48]
	cmp r5, r0
	beq _08041D3A
	movs r0, #3
	bl sub_803E248
_08041D3A:
	ldr r4, _08041D78 @ =gpKeySt
	ldr r1, [r4]
	movs r0, #1
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _08041D54
	movs r0, #2
	bl sub_803E248
	adds r0, r6, #0
	bl Proc_Break
_08041D54:
	ldr r1, [r4]
	movs r0, #2
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _08041D6E
	movs r0, #1
	bl sub_803E248
	adds r0, r6, #0
	movs r1, #4
	bl Proc_Goto
_08041D6E:
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08041D78: .4byte gpKeySt

	thumb_func_start sub_8041D7C
sub_8041D7C: @ 0x08041D7C
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x48]
	bl ReadGameSave
	ldr r1, _08041DBC @ =gPlaySt
	movs r0, #0xdf
	ldrb r2, [r1, #0x14]
	ands r0, r2
	strb r0, [r1, #0x14]
	adds r1, #0x41
	movs r0, #0xd
	rsbs r0, r0, #0
	ldrb r2, [r1]
	ands r0, r2
	strb r0, [r1]
	ldr r1, _08041DC0 @ =0x0203D908
	ldr r0, [r4, #0x48]
	strb r0, [r1, #4]
	bl ApplyUnitSpritePalettes
	bl sub_80456C8
	movs r0, #1
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08041DBC: .4byte gPlaySt
_08041DC0: .4byte 0x0203D908

	thumb_func_start sub_8041DC4
sub_8041DC4: @ 0x08041DC4
	push {lr}
	adds r1, r0, #0
	ldr r0, _08041DDC @ =0x0203D908
	ldrb r0, [r0, #3]
	cmp r0, #0xff
	bne _08041DD8
	adds r0, r1, #0
	movs r1, #1
	bl Proc_Goto
_08041DD8:
	pop {r0}
	bx r0
	.align 2, 0
_08041DDC: .4byte 0x0203D908

	thumb_func_start sub_8041DE0
sub_8041DE0: @ 0x08041DE0
	push {lr}
	adds r1, r0, #0
	ldr r0, _08041DF8 @ =0x0203D908
	ldrb r0, [r0, #4]
	cmp r0, #0xff
	bne _08041DF4
	adds r0, r1, #0
	movs r1, #2
	bl Proc_Goto
_08041DF4:
	pop {r0}
	bx r0
	.align 2, 0
_08041DF8: .4byte 0x0203D908

	thumb_func_start sub_8041DFC
sub_8041DFC: @ 0x08041DFC
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08041E18 @ =gUnk_08D8C154
	bl Proc_Find
	cmp r0, #0
	bne _08041E10
	adds r0, r4, #0
	bl Proc_Break
_08041E10:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08041E18: .4byte gUnk_08D8C154

	thumb_func_start sub_8041E1C
sub_8041E1C: @ 0x08041E1C
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08041E54 @ =0x0203DC08
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _08041E4C
	bl sub_803E0D8
	bl sub_8048494
	bl sub_8048590
	bl sub_8048708
	bl sub_8048300
	bl sub_808F804
	adds r0, r4, #0
	movs r1, #5
	bl Proc_Goto
_08041E4C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08041E54: .4byte 0x0203DC08

	thumb_func_start sub_8041E58
sub_8041E58: @ 0x08041E58
	push {lr}
	movs r0, #1
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	pop {r0}
	bx r0

	thumb_func_start sub_8041E68
sub_8041E68: @ 0x08041E68
	adds r3, r0, #0
	lsls r0, r1, #1
	adds r0, r0, r1
	ldr r2, _08041EA4 @ =0x00004060
	adds r0, r0, r2
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	cmp r1, #2
	ble _08041E84
	movs r1, #0x80
	lsls r1, r1, #5
	adds r0, r2, r1
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
_08041E84:
	strh r2, [r3]
	adds r0, r2, #1
	strh r0, [r3, #2]
	adds r0, r2, #2
	strh r0, [r3, #4]
	adds r1, r3, #0
	adds r1, #0x40
	adds r0, #0x1e
	strh r0, [r1]
	adds r1, #2
	adds r0, #1
	strh r0, [r1]
	adds r1, #2
	adds r0, #1
	strh r0, [r1]
	bx lr
	.align 2, 0
_08041EA4: .4byte 0x00004060

	thumb_func_start sub_8041EA8
sub_8041EA8: @ 0x08041EA8
	push {r4, lr}
	lsls r1, r1, #0x12
	movs r2, #0xa0
	lsls r2, r2, #0x10
	adds r1, r1, r2
	lsrs r1, r1, #0x10
	movs r3, #0xc0
	lsls r3, r3, #7
	adds r2, r1, r3
	strh r2, [r0]
	ldr r4, _08041EDC @ =0x00006001
	adds r2, r1, r4
	strh r2, [r0, #2]
	adds r3, r0, #0
	adds r3, #0x40
	adds r4, #1
	adds r2, r1, r4
	strh r2, [r3]
	adds r0, #0x42
	ldr r2, _08041EE0 @ =0x00006003
	adds r1, r1, r2
	strh r1, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08041EDC: .4byte 0x00006001
_08041EE0: .4byte 0x00006003

	thumb_func_start sub_8041EE4
sub_8041EE4: @ 0x08041EE4
	push {r4, r5, r6, lr}
	mov r6, sb
	mov r5, r8
	push {r5, r6}
	adds r5, r0, #0
	mov sb, r1
	adds r6, r2, #0
	adds r4, r3, #0
	ldr r0, [sp, #0x18]
	lsls r6, r6, #0x18
	lsrs r6, r6, #0x18
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r8, r0
	adds r0, r5, #0
	movs r1, #8
	movs r2, #0
	mov r3, sb
	bl Text_InsertDrawString
	adds r0, r5, #0
	movs r1, #0x60
	movs r2, #2
	adds r3, r4, #0
	bl sub_803DE14
	ldr r3, _08041F64 @ =gUnk_081DABC8
	adds r0, r5, #0
	movs r1, #0x68
	movs r2, #0
	bl Text_InsertDrawString
	adds r0, r5, #0
	movs r1, #0x86
	movs r2, #2
	adds r3, r6, #0
	bl sub_803DE14
	ldr r3, _08041F68 @ =gUnk_081DB008
	adds r0, r5, #0
	movs r1, #0x8e
	movs r2, #0
	bl Text_InsertDrawString
	adds r0, r5, #0
	movs r1, #0x9c
	movs r2, #2
	mov r3, r8
	bl sub_803DE14
	ldr r3, _08041F6C @ =gUnk_081DB00C
	adds r0, r5, #0
	movs r1, #0xa4
	movs r2, #0
	bl Text_InsertDrawString
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08041F64: .4byte gUnk_081DABC8
_08041F68: .4byte gUnk_081DB008
_08041F6C: .4byte gUnk_081DB00C

	thumb_func_start sub_8041F70
sub_8041F70: @ 0x08041F70
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	movs r6, #0
	ldr r0, _08042004 @ =0x0203DB2C
	ldr r1, _08042008 @ =gBg1Tm + 0x4
	mov sl, r1
	subs r7, r0, #4
	movs r1, #0x24
	add r1, sl
	mov sb, r1
	mov r8, r0
_08041F8E:
	lsls r5, r6, #3
	ldr r0, _0804200C @ =0x0203D9F8
	adds r5, r5, r0
	adds r0, r5, #0
	bl ClearText
	ldrb r0, [r7]
	lsls r2, r0, #0x1e
	lsrs r2, r2, #6
	movs r1, #0x80
	lsls r1, r1, #0x11
	adds r2, r2, r1
	lsrs r2, r2, #0x18
	ldr r3, [r7]
	lsls r3, r3, #0xb
	lsrs r3, r3, #0x10
	lsls r0, r0, #0x1c
	lsrs r0, r0, #0x1e
	adds r0, #1
	str r0, [sp]
	adds r0, r5, #0
	mov r1, r8
	bl sub_8041EE4
	lsls r4, r6, #7
	mov r1, sl
	adds r0, r4, r1
	adds r1, r6, #0
	bl sub_8041E68
	mov r0, sl
	adds r0, #6
	adds r4, r4, r0
	adds r0, r5, #0
	adds r1, r4, #0
	bl PutText
	ldrb r0, [r7]
	lsls r1, r0, #0x1b
	lsrs r1, r1, #0x1f
	mov r0, sb
	bl sub_8041EA8
	adds r7, #0x14
	movs r1, #0x80
	add sb, r1
	movs r0, #0x14
	add r8, r0
	adds r6, #1
	cmp r6, #9
	ble _08041F8E
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08042004: .4byte 0x0203DB2C
_08042008: .4byte gBg1Tm + 0x4
_0804200C: .4byte 0x0203D9F8

	thumb_func_start sub_8042010
sub_8042010: @ 0x08042010
	push {r4, r5, r6, r7, lr}
	sub sp, #0x10
	adds r7, r0, #0
	ldr r1, _080421CC @ =gUnk_081DB00F
	add r0, sp, #8
	movs r2, #8
	bl memcpy
	bl sub_803E080
	bl sub_8048320
	ldr r4, _080421D0 @ =gUnk_081CC2AC
	movs r0, #1
	bl GetBgChrOffset
	adds r1, r0, #0
	ldr r0, _080421D4 @ =0x06000C00
	adds r1, r1, r0
	adds r0, r4, #0
	bl Decompress
	ldr r0, _080421D8 @ =gUnk_081CD858
	movs r1, #0x80
	movs r2, #0x40
	bl ApplyPaletteExt
	ldr r0, _080421DC @ =gUnk_081CD818
	movs r1, #0xc0
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r0, _080421E0 @ =gUnk_081CB3E0
	ldr r1, _080421E4 @ =0x06014800
	bl Decompress
	ldr r0, _080421E8 @ =gUnk_081CD798
	movs r1, #0x98
	lsls r1, r1, #2
	movs r2, #0x80
	bl ApplyPaletteExt
	movs r0, #0
	movs r1, #2
	bl sub_80483C0
	ldr r0, _080421EC @ =gBg2Tm + 0x102
	ldr r1, _080421F0 @ =gUnk_081CE034
	movs r2, #0x80
	lsls r2, r2, #5
	bl TmApplyTsa_thm
	ldr r0, _080421F4 @ =0x0203DA48
	bl SetTextFont
	bl InitSystemTextFont
	bl ResetTextFont
	movs r1, #0
	movs r0, #0xc8
	strh r0, [r7, #0x36]
	adds r0, r7, #0
	adds r0, #0x39
	strb r1, [r0]
	subs r0, #1
	strb r1, [r0]
	subs r0, #4
	strb r1, [r0]
	ldrh r2, [r7, #0x36]
	movs r0, #1
	movs r1, #0
	bl SetBgOffset
	ldr r5, _080421F8 @ =0x0203D9F8
	movs r4, #9
_080420A8:
	adds r0, r5, #0
	movs r1, #0x16
	bl InitText
	adds r5, #8
	subs r4, #1
	cmp r4, #0
	bge _080420A8
	ldr r4, _080421FC @ =0x0203DBF0
	adds r0, r4, #0
	movs r1, #0x18
	bl InitText
	adds r0, r4, #0
	adds r0, #8
	movs r1, #0x18
	bl InitText
	adds r0, r4, #0
	bl ClearText
	ldr r3, _08042200 @ =gUnk_081DB018
	adds r0, r4, #0
	movs r1, #0x10
	movs r2, #0
	bl Text_InsertDrawString
	ldr r3, _08042204 @ =gUnk_081DB024
	adds r0, r4, #0
	movs r1, #0x5e
	movs r2, #0
	bl Text_InsertDrawString
	ldr r3, _08042208 @ =gUnk_081DB02C
	adds r0, r4, #0
	movs r1, #0x84
	movs r2, #0
	bl Text_InsertDrawString
	ldr r3, _0804220C @ =gUnk_081DB034
	adds r0, r4, #0
	movs r1, #0x9c
	movs r2, #0
	bl Text_InsertDrawString
	ldr r1, _08042210 @ =gBg0Tm + 0x14a
	adds r0, r4, #0
	bl PutText
	ldr r0, _08042214 @ =0x000003C7
	movs r1, #1
	bl sub_803E13C
	ldr r0, _08042218 @ =0x0203DB28
	bl sub_80A28C0
	bl sub_8041F70
	ldr r1, _0804221C @ =gDispIo
	mov ip, r1
	movs r0, #0x20
	ldrb r2, [r1, #1]
	orrs r0, r2
	movs r1, #0x41
	rsbs r1, r1, #0
	ands r0, r1
	movs r1, #0x7f
	ands r0, r1
	mov r1, ip
	strb r0, [r1, #1]
	adds r1, #0x2d
	movs r0, #0
	strb r0, [r1]
	adds r1, #4
	movs r0, #0x38
	strb r0, [r1]
	subs r1, #5
	movs r0, #0xf0
	strb r0, [r1]
	adds r1, #4
	movs r0, #0x88
	strb r0, [r1]
	mov r5, ip
	adds r5, #0x34
	movs r1, #1
	ldrb r0, [r5]
	orrs r0, r1
	movs r2, #2
	orrs r0, r2
	movs r6, #4
	orrs r0, r6
	movs r4, #8
	orrs r0, r4
	movs r3, #0x10
	orrs r0, r3
	strb r0, [r5]
	mov r2, ip
	adds r2, #0x36
	ldrb r0, [r2]
	orrs r1, r0
	movs r0, #3
	rsbs r0, r0, #0
	ands r1, r0
	orrs r1, r6
	orrs r1, r4
	orrs r1, r3
	strb r1, [r2]
	ldrh r0, [r7, #0x36]
	adds r0, #0x38
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp]
	str r7, [sp, #4]
	movs r0, #0xd8
	movs r1, #0x38
	movs r2, #0xa
	movs r3, #5
	bl sub_80493CC
	adds r0, r7, #0
	movs r1, #5
	bl sub_804856C
	ldr r0, _08042220 @ =0x0203D908
	ldrb r0, [r0]
	str r0, [sp]
	str r7, [sp, #4]
	add r0, sp, #8
	movs r1, #8
	movs r2, #0
	movs r3, #8
	bl sub_8048670
	movs r0, #0xc0
	movs r1, #0x10
	adds r2, r7, #0
	bl sub_80482D0
	movs r0, #0xf
	bl EnableBgSync
	add sp, #0x10
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080421CC: .4byte gUnk_081DB00F
_080421D0: .4byte gUnk_081CC2AC
_080421D4: .4byte 0x06000C00
_080421D8: .4byte gUnk_081CD858
_080421DC: .4byte gUnk_081CD818
_080421E0: .4byte gUnk_081CB3E0
_080421E4: .4byte 0x06014800
_080421E8: .4byte gUnk_081CD798
_080421EC: .4byte gBg2Tm + 0x102
_080421F0: .4byte gUnk_081CE034
_080421F4: .4byte 0x0203DA48
_080421F8: .4byte 0x0203D9F8
_080421FC: .4byte 0x0203DBF0
_08042200: .4byte gUnk_081DB018
_08042204: .4byte gUnk_081DB024
_08042208: .4byte gUnk_081DB02C
_0804220C: .4byte gUnk_081DB034
_08042210: .4byte gBg0Tm + 0x14a
_08042214: .4byte 0x000003C7
_08042218: .4byte 0x0203DB28
_0804221C: .4byte gDispIo
_08042220: .4byte 0x0203D908

	thumb_func_start sub_8042224
sub_8042224: @ 0x08042224
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r6, r4, #0
	adds r6, #0x38
	movs r0, #0
	ldrsb r0, [r6, r0]
	cmp r0, #0
	ble _08042240
	ldrh r0, [r4, #0x36]
	subs r0, #4
	strh r0, [r4, #0x36]
	ldrb r0, [r6]
	subs r0, #1
	b _0804224E
_08042240:
	cmp r0, #0
	bge _0804226A
	ldrh r0, [r4, #0x36]
	adds r0, #4
	strh r0, [r4, #0x36]
	ldrb r0, [r6]
	adds r0, #1
_0804224E:
	strb r0, [r6]
	ldrh r2, [r4, #0x36]
	movs r0, #1
	movs r1, #0
	bl SetBgOffset
	ldrh r1, [r4, #0x36]
	adds r1, #0x38
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	movs r0, #0xa
	bl sub_8049438
	b _08042316
_0804226A:
	ldr r0, _0804231C @ =gpKeySt
	ldr r1, [r0]
	movs r0, #0x40
	ldrh r1, [r1, #6]
	ands r0, r1
	cmp r0, #0
	beq _080422B0
	adds r5, r4, #0
	adds r5, #0x34
	ldrb r0, [r5]
	cmp r0, #0
	beq _080422B0
	movs r0, #3
	bl sub_803E248
	ldrh r0, [r4, #0x36]
	subs r0, #4
	strh r0, [r4, #0x36]
	ldrb r0, [r5]
	subs r0, #1
	strb r0, [r5]
	movs r0, #3
	strb r0, [r6]
	ldrh r2, [r4, #0x36]
	movs r0, #1
	movs r1, #0
	bl SetBgOffset
	ldrh r1, [r4, #0x36]
	adds r1, #0x38
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	movs r0, #0xa
	bl sub_8049438
_080422B0:
	ldr r0, _0804231C @ =gpKeySt
	ldr r1, [r0]
	movs r0, #0x80
	ldrh r1, [r1, #6]
	ands r0, r1
	cmp r0, #0
	beq _080422FC
	adds r5, r4, #0
	adds r5, #0x34
	ldrb r0, [r5]
	adds r0, #5
	cmp r0, #9
	bgt _080422FC
	movs r0, #3
	bl sub_803E248
	ldrh r0, [r4, #0x36]
	adds r0, #4
	strh r0, [r4, #0x36]
	ldrb r0, [r5]
	adds r0, #1
	strb r0, [r5]
	adds r1, r4, #0
	adds r1, #0x38
	movs r0, #0xfd
	strb r0, [r1]
	ldrh r2, [r4, #0x36]
	movs r0, #1
	movs r1, #0
	bl SetBgOffset
	ldrh r1, [r4, #0x36]
	adds r1, #0x38
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	movs r0, #0xa
	bl sub_8049438
_080422FC:
	ldr r0, _0804231C @ =gpKeySt
	ldr r1, [r0]
	movs r0, #2
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _08042316
	movs r0, #1
	bl sub_803E248
	adds r0, r4, #0
	bl Proc_Break
_08042316:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0804231C: .4byte gpKeySt

	thumb_func_start sub_8042320
sub_8042320: @ 0x08042320
	cmp r0, #6
	ble _08042328
	movs r0, #5
	b _08042334
_08042328:
	subs r0, #2
	cmp r0, #0
	bge _08042330
	movs r0, #0
_08042330:
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
_08042334:
	bx lr
	.align 2, 0

	thumb_func_start sub_8042338
sub_8042338: @ 0x08042338
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x10
	adds r7, r0, #0
	ldr r1, _08042540 @ =gUnk_081DB039
	add r0, sp, #8
	movs r2, #7
	bl memcpy
	bl sub_803E080
	bl sub_8048320
	ldr r4, _08042544 @ =gUnk_081CC2AC
	movs r0, #1
	bl GetBgChrOffset
	adds r1, r0, #0
	ldr r0, _08042548 @ =0x06000C00
	adds r1, r1, r0
	adds r0, r4, #0
	bl Decompress
	ldr r0, _0804254C @ =gUnk_081CD858
	movs r1, #0x80
	movs r2, #0x40
	bl ApplyPaletteExt
	ldr r0, _08042550 @ =gUnk_081CD818
	movs r1, #0xc0
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r0, _08042554 @ =gUnk_081CB3E0
	ldr r1, _08042558 @ =0x06014800
	bl Decompress
	ldr r0, _0804255C @ =gUnk_081CD3E0
	ldr r1, _08042560 @ =0x06016000
	bl Decompress
	ldr r0, _08042564 @ =gUnk_081CD978
	movs r1, #0x98
	lsls r1, r1, #2
	movs r2, #0x20
	bl ApplyPaletteExt
	movs r0, #0
	movs r1, #0
	bl sub_80483C0
	ldr r0, _08042568 @ =gBg2Tm + 0x102
	ldr r1, _0804256C @ =gUnk_081CE034
	movs r2, #0x80
	lsls r2, r2, #5
	bl TmApplyTsa_thm
	ldr r0, _08042570 @ =0x0203DA48
	bl SetTextFont
	bl InitSystemTextFont
	bl ResetTextFont
	adds r1, r7, #0
	adds r1, #0x34
	movs r4, #0
	movs r0, #5
	strb r0, [r1]
	movs r1, #0
	movs r0, #0x8c
	lsls r0, r0, #1
	strh r0, [r7, #0x36]
	adds r0, r7, #0
	adds r0, #0x39
	strb r1, [r0]
	subs r0, #1
	strb r1, [r0]
	ldr r0, [r7, #0x3c]
	bl sub_8042320
	adds r1, r7, #0
	adds r1, #0x35
	strb r0, [r1]
	str r4, [r7, #0x40]
	ldrh r2, [r7, #0x36]
	movs r0, #1
	movs r1, #0
	bl SetBgOffset
	ldr r5, _08042574 @ =0x0203D9F8
	movs r4, #9
_080423F6:
	adds r0, r5, #0
	movs r1, #0x18
	bl InitText
	adds r5, #8
	subs r4, #1
	cmp r4, #0
	bge _080423F6
	ldr r4, _08042578 @ =0x0203DBF0
	adds r0, r4, #0
	movs r1, #0x18
	bl InitText
	adds r0, r4, #0
	adds r0, #8
	movs r1, #0x18
	bl InitText
	adds r0, r4, #0
	bl ClearText
	ldr r3, _0804257C @ =gUnk_081DB018
	adds r0, r4, #0
	movs r1, #0x10
	movs r2, #0
	bl Text_InsertDrawString
	ldr r3, _08042580 @ =gUnk_081DB024
	adds r0, r4, #0
	movs r1, #0x5e
	movs r2, #0
	bl Text_InsertDrawString
	ldr r3, _08042584 @ =gUnk_081DB02C
	adds r0, r4, #0
	movs r1, #0x84
	movs r2, #0
	bl Text_InsertDrawString
	ldr r3, _08042588 @ =gUnk_081DB034
	adds r0, r4, #0
	movs r1, #0x9c
	movs r2, #0
	bl Text_InsertDrawString
	ldr r1, _0804258C @ =gBg0Tm + 0x14a
	adds r0, r4, #0
	bl PutText
	ldr r0, _08042590 @ =0x0203DB28
	bl sub_80A28C0
	bl sub_8041F70
	ldr r1, _08042594 @ =gDispIo
	mov ip, r1
	movs r0, #0x20
	ldrb r2, [r1, #1]
	orrs r0, r2
	movs r1, #0x40
	orrs r0, r1
	movs r1, #0x7f
	ands r0, r1
	mov r1, ip
	strb r0, [r1, #1]
	mov r0, ip
	adds r0, #0x2d
	movs r2, #0
	mov r8, r2
	mov r1, r8
	strb r1, [r0]
	adds r0, #4
	movs r2, #0x38
	mov sl, r2
	mov r1, sl
	strb r1, [r0]
	subs r0, #5
	movs r6, #0xf0
	strb r6, [r0]
	mov r1, ip
	adds r1, #0x30
	movs r0, #0x88
	strb r0, [r1]
	mov r3, ip
	adds r3, #0x34
	movs r2, #1
	ldrb r0, [r3]
	orrs r0, r2
	movs r1, #2
	orrs r0, r1
	movs r5, #4
	orrs r0, r5
	movs r4, #8
	orrs r0, r4
	movs r1, #0x10
	mov sb, r1
	mov r1, sb
	orrs r0, r1
	strb r0, [r3]
	mov r0, ip
	adds r0, #0x2f
	mov r1, r8
	strb r1, [r0]
	mov r1, ip
	adds r1, #0x33
	movs r0, #0x18
	strb r0, [r1]
	mov r0, ip
	adds r0, #0x2e
	strb r6, [r0]
	adds r0, #4
	mov r1, sl
	strb r1, [r0]
	mov r6, ip
	adds r6, #0x35
	ldrb r0, [r6]
	orrs r0, r2
	movs r3, #3
	rsbs r3, r3, #0
	ands r0, r3
	orrs r0, r5
	orrs r0, r4
	movs r1, #0x11
	rsbs r1, r1, #0
	ands r0, r1
	strb r0, [r6]
	mov r0, ip
	adds r0, #0x36
	ldrb r1, [r0]
	orrs r2, r1
	ands r2, r3
	orrs r2, r5
	orrs r2, r4
	mov r1, sb
	orrs r2, r1
	strb r2, [r0]
	ldr r0, _08042598 @ =0x0203D908
	ldrb r0, [r0]
	str r0, [sp]
	str r7, [sp, #4]
	add r0, sp, #8
	movs r1, #7
	movs r2, #0
	movs r3, #8
	bl sub_8048670
	ldr r1, [r7, #0x3c]
	lsls r1, r1, #4
	subs r1, #0x18
	movs r0, #0xe
	adds r2, r7, #0
	bl sub_80499D8
	str r0, [r7, #0x2c]
	movs r0, #0xf
	bl EnableBgSync
	add sp, #0x10
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08042540: .4byte gUnk_081DB039
_08042544: .4byte gUnk_081CC2AC
_08042548: .4byte 0x06000C00
_0804254C: .4byte gUnk_081CD858
_08042550: .4byte gUnk_081CD818
_08042554: .4byte gUnk_081CB3E0
_08042558: .4byte 0x06014800
_0804255C: .4byte gUnk_081CD3E0
_08042560: .4byte 0x06016000
_08042564: .4byte gUnk_081CD978
_08042568: .4byte gBg2Tm + 0x102
_0804256C: .4byte gUnk_081CE034
_08042570: .4byte 0x0203DA48
_08042574: .4byte 0x0203D9F8
_08042578: .4byte 0x0203DBF0
_0804257C: .4byte gUnk_081DB018
_08042580: .4byte gUnk_081DB024
_08042584: .4byte gUnk_081DB02C
_08042588: .4byte gUnk_081DB034
_0804258C: .4byte gBg0Tm + 0x14a
_08042590: .4byte 0x0203DB28
_08042594: .4byte gDispIo
_08042598: .4byte 0x0203D908

	thumb_func_start sub_804259C
sub_804259C: @ 0x0804259C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r4, r0, #0
	ldr r0, [r4, #0x2c]
	mov r8, r0
	ldr r0, [r4, #0x40]
	adds r0, #1
	str r0, [r4, #0x40]
	cmp r0, #0x3b
	ble _0804264E
	adds r7, r4, #0
	adds r7, #0x35
	ldrb r1, [r7]
	cmp r1, #5
	bne _080425C2
	adds r0, r4, #0
	bl Proc_Break
_080425C2:
	adds r5, r4, #0
	adds r5, #0x38
	movs r0, #0
	ldrsb r0, [r5, r0]
	cmp r0, #0
	ble _080425FC
	ldrh r0, [r4, #0x36]
	subs r0, #2
	strh r0, [r4, #0x36]
	ldrb r0, [r5]
	subs r0, #1
	strb r0, [r5]
	ldrh r2, [r4, #0x36]
	movs r0, #1
	movs r1, #0
	bl SetBgOffset
	ldrh r1, [r4, #0x36]
	adds r1, #0x38
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	movs r0, #0xa
	bl sub_8049438
	mov r1, r8
	ldr r0, [r1, #0x30]
	adds r0, #2
	str r0, [r1, #0x30]
	b _0804264E
_080425FC:
	adds r6, r4, #0
	adds r6, #0x34
	ldrb r0, [r7]
	ldrb r1, [r6]
	cmp r0, r1
	beq _08042638
	ldrh r0, [r4, #0x36]
	subs r0, #2
	strh r0, [r4, #0x36]
	ldrb r0, [r6]
	subs r0, #1
	strb r0, [r6]
	movs r0, #7
	strb r0, [r5]
	ldrh r2, [r4, #0x36]
	movs r0, #1
	movs r1, #0
	bl SetBgOffset
	ldrh r1, [r4, #0x36]
	adds r1, #0x38
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	movs r0, #0xa
	bl sub_8049438
	mov r1, r8
	ldr r0, [r1, #0x30]
	adds r0, #2
	str r0, [r1, #0x30]
_08042638:
	movs r0, #0
	ldrsb r0, [r5, r0]
	cmp r0, #0
	bne _0804264E
	ldrb r6, [r6]
	ldrb r7, [r7]
	cmp r6, r7
	bne _0804264E
	adds r0, r4, #0
	bl Proc_Break
_0804264E:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_8042658
sub_8042658: @ 0x08042658
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0804267C @ =gpKeySt
	ldr r1, [r0]
	movs r0, #1
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _08042676
	movs r0, #0
	bl FadeBgmOut
	adds r0, r4, #0
	bl Proc_Break
_08042676:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0804267C: .4byte gpKeySt

	thumb_func_start sub_8042680
sub_8042680: @ 0x08042680
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08042694 @ =gUnk_08C08844
	bl Proc_StartBlocking
	str r4, [r0, #0x3c]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08042694: .4byte gUnk_08C08844

	thumb_func_start sub_8042698
sub_8042698: @ 0x08042698
	ldr r1, _080426B4 @ =0x0203D908
	adds r1, #0xec
	ldrb r2, [r1]
	lsls r1, r2, #0x1f
	lsrs r1, r1, #0x1f
	strb r1, [r0]
	lsls r1, r2, #0x1e
	lsrs r1, r1, #0x1f
	strb r1, [r0, #1]
	lsls r2, r2, #0x1d
	lsrs r2, r2, #0x1f
	strb r2, [r0, #2]
	bx lr
	.align 2, 0
_080426B4: .4byte 0x0203D908

	thumb_func_start sub_80426B8
sub_80426B8: @ 0x080426B8
	push {r4, r5, lr}
	ldr r5, _080426F4 @ =0x0203D908
	adds r5, #0xec
	movs r4, #1
	ldrb r2, [r0]
	ands r2, r4
	movs r1, #2
	rsbs r1, r1, #0
	ldrb r3, [r5]
	ands r1, r3
	orrs r1, r2
	ldrb r2, [r0, #1]
	ands r2, r4
	lsls r2, r2, #1
	movs r3, #3
	rsbs r3, r3, #0
	ands r1, r3
	orrs r1, r2
	ldrb r0, [r0, #2]
	ands r4, r0
	lsls r4, r4, #2
	movs r0, #5
	rsbs r0, r0, #0
	ands r1, r0
	orrs r1, r4
	strb r1, [r5]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080426F4: .4byte 0x0203D908

	thumb_func_start sub_80426F8
sub_80426F8: @ 0x080426F8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	str r1, [sp, #8]
	ldr r1, _08042794 @ =gUnk_081DB040
	ldr r2, [r1, #4]
	ldr r1, [r1]
	str r1, [sp]
	str r2, [sp, #4]
	movs r7, #0
	lsls r1, r0, #1
	ldr r2, _08042798 @ =gUnk_081DAFC4
	mov r8, r2
	adds r1, r1, r0
	adds r1, #6
	lsls r1, r1, #5
	mov sl, r1
	adds r2, #4
	lsls r6, r0, #4
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r2, r2, r1
	mov sb, r2
	adds r5, r1, #0
_08042730:
	ldr r4, _0804279C @ =0x0203D96C
	adds r4, r6, r4
	adds r0, r4, #0
	bl ClearText
	ldr r1, [sp, #8]
	adds r0, r1, r7
	movs r1, #1
	ands r0, r1
	lsls r0, r0, #2
	add r0, sp
	ldr r1, [r0]
	adds r0, r4, #0
	bl Text_SetColor
	mov r0, r8
	adds r0, #0xc
	adds r0, r5, r0
	ldr r1, [r0]
	adds r0, r4, #0
	bl Text_DrawString
	mov r2, sb
	adds r2, #4
	mov sb, r2
	subs r2, #4
	ldm r2!, {r1}
	add r1, sl
	lsls r1, r1, #1
	ldr r0, _080427A0 @ =gBg0Tm
	adds r1, r1, r0
	adds r0, r4, #0
	bl PutText
	adds r6, #8
	adds r5, #4
	adds r7, #1
	cmp r7, #1
	ble _08042730
	movs r0, #1
	bl EnableBgSync
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08042794: .4byte gUnk_081DB040
_08042798: .4byte gUnk_081DAFC4
_0804279C: .4byte 0x0203D96C
_080427A0: .4byte gBg0Tm

	thumb_func_start sub_80427A4
sub_80427A4: @ 0x080427A4
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x18
	mov r8, r0
	add r6, sp, #0xc
	ldr r1, _08042914 @ =gUnk_081DB048
	adds r0, r6, #0
	movs r2, #9
	bl memcpy
	bl sub_803E080
	bl sub_8048320
	ldr r4, _08042918 @ =gUnk_081CC2AC
	movs r0, #1
	bl GetBgChrOffset
	adds r1, r0, #0
	ldr r0, _0804291C @ =0x06000C00
	adds r1, r1, r0
	adds r0, r4, #0
	bl Decompress
	ldr r0, _08042920 @ =gUnk_081CD818
	movs r1, #0xc0
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r0, _08042924 @ =gUnk_081CB3E0
	ldr r1, _08042928 @ =0x06014800
	bl Decompress
	ldr r0, _0804292C @ =gUnk_081CD798
	movs r1, #0x98
	lsls r1, r1, #2
	movs r2, #0x80
	bl ApplyPaletteExt
	movs r0, #0
	bl sub_8048424
	ldr r0, _08042930 @ =0x0203DA48
	bl SetTextFont
	bl ResetTextFont
	bl sub_803E1A0
	movs r0, #0
	mov r1, r8
	str r0, [r1, #0x30]
	mov r0, r8
	bl sub_8049090
	mov r2, r8
	str r0, [r2, #0x2c]
	movs r0, #1
	movs r1, #0xfe
	movs r2, #0
	bl SetBgOffset
	add r0, sp, #8
	bl sub_8042698
	mov r3, r8
	ldr r0, [r3, #0x2c]
	ldr r4, [r3, #0x30]
	movs r2, #0x30
	ldrsh r1, [r3, r2]
	ldr r5, _08042934 @ =gUnk_081DAFC4
	mov r3, sp
	adds r3, r3, r4
	adds r3, #8
	lsls r2, r4, #2
	adds r2, r2, r4
	ldrb r3, [r3]
	adds r2, r3, r2
	lsls r2, r2, #2
	adds r3, r5, #4
	adds r2, r2, r3
	ldr r2, [r2]
	lsls r2, r2, #0x13
	asrs r2, r2, #0x10
	lsls r3, r4, #1
	adds r3, r3, r4
	lsls r3, r3, #0x13
	movs r4, #0xc0
	lsls r4, r4, #0xe
	adds r3, r3, r4
	asrs r3, r3, #0x10
	bl sub_80490B4
	movs r7, #0
	mov sl, r6
	movs r6, #0xc0
	lsls r6, r6, #1
_0804286C:
	lsls r4, r7, #3
	ldr r0, _08042938 @ =0x0203D914
	mov sb, r0
	add r4, sb
	adds r0, r4, #0
	bl ClearText
	adds r0, r4, #0
	movs r1, #0
	bl Text_SetColor
	ldr r1, [r5]
	adds r0, r4, #0
	bl Text_DrawString
	ldr r1, _0804293C @ =gBg0Tm + 0xc
	adds r1, r6, r1
	adds r0, r4, #0
	bl PutText
	mov r0, sp
	adds r0, r0, r7
	adds r0, #8
	ldrb r1, [r0]
	adds r0, r7, #0
	bl sub_80426F8
	adds r6, #0xc0
	adds r5, #0x14
	adds r7, #1
	cmp r7, #2
	ble _0804286C
	ldr r5, _08042934 @ =gUnk_081DAFC4
	ldr r0, [r5, #0x18]
	lsls r0, r0, #1
	ldr r4, _08042940 @ =gBg1Tm + 0x23c
	adds r0, r0, r4
	movs r1, #0
	bl sub_8041EA8
	ldr r0, [r5, #0x1c]
	lsls r0, r0, #1
	adds r0, r0, r4
	movs r1, #1
	bl sub_8041EA8
	mov r1, r8
	ldr r0, [r1, #0x2c]
	movs r1, #6
	bl sub_804856C
	mov r0, sb
	subs r0, #0xc
	ldrb r0, [r0]
	str r0, [sp]
	mov r2, r8
	ldr r0, [r2, #0x2c]
	str r0, [sp, #4]
	mov r0, sl
	movs r1, #9
	movs r2, #0
	movs r3, #8
	bl sub_8048670
	mov r3, r8
	ldr r0, [r3, #0x30]
	movs r4, #0xf2
	lsls r4, r4, #2
	adds r0, r0, r4
	movs r1, #1
	bl sub_803E13C
	movs r0, #0xf
	bl EnableBgSync
	add sp, #0x18
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08042914: .4byte gUnk_081DB048
_08042918: .4byte gUnk_081CC2AC
_0804291C: .4byte 0x06000C00
_08042920: .4byte gUnk_081CD818
_08042924: .4byte gUnk_081CB3E0
_08042928: .4byte 0x06014800
_0804292C: .4byte gUnk_081CD798
_08042930: .4byte 0x0203DA48
_08042934: .4byte gUnk_081DAFC4
_08042938: .4byte 0x0203D914
_0804293C: .4byte gBg0Tm + 0xc
_08042940: .4byte gBg1Tm + 0x23c

	thumb_func_start sub_8042944
sub_8042944: @ 0x08042944
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r6, r0, #0
	movs r4, #0
	movs r7, #0
	ldr r5, _08042A60 @ =gpKeySt
	ldr r1, [r5]
	movs r0, #2
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _0804296E
	movs r0, #1
	bl sub_803E248
	ldr r0, _08042A64 @ =0x0203D9F4
	bl sub_80A28E8
	adds r0, r6, #0
	bl Proc_Break
_0804296E:
	mov r0, sp
	bl sub_8042698
	ldr r1, [r5]
	movs r0, #0x40
	ldrh r1, [r1, #6]
	ands r0, r1
	cmp r0, #0
	beq _0804298C
	ldr r0, [r6, #0x30]
	cmp r0, #0
	beq _0804298C
	subs r0, #1
	str r0, [r6, #0x30]
	movs r4, #1
_0804298C:
	ldr r2, _08042A60 @ =gpKeySt
	ldr r1, [r2]
	movs r0, #0x80
	ldrh r1, [r1, #6]
	ands r0, r1
	adds r5, r2, #0
	cmp r0, #0
	beq _080429AC
	ldr r0, [r6, #0x30]
	cmp r0, #1
	bgt _080429AC
	adds r0, #1
	str r0, [r6, #0x30]
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
_080429AC:
	ldr r1, [r5]
	movs r0, #0x20
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _080429D4
	ldr r0, [r6, #0x30]
	mov r1, sp
	adds r3, r1, r0
	ldrb r1, [r3]
	subs r1, #1
	movs r2, #1
	ands r1, r2
	strb r1, [r3]
	ldrb r1, [r3]
	bl sub_80426F8
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
_080429D4:
	ldr r1, [r5]
	movs r0, #0x10
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _080429FC
	ldr r0, [r6, #0x30]
	mov r2, sp
	adds r3, r2, r0
	ldrb r1, [r3]
	adds r1, #1
	movs r2, #1
	ands r1, r2
	strb r1, [r3]
	ldrb r1, [r3]
	bl sub_80426F8
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
_080429FC:
	mov r0, sp
	bl sub_80426B8
	cmp r4, #0
	beq _08042A58
	movs r0, #3
	bl sub_803E248
	ldr r5, [r6, #0x30]
	cmp r5, #1
	bne _08042A16
	movs r7, #2
	rsbs r7, r7, #0
_08042A16:
	ldr r0, [r6, #0x2c]
	lsls r1, r5, #0x10
	asrs r1, r1, #0x10
	ldr r3, _08042A68 @ =gUnk_081DAFC4
	mov r2, sp
	adds r4, r2, r5
	lsls r2, r5, #2
	adds r2, r2, r5
	ldrb r4, [r4]
	adds r2, r4, r2
	lsls r2, r2, #2
	adds r3, #4
	adds r2, r2, r3
	ldr r2, [r2]
	adds r2, r2, r7
	lsls r2, r2, #0x13
	asrs r2, r2, #0x10
	lsls r3, r5, #1
	adds r3, r3, r5
	lsls r3, r3, #0x13
	movs r4, #0xc0
	lsls r4, r4, #0xe
	adds r3, r3, r4
	asrs r3, r3, #0x10
	bl sub_80490B4
	ldr r0, [r6, #0x30]
	movs r1, #0xf2
	lsls r1, r1, #2
	adds r0, r0, r1
	movs r1, #1
	bl sub_803E13C
_08042A58:
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08042A60: .4byte gpKeySt
_08042A64: .4byte 0x0203D9F4
_08042A68: .4byte gUnk_081DAFC4

	thumb_func_start sub_8042A6C
sub_8042A6C: @ 0x08042A6C
	push {r4, r5, r6, lr}
	sub sp, #0x28
	adds r2, r0, #0
	adds r3, r1, #0
	mov r0, sp
	ldr r1, _08042AA0 @ =gUnk_081DB054
	ldm r1!, {r4, r5, r6}
	stm r0!, {r4, r5, r6}
	ldm r1!, {r4, r5, r6}
	stm r0!, {r4, r5, r6}
	ldm r1!, {r4, r5, r6}
	stm r0!, {r4, r5, r6}
	ldr r1, [r1]
	str r1, [r0]
	cmp r3, #0
	bne _08042AA4
	adds r0, r2, #0
	adds r0, #0x58
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne _08042AB8
	movs r0, #0xee
	lsls r0, r0, #2
	b _08042AC4
	.align 2, 0
_08042AA0: .4byte gUnk_081DB054
_08042AA4:
	adds r0, r2, #0
	adds r0, #0x58
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne _08042AB8
	movs r0, #1
	rsbs r0, r0, #0
	b _08042AC4
_08042AB8:
	ldr r0, [r2, #0x48]
	lsls r0, r0, #1
	adds r0, r0, r3
	lsls r0, r0, #2
	add r0, sp
	ldr r0, [r0]
_08042AC4:
	add sp, #0x28
	pop {r4, r5, r6}
	pop {r1}
	bx r1

	thumb_func_start sub_8042ACC
sub_8042ACC: @ 0x08042ACC
	push {r4, lr}
	sub sp, #0x48
	movs r4, #0
_08042AD2:
	adds r0, r4, #0
	bl IsSaveValid
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08042AF6
	adds r0, r4, #0
	mov r1, sp
	bl ReadGameSavePlaySt
	mov r0, sp
	bl sub_80A1398
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08042AF6
	movs r0, #1
	b _08042AFE
_08042AF6:
	adds r4, #1
	cmp r4, #2
	ble _08042AD2
	movs r0, #0
_08042AFE:
	add sp, #0x48
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_8042B08
sub_8042B08: @ 0x08042B08
	push {lr}
	bl sub_8042ACC
	ldr r1, _08042B34 @ =0x0203D908
	strb r0, [r1, #0xa]
	ldr r1, _08042B38 @ =0x0203DC10
	movs r2, #0
	adds r0, r1, #0
	adds r0, #0x1e
_08042B1A:
	strh r2, [r0]
	subs r0, #2
	cmp r0, r1
	bge _08042B1A
	movs r1, #0
	ldr r3, _08042B3C @ =0x030013F0
	ldr r2, _08042B40 @ =0x030013F4
	ldr r0, _08042B44 @ =0x0203DC30
	str r1, [r0]
	str r1, [r2]
	str r1, [r3]
	pop {r0}
	bx r0
	.align 2, 0
_08042B34: .4byte 0x0203D908
_08042B38: .4byte 0x0203DC10
_08042B3C: .4byte 0x030013F0
_08042B40: .4byte 0x030013F4
_08042B44: .4byte 0x0203DC30

	thumb_func_start sub_8042B48
sub_8042B48: @ 0x08042B48
	push {r4, r5, r6, r7, lr}
	sub sp, #0x10
	adds r6, r0, #0
	ldr r1, _08042BDC @ =gUnk_081DB086
	add r0, sp, #8
	movs r2, #5
	bl memcpy
	ldr r4, _08042BE0 @ =0x0203D9F4
	adds r0, r4, #0
	bl sub_80A2924
	ldrb r4, [r4]
	lsls r0, r4, #0x1c
	lsrs r0, r0, #0x1f
	adds r5, r6, #0
	adds r5, #0x59
	movs r4, #0
	strb r0, [r5]
	bl sub_8048320
	ldr r0, _08042BE4 @ =gUnk_081CA888
	ldr r1, _08042BE8 @ =0x06014800
	bl Decompress
	ldr r0, _08042BEC @ =gUnk_081CD738
	movs r1, #0x98
	lsls r1, r1, #2
	movs r2, #0x60
	bl ApplyPaletteExt
	movs r0, #0
	movs r1, #4
	bl sub_80483C0
	ldr r0, _08042BF0 @ =0x0203DA48
	bl SetTextFont
	bl InitSystemTextFont
	bl ResetTextFont
	bl sub_803E1A0
	str r4, [r6, #0x4c]
	bl sub_80A294C
	adds r2, r6, #0
	adds r2, #0x58
	strb r0, [r2]
	adds r1, r6, #0
	adds r1, #0x40
	movs r0, #1
	strb r0, [r1]
	movs r1, #0
	ldrsb r1, [r2, r1]
	rsbs r0, r1, #0
	orrs r0, r1
	lsrs r1, r0, #0x1f
	adds r0, r6, #0
	adds r0, #0x41
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	movs r0, #0
	ldrsb r0, [r5, r0]
	cmp r0, #0
	bne _08042BF4
	movs r1, #0
	movs r0, #3
	b _08042BF8
	.align 2, 0
_08042BDC: .4byte gUnk_081DB086
_08042BE0: .4byte 0x0203D9F4
_08042BE4: .4byte gUnk_081CA888
_08042BE8: .4byte 0x06014800
_08042BEC: .4byte gUnk_081CD738
_08042BF0: .4byte 0x0203DA48
_08042BF4:
	movs r1, #1
	movs r0, #4
_08042BF8:
	str r0, [r6, #0x50]
	adds r0, r6, #0
	adds r0, #0x44
	strb r1, [r0]
	ldr r0, _08042C80 @ =0x0203D908
	ldrb r0, [r0, #1]
	str r0, [r6, #0x48]
	adds r2, r6, #0
	adds r2, #0x40
	adds r0, r2, r0
	movs r1, #2
	strb r1, [r0]
	movs r4, #4
	adds r7, r2, #0
	adds r5, r6, #0
	adds r5, #0x3c
_08042C18:
	lsls r3, r4, #0x18
	lsrs r3, r3, #0x18
	adds r0, r7, r4
	ldrb r0, [r0]
	str r0, [sp]
	adds r0, r6, #0
	movs r1, #0xb0
	movs r2, #0xa0
	bl sub_8048944
	str r0, [r5]
	subs r5, #4
	subs r4, #1
	cmp r4, #0
	bge _08042C18
	ldr r0, [r6, #0x2c]
	movs r1, #0
	bl sub_804856C
	movs r4, #0
	str r4, [sp]
	ldr r0, [r6, #0x2c]
	str r0, [sp, #4]
	add r0, sp, #8
	movs r1, #5
	movs r2, #0
	movs r3, #0xa8
	bl sub_8048670
	ldr r0, _08042C84 @ =gUnk_08C088E4
	bl sub_80069E0
	movs r0, #2
	str r0, [sp]
	movs r0, #3
	movs r1, #0xdf
	movs r2, #0xd0
	movs r3, #0x50
	bl sub_8006AC4
	str r4, [r6, #0x54]
	movs r0, #0x47
	movs r1, #0
	bl sub_800376C
	bl sub_80457EC
	add sp, #0x10
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08042C80: .4byte 0x0203D908
_08042C84: .4byte gUnk_08C088E4

	thumb_func_start sub_8042C88
sub_8042C88: @ 0x08042C88
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #4
	adds r7, r0, #0
	movs r1, #0x50
	rsbs r1, r1, #0
	ldr r5, _08042D30 @ =gUnk_081DB07C
	ldrb r2, [r5]
	ldr r3, [r7, #0x54]
	movs r4, #0x20
	str r4, [sp]
	movs r0, #4
	bl Interpolate
	adds r6, r0, #0
	ldrb r2, [r5, #1]
	ldr r3, [r7, #0x54]
	str r4, [sp]
	movs r0, #5
	movs r1, #0xa0
	bl Interpolate
	mov sb, r0
	movs r5, #4
	lsls r6, r6, #0x10
	mov r8, r6
	lsls r6, r0, #0x10
	adds r4, r7, #0
	adds r4, #0x3c
_08042CC6:
	ldr r0, [r4]
	mov r2, r8
	asrs r1, r2, #0x10
	asrs r2, r6, #0x10
	bl sub_80489C8
	subs r4, #4
	subs r5, #1
	cmp r5, #0
	bge _08042CC6
	mov r1, sb
	adds r1, #8
	movs r0, #0
	bl sub_8048758
	ldr r0, [r7, #0x54]
	cmp r0, #0x1f
	ble _08042D1C
	movs r0, #0
	str r0, [r7, #0x54]
	adds r0, r7, #0
	movs r1, #0
	bl sub_8042A6C
	movs r1, #0
	bl sub_803E13C
	adds r0, r7, #0
	movs r1, #1
	bl sub_8042A6C
	movs r1, #1
	bl sub_803E13C
	ldr r0, _08042D30 @ =gUnk_081DB07C
	ldrb r1, [r0, #1]
	adds r1, #8
	movs r0, #0
	bl sub_8048758
	adds r0, r7, #0
	bl Proc_Break
_08042D1C:
	ldr r0, [r7, #0x54]
	adds r0, #1
	str r0, [r7, #0x54]
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08042D30: .4byte gUnk_081DB07C

	thumb_func_start sub_8042D34
sub_8042D34: @ 0x08042D34
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	adds r5, r0, #0
	ldr r0, [r5, #0x48]
	lsls r0, r0, #1
	movs r7, #4
	ldr r1, _08042DC8 @ =gUnk_081DB07C
	movs r2, #0x10
	mov r8, r2
	adds r6, r1, #0
	adds r6, #8
	adds r4, r0, r1
	mov sl, r4
	adds r0, #1
	adds r0, r0, r1
	mov sb, r0
_08042D5C:
	ldrb r2, [r6]
	ldr r3, [r5, #0x54]
	mov r0, r8
	str r0, [sp]
	movs r0, #4
	mov r4, sl
	ldrb r1, [r4]
	bl Interpolate
	adds r4, r0, #0
	mov r0, sb
	ldrb r1, [r0]
	ldrb r2, [r6, #1]
	ldr r3, [r5, #0x54]
	mov r0, r8
	str r0, [sp]
	movs r0, #4
	bl Interpolate
	adds r2, r0, #0
	lsls r1, r7, #2
	adds r0, r5, #0
	adds r0, #0x2c
	adds r0, r0, r1
	ldr r0, [r0]
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	adds r1, r4, #0
	bl sub_80489C8
	subs r6, #2
	subs r7, #1
	cmp r7, #0
	bge _08042D5C
	ldr r0, [r5, #0x54]
	cmp r0, #0xf
	ble _08042DB0
	adds r0, r5, #0
	bl Proc_Break
_08042DB0:
	ldr r0, [r5, #0x54]
	adds r0, #1
	str r0, [r5, #0x54]
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08042DC8: .4byte gUnk_081DB07C

	thumb_func_start sub_8042DCC
sub_8042DCC: @ 0x08042DCC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x10
	adds r6, r0, #0
	ldr r1, _08042E68 @ =gUnk_081DB086
	add r0, sp, #8
	movs r2, #5
	bl memcpy
	ldr r4, _08042E6C @ =0x0203D9F4
	adds r0, r4, #0
	bl sub_80A2924
	ldrb r4, [r4]
	lsls r0, r4, #0x1c
	lsrs r0, r0, #0x1f
	adds r5, r6, #0
	adds r5, #0x59
	movs r4, #0
	strb r0, [r5]
	bl sub_8048320
	ldr r0, _08042E70 @ =gUnk_081CA888
	ldr r1, _08042E74 @ =0x06014800
	bl Decompress
	ldr r0, _08042E78 @ =gUnk_081CD738
	movs r1, #0x98
	lsls r1, r1, #2
	movs r2, #0x60
	bl ApplyPaletteExt
	movs r0, #0
	movs r1, #4
	bl sub_80483C0
	ldr r0, _08042E7C @ =0x0203DA48
	bl SetTextFont
	bl InitSystemTextFont
	bl ResetTextFont
	bl sub_803E1A0
	str r4, [r6, #0x4c]
	bl sub_80A294C
	adds r2, r6, #0
	adds r2, #0x58
	strb r0, [r2]
	adds r1, r6, #0
	adds r1, #0x40
	movs r0, #1
	strb r0, [r1]
	movs r1, #0
	ldrsb r1, [r2, r1]
	rsbs r0, r1, #0
	orrs r0, r1
	lsrs r1, r0, #0x1f
	adds r0, r6, #0
	adds r0, #0x41
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	movs r0, #0
	ldrsb r0, [r5, r0]
	cmp r0, #0
	bne _08042E80
	movs r1, #0
	movs r0, #3
	b _08042E84
	.align 2, 0
_08042E68: .4byte gUnk_081DB086
_08042E6C: .4byte 0x0203D9F4
_08042E70: .4byte gUnk_081CA888
_08042E74: .4byte 0x06014800
_08042E78: .4byte gUnk_081CD738
_08042E7C: .4byte 0x0203DA48
_08042E80:
	movs r1, #1
	movs r0, #4
_08042E84:
	str r0, [r6, #0x50]
	adds r0, r6, #0
	adds r0, #0x44
	strb r1, [r0]
	ldr r0, _08042F50 @ =0x0203D908
	ldrb r0, [r0, #1]
	str r0, [r6, #0x48]
	adds r2, r6, #0
	adds r2, #0x40
	adds r0, r2, r0
	movs r1, #2
	strb r1, [r0]
	ldr r1, [r6, #0x48]
	lsls r1, r1, #1
	movs r5, #4
	mov sb, r2
	ldr r2, _08042F54 @ =gUnk_081DB07C
	adds r0, r1, #1
	adds r0, r0, r2
	mov r8, r0
	adds r4, r6, #0
	adds r4, #0x3c
	adds r1, r1, r2
	mov sl, r1
_08042EB4:
	lsls r3, r5, #0x18
	lsrs r3, r3, #0x18
	mov r1, sb
	adds r0, r1, r5
	ldrb r0, [r0]
	str r0, [sp]
	adds r0, r6, #0
	mov r2, sl
	ldrb r1, [r2]
	mov r7, r8
	ldrb r2, [r7]
	bl sub_8048944
	str r0, [r4]
	subs r4, #4
	subs r5, #1
	cmp r5, #0
	bge _08042EB4
	ldr r0, [r6, #0x2c]
	movs r1, #0
	bl sub_804856C
	ldr r1, _08042F54 @ =gUnk_081DB07C
	ldr r0, [r6, #0x48]
	lsls r0, r0, #1
	adds r0, #1
	adds r0, r0, r1
	ldrb r3, [r0]
	adds r3, #8
	movs r4, #0
	str r4, [sp]
	ldr r0, [r6, #0x2c]
	str r0, [sp, #4]
	add r0, sp, #8
	movs r1, #5
	movs r2, #0
	bl sub_8048670
	ldr r0, _08042F58 @ =gUnk_08C08904
	bl sub_80069E0
	movs r0, #2
	str r0, [sp]
	movs r0, #3
	movs r1, #0xdf
	movs r2, #0xd0
	movs r3, #0x50
	bl sub_8006AC4
	adds r0, r6, #0
	movs r1, #0
	bl sub_8042A6C
	movs r1, #0
	bl sub_803E13C
	adds r0, r6, #0
	movs r1, #1
	bl sub_8042A6C
	movs r1, #1
	bl sub_803E13C
	bl sub_80457EC
	movs r0, #0x47
	movs r1, #0
	bl sub_800376C
	str r4, [r6, #0x54]
	add sp, #0x10
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08042F50: .4byte 0x0203D908
_08042F54: .4byte gUnk_081DB07C
_08042F58: .4byte gUnk_08C08904

	thumb_func_start sub_8042F5C
sub_8042F5C: @ 0x08042F5C
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r5, r0, #0
	lsls r1, r1, #0x18
	lsrs r6, r1, #0x18
	ldr r0, [r5, #0x48]
	cmp r0, #1
	bne _08042FDC
	ldr r0, _08043054 @ =gpKeySt
	ldr r1, [r0]
	movs r0, #0x20
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _08042FA6
	ldr r1, _08043058 @ =0x0203D908
	ldrb r0, [r1, #5]
	subs r0, #1
	strb r0, [r1, #5]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #2
	bls _08042F8E
	movs r0, #2
	strb r0, [r1, #5]
_08042F8E:
	ldr r0, [r5, #0x30]
	movs r1, #6
	rsbs r1, r1, #0
	movs r2, #4
	str r2, [sp]
	movs r2, #0x34
	movs r3, #0x1f
	bl sub_80489B4
	movs r0, #3
	bl sub_803E248
_08042FA6:
	ldr r0, _08043054 @ =gpKeySt
	ldr r1, [r0]
	movs r0, #0x10
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _08042FDC
	ldr r4, _08043058 @ =0x0203D908
	ldrb r0, [r4, #5]
	adds r0, #1
	strb r0, [r4, #5]
	ldrb r0, [r4, #5]
	movs r1, #3
	bl __umodsi3
	strb r0, [r4, #5]
	ldr r0, [r5, #0x30]
	movs r1, #0x1f
	str r1, [sp]
	movs r1, #0
	movs r2, #0x3a
	movs r3, #4
	bl sub_80489B4
	movs r0, #3
	bl sub_803E248
_08042FDC:
	ldr r1, _08043054 @ =gpKeySt
	ldr r2, [r1]
	ldrh r3, [r2, #6]
	movs r0, #0x40
	ands r0, r3
	adds r4, r1, #0
	cmp r0, #0
	beq _08043016
	ldr r1, [r5, #0x48]
	ldr r0, [r5, #0x4c]
	cmp r1, r0
	bgt _08042FFA
	ldrh r2, [r2, #8]
	cmp r3, r2
	bne _08043016
_08042FFA:
	subs r2, r6, #1
	adds r1, r5, #0
	adds r1, #0x40
_08043000:
	ldr r0, [r5, #0x48]
	subs r0, #1
	str r0, [r5, #0x48]
	cmp r0, #0
	bge _0804300C
	str r2, [r5, #0x48]
_0804300C:
	ldr r0, [r5, #0x48]
	adds r0, r1, r0
	ldrb r0, [r0]
	cmp r0, #0
	beq _08043000
_08043016:
	ldr r2, [r4]
	ldrh r3, [r2, #6]
	movs r0, #0x80
	ands r0, r3
	cmp r0, #0
	beq _0804304A
	ldr r1, [r5, #0x48]
	ldr r0, [r5, #0x50]
	cmp r1, r0
	blt _08043030
	ldrh r2, [r2, #8]
	cmp r3, r2
	bne _0804304A
_08043030:
	adds r4, r5, #0
	adds r4, #0x40
_08043034:
	ldr r0, [r5, #0x48]
	adds r0, #1
	str r0, [r5, #0x48]
	adds r1, r6, #0
	bl __modsi3
	str r0, [r5, #0x48]
	adds r0, r4, r0
	ldrb r0, [r0]
	cmp r0, #0
	beq _08043034
_0804304A:
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08043054: .4byte gpKeySt
_08043058: .4byte 0x0203D908

	thumb_func_start sub_804305C
sub_804305C: @ 0x0804305C
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r5, [r4, #0x48]
	ldr r0, _08043154 @ =gUnk_08C07EB0
	bl sub_803E2A4
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0804308C
	ldr r1, _08043158 @ =0x0203D908
	ldr r0, [r4, #0x48]
	strb r0, [r1]
	strb r0, [r1, #1]
	movs r0, #3
	bl EndFaceById
	ldr r0, _0804315C @ =gUnk_08C08B00
	adds r1, r4, #0
	bl Proc_StartBlocking
	adds r0, r4, #0
	movs r1, #1
	bl Proc_Goto
_0804308C:
	adds r0, r4, #0
	movs r1, #5
	bl sub_8042F5C
	ldr r0, [r4, #0x48]
	cmp r5, r0
	beq _08043106
	movs r0, #3
	bl sub_803E248
	lsls r0, r5, #2
	adds r1, r4, #0
	adds r1, #0x2c
	adds r0, r1, r0
	ldr r3, [r0]
	adds r2, r3, #0
	adds r2, #0x2e
	movs r0, #1
	strb r0, [r2]
	ldr r0, [r4, #0x48]
	lsls r0, r0, #2
	adds r1, r1, r0
	ldr r3, [r1]
	adds r1, r3, #0
	adds r1, #0x2e
	movs r0, #2
	strb r0, [r1]
	movs r0, #0x2a
	ldrsh r1, [r3, r0]
	movs r0, #0x2c
	ldrsh r2, [r3, r0]
	adds r0, r3, #0
	bl sub_80491A8
	adds r0, r4, #0
	movs r1, #0
	bl sub_8042A6C
	movs r1, #0
	bl sub_803E13C
	adds r0, r4, #0
	movs r1, #1
	bl sub_8042A6C
	movs r1, #1
	bl sub_803E13C
	ldr r1, _08043160 @ =gUnk_081DB07C
	ldr r0, [r4, #0x48]
	lsls r0, r0, #1
	adds r0, #1
	adds r0, r0, r1
	ldrb r1, [r0]
	adds r1, #8
	movs r0, #0
	bl sub_804873C
	ldr r0, [r4, #0x48]
	bl sub_8048778
_08043106:
	ldr r5, _08043164 @ =gpKeySt
	ldr r1, [r5]
	movs r0, #1
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _0804312A
	movs r0, #0
	str r0, [r4, #0x54]
	movs r0, #2
	bl sub_803E248
	ldr r1, _08043158 @ =0x0203D908
	ldr r0, [r4, #0x48]
	strb r0, [r1]
	adds r0, r4, #0
	bl Proc_Break
_0804312A:
	ldr r1, [r5]
	movs r0, #2
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _0804314E
	movs r0, #1
	bl sub_803E248
	movs r0, #2
	bl FadeBgmOut
	ldr r1, _08043158 @ =0x0203D908
	movs r0, #0xff
	strb r0, [r1]
	adds r0, r4, #0
	bl Proc_Break
_0804314E:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08043154: .4byte gUnk_08C07EB0
_08043158: .4byte 0x0203D908
_0804315C: .4byte gUnk_08C08B00
_08043160: .4byte gUnk_081DB07C
_08043164: .4byte gpKeySt

	thumb_func_start sub_8043168
sub_8043168: @ 0x08043168
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	adds r5, r0, #0
	ldr r4, _08043214 @ =0x0203D908
	ldrb r0, [r4]
	cmp r0, #0xff
	bne _08043184
	adds r0, r5, #0
	bl Proc_Break
_08043184:
	ldrb r2, [r4]
	ldr r0, [r5, #0x54]
	cmp r0, #0x10
	bgt _080431F2
	movs r0, #4
	mov r8, r0
	lsls r2, r2, #1
	ldr r1, _08043218 @ =gUnk_081DB07C
	movs r4, #0x10
	mov sb, r4
	adds r0, r2, #1
	adds r0, r0, r1
	str r0, [sp, #4]
	adds r6, r5, #0
	adds r6, #0x3c
	adds r7, r1, #0
	adds r7, #8
	adds r2, r2, r1
	mov sl, r2
_080431AA:
	ldrb r1, [r7]
	ldr r3, [r5, #0x54]
	mov r0, sb
	str r0, [sp]
	movs r0, #4
	mov r4, sl
	ldrb r2, [r4]
	bl Interpolate
	adds r4, r0, #0
	ldrb r1, [r7, #1]
	ldr r0, [sp, #4]
	ldrb r2, [r0]
	ldr r3, [r5, #0x54]
	mov r0, sb
	str r0, [sp]
	movs r0, #4
	bl Interpolate
	adds r2, r0, #0
	ldr r0, [r6]
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	adds r1, r4, #0
	bl sub_80489C8
	subs r6, #4
	subs r7, #2
	movs r4, #1
	rsbs r4, r4, #0
	add r8, r4
	mov r0, r8
	cmp r0, #0
	bge _080431AA
_080431F2:
	ldr r0, [r5, #0x54]
	cmp r0, #0x20
	ble _080431FE
	adds r0, r5, #0
	bl Proc_Break
_080431FE:
	ldr r0, [r5, #0x54]
	adds r0, #1
	str r0, [r5, #0x54]
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08043214: .4byte 0x0203D908
_08043218: .4byte gUnk_081DB07C

	thumb_func_start sub_804321C
sub_804321C: @ 0x0804321C
	push {r4, r5, r6, lr}
	sub sp, #0x14
	adds r6, r0, #0
	mov r1, sp
	ldr r0, _0804326C @ =gUnk_081DB08C
	ldm r0!, {r2, r3, r4}
	stm r1!, {r2, r3, r4}
	ldm r0!, {r2, r3}
	stm r1!, {r2, r3}
	movs r0, #3
	bl EndFaceById
	adds r5, r6, #0
	adds r5, #0x2c
	movs r4, #4
_0804323A:
	ldm r5!, {r0}
	bl Proc_End
	subs r4, #1
	cmp r4, #0
	bge _0804323A
	ldr r1, _08043270 @ =0x0203D908
	ldrb r2, [r1]
	adds r0, r2, #0
	cmp r0, #0xff
	bne _08043278
	bl sub_802D864
	bl sub_8048494
	bl sub_803DEB4
	ldr r0, _08043274 @ =gUnk_08C025F8
	bl sub_8004748
	adds r0, r6, #0
	bl Proc_End
	b _08043288
	.align 2, 0
_0804326C: .4byte gUnk_081DB08C
_08043270: .4byte 0x0203D908
_08043274: .4byte gUnk_08C025F8
_08043278:
	strb r2, [r1, #1]
	ldrb r1, [r1]
	lsls r0, r1, #2
	add r0, sp
	ldr r0, [r0]
	adds r1, r6, #0
	bl Proc_StartBlocking
_08043288:
	add sp, #0x14
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	thumb_func_start sub_8043290
sub_8043290: @ 0x08043290
	push {r4, lr}
	adds r4, r0, #0
	bl UnpackUiWindowFrameGraphics
	ldr r0, _080432F8 @ =0x0203DA48
	ldr r1, _080432FC @ =0x06001800
	movs r2, #0xc0
	movs r3, #0
	bl InitTextFont
	movs r0, #5
	bl IsSaveValid
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080432B4
	bl sub_80A245C
_080432B4:
	ldr r1, _08043300 @ =0x0203D908
	movs r0, #0
	strb r0, [r1, #5]
	strb r0, [r1, #3]
	strb r0, [r1, #1]
	bl sub_803DEA4
	bl sub_80456C8
	bl StartBmVSync
	ldr r1, _08043304 @ =gPlaySt
	movs r0, #0xdf
	ldrb r2, [r1, #0x14]
	ands r0, r2
	strb r0, [r1, #0x14]
	adds r1, #0x41
	movs r0, #0xd
	rsbs r0, r0, #0
	ldrb r2, [r1]
	ands r0, r2
	strb r0, [r1]
	ldr r0, _08043308 @ =gUnk_08C08924
	adds r1, r4, #0
	bl Proc_StartBlocking
	ldr r0, _0804330C @ =gUnk_08C025F8
	movs r1, #3
	bl Proc_Start
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080432F8: .4byte 0x0203DA48
_080432FC: .4byte 0x06001800
_08043300: .4byte 0x0203D908
_08043304: .4byte gPlaySt
_08043308: .4byte gUnk_08C08924
_0804330C: .4byte gUnk_08C025F8

	thumb_func_start sub_8043310
sub_8043310: @ 0x08043310
	push {lr}
	adds r1, r0, #0
	ldr r0, _0804332C @ =gUnk_08C080F8
	bl Proc_StartBlocking
	adds r3, r0, #0
	adds r3, #0x33
	movs r2, #0
	movs r1, #7
	strb r1, [r3]
	adds r0, #0x32
	strb r2, [r0]
	pop {r0}
	bx r0
	.align 2, 0
_0804332C: .4byte gUnk_08C080F8

	thumb_func_start sub_8043330
sub_8043330: @ 0x08043330
	push {r4, lr}
	adds r4, r0, #0
	bl UnpackUiWindowFrameGraphics
	bl sub_803DEB4
	ldr r0, _0804337C @ =0x0203DA48
	ldr r1, _08043380 @ =0x06001800
	movs r2, #0xc0
	movs r3, #0
	bl InitTextFont
	ldr r1, _08043384 @ =0x0203D908
	movs r0, #0
	strb r0, [r1, #5]
	strb r0, [r1, #3]
	strb r0, [r1, #1]
	ldr r1, _08043388 @ =gPlaySt
	adds r1, #0x41
	subs r0, #0xd
	ldrb r2, [r1]
	ands r0, r2
	strb r0, [r1]
	ldr r0, _0804338C @ =gUnk_08C080F8
	adds r1, r4, #0
	bl Proc_StartBlocking
	adds r2, r0, #0
	adds r2, #0x33
	movs r1, #5
	strb r1, [r2]
	adds r0, #0x32
	movs r1, #1
	strb r1, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0804337C: .4byte 0x0203DA48
_08043380: .4byte 0x06001800
_08043384: .4byte 0x0203D908
_08043388: .4byte gPlaySt
_0804338C: .4byte gUnk_08C080F8

	thumb_func_start sub_8043390
sub_8043390: @ 0x08043390
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r5, r0, #0
	movs r4, #0
	ldr r0, _080433B8 @ =gUnk_08C07DF8
	bl Proc_Find
	cmp r0, #0
	beq _080433C0
	ldr r0, _080433BC @ =gpKeySt
	ldr r1, [r0]
	movs r0, #2
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _0804349C
	adds r0, r5, #0
	movs r1, #4
	b _08043458
	.align 2, 0
_080433B8: .4byte gUnk_08C07DF8
_080433BC: .4byte gpKeySt
_080433C0:
	ldr r0, _080433E0 @ =gUnk_08C07DAC
	ldr r2, [r0]
	movs r0, #6
	ldrsb r0, [r2, r0]
	cmp r0, #1
	bgt _080433DA
	adds r1, r0, #0
	adds r0, r2, #0
	adds r0, #0xb
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #2
	bne _080433E4
_080433DA:
	adds r0, r5, #0
	movs r1, #0
	b _08043458
	.align 2, 0
_080433E0: .4byte gUnk_08C07DAC
_080433E4:
	movs r1, #0
	adds r2, #0x1a
_080433E8:
	adds r0, r2, r1
	ldrb r0, [r0]
	cmp r0, #0x3c
	bls _080433F2
	adds r4, #1
_080433F2:
	adds r1, #1
	cmp r1, #3
	ble _080433E8
	bl sub_803D214
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08043410
	ldr r6, _08043418 @ =gUnk_08C07DAC
	ldr r2, [r6]
	ldrb r0, [r2, #0x1e]
	cmp r0, #0x3c
	bhi _08043410
	cmp r4, #0
	beq _0804341C
_08043410:
	adds r0, r5, #0
	movs r1, #0
	b _08043458
	.align 2, 0
_08043418: .4byte gUnk_08C07DAC
_0804341C:
	ldr r0, _08043460 @ =0x030045E0
	movs r1, #0xcc
	strb r1, [r0]
	ldrb r1, [r2, #6]
	strb r1, [r0, #1]
	ldrb r1, [r2]
	strh r1, [r0, #2]
	movs r1, #0xa
	bl sub_803D2E4
	ldr r0, [r6]
	ldrb r0, [r0, #6]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne _08043464
	bl IsExtraMapAvailable
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08043464
	mov r1, sp
	movs r0, #1
	strb r0, [r1]
	mov r0, sp
	movs r1, #4
	bl sub_803D724
	adds r0, r5, #0
	movs r1, #3
_08043458:
	bl sub_800D384
_0804345C:
	movs r0, #0
	b _0804349E
	.align 2, 0
_08043460: .4byte 0x030045E0
_08043464:
	ldr r4, _08043498 @ =gUnk_08C07DAC
	ldr r1, [r4]
	movs r0, #3
	ldrb r2, [r1, #9]
	ands r0, r2
	cmp r0, #3
	bne _0804349C
	strb r0, [r1, #9]
	bl sub_803DB24
	ldr r1, [r4]
	movs r2, #0
	movs r0, #6
	strh r0, [r1, #4]
	strb r2, [r1, #0x1e]
	ldr r0, [r4]
	ldrb r0, [r0, #6]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _0804345C
	adds r0, r5, #0
	movs r1, #1
	bl sub_800D384
	b _0804345C
	.align 2, 0
_08043498: .4byte gUnk_08C07DAC
_0804349C:
	movs r0, #1
_0804349E:
	add sp, #4
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_80434A8
sub_80434A8: @ 0x080434A8
	push {lr}
	adds r1, r0, #0
	ldr r0, _080434C4 @ =gUnk_08C07DAC
	ldr r0, [r0]
	ldrb r0, [r0, #9]
	cmp r0, #3
	bls _080434BE
	adds r0, r1, #0
	movs r1, #0
	bl sub_800D384
_080434BE:
	pop {r0}
	bx r0
	.align 2, 0
_080434C4: .4byte gUnk_08C07DAC

	thumb_func_start sub_80434C8
sub_80434C8: @ 0x080434C8
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	bl sub_8009E60
	cmp r0, #1
	bne _080434E0
	ldr r1, _080434DC @ =0x0203DC70
	movs r0, #0
	b _080434E4
	.align 2, 0
_080434DC: .4byte 0x0203DC70
_080434E0:
	ldr r1, _0804350C @ =0x0203DC70
	movs r0, #1
_080434E4:
	str r0, [r1]
	adds r4, r1, #0
	mov r0, sp
	ldr r1, [r4]
	strb r1, [r0]
	movs r1, #4
	bl sub_803D724
	ldr r0, [r4]
	cmp r0, #0
	beq _08043502
	adds r0, r5, #0
	movs r1, #5
	bl sub_800D384
_08043502:
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0804350C: .4byte 0x0203DC70

	thumb_func_start sub_8043510
sub_8043510: @ 0x08043510
	push {r4, r5, lr}
	sub sp, #8
	adds r5, r0, #0
	movs r4, #0
	movs r1, #0
	ldr r0, _08043558 @ =gUnk_08C07DAC
	ldr r0, [r0]
	adds r2, r0, #0
	adds r2, #0x1a
_08043522:
	adds r0, r2, r1
	ldrb r0, [r0]
	cmp r0, #0x3c
	bls _0804352C
	adds r4, #1
_0804352C:
	adds r1, #1
	cmp r1, #3
	ble _08043522
	bl sub_803D214
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0804354A
	ldr r0, _08043558 @ =gUnk_08C07DAC
	ldr r0, [r0]
	ldrb r0, [r0, #0x1e]
	cmp r0, #0x3c
	bhi _0804354A
	cmp r4, #0
	beq _0804355C
_0804354A:
	adds r0, r5, #0
	movs r1, #0
	bl sub_800D384
_08043552:
	movs r0, #0
	b _08043580
	.align 2, 0
_08043558: .4byte gUnk_08C07DAC
_0804355C:
	add r1, sp, #4
	mov r0, sp
	movs r2, #0
	bl sub_803D7CC
	lsls r0, r0, #0x10
	cmp r0, #0
	beq _0804357E
	mov r0, sp
	ldrb r0, [r0]
	cmp r0, #0
	beq _08043552
	adds r0, r5, #0
	movs r1, #5
	bl sub_800D384
	b _08043552
_0804357E:
	movs r0, #1
_08043580:
	add sp, #8
	pop {r4, r5}
	pop {r1}
	bx r1

	thumb_func_start sub_8043588
sub_8043588: @ 0x08043588
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r6, r2, #0
	bl ClearText
	adds r0, r4, #0
	movs r1, #0
	movs r2, #0
	adds r3, r5, #0
	bl Text_InsertDrawString
	adds r0, r4, #0
	movs r1, #0x36
	movs r2, #2
	adds r3, r6, #0
	bl sub_803DE14
	ldr r3, _080435C8 @ =gUnk_081DB0A0
	adds r0, r4, #0
	movs r1, #0x3e
	movs r2, #0
	bl Text_InsertDrawString
	ldr r1, _080435CC @ =gBg0Tm + 0x31e
	adds r0, r4, #0
	bl PutText
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080435C8: .4byte gUnk_081DB0A0
_080435CC: .4byte gBg0Tm + 0x31e

	thumb_func_start sub_80435D0
sub_80435D0: @ 0x080435D0
	push {r4, r5, lr}
	sub sp, #0xc
	adds r5, r0, #0
	adds r5, #0x3c
	adds r0, #0x3b
	ldrb r1, [r5]
	ldrb r0, [r0]
	cmp r1, r0
	bhs _08043628
	ldr r0, _08043630 @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080435F4
	movs r0, #0x7d
	bl m4aSongNumStart
_080435F4:
	ldrb r0, [r5]
	adds r0, #1
	strb r0, [r5]
	ldr r0, _08043634 @ =0x0203D96C
	ldr r1, _08043638 @ =gUnk_081DB0A4
	ldrb r2, [r5]
	bl sub_8043588
	movs r0, #0x80
	lsls r0, r0, #1
	ldr r2, _0804363C @ =gBg0Tm + 0x3dc
	movs r3, #0xc0
	lsls r3, r3, #7
	movs r1, #0x64
	str r1, [sp]
	ldrb r4, [r5]
	str r4, [sp, #4]
	ldrb r5, [r5]
	subs r1, r1, r5
	str r1, [sp, #8]
	movs r1, #0xe
	bl DrawStatBarGfx
	movs r0, #1
	bl EnableBgSync
_08043628:
	add sp, #0xc
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08043630: .4byte gPlaySt
_08043634: .4byte 0x0203D96C
_08043638: .4byte gUnk_081DB0A4
_0804363C: .4byte gBg0Tm + 0x3dc

	thumb_func_start sub_8043640
sub_8043640: @ 0x08043640
	push {r4, r5, lr}
	sub sp, #0xc
	adds r5, r0, #0
	adds r5, #0x3c
	adds r0, #0x3b
	ldrb r1, [r5]
	ldrb r0, [r0]
	cmp r1, r0
	bhs _08043698
	ldr r0, _080436A0 @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08043664
	movs r0, #0x7d
	bl m4aSongNumStart
_08043664:
	ldrb r0, [r5]
	adds r0, #1
	strb r0, [r5]
	ldr r0, _080436A4 @ =0x0203D96C
	ldr r1, _080436A8 @ =gUnk_081DB0AC
	ldrb r2, [r5]
	bl sub_8043588
	movs r0, #0x80
	lsls r0, r0, #1
	ldr r2, _080436AC @ =gBg0Tm + 0x3dc
	movs r3, #0xc0
	lsls r3, r3, #7
	movs r1, #0x64
	str r1, [sp]
	ldrb r4, [r5]
	str r4, [sp, #4]
	ldrb r5, [r5]
	subs r1, r1, r5
	str r1, [sp, #8]
	movs r1, #0xe
	bl DrawStatBarGfx
	movs r0, #1
	bl EnableBgSync
_08043698:
	add sp, #0xc
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080436A0: .4byte gPlaySt
_080436A4: .4byte 0x0203D96C
_080436A8: .4byte gUnk_081DB0AC
_080436AC: .4byte gBg0Tm + 0x3dc

	thumb_func_start sub_80436B0
sub_80436B0: @ 0x080436B0
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r6, r0, #0
	ldr r0, _080436F4 @ =0x0203DA48
	bl SetTextFont
	bl InitSystemTextFont
	ldr r0, _080436F8 @ =gUnk_08C07DAC
	ldr r0, [r0]
	ldrb r0, [r0, #6]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne _0804370C
	ldr r1, _080436FC @ =ReadSramFast
	ldr r0, _08043700 @ =0x0E007400
	ldr r4, _08043704 @ =gAnims
	movs r5, #0xc0
	lsls r5, r5, #4
	ldr r3, [r1]
	adds r1, r4, #0
	adds r2, r5, #0
	bl _call_via_r3
	ldr r2, _08043708 @ =sub_80435D0
	str r6, [sp]
	adds r0, r4, #0
	adds r1, r5, #0
	movs r3, #0
	bl sub_803DD20
	b _08043716
	.align 2, 0
_080436F4: .4byte 0x0203DA48
_080436F8: .4byte gUnk_08C07DAC
_080436FC: .4byte ReadSramFast
_08043700: .4byte 0x0E007400
_08043704: .4byte gAnims
_08043708: .4byte sub_80435D0
_0804370C:
	ldr r0, _08043720 @ =gAnims
	ldr r1, _08043724 @ =sub_8043640
	adds r2, r6, #0
	bl sub_803DDA0
_08043716:
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08043720: .4byte gAnims
_08043724: .4byte sub_8043640

	thumb_func_start sub_8043728
sub_8043728: @ 0x08043728
	push {lr}
	bl sub_803DDCC
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08043738
	movs r0, #1
	b _0804376A
_08043738:
	ldr r0, _08043770 @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0804374A
	movs r0, #0x7e
	bl m4aSongNumStart
_0804374A:
	bl InitTalkTextFont
	ldr r0, _08043774 @ =gUnk_08C07DAC
	ldr r0, [r0]
	ldrb r0, [r0, #6]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _08043768
	ldr r0, _08043778 @ =gAnims
	ldr r1, _0804377C @ =0x0E007400
	movs r2, #0xc0
	lsls r2, r2, #4
	bl WriteAndVerifySramFast
_08043768:
	movs r0, #0
_0804376A:
	pop {r1}
	bx r1
	.align 2, 0
_08043770: .4byte gPlaySt
_08043774: .4byte gUnk_08C07DAC
_08043778: .4byte gAnims
_0804377C: .4byte 0x0E007400

	thumb_func_start sub_8043780
sub_8043780: @ 0x08043780
	ldr r0, _08043790 @ =gUnk_08C07DAC
	ldr r2, [r0]
	movs r1, #6
	ldrsb r1, [r2, r1]
	movs r0, #1
	lsls r0, r1
	strb r0, [r2, #0xa]
	bx lr
	.align 2, 0
_08043790: .4byte gUnk_08C07DAC

	thumb_func_start sub_8043794
sub_8043794: @ 0x08043794
	push {r4, lr}
	ldr r0, _080437C0 @ =0x030046BC
	movs r2, #0
	movs r1, #0xc9
	strb r1, [r0]
	ldr r4, _080437C4 @ =gUnk_08C07DAC
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
	beq _080437C8
	movs r0, #1
	b _080437D4
	.align 2, 0
_080437C0: .4byte 0x030046BC
_080437C4: .4byte gUnk_08C07DAC
_080437C8:
	movs r1, #6
	ldrsb r1, [r4, r1]
	movs r0, #1
	lsls r0, r1
	strb r0, [r4, #0xa]
	movs r0, #0
_080437D4:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_80437DC
sub_80437DC: @ 0x080437DC
	push {r4, lr}
	sub sp, #0xc
	movs r0, #6
	bl sub_804A2DC
	movs r4, #0
	str r4, [sp]
	movs r0, #0xd
	movs r1, #0xb
	movs r2, #0x10
	movs r3, #6
	bl sub_804A4CC
	ldr r0, _08043830 @ =0x0203DA48
	bl SetTextFont
	bl InitSystemTextFont
	ldr r0, _08043834 @ =0x0203D96C
	ldr r1, _08043838 @ =gUnk_081DB0B4
	movs r2, #0
	bl sub_8043588
	movs r0, #0x80
	lsls r0, r0, #1
	ldr r2, _0804383C @ =gBg0Tm + 0x3dc
	movs r3, #0xc0
	lsls r3, r3, #7
	movs r1, #0x64
	str r1, [sp]
	str r4, [sp, #4]
	str r1, [sp, #8]
	movs r1, #0xd
	bl DrawStatBarGfx
	movs r0, #1
	bl EnableBgSync
	add sp, #0xc
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08043830: .4byte 0x0203DA48
_08043834: .4byte 0x0203D96C
_08043838: .4byte gUnk_081DB0B4
_0804383C: .4byte gBg0Tm + 0x3dc

	thumb_func_start sub_8043840
sub_8043840: @ 0x08043840
	ldr r2, _08043860 @ =gDispIo
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
	bx lr
	.align 2, 0
_08043860: .4byte gDispIo

	thumb_func_start sub_8043864
sub_8043864: @ 0x08043864
	push {r4, r5, lr}
	ldr r4, [r0, #0x14]
	movs r0, #3
	bl EndFaceById
	adds r5, r4, #0
	adds r5, #0x2c
	movs r4, #4
_08043874:
	ldm r5!, {r0}
	bl Proc_End
	subs r4, #1
	cmp r4, #0
	bge _08043874
	bl sub_8048320
	movs r0, #0
	movs r1, #0
	bl sub_80483C0
	ldr r0, _080438B4 @ =gUnk_08C07DAC
	ldr r1, [r0]
	movs r0, #3
	strb r0, [r1]
	ldr r0, _080438B8 @ =0x0203DA48
	bl SetTextFont
	bl InitSystemTextFont
	ldr r0, _080438BC @ =0x0203D96C
	movs r1, #0xa
	bl sub_800536C
	movs r0, #1
	bl FadeBgmOut
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080438B4: .4byte gUnk_08C07DAC
_080438B8: .4byte 0x0203DA48
_080438BC: .4byte 0x0203D96C

	thumb_func_start sub_80438C0
sub_80438C0: @ 0x080438C0
	push {lr}
	adds r1, r0, #0
	ldr r0, _080438D8 @ =gUnk_08C07DAC
	ldr r2, [r0]
	movs r0, #3
	strb r0, [r2]
	ldr r0, _080438DC @ =gUnk_08C089E4
	bl sub_800AEA4
	pop {r0}
	bx r0
	.align 2, 0
_080438D8: .4byte gUnk_08C07DAC
_080438DC: .4byte gUnk_08C089E4

	thumb_func_start sub_80438E0
sub_80438E0: @ 0x080438E0
	push {lr}
	bl sub_803E080
	bl sub_8040D1C
	bl sub_8040D40
	bl sub_803C8C8
	bl LoadAndVerfySuspendSave
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_80438FC
sub_80438FC: @ 0x080438FC
	push {r4, lr}
	adds r4, r0, #0
	bl sub_8009E60
	cmp r0, #1
	beq _08043910
	adds r0, r4, #0
	movs r1, #1
	bl sub_800D384
_08043910:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_8043918
sub_8043918: @ 0x08043918
	push {r4, lr}
	adds r4, r0, #0
	bl sub_8009E60
	cmp r0, #1
	bne _0804393A
	bl InitGlobalSaveInfo
	bl sub_809F098
	bl sub_809FC30
	bl sub_80A00A4
	bl sub_80A01C8
	b _08043942
_0804393A:
	adds r0, r4, #0
	movs r1, #1
	bl sub_800D384
_08043942:
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_8043948
sub_8043948: @ 0x08043948
	push {lr}
	adds r1, r0, #0
	ldr r0, _08043958 @ =gUnk_08C08B80
	bl sub_800AEA4
	pop {r0}
	bx r0
	.align 2, 0
_08043958: .4byte gUnk_08C08B80

	thumb_func_start sub_804395C
sub_804395C: @ 0x0804395C
	push {lr}
	sub sp, #4
	ldr r3, _08043978 @ =gUnk_08C08BC4
	movs r0, #0
	str r0, [sp]
	movs r0, #4
	movs r1, #0x38
	movs r2, #4
	bl sub_8006884
	add sp, #4
	pop {r0}
	bx r0
	.align 2, 0
_08043978: .4byte gUnk_08C08BC4

	thumb_func_start sub_804397C
sub_804397C: @ 0x0804397C
	ldr r1, _080439B0 @ =0x02000C04
	movs r3, #0
	movs r2, #1
	strb r2, [r1, #1]
	strb r3, [r1, #2]
	strb r2, [r1, #3]
	movs r0, #0x16
	strb r0, [r1, #5]
	movs r0, #0xa
	strb r0, [r1, #6]
	movs r0, #0x18
	strb r0, [r1, #7]
	strb r3, [r1, #9]
	strb r2, [r1, #0xa]
	strb r2, [r1, #0xb]
	ldr r0, _080439B4 @ =0x00001FA4
	str r0, [r1, #0xc]
	ldr r0, _080439B8 @ =0x00000BB8
	str r0, [r1, #0x10]
	movs r0, #0x96
	lsls r0, r0, #5
	str r0, [r1, #0x14]
	movs r0, #2
	strb r0, [r1, #4]
	bx lr
	.align 2, 0
_080439B0: .4byte 0x02000C04
_080439B4: .4byte 0x00001FA4
_080439B8: .4byte 0x00000BB8

	thumb_func_start sub_80439BC
sub_80439BC: @ 0x080439BC
	push {r4, r5, r6, lr}
	sub sp, #0x18
	adds r6, r0, #0
	ldr r1, _08043B58 @ =gUnk_081DB0BC
	mov r0, sp
	movs r2, #0x18
	bl memcpy
	mov r0, sp
	bl InitBgs
	ldr r3, _08043B5C @ =gDispIo
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
	bl sub_8048494
	ldr r4, _08043B60 @ =gUnk_081D7CF0
	movs r0, #1
	bl GetBgChrOffset
	adds r1, r0, #0
	ldr r2, _08043B64 @ =0x06000C00
	adds r1, r1, r2
	adds r0, r4, #0
	bl Decompress
	ldr r0, _08043B68 @ =gUnk_081D7F74
	movs r1, #0x80
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r0, _08043B6C @ =gUnk_081D7F94
	ldr r1, _08043B70 @ =0x06014000
	bl Decompress
	ldr r0, _08043B74 @ =gUnk_081D83B0
	movs r1, #0x98
	lsls r1, r1, #2
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r4, _08043B78 @ =gBg1Tm
	ldr r1, _08043B7C @ =gUnk_081D7E20
	ldr r5, _08043B80 @ =0x00004060
	adds r0, r4, #0
	adds r2, r5, #0
	bl TmApplyTsa_thm
	movs r0, #0x88
	lsls r0, r0, #3
	adds r4, r4, r0
	ldr r1, _08043B84 @ =gUnk_081D7EBC
	adds r0, r4, #0
	adds r2, r5, #0
	bl TmApplyTsa_thm
	ldr r4, _08043B88 @ =gUnk_081D3AF0
	movs r0, #3
	bl GetBgChrOffset
	adds r1, r0, #0
	movs r2, #0xc0
	lsls r2, r2, #0x13
	adds r1, r1, r2
	adds r0, r4, #0
	bl Decompress
	ldr r0, _08043B8C @ =gUnk_081D768C
	ldr r4, _08043B90 @ =gBg3Tm
	adds r1, r4, #0
	bl Decompress
	ldr r0, _08043B94 @ =gUnk_081D7BF0
	movs r2, #0x80
	lsls r2, r2, #1
	movs r1, #0xe0
	bl ApplyPaletteExt
	movs r0, #0xe0
	lsls r0, r0, #7
	adds r1, r0, #0
	movs r5, #0xa0
	lsls r5, r5, #2
_08043A88:
	ldrh r2, [r4]
	adds r0, r1, r2
	strh r0, [r4]
	adds r4, #2
	subs r5, #1
	cmp r5, #0
	bne _08043A88
	ldr r0, _08043B98 @ =gUnk_08C08BCC
	adds r1, r6, #0
	bl Proc_Start
	ldr r0, _08043B9C @ =0x0203DA48
	bl SetTextFont
	bl InitSystemTextFont
	bl ResetTextFont
	ldr r4, _08043BA0 @ =0x0203DBF0
	adds r0, r4, #0
	movs r1, #0x18
	bl InitText
	adds r0, r4, #0
	bl ClearText
	ldr r0, _08043BA4 @ =0x00001184
	bl DecodeMsg
	adds r3, r0, #0
	adds r0, r4, #0
	movs r1, #0
	movs r2, #0
	bl Text_InsertDrawString
	ldr r1, _08043BA8 @ =gBg0Tm + 0x48e
	adds r0, r4, #0
	bl PutText
	movs r0, #0xb
	bl EnableBgSync
	movs r0, #0
	movs r1, #0
	movs r2, #4
	bl SetBgOffset
	ldr r3, _08043B5C @ =gDispIo
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
	movs r1, #8
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r0, #1
	strb r5, [r0]
	ldr r0, _08043BAC @ =0x0000FFE0
	ldrh r2, [r3, #0x3c]
	ands r0, r2
	movs r1, #2
	orrs r0, r1
	ldr r1, _08043BB0 @ =0x0000E0FF
	ands r0, r1
	movs r2, #0x80
	lsls r2, r2, #4
	adds r1, r2, #0
	orrs r0, r1
	strh r0, [r3, #0x3c]
	bl SoundVSyncOff_rev01
	ldr r0, _08043BB4 @ =0x030045D0
	ldr r1, _08043BB8 @ =gUnk_08DBAD14
	str r1, [r0]
	ldr r2, _08043BBC @ =0x0300466C
	ldr r0, _08043BC0 @ =gUnk_08DC0390
	subs r0, r0, r1
	str r0, [r2]
	ldr r0, _08043BC4 @ =0x03004670
	str r1, [r0, #0x28]
	adds r1, r0, #0
	adds r1, #0x4b
	strb r5, [r1]
	bl sub_8049BD0
	ldr r0, _08043BC8 @ =gUnk_08C07DAC
	ldr r1, [r0]
	movs r0, #4
	strb r0, [r1, #0xb]
	adds r0, r6, #0
	adds r0, #0x64
	strh r5, [r0]
	add sp, #0x18
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08043B58: .4byte gUnk_081DB0BC
_08043B5C: .4byte gDispIo
_08043B60: .4byte gUnk_081D7CF0
_08043B64: .4byte 0x06000C00
_08043B68: .4byte gUnk_081D7F74
_08043B6C: .4byte gUnk_081D7F94
_08043B70: .4byte 0x06014000
_08043B74: .4byte gUnk_081D83B0
_08043B78: .4byte gBg1Tm
_08043B7C: .4byte gUnk_081D7E20
_08043B80: .4byte 0x00004060
_08043B84: .4byte gUnk_081D7EBC
_08043B88: .4byte gUnk_081D3AF0
_08043B8C: .4byte gUnk_081D768C
_08043B90: .4byte gBg3Tm
_08043B94: .4byte gUnk_081D7BF0
_08043B98: .4byte gUnk_08C08BCC
_08043B9C: .4byte 0x0203DA48
_08043BA0: .4byte 0x0203DBF0
_08043BA4: .4byte 0x00001184
_08043BA8: .4byte gBg0Tm + 0x48e
_08043BAC: .4byte 0x0000FFE0
_08043BB0: .4byte 0x0000E0FF
_08043BB4: .4byte 0x030045D0
_08043BB8: .4byte gUnk_08DBAD14
_08043BBC: .4byte 0x0300466C
_08043BC0: .4byte gUnk_08DC0390
_08043BC4: .4byte 0x03004670
_08043BC8: .4byte gUnk_08C07DAC

	thumb_func_start sub_8043BCC
sub_8043BCC: @ 0x08043BCC
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r7, r0, #0
	movs r2, #1
	ldr r5, _08043BEC @ =0x03004670
	movs r4, #1
	ldr r3, _08043BF0 @ =gUnk_08C07DAC
_08043BDA:
	ldrb r1, [r5, #0x1d]
	asrs r1, r2
	ands r1, r4
	cmp r1, #0
	bne _08043BF4
	ldr r0, [r3]
	adds r0, #0xb
	adds r0, r0, r2
	b _08043C10
	.align 2, 0
_08043BEC: .4byte 0x03004670
_08043BF0: .4byte gUnk_08C07DAC
_08043BF4:
	ldrb r0, [r5, #0x1e]
	asrs r0, r2
	ands r0, r4
	cmp r0, #0
	bne _08043C08
	ldr r0, [r3]
	adds r0, #0xb
	adds r0, r0, r2
	strb r4, [r0]
	b _08043C12
_08043C08:
	ldr r0, [r3]
	adds r0, #0xb
	adds r0, r0, r2
	movs r1, #3
_08043C10:
	strb r1, [r0]
_08043C12:
	adds r2, #1
	cmp r2, #3
	ble _08043BDA
	adds r0, r7, #0
	adds r0, #0x64
	movs r2, #0
	ldrsh r1, [r0, r2]
	adds r6, r0, #0
	cmp r1, #0
	bne _08043C48
	ldr r0, _08043C44 @ =gpKeySt
	ldr r1, [r0]
	movs r0, #2
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _08043C48
	movs r0, #1
	bl sub_803E248
	adds r0, r7, #0
	movs r1, #0xb
	bl Proc_Goto
	b _08043CB2
	.align 2, 0
_08043C44: .4byte gpKeySt
_08043C48:
	adds r4, r6, #0
	movs r0, #0
	ldrsh r3, [r4, r0]
	cmp r3, #1
	bne _08043C6C
	ldr r0, _08043CBC @ =0x03004670
	ldr r1, _08043CC0 @ =0x030045D0
	ldr r1, [r1]
	adds r1, #0xc0
	ldr r2, _08043CC4 @ =0x0300466C
	ldr r2, [r2]
	subs r2, #0xc0
	str r3, [sp]
	movs r3, #4
	bl sub_804A068
	movs r0, #2
	strh r0, [r4]
_08043C6C:
	ldr r4, _08043CBC @ =0x03004670
	adds r0, r4, #0
	bl sub_8049C0C
	movs r1, #0
	ldrsh r0, [r6, r1]
	cmp r0, #0
	bne _08043CA2
	ldrb r0, [r4, #0x18]
	cmp r0, #0
	bne _08043CA2
	ldrb r5, [r4, #0x1e]
	cmp r5, #2
	bne _08043CA2
	ldr r0, _08043CC0 @ =0x030045D0
	ldr r1, [r0]
	adds r1, #0xc0
	ldr r0, _08043CC4 @ =0x0300466C
	ldr r2, [r0]
	subs r2, #0xc0
	movs r0, #1
	str r0, [sp]
	adds r0, r4, #0
	movs r3, #4
	bl sub_804A068
	strh r5, [r6]
_08043CA2:
	ldr r0, _08043CBC @ =0x03004670
	bl sub_804A12C
	cmp r0, #0
	beq _08043CB2
	adds r0, r7, #0
	bl Proc_Break
_08043CB2:
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08043CBC: .4byte 0x03004670
_08043CC0: .4byte 0x030045D0
_08043CC4: .4byte 0x0300466C

	thumb_func_start sub_8043CC8
sub_8043CC8: @ 0x08043CC8
	push {r4, lr}
	sub sp, #4
	adds r4, r0, #0
	ldr r1, _08043D04 @ =0x00002586
	mov r0, sp
	strh r1, [r0]
	ldr r0, _08043D08 @ =gUnk_08C07E20
	movs r1, #0
	bl Proc_Start
	ldr r0, _08043D0C @ =gUnk_08C07E48
	adds r1, r4, #0
	bl Proc_Start
	ldr r0, _08043D10 @ =gUnk_08C07DF8
	adds r1, r4, #0
	bl Proc_Start
	movs r1, #1
	rsbs r1, r1, #0
	mov r0, sp
	bl sub_803D594
	bl SoundVSyncOn_rev01
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08043D04: .4byte 0x00002586
_08043D08: .4byte gUnk_08C07E20
_08043D0C: .4byte gUnk_08C07E48
_08043D10: .4byte gUnk_08C07DF8

	thumb_func_start sub_8043D14
sub_8043D14: @ 0x08043D14
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	movs r4, #0
	ldr r0, _08043D60 @ =gUnk_08C07DF8
	bl Proc_Find
	cmp r0, #0
	bne _08043DA4
	movs r1, #0
	ldr r0, _08043D64 @ =gUnk_08C07DAC
	ldr r0, [r0]
	adds r2, r0, #0
	adds r2, #0x1a
_08043D2E:
	adds r0, r2, r1
	ldrb r0, [r0]
	cmp r0, #0x3c
	bls _08043D38
	adds r4, #1
_08043D38:
	adds r1, #1
	cmp r1, #3
	ble _08043D2E
	bl sub_803D214
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08043D56
	ldr r5, _08043D64 @ =gUnk_08C07DAC
	ldr r2, [r5]
	ldrb r0, [r2, #0x1e]
	cmp r0, #0x3c
	bhi _08043D56
	cmp r4, #0
	beq _08043D68
_08043D56:
	adds r0, r6, #0
	movs r1, #0xa
	bl Proc_Goto
	b _08043DA4
	.align 2, 0
_08043D60: .4byte gUnk_08C07DF8
_08043D64: .4byte gUnk_08C07DAC
_08043D68:
	ldr r0, _08043DAC @ =0x030045E0
	movs r1, #0xcc
	strb r1, [r0]
	ldrb r1, [r2, #6]
	strb r1, [r0, #1]
	ldrb r1, [r2]
	strh r1, [r0, #2]
	movs r1, #0xa
	bl sub_803D2E4
	ldr r1, [r5]
	movs r0, #3
	ldrb r2, [r1, #9]
	ands r0, r2
	cmp r0, #3
	bne _08043DA4
	strb r0, [r1, #9]
	bl sub_803DB24
	ldr r0, [r5]
	movs r1, #6
	strh r1, [r0, #4]
	movs r1, #0
	strb r1, [r0, #0x1e]
	movs r0, #3
	bl sub_803D9B0
	adds r0, r6, #0
	bl Proc_Break
_08043DA4:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08043DAC: .4byte 0x030045E0

	thumb_func_start sub_8043DB0
sub_8043DB0: @ 0x08043DB0
	push {lr}
	ldr r0, _08043DD4 @ =gUnk_08C07E20
	bl sub_8004748
	ldr r0, _08043DD8 @ =gUnk_08C07E48
	bl sub_8004748
	ldr r0, _08043DDC @ =gUnk_08C07DF8
	bl sub_8004748
	bl sub_803C9AC
	bl CloseHelpBox
	bl sub_803C8C8
	pop {r0}
	bx r0
	.align 2, 0
_08043DD4: .4byte gUnk_08C07E20
_08043DD8: .4byte gUnk_08C07E48
_08043DDC: .4byte gUnk_08C07DF8

	thumb_func_start sub_8043DE0
sub_8043DE0: @ 0x08043DE0
	push {lr}
	ldr r2, _08043DF0 @ =gUnk_081DB0D4
	movs r0, #8
	movs r1, #0x10
	bl sub_80051E8
	pop {r0}
	bx r0
	.align 2, 0
_08043DF0: .4byte gUnk_081DB0D4

	thumb_func_start sub_8043DF4
sub_8043DF4: @ 0x08043DF4
	ldrb r0, [r0]
	cmp r0, #2
	bgt _08043E02
	cmp r0, #0
	blt _08043E02
	movs r0, #1
	b _08043E04
_08043E02:
	movs r0, #0
_08043E04:
	bx lr
	.align 2, 0

	thumb_func_start sub_8043E08
sub_8043E08: @ 0x08043E08
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	ldr r4, _08043E30 @ =0x02000C00
	ldr r2, _08043E34 @ =sub_8043DF4
	adds r0, r4, #0
	mov r1, sp
	bl sub_803D7CC
	lsls r0, r0, #0x10
	cmp r0, #0
	beq _08043E5A
	ldrb r0, [r4]
	cmp r0, #0
	bne _08043E38
	adds r0, r5, #0
	bl Proc_Break
	b _08043E5A
	.align 2, 0
_08043E30: .4byte 0x02000C00
_08043E34: .4byte sub_8043DF4
_08043E38:
	cmp r0, #0
	blt _08043E5A
	cmp r0, #2
	bgt _08043E5A
	ldr r0, _08043E64 @ =0x06015000
	movs r1, #6
	bl LoadHelpBoxGfx
	ldr r2, _08043E68 @ =0x0000118A
	movs r0, #0x38
	movs r1, #0x38
	bl StartHelpBoxExt_Unk
	adds r0, r5, #0
	movs r1, #0xa
	bl Proc_Goto
_08043E5A:
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08043E64: .4byte 0x06015000
_08043E68: .4byte 0x0000118A

	thumb_func_start sub_8043E6C
sub_8043E6C: @ 0x08043E6C
	ldrb r0, [r0]
	cmp r0, #0x55
	beq _08043E76
	movs r0, #0
	b _08043E78
_08043E76:
	movs r0, #1
_08043E78:
	bx lr
	.align 2, 0

	thumb_func_start sub_8043E7C
sub_8043E7C: @ 0x08043E7C
	push {r4, r5, lr}
	sub sp, #4
	adds r4, r0, #0
	ldr r5, _08043EB8 @ =0x02000C04
	ldr r2, _08043EBC @ =sub_8043E6C
	adds r0, r5, #0
	mov r1, sp
	bl sub_803D7CC
	lsls r0, r0, #0x10
	cmp r0, #0
	beq _08043ED2
	ldrb r0, [r5, #4]
	cmp r0, #0
	bne _08043EC8
	ldr r0, _08043EC0 @ =0x06015000
	movs r1, #6
	bl LoadHelpBoxGfx
	ldr r2, _08043EC4 @ =0x0000118B
	movs r0, #0x38
	movs r1, #0x38
	bl StartHelpBoxExt_Unk
	adds r0, r4, #0
	movs r1, #0xa
	bl Proc_Goto
	b _08043ED2
	.align 2, 0
_08043EB8: .4byte 0x02000C04
_08043EBC: .4byte sub_8043E6C
_08043EC0: .4byte 0x06015000
_08043EC4: .4byte 0x0000118B
_08043EC8:
	movs r0, #0
	str r0, [r4, #0x58]
	adds r0, r4, #0
	bl Proc_Break
_08043ED2:
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_8043EDC
sub_8043EDC: @ 0x08043EDC
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	ldr r4, [r5, #0x54]
	ldr r0, _08043F50 @ =gpKeySt
	ldr r1, [r0]
	movs r0, #0x40
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _08043F00
	ldr r0, [r4, #0x44]
	cmp r0, #0
	ble _08043F00
	subs r0, #1
	str r0, [r4, #0x44]
	movs r0, #3
	bl sub_803E248
_08043F00:
	ldr r0, _08043F50 @ =gpKeySt
	ldr r1, [r0]
	movs r0, #0x80
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _08043F1E
	ldr r0, [r4, #0x44]
	cmp r0, #1
	bgt _08043F1E
	adds r0, #1
	str r0, [r4, #0x44]
	movs r0, #3
	bl sub_803E248
_08043F1E:
	ldr r0, _08043F50 @ =gpKeySt
	ldr r1, [r0]
	movs r6, #1
	adds r0, r6, #0
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _08043F5E
	ldr r0, _08043F54 @ =0x02000C04
	adds r0, #1
	ldr r1, [r4, #0x44]
	adds r1, r1, r0
	ldrb r0, [r1]
	cmp r0, #0
	beq _08043F58
	movs r0, #2
	bl sub_803E248
	str r6, [r4, #0x50]
	ldr r0, [r4, #0x44]
	str r0, [r5, #0x60]
	adds r0, r5, #0
	bl Proc_Break
	b _08043F5E
	.align 2, 0
_08043F50: .4byte gpKeySt
_08043F54: .4byte 0x02000C04
_08043F58:
	movs r0, #0
	bl sub_803E248
_08043F5E:
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	thumb_func_start sub_8043F64
sub_8043F64: @ 0x08043F64
	ldrb r0, [r0]
	cmp r0, #0x66
	beq _08043F6E
	movs r0, #0
	b _08043F70
_08043F6E:
	movs r0, #1
_08043F70:
	bx lr
	.align 2, 0

	thumb_func_start sub_8043F74
sub_8043F74: @ 0x08043F74
	push {r4, r5, lr}
	sub sp, #0x28
	adds r5, r0, #0
	ldr r4, _08043FD4 @ =0x02000C1C
	add r1, sp, #0x24
	ldr r2, _08043FD8 @ =sub_8043F64
	adds r0, r4, #0
	bl sub_803D7CC
	lsls r0, r0, #0x10
	cmp r0, #0
	beq _08043FFA
	bl CloseHelpBox
	movs r0, #0
	bl sub_803D9B0
	ldr r0, _08043FDC @ =0x06016800
	movs r1, #0xd
	bl LoadHelpBoxGfx
	ldr r2, _08043FE0 @ =0x0000118C
	movs r0, #0x40
	movs r1, #0x48
	bl StartHelpBoxExt_Unk
	mov r0, sp
	bl sub_809FA3C
	adds r3, r4, #4
	mov r2, sp
	movs r1, #7
_08043FB4:
	ldm r3!, {r0}
	stm r2!, {r0}
	subs r1, #1
	cmp r1, #0
	bge _08043FB4
	ldr r1, _08043FE4 @ =0x02000C04
	adds r1, #5
	ldr r0, [r5, #0x60]
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #0x19
	bne _08043FE8
	mov r1, sp
	movs r0, #2
	b _08043FEC
	.align 2, 0
_08043FD4: .4byte 0x02000C1C
_08043FD8: .4byte sub_8043F64
_08043FDC: .4byte 0x06016800
_08043FE0: .4byte 0x0000118C
_08043FE4: .4byte 0x02000C04
_08043FE8:
	mov r1, sp
	movs r0, #1
_08043FEC:
	strh r0, [r1, #0x20]
	mov r0, sp
	bl sub_809FA94
	adds r0, r5, #0
	bl Proc_Break
_08043FFA:
	add sp, #0x28
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_8044004
sub_8044004: @ 0x08044004
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x18
	mov sb, r0
	adds r7, r1, #0
	mov sl, r3
	lsls r2, r2, #0x18
	lsrs r4, r2, #0x18
	str r4, [sp, #0x10]
	movs r6, #0
	cmp r7, #0
	bne _08044024
	b _0804415A
_08044024:
	cmp r7, #0x32
	bne _08044058
	ldr r7, _08044054 @ =0x0000117D
	adds r0, r7, #0
	bl DecodeMsg
	bl GetStringTextLen
	adds r5, r0, #0
	cmp r4, #0
	beq _08044040
	movs r0, #0x30
	subs r0, r0, r5
	asrs r6, r0, #1
_08044040:
	adds r0, r7, #0
	bl DecodeMsg
	adds r3, r0, #0
	mov r0, sb
	adds r1, r6, #0
	mov r2, sl
	bl Text_InsertDrawString
	b _0804415A
	.align 2, 0
_08044054: .4byte 0x0000117D
_08044058:
	ldr r0, _0804416C @ =0x0000117A
	bl DecodeMsg
	bl GetStringTextLen
	str r0, [sp]
	adds r5, r0, #0
	asrs r4, r7, #1
	adds r0, r4, #0
	movs r1, #0xa
	bl __divsi3
	mov r8, r0
	adds r0, r4, #0
	movs r1, #0xa
	bl __modsi3
	adds r4, r0, #0
	mov r0, r8
	cmp r0, #0
	beq _08044098
	ldr r1, _08044170 @ =gUnk_08C08BDC
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	bl DecodeMsg
	bl GetStringTextLen
	subs r0, #1
	str r0, [sp, #4]
	adds r5, r5, r0
_08044098:
	lsls r0, r4, #1
	ldr r1, _08044170 @ =gUnk_08C08BDC
	adds r0, r0, r1
	str r0, [sp, #0x14]
	ldrh r0, [r0]
	bl DecodeMsg
	bl GetStringTextLen
	subs r0, #1
	str r0, [sp, #8]
	adds r5, r5, r0
	ldr r0, _08044174 @ =0x0000117B
	bl DecodeMsg
	bl GetStringTextLen
	str r0, [sp, #0xc]
	adds r5, r5, r0
	movs r4, #1
	ands r4, r7
	cmp r4, #0
	beq _080440D2
	ldr r0, _08044178 @ =0x0000117C
	bl DecodeMsg
	bl GetStringTextLen
	adds r5, r5, r0
_080440D2:
	ldr r2, [sp, #0x10]
	cmp r2, #0
	beq _080440DE
	movs r0, #0x30
	subs r0, r0, r5
	asrs r6, r0, #1
_080440DE:
	ldr r0, _0804416C @ =0x0000117A
	bl DecodeMsg
	adds r3, r0, #0
	mov r0, sb
	adds r1, r6, #0
	mov r2, sl
	bl Text_InsertDrawString
	ldr r0, [sp]
	adds r6, r6, r0
	mov r0, r8
	cmp r0, #0
	beq _08044116
	lsls r0, r0, #1
	ldr r1, _08044170 @ =gUnk_08C08BDC
	adds r0, r0, r1
	ldrh r0, [r0]
	bl DecodeMsg
	adds r3, r0, #0
	mov r0, sb
	adds r1, r6, #0
	mov r2, sl
	bl Text_InsertDrawString
	ldr r0, [sp, #4]
	adds r6, r6, r0
_08044116:
	ldr r2, [sp, #0x14]
	ldrh r0, [r2]
	bl DecodeMsg
	adds r3, r0, #0
	mov r0, sb
	adds r1, r6, #0
	mov r2, sl
	bl Text_InsertDrawString
	ldr r0, [sp, #8]
	adds r6, r6, r0
	ldr r0, _08044174 @ =0x0000117B
	bl DecodeMsg
	adds r3, r0, #0
	mov r0, sb
	adds r1, r6, #0
	mov r2, sl
	bl Text_InsertDrawString
	ldr r0, [sp, #0xc]
	adds r6, r6, r0
	cmp r4, #0
	beq _0804415A
	ldr r0, _08044178 @ =0x0000117C
	bl DecodeMsg
	adds r3, r0, #0
	mov r0, sb
	adds r1, r6, #0
	mov r2, sl
	bl Text_InsertDrawString
_0804415A:
	add sp, #0x18
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0804416C: .4byte 0x0000117A
_08044170: .4byte gUnk_08C08BDC
_08044174: .4byte 0x0000117B
_08044178: .4byte 0x0000117C

	thumb_func_start sub_804417C
sub_804417C: @ 0x0804417C
	push {r4, r5, r6, r7, lr}
	adds r6, r0, #0
	adds r7, r1, #0
	ldr r0, _080441CC @ =gUnk_08C08BF0
	lsls r2, r2, #2
	adds r5, r2, r0
	ldrh r4, [r5, #2]
	adds r0, r6, #0
	adds r1, r4, #0
	movs r2, #1
	adds r3, r7, #0
	bl sub_8044004
	ldrh r0, [r5]
	bl DecodeMsg
	bl GetStringTextLen
	movs r1, #0x46
	subs r1, r1, r0
	lsrs r0, r1, #0x1f
	adds r1, r1, r0
	asrs r1, r1, #1
	cmp r4, #0
	bne _080441B0
	subs r1, #0x20
_080441B0:
	adds r4, r1, #0
	adds r4, #0x28
	ldrh r0, [r5]
	bl DecodeMsg
	adds r3, r0, #0
	adds r0, r6, #0
	adds r1, r4, #0
	adds r2, r7, #0
	bl Text_InsertDrawString
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080441CC: .4byte gUnk_08C08BF0

	thumb_func_start sub_80441D0
sub_80441D0: @ 0x080441D0
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08044210 @ =0x00001188
	bl DecodeMsg
	adds r3, r0, #0
	adds r0, r4, #0
	movs r1, #0
	movs r2, #0
	bl Text_InsertDrawString
	movs r0, #1
	bl DecodeMsg
	adds r3, r0, #0
	adds r0, r4, #0
	movs r1, #0x80
	movs r2, #0
	bl Text_InsertDrawString
	movs r0, #2
	bl DecodeMsg
	adds r3, r0, #0
	adds r0, r4, #0
	movs r1, #0xb0
	movs r2, #0
	bl Text_InsertDrawString
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08044210: .4byte 0x00001188

	thumb_func_start sub_8044214
sub_8044214: @ 0x08044214
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	adds r6, r0, #0
	ldr r0, _080442F8 @ =gUnk_081D83D0
	ldr r1, _080442FC @ =0x06012800
	bl Decompress
	ldr r0, _08044300 @ =gUnk_081D8E2C
	movs r1, #0xa0
	lsls r1, r1, #2
	movs r2, #0xc0
	bl ApplyPaletteExt
	ldr r0, _08044304 @ =0x02000C60
	ldr r1, _08044308 @ =0x06015000
	movs r2, #0xe
	bl InitSpriteTextFont
	ldr r0, _0804430C @ =Pal_Text
	movs r1, #0xd0
	lsls r1, r1, #2
	movs r2, #0x20
	bl ApplyPaletteExt
	movs r0, #0
	bl SetTextFontGlyphs
	bl ResetTextFont
	movs r5, #0
	ldr r0, _08044310 @ =0x02000C04
	mov r8, r0
	movs r1, #5
	add r1, r8
	mov sb, r1
_0804425E:
	lsls r0, r5, #2
	adds r2, r6, #0
	adds r2, #0x2c
	adds r2, r2, r0
	mov r0, r8
	adds r0, #9
	adds r0, r5, r0
	ldrb r0, [r0]
	lsls r1, r0, #1
	adds r1, #1
	mov r0, r8
	adds r0, #1
	adds r0, r5, r0
	ldrb r3, [r0]
	subs r1, r1, r3
	str r1, [r2]
	ldrb r0, [r0]
	movs r7, #1
	cmp r0, #0
	beq _08044288
	movs r7, #0
_08044288:
	lsls r4, r5, #3
	ldr r0, _08044314 @ =0x02000C40
	adds r4, r4, r0
	adds r0, r4, #0
	bl InitSpriteText
	adds r0, r4, #0
	movs r1, #0
	bl SpriteText_DrawBackgroundExt
	mov r1, sb
	adds r0, r5, r1
	ldrb r2, [r0]
	adds r0, r4, #0
	adds r1, r7, #0
	bl sub_804417C
	lsls r2, r5, #1
	adds r0, r6, #0
	adds r0, #0x38
	adds r0, r0, r2
	movs r1, #0x18
	strh r1, [r0]
	adds r1, r6, #0
	adds r1, #0x3e
	adds r1, r1, r2
	lsls r0, r5, #5
	adds r0, #0x20
	strh r0, [r1]
	adds r5, #1
	cmp r5, #2
	ble _0804425E
	ldr r4, _08044318 @ =0x02000C58
	adds r0, r4, #0
	bl InitSpriteText
	adds r0, r4, #0
	movs r1, #0
	bl SpriteText_DrawBackgroundExt
	adds r0, r4, #0
	bl sub_80441D0
	movs r0, #0
	str r0, [r6, #0x48]
	str r0, [r6, #0x44]
	str r0, [r6, #0x54]
	str r0, [r6, #0x50]
	str r0, [r6, #0x4c]
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080442F8: .4byte gUnk_081D83D0
_080442FC: .4byte 0x06012800
_08044300: .4byte gUnk_081D8E2C
_08044304: .4byte 0x02000C60
_08044308: .4byte 0x06015000
_0804430C: .4byte Pal_Text
_08044310: .4byte 0x02000C04
_08044314: .4byte 0x02000C40
_08044318: .4byte 0x02000C58

	thumb_func_start sub_804431C
sub_804431C: @ 0x0804431C
	push {r4, r5, r6, lr}
	sub sp, #0xc
	mov r6, sp
	adds r6, #6
	add r5, sp, #8
	add r1, sp, #4
	adds r2, r6, #0
	adds r3, r5, #0
	bl FormatTime
	add r0, sp, #4
	ldrh r0, [r0]
	cmp r0, #0x63
	bls _08044344
	add r0, sp, #4
	movs r1, #0x63
	strh r1, [r0]
	movs r0, #0x3b
	strh r0, [r5]
	strh r0, [r6]
_08044344:
	ldrh r0, [r5]
	movs r1, #0xa
	bl DivRem
	ldr r4, _08044404 @ =gUnk_08C08CE0
	str r0, [sp]
	movs r0, #4
	movs r1, #0xd8
	movs r2, #0x90
	adds r3, r4, #0
	bl sub_8006884
	ldrh r0, [r5]
	movs r1, #0xa
	bl Div
	str r0, [sp]
	movs r0, #4
	movs r1, #0xd0
	movs r2, #0x90
	adds r3, r4, #0
	bl sub_8006884
	movs r5, #0xa
	str r5, [sp]
	movs r0, #4
	movs r1, #0xc8
	movs r2, #0x90
	adds r3, r4, #0
	bl sub_8006884
	ldrh r0, [r6]
	movs r1, #0xa
	bl DivRem
	ldr r4, _08044408 @ =gUnk_08C08CD8
	str r0, [sp]
	movs r0, #4
	movs r1, #0xc0
	movs r2, #0x88
	adds r3, r4, #0
	bl sub_8006884
	ldrh r0, [r6]
	movs r1, #0xa
	bl Div
	str r0, [sp]
	movs r0, #4
	movs r1, #0xb8
	movs r2, #0x88
	adds r3, r4, #0
	bl sub_8006884
	str r5, [sp]
	movs r0, #4
	movs r1, #0xb0
	movs r2, #0x88
	adds r3, r4, #0
	bl sub_8006884
	add r0, sp, #4
	ldrh r0, [r0]
	movs r1, #0xa
	bl DivRem
	str r0, [sp]
	movs r0, #4
	movs r1, #0xa8
	movs r2, #0x88
	adds r3, r4, #0
	bl sub_8006884
	add r0, sp, #4
	ldrh r0, [r0]
	movs r1, #0xa
	bl Div
	cmp r0, #0
	ble _080443FC
	add r0, sp, #4
	ldrh r0, [r0]
	movs r1, #0xa
	bl Div
	str r0, [sp]
	movs r0, #4
	movs r1, #0xa0
	movs r2, #0x88
	adds r3, r4, #0
	bl sub_8006884
_080443FC:
	add sp, #0xc
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08044404: .4byte gUnk_08C08CE0
_08044408: .4byte gUnk_08C08CD8

	thumb_func_start sub_804440C
sub_804440C: @ 0x0804440C
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #4
	adds r6, r0, #0
	movs r7, #0
	movs r0, #0x38
	adds r0, r0, r6
	mov r8, r0
	movs r2, #0x3e
	adds r2, r2, r6
	mov sb, r2
_08044426:
	lsls r0, r7, #1
	adds r5, r6, #0
	adds r5, #0x38
	adds r5, r5, r0
	movs r2, #0
	ldrsh r1, [r5, r2]
	adds r4, r6, #0
	adds r4, #0x3e
	adds r4, r4, r0
	movs r0, #0
	ldrsh r2, [r4, r0]
	lsls r3, r7, #2
	adds r0, r6, #0
	adds r0, #0x2c
	adds r0, r0, r3
	ldr r0, [r0]
	movs r3, #0xf
	ands r0, r3
	lsls r0, r0, #0xc
	str r0, [sp]
	movs r0, #4
	ldr r3, _080444BC @ =gUnk_08C08CC4
	bl sub_8006884
	movs r2, #0
	ldrsh r1, [r5, r2]
	adds r1, #0x28
	movs r0, #0
	ldrsh r2, [r4, r0]
	adds r2, #8
	lsls r0, r7, #6
	str r0, [sp]
	movs r0, #4
	ldr r3, _080444C0 @ =gUnk_08C08C98
	bl sub_8006884
	adds r7, #1
	cmp r7, #2
	ble _08044426
	ldr r1, _080444C4 @ =0x02000C04
	ldr r0, [r6, #0x44]
	lsls r0, r0, #2
	adds r1, #0xc
	adds r0, r0, r1
	ldr r0, [r0]
	bl sub_804431C
	ldr r1, [r6, #0x44]
	lsls r1, r1, #1
	mov r2, r8
	adds r0, r2, r1
	movs r2, #0
	ldrsh r0, [r0, r2]
	adds r0, #0x10
	add r1, sb
	movs r2, #0
	ldrsh r1, [r1, r2]
	adds r1, #8
	bl DisplayUiHand
	ldr r0, [r6, #0x50]
	cmp r0, #1
	bne _080444AE
	movs r0, #0
	str r0, [r6, #0x54]
	adds r0, r6, #0
	bl Proc_Break
_080444AE:
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080444BC: .4byte gUnk_08C08CC4
_080444C0: .4byte gUnk_08C08C98
_080444C4: .4byte 0x02000C04

	thumb_func_start sub_80444C8
sub_80444C8: @ 0x080444C8
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	adds r5, r0, #0
	movs r0, #0
	mov r8, r0
	movs r7, #0
_080444D8:
	ldr r0, [r5, #0x44]
	cmp r8, r0
	beq _08044506
	adds r0, r5, #0
	adds r0, #0x38
	adds r0, r0, r7
	movs r2, #0
	ldrsh r1, [r0, r2]
	ldr r3, [r5, #0x54]
	movs r0, #0x10
	str r0, [sp]
	movs r0, #5
	movs r2, #0xa0
	lsls r2, r2, #1
	bl Interpolate
	adds r6, r0, #0
	adds r0, r5, #0
	adds r0, #0x3e
	adds r0, r0, r7
	movs r3, #0
	ldrsh r4, [r0, r3]
	b _0804452C
_08044506:
	adds r0, r5, #0
	adds r0, #0x38
	adds r0, r0, r7
	movs r1, #0
	ldrsh r6, [r0, r1]
	adds r0, r5, #0
	adds r0, #0x3e
	adds r0, r0, r7
	movs r2, #0
	ldrsh r1, [r0, r2]
	movs r3, #0x3e
	ldrsh r2, [r5, r3]
	ldr r3, [r5, #0x54]
	movs r0, #0x10
	str r0, [sp]
	movs r0, #4
	bl Interpolate
	adds r4, r0, #0
_0804452C:
	mov r0, r8
	lsls r1, r0, #2
	adds r0, r5, #0
	adds r0, #0x2c
	adds r0, r0, r1
	ldr r0, [r0]
	movs r1, #0xf
	ands r0, r1
	lsls r0, r0, #0xc
	str r0, [sp]
	movs r0, #4
	adds r1, r6, #0
	adds r2, r4, #0
	ldr r3, _0804459C @ =gUnk_08C08CC4
	bl sub_8006884
	adds r1, r6, #0
	adds r1, #0x28
	adds r2, r4, #0
	adds r2, #8
	mov r3, r8
	lsls r0, r3, #6
	str r0, [sp]
	movs r0, #4
	ldr r3, _080445A0 @ =gUnk_08C08C98
	bl sub_8006884
	adds r7, #2
	movs r0, #1
	add r8, r0
	mov r1, r8
	cmp r1, #2
	ble _080444D8
	ldr r1, _080445A4 @ =0x02000C04
	ldr r0, [r5, #0x44]
	lsls r0, r0, #2
	adds r1, #0xc
	adds r0, r0, r1
	ldr r0, [r0]
	bl sub_804431C
	ldr r0, [r5, #0x50]
	cmp r0, #2
	bne _0804458E
	movs r0, #0
	str r0, [r5, #0x54]
	adds r0, r5, #0
	bl Proc_Break
_0804458E:
	ldr r0, [r5, #0x54]
	cmp r0, #0xf
	bgt _080445A8
	adds r0, #1
	str r0, [r5, #0x54]
	b _080445AC
	.align 2, 0
_0804459C: .4byte gUnk_08C08CC4
_080445A0: .4byte gUnk_08C08C98
_080445A4: .4byte 0x02000C04
_080445A8:
	movs r0, #0
	str r0, [r5, #0x50]
_080445AC:
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_80445B8
sub_80445B8: @ 0x080445B8
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	adds r5, r0, #0
	movs r0, #0
	mov r8, r0
	movs r7, #0
_080445C8:
	ldr r0, [r5, #0x44]
	cmp r8, r0
	beq _080445F4
	adds r0, r5, #0
	adds r0, #0x38
	adds r0, r0, r7
	movs r1, #0
	ldrsh r2, [r0, r1]
	ldr r3, [r5, #0x54]
	movs r0, #0x10
	str r0, [sp]
	movs r0, #5
	movs r1, #0xf0
	bl Interpolate
	adds r6, r0, #0
	adds r0, r5, #0
	adds r0, #0x3e
	adds r0, r0, r7
	movs r3, #0
	ldrsh r4, [r0, r3]
	b _0804461A
_080445F4:
	adds r0, r5, #0
	adds r0, #0x38
	adds r0, r0, r7
	movs r1, #0
	ldrsh r6, [r0, r1]
	movs r3, #0x3e
	ldrsh r1, [r5, r3]
	adds r0, r5, #0
	adds r0, #0x3e
	adds r0, r0, r7
	movs r3, #0
	ldrsh r2, [r0, r3]
	ldr r3, [r5, #0x54]
	movs r0, #0x10
	str r0, [sp]
	movs r0, #4
	bl Interpolate
	adds r4, r0, #0
_0804461A:
	mov r0, r8
	lsls r1, r0, #2
	adds r0, r5, #0
	adds r0, #0x2c
	adds r0, r0, r1
	ldr r0, [r0]
	movs r1, #0xf
	ands r0, r1
	lsls r0, r0, #0xc
	str r0, [sp]
	movs r0, #4
	adds r1, r6, #0
	adds r2, r4, #0
	ldr r3, _08044678 @ =gUnk_08C08CC4
	bl sub_8006884
	adds r1, r6, #0
	adds r1, #0x28
	adds r2, r4, #0
	adds r2, #8
	mov r3, r8
	lsls r0, r3, #6
	str r0, [sp]
	movs r0, #4
	ldr r3, _0804467C @ =gUnk_08C08C98
	bl sub_8006884
	adds r7, #2
	movs r0, #1
	add r8, r0
	mov r1, r8
	cmp r1, #2
	ble _080445C8
	ldr r0, _08044680 @ =0x02000C04
	ldr r1, [r5, #0x44]
	lsls r1, r1, #2
	adds r0, #0xc
	adds r1, r1, r0
	ldr r0, [r1]
	bl sub_804431C
	ldr r0, [r5, #0x54]
	cmp r0, #0xf
	bgt _08044684
	adds r0, #1
	str r0, [r5, #0x54]
	b _08044692
	.align 2, 0
_08044678: .4byte gUnk_08C08CC4
_0804467C: .4byte gUnk_08C08C98
_08044680: .4byte 0x02000C04
_08044684:
	movs r0, #0
	str r0, [r5, #0x54]
	str r0, [r5, #0x50]
	adds r0, r5, #0
	movs r1, #0
	bl Proc_Goto
_08044692:
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_80446A0
sub_80446A0: @ 0x080446A0
	push {lr}
	adds r1, r0, #0
	ldr r0, _080446B0 @ =gUnk_08C08CE8
	bl Proc_Start
	pop {r1}
	bx r1
	.align 2, 0
_080446B0: .4byte gUnk_08C08CE8

	thumb_func_start sub_80446B4
sub_80446B4: @ 0x080446B4
	push {r4, lr}
	sub sp, #0xc
	adds r4, r0, #0
	bl ApplySystemGraphics
	adds r0, r4, #0
	bl sub_80AD968
	ldr r0, _080446FC @ =gUnk_08C08BCC
	bl sub_8004748
	adds r0, r4, #0
	bl sub_80446A0
	str r0, [r4, #0x54]
	bl UnpackUiWindowFrameGraphics
	ldr r0, _08044700 @ =gBg1Tm
	movs r1, #4
	str r1, [sp]
	movs r1, #0
	str r1, [sp, #4]
	str r1, [sp, #8]
	movs r1, #0x12
	movs r2, #0x10
	movs r3, #0xb
	bl sub_804A360
	movs r0, #0xf
	bl EnableBgSync
	add sp, #0xc
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080446FC: .4byte gUnk_08C08BCC
_08044700: .4byte gBg1Tm

	thumb_func_start sub_8044704
sub_8044704: @ 0x08044704
	push {lr}
	adds r1, r0, #0
	ldr r0, [r1, #0x54]
	ldr r0, [r0, #0x50]
	cmp r0, #0
	bne _08044716
	adds r0, r1, #0
	bl Proc_Break
_08044716:
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_804471C
sub_804471C: @ 0x0804471C
	push {r4, r5, lr}
	sub sp, #0xc
	adds r5, r0, #0
	ldr r0, _0804474C @ =gBg1Tm
	movs r1, #6
	str r1, [sp]
	movs r4, #0
	str r4, [sp, #4]
	str r4, [sp, #8]
	movs r1, #2
	movs r2, #9
	movs r3, #0x10
	bl sub_804A360
	movs r0, #2
	bl EnableBgSync
	adds r5, #0x68
	strh r4, [r5]
	add sp, #0xc
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0804474C: .4byte gBg1Tm

	thumb_func_start sub_8044750
sub_8044750: @ 0x08044750
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r5, r0, #0
	ldr r7, [r5, #0x54]
	ldr r4, _080447A8 @ =gUnk_08C08D18
	movs r0, #0
	str r0, [sp]
	movs r0, #4
	movs r1, #0x18
	movs r2, #0x50
	adds r3, r4, #0
	bl sub_8006884
	movs r0, #0x10
	str r0, [sp]
	movs r0, #4
	movs r1, #0x30
	movs r2, #0x60
	adds r3, r4, #0
	bl sub_8006884
	adds r4, r5, #0
	adds r4, #0x68
	movs r0, #0
	ldrsh r1, [r4, r0]
	movs r0, #0x34
	muls r0, r1, r0
	adds r0, #0x28
	movs r1, #0x60
	bl DisplayUiHand
	ldr r0, _080447AC @ =gpKeySt
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r6, #2
	adds r0, r6, #0
	ands r0, r1
	cmp r0, #0
	beq _080447B0
	movs r0, #1
	bl sub_803E248
	str r6, [r7, #0x50]
	b _08044812
	.align 2, 0
_080447A8: .4byte gUnk_08C08D18
_080447AC: .4byte gpKeySt
_080447B0:
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	beq _080447C8
	ldrh r0, [r4]
	cmp r0, #1
	bne _080447C8
	subs r0, #1
	strh r0, [r4]
	movs r0, #3
	bl sub_803E248
_080447C8:
	ldr r0, _0804482C @ =gpKeySt
	ldr r1, [r0]
	movs r0, #0x10
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _080447EE
	adds r1, r5, #0
	adds r1, #0x68
	ldrh r2, [r1]
	movs r3, #0
	ldrsh r0, [r1, r3]
	cmp r0, #0
	bne _080447EE
	adds r0, r2, #1
	strh r0, [r1]
	movs r0, #3
	bl sub_803E248
_080447EE:
	ldr r0, _0804482C @ =gpKeySt
	ldr r1, [r0]
	movs r0, #1
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _08044872
	adds r0, r5, #0
	adds r0, #0x68
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	beq _08044834
	movs r0, #1
	bl sub_803E248
	movs r0, #2
	str r0, [r7, #0x50]
_08044812:
	ldr r0, _08044830 @ =gBg1Tm + 0x244
	movs r1, #0x10
	movs r2, #6
	movs r3, #0
	bl TmFillRect_thm
	movs r0, #2
	bl EnableBgSync
	adds r0, r5, #0
	bl Proc_Break
	b _08044872
	.align 2, 0
_0804482C: .4byte gpKeySt
_08044830: .4byte gBg1Tm + 0x244
_08044834:
	movs r0, #2
	bl sub_803E248
	ldr r0, _0804487C @ =0x02000C00
	ldr r1, [r7, #0x44]
	strb r1, [r0]
	movs r1, #4
	bl sub_803D724
	ldr r0, _08044880 @ =gBg1Tm + 0x244
	movs r1, #0x10
	movs r2, #6
	movs r3, #0
	bl TmFillRect_thm
	movs r0, #2
	bl EnableBgSync
	ldr r0, _08044884 @ =0x06016800
	movs r1, #0xd
	bl LoadHelpBoxGfx
	ldr r2, _08044888 @ =0x00001189
	movs r0, #0x40
	movs r1, #0x48
	bl StartHelpBoxExt_Unk
	adds r0, r5, #0
	movs r1, #3
	bl Proc_Goto
_08044872:
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0804487C: .4byte 0x02000C00
_08044880: .4byte gBg1Tm + 0x244
_08044884: .4byte 0x06016800
_08044888: .4byte 0x00001189

	thumb_func_start sub_804488C
sub_804488C: @ 0x0804488C
	push {lr}
	adds r2, r0, #0
	ldr r0, _080448A8 @ =gpKeySt
	ldr r1, [r0]
	movs r0, #9
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _080448A4
	adds r0, r2, #0
	bl Proc_Break
_080448A4:
	pop {r0}
	bx r0
	.align 2, 0
_080448A8: .4byte gpKeySt

	thumb_func_start sub_80448AC
sub_80448AC: @ 0x080448AC
	push {lr}
	bl SoundVSyncOn_rev01
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_80448B8
sub_80448B8: @ 0x080448B8
	push {r4, lr}
	adds r4, r0, #0
	bl UnpackUiWindowFrameGraphics
	ldr r0, _080448DC @ =0x0203DA48
	ldr r1, _080448E0 @ =0x06001800
	movs r2, #0xc0
	movs r3, #0
	bl InitTextFont
	ldr r0, _080448E4 @ =gUnk_08C08D34
	adds r1, r4, #0
	bl Proc_StartBlocking
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080448DC: .4byte 0x0203DA48
_080448E0: .4byte 0x06001800
_080448E4: .4byte gUnk_08C08D34

	thumb_func_start sub_80448E8
sub_80448E8: @ 0x080448E8
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	mov r8, r0
	ldr r0, _0804492C @ =0x0203D908
	adds r1, r0, #0
	adds r1, #0xa0
	ldrb r3, [r1]
	adds r0, #0xec
	movs r1, #2
	ldrb r0, [r0]
	ands r1, r0
	cmp r1, #0
	beq _08044934
	movs r6, #0
	cmp r6, r3
	bge _0804498E
	ldr r4, _08044930 @ =0x0203DC83
	adds r5, r4, #5
	mov r2, r8
_08044910:
	adds r1, r6, r4
	ldrb r0, [r1]
	strb r0, [r2]
	ldrb r1, [r1]
	lsls r0, r1, #2
	adds r0, r0, r5
	ldr r0, [r0]
	str r0, [r2, #4]
	adds r2, #8
	adds r6, #1
	cmp r6, r3
	blt _08044910
	b _0804498E
	.align 2, 0
_0804492C: .4byte 0x0203D908
_08044930: .4byte 0x0203DC83
_08044934:
	movs r6, #0
	subs r0, r3, #2
	mov ip, r0
	cmp r6, r3
	bge _08044954
	ldr r0, _08044958 @ =0x0203DC74
	adds r2, r0, #0
	adds r2, #0x14
	mov r1, r8
_08044946:
	strb r6, [r1]
	ldm r2!, {r0}
	str r0, [r1, #4]
	adds r1, #8
	adds r6, #1
	cmp r6, r3
	blt _08044946
_08044954:
	movs r6, #0
	b _08044988
	.align 2, 0
_08044958: .4byte 0x0203DC74
_0804495C:
	adds r5, r0, #0
	adds r7, r6, #1
	cmp r0, r6
	blt _08044986
	lsls r0, r0, #3
	mov r1, r8
	adds r2, r0, r1
_0804496A:
	ldr r4, [r2, #4]
	ldr r3, [r2, #0xc]
	cmp r4, r3
	bhs _0804497E
	ldrb r1, [r2]
	ldrb r0, [r2, #8]
	strb r0, [r2]
	strb r1, [r2, #8]
	str r3, [r2, #4]
	str r4, [r2, #0xc]
_0804497E:
	subs r2, #8
	subs r5, #1
	cmp r5, r6
	bge _0804496A
_08044986:
	adds r6, r7, #0
_08044988:
	mov r0, ip
	cmp r6, r0
	ble _0804495C
_0804498E:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_8044998
sub_8044998: @ 0x08044998
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	adds r5, r1, #0
	lsls r0, r2, #5
	adds r0, r0, r5
	lsls r0, r0, #1
	ldr r1, _080449E4 @ =gBg1Tm
	adds r0, r0, r1
	movs r1, #0
	adds r4, r2, #1
_080449AC:
	adds r2, r1, #1
	movs r1, #5
_080449B0:
	strh r3, [r0]
	adds r0, #2
	adds r3, #1
	subs r1, #1
	cmp r1, #0
	bge _080449B0
	adds r0, #0x34
	adds r1, r2, #0
	cmp r1, #3
	ble _080449AC
	adds r0, r6, #0
	bl ClearText
	lsls r0, r4, #5
	adds r0, #4
	adds r0, r0, r5
	lsls r0, r0, #1
	ldr r1, _080449E8 @ =gBg0Tm
	adds r0, r0, r1
	movs r1, #2
	ldr r2, [sp, #0x10]
	bl sub_8006068
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080449E4: .4byte gBg1Tm
_080449E8: .4byte gBg0Tm

	thumb_func_start sub_80449EC
sub_80449EC: @ 0x080449EC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	adds r4, r0, #0
	ldr r0, _08044AAC @ =gUnk_081CD248
	ldr r1, _08044AB0 @ =0x06002800
	bl Decompress
	ldr r0, _08044AB4 @ =gUnk_081CD798
	movs r1, #0x40
	movs r2, #0x80
	bl ApplyPaletteExt
	movs r0, #0
	bl SetTextFont
	bl ResetTextFont
	movs r0, #0
	mov sb, r0
	ldr r0, _08044AB8 @ =gUnk_081DB0D8
	mov sl, r0
	adds r6, r4, #0
	adds r6, #0x2c
	ldr r7, _08044ABC @ =gUnk_081DB148
_08044A24:
	ldr r0, _08044AC0 @ =gUnk_08C07DAC
	ldr r0, [r0]
	ldrb r0, [r0, #6]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r0, r0, #2
	add r0, sb
	add r0, sl
	ldrb r5, [r0]
	adds r0, r5, #0
	bl sub_803D1CC
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08044A88
	ldr r0, _08044AC4 @ =0x0203DC74
	mov r8, r0
	adds r0, #0xa
	adds r0, r5, r0
	ldrb r0, [r0]
	adds r4, r5, #2
	cmp r0, #0
	bne _08044A5C
	lsls r1, r4, #5
	ldr r0, _08044AC8 @ =gUnk_081CD9F8
	movs r2, #0x20
	bl ApplyPaletteExt
_08044A5C:
	movs r0, #0xf
	ands r4, r0
	lsls r4, r4, #0xc
	movs r0, #0xa0
	lsls r0, r0, #1
	adds r4, r4, r0
	adds r0, r6, #0
	movs r1, #4
	bl sub_800536C
	ldrb r1, [r7]
	ldrb r2, [r7, #1]
	lsls r0, r5, #2
	mov r3, r8
	adds r3, #0x14
	adds r0, r0, r3
	ldr r0, [r0]
	str r0, [sp]
	adds r0, r6, #0
	adds r3, r4, #0
	bl sub_8044998
_08044A88:
	adds r6, #8
	adds r7, #2
	movs r0, #1
	add sb, r0
	mov r0, sb
	cmp r0, #3
	ble _08044A24
	movs r0, #3
	bl EnableBgSync
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08044AAC: .4byte gUnk_081CD248
_08044AB0: .4byte 0x06002800
_08044AB4: .4byte gUnk_081CD798
_08044AB8: .4byte gUnk_081DB0D8
_08044ABC: .4byte gUnk_081DB148
_08044AC0: .4byte gUnk_08C07DAC
_08044AC4: .4byte 0x0203DC74
_08044AC8: .4byte gUnk_081CD9F8

	thumb_func_start nullsub_44
nullsub_44: @ 0x08044ACC
	bx lr
	.align 2, 0

	thumb_func_start sub_8044AD0
sub_8044AD0: @ 0x08044AD0
	push {lr}
	movs r0, #0
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	movs r0, #1
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	ldr r0, _08044AF4 @ =gUnk_08C08E34
	movs r1, #3
	bl Proc_Start
	pop {r0}
	bx r0
	.align 2, 0
_08044AF4: .4byte gUnk_08C08E34

	thumb_func_start sub_8044AF8
sub_8044AF8: @ 0x08044AF8
	push {lr}
	ldr r0, _08044B08 @ =gUnk_08C08E34
	bl sub_8004748
	bl ClearBg0Bg1
	pop {r0}
	bx r0
	.align 2, 0
_08044B08: .4byte gUnk_08C08E34

	thumb_func_start sub_8044B0C
sub_8044B0C: @ 0x08044B0C
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r0, #0x33
	ldrb r0, [r0]
	bl GetUnit
	adds r4, r0, #0
	ldr r1, _08044B5C @ =gUnk_081DB0E8
	adds r2, r5, #0
	adds r2, #0x32
	ldr r0, _08044B60 @ =gUnk_08C07DAC
	ldr r0, [r0]
	ldrb r0, [r0, #6]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r0, r0, #2
	ldrb r2, [r2]
	adds r0, r2, r0
	adds r0, r0, r1
	ldrb r2, [r0]
	adds r0, r5, #0
	adds r0, #0x40
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _08044B64
	ldrb r0, [r4, #0x10]
	movs r0, #0x10
	ldrsb r0, [r4, r0]
	lsls r0, r0, #4
	subs r0, #0x10
	strh r0, [r5, #0x2a]
	movs r0, #0x11
	ldrsb r0, [r4, r0]
	lsls r0, r0, #4
	strh r0, [r5, #0x2c]
	lsls r2, r2, #1
	b _08044B8C
	.align 2, 0
_08044B5C: .4byte gUnk_081DB0E8
_08044B60: .4byte gUnk_08C07DAC
_08044B64:
	movs r1, #0x10
	ldrsb r1, [r4, r1]
	lsls r1, r1, #4
	ldr r3, _08044BC8 @ =gUnk_08C08E4C
	lsls r0, r2, #3
	adds r0, r0, r3
	ldr r0, [r0]
	adds r0, r0, r1
	subs r0, #0xc
	strh r0, [r5, #0x2a]
	movs r1, #0x11
	ldrsb r1, [r4, r1]
	lsls r1, r1, #4
	lsls r2, r2, #1
	adds r0, r2, #1
	lsls r0, r0, #2
	adds r0, r0, r3
	ldrh r0, [r0]
	adds r1, r0, r1
	strh r1, [r5, #0x2c]
_08044B8C:
	ldr r1, _08044BCC @ =gUnk_081DB148
	adds r0, r2, r1
	ldrb r0, [r0]
	lsls r0, r0, #3
	adds r0, #8
	movs r4, #0
	strh r0, [r5, #0x2e]
	adds r0, r2, #1
	adds r0, r0, r1
	ldrb r0, [r0]
	lsls r0, r0, #3
	adds r0, #8
	strh r0, [r5, #0x30]
	ldr r0, _08044BD0 @ =0x02000C60
	bl SetTextFont
	ldr r0, _08044BD4 @ =0x02000C78
	adds r1, r5, #0
	adds r1, #0x32
	ldrb r1, [r1]
	lsls r1, r1, #5
	adds r1, #0x18
	ldr r3, [r5, #0x34]
	movs r2, #2
	bl sub_803DE14
	str r4, [r5, #0x3c]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08044BC8: .4byte gUnk_08C08E4C
_08044BCC: .4byte gUnk_081DB148
_08044BD0: .4byte 0x02000C60
_08044BD4: .4byte 0x02000C78

	thumb_func_start sub_8044BD8
sub_8044BD8: @ 0x08044BD8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	adds r7, r0, #0
	adds r0, #0x33
	ldrb r0, [r0]
	bl GetUnit
	str r0, [sp, #4]
	ldr r3, [r7, #0x3c]
	cmp r3, #0x10
	bhi _08044C6C
	movs r0, #0x80
	lsls r0, r0, #1
	mov r8, r0
	movs r0, #0x10
	str r0, [sp]
	movs r0, #1
	movs r1, #0x10
	mov r2, r8
	bl Interpolate
	mov sl, r0
	ldr r4, _08044C9C @ =gSinLut
	movs r1, #0x80
	adds r1, r1, r4
	mov sb, r1
	movs r2, #0
	ldrsh r0, [r1, r2]
	lsls r0, r0, #4
	mov r1, r8
	bl Div
	adds r6, r0, #0
	lsls r6, r6, #0x10
	asrs r6, r6, #0x10
	movs r1, #0
	ldrsh r0, [r4, r1]
	rsbs r0, r0, #0
	lsls r0, r0, #4
	mov r1, sl
	bl Div
	adds r5, r0, #0
	lsls r5, r5, #0x10
	asrs r5, r5, #0x10
	movs r2, #0
	ldrsh r0, [r4, r2]
	lsls r0, r0, #4
	mov r1, r8
	bl Div
	adds r4, r0, #0
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	mov r1, sb
	movs r2, #0
	ldrsh r0, [r1, r2]
	lsls r0, r0, #4
	mov r1, sl
	bl Div
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	str r0, [sp]
	movs r0, #0
	adds r1, r6, #0
	adds r2, r5, #0
	adds r3, r4, #0
	bl SetObjAffine
_08044C6C:
	adds r0, r7, #0
	adds r0, #0x40
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _08044CBE
	ldr r1, [r7, #0x3c]
	cmp r1, #3
	bls _08044CBE
	cmp r1, #0x16
	bhi _08044CBE
	subs r1, #4
	ldr r4, [sp, #4]
	ldrb r4, [r4, #0x10]
	cmp r4, #8
	bne _08044CA4
	ldr r0, _08044CA0 @ =gUnk_08C08E6C
	lsls r1, r1, #1
	adds r0, r1, r0
	ldrh r2, [r7, #0x2a]
	ldrh r0, [r0]
	adds r0, r2, r0
	b _08044CB0
	.align 2, 0
_08044C9C: .4byte gSinLut
_08044CA0: .4byte gUnk_08C08E6C
_08044CA4:
	ldr r0, _08044D04 @ =gUnk_08C08E6C
	lsls r1, r1, #1
	adds r0, r1, r0
	ldrh r4, [r7, #0x2a]
	ldrh r0, [r0]
	subs r0, r4, r0
_08044CB0:
	strh r0, [r7, #0x2a]
	ldr r0, _08044D08 @ =gUnk_08C08E92
	adds r0, r1, r0
	ldrh r1, [r7, #0x2c]
	ldrh r0, [r0]
	subs r0, r1, r0
	strh r0, [r7, #0x2c]
_08044CBE:
	movs r2, #0x2a
	ldrsh r0, [r7, r2]
	movs r4, #0x2c
	ldrsh r1, [r7, r4]
	movs r2, #0x80
	lsls r2, r2, #1
	adds r1, r1, r2
	ldr r2, _08044D0C @ =Sprite_64x32
	adds r3, r7, #0
	adds r3, #0x32
	ldrb r3, [r3]
	lsls r3, r3, #2
	ldr r4, _08044D10 @ =0x00009340
	adds r3, r3, r4
	bl PutOamHiRam
	ldr r0, [r7, #0x3c]
	adds r0, #1
	str r0, [r7, #0x3c]
	cmp r0, #0x40
	bls _08044CF2
	movs r0, #0
	str r0, [r7, #0x3c]
	adds r0, r7, #0
	bl Proc_Break
_08044CF2:
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08044D04: .4byte gUnk_08C08E6C
_08044D08: .4byte gUnk_08C08E92
_08044D0C: .4byte Sprite_64x32
_08044D10: .4byte 0x00009340

	thumb_func_start sub_8044D14
sub_8044D14: @ 0x08044D14
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r6, r0, #0
	movs r0, #0x2a
	ldrsh r1, [r6, r0]
	movs r0, #0x2e
	ldrsh r2, [r6, r0]
	ldr r3, [r6, #0x3c]
	movs r4, #0x30
	str r4, [sp]
	movs r0, #5
	bl Interpolate
	adds r5, r0, #0
	movs r0, #0x2c
	ldrsh r1, [r6, r0]
	movs r0, #0x30
	ldrsh r2, [r6, r0]
	ldr r3, [r6, #0x3c]
	str r4, [sp]
	movs r0, #5
	bl Interpolate
	adds r1, r0, #0
	ldr r2, _08044D70 @ =Sprite_64x32
	adds r0, r6, #0
	adds r0, #0x32
	ldrb r0, [r0]
	lsls r3, r0, #2
	ldr r0, _08044D74 @ =0x00009340
	adds r3, r3, r0
	adds r0, r5, #0
	bl PutOamHiRam
	ldr r0, [r6, #0x3c]
	adds r0, #1
	str r0, [r6, #0x3c]
	cmp r0, #0x20
	bls _08044D68
	adds r0, r6, #0
	bl Proc_Break
_08044D68:
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08044D70: .4byte Sprite_64x32
_08044D74: .4byte 0x00009340

	thumb_func_start sub_8044D78
sub_8044D78: @ 0x08044D78
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	adds r5, r0, #0
	mov r8, r1
	adds r4, r2, #0
	adds r6, r3, #0
	bl ClearText
	adds r0, r5, #0
	movs r1, #0x18
	movs r2, #2
	adds r3, r6, #0
	bl sub_803DE14
	adds r4, #1
	lsls r4, r4, #5
	adds r4, #1
	add r4, r8
	lsls r4, r4, #1
	ldr r0, _08044DBC @ =gBg0Tm
	adds r4, r4, r0
	adds r0, r5, #0
	adds r1, r4, #0
	bl PutText
	movs r0, #1
	bl EnableBgSync
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08044DBC: .4byte gBg0Tm

	thumb_func_start sub_8044DC0
sub_8044DC0: @ 0x08044DC0
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	ldr r1, _08044E20 @ =gUnk_081DB0E8
	adds r2, r6, #0
	adds r2, #0x32
	ldr r0, _08044E24 @ =gUnk_08C07DAC
	ldr r0, [r0]
	ldrb r0, [r0, #6]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r0, r0, #2
	ldrb r2, [r2]
	adds r0, r2, r0
	adds r0, r0, r1
	ldr r2, _08044E28 @ =gUnk_081DB148
	ldrb r0, [r0]
	lsls r0, r0, #1
	adds r1, r0, r2
	ldrb r1, [r1]
	movs r5, #0
	strh r1, [r6, #0x2a]
	adds r0, #1
	adds r0, r0, r2
	ldrb r0, [r0]
	strh r0, [r6, #0x2c]
	movs r0, #0
	bl SetTextFont
	adds r0, r6, #0
	adds r0, #0x48
	movs r2, #0x2a
	ldrsh r1, [r6, r2]
	movs r3, #0x2c
	ldrsh r2, [r6, r3]
	ldr r3, [r6, #0x38]
	ldr r4, [r6, #0x34]
	subs r3, r3, r4
	bl sub_8044D78
	str r5, [r6, #0x3c]
	ldr r0, [r6, #0x38]
	ldr r1, [r6, #0x34]
	subs r0, r0, r1
	str r0, [r6, #0x44]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08044E20: .4byte gUnk_081DB0E8
_08044E24: .4byte gUnk_08C07DAC
_08044E28: .4byte gUnk_081DB148

	thumb_func_start sub_8044E2C
sub_8044E2C: @ 0x08044E2C
	push {r4, r5, lr}
	sub sp, #4
	adds r4, r0, #0
	ldr r2, [r4, #0x38]
	ldr r1, [r4, #0x34]
	subs r1, r2, r1
	ldr r3, [r4, #0x3c]
	movs r0, #0xa
	str r0, [sp]
	movs r0, #0
	bl Interpolate
	adds r5, r0, #0
	movs r0, #0
	bl SetTextFont
	adds r0, r4, #0
	adds r0, #0x48
	movs r2, #0x2a
	ldrsh r1, [r4, r2]
	movs r3, #0x2c
	ldrsh r2, [r4, r3]
	adds r3, r5, #0
	bl sub_8044D78
	ldr r0, [r4, #0x44]
	cmp r0, r5
	beq _08044E86
	adds r1, r4, #0
	adds r1, #0x32
	ldr r0, _08044EB8 @ =gUnk_08C07DAC
	ldr r0, [r0]
	ldrb r1, [r1]
	ldrb r0, [r0, #6]
	cmp r1, r0
	bne _08044E86
	ldr r0, _08044EBC @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08044E86
	movs r0, #0x80
	bl m4aSongNumStart
_08044E86:
	str r5, [r4, #0x44]
	ldr r0, [r4, #0x3c]
	adds r0, #1
	str r0, [r4, #0x3c]
	cmp r0, #0xa
	bls _08044EAE
	movs r0, #0
	str r0, [r4, #0x3c]
	ldr r0, _08044EC0 @ =0x0203DC74
	adds r1, r4, #0
	adds r1, #0x32
	ldrb r1, [r1]
	lsls r1, r1, #2
	adds r0, #0x14
	adds r1, r1, r0
	ldr r0, [r4, #0x38]
	str r0, [r1]
	adds r0, r4, #0
	bl Proc_Break
_08044EAE:
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08044EB8: .4byte gUnk_08C07DAC
_08044EBC: .4byte gPlaySt
_08044EC0: .4byte 0x0203DC74

	thumb_func_start sub_8044EC4
sub_8044EC4: @ 0x08044EC4
	push {lr}
	adds r1, r0, #0
	ldr r0, [r1, #0x3c]
	adds r0, #1
	str r0, [r1, #0x3c]
	cmp r0, #0x14
	bls _08044ED8
	adds r0, r1, #0
	bl Proc_Break
_08044ED8:
	pop {r0}
	bx r0

	thumb_func_start sub_8044EDC
sub_8044EDC: @ 0x08044EDC
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08044F00 @ =0x02000C60
	bl SetTextFont
	ldr r0, _08044F04 @ =0x02000C78
	ldr r3, [r4, #0x54]
	movs r1, #0x80
	movs r2, #0
	bl Text_InsertDrawString
	adds r4, #0x4c
	movs r0, #0
	strh r0, [r4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08044F00: .4byte 0x02000C60
_08044F04: .4byte 0x02000C78

	thumb_func_start sub_8044F08
sub_8044F08: @ 0x08044F08
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	adds r7, r0, #0
	movs r0, #0x4c
	adds r0, r0, r7
	mov sb, r0
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0x10
	bgt _08044F9A
	movs r2, #0x80
	lsls r2, r2, #1
	mov r8, r2
	mov r0, sb
	movs r1, #0
	ldrsh r3, [r0, r1]
	movs r0, #0x10
	str r0, [sp]
	movs r0, #1
	movs r1, #0x10
	bl Interpolate
	mov sl, r0
	ldr r4, _08045008 @ =gSinLut
	ldr r2, _0804500C @ =gCosLut
	movs r1, #0
	ldrsh r0, [r2, r1]
	lsls r0, r0, #4
	mov r1, r8
	bl Div
	adds r6, r0, #0
	lsls r6, r6, #0x10
	asrs r6, r6, #0x10
	movs r2, #0
	ldrsh r0, [r4, r2]
	rsbs r0, r0, #0
	lsls r0, r0, #4
	mov r1, sl
	bl Div
	adds r5, r0, #0
	lsls r5, r5, #0x10
	asrs r5, r5, #0x10
	movs r1, #0
	ldrsh r0, [r4, r1]
	lsls r0, r0, #4
	mov r1, r8
	bl Div
	adds r4, r0, #0
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	ldr r2, _0804500C @ =gCosLut
	movs r1, #0
	ldrsh r0, [r2, r1]
	lsls r0, r0, #4
	mov r1, sl
	bl Div
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	str r0, [sp]
	movs r0, #1
	adds r1, r6, #0
	adds r2, r5, #0
	adds r3, r4, #0
	bl SetObjAffine
_08044F9A:
	ldr r0, [r7, #0x2c]
	movs r2, #0x80
	lsls r2, r2, #2
	adds r0, r0, r2
	ldr r1, [r7, #0x30]
	movs r4, #0x80
	lsls r4, r4, #1
	adds r1, r1, r4
	ldr r5, _08045010 @ =Sprite_64x32
	ldr r3, _08045014 @ =0x00009350
	adds r2, r5, #0
	bl PutOamHiRam
	ldr r0, [r7, #0x2c]
	movs r1, #0x88
	lsls r1, r1, #2
	adds r0, r0, r1
	ldr r1, [r7, #0x30]
	adds r1, r1, r4
	ldr r3, _08045018 @ =0x00009354
	adds r2, r5, #0
	bl PutOamHiRam
	ldr r0, [r7, #0x2c]
	movs r2, #0x90
	lsls r2, r2, #2
	adds r0, r0, r2
	ldr r1, [r7, #0x30]
	adds r1, r1, r4
	ldr r2, _0804501C @ =Sprite_16x16
	ldr r3, _08045020 @ =0x00009358
	bl PutOamHiRam
	mov r1, sb
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x40
	ble _08044FF6
	movs r0, #0
	strh r0, [r1]
	adds r0, r7, #0
	bl Proc_Break
_08044FF6:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08045008: .4byte gSinLut
_0804500C: .4byte gCosLut
_08045010: .4byte Sprite_64x32
_08045014: .4byte 0x00009350
_08045018: .4byte 0x00009354
_0804501C: .4byte Sprite_16x16
_08045020: .4byte 0x00009358

	thumb_func_start sub_8045024
sub_8045024: @ 0x08045024
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	adds r7, r0, #0
	adds r0, #0x4c
	str r0, [sp, #4]
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0x10
	bgt _080450BA
	movs r2, #0x80
	lsls r2, r2, #1
	mov r8, r2
	ldr r0, [sp, #4]
	movs r1, #0
	ldrsh r3, [r0, r1]
	movs r0, #0x10
	str r0, [sp]
	movs r0, #4
	mov r1, r8
	movs r2, #0x10
	bl Interpolate
	mov sl, r0
	ldr r4, _08045124 @ =gSinLut
	movs r2, #0x80
	adds r2, r2, r4
	mov sb, r2
	movs r1, #0
	ldrsh r0, [r2, r1]
	lsls r0, r0, #4
	mov r1, r8
	bl Div
	adds r6, r0, #0
	lsls r6, r6, #0x10
	asrs r6, r6, #0x10
	movs r2, #0
	ldrsh r0, [r4, r2]
	rsbs r0, r0, #0
	lsls r0, r0, #4
	mov r1, sl
	bl Div
	adds r5, r0, #0
	lsls r5, r5, #0x10
	asrs r5, r5, #0x10
	movs r1, #0
	ldrsh r0, [r4, r1]
	lsls r0, r0, #4
	mov r1, r8
	bl Div
	adds r4, r0, #0
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	mov r2, sb
	movs r1, #0
	ldrsh r0, [r2, r1]
	lsls r0, r0, #4
	mov r1, sl
	bl Div
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	str r0, [sp]
	movs r0, #1
	adds r1, r6, #0
	adds r2, r5, #0
	adds r3, r4, #0
	bl SetObjAffine
_080450BA:
	ldr r0, [r7, #0x2c]
	movs r2, #0x80
	lsls r2, r2, #2
	adds r0, r0, r2
	ldr r1, [r7, #0x30]
	movs r4, #0x80
	lsls r4, r4, #1
	adds r1, r1, r4
	ldr r5, _08045128 @ =Sprite_64x32
	ldr r3, _0804512C @ =0x00009350
	adds r2, r5, #0
	bl PutOamHiRam
	ldr r0, [r7, #0x2c]
	movs r1, #0x88
	lsls r1, r1, #2
	adds r0, r0, r1
	ldr r1, [r7, #0x30]
	adds r1, r1, r4
	ldr r3, _08045130 @ =0x00009354
	adds r2, r5, #0
	bl PutOamHiRam
	ldr r0, [r7, #0x2c]
	movs r2, #0x90
	lsls r2, r2, #2
	adds r0, r0, r2
	ldr r1, [r7, #0x30]
	adds r1, r1, r4
	ldr r2, _08045134 @ =Sprite_16x16
	ldr r3, _08045138 @ =0x00009358
	bl PutOamHiRam
	ldr r1, [sp, #4]
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x10
	ble _08045112
	adds r0, r7, #0
	bl Proc_Break
_08045112:
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08045124: .4byte gSinLut
_08045128: .4byte Sprite_64x32
_0804512C: .4byte 0x00009350
_08045130: .4byte 0x00009354
_08045134: .4byte Sprite_16x16
_08045138: .4byte 0x00009358

	thumb_func_start sub_804513C
sub_804513C: @ 0x0804513C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x14
	str r0, [sp, #8]
	str r1, [sp, #0xc]
	str r2, [sp, #0x10]
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	mov sb, r3
	movs r0, #0
	mov sl, r0
	ldr r0, _08045214 @ =Pal_Text
	movs r1, #0xc8
	lsls r1, r1, #2
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r0, _08045218 @ =0x02000C60
	ldr r1, _0804521C @ =0x06016800
	movs r2, #3
	bl InitSpriteTextFont
	movs r0, #0
	bl SetTextFontGlyphs
	bl ResetTextFont
	ldr r4, _08045220 @ =0x02000C78
	adds r0, r4, #0
	bl InitSpriteText
	adds r0, r4, #0
	movs r1, #0
	bl SpriteText_DrawBackgroundExt
	movs r0, #0
	bl SetTextFont
	movs r1, #0
	mov r8, r1
_08045192:
	ldr r0, _08045224 @ =gUnk_08C07DAC
	ldr r0, [r0]
	ldrb r0, [r0, #6]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r0, r0, #2
	add r0, r8
	ldr r1, _08045228 @ =gUnk_081DB0E8
	adds r0, r0, r1
	ldrb r4, [r0]
	adds r0, r4, #0
	bl sub_803D1CC
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08045240
	ldr r6, _0804522C @ =0x0203DC74
	lsls r5, r4, #3
	adds r0, r6, #0
	adds r0, #0x30
	adds r7, r5, r0
	ldr r0, [r7]
	cmp r0, #0
	beq _08045238
	ldr r0, _08045230 @ =gUnk_08C08EB8
	ldr r1, [sp, #0x34]
	bl Proc_StartBlocking
	adds r2, r0, #0
	adds r0, #0x32
	strb r4, [r0]
	adds r0, r5, r6
	adds r0, #0x2c
	ldrb r0, [r0]
	adds r1, r2, #0
	adds r1, #0x33
	strb r0, [r1]
	lsls r1, r4, #2
	adds r0, r6, #0
	adds r0, #0x14
	adds r3, r1, r0
	ldr r1, [r3]
	ldr r0, [r7]
	adds r1, r1, r0
	str r1, [r2, #0x38]
	ldr r0, _08045234 @ =0x0000270F
	cmp r1, r0
	bls _080451F4
	str r0, [r2, #0x38]
_080451F4:
	ldr r0, [r2, #0x38]
	ldr r1, [r3]
	subs r0, r0, r1
	str r0, [r2, #0x34]
	adds r0, r2, #0
	adds r0, #0x40
	mov r1, sb
	strb r1, [r0]
	adds r0, #8
	movs r1, #4
	bl sub_800536C
	movs r0, #1
	add sl, r0
	b _08045240
	.align 2, 0
_08045214: .4byte Pal_Text
_08045218: .4byte 0x02000C60
_0804521C: .4byte 0x06016800
_08045220: .4byte 0x02000C78
_08045224: .4byte gUnk_08C07DAC
_08045228: .4byte gUnk_081DB0E8
_0804522C: .4byte 0x0203DC74
_08045230: .4byte gUnk_08C08EB8
_08045234: .4byte 0x0000270F
_08045238:
	mov r0, sp
	movs r1, #4
	bl sub_800536C
_08045240:
	movs r1, #1
	add r8, r1
	mov r0, r8
	cmp r0, #3
	ble _08045192
	mov r1, sl
	cmp r1, #0
	beq _08045274
	mov r0, sb
	cmp r0, #0
	beq _0804526A
	ldr r0, _08045270 @ =gUnk_08C08EF8
	ldr r1, [sp, #0x34]
	bl Proc_StartBlocking
	ldr r1, [sp, #8]
	str r1, [r0, #0x2c]
	ldr r1, [sp, #0xc]
	str r1, [r0, #0x30]
	ldr r1, [sp, #0x10]
	str r1, [r0, #0x54]
_0804526A:
	movs r0, #1
	b _08045276
	.align 2, 0
_08045270: .4byte gUnk_08C08EF8
_08045274:
	movs r0, #0
_08045276:
	add sp, #0x14
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_8045288
sub_8045288: @ 0x08045288
	push {r4, lr}
	sub sp, #4
	adds r4, r0, #0
	bl sub_8044AD0
	ldr r2, _080452B4 @ =gUnk_081DB150
	str r4, [sp]
	movs r0, #0x58
	movs r1, #0x3c
	movs r3, #1
	bl sub_804513C
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080452AA
	bl sub_8044AF8
_080452AA:
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080452B4: .4byte gUnk_081DB150

	thumb_func_start sub_80452B8
sub_80452B8: @ 0x080452B8
	push {r4, lr}
	sub sp, #4
	adds r4, r0, #0
	bl sub_8044AD0
	ldr r2, _080452D8 @ =gUnk_081DB150
	str r4, [sp]
	movs r0, #0x58
	movs r1, #0x3c
	movs r3, #0
	bl sub_804513C
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080452D8: .4byte gUnk_081DB150

	thumb_func_start sub_80452DC
sub_80452DC: @ 0x080452DC
	adds r1, r0, #0
	adds r1, #0x1e
	ldr r3, _080452F4 @ =0x03001428
	movs r2, #4
_080452E4:
	ldrh r0, [r1]
	strh r0, [r3]
	adds r1, #2
	adds r3, #2
	subs r2, #1
	cmp r2, #0
	bge _080452E4
	bx lr
	.align 2, 0
_080452F4: .4byte 0x03001428

	thumb_func_start sub_80452F8
sub_80452F8: @ 0x080452F8
	ldr r3, _08045310 @ =0x03001428
	adds r1, r0, #0
	adds r1, #0x1e
	movs r2, #4
_08045300:
	ldrh r0, [r3]
	strh r0, [r1]
	adds r3, #2
	adds r1, #2
	subs r2, #1
	cmp r2, #0
	bge _08045300
	bx lr
	.align 2, 0
_08045310: .4byte 0x03001428

	thumb_func_start sub_8045314
sub_8045314: @ 0x08045314
	push {lr}
	bl sub_80455BC
	bl RefreshUnitSprites
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_8045324
sub_8045324: @ 0x08045324
	movs r1, #0
	ldr r3, _08045340 @ =0x0203DC74
	adds r2, r3, #0
	adds r2, #0xa
_0804532C:
	cmp r0, #2
	beq _08045356
	cmp r0, #2
	bgt _08045344
	cmp r0, #0
	beq _0804534E
	cmp r0, #1
	beq _08045352
	b _08045360
	.align 2, 0
_08045340: .4byte 0x0203DC74
_08045344:
	cmp r0, #3
	beq _0804535A
	cmp r0, #0xff
	beq _0804535E
	b _08045360
_0804534E:
	movs r1, #2
	b _08045360
_08045352:
	movs r1, #3
	b _08045360
_08045356:
	movs r1, #1
	b _08045360
_0804535A:
	movs r1, #0
	b _08045360
_0804535E:
	movs r1, #0xff
_08045360:
	adds r0, r1, r2
	ldrb r0, [r0]
	cmp r0, #0
	bne _08045370
	cmp r1, #0xff
	beq _08045370
	adds r0, r1, #0
	b _0804532C
_08045370:
	strb r1, [r3, #1]
	bx lr

	thumb_func_start sub_8045374
sub_8045374: @ 0x08045374
	ldr r1, _08045384 @ =0x0300141C
	movs r0, #0
	strb r0, [r1]
	strb r0, [r1, #1]
	strb r0, [r1, #3]
	strb r0, [r1, #2]
	bx lr
	.align 2, 0
_08045384: .4byte 0x0300141C

	thumb_func_start sub_8045388
sub_8045388: @ 0x08045388
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r4, r0, #0
	adds r5, r1, #0
	adds r6, r2, #0
	adds r0, r3, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	lsls r5, r5, #0x18
	lsrs r5, r5, #0x18
	lsls r6, r6, #0x18
	lsrs r6, r6, #0x18
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp]
	bl sub_8045374
	ldr r1, _080453C4 @ =0x0300141C
	strb r4, [r1]
	strb r5, [r1, #1]
	strb r6, [r1, #2]
	ldr r0, [sp]
	strb r0, [r1, #3]
	ldr r0, _080453C8 @ =0x0203D908
	ldrb r0, [r0]
	cmp r0, #2
	beq _080453CC
	movs r0, #0
	b _080453D8
	.align 2, 0
_080453C4: .4byte 0x0300141C
_080453C8: .4byte 0x0203D908
_080453CC:
	adds r0, r1, #0
	movs r1, #4
	bl sub_803D724
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
_080453D8:
	add sp, #4
	pop {r4, r5, r6}
	pop {r1}
	bx r1

	thumb_func_start sub_80453E0
sub_80453E0: @ 0x080453E0
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	movs r1, #0
	ldr r3, _080453F4 @ =0x03001400
_080453E8:
	adds r0, r1, r3
	ldrb r0, [r0]
	cmp r0, r2
	bne _080453F8
	adds r0, r1, #0
	b _080453FE
	.align 2, 0
_080453F4: .4byte 0x03001400
_080453F8:
	adds r1, #1
	cmp r1, #0x13
	ble _080453E8
_080453FE:
	bx lr

	thumb_func_start sub_8045400
sub_8045400: @ 0x08045400
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x14
	adds r4, r0, #0
	str r1, [sp, #0x10]
	adds r5, r2, #0
	mov r8, r3
	ldr r0, [sp, #0x34]
	mov sb, r0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	ldr r1, _080454F4 @ =gUnk_081DB163
	mov r0, sp
	movs r2, #8
	bl memcpy
	add r7, sp, #8
	ldr r1, _080454F8 @ =gUnk_081DB16B
	adds r0, r7, #0
	movs r2, #8
	bl memcpy
	adds r0, r4, #0
	bl sub_80453E0
	adds r4, r0, #0
	movs r1, #5
	bl Div
	lsls r6, r0, #1
	strb r4, [r5]
	ldr r0, _080454FC @ =0x03001400
	adds r4, r4, r0
	ldrb r0, [r4]
	bl GetUnit
	adds r5, r0, #0
	ldr r0, [r5, #0xc]
	movs r1, #0x80
	lsls r1, r1, #2
	mov sl, r1
	ands r0, r1
	cmp r0, #0
	bne _0804547C
	adds r0, r5, #0
	bl StartMu
	ldr r1, _08045500 @ =0x03001420
	ldr r2, [sp, #0x10]
	lsls r4, r2, #2
	adds r4, r4, r1
	str r0, [r4]
	bl sub_806C3D8
	ldr r0, [r4]
	mov r3, sp
	adds r1, r3, r6
	bl sub_806C8F0
_0804547C:
	ldr r0, [r5, #0xc]
	movs r1, #1
	orrs r0, r1
	str r0, [r5, #0xc]
	bl RefreshUnitSprites
	movs r0, #0x10
	ldrsb r0, [r5, r0]
	adds r4, r7, r6
	movs r1, #0
	ldrsb r1, [r4, r1]
	adds r0, r0, r1
	mov r1, r8
	str r0, [r1]
	movs r1, #0x11
	ldrsb r1, [r5, r1]
	adds r0, r6, #1
	adds r3, r7, r0
	movs r0, #0
	ldrsb r0, [r3, r0]
	adds r1, r1, r0
	mov r2, sb
	str r1, [r2]
	ldr r0, [r5, #0xc]
	mov r1, sl
	ands r0, r1
	cmp r0, #0
	beq _080454E4
	mov r2, r8
	ldr r0, [r2]
	movs r2, #0
	strb r0, [r5, #0x10]
	mov r1, sb
	ldr r0, [r1]
	strb r0, [r5, #0x11]
	movs r1, #0
	ldrsb r1, [r4, r1]
	mov r4, r8
	ldr r0, [r4]
	subs r0, r0, r1
	str r0, [r4]
	movs r1, #0
	ldrsb r1, [r3, r1]
	mov r3, sb
	ldr r0, [r3]
	subs r0, r0, r1
	str r0, [r3]
	ldr r1, _08045500 @ =0x03001420
	ldr r4, [sp, #0x10]
	lsls r0, r4, #2
	adds r0, r0, r1
	str r2, [r0]
_080454E4:
	add sp, #0x14
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080454F4: .4byte gUnk_081DB163
_080454F8: .4byte gUnk_081DB16B
_080454FC: .4byte 0x03001400
_08045500: .4byte 0x03001420

	thumb_func_start sub_8045504
sub_8045504: @ 0x08045504
	ldr r1, _08045518 @ =0x03001400
	movs r2, #0
	adds r0, r1, #0
	adds r0, #0x13
_0804550C:
	strb r2, [r0]
	subs r0, #1
	cmp r0, r1
	bge _0804550C
	bx lr
	.align 2, 0
_08045518: .4byte 0x03001400

	thumb_func_start sub_804551C
sub_804551C: @ 0x0804551C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	movs r7, #0
_0804552A:
	ldr r0, _080455A8 @ =gUnk_08C07DAC
	ldr r0, [r0]
	ldrb r0, [r0, #6]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r0, r0, #2
	adds r0, r7, r0
	ldr r1, _080455AC @ =gUnk_081DB0D8
	adds r0, r0, r1
	ldrb r4, [r0]
	adds r0, r4, #0
	bl sub_803D1CC
	lsls r0, r0, #0x18
	adds r1, r7, #1
	mov sb, r1
	cmp r0, #0
	beq _08045592
	lsls r0, r4, #6
	adds r0, #1
	mov r8, r0
	movs r6, #0
	lsls r3, r7, #2
	ldr r0, _080455B0 @ =gUnk_081DB0F8
	mov sl, r0
_0804555C:
	adds r0, r3, r7
	adds r5, r0, r6
	ldr r0, _080455B4 @ =gUnk_081DB173
	adds r0, r6, r0
	ldrb r4, [r0]
	add r4, r8
	adds r0, r4, #0
	str r3, [sp]
	bl GetUnit
	adds r2, r0, #0
	ldr r0, [r2]
	ldr r3, [sp]
	cmp r0, #0
	beq _0804558C
	ldr r0, _080455B8 @ =0x03001400
	adds r0, r5, r0
	strb r4, [r0]
	lsls r1, r5, #2
	add r1, sl
	ldrh r0, [r1]
	strb r0, [r2, #0x10]
	ldrh r0, [r1, #2]
	strb r0, [r2, #0x11]
_0804558C:
	adds r6, #1
	cmp r6, #4
	ble _0804555C
_08045592:
	mov r7, sb
	cmp r7, #3
	ble _0804552A
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080455A8: .4byte gUnk_08C07DAC
_080455AC: .4byte gUnk_081DB0D8
_080455B0: .4byte gUnk_081DB0F8
_080455B4: .4byte gUnk_081DB173
_080455B8: .4byte 0x03001400

	thumb_func_start sub_80455BC
sub_80455BC: @ 0x080455BC
	push {r4, lr}
	ldr r0, _08045614 @ =gBmMapUnit
	ldr r0, [r0]
	movs r1, #0
	bl BmMapFillg
	ldr r0, _08045618 @ =0x0202E3E8
	ldr r0, [r0]
	movs r1, #1
	bl BmMapFillg
	movs r4, #1
_080455D4:
	adds r0, r4, #0
	bl GetUnit
	adds r2, r0, #0
	cmp r2, #0
	beq _08045608
	ldr r0, [r2]
	cmp r0, #0
	beq _08045608
	ldr r0, [r2, #0xc]
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	bne _08045608
	movs r1, #0x11
	ldrsb r1, [r2, r1]
	ldr r0, _08045614 @ =gBmMapUnit
	ldr r0, [r0]
	lsls r1, r1, #2
	adds r1, r1, r0
	ldrb r2, [r2, #0x10]
	lsls r2, r2, #0x18
	asrs r2, r2, #0x18
	ldr r0, [r1]
	adds r0, r0, r2
	strb r4, [r0]
_08045608:
	adds r4, #1
	cmp r4, #0xc5
	ble _080455D4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08045614: .4byte gBmMapUnit
_08045618: .4byte 0x0202E3E8

	thumb_func_start sub_804561C
sub_804561C: @ 0x0804561C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	movs r2, #0
	ldr r0, _08045694 @ =gUnk_081DB0D8
	mov sl, r0
_0804562E:
	ldr r0, _08045698 @ =gUnk_08C07DAC
	ldr r0, [r0]
	ldrb r0, [r0, #6]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r0, r0, #2
	adds r0, r2, r0
	add r0, sl
	ldrb r4, [r0]
	adds r0, r4, #0
	str r2, [sp]
	bl sub_803D1CC
	lsls r0, r0, #0x18
	ldr r2, [sp]
	adds r1, r2, #1
	mov sb, r1
	cmp r0, #0
	beq _080456B2
	lsls r0, r4, #6
	adds r0, #1
	mov r8, r0
	movs r6, #0
	lsls r3, r2, #2
	ldr r7, _0804569C @ =0x03001400
_08045660:
	adds r0, r3, r2
	adds r5, r0, r6
	ldr r0, _080456A0 @ =gUnk_081DB173
	adds r0, r6, r0
	ldrb r4, [r0]
	add r4, r8
	adds r0, r4, #0
	str r2, [sp]
	str r3, [sp, #4]
	bl GetUnit
	adds r1, r0, #0
	ldr r0, [r1]
	ldr r2, [sp]
	ldr r3, [sp, #4]
	cmp r0, #0
	beq _0804568C
	ldr r0, [r1, #0xc]
	ldr r1, _080456A4 @ =0x00010005
	ands r0, r1
	cmp r0, #0
	beq _080456A8
_0804568C:
	adds r1, r5, r7
	movs r0, #0
	strb r0, [r1]
	b _080456AC
	.align 2, 0
_08045694: .4byte gUnk_081DB0D8
_08045698: .4byte gUnk_08C07DAC
_0804569C: .4byte 0x03001400
_080456A0: .4byte gUnk_081DB173
_080456A4: .4byte 0x00010005
_080456A8:
	adds r0, r5, r7
	strb r4, [r0]
_080456AC:
	adds r6, #1
	cmp r6, #4
	ble _08045660
_080456B2:
	mov r2, sb
	cmp r2, #3
	ble _0804562E
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_80456C8
sub_80456C8: @ 0x080456C8
	push {r4, r5, lr}
	sub sp, #4
	mov r1, sp
	movs r0, #0
	strh r0, [r1]
	ldr r4, _08045720 @ =gBmSt
	ldr r2, _08045724 @ =0x01000020
	mov r0, sp
	adds r1, r4, #0
	bl CpuSet
	movs r0, #0x40
	movs r5, #0
	ldrb r1, [r4, #4]
	orrs r0, r1
	strb r0, [r4, #4]
	bl InitTraps
	ldr r4, _08045728 @ =gPlaySt
	movs r0, #0x40
	strb r0, [r4, #0xf]
	movs r0, #0x42
	strb r0, [r4, #0xe]
	strh r5, [r4, #0x10]
	bl GetROMChapterStruct
	ldrb r0, [r0, #0xc]
	strb r0, [r4, #0xd]
	movs r0, #0xe
	ldrsb r0, [r4, r0]
	bl GetROMChapterStruct
	ldrb r0, [r0, #0x12]
	strb r0, [r4, #0x15]
	movs r0, #0x42
	bl InitChapterMap
	bl GetGameTime
	str r0, [r4, #4]
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08045720: .4byte gBmSt
_08045724: .4byte 0x01000020
_08045728: .4byte gPlaySt

	thumb_func_start sub_804572C
sub_804572C: @ 0x0804572C
	push {lr}
	bl sub_80456C8
	bl sub_8045504
	bl sub_804551C
	ldr r0, _0804575C @ =0x0202E3E8
	ldr r2, [r0]
	movs r1, #0
	ldr r0, _08045760 @ =gPlaySt
	ldrb r0, [r0, #0xd]
	cmp r0, #0
	bne _0804574A
	movs r1, #1
_0804574A:
	adds r0, r2, #0
	bl BmMapFillg
	bl sub_80455BC
	bl RenderMap
	pop {r0}
	bx r0
	.align 2, 0
_0804575C: .4byte 0x0202E3E8
_08045760: .4byte gPlaySt

	thumb_func_start sub_8045764
sub_8045764: @ 0x08045764
	push {r4, lr}
	ldr r0, _0804579C @ =0x0203DC74
	movs r1, #0
	movs r2, #3
	adds r0, #0xd
_0804576E:
	strb r1, [r0]
	subs r0, #1
	subs r2, #1
	cmp r2, #0
	bge _0804576E
	movs r2, #0
	ldr r4, _080457A0 @ =0x03001400
	ldr r3, _080457A4 @ =0x0203DC7E
_0804577E:
	adds r0, r2, r4
	ldrb r0, [r0]
	cmp r0, #0
	beq _08045790
	lsrs r0, r0, #6
	adds r0, r0, r3
	ldrb r1, [r0]
	adds r1, #1
	strb r1, [r0]
_08045790:
	adds r2, #1
	cmp r2, #0x13
	ble _0804577E
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0804579C: .4byte 0x0203DC74
_080457A0: .4byte 0x03001400
_080457A4: .4byte 0x0203DC7E

	thumb_func_start sub_80457A8
sub_80457A8: @ 0x080457A8
	push {lr}
	ldr r0, _080457B8 @ =gUnk_081CD5EC
	ldr r1, _080457BC @ =0x06014800
	bl Decompress
	pop {r0}
	bx r0
	.align 2, 0
_080457B8: .4byte gUnk_081CD5EC
_080457BC: .4byte 0x06014800

	thumb_func_start sub_80457C0
sub_80457C0: @ 0x080457C0
	push {lr}
	movs r0, #0
	bl InitBgs
	bl ApplySystemGraphics
	bl ApplyUnitSpritePalettes
	bl sub_8025A0C
	bl sub_80457A8
	bl InitSystemTextFont
	ldr r1, _080457E8 @ =0x0203DC74
	movs r0, #0xff
	strb r0, [r1, #3]
	pop {r0}
	bx r0
	.align 2, 0
_080457E8: .4byte 0x0203DC74

	thumb_func_start sub_80457EC
sub_80457EC: @ 0x080457EC
	push {r4, r5, lr}
	ldr r1, _08045844 @ =gPlaySt
	movs r0, #0x42
	adds r0, r0, r1
	mov ip, r0
	movs r3, #7
	rsbs r3, r3, #0
	ldrb r2, [r0]
	ands r3, r2
	adds r5, r1, #0
	adds r5, #0x40
	movs r2, #0x10
	ldrb r0, [r5]
	orrs r2, r0
	movs r0, #0x61
	rsbs r0, r0, #0
	ands r2, r0
	movs r0, #0x40
	orrs r2, r0
	movs r0, #0x7f
	ands r2, r0
	adds r4, r1, #0
	adds r4, #0x41
	subs r0, #0x81
	ldrb r1, [r4]
	ands r0, r1
	movs r1, #3
	rsbs r1, r1, #0
	ands r0, r1
	subs r1, #0xa
	ands r0, r1
	strb r0, [r4]
	movs r0, #0x19
	rsbs r0, r0, #0
	ands r3, r0
	mov r0, ip
	strb r3, [r0]
	movs r0, #1
	orrs r2, r0
	strb r2, [r5]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08045844: .4byte gPlaySt

	thumb_func_start sub_8045848
sub_8045848: @ 0x08045848
	push {r4, r5, lr}
	movs r0, #0
	bl InitBgs
	bl sub_803E080
	bl sub_804572C
	bl sub_8045764
	ldr r4, _080458F4 @ =0x0203DC74
	movs r5, #0
	strb r5, [r4, #9]
	ldr r0, _080458F8 @ =0x0203D908
	strb r5, [r0, #0xb]
	ldr r0, _080458FC @ =gUnk_08C08F20
	ldrb r1, [r4]
	adds r0, r1, r0
	ldrb r0, [r0]
	bl sub_8045324
	movs r0, #1
	strb r0, [r4, #0xe]
	strb r5, [r4, #2]
	strb r0, [r4, #3]
	movs r1, #0
	movs r0, #3
	adds r4, #0x20
_08045880:
	str r1, [r4]
	subs r4, #4
	subs r0, #1
	cmp r0, #0
	bge _08045880
	movs r4, #0
	ldr r0, _08045900 @ =0x03001400
	ldrb r0, [r0, #3]
	bl GetUnit
	ldr r2, _08045904 @ =0x03001414
	movs r1, #0x10
	ldrsb r1, [r0, r1]
	lsls r1, r1, #4
	strh r1, [r2]
	movs r1, #0x11
	ldrsb r1, [r0, r1]
	lsls r1, r1, #4
	strh r1, [r2, #2]
	movs r2, #0x10
	ldrsb r2, [r0, r2]
	movs r1, #0x11
	ldrsb r1, [r0, r1]
	adds r0, r2, #0
	bl sub_8015F0C
	ldr r0, _08045908 @ =gBmSt
	strh r4, [r0, #0xc]
	strh r4, [r0, #0xe]
	bl ApplySystemGraphics
	bl ApplyUnitSpritePalettes
	bl ResetUnitSprites
	bl RefreshUnitSprites
	bl sub_80457A8
	bl sub_8047330
	ldr r0, _0804590C @ =gUnk_08C05464
	movs r1, #4
	bl Proc_Start
	bl StartBmVSync
	bl sub_80457EC
	ldr r1, _08045910 @ =gPlaySt
	movs r0, #0xbf
	ldrb r2, [r1, #0x14]
	ands r0, r2
	strb r0, [r1, #0x14]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080458F4: .4byte 0x0203DC74
_080458F8: .4byte 0x0203D908
_080458FC: .4byte gUnk_08C08F20
_08045900: .4byte 0x03001400
_08045904: .4byte 0x03001414
_08045908: .4byte gBmSt
_0804590C: .4byte gUnk_08C05464
_08045910: .4byte gPlaySt

	thumb_func_start sub_8045914
sub_8045914: @ 0x08045914
	push {r4, r5, lr}
	ldr r0, _08045954 @ =0x03001400
	ldr r1, _08045958 @ =0x0203DC74
	ldrb r1, [r1, #4]
	adds r0, r1, r0
	ldrb r0, [r0]
	bl GetUnit
	adds r4, r0, #0
	bl StartMu
	ldr r5, _0804595C @ =0x03001420
	str r0, [r5]
	movs r1, #0x10
	ldrsb r1, [r4, r1]
	lsls r1, r1, #4
	movs r2, #0x11
	ldrsb r2, [r4, r2]
	subs r2, #1
	lsls r2, r2, #4
	bl sub_806E2E8
	ldr r0, [r5]
	bl sub_806C3D8
	ldr r0, [r5]
	movs r1, #3
	bl sub_806C738
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08045954: .4byte 0x03001400
_08045958: .4byte 0x0203DC74
_0804595C: .4byte 0x03001420

	thumb_func_start sub_8045960
sub_8045960: @ 0x08045960
	push {lr}
	adds r2, r0, #0
	ldr r0, _08045980 @ =gpKeySt
	ldr r1, [r0]
	movs r0, #0x80
	lsls r0, r0, #2
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _0804597A
	adds r0, r2, #0
	bl Proc_Break
_0804597A:
	pop {r0}
	bx r0
	.align 2, 0
_08045980: .4byte gpKeySt

	thumb_func_start sub_8045984
sub_8045984: @ 0x08045984
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08045998 @ =0x0203D908
	ldrb r0, [r0]
	cmp r0, #1
	beq _0804599C
	cmp r0, #2
	beq _080459B0
	b _080459DC
	.align 2, 0
_08045998: .4byte 0x0203D908
_0804599C:
	ldr r0, _080459A8 @ =gPlaySt
	ldrb r0, [r0, #0xf]
	cmp r0, #0
	beq _080459BE
	ldr r0, _080459AC @ =gUnk_08C09354
	b _080459C0
	.align 2, 0
_080459A8: .4byte gPlaySt
_080459AC: .4byte gUnk_08C09354
_080459B0:
	ldr r0, _080459C8 @ =gPlaySt
	ldr r1, _080459CC @ =gUnk_08C07DAC
	ldr r1, [r1]
	ldrb r0, [r0, #0xf]
	ldrb r1, [r1, #6]
	cmp r0, r1
	bne _080459D4
_080459BE:
	ldr r0, _080459D0 @ =gUnk_08C090B4
_080459C0:
	adds r1, r4, #0
	bl Proc_StartBlocking
	b _080459DC
	.align 2, 0
_080459C8: .4byte gPlaySt
_080459CC: .4byte gUnk_08C07DAC
_080459D0: .4byte gUnk_08C090B4
_080459D4:
	ldr r0, _080459E8 @ =gUnk_08C09264
	adds r1, r4, #0
	bl Proc_StartBlocking
_080459DC:
	adds r0, r4, #0
	bl Proc_Break
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080459E8: .4byte gUnk_08C09264

	thumb_func_start sub_80459EC
sub_80459EC: @ 0x080459EC
	push {r4, lr}
	adds r3, r0, #0
	movs r1, #0
	ldr r0, _08045A04 @ =0x0203D908
	ldrb r2, [r0]
	cmp r2, #1
	bne _08045A08
	ldrb r0, [r0, #0xb]
	cmp r0, #1
	bne _08045A18
	b _08045A0E
	.align 2, 0
_08045A04: .4byte 0x0203D908
_08045A08:
	ldrb r0, [r0, #0xb]
	cmp r0, #2
	bne _08045A18
_08045A0E:
	adds r0, r3, #0
	movs r1, #3
	bl Proc_Goto
	b _08045A72
_08045A18:
	ldr r0, _08045A2C @ =0x0203DC74
	ldrb r2, [r0, #1]
	adds r0, r2, #0
	cmp r0, #0xff
	bne _08045A30
	adds r0, r3, #0
	movs r1, #2
	bl Proc_Goto
	b _08045A72
	.align 2, 0
_08045A2C: .4byte 0x0203DC74
_08045A30:
	ldr r0, _08045A38 @ =gPlaySt
	strb r2, [r0, #0xf]
	ldr r2, _08045A3C @ =0x03001400
	b _08045A42
	.align 2, 0
_08045A38: .4byte gPlaySt
_08045A3C: .4byte 0x03001400
_08045A40:
	adds r1, #1
_08045A42:
	adds r0, r1, r2
	ldrb r0, [r0]
	cmp r0, #0
	beq _08045A40
	ldr r4, _08045A78 @ =0x0203DC74
	strb r1, [r4, #2]
	adds r0, r1, #1
	strb r0, [r4, #3]
	bl ApplySystemObjectsGraphics
	movs r0, #0
	adds r4, #0x2c
	movs r1, #3
_08045A5C:
	str r0, [r4, #4]
	strb r0, [r4]
	adds r4, #8
	subs r1, #1
	cmp r1, #0
	bge _08045A5C
	movs r0, #1
	rsbs r0, r0, #0
	movs r1, #9
	bl sub_800515C
_08045A72:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08045A78: .4byte 0x0203DC74

	thumb_func_start sub_8045A7C
sub_8045A7C: @ 0x08045A7C
	push {r4, r5, r6, r7, lr}
	movs r5, #4
	ldr r3, _08045AD4 @ =0x0203DC74
	ldr r0, _08045AD8 @ =gUnk_08C07DAC
	ldr r0, [r0]
	ldrb r0, [r0, #6]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r0, r0, #2
	adds r2, r3, #0
	adds r2, #0x14
	adds r0, r0, r2
	ldr r7, [r0]
	ldr r1, _08045ADC @ =0x0203D908
	adds r1, #0xec
	movs r0, #2
	ldrb r1, [r1]
	ands r0, r1
	cmp r0, #0
	beq _08045AE4
	movs r4, #0
	adds r5, r3, #0
	adds r5, #0xf
_08045AAA:
	lsls r0, r4, #0x18
	lsrs r0, r0, #0x18
	bl sub_803D1CC
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08045AC8
	ldr r0, _08045AD8 @ =gUnk_08C07DAC
	ldr r0, [r0]
	movs r1, #6
	ldrsb r1, [r0, r1]
	adds r0, r4, r5
	ldrb r0, [r0]
	cmp r1, r0
	beq _08045AE0
_08045AC8:
	adds r4, #1
	cmp r4, #3
	ble _08045AAA
	movs r5, #3
	b _08045B14
	.align 2, 0
_08045AD4: .4byte 0x0203DC74
_08045AD8: .4byte gUnk_08C07DAC
_08045ADC: .4byte 0x0203D908
_08045AE0:
	adds r0, r4, #0
	b _08045B16
_08045AE4:
	movs r4, #0
	adds r6, r2, #0
_08045AE8:
	lsls r0, r4, #0x18
	lsrs r0, r0, #0x18
	bl sub_803D1CC
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08045B0A
	ldr r0, _08045B1C @ =gUnk_08C07DAC
	ldr r0, [r0]
	ldrb r0, [r0, #6]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, r4
	beq _08045B0A
	ldr r0, [r6]
	cmp r7, r0
	bls _08045B0C
_08045B0A:
	subs r5, #1
_08045B0C:
	adds r6, #4
	adds r4, #1
	cmp r4, #3
	ble _08045AE8
_08045B14:
	adds r0, r5, #0
_08045B16:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_08045B1C: .4byte gUnk_08C07DAC

	thumb_func_start sub_8045B20
sub_8045B20: @ 0x08045B20
	push {lr}
	ldr r0, _08045B3C @ =gUnk_08C05464
	bl sub_8004748
	bl sub_8047344
	bl sub_802D864
	movs r0, #1
	bl FadeBgmOut
	pop {r0}
	bx r0
	.align 2, 0
_08045B3C: .4byte gUnk_08C05464

	thumb_func_start sub_8045B40
sub_8045B40: @ 0x08045B40
	push {r4, r5, r6, r7, lr}
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	mov ip, r1
	ldr r1, _08045B70 @ =0x0203DC74
	ldrb r2, [r1, #2]
	adds r5, r2, #0
	strb r2, [r1, #3]
	movs r0, #0xf0
	ands r0, r3
	adds r7, r1, #0
	cmp r0, #0
	beq _08045C2E
	lsls r4, r2, #2
	movs r0, #0x40
	ands r0, r3
	cmp r0, #0
	beq _08045B78
	ldr r0, _08045B74 @ =gUnk_08C08F24
	adds r0, r4, r0
	b _08045BAE
	.align 2, 0
_08045B70: .4byte 0x0203DC74
_08045B74: .4byte gUnk_08C08F24
_08045B78:
	movs r0, #0x80
	ands r0, r3
	cmp r0, #0
	beq _08045B8C
	ldr r1, _08045B88 @ =gUnk_08C08F24
	adds r0, r4, #1
	b _08045BAC
	.align 2, 0
_08045B88: .4byte gUnk_08C08F24
_08045B8C:
	movs r0, #0x20
	ands r0, r3
	cmp r0, #0
	beq _08045BA0
	ldr r1, _08045B9C @ =gUnk_08C08F24
	adds r0, r4, #2
	b _08045BAC
	.align 2, 0
_08045B9C: .4byte gUnk_08C08F24
_08045BA0:
	movs r0, #0x10
	ands r0, r3
	cmp r0, #0
	beq _08045BB0
	ldr r1, _08045C0C @ =gUnk_08C08F24
	adds r0, r4, #3
_08045BAC:
	adds r0, r0, r1
_08045BAE:
	ldrb r2, [r0]
_08045BB0:
	subs r5, r2, r5
	ldrb r0, [r7, #3]
	cmp r0, #0
	bne _08045BC4
	movs r0, #0x20
	ands r0, r3
	cmp r0, #0
	beq _08045BC4
	movs r5, #1
	rsbs r5, r5, #0
_08045BC4:
	ldrb r0, [r7, #3]
	cmp r0, #0x13
	bne _08045BD4
	movs r0, #0x80
	ands r0, r3
	cmp r0, #0
	beq _08045BD4
	movs r5, #1
_08045BD4:
	ldr r6, _08045C10 @ =0x03001400
	mov r0, ip
	lsls r4, r0, #0x18
_08045BDA:
	adds r0, r2, r6
	ldrb r0, [r0]
	lsls r1, r0, #0x18
	cmp r1, #0
	beq _08045BF8
	cmp r4, #0
	beq _08045C2C
	lsrs r1, r1, #0x1e
	ldr r0, _08045C14 @ =gUnk_08C07DAC
	ldr r0, [r0]
	ldrb r0, [r0, #6]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r1, r0
	bne _08045C2C
_08045BF8:
	cmp r5, #0
	bge _08045C18
	subs r0, r2, #1
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #0xff
	bne _08045BDA
	movs r2, #0x13
	b _08045BDA
	.align 2, 0
_08045C0C: .4byte gUnk_08C08F24
_08045C10: .4byte 0x03001400
_08045C14: .4byte gUnk_08C07DAC
_08045C18:
	adds r0, r2, #1
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	adds r0, r2, #0
	movs r1, #0x14
	bl __umodsi3
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	b _08045BDA
_08045C2C:
	strb r2, [r7, #2]
_08045C2E:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_8045C34
sub_8045C34: @ 0x08045C34
	push {r4, r5, r6, r7, lr}
	ldr r6, _08045CA0 @ =0x0203DC74
	ldrb r0, [r6, #2]
	ldrb r1, [r6, #3]
	cmp r0, r1
	beq _08045C9A
	ldr r7, _08045CA4 @ =0x03001400
	adds r0, r1, r7
	ldrb r0, [r0]
	bl GetUnit
	adds r5, r0, #0
	ldrb r1, [r6, #2]
	adds r0, r1, r7
	ldrb r0, [r0]
	bl GetUnit
	adds r4, r0, #0
	cmp r5, #0
	beq _08045C66
	bl MU_EndAll
	adds r0, r5, #0
	bl ShowUnitSprite
_08045C66:
	cmp r4, #0
	beq _08045C9A
	ldr r0, [r4, #0xc]
	movs r1, #2
	ands r0, r1
	cmp r0, #0
	bne _08045C9A
	ldrb r6, [r6, #2]
	adds r0, r6, r7
	ldrb r0, [r0]
	lsrs r1, r0, #6
	ldr r0, _08045CA8 @ =gUnk_08C07DAC
	ldr r0, [r0]
	ldrb r0, [r0, #6]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r1, r0
	bne _08045C9A
	adds r0, r4, #0
	bl StartMu
	bl sub_806C3D8
	adds r0, r4, #0
	bl HideUnitSprite
_08045C9A:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08045CA0: .4byte 0x0203DC74
_08045CA4: .4byte 0x03001400
_08045CA8: .4byte gUnk_08C07DAC

	thumb_func_start sub_8045CAC
sub_8045CAC: @ 0x08045CAC
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	movs r5, #0
_08045CB2:
	lsls r1, r5, #1
	adds r0, r6, #0
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r4, [r0]
	adds r0, r4, #0
	bl GetItemAttributes
	movs r1, #1
	ands r1, r0
	cmp r1, #0
	beq _08045CDE
	adds r0, r6, #0
	adds r1, r4, #0
	bl CanUnitUseWeapon
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne _08045CDE
	movs r0, #1
	b _08045CE6
_08045CDE:
	adds r5, #1
	cmp r5, #4
	ble _08045CB2
	movs r0, #0
_08045CE6:
	pop {r4, r5, r6}
	pop {r1}
	bx r1

	thumb_func_start sub_8045CEC
sub_8045CEC: @ 0x08045CEC
	push {r4, lr}
	adds r4, r0, #0
	ldr r2, _08045D20 @ =0x0203DC74
	ldr r1, _08045D24 @ =0x0203D908
	adds r1, #0xa0
	ldrb r3, [r1]
	lsls r0, r3, #1
	adds r0, r0, r3
	ldrb r2, [r2, #9]
	cmp r2, r0
	blt _08045D14
	bl sub_8044AF8
	ldr r0, _08045D28 @ =gUnk_08C09098
	bl sub_800AE98
	adds r0, r4, #0
	movs r1, #3
	bl Proc_Goto
_08045D14:
	adds r0, r4, #0
	bl Proc_Break
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08045D20: .4byte 0x0203DC74
_08045D24: .4byte 0x0203D908
_08045D28: .4byte gUnk_08C09098

	thumb_func_start sub_8045D2C
sub_8045D2C: @ 0x08045D2C
	push {r4, lr}
	adds r4, r0, #0
	bl sub_803D268
	cmp r0, #7
	bgt _08045D3E
	adds r0, r4, #0
	bl Proc_Break
_08045D3E:
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_8045D44
sub_8045D44: @ 0x08045D44
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	adds r6, r0, #0
	ldr r1, _08045E2C @ =gUnk_081DB178
	mov r0, sp
	movs r2, #2
	bl memcpy
	ldr r0, _08045E30 @ =0x0203DC74
	mov sb, r0
	ldrb r1, [r0, #2]
	mov sl, r1
	bl sub_8045C34
	ldr r4, _08045E34 @ =gpKeySt
	ldr r0, [r4]
	ldrh r0, [r0, #6]
	movs r1, #0
	bl sub_8045B40
	ldr r2, _08045E38 @ =gActiveUnitId
	mov r8, r2
	ldr r0, _08045E3C @ =0x03001400
	mov r3, sb
	ldrb r3, [r3, #2]
	adds r0, r3, r0
	ldrb r0, [r0]
	strb r0, [r2]
	ldrb r0, [r2]
	bl GetUnit
	adds r2, r0, #0
	ldr r7, _08045E40 @ =gActiveUnit
	str r2, [r7]
	ldr r1, [r4]
	movs r0, #1
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _08045E68
	mov r0, r8
	ldrb r0, [r0]
	lsrs r1, r0, #6
	ldr r0, _08045E44 @ =gUnk_08C07DAC
	ldr r0, [r0]
	ldrb r0, [r0, #6]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r1, r0
	bne _08045E54
	adds r0, r2, #0
	bl sub_8045CAC
	lsls r0, r0, #0x18
	asrs r5, r0, #0x18
	cmp r5, #1
	bne _08045E54
	ldr r0, _08045E48 @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08045DD0
	ldr r0, _08045E4C @ =0x00000389
	bl m4aSongNumStart
_08045DD0:
	bl MU_EndAll
	ldr r0, [r7]
	bl StartMu
	ldr r4, _08045E50 @ =0x03001420
	str r0, [r4]
	bl sub_806C3D8
	ldr r0, [r4]
	mov r1, sp
	bl sub_806C8F0
	ldr r1, [r7]
	movs r0, #0x10
	ldrsb r0, [r1, r0]
	str r0, [r6, #0x2c]
	movs r0, #0x11
	ldrsb r0, [r1, r0]
	subs r0, #1
	str r0, [r6, #0x30]
	ldr r0, [r1, #0xc]
	orrs r0, r5
	str r0, [r1, #0xc]
	bl sub_8045314
	mov r1, sb
	ldrb r0, [r1, #2]
	strb r0, [r1, #4]
	movs r0, #0x40
	movs r1, #1
	bl sub_8045B40
	mov r2, r8
	ldrb r1, [r2]
	movs r0, #1
	movs r2, #0
	movs r3, #0
	bl sub_8045388
	adds r0, r6, #0
	movs r1, #5
	bl Proc_Goto
	b _08045F46
	.align 2, 0
_08045E2C: .4byte gUnk_081DB178
_08045E30: .4byte 0x0203DC74
_08045E34: .4byte gpKeySt
_08045E38: .4byte gActiveUnitId
_08045E3C: .4byte 0x03001400
_08045E40: .4byte gActiveUnit
_08045E44: .4byte gUnk_08C07DAC
_08045E48: .4byte gPlaySt
_08045E4C: .4byte 0x00000389
_08045E50: .4byte 0x03001420
_08045E54:
	ldr r0, _08045E98 @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08045E68
	movs r0, #0xe3
	lsls r0, r0, #2
	bl m4aSongNumStart
_08045E68:
	ldr r2, _08045E9C @ =gpKeySt
	ldr r1, [r2]
	movs r0, #0x80
	lsls r0, r0, #1
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _08045EA4
	ldr r0, _08045EA0 @ =gActiveUnit
	ldr r0, [r0]
	ldr r0, [r0, #0xc]
	movs r1, #0x80
	lsls r1, r1, #2
	ands r0, r1
	cmp r0, #0
	bne _08045EA4
	bl MU_EndAll
	adds r0, r6, #0
	movs r1, #4
	bl Proc_Goto
	b _08045F46
	.align 2, 0
_08045E98: .4byte gPlaySt
_08045E9C: .4byte gpKeySt
_08045EA0: .4byte gActiveUnit
_08045EA4:
	ldr r1, [r2]
	movs r0, #8
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _08045EE0
	bl sub_8044AF8
	ldr r0, _08045ED8 @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08045ECE
	movs r0, #0xe2
	lsls r0, r0, #2
	bl m4aSongNumStart
	ldr r0, _08045EDC @ =gUnk_08C0907C
	bl sub_800AE98
_08045ECE:
	adds r0, r6, #0
	movs r1, #2
	bl Proc_Goto
	b _08045F46
	.align 2, 0
_08045ED8: .4byte gPlaySt
_08045EDC: .4byte gUnk_08C0907C
_08045EE0:
	ldr r0, _08045F58 @ =gActiveUnit
	ldr r1, [r0]
	movs r0, #0x10
	ldrsb r0, [r1, r0]
	lsls r5, r0, #4
	ldrb r1, [r1, #0x11]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	lsls r4, r1, #4
	bl sub_8015F0C
	bl GetGameTime
	subs r0, #1
	ldr r6, _08045F5C @ =0x03001418
	ldr r1, [r6]
	cmp r0, r1
	bne _08045F16
	ldr r0, _08045F60 @ =0x03001414
	movs r3, #0
	ldrsh r1, [r0, r3]
	adds r1, r5, r1
	asrs r5, r1, #1
	movs r1, #2
	ldrsh r0, [r0, r1]
	adds r0, r4, r0
	asrs r4, r0, #1
_08045F16:
	ldr r0, _08045F60 @ =0x03001414
	strh r5, [r0]
	strh r4, [r0, #2]
	bl GetGameTime
	str r0, [r6]
	adds r0, r5, #0
	adds r1, r4, #0
	movs r2, #0
	bl sub_8015DE8
	ldr r0, _08045F64 @ =0x0203DC74
	ldrb r0, [r0, #2]
	cmp sl, r0
	beq _08045F46
	ldr r0, _08045F68 @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08045F46
	ldr r0, _08045F6C @ =0x00000385
	bl m4aSongNumStart
_08045F46:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08045F58: .4byte gActiveUnit
_08045F5C: .4byte 0x03001418
_08045F60: .4byte 0x03001414
_08045F64: .4byte 0x0203DC74
_08045F68: .4byte gPlaySt
_08045F6C: .4byte 0x00000385

	thumb_func_start sub_8045F70
sub_8045F70: @ 0x08045F70
	push {lr}
	bl sub_8044AD0
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_8045F7C
sub_8045F7C: @ 0x08045F7C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	mov r8, r0
	ldr r6, _08046058 @ =0x0203DC74
	ldrb r0, [r6, #2]
	str r0, [sp, #4]
	ldr r1, _0804605C @ =gpKeySt
	ldr r0, [r1]
	ldrh r0, [r0, #6]
	movs r1, #1
	bl sub_8045B40
	ldr r2, _08046060 @ =gActiveUnitId
	mov sl, r2
	ldr r0, _08046064 @ =0x03001400
	mov sb, r0
	ldrb r0, [r6, #2]
	add r0, sb
	ldrb r0, [r0]
	strb r0, [r2]
	ldrb r0, [r2]
	bl GetUnit
	ldr r1, _08046068 @ =gActiveUnit
	str r0, [r1]
	movs r2, #0x10
	ldrsb r2, [r0, r2]
	lsls r5, r2, #4
	movs r1, #0x11
	ldrsb r1, [r0, r1]
	lsls r4, r1, #4
	adds r0, r2, #0
	bl sub_8015F0C
	bl GetGameTime
	subs r0, #1
	ldr r7, _0804606C @ =0x03001418
	ldr r1, [r7]
	cmp r0, r1
	bne _08045FE8
	ldr r0, _08046070 @ =0x03001414
	movs r2, #0
	ldrsh r1, [r0, r2]
	adds r1, r5, r1
	asrs r5, r1, #1
	movs r1, #2
	ldrsh r0, [r0, r1]
	adds r0, r4, r0
	asrs r4, r0, #1
_08045FE8:
	ldr r0, _08046070 @ =0x03001414
	strh r5, [r0]
	strh r4, [r0, #2]
	bl GetGameTime
	str r0, [r7]
	adds r0, r5, #0
	adds r1, r4, #0
	movs r2, #0
	bl sub_8015DE8
	ldr r2, _0804605C @ =gpKeySt
	ldr r0, [r2]
	ldrh r1, [r0, #8]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0804607C
	ldr r0, _08046074 @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0804601E
	ldr r0, _08046078 @ =0x00000389
	bl m4aSongNumStart
_0804601E:
	ldrb r0, [r6, #2]
	add r0, sb
	ldrb r0, [r0]
	adds r2, r6, #5
	mov r3, r8
	adds r3, #0x34
	mov r1, r8
	adds r1, #0x38
	str r1, [sp]
	movs r1, #1
	bl sub_8045400
	ldrb r0, [r6, #5]
	add r0, sb
	ldrb r1, [r0]
	mov r0, sl
	ldrb r2, [r0]
	movs r0, #3
	movs r3, #0
	bl sub_8045388
	bl sub_8044AF8
	mov r0, r8
	movs r1, #7
	bl Proc_Goto
	b _08046130
	.align 2, 0
_08046058: .4byte 0x0203DC74
_0804605C: .4byte gpKeySt
_08046060: .4byte gActiveUnitId
_08046064: .4byte 0x03001400
_08046068: .4byte gActiveUnit
_0804606C: .4byte 0x03001418
_08046070: .4byte 0x03001414
_08046074: .4byte gPlaySt
_08046078: .4byte 0x00000389
_0804607C:
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _080460E8
	ldr r0, _080460DC @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08046096
	ldr r0, _080460E0 @ =0x0000038B
	bl m4aSongNumStart
_08046096:
	ldr r0, _080460E4 @ =0x03001420
	ldr r0, [r0]
	bl sub_806D4BC
	ldrb r0, [r6, #4]
	add r0, sb
	ldrb r0, [r0]
	bl GetUnit
	ldr r1, [r0, #0xc]
	movs r2, #2
	rsbs r2, r2, #0
	ands r1, r2
	str r1, [r0, #0xc]
	bl sub_8045314
	ldrb r0, [r6, #4]
	strb r0, [r6, #2]
	adds r0, #1
	strb r0, [r6, #3]
	mov r2, sl
	ldrb r1, [r2]
	ldrb r0, [r6, #4]
	add r0, sb
	ldrb r2, [r0]
	movs r0, #2
	movs r3, #0
	bl sub_8045388
	mov r0, r8
	movs r1, #1
	bl Proc_Goto
	b _08046130
	.align 2, 0
_080460DC: .4byte gPlaySt
_080460E0: .4byte 0x0000038B
_080460E4: .4byte 0x03001420
_080460E8:
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r1
	cmp r0, #0
	beq _08046114
	ldr r1, _08046110 @ =gActiveUnit
	ldr r0, [r1]
	ldr r0, [r0, #0xc]
	movs r1, #0x80
	lsls r1, r1, #2
	ands r0, r1
	cmp r0, #0
	bne _08046114
	bl MU_EndAll
	mov r0, r8
	movs r1, #6
	bl Proc_Goto
	b _08046130
	.align 2, 0
_08046110: .4byte gActiveUnit
_08046114:
	ldr r0, _08046140 @ =0x0203DC74
	ldr r2, [sp, #4]
	ldrb r0, [r0, #2]
	cmp r2, r0
	beq _08046130
	ldr r0, _08046144 @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08046130
	ldr r0, _08046148 @ =0x00000385
	bl m4aSongNumStart
_08046130:
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08046140: .4byte 0x0203DC74
_08046144: .4byte gPlaySt
_08046148: .4byte 0x00000385

	thumb_func_start sub_804614C
sub_804614C: @ 0x0804614C
	push {r4, lr}
	adds r4, r0, #0
	bl ResetTextFont
	ldr r1, _0804618C @ =0x0203DC74
	movs r0, #0xff
	strb r0, [r1, #6]
	ldr r0, _08046190 @ =0x03001400
	ldrb r1, [r1, #4]
	adds r0, r1, r0
	ldrb r0, [r0]
	bl GetUnit
	ldr r1, _08046194 @ =gActiveUnit
	str r0, [r1]
	bl sub_80452DC
	bl sub_80157A4
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r4, #0x64
	strh r0, [r4]
	movs r0, #4
	bl ApplyIconPalettes
	ldr r0, _08046198 @ =gUnk_08C09B0C
	bl StartMenu
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0804618C: .4byte 0x0203DC74
_08046190: .4byte 0x03001400
_08046194: .4byte gActiveUnit
_08046198: .4byte gUnk_08C09B0C

	thumb_func_start sub_804619C
sub_804619C: @ 0x0804619C
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r0, #0x64
	movs r1, #0
	ldrsh r4, [r0, r1]
	bl sub_80157A4
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r4, r0
	bne _080461CE
	ldr r0, _080461D4 @ =0x0203DC74
	ldrb r0, [r0, #6]
	cmp r0, #0
	bne _080461C8
	ldr r0, _080461D8 @ =gActiveUnit
	ldr r0, [r0]
	bl sub_80452F8
	adds r0, r5, #0
	bl Proc_End
_080461C8:
	adds r0, r5, #0
	bl Proc_Break
_080461CE:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080461D4: .4byte 0x0203DC74
_080461D8: .4byte gActiveUnit

	thumb_func_start sub_80461DC
sub_80461DC: @ 0x080461DC
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	ldr r0, _08046214 @ =gActiveUnit
	ldr r0, [r0]
	ldr r6, _08046218 @ =0x0203DC74
	ldrb r2, [r6, #7]
	lsls r1, r2, #1
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r5, [r0]
	bl sub_80157A4
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r4, #0x64
	strh r0, [r4]
	adds r0, r5, #0
	bl sub_8017774
	cmp r0, #1
	bne _0804621C
	adds r0, r5, #0
	bl sub_801778C
	cmp r0, #1
	bne _0804621C
	strb r0, [r6, #6]
	b _0804629E
	.align 2, 0
_08046214: .4byte gActiveUnit
_08046218: .4byte 0x0203DC74
_0804621C:
	adds r0, r5, #0
	bl sub_8017774
	cmp r0, #2
	bne _0804623C
	adds r0, r5, #0
	bl sub_801778C
	adds r1, r0, #0
	cmp r1, #2
	bne _0804623C
	ldr r0, _08046238 @ =0x0203DC74
	strb r1, [r0, #6]
	b _0804629E
	.align 2, 0
_08046238: .4byte 0x0203DC74
_0804623C:
	adds r0, r5, #0
	bl sub_8017774
	adds r4, r0, #0
	cmp r4, #2
	bne _0804625C
	adds r0, r5, #0
	bl sub_801778C
	cmp r0, #3
	bne _0804625C
	ldr r0, _08046258 @ =0x0203DC74
	strb r4, [r0, #6]
	b _0804629E
	.align 2, 0
_08046258: .4byte 0x0203DC74
_0804625C:
	ldr r0, _0804627C @ =0x03001400
	ldr r4, _08046280 @ =0x0203DC74
	ldrb r1, [r4, #5]
	adds r0, r1, r0
	ldrb r0, [r0]
	bl GetUnit
	bl GetUnitEquippedWeapon
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	cmp r5, #0
	bne _08046284
	movs r0, #1
	strb r0, [r4, #6]
	b _0804629E
	.align 2, 0
_0804627C: .4byte 0x03001400
_08046280: .4byte 0x0203DC74
_08046284:
	adds r0, r5, #0
	bl sub_8017774
	cmp r0, #1
	ble _08046294
	movs r0, #2
	strb r0, [r4, #6]
	b _0804629E
_08046294:
	movs r0, #1
	strb r0, [r4, #6]
	movs r0, #4
	bl ApplyIconPalettes
_0804629E:
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	thumb_func_start sub_80462A4
sub_80462A4: @ 0x080462A4
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	adds r6, r0, #0
	movs r0, #0
	mov sl, r0
	movs r1, #1
	str r1, [sp, #4]
	ldr r4, _0804632C @ =0x03001400
	ldr r2, _08046330 @ =0x0203DC74
	mov r8, r2
	ldrb r1, [r2, #4]
	adds r0, r1, r4
	ldrb r0, [r0]
	bl GetUnit
	mov sb, r0
	mov r2, r8
	ldrb r2, [r2, #5]
	adds r4, r2, r4
	ldrb r0, [r4]
	bl GetUnit
	adds r5, r0, #0
	adds r0, r6, #0
	adds r0, #0x64
	movs r1, #0
	ldrsh r4, [r0, r1]
	bl sub_80157A4
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r4, r0
	bne _080463A2
	movs r0, #0x11
	ldrsb r0, [r5, r0]
	adds r0, #1
	ldr r1, _08046334 @ =gBmMapTerrain
	ldr r1, [r1]
	lsls r0, r0, #2
	adds r0, r0, r1
	movs r1, #0x10
	ldrsb r1, [r5, r1]
	ldr r0, [r0]
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #0x17
	beq _08046310
	movs r2, #1
	rsbs r2, r2, #0
	str r2, [sp, #4]
_08046310:
	mov r1, r8
	ldrb r0, [r1, #6]
	cmp r0, #0
	bne _0804633C
	ldr r0, _08046338 @ =gActiveUnit
	ldr r0, [r0]
	bl sub_80452F8
	adds r0, r6, #0
	movs r1, #0
	bl Proc_Goto
	b _080463A2
	.align 2, 0
_0804632C: .4byte 0x03001400
_08046330: .4byte 0x0203DC74
_08046334: .4byte gBmMapTerrain
_08046338: .4byte gActiveUnit
_0804633C:
	ldr r7, _08046390 @ =gActiveUnit
	ldr r0, [r7]
	mov r2, r8
	ldrb r1, [r2, #7]
	bl EquipUnitItemSlot
	ldr r4, [r5, #0xc]
	movs r0, #0x80
	lsls r0, r0, #2
	ands r4, r0
	cmp r4, #0
	bne _08046394
	adds r0, r6, #0
	bl sub_80345D4
	mov r0, r8
	ldrb r0, [r0, #6]
	cmp r0, #2
	bne _08046366
	movs r1, #1
	mov sl, r1
_08046366:
	movs r2, #0x10
	ldrsb r2, [r5, r2]
	add r2, sl
	movs r3, #0x11
	ldrsb r3, [r5, r3]
	ldr r0, [sp, #4]
	adds r3, r3, r0
	str r4, [sp]
	mov r0, sb
	adds r1, r5, #0
	bl BattleGenerateSimulation
	bl sub_803463C
	ldr r0, [r7]
	bl sub_80452F8
	adds r0, r6, #0
	bl Proc_Break
	b _080463A2
	.align 2, 0
_08046390: .4byte gActiveUnit
_08046394:
	ldr r0, [r7]
	bl sub_80452F8
	adds r0, r6, #0
	movs r1, #1
	bl Proc_Goto
_080463A2:
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_80463B4
sub_80463B4: @ 0x080463B4
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _080463E4 @ =gpKeySt
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _080463F0
	ldr r0, _080463E8 @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080463D8
	ldr r0, _080463EC @ =0x0000038A
	bl m4aSongNumStart
_080463D8:
	bl sub_8034664
	adds r0, r4, #0
	bl Proc_Break
	b _08046416
	.align 2, 0
_080463E4: .4byte gpKeySt
_080463E8: .4byte gPlaySt
_080463EC: .4byte 0x0000038A
_080463F0:
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _08046416
	ldr r0, _0804641C @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0804640A
	ldr r0, _08046420 @ =0x0000038B
	bl m4aSongNumStart
_0804640A:
	bl sub_8034664
	adds r0, r4, #0
	movs r1, #0
	bl Proc_Goto
_08046416:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0804641C: .4byte gPlaySt
_08046420: .4byte 0x0000038B

	thumb_func_start sub_8046424
sub_8046424: @ 0x08046424
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0804643C @ =gUnk_08C08F74
	adds r1, r4, #0
	bl Proc_StartBlocking
	adds r0, r4, #0
	bl Proc_Break
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0804643C: .4byte gUnk_08C08F74

	thumb_func_start sub_8046440
sub_8046440: @ 0x08046440
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	ldr r0, _08046474 @ =0x03001400
	ldr r6, _08046478 @ =0x0203DC74
	ldrb r1, [r6, #5]
	adds r0, r1, r0
	ldrb r0, [r0]
	bl GetUnit
	adds r4, r0, #0
	bl ClearBg0Bg1
	ldrb r0, [r6, #6]
	cmp r0, #0
	bne _080464CC
	ldr r0, [r4, #0xc]
	movs r1, #0x80
	lsls r1, r1, #2
	ands r0, r1
	cmp r0, #0
	bne _08046480
	ldr r0, _0804647C @ =0x03001420
	ldr r0, [r0, #4]
	bl sub_806D4BC
	b _08046488
	.align 2, 0
_08046474: .4byte 0x03001400
_08046478: .4byte 0x0203DC74
_0804647C: .4byte 0x03001420
_08046480:
	ldr r0, [r5, #0x34]
	strb r0, [r4, #0x10]
	ldr r0, [r5, #0x38]
	strb r0, [r4, #0x11]
_08046488:
	ldr r0, [r4, #0xc]
	movs r1, #2
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r4, #0xc]
	bl RefreshUnitSprites
	ldr r1, _080464C4 @ =0x0203DC74
	ldrb r0, [r1, #5]
	strb r0, [r1, #2]
	adds r0, #1
	strb r0, [r1, #3]
	ldr r0, _080464C8 @ =0x03001400
	ldrb r1, [r1, #5]
	adds r0, r1, r0
	ldrb r2, [r0]
	movs r0, #4
	movs r1, #0
	movs r3, #0
	bl sub_8045388
	adds r0, r5, #0
	bl sub_8045F70
	adds r0, r5, #0
	movs r1, #5
	bl Proc_Goto
	b _08046502
	.align 2, 0
_080464C4: .4byte 0x0203DC74
_080464C8: .4byte 0x03001400
_080464CC:
	ldr r0, [r4, #0xc]
	movs r1, #0x80
	lsls r1, r1, #2
	ands r0, r1
	cmp r0, #0
	beq _080464F6
	adds r0, r4, #0
	bl StartMu
	ldr r1, _08046508 @ =0x03001420
	str r0, [r1, #4]
	movs r0, #0x10
	ldrsb r0, [r4, r0]
	str r0, [r5, #0x34]
	movs r0, #0x11
	ldrsb r0, [r4, r0]
	str r0, [r5, #0x38]
	ldr r0, [r4, #0xc]
	ldr r1, _0804650C @ =0xFFFFFDFF
	ands r0, r1
	str r0, [r4, #0xc]
_080464F6:
	ldrb r2, [r6, #6]
	ldrb r3, [r6, #7]
	movs r0, #5
	movs r1, #0
	bl sub_8045388
_08046502:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08046508: .4byte 0x03001420
_0804650C: .4byte 0xFFFFFDFF

	thumb_func_start sub_8046510
sub_8046510: @ 0x08046510
	push {r4, r5, r6, lr}
	mov r6, sb
	mov r5, r8
	push {r5, r6}
	sub sp, #0xc
	adds r6, r0, #0
	ldr r4, _08046588 @ =0x03001400
	ldr r5, _0804658C @ =0x0203DC74
	ldrb r1, [r5, #4]
	adds r0, r1, r4
	ldrb r0, [r0]
	bl GetUnit
	mov r8, r0
	ldrb r5, [r5, #5]
	adds r4, r5, r4
	ldrb r0, [r4]
	bl GetUnit
	adds r4, r0, #0
	ldr r0, [r6, #0x2c]
	movs r1, #0
	mov sb, r1
	mov r1, r8
	strb r0, [r1, #0x10]
	ldr r0, [r6, #0x30]
	strb r0, [r1, #0x11]
	ldr r0, [r6, #0x34]
	strb r0, [r4, #0x10]
	ldr r0, [r6, #0x38]
	strb r0, [r4, #0x11]
	ldr r5, _08046590 @ =0x03001420
	ldr r1, [r5]
	movs r0, #1
	str r0, [sp]
	str r0, [sp, #4]
	str r6, [sp, #8]
	mov r0, r8
	movs r2, #6
	movs r3, #5
	bl sub_80481EC
	ldr r1, [r5, #4]
	mov r0, sb
	str r0, [sp]
	str r0, [sp, #4]
	str r6, [sp, #8]
	adds r0, r4, #0
	movs r2, #8
	movs r3, #5
	bl sub_80481EC
	add sp, #0xc
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08046588: .4byte 0x03001400
_0804658C: .4byte 0x0203DC74
_08046590: .4byte 0x03001420

	thumb_func_start sub_8046594
sub_8046594: @ 0x08046594
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	ldr r4, _080465F0 @ =0x03001400
	ldr r5, _080465F4 @ =0x0203DC74
	ldrb r1, [r5, #4]
	adds r0, r1, r4
	ldrb r0, [r0]
	bl GetUnit
	adds r7, r0, #0
	ldr r1, _080465F8 @ =gUnk_081DB17A
	mov r0, sp
	movs r2, #2
	bl memcpy
	ldr r6, _080465FC @ =0x03001420
	ldr r0, [r6, #4]
	bl sub_806D4BC
	ldrb r5, [r5, #5]
	adds r4, r5, r4
	ldrb r0, [r4]
	bl GetUnit
	ldr r1, [r0, #0xc]
	movs r2, #2
	rsbs r2, r2, #0
	ands r1, r2
	str r1, [r0, #0xc]
	ldr r0, _08046600 @ =0x0300141C
	ldrb r0, [r0, #2]
	cmp r0, #1
	bne _080465E2
	ldr r0, [r6]
	mov r1, sp
	bl sub_806C8F0
	movs r0, #7
	strb r0, [r7, #0x10]
_080465E2:
	bl sub_8045314
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080465F0: .4byte 0x03001400
_080465F4: .4byte 0x0203DC74
_080465F8: .4byte gUnk_081DB17A
_080465FC: .4byte 0x03001420
_08046600: .4byte 0x0300141C

	thumb_func_start sub_8046604
sub_8046604: @ 0x08046604
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r7, r0, #0
	bl sub_806C850
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	beq _08046672
	ldr r4, _0804667C @ =0x03001400
	ldr r5, _08046680 @ =0x0203DC74
	ldrb r1, [r5, #4]
	adds r0, r1, r4
	ldrb r0, [r0]
	bl GetUnit
	adds r6, r0, #0
	ldrb r2, [r5, #5]
	adds r0, r2, r4
	ldrb r0, [r0]
	bl GetUnit
	mov r8, r0
	adds r0, r6, #0
	bl HideUnitSprite
	ldr r1, _08046684 @ =gActionSt
	movs r0, #2
	strb r0, [r1, #0x11]
	ldrb r5, [r5, #5]
	adds r4, r5, r4
	ldrb r0, [r4]
	strb r0, [r1, #0xd]
	ldr r0, _08046688 @ =0x0300141C
	ldrb r1, [r0, #3]
	adds r0, r6, #0
	bl EquipUnitItemSlot
	adds r0, r6, #0
	mov r1, r8
	bl BattleGenerateReal
	ldr r1, _0804668C @ =gBmSt
	movs r0, #0x40
	ldrb r2, [r1, #4]
	orrs r0, r2
	strb r0, [r1, #4]
	ldr r0, _08046690 @ =gUnk_08C094E4
	adds r1, r7, #0
	bl Proc_StartBlocking
	adds r0, r7, #0
	bl Proc_Break
_08046672:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0804667C: .4byte 0x03001400
_08046680: .4byte 0x0203DC74
_08046684: .4byte gActionSt
_08046688: .4byte 0x0300141C
_0804668C: .4byte gBmSt
_08046690: .4byte gUnk_08C094E4

	thumb_func_start sub_8046694
sub_8046694: @ 0x08046694
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	mov sl, r0
	ldr r0, _08046780 @ =0x03001400
	ldr r1, _08046784 @ =0x0203DC74
	mov r8, r1
	ldrb r2, [r1, #4]
	adds r1, r2, r0
	ldrb r4, [r1]
	mov r3, r8
	ldrb r3, [r3, #5]
	adds r0, r3, r0
	ldrb r5, [r0]
	adds r0, r4, #0
	bl GetUnit
	adds r6, r0, #0
	adds r0, r5, #0
	bl GetUnit
	adds r7, r0, #0
	bl sub_80457A8
	lsrs r0, r4, #6
	lsls r0, r0, #3
	mov r2, r8
	adds r2, #0x30
	adds r3, r0, r2
	ldr r1, _08046788 @ =gBattleActor
	mov sb, r1
	adds r1, #0x6e
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	str r1, [r3]
	add r0, r8
	adds r0, #0x2c
	movs r3, #0
	strb r4, [r0]
	strb r3, [r6, #9]
	lsrs r0, r5, #6
	lsls r0, r0, #3
	adds r2, r0, r2
	ldr r4, _0804678C @ =gBattleTarget
	adds r1, r4, #0
	adds r1, #0x6e
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	str r1, [r2]
	add r0, r8
	adds r0, #0x2c
	strb r5, [r0]
	strb r3, [r7, #9]
	adds r0, r6, #0
	bl sub_80495F4
	adds r0, r7, #0
	bl sub_80495F4
	adds r0, r6, #0
	movs r1, #0
	bl SetUnitStatus
	adds r0, r7, #0
	movs r1, #0
	bl SetUnitStatus
	bl MU_EndAll
	adds r0, r6, #0
	bl GetUnitCurrentHp
	cmp r0, #0
	beq _08046740
	adds r0, r6, #0
	bl ShowUnitSprite
	ldr r0, [r6, #0xc]
	movs r1, #2
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r6, #0xc]
_08046740:
	bl sub_8045314
	movs r0, #2
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	adds r0, r6, #0
	bl GetUnitCurrentHp
	mov r1, sb
	adds r1, #0x72
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	cmp r0, r1
	bne _08046790
	adds r0, r7, #0
	bl GetUnitCurrentHp
	adds r1, r4, #0
	adds r1, #0x72
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	cmp r0, r1
	bne _08046790
	mov r2, r8
	ldrb r0, [r2, #9]
	adds r0, #1
	strb r0, [r2, #9]
	b _08046796
	.align 2, 0
_08046780: .4byte 0x03001400
_08046784: .4byte 0x0203DC74
_08046788: .4byte gBattleActor
_0804678C: .4byte gBattleTarget
_08046790:
	ldr r1, _080467AC @ =0x0203DC74
	movs r0, #0
	strb r0, [r1, #9]
_08046796:
	mov r0, sl
	bl Proc_Break
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080467AC: .4byte 0x0203DC74

	thumb_func_start sub_80467B0
sub_80467B0: @ 0x080467B0
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x18
	str r0, [sp, #0xc]
	ldr r1, _0804681C @ =0x03001400
	ldr r0, _08046820 @ =0x0203DC74
	mov sl, r0
	ldrb r2, [r0, #4]
	adds r0, r2, r1
	ldrb r0, [r0]
	adds r5, r0, #0
	mov r3, sl
	ldrb r3, [r3, #5]
	adds r1, r3, r1
	ldrb r1, [r1]
	mov sb, r1
	bl GetUnit
	adds r4, r0, #0
	mov r0, sb
	bl GetUnit
	mov r8, r0
	movs r7, #0
	adds r0, r5, #0
	bl sub_80453E0
	str r0, [sp, #0x10]
	mov r0, sb
	bl sub_80453E0
	str r0, [sp, #0x14]
	ldr r6, _08046824 @ =0x03001420
	str r7, [r6, #4]
	str r7, [r6]
	ldr r0, [r4, #0xc]
	ldr r1, _08046828 @ =0x00010004
	ands r0, r1
	cmp r0, #0
	bne _0804680C
	ldr r0, [r4]
	cmp r0, #0
	bne _0804682C
_0804680C:
	lsrs r0, r5, #6
	mov r1, sl
	adds r1, #0xa
	adds r0, r0, r1
	ldrb r1, [r0]
	subs r1, #1
	strb r1, [r0]
	b _08046864
	.align 2, 0
_0804681C: .4byte 0x03001400
_08046820: .4byte 0x0203DC74
_08046824: .4byte 0x03001420
_08046828: .4byte 0x00010004
_0804682C:
	adds r0, r4, #0
	bl StartMu
	str r0, [r6]
	bl sub_806C3D8
	ldr r0, [r4, #0xc]
	movs r1, #1
	orrs r0, r1
	str r0, [r4, #0xc]
	movs r7, #1
	ldr r1, [r6]
	ldr r2, _0804688C @ =gUnk_081DB0F8
	ldr r5, [sp, #0x10]
	lsls r0, r5, #2
	adds r0, r0, r2
	movs r3, #0
	ldrsh r2, [r0, r3]
	movs r5, #2
	ldrsh r3, [r0, r5]
	movs r0, #2
	str r0, [sp]
	str r7, [sp, #4]
	ldr r0, [sp, #0xc]
	str r0, [sp, #8]
	adds r0, r4, #0
	bl sub_80481EC
_08046864:
	mov r1, r8
	ldr r0, [r1, #0xc]
	ldr r1, _08046890 @ =0x00010004
	ands r0, r1
	cmp r0, #0
	bne _08046878
	mov r2, r8
	ldr r0, [r2]
	cmp r0, #0
	bne _08046898
_08046878:
	ldr r0, _08046894 @ =0x0203DC74
	mov r3, sb
	lsrs r1, r3, #6
	adds r0, #0xa
	adds r1, r1, r0
	ldrb r0, [r1]
	subs r0, #1
	strb r0, [r1]
	b _080468DC
	.align 2, 0
_0804688C: .4byte gUnk_081DB0F8
_08046890: .4byte 0x00010004
_08046894: .4byte 0x0203DC74
_08046898:
	mov r0, r8
	bl StartMu
	ldr r4, _080468F8 @ =0x03001420
	str r0, [r4, #4]
	bl sub_806C3D8
	mov r5, r8
	ldr r0, [r5, #0xc]
	movs r1, #1
	orrs r0, r1
	str r0, [r5, #0xc]
	adds r0, r7, #0
	movs r7, #0
	cmp r0, #0
	bne _080468BA
	movs r7, #1
_080468BA:
	ldr r1, [r4, #4]
	ldr r2, _080468FC @ =gUnk_081DB0F8
	ldr r3, [sp, #0x14]
	lsls r0, r3, #2
	adds r0, r0, r2
	movs r4, #0
	ldrsh r2, [r0, r4]
	movs r5, #2
	ldrsh r3, [r0, r5]
	movs r0, #2
	str r0, [sp]
	str r7, [sp, #4]
	ldr r0, [sp, #0xc]
	str r0, [sp, #8]
	mov r0, r8
	bl sub_80481EC
_080468DC:
	bl sub_8045314
	ldr r0, [sp, #0xc]
	bl Proc_Break
	add sp, #0x18
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080468F8: .4byte 0x03001420
_080468FC: .4byte gUnk_081DB0F8

	thumb_func_start sub_8046900
sub_8046900: @ 0x08046900
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	movs r3, #0
_0804690A:
	lsls r0, r3, #0x18
	lsrs r0, r0, #0x18
	str r3, [sp]
	bl sub_803D1CC
	lsls r0, r0, #0x18
	ldr r3, [sp]
	adds r1, r3, #1
	mov r8, r1
	cmp r0, #0
	beq _08046970
	movs r6, #0
	movs r7, #0
	ldr r0, _08046984 @ =0x03001400
	adds r4, r3, r0
	movs r5, #4
_0804692A:
	ldrb r0, [r4]
	cmp r0, #0
	beq _08046958
	adds r7, #1
	str r3, [sp]
	bl GetUnit
	adds r2, r0, #0
	ldr r0, [r2, #0xc]
	ldr r1, _08046988 @ =0x00010004
	ands r0, r1
	ldr r3, [sp]
	cmp r0, #0
	bne _08046958
	adds r0, r2, #0
	bl sub_8045CAC
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	ldr r3, [sp]
	cmp r0, #1
	bne _08046958
	adds r6, #1
_08046958:
	adds r4, #5
	subs r5, #1
	cmp r5, #0
	bge _0804692A
	cmp r6, #0
	bne _08046970
	cmp r7, #0
	beq _08046970
	ldr r0, _0804698C @ =0x0203DC74
	adds r0, #0xa
	adds r0, r3, r0
	strb r6, [r0]
_08046970:
	mov r3, r8
	cmp r3, #3
	ble _0804690A
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08046984: .4byte 0x03001400
_08046988: .4byte 0x00010004
_0804698C: .4byte 0x0203DC74

	thumb_func_start sub_8046990
sub_8046990: @ 0x08046990
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	mov r8, r0
	ldr r0, _08046A34 @ =0x03001400
	ldr r5, _08046A38 @ =0x0203DC74
	ldrb r2, [r5, #4]
	adds r1, r2, r0
	ldrb r6, [r1]
	ldrb r1, [r5, #5]
	adds r0, r1, r0
	ldrb r7, [r0]
	adds r0, r6, #0
	bl GetUnit
	adds r4, r0, #0
	adds r0, r7, #0
	bl GetUnit
	adds r2, r0, #0
	ldr r1, [r4, #0xc]
	ldr r3, _08046A3C @ =0x00010004
	adds r0, r1, #0
	ands r0, r3
	cmp r0, #0
	bne _080469CC
	movs r0, #2
	rsbs r0, r0, #0
	ands r1, r0
	str r1, [r4, #0xc]
_080469CC:
	ldr r1, [r2, #0xc]
	adds r0, r1, #0
	ands r0, r3
	cmp r0, #0
	bne _080469DE
	movs r0, #2
	rsbs r0, r0, #0
	ands r1, r0
	str r1, [r2, #0xc]
_080469DE:
	lsrs r0, r6, #6
	adds r1, r0, #0
	adds r2, r5, #0
	adds r2, #0xa
	adds r0, r1, r2
	ldrb r0, [r0]
	adds r5, r1, #0
	cmp r0, #0
	beq _080469FA
	lsrs r1, r7, #6
	adds r0, r1, r2
	ldrb r0, [r0]
	cmp r0, #0
	bne _08046A56
_080469FA:
	adds r4, r1, #0
	ldr r2, _08046A38 @ =0x0203DC74
	ldr r3, _08046A40 @ =0x0203D908
	adds r3, #0xa0
	ldrb r6, [r3]
	ldrb r1, [r2, #0xe]
	subs r0, r6, r1
	adds r1, r2, #0
	adds r1, #0xf
	adds r0, r0, r1
	strb r4, [r0]
	ldrb r0, [r2, #0xe]
	adds r0, #1
	strb r0, [r2, #0xe]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldrb r3, [r3]
	cmp r0, r3
	bne _08046A56
	adds r1, r5, #0
	adds r0, r2, #0
	adds r0, #0xa
	adds r0, r1, r0
	ldrb r0, [r0]
	cmp r0, #0
	beq _08046A44
	adds r4, r1, #0
	b _08046A46
	.align 2, 0
_08046A34: .4byte 0x03001400
_08046A38: .4byte 0x0203DC74
_08046A3C: .4byte 0x00010004
_08046A40: .4byte 0x0203D908
_08046A44:
	lsrs r4, r7, #6
_08046A46:
	strb r4, [r2, #0xf]
	movs r0, #0xff
	bl sub_8045324
	mov r0, r8
	bl Proc_Break
	b _08046A64
_08046A56:
	ldr r0, _08046A70 @ =gPlaySt
	ldrb r0, [r0, #0xf]
	bl sub_8045324
	mov r0, r8
	bl Proc_Break
_08046A64:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08046A70: .4byte gPlaySt

	thumb_func_start sub_8046A74
sub_8046A74: @ 0x08046A74
	push {lr}
	bl MU_EndAll
	bl MU_EndAll
	bl sub_80455BC
	bl sub_804561C
	bl RefreshUnitSprites
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_8046A90
sub_8046A90: @ 0x08046A90
	push {lr}
	ldr r0, _08046ABC @ =gpKeySt
	ldr r1, [r0]
	movs r0, #2
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _08046AB8
	ldr r0, _08046AC0 @ =0x030046BC
	movs r2, #0
	movs r1, #0xc4
	strb r1, [r0]
	ldr r1, _08046AC4 @ =gUnk_08C07DAC
	ldr r1, [r1]
	ldrb r1, [r1, #6]
	strb r1, [r0, #1]
	strh r2, [r0, #2]
	movs r1, #4
	bl sub_803D2E4
_08046AB8:
	pop {r0}
	bx r0
	.align 2, 0
_08046ABC: .4byte gpKeySt
_08046AC0: .4byte 0x030046BC
_08046AC4: .4byte gUnk_08C07DAC

	thumb_func_start sub_8046AC8
sub_8046AC8: @ 0x08046AC8
	ldrb r0, [r0]
	cmp r0, #1
	beq _08046ADA
	cmp r0, #1
	blt _08046ADE
	cmp r0, #7
	bgt _08046ADE
	cmp r0, #6
	blt _08046ADE
_08046ADA:
	movs r0, #1
	b _08046AE0
_08046ADE:
	movs r0, #0
_08046AE0:
	bx lr
	.align 2, 0

	thumb_func_start sub_8046AE4
sub_8046AE4: @ 0x08046AE4
	push {r4, r5, lr}
	sub sp, #8
	adds r5, r0, #0
	ldr r4, _08046B0C @ =0x0300141C
	ldr r2, _08046B10 @ =sub_8046AC8
	adds r0, r4, #0
	add r1, sp, #4
	bl sub_803D7CC
	lsls r0, r0, #0x10
	cmp r0, #0
	beq _08046B8C
	ldrb r0, [r4]
	cmp r0, #6
	beq _08046B3C
	cmp r0, #6
	bgt _08046B14
	cmp r0, #1
	beq _08046B1A
	b _08046B8C
	.align 2, 0
_08046B0C: .4byte 0x0300141C
_08046B10: .4byte sub_8046AC8
_08046B14:
	cmp r0, #7
	beq _08046B74
	b _08046B8C
_08046B1A:
	ldrb r0, [r4, #1]
	ldr r2, _08046B38 @ =0x0203DC78
	adds r3, r5, #0
	adds r3, #0x2c
	adds r1, r5, #0
	adds r1, #0x30
	str r1, [sp]
	movs r1, #0
	bl sub_8045400
	adds r0, r5, #0
	movs r1, #1
	bl Proc_Goto
	b _08046B8C
	.align 2, 0
_08046B38: .4byte 0x0203DC78
_08046B3C:
	bl sub_8044AF8
	add r1, sp, #4
	ldrb r2, [r1]
	lsls r0, r2, #4
	subs r0, r0, r2
	ldr r1, _08046B68 @ =0x0203D9A9
	adds r0, r0, r1
	ldr r1, _08046B6C @ =0x03001438
	bl sub_803DDF8
	ldr r0, _08046B70 @ =gUnk_08C08FC4
	movs r1, #0x60
	movs r2, #0
	movs r3, #0
	bl sub_800ACE8
	adds r0, r5, #0
	movs r1, #3
	bl Proc_Goto
	b _08046B8C
	.align 2, 0
_08046B68: .4byte 0x0203D9A9
_08046B6C: .4byte 0x03001438
_08046B70: .4byte gUnk_08C08FC4
_08046B74:
	bl sub_8044AF8
	ldr r0, _08046B98 @ =gUnk_08C08FE4
	movs r1, #0x60
	movs r2, #0
	movs r3, #0
	bl sub_800ACE8
	adds r0, r5, #0
	movs r1, #4
	bl Proc_Goto
_08046B8C:
	bl sub_8046A90
	add sp, #8
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08046B98: .4byte gUnk_08C08FE4

	thumb_func_start sub_8046B9C
sub_8046B9C: @ 0x08046B9C
	ldrb r0, [r0]
	cmp r0, #3
	bgt _08046BAA
	cmp r0, #2
	blt _08046BAA
	movs r0, #1
	b _08046BAC
_08046BAA:
	movs r0, #0
_08046BAC:
	bx lr
	.align 2, 0

	thumb_func_start sub_8046BB0
sub_8046BB0: @ 0x08046BB0
	push {r4, r5, lr}
	sub sp, #8
	adds r5, r0, #0
	ldr r4, _08046BD4 @ =0x0300141C
	ldr r2, _08046BD8 @ =sub_8046B9C
	adds r0, r4, #0
	add r1, sp, #4
	bl sub_803D7CC
	lsls r0, r0, #0x10
	cmp r0, #0
	beq _08046C3C
	ldrb r0, [r4]
	cmp r0, #2
	beq _08046BDC
	cmp r0, #3
	beq _08046C20
	b _08046C3C
	.align 2, 0
_08046BD4: .4byte 0x0300141C
_08046BD8: .4byte sub_8046B9C
_08046BDC:
	ldrb r0, [r4, #2]
	bl GetUnit
	adds r4, r0, #0
	ldr r0, [r4, #0xc]
	movs r1, #0x80
	lsls r1, r1, #2
	ands r0, r1
	cmp r0, #0
	bne _08046C00
	ldr r0, _08046BFC @ =0x03001420
	ldr r0, [r0]
	bl sub_806D4BC
	b _08046C08
	.align 2, 0
_08046BFC: .4byte 0x03001420
_08046C00:
	ldr r0, [r5, #0x2c]
	strb r0, [r4, #0x10]
	ldr r0, [r5, #0x30]
	strb r0, [r4, #0x11]
_08046C08:
	ldr r0, [r4, #0xc]
	movs r1, #2
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r4, #0xc]
	bl RefreshUnitSprites
	adds r0, r5, #0
	movs r1, #0
	bl Proc_Goto
	b _08046C3C
_08046C20:
	ldrb r0, [r4, #1]
	ldr r2, _08046C48 @ =0x0203DC79
	adds r3, r5, #0
	adds r3, #0x34
	adds r1, r5, #0
	adds r1, #0x38
	str r1, [sp]
	movs r1, #1
	bl sub_8045400
	adds r0, r5, #0
	movs r1, #2
	bl Proc_Goto
_08046C3C:
	bl sub_8046A90
	add sp, #8
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08046C48: .4byte 0x0203DC79

	thumb_func_start sub_8046C4C
sub_8046C4C: @ 0x08046C4C
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	adds r5, r0, #0
	adds r4, r1, #0
	adds r6, r2, #0
	mov r8, r3
	bl StartMu
	ldr r1, _08046C88 @ =0x03001420
	lsls r4, r4, #2
	adds r4, r4, r1
	str r0, [r4]
	movs r0, #0x10
	ldrsb r0, [r5, r0]
	str r0, [r6]
	movs r0, #0x11
	ldrsb r0, [r5, r0]
	mov r1, r8
	str r0, [r1]
	ldr r0, [r5, #0xc]
	ldr r1, _08046C8C @ =0xFFFFFDFF
	ands r0, r1
	str r0, [r5, #0xc]
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08046C88: .4byte 0x03001420
_08046C8C: .4byte 0xFFFFFDFF

	thumb_func_start sub_8046C90
sub_8046C90: @ 0x08046C90
	ldrb r0, [r0]
	cmp r0, #5
	bgt _08046C9E
	cmp r0, #4
	blt _08046C9E
	movs r0, #1
	b _08046CA0
_08046C9E:
	movs r0, #0
_08046CA0:
	bx lr
	.align 2, 0

	thumb_func_start sub_8046CA4
sub_8046CA4: @ 0x08046CA4
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r7, r0, #0
	ldr r4, _08046CC8 @ =0x0300141C
	ldr r2, _08046CCC @ =sub_8046C90
	adds r0, r4, #0
	mov r1, sp
	bl sub_803D7CC
	lsls r0, r0, #0x10
	cmp r0, #0
	beq _08046D6A
	ldrb r0, [r4]
	cmp r0, #4
	beq _08046CD0
	cmp r0, #5
	beq _08046D14
	b _08046D6A
	.align 2, 0
_08046CC8: .4byte 0x0300141C
_08046CCC: .4byte sub_8046C90
_08046CD0:
	ldrb r0, [r4, #2]
	bl GetUnit
	adds r6, r0, #0
	ldr r0, [r6, #0xc]
	movs r1, #0x80
	lsls r1, r1, #2
	ands r0, r1
	cmp r0, #0
	bne _08046CF4
	ldr r0, _08046CF0 @ =0x03001420
	ldr r0, [r0, #4]
	bl sub_806D4BC
	b _08046CFC
	.align 2, 0
_08046CF0: .4byte 0x03001420
_08046CF4:
	ldr r0, [r7, #0x34]
	strb r0, [r6, #0x10]
	ldr r0, [r7, #0x38]
	strb r0, [r6, #0x11]
_08046CFC:
	ldr r0, [r6, #0xc]
	movs r1, #2
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r6, #0xc]
	bl RefreshUnitSprites
	adds r0, r7, #0
	movs r1, #1
	bl Proc_Goto
	b _08046D6A
_08046D14:
	ldr r4, _08046D78 @ =0x03001400
	ldr r5, _08046D7C @ =0x0203DC74
	ldrb r1, [r5, #4]
	adds r0, r1, r4
	ldrb r0, [r0]
	bl GetUnit
	adds r6, r0, #0
	ldrb r5, [r5, #5]
	adds r4, r5, r4
	ldrb r0, [r4]
	bl GetUnit
	adds r4, r0, #0
	ldr r0, [r6, #0xc]
	movs r5, #0x80
	lsls r5, r5, #2
	ands r0, r5
	cmp r0, #0
	beq _08046D4C
	adds r2, r7, #0
	adds r2, #0x2c
	adds r3, r7, #0
	adds r3, #0x30
	adds r0, r6, #0
	movs r1, #0
	bl sub_8046C4C
_08046D4C:
	ldr r0, [r4, #0xc]
	ands r0, r5
	cmp r0, #0
	beq _08046D64
	adds r2, r7, #0
	adds r2, #0x34
	adds r3, r7, #0
	adds r3, #0x38
	adds r0, r4, #0
	movs r1, #1
	bl sub_8046C4C
_08046D64:
	adds r0, r7, #0
	bl Proc_Break
_08046D6A:
	bl sub_8046A90
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08046D78: .4byte 0x03001400
_08046D7C: .4byte 0x0203DC74

	thumb_func_start sub_8046D80
sub_8046D80: @ 0x08046D80
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r6, r0, #0
	movs r7, #0
	movs r0, #0
	mov r8, r0
	movs r5, #0
	ldrh r4, [r6, #0x1e]
	cmp r4, #0
	beq _08046DCC
_08046D96:
	adds r0, r6, #0
	adds r1, r4, #0
	bl CanUnitUseWeapon
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08046DB8
	adds r0, r4, #0
	bl GetItemMight
	cmp r0, r8
	bls _08046DB8
	adds r7, r4, #0
	adds r0, r7, #0
	bl GetItemMight
	mov r8, r0
_08046DB8:
	adds r5, #1
	cmp r5, #4
	bgt _08046DCC
	lsls r1, r5, #1
	adds r0, r6, #0
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r4, [r0]
	cmp r4, #0
	bne _08046D96
_08046DCC:
	cmp r7, #0
	beq _08046DDA
	adds r0, r6, #0
	bl GetUnitPower
	add r0, r8
	b _08046DDC
_08046DDA:
	movs r0, #0
_08046DDC:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_8046DE8
sub_8046DE8: @ 0x08046DE8
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r7, r0, #0
	movs r0, #0
	mov r8, r0
	movs r6, #0
	adds r5, r7, #0
	adds r0, r7, #5
	cmp r7, r0
	bge _08046E32
_08046DFE:
	adds r0, r5, #0
	bl GetUnit
	adds r4, r0, #0
	ldr r0, [r4, #0xc]
	ldr r1, _08046E54 @ =0x00010004
	ands r0, r1
	cmp r0, #0
	bne _08046E2A
	ldr r0, [r4]
	cmp r0, #0
	beq _08046E2A
	movs r0, #1
	add r8, r0
	adds r0, r4, #0
	bl sub_8046D80
	adds r6, r6, r0
	adds r0, r4, #0
	bl GetUnitCurrentHp
	adds r6, r6, r0
_08046E2A:
	adds r5, #1
	adds r0, r7, #5
	cmp r5, r0
	blt _08046DFE
_08046E32:
	ldr r0, _08046E58 @ =0x0203DC74
	asrs r1, r7, #6
	lsls r1, r1, #2
	adds r0, #0x14
	adds r1, r1, r0
	ldr r0, [r1]
	adds r6, r6, r0
	adds r0, r6, #0
	mov r1, r8
	bl Div
	adds r6, r0, #0
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_08046E54: .4byte 0x00010004
_08046E58: .4byte 0x0203DC74

	thumb_func_start sub_8046E5C
sub_8046E5C: @ 0x08046E5C
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	ldr r0, _08046E9C @ =gpKeySt
	ldr r1, [r0]
	movs r0, #8
	ldrh r1, [r1, #4]
	ands r0, r1
	cmp r0, #0
	beq _08046EA8
	bl sub_8044AF8
	str r4, [r5, #0x58]
	ldr r0, _08046EA0 @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08046E90
	movs r0, #0xe2
	lsls r0, r0, #2
	bl m4aSongNumStart
	ldr r0, _08046EA4 @ =gUnk_08C0907C
	bl sub_800AE98
_08046E90:
	adds r0, r5, #0
	movs r1, #3
	bl Proc_Goto
	movs r0, #1
	b _08046EAA
	.align 2, 0
_08046E9C: .4byte gpKeySt
_08046EA0: .4byte gPlaySt
_08046EA4: .4byte gUnk_08C0907C
_08046EA8:
	movs r0, #0
_08046EAA:
	pop {r4, r5}
	pop {r1}
	bx r1

	thumb_func_start sub_8046EB0
sub_8046EB0: @ 0x08046EB0
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	movs r6, #1
	rsbs r6, r6, #0
	movs r1, #0
	bl sub_8046E5C
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	beq _08046F08
	movs r4, #0
_08046EC8:
	lsls r0, r4, #0x18
	lsrs r0, r0, #0x18
	bl sub_803D1CC
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08046EFC
	ldr r5, _08046F10 @ =0x0203DC74
	adds r0, r5, #0
	adds r0, #0xa
	adds r0, r4, r0
	ldrb r0, [r0]
	cmp r0, #0
	beq _08046EFC
	ldr r0, _08046F14 @ =gPlaySt
	ldrb r0, [r0, #0xf]
	cmp r0, r4
	beq _08046EFC
	lsls r0, r4, #6
	adds r0, #1
	bl sub_8046DE8
	cmp r6, r0
	bls _08046EFC
	adds r6, r0, #0
	strb r4, [r5, #2]
_08046EFC:
	adds r4, #1
	cmp r4, #3
	ble _08046EC8
	adds r0, r7, #0
	bl Proc_Break
_08046F08:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08046F10: .4byte 0x0203DC74
_08046F14: .4byte gPlaySt

	thumb_func_start sub_8046F18
sub_8046F18: @ 0x08046F18
	push {r4, lr}
	adds r0, r1, #0
	bl GetUnitEquippedWeapon
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	adds r4, r0, #0
	cmp r0, #0
	beq _08046F3C
	bl sub_801778C
	cmp r0, #1
	beq _08046F3C
	adds r0, r4, #0
	bl sub_8017774
	cmp r0, #1
	bgt _08046F40
_08046F3C:
	movs r0, #1
	b _08046F42
_08046F40:
	movs r0, #2
_08046F42:
	pop {r4}
	pop {r1}
	bx r1

	thumb_func_start sub_8046F48
sub_8046F48: @ 0x08046F48
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x3c
	str r0, [sp, #0x10]
	movs r0, #0
	str r0, [sp, #0x18]
	movs r1, #0
	str r1, [sp, #0x1c]
	movs r2, #0
	str r2, [sp, #0x20]
	ldr r0, [sp, #0x10]
	movs r1, #1
	bl sub_8046E5C
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne _08046F74
	b _08047162
_08046F74:
	ldr r0, _080470B4 @ =0x0203A8E8
	adds r0, #0x7d
	movs r1, #0xe
	strb r1, [r0]
	ldr r0, _080470B8 @ =gPlaySt
	ldrb r0, [r0, #0xf]
	lsls r0, r0, #6
	str r0, [sp, #0x14]
	adds r4, r0, #0
	adds r4, #1
	adds r0, #6
	ldr r1, [sp, #0x10]
	adds r1, #0x2c
	str r1, [sp, #0x34]
	ldr r2, [sp, #0x10]
	adds r2, #0x30
	str r2, [sp, #0x38]
	cmp r4, r0
	blt _08046F9C
	b _08047144
_08046F9C:
	ldr r0, _080470BC @ =gActiveUnitId
	strb r4, [r0]
	ldrb r0, [r0]
	bl GetUnit
	adds r2, r0, #0
	ldr r0, _080470C0 @ =gActiveUnit
	str r2, [r0]
	ldr r1, [r2, #0xc]
	ldr r0, _080470C4 @ =0x00010004
	ands r1, r0
	ldr r0, [sp, #0x14]
	adds r0, #6
	str r0, [sp, #0x30]
	adds r4, #1
	str r4, [sp, #0x28]
	cmp r1, #0
	beq _08046FC2
	b _0804713A
_08046FC2:
	ldr r0, [r2]
	cmp r0, #0
	bne _08046FCA
	b _0804713A
_08046FCA:
	movs r5, #0
_08046FCC:
	ldr r0, _080470C0 @ =gActiveUnit
	ldr r2, [r0]
	lsls r1, r5, #1
	adds r0, r2, #0
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r4, [r0]
	adds r6, r4, #0
	adds r1, r5, #1
	str r1, [sp, #0x2c]
	cmp r4, #0
	bne _08046FE6
	b _08047132
_08046FE6:
	adds r0, r2, #0
	adds r1, r4, #0
	bl CanUnitUseWeapon
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08046FF6
	b _08047132
_08046FF6:
	mov sl, r5
	movs r2, #0
	mov r8, r2
	adds r0, r4, #0
	bl sub_8017774
	cmp r0, #2
	ble _08047008
	b _08047132
_08047008:
	adds r0, r4, #0
	bl GetItemAttributes
	movs r1, #0x80
	ands r1, r0
	cmp r1, #0
	beq _08047018
	b _08047132
_08047018:
	adds r0, r4, #0
	bl sub_8017774
	cmp r0, #1
	bne _08047026
	movs r0, #2
	mov r8, r0
_08047026:
	adds r0, r6, #0
	bl sub_801778C
	cmp r0, #1
	ble _08047038
	movs r0, #1
	mov r1, r8
	orrs r1, r0
	mov r8, r1
_08047038:
	add r0, sp, #4
	strh r5, [r0, #4]
	ldr r0, _080470C8 @ =0x0203DC74
	ldrb r0, [r0, #2]
	lsls r0, r0, #6
	mov sb, r0
	mov r5, sb
	adds r5, #1
	adds r0, #6
	cmp r5, r0
	bge _08047132
	add r6, sp, #4
	ldr r7, _080470CC @ =0x0300141C
	mov r0, r8
	movs r2, #2
	ands r0, r2
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp, #0x24]
_0804705E:
	adds r0, r5, #0
	bl GetUnit
	adds r4, r0, #0
	ldr r1, [r4, #0xc]
	ldr r0, _080470C4 @ =0x00010004
	ands r1, r0
	cmp r1, #0
	bne _08047128
	ldr r0, [r4]
	cmp r0, #0
	beq _08047128
	strb r5, [r6, #2]
	ldr r0, [sp, #0x24]
	cmp r0, #0
	beq _080470D8
	ldrb r0, [r4, #0x10]
	adds r0, #1
	strb r0, [r6]
	ldrb r0, [r4, #0x11]
	strb r0, [r6, #1]
	add r0, sp, #4
	bl sub_8039458
	ldr r0, [sp, #0xc]
	ldr r1, [sp, #0x18]
	cmp r1, r0
	bhi _080470D8
	str r0, [sp, #0x18]
	ldr r0, _080470BC @ =gActiveUnitId
	ldrb r0, [r0]
	str r0, [sp, #0x1c]
	lsls r0, r5, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp, #0x20]
	mov r2, r8
	cmp r2, #3
	bne _080470D0
	movs r0, #3
	adds r1, r4, #0
	bl sub_8046F18
	b _080470D2
	.align 2, 0
_080470B4: .4byte 0x0203A8E8
_080470B8: .4byte gPlaySt
_080470BC: .4byte gActiveUnitId
_080470C0: .4byte gActiveUnit
_080470C4: .4byte 0x00010004
_080470C8: .4byte 0x0203DC74
_080470CC: .4byte 0x0300141C
_080470D0:
	movs r0, #1
_080470D2:
	strb r0, [r7, #2]
	mov r0, sl
	strb r0, [r7, #3]
_080470D8:
	movs r0, #1
	mov r1, r8
	ands r0, r1
	cmp r0, #0
	beq _08047128
	ldrb r0, [r4, #0x10]
	adds r0, #1
	strb r0, [r6]
	ldrb r0, [r4, #0x11]
	subs r0, #1
	strb r0, [r6, #1]
	add r0, sp, #4
	bl sub_8039458
	ldr r0, [sp, #0xc]
	ldr r2, [sp, #0x18]
	cmp r2, r0
	bhi _08047128
	str r0, [sp, #0x18]
	ldr r0, _0804711C @ =gActiveUnitId
	ldrb r0, [r0]
	str r0, [sp, #0x1c]
	lsls r0, r5, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp, #0x20]
	mov r0, r8
	cmp r0, #3
	bne _08047120
	movs r0, #3
	adds r1, r4, #0
	bl sub_8046F18
	strb r0, [r7, #2]
	b _08047124
	.align 2, 0
_0804711C: .4byte gActiveUnitId
_08047120:
	movs r1, #2
	strb r1, [r7, #2]
_08047124:
	mov r2, sl
	strb r2, [r7, #3]
_08047128:
	adds r5, #1
	mov r0, sb
	adds r0, #6
	cmp r5, r0
	blt _0804705E
_08047132:
	ldr r5, [sp, #0x2c]
	cmp r5, #4
	bgt _0804713A
	b _08046FCC
_0804713A:
	ldr r4, [sp, #0x28]
	ldr r0, [sp, #0x30]
	cmp r4, r0
	bge _08047144
	b _08046F9C
_08047144:
	ldr r2, _08047174 @ =0x0203DC78
	ldr r1, [sp, #0x38]
	str r1, [sp]
	ldr r0, [sp, #0x1c]
	movs r1, #0
	ldr r3, [sp, #0x34]
	bl sub_8045400
	ldr r0, _08047178 @ =0x0300141C
	add r2, sp, #0x20
	ldrb r2, [r2]
	strb r2, [r0, #1]
	ldr r0, [sp, #0x10]
	bl Proc_Break
_08047162:
	add sp, #0x3c
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08047174: .4byte 0x0203DC78
_08047178: .4byte 0x0300141C

	thumb_func_start sub_804717C
sub_804717C: @ 0x0804717C
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _080471A8 @ =0x0300141C
	ldrb r0, [r0, #1]
	bl GetUnit
	adds r1, r0, #0
	movs r0, #0x10
	ldrsb r0, [r1, r0]
	lsls r0, r0, #4
	ldrb r1, [r1, #0x11]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	lsls r1, r1, #4
	movs r2, #2
	adds r3, r4, #0
	bl sub_80355BC
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080471A8: .4byte 0x0300141C

	thumb_func_start sub_80471AC
sub_80471AC: @ 0x080471AC
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #4
	adds r6, r0, #0
	ldr r0, _08047230 @ =0x0300141C
	ldrb r0, [r0, #1]
	ldr r5, _08047234 @ =0x0203DC79
	movs r1, #0x34
	adds r1, r1, r6
	mov r8, r1
	movs r1, #0x38
	adds r1, r1, r6
	mov sb, r1
	str r1, [sp]
	movs r1, #1
	adds r2, r5, #0
	mov r3, r8
	bl sub_8045400
	ldr r4, _08047238 @ =0x03001400
	subs r5, #5
	ldrb r1, [r5, #4]
	adds r0, r1, r4
	ldrb r0, [r0]
	bl GetUnit
	adds r7, r0, #0
	ldrb r5, [r5, #5]
	adds r4, r5, r4
	ldrb r0, [r4]
	bl GetUnit
	adds r4, r0, #0
	ldr r0, [r7, #0xc]
	movs r5, #0x80
	lsls r5, r5, #2
	ands r0, r5
	cmp r0, #0
	beq _0804720E
	adds r2, r6, #0
	adds r2, #0x2c
	adds r3, r6, #0
	adds r3, #0x30
	adds r0, r7, #0
	movs r1, #0
	bl sub_8046C4C
_0804720E:
	ldr r0, [r4, #0xc]
	ands r0, r5
	cmp r0, #0
	beq _08047222
	adds r0, r4, #0
	movs r1, #1
	mov r2, r8
	mov r3, sb
	bl sub_8046C4C
_08047222:
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08047230: .4byte 0x0300141C
_08047234: .4byte 0x0203DC79
_08047238: .4byte 0x03001400

	thumb_func_start sub_804723C
sub_804723C: @ 0x0804723C
	push {r4, lr}
	adds r4, r0, #0
	movs r1, #2
	bl sub_8046E5C
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	beq _0804725E
	bl sub_806C850
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0804725E
	adds r0, r4, #0
	bl Proc_Break
_0804725E:
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_8047264
sub_8047264: @ 0x08047264
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	bl GetGameTime
	ldr r2, _0804731C @ =gUnk_08C08FF4
	movs r1, #0x1f
	ands r1, r0
	adds r1, r1, r2
	ldrb r0, [r1]
	adds r0, #4
	asrs r0, r0, #1
	mov sl, r0
	movs r7, #0
_08047284:
	ldr r0, _08047320 @ =gUnk_08C07DAC
	ldr r0, [r0]
	ldrb r0, [r0, #6]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r0, r0, #2
	adds r0, r7, r0
	ldr r1, _08047324 @ =gUnk_081DB0D8
	adds r0, r0, r1
	ldrb r0, [r0]
	bl sub_803D1CC
	lsls r0, r0, #0x18
	adds r1, r7, #1
	mov sb, r1
	cmp r0, #0
	beq _08047306
	movs r6, #0
	lsls r0, r7, #2
	mov r8, r0
_080472AC:
	mov r1, r8
	adds r0, r1, r7
	adds r0, r0, r6
	ldr r1, _08047328 @ =0x03001400
	adds r0, r0, r1
	ldrb r0, [r0]
	bl GetUnit
	adds r2, r0, #0
	cmp r2, #0
	beq _08047300
	ldr r0, [r2]
	cmp r0, #0
	beq _08047300
	ldr r0, [r2, #0xc]
	movs r1, #0x80
	lsls r1, r1, #2
	ands r0, r1
	cmp r0, #0
	beq _08047300
	movs r5, #0x10
	ldrsb r5, [r2, r5]
	lsls r5, r5, #4
	movs r4, #0x11
	ldrsb r4, [r2, r4]
	lsls r4, r4, #4
	mov r0, sl
	subs r4, r4, r0
	adds r0, r2, #0
	bl sub_8025B54
	movs r3, #0xf
	ands r3, r0
	lsls r3, r3, #0xc
	movs r1, #0xa4
	lsls r1, r1, #4
	adds r3, r3, r1
	adds r0, r5, #0
	adds r1, r4, #0
	ldr r2, _0804732C @ =Sprite_16x16
	bl PutOamHiRam
_08047300:
	adds r6, #1
	cmp r6, #4
	ble _080472AC
_08047306:
	mov r7, sb
	cmp r7, #3
	ble _08047284
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0804731C: .4byte gUnk_08C08FF4
_08047320: .4byte gUnk_08C07DAC
_08047324: .4byte gUnk_081DB0D8
_08047328: .4byte 0x03001400
_0804732C: .4byte Sprite_16x16

	thumb_func_start sub_8047330
sub_8047330: @ 0x08047330
	push {lr}
	ldr r0, _08047340 @ =gUnk_08C09014
	movs r1, #4
	bl Proc_Start
	pop {r0}
	bx r0
	.align 2, 0
_08047340: .4byte gUnk_08C09014

	thumb_func_start sub_8047344
sub_8047344: @ 0x08047344
	push {lr}
	ldr r0, _08047350 @ =gUnk_08C09014
	bl sub_8004748
	pop {r0}
	bx r0
	.align 2, 0
_08047350: .4byte gUnk_08C09014

	thumb_func_start sub_8047354
sub_8047354: @ 0x08047354
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0x1f
	bl sub_80807E4
	ldr r0, _08047370 @ =gActiveUnit
	ldr r0, [r0]
	adds r1, r4, #0
	bl sub_80821F8
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08047370: .4byte gActiveUnit

	thumb_func_start sub_8047374
sub_8047374: @ 0x08047374
	push {lr}
	adds r1, r0, #0
	ldr r0, _0804738C @ =0x0203DC74
	ldrb r0, [r0, #8]
	cmp r0, #0
	bne _08047390
	adds r0, r1, #0
	movs r1, #0
	bl Proc_Goto
	b _080473A2
	.align 2, 0
_0804738C: .4byte 0x0203DC74
_08047390:
	bl MU_EndAll
	ldr r0, _080473A8 @ =gPlaySt
	ldrb r1, [r0, #0xf]
	movs r0, #6
	movs r2, #0
	movs r3, #0
	bl sub_8045388
_080473A2:
	pop {r0}
	bx r0
	.align 2, 0
_080473A8: .4byte gPlaySt

	thumb_func_start sub_80473AC
sub_80473AC: @ 0x080473AC
	push {lr}
	ldr r2, _080473C0 @ =0x0203DC74
	ldrb r1, [r2, #8]
	cmp r1, #0
	bne _080473C4
	strb r1, [r2, #9]
	movs r1, #0
	bl Proc_Goto
	b _080473D6
	.align 2, 0
_080473C0: .4byte 0x0203DC74
_080473C4:
	bl MU_EndAll
	ldr r0, _080473DC @ =gPlaySt
	ldrb r1, [r0, #0xf]
	movs r0, #7
	movs r2, #0
	movs r3, #0
	bl sub_8045388
_080473D6:
	pop {r0}
	bx r0
	.align 2, 0
_080473DC: .4byte gPlaySt

	thumb_func_start sub_80473E0
sub_80473E0: @ 0x080473E0
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _080473F8 @ =0x0203DC74
	ldrb r0, [r0, #8]
	cmp r0, #0
	bne _080473FC
	ldr r1, [r4, #0x58]
	adds r0, r4, #0
	bl Proc_Goto
	b _08047418
	.align 2, 0
_080473F8: .4byte 0x0203DC74
_080473FC:
	bl MU_EndAll
	bl MU_EndAll
	ldr r1, _08047420 @ =0x0203D908
	movs r0, #1
	strb r0, [r1, #0xb]
	movs r0, #0xff
	bl sub_8045324
	adds r0, r4, #0
	movs r1, #5
	bl Proc_Goto
_08047418:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08047420: .4byte 0x0203D908

	thumb_func_start sub_8047424
sub_8047424: @ 0x08047424
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	movs r6, #0
	ldr r1, _08047438 @ =0x0203D908
	ldrb r0, [r1]
	cmp r0, #1
	bne _0804743C
	strb r0, [r1, #0xb]
	b _0804748E
	.align 2, 0
_08047438: .4byte 0x0203D908
_0804743C:
	ldr r2, _080474A0 @ =0x0203DC74
	adds r4, r1, #0
	adds r4, #0xa0
	ldrb r0, [r4]
	ldrb r3, [r2, #0xe]
	subs r1, r0, r3
	adds r0, r2, #0
	adds r0, #0xf
	adds r1, r1, r0
	ldr r3, _080474A4 @ =gPlaySt
	ldrb r0, [r3, #0xf]
	strb r0, [r1]
	ldrb r0, [r2, #0xe]
	adds r0, #1
	strb r0, [r2, #0xe]
	ldrb r1, [r3, #0xf]
	lsls r0, r1, #2
	adds r1, r2, #0
	adds r1, #0x14
	adds r0, r0, r1
	str r6, [r0]
	ldrb r0, [r2, #0xe]
	ldrb r1, [r4]
	cmp r0, r1
	bne _080474A8
	movs r1, #0
	ldrb r0, [r4]
	cmp r6, r0
	bge _0804748C
	adds r4, r2, #0
	adds r4, #0xa
	adds r3, r0, #0
_0804747C:
	adds r0, r1, r4
	ldrb r0, [r0]
	cmp r0, #0
	beq _08047486
	adds r6, r1, #0
_08047486:
	adds r1, #1
	cmp r1, r3
	blt _0804747C
_0804748C:
	strb r6, [r2, #0xf]
_0804748E:
	movs r0, #0xff
	bl sub_8045324
	adds r0, r5, #0
	movs r1, #8
	bl Proc_Goto
	b _080474B6
	.align 2, 0
_080474A0: .4byte 0x0203DC74
_080474A4: .4byte gPlaySt
_080474A8:
	ldrb r0, [r3, #0xf]
	bl sub_8045324
	adds r0, r5, #0
	movs r1, #8
	bl Proc_Goto
_080474B6:
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	thumb_func_start sub_80474BC
sub_80474BC: @ 0x080474BC
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, _080474DC @ =0x0203D908
	ldrb r0, [r1]
	cmp r0, #1
	bne _080474E0
	strb r0, [r1, #0xb]
	movs r0, #0xff
	bl sub_8045324
	adds r0, r4, #0
	movs r1, #8
	bl Proc_Goto
	b _080474F2
	.align 2, 0
_080474DC: .4byte 0x0203D908
_080474E0:
	movs r0, #2
	strb r0, [r1, #0xb]
	movs r0, #0xff
	bl sub_8045324
	adds r0, r4, #0
	movs r1, #8
	bl Proc_Goto
_080474F2:
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_80474F8
sub_80474F8: @ 0x080474F8
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	movs r5, #0
	ldr r2, _08047564 @ =0x0203DC74
	ldr r0, _08047568 @ =0x0203D908
	adds r4, r0, #0
	adds r4, #0xa0
	ldrb r0, [r4]
	ldrb r3, [r2, #0xe]
	subs r1, r0, r3
	adds r0, r2, #0
	adds r0, #0xf
	adds r1, r1, r0
	ldr r3, _0804756C @ =gPlaySt
	ldrb r0, [r3, #0xf]
	strb r0, [r1]
	ldrb r0, [r2, #0xe]
	adds r0, #1
	strb r0, [r2, #0xe]
	ldrb r1, [r3, #0xf]
	lsls r0, r1, #2
	adds r1, r2, #0
	adds r1, #0x14
	adds r0, r0, r1
	str r5, [r0]
	ldrb r0, [r2, #0xe]
	ldrb r1, [r4]
	cmp r0, r1
	bne _08047570
	movs r1, #0
	ldrb r0, [r4]
	cmp r5, r0
	bge _08047550
	adds r4, r2, #0
	adds r4, #0xa
	adds r3, r0, #0
_08047540:
	adds r0, r1, r4
	ldrb r0, [r0]
	cmp r0, #0
	beq _0804754A
	adds r5, r1, #0
_0804754A:
	adds r1, #1
	cmp r1, r3
	blt _08047540
_08047550:
	strb r5, [r2, #0xf]
	movs r0, #0xff
	bl sub_8045324
	adds r0, r6, #0
	movs r1, #5
	bl Proc_Goto
	b _0804757E
	.align 2, 0
_08047564: .4byte 0x0203DC74
_08047568: .4byte 0x0203D908
_0804756C: .4byte gPlaySt
_08047570:
	ldrb r0, [r3, #0xf]
	bl sub_8045324
	adds r0, r6, #0
	movs r1, #5
	bl Proc_Goto
_0804757E:
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	thumb_func_start sub_8047584
sub_8047584: @ 0x08047584
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, _080475A4 @ =0x0203D908
	movs r0, #2
	strb r0, [r1, #0xb]
	movs r0, #0xff
	bl sub_8045324
	adds r0, r4, #0
	movs r1, #5
	bl Proc_Goto
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080475A4: .4byte 0x0203D908

	thumb_func_start sub_80475A8
sub_80475A8: @ 0x080475A8
	push {r4, lr}
	movs r3, #0
	str r3, [r0, #0x58]
	ldr r2, _080475C8 @ =gPlaySt
	ldrb r4, [r2, #0xf]
	lsls r1, r4, #6
	str r1, [r0, #0x5c]
	ldr r0, _080475CC @ =0x0203DC74
	adds r0, #0xa
	ldrb r2, [r2, #0xf]
	adds r0, r2, r0
	strb r3, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080475C8: .4byte gPlaySt
_080475CC: .4byte 0x0203DC74

	thumb_func_start sub_80475D0
sub_80475D0: @ 0x080475D0
	push {r4, r5, r6, lr}
	adds r5, r0, #0
_080475D4:
	ldr r1, [r5, #0x58]
	cmp r1, #5
	bne _080475E4
	adds r0, r5, #0
	movs r1, #1
	bl Proc_Goto
	b _08047648
_080475E4:
	ldr r0, [r5, #0x5c]
	adds r0, r0, r1
	adds r0, #1
	bl GetUnit
	adds r6, r0, #0
	ldr r0, [r6, #0xc]
	ldr r1, _08047608 @ =0x00010004
	ands r0, r1
	cmp r0, #0
	bne _08047600
	ldr r0, [r6]
	cmp r0, #0
	bne _0804760C
_08047600:
	ldr r0, [r5, #0x58]
	adds r0, #1
	str r0, [r5, #0x58]
	b _080475D4
	.align 2, 0
_08047608: .4byte 0x00010004
_0804760C:
	bl RefreshUnitSprites
	adds r0, r6, #0
	bl HideUnitSprite
	adds r0, r6, #0
	bl StartMu
	adds r4, r0, #0
	ldr r1, _08047650 @ =0x02033DFC
	movs r0, #2
	strb r0, [r1]
	movs r0, #4
	strb r0, [r1, #1]
	adds r0, r4, #0
	bl sub_806C8F0
	adds r0, r4, #0
	bl sub_8047ED0
	str r4, [r5, #0x54]
	ldr r0, [r5, #0x58]
	adds r0, #1
	str r0, [r5, #0x58]
	ldr r0, [r6, #0xc]
	ldr r1, _08047654 @ =0xFFFFFDFF
	ands r0, r1
	movs r1, #5
	orrs r0, r1
	str r0, [r6, #0xc]
_08047648:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08047650: .4byte 0x02033DFC
_08047654: .4byte 0xFFFFFDFF

	thumb_func_start sub_8047658
sub_8047658: @ 0x08047658
	push {lr}
	ldr r0, [r0, #0x54]
	bl sub_806D4BC
	pop {r0}
	bx r0

	thumb_func_start sub_8047664
sub_8047664: @ 0x08047664
	push {lr}
	bl sub_80455BC
	bl sub_804561C
	bl RefreshUnitSprites
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_8047678
sub_8047678: @ 0x08047678
	push {lr}
	bl sub_8009E60
	adds r1, r0, #0
	cmp r1, #1
	bne _08047690
	ldr r0, _0804768C @ =0x0203DC74
	strb r1, [r0, #8]
	b _08047696
	.align 2, 0
_0804768C: .4byte 0x0203DC74
_08047690:
	ldr r1, _0804769C @ =0x0203DC74
	movs r0, #0
	strb r0, [r1, #8]
_08047696:
	pop {r0}
	bx r0
	.align 2, 0
_0804769C: .4byte 0x0203DC74

	thumb_func_start sub_80476A0
sub_80476A0: @ 0x080476A0
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	ldr r0, _080476E4 @ =0x06015000
	movs r1, #6
	bl LoadHelpBoxGfx
	ldr r2, _080476E8 @ =0x000003D9
	movs r0, #0x40
	movs r1, #0x38
	bl StartHelpBoxExt_Unk
	movs r4, #0
	ldr r6, _080476EC @ =0x0203DC7E
_080476BA:
	lsls r0, r4, #0x18
	lsrs r0, r0, #0x18
	bl sub_803D1CC
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080476D2
	adds r0, r4, r6
	ldrb r0, [r0]
	cmp r0, #0
	beq _080476D2
	str r4, [r5, #0x58]
_080476D2:
	adds r4, #1
	cmp r4, #3
	ble _080476BA
	movs r0, #0
	str r0, [r5, #0x5c]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080476E4: .4byte 0x06015000
_080476E8: .4byte 0x000003D9
_080476EC: .4byte 0x0203DC7E

	thumb_func_start sub_80476F0
sub_80476F0: @ 0x080476F0
	push {r4, lr}
	adds r4, r0, #0
_080476F4:
	ldr r1, [r4, #0x5c]
	cmp r1, #4
	ble _08047706
	bl CloseHelpBox
	adds r0, r4, #0
	bl Proc_Break
	b _0804775E
_08047706:
	ldr r0, [r4, #0x58]
	lsls r0, r0, #6
	adds r0, r0, r1
	adds r0, #1
	bl GetUnit
	adds r2, r0, #0
	ldr r0, [r2, #0xc]
	ldr r1, _0804772C @ =0x00010004
	ands r0, r1
	cmp r0, #0
	bne _08047724
	ldr r0, [r2]
	cmp r0, #0
	bne _08047730
_08047724:
	ldr r0, [r4, #0x5c]
	adds r0, #1
	str r0, [r4, #0x5c]
	b _080476F4
	.align 2, 0
_0804772C: .4byte 0x00010004
_08047730:
	ldr r3, _08047764 @ =0x0203DC74
	ldr r0, [r4, #0x58]
	lsls r0, r0, #3
	adds r1, r3, #0
	adds r1, #0x30
	adds r0, r0, r1
	movs r1, #0x1e
	str r1, [r0]
	ldr r1, [r4, #0x58]
	lsls r2, r1, #3
	adds r2, r2, r3
	lsls r1, r1, #6
	ldr r0, [r4, #0x5c]
	adds r0, r0, r1
	adds r0, #1
	adds r2, #0x2c
	strb r0, [r2]
	adds r0, r4, #0
	bl sub_80452B8
	ldr r0, [r4, #0x5c]
	adds r0, #1
	str r0, [r4, #0x5c]
_0804775E:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08047764: .4byte 0x0203DC74

	thumb_func_start sub_8047768
sub_8047768: @ 0x08047768
	push {lr}
	adds r1, r0, #0
	ldr r0, _08047780 @ =0x0203D908
	ldrb r0, [r0]
	cmp r0, #1
	bne _0804777C
	adds r0, r1, #0
	movs r1, #1
	bl Proc_Goto
_0804777C:
	pop {r0}
	bx r0
	.align 2, 0
_08047780: .4byte 0x0203D908

	thumb_func_start sub_8047784
sub_8047784: @ 0x08047784
	push {lr}
	ldr r0, _080477B0 @ =gBg2Tm
	movs r1, #0
	bl TmFill
	movs r0, #4
	bl EnableBgSync
	bl RenderMap
	bl SetupBanim
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080477B4
	movs r0, #1
	bl SetBanimLinkArenaFlag
	bl BeginAnimsOnBattleAnimations
	b _080477CA
	.align 2, 0
_080477B0: .4byte gBg2Tm
_080477B4:
	bl MU_EndAll
	bl RenderMap
	bl BeginBattleMapAnims
	ldr r0, _080477D0 @ =gBattleStats
	movs r1, #0x80
	ldrh r2, [r0]
	orrs r1, r2
	strh r1, [r0]
_080477CA:
	pop {r0}
	bx r0
	.align 2, 0
_080477D0: .4byte gBattleStats

	thumb_func_start sub_80477D4
sub_80477D4: @ 0x080477D4
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	ldr r6, _08047844 @ =gBattleActor
	movs r0, #0x13
	ldrsb r0, [r6, r0]
	cmp r0, #0
	bne _080477F0
	ldr r0, _08047848 @ =gUnk_08D64F4C
	bl Proc_Find
	adds r4, r0, #0
	bl sub_8047ED0
	str r4, [r7, #0x54]
_080477F0:
	ldr r5, _0804784C @ =gBattleTarget
	movs r0, #0x13
	ldrsb r0, [r5, r0]
	cmp r0, #0
	bne _0804783C
	bl RefreshUnitSprites
	movs r0, #0xb
	ldrsb r0, [r5, r0]
	bl GetUnit
	bl HideUnitSprite
	adds r0, r5, #0
	bl StartMu
	adds r4, r0, #0
	movs r0, #0x10
	ldrsb r0, [r6, r0]
	movs r1, #0x11
	ldrsb r1, [r6, r1]
	movs r2, #0x10
	ldrsb r2, [r5, r2]
	movs r3, #0x11
	ldrsb r3, [r5, r3]
	bl sub_806FC64
	ldr r1, _08047850 @ =0x02033DFC
	strb r0, [r1]
	movs r0, #4
	strb r0, [r1, #1]
	adds r0, r4, #0
	bl sub_806C8F0
	adds r0, r4, #0
	bl sub_8047ED0
	str r4, [r7, #0x54]
_0804783C:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08047844: .4byte gBattleActor
_08047848: .4byte gUnk_08D64F4C
_0804784C: .4byte gBattleTarget
_08047850: .4byte 0x02033DFC

	thumb_func_start sub_8047854
sub_8047854: @ 0x08047854
	push {r4, r5, lr}
	ldr r0, _0804789C @ =gBattleActor
	ldrb r0, [r0, #0xb]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl GetUnit
	adds r4, r0, #0
	ldr r0, _080478A0 @ =gBattleTarget
	ldrb r0, [r0, #0xb]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl GetUnit
	adds r5, r0, #0
	adds r0, r4, #0
	bl GetUnitCurrentHp
	cmp r0, #0
	bne _08047884
	ldr r0, [r4, #0xc]
	movs r1, #5
	orrs r0, r1
	str r0, [r4, #0xc]
_08047884:
	adds r0, r5, #0
	bl GetUnitCurrentHp
	cmp r0, #0
	bne _08047896
	ldr r0, [r5, #0xc]
	movs r1, #5
	orrs r0, r1
	str r0, [r5, #0xc]
_08047896:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0804789C: .4byte gBattleActor
_080478A0: .4byte gBattleTarget

	thumb_func_start sub_80478A4
sub_80478A4: @ 0x080478A4
	ldr r1, _080478AC @ =0x0203DCC0
	movs r0, #1
	strb r0, [r1]
	bx lr
	.align 2, 0
_080478AC: .4byte 0x0203DCC0

	thumb_func_start sub_80478B0
sub_80478B0: @ 0x080478B0
	ldr r1, _080478B8 @ =0x0203DCC0
	movs r0, #0
	strb r0, [r1]
	bx lr
	.align 2, 0
_080478B8: .4byte 0x0203DCC0

	thumb_func_start sub_80478BC
sub_80478BC: @ 0x080478BC
	ldr r2, _080478F0 @ =gDispIo
	movs r0, #0x21
	rsbs r0, r0, #0
	ldrb r1, [r2, #1]
	ands r0, r1
	movs r1, #0x41
	rsbs r1, r1, #0
	ands r0, r1
	movs r1, #0x7f
	ands r0, r1
	strb r0, [r2, #1]
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
	bx lr
	.align 2, 0
_080478F0: .4byte gDispIo

	thumb_func_start sub_80478F4
sub_80478F4: @ 0x080478F4
	ldr r0, _08047920 @ =0x04000006
	ldrh r0, [r0]
	adds r0, #1
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	ldr r3, _08047924 @ =0x02001188
	cmp r1, #0xa0
	bls _0804790C
	ldr r0, _08047928 @ =0x02001180
	ldr r0, [r0]
	str r0, [r3]
	movs r1, #0
_0804790C:
	ldr r2, _0804792C @ =0x04000042
	ldr r0, [r3]
	lsls r1, r1, #2
	adds r1, r1, r0
	ldrh r3, [r1]
	lsls r0, r3, #8
	ldrh r1, [r1, #2]
	adds r0, r1, r0
	strh r0, [r2]
	bx lr
	.align 2, 0
_08047920: .4byte 0x04000006
_08047924: .4byte 0x02001188
_08047928: .4byte 0x02001180
_0804792C: .4byte 0x04000042

	thumb_func_start sub_8047930
sub_8047930: @ 0x08047930
	ldr r2, _08047940 @ =0x02001180
	ldr r3, [r2]
	ldr r1, _08047944 @ =0x02001184
	ldr r0, [r1]
	str r0, [r2]
	str r3, [r1]
	bx lr
	.align 2, 0
_08047940: .4byte 0x02001180
_08047944: .4byte 0x02001184

	thumb_func_start sub_8047948
sub_8047948: @ 0x08047948
	push {lr}
	ldr r2, _0804796C @ =gDispIo
	movs r0, #0x21
	rsbs r0, r0, #0
	ldrb r1, [r2, #1]
	ands r0, r1
	movs r1, #0x41
	rsbs r1, r1, #0
	ands r0, r1
	movs r1, #0x7f
	ands r0, r1
	strb r0, [r2, #1]
	movs r0, #0
	bl SetOnHBlankA
	pop {r0}
	bx r0
	.align 2, 0
_0804796C: .4byte gDispIo

	thumb_func_start sub_8047970
sub_8047970: @ 0x08047970
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x14
	str r0, [sp, #4]
	ldr r7, [sp, #0x34]
	ldr r0, [sp, #0x48]
	ldr r6, [sp, #0x4c]
	lsls r6, r6, #0x10
	lsrs r6, r6, #0x10
	subs r1, #0x78
	subs r2, #0x50
	subs r3, #0x78
	subs r7, #0x50
	ldr r4, [sp, #0x38]
	subs r4, #0x78
	str r4, [sp, #0x38]
	ldr r4, [sp, #0x3c]
	subs r4, #0x50
	str r4, [sp, #0x3c]
	ldr r4, [sp, #0x40]
	subs r4, #0x78
	str r4, [sp, #0x40]
	ldr r4, [sp, #0x44]
	subs r4, #0x50
	str r4, [sp, #0x44]
	ldr r4, _08047ADC @ =gSinLut
	mov sb, r4
	lsls r0, r0, #0x10
	movs r4, #0xff
	lsls r4, r4, #0x10
	ands r4, r0
	asrs r4, r4, #0x10
	mov ip, r4
	lsls r0, r4, #1
	add r0, sb
	movs r4, #0
	ldrsh r5, [r0, r4]
	adds r0, r1, #0
	muls r0, r5, r0
	mov r8, r0
	mov r4, ip
	adds r4, #0x40
	lsls r4, r4, #1
	add r4, sb
	movs r0, #0
	ldrsh r4, [r4, r0]
	adds r0, r2, #0
	muls r0, r4, r0
	add r0, r8
	str r0, [sp, #8]
	muls r1, r4, r1
	adds r0, r2, #0
	muls r0, r5, r0
	subs r1, r1, r0
	str r1, [sp, #0xc]
	adds r1, r3, #0
	muls r1, r5, r1
	adds r0, r7, #0
	muls r0, r4, r0
	adds r1, r1, r0
	mov sb, r1
	adds r1, r3, #0
	muls r1, r4, r1
	adds r0, r7, #0
	muls r0, r5, r0
	subs r7, r1, r0
	ldr r2, [sp, #0x38]
	adds r1, r2, #0
	muls r1, r5, r1
	ldr r2, [sp, #0x3c]
	adds r0, r2, #0
	muls r0, r4, r0
	adds r1, r1, r0
	mov sl, r1
	ldr r0, [sp, #0x38]
	adds r1, r0, #0
	muls r1, r4, r1
	adds r0, r2, #0
	muls r0, r5, r0
	subs r1, r1, r0
	mov r8, r1
	ldr r2, [sp, #0x40]
	adds r1, r2, #0
	muls r1, r5, r1
	ldr r2, [sp, #0x44]
	adds r0, r2, #0
	muls r0, r4, r0
	adds r1, r1, r0
	str r1, [sp, #0x10]
	ldr r0, [sp, #0x40]
	adds r1, r0, #0
	muls r1, r4, r1
	adds r0, r2, #0
	muls r0, r5, r0
	subs r4, r1, r0
	ldr r1, [sp, #8]
	asrs r0, r1, #0xc
	muls r0, r6, r0
	asrs r0, r0, #8
	adds r0, #0x78
	str r0, [sp, #8]
	ldr r2, [sp, #0xc]
	asrs r0, r2, #0xc
	muls r0, r6, r0
	asrs r0, r0, #8
	adds r0, #0x50
	str r0, [sp, #0xc]
	mov r1, sb
	asrs r0, r1, #0xc
	muls r0, r6, r0
	asrs r0, r0, #8
	adds r0, #0x78
	mov sb, r0
	asrs r0, r7, #0xc
	muls r0, r6, r0
	asrs r0, r0, #8
	adds r7, r0, #0
	adds r7, #0x50
	mov r2, sl
	asrs r0, r2, #0xc
	muls r0, r6, r0
	asrs r0, r0, #8
	adds r0, #0x78
	mov sl, r0
	mov r1, r8
	asrs r0, r1, #0xc
	muls r0, r6, r0
	asrs r0, r0, #8
	adds r0, #0x50
	mov r8, r0
	ldr r2, [sp, #0x10]
	asrs r0, r2, #0xc
	muls r0, r6, r0
	asrs r0, r0, #8
	adds r0, #0x78
	str r0, [sp, #0x10]
	asrs r0, r4, #0xc
	muls r0, r6, r0
	asrs r0, r0, #8
	adds r4, r0, #0
	adds r4, #0x50
	str r7, [sp]
	ldr r0, [sp, #4]
	ldr r1, [sp, #8]
	ldr r2, [sp, #0xc]
	mov r3, sb
	bl sub_80138E8
	mov r0, r8
	str r0, [sp]
	ldr r0, [sp, #4]
	mov r1, sb
	adds r2, r7, #0
	mov r3, sl
	bl sub_80138E8
	str r4, [sp]
	ldr r0, [sp, #4]
	mov r1, sl
	mov r2, r8
	ldr r3, [sp, #0x10]
	bl sub_80138E8
	ldr r1, [sp, #0xc]
	str r1, [sp]
	ldr r0, [sp, #4]
	ldr r1, [sp, #0x10]
	adds r2, r4, #0
	ldr r3, [sp, #8]
	bl sub_80138E8
	add sp, #0x14
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08047ADC: .4byte gSinLut

	thumb_func_start sub_8047AE0
sub_8047AE0: @ 0x08047AE0
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r1, _08047B14 @ =0x02001180
	ldr r0, _08047B18 @ =0x02000F00
	str r0, [r1]
	ldr r5, _08047B1C @ =0x02001184
	ldr r2, _08047B20 @ =0xFFFFFD80
	adds r1, r0, r2
	str r1, [r5]
	ldr r1, _08047B24 @ =0x02001188
	str r0, [r1]
	bl sub_80138C8
	ldr r0, [r5]
	bl sub_80138C8
	adds r4, #0x4c
	movs r0, #0
	strh r0, [r4]
	ldr r0, _08047B28 @ =sub_80478F4
	bl SetOnHBlankA
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08047B14: .4byte 0x02001180
_08047B18: .4byte 0x02000F00
_08047B1C: .4byte 0x02001184
_08047B20: .4byte 0xFFFFFD80
_08047B24: .4byte 0x02001188
_08047B28: .4byte sub_80478F4

	thumb_func_start sub_8047B2C
sub_8047B2C: @ 0x08047B2C
	push {r4, r5, r6, r7, lr}
	sub sp, #0x1c
	adds r4, r0, #0
	adds r7, r4, #0
	adds r7, #0x4c
	adds r5, r4, #0
	adds r5, #0x64
	ldrh r0, [r7]
	ldrh r1, [r5]
	cmp r0, r1
	bne _08047B50
	movs r0, #0
	bl SetOnHBlankA
	adds r0, r4, #0
	bl Proc_Break
	b _08047BB6
_08047B50:
	movs r0, #0
	ldrsh r3, [r7, r0]
	movs r1, #0
	ldrsh r0, [r5, r1]
	str r0, [sp]
	movs r0, #0
	movs r1, #0xa0
	movs r2, #0xc0
	bl Interpolate
	adds r6, r0, #0
	movs r2, #0x88
	lsls r2, r2, #1
	movs r0, #0
	ldrsh r3, [r7, r0]
	movs r1, #0
	ldrsh r0, [r5, r1]
	str r0, [sp]
	movs r0, #1
	movs r1, #0x10
	bl Interpolate
	adds r5, r0, #0
	ldr r4, _08047BC0 @ =0x02001184
	ldr r0, [r4]
	bl sub_80138C8
	ldr r0, [r4]
	movs r2, #0
	str r2, [sp]
	movs r1, #0xf0
	str r1, [sp, #4]
	movs r1, #0xa0
	str r1, [sp, #8]
	str r2, [sp, #0xc]
	str r1, [sp, #0x10]
	lsls r6, r6, #0x10
	asrs r6, r6, #0x10
	str r6, [sp, #0x14]
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	str r5, [sp, #0x18]
	movs r1, #0
	movs r3, #0xf0
	bl sub_8047970
	bl sub_8047930
	ldrh r0, [r7]
	adds r0, #1
	strh r0, [r7]
_08047BB6:
	add sp, #0x1c
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08047BC0: .4byte 0x02001184

	thumb_func_start sub_8047BC4
sub_8047BC4: @ 0x08047BC4
	ldr r2, _08047C08 @ =gDispIo
	movs r0, #1
	ldrb r1, [r2, #1]
	orrs r0, r1
	movs r1, #2
	orrs r0, r1
	movs r1, #4
	orrs r0, r1
	movs r1, #8
	orrs r0, r1
	movs r1, #0x10
	orrs r0, r1
	movs r1, #0x21
	rsbs r1, r1, #0
	ands r0, r1
	subs r1, #0x20
	ands r0, r1
	movs r1, #0x7f
	ands r0, r1
	strb r0, [r2, #1]
	adds r1, r2, #0
	adds r1, #0x2f
	movs r0, #0
	strb r0, [r1]
	adds r1, #4
	strb r0, [r1]
	subs r1, #5
	movs r0, #0xf0
	strb r0, [r1]
	adds r1, #4
	movs r0, #0xa0
	strb r0, [r1]
	bx lr
	.align 2, 0
_08047C08: .4byte gDispIo

	thumb_func_start sub_8047C0C
sub_8047C0C: @ 0x08047C0C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r4, r0, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	ldr r0, _08047CAC @ =gUnk_08C0953C
	bl Proc_StartBlocking
	adds r0, #0x64
	movs r3, #0
	strh r4, [r0]
	ldr r0, _08047CB0 @ =gDispIo
	mov ip, r0
	movs r2, #1
	ldrb r0, [r0, #1]
	orrs r0, r2
	movs r1, #2
	mov r8, r1
	mov r1, r8
	orrs r0, r1
	movs r6, #4
	orrs r0, r6
	movs r5, #8
	orrs r0, r5
	movs r4, #0x10
	orrs r0, r4
	movs r1, #0x21
	rsbs r1, r1, #0
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	movs r1, #0x7f
	ands r0, r1
	mov r1, ip
	strb r0, [r1, #1]
	mov r0, ip
	adds r0, #0x2f
	strb r3, [r0]
	adds r0, #4
	strb r3, [r0]
	adds r1, #0x2e
	movs r0, #0xf0
	strb r0, [r1]
	adds r1, #4
	movs r0, #0xa0
	strb r0, [r1]
	mov r7, ip
	adds r7, #0x35
	ldrb r0, [r7]
	orrs r2, r0
	mov r1, r8
	orrs r2, r1
	orrs r2, r6
	orrs r2, r5
	orrs r2, r4
	mov r3, ip
	adds r3, #0x36
	movs r0, #2
	rsbs r0, r0, #0
	ldrb r1, [r3]
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
	strb r0, [r3]
	movs r0, #0x20
	orrs r2, r0
	strb r2, [r7]
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08047CAC: .4byte gUnk_08C0953C
_08047CB0: .4byte gDispIo

	thumb_func_start sub_8047CB4
sub_8047CB4: @ 0x08047CB4
	push {lr}
	adds r1, r0, #0
	movs r0, #0x40
	bl sub_8047C0C
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_8047CC4
sub_8047CC4: @ 0x08047CC4
	push {r4, r5, r6, r7, lr}
	sub sp, #0x1c
	adds r4, r0, #0
	adds r7, r4, #0
	adds r7, #0x4c
	adds r5, r4, #0
	adds r5, #0x64
	ldrh r0, [r7]
	ldrh r1, [r5]
	cmp r0, r1
	bne _08047CE8
	movs r0, #0
	bl SetOnHBlankA
	adds r0, r4, #0
	bl Proc_Break
	b _08047D4E
_08047CE8:
	movs r2, #0
	ldrsh r3, [r7, r2]
	movs r1, #0
	ldrsh r0, [r5, r1]
	str r0, [sp]
	movs r0, #4
	movs r1, #0xc0
	movs r2, #0xa0
	bl Interpolate
	adds r6, r0, #0
	movs r1, #0x88
	lsls r1, r1, #1
	movs r2, #0
	ldrsh r3, [r7, r2]
	movs r2, #0
	ldrsh r0, [r5, r2]
	str r0, [sp]
	movs r0, #5
	movs r2, #0x10
	bl Interpolate
	adds r5, r0, #0
	ldr r4, _08047D58 @ =0x02001184
	ldr r0, [r4]
	bl sub_80138C8
	ldr r0, [r4]
	movs r2, #0
	str r2, [sp]
	movs r1, #0xf0
	str r1, [sp, #4]
	movs r1, #0xa0
	str r1, [sp, #8]
	str r2, [sp, #0xc]
	str r1, [sp, #0x10]
	lsls r6, r6, #0x10
	asrs r6, r6, #0x10
	str r6, [sp, #0x14]
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	str r5, [sp, #0x18]
	movs r1, #0
	movs r3, #0xf0
	bl sub_8047970
	bl sub_8047930
	ldrh r0, [r7]
	adds r0, #1
	strh r0, [r7]
_08047D4E:
	add sp, #0x1c
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08047D58: .4byte 0x02001184

	thumb_func_start sub_8047D5C
sub_8047D5C: @ 0x08047D5C
	ldr r2, _08047D7C @ =gDispIo
	movs r0, #0
	strb r0, [r2, #1]
	adds r1, r2, #0
	adds r1, #0x2f
	strb r0, [r1]
	adds r1, #4
	strb r0, [r1]
	subs r1, #5
	movs r0, #0xf0
	strb r0, [r1]
	adds r1, #4
	movs r0, #0xa0
	strb r0, [r1]
	bx lr
	.align 2, 0
_08047D7C: .4byte gDispIo

	thumb_func_start sub_8047D80
sub_8047D80: @ 0x08047D80
	push {r4, lr}
	adds r4, r0, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	ldr r0, _08047E04 @ =gUnk_08C09574
	bl Proc_StartBlocking
	adds r0, #0x64
	movs r2, #0
	strh r4, [r0]
	ldr r3, _08047E08 @ =gDispIo
	movs r0, #0x21
	rsbs r0, r0, #0
	ldrb r1, [r3, #1]
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	movs r1, #0x7f
	ands r0, r1
	strb r0, [r3, #1]
	adds r0, r3, #0
	adds r0, #0x2f
	strb r2, [r0]
	adds r0, #4
	strb r2, [r0]
	adds r1, r3, #0
	adds r1, #0x2e
	movs r0, #0xf0
	strb r0, [r1]
	adds r1, #4
	movs r0, #0xa0
	strb r0, [r1]
	adds r4, r3, #0
	adds r4, #0x35
	movs r2, #1
	ldrb r0, [r4]
	orrs r2, r0
	movs r0, #2
	orrs r2, r0
	movs r0, #4
	orrs r2, r0
	movs r0, #8
	orrs r2, r0
	movs r0, #0x10
	orrs r2, r0
	adds r3, #0x36
	movs r0, #2
	rsbs r0, r0, #0
	ldrb r1, [r3]
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
	strb r0, [r3]
	movs r0, #0x20
	orrs r2, r0
	strb r2, [r4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08047E04: .4byte gUnk_08C09574
_08047E08: .4byte gDispIo

	thumb_func_start sub_8047E0C
sub_8047E0C: @ 0x08047E0C
	push {lr}
	adds r1, r0, #0
	movs r0, #0x40
	bl sub_8047D80
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_8047E1C
sub_8047E1C: @ 0x08047E1C
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08047E38 @ =gUnk_08C0953C
	bl Proc_Find
	cmp r0, #0
	bne _08047E30
	adds r0, r4, #0
	bl Proc_Break
_08047E30:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08047E38: .4byte gUnk_08C0953C

	thumb_func_start sub_8047E3C
sub_8047E3C: @ 0x08047E3C
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08047E58 @ =gUnk_08C09574
	bl Proc_Find
	cmp r0, #0
	bne _08047E50
	adds r0, r4, #0
	bl Proc_Break
_08047E50:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08047E58: .4byte gUnk_08C09574

	thumb_func_start sub_8047E5C
sub_8047E5C: @ 0x08047E5C
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08047EA8 @ =gUnk_08C095AC
	lsls r1, r1, #2
	adds r1, r1, r0
	ldr r0, [r1]
	movs r1, #0xb0
	lsls r1, r1, #2
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r1, [r4, #0x30]
	ldr r0, [r4, #0x34]
	ldrh r0, [r0, #2]
	movs r2, #0xd0
	lsls r2, r2, #7
	adds r0, r0, r2
	strh r0, [r1, #0x22]
	ldr r0, [r4, #0x34]
	ldrb r0, [r0, #1]
	adds r0, #0x10
	lsls r0, r0, #5
	ldr r1, _08047EAC @ =gPal
	adds r0, r0, r1
	movs r1, #0x16
	movs r2, #0x14
	adds r3, r4, #0
	bl sub_8014020
	ldr r0, _08047EB0 @ =gUnk_08C095C4
	adds r1, r4, #0
	bl Proc_Start
	str r4, [r0, #0x2c]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08047EA8: .4byte gUnk_08C095AC
_08047EAC: .4byte gPal
_08047EB0: .4byte gUnk_08C095C4

	thumb_func_start sub_8047EB4
sub_8047EB4: @ 0x08047EB4
	ldr r0, [r0, #0x2c]
	ldr r2, [r0, #0x30]
	ldr r1, [r0, #0x34]
	movs r0, #0xf
	ldrb r3, [r1, #1]
	ands r0, r3
	lsls r0, r0, #0xc
	ldrh r1, [r1, #2]
	adds r0, r1, r0
	movs r1, #0x80
	lsls r1, r1, #4
	adds r0, r0, r1
	strh r0, [r2, #0x22]
	bx lr

	thumb_func_start sub_8047ED0
sub_8047ED0: @ 0x08047ED0
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r1, r4, #0
	adds r1, #0x3f
	movs r5, #0
	movs r0, #7
	strb r0, [r1]
	ldr r0, _08047F48 @ =gUnk_08D64F84
	adds r1, r4, #0
	bl Proc_Start
	str r4, [r0, #0x54]
	adds r0, #0x64
	movs r3, #0
	movs r1, #0x20
	strh r1, [r0]
	ldr r1, _08047F4C @ =gDispIo
	mov ip, r1
	mov r2, ip
	adds r2, #0x3c
	movs r1, #0x3f
	ldrb r6, [r2]
	ands r1, r6
	strb r1, [r2]
	ldrh r0, [r0]
	lsrs r1, r0, #1
	mov r0, ip
	adds r0, #0x44
	strb r1, [r0]
	mov r1, ip
	adds r1, #0x45
	movs r0, #0x10
	strb r0, [r1]
	mov r0, ip
	adds r0, #0x46
	strb r3, [r0]
	ldr r0, [r4, #0x30]
	strh r5, [r0, #0x18]
	ldr r0, [r4, #0x30]
	strh r5, [r0, #0x1a]
	adds r0, r4, #0
	movs r1, #0
	bl sub_8047E5C
	ldr r1, [r4, #0x30]
	movs r0, #0xd
	strh r0, [r1, #0x1e]
	ldr r0, _08047F50 @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08047F40
	movs r0, #0xd6
	bl m4aSongNumStart
_08047F40:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08047F48: .4byte gUnk_08D64F84
_08047F4C: .4byte gDispIo
_08047F50: .4byte gPlaySt

	thumb_func_start sub_8047F54
sub_8047F54: @ 0x08047F54
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	ldr r1, [r5, #0x30]
	ldr r0, [r5, #0x34]
	ldrh r0, [r0, #2]
	movs r2, #0xd0
	lsls r2, r2, #7
	adds r0, r0, r2
	strh r0, [r1, #0x22]
	ldr r0, [r5, #0x34]
	ldrb r0, [r0, #1]
	adds r0, #0x10
	lsls r0, r0, #5
	ldr r1, _08047F98 @ =gPal
	adds r0, r0, r1
	movs r1, #0xb0
	lsls r1, r1, #2
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r0, _08047F9C @ =gUnk_08C095AC
	lsls r4, r4, #2
	adds r4, r4, r0
	ldr r0, [r4]
	movs r1, #0x16
	movs r2, #8
	adds r3, r5, #0
	bl sub_8014020
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08047F98: .4byte gPal
_08047F9C: .4byte gUnk_08C095AC

	thumb_func_start sub_8047FA0
sub_8047FA0: @ 0x08047FA0
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x34]
	ldrb r0, [r0, #1]
	adds r0, #0x10
	lsls r0, r0, #5
	ldr r1, _08047FCC @ =gPal
	adds r0, r0, r1
	movs r1, #0x16
	movs r2, #8
	adds r3, r4, #0
	bl sub_8014020
	ldr r0, _08047FD0 @ =gUnk_08D64FFC
	movs r1, #3
	bl Proc_Start
	str r4, [r0, #0x54]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08047FCC: .4byte gPal
_08047FD0: .4byte gUnk_08D64FFC

	thumb_func_start sub_8047FD4
sub_8047FD4: @ 0x08047FD4
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08048014 @ =gUnk_083FB684
	ldr r1, _08048018 @ =0x06004400
	bl Decompress
	ldr r0, _0804801C @ =gUnk_083FB8E4
	movs r1, #0x60
	movs r2, #0x20
	bl ApplyPaletteExt
	adds r1, r4, #0
	adds r1, #0x40
	movs r0, #0
	strb r0, [r1]
	adds r0, r4, #0
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _0804800C
	ldr r2, [r4, #0x34]
	lsls r2, r2, #3
	movs r0, #0x7f
	movs r1, #2
	bl sub_806CA48
_0804800C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08048014: .4byte gUnk_083FB684
_08048018: .4byte 0x06004400
_0804801C: .4byte gUnk_083FB8E4

	thumb_func_start sub_8048020
sub_8048020: @ 0x08048020
	push {r4, r5, r6, r7, lr}
	sub sp, #0x10
	adds r7, r0, #0
	ldr r0, _080480D4 @ =gBg2Tm
	ldr r1, [r7, #0x34]
	subs r1, #1
	ldr r2, [r7, #0x38]
	subs r2, #3
	ldr r3, _080480D8 @ =0x00003220
	movs r4, #4
	str r4, [sp]
	movs r4, #6
	str r4, [sp, #4]
	ldr r4, _080480DC @ =gUnk_083FB904
	str r4, [sp, #8]
	ldr r6, _080480E0 @ =gUnk_08C095DC
	adds r5, r7, #0
	adds r5, #0x40
	ldrb r4, [r5]
	adds r4, r4, r6
	ldrb r4, [r4]
	str r4, [sp, #0xc]
	bl sub_8014D78
	movs r0, #4
	bl EnableBgSync
	ldrb r0, [r5]
	adds r0, #1
	strb r0, [r5]
	adds r6, r0, r6
	ldrb r0, [r6]
	cmp r0, #0xff
	bne _0804806A
	adds r0, r7, #0
	bl Proc_Break
_0804806A:
	ldr r3, _080480E4 @ =gDispIo
	movs r1, #4
	rsbs r1, r1, #0
	adds r0, r1, #0
	ldrb r2, [r3, #0xc]
	ands r0, r2
	strb r0, [r3, #0xc]
	adds r0, r1, #0
	ldrb r4, [r3, #0x10]
	ands r0, r4
	strb r0, [r3, #0x10]
	ldrb r0, [r3, #0x14]
	ands r1, r0
	strb r1, [r3, #0x14]
	movs r0, #3
	ldrb r1, [r3, #0x18]
	orrs r0, r1
	strb r0, [r3, #0x18]
	adds r2, r3, #0
	adds r2, #0x3c
	ldr r0, _080480E8 @ =0x0000FFE0
	ldrh r4, [r3, #0x3c]
	ands r0, r4
	movs r1, #4
	orrs r0, r1
	ldr r1, _080480EC @ =0x0000E0FF
	ands r0, r1
	movs r4, #0xd8
	lsls r4, r4, #5
	adds r1, r4, #0
	orrs r0, r1
	strh r0, [r3, #0x3c]
	movs r0, #0x3f
	ldrb r1, [r2]
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r2]
	adds r0, r3, #0
	adds r0, #0x44
	movs r1, #0xc
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r1, r3, #0
	adds r1, #0x46
	movs r0, #0
	strb r0, [r1]
	add sp, #0x10
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080480D4: .4byte gBg2Tm
_080480D8: .4byte 0x00003220
_080480DC: .4byte gUnk_083FB904
_080480E0: .4byte gUnk_08C095DC
_080480E4: .4byte gDispIo
_080480E8: .4byte 0x0000FFE0
_080480EC: .4byte 0x0000E0FF

	thumb_func_start sub_80480F0
sub_80480F0: @ 0x080480F0
	push {lr}
	ldr r0, _08048124 @ =gBg2Tm
	movs r1, #0
	bl TmFill
	movs r0, #4
	bl EnableBgSync
	ldr r3, _08048128 @ =gDispIo
	adds r1, r3, #0
	adds r1, #0x3c
	movs r0, #0x3f
	ldrb r2, [r1]
	ands r0, r2
	strb r0, [r1]
	adds r1, #8
	movs r2, #0
	movs r0, #0x10
	strb r0, [r1]
	adds r0, r3, #0
	adds r0, #0x45
	strb r2, [r0]
	adds r0, #1
	strb r2, [r0]
	pop {r0}
	bx r0
	.align 2, 0
_08048124: .4byte gBg2Tm
_08048128: .4byte gDispIo

	thumb_func_start sub_804812C
sub_804812C: @ 0x0804812C
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08048158 @ =gUnk_08C095F4
	movs r1, #2
	bl Proc_Start
	ldr r2, [r4, #0x2c]
	movs r1, #0x10
	ldrsb r1, [r2, r1]
	lsls r1, r1, #1
	str r1, [r0, #0x34]
	movs r1, #0x11
	ldrsb r1, [r2, r1]
	lsls r1, r1, #1
	str r1, [r0, #0x38]
	adds r4, #0x41
	ldrb r1, [r4]
	adds r0, #0x41
	strb r1, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08048158: .4byte gUnk_08C095F4

	thumb_func_start sub_804815C
sub_804815C: @ 0x0804815C
	push {lr}
	ldr r0, [r0, #0x30]
	movs r1, #0
	bl sub_8047F54
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_804816C
sub_804816C: @ 0x0804816C
	push {lr}
	ldr r0, [r0, #0x30]
	bl sub_806E2A0
	pop {r0}
	bx r0

	thumb_func_start sub_8048178
sub_8048178: @ 0x08048178
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x30]
	ldr r1, [r4, #0x34]
	lsls r1, r1, #4
	ldr r2, [r4, #0x38]
	lsls r2, r2, #4
	bl sub_806E2E8
	ldr r1, [r4, #0x2c]
	ldr r0, [r4, #0x34]
	strb r0, [r1, #0x10]
	ldr r1, [r4, #0x2c]
	ldr r0, [r4, #0x38]
	strb r0, [r1, #0x11]
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_804819C
sub_804819C: @ 0x0804819C
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, [r4, #0x3c]
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	beq _080481B0
	ldr r0, [r4, #0x30]
	bl sub_806C738
_080481B0:
	ldr r0, [r4, #0x30]
	bl sub_806E2C8
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_80481BC
sub_80481BC: @ 0x080481BC
	push {lr}
	ldr r0, [r0, #0x30]
	bl sub_8047FA0
	pop {r0}
	bx r0

	thumb_func_start sub_80481C8
sub_80481C8: @ 0x080481C8
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _080481E8 @ =gUnk_08C095F4
	bl Proc_Find
	rsbs r1, r0, #0
	orrs r1, r0
	cmp r1, #0
	blt _080481E0
	adds r0, r4, #0
	bl Proc_Break
_080481E0:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080481E8: .4byte gUnk_08C095F4

	thumb_func_start sub_80481EC
sub_80481EC: @ 0x080481EC
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r5, r0, #0
	adds r6, r1, #0
	adds r7, r2, #0
	mov r8, r3
	ldr r0, [sp, #0x1c]
	ldr r1, [sp, #0x20]
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r1, #0
	beq _08048214
	ldr r0, _08048210 @ =gUnk_08C09624
	bl Proc_StartBlocking
	b _0804821C
	.align 2, 0
_08048210: .4byte gUnk_08C09624
_08048214:
	ldr r0, _08048240 @ =gUnk_08C09624
	movs r1, #2
	bl Proc_Start
_0804821C:
	adds r1, r0, #0
	str r5, [r1, #0x2c]
	str r6, [r1, #0x30]
	str r7, [r1, #0x34]
	mov r0, r8
	str r0, [r1, #0x38]
	ldr r0, [sp, #0x18]
	str r0, [r1, #0x3c]
	adds r0, r1, #0
	adds r0, #0x41
	strb r4, [r0]
	adds r0, r1, #0
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_08048240: .4byte gUnk_08C09624

	thumb_func_start sub_8048244
sub_8048244: @ 0x08048244
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r5, r0, #0
	adds r6, r1, #0
	adds r7, r2, #0
	mov r8, r3
	ldr r0, [sp, #0x1c]
	ldr r1, [sp, #0x20]
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r1, #0
	beq _0804826C
	ldr r0, _08048268 @ =gUnk_08C0969C
	bl Proc_StartBlocking
	b _08048274
	.align 2, 0
_08048268: .4byte gUnk_08C0969C
_0804826C:
	ldr r0, _08048298 @ =gUnk_08C0969C
	movs r1, #2
	bl Proc_Start
_08048274:
	adds r1, r0, #0
	str r5, [r1, #0x2c]
	str r6, [r1, #0x30]
	str r7, [r1, #0x34]
	mov r0, r8
	str r0, [r1, #0x38]
	ldr r0, [sp, #0x18]
	str r0, [r1, #0x3c]
	adds r0, r1, #0
	adds r0, #0x41
	strb r4, [r0]
	adds r0, r1, #0
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_08048298: .4byte gUnk_08C0969C

	thumb_func_start sub_804829C
sub_804829C: @ 0x0804829C
	push {r4, lr}
	sub sp, #4
	adds r4, r0, #0
	adds r2, r1, #0
	ldr r3, _080482BC @ =gUnk_081DB17C
	movs r0, #0
	str r0, [sp]
	movs r0, #4
	adds r1, r4, #0
	bl sub_8006884
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080482BC: .4byte gUnk_081DB17C

	thumb_func_start sub_80482C0
sub_80482C0: @ 0x080482C0
	push {lr}
	ldr r2, [r0, #0x2c]
	ldr r1, [r0, #0x30]
	adds r0, r2, #0
	bl sub_804829C
	pop {r0}
	bx r0

	thumb_func_start sub_80482D0
sub_80482D0: @ 0x080482D0
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	adds r6, r0, #0
	mov r8, r1
	adds r5, r2, #0
	ldr r4, _080482FC @ =gUnk_08C096DC
	adds r0, r4, #0
	bl sub_8004748
	adds r0, r4, #0
	adds r1, r5, #0
	bl Proc_Start
	str r6, [r0, #0x2c]
	mov r1, r8
	str r1, [r0, #0x30]
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080482FC: .4byte gUnk_08C096DC

	thumb_func_start sub_8048300
sub_8048300: @ 0x08048300
	push {r4, lr}
	ldr r4, _0804831C @ =gUnk_08C096DC
	adds r0, r4, #0
	bl Proc_Find
	cmp r0, #0
	beq _08048314
	adds r0, r4, #0
	bl sub_8004748
_08048314:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0804831C: .4byte gUnk_08C096DC

	thumb_func_start sub_8048320
sub_8048320: @ 0x08048320
	push {r4, lr}
	sub sp, #0x18
	ldr r1, _080483A4 @ =gUnk_081DB18A
	mov r0, sp
	movs r2, #0x18
	bl memcpy
	mov r0, sp
	bl InitBgs
	ldr r3, _080483A8 @ =gDispIo
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
	bl ApplySystemGraphics
	ldr r0, _080483AC @ =gUnk_081CD818
	movs r1, #0xc0
	lsls r1, r1, #2
	movs r2, #0x40
	bl ApplyPaletteExt
	ldr r4, _080483B0 @ =gUnk_081D15E0
	movs r0, #3
	bl GetBgChrOffset
	adds r1, r0, #0
	movs r2, #0xc0
	lsls r2, r2, #0x13
	adds r1, r1, r2
	adds r0, r4, #0
	bl Decompress
	ldr r0, _080483B4 @ =gUnk_081D3790
	ldr r1, _080483B8 @ =gBg3Tm
	bl Decompress
	ldr r0, _080483BC @ =gUnk_081D3AB0
	movs r1, #0xe0
	lsls r1, r1, #1
	movs r2, #0x40
	bl ApplyPaletteExt
	add sp, #0x18
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080483A4: .4byte gUnk_081DB18A
_080483A8: .4byte gDispIo
_080483AC: .4byte gUnk_081CD818
_080483B0: .4byte gUnk_081D15E0
_080483B4: .4byte gUnk_081D3790
_080483B8: .4byte gBg3Tm
_080483BC: .4byte gUnk_081D3AB0

	thumb_func_start sub_80483C0
sub_80483C0: @ 0x080483C0
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	adds r5, r1, #0
	ldr r4, _0804841C @ =gBg3Tm
	ldr r0, _08048420 @ =gUnk_08D8A220
	bl sub_8004748
	movs r0, #0x14
	subs r0, r0, r5
	lsls r0, r0, #5
	cmp r0, #0
	ble _080483EE
	movs r1, #0xe0
	lsls r1, r1, #8
	adds r2, r1, #0
	adds r1, r0, #0
_080483E0:
	ldrh r3, [r4]
	adds r0, r2, r3
	strh r0, [r4]
	adds r4, #2
	subs r1, #1
	cmp r1, #0
	bne _080483E0
_080483EE:
	lsls r0, r5, #5
	ldr r3, _08048420 @ =gUnk_08D8A220
	cmp r0, #0
	ble _0804840C
	movs r5, #0xf0
	lsls r5, r5, #8
	adds r2, r5, #0
	adds r1, r0, #0
_080483FE:
	ldrh r5, [r4]
	adds r0, r2, r5
	strh r0, [r4]
	adds r4, #2
	subs r1, #1
	cmp r1, #0
	bne _080483FE
_0804840C:
	adds r0, r3, #0
	adds r1, r6, #0
	bl Proc_Start
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0804841C: .4byte gBg3Tm
_08048420: .4byte gUnk_08D8A220

	thumb_func_start sub_8048424
sub_8048424: @ 0x08048424
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #0x28
	mov r8, r0
	ldr r1, _08048484 @ =gUnk_081DB1A2
	mov r0, sp
	movs r2, #0x28
	bl memcpy
	ldr r4, _08048488 @ =gBg3Tm
	ldr r0, _0804848C @ =gUnk_08D8A220
	bl sub_8004748
	movs r3, #0
	movs r6, #0xf
	ldr r5, _08048490 @ =0x0000027F
_08048446:
	adds r2, r4, #0
	adds r0, r3, #0
	adds r4, r2, #2
	cmp r3, #0
	bge _08048452
	adds r0, #0x1f
_08048452:
	asrs r0, r0, #5
	lsls r0, r0, #1
	mov r7, sp
	adds r1, r7, r0
	adds r0, r6, #0
	ldrh r1, [r1]
	ands r0, r1
	lsls r0, r0, #0xc
	ldrh r1, [r2]
	adds r0, r1, r0
	strh r0, [r2]
	adds r3, #1
	cmp r3, r5
	ble _08048446
	ldr r0, _0804848C @ =gUnk_08D8A220
	mov r1, r8
	bl Proc_Start
	add sp, #0x28
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08048484: .4byte gUnk_081DB1A2
_08048488: .4byte gBg3Tm
_0804848C: .4byte gUnk_08D8A220
_08048490: .4byte 0x0000027F

	thumb_func_start sub_8048494
sub_8048494: @ 0x08048494
	push {lr}
	ldr r0, _080484A0 @ =gUnk_08D8A220
	bl sub_8004748
	pop {r0}
	bx r0
	.align 2, 0
_080484A0: .4byte gUnk_08D8A220

	thumb_func_start sub_80484A4
sub_80484A4: @ 0x080484A4
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r6, r0, #0
	adds r5, r1, #0
	lsls r2, r2, #5
	mov r8, r2
	cmp r3, #0
	ble _080484DA
	movs r7, #0x80
	lsls r7, r7, #3
	adds r4, r3, #0
_080484BC:
	mov r2, r8
	cmp r2, #0
	bge _080484C4
	adds r2, #3
_080484C4:
	lsls r2, r2, #9
	lsrs r2, r2, #0xb
	adds r0, r6, #0
	adds r1, r5, #0
	bl CpuFastSet
	adds r6, r6, r7
	adds r5, r5, r7
	subs r4, #1
	cmp r4, #0
	bne _080484BC
_080484DA:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_80484E4
sub_80484E4: @ 0x080484E4
	push {r4, r5, r6, lr}
	ldr r0, [r0, #0x58]
	movs r6, #3
	ands r6, r0
	cmp r0, #0
	bge _080484F2
	adds r0, #3
_080484F2:
	asrs r4, r0, #2
	ldr r0, _08048530 @ =gUnk_081D1384
	ldr r1, _08048534 @ =0x06000800
	bl Decompress
	ldr r0, _08048538 @ =gUnk_081CA2A4
	ldr r5, _0804853C @ =gBuf
	adds r1, r5, #0
	bl Decompress
	lsls r0, r6, #8
	lsls r4, r4, #0xb
	adds r0, r0, r4
	adds r0, r0, r5
	ldr r1, _08048540 @ =0x06014000
	movs r2, #8
	movs r3, #2
	bl sub_80484A4
	ldr r0, _08048544 @ =gBg2Tm
	ldr r1, _08048548 @ =gUnk_081D1564
	movs r2, #0x82
	lsls r2, r2, #5
	bl TmApplyTsa_thm
	movs r0, #4
	bl EnableBgSync
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08048530: .4byte gUnk_081D1384
_08048534: .4byte 0x06000800
_08048538: .4byte gUnk_081CA2A4
_0804853C: .4byte gBuf
_08048540: .4byte 0x06014000
_08048544: .4byte gBg2Tm
_08048548: .4byte gUnk_081D1564

	thumb_func_start sub_804854C
sub_804854C: @ 0x0804854C
	push {lr}
	sub sp, #4
	ldr r3, _08048568 @ =gUnk_08C096F4
	movs r0, #0
	str r0, [sp]
	movs r0, #4
	movs r1, #0x28
	movs r2, #8
	bl PutSpriteExt
	add sp, #4
	pop {r0}
	bx r0
	.align 2, 0
_08048568: .4byte gUnk_08C096F4

	thumb_func_start sub_804856C
sub_804856C: @ 0x0804856C
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r6, r1, #0
	ldr r4, _0804858C @ =gUnk_08C09704
	adds r0, r4, #0
	bl sub_8004748
	adds r0, r4, #0
	adds r1, r5, #0
	bl Proc_Start
	str r6, [r0, #0x58]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0804858C: .4byte gUnk_08C09704

	thumb_func_start sub_8048590
sub_8048590: @ 0x08048590
	push {lr}
	ldr r0, _0804859C @ =gUnk_08C09704
	bl sub_8004748
	pop {r0}
	bx r0
	.align 2, 0
_0804859C: .4byte gUnk_08C09704

	thumb_func_start sub_80485A0
sub_80485A0: @ 0x080485A0
	ldr r3, _080485E0 @ =gDispIo
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
	movs r2, #0
	movs r0, #8
	strb r0, [r1]
	adds r1, #1
	movs r0, #0xf
	strb r0, [r1]
	adds r0, r3, #0
	adds r0, #0x46
	strb r2, [r0]
	ldr r0, _080485E4 @ =0x0000FFE0
	ldrh r2, [r3, #0x3c]
	ands r0, r2
	ldr r1, _080485E8 @ =0x0000E0FF
	ands r0, r1
	movs r2, #0x80
	lsls r2, r2, #4
	adds r1, r2, #0
	orrs r0, r1
	strh r0, [r3, #0x3c]
	bx lr
	.align 2, 0
_080485E0: .4byte gDispIo
_080485E4: .4byte 0x0000FFE0
_080485E8: .4byte 0x0000E0FF

	thumb_func_start sub_80485EC
sub_80485EC: @ 0x080485EC
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #4
	adds r5, r0, #0
	ldr r0, _08048668 @ =0x00007E08
	mov sb, r0
	ldr r2, [r5, #0x2c]
	ldr r0, [r5, #0x34]
	adds r2, r2, r0
	asrs r2, r2, #1
	ldr r0, [r5, #0x30]
	ldr r1, [r5, #0x38]
	adds r0, r0, r1
	asrs r0, r0, #1
	mov r8, r0
	str r2, [r5, #0x34]
	str r0, [r5, #0x38]
	movs r7, #0
	adds r6, r2, #0
_08048616:
	ldr r4, [r5, #0x40]
	adds r0, r4, #0
	cmp r4, #0
	bge _08048620
	adds r0, r4, #7
_08048620:
	asrs r0, r0, #3
	adds r0, r0, r7
	ldr r1, [r5, #0x3c]
	bl __modsi3
	movs r1, #7
	ands r4, r1
	subs r1, r6, r4
	add r0, sb
	str r0, [sp]
	movs r0, #0xc
	mov r2, r8
	ldr r3, _0804866C @ =gUnk_08C09724
	bl sub_8006884
	adds r6, #8
	adds r7, #1
	cmp r7, #0x1f
	ble _08048616
	ldr r1, [r5, #0x40]
	adds r1, #1
	str r1, [r5, #0x40]
	ldr r0, [r5, #0x3c]
	lsls r0, r0, #3
	cmp r1, r0
	bne _08048658
	movs r0, #0
	str r0, [r5, #0x40]
_08048658:
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08048668: .4byte 0x00007E08
_0804866C: .4byte gUnk_08C09724

	thumb_func_start sub_8048670
sub_8048670: @ 0x08048670
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	adds r7, r0, #0
	adds r6, r1, #0
	mov r8, r2
	mov sb, r3
	ldr r0, _080486F4 @ =gUnk_081CA0B4
	ldr r1, _080486F8 @ =gBuf
	bl Decompress
	movs r4, #0
	cmp r4, r6
	bge _080486B4
	ldr r5, _080486FC @ =0x06014100
_08048690:
	adds r0, r4, #0
	adds r1, r6, #0
	bl __modsi3
	adds r0, r7, r0
	ldrb r0, [r0]
	lsls r0, r0, #5
	ldr r1, _080486F8 @ =gBuf
	adds r0, r0, r1
	adds r1, r5, #0
	movs r2, #1
	movs r3, #2
	bl sub_80484A4
	adds r5, #0x20
	adds r4, #1
	cmp r4, r6
	blt _08048690
_080486B4:
	ldr r0, [sp, #0x1c]
	lsls r0, r0, #5
	ldr r1, _08048700 @ =gUnk_081CD898
	adds r0, r0, r1
	movs r1, #0xb8
	lsls r1, r1, #2
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r4, _08048704 @ =gUnk_08C0972C
	adds r0, r4, #0
	bl sub_8004748
	adds r0, r4, #0
	ldr r1, [sp, #0x20]
	bl Proc_Start
	mov r1, r8
	str r1, [r0, #0x2c]
	str r1, [r0, #0x34]
	mov r1, sb
	str r1, [r0, #0x30]
	str r1, [r0, #0x38]
	str r6, [r0, #0x3c]
	movs r1, #0
	str r1, [r0, #0x40]
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080486F4: .4byte gUnk_081CA0B4
_080486F8: .4byte gBuf
_080486FC: .4byte 0x06014100
_08048700: .4byte gUnk_081CD898
_08048704: .4byte gUnk_08C0972C

	thumb_func_start sub_8048708
sub_8048708: @ 0x08048708
	push {lr}
	ldr r2, _08048734 @ =gDispIo
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
	ldr r0, _08048738 @ =gUnk_08C0972C
	bl sub_8004748
	pop {r0}
	bx r0
	.align 2, 0
_08048734: .4byte gDispIo
_08048738: .4byte gUnk_08C0972C

	thumb_func_start sub_804873C
sub_804873C: @ 0x0804873C
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r0, _08048754 @ =gUnk_08C0972C
	bl Proc_Find
	str r4, [r0, #0x2c]
	str r5, [r0, #0x30]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08048754: .4byte gUnk_08C0972C

	thumb_func_start sub_8048758
sub_8048758: @ 0x08048758
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r0, _08048774 @ =gUnk_08C0972C
	bl Proc_Find
	str r4, [r0, #0x34]
	str r4, [r0, #0x2c]
	str r5, [r0, #0x38]
	str r5, [r0, #0x30]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08048774: .4byte gUnk_08C0972C

	thumb_func_start sub_8048778
sub_8048778: @ 0x08048778
	push {lr}
	lsls r0, r0, #5
	ldr r1, _08048790 @ =gUnk_081CD898
	adds r0, r0, r1
	movs r1, #0xb8
	lsls r1, r1, #2
	movs r2, #0x20
	bl ApplyPaletteExt
	pop {r0}
	bx r0
	.align 2, 0
_08048790: .4byte gUnk_081CD898

	thumb_func_start sub_8048794
sub_8048794: @ 0x08048794
	push {r4, lr}
	sub sp, #0x20
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	ldr r1, _080487D8 @ =gUnk_081DB252
	mov r0, sp
	movs r2, #0x20
	bl memcpy
	ldr r0, _080487DC @ =0x0203DCC0
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne _080487D0
	mov r1, sp
	adds r0, r1, r4
	ldrb r2, [r0]
	adds r2, #0x10
	ldr r3, _080487E0 @ =gPal
	lsls r0, r2, #0xa
	lsls r1, r2, #5
	adds r0, r0, r1
	adds r0, r0, r2
	movs r1, #0x9f
	lsls r1, r1, #2
	adds r3, r3, r1
	strh r0, [r3]
	bl EnablePalSync
_080487D0:
	add sp, #0x20
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080487D8: .4byte gUnk_081DB252
_080487DC: .4byte 0x0203DCC0
_080487E0: .4byte gPal

	thumb_func_start sub_80487E4
sub_80487E4: @ 0x080487E4
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	adds r7, r0, #0
	ldr r0, _08048928 @ =0x000082DA
	mov r8, r0
	movs r2, #0x2a
	ldrsh r1, [r7, r2]
	movs r3, #0x2c
	ldrsh r2, [r7, r3]
	ldr r3, _0804892C @ =gUnk_08C0974C
	adds r0, r7, #0
	adds r0, #0x2f
	ldrb r0, [r0]
	lsls r0, r0, #2
	adds r0, r0, r3
	ldr r3, [r0]
	ldr r4, _08048930 @ =gUnk_081DB210
	adds r5, r7, #0
	adds r5, #0x2e
	ldrb r6, [r5]
	lsls r0, r6, #1
	adds r0, r0, r4
	ldrh r0, [r0]
	str r0, [sp]
	movs r0, #4
	bl sub_8006884
	ldrb r5, [r5]
	cmp r5, #2
	bne _0804882E
	adds r0, r7, #0
	adds r0, #0x30
	ldrb r0, [r0]
	bl sub_8048794
_0804882E:
	adds r2, r7, #0
	adds r2, #0x30
	ldrb r0, [r2]
	adds r0, #1
	movs r1, #0x1f
	ands r0, r1
	strb r0, [r2]
	movs r0, #0x81
	lsls r0, r0, #1
	ldrh r1, [r7, #0x2e]
	cmp r1, r0
	bne _0804891C
	ldrh r1, [r7, #0x3a]
	ldrh r2, [r7, #0x36]
	adds r0, r1, r2
	strh r0, [r7, #0x36]
	ldrh r2, [r7, #0x3c]
	ldrh r3, [r7, #0x38]
	adds r0, r2, r3
	strh r0, [r7, #0x38]
	lsls r0, r1, #0x10
	asrs r0, r0, #0x10
	cmp r0, #4
	ble _08048862
	subs r0, r1, #1
	strh r0, [r7, #0x3a]
_08048862:
	lsls r0, r2, #0x10
	asrs r0, r0, #0x10
	cmp r0, #4
	ble _0804886E
	subs r0, r2, #1
	strh r0, [r7, #0x3c]
_0804886E:
	bl GetGameTime
	movs r1, #3
	ands r1, r0
	cmp r1, #0
	bne _08048896
	ldrh r1, [r7, #0x32]
	movs r6, #0x32
	ldrsh r0, [r7, r6]
	cmp r0, #0
	bge _08048888
	adds r0, r1, #1
	strh r0, [r7, #0x32]
_08048888:
	ldrh r1, [r7, #0x34]
	movs r2, #0x34
	ldrsh r0, [r7, r2]
	cmp r0, #0x34
	ble _08048896
	subs r0, r1, #1
	strh r0, [r7, #0x34]
_08048896:
	movs r3, #0x2a
	ldrsh r5, [r7, r3]
	movs r6, #0x32
	ldrsh r0, [r7, r6]
	adds r0, #0x3b
	adds r5, r5, r0
	movs r0, #0x2c
	ldrsh r4, [r7, r0]
	adds r4, #8
	ldr r6, _08048934 @ =Sprite_8x16
	ldrh r1, [r7, #0x36]
	lsrs r0, r1, #5
	movs r1, #6
	bl __umodsi3
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	add r0, r8
	str r0, [sp]
	movs r0, #4
	adds r1, r5, #0
	adds r2, r4, #0
	adds r3, r6, #0
	bl sub_8006884
	movs r2, #0x2a
	ldrsh r5, [r7, r2]
	movs r3, #0x34
	ldrsh r0, [r7, r3]
	adds r0, #0x3b
	adds r5, r5, r0
	movs r6, #0x2c
	ldrsh r4, [r7, r6]
	adds r4, #8
	ldr r6, _08048938 @ =gUnk_08BFF7D0
	ldrh r1, [r7, #0x38]
	lsrs r0, r1, #5
	movs r1, #6
	bl __umodsi3
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	add r0, r8
	str r0, [sp]
	movs r0, #4
	adds r1, r5, #0
	adds r2, r4, #0
	adds r3, r6, #0
	bl sub_8006884
	movs r2, #0x2a
	ldrsh r1, [r7, r2]
	adds r1, #0x40
	movs r3, #0x2c
	ldrsh r2, [r7, r3]
	adds r2, #8
	ldr r3, _0804893C @ =gUnk_08C09760
	ldr r0, _08048940 @ =0x0203D908
	ldrb r0, [r0, #5]
	lsls r0, r0, #2
	adds r0, r0, r3
	ldr r3, [r0]
	movs r0, #0
	str r0, [sp]
	movs r0, #4
	bl PutSpriteExt
_0804891C:
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08048928: .4byte 0x000082DA
_0804892C: .4byte gUnk_08C0974C
_08048930: .4byte gUnk_081DB210
_08048934: .4byte Sprite_8x16
_08048938: .4byte gUnk_08BFF7D0
_0804893C: .4byte gUnk_08C09760
_08048940: .4byte 0x0203D908

	thumb_func_start sub_8048944
sub_8048944: @ 0x08048944
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	sub sp, #4
	mov r8, r0
	adds r4, r1, #0
	adds r5, r2, #0
	adds r2, r3, #0
	ldr r6, [sp, #0x18]
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	lsls r5, r5, #0x18
	lsrs r5, r5, #0x18
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	lsls r6, r6, #0x18
	lsrs r6, r6, #0x18
	ldr r0, _080489B0 @ =gUnk_08C0976C
	mov r1, r8
	str r2, [sp]
	bl Proc_Start
	mov r8, r0
	movs r3, #0
	movs r1, #0
	strh r4, [r0, #0x2a]
	strh r5, [r0, #0x2c]
	adds r0, #0x2e
	strb r6, [r0]
	adds r0, #1
	ldr r2, [sp]
	strb r2, [r0]
	mov r0, r8
	strh r1, [r0, #0x32]
	movs r0, #0x34
	mov r2, r8
	strh r0, [r2, #0x34]
	strh r1, [r2, #0x38]
	strh r1, [r2, #0x36]
	movs r0, #4
	strh r0, [r2, #0x3c]
	strh r0, [r2, #0x3a]
	mov r0, r8
	adds r0, #0x3e
	strb r3, [r0]
	subs r0, #0xe
	strb r3, [r0]
	mov r0, r8
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_080489B0: .4byte gUnk_08C0976C

	thumb_func_start sub_80489B4
sub_80489B4: @ 0x080489B4
	push {r4, lr}
	ldr r4, [sp, #8]
	strh r1, [r0, #0x32]
	strh r2, [r0, #0x34]
	strh r3, [r0, #0x3a]
	strh r4, [r0, #0x3c]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_80489C8
sub_80489C8: @ 0x080489C8
	strh r1, [r0, #0x2a]
	strh r2, [r0, #0x2c]
	bx lr
	.align 2, 0

	thumb_func_start sub_80489D0
sub_80489D0: @ 0x080489D0
	push {r4, lr}
	sub sp, #0x20
	ldr r4, _08048A18 @ =gUnk_081CD958
	ldr r1, _08048A1C @ =gUnk_081DB252
	mov r0, sp
	movs r2, #0x20
	bl memcpy
	ldr r0, _08048A20 @ =0x0203DCC0
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne _08048A0E
	bl GetGameTime
	movs r1, #0x3f
	ands r1, r0
	asrs r1, r1, #1
	mov r2, sp
	adds r0, r2, r1
	ldr r1, _08048A24 @ =gPal
	ldrb r0, [r0]
	lsls r0, r0, #1
	adds r0, r0, r4
	ldrh r0, [r0]
	ldr r2, _08048A28 @ =0x0000033E
	adds r1, r1, r2
	strh r0, [r1]
	bl EnablePalSync
_08048A0E:
	add sp, #0x20
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08048A18: .4byte gUnk_081CD958
_08048A1C: .4byte gUnk_081DB252
_08048A20: .4byte 0x0203DCC0
_08048A24: .4byte gPal
_08048A28: .4byte 0x0000033E

	thumb_func_start sub_8048A2C
sub_8048A2C: @ 0x08048A2C
	push {r4, lr}
	sub sp, #0x20
	ldr r4, _08048A74 @ =gUnk_081CD9B8
	ldr r1, _08048A78 @ =gUnk_081DB252
	mov r0, sp
	movs r2, #0x20
	bl memcpy
	ldr r0, _08048A7C @ =0x0203DCC0
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne _08048A6C
	bl GetGameTime
	movs r1, #0x3f
	ands r1, r0
	asrs r1, r1, #1
	mov r2, sp
	adds r0, r2, r1
	ldr r1, _08048A80 @ =gPal
	ldrb r0, [r0]
	lsls r0, r0, #1
	adds r0, r0, r4
	ldrh r0, [r0]
	movs r2, #0x9f
	lsls r2, r2, #2
	adds r1, r1, r2
	strh r0, [r1]
	bl EnablePalSync
_08048A6C:
	add sp, #0x20
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08048A74: .4byte gUnk_081CD9B8
_08048A78: .4byte gUnk_081DB252
_08048A7C: .4byte 0x0203DCC0
_08048A80: .4byte gPal

	thumb_func_start sub_8048A84
sub_8048A84: @ 0x08048A84
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	adds r7, r0, #0
	ldr r0, _08048AC4 @ =0x0203D908
	ldrb r0, [r0]
	cmp r0, #1
	beq _08048A9C
	b _08048C0C
_08048A9C:
	adds r0, r7, #0
	adds r0, #0x44
	movs r1, #0
	ldrsb r1, [r0, r1]
	movs r2, #0xc0
	lsls r2, r2, #4
	mov r8, r2
	str r0, [sp, #4]
	cmp r1, #0
	beq _08048AB6
	movs r0, #0x80
	lsls r0, r0, #3
	mov r8, r0
_08048AB6:
	ldr r3, _08048AC8 @ =gUnk_08C09784
	cmp r1, #0
	beq _08048ACC
	movs r0, #0x80
	lsls r0, r0, #4
	b _08048AD0
	.align 2, 0
_08048AC4: .4byte 0x0203D908
_08048AC8: .4byte gUnk_08C09784
_08048ACC:
	movs r0, #0x80
	lsls r0, r0, #3
_08048AD0:
	str r0, [sp]
	movs r0, #0xb
	movs r1, #0x50
	movs r2, #0x20
	bl sub_8006884
	movs r6, #0
	ldr r0, [r7, #0x2c]
	cmp r6, r0
	bge _08048B32
	movs r5, #0x20
_08048AE6:
	lsls r1, r6, #1
	adds r0, r7, #0
	adds r0, #0x30
	adds r4, r0, r1
	movs r2, #0
	ldrsh r1, [r4, r2]
	adds r1, #8
	movs r0, #0xf
	ands r0, r6
	lsls r0, r0, #0xc
	add r0, r8
	str r0, [sp]
	movs r0, #4
	adds r2, r5, #0
	ldr r3, _08048BEC @ =gUnk_081DB272
	bl sub_8006884
	adds r0, r7, #0
	adds r0, #0x3a
	adds r0, r0, r6
	ldrb r0, [r0]
	cmp r0, #0
	beq _08048B28
	movs r0, #0
	ldrsh r1, [r4, r0]
	adds r1, #8
	mov r2, r8
	str r2, [sp]
	movs r0, #4
	adds r2, r5, #0
	ldr r3, _08048BF0 @ =gUnk_081DB2A0
	bl sub_8006884
_08048B28:
	adds r5, #0x18
	adds r6, #1
	ldr r0, [r7, #0x2c]
	cmp r6, r0
	blt _08048AE6
_08048B32:
	ldr r0, [r7, #0x40]
	cmp r0, #0
	beq _08048BE4
	ldr r0, _08048BF4 @ =0x0203DCC0
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne _08048B62
	bl GetGameTime
	ldr r2, _08048BF8 @ =gPal
	movs r1, #0x3f
	ands r1, r0
	lsrs r1, r1, #2
	lsls r1, r1, #1
	ldr r0, _08048BFC @ =gUnk_0841ECB0
	adds r1, r1, r0
	ldrh r0, [r1]
	ldr r1, _08048C00 @ =0x0000031A
	adds r2, r2, r1
	strh r0, [r2]
	bl EnablePalSync
_08048B62:
	ldr r0, [r7, #0x40]
	cmp r0, #0xff
	bgt _08048B6C
	adds r0, #0x10
	str r0, [r7, #0x40]
_08048B6C:
	ldr r4, _08048C04 @ =gSinLut
	movs r2, #0x80
	adds r2, r2, r4
	mov sb, r2
	movs r1, #0
	ldrsh r0, [r2, r1]
	lsls r0, r0, #4
	movs r2, #0x80
	lsls r2, r2, #1
	mov r8, r2
	mov r1, r8
	bl Div
	adds r6, r0, #0
	lsls r6, r6, #0x10
	asrs r6, r6, #0x10
	movs r1, #0
	ldrsh r0, [r4, r1]
	rsbs r0, r0, #0
	lsls r0, r0, #4
	ldr r1, [r7, #0x40]
	bl Div
	adds r5, r0, #0
	lsls r5, r5, #0x10
	asrs r5, r5, #0x10
	movs r2, #0
	ldrsh r0, [r4, r2]
	lsls r0, r0, #4
	mov r1, r8
	bl Div
	adds r4, r0, #0
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	mov r1, sb
	movs r2, #0
	ldrsh r0, [r1, r2]
	lsls r0, r0, #4
	ldr r1, [r7, #0x40]
	bl Div
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	str r0, [sp]
	movs r0, #0
	adds r1, r6, #0
	adds r2, r5, #0
	adds r3, r4, #0
	bl SetObjAffine
	ldr r3, _08048C08 @ =gUnk_081DB2BA
	movs r0, #0x80
	lsls r0, r0, #8
	str r0, [sp]
	movs r0, #4
	movs r1, #0x78
	movs r2, #0
	bl sub_8006884
_08048BE4:
	bl sub_8048A2C
	b _08048C9A
	.align 2, 0
_08048BEC: .4byte gUnk_081DB272
_08048BF0: .4byte gUnk_081DB2A0
_08048BF4: .4byte 0x0203DCC0
_08048BF8: .4byte gPal
_08048BFC: .4byte gUnk_0841ECB0
_08048C00: .4byte 0x0000031A
_08048C04: .4byte gSinLut
_08048C08: .4byte gUnk_081DB2BA
_08048C0C:
	ldr r3, _08048C74 @ =gUnk_08C09784
	movs r0, #0
	str r0, [sp]
	movs r0, #0xb
	movs r1, #0x50
	movs r2, #0x20
	bl sub_8006884
	movs r6, #0
	ldr r0, [r7, #0x2c]
	adds r1, r7, #0
	adds r1, #0x44
	str r1, [sp, #4]
	cmp r6, r0
	bge _08048C96
	ldr r2, _08048C78 @ =gUnk_08C097F4
	mov sl, r2
	movs r0, #8
	rsbs r0, r0, #0
	mov sb, r0
	movs r1, #0x28
	mov r8, r1
_08048C38:
	lsls r1, r6, #1
	adds r0, r7, #0
	adds r0, #0x30
	adds r5, r0, r1
	movs r2, #0
	ldrsh r1, [r5, r2]
	adds r4, r7, #0
	adds r4, #0x3a
	adds r4, r4, r6
	ldrb r2, [r4]
	lsls r0, r2, #2
	add r0, sl
	ldr r3, [r0]
	movs r0, #0
	str r0, [sp]
	movs r0, #2
	mov r2, r8
	bl sub_8006884
	ldrb r0, [r4]
	cmp r0, #0
	beq _08048C7C
	ldrh r1, [r5]
	movs r2, #0
	ldrsh r0, [r5, r2]
	cmp r0, #0
	bge _08048C8A
	adds r0, r1, #1
	b _08048C88
	.align 2, 0
_08048C74: .4byte gUnk_08C09784
_08048C78: .4byte gUnk_08C097F4
_08048C7C:
	ldrh r1, [r5]
	movs r2, #0
	ldrsh r0, [r5, r2]
	cmp r0, sb
	ble _08048C8A
	subs r0, r1, #1
_08048C88:
	strh r0, [r5]
_08048C8A:
	movs r0, #0x10
	add r8, r0
	adds r6, #1
	ldr r0, [r7, #0x2c]
	cmp r6, r0
	blt _08048C38
_08048C96:
	bl sub_80489D0
_08048C9A:
	ldr r0, _08048CE8 @ =0x0203D908
	movs r1, #0x80
	lsls r1, r1, #4
	mov r8, r1
	ldrb r0, [r0]
	cmp r0, #1
	bne _08048CAE
	movs r2, #0x80
	lsls r2, r2, #3
	mov r8, r2
_08048CAE:
	ldr r1, [sp, #4]
	movs r0, #0
	ldrsb r0, [r1, r0]
	cmp r0, #0
	beq _08048CC0
	movs r0, #0xc0
	movs r1, #0x10
	bl sub_804829C
_08048CC0:
	ldr r0, [r7, #0x48]
	cmp r0, #0
	blt _08048CD8
	adds r2, r0, #0
	adds r2, #8
	ldr r3, _08048CEC @ =gUnk_08C097BA
	mov r0, r8
	str r0, [sp]
	movs r0, #4
	movs r1, #0x50
	bl sub_8006884
_08048CD8:
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08048CE8: .4byte 0x0203D908
_08048CEC: .4byte gUnk_08C097BA

	thumb_func_start sub_8048CF0
sub_8048CF0: @ 0x08048CF0
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #8
	adds r6, r0, #0
	adds r5, r1, #0
	mov r8, r2
	ldr r4, _08048D90 @ =gUnk_08C097FC
	adds r0, r4, #0
	bl sub_8004748
	adds r0, r4, #0
	adds r1, r6, #0
	bl Proc_Start
	adds r4, r0, #0
	str r5, [r4, #0x2c]
	adds r1, r4, #0
	adds r1, #0x44
	movs r2, #0
	movs r0, #1
	strb r0, [r1]
	str r2, [r4, #0x40]
	subs r0, #2
	str r0, [r4, #0x48]
	movs r3, #0
	adds r5, r4, #0
	adds r5, #0x3a
	ldr r0, _08048D94 @ =0x0000FFF8
	mov ip, r0
	adds r2, r4, #0
	adds r2, #0x30
_08048D30:
	adds r0, r5, r3
	mov r7, r8
	adds r1, r7, r3
	ldrb r1, [r1]
	strb r1, [r0]
	mov r0, ip
	strh r0, [r2]
	adds r2, #2
	adds r3, #1
	cmp r3, #4
	ble _08048D30
	ldr r2, [r6, #0x38]
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	adds r0, r6, #0
	adds r0, #0x4a
	ldrb r0, [r0]
	adds r0, #0x28
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp]
	str r4, [sp, #4]
	movs r0, #0xe0
	movs r1, #0x28
	movs r3, #6
	bl sub_80493CC
	adds r0, r6, #0
	adds r0, #0x48
	ldrb r0, [r0]
	lsls r0, r0, #4
	movs r1, #0x28
	subs r1, r1, r0
	ldr r0, [r6, #0x38]
	str r0, [sp]
	str r4, [sp, #4]
	movs r0, #0x98
	movs r2, #0x88
	movs r3, #0x27
	bl sub_8048E18
	adds r0, r4, #0
	add sp, #8
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_08048D90: .4byte gUnk_08C097FC
_08048D94: .4byte 0x0000FFF8

	thumb_func_start sub_8048D98
sub_8048D98: @ 0x08048D98
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	adds r4, r0, #0
	movs r0, #0
	mov r8, r0
	b _08048E00
_08048DAC:
	mov r1, r8
	lsls r0, r1, #4
	ldr r1, [r4, #0x30]
	adds r5, r1, r0
	ldr r0, [r4, #0x38]
	movs r1, #1
	add r1, r8
	mov sl, r1
	cmp r5, r0
	bge _08048DFE
	ldr r0, [r4, #0x34]
	cmp r5, r0
	ble _08048DFE
	movs r6, #0
	mov r0, r8
	lsls r0, r0, #2
	mov sb, r0
	movs r7, #0
_08048DD0:
	mov r0, sb
	add r0, r8
	adds r0, r0, r6
	adds r0, #1
	bl GetUnit
	adds r2, r0, #0
	ldr r0, [r2]
	cmp r0, #0
	beq _08048DF6
	ldr r1, [r4, #0x2c]
	adds r1, r1, r7
	str r2, [sp]
	movs r0, #4
	adds r2, r5, #0
	movs r3, #0x80
	lsls r3, r3, #3
	bl sub_802682C
_08048DF6:
	adds r7, #0xe
	adds r6, #1
	cmp r6, #4
	ble _08048DD0
_08048DFE:
	mov r8, sl
_08048E00:
	ldr r0, [r4, #0x3c]
	cmp r8, r0
	blt _08048DAC
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_8048E18
sub_8048E18: @ 0x08048E18
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	mov sb, r0
	mov sl, r1
	adds r7, r2, #0
	mov r8, r3
	ldr r6, [sp, #0x20]
	ldr r5, [sp, #0x24]
	ldr r4, _08048E5C @ =gUnk_08C09814
	adds r0, r4, #0
	bl sub_8004748
	adds r0, r4, #0
	adds r1, r5, #0
	bl Proc_Start
	str r6, [r0, #0x3c]
	mov r1, sb
	str r1, [r0, #0x2c]
	mov r1, sl
	str r1, [r0, #0x30]
	mov r1, r8
	str r1, [r0, #0x34]
	str r7, [r0, #0x38]
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08048E5C: .4byte gUnk_08C09814

	thumb_func_start sub_8048E60
sub_8048E60: @ 0x08048E60
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08048E78 @ =gUnk_08C09814
	bl Proc_Find
	ldr r1, [r0, #0x30]
	adds r1, r1, r4
	str r1, [r0, #0x30]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08048E78: .4byte gUnk_08C09814

	thumb_func_start sub_8048E7C
sub_8048E7C: @ 0x08048E7C
	push {r4, r5, r6, lr}
	ldr r5, _08048EC0 @ =gUnk_081CD998
	ldr r0, _08048EC4 @ =0x0203DCC0
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne _08048EBA
	bl GetGameTime
	adds r2, r0, #0
	movs r0, #0x1f
	ands r2, r0
	asrs r2, r2, #1
	movs r1, #0
	ldr r0, _08048EC8 @ =gPal
	movs r4, #0xf
	ldr r6, _08048ECC @ =0x00000336
	adds r3, r0, r6
_08048EA2:
	adds r0, r2, r1
	ands r0, r4
	lsls r0, r0, #1
	adds r0, r0, r5
	ldrh r0, [r0]
	strh r0, [r3]
	adds r3, #2
	adds r1, #1
	cmp r1, #4
	ble _08048EA2
	bl EnablePalSync
_08048EBA:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08048EC0: .4byte gUnk_081CD998
_08048EC4: .4byte 0x0203DCC0
_08048EC8: .4byte gPal
_08048ECC: .4byte 0x00000336

	thumb_func_start sub_8048ED0
sub_8048ED0: @ 0x08048ED0
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r7, r0, #0
	ldr r1, [r7, #0x34]
	ldr r0, [r7, #0x2c]
	adds r1, r1, r0
	asrs r1, r1, #1
	ldr r2, [r7, #0x38]
	ldr r0, [r7, #0x30]
	adds r2, r2, r0
	asrs r2, r2, #1
	str r1, [r7, #0x2c]
	str r2, [r7, #0x30]
	ldr r3, _08048F3C @ =gUnk_08C0982C
	ldr r0, [r7, #0x3c]
	lsls r0, r0, #2
	adds r0, r0, r3
	ldr r3, [r0]
	movs r4, #0
	str r4, [sp]
	movs r0, #2
	bl sub_8006884
	ldr r1, [r7, #0x40]
	adds r1, #0x60
	ldr r3, _08048F40 @ =gUnk_081DB2D8
	str r4, [sp]
	movs r0, #2
	movs r2, #0x30
	bl sub_8006884
	bl sub_803DEC4
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _08048F4C
	ldr r3, _08048F44 @ =gUnk_08C09784
	str r4, [sp]
	movs r0, #2
	movs r1, #0x60
	movs r2, #0x20
	bl sub_8006884
	ldr r3, _08048F48 @ =gUnk_081DB272
	movs r0, #0x80
	lsls r0, r0, #4
	str r0, [sp]
	movs r0, #4
	movs r1, #0x50
	movs r2, #0x20
	bl sub_8006884
	b _08048F6C
	.align 2, 0
_08048F3C: .4byte gUnk_08C0982C
_08048F40: .4byte gUnk_081DB2D8
_08048F44: .4byte gUnk_08C09784
_08048F48: .4byte gUnk_081DB272
_08048F4C:
	ldr r3, _08048F90 @ =gUnk_08C09784
	str r0, [sp]
	movs r0, #2
	movs r1, #0x58
	movs r2, #0x20
	bl sub_8006884
	ldr r3, _08048F94 @ =gUnk_081DB28C
	movs r0, #0x80
	lsls r0, r0, #4
	str r0, [sp]
	movs r0, #4
	movs r1, #0x50
	movs r2, #0x20
	bl sub_8006884
_08048F6C:
	movs r4, #0
	ldr r6, _08048F98 @ =gUnk_08C09834
	movs r5, #0x48
_08048F72:
	ldr r0, [r7, #0x44]
	cmp r0, r4
	bne _08048F9C
	cmp r4, #2
	bgt _08048F9C
	ldr r3, [r6]
	movs r0, #0x80
	lsls r0, r0, #7
	str r0, [sp]
	movs r0, #4
	movs r1, #0xc4
	adds r2, r5, #0
	bl sub_8006884
	b _08048FAE
	.align 2, 0
_08048F90: .4byte gUnk_08C09784
_08048F94: .4byte gUnk_081DB28C
_08048F98: .4byte gUnk_08C09834
_08048F9C:
	ldr r3, [r6]
	movs r0, #0x80
	lsls r0, r0, #8
	str r0, [sp]
	movs r0, #4
	movs r1, #0xc4
	adds r2, r5, #0
	bl sub_8006884
_08048FAE:
	adds r6, #4
	adds r5, #0x10
	adds r4, #1
	cmp r4, #4
	ble _08048F72
	bl sub_8048E7C
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_8048FC4
sub_8048FC4: @ 0x08048FC4
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	adds r6, r0, #0
	adds r5, r1, #0
	mov r8, r2
	ldr r4, _08049000 @ =gUnk_08C09848
	adds r0, r4, #0
	bl sub_8004748
	adds r0, r4, #0
	adds r1, r6, #0
	bl Proc_Start
	str r5, [r0, #0x34]
	str r5, [r0, #0x2c]
	mov r1, r8
	str r1, [r0, #0x38]
	str r1, [r0, #0x30]
	movs r1, #0
	str r1, [r0, #0x3c]
	str r1, [r0, #0x40]
	movs r1, #1
	str r1, [r0, #0x44]
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_08049000: .4byte gUnk_08C09848

	thumb_func_start sub_8049004
sub_8049004: @ 0x08049004
	push {r4, r5, lr}
	ldr r4, [sp, #0xc]
	ldr r5, [sp, #0x10]
	str r1, [r0, #0x34]
	str r2, [r0, #0x38]
	str r4, [r0, #0x3c]
	str r3, [r0, #0x40]
	str r5, [r0, #0x44]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_804901C
sub_804901C: @ 0x0804901C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	adds r5, r0, #0
	movs r0, #0x2c
	ldrsh r1, [r5, r0]
	movs r2, #0x2a
	ldrsh r0, [r5, r2]
	adds r1, r1, r0
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r7, r0, #2
	ldrh r0, [r5, #0x2c]
	strh r0, [r5, #0x2a]
	ldr r0, _0804908C @ =gUnk_08C09860
	mov r8, r0
	movs r6, #0x30
	movs r4, #2
_08049042:
	mov r1, r8
	adds r1, #4
	mov r8, r1
	subs r1, #4
	ldm r1!, {r3}
	movs r0, #0
	str r0, [sp]
	movs r0, #2
	movs r1, #0x20
	adds r2, r6, #0
	bl sub_8006884
	adds r6, #0x18
	subs r4, #1
	cmp r4, #0
	bge _08049042
	adds r1, r7, #0
	adds r1, #0x30
	movs r0, #0x20
	bl sub_804A7EC
	movs r2, #0x2e
	ldrsh r0, [r5, r2]
	movs r2, #0x30
	ldrsh r1, [r5, r2]
	bl DisplayUiHand
	movs r0, #0xc0
	movs r1, #0x10
	bl sub_804829C
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0804908C: .4byte gUnk_08C09860

	thumb_func_start sub_8049090
sub_8049090: @ 0x08049090
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r4, _080490B0 @ =gUnk_08C0986C
	adds r0, r4, #0
	bl sub_8004748
	adds r0, r4, #0
	adds r1, r5, #0
	bl Proc_Start
	movs r1, #0
	strh r1, [r0, #0x2a]
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_080490B0: .4byte gUnk_08C0986C

	thumb_func_start sub_80490B4
sub_80490B4: @ 0x080490B4
	strh r1, [r0, #0x2c]
	strh r2, [r0, #0x2e]
	strh r3, [r0, #0x30]
	bx lr

	thumb_func_start sub_80490BC
sub_80490BC: @ 0x080490BC
	push {lr}
	adds r1, r0, #0
	ldr r2, _080490E8 @ =gUnk_081CD998
	ldr r0, _080490EC @ =0x0203DCC0
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne _080490E2
	ldr r0, _080490F0 @ =gPal
	lsls r1, r1, #1
	adds r1, r1, r2
	ldrh r1, [r1]
	movs r2, #0xb7
	lsls r2, r2, #2
	adds r0, r0, r2
	strh r1, [r0]
	bl EnablePalSync
_080490E2:
	pop {r0}
	bx r0
	.align 2, 0
_080490E8: .4byte gUnk_081CD998
_080490EC: .4byte 0x0203DCC0
_080490F0: .4byte gPal

	thumb_func_start sub_80490F4
sub_80490F4: @ 0x080490F4
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	adds r7, r0, #0
	movs r0, #0x4c
	adds r0, r0, r7
	mov r8, r0
	movs r1, #0
	ldrsh r5, [r0, r1]
	lsls r4, r5, #1
	adds r0, r5, #0
	bl sub_80490BC
	ldr r0, _08049194 @ =gUnk_081DB358
	adds r4, #1
	lsls r4, r4, #1
	adds r4, r4, r0
	movs r1, #0
	ldrsh r6, [r4, r1]
	ldr r1, [r7, #0x2c]
	subs r1, r1, r6
	lsls r5, r5, #2
	adds r5, r5, r0
	movs r0, #0
	ldrsh r5, [r5, r0]
	ldr r2, [r7, #0x30]
	subs r2, r2, r5
	ldr r3, _08049198 @ =gUnk_081DB320
	movs r4, #0
	str r4, [sp]
	movs r0, #2
	bl sub_8006884
	ldr r1, [r7, #0x2c]
	adds r1, r1, r6
	adds r1, #0x10
	ldr r2, [r7, #0x30]
	subs r2, r2, r5
	ldr r3, _0804919C @ =gUnk_081DB32E
	str r4, [sp]
	movs r0, #2
	bl sub_8006884
	ldr r1, [r7, #0x2c]
	subs r1, r1, r6
	ldr r2, [r7, #0x30]
	adds r2, r2, r5
	ldr r3, _080491A0 @ =gUnk_081DB33C
	str r4, [sp]
	movs r0, #2
	bl sub_8006884
	ldr r1, [r7, #0x2c]
	adds r1, r1, r6
	adds r1, #0x10
	ldr r2, [r7, #0x30]
	adds r2, r2, r5
	ldr r3, _080491A4 @ =gUnk_081DB34A
	str r4, [sp]
	movs r0, #2
	bl sub_8006884
	mov r1, r8
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0xf
	bne _08049188
	adds r0, r7, #0
	bl Proc_Break
_08049188:
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08049194: .4byte gUnk_081DB358
_08049198: .4byte gUnk_081DB320
_0804919C: .4byte gUnk_081DB32E
_080491A0: .4byte gUnk_081DB33C
_080491A4: .4byte gUnk_081DB34A

	thumb_func_start sub_80491A8
sub_80491A8: @ 0x080491A8
	push {r4, r5, lr}
	adds r3, r0, #0
	adds r4, r1, #0
	adds r5, r2, #0
	ldr r0, _080491C8 @ =gUnk_08C09884
	adds r1, r3, #0
	bl Proc_Start
	str r4, [r0, #0x2c]
	str r5, [r0, #0x30]
	adds r0, #0x4c
	movs r1, #0
	strh r1, [r0]
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_080491C8: .4byte gUnk_08C09884

	thumb_func_start sub_80491CC
sub_80491CC: @ 0x080491CC
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	adds r0, #0x45
	movs r1, #0
	strb r1, [r0]
	subs r0, #1
	strb r1, [r0]
	subs r0, #7
	ldr r4, [r6, #0x34]
	ldrb r0, [r0]
	muls r0, r4, r0
	lsls r0, r0, #3
	adds r5, r6, #0
	adds r5, #0x3c
	ldrb r1, [r5]
	bl __divsi3
	str r0, [r6, #0x38]
	lsls r4, r4, #0xb
	ldrb r5, [r5]
	lsls r1, r5, #4
	adds r0, r4, #0
	bl __divsi3
	adds r1, r6, #0
	adds r1, #0x42
	strh r0, [r1]
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	thumb_func_start sub_8049208
sub_8049208: @ 0x08049208
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x30
	adds r7, r0, #0
	ldr r0, [r7, #0x2c]
	mov r8, r0
	ldr r1, [r7, #0x30]
	str r1, [sp, #0xc]
	adds r1, #8
	mov sl, r1
	ldr r0, [r7, #0x38]
	asrs r2, r0, #3
	str r2, [sp, #0x10]
	movs r1, #7
	ands r0, r1
	movs r1, #8
	subs r0, r1, r0
	str r0, [sp, #0x14]
	movs r3, #0x3e
	ldrsh r0, [r7, r3]
	adds r1, r7, #0
	adds r1, #0x42
	ldrh r1, [r1]
	muls r0, r1, r0
	asrs r0, r0, #8
	str r0, [sp, #0x18]
	movs r0, #0x3c
	adds r0, r0, r7
	mov ip, r0
	movs r1, #0x3d
	adds r1, r1, r7
	mov sb, r1
	ldrb r2, [r0]
	ldrb r3, [r1]
	cmp r2, r3
	bhi _08049258
	b _080493B0
_08049258:
	adds r5, r7, #0
	adds r5, #0x44
	ldrb r0, [r5]
	adds r0, #1
	strb r0, [r5]
	adds r4, r7, #0
	adds r4, #0x45
	ldrb r0, [r4]
	adds r0, #1
	strb r0, [r4]
	adds r0, r7, #0
	adds r0, #0x40
	movs r1, #0x3e
	ldrsh r2, [r7, r1]
	movs r3, #0
	ldrsh r1, [r0, r3]
	adds r3, r5, #0
	str r0, [sp, #0x2c]
	cmp r2, r1
	bge _08049286
	ldrb r0, [r3]
	adds r0, #2
	strb r0, [r3]
_08049286:
	movs r0, #0x3e
	ldrsh r1, [r7, r0]
	ldr r2, [sp, #0x2c]
	movs r3, #0
	ldrsh r0, [r2, r3]
	cmp r1, r0
	ble _0804929A
	ldrb r0, [r4]
	adds r0, #2
	strb r0, [r4]
_0804929A:
	movs r6, #0
	mov r0, ip
	str r0, [sp, #0x28]
	ldr r1, [sp, #0x18]
	add r1, sl
	str r1, [sp, #0x1c]
	ldr r2, [sp, #0x10]
	lsls r2, r2, #3
	str r2, [sp, #0x24]
	ldr r3, [sp, #0xc]
	str r3, [sp, #0x20]
_080492B0:
	ldrb r0, [r5]
	cmp r0, #0x30
	bls _080492BA
	movs r0, #0
	strb r0, [r5]
_080492BA:
	lsls r4, r6, #2
	add r4, sp
	adds r4, #4
	ldrb r1, [r5]
	lsrs r0, r1, #3
	movs r1, #6
	bl __umodsi3
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [r4]
	adds r5, #1
	adds r6, #1
	cmp r6, #1
	ble _080492B0
	movs r2, #0x3e
	ldrsh r0, [r7, r2]
	cmp r0, #0
	beq _080492F2
	mov r2, sl
	subs r2, #9
	ldr r3, _080493C0 @ =gUnk_08C098A4
	ldr r0, [sp, #4]
	str r0, [sp]
	movs r0, #3
	mov r1, r8
	bl sub_8006884
_080492F2:
	movs r3, #0x3e
	ldrsh r0, [r7, r3]
	cmp r0, #0
	bge _080492FC
	adds r0, #0xf
_080492FC:
	asrs r0, r0, #4
	mov r1, sb
	ldrb r1, [r1]
	adds r0, r1, r0
	ldr r2, [sp, #0x28]
	ldrb r2, [r2]
	cmp r0, r2
	bge _08049322
	ldr r2, [r7, #0x34]
	lsls r2, r2, #3
	add r2, sl
	adds r2, #1
	ldr r3, _080493C4 @ =gUnk_08C0989C
	ldr r0, [sp, #8]
	str r0, [sp]
	movs r0, #3
	mov r1, r8
	bl sub_8006884
_08049322:
	movs r6, #0
	ldr r0, [r7, #0x34]
	cmp r6, r0
	bge _08049346
	mov r4, sl
	movs r5, #1
_0804932E:
	str r5, [sp]
	movs r0, #2
	mov r1, r8
	adds r2, r4, #0
	ldr r3, _080493C8 @ =gUnk_08C098AC
	bl sub_8006884
	adds r4, #8
	adds r6, #1
	ldr r0, [r7, #0x34]
	cmp r6, r0
	blt _0804932E
_08049346:
	ldr r3, [sp, #0x10]
	cmp r3, #0
	ble _08049368
	ldr r4, [sp, #0x1c]
	movs r5, #0
	adds r6, r3, #0
_08049352:
	str r5, [sp]
	movs r0, #2
	mov r1, r8
	adds r2, r4, #0
	ldr r3, _080493C8 @ =gUnk_08C098AC
	bl sub_8006884
	adds r4, #8
	subs r6, #1
	cmp r6, #0
	bne _08049352
_08049368:
	ldr r0, [sp, #0x1c]
	ldr r1, [sp, #0x24]
	adds r2, r0, r1
	ldr r3, [sp, #0x14]
	subs r2, r2, r3
	ldr r4, _080493C8 @ =gUnk_08C098AC
	movs r0, #0
	str r0, [sp]
	movs r0, #2
	mov r1, r8
	adds r3, r4, #0
	bl sub_8006884
	movs r5, #2
	str r5, [sp]
	movs r0, #2
	mov r1, r8
	ldr r2, [sp, #0x20]
	adds r3, r4, #0
	bl sub_8006884
	movs r1, #0x80
	lsls r1, r1, #6
	add r1, r8
	ldr r2, [r7, #0x34]
	lsls r2, r2, #3
	add r2, sl
	subs r2, #7
	str r5, [sp]
	movs r0, #2
	adds r3, r4, #0
	bl sub_8006884
	ldrh r0, [r7, #0x3e]
	ldr r1, [sp, #0x2c]
	strh r0, [r1]
_080493B0:
	add sp, #0x30
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080493C0: .4byte gUnk_08C098A4
_080493C4: .4byte gUnk_08C0989C
_080493C8: .4byte gUnk_08C098AC

	thumb_func_start sub_80493CC
sub_80493CC: @ 0x080493CC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	mov sb, r0
	mov sl, r1
	mov r8, r2
	adds r5, r3, #0
	ldr r6, [sp, #0x20]
	ldr r7, [sp, #0x24]
	mov r0, r8
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r8, r0
	lsls r5, r5, #0x18
	lsrs r5, r5, #0x18
	lsls r6, r6, #0x18
	lsrs r6, r6, #0x18
	ldr r4, _08049434 @ =gUnk_08C098B4
	adds r0, r4, #0
	bl sub_8004748
	adds r0, r4, #0
	adds r1, r7, #0
	bl Proc_Start
	adds r1, r0, #0
	mov r2, sb
	str r2, [r1, #0x2c]
	mov r0, sl
	str r0, [r1, #0x30]
	lsls r0, r5, #1
	subs r0, #2
	str r0, [r1, #0x34]
	adds r0, r1, #0
	adds r0, #0x3c
	mov r2, r8
	strb r2, [r0]
	adds r0, #1
	strb r5, [r0]
	strh r6, [r1, #0x3e]
	adds r0, #3
	strh r6, [r0]
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08049434: .4byte gUnk_08C098B4

	thumb_func_start sub_8049438
sub_8049438: @ 0x08049438
	push {r4, r5, r6, r7, lr}
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	lsls r1, r1, #0x10
	lsrs r4, r1, #0x10
	ldr r0, _0804948C @ =gUnk_08C098B4
	bl Proc_Find
	adds r6, r0, #0
	cmp r6, #0
	beq _08049484
	adds r5, r6, #0
	adds r5, #0x3c
	strb r7, [r5]
	lsls r0, r4, #0x10
	asrs r0, r0, #0x10
	movs r1, #0xff
	ands r0, r1
	strh r0, [r6, #0x3e]
	adds r0, r6, #0
	adds r0, #0x3d
	ldr r4, [r6, #0x34]
	ldrb r0, [r0]
	muls r0, r4, r0
	lsls r0, r0, #3
	ldrb r1, [r5]
	bl __divsi3
	str r0, [r6, #0x38]
	lsls r4, r4, #0xb
	ldrb r5, [r5]
	lsls r1, r5, #4
	adds r0, r4, #0
	bl __divsi3
	adds r1, r6, #0
	adds r1, #0x42
	strh r0, [r1]
_08049484:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0804948C: .4byte gUnk_08C098B4

	thumb_func_start sub_8049490
sub_8049490: @ 0x08049490
	push {lr}
	ldr r0, _080494AC @ =gUnk_081CF61C
	ldr r1, _080494B0 @ =0x06002000
	bl Decompress
	ldr r0, _080494B4 @ =gPlaySt
	ldrb r0, [r0, #0xf]
	cmp r0, #1
	beq _080494DC
	cmp r0, #1
	bgt _080494B8
	cmp r0, #0
	beq _080494C2
	b _08049526
	.align 2, 0
_080494AC: .4byte gUnk_081CF61C
_080494B0: .4byte 0x06002000
_080494B4: .4byte gPlaySt
_080494B8:
	cmp r0, #2
	beq _080494F4
	cmp r0, #3
	beq _08049514
	b _08049526
_080494C2:
	ldr r0, _080494D0 @ =gUnk_081CE348
	ldr r1, _080494D4 @ =0x06002800
	bl Decompress
	ldr r0, _080494D8 @ =gUnk_081CF77C
	b _080494FE
	.align 2, 0
_080494D0: .4byte gUnk_081CE348
_080494D4: .4byte 0x06002800
_080494D8: .4byte gUnk_081CF77C
_080494DC:
	ldr r0, _080494E8 @ =gUnk_081CE7F8
	ldr r1, _080494EC @ =0x06002800
	bl Decompress
	ldr r0, _080494F0 @ =gUnk_081CF7BC
	b _080494FE
	.align 2, 0
_080494E8: .4byte gUnk_081CE7F8
_080494EC: .4byte 0x06002800
_080494F0: .4byte gUnk_081CF7BC
_080494F4:
	ldr r0, _08049508 @ =gUnk_081CECB8
	ldr r1, _0804950C @ =0x06002800
	bl Decompress
	ldr r0, _08049510 @ =gUnk_081CF79C
_080494FE:
	movs r1, #0xa0
	movs r2, #0x20
	bl ApplyPaletteExt
	b _08049526
	.align 2, 0
_08049508: .4byte gUnk_081CECB8
_0804950C: .4byte 0x06002800
_08049510: .4byte gUnk_081CF79C
_08049514:
	ldr r0, _08049538 @ =gUnk_081CF168
	ldr r1, _0804953C @ =0x06002800
	bl Decompress
	ldr r0, _08049540 @ =gUnk_081CF7DC
	movs r1, #0xa0
	movs r2, #0x20
	bl ApplyPaletteExt
_08049526:
	ldr r2, _08049544 @ =0x03001448
	ldr r1, _08049548 @ =gPlaySt
	ldrb r0, [r1, #0xf]
	str r0, [r2]
	movs r0, #0
	strb r0, [r1, #0xf]
	pop {r0}
	bx r0
	.align 2, 0
_08049538: .4byte gUnk_081CF168
_0804953C: .4byte 0x06002800
_08049540: .4byte gUnk_081CF7DC
_08049544: .4byte 0x03001448
_08049548: .4byte gPlaySt

	thumb_func_start sub_804954C
sub_804954C: @ 0x0804954C
	push {r4, lr}
	ldr r1, _080495BC @ =gPlaySt
	ldr r0, _080495C0 @ =0x03001448
	ldr r0, [r0]
	movs r2, #0
	strb r0, [r1, #0xf]
	ldr r3, _080495C4 @ =gDispIo
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
	adds r1, r3, #0
	adds r1, #0x3c
	movs r0, #0x3f
	ldrb r4, [r1]
	ands r0, r4
	strb r0, [r1]
	adds r1, #8
	movs r0, #0x10
	strb r0, [r1]
	adds r0, r3, #0
	adds r0, #0x45
	strb r2, [r0]
	adds r0, #1
	strb r2, [r0]
	movs r1, #4
	rsbs r1, r1, #0
	adds r0, r1, #0
	ldrb r2, [r3, #0xc]
	ands r0, r2
	strb r0, [r3, #0xc]
	adds r0, r1, #0
	ldrb r4, [r3, #0x10]
	ands r0, r4
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
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080495BC: .4byte gPlaySt
_080495C0: .4byte 0x03001448
_080495C4: .4byte gDispIo

	thumb_func_start sub_80495C8
sub_80495C8: @ 0x080495C8
	push {lr}
	ldr r1, _080495D8 @ =0x03005C40
	movs r0, #0x49
	bl sub_800376C
	pop {r0}
	bx r0
	.align 2, 0
_080495D8: .4byte 0x03005C40

	thumb_func_start sub_80495DC
sub_80495DC: @ 0x080495DC
	lsls r1, r1, #1
	adds r0, #0x1e
	adds r2, r0, r1
	ldrh r1, [r2]
	cmp r1, #0
	beq _080495F2
	movs r3, #0xff
	lsls r3, r3, #8
	adds r0, r3, #0
	orrs r1, r0
	strh r1, [r2]
_080495F2:
	bx lr

	thumb_func_start sub_80495F4
sub_80495F4: @ 0x080495F4
	push {r4, r5, lr}
	adds r5, r0, #0
	movs r4, #0
_080495FA:
	adds r0, r5, #0
	adds r1, r4, #0
	bl sub_80495DC
	adds r4, #1
	cmp r4, #4
	ble _080495FA
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_8049610
sub_8049610: @ 0x08049610
	push {r4, r5, r6, lr}
	ldr r5, _08049654 @ =gUnk_081CD978
	ldr r0, _08049658 @ =0x0203DCC0
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne _0804964E
	bl GetGameTime
	adds r2, r0, #0
	movs r0, #0x1f
	ands r2, r0
	asrs r2, r2, #1
	movs r1, #0
	ldr r0, _0804965C @ =gPal
	movs r4, #0xf
	ldr r6, _08049660 @ =0x00000322
	adds r3, r0, r6
_08049636:
	adds r0, r2, r1
	ands r0, r4
	lsls r0, r0, #1
	adds r0, r0, r5
	ldrh r0, [r0]
	strh r0, [r3]
	adds r3, #2
	adds r1, #1
	cmp r1, #0xe
	ble _08049636
	bl EnablePalSync
_0804964E:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08049654: .4byte gUnk_081CD978
_08049658: .4byte 0x0203DCC0
_0804965C: .4byte gPal
_08049660: .4byte 0x00000322

	thumb_func_start sub_8049664
sub_8049664: @ 0x08049664
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	adds r7, r0, #0
	movs r0, #0
	mov sb, r0
	movs r1, #0
	str r1, [sp, #4]
	mov sl, r1
_0804967C:
	ldr r1, [r7, #0x2c]
	ldr r2, [r7, #0x30]
	ldr r3, [sp, #4]
	adds r2, r2, r3
	movs r0, #0xf
	mov r4, sb
	ands r0, r4
	lsls r0, r0, #0xc
	movs r3, #0x80
	lsls r3, r3, #4
	adds r0, r0, r3
	str r0, [sp]
	movs r0, #4
	ldr r3, _08049830 @ =gUnk_081DB272
	bl sub_8006884
	ldr r4, _08049834 @ =gCosLut
	movs r1, #0
	ldrsh r0, [r4, r1]
	lsls r0, r0, #4
	movs r1, #0x80
	lsls r1, r1, #1
	bl Div
	adds r6, r0, #0
	lsls r6, r6, #0x10
	asrs r6, r6, #0x10
	ldr r2, _08049838 @ =gSinLut
	movs r3, #0
	ldrsh r0, [r2, r3]
	rsbs r0, r0, #0
	lsls r0, r0, #4
	movs r1, #0x80
	lsls r1, r1, #1
	bl Div
	adds r5, r0, #0
	lsls r5, r5, #0x10
	asrs r5, r5, #0x10
	ldr r4, _08049838 @ =gSinLut
	movs r1, #0
	ldrsh r0, [r4, r1]
	lsls r0, r0, #4
	movs r1, #0x80
	lsls r1, r1, #1
	bl Div
	adds r4, r0, #0
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	ldr r2, _08049834 @ =gCosLut
	movs r3, #0
	ldrsh r0, [r2, r3]
	lsls r0, r0, #4
	movs r1, #0x80
	lsls r1, r1, #1
	bl Div
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	str r0, [sp]
	mov r0, sb
	adds r1, r6, #0
	adds r2, r5, #0
	adds r3, r4, #0
	bl SetObjAffine
	ldr r1, [r7, #0x38]
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	beq _080497A6
	adds r3, r7, #0
	adds r3, #0x3c
	cmp r1, sb
	beq _0804972C
	mov r4, sl
	adds r1, r3, r4
	ldrh r0, [r1]
	movs r2, #0x80
	lsls r2, r2, #1
	cmp r0, r2
	bls _08049726
	subs r0, #8
	strh r0, [r1]
_08049726:
	ldr r0, [r7, #0x38]
	cmp r0, sb
	bne _0804973E
_0804972C:
	mov r4, sl
	adds r2, r3, r4
	ldrh r1, [r2]
	ldr r0, _0804983C @ =0x0000014F
	cmp r1, r0
	bhi _0804973E
	adds r0, r1, #0
	adds r0, #8
	strh r0, [r2]
_0804973E:
	ldr r1, _08049834 @ =gCosLut
	movs r2, #0
	ldrsh r0, [r1, r2]
	lsls r0, r0, #4
	add r3, sl
	mov r8, r3
	ldrh r1, [r3]
	bl Div
	adds r6, r0, #0
	lsls r6, r6, #0x10
	asrs r6, r6, #0x10
	ldr r3, _08049838 @ =gSinLut
	movs r4, #0
	ldrsh r0, [r3, r4]
	rsbs r0, r0, #0
	lsls r0, r0, #4
	mov r2, r8
	ldrh r1, [r2]
	bl Div
	adds r5, r0, #0
	lsls r5, r5, #0x10
	asrs r5, r5, #0x10
	ldr r3, _08049838 @ =gSinLut
	movs r4, #0
	ldrsh r0, [r3, r4]
	lsls r0, r0, #4
	mov r2, r8
	ldrh r1, [r2]
	bl Div
	adds r4, r0, #0
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	ldr r3, _08049834 @ =gCosLut
	movs r1, #0
	ldrsh r0, [r3, r1]
	lsls r0, r0, #4
	mov r2, r8
	ldrh r1, [r2]
	bl Div
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	str r0, [sp]
	mov r0, sb
	adds r1, r6, #0
	adds r2, r5, #0
	adds r3, r4, #0
	bl SetObjAffine
_080497A6:
	ldr r1, [r7, #0x2c]
	subs r1, #0x30
	ldr r2, [r7, #0x30]
	ldr r3, [sp, #4]
	adds r2, r2, r3
	ldr r3, _08049840 @ =gUnk_08C09924
	mov r4, sb
	lsls r0, r4, #2
	adds r0, r0, r3
	ldr r3, [r0]
	movs r4, #0
	str r4, [sp]
	movs r0, #4
	bl sub_8006884
	ldr r0, [sp, #4]
	adds r0, #0x18
	str r0, [sp, #4]
	movs r1, #2
	add sl, r1
	movs r2, #1
	add sb, r2
	mov r3, sb
	cmp r3, #3
	bgt _080497DA
	b _0804967C
_080497DA:
	ldr r2, [r7, #0x34]
	movs r0, #1
	rsbs r0, r0, #0
	cmp r2, r0
	beq _0804981E
	ldr r1, [r7, #0x2c]
	subs r1, #0x40
	lsls r0, r2, #1
	adds r0, r0, r2
	lsls r0, r0, #3
	ldr r2, [r7, #0x30]
	adds r2, r2, r0
	adds r2, #8
	ldr r3, _08049844 @ =gUnk_081DB3B8
	str r4, [sp]
	movs r0, #4
	bl sub_8006884
	ldr r1, [r7, #0x2c]
	subs r1, #0x40
	ldr r2, [r7, #0x34]
	lsls r0, r2, #1
	adds r0, r0, r2
	lsls r0, r0, #3
	ldr r2, [r7, #0x30]
	adds r2, r2, r0
	adds r2, #0x12
	ldr r3, _08049848 @ =gUnk_081DB3C0
	str r4, [sp]
	movs r0, #4
	bl sub_8006884
	bl sub_8049610
_0804981E:
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08049830: .4byte gUnk_081DB272
_08049834: .4byte gCosLut
_08049838: .4byte gSinLut
_0804983C: .4byte 0x0000014F
_08049840: .4byte gUnk_08C09924
_08049844: .4byte gUnk_081DB3B8
_08049848: .4byte gUnk_081DB3C0

	thumb_func_start sub_804984C
sub_804984C: @ 0x0804984C
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	adds r6, r0, #0
	mov r8, r1
	adds r5, r2, #0
	ldr r4, _08049898 @ =gUnk_08C09934
	adds r0, r4, #0
	bl sub_8004748
	adds r0, r4, #0
	adds r1, r5, #0
	bl Proc_Start
	adds r1, r0, #0
	str r6, [r1, #0x2c]
	mov r0, r8
	str r0, [r1, #0x30]
	movs r0, #1
	rsbs r0, r0, #0
	str r0, [r1, #0x34]
	str r0, [r1, #0x38]
	movs r3, #0x80
	lsls r3, r3, #1
	movs r2, #3
	adds r0, r1, #0
	adds r0, #0x42
_08049882:
	strh r3, [r0]
	subs r0, #2
	subs r2, #1
	cmp r2, #0
	bge _08049882
	adds r0, r1, #0
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_08049898: .4byte gUnk_08C09934

	thumb_func_start sub_804989C
sub_804989C: @ 0x0804989C
	push {lr}
	ldr r0, _080498A8 @ =gUnk_08C09934
	bl sub_8004748
	pop {r0}
	bx r0
	.align 2, 0
_080498A8: .4byte gUnk_08C09934

	thumb_func_start sub_80498AC
sub_80498AC: @ 0x080498AC
	push {lr}
	ldr r0, _080498B8 @ =gUnk_08C09934
	bl Proc_Find
	pop {r1}
	bx r1
	.align 2, 0
_080498B8: .4byte gUnk_08C09934

	thumb_func_start sub_80498BC
sub_80498BC: @ 0x080498BC
	push {r4, r5, lr}
	ldr r5, _08049900 @ =gUnk_081CD978
	ldr r0, _08049904 @ =0x0203DCC0
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne _080498FA
	bl GetGameTime
	adds r2, r0, #0
	movs r0, #0x1f
	ands r2, r0
	asrs r2, r2, #1
	movs r1, #0
	ldr r0, _08049908 @ =gPal
	movs r4, #0xf
	adds r3, r0, #0
	adds r3, #0x42
_080498E2:
	adds r0, r2, r1
	ands r0, r4
	lsls r0, r0, #1
	adds r0, r0, r5
	ldrh r0, [r0]
	strh r0, [r3]
	adds r3, #2
	adds r1, #1
	cmp r1, #0xe
	ble _080498E2
	bl EnablePalSync
_080498FA:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08049900: .4byte gUnk_081CD978
_08049904: .4byte 0x0203DCC0
_08049908: .4byte gPal

	thumb_func_start sub_804990C
sub_804990C: @ 0x0804990C
	push {r4, r5, r6, lr}
	ldr r5, _08049950 @ =gUnk_081CD978
	ldr r0, _08049954 @ =0x0203DCC0
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne _0804994A
	bl GetGameTime
	adds r2, r0, #0
	movs r0, #0x1f
	ands r2, r0
	asrs r2, r2, #1
	movs r1, #0
	ldr r0, _08049958 @ =gPal
	movs r4, #0xf
	ldr r6, _0804995C @ =0x00000262
	adds r3, r0, r6
_08049932:
	adds r0, r2, r1
	ands r0, r4
	lsls r0, r0, #1
	adds r0, r0, r5
	ldrh r0, [r0]
	strh r0, [r3]
	adds r3, #2
	adds r1, #1
	cmp r1, #0xe
	ble _08049932
	bl EnablePalSync
_0804994A:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08049950: .4byte gUnk_081CD978
_08049954: .4byte 0x0203DCC0
_08049958: .4byte gPal
_0804995C: .4byte 0x00000262

	thumb_func_start sub_8049960
sub_8049960: @ 0x08049960
	ldr r3, _080499A0 @ =gDispIo
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
	movs r2, #0
	movs r0, #8
	strb r0, [r1]
	adds r1, #1
	movs r0, #0xc
	strb r0, [r1]
	adds r0, r3, #0
	adds r0, #0x46
	strb r2, [r0]
	ldr r0, _080499A4 @ =0x0000FFE0
	ldrh r2, [r3, #0x3c]
	ands r0, r2
	ldr r1, _080499A8 @ =0x0000E0FF
	ands r0, r1
	movs r2, #0xe0
	lsls r2, r2, #4
	adds r1, r2, #0
	orrs r0, r1
	strh r0, [r3, #0x3c]
	bx lr
	.align 2, 0
_080499A0: .4byte gDispIo
_080499A4: .4byte 0x0000FFE0
_080499A8: .4byte 0x0000E0FF

	thumb_func_start sub_80499AC
sub_80499AC: @ 0x080499AC
	push {lr}
	sub sp, #4
	adds r1, r0, #0
	ldr r2, [r1, #0x30]
	adds r0, r2, #0
	subs r0, #0x1f
	cmp r0, #0x79
	bhi _080499CE
	ldr r1, [r1, #0x2c]
	ldr r3, _080499D4 @ =gUnk_081DB3CE
	movs r0, #0
	str r0, [sp]
	movs r0, #4
	bl sub_8006884
	bl sub_804990C
_080499CE:
	add sp, #4
	pop {r0}
	bx r0
	.align 2, 0
_080499D4: .4byte gUnk_081DB3CE

	thumb_func_start sub_80499D8
sub_80499D8: @ 0x080499D8
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	adds r6, r0, #0
	mov r8, r1
	adds r5, r2, #0
	ldr r4, _08049A04 @ =gUnk_08C09944
	adds r0, r4, #0
	bl sub_8004748
	adds r0, r4, #0
	adds r1, r5, #0
	bl Proc_Start
	str r6, [r0, #0x2c]
	mov r1, r8
	str r1, [r0, #0x30]
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_08049A04: .4byte gUnk_08C09944

	thumb_func_start sub_8049A08
sub_8049A08: @ 0x08049A08
	push {r4, lr}
	ldr r0, _08049A34 @ =gUnk_0842FF00
	ldr r4, _08049A38 @ =0x0200118C
	adds r1, r4, #0
	bl Decompress
	ldr r1, _08049A3C @ =0x06016800
	adds r0, r4, #0
	movs r2, #6
	movs r3, #4
	bl sub_80484A4
	ldr r0, _08049A40 @ =gUnk_08432594
	movs r1, #0x90
	lsls r1, r1, #2
	movs r2, #0x20
	bl ApplyPaletteExt
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08049A34: .4byte gUnk_0842FF00
_08049A38: .4byte 0x0200118C
_08049A3C: .4byte 0x06016800
_08049A40: .4byte gUnk_08432594

	thumb_func_start sub_8049A44
sub_8049A44: @ 0x08049A44
	push {r4, lr}
	sub sp, #4
	adds r4, r0, #0
	adds r2, r1, #0
	ldr r3, _08049A64 @ =gUnk_081DB400
	movs r0, #0
	str r0, [sp]
	movs r0, #1
	adds r1, r4, #0
	bl sub_8006884
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08049A64: .4byte gUnk_081DB400

	thumb_func_start sub_8049A68
sub_8049A68: @ 0x08049A68
	push {r4, r5, lr}
	ldr r5, _08049A94 @ =gActiveUnit
	ldr r0, [r5]
	lsls r1, r1, #1
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r4, [r0]
	adds r0, r4, #0
	bl GetItemAttributes
	movs r1, #1
	ands r1, r0
	cmp r1, #0
	beq _08049AAA
	adds r0, r4, #0
	bl sub_8017774
	cmp r0, #2
	ble _08049A98
	movs r0, #2
	b _08049AAC
	.align 2, 0
_08049A94: .4byte gActiveUnit
_08049A98:
	ldr r0, [r5]
	adds r1, r4, #0
	bl CanUnitUseWeapon
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08049AAA
	movs r0, #1
	b _08049AAC
_08049AAA:
	movs r0, #3
_08049AAC:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_8049AB4
sub_8049AB4: @ 0x08049AB4
	adds r0, r1, #0
	adds r0, #0x3d
	ldrb r0, [r0]
	cmp r0, #2
	beq _08049AD0
	ldr r0, _08049ACC @ =0x0203DC74
	adds r1, #0x3c
	ldrb r1, [r1]
	strb r1, [r0, #7]
	movs r0, #0x84
	b _08049AD2
	.align 2, 0
_08049ACC: .4byte 0x0203DC74
_08049AD0:
	movs r0, #8
_08049AD2:
	bx lr

	thumb_func_start sub_8049AD4
sub_8049AD4: @ 0x08049AD4
	ldr r2, _08049AE4 @ =0x0203DC74
	adds r1, #0x3c
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r2, #6]
	movs r0, #0x17
	bx lr
	.align 2, 0
_08049AE4: .4byte 0x0203DC74

	thumb_func_start sub_8049AE8
sub_8049AE8: @ 0x08049AE8
	push {r4, r5, r6, lr}
	adds r4, r1, #0
	ldr r0, _08049B44 @ =gActiveUnit
	ldr r0, [r0]
	adds r1, #0x3c
	movs r2, #0
	ldrsb r2, [r1, r2]
	lsls r2, r2, #1
	adds r1, r0, #0
	adds r1, #0x1e
	adds r1, r1, r2
	ldrh r6, [r1]
	adds r1, r6, #0
	bl CanUnitUseWeapon
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	adds r0, r6, #0
	bl sub_8017774
	cmp r0, #2
	ble _08049B16
	movs r5, #0
_08049B16:
	adds r0, r4, #0
	adds r0, #0x34
	lsls r2, r5, #0x18
	asrs r2, r2, #0x18
	movs r1, #0x2c
	ldrsh r3, [r4, r1]
	lsls r3, r3, #5
	movs r5, #0x2a
	ldrsh r1, [r4, r5]
	adds r3, r3, r1
	lsls r3, r3, #1
	ldr r1, _08049B48 @ =gBg0Tm
	adds r3, r3, r1
	adds r1, r6, #0
	bl sub_80168EC
	movs r0, #1
	bl EnableBgSync
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_08049B44: .4byte gActiveUnit
_08049B48: .4byte gBg0Tm

	thumb_func_start sub_8049B4C
sub_8049B4C: @ 0x08049B4C
	ldr r1, _08049B58 @ =0x0203DC74
	movs r0, #0
	strb r0, [r1, #6]
	movs r0, #0x1b
	bx lr
	.align 2, 0
_08049B58: .4byte 0x0203DC74

	thumb_func_start sub_8049B5C
sub_8049B5C: @ 0x08049B5C
	push {r4, r5, r6, r7, lr}
	adds r2, r0, #0
	ldr r1, _08049BC4 @ =0x0203DC74
	movs r0, #0
	strb r0, [r1, #6]
	adds r7, r2, #0
	adds r7, #0x2d
	movs r0, #0
	ldrsb r0, [r7, r0]
	lsls r0, r0, #5
	adds r5, r2, #0
	adds r5, #0x2c
	movs r1, #0
	ldrsb r1, [r5, r1]
	adds r0, r0, r1
	lsls r0, r0, #1
	ldr r1, _08049BC8 @ =gBg0Tm
	adds r0, r0, r1
	adds r6, r2, #0
	adds r6, #0x2e
	movs r1, #0
	ldrsb r1, [r6, r1]
	adds r4, r2, #0
	adds r4, #0x2f
	movs r2, #0
	ldrsb r2, [r4, r2]
	movs r3, #0
	bl TmFillRect_thm
	movs r0, #0
	ldrsb r0, [r7, r0]
	lsls r0, r0, #5
	movs r1, #0
	ldrsb r1, [r5, r1]
	adds r0, r0, r1
	lsls r0, r0, #1
	ldr r1, _08049BCC @ =gBg1Tm
	adds r0, r0, r1
	movs r1, #0
	ldrsb r1, [r6, r1]
	movs r2, #0
	ldrsb r2, [r4, r2]
	movs r3, #0
	bl TmFillRect_thm
	movs r0, #3
	bl EnableBgSync
	movs r0, #0xb
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_08049BC4: .4byte 0x0203DC74
_08049BC8: .4byte gBg0Tm
_08049BCC: .4byte gBg1Tm

	thumb_func_start sub_8049BD0
sub_8049BD0: @ 0x08049BD0
	adds r2, r0, #0
	movs r1, #0
	strb r1, [r2, #0x1e]
	strb r1, [r2, #0x18]
	strb r1, [r2, #0x1d]
	adds r3, r2, #0
	adds r3, #0x4a
	movs r0, #0xf
	strb r0, [r3]
	adds r0, r2, #0
	adds r0, #0x48
	strb r1, [r0]
	strh r1, [r2, #0x16]
	ldr r0, _08049BFC @ =0x04000134
	strh r1, [r0]
	ldr r2, _08049C00 @ =0x04000128
	ldr r3, _08049C04 @ =0x00002003
	adds r0, r3, #0
	strh r0, [r2]
	ldr r0, _08049C08 @ =0x0400012A
	strh r1, [r0]
	bx lr
	.align 2, 0
_08049BFC: .4byte 0x04000134
_08049C00: .4byte 0x04000128
_08049C04: .4byte 0x00002003
_08049C08: .4byte 0x0400012A

	thumb_func_start sub_8049C0C
sub_8049C0C: @ 0x08049C0C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	adds r6, r0, #0
	bl sub_804A12C
	cmp r0, #0
	beq _08049C22
	b _08049FE8
_08049C22:
	adds r0, r6, #0
	adds r0, #0x4a
	ldrb r1, [r0]
	mov sl, r0
	cmp r1, #0xf
	bls _08049C36
	subs r0, r1, #1
	mov r1, sl
	strb r0, [r1]
	b _08049FE8
_08049C36:
	adds r1, r6, #0
	adds r1, #0x48
	ldrb r0, [r1]
	cmp r0, #0
	beq _08049C60
	movs r0, #0
	strb r0, [r1]
	ldr r0, _08049C5C @ =0x04000128
	ldrh r0, [r0]
	movs r4, #0xfc
	ands r4, r0
	cmp r4, #8
	beq _08049C60
	adds r0, r6, #0
	bl sub_8049BD0
	movs r0, #8
	eors r0, r4
	b _08049FEA
	.align 2, 0
_08049C5C: .4byte 0x04000128
_08049C60:
	ldrb r2, [r6, #0x18]
	cmp r2, #0xdf
	bls _08049CB2
	adds r0, r6, #0
	bl sub_804A13C
	adds r4, r0, #0
	cmp r4, #0
	beq _08049C74
	b _08049FEA
_08049C74:
	adds r0, r6, #0
	adds r0, #0x4b
	ldrb r0, [r0]
	cmp r0, #1
	bne _08049C90
	ldrb r0, [r6, #0x18]
	cmp r0, #0xe1
	bls _08049C90
	adds r0, r6, #0
	bl sub_804A12C
	cmp r0, #0
	bne _08049C90
	b _08049FD8
_08049C90:
	adds r0, r6, #0
	bl sub_804A12C
	cmp r0, #0
	beq _08049C9C
	b _08049FE8
_08049C9C:
	ldrh r0, [r6, #0x16]
	cmp r0, #0
	bne _08049CAC
	adds r0, r6, #0
	bl sub_8049BD0
	movs r0, #0x71
	b _08049FEA
_08049CAC:
	subs r0, #1
	strh r0, [r6, #0x16]
	b _08049FE8
_08049CB2:
	ldrb r0, [r6, #0x18]
	cmp r0, #2
	bne _08049CBA
	b _08049DF0
_08049CBA:
	cmp r0, #2
	bgt _08049CC8
	cmp r0, #0
	beq _08049CD6
	cmp r0, #1
	beq _08049D94
	b _08049F2C
_08049CC8:
	cmp r0, #0xd0
	bne _08049CCE
	b _08049E3C
_08049CCE:
	cmp r0, #0xd1
	bne _08049CD4
	b _08049ED8
_08049CD4:
	b _08049F2C
_08049CD6:
	movs r5, #0xe
	movs r4, #3
	ldr r0, _08049D1C @ =0x04000120
	ldrh r0, [r0, #6]
	adds r1, r0, #0
	ldr r0, _08049D20 @ =0x0000FFFF
	ldrb r2, [r6, #0x1e]
	adds r7, r2, #0
	cmp r1, r0
	bne _08049CFE
	adds r3, r1, #0
	ldr r1, _08049D24 @ =0x04000126
_08049CEE:
	asrs r5, r5, #1
	subs r1, #2
	subs r4, #1
	cmp r4, #0
	beq _08049CFE
	ldrh r0, [r1]
	cmp r0, r3
	beq _08049CEE
_08049CFE:
	movs r0, #0xe
	ands r5, r0
	strb r5, [r6, #0x1d]
	movs r4, #3
	ldr r0, _08049D1C @ =0x04000120
	ldrh r0, [r0, #6]
	adds r3, r0, #0
	asrs r0, r2, #3
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _08049D2C
	ldr r0, _08049D28 @ =0x00007208
	b _08049D52
	.align 2, 0
_08049D1C: .4byte 0x04000120
_08049D20: .4byte 0x0000FFFF
_08049D24: .4byte 0x04000126
_08049D28: .4byte 0x00007208
_08049D2C:
	subs r4, #1
	cmp r4, #0
	beq _08049D58
	lsls r0, r4, #1
	ldr r1, _08049D80 @ =0x04000120
	adds r0, r0, r1
	ldrh r0, [r0]
	adds r3, r0, #0
	adds r0, r2, #0
	asrs r0, r4
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _08049D2C
	adds r0, r1, #0
	lsls r0, r4
	movs r1, #0xe4
	lsls r1, r1, #7
	orrs r0, r1
_08049D52:
	cmp r3, r0
	beq _08049D2C
	movs r5, #0
_08049D58:
	adds r0, r5, #0
	ands r0, r7
	strb r0, [r6, #0x1e]
	cmp r5, #0
	bne _08049D68
	movs r0, #0xf
	mov r2, sl
	strb r0, [r2]
_08049D68:
	mov r1, sl
	ldrb r0, [r1]
	cmp r0, #0
	bne _08049D84
	ldrb r2, [r6, #0x1d]
	ldrb r0, [r6, #0x1e]
	cmp r2, r0
	beq _08049D8A
	adds r0, r6, #0
	bl sub_804A044
	b _08049D94
	.align 2, 0
_08049D80: .4byte 0x04000120
_08049D84:
	subs r0, #1
	mov r1, sl
	strb r0, [r1]
_08049D8A:
	movs r2, #0xc4
	lsls r2, r2, #7
	adds r0, r2, #0
	ldrb r1, [r6, #0x1e]
	b _08049E94
_08049D94:
	adds r1, r6, #0
	adds r1, #0x49
	movs r0, #0
	strb r0, [r1]
	movs r4, #3
	adds r7, r1, #0
	ldr r5, _08049DE8 @ =0x0300144C
_08049DA2:
	lsls r0, r4, #1
	ldr r2, _08049DEC @ =0x04000120
	adds r0, r0, r2
	ldrh r0, [r0]
	adds r3, r0, #0
	asrs r0, r3, #8
	subs r2, r4, #1
	cmp r0, #0x72
	bne _08049DCC
	lsls r0, r2, #1
	adds r0, r0, r5
	strh r3, [r0]
	movs r0, #0xff
	ands r3, r0
	movs r0, #1
	lsls r0, r4
	cmp r3, r0
	bne _08049DCC
	ldrb r0, [r1]
	orrs r3, r0
	strb r3, [r1]
_08049DCC:
	adds r4, r2, #0
	cmp r4, #0
	bne _08049DA2
	ldrb r1, [r6, #0x1d]
	ldrb r2, [r7]
	cmp r1, r2
	bne _08049D8A
	movs r0, #2
	strb r0, [r6, #0x18]
	movs r1, #0xc2
	lsls r1, r1, #7
	adds r0, r1, #0
	ldrb r1, [r7]
	b _08049E94
	.align 2, 0
_08049DE8: .4byte 0x0300144C
_08049DEC: .4byte 0x04000120
_08049DF0:
	movs r4, #3
	adds r7, r6, #0
	adds r7, #0x49
	adds r5, r7, #0
	movs r2, #1
	mov ip, r2
	ldr r0, _08049E34 @ =0x0300144C
	mov sb, r0
	ldr r1, _08049E38 @ =0x04000120
	mov r8, r1
_08049E04:
	ldrb r3, [r5]
	adds r0, r3, #0
	asrs r0, r4
	mov r2, ip
	ands r0, r2
	subs r2, r4, #1
	cmp r0, #0
	beq _08049E2C
	lsls r0, r4, #1
	add r0, r8
	ldrh r1, [r0]
	lsls r0, r2, #1
	add r0, sb
	ldrh r0, [r0]
	cmp r1, r0
	beq _08049E2C
	mov r0, ip
	lsls r0, r4
	eors r3, r0
	strb r3, [r5]
_08049E2C:
	adds r4, r2, #0
	cmp r4, #0
	bne _08049E04
	b _08049F90
	.align 2, 0
_08049E34: .4byte 0x0300144C
_08049E38: .4byte 0x04000120
_08049E3C:
	movs r5, #1
	movs r4, #3
	adds r7, r6, #0
	adds r7, #0x49
	movs r0, #0x19
	adds r0, r0, r6
	mov ip, r0
	ldr r1, _08049EA0 @ =0x0300144C
	mov r8, r1
_08049E4E:
	lsls r0, r4, #1
	ldr r2, _08049EA4 @ =0x04000120
	adds r0, r0, r2
	ldrh r0, [r0]
	adds r3, r0, #0
	subs r2, r4, #1
	mov r1, ip
	adds r0, r1, r2
	strb r3, [r0]
	ldrb r1, [r7]
	asrs r1, r4
	movs r0, #1
	ands r1, r0
	cmp r1, #0
	beq _08049E82
	asrs r0, r3, #8
	subs r0, #0x72
	cmp r0, #1
	bls _08049E76
	b _08049FDE
_08049E76:
	lsls r0, r2, #1
	add r0, r8
	ldrh r0, [r0]
	cmp r3, r0
	bne _08049E82
	movs r5, #0
_08049E82:
	adds r4, r2, #0
	cmp r4, #0
	bne _08049E4E
	cmp r5, #0
	bne _08049EA8
	movs r2, #0xc6
	lsls r2, r2, #7
	adds r0, r2, #0
	ldrb r1, [r6, #0x1c]
_08049E94:
	orrs r1, r0
	adds r0, r6, #0
	bl sub_8049FF8
	b _08049FEA
	.align 2, 0
_08049EA0: .4byte 0x0300144C
_08049EA4: .4byte 0x04000120
_08049EA8:
	movs r0, #0xd1
	strb r0, [r6, #0x18]
	movs r5, #0x11
	movs r4, #3
	mov r0, ip
	adds r0, #2
_08049EB4:
	ldrb r1, [r0]
	adds r5, r1, r5
	subs r0, #1
	subs r4, #1
	cmp r4, #0
	bne _08049EB4
	strb r5, [r6, #0x14]
	movs r0, #0xff
	ands r5, r0
	movs r2, #0xc8
	lsls r2, r2, #7
	adds r0, r2, #0
	orrs r5, r0
	adds r0, r6, #0
	adds r1, r5, #0
	bl sub_8049FF8
	b _08049FEA
_08049ED8:
	movs r4, #3
	adds r7, r6, #0
	adds r7, #0x49
	ldrb r1, [r7]
	ldr r2, _08049F18 @ =0x04000126
	movs r5, #1
_08049EE4:
	ldrh r0, [r2]
	adds r3, r0, #0
	adds r0, r1, #0
	asrs r0, r4
	ands r0, r5
	cmp r0, #0
	beq _08049EF8
	asrs r0, r3, #8
	cmp r0, #0x73
	bne _08049FDE
_08049EF8:
	subs r2, #2
	subs r4, #1
	cmp r4, #0
	bne _08049EE4
	adds r0, r6, #0
	bl MultiBoot
	adds r4, r0, #0
	cmp r4, #0
	bne _08049F1C
	movs r0, #0xe0
	strb r0, [r6, #0x18]
	adds r0, #0xb0
	strh r0, [r6, #0x16]
	b _08049FE8
	.align 2, 0
_08049F18: .4byte 0x04000126
_08049F1C:
	adds r0, r6, #0
	bl sub_8049BD0
	movs r0, #0x1e
	mov r1, sl
	strb r0, [r1]
	movs r0, #0x70
	b _08049FEA
_08049F2C:
	movs r4, #3
	adds r7, r6, #0
	adds r7, #0x49
	mov ip, r7
	movs r2, #1
	mov r8, r2
_08049F38:
	mov r0, ip
	ldrb r5, [r0]
	adds r0, r5, #0
	asrs r0, r4
	mov r1, r8
	ands r0, r1
	cmp r0, #0
	beq _08049F72
	lsls r0, r4, #1
	ldr r2, _08049F8C @ =0x04000120
	adds r0, r0, r2
	ldrh r0, [r0]
	adds r3, r0, #0
	asrs r2, r3, #8
	ldrb r0, [r6, #0x18]
	lsrs r1, r0, #1
	movs r0, #0x62
	subs r0, r0, r1
	mov r1, r8
	lsls r1, r4
	cmp r2, r0
	bne _08049F6C
	movs r0, #0xff
	ands r3, r0
	cmp r3, r1
	beq _08049F72
_08049F6C:
	eors r5, r1
	mov r1, ip
	strb r5, [r1]
_08049F72:
	subs r4, #1
	cmp r4, #0
	bne _08049F38
	ldrb r2, [r6, #0x18]
	cmp r2, #0xc4
	bne _08049F90
	movs r0, #0xe
	ldrb r7, [r7]
	ands r0, r7
	strb r0, [r6, #0x1e]
	strb r4, [r6, #0x18]
	b _08049D8A
	.align 2, 0
_08049F8C: .4byte 0x04000120
_08049F90:
	ldrb r0, [r7]
	cmp r0, #0
	bne _08049FA0
	adds r0, r6, #0
	bl sub_8049BD0
	movs r0, #0x50
	b _08049FEA
_08049FA0:
	ldrb r0, [r6, #0x18]
	adds r0, #2
	strb r0, [r6, #0x18]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0xc4
	bne _08049FB0
	b _08049D8A
_08049FB0:
	ldr r0, [r6, #0x28]
	ldrb r1, [r6, #0x18]
	adds r0, r1, r0
	subs r1, r0, #3
	ldrb r1, [r1]
	lsls r1, r1, #8
	subs r0, #4
	ldrb r0, [r0]
	orrs r1, r0
	adds r0, r6, #0
	bl sub_8049FF8
	adds r4, r0, #0
	cmp r4, #0
	bne _08049FEA
	adds r0, r6, #0
	adds r0, #0x4b
	ldrb r0, [r0]
	cmp r0, #1
	bne _08049FE8
_08049FD8:
	bl sub_804A240
	b _08049C36
_08049FDE:
	adds r0, r6, #0
	bl sub_8049BD0
	movs r0, #0x60
	b _08049FEA
_08049FE8:
	movs r0, #0
_08049FEA:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	thumb_func_start sub_8049FF8
sub_8049FF8: @ 0x08049FF8
	push {r4, lr}
	adds r2, r0, #0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	ldr r3, _0804A024 @ =0x04000128
	ldrh r0, [r3]
	movs r4, #0x8c
	ands r4, r0
	cmp r4, #8
	bne _0804A030
	ldr r0, _0804A028 @ =0x0400012A
	strh r1, [r0]
	ldr r1, _0804A02C @ =0x00002083
	adds r0, r1, #0
	strh r0, [r3]
	adds r1, r2, #0
	adds r1, #0x48
	movs r0, #1
	strb r0, [r1]
	movs r0, #0
	b _0804A03C
	.align 2, 0
_0804A024: .4byte 0x04000128
_0804A028: .4byte 0x0400012A
_0804A02C: .4byte 0x00002083
_0804A030:
	adds r0, r2, #0
	bl sub_8049BD0
	movs r0, #8
	eors r4, r0
	adds r0, r4, #0
_0804A03C:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_804A044
sub_804A044: @ 0x0804A044
	push {lr}
	adds r1, r0, #0
	ldrb r0, [r1, #0x18]
	cmp r0, #0
	beq _0804A056
	adds r0, r1, #0
	bl sub_8049BD0
	b _0804A062
_0804A056:
	adds r2, r1, #0
	adds r2, #0x4a
	strb r0, [r2]
	strb r0, [r1, #0x1e]
	movs r0, #1
	strb r0, [r1, #0x18]
_0804A062:
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_804A068
sub_804A068: @ 0x0804A068
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	adds r6, r1, #0
	ldr r0, [sp, #0x14]
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	ldrb r0, [r5, #0x18]
	cmp r0, #0
	bne _0804A0A2
	ldrb r0, [r5, #0x1e]
	cmp r0, #0
	beq _0804A0A2
	adds r0, r5, #0
	adds r0, #0x4a
	ldrb r0, [r0]
	cmp r0, #0
	bne _0804A0A2
	str r6, [r5, #0x20]
	adds r2, #0xf
	movs r0, #0x10
	rsbs r0, r0, #0
	ands r2, r0
	subs r0, #0xf0
	adds r1, r2, r0
	ldr r0, _0804A0AC @ =0x0003FF00
	cmp r1, r0
	bls _0804A0B0
_0804A0A2:
	adds r0, r5, #0
	bl sub_8049BD0
	b _0804A124
	.align 2, 0
_0804A0AC: .4byte 0x0003FF00
_0804A0B0:
	adds r0, r6, r2
	str r0, [r5, #0x24]
	lsls r1, r7, #0x18
	movs r2, #0x80
	lsls r2, r2, #0x13
	adds r0, r1, r2
	asrs r0, r0, #0x18
	adds r2, r1, #0
	cmp r0, #8
	bhi _0804A110
	lsls r0, r0, #2
	ldr r1, _0804A0D0 @ =_0804A0D4
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0804A0D0: .4byte _0804A0D4
_0804A0D4: @ jump table
	.4byte _0804A0F8 @ case 0
	.4byte _0804A0F8 @ case 1
	.4byte _0804A0F8 @ case 2
	.4byte _0804A0F8 @ case 3
	.4byte _0804A102 @ case 4
	.4byte _0804A108 @ case 5
	.4byte _0804A108 @ case 6
	.4byte _0804A108 @ case 7
	.4byte _0804A108 @ case 8
_0804A0F8:
	lsls r4, r3, #3
	asrs r1, r2, #0x18
	movs r0, #3
	subs r0, r0, r1
	b _0804A10E
_0804A102:
	movs r0, #0x38
	adds r4, r3, #0
	b _0804A10E
_0804A108:
	lsls r4, r3, #3
	asrs r0, r2, #0x18
	subs r0, #1
_0804A10E:
	orrs r4, r0
_0804A110:
	movs r0, #0x3f
	ands r4, r0
	lsls r0, r4, #1
	movs r2, #0x7f
	rsbs r2, r2, #0
	adds r1, r2, #0
	orrs r0, r1
	strb r0, [r5, #0x1c]
	movs r0, #0xd0
	strb r0, [r5, #0x18]
_0804A124:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_804A12C
sub_804A12C: @ 0x0804A12C
	ldrb r0, [r0, #0x18]
	cmp r0, #0xe9
	beq _0804A136
	movs r0, #0
	b _0804A138
_0804A136:
	movs r0, #1
_0804A138:
	bx lr
	.align 2, 0

	thumb_func_start sub_804A13C
sub_804A13C: @ 0x0804A13C
	push {r4, r5, r6, lr}
	adds r3, r0, #0
	ldrb r0, [r3, #0x18]
	cmp r0, #0xe0
	beq _0804A158
	cmp r0, #0xe0
	blt _0804A168
	cmp r0, #0xe8
	bgt _0804A168
	cmp r0, #0xe7
	blt _0804A168
	movs r4, #3
	ldrb r5, [r3, #0x1e]
	b _0804A1C8
_0804A158:
	movs r1, #0
	movs r0, #0xe1
	strb r0, [r3, #0x18]
	str r1, [r3, #4]
	movs r0, #0x80
	lsls r0, r0, #0xd
	str r0, [r3]
	b _0804A1BA
_0804A168:
	movs r4, #3
	ldrb r5, [r3, #0x1e]
	movs r6, #1
	ldr r1, _0804A1C4 @ =0x04000126
_0804A170:
	ldrh r0, [r1]
	adds r2, r0, #0
	adds r0, r5, #0
	asrs r0, r4
	ands r0, r6
	cmp r0, #0
	beq _0804A184
	ldr r0, [r3, #4]
	cmp r2, r0
	bne _0804A158
_0804A184:
	subs r1, #2
	subs r4, #1
	cmp r4, #0
	bne _0804A170
	ldrb r0, [r3, #0x18]
	adds r0, #1
	strb r0, [r3, #0x18]
	ldr r1, [r3]
	ldrh r0, [r3]
	str r0, [r3, #4]
	cmp r1, #0
	bne _0804A1B2
	ldr r0, [r3, #0x28]
	adds r1, r0, #0
	adds r1, #0xac
	adds r0, #0xad
	ldrb r0, [r0]
	lsls r0, r0, #8
	ldrb r1, [r1]
	orrs r0, r1
	str r0, [r3, #4]
	lsls r0, r0, #5
	str r0, [r3]
_0804A1B2:
	ldr r0, [r3]
	lsrs r0, r0, #5
	str r0, [r3]
_0804A1B8:
	ldrh r1, [r3]
_0804A1BA:
	adds r0, r3, #0
	bl sub_8049FF8
	b _0804A220
	.align 2, 0
_0804A1C4: .4byte 0x04000126
_0804A1C8:
	lsls r0, r4, #1
	ldr r1, _0804A210 @ =0x04000120
	adds r0, r0, r1
	ldrh r0, [r0]
	adds r2, r0, #0
	adds r0, r5, #0
	asrs r0, r4
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _0804A1E4
	ldr r0, [r3, #4]
	cmp r2, r0
	bne _0804A214
_0804A1E4:
	subs r4, #1
	cmp r4, #0
	bne _0804A1C8
	ldrb r0, [r3, #0x18]
	adds r0, #1
	strb r0, [r3, #0x18]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0xe9
	beq _0804A21E
	ldr r0, [r3, #0x28]
	adds r1, r0, #0
	adds r1, #0xae
	adds r0, #0xaf
	ldrb r0, [r0]
	lsls r0, r0, #8
	ldrb r1, [r1]
	orrs r0, r1
	str r0, [r3]
	str r0, [r3, #4]
	b _0804A1B8
	.align 2, 0
_0804A210: .4byte 0x04000120
_0804A214:
	adds r0, r3, #0
	bl sub_8049BD0
	movs r0, #0x71
	b _0804A220
_0804A21E:
	movs r0, #0
_0804A220:
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_804A228
sub_804A228: @ 0x0804A228
	mov r2, pc
	lsrs r2, r2, #0x18
	movs r1, #0xc
	cmp r2, #2
	beq _0804A23A
	movs r1, #0xd
	cmp r2, #8
	beq _0804A23A
	movs r1, #4
_0804A23A:
	subs r0, r0, r1
	bgt _0804A23A
	bx lr

	thumb_func_start sub_804A240
sub_804A240: @ 0x0804A240
	push {r4, r5, lr}
	movs r2, #0
	ldr r3, _0804A274 @ =0x04000128
	ldrh r1, [r3]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _0804A264
	ldr r5, _0804A278 @ =0x0000795C
	movs r4, #0x80
_0804A254:
	adds r2, #1
	cmp r2, r5
	bgt _0804A264
	ldrh r1, [r3]
	adds r0, r4, #0
	ands r0, r1
	cmp r0, #0
	bne _0804A254
_0804A264:
	movs r0, #0x96
	lsls r0, r0, #2
	bl sub_804A228
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0804A274: .4byte 0x04000128
_0804A278: .4byte 0x0000795C
