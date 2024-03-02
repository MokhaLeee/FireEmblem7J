	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_80817C8
sub_80817C8: @ 0x080817C8
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	ldr r0, _08081820 @ =gStatScreenSt
	movs r2, #4
	ldrsh r1, [r0, r2]
	adds r1, #0x6d
	movs r3, #6
	ldrsh r2, [r0, r3]
	adds r2, #5
	ldr r3, _08081824 @ =gUnk_08D8A3C0
	ldr r4, _08081828 @ =gUnk_08D8A3D4
	lsls r0, r5, #1
	adds r0, r0, r4
	ldrh r0, [r0]
	movs r4, #0xf9
	lsls r4, r4, #6
	adds r0, r0, r4
	str r0, [sp]
	movs r0, #4
	bl PutSprite
	bl GetGameTime
	lsrs r0, r0, #2
	movs r1, #0xf
	ands r0, r1
	lsls r5, r5, #6
	lsls r0, r0, #1
	ldr r1, _0808182C @ =gUnk_08404024
	adds r0, r0, r1
	adds r5, r5, r0
	ldr r1, _08081830 @ =gPal + 0x268
	adds r0, r5, #0
	movs r2, #0xb
	bl CpuSet
	bl EnablePalSync
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08081820: .4byte gStatScreenSt
_08081824: .4byte gUnk_08D8A3C0
_08081828: .4byte gUnk_08D8A3D4
_0808182C: .4byte gUnk_08404024
_08081830: .4byte gPal + 0x268

	thumb_func_start sub_8081834
sub_8081834: @ 0x08081834
	push {r4, r5, r6, lr}
	mov r6, sl
	mov r5, sb
	mov r4, r8
	push {r4, r5, r6}
	sub sp, #4
	mov sb, r0
	ldr r4, _080818C4 @ =gSinLut
	movs r0, #0x80
	adds r0, r0, r4
	mov sl, r0
	movs r1, #0
	ldrsh r0, [r0, r1]
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
	mov r1, r8
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
	mov r1, sl
	movs r2, #0
	ldrsh r0, [r1, r2]
	lsls r0, r0, #4
	mov r1, r8
	bl Div
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	str r0, [sp]
	movs r0, #8
	adds r1, r6, #0
	adds r2, r5, #0
	adds r3, r4, #0
	bl SetObjAffine
	ldr r0, _080818C8 @ =gStatScreenSt
	ldrb r0, [r0]
	movs r1, #0x36
	add sb, r1
	mov r2, sb
	strb r0, [r2]
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080818C4: .4byte gSinLut
_080818C8: .4byte gStatScreenSt

	thumb_func_start sub_80818CC
