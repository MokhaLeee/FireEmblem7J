	.include "macro.inc"

	.syntax unified

	thumb_func_start InitSpriteAnims
InitSpriteAnims: @ 0x08012640
	ldr r1, _08012654 @ =0x03000110
	movs r2, #0
	movs r3, #0xbe
	lsls r3, r3, #2
	adds r0, r1, r3
_0801264A:
	str r2, [r0]
	subs r0, #0x28
	cmp r0, r1
	bge _0801264A
	bx lr
	.align 2, 0
_08012654: .4byte 0x03000110

	thumb_func_start StartSpriteAnim
StartSpriteAnim: @ 0x08012658
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	lsls r1, r1, #0x10
	lsrs r5, r1, #0x10
	movs r0, #0
	bl sub_08012AD0
	adds r4, r0, #0
	cmp r4, #0
	beq _08012678
	adds r1, r6, #0
	adds r2, r5, #0
	bl sub_08012A98
	adds r0, r4, #0
	b _0801267A
_08012678:
	movs r0, #0
_0801267A:
	pop {r4, r5, r6}
	pop {r1}
	bx r1

	thumb_func_start sub_08012680
sub_08012680: @ 0x08012680
	adds r1, r0, #0
	cmp r1, #0
	beq _08012690
	ldr r0, [r1]
	cmp r0, #0
	beq _08012690
	movs r0, #0
	str r0, [r1]
_08012690:
	bx lr
	.align 2, 0

	thumb_func_start sub_08012694
sub_08012694: @ 0x08012694
	push {r4, lr}
	adds r4, r0, #0
	cmp r4, #0
	beq _080126A2
	ldr r0, [r4]
	cmp r0, #0
	bne _080126A6
_080126A2:
	movs r0, #0
	b _080126B6
_080126A6:
	adds r0, r4, #0
	bl sub_080126BC
	adds r0, r4, #0
	bl sub_08012718
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
_080126B6:
	pop {r4}
	pop {r1}
	bx r1

	thumb_func_start sub_080126BC
