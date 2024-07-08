	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_8010630
sub_8010630: @ 0x08010630
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
	ldr r5, _0801074C @ =Sprite_16x8
	str r7, [sp]
	movs r0, #4
	adds r3, r5, #0
	bl PutSpriteExt
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
	bl PutSpriteExt
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
	bl PutSpriteExt
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
	bl PutSpriteExt
	ldr r1, [r6, #0x30]
	ldrh r0, [r4]
	adds r0, #8
	ldr r2, [r6, #0x34]
	adds r2, r2, r0
	ldr r5, _08010750 @ =Sprite_8x8
	adds r0, r7, #6
	str r0, [sp]
	movs r0, #4
	adds r3, r5, #0
	bl PutSpriteExt
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
	bl PutSpriteExt
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
	bl PutSpriteExt
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
	bl PutSpriteExt
	movs r5, #2
	b _08010772
	.align 2, 0
_08010748: .4byte 0x0001FFFF
_0801074C: .4byte Sprite_16x8
_08010750: .4byte Sprite_8x8
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
	ldr r3, _080107B0 @ =Sprite_16x8
	bl PutSpriteExt
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
	ldr r3, _080107B4 @ =Sprite_8x8
	bl PutSpriteExt
	adds r5, #1
	ldr r0, [r6, #0x44]
	subs r0, #1
	cmp r5, r0
	blt _08010788
_080107AC:
	movs r5, #2
	b _080107D8
	.align 2, 0
_080107B0: .4byte Sprite_16x8
_080107B4: .4byte Sprite_8x8
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
	ldr r3, _080108B8 @ =Sprite_16x8
	bl PutSpriteExt
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
	ldr r3, _080108B8 @ =Sprite_16x8
	bl PutSpriteExt
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
	ldr r3, _080108B8 @ =Sprite_16x8
	bl PutSpriteExt
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
	ldr r0, _080108BC @ =Sprite_8x8
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
	bl PutSpriteExt
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
	bl PutSpriteExt
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
	ldr r3, _080108C0 @ =Sprite_32x16
	bl PutSpriteExt
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
_080108B8: .4byte Sprite_16x8
_080108BC: .4byte Sprite_8x8
_080108C0: .4byte Sprite_32x16

	thumb_func_start nullsub_32
nullsub_32: @ 0x080108C4
	bx lr
	.align 2, 0

	thumb_func_start sub_80108C8
sub_80108C8: @ 0x080108C8
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

	thumb_func_start sub_80108F0
sub_80108F0: @ 0x080108F0
	push {lr}
	adds r0, #0x4c
	movs r3, #0
	movs r1, #0
	strh r1, [r0]
	ldr r0, _0801095C @ =gDispIo
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
	ldr r0, _08010968 @ =gUnk_08C01124
	bl Proc_Find
	movs r1, #1
	bl sub_80108C8
	pop {r0}
	bx r0
	.align 2, 0
_0801095C: .4byte gDispIo
_08010960: .4byte 0x0000FFE0
_08010964: .4byte 0x0000E0FF
_08010968: .4byte gUnk_08C01124

	thumb_func_start sub_801096C
sub_801096C: @ 0x0801096C
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
	ldr r2, _080109EC @ =gDispIo
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
	ldr r0, _080109F0 @ =gUnk_08C01124
	bl Proc_Find
	movs r1, #0
	bl sub_80108C8
_080109DC:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080109EC: .4byte gDispIo
_080109F0: .4byte gUnk_08C01124

	thumb_func_start sub_80109F4
sub_80109F4: @ 0x080109F4
	push {lr}
	adds r0, #0x4c
	movs r3, #0
	movs r1, #0
	strh r1, [r0]
	ldr r0, _08010A60 @ =gDispIo
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
	ldr r0, _08010A6C @ =gUnk_08C01124
	bl Proc_Find
	movs r1, #1
	bl sub_80108C8
	pop {r0}
	bx r0
	.align 2, 0
_08010A60: .4byte gDispIo
_08010A64: .4byte 0x0000FFE0
_08010A68: .4byte 0x0000E0FF
_08010A6C: .4byte gUnk_08C01124

	thumb_func_start sub_8010A70
sub_8010A70: @ 0x08010A70
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r0, #0x4c
	ldrh r1, [r0]
	adds r1, #1
	movs r4, #0
	strh r1, [r0]
	movs r1, #0
	ldrsh r3, [r0, r1]
	ldr r0, _08010AC4 @ =gDispIo
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
	ldr r0, _08010AC8 @ =gUnk_08C01124
	bl Proc_Find
	bl Proc_End
	adds r0, r5, #0
	bl Proc_Break
_08010ABE:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08010AC4: .4byte gDispIo
_08010AC8: .4byte gUnk_08C01124

	thumb_func_start sub_8010ACC
sub_8010ACC: @ 0x08010ACC
	ldr r3, _08010AF0 @ =gDispIo
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
_08010AF0: .4byte gDispIo

	thumb_func_start sub_8010AF4
sub_8010AF4: @ 0x08010AF4
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
	ldr r0, _08010BD8 @ =gUnk_08C01124
	ldr r1, [sp, #0x48]
	bl Proc_Start
	adds r7, r0, #0
	adds r0, r4, #0
	bl DecodeMsg
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
	ldr r0, _08010BDC @ =gUnk_08C01144
	ldr r1, [sp, #0x48]
	bl Proc_StartBlocking
	ldr r0, _08010BE0 @ =gUnk_08452C74
	ldr r1, [r7, #0x3c]
	adds r1, #0x10
	lsls r1, r1, #5
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r0, _08010BE4 @ =Pal_Text
	ldr r1, [r7, #0x3c]
	adds r1, #0x11
	lsls r1, r1, #5
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r0, _08010BE8 @ =gUnk_08452AD4
	ldr r1, [r7, #0x38]
	ldr r2, _08010BEC @ =0x06010000
	adds r1, r1, r2
	bl Decompress
	mov r0, sl
	bl GetStringTextLen
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
	bl InitSpriteTextFont
	mov r0, sp
	bl SetTextFont
	mov r2, sp
	adds r2, #0x18
	str r2, [sp, #0x20]
	adds r0, r2, #0
	bl InitSpriteText
	ldr r0, [sp, #0x20]
	movs r1, #0
	bl SpriteText_DrawBackgroundExt
	movs r0, #0
	bl SetTextFontGlyphs
	adds r4, #3
	lsls r4, r4, #3
	adds r0, r4, #0
	mov r1, sl
	bl GetStringTextCenteredPos
	adds r1, r0, #0
	ldr r0, [sp, #0x20]
	movs r2, #0
	mov r3, sl
	bl Text_InsertDrawString
	movs r0, #0
	bl SetTextFont
	add sp, #0x24
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08010BD8: .4byte gUnk_08C01124
_08010BDC: .4byte gUnk_08C01144
_08010BE0: .4byte gUnk_08452C74
_08010BE4: .4byte Pal_Text
_08010BE8: .4byte gUnk_08452AD4
_08010BEC: .4byte 0x06010000
_08010BF0: .4byte 0x06010400

	thumb_func_start sub_8010BF4
sub_8010BF4: @ 0x08010BF4
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
	bl sub_8010AF4
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

	thumb_func_start sub_8010C5C
sub_8010C5C: @ 0x08010C5C
	push {lr}
	adds r1, r0, #0
	adds r2, r1, #0
	adds r2, #0x5e
	movs r0, #4
	ldrh r2, [r2]
	ands r0, r2
	cmp r0, #0
	beq _08010C80
	ldr r0, _08010C7C @ =gUnk_08C01124
	bl Proc_Find
	bl Proc_End
	movs r0, #0
	b _08010CA8
	.align 2, 0
_08010C7C: .4byte gUnk_08C01124
_08010C80:
	adds r0, r1, #0
	adds r0, #0x4d
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _08010CA0
	ldr r0, _08010C9C @ =gUnk_08C01124
	bl Proc_Find
	bl Proc_End
	b _08010CA6
	.align 2, 0
_08010C9C: .4byte gUnk_08C01124
_08010CA0:
	ldr r0, _08010CAC @ =gUnk_08C0115C
	bl Proc_StartBlocking
_08010CA6:
	movs r0, #2
_08010CA8:
	pop {r1}
	bx r1
	.align 2, 0
_08010CAC: .4byte gUnk_08C0115C

	thumb_func_start sub_8010CB0
sub_8010CB0: @ 0x08010CB0
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	ldr r4, _08010D60 @ =gDispIo
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
_08010D60: .4byte gDispIo
_08010D64: .4byte 0x0000FFE0
_08010D68: .4byte 0x0000E0FF
_08010D6C:
	movs r0, #6
_08010D6E:
	str r0, [r5, #0x44]
	movs r0, #0
	str r0, [r5, #0x30]
	ldr r0, _08010D84 @ =ProcScr_Event
	bl Proc_Find
	str r0, [r5, #0x40]
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08010D84: .4byte ProcScr_Event

	thumb_func_start sub_8010D88
sub_8010D88: @ 0x08010D88
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r0, _08010DF0 @ =0x06008000
	ldr r1, _08010DF4 @ =0x06001000
	movs r2, #0xa0
	lsls r2, r2, #5
	bl CpuFastSet
	ldr r0, _08010DF8 @ =gPal + 0x100
	ldr r2, _08010DFC @ =0xFFFFFF00
	adds r1, r0, r2
	ldr r2, [r4, #0x44]
	lsls r2, r2, #3
	ldr r3, _08010E00 @ =0x001FFFFF
	ands r2, r3
	bl CpuFastSet
	ldr r5, _08010E04 @ =0x00008080
	adds r4, r5, #0
	ldr r3, _08010E08 @ =gBg3Tm
	ldr r2, _08010E0C @ =gBg2Tm
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

	thumb_func_start sub_8010DC4
sub_8010DC4: @ 0x08010DC4
	bne _08010DB6
	movs r0, #4
	bl EnableBgSync
	bl EnablePalSync
	ldr r2, _08010E10 @ =gDispIo
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
_08010DF8: .4byte gPal + 0x100
_08010DFC: .4byte 0xFFFFFF00
_08010E00: .4byte 0x001FFFFF
_08010E04: .4byte 0x00008080
_08010E08: .4byte gBg3Tm
_08010E0C: .4byte gBg2Tm
_08010E10: .4byte gDispIo

	thumb_func_start sub_8010E14
sub_8010E14: @ 0x08010E14
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	adds r0, #0x3c
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _08010E7C
	ldr r4, _08010E70 @ =gBackgroundTable
	ldr r1, [r5, #0x2c]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r4
	ldr r0, [r0]
	ldr r1, _08010E74 @ =0x06008000
	bl Decompress
	ldr r0, _08010E78 @ =gBg3Tm
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
_08010E70: .4byte gBackgroundTable
_08010E74: .4byte 0x06008000
_08010E78: .4byte gBg3Tm
_08010E7C:
	ldr r0, _08010E9C @ =gBg3Tm
	movs r1, #0x80
	lsls r1, r1, #8
	ldr r3, [r5, #0x44]
	ldr r2, [r5, #0x2c]
	str r2, [sp]
	movs r2, #8
	bl sub_80B7980
_08010E8E:
	movs r0, #8
	bl EnableBgSync
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08010E9C: .4byte gBg3Tm

	thumb_func_start sub_8010EA0
sub_8010EA0: @ 0x08010EA0
	push {r4, lr}
	adds r4, r0, #0
	ldr r2, [r4, #0x30]
	ldr r0, [r4, #0x38]
	adds r2, r2, r0
	str r2, [r4, #0x30]
	asrs r2, r2, #4
	ldr r0, _08010EE8 @ =gDispIo
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
_08010EE8: .4byte gDispIo

	thumb_func_start sub_8010EEC
sub_8010EEC: @ 0x08010EEC
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #3
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	ldr r0, _08010F40 @ =gBg2Tm
	movs r1, #0
	bl TmFill
	movs r0, #4
	bl EnableBgSync
	ldr r3, _08010F44 @ =gDispIo
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
	bl InitBmBgLayers
_08010F38:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08010F40: .4byte gBg2Tm
_08010F44: .4byte gDispIo

	thumb_func_start sub_8010F48
sub_8010F48: @ 0x08010F48
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	adds r4, r1, #0
	adds r5, r2, #0
	adds r1, r3, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	ldr r0, _08010F70 @ =gUnk_08C0117C
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
_08010F70: .4byte gUnk_08C0117C

	thumb_func_start sub_8010F74
sub_8010F74: @ 0x08010F74
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	ldr r7, _08011028 @ =gDispIo
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
	ldr r0, _08011034 @ =ProcScr_Event
	bl Proc_Find
	str r0, [r5, #0x40]
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08011028: .4byte gDispIo
_0801102C: .4byte 0x0000FFE0
_08011030: .4byte 0x0000E0FF
_08011034: .4byte ProcScr_Event

	thumb_func_start sub_8011038
sub_8011038: @ 0x08011038
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	adds r0, #0x3c
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _0801109C
	ldr r4, _08011090 @ =gBackgroundTable
	ldr r1, [r5, #0x2c]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r4
	ldr r0, [r0]
	ldr r1, _08011094 @ =0x06001000
	bl Decompress
	ldr r0, _08011098 @ =gBg2Tm
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
_08011090: .4byte gBackgroundTable
_08011094: .4byte 0x06001000
_08011098: .4byte gBg2Tm
_0801109C:
	ldr r0, _080110DC @ =gBg2Tm
	movs r1, #0x80
	lsls r1, r1, #5
	ldr r3, [r5, #0x44]
	ldr r2, [r5, #0x2c]
	str r2, [sp]
	movs r2, #0
	bl sub_80B7980
_080110AE:
	movs r0, #4
	bl EnableBgSync
	bl EnablePalSync
	ldr r2, _080110E0 @ =gDispIo
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
_080110DC: .4byte gBg2Tm
_080110E0: .4byte gDispIo

	thumb_func_start sub_80110E4
sub_80110E4: @ 0x080110E4
	push {r4, lr}
	adds r4, r0, #0
	ldr r2, [r4, #0x30]
	ldr r0, [r4, #0x38]
	adds r2, r2, r0
	str r2, [r4, #0x30]
	asrs r2, r2, #4
	ldr r0, _0801112C @ =gDispIo
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
_0801112C: .4byte gDispIo

	thumb_func_start sub_8011130
sub_8011130: @ 0x08011130
	push {r4, r5, lr}
	adds r4, r0, #0
	bl LockBmDisplay
	bl LockMus
	movs r0, #3
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	ldr r0, _08011190 @ =0x06001000
	ldr r1, _08011194 @ =0x06008000
	movs r2, #0xa0
	lsls r2, r2, #5
	bl CpuFastSet
	ldr r0, _08011198 @ =gPal
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
	ldr r3, _080111A0 @ =gBg2Tm
	ldr r2, _080111A4 @ =gBg3Tm
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
_08011198: .4byte gPal
_0801119C: .4byte 0x001FFFFF
_080111A0: .4byte gBg2Tm
_080111A4: .4byte gBg3Tm

	thumb_func_start sub_80111A8
sub_80111A8: @ 0x080111A8
	push {lr}
	ldr r0, _080111E0 @ =gBg2Tm
	movs r1, #0
	bl TmFill
	movs r0, #4
	bl EnableBgSync
	ldr r3, _080111E4 @ =gDispIo
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
	bl InitBmBgLayers
	pop {r0}
	bx r0
	.align 2, 0
_080111E0: .4byte gBg2Tm
_080111E4: .4byte gDispIo

	thumb_func_start sub_80111E8
sub_80111E8: @ 0x080111E8
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	adds r4, r1, #0
	adds r5, r2, #0
	adds r1, r3, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	ldr r0, _08011210 @ =gUnk_08C011CC
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
_08011210: .4byte gUnk_08C011CC

	thumb_func_start sub_8011214
sub_8011214: @ 0x08011214
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
	bl sub_8010F48
	movs r0, #2
	b _08011240
_0801123E:
	movs r0, #0
_08011240:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_8011248
sub_8011248: @ 0x08011248
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
	bl sub_80111E8
	b _0801128C
_08011282:
	adds r0, r4, #0
	movs r1, #0
	adds r2, r6, #0
	bl sub_8010F48
_0801128C:
	movs r0, #0x61
	strb r0, [r5]
	movs r0, #2
_08011292:
	pop {r4, r5, r6}
	pop {r1}
	bx r1

	thumb_func_start sub_8011298
sub_8011298: @ 0x08011298
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	ldr r7, _0801134C @ =gDispIo
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
	ldr r0, _08011358 @ =ProcScr_Event
	bl Proc_Find
	str r0, [r5, #0x40]
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0801134C: .4byte gDispIo
_08011350: .4byte 0x0000FFE0
_08011354: .4byte 0x0000E0FF
_08011358: .4byte ProcScr_Event

	thumb_func_start sub_801135C
sub_801135C: @ 0x0801135C
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r0, _080113E8 @ =0x06008000
	ldr r1, _080113EC @ =0x06001000
	movs r2, #0xa0
	lsls r2, r2, #5
	bl CpuFastSet
	ldr r0, _080113F0 @ =gPal + 0x100
	ldr r2, _080113F4 @ =0xFFFFFF00
	adds r1, r0, r2
	ldr r2, [r4, #0x44]
	lsls r2, r2, #3
	ldr r3, _080113F8 @ =0x001FFFFF
	ands r2, r3
	bl CpuFastSet
	ldr r5, _080113FC @ =0x00008080
	adds r3, r5, #0
	ldr r2, _08011400 @ =gBg3Tm
	ldr r1, _08011404 @ =gBg2Tm
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
	ldr r3, _08011408 @ =gDispIo
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
_080113F0: .4byte gPal + 0x100
_080113F4: .4byte 0xFFFFFF00
_080113F8: .4byte 0x001FFFFF
_080113FC: .4byte 0x00008080
_08011400: .4byte gBg3Tm
_08011404: .4byte gBg2Tm
_08011408: .4byte gDispIo

	thumb_func_start sub_801140C
sub_801140C: @ 0x0801140C
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r4, _08011454 @ =gPlaySt
	movs r0, #0xe
	ldrsb r0, [r4, r0]
	bl UnpackChapterMapGraphics
	ldrb r0, [r4, #0x15]
	bl sub_802D8E4
	bl RenderMap
	bl RefreshUnitSprites
	bl ApplyUnitSpritePalettes
	ldr r0, [r5, #0x34]
	movs r1, #0x80
	lsls r1, r1, #2
	ands r0, r1
	cmp r0, #0
	beq _0801143C
	bl sub_802516C
_0801143C:
	bl sub_8025A0C
	bl UnlockBmDisplay
	bl ReleaseMus
	movs r0, #8
	bl EnableBgSync
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08011454: .4byte gPlaySt

	thumb_func_start sub_8011458
sub_8011458: @ 0x08011458
	push {r4, lr}
	adds r4, r0, #0
	ldr r2, [r4, #0x30]
	ldr r0, [r4, #0x38]
	adds r2, r2, r0
	str r2, [r4, #0x30]
	asrs r2, r2, #4
	ldr r0, _080114A0 @ =gDispIo
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
_080114A0: .4byte gDispIo

	thumb_func_start sub_80114A4
sub_80114A4: @ 0x080114A4
	push {lr}
	ldr r0, _080114E4 @ =gBg2Tm
	movs r1, #0
	bl TmFill
	movs r0, #4
	bl EnableBgSync
	ldr r3, _080114E8 @ =gDispIo
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
	bl InitBmBgLayers
	bl ApplySystemGraphics
	bl InitSystemTextFont
	pop {r0}
	bx r0
	.align 2, 0
_080114E4: .4byte gBg2Tm
_080114E8: .4byte gDispIo

	thumb_func_start sub_80114EC
sub_80114EC: @ 0x080114EC
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08011504 @ =gUnk_08C01224
	bl Proc_StartBlocking
	str r4, [r0, #0x34]
	movs r1, #0xff
	ands r1, r4
	str r1, [r0, #0x38]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08011504: .4byte gUnk_08C01224

	thumb_func_start sub_8011508
sub_8011508: @ 0x08011508
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
	bl sub_802E834
	bl UnlockBmDisplay
	bl ReleaseMus
_08011544:
	movs r0, #0
	b _08011560
_08011548:
	adds r4, r5, #0
	adds r4, #0x4c
	adds r0, r2, #0
	adds r1, r5, #0
	bl sub_80114EC
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

	thumb_func_start sub_8011568
sub_8011568: @ 0x08011568
	push {r4, r5, r6, lr}
	sub sp, #8
	adds r6, r0, #0
	ldr r3, _08011604 @ =gDispIo
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
	ldr r0, _08011610 @ =gUnk_08198D98
	ldr r1, _08011614 @ =0x06001000
	bl Decompress
	ldr r4, _08011618 @ =gUnk_08199250
	movs r1, #0xf0
	lsls r1, r1, #1
	adds r0, r4, #0
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r0, _0801161C @ =gBg2Tm
	ldr r1, _08011620 @ =gUnk_08199290
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
	bl StartMixPalette
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
_08011604: .4byte gDispIo
_08011608: .4byte 0x0000FFE0
_0801160C: .4byte 0x0000E0FF
_08011610: .4byte gUnk_08198D98
_08011614: .4byte 0x06001000
_08011618: .4byte gUnk_08199250
_0801161C: .4byte gBg2Tm
_08011620: .4byte gUnk_08199290
_08011624: .4byte 0x0000F080

	thumb_func_start sub_8011628
sub_8011628: @ 0x08011628
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x30]
	adds r0, #1
	str r0, [r4, #0x30]
	asrs r5, r0, #1
	ldr r3, _080116A4 @ =gDispIo
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
_080116A4: .4byte gDispIo

	thumb_func_start sub_80116A8
sub_80116A8: @ 0x080116A8
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

	thumb_func_start sub_80116F0
sub_80116F0: @ 0x080116F0
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x30]
	adds r0, #1
	str r0, [r4, #0x30]
	asrs r5, r0, #3
	ldr r3, _08011768 @ =gDispIo
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
_08011768: .4byte gDispIo

	thumb_func_start sub_801176C
sub_801176C: @ 0x0801176C
	push {lr}
	ldr r0, _080117A4 @ =gBg2Tm
	movs r1, #0
	bl TmFill
	movs r0, #4
	bl EnableBgSync
	ldr r2, _080117A8 @ =gDispIo
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
_080117A4: .4byte gBg2Tm
_080117A8: .4byte gDispIo

	thumb_func_start sub_80117AC
sub_80117AC: @ 0x080117AC
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
	ldr r0, _080117D0 @ =gUnk_08C0127C
	bl Proc_StartBlocking
	str r4, [r0, #0x2c]
	movs r0, #2
	b _080117D6
	.align 2, 0
_080117D0: .4byte gUnk_08C0127C
_080117D4:
	movs r0, #0
_080117D6:
	pop {r4}
	pop {r1}
	bx r1

	thumb_func_start sub_80117DC
sub_80117DC: @ 0x080117DC
	push {r4, r5, r6, lr}
	sub sp, #0x14
	adds r5, r0, #0
	ldr r6, _08011894 @ =gDispIo
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
	bl InitScanlineEffect
	movs r0, #0
	movs r1, #0
	bl sub_80780E0
	movs r0, #0
	bl SetOnHBlankA
	ldr r0, _080118A0 @ =sub_8078098
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
	ldr r0, _080118A4 @ =gUnk_08DBA258
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
	bl StartBmBgfx
	add sp, #0x14
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08011894: .4byte gDispIo
_08011898: .4byte 0x0000FFE0
_0801189C: .4byte 0x0000E0FF
_080118A0: .4byte sub_8078098
_080118A4: .4byte gUnk_08DBA258

	thumb_func_start sub_80118A8
sub_80118A8: @ 0x080118A8
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r0, [r5, #0x30]
	adds r0, #1
	str r0, [r5, #0x30]
	asrs r4, r0, #1
	ldr r2, _080118D8 @ =gDispIo
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
_080118D8: .4byte gDispIo
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

	thumb_func_start sub_8011900
sub_8011900: @ 0x08011900
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r0, [r5, #0x30]
	adds r0, #1
	str r0, [r5, #0x30]
	asrs r4, r0, #1
	ldr r3, _08011950 @ =gDispIo
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
_08011950: .4byte gDispIo

	thumb_func_start sub_8011954
sub_8011954: @ 0x08011954
	push {lr}
	ldr r0, _080119BC @ =gBg2Tm
	movs r1, #0
	bl TmFill
	movs r0, #4
	bl EnableBgSync
	movs r0, #0
	bl SetOnHBlankA
	ldr r3, _080119C0 @ =gDispIo
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
_080119BC: .4byte gBg2Tm
_080119C0: .4byte gDispIo

	thumb_func_start sub_80119C4
sub_80119C4: @ 0x080119C4
	push {lr}
	adds r1, r0, #0
	adds r2, r1, #0
	adds r2, #0x5e
	movs r0, #4
	ldrh r2, [r2]
	ands r0, r2
	cmp r0, #0
	bne _080119E4
	ldr r0, _080119E0 @ =gUnk_08C012BC
	bl Proc_StartBlocking
	movs r0, #2
	b _080119E6
	.align 2, 0
_080119E0: .4byte gUnk_08C012BC
_080119E4:
	movs r0, #0
_080119E6:
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start EventE1
EventE1: @ 0x080119EC
	push {lr}
	adds r0, #0x5e
	movs r1, #4
	ldrh r0, [r0]
	ands r1, r0
	cmp r1, #0
	bne _08011A10
	ldr r0, _08011A0C @ =gUnk_08C012BC
	bl Proc_Find
	movs r1, #0
	bl Proc_Goto
	movs r0, #2
	b _08011A1C
	.align 2, 0
_08011A0C: .4byte gUnk_08C012BC
_08011A10:
	ldr r0, _08011A20 @ =gUnk_08C012BC
	bl Proc_Find
	bl Proc_End
	movs r0, #0
_08011A1C:
	pop {r1}
	bx r1
	.align 2, 0
_08011A20: .4byte gUnk_08C012BC