sub_80818CC: @ 0x080818CC
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r4, #0
	adds r5, #0x36
	ldrb r0, [r5]
	bl sub_80817C8
	ldr r1, _080818F0 @ =gStatScreenSt
	ldrh r0, [r1, #2]
	cmp r0, #0
	beq _080818F4
	movs r0, #5
	strh r0, [r4, #0x38]
	adds r0, r4, #0
	bl Proc_Break
	b _080818F8
	.align 2, 0
_080818F0: .4byte gStatScreenSt
_080818F4:
	ldrb r0, [r1]
	strb r0, [r5]
_080818F8:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_8081900
sub_8081900: @ 0x08081900
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	adds r7, r0, #0
	ldr r5, _080819C4 @ =gSinLut
	movs r0, #0x80
	adds r0, r0, r5
	mov sl, r0
	movs r1, #0
	ldrsh r0, [r0, r1]
	lsls r0, r0, #4
	movs r2, #0x80
	lsls r2, r2, #1
	mov sb, r2
	mov r1, sb
	bl Div
	mov r8, r0
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	mov r8, r0
	movs r1, #0
	ldrsh r4, [r5, r1]
	rsbs r4, r4, #0
	lsls r4, r4, #4
	movs r2, #0x38
	ldrsh r0, [r7, r2]
	lsls r0, r0, #8
	movs r1, #6
	bl __divsi3
	adds r1, r0, #0
	adds r0, r4, #0
	bl Div
	adds r6, r0, #0
	lsls r6, r6, #0x10
	asrs r6, r6, #0x10
	movs r1, #0
	ldrsh r0, [r5, r1]
	lsls r0, r0, #4
	mov r1, sb
	bl Div
	adds r5, r0, #0
	lsls r5, r5, #0x10
	asrs r5, r5, #0x10
	mov r2, sl
	movs r0, #0
	ldrsh r4, [r2, r0]
	lsls r4, r4, #4
	movs r1, #0x38
	ldrsh r0, [r7, r1]
	lsls r0, r0, #8
	movs r1, #6
	bl __divsi3
	adds r1, r0, #0
	adds r0, r4, #0
	bl Div
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	str r0, [sp]
	movs r0, #8
	mov r1, r8
	adds r2, r6, #0
	adds r3, r5, #0
	bl SetObjAffine
	adds r0, r7, #0
	adds r0, #0x36
	ldrb r0, [r0]
	bl sub_80817C8
	ldrh r0, [r7, #0x38]
	subs r0, #1
	strh r0, [r7, #0x38]
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _080819B2
	movs r0, #1
	strh r0, [r7, #0x38]
	adds r0, r7, #0
	bl Proc_Break
_080819B2:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080819C4: .4byte gSinLut

	thumb_func_start sub_80819C8
sub_80819C8: @ 0x080819C8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	adds r7, r0, #0
	ldr r5, _08081A90 @ =gSinLut
	movs r0, #0x80
	adds r0, r0, r5
	mov sl, r0
	movs r1, #0
	ldrsh r0, [r0, r1]
	lsls r0, r0, #4
	movs r2, #0x80
	lsls r2, r2, #1
	mov sb, r2
	mov r1, sb
	bl Div
	mov r8, r0
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	mov r8, r0
	movs r1, #0
	ldrsh r4, [r5, r1]
	rsbs r4, r4, #0
	lsls r4, r4, #4
	movs r2, #0x38
	ldrsh r0, [r7, r2]
	lsls r0, r0, #8
	movs r1, #6
	bl __divsi3
	adds r1, r0, #0
	adds r0, r4, #0
	bl Div
	adds r6, r0, #0
	lsls r6, r6, #0x10
	asrs r6, r6, #0x10
	movs r1, #0
	ldrsh r0, [r5, r1]
	lsls r0, r0, #4
	mov r1, sb
	bl Div
	adds r5, r0, #0
	lsls r5, r5, #0x10
	asrs r5, r5, #0x10
	mov r2, sl
	movs r0, #0
	ldrsh r4, [r2, r0]
	lsls r4, r4, #4
	movs r1, #0x38
	ldrsh r0, [r7, r1]
	lsls r0, r0, #8
	movs r1, #6
	bl __divsi3
	adds r1, r0, #0
	adds r0, r4, #0
	bl Div
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	str r0, [sp]
	movs r0, #8
	mov r1, r8
	adds r2, r6, #0
	adds r3, r5, #0
	bl SetObjAffine
	ldr r4, _08081A94 @ =gStatScreenSt
	ldrb r0, [r4]
	bl sub_80817C8
	ldrh r0, [r7, #0x38]
	adds r0, #1
	strh r0, [r7, #0x38]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #6
	ble _08081A7E
	ldrb r0, [r4]
	adds r1, r7, #0
	adds r1, #0x36
	strb r0, [r1]
	adds r0, r7, #0
	bl Proc_Break
_08081A7E:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08081A90: .4byte gSinLut
_08081A94: .4byte gStatScreenSt

	thumb_func_start sub_8081A98
sub_8081A98: @ 0x08081A98
	movs r2, #0
	movs r1, #0x69
	strh r1, [r0, #0x2a]
	movs r1, #0xca
	strh r1, [r0, #0x2c]
	strh r2, [r0, #0x30]
	strh r2, [r0, #0x2e]
	movs r1, #4
	strh r1, [r0, #0x34]
	strh r1, [r0, #0x32]
	bx lr
	.align 2, 0

	thumb_func_start sub_8081AB0
sub_8081AB0: @ 0x08081AB0
	adds r1, r0, #0
	ldr r2, _08081AE0 @ =gStatScreenSt
	movs r0, #0x20
	ldrh r3, [r2, #2]
	ands r0, r3
	cmp r0, #0
	beq _08081AC6
	movs r0, #0x1f
	strh r0, [r1, #0x32]
	movs r0, #0x63
	strh r0, [r1, #0x2a]
_08081AC6:
	movs r0, #0x10
	ldrh r3, [r2, #2]
	ands r0, r3
	cmp r0, #0
	beq _08081AD8
	movs r0, #0x1f
	strh r0, [r1, #0x34]
	movs r0, #0xd0
	strh r0, [r1, #0x2c]
_08081AD8:
	movs r0, #0
	strh r0, [r2, #2]
	bx lr
	.align 2, 0
_08081AE0: .4byte gStatScreenSt

	thumb_func_start sub_8081AE4
sub_8081AE4: @ 0x08081AE4
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #4
	adds r7, r0, #0
	ldr r0, _08081BBC @ =0x00004640
	mov sb, r0
	ldrh r1, [r7, #0x32]
	ldrh r2, [r7, #0x2e]
	adds r0, r1, r2
	strh r0, [r7, #0x2e]
	ldrh r3, [r7, #0x30]
	ldrh r2, [r7, #0x34]
	adds r0, r3, r2
	strh r0, [r7, #0x30]
	lsls r0, r1, #0x10
	asrs r0, r0, #0x10
	cmp r0, #4
	ble _08081B10
	subs r0, r1, #1
	strh r0, [r7, #0x32]
_08081B10:
	ldrh r1, [r7, #0x34]
	movs r3, #0x34
	ldrsh r0, [r7, r3]
	cmp r0, #4
	ble _08081B1E
	subs r0, r1, #1
	strh r0, [r7, #0x34]
_08081B1E:
	bl GetGameTime
	movs r1, #3
	ands r1, r0
	cmp r1, #0
	bne _08081B46
	ldrh r1, [r7, #0x2a]
	movs r2, #0x2a
	ldrsh r0, [r7, r2]
	cmp r0, #0x68
	bgt _08081B38
	adds r0, r1, #1
	strh r0, [r7, #0x2a]
_08081B38:
	ldrh r1, [r7, #0x2c]
	movs r3, #0x2c
	ldrsh r0, [r7, r3]
	cmp r0, #0xca
	ble _08081B46
	subs r0, r1, #1
	strh r0, [r7, #0x2c]
_08081B46:
	ldr r6, _08081BC0 @ =gStatScreenSt
	movs r0, #4
	ldrsh r5, [r6, r0]
	movs r1, #0x2a
	ldrsh r0, [r7, r1]
	adds r5, r5, r0
	movs r2, #6
	ldrsh r4, [r6, r2]
	adds r4, #6
	ldr r3, _08081BC4 @ =Sprite_8x16
	mov r8, r3
	ldrh r1, [r7, #0x2e]
	lsrs r0, r1, #5
	movs r1, #6
	bl __umodsi3
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	adds r0, #0x4a
	add r0, sb
	str r0, [sp]
	movs r0, #0
	adds r1, r5, #0
	adds r2, r4, #0
	mov r3, r8
	bl PutSprite
	movs r2, #4
	ldrsh r5, [r6, r2]
	movs r3, #0x2c
	ldrsh r0, [r7, r3]
	adds r5, r5, r0
	movs r0, #6
	ldrsh r4, [r6, r0]
	adds r4, #6
	ldr r6, _08081BC8 @ =Sprite_8x16_HFlipped
	ldrh r7, [r7, #0x30]
	lsrs r0, r7, #5
	movs r1, #6
	bl __umodsi3
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	adds r0, #0x4a
	add r0, sb
	str r0, [sp]
	movs r0, #0
	adds r1, r5, #0
	adds r2, r4, #0
	adds r3, r6, #0
	bl PutSprite
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08081BBC: .4byte 0x00004640
_08081BC0: .4byte gStatScreenSt
_08081BC4: .4byte Sprite_8x16
_08081BC8: .4byte Sprite_8x16_HFlipped

	thumb_func_start sub_8081BCC
sub_8081BCC: @ 0x08081BCC
	push {r4, r5, r6, lr}
	sub sp, #4
	ldr r4, _08081C2C @ =gStatScreenSt
	movs r0, #4
	ldrsh r1, [r4, r0]
	adds r1, #0xe3
	movs r3, #6
	ldrsh r2, [r4, r3]
	adds r2, #0xc
	ldr r5, _08081C30 @ =Sprite_8x8
	ldrb r6, [r4, #1]
	ldr r3, _08081C34 @ =0x00004EA4
	adds r0, r6, r3
	str r0, [sp]
	movs r0, #2
	adds r3, r5, #0
	bl PutSprite
	movs r6, #4
	ldrsh r1, [r4, r6]
	adds r1, #0xdd
	movs r0, #6
	ldrsh r2, [r4, r0]
	adds r2, #0xc
	ldr r0, _08081C38 @ =0x00004E45
	str r0, [sp]
	movs r0, #2
	adds r3, r5, #0
	bl PutSprite
	movs r3, #4
	ldrsh r1, [r4, r3]
	adds r1, #0xd6
	movs r6, #6
	ldrsh r2, [r4, r6]
	adds r2, #0xc
	ldrb r4, [r4]
	ldr r3, _08081C3C @ =0x00004EA5
	adds r0, r4, r3
	str r0, [sp]
	movs r0, #2
	adds r3, r5, #0
	bl PutSprite
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08081C2C: .4byte gStatScreenSt
_08081C30: .4byte Sprite_8x8
_08081C34: .4byte 0x00004EA4
_08081C38: .4byte 0x00004E45
_08081C3C: .4byte 0x00004EA5

	thumb_func_start sub_8081C40
sub_8081C40: @ 0x08081C40
	push {r4, lr}
	sub sp, #4
	ldr r4, _08081C94 @ =gStatScreenSt
	movs r0, #4
	ldrsh r1, [r4, r0]
	movs r0, #6
	ldrsh r2, [r4, r0]
	ldr r3, _08081C98 @ =gUnk_08D8A41C
	movs r0, #0xb9
	lsls r0, r0, #6
	str r0, [sp]
	movs r0, #0xc
	bl PutSprite
	movs r0, #4
	ldrsh r1, [r4, r0]
	adds r1, #0x40
	movs r0, #6
	ldrsh r2, [r4, r0]
	adds r2, #0x83
	ldr r3, _08081C9C @ =Sprite_32x16
	ldr r0, _08081CA0 @ =0x00004E90
	str r0, [sp]
	movs r0, #0xb
	bl PutSprite
	movs r0, #4
	ldrsh r1, [r4, r0]
	adds r1, #0x60
	ldr r0, _08081CA4 @ =0x000001FF
	ands r1, r0
	ldrb r2, [r4, #6]
	ldr r3, _08081CA8 @ =gUnk_08D8A466
	ldr r0, _08081CAC @ =0x0000A460
	str r0, [sp]
	movs r0, #2
	bl PutSpriteExt
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08081C94: .4byte gStatScreenSt
_08081C98: .4byte gUnk_08D8A41C
_08081C9C: .4byte Sprite_32x16
_08081CA0: .4byte 0x00004E90
_08081CA4: .4byte 0x000001FF
_08081CA8: .4byte gUnk_08D8A466
_08081CAC: .4byte 0x0000A460

	thumb_func_start sub_8081CB0
sub_8081CB0: @ 0x08081CB0
	push {r4, r5, lr}
	sub sp, #0xc
	bl GetGameTime
	movs r2, #0
	movs r1, #0x1f
	ands r1, r0
	cmp r1, #0x13
	bhi _08081CC4
	movs r2, #1
_08081CC4:
	adds r5, r2, #0
	ldr r1, _08081D6C @ =gUnk_0841CDA0
	add r0, sp, #4
	movs r2, #6
	bl memcpy
	ldr r4, _08081D70 @ =gStatScreenSt
	movs r0, #8
	ldrsb r0, [r4, r0]
	cmp r0, #0
	bne _08081D64
	ldrb r0, [r4]
	cmp r0, #0
	bne _08081D2C
	ldr r0, [r4, #0xc]
	ldr r0, [r0, #0xc]
	movs r1, #0x10
	ands r0, r1
	cmp r0, #0
	beq _08081D2C
	movs r0, #0x78
	movs r1, #0x28
	movs r2, #1
	bl sub_8015F24
	movs r0, #0x78
	movs r1, #0x38
	movs r2, #1
	bl sub_8015F24
	cmp r5, #0
	beq _08081D2C
	ldr r3, _08081D74 @ =Sprite_8x8
	ldr r0, [r4, #0xc]
	ldrb r0, [r0, #0x1b]
	lsrs r0, r0, #6
	lsls r0, r0, #1
	mov r1, sp
	adds r1, r1, r0
	adds r1, #4
	movs r0, #0xf
	ldrh r1, [r1]
	ands r0, r1
	lsls r0, r0, #0xc
	ldr r1, _08081D78 @ =0x00000803
	adds r0, r0, r1
	str r0, [sp]
	movs r0, #4
	movs r1, #0xb8
	movs r2, #0x4e
	bl PutSprite
_08081D2C:
	ldr r0, _08081D70 @ =gStatScreenSt
	ldr r2, [r0, #0xc]
	ldr r0, [r2, #0xc]
	movs r1, #0x20
	ands r0, r1
	cmp r0, #0
	beq _08081D64
	cmp r5, #0
	beq _08081D64
	ldr r3, _08081D74 @ =Sprite_8x8
	ldrb r2, [r2, #0x1b]
	lsrs r0, r2, #6
	lsls r0, r0, #1
	mov r1, sp
	adds r1, r1, r0
	adds r1, #4
	movs r0, #0xf
	ldrh r1, [r1]
	ands r0, r1
	lsls r0, r0, #0xc
	ldr r1, _08081D78 @ =0x00000803
	adds r0, r0, r1
	str r0, [sp]
	movs r0, #4
	movs r1, #0x20
	movs r2, #0x56
	bl PutSprite
_08081D64:
	add sp, #0xc
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08081D6C: .4byte gUnk_0841CDA0
_08081D70: .4byte gStatScreenSt
_08081D74: .4byte Sprite_8x8
_08081D78: .4byte 0x00000803

	thumb_func_start sub_8081D7C
sub_8081D7C: @ 0x08081D7C
	push {r4, lr}
	ldr r3, _08081DD8 @ =gDispIo
	movs r0, #2
	rsbs r0, r0, #0
	ldrb r1, [r3, #1]
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
	strb r0, [r3, #1]
	adds r1, r3, #0
	adds r1, #0x3c
	movs r0, #0xc0
	ldrb r2, [r1]
	orrs r0, r2
	strb r0, [r1]
	adds r0, r3, #0
	adds r0, #0x44
	movs r2, #0
	strb r2, [r0]
	adds r0, #1
	strb r2, [r0]
	movs r4, #0x46
	movs r0, #0x10
	strb r0, [r4, r3]
	ldr r0, _08081DDC @ =0x0000FFE0
	ldrh r4, [r3, #0x3c]
	ands r0, r4
	strh r0, [r3, #0x3c]
	movs r0, #0x20
	ldrb r3, [r1]
	orrs r0, r3
	strb r0, [r1]
	ldr r0, _08081DE0 @ =gPal
	strh r2, [r0]
	bl EnablePalSync
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08081DD8: .4byte gDispIo
_08081DDC: .4byte 0x0000FFE0
_08081DE0: .4byte gPal

	thumb_func_start sub_8081DE4
sub_8081DE4: @ 0x08081DE4
	push {r4, r5, lr}
	sub sp, #0x18
	adds r5, r0, #0
	ldr r1, _08081EB0 @ =gUnk_0841CDA6
	mov r0, sp
	movs r2, #0x18
	bl memcpy
	mov r0, sp
	bl InitBgs
	movs r0, #0x80
	lsls r0, r0, #3
	bl SetBlankChr
	ldr r0, _08081EB4 @ =gBg2Tm
	movs r1, #0
	bl TmFill
	movs r0, #4
	bl EnableBgSync
	bl ApplySystemGraphics
	bl ApplyUnitSpritePalettes
	ldr r1, _08081EB8 @ =0x0600B000
	movs r2, #1
	rsbs r2, r2, #0
	movs r0, #0
	bl StartMuralBackgroundAlt
	ldr r0, _08081EBC @ =gUnk_0840392C
	ldr r1, _08081EC0 @ =0x06014800
	bl Decompress
	movs r0, #4
	bl ApplyIconPalettes
	movs r0, #6
	bl sub_804A2DC
	movs r0, #1
	movs r1, #0x13
	bl ApplyIconPalette
	ldr r0, _08081EC4 @ =gUnk_0840349C
	ldr r4, _08081EC8 @ =gBuf
	adds r1, r4, #0
	bl Decompress
	ldr r0, _08081ECC @ =gBg1Tm
	movs r2, #0x80
	lsls r2, r2, #5
	adds r1, r4, #0
	bl TmApplyTsa_thm
	ldr r0, _08081ED0 @ =gUnk_08403730
	ldr r1, _08081ED4 @ =0x06008C00
	bl Decompress
	ldr r0, _08081ED8 @ =gUnk_084038AC
	movs r1, #0xe0
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r0, _08081EDC @ =gPal + 0x20
	movs r2, #0x88
	lsls r2, r2, #2
	adds r1, r0, r2
	movs r2, #8
	bl CpuFastSet
	movs r0, #1
	movs r1, #0x14
	bl ApplyIconPalette
	ldr r0, _08081EE0 @ =gUnk_0840417C
	ldr r1, _08081EE4 @ =0x06004E00
	bl Decompress
	ldr r0, _08081EE8 @ =gUnk_0840368C
	ldr r1, _08081EEC @ =0x06010C00
	bl Decompress
	ldr r0, _08081EF0 @ =gUnk_081DBD64
	movs r1, #0xd0
	lsls r1, r1, #2
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r1, _08081EF4 @ =gStatScreenSt
	movs r0, #0
	str r0, [r1, #0x10]
	adds r0, r5, #0
	bl StatScreenUnitSlide_End
	add sp, #0x18
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08081EB0: .4byte gUnk_0841CDA6
_08081EB4: .4byte gBg2Tm
_08081EB8: .4byte 0x0600B000
_08081EBC: .4byte gUnk_0840392C
_08081EC0: .4byte 0x06014800
_08081EC4: .4byte gUnk_0840349C
_08081EC8: .4byte gBuf
_08081ECC: .4byte gBg1Tm
_08081ED0: .4byte gUnk_08403730
_08081ED4: .4byte 0x06008C00
_08081ED8: .4byte gUnk_084038AC
_08081EDC: .4byte gPal + 0x20
_08081EE0: .4byte gUnk_0840417C
_08081EE4: .4byte 0x06004E00
_08081EE8: .4byte gUnk_0840368C
_08081EEC: .4byte 0x06010C00
_08081EF0: .4byte gUnk_081DBD64
_08081EF4: .4byte gStatScreenSt

	thumb_func_start StatScreen_InitUnit
StatScreen_InitUnit: @ 0x08081EF8
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r6, r0, #0
	ldr r5, _08081F54 @ =gStatScreenSt
	ldr r0, [r5, #0xc]
	bl GetUnitPortraitId
	adds r4, r0, #0
	ldr r0, [r5, #0xc]
	ldr r0, [r0, #0xc]
	movs r1, #0x80
	lsls r1, r1, #0x10
	ands r0, r1
	cmp r0, #0
	beq _08081F18
	adds r4, #1
_08081F18:
	movs r0, #3
	strb r0, [r5, #1]
	bl ResetText
	bl InitIcons
	bl InitStatScreenText
	ldr r1, _08081F58 @ =gBg2Tm + 0x44
	movs r3, #0x9c
	lsls r3, r3, #3
	movs r0, #0xd
	str r0, [sp]
	adds r0, r6, #0
	adds r2, r4, #0
	bl PutFace80x72
	adds r0, r4, #0
	bl GetFaceInfo
	ldr r0, [r0]
	cmp r0, #0
	beq _08081F60
	ldr r0, _08081F5C @ =gUnk_0840364C
	movs r1, #0x40
	movs r2, #0x20
	bl ApplyPaletteExt
	b _08081F6A
	.align 2, 0
_08081F54: .4byte gStatScreenSt
_08081F58: .4byte gBg2Tm + 0x44
_08081F5C: .4byte gUnk_0840364C
_08081F60:
	ldr r0, _08081FB8 @ =gUnk_0840366C
	movs r1, #0x40
	movs r2, #0x20
	bl ApplyPaletteExt
_08081F6A:
	bl MU_EndAll
	ldr r4, _08081FBC @ =gStatScreenSt
	ldr r0, [r4, #0xc]
	movs r1, #0x50
	movs r2, #0x8a
	bl sub_806C3F8
	str r0, [r4, #0x10]
	bl PutStatScreenLeftPanelInfo
	ldrb r0, [r4]
	bl PutStatScreenPage
	ldr r0, _08081FC0 @ =gUiTmScratchA
	ldr r1, _08081FC4 @ =gBg0Tm + 0x98
	movs r2, #0x12
	movs r3, #0x12
	bl TmCopyRect_thm
	ldr r0, _08081FC8 @ =gUiTmScratchB
	ldr r1, _08081FCC @ =gBg1Tm + 0x98
	movs r2, #0x12
	movs r3, #0x12
	bl TmCopyRect_thm
	ldr r0, _08081FD0 @ =gUiTmScratchC
	ldr r1, _08081FD4 @ =gBg2Tm + 0x98
	movs r2, #0x12
	movs r3, #0x12
	bl TmCopyRect_thm
	movs r0, #7
	bl EnableBgSync
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08081FB8: .4byte gUnk_0840366C
_08081FBC: .4byte gStatScreenSt
_08081FC0: .4byte gUiTmScratchA
_08081FC4: .4byte gBg0Tm + 0x98
_08081FC8: .4byte gUiTmScratchB
_08081FCC: .4byte gBg1Tm + 0x98
_08081FD0: .4byte gUiTmScratchC
_08081FD4: .4byte gBg2Tm + 0x98

	thumb_func_start sub_8081FD8
sub_8081FD8: @ 0x08081FD8
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	ldr r1, _08082060 @ =gpKeySt
	ldr r2, [r1]
	movs r0, #2
	ldrh r3, [r2, #8]
	ands r0, r3
	adds r3, r1, #0
	cmp r0, #0
	beq _08082078
	ldr r3, _08082064 @ =gDispIo
	movs r0, #2
	rsbs r0, r0, #0
	ldrb r4, [r3, #1]
	ands r0, r4
	movs r1, #3
	rsbs r1, r1, #0
	ands r0, r1
	subs r1, #2
	ands r0, r1
	subs r1, #4
	ands r0, r1
	subs r1, #8
	ands r0, r1
	strb r0, [r3, #1]
	adds r1, r3, #0
	adds r1, #0x3c
	movs r0, #0xc0
	ldrb r2, [r1]
	orrs r0, r2
	strb r0, [r1]
	adds r0, r3, #0
	adds r0, #0x44
	movs r2, #0
	strb r2, [r0]
	adds r0, #1
	strb r2, [r0]
	adds r4, r3, #0
	adds r4, #0x46
	movs r0, #0x10
	strb r0, [r4]
	ldr r0, _08082068 @ =0x0000FFE0
	ldrh r4, [r3, #0x3c]
	ands r0, r4
	strh r0, [r3, #0x3c]
	movs r0, #0x20
	ldrb r3, [r1]
	orrs r0, r3
	strb r0, [r1]
	ldr r0, _0808206C @ =gPal
	strh r2, [r0]
	bl EnablePalSync
	adds r0, r5, #0
	bl Proc_Break
	ldr r0, _08082070 @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	bge _08082056
	b _0808215C
_08082056:
	ldr r0, _08082074 @ =0x0000038B
	bl m4aSongNumStart
	b _0808215C
	.align 2, 0
_08082060: .4byte gpKeySt
_08082064: .4byte gDispIo
_08082068: .4byte 0x0000FFE0
_0808206C: .4byte gPal
_08082070: .4byte gPlaySt
_08082074: .4byte 0x0000038B
_08082078:
	ldrh r1, [r2, #6]
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	beq _0808209C
	ldr r4, _08082098 @ =gStatScreenSt
	ldrb r1, [r4, #1]
	ldrb r2, [r4]
	adds r0, r2, r1
	subs r0, #1
	bl __modsi3
	strb r0, [r4]
	ldrb r1, [r4]
	movs r0, #0x20
	b _080820BA
	.align 2, 0
_08082098: .4byte gStatScreenSt
_0808209C:
	movs r6, #0x10
	adds r0, r6, #0
	ands r0, r1
	cmp r0, #0
	beq _080820C8
	ldr r4, _080820C4 @ =gStatScreenSt
	ldrb r1, [r4, #1]
	ldrb r3, [r4]
	adds r0, r3, r1
	adds r0, #1
	bl __modsi3
	strb r0, [r4]
	ldrb r1, [r4]
	movs r0, #0x10
_080820BA:
	adds r2, r5, #0
	bl StartStatScreenPageSlide
	b _0808215C
	.align 2, 0
_080820C4: .4byte gStatScreenSt
_080820C8:
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _080820E8
	ldr r0, _080820E4 @ =gStatScreenSt
	ldr r0, [r0, #0xc]
	movs r4, #1
	rsbs r4, r4, #0
	adds r1, r4, #0
	bl FindNextStatScreenUnit
	adds r2, r0, #0
	adds r1, r4, #0
	b _0808212E
	.align 2, 0
_080820E4: .4byte gStatScreenSt
_080820E8:
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _08082104
	ldr r0, _08082100 @ =gStatScreenSt
	ldr r0, [r0, #0xc]
	movs r1, #1
	bl FindNextStatScreenUnit
	adds r2, r0, #0
	movs r1, #1
	b _0808212E
	.align 2, 0
_08082100: .4byte gStatScreenSt
_08082104:
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0808213C
	ldr r4, _08082138 @ =gStatScreenSt
	ldr r2, [r4, #0xc]
	ldrb r0, [r2, #0x1b]
	cmp r0, #0
	beq _0808213C
	bl GetUnit
	adds r2, r0, #0
	ldr r0, [r4, #0xc]
	ldr r0, [r0, #0xc]
	ands r0, r6
	movs r1, #1
	rsbs r1, r1, #0
	cmp r0, #0
	beq _0808212C
	movs r1, #1
_0808212C:
	adds r0, r2, #0
_0808212E:
	adds r2, r5, #0
	bl StartStatScreenUnitSlide
	b _0808215C
	.align 2, 0
_08082138: .4byte gStatScreenSt
_0808213C:
	ldr r1, [r3]
	movs r0, #0x80
	lsls r0, r0, #1
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _0808215C
	adds r0, r5, #0
	movs r1, #0
	bl Proc_Goto
	ldr r0, _08082164 @ =gStatScreenSt
	ldrb r0, [r0]
	adds r1, r5, #0
	bl StartStatScreenHelp
_0808215C:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08082164: .4byte gStatScreenSt

	thumb_func_start sub_8082168
sub_8082168: @ 0x08082168
	push {r4, lr}
	ldr r3, _08082194 @ =gPlaySt
	movs r1, #0xfc
	ldrb r0, [r3, #0x14]
	ands r1, r0
	ldr r2, _08082198 @ =gStatScreenSt
	movs r0, #3
	ldrb r4, [r2]
	ands r0, r4
	orrs r1, r0
	strb r1, [r3, #0x14]
	ldr r1, _0808219C @ =gStatScreenInfo
	ldr r0, [r2, #0xc]
	ldrb r0, [r0, #0xb]
	strb r0, [r1, #1]
	movs r0, #0
	bl SetOnVMatch
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08082194: .4byte gPlaySt
_08082198: .4byte gStatScreenSt
_0808219C: .4byte gStatScreenInfo

	thumb_func_start sub_80821A0
sub_80821A0: @ 0x080821A0
	push {lr}
	bl sub_8082DAC
	ldr r1, _080821B0 @ =gStatScreenSt
	str r0, [r1, #0x14]
	pop {r0}
	bx r0
	.align 2, 0
_080821B0: .4byte gStatScreenSt

	thumb_func_start sub_80821B4
sub_80821B4: @ 0x080821B4
	push {r4, lr}
	ldr r0, _080821E8 @ =gStatScreenSt
	movs r1, #6
	ldrsh r4, [r0, r1]
	rsbs r4, r4, #0
	movs r0, #0xff
	ands r4, r0
	movs r0, #0
	movs r1, #0
	adds r2, r4, #0
	bl SetBgOffset
	movs r0, #1
	movs r1, #0
	adds r2, r4, #0
	bl SetBgOffset
	movs r0, #2
	movs r1, #0
	adds r2, r4, #0
	bl SetBgOffset
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080821E8: .4byte gStatScreenSt

	thumb_func_start sub_80821EC
sub_80821EC: @ 0x080821EC
	push {lr}
	bl EndMuralBackground
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_80821F8
sub_80821F8: @ 0x080821F8
	push {r4, r5, r6, r7, lr}
	adds r6, r1, #0
	ldr r2, _08082240 @ =gStatScreenSt
	movs r5, #0
	movs r3, #0
	strh r3, [r2, #4]
	strh r3, [r2, #6]
	ldr r4, _08082244 @ =gPlaySt
	movs r1, #3
	ldrb r7, [r4, #0x14]
	ands r1, r7
	strb r1, [r2]
	str r0, [r2, #0xc]
	str r3, [r2, #0x14]
	strh r3, [r2, #2]
	strb r5, [r2, #8]
	ldr r0, [r0]
	ldrb r0, [r0, #4]
	bl sub_80A0978
	adds r4, #0x41
	ldrb r4, [r4]
	lsls r0, r4, #0x1e
	cmp r0, #0
	blt _08082230
	ldr r0, _08082248 @ =0x0000038A
	bl m4aSongNumStart
_08082230:
	ldr r0, _0808224C @ =ProcScr_StatScreen
	adds r1, r6, #0
	bl Proc_StartBlocking
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08082240: .4byte gStatScreenSt
_08082244: .4byte gPlaySt
_08082248: .4byte 0x0000038A
_0808224C: .4byte ProcScr_StatScreen

	thumb_func_start StartStatScreenHelp
StartStatScreenHelp: @ 0x08082250
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	movs r1, #1
	rsbs r1, r1, #0
	movs r0, #0
	bl LoadHelpBoxGfx
	ldr r1, _08082278 @ =gStatScreenSt
	ldr r0, [r1, #0x14]
	cmp r0, #0
	bne _08082298
	cmp r4, #1
	beq _0808228C
	cmp r4, #1
	bgt _0808227C
	cmp r4, #0
	beq _08082282
	b _08082298
	.align 2, 0
_08082278: .4byte gStatScreenSt
_0808227C:
	cmp r4, #2
	beq _08082294
	b _08082298
_08082282:
	ldr r0, _08082288 @ =gUnk_08D8A704
	b _08082296
	.align 2, 0
_08082288: .4byte gUnk_08D8A704
_0808228C:
	ldr r0, _08082290 @ =gUnk_08D8A8E0
	b _08082296
	.align 2, 0
_08082290: .4byte gUnk_08D8A8E0
_08082294:
	ldr r0, _080822A8 @ =gUnk_08D8AA84
_08082296:
	str r0, [r1, #0x14]
_08082298:
	ldr r0, _080822AC @ =gStatScreenSt
	ldr r0, [r0, #0x14]
	adds r1, r5, #0
	bl sub_80829F4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080822A8: .4byte gUnk_08D8AA84
_080822AC: .4byte gStatScreenSt

	thumb_func_start sub_80822B0
sub_80822B0: @ 0x080822B0
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _080822D8 @ =gStatScreenSt
	ldr r0, [r0, #0xc]
	ldr r1, [r4, #0x2c]
	ldrh r1, [r1, #0x12]
	lsls r1, r1, #1
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r0, [r0]
	adds r1, r4, #0
	adds r1, #0x4e
	strh r0, [r1]
	bl GetItemDescId
	adds r4, #0x4c
	strh r0, [r4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080822D8: .4byte gStatScreenSt

	thumb_func_start sub_80822DC
sub_80822DC: @ 0x080822DC
	adds r2, r0, #0
	ldr r0, _080822F8 @ =gStatScreenSt
	ldr r0, [r0, #0xc]
	adds r0, #0x30
	ldrb r0, [r0]
	lsls r0, r0, #0x1c
	lsrs r0, r0, #0x1c
	cmp r0, #8
	bhi _0808238C
	lsls r0, r0, #2
	ldr r1, _080822FC @ =_08082300
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080822F8: .4byte gStatScreenSt
_080822FC: .4byte _08082300
_08082300: @ jump table
	.4byte _08082324 @ case 0
	.4byte _08082330 @ case 1
	.4byte _0808233A @ case 2
	.4byte _08082348 @ case 3
	.4byte _08082354 @ case 4
	.4byte _08082360 @ case 5
	.4byte _0808236A @ case 6
	.4byte _08082378 @ case 7
	.4byte _08082384 @ case 8
_08082324:
	adds r1, r2, #0
	adds r1, #0x4c
	ldr r0, _0808232C @ =0x00000273
	b _0808238A
	.align 2, 0
_0808232C: .4byte 0x00000273
_08082330:
	adds r1, r2, #0
	adds r1, #0x4c
	movs r0, #0x9d
	lsls r0, r0, #2
	b _0808238A
_0808233A:
	adds r1, r2, #0
	adds r1, #0x4c
	ldr r0, _08082344 @ =0x00000275
	b _0808238A
	.align 2, 0
_08082344: .4byte 0x00000275
_08082348:
	adds r1, r2, #0
	adds r1, #0x4c
	ldr r0, _08082350 @ =0x00000277
	b _0808238A
	.align 2, 0
_08082350: .4byte 0x00000277
_08082354:
	adds r1, r2, #0
	adds r1, #0x4c
	ldr r0, _0808235C @ =0x00000276
	b _0808238A
	.align 2, 0
_0808235C: .4byte 0x00000276
_08082360:
	adds r1, r2, #0
	adds r1, #0x4c
	movs r0, #0x9e
	lsls r0, r0, #2
	b _0808238A
_0808236A:
	adds r1, r2, #0
	adds r1, #0x4c
	ldr r0, _08082374 @ =0x00000279
	b _0808238A
	.align 2, 0
_08082374: .4byte 0x00000279
_08082378:
	adds r1, r2, #0
	adds r1, #0x4c
	ldr r0, _08082380 @ =0x0000027A
	b _0808238A
	.align 2, 0
_08082380: .4byte 0x0000027A
_08082384:
	adds r1, r2, #0
	adds r1, #0x4c
	ldr r0, _08082390 @ =0x0000027B
_0808238A:
	strh r0, [r1]
_0808238C:
	bx lr
	.align 2, 0
_08082390: .4byte 0x0000027B

	thumb_func_start sub_8082394
sub_8082394: @ 0x08082394
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _080823B0 @ =gStatScreenSt
	ldr r0, [r0, #0xc]
	bl UnitHasMagicRank
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080823B4
	adds r1, r4, #0
	adds r1, #0x4c
	movs r0, #0x9a
	lsls r0, r0, #2
	b _080823BA
	.align 2, 0
_080823B0: .4byte gStatScreenSt
_080823B4:
	adds r1, r4, #0
	adds r1, #0x4c
	ldr r0, _080823C4 @ =0x00000267
_080823BA:
	strh r0, [r1]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080823C4: .4byte 0x00000267

	thumb_func_start sub_80823C8
sub_80823C8: @ 0x080823C8
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r5, _08082408 @ =gStatScreenSt
	ldr r0, [r5, #0xc]
	ldrh r0, [r0, #0x1e]
	cmp r0, #0
	bne _080823DC
	adds r0, r4, #0
	bl HelpBoxTryRelocateLeft
_080823DC:
	ldr r0, [r5, #0xc]
	ldr r1, [r4, #0x2c]
	ldrh r1, [r1, #0x12]
	lsls r1, r1, #1
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r0, [r0]
	cmp r0, #0
	bne _08082416
	adds r0, r4, #0
	adds r0, #0x50
	ldrh r0, [r0]
	cmp r0, #0
	beq _08082400
	cmp r0, #0x10
	beq _08082400
	cmp r0, #0x40
	bne _0808240C
_08082400:
	adds r0, r4, #0
	bl HelpBoxTryRelocateUp
	b _08082416
	.align 2, 0
_08082408: .4byte gStatScreenSt
_0808240C:
	cmp r0, #0x80
	bne _08082416
	adds r0, r4, #0
	bl HelpBoxTryRelocateDown
_08082416:
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start sub_808241C
sub_808241C: @ 0x0808241C
	push {r4, r5, lr}
	sub sp, #0x10
	adds r5, r0, #0
	ldr r1, _08082454 @ =gUnk_0841CDBE
	mov r0, sp
	movs r2, #0x10
	bl memcpy
	ldr r0, [r5, #0x2c]
	ldrh r4, [r0, #0x12]
	ldr r0, _08082458 @ =gStatScreenSt
	ldr r0, [r0, #0xc]
	bl UnitHasMagicRank
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08082440
	adds r4, #4
_08082440:
	lsls r0, r4, #1
	add r0, sp
	ldrh r1, [r0]
	adds r0, r5, #0
	adds r0, #0x4c
	strh r1, [r0]
	add sp, #0x10
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08082454: .4byte gUnk_0841CDBE
_08082458: .4byte gStatScreenSt

	thumb_func_start sub_808245C
sub_808245C: @ 0x0808245C
	adds r1, r0, #0
	ldr r0, _08082474 @ =gStatScreenSt
	ldr r0, [r0, #0xc]
	ldr r0, [r0]
	ldrh r2, [r0, #2]
	cmp r2, #0
	beq _08082478
	adds r0, r1, #0
	adds r0, #0x4c
	strh r2, [r0]
	b _0808247E
	.align 2, 0
_08082474: .4byte gStatScreenSt
_08082478:
	adds r1, #0x4c
	ldr r0, _08082480 @ =0x0000039B
	strh r0, [r1]
_0808247E:
	bx lr
	.align 2, 0
_08082480: .4byte 0x0000039B

	thumb_func_start sub_8082484
sub_8082484: @ 0x08082484
	ldr r1, _08082494 @ =gStatScreenSt
	ldr r1, [r1, #0xc]
	ldr r1, [r1, #4]
	ldrh r1, [r1, #2]
	adds r0, #0x4c
	strh r1, [r0]
	bx lr
	.align 2, 0
_08082494: .4byte gStatScreenSt

	thumb_func_start sub_8082498
sub_8082498: @ 0x08082498
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _080824BC @ =gStatScreenSt
	ldr r0, [r0, #0xc]
	bl GetUnitTotalSupportLevel
	cmp r0, #0
	bne _080824C6
	adds r0, r4, #0
	adds r0, #0x50
	ldrh r0, [r0]
	cmp r0, #0x80
	bne _080824C0
	adds r0, r4, #0
	bl HelpBoxTryRelocateDown
	b _080824C6
	.align 2, 0
_080824BC: .4byte gStatScreenSt
_080824C0:
	adds r0, r4, #0
	bl HelpBoxTryRelocateUp
_080824C6:
	pop {r4}
	pop {r0}
	bx r0
