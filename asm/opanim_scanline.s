	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_80BBB5C
sub_80BBB5C: @ 0x080BBB5C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x28

	ldr r1, _080BBC18 @ =OpScanlineSt
	ldr r0, [r1, #4]
	str r0, [sp]
	asrs r0, r0, #0x1f
	str r0, [sp, #4]
	ldr r0, [r1]
	str r0, [sp, #8]
	asrs r0, r0, #0x1f
	str r0, [sp, #0xc]

	ldr r0, [r1, #0xc]
	str r0, [sp, #0x10]
	asrs r0, r0, #0x1f
	str r0, [sp, #0x14]
	ldr r0, [r1, #0x10]
	str r0, [sp, #0x18]
	asrs r0, r0, #0x1f
	str r0, [sp, #0x1c]

	ldr r0, [r1, #0x18]
	cmp r0, #0
	bne _080BBC28
	movs r0, #1
	mov sb, r0
	ldr r1, _080BBC1C @ =gSinLut
	mov sl, r1
	ldr r2, _080BBC20 @ =0x00000FFF
	mov r8, r2
_080BBB9C:
	mov r0, sb
	asrs r1, r0, #0x1f
	ldr r2, [sp]
	ldr r3, [sp, #4]
	bl __muldi3
	ldr r2, [sp, #8]
	ldr r3, [sp, #0xc]
	adds r0, r0, r2
	adcs r1, r3
	lsls r3, r1, #0x18
	lsrs r2, r0, #8
	adds r6, r3, #0
	orrs r6, r2				@ r6 = stack.unk_08
	asrs r7, r1, #8

	ldr r3, _080BBC24 @ =gpOpScanlineBufs
	ldr r5, [r3]
	add r5, sb
	movs r4, #0xff
	ands r4, r6
	lsls r0, r4, #1
	add r0, sl
	movs r1, #0
	ldrsh r0, [r0, r1]

	add r0, r8
	asrs r1, r0, #0x1f
	ldr r2, [sp, #0x10]
	ldr r3, [sp, #0x14]
	bl __muldi3
	lsls r3, r1, #0xc
	lsrs r2, r0, #0x14
	adds r0, r3, #0
	orrs r0, r2
	strb r0, [r5]

	ldr r2, _080BBC24 @ =gpOpScanlineBufs
	ldr r5, [r2]
	add r5, sb
	adds r5, #0xa0
	adds r4, #0x40
	lsls r4, r4, #1
	add r4, sl
	movs r3, #0
	ldrsh r0, [r4, r3]
	add r0, r8
	asrs r1, r0, #0x1f
	ldr r2, [sp, #0x18]
	ldr r3, [sp, #0x1c]
	bl __muldi3
	lsls r3, r1, #0xc
	lsrs r2, r0, #0x14
	adds r0, r3, #0
	orrs r0, r2
	strb r0, [r5]
	movs r0, #2
	add sb, r0
	mov r1, sb
	cmp r1, #0x9f
	ble _080BBB9C
	b _080BBCFA
	.align 2, 0
_080BBC18: .4byte OpScanlineSt
_080BBC1C: .4byte gSinLut
_080BBC20: .4byte 0x00000FFF
_080BBC24: .4byte gpOpScanlineBufs
_080BBC28:
	adds r2, r0, #0
	muls r2, r0, r2
	mov sl, r2
	movs r3, #9
	mov sb, r3
_080BBC32:
	ldr r1, _080BBD18 @ =OpScanlineSt
	ldr r0, [r1, #0x14]
	mov r2, sb
	subs r0, r0, r2		@ OpScanlineSt.unk_14 - i

	adds r3, r0, #0
	muls r3, r0, r3
	adds r0, r3, #0		@ (OpScanlineSt.unk_14 - i) * (OpScanlineSt.unk_14 - i)
	mov r1, sl
	subs r0, r1, r0
	lsls r0, r0, #8
	bl __divsi3
	mov r8, r0
	cmp r0, #0
	ble _080BBCF0

	mov r0, sb
	asrs r1, r0, #0x1f
	ldr r2, [sp]
	ldr r3, [sp, #4]
	bl __muldi3
	ldr r2, [sp, #8]
	ldr r3, [sp, #0xc]
	adds r0, r0, r2			@ (i + )
	adcs r1, r3
	lsls r3, r1, #0x18
	lsrs r2, r0, #8
	adds r6, r3, #0
	orrs r6, r2
	asrs r7, r1, #8			@ int val = i * stack.unk_00 + stack.unk_08;

	movs r1, #0xff
	ands r1, r6
	adds r0, r1, #0
	adds r0, #0x40
	lsls r0, r0, #1
	ldr r3, _080BBD1C @ =gSinLut
	adds r0, r0, r3
	movs r2, #0
	ldrsh r0, [r0, r2]
	ldr r3, _080BBD20 @ =0x00000FFF
	adds r0, r0, r3
	adds r6, r0, #0
	asrs r7, r0, #0x1f
	lsls r1, r1, #1
	ldr r0, _080BBD1C @ =gSinLut
	adds r1, r1, r0
	movs r2, #0
	ldrsh r0, [r1, r2]
	adds r0, r0, r3
	str r0, [sp, #0x20]
	asrs r0, r0, #0x1f
	str r0, [sp, #0x24]
	adds r1, r7, #0
	adds r0, r6, #0
	ldr r2, [sp, #0x10]
	ldr r3, [sp, #0x14]
	bl __muldi3
	mov r4, r8
	asrs r5, r4, #0x1f
	adds r3, r5, #0
	adds r2, r4, #0
	bl __muldi3
	lsls r3, r1, #4
	lsrs r2, r0, #0x1c
	adds r6, r3, #0
	orrs r6, r2
	asrs r7, r1, #0x1c
	ldr r0, [sp, #0x20]
	ldr r1, [sp, #0x24]
	ldr r2, [sp, #0x18]
	ldr r3, [sp, #0x1c]
	bl __muldi3
	adds r3, r5, #0
	adds r2, r4, #0
	bl __muldi3
	lsls r3, r1, #4
	lsrs r2, r0, #0x1c
	orrs r3, r2
	str r3, [sp, #0x20]
	asrs r0, r1, #0x1c
	str r0, [sp, #0x24]
	ldr r1, _080BBD24 @ =gpOpScanlineBufs
	ldr r0, [r1]
	add r0, sb
	strb r6, [r0]
	ldr r0, [r1]
	add r0, sb
	adds r0, #0xa0
	add r3, sp, #0x20
	ldrb r3, [r3]
	strb r3, [r0]
_080BBCF0:
	movs r0, #2
	add sb, r0
	mov r1, sb
	cmp r1, #0x7f
	ble _080BBC32
_080BBCFA:
	bl SwapOpScanlineBufs
	ldr r0, _080BBD18 @ =OpScanlineSt
	ldr r1, [r0]
	ldr r2, [r0, #8]
	adds r1, r1, r2
	str r1, [r0]
	add sp, #0x28
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080BBD18: .4byte OpScanlineSt
_080BBD1C: .4byte gSinLut
_080BBD20: .4byte 0x00000FFF
_080BBD24: .4byte gpOpScanlineBufs

	thumb_func_start sub_80BBD28
sub_80BBD28: @ 0x080BBD28
	push {r4, lr}
	sub sp, #4
	ldr r0, _080BBD78 @ =0x00100010
	str r0, [sp]
	ldr r4, _080BBD7C @ =0x020072FC
	ldr r2, _080BBD80 @ =0x01000080
	mov r0, sp
	adds r1, r4, #0
	bl CpuFastSet
	ldr r0, _080BBD84 @ =0x020074FC
	str r4, [r0]
	movs r1, #0x80
	lsls r1, r1, #1
	adds r4, r4, r1
	str r4, [r0, #4]
	ldr r0, _080BBD88 @ =0x02007504
	movs r4, #0
	str r4, [r0]
	bl InitOpScanlineBuf
	ldr r0, _080BBD8C @ =0x02007518
	movs r1, #0xa0
	str r1, [r0]
	ldr r0, _080BBD90 @ =0x0200751C
	str r1, [r0]
	ldr r1, _080BBD94 @ =OpScanlineSt
	str r4, [r1, #0x18]
	movs r0, #0x50
	str r0, [r1, #0x14]
	movs r0, #0x80
	lsls r0, r0, #5
	str r0, [r1, #4]
	movs r0, #0x80
	lsls r0, r0, #3
	str r0, [r1, #8]
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080BBD78: .4byte 0x00100010
_080BBD7C: .4byte 0x020072FC
_080BBD80: .4byte 0x01000080
_080BBD84: .4byte 0x020074FC
_080BBD88: .4byte 0x02007504
_080BBD8C: .4byte 0x02007518
_080BBD90: .4byte 0x0200751C
_080BBD94: .4byte OpScanlineSt

	thumb_func_start sub_80BBD98
sub_80BBD98: @ 0x080BBD98
	ldr r0, _080BBDA4 @ =0x020074FC
	ldr r2, [r0]
	ldr r1, [r0, #4]
	str r1, [r0]
	str r2, [r0, #4]
	bx lr
	.align 2, 0
_080BBDA4: .4byte 0x020074FC

	thumb_func_start sub_80BBDA8
sub_80BBDA8: @ 0x080BBDA8
	push {lr}
	ldr r0, _080BBDC8 @ =0x02007504
	ldr r0, [r0]
	lsls r0, r0, #3
	asrs r0, r0, #6
	movs r1, #0x80
	lsls r1, r1, #5
	adds r0, r0, r1
	ldr r1, _080BBDCC @ =0x020074FC
	ldr r1, [r1]
	strh r0, [r1]
	bl sub_80BBD98
	pop {r0}
	bx r0
	.align 2, 0
_080BBDC8: .4byte 0x02007504
_080BBDCC: .4byte 0x020074FC

	thumb_func_start HBlank_80BBDD0
HBlank_80BBDD0: @ 0x080BBDD0
	push {r4, r5, r6, lr}
	ldr r0, _080BBF20 @ =0x04000006
	ldrh r0, [r0]
	adds r0, #1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	cmp r4, #0x9f
	bls _080BBDE2
	movs r4, #0
_080BBDE2:
	movs r1, #1
	adds r0, r4, #0
	ands r0, r1
	ldr r6, _080BBF24 @ =0x03001620
	cmp r0, #0
	beq _080BBE68
	ldr r0, [r6]
	ands r0, r1
	cmp r0, #0
	beq _080BBE0A
	ldr r2, _080BBF28 @ =0x04000010
	ldr r0, _080BBF2C @ =gpOpScanlineBufs
	ldr r0, [r0, #4]
	adds r0, r0, r4
	ldrb r1, [r0]
	strh r1, [r2]
	ldr r1, _080BBF30 @ =0x04000012
	adds r0, #0xa0
	ldrb r0, [r0]
	strh r0, [r1]
_080BBE0A:
	ldr r5, [r6]
	movs r0, #2
	ands r0, r5
	adds r3, r5, #0
	cmp r0, #0
	beq _080BBE2A
	ldr r2, _080BBF34 @ =0x04000014
	ldr r0, _080BBF2C @ =gpOpScanlineBufs
	ldr r0, [r0, #4]
	adds r0, r0, r4
	ldrb r1, [r0]
	strh r1, [r2]
	ldr r1, _080BBF38 @ =0x04000016
	adds r0, #0xa0
	ldrb r0, [r0]
	strh r0, [r1]
_080BBE2A:
	movs r0, #4
	ands r3, r0
	cmp r3, #0
	beq _080BBE4C
	ldr r2, _080BBF3C @ =0x04000018
	ldr r0, _080BBF2C @ =gpOpScanlineBufs
	ldr r0, [r0, #4]
	adds r0, r0, r4
	ldrb r1, [r0]
	strh r1, [r2]
	adds r2, #2
	adds r0, #0xa0
	ldr r1, _080BBF40 @ =gDispIo
	ldrb r0, [r0]
	ldrh r1, [r1, #0x26]
	adds r0, r0, r1
	strh r0, [r2]
_080BBE4C:
	movs r0, #8
	ands r5, r0
	cmp r5, #0
	beq _080BBE68
	ldr r2, _080BBF44 @ =0x0400001C
	ldr r0, _080BBF2C @ =gpOpScanlineBufs
	ldr r0, [r0, #4]
	adds r0, r0, r4
	ldrb r1, [r0]
	strh r1, [r2]
	ldr r1, _080BBF48 @ =0x0400001E
	adds r0, #0xa0
	ldrb r0, [r0]
	strh r0, [r1]
_080BBE68:
	ldr r0, [r6]
	movs r1, #0xc0
	lsls r1, r1, #1
	ands r0, r1
	cmp r0, #0
	beq _080BBEDE
	cmp r4, #0x83
	bne _080BBE8C
	ldr r1, _080BBF4C @ =0x04000050
	movs r2, #0xf4
	lsls r2, r2, #4
	adds r0, r2, #0
	strh r0, [r1]
	adds r1, #2
	movs r3, #0x80
	lsls r3, r3, #5
	adds r0, r3, #0
	strh r0, [r1]
_080BBE8C:
	cmp r4, #0x83
	bls _080BBEC0
	cmp r4, #0x93
	bhi _080BBEAC
	adds r1, r4, #0
	subs r1, #0x84
	ldr r0, _080BBF50 @ =0x020072B8
	ldr r0, [r0]
	muls r1, r0, r1
	asrs r1, r1, #4
	ldr r2, _080BBF54 @ =0x04000052
	movs r0, #0x10
	subs r0, r0, r1
	lsls r0, r0, #8
	adds r1, r1, r0
	strh r1, [r2]
_080BBEAC:
	cmp r4, #0x94
	bne _080BBEC0
	ldr r2, _080BBF54 @ =0x04000052
	ldr r0, _080BBF50 @ =0x020072B8
	ldr r1, [r0]
	movs r0, #0x10
	subs r0, r0, r1
	lsls r0, r0, #8
	adds r1, r1, r0
	strh r1, [r2]
_080BBEC0:
	cmp r4, #0
	bne _080BBEDE
	ldr r2, _080BBF4C @ =0x04000050
	ldr r1, _080BBF58 @ =0x030027CC
	ldrh r0, [r1]
	strh r0, [r2]
	adds r2, #2
	ldrb r3, [r1, #9]
	lsls r0, r3, #8
	ldrb r3, [r1, #8]
	orrs r0, r3
	strh r0, [r2]
	adds r2, #2
	ldrb r0, [r1, #0xa]
	strh r0, [r2]
_080BBEDE:
	ldr r0, [r6]
	movs r1, #0x10
	ands r0, r1
	cmp r0, #0
	beq _080BBEF6
	ldr r0, _080BBF38 @ =0x04000016
	movs r1, #1
	ands r1, r4
	lsrs r2, r4, #1
	adds r1, r1, r2
	rsbs r1, r1, #0
	strh r1, [r0]
_080BBEF6:
	ldr r0, [r6]
	movs r1, #0x60
	ands r0, r1
	cmp r0, #0
	beq _080BBF1A
	cmp r4, #0x9f
	bne _080BBF0C
	ldr r1, _080BBF4C @ =0x04000050
	ldr r2, _080BBF5C @ =0x00000441
	adds r0, r2, #0
	strh r0, [r1]
_080BBF0C:
	cmp r4, #1
	bne _080BBF1A
	ldr r1, _080BBF54 @ =0x04000052
	ldr r0, _080BBF60 @ =0x020074FC
	ldr r0, [r0, #4]
	ldrh r0, [r0]
	strh r0, [r1]
_080BBF1A:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080BBF20: .4byte 0x04000006
_080BBF24: .4byte 0x03001620
_080BBF28: .4byte 0x04000010
_080BBF2C: .4byte gpOpScanlineBufs
_080BBF30: .4byte 0x04000012
_080BBF34: .4byte 0x04000014
_080BBF38: .4byte 0x04000016
_080BBF3C: .4byte 0x04000018
_080BBF40: .4byte gDispIo
_080BBF44: .4byte 0x0400001C
_080BBF48: .4byte 0x0400001E
_080BBF4C: .4byte 0x04000050
_080BBF50: .4byte 0x020072B8
_080BBF54: .4byte 0x04000052
_080BBF58: .4byte 0x030027CC
_080BBF5C: .4byte 0x00000441
_080BBF60: .4byte 0x020074FC