sub_080126BC: @ 0x080126BC
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r4, r0, #0
	adds r5, r1, #0
	adds r6, r2, #0
	movs r2, #0
	cmp r4, #0
	beq _0801270E
	ldr r0, [r4]
	cmp r0, #0
	beq _0801270E
	ldr r0, [r4, #0x14]
	cmp r0, #0
	beq _080126E6
	adds r0, r4, #0
	bl sub_08012808
	adds r0, r4, #0
	adds r0, #0x21
	ldrb r0, [r0]
	lsls r2, r0, #9
_080126E6:
	ldrh r0, [r4, #0x1e]
	orrs r2, r5
	ldr r3, [r4, #0x10]
	ldrh r1, [r4, #0x22]
	str r1, [sp]
	adds r1, r2, #0
	adds r2, r6, #0
	bl sub_080068C4
	ldr r0, [r4, #0x24]
	cmp r0, #0
	beq _0801270E
	adds r0, r4, #0
	adds r0, #0x20
	ldrb r0, [r0]
	cmp r0, #0
	beq _0801270E
	adds r0, r4, #0
	bl sub_08012944
_0801270E:
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_08012718
sub_08012718: @ 0x08012718
	push {r4, lr}
	adds r2, r0, #0
	cmp r2, #0
	beq _0801278A
	ldr r0, [r2]
	cmp r0, #0
	beq _0801278A
	ldrh r0, [r2, #0x1a]
	cmp r0, #0
	beq _08012740
	ldrh r1, [r2, #0x18]
	movs r3, #0x18
	ldrsh r0, [r2, r3]
	cmp r0, #0
	beq _0801274E
	subs r0, r1, #1
	strh r0, [r2, #0x18]
	lsls r0, r0, #0x10
	cmp r0, #0
	ble _08012744
_08012740:
	movs r0, #1
	b _08012802
_08012744:
	movs r0, #0
	strh r0, [r2, #0x18]
	ldr r0, [r2, #0xc]
	adds r0, #4
	str r0, [r2, #0xc]
_0801274E:
	ldr r0, [r2, #0xc]
	ldrh r1, [r0]
	adds r4, r0, #0
	cmp r1, #0
	bne _0801278E
	ldrh r1, [r4, #2]
	cmp r1, #1
	beq _08012784
	cmp r1, #1
	bgt _08012768
	cmp r1, #0
	beq _0801278A
	b _0801278E
_08012768:
	ldr r0, _08012780 @ =0x0000FFFF
	cmp r1, r0
	bne _0801278E
	ldr r0, [r2, #8]
	str r0, [r2, #0xc]
	adds r0, r2, #0
	bl sub_08012718
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	b _08012802
	.align 2, 0
_08012780: .4byte 0x0000FFFF
_08012784:
	adds r0, r2, #0
	bl sub_08012680
_0801278A:
	movs r0, #0
	b _08012802
_0801278E:
	ldrh r1, [r2, #0x1a]
	ldrh r3, [r4]
	adds r0, r1, #0
	muls r0, r3, r0
	ldrh r3, [r2, #0x1c]
	adds r1, r3, r0
	strh r1, [r2, #0x1c]
	lsls r3, r1, #0x10
	lsrs r0, r3, #0x10
	cmp r0, #0xff
	bhi _080127B4
	movs r0, #1
	strh r0, [r2, #0x18]
	adds r0, r2, #0
	bl sub_08012718
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	b _08012802
_080127B4:
	lsrs r0, r3, #0x18
	strh r0, [r2, #0x18]
	movs r0, #0xff
	ands r1, r0
	strh r1, [r2, #0x1c]
	ldr r1, [r2, #4]
	ldrh r4, [r4, #2]
	lsls r0, r4, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	lsrs r0, r0, #1
	lsls r0, r0, #1
	adds r3, r1, r0
	str r3, [r2, #0x10]
	ldrh r4, [r3]
	movs r0, #0x80
	lsls r0, r0, #8
	ands r0, r4
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0
	beq _080127F8
	str r3, [r2, #0x14]
	ldr r1, _080127F4 @ =0x00007FFF
	ands r1, r4
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #1
	adds r0, #2
	adds r0, r3, r0
	str r0, [r2, #0x10]
	b _080127FA
	.align 2, 0
_080127F4: .4byte 0x00007FFF
_080127F8:
	str r0, [r2, #0x14]
_080127FA:
	adds r1, r2, #0
	adds r1, #0x20
	movs r0, #1
	strb r0, [r1]
_08012802:
	pop {r4}
	pop {r1}
	bx r1

	thumb_func_start sub_08012808
sub_08012808: @ 0x08012808
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	str r0, [sp, #4]
	cmp r0, #0
	beq _080128D8
	ldr r0, [r0]
	cmp r0, #0
	beq _080128D8
	ldr r1, [sp, #4]
	ldr r0, [r1, #0x14]
	cmp r0, #0
	beq _080128D8
	ldr r2, _080128E8 @ =0x00007FFF
	ldrh r1, [r0]
	ands r1, r2
	str r1, [sp, #8]
	adds r7, r0, #2
	movs r2, #0
	mov r8, r2
	cmp r8, r1
	bge _080128D8
	ldr r0, _080128EC @ =0x080C0E98
	mov sb, r0
	movs r1, #0xff
	mov sl, r1
_08012842:
	mov r0, sl
	ldrh r2, [r7]
	ands r0, r2
	adds r0, #0x40
	lsls r0, r0, #1
	add r0, sb
	movs r1, #0
	ldrsh r0, [r0, r1]
	lsls r0, r0, #4
	ldrh r1, [r7, #2]
	bl Div
	adds r6, r0, #0
	lsls r6, r6, #0x10
	asrs r6, r6, #0x10
	mov r0, sl
	ldrh r2, [r7]
	ands r0, r2
	lsls r0, r0, #1
	add r0, sb
	movs r1, #0
	ldrsh r0, [r0, r1]
	rsbs r0, r0, #0
	lsls r0, r0, #4
	ldrh r1, [r7, #4]
	bl Div
	adds r5, r0, #0
	lsls r5, r5, #0x10
	asrs r5, r5, #0x10
	mov r0, sl
	ldrh r2, [r7]
	ands r0, r2
	lsls r0, r0, #1
	add r0, sb
	movs r1, #0
	ldrsh r0, [r0, r1]
	lsls r0, r0, #4
	ldrh r1, [r7, #2]
	bl Div
	adds r4, r0, #0
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	mov r0, sl
	ldrh r2, [r7]
	ands r0, r2
	adds r0, #0x40
	lsls r0, r0, #1
	add r0, sb
	movs r1, #0
	ldrsh r0, [r0, r1]
	lsls r0, r0, #4
	ldrh r1, [r7, #4]
	bl Div
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	ldr r1, [sp, #4]
	adds r1, #0x21
	ldrb r1, [r1]
	add r1, r8
	str r0, [sp]
	adds r0, r1, #0
	adds r1, r6, #0
	adds r2, r5, #0
	adds r3, r4, #0
	bl SetObjAffine
	adds r7, #6
	movs r2, #1
	add r8, r2
	ldr r0, [sp, #8]
	cmp r8, r0
	blt _08012842
_080128D8:
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080128E8: .4byte 0x00007FFF
_080128EC: .4byte 0x080C0E98

	thumb_func_start sub_080128F0
sub_080128F0: @ 0x080128F0
	push {r4, lr}
	adds r3, r0, #0
	cmp r3, #0
	beq _0801291C
	ldr r2, [r3]
	cmp r2, #0
	beq _0801291C
	ldrh r4, [r2, #2]
	lsrs r0, r4, #1
	lsls r0, r0, #1
	adds r0, r2, r0
	lsls r1, r1, #1
	adds r1, r1, r0
	ldrh r1, [r1]
	lsrs r1, r1, #1
	lsls r1, r1, #1
	adds r0, r0, r1
	str r0, [r3, #8]
	str r0, [r3, #0xc]
	adds r0, r3, #0
	bl sub_08012A78
_0801291C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_08012924
sub_08012924: @ 0x08012924
	push {r4, lr}
	adds r4, r0, #0
	cmp r4, #0
	beq _0801293E
	ldr r0, [r4]
	cmp r0, #0
	beq _0801293E
	adds r0, r4, #0
	bl sub_08012A54
	adds r0, r4, #0
	bl sub_08012A78
_0801293E:
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_08012944
sub_08012944: @ 0x08012944
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	adds r6, r0, #0
	cmp r6, #0
	beq _08012A3E
	ldr r0, [r6]
	cmp r0, #0
	beq _08012A3E
	ldr r0, [r6, #0x10]
	ldrh r5, [r0]
	adds r4, r0, #2
	adds r2, r5, #0
	lsls r1, r5, #1
	adds r1, r1, r5
	lsls r1, r1, #1
	adds r1, #2
	adds r0, r0, r1
	mov sl, r0
	movs r0, #0
	mov r8, r0
	subs r5, #1
	adds r1, r6, #0
	adds r1, #0x20
	str r1, [sp]
	cmp r2, #0
	ble _08012A38
	ldr r2, _080129F4 @ =0x08C01714
	mov sb, r2
	movs r7, #0xc0
	lsls r7, r7, #8
_08012988:
	ldr r1, _080129F8 @ =0x000003FF
	mov r3, sl
	ldrh r3, [r3]
	ands r1, r3
	lsls r1, r1, #5
	ldr r0, [r6, #0x24]
	adds r0, r0, r1
	ldr r1, _080129F8 @ =0x000003FF
	ldrh r2, [r6, #0x22]
	ands r1, r2
	lsls r1, r1, #5
	ldr r2, _080129FC @ =0x06010000
	add r2, r8
	adds r1, r1, r2
	adds r3, r7, #0
	ldrh r2, [r4]
	ands r3, r2
	lsrs r3, r3, #0xc
	mov ip, r3
	adds r2, r7, #0
	ldrh r3, [r4, #2]
	ands r2, r3
	lsrs r2, r2, #0xe
	add r2, ip
	lsls r3, r2, #1
	adds r2, r3, #0
	add r2, sb
	ldrb r2, [r2]
	mov ip, r2
	adds r3, #1
	add r3, sb
	ldrb r3, [r3]
	bl sub_0801372C
	ldr r1, _08012A00 @ =0x03002790
	movs r0, #0x40
	ldrb r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _08012A04
	adds r0, r7, #0
	ldrh r3, [r4]
	ands r0, r3
	lsrs r0, r0, #0xc
	adds r1, r7, #0
	ldrh r2, [r4, #2]
	ands r1, r2
	lsrs r1, r1, #0xe
	adds r0, r0, r1
	lsls r0, r0, #1
	add r0, sb
	ldrb r0, [r0]
	b _08012A26
	.align 2, 0
_080129F4: .4byte 0x08C01714
_080129F8: .4byte 0x000003FF
_080129FC: .4byte 0x06010000
_08012A00: .4byte 0x03002790
_08012A04:
	adds r0, r7, #0
	ldrh r3, [r4]
	ands r0, r3
	lsrs r0, r0, #0xc
	adds r1, r7, #0
	ldrh r2, [r4, #2]
	ands r1, r2
	lsrs r1, r1, #0xe
	adds r0, r0, r1
	lsls r0, r0, #1
	add r0, sb
	ldrb r1, [r0]
	adds r3, r1, #0
	muls r3, r1, r3
	adds r0, r3, #0
	ldr r2, _08012A50 @ =0x000003FF
	ands r0, r2
_08012A26:
	lsls r0, r0, #5
	add r8, r0
	adds r4, #6
	movs r3, #2
	add sl, r3
	adds r0, r5, #0
	subs r5, #1
	cmp r0, #0
	bgt _08012988
_08012A38:
	movs r0, #0
	ldr r1, [sp]
	strb r0, [r1]
_08012A3E:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08012A50: .4byte 0x000003FF

	thumb_func_start sub_08012A54
sub_08012A54: @ 0x08012A54
	str r1, [r0]
	ldrh r3, [r1]
	lsrs r2, r3, #1
	lsls r2, r2, #1
	adds r2, r1, r2
	str r2, [r0, #4]
	ldrh r3, [r1, #2]
	lsrs r2, r3, #1
	lsls r2, r2, #1
	adds r1, r1, r2
	ldrh r3, [r1]
	lsrs r2, r3, #1
	lsls r2, r2, #1
	adds r1, r1, r2
	str r1, [r0, #8]
	str r1, [r0, #0xc]
	bx lr
	.align 2, 0

	thumb_func_start sub_08012A78
sub_08012A78: @ 0x08012A78
	push {r4, r5, lr}
	adds r4, r0, #0
	movs r0, #0
	ldrh r5, [r4, #0x1a]
	strh r0, [r4, #0x18]
	movs r0, #0x80
	lsls r0, r0, #1
	strh r0, [r4, #0x1a]
	adds r0, r4, #0
	bl sub_08012718
	strh r5, [r4, #0x1a]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_08012A98
sub_08012A98: @ 0x08012A98
	push {r4, r5, lr}
	adds r4, r0, #0
	lsls r5, r2, #0x10
	lsrs r5, r5, #0x10
	bl sub_08012A54
	movs r1, #0
	str r1, [r4, #0x24]
	movs r0, #0
	strh r1, [r4, #0x22]
	strh r1, [r4, #0x18]
	strh r5, [r4, #0x1e]
	str r1, [r4, #0x14]
	adds r2, r4, #0
	adds r2, #0x21
	strb r0, [r2]
	strh r1, [r4, #0x18]
	movs r0, #0x80
	lsls r0, r0, #1
	strh r0, [r4, #0x1a]
	strh r1, [r4, #0x1c]
	adds r0, r4, #0
	bl sub_08012718
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_08012AD0
sub_08012AD0: @ 0x08012AD0
	adds r3, r0, #0
	movs r2, #0
	ldr r1, _08012AE0 @ =0x03000110
_08012AD6:
	ldr r0, [r1]
	cmp r0, r3
	bne _08012AE4
	adds r0, r1, #0
	b _08012AEE
	.align 2, 0
_08012AE0: .4byte 0x03000110
_08012AE4:
	adds r1, #0x28
	adds r2, #1
	cmp r2, #0x13
	ble _08012AD6
	movs r0, #0
_08012AEE:
	bx lr

	thumb_func_start sub_08012AF0
sub_08012AF0: @ 0x08012AF0
	push {r4, r5, r6, lr}
	mov r6, sb
	mov r5, r8
	push {r5, r6}
	mov r8, r1
	mov sb, r2
	adds r6, r3, #0
	ldr r5, [sp, #0x18]
	ldr r1, [sp, #0x1c]
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	bl StartSpriteAnim
	adds r4, r0, #0
	adds r1, r5, #0
	bl sub_080128F0
	strh r6, [r4, #0x22]
	ldr r0, _08012B34 @ =0x08C016FC
	movs r1, #3
	bl Proc_Start
	str r4, [r0, #0x50]
	mov r1, r8
	str r1, [r0, #0x54]
	mov r1, sb
	str r1, [r0, #0x58]
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_08012B34: .4byte 0x08C016FC

	thumb_func_start sub_08012B38
sub_08012B38: @ 0x08012B38
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x50]
	ldr r1, [r4, #0x54]
	ldr r2, [r4, #0x58]
	bl sub_08012694
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08012B5E
	ldr r0, [r4, #0x50]
	cmp r0, #0
	beq _08012B58
	ldr r0, [r0]
	cmp r0, #0
	bne _08012B5E
_08012B58:
	adds r0, r4, #0
	bl Proc_End
_08012B5E:
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_08012B64
sub_08012B64: @ 0x08012B64
	push {lr}
	ldr r0, [r0, #0x50]
	bl sub_08012680
	pop {r0}
	bx r0

	thumb_func_start sub_08012B70
sub_08012B70: @ 0x08012B70
	push {r4, lr}
	adds r4, r0, #0
	str r1, [r4, #0x54]
	str r2, [r4, #0x58]
	movs r0, #1
	rsbs r0, r0, #0
	cmp r3, r0
	beq _08012B84
	ldr r0, [r4, #0x50]
	strh r3, [r0, #0x22]
_08012B84:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start EndSpriteAnimProc
EndSpriteAnimProc: @ 0x08012B8C
	push {lr}
	bl Proc_End
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start EndEachSpriteAnimProc
EndEachSpriteAnimProc: @ 0x08012B98
	push {lr}
	ldr r0, _08012BA4 @ =0x08C016FC
	bl sub_08004748
	pop {r0}
	bx r0
	.align 2, 0
_08012BA4: .4byte 0x08C016FC

	thumb_func_start SpriteAnimProcExists
SpriteAnimProcExists: @ 0x08012BA8
	push {lr}
	ldr r0, _08012BBC @ =0x08C016FC
	bl Proc_Find
	cmp r0, #0
	beq _08012BB6
	movs r0, #1
_08012BB6:
	pop {r1}
	bx r1
	.align 2, 0
_08012BBC: .4byte 0x08C016FC
