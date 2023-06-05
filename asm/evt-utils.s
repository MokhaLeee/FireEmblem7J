	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08010630
sub_08010630: @ 0x08010630
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	adds r6, r0, #0
	ldr r2, [r6, #0x38]
	movs r1, #0x80
	lsls r1, r1, #3
	adds r0, r2, r1
	ldr r4, _08010748 @ =0x0001FFFF
	ands r0, r4
	lsrs r0, r0, #5
	str r0, [sp, #4]
	ldr r1, [r6, #0x3c]
	adds r0, r1, #1
	movs r3, #0xf
	ands r0, r3
	lsls r0, r0, #0xc
	ldr r5, [sp, #4]
	orrs r5, r0
	str r5, [sp, #4]
	ands r2, r4
	lsrs r7, r2, #5
	ands r1, r3
	lsls r1, r1, #0xc
	orrs r7, r1
	ldr r1, [r6, #0x30]
	adds r4, r6, #0
	adds r4, #0x48
	ldr r2, [r6, #0x34]
	ldrh r0, [r4]
	adds r2, r0, r2
	ldr r5, _0801074C @ =0x08BFF798
	str r7, [sp]
	movs r0, #4
	adds r3, r5, #0
	bl sub_080068C4
	ldr r0, [r6, #0x44]
	subs r0, #2
	lsls r0, r0, #3
	ldr r1, [r6, #0x30]
	adds r1, r1, r0
	ldr r2, [r6, #0x34]
	ldrh r3, [r4]
	adds r2, r3, r2
	adds r0, r7, #4
	str r0, [sp]
	movs r0, #4
	adds r3, r5, #0
	bl sub_080068C4
	ldr r1, [r6, #0x30]
	ldrh r0, [r4]
	adds r0, #0x18
	ldr r2, [r6, #0x34]
	adds r2, r2, r0
	adds r0, r7, #0
	adds r0, #0xd
	str r0, [sp]
	movs r0, #4
	adds r3, r5, #0
	bl sub_080068C4
	ldr r0, [r6, #0x44]
	subs r0, #2
	lsls r0, r0, #3
	ldr r1, [r6, #0x30]
	adds r1, r1, r0
	ldrh r0, [r4]
	adds r0, #0x18
	ldr r2, [r6, #0x34]
	adds r2, r2, r0
	adds r0, r7, #0
	adds r0, #0x11
	str r0, [sp]
	movs r0, #4
	adds r3, r5, #0
	bl sub_080068C4
	ldr r1, [r6, #0x30]
	ldrh r0, [r4]
	adds r0, #8
	ldr r2, [r6, #0x34]
	adds r2, r2, r0
	ldr r5, _08010750 @ =0x08BFF760
	adds r0, r7, #6
	str r0, [sp]
	movs r0, #4
	adds r3, r5, #0
	bl sub_080068C4
	ldr r1, [r6, #0x30]
	ldrh r0, [r4]
	adds r0, #0x10
	ldr r2, [r6, #0x34]
	adds r2, r2, r0
	adds r0, r7, #0
	adds r0, #0xb
	str r0, [sp]
	movs r0, #4
	adds r3, r5, #0
	bl sub_080068C4
	ldr r0, [r6, #0x44]
	subs r0, #1
	lsls r0, r0, #3
	ldr r1, [r6, #0x30]
	adds r1, r1, r0
	ldrh r0, [r4]
	adds r0, #8
	ldr r2, [r6, #0x34]
	adds r2, r2, r0
	adds r0, r7, #0
	adds r0, #0xa
	str r0, [sp]
	movs r0, #4
	adds r3, r5, #0
	bl sub_080068C4
	ldr r0, [r6, #0x44]
	subs r0, #1
	lsls r0, r0, #3
	ldr r1, [r6, #0x30]
	adds r1, r1, r0
	ldrh r0, [r4]
	adds r0, #0x10
	ldr r2, [r6, #0x34]
	adds r2, r2, r0
	adds r0, r7, #0
	adds r0, #0xc
	str r0, [sp]
	movs r0, #4
	adds r3, r5, #0
	bl sub_080068C4
	movs r5, #2
	b _08010772
	.align 2, 0
_08010748: .4byte 0x0001FFFF
_0801074C: .4byte 0x08BFF798
_08010750: .4byte 0x08BFF760
_08010754:
	lsls r0, r5, #3
	ldr r1, [r6, #0x30]
	adds r1, r1, r0
	adds r0, r6, #0
	adds r0, #0x48
	ldr r2, [r6, #0x34]
	ldrh r0, [r0]
	adds r2, r0, r2
	adds r0, r7, #2
	str r0, [sp]
	movs r0, #4
	ldr r3, _080107B0 @ =0x08BFF798
	bl sub_080068C4
	adds r5, #2
_08010772:
	ldr r0, [r6, #0x44]
	subs r0, #2
	cmp r5, r0
	blt _08010754
	ldr r0, [r6, #0x44]
	subs r0, #1
	movs r1, #0x48
	adds r1, r1, r6
	mov sl, r1
	cmp r5, r0
	bge _080107AC
_08010788:
	lsls r0, r5, #3
	ldr r1, [r6, #0x30]
	adds r1, r1, r0
	ldr r2, [r6, #0x34]
	mov r3, sl
	ldrh r3, [r3]
	adds r2, r3, r2
	adds r0, r7, #2
	str r0, [sp]
	movs r0, #4
	ldr r3, _080107B4 @ =0x08BFF760
	bl sub_080068C4
	adds r5, #1
	ldr r0, [r6, #0x44]
	subs r0, #1
	cmp r5, r0
	blt _08010788
_080107AC:
	movs r5, #2
	b _080107D8
	.align 2, 0
_080107B0: .4byte 0x08BFF798
_080107B4: .4byte 0x08BFF760
_080107B8:
	lsls r0, r5, #3
	ldr r1, [r6, #0x30]
	adds r1, r1, r0
	mov r2, sl
	ldrh r0, [r2]
	adds r0, #0x18
	ldr r2, [r6, #0x34]
	adds r2, r2, r0
	adds r0, r7, #0
	adds r0, #0xf
	str r0, [sp]
	movs r0, #4
	ldr r3, _080108B8 @ =0x08BFF798
	bl sub_080068C4
	adds r5, #2
_080107D8:
	ldr r0, [r6, #0x44]
	subs r0, #2
	cmp r5, r0
	blt _080107B8
	movs r5, #1
	ldr r0, [r6, #0x44]
	subs r0, #2
	cmp r5, r0
	bge _08010832
	mov sb, sl
	movs r3, #8
	adds r3, r3, r7
	mov r8, r3
_080107F2:
	lsls r4, r5, #3
	ldr r1, [r6, #0x30]
	adds r1, r1, r4
	mov r2, sb
	ldrh r0, [r2]
	adds r0, #8
	ldr r2, [r6, #0x34]
	adds r2, r2, r0
	mov r3, r8
	str r3, [sp]
	movs r0, #4
	ldr r3, _080108B8 @ =0x08BFF798
	bl sub_080068C4
	ldr r1, [r6, #0x30]
	adds r1, r1, r4
	mov r2, sb
	ldrh r0, [r2]
	adds r0, #0x10
	ldr r2, [r6, #0x34]
	adds r2, r2, r0
	mov r3, r8
	str r3, [sp]
	movs r0, #4
	ldr r3, _080108B8 @ =0x08BFF798
	bl sub_080068C4
	adds r5, #2
	ldr r0, [r6, #0x44]
	subs r0, #2
	cmp r5, r0
	blt _080107F2
_08010832:
	ldr r0, [r6, #0x44]
	subs r0, #1
	cmp r5, r0
	bge _0801087E
	mov r8, sl
	ldr r0, _080108BC @ =0x08BFF760
	mov sb, r0
	adds r7, #8
_08010842:
	lsls r4, r5, #3
	ldr r1, [r6, #0x30]
	adds r1, r1, r4
	mov r2, r8
	ldrh r0, [r2]
	adds r0, #8
	ldr r2, [r6, #0x34]
	adds r2, r2, r0
	str r7, [sp]
	movs r0, #4
	mov r3, sb
	bl sub_080068C4
	ldr r1, [r6, #0x30]
	adds r1, r1, r4
	mov r3, r8
	ldrh r0, [r3]
	adds r0, #0x10
	ldr r2, [r6, #0x34]
	adds r2, r2, r0
	str r7, [sp]
	movs r0, #4
	mov r3, sb
	bl sub_080068C4
	adds r5, #1
	ldr r0, [r6, #0x44]
	subs r0, #1
	cmp r5, r0
	blt _08010842
_0801087E:
	ldr r4, [sp, #4]
	movs r7, #8
	movs r5, #2
_08010884:
	ldr r1, [r6, #0x30]
	adds r1, r1, r7
	mov r2, sl
	ldrh r0, [r2]
	adds r0, #8
	ldr r2, [r6, #0x34]
	adds r2, r2, r0
	str r4, [sp]
	movs r0, #0
	ldr r3, _080108C0 @ =0x08BFF7A8
	bl sub_080068C4
	adds r4, #4
	adds r7, #0x20
	subs r5, #1
	cmp r5, #0
	bge _08010884
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080108B8: .4byte 0x08BFF798
_080108BC: .4byte 0x08BFF760
_080108C0: .4byte 0x08BFF7A8

	thumb_func_start nullsub_32
nullsub_32: @ 0x080108C4
	bx lr
	.align 2, 0

	thumb_func_start sub_080108C8
sub_080108C8: @ 0x080108C8
	adds r2, r0, #0
	lsls r1, r1, #0x18
	lsrs r0, r1, #0x18
	cmp r2, #0
	beq _080108EC
	lsls r0, r0, #0x18
	asrs r1, r0, #0x18
	cmp r1, #0
	beq _080108E6
	adds r1, r2, #0
	adds r1, #0x48
	movs r0, #0x80
	lsls r0, r0, #3
	strh r0, [r1]
	b _080108EC
_080108E6:
	adds r0, r2, #0
	adds r0, #0x48
	strh r1, [r0]
_080108EC:
	bx lr
	.align 2, 0

	thumb_func_start sub_080108F0
sub_080108F0: @ 0x080108F0
	push {lr}
	adds r0, #0x4c
	movs r3, #0
	movs r1, #0
	strh r1, [r0]
	ldr r0, _0801095C @ =0x03002790
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
	strb r3, [r0]
	mov r1, ip
	adds r1, #0x45
	movs r0, #0x10
	strb r0, [r1]
	mov r0, ip
	adds r0, #0x46
	strb r3, [r0]
	ldr r0, _08010960 @ =0x0000FFE0
	mov r3, ip
	ldrh r3, [r3, #0x3c]
	ands r0, r3
	ldr r1, _08010964 @ =0x0000E0FF
	ands r0, r1
	movs r3, #0xf8
	lsls r3, r3, #5
	adds r1, r3, #0
	orrs r0, r1
	mov r1, ip
	strh r0, [r1, #0x3c]
	movs r0, #0x20
	ldrb r1, [r2]
	orrs r1, r0
	strb r1, [r2]
	mov r1, ip
	adds r1, #0x3d
	ldrb r2, [r1]
	orrs r0, r2
	strb r0, [r1]
	ldr r0, _08010968 @ =0x08C01124
	bl Proc_Find
	movs r1, #1
	bl sub_080108C8
	pop {r0}
	bx r0
	.align 2, 0
_0801095C: .4byte 0x03002790
_08010960: .4byte 0x0000FFE0
_08010964: .4byte 0x0000E0FF
_08010968: .4byte 0x08C01124

	thumb_func_start sub_0801096C
sub_0801096C: @ 0x0801096C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	adds r3, r0, #0
	adds r0, #0x4c
	ldrh r1, [r0]
	adds r1, #1
	movs r6, #0
	strh r1, [r0]
	movs r1, #0
	ldrsh r4, [r0, r1]
	ldr r2, _080109EC @ =0x03002790
	adds r5, r2, #0
	adds r5, #0x3c
	movs r0, #0x3f
	mov sl, r0
	ldrb r1, [r5]
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r5]
	movs r0, #0x44
	adds r0, r0, r2
	mov sb, r0
	strb r4, [r0]
	movs r0, #0x10
	subs r0, r0, r4
	movs r1, #0x45
	adds r1, r1, r2
	mov r8, r1
	strb r0, [r1]
	adds r7, r2, #0
	adds r7, #0x46
	strb r6, [r7]
	cmp r4, #0x10
	bne _080109DC
	adds r0, r3, #0
	bl Proc_Break
	mov r0, sl
	ldrb r1, [r5]
	ands r0, r1
	strb r0, [r5]
	mov r0, sb
	strb r4, [r0]
	mov r1, r8
	strb r6, [r1]
	strb r6, [r7]
	ldr r0, _080109F0 @ =0x08C01124
	bl Proc_Find
	movs r1, #0
	bl sub_080108C8
_080109DC:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080109EC: .4byte 0x03002790
_080109F0: .4byte 0x08C01124

	thumb_func_start sub_080109F4
sub_080109F4: @ 0x080109F4
	push {lr}
	adds r0, #0x4c
	movs r3, #0
	movs r1, #0
	strh r1, [r0]
	ldr r0, _08010A60 @ =0x03002790
	mov ip, r0
	mov r2, ip
	adds r2, #0x3c
	movs r0, #0x3f
	ldrb r1, [r2]
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r2]
	mov r1, ip
	adds r1, #0x44
	movs r0, #0x10
	strb r0, [r1]
	mov r0, ip
	adds r0, #0x45
	strb r3, [r0]
	adds r0, #1
	strb r3, [r0]
	ldr r0, _08010A64 @ =0x0000FFE0
	mov r3, ip
	ldrh r3, [r3, #0x3c]
	ands r0, r3
	ldr r1, _08010A68 @ =0x0000E0FF
	ands r0, r1
	movs r3, #0xf8
	lsls r3, r3, #5
	adds r1, r3, #0
	orrs r0, r1
	mov r1, ip
	strh r0, [r1, #0x3c]
	movs r0, #0x20
	ldrb r1, [r2]
	orrs r1, r0
	strb r1, [r2]
	mov r1, ip
	adds r1, #0x3d
	ldrb r2, [r1]
	orrs r0, r2
	strb r0, [r1]
	ldr r0, _08010A6C @ =0x08C01124
	bl Proc_Find
	movs r1, #1
	bl sub_080108C8
	pop {r0}
	bx r0
	.align 2, 0
_08010A60: .4byte 0x03002790
_08010A64: .4byte 0x0000FFE0
_08010A68: .4byte 0x0000E0FF
_08010A6C: .4byte 0x08C01124

	thumb_func_start sub_08010A70
sub_08010A70: @ 0x08010A70
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r0, #0x4c
	ldrh r1, [r0]
	adds r1, #1
	movs r4, #0
	strh r1, [r0]
	movs r1, #0
	ldrsh r3, [r0, r1]
	ldr r0, _08010AC4 @ =0x03002790
	mov ip, r0
	mov r2, ip
	adds r2, #0x3c
	movs r0, #0x3f
	ldrb r1, [r2]
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r2]
	movs r0, #0x10
	subs r0, r0, r3
	mov r1, ip
	adds r1, #0x44
	strb r0, [r1]
	mov r0, ip
	adds r0, #0x45
	strb r3, [r0]
	adds r0, #1
	strb r4, [r0]
	cmp r3, #0x10
	bne _08010ABE
	ldr r0, _08010AC8 @ =0x08C01124
	bl Proc_Find
	bl Proc_End
	adds r0, r5, #0
	bl Proc_Break
_08010ABE:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08010AC4: .4byte 0x03002790
_08010AC8: .4byte 0x08C01124

	thumb_func_start sub_08010ACC
sub_08010ACC: @ 0x08010ACC
	ldr r3, _08010AF0 @ =0x03002790
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
	bx lr
	.align 2, 0
_08010AF0: .4byte 0x03002790

	thumb_func_start sub_08010AF4
sub_08010AF4: @ 0x08010AF4
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x24
	mov r8, r0
	mov sb, r1
	adds r4, r2, #0
	adds r5, r3, #0
	movs r6, #0
	ldr r0, _08010BD8 @ =0x08C01124
	ldr r1, [sp, #0x48]
	bl Proc_Start
	adds r7, r0, #0
	adds r0, r4, #0
	bl sub_08013318
	mov sl, r0
	mov r0, r8
	str r0, [r7, #0x30]
	mov r2, sb
	str r2, [r7, #0x34]
	str r5, [r7, #0x38]
	ldr r0, [sp, #0x44]
	str r0, [r7, #0x3c]
	str r4, [r7, #0x40]
	adds r0, r7, #0
	adds r0, #0x48
	strh r6, [r0]
	ldr r0, _08010BDC @ =0x08C01144
	ldr r1, [sp, #0x48]
	bl Proc_StartBlocking
	ldr r0, _08010BE0 @ =0x08452C74
	ldr r1, [r7, #0x3c]
	adds r1, #0x10
	lsls r1, r1, #5
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r0, _08010BE4 @ =0x081901C8
	ldr r1, [r7, #0x3c]
	adds r1, #0x11
	lsls r1, r1, #5
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r0, _08010BE8 @ =0x08452AD4
	ldr r1, [r7, #0x38]
	ldr r2, _08010BEC @ =0x06010000
	adds r1, r1, r2
	bl sub_08013688
	mov r0, sl
	bl sub_080054CC
	adds r6, r0, #0
	adds r4, r6, #0
	cmp r6, #0
	bge _08010B72
	adds r4, r6, #7
_08010B72:
	asrs r4, r4, #3
	adds r6, r4, #5
	str r6, [r7, #0x44]
	ldr r1, [r7, #0x38]
	ldr r0, _08010BF0 @ =0x06010400
	adds r1, r1, r0
	ldr r2, [r7, #0x3c]
	adds r2, #0x12
	mov r0, sp
	bl sub_08005ACC
	mov r0, sp
	bl sub_08005320
	mov r2, sp
	adds r2, #0x18
	str r2, [sp, #0x20]
	adds r0, r2, #0
	bl sub_08005B08
	ldr r0, [sp, #0x20]
	movs r1, #0
	bl sub_08005B8C
	movs r0, #0
	bl sub_080052E0
	adds r4, #3
	lsls r4, r4, #3
	adds r0, r4, #0
	mov r1, sl
	bl sub_08005564
	adds r1, r0, #0
	ldr r0, [sp, #0x20]
	movs r2, #0
	mov r3, sl
	bl sub_080059DC
	movs r0, #0
	bl sub_08005320
	add sp, #0x24
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08010BD8: .4byte 0x08C01124
_08010BDC: .4byte 0x08C01144
_08010BE0: .4byte 0x08452C74
_08010BE4: .4byte 0x081901C8
_08010BE8: .4byte 0x08452AD4
_08010BEC: .4byte 0x06010000
_08010BF0: .4byte 0x06010400

	thumb_func_start sub_08010BF4
sub_08010BF4: @ 0x08010BF4
	push {r4, r5, lr}
	sub sp, #8
	adds r2, r0, #0
	ldr r0, [r2, #0x30]
	ldr r5, [r0, #4]
	ldr r1, [r0, #8]
	movs r0, #0x80
	lsls r0, r0, #8
	ands r0, r1
	cmp r0, #0
	bne _08010C14
	ldr r4, _08010C10 @ =0x0000FFFF
	ands r4, r1
	b _08010C18
	.align 2, 0
_08010C10: .4byte 0x0000FFFF
_08010C14:
	movs r4, #1
	rsbs r4, r4, #0
_08010C18:
	ldr r0, [r2, #0x30]
	ldrh r3, [r0, #0xa]
	movs r0, #0x80
	lsls r0, r0, #8
	ands r0, r3
	movs r1, #1
	rsbs r1, r1, #0
	cmp r0, #0
	bne _08010C2C
	adds r1, r3, #0
_08010C2C:
	adds r3, r2, #0
	adds r3, #0x5e
	movs r0, #4
	ldrh r3, [r3]
	ands r0, r3
	cmp r0, #0
	bne _08010C50
	movs r3, #0xa0
	lsls r3, r3, #7
	movs r0, #9
	str r0, [sp]
	str r2, [sp, #4]
	adds r0, r4, #0
	adds r2, r5, #0
	bl sub_08010AF4
	movs r0, #2
	b _08010C52
_08010C50:
	movs r0, #0
_08010C52:
	add sp, #8
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_08010C5C
sub_08010C5C: @ 0x08010C5C
	push {lr}
	adds r1, r0, #0
	adds r2, r1, #0
	adds r2, #0x5e
	movs r0, #4
	ldrh r2, [r2]
	ands r0, r2
	cmp r0, #0
	beq _08010C80
	ldr r0, _08010C7C @ =0x08C01124
	bl Proc_Find
	bl Proc_End
	movs r0, #0
	b _08010CA8
	.align 2, 0
_08010C7C: .4byte 0x08C01124
_08010C80:
	adds r0, r1, #0
	adds r0, #0x4d
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _08010CA0
	ldr r0, _08010C9C @ =0x08C01124
	bl Proc_Find
	bl Proc_End
	b _08010CA6
	.align 2, 0
_08010C9C: .4byte 0x08C01124
_08010CA0:
	ldr r0, _08010CAC @ =0x08C0115C
	bl Proc_StartBlocking
_08010CA6:
	movs r0, #2
_08010CA8:
	pop {r1}
	bx r1
	.align 2, 0
_08010CAC: .4byte 0x08C0115C

	thumb_func_start sub_08010CB0
sub_08010CB0: @ 0x08010CB0
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	ldr r4, _08010D60 @ =0x03002790
	movs r6, #1
	ldrb r0, [r4, #1]
	orrs r0, r6
	movs r7, #2
	orrs r0, r7
	movs r1, #5
	rsbs r1, r1, #0
	ands r0, r1
	movs r1, #8
	orrs r0, r1
	movs r1, #0x10
	orrs r0, r1
	strb r0, [r4, #1]
	adds r3, r4, #0
	adds r3, #0x3c
	movs r0, #0x3f
	ldrb r1, [r3]
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r3]
	adds r1, r4, #0
	adds r1, #0x44
	movs r2, #0
	movs r0, #0x10
	strb r0, [r1]
	adds r0, r4, #0
	adds r0, #0x45
	strb r2, [r0]
	adds r0, #1
	strb r2, [r0]
	ldr r0, _08010D64 @ =0x0000FFE0
	ldrh r2, [r4, #0x3c]
	ands r0, r2
	movs r1, #4
	orrs r0, r1
	ldr r1, _08010D68 @ =0x0000E0FF
	ands r0, r1
	movs r2, #0x80
	lsls r2, r2, #4
	adds r1, r2, #0
	orrs r0, r1
	strh r0, [r4, #0x3c]
	movs r0, #0x20
	ldrb r1, [r3]
	orrs r1, r0
	strb r1, [r3]
	adds r1, r4, #0
	adds r1, #0x3d
	ldrb r2, [r1]
	orrs r0, r2
	strb r0, [r1]
	movs r0, #2
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	ldr r0, [r5, #0x34]
	movs r1, #0x80
	lsls r1, r1, #1
	ands r0, r1
	cmp r0, #0
	bne _08010D6C
	movs r1, #4
	rsbs r1, r1, #0
	adds r0, r1, #0
	ldrb r2, [r4, #0xc]
	ands r0, r2
	strb r0, [r4, #0xc]
	adds r0, r1, #0
	ldrb r2, [r4, #0x10]
	ands r0, r2
	orrs r0, r6
	strb r0, [r4, #0x10]
	ldrb r0, [r4, #0x14]
	ands r1, r0
	orrs r1, r7
	strb r1, [r4, #0x14]
	movs r0, #3
	ldrb r1, [r4, #0x18]
	orrs r0, r1
	strb r0, [r4, #0x18]
	movs r0, #8
	b _08010D6E
	.align 2, 0
_08010D60: .4byte 0x03002790
_08010D64: .4byte 0x0000FFE0
_08010D68: .4byte 0x0000E0FF
_08010D6C:
	movs r0, #6
_08010D6E:
	str r0, [r5, #0x44]
	movs r0, #0
	str r0, [r5, #0x30]
	ldr r0, _08010D84 @ =0x08BFFF78
	bl Proc_Find
	str r0, [r5, #0x40]
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08010D84: .4byte 0x08BFFF78

	thumb_func_start sub_08010D88
sub_08010D88: @ 0x08010D88
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r0, _08010DF0 @ =0x06008000
	ldr r1, _08010DF4 @ =0x06001000
	movs r2, #0xa0
	lsls r2, r2, #5
	bl CpuFastSet
	ldr r0, _08010DF8 @ =0x02022960
	ldr r2, _08010DFC @ =0xFFFFFF00
	adds r1, r0, r2
	ldr r2, [r4, #0x44]
	lsls r2, r2, #3
	ldr r3, _08010E00 @ =0x001FFFFF
	ands r2, r3
	bl CpuFastSet
	ldr r5, _08010E04 @ =0x00008080
	adds r4, r5, #0
	ldr r3, _08010E08 @ =0x02024460
	ldr r2, _08010E0C @ =0x02023C60
	movs r1, #0x80
	lsls r1, r1, #3
_08010DB6:
	ldrh r5, [r3]
	adds r0, r4, r5
	strh r0, [r2]
	adds r3, #2
	adds r2, #2
	subs r1, #1
	cmp r1, #0

	thumb_func_start sub_08010DC4
sub_08010DC4: @ 0x08010DC4
	bne _08010DB6
	movs r0, #4
	bl EnableBgSync
	bl EnablePalSync
	ldr r2, _08010E10 @ =0x03002790
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
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08010DF0: .4byte 0x06008000
_08010DF4: .4byte 0x06001000
_08010DF8: .4byte 0x02022960
_08010DFC: .4byte 0xFFFFFF00
_08010E00: .4byte 0x001FFFFF
_08010E04: .4byte 0x00008080
_08010E08: .4byte 0x02024460
_08010E0C: .4byte 0x02023C60
_08010E10: .4byte 0x03002790

	thumb_func_start sub_08010E14
sub_08010E14: @ 0x08010E14
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	adds r0, #0x3c
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _08010E7C
	ldr r4, _08010E70 @ =0x08C00798
	ldr r1, [r5, #0x2c]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r4
	ldr r0, [r0]
	ldr r1, _08010E74 @ =0x06008000
	bl sub_08013688
	ldr r0, _08010E78 @ =0x02024460
	ldr r2, [r5, #0x2c]
	lsls r1, r2, #1
	adds r1, r1, r2
	lsls r1, r1, #2
	adds r2, r4, #4
	adds r1, r1, r2
	ldr r1, [r1]
	movs r2, #0x80
	lsls r2, r2, #8
	bl TmApplyTsa_thm
	ldr r1, [r5, #0x2c]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r4, #8
	adds r0, r0, r4
	ldr r0, [r0]
	movs r1, #0x80
	lsls r1, r1, #1
	ldr r2, [r5, #0x44]
	lsls r2, r2, #5
	bl ApplyPaletteExt
	b _08010E8E
	.align 2, 0
_08010E70: .4byte 0x08C00798
_08010E74: .4byte 0x06008000
_08010E78: .4byte 0x02024460
_08010E7C:
	ldr r0, _08010E9C @ =0x02024460
	movs r1, #0x80
	lsls r1, r1, #8
	ldr r3, [r5, #0x44]
	ldr r2, [r5, #0x2c]
	str r2, [sp]
	movs r2, #8
	bl sub_080B7980
_08010E8E:
	movs r0, #8
	bl EnableBgSync
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08010E9C: .4byte 0x02024460

	thumb_func_start sub_08010EA0
sub_08010EA0: @ 0x08010EA0
	push {r4, lr}
	adds r4, r0, #0
	ldr r2, [r4, #0x30]
	ldr r0, [r4, #0x38]
	adds r2, r2, r0
	str r2, [r4, #0x30]
	asrs r2, r2, #4
	ldr r0, _08010EE8 @ =0x03002790
	mov ip, r0
	mov r3, ip
	adds r3, #0x3c
	movs r0, #0x3f
	ldrb r1, [r3]
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r3]
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
	cmp r2, #0x10
	bne _08010EE2
	adds r0, r4, #0
	bl Proc_Break
_08010EE2:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08010EE8: .4byte 0x03002790

	thumb_func_start sub_08010EEC
sub_08010EEC: @ 0x08010EEC
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #3
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	ldr r0, _08010F40 @ =0x02023C60
	movs r1, #0
	bl sub_080017E8
	movs r0, #4
	bl EnableBgSync
	ldr r3, _08010F44 @ =0x03002790
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
	ldr r0, [r4, #0x34]
	movs r1, #0x80
	lsls r1, r1, #1
	ands r0, r1
	cmp r0, #0
	bne _08010F38
	bl sub_08015998
_08010F38:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08010F40: .4byte 0x02023C60
_08010F44: .4byte 0x03002790

	thumb_func_start sub_08010F48
sub_08010F48: @ 0x08010F48
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	adds r4, r1, #0
	adds r5, r2, #0
	adds r1, r3, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	ldr r0, _08010F70 @ =0x08C0117C
	bl Proc_StartBlocking
	str r5, [r0, #0x2c]
	str r6, [r0, #0x34]
	movs r1, #0xff
	ands r1, r6
	str r1, [r0, #0x38]
	adds r0, #0x3c
	strb r4, [r0]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08010F70: .4byte 0x08C0117C

	thumb_func_start sub_08010F74
sub_08010F74: @ 0x08010F74
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	ldr r7, _08011028 @ =0x03002790
	movs r6, #1
	ldrb r0, [r7, #1]
	orrs r0, r6
	movs r1, #2
	orrs r0, r1
	movs r1, #5
	rsbs r1, r1, #0
	ands r0, r1
	movs r1, #8
	orrs r0, r1
	movs r1, #0x10
	orrs r0, r1
	strb r0, [r7, #1]
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
	movs r4, #0
	strb r4, [r0]
	adds r1, r7, #0
	adds r1, #0x45
	movs r0, #0x10
	strb r0, [r1]
	adds r0, r7, #0
	adds r0, #0x46
	strb r4, [r0]
	ldr r0, _0801102C @ =0x0000FFE0
	ldrh r3, [r7, #0x3c]
	ands r0, r3
	movs r1, #4
	orrs r0, r1
	ldr r1, _08011030 @ =0x0000E0FF
	ands r0, r1
	movs r3, #0xc0
	lsls r3, r3, #5
	adds r1, r3, #0
	orrs r0, r1
	strh r0, [r7, #0x3c]
	movs r0, #0x20
	ldrb r1, [r2]
	orrs r1, r0
	strb r1, [r2]
	adds r1, r7, #0
	adds r1, #0x3d
	ldrb r2, [r1]
	orrs r0, r2
	strb r0, [r1]
	movs r0, #2
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	movs r1, #4
	rsbs r1, r1, #0
	adds r0, r1, #0
	ldrb r3, [r7, #0xc]
	ands r0, r3
	strb r0, [r7, #0xc]
	adds r0, r1, #0
	ldrb r2, [r7, #0x10]
	ands r0, r2
	orrs r0, r6
	strb r0, [r7, #0x10]
	ldrb r3, [r7, #0x14]
	ands r1, r3
	strb r1, [r7, #0x14]
	movs r0, #3
	ldrb r1, [r7, #0x18]
	orrs r0, r1
	strb r0, [r7, #0x18]
	movs r0, #6
	str r0, [r5, #0x44]
	str r4, [r5, #0x30]
	ldr r0, _08011034 @ =0x08BFFF78
	bl Proc_Find
	str r0, [r5, #0x40]
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08011028: .4byte 0x03002790
_0801102C: .4byte 0x0000FFE0
_08011030: .4byte 0x0000E0FF
_08011034: .4byte 0x08BFFF78

	thumb_func_start sub_08011038
sub_08011038: @ 0x08011038
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	adds r0, #0x3c
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _0801109C
	ldr r4, _08011090 @ =0x08C00798
	ldr r1, [r5, #0x2c]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r4
	ldr r0, [r0]
	ldr r1, _08011094 @ =0x06001000
	bl sub_08013688
	ldr r0, _08011098 @ =0x02023C60
	ldr r2, [r5, #0x2c]
	lsls r1, r2, #1
	adds r1, r1, r2
	lsls r1, r1, #2
	adds r2, r4, #4
	adds r1, r1, r2
	ldr r1, [r1]
	movs r2, #0x80
	bl TmApplyTsa_thm
	ldr r1, [r5, #0x2c]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r4, #8
	adds r0, r0, r4
	ldr r0, [r0]
	ldr r2, [r5, #0x44]
	lsls r2, r2, #5
	movs r1, #0
	bl ApplyPaletteExt
	b _080110AE
	.align 2, 0
_08011090: .4byte 0x08C00798
_08011094: .4byte 0x06001000
_08011098: .4byte 0x02023C60
_0801109C:
	ldr r0, _080110DC @ =0x02023C60
	movs r1, #0x80
	lsls r1, r1, #5
	ldr r3, [r5, #0x44]
	ldr r2, [r5, #0x2c]
	str r2, [sp]
	movs r2, #0
	bl sub_080B7980
_080110AE:
	movs r0, #4
	bl EnableBgSync
	bl EnablePalSync
	ldr r2, _080110E0 @ =0x03002790
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
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080110DC: .4byte 0x02023C60
_080110E0: .4byte 0x03002790

	thumb_func_start sub_080110E4
sub_080110E4: @ 0x080110E4
	push {r4, lr}
	adds r4, r0, #0
	ldr r2, [r4, #0x30]
	ldr r0, [r4, #0x38]
	adds r2, r2, r0
	str r2, [r4, #0x30]
	asrs r2, r2, #4
	ldr r0, _0801112C @ =0x03002790
	mov ip, r0
	mov r3, ip
	adds r3, #0x3c
	movs r0, #0x3f
	ldrb r1, [r3]
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r3]
	mov r0, ip
	adds r0, #0x44
	movs r1, #0
	strb r2, [r0]
	movs r0, #0x10
	subs r0, r0, r2
	adds r3, #9
	strb r0, [r3]
	mov r0, ip
	adds r0, #0x46
	strb r1, [r0]
	cmp r2, #0x10
	bne _08011126
	adds r0, r4, #0
	bl Proc_Break
_08011126:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0801112C: .4byte 0x03002790

	thumb_func_start sub_08011130
sub_08011130: @ 0x08011130
	push {r4, r5, lr}
	adds r4, r0, #0
	bl sub_0802D874
	bl sub_0806D51C
	movs r0, #3
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	ldr r0, _08011190 @ =0x06001000
	ldr r1, _08011194 @ =0x06008000
	movs r2, #0xa0
	lsls r2, r2, #5
	bl CpuFastSet
	ldr r0, _08011198 @ =0x02022860
	movs r2, #0x80
	lsls r2, r2, #1
	adds r1, r0, r2
	ldr r2, [r4, #0x44]
	lsls r2, r2, #3
	ldr r3, _0801119C @ =0x001FFFFF
	ands r2, r3
	bl CpuFastSet
	movs r5, #0xff
	lsls r5, r5, #7
	adds r4, r5, #0
	ldr r3, _080111A0 @ =0x02023C60
	ldr r2, _080111A4 @ =0x02024460
	movs r1, #0x80
	lsls r1, r1, #3
_08011174:
	ldrh r5, [r3]
	adds r0, r4, r5
	strh r0, [r2]
	adds r3, #2
	adds r2, #2
	subs r1, #1
	cmp r1, #0
	bne _08011174
	movs r0, #8
	bl EnableBgSync
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08011190: .4byte 0x06001000
_08011194: .4byte 0x06008000
_08011198: .4byte 0x02022860
_0801119C: .4byte 0x001FFFFF
_080111A0: .4byte 0x02023C60
_080111A4: .4byte 0x02024460

	thumb_func_start sub_080111A8
sub_080111A8: @ 0x080111A8
	push {lr}
	ldr r0, _080111E0 @ =0x02023C60
	movs r1, #0
	bl sub_080017E8
	movs r0, #4
	bl EnableBgSync
	ldr r3, _080111E4 @ =0x03002790
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
	bl sub_08015998
	pop {r0}
	bx r0
	.align 2, 0
_080111E0: .4byte 0x02023C60
_080111E4: .4byte 0x03002790

	thumb_func_start sub_080111E8
sub_080111E8: @ 0x080111E8
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	adds r4, r1, #0
	adds r5, r2, #0
	adds r1, r3, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	ldr r0, _08011210 @ =0x08C011CC
	bl Proc_StartBlocking
	str r5, [r0, #0x2c]
	str r6, [r0, #0x34]
	movs r1, #0xff
	ands r1, r6
	str r1, [r0, #0x38]
	adds r0, #0x3c
	strb r4, [r0]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08011210: .4byte 0x08C011CC

	thumb_func_start sub_08011214
sub_08011214: @ 0x08011214
	push {r4, lr}
	adds r3, r0, #0
	ldr r0, [r3, #0x30]
	ldr r2, [r0, #4]
	ldr r4, [r0, #8]
	adds r1, r3, #0
	adds r1, #0x5e
	movs r0, #4
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _0801123E
	adds r0, r3, #0
	adds r0, #0x4c
	strb r2, [r0]
	adds r0, r4, #0
	movs r1, #1
	bl sub_08010F48
	movs r0, #2
	b _08011240
_0801123E:
	movs r0, #0
_08011240:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_08011248
sub_08011248: @ 0x08011248
	push {r4, r5, r6, lr}
	adds r3, r0, #0
	ldr r0, [r3, #0x30]
	ldr r6, [r0, #4]
	ldr r4, [r0, #8]
	adds r1, r3, #0
	adds r1, #0x5e
	movs r0, #4
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	beq _08011264
	movs r0, #0
	b _08011292
_08011264:
	adds r0, r3, #0
	adds r0, #0x4c
	movs r2, #0
	ldrsb r2, [r0, r2]
	movs r1, #1
	rsbs r1, r1, #0
	adds r5, r0, #0
	cmp r2, r1
	bne _08011282
	adds r0, r4, #0
	movs r1, #0
	adds r2, r6, #0
	bl sub_080111E8
	b _0801128C
_08011282:
	adds r0, r4, #0
	movs r1, #0
	adds r2, r6, #0
	bl sub_08010F48
_0801128C:
	movs r0, #0x61
	strb r0, [r5]
	movs r0, #2
_08011292:
	pop {r4, r5, r6}
	pop {r1}
	bx r1

	thumb_func_start sub_08011298
sub_08011298: @ 0x08011298
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	ldr r7, _0801134C @ =0x03002790
	movs r6, #1
	ldrb r0, [r7, #1]
	orrs r0, r6
	movs r1, #2
	orrs r0, r1
	movs r1, #5
	rsbs r1, r1, #0
	ands r0, r1
	movs r1, #8
	orrs r0, r1
	movs r1, #0x10
	orrs r0, r1
	strb r0, [r7, #1]
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
	movs r4, #0
	strb r4, [r0]
	adds r1, r7, #0
	adds r1, #0x45
	movs r0, #0x10
	strb r0, [r1]
	adds r0, r7, #0
	adds r0, #0x46
	strb r4, [r0]
	ldr r0, _08011350 @ =0x0000FFE0
	ldrh r3, [r7, #0x3c]
	ands r0, r3
	movs r1, #4
	orrs r0, r1
	ldr r1, _08011354 @ =0x0000E0FF
	ands r0, r1
	movs r3, #0xc0
	lsls r3, r3, #5
	adds r1, r3, #0
	orrs r0, r1
	strh r0, [r7, #0x3c]
	movs r0, #0x20
	ldrb r1, [r2]
	orrs r1, r0
	strb r1, [r2]
	adds r1, r7, #0
	adds r1, #0x3d
	ldrb r2, [r1]
	orrs r0, r2
	strb r0, [r1]
	movs r0, #2
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	movs r1, #4
	rsbs r1, r1, #0
	adds r0, r1, #0
	ldrb r3, [r7, #0xc]
	ands r0, r3
	strb r0, [r7, #0xc]
	adds r0, r1, #0
	ldrb r2, [r7, #0x10]
	ands r0, r2
	orrs r0, r6
	strb r0, [r7, #0x10]
	ldrb r3, [r7, #0x14]
	ands r1, r3
	strb r1, [r7, #0x14]
	movs r0, #3
	ldrb r1, [r7, #0x18]
	orrs r0, r1
	strb r0, [r7, #0x18]
	movs r0, #6
	str r0, [r5, #0x44]
	str r4, [r5, #0x30]
	ldr r0, _08011358 @ =0x08BFFF78
	bl Proc_Find
	str r0, [r5, #0x40]
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0801134C: .4byte 0x03002790
_08011350: .4byte 0x0000FFE0
_08011354: .4byte 0x0000E0FF
_08011358: .4byte 0x08BFFF78

	thumb_func_start sub_0801135C
sub_0801135C: @ 0x0801135C
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r0, _080113E8 @ =0x06008000
	ldr r1, _080113EC @ =0x06001000
	movs r2, #0xa0
	lsls r2, r2, #5
	bl CpuFastSet
	ldr r0, _080113F0 @ =0x02022960
	ldr r2, _080113F4 @ =0xFFFFFF00
	adds r1, r0, r2
	ldr r2, [r4, #0x44]
	lsls r2, r2, #3
	ldr r3, _080113F8 @ =0x001FFFFF
	ands r2, r3
	bl CpuFastSet
	ldr r5, _080113FC @ =0x00008080
	adds r3, r5, #0
	ldr r2, _08011400 @ =0x02024460
	ldr r1, _08011404 @ =0x02023C60
	movs r4, #0x80
	lsls r4, r4, #3
_0801138A:
	ldrh r5, [r2]
	adds r0, r3, r5
	strh r0, [r1]
	adds r2, #2
	adds r1, #2
	subs r4, #1
	cmp r4, #0
	bne _0801138A
	movs r0, #4
	bl EnableBgSync
	bl EnablePalSync
	ldr r3, _08011408 @ =0x03002790
	movs r0, #1
	ldrb r1, [r3, #1]
	orrs r0, r1
	movs r1, #2
	orrs r0, r1
	movs r1, #4
	orrs r0, r1
	movs r1, #8
	orrs r0, r1
	movs r1, #0x10
	orrs r0, r1
	strb r0, [r3, #1]
	adds r2, r3, #0
	adds r2, #0x3c
	movs r0, #0x3f
	ldrb r5, [r2]
	ands r0, r5
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
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080113E8: .4byte 0x06008000
_080113EC: .4byte 0x06001000
_080113F0: .4byte 0x02022960
_080113F4: .4byte 0xFFFFFF00
_080113F8: .4byte 0x001FFFFF
_080113FC: .4byte 0x00008080
_08011400: .4byte 0x02024460
_08011404: .4byte 0x02023C60
_08011408: .4byte 0x03002790

	thumb_func_start sub_0801140C
sub_0801140C: @ 0x0801140C
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r4, _08011454 @ =gPlaySt
	movs r0, #0xe
	ldrsb r0, [r4, r0]
	bl sub_080195BC
	ldrb r0, [r4, #0x15]
	bl sub_0802D8E4
	bl RenderMap
	bl RefreshUnitSprites
	bl ApplyUnitSpritePalettes
	ldr r0, [r5, #0x34]
	movs r1, #0x80
	lsls r1, r1, #2
	ands r0, r1
	cmp r0, #0
	beq _0801143C
	bl sub_0802516C
_0801143C:
	bl sub_08025A0C
	bl sub_0802D8A8
	bl sub_0806D52C
	movs r0, #8
	bl EnableBgSync
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08011454: .4byte gPlaySt

	thumb_func_start sub_08011458
sub_08011458: @ 0x08011458
	push {r4, lr}
	adds r4, r0, #0
	ldr r2, [r4, #0x30]
	ldr r0, [r4, #0x38]
	adds r2, r2, r0
	str r2, [r4, #0x30]
	asrs r2, r2, #4
	ldr r0, _080114A0 @ =0x03002790
	mov ip, r0
	mov r3, ip
	adds r3, #0x3c
	movs r0, #0x3f
	ldrb r1, [r3]
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r3]
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
	cmp r2, #0x10
	bne _0801149A
	adds r0, r4, #0
	bl Proc_Break
_0801149A:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080114A0: .4byte 0x03002790

	thumb_func_start sub_080114A4
sub_080114A4: @ 0x080114A4
	push {lr}
	ldr r0, _080114E4 @ =0x02023C60
	movs r1, #0
	bl sub_080017E8
	movs r0, #4
	bl EnableBgSync
	ldr r3, _080114E8 @ =0x03002790
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
	bl sub_08015998
	bl sub_08015A48
	bl sub_08005904
	pop {r0}
	bx r0
	.align 2, 0
_080114E4: .4byte 0x02023C60
_080114E8: .4byte 0x03002790

	thumb_func_start sub_080114EC
sub_080114EC: @ 0x080114EC
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08011504 @ =0x08C01224
	bl Proc_StartBlocking
	str r4, [r0, #0x34]
	movs r1, #0xff
	ands r1, r4
	str r1, [r0, #0x38]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08011504: .4byte 0x08C01224

	thumb_func_start sub_08011508
sub_08011508: @ 0x08011508
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	ldr r0, [r5, #0x30]
	ldr r2, [r0, #4]
	adds r1, r5, #0
	adds r1, #0x5e
	movs r0, #4
	ldrh r1, [r1]
	ands r0, r1
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	cmp r6, #0
	beq _08011548
	adds r4, r5, #0
	adds r4, #0x4c
	ldrb r2, [r4]
	movs r1, #0
	ldrsb r1, [r4, r1]
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	beq _08011544
	movs r0, #0xff
	strb r0, [r4]
	bl sub_0802E834
	bl sub_0802D8A8
	bl sub_0806D52C
_08011544:
	movs r0, #0
	b _08011560
_08011548:
	adds r4, r5, #0
	adds r4, #0x4c
	adds r0, r2, #0
	adds r1, r5, #0
	bl sub_080114EC
	movs r0, #0xff
	strb r0, [r4]
	adds r0, r5, #0
	adds r0, #0x4d
	strb r6, [r0]
	movs r0, #2
_08011560:
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_08011568
sub_08011568: @ 0x08011568
	push {r4, r5, r6, lr}
	sub sp, #8
	adds r6, r0, #0
	ldr r3, _08011604 @ =0x03002790
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
	movs r5, #0
	strb r5, [r0]
	adds r1, r3, #0
	adds r1, #0x45
	movs r0, #0x10
	strb r0, [r1]
	adds r0, r3, #0
	adds r0, #0x46
	strb r5, [r0]
	ldr r0, _08011608 @ =0x0000FFE0
	ldrh r2, [r3, #0x3c]
	ands r0, r2
	movs r1, #4
	orrs r0, r1
	ldr r1, _0801160C @ =0x0000E0FF
	ands r0, r1
	movs r2, #0xc0
	lsls r2, r2, #5
	adds r1, r2, #0
	orrs r0, r1
	strh r0, [r3, #0x3c]
	ldr r0, _08011610 @ =0x08198D98
	ldr r1, _08011614 @ =0x06001000
	bl sub_08013688
	ldr r4, _08011618 @ =0x08199250
	movs r1, #0xf0
	lsls r1, r1, #1
	adds r0, r4, #0
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r0, _0801161C @ =0x02023C60
	ldr r1, _08011620 @ =0x08199290
	ldr r2, _08011624 @ =0x0000F080
	bl TmApplyTsa_thm
	movs r0, #4
	bl EnableBgSync
	adds r1, r4, #0
	adds r1, #0x20
	movs r0, #1
	str r0, [sp]
	str r6, [sp, #4]
	adds r0, r4, #0
	movs r2, #0x20
	movs r3, #0xf
	bl sub_080AB7F4
	str r5, [r6, #0x30]
	movs r0, #0x20
	str r0, [r6, #0x34]
	str r5, [r6, #0x3c]
	str r5, [r6, #0x40]
	movs r0, #2
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	add sp, #8
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08011604: .4byte 0x03002790
_08011608: .4byte 0x0000FFE0
_0801160C: .4byte 0x0000E0FF
_08011610: .4byte 0x08198D98
_08011614: .4byte 0x06001000
_08011618: .4byte 0x08199250
_0801161C: .4byte 0x02023C60
_08011620: .4byte 0x08199290
_08011624: .4byte 0x0000F080

	thumb_func_start sub_08011628
sub_08011628: @ 0x08011628
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x30]
	adds r0, #1
	str r0, [r4, #0x30]
	asrs r5, r0, #1
	ldr r3, _080116A4 @ =0x03002790
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
	movs r2, #0
	strb r5, [r0]
	movs r0, #0x10
	subs r0, r0, r5
	cmp r0, #0xd
	bge _08011658
	movs r0, #0xd
_08011658:
	adds r1, r3, #0
	adds r1, #0x45
	strb r0, [r1]
	adds r0, r3, #0
	adds r0, #0x46
	strb r2, [r0]
	cmp r5, #0x10
	bne _08011670
	str r2, [r4, #0x30]
	adds r0, r4, #0
	bl Proc_Break
_08011670:
	ldr r3, [r4, #0x34]
	adds r3, #1
	str r3, [r4, #0x34]
	lsls r0, r3, #1
	adds r0, r0, r3
	ldr r1, [r4, #0x3c]
	adds r1, r1, r0
	str r1, [r4, #0x3c]
	ldr r2, [r4, #0x40]
	adds r2, r2, r3
	str r2, [r4, #0x40]
	asrs r1, r1, #5
	rsbs r1, r1, #0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	asrs r2, r2, #5
	rsbs r2, r2, #0
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	movs r0, #2
	bl SetBgOffset
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080116A4: .4byte 0x03002790

	thumb_func_start sub_080116A8
sub_080116A8: @ 0x080116A8
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x30]
	adds r0, #1
	str r0, [r4, #0x30]
	ldr r1, [r4, #0x2c]
	cmp r0, r1
	blt _080116C2
	movs r0, #0
	str r0, [r4, #0x30]
	adds r0, r4, #0
	bl Proc_Break
_080116C2:
	ldr r3, [r4, #0x34]
	lsls r0, r3, #1
	adds r0, r0, r3
	ldr r1, [r4, #0x3c]
	adds r1, r1, r0
	str r1, [r4, #0x3c]
	ldr r2, [r4, #0x40]
	adds r2, r2, r3
	str r2, [r4, #0x40]
	asrs r1, r1, #5
	rsbs r1, r1, #0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	asrs r2, r2, #5
	rsbs r2, r2, #0
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	movs r0, #2
	bl SetBgOffset
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_080116F0
sub_080116F0: @ 0x080116F0
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x30]
	adds r0, #1
	str r0, [r4, #0x30]
	asrs r5, r0, #3
	ldr r3, _08011768 @ =0x03002790
	adds r2, r3, #0
	adds r2, #0x3c
	movs r0, #0x3f
	ldrb r1, [r2]
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r2]
	movs r0, #0x10
	subs r0, r0, r5
	adds r1, r3, #0
	adds r1, #0x44
	strb r0, [r1]
	adds r0, r5, #0
	adds r0, #0xd
	cmp r0, #0x10
	ble _08011722
	movs r0, #0x10
_08011722:
	adds r1, r3, #0
	adds r1, #0x45
	strb r0, [r1]
	adds r1, #1
	movs r0, #0
	strb r0, [r1]
	ldr r3, [r4, #0x34]
	lsls r0, r3, #1
	adds r0, r0, r3
	ldr r1, [r4, #0x3c]
	adds r1, r1, r0
	str r1, [r4, #0x3c]
	ldr r2, [r4, #0x40]
	adds r2, r2, r3
	str r2, [r4, #0x40]
	asrs r1, r1, #5
	rsbs r1, r1, #0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	asrs r2, r2, #5
	rsbs r2, r2, #0
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	movs r0, #2
	bl SetBgOffset
	cmp r5, #0x10
	bne _08011760
	adds r0, r4, #0
	bl Proc_Break
_08011760:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08011768: .4byte 0x03002790

	thumb_func_start sub_0801176C
sub_0801176C: @ 0x0801176C
	push {lr}
	ldr r0, _080117A4 @ =0x02023C60
	movs r1, #0
	bl sub_080017E8
	movs r0, #4
	bl EnableBgSync
	ldr r2, _080117A8 @ =0x03002790
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
	adds r3, r2, #0
	adds r3, #0x45
	movs r0, #0x10
	strb r0, [r3]
	adds r0, r2, #0
	adds r0, #0x46
	strb r1, [r0]
	pop {r0}
	bx r0
	.align 2, 0
_080117A4: .4byte 0x02023C60
_080117A8: .4byte 0x03002790

	thumb_func_start sub_080117AC
sub_080117AC: @ 0x080117AC
	push {r4, lr}
	adds r1, r0, #0
	ldr r0, [r1, #0x30]
	ldr r4, [r0, #4]
	adds r2, r1, #0
	adds r2, #0x5e
	movs r0, #4
	ldrh r2, [r2]
	ands r0, r2
	cmp r0, #0
	bne _080117D4
	ldr r0, _080117D0 @ =0x08C0127C
	bl Proc_StartBlocking
	str r4, [r0, #0x2c]
	movs r0, #2
	b _080117D6
	.align 2, 0
_080117D0: .4byte 0x08C0127C
_080117D4:
	movs r0, #0
_080117D6:
	pop {r4}
	pop {r1}
	bx r1

	thumb_func_start sub_080117DC
sub_080117DC: @ 0x080117DC
	push {r4, r5, r6, lr}
	sub sp, #0x14
	adds r5, r0, #0
	ldr r6, _08011894 @ =0x03002790
	adds r2, r6, #0
	adds r2, #0x3c
	movs r0, #0x3f
	ldrb r1, [r2]
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r2]
	adds r0, r6, #0
	adds r0, #0x44
	movs r4, #0
	strb r4, [r0]
	adds r1, r6, #0
	adds r1, #0x45
	movs r0, #0x10
	strb r0, [r1]
	adds r0, r6, #0
	adds r0, #0x46
	strb r4, [r0]
	ldr r0, _08011898 @ =0x0000FFE0
	ldrh r2, [r6, #0x3c]
	ands r0, r2
	movs r1, #4
	orrs r0, r1
	ldr r1, _0801189C @ =0x0000E0FF
	ands r0, r1
	movs r2, #0xf8
	lsls r2, r2, #5
	adds r1, r2, #0
	orrs r0, r1
	strh r0, [r6, #0x3c]
	bl sub_0807702C
	movs r0, #0
	movs r1, #0
	bl sub_080780E0
	movs r0, #0
	bl SetOnHBlankA
	ldr r0, _080118A0 @ =sub_08078098
	bl SetOnHBlankA
	movs r1, #4
	rsbs r1, r1, #0
	adds r0, r1, #0
	ldrb r2, [r6, #0xc]
	ands r0, r2
	strb r0, [r6, #0xc]
	adds r0, r1, #0
	ldrb r2, [r6, #0x10]
	ands r0, r2
	movs r2, #1
	orrs r0, r2
	strb r0, [r6, #0x10]
	ldrb r0, [r6, #0x14]
	ands r1, r0
	orrs r1, r2
	strb r1, [r6, #0x14]
	movs r0, #3
	ldrb r1, [r6, #0x18]
	orrs r0, r1
	strb r0, [r6, #0x18]
	movs r0, #7
	bl EnableBgSync
	str r4, [r5, #0x30]
	ldr r0, _080118A4 @ =0x08DBA258
	movs r1, #0x80
	lsls r1, r1, #5
	str r1, [sp]
	movs r1, #0xa0
	lsls r1, r1, #6
	str r1, [sp, #4]
	movs r1, #0xe
	str r1, [sp, #8]
	str r4, [sp, #0xc]
	str r5, [sp, #0x10]
	movs r1, #2
	movs r2, #0
	movs r3, #0
	bl sub_080AB654
	add sp, #0x14
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08011894: .4byte 0x03002790
_08011898: .4byte 0x0000FFE0
_0801189C: .4byte 0x0000E0FF
_080118A0: .4byte sub_08078098
_080118A4: .4byte 0x08DBA258

	thumb_func_start sub_080118A8
sub_080118A8: @ 0x080118A8
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r0, [r5, #0x30]
	adds r0, #1
	str r0, [r5, #0x30]
	asrs r4, r0, #1
	ldr r2, _080118D8 @ =0x03002790
	adds r3, r2, #0
	adds r3, #0x3c
	movs r0, #0x3f
	ldrb r1, [r3]
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r3]
	adds r0, r2, #0
	adds r0, #0x44
	strb r4, [r0]
	adds r3, r2, #0
	cmp r4, #6
	bgt _080118DC
	movs r0, #0x10
	subs r1, r0, r4
	b _080118DE
	.align 2, 0
_080118D8: .4byte 0x03002790
_080118DC:
	movs r1, #0xa
_080118DE:
	adds r0, r3, #0
	adds r0, #0x45
	movs r3, #0
	strb r1, [r0]
	adds r0, r2, #0
	adds r0, #0x46
	strb r3, [r0]
	cmp r4, #0x10
	bne _080118F8
	str r3, [r5, #0x30]
	adds r0, r5, #0
	bl Proc_Break
_080118F8:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_08011900
sub_08011900: @ 0x08011900
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r0, [r5, #0x30]
	adds r0, #1
	str r0, [r5, #0x30]
	asrs r4, r0, #1
	ldr r3, _08011950 @ =0x03002790
	adds r2, r3, #0
	adds r2, #0x3c
	movs r0, #0x3f
	ldrb r1, [r2]
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r2]
	movs r0, #0x10
	subs r0, r0, r4
	adds r1, r3, #0
	adds r1, #0x44
	strb r0, [r1]
	adds r0, r4, #0
	adds r0, #0xa
	cmp r0, #0x10
	ble _08011932
	movs r0, #0x10
_08011932:
	adds r1, r3, #0
	adds r1, #0x45
	strb r0, [r1]
	adds r1, #1
	movs r0, #0
	strb r0, [r1]
	cmp r4, #0x10
	bne _08011948
	adds r0, r5, #0
	bl Proc_Break
_08011948:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08011950: .4byte 0x03002790

	thumb_func_start sub_08011954
sub_08011954: @ 0x08011954
	push {lr}
	ldr r0, _080119BC @ =0x02023C60
	movs r1, #0
	bl sub_080017E8
	movs r0, #4
	bl EnableBgSync
	movs r0, #0
	bl SetOnHBlankA
	ldr r3, _080119C0 @ =0x03002790
	adds r1, r3, #0
	adds r1, #0x3c
	movs r0, #0x3f
	ldrb r2, [r1]
	ands r0, r2
	strb r0, [r1]
	adds r0, r3, #0
	adds r0, #0x44
	movs r1, #0
	strb r1, [r0]
	adds r2, r3, #0
	adds r2, #0x45
	movs r0, #0x10
	strb r0, [r2]
	adds r0, r3, #0
	adds r0, #0x46
	strb r1, [r0]
	subs r1, #4
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
	pop {r0}
	bx r0
	.align 2, 0
_080119BC: .4byte 0x02023C60
_080119C0: .4byte 0x03002790

	thumb_func_start sub_080119C4
sub_080119C4: @ 0x080119C4
	push {lr}
	adds r1, r0, #0
	adds r2, r1, #0
	adds r2, #0x5e
	movs r0, #4
	ldrh r2, [r2]
	ands r0, r2
	cmp r0, #0
	bne _080119E4
	ldr r0, _080119E0 @ =0x08C012BC
	bl Proc_StartBlocking
	movs r0, #2
	b _080119E6
	.align 2, 0
_080119E0: .4byte 0x08C012BC
_080119E4:
	movs r0, #0
_080119E6:
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_080119EC
sub_080119EC: @ 0x080119EC
	push {lr}
	adds r0, #0x5e
	movs r1, #4
	ldrh r0, [r0]
	ands r1, r0
	cmp r1, #0
	bne _08011A10
	ldr r0, _08011A0C @ =0x08C012BC
	bl Proc_Find
	movs r1, #0
	bl sub_080045FC
	movs r0, #2
	b _08011A1C
	.align 2, 0
_08011A0C: .4byte 0x08C012BC
_08011A10:
	ldr r0, _08011A20 @ =0x08C012BC
	bl Proc_Find
	bl Proc_End
	movs r0, #0
_08011A1C:
	pop {r1}
	bx r1
	.align 2, 0
_08011A20: .4byte 0x08C012BC

	thumb_func_start sub_08011A24
sub_08011A24: @ 0x08011A24
	push {r4, r5, lr}
	sub sp, #0x14
	ldr r5, _08011AB8 @ =0x03002790
	movs r2, #4
	rsbs r2, r2, #0
	adds r1, r2, #0
	ldrb r3, [r5, #0xc]
	ands r1, r3
	strb r1, [r5, #0xc]
	adds r1, r2, #0
	ldrb r3, [r5, #0x10]
	ands r1, r3
	movs r3, #1
	orrs r1, r3
	strb r1, [r5, #0x10]
	ldrb r1, [r5, #0x14]
	ands r2, r1
	strb r2, [r5, #0x14]
	movs r1, #3
	ldrb r2, [r5, #0x18]
	orrs r1, r2
	strb r1, [r5, #0x18]
	adds r3, r5, #0
	adds r3, #0x3c
	movs r1, #0x3f
	ldrb r2, [r3]
	ands r1, r2
	movs r2, #0x40
	orrs r1, r2
	strb r1, [r3]
	adds r2, r5, #0
	adds r2, #0x44
	movs r4, #0
	movs r1, #0x10
	strb r1, [r2]
	adds r2, #1
	strb r1, [r2]
	adds r1, r5, #0
	adds r1, #0x46
	strb r4, [r1]
	ldr r1, _08011ABC @ =0x0000FFE0
	ldrh r3, [r5, #0x3c]
	ands r1, r3
	movs r2, #4
	orrs r1, r2
	ldr r2, _08011AC0 @ =0x0000E0FF
	ands r1, r2
	movs r3, #0xc0
	lsls r3, r3, #5
	adds r2, r3, #0
	orrs r1, r2
	strh r1, [r5, #0x3c]
	str r4, [r0, #0x30]
	ldr r5, _08011AC4 @ =0x08C012FC
	ldr r2, [r0, #0x3c]
	adds r2, #0x54
	ldr r3, [r0, #0x40]
	str r4, [sp]
	movs r1, #0x80
	lsls r1, r1, #6
	str r1, [sp, #4]
	movs r1, #0xf
	str r1, [sp, #8]
	str r4, [sp, #0xc]
	str r0, [sp, #0x10]
	adds r0, r5, #0
	movs r1, #2
	bl sub_080AB654
	add sp, #0x14
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08011AB8: .4byte 0x03002790
_08011ABC: .4byte 0x0000FFE0
_08011AC0: .4byte 0x0000E0FF
_08011AC4: .4byte 0x08C012FC

	thumb_func_start sub_08011AC8
sub_08011AC8: @ 0x08011AC8
	push {lr}
	ldr r2, _08011AF8 @ =0x03002790
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
	adds r3, r2, #0
	adds r3, #0x45
	movs r0, #0x10
	strb r0, [r3]
	adds r0, r2, #0
	adds r0, #0x46
	strb r1, [r0]
	bl sub_08015998
	pop {r0}
	bx r0
	.align 2, 0
_08011AF8: .4byte 0x03002790

	thumb_func_start StartEvt_LymstellaThunderAtk
StartEvt_LymstellaThunderAtk: @ 0x08011AFC
	push {r4, r5, lr}
	adds r1, r0, #0
	ldr r0, [r1, #0x30]
	ldr r4, [r0, #4]
	ldr r5, [r0, #8]
	adds r2, r1, #0
	adds r2, #0x5e
	movs r0, #4
	ldrh r2, [r2]
	ands r0, r2
	cmp r0, #0
	bne _08011B28
	ldr r0, _08011B24 @ =0x08C013C8
	bl Proc_StartBlocking
	str r4, [r0, #0x3c]
	str r5, [r0, #0x40]
	movs r0, #2
	b _08011B2A
	.align 2, 0
_08011B24: .4byte 0x08C013C8
_08011B28:
	movs r0, #0
_08011B2A:
	pop {r4, r5}
	pop {r1}
	bx r1

	thumb_func_start sub_08011B30
sub_08011B30: @ 0x08011B30
	push {lr}
	ldr r0, _08011B40 @ =0x08C013C8
	bl Proc_Find
	cmp r0, #0
	bne _08011B44
	movs r0, #0
	b _08011B46
	.align 2, 0
_08011B40: .4byte 0x08C013C8
_08011B44:
	movs r0, #1
_08011B46:
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_08011B4C
sub_08011B4C: @ 0x08011B4C
	push {r4, lr}
	movs r3, #0
	str r3, [r0, #0x30]
	ldr r0, _08011BC8 @ =0x03002790
	mov ip, r0
	movs r1, #4
	rsbs r1, r1, #0
	adds r0, r1, #0
	mov r2, ip
	ldrb r2, [r2, #0xc]
	ands r0, r2
	mov r4, ip
	strb r0, [r4, #0xc]
	adds r0, r1, #0
	ldrb r2, [r4, #0x10]
	ands r0, r2
	movs r2, #1
	orrs r0, r2
	strb r0, [r4, #0x10]
	ldrb r4, [r4, #0x14]
	ands r1, r4
	mov r0, ip
	strb r1, [r0, #0x14]
	movs r0, #3
	mov r1, ip
	ldrb r1, [r1, #0x18]
	orrs r0, r1
	mov r2, ip
	strb r0, [r2, #0x18]
	adds r2, #0x3c
	movs r0, #0x3f
	ldrb r4, [r2]
	ands r0, r4
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r2]
	mov r0, ip
	adds r0, #0x44
	movs r1, #0x10
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r0, #1
	strb r3, [r0]
	ldr r0, _08011BCC @ =0x0000FFE0
	mov r1, ip
	ldrh r1, [r1, #0x3c]
	ands r0, r1
	movs r1, #4
	orrs r0, r1
	ldr r1, _08011BD0 @ =0x0000E0FF
	ands r0, r1
	movs r2, #0xc0
	lsls r2, r2, #5
	adds r1, r2, #0
	orrs r0, r1
	mov r4, ip
	strh r0, [r4, #0x3c]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08011BC8: .4byte 0x03002790
_08011BCC: .4byte 0x0000FFE0
_08011BD0: .4byte 0x0000E0FF

	thumb_func_start sub_08011BD4
sub_08011BD4: @ 0x08011BD4
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x30]
	adds r0, #1
	str r0, [r4, #0x30]
	movs r2, #0x80
	lsls r2, r2, #1
	subs r2, r2, r0
	ldr r3, _08011C04 @ =0xFFFFBFFF
	adds r0, r2, #0
	adds r1, r2, #0
	bl sub_08013C48
	ldr r0, [r4, #0x30]
	cmp r0, #0x40
	bne _08011BFE
	movs r0, #0
	str r0, [r4, #0x30]
	adds r0, r4, #0
	bl Proc_Break
_08011BFE:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08011C04: .4byte 0xFFFFBFFF

	thumb_func_start sub_08011C08
sub_08011C08: @ 0x08011C08
	push {r4, lr}
	adds r4, r0, #0
	ldr r2, [r4, #0x30]
	adds r0, r2, #1
	str r0, [r4, #0x30]
	adds r2, #0xc1
	ldr r3, _08011C34 @ =0xFFFFBFFF
	adds r0, r2, #0
	adds r1, r2, #0
	bl sub_08013C48
	ldr r0, [r4, #0x30]
	cmp r0, #0x40
	bne _08011C2E
	movs r0, #0
	str r0, [r4, #0x30]
	adds r0, r4, #0
	bl Proc_Break
_08011C2E:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08011C34: .4byte 0xFFFFBFFF

	thumb_func_start sub_08011C38
sub_08011C38: @ 0x08011C38
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x30]
	adds r0, #1
	str r0, [r4, #0x30]
	movs r1, #0xfa
	lsls r1, r1, #2
	cmp r0, r1
	bne _08011C56
	movs r0, #0
	bl sub_080AB634
	adds r0, r4, #0
	bl Proc_Break
_08011C56:
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_08011C5C
sub_08011C5C: @ 0x08011C5C
	push {r4, r5, r6, lr}
	sub sp, #8
	adds r6, r0, #0
	ldr r0, _08011CA8 @ =0x081AC808
	ldr r1, _08011CAC @ =0x06010800
	bl sub_08013688
	ldr r0, _08011CB0 @ =0x081ACA20
	movs r1, #0xa8
	lsls r1, r1, #2
	movs r2, #0x20
	bl ApplyPaletteExt
	movs r4, #0
_08011C78:
	movs r5, #0
	str r5, [sp]
	movs r0, #4
	str r0, [sp, #4]
	ldr r0, _08011CB4 @ =0x081ACA40
	movs r1, #0xc0
	lsls r1, r1, #1
	movs r2, #0
	ldr r3, _08011CB8 @ =0x00005040
	bl sub_08012AF0
	lsls r2, r4, #2
	adds r1, r6, #0
	adds r1, #0x44
	adds r1, r1, r2
	str r0, [r1]
	adds r4, #1
	cmp r4, #7
	ble _08011C78
	str r5, [r6, #0x30]
	add sp, #8
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08011CA8: .4byte 0x081AC808
_08011CAC: .4byte 0x06010800
_08011CB0: .4byte 0x081ACA20
_08011CB4: .4byte 0x081ACA40
_08011CB8: .4byte 0x00005040

	thumb_func_start sub_08011CBC
sub_08011CBC: @ 0x08011CBC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	adds r6, r0, #0
	ldr r4, [r6, #0x30]
	adds r4, #1
	str r4, [r6, #0x30]
	ldr r0, [r6, #0x3c]
	lsls r0, r0, #4
	ldr r2, _08011DC4 @ =gBmSt
	movs r3, #0xc
	ldrsh r1, [r2, r3]
	subs r0, r0, r1
	adds r0, #8
	str r0, [sp, #8]
	ldr r0, _08011DC8 @ =0x000001FF
	ldr r1, [sp, #8]
	ands r1, r0
	str r1, [sp, #8]
	ldr r0, [r6, #0x40]
	lsls r0, r0, #4
	movs r3, #0xe
	ldrsh r1, [r2, r3]
	subs r0, r0, r1
	adds r0, #8
	mov sl, r0
	movs r0, #0xff
	mov r1, sl
	ands r1, r0
	mov sl, r1
	movs r2, #0xa0
	subs r4, r2, r4
	lsls r0, r4, #4
	subs r0, r0, r4
	lsls r0, r0, #3
	muls r0, r4, r0
	movs r5, #0xc8
	lsls r5, r5, #7
	adds r1, r5, #0
	bl __divsi3
	adds r7, r0, #0
	lsls r0, r4, #8
	muls r0, r4, r0
	adds r1, r5, #0
	bl __divsi3
	movs r1, #0x88
	lsls r1, r1, #1
	movs r5, #0
	ldr r3, _08011DCC @ =0x080C0E98
	mov sb, r3
	movs r2, #0xff
	mov r8, r2
	subs r4, r1, r0
_08011D30:
	adds r2, r4, #0
	mov r3, r8
	ands r2, r3
	adds r0, r2, #0
	adds r0, #0x40
	lsls r0, r0, #1
	add r0, sb
	movs r1, #0
	ldrsh r0, [r0, r1]
	muls r0, r7, r0
	asrs r0, r0, #0xc
	movs r1, #0x78
	subs r1, r1, r0
	lsls r2, r2, #1
	add r2, sb
	movs r3, #0
	ldrsh r0, [r2, r3]
	muls r0, r7, r0
	asrs r0, r0, #0xc
	movs r2, #0x50
	subs r2, r2, r0
	lsls r3, r5, #2
	adds r0, r6, #0
	adds r0, #0x44
	adds r0, r0, r3
	ldr r0, [r0]
	ldr r3, _08011DC8 @ =0x000001FF
	ands r1, r3
	mov r3, r8
	ands r2, r3
	movs r3, #0x80
	lsls r3, r3, #3
	adds r2, r2, r3
	movs r3, #1
	rsbs r3, r3, #0
	bl sub_08012B70
	adds r4, #0x20
	adds r5, #1
	cmp r5, #7
	ble _08011D30
	movs r0, #0xa0
	movs r1, #3
	bl __divsi3
	ldr r1, [r6, #0x30]
	cmp r1, r0
	bne _08011DA8
	ldr r0, _08011DD0 @ =0x081ACA40
	movs r2, #0x80
	lsls r2, r2, #3
	add r2, sl
	ldr r3, _08011DD4 @ =0x00005040
	movs r1, #1
	str r1, [sp]
	movs r1, #4
	str r1, [sp, #4]
	ldr r1, [sp, #8]
	bl sub_08012AF0
_08011DA8:
	ldr r0, [r6, #0x30]
	cmp r0, #0xa0
	bne _08011DB4
	adds r0, r6, #0
	bl Proc_Break
_08011DB4:
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08011DC4: .4byte gBmSt
_08011DC8: .4byte 0x000001FF
_08011DCC: .4byte 0x080C0E98
_08011DD0: .4byte 0x081ACA40
_08011DD4: .4byte 0x00005040

	thumb_func_start sub_08011DD8
sub_08011DD8: @ 0x08011DD8
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r5, #0x44
	movs r4, #7
_08011DE0:
	ldm r5!, {r0}
	bl EndSpriteAnimProc
	subs r4, #1
	cmp r4, #0
	bge _08011DE0
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_08011DF4
sub_08011DF4: @ 0x08011DF4
	push {r4, r5, r6, lr}
	sub sp, #0x14
	adds r5, r0, #0
	ldr r2, [r5, #0x3c]
	lsls r2, r2, #4
	ldr r4, _08011E40 @ =gBmSt
	movs r1, #0xc
	ldrsh r0, [r4, r1]
	subs r2, r2, r0
	subs r2, #0x28
	movs r1, #0xff
	ands r2, r1
	ldr r3, [r5, #0x40]
	lsls r3, r3, #4
	movs r6, #0xe
	ldrsh r0, [r4, r6]
	subs r3, r3, r0
	subs r3, #0x28
	ands r3, r1
	ldr r0, _08011E44 @ =0x08C013F0
	movs r4, #0
	str r4, [sp]
	movs r1, #0x80
	lsls r1, r1, #6
	str r1, [sp, #4]
	movs r1, #0xf
	str r1, [sp, #8]
	str r4, [sp, #0xc]
	str r5, [sp, #0x10]
	movs r1, #2
	bl sub_080AB654
	str r4, [r5, #0x30]
	add sp, #0x14
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08011E40: .4byte gBmSt
_08011E44: .4byte 0x08C013F0

	thumb_func_start sub_08011E48
sub_08011E48: @ 0x08011E48
	push {r4, r5, lr}
	sub sp, #0x10
	adds r4, r0, #0
	ldr r0, [r4, #0x30]
	adds r0, #1
	str r0, [r4, #0x30]
	movs r5, #0
	cmp r0, #0x14
	bne _08011E70
	ldr r2, [r4, #0x3c]
	ldr r3, [r4, #0x40]
	str r2, [sp]
	str r3, [sp, #4]
	movs r0, #1
	str r0, [sp, #8]
	str r5, [sp, #0xc]
	movs r0, #0xdc
	movs r1, #0x40
	bl sub_080123C8
_08011E70:
	ldr r0, [r4, #0x30]
	cmp r0, #0x28
	bne _08011E84
	str r5, [r4, #0x30]
	movs r0, #0
	bl sub_080AB634
	adds r0, r4, #0
	bl Proc_Break
_08011E84:
	add sp, #0x10
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start sub_08011E8C
sub_08011E8C: @ 0x08011E8C
	push {lr}
	ldr r2, _08011EBC @ =0x03002790
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
	adds r3, r2, #0
	adds r3, #0x45
	movs r0, #0x10
	strb r0, [r3]
	adds r0, r2, #0
	adds r0, #0x46
	strb r1, [r0]
	bl sub_08015998
	pop {r0}
	bx r0
	.align 2, 0
_08011EBC: .4byte 0x03002790

	thumb_func_start sub_08011EC0
sub_08011EC0: @ 0x08011EC0
	push {r4, r5, lr}
	sub sp, #0x10
	adds r1, r0, #0
	ldr r0, [r1, #0x30]
	ldr r4, [r0, #4]
	ldr r5, [r0, #8]
	adds r2, r1, #0
	adds r2, #0x5e
	movs r0, #4
	ldrh r2, [r2]
	ands r0, r2
	cmp r0, #0
	bne _08011EEC
	ldr r0, _08011EE8 @ =0x08C015DC
	bl Proc_StartBlocking
	str r4, [r0, #0x3c]
	str r5, [r0, #0x40]
	movs r0, #2
	b _08011F06
	.align 2, 0
_08011EE8: .4byte 0x08C015DC
_08011EEC:
	str r4, [sp]
	str r5, [sp, #4]
	movs r0, #1
	str r0, [sp, #8]
	movs r0, #0
	str r0, [sp, #0xc]
	movs r0, #0xdc
	movs r1, #0x54
	adds r2, r4, #0
	adds r3, r5, #0
	bl sub_080123C8
	movs r0, #0
_08011F06:
	add sp, #0x10
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_08011F10
sub_08011F10: @ 0x08011F10
	push {lr}
	movs r1, #0
	str r1, [r0, #0x3c]
	bl sub_08013BCC
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_08011F20
sub_08011F20: @ 0x08011F20
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r1, [r4, #0x3c]
	ldr r0, [r4, #0x34]
	adds r2, r1, r0
	str r2, [r4, #0x3c]
	cmp r2, #0xff
	bgt _08011F5C
	movs r0, #0x80
	lsls r0, r0, #1
	subs r0, r0, r2
	lsls r3, r0, #8
	ldr r0, [r4, #0x40]
	muls r0, r2, r0
	adds r0, r3, r0
	cmp r0, #0
	bge _08011F44
	adds r0, #0xff
_08011F44:
	asrs r5, r0, #8
	ldr r0, [r4, #0x48]
	muls r0, r2, r0
	adds r1, r3, r0
	cmp r1, #0
	bge _08011F52
	adds r1, #0xff
_08011F52:
	asrs r1, r1, #8
	ldr r0, [r4, #0x44]
	muls r0, r2, r0
	adds r0, r3, r0
	b _08011F8C
_08011F5C:
	movs r0, #0x80
	lsls r0, r0, #2
	subs r3, r0, r2
	ldr r0, [r4, #0x40]
	adds r1, r0, #0
	muls r1, r3, r1
	ldr r5, _08011FBC @ =0xFFFFFF00
	adds r0, r2, r5
	lsls r2, r0, #8
	adds r0, r1, r2
	cmp r0, #0
	bge _08011F76
	adds r0, #0xff
_08011F76:
	asrs r5, r0, #8
	ldr r0, [r4, #0x48]
	muls r0, r3, r0
	adds r0, r0, r2
	cmp r0, #0
	bge _08011F84
	adds r0, #0xff
_08011F84:
	asrs r1, r0, #8
	ldr r0, [r4, #0x44]
	muls r0, r3, r0
	adds r0, r0, r2
_08011F8C:
	cmp r0, #0
	bge _08011F92
	adds r0, #0xff
_08011F92:
	asrs r2, r0, #8
	ldr r3, [r4, #0x30]
	adds r0, r5, #0
	bl sub_08013C48
	ldr r1, [r4, #0x3c]
	movs r0, #0x80
	lsls r0, r0, #1
	cmp r1, r0
	bne _08011FC0
	ldr r0, [r4, #0x2c]
	subs r0, #1
	str r0, [r4, #0x2c]
	cmp r0, #0
	bgt _08011FCC
	movs r0, #0
	str r0, [r4, #0x3c]
	adds r0, r4, #0
	bl Proc_Break
	b _08011FCC
	.align 2, 0
_08011FBC: .4byte 0xFFFFFF00
_08011FC0:
	movs r0, #0x80
	lsls r0, r0, #2
	cmp r1, r0
	bne _08011FCC
	movs r0, #0
	str r0, [r4, #0x3c]
_08011FCC:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_08011FD4
sub_08011FD4: @ 0x08011FD4
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	ldr r1, [r4, #0x3c]
	ldr r0, [r4, #0x38]
	adds r1, r1, r0
	str r1, [r4, #0x3c]
	movs r7, #0x80
	lsls r7, r7, #1
	subs r2, r7, r1
	ldr r0, [r4, #0x40]
	muls r0, r2, r0
	lsls r1, r1, #8
	adds r0, r0, r1
	cmp r0, #0
	bge _08011FF4
	adds r0, #0xff
_08011FF4:
	asrs r6, r0, #8
	ldr r0, [r4, #0x48]
	muls r0, r2, r0
	adds r0, r0, r1
	cmp r0, #0
	bge _08012002
	adds r0, #0xff
_08012002:
	asrs r5, r0, #8
	ldr r0, [r4, #0x44]
	muls r0, r2, r0
	adds r0, r0, r1
	cmp r0, #0
	bge _08012010
	adds r0, #0xff
_08012010:
	asrs r2, r0, #8
	ldr r3, [r4, #0x30]
	adds r0, r6, #0
	adds r1, r5, #0
	bl sub_08013C48
	ldr r0, [r4, #0x3c]
	cmp r0, r7
	bne _08012028
	adds r0, r4, #0
	bl Proc_Break
_08012028:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_08012030
sub_08012030: @ 0x08012030
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	mov r8, r0
	adds r4, r1, #0
	adds r5, r2, #0
	adds r6, r3, #0
	ldr r7, [sp, #0x18]
	ldr r1, [sp, #0x24]
	ldr r0, _08012068 @ =0x08C0162C
	bl Proc_StartBlocking
	str r4, [r0, #0x2c]
	mov r1, r8
	str r1, [r0, #0x30]
	str r5, [r0, #0x34]
	str r6, [r0, #0x38]
	str r7, [r0, #0x40]
	ldr r1, [sp, #0x1c]
	str r1, [r0, #0x48]
	ldr r1, [sp, #0x20]
	str r1, [r0, #0x44]
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08012068: .4byte 0x08C0162C

	thumb_func_start sub_0801206C
sub_0801206C: @ 0x0801206C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #0x10
	adds r7, r0, #0
	ldr r0, [r7, #0x30]
	ldr r1, [r0, #4]
	mov ip, r1
	ldr r1, [r0, #8]
	mov r8, r1
	ldr r1, [r0, #0xc]
	movs r2, #0xff
	adds r6, r1, #0
	ands r6, r2
	lsrs r5, r1, #0x10
	ands r5, r2
	ldr r0, [r0, #0x10]
	ldr r1, _080120C4 @ =0x000003FF
	adds r4, r0, #0
	ands r4, r1
	lsrs r3, r0, #0xa
	ands r3, r1
	lsrs r2, r0, #0x14
	ands r2, r1
	adds r1, r7, #0
	adds r1, #0x5e
	movs r0, #4
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _080120C8
	str r4, [sp]
	str r3, [sp, #4]
	str r2, [sp, #8]
	str r7, [sp, #0xc]
	mov r0, ip
	mov r1, r8
	adds r2, r6, #0
	adds r3, r5, #0
	bl sub_08012030
	movs r0, #2
	b _080120CA
	.align 2, 0
_080120C4: .4byte 0x000003FF
_080120C8:
	movs r0, #0
_080120CA:
	add sp, #0x10
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_080120D8
sub_080120D8: @ 0x080120D8
	movs r1, #0
	str r1, [r0, #0x38]
	bx lr
	.align 2, 0

	thumb_func_start sub_080120E0
sub_080120E0: @ 0x080120E0
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x38]
	ldr r1, [r4, #0x34]
	adds r0, r0, r1
	str r0, [r4, #0x38]
	cmp r0, #0xff
	ble _080120FC
	adds r0, r4, #0
	bl Proc_Break
	movs r0, #0x80
	lsls r0, r0, #1
	str r0, [r4, #0x38]
_080120FC:
	ldr r2, [r4, #0x38]
	movs r0, #0x80
	lsls r0, r0, #1
	subs r3, r0, r2
	ldr r0, [r4, #0x3c]
	adds r1, r0, #0
	muls r1, r3, r1
	ldr r0, [r4, #0x48]
	muls r0, r2, r0
	adds r0, r1, r0
	cmp r0, #0
	bge _08012116
	adds r0, #0xff
_08012116:
	asrs r6, r0, #8
	ldr r0, [r4, #0x40]
	adds r1, r0, #0
	muls r1, r3, r1
	ldr r0, [r4, #0x4c]
	muls r0, r2, r0
	adds r1, r1, r0
	cmp r1, #0
	bge _0801212A
	adds r1, #0xff
_0801212A:
	asrs r5, r1, #8
	ldr r0, [r4, #0x44]
	adds r1, r0, #0
	muls r1, r3, r1
	ldr r0, [r4, #0x50]
	muls r0, r2, r0
	adds r0, r1, r0
	cmp r0, #0
	bge _0801213E
	adds r0, #0xff
_0801213E:
	asrs r2, r0, #8
	ldr r3, [r4, #0x30]
	adds r0, r6, #0
	adds r1, r5, #0
	bl sub_08013C48
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	thumb_func_start sub_08012150
sub_08012150: @ 0x08012150
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	mov r8, r0
	adds r4, r1, #0
	adds r6, r2, #0
	adds r7, r3, #0
	ldr r1, [sp, #0x1c]
	ldr r0, _080121A0 @ =0x08C01654
	bl Proc_StartBlocking
	adds r5, r0, #0
	movs r0, #0xff
	ands r0, r4
	cmp r0, #0x80
	bne _08012174
	movs r0, #0x80
	lsls r0, r0, #1
_08012174:
	str r0, [r5, #0x34]
	bl sub_08013BA0
	str r0, [r5, #0x3c]
	bl sub_08013BAC
	str r0, [r5, #0x40]
	bl sub_08013BBC
	str r0, [r5, #0x44]
	mov r0, r8
	str r0, [r5, #0x30]
	str r6, [r5, #0x48]
	str r7, [r5, #0x4c]
	ldr r0, [sp, #0x18]
	str r0, [r5, #0x50]
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080121A0: .4byte 0x08C01654

	thumb_func_start sub_080121A4
sub_080121A4: @ 0x080121A4
	push {r4, r5, r6, r7, lr}
	sub sp, #8
	adds r5, r0, #0
	ldr r0, [r5, #0x30]
	ldr r6, [r0, #4]
	ldr r7, [r0, #8]
	ldr r0, [r0, #0xc]
	ldr r1, _080121E0 @ =0x000003FF
	adds r4, r0, #0
	ands r4, r1
	lsrs r3, r0, #0xa
	ands r3, r1
	lsrs r2, r0, #0x14
	ands r2, r1
	adds r1, r5, #0
	adds r1, #0x5e
	movs r0, #4
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _080121E4
	str r2, [sp]
	str r5, [sp, #4]
	adds r0, r6, #0
	adds r1, r7, #0
	adds r2, r4, #0
	bl sub_08012150
	movs r0, #2
	b _080121E6
	.align 2, 0
_080121E0: .4byte 0x000003FF
_080121E4:
	movs r0, #0
_080121E6:
	add sp, #8
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_080121F0
sub_080121F0: @ 0x080121F0
	push {lr}
	bl sub_08013BCC
	movs r0, #2
	pop {r1}
	bx r1

	thumb_func_start sub_080121FC
sub_080121FC: @ 0x080121FC
	push {lr}
	movs r2, #0x80
	lsls r2, r2, #1
	movs r3, #1
	rsbs r3, r3, #0
	adds r0, r2, #0
	adds r1, r2, #0
	bl sub_08013C48
	movs r0, #2
	pop {r1}
	bx r1

	thumb_func_start sub_08012214
sub_08012214: @ 0x08012214
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	sub sp, #0x18
	mov r8, r0
	ldr r1, _08012274 @ =gBmSt
	movs r2, #0xc
	ldrsh r0, [r1, r2]
	mov r5, r8
	ldr r3, [r5, #0x2c]
	subs r3, r3, r0
	adds r3, #8
	movs r2, #0xe
	ldrsh r0, [r1, r2]
	ldr r4, [r5, #0x30]
	subs r4, r4, r0
	adds r4, #8
	ldr r6, [r5, #0x38]
	ldr r0, [r6, #4]
	ldr r1, [r6]
	ldr r2, [r6, #8]
	ldr r5, _08012278 @ =0x000001FF
	ands r3, r5
	movs r5, #0xff
	ands r4, r5
	ldrh r5, [r6, #0xc]
	adds r4, r5, r4
	str r4, [sp]
	movs r4, #0
	str r4, [sp, #4]
	ldrb r4, [r6, #0x10]
	str r4, [sp, #8]
	ldrb r4, [r6, #0x11]
	str r4, [sp, #0xc]
	ldrh r4, [r6, #0xe]
	str r4, [sp, #0x10]
	movs r4, #4
	str r4, [sp, #0x14]
	bl sub_080AB840
	mov r1, r8
	str r0, [r1, #0x34]
	add sp, #0x18
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08012274: .4byte gBmSt
_08012278: .4byte 0x000001FF

	thumb_func_start sub_0801227C
sub_0801227C: @ 0x0801227C
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	ldr r6, [r4, #0x34]
	ldr r5, [r6]
	cmp r5, #0
	beq _080122BC
	ldr r2, _080122B4 @ =gBmSt
	movs r1, #0xc
	ldrsh r0, [r2, r1]
	ldr r1, [r4, #0x2c]
	subs r1, r1, r0
	adds r1, #8
	movs r3, #0xe
	ldrsh r0, [r2, r3]
	ldr r2, [r4, #0x30]
	subs r2, r2, r0
	adds r2, #8
	ldr r0, _080122B8 @ =0x000001FF
	ands r1, r0
	movs r0, #0xff
	ands r2, r0
	movs r3, #1
	rsbs r3, r3, #0
	adds r0, r6, #0
	bl sub_08012B70
	b _080122C4
	.align 2, 0
_080122B4: .4byte gBmSt
_080122B8: .4byte 0x000001FF
_080122BC:
	adds r0, r4, #0
	bl Proc_Break
	str r5, [r4, #0x34]
_080122C4:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_080122CC
sub_080122CC: @ 0x080122CC
	push {lr}
	ldr r0, [r0, #0x34]
	cmp r0, #0
	beq _080122D8
	bl EndSpriteAnimProc
_080122D8:
	pop {r0}
	bx r0

	thumb_func_start sub_080122DC
sub_080122DC: @ 0x080122DC
	push {r4, r5, r6, lr}
	adds r1, r0, #0
	ldr r0, [r1, #0x30]
	ldr r6, [r0, #4]
	ldr r2, [r0, #8]
	movs r0, #0x80
	lsls r0, r0, #8
	ands r0, r2
	cmp r0, #0
	bne _080122FC
	ldr r4, _080122F8 @ =0x0000FFFF
	ands r4, r2
	b _08012300
	.align 2, 0
_080122F8: .4byte 0x0000FFFF
_080122FC:
	movs r4, #1
	rsbs r4, r4, #0
_08012300:
	ldr r0, [r1, #0x30]
	ldrh r2, [r0, #0xa]
	movs r0, #0x80
	lsls r0, r0, #8
	ands r0, r2
	movs r5, #1
	rsbs r5, r5, #0
	cmp r0, #0
	bne _08012314
	adds r5, r2, #0
_08012314:
	adds r2, r1, #0
	adds r2, #0x5e
	movs r0, #4
	ldrh r2, [r2]
	ands r0, r2
	cmp r0, #0
	beq _08012326
	movs r0, #0
	b _08012332
_08012326:
	ldr r0, _08012338 @ =0x08C01674
	bl Proc_Start
	str r4, [r0, #0x2c]
	str r5, [r0, #0x30]
	str r6, [r0, #0x38]
_08012332:
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_08012338: .4byte 0x08C01674

	thumb_func_start sub_0801233C
sub_0801233C: @ 0x0801233C
	push {lr}
	ldr r0, _0801234C @ =0x08C01674
	bl Proc_Find
	bl Proc_End
	pop {r1}
	bx r1
	.align 2, 0
_0801234C: .4byte 0x08C01674

	thumb_func_start sub_08012350
sub_08012350: @ 0x08012350
	push {lr}
	ldr r0, _0801236C @ =0x08C01674
	bl Proc_Find
	cmp r0, #0
	beq _08012370
	ldr r0, [r0, #0x34]
	cmp r0, #0
	beq _08012368
	ldr r0, [r0]
	cmp r0, #0
	bne _08012370
_08012368:
	movs r0, #0
	b _08012372
	.align 2, 0
_0801236C: .4byte 0x08C01674
_08012370:
	movs r0, #1
_08012372:
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_08012378
sub_08012378: @ 0x08012378
	push {r4, r5, r6, r7, lr}
	sub sp, #8
	adds r5, r0, #0
	ldr r0, [r5, #0x30]
	ldr r6, [r0, #4]
	ldr r7, [r0, #8]
	ldr r4, [r0, #0xc]
	adds r1, r5, #0
	adds r1, #0x5e
	movs r0, #4
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	beq _08012398
	movs r0, #0
	b _080123B2
_08012398:
	movs r1, #0xff
	adds r2, r4, #0
	ands r2, r1
	asrs r3, r4, #0x10
	ands r3, r1
	asrs r0, r4, #0x18
	ands r0, r1
	str r0, [sp]
	str r5, [sp, #4]
	adds r0, r6, #0
	adds r1, r7, #0
	bl sub_080AB7F4
_080123B2:
	add sp, #8
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_080123BC
sub_080123BC: @ 0x080123BC
	push {lr}
	bl sub_080AB82C
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_080123C8
sub_080123C8: @ 0x080123C8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	adds r6, r0, #0
	mov r8, r1
	mov sb, r2
	mov sl, r3
	ldr r7, [sp, #0x24]
	ldr r5, [sp, #0x2c]
	movs r0, #0
	str r0, [sp]
	ldr r4, _08012438 @ =0x030040F0
	ldr r2, _0801243C @ =0x01000004
	mov r0, sp
	adds r1, r4, #0
	bl CpuFastSet
	movs r0, #3
	ands r5, r0
	lsls r5, r5, #1
	movs r0, #7
	rsbs r0, r0, #0
	ldrb r1, [r4, #3]
	ands r0, r1
	orrs r0, r5
	movs r1, #7
	ands r0, r1
	movs r1, #8
	orrs r0, r1
	strb r0, [r4, #3]
	strb r6, [r4]
	mov r0, r8
	strb r0, [r4, #1]
	mov r1, sb
	strb r1, [r4, #4]
	mov r0, sl
	strb r0, [r4, #5]
	strb r7, [r4, #6]
	add r1, sp, #0x28
	ldrb r1, [r1]
	strb r1, [r4, #7]
	adds r0, r4, #0
	ldr r1, [sp, #0x30]
	bl sub_0800A614
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08012438: .4byte 0x030040F0
_0801243C: .4byte 0x01000004

	thumb_func_start sub_08012440
sub_08012440: @ 0x08012440
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r4, r0, #0
	adds r6, r1, #0
	movs r0, #0
	str r0, [sp]
	ldr r5, _08012490 @ =0x030040F0
	ldr r2, _08012494 @ =0x01000004
	mov r0, sp
	adds r1, r5, #0
	bl CpuFastSet
	ldrb r2, [r4, #3]
	movs r1, #6
	ands r1, r2
	movs r0, #7
	rsbs r0, r0, #0
	ldrb r3, [r5, #3]
	ands r0, r3
	orrs r0, r1
	lsrs r2, r2, #3
	lsls r2, r2, #3
	movs r1, #7
	ands r0, r1
	orrs r0, r2
	strb r0, [r5, #3]
	ldrb r0, [r4]
	strb r0, [r5]
	ldrb r0, [r4, #1]
	strb r0, [r5, #1]
	cmp r6, #0
	beq _08012498
	ldrb r0, [r4, #4]
	strb r0, [r5, #4]
	ldrb r0, [r4, #5]
	strb r0, [r5, #5]
	ldrb r1, [r4, #6]
	ldrb r2, [r4, #7]
	b _080124A2
	.align 2, 0
_08012490: .4byte 0x030040F0
_08012494: .4byte 0x01000004
_08012498:
	ldrb r1, [r4, #6]
	strb r1, [r5, #4]
	ldrb r0, [r4, #7]
	strb r0, [r5, #5]
	adds r2, r0, #0
_080124A2:
	ldr r0, _080124B8 @ =0x030040F0
	strb r1, [r0, #6]
	strb r2, [r0, #7]
	adds r1, r6, #0
	bl sub_0800A614
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080124B8: .4byte 0x030040F0

	thumb_func_start sub_080124BC
sub_080124BC: @ 0x080124BC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x10
	adds r7, r0, #0
	ldr r1, [r7, #0x54]
	ldrb r0, [r1]
	cmp r0, #0
	bne _080124DA
	adds r0, r7, #0
	bl Proc_End
	b _08012582
_080124DA:
	ldrb r4, [r1, #6]
	str r4, [r7, #0x2c]
	ldrb r3, [r1, #7]
	str r3, [r7, #0x30]
	ldr r6, _08012594 @ =gBmMapUnit
	ldr r1, [r6]
	lsls r0, r3, #2
	adds r0, r0, r1
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r0, [r0]
	cmp r0, #0
	beq _08012578
	movs r0, #0xff
	mov sb, r0
	movs r1, #1
	rsbs r1, r1, #0
	mov sl, r1
	mov r2, sl
	str r2, [sp]
	ldr r2, _08012598 @ =0x08C52B94
	adds r0, r4, #0
	adds r1, r3, #0
	bl GenerateExtendedMovementMap
	movs r5, #0
	ldr r0, _0801259C @ =gBmMapSize
	movs r3, #2
	ldrsh r1, [r0, r3]
	cmp r5, r1
	bge _08012570
	movs r3, #0
	ldrsh r2, [r0, r3]
	str r2, [sp, #8]
	str r1, [sp, #4]
_08012520:
	movs r3, #0
	adds r6, r5, #1
	mov ip, r6
	ldr r0, [sp, #8]
	cmp r3, r0
	bge _08012568
	ldr r1, _080125A0 @ =gBmMapMovement
	ldr r0, [r1]
	lsls r1, r5, #2
	adds r0, r1, r0
	ldr r0, [r0]
	str r0, [sp, #0xc]
	ldr r2, _0801259C @ =gBmMapSize
	movs r6, #0
	ldrsh r4, [r2, r6]
	ldr r0, _08012594 @ =gBmMapUnit
	mov r8, r0
_08012542:
	ldr r2, [sp, #0xc]
	adds r0, r2, r3
	ldrb r2, [r0]
	cmp sb, r2
	ble _08012562
	mov r6, r8
	ldr r0, [r6]
	adds r0, r1, r0
	ldr r0, [r0]
	adds r0, r0, r3
	ldrb r0, [r0]
	cmp r0, #0
	bne _08012562
	mov sb, r2
	str r3, [sp]
	mov sl, r5
_08012562:
	adds r3, #1
	cmp r3, r4
	blt _08012542
_08012568:
	mov r5, ip
	ldr r0, [sp, #4]
	cmp r5, r0
	blt _08012520
_08012570:
	ldr r1, [sp]
	str r1, [r7, #0x2c]
	mov r2, sl
	str r2, [r7, #0x30]
_08012578:
	ldr r1, [r7, #0x2c]
	ldr r2, [r7, #0x30]
	adds r0, r7, #0
	bl sub_0801615C
_08012582:
	add sp, #0x10
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08012594: .4byte gBmMapUnit
_08012598: .4byte 0x08C52B94
_0801259C: .4byte gBmMapSize
_080125A0: .4byte gBmMapMovement

	thumb_func_start sub_080125A4
sub_080125A4: @ 0x080125A4
	push {r4, r5, r6, lr}
	sub sp, #0x14
	adds r4, r0, #0
	ldr r5, [r4, #0x54]
	ldr r1, [r4, #0x2c]
	ldr r2, [r4, #0x30]
	movs r0, #1
	str r0, [sp]
	adds r0, r4, #0
	movs r3, #1
	bl sub_08020E5C
	add r1, sp, #4
	adds r0, r5, #0
	ldm r0!, {r2, r3, r6}
	stm r1!, {r2, r3, r6}
	ldr r0, [r0]
	str r0, [r1]
	add r2, sp, #4
	adds r1, r2, #0
	ldr r0, [r4, #0x2c]
	strb r0, [r1, #6]
	strb r0, [r2, #4]
	ldr r0, [r4, #0x30]
	strb r0, [r1, #7]
	strb r0, [r2, #5]
	adds r0, r1, #0
	bl LoadUnit
	adds r5, #0x10
	str r5, [r4, #0x54]
	add sp, #0x14
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_080125EC
sub_080125EC: @ 0x080125EC
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08012638 @ =0x0202E3F0
	ldr r0, [r0]
	movs r1, #0
	bl BmMapFillg
	ldr r0, _0801263C @ =0x08C0169C
	adds r1, r4, #0
	bl Proc_StartBlocking
	adds r2, r0, #0
	ldr r0, [r4, #0x30]
	ldr r0, [r0, #4]
	str r0, [r2, #0x54]
	movs r3, #0
	adds r0, r4, #0
	adds r0, #0x4d
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne _08012628
	adds r1, r4, #0
	adds r1, #0x5e
	movs r0, #4
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	beq _0801262A
_08012628:
	movs r3, #1
_0801262A:
	adds r0, r2, #0
	adds r0, #0x64
	strh r3, [r0]
	movs r0, #2
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08012638: .4byte 0x0202E3F0
_0801263C: .4byte 0x08C0169C
