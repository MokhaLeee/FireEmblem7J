	.include "macro.inc"

	.syntax unified

	thumb_func_start ApplyIconPalettes
ApplyIconPalettes: @ 0x08004C08
	push {lr}
	adds r1, r0, #0
	ldr r0, _08004C1C @ =Pal_Icons
	lsls r1, r1, #5
	movs r2, #0x40
	bl ApplyPaletteExt
	pop {r0}
	bx r0
	.align 2, 0
_08004C1C: .4byte Pal_Icons

	thumb_func_start sub_08004C20
sub_08004C20: @ 0x08004C20
	push {lr}
	lsls r0, r0, #5
	ldr r2, _08004C34 @ =Pal_Icons
	adds r0, r0, r2
	lsls r1, r1, #5
	movs r2, #0x20
	bl ApplyPaletteExt
	pop {r0}
	bx r0
	.align 2, 0
_08004C34: .4byte Pal_Icons

	thumb_func_start sub_08004C38
sub_08004C38: @ 0x08004C38
	movs r2, #0
	movs r1, #0x1f
	ldr r3, _08004C54 @ =0x02026D08
_08004C3E:
	adds r0, r1, r3
	ldrb r0, [r0]
	cmp r0, #0
	beq _08004C48
	adds r2, #1
_08004C48:
	subs r1, #1
	cmp r1, #0
	bge _08004C3E
	adds r0, r2, #0
	bx lr
	.align 2, 0
_08004C54: .4byte 0x02026D08

	thumb_func_start sub_08004C58
sub_08004C58: @ 0x08004C58
	adds r1, r0, #0
	lsls r1, r1, #2
	movs r2, #0xc0
	lsls r2, r2, #2
	adds r0, r2, #0
	subs r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bx lr
	.align 2, 0

	thumb_func_start sub_08004C6C
sub_08004C6C: @ 0x08004C6C
	push {r4, lr}
	movs r2, #0
	ldr r4, _08004C84 @ =0x02026D08
	adds r3, r0, #1
_08004C74:
	adds r1, r2, r4
	ldrb r0, [r1]
	cmp r0, #0
	bne _08004C88
	strb r3, [r1]
	adds r0, r2, #0
	b _08004C92
	.align 2, 0
_08004C84: .4byte 0x02026D08
_08004C88:
	adds r2, #1
	cmp r2, #0x1f
	ble _08004C74
	movs r0, #1
	rsbs r0, r0, #0
_08004C92:
	pop {r4}
	pop {r1}
	bx r1

	thumb_func_start sub_08004C98
sub_08004C98: @ 0x08004C98
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r0, _08004CB4 @ =0x02026A48
	lsls r1, r4, #2
	adds r5, r1, r0
	ldrb r0, [r5, #1]
	cmp r0, #0
	beq _08004CB8
	ldrb r0, [r5]
	cmp r0, #0xfe
	bhi _08004CEC
	adds r0, #1
	strb r0, [r5]
	b _08004CEC
	.align 2, 0
_08004CB4: .4byte 0x02026A48
_08004CB8:
	ldrb r0, [r5]
	adds r0, #1
	strb r0, [r5]
	adds r0, r4, #0
	bl sub_08004C6C
	adds r0, #1
	strb r0, [r5, #1]
	lsls r4, r4, #7
	ldr r0, _08004CFC @ =Img_Icons
	adds r4, r4, r0
	ldrb r0, [r5, #1]
	bl sub_08004C58
	adds r1, r0, #0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0xb
	movs r2, #0xc0
	lsls r2, r2, #0x13
	ldr r0, _08004D00 @ =0x0001FFE0
	ands r1, r0
	adds r1, r1, r2
	adds r0, r4, #0
	movs r2, #0x80
	bl RegisterDataMove
_08004CEC:
	ldrb r0, [r5, #1]
	bl sub_08004C58
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_08004CFC: .4byte Img_Icons
_08004D00: .4byte 0x0001FFE0

	thumb_func_start sub_08004D04
sub_08004D04: @ 0x08004D04
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r0, r1, #0
	adds r5, r2, #0
	cmp r0, #0
	bge _08004D20
	movs r0, #0
	strh r0, [r4]
	strh r0, [r4, #2]
	adds r1, r4, #0
	adds r1, #0x40
	strh r0, [r1]
	adds r1, #2
	b _08004D4C
_08004D20:
	bl sub_08004C98
	adds r0, r0, r5
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	movs r2, #0x80
	lsls r2, r2, #9
	adds r0, r0, r2
	strh r1, [r4]
	lsrs r1, r0, #0x10
	adds r0, r0, r2
	strh r1, [r4, #2]
	adds r2, r4, #0
	adds r2, #0x40
	lsrs r1, r0, #0x10
	movs r3, #0x80
	lsls r3, r3, #9
	adds r0, r0, r3
	lsrs r0, r0, #0x10
	strh r1, [r2]
	adds r1, r4, #0
	adds r1, #0x42
_08004D4C:
	strh r0, [r1]
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start sub_08004D54
sub_08004D54: @ 0x08004D54
	ldr r2, _08004D6C @ =0x02026D08
	ldr r1, _08004D70 @ =0x02026A48
	lsls r0, r0, #2
	adds r0, r0, r1
	ldrb r1, [r0, #1]
	subs r1, #1
	adds r1, r1, r2
	movs r2, #0
	strb r2, [r1]
	strb r2, [r0, #1]
	bx lr
	.align 2, 0
_08004D6C: .4byte 0x02026D08
_08004D70: .4byte 0x02026A48

	thumb_func_start sub_08004D74
sub_08004D74: @ 0x08004D74
	push {r4, r5, lr}
	adds r2, r0, #0
	ldr r5, _08004DA0 @ =0x06010000
	ldr r0, _08004DA4 @ =0x000003FF
	ands r0, r1
	lsls r0, r0, #5
	adds r5, r0, r5
	cmp r2, #0
	bge _08004DA8
	movs r0, #0
	adds r1, r5, #0
	movs r2, #0x40
	bl RegisterDataFill
	movs r0, #0x80
	lsls r0, r0, #3
	adds r1, r5, r0
	movs r0, #0
	movs r2, #0x40
	bl RegisterDataFill
	b _08004DC8
	.align 2, 0
_08004DA0: .4byte 0x06010000
_08004DA4: .4byte 0x000003FF
_08004DA8:
	ldr r4, _08004DD0 @ =Img_Icons
	lsls r0, r2, #7
	adds r4, r0, r4
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #0x40
	bl RegisterDataMove
	adds r4, #0x40
	movs r0, #0x80
	lsls r0, r0, #3
	adds r1, r5, r0
	adds r0, r4, #0
	movs r2, #0x40
	bl RegisterDataMove
_08004DC8:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08004DD0: .4byte Img_Icons
