	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_80BBAEC
sub_80BBAEC: @ 0x080BBAEC
	ldr r0, _080BBAF8 @ =0x02007508
	movs r1, #0xf8
	str r1, [r0]
	movs r1, #4
	str r1, [r0, #4]
	bx lr
	.align 2, 0
_080BBAF8: .4byte 0x02007508

	thumb_func_start sub_80BBAFC
sub_80BBAFC: @ 0x080BBAFC
	push {r4, r5, lr}
	sub sp, #4
	movs r5, #0
	str r5, [sp]
	ldr r4, _080BBB3C @ =0x02007030
	ldr r2, _080BBB40 @ =0x010000A0
	mov r0, sp
	adds r1, r4, #0
	bl CpuFastSet
	ldr r0, _080BBB44 @ =0x020072B0
	str r4, [r0]
	movs r1, #0xa0
	lsls r1, r1, #1
	adds r4, r4, r1
	str r4, [r0, #4]
	ldr r0, _080BBB48 @ =0x02007014
	str r5, [r0]
	movs r2, #0xc0
	lsls r2, r2, #2
	str r2, [r0, #4]
	adds r1, #0xc0
	str r1, [r0, #8]
	str r1, [r0, #0xc]
	str r2, [r0, #0x10]
	str r5, [r0, #0x18]
	str r5, [r0, #0x14]
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080BBB3C: .4byte 0x02007030
_080BBB40: .4byte 0x010000A0
_080BBB44: .4byte 0x020072B0
_080BBB48: .4byte 0x02007014

	thumb_func_start sub_80BBB4C
sub_80BBB4C: @ 0x080BBB4C
	ldr r0, _080BBB58 @ =0x020072B0
	ldr r2, [r0]
	ldr r1, [r0, #4]
	str r1, [r0]
	str r2, [r0, #4]
	bx lr
	.align 2, 0
_080BBB58: .4byte 0x020072B0

	thumb_func_start sub_80BBB5C
sub_80BBB5C: @ 0x080BBB5C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x28
	ldr r1, _080BBC18 @ =0x02007014
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
	orrs r6, r2
	asrs r7, r1, #8
	ldr r3, _080BBC24 @ =0x020072B0
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
	ldr r2, _080BBC24 @ =0x020072B0
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
_080BBC18: .4byte 0x02007014
_080BBC1C: .4byte gSinLut
_080BBC20: .4byte 0x00000FFF
_080BBC24: .4byte 0x020072B0
_080BBC28:
	adds r2, r0, #0
	muls r2, r0, r2
	mov sl, r2
	movs r3, #9
	mov sb, r3
_080BBC32:
	ldr r1, _080BBD18 @ =0x02007014
	ldr r0, [r1, #0x14]
	mov r2, sb
	subs r0, r0, r2
	adds r3, r0, #0
	muls r3, r0, r3
	adds r0, r3, #0
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
	adds r0, r0, r2
	adcs r1, r3
	lsls r3, r1, #0x18
	lsrs r2, r0, #8
	adds r6, r3, #0
	orrs r6, r2
	asrs r7, r1, #8
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
	ldr r1, _080BBD24 @ =0x020072B0
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
	bl sub_80BBB4C
	ldr r0, _080BBD18 @ =0x02007014
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
_080BBD18: .4byte 0x02007014
_080BBD1C: .4byte gSinLut
_080BBD20: .4byte 0x00000FFF
_080BBD24: .4byte 0x020072B0

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
	bl sub_80BBAFC
	ldr r0, _080BBD8C @ =0x02007518
	movs r1, #0xa0
	str r1, [r0]
	ldr r0, _080BBD90 @ =0x0200751C
	str r1, [r0]
	ldr r1, _080BBD94 @ =0x02007014
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
_080BBD94: .4byte 0x02007014

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

	thumb_func_start sub_80BBDD0
sub_80BBDD0: @ 0x080BBDD0
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
	ldr r0, _080BBF2C @ =0x020072B0
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
	ldr r0, _080BBF2C @ =0x020072B0
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
	ldr r0, _080BBF2C @ =0x020072B0
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
	ldr r0, _080BBF2C @ =0x020072B0
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
_080BBF2C: .4byte 0x020072B0
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

	thumb_func_start sub_80BBF64
sub_80BBF64: @ 0x080BBF64
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r0, _080BBF94 @ =0x03001620
	movs r4, #0
	str r4, [r0]
	ldr r0, _080BBF98 @ =0x020072B8
	str r4, [r0]
	bl sub_80BBD28
	bl sub_80BBAFC
	bl sub_80BBAEC
	movs r0, #0
	bl SetOnHBlankA
	ldr r0, _080BBF9C @ =sub_80BBDD0
	bl SetOnHBlankA
	adds r5, #0x4c
	strh r4, [r5]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080BBF94: .4byte 0x03001620
_080BBF98: .4byte 0x020072B8
_080BBF9C: .4byte sub_80BBDD0

	thumb_func_start sub_80BBFA0
sub_80BBFA0: @ 0x080BBFA0
	push {lr}
	movs r0, #0
	bl SetOnHBlankA
	pop {r0}
	bx r0

	thumb_func_start sub_80BBFAC
sub_80BBFAC: @ 0x080BBFAC
	push {r4, r5, lr}
	sub sp, #0x28
	adds r4, r0, #0
	ldr r0, _080BBFCC @ =0x03001620
	ldr r1, [r0]
	movs r0, #0xe0
	lsls r0, r0, #4
	ands r1, r0
	cmp r1, #0
	beq _080BBFD0
	adds r0, r4, #0
	adds r0, #0x4c
	ldrh r1, [r0]
	adds r1, #1
	b _080BBFD4
	.align 2, 0
_080BBFCC: .4byte 0x03001620
_080BBFD0:
	adds r0, r4, #0
	adds r0, #0x4c
_080BBFD4:
	strh r1, [r0]
	adds r5, r0, #0
	ldr r0, _080BC01C @ =0x03001620
	ldr r1, [r0]
	movs r0, #0x80
	lsls r0, r0, #3
	ands r0, r1
	cmp r0, #0
	beq _080BC028
	ldrh r1, [r5]
	movs r0, #0xf
	ands r0, r1
	cmp r0, #0
	bne _080BC064
	ldr r3, _080BC020 @ =gUnk_08DB8FD0
	lsls r1, r1, #0x10
	asrs r1, r1, #0x14
	adds r0, r1, #0
	movs r2, #0xf
	ands r0, r2
	lsls r0, r0, #2
	adds r0, r0, r3
	ldr r0, [r0]
	ldr r3, _080BC024 @ =gUnk_08DB9010
	movs r2, #7
	ands r1, r2
	lsls r1, r1, #2
	adds r1, r1, r3
	ldr r2, [r1]
	str r4, [sp]
	movs r1, #0x70
	movs r3, #0x20
	bl sub_80BDF7C
	b _080BC064
	.align 2, 0
_080BC01C: .4byte 0x03001620
_080BC020: .4byte gUnk_08DB8FD0
_080BC024: .4byte gUnk_08DB9010
_080BC028:
	movs r0, #0x80
	lsls r0, r0, #2
	ands r1, r0
	cmp r1, #0
	beq _080BC064
	ldrh r1, [r5]
	movs r0, #0x1f
	ands r0, r1
	cmp r0, #0
	bne _080BC064
	ldr r3, _080BC0E8 @ =gUnk_08DB8FD0
	lsls r1, r1, #0x10
	asrs r0, r1, #0x15
	movs r2, #0xf
	ands r0, r2
	lsls r0, r0, #2
	adds r0, r0, r3
	ldr r0, [r0]
	ldr r3, _080BC0EC @ =gUnk_08DB9010
	asrs r1, r1, #0x14
	movs r2, #7
	ands r1, r2
	lsls r1, r1, #2
	adds r1, r1, r3
	ldr r2, [r1]
	str r4, [sp]
	movs r1, #0x70
	movs r3, #0x20
	bl sub_80BDF7C
_080BC064:
	ldr r0, _080BC0F0 @ =0x03001620
	ldr r0, [r0]
	movs r1, #0x80
	lsls r1, r1, #4
	ands r0, r1
	cmp r0, #0
	beq _080BC0B6
	add r0, sp, #8
	ldr r1, _080BC0F4 @ =gUnk_086C44EC
	ldm r1!, {r2, r3, r4}
	stm r0!, {r2, r3, r4}
	ldm r1!, {r2, r3, r4}
	stm r0!, {r2, r3, r4}
	ldm r1!, {r2, r3}
	stm r0!, {r2, r3}
	ldrh r2, [r5]
	movs r0, #0xf
	ands r0, r2
	cmp r0, #0
	bne _080BC0B6
	ldr r0, _080BC0F8 @ =gUnk_086C0C4C
	lsls r2, r2, #0x10
	asrs r2, r2, #0x14
	movs r3, #7
	adds r1, r2, #0
	ands r1, r3
	lsls r1, r1, #2
	add r1, sp
	adds r1, #8
	ldr r1, [r1]
	movs r3, #0xe6
	lsls r3, r3, #6
	movs r4, #1
	ands r2, r4
	adds r2, #1
	str r2, [sp]
	movs r2, #0xa
	str r2, [sp, #4]
	movs r2, #0x50
	bl StartSpriteAnimProc
_080BC0B6:
	ldr r4, _080BC0F0 @ =0x03001620
	ldr r0, [r4]
	movs r1, #0xf
	ands r0, r1
	cmp r0, #0
	beq _080BC0C6
	bl sub_80BBB5C
_080BC0C6:
	ldr r1, [r4]
	movs r0, #0xc0
	lsls r0, r0, #1
	ands r0, r1
	cmp r0, #0
	beq _080BC114
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r1
	cmp r0, #0
	beq _080BC100
	ldr r1, _080BC0FC @ =0x020072B8
	ldr r0, [r1]
	cmp r0, #0
	ble _080BC114
	subs r0, #1
	b _080BC112
	.align 2, 0
_080BC0E8: .4byte gUnk_08DB8FD0
_080BC0EC: .4byte gUnk_08DB9010
_080BC0F0: .4byte 0x03001620
_080BC0F4: .4byte gUnk_086C44EC
_080BC0F8: .4byte gUnk_086C0C4C
_080BC0FC: .4byte 0x020072B8
_080BC100:
	movs r0, #0x80
	ands r1, r0
	cmp r1, #0
	beq _080BC114
	ldr r1, _080BC13C @ =0x020072B8
	ldr r0, [r1]
	cmp r0, #0xf
	bgt _080BC114
	adds r0, #1
_080BC112:
	str r0, [r1]
_080BC114:
	ldr r3, _080BC140 @ =0x03001620
	ldr r1, [r3]
	movs r0, #0x60
	ands r0, r1
	cmp r0, #0
	beq _080BC1A0
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _080BC168
	ldr r2, _080BC144 @ =0x02007504
	ldr r0, [r2]
	cmp r0, #0
	bne _080BC148
	movs r0, #0x65
	rsbs r0, r0, #0
	ands r1, r0
	str r1, [r3]
	b _080BC182
	.align 2, 0
_080BC13C: .4byte 0x020072B8
_080BC140: .4byte 0x03001620
_080BC144: .4byte 0x02007504
_080BC148:
	cmp r0, #0
	ble _080BC182
	subs r0, #1
	str r0, [r2]
	cmp r0, #0
	bne _080BC182
	ldr r0, _080BC164 @ =gBg0Tm
	movs r1, #0
	bl TmFill
	movs r0, #1
	bl EnableBgSync
	b _080BC182
	.align 2, 0
_080BC164: .4byte gBg0Tm
_080BC168:
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	beq _080BC182
	movs r0, #4
	orrs r1, r0
	str r1, [r3]
	ldr r1, _080BC1D0 @ =0x02007504
	ldr r0, [r1]
	cmp r0, #0x3f
	bgt _080BC182
	adds r0, #1
	str r0, [r1]
_080BC182:
	ldr r2, _080BC1D4 @ =0x02007014
	ldr r0, _080BC1D8 @ =0x02007518
	ldr r1, _080BC1D0 @ =0x02007504
	ldr r0, [r0]
	ldr r1, [r1]
	muls r0, r1, r0
	asrs r0, r0, #6
	str r0, [r2, #0xc]
	ldr r0, _080BC1DC @ =0x0200751C
	ldr r0, [r0]
	muls r0, r1, r0
	asrs r0, r0, #6
	str r0, [r2, #0x10]
	bl sub_80BBDA8
_080BC1A0:
	ldr r2, _080BC1E0 @ =0x02007508
	ldr r4, _080BC1E4 @ =gSinLut
	ldrb r1, [r2]
	adds r0, r1, #0
	adds r0, #0x40
	lsls r0, r0, #1
	adds r0, r0, r4
	movs r3, #0
	ldrsh r0, [r0, r3]
	ldr r3, [r2, #4]
	muls r0, r3, r0
	asrs r0, r0, #4
	str r0, [r2, #8]
	lsls r1, r1, #1
	adds r1, r1, r4
	movs r4, #0
	ldrsh r0, [r1, r4]
	muls r0, r3, r0
	asrs r0, r0, #4
	str r0, [r2, #0xc]
	add sp, #0x28
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080BC1D0: .4byte 0x02007504
_080BC1D4: .4byte 0x02007014
_080BC1D8: .4byte 0x02007518
_080BC1DC: .4byte 0x0200751C
_080BC1E0: .4byte 0x02007508
_080BC1E4: .4byte gSinLut

	thumb_func_start sub_80BC1E8
sub_80BC1E8: @ 0x080BC1E8
	push {r4, r5, lr}
	sub sp, #4
	ldr r0, _080BC230 @ =0x03001620
	ldr r0, [r0]
	movs r1, #0xc0
	lsls r1, r1, #1
	ands r0, r1
	cmp r0, #0
	beq _080BC214
	movs r4, #0
	movs r5, #0xbc
	lsls r5, r5, #5
_080BC200:
	lsls r1, r4, #6
	str r5, [sp]
	movs r0, #4
	ldr r2, _080BC234 @ =0x00000484
	ldr r3, _080BC238 @ =Sprite_64x32
	bl PutSpriteExt
	adds r4, #1
	cmp r4, #3
	ble _080BC200
_080BC214:
	ldr r3, _080BC23C @ =gUnk_08DB941C
	movs r0, #0x90
	lsls r0, r0, #5
	str r0, [sp]
	movs r0, #4
	movs r1, #8
	movs r2, #0x90
	bl PutSpriteExt
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080BC230: .4byte 0x03001620
_080BC234: .4byte 0x00000484
_080BC238: .4byte Sprite_64x32
_080BC23C: .4byte gUnk_08DB941C

	thumb_func_start sub_80BC240
sub_80BC240: @ 0x080BC240
	push {r4, r5, r6, lr}
	sub sp, #0x24
	adds r6, r0, #0
	ldr r1, _080BC34C @ =gUnk_086C450C
	mov r0, sp
	movs r2, #0x18
	bl memcpy
	mov r0, sp
	bl InitBgs
	movs r0, #1
	bl FadeBgmOut
	movs r4, #0
	str r4, [sp, #0x18]
	add r0, sp, #0x18
	movs r1, #0xc0
	lsls r1, r1, #0x13
	ldr r5, _080BC350 @ =0x01000008
	adds r2, r5, #0
	bl CpuFastSet
	str r4, [sp, #0x1c]
	add r0, sp, #0x1c
	ldr r1, _080BC354 @ =0x06008000
	adds r2, r5, #0
	bl CpuFastSet
	str r4, [sp, #0x20]
	add r0, sp, #0x20
	ldr r1, _080BC358 @ =0x06010000
	adds r2, r5, #0
	bl CpuFastSet
	ldr r5, _080BC35C @ =gPal
	movs r4, #0x1f
_080BC28A:
	ldr r0, _080BC360 @ =gUnk_0864AD14
	adds r1, r5, #0
	movs r2, #8
	bl CpuFastSet
	adds r5, #0x20
	subs r4, #1
	cmp r4, #0
	bge _080BC28A
	bl EnablePalSync
	ldr r4, _080BC364 @ =gDispIo
	adds r3, r4, #0
	adds r3, #0x3c
	movs r1, #0x3f
	ldrb r0, [r3]
	ands r1, r0
	adds r2, r4, #0
	adds r2, #0x44
	movs r0, #0
	strb r0, [r2]
	adds r2, #1
	strb r0, [r2]
	adds r2, #1
	strb r0, [r2]
	movs r0, #0x20
	orrs r1, r0
	strb r1, [r3]
	adds r1, r4, #0
	adds r1, #0x3d
	ldrb r2, [r1]
	orrs r0, r2
	strb r0, [r1]
	movs r0, #2
	rsbs r0, r0, #0
	ldrb r1, [r4, #1]
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
	strb r0, [r4, #1]
	movs r0, #2
	bl ResetTitleBgAffin
	adds r0, r6, #0
	bl sub_80BCFC4
	ldr r4, _080BC368 @ =gUnk_08630288
	ldr r1, _080BC36C @ =0x06017000
	adds r0, r4, #0
	bl Decompress
	ldr r1, _080BC370 @ =0x06017400
	adds r0, r4, #0
	bl Decompress
	ldr r1, _080BC374 @ =0x06017800
	adds r0, r4, #0
	bl Decompress
	ldr r1, _080BC378 @ =0x06017C00
	adds r0, r4, #0
	bl Decompress
	ldr r0, _080BC37C @ =gUnk_086618E8
	ldr r1, _080BC380 @ =gUnk_08DB8FC4
	ldr r1, [r1]
	bl Decompress
	ldr r0, _080BC384 @ =gUnk_086C261C
	ldr r1, _080BC388 @ =gUnk_08DB8FC8
	ldr r1, [r1]
	bl Decompress
	ldr r0, _080BC38C @ =gUnk_086C10D4
	ldr r1, _080BC390 @ =gUnk_08DB8FCC
	ldr r1, [r1]
	bl Decompress
	ldr r0, _080BC394 @ =ProcScr_08DB9030
	adds r1, r6, #0
	bl Proc_Start
	movs r0, #3
	bl SetNextGameAction
	add sp, #0x24
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080BC34C: .4byte gUnk_086C450C
_080BC350: .4byte 0x01000008
_080BC354: .4byte 0x06008000
_080BC358: .4byte 0x06010000
_080BC35C: .4byte gPal
_080BC360: .4byte gUnk_0864AD14
_080BC364: .4byte gDispIo
_080BC368: .4byte gUnk_08630288
_080BC36C: .4byte 0x06017000
_080BC370: .4byte 0x06017400
_080BC374: .4byte 0x06017800
_080BC378: .4byte 0x06017C00
_080BC37C: .4byte gUnk_086618E8
_080BC380: .4byte gUnk_08DB8FC4
_080BC384: .4byte gUnk_086C261C
_080BC388: .4byte gUnk_08DB8FC8
_080BC38C: .4byte gUnk_086C10D4
_080BC390: .4byte gUnk_08DB8FCC
_080BC394: .4byte ProcScr_08DB9030

	thumb_func_start sub_80BC398
sub_80BC398: @ 0x080BC398
	push {r4, r5, lr}
	sub sp, #4
	adds r4, r0, #0
	ldr r1, _080BC420 @ =gDispIo
	movs r2, #4
	rsbs r2, r2, #0
	adds r0, r2, #0
	ldrb r3, [r1, #0xc]
	ands r0, r3
	movs r3, #2
	orrs r0, r3
	strb r0, [r1, #0xc]
	adds r0, r2, #0
	ldrb r5, [r1, #0x10]
	ands r0, r5
	orrs r0, r3
	strb r0, [r1, #0x10]
	movs r0, #3
	ldrb r3, [r1, #0x14]
	orrs r0, r3
	strb r0, [r1, #0x14]
	ldrb r5, [r1, #0x18]
	ands r2, r5
	strb r2, [r1, #0x18]
	ldr r0, _080BC424 @ =gUnk_0862E778
	movs r1, #0xa0
	lsls r1, r1, #1
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r0, _080BC428 @ =gUnk_0862E798
	ldr r1, _080BC42C @ =0x0600C000
	bl Decompress
	ldr r0, _080BC430 @ =gBg3Tm
	ldr r1, _080BC434 @ =gUnk_0862EA60
	movs r2, #0xa2
	lsls r2, r2, #8
	bl TmApplyTsa_thm
	movs r0, #8
	bl EnableBgSync
	movs r0, #0
	str r0, [r4, #0x2c]
	ldr r0, _080BC438 @ =gUnk_08DB9A7C
	movs r2, #1
	rsbs r2, r2, #0
	str r4, [sp]
	movs r1, #2
	movs r3, #0
	bl sub_80BE2A8
	str r0, [r4, #0x3c]
	ldr r0, _080BC43C @ =gUnk_086C08D0
	movs r1, #0x98
	lsls r1, r1, #2
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r0, _080BC440 @ =gUnk_086C08F0
	ldr r1, _080BC444 @ =0x06013000
	bl Decompress
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080BC420: .4byte gDispIo
_080BC424: .4byte gUnk_0862E778
_080BC428: .4byte gUnk_0862E798
_080BC42C: .4byte 0x0600C000
_080BC430: .4byte gBg3Tm
_080BC434: .4byte gUnk_0862EA60
_080BC438: .4byte gUnk_08DB9A7C
_080BC43C: .4byte gUnk_086C08D0
_080BC440: .4byte gUnk_086C08F0
_080BC444: .4byte 0x06013000

	thumb_func_start sub_80BC448
sub_80BC448: @ 0x080BC448
	push {r4, lr}
	adds r4, r0, #0
	ldr r2, [r4, #0x2c]
	adds r2, #1
	str r2, [r4, #0x2c]
	ldr r0, _080BC4C0 @ =gDispIo
	mov ip, r0
	mov r3, ip
	adds r3, #0x3c
	movs r0, #0x3f
	ldrb r1, [r3]
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r3]
	asrs r2, r2, #1
	movs r0, #0x10
	subs r0, r0, r2
	mov r1, ip
	adds r1, #0x44
	movs r3, #0
	strb r0, [r1]
	mov r0, ip
	adds r0, #0x45
	strb r2, [r0]
	adds r0, #1
	strb r3, [r0]
	ldr r0, _080BC4C4 @ =0x0000FFE0
	mov r3, ip
	ldrh r3, [r3, #0x3c]
	ands r0, r3
	movs r1, #8
	orrs r0, r1
	ldr r1, _080BC4C8 @ =0x0000E0FF
	ands r0, r1
	movs r3, #0x80
	lsls r3, r3, #1
	adds r1, r3, #0
	orrs r0, r1
	mov r1, ip
	strh r0, [r1, #0x3c]
	cmp r2, #0x10
	bne _080BC4B8
	ldr r0, _080BC4CC @ =gBg3Tm
	movs r1, #0
	bl TmFill
	movs r0, #8
	bl EnableBgSync
	adds r0, r4, #0
	bl Proc_Break
	adds r0, r4, #0
	bl sub_80BE0A0
_080BC4B8:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080BC4C0: .4byte gDispIo
_080BC4C4: .4byte 0x0000FFE0
_080BC4C8: .4byte 0x0000E0FF
_080BC4CC: .4byte gBg3Tm

	thumb_func_start OpAnim_DrawWater
OpAnim_DrawWater: @ 0x080BC4D0
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _080BC520 @ =Pal_OpAnimWater
	movs r1, #0xe0
	lsls r1, r1, #1
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r0, _080BC524 @ =Img_OpAnimWater
	ldr r1, _080BC528 @ =0x06008000
	bl Decompress
	ldr r0, _080BC52C @ =gBg0Tm
	ldr r1, _080BC530 @ =Tsa_OpAnimWater
	movs r2, #0xe0
	lsls r2, r2, #8
	bl TmApplyTsa_thm
	ldr r2, _080BC534 @ =gDispIo
	movs r0, #0x3f
	ldrb r1, [r2, #0xd]
	ands r0, r1
	movs r1, #0x20
	orrs r0, r1
	strb r0, [r2, #0xd]
	movs r0, #1
	bl EnableBgSync
	bl sub_80BBAFC
	ldr r2, _080BC538 @ =0x03001620
	ldr r0, [r2]
	movs r1, #1
	orrs r0, r1
	str r0, [r2]
	movs r0, #0
	str r0, [r4, #0x2c]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080BC520: .4byte Pal_OpAnimWater
_080BC524: .4byte Img_OpAnimWater
_080BC528: .4byte 0x06008000
_080BC52C: .4byte gBg0Tm
_080BC530: .4byte Tsa_OpAnimWater
_080BC534: .4byte gDispIo
_080BC538: .4byte 0x03001620

	thumb_func_start sub_80BC53C
sub_80BC53C: @ 0x080BC53C
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r2, [r4, #0x2c]
	adds r2, #1
	str r2, [r4, #0x2c]
	ldr r0, _080BC5A4 @ =gDispIo
	mov ip, r0
	mov r3, ip
	adds r3, #0x3c
	movs r0, #0x3f
	ldrb r1, [r3]
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r3]
	asrs r2, r2, #2
	mov r0, ip
	adds r0, #0x44
	movs r3, #0
	strb r2, [r0]
	movs r0, #0x10
	subs r0, r0, r2
	mov r1, ip
	adds r1, #0x45
	strb r0, [r1]
	mov r0, ip
	adds r0, #0x46
	strb r3, [r0]
	ldr r0, _080BC5A8 @ =0x0000FFE0
	mov r5, ip
	ldrh r5, [r5, #0x3c]
	ands r0, r5
	movs r1, #1
	orrs r0, r1
	ldr r1, _080BC5AC @ =0x0000E0FF
	ands r0, r1
	movs r5, #0xf8
	lsls r5, r5, #5
	adds r1, r5, #0
	orrs r0, r1
	mov r1, ip
	strh r0, [r1, #0x3c]
	cmp r2, #0x10
	bne _080BC59C
	str r3, [r4, #0x2c]
	adds r0, r4, #0
	bl Proc_Break
_080BC59C:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080BC5A4: .4byte gDispIo
_080BC5A8: .4byte 0x0000FFE0
_080BC5AC: .4byte 0x0000E0FF

	thumb_func_start sub_80BC5B0
sub_80BC5B0: @ 0x080BC5B0
	push {lr}
	ldr r0, _080BC5C0 @ =gUnk_0864ACF4
	movs r1, #0
	movs r2, #0x20
	bl ApplyPaletteExt
	pop {r0}
	bx r0
	.align 2, 0
_080BC5C0: .4byte gUnk_0864ACF4

	thumb_func_start sub_80BC5C4
sub_80BC5C4: @ 0x080BC5C4
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	movs r0, #0x5c
	movs r1, #0x1e
	movs r2, #0
	bl StartBgmExt
	ldr r6, _080BC654 @ =gDispIo
	movs r0, #4
	rsbs r0, r0, #0
	ldrb r1, [r6, #0xc]
	ands r0, r1
	movs r1, #2
	orrs r0, r1
	strb r0, [r6, #0xc]
	movs r0, #3
	ldrb r1, [r6, #0x10]
	orrs r1, r0
	strb r1, [r6, #0x10]
	ldrb r1, [r6, #0x14]
	orrs r1, r0
	strb r1, [r6, #0x14]
	ldrb r2, [r6, #0x18]
	orrs r0, r2
	strb r0, [r6, #0x18]
	ldr r0, _080BC658 @ =gUnk_086284F8
	movs r1, #0x88
	lsls r1, r1, #2
	movs r2, #0x20
	bl ApplyPaletteExt
	movs r0, #4
	bl EnableBgSync
	movs r4, #0
	str r4, [r5, #0x2c]
	movs r0, #0
	bl sub_80BD4F4
	bl EndAllParallelWorkers
	ldr r0, _080BC65C @ =sub_80BC1E8
	adds r1, r5, #0
	bl StartParallelWorker
	adds r0, r5, #0
	bl sub_80BD83C
	adds r1, r6, #0
	adds r1, #0x3c
	movs r0, #0x3f
	ldrb r2, [r1]
	ands r0, r2
	strb r0, [r1]
	adds r0, r6, #0
	adds r0, #0x44
	strb r4, [r0]
	adds r0, #1
	strb r4, [r0]
	adds r0, #1
	strb r4, [r0]
	ldr r2, _080BC660 @ =0x03001620
	ldr r0, [r2]
	movs r1, #0x80
	orrs r0, r1
	str r0, [r2]
	str r4, [r5, #0x30]
	str r4, [r5, #0x38]
	str r4, [r5, #0x34]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080BC654: .4byte gDispIo
_080BC658: .4byte gUnk_086284F8
_080BC65C: .4byte sub_80BC1E8
_080BC660: .4byte 0x03001620

	thumb_func_start sub_80BC664
sub_80BC664: @ 0x080BC664
	push {lr}
	sub sp, #8
	ldr r0, _080BC684 @ =gUnk_086C0C4C
	movs r3, #0xe6
	lsls r3, r3, #6
	movs r1, #0
	str r1, [sp]
	movs r1, #0xa
	str r1, [sp, #4]
	movs r1, #0x78
	movs r2, #0x50
	bl StartSpriteAnimProc
	add sp, #8
	pop {r0}
	bx r0
	.align 2, 0
_080BC684: .4byte gUnk_086C0C4C

	thumb_func_start sub_80BC688
sub_80BC688: @ 0x080BC688
	push {r4, lr}
	movs r0, #0
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	ldr r4, _080BC710 @ =gBg0Tm
	adds r0, r4, #0
	movs r1, #0
	bl TmFill
	ldr r0, _080BC714 @ =gUnk_086C10B4
	movs r1, #0xd0
	lsls r1, r1, #1
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r0, _080BC718 @ =gUnk_08DB8FCC
	ldr r0, [r0]
	ldr r1, _080BC71C @ =0x06008000
	movs r2, #0x80
	lsls r2, r2, #4
	bl CpuFastSet
	ldr r1, _080BC720 @ =gUnk_086C2238
	movs r2, #0xd0
	lsls r2, r2, #8
	adds r0, r4, #0
	bl TmApplyTsa_thm
	movs r0, #1
	bl EnableBgSync
	ldr r3, _080BC724 @ =gDispIo
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
	adds r2, #9
	movs r0, #0x10
	strb r0, [r2]
	adds r0, r3, #0
	adds r0, #0x46
	strb r1, [r0]
	ldr r0, _080BC728 @ =0x0000FFE0
	ldrh r2, [r3, #0x3c]
	ands r0, r2
	movs r1, #1
	orrs r0, r1
	ldr r1, _080BC72C @ =0x0000E0FF
	ands r0, r1
	movs r2, #0xf8
	lsls r2, r2, #5
	adds r1, r2, #0
	orrs r0, r1
	strh r0, [r3, #0x3c]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080BC710: .4byte gBg0Tm
_080BC714: .4byte gUnk_086C10B4
_080BC718: .4byte gUnk_08DB8FCC
_080BC71C: .4byte 0x06008000
_080BC720: .4byte gUnk_086C2238
_080BC724: .4byte gDispIo
_080BC728: .4byte 0x0000FFE0
_080BC72C: .4byte 0x0000E0FF

	thumb_func_start sub_80BC730
sub_80BC730: @ 0x080BC730
	push {r4, lr}
	movs r0, #0
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	ldr r4, _080BC7B8 @ =gBg0Tm
	adds r0, r4, #0
	movs r1, #0
	bl TmFill
	ldr r0, _080BC7BC @ =gUnk_086C25FC
	movs r1, #0xd0
	lsls r1, r1, #1
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r0, _080BC7C0 @ =gUnk_08DB8FC8
	ldr r0, [r0]
	ldr r1, _080BC7C4 @ =0x06008000
	movs r2, #0x80
	lsls r2, r2, #4
	bl CpuFastSet
	ldr r1, _080BC7C8 @ =gUnk_086C38F4
	movs r2, #0xd0
	lsls r2, r2, #8
	adds r0, r4, #0
	bl TmApplyTsa_thm
	movs r0, #1
	bl EnableBgSync
	ldr r3, _080BC7CC @ =gDispIo
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
	adds r2, #9
	movs r0, #0x10
	strb r0, [r2]
	adds r0, r3, #0
	adds r0, #0x46
	strb r1, [r0]
	ldr r0, _080BC7D0 @ =0x0000FFE0
	ldrh r2, [r3, #0x3c]
	ands r0, r2
	movs r1, #1
	orrs r0, r1
	ldr r1, _080BC7D4 @ =0x0000E0FF
	ands r0, r1
	movs r2, #0xf8
	lsls r2, r2, #5
	adds r1, r2, #0
	orrs r0, r1
	strh r0, [r3, #0x3c]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080BC7B8: .4byte gBg0Tm
_080BC7BC: .4byte gUnk_086C25FC
_080BC7C0: .4byte gUnk_08DB8FC8
_080BC7C4: .4byte 0x06008000
_080BC7C8: .4byte gUnk_086C38F4
_080BC7CC: .4byte gDispIo
_080BC7D0: .4byte 0x0000FFE0
_080BC7D4: .4byte 0x0000E0FF

	thumb_func_start sub_80BC7D8
sub_80BC7D8: @ 0x080BC7D8
	push {r4, lr}
	movs r0, #0
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	bl sub_80BBD28
	ldr r4, _080BC830 @ =gBg0Tm
	adds r0, r4, #0
	movs r1, #0
	bl TmFill
	ldr r0, _080BC834 @ =gUnk_08661544
	movs r1, #0xd0
	lsls r1, r1, #1
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r0, _080BC838 @ =gUnk_08DB8FC4
	ldr r0, [r0]
	ldr r1, _080BC83C @ =0x06008000
	movs r2, #0x80
	lsls r2, r2, #3
	bl CpuFastSet
	adds r4, #0x80
	ldr r1, _080BC840 @ =gUnk_08661564
	movs r2, #0xd0
	lsls r2, r2, #8
	adds r0, r4, #0
	bl TmApplyTsa_thm
	ldr r2, _080BC844 @ =0x03001620
	ldr r0, [r2]
	movs r1, #0x20
	orrs r0, r1
	str r0, [r2]
	movs r0, #1
	bl EnableBgSync
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080BC830: .4byte gBg0Tm
_080BC834: .4byte gUnk_08661544
_080BC838: .4byte gUnk_08DB8FC4
_080BC83C: .4byte 0x06008000
_080BC840: .4byte gUnk_08661564
_080BC844: .4byte 0x03001620

	thumb_func_start sub_80BC848
sub_80BC848: @ 0x080BC848
	ldr r0, _080BC854 @ =0x03001620
	ldr r1, [r0]
	movs r2, #0x40
	orrs r1, r2
	str r1, [r0]
	bx lr
	.align 2, 0
_080BC854: .4byte 0x03001620

	thumb_func_start sub_80BC858
sub_80BC858: @ 0x080BC858
	push {lr}
	sub sp, #0xc
	movs r3, #1
	rsbs r3, r3, #0
	ldr r1, _080BC87C @ =gUnk_0864AD34
	ldr r2, _080BC880 @ =0x0000FFFF
	str r2, [sp]
	movs r2, #8
	str r2, [sp, #4]
	str r0, [sp, #8]
	adds r0, r3, #0
	movs r2, #0
	movs r3, #0x10
	bl sub_80BDD34
	add sp, #0xc
	pop {r0}
	bx r0
	.align 2, 0
_080BC87C: .4byte gUnk_0864AD34
_080BC880: .4byte 0x0000FFFF

	thumb_func_start sub_80BC884
sub_80BC884: @ 0x080BC884
	push {r4, lr}
	sub sp, #0xc
	adds r4, r0, #0
	bl sub_80BC664
	movs r0, #1
	rsbs r0, r0, #0
	ldr r1, _080BC8B0 @ =gUnk_0864AD54
	ldr r2, _080BC8B4 @ =0x0000FFFF
	str r2, [sp]
	movs r2, #8
	str r2, [sp, #4]
	str r4, [sp, #8]
	movs r2, #0
	movs r3, #0x10
	bl sub_80BDD34
	add sp, #0xc
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080BC8B0: .4byte gUnk_0864AD54
_080BC8B4: .4byte 0x0000FFFF

	thumb_func_start sub_80BC8B8
sub_80BC8B8: @ 0x080BC8B8
	push {r4, lr}
	sub sp, #4
	adds r4, r0, #0
	ldr r1, [r4, #0x38]
	ldr r2, [r4, #0x30]
	cmp r1, r2
	ble _080BC8DC
	ldr r0, [r4, #0x34]
	adds r0, r2, r0
	str r0, [r4, #0x30]
	cmp r0, r1
	ble _080BC8D2
	str r1, [r4, #0x30]
_080BC8D2:
	ldr r0, [r4, #0x3c]
	ldr r1, [r4, #0x30]
	rsbs r1, r1, #0
	bl sub_80BE1CC
_080BC8DC:
	ldr r1, [r4, #0x38]
	ldr r2, [r4, #0x30]
	cmp r1, r2
	bge _080BC8FA
	ldr r0, [r4, #0x34]
	subs r0, r2, r0
	str r0, [r4, #0x30]
	cmp r0, r1
	bge _080BC8F0
	str r1, [r4, #0x30]
_080BC8F0:
	ldr r0, [r4, #0x3c]
	ldr r1, [r4, #0x30]
	rsbs r1, r1, #0
	bl sub_80BE1CC
_080BC8FA:
	ldr r1, [r4, #0x2c]
	ldr r0, _080BC928 @ =0x000008A2
	cmp r1, r0
	bne _080BC904
	b _080BCA0E
_080BC904:
	cmp r1, r0
	bgt _080BC958
	movs r0, #0xaf
	lsls r0, r0, #3
	cmp r1, r0
	beq _080BC9E0
	cmp r1, r0
	bgt _080BC938
	subs r0, #0xb4
	cmp r1, r0
	beq _080BC9C4
	cmp r1, r0
	bgt _080BC92C
	movs r0, #0x96
	lsls r0, r0, #1
	cmp r1, r0
	beq _080BC9B8
	b _080BCA9C
	.align 2, 0
_080BC928: .4byte 0x000008A2
_080BC92C:
	ldr r0, _080BC934 @ =0x0000053C
	cmp r1, r0
	beq _080BC9D0
	b _080BCA9C
	.align 2, 0
_080BC934: .4byte 0x0000053C
_080BC938:
	movs r0, #0xdc
	lsls r0, r0, #3
	cmp r1, r0
	beq _080BCA04
	cmp r1, r0
	bgt _080BC94C
	subs r0, #0xb4
	cmp r1, r0
	beq _080BC9EC
	b _080BCA9C
_080BC94C:
	ldr r0, _080BC954 @ =0x0000080C
	cmp r1, r0
	beq _080BCA0E
	b _080BCA9C
	.align 2, 0
_080BC954: .4byte 0x0000080C
_080BC958:
	ldr r0, _080BC97C @ =0x00000B68
	cmp r1, r0
	bne _080BC960
	b _080BCA4C
_080BC960:
	cmp r1, r0
	bgt _080BC98C
	movs r0, #0xa0
	lsls r0, r0, #4
	cmp r1, r0
	bne _080BC96E
	b _080BCA84
_080BC96E:
	cmp r1, r0
	bgt _080BC980
	subs r0, #0xc8
	cmp r1, r0
	beq _080BCA16
	b _080BCA9C
	.align 2, 0
_080BC97C: .4byte 0x00000B68
_080BC980:
	ldr r0, _080BC988 @ =0x00000B2C
	cmp r1, r0
	beq _080BCA34
	b _080BCA9C
	.align 2, 0
_080BC988: .4byte 0x00000B2C
_080BC98C:
	ldr r0, _080BC9A0 @ =0x00000C58
	cmp r1, r0
	bne _080BC994
	b _080BCA84
_080BC994:
	cmp r1, r0
	bgt _080BC9A4
	subs r0, #0x64
	cmp r1, r0
	beq _080BCA6C
	b _080BCA9C
	.align 2, 0
_080BC9A0: .4byte 0x00000C58
_080BC9A4:
	ldr r0, _080BC9B4 @ =0x00000E74
	cmp r1, r0
	beq _080BCA8E
	movs r0, #0xfa
	lsls r0, r0, #4
	cmp r1, r0
	beq _080BCA96
	b _080BCA9C
	.align 2, 0
_080BC9B4: .4byte 0x00000E74
_080BC9B8:
	movs r0, #0xfa
	lsls r0, r0, #2
	adds r1, r4, #0
	bl sub_80BD464
	b _080BCA9C
_080BC9C4:
	ldr r0, _080BC9D8 @ =0x03001620
	ldr r1, [r0]
	movs r2, #0x80
	lsls r2, r2, #2
	orrs r1, r2
	str r1, [r0]
_080BC9D0:
	movs r0, #1
	rsbs r0, r0, #0
	ldr r1, _080BC9DC @ =gUnk_0864ACD4
	b _080BCA72
	.align 2, 0
_080BC9D8: .4byte 0x03001620
_080BC9DC: .4byte gUnk_0864ACD4
_080BC9E0:
	movs r0, #0x20
	str r0, [r4, #0x34]
	movs r0, #0x80
	lsls r0, r0, #2
	str r0, [r4, #0x38]
	b _080BCA9C
_080BC9EC:
	ldr r0, _080BCA00 @ =0x03001620
	ldr r1, [r0]
	movs r2, #0x80
	lsls r2, r2, #3
	orrs r1, r2
	str r1, [r0]
	bl sub_80BC7D8
	b _080BCA9C
	.align 2, 0
_080BCA00: .4byte 0x03001620
_080BCA04:
	movs r0, #0x20
	str r0, [r4, #0x34]
	movs r0, #0
	str r0, [r4, #0x38]
	b _080BCA9C
_080BCA0E:
	adds r0, r4, #0
	bl sub_80BC858
	b _080BCA9C
_080BCA16:
	adds r0, r4, #0
	bl sub_80BC884
	ldr r0, _080BCA2C @ =0x03001620
	ldr r1, [r0]
	ldr r2, _080BCA30 @ =0xFFFFF9FF
	ands r1, r2
	str r1, [r0]
	bl sub_80BC848
	b _080BCA9C
	.align 2, 0
_080BCA2C: .4byte 0x03001620
_080BCA30: .4byte 0xFFFFF9FF
_080BCA34:
	adds r0, r4, #0
	bl sub_80BC858
	ldr r0, _080BCA48 @ =0x03001620
	ldr r1, [r0]
	movs r2, #0x80
	lsls r2, r2, #4
	orrs r1, r2
	str r1, [r0]
	b _080BCA9C
	.align 2, 0
_080BCA48: .4byte 0x03001620
_080BCA4C:
	movs r0, #0x10
	str r0, [r4, #0x34]
	movs r0, #0xc0
	lsls r0, r0, #1
	str r0, [r4, #0x38]
	ldr r2, _080BCA64 @ =0x03001620
	ldr r0, [r2]
	ldr r1, _080BCA68 @ =0xFFFFF7FF
	ands r0, r1
	str r0, [r2]
	b _080BCA9C
	.align 2, 0
_080BCA64: .4byte 0x03001620
_080BCA68: .4byte 0xFFFFF7FF
_080BCA6C:
	movs r0, #1
	rsbs r0, r0, #0
	ldr r1, _080BCA80 @ =gUnk_0864ACB4
_080BCA72:
	str r4, [sp]
	movs r2, #0
	movs r3, #1
	bl sub_80BDC2C
	b _080BCA9C
	.align 2, 0
_080BCA80: .4byte gUnk_0864ACB4
_080BCA84:
	movs r0, #0x10
	str r0, [r4, #0x34]
	adds r0, #0xf0
	str r0, [r4, #0x38]
	b _080BCA9C
_080BCA8E:
	adds r0, r4, #0
	bl sub_80BD4E0
	b _080BCA9C
_080BCA96:
	adds r0, r4, #0
	bl Proc_Break
_080BCA9C:
	ldr r0, [r4, #0x2c]
	adds r0, #1
	str r0, [r4, #0x2c]
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_80BCAAC
sub_80BCAAC: @ 0x080BCAAC
	push {lr}
	movs r1, #0
	str r1, [r0, #0x2c]
	ldr r2, _080BCAC8 @ =0x03001620
	ldr r0, [r2]
	movs r1, #0x80
	lsls r1, r1, #1
	orrs r0, r1
	str r0, [r2]
	bl ArchiveCurrentPalettes
	pop {r0}
	bx r0
	.align 2, 0
_080BCAC8: .4byte 0x03001620

	thumb_func_start sub_80BCACC
sub_80BCACC: @ 0x080BCACC
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r0, [r5, #0x2c]
	lsls r4, r0, #3
	movs r1, #0x80
	lsls r1, r1, #1
	adds r4, r4, r1
	adds r0, #1
	str r0, [r5, #0x2c]
	adds r0, r4, #0
	adds r1, r4, #0
	adds r2, r4, #0
	movs r3, #1
	bl WriteFadedPaletteFromArchive
	movs r0, #0x80
	lsls r0, r0, #2
	cmp r4, r0
	bne _080BCAF8
	adds r0, r5, #0
	bl Proc_Break
_080BCAF8:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_80BCB00
sub_80BCB00: @ 0x080BCB00
	push {lr}
	movs r0, #2
	bl EnableBgSync
	pop {r0}
	bx r0

	thumb_func_start sub_80BCB0C
sub_80BCB0C: @ 0x080BCB0C
	push {lr}
	sub sp, #4
	movs r0, #0
	bl SetOnHBlankA
	bl sub_80BCFD8
	bl EndFadeInOut
	movs r0, #0
	str r0, [sp]
	ldr r1, _080BCB60 @ =gPal
	ldr r2, _080BCB64 @ =0x01000008
	mov r0, sp
	bl CpuFastSet
	bl EnablePalSync
	ldr r2, _080BCB68 @ =gDispIo
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
	movs r0, #2
	bl ResetTitleBgAffin
	bl EndEachSpriteAnimProc
	add sp, #4
	pop {r0}
	bx r0
	.align 2, 0
_080BCB60: .4byte gPal
_080BCB64: .4byte 0x01000008
_080BCB68: .4byte gDispIo

	thumb_func_start sub_80BCB6C
sub_80BCB6C: @ 0x080BCB6C
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r5, r0, #0
	ldr r6, _080BCBEC @ =gDispIo
	adds r1, r6, #0
	adds r1, #0x3c
	movs r0, #0x3f
	ldrb r2, [r1]
	ands r0, r2
	strb r0, [r1]
	adds r0, r6, #0
	adds r0, #0x44
	movs r4, #0
	strb r4, [r0]
	adds r0, #1
	strb r4, [r0]
	adds r0, #1
	strb r4, [r0]
	ldr r2, _080BCBF0 @ =0x03001620
	ldr r0, [r2]
	ldr r1, _080BCBF4 @ =0xFFFFFE1E
	ands r0, r1
	str r0, [r2]
	str r4, [sp]
	ldr r1, _080BCBF8 @ =0x06017000
	ldr r2, _080BCBFC @ =0x01000400
	mov r0, sp
	bl CpuFastSet
	movs r0, #2
	rsbs r0, r0, #0
	ldrb r1, [r6, #1]
	ands r0, r1
	movs r1, #3
	rsbs r1, r1, #0
	ands r0, r1
	subs r1, #2
	ands r0, r1
	subs r1, #4
	ands r0, r1
	movs r1, #0x10
	orrs r0, r1
	strb r0, [r6, #1]
	ldr r0, _080BCC00 @ =gUnk_086284F8
	movs r1, #0x88
	lsls r1, r1, #2
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r0, _080BCC04 @ =gUnk_0862B5B4
	movs r1, #0
	bl sub_80BD534
	ldr r0, _080BCC08 @ =gUnk_0862E4D0
	movs r1, #0x80
	lsls r1, r1, #4
	bl sub_80BD534
	str r4, [r5, #0x2c]
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080BCBEC: .4byte gDispIo
_080BCBF0: .4byte 0x03001620
_080BCBF4: .4byte 0xFFFFFE1E
_080BCBF8: .4byte 0x06017000
_080BCBFC: .4byte 0x01000400
_080BCC00: .4byte gUnk_086284F8
_080BCC04: .4byte gUnk_0862B5B4
_080BCC08: .4byte gUnk_0862E4D0

	thumb_func_start sub_80BCC0C
sub_80BCC0C: @ 0x080BCC0C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	adds r6, r0, #0
	ldr r7, [r6, #0x2c]
	adds r0, r7, #0
	movs r1, #0x78
	bl __modsi3
	cmp r0, #0
	bge _080BCC2A
	adds r0, #7
_080BCC2A:
	asrs r4, r0, #3
	lsls r0, r4, #1
	mov sb, r0
	adds r0, r7, #0
	movs r1, #0x78
	bl __divsi3
	adds r5, r0, #0
	lsls r0, r5, #1
	mov r8, r0
	movs r0, #8
	mov sl, r0
	str r0, [sp]
	lsls r4, r4, #6
	str r4, [sp, #4]
	str r7, [sp, #8]
	mov r0, sb
	mov r1, r8
	movs r2, #2
	movs r3, #2
	bl sub_80BD54C
	mov r0, sl
	str r0, [sp]
	lsls r5, r5, #0xb
	movs r0, #0x80
	lsls r0, r0, #4
	adds r5, r5, r0
	adds r4, r4, r5
	str r4, [sp, #4]
	ldr r0, [r6, #0x2c]
	str r0, [sp, #8]
	mov r0, sb
	mov r1, r8
	movs r2, #2
	movs r3, #2
	bl sub_80BD54C
	ldr r0, [r6, #0x2c]
	cmp r0, #0x78
	bne _080BCC88
	movs r0, #0
	str r0, [r6, #0x2c]
	adds r0, r6, #0
	bl Proc_Break
	b _080BCC8C
_080BCC88:
	adds r0, #1
	str r0, [r6, #0x2c]
_080BCC8C:
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_80BCC9C
sub_80BCC9C: @ 0x080BCC9C
	push {r4, r5, lr}
	sub sp, #0xc
	adds r5, r0, #0
	ldr r0, [r5, #0x2c]
	cmp r0, #0
	bne _080BCCB2
	movs r0, #0x5f
	movs r1, #0
	movs r2, #0
	bl StartBgmExt
_080BCCB2:
	ldr r1, [r5, #0x2c]
	cmp r1, #0x1f
	bgt _080BCCEC
	movs r4, #2
	str r4, [sp]
	movs r0, #0
	str r0, [sp, #4]
	str r1, [sp, #8]
	movs r1, #0
	movs r2, #0x20
	movs r3, #2
	bl sub_80BD614
	str r4, [sp]
	movs r0, #0x80
	lsls r0, r0, #4
	str r0, [sp, #4]
	ldr r0, [r5, #0x2c]
	str r0, [sp, #8]
	movs r0, #0
	movs r1, #0
	movs r2, #0x20
	movs r3, #2
	bl sub_80BD614
	ldr r0, [r5, #0x2c]
	adds r0, #1
	str r0, [r5, #0x2c]
	b _080BCCF2
_080BCCEC:
	adds r0, r5, #0
	bl Proc_Break
_080BCCF2:
	add sp, #0xc
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start nullsub_92
nullsub_92: @ 0x080BCCFC
	bx lr
	.align 2, 0

	thumb_func_start sub_80BCD00
sub_80BCD00: @ 0x080BCD00
	push {lr}
	sub sp, #4
	adds r2, r0, #0
	adds r0, #0x39
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _080BCD28
	ldr r0, [r2, #0x54]
	cmp r0, #1
	bne _080BCD28
	ldr r0, _080BCD30 @ =gUnk_086A511C
	adds r1, r0, #0
	adds r1, #0x20
	str r2, [sp]
	movs r2, #0xa
	movs r3, #0x10
	bl sub_80BDC2C
_080BCD28:
	movs r0, #0
	add sp, #4
	pop {r1}
	bx r1
	.align 2, 0
_080BCD30: .4byte gUnk_086A511C

	thumb_func_start OpAnim_DrawCloud
OpAnim_DrawCloud: @ 0x080BCD34
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #0x14
	mov r8, r0
	ldr r7, _080BCE5C @ =gDispIo
	movs r0, #2
	rsbs r0, r0, #0
	ldrb r1, [r7, #1]
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
	strb r0, [r7, #1]
	ldr r0, _080BCE60 @ =gBg0Tm
	movs r1, #0
	bl TmFill
	ldr r6, _080BCE64 @ =gBg1Tm
	adds r0, r6, #0
	movs r1, #0
	bl TmFill
	ldr r0, _080BCE68 @ =gBg2Tm
	movs r1, #0
	bl TmFill
	ldr r0, _080BCE6C @ =gBg3Tm
	movs r1, #0
	bl TmFill
	bl EndAllParallelWorkers
	movs r2, #4
	rsbs r2, r2, #0
	adds r0, r2, #0
	ldrb r1, [r7, #0xc]
	ands r0, r1
	strb r0, [r7, #0xc]
	adds r0, r2, #0
	ldrb r1, [r7, #0x10]
	ands r0, r1
	movs r1, #1
	orrs r0, r1
	strb r0, [r7, #0x10]
	movs r0, #3
	ldrb r1, [r7, #0x14]
	orrs r0, r1
	strb r0, [r7, #0x14]
	ldrb r0, [r7, #0x18]
	ands r2, r0
	movs r0, #2
	orrs r2, r0
	strb r2, [r7, #0x18]
	ldr r0, _080BCE70 @ =BmBgfxConf_OpAnim
	movs r5, #0
	str r5, [sp]
	movs r1, #0x80
	lsls r1, r1, #7
	str r1, [sp, #4]
	movs r1, #0xa
	str r1, [sp, #8]
	ldr r1, _080BCE74 @ =sub_80BCD00
	str r1, [sp, #0xc]
	mov r1, r8
	str r1, [sp, #0x10]
	movs r1, #0
	movs r2, #0
	movs r3, #0
	bl StartBmBgfx
	ldr r1, _080BCE78 @ =0x03001620
	ldr r0, [r1]
	movs r4, #0x10
	orrs r0, r4
	str r0, [r1]
	ldr r0, _080BCE7C @ =Pal_OpAnimCloud
	movs r1, #0xe0
	lsls r1, r1, #1
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r0, _080BCE80 @ =Img_OpAnimCloud
	movs r1, #0xc0
	lsls r1, r1, #0x13
	bl Decompress
	ldr r1, _080BCE84 @ =Tsa_OpAnimCloud
	movs r2, #0xe0
	lsls r2, r2, #8
	adds r0, r6, #0
	bl TmApplyTsa_thm
	ldr r0, _080BCE88 @ =gUnk_0862F448
	movs r1, #0xc0
	lsls r1, r1, #2
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r0, _080BCE8C @ =gUnk_0862F468
	ldr r1, _080BCE90 @ =0x06010000
	bl Decompress
	adds r2, r7, #0
	adds r2, #0x3c
	movs r0, #0x3f
	ldrb r1, [r2]
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r2]
	adds r0, r7, #0
	adds r0, #0x44
	strb r4, [r0]
	adds r0, #1
	strb r4, [r0]
	adds r0, #1
	strb r5, [r0]
	ldr r0, _080BCE94 @ =0x0000FFE0
	ldrh r2, [r7, #0x3c]
	ands r0, r2
	movs r1, #1
	orrs r0, r1
	ldr r1, _080BCE98 @ =0x0000E0FF
	ands r0, r1
	movs r2, #0x80
	lsls r2, r2, #2
	adds r1, r2, #0
	orrs r0, r1
	strh r0, [r7, #0x3c]
	mov r0, r8
	str r5, [r0, #0x2c]
	movs r0, #0xf
	bl EnableBgSync
	add sp, #0x14
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080BCE5C: .4byte gDispIo
_080BCE60: .4byte gBg0Tm
_080BCE64: .4byte gBg1Tm
_080BCE68: .4byte gBg2Tm
_080BCE6C: .4byte gBg3Tm
_080BCE70: .4byte BmBgfxConf_OpAnim
_080BCE74: .4byte sub_80BCD00
_080BCE78: .4byte 0x03001620
_080BCE7C: .4byte Pal_OpAnimCloud
_080BCE80: .4byte Img_OpAnimCloud
_080BCE84: .4byte Tsa_OpAnimCloud
_080BCE88: .4byte gUnk_0862F448
_080BCE8C: .4byte gUnk_0862F468
_080BCE90: .4byte 0x06010000
_080BCE94: .4byte 0x0000FFE0
_080BCE98: .4byte 0x0000E0FF

	thumb_func_start sub_80BCE9C
sub_80BCE9C: @ 0x080BCE9C
	ldr r2, _080BCEB8 @ =gDispIo
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
	strb r0, [r2, #1]
	bx lr
	.align 2, 0
_080BCEB8: .4byte gDispIo

	thumb_func_start sub_80BCEBC
sub_80BCEBC: @ 0x080BCEBC
	push {r4, r5, r6, lr}
	sub sp, #0x20
	adds r5, r0, #0
	mov r0, sp
	ldr r1, _080BCF88 @ =gUnk_086C4524
	ldm r1!, {r2, r3, r4}
	stm r0!, {r2, r3, r4}
	ldm r1!, {r2, r3, r4}
	stm r0!, {r2, r3, r4}
	ldm r1!, {r2, r3}
	stm r0!, {r2, r3}
	ldr r0, [r5, #0x2c]
	movs r1, #0xa
	bl __divsi3
	adds r6, r0, #0
	cmp r6, #0xf
	bgt _080BCF08
	ldr r4, _080BCF8C @ =gDispIo
	adds r2, r4, #0
	adds r2, #0x3c
	movs r0, #0x3f
	ldrb r1, [r2]
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r2]
	adds r2, #8
	movs r3, #0
	movs r1, #0x10
	movs r0, #0x10
	strb r0, [r2]
	subs r1, r1, r6
	adds r0, r4, #0
	adds r0, #0x45
	strb r1, [r0]
	adds r0, #1
	strb r3, [r0]
_080BCF08:
	ldr r4, [r5, #0x2c]
	adds r0, r4, #0
	movs r1, #0x10
	bl __modsi3
	cmp r0, #0
	bne _080BCF32
	adds r0, r4, #0
	movs r1, #0x10
	bl __divsi3
	adds r2, r0, #0
	cmp r2, #7
	bgt _080BCF32
	lsls r0, r2, #2
	add r0, sp
	ldr r1, [r0]
	adds r0, r2, #0
	adds r2, r5, #0
	bl sub_80BDB24
_080BCF32:
	ldr r0, [r5, #0x2c]
	cmp r0, #0xa0
	bne _080BCF78
	ldr r0, _080BCF90 @ =gBg1Tm
	movs r1, #0
	bl TmFill
	movs r0, #2
	bl EnableBgSync
	ldr r2, _080BCF8C @ =gDispIo
	adds r1, r2, #0
	adds r1, #0x3c
	movs r0, #0x3f
	ldrb r3, [r1]
	ands r0, r3
	strb r0, [r1]
	adds r0, r2, #0
	adds r0, #0x44
	movs r4, #0
	strb r4, [r0]
	adds r0, #1
	strb r4, [r0]
	adds r0, #1
	strb r4, [r0]
	movs r0, #0
	bl BmBgfxSetLoopEN
	adds r0, r5, #0
	bl Proc_Break
	ldr r0, _080BCF94 @ =gPal
	strh r4, [r0]
	bl EnablePalSync
_080BCF78:
	ldr r0, [r5, #0x2c]
	adds r0, #1
	str r0, [r5, #0x2c]
	add sp, #0x20
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080BCF88: .4byte gUnk_086C4524
_080BCF8C: .4byte gDispIo
_080BCF90: .4byte gBg1Tm
_080BCF94: .4byte gPal

	thumb_func_start sub_80BCF98
sub_80BCF98: @ 0x080BCF98
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _080BCFC0 @ =gpKeySt
	ldr r1, [r0]
	movs r0, #0xb
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _080BCFB8
	movs r0, #2
	bl SetNextGameAction
	ldr r0, [r4, #0x14]
	movs r1, #0x63
	bl Proc_Goto
_080BCFB8:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080BCFC0: .4byte gpKeySt

	thumb_func_start sub_80BCFC4
sub_80BCFC4: @ 0x080BCFC4
	push {lr}
	adds r1, r0, #0
	ldr r0, _080BCFD4 @ =ProcScr_08DB91A8
	bl Proc_Start
	pop {r0}
	bx r0
	.align 2, 0
_080BCFD4: .4byte ProcScr_08DB91A8

	thumb_func_start sub_80BCFD8
sub_80BCFD8: @ 0x080BCFD8
	push {lr}
	ldr r0, _080BCFE8 @ =ProcScr_08DB91A8
	bl Proc_Find
	bl Proc_End
	pop {r0}
	bx r0
	.align 2, 0
_080BCFE8: .4byte ProcScr_08DB91A8

	thumb_func_start sub_80BCFEC
sub_80BCFEC: @ 0x080BCFEC
	adds r1, r0, #0
	movs r2, #0
	b _080BCFF6
_080BCFF2:
	adds r2, #1
	adds r1, #0xc
_080BCFF6:
	ldr r0, [r1]
	cmp r0, #0
	bne _080BCFF2
	adds r0, r2, #0
	bx lr

	thumb_func_start sub_80BD000
sub_80BD000: @ 0x080BD000
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	ldr r0, _080BD098 @ =gUnk_08630338
	movs r1, #0xf0
	lsls r1, r1, #1
	movs r2, #0x20
	bl ApplyPaletteExt
	movs r4, #0
	str r4, [sp]
	ldr r1, _080BD09C @ =0x0600C000
	ldr r2, _080BD0A0 @ =0x01001000
	mov r0, sp
	bl CpuFastSet
	ldr r3, _080BD0A4 @ =gDispIo
	movs r1, #4
	rsbs r1, r1, #0
	adds r0, r1, #0
	ldrb r2, [r3, #0xc]
	ands r0, r2
	strb r0, [r3, #0xc]
	movs r0, #3
	ldrb r2, [r3, #0x10]
	orrs r2, r0
	strb r2, [r3, #0x10]
	ldrb r2, [r3, #0x14]
	orrs r0, r2
	strb r0, [r3, #0x14]
	ldrb r0, [r3, #0x18]
	ands r1, r0
	movs r0, #2
	orrs r1, r0
	strb r1, [r3, #0x18]
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
	strb r4, [r0]
	adds r0, #1
	strb r4, [r0]
	ldr r0, _080BD0A8 @ =0x0000FFE0
	ldrh r2, [r3, #0x3c]
	ands r0, r2
	movs r1, #1
	orrs r0, r1
	ldr r1, _080BD0AC @ =0x0000E0FF
	ands r0, r1
	movs r2, #0x80
	lsls r2, r2, #4
	adds r1, r2, #0
	orrs r0, r1
	strh r0, [r3, #0x3c]
	ldr r0, _080BD0B0 @ =gUnk_08DB95D8
	str r0, [r5, #0x3c]
	str r4, [r5, #0x2c]
	movs r1, #1
	str r1, [r5, #0x30]
	bl sub_80BCFEC
	str r0, [r5, #0x34]
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080BD098: .4byte gUnk_08630338
_080BD09C: .4byte 0x0600C000
_080BD0A0: .4byte 0x01001000
_080BD0A4: .4byte gDispIo
_080BD0A8: .4byte 0x0000FFE0
_080BD0AC: .4byte 0x0000E0FF
_080BD0B0: .4byte gUnk_08DB95D8

	thumb_func_start sub_80BD0B4
sub_80BD0B4: @ 0x080BD0B4
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x2c]
	movs r1, #3
	bl __modsi3
	cmp r0, #1
	beq _080BD0EC
	cmp r0, #1
	bgt _080BD0CE
	cmp r0, #0
	beq _080BD0D4
	b _080BD128
_080BD0CE:
	cmp r0, #2
	beq _080BD104
	b _080BD128
_080BD0D4:
	ldr r0, [r4, #0x3c]
	ldr r0, [r0]
	ldr r1, [r4, #0x30]
	lsls r1, r1, #0xd
	ldr r2, _080BD0E8 @ =0x0600C000
	adds r1, r1, r2
	bl Decompress
	b _080BD128
	.align 2, 0
_080BD0E8: .4byte 0x0600C000
_080BD0EC:
	ldr r0, [r4, #0x3c]
	ldr r0, [r0, #4]
	ldr r1, [r4, #0x30]
	lsls r1, r1, #0xd
	ldr r3, _080BD100 @ =0x0600D000
	adds r1, r1, r3
	bl Decompress
	b _080BD128
	.align 2, 0
_080BD100: .4byte 0x0600D000
_080BD104:
	ldr r0, _080BD18C @ =gBg3Tm
	ldr r1, [r4, #0x3c]
	ldr r1, [r1, #8]
	ldr r2, [r4, #0x30]
	lsls r2, r2, #0x18
	movs r3, #0xf2
	lsls r3, r3, #0x18
	adds r2, r2, r3
	lsrs r2, r2, #0x10
	bl TmApplyTsa_thm
	ldr r1, [r4, #0x30]
	movs r0, #1
	subs r0, r0, r1
	str r0, [r4, #0x30]
	movs r0, #8
	bl EnableBgSync
_080BD128:
	ldr r0, [r4, #0x2c]
	adds r5, r0, #1
	str r5, [r4, #0x2c]
	lsls r0, r5, #4
	ldr r6, [r4, #0x34]
	lsls r1, r6, #1
	adds r1, r1, r6
	bl __divsi3
	adds r7, r0, #0
	ldr r3, _080BD190 @ =gDispIo
	adds r2, r3, #0
	adds r2, #0x3c
	movs r0, #0x3f
	ldrb r1, [r2]
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r2]
	movs r0, #0x10
	subs r0, r0, r7
	lsls r2, r0, #1
	cmp r2, #0x10
	ble _080BD15A
	movs r2, #0x10
_080BD15A:
	adds r0, r3, #0
	adds r0, #0x44
	movs r1, #0
	strb r2, [r0]
	adds r0, #1
	strb r7, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r0, r5, #0
	movs r1, #3
	bl __modsi3
	cmp r0, #0
	bne _080BD194
	adds r0, r5, #0
	movs r1, #3
	bl __divsi3
	ldr r1, [r4, #0x3c]
	adds r1, #0xc
	str r1, [r4, #0x3c]
	cmp r0, r6
	bne _080BD194
	movs r0, #1
	b _080BD196
	.align 2, 0
_080BD18C: .4byte gBg3Tm
_080BD190: .4byte gDispIo
_080BD194:
	movs r0, #0
_080BD196:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	thumb_func_start sub_80BD19C
sub_80BD19C: @ 0x080BD19C
	push {r4, lr}
	adds r4, r0, #0
	ldr r2, _080BD1E4 @ =0x02007014
	ldr r0, [r2, #8]
	ldr r1, _080BD1E8 @ =0x000005FF
	cmp r0, r1
	bgt _080BD1B2
	movs r3, #0x80
	lsls r3, r3, #1
	adds r0, r0, r3
	str r0, [r2, #8]
_080BD1B2:
	ldr r0, [r2, #0xc]
	cmp r0, r1
	bgt _080BD1BC
	adds r0, #0x20
	str r0, [r2, #0xc]
_080BD1BC:
	ldr r1, [r2, #0x10]
	ldr r0, _080BD1EC @ =0x000008FF
	cmp r1, r0
	bgt _080BD1CA
	adds r0, r1, #0
	adds r0, #0x20
	str r0, [r2, #0x10]
_080BD1CA:
	adds r0, r4, #0
	bl sub_80BD0B4
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080BD1DC
	adds r0, r4, #0
	bl Proc_Break
_080BD1DC:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080BD1E4: .4byte 0x02007014
_080BD1E8: .4byte 0x000005FF
_080BD1EC: .4byte 0x000008FF

	thumb_func_start sub_80BD1F0
sub_80BD1F0: @ 0x080BD1F0
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	movs r6, #0
	str r6, [r5, #0x2c]
	ldr r0, _080BD2B0 @ =gUnk_08DB9674
	str r0, [r5, #0x3c]
	bl sub_80BCFEC
	str r0, [r5, #0x34]
	ldr r7, _080BD2B4 @ =gDispIo
	movs r2, #4
	rsbs r2, r2, #0
	adds r0, r2, #0
	ldrb r1, [r7, #0xc]
	ands r0, r1
	movs r1, #2
	orrs r0, r1
	strb r0, [r7, #0xc]
	movs r0, #3
	ldrb r1, [r7, #0x10]
	orrs r1, r0
	strb r1, [r7, #0x10]
	ldrb r1, [r7, #0x14]
	orrs r0, r1
	strb r0, [r7, #0x14]
	ldrb r0, [r7, #0x18]
	ands r2, r0
	movs r0, #1
	orrs r2, r0
	strb r2, [r7, #0x18]
	ldr r0, _080BD2B8 @ =gBg0Tm
	movs r1, #0
	bl TmFill
	movs r0, #1
	bl EnableBgSync
	ldr r4, _080BD2BC @ =0x03001620
	ldr r0, [r4]
	movs r1, #2
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r4]
	adds r2, r7, #0
	adds r2, #0x3c
	movs r0, #0x3f
	ldrb r1, [r2]
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r2]
	adds r1, r7, #0
	adds r1, #0x44
	movs r0, #0x10
	strb r0, [r1]
	adds r0, r7, #0
	adds r0, #0x45
	strb r6, [r0]
	adds r0, #1
	strb r6, [r0]
	ldr r0, _080BD2C0 @ =0x0000FFE0
	ldrh r2, [r7, #0x3c]
	ands r0, r2
	movs r1, #8
	orrs r0, r1
	ldr r1, _080BD2C4 @ =0x0000E0FF
	ands r0, r1
	movs r2, #0xf8
	lsls r2, r2, #5
	adds r1, r2, #0
	orrs r0, r1
	strh r0, [r7, #0x3c]
	ldr r0, [r5, #0x14]
	movs r1, #0
	bl Proc_Goto
	bl sub_80BBAFC
	ldr r1, _080BD2C8 @ =0x02007014
	movs r0, #0xc0
	lsls r0, r0, #2
	str r0, [r1, #8]
	str r0, [r1, #4]
	movs r0, #0xc8
	lsls r0, r0, #1
	str r0, [r1, #0xc]
	movs r0, #0xc8
	lsls r0, r0, #2
	str r0, [r1, #0x10]
	ldr r0, [r4]
	movs r1, #4
	orrs r0, r1
	str r0, [r4]
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080BD2B0: .4byte gUnk_08DB9674
_080BD2B4: .4byte gDispIo
_080BD2B8: .4byte gBg0Tm
_080BD2BC: .4byte 0x03001620
_080BD2C0: .4byte 0x0000FFE0
_080BD2C4: .4byte 0x0000E0FF
_080BD2C8: .4byte 0x02007014

	thumb_func_start sub_80BD2CC
sub_80BD2CC: @ 0x080BD2CC
	push {r4, lr}
	adds r4, r0, #0
	bl sub_80BD0B4
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080BD2FA
	movs r0, #0
	str r0, [r4, #0x2c]
	adds r0, r4, #0
	bl Proc_Break
	ldr r0, _080BD300 @ =gBg3Tm
	movs r1, #0
	bl TmFill
	movs r0, #8
	bl EnableBgSync
	ldr r0, [r4, #0x14]
	movs r1, #1
	bl Proc_Goto
_080BD2FA:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080BD300: .4byte gBg3Tm

	thumb_func_start sub_80BD304
sub_80BD304: @ 0x080BD304
	push {r4, r5, r6, lr}
	adds r1, r0, #0
	ldr r2, [r1, #0x2c]
	movs r0, #0xc8
	lsls r0, r0, #1
	cmp r2, r0
	bne _080BD31A
	adds r0, r1, #0
	bl Proc_Break
	b _080BD34E
_080BD31A:
	adds r0, r2, #1
	str r0, [r1, #0x2c]
	cmp r0, #0x8c
	ble _080BD34E
	subs r0, #0x8c
	movs r6, #0x80
	lsls r6, r6, #1
	cmp r0, r6
	bgt _080BD34E
	ldr r5, _080BD354 @ =0x02007014
	subs r0, r6, r0
	lsls r4, r0, #1
	adds r4, r4, r0
	lsls r4, r4, #3
	adds r4, r4, r0
	lsls r0, r4, #5
	adds r1, r6, #0
	bl __divsi3
	str r0, [r5, #0x10]
	lsls r4, r4, #4
	adds r0, r4, #0
	adds r1, r6, #0
	bl __divsi3
	str r0, [r5, #0xc]
_080BD34E:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080BD354: .4byte 0x02007014

	thumb_func_start sub_80BD358
sub_80BD358: @ 0x080BD358
	ldr r0, _080BD368 @ =0x03001620
	ldr r1, [r0]
	movs r2, #5
	rsbs r2, r2, #0
	ands r1, r2
	str r1, [r0]
	bx lr
	.align 2, 0
_080BD368: .4byte 0x03001620

	thumb_func_start sub_80BD36C
sub_80BD36C: @ 0x080BD36C
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #8
	bl sub_8003E68
	ldr r0, _080BD398 @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080BD388
	movs r0, #0x62
	bl m4aSongNumStart
_080BD388:
	ldr r0, _080BD39C @ =ProcScr_08DB91C0
	adds r1, r4, #0
	bl Proc_Start
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080BD398: .4byte gPlaySt
_080BD39C: .4byte ProcScr_08DB91C0

	thumb_func_start sub_80BD3A0
sub_80BD3A0: @ 0x080BD3A0
	push {lr}
	movs r1, #0
	str r1, [r0, #0x2c]
	bl sub_80BC730
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_80BD3B0
sub_80BD3B0: @ 0x080BD3B0
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r5, [r4, #0x2c]
	adds r3, r5, #1
	str r3, [r4, #0x2c]
	cmp r3, #0x40
	bgt _080BD3F2
	ldr r0, _080BD45C @ =gDispIo
	mov ip, r0
	adds r0, #0x3c
	movs r1, #0x3f
	ldrb r2, [r0]
	ands r1, r2
	movs r2, #0x40
	orrs r1, r2
	strb r1, [r0]
	adds r1, r3, #0
	cmp r1, #0
	bge _080BD3DA
	adds r1, r5, #0
	adds r1, #8
_080BD3DA:
	asrs r1, r1, #3
	mov r0, ip
	adds r0, #0x44
	movs r2, #0
	strb r1, [r0]
	mov r1, ip
	adds r1, #0x45
	movs r0, #0x10
	strb r0, [r1]
	mov r0, ip
	adds r0, #0x46
	strb r2, [r0]
_080BD3F2:
	ldr r1, [r4, #0x2c]
	lsls r1, r1, #0xf
	lsrs r1, r1, #0x10
	movs r0, #0
	movs r2, #0
	bl SetBgOffset
	ldr r1, [r4, #0x2c]
	ldr r0, [r4, #0x30]
	cmp r1, r0
	ble _080BD456
	subs r0, r1, r0
	cmp r0, #0
	bge _080BD410
	adds r0, #7
_080BD410:
	asrs r0, r0, #3
	movs r3, #8
	subs r3, r3, r0
	ldr r0, _080BD45C @ =gDispIo
	mov ip, r0
	mov r2, ip
	adds r2, #0x3c
	movs r0, #0x3f
	ldrb r1, [r2]
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r2]
	mov r0, ip
	adds r0, #0x44
	movs r1, #0
	strb r3, [r0]
	adds r2, #9
	movs r0, #0x10
	strb r0, [r2]
	mov r0, ip
	adds r0, #0x46
	strb r1, [r0]
	cmp r3, #0
	bne _080BD456
	adds r0, r4, #0
	bl Proc_Break
	ldr r0, _080BD460 @ =gBg0Tm
	movs r1, #0
	bl TmFill
	movs r0, #1
	bl EnableBgSync
_080BD456:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080BD45C: .4byte gDispIo
_080BD460: .4byte gBg0Tm

	thumb_func_start sub_80BD464
sub_80BD464: @ 0x080BD464
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _080BD478 @ =ProcScr_08DB9208
	bl Proc_Start
	str r4, [r0, #0x30]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080BD478: .4byte ProcScr_08DB9208

	thumb_func_start sub_80BD47C
sub_80BD47C: @ 0x080BD47C
	push {lr}
	movs r1, #0
	str r1, [r0, #0x2c]
	bl sub_80BC688
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_80BD48C
sub_80BD48C: @ 0x080BD48C
	push {r4, lr}
	ldr r4, [r0, #0x2c]
	adds r3, r4, #1
	str r3, [r0, #0x2c]
	cmp r3, #0x80
	bgt _080BD4D4
	ldr r0, _080BD4D0 @ =gDispIo
	mov ip, r0
	adds r0, #0x3c
	movs r1, #0x3f
	ldrb r2, [r0]
	ands r1, r2
	movs r2, #0x40
	orrs r1, r2
	strb r1, [r0]
	adds r1, r3, #0
	cmp r1, #0
	bge _080BD4B4
	adds r1, r4, #0
	adds r1, #8
_080BD4B4:
	asrs r1, r1, #3
	mov r0, ip
	adds r0, #0x44
	movs r2, #0
	strb r1, [r0]
	mov r1, ip
	adds r1, #0x45
	movs r0, #0x10
	strb r0, [r1]
	mov r0, ip
	adds r0, #0x46
	strb r2, [r0]
	b _080BD4D8
	.align 2, 0
_080BD4D0: .4byte gDispIo
_080BD4D4:
	bl Proc_Break
_080BD4D8:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_80BD4E0
sub_80BD4E0: @ 0x080BD4E0
	push {lr}
	adds r1, r0, #0
	ldr r0, _080BD4F0 @ =gUnk_08DB9228
	bl Proc_Start
	pop {r0}
	bx r0
	.align 2, 0
_080BD4F0: .4byte gUnk_08DB9228

	thumb_func_start sub_80BD4F4
sub_80BD4F4: @ 0x080BD4F4
	push {lr}
	sub sp, #8
	cmp r0, #0
	beq _080BD502
	cmp r0, #1
	beq _080BD518
	b _080BD526
_080BD502:
	str r0, [sp]
	ldr r1, _080BD510 @ =0x06014000
	ldr r2, _080BD514 @ =0x01000200
	mov r0, sp
	bl CpuFastSet
	b _080BD526
	.align 2, 0
_080BD510: .4byte 0x06014000
_080BD514: .4byte 0x01000200
_080BD518:
	movs r0, #0
	str r0, [sp, #4]
	add r0, sp, #4
	ldr r1, _080BD52C @ =0x06014800
	ldr r2, _080BD530 @ =0x01000600
	bl CpuFastSet
_080BD526:
	add sp, #8
	pop {r0}
	bx r0
	.align 2, 0
_080BD52C: .4byte 0x06014800
_080BD530: .4byte 0x01000600

	thumb_func_start sub_80BD534
sub_80BD534: @ 0x080BD534
	push {lr}
	adds r2, r1, #0
	ldr r1, _080BD548 @ =gUnk_08DB8FC0
	ldr r1, [r1]
	adds r1, r1, r2
	bl Decompress
	pop {r0}
	bx r0
	.align 2, 0
_080BD548: .4byte gUnk_08DB8FC0

	thumb_func_start sub_80BD54C
sub_80BD54C: @ 0x080BD54C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x14
	str r2, [sp]
	str r3, [sp, #4]
	ldr r4, [sp, #0x3c]
	ldr r0, [sp, #0x34]
	muls r4, r0, r4
	movs r1, #0
	mov sb, r1
	cmp sb, r3
	bge _080BD5F6
_080BD56A:
	movs r3, #0
	mov r0, sb
	adds r0, #1
	str r0, [sp, #8]
	ldr r1, [sp]
	cmp r3, r1
	bge _080BD5EC
	ldr r0, _080BD608 @ =gUnk_08DB9248
	str r0, [sp, #0xc]
	ldr r1, _080BD60C @ =gUnk_08DB8FC0
	str r1, [sp, #0x10]
_080BD580:
	adds r0, r3, #1
	mov sl, r0
	ldr r1, [sp, #0x34]
	cmp r1, #0
	ble _080BD5E4
	movs r0, #0x3f
	mov ip, r0
	lsls r7, r3, #5
	mov r1, sb
	lsls r6, r1, #0xa
	ldr r0, [sp, #0x10]
	mov r8, r0
	ldr r5, [sp, #0x34]
_080BD59A:
	mov r1, ip
	ands r4, r1
	mov r0, r8
	ldr r2, [r0]
	ldr r1, [sp, #0x38]
	adds r2, r2, r1
	adds r2, r2, r7
	adds r2, r2, r6
	adds r3, r7, r1
	adds r3, r3, r6
	ldr r0, _080BD610 @ =0x06014000
	adds r3, r3, r0
	adds r0, r4, #0
	mov r1, ip
	ands r0, r1
	lsls r0, r0, #1
	ldr r1, _080BD608 @ =gUnk_08DB9248
	adds r0, r0, r1
	ldrh r1, [r0]
	lsrs r0, r1, #3
	lsls r0, r0, #2
	adds r2, r2, r0
	adds r3, r3, r0
	movs r0, #7
	ands r0, r1
	lsls r0, r0, #2
	movs r1, #0xf
	lsls r1, r0
	ldr r2, [r2]
	ands r2, r1
	ldr r0, [r3]
	orrs r0, r2
	str r0, [r3]
	adds r4, #1
	subs r5, #1
	cmp r5, #0
	bne _080BD59A
_080BD5E4:
	mov r3, sl
	ldr r0, [sp]
	cmp r3, r0
	blt _080BD580
_080BD5EC:
	ldr r1, [sp, #8]
	mov sb, r1
	ldr r0, [sp, #4]
	cmp sb, r0
	blt _080BD56A
_080BD5F6:
	add sp, #0x14
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080BD608: .4byte gUnk_08DB9248
_080BD60C: .4byte gUnk_08DB8FC0
_080BD610: .4byte 0x06014000

	thumb_func_start sub_80BD614
sub_80BD614: @ 0x080BD614
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x14
	str r2, [sp]
	str r3, [sp, #4]
	ldr r4, [sp, #0x3c]
	ldr r0, [sp, #0x34]
	muls r4, r0, r4
	movs r1, #0
	mov sb, r1
	cmp sb, r3
	bge _080BD6BE
_080BD632:
	movs r3, #0
	mov r0, sb
	adds r0, #1
	str r0, [sp, #8]
	ldr r1, [sp]
	cmp r3, r1
	bge _080BD6B4
	ldr r0, _080BD6D0 @ =gUnk_08DB9248
	str r0, [sp, #0xc]
	ldr r1, _080BD6D4 @ =gUnk_08DB8FC0
	str r1, [sp, #0x10]
_080BD648:
	adds r0, r3, #1
	mov sl, r0
	ldr r1, [sp, #0x34]
	cmp r1, #0
	ble _080BD6AC
	movs r0, #0x3f
	mov ip, r0
	lsls r7, r3, #5
	mov r1, sb
	lsls r6, r1, #0xa
	ldr r0, [sp, #0x10]
	mov r8, r0
	ldr r5, [sp, #0x34]
_080BD662:
	mov r1, ip
	ands r4, r1
	mov r0, r8
	ldr r2, [r0]
	ldr r1, [sp, #0x38]
	adds r2, r2, r1
	adds r2, r2, r7
	adds r2, r2, r6
	adds r3, r7, r1
	adds r3, r3, r6
	ldr r0, _080BD6D8 @ =0x06014000
	adds r3, r3, r0
	adds r0, r4, #0
	mov r1, ip
	ands r0, r1
	lsls r0, r0, #1
	ldr r1, _080BD6D0 @ =gUnk_08DB9248
	adds r0, r0, r1
	ldrh r1, [r0]
	lsrs r0, r1, #3
	lsls r0, r0, #2
	adds r2, r2, r0
	adds r3, r3, r0
	movs r0, #7
	ands r0, r1
	lsls r0, r0, #2
	movs r1, #0xf
	lsls r1, r0
	ldr r2, [r2]
	bics r2, r1
	ldr r0, [r3]
	ands r0, r2
	str r0, [r3]
	adds r4, #1
	subs r5, #1
	cmp r5, #0
	bne _080BD662
_080BD6AC:
	mov r3, sl
	ldr r0, [sp]
	cmp r3, r0
	blt _080BD648
_080BD6B4:
	ldr r1, [sp, #8]
	mov sb, r1
	ldr r0, [sp, #4]
	cmp sb, r0
	blt _080BD632
_080BD6BE:
	add sp, #0x14
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080BD6D0: .4byte gUnk_08DB9248
_080BD6D4: .4byte gUnk_08DB8FC0
_080BD6D8: .4byte 0x06014000

	thumb_func_start sub_80BD6DC
sub_80BD6DC: @ 0x080BD6DC
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r0, _080BD704 @ =gUnk_086284F8
	movs r1, #0x88
	lsls r1, r1, #2
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r0, _080BD708 @ =gUnk_08DB947C
	str r0, [r5, #0x2c]
	movs r4, #0
	str r4, [r5, #0x38]
	movs r0, #0
	bl sub_80BD4F4
	str r4, [r5, #0x3c]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080BD704: .4byte gUnk_086284F8
_080BD708: .4byte gUnk_08DB947C

	thumb_func_start sub_80BD70C
sub_80BD70C: @ 0x080BD70C
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #0xc
	adds r4, r0, #0
	ldr r0, [r4, #0x3c]
	cmp r0, #0
	bne _080BD744
	ldr r0, [r4, #0x2c]
	bl sub_80BE0B4
	str r0, [r4, #0x30]
	cmp r0, #0
	bne _080BD744
	ldr r0, [r4, #0x2c]
	ldr r0, [r0, #8]
	cmp r0, #0
	bne _080BD73C
	adds r0, r4, #0
	movs r1, #0x63
	bl Proc_Goto
	b _080BD7BA
_080BD73C:
	adds r0, r4, #0
	bl Proc_Break
	b _080BD7BA
_080BD744:
	movs r0, #0xe0
	ldr r1, [r4, #0x30]
	muls r0, r1, r0
	ldr r6, [r4, #0x3c]
	cmp r6, r0
	bge _080BD7B4
	adds r0, r6, #0
	movs r1, #0xe0
	bl __modsi3
	adds r5, r0, #0
	adds r1, r5, #0
	cmp r5, #0
	bge _080BD762
	adds r1, #0xf
_080BD762:
	asrs r7, r1, #4
	lsls r0, r7, #1
	mov sb, r0
	adds r0, r6, #0
	movs r1, #0xe0
	bl __divsi3
	adds r6, r0, #0
	lsls r0, r6, #1
	mov r8, r0
	cmp r5, #0
	bne _080BD78C
	ldr r0, [r4, #0x2c]
	lsls r1, r6, #2
	adds r0, r0, r1
	ldr r0, [r0]
	lsls r2, r6, #0xb
	ldr r1, [r4, #0x38]
	adds r1, r1, r2
	bl sub_80BD534
_080BD78C:
	movs r0, #4
	str r0, [sp]
	lsls r1, r7, #6
	ldr r0, [r4, #0x38]
	adds r0, r0, r1
	lsls r1, r6, #0xb
	adds r0, r0, r1
	str r0, [sp, #4]
	ldr r0, [r4, #0x3c]
	str r0, [sp, #8]
	mov r0, sb
	mov r1, r8
	movs r2, #2
	movs r3, #2
	bl sub_80BD54C
	ldr r0, [r4, #0x3c]
	adds r0, #1
	str r0, [r4, #0x3c]
	b _080BD7BA
_080BD7B4:
	adds r0, r4, #0
	bl Proc_Break
_080BD7BA:
	add sp, #0xc
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_80BD7C8
sub_80BD7C8: @ 0x080BD7C8
	push {lr}
	adds r2, r0, #0
	ldr r1, [r2, #0x3c]
	adds r1, #1
	str r1, [r2, #0x3c]
	ldr r0, [r2, #0x2c]
	ldr r0, [r0, #8]
	subs r0, #0x20
	cmp r1, r0
	blt _080BD7E6
	movs r0, #0
	str r0, [r2, #0x3c]
	adds r0, r2, #0
	bl Proc_Break
_080BD7E6:
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_80BD7EC
sub_80BD7EC: @ 0x080BD7EC
	push {r4, lr}
	sub sp, #0xc
	adds r4, r0, #0
	ldr r1, [r4, #0x3c]
	cmp r1, #0x1f
	bgt _080BD818
	ldr r3, [r4, #0x30]
	lsls r3, r3, #1
	movs r0, #2
	str r0, [sp]
	ldr r0, [r4, #0x38]
	str r0, [sp, #4]
	str r1, [sp, #8]
	movs r0, #0
	movs r1, #0
	movs r2, #0x1e
	bl sub_80BD614
	ldr r0, [r4, #0x3c]
	adds r0, #1
	str r0, [r4, #0x3c]
	b _080BD828
_080BD818:
	movs r0, #0
	str r0, [r4, #0x3c]
	ldr r0, [r4, #0x2c]
	adds r0, #0xc
	str r0, [r4, #0x2c]
	adds r0, r4, #0
	bl Proc_Break
_080BD828:
	add sp, #0xc
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_80BD830
sub_80BD830: @ 0x080BD830
	push {lr}
	movs r0, #0
	bl sub_80BD4F4
	pop {r0}
	bx r0

	thumb_func_start sub_80BD83C
sub_80BD83C: @ 0x080BD83C
	push {lr}
	adds r1, r0, #0
	ldr r0, _080BD84C @ =gUnk_08DB92C8
	bl Proc_Start
	pop {r0}
	bx r0
	.align 2, 0
_080BD84C: .4byte gUnk_08DB92C8

	thumb_func_start sub_80BD850
sub_80BD850: @ 0x080BD850
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _080BD87C @ =gUnk_086284F8
	movs r1, #0x88
	lsls r1, r1, #2
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r0, _080BD880 @ =gUnk_08DB9548
	str r0, [r4, #0x2c]
	movs r0, #0x80
	lsls r0, r0, #4
	str r0, [r4, #0x38]
	movs r0, #1
	bl sub_80BD4F4
	movs r0, #0
	str r0, [r4, #0x3c]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080BD87C: .4byte gUnk_086284F8
_080BD880: .4byte gUnk_08DB9548

	thumb_func_start sub_80BD884
sub_80BD884: @ 0x080BD884
	push {r4, r5, lr}
	sub sp, #0xc
	adds r4, r0, #0
	ldr r0, [r4, #0x3c]
	cmp r0, #0
	bne _080BD8CE
	ldr r0, [r4, #0x2c]
	bl sub_80BE0B4
	str r0, [r4, #0x30]
	cmp r0, #0
	bne _080BD8AE
	ldr r0, [r4, #0x2c]
	ldr r0, [r0, #8]
	cmp r0, #0
	bne _080BD8D4
	adds r0, r4, #0
	movs r1, #0x63
	bl Proc_Goto
	b _080BD8FA
_080BD8AE:
	movs r5, #0
	cmp r5, r0
	bge _080BD8CE
_080BD8B4:
	ldr r0, [r4, #0x2c]
	lsls r1, r5, #2
	adds r0, r0, r1
	ldr r0, [r0]
	lsls r2, r5, #0xb
	ldr r1, [r4, #0x38]
	adds r1, r1, r2
	bl sub_80BD534
	adds r5, #1
	ldr r0, [r4, #0x30]
	cmp r5, r0
	blt _080BD8B4
_080BD8CE:
	ldr r1, [r4, #0x3c]
	cmp r1, #0x3f
	ble _080BD8DC
_080BD8D4:
	adds r0, r4, #0
	bl Proc_Break
	b _080BD8FA
_080BD8DC:
	ldr r3, [r4, #0x30]
	lsls r3, r3, #1
	movs r0, #1
	str r0, [sp]
	ldr r0, [r4, #0x38]
	str r0, [sp, #4]
	str r1, [sp, #8]
	movs r0, #0
	movs r1, #0
	movs r2, #0x1e
	bl sub_80BD54C
	ldr r0, [r4, #0x3c]
	adds r0, #1
	str r0, [r4, #0x3c]
_080BD8FA:
	add sp, #0xc
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_80BD904
sub_80BD904: @ 0x080BD904
	push {lr}
	adds r2, r0, #0
	ldr r1, [r2, #0x3c]
	adds r1, #1
	str r1, [r2, #0x3c]
	ldr r0, [r2, #0x2c]
	ldr r0, [r0, #8]
	subs r0, #0x20
	cmp r1, r0
	blt _080BD922
	movs r0, #0
	str r0, [r2, #0x3c]
	adds r0, r2, #0
	bl Proc_Break
_080BD922:
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_80BD928
sub_80BD928: @ 0x080BD928
	push {r4, lr}
	sub sp, #0xc
	adds r4, r0, #0
	ldr r1, [r4, #0x3c]
	cmp r1, #0x1f
	bgt _080BD954
	ldr r3, [r4, #0x30]
	lsls r3, r3, #1
	movs r0, #2
	str r0, [sp]
	ldr r0, [r4, #0x38]
	str r0, [sp, #4]
	str r1, [sp, #8]
	movs r0, #0
	movs r1, #0
	movs r2, #0x1e
	bl sub_80BD614
	ldr r0, [r4, #0x3c]
	adds r0, #1
	str r0, [r4, #0x3c]
	b _080BD964
_080BD954:
	movs r0, #0
	str r0, [r4, #0x3c]
	ldr r0, [r4, #0x2c]
	adds r0, #0xc
	str r0, [r4, #0x2c]
	adds r0, r4, #0
	bl Proc_Break
_080BD964:
	add sp, #0xc
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_80BD96C
sub_80BD96C: @ 0x080BD96C
	push {lr}
	movs r0, #1
	bl sub_80BD4F4
	pop {r0}
	bx r0

	thumb_func_start sub_80BD978
sub_80BD978: @ 0x080BD978
	push {lr}
	adds r1, r0, #0
	ldr r0, _080BD988 @ =gUnk_08DB9320
	bl Proc_Start
	pop {r0}
	bx r0
	.align 2, 0
_080BD988: .4byte gUnk_08DB9320

	thumb_func_start sub_80BD98C
sub_80BD98C: @ 0x080BD98C
	movs r1, #0
	strh r1, [r0, #0x2e]
	ldrh r1, [r0, #0x2c]
	lsrs r2, r1, #2
	lsls r2, r2, #0xd
	movs r3, #3
	ands r1, r3
	lsls r1, r1, #8
	adds r2, r2, r1
	strh r2, [r0, #0x30]
	movs r2, #0xff
	lsls r2, r2, #8
	adds r0, #0x32
	movs r1, #3
_080BD9A8:
	strh r2, [r0]
	strh r2, [r0, #8]
	adds r0, #2
	subs r1, #1
	cmp r1, #0
	bge _080BD9A8
	bx lr
	.align 2, 0

	thumb_func_start sub_80BD9B8
sub_80BD9B8: @ 0x080BD9B8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	str r0, [sp, #4]
	movs r0, #0x40
	movs r4, #0x80
	ldr r1, [sp, #4]
	ldrh r1, [r1, #0x2e]
	subs r0, r0, r1
	lsls r1, r0, #7
	muls r0, r1, r0
	movs r1, #0x80
	lsls r1, r1, #5
	bl __divsi3
	subs r4, r4, r0
	lsls r0, r4, #9
	movs r1, #0x80
	bl __divsi3
	movs r1, #0x80
	lsls r1, r1, #2
	subs r7, r1, r0
	ldr r0, [sp, #4]
	ldrh r0, [r0, #0x2a]
	adds r2, r0, r4
	movs r4, #0xff
	adds r0, r2, #0
	ands r0, r4
	movs r1, #0x80
	lsls r1, r1, #1
	subs r1, r1, r0
	mov sl, r1
	movs r0, #0xb4
	muls r0, r7, r0
	cmp r0, #0
	bge _080BDA0C
	ldr r1, _080BDA28 @ =0x000001FF
	adds r0, r0, r1
_080BDA0C:
	asrs r3, r0, #9
	movs r0, #0x64
	muls r0, r7, r0
	cmp r0, #0
	bge _080BDA1A
	ldr r1, _080BDA28 @ =0x000001FF
	adds r0, r0, r1
_080BDA1A:
	asrs r6, r0, #9
	cmp r7, #7
	bgt _080BDA2C
	ldr r0, [sp, #4]
	bl Proc_Break
	b _080BDB08
	.align 2, 0
_080BDA28: .4byte 0x000001FF
_080BDA2C:
	ldr r5, _080BDB18 @ =gSinLut
	adds r1, r2, #0
	subs r1, #0x40
	ands r1, r4
	lsls r0, r1, #1
	adds r0, r0, r5
	movs r2, #0
	ldrsh r0, [r0, r2]
	adds r2, r0, #0
	muls r2, r3, r2
	asrs r2, r2, #0xc
	mov r8, r2
	movs r0, #0x38
	add r8, r0
	ldr r0, _080BDB1C @ =0x000001FF
	mov r2, r8
	ands r2, r0
	mov r8, r2
	adds r1, #0x40
	lsls r1, r1, #1
	adds r1, r1, r5
	movs r2, #0
	ldrsh r0, [r1, r2]
	muls r0, r6, r0
	asrs r0, r0, #0xc
	movs r1, #0x10
	mov sb, r1
	mov r2, sb
	subs r2, r2, r0
	ands r2, r4
	mov sb, r2
	mov r0, sl
	ands r4, r0
	adds r6, r4, #0
	adds r6, #0x40
	lsls r6, r6, #1
	adds r6, r6, r5
	movs r1, #0
	ldrsh r0, [r6, r1]
	lsls r0, r0, #4
	adds r1, r7, #0
	bl Div
	mov sl, r0
	mov r2, sl
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	mov sl, r2
	lsls r4, r4, #1
	adds r4, r4, r5
	movs r1, #0
	ldrsh r0, [r4, r1]
	rsbs r0, r0, #0
	lsls r0, r0, #4
	adds r1, r7, #0
	bl Div
	adds r5, r0, #0
	lsls r5, r5, #0x10
	asrs r5, r5, #0x10
	movs r2, #0
	ldrsh r0, [r4, r2]
	lsls r0, r0, #4
	adds r1, r7, #0
	bl Div
	adds r4, r0, #0
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	movs r1, #0
	ldrsh r0, [r6, r1]
	lsls r0, r0, #4
	adds r1, r7, #0
	bl Div
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	ldr r2, [sp, #4]
	ldrh r1, [r2, #0x2c]
	str r0, [sp]
	adds r0, r1, #0
	mov r1, sl
	adds r2, r5, #0
	adds r3, r4, #0
	bl SetObjAffine
	ldr r1, [sp, #4]
	ldrh r1, [r1, #0x2c]
	lsls r0, r1, #9
	add r8, r0
	movs r0, #0xc0
	lsls r0, r0, #2
	add sb, r0
	ldr r3, _080BDB20 @ =Sprite_64x64
	ldr r2, [sp, #4]
	ldrh r2, [r2, #0x30]
	lsrs r0, r2, #5
	movs r1, #0x80
	lsls r1, r1, #8
	adds r0, r0, r1
	str r0, [sp]
	movs r0, #4
	mov r1, r8
	mov r2, sb
	bl PutSpriteExt
	ldr r1, [sp, #4]
	ldrh r0, [r1, #0x2e]
	adds r0, #1
	strh r0, [r1, #0x2e]
_080BDB08:
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080BDB18: .4byte gSinLut
_080BDB1C: .4byte 0x000001FF
_080BDB20: .4byte Sprite_64x64

	thumb_func_start sub_80BDB24
sub_80BDB24: @ 0x080BDB24
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r1, r2, #0
	ldr r0, _080BDB3C @ =gUnk_08DB9378
	bl Proc_Start
	strh r4, [r0, #0x2c]
	strh r5, [r0, #0x2a]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080BDB3C: .4byte gUnk_08DB9378

	thumb_func_start sub_80BDB40
sub_80BDB40: @ 0x080BDB40
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	mov r8, r0
	mov ip, r1
	adds r5, r3, #0
	lsls r2, r2, #5
	ldr r0, _080BDBE0 @ =gPal
	adds r7, r2, r0
	movs r0, #0x80
	lsls r0, r0, #1
	subs r6, r0, r5
	movs r0, #0xf8
	lsls r0, r0, #7
	mov sl, r0
	movs r0, #0xf
	mov sb, r0
_080BDB66:
	mov r0, r8
	ldrh r4, [r0]
	movs r0, #0x1f
	ands r0, r4
	adds r2, r0, #0
	muls r2, r5, r2
	mov r0, ip
	ldrh r3, [r0]
	movs r0, #0x1f
	ands r0, r3
	muls r0, r6, r0
	adds r2, r2, r0
	asrs r2, r2, #8
	movs r0, #0x1f
	ands r2, r0
	movs r0, #0xf8
	lsls r0, r0, #2
	ands r0, r4
	adds r1, r0, #0
	muls r1, r5, r1
	movs r0, #0xf8
	lsls r0, r0, #2
	ands r0, r3
	muls r0, r6, r0
	adds r1, r1, r0
	asrs r1, r1, #8
	movs r0, #0xf8
	lsls r0, r0, #2
	ands r1, r0
	adds r2, r2, r1
	mov r0, sl
	ands r0, r4
	adds r1, r0, #0
	muls r1, r5, r1
	mov r0, sl
	ands r0, r3
	muls r0, r6, r0
	adds r1, r1, r0
	asrs r1, r1, #8
	mov r0, sl
	ands r1, r0
	adds r2, r2, r1
	strh r2, [r7]
	adds r7, #2
	movs r0, #2
	add r8, r0
	add ip, r0
	subs r0, #3
	add sb, r0
	mov r0, sb
	cmp r0, #0
	bge _080BDB66
	bl EnablePalSync
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080BDBE0: .4byte gPal

	thumb_func_start sub_80BDBE4
sub_80BDBE4: @ 0x080BDBE4
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x30]
	ldr r1, [r4, #0x2c]
	adds r0, r0, r1
	str r0, [r4, #0x30]
	movs r5, #0x80
	lsls r5, r5, #1
	cmp r0, r5
	ble _080BDBFA
	str r5, [r4, #0x30]
_080BDBFA:
	ldr r0, [r4, #0x30]
	cmp r0, #0
	bge _080BDC04
	movs r0, #0
	str r0, [r4, #0x30]
_080BDC04:
	ldr r0, _080BDC28 @ =0x020072DC
	adds r1, r0, #0
	subs r1, #0x20
	ldr r2, [r4, #0x34]
	ldr r3, [r4, #0x30]
	bl sub_80BDB40
	ldr r0, [r4, #0x30]
	cmp r0, r5
	beq _080BDC1C
	cmp r0, #0
	bne _080BDC22
_080BDC1C:
	adds r0, r4, #0
	bl Proc_Break
_080BDC22:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080BDC28: .4byte 0x020072DC

	thumb_func_start sub_80BDC2C
sub_80BDC2C: @ 0x080BDC2C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	adds r4, r0, #0
	adds r7, r1, #0
	adds r6, r2, #0
	mov r8, r3
	ldr r1, [sp, #0x1c]
	ldr r0, _080BDC60 @ =gUnk_08DB9398
	bl Proc_Start
	adds r5, r0, #0
	movs r0, #1
	rsbs r0, r0, #0
	cmp r4, r0
	bne _080BDC6C
	lsls r0, r6, #5
	ldr r1, _080BDC64 @ =gPal
	adds r0, r0, r1
	ldr r1, _080BDC68 @ =0x020072BC
	movs r2, #8
	bl CpuFastSet
	b _080BDC92
	.align 2, 0
_080BDC60: .4byte gUnk_08DB9398
_080BDC64: .4byte gPal
_080BDC68: .4byte 0x020072BC
_080BDC6C:
	cmp r4, #0
	bne _080BDC88
	str r4, [sp]
	ldr r1, _080BDC80 @ =0x020072BC
	ldr r2, _080BDC84 @ =0x01000008
	mov r0, sp
	bl CpuFastSet
	b _080BDC92
	.align 2, 0
_080BDC80: .4byte 0x020072BC
_080BDC84: .4byte 0x01000008
_080BDC88:
	ldr r1, _080BDCB8 @ =0x020072BC
	adds r0, r4, #0
	movs r2, #8
	bl CpuFastSet
_080BDC92:
	ldr r1, _080BDCBC @ =0x020072DC
	adds r0, r7, #0
	movs r2, #8
	bl CpuFastSet
	movs r0, #0
	str r0, [r5, #0x30]
	str r6, [r5, #0x34]
	mov r0, r8
	str r0, [r5, #0x2c]
	bl EnablePalSync
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080BDCB8: .4byte 0x020072BC
_080BDCBC: .4byte 0x020072DC

	thumb_func_start sub_80BDCC0
sub_80BDCC0: @ 0x080BDCC0
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x2c]
	lsls r0, r0, #2
	ldr r1, [r4, #0x30]
	adds r1, r1, r0
	str r1, [r4, #0x30]
	movs r5, #0x80
	lsls r5, r5, #1
	cmp r1, r5
	ble _080BDCD8
	str r5, [r4, #0x30]
_080BDCD8:
	ldr r0, _080BDCF8 @ =0x020072DC
	adds r1, r0, #0
	subs r1, #0x20
	ldr r2, [r4, #0x34]
	ldr r3, [r4, #0x30]
	bl sub_80BDB40
	ldr r0, [r4, #0x30]
	cmp r0, r5
	bne _080BDCF2
	adds r0, r4, #0
	bl Proc_Break
_080BDCF2:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080BDCF8: .4byte 0x020072DC

	thumb_func_start sub_80BDCFC
sub_80BDCFC: @ 0x080BDCFC
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x30]
	ldr r1, [r4, #0x2c]
	subs r0, r0, r1
	str r0, [r4, #0x30]
	cmp r0, #0
	bge _080BDD10
	movs r0, #0
	str r0, [r4, #0x30]
_080BDD10:
	ldr r0, _080BDD30 @ =0x020072DC
	adds r1, r0, #0
	subs r1, #0x20
	ldr r2, [r4, #0x34]
	ldr r3, [r4, #0x30]
	bl sub_80BDB40
	ldr r0, [r4, #0x30]
	cmp r0, #0
	bne _080BDD2A
	adds r0, r4, #0
	bl Proc_Break
_080BDD2A:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080BDD30: .4byte 0x020072DC

	thumb_func_start sub_80BDD34
sub_80BDD34: @ 0x080BDD34
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	adds r6, r0, #0
	adds r7, r1, #0
	adds r5, r2, #0
	mov r8, r3
	ldr r0, [sp, #0x2c]
	ldr r4, [sp, #0x30]
	ldr r1, [sp, #0x34]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp]
	ldr r0, _080BDD80 @ =gUnk_08DB93B0
	bl Proc_Start
	movs r1, #0
	str r1, [r0, #0x30]
	str r5, [r0, #0x34]
	str r4, [r0, #0x2c]
	bl EnablePalSync
	movs r0, #1
	rsbs r0, r0, #0
	cmp r6, r0
	bne _080BDD8C
	lsls r0, r5, #5
	ldr r1, _080BDD84 @ =gPal
	adds r0, r0, r1
	ldr r1, _080BDD88 @ =0x020072BC
	movs r2, #8
	bl CpuFastSet
	b _080BDD96
	.align 2, 0
_080BDD80: .4byte gUnk_08DB93B0
_080BDD84: .4byte gPal
_080BDD88: .4byte 0x020072BC
_080BDD8C:
	ldr r1, _080BDE18 @ =0x020072BC
	adds r0, r6, #0
	movs r2, #8
	bl CpuFastSet
_080BDD96:
	movs r0, #1
	rsbs r0, r0, #0
	cmp r7, r0
	bne _080BDE32
	movs r0, #0
	mov ip, r0
	ldr r0, _080BDE18 @ =0x020072BC
	movs r1, #0x1f
	mov sl, r1
	mov r6, sl
	mov r5, r8
	ands r6, r5
	lsls r1, r6, #0xa
	str r1, [sp, #4]
	adds r7, r0, #0
	movs r5, #0x20
	adds r5, r5, r7
	mov sb, r5
_080BDDBA:
	ldr r0, [sp]
	mov r1, ip
	asrs r0, r1
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _080BDE1C
	ldrh r2, [r7]
	movs r5, #0x1f
	mov r8, r5
	mov r3, sl
	ands r3, r2
	movs r4, #0xf8
	lsls r4, r4, #2
	adds r0, r4, #0
	ands r0, r2
	lsls r1, r6, #5
	adds r0, r0, r1
	str r0, [sp, #8]
	movs r1, #0xf8
	lsls r1, r1, #7
	adds r0, r1, #0
	ands r0, r2
	ldr r5, [sp, #4]
	adds r2, r0, r5
	adds r3, r3, r6
	cmp r3, #0x1f
	ble _080BDDF4
	movs r3, #0x1f
_080BDDF4:
	mov r0, r8
	ands r3, r0
	ldr r0, [sp, #8]
	cmp r0, r4
	ble _080BDE00
	adds r0, r4, #0
_080BDE00:
	ands r0, r4
	adds r3, r3, r0
	adds r0, r2, #0
	cmp r0, r1
	ble _080BDE0C
	adds r0, r1, #0
_080BDE0C:
	ands r0, r1
	adds r0, r3, r0
	mov r1, sb
	strh r0, [r1]
	b _080BDE20
	.align 2, 0
_080BDE18: .4byte 0x020072BC
_080BDE1C:
	ldrh r0, [r7]
	strh r0, [r7, #0x20]
_080BDE20:
	adds r7, #2
	movs r5, #2
	add sb, r5
	movs r0, #1
	add ip, r0
	mov r1, ip
	cmp r1, #0xf
	ble _080BDDBA
	b _080BDE50
_080BDE32:
	ldr r4, _080BDE60 @ =0x020072DC
	adds r0, r7, #0
	adds r1, r4, #0
	movs r2, #8
	bl CpuFastSet
	lsls r1, r5, #5
	ldr r0, _080BDE64 @ =gPal
	adds r1, r1, r0
	adds r0, r4, #0
	movs r2, #8
	bl CpuFastSet
	bl EnablePalSync
_080BDE50:
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080BDE60: .4byte 0x020072DC
_080BDE64: .4byte gPal

	thumb_func_start sub_80BDE68
sub_80BDE68: @ 0x080BDE68
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	sub sp, #8
	adds r4, r0, #0
	ldr r6, _080BDEB8 @ =gUnk_086C0C4C
	movs r0, #0x36
	ldrsh r1, [r4, r0]
	movs r0, #0x3e
	ldrsh r2, [r4, r0]
	movs r0, #0xe6
	lsls r0, r0, #6
	mov r8, r0
	movs r0, #5
	str r0, [sp]
	movs r5, #0xa
	str r5, [sp, #4]
	adds r0, r6, #0
	mov r3, r8
	bl StartSpriteAnimProc
	str r0, [r4, #0x2c]
	movs r0, #0x3a
	ldrsh r1, [r4, r0]
	ldr r2, [r4, #0x40]
	asrs r2, r2, #0x10
	movs r0, #6
	str r0, [sp]
	str r5, [sp, #4]
	adds r0, r6, #0
	mov r3, r8
	bl StartSpriteAnimProc
	str r0, [r4, #0x30]
	add sp, #8
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080BDEB8: .4byte gUnk_086C0C4C

	thumb_func_start sub_80BDEBC
sub_80BDEBC: @ 0x080BDEBC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	adds r6, r0, #0
	movs r0, #0
	mov sb, r0
	ldr r1, _080BDF38 @ =0x02007508
	mov sl, r1
_080BDED0:
	mov r3, sb
	lsls r5, r3, #2
	adds r0, r6, #0
	adds r0, #0x2c
	adds r0, r0, r5
	mov r8, r0
	ldr r7, [r0]
	cmp r7, #0
	beq _080BDF4E
	adds r2, r6, #0
	adds r2, #0x44
	adds r2, r2, r5
	ldr r0, [r2]
	mov r3, sl
	ldr r1, [r3, #8]
	adds r0, r0, r1
	str r0, [r2]
	adds r4, r6, #0
	adds r4, #0x4c
	adds r4, r4, r5
	ldr r0, [r4]
	ldr r1, [r3, #0xc]
	adds r0, r0, r1
	str r0, [r4]
	adds r3, r6, #0
	adds r3, #0x34
	adds r3, r3, r5
	ldr r0, [r3]
	ldr r1, [r2]
	adds r0, r0, r1
	str r0, [r3]
	adds r1, r6, #0
	adds r1, #0x3c
	adds r1, r1, r5
	ldr r2, [r1]
	ldr r0, [r4]
	adds r2, r2, r0
	str r2, [r1]
	movs r0, #2
	ldrsh r1, [r3, r0]
	asrs r2, r2, #0x10
	cmp r1, #0xf0
	bhi _080BDF2A
	cmp r2, #0
	bge _080BDF3C
_080BDF2A:
	adds r0, r7, #0
	bl EndSpriteAnimProc
	movs r0, #0
	mov r1, r8
	str r0, [r1]
	b _080BDF4E
	.align 2, 0
_080BDF38: .4byte 0x02007508
_080BDF3C:
	ldr r0, _080BDF78 @ =0x000001FF
	ands r1, r0
	movs r0, #0xff
	ands r2, r0
	adds r0, r7, #0
	movs r3, #0xe6
	lsls r3, r3, #6
	bl SetSpriteAnimProcParameters
_080BDF4E:
	movs r3, #1
	add sb, r3
	mov r0, sb
	cmp r0, #1
	ble _080BDED0
	ldr r0, [r6, #0x2c]
	cmp r0, #0
	bne _080BDF6A
	ldr r0, [r6, #0x30]
	cmp r0, #0
	bne _080BDF6A
	adds r0, r6, #0
	bl Proc_Break
_080BDF6A:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080BDF78: .4byte 0x000001FF

	thumb_func_start sub_80BDF7C
sub_80BDF7C: @ 0x080BDF7C
	push {r4, r5, r6, lr}
	mov r6, sb
	mov r5, r8
	push {r5, r6}
	adds r4, r0, #0
	adds r6, r1, #0
	adds r5, r2, #0
	mov sb, r3
	ldr r1, [sp, #0x18]
	ldr r0, _080BE014 @ =ProcScr_08DB93D0
	bl Proc_Start
	lsls r1, r4, #0x10
	str r1, [r0, #0x34]
	lsls r6, r6, #0x10
	str r6, [r0, #0x3c]
	adds r4, #0x80
	movs r1, #0xff
	mov r8, r1
	ands r4, r1
	lsls r4, r4, #0x10
	str r4, [r0, #0x38]
	adds r6, #0x20
	str r6, [r0, #0x40]
	ldr r3, _080BE018 @ =gSinLut
	adds r2, r5, #0
	ands r2, r1
	adds r1, r2, #0
	adds r1, #0x40
	lsls r1, r1, #1
	adds r1, r1, r3
	movs r4, #0
	ldrsh r1, [r1, r4]
	mov r4, sb
	muls r4, r1, r4
	adds r1, r4, #0
	str r1, [r0, #0x44]
	lsls r2, r2, #1
	adds r2, r2, r3
	movs r4, #0
	ldrsh r1, [r2, r4]
	mov r2, sb
	muls r2, r1, r2
	adds r1, r2, #0
	str r1, [r0, #0x4c]
	adds r5, #4
	mov r4, r8
	ands r5, r4
	adds r1, r5, #0
	adds r1, #0x40
	lsls r1, r1, #1
	adds r1, r1, r3
	movs r2, #0
	ldrsh r1, [r1, r2]
	mov r4, sb
	muls r4, r1, r4
	adds r1, r4, #0
	str r1, [r0, #0x48]
	lsls r5, r5, #1
	adds r5, r5, r3
	movs r2, #0
	ldrsh r1, [r5, r2]
	mov r4, sb
	muls r4, r1, r4
	adds r1, r4, #0
	str r1, [r0, #0x50]
	movs r1, #0
	str r1, [r0, #0x2c]
	str r1, [r0, #0x30]
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080BE014: .4byte ProcScr_08DB93D0
_080BE018: .4byte gSinLut

	thumb_func_start sub_80BE01C
sub_80BE01C: @ 0x080BE01C
	push {lr}
	movs r1, #0x74
	str r1, [r0, #0x2c]
	movs r1, #0
	str r1, [r0, #0x30]
	str r1, [r0, #0x38]
	ldr r0, _080BE040 @ =gUnk_08622C7C
	movs r1, #0xa0
	lsls r1, r1, #2
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r0, _080BE044 @ =gUnk_08622C9C
	ldr r1, _080BE048 @ =0x06010000
	bl Decompress
	pop {r0}
	bx r0
	.align 2, 0
_080BE040: .4byte gUnk_08622C7C
_080BE044: .4byte gUnk_08622C9C
_080BE048: .4byte 0x06010000

	thumb_func_start sub_80BE04C
sub_80BE04C: @ 0x080BE04C
	push {r4, r5, lr}
	sub sp, #4
	adds r4, r0, #0
	ldr r0, [r4, #0x38]
	adds r0, #1
	str r0, [r4, #0x38]
	ldr r1, [r4, #0x30]
	adds r5, r1, r0
	str r5, [r4, #0x30]
	cmp r5, #0x4f
	ble _080BE072
	adds r0, r4, #0
	bl Proc_Break
	ldr r0, [r4, #0x14]
	movs r1, #2
	bl Proc_Goto
	b _080BE08C
_080BE072:
	ldr r1, [r4, #0x2c]
	ldr r3, _080BE09C @ =Sprite_8x8
	ldr r0, [r4, #0x34]
	movs r2, #1
	ands r0, r2
	movs r2, #0x88
	lsls r2, r2, #7
	adds r0, r0, r2
	str r0, [sp]
	movs r0, #4
	adds r2, r5, #0
	bl PutSpriteExt
_080BE08C:
	ldr r0, [r4, #0x34]
	adds r0, #1
	str r0, [r4, #0x34]
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080BE09C: .4byte Sprite_8x8

	thumb_func_start sub_80BE0A0
sub_80BE0A0: @ 0x080BE0A0
	push {lr}
	adds r1, r0, #0
	ldr r0, _080BE0B0 @ =gUnk_08DB93F0
	bl Proc_Start
	pop {r0}
	bx r0
	.align 2, 0
_080BE0B0: .4byte gUnk_08DB93F0

	thumb_func_start sub_80BE0B4
sub_80BE0B4: @ 0x080BE0B4
	movs r2, #0
	adds r1, r0, #0
_080BE0B8:
	ldr r0, [r1]
	cmp r0, #0
	beq _080BE0C6
	adds r1, #4
	adds r2, #1
	cmp r2, #1
	ble _080BE0B8
_080BE0C6:
	adds r0, r2, #0
	bx lr
	.align 2, 0

	thumb_func_start sub_80BE0CC
sub_80BE0CC: @ 0x080BE0CC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	adds r6, r0, #0
	mov sb, r1
	mov r8, r2
	ldr r1, [r1, #4]
	lsls r0, r2, #3
	adds r0, r0, r1
	ldr r1, [r0]
	mov sl, r1
	ldr r7, [r0, #4]
	cmp r2, #0
	blt _080BE1BC
	cmp r1, #0
	beq _080BE11E
	adds r0, r6, #0
	bl GetBgChrOffset
	adds r4, r0, #0
	mov r2, sb
	ldr r2, [r2]
	ldr r1, [r2, #0x14]
	mov r0, r8
	bl __modsi3
	lsls r0, r0, #0xa
	movs r3, #0xc0
	lsls r3, r3, #0x13
	adds r0, r0, r3
	adds r4, r4, r0
	mov r1, sb
	ldr r1, [r1]
	ldr r0, [r1, #0x10]
	adds r4, r4, r0
	mov r0, sl
	adds r1, r4, #0
	bl Decompress
_080BE11E:
	cmp r7, #0
	beq _080BE17C
	ldrb r2, [r7]
	mov sl, r2
	ldrh r3, [r7]
	lsrs r4, r3, #8
	adds r7, #2
	adds r0, r6, #0
	bl GetBgTilemap
	movs r1, #0x1f
	mov r2, r8
	ands r1, r2
	lsls r1, r1, #6
	adds r6, r0, r1
	mov r3, sb
	ldr r5, [r3]
	ldr r1, [r5, #0x14]
	mov r0, r8
	bl __modsi3
	subs r4, r4, r0
	mov r3, sl
	adds r3, #1
	adds r0, r4, #0
	muls r0, r3, r0
	lsls r0, r0, #1
	adds r7, r7, r0
	movs r2, #0
	cmp r2, sl
	bgt _080BE1BC
	ldr r0, [r5, #4]
	lsls r4, r0, #0xc
	ldr r0, [r5, #0x10]
	lsls r0, r0, #0xf
	lsrs r1, r0, #0x14
	adds r2, r3, #0
_080BE168:
	ldrh r3, [r7]
	adds r0, r3, r4
	adds r0, r0, r1
	strh r0, [r6]
	adds r6, #2
	adds r7, #2
	subs r2, #1
	cmp r2, #0
	bne _080BE168
	b _080BE1BC
_080BE17C:
	mov r1, sb
	ldr r0, [r1]
	ldr r1, [r0, #0x14]
	mov r0, r8
	bl __modsi3
	adds r4, r0, #0
	lsls r4, r4, #5
	adds r0, r6, #0
	bl GetBgTilemap
	movs r1, #0x1f
	mov r2, r8
	ands r1, r2
	lsls r1, r1, #6
	adds r6, r0, r1
	mov r3, sb
	ldr r0, [r3]
	ldr r1, [r0, #4]
	ldr r0, [r0, #0x10]
	lsls r0, r0, #0xf
	lsrs r0, r0, #0x14
	lsls r1, r1, #0xc
	adds r4, r4, r1
	adds r0, r4, r0
	movs r2, #0x1f
_080BE1B0:
	strh r0, [r6]
	adds r6, #2
	adds r0, #1
	subs r2, #1
	cmp r2, #0
	bge _080BE1B0
_080BE1BC:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_80BE1CC
sub_80BE1CC: @ 0x080BE1CC
	str r1, [r0, #0x3c]
	bx lr

	thumb_func_start sub_80BE1D0
sub_80BE1D0: @ 0x080BE1D0
	movs r1, #0
	str r1, [r0, #0x3c]
	str r1, [r0, #0x34]
	str r1, [r0, #0x30]
	str r1, [r0, #0x2c]
	bx lr

	thumb_func_start sub_80BE1DC
sub_80BE1DC: @ 0x080BE1DC
	push {r4, r5, r6, r7, lr}
	sub sp, #0x10
	adds r4, r0, #0
	ldr r2, [r4, #0x38]
	asrs r6, r2, #0xa
	mov r1, sp
	ldr r0, _080BE2A4 @ =gUnk_086C4544
	ldm r0!, {r3, r5, r7}
	stm r1!, {r3, r5, r7}
	ldr r0, [r0]
	str r0, [r1]
	ldr r0, [r4, #0x2c]
	cmp r0, #0
	beq _080BE29A
	ldr r0, [r4, #0x3c]
	adds r0, r2, r0
	str r0, [r4, #0x38]
	cmp r0, #0
	bge _080BE20C
	movs r0, #0
	str r0, [r4, #0x38]
	adds r0, r4, #0
	bl Proc_Break
_080BE20C:
	ldr r1, [r4, #0x38]
	asrs r1, r1, #0xa
	ldr r0, [r4, #0x34]
	subs r0, #0x14
	lsls r0, r0, #3
	cmp r1, r0
	ble _080BE220
	adds r0, r4, #0
	bl Proc_Break
_080BE220:
	ldr r0, [r4, #0x38]
	asrs r5, r0, #0xa
	cmp r6, r5
	beq _080BE29A
	cmp r6, r5
	ble _080BE24E
	adds r2, r6, #0
	cmp r6, #0
	bge _080BE234
	adds r2, r6, #7
_080BE234:
	asrs r2, r2, #3
	adds r0, r5, #0
	cmp r5, #0
	bge _080BE23E
	adds r0, r5, #7
_080BE23E:
	asrs r0, r0, #3
	cmp r2, r0
	beq _080BE24E
	ldr r0, [r4, #0x30]
	ldr r1, [r4, #0x2c]
	subs r2, #1
	bl sub_80BE0CC
_080BE24E:
	cmp r6, r5
	bge _080BE282
	adds r3, r6, #7
	adds r0, r3, #0
	cmp r3, #0
	bge _080BE25E
	adds r0, r6, #0
	adds r0, #0xe
_080BE25E:
	asrs r1, r0, #3
	adds r0, r5, #7
	cmp r0, #0
	bge _080BE268
	adds r0, #7
_080BE268:
	asrs r0, r0, #3
	cmp r1, r0
	beq _080BE282
	ldr r0, [r4, #0x30]
	ldr r1, [r4, #0x2c]
	adds r2, r6, #0
	cmp r2, #0
	bge _080BE27A
	adds r2, r3, #0
_080BE27A:
	asrs r2, r2, #3
	adds r2, #0x14
	bl sub_80BE0CC
_080BE282:
	ldr r0, [r4, #0x30]
	lsls r0, r0, #2
	add r0, sp
	ldr r0, [r0]
	bl EnableBgSync
	ldrh r0, [r4, #0x30]
	lsls r2, r5, #0x10
	lsrs r2, r2, #0x10
	movs r1, #0
	bl SetBgOffset
_080BE29A:
	add sp, #0x10
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080BE2A4: .4byte gUnk_086C4544

	thumb_func_start sub_80BE2A8
sub_80BE2A8: @ 0x080BE2A8
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #0x10
	adds r6, r0, #0
	mov r8, r1
	mov sb, r2
	adds r4, r3, #0
	ldr r1, [sp, #0x2c]
	mov r2, sp
	ldr r0, _080BE38C @ =gUnk_086C4544
	ldm r0!, {r3, r5, r7}
	stm r2!, {r3, r5, r7}
	ldr r0, [r0]
	str r0, [r2]
	ldr r0, _080BE390 @ =gUnk_08DB9794
	bl Proc_Start
	adds r5, r0, #0
	movs r0, #0
	str r0, [r5, #0x34]
	ldr r2, [r6, #4]
	ldr r0, [r2]
	movs r1, #1
	rsbs r1, r1, #0
	cmp r0, r1
	beq _080BE2F2
	adds r3, r1, #0
	movs r1, #0
_080BE2E4:
	adds r1, #1
	lsls r0, r1, #3
	adds r0, r0, r2
	ldr r0, [r0]
	cmp r0, r3
	bne _080BE2E4
	str r1, [r5, #0x34]
_080BE2F2:
	movs r0, #1
	rsbs r0, r0, #0
	cmp sb, r0
	bne _080BE300
	ldr r0, [r5, #0x34]
	subs r0, #0x14
	mov sb, r0
_080BE300:
	mov r0, sb
	lsls r2, r0, #0xd
	str r2, [r5, #0x38]
	str r6, [r5, #0x2c]
	mov r1, r8
	str r1, [r5, #0x30]
	str r4, [r5, #0x3c]
	lsls r0, r1, #0x10
	lsrs r0, r0, #0x10
	lsls r2, r2, #6
	lsrs r2, r2, #0x10
	movs r1, #0
	bl SetBgOffset
	ldr r0, [r6]
	ldr r4, [r0, #0xc]
	cmp r4, #0
	beq _080BE33E
	mov r0, r8
	bl GetBgChrOffset
	adds r1, r0, #0
	ldr r0, [r6]
	ldr r0, [r0, #0x10]
	movs r2, #0xc0
	lsls r2, r2, #0x13
	adds r0, r0, r2
	adds r1, r1, r0
	adds r0, r4, #0
	bl Decompress
_080BE33E:
	ldr r1, [r6]
	ldr r0, [r1]
	cmp r0, #0
	beq _080BE356
	ldr r2, [r1, #8]
	cmp r2, #0
	beq _080BE356
	ldr r1, [r1, #4]
	lsls r1, r1, #5
	lsls r2, r2, #5
	bl ApplyPaletteExt
_080BE356:
	movs r4, #1
	rsbs r4, r4, #0
	mov r3, r8
	lsls r7, r3, #2
_080BE35E:
	mov r0, sb
	adds r2, r0, r4
	mov r0, r8
	adds r1, r6, #0
	bl sub_80BE0CC
	adds r4, #1
	cmp r4, #0x13
	ble _080BE35E
	mov r1, sp
	adds r0, r1, r7
	ldr r0, [r0]
	bl EnableBgSync
	adds r0, r5, #0
	add sp, #0x10
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_080BE38C: .4byte gUnk_086C4544
_080BE390: .4byte gUnk_08DB9794
