	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_8082DB8
sub_8082DB8: @ 0x08082DB8
	push {lr}
	adds r2, r0, #0
	movs r0, #8
	ands r0, r2
	cmp r0, #0
	beq _08082DD4
	ldr r0, _08082DD0 @ =gUnk_08408CC8
	lsls r1, r1, #5
	movs r2, #0x20
	bl ApplyPaletteExt
	b _08082E20
	.align 2, 0
_08082DD0: .4byte gUnk_08408CC8
_08082DD4:
	movs r0, #1
	ands r0, r2
	ldr r3, _08082E24 @ =gUnk_08404ED0
	cmp r0, #0
	beq _08082DE0
	ldr r3, _08082E28 @ =gUnk_08404D90
_08082DE0:
	movs r0, #0x10
	ands r0, r2
	cmp r0, #0
	beq _08082DEA
	adds r3, #0x40
_08082DEA:
	movs r0, #0x20
	ands r0, r2
	cmp r0, #0
	beq _08082DF4
	adds r3, #0x80
_08082DF4:
	movs r0, #0x40
	ands r0, r2
	cmp r0, #0
	beq _08082DFE
	adds r3, #0xc0
_08082DFE:
	movs r0, #0x80
	ands r0, r2
	cmp r0, #0
	beq _08082E0C
	movs r0, #0x80
	lsls r0, r0, #1
	adds r3, r3, r0
_08082E0C:
	movs r0, #2
	ands r0, r2
	cmp r0, #0
	beq _08082E16
	adds r3, #0x20
_08082E16:
	lsls r1, r1, #5
	adds r0, r3, #0
	movs r2, #0x20
	bl ApplyPaletteExt
_08082E20:
	pop {r0}
	bx r0
	.align 2, 0
_08082E24: .4byte gUnk_08404ED0
_08082E28: .4byte gUnk_08404D90

	thumb_func_start sub_8082E2C
sub_8082E2C: @ 0x08082E2C
	push {r4, lr}
	adds r4, r0, #0
	adds r3, r1, #0
	cmp r3, #0x4d
	bls _08082E38
	movs r3, #0x4a
_08082E38:
	ldr r2, _08082E60 @ =0x0203E670
	ldr r0, _08082E64 @ =0x000003FF
	adds r1, r0, #0
	adds r0, r4, #0
	ands r0, r1
	strh r0, [r2, #2]
	ldr r1, _08082E68 @ =gUnk_08D8AE00
	lsls r0, r3, #2
	adds r0, r0, r1
	ldr r0, [r0]
	lsls r1, r4, #5
	movs r2, #0xc0
	lsls r2, r2, #0x13
	adds r1, r1, r2
	bl Decompress
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08082E60: .4byte 0x0203E670
_08082E64: .4byte 0x000003FF
_08082E68: .4byte gUnk_08D8AE00

	thumb_func_start sub_8082E6C
sub_8082E6C: @ 0x08082E6C
	push {lr}
	adds r1, r0, #0
	ldr r3, _08082E90 @ =0x0203E670
	ldr r0, _08082E94 @ =0x000003FF
	adds r2, r0, #0
	adds r0, r1, #0
	ands r0, r2
	strh r0, [r3]
	ldr r0, _08082E98 @ =gUnk_0840828C
	lsls r1, r1, #5
	movs r2, #0xc0
	lsls r2, r2, #0x13
	adds r1, r1, r2
	bl Decompress
	pop {r0}
	bx r0
	.align 2, 0
_08082E90: .4byte 0x0203E670
_08082E94: .4byte 0x000003FF
_08082E98: .4byte gUnk_0840828C

	thumb_func_start sub_8082E9C
sub_8082E9C: @ 0x08082E9C
	push {lr}
	adds r1, r0, #0
	ldr r3, _08082EC0 @ =0x0203E670
	ldr r0, _08082EC4 @ =0x000003FF
	adds r2, r0, #0
	adds r0, r1, #0
	ands r0, r2
	strh r0, [r3]
	ldr r0, _08082EC8 @ =gUnk_084086C4
	lsls r1, r1, #5
	movs r2, #0xc0
	lsls r2, r2, #0x13
	adds r1, r1, r2
	bl Decompress
	pop {r0}
	bx r0
	.align 2, 0
_08082EC0: .4byte 0x0203E670
_08082EC4: .4byte 0x000003FF
_08082EC8: .4byte gUnk_084086C4

	thumb_func_start sub_8082ECC
sub_8082ECC: @ 0x08082ECC
	adds r2, r0, #0
	ldr r0, _08082EE8 @ =0x0203E670
	lsls r1, r1, #0xc
	ldrh r0, [r0, #2]
	adds r0, r0, r1
	movs r1, #0x3f
_08082ED8:
	strh r0, [r2]
	adds r0, #1
	adds r2, #2
	subs r1, #1
	cmp r1, #0
	bge _08082ED8
	bx lr
	.align 2, 0
_08082EE8: .4byte 0x0203E670

	thumb_func_start sub_8082EEC
sub_8082EEC: @ 0x08082EEC
	adds r2, r0, #0
	ldr r0, _08082F08 @ =0x0203E670
	lsls r1, r1, #0xc
	ldrh r0, [r0]
	adds r0, r0, r1
	movs r1, #0x7f
_08082EF8:
	strh r0, [r2]
	adds r0, #1
	adds r2, #2
	subs r1, #1
	cmp r1, #0
	bge _08082EF8
	bx lr
	.align 2, 0
_08082F08: .4byte 0x0203E670

	thumb_func_start sub_8082F0C
sub_8082F0C: @ 0x08082F0C
	push {lr}
	adds r2, r1, #0
	ldr r1, _08082F28 @ =gUnk_08408BD4
	ldr r3, _08082F2C @ =0x0203E670
	lsls r2, r2, #0xc
	ldrh r3, [r3]
	adds r2, r3, r2
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	bl TmApplyTsa_thm
	pop {r0}
	bx r0
	.align 2, 0
_08082F28: .4byte gUnk_08408BD4
_08082F2C: .4byte 0x0203E670

	thumb_func_start sub_8082F30
sub_8082F30: @ 0x08082F30
	push {lr}
	adds r1, r0, #0
	cmp r1, #0
	bne _08082F3C
	movs r0, #0x4a
	b _08082F6E
_08082F3C:
	movs r2, #0xe
	ldrsb r2, [r1, r2]
	cmp r2, #0x30
	bne _08082F48
	movs r0, #0x4c
	b _08082F6E
_08082F48:
	movs r0, #0x20
	ldrb r3, [r1, #0x14]
	ands r0, r3
	cmp r0, #0
	beq _08082F56
	movs r0, #0x4b
	b _08082F6E
_08082F56:
	ldrb r1, [r1, #0x1b]
	cmp r1, #3
	beq _08082F66
	adds r0, r2, #0
	bl GetChapterInfo
	ldrb r0, [r0, #0xe]
	b _08082F6E
_08082F66:
	adds r0, r2, #0
	bl GetChapterInfo
	ldrb r0, [r0, #0xf]
_08082F6E:
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start LoadHelpBoxGfx
LoadHelpBoxGfx: @ 0x08082F74
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	adds r5, r1, #0
	cmp r7, #0
	bne _08082F80
	ldr r7, _08082FEC @ =0x06013000
_08082F80:
	cmp r5, #0
	bge _08082F86
	movs r5, #5
_08082F86:
	movs r4, #0xf
	adds r0, r4, #0
	ands r0, r5
	adds r5, r0, #0
	adds r5, #0x10
	ldr r0, _08082FF0 @ =gUnk_084041FC
	adds r1, r7, #0
	bl Decompress
	ldr r0, _08082FF4 @ =gUnk_0841BCA8
	movs r2, #0x80
	lsls r2, r2, #4
	adds r1, r7, r2
	bl Decompress
	ldr r6, _08082FF8 @ =0x0203E678
	adds r0, r6, #0
	adds r1, r7, #0
	adds r2, r5, #0
	bl InitSpriteTextFont
	adds r0, r6, #0
	adds r0, #0x18
	bl InitSpriteText
	adds r0, r6, #0
	adds r0, #0x20
	bl InitSpriteText
	adds r0, r6, #0
	adds r0, #0x28
	bl InitSpriteText
	movs r0, #0
	bl SetTextFont
	ldr r0, _08082FFC @ =gUnk_08190208
	lsls r1, r5, #5
	movs r2, #0x20
	bl ApplyPaletteExt
	lsls r0, r7, #0x11
	lsrs r0, r0, #0x16
	ands r5, r4
	lsls r1, r5, #0xc
	adds r0, r0, r1
	strh r0, [r6, #0x30]
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08082FEC: .4byte 0x06013000
_08082FF0: .4byte gUnk_084041FC
_08082FF4: .4byte gUnk_0841BCA8
_08082FF8: .4byte 0x0203E678
_08082FFC: .4byte gUnk_08190208

	thumb_func_start sub_8083000
sub_8083000: @ 0x08083000
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	adds r5, r1, #0
	cmp r7, #0
	bne _0808300C
	ldr r7, _08083074 @ =0x06013000
_0808300C:
	cmp r5, #0
	bge _08083012
	movs r5, #5
_08083012:
	movs r4, #0xf
	adds r0, r4, #0
	ands r0, r5
	adds r5, r0, #0
	adds r5, #0x10
	ldr r0, _08083078 @ =gUnk_084041FC
	adds r1, r7, #0
	bl Decompress
	ldr r0, _0808307C @ =gUnk_0841BCA8
	movs r2, #0x80
	lsls r2, r2, #4
	adds r1, r7, r2
	bl Decompress
	ldr r6, _08083080 @ =0x0203E678
	adds r0, r6, #0
	adds r1, r7, #0
	adds r2, r5, #0
	bl InitSpriteTextFont
	adds r0, r6, #0
	adds r0, #0x18
	bl InitSpriteText
	adds r0, r6, #0
	adds r0, #0x20
	bl InitSpriteText
	adds r1, r6, #0
	adds r1, #0x2c
	movs r0, #0
	strb r0, [r1]
	bl SetTextFont
	ldr r0, _08083084 @ =gUnk_08190208
	lsls r1, r5, #5
	movs r2, #0x20
	bl ApplyPaletteExt
	lsls r0, r7, #0x11
	lsrs r0, r0, #0x16
	ands r5, r4
	lsls r1, r5, #0xc
	adds r0, r0, r1
	strh r0, [r6, #0x30]
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08083074: .4byte 0x06013000
_08083078: .4byte gUnk_084041FC
_0808307C: .4byte gUnk_0841BCA8
_08083080: .4byte 0x0203E678
_08083084: .4byte gUnk_08190208

	thumb_func_start PutSpriteTalkBox
PutSpriteTalkBox: @ 0x08083088
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x1c
	mov sl, r0
	mov sb, r1
	adds r7, r2, #0
	mov r8, r3
	cmp r7, #0x1f
	bgt _080830A2
	movs r7, #0x20
_080830A2:
	cmp r7, #0xc0
	ble _080830A8
	movs r7, #0xc0
_080830A8:
	mov r0, r8
	cmp r0, #0xf
	bgt _080830B2
	movs r1, #0x10
	mov r8, r1
_080830B2:
	mov r3, r8
	cmp r3, #0x30
	ble _080830BC
	movs r0, #0x30
	mov r8, r0
_080830BC:
	adds r0, r7, #0
	adds r0, #0x1f
	cmp r0, #0
	bge _080830C6
	adds r0, #0x1f
_080830C6:
	asrs r0, r0, #5
	mov r1, r8
	adds r1, #0xf
	cmp r1, #0
	bge _080830D2
	adds r1, #0xf
_080830D2:
	asrs r1, r1, #4
	str r1, [sp, #4]
	subs r6, r0, #1
	str r6, [sp, #0x18]
	mov r1, sb
	subs r1, #8
	str r1, [sp, #0x14]
	mov r3, sb
	add r3, r8
	str r3, [sp, #0xc]
	mov r0, sl
	subs r0, #8
	str r0, [sp, #0x10]
	mov r1, sl
	adds r1, r1, r7
	str r1, [sp, #8]
	cmp r6, #0
	blt _0808313E
_080830F6:
	ldr r5, [sp, #4]
	subs r4, r6, #1
	cmp r5, #0
	blt _08083138
_080830FE:
	adds r0, r6, #1
	lsls r1, r0, #5
	cmp r1, r7
	ble _08083108
	adds r1, r7, #0
_08083108:
	subs r1, #0x20
	adds r0, r5, #1
	lsls r0, r0, #4
	cmp r0, r8
	ble _08083114
	mov r0, r8
_08083114:
	subs r0, #0x10
	add r1, sl
	mov r3, sb
	adds r2, r3, r0
	ldr r3, _0808323C @ =0x0203E678
	lsls r0, r6, #2
	ldrh r3, [r3, #0x30]
	adds r0, r3, r0
	lsls r3, r5, #6
	adds r0, r0, r3
	str r0, [sp]
	movs r0, #0
	ldr r3, _08083240 @ =Sprite_32x16
	bl PutSprite
	subs r5, #1
	cmp r5, #0
	bge _080830FE
_08083138:
	adds r6, r4, #0
	cmp r6, #0
	bge _080830F6
_0808313E:
	ldr r6, [sp, #0x18]
	cmp r6, #0
	blt _08083180
	ldr r5, _0808323C @ =0x0203E678
_08083146:
	adds r0, r6, #1
	lsls r1, r0, #5
	cmp r1, r7
	ble _08083150
	adds r1, r7, #0
_08083150:
	subs r1, #0x20
	mov r0, sl
	adds r4, r0, r1
	ldrh r0, [r5, #0x30]
	adds r0, #0x1b
	str r0, [sp]
	movs r0, #0
	adds r1, r4, #0
	ldr r2, [sp, #0x14]
	ldr r3, _08083244 @ =Sprite_32x8
	bl PutSprite
	ldrh r0, [r5, #0x30]
	adds r0, #0x1b
	str r0, [sp]
	movs r0, #0
	adds r1, r4, #0
	ldr r2, [sp, #0xc]
	ldr r3, _08083248 @ =Sprite_32x8_VFlipped
	bl PutSprite
	subs r6, #1
	cmp r6, #0
	bge _08083146
_08083180:
	ldr r5, [sp, #4]
	cmp r5, #0
	blt _080831C2
	ldr r6, _0808323C @ =0x0203E678
_08083188:
	adds r0, r5, #1
	lsls r0, r0, #4
	cmp r0, r8
	ble _08083192
	mov r0, r8
_08083192:
	subs r0, #0x10
	mov r1, sb
	adds r4, r1, r0
	ldrh r0, [r6, #0x30]
	adds r0, #0x1f
	str r0, [sp]
	movs r0, #0
	ldr r1, [sp, #0x10]
	adds r2, r4, #0
	ldr r3, _0808324C @ =Sprite_8x16
	bl PutSprite
	ldrh r0, [r6, #0x30]
	adds r0, #0x1f
	str r0, [sp]
	movs r0, #0
	ldr r1, [sp, #8]
	adds r2, r4, #0
	ldr r3, _08083250 @ =Sprite_8x16_HFlipped
	bl PutSprite
	subs r5, #1
	cmp r5, #0
	bge _08083188
_080831C2:
	ldr r3, _08083254 @ =Sprite_8x8
	ldr r4, _0808323C @ =0x0203E678
	ldrh r0, [r4, #0x30]
	adds r0, #0x3e
	str r0, [sp]
	movs r0, #0
	ldr r1, [sp, #0x10]
	ldr r2, [sp, #0x14]
	bl PutSprite
	ldr r3, _08083258 @ =Sprite_8x8_HFlipped
	ldrh r0, [r4, #0x30]
	adds r0, #0x3e
	str r0, [sp]
	movs r0, #0
	ldr r1, [sp, #8]
	ldr r2, [sp, #0x14]
	bl PutSprite
	ldr r3, _0808325C @ =Sprite_8x8_VFlipped
	ldrh r0, [r4, #0x30]
	adds r0, #0x3e
	str r0, [sp]
	movs r0, #0
	ldr r1, [sp, #0x10]
	ldr r2, [sp, #0xc]
	bl PutSprite
	ldr r3, _08083260 @ =Sprite_8x8_HFlipped_VFlipped
	ldrh r0, [r4, #0x30]
	adds r0, #0x3e
	str r0, [sp]
	movs r0, #0
	ldr r1, [sp, #8]
	ldr r2, [sp, #0xc]
	bl PutSprite
	ldr r0, [sp, #0x3c]
	cmp r0, #0
	bne _0808322A
	mov r2, sb
	subs r2, #0xb
	ldr r3, _08083240 @ =Sprite_32x16
	ldr r0, _08083264 @ =0x000003FF
	ldrh r4, [r4, #0x30]
	ands r0, r4
	adds r0, #0x5c
	str r0, [sp]
	movs r0, #0
	mov r1, sl
	bl PutSprite
_0808322A:
	add sp, #0x1c
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0808323C: .4byte 0x0203E678
_08083240: .4byte Sprite_32x16
_08083244: .4byte Sprite_32x8
_08083248: .4byte Sprite_32x8_VFlipped
_0808324C: .4byte Sprite_8x16
_08083250: .4byte Sprite_8x16_HFlipped
_08083254: .4byte Sprite_8x8
_08083258: .4byte Sprite_8x8_HFlipped
_0808325C: .4byte Sprite_8x8_VFlipped
_08083260: .4byte Sprite_8x8_HFlipped_VFlipped
_08083264: .4byte 0x000003FF

	thumb_func_start sub_8083268
sub_8083268: @ 0x08083268
	push {r4, lr}
	ldr r4, _080832C8 @ =0x0203E690
	bl GetItemType
	bl sub_8016E60
	adds r3, r0, #0
	adds r0, r4, #0
	movs r1, #0
	movs r2, #8
	bl Text_InsertDrawString
	ldr r3, _080832CC @ =gUnk_0841D06C
	adds r0, r4, #0
	movs r1, #0x24
	movs r2, #8
	bl Text_InsertDrawString
	ldr r3, _080832D0 @ =gUnk_0841D074
	adds r0, r4, #0
	movs r1, #0x60
	movs r2, #8
	bl Text_InsertDrawString
	adds r4, #8
	ldr r3, _080832D4 @ =gUnk_0841D07C
	adds r0, r4, #0
	movs r1, #0
	movs r2, #8
	bl Text_InsertDrawString
	ldr r3, _080832D8 @ =gUnk_0841D084
	adds r0, r4, #0
	movs r1, #0x30
	movs r2, #8
	bl Text_InsertDrawString
	ldr r3, _080832DC @ =gUnk_0841D08C
	adds r0, r4, #0
	movs r1, #0x60
	movs r2, #8
	bl Text_InsertDrawString
	movs r0, #2
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080832C8: .4byte 0x0203E690
_080832CC: .4byte gUnk_0841D06C
_080832D0: .4byte gUnk_0841D074
_080832D4: .4byte gUnk_0841D07C
_080832D8: .4byte gUnk_0841D084
_080832DC: .4byte gUnk_0841D08C

	thumb_func_start sub_80832E0
sub_80832E0: @ 0x080832E0
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r4, _08083358 @ =0x0203E690
	bl sub_8016DD8
	adds r3, r0, #0
	adds r0, r4, #0
	movs r1, #0xc
	movs r2, #7
	bl Text_InsertDrawString
	adds r0, r5, #0
	bl GetItemDisplayRangeString
	adds r3, r0, #0
	adds r0, r4, #0
	movs r1, #0x38
	movs r2, #7
	bl Text_InsertDrawString
	adds r0, r5, #0
	bl GetItemWeight
	adds r3, r0, #0
	adds r0, r4, #0
	movs r1, #0x80
	movs r2, #7
	bl Text_InsertDrawNumberOrBlank
	adds r4, #8
	adds r0, r5, #0
	bl GetItemMight
	adds r3, r0, #0
	adds r0, r4, #0
	movs r1, #0x20
	movs r2, #7
	bl Text_InsertDrawNumberOrBlank
	adds r0, r5, #0
	bl GetItemHit
	adds r3, r0, #0
	adds r0, r4, #0
	movs r1, #0x50
	movs r2, #7
	bl Text_InsertDrawNumberOrBlank
	adds r0, r5, #0
	bl GetItemCrit
	adds r3, r0, #0
	adds r0, r4, #0
	movs r1, #0x80
	movs r2, #7
	bl Text_InsertDrawNumberOrBlank
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08083358: .4byte 0x0203E690

	thumb_func_start sub_808335C
sub_808335C: @ 0x0808335C
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r4, _080833A8 @ =0x0203E690
	ldr r3, _080833AC @ =gUnk_0841D094
	adds r0, r4, #0
	movs r1, #0
	movs r2, #8
	bl Text_InsertDrawString
	adds r0, r5, #0
	bl sub_8016DD8
	adds r3, r0, #0
	adds r0, r4, #0
	movs r1, #0xc
	movs r2, #7
	bl Text_InsertDrawString
	ldr r3, _080833B0 @ =gUnk_0841D06C
	adds r0, r4, #0
	movs r1, #0x24
	movs r2, #8
	bl Text_InsertDrawString
	adds r0, r5, #0
	bl GetItemDisplayRangeString
	adds r3, r0, #0
	adds r0, r4, #0
	movs r1, #0x38
	movs r2, #7
	bl Text_InsertDrawString
	movs r0, #1
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_080833A8: .4byte 0x0203E690
_080833AC: .4byte gUnk_0841D094
_080833B0: .4byte gUnk_0841D06C

	thumb_func_start sub_80833B4
sub_80833B4: @ 0x080833B4
	push {r4, lr}
	ldr r1, _080833EC @ =gPlaySt
	adds r1, #0x2b
	movs r0, #1
	ldrb r1, [r1]
	ands r0, r1
	cmp r0, #0
	beq _08083400
	ldr r4, _080833F0 @ =0x0203E690
	ldr r3, _080833F4 @ =gUnk_0841D098
	adds r0, r4, #0
	movs r1, #0
	movs r2, #8
	bl Text_InsertDrawString
	ldr r3, _080833F8 @ =gUnk_0841D0A0
	adds r0, r4, #0
	movs r1, #0x28
	movs r2, #8
	bl Text_InsertDrawString
	ldr r3, _080833FC @ =gUnk_0841D0A8
	adds r0, r4, #0
	movs r1, #0x50
	movs r2, #8
	bl Text_InsertDrawString
	b _0808340C
	.align 2, 0
_080833EC: .4byte gPlaySt
_080833F0: .4byte 0x0203E690
_080833F4: .4byte gUnk_0841D098
_080833F8: .4byte gUnk_0841D0A0
_080833FC: .4byte gUnk_0841D0A8
_08083400:
	ldr r0, _08083414 @ =0x0203E690
	ldr r3, _08083418 @ =gUnk_0841D0B0
	movs r1, #0
	movs r2, #7
	bl Text_InsertDrawString
_0808340C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08083414: .4byte 0x0203E690
_08083418: .4byte gUnk_0841D0B0

	thumb_func_start sub_808341C
sub_808341C: @ 0x0808341C
	push {r4, r5, r6, r7, lr}
	ldr r7, _08083464 @ =gPlaySt
	adds r5, r7, #0
	adds r5, #0x2b
	movs r0, #1
	ldrb r1, [r5]
	ands r0, r1
	cmp r0, #0
	beq _080834C8
	bl sub_802EBB0
	adds r6, r0, #0
	ldrb r0, [r6]
	cmp r0, #0
	bne _08083474
	ldr r4, _08083468 @ =0x0203E690
	ldr r5, _0808346C @ =gUnk_0841D0BC
	adds r0, r4, #0
	movs r1, #0x14
	movs r2, #7
	adds r3, r5, #0
	bl Text_InsertDrawString
	adds r0, r4, #0
	movs r1, #0x3c
	movs r2, #7
	adds r3, r5, #0
	bl Text_InsertDrawString
	ldr r3, _08083470 @ =gUnk_0841D0C0
	adds r0, r4, #0
	movs r1, #0x64
	movs r2, #7
	bl Text_InsertDrawString
	b _080834C8
	.align 2, 0
_08083464: .4byte gPlaySt
_08083468: .4byte 0x0203E690
_0808346C: .4byte gUnk_0841D0BC
_08083470: .4byte gUnk_0841D0C0
_08083474:
	ldr r4, _080834D0 @ =0x0203E690
	ldr r2, _080834D4 @ =Unk_081C8FCC
	ldrb r1, [r5]
	lsls r0, r1, #0x1c
	lsrs r0, r0, #0x1d
	lsls r0, r0, #2
	lsrs r1, r1, #4
	lsls r1, r1, #4
	adds r0, r0, r1
	adds r0, r0, r2
	ldr r0, [r0]
	bl sub_80A7AD8
	bl DecodeMsg
	adds r3, r0, #0
	adds r0, r4, #0
	movs r1, #0x14
	movs r2, #7
	bl Text_InsertDrawString
	adds r0, r7, #0
	adds r0, #0x2c
	ldrb r0, [r0]
	lsls r0, r0, #0x1f
	lsrs r0, r0, #0x1f
	bl sub_80A7AC8
	bl DecodeMsg
	adds r3, r0, #0
	adds r0, r4, #0
	movs r1, #0x3c
	movs r2, #7
	bl Text_InsertDrawString
	adds r0, r4, #0
	movs r1, #0x64
	movs r2, #7
	adds r3, r6, #0
	bl Text_InsertDrawString
_080834C8:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080834D0: .4byte 0x0203E690
_080834D4: .4byte Unk_081C8FCC

	thumb_func_start sub_80834D8
sub_80834D8: @ 0x080834D8
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	adds r1, r4, #0
	adds r1, #0x5e
	ldrh r0, [r1]
	subs r0, #1
	strh r0, [r1]
	lsls r0, r0, #0x10
	cmp r0, #0
	bgt _08083566
	adds r0, r4, #0
	adds r0, #0x60
	ldrh r0, [r0]
	strh r0, [r1]
	ldr r0, [r4, #0x30]
	bl SetTextFont
	movs r6, #0
	adds r0, r4, #0
	adds r0, #0x62
	movs r2, #0
	ldrsh r1, [r0, r2]
	adds r7, r0, #0
	cmp r6, r1
	bge _08083560
	adds r5, r4, #0
	adds r5, #0x5c
_0808350E:
	ldr r0, [r4, #0x2c]
	ldrb r2, [r0]
	adds r3, r0, #0
	cmp r2, #1
	beq _08083530
	cmp r2, #1
	bgt _08083522
	cmp r2, #0
	beq _08083528
	b _08083540
_08083522:
	cmp r2, #4
	beq _0808353C
	b _08083540
_08083528:
	adds r0, r4, #0
	bl Proc_Break
	b _08083560
_08083530:
	adds r0, r3, #1
	str r0, [r4, #0x2c]
	ldrh r0, [r5]
	adds r0, #1
	strh r0, [r5]
	b _08083556
_0808353C:
	adds r0, r3, #1
	b _08083554
_08083540:
	movs r0, #0
	ldrsh r1, [r5, r0]
	lsls r1, r1, #2
	adds r0, r4, #0
	adds r0, #0x34
	adds r0, r0, r1
	ldr r0, [r0]
	adds r1, r3, #0
	bl Text_DrawCharacter
_08083554:
	str r0, [r4, #0x2c]
_08083556:
	adds r6, #1
	movs r1, #0
	ldrsh r0, [r7, r1]
	cmp r6, r0
	blt _0808350E
_08083560:
	movs r0, #0
	bl SetTextFont
_08083566:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_808356C
sub_808356C: @ 0x0808356C
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x30]
	bl SetTextFont
	movs r6, #0
_08083578:
	lsls r1, r6, #2
	adds r0, r4, #0
	adds r0, #0x34
	adds r0, r0, r1
	ldr r5, [r0]
	ldrb r1, [r5, #4]
	lsls r0, r1, #3
	ldr r1, [r4, #0x2c]
	bl GetStringTextCenteredPos
	adds r1, r0, #0
	adds r0, r5, #0
	bl Text_SetCursor
_08083594:
	ldr r0, [r4, #0x2c]
	ldrb r1, [r0]
	cmp r1, #1
	beq _080835B4
	cmp r1, #1
	bgt _080835A6
	cmp r1, #0
	beq _080835CC
	b _080835C0
_080835A6:
	cmp r1, #5
	bgt _080835C0
	cmp r1, #4
	blt _080835C0
	adds r0, #1
	str r0, [r4, #0x2c]
	b _08083594
_080835B4:
	adds r0, #1
	str r0, [r4, #0x2c]
	adds r6, #1
	cmp r6, #5
	ble _08083578
	b _080835CC
_080835C0:
	ldr r1, [r4, #0x2c]
	adds r0, r5, #0
	bl Text_DrawCharacter
	str r0, [r4, #0x2c]
	b _08083594
_080835CC:
	ldr r0, [r4, #0x30]
	bl SetTextFont
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	thumb_func_start sub_80835D8
sub_80835D8: @ 0x080835D8
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r4, [r5, #0x58]
	ldr r0, _08083600 @ =0x0203E678
	bl SetTextFont
	movs r0, #0
	bl SetTextFontGlyphs
	adds r0, r4, #0
	bl GetHelpBoxItemInfoKind
	adds r1, r0, #0
	cmp r1, #1
	beq _08083616
	cmp r1, #1
	bgt _08083604
	cmp r1, #0
	beq _0808360E
	b _08083638
	.align 2, 0
_08083600: .4byte 0x0203E678
_08083604:
	cmp r1, #2
	beq _08083624
	cmp r1, #3
	beq _0808362C
	b _08083638
_0808360E:
	adds r0, r5, #0
	adds r0, #0x64
	strh r1, [r0]
	b _08083638
_08083616:
	adds r0, r4, #0
	bl sub_8083268
	adds r1, r5, #0
	adds r1, #0x64
	movs r0, #2
	b _08083636
_08083624:
	adds r0, r4, #0
	bl sub_808335C
	b _08083630
_0808362C:
	bl sub_80833B4
_08083630:
	adds r1, r5, #0
	adds r1, #0x64
	movs r0, #1
_08083636:
	strh r0, [r1]
_08083638:
	movs r0, #0
	bl SetTextFont
	adds r0, r5, #0
	bl Proc_Break
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_808364C
sub_808364C: @ 0x0808364C
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r4, [r5, #0x58]
	ldr r0, _08083668 @ =0x0203E678
	bl SetTextFont
	adds r0, r4, #0
	bl GetHelpBoxItemInfoKind
	cmp r0, #1
	beq _0808366C
	cmp r0, #3
	beq _08083674
	b _08083678
	.align 2, 0
_08083668: .4byte 0x0203E678
_0808366C:
	adds r0, r4, #0
	bl sub_80832E0
	b _08083678
_08083674:
	bl sub_808341C
_08083678:
	movs r0, #0
	bl SetTextFont
	adds r0, r5, #0
	bl Proc_Break
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_808368C
sub_808368C: @ 0x0808368C
	push {r4, r5, r6, lr}
	mov r6, sl
	mov r5, sb
	mov r4, r8
	push {r4, r5, r6}
	mov sl, r0
	ldr r5, _08083734 @ =0x0203E678
	adds r0, r5, #0
	bl SetTextFont
	movs r0, #1
	bl SetTextFontGlyphs
	movs r0, #0x18
	adds r0, r0, r5
	mov sb, r0
	movs r1, #6
	bl Text_SetColor
	movs r1, #0x20
	adds r1, r1, r5
	mov r8, r1
	mov r0, r8
	movs r1, #6
	bl Text_SetColor
	adds r6, r5, #0
	adds r6, #0x28
	adds r0, r6, #0
	movs r1, #6
	bl Text_SetColor
	movs r0, #0
	bl SetTextFont
	ldr r4, _08083738 @ =gUnk_08D8AF34
	adds r0, r4, #0
	bl Proc_EndEach
	adds r0, r4, #0
	movs r1, #3
	bl Proc_Start
	adds r4, r0, #0
	str r5, [r4, #0x30]
	mov r0, sb
	str r0, [r4, #0x34]
	mov r1, r8
	str r1, [r4, #0x38]
	str r6, [r4, #0x3c]
	mov r0, sl
	adds r0, #0x64
	ldrh r1, [r0]
	adds r0, r4, #0
	adds r0, #0x5c
	movs r5, #0
	strh r1, [r0]
	mov r1, sl
	ldr r0, [r1, #0x5c]
	bl DecodeMsg
	bl sub_8013374
	str r0, [r4, #0x2c]
	adds r1, r4, #0
	adds r1, #0x62
	movs r3, #1
	strh r3, [r1]
	adds r0, r4, #0
	adds r0, #0x5e
	strh r5, [r0]
	ldr r0, _0808373C @ =gPlaySt
	adds r0, #0x40
	ldrb r0, [r0]
	lsls r0, r0, #0x19
	lsrs r2, r0, #0x1e
	cmp r2, #1
	beq _08083752
	cmp r2, #1
	bgt _08083740
	cmp r2, #0
	beq _0808374A
	b _0808376E
	.align 2, 0
_08083734: .4byte 0x0203E678
_08083738: .4byte gUnk_08D8AF34
_0808373C: .4byte gPlaySt
_08083740:
	cmp r2, #2
	beq _0808375A
	cmp r2, #3
	beq _08083764
	b _0808376E
_0808374A:
	adds r1, r4, #0
	adds r1, #0x60
	movs r0, #2
	b _0808376C
_08083752:
	adds r0, r4, #0
	adds r0, #0x60
	strh r2, [r0]
	b _0808376E
_0808375A:
	adds r0, r4, #0
	adds r0, #0x60
	strh r3, [r0]
	strh r2, [r1]
	b _0808376E
_08083764:
	adds r0, r4, #0
	adds r0, #0x60
	strh r5, [r0]
	movs r0, #0x7f
_0808376C:
	strh r0, [r1]
_0808376E:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	thumb_func_start StartHelpBoxTextInit
StartHelpBoxTextInit: @ 0x0808377C
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r0, _08083794 @ =gUnk_08D8AF5C
	movs r1, #3
	bl Proc_Start
	str r4, [r0, #0x58]
	str r5, [r0, #0x5c]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08083794: .4byte gUnk_08D8AF5C

	thumb_func_start ClearHelpBoxText
ClearHelpBoxText: @ 0x08083798
	push {r4, lr}
	ldr r4, _080837D4 @ =0x0203E678
	adds r0, r4, #0
	bl SetTextFont
	adds r0, r4, #0
	adds r0, #0x18
	bl SpriteText_DrawBackground
	adds r0, r4, #0
	adds r0, #0x20
	bl SpriteText_DrawBackground
	adds r4, #0x28
	adds r0, r4, #0
	bl SpriteText_DrawBackground
	ldr r0, _080837D8 @ =gUnk_08D8AF34
	bl Proc_EndEach
	ldr r0, _080837DC @ =gUnk_08D8AF5C
	bl Proc_EndEach
	movs r0, #0
	bl SetTextFont
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080837D4: .4byte 0x0203E678
_080837D8: .4byte gUnk_08D8AF34
_080837DC: .4byte gUnk_08D8AF5C

	thumb_func_start sub_80837E0
sub_80837E0: @ 0x080837E0
	push {r4, r5, lr}
	adds r4, r0, #0
	movs r1, #5
	bl UpdateHelpBoxDisplay
	adds r2, r4, #0
	adds r2, #0x48
	adds r4, #0x4a
	ldrh r3, [r2]
	movs r0, #0
	ldrsh r1, [r2, r0]
	movs r5, #0
	ldrsh r0, [r4, r5]
	cmp r1, r0
	bge _08083802
	adds r0, r3, #1
	strh r0, [r2]
_08083802:
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start sub_8083808
sub_8083808: @ 0x08083808
	push {r4, r5, lr}
	adds r4, r0, #0
	bl sub_8083AC8
	ldr r0, [r4, #0x2c]
	ldrb r1, [r0, #0x10]
	ldrb r2, [r0, #0x11]
	adds r0, r4, #0
	bl sub_8083AC0
	adds r5, r4, #0
	adds r5, #0x4a
	movs r1, #0
	ldrsh r0, [r5, r1]
	movs r1, #3
	bl __divsi3
	strh r0, [r5]
	adds r4, #0x48
	strh r0, [r4]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_8083838
sub_8083838: @ 0x08083838
	push {r4, lr}
	adds r4, r0, #0
	movs r1, #0
	bl UpdateHelpBoxDisplay
	adds r1, r4, #0
	adds r1, #0x48
	ldrh r0, [r1]
	subs r0, #1
	strh r0, [r1]
	lsls r0, r0, #0x10
	cmp r0, #0
	bge _08083858
	adds r0, r4, #0
	bl Proc_Break
_08083858:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_8083860
sub_8083860: @ 0x08083860
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0808387C @ =0x0203E6AC
	movs r3, #0
	strb r4, [r0, #0x10]
	strb r1, [r0, #0x11]
	strh r2, [r0, #0x12]
	str r3, [r0, #0x14]
	str r3, [r0, #0x18]
	bl sub_80839D8
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0808387C: .4byte 0x0203E6AC

	thumb_func_start sub_8083880
sub_8083880: @ 0x08083880
	push {r4, r5, r6, lr}
	sub sp, #8
	adds r6, r0, #0
	ldr r4, _080838C4 @ =gUnk_08D8AF84
	adds r0, r4, #0
	bl Proc_Find
	adds r5, r0, #0
	cmp r5, #0
	bne _080838CC
	adds r0, r4, #0
	movs r1, #3
	bl Proc_Start
	adds r5, r0, #0
	ldr r0, _080838C8 @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080838B2
	movs r0, #0xe4
	lsls r0, r0, #2
	bl m4aSongNumStart
_080838B2:
	ldrb r1, [r6, #0x10]
	ldrb r2, [r6, #0x11]
	adds r0, r5, #0
	bl sub_8083AC0
	adds r0, r5, #0
	bl sub_8083AC8
	b _080838E8
	.align 2, 0
_080838C4: .4byte gUnk_08D8AF84
_080838C8: .4byte gPlaySt
_080838CC:
	ldrh r0, [r5, #0x30]
	strh r0, [r5, #0x38]
	ldrh r0, [r5, #0x32]
	strh r0, [r5, #0x3a]
	adds r0, r5, #0
	adds r0, #0x44
	ldrh r1, [r0]
	subs r0, #4
	strh r1, [r0]
	adds r0, #6
	ldrh r0, [r0]
	adds r1, r5, #0
	adds r1, #0x42
	strh r0, [r1]
_080838E8:
	str r6, [r5, #0x2c]
	adds r1, r5, #0
	adds r1, #0x48
	movs r0, #0
	strh r0, [r1]
	adds r1, #2
	movs r0, #0xc
	strh r0, [r1]
	ldrh r0, [r6, #0x12]
	adds r4, r5, #0
	adds r4, #0x4c
	strh r0, [r4]
	movs r0, #1
	bl SetTextFontGlyphs
	ldrh r0, [r4]
	bl DecodeMsg
	add r2, sp, #4
	mov r1, sp
	bl GetStringTextBox
	movs r0, #0
	bl SetTextFontGlyphs
	ldr r1, [sp]
	ldr r2, [sp, #4]
	adds r0, r5, #0
	bl sub_8083A08
	ldrb r1, [r6, #0x10]
	ldrb r2, [r6, #0x11]
	adds r0, r5, #0
	bl sub_8083A48
	bl ClearHelpBoxText
	adds r0, r5, #0
	adds r0, #0x4e
	ldrh r0, [r0]
	ldrh r1, [r4]
	bl StartHelpBoxTextInit
	ldr r0, _0808394C @ =0x0203E6C8
	str r6, [r0]
	add sp, #8
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0808394C: .4byte 0x0203E6C8

	thumb_func_start sub_8083950
sub_8083950: @ 0x08083950
	push {lr}
	ldr r0, _08083974 @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08083964
	ldr r0, _08083978 @ =0x00000391
	bl m4aSongNumStart
_08083964:
	bl ClearHelpBoxText
	ldr r0, _0808397C @ =gUnk_08D8AF84
	bl Proc_BreakEach
	pop {r0}
	bx r0
	.align 2, 0
_08083974: .4byte gPlaySt
_08083978: .4byte 0x00000391
_0808397C: .4byte gUnk_08D8AF84

	thumb_func_start sub_8083980
sub_8083980: @ 0x08083980
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x50
	movs r1, #0
	strh r1, [r0]
	ldr r0, [r4, #0x2c]
	ldr r1, [r0, #0x14]
	cmp r1, #0
	beq _08083998
	adds r0, r4, #0
	bl _call_via_r1
_08083998:
	ldr r0, [r4, #0x2c]
	bl sub_8083880
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_80839A4
sub_80839A4: @ 0x080839A4
	push {lr}
	adds r2, r0, #0
	ldr r0, _080839C0 @ =gpKeySt
	ldr r1, [r0]
	movs r0, #1
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _080839BC
	adds r0, r2, #0
	bl Proc_Break
_080839BC:
	pop {r0}
	bx r0
	.align 2, 0
_080839C0: .4byte gpKeySt

	thumb_func_start sub_80839C4
sub_80839C4: @ 0x080839C4
	push {r4, lr}
	adds r4, r0, #0
	bl sub_8083950
	adds r0, r4, #0
	bl Proc_End
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_80839D8
sub_80839D8: @ 0x080839D8
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _080839EC @ =gUnk_08D8AFA4
	movs r1, #3
	bl Proc_Start
	str r4, [r0, #0x2c]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080839EC: .4byte gUnk_08D8AFA4

	thumb_func_start sub_80839F0
sub_80839F0: @ 0x080839F0
	push {lr}
	ldr r0, _08083A04 @ =gUnk_08D8AFA4
	bl Proc_Find
	cmp r0, #0
	beq _080839FE
	movs r0, #1
_080839FE:
	pop {r1}
	bx r1
	.align 2, 0
_08083A04: .4byte gUnk_08D8AFA4

	thumb_func_start sub_8083A08
sub_8083A08: @ 0x08083A08
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	adds r4, r1, #0
	adds r5, r2, #0
	adds r4, #0x1f
	movs r0, #0xe0
	ands r4, r0
	adds r0, r6, #0
	adds r0, #0x4e
	ldrh r0, [r0]
	bl sub_8083AD8
	cmp r0, #1
	beq _08083A2A
	cmp r0, #2
	beq _08083A30
	b _08083A38
_08083A2A:
	movs r4, #0xa0
	adds r5, #0x20
	b _08083A38
_08083A30:
	cmp r4, #0x5f
	bgt _08083A36
	movs r4, #0x60
_08083A36:
	adds r5, #0x10
_08083A38:
	adds r0, r6, #0
	adds r0, #0x44
	strh r4, [r0]
	adds r0, #2
	strh r5, [r0]
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	thumb_func_start sub_8083A48
sub_8083A48: @ 0x08083A48
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r5, r0, #0
	adds r4, r1, #0
	mov r8, r2
	adds r0, #0x44
	movs r1, #0
	ldrsh r0, [r0, r1]
	adds r6, r0, #0
	adds r6, #0x10
	adds r0, r5, #0
	adds r0, #0x46
	movs r1, #0
	ldrsh r0, [r0, r1]
	adds r7, r0, #0
	adds r7, #0x10
	adds r0, r6, #0
	movs r1, #6
	bl __divsi3
	adds r0, #0x10
	subs r4, r4, r0
	strh r4, [r5, #0x3c]
	lsls r4, r4, #0x10
	cmp r4, #0
	bge _08083A82
	movs r0, #0
	strh r0, [r5, #0x3c]
_08083A82:
	movs r1, #0x3c
	ldrsh r0, [r5, r1]
	adds r0, r0, r6
	cmp r0, #0xf0
	ble _08083A92
	movs r0, #0xf0
	subs r0, r0, r6
	strh r0, [r5, #0x3c]
_08083A92:
	mov r0, r8
	adds r0, #0x10
	strh r0, [r5, #0x3e]
	movs r1, #0x3e
	ldrsh r0, [r5, r1]
	adds r0, r0, r7
	cmp r0, #0xa0
	ble _08083AA8
	mov r1, r8
	subs r0, r1, r7
	strh r0, [r5, #0x3e]
_08083AA8:
	ldrh r0, [r5, #0x3c]
	adds r0, #8
	strh r0, [r5, #0x3c]
	ldrh r0, [r5, #0x3e]
	adds r0, #8
	strh r0, [r5, #0x3e]
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_8083AC0
sub_8083AC0: @ 0x08083AC0
	strh r1, [r0, #0x38]
	strh r2, [r0, #0x3a]
	bx lr
	.align 2, 0

	thumb_func_start sub_8083AC8
sub_8083AC8: @ 0x08083AC8
	adds r2, r0, #0
	adds r2, #0x40
	movs r1, #0x20
	strh r1, [r2]
	adds r0, #0x42
	movs r1, #0x10
	strh r1, [r0]
	bx lr

	thumb_func_start sub_8083AD8
sub_8083AD8: @ 0x08083AD8
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08083AE8 @ =0x0000FFFF
	cmp r4, r0
	bne _08083AEC
	movs r0, #3
	b _08083B22
	.align 2, 0
_08083AE8: .4byte 0x0000FFFF
_08083AEC:
	adds r0, r4, #0
	bl GetItemAttributes
	movs r1, #0x80
	lsls r1, r1, #3
	ands r1, r0
	cmp r1, #0
	bne _08083B1C
	adds r0, r4, #0
	bl GetItemAttributes
	movs r1, #1
	ands r1, r0
	cmp r1, #0
	beq _08083B0E
	movs r0, #1
	b _08083B22
_08083B0E:
	adds r0, r4, #0
	bl GetItemAttributes
	movs r1, #4
	ands r1, r0
	cmp r1, #0
	bne _08083B20
_08083B1C:
	movs r0, #0
	b _08083B22
_08083B20:
	movs r0, #2
_08083B22:
	pop {r4}
	pop {r1}
	bx r1

	thumb_func_start sub_8083B28
sub_8083B28: @ 0x08083B28
	push {lr}
	adds r2, r0, #0
	ldr r0, _08083B44 @ =gpKeySt
	ldr r1, [r0]
	movs r0, #1
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _08083B40
	adds r0, r2, #0
	bl Proc_Break
_08083B40:
	pop {r0}
	bx r0
	.align 2, 0
_08083B44: .4byte gpKeySt

	thumb_func_start sub_8083B48
sub_8083B48: @ 0x08083B48
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r6, r1, #0
	movs r1, #1
	rsbs r1, r1, #0
	movs r0, #0
	bl LoadHelpBoxGfx
	bl GetUiHandPrevX
	adds r4, r0, #0
	bl GetUiHandPrevY
	adds r1, r0, #0
	adds r0, r4, #0
	adds r2, r5, #0
	bl sub_8083860
	ldr r0, _08083B7C @ =gUnk_08D8AFD4
	adds r1, r6, #0
	bl Proc_StartBlocking
	movs r0, #1
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_08083B7C: .4byte gUnk_08D8AFD4

	thumb_func_start sub_8083B80
sub_8083B80: @ 0x08083B80
	push {lr}
	ldr r0, _08083B90 @ =gUnk_08D8AFEC
	bl Proc_Find
	cmp r0, #0
	bne _08083B94
	movs r0, #0
	b _08083B96
	.align 2, 0
_08083B90: .4byte gUnk_08D8AFEC
_08083B94:
	movs r0, #1
_08083B96:
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_8083B9C
sub_8083B9C: @ 0x08083B9C
	ldr r1, _08083BA4 @ =0x0203E6CC
	adds r1, #0x42
	strh r0, [r1]
	bx lr
	.align 2, 0
_08083BA4: .4byte 0x0203E6CC

	thumb_func_start sub_8083BA8
sub_8083BA8: @ 0x08083BA8
	ldr r0, _08083BB0 @ =0x0203E6CC
	adds r0, #0x42
	ldrh r0, [r0]
	bx lr
	.align 2, 0
_08083BB0: .4byte 0x0203E6CC

	thumb_func_start sub_8083BB4
sub_8083BB4: @ 0x08083BB4
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #4
	mov sb, r0
	ldr r3, _08083C14 @ =0x0203E6CC
	adds r2, r3, #0
	adds r2, #0x40
	ldr r0, _08083C18 @ =0x000003FF
	ldrh r2, [r2]
	ands r0, r2
	ldrh r3, [r3, #0x18]
	adds r0, r3, r0
	lsls r0, r0, #5
	ldr r2, _08083C1C @ =0x06010000
	adds r5, r0, r2
	movs r7, #0
	lsls r0, r1, #1
	cmp r7, r0
	bge _08083C46
	adds r3, r0, #0
_08083BE0:
	adds r4, r5, #0
	movs r2, #0
	adds r0, r7, #1
	mov r8, r0
	cmp r2, sb
	bge _08083C3A
_08083BEC:
	adds r6, r2, #1
	movs r1, #6
_08083BF0:
	ldr r0, [r4, #4]
	stm r4!, {r0}
	subs r1, #1
	cmp r1, #0
	bge _08083BF0
	subs r0, r3, #1
	cmp r7, r0
	bne _08083C28
	str r3, [sp]
	bl sub_8083BA8
	movs r1, #1
	ands r1, r0
	ldr r3, [sp]
	cmp r1, #0
	bne _08083C24
	ldr r0, _08083C20 @ =0x44444444
	b _08083C32
	.align 2, 0
_08083C14: .4byte 0x0203E6CC
_08083C18: .4byte 0x000003FF
_08083C1C: .4byte 0x06010000
_08083C20: .4byte 0x44444444
_08083C24:
	movs r0, #0
	b _08083C32
_08083C28:
	adds r0, r2, #0
	adds r0, #0x20
	lsls r0, r0, #5
	adds r0, r0, r5
	ldr r0, [r0]
_08083C32:
	stm r4!, {r0}
	adds r2, r6, #0
	cmp r2, sb
	blt _08083BEC
_08083C3A:
	movs r2, #0x80
	lsls r2, r2, #3
	adds r5, r5, r2
	mov r7, r8
	cmp r7, r3
	blt _08083BE0
_08083C46:
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_8083C54
sub_8083C54: @ 0x08083C54
	push {r4, r5, r6, r7, lr}
	adds r6, r0, #0
	adds r5, r1, #0
	cmp r6, #0
	bne _08083C60
	ldr r6, _08083C84 @ =0x06013000
_08083C60:
	cmp r5, #0
	bge _08083C66
	movs r5, #5
_08083C66:
	movs r0, #0xf
	ands r0, r5
	adds r5, r0, #0
	adds r5, #0x10
	bl sub_8083BA8
	movs r1, #0x10
	ands r1, r0
	cmp r1, #0
	beq _08083C8C
	ldr r0, _08083C88 @ =gUnk_0840431C
	adds r1, r6, #0
	bl Decompress
	b _08083C94
	.align 2, 0
_08083C84: .4byte 0x06013000
_08083C88: .4byte gUnk_0840431C
_08083C8C:
	ldr r0, _08083D08 @ =gUnk_084041FC
	adds r1, r6, #0
	bl Decompress
_08083C94:
	bl ClearAllTalkFlags
	bl sub_8083BA8
	movs r1, #1
	ands r1, r0
	cmp r1, #0
	bne _08083D24
	ldr r4, _08083D0C @ =0x0203E6CC
	adds r0, r4, #0
	adds r1, r6, #0
	adds r2, r5, #0
	bl InitSpriteTextFont
	adds r0, r4, #0
	adds r0, #0x18
	bl InitSpriteText
	adds r0, r4, #0
	adds r0, #0x20
	bl InitSpriteText
	adds r0, r4, #0
	adds r0, #0x28
	bl InitSpriteText
	bl sub_8083BA8
	movs r1, #0x10
	ands r1, r0
	cmp r1, #0
	beq _08083CF0
	bl sub_8083BA8
	movs r1, #0x20
	ands r1, r0
	cmp r1, #0
	bne _08083CF0
	adds r0, r4, #0
	adds r0, #0x30
	bl InitSpriteText
	adds r0, r4, #0
	adds r0, #0x38
	bl InitSpriteText
_08083CF0:
	movs r0, #0
	bl SetTextFont
	bl sub_8083BA8
	movs r1, #0x10
	ands r1, r0
	cmp r1, #0
	beq _08083D14
	ldr r0, _08083D10 @ =gUnk_08190248
	b _08083D16
	.align 2, 0
_08083D08: .4byte gUnk_084041FC
_08083D0C: .4byte 0x0203E6CC
_08083D10: .4byte gUnk_08190248
_08083D14:
	ldr r0, _08083D20 @ =gUnk_08190228
_08083D16:
	lsls r1, r5, #5
	movs r2, #0x20
	bl ApplyPaletteExt
	b _08083D60
	.align 2, 0
_08083D20: .4byte gUnk_08190228
_08083D24:
	ldr r0, _08083D34 @ =0x0203E6CC
	adds r1, r6, #0
	adds r2, r5, #0
	bl InitSpriteTextFont
	movs r4, #0
	lsls r7, r5, #5
	b _08083D44
	.align 2, 0
_08083D34: .4byte 0x0203E6CC
_08083D38:
	lsls r0, r4, #3
	ldr r1, _08083D98 @ =0x0203E6E4
	adds r0, r0, r1
	bl InitSpriteText
	adds r4, #1
_08083D44:
	bl sub_8083BA8
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x18
	cmp r4, r0
	blt _08083D38
	movs r0, #0
	bl SetTextFont
	ldr r0, _08083D9C @ =Pal_Text
	adds r1, r7, #0
	movs r2, #0x20
	bl ApplyPaletteExt
_08083D60:
	ldr r2, _08083DA0 @ =0x0203E6CC
	lsls r1, r6, #0x11
	lsrs r1, r1, #0x16
	movs r0, #0xf
	ands r0, r5
	lsls r0, r0, #0xc
	adds r1, r1, r0
	adds r2, #0x40
	strh r1, [r2]
	bl sub_8083BA8
	movs r1, #0x10
	ands r1, r0
	cmp r1, #0
	beq _08083D90
	ldr r0, _08083DA4 @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08083D90
	ldr r0, _08083DA8 @ =0x000002E6
	bl m4aSongNumStart
_08083D90:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08083D98: .4byte 0x0203E6E4
_08083D9C: .4byte Pal_Text
_08083DA0: .4byte 0x0203E6CC
_08083DA4: .4byte gPlaySt
_08083DA8: .4byte 0x000002E6

	thumb_func_start sub_8083DAC
sub_8083DAC: @ 0x08083DAC
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r6, r2, #0
	adds r0, #0x46
	movs r1, #0
	ldrsh r0, [r0, r1]
	adds r0, #0x10
	mov r8, r0
	adds r1, r4, #0
	adds r1, #0x44
	movs r2, #0
	ldrsh r0, [r1, r2]
	cmp r0, #0xbf
	ble _08083DD2
	movs r0, #0xc0
	strh r0, [r1]
_08083DD2:
	movs r2, #0
	ldrsh r0, [r1, r2]
	adds r7, r0, #0
	adds r7, #0x10
	bl sub_8083BA8
	movs r1, #1
	ands r1, r0
	cmp r1, #0
	bne _08083E24
	strh r5, [r4, #0x3c]
	adds r0, r6, #0
	adds r0, #8
	strh r0, [r4, #0x3e]
	bl sub_8083BA8
	movs r1, #0x40
	ands r1, r0
	cmp r1, #0
	bne _08083E1C
	movs r1, #0x3c
	ldrsh r0, [r4, r1]
	adds r0, r0, r7
	cmp r0, #0xf0
	ble _08083E0A
	movs r0, #0xf0
	subs r0, r0, r7
	strh r0, [r4, #0x3c]
_08083E0A:
	movs r2, #0x3e
	ldrsh r0, [r4, r2]
	add r0, r8
	cmp r0, #0xa0
	ble _08083E1C
	movs r0, #0x98
	mov r1, r8
	subs r0, r0, r1
	strh r0, [r4, #0x3e]
_08083E1C:
	ldrh r0, [r4, #0x3c]
	adds r0, #8
	strh r0, [r4, #0x3c]
	b _08083E28
_08083E24:
	strh r5, [r4, #0x3c]
	strh r6, [r4, #0x3e]
_08083E28:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_8083E34
sub_8083E34: @ 0x08083E34
	movs r3, #0xf8
	ands r3, r1
	adds r1, r0, #0
	adds r1, #0x44
	strh r3, [r1]
	adds r0, #0x46
	strh r2, [r0]
	bx lr

	thumb_func_start sub_8083E44
sub_8083E44: @ 0x08083E44
	push {r4, lr}
	adds r4, r0, #0
	adds r1, r4, #0
	adds r1, #0x40
	ldrb r0, [r1]
	cmp r0, #0xff
	bne _08083E5E
	movs r1, #1
	rsbs r1, r1, #0
	movs r0, #0
	bl sub_8083C54
	b _08083E66
_08083E5E:
	ldr r0, [r4, #0x3c]
	ldrb r1, [r1]
	bl sub_8083C54
_08083E66:
	ldr r0, [r4, #0x2c]
	ldr r1, [r4, #0x30]
	ldr r2, [r4, #0x34]
	bl sub_8084208
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_8083E78
sub_8083E78: @ 0x08083E78
	push {r4, lr}
	adds r4, r0, #0
	bl sub_8083BA8
	movs r1, #0x82
	ands r1, r0
	cmp r1, #0
	bne _08083E9E
	ldr r0, _08083EA4 @ =gpKeySt
	ldr r1, [r0]
	movs r0, #0xa
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _08083E9E
	adds r0, r4, #0
	movs r1, #2
	bl Proc_Goto
_08083E9E:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08083EA4: .4byte gpKeySt

	thumb_func_start sub_8083EA8
sub_8083EA8: @ 0x08083EA8
	push {lr}
	bl sub_8083BA8
	movs r1, #0x10
	ands r1, r0
	cmp r1, #0
	beq _08083EC8
	ldr r0, _08083ED8 @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08083EC8
	ldr r0, _08083EDC @ =0x000002E7
	bl m4aSongNumStart
_08083EC8:
	movs r0, #0
	bl SetTextFontGlyphs
	bl sub_8083FEC
	pop {r0}
	bx r0
	.align 2, 0
_08083ED8: .4byte gPlaySt
_08083EDC: .4byte 0x000002E7

	thumb_func_start sub_8083EE0
sub_8083EE0: @ 0x08083EE0
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	adds r7, r0, #0
	adds r5, r1, #0
	movs r1, #0x3c
	ldrsh r0, [r7, r1]
	mov r8, r0
	movs r3, #0x3e
	ldrsh r2, [r7, r3]
	mov sb, r2
	adds r0, r7, #0
	adds r0, #0x40
	movs r4, #0
	ldrsh r1, [r0, r4]
	adds r0, #4
	movs r6, #0
	ldrsh r2, [r0, r6]
	adds r4, r7, #0
	adds r4, #0x48
	movs r3, #0
	ldrsh r0, [r4, r3]
	mov ip, r0
	movs r6, #0x4a
	adds r6, r6, r7
	mov sl, r6
	movs r3, #0
	ldrsh r0, [r6, r3]
	str r0, [sp]
	adds r0, r5, #0
	mov r3, ip
	bl Interpolate
	str r0, [sp, #4]
	adds r0, r7, #0
	adds r0, #0x42
	movs r6, #0
	ldrsh r1, [r0, r6]
	adds r0, #4
	movs r3, #0
	ldrsh r2, [r0, r3]
	movs r6, #0
	ldrsh r3, [r4, r6]
	mov r4, sl
	movs r6, #0
	ldrsh r0, [r4, r6]
	str r0, [sp]
	adds r0, r5, #0
	bl Interpolate
	adds r3, r0, #0
	mov r0, r8
	strh r0, [r7, #0x30]
	mov r1, sb
	strh r1, [r7, #0x32]
	mov r0, r8
	mov r1, sb
	ldr r2, [sp, #4]
	bl sub_80842F8
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_8083F70
sub_8083F70: @ 0x08083F70
	push {r4, r5, lr}
	adds r4, r0, #0
	movs r1, #5
	bl sub_8083EE0
	adds r2, r4, #0
	adds r2, #0x48
	adds r4, #0x4a
	ldrh r3, [r2]
	movs r0, #0
	ldrsh r1, [r2, r0]
	movs r5, #0
	ldrsh r0, [r4, r5]
	cmp r1, r0
	bge _08083F92
	adds r0, r3, #1
	strh r0, [r2]
_08083F92:
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start sub_8083F98
sub_8083F98: @ 0x08083F98
	push {r4, r5, lr}
	adds r4, r0, #0
	bl ResetHelpBoxInitSize
	adds r5, r4, #0
	adds r5, #0x4a
	movs r1, #0
	ldrsh r0, [r5, r1]
	movs r1, #3
	bl __divsi3
	strh r0, [r5]
	adds r4, #0x48
	strh r0, [r4]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_8083FBC
sub_8083FBC: @ 0x08083FBC
	push {r4, lr}
	adds r4, r0, #0
	movs r1, #0
	bl sub_8083EE0
	adds r1, r4, #0
	adds r1, #0x48
	ldrh r0, [r1]
	subs r0, #1
	strh r0, [r1]
	lsls r0, r0, #0x10
	cmp r0, #0
	bge _08083FE2
	adds r0, r4, #0
	bl Proc_Break
	ldr r0, _08083FE8 @ =gUnk_08D8B124
	bl Proc_EndEach
_08083FE2:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08083FE8: .4byte gUnk_08D8B124

	thumb_func_start sub_8083FEC
sub_8083FEC: @ 0x08083FEC
	push {lr}
	bl sub_8085008
	ldr r0, _08083FFC @ =gUnk_08D8B04C
	bl Proc_BreakEach
	pop {r0}
	bx r0
	.align 2, 0
_08083FFC: .4byte gUnk_08D8B04C

	thumb_func_start sub_8084000
sub_8084000: @ 0x08084000
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r6, r0, #0
	adds r7, r1, #0
	mov r8, r2
	adds r5, r3, #0
	ldr r4, _0808402C @ =gUnk_08D8AFEC
	adds r0, r4, #0
	bl Proc_EndEach
	movs r0, #0
	bl sub_8083B9C
	cmp r5, #0
	bne _08084030
	adds r0, r4, #0
	movs r1, #3
	bl Proc_Start
	b _08084038
	.align 2, 0
_0808402C: .4byte gUnk_08D8AFEC
_08084030:
	adds r0, r4, #0
	adds r1, r5, #0
	bl Proc_StartBlocking
_08084038:
	adds r2, r0, #0
	str r6, [r2, #0x2c]
	str r7, [r2, #0x30]
	mov r0, r8
	str r0, [r2, #0x34]
	adds r1, r2, #0
	adds r1, #0x40
	movs r0, #0xff
	strb r0, [r1]
	subs r1, #8
	movs r0, #1
	strb r0, [r1]
	ldr r0, _08084064 @ =gUnk_08D8B124
	movs r1, #0
	bl Proc_Start
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08084064: .4byte gUnk_08D8B124

	thumb_func_start sub_8084068
sub_8084068: @ 0x08084068
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	adds r6, r0, #0
	adds r7, r1, #0
	mov r8, r2
	mov sb, r3
	ldr r5, [sp, #0x20]
	ldr r4, _08084098 @ =gUnk_08D8AFEC
	adds r0, r4, #0
	bl Proc_EndEach
	movs r0, #0
	bl sub_8083B9C
	cmp r5, #0
	bne _0808409C
	adds r0, r4, #0
	movs r1, #3
	bl Proc_Start
	b _080840A4
	.align 2, 0
_08084098: .4byte gUnk_08D8AFEC
_0808409C:
	adds r0, r4, #0
	adds r1, r5, #0
	bl Proc_StartBlocking
_080840A4:
	adds r2, r0, #0
	str r6, [r2, #0x2c]
	str r7, [r2, #0x30]
	mov r0, r8
	str r0, [r2, #0x34]
	adds r1, r2, #0
	adds r1, #0x40
	ldr r0, [sp, #0x1c]
	strb r0, [r1]
	mov r0, sb
	str r0, [r2, #0x3c]
	subs r1, #8
	movs r0, #1
	strb r0, [r1]
	ldr r0, _080840D4 @ =gUnk_08D8B124
	movs r1, #0
	bl Proc_Start
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080840D4: .4byte gUnk_08D8B124

	thumb_func_start sub_80840D8
sub_80840D8: @ 0x080840D8
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r3, r0, #0
	adds r4, r1, #0
	adds r5, r2, #0
	movs r7, #0
	movs r6, #0x10
	str r7, [r4]
	str r7, [r5]
_080840EA:
	ldrb r0, [r3]
	cmp r0, #7
	bgt _0808410C
	cmp r0, #4
	bge _08084134
	cmp r0, #1
	beq _08084128
	cmp r0, #1
	bgt _08084102
	cmp r0, #0
	beq _0808416A
	b _0808417C
_08084102:
	cmp r0, #2
	beq _08084138
	cmp r0, #3
	beq _0808414E
	b _0808417C
_0808410C:
	cmp r0, #0x19
	ble _08084116
	cmp r0, #0x80
	beq _08084124
	b _0808417C
_08084116:
	cmp r0, #0x18
	bge _08084132
	cmp r0, #0x14
	bgt _0808417C
	cmp r0, #0x12
	blt _0808417C
	b _0808416A
_08084124:
	adds r3, #2
	b _080840EA
_08084128:
	adds r6, #0x10
	ldr r0, [r4]
	cmp r0, r7
	bge _08084132
	str r7, [r4]
_08084132:
	movs r7, #0
_08084134:
	adds r3, #1
	b _080840EA
_08084138:
	adds r3, #1
	ldr r0, [r5]
	cmp r0, r6
	bge _08084142
	str r6, [r5]
_08084142:
	movs r6, #0
	ldr r0, [r4]
	cmp r0, r7
	bge _08084166
	str r7, [r4]
	b _08084166
_0808414E:
	adds r3, #1
	ldr r0, [r5]
	cmp r0, r6
	bge _08084158
	str r6, [r5]
_08084158:
	movs r6, #0
	adds r1, r7, #0
	adds r1, #8
	ldr r0, [r4]
	cmp r0, r1
	bge _08084166
	str r1, [r4]
_08084166:
	movs r7, #0
	b _080840EA
_0808416A:
	ldr r0, [r4]
	cmp r0, r7
	bge _08084172
	str r7, [r4]
_08084172:
	ldr r0, [r5]
	cmp r0, r6
	bge _0808418C
	str r6, [r5]
	b _0808418C
_0808417C:
	adds r0, r3, #0
	mov r1, sp
	bl GetCharTextLen
	adds r3, r0, #0
	ldr r0, [sp]
	adds r7, r7, r0
	b _080840EA
_0808418C:
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_8084194
sub_8084194: @ 0x08084194
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r6, r1, #0
	movs r5, #0
	adds r4, r0, #0
	strb r5, [r6]
	movs r0, #1
	bl SetTextFontGlyphs
_080841A6:
	ldrb r0, [r4]
	cmp r0, #7
	bgt _080841C8
	cmp r0, #4
	bge _080841DE
	cmp r0, #1
	beq _080841E2
	cmp r0, #1
	bgt _080841BE
	cmp r0, #0
	beq _080841FC
	b _080841EC
_080841BE:
	cmp r0, #2
	beq _080841DE
	cmp r0, #3
	beq _080841FC
	b _080841EC
_080841C8:
	cmp r0, #0x19
	ble _080841D2
	cmp r0, #0x80
	beq _080841E8
	b _080841EC
_080841D2:
	cmp r0, #0x18
	bge _080841E2
	cmp r0, #0x14
	bgt _080841EC
	cmp r0, #0x12
	blt _080841EC
_080841DE:
	adds r4, #1
	b _080841A6
_080841E2:
	adds r4, #1
	movs r5, #0
	b _080841A6
_080841E8:
	adds r4, #2
	b _080841A6
_080841EC:
	adds r0, r4, #0
	mov r1, sp
	bl GetCharTextLen
	adds r4, r0, #0
	ldr r0, [sp]
	adds r5, r5, r0
	b _080841A6
_080841FC:
	adds r0, r5, #2
	strb r0, [r6]
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	thumb_func_start sub_8084208
sub_8084208: @ 0x08084208
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #8
	adds r6, r0, #0
	adds r7, r1, #0
	mov r8, r2
	movs r5, #0
	str r5, [sp]
	str r5, [sp, #4]
	ldr r4, _08084258 @ =gUnk_08D8B04C
	adds r0, r4, #0
	bl Proc_EndEach
	adds r0, r4, #0
	movs r1, #3
	bl Proc_Start
	adds r4, r0, #0
	adds r1, r6, #0
	adds r2, r7, #0
	bl SetHelpBoxInitPosition
	adds r0, r4, #0
	bl ResetHelpBoxInitSize
	str r5, [r4, #0x2c]
	adds r0, r4, #0
	adds r0, #0x48
	strh r5, [r0]
	bl sub_8083BA8
	movs r1, #1
	ands r1, r0
	cmp r1, #0
	beq _0808425C
	adds r0, r4, #0
	adds r0, #0x4a
	strh r5, [r0]
	b _08084264
	.align 2, 0
_08084258: .4byte gUnk_08D8B04C
_0808425C:
	adds r1, r4, #0
	adds r1, #0x4a
	movs r0, #0xc
	strh r0, [r1]
_08084264:
	adds r1, r4, #0
	adds r1, #0x4e
	movs r0, #0
	strh r0, [r1]
	adds r5, r4, #0
	adds r5, #0x4c
	mov r0, r8
	strh r0, [r5]
	movs r0, #1
	bl SetTextFontGlyphs
	ldrh r0, [r5]
	bl DecodeMsg
	bl sub_8013374
	add r2, sp, #4
	mov r1, sp
	bl sub_80840D8
	movs r0, #0
	bl SetTextFontGlyphs
	ldr r1, [sp]
	ldr r2, [sp, #4]
	adds r0, r4, #0
	bl sub_8083E34
	bl sub_8083BA8
	movs r1, #0x80
	lsls r1, r1, #1
	ands r1, r0
	cmp r1, #0
	beq _080842D2
	adds r0, r4, #0
	adds r0, #0x44
	movs r2, #0
	ldrsh r1, [r0, r2]
	movs r0, #0xd8
	subs r0, r0, r1
	lsrs r1, r0, #0x1f
	adds r0, r0, r1
	asrs r0, r0, #1
	adds r6, r6, r0
	adds r0, r4, #0
	adds r0, #0x46
	movs r2, #0
	ldrsh r1, [r0, r2]
	movs r0, #0x90
	subs r0, r0, r1
	lsrs r1, r0, #0x1f
	adds r0, r0, r1
	asrs r0, r0, #1
	adds r7, r7, r0
_080842D2:
	adds r0, r4, #0
	adds r1, r6, #0
	adds r2, r7, #0
	bl sub_8083DAC
	bl sub_8085008
	ldrh r0, [r5]
	ldr r1, [sp]
	ldr r2, [sp, #4]
	bl sub_8084FC4
	add sp, #8
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_80842F8
sub_80842F8: @ 0x080842F8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x24
	mov sb, r0
	str r1, [sp, #4]
	adds r4, r2, #0
	mov r8, r3
	cmp r4, #0x1f
	bgt _08084312
	movs r4, #0x20
_08084312:
	cmp r4, #0xc0
	ble _08084318
	movs r4, #0xc0
_08084318:
	mov r0, r8
	cmp r0, #0xf
	bgt _08084322
	movs r1, #0x10
	mov r8, r1
_08084322:
	mov r2, r8
	cmp r2, #0x50
	ble _0808432C
	movs r3, #0x50
	mov r8, r3
_0808432C:
	bl sub_8083BA8
	movs r1, #1
	ands r1, r0
	cmp r1, #0
	beq _0808433A
	b _0808458C
_0808433A:
	mov r0, r8
	adds r0, #0xf
	cmp r0, #0
	bge _08084344
	adds r0, #0xf
_08084344:
	asrs r0, r0, #4
	str r0, [sp, #0xc]
	adds r0, r4, #7
	cmp r0, #0
	bge _08084350
	adds r0, #7
_08084350:
	asrs r0, r0, #3
	adds r1, r0, #1
	str r1, [sp, #8]
	movs r6, #0
	subs r0, #3
	ldr r2, [sp, #4]
	subs r2, #8
	str r2, [sp, #0x14]
	ldr r3, [sp, #4]
	add r3, r8
	str r3, [sp, #0x20]
	mov r1, sb
	subs r1, #8
	str r1, [sp, #0x10]
	cmp r6, r0
	bge _080843B6
	str r0, [sp, #0x18]
_08084372:
	lsls r7, r6, #3
	ldr r5, [sp, #0xc]
	adds r4, r6, #4
	cmp r5, #0
	blt _080843AE
	ldr r2, _0808455C @ =0x0203E70C
	mov sl, r2
_08084380:
	adds r0, r5, #1
	lsls r0, r0, #4
	cmp r0, r8
	ble _0808438A
	mov r0, r8
_0808438A:
	subs r0, #0x10
	ldr r3, [sp, #4]
	adds r2, r3, r0
	mov r1, sl
	ldrh r1, [r1]
	adds r0, r1, r6
	lsls r1, r5, #6
	adds r0, r0, r1
	str r0, [sp]
	movs r0, #2
	mov r3, sb
	adds r1, r3, r7
	ldr r3, _08084560 @ =Sprite_32x16
	bl PutSprite
	subs r5, #1
	cmp r5, #0
	bge _08084380
_080843AE:
	adds r6, r4, #0
	ldr r0, [sp, #0x18]
	cmp r6, r0
	blt _08084372
_080843B6:
	ldr r1, [sp, #8]
	subs r1, #2
	str r1, [sp, #0x1c]
	cmp r6, r1
	bge _08084404
_080843C0:
	lsls r7, r6, #3
	ldr r5, [sp, #0xc]
	adds r4, r6, #2
	cmp r5, #0
	blt _080843FC
	ldr r2, _0808455C @ =0x0203E70C
	mov sl, r2
_080843CE:
	adds r0, r5, #1
	lsls r0, r0, #4
	cmp r0, r8
	ble _080843D8
	mov r0, r8
_080843D8:
	subs r0, #0x10
	ldr r3, [sp, #4]
	adds r2, r3, r0
	mov r1, sl
	ldrh r1, [r1]
	adds r0, r1, r6
	lsls r1, r5, #6
	adds r0, r0, r1
	str r0, [sp]
	movs r0, #2
	mov r3, sb
	adds r1, r3, r7
	ldr r3, _08084564 @ =Sprite_16x16
	bl PutSprite
	subs r5, #1
	cmp r5, #0
	bge _080843CE
_080843FC:
	adds r6, r4, #0
	ldr r0, [sp, #0x1c]
	cmp r6, r0
	blt _080843C0
_08084404:
	ldr r1, [sp, #8]
	cmp r6, r1
	bge _0808444E
_0808440A:
	lsls r7, r6, #3
	ldr r5, [sp, #0xc]
	adds r4, r6, #1
	cmp r5, #0
	blt _08084446
	ldr r2, _0808455C @ =0x0203E70C
	mov sl, r2
_08084418:
	adds r0, r5, #1
	lsls r0, r0, #4
	cmp r0, r8
	ble _08084422
	mov r0, r8
_08084422:
	subs r0, #0x10
	ldr r3, [sp, #4]
	adds r2, r3, r0
	mov r1, sl
	ldrh r1, [r1]
	adds r0, r1, r6
	lsls r1, r5, #6
	adds r0, r0, r1
	str r0, [sp]
	movs r0, #2
	mov r3, sb
	adds r1, r3, r7
	ldr r3, _08084568 @ =Sprite_8x16
	bl PutSprite
	subs r5, #1
	cmp r5, #0
	bge _08084418
_08084446:
	adds r6, r4, #0
	ldr r0, [sp, #8]
	cmp r6, r0
	blt _0808440A
_0808444E:
	movs r6, #0
	ldr r1, [sp, #0x1c]
	cmp r6, r1
	bge _08084488
	ldr r5, _0808455C @ =0x0203E70C
	mov r4, sb
_0808445A:
	ldrh r0, [r5]
	adds r0, #0x1b
	str r0, [sp]
	movs r0, #2
	adds r1, r4, #0
	ldr r2, [sp, #0x14]
	ldr r3, _0808456C @ =Sprite_16x8
	bl PutSprite
	ldrh r0, [r5]
	adds r0, #0x1b
	str r0, [sp]
	movs r0, #2
	adds r1, r4, #0
	ldr r2, [sp, #0x20]
	ldr r3, _08084570 @ =Sprite_16x8_VFlipped
	bl PutSprite
	adds r4, #0x10
	adds r6, #2
	ldr r2, [sp, #0x1c]
	cmp r6, r2
	blt _0808445A
_08084488:
	ldr r3, [sp, #8]
	cmp r6, r3
	bge _080844C4
	ldr r5, _0808455C @ =0x0203E70C
	lsls r0, r6, #3
	mov r1, sb
	adds r4, r0, r1
_08084496:
	ldrh r0, [r5]
	adds r0, #0x1b
	str r0, [sp]
	movs r0, #2
	adds r1, r4, #0
	ldr r2, [sp, #0x14]
	ldr r3, _08084574 @ =Sprite_8x8
	bl PutSprite
	ldrh r0, [r5]
	adds r0, #0x1b
	str r0, [sp]
	movs r0, #2
	adds r1, r4, #0
	ldr r2, [sp, #0x20]
	ldr r3, _08084578 @ =Sprite_8x8_VFlipped
	bl PutSprite
	adds r4, #8
	adds r6, #1
	ldr r2, [sp, #8]
	cmp r6, r2
	blt _08084496
_080844C4:
	ldr r5, [sp, #0xc]
	lsls r6, r6, #3
	cmp r5, #0
	blt _0808450A
	ldr r7, _0808455C @ =0x0203E70C
_080844CE:
	adds r0, r5, #1
	lsls r0, r0, #4
	cmp r0, r8
	ble _080844D8
	mov r0, r8
_080844D8:
	subs r0, #0x10
	ldr r3, [sp, #4]
	adds r4, r3, r0
	ldrh r0, [r7]
	adds r0, #0x1f
	str r0, [sp]
	movs r0, #2
	ldr r1, [sp, #0x10]
	adds r2, r4, #0
	ldr r3, _08084568 @ =Sprite_8x16
	bl PutSprite
	ldrh r0, [r7]
	adds r0, #0x1f
	str r0, [sp]
	movs r0, #2
	mov r2, sb
	adds r1, r2, r6
	adds r2, r4, #0
	ldr r3, _0808457C @ =Sprite_8x16_HFlipped
	bl PutSprite
	subs r5, #1
	cmp r5, #0
	bge _080844CE
_0808450A:
	ldr r3, _08084574 @ =Sprite_8x8
	ldr r4, _08084580 @ =0x0203E6CC
	adds r4, #0x40
	ldrh r0, [r4]
	adds r0, #0x3e
	str r0, [sp]
	movs r0, #2
	ldr r1, [sp, #0x10]
	ldr r2, [sp, #0x14]
	bl PutSprite
	mov r3, sb
	adds r5, r3, r6
	ldr r3, _08084584 @ =Sprite_8x8_HFlipped
	ldrh r0, [r4]
	adds r0, #0x3e
	str r0, [sp]
	movs r0, #2
	adds r1, r5, #0
	ldr r2, [sp, #0x14]
	bl PutSprite
	ldr r3, _08084578 @ =Sprite_8x8_VFlipped
	ldrh r0, [r4]
	adds r0, #0x3e
	str r0, [sp]
	movs r0, #2
	ldr r1, [sp, #0x10]
	ldr r2, [sp, #0x20]
	bl PutSprite
	ldr r3, _08084588 @ =Sprite_8x8_HFlipped_VFlipped
	ldrh r0, [r4]
	adds r0, #0x3e
	str r0, [sp]
	movs r0, #2
	adds r1, r5, #0
	ldr r2, [sp, #0x20]
	bl PutSprite
	b _080845EE
	.align 2, 0
_0808455C: .4byte 0x0203E70C
_08084560: .4byte Sprite_32x16
_08084564: .4byte Sprite_16x16
_08084568: .4byte Sprite_8x16
_0808456C: .4byte Sprite_16x8
_08084570: .4byte Sprite_16x8_VFlipped
_08084574: .4byte Sprite_8x8
_08084578: .4byte Sprite_8x8_VFlipped
_0808457C: .4byte Sprite_8x16_HFlipped
_08084580: .4byte 0x0203E6CC
_08084584: .4byte Sprite_8x8_HFlipped
_08084588: .4byte Sprite_8x8_HFlipped_VFlipped
_0808458C:
	adds r0, r4, #0
	adds r0, #0x1f
	cmp r0, #0
	bge _08084596
	adds r0, #0x1f
_08084596:
	asrs r0, r0, #5
	str r0, [sp, #8]
	bl sub_8083BA8
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x18
	subs r0, #1
	str r0, [sp, #0xc]
	ldr r6, [sp, #8]
	subs r6, #1
	cmp r6, #0
	blt _080845EE
_080845AE:
	ldr r5, [sp, #0xc]
	subs r0, r6, #1
	mov r8, r0
	cmp r5, #0
	blt _080845E8
	lsls r7, r6, #5
	ldr r1, _08084600 @ =0x0203E70C
	mov sl, r1
	lsls r0, r5, #4
	ldr r2, [sp, #4]
	adds r4, r0, r2
_080845C4:
	lsls r0, r6, #2
	mov r3, sl
	ldrh r3, [r3]
	adds r0, r3, r0
	lsls r1, r5, #6
	adds r0, r0, r1
	str r0, [sp]
	movs r0, #2
	mov r2, sb
	adds r1, r2, r7
	adds r2, r4, #0
	ldr r3, _08084604 @ =Sprite_32x16
	bl PutSprite
	subs r4, #0x10
	subs r5, #1
	cmp r5, #0
	bge _080845C4
_080845E8:
	mov r6, r8
	cmp r6, #0
	bge _080845AE
_080845EE:
	add sp, #0x24
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08084600: .4byte 0x0203E70C
_08084604: .4byte Sprite_32x16

	thumb_func_start sub_8084608
sub_8084608: @ 0x08084608
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0808463C @ =gUnk_08D8B04C
	bl Proc_Find
	adds r2, r4, #0
	adds r2, #0x59
	movs r1, #0
	strb r1, [r2]
	ldrh r2, [r0, #0x30]
	subs r2, #8
	adds r1, r4, #0
	adds r1, #0x50
	strb r2, [r1]
	ldrh r0, [r0, #0x32]
	subs r0, #8
	adds r1, #1
	strb r0, [r1]
	ldr r0, [r4, #0x2c]
	adds r1, #1
	bl sub_8084194
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0808463C: .4byte gUnk_08D8B04C

	thumb_func_start sub_8084640
sub_8084640: @ 0x08084640
	push {lr}
	bl sub_8083BA8
	movs r1, #4
	ands r1, r0
	cmp r1, #0
	beq _08084660
	movs r0, #0
	bl GetFaceDispById
	movs r1, #0x11
	rsbs r1, r1, #0
	ands r1, r0
	movs r0, #0
	bl SetFaceDispById
_08084660:
	pop {r0}
	bx r0

	thumb_func_start sub_8084664
sub_8084664: @ 0x08084664
	push {lr}
	bl sub_8083BA8
	movs r1, #4
	ands r1, r0
	cmp r1, #0
	beq _08084682
	movs r0, #0
	bl GetFaceDispById
	movs r1, #0x10
	orrs r1, r0
	movs r0, #0
	bl SetFaceDispById
_08084682:
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_8084688
sub_8084688: @ 0x08084688
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r4, _080846E0 @ =0x0203E6E4
	adds r0, r4, #0
	bl SpriteText_DrawBackground
	adds r0, r4, #0
	adds r0, #8
	bl SpriteText_DrawBackground
	adds r0, r4, #0
	adds r0, #0x10
	bl SpriteText_DrawBackground
	bl sub_8083BA8
	movs r1, #0x10
	ands r1, r0
	cmp r1, #0
	beq _080846CC
	bl sub_8083BA8
	movs r1, #0x20
	ands r1, r0
	cmp r1, #0
	bne _080846CC
	adds r0, r4, #0
	adds r0, #0x18
	bl SpriteText_DrawBackground
	adds r0, r4, #0
	adds r0, #0x20
	bl SpriteText_DrawBackground
_080846CC:
	adds r0, r5, #0
	adds r0, #0x58
	movs r1, #0
	strb r1, [r0]
	subs r0, #0x10
	strh r1, [r0]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080846E0: .4byte 0x0203E6E4

	thumb_func_start sub_80846E4
sub_80846E4: @ 0x080846E4
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #0x14
	adds r6, r0, #0
	adds r0, #0x4e
	movs r2, #0
	ldrsh r1, [r0, r2]
	mov r8, r1
	ldr r0, _08084718 @ =gpKeySt
	ldr r1, [r0]
	movs r0, #0xf3
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _08084766
	bl sub_8083BA8
	movs r1, #8
	ands r1, r0
	cmp r1, #0
	bne _08084766
	movs r3, #0x80
	mov r8, r3
	b _08084780
	.align 2, 0
_08084718: .4byte gpKeySt
_0808471C:
	bl sub_8084640
	ldr r0, _0808473C @ =gUnk_08D8AFEC
	bl Proc_Find
	movs r1, #1
	bl Proc_Goto
	adds r0, r6, #0
	movs r1, #1
	bl Proc_Goto
	ldr r0, _08084740 @ =gUnk_08D8B124
	bl Proc_EndEach
	b _08084A24
	.align 2, 0
_0808473C: .4byte gUnk_08D8AFEC
_08084740: .4byte gUnk_08D8B124
_08084744:
	adds r1, r6, #0
	adds r1, #0x58
	movs r0, #0
	strb r0, [r1]
	adds r0, r6, #0
	movs r1, #4
	bl Proc_Goto
	b _08084CD2
_08084756:
	adds r0, r6, #0
	bl Proc_Break
	b _08084CD2
_0808475E:
	adds r0, r6, #0
	bl sub_8084688
	b _08084CD2
_08084766:
	adds r1, r6, #0
	adds r1, #0x4a
	ldrh r0, [r1]
	subs r0, #1
	strh r0, [r1]
	lsls r0, r0, #0x10
	cmp r0, #0
	ble _08084778
	b _08084CD8
_08084778:
	adds r0, r6, #0
	adds r0, #0x4c
	ldrh r0, [r0]
	strh r0, [r1]
_08084780:
	bl sub_8084664
	ldr r0, [r6, #0x30]
	bl SetTextFont
	movs r7, #0
	cmp r7, r8
	blt _08084792
	b _08084CD2
_08084792:
	ldr r0, [r6, #0x2c]
	ldrb r1, [r0]
	adds r2, r0, #0
	cmp r1, #0x80
	bls _0808479E
	b _08084C08
_0808479E:
	lsls r0, r1, #2
	ldr r1, _080847A8 @ =_080847AC
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080847A8: .4byte _080847AC
_080847AC: @ jump table
	.4byte _08084ACC @ case 0
	.4byte _08084AD2 @ case 1
	.4byte _08084B4A @ case 2
	.4byte _08084BC4 @ case 3
	.4byte _08084AFA @ case 4
	.4byte _08084B0E @ case 5
	.4byte _08084B22 @ case 6
	.4byte _08084B36 @ case 7
	.4byte _08084C08 @ case 8
	.4byte _08084C08 @ case 9
	.4byte _08084C08 @ case 10
	.4byte _08084C08 @ case 11
	.4byte _08084C08 @ case 12
	.4byte _08084C08 @ case 13
	.4byte _08084C08 @ case 14
	.4byte _08084C08 @ case 15
	.4byte _08084C08 @ case 16
	.4byte _08084C08 @ case 17
	.4byte _08084A5C @ case 18
	.4byte _08084A5C @ case 19
	.4byte _08084A5C @ case 20
	.4byte _08084C08 @ case 21
	.4byte _08084C08 @ case 22
	.4byte _08084C08 @ case 23
	.4byte _080849B0 @ case 24
	.4byte _080849EC @ case 25
	.4byte _08084C08 @ case 26
	.4byte _08084C08 @ case 27
	.4byte _08084C08 @ case 28
	.4byte _08084C08 @ case 29
	.4byte _08084C08 @ case 30
	.4byte _08084C08 @ case 31
	.4byte _08084C08 @ case 32
	.4byte _08084C08 @ case 33
	.4byte _08084C08 @ case 34
	.4byte _08084C08 @ case 35
	.4byte _08084C08 @ case 36
	.4byte _08084C08 @ case 37
	.4byte _08084C08 @ case 38
	.4byte _08084C08 @ case 39
	.4byte _08084C08 @ case 40
	.4byte _08084C08 @ case 41
	.4byte _08084C08 @ case 42
	.4byte _08084C08 @ case 43
	.4byte _08084C08 @ case 44
	.4byte _08084C08 @ case 45
	.4byte _08084C08 @ case 46
	.4byte _08084C08 @ case 47
	.4byte _08084C08 @ case 48
	.4byte _08084C08 @ case 49
	.4byte _08084C08 @ case 50
	.4byte _08084C08 @ case 51
	.4byte _08084C08 @ case 52
	.4byte _08084C08 @ case 53
	.4byte _08084C08 @ case 54
	.4byte _08084C08 @ case 55
	.4byte _08084C08 @ case 56
	.4byte _08084C08 @ case 57
	.4byte _08084C08 @ case 58
	.4byte _08084C08 @ case 59
	.4byte _08084C08 @ case 60
	.4byte _08084C08 @ case 61
	.4byte _08084C08 @ case 62
	.4byte _08084C08 @ case 63
	.4byte _08084C08 @ case 64
	.4byte _08084C08 @ case 65
	.4byte _08084C08 @ case 66
	.4byte _08084C08 @ case 67
	.4byte _08084C08 @ case 68
	.4byte _08084C08 @ case 69
	.4byte _08084C08 @ case 70
	.4byte _08084C08 @ case 71
	.4byte _08084C08 @ case 72
	.4byte _08084C08 @ case 73
	.4byte _08084C08 @ case 74
	.4byte _08084C08 @ case 75
	.4byte _08084C08 @ case 76
	.4byte _08084C08 @ case 77
	.4byte _08084C08 @ case 78
	.4byte _08084C08 @ case 79
	.4byte _08084C08 @ case 80
	.4byte _08084C08 @ case 81
	.4byte _08084C08 @ case 82
	.4byte _08084C08 @ case 83
	.4byte _08084C08 @ case 84
	.4byte _08084C08 @ case 85
	.4byte _08084C08 @ case 86
	.4byte _08084C08 @ case 87
	.4byte _08084C08 @ case 88
	.4byte _08084C08 @ case 89
	.4byte _08084C08 @ case 90
	.4byte _08084C08 @ case 91
	.4byte _08084C08 @ case 92
	.4byte _08084C08 @ case 93
	.4byte _08084C08 @ case 94
	.4byte _08084C08 @ case 95
	.4byte _08084C08 @ case 96
	.4byte _08084C08 @ case 97
	.4byte _08084C08 @ case 98
	.4byte _08084C08 @ case 99
	.4byte _08084C08 @ case 100
	.4byte _08084C08 @ case 101
	.4byte _08084C08 @ case 102
	.4byte _08084C08 @ case 103
	.4byte _08084C08 @ case 104
	.4byte _08084C08 @ case 105
	.4byte _08084C08 @ case 106
	.4byte _08084C08 @ case 107
	.4byte _08084C08 @ case 108
	.4byte _08084C08 @ case 109
	.4byte _08084C08 @ case 110
	.4byte _08084C08 @ case 111
	.4byte _08084C08 @ case 112
	.4byte _08084C08 @ case 113
	.4byte _08084C08 @ case 114
	.4byte _08084C08 @ case 115
	.4byte _08084C08 @ case 116
	.4byte _08084C08 @ case 117
	.4byte _08084C08 @ case 118
	.4byte _08084C08 @ case 119
	.4byte _08084C08 @ case 120
	.4byte _08084C08 @ case 121
	.4byte _08084C08 @ case 122
	.4byte _08084C08 @ case 123
	.4byte _08084C08 @ case 124
	.4byte _08084C08 @ case 125
	.4byte _08084C08 @ case 126
	.4byte _08084C08 @ case 127
	.4byte _08084A34 @ case 128
_080849B0:
	bl sub_8084640
	ldr r0, _080849E4 @ =gUnk_08D8B04C
	bl Proc_Find
	adds r3, r0, #0
	ldr r0, _080849E8 @ =gUnk_08D8AFE4
	adds r1, r6, #0
	adds r1, #0x48
	movs r5, #0
	ldrsh r4, [r1, r5]
	lsls r2, r4, #2
	subs r1, #0x14
	adds r1, r1, r2
	ldr r1, [r1]
	movs r5, #0x3c
	ldrsh r2, [r3, r5]
	movs r5, #0x3e
	ldrsh r3, [r3, r5]
	lsls r4, r4, #4
	adds r3, r3, r4
	movs r4, #6
	str r4, [sp]
	movs r4, #1
	b _08084A1C
	.align 2, 0
_080849E4: .4byte gUnk_08D8B04C
_080849E8: .4byte gUnk_08D8AFE4
_080849EC:
	bl sub_8084640
	ldr r0, _08084A2C @ =gUnk_08D8B04C
	bl Proc_Find
	adds r3, r0, #0
	ldr r0, _08084A30 @ =gUnk_08D8AFE4
	adds r1, r6, #0
	adds r1, #0x48
	movs r2, #0
	ldrsh r4, [r1, r2]
	lsls r2, r4, #2
	subs r1, #0x14
	adds r1, r1, r2
	ldr r1, [r1]
	movs r5, #0x3c
	ldrsh r2, [r3, r5]
	movs r5, #0x3e
	ldrsh r3, [r3, r5]
	lsls r4, r4, #4
	adds r3, r3, r4
	movs r4, #6
	str r4, [sp]
	movs r4, #2
_08084A1C:
	str r4, [sp, #4]
	str r6, [sp, #8]
	bl sub_80894EC
_08084A24:
	ldr r0, [r6, #0x2c]
	adds r0, #1
	str r0, [r6, #0x2c]
	b _08084CD2
	.align 2, 0
_08084A2C: .4byte gUnk_08D8B04C
_08084A30: .4byte gUnk_08D8AFE4
_08084A34:
	adds r0, r2, #1
	str r0, [r6, #0x2c]
	ldrb r0, [r2, #1]
	cmp r0, #0x21
	bne _08084A56
	adds r2, r6, #0
	adds r2, #0x59
	ldrb r0, [r2]
	adds r0, #1
	movs r1, #1
	ands r0, r1
	strb r0, [r2]
	ldr r0, [r6, #0x2c]
	adds r0, #1
	str r0, [r6, #0x2c]
	subs r7, #1
	b _08084CCA
_08084A56:
	cmp r0, #4
	bne _08084A5C
	b _0808471C
_08084A5C:
	ldr r0, _08084AC8 @ =gUnk_08D8B04C
	bl Proc_Find
	adds r4, r0, #0
	bl sub_8084640
	ldr r0, [r6, #0x2c]
	adds r1, r0, #1
	str r1, [r6, #0x2c]
	ldrb r0, [r0, #1]
	cmp r0, #1
	bne _08084A78
	adds r0, r1, #1
	str r0, [r6, #0x2c]
_08084A78:
	cmp r4, #0
	bne _08084A7E
	b _08084CD2
_08084A7E:
	adds r0, r6, #0
	bl sub_8084688
	ldr r0, [r6, #0x2c]
	add r2, sp, #0x10
	add r1, sp, #0xc
	bl sub_80840D8
	ldr r0, [sp, #0xc]
	adds r1, r6, #0
	adds r1, #0x56
	movs r2, #0
	strb r0, [r1]
	ldr r0, [sp, #0x10]
	adds r1, #1
	strb r0, [r1]
	adds r0, r4, #0
	adds r0, #0x44
	ldrh r1, [r0]
	adds r0, r6, #0
	adds r0, #0x54
	strb r1, [r0]
	adds r0, r4, #0
	adds r0, #0x46
	ldrh r0, [r0]
	adds r1, r6, #0
	adds r1, #0x55
	strb r0, [r1]
	adds r0, r6, #0
	adds r0, #0x58
	strb r2, [r0]
	adds r0, r6, #0
	movs r1, #6
	bl Proc_Goto
	b _08084CD2
	.align 2, 0
_08084AC8: .4byte gUnk_08D8B04C
_08084ACC:
	bl sub_8084640
	b _08084B66
_08084AD2:
	bl sub_8084640
	ldr r0, [r6, #0x2c]
	adds r0, #1
	str r0, [r6, #0x2c]
	adds r0, r6, #0
	adds r0, #0x55
	ldrb r1, [r0]
	adds r2, r6, #0
	adds r2, #0x48
	movs r3, #0
	ldrsh r0, [r2, r3]
	adds r0, #1
	cmp r1, r0
	bne _08084AF2
	b _08084744
_08084AF2:
	ldrh r0, [r2]
	adds r0, #1
	strh r0, [r2]
	b _08084CCA
_08084AFA:
	bl sub_8084640
	ldr r0, [r6, #0x2c]
	adds r0, #1
	str r0, [r6, #0x2c]
	adds r1, r6, #0
	adds r1, #0x4a
	movs r0, #8
	strh r0, [r1]
	b _08084CD2
_08084B0E:
	bl sub_8084640
	ldr r0, [r6, #0x2c]
	adds r0, #1
	str r0, [r6, #0x2c]
	adds r1, r6, #0
	adds r1, #0x4a
	movs r0, #0x10
	strh r0, [r1]
	b _08084CD2
_08084B22:
	bl sub_8084640
	ldr r0, [r6, #0x2c]
	adds r0, #1
	str r0, [r6, #0x2c]
	adds r1, r6, #0
	adds r1, #0x4a
	movs r0, #0x20
	strh r0, [r1]
	b _08084CD2
_08084B36:
	bl sub_8084640
	ldr r0, [r6, #0x2c]
	adds r0, #1
	str r0, [r6, #0x2c]
	adds r1, r6, #0
	adds r1, #0x4a
	movs r0, #0x40
	strh r0, [r1]
	b _08084CD2
_08084B4A:
	bl sub_8084640
	ldr r0, [r6, #0x2c]
	adds r1, r0, #1
	str r1, [r6, #0x2c]
	ldrb r0, [r0, #1]
	cmp r0, #1
	bne _08084B5E
	adds r0, r1, #1
	str r0, [r6, #0x2c]
_08084B5E:
	ldr r0, [r6, #0x2c]
	ldrb r0, [r0]
	cmp r0, #0
	bne _08084B98
_08084B66:
	bl sub_8083BA8
	movs r1, #2
	ands r1, r0
	cmp r1, #0
	bne _08084B74
	b _08084756
_08084B74:
	ldr r0, _08084B90 @ =gUnk_08D8AFEC
	bl Proc_Find
	movs r1, #1
	bl Proc_Goto
	adds r0, r6, #0
	movs r1, #1
	bl Proc_Goto
	ldr r0, _08084B94 @ =gUnk_08D8B124
	bl Proc_EndEach
	b _08084CD2
	.align 2, 0
_08084B90: .4byte gUnk_08D8AFEC
_08084B94: .4byte gUnk_08D8B124
_08084B98:
	bl sub_8083BA8
	movs r1, #0x10
	ands r1, r0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	cmp r1, #0
	beq _08084BAA
	b _0808475E
_08084BAA:
	ldr r0, [r6, #0x2c]
	ldrb r0, [r0]
	cmp r0, #0
	bne _08084BB4
	b _08084CD2
_08084BB4:
	adds r0, r6, #0
	adds r0, #0x58
	strb r1, [r0]
	adds r0, r6, #0
	movs r1, #5
	bl Proc_Goto
	b _08084CD2
_08084BC4:
	bl sub_8084640
	ldr r0, [r6, #0x2c]
	adds r0, #1
	str r0, [r6, #0x2c]
	ldr r0, _08084C04 @ =gUnk_08D8B04C
	bl Proc_Find
	movs r5, #0x3c
	ldrsh r1, [r0, r5]
	adds r4, r6, #0
	adds r4, #0x52
	ldrb r2, [r4]
	adds r1, r2, r1
	movs r3, #0x3e
	ldrsh r2, [r0, r3]
	adds r0, r6, #0
	adds r0, #0x48
	movs r5, #0
	ldrsh r0, [r0, r5]
	lsls r0, r0, #4
	adds r2, r2, r0
	adds r2, #8
	adds r0, r6, #0
	bl sub_800914C
	ldr r0, [r6, #0x2c]
	adds r1, r4, #0
	bl sub_8084194
	b _08084CD2
	.align 2, 0
_08084C04: .4byte gUnk_08D8B04C
_08084C08:
	bl sub_8083BA8
	movs r1, #1
	ands r1, r0
	cmp r1, #0
	beq _08084C2E
	adds r5, r6, #0
	adds r5, #0x48
	movs r1, #0
	ldrsh r0, [r5, r1]
	lsls r0, r0, #2
	adds r4, r6, #0
	adds r4, #0x34
	adds r0, r4, r0
	ldr r0, [r0]
	movs r1, #1
	bl Text_SetColor
	b _08084C6A
_08084C2E:
	adds r0, r6, #0
	adds r0, #0x59
	ldrb r0, [r0]
	cmp r0, #0
	beq _08084C52
	adds r5, r6, #0
	adds r5, #0x48
	movs r2, #0
	ldrsh r0, [r5, r2]
	lsls r0, r0, #2
	adds r4, r6, #0
	adds r4, #0x34
	adds r0, r4, r0
	ldr r0, [r0]
	movs r1, #0xa
	bl Text_SetColor
	b _08084C6A
_08084C52:
	adds r5, r6, #0
	adds r5, #0x48
	movs r3, #0
	ldrsh r0, [r5, r3]
	lsls r0, r0, #2
	adds r4, r6, #0
	adds r4, #0x34
	adds r0, r4, r0
	ldr r0, [r0]
	movs r1, #6
	bl Text_SetColor
_08084C6A:
	movs r1, #0
	ldrsh r0, [r5, r1]
	lsls r0, r0, #2
	adds r0, r4, r0
	ldr r0, [r0]
	ldr r1, [r6, #0x2c]
	bl Text_DrawCharacter
	str r0, [r6, #0x2c]
	bl GetTextPrintDelay
	adds r4, r0, #0
	cmp r4, #1
	bne _08084C90
	bl GetGameTime
	ands r0, r4
	cmp r0, #0
	beq _08084CCA
_08084C90:
	bl sub_8083BA8
	movs r1, #0x10
	ands r1, r0
	cmp r1, #0
	beq _08084CB8
	ldr r0, _08084CB0 @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08084CCA
	ldr r0, _08084CB4 @ =0x000002E5
	bl m4aSongNumStart
	b _08084CCA
	.align 2, 0
_08084CB0: .4byte gPlaySt
_08084CB4: .4byte 0x000002E5
_08084CB8:
	ldr r0, _08084CE4 @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08084CCA
	ldr r0, _08084CE8 @ =0x0000038E
	bl m4aSongNumStart
_08084CCA:
	adds r7, #1
	cmp r7, r8
	bge _08084CD2
	b _08084792
_08084CD2:
	movs r0, #0
	bl SetTextFont
_08084CD8:
	add sp, #0x14
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08084CE4: .4byte gPlaySt
_08084CE8: .4byte 0x0000038E

	thumb_func_start sub_8084CEC
sub_8084CEC: @ 0x08084CEC
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08084D14 @ =gUnk_08D8B124
	bl Proc_Find
	cmp r0, #0
	beq _08084D0E
	ldr r0, _08084D18 @ =gUnk_08D8AFEC
	bl Proc_Find
	movs r1, #0
	bl Proc_Goto
	adds r0, r4, #0
	movs r1, #0
	bl Proc_Goto
_08084D0E:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08084D14: .4byte gUnk_08D8B124
_08084D18: .4byte gUnk_08D8AFEC

	thumb_func_start sub_8084D1C
sub_8084D1C: @ 0x08084D1C
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x54
	ldrb r0, [r0]
	adds r0, #1
	adds r1, r4, #0
	adds r1, #0x55
	ldrb r1, [r1]
	bl sub_8083BB4
	adds r1, r4, #0
	adds r1, #0x58
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x10
	bne _08084D5C
	adds r0, r4, #0
	adds r0, #0x48
	movs r1, #0
	ldrsh r0, [r0, r1]
	lsls r0, r0, #3
	ldr r1, _08084D64 @ =0x0203E6E4
	adds r0, r0, r1
	movs r1, #0
	bl Text_SetCursor
	adds r0, r4, #0
	bl Proc_Break
_08084D5C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08084D64: .4byte 0x0203E6E4

	thumb_func_start sub_8084D68
sub_8084D68: @ 0x08084D68
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x48
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	bne _08084D7E
	adds r0, r4, #0
	bl Proc_Break
	b _08084D86
_08084D7E:
	adds r0, r4, #0
	movs r1, #5
	bl Proc_Goto
_08084D86:
	adds r1, r4, #0
	adds r1, #0x48
	ldrh r2, [r1]
	movs r3, #0
	ldrsh r0, [r1, r3]
	cmp r0, #0
	beq _08084D98
	subs r0, r2, #1
	strh r0, [r1]
_08084D98:
	adds r1, r4, #0
	adds r1, #0x58
	movs r0, #0
	strb r0, [r1]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_8084DA8
sub_8084DA8: @ 0x08084DA8
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08084DD0 @ =gUnk_08D8AFEC
	bl Proc_Find
	movs r1, #3
	bl Proc_Goto
	adds r0, r4, #0
	bl Proc_Break
	movs r0, #0
	bl SetTextFont
	movs r0, #0
	bl SetTextFontGlyphs
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08084DD0: .4byte gUnk_08D8AFEC

	thumb_func_start sub_8084DD4
sub_8084DD4: @ 0x08084DD4
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	ldr r0, _08084E64 @ =gUnk_08D8B04C
	bl Proc_Find
	adds r6, r0, #0
	adds r5, r4, #0
	adds r5, #0x58
	ldrb r0, [r5]
	adds r0, #1
	strb r0, [r5]
	cmp r6, #0
	beq _08084E2C
	adds r0, r4, #0
	adds r0, #0x54
	ldrb r3, [r5]
	movs r2, #2
	subs r2, r2, r3
	ldrb r0, [r0]
	adds r1, r0, #0
	muls r1, r2, r1
	adds r0, r4, #0
	adds r0, #0x56
	ldrb r0, [r0]
	muls r0, r3, r0
	adds r1, r1, r0
	lsrs r0, r1, #0x1f
	adds r1, r1, r0
	asrs r1, r1, #1
	adds r0, r4, #0
	adds r0, #0x55
	ldrb r0, [r0]
	muls r2, r0, r2
	adds r0, r4, #0
	adds r0, #0x57
	ldrb r0, [r0]
	muls r0, r3, r0
	adds r2, r2, r0
	lsrs r0, r2, #0x1f
	adds r2, r2, r0
	asrs r2, r2, #1
	adds r0, r6, #0
	bl sub_8083E34
_08084E2C:
	ldrb r5, [r5]
	cmp r5, #2
	bne _08084E5C
	adds r0, r4, #0
	adds r0, #0x56
	ldrb r0, [r0]
	lsrs r0, r0, #3
	adds r1, r4, #0
	adds r1, #0x54
	strb r0, [r1]
	adds r0, r4, #0
	adds r0, #0x57
	ldrb r0, [r0]
	lsrs r0, r0, #4
	adds r1, r0, #0
	cmp r0, #5
	bls _08084E50
	movs r1, #5
_08084E50:
	adds r0, r4, #0
	adds r0, #0x55
	strb r1, [r0]
	adds r0, r4, #0
	bl Proc_Break
_08084E5C:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08084E64: .4byte gUnk_08D8B04C

	thumb_func_start sub_8084E68
sub_8084E68: @ 0x08084E68
	push {lr}
	ldr r0, _08084E80 @ =gUnk_08D8AFEC
	bl Proc_Find
	cmp r0, #0
	beq _08084E84
	adds r0, #0x38
	ldrb r0, [r0]
	cmp r0, #0
	bne _08084E84
	movs r0, #0
	b _08084E86
	.align 2, 0
_08084E80: .4byte gUnk_08D8AFEC
_08084E84:
	movs r0, #1
_08084E86:
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_8084E8C
sub_8084E8C: @ 0x08084E8C
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r4, _08084EFC @ =0x0203E6CC
	adds r0, r4, #0
	bl SetTextFont
	movs r0, #0
	bl SetTextFontGlyphs
	movs r0, #1
	bl SetTextFontGlyphs
	bl sub_8083BA8
	movs r1, #1
	ands r1, r0
	cmp r1, #0
	bne _08084F00
	adds r0, r4, #0
	adds r0, #0x18
	movs r1, #6
	bl Text_SetColor
	adds r0, r4, #0
	adds r0, #0x20
	movs r1, #6
	bl Text_SetColor
	adds r0, r4, #0
	adds r0, #0x28
	movs r1, #6
	bl Text_SetColor
	bl sub_8083BA8
	movs r1, #0x10
	ands r1, r0
	cmp r1, #0
	beq _08084F1E
	bl sub_8083BA8
	movs r1, #0x20
	ands r1, r0
	cmp r1, #0
	bne _08084F1E
	adds r0, r4, #0
	adds r0, #0x30
	movs r1, #6
	bl Text_SetColor
	adds r0, r4, #0
	adds r0, #0x38
	movs r1, #6
	bl Text_SetColor
	b _08084F1E
	.align 2, 0
_08084EFC: .4byte 0x0203E6CC
_08084F00:
	movs r4, #0
	b _08084F12
_08084F04:
	lsls r0, r4, #3
	ldr r1, _08084F9C @ =0x0203E6E4
	adds r0, r0, r1
	movs r1, #0
	bl Text_SetColor
	adds r4, #1
_08084F12:
	bl sub_8083BA8
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x18
	cmp r4, r0
	blt _08084F04
_08084F1E:
	movs r0, #0
	bl SetTextFont
	ldr r4, _08084FA0 @ =gUnk_08D8B06C
	adds r0, r4, #0
	bl Proc_EndEach
	adds r0, r4, #0
	movs r1, #3
	bl Proc_Start
	adds r4, r0, #0
	ldr r1, _08084FA4 @ =0x0203E6CC
	str r1, [r4, #0x30]
	adds r0, r1, #0
	adds r0, #0x18
	str r0, [r4, #0x34]
	adds r0, #8
	str r0, [r4, #0x38]
	adds r0, #8
	str r0, [r4, #0x3c]
	adds r0, #8
	str r0, [r4, #0x40]
	adds r0, #8
	str r0, [r4, #0x44]
	adds r1, r4, #0
	adds r1, #0x48
	movs r0, #0
	strh r0, [r1]
	ldr r0, [r5, #0x5c]
	bl DecodeMsg
	bl sub_8013374
	str r0, [r4, #0x2c]
	ldr r1, [r5, #0x2c]
	adds r0, r4, #0
	adds r0, #0x54
	strb r1, [r0]
	ldr r0, [r5, #0x30]
	adds r1, r4, #0
	adds r1, #0x55
	strb r0, [r1]
	bl sub_8084E68
	lsls r0, r0, #0x18
	asrs r1, r0, #0x18
	cmp r1, #0
	beq _08084FA8
	bl GetTextPrintDelay
	adds r1, r4, #0
	adds r1, #0x4c
	strh r0, [r1]
	lsls r0, r0, #0x10
	movs r1, #0x80
	cmp r0, #0
	beq _08084F94
	movs r1, #1
_08084F94:
	adds r0, r4, #0
	adds r0, #0x4e
	strh r1, [r0]
	b _08084FB6
	.align 2, 0
_08084F9C: .4byte 0x0203E6E4
_08084FA0: .4byte gUnk_08D8B06C
_08084FA4: .4byte 0x0203E6CC
_08084FA8:
	adds r0, r4, #0
	adds r0, #0x4c
	strh r1, [r0]
	adds r1, r4, #0
	adds r1, #0x4e
	movs r0, #0x80
	strh r0, [r1]
_08084FB6:
	adds r1, r4, #0
	adds r1, #0x4a
	movs r0, #0
	strh r0, [r1]
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start sub_8084FC4
sub_8084FC4: @ 0x08084FC4
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r6, r2, #0
	ldr r0, _08084FF8 @ =gUnk_08D8B10C
	movs r1, #3
	bl Proc_Start
	adds r1, r0, #0
	str r4, [r1, #0x5c]
	cmp r5, #0
	bge _08084FDE
	adds r5, #7
_08084FDE:
	asrs r0, r5, #3
	str r0, [r1, #0x2c]
	adds r0, r6, #0
	cmp r6, #0
	bge _08084FEA
	adds r0, #0xf
_08084FEA:
	asrs r0, r0, #4
	cmp r0, #5
	bgt _08084FFC
	cmp r0, #0
	bge _08084FFE
	movs r0, #0
	b _08084FFE
	.align 2, 0
_08084FF8: .4byte gUnk_08D8B10C
_08084FFC:
	movs r0, #5
_08084FFE:
	str r0, [r1, #0x30]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_8085008
sub_8085008: @ 0x08085008
	push {r4, lr}
	ldr r4, _08085060 @ =0x0203E6CC
	adds r0, r4, #0
	bl SetTextFont
	bl sub_8083BA8
	movs r1, #1
	ands r1, r0
	cmp r1, #0
	bne _08085064
	adds r0, r4, #0
	adds r0, #0x18
	bl SpriteText_DrawBackground
	adds r0, r4, #0
	adds r0, #0x20
	bl SpriteText_DrawBackground
	adds r0, r4, #0
	adds r0, #0x28
	bl SpriteText_DrawBackground
	bl sub_8083BA8
	movs r1, #0x10
	ands r1, r0
	cmp r1, #0
	beq _08085082
	bl sub_8083BA8
	movs r1, #0x20
	ands r1, r0
	cmp r1, #0
	bne _08085082
	adds r0, r4, #0
	adds r0, #0x30
	bl SpriteText_DrawBackground
	adds r0, r4, #0
	adds r0, #0x38
	bl SpriteText_DrawBackground
	b _08085082
	.align 2, 0
_08085060: .4byte 0x0203E6CC
_08085064:
	movs r4, #0
	b _08085076
_08085068:
	lsls r0, r4, #3
	ldr r1, _0808509C @ =0x0203E6E4
	adds r0, r0, r1
	movs r1, #0
	bl SpriteText_DrawBackgroundExt
	adds r4, #1
_08085076:
	bl sub_8083BA8
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x18
	cmp r4, r0
	blt _08085068
_08085082:
	ldr r0, _080850A0 @ =gUnk_08D8B06C
	bl Proc_EndEach
	ldr r0, _080850A4 @ =gUnk_08D8B10C
	bl Proc_EndEach
	movs r0, #0
	bl SetTextFont
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0808509C: .4byte 0x0203E6E4
_080850A0: .4byte gUnk_08D8B06C
_080850A4: .4byte gUnk_08D8B10C

	thumb_func_start sub_80850A8
sub_80850A8: @ 0x080850A8
	push {lr}
	ldr r0, _080850B8 @ =gUnk_08D8B124
	movs r1, #0
	bl Proc_Start
	pop {r0}
	bx r0
	.align 2, 0
_080850B8: .4byte gUnk_08D8B124

	thumb_func_start sub_80850BC
sub_80850BC: @ 0x080850BC
	push {lr}
	ldr r0, _080850CC @ =gUnk_08D8B124
	bl Proc_Find
	cmp r0, #0
	bne _080850D0
	movs r0, #0
	b _080850D2
	.align 2, 0
_080850CC: .4byte gUnk_08D8B124
_080850D0:
	movs r0, #1
_080850D2:
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_80850D8
sub_80850D8: @ 0x080850D8
	push {lr}
	ldr r0, _080850FC @ =gUnk_08D8AFEC
	bl Proc_EndEach
	ldr r0, _08085100 @ =gUnk_08D8B124
	bl Proc_EndEach
	ldr r0, _08085104 @ =gUnk_08D8B04C
	bl Proc_EndEach
	ldr r0, _08085108 @ =gUnk_08D8B06C
	bl Proc_EndEach
	ldr r0, _0808510C @ =gUnk_08D8B10C
	bl Proc_EndEach
	pop {r0}
	bx r0
	.align 2, 0
_080850FC: .4byte gUnk_08D8AFEC
_08085100: .4byte gUnk_08D8B124
_08085104: .4byte gUnk_08D8B04C
_08085108: .4byte gUnk_08D8B06C
_0808510C: .4byte gUnk_08D8B10C

	thumb_func_start sub_8085110
sub_8085110: @ 0x08085110
	cmp r0, #0
	bge _08085120
	cmp r1, #0
	bge _0808511C
	movs r0, #0
	b _0808512A
_0808511C:
	movs r0, #1
	b _0808512A
_08085120:
	cmp r1, #0
	blt _08085128
	movs r0, #3
	b _0808512A
_08085128:
	movs r0, #2
_0808512A:
	bx lr

	thumb_func_start sub_808512C
sub_808512C: @ 0x0808512C
	push {r4, lr}
	ldr r2, _08085158 @ =gBmSt
	movs r0, #0x14
	ldrsh r3, [r2, r0]
	lsls r3, r3, #4
	movs r1, #0xc
	ldrsh r0, [r2, r1]
	subs r0, #8
	subs r3, r3, r0
	movs r4, #0x16
	ldrsh r1, [r2, r4]
	lsls r1, r1, #4
	movs r4, #0xe
	ldrsh r0, [r2, r4]
	subs r0, #8
	subs r1, r1, r0
	cmp r3, #0x78
	bgt _0808515C
	cmp r1, #0x50
	bgt _08085164
	movs r0, #0
	b _0808516A
	.align 2, 0
_08085158: .4byte gBmSt
_0808515C:
	cmp r1, #0x50
	bgt _08085168
	movs r0, #1
	b _0808516A
_08085164:
	movs r0, #2
	b _0808516A
_08085168:
	movs r0, #3
_0808516A:
	pop {r4}
	pop {r1}
	bx r1

	thumb_func_start sub_8085170
sub_8085170: @ 0x08085170
	adds r3, r0, #0
	lsls r1, r1, #0x10
	lsrs r0, r1, #0x10
	asrs r1, r1, #0x10
	cmp r1, #5
	ble _0808517E
	movs r0, #5
_0808517E:
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	adds r0, r0, r2
	strh r0, [r3]
	bx lr

	thumb_func_start sub_8085188
sub_8085188: @ 0x08085188
	push {r4, r5, lr}
	adds r3, r0, #0
	lsls r1, r1, #0x10
	asrs r4, r1, #0x13
	movs r0, #0xe0
	lsls r0, r0, #0xb
	ands r0, r1
	asrs r0, r0, #0x10
	movs r1, #0
	adds r5, r2, #0
	adds r5, #0xe
	adds r2, #6
	adds r0, r2, r0
_080851A2:
	cmp r1, r4
	bge _080851AA
	strh r5, [r3]
	b _080851B4
_080851AA:
	cmp r1, r4
	bne _080851B2
	strh r0, [r3]
	b _080851B4
_080851B2:
	strh r2, [r3]
_080851B4:
	adds r3, #2
	adds r1, #1
	cmp r1, #3
	ble _080851A2
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_80851C4
sub_80851C4: @ 0x080851C4
	push {r4, lr}
	adds r4, r0, #0
	lsls r1, r1, #0x10
	lsrs r3, r1, #0x10
	asrs r1, r1, #0x10
	cmp r1, #4
	ble _080851D4
	movs r3, #5
_080851D4:
	lsls r0, r3, #0x10
	cmp r0, #0
	bge _080851DC
	movs r3, #0
_080851DC:
	adds r1, r2, #0
	adds r1, #0xf
	lsls r0, r3, #0x10
	asrs r0, r0, #0x10
	adds r0, r0, r1
	strh r0, [r4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_80851F0
sub_80851F0: @ 0x080851F0
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	adds r5, r0, #0
	adds r6, r1, #0
	mov r8, r2
	adds r0, r6, #0
	bl GetUnitCurrentHp
	movs r1, #0x2a
	adds r4, r0, #0
	muls r4, r1, r4
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	adds r0, r6, #0
	bl GetUnitMaxHp
	adds r1, r0, #0
	adds r0, r4, #0
	bl Div
	adds r4, r0, #0
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	adds r0, r5, #0
	adds r1, r4, #0
	mov r2, r8
	bl sub_8085170
	adds r0, r5, #2
	subs r1, r4, #5
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	mov r2, r8
	bl sub_8085188
	adds r5, #0xa
	subs r4, #0x25
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	adds r0, r5, #0
	adds r1, r4, #0
	mov r2, r8
	bl sub_80851C4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	thumb_func_start sub_8085254
sub_8085254: @ 0x08085254
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r7, r0, #0
	ldr r1, _080852A0 @ =gUnk_08D8B134
	adds r0, #0x50
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r0, r0, #3
	adds r1, r0, r1
	movs r0, #3
	ldrsb r0, [r1, r0]
	movs r4, #0
	cmp r0, #0
	blt _08085276
	movs r4, #0xe
_08085276:
	movs r0, #2
	ldrsb r0, [r1, r0]
	cmp r0, #0
	bge _080852AC
	lsls r5, r4, #5
	lsls r4, r4, #6
	ldr r0, _080852A4 @ =gBg0Tm
	adds r0, r4, r0
	movs r1, #0xc
	movs r2, #6
	movs r3, #0
	bl TmFillRect_thm
	ldr r0, _080852A8 @ =gBg1Tm
	adds r0, r4, r0
	movs r1, #0xc
	movs r2, #6
	movs r3, #0
	bl TmFillRect_thm
	b _080852CC
	.align 2, 0
_080852A0: .4byte gUnk_08D8B134
_080852A4: .4byte gBg0Tm
_080852A8: .4byte gBg1Tm
_080852AC:
	lsls r5, r4, #5
	lsls r4, r4, #6
	ldr r0, _08085324 @ =gBg0Tm + 0x24
	adds r0, r4, r0
	movs r1, #0xc
	movs r2, #6
	movs r3, #0
	bl TmFillRect_thm
	ldr r0, _08085328 @ =gBg1Tm + 0x24
	adds r0, r4, r0
	movs r1, #0xc
	movs r2, #6
	movs r3, #0
	bl TmFillRect_thm
_080852CC:
	mov r8, r5
	adds r6, r4, #0
	movs r0, #3
	bl EnableBgSync
	ldr r1, _0808532C @ =gUnk_08D8B190
	ldr r0, [r7, #0x58]
	adds r0, r0, r1
	movs r5, #0
	ldrsb r5, [r0, r5]
	ldr r1, _08085330 @ =gUnk_08D8B134
	adds r0, r7, #0
	adds r0, #0x50
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r0, r0, #3
	adds r0, r0, r1
	ldrb r0, [r0, #2]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bge _08085344
	movs r4, #0xc
	subs r4, r4, r5
	lsls r4, r4, #1
	ldr r0, _08085334 @ =gUiTmScratchA
	adds r0, r4, r0
	ldr r1, _08085338 @ =gBg0Tm
	adds r1, r6, r1
	adds r2, r5, #0
	movs r3, #6
	bl TmCopyRect_thm
	ldr r0, _0808533C @ =gUiTmScratchB
	adds r4, r4, r0
	ldr r1, _08085340 @ =gBg1Tm
	adds r1, r6, r1
	adds r0, r4, #0
	adds r2, r5, #0
	movs r3, #6
	bl TmCopyRect_thm
	b _0808536A
	.align 2, 0
_08085324: .4byte gBg0Tm + 0x24
_08085328: .4byte gBg1Tm + 0x24
_0808532C: .4byte gUnk_08D8B190
_08085330: .4byte gUnk_08D8B134
_08085334: .4byte gUiTmScratchA
_08085338: .4byte gBg0Tm
_0808533C: .4byte gUiTmScratchB
_08085340: .4byte gBg1Tm
_08085344:
	ldr r0, _080853B4 @ =gUiTmScratchA
	mov r4, r8
	adds r4, #0x1e
	subs r4, r4, r5
	lsls r4, r4, #1
	ldr r1, _080853B8 @ =gBg0Tm
	adds r1, r4, r1
	adds r2, r5, #0
	movs r3, #6
	bl TmCopyRect_thm
	ldr r0, _080853BC @ =gUiTmScratchB
	ldr r1, _080853C0 @ =gBg1Tm
	adds r4, r4, r1
	adds r1, r4, #0
	adds r2, r5, #0
	movs r3, #6
	bl TmCopyRect_thm
_0808536A:
	ldr r0, [r7, #0x58]
	adds r0, #1
	str r0, [r7, #0x58]
	cmp r0, #4
	bne _080853A8
	adds r1, r7, #0
	adds r1, #0x55
	movs r0, #0
	strb r0, [r1]
	str r0, [r7, #0x58]
	adds r0, r7, #0
	bl Proc_Break
	ldr r2, _080853C4 @ =gBmSt
	movs r1, #0x16
	ldrsh r0, [r2, r1]
	ldr r1, _080853C8 @ =gBmMapUnit
	ldr r1, [r1]
	lsls r0, r0, #2
	adds r0, r0, r1
	movs r3, #0x14
	ldrsh r1, [r2, r3]
	ldr r0, [r0]
	adds r0, r0, r1
	ldrb r0, [r0]
	bl GetUnit
	adds r1, r0, #0
	adds r0, r7, #0
	bl sub_80859B0
_080853A8:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080853B4: .4byte gUiTmScratchA
_080853B8: .4byte gBg0Tm
_080853BC: .4byte gUiTmScratchB
_080853C0: .4byte gBg1Tm
_080853C4: .4byte gBmSt
_080853C8: .4byte gBmMapUnit

	thumb_func_start sub_80853CC
sub_80853CC: @ 0x080853CC
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r6, r0, #0
	ldr r3, _0808542C @ =gUnk_08D8B134
	adds r2, r6, #0
	adds r2, #0x50
	movs r0, #0
	ldrsb r0, [r2, r0]
	lsls r0, r0, #3
	adds r0, r0, r3
	ldrb r0, [r0, #3]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	movs r4, #0
	cmp r0, #0
	blt _080853F0
	movs r4, #0xe
_080853F0:
	adds r1, r6, #0
	adds r1, #0x55
	movs r0, #1
	strb r0, [r1]
	movs r0, #0
	ldrsb r0, [r2, r0]
	lsls r0, r0, #3
	adds r0, r0, r3
	ldrb r0, [r0, #2]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bge _08085438
	lsls r5, r4, #5
	lsls r4, r4, #6
	ldr r0, _08085430 @ =gBg0Tm
	adds r0, r4, r0
	movs r1, #0xc
	movs r2, #6
	movs r3, #0
	bl TmFillRect_thm
	ldr r0, _08085434 @ =gBg1Tm
	adds r0, r4, r0
	movs r1, #0xc
	movs r2, #6
	movs r3, #0
	bl TmFillRect_thm
	b _08085458
	.align 2, 0
_0808542C: .4byte gUnk_08D8B134
_08085430: .4byte gBg0Tm
_08085434: .4byte gBg1Tm
_08085438:
	lsls r5, r4, #5
	lsls r4, r4, #6
	ldr r0, _080854B0 @ =gBg0Tm + 0x24
	adds r0, r4, r0
	movs r1, #0xc
	movs r2, #6
	movs r3, #0
	bl TmFillRect_thm
	ldr r0, _080854B4 @ =gBg1Tm + 0x24
	adds r0, r4, r0
	movs r1, #0xc
	movs r2, #6
	movs r3, #0
	bl TmFillRect_thm
_08085458:
	mov r8, r5
	adds r7, r4, #0
	movs r0, #3
	bl EnableBgSync
	ldr r1, _080854B8 @ =gUnk_08D8B194
	ldr r0, [r6, #0x58]
	adds r0, r0, r1
	movs r5, #0
	ldrsb r5, [r0, r5]
	ldr r1, _080854BC @ =gUnk_08D8B134
	adds r0, r6, #0
	adds r0, #0x50
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r0, r0, #3
	adds r0, r0, r1
	ldrb r0, [r0, #2]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bge _080854D0
	movs r4, #0xc
	subs r4, r4, r5
	lsls r4, r4, #1
	ldr r0, _080854C0 @ =gUiTmScratchA
	adds r0, r4, r0
	ldr r1, _080854C4 @ =gBg0Tm
	adds r1, r7, r1
	adds r2, r5, #0
	movs r3, #6
	bl TmCopyRect_thm
	ldr r0, _080854C8 @ =gUiTmScratchB
	adds r4, r4, r0
	ldr r1, _080854CC @ =gBg1Tm
	adds r1, r7, r1
	adds r0, r4, #0
	adds r2, r5, #0
	movs r3, #6
	bl TmCopyRect_thm
	b _080854F6
	.align 2, 0
_080854B0: .4byte gBg0Tm + 0x24
_080854B4: .4byte gBg1Tm + 0x24
_080854B8: .4byte gUnk_08D8B194
_080854BC: .4byte gUnk_08D8B134
_080854C0: .4byte gUiTmScratchA
_080854C4: .4byte gBg0Tm
_080854C8: .4byte gUiTmScratchB
_080854CC: .4byte gBg1Tm
_080854D0:
	ldr r0, _08085520 @ =gUiTmScratchA
	mov r4, r8
	adds r4, #0x1e
	subs r4, r4, r5
	lsls r4, r4, #1
	ldr r1, _08085524 @ =gBg0Tm
	adds r1, r4, r1
	adds r2, r5, #0
	movs r3, #6
	bl TmCopyRect_thm
	ldr r0, _08085528 @ =gUiTmScratchB
	ldr r1, _0808552C @ =gBg1Tm
	adds r4, r4, r1
	adds r1, r4, #0
	adds r2, r5, #0
	movs r3, #6
	bl TmCopyRect_thm
_080854F6:
	ldr r0, [r6, #0x58]
	adds r0, #1
	str r0, [r6, #0x58]
	cmp r0, #3
	bne _08085516
	adds r1, r6, #0
	adds r1, #0x56
	movs r0, #0
	strb r0, [r1]
	str r0, [r6, #0x58]
	adds r1, #1
	movs r0, #0xff
	strb r0, [r1]
	adds r0, r6, #0
	bl Proc_Break
_08085516:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08085520: .4byte gUiTmScratchA
_08085524: .4byte gBg0Tm
_08085528: .4byte gUiTmScratchB
_0808552C: .4byte gBg1Tm

	thumb_func_start sub_8085530
sub_8085530: @ 0x08085530
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	ldr r1, _08085568 @ =gUnk_08D8B134
	adds r0, #0x50
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r0, r0, #3
	adds r0, r0, r1
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bge _08085574
	ldr r0, _0808556C @ =gBg0Tm + 0x340
	movs r1, #6
	movs r2, #7
	movs r3, #0
	bl TmFillRect_thm
	ldr r0, _08085570 @ =gBg1Tm + 0x340
	movs r1, #6
	movs r2, #7
	movs r3, #0
	bl TmFillRect_thm
	b _0808558C
	.align 2, 0
_08085568: .4byte gUnk_08D8B134
_0808556C: .4byte gBg0Tm + 0x340
_08085570: .4byte gBg1Tm + 0x340
_08085574:
	ldr r0, _080855E0 @ =gBg0Tm + 0x370
	movs r1, #6
	movs r2, #7
	movs r3, #0
	bl TmFillRect_thm
	ldr r0, _080855E4 @ =gBg1Tm + 0x370
	movs r1, #6
	movs r2, #7
	movs r3, #0
	bl TmFillRect_thm
_0808558C:
	movs r0, #3
	bl EnableBgSync
	ldr r1, _080855E8 @ =gUnk_08D8B197
	ldr r0, [r6, #0x58]
	adds r0, r0, r1
	movs r5, #0
	ldrsb r5, [r0, r5]
	ldr r1, _080855EC @ =gUnk_08D8B134
	adds r0, r6, #0
	adds r0, #0x50
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r0, r0, #3
	adds r0, r0, r1
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bge _08085600
	movs r4, #0xa3
	lsls r4, r4, #1
	subs r4, r4, r5
	lsls r4, r4, #1
	ldr r0, _080855F0 @ =gUiTmScratchA
	adds r0, r4, r0
	ldr r1, _080855F4 @ =gBg0Tm + 0x340
	adds r2, r5, #0
	movs r3, #7
	bl TmCopyRect_thm
	ldr r0, _080855F8 @ =gUiTmScratchB
	adds r4, r4, r0
	ldr r1, _080855FC @ =gBg1Tm + 0x340
	adds r0, r4, #0
	adds r2, r5, #0
	movs r3, #7
	bl TmCopyRect_thm
	b _08085626
	.align 2, 0
_080855E0: .4byte gBg0Tm + 0x370
_080855E4: .4byte gBg1Tm + 0x370
_080855E8: .4byte gUnk_08D8B197
_080855EC: .4byte gUnk_08D8B134
_080855F0: .4byte gUiTmScratchA
_080855F4: .4byte gBg0Tm + 0x340
_080855F8: .4byte gUiTmScratchB
_080855FC: .4byte gBg1Tm + 0x340
_08085600:
	ldr r0, _08085648 @ =0x020034BC
	movs r4, #0xdf
	lsls r4, r4, #1
	subs r4, r4, r5
	lsls r4, r4, #1
	ldr r1, _0808564C @ =gBg0Tm
	adds r1, r4, r1
	adds r2, r5, #0
	movs r3, #7
	bl TmCopyRect_thm
	ldr r0, _08085650 @ =0x020039BC
	ldr r1, _08085654 @ =gBg1Tm
	adds r4, r4, r1
	adds r1, r4, #0
	adds r2, r5, #0
	movs r3, #7
	bl TmCopyRect_thm
_08085626:
	ldr r0, [r6, #0x58]
	adds r0, #1
	str r0, [r6, #0x58]
	cmp r0, #3
	bne _08085640
	movs r0, #0
	str r0, [r6, #0x58]
	adds r1, r6, #0
	adds r1, #0x55
	strb r0, [r1]
	adds r0, r6, #0
	bl Proc_Break
_08085640:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08085648: .4byte 0x020034BC
_0808564C: .4byte gBg0Tm
_08085650: .4byte 0x020039BC
_08085654: .4byte gBg1Tm

	thumb_func_start sub_8085658
sub_8085658: @ 0x08085658
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	adds r1, r6, #0
	adds r1, #0x55
	movs r0, #1
	strb r0, [r1]
	ldr r1, _08085698 @ =gUnk_08D8B134
	adds r0, r6, #0
	adds r0, #0x50
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r0, r0, #3
	adds r0, r0, r1
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bge _080856A4
	ldr r0, _0808569C @ =gBg0Tm + 0x340
	movs r1, #6
	movs r2, #7
	movs r3, #0
	bl TmFillRect_thm
	ldr r0, _080856A0 @ =gBg1Tm + 0x340
	movs r1, #6
	movs r2, #7
	movs r3, #0
	bl TmFillRect_thm
	b _080856BC
	.align 2, 0
_08085698: .4byte gUnk_08D8B134
_0808569C: .4byte gBg0Tm + 0x340
_080856A0: .4byte gBg1Tm + 0x340
_080856A4:
	ldr r0, _08085710 @ =gBg0Tm + 0x370
	movs r1, #6
	movs r2, #7
	movs r3, #0
	bl TmFillRect_thm
	ldr r0, _08085714 @ =gBg1Tm + 0x370
	movs r1, #6
	movs r2, #7
	movs r3, #0
	bl TmFillRect_thm
_080856BC:
	movs r0, #3
	bl EnableBgSync
	ldr r1, _08085718 @ =gUnk_08D8B19A
	ldr r0, [r6, #0x58]
	adds r0, r0, r1
	movs r5, #0
	ldrsb r5, [r0, r5]
	ldr r1, _0808571C @ =gUnk_08D8B134
	adds r0, r6, #0
	adds r0, #0x50
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r0, r0, #3
	adds r0, r0, r1
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bge _08085730
	movs r4, #0xa3
	lsls r4, r4, #1
	subs r4, r4, r5
	lsls r4, r4, #1
	ldr r0, _08085720 @ =gUiTmScratchA
	adds r0, r4, r0
	ldr r1, _08085724 @ =gBg0Tm + 0x340
	adds r2, r5, #0
	movs r3, #7
	bl TmCopyRect_thm
	ldr r0, _08085728 @ =gUiTmScratchB
	adds r4, r4, r0
	ldr r1, _0808572C @ =gBg1Tm + 0x340
	adds r0, r4, #0
	adds r2, r5, #0
	movs r3, #7
	bl TmCopyRect_thm
	b _08085756
	.align 2, 0
_08085710: .4byte gBg0Tm + 0x370
_08085714: .4byte gBg1Tm + 0x370
_08085718: .4byte gUnk_08D8B19A
_0808571C: .4byte gUnk_08D8B134
_08085720: .4byte gUiTmScratchA
_08085724: .4byte gBg0Tm + 0x340
_08085728: .4byte gUiTmScratchB
_0808572C: .4byte gBg1Tm + 0x340
_08085730:
	ldr r0, _0808577C @ =0x020034BC
	movs r4, #0xdf
	lsls r4, r4, #1
	subs r4, r4, r5
	lsls r4, r4, #1
	ldr r1, _08085780 @ =gBg0Tm
	adds r1, r4, r1
	adds r2, r5, #0
	movs r3, #7
	bl TmCopyRect_thm
	ldr r0, _08085784 @ =0x020039BC
	ldr r1, _08085788 @ =gBg1Tm
	adds r4, r4, r1
	adds r1, r4, #0
	adds r2, r5, #0
	movs r3, #7
	bl TmCopyRect_thm
_08085756:
	ldr r0, [r6, #0x58]
	adds r0, #1
	str r0, [r6, #0x58]
	cmp r0, #3
	bne _08085774
	movs r0, #0
	str r0, [r6, #0x58]
	adds r1, r6, #0
	adds r1, #0x55
	strb r0, [r1]
	adds r1, #1
	strb r0, [r1]
	adds r0, r6, #0
	bl Proc_Break
_08085774:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0808577C: .4byte 0x020034BC
_08085780: .4byte gBg0Tm
_08085784: .4byte 0x020039BC
_08085788: .4byte gBg1Tm

	thumb_func_start sub_808578C
sub_808578C: @ 0x0808578C
	push {lr}
	ldr r1, _080857D4 @ =gUnk_08D8B134
	adds r0, #0x50
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r0, r0, #3
	adds r1, r0, r1
	movs r0, #2
	ldrsb r0, [r1, r0]
	movs r2, #0x12
	cmp r0, #0
	bge _080857A8
	movs r2, #0
_080857A8:
	movs r0, #3
	ldrsb r0, [r1, r0]
	movs r1, #0xe
	cmp r0, #0
	bge _080857B4
	movs r1, #0
_080857B4:
	ldr r0, _080857D8 @ =gUiTmScratchA
	lsls r1, r1, #5
	adds r1, r1, r2
	lsls r1, r1, #1
	ldr r2, _080857DC @ =gBg0Tm
	adds r1, r1, r2
	movs r2, #0xc
	movs r3, #6
	bl TmCopyRect_thm
	movs r0, #3
	bl EnableBgSync
	pop {r0}
	bx r0
	.align 2, 0
_080857D4: .4byte gUnk_08D8B134
_080857D8: .4byte gUiTmScratchA
_080857DC: .4byte gBg0Tm

	thumb_func_start sub_80857E0
sub_80857E0: @ 0x080857E0
	push {lr}
	ldr r1, _08085818 @ =gUnk_08D8B134
	adds r0, #0x50
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r0, r0, #3
	adds r0, r0, r1
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	movs r1, #0x18
	cmp r0, #0
	bge _080857FE
	movs r1, #0
_080857FE:
	ldr r0, _0808581C @ =0x020034BC
	lsls r1, r1, #1
	ldr r2, _08085820 @ =gBg0Tm + 0x340
	adds r1, r1, r2
	movs r2, #6
	movs r3, #7
	bl TmCopyRect_thm
	movs r0, #3
	bl EnableBgSync
	pop {r0}
	bx r0
	.align 2, 0
_08085818: .4byte gUnk_08D8B134
_0808581C: .4byte 0x020034BC
_08085820: .4byte gBg0Tm + 0x340

	thumb_func_start sub_8085824
sub_8085824: @ 0x08085824
	push {r4, r5, lr}
	adds r5, r1, #0
	movs r4, #0
	cmp r0, #0x40
	beq _08085850
	cmp r0, #0x40
	bgt _08085838
	cmp r0, #0
	beq _0808583E
	b _08085858
_08085838:
	cmp r0, #0x80
	beq _08085848
	b _08085858
_0808583E:
	ldr r4, _08085844 @ =gUnk_0841C754
	b _0808585C
	.align 2, 0
_08085844: .4byte gUnk_0841C754
_08085848:
	ldr r4, _0808584C @ =gUnk_0841C774
	b _0808585C
	.align 2, 0
_0808584C: .4byte gUnk_0841C774
_08085850:
	ldr r4, _08085854 @ =gUnk_0841C794
	b _0808585C
	.align 2, 0
_08085854: .4byte gUnk_0841C794
_08085858:
	bl nullsub_7
_0808585C:
	lsls r1, r5, #5
	adds r0, r4, #0
	movs r2, #0x20
	bl ApplyPaletteExt
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start sub_808586C
sub_808586C: @ 0x0808586C
	ldr r0, _08085884 @ =gBmSt
	movs r2, #0x14
	ldrsh r1, [r0, r2]
	lsls r1, r1, #4
	movs r2, #0xc
	ldrsh r0, [r0, r2]
	subs r1, r1, r0
	cmp r1, #0x6f
	ble _08085888
	movs r0, #1
	rsbs r0, r0, #0
	b _0808588A
	.align 2, 0
_08085884: .4byte gBmSt
_08085888:
	movs r0, #1
_0808588A:
	bx lr

	thumb_func_start sub_808588C
sub_808588C: @ 0x0808588C
	ldr r0, _080858A4 @ =gBmSt
	movs r2, #0x14
	ldrsh r1, [r0, r2]
	lsls r1, r1, #4
	movs r2, #0xc
	ldrsh r0, [r0, r2]
	subs r1, r1, r0
	cmp r1, #0x70
	bgt _080858A8
	movs r0, #1
	b _080858AC
	.align 2, 0
_080858A4: .4byte gBmSt
_080858A8:
	movs r0, #1
	rsbs r0, r0, #0
_080858AC:
	bx lr
	.align 2, 0

	thumb_func_start sub_80858B0
sub_80858B0: @ 0x080858B0
	movs r2, #0x90
	lsls r2, r2, #1
	adds r1, r2, #0
	strh r1, [r0]
	ldr r3, _080858D4 @ =0x00000121
	adds r1, r3, #0
	strh r1, [r0, #2]
	movs r2, #0
	strh r2, [r0, #4]
	adds r3, #0x1d
	adds r1, r3, #0
	strh r1, [r0, #6]
	adds r3, #1
	adds r1, r3, #0
	strh r1, [r0, #8]
	strh r2, [r0, #0xa]
	bx lr
	.align 2, 0
_080858D4: .4byte 0x00000121

	thumb_func_start sub_80858D8
sub_80858D8: @ 0x080858D8
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	movs r4, #0x80
	lsls r4, r4, #1
	cmp r1, #0
	beq _080859A0
	adds r1, #0x30
	ldrb r2, [r1]
	lsls r0, r2, #0x1c
	lsrs r0, r0, #0x1c
	adds r6, r1, #0
	cmp r0, #8
	bhi _08085936
	lsls r0, r0, #2
	ldr r1, _080858FC @ =_08085900
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080858FC: .4byte _08085900
_08085900: @ jump table
	.4byte _080859A0 @ case 0
	.4byte _08085928 @ case 1
	.4byte _08085924 @ case 2
	.4byte _08085930 @ case 3
	.4byte _0808592C @ case 4
	.4byte _08085934 @ case 5
	.4byte _08085934 @ case 6
	.4byte _08085934 @ case 7
	.4byte _08085934 @ case 8
_08085924:
	adds r4, #0x60
	b _08085936
_08085928:
	adds r4, #0x64
	b _08085936
_0808592C:
	adds r4, #0x68
	b _08085936
_08085930:
	adds r4, #0x6c
	b _08085936
_08085934:
	adds r4, #0x70
_08085936:
	ldrb r1, [r6]
	lsls r0, r1, #0x1c
	lsrs r0, r0, #0x1c
	cmp r0, #6
	beq _0808595C
	cmp r0, #6
	bgt _0808594A
	cmp r0, #5
	beq _08085954
	b _08085982
_0808594A:
	cmp r0, #7
	beq _08085964
	cmp r0, #8
	beq _08085978
	b _08085982
_08085954:
	ldr r0, _08085958 @ =gUnk_0841C554
	b _08085966
	.align 2, 0
_08085958: .4byte gUnk_0841C554
_0808595C:
	ldr r0, _08085960 @ =gUnk_0841C5D4
	b _08085966
	.align 2, 0
_08085960: .4byte gUnk_0841C5D4
_08085964:
	ldr r0, _08085970 @ =gUnk_0841C654
_08085966:
	ldr r1, _08085974 @ =0x06002E00
	movs r2, #0x20
	bl CpuFastSet
	b _08085982
	.align 2, 0
_08085970: .4byte gUnk_0841C654
_08085974: .4byte 0x06002E00
_08085978:
	ldr r0, _080859A8 @ =gUnk_0841C6D4
	ldr r1, _080859AC @ =0x06002E00
	movs r2, #0x20
	bl CpuFastSet
_08085982:
	strh r4, [r5]
	adds r4, #1
	strh r4, [r5, #2]
	adds r4, #1
	strh r4, [r5, #4]
	adds r4, #1
	strh r4, [r5, #6]
	movs r0, #0
	strh r0, [r5, #8]
	ldrb r6, [r6]
	lsrs r0, r6, #4
	movs r2, #0x94
	lsls r2, r2, #1
	adds r0, r0, r2
	strh r0, [r5, #0xa]
_080859A0:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080859A8: .4byte gUnk_0841C6D4
_080859AC: .4byte 0x06002E00

	thumb_func_start sub_80859B0
sub_80859B0: @ 0x080859B0
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r6, r0, #0
	adds r4, r1, #0
	adds r0, #0x44
	ldrh r1, [r0]
	movs r0, #0x3f
	ands r0, r1
	cmp r0, #0
	bne _08085A54
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _080859DE
	ldr r0, [r6, #0x40]
	adds r1, r4, #0
	bl sub_80858D8
	movs r0, #1
	bl EnableBgSync
	b _08085A54
_080859DE:
	ldr r0, [r6, #0x40]
	adds r1, r4, #0
	bl sub_80858B0
	movs r0, #1
	bl EnableBgSync
	adds r0, r4, #0
	bl GetUnitCurrentHp
	cmp r0, #0x63
	ble _080859FE
	movs r0, #0xff
	bl sub_8004F5C
	b _08085A08
_080859FE:
	adds r0, r4, #0
	bl GetUnitCurrentHp
	bl sub_8004F5C
_08085A08:
	ldr r1, _08085A30 @ =0x02028D3C
	ldrb r0, [r1, #6]
	subs r0, #0x30
	adds r2, r6, #0
	adds r2, #0x51
	strb r0, [r2]
	ldrb r0, [r1, #7]
	subs r0, #0x30
	adds r1, r6, #0
	adds r1, #0x52
	strb r0, [r1]
	adds r0, r4, #0
	bl GetUnitMaxHp
	cmp r0, #0x63
	ble _08085A34
	movs r0, #0xff
	bl sub_8004F5C
	b _08085A3E
	.align 2, 0
_08085A30: .4byte 0x02028D3C
_08085A34:
	adds r0, r4, #0
	bl GetUnitMaxHp
	bl sub_8004F5C
_08085A3E:
	ldr r1, _08085B00 @ =0x02028D3C
	ldrb r0, [r1, #6]
	subs r0, #0x30
	adds r2, r6, #0
	adds r2, #0x53
	strb r0, [r2]
	ldrb r1, [r1, #7]
	subs r1, #0x30
	adds r0, r6, #0
	adds r0, #0x54
	strb r1, [r0]
_08085A54:
	adds r0, r6, #0
	adds r0, #0x55
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne _08085AF4
	adds r1, r6, #0
	adds r1, #0x44
	movs r0, #0x40
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	beq _08085A7E
	adds r1, r4, #0
	adds r1, #0x30
	movs r0, #0xf
	ldrb r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _08085AF4
_08085A7E:
	adds r0, r6, #0
	adds r0, #0x46
	movs r1, #0
	ldrsh r0, [r0, r1]
	lsls r7, r0, #3
	adds r1, r7, #0
	adds r1, #0x10
	adds r0, r6, #0
	adds r0, #0x48
	movs r2, #0
	ldrsh r0, [r0, r2]
	lsls r5, r0, #3
	adds r0, r6, #0
	adds r0, #0x51
	ldrb r4, [r0]
	cmp r4, #0xf0
	beq _08085AB0
	ldr r2, _08085B04 @ =Sprite_8x8
	adds r0, r4, #0
	ldr r4, _08085B08 @ =0x000082E0
	adds r3, r0, r4
	adds r0, r1, #0
	adds r1, r5, #0
	bl PutOamHiRam
_08085AB0:
	adds r0, r7, #0
	adds r0, #0x17
	ldr r1, _08085B04 @ =Sprite_8x8
	mov r8, r1
	adds r1, r6, #0
	adds r1, #0x52
	ldr r4, _08085B08 @ =0x000082E0
	ldrb r1, [r1]
	adds r3, r1, r4
	adds r1, r5, #0
	mov r2, r8
	bl PutOamHiRam
	adds r0, r7, #0
	adds r0, #0x22
	adds r1, r6, #0
	adds r1, #0x53
	ldrb r1, [r1]
	adds r3, r1, r4
	adds r1, r5, #0
	mov r2, r8
	bl PutOamHiRam
	adds r0, r7, #0
	adds r0, #0x29
	adds r1, r6, #0
	adds r1, #0x54
	ldrb r1, [r1]
	adds r4, r1, r4
	adds r1, r5, #0
	mov r2, r8
	adds r3, r4, #0
	bl PutOamHiRam
_08085AF4:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08085B00: .4byte 0x02028D3C
_08085B04: .4byte Sprite_8x8
_08085B08: .4byte 0x000082E0

	thumb_func_start sub_8085B0C
sub_8085B0C: @ 0x08085B0C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	adds r7, r0, #0
	mov r8, r1
	movs r0, #0
	mov sl, r0
	str r0, [sp, #4]
	ldr r1, _08085BC4 @ =gUiTmScratchA
	mov sb, r1
	ldr r2, _08085BC8 @ =0x01000060
	add r0, sp, #4
	bl CpuFastSet
	mov r2, r8
	ldr r0, [r2]
	ldrh r0, [r0]
	bl DecodeMsg
	adds r6, r0, #0
	movs r0, #0x30
	adds r1, r6, #0
	bl GetStringTextCenteredPos
	adds r5, r0, #0
	adds r4, r7, #0
	adds r4, #0x2c
	adds r0, r4, #0
	bl ClearText
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #5
	bl Text_SetParams
	adds r0, r4, #0
	adds r1, r6, #0
	bl Text_DrawString
	mov r1, sb
	adds r1, #0x4a
	adds r0, r4, #0
	bl PutText
	mov r0, r8
	bl GetUnitMiniPortraitId
	adds r2, r0, #0
	mov r1, r8
	ldr r0, [r1, #0xc]
	movs r1, #0x80
	lsls r1, r1, #0x10
	ands r0, r1
	cmp r0, #0
	beq _08085B82
	adds r2, #1
_08085B82:
	mov r1, sb
	adds r1, #0x42
	mov r0, sl
	str r0, [sp]
	adds r0, r2, #0
	movs r2, #0xf0
	movs r3, #4
	bl PutFaceChibi
	mov r0, sb
	adds r0, #0xca
	str r0, [r7, #0x40]
	adds r0, r7, #0
	adds r0, #0x44
	mov r1, sl
	strh r1, [r0]
	ldr r2, _08085BCC @ =gUnk_08D8B134
	adds r1, r7, #0
	adds r1, #0x50
	movs r0, #0
	ldrsb r0, [r1, r0]
	lsls r0, r0, #3
	adds r0, r0, r2
	ldrb r0, [r0, #2]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bge _08085BD0
	adds r2, r7, #0
	adds r2, #0x46
	movs r0, #5
	b _08085BD6
	.align 2, 0
_08085BC4: .4byte gUiTmScratchA
_08085BC8: .4byte 0x01000060
_08085BCC: .4byte gUnk_08D8B134
_08085BD0:
	adds r2, r7, #0
	adds r2, #0x46
	movs r0, #0x17
_08085BD6:
	strh r0, [r2]
	ldr r0, _08085BF4 @ =gUnk_08D8B134
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	lsls r1, r1, #3
	adds r1, r1, r0
	movs r0, #3
	ldrsb r0, [r1, r0]
	cmp r0, #0
	bge _08085BF8
	adds r1, r7, #0
	adds r1, #0x48
	movs r0, #3
	b _08085BFE
	.align 2, 0
_08085BF4: .4byte gUnk_08D8B134
_08085BF8:
	adds r1, r7, #0
	adds r1, #0x48
	movs r0, #0x11
_08085BFE:
	strh r0, [r1]
	adds r0, r7, #0
	mov r1, r8
	bl sub_80859B0
	ldr r0, _08085C40 @ =0x02003346
	movs r2, #0xc5
	lsls r2, r2, #6
	mov r1, r8
	bl sub_80851F0
	ldr r0, _08085C44 @ =gUiTmScratchB
	ldr r1, _08085C48 @ =gUnk_0841C80C
	movs r2, #0xc4
	lsls r2, r2, #6
	bl TmApplyTsa_thm
	movs r0, #0xc0
	mov r2, r8
	ldrb r2, [r2, #0xb]
	ands r0, r2
	movs r1, #3
	bl sub_8085824
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08085C40: .4byte 0x02003346
_08085C44: .4byte gUiTmScratchB
_08085C48: .4byte gUnk_0841C80C

	thumb_func_start sub_8085C4C
sub_8085C4C: @ 0x08085C4C
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	bl sub_808512C
	adds r1, r0, #0
	movs r2, #1
	cmp r4, #5
	ble _08085C70
	cmp r4, #0xb
	bgt _08085C72
	ldr r0, _08085C88 @ =gUnk_08D8B134
	lsls r1, r1, #3
	adds r1, r1, r0
	movs r0, #5
	ldrsb r0, [r1, r0]
	cmp r0, #0
	bge _08085C72
_08085C70:
	movs r2, #4
_08085C72:
	cmp r5, #1
	bgt _08085C78
	subs r2, #1
_08085C78:
	cmp r5, #0x16
	ble _08085C7E
	adds r2, #1
_08085C7E:
	adds r0, r2, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_08085C88: .4byte gUnk_08D8B134

	thumb_func_start sub_8085C8C
sub_8085C8C: @ 0x08085C8C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	adds r7, r0, #0
	str r1, [sp]
	movs r0, #0x10
	ldrsb r0, [r1, r0]
	lsls r0, r0, #4
	ldr r2, _08085DD4 @ =gBmSt
	movs r3, #0xc
	ldrsh r1, [r2, r3]
	subs r0, r0, r1
	cmp r0, #0
	bge _08085CB0
	adds r0, #7
_08085CB0:
	asrs r0, r0, #3
	mov sl, r0
	ldr r1, [sp]
	movs r0, #0x11
	ldrsb r0, [r1, r0]
	lsls r0, r0, #4
	movs r3, #0xe
	ldrsh r1, [r2, r3]
	subs r0, r0, r1
	cmp r0, #0
	bge _08085CC8
	adds r0, #7
_08085CC8:
	asrs r4, r0, #3
	mov r0, sl
	adds r1, r4, #0
	bl sub_8085C4C
	mov r8, r0
	ldr r0, _08085DD8 @ =gUnk_08D8B16C
	add r0, r8
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	add sl, r0
	ldr r0, _08085DDC @ =gUnk_08D8B172
	add r0, r8
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r4, r4, r0
	adds r0, r7, #0
	adds r0, #0x3c
	mov r1, sl
	strb r1, [r0]
	adds r0, #1
	strb r4, [r0]
	adds r1, r7, #0
	adds r1, #0x3e
	movs r0, #8
	strb r0, [r1]
	adds r1, #1
	movs r0, #5
	strb r0, [r1]
	ldr r2, [sp]
	ldr r0, [r2]
	ldrh r0, [r0]
	bl DecodeMsg
	mov sb, r0
	movs r0, #0x30
	mov r1, sb
	bl GetStringTextCenteredPos
	adds r6, r0, #0
	adds r5, r7, #0
	adds r5, #0x2c
	adds r0, r5, #0
	bl ClearText
	adds r0, r5, #0
	adds r1, r6, #0
	movs r2, #5
	bl Text_SetParams
	adds r0, r5, #0
	mov r1, sb
	bl Text_DrawString
	ldr r0, _08085DE0 @ =gUnk_08D8B15A
	add r0, r8
	movs r1, #0
	ldrsb r1, [r0, r1]
	adds r1, r4, r1
	lsls r1, r1, #5
	ldr r0, _08085DE4 @ =gUnk_08D8B154
	add r0, r8
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	add r0, sl
	adds r1, r1, r0
	lsls r1, r1, #1
	ldr r6, _08085DE8 @ =gBg0Tm
	adds r1, r1, r6
	adds r0, r5, #0
	bl PutText
	adds r1, r4, #3
	lsls r0, r1, #5
	adds r0, #1
	add r0, sl
	lsls r0, r0, #1
	adds r0, r0, r6
	str r0, [r7, #0x40]
	adds r0, r7, #0
	adds r0, #0x44
	movs r3, #0
	strh r3, [r0]
	mov r0, sl
	adds r0, #1
	adds r2, r7, #0
	adds r2, #0x46
	strh r0, [r2]
	adds r0, r7, #0
	adds r0, #0x48
	strh r1, [r0]
	adds r0, r7, #0
	ldr r1, [sp]
	bl sub_80859B0
	lsls r4, r4, #5
	add r4, sl
	lsls r4, r4, #1
	ldr r0, _08085DEC @ =gBg1Tm
	adds r4, r4, r0
	ldr r0, _08085DF0 @ =gUnk_08D8B178
	mov r1, r8
	lsls r1, r1, #2
	mov r8, r1
	add r8, r0
	mov r2, r8
	ldr r1, [r2]
	movs r2, #0xc4
	lsls r2, r2, #6
	adds r0, r4, #0
	bl TmApplyTsa_thm
	movs r0, #3
	bl EnableBgSync
	movs r0, #0xc0
	ldr r3, [sp]
	ldrb r3, [r3, #0xb]
	ands r0, r3
	movs r1, #3
	bl sub_8085824
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08085DD4: .4byte gBmSt
_08085DD8: .4byte gUnk_08D8B16C
_08085DDC: .4byte gUnk_08D8B172
_08085DE0: .4byte gUnk_08D8B15A
_08085DE4: .4byte gUnk_08D8B154
_08085DE8: .4byte gBg0Tm
_08085DEC: .4byte gBg1Tm
_08085DF0: .4byte gUnk_08D8B178

	thumb_func_start sub_8085DF4
sub_8085DF4: @ 0x08085DF4
	push {r4, r5, r6, r7, lr}
	adds r2, r0, #0
	movs r0, #0xa1
	lsls r0, r0, #3
	ldrh r1, [r2, #0x3e]
	cmp r1, r0
	bne _08085E5E
	adds r7, r2, #0
	adds r7, #0x3d
	movs r0, #0
	ldrsb r0, [r7, r0]
	lsls r0, r0, #5
	adds r5, r2, #0
	adds r5, #0x3c
	movs r1, #0
	ldrsb r1, [r5, r1]
	adds r0, r0, r1
	lsls r0, r0, #1
	ldr r1, _08085E64 @ =gBg0Tm
	adds r0, r0, r1
	adds r6, r2, #0
	adds r6, #0x3e
	movs r1, #0
	ldrsb r1, [r6, r1]
	adds r4, r2, #0
	adds r4, #0x3f
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
	ldr r1, _08085E68 @ =gBg1Tm
	adds r0, r0, r1
	movs r1, #0
	ldrsb r1, [r6, r1]
	movs r2, #0
	ldrsb r2, [r4, r2]
	movs r3, #0
	bl TmFillRect_thm
	movs r0, #3
	bl EnableBgSync
	movs r0, #0
	strb r0, [r6]
	strb r0, [r4]
_08085E5E:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08085E64: .4byte gBg0Tm
_08085E68: .4byte gBg1Tm

	thumb_func_start sub_8085E6C
sub_8085E6C: @ 0x08085E6C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	adds r4, r0, #0
	ldr r0, _08085F64 @ =gBmSt
	mov sb, r0
	movs r1, #0x16
	ldrsh r0, [r0, r1]
	ldr r1, _08085F68 @ =gBmMapTerrain
	ldr r1, [r1]
	lsls r0, r0, #2
	adds r0, r0, r1
	mov r2, sb
	movs r3, #0x14
	ldrsh r1, [r2, r3]
	ldr r0, [r0]
	adds r0, r0, r1
	ldrb r7, [r0]
	bl sub_8031B40
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08085EA0
	b _08086026
_08085EA0:
	ldr r0, _08085F6C @ =0x020034BC
	mov r8, r0
	movs r1, #0xe
	movs r2, #7
	movs r3, #0
	bl TmFillRect_thm
	ldr r0, _08085F70 @ =0x020039BC
	movs r1, #0xe
	movs r2, #7
	movs r3, #0
	bl TmFillRect_thm
	adds r0, r7, #0
	bl sub_8019EF0
	adds r5, r0, #0
	movs r0, #0x20
	adds r1, r5, #0
	bl GetStringTextCenteredPos
	adds r6, r0, #0
	adds r4, #0x2c
	adds r0, r4, #0
	bl ClearText
	adds r0, r4, #0
	adds r1, r6, #0
	movs r2, #0
	bl Text_SetParams
	adds r0, r4, #0
	adds r1, r5, #0
	bl Text_DrawString
	mov r1, r8
	adds r1, #0x82
	adds r0, r4, #0
	bl PutText
	movs r6, #0x81
	lsls r6, r6, #1
	add r6, r8
	ldr r1, _08085F74 @ =gUnk_0841CA98
	movs r2, #0x80
	lsls r2, r2, #1
	mov sl, r2
	adds r0, r6, #0
	bl TmApplyTsa_thm
	ldr r0, _08085F78 @ =gUnk_08C52C98
	adds r0, r7, r0
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	ble _08085F54
	ldr r0, _08085F7C @ =gUnk_08C53846
	adds r0, r7, r0
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl sub_8004F20
	movs r0, #0x84
	lsls r0, r0, #1
	add r0, r8
	ldr r4, _08085F80 @ =0x02028D43
	movs r5, #0x94
	lsls r5, r5, #1
	adds r1, r4, #0
	adds r2, r5, #0
	movs r3, #2
	bl PutDigits
	ldr r0, _08085F84 @ =gUnk_08C53805
	adds r0, r7, r0
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl sub_8004F20
	movs r0, #0xa4
	lsls r0, r0, #1
	add r0, r8
	adds r1, r4, #0
	adds r2, r5, #0
	movs r3, #2
	bl PutDigits
_08085F54:
	cmp r7, #0x29
	bgt _08085F88
	cmp r7, #0x27
	bge _08085FEC
	cmp r7, #0x1b
	beq _08085F8C
	b _0808601A
	.align 2, 0
_08085F64: .4byte gBmSt
_08085F68: .4byte gBmMapTerrain
_08085F6C: .4byte 0x020034BC
_08085F70: .4byte 0x020039BC
_08085F74: .4byte gUnk_0841CA98
_08085F78: .4byte gUnk_08C52C98
_08085F7C: .4byte gUnk_08C53846
_08085F80: .4byte 0x02028D43
_08085F84: .4byte gUnk_08C53805
_08085F88:
	cmp r7, #0x33
	bne _0808601A
_08085F8C:
	ldr r4, _08085FC0 @ =0x020035BE
	ldr r1, _08085FC4 @ =gUnk_0841CAAC
	movs r2, #0x84
	lsls r2, r2, #6
	adds r0, r4, #0
	bl TmApplyTsa_thm
	ldr r1, _08085FC8 @ =gBmSt
	movs r3, #0x14
	ldrsh r0, [r1, r3]
	movs r2, #0x16
	ldrsh r1, [r1, r2]
	bl sub_802C17C
	adds r6, r0, #0
	cmp r6, #0x64
	bne _08085FD0
	adds r0, r4, #0
	adds r0, #0x44
	ldr r1, _08085FCC @ =gUnk_0841CAB8
	movs r2, #0x80
	lsls r2, r2, #1
	bl TmApplyTsa_thm
	b _0808601A
	.align 2, 0
_08085FC0: .4byte 0x020035BE
_08085FC4: .4byte gUnk_0841CAAC
_08085FC8: .4byte gBmSt
_08085FCC: .4byte gUnk_0841CAB8
_08085FD0:
	adds r0, r6, #0
	bl sub_8004F20
	adds r0, r4, #0
	adds r0, #0x46
	ldr r1, _08085FE8 @ =0x02028D43
	movs r2, #0x94
	lsls r2, r2, #1
	movs r3, #2
	bl PutDigits
	b _0808601A
	.align 2, 0
_08085FE8: .4byte 0x02028D43
_08085FEC:
	ldr r1, _08086034 @ =gUnk_0841CAA4
	adds r0, r6, #0
	mov r2, sl
	bl TmApplyTsa_thm
	mov r3, sb
	movs r1, #0x14
	ldrsh r0, [r3, r1]
	movs r2, #0x16
	ldrsh r1, [r3, r2]
	bl sub_802C17C
	bl sub_8004F20
	movs r0, #0x84
	lsls r0, r0, #1
	add r0, r8
	ldr r1, _08086038 @ =0x02028D43
	movs r2, #0x94
	lsls r2, r2, #1
	movs r3, #2
	bl PutDigits
_0808601A:
	ldr r0, _0808603C @ =0x020039BC
	ldr r1, _08086040 @ =gUnk_0841C7B4
	movs r2, #0x88
	lsls r2, r2, #5
	bl TmApplyTsa_thm
_08086026:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08086034: .4byte gUnk_0841CAA4
_08086038: .4byte 0x02028D43
_0808603C: .4byte 0x020039BC
_08086040: .4byte gUnk_0841C7B4

	thumb_func_start sub_8086044
sub_8086044: @ 0x08086044
	push {lr}
	adds r2, r0, #0
	adds r1, r2, #0
	adds r1, #0x57
	movs r0, #0xff
	strb r0, [r1]
	subs r1, #1
	movs r0, #0
	strb r0, [r1]
	str r0, [r2, #0x58]
	subs r1, #6
	movs r0, #1
	strb r0, [r1]
	adds r0, r2, #0
	adds r0, #0x2c
	movs r1, #4
	bl sub_800536C
	pop {r0}
	bx r0

	thumb_func_start sub_808606C
sub_808606C: @ 0x0808606C
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r1, r5, #0
	adds r1, #0x55
	movs r0, #1
	strb r0, [r1]
	bl sub_808512C
	adds r1, r5, #0
	adds r1, #0x50
	strb r0, [r1]
	ldr r0, _08086100 @ =gUnk_08D8B134
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	lsls r1, r1, #3
	adds r1, r1, r0
	movs r0, #0
	ldrsb r0, [r1, r0]
	ldrb r1, [r1, #1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	bl sub_8085110
	adds r6, r0, #0
	ldr r0, _08086104 @ =gUnk_08D8B200
	bl Proc_Find
	adds r4, r0, #0
	cmp r4, #0
	beq _080860BA
	adds r1, r4, #0
	adds r1, #0x57
	movs r0, #0
	ldrsb r0, [r1, r0]
	cmp r0, #0
	blt _080860BA
	cmp r0, r6
	beq _080860F8
_080860BA:
	ldr r0, _08086108 @ =gUnk_08D8B2D8
	bl Proc_Find
	cmp r4, #0
	beq _080860D4
	adds r1, r0, #0
	adds r1, #0x57
	movs r0, #0
	ldrsb r0, [r1, r0]
	cmp r0, #0
	blt _080860D4
	cmp r0, r6
	beq _080860F8
_080860D4:
	adds r0, r5, #0
	adds r0, #0x57
	strb r6, [r0]
	adds r0, r5, #0
	bl sub_8085E6C
	ldr r0, _0808610C @ =gBmSt
	ldrh r1, [r0, #0x14]
	adds r2, r5, #0
	adds r2, #0x4e
	strb r1, [r2]
	ldrh r0, [r0, #0x16]
	adds r1, r5, #0
	adds r1, #0x4f
	strb r0, [r1]
	adds r0, r5, #0
	bl Proc_Break
_080860F8:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08086100: .4byte gUnk_08D8B134
_08086104: .4byte gUnk_08D8B200
_08086108: .4byte gUnk_08D8B2D8
_0808610C: .4byte gBmSt

	thumb_func_start sub_8086110
sub_8086110: @ 0x08086110
	push {r4, lr}
	adds r4, r0, #0
	adds r3, r4, #0
	adds r3, #0x4e
	ldrb r0, [r3]
	adds r2, r4, #0
	adds r2, #0x4c
	strb r0, [r2]
	movs r0, #0x4f
	adds r0, r0, r4
	mov ip, r0
	ldrb r0, [r0]
	adds r1, r4, #0
	adds r1, #0x4d
	strb r0, [r1]
	ldr r1, _08086190 @ =gBmSt
	ldrh r0, [r1, #0x14]
	strb r0, [r3]
	ldrh r0, [r1, #0x16]
	mov r1, ip
	strb r0, [r1]
	ldr r0, _08086194 @ =0x0000FFFF
	adds r1, r0, #0
	ldrh r3, [r3]
	ands r1, r3
	ldrh r2, [r2]
	ands r0, r2
	cmp r1, r0
	beq _080861AE
	ldr r0, _08086198 @ =ProcScr_CamMove
	bl Proc_Find
	cmp r0, #0
	bne _080861A0
	bl sub_808512C
	adds r1, r0, #0
	adds r0, r4, #0
	adds r0, #0x50
	movs r2, #0
	ldrsb r2, [r0, r2]
	cmp r1, r2
	beq _08086180
	ldr r0, _0808619C @ =gUnk_08D8B134
	lsls r1, r1, #3
	adds r3, r1, r0
	lsls r1, r2, #3
	adds r1, r1, r0
	ldrb r2, [r3]
	ldrb r0, [r1]
	cmp r2, r0
	bne _080861A0
	ldrb r3, [r3, #1]
	ldrb r1, [r1, #1]
	cmp r3, r1
	bne _080861A0
_08086180:
	adds r0, r4, #0
	bl sub_8085E6C
	adds r0, r4, #0
	bl sub_80857E0
	b _080861AE
	.align 2, 0
_08086190: .4byte gBmSt
_08086194: .4byte 0x0000FFFF
_08086198: .4byte ProcScr_CamMove
_0808619C: .4byte gUnk_08D8B134
_080861A0:
	adds r1, r4, #0
	adds r1, #0x56
	movs r0, #1
	strb r0, [r1]
	adds r0, r4, #0
	bl Proc_Break
_080861AE:
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_80861B4
sub_80861B4: @ 0x080861B4
	push {r4, lr}
	adds r4, r0, #0
	adds r1, r4, #0
	adds r1, #0x57
	movs r0, #0xff
	strb r0, [r1]
	adds r0, r4, #0
	adds r0, #0x2c
	movs r1, #6
	bl sub_800536C
	movs r1, #0
	str r1, [r4, #0x58]
	adds r0, r4, #0
	adds r0, #0x56
	strb r1, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_80861DC
sub_80861DC: @ 0x080861DC
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	ldr r2, _08086278 @ =gBmSt
	movs r1, #0x16
	ldrsh r0, [r2, r1]
	ldr r1, _0808627C @ =gBmMapUnit
	ldr r1, [r1]
	lsls r0, r0, #2
	adds r0, r0, r1
	movs r3, #0x14
	ldrsh r1, [r2, r3]
	ldr r0, [r0]
	adds r0, r0, r1
	ldrb r0, [r0]
	bl GetUnit
	adds r6, r0, #0
	cmp r6, #0
	beq _08086270
	adds r1, r4, #0
	adds r1, #0x55
	movs r0, #1
	strb r0, [r1]
	bl sub_808512C
	adds r1, r4, #0
	adds r1, #0x50
	strb r0, [r1]
	ldr r0, _08086280 @ =gUnk_08D8B134
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	lsls r1, r1, #3
	adds r1, r1, r0
	movs r0, #2
	ldrsb r0, [r1, r0]
	ldrb r1, [r1, #3]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	bl sub_8085110
	adds r5, r0, #0
	ldr r0, _08086284 @ =gUnk_08D8B1A0
	bl Proc_Find
	cmp r0, #0
	beq _0808624A
	adds r1, r0, #0
	adds r1, #0x57
	movs r0, #0
	ldrsb r0, [r1, r0]
	cmp r0, #0
	blt _0808624A
	cmp r0, r5
	beq _08086270
_0808624A:
	adds r0, r4, #0
	adds r0, #0x57
	strb r5, [r0]
	ldr r0, _08086278 @ =gBmSt
	ldrh r1, [r0, #0x14]
	adds r2, r4, #0
	adds r2, #0x4e
	strb r1, [r2]
	ldrh r0, [r0, #0x16]
	adds r1, r4, #0
	adds r1, #0x4f
	strb r0, [r1]
	adds r0, r4, #0
	adds r1, r6, #0
	bl sub_8085B0C
	adds r0, r4, #0
	bl Proc_Break
_08086270:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08086278: .4byte gBmSt
_0808627C: .4byte gBmMapUnit
_08086280: .4byte gUnk_08D8B134
_08086284: .4byte gUnk_08D8B1A0

	thumb_func_start sub_8086288
sub_8086288: @ 0x08086288
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	ldr r6, _08086340 @ =gBmSt
	movs r1, #0x16
	ldrsh r0, [r6, r1]
	ldr r1, _08086344 @ =gBmMapUnit
	ldr r1, [r1]
	lsls r0, r0, #2
	adds r0, r0, r1
	movs r2, #0x14
	ldrsh r1, [r6, r2]
	ldr r0, [r0]
	adds r0, r0, r1
	ldrb r0, [r0]
	bl GetUnit
	adds r7, r0, #0
	adds r4, r5, #0
	adds r4, #0x44
	ldrh r0, [r4]
	adds r0, #1
	strh r0, [r4]
	adds r0, r5, #0
	adds r1, r7, #0
	bl sub_80859B0
	movs r0, #0x3f
	ldrh r4, [r4]
	ands r0, r4
	cmp r0, #0
	bne _080862CC
	adds r0, r5, #0
	bl sub_808578C
_080862CC:
	adds r3, r5, #0
	adds r3, #0x4e
	ldrb r0, [r3]
	adds r2, r5, #0
	adds r2, #0x4c
	strb r0, [r2]
	adds r4, r5, #0
	adds r4, #0x4f
	ldrb r0, [r4]
	adds r1, r5, #0
	adds r1, #0x4d
	strb r0, [r1]
	ldrh r0, [r6, #0x14]
	strb r0, [r3]
	ldrh r0, [r6, #0x16]
	strb r0, [r4]
	ldr r0, _08086348 @ =0x0000FFFF
	adds r1, r0, #0
	ldrh r3, [r3]
	ands r1, r3
	ldrh r2, [r2]
	ands r0, r2
	cmp r1, r0
	beq _08086362
	cmp r7, #0
	beq _08086354
	ldr r0, _0808634C @ =ProcScr_CamMove
	bl Proc_Find
	cmp r0, #0
	bne _08086354
	bl sub_808512C
	adds r1, r0, #0
	adds r0, r5, #0
	adds r0, #0x50
	movs r2, #0
	ldrsb r2, [r0, r2]
	cmp r1, r2
	beq _08086336
	ldr r0, _08086350 @ =gUnk_08D8B134
	lsls r1, r1, #3
	adds r3, r1, r0
	lsls r1, r2, #3
	adds r1, r1, r0
	ldrb r0, [r3, #2]
	ldrb r2, [r1, #2]
	cmp r0, r2
	bne _08086354
	ldrb r3, [r3, #3]
	ldrb r1, [r1, #3]
	cmp r3, r1
	bne _08086354
_08086336:
	adds r0, r5, #0
	movs r1, #1
	bl Proc_Goto
	b _08086362
	.align 2, 0
_08086340: .4byte gBmSt
_08086344: .4byte gBmMapUnit
_08086348: .4byte 0x0000FFFF
_0808634C: .4byte ProcScr_CamMove
_08086350: .4byte gUnk_08D8B134
_08086354:
	adds r1, r5, #0
	adds r1, #0x56
	movs r0, #1
	strb r0, [r1]
	adds r0, r5, #0
	bl Proc_Break
_08086362:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_8086368
sub_8086368: @ 0x08086368
	push {r4, lr}
	adds r4, r0, #0
	ldr r2, _08086398 @ =gBmSt
	movs r1, #0x16
	ldrsh r0, [r2, r1]
	ldr r1, _0808639C @ =gBmMapUnit
	ldr r1, [r1]
	lsls r0, r0, #2
	adds r0, r0, r1
	movs r3, #0x14
	ldrsh r1, [r2, r3]
	ldr r0, [r0]
	adds r0, r0, r1
	ldrb r0, [r0]
	bl GetUnit
	adds r1, r0, #0
	cmp r1, #0
	bne _080863A0
	adds r0, r4, #0
	movs r1, #3
	bl Proc_Goto
	b _080863AC
	.align 2, 0
_08086398: .4byte gBmSt
_0808639C: .4byte gBmMapUnit
_080863A0:
	adds r0, r4, #0
	bl sub_8085B0C
	adds r0, r4, #0
	bl sub_808578C
_080863AC:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_80863B4
sub_80863B4: @ 0x080863B4
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x2c
	movs r1, #6
	bl sub_800536C
	adds r0, r4, #0
	adds r0, #0x4b
	movs r1, #0
	strb r1, [r0]
	adds r0, #0xa
	strb r1, [r0]
	str r1, [r4, #0x58]
	subs r0, #0x17
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r0, #0x17
	strb r1, [r0]
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_80863E0
sub_80863E0: @ 0x080863E0
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r5, r4, #0
	adds r5, #0x4b
	ldrb r0, [r5]
	adds r3, r4, #0
	adds r3, #0x4a
	strb r0, [r3]
	ldr r2, _08086424 @ =gBmSt
	movs r1, #0x16
	ldrsh r0, [r2, r1]
	ldr r1, _08086428 @ =gBmMapUnit
	ldr r1, [r1]
	lsls r0, r0, #2
	adds r0, r0, r1
	movs r6, #0x14
	ldrsh r1, [r2, r6]
	ldr r0, [r0]
	adds r0, r0, r1
	ldrb r0, [r0]
	strb r0, [r5]
	ldrb r1, [r3]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r1, r0
	beq _0808642C
	cmp r1, #0
	beq _0808642C
	adds r0, r4, #0
	bl sub_8085DF4
	movs r0, #0
	str r0, [r4, #0x58]
	b _080864D4
	.align 2, 0
_08086424: .4byte gBmSt
_08086428: .4byte gBmMapUnit
_0808642C:
	adds r0, r4, #0
	adds r0, #0x4b
	ldrb r1, [r0]
	adds r6, r0, #0
	cmp r1, #0
	beq _080864D4
	ldr r0, _0808647C @ =ProcScr_CamMove
	bl Proc_Find
	cmp r0, #0
	bne _080864D4
	ldr r0, _08086480 @ =gUnk_08D8B1A0
	bl Proc_Find
	adds r5, r0, #0
	cmp r5, #0
	beq _0808645A
	adds r0, #0x55
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne _08086470
_0808645A:
	ldr r0, _08086484 @ =gUnk_08D8B2D8
	bl Proc_Find
	cmp r0, #0
	beq _08086488
	adds r0, #0x55
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _08086488
_08086470:
	ldr r0, [r4, #0x58]
	cmp r0, #3
	bgt _080864D4
	adds r0, #1
	str r0, [r4, #0x58]
	b _080864D4
	.align 2, 0
_0808647C: .4byte ProcScr_CamMove
_08086480: .4byte gUnk_08D8B1A0
_08086484: .4byte gUnk_08D8B2D8
_08086488:
	ldr r0, [r4, #0x58]
	adds r0, #1
	str r0, [r4, #0x58]
	cmp r0, #7
	ble _080864D4
	cmp r0, #8
	bne _080864A6
	ldrb r0, [r6]
	bl GetUnit
	adds r1, r0, #0
	adds r0, r4, #0
	bl sub_8085C8C
	b _080864D4
_080864A6:
	adds r1, r4, #0
	adds r1, #0x44
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
	cmp r5, #0
	beq _080864BE
	adds r0, r5, #0
	adds r0, #0x55
	ldrb r0, [r0]
	adds r1, #0x11
	b _080864C4
_080864BE:
	adds r1, r4, #0
	adds r1, #0x55
	movs r0, #0
_080864C4:
	strb r0, [r1]
	ldrb r0, [r6]
	bl GetUnit
	adds r1, r0, #0
	adds r0, r4, #0
	bl sub_80859B0
_080864D4:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_80864DC
sub_80864DC: @ 0x080864DC
	push {r4, r5, lr}
	ldr r5, _080865DC @ =gDispIo
	movs r4, #0x21
	rsbs r4, r4, #0
	adds r0, r4, #0
	ldrb r1, [r5, #1]
	ands r0, r1
	movs r1, #0x41
	rsbs r1, r1, #0
	ands r0, r1
	movs r1, #0x7f
	ands r0, r1
	strb r0, [r5, #1]
	adds r2, r5, #0
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
	movs r1, #0x20
	orrs r0, r1
	strb r0, [r2]
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
	adds r2, r5, #0
	adds r2, #0x3c
	movs r0, #0x3f
	ldrb r1, [r2]
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r2]
	adds r1, r5, #0
	adds r1, #0x44
	movs r3, #0
	movs r0, #0xf
	strb r0, [r1]
	adds r1, #1
	movs r0, #4
	strb r0, [r1]
	adds r0, r5, #0
	adds r0, #0x46
	strb r3, [r0]
	ldr r0, _080865E0 @ =0x0000FFE0
	ldrh r1, [r5, #0x3c]
	ands r0, r1
	movs r1, #2
	orrs r0, r1
	strh r0, [r5, #0x3c]
	ldrb r0, [r2]
	ands r4, r0
	strb r4, [r2]
	ldr r0, _080865E4 @ =0x0000E0FF
	ldrh r1, [r5, #0x3c]
	ands r0, r1
	movs r2, #0xe0
	lsls r2, r2, #5
	adds r1, r2, #0
	orrs r0, r1
	strh r0, [r5, #0x3c]
	ldr r0, _080865E8 @ =gUnk_0841BE00
	ldr r1, _080865EC @ =0x06002000
	bl Decompress
	ldr r0, _080865F0 @ =0x06002500
	ldr r1, _080865F4 @ =0x06015C00
	movs r2, #0x50
	bl CpuFastSet
	ldr r0, _080865F8 @ =0x06002EA0
	ldr r1, _080865FC @ =0x06015D40
	movs r2, #8
	bl CpuFastSet
	ldr r0, _08086600 @ =gPal
	movs r1, #0xc0
	lsls r1, r1, #2
	movs r2, #0x20
	bl ApplyPaletteExt
	movs r0, #1
	movs r1, #2
	bl ApplyIconPalette
	bl ResetTextFont
	ldr r4, _08086604 @ =gPlaySt
	adds r0, r4, #0
	adds r0, #0x40
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080865C6
	ldr r0, _08086608 @ =gUnk_08D8B1A0
	movs r1, #3
	bl Proc_Start
_080865C6:
	ldr r1, _0808660C @ =gBmSt
	movs r0, #0x10
	ldrb r1, [r1, #4]
	ands r0, r1
	cmp r0, #0
	beq _08086614
	ldr r0, _08086610 @ =gUnk_08D8B338
	movs r1, #3
	bl Proc_Start
	b _08086628
	.align 2, 0
_080865DC: .4byte gDispIo
_080865E0: .4byte 0x0000FFE0
_080865E4: .4byte 0x0000E0FF
_080865E8: .4byte gUnk_0841BE00
_080865EC: .4byte 0x06002000
_080865F0: .4byte 0x06002500
_080865F4: .4byte 0x06015C00
_080865F8: .4byte 0x06002EA0
_080865FC: .4byte 0x06015D40
_08086600: .4byte gPal
_08086604: .4byte gPlaySt
_08086608: .4byte gUnk_08D8B1A0
_0808660C: .4byte gBmSt
_08086610: .4byte gUnk_08D8B338
_08086614:
	adds r0, r4, #0
	adds r0, #0x42
	ldrb r0, [r0]
	lsls r0, r0, #0x1f
	cmp r0, #0
	bne _08086628
	ldr r0, _08086658 @ =gUnk_08D8B2D8
	movs r1, #3
	bl Proc_Start
_08086628:
	ldr r0, _0808665C @ =gPlaySt
	adds r4, r0, #0
	adds r4, #0x40
	ldrb r1, [r4]
	lsls r0, r1, #0x1c
	lsrs r0, r0, #0x1e
	cmp r0, #0
	bne _08086640
	ldr r0, _08086660 @ =gUnk_08D8B200
	movs r1, #3
	bl Proc_Start
_08086640:
	ldrb r4, [r4]
	lsls r0, r4, #0x1c
	lsrs r0, r0, #0x1e
	cmp r0, #1
	bne _08086652
	ldr r0, _08086664 @ =gUnk_08D8B288
	movs r1, #3
	bl Proc_Start
_08086652:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08086658: .4byte gUnk_08D8B2D8
_0808665C: .4byte gPlaySt
_08086660: .4byte gUnk_08D8B200
_08086664: .4byte gUnk_08D8B288

	thumb_func_start sub_8086668
sub_8086668: @ 0x08086668
	push {lr}
	ldr r0, _08086678 @ =gUnk_08D8B2B8
	movs r1, #3
	bl Proc_Start
	pop {r0}
	bx r0
	.align 2, 0
_08086678: .4byte gUnk_08D8B2B8

	thumb_func_start sub_808667C
sub_808667C: @ 0x0808667C
	push {lr}
	ldr r0, _080866C4 @ =gUnk_08D8B200
	bl Proc_EndEach
	ldr r0, _080866C8 @ =gUnk_08D8B288
	bl Proc_EndEach
	ldr r0, _080866CC @ =gUnk_08D8B1A0
	bl Proc_EndEach
	ldr r0, _080866D0 @ =gUnk_08D8B2D8
	bl Proc_EndEach
	ldr r0, _080866D4 @ =gUnk_08D8B338
	bl Proc_EndEach
	ldr r3, _080866D8 @ =gDispIo
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
	bl ClearUi
	pop {r0}
	bx r0
	.align 2, 0
_080866C4: .4byte gUnk_08D8B200
_080866C8: .4byte gUnk_08D8B288
_080866CC: .4byte gUnk_08D8B1A0
_080866D0: .4byte gUnk_08D8B2D8
_080866D4: .4byte gUnk_08D8B338
_080866D8: .4byte gDispIo

	thumb_func_start sub_80866DC
sub_80866DC: @ 0x080866DC
	ldr r0, _080866F4 @ =gBmSt
	movs r2, #0x16
	ldrsh r1, [r0, r2]
	lsls r1, r1, #4
	movs r2, #0xe
	ldrsh r0, [r0, r2]
	subs r1, r1, r0
	cmp r1, #0x40
	bgt _080866F8
	movs r0, #0
	b _080866FA
	.align 2, 0
_080866F4: .4byte gBmSt
_080866F8:
	movs r0, #1
_080866FA:
	bx lr

	thumb_func_start sub_80866FC
sub_80866FC: @ 0x080866FC
	push {lr}
	bl sub_80866DC
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08086724
	bl sub_808586C
	movs r1, #1
	rsbs r1, r1, #0
	cmp r0, r1
	bne _08086718
	movs r0, #2
	b _08086742
_08086718:
	bl sub_808586C
	cmp r0, #1
	bne _08086740
	movs r0, #1
	b _08086742
_08086724:
	bl sub_808588C
	movs r1, #1
	rsbs r1, r1, #0
	cmp r0, r1
	bne _08086734
	movs r0, #4
	b _08086742
_08086734:
	bl sub_808588C
	cmp r0, #1
	bne _08086740
	movs r0, #3
	b _08086742
_08086740:
	movs r0, #0
_08086742:
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_8086748
sub_8086748: @ 0x08086748
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	bl sub_8031B40
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080867C0
	ldr r7, _080867C8 @ =0x020039E4
	adds r0, r7, #0
	movs r1, #0xb
	movs r2, #9
	movs r3, #0
	bl TmFillRect_thm
	ldr r6, _080867CC @ =0x02003564
	adds r0, r6, #0
	movs r1, #0xb
	movs r2, #9
	movs r3, #0
	bl TmFillRect_thm
	adds r5, r4, #0
	adds r5, #0x44
	movs r1, #0
	ldrsh r0, [r5, r1]
	cmp r0, #0
	bne _08086796
	ldr r1, _080867D0 @ =gUnk_0841CB54
	movs r2, #0x88
	lsls r2, r2, #5
	adds r0, r7, #0
	bl TmApplyTsa_thm
	adds r0, r4, #0
	adds r0, #0x2c
	adds r1, r6, #0
	adds r1, #0x42
	bl PutText
_08086796:
	ldrh r5, [r5]
	cmp r5, #1
	bne _080867C0
	ldr r1, _080867D4 @ =gUnk_0841CACC
	movs r2, #0x88
	lsls r2, r2, #5
	adds r0, r7, #0
	bl TmApplyTsa_thm
	adds r0, r4, #0
	adds r0, #0x2c
	adds r1, r6, #0
	adds r1, #0x42
	bl PutText
	adds r0, r4, #0
	adds r0, #0x34
	adds r1, r6, #0
	adds r1, #0xc2
	bl PutText
_080867C0:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080867C8: .4byte 0x020039E4
_080867CC: .4byte 0x02003564
_080867D0: .4byte gUnk_0841CB54
_080867D4: .4byte gUnk_0841CACC

	thumb_func_start sub_80867D8
sub_80867D8: @ 0x080867D8
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	movs r1, #0
	str r1, [r7, #0x58]
	adds r0, #0x56
	strb r1, [r0]
	subs r0, #6
	strb r1, [r0]
	adds r1, r7, #0
	adds r1, #0x57
	movs r0, #0xff
	strb r0, [r1]
	adds r5, r7, #0
	adds r5, #0x2c
	adds r0, r5, #0
	movs r1, #8
	bl InitText
	adds r4, r7, #0
	adds r4, #0x34
	adds r0, r4, #0
	movs r1, #8
	bl InitText
	adds r0, r7, #0
	bl StartGreenText
	adds r0, r5, #0
	bl ClearText
	adds r0, r4, #0
	bl ClearText
	ldr r6, _08086860 @ =gPlaySt
	movs r0, #0xe
	ldrsb r0, [r6, r0]
	bl GetChapterInfo
	adds r0, #0x8a
	ldrh r0, [r0]
	bl DecodeMsg
	adds r4, r0, #0
	movs r0, #0x40
	adds r1, r4, #0
	bl GetStringTextCenteredPos
	adds r1, r0, #0
	adds r0, r5, #0
	movs r2, #0
	adds r3, r4, #0
	bl Text_InsertDrawString
	movs r0, #0xe
	ldrsb r0, [r6, r0]
	bl GetChapterInfo
	adds r0, #0x8c
	ldrb r0, [r0]
	cmp r0, #4
	bls _08086854
	b _08086950
_08086854:
	lsls r0, r0, #2
	ldr r1, _08086864 @ =_08086868
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08086860: .4byte gPlaySt
_08086864: .4byte _08086868
_08086868: @ jump table
	.4byte _0808687C @ case 0
	.4byte _08086884 @ case 1
	.4byte _080868CC @ case 2
	.4byte _0808687C @ case 3
	.4byte _0808687C @ case 4
_0808687C:
	adds r1, r7, #0
	adds r1, #0x44
	movs r0, #0
	b _0808694E
_08086884:
	adds r4, r7, #0
	adds r4, #0x34
	ldr r3, _080868AC @ =gUnk_0841D0CC
	adds r0, r4, #0
	movs r1, #0x14
	movs r2, #0
	bl Text_InsertDrawString
	ldr r0, _080868B0 @ =gPlaySt
	ldrb r0, [r0, #0xd]
	cmp r0, #0
	beq _080868B8
	ldr r3, _080868B4 @ =gUnk_0841D0D4
	adds r0, r4, #0
	movs r1, #0x24
	movs r2, #1
	bl Text_InsertDrawString
	b _08086948
	.align 2, 0
_080868AC: .4byte gUnk_0841D0CC
_080868B0: .4byte gPlaySt
_080868B4: .4byte gUnk_0841D0D4
_080868B8:
	movs r0, #0x80
	bl sub_80872A4
	adds r3, r0, #0
	adds r0, r4, #0
	movs r1, #0x2c
	movs r2, #2
	bl Text_InsertDrawNumberOrBlank
	b _08086948
_080868CC:
	ldr r5, _08086900 @ =gPlaySt
	ldrh r4, [r5, #0x10]
	movs r0, #0xe
	ldrsb r0, [r5, r0]
	bl GetChapterInfo
	adds r0, #0x8d
	ldrb r0, [r0]
	subs r0, #1
	cmp r4, r0
	blt _08086908
	ldr r5, _08086904 @ =gUnk_0841D0DC
	adds r4, r7, #0
	adds r4, #0x34
	movs r0, #0x40
	adds r1, r5, #0
	bl GetStringTextCenteredPos
	adds r1, r0, #0
	adds r0, r4, #0
	movs r2, #4
	adds r3, r5, #0
	bl Text_InsertDrawString
	b _08086948
	.align 2, 0
_08086900: .4byte gPlaySt
_08086904: .4byte gUnk_0841D0DC
_08086908:
	adds r4, r7, #0
	adds r4, #0x34
	ldrh r3, [r5, #0x10]
	adds r0, r4, #0
	movs r1, #0xa
	movs r2, #2
	bl Text_InsertDrawNumberOrBlank
	ldr r3, _08086958 @ =gUnk_0841D0E8
	adds r0, r4, #0
	movs r1, #0x12
	movs r2, #0
	bl Text_InsertDrawString
	movs r0, #0xe
	ldrsb r0, [r5, r0]
	bl GetChapterInfo
	adds r0, #0x8d
	ldrb r3, [r0]
	subs r3, #1
	adds r0, r4, #0
	movs r1, #0x22
	movs r2, #2
	bl Text_InsertDrawNumberOrBlank
	ldr r3, _0808695C @ =gUnk_0841D0EC
	adds r0, r4, #0
	movs r1, #0x2a
	movs r2, #0
	bl Text_InsertDrawString
_08086948:
	adds r1, r7, #0
	adds r1, #0x44
	movs r0, #1
_0808694E:
	strh r0, [r1]
_08086950:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08086958: .4byte gUnk_0841D0E8
_0808695C: .4byte gUnk_0841D0EC

	thumb_func_start sub_8086960
sub_8086960: @ 0x08086960
	push {r4, r5, lr}
	adds r4, r0, #0
	movs r0, #0
	str r0, [r4, #0x58]
	adds r1, r4, #0
	adds r1, #0x55
	movs r0, #1
	strb r0, [r1]
	bl sub_808512C
	adds r1, r4, #0
	adds r1, #0x50
	strb r0, [r1]
	ldr r0, _080869EC @ =gUnk_08D8B134
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	lsls r1, r1, #3
	adds r1, r1, r0
	movs r0, #4
	ldrsb r0, [r1, r0]
	ldrb r1, [r1, #5]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	bl sub_8085110
	adds r5, r0, #0
	ldr r0, _080869F0 @ =gUnk_08D8B1A0
	bl Proc_Find
	cmp r0, #0
	beq _080869B0
	adds r1, r0, #0
	adds r1, #0x57
	movs r0, #0
	ldrsb r0, [r1, r0]
	cmp r0, #0
	blt _080869B0
	cmp r0, r5
	beq _080869E4
_080869B0:
	adds r0, r4, #0
	adds r0, #0x57
	strb r5, [r0]
	adds r0, r4, #0
	bl sub_8086748
	ldr r1, _080869F4 @ =gBmSt
	ldrh r0, [r1, #0x14]
	adds r2, r4, #0
	adds r2, #0x4e
	strb r0, [r2]
	ldrh r0, [r1, #0x16]
	adds r3, r4, #0
	adds r3, #0x4f
	strb r0, [r3]
	ldrb r1, [r2]
	adds r0, r4, #0
	adds r0, #0x4c
	strb r1, [r0]
	ldrb r0, [r3]
	adds r1, r4, #0
	adds r1, #0x4d
	strb r0, [r1]
	adds r0, r4, #0
	bl Proc_Break
_080869E4:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080869EC: .4byte gUnk_08D8B134
_080869F0: .4byte gUnk_08D8B1A0
_080869F4: .4byte gBmSt

	thumb_func_start sub_80869F8
sub_80869F8: @ 0x080869F8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	adds r7, r1, #0
	mov sl, r2
	ldr r1, _08086B80 @ =gUnk_08D8B134
	lsls r0, r0, #3
	adds r0, r0, r1
	movs r1, #4
	ldrsb r1, [r0, r1]
	mov r8, r1
	ldrb r0, [r0, #5]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	mov sb, r0
	cmp r1, #0
	bge _08086A66
	cmp r0, #0
	bge _08086A66
	ldr r4, _08086B84 @ =gBg1Tm
	adds r0, r4, #0
	movs r1, #0xc
	movs r2, #6
	movs r3, #0
	bl TmFillRect_thm
	ldr r5, _08086B88 @ =gBg0Tm
	adds r0, r5, #0
	movs r1, #0xc
	movs r2, #6
	movs r3, #0
	bl TmFillRect_thm
	movs r0, #0x10
	subs r0, r0, r7
	lsls r0, r0, #6
	ldr r1, _08086B8C @ =0x02003764
	adds r0, r0, r1
	adds r1, r4, #0
	movs r2, #0xc
	adds r3, r7, #0
	bl TmCopyRect_thm
	movs r0, #0x12
	subs r0, r0, r7
	lsls r0, r0, #6
	ldr r1, _08086B90 @ =0x02003264
	adds r0, r0, r1
	adds r1, r5, #0
	movs r2, #0xc
	adds r3, r7, #0
	bl TmCopyRect_thm
_08086A66:
	mov r0, r8
	cmp r0, #0
	ble _08086AB6
	mov r1, sb
	cmp r1, #0
	bge _08086AB6
	ldr r4, _08086B94 @ =gBg1Tm + 0x26
	adds r0, r4, #0
	movs r1, #0xc
	movs r2, #6
	movs r3, #0
	bl TmFillRect_thm
	ldr r5, _08086B98 @ =gBg0Tm + 0x26
	adds r0, r5, #0
	movs r1, #0xc
	movs r2, #6
	movs r3, #0
	bl TmFillRect_thm
	movs r0, #0x10
	subs r0, r0, r7
	lsls r0, r0, #6
	ldr r1, _08086B8C @ =0x02003764
	adds r0, r0, r1
	adds r1, r4, #0
	movs r2, #0xc
	adds r3, r7, #0
	bl TmCopyRect_thm
	movs r0, #0x12
	subs r0, r0, r7
	lsls r0, r0, #6
	ldr r1, _08086B90 @ =0x02003264
	adds r0, r0, r1
	adds r1, r5, #0
	movs r2, #0xc
	adds r3, r7, #0
	bl TmCopyRect_thm
_08086AB6:
	mov r0, r8
	cmp r0, #0
	bge _08086B10
	mov r1, sb
	cmp r1, #0
	ble _08086B10
	ldr r5, _08086B9C @ =gBg1Tm + 0x380
	adds r0, r5, #0
	movs r1, #0xc
	movs r2, #6
	movs r3, #0
	bl TmFillRect_thm
	ldr r6, _08086BA0 @ =gBg0Tm + 0x380
	adds r0, r6, #0
	movs r1, #0xc
	movs r2, #6
	movs r3, #0
	bl TmFillRect_thm
	ldr r0, _08086BA4 @ =0x020039E4
	movs r4, #1
	mov r1, sl
	subs r4, r4, r1
	lsls r4, r4, #1
	adds r4, #0x14
	subs r4, r4, r7
	lsls r4, r4, #6
	ldr r1, _08086BA8 @ =0xFFFFFC80
	adds r5, r5, r1
	adds r5, r4, r5
	adds r1, r5, #0
	movs r2, #0xc
	adds r3, r7, #0
	bl TmCopyRect_thm
	ldr r0, _08086BAC @ =0x02003564
	ldr r1, _08086BA8 @ =0xFFFFFC80
	adds r6, r6, r1
	adds r4, r4, r6
	adds r1, r4, #0
	movs r2, #0xc
	adds r3, r7, #0
	bl TmCopyRect_thm
_08086B10:
	mov r0, r8
	cmp r0, #0
	ble _08086B6A
	mov r1, sb
	cmp r1, #0
	ble _08086B6A
	ldr r5, _08086BB0 @ =gBg1Tm + 0x3a6
	adds r0, r5, #0
	movs r1, #0xc
	movs r2, #6
	movs r3, #0
	bl TmFillRect_thm
	ldr r6, _08086BB4 @ =gBg0Tm + 0x3a6
	adds r0, r6, #0
	movs r1, #0xc
	movs r2, #6
	movs r3, #0
	bl TmFillRect_thm
	ldr r0, _08086BA4 @ =0x020039E4
	movs r4, #1
	mov r1, sl
	subs r4, r4, r1
	lsls r4, r4, #1
	adds r4, #0x14
	subs r4, r4, r7
	lsls r4, r4, #6
	ldr r1, _08086BA8 @ =0xFFFFFC80
	adds r5, r5, r1
	adds r5, r4, r5
	adds r1, r5, #0
	movs r2, #0xc
	adds r3, r7, #0
	bl TmCopyRect_thm
	ldr r0, _08086BAC @ =0x02003564
	ldr r1, _08086BA8 @ =0xFFFFFC80
	adds r6, r6, r1
	adds r4, r4, r6
	adds r1, r4, #0
	movs r2, #0xc
	adds r3, r7, #0
	bl TmCopyRect_thm
_08086B6A:
	movs r0, #3
	bl EnableBgSync
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08086B80: .4byte gUnk_08D8B134
_08086B84: .4byte gBg1Tm
_08086B88: .4byte gBg0Tm
_08086B8C: .4byte 0x02003764
_08086B90: .4byte 0x02003264
_08086B94: .4byte gBg1Tm + 0x26
_08086B98: .4byte gBg0Tm + 0x26
_08086B9C: .4byte gBg1Tm + 0x380
_08086BA0: .4byte gBg0Tm + 0x380
_08086BA4: .4byte 0x020039E4
_08086BA8: .4byte 0xFFFFFC80
_08086BAC: .4byte 0x02003564
_08086BB0: .4byte gBg1Tm + 0x3a6
_08086BB4: .4byte gBg0Tm + 0x3a6

	thumb_func_start sub_8086BB8
sub_8086BB8: @ 0x08086BB8
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, _08086BFC @ =gUnk_08D8B2D0
	ldr r0, [r4, #0x58]
	adds r0, r0, r1
	movs r1, #0
	ldrsb r1, [r0, r1]
	adds r0, r4, #0
	adds r0, #0x50
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r2, r4, #0
	adds r2, #0x44
	movs r3, #0
	ldrsh r2, [r2, r3]
	bl sub_80869F8
	ldr r0, [r4, #0x58]
	adds r0, #1
	str r0, [r4, #0x58]
	cmp r0, #5
	bne _08086BF6
	movs r0, #0
	str r0, [r4, #0x58]
	adds r1, r4, #0
	adds r1, #0x55
	strb r0, [r1]
	adds r0, r4, #0
	bl Proc_Break
_08086BF6:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08086BFC: .4byte gUnk_08D8B2D0

	thumb_func_start sub_8086C00
sub_8086C00: @ 0x08086C00
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r6, r4, #0
	adds r6, #0x55
	movs r5, #0
	movs r0, #1
	strb r0, [r6]
	ldr r1, _08086C58 @ =gUnk_08D8B2D5
	ldr r0, [r4, #0x58]
	adds r0, r0, r1
	movs r1, #0
	ldrsb r1, [r0, r1]
	adds r0, r4, #0
	adds r0, #0x50
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r2, r4, #0
	adds r2, #0x44
	movs r3, #0
	ldrsh r2, [r2, r3]
	bl sub_80869F8
	ldr r0, [r4, #0x58]
	adds r0, #1
	str r0, [r4, #0x58]
	cmp r0, #3
	bne _08086C50
	str r5, [r4, #0x58]
	strb r5, [r6]
	adds r0, r4, #0
	adds r0, #0x56
	strb r5, [r0]
	adds r1, r4, #0
	adds r1, #0x57
	movs r0, #0xff
	strb r0, [r1]
	adds r0, r4, #0
	bl Proc_Break
_08086C50:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08086C58: .4byte gUnk_08D8B2D5

	thumb_func_start nullsub_71
nullsub_71: @ 0x08086C5C
	bx lr
	.align 2, 0

	thumb_func_start nullsub_72
nullsub_72: @ 0x08086C60
	bx lr
	.align 2, 0

	thumb_func_start nullsub_73
nullsub_73: @ 0x08086C64
	bx lr
	.align 2, 0

	thumb_func_start sub_8086C68
sub_8086C68: @ 0x08086C68
	push {r4, lr}
	adds r4, r0, #0
	adds r3, r4, #0
	adds r3, #0x4e
	ldrb r0, [r3]
	adds r2, r4, #0
	adds r2, #0x4c
	strb r0, [r2]
	movs r0, #0x4f
	adds r0, r0, r4
	mov ip, r0
	ldrb r0, [r0]
	adds r1, r4, #0
	adds r1, #0x4d
	strb r0, [r1]
	ldr r1, _08086CEC @ =gBmSt
	ldrh r0, [r1, #0x14]
	strb r0, [r3]
	ldrh r0, [r1, #0x16]
	mov r1, ip
	strb r0, [r1]
	ldr r0, _08086CF0 @ =0x0000FFFF
	adds r1, r0, #0
	ldrh r3, [r3]
	ands r1, r3
	ldrh r2, [r2]
	ands r0, r2
	cmp r1, r0
	beq _08086CE6
	ldr r0, _08086CF4 @ =ProcScr_CamMove
	bl Proc_Find
	cmp r0, #0
	bne _08086CD8
	bl sub_808512C
	adds r1, r0, #0
	adds r0, r4, #0
	adds r0, #0x50
	movs r2, #0
	ldrsb r2, [r0, r2]
	cmp r1, r2
	beq _08086CE6
	ldr r0, _08086CF8 @ =gUnk_08D8B134
	lsls r1, r1, #3
	adds r3, r1, r0
	lsls r1, r2, #3
	adds r1, r1, r0
	ldrb r2, [r3, #4]
	ldrb r0, [r1, #4]
	cmp r2, r0
	bne _08086CD8
	ldrb r3, [r3, #5]
	ldrb r1, [r1, #5]
	cmp r3, r1
	beq _08086CE6
_08086CD8:
	adds r1, r4, #0
	adds r1, #0x56
	movs r0, #1
	strb r0, [r1]
	adds r0, r4, #0
	bl Proc_Break
_08086CE6:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08086CEC: .4byte gBmSt
_08086CF0: .4byte 0x0000FFFF
_08086CF4: .4byte ProcScr_CamMove
_08086CF8: .4byte gUnk_08D8B134

	thumb_func_start sub_8086CFC
sub_8086CFC: @ 0x08086CFC
	push {lr}
	ldr r0, _08086D44 @ =gUnk_08D8B200
	bl Proc_Find
	cmp r0, #0
	beq _08086D14
	adds r0, #0x56
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne _08086D40
_08086D14:
	ldr r0, _08086D48 @ =gUnk_08D8B1A0
	bl Proc_Find
	cmp r0, #0
	beq _08086D2A
	adds r0, #0x56
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne _08086D40
_08086D2A:
	ldr r0, _08086D4C @ =gUnk_08D8B2D8
	bl Proc_Find
	cmp r0, #0
	beq _08086D50
	adds r0, #0x56
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _08086D50
_08086D40:
	movs r0, #1
	b _08086D52
	.align 2, 0
_08086D44: .4byte gUnk_08D8B200
_08086D48: .4byte gUnk_08D8B1A0
_08086D4C: .4byte gUnk_08D8B2D8
_08086D50:
	movs r0, #0
_08086D52:
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_8086D58
sub_8086D58: @ 0x08086D58
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08086D80 @ =gUnk_0841D838
	ldr r1, _08086D84 @ =0x06015000
	bl Decompress
	adds r1, r4, #0
	adds r1, #0x46
	movs r2, #0
	movs r0, #0x88
	strh r0, [r1]
	adds r1, #2
	movs r0, #0x8c
	strh r0, [r1]
	adds r0, r4, #0
	adds r0, #0x56
	strb r2, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08086D80: .4byte gUnk_0841D838
_08086D84: .4byte 0x06015000

	thumb_func_start sub_8086D88
sub_8086D88: @ 0x08086D88
	push {r4, r5, lr}
	adds r3, r0, #0
	adds r5, r2, #0
	ldr r0, _08086E08 @ =gUnk_08D8B134
	lsls r1, r1, #3
	adds r1, r1, r0
	movs r2, #4
	ldrsb r2, [r1, r2]
	movs r4, #5
	ldrsb r4, [r1, r4]
	cmp r2, #0
	bge _08086DB6
	cmp r4, #0
	bge _08086DB6
	adds r1, r3, #0
	adds r1, #0x46
	movs r0, #8
	strh r0, [r1]
	adds r1, r5, #0
	subs r1, #0x18
	adds r0, r3, #0
	adds r0, #0x48
	strh r1, [r0]
_08086DB6:
	cmp r2, #0
	ble _08086DD0
	cmp r4, #0
	bge _08086DD0
	adds r1, r3, #0
	adds r1, #0x46
	movs r0, #0x88
	strh r0, [r1]
	adds r1, r5, #0
	subs r1, #0x18
	adds r0, r3, #0
	adds r0, #0x48
	strh r1, [r0]
_08086DD0:
	cmp r2, #0
	bge _08086DE8
	cmp r4, #0
	ble _08086DE8
	adds r1, r3, #0
	adds r1, #0x46
	movs r0, #8
	strh r0, [r1]
	movs r0, #0xa0
	subs r0, r0, r5
	adds r1, #2
	strh r0, [r1]
_08086DE8:
	cmp r2, #0
	ble _08086E00
	cmp r4, #0
	ble _08086E00
	adds r1, r3, #0
	adds r1, #0x46
	movs r0, #0x88
	strh r0, [r1]
	movs r0, #0xa0
	subs r0, r0, r5
	adds r1, #2
	strh r0, [r1]
_08086E00:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08086E08: .4byte gUnk_08D8B134

	thumb_func_start sub_8086E0C
sub_8086E0C: @ 0x08086E0C
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	sub sp, #4
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r0, _08086E8C @ =0x000001FF
	mov r8, r0
	adds r1, r4, #0
	ands r1, r0
	movs r0, #0xff
	ands r5, r0
	ldr r6, _08086E90 @ =Sprite_32x16
	movs r0, #0xa0
	lsls r0, r0, #2
	str r0, [sp]
	movs r0, #4
	adds r2, r5, #0
	adds r3, r6, #0
	bl PutSprite
	adds r1, r4, #0
	adds r1, #0x20
	mov r0, r8
	ands r1, r0
	movs r0, #0xa1
	lsls r0, r0, #2
	str r0, [sp]
	movs r0, #4
	adds r2, r5, #0
	adds r3, r6, #0
	bl PutSprite
	adds r1, r4, #0
	adds r1, #0x40
	mov r0, r8
	ands r1, r0
	movs r0, #0xa2
	lsls r0, r0, #2
	str r0, [sp]
	movs r0, #4
	adds r2, r5, #0
	adds r3, r6, #0
	bl PutSprite
	adds r4, #0x60
	mov r0, r8
	ands r4, r0
	ldr r3, _08086E94 @ =Sprite_8x16
	movs r0, #0xa3
	lsls r0, r0, #2
	str r0, [sp]
	movs r0, #4
	adds r1, r4, #0
	adds r2, r5, #0
	bl PutSprite
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08086E8C: .4byte 0x000001FF
_08086E90: .4byte Sprite_32x16
_08086E94: .4byte Sprite_8x16

	thumb_func_start sub_8086E98
sub_8086E98: @ 0x08086E98
	push {r4, r5, lr}
	adds r4, r0, #0
	bl sub_808512C
	adds r1, r4, #0
	adds r1, #0x50
	movs r5, #0
	strb r0, [r1]
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	ldr r2, [r4, #0x58]
	adds r0, r4, #0
	bl sub_8086D88
	str r5, [r4, #0x58]
	ldr r1, _08086ED0 @ =gBmSt
	ldrh r0, [r1, #0x14]
	adds r2, r4, #0
	adds r2, #0x4e
	strb r0, [r2]
	ldrh r0, [r1, #0x16]
	adds r4, #0x4f
	strb r0, [r4]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08086ED0: .4byte gBmSt

	thumb_func_start sub_8086ED4
sub_8086ED4: @ 0x08086ED4
	push {r4, lr}
	adds r4, r0, #0
	ldr r2, [r4, #0x58]
	adds r2, #4
	str r2, [r4, #0x58]
	adds r0, #0x50
	movs r1, #0
	ldrsb r1, [r0, r1]
	adds r0, r4, #0
	bl sub_8086D88
	adds r0, r4, #0
	adds r0, #0x46
	movs r1, #0
	ldrsh r0, [r0, r1]
	adds r1, r4, #0
	adds r1, #0x48
	movs r2, #0
	ldrsh r1, [r1, r2]
	bl sub_8086E0C
	ldr r0, [r4, #0x58]
	cmp r0, #0x18
	bne _08086F12
	adds r0, r4, #0
	bl Proc_Break
	adds r1, r4, #0
	adds r1, #0x56
	movs r0, #0
	strb r0, [r1]
_08086F12:
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_8086F18
sub_8086F18: @ 0x08086F18
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x46
	movs r1, #0
	ldrsh r0, [r0, r1]
	adds r1, r4, #0
	adds r1, #0x48
	movs r2, #0
	ldrsh r1, [r1, r2]
	bl sub_8086E0C
	adds r3, r4, #0
	adds r3, #0x4e
	ldrb r0, [r3]
	adds r2, r4, #0
	adds r2, #0x4c
	strb r0, [r2]
	movs r0, #0x4f
	adds r0, r0, r4
	mov ip, r0
	ldrb r0, [r0]
	adds r1, r4, #0
	adds r1, #0x4d
	strb r0, [r1]
	ldr r1, _08086FB0 @ =gBmSt
	ldrh r0, [r1, #0x14]
	strb r0, [r3]
	ldrh r0, [r1, #0x16]
	mov r1, ip
	strb r0, [r1]
	ldr r0, _08086FB4 @ =0x0000FFFF
	adds r1, r0, #0
	ldrh r3, [r3]
	ands r1, r3
	ldrh r2, [r2]
	ands r0, r2
	cmp r1, r0
	beq _08086FA8
	ldr r0, _08086FB8 @ =ProcScr_CamMove
	bl Proc_Find
	cmp r0, #0
	bne _08086F9A
	bl sub_808512C
	adds r1, r0, #0
	adds r0, r4, #0
	adds r0, #0x50
	movs r2, #0
	ldrsb r2, [r0, r2]
	cmp r1, r2
	beq _08086FA8
	ldr r0, _08086FBC @ =gUnk_08D8B134
	lsls r1, r1, #3
	adds r3, r1, r0
	lsls r1, r2, #3
	adds r1, r1, r0
	ldrb r2, [r3, #4]
	ldrb r0, [r1, #4]
	cmp r2, r0
	bne _08086F9A
	ldrb r3, [r3, #5]
	ldrb r1, [r1, #5]
	cmp r3, r1
	beq _08086FA8
_08086F9A:
	adds r1, r4, #0
	adds r1, #0x56
	movs r0, #1
	strb r0, [r1]
	adds r0, r4, #0
	bl Proc_Break
_08086FA8:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08086FB0: .4byte gBmSt
_08086FB4: .4byte 0x0000FFFF
_08086FB8: .4byte ProcScr_CamMove
_08086FBC: .4byte gUnk_08D8B134

	thumb_func_start sub_8086FC0
sub_8086FC0: @ 0x08086FC0
	push {r4, lr}
	adds r4, r0, #0
	ldr r2, [r4, #0x58]
	subs r2, #4
	str r2, [r4, #0x58]
	adds r0, #0x50
	movs r1, #0
	ldrsb r1, [r0, r1]
	adds r0, r4, #0
	bl sub_8086D88
	adds r0, r4, #0
	adds r0, #0x46
	movs r1, #0
	ldrsh r0, [r0, r1]
	adds r1, r4, #0
	adds r1, #0x48
	movs r2, #0
	ldrsh r1, [r1, r2]
	bl sub_8086E0C
	ldr r1, [r4, #0x58]
	cmp r1, #0
	bne _08086FFC
	adds r0, r4, #0
	adds r0, #0x56
	strb r1, [r0]
	adds r0, r4, #0
	bl Proc_Break
_08086FFC:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_8087004
sub_8087004: @ 0x08087004
	push {lr}
	ldr r1, _08087024 @ =0x03007FF8
	movs r0, #1
	strh r0, [r1]
	bl SyncDispIo
	bl SyncBgsAndPal
	bl ApplyDataMoves
	bl SoundVSync_rev01
	bl m4aSoundMain
	pop {r0}
	bx r0
	.align 2, 0
_08087024: .4byte 0x03007FF8

	thumb_func_start sub_8087028
sub_8087028: @ 0x08087028
	push {r4, lr}
	ldr r4, _08087050 @ =gpKeySt
	ldr r0, [r4]
	bl RefreshKeySt
	ldr r1, [r4]
	movs r0, #9
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _08087044
	movs r0, #0xff
	bl SoftReset
_08087044:
	bl VBlankIntrWait
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08087050: .4byte gpKeySt

	thumb_func_start sub_8087054
sub_8087054: @ 0x08087054
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #0x7c
	add r5, sp, #0x18
	bl ResetText
	bl InitTalkTextFont
	add r7, sp, #8
	add r0, sp, #0x10
	mov r8, r0
	mov r4, sp
	movs r6, #2
_08087070:
	adds r0, r4, #0
	movs r1, #0x16
	bl InitText
	adds r0, r4, #0
	movs r1, #0
	bl Text_SetColor
	adds r4, #8
	subs r6, #1
	cmp r6, #0
	bge _08087070
	movs r1, #0
	str r1, [r5, #0x30]
	mov r0, sp
	str r0, [r5, #0x34]
	str r7, [r5, #0x38]
	mov r0, r8
	str r0, [r5, #0x3c]
	adds r0, r5, #0
	adds r0, #0x5c
	strh r1, [r0]
	ldr r0, _080870E0 @ =0x00000719
	bl DecodeMsg
	str r0, [r5, #0x2c]
	adds r0, r5, #0
	bl sub_808356C
	ldr r4, _080870E4 @ =gBg0Tm + 0x188
	mov r0, sp
	adds r1, r4, #0
	bl PutText
	adds r1, r4, #0
	adds r1, #0xc0
	adds r0, r7, #0
	bl PutText
	movs r0, #0xa0
	lsls r0, r0, #1
	adds r4, r4, r0
	mov r0, r8
	adds r1, r4, #0
	bl PutText
	movs r0, #1
	bl EnableBgSync
	add sp, #0x7c
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080870E0: .4byte 0x00000719
_080870E4: .4byte gBg0Tm + 0x188

	thumb_func_start sub_80870E8
sub_80870E8: @ 0x080870E8
	push {r4, r5, lr}
	sub sp, #8
	movs r0, #0
	bl InitBgs
	bl m4aSoundInit
	bl Proc_Init
	movs r0, #0
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	ldr r5, _08087198 @ =gDispIo
	movs r0, #1
	ldrb r1, [r5, #1]
	orrs r0, r1
	movs r1, #3
	rsbs r1, r1, #0
	ands r0, r1
	subs r1, #2
	ands r0, r1
	subs r1, #4
	ands r0, r1
	subs r1, #8
	ands r0, r1
	subs r1, #0x10
	ands r0, r1
	subs r1, #0x20
	ands r0, r1
	movs r1, #0x7f
	ands r0, r1
	strb r0, [r5, #1]
	adds r1, r5, #0
	adds r1, #0x3c
	movs r0, #0x3f
	ldrb r2, [r1]
	ands r0, r2
	strb r0, [r1]
	adds r1, #8
	movs r4, #0
	movs r0, #0x10
	strb r0, [r1]
	adds r0, r5, #0
	adds r0, #0x45
	strb r4, [r0]
	adds r0, #1
	strb r4, [r0]
	movs r0, #0
	bl SetOnHBlankA
	strh r4, [r5, #0x38]
	bl SyncDispIo
	str r4, [sp]
	movs r1, #0xc0
	lsls r1, r1, #0x13
	ldr r5, _0808719C @ =0x01000008
	mov r0, sp
	adds r2, r5, #0
	bl CpuFastSet
	str r4, [sp, #4]
	add r0, sp, #4
	ldr r1, _080871A0 @ =0x06008000
	adds r2, r5, #0
	bl CpuFastSet
	bl sub_8087054
	ldr r0, _080871A4 @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08087188
	movs r0, #0x7b
	bl m4aSongNumStart
_08087188:
	ldr r0, _080871A8 @ =sub_8087028
	bl SetMainFunc
	add sp, #8
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08087198: .4byte gDispIo
_0808719C: .4byte 0x01000008
_080871A0: .4byte 0x06008000
_080871A4: .4byte gPlaySt
_080871A8: .4byte sub_8087028

	thumb_func_start sub_80871AC
sub_80871AC: @ 0x080871AC
	push {lr}
	ldr r1, _080871D4 @ =0x04000004
	movs r0, #8
	strh r0, [r1]
	ldr r1, _080871D8 @ =0x04000208
	movs r0, #1
	strh r0, [r1]
	movs r1, #0x80
	lsls r1, r1, #0x13
	movs r0, #0
	strh r0, [r1]
	ldr r0, _080871DC @ =sub_8087004
	bl SetOnVBlank
	ldr r0, _080871E0 @ =sub_80870E8
	bl SetMainFunc
	pop {r0}
	bx r0
	.align 2, 0
_080871D4: .4byte 0x04000004
_080871D8: .4byte 0x04000208
_080871DC: .4byte sub_8087004
_080871E0: .4byte sub_80870E8

	thumb_func_start sub_80871E4
sub_80871E4: @ 0x080871E4
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08087200 @ =0x06014800
	movs r1, #9
	bl LoadHelpBoxGfx
	ldr r0, _08087204 @ =gUnk_08DAF58C
	adds r1, r4, #0
	bl StartMovingHelpBox
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08087200: .4byte 0x06014800
_08087204: .4byte gUnk_08DAF58C

	thumb_func_start sub_8087208
sub_8087208: @ 0x08087208
	push {r4, lr}
	movs r4, #1
_0808720C:
	adds r0, r4, #0
	bl GetUnit
	adds r1, r0, #0
	cmp r1, #0
	beq _08087222
	ldr r0, [r1]
	cmp r0, #0
	beq _08087222
	adds r0, r1, #0
	b _0808722A
_08087222:
	adds r4, #1
	cmp r4, #0x3f
	ble _0808720C
	movs r0, #0
_0808722A:
	pop {r4}
	pop {r1}
	bx r1

	thumb_func_start sub_8087230
sub_8087230: @ 0x08087230
	push {r4, lr}
	movs r4, #0x81
_08087234:
	adds r0, r4, #0
	bl GetUnit
	adds r2, r0, #0
	cmp r2, #0
	beq _0808725C
	ldr r1, [r2]
	cmp r1, #0
	beq _0808725C
	ldr r0, [r2, #4]
	ldr r1, [r1, #0x28]
	ldr r0, [r0, #0x28]
	orrs r1, r0
	movs r0, #0x80
	lsls r0, r0, #8
	ands r1, r0
	cmp r1, #0
	beq _0808725C
	adds r0, r2, #0
	b _08087264
_0808725C:
	adds r4, #1
	cmp r4, #0xbf
	ble _08087234
	movs r0, #0
_08087264:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_808726C
sub_808726C: @ 0x0808726C
	push {r4, r5, lr}
	movs r5, #0
	movs r4, #0x81
_08087272:
	adds r0, r4, #0
	bl GetUnit
	cmp r0, #0
	beq _08087296
	ldr r1, [r0]
	cmp r1, #0
	beq _08087296
	ldr r0, [r0, #4]
	ldr r1, [r1, #0x28]
	ldr r0, [r0, #0x28]
	orrs r1, r0
	movs r0, #0x80
	lsls r0, r0, #8
	ands r1, r0
	cmp r1, #0
	beq _08087296
	adds r5, #1
_08087296:
	adds r4, #1
	cmp r4, #0xbf
	ble _08087272
	adds r0, r5, #0
	pop {r4, r5}
	pop {r1}
	bx r1

	thumb_func_start sub_80872A4
sub_80872A4: @ 0x080872A4
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	movs r6, #0
	adds r4, r5, #1
	b _080872D0
_080872AE:
	adds r0, r4, #0
	bl GetUnit
	adds r1, r0, #0
	cmp r1, #0
	beq _080872CC
	ldr r0, [r1]
	cmp r0, #0
	beq _080872CC
	ldr r0, [r1, #0xc]
	ldr r1, _080872E0 @ =0x0001000C
	ands r0, r1
	cmp r0, #0
	bne _080872CC
	adds r6, #1
_080872CC:
	adds r4, #1
	adds r0, r5, #0
_080872D0:
	adds r0, #0x40
	cmp r4, r0
	blt _080872AE
	adds r0, r6, #0
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_080872E0: .4byte 0x0001000C

	thumb_func_start sub_80872E4
sub_80872E4: @ 0x080872E4
	push {r4, r5, lr}
	bl GetGameTime
	lsrs r1, r0, #1
	movs r2, #0x1f
	ands r1, r2
	ldr r0, _08087344 @ =gUnk_0841BBB0
	adds r0, #0x5e
	ldrh r4, [r0]
	ldr r5, _08087348 @ =gPal + 0x2f6
	cmp r1, #0x10
	ble _08087304
	movs r0, #0xf
	ands r0, r1
	movs r1, #0x10
	subs r1, r1, r0
_08087304:
	movs r3, #0x1f
	adds r0, r4, #0
	ands r0, r2
	movs r2, #0x10
	subs r2, r2, r1
	adds r1, r0, #0
	muls r1, r2, r1
	asrs r1, r1, #4
	ands r1, r3
	movs r3, #0xf8
	lsls r3, r3, #2
	adds r0, r4, #0
	ands r0, r3
	muls r0, r2, r0
	asrs r0, r0, #4
	ands r0, r3
	adds r1, r1, r0
	movs r3, #0xf8
	lsls r3, r3, #7
	ands r4, r3
	adds r0, r4, #0
	muls r0, r2, r0
	asrs r0, r0, #4
	ands r0, r3
	adds r1, r1, r0
	strh r1, [r5]
	strh r1, [r5, #0x20]
	bl EnablePalSync
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08087344: .4byte gUnk_0841BBB0
_08087348: .4byte gPal + 0x2f6

	thumb_func_start sub_808734C
sub_808734C: @ 0x0808734C
	push {lr}
	sub sp, #4
	adds r1, r0, #0
	cmp r1, #0
	beq _0808736A
	ldrb r0, [r1]
	cmp r0, #0
	beq _0808736A
_0808735C:
	ldrb r0, [r1]
	cmp r0, #0
	beq _0808736A
	cmp r0, #1
	bne _0808736E
	adds r0, r1, #1
	b _0808737A
_0808736A:
	movs r0, #0
	b _0808737A
_0808736E:
	adds r0, r1, #0
	mov r1, sp
	bl GetCharTextLen
	adds r1, r0, #0
	b _0808735C
_0808737A:
	add sp, #4
	pop {r1}
	bx r1

	thumb_func_start sub_8087380
sub_8087380: @ 0x08087380
	push {lr}
	sub sp, #4
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080873A8
	movs r0, #0
	str r0, [sp]
	ldr r1, _080873A0 @ =gPal + 0x3a0
	ldr r2, _080873A4 @ =0x01000008
	mov r0, sp
	bl CpuFastSet
	bl EnablePalSync
	b _080873AC
	.align 2, 0
_080873A0: .4byte gPal + 0x3a0
_080873A4: .4byte 0x01000008
_080873A8:
	bl ApplyUnitSpritePalettes
_080873AC:
	add sp, #4
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_80873B4
sub_80873B4: @ 0x080873B4
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	mov r8, r0
	movs r0, #0
	bl InitBgs
	ldr r7, _080874CC @ =gDispIo
	movs r4, #4
	rsbs r4, r4, #0
	adds r2, r4, #0
	ldrb r0, [r7, #0x10]
	ands r2, r0
	movs r1, #1
	mov ip, r1
	mov r6, ip
	orrs r2, r6
	adds r1, r4, #0
	ldrb r0, [r7, #0x14]
	ands r1, r0
	movs r5, #2
	orrs r1, r5
	movs r3, #3
	ldrb r6, [r7, #0x18]
	orrs r3, r6
	adds r0, r4, #0
	ldrb r6, [r7, #0xc]
	ands r0, r6
	strb r0, [r7, #0xc]
	ands r2, r4
	mov r0, ip
	orrs r2, r0
	strb r2, [r7, #0x10]
	ands r1, r4
	orrs r1, r5
	strb r1, [r7, #0x14]
	ands r3, r4
	orrs r3, r5
	strb r3, [r7, #0x18]
	bl ResetText
	movs r5, #0
	movs r0, #0
	mov r1, r8
	strh r0, [r1, #0x3c]
	mov r0, r8
	adds r0, #0x3e
	strb r5, [r0]
	subs r0, #0x14
	strb r5, [r0]
	ldr r4, _080874D0 @ =0x0000FFFE
	ldr r2, _080874D4 @ =0x0000FFFC
	movs r0, #0
	adds r1, r4, #0
	bl SetBgOffset
	movs r0, #1
	movs r1, #0
	adds r2, r4, #0
	bl SetBgOffset
	ldr r2, _080874D8 @ =0x0000FFEC
	movs r0, #2
	movs r1, #0
	bl SetBgOffset
	movs r0, #3
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	bl ClearUi
	ldr r0, _080874DC @ =gUnk_0841B080
	movs r1, #0x20
	movs r2, #0x60
	bl ApplyPaletteExt
	ldr r0, _080874E0 @ =gUnk_0841ADDC
	ldr r1, _080874E4 @ =0x06005800
	bl Decompress
	ldr r0, _080874E8 @ =gBg2Tm
	ldr r1, _080874EC @ =gUnk_0841B0E0
	movs r2, #0x96
	lsls r2, r2, #5
	bl TmApplyTsa_thm
	adds r1, r7, #0
	adds r1, #0x3c
	movs r0, #0x3f
	ldrb r2, [r1]
	ands r0, r2
	strb r0, [r1]
	adds r1, #8
	movs r0, #0x10
	strb r0, [r1]
	adds r0, r7, #0
	adds r0, #0x45
	strb r5, [r0]
	adds r0, #1
	strb r5, [r0]
	movs r0, #0xf
	bl EnableBgSync
	mov r0, r8
	adds r0, #0x2d
	strb r5, [r0]
	adds r0, #1
	strb r5, [r0]
	bl sub_8087208
	mov r4, r8
	str r0, [r4, #0x34]
	movs r0, #0
	bl sub_80872A4
	mov r1, r8
	adds r1, #0x2f
	strb r0, [r1]
	bl GetGlobalCompletionCount
	mov r1, r8
	adds r1, #0x2b
	strb r0, [r1]
	ldr r2, [r4, #0x34]
	ldr r1, [r2, #0xc]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _080874F0
	movs r0, #3
	rsbs r0, r0, #0
	ands r1, r0
	str r1, [r2, #0xc]
	mov r1, r8
	adds r1, #0x29
	movs r0, #1
	strb r0, [r1]
	b _080874F6
	.align 2, 0
_080874CC: .4byte gDispIo
_080874D0: .4byte 0x0000FFFE
_080874D4: .4byte 0x0000FFFC
_080874D8: .4byte 0x0000FFEC
_080874DC: .4byte gUnk_0841B080
_080874E0: .4byte gUnk_0841ADDC
_080874E4: .4byte 0x06005800
_080874E8: .4byte gBg2Tm
_080874EC: .4byte gUnk_0841B0E0
_080874F0:
	mov r0, r8
	adds r0, #0x29
	strb r5, [r0]
_080874F6:
	bl sub_808726C
	cmp r0, #0
	beq _08087508
	bl sub_8087230
	mov r6, r8
	str r0, [r6, #0x38]
	b _0808750C
_08087508:
	mov r1, r8
	str r0, [r1, #0x38]
_0808750C:
	movs r0, #0x80
	bl sub_80872A4
	mov r1, r8
	adds r1, #0x30
	strb r0, [r1]
	bl ApplyUnitSpritePalettes
	mov r4, r8
	adds r4, #0x34
	movs r5, #1
_08087522:
	ldr r0, [r4]
	cmp r0, #0
	beq _08087530
	bl GetUnitSMSId
	bl sub_8025278
_08087530:
	adds r4, #4
	subs r5, #1
	cmp r5, #0
	bge _08087522
	bl ForceSyncUnitSpriteSheet
	ldr r6, _080875F0 @ =gDispIo
	movs r0, #0x20
	ldrb r2, [r6, #1]
	orrs r0, r2
	movs r1, #0x41
	rsbs r1, r1, #0
	ands r0, r1
	movs r1, #0x7f
	ands r0, r1
	strb r0, [r6, #1]
	adds r1, r6, #0
	adds r1, #0x2d
	movs r0, #0
	strb r0, [r1]
	adds r1, #4
	movs r0, #0x28
	strb r0, [r1]
	subs r1, #5
	movs r0, #0xf0
	strb r0, [r1]
	adds r1, #4
	movs r0, #0x48
	strb r0, [r1]
	adds r4, r6, #0
	adds r4, #0x34
	movs r1, #1
	ldrb r0, [r4]
	orrs r0, r1
	movs r2, #2
	orrs r0, r2
	movs r5, #4
	orrs r0, r5
	movs r3, #8
	orrs r0, r3
	movs r2, #0x10
	orrs r0, r2
	strb r0, [r4]
	adds r0, r6, #0
	adds r0, #0x36
	ldrb r4, [r0]
	orrs r1, r4
	movs r4, #3
	rsbs r4, r4, #0
	ands r1, r4
	orrs r1, r5
	orrs r1, r3
	orrs r1, r2
	strb r1, [r0]
	mov r0, r8
	movs r1, #0
	movs r2, #0xe
	bl StartMuralBackgroundAlt
	ldr r0, _080875F4 @ =gUnk_0841BC44
	movs r1, #0xe0
	lsls r1, r1, #1
	movs r2, #0x40
	bl ApplyPaletteExt
	movs r0, #0xc0
	movs r1, #0xe
	mov r2, r8
	bl StartHelpPromptSprite
	ldr r0, _080875F8 @ =gUnk_08D8B5A0
	mov r1, r8
	bl Proc_Start
	mov r0, r8
	bl NewSysBlackBoxHandler
	movs r0, #2
	rsbs r0, r0, #0
	ldrb r1, [r6, #1]
	ands r0, r1
	ands r0, r4
	movs r1, #5
	rsbs r1, r1, #0
	ands r0, r1
	subs r1, #4
	ands r0, r1
	subs r1, #8
	ands r0, r1
	strb r0, [r6, #1]
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080875F0: .4byte gDispIo
_080875F4: .4byte gUnk_0841BC44
_080875F8: .4byte gUnk_08D8B5A0

	thumb_func_start sub_80875FC
sub_80875FC: @ 0x080875FC
	push {r4, r5, lr}
	sub sp, #4
	adds r4, r0, #0
	ldr r5, _0808767C @ =0x020040CC
	ldr r0, _08087680 @ =gBg0Tm + 0x2b2
	movs r1, #3
	movs r2, #4
	movs r3, #0
	bl TmFillRect_thm
	adds r0, r5, #0
	adds r0, #8
	bl SetTextFont
	movs r0, #0
	bl SetTextFontGlyphs
	adds r0, r5, #0
	movs r1, #0
	bl SpriteText_DrawBackgroundExt
	cmp r4, #0
	bne _0808762C
	b _0808774C
_0808762C:
	ldr r0, [r4, #0xc]
	movs r1, #0xa0
	lsls r1, r1, #2
	ands r0, r1
	cmp r0, #0
	beq _08087688
	adds r0, r5, #0
	movs r1, #2
	bl Text_SetColor
	adds r0, r5, #0
	movs r1, #0x80
	bl Text_SetCursor
	ldr r4, _08087684 @ =gUnk_0841D0F4
	adds r0, r5, #0
	adds r1, r4, #0
	bl Text_DrawString
	adds r0, r5, #0
	movs r1, #0xa0
	bl Text_SetCursor
	adds r0, r5, #0
	adds r1, r4, #0
	bl Text_DrawString
	adds r0, r5, #0
	movs r1, #0xb8
	bl Text_SetCursor
	adds r0, r5, #0
	adds r1, r4, #0
	bl Text_DrawString
	movs r0, #1
	bl sub_8087380
	b _08087786
	.align 2, 0
_0808767C: .4byte 0x020040CC
_08087680: .4byte gBg0Tm + 0x2b2
_08087684: .4byte gUnk_0841D0F4
_08087688:
	adds r0, r5, #0
	movs r1, #0
	bl Text_SetColor
	ldr r0, [r4]
	ldrh r0, [r0]
	bl DecodeMsg
	adds r1, r0, #0
	adds r0, r5, #0
	bl Text_DrawString
	adds r0, r5, #0
	movs r1, #2
	bl Text_SetColor
	adds r0, r5, #0
	movs r1, #0x88
	bl Text_SetCursor
	movs r1, #8
	ldrsb r1, [r4, r1]
	adds r0, r5, #0
	bl Text_DrawNumberOrBlank
	adds r0, r4, #0
	bl GetUnitCurrentHp
	cmp r0, #0x63
	ble _080876DC
	adds r0, r5, #0
	movs r1, #0xa0
	bl Text_SetCursor
	ldr r1, _080876D8 @ =gUnk_0841D0F4
	adds r0, r5, #0
	bl Text_DrawString
	b _080876F2
	.align 2, 0
_080876D8: .4byte gUnk_0841D0F4
_080876DC:
	adds r0, r5, #0
	movs r1, #0xa8
	bl Text_SetCursor
	adds r0, r4, #0
	bl GetUnitCurrentHp
	adds r1, r0, #0
	adds r0, r5, #0
	bl Text_DrawNumberOrBlank
_080876F2:
	adds r0, r4, #0
	bl GetUnitMaxHp
	cmp r0, #0x63
	ble _08087714
	adds r0, r5, #0
	movs r1, #0xb8
	bl Text_SetCursor
	ldr r1, _08087710 @ =gUnk_0841D0F4
	adds r0, r5, #0
	bl Text_DrawString
	b _0808772A
	.align 2, 0
_08087710: .4byte gUnk_0841D0F4
_08087714:
	adds r0, r5, #0
	movs r1, #0xc0
	bl Text_SetCursor
	adds r0, r4, #0
	bl GetUnitMaxHp
	adds r1, r0, #0
	adds r0, r5, #0
	bl Text_DrawNumberOrBlank
_0808772A:
	adds r0, r4, #0
	bl GetUnitMiniPortraitId
	ldr r1, _08087748 @ =gBg0Tm + 0x2b2
	movs r2, #0xa0
	lsls r2, r2, #2
	movs r3, #0
	str r3, [sp]
	movs r3, #4
	bl PutFaceChibi
	movs r0, #0
	bl sub_8087380
	b _08087786
	.align 2, 0
_08087748: .4byte gBg0Tm + 0x2b2
_0808774C:
	adds r0, r5, #0
	movs r1, #2
	bl Text_SetColor
	adds r0, r5, #0
	movs r1, #0x80
	bl Text_SetCursor
	ldr r4, _080877E8 @ =gUnk_0841D0F4
	adds r0, r5, #0
	adds r1, r4, #0
	bl Text_DrawString
	adds r0, r5, #0
	movs r1, #0xa0
	bl Text_SetCursor
	adds r0, r5, #0
	adds r1, r4, #0
	bl Text_DrawString
	adds r0, r5, #0
	movs r1, #0xb8
	bl Text_SetCursor
	adds r0, r5, #0
	adds r1, r4, #0
	bl Text_DrawString
_08087786:
	adds r0, r5, #0
	movs r1, #0
	bl Text_SetColor
	adds r0, r5, #0
	movs r1, #0xaf
	bl Text_SetCursor
	ldr r1, _080877EC @ =gUnk_0841D0FC
	adds r0, r5, #0
	bl Text_DrawString
	movs r0, #0
	bl SetTextFont
	movs r0, #1
	bl EnableBgSync
	ldr r2, _080877F0 @ =0x030027CC
	ldr r0, _080877F4 @ =0x0000FFE0
	ldrh r1, [r2]
	ands r0, r1
	ldr r1, _080877F8 @ =0x0000E0FF
	ands r0, r1
	movs r3, #0x80
	lsls r3, r3, #4
	adds r1, r3, #0
	orrs r0, r1
	strh r0, [r2]
	movs r1, #0x3f
	ldrb r0, [r2]
	ands r1, r0
	movs r0, #0x40
	orrs r1, r0
	movs r3, #0
	movs r0, #7
	strb r0, [r2, #8]
	strb r0, [r2, #9]
	strb r3, [r2, #0xa]
	subs r0, #0x28
	ands r1, r0
	strb r1, [r2]
	ldrb r1, [r2, #1]
	ands r0, r1
	strb r0, [r2, #1]
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080877E8: .4byte gUnk_0841D0F4
_080877EC: .4byte gUnk_0841D0FC
_080877F0: .4byte 0x030027CC
_080877F4: .4byte 0x0000FFE0
_080877F8: .4byte 0x0000E0FF

	thumb_func_start sub_80877FC
sub_80877FC: @ 0x080877FC
	ldr r2, _08087818 @ =gDispIo
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
_08087818: .4byte gDispIo

	thumb_func_start sub_808781C
sub_808781C: @ 0x0808781C
	push {r4, lr}
	ldr r0, _08087858 @ =Pal_Text
	movs r1, #0xd0
	lsls r1, r1, #2
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r4, _0808785C @ =0x020040D4
	ldr r1, _08087860 @ =0x06017800
	adds r0, r4, #0
	movs r2, #0x1a
	bl InitSpriteTextFont
	adds r0, r4, #0
	bl SetTextFont
	movs r0, #0
	bl SetTextFontGlyphs
	subs r4, #8
	adds r0, r4, #0
	bl InitSpriteText
	movs r0, #0
	bl SetTextFont
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08087858: .4byte Pal_Text
_0808785C: .4byte 0x020040D4
_08087860: .4byte 0x06017800

	thumb_func_start sub_8087864
sub_8087864: @ 0x08087864
	push {r4, lr}
	ldr r4, _080878A0 @ =gBg0Tm + 0x340
	adds r0, r4, #0
	movs r1, #0xf
	movs r2, #7
	movs r3, #0
	bl TmFillRect_thm
	adds r0, r4, #0
	adds r0, #0x18
	ldr r1, _080878A4 @ =gPlaySt
	ldrh r2, [r1, #0x10]
	movs r1, #2
	bl PutNumber
	adds r4, #0x96
	bl GetGold
	adds r2, r0, #0
	adds r0, r4, #0
	movs r1, #2
	bl PutNumber
	movs r0, #1
	bl EnableBgSync
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080878A0: .4byte gBg0Tm + 0x340
_080878A4: .4byte gPlaySt

	thumb_func_start sub_80878A8
sub_80878A8: @ 0x080878A8
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r6, r0, #0
	ldr r0, _08087904 @ =gUnk_08D8B428
	bl InitTextList
	adds r0, r6, #0
	bl sub_808781C
	adds r0, r6, #0
	adds r0, #0x2e
	ldrb r0, [r0]
	lsls r1, r0, #2
	adds r0, r6, #0
	adds r0, #0x34
	adds r0, r0, r1
	ldr r0, [r0]
	bl sub_80875FC
	ldr r4, _08087908 @ =gBg1Tm + 0x1a8
	adds r0, r6, #0
	adds r0, #0x2f
	ldrb r2, [r0]
	adds r0, r4, #0
	movs r1, #2
	bl PutNumber
	ldr r0, _0808790C @ =gPlaySt
	ldrb r0, [r0, #0xd]
	cmp r0, #0
	beq _08087910
	adds r0, r4, #0
	adds r0, #0xa
	movs r1, #2
	movs r2, #0x14
	bl PutSpecialChar
	adds r0, r4, #0
	adds r0, #0xc
	movs r1, #2
	movs r2, #0x14
	bl PutSpecialChar
	b _08087920
	.align 2, 0
_08087904: .4byte gUnk_08D8B428
_08087908: .4byte gBg1Tm + 0x1a8
_0808790C: .4byte gPlaySt
_08087910:
	adds r0, r4, #0
	adds r0, #0xc
	adds r1, r6, #0
	adds r1, #0x30
	ldrb r2, [r1]
	movs r1, #2
	bl PutNumber
_08087920:
	adds r7, r6, #0
	adds r7, #0x2c
	movs r0, #1
	strb r0, [r7]
	ldr r0, _0808799C @ =gPlaySt
	ldrb r0, [r0, #0xe]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl GetChapterInfo
	adds r0, #0x88
	ldrh r0, [r0]
	bl DecodeMsg
	adds r5, r0, #0
	ldr r0, _080879A0 @ =0x020040BC
	mov r8, r0
	movs r0, #0x60
	adds r1, r5, #0
	bl GetStringTextCenteredPos
	adds r1, r0, #0
	mov r0, r8
	movs r2, #0
	adds r3, r5, #0
	bl Text_InsertDrawString
	adds r0, r5, #0
	bl sub_808734C
	adds r5, r0, #0
	cmp r5, #0
	beq _0808797E
	mov r4, r8
	adds r4, #8
	movs r0, #0x60
	adds r1, r5, #0
	bl GetStringTextCenteredPos
	adds r1, r0, #0
	adds r0, r4, #0
	movs r2, #0
	adds r3, r5, #0
	bl Text_InsertDrawString
	movs r0, #2
	strb r0, [r7]
_0808797E:
	ldrb r7, [r7]
	cmp r7, #2
	bne _080879A8
	ldr r4, _080879A4 @ =gBg0Tm + 0x204
	mov r0, r8
	adds r1, r4, #0
	bl PutText
	mov r0, r8
	adds r0, #8
	adds r4, #0x80
	adds r1, r4, #0
	bl PutText
	b _080879B0
	.align 2, 0
_0808799C: .4byte gPlaySt
_080879A0: .4byte 0x020040BC
_080879A4: .4byte gBg0Tm + 0x204
_080879A8:
	ldr r1, _080879DC @ =gBg0Tm + 0x244
	mov r0, r8
	bl PutText
_080879B0:
	adds r1, r6, #0
	adds r1, #0x2b
	ldrb r0, [r1]
	cmp r0, #0
	beq _080879C6
	ldr r0, _080879E0 @ =gBg0Tm + 0x32
	ldrb r2, [r1]
	adds r2, #1
	movs r1, #2
	bl PutNumberOrBlank
_080879C6:
	bl sub_8087864
	movs r0, #1
	bl EnableBgSync
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080879DC: .4byte gBg0Tm + 0x244
_080879E0: .4byte gBg0Tm + 0x32

	thumb_func_start sub_80879E4
sub_80879E4: @ 0x080879E4
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	adds r3, r5, #0
	adds r3, #0x2e
	ldrb r7, [r3]
	adds r4, r5, #0
	adds r4, #0x3e
	movs r0, #0
	strb r0, [r4]
	ldr r1, _08087A14 @ =gpKeySt
	ldr r6, [r1]
	ldrh r2, [r6, #8]
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r2
	cmp r0, #0
	beq _08087A18
	movs r0, #1
	strb r0, [r4]
	adds r0, r5, #0
	bl sub_80871E4
	b _08087AF2
	.align 2, 0
_08087A14: .4byte gpKeySt
_08087A18:
	movs r0, #1
	ands r0, r2
	cmp r0, #0
	beq _08087A70
	ldrb r3, [r3]
	lsls r1, r3, #2
	adds r0, r5, #0
	adds r0, #0x34
	adds r0, r0, r1
	ldr r2, [r0]
	cmp r2, #0
	beq _08087A4C
	ldr r0, [r2, #0xc]
	movs r1, #0xa0
	lsls r1, r1, #2
	ands r0, r1
	cmp r0, #0
	bne _08087A4C
	movs r0, #0xb
	ldrsb r0, [r2, r0]
	bl SetStatScreenLastUnitId
	adds r1, r5, #0
	adds r1, #0x2a
	movs r0, #1
	strb r0, [r1]
_08087A4C:
	ldr r0, _08087A68 @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08087A5E
	ldr r0, _08087A6C @ =0x0000038A
	bl m4aSongNumStart
_08087A5E:
	adds r0, r5, #0
	movs r1, #1
	bl Proc_Goto
	b _08087AF2
	.align 2, 0
_08087A68: .4byte gPlaySt
_08087A6C: .4byte 0x0000038A
_08087A70:
	movs r0, #2
	ands r0, r2
	cmp r0, #0
	beq _08087A9C
	adds r0, r5, #0
	movs r1, #1
	bl Proc_Goto
	ldr r0, _08087A94 @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08087AF2
	ldr r0, _08087A98 @ =0x0000038B
	bl m4aSongNumStart
	b _08087AF2
	.align 2, 0
_08087A94: .4byte gPlaySt
_08087A98: .4byte 0x0000038B
_08087A9C:
	movs r0, #0x20
	ldrh r6, [r6, #6]
	ands r0, r6
	cmp r0, #0
	beq _08087AB0
	ldrb r0, [r3]
	cmp r0, #0
	beq _08087AB0
	subs r0, #1
	strb r0, [r3]
_08087AB0:
	ldr r1, [r1]
	movs r0, #0x10
	ldrh r1, [r1, #6]
	ands r0, r1
	adds r4, r5, #0
	adds r4, #0x2e
	cmp r0, #0
	beq _08087ACA
	ldrb r0, [r4]
	cmp r0, #0
	bne _08087ACA
	adds r0, #1
	strb r0, [r4]
_08087ACA:
	ldrb r0, [r4]
	cmp r0, r7
	beq _08087AF2
	ldr r0, _08087AF8 @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08087AE2
	ldr r0, _08087AFC @ =0x00000386
	bl m4aSongNumStart
_08087AE2:
	ldrb r4, [r4]
	lsls r0, r4, #2
	adds r1, r5, #0
	adds r1, #0x34
	adds r1, r1, r0
	ldr r0, [r1]
	bl sub_80875FC
_08087AF2:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08087AF8: .4byte gPlaySt
_08087AFC: .4byte 0x00000386

	thumb_func_start sub_8087B00
sub_8087B00: @ 0x08087B00
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08087B28 @ =gUnk_08D8B5A0
	bl Proc_EndEach
	bl EndHelpPromptSprite
	adds r0, r4, #0
	adds r0, #0x29
	ldrb r0, [r0]
	cmp r0, #0
	beq _08087B22
	ldr r0, [r4, #0x34]
	ldr r1, [r0, #0xc]
	movs r2, #2
	orrs r1, r2
	str r1, [r0, #0xc]
_08087B22:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08087B28: .4byte gUnk_08D8B5A0

	thumb_func_start sub_8087B2C
sub_8087B2C: @ 0x08087B2C
	push {lr}
	adds r1, r0, #0
	adds r0, #0x2a
	ldrb r0, [r0]
	cmp r0, #0
	beq _08087B3E
	ldr r0, _08087B44 @ =gUnk_08C02938
	bl Proc_StartBlocking
_08087B3E:
	pop {r0}
	bx r0
	.align 2, 0
_08087B44: .4byte gUnk_08C02938

	thumb_func_start sub_8087B48
sub_8087B48: @ 0x08087B48
	push {r4, lr}
	adds r4, r0, #0
	cmp r4, #0
	beq _08087B68
	ldr r0, _08087B64 @ =gUnk_08D8B440
	adds r1, r4, #0
	bl Proc_StartBlocking
	adds r1, r0, #0
	adds r1, #0x3f
	movs r0, #0
	strb r0, [r1]
	b _08087B74
	.align 2, 0
_08087B64: .4byte gUnk_08D8B440
_08087B68:
	ldr r0, _08087B7C @ =gUnk_08D8B440
	movs r1, #3
	bl Proc_Start
	adds r0, #0x3f
	strb r4, [r0]
_08087B74:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08087B7C: .4byte gUnk_08D8B440

	thumb_func_start sub_8087B80
sub_8087B80: @ 0x08087B80
	push {lr}
	adds r1, r0, #0
	ldr r0, _08087B94 @ =gUnk_08D8B4F8
	bl Proc_StartBlocking
	adds r0, #0x3f
	movs r1, #1
	strb r1, [r0]
	pop {r0}
	bx r0
	.align 2, 0
_08087B94: .4byte gUnk_08D8B4F8

	thumb_func_start sub_8087B98
sub_8087B98: @ 0x08087B98
	push {r4, r5, lr}
	sub sp, #8
	adds r4, r0, #0
	ldr r5, [r4, #0x14]
	bl ApplySystemObjectsGraphics
	ldr r0, _08087C4C @ =gUnk_0841BB50
	movs r1, #0xa0
	lsls r1, r1, #2
	movs r2, #0x60
	bl ApplyPaletteExt
	ldr r0, _08087C50 @ =gUnk_0841BBB0
	movs r1, #0xb8
	lsls r1, r1, #2
	movs r2, #0x40
	bl ApplyPaletteExt
	ldr r0, _08087C54 @ =gUnk_0841B594
	ldr r1, _08087C58 @ =0x06016000
	bl Decompress
	adds r4, #0x64
	movs r0, #0
	strh r0, [r4]
	movs r0, #0xc0
	lsls r0, r0, #2
	bl SysBlackBoxSetGfx
	adds r0, r5, #0
	adds r0, #0x3f
	ldrb r0, [r0]
	cmp r0, #0
	bne _08087BF2
	ldr r2, _08087C5C @ =0x00000405
	movs r0, #3
	str r0, [sp]
	movs r0, #0x80
	lsls r0, r0, #4
	str r0, [sp, #4]
	movs r0, #0
	movs r1, #7
	movs r3, #0x17
	bl EnableSysBlackBox
_08087BF2:
	adds r0, r5, #0
	adds r0, #0x2b
	ldrb r0, [r0]
	cmp r0, #0
	beq _08087C12
	ldr r2, _08087C60 @ =0x00000404
	movs r0, #2
	str r0, [sp]
	movs r0, #0x80
	lsls r0, r0, #4
	str r0, [sp, #4]
	movs r0, #1
	movs r1, #0xc2
	movs r3, #5
	bl EnableSysBlackBox
_08087C12:
	ldr r2, _08087C64 @ =0x0000044E
	movs r0, #6
	str r0, [sp]
	movs r0, #0x80
	lsls r0, r0, #4
	str r0, [sp, #4]
	movs r0, #2
	movs r1, #0x84
	movs r3, #0xd
	bl EnableSysBlackBox
	movs r0, #0x80
	movs r1, #0x13
	bl sub_8082DB8
	movs r4, #0xb8
	lsls r4, r4, #4
	ldr r0, _08087C68 @ =gPlaySt
	bl sub_8082F30
	adds r1, r0, #0
	adds r0, r4, #0
	bl sub_8082E2C
	add sp, #8
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08087C4C: .4byte gUnk_0841BB50
_08087C50: .4byte gUnk_0841BBB0
_08087C54: .4byte gUnk_0841B594
_08087C58: .4byte 0x06016000
_08087C5C: .4byte 0x00000405
_08087C60: .4byte 0x00000404
_08087C64: .4byte 0x0000044E
_08087C68: .4byte gPlaySt

	thumb_func_start sub_8087C6C
sub_8087C6C: @ 0x08087C6C
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #4
	ldr r6, [r0, #0x14]
	adds r0, r6, #0
	adds r0, #0x3f
	ldrb r0, [r0]
	cmp r0, #0
	bne _08087C90
	ldr r3, _08087DE8 @ =gUnk_08D8B578
	str r0, [sp]
	movs r0, #4
	movs r1, #4
	movs r2, #8
	bl PutSprite
_08087C90:
	adds r5, r6, #0
	adds r5, #0x2e
	ldrb r2, [r5]
	movs r0, #0x34
	adds r1, r2, #0
	muls r1, r0, r1
	adds r1, #0x80
	ldr r3, _08087DEC @ =gUnk_08D8B40C
	movs r0, #0xf
	ands r2, r0
	lsls r2, r2, #0xc
	str r2, [sp]
	movs r0, #4
	movs r2, #0x1c
	bl PutSprite
	ldr r3, _08087DF0 @ =gUnk_08D8B398
	movs r4, #0
	str r4, [sp]
	movs r0, #4
	movs r1, #0x8a
	movs r2, #0x83
	bl PutSprite
	ldr r3, _08087DF4 @ =gUnk_08D8B3AE
	str r4, [sp]
	movs r0, #4
	movs r1, #0x8c
	movs r2, #0x26
	bl PutSprite
	ldr r3, _08087DF8 @ =gUnk_08D8B3BC
	str r4, [sp]
	movs r0, #4
	movs r1, #0xc0
	movs r2, #0x26
	bl PutSprite
	ldr r3, _08087DFC @ =gUnk_08D8B3CA
	str r4, [sp]
	movs r0, #4
	movs r1, #0x12
	movs r2, #0x6a
	bl PutSprite
	ldr r3, _08087E00 @ =gUnk_08D8B3E6
	str r4, [sp]
	movs r0, #4
	movs r1, #0x12
	movs r2, #0x7a
	bl PutSprite
	ldr r3, _08087E04 @ =gUnk_08D8B3EE
	str r4, [sp]
	movs r0, #4
	movs r1, #0x63
	movs r2, #0x7c
	bl PutSprite
	ldr r3, _08087E08 @ =gUnk_08D8B3D2
	str r4, [sp]
	movs r0, #4
	movs r1, #0x28
	movs r2, #0x30
	bl PutSprite
	adds r7, r5, #0
	movs r0, #0x34
	adds r0, r0, r6
	mov r8, r0
	adds r6, #0x2b
	mov sb, r6
	ldr r6, _08087E0C @ =0x0000A3C0
	movs r5, #0xa0
	movs r4, #1
_08087D26:
	str r6, [sp]
	movs r0, #4
	adds r1, r5, #0
	movs r2, #0x56
	ldr r3, _08087E10 @ =Sprite_32x16
	bl PutSprite
	adds r6, #4
	adds r5, #0x20
	subs r4, #1
	cmp r4, #0
	bge _08087D26
	ldr r3, _08087E14 @ =gUnk_08D8B3F6
	movs r4, #0
	str r4, [sp]
	movs r0, #4
	movs r1, #0x88
	movs r2, #0x5f
	bl PutSprite
	ldr r3, _08087E10 @ =Sprite_32x16
	ldr r0, _08087E18 @ =0x0000A3D0
	str r0, [sp]
	movs r0, #4
	movs r1, #0xb4
	movs r2, #0x60
	bl PutSprite
	ldr r3, _08087E1C @ =gUnk_08D8B3FE
	str r4, [sp]
	movs r0, #4
	movs r1, #0x88
	movs r2, #0x6c
	bl PutSprite
	ldr r6, _08087E20 @ =0x0000A3D4
	movs r5, #0x9c
	movs r4, #1
_08087D72:
	str r6, [sp]
	movs r0, #4
	adds r1, r5, #0
	movs r2, #0x6d
	ldr r3, _08087E10 @ =Sprite_32x16
	bl PutSprite
	adds r6, #4
	adds r5, #0x20
	subs r4, #1
	cmp r4, #0
	bge _08087D72
	ldr r4, _08087E24 @ =gBg0Tm + 0x426
	bl GetGameTime
	adds r2, r0, #0
	adds r0, r4, #0
	movs r1, #2
	movs r3, #0
	bl PutTime
	movs r0, #1
	bl EnableBgSync
	ldrb r7, [r7]
	lsls r0, r7, #2
	add r0, r8
	ldr r3, [r0]
	cmp r3, #0
	beq _08087DB8
	movs r0, #4
	movs r1, #0x88
	movs r2, #0x52
	bl sub_8026540
_08087DB8:
	bl sub_80259A4
	mov r1, sb
	ldrb r0, [r1]
	cmp r0, #0
	beq _08087DD4
	ldr r3, _08087E28 @ =gUnk_08D8B3A6
	movs r0, #0
	str r0, [sp]
	movs r0, #4
	movs r1, #0xd4
	movs r2, #3
	bl PutSprite
_08087DD4:
	bl sub_80872E4
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08087DE8: .4byte gUnk_08D8B578
_08087DEC: .4byte gUnk_08D8B40C
_08087DF0: .4byte gUnk_08D8B398
_08087DF4: .4byte gUnk_08D8B3AE
_08087DF8: .4byte gUnk_08D8B3BC
_08087DFC: .4byte gUnk_08D8B3CA
_08087E00: .4byte gUnk_08D8B3E6
_08087E04: .4byte gUnk_08D8B3EE
_08087E08: .4byte gUnk_08D8B3D2
_08087E0C: .4byte 0x0000A3C0
_08087E10: .4byte Sprite_32x16
_08087E14: .4byte gUnk_08D8B3F6
_08087E18: .4byte 0x0000A3D0
_08087E1C: .4byte gUnk_08D8B3FE
_08087E20: .4byte 0x0000A3D4
_08087E24: .4byte gBg0Tm + 0x426
_08087E28: .4byte gUnk_08D8B3A6

	thumb_func_start sub_8087E2C
sub_8087E2C: @ 0x08087E2C
	ldr r3, _08087E3C @ =0x0203E710
	lsls r0, r0, #0xa
	ldr r1, [r3, #0x48]
	ldr r2, _08087E40 @ =0x000003FF
	ands r1, r2
	orrs r1, r0
	str r1, [r3, #0x48]
	bx lr
	.align 2, 0
_08087E3C: .4byte 0x0203E710
_08087E40: .4byte 0x000003FF

	thumb_func_start sub_8087E44
sub_8087E44: @ 0x08087E44
	push {r4, lr}
	ldr r4, _08087E64 @ =0x0203E710
	ldr r3, [r4, #0x48]
	lsrs r2, r3, #0xa
	ldr r1, _08087E68 @ =0x003FFFFF
	ands r1, r0
	orrs r2, r1
	lsls r2, r2, #0xa
	ldr r0, _08087E6C @ =0x000003FF
	ands r0, r3
	orrs r0, r2
	str r0, [r4, #0x48]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08087E64: .4byte 0x0203E710
_08087E68: .4byte 0x003FFFFF
_08087E6C: .4byte 0x000003FF

	thumb_func_start sub_8087E70
sub_8087E70: @ 0x08087E70
	push {r4, lr}
	adds r4, r0, #0
	bl sub_8087E90
	adds r1, r0, #0
	ldr r0, _08087E8C @ =0x003FFFFF
	eors r0, r4
	ands r0, r1
	bl sub_8087E2C
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08087E8C: .4byte 0x003FFFFF

	thumb_func_start sub_8087E90
sub_8087E90: @ 0x08087E90
	ldr r0, _08087E98 @ =0x0203E710
	ldr r0, [r0, #0x48]
	lsrs r0, r0, #0xa
	bx lr
	.align 2, 0
_08087E98: .4byte 0x0203E710

	thumb_func_start sub_8087E9C
sub_8087E9C: @ 0x08087E9C
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	movs r2, #0x20
	orrs r1, r2
	ldr r2, _08087EB8 @ =0x0203E710
	lsls r1, r1, #8
	adds r1, #0x40
	adds r0, r0, r1
	adds r2, #0x4c
	strh r0, [r2]
	bx lr
	.align 2, 0
_08087EB8: .4byte 0x0203E710

	thumb_func_start sub_8087EBC
sub_8087EBC: @ 0x08087EBC
	ldr r0, _08087EC4 @ =0x0203E710
	adds r0, #0x4c
	ldrh r0, [r0]
	bx lr
	.align 2, 0
_08087EC4: .4byte 0x0203E710

	thumb_func_start sub_8087EC8
sub_8087EC8: @ 0x08087EC8
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	lsls r1, r1, #0x10
	ldr r2, _08087EDC @ =0x0203E710
	lsrs r1, r1, #8
	adds r0, r0, r1
	adds r2, #0x4e
	strh r0, [r2]
	bx lr
	.align 2, 0
_08087EDC: .4byte 0x0203E710

	thumb_func_start sub_8087EE0
sub_8087EE0: @ 0x08087EE0
	ldr r0, _08087EE8 @ =0x0203E710
	adds r0, #0x4e
	ldrh r0, [r0]
	bx lr
	.align 2, 0
_08087EE8: .4byte 0x0203E710

	thumb_func_start sub_8087EEC
sub_8087EEC: @ 0x08087EEC
	push {r4, r5, lr}
	ldr r0, _08087F4C @ =0x04000006
	ldrh r0, [r0]
	adds r0, #1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	cmp r4, #0xa0
	bls _08087EFE
	movs r4, #0
_08087EFE:
	ldr r0, _08087F50 @ =0x0203E710
	adds r5, r0, #0
	adds r5, #0x48
	ldrb r1, [r5]
	lsls r0, r1, #0x1b
	lsrs r0, r0, #0x18
	subs r0, #0x20
	cmp r4, r0
	bne _08087F20
	bl sub_8087EBC
	ldr r1, _08087F54 @ =0x04000050
	strh r0, [r1]
	bl sub_8087EE0
	ldr r1, _08087F58 @ =0x04000052
	strh r0, [r1]
_08087F20:
	cmp r4, #0
	beq _08087F32
	ldrh r5, [r5]
	lsls r0, r5, #0x16
	lsrs r0, r0, #0x1b
	lsls r0, r0, #3
	adds r0, #4
	cmp r4, r0
	bne _08087F46
_08087F32:
	ldr r2, _08087F54 @ =0x04000050
	ldr r1, _08087F5C @ =0x030027CC
	ldrh r0, [r1]
	strh r0, [r2]
	adds r2, #2
	ldrb r3, [r1, #9]
	lsls r0, r3, #8
	ldrb r1, [r1, #8]
	orrs r0, r1
	strh r0, [r2]
_08087F46:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08087F4C: .4byte 0x04000006
_08087F50: .4byte 0x0203E710
_08087F54: .4byte 0x04000050
_08087F58: .4byte 0x04000052
_08087F5C: .4byte 0x030027CC

	thumb_func_start sub_8087F60
sub_8087F60: @ 0x08087F60
	push {r4, r5, lr}
	sub sp, #0x40
	adds r3, r0, #0
	add r2, sp, #0x18
	ldr r1, [r3, #0x2c]
	adds r5, r2, #0
	ldrb r0, [r1]
	cmp r0, #0x80
	bne _08088006
	ldrb r0, [r1, #1]
	cmp r0, #0x23
	bne _08088006
	adds r0, r1, #2
	str r0, [r3, #0x2c]
	add r4, sp, #0x38
	b _08087F90
_08087F80:
	ldr r1, [r3, #0x2c]
	ldrb r0, [r1]
	strb r0, [r2]
	ldrb r0, [r1, #1]
	strb r0, [r2, #1]
	adds r0, r1, #2
	str r0, [r3, #0x2c]
	adds r2, #2
_08087F90:
	ldrb r1, [r1, #2]
	cmp r1, #1
	bne _08087F80
	ldr r0, [r3, #0x2c]
	adds r0, #1
	str r0, [r3, #0x2c]
	movs r0, #0
	strb r0, [r2]
	movs r0, #0x80
	lsls r0, r0, #9
	bl sub_8087E44
	ldr r1, _08088010 @ =0x06017800
	mov r0, sp
	movs r2, #0x12
	bl InitSpriteTextFont
	mov r0, sp
	bl SetTextFont
	adds r0, r4, #0
	bl InitSpriteText
	adds r0, r4, #0
	movs r1, #0
	bl SpriteText_DrawBackgroundExt
	movs r0, #0
	bl SetTextFontGlyphs
	movs r0, #0x30
	adds r1, r5, #0
	bl GetStringTextCenteredPos
	adds r1, r0, #0
	adds r0, r4, #0
	movs r2, #0
	adds r3, r5, #0
	bl Text_InsertDrawString
	movs r0, #0
	bl SetTextFont
	ldr r0, _08088014 @ =Pal_Text
	movs r1, #0x90
	lsls r1, r1, #2
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r0, _08088018 @ =gUnk_08198D78
	movs r1, #0x88
	lsls r1, r1, #2
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r0, _0808801C @ =gUnk_08198CC8
	ldr r1, _08088020 @ =0x06017900
	bl Decompress
_08088006:
	add sp, #0x40
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08088010: .4byte 0x06017800
_08088014: .4byte Pal_Text
_08088018: .4byte gUnk_08198D78
_0808801C: .4byte gUnk_08198CC8
_08088020: .4byte 0x06017900

	thumb_func_start sub_8088024
sub_8088024: @ 0x08088024
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x14
	adds r6, r0, #0
	movs r0, #0
	str r0, [sp, #4]
	str r0, [sp, #8]
	adds r1, r6, #0
	adds r1, #0x55
	strb r0, [r1]
	adds r1, #1
	strb r0, [r1]
	bl sub_8087E90
	lsrs r0, r0, #0xb
	movs r1, #7
	ands r0, r1
	cmp r0, #0
	beq _0808805E
	bl sub_8087E90
	lsrs r0, r0, #0xb
	movs r1, #7
	ands r0, r1
	subs r0, #1
	b _08088062
_0808805E:
	bl GetTextPrintDelay
_08088062:
	adds r1, r6, #0
	adds r1, #0x52
	strb r0, [r1]
	movs r0, #0
	ldrsb r0, [r1, r0]
	movs r2, #0x7f
	cmp r0, #0
	beq _08088074
	movs r2, #1
_08088074:
	adds r0, r6, #0
	adds r0, #0x53
	movs r1, #0
	strb r2, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r0, #0xa
	strb r1, [r0]
	adds r0, r6, #0
	bl sub_8087F60
	adds r0, r6, #0
	adds r0, #0x5b
	movs r1, #0
	ldrsb r1, [r0, r1]
	adds r7, r0, #0
	movs r0, #0x5c
	adds r0, r0, r6
	mov sb, r0
	cmp r1, #0
	blt _080880A8
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bge _080880DA
_080880A8:
	movs r0, #1
	bl SetTextFontGlyphs
	ldr r0, [r6, #0x2c]
	add r2, sp, #8
	add r1, sp, #4
	bl sub_8088884
	movs r0, #0
	bl SetTextFontGlyphs
	ldr r1, [sp, #4]
	adds r0, r1, #7
	cmp r0, #0
	bge _080880C8
	adds r0, #7
_080880C8:
	asrs r0, r0, #3
	strb r0, [r7]
	ldr r0, [sp, #8]
	cmp r0, #0
	bge _080880D4
	adds r0, #7
_080880D4:
	asrs r0, r0, #3
	mov r1, sb
	strb r0, [r1]
_080880DA:
	bl sub_8087E90
	movs r1, #1
	ands r1, r0
	cmp r1, #0
	beq _080880E8
	b _08088234
_080880E8:
	movs r2, #0x58
	adds r2, r2, r6
	mov r8, r2
	mov r3, sb
	movs r0, #0
	ldrsb r0, [r3, r0]
	ldrb r5, [r2]
	subs r0, r5, r0
	subs r0, #1
	str r0, [sp, #0x10]
	bl sub_8087E90
	movs r1, #2
	ands r1, r0
	cmp r1, #0
	beq _08088186
	adds r5, r6, #0
	adds r5, #0x57
	movs r0, #0
	ldrsb r0, [r7, r0]
	ldrb r1, [r5]
	subs r0, r1, r0
	subs r0, #2
	str r0, [sp, #0xc]
	bl sub_8087E90
	movs r2, #0xc0
	lsls r2, r2, #8
	mov sl, r2
	ands r0, r2
	lsrs r0, r0, #0xe
	movs r3, #0
	ldrsb r3, [r7, r3]
	ldrb r7, [r5]
	subs r1, r7, r3
	subs r1, #2
	mov r2, sb
	movs r4, #0
	ldrsb r4, [r2, r4]
	mov r7, r8
	ldrb r2, [r7]
	subs r2, r2, r4
	mov ip, r2
	subs r2, #1
	adds r3, #2
	adds r4, #2
	str r4, [sp]
	bl sub_8009AA8
	bl sub_8087E90
	movs r1, #0x80
	lsls r1, r1, #3
	ands r1, r0
	cmp r1, #0
	bne _080881F8
	bl sub_8087E90
	movs r1, #0x80
	lsls r1, r1, #0xb
	ands r1, r0
	movs r4, #3
	cmp r1, #0
	beq _0808816A
	movs r4, #5
_0808816A:
	bl sub_8087E90
	mov r3, sl
	ands r0, r3
	lsrs r0, r0, #0xe
	ldrb r1, [r5]
	subs r1, #1
	mov r5, r8
	ldrb r2, [r5]
	subs r2, #2
	adds r3, r4, #0
	bl sub_8009920
	b _080881F8
_08088186:
	adds r5, r6, #0
	adds r5, #0x57
	ldrb r0, [r5]
	adds r0, #1
	str r0, [sp, #0xc]
	bl sub_8087E90
	movs r1, #0xc0
	lsls r1, r1, #8
	mov sl, r1
	ands r0, r1
	lsrs r0, r0, #0xe
	ldrb r1, [r5]
	adds r1, #1
	mov r2, sb
	movs r4, #0
	ldrsb r4, [r2, r4]
	mov r3, r8
	ldrb r2, [r3]
	subs r2, r2, r4
	mov ip, r2
	subs r2, #1
	movs r3, #0
	ldrsb r3, [r7, r3]
	adds r3, #2
	adds r4, #2
	str r4, [sp]
	bl sub_8009AA8
	bl sub_8087E90
	movs r1, #0x80
	lsls r1, r1, #3
	ands r1, r0
	cmp r1, #0
	bne _080881F8
	bl sub_8087E90
	movs r1, #0x80
	lsls r1, r1, #0xb
	ands r1, r0
	movs r4, #2
	cmp r1, #0
	beq _080881E0
	movs r4, #5
_080881E0:
	bl sub_8087E90
	mov r3, sl
	ands r0, r3
	lsrs r0, r0, #0xe
	ldrb r1, [r5]
	mov r5, r8
	ldrb r2, [r5]
	subs r2, #2
	adds r3, r4, #0
	bl sub_8009920
_080881F8:
	bl sub_8087E90
	movs r1, #0x80
	lsls r1, r1, #9
	ands r1, r0
	cmp r1, #0
	beq _0808822E
	bl sub_8087E90
	adds r1, r0, #0
	movs r0, #0xc0
	lsls r0, r0, #8
	ands r0, r1
	lsrs r0, r0, #0xe
	bl GetBgTilemap
	ldr r7, [sp, #0x10]
	lsls r1, r7, #6
	adds r0, r0, r1
	ldr r2, [sp, #0xc]
	lsls r1, r2, #1
	adds r0, r0, r1
	movs r1, #6
	movs r2, #0
	movs r3, #0
	bl TmFillRect_thm
_0808822E:
	movs r0, #0xf
	bl EnableBgSync
_08088234:
	adds r0, r6, #0
	bl sub_8088834
	ldr r0, _080882A8 @ =sub_8088A20
	adds r1, r6, #0
	bl StartParallelWorker
	ldr r0, [r6, #0x30]
	bl SetTextFont
	movs r0, #1
	bl SetTextFontGlyphs
	mov r3, sb
	movs r0, #0
	ldrsb r0, [r3, r0]
	lsrs r1, r0, #0x1f
	adds r0, r0, r1
	movs r5, #0
	cmp r0, #0
	blt _08088286
_0808825E:
	lsls r0, r5, #2
	adds r4, r6, #0
	adds r4, #0x34
	adds r4, r4, r0
	ldr r0, [r4]
	bl InitSpriteText
	ldr r0, [r4]
	movs r1, #0xb
	bl Text_SetColor
	adds r5, #1
	mov r7, sb
	movs r0, #0
	ldrsb r0, [r7, r0]
	lsrs r1, r0, #0x1f
	adds r0, r0, r1
	asrs r0, r0, #1
	cmp r5, r0
	ble _0808825E
_08088286:
	adds r0, r6, #0
	bl sub_8088718
	movs r0, #0
	bl SetTextFont
	bl sub_8087E90
	movs r1, #1
	ands r1, r0
	cmp r1, #0
	beq _080882AC
	adds r0, r6, #0
	movs r1, #3
	bl Proc_Goto
	b _0808838C
	.align 2, 0
_080882A8: .4byte sub_8088A20
_080882AC:
	bl sub_8087E90
	movs r1, #0x80
	ands r1, r0
	cmp r1, #0
	beq _080882CA
	movs r0, #0x10
	movs r1, #1
	bl sub_8087EC8
	adds r0, r6, #0
	movs r1, #3
	bl Proc_Goto
	b _080882D2
_080882CA:
	movs r0, #0
	movs r1, #0x10
	bl sub_8087EC8
_080882D2:
	bl sub_8087E90
	movs r1, #0x80
	lsls r1, r1, #9
	ands r1, r0
	cmp r1, #0
	beq _08088300
	ldr r4, _080882FC @ =0x0203E710
	adds r3, r6, #0
	adds r3, #0x58
	ldrb r1, [r3]
	subs r1, #5
	adds r2, r4, #0
	adds r2, #0x48
	movs r0, #0x1f
	ands r1, r0
	movs r0, #0x20
	rsbs r0, r0, #0
	ldrb r5, [r2]
	ands r0, r5
	b _0808831A
	.align 2, 0
_080882FC: .4byte 0x0203E710
_08088300:
	ldr r4, _080883B4 @ =0x0203E710
	adds r3, r6, #0
	adds r3, #0x58
	ldrb r1, [r3]
	subs r1, #1
	adds r2, r4, #0
	adds r2, #0x48
	movs r0, #0x1f
	ands r1, r0
	movs r0, #0x20
	rsbs r0, r0, #0
	ldrb r7, [r2]
	ands r0, r7
_0808831A:
	orrs r0, r1
	strb r0, [r2]
	mov r0, sb
	movs r1, #0
	ldrsb r1, [r0, r1]
	ldrb r3, [r3]
	adds r1, r3, r1
	adds r1, #1
	adds r2, r4, #0
	adds r2, #0x48
	movs r3, #0x1f
	mov r8, r3
	mov r5, r8
	ands r1, r5
	lsls r1, r1, #5
	ldr r0, _080883B8 @ =0xFFFFFC1F
	ldrh r7, [r2]
	ands r0, r7
	orrs r0, r1
	strh r0, [r2]
	bl sub_8087E90
	movs r6, #0xc0
	lsls r6, r6, #8
	ands r0, r6
	lsrs r0, r0, #0xe
	movs r4, #1
	adds r5, r4, #0
	lsls r5, r0
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	bl sub_8087E90
	ands r0, r6
	lsrs r0, r0, #0xe
	lsls r4, r0
	mov r0, r8
	eors r4, r0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	adds r0, r5, #0
	adds r1, r4, #0
	bl sub_8087E9C
	bl sub_8087E90
	movs r1, #0x80
	lsls r1, r1, #0xc
	ands r1, r0
	cmp r1, #0
	bne _0808838C
	movs r0, #0
	bl SetOnHBlankB
	ldr r0, _080883BC @ =sub_8087EEC
	bl SetOnHBlankB
_0808838C:
	bl sub_8087E90
	adds r1, r0, #0
	movs r0, #0xc0
	lsls r0, r0, #8
	ands r0, r1
	lsrs r0, r0, #0xe
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	add sp, #0x14
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080883B4: .4byte 0x0203E710
_080883B8: .4byte 0xFFFFFC1F
_080883BC: .4byte sub_8087EEC

	thumb_func_start sub_80883C0
sub_80883C0: @ 0x080883C0
	adds r0, #0x56
	movs r1, #0
	strb r1, [r0]
	bx lr

	thumb_func_start sub_80883C8
sub_80883C8: @ 0x080883C8
	push {r4, lr}
	adds r4, r0, #0
	adds r1, r4, #0
	adds r1, #0x56
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	ldrb r2, [r1]
	cmp r2, #0x10
	beq _080883E6
	movs r0, #0x10
	subs r0, r0, r2
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	b _080883E8
_080883E6:
	movs r1, #1
_080883E8:
	adds r0, r2, #0
	bl sub_8087EC8
	adds r0, r4, #0
	adds r0, #0x56
	ldrb r0, [r0]
	cmp r0, #0x10
	bne _080883FE
	adds r0, r4, #0
	bl Proc_Break
_080883FE:
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_8088404
sub_8088404: @ 0x08088404
	push {r4, lr}
	adds r4, r0, #0
	bl sub_8088718
	movs r0, #0
	bl GetFaceDispById
	movs r1, #0x11
	rsbs r1, r1, #0
	ands r1, r0
	movs r0, #0
	bl SetFaceDispById
	bl sub_80893E0
	bl sub_8087E90
	movs r1, #1
	ands r1, r0
	cmp r1, #0
	beq _08088438
	adds r0, r4, #0
	movs r1, #5
	bl Proc_Goto
	b _08088440
_08088438:
	adds r1, r4, #0
	adds r1, #0x56
	movs r0, #0x10
	strb r0, [r1]
_08088440:
	bl sub_8087E90
	movs r1, #0x80
	lsls r1, r1, #0xa
	ands r1, r0
	cmp r1, #0
	beq _08088458
	ldr r0, _08088460 @ =ProcScr_Face
	bl Proc_Find
	bl StartFaceFadeOut
_08088458:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08088460: .4byte ProcScr_Face

	thumb_func_start sub_8088464
sub_8088464: @ 0x08088464
	push {r4, lr}
	adds r4, r0, #0
	adds r1, r4, #0
	adds r1, #0x56
	ldrb r0, [r1]
	subs r0, #1
	strb r0, [r1]
	ldrb r2, [r1]
	cmp r2, #0x10
	beq _08088482
	movs r0, #0x10
	subs r0, r0, r2
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	b _08088484
_08088482:
	movs r1, #1
_08088484:
	adds r0, r2, #0
	bl sub_8087EC8
	adds r0, r4, #0
	adds r0, #0x56
	ldrb r0, [r0]
	cmp r0, #0
	bne _080884A2
	movs r0, #0x80
	lsls r0, r0, #9
	bl sub_8087E70
	adds r0, r4, #0
	bl Proc_Break
_080884A2:
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_80884A8
sub_80884A8: @ 0x080884A8
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _080884DC @ =gpKeySt
	ldr r1, [r0]
	movs r0, #0xa
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _080884D6
	bl sub_8087E90
	movs r1, #0x40
	ands r1, r0
	cmp r1, #0
	bne _080884D6
	bl sub_800EF98
	bl sub_80893E0
	adds r0, r4, #0
	movs r1, #0
	bl Proc_Goto
_080884D6:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080884DC: .4byte gpKeySt

	thumb_func_start sub_80884E0
sub_80884E0: @ 0x080884E0
	push {r4, lr}
	adds r4, r0, #0
	bl sub_8087E90
	adds r1, r0, #0
	movs r0, #0xc0
	lsls r0, r0, #8
	ands r0, r1
	lsrs r0, r0, #0xe
	bl GetBgTilemap
	adds r1, r4, #0
	adds r1, #0x58
	ldrb r1, [r1]
	subs r1, #1
	lsls r1, r1, #6
	adds r0, r0, r1
	adds r4, #0x5c
	movs r2, #0
	ldrsb r2, [r4, r2]
	adds r2, #1
	movs r1, #0x1f
	movs r3, #0
	bl TmFillRect_thm
	movs r0, #0xf
	bl EnableBgSync
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_8088520
sub_8088520: @ 0x08088520
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0
	bl GetFaceDispById
	movs r1, #0x11
	rsbs r1, r1, #0
	ands r1, r0
	movs r0, #0
	bl SetFaceDispById
	adds r0, r4, #0
	bl sub_80884E0
	movs r0, #0
	bl SetOnHBlankB
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_8088548
sub_8088548: @ 0x08088548
	push {r4, r5, lr}
	adds r5, r0, #0
	bl sub_8088718
	adds r0, r5, #0
	adds r0, #0x54
	movs r4, #0
	strb r4, [r0]
	movs r0, #1
	bl SetTextFontGlyphs
	adds r1, r5, #0
	adds r1, #0x59
	strb r4, [r1]
	adds r2, r5, #0
	adds r2, #0x5a
	strb r4, [r2]
	ldr r0, [r5, #0x2c]
	bl sub_80887B4
	movs r0, #0
	bl SetTextFontGlyphs
	adds r0, r5, #0
	bl sub_80893BC
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_8088584
sub_8088584: @ 0x08088584
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	mov sl, r0
	str r1, [sp]
	str r2, [sp, #4]
	str r3, [sp, #8]
	ldr r7, [sp, #0x30]
	ldr r5, [sp, #0x34]
	ldr r6, _080885D8 @ =gUnk_08D8B5F4
	adds r0, r6, #0
	bl Proc_Find
	adds r4, r0, #0
	cmp r4, #0
	beq _080885E6
	ldr r0, [sp, #0x2c]
	bl DecodeMsg
	str r0, [r4, #0x2c]
	bl _080889FC
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080885C2
	bl sub_8013374
	str r0, [r4, #0x2c]
_080885C2:
	adds r0, r4, #0
	adds r0, #0x56
	ldrb r0, [r0]
	cmp r0, #0x10
	bne _080885DC
	adds r0, r4, #0
	movs r1, #3
	bl Proc_Goto
	b _080886B0
	.align 2, 0
_080885D8: .4byte gUnk_08D8B5F4
_080885DC:
	adds r0, r4, #0
	movs r1, #2
	bl Proc_Goto
	b _080886B0
_080885E6:
	ldr r0, [sp, #0x38]
	cmp r0, #0
	beq _080885F6
	adds r0, r6, #0
	ldr r1, [sp, #0x38]
	bl Proc_StartBlocking
	b _080885FE
_080885F6:
	adds r0, r6, #0
	movs r1, #3
	bl Proc_Start
_080885FE:
	adds r4, r0, #0
	movs r0, #0x80
	lsls r0, r0, #7
	bl sub_8087E2C
	bl ClearAllTalkFlags
	ldr r0, _080886C0 @ =0x0203E710
	str r0, [r4, #0x30]
	adds r3, r4, #0
	adds r3, #0x57
	adds r6, r4, #0
	adds r6, #0x58
	movs r1, #0x5b
	adds r1, r1, r4
	mov ip, r1
	movs r1, #0x5c
	adds r1, r1, r4
	mov r8, r1
	movs r1, #0x50
	adds r1, r1, r4
	mov sb, r1
	adds r2, r4, #0
	adds r2, #0x34
	adds r0, #0x40
	adds r1, r4, #0
	adds r1, #0x48
_08088634:
	str r0, [r1]
	subs r0, #8
	subs r1, #4
	cmp r1, r2
	bge _08088634
	mov r0, sl
	strb r0, [r3]
	mov r1, sp
	ldrb r1, [r1]
	strb r1, [r6]
	mov r0, sp
	ldrb r1, [r0, #4]
	mov r0, ip
	strb r1, [r0]
	mov r0, sp
	ldrb r1, [r0, #8]
	mov r0, r8
	strb r1, [r0]
	str r7, [r4, #0x4c]
	cmp r5, #0
	bge _08088660
	movs r5, #5
_08088660:
	movs r6, #0xf
	adds r0, r6, #0
	ands r0, r5
	adds r5, r0, #0
	adds r5, #0x10
	cmp r7, #0
	bne _08088670
	ldr r7, _080886C4 @ =0x06013000
_08088670:
	ldr r0, [r4, #0x30]
	adds r1, r7, #0
	adds r2, r5, #0
	bl InitSpriteTextFont
	movs r0, #0
	bl SetTextFont
	ldr r0, _080886C8 @ =gUnk_08190228
	lsls r1, r5, #5
	movs r2, #0x20
	bl ApplyPaletteExt
	lsls r0, r7, #0x11
	lsrs r0, r0, #0x16
	ands r5, r6
	lsls r1, r5, #0xc
	adds r0, r0, r1
	mov r1, sb
	strh r0, [r1]
	ldr r0, [sp, #0x2c]
	bl DecodeMsg
	str r0, [r4, #0x2c]
	bl _080889FC
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080886B0
	bl sub_8013374
	str r0, [r4, #0x2c]
_080886B0:
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080886C0: .4byte 0x0203E710
_080886C4: .4byte 0x06013000
_080886C8: .4byte gUnk_08190228

	thumb_func_start EndCgText
EndCgText: @ 0x080886CC
	push {lr}
	ldr r0, _080886DC @ =gUnk_08D8B5F4
	bl Proc_Find
	bl Proc_End
	pop {r0}
	bx r0
	.align 2, 0
_080886DC: .4byte gUnk_08D8B5F4

	thumb_func_start sub_80886E0
sub_80886E0: @ 0x080886E0
	push {lr}
	ldr r0, _080886F0 @ =gUnk_08D8B5F4
	bl Proc_Find
	cmp r0, #0
	bne _080886F4
	movs r0, #0
	b _080886F6
	.align 2, 0
_080886F0: .4byte gUnk_08D8B5F4
_080886F4:
	movs r0, #1
_080886F6:
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_80886FC
sub_80886FC: @ 0x080886FC
	push {lr}
	ldr r0, _08088714 @ =gUnk_08D8B5F4
	bl Proc_Find
	cmp r0, #0
	beq _0808870E
	movs r1, #0
	bl Proc_Goto
_0808870E:
	pop {r0}
	bx r0
	.align 2, 0
_08088714: .4byte gUnk_08D8B5F4

	thumb_func_start sub_8088718
sub_8088718: @ 0x08088718
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r0, [r5, #0x30]
	bl SetTextFont
	adds r0, r5, #0
	adds r0, #0x5c
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsrs r1, r0, #0x1f
	adds r0, r0, r1
	movs r4, #0
	cmp r0, #0
	blt _0808875C
_08088736:
	lsls r1, r4, #2
	adds r0, r5, #0
	adds r0, #0x34
	adds r0, r0, r1
	ldr r0, [r0]
	movs r1, #0
	bl SpriteText_DrawBackgroundExt
	adds r4, #1
	adds r0, r5, #0
	adds r0, #0x5c
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsrs r1, r0, #0x1f
	adds r0, r0, r1
	asrs r0, r0, #1
	cmp r4, r0
	ble _08088736
_0808875C:
	movs r0, #0
	bl SetTextFont
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start sub_8088768
sub_8088768: @ 0x08088768
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r0, [r5, #0x30]
	bl SetTextFont
	adds r0, r5, #0
	adds r0, #0x5c
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsrs r1, r0, #0x1f
	adds r0, r0, r1
	movs r4, #0
	cmp r0, #0
	blt _080887AC
_08088786:
	lsls r1, r4, #2
	adds r0, r5, #0
	adds r0, #0x34
	adds r0, r0, r1
	ldr r0, [r0]
	movs r1, #0
	bl Text_SetCursor
	adds r4, #1
	adds r0, r5, #0
	adds r0, #0x5c
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsrs r1, r0, #0x1f
	adds r0, r0, r1
	asrs r0, r0, #1
	cmp r4, r0
	ble _08088786
_080887AC:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_80887B4
sub_80887B4: @ 0x080887B4
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	adds r4, r0, #0
	mov r8, r1
	adds r7, r2, #0
	movs r6, #0
	ldrb r5, [r7]
	movs r0, #1
	bl SetTextFontGlyphs
_080887CC:
	ldrb r0, [r4]
	cmp r0, #7
	bgt _080887EE
	cmp r0, #4
	bge _08088800
	cmp r0, #1
	beq _08088804
	cmp r0, #1
	bgt _080887E4
	cmp r0, #0
	beq _08088820
	b _08088810
_080887E4:
	cmp r0, #2
	beq _08088800
	cmp r0, #3
	beq _08088820
	b _08088810
_080887EE:
	cmp r0, #0x19
	ble _080887F8
	cmp r0, #0x80
	beq _0808880C
	b _08088810
_080887F8:
	cmp r0, #0x18
	bge _08088820
	cmp r0, #0x16
	blt _08088810
_08088800:
	adds r4, #1
	b _080887CC
_08088804:
	adds r4, #1
	adds r5, #0x10
	movs r6, #0
	b _080887CC
_0808880C:
	adds r4, #2
	b _080887CC
_08088810:
	adds r0, r4, #0
	mov r1, sp
	bl GetCharTextLen
	adds r4, r0, #0
	ldr r0, [sp]
	adds r6, r6, r0
	b _080887CC
_08088820:
	mov r0, r8
	strb r6, [r0]
	strb r5, [r7]
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_8088834
sub_8088834: @ 0x08088834
	push {r4, lr}
	adds r4, r0, #0
	bl sub_8087E90
	movs r1, #1
	ands r1, r0
	cmp r1, #0
	bne _0808887C
	bl sub_8087E90
	movs r1, #2
	ands r1, r0
	cmp r1, #0
	beq _08088862
	adds r1, r4, #0
	adds r1, #0x57
	adds r0, r4, #0
	adds r0, #0x5b
	ldrb r2, [r1]
	ldrb r0, [r0]
	subs r0, r2, r0
	subs r0, #1
	b _0808886A
_08088862:
	adds r1, r4, #0
	adds r1, #0x57
	ldrb r0, [r1]
	adds r0, #2
_0808886A:
	strb r0, [r1]
	adds r0, r4, #0
	adds r0, #0x58
	adds r1, r4, #0
	adds r1, #0x5c
	ldrb r2, [r0]
	ldrb r1, [r1]
	subs r1, r2, r1
	strb r1, [r0]
_0808887C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_8088884
sub_8088884: @ 0x08088884
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	adds r4, r0, #0
	mov r8, r1
	adds r7, r2, #0
	movs r5, #0
	movs r6, #0x10
	str r5, [r1]
	str r5, [r7]
	movs r0, #1
	bl SetTextFontGlyphs
_080888A0:
	ldrb r2, [r4]
	cmp r2, #0x19
	bhi _0808892C
	lsls r0, r2, #2
	ldr r1, _080888B0 @ =_080888B4
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080888B0: .4byte _080888B4
_080888B4: @ jump table
	.4byte _0808891E @ case 0
	.4byte _0808891E @ case 1
	.4byte _0808891E @ case 2
	.4byte _0808891C @ case 3
	.4byte _0808892C @ case 4
	.4byte _0808892C @ case 5
	.4byte _0808892C @ case 6
	.4byte _0808892C @ case 7
	.4byte _0808892C @ case 8
	.4byte _0808892C @ case 9
	.4byte _0808892C @ case 10
	.4byte _0808892C @ case 11
	.4byte _0808892C @ case 12
	.4byte _0808892C @ case 13
	.4byte _0808892C @ case 14
	.4byte _0808892C @ case 15
	.4byte _0808892C @ case 16
	.4byte _0808892C @ case 17
	.4byte _0808892C @ case 18
	.4byte _0808892C @ case 19
	.4byte _0808892C @ case 20
	.4byte _0808892C @ case 21
	.4byte _0808892C @ case 22
	.4byte _0808892C @ case 23
	.4byte _0808891E @ case 24
	.4byte _0808891E @ case 25
_0808891C:
	adds r5, #8
_0808891E:
	mov r1, r8
	ldr r0, [r1]
	cmp r0, r5
	bge _08088928
	str r5, [r1]
_08088928:
	movs r5, #0
	ldrb r2, [r4]
_0808892C:
	cmp r2, #0x19
	bhi _080889B8
	lsls r0, r2, #2
	ldr r1, _0808893C @ =_08088940
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0808893C: .4byte _08088940
_08088940: @ jump table
	.4byte _080889AC @ case 0
	.4byte _080889A8 @ case 1
	.4byte _080889AC @ case 2
	.4byte _080889B8 @ case 3
	.4byte _080889B8 @ case 4
	.4byte _080889B8 @ case 5
	.4byte _080889B8 @ case 6
	.4byte _080889B8 @ case 7
	.4byte _080889B8 @ case 8
	.4byte _080889B8 @ case 9
	.4byte _080889B8 @ case 10
	.4byte _080889B8 @ case 11
	.4byte _080889B8 @ case 12
	.4byte _080889B8 @ case 13
	.4byte _080889B8 @ case 14
	.4byte _080889B8 @ case 15
	.4byte _080889B8 @ case 16
	.4byte _080889B8 @ case 17
	.4byte _080889B8 @ case 18
	.4byte _080889B8 @ case 19
	.4byte _080889B8 @ case 20
	.4byte _080889B8 @ case 21
	.4byte _080889B8 @ case 22
	.4byte _080889B8 @ case 23
	.4byte _080889A8 @ case 24
	.4byte _080889A8 @ case 25
_080889A8:
	adds r6, #0x10
	b _080889B8
_080889AC:
	ldr r0, [r7]
	cmp r0, r6
	bge _080889B4
	str r6, [r7]
_080889B4:
	movs r6, #0
	ldrb r2, [r4]
_080889B8:
	adds r0, r2, #0
	cmp r0, #7
	bgt _080889C8
	cmp r0, #1
	bge _080889D6
	cmp r0, #0
	beq _080889EE
	b _080889DE
_080889C8:
	cmp r2, #0x16
	blt _080889DE
	cmp r2, #0x19
	ble _080889D6
	cmp r2, #0x80
	beq _080889DA
	b _080889DE
_080889D6:
	adds r4, #1
	b _080888A0
_080889DA:
	adds r4, #2
	b _080888A0
_080889DE:
	adds r0, r4, #0
	mov r1, sp
	bl GetCharTextLen
	adds r4, r0, #0
	ldr r0, [sp]
	adds r5, r5, r0
	b _080888A0
_080889EE:
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080889FC:
	ldrb r1, [r0]
	cmp r1, #0
	beq _08088A08
	cmp r1, #0x80
	beq _08088A0C
	b _08088A18
_08088A08:
	movs r0, #0
	b _08088A1C
_08088A0C:
	adds r0, #1
	ldrb r1, [r0]
	cmp r1, #0x20
	bne _08088A18
	movs r0, #1
	b _08088A1C
_08088A18:
	adds r0, #1
	b _080889FC
_08088A1C:
	bx lr
	.align 2, 0

	thumb_func_start sub_8088A20
sub_8088A20: @ 0x08088A20
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x14
	mov r8, r0
	adds r0, #0x57
	ldrb r0, [r0]
	lsls r6, r0, #3
	mov r0, r8
	adds r0, #0x58
	ldrb r0, [r0]
	lsls r7, r0, #3
	movs r0, #0
	mov sb, r0
	bl sub_8087E90
	movs r1, #0x80
	lsls r1, r1, #1
	ands r1, r0
	rsbs r1, r1, #0
	asrs r1, r1, #0x1f
	movs r0, #0x80
	lsls r0, r0, #3
	ands r1, r0
	str r1, [sp, #4]
	bl sub_8087E90
	adds r1, r0, #0
	movs r2, #0xc0
	lsls r2, r2, #8
	ands r1, r2
	movs r0, #0x80
	lsls r0, r0, #7
	cmp r1, r0
	beq _08088A90
	cmp r1, r0
	bhi _08088A74
	cmp r1, #0
	beq _08088A82
	b _08088ABA
_08088A74:
	movs r0, #0x80
	lsls r0, r0, #8
	cmp r1, r0
	beq _08088AA0
	cmp r1, r2
	beq _08088AB0
	b _08088ABA
_08088A82:
	ldr r0, _08088A8C @ =gDispIo
	ldrh r1, [r0, #0x1c]
	subs r6, r6, r1
	ldrh r0, [r0, #0x1e]
	b _08088AB8
	.align 2, 0
_08088A8C: .4byte gDispIo
_08088A90:
	ldr r0, _08088A9C @ =gDispIo
	ldrh r2, [r0, #0x20]
	subs r6, r6, r2
	ldrh r0, [r0, #0x22]
	b _08088AB8
	.align 2, 0
_08088A9C: .4byte gDispIo
_08088AA0:
	ldr r0, _08088AAC @ =gDispIo
	ldrh r3, [r0, #0x24]
	subs r6, r6, r3
	ldrh r0, [r0, #0x26]
	b _08088AB8
	.align 2, 0
_08088AAC: .4byte gDispIo
_08088AB0:
	ldr r0, _08088B28 @ =gDispIo
	ldrh r4, [r0, #0x28]
	subs r6, r6, r4
	ldrh r0, [r0, #0x2a]
_08088AB8:
	subs r7, r7, r0
_08088ABA:
	bl sub_8087E90
	movs r1, #0x80
	lsls r1, r1, #9
	ands r1, r0
	cmp r1, #0
	beq _08088AFE
	adds r1, r6, #0
	subs r1, #0x10
	ldr r5, _08088B2C @ =0x000001FF
	ands r1, r5
	adds r2, r7, #0
	subs r2, #0x18
	movs r4, #0xff
	ands r2, r4
	ldr r3, _08088B30 @ =gUnk_08D8B5C0
	ldr r0, _08088B34 @ =0x000013C8
	str r0, [sp]
	movs r0, #0
	bl PutSpriteExt
	adds r1, r6, #0
	subs r1, #8
	ands r1, r5
	adds r2, r7, #0
	subs r2, #0x14
	ands r2, r4
	ldr r3, _08088B38 @ =gUnk_08D8B5E6
	movs r0, #0x8f
	lsls r0, r0, #6
	str r0, [sp]
	movs r0, #0
	bl PutSpriteExt
_08088AFE:
	movs r4, #0
	mov r0, r8
	adds r0, #0x5c
	movs r1, #0
	ldrsb r1, [r0, r1]
	lsrs r2, r1, #0x1f
	adds r1, r1, r2
	asrs r1, r1, #1
	str r0, [sp, #0xc]
	movs r5, #0x50
	add r5, r8
	mov sl, r5
	movs r0, #0x5b
	add r8, r0
	cmp r4, r1
	bge _08088B90
_08088B1E:
	movs r1, #0
	mov sb, r1
	adds r2, r4, #1
	str r2, [sp, #0x10]
	b _08088B6C
	.align 2, 0
_08088B28: .4byte gDispIo
_08088B2C: .4byte 0x000001FF
_08088B30: .4byte gUnk_08D8B5C0
_08088B34: .4byte 0x000013C8
_08088B38: .4byte gUnk_08D8B5E6
_08088B3C:
	mov r3, sb
	lsls r1, r3, #5
	adds r1, r6, r1
	ldr r0, _08088BB8 @ =0x000001FF
	ands r1, r0
	lsls r2, r4, #4
	adds r2, r7, r2
	movs r0, #0xff
	ands r2, r0
	lsls r0, r3, #2
	mov r5, sl
	ldrh r5, [r5]
	adds r0, r5, r0
	lsls r3, r4, #6
	adds r0, r0, r3
	ldr r3, [sp, #4]
	adds r0, r0, r3
	str r0, [sp]
	movs r0, #2
	ldr r3, _08088BBC @ =Sprite_32x16
	bl PutSpriteExt
	movs r5, #1
	add sb, r5
_08088B6C:
	mov r1, r8
	movs r0, #0
	ldrsb r0, [r1, r0]
	cmp r0, #0
	bge _08088B78
	adds r0, #3
_08088B78:
	asrs r0, r0, #2
	cmp sb, r0
	blt _08088B3C
	ldr r4, [sp, #0x10]
	ldr r2, [sp, #0xc]
	movs r0, #0
	ldrsb r0, [r2, r0]
	lsrs r1, r0, #0x1f
	adds r0, r0, r1
	asrs r0, r0, #1
	cmp r4, r0
	blt _08088B1E
_08088B90:
	movs r0, #3
	mov r3, r8
	ldrb r3, [r3]
	ands r0, r3
	cmp r0, #0
	beq _08088C2E
	mov r4, r8
	movs r1, #0
	ldrsb r1, [r4, r1]
	adds r0, r1, #0
	cmp r1, #0
	bge _08088BAA
	adds r0, r1, #3
_08088BAA:
	asrs r0, r0, #2
	lsls r5, r0, #2
	str r5, [sp, #8]
	lsls r0, r0, #5
	adds r6, r6, r0
	movs r4, #0
	b _08088C1E
	.align 2, 0
_08088BB8: .4byte 0x000001FF
_08088BBC: .4byte Sprite_32x16
_08088BC0:
	movs r2, #0
	mov sb, r2
	adds r3, r4, #1
	str r3, [sp, #0x10]
	b _08088C00
_08088BCA:
	mov r5, sb
	lsls r1, r5, #3
	adds r1, r6, r1
	ldr r0, _08088C6C @ =0x000001FF
	ands r1, r0
	lsls r2, r4, #4
	adds r2, r7, r2
	movs r0, #0xff
	ands r2, r0
	mov r0, sl
	ldrh r3, [r0]
	ldr r0, [sp, #8]
	adds r3, r3, r0
	mov ip, r3
	mov r0, ip
	add r0, sb
	lsls r3, r4, #6
	adds r0, r0, r3
	ldr r3, [sp, #4]
	adds r0, r0, r3
	str r0, [sp]
	movs r0, #2
	ldr r3, _08088C70 @ =Sprite_8x16
	bl PutSpriteExt
	movs r5, #1
	add sb, r5
_08088C00:
	mov r0, r8
	movs r1, #0
	ldrsb r1, [r0, r1]
	adds r0, r1, #0
	cmp r1, #0
	bge _08088C0E
	adds r0, r1, #3
_08088C0E:
	asrs r0, r0, #2
	lsls r0, r0, #2
	subs r0, r1, r0
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp sb, r0
	blt _08088BCA
	ldr r4, [sp, #0x10]
_08088C1E:
	ldr r1, [sp, #0xc]
	movs r0, #0
	ldrsb r0, [r1, r0]
	lsrs r1, r0, #0x1f
	adds r0, r0, r1
	asrs r0, r0, #1
	cmp r4, r0
	blt _08088BC0
_08088C2E:
	mov r2, sb
	lsls r1, r2, #5
	adds r1, r6, r1
	ldr r0, _08088C6C @ =0x000001FF
	ands r1, r0
	lsls r2, r4, #4
	adds r2, r7, r2
	movs r0, #0xff
	ands r2, r0
	ldr r3, _08088C74 @ =Sprite_32x16
	mov r5, sb
	lsls r0, r5, #2
	mov r6, sl
	ldrh r6, [r6]
	adds r0, r6, r0
	lsls r4, r4, #6
	adds r0, r0, r4
	ldr r4, [sp, #4]
	adds r0, r0, r4
	str r0, [sp]
	movs r0, #2
	bl PutSpriteExt
	add sp, #0x14
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08088C6C: .4byte 0x000001FF
_08088C70: .4byte Sprite_8x16
_08088C74: .4byte Sprite_32x16

	thumb_func_start sub_8088C78
sub_8088C78: @ 0x08088C78
	push {lr}
	subs r0, #0x16
	cmp r0, #9
	bhi _08088D00
	lsls r0, r0, #2
	ldr r1, _08088C8C @ =_08088C90
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08088C8C: .4byte _08088C90
_08088C90: @ jump table
	.4byte _08088CB8 @ case 0
	.4byte _08088CBE @ case 1
	.4byte _08088CC4 @ case 2
	.4byte _08088CCA @ case 3
	.4byte _08088CD0 @ case 4
	.4byte _08088CD6 @ case 5
	.4byte _08088CE2 @ case 6
	.4byte _08088CE8 @ case 7
	.4byte _08088CEE @ case 8
	.4byte _08088CF4 @ case 9
_08088CB8:
	movs r0, #0
	movs r1, #0
	b _08088CDA
_08088CBE:
	movs r0, #0
	movs r1, #1
	b _08088CDA
_08088CC4:
	movs r0, #0
	movs r1, #3
	b _08088CDA
_08088CCA:
	movs r0, #0
	movs r1, #2
	b _08088CDA
_08088CD0:
	movs r0, #0
	movs r1, #4
	b _08088CDA
_08088CD6:
	movs r0, #0
	movs r1, #5
_08088CDA:
	bl SetFaceBlinkControlById
	movs r0, #1
	b _08088D02
_08088CE2:
	movs r0, #0
	movs r1, #0
	b _08088CF8
_08088CE8:
	movs r0, #0
	movs r1, #2
	b _08088CF8
_08088CEE:
	movs r0, #0
	movs r1, #3
	b _08088CF8
_08088CF4:
	movs r0, #0
	movs r1, #4
_08088CF8:
	bl SetFaceEyeStateById
	movs r0, #1
	b _08088D02
_08088D00:
	movs r0, #0
_08088D02:
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_8088D08
sub_8088D08: @ 0x08088D08
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	mov r8, r0
	ldr r6, [r0, #0x14]
	adds r0, r6, #0
	adds r0, #0x53
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	mov sl, r0
	ldr r0, _08088D44 @ =gpKeySt
	ldr r1, [r0]
	movs r0, #0xf3
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _08088D5A
	bl sub_8087E90
	movs r1, #0x20
	ands r1, r0
	cmp r1, #0
	bne _08088D5A
	movs r0, #0x7f
	mov sl, r0
	b _08088D74
	.align 2, 0
_08088D44: .4byte gpKeySt
_08088D48:
	adds r1, r6, #0
	adds r1, #0x5f
	movs r0, #1
	strb r0, [r1]
	mov r0, r8
	movs r1, #1
	bl Proc_Goto
	b _08089274
_08088D5A:
	adds r1, r6, #0
	adds r1, #0x55
	ldrb r0, [r1]
	subs r0, #1
	strb r0, [r1]
	lsls r0, r0, #0x18
	cmp r0, #0
	ble _08088D6C
	b _08089282
_08088D6C:
	adds r0, r6, #0
	adds r0, #0x52
	ldrb r0, [r0]
	strb r0, [r1]
_08088D74:
	ldr r0, [r6, #0x30]
	bl SetTextFont
	movs r0, #0
	bl GetFaceDispById
	movs r1, #0x10
	orrs r0, r1
	lsls r0, r0, #0x10
	lsrs r7, r0, #0x10
	movs r0, #0
	movs r1, #3
	bl SetFaceBlinkControlById
	movs r2, #0
	mov sb, r2
	cmp sb, sl
	blt _08088D9A
	b _08089274
_08088D9A:
	ldr r0, [r6, #0x2c]
	ldrb r1, [r0]
	adds r2, r0, #0
	cmp r1, #0x80
	bls _08088DA6
	b _080891EA
_08088DA6:
	lsls r0, r1, #2
	ldr r1, _08088DB0 @ =_08088DB4
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08088DB0: .4byte _08088DB4
_08088DB4: @ jump table
	.4byte _08089068 @ case 0
	.4byte _08089096 @ case 1
	.4byte _08089106 @ case 2
	.4byte _08089148 @ case 3
	.4byte _080890C2 @ case 4
	.4byte _080890CC @ case 5
	.4byte _080890D6 @ case 6
	.4byte _080890E0 @ case 7
	.4byte _080891EA @ case 8
	.4byte _080891EA @ case 9
	.4byte _080891EA @ case 10
	.4byte _080891EA @ case 11
	.4byte _080891EA @ case 12
	.4byte _080891EA @ case 13
	.4byte _080891EA @ case 14
	.4byte _080891EA @ case 15
	.4byte _080891EA @ case 16
	.4byte _080891EA @ case 17
	.4byte _080891EA @ case 18
	.4byte _080891EA @ case 19
	.4byte _080891EA @ case 20
	.4byte _080891EA @ case 21
	.4byte _080890EA @ case 22
	.4byte _080890F8 @ case 23
	.4byte _08088FB8 @ case 24
	.4byte _08089018 @ case 25
	.4byte _080891EA @ case 26
	.4byte _080891EA @ case 27
	.4byte _080891EA @ case 28
	.4byte _080891EA @ case 29
	.4byte _080891EA @ case 30
	.4byte _080891EA @ case 31
	.4byte _080891EA @ case 32
	.4byte _080891EA @ case 33
	.4byte _080891EA @ case 34
	.4byte _080891EA @ case 35
	.4byte _080891EA @ case 36
	.4byte _080891EA @ case 37
	.4byte _080891EA @ case 38
	.4byte _080891EA @ case 39
	.4byte _080891EA @ case 40
	.4byte _080891EA @ case 41
	.4byte _080891EA @ case 42
	.4byte _080891EA @ case 43
	.4byte _080891EA @ case 44
	.4byte _080891EA @ case 45
	.4byte _080891EA @ case 46
	.4byte _080891EA @ case 47
	.4byte _080891EA @ case 48
	.4byte _080891EA @ case 49
	.4byte _080891EA @ case 50
	.4byte _080891EA @ case 51
	.4byte _080891EA @ case 52
	.4byte _080891EA @ case 53
	.4byte _080891EA @ case 54
	.4byte _080891EA @ case 55
	.4byte _080891EA @ case 56
	.4byte _080891EA @ case 57
	.4byte _080891EA @ case 58
	.4byte _080891EA @ case 59
	.4byte _080891EA @ case 60
	.4byte _080891EA @ case 61
	.4byte _080891EA @ case 62
	.4byte _080891EA @ case 63
	.4byte _080891EA @ case 64
	.4byte _080891EA @ case 65
	.4byte _080891EA @ case 66
	.4byte _080891EA @ case 67
	.4byte _080891EA @ case 68
	.4byte _080891EA @ case 69
	.4byte _080891EA @ case 70
	.4byte _080891EA @ case 71
	.4byte _080891EA @ case 72
	.4byte _080891EA @ case 73
	.4byte _080891EA @ case 74
	.4byte _080891EA @ case 75
	.4byte _080891EA @ case 76
	.4byte _080891EA @ case 77
	.4byte _080891EA @ case 78
	.4byte _080891EA @ case 79
	.4byte _080891EA @ case 80
	.4byte _080891EA @ case 81
	.4byte _080891EA @ case 82
	.4byte _080891EA @ case 83
	.4byte _080891EA @ case 84
	.4byte _080891EA @ case 85
	.4byte _080891EA @ case 86
	.4byte _080891EA @ case 87
	.4byte _080891EA @ case 88
	.4byte _080891EA @ case 89
	.4byte _080891EA @ case 90
	.4byte _080891EA @ case 91
	.4byte _080891EA @ case 92
	.4byte _080891EA @ case 93
	.4byte _080891EA @ case 94
	.4byte _080891EA @ case 95
	.4byte _080891EA @ case 96
	.4byte _080891EA @ case 97
	.4byte _080891EA @ case 98
	.4byte _080891EA @ case 99
	.4byte _080891EA @ case 100
	.4byte _080891EA @ case 101
	.4byte _080891EA @ case 102
	.4byte _080891EA @ case 103
	.4byte _080891EA @ case 104
	.4byte _080891EA @ case 105
	.4byte _080891EA @ case 106
	.4byte _080891EA @ case 107
	.4byte _080891EA @ case 108
	.4byte _080891EA @ case 109
	.4byte _080891EA @ case 110
	.4byte _080891EA @ case 111
	.4byte _080891EA @ case 112
	.4byte _080891EA @ case 113
	.4byte _080891EA @ case 114
	.4byte _080891EA @ case 115
	.4byte _080891EA @ case 116
	.4byte _080891EA @ case 117
	.4byte _080891EA @ case 118
	.4byte _080891EA @ case 119
	.4byte _080891EA @ case 120
	.4byte _080891EA @ case 121
	.4byte _080891EA @ case 122
	.4byte _080891EA @ case 123
	.4byte _080891EA @ case 124
	.4byte _080891EA @ case 125
	.4byte _080891EA @ case 126
	.4byte _080891EA @ case 127
	.4byte _080891CA @ case 128
_08088FB8:
	adds r4, r6, #0
	adds r4, #0x54
	ldrb r0, [r4]
	adds r0, #1
	strb r0, [r4]
	bl sub_8087E90
	movs r1, #0x80
	lsls r1, r1, #2
	ands r1, r0
	ldr r5, _08089010 @ =gUnk_08D8B694
	cmp r1, #0
	beq _08088FD4
	ldr r5, _08089014 @ =gUnk_08D8B68C
_08088FD4:
	movs r3, #0
	ldrsb r3, [r4, r3]
	lsls r1, r3, #2
	adds r0, r6, #0
	adds r0, #0x34
	adds r0, r0, r1
	ldr r1, [r0]
	adds r0, r6, #0
	adds r0, #0x57
	ldrb r0, [r0]
	lsls r2, r0, #3
	adds r0, r6, #0
	adds r0, #0x58
	lsls r3, r3, #1
	ldrb r0, [r0]
	adds r3, r0, r3
	lsls r3, r3, #3
	movs r0, #0xb
	str r0, [sp]
	movs r0, #1
_08088FFC:
	str r0, [sp, #4]
	mov r0, r8
	str r0, [sp, #8]
	adds r0, r5, #0
	bl sub_80894EC
_08089008:
	ldr r0, [r6, #0x2c]
	adds r0, #1
	str r0, [r6, #0x2c]
	b _0808913E
	.align 2, 0
_08089010: .4byte gUnk_08D8B694
_08089014: .4byte gUnk_08D8B68C
_08089018:
	adds r4, r6, #0
	adds r4, #0x54
	ldrb r0, [r4]
	adds r0, #1
	strb r0, [r4]
	bl sub_8087E90
	movs r1, #0x80
	lsls r1, r1, #2
	ands r1, r0
	ldr r5, _08089060 @ =gUnk_08D8B694
	cmp r1, #0
	beq _08089034
	ldr r5, _08089064 @ =gUnk_08D8B68C
_08089034:
	movs r3, #0
	ldrsb r3, [r4, r3]
	lsls r1, r3, #2
	adds r0, r6, #0
	adds r0, #0x34
	adds r0, r0, r1
	ldr r1, [r0]
	adds r0, r6, #0
	adds r0, #0x57
	ldrb r0, [r0]
	lsls r2, r0, #3
	adds r0, r6, #0
	adds r0, #0x58
	lsls r3, r3, #1
	ldrb r0, [r0]
	adds r3, r0, r3
	lsls r3, r3, #3
	movs r0, #0xb
	str r0, [sp]
	movs r0, #2
	b _08088FFC
	.align 2, 0
_08089060: .4byte gUnk_08D8B694
_08089064: .4byte gUnk_08D8B68C
_08089068:
	bl sub_8087E90
	movs r1, #4
	ands r1, r0
	cmp r1, #0
	beq _08089084
	movs r0, #4
	bl sub_8087E70
	adds r0, r6, #0
	movs r1, #4
	bl Proc_Goto
	b _0808908C
_08089084:
	adds r0, r6, #0
	movs r1, #0
	bl Proc_Goto
_0808908C:
	mov r0, r8
	movs r1, #0x63
	bl Proc_Goto
	b _0808913E
_08089096:
	adds r0, r2, #1
	str r0, [r6, #0x2c]
	adds r3, r6, #0
	adds r3, #0x54
	movs r2, #0
	ldrsb r2, [r3, r2]
	adds r2, #1
	adds r0, r6, #0
	adds r0, #0x5c
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsrs r1, r0, #0x1f
	adds r0, r0, r1
	asrs r0, r0, #1
	cmp r2, r0
	blt _080890BA
	b _08088D48
_080890BA:
	ldrb r0, [r3]
	adds r0, #1
	strb r0, [r3]
	b _0808926A
_080890C2:
	adds r1, r6, #0
	adds r1, #0x55
	movs r0, #8
	strb r0, [r1]
	b _08089008
_080890CC:
	adds r1, r6, #0
	adds r1, #0x55
	movs r0, #0x10
	strb r0, [r1]
	b _08089008
_080890D6:
	adds r1, r6, #0
	adds r1, #0x55
	movs r0, #0x20
	strb r0, [r1]
	b _08089008
_080890E0:
	adds r1, r6, #0
	adds r1, #0x55
	movs r0, #0x80
	strb r0, [r1]
	b _08089008
_080890EA:
	adds r0, r2, #1
	str r0, [r6, #0x2c]
	ldr r0, _080890F4 @ =0x0000FFF7
	ands r7, r0
	b _0808926A
	.align 2, 0
_080890F4: .4byte 0x0000FFF7
_080890F8:
	adds r0, r2, #1
	str r0, [r6, #0x2c]
	movs r0, #8
	orrs r7, r0
	lsls r0, r7, #0x10
	lsrs r7, r0, #0x10
	b _0808926A
_08089106:
	adds r0, r2, #1
	str r0, [r6, #0x2c]
	ldrb r2, [r2, #1]
	cmp r2, #1
	bne _08089114
	adds r0, #1
	str r0, [r6, #0x2c]
_08089114:
	bl sub_8087E90
	movs r1, #8
	ands r1, r0
	cmp r1, #0
	beq _0808912A
	mov r0, r8
	movs r1, #2
	bl Proc_Goto
	b _0808913E
_0808912A:
	adds r0, r6, #0
	adds r0, #0x54
	ldrb r1, [r0]
	adds r1, #1
	adds r0, #0xb
	strb r1, [r0]
	mov r0, r8
	movs r1, #1
	bl Proc_Goto
_0808913E:
	ldr r0, _08089144 @ =0x0000FFEF
	ands r7, r0
	b _08089274
	.align 2, 0
_08089144: .4byte 0x0000FFEF
_08089148:
	ldr r0, _08089190 @ =0x0000FFEF
	ands r7, r0
	ldr r0, [r6, #0x2c]
	adds r0, #1
	str r0, [r6, #0x2c]
	bl sub_8087E90
	movs r1, #0x80
	lsls r1, r1, #1
	ands r1, r0
	cmp r1, #0
	beq _08089194
	adds r0, r6, #0
	adds r0, #0x57
	ldrb r0, [r0]
	lsls r1, r0, #3
	adds r5, r6, #0
	adds r5, #0x59
	ldrb r2, [r5]
	adds r1, r2, r1
	adds r1, #4
	adds r0, r6, #0
	adds r0, #0x58
	ldrb r0, [r0]
	lsls r2, r0, #3
	adds r4, r6, #0
	adds r4, #0x5a
	ldrb r0, [r4]
	adds r2, r0, r2
	adds r2, #8
	movs r3, #0x80
	lsls r3, r3, #3
	mov r0, r8
	bl sub_8009178
	b _080891BE
	.align 2, 0
_08089190: .4byte 0x0000FFEF
_08089194:
	adds r0, r6, #0
	adds r0, #0x57
	ldrb r0, [r0]
	lsls r1, r0, #3
	adds r5, r6, #0
	adds r5, #0x59
	ldrb r2, [r5]
	adds r1, r2, r1
	adds r1, #4
	adds r0, r6, #0
	adds r0, #0x58
	ldrb r0, [r0]
	lsls r2, r0, #3
	adds r4, r6, #0
	adds r4, #0x5a
	ldrb r0, [r4]
	adds r2, r0, r2
	adds r2, #8
	mov r0, r8
	bl sub_800914C
_080891BE:
	adds r1, r5, #0
	adds r2, r4, #0
	ldr r0, [r6, #0x2c]
	bl sub_80887B4
	b _08089274
_080891CA:
	ldr r1, [r6, #0x2c]
	adds r0, r1, #1
	str r0, [r6, #0x2c]
	ldrb r1, [r1, #1]
	cmp r1, #0x21
	bne _080891E2
	adds r1, r6, #0
	adds r1, #0x5e
	movs r0, #1
	ldrb r2, [r1]
	subs r0, r0, r2
	strb r0, [r1]
_080891E2:
	ldr r0, [r6, #0x2c]
	adds r0, #1
	str r0, [r6, #0x2c]
	b _0808926A
_080891EA:
	adds r0, r6, #0
	adds r0, #0x5e
	ldrb r0, [r0]
	cmp r0, #0
	beq _0808920E
	adds r5, r6, #0
	adds r5, #0x54
	movs r0, #0
	ldrsb r0, [r5, r0]
	lsls r0, r0, #2
	adds r4, r6, #0
	adds r4, #0x34
	adds r0, r4, r0
	ldr r0, [r0]
	movs r1, #0xc
	bl Text_SetColor
	b _08089226
_0808920E:
	adds r5, r6, #0
	adds r5, #0x54
	movs r0, #0
	ldrsb r0, [r5, r0]
	lsls r0, r0, #2
	adds r4, r6, #0
	adds r4, #0x34
	adds r0, r4, r0
	ldr r0, [r0]
	movs r1, #0xb
	bl Text_SetColor
_08089226:
	movs r0, #0
	ldrsb r0, [r5, r0]
	lsls r0, r0, #2
	adds r0, r4, r0
	ldr r0, [r0]
	ldr r1, [r6, #0x2c]
	bl Text_DrawCharacter
	str r0, [r6, #0x2c]
	bl GetTextPrintDelay
	adds r4, r0, #0
	cmp r4, #1
	bne _0808924C
	bl GetGameTime
	ands r0, r4
	cmp r0, #0
	beq _0808926A
_0808924C:
	bl sub_8087E90
	movs r1, #0x10
	ands r1, r0
	cmp r1, #0
	bne _0808926A
	ldr r0, _08089294 @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0808926A
	ldr r0, _08089298 @ =0x0000038E
	bl m4aSongNumStart
_0808926A:
	movs r0, #1
	add sb, r0
	cmp sb, sl
	bge _08089274
	b _08088D9A
_08089274:
	movs r0, #0
	bl SetTextFont
	movs r0, #0
	adds r1, r7, #0
	bl SetFaceDispById
_08089282:
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08089294: .4byte gPlaySt
_08089298: .4byte 0x0000038E

	thumb_func_start sub_808929C
sub_808929C: @ 0x0808929C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	mov r8, r1
	mov ip, r2
	adds r4, r0, #0
	movs r6, #0
	cmp r6, ip
	bge _080892F8
_080892B2:
	adds r1, r4, #0
	movs r2, #0
	adds r0, r6, #1
	mov sb, r0
	cmp r2, r8
	bge _080892EC
	mov r7, ip
	subs r7, #1
	mov sl, r2
_080892C4:
	adds r5, r2, #1
	movs r3, #6
_080892C8:
	ldr r0, [r1, #4]
	stm r1!, {r0}
	subs r3, #1
	cmp r3, #0
	bge _080892C8
	cmp r6, r7
	bne _080892DA
	mov r0, sl
	b _080892E4
_080892DA:
	adds r0, r2, #0
	adds r0, #0x20
	lsls r0, r0, #5
	adds r0, r0, r4
	ldr r0, [r0]
_080892E4:
	stm r1!, {r0}
	adds r2, r5, #0
	cmp r2, r8
	blt _080892C4
_080892EC:
	movs r0, #0x80
	lsls r0, r0, #3
	adds r4, r4, r0
	mov r6, sb
	cmp r6, ip
	blt _080892B2
_080892F8:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_8089308
sub_8089308: @ 0x08089308
	adds r0, #0x4c
	movs r1, #0
	strh r1, [r0]
	bx lr

	thumb_func_start sub_8089310
sub_8089310: @ 0x08089310
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r7, r0, #0
	ldr r5, [r7, #0x14]
	adds r6, r5, #0
	adds r6, #0x54
	movs r2, #0
	ldrsb r2, [r6, r2]
	adds r2, #1
	lsls r2, r2, #1
	ldr r0, [r5, #0x4c]
	adds r1, r5, #0
	adds r1, #0x5b
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	bl sub_808929C
	adds r0, r7, #0
	adds r0, #0x4c
	ldrh r1, [r0]
	adds r1, #1
	movs r2, #0
	mov r8, r2
	strh r1, [r0]
	movs r2, #0
	ldrsh r1, [r0, r2]
	adds r4, r5, #0
	adds r4, #0x5f
	ldrb r2, [r4]
	lsls r0, r2, #4
	cmp r1, r0
	bne _0808938A
	adds r0, r5, #0
	bl sub_8088768
	ldrb r0, [r4]
	subs r0, #1
	ldrb r1, [r6]
	subs r0, r1, r0
	strb r0, [r6]
	adds r1, r5, #0
	adds r1, #0x59
	mov r2, r8
	strb r2, [r1]
	subs r4, #5
	strb r2, [r4]
	ldr r0, [r5, #0x2c]
	adds r2, r4, #0
	bl sub_80887B4
	movs r0, #0
	ldrsb r0, [r6, r0]
	lsls r0, r0, #4
	ldrb r1, [r4]
	adds r0, r1, r0
	strb r0, [r4]
	adds r0, r7, #0
	bl Proc_Break
_0808938A:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_8089394
sub_8089394: @ 0x08089394
	push {r4, lr}
	ldr r4, [r0, #0x14]
	adds r0, r4, #0
	bl sub_8088718
	adds r1, r4, #0
	adds r1, #0x54
	movs r0, #0
	strb r0, [r1]
	adds r1, #5
	strb r0, [r1]
	adds r2, r4, #0
	adds r2, #0x5a
	strb r0, [r2]
	ldr r0, [r4, #0x2c]
	bl sub_80887B4
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_80893BC
sub_80893BC: @ 0x080893BC
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r4, _080893DC @ =gUnk_08D8B69C
	adds r0, r4, #0
	bl Proc_Find
	bl Proc_End
	adds r0, r4, #0
	adds r1, r5, #0
	bl Proc_Start
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080893DC: .4byte gUnk_08D8B69C

	thumb_func_start sub_80893E0
sub_80893E0: @ 0x080893E0
	push {lr}
	ldr r0, _080893F0 @ =gUnk_08D8B69C
	bl Proc_Find
	bl Proc_End
	pop {r0}
	bx r0
	.align 2, 0
_080893F0: .4byte gUnk_08D8B69C

	thumb_func_start sub_80893F4
sub_80893F4: @ 0x080893F4
	push {lr}
	bl sub_8087E90
	movs r1, #4
	ands r1, r0
	cmp r1, #0
	bne _08089406
	movs r0, #0
	b _08089408
_08089406:
	movs r0, #1
_08089408:
	pop {r1}
	bx r1

	thumb_func_start sub_808940C
sub_808940C: @ 0x0808940C
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	ldr r1, _08089438 @ =gpKeySt
	ldr r0, [r1]
	ldrh r2, [r0, #8]
	movs r0, #2
	ands r0, r2
	adds r5, r1, #0
	cmp r0, #0
	beq _08089444
	ldr r0, _0808943C @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08089432
	ldr r0, _08089440 @ =0x0000038B
	bl m4aSongNumStart
_08089432:
	movs r0, #0
	b _08089464
	.align 2, 0
_08089438: .4byte gpKeySt
_0808943C: .4byte gPlaySt
_08089440: .4byte 0x0000038B
_08089444:
	movs r6, #1
	adds r0, r6, #0
	ands r0, r2
	cmp r0, #0
	beq _08089478
	ldr r0, _08089470 @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08089460
	ldr r0, _08089474 @ =0x0000038A
	bl m4aSongNumStart
_08089460:
	movs r1, #0x2a
	ldrsh r0, [r4, r1]
_08089464:
	bl SetTalkChoiceResult
	adds r0, r4, #0
	bl Proc_Break
	b _080894DE
	.align 2, 0
_08089470: .4byte gPlaySt
_08089474: .4byte 0x0000038A
_08089478:
	movs r0, #0x20
	ands r0, r2
	cmp r0, #0
	beq _0808949A
	ldrh r2, [r4, #0x2a]
	cmp r2, #2
	bne _0808949A
	ldr r0, _080894E4 @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08089498
	ldr r0, _080894E8 @ =0x00000387
	bl m4aSongNumStart
_08089498:
	strh r6, [r4, #0x2a]
_0808949A:
	ldr r1, [r5]
	movs r0, #0x10
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _080894C2
	ldrh r0, [r4, #0x2a]
	cmp r0, #1
	bne _080894C2
	ldr r0, _080894E4 @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080894BE
	ldr r0, _080894E8 @ =0x00000387
	bl m4aSongNumStart
_080894BE:
	movs r0, #2
	strh r0, [r4, #0x2a]
_080894C2:
	movs r1, #0x2c
	ldrsh r0, [r4, r1]
	movs r1, #0x2a
	ldrsh r2, [r4, r1]
	subs r2, #1
	lsls r1, r2, #2
	adds r1, r1, r2
	lsls r1, r1, #3
	adds r0, r0, r1
	subs r0, #4
	movs r2, #0x2e
	ldrsh r1, [r4, r2]
	bl PutUiHand
_080894DE:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080894E4: .4byte gPlaySt
_080894E8: .4byte 0x00000387

	thumb_func_start sub_80894EC
sub_80894EC: @ 0x080894EC
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	adds r5, r0, #0
	mov r8, r1
	adds r4, r2, #0
	mov sb, r3
	ldr r6, [sp, #0x1c]
	ldr r7, [sp, #0x24]
	ldr r0, [r5]
	bl DecodeMsg
	adds r3, r0, #0
	mov r0, r8
	movs r1, #0x10
	adds r2, r6, #0
	bl Text_InsertDrawString
	ldr r0, [r5, #4]
	bl DecodeMsg
	adds r3, r0, #0
	mov r0, r8
	movs r1, #0x38
	adds r2, r6, #0
	bl Text_InsertDrawString
	ldr r0, _08089548 @ =gUnk_08D8B6FC
	adds r1, r7, #0
	bl Proc_StartBlocking
	mov r1, sp
	ldrh r1, [r1, #0x20]
	strh r1, [r0, #0x2a]
	adds r4, #0x10
	strh r4, [r0, #0x2c]
	mov r2, sb
	strh r2, [r0, #0x2e]
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08089548: .4byte gUnk_08D8B6FC

	thumb_func_start sub_808954C
sub_808954C: @ 0x0808954C
	push {r4, r5, lr}
	ldr r0, _080895B8 @ =0x0200D668
	bl InitUnitStack
	movs r5, #1
_08089556:
	adds r0, r5, #0
	bl GetUnit
	adds r4, r0, #0
	cmp r4, #0
	beq _0808957A
	ldr r0, [r4]
	cmp r0, #0
	beq _0808957A
	adds r0, r4, #0
	bl sub_808E81C
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0808957A
	adds r0, r4, #0
	bl PushUnit
_0808957A:
	adds r5, #1
	cmp r5, #0x3f
	ble _08089556
	movs r5, #1
_08089582:
	adds r0, r5, #0
	bl GetUnit
	adds r4, r0, #0
	cmp r4, #0
	beq _080895A6
	ldr r0, [r4]
	cmp r0, #0
	beq _080895A6
	adds r0, r4, #0
	bl sub_808E81C
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080895A6
	adds r0, r4, #0
	bl PushUnit
_080895A6:
	adds r5, #1
	cmp r5, #0x3f
	ble _08089582
	bl LoadPlayerUnitsFromUnitStack
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080895B8: .4byte 0x0200D668

	thumb_func_start sub_80895BC
sub_80895BC: @ 0x080895BC
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r8, r0
	lsls r1, r1, #0x18
	lsrs r7, r1, #0x18
	lsls r2, r2, #0x18
	lsrs r6, r2, #0x18
	ldr r0, _08089634 @ =gUnk_08D8BA04
	ldr r3, [r0]
	movs r0, #0xa0
	lsls r0, r0, #7
	str r0, [sp]
	movs r0, #0xd
	mov r1, r8
	adds r2, r7, #0
	bl PutSpriteExt
	movs r5, #0
	subs r0, r6, #1
	cmp r5, r0
	bge _08089610
	mov r4, r8
	adds r4, #8
_080895F2:
	ldr r0, _08089634 @ =gUnk_08D8BA04
	ldr r3, [r0, #4]
	movs r0, #0xa0
	lsls r0, r0, #7
	str r0, [sp]
	movs r0, #0xd
	adds r1, r4, #0
	adds r2, r7, #0
	bl PutSpriteExt
	adds r4, #0x10
	adds r5, #1
	subs r0, r6, #1
	cmp r5, r0
	blt _080895F2
_08089610:
	lsls r1, r5, #4
	add r1, r8
	adds r1, #8
	ldr r0, _08089634 @ =gUnk_08D8BA04
	ldr r3, [r0, #8]
	movs r0, #0xa0
	lsls r0, r0, #7
	str r0, [sp]
	movs r0, #0xd
	adds r2, r7, #0
	bl PutSpriteExt
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08089634: .4byte gUnk_08D8BA04

	thumb_func_start sub_8089638
sub_8089638: @ 0x08089638
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	ldr r0, _08089694 @ =gBg2Tm + 0x68
	movs r1, #4
	movs r2, #1
	movs r3, #0
	bl TmFillRect_thm
	ldr r4, _08089698 @ =0x0200D660
	adds r0, r4, #0
	bl ClearText
	movs r3, #0
	ldr r0, _0808969C @ =gUnk_08D8BB00
	mov r8, r0
	adds r5, r4, #0
	mov sb, r8
_08089662:
	movs r2, #0
	lsls r1, r3, #3
	adds r6, r3, #1
	adds r1, r1, r3
	lsls r1, r1, #4
	mov r0, sb
	adds r0, #4
	adds r4, r1, r0
	add r1, r8
_08089674:
	ldrb r0, [r1]
	cmp r0, r7
	bne _080896C8
	cmp r3, #5
	bne _080896A0
	cmp r2, #0
	beq _080896A0
	adds r1, r2, #0
	adds r1, #0x6f
	ldr r0, _08089694 @ =gBg2Tm + 0x68
	movs r2, #0xa0
	lsls r2, r2, #7
	bl PutIcon
	b _080896D2
	.align 2, 0
_08089694: .4byte gBg2Tm + 0x68
_08089698: .4byte 0x0200D660
_0808969C: .4byte gUnk_08D8BB00
_080896A0:
	adds r0, r5, #0
	movs r1, #0
	bl Text_SetCursor
	adds r0, r5, #0
	movs r1, #0
	bl Text_SetColor
	ldr r1, [r4]
	adds r0, r5, #0
	bl Text_DrawString
	adds r0, r5, #0
	ldr r1, _080896C4 @ =gBg2Tm + 0x68
	bl PutText
	b _080896D2
	.align 2, 0
_080896C4: .4byte gBg2Tm + 0x68
_080896C8:
	adds r4, #0x10
	adds r1, #0x10
	adds r2, #1
	cmp r2, #8
	ble _08089674
_080896D2:
	adds r3, r6, #0
	cmp r3, #9
	ble _08089662
	movs r0, #4
	bl EnableBgSync
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_80896EC
sub_80896EC: @ 0x080896EC
	adds r3, r0, #0
	movs r2, #0
	ldr r1, _08089710 @ =0x0200E66C
_080896F2:
	ldr r0, [r1]
	cmp r0, r3
	beq _0808971C
	adds r1, #4
	adds r2, #1
	cmp r2, #7
	ble _080896F2
	movs r2, #0
	ldr r1, _08089710 @ =0x0200E66C
_08089704:
	ldr r0, [r1]
	cmp r0, #0xff
	bne _08089714
	str r3, [r1]
	b _0808971C
	.align 2, 0
_08089710: .4byte 0x0200E66C
_08089714:
	adds r1, #4
	adds r2, #1
	cmp r2, #7
	ble _08089704
_0808971C:
	bx lr
	.align 2, 0

	thumb_func_start sub_8089720
sub_8089720: @ 0x08089720
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #0x28
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x14
	ldr r3, _080897D4 @ =0x0200E668
	movs r2, #0xff
	add r1, sp, #0x1c
_08089732:
	str r2, [r1]
	subs r1, #4
	cmp r1, r13
	bge _08089732
	cmp r0, #0
	ble _08089740
	subs r0, #1
_08089740:
	movs r6, #0
	ldrb r3, [r3]
	cmp r0, r3
	bge _08089786
	ldr r1, _080897D8 @ =0x0200CBF0
	adds r5, r0, #0
	mov r7, sp
	lsls r0, r5, #2
	adds r4, r0, r1
_08089752:
	ldr r0, [r4]
	ldr r0, [r0]
	bl GetUnitEquippedWeapon
	lsls r0, r0, #0x10
	cmp r0, #0
	beq _08089772
	ldr r0, [r4]
	ldr r0, [r0]
	bl GetUnitEquippedWeapon
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl sub_8017808
	str r0, [r7]
_08089772:
	adds r5, #1
	adds r7, #4
	adds r4, #4
	adds r6, #1
	cmp r6, #7
	bgt _08089786
	ldr r0, _080897D4 @ =0x0200E668
	ldrb r0, [r0]
	cmp r5, r0
	blt _08089752
_08089786:
	movs r6, #0
	ldr r7, _080897DC @ =0x0200E66C
	mov r8, r7
_0808978C:
	lsls r1, r6, #2
	mov r2, r8
	adds r0, r1, r2
	ldr r0, [r0]
	adds r4, r1, #0
	adds r6, #1
	cmp r0, #0xff
	beq _080897C4
	movs r5, #0
	adds r1, r0, #0
	mov r2, sp
	movs r3, #7
_080897A4:
	ldr r0, [r2]
	cmp r0, r1
	bne _080897AC
	movs r5, #1
_080897AC:
	adds r2, #4
	subs r3, #1
	cmp r3, #0
	bge _080897A4
	cmp r5, #0
	bne _080897C4
	adds r4, r4, r7
	ldr r0, [r4]
	bl ClearIcon
	movs r0, #0xff
	str r0, [r4]
_080897C4:
	cmp r6, #7
	ble _0808978C
	add sp, #0x28
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080897D4: .4byte 0x0200E668
_080897D8: .4byte 0x0200CBF0
_080897DC: .4byte 0x0200E66C

	thumb_func_start sub_80897E0
sub_80897E0: @ 0x080897E0
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r0, r1, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	lsls r0, r0, #0x18
	lsls r2, r2, #0x18
	lsrs r5, r2, #0x18
	lsrs r0, r0, #0x1b
	movs r1, #6
	bl __umodsi3
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	cmp r4, #0
	bne _08089848
	lsls r0, r5, #0x18
	asrs r2, r0, #0x18
	cmp r2, #0
	beq _08089830
	ldr r2, _08089824 @ =gBg2Tm
	ldr r0, _08089828 @ =0xFFFFF368
	adds r1, r3, r0
	movs r4, #0x80
	lsls r4, r4, #1
	adds r0, r2, r4
	strh r1, [r0]
	ldr r0, _0808982C @ =0xFFFFF36E
	adds r1, r3, r0
	movs r3, #0xa0
	lsls r3, r3, #1
	adds r0, r2, r3
	strh r1, [r0]
	b _0808988A
	.align 2, 0
_08089824: .4byte gBg2Tm
_08089828: .4byte 0xFFFFF368
_0808982C: .4byte 0xFFFFF36E
_08089830:
	ldr r1, _08089844 @ =gBg2Tm
	movs r4, #0x80
	lsls r4, r4, #1
	adds r0, r1, r4
	strh r2, [r0]
	movs r3, #0xa0
	lsls r3, r3, #1
	adds r0, r1, r3
	strh r2, [r0]
	b _0808988A
	.align 2, 0
_08089844: .4byte gBg2Tm
_08089848:
	lsls r0, r5, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _08089878
	ldr r2, _0808986C @ =gBg2Tm
	ldr r4, _08089870 @ =0xFFFFF768
	adds r0, r3, r4
	movs r4, #0x9d
	lsls r4, r4, #1
	adds r1, r2, r4
	strh r0, [r1]
	ldr r1, _08089874 @ =0xFFFFF76E
	adds r0, r3, r1
	movs r3, #0xbd
	lsls r3, r3, #1
	adds r1, r2, r3
	b _08089888
	.align 2, 0
_0808986C: .4byte gBg2Tm
_08089870: .4byte 0xFFFFF768
_08089874: .4byte 0xFFFFF76E
_08089878:
	ldr r1, _08089898 @ =gBg2Tm
	movs r4, #0x9d
	lsls r4, r4, #1
	adds r2, r1, r4
	strh r0, [r2]
	movs r2, #0xbd
	lsls r2, r2, #1
	adds r1, r1, r2
_08089888:
	strh r0, [r1]
_0808988A:
	movs r0, #4
	bl EnableBgSync
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08089898: .4byte gBg2Tm

	thumb_func_start sub_808989C
sub_808989C: @ 0x0808989C
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	adds r4, r0, #0
	lsls r1, r1, #0x18
	lsrs r5, r1, #0x18
	cmp r1, #0
	beq _080898DE
	bl sub_808E684
	b _080898E2
_080898B4:
	adds r0, r4, #0
	adds r0, #0x2c
	strb r3, [r0]
	strh r3, [r4, #0x3e]
	b _0808998C
_080898BE:
	adds r0, r4, #0
	adds r0, #0x2c
	strb r3, [r0]
	strh r1, [r4, #0x3e]
	b _0808998C
_080898C8:
	subs r1, r3, r1
	adds r0, r4, #0
	adds r0, #0x2c
	strb r1, [r0]
	b _0808998C
_080898D2:
	adds r1, r4, #0
	adds r1, #0x2c
	movs r0, #1
	strb r0, [r1]
	strh r7, [r4, #0x3e]
	b _0808998C
_080898DE:
	bl GetLastStatScreenUnitId
_080898E2:
	adds r1, r0, #0
	movs r3, #0
	ldr r0, _0808991C @ =0x0200E668
	ldrb r6, [r0]
	mov sb, r0
	cmp r3, r6
	bge _0808998C
	lsls r0, r5, #0x18
	asrs r0, r0, #0x18
	mov r8, r0
	movs r0, #0x2c
	adds r0, r0, r4
	mov ip, r0
	movs r5, #0x40
	rsbs r5, r5, #0
	movs r7, #0x10
	rsbs r7, r7, #0
	ldr r2, _08089920 @ =0x0200CBF0
_08089906:
	mov r0, r8
	cmp r0, #0
	beq _08089924
	ldr r0, [r2]
	ldr r0, [r0]
	ldr r0, [r0]
	ldrb r0, [r0, #4]
	cmp r0, r1
	beq _08089932
	b _08089980
	.align 2, 0
_0808991C: .4byte 0x0200E668
_08089920: .4byte 0x0200CBF0
_08089924:
	ldr r0, [r2]
	ldr r0, [r0]
	ldrb r0, [r0, #0xb]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, r1
	bne _08089980
_08089932:
	adds r0, r4, #0
	adds r0, #0x30
	movs r1, #0
	strb r3, [r0]
	cmp r3, #0
	beq _080898B4
	mov r0, sb
	ldrb r2, [r0]
	subs r0, r2, #1
	cmp r3, r0
	bne _0808995E
	cmp r2, #6
	bls _080898BE
	movs r0, #5
	mov r1, ip
	strb r0, [r1]
	mov r1, sb
	ldrb r0, [r1]
	subs r0, #6
	lsls r0, r0, #4
	strh r0, [r4, #0x3e]
	b _0808998C
_0808995E:
	ldrh r2, [r4, #0x3e]
	lsrs r1, r2, #4
	adds r0, r1, #0
	cmp r3, r0
	ble _0808996E
	adds r0, #5
	cmp r3, r0
	blt _080898C8
_0808996E:
	cmp r2, r7
	bgt _080898D2
	cmp r2, r5
	bge _0808998C
	movs r0, #4
	mov r1, ip
	strb r0, [r1]
	strh r5, [r4, #0x3e]
	b _0808998C
_08089980:
	adds r5, #0x10
	adds r7, #0x10
	adds r2, #4
	adds r3, #1
	cmp r3, r6
	blt _08089906
_0808998C:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_8089998
sub_8089998: @ 0x08089998
	push {r4, r5, r6, r7, lr}
	lsls r0, r0, #0x18
	asrs r2, r0, #0x18
	cmp r2, #0
	beq _08089A3C
	ldr r0, _08089A38 @ =gDispIo
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
	movs r2, #0
	strb r2, [r0]
	mov r1, ip
	adds r1, #0x31
	movs r0, #0x38
	strb r0, [r1]
	mov r0, ip
	adds r0, #0x2c
	movs r3, #0xf0
	strb r3, [r0]
	subs r1, #1
	movs r0, #0x98
	strb r0, [r1]
	mov r0, ip
	adds r0, #0x2f
	strb r2, [r0]
	adds r0, #4
	strb r2, [r0]
	subs r0, #5
	strb r3, [r0]
	adds r1, #2
	movs r0, #0x20
	strb r0, [r1]
	adds r1, #2
	movs r0, #1
	ldrb r3, [r1]
	orrs r0, r3
	movs r4, #2
	orrs r0, r4
	movs r3, #4
	orrs r0, r3
	movs r2, #8
	orrs r0, r2
	movs r5, #0x10
	orrs r0, r5
	strb r0, [r1]
	mov r6, ip
	adds r6, #0x35
	movs r1, #2
	rsbs r1, r1, #0
	adds r0, r1, #0
	ldrb r7, [r6]
	ands r0, r7
	orrs r0, r4
	orrs r0, r3
	orrs r0, r2
	orrs r0, r5
	strb r0, [r6]
	mov r5, ip
	adds r5, #0x36
	ldrb r0, [r5]
	ands r1, r0
	orrs r1, r4
	orrs r1, r3
	orrs r1, r2
	movs r0, #0x11
	rsbs r0, r0, #0
	ands r1, r0
	strb r1, [r5]
	b _08089A9C
	.align 2, 0
_08089A38: .4byte gDispIo
_08089A3C:
	ldr r1, _08089AA4 @ =gDispIo
	mov ip, r1
	movs r0, #0x20
	ldrb r3, [r1, #1]
	orrs r0, r3
	movs r1, #0x41
	rsbs r1, r1, #0
	ands r0, r1
	movs r1, #0x7f
	ands r0, r1
	mov r6, ip
	strb r0, [r6, #1]
	mov r0, ip
	adds r0, #0x2d
	strb r2, [r0]
	mov r1, ip
	adds r1, #0x31
	movs r0, #0x38
	strb r0, [r1]
	subs r1, #5
	movs r0, #0xf0
	strb r0, [r1]
	adds r1, #4
	movs r0, #0x98
	strb r0, [r1]
	adds r1, #4
	movs r0, #1
	ldrb r7, [r1]
	orrs r0, r7
	movs r5, #2
	orrs r0, r5
	movs r4, #4
	orrs r0, r4
	movs r3, #8
	orrs r0, r3
	movs r2, #0x10
	orrs r0, r2
	strb r0, [r1]
	adds r1, #2
	movs r0, #2
	rsbs r0, r0, #0
	ldrb r6, [r1]
	ands r0, r6
	orrs r0, r5
	orrs r0, r4
	orrs r0, r3
	orrs r0, r2
	strb r0, [r1]
_08089A9C:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08089AA4: .4byte gDispIo

	thumb_func_start sub_8089AA8
sub_8089AA8: @ 0x08089AA8
	push {r4, lr}
	adds r4, r0, #0
	bl EndAllMus
	ldr r0, [r4, #0x40]
	bl Proc_End
	ldr r0, [r4, #0x44]
	bl Proc_End
	bl EndGreenText
	ldr r2, _08089AE8 @ =gDispIo
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
	adds r0, r4, #0
	adds r0, #0x39
	ldrb r0, [r0]
	cmp r0, #1
	bne _08089AEC
	movs r0, #0x11
	bl SetStatScreenExcludedUnitFlags
	b _08089AF2
	.align 2, 0
_08089AE8: .4byte gDispIo
_08089AEC:
	movs r0, #0x1f
	bl SetStatScreenExcludedUnitFlags
_08089AF2:
	ldr r1, _08089B2C @ =0x0200CBF0
	adds r0, r4, #0
	adds r0, #0x30
	ldrb r0, [r0]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	ldr r0, [r0]
	adds r1, r4, #0
	bl StartStatScreen
	ldr r1, _08089B30 @ =gPlaySt
	adds r0, r4, #0
	adds r0, #0x34
	ldrb r0, [r0]
	lsls r0, r0, #7
	adds r2, r4, #0
	adds r2, #0x32
	ldrb r2, [r2]
	adds r0, r2, r0
	strb r0, [r1, #0x1a]
	adds r1, r4, #0
	adds r1, #0x29
	movs r0, #4
	strb r0, [r1]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08089B2C: .4byte 0x0200CBF0
_08089B30: .4byte gPlaySt

	thumb_func_start sub_8089B34
sub_8089B34: @ 0x08089B34
	push {lr}
	bl sub_808A0F4
	ldr r2, _08089B5C @ =gDispIo
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
	pop {r0}
	bx r0
	.align 2, 0
_08089B5C: .4byte gDispIo

	thumb_func_start sub_8089B60
sub_8089B60: @ 0x08089B60
	ldr r2, _08089B7C @ =gDispIo
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
_08089B7C: .4byte gDispIo

	thumb_func_start sub_8089B80
sub_8089B80: @ 0x08089B80
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x14]
	str r0, [r4, #0x2c]
	adds r0, r4, #0
	adds r0, #0x3b
	movs r1, #0
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	ldr r0, [r4, #0x2c]
	ldrh r0, [r0, #0x3e]
	strh r0, [r4, #0x38]
	adds r0, r4, #0
	adds r0, #0x3a
	strb r1, [r0]
	subs r0, #0xa
	strb r1, [r0]
	adds r0, r4, #0
	bl sub_8090DD0
	str r0, [r4, #0x34]
	movs r0, #0xe0
	movs r1, #0x40
	bl sub_8090DE4
	ldr r0, [r4, #0x2c]
	ldrh r1, [r0, #0x3e]
	ldr r0, _08089BD8 @ =0x0200E668
	ldrb r2, [r0]
	movs r0, #0xa
	movs r3, #6
	bl sub_8090E04
	movs r0, #0xe4
	lsls r0, r0, #7
	movs r1, #1
	bl sub_8090E38
	bl ForceSyncUnitSpriteSheet
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08089BD8: .4byte 0x0200E668

	thumb_func_start sub_8089BDC
sub_8089BDC: @ 0x08089BDC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x20
	adds r6, r0, #0
	add r1, sp, #4
	ldr r0, _08089C28 @ =gUnk_0842CE04
	ldm r0!, {r2, r3, r4}
	stm r1!, {r2, r3, r4}
	ldr r0, [r0]
	str r0, [r1]
	ldr r0, [r6, #0x2c]
	adds r0, #0x34
	ldrb r0, [r0]
	cmp r0, #0
	bne _08089C30
	adds r4, r6, #0
	adds r4, #0x3b
	ldrb r5, [r4]
	lsrs r0, r5, #3
	movs r1, #3
	ands r0, r1
	lsls r0, r0, #2
	add r0, sp
	adds r0, #4
	ldr r2, [r0]
	adds r2, #7
	ldr r3, _08089C2C @ =gUnk_08D8BA10
	movs r0, #0x90
	lsls r0, r0, #8
	str r0, [sp]
	movs r0, #0xb
	movs r1, #0xb8
	bl PutSpriteExt
	b _08089C56
	.align 2, 0
_08089C28: .4byte gUnk_0842CE04
_08089C2C: .4byte gUnk_08D8BA10
_08089C30:
	ldr r1, _08089CCC @ =0x000020B8
	adds r4, r6, #0
	adds r4, #0x3b
	ldrb r2, [r4]
	lsrs r0, r2, #3
	movs r2, #3
	ands r0, r2
	lsls r0, r0, #2
	add r0, sp
	adds r0, #4
	ldr r2, [r0]
	adds r2, #7
	ldr r3, _08089CD0 @ =gUnk_08D8BA10
	movs r0, #0x90
	lsls r0, r0, #8
	str r0, [sp]
	movs r0, #0xb
	bl PutSpriteExt
_08089C56:
	str r4, [sp, #0x14]
	ldr r1, _08089CD4 @ =gUnk_08D8BAD8
	ldr r0, [r6, #0x2c]
	adds r0, #0x2f
	ldrb r0, [r0]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r3, [r0]
	movs r5, #0x90
	lsls r5, r5, #8
	str r5, [sp]
	movs r0, #0xd
	movs r1, #0x20
	movs r2, #8
	bl PutSpriteExt
	ldr r3, _08089CD8 @ =gUnk_08D8BA18
	str r5, [sp]
	movs r0, #0xd
	movs r1, #0xa0
	movs r2, #0
	bl PutSpriteExt
	ldr r0, [r6, #0x2c]
	ldrh r1, [r0, #0x3e]
	ldr r0, _08089CDC @ =0x0200E668
	ldrb r2, [r0]
	movs r0, #0xa
	movs r3, #6
	bl sub_8090E04
	ldr r4, [r6, #0x2c]
	adds r0, r4, #0
	adds r0, #0x29
	ldrb r0, [r0]
	cmp r0, #2
	bls _08089CE4
	ldr r1, _08089CE0 @ =gUnk_08D8BB00
	adds r3, r4, #0
	adds r3, #0x2d
	adds r2, r4, #0
	adds r2, #0x2f
	ldrb r5, [r2]
	lsls r0, r5, #3
	adds r0, r0, r5
	ldrb r3, [r3]
	adds r0, r3, r0
	lsls r0, r0, #4
	adds r0, r0, r1
	ldrb r0, [r0, #8]
	adds r1, r4, #0
	adds r1, #0x2c
	ldrb r1, [r1]
	lsls r1, r1, #4
	adds r1, #0x28
	bl PutUiHand
	b _08089CFA
	.align 2, 0
_08089CCC: .4byte 0x000020B8
_08089CD0: .4byte gUnk_08D8BA10
_08089CD4: .4byte gUnk_08D8BAD8
_08089CD8: .4byte gUnk_08D8BA18
_08089CDC: .4byte 0x0200E668
_08089CE0: .4byte gUnk_08D8BB00
_08089CE4:
	adds r0, r4, #0
	adds r0, #0x2c
	ldrb r0, [r0]
	lsls r2, r0, #4
	adds r2, #0x40
	ldr r3, _08089D48 @ =gUnk_08D8BA20
	str r5, [sp]
	movs r0, #0xd
	movs r1, #4
	bl PutSpriteExt
_08089CFA:
	ldr r1, [r6, #0x2c]
	ldrh r0, [r6, #0x38]
	ldrh r2, [r1, #0x3e]
	cmp r0, r2
	bne _08089D0C
	movs r0, #0xf
	ands r0, r2
	cmp r0, #0
	beq _08089D54
_08089D0C:
	ldr r0, _08089D4C @ =gPal
	ldr r1, _08089D50 @ =0x02012970
	ldrh r1, [r1, #0x10]
	movs r3, #0xcf
	lsls r3, r3, #2
	adds r0, r0, r3
	strh r1, [r0]
	bl EnablePalSync
	adds r2, r6, #0
	adds r2, #0x3c
	movs r0, #0x20
	strb r0, [r2]
	ldr r0, [r6, #0x2c]
	ldrh r0, [r0, #0x3e]
	strh r0, [r6, #0x38]
	adds r0, r6, #0
	adds r0, #0x3a
	ldrb r1, [r0]
	str r2, [sp, #0x18]
	mov r8, r0
	cmp r1, #0
	bne _08089D90
	movs r0, #1
	bl sub_8089998
	movs r0, #1
	mov r4, r8
	strb r0, [r4]
	b _08089D90
	.align 2, 0
_08089D48: .4byte gUnk_08D8BA20
_08089D4C: .4byte gPal
_08089D50: .4byte 0x02012970
_08089D54:
	ldr r2, _08089E38 @ =gPal
	ldr r3, _08089E3C @ =0x02012970
	adds r4, r6, #0
	adds r4, #0x3c
	ldrb r5, [r4]
	lsrs r0, r5, #2
	movs r1, #0xf
	ands r0, r1
	lsls r0, r0, #1
	adds r0, r0, r3
	ldrh r0, [r0]
	movs r1, #0xcf
	lsls r1, r1, #2
	adds r2, r2, r1
	strh r0, [r2]
	bl EnablePalSync
	adds r0, r6, #0
	adds r0, #0x3a
	str r4, [sp, #0x18]
	mov r8, r0
	ldrb r2, [r0]
	cmp r2, #1
	bne _08089D90
	movs r0, #0
	bl sub_8089998
	movs r0, #0
	mov r3, r8
	strb r0, [r3]
_08089D90:
	bl sub_80259A4
	ldrh r0, [r6, #0x38]
	lsrs r7, r0, #4
	movs r1, #0xf
	ands r0, r1
	rsbs r0, r0, #0
	mov sl, r0
	movs r5, #0
	ldr r0, _08089E40 @ =0x0200E668
	movs r4, #0x30
	adds r4, r4, r6
	mov sb, r4
	ldrb r0, [r0]
	cmp r7, r0
	bge _08089DE2
	ldr r1, _08089E44 @ =0x0200CBF0
	adds r4, r7, #0
	lsls r0, r7, #2
	adds r0, r0, r1
	str r0, [sp, #0x1c]
_08089DBA:
	lsls r2, r5, #4
	mov r0, sl
	adds r0, #0x38
	adds r2, r2, r0
	ldr r1, [sp, #0x1c]
	ldm r1!, {r0}
	str r1, [sp, #0x1c]
	ldr r3, [r0]
	movs r0, #4
	movs r1, #8
	bl sub_8026540
	adds r4, #1
	adds r5, #1
	cmp r5, #5
	bgt _08089DE2
	ldr r0, _08089E40 @ =0x0200E668
	ldrb r0, [r0]
	cmp r4, r0
	blt _08089DBA
_08089DE2:
	mov r2, r8
	ldrb r0, [r2]
	cmp r0, #0
	beq _08089E0E
	adds r3, r5, r7
	ldr r0, _08089E40 @ =0x0200E668
	ldrb r0, [r0]
	cmp r3, r0
	bge _08089E0E
	lsls r2, r5, #4
	mov r0, sl
	adds r0, #0x38
	adds r2, r2, r0
	ldr r1, _08089E44 @ =0x0200CBF0
	lsls r0, r3, #2
	adds r0, r0, r1
	ldr r0, [r0]
	ldr r3, [r0]
	movs r0, #4
	movs r1, #8
	bl sub_8026540
_08089E0E:
	ldr r0, [r6, #0x2c]
	adds r1, r0, #0
	adds r1, #0x2f
	adds r2, r0, #0
	adds r2, #0x2e
	ldrb r1, [r1]
	ldrb r2, [r2]
	cmp r1, r2
	bhs _08089E48
	adds r0, #0x39
	ldrb r0, [r0]
	cmp r0, #3
	beq _08089E48
	mov r3, sb
	ldrb r1, [r3]
	movs r0, #1
	movs r2, #1
	bl sub_80897E0
	b _08089E54
	.align 2, 0
_08089E38: .4byte gPal
_08089E3C: .4byte 0x02012970
_08089E40: .4byte 0x0200E668
_08089E44: .4byte 0x0200CBF0
_08089E48:
	mov r4, sb
	ldrb r1, [r4]
	movs r0, #1
	movs r2, #0
	bl sub_80897E0
_08089E54:
	ldr r0, [r6, #0x2c]
	adds r1, r0, #0
	adds r1, #0x2f
	ldrb r1, [r1]
	cmp r1, #1
	bls _08089E76
	adds r0, #0x39
	ldrb r0, [r0]
	cmp r0, #3
	beq _08089E76
	mov r5, sb
	ldrb r1, [r5]
	movs r0, #0
	movs r2, #1
	bl sub_80897E0
	b _08089E82
_08089E76:
	mov r0, sb
	ldrb r1, [r0]
	movs r0, #0
	movs r2, #0
	bl sub_80897E0
_08089E82:
	mov r1, sb
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x1b
	cmp r0, #5
	bls _08089E96
	movs r0, #0
	strb r0, [r1]
_08089E96:
	ldr r2, [sp, #0x14]
	ldrb r0, [r2]
	adds r0, #1
	strb r0, [r2]
	ldr r3, [sp, #0x18]
	ldrb r0, [r3]
	adds r0, #1
	strb r0, [r3]
	add sp, #0x20
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start nullsub_21
nullsub_21: @ 0x08089EB8
	bx lr
	.align 2, 0

	thumb_func_start sub_8089EBC
sub_8089EBC: @ 0x08089EBC
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r7, r0, #0
	mov r8, r1
	ldr r0, [r7, #0xc]
	movs r1, #8
	ands r0, r1
	cmp r0, #0
	bne _08089EDA
	mov r1, r8
	adds r1, #0x3b
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
_08089EDA:
	ldr r5, _08089FBC @ =0x0200C8F0
	ldr r4, _08089FC0 @ =0x0200E668
	ldrb r1, [r4]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r5
	str r7, [r0]
	movs r1, #1
	rsbs r1, r1, #0
	adds r0, r7, #0
	bl BattleGenerateUiStats
	ldrb r0, [r4]
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r5
	ldr r3, _08089FC4 @ =gBattleActor
	adds r0, r3, #0
	adds r0, #0x5a
	ldrh r0, [r0]
	adds r0, #1
	movs r2, #0xff
	ands r0, r2
	subs r0, #1
	strh r0, [r1, #4]
	ldrb r0, [r4]
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r5
	adds r0, r3, #0
	adds r0, #0x60
	ldrh r0, [r0]
	adds r0, #1
	ands r0, r2
	subs r0, #1
	strh r0, [r1, #6]
	ldrb r0, [r4]
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r5
	adds r0, r3, #0
	adds r0, #0x62
	ldrh r0, [r0]
	adds r0, #1
	ands r0, r2
	subs r0, #1
	strh r0, [r1, #8]
	adds r0, r7, #0
	bl GetUnitSupporterCount
	adds r5, r0, #0
	movs r6, #0
	movs r4, #0
	cmp r6, r5
	bge _08089F66
_08089F50:
	adds r0, r7, #0
	adds r1, r4, #0
	bl sub_8026C04
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08089F60
	adds r6, #1
_08089F60:
	adds r4, #1
	cmp r4, r5
	blt _08089F50
_08089F66:
	cmp r6, #3
	ble _08089F80
	mov r5, r8
	adds r5, #0x2e
	ldrb r4, [r5]
	subs r0, r6, #1
	movs r1, #3
	bl __divsi3
	adds r0, #6
	cmp r4, r0
	bge _08089F80
	strb r0, [r5]
_08089F80:
	ldr r4, _08089FBC @ =0x0200C8F0
	ldr r3, _08089FC0 @ =0x0200E668
	ldrb r1, [r3]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r4
	strb r6, [r0, #0xa]
	ldr r0, _08089FC8 @ =0x0200CBF0
	ldrb r1, [r3]
	lsls r2, r1, #2
	adds r2, r2, r0
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r4
	str r0, [r2]
	ldrb r0, [r3]
	adds r0, #1
	strb r0, [r3]
	adds r0, r7, #0
	bl GetUnitSMSId
	bl sub_8025278
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08089FBC: .4byte 0x0200C8F0
_08089FC0: .4byte 0x0200E668
_08089FC4: .4byte gBattleActor
_08089FC8: .4byte 0x0200CBF0

	thumb_func_start sub_8089FCC
sub_8089FCC: @ 0x08089FCC
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	ldr r1, _0808A020 @ =0x0200E668
	movs r0, #0
	strb r0, [r1]
	adds r0, r6, #0
	adds r0, #0x39
	ldrb r0, [r0]
	cmp r0, #1
	bne _0808A028
	ldr r0, _0808A024 @ =gPlaySt
	ldrb r0, [r0, #0xf]
	adds r5, r0, #1
	adds r0, #0x40
	cmp r5, r0
	bge _0808A064
_08089FEC:
	adds r0, r5, #0
	bl GetUnit
	adds r4, r0, #0
	cmp r4, #0
	beq _0808A012
	ldr r0, [r4]
	cmp r0, #0
	beq _0808A012
	adds r0, r4, #0
	bl sub_808E81C
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0808A012
	adds r0, r4, #0
	adds r1, r6, #0
	bl sub_8089EBC
_0808A012:
	adds r5, #1
	ldr r0, _0808A024 @ =gPlaySt
	ldrb r0, [r0, #0xf]
	adds r0, #0x40
	cmp r5, r0
	blt _08089FEC
	b _0808A064
	.align 2, 0
_0808A020: .4byte 0x0200E668
_0808A024: .4byte gPlaySt
_0808A028:
	ldr r0, _0808A030 @ =gPlaySt
	ldrb r0, [r0, #0xf]
	adds r4, r0, #1
	b _0808A05E
	.align 2, 0
_0808A030: .4byte gPlaySt
_0808A034:
	adds r0, r4, #0
	bl GetUnit
	adds r2, r0, #0
	cmp r2, #0
	beq _0808A058
	ldr r0, [r2]
	cmp r0, #0
	beq _0808A058
	ldr r0, [r2, #0xc]
	ldr r1, _0808A06C @ =0x0001000C
	ands r0, r1
	cmp r0, #0
	bne _0808A058
	adds r0, r2, #0
	adds r1, r6, #0
	bl sub_8089EBC
_0808A058:
	adds r4, #1
	ldr r0, _0808A070 @ =gPlaySt
	ldrb r0, [r0, #0xf]
_0808A05E:
	adds r0, #0x40
	cmp r4, r0
	blt _0808A034
_0808A064:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0808A06C: .4byte 0x0001000C
_0808A070: .4byte gPlaySt

	thumb_func_start sub_808A074
sub_808A074: @ 0x0808A074
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	ldr r1, _0808A0B8 @ =0x0200E668
	movs r0, #0
	strb r0, [r1]
	adds r0, r6, #0
	adds r0, #0x39
	ldrb r0, [r0]
	cmp r0, #1
	bne _0808A0BC
	movs r5, #1
_0808A08A:
	adds r0, r5, #0
	bl GetUnit
	adds r4, r0, #0
	cmp r4, #0
	beq _0808A0B0
	ldr r0, [r4]
	cmp r0, #0
	beq _0808A0B0
	adds r0, r4, #0
	bl sub_808E81C
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0808A0B0
	adds r0, r4, #0
	adds r1, r6, #0
	bl sub_8089EBC
_0808A0B0:
	adds r5, #1
	cmp r5, #0x3f
	ble _0808A08A
	b _0808A0E8
	.align 2, 0
_0808A0B8: .4byte 0x0200E668
_0808A0BC:
	movs r4, #1
_0808A0BE:
	adds r0, r4, #0
	bl GetUnit
	adds r2, r0, #0
	cmp r2, #0
	beq _0808A0E2
	ldr r0, [r2]
	cmp r0, #0
	beq _0808A0E2
	ldr r0, [r2, #0xc]
	ldr r1, _0808A0F0 @ =0x0001000C
	ands r0, r1
	cmp r0, #0
	bne _0808A0E2
	adds r0, r2, #0
	adds r1, r6, #0
	bl sub_8089EBC
_0808A0E2:
	adds r4, #1
	cmp r4, #0x3f
	ble _0808A0BE
_0808A0E8:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0808A0F0: .4byte 0x0001000C

	thumb_func_start sub_808A0F4
sub_808A0F4: @ 0x0808A0F4
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x1c
	mov r8, r0
	ldr r2, _0808A1D8 @ =gDispIo
	movs r6, #1
	ldrb r0, [r2, #1]
	orrs r0, r6
	movs r1, #2
	orrs r0, r1
	movs r1, #4
	orrs r0, r1
	movs r1, #8
	orrs r0, r1
	movs r1, #0x10
	orrs r0, r1
	strb r0, [r2, #1]
	movs r0, #0
	bl SetOnVMatch
	movs r0, #0
	bl InitBgs
	bl ResetText
	bl ResetTextFont
	bl ClearIcons
	bl ApplyUnitSpritePalettes
	movs r4, #0
	str r4, [sp, #4]
	ldr r1, _0808A1DC @ =gPal + 0x360
	ldr r2, _0808A1E0 @ =0x01000008
	add r0, sp, #4
	bl CpuFastSet
	bl ApplySystemObjectsGraphics
	mov r0, r8
	bl StartGreenText
	mov r0, r8
	adds r0, #0x3b
	strb r4, [r0]
	subs r0, #0xd
	movs r5, #6
	strb r5, [r0]
	mov r0, r8
	bl sub_808A074
	mov r0, r8
	adds r0, #0x39
	ldrb r0, [r0]
	cmp r0, #1
	bne _0808A188
	mov r0, r8
	adds r0, #0x2a
	mov r1, r8
	adds r1, #0x32
	str r1, [sp, #0x14]
	mov r2, r8
	adds r2, #0x29
	str r2, [sp, #8]
	movs r1, #0x2f
	add r1, r8
	mov sl, r1
	ldrb r0, [r0]
	cmp r0, #1
	bne _0808A200
_0808A188:
	ldr r4, _0808A1E4 @ =gPlaySt
	ldrb r1, [r4, #0x1a]
	mov r3, r8
	adds r3, #0x34
	mov r2, r8
	adds r2, #0x32
	str r2, [sp, #0x14]
	cmp r1, #0
	beq _0808A1AC
	lsrs r0, r1, #7
	ands r0, r6
	adds r2, #1
	strb r0, [r2]
	strb r0, [r3]
	movs r0, #0x7f
	ands r1, r0
	ldr r6, [sp, #0x14]
	strb r1, [r6]
_0808A1AC:
	mov r0, r8
	adds r0, #0x29
	str r0, [sp, #8]
	movs r0, #0x2f
	add r0, r8
	mov sl, r0
	ldr r1, [sp, #8]
	ldrb r1, [r1]
	cmp r1, #4
	beq _0808A1F6
	ldrb r0, [r0]
	cmp r0, #0
	beq _0808A1F6
	ldrb r4, [r4, #0x19]
	lsrs r1, r4, #4
	cmp r1, #0
	beq _0808A1F6
	cmp r1, #6
	bls _0808A1E8
	mov r2, sl
	strb r5, [r2]
	b _0808A1EC
	.align 2, 0
_0808A1D8: .4byte gDispIo
_0808A1DC: .4byte gPal + 0x360
_0808A1E0: .4byte 0x01000008
_0808A1E4: .4byte gPlaySt
_0808A1E8:
	mov r6, sl
	strb r1, [r6]
_0808A1EC:
	mov r1, sl
	ldrb r0, [r1]
	mov r1, r8
	adds r1, #0x36
	strb r0, [r1]
_0808A1F6:
	ldr r2, [sp, #0x14]
	ldrb r0, [r2]
	ldrb r1, [r3]
	bl sub_808BF20
_0808A200:
	ldr r0, _0808A2DC @ =gBg0Tm
	movs r1, #0
	bl TmFill
	ldr r4, _0808A2E0 @ =gBg1Tm
	adds r0, r4, #0
	movs r1, #0
	bl TmFill
	ldr r0, _0808A2E4 @ =gBg2Tm
	movs r1, #0
	bl TmFill
	bl InitIcons
	movs r0, #4
	bl ApplyIconPalettes
	bl UnpackUiWindowFrameGraphics
	ldr r0, _0808A2E8 @ =gUnk_08428114
	ldr r1, _0808A2EC @ =0x06014800
	bl Decompress
	ldr r0, _0808A2F0 @ =gUnk_08428A40
	movs r1, #0xc8
	lsls r1, r1, #2
	movs r2, #0x20
	bl ApplyPaletteExt
	bl sub_809186C
	ldr r1, _0808A2F4 @ =gUnk_08427BFC
	movs r2, #0x80
	lsls r2, r2, #5
	adds r0, r4, #0
	bl TmApplyTsa_thm
	movs r4, #0
	mov r6, r8
	adds r6, #0x2e
	str r6, [sp, #0x10]
	mov r0, r8
	adds r0, #0x39
	str r0, [sp, #0x18]
	mov r1, r8
	adds r1, #0x2b
	str r1, [sp, #0xc]
	ldr r6, _0808A2F8 @ =0x0200D5A8
	movs r2, #0x10
	adds r2, r2, r6
	mov sb, r2
	adds r5, r6, #0
	movs r7, #0
_0808A26C:
	lsls r0, r4, #3
	ldr r1, _0808A2FC @ =0x0200D570
	adds r0, r0, r1
	movs r1, #5
	bl InitText
	adds r0, r5, #0
	movs r1, #7
	bl sub_800536C
	adds r0, r6, #0
	adds r0, #8
	adds r0, r7, r0
	movs r1, #7
	bl InitText
	mov r0, sb
	movs r1, #5
	bl InitText
	movs r0, #0x18
	add sb, r0
	adds r5, #0x18
	adds r7, #0x18
	adds r4, #1
	cmp r4, #6
	ble _0808A26C
	ldr r0, _0808A300 @ =0x0200D650
	movs r1, #4
	bl InitText
	ldr r0, _0808A304 @ =0x0200D658
	movs r1, #0x14
	bl InitText
	ldr r0, _0808A308 @ =0x0200D660
	movs r1, #4
	bl InitText
	ldr r1, [sp, #0x14]
	ldrb r0, [r1]
	bl sub_8089638
	ldr r2, [sp, #8]
	ldrb r2, [r2]
	cmp r2, #4
	bne _0808A30C
	mov r0, r8
	movs r1, #0
	bl sub_808989C
	movs r0, #0
	ldr r6, [sp, #8]
	strb r0, [r6]
	b _0808A31C
	.align 2, 0
_0808A2DC: .4byte gBg0Tm
_0808A2E0: .4byte gBg1Tm
_0808A2E4: .4byte gBg2Tm
_0808A2E8: .4byte gUnk_08428114
_0808A2EC: .4byte 0x06014800
_0808A2F0: .4byte gUnk_08428A40
_0808A2F4: .4byte gUnk_08427BFC
_0808A2F8: .4byte 0x0200D5A8
_0808A2FC: .4byte 0x0200D570
_0808A300: .4byte 0x0200D650
_0808A304: .4byte 0x0200D658
_0808A308: .4byte 0x0200D660
_0808A30C:
	ldr r0, [sp, #0x18]
	ldrb r0, [r0]
	cmp r0, #1
	bne _0808A31C
	mov r0, r8
	movs r1, #1
	bl sub_808989C
_0808A31C:
	movs r1, #0
	movs r0, #0
	mov r2, r8
	strh r0, [r2, #0x3c]
	ldr r6, [sp, #0xc]
	strb r1, [r6]
	ldr r4, _0808A36C @ =0x0200D650
	adds r0, r4, #0
	bl ClearText
	adds r0, r4, #0
	movs r1, #0
	bl Text_SetCursor
	adds r0, r4, #0
	movs r1, #0
	bl Text_SetColor
	ldr r1, _0808A370 @ =gUnk_0842CE14
	adds r0, r4, #0
	bl Text_DrawString
	ldr r1, _0808A374 @ =gBg2Tm + 0x146
	adds r0, r4, #0
	bl PutText
	ldr r1, _0808A378 @ =0x0200E66C
	movs r2, #0xff
	adds r0, r1, #0
	adds r0, #0x4c
_0808A358:
	str r2, [r0]
	subs r0, #4
	cmp r0, r1
	bge _0808A358
	mov r0, r8
	ldrh r0, [r0, #0x3e]
	lsrs r4, r0, #4
	adds r0, r4, #6
	b _0808A39A
	.align 2, 0
_0808A36C: .4byte 0x0200D650
_0808A370: .4byte gUnk_0842CE14
_0808A374: .4byte gBg2Tm + 0x146
_0808A378: .4byte 0x0200E66C
_0808A37C:
	lsls r1, r4, #0x18
	lsrs r1, r1, #0x18
	mov r2, sl
	ldrb r3, [r2]
	movs r0, #1
	str r0, [sp]
	mov r0, r8
	ldr r2, _0808A4B4 @ =gBg0Tm
	bl sub_808B654
	adds r4, #1
	mov r6, r8
	ldrh r6, [r6, #0x3e]
	lsrs r0, r6, #4
	adds r0, #6
_0808A39A:
	cmp r4, r0
	bge _0808A3A6
	ldr r0, _0808A4B8 @ =0x0200E668
	ldrb r0, [r0]
	cmp r4, r0
	blt _0808A37C
_0808A3A6:
	ldr r1, [sp, #0x10]
	ldrb r0, [r1]
	mov r2, sl
	ldrb r1, [r2]
	movs r2, #1
	bl sub_808B5E4
	ldr r7, _0808A4BC @ =gDispIo
	movs r0, #0x20
	ldrb r6, [r7, #1]
	orrs r0, r6
	movs r1, #0x41
	rsbs r1, r1, #0
	ands r0, r1
	movs r1, #0x7f
	ands r0, r1
	strb r0, [r7, #1]
	adds r1, r7, #0
	adds r1, #0x2d
	movs r5, #0x10
	movs r0, #0x10
	strb r0, [r1]
	adds r1, #4
	movs r0, #0x38
	strb r0, [r1]
	subs r1, #5
	movs r0, #0xe0
	strb r0, [r1]
	adds r1, #4
	movs r0, #0x98
	strb r0, [r1]
	adds r2, r7, #0
	adds r2, #0x34
	movs r0, #1
	mov sb, r0
	ldrb r0, [r2]
	mov r1, sb
	orrs r0, r1
	movs r4, #2
	orrs r0, r4
	movs r3, #4
	orrs r0, r3
	movs r1, #8
	orrs r0, r1
	orrs r0, r5
	strb r0, [r2]
	adds r2, #2
	movs r0, #2
	rsbs r0, r0, #0
	ldrb r6, [r2]
	ands r0, r6
	orrs r0, r4
	orrs r0, r3
	orrs r0, r1
	orrs r0, r5
	strb r0, [r2]
	movs r0, #0xf
	bl EnableBgSync
	movs r0, #3
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	movs r0, #2
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	movs r0, #1
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	mov r0, r8
	ldrh r2, [r0, #0x3e]
	subs r2, #0x38
	movs r0, #0xff
	ands r2, r0
	movs r0, #0
	movs r1, #0
	bl SetBgOffset
	movs r1, #4
	rsbs r1, r1, #0
	adds r0, r1, #0
	ldrb r2, [r7, #0xc]
	ands r0, r2
	strb r0, [r7, #0xc]
	adds r0, r1, #0
	ldrb r6, [r7, #0x10]
	ands r0, r6
	orrs r0, r4
	strb r0, [r7, #0x10]
	ldrb r0, [r7, #0x14]
	ands r1, r0
	mov r2, sb
	orrs r1, r2
	strb r1, [r7, #0x14]
	movs r0, #3
	ldrb r6, [r7, #0x18]
	orrs r0, r6
	strb r0, [r7, #0x18]
	ldr r0, _0808A4C0 @ =gUnk_08427A48
	ldr r1, _0808A4C4 @ =gBg1Tm + 0x500
	bl Decompress
	ldr r0, _0808A4C8 @ =gUnk_0841E45C
	movs r1, #0xf0
	lsls r1, r1, #1
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r0, _0808A4CC @ =gUnk_08D8B98C
	mov r1, r8
	bl Proc_Start
	mov r1, r8
	str r0, [r1, #0x40]
	ldr r2, [sp, #0x18]
	ldrb r2, [r2]
	cmp r2, #1
	bne _0808A4D0
	bl CheckInLinkArena
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0808A4D0
	movs r0, #0
	movs r1, #0xa
	bl sub_80910B0
	mov r6, r8
	str r0, [r6, #0x44]
	b _0808A4DE
	.align 2, 0
_0808A4B4: .4byte gBg0Tm
_0808A4B8: .4byte 0x0200E668
_0808A4BC: .4byte gDispIo
_0808A4C0: .4byte gUnk_08427A48
_0808A4C4: .4byte gBg1Tm + 0x500
_0808A4C8: .4byte gUnk_0841E45C
_0808A4CC: .4byte gUnk_08D8B98C
_0808A4D0:
	movs r0, #0
	movs r1, #0
	movs r2, #0xa
	bl StartMuralBackgroundAlt
	mov r1, r8
	str r0, [r1, #0x44]
_0808A4DE:
	movs r1, #1
	rsbs r1, r1, #0
	movs r0, #0
	bl LoadHelpBoxGfx
	add sp, #0x1c
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_808A4F8
sub_808A4F8: @ 0x0808A4F8
	push {lr}
	adds r3, r0, #0
	adds r0, #0x29
	movs r1, #0
	strb r1, [r0]
	adds r0, #8
	movs r2, #1
	strb r2, [r0]
	subs r0, #5
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r0, #3
	strb r1, [r0]
	adds r0, #9
	ldrb r0, [r0]
	cmp r0, #3
	bne _0808A524
	adds r0, r3, #0
	adds r0, #0x2f
	strb r1, [r0]
	b _0808A52A
_0808A524:
	adds r0, r3, #0
	adds r0, #0x2f
	strb r2, [r0]
_0808A52A:
	ldrb r0, [r0]
	adds r2, r3, #0
	adds r2, #0x36
	movs r1, #0
	strb r0, [r2]
	movs r2, #0
	strh r1, [r3, #0x3e]
	adds r1, r3, #0
	adds r1, #0x32
	movs r0, #1
	strb r0, [r1]
	subs r1, #8
	strb r2, [r1]
	adds r1, #9
	strb r0, [r1]
	adds r0, r3, #0
	adds r0, #0x34
	strb r2, [r0]
	adds r0, #1
	strb r2, [r0]
	adds r0, r3, #0
	bl sub_808A0F4
	pop {r0}
	bx r0

	thumb_func_start sub_808A55C
sub_808A55C: @ 0x0808A55C
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r2, r0, #0
	adds r5, r1, #0
	adds r0, r5, #0
	adds r0, #0x3a
	adds r6, r5, #0
	adds r6, #0x3b
	ldrb r0, [r0]
	ldrb r1, [r6]
	cmp r0, r1
	bls _0808A5E4
	ldr r0, [r2, #0xc]
	movs r1, #0xb
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r2, #0xc]
	ldr r0, [r2]
	ldrb r0, [r0, #4]
	bl sub_808E5DC
	ldrh r0, [r5, #0x3e]
	lsrs r4, r0, #4
	adds r0, r4, #6
	b _0808A5AC
_0808A58E:
	lsls r1, r4, #0x18
	lsrs r1, r1, #0x18
	adds r0, r5, #0
	adds r0, #0x2f
	ldrb r3, [r0]
	movs r0, #1
	str r0, [sp]
	adds r0, r5, #0
	ldr r2, _0808A5D4 @ =gBg0Tm
	bl sub_808B654
	adds r4, #1
	ldrh r1, [r5, #0x3e]
	lsrs r0, r1, #4
	adds r0, #6
_0808A5AC:
	cmp r4, r0
	bge _0808A5B8
	ldr r0, _0808A5D8 @ =0x0200E668
	ldrb r0, [r0]
	cmp r4, r0
	blt _0808A58E
_0808A5B8:
	ldrb r0, [r6]
	adds r0, #1
	strb r0, [r6]
	ldr r0, _0808A5DC @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0808A5F8
	ldr r0, _0808A5E0 @ =0x0000038A
	bl m4aSongNumStart
	b _0808A5F8
	.align 2, 0
_0808A5D4: .4byte gBg0Tm
_0808A5D8: .4byte 0x0200E668
_0808A5DC: .4byte gPlaySt
_0808A5E0: .4byte 0x0000038A
_0808A5E4:
	ldr r0, _0808A600 @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0808A5F8
	movs r0, #0xe3
	lsls r0, r0, #2
	bl m4aSongNumStart
_0808A5F8:
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0808A600: .4byte gPlaySt

	thumb_func_start sub_808A604
sub_808A604: @ 0x0808A604
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r0, [r4]
	ldrb r0, [r0, #4]
	bl sub_808E6A4
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0808A68C
	ldr r0, [r4, #0xc]
	movs r1, #0xa
	orrs r0, r1
	str r0, [r4, #0xc]
	ldr r0, [r4]
	ldrb r0, [r0, #4]
	bl sub_808E604
	ldrh r0, [r5, #0x3e]
	lsrs r4, r0, #4
	adds r0, r4, #6
	adds r6, r5, #0
	adds r6, #0x3b
	b _0808A654
_0808A636:
	lsls r1, r4, #0x18
	lsrs r1, r1, #0x18
	adds r0, r5, #0
	adds r0, #0x2f
	ldrb r3, [r0]
	movs r0, #1
	str r0, [sp]
	adds r0, r5, #0
	ldr r2, _0808A67C @ =gBg0Tm
	bl sub_808B654
	adds r4, #1
	ldrh r1, [r5, #0x3e]
	lsrs r0, r1, #4
	adds r0, #6
_0808A654:
	cmp r4, r0
	bge _0808A660
	ldr r0, _0808A680 @ =0x0200E668
	ldrb r0, [r0]
	cmp r4, r0
	blt _0808A636
_0808A660:
	ldrb r0, [r6]
	subs r0, #1
	strb r0, [r6]
	ldr r0, _0808A684 @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0808A6A0
	ldr r0, _0808A688 @ =0x0000038B
	bl m4aSongNumStart
	b _0808A6A0
	.align 2, 0
_0808A67C: .4byte gBg0Tm
_0808A680: .4byte 0x0200E668
_0808A684: .4byte gPlaySt
_0808A688: .4byte 0x0000038B
_0808A68C:
	ldr r0, _0808A6A8 @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0808A6A0
	movs r0, #0xe3
	lsls r0, r0, #2
	bl m4aSongNumStart
_0808A6A0:
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0808A6A8: .4byte gPlaySt

	thumb_func_start sub_808A6AC
sub_808A6AC: @ 0x0808A6AC
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r0, #0x30
	ldr r1, _0808A6D8 @ =0x0200CBF0
	ldrb r0, [r0]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	ldr r5, [r0]
	ldr r1, [r5, #0xc]
	movs r0, #0x80
	lsls r0, r0, #0x12
	ands r0, r1
	cmp r0, #0
	beq _0808A6E0
	adds r0, r4, #0
	adds r0, #0x2c
	ldrb r0, [r0]
	lsls r1, r0, #4
	adds r1, #0x38
	ldr r2, _0808A6DC @ =0x000003B6
	b _0808A70A
	.align 2, 0
_0808A6D8: .4byte 0x0200CBF0
_0808A6DC: .4byte 0x000003B6
_0808A6E0:
	movs r0, #8
	ands r1, r0
	cmp r1, #0
	beq _0808A722
	bl CheckInLinkArena
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0808A718
	adds r0, r5, #0
	bl sub_80916F4
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0808A718
	adds r0, r4, #0
	adds r0, #0x2c
	ldrb r0, [r0]
	lsls r1, r0, #4
	adds r1, #0x38
	ldr r2, _0808A714 @ =0x000003B2
_0808A70A:
	movs r0, #0
	adds r3, r4, #0
	bl sub_8091664
	b _0808A72A
	.align 2, 0
_0808A714: .4byte 0x000003B2
_0808A718:
	adds r0, r5, #0
	adds r1, r4, #0
	bl sub_808A55C
	b _0808A72A
_0808A722:
	adds r0, r5, #0
	adds r1, r4, #0
	bl sub_808A604
_0808A72A:
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start sub_808A730
sub_808A730: @ 0x0808A730
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	adds r2, r1, #0
	ldr r0, [r6]
	ldr r1, [r6, #4]
	ldr r0, [r0, #0x28]
	ldr r1, [r1, #0x28]
	orrs r0, r1
	movs r1, #0x80
	lsls r1, r1, #2
	ands r0, r1
	cmp r0, #0
	beq _0808A764
	ldr r0, _0808A760 @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0808A7BE
	movs r0, #0xe3
	lsls r0, r0, #2
	bl m4aSongNumStart
	b _0808A7BE
	.align 2, 0
_0808A760: .4byte gPlaySt
_0808A764:
	ldr r4, [r6, #0xc]
	movs r5, #0xc0
	lsls r5, r5, #8
	adds r0, r4, #0
	ands r0, r5
	lsrs r1, r0, #0xe
	adds r0, r1, r2
	adds r0, #3
	movs r1, #3
	bl __modsi3
	lsls r1, r0, #0xe
	ldr r0, _0808A7A0 @ =0xFFFF3FFF
	ands r4, r0
	orrs r4, r1
	str r4, [r6, #0xc]
	ands r1, r5
	cmp r1, #0
	beq _0808A7AC
	ldr r0, _0808A7A4 @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0808A7BE
	ldr r0, _0808A7A8 @ =0x0000038A
	bl m4aSongNumStart
	b _0808A7BE
	.align 2, 0
_0808A7A0: .4byte 0xFFFF3FFF
_0808A7A4: .4byte gPlaySt
_0808A7A8: .4byte 0x0000038A
_0808A7AC:
	ldr r0, _0808A7C4 @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0808A7BE
	ldr r0, _0808A7C8 @ =0x0000038B
	bl m4aSongNumStart
_0808A7BE:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0808A7C4: .4byte gPlaySt
_0808A7C8: .4byte 0x0000038B

	thumb_func_start sub_808A7CC
sub_808A7CC: @ 0x0808A7CC
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #4
	adds r5, r0, #0
	ldr r2, _0808A7F4 @ =gpKeySt
	ldr r1, [r2]
	movs r0, #0x80
	lsls r0, r0, #2
	ldrh r1, [r1, #4]
	ands r0, r1
	mov ip, r2
	cmp r0, #0
	beq _0808A7F8
	adds r1, r5, #0
	adds r1, #0x31
	movs r0, #2
	b _0808A7FE
	.align 2, 0
_0808A7F4: .4byte gpKeySt
_0808A7F8:
	adds r1, r5, #0
	adds r1, #0x31
	movs r0, #1
_0808A7FE:
	strb r0, [r1]
	mov r8, r1
	mov r0, ip
	ldr r3, [r0]
	ldrh r4, [r3, #8]
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r4
	lsls r0, r0, #0x10
	lsrs r7, r0, #0x10
	cmp r7, #0
	beq _0808A820
	adds r0, r5, #0
	movs r1, #3
	bl Proc_Goto
	b _0808AB62
_0808A820:
	movs r1, #1
	mov sb, r1
	mov r6, sb
	ands r6, r4
	cmp r6, #0
	beq _0808A890
	adds r0, r5, #0
	adds r0, #0x39
	ldrb r0, [r0]
	cmp r0, #1
	beq _0808A848
	cmp r0, #1
	bgt _0808A840
	cmp r0, #0
	beq _0808A850
	b _0808AB62
_0808A840:
	cmp r0, #3
	bne _0808A846
	b _0808A946
_0808A846:
	b _0808AB62
_0808A848:
	adds r0, r5, #0
	bl sub_808A6AC
	b _0808AB62
_0808A850:
	ldr r1, _0808A884 @ =0x0200CBF0
	adds r0, r5, #0
	adds r0, #0x30
	ldrb r0, [r0]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	ldr r0, [r0]
	ldrb r0, [r0, #0xb]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl SetStatScreenLastUnitId
	ldr r0, _0808A888 @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0808A87C
	ldr r0, _0808A88C @ =0x0000038A
	bl m4aSongNumStart
_0808A87C:
	adds r0, r5, #0
	bl Proc_Break
	b _0808AB62
	.align 2, 0
_0808A884: .4byte 0x0200CBF0
_0808A888: .4byte gPlaySt
_0808A88C: .4byte 0x0000038A
_0808A890:
	ldrh r1, [r3, #6]
	movs r2, #0x20
	adds r0, r2, #0
	ands r0, r1
	lsls r0, r0, #0x10
	lsrs r7, r0, #0x10
	cmp r7, #0
	beq _0808A928
	adds r0, r5, #0
	adds r0, #0x39
	ldrb r0, [r0]
	cmp r0, #3
	bne _0808A8E4
	adds r0, r2, #0
	ands r0, r4
	cmp r0, #0
	bne _0808A8B4
	b _0808AB62
_0808A8B4:
	ldr r1, _0808A8DC @ =0x0200CBF0
	adds r4, r5, #0
	adds r4, #0x30
	ldrb r3, [r4]
	lsls r0, r3, #2
	adds r0, r0, r1
	ldr r0, [r0]
	ldr r0, [r0]
	movs r1, #1
	rsbs r1, r1, #0
	bl sub_808A730
	ldrb r1, [r4]
	ldr r2, _0808A8E0 @ =gBg0Tm
	adds r0, r5, #0
	adds r0, #0x2f
	ldrb r3, [r0]
	str r6, [sp]
	b _0808A968
	.align 2, 0
_0808A8DC: .4byte 0x0200CBF0
_0808A8E0: .4byte gBg0Tm
_0808A8E4:
	adds r0, r5, #0
	adds r0, #0x2f
	ldrb r0, [r0]
	cmp r0, #1
	bhi _0808A8F0
	b _0808AB62
_0808A8F0:
	adds r1, r5, #0
	adds r1, #0x36
	ldrb r0, [r1]
	subs r0, #1
	strb r0, [r1]
	adds r0, r5, #0
	movs r1, #2
	bl Proc_Goto
	adds r0, r5, #0
	adds r0, #0x2d
	strb r6, [r0]
	ldr r0, _0808A920 @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	bge _0808A916
	b _0808AB62
_0808A916:
	ldr r0, _0808A924 @ =0x0000038F
	bl m4aSongNumStart
	b _0808AB62
	.align 2, 0
_0808A920: .4byte gPlaySt
_0808A924: .4byte 0x0000038F
_0808A928:
	movs r6, #0x10
	adds r0, r6, #0
	ands r0, r1
	cmp r0, #0
	beq _0808A9C0
	adds r0, r5, #0
	adds r0, #0x39
	ldrb r0, [r0]
	cmp r0, #3
	bne _0808A978
	adds r0, r6, #0
	ands r0, r4
	cmp r0, #0
	bne _0808A946
	b _0808AB62
_0808A946:
	ldr r1, _0808A970 @ =0x0200CBF0
	adds r4, r5, #0
	adds r4, #0x30
	ldrb r2, [r4]
	lsls r0, r2, #2
	adds r0, r0, r1
	ldr r0, [r0]
	ldr r0, [r0]
	movs r1, #1
	bl sub_808A730
	ldrb r1, [r4]
	ldr r2, _0808A974 @ =gBg0Tm
	adds r0, r5, #0
	adds r0, #0x2f
	ldrb r3, [r0]
	str r7, [sp]
_0808A968:
	adds r0, r5, #0
	bl sub_808B654
	b _0808AB62
	.align 2, 0
_0808A970: .4byte 0x0200CBF0
_0808A974: .4byte gBg0Tm
_0808A978:
	adds r0, r5, #0
	adds r0, #0x2f
	adds r1, r5, #0
	adds r1, #0x2e
	ldrb r0, [r0]
	ldrb r1, [r1]
	cmp r0, r1
	blo _0808A98A
	b _0808AB62
_0808A98A:
	adds r1, r5, #0
	adds r1, #0x36
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	adds r0, r5, #0
	adds r0, #0x2d
	strb r7, [r0]
	ldr r0, _0808A9B8 @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0808A9AC
	ldr r0, _0808A9BC @ =0x0000038F
	bl m4aSongNumStart
_0808A9AC:
	adds r0, r5, #0
	movs r1, #2
	bl Proc_Goto
	b _0808AB62
	.align 2, 0
_0808A9B8: .4byte gPlaySt
_0808A9BC: .4byte 0x0000038F
_0808A9C0:
	movs r7, #0x40
	adds r0, r7, #0
	ands r0, r1
	cmp r0, #0
	bne _0808A9E0
	movs r0, #0x80
	lsls r0, r0, #2
	ldrh r1, [r3, #4]
	ands r0, r1
	cmp r0, #0
	beq _0808AAAA
	adds r0, r7, #0
	ldrh r3, [r3, #0x10]
	ands r0, r3
	cmp r0, #0
	beq _0808AAAA
_0808A9E0:
	adds r6, r5, #0
	adds r6, #0x30
	ldrb r0, [r6]
	cmp r0, #0
	bne _0808AA18
	adds r0, r7, #0
	ands r0, r4
	cmp r0, #0
	bne _0808A9F4
	b _0808AB62
_0808A9F4:
	ldr r0, _0808AA10 @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0808AA06
	ldr r0, _0808AA14 @ =0x00000386
	bl m4aSongNumStart
_0808AA06:
	adds r1, r5, #0
	adds r1, #0x29
	movs r0, #3
	strb r0, [r1]
	b _0808AB62
	.align 2, 0
_0808AA10: .4byte gPlaySt
_0808AA14: .4byte 0x00000386
_0808AA18:
	subs r0, #1
	strb r0, [r6]
	ldr r0, _0808AA98 @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0808AA2E
	ldr r0, _0808AA9C @ =0x00000386
	bl m4aSongNumStart
_0808AA2E:
	adds r0, r5, #0
	adds r0, #0x2c
	ldrb r1, [r0]
	adds r4, r0, #0
	cmp r1, #1
	bhi _0808AAA4
	ldrh r2, [r5, #0x3e]
	lsrs r0, r2, #4
	cmp r0, #0
	beq _0808AAA4
	cmp r1, #0
	bne _0808AA50
	ldrb r0, [r6]
	adds r0, #1
	strb r0, [r6]
	movs r0, #1
	strb r0, [r4]
_0808AA50:
	ldrh r3, [r5, #0x3e]
	lsrs r1, r3, #4
	subs r1, #1
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	ldr r2, _0808AAA0 @ =gBg0Tm
	adds r0, r5, #0
	adds r0, #0x2f
	ldrb r3, [r0]
	mov r0, sb
	str r0, [sp]
	adds r0, r5, #0
	bl sub_808B654
	adds r1, r5, #0
	adds r1, #0x29
	movs r0, #2
	strb r0, [r1]
	mov r1, r8
	ldrb r1, [r1]
	lsls r2, r1, #2
	ldrh r3, [r5, #0x3e]
	subs r2, r3, r2
	strh r2, [r5, #0x3e]
	subs r2, #0x38
	movs r0, #0xff
	ands r2, r0
	movs r0, #0
	movs r1, #0
	bl SetBgOffset
	ldrb r0, [r4]
	cmp r0, #0
	bne _0808AB62
	b _0808AB5E
	.align 2, 0
_0808AA98: .4byte gPlaySt
_0808AA9C: .4byte 0x00000386
_0808AAA0: .4byte gBg0Tm
_0808AAA4:
	ldrb r0, [r4]
	subs r0, #1
	b _0808AB60
_0808AAAA:
	mov r0, ip
	ldr r2, [r0]
	movs r1, #0x80
	adds r0, r1, #0
	ldrh r3, [r2, #6]
	ands r0, r3
	cmp r0, #0
	bne _0808AAD0
	movs r0, #0x80
	lsls r0, r0, #2
	ldrh r3, [r2, #4]
	ands r0, r3
	cmp r0, #0
	beq _0808AB62
	adds r0, r1, #0
	ldrh r2, [r2, #0x10]
	ands r0, r2
	cmp r0, #0
	beq _0808AB62
_0808AAD0:
	adds r6, r5, #0
	adds r6, #0x30
	ldrb r1, [r6]
	ldr r7, _0808AB4C @ =0x0200E668
	ldrb r0, [r7]
	subs r0, #1
	cmp r1, r0
	bge _0808AB62
	adds r0, r1, #1
	strb r0, [r6]
	ldr r0, _0808AB50 @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0808AAF6
	ldr r0, _0808AB54 @ =0x00000386
	bl m4aSongNumStart
_0808AAF6:
	adds r0, r5, #0
	adds r0, #0x2c
	adds r4, r0, #0
	ldrb r0, [r4]
	cmp r0, #4
	bne _0808AB5C
	ldrb r1, [r6]
	ldrb r0, [r7]
	subs r0, #1
	cmp r1, r0
	beq _0808AB5C
	ldrh r2, [r5, #0x3e]
	lsrs r1, r2, #4
	adds r1, #6
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	ldr r2, _0808AB58 @ =gBg0Tm
	adds r0, r5, #0
	adds r0, #0x2f
	ldrb r3, [r0]
	movs r4, #1
	str r4, [sp]
	adds r0, r5, #0
	bl sub_808B654
	adds r0, r5, #0
	adds r0, #0x29
	strb r4, [r0]
	mov r3, r8
	ldrb r3, [r3]
	lsls r2, r3, #2
	ldrh r0, [r5, #0x3e]
	adds r2, r0, r2
	strh r2, [r5, #0x3e]
	subs r2, #0x38
	movs r0, #0xff
	ands r2, r0
	movs r0, #0
	movs r1, #0
	bl SetBgOffset
	b _0808AB62
	.align 2, 0
_0808AB4C: .4byte 0x0200E668
_0808AB50: .4byte gPlaySt
_0808AB54: .4byte 0x00000386
_0808AB58: .4byte gBg0Tm
_0808AB5C:
	ldrb r0, [r4]
_0808AB5E:
	adds r0, #1
_0808AB60:
	strb r0, [r4]
_0808AB62:
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_808AB70
sub_808AB70: @ 0x0808AB70
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	adds r7, r0, #0
	adds r4, r7, #0
	adds r4, #0x2b
	ldrb r0, [r4]
	ldr r2, _0808ABA4 @ =gpKeySt
	cmp r0, #0
	beq _0808ABA8
	ldr r1, [r2]
	movs r0, #0x81
	lsls r0, r0, #1
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _0808ABA8
	bl CloseHelpBox
	movs r0, #0
	strb r0, [r4]
	b _0808AE50
	.align 2, 0
_0808ABA4: .4byte gpKeySt
_0808ABA8:
	ldr r1, [r2]
	movs r0, #1
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _0808AC94
	adds r0, r7, #0
	adds r0, #0x2b
	ldrb r0, [r0]
	cmp r0, #0
	bne _0808AC94
	adds r1, r7, #0
	adds r1, #0x32
	ldrb r0, [r1]
	str r0, [sp, #4]
	adds r2, r7, #0
	adds r2, #0x2a
	movs r0, #1
	strb r0, [r2]
	ldr r0, _0808AC30 @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	mov r8, r1
	cmp r0, #0
	blt _0808ABE2
	ldr r0, _0808AC34 @ =0x0000038A
	bl m4aSongNumStart
_0808ABE2:
	ldr r1, _0808AC38 @ =gUnk_08D8BB00
	adds r6, r7, #0
	adds r6, #0x2d
	adds r5, r7, #0
	adds r5, #0x2f
	ldrb r2, [r5]
	lsls r0, r2, #3
	adds r0, r0, r2
	ldrb r3, [r6]
	adds r0, r3, r0
	lsls r0, r0, #4
	adds r0, r0, r1
	ldrb r0, [r0]
	mov r4, r8
	strb r0, [r4]
	adds r4, r7, #0
	adds r4, #0x33
	ldrb r0, [r4]
	adds r0, #1
	movs r1, #1
	ands r0, r1
	strb r0, [r4]
	mov r1, r8
	ldrb r0, [r1]
	ldrb r1, [r4]
	bl sub_808BF20
	lsls r0, r0, #0x18
	mov sb, r4
	movs r2, #0x34
	adds r2, r2, r7
	mov sl, r2
	adds r3, r7, #0
	adds r3, #0x35
	str r3, [sp, #8]
	cmp r0, #0
	beq _0808AC68
	movs r4, #0
	b _0808AC54
	.align 2, 0
_0808AC30: .4byte gPlaySt
_0808AC34: .4byte 0x0000038A
_0808AC38: .4byte gUnk_08D8BB00
_0808AC3C:
	lsls r1, r4, #0x18
	lsrs r1, r1, #0x18
	ldrb r3, [r5]
	movs r0, #1
	str r0, [sp]
	adds r0, r7, #0
	ldr r2, _0808AC8C @ =gBg0Tm
	bl sub_808B654
	adds r4, #1
	cmp r4, #5
	bgt _0808AC5C
_0808AC54:
	ldr r0, _0808AC90 @ =0x0200E668
	ldrb r0, [r0]
	cmp r4, r0
	blt _0808AC3C
_0808AC5C:
	ldrh r0, [r7, #0x3e]
	bl sub_8089720
	movs r0, #1
	bl EnableBgSync
_0808AC68:
	mov r4, sb
	ldrb r0, [r4]
	mov r1, sl
	strb r0, [r1]
	ldrb r0, [r6]
	ldr r2, [sp, #8]
	strb r0, [r2]
	mov r3, r8
	ldrb r3, [r3]
	ldr r4, [sp, #4]
	cmp r3, r4
	bne _0808AC82
	b _0808AE50
_0808AC82:
	mov r6, r8
	ldrb r0, [r6]
	bl sub_8089638
	b _0808AE50
	.align 2, 0
_0808AC8C: .4byte gBg0Tm
_0808AC90: .4byte 0x0200E668
_0808AC94:
	ldr r1, [r2]
	movs r0, #0x80
	ldrh r1, [r1, #6]
	ands r0, r1
	cmp r0, #0
	beq _0808ACD4
	adds r0, r7, #0
	adds r0, #0x2b
	ldrb r4, [r0]
	cmp r4, #0
	bne _0808ACD4
	ldr r0, _0808ACCC @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0808ACBC
	ldr r0, _0808ACD0 @ =0x00000386
	bl m4aSongNumStart
_0808ACBC:
	adds r1, r7, #0
	adds r1, #0x33
	movs r0, #1
	strb r0, [r1]
	adds r0, r7, #0
	adds r0, #0x29
	strb r4, [r0]
	b _0808AE50
	.align 2, 0
_0808ACCC: .4byte gPlaySt
_0808ACD0: .4byte 0x00000386
_0808ACD4:
	ldr r1, [r2]
	ldrh r2, [r1, #6]
	movs r0, #0x20
	ands r0, r2
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	cmp r4, #0
	beq _0808AD6E
	adds r1, r7, #0
	adds r1, #0x33
	movs r0, #1
	strb r0, [r1]
	subs r1, #6
	ldrb r0, [r1]
	adds r6, r1, #0
	cmp r0, #0
	bne _0808AD68
	adds r0, r7, #0
	adds r0, #0x2f
	ldrb r0, [r0]
	cmp r0, #1
	bhi _0808AD02
	b _0808AE50
_0808AD02:
	adds r0, r7, #0
	adds r0, #0x39
	ldrb r0, [r0]
	cmp r0, #3
	bne _0808AD0E
	b _0808AE50
_0808AD0E:
	ldr r0, _0808AD5C @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0808AD20
	ldr r0, _0808AD60 @ =0x0000038F
	bl m4aSongNumStart
_0808AD20:
	adds r1, r7, #0
	adds r1, #0x36
	ldrb r0, [r1]
	subs r0, #1
	strb r0, [r1]
	movs r4, #8
	ldr r2, _0808AD64 @ =gUnk_08D8BB00
	lsls r0, r0, #3
	ldrb r1, [r1]
	adds r0, r0, r1
	lsls r1, r0, #4
	adds r0, r1, #0
	adds r0, #0x80
	adds r0, r0, r2
	ldrb r0, [r0, #8]
	cmp r0, #0
	bne _0808AD56
	adds r0, r1, r2
	adds r1, r0, #0
	adds r1, #0x80
_0808AD48:
	subs r1, #0x10
	subs r4, #1
	cmp r4, #0
	ble _0808AD56
	ldrb r0, [r1, #8]
	cmp r0, #0
	beq _0808AD48
_0808AD56:
	strb r4, [r6]
	b _0808ADD8
	.align 2, 0
_0808AD5C: .4byte gPlaySt
_0808AD60: .4byte 0x0000038F
_0808AD64: .4byte gUnk_08D8BB00
_0808AD68:
	subs r0, #1
	strb r0, [r1]
	b _0808ADF2
_0808AD6E:
	movs r0, #0x10
	ands r0, r2
	cmp r0, #0
	beq _0808AE10
	adds r1, r7, #0
	adds r1, #0x33
	movs r0, #1
	strb r0, [r1]
	adds r2, r7, #0
	adds r2, #0x2d
	adds r5, r7, #0
	adds r5, #0x2f
	ldrb r0, [r2]
	cmp r0, #8
	beq _0808ADA4
	ldr r0, _0808ADE4 @ =gUnk_08D8BB00
	ldrb r3, [r2]
	adds r3, #1
	ldrb r6, [r5]
	lsls r1, r6, #3
	adds r1, r1, r6
	adds r1, r1, r3
	lsls r1, r1, #4
	adds r1, r1, r0
	ldrb r0, [r1, #8]
	cmp r0, #0
	bne _0808ADF0
_0808ADA4:
	adds r0, r7, #0
	adds r0, #0x2e
	ldrb r5, [r5]
	ldrb r0, [r0]
	cmp r5, r0
	bhs _0808AE50
	adds r0, r7, #0
	adds r0, #0x39
	ldrb r0, [r0]
	cmp r0, #3
	beq _0808AE50
	strb r4, [r2]
	ldr r0, _0808ADE8 @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0808ADCE
	ldr r0, _0808ADEC @ =0x0000038F
	bl m4aSongNumStart
_0808ADCE:
	adds r1, r7, #0
	adds r1, #0x36
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
_0808ADD8:
	adds r0, r7, #0
	movs r1, #2
	bl Proc_Goto
	b _0808AE50
	.align 2, 0
_0808ADE4: .4byte gUnk_08D8BB00
_0808ADE8: .4byte gPlaySt
_0808ADEC: .4byte 0x0000038F
_0808ADF0:
	strb r3, [r2]
_0808ADF2:
	ldr r0, _0808AE08 @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0808AE50
	ldr r0, _0808AE0C @ =0x00000387
	bl m4aSongNumStart
	b _0808AE50
	.align 2, 0
_0808AE08: .4byte gPlaySt
_0808AE0C: .4byte 0x00000387
_0808AE10:
	movs r0, #0x80
	lsls r0, r0, #1
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _0808AE50
	adds r1, r7, #0
	adds r1, #0x2b
	ldrb r0, [r1]
	cmp r0, #0
	bne _0808AE50
	movs r0, #1
	strb r0, [r1]
	ldr r2, _0808AE60 @ =gUnk_08D8BB00
	adds r3, r7, #0
	adds r3, #0x2d
	adds r0, r7, #0
	adds r0, #0x2f
	ldrb r4, [r0]
	lsls r1, r4, #3
	adds r1, r1, r4
	ldrb r3, [r3]
	adds r1, r3, r1
	lsls r1, r1, #4
	adds r0, r1, r2
	ldrb r0, [r0, #8]
	adds r2, #0xc
	adds r1, r1, r2
	ldr r2, [r1]
	movs r1, #0x28
	bl StartHelpBox
_0808AE50:
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0808AE60: .4byte gUnk_08D8BB00

	thumb_func_start sub_808AE64
sub_808AE64: @ 0x0808AE64
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r0, #0x2d
	ldrb r6, [r0]
	adds r5, r4, #0
	adds r5, #0x29
	ldrb r0, [r5]
	cmp r0, #1
	beq _0808AE9A
	cmp r0, #1
	bgt _0808AE80
	cmp r0, #0
	beq _0808AE8A
	b _0808AEFC
_0808AE80:
	cmp r0, #2
	beq _0808AECC
	cmp r0, #3
	beq _0808AE92
	b _0808AEFC
_0808AE8A:
	adds r0, r4, #0
	bl sub_808A7CC
	b _0808AEFC
_0808AE92:
	adds r0, r4, #0
	bl sub_808AB70
	b _0808AEFC
_0808AE9A:
	adds r0, r4, #0
	adds r0, #0x31
	ldrb r0, [r0]
	lsls r2, r0, #2
	ldrh r0, [r4, #0x3e]
	adds r2, r0, r2
	strh r2, [r4, #0x3e]
	subs r2, #0x38
	movs r0, #0xff
	ands r2, r0
	movs r0, #0
	movs r1, #0
	bl SetBgOffset
	movs r0, #0xf
	ldrh r1, [r4, #0x3e]
	ands r0, r1
	cmp r0, #0
	bne _0808AEFC
	movs r0, #0
	strb r0, [r5]
	ldrh r0, [r4, #0x3e]
	bl sub_8089720
	b _0808AEFC
_0808AECC:
	adds r0, r4, #0
	adds r0, #0x31
	ldrb r0, [r0]
	lsls r2, r0, #2
	ldrh r0, [r4, #0x3e]
	subs r2, r0, r2
	strh r2, [r4, #0x3e]
	subs r2, #0x38
	movs r0, #0xff
	ands r2, r0
	movs r0, #0
	movs r1, #0
	bl SetBgOffset
	movs r0, #0xf
	ldrh r1, [r4, #0x3e]
	ands r0, r1
	cmp r0, #0
	bne _0808AEFC
	movs r0, #0
	strb r0, [r5]
	ldrh r0, [r4, #0x3e]
	bl sub_8089720
_0808AEFC:
	ldr r0, _0808AF68 @ =gpKeySt
	ldr r1, [r0]
	movs r0, #2
	ldrh r1, [r1, #8]
	ands r0, r1
	adds r5, r4, #0
	adds r5, #0x2b
	cmp r0, #0
	beq _0808AF32
	ldrb r0, [r5]
	cmp r0, #0
	bne _0808AF38
	ldr r0, _0808AF6C @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0808AF26
	ldr r0, _0808AF70 @ =0x0000038B
	bl m4aSongNumStart
_0808AF26:
	movs r0, #0
	bl SetStatScreenLastUnitId
	adds r0, r4, #0
	bl Proc_Break
_0808AF32:
	ldrb r0, [r5]
	cmp r0, #0
	beq _0808AF60
_0808AF38:
	adds r0, r4, #0
	adds r0, #0x2d
	ldrb r3, [r0]
	cmp r6, r3
	beq _0808AF60
	ldr r2, _0808AF74 @ =gUnk_08D8BB00
	adds r0, #9
	ldrb r4, [r0]
	lsls r1, r4, #3
	adds r1, r1, r4
	adds r1, r1, r3
	lsls r1, r1, #4
	adds r0, r1, r2
	ldrb r0, [r0, #8]
	adds r2, #0xc
	adds r1, r1, r2
	ldr r2, [r1]
	movs r1, #0x28
	bl StartHelpBox
_0808AF60:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0808AF68: .4byte gpKeySt
_0808AF6C: .4byte gPlaySt
_0808AF70: .4byte 0x0000038B
_0808AF74: .4byte gUnk_08D8BB00

	thumb_func_start sub_808AF78
sub_808AF78: @ 0x0808AF78
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x39
	ldrb r0, [r0]
	cmp r0, #1
	bne _0808AFA0
	ldr r1, _0808B020 @ =0x0200CBF0
	adds r0, r4, #0
	adds r0, #0x30
	ldrb r0, [r0]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	ldr r0, [r0]
	ldr r0, [r0]
	ldrb r0, [r0, #4]
	bl sub_808E694
	bl sub_808954C
_0808AFA0:
	ldr r2, _0808B024 @ =gPlaySt
	adds r0, r4, #0
	adds r0, #0x34
	ldrb r0, [r0]
	lsls r0, r0, #7
	adds r1, r4, #0
	adds r1, #0x32
	ldrb r1, [r1]
	adds r0, r1, r0
	strb r0, [r2, #0x1a]
	adds r0, r4, #0
	adds r0, #0x2f
	ldrb r1, [r0]
	cmp r1, #0
	beq _0808AFCA
	lsls r1, r1, #4
	movs r0, #0xf
	ldrb r3, [r2, #0x19]
	ands r0, r3
	orrs r0, r1
	strb r0, [r2, #0x19]
_0808AFCA:
	ldr r0, [r4, #0x40]
	bl Proc_End
	ldr r0, [r4, #0x44]
	cmp r0, #0
	beq _0808AFDA
	bl Proc_End
_0808AFDA:
	bl EndGreenText
	ldr r0, _0808B028 @ =gBg0Tm
	movs r1, #0
	bl TmFill
	ldr r0, _0808B02C @ =gBg1Tm
	movs r1, #0
	bl TmFill
	ldr r0, _0808B030 @ =gBg2Tm
	movs r1, #0
	bl TmFill
	movs r0, #0xf
	bl EnableBgSync
	ldr r2, _0808B034 @ =gDispIo
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
	bl ResetTextFont
	bl ClearIcons
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0808B020: .4byte 0x0200CBF0
_0808B024: .4byte gPlaySt
_0808B028: .4byte gBg0Tm
_0808B02C: .4byte gBg1Tm
_0808B030: .4byte gBg2Tm
_0808B034: .4byte gDispIo

	thumb_func_start sub_808B038
sub_808B038: @ 0x0808B038
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r5, r0, #0
	ldr r0, _0808B05C @ =0x0200CCF0
	movs r1, #0x1f
	movs r2, #0x1f
	movs r3, #0
	bl TmFillRect_thm
	ldrh r0, [r5, #0x3e]
	lsrs r4, r0, #4
	adds r0, r4, #6
	cmp r4, r0
	bge _0808B08A
	ldr r0, _0808B060 @ =0x0200E668
	adds r6, r5, #0
	adds r6, #0x2f
	b _0808B084
	.align 2, 0
_0808B05C: .4byte 0x0200CCF0
_0808B060: .4byte 0x0200E668
_0808B064:
	lsls r1, r4, #0x18
	lsrs r1, r1, #0x18
	ldrb r3, [r6]
	movs r0, #0
	str r0, [sp]
	adds r0, r5, #0
	ldr r2, _0808B0C0 @ =0x0200CCF0
	bl sub_808B654
	adds r4, #1
	ldrh r1, [r5, #0x3e]
	lsrs r0, r1, #4
	adds r0, #6
	cmp r4, r0
	bge _0808B08A
	ldr r0, _0808B0C4 @ =0x0200E668
_0808B084:
	ldrb r0, [r0]
	cmp r4, r0
	blt _0808B064
_0808B08A:
	ldr r4, _0808B0C8 @ =0x0200D4F0
	adds r0, r4, #0
	movs r1, #0x1f
	movs r2, #1
	movs r3, #0
	bl TmFillRect_thm
	adds r6, r5, #0
	adds r6, #0x2f
	ldrb r1, [r6]
	adds r0, r4, #0
	bl sub_808B520
	movs r1, #0
	movs r0, #0
	strh r0, [r5, #0x3c]
	ldrb r0, [r6]
	adds r2, r5, #0
	adds r2, #0x37
	strb r0, [r2]
	adds r0, r5, #0
	adds r0, #0x38
	strb r1, [r0]
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0808B0C0: .4byte 0x0200CCF0
_0808B0C4: .4byte 0x0200E668
_0808B0C8: .4byte 0x0200D4F0

	thumb_func_start sub_808B0CC
sub_808B0CC: @ 0x0808B0CC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x10
	adds r5, r0, #0
	adds r1, r5, #0
	adds r1, #0x38
	ldr r0, _0808B12C @ =gUnk_08D8B9B4
	ldrh r2, [r5, #0x3c]
	adds r0, r2, r0
	ldrb r2, [r1]
	ldrb r0, [r0]
	adds r0, r2, r0
	strb r0, [r1]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x14
	bls _0808B0F8
	movs r0, #0x14
	strb r0, [r1]
_0808B0F8:
	ldrh r0, [r5, #0x3c]
	adds r0, #1
	strh r0, [r5, #0x3c]
	movs r3, #0
	str r1, [sp, #0xc]
	adds r0, r5, #0
	adds r0, #0x36
	str r0, [sp, #8]
	movs r1, #0x2f
	adds r1, r1, r5
	mov sl, r1
	ldr r2, [sp, #0xc]
	str r2, [sp, #4]
_0808B112:
	ldr r0, [sp, #8]
	ldrb r1, [r0]
	mov r0, sl
	ldrb r0, [r0]
	cmp r1, r0
	bls _0808B130
	ldr r1, [sp, #4]
	ldrb r1, [r1]
	adds r0, r1, r3
	cmp r0, #0x14
	bgt _0808B138
	b _0808B13E
	.align 2, 0
_0808B12C: .4byte gUnk_08D8B9B4
_0808B130:
	ldr r2, [sp, #4]
	ldrb r0, [r2]
	cmp r3, r0
	bge _0808B13C
_0808B138:
	movs r1, #0
	b _0808B144
_0808B13C:
	subs r0, r3, r0
_0808B13E:
	adds r0, #8
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
_0808B144:
	ldrh r0, [r5, #0x3e]
	lsrs r4, r0, #3
	adds r0, r4, #0
	adds r0, #0xc
	lsls r6, r1, #1
	adds r1, r3, #1
	mov sb, r1
	cmp r4, r0
	bge _0808B188
	movs r2, #0x1f
	mov r8, r2
	ldr r0, _0808B204 @ =gBg0Tm
	mov ip, r0
	ldr r7, _0808B208 @ =0x0200CCF0
	adds r2, r6, #0
_0808B162:
	adds r0, r4, #0
	mov r1, r8
	ands r0, r1
	lsls r1, r0, #5
	adds r1, #8
	adds r1, r1, r3
	lsls r1, r1, #1
	add r1, ip
	lsls r0, r0, #6
	adds r0, r2, r0
	adds r0, r0, r7
	ldrh r0, [r0]
	strh r0, [r1]
	adds r4, #1
	ldrh r1, [r5, #0x3e]
	lsrs r0, r1, #3
	adds r0, #0xc
	cmp r4, r0
	blt _0808B162
_0808B188:
	ldr r0, _0808B20C @ =gBg2Tm
	ldr r1, _0808B210 @ =0x0200D4F0
	adds r2, r6, r1
	adds r1, r3, #0
	adds r1, #0xa8
	movs r4, #1
	lsls r1, r1, #1
	adds r1, r1, r0
_0808B198:
	ldrh r0, [r2]
	strh r0, [r1]
	adds r2, #0x40
	adds r1, #0x40
	subs r4, #1
	cmp r4, #0
	bge _0808B198
	mov r3, sb
	cmp r3, #0x13
	ble _0808B112
	movs r0, #5
	bl EnableBgSync
	ldr r2, [sp, #0xc]
	ldrb r2, [r2]
	cmp r2, #0x13
	bls _0808B26C
	ldr r1, [sp, #8]
	ldrb r0, [r1]
	mov r2, sl
	strb r0, [r2]
	ldr r0, _0808B214 @ =gBg2Tm + 0x150
	movs r1, #0x16
	movs r2, #1
	movs r3, #0
	bl TmFillRect_thm
	ldr r0, _0808B218 @ =gBg0Tm + 0x10
	movs r1, #0x16
	movs r2, #0x1f
	movs r3, #0
	bl TmFillRect_thm
	adds r4, r5, #0
	adds r4, #0x32
	adds r6, r5, #0
	adds r6, #0x2e
	ldr r1, _0808B21C @ =0x0200E66C
	movs r2, #0xff
	adds r0, r1, #0
	adds r0, #0x4c
_0808B1EA:
	str r2, [r0]
	subs r0, #4
	cmp r0, r1
	bge _0808B1EA
	bl ClearIcons
	ldrb r0, [r4]
	bl sub_8089638
	ldrh r0, [r5, #0x3e]
	lsrs r4, r0, #4
	adds r0, r4, #6
	b _0808B23C
	.align 2, 0
_0808B204: .4byte gBg0Tm
_0808B208: .4byte 0x0200CCF0
_0808B20C: .4byte gBg2Tm
_0808B210: .4byte 0x0200D4F0
_0808B214: .4byte gBg2Tm + 0x150
_0808B218: .4byte gBg0Tm + 0x10
_0808B21C: .4byte 0x0200E66C
_0808B220:
	lsls r1, r4, #0x18
	lsrs r1, r1, #0x18
	mov r2, sl
	ldrb r3, [r2]
	movs r0, #0
	str r0, [sp]
	adds r0, r5, #0
	ldr r2, _0808B27C @ =0x0200CCF0
	bl sub_808B654
	adds r4, #1
	ldrh r1, [r5, #0x3e]
	lsrs r0, r1, #4
	adds r0, #6
_0808B23C:
	cmp r4, r0
	bge _0808B248
	ldr r0, _0808B280 @ =0x0200E668
	ldrb r0, [r0]
	cmp r4, r0
	blt _0808B220
_0808B248:
	ldr r0, _0808B284 @ =0x0200D4F0
	mov r2, sl
	ldrb r1, [r2]
	bl sub_808B520
	ldrb r0, [r6]
	mov r2, sl
	ldrb r1, [r2]
	movs r2, #0
	bl sub_808B5E4
	movs r0, #0
	ldr r1, [sp, #0xc]
	strb r0, [r1]
	strh r0, [r5, #0x3c]
	adds r0, r5, #0
	bl Proc_Break
_0808B26C:
	add sp, #0x10
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0808B27C: .4byte 0x0200CCF0
_0808B280: .4byte 0x0200E668
_0808B284: .4byte 0x0200D4F0

	thumb_func_start sub_808B288
sub_808B288: @ 0x0808B288
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x10
	mov r8, r0
	mov r2, r8
	adds r2, #0x38
	ldr r0, _0808B370 @ =gUnk_08D8B9BA
	mov r1, r8
	ldrh r1, [r1, #0x3c]
	adds r0, r1, r0
	ldrb r3, [r2]
	ldrb r0, [r0]
	adds r0, r3, r0
	strb r0, [r2]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x14
	bls _0808B2B6
	movs r0, #0x14
	strb r0, [r2]
_0808B2B6:
	mov r5, r8
	ldrh r0, [r5, #0x3c]
	adds r0, #1
	strh r0, [r5, #0x3c]
	mov r0, r8
	adds r0, #0x36
	mov r1, r8
	adds r1, #0x37
	ldrb r0, [r0]
	ldrb r1, [r1]
	cmp r0, r1
	bls _0808B384
	movs r5, #0
	str r2, [sp]
	ldrb r6, [r2]
	cmp r5, r6
	blt _0808B2DA
	b _0808B41C
_0808B2DA:
	str r2, [sp, #8]
_0808B2DC:
	mov r7, r8
	ldrh r7, [r7, #0x3e]
	lsrs r4, r7, #3
	adds r0, r4, #0
	adds r0, #0xc
	adds r6, r5, #0
	adds r6, #0x1c
	movs r1, #8
	adds r1, r1, r5
	mov ip, r1
	adds r5, #1
	mov sl, r5
	cmp r4, r0
	bge _0808B336
	str r6, [sp, #4]
	lsls r1, r1, #1
	str r1, [sp, #0xc]
	movs r2, #0x1f
	mov sb, r2
_0808B302:
	adds r3, r4, #0
	mov r5, sb
	ands r3, r5
	lsls r1, r3, #5
	ldr r2, [sp, #4]
	ldr r7, [sp, #8]
	ldrb r7, [r7]
	subs r0, r2, r7
	adds r1, r1, r0
	lsls r1, r1, #1
	ldr r0, _0808B374 @ =gBg0Tm
	adds r1, r1, r0
	lsls r0, r3, #6
	ldr r2, [sp, #0xc]
	adds r0, r2, r0
	ldr r3, _0808B378 @ =0x0200CCF0
	adds r0, r0, r3
	ldrh r0, [r0]
	strh r0, [r1]
	adds r4, #1
	mov r5, r8
	ldrh r5, [r5, #0x3e]
	lsrs r0, r5, #3
	adds r0, #0xc
	cmp r4, r0
	blt _0808B302
_0808B336:
	ldr r7, _0808B37C @ =gBg2Tm
	mov sb, r7
	adds r5, r6, #0
	mov r1, ip
	lsls r0, r1, #1
	ldr r3, _0808B380 @ =0x0200D4F0
	adds r2, r0, r3
	movs r3, #0xa0
	movs r4, #1
_0808B348:
	ldr r6, [sp, #8]
	ldrb r6, [r6]
	subs r0, r5, r6
	adds r0, r3, r0
	lsls r0, r0, #1
	add r0, sb
	ldrh r1, [r2]
	strh r1, [r0]
	adds r2, #0x40
	adds r3, #0x20
	subs r4, #1
	cmp r4, #0
	bge _0808B348
	mov r5, sl
	ldr r7, [sp, #8]
	ldrb r7, [r7]
	cmp r5, r7
	blt _0808B2DC
	b _0808B41C
	.align 2, 0
_0808B370: .4byte gUnk_08D8B9BA
_0808B374: .4byte gBg0Tm
_0808B378: .4byte 0x0200CCF0
_0808B37C: .4byte gBg2Tm
_0808B380: .4byte 0x0200D4F0
_0808B384:
	movs r5, #0
	str r2, [sp]
	ldrb r0, [r2]
	cmp r5, r0
	bge _0808B41C
	str r2, [sp, #8]
_0808B390:
	mov r1, r8
	ldrh r1, [r1, #0x3e]
	lsrs r4, r1, #3
	adds r0, r4, #0
	adds r0, #0xc
	adds r6, r5, #0
	adds r6, #0x1c
	adds r2, r5, #1
	mov sl, r2
	cmp r4, r0
	bge _0808B3E6
	mov ip, r6
	movs r3, #0x1f
	mov sb, r3
_0808B3AC:
	adds r3, r4, #0
	mov r7, sb
	ands r3, r7
	lsls r2, r3, #5
	adds r2, #8
	adds r2, r2, r5
	lsls r2, r2, #1
	ldr r0, _0808B440 @ =gBg0Tm
	adds r2, r2, r0
	str r2, [sp, #0xc]
	mov r2, ip
	ldr r1, [sp, #8]
	ldrb r1, [r1]
	subs r0, r2, r1
	lsls r0, r0, #1
	lsls r1, r3, #6
	adds r0, r0, r1
	ldr r2, _0808B444 @ =0x0200CCF0
	adds r0, r0, r2
	ldrh r0, [r0]
	ldr r3, [sp, #0xc]
	strh r0, [r3]
	adds r4, #1
	mov r7, r8
	ldrh r7, [r7, #0x3e]
	lsrs r0, r7, #3
	adds r0, #0xc
	cmp r4, r0
	blt _0808B3AC
_0808B3E6:
	movs r4, #0
	ldr r0, _0808B448 @ =0x0200D4F0
	mov ip, r0
	adds r3, r6, #0
	adds r0, r5, #0
	adds r0, #0xa8
	lsls r0, r0, #1
	ldr r1, _0808B44C @ =gBg2Tm
	adds r2, r0, r1
_0808B3F8:
	ldr r5, [sp, #8]
	ldrb r5, [r5]
	subs r0, r3, r5
	lsls r0, r0, #1
	lsls r1, r4, #6
	adds r0, r0, r1
	add r0, ip
	ldrh r0, [r0]
	strh r0, [r2]
	adds r2, #0x40
	adds r4, #1
	cmp r4, #1
	ble _0808B3F8
	mov r5, sl
	ldr r6, [sp, #8]
	ldrb r6, [r6]
	cmp r5, r6
	blt _0808B390
_0808B41C:
	movs r0, #5
	bl EnableBgSync
	ldr r7, [sp]
	ldrb r7, [r7]
	cmp r7, #0x13
	bls _0808B430
	mov r0, r8
	bl Proc_Break
_0808B430:
	add sp, #0x10
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0808B440: .4byte gBg0Tm
_0808B444: .4byte 0x0200CCF0
_0808B448: .4byte 0x0200D4F0
_0808B44C: .4byte gBg2Tm

	thumb_func_start sub_808B450
sub_808B450: @ 0x0808B450
	push {lr}
	ldr r0, _0808B464 @ =gUnk_08D8B71C
	movs r1, #3
	bl Proc_Start
	adds r0, #0x39
	movs r1, #0
	strb r1, [r0]
	pop {r0}
	bx r0
	.align 2, 0
_0808B464: .4byte gUnk_08D8B71C

	thumb_func_start sub_808B468
sub_808B468: @ 0x0808B468
	push {r4, lr}
	adds r1, r0, #0
	cmp r1, #0
	bne _0808B480
	ldr r0, _0808B47C @ =gUnk_08D8B82C
	movs r1, #3
	bl Proc_Start
	b _0808B486
	.align 2, 0
_0808B47C: .4byte gUnk_08D8B82C
_0808B480:
	ldr r0, _0808B4A4 @ =gUnk_08D8B82C
	bl Proc_StartBlocking
_0808B486:
	adds r4, r0, #0
	adds r1, r4, #0
	adds r1, #0x39
	movs r0, #1
	strb r0, [r1]
	bl CheckInLinkArena
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne _0808B4A8
	adds r1, r4, #0
	adds r1, #0x3a
	movs r0, #5
	b _0808B4B0
	.align 2, 0
_0808B4A4: .4byte gUnk_08D8B82C
_0808B4A8:
	bl sub_800EFB8
	adds r1, r4, #0
	adds r1, #0x3a
_0808B4B0:
	strb r0, [r1]
	adds r1, r4, #0
	adds r1, #0x3b
	movs r0, #0
	strb r0, [r1]
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_808B4C0
sub_808B4C0: @ 0x0808B4C0
	push {lr}
	adds r1, r0, #0
	cmp r1, #0
	bne _0808B4D8
	ldr r0, _0808B4D4 @ =gUnk_08D8B8F4
	movs r1, #3
	bl Proc_Start
	b _0808B4DE
	.align 2, 0
_0808B4D4: .4byte gUnk_08D8B8F4
_0808B4D8:
	ldr r0, _0808B4EC @ =gUnk_08D8B8F4
	bl Proc_StartBlocking
_0808B4DE:
	adds r1, r0, #0
	adds r1, #0x39
	movs r0, #3
	strb r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_0808B4EC: .4byte gUnk_08D8B8F4

	thumb_func_start sub_808B4F0
sub_808B4F0: @ 0x0808B4F0
	push {lr}
	adds r1, r0, #0
	cmp r1, #0
	bne _0808B508
	ldr r0, _0808B504 @ =gUnk_08D8B82C
	movs r1, #3
	bl Proc_Start
	b _0808B50E
	.align 2, 0
_0808B504: .4byte gUnk_08D8B82C
_0808B508:
	ldr r0, _0808B51C @ =gUnk_08D8B82C
	bl Proc_StartBlocking
_0808B50E:
	adds r1, r0, #0
	adds r1, #0x39
	movs r0, #4
	strb r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_0808B51C: .4byte gUnk_08D8B82C

	thumb_func_start sub_808B520
sub_808B520: @ 0x0808B520
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	adds r7, r0, #0
	lsls r1, r1, #0x18
	lsrs r4, r1, #0x18
	adds r6, r7, #0
	adds r6, #0x12
	adds r0, r6, #0
	movs r1, #0x13
	movs r2, #1
	movs r3, #0
	bl TmFillRect_thm
	ldr r0, _0808B568 @ =0x0200D658
	mov r8, r0
	bl ClearText
	cmp r4, #5
	bne _0808B56C
	movs r5, #0
	adds r4, r6, #0
_0808B54E:
	adds r1, r5, #0
	adds r1, #0x70
	adds r0, r4, #0
	movs r2, #0xa0
	lsls r2, r2, #7
	bl PutIcon
	adds r4, #4
	adds r5, #1
	cmp r5, #7
	ble _0808B54E
	b _0808B5CA
	.align 2, 0
_0808B568: .4byte 0x0200D658
_0808B56C:
	movs r5, #1
	ldr r3, _0808B5DC @ =gUnk_08D8BB00
	lsls r0, r4, #3
	adds r0, r0, r4
	lsls r1, r0, #4
	adds r2, r1, #0
	adds r2, #0x10
	adds r0, r2, r3
	ldrb r0, [r0, #8]
	adds r7, #0x10
	mov sb, r7
	cmp r0, #0
	beq _0808B5C2
	mov r7, r8
	mov r8, r3
	adds r0, r1, r3
	adds r4, r0, #0
	adds r4, #0x10
	adds r6, r2, #0
_0808B592:
	ldrb r1, [r4, #8]
	subs r1, #0x40
	adds r0, r7, #0
	bl Text_SetCursor
	adds r0, r7, #0
	movs r1, #0
	bl Text_SetColor
	mov r0, r8
	adds r0, #4
	adds r0, r6, r0
	ldr r1, [r0]
	adds r0, r7, #0
	bl Text_DrawString
	adds r4, #0x10
	adds r6, #0x10
	adds r5, #1
	cmp r5, #8
	bgt _0808B5C2
	ldrb r0, [r4, #8]
	cmp r0, #0
	bne _0808B592
_0808B5C2:
	ldr r0, _0808B5E0 @ =0x0200D658
	mov r1, sb
	bl PutText
_0808B5CA:
	movs r0, #4
	bl EnableBgSync
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0808B5DC: .4byte gUnk_08D8BB00
_0808B5E0: .4byte 0x0200D658

	thumb_func_start sub_808B5E4
sub_808B5E4: @ 0x0808B5E4
	push {r4, r5, r6, r7, lr}
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r5, r1, #0x18
	lsls r2, r2, #0x18
	lsrs r7, r2, #0x18
	cmp r5, #0
	beq _0808B620
	ldr r4, _0808B61C @ =gBg2Tm + 0x74
	adds r0, r4, #0
	movs r1, #2
	adds r2, r5, #0
	bl PutNumber
	adds r0, r4, #2
	movs r1, #0
	movs r2, #0x16
	bl PutSpecialChar
	adds r4, #4
	adds r0, r4, #0
	movs r1, #2
	adds r2, r6, #0
	bl PutNumber
	b _0808B632
	.align 2, 0
_0808B61C: .4byte gBg2Tm + 0x74
_0808B620:
	ldr r0, _0808B64C @ =gBg1Tm + 0x32
	movs r1, #6
	movs r2, #3
	movs r3, #0
	bl TmFillRect_thm
	movs r0, #2
	bl EnableBgSync
_0808B632:
	cmp r7, #0
	beq _0808B63E
	ldr r0, _0808B650 @ =gBg2Tm + 0x140
	adds r1, r5, #0
	bl sub_808B520
_0808B63E:
	movs r0, #4
	bl EnableBgSync
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0808B64C: .4byte gBg1Tm + 0x32
_0808B650: .4byte gBg2Tm + 0x140

	thumb_func_start sub_808B654
sub_808B654: @ 0x0808B654
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x58
	str r0, [sp, #0x24]
	mov sl, r2
	ldr r4, [sp, #0x78]
	lsls r1, r1, #0x18
	lsrs r7, r1, #0x18
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	str r3, [sp, #0x28]
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	adds r0, r7, #0
	movs r1, #7
	bl __umodsi3
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp, #0x2c]
	lsls r0, r7, #1
	str r0, [sp, #0x30]
	movs r0, #0x1f
	ldr r1, [sp, #0x30]
	ands r1, r0
	str r1, [sp, #0x30]
	ldr r1, _0808B6F0 @ =0x0200CBF0
	lsls r0, r7, #2
	adds r6, r0, r1
	ldr r0, [r6]
	ldr r0, [r0]
	ldr r0, [r0, #0xc]
	movs r1, #8
	ands r0, r1
	rsbs r0, r0, #0
	lsrs r0, r0, #0x1f
	mov sb, r0
	cmp r4, #0
	beq _0808B72E
	ldr r2, [sp, #0x2c]
	lsls r4, r2, #3
	ldr r0, _0808B6F4 @ =0x0200D570
	adds r5, r4, r0
	adds r0, r5, #0
	bl ClearText
	adds r0, r5, #0
	movs r1, #0
	bl Text_SetCursor
	bl CheckInLinkArena
	lsls r0, r0, #0x18
	mov r8, r4
	cmp r0, #0
	bne _0808B6F8
	ldr r0, [sp, #0x24]
	adds r0, #0x39
	ldrb r0, [r0]
	cmp r0, #1
	bne _0808B6F8
	ldr r0, [r6]
	ldr r0, [r0]
	ldr r0, [r0]
	ldrb r0, [r0, #4]
	bl sub_808E6A4
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0808B6F8
	adds r0, r5, #0
	movs r1, #4
	bl Text_SetColor
	b _0808B702
	.align 2, 0
_0808B6F0: .4byte 0x0200CBF0
_0808B6F4: .4byte 0x0200D570
_0808B6F8:
	ldr r0, _0808B778 @ =0x0200D570
	add r0, r8
	mov r1, sb
	bl Text_SetColor
_0808B702:
	ldr r4, _0808B778 @ =0x0200D570
	add r4, r8
	ldr r1, _0808B77C @ =0x0200CBF0
	lsls r0, r7, #2
	adds r0, r0, r1
	ldr r0, [r0]
	ldr r0, [r0]
	ldr r0, [r0]
	ldrh r0, [r0]
	bl DecodeMsg
	adds r1, r0, #0
	adds r0, r4, #0
	bl Text_DrawString
	ldr r3, [sp, #0x30]
	lsls r1, r3, #6
	add r1, sl
	adds r1, #6
	adds r0, r4, #0
	bl PutText
_0808B72E:
	ldr r4, [sp, #0x2c]
	lsls r5, r4, #1
	adds r0, r5, r4
	lsls r0, r0, #3
	mov r8, r0
	ldr r6, _0808B780 @ =0x0200D5A8
	adds r0, r0, r6
	bl ClearText
	adds r0, r6, #0
	adds r0, #8
	add r0, r8
	bl ClearText
	ldr r0, [sp, #0x30]
	lsls r4, r0, #6
	mov r1, sl
	adds r1, r1, r4
	str r1, [sp, #0x34]
	adds r0, r1, #0
	adds r0, #0x10
	movs r1, #0x18
	movs r2, #1
	movs r3, #0
	bl TmFillRect_thm
	str r4, [sp, #0x54]
	str r5, [sp, #0x50]
	ldr r2, [sp, #0x28]
	cmp r2, #5
	bls _0808B76E
	b _0808BD8C
_0808B76E:
	lsls r0, r2, #2
	ldr r1, _0808B784 @ =_0808B788
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0808B778: .4byte 0x0200D570
_0808B77C: .4byte 0x0200CBF0
_0808B780: .4byte 0x0200D5A8
_0808B784: .4byte _0808B788
_0808B788: @ jump table
	.4byte _0808B7A0 @ case 0
	.4byte _0808B910 @ case 1
	.4byte _0808B9D4 @ case 2
	.4byte _0808BAF2 @ case 3
	.4byte _0808BC00 @ case 4
	.4byte _0808BD2C @ case 5
_0808B7A0:
	ldr r0, _0808B810 @ =0x0200CBF0
	lsls r6, r7, #2
	adds r0, r0, r6
	mov r8, r0
	ldr r0, [r0]
	ldr r0, [r0]
	ldr r0, [r0, #4]
	ldrh r0, [r0]
	bl DecodeMsg
	adds r2, r0, #0
	ldr r3, [sp, #0x50]
	ldr r4, [sp, #0x2c]
	adds r5, r3, r4
	lsls r5, r5, #3
	ldr r4, _0808B814 @ =0x0200D5A8
	adds r0, r5, r4
	ldr r7, [sp, #0x54]
	add r7, sl
	adds r1, r7, #0
	adds r1, #0x10
	movs r3, #0
	str r3, [sp]
	str r2, [sp, #4]
	movs r2, #0
	bl PutDrawText
	adds r4, #8
	adds r5, r5, r4
	mov r4, sb
	adds r0, r5, #0
	adds r1, r4, #0
	bl Text_SetColor
	mov r1, r8
	ldr r0, [r1]
	ldr r0, [r0]
	bl GetUnitEquippedWeapon
	lsls r0, r0, #0x10
	str r6, [sp, #0x4c]
	cmp r0, #0
	bne _0808B81C
	adds r1, r7, #0
	adds r1, #0x22
	movs r2, #0
	str r2, [sp]
	ldr r0, _0808B818 @ =gUnk_0842CE1C
	str r0, [sp, #4]
	adds r0, r5, #0
	adds r2, r4, #0
	movs r3, #0
	bl PutDrawText
	b _0808B87A
	.align 2, 0
_0808B810: .4byte 0x0200CBF0
_0808B814: .4byte 0x0200D5A8
_0808B818: .4byte gUnk_0842CE1C
_0808B81C:
	mov r3, r8
	ldr r0, [r3]
	ldr r0, [r0]
	bl GetUnitEquippedWeapon
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl GetItemName
	adds r1, r7, #0
	adds r1, #0x22
	movs r6, #0
	str r6, [sp]
	str r0, [sp, #4]
	adds r0, r5, #0
	adds r2, r4, #0
	movs r3, #0
	bl PutDrawText
	adds r4, r7, #0
	adds r4, #0x1e
	mov r1, r8
	ldr r0, [r1]
	ldr r0, [r0]
	bl GetUnitEquippedWeapon
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl sub_8017808
	adds r1, r0, #0
	movs r2, #0x80
	lsls r2, r2, #7
	adds r0, r4, #0
	bl PutIcon
	mov r2, r8
	ldr r0, [r2]
	ldr r0, [r0]
	bl GetUnitEquippedWeapon
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl sub_8017808
	bl sub_80896EC
_0808B87A:
	ldr r3, [sp, #0x50]
	ldr r4, [sp, #0x2c]
	adds r0, r3, r4
	lsls r0, r0, #3
	ldr r1, _0808B8B0 @ =0x0200D5B8
	adds r5, r0, r1
	adds r0, r5, #0
	bl ClearText
	ldr r0, _0808B8B4 @ =0x0200CBF0
	ldr r6, [sp, #0x4c]
	adds r0, r6, r0
	ldr r0, [r0]
	ldr r0, [r0]
	ldr r4, [r0, #0xc]
	movs r0, #0xc0
	lsls r0, r0, #8
	ands r4, r0
	movs r0, #0x80
	lsls r0, r0, #7
	cmp r4, r0
	beq _0808B8C2
	cmp r4, r0
	bhi _0808B8B8
	cmp r4, #0
	beq _0808B8F4
	b _0808BEF4
	.align 2, 0
_0808B8B0: .4byte 0x0200D5B8
_0808B8B4: .4byte 0x0200CBF0
_0808B8B8:
	movs r0, #0x80
	lsls r0, r0, #8
	cmp r4, r0
	beq _0808B8D4
	b _0808BEF4
_0808B8C2:
	ldr r1, [sp, #0x54]
	add r1, sl
	adds r1, #0x30
	movs r0, #0
	str r0, [sp]
	ldr r0, _0808B8D0 @ =gUnk_0842CE28
	b _0808B8E0
	.align 2, 0
_0808B8D0: .4byte gUnk_0842CE28
_0808B8D4:
	ldr r1, [sp, #0x54]
	add r1, sl
	adds r1, #0x30
	movs r0, #0
	str r0, [sp]
	ldr r0, _0808B8F0 @ =gUnk_0842CE2C
_0808B8E0:
	str r0, [sp, #4]
	adds r0, r5, #0
	movs r2, #4
	movs r3, #8
	bl PutDrawText
	b _0808BEF4
	.align 2, 0
_0808B8F0: .4byte gUnk_0842CE2C
_0808B8F4:
	ldr r1, [sp, #0x54]
	add r1, sl
	adds r1, #0x30
	str r4, [sp]
	ldr r0, _0808B90C @ =gUnk_0842CE30
	str r0, [sp, #4]
	adds r0, r5, #0
	movs r2, #1
	movs r3, #4
	bl PutDrawText
	b _0808BEF4
	.align 2, 0
_0808B90C: .4byte gUnk_0842CE30
_0808B910:
	ldr r1, _0808B9CC @ =0x0200CBF0
	lsls r0, r7, #2
	adds r6, r0, r1
	ldr r0, [r6]
	ldr r0, [r0]
	ldr r0, [r0, #4]
	ldrh r0, [r0]
	bl DecodeMsg
	adds r3, r0, #0
	ldr r1, [sp, #0x50]
	ldr r2, [sp, #0x2c]
	adds r0, r1, r2
	lsls r0, r0, #3
	ldr r1, _0808B9D0 @ =0x0200D5A8
	adds r0, r0, r1
	ldr r4, [sp, #0x54]
	add r4, sl
	adds r1, r4, #0
	adds r1, #0x10
	mov r8, sb
	movs r2, #0
	str r2, [sp]
	str r3, [sp, #4]
	mov r2, r8
	movs r3, #0
	bl PutDrawText
	adds r3, r4, #0
	adds r3, #0x22
	movs r1, #2
	mov r0, sb
	cmp r0, #0
	beq _0808B956
	movs r1, #1
_0808B956:
	ldr r0, [r6]
	ldr r0, [r0]
	movs r2, #8
	ldrsb r2, [r0, r2]
	adds r0, r3, #0
	bl PutNumberOrBlank
	adds r3, r4, #0
	adds r3, #0x28
	movs r1, #2
	mov r2, sb
	cmp r2, #0
	beq _0808B972
	movs r1, #1
_0808B972:
	ldr r0, [r6]
	ldr r0, [r0]
	ldrb r2, [r0, #9]
	adds r0, r3, #0
	bl PutNumberOrBlank
	adds r5, r4, #0
	adds r5, #0x2e
	movs r7, #2
	mov r3, sb
	cmp r3, #0
	beq _0808B98C
	movs r7, #1
_0808B98C:
	ldr r0, [r6]
	ldr r0, [r0]
	bl GetUnitCurrentHp
	adds r2, r0, #0
	adds r0, r5, #0
	adds r1, r7, #0
	bl PutNumberOrBlank
	adds r0, r4, #0
	adds r0, #0x30
	mov r1, r8
	movs r2, #0x16
	bl PutSpecialChar
	adds r4, #0x34
	movs r5, #2
	mov r0, sb
	cmp r0, #0
	beq _0808B9B6
	movs r5, #1
_0808B9B6:
	ldr r0, [r6]
	ldr r0, [r0]
	bl GetUnitMaxHp
	adds r2, r0, #0
	adds r0, r4, #0
	adds r1, r5, #0
	bl PutNumberOrBlank
	b _0808BEF4
	.align 2, 0
_0808B9CC: .4byte 0x0200CBF0
_0808B9D0: .4byte 0x0200D5A8
_0808B9D4:
	ldr r5, [sp, #0x54]
	add r5, sl
	movs r1, #0x12
	adds r1, r1, r5
	mov r8, r1
	ldr r1, _0808BAE0 @ =0x0200CBF0
	lsls r0, r7, #2
	adds r4, r0, r1
	ldr r0, [r4]
	ldr r1, [r0]
	ldr r0, [r1, #4]
	movs r6, #2
	ldrb r0, [r0, #0x14]
	ldrb r2, [r1, #0x14]
	cmp r0, r2
	bne _0808B9F6
	movs r6, #4
_0808B9F6:
	adds r0, r1, #0
	bl GetUnitPower
	adds r2, r0, #0
	mov r0, r8
	adds r1, r6, #0
	bl PutNumberOrBlank
	adds r7, r5, #0
	adds r7, #0x18
	ldr r0, [r4]
	ldr r1, [r0]
	ldr r0, [r1, #4]
	movs r6, #2
	ldrb r0, [r0, #0x15]
	ldrb r3, [r1, #0x15]
	cmp r0, r3
	bne _0808BA1C
	movs r6, #4
_0808BA1C:
	adds r0, r1, #0
	bl GetUnitSkill
	adds r2, r0, #0
	adds r0, r7, #0
	adds r1, r6, #0
	bl PutNumberOrBlank
	adds r7, r5, #0
	adds r7, #0x1e
	ldr r0, [r4]
	ldr r1, [r0]
	ldr r0, [r1, #4]
	movs r6, #2
	ldrb r0, [r0, #0x16]
	ldrb r2, [r1, #0x16]
	cmp r0, r2
	bne _0808BA42
	movs r6, #4
_0808BA42:
	adds r0, r1, #0
	bl GetUnitSpeed
	adds r2, r0, #0
	adds r0, r7, #0
	adds r1, r6, #0
	bl PutNumberOrBlank
	adds r7, r5, #0
	adds r7, #0x24
	ldr r0, [r4]
	ldr r0, [r0]
	movs r6, #2
	ldrb r3, [r0, #0x19]
	cmp r3, #0x1e
	bne _0808BA64
	movs r6, #4
_0808BA64:
	bl GetUnitLuck
	adds r2, r0, #0
	adds r0, r7, #0
	adds r1, r6, #0
	bl PutNumberOrBlank
	adds r7, r5, #0
	adds r7, #0x2a
	ldr r0, [r4]
	ldr r1, [r0]
	ldr r0, [r1, #4]
	movs r6, #2
	ldrb r0, [r0, #0x17]
	ldrb r2, [r1, #0x17]
	cmp r0, r2
	bne _0808BA88
	movs r6, #4
_0808BA88:
	adds r0, r1, #0
	bl GetUnitDefense
	adds r2, r0, #0
	adds r0, r7, #0
	adds r1, r6, #0
	bl PutNumberOrBlank
	adds r7, r5, #0
	adds r7, #0x30
	ldr r0, [r4]
	ldr r1, [r0]
	ldr r0, [r1, #4]
	movs r6, #2
	ldrb r0, [r0, #0x18]
	ldrb r3, [r1, #0x18]
	cmp r0, r3
	bne _0808BAAE
	movs r6, #4
_0808BAAE:
	adds r0, r1, #0
	bl GetUnitResistance
	adds r2, r0, #0
	adds r0, r7, #0
	adds r1, r6, #0
	bl PutNumberOrBlank
	ldr r0, [r4]
	ldr r0, [r0]
	bl GetUnitAffinityIcon
	adds r1, r0, #0
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	bne _0808BAE4
	adds r0, r5, #0
	adds r0, #0x34
	movs r1, #2
	movs r2, #0x14
	bl PutSpecialChar
	b _0808BEF4
	.align 2, 0
_0808BAE0: .4byte 0x0200CBF0
_0808BAE4:
	adds r0, r5, #0
	adds r0, #0x34
	movs r2, #0xa0
	lsls r2, r2, #7
	bl PutIcon
	b _0808BEF4
_0808BAF2:
	ldr r0, _0808BB2C @ =0x0200CBF0
	lsls r4, r7, #2
	adds r7, r4, r0
	ldr r0, [r7]
	ldr r0, [r0]
	bl GetUnitEquippedWeapon
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	str r4, [sp, #0x4c]
	cmp r3, #0
	bne _0808BB38
	ldr r4, [sp, #0x50]
	ldr r6, [sp, #0x2c]
	adds r0, r4, r6
	lsls r0, r0, #3
	ldr r1, _0808BB30 @ =0x0200D5A8
	adds r0, r0, r1
	ldr r1, [sp, #0x54]
	add r1, sl
	adds r1, #0x14
	mov r2, sb
	str r3, [sp]
	ldr r3, _0808BB34 @ =gUnk_0842CE1C
	str r3, [sp, #4]
	movs r3, #0
	bl PutDrawText
	b _0808BB9C
	.align 2, 0
_0808BB2C: .4byte 0x0200CBF0
_0808BB30: .4byte 0x0200D5A8
_0808BB34: .4byte gUnk_0842CE1C
_0808BB38:
	ldr r0, [r7]
	ldr r0, [r0]
	bl GetUnitEquippedWeapon
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl GetItemName
	adds r5, r0, #0
	ldr r1, [sp, #0x50]
	ldr r2, [sp, #0x2c]
	adds r0, r1, r2
	lsls r0, r0, #3
	ldr r1, _0808BBF8 @ =0x0200D5A8
	adds r0, r0, r1
	ldr r4, [sp, #0x54]
	add r4, sl
	adds r1, r4, #0
	adds r1, #0x14
	mov r2, sb
	movs r3, #0
	str r3, [sp]
	str r5, [sp, #4]
	bl PutDrawText
	adds r4, #0x10
	ldr r0, [r7]
	ldr r0, [r0]
	bl GetUnitEquippedWeapon
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl sub_8017808
	adds r1, r0, #0
	movs r2, #0x80
	lsls r2, r2, #7
	adds r0, r4, #0
	bl PutIcon
	ldr r0, [r7]
	ldr r0, [r0]
	bl GetUnitEquippedWeapon
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl sub_8017808
	bl sub_80896EC
_0808BB9C:
	ldr r5, [sp, #0x54]
	add r5, sl
	adds r3, r5, #0
	adds r3, #0x24
	movs r1, #2
	mov r4, sb
	cmp r4, #0
	beq _0808BBAE
	movs r1, #1
_0808BBAE:
	ldr r0, _0808BBFC @ =0x0200CBF0
	ldr r6, [sp, #0x4c]
	adds r4, r6, r0
	ldr r0, [r4]
	movs r6, #4
	ldrsh r2, [r0, r6]
	adds r0, r3, #0
	bl PutNumberOrBlank
	adds r3, r5, #0
	adds r3, #0x2c
	movs r1, #2
	mov r0, sb
	cmp r0, #0
	beq _0808BBCE
	movs r1, #1
_0808BBCE:
	ldr r0, [r4]
	movs r6, #6
	ldrsh r2, [r0, r6]
	adds r0, r3, #0
	bl PutNumberOrBlank
	adds r1, r5, #0
	adds r1, #0x34
	movs r3, #2
	mov r0, sb
	cmp r0, #0
	beq _0808BBE8
	movs r3, #1
_0808BBE8:
	ldr r0, [r4]
	movs r4, #8
	ldrsh r2, [r0, r4]
	adds r0, r1, #0
	adds r1, r3, #0
	bl PutNumberOrBlank
	b _0808BEF4
	.align 2, 0
_0808BBF8: .4byte 0x0200D5A8
_0808BBFC: .4byte 0x0200CBF0
_0808BC00:
	ldr r0, _0808BC40 @ =0x0200CBF0
	lsls r1, r7, #2
	adds r0, r1, r0
	ldr r0, [r0]
	ldr r2, [r0]
	ldr r3, [r2, #0xc]
	movs r0, #0x10
	ands r3, r0
	str r1, [sp, #0x4c]
	cmp r3, #0
	beq _0808BC48
	adds r0, r2, #0
	bl GetUnitRescueName
	adds r5, r0, #0
	ldr r6, [sp, #0x50]
	ldr r1, [sp, #0x2c]
	adds r0, r6, r1
	lsls r0, r0, #3
	ldr r1, _0808BC44 @ =0x0200D5B0
	adds r0, r0, r1
	ldr r1, [sp, #0x54]
	add r1, sl
	adds r1, #0x24
	mov r2, sb
	rsbs r4, r2, #0
	movs r3, #0
	str r3, [sp]
	str r5, [sp, #4]
	bl PutDrawText
	b _0808BC6A
	.align 2, 0
_0808BC40: .4byte 0x0200CBF0
_0808BC44: .4byte 0x0200D5B0
_0808BC48:
	ldr r4, [sp, #0x50]
	ldr r6, [sp, #0x2c]
	adds r0, r4, r6
	lsls r0, r0, #3
	ldr r1, _0808BD1C @ =0x0200D5B0
	adds r0, r0, r1
	ldr r1, [sp, #0x54]
	add r1, sl
	adds r1, #0x24
	mov r2, sb
	rsbs r4, r2, #0
	str r3, [sp]
	ldr r3, _0808BD20 @ =gUnk_0842CE38
	str r3, [sp, #4]
	movs r3, #0
	bl PutDrawText
_0808BC6A:
	mov r8, r4
	ldr r7, [sp, #0x54]
	add r7, sl
	adds r3, r7, #0
	adds r3, #0x14
	movs r1, #2
	mov r4, sb
	cmp r4, #0
	beq _0808BC7E
	movs r1, #1
_0808BC7E:
	ldr r0, _0808BD24 @ =0x0200CBF0
	ldr r6, [sp, #0x4c]
	adds r4, r6, r0
	ldr r0, [r4]
	ldr r0, [r0]
	movs r2, #0x1d
	ldrsb r2, [r0, r2]
	ldr r0, [r0, #4]
	ldrb r0, [r0, #0x12]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r2, r2, r0
	adds r0, r3, #0
	bl PutNumberOrBlank
	adds r3, r7, #0
	adds r3, #0x1a
	movs r5, #2
	mov r0, sb
	cmp r0, #0
	beq _0808BCAA
	movs r5, #1
_0808BCAA:
	ldr r0, [r4]
	ldr r1, [r0]
	ldr r0, [r1, #4]
	movs r2, #0x11
	ldrsb r2, [r0, r2]
	ldr r0, [r1]
	ldrb r0, [r0, #0x13]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r2, r2, r0
	movs r0, #0x1a
	ldrsb r0, [r1, r0]
	adds r2, r2, r0
	adds r0, r3, #0
	adds r1, r5, #0
	bl PutNumberOrBlank
	adds r5, r7, #0
	adds r5, #0x20
	movs r6, #2
	mov r1, sb
	cmp r1, #0
	beq _0808BCDA
	movs r6, #1
_0808BCDA:
	ldr r0, [r4]
	ldr r0, [r0]
	bl GetUnitAid
	adds r2, r0, #0
	adds r0, r5, #0
	adds r1, r6, #0
	bl PutNumberOrBlank
	ldr r0, [r4]
	ldr r0, [r0]
	bl GetUnitStatusName
	adds r4, r0, #0
	ldr r2, [sp, #0x50]
	ldr r3, [sp, #0x2c]
	adds r0, r2, r3
	lsls r0, r0, #3
	ldr r1, _0808BD28 @ =0x0200D5A8
	adds r0, r0, r1
	adds r1, r7, #0
	adds r1, #0x2e
	mov r6, r8
	mov r2, sb
	orrs r6, r2
	lsrs r2, r6, #0x1f
	movs r3, #0
	str r3, [sp]
	str r4, [sp, #4]
	bl PutDrawText
	b _0808BEF4
	.align 2, 0
_0808BD1C: .4byte 0x0200D5B0
_0808BD20: .4byte gUnk_0842CE38
_0808BD24: .4byte 0x0200CBF0
_0808BD28: .4byte 0x0200D5A8
_0808BD2C:
	movs r6, #0
	lsls r3, r7, #2
	ldr r0, _0808BD84 @ =0x0200CBF0
	adds r7, r3, r0
	ldr r5, [sp, #0x54]
	add r5, sl
_0808BD38:
	add r1, sp, #8
	ldr r0, _0808BD88 @ =gUnk_0842CE40
	ldm r0!, {r2, r3, r4}
	stm r1!, {r2, r3, r4}
	ldm r0!, {r2, r3, r4}
	stm r1!, {r2, r3, r4}
	ldr r0, [r0]
	str r0, [r1]
	ldr r0, [r7]
	ldr r0, [r0]
	adds r0, #0x28
	adds r0, r0, r6
	ldrb r0, [r0]
	bl GetWeaponLevelFromExp
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	lsls r0, r6, #2
	adds r0, #0x14
	adds r3, r5, r0
	movs r1, #2
	cmp r4, #6
	bne _0808BD68
	movs r1, #4
_0808BD68:
	lsls r0, r4, #2
	add r0, sp
	adds r0, #8
	ldr r2, [r0]
	adds r0, r3, #0
	bl PutSpecialChar
	adds r0, r6, #1
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	cmp r6, #7
	bls _0808BD38
	b _0808BEF4
	.align 2, 0
_0808BD84: .4byte 0x0200CBF0
_0808BD88: .4byte gUnk_0842CE40
_0808BD8C:
	ldr r1, [sp, #0x28]
	subs r1, #6
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp, #0x38]
	movs r4, #0
	str r4, [sp, #0x3c]
	ldr r1, _0808BE44 @ =0x0200CBF0
	lsls r0, r7, #2
	adds r5, r0, r1
	ldr r0, [r5]
	ldr r0, [r0]
	bl GetUnitSupporterCount
	str r0, [sp, #0x40]
	adds r0, r6, #0
	adds r0, #0x10
	add r0, r8
	bl ClearText
	movs r6, #0
	ldr r0, [sp, #0x40]
	cmp r4, r0
	bge _0808BEB2
	adds r7, r5, #0
	mov r1, r8
	str r1, [sp, #0x44]
	ldr r2, [sp, #0x34]
	str r2, [sp, #0x48]
	mov r3, sb
	rsbs r3, r3, #0
	mov r0, sb
	orrs r3, r0
	mov r8, r3
_0808BDD4:
	ldr r0, [r7]
	ldr r0, [r0]
	adds r1, r6, #0
	bl sub_8026C04
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0808BEA6
	ldr r1, [sp, #0x3c]
	ldr r2, [sp, #0x38]
	cmp r1, r2
	blo _0808BE9C
	ldr r0, [r7]
	ldr r0, [r0]
	adds r1, r6, #0
	bl GetUnitSupportUnit
	ldr r0, [r0, #0xc]
	movs r1, #8
	ands r0, r1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	cmp r5, #0
	bne _0808BE4C
	ldr r0, [r7]
	ldr r0, [r0]
	adds r1, r6, #0
	bl GetUnitSupportPid
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl GetCharacterData
	ldrh r0, [r0]
	bl DecodeMsg
	adds r2, r0, #0
	lsls r0, r4, #3
	ldr r1, _0808BE48 @ =0x0200D5A8
	adds r0, r0, r1
	ldr r3, [sp, #0x44]
	adds r0, r3, r0
	lsls r1, r4, #1
	adds r1, r1, r4
	lsls r1, r1, #2
	adds r1, #0x12
	ldr r3, [sp, #0x48]
	adds r1, r3, r1
	str r5, [sp]
	str r2, [sp, #4]
	mov r3, r8
	lsrs r2, r3, #0x1f
	movs r3, #0
	bl PutDrawText
	b _0808BE8A
	.align 2, 0
_0808BE44: .4byte 0x0200CBF0
_0808BE48: .4byte 0x0200D5A8
_0808BE4C:
	ldr r0, [r7]
	ldr r0, [r0]
	adds r1, r6, #0
	bl GetUnitSupportPid
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl GetCharacterData
	ldrh r0, [r0]
	bl DecodeMsg
	adds r3, r0, #0
	lsls r0, r4, #3
	ldr r1, _0808BE98 @ =0x0200D5A8
	adds r0, r0, r1
	ldr r1, [sp, #0x44]
	adds r0, r1, r0
	lsls r1, r4, #1
	adds r1, r1, r4
	lsls r1, r1, #2
	adds r1, #0x12
	ldr r2, [sp, #0x48]
	adds r1, r2, r1
	movs r2, #0
	str r2, [sp]
	str r3, [sp, #4]
	movs r2, #1
	movs r3, #0
	bl PutDrawText
_0808BE8A:
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #3
	beq _0808BEB2
	b _0808BEA6
	.align 2, 0
_0808BE98: .4byte 0x0200D5A8
_0808BE9C:
	ldr r0, [sp, #0x3c]
	adds r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp, #0x3c]
_0808BEA6:
	adds r0, r6, #1
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	ldr r3, [sp, #0x40]
	cmp r6, r3
	blt _0808BDD4
_0808BEB2:
	cmp r4, #2
	bhi _0808BEF4
	ldr r6, [sp, #0x50]
	ldr r1, [sp, #0x2c]
	adds r0, r6, r1
	lsls r5, r0, #3
	ldr r7, [sp, #0x54]
	add r7, sl
	mov r2, sb
	rsbs r6, r2, #0
	orrs r6, r2
_0808BEC8:
	lsls r0, r4, #3
	ldr r1, _0808BF0C @ =0x0200D5A8
	adds r0, r0, r1
	adds r0, r5, r0
	lsls r1, r4, #1
	adds r1, r1, r4
	lsls r1, r1, #2
	adds r1, #0x12
	adds r1, r7, r1
	movs r2, #0
	str r2, [sp]
	ldr r2, _0808BF10 @ =gUnk_0842CE38
	str r2, [sp, #4]
	lsrs r2, r6, #0x1f
	movs r3, #0
	bl PutDrawText
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #2
	bls _0808BEC8
_0808BEF4:
	movs r0, #1
	bl EnableBgSync
	add sp, #0x58
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0808BF0C: .4byte 0x0200D5A8
_0808BF10: .4byte gUnk_0842CE38

	thumb_func_start sub_808BF14
sub_808BF14: @ 0x0808BF14
	ldr r0, [r0, #0xc]
	movs r1, #0xc0
	lsls r1, r1, #8
	ands r0, r1
	bx lr
	.align 2, 0

	thumb_func_start sub_808BF20
sub_808BF20: @ 0x0808BF20
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x68
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r2, r1, #0x18
	movs r1, #1
	ands r2, r1
	subs r0, #1
	cmp r0, #0x1f
	bls _0808BF42
	bl _0808E330
_0808BF42:
	lsls r0, r0, #2
	ldr r1, _0808BF4C @ =_0808BF50
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0808BF4C: .4byte _0808BF50
_0808BF50: @ jump table
	.4byte _0808BFD0 @ case 0
	.4byte _0808C2D4 @ case 1
	.4byte _0808C1C8 @ case 2
	.4byte _0808C3D8 @ case 3
	.4byte _0808C4D4 @ case 4
	.4byte _0808C5DC @ case 5
	.4byte _0808C6E4 @ case 6
	.4byte _0808C7F0 @ case 7
	.4byte _0808C8F8 @ case 8
	.4byte _0808CA00 @ case 9
	.4byte _0808CB0C @ case 10
	.4byte _0808CC14 @ case 11
	.4byte _0808CF84 @ case 12
	.4byte _0808D08C @ case 13
	.4byte _0808D298 @ case 14
	.4byte _0808D38C @ case 15
	.4byte _0808D480 @ case 16
	.4byte _0808D574 @ case 17
	.4byte _0808CD1C @ case 18
	.4byte _0808CE78 @ case 19
	.4byte _0808D6A4 @ case 20
	.4byte _0808D7B0 @ case 21
	.4byte _0808D93C @ case 22
	.4byte _0808DA40 @ case 23
	.4byte _0808DB44 @ case 24
	.4byte _0808DC40 @ case 25
	.4byte _0808DD3C @ case 26
	.4byte _0808DE38 @ case 27
	.4byte _0808DF34 @ case 28
	.4byte _0808E030 @ case 29
	.4byte _0808E12C @ case 30
	.4byte _0808E224 @ case 31
_0808BFD0:
	cmp r2, #0
	bne _0808C0CC
	movs r0, #0
	str r0, [sp, #0x40]
	movs r1, #0
	ldr r3, _0808C0C4 @ =0x0200E668
	mov sl, r3
	ldrb r0, [r3]
	subs r0, #1
	cmp r2, r0
	bge _0808C046
	adds r4, r3, #0
	mov sb, r4
	ldr r6, _0808C0C8 @ =0x0200CBF0
	mov ip, r6
_0808BFEE:
	movs r2, #0
	adds r0, r1, #1
	mov r7, sb
	ldrb r7, [r7]
	subs r1, r7, r0
	adds r7, r0, #0
	cmp r2, r1
	bge _0808C038
	mov r8, ip
_0808C000:
	adds r6, r2, #1
	lsls r0, r6, #2
	mov r1, r8
	adds r5, r0, r1
	ldr r4, [r5]
	ldr r0, [r4]
	ldr r1, [r0]
	lsls r0, r2, #2
	mov r2, r8
	adds r3, r0, r2
	ldr r2, [r3]
	ldr r0, [r2]
	ldr r0, [r0]
	ldrb r1, [r1, #0xa]
	ldrb r0, [r0, #0xa]
	cmp r1, r0
	bhs _0808C02A
	str r4, [r3]
	str r2, [r5]
	movs r3, #1
	str r3, [sp, #0x40]
_0808C02A:
	lsls r0, r6, #0x18
	lsrs r2, r0, #0x18
	mov r4, sb
	ldrb r4, [r4]
	subs r0, r4, r7
	cmp r2, r0
	blt _0808C000
_0808C038:
	lsls r0, r7, #0x18
	lsrs r1, r0, #0x18
	mov r6, sl
	ldrb r0, [r6]
	subs r0, #1
	cmp r1, r0
	blt _0808BFEE
_0808C046:
	movs r1, #0
	ldr r7, _0808C0C4 @ =0x0200E668
	ldrb r0, [r7]
	subs r0, #1
	cmp r1, r0
	bge _0808C0BE
	mov sl, r7
_0808C054:
	movs r2, #0
	adds r0, r1, #1
	mov r3, sl
	ldrb r3, [r3]
	subs r1, r3, r0
	adds r7, r0, #0
	cmp r2, r1
	bge _0808C0B0
	ldr r4, _0808C0C8 @ =0x0200CBF0
	mov sb, r4
	movs r6, #2
	mov r8, r6
	mov ip, r7
_0808C06E:
	adds r0, r2, #1
	str r0, [sp, #0x60]
	lsls r0, r0, #2
	mov r1, sb
	adds r5, r0, r1
	ldr r4, [r5]
	ldr r0, [r4]
	ldr r1, [r0, #0xc]
	mov r3, r8
	ands r1, r3
	lsls r0, r2, #2
	mov r6, sb
	adds r3, r0, r6
	ldr r2, [r3]
	ldr r0, [r2]
	ldr r0, [r0, #0xc]
	mov r6, r8
	ands r0, r6
	cmp r1, r0
	bhs _0808C09E
	str r4, [r3]
	str r2, [r5]
	movs r0, #1
	str r0, [sp, #0x40]
_0808C09E:
	ldr r1, [sp, #0x60]
	lsls r0, r1, #0x18
	lsrs r2, r0, #0x18
	mov r3, sl
	ldrb r3, [r3]
	mov r4, ip
	subs r0, r3, r4
	cmp r2, r0
	blt _0808C06E
_0808C0B0:
	lsls r0, r7, #0x18
	lsrs r1, r0, #0x18
	ldr r6, _0808C0C4 @ =0x0200E668
	ldrb r0, [r6]
	subs r0, #1
	cmp r1, r0
	blt _0808C054
_0808C0BE:
	ldr r7, [sp, #0x40]
	bl _0808E29C
	.align 2, 0
_0808C0C4: .4byte 0x0200E668
_0808C0C8: .4byte 0x0200CBF0
_0808C0CC:
	movs r0, #0
	str r0, [sp, #0x44]
	movs r1, #0
	ldr r2, _0808C1C0 @ =0x0200E668
	mov sl, r2
	ldrb r0, [r2]
	subs r0, #1
	ldr r3, [sp, #0x44]
	cmp r3, r0
	bge _0808C140
	adds r4, r2, #0
	mov sb, r4
	ldr r6, _0808C1C4 @ =0x0200CBF0
	mov ip, r6
_0808C0E8:
	movs r2, #0
	adds r0, r1, #1
	mov r7, sb
	ldrb r7, [r7]
	subs r1, r7, r0
	adds r7, r0, #0
	cmp r2, r1
	bge _0808C132
	mov r8, ip
_0808C0FA:
	adds r6, r2, #1
	lsls r0, r6, #2
	mov r1, r8
	adds r5, r0, r1
	ldr r4, [r5]
	ldr r0, [r4]
	ldr r1, [r0]
	lsls r0, r2, #2
	mov r2, r8
	adds r3, r0, r2
	ldr r2, [r3]
	ldr r0, [r2]
	ldr r0, [r0]
	ldrb r1, [r1, #0xa]
	ldrb r0, [r0, #0xa]
	cmp r1, r0
	bls _0808C124
	str r4, [r3]
	str r2, [r5]
	movs r3, #1
	str r3, [sp, #0x44]
_0808C124:
	lsls r0, r6, #0x18
	lsrs r2, r0, #0x18
	mov r4, sb
	ldrb r4, [r4]
	subs r0, r4, r7
	cmp r2, r0
	blt _0808C0FA
_0808C132:
	lsls r0, r7, #0x18
	lsrs r1, r0, #0x18
	mov r6, sl
	ldrb r0, [r6]
	subs r0, #1
	cmp r1, r0
	blt _0808C0E8
_0808C140:
	movs r1, #0
	ldr r7, _0808C1C0 @ =0x0200E668
	ldrb r0, [r7]
	subs r0, #1
	cmp r1, r0
	bge _0808C1B8
	mov sl, r7
_0808C14E:
	movs r2, #0
	adds r0, r1, #1
	mov r3, sl
	ldrb r3, [r3]
	subs r1, r3, r0
	adds r7, r0, #0
	cmp r2, r1
	bge _0808C1AA
	ldr r4, _0808C1C4 @ =0x0200CBF0
	mov sb, r4
	movs r6, #2
	mov r8, r6
	mov ip, r7
_0808C168:
	adds r0, r2, #1
	str r0, [sp, #0x60]
	lsls r0, r0, #2
	mov r1, sb
	adds r5, r0, r1
	ldr r4, [r5]
	ldr r0, [r4]
	ldr r1, [r0, #0xc]
	mov r3, r8
	ands r1, r3
	lsls r0, r2, #2
	mov r6, sb
	adds r3, r0, r6
	ldr r2, [r3]
	ldr r0, [r2]
	ldr r0, [r0, #0xc]
	mov r6, r8
	ands r0, r6
	cmp r1, r0
	bls _0808C198
	str r4, [r3]
	str r2, [r5]
	movs r0, #1
	str r0, [sp, #0x44]
_0808C198:
	ldr r1, [sp, #0x60]
	lsls r0, r1, #0x18
	lsrs r2, r0, #0x18
	mov r3, sl
	ldrb r3, [r3]
	mov r4, ip
	subs r0, r3, r4
	cmp r2, r0
	blt _0808C168
_0808C1AA:
	lsls r0, r7, #0x18
	lsrs r1, r0, #0x18
	ldr r6, _0808C1C0 @ =0x0200E668
	ldrb r0, [r6]
	subs r0, #1
	cmp r1, r0
	blt _0808C14E
_0808C1B8:
	ldr r7, [sp, #0x44]
	bl _0808E29C
	.align 2, 0
_0808C1C0: .4byte 0x0200E668
_0808C1C4: .4byte 0x0200CBF0
_0808C1C8:
	cmp r2, #0
	bne _0808C250
	movs r0, #0
	mov sl, r0
	movs r1, #0
	ldr r3, _0808C248 @ =0x0200E668
	mov ip, r3
	ldrb r0, [r3]
	subs r0, #1
	cmp r2, r0
	blt _0808C1E2
	bl _0808E31E
_0808C1E2:
	adds r4, r3, #0
	mov sb, r4
_0808C1E6:
	movs r2, #0
	adds r0, r1, #1
	mov r6, sb
	ldrb r6, [r6]
	subs r1, r6, r0
	adds r7, r0, #0
	cmp r2, r1
	bge _0808C236
	ldr r0, _0808C24C @ =0x0200CBF0
	mov r8, r0
_0808C1FA:
	adds r6, r2, #1
	lsls r0, r6, #2
	mov r1, r8
	adds r5, r0, r1
	ldr r4, [r5]
	ldr r1, [r4]
	lsls r0, r2, #2
	mov r3, r8
	adds r2, r0, r3
	ldr r3, [r2]
	ldr r0, [r3]
	ldrb r1, [r1, #8]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	ldrb r0, [r0, #8]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r1, r0
	ble _0808C228
	str r4, [r2]
	str r3, [r5]
	movs r4, #1
	mov sl, r4
_0808C228:
	lsls r0, r6, #0x18
	lsrs r2, r0, #0x18
	mov r6, sb
	ldrb r6, [r6]
	subs r0, r6, r7
	cmp r2, r0
	blt _0808C1FA
_0808C236:
	lsls r0, r7, #0x18
	lsrs r1, r0, #0x18
	mov r7, ip
	ldrb r0, [r7]
	subs r0, #1
	cmp r1, r0
	blt _0808C1E6
	bl _0808E31E
	.align 2, 0
_0808C248: .4byte 0x0200E668
_0808C24C: .4byte 0x0200CBF0
_0808C250:
	movs r1, #0
	mov sl, r1
	ldr r2, _0808C2CC @ =0x0200E668
	mov ip, r2
	ldrb r0, [r2]
	subs r0, #1
	cmp sl, r0
	blt _0808C264
	bl _0808E31E
_0808C264:
	adds r3, r2, #0
	mov sb, r3
_0808C268:
	movs r2, #0
	adds r0, r1, #1
	mov r4, sb
	ldrb r4, [r4]
	subs r1, r4, r0
	adds r7, r0, #0
	cmp r2, r1
	bge _0808C2B8
	ldr r6, _0808C2D0 @ =0x0200CBF0
	mov r8, r6
_0808C27C:
	adds r6, r2, #1
	lsls r0, r6, #2
	mov r1, r8
	adds r5, r0, r1
	ldr r4, [r5]
	ldr r1, [r4]
	lsls r0, r2, #2
	mov r3, r8
	adds r2, r0, r3
	ldr r3, [r2]
	ldr r0, [r3]
	ldrb r1, [r1, #8]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	ldrb r0, [r0, #8]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r1, r0
	bge _0808C2AA
	str r4, [r2]
	str r3, [r5]
	movs r4, #1
	mov sl, r4
_0808C2AA:
	lsls r0, r6, #0x18
	lsrs r2, r0, #0x18
	mov r6, sb
	ldrb r6, [r6]
	subs r0, r6, r7
	cmp r2, r0
	blt _0808C27C
_0808C2B8:
	lsls r0, r7, #0x18
	lsrs r1, r0, #0x18
	mov r7, ip
	ldrb r0, [r7]
	subs r0, #1
	cmp r1, r0
	blt _0808C268
	bl _0808E31E
	.align 2, 0
_0808C2CC: .4byte 0x0200E668
_0808C2D0: .4byte 0x0200CBF0
_0808C2D4:
	cmp r2, #0
	bne _0808C358
	movs r1, #0
	mov sl, r1
	ldr r3, _0808C350 @ =0x0200E668
	mov ip, r3
	ldrb r0, [r3]
	subs r0, #1
	cmp r2, r0
	blt _0808C2EC
	bl _0808E31E
_0808C2EC:
	adds r4, r3, #0
	mov sb, r4
_0808C2F0:
	movs r2, #0
	adds r0, r1, #1
	mov r6, sb
	ldrb r6, [r6]
	subs r1, r6, r0
	adds r7, r0, #0
	cmp r2, r1
	bge _0808C33C
	ldr r0, _0808C354 @ =0x0200CBF0
	mov r8, r0
_0808C304:
	adds r6, r2, #1
	lsls r0, r6, #2
	mov r1, r8
	adds r5, r0, r1
	ldr r4, [r5]
	ldr r0, [r4]
	ldr r1, [r0, #4]
	lsls r0, r2, #2
	mov r3, r8
	adds r2, r0, r3
	ldr r3, [r2]
	ldr r0, [r3]
	ldr r0, [r0, #4]
	ldrb r1, [r1, #0xa]
	ldrb r0, [r0, #0xa]
	cmp r1, r0
	bhs _0808C32E
	str r4, [r2]
	str r3, [r5]
	movs r4, #1
	mov sl, r4
_0808C32E:
	lsls r0, r6, #0x18
	lsrs r2, r0, #0x18
	mov r6, sb
	ldrb r6, [r6]
	subs r0, r6, r7
	cmp r2, r0
	blt _0808C304
_0808C33C:
	lsls r0, r7, #0x18
	lsrs r1, r0, #0x18
	mov r7, ip
	ldrb r0, [r7]
	subs r0, #1
	cmp r1, r0
	blt _0808C2F0
	bl _0808E31E
	.align 2, 0
_0808C350: .4byte 0x0200E668
_0808C354: .4byte 0x0200CBF0
_0808C358:
	movs r1, #0
	mov sl, r1
	ldr r2, _0808C3D0 @ =0x0200E668
	mov ip, r2
	ldrb r0, [r2]
	subs r0, #1
	cmp sl, r0
	blt _0808C36C
	bl _0808E31E
_0808C36C:
	adds r3, r2, #0
	mov sb, r3
_0808C370:
	movs r2, #0
	adds r0, r1, #1
	mov r4, sb
	ldrb r4, [r4]
	subs r1, r4, r0
	adds r7, r0, #0
	cmp r2, r1
	bge _0808C3BC
	ldr r6, _0808C3D4 @ =0x0200CBF0
	mov r8, r6
_0808C384:
	adds r6, r2, #1
	lsls r0, r6, #2
	mov r1, r8
	adds r5, r0, r1
	ldr r4, [r5]
	ldr r0, [r4]
	ldr r1, [r0, #4]
	lsls r0, r2, #2
	mov r3, r8
	adds r2, r0, r3
	ldr r3, [r2]
	ldr r0, [r3]
	ldr r0, [r0, #4]
	ldrb r1, [r1, #0xa]
	ldrb r0, [r0, #0xa]
	cmp r1, r0
	bls _0808C3AE
	str r4, [r2]
	str r3, [r5]
	movs r4, #1
	mov sl, r4
_0808C3AE:
	lsls r0, r6, #0x18
	lsrs r2, r0, #0x18
	mov r6, sb
	ldrb r6, [r6]
	subs r0, r6, r7
	cmp r2, r0
	blt _0808C384
_0808C3BC:
	lsls r0, r7, #0x18
	lsrs r1, r0, #0x18
	mov r7, ip
	ldrb r0, [r7]
	subs r0, #1
	cmp r1, r0
	blt _0808C370
	bl _0808E31E
	.align 2, 0
_0808C3D0: .4byte 0x0200E668
_0808C3D4: .4byte 0x0200CBF0
_0808C3D8:
	cmp r2, #0
	bne _0808C458
	movs r1, #0
	mov sl, r1
	ldr r3, _0808C450 @ =0x0200E668
	mov ip, r3
	ldrb r0, [r3]
	subs r0, #1
	cmp r2, r0
	blt _0808C3F0
	bl _0808E31E
_0808C3F0:
	adds r4, r3, #0
	mov sb, r4
_0808C3F4:
	movs r2, #0
	adds r0, r1, #1
	mov r6, sb
	ldrb r6, [r6]
	subs r1, r6, r0
	adds r7, r0, #0
	cmp r2, r1
	bge _0808C43C
	ldr r0, _0808C454 @ =0x0200CBF0
	mov r8, r0
_0808C408:
	adds r6, r2, #1
	lsls r0, r6, #2
	mov r1, r8
	adds r5, r0, r1
	ldr r4, [r5]
	ldr r1, [r4]
	lsls r0, r2, #2
	mov r3, r8
	adds r2, r0, r3
	ldr r3, [r2]
	ldr r0, [r3]
	ldrb r1, [r1, #9]
	ldrb r0, [r0, #9]
	cmp r1, r0
	bls _0808C42E
	str r4, [r2]
	str r3, [r5]
	movs r4, #1
	mov sl, r4
_0808C42E:
	lsls r0, r6, #0x18
	lsrs r2, r0, #0x18
	mov r6, sb
	ldrb r6, [r6]
	subs r0, r6, r7
	cmp r2, r0
	blt _0808C408
_0808C43C:
	lsls r0, r7, #0x18
	lsrs r1, r0, #0x18
	mov r7, ip
	ldrb r0, [r7]
	subs r0, #1
	cmp r1, r0
	blt _0808C3F4
	bl _0808E31E
	.align 2, 0
_0808C450: .4byte 0x0200E668
_0808C454: .4byte 0x0200CBF0
_0808C458:
	movs r1, #0
	mov sl, r1
	ldr r2, _0808C4CC @ =0x0200E668
	mov ip, r2
	ldrb r0, [r2]
	subs r0, #1
	cmp sl, r0
	blt _0808C46C
	bl _0808E31E
_0808C46C:
	adds r3, r2, #0
	mov sb, r3
_0808C470:
	movs r2, #0
	adds r0, r1, #1
	mov r4, sb
	ldrb r4, [r4]
	subs r1, r4, r0
	adds r7, r0, #0
	cmp r2, r1
	bge _0808C4B8
	ldr r6, _0808C4D0 @ =0x0200CBF0
	mov r8, r6
_0808C484:
	adds r6, r2, #1
	lsls r0, r6, #2
	mov r1, r8
	adds r5, r0, r1
	ldr r4, [r5]
	ldr r1, [r4]
	lsls r0, r2, #2
	mov r3, r8
	adds r2, r0, r3
	ldr r3, [r2]
	ldr r0, [r3]
	ldrb r1, [r1, #9]
	ldrb r0, [r0, #9]
	cmp r1, r0
	bhs _0808C4AA
	str r4, [r2]
	str r3, [r5]
	movs r4, #1
	mov sl, r4
_0808C4AA:
	lsls r0, r6, #0x18
	lsrs r2, r0, #0x18
	mov r6, sb
	ldrb r6, [r6]
	subs r0, r6, r7
	cmp r2, r0
	blt _0808C484
_0808C4B8:
	lsls r0, r7, #0x18
	lsrs r1, r0, #0x18
	mov r7, ip
	ldrb r0, [r7]
	subs r0, #1
	cmp r1, r0
	blt _0808C470
	bl _0808E31E
	.align 2, 0
_0808C4CC: .4byte 0x0200E668
_0808C4D0: .4byte 0x0200CBF0
_0808C4D4:
	cmp r2, #0
	bne _0808C558
	movs r1, #0
	mov sl, r1
	ldr r3, _0808C550 @ =0x0200E668
	ldrb r0, [r3]
	subs r0, #1
	cmp r2, r0
	blt _0808C4EA
	bl _0808E20E
_0808C4EA:
	movs r5, #0
	adds r0, r1, #1
	ldrb r3, [r3]
	subs r1, r3, r0
	mov r8, r0
	cmp r5, r1
	bge _0808C53C
	ldr r2, _0808C554 @ =0x0200CBF0
	mov sb, r2
_0808C4FC:
	adds r7, r5, #1
	lsls r0, r7, #2
	mov r3, sb
	adds r6, r0, r3
	ldr r0, [r6]
	ldr r0, [r0]
	bl GetUnitCurrentHp
	adds r4, r0, #0
	lsls r0, r5, #2
	mov r1, sb
	adds r5, r0, r1
	ldr r0, [r5]
	ldr r0, [r0]
	bl GetUnitCurrentHp
	cmp r4, r0
	ble _0808C52C
	ldr r1, [r5]
	ldr r0, [r6]
	str r0, [r5]
	str r1, [r6]
	movs r2, #1
	mov sl, r2
_0808C52C:
	lsls r0, r7, #0x18
	lsrs r5, r0, #0x18
	ldr r0, _0808C550 @ =0x0200E668
	ldrb r0, [r0]
	mov r3, r8
	subs r0, r0, r3
	cmp r5, r0
	blt _0808C4FC
_0808C53C:
	mov r4, r8
	lsls r0, r4, #0x18
	lsrs r1, r0, #0x18
	ldr r3, _0808C550 @ =0x0200E668
	ldrb r0, [r3]
	subs r0, #1
	cmp r1, r0
	blt _0808C4EA
	bl _0808E20E
	.align 2, 0
_0808C550: .4byte 0x0200E668
_0808C554: .4byte 0x0200CBF0
_0808C558:
	movs r7, #0
	mov sl, r7
	movs r1, #0
	ldr r2, _0808C5D4 @ =0x0200E668
	ldrb r0, [r2]
	subs r0, #1
	cmp sl, r0
	blt _0808C56C
	bl _0808E29A
_0808C56C:
	movs r5, #0
	adds r0, r1, #1
	ldrb r2, [r2]
	subs r1, r2, r0
	mov r8, r0
	cmp r5, r1
	bge _0808C5BE
	ldr r0, _0808C5D8 @ =0x0200CBF0
	mov sb, r0
_0808C57E:
	adds r7, r5, #1
	lsls r0, r7, #2
	mov r1, sb
	adds r6, r0, r1
	ldr r0, [r6]
	ldr r0, [r0]
	bl GetUnitCurrentHp
	adds r4, r0, #0
	lsls r0, r5, #2
	mov r2, sb
	adds r5, r0, r2
	ldr r0, [r5]
	ldr r0, [r0]
	bl GetUnitCurrentHp
	cmp r4, r0
	bge _0808C5AE
	ldr r1, [r5]
	ldr r0, [r6]
	str r0, [r5]
	str r1, [r6]
	movs r3, #1
	mov sl, r3
_0808C5AE:
	lsls r0, r7, #0x18
	lsrs r5, r0, #0x18
	ldr r0, _0808C5D4 @ =0x0200E668
	ldrb r0, [r0]
	mov r4, r8
	subs r0, r0, r4
	cmp r5, r0
	blt _0808C57E
_0808C5BE:
	mov r6, r8
	lsls r0, r6, #0x18
	lsrs r1, r0, #0x18
	ldr r2, _0808C5D4 @ =0x0200E668
	ldrb r0, [r2]
	subs r0, #1
	cmp r1, r0
	blt _0808C56C
	bl _0808E29A
	.align 2, 0
_0808C5D4: .4byte 0x0200E668
_0808C5D8: .4byte 0x0200CBF0
_0808C5DC:
	cmp r2, #0
	bne _0808C664
	movs r0, #0
	mov sl, r0
	movs r1, #0
	ldr r3, _0808C65C @ =0x0200E668
	ldrb r0, [r3]
	subs r0, #1
	cmp r2, r0
	blt _0808C5F4
	bl _0808E31E
_0808C5F4:
	movs r5, #0
	adds r0, r1, #1
	ldrb r3, [r3]
	subs r1, r3, r0
	mov r8, r0
	cmp r5, r1
	bge _0808C646
	ldr r1, _0808C660 @ =0x0200CBF0
	mov sb, r1
_0808C606:
	adds r7, r5, #1
	lsls r0, r7, #2
	mov r2, sb
	adds r6, r0, r2
	ldr r0, [r6]
	ldr r0, [r0]
	bl GetUnitMaxHp
	adds r4, r0, #0
	lsls r0, r5, #2
	mov r3, sb
	adds r5, r0, r3
	ldr r0, [r5]
	ldr r0, [r0]
	bl GetUnitMaxHp
	cmp r4, r0
	ble _0808C636
	ldr r1, [r5]
	ldr r0, [r6]
	str r0, [r5]
	str r1, [r6]
	movs r4, #1
	mov sl, r4
_0808C636:
	lsls r0, r7, #0x18
	lsrs r5, r0, #0x18
	ldr r0, _0808C65C @ =0x0200E668
	ldrb r0, [r0]
	mov r6, r8
	subs r0, r0, r6
	cmp r5, r0
	blt _0808C606
_0808C646:
	mov r7, r8
	lsls r0, r7, #0x18
	lsrs r1, r0, #0x18
	ldr r3, _0808C65C @ =0x0200E668
	ldrb r0, [r3]
	subs r0, #1
	cmp r1, r0
	blt _0808C5F4
	bl _0808E31E
	.align 2, 0
_0808C65C: .4byte 0x0200E668
_0808C660: .4byte 0x0200CBF0
_0808C664:
	movs r1, #0
	mov sl, r1
	ldr r2, _0808C6DC @ =0x0200E668
	ldrb r0, [r2]
	subs r0, #1
	cmp sl, r0
	blt _0808C676
	bl _0808E20E
_0808C676:
	movs r5, #0
	adds r0, r1, #1
	ldrb r2, [r2]
	subs r1, r2, r0
	mov r8, r0
	cmp r5, r1
	bge _0808C6C8
	ldr r2, _0808C6E0 @ =0x0200CBF0
	mov sb, r2
_0808C688:
	adds r7, r5, #1
	lsls r0, r7, #2
	mov r3, sb
	adds r6, r0, r3
	ldr r0, [r6]
	ldr r0, [r0]
	bl GetUnitMaxHp
	adds r4, r0, #0
	lsls r0, r5, #2
	mov r1, sb
	adds r5, r0, r1
	ldr r0, [r5]
	ldr r0, [r0]
	bl GetUnitMaxHp
	cmp r4, r0
	bge _0808C6B8
	ldr r1, [r5]
	ldr r0, [r6]
	str r0, [r5]
	str r1, [r6]
	movs r2, #1
	mov sl, r2
_0808C6B8:
	lsls r0, r7, #0x18
	lsrs r5, r0, #0x18
	ldr r0, _0808C6DC @ =0x0200E668
	ldrb r0, [r0]
	mov r3, r8
	subs r0, r0, r3
	cmp r5, r0
	blt _0808C688
_0808C6C8:
	mov r4, r8
	lsls r0, r4, #0x18
	lsrs r1, r0, #0x18
	ldr r2, _0808C6DC @ =0x0200E668
	ldrb r0, [r2]
	subs r0, #1
	cmp r1, r0
	blt _0808C676
	bl _0808E20E
	.align 2, 0
_0808C6DC: .4byte 0x0200E668
_0808C6E0: .4byte 0x0200CBF0
_0808C6E4:
	cmp r2, #0
	bne _0808C76C
	movs r7, #0
	mov sl, r7
	movs r1, #0
	ldr r3, _0808C764 @ =0x0200E668
	ldrb r0, [r3]
	subs r0, #1
	cmp r2, r0
	blt _0808C6FC
	bl _0808E29A
_0808C6FC:
	movs r5, #0
	adds r0, r1, #1
	ldrb r3, [r3]
	subs r1, r3, r0
	mov r8, r0
	cmp r5, r1
	bge _0808C74E
	ldr r0, _0808C768 @ =0x0200CBF0
	mov sb, r0
_0808C70E:
	adds r7, r5, #1
	lsls r0, r7, #2
	mov r1, sb
	adds r6, r0, r1
	ldr r0, [r6]
	ldr r0, [r0]
	bl GetUnitPower
	adds r4, r0, #0
	lsls r0, r5, #2
	mov r2, sb
	adds r5, r0, r2
	ldr r0, [r5]
	ldr r0, [r0]
	bl GetUnitPower
	cmp r4, r0
	ble _0808C73E
	ldr r1, [r5]
	ldr r0, [r6]
	str r0, [r5]
	str r1, [r6]
	movs r3, #1
	mov sl, r3
_0808C73E:
	lsls r0, r7, #0x18
	lsrs r5, r0, #0x18
	ldr r0, _0808C764 @ =0x0200E668
	ldrb r0, [r0]
	mov r4, r8
	subs r0, r0, r4
	cmp r5, r0
	blt _0808C70E
_0808C74E:
	mov r6, r8
	lsls r0, r6, #0x18
	lsrs r1, r0, #0x18
	ldr r3, _0808C764 @ =0x0200E668
	ldrb r0, [r3]
	subs r0, #1
	cmp r1, r0
	blt _0808C6FC
	bl _0808E29A
	.align 2, 0
_0808C764: .4byte 0x0200E668
_0808C768: .4byte 0x0200CBF0
_0808C76C:
	movs r0, #0
	mov sl, r0
	movs r1, #0
	ldr r2, _0808C7E8 @ =0x0200E668
	ldrb r0, [r2]
	subs r0, #1
	cmp sl, r0
	blt _0808C780
	bl _0808E31E
_0808C780:
	movs r5, #0
	adds r0, r1, #1
	ldrb r2, [r2]
	subs r1, r2, r0
	mov r8, r0
	cmp r5, r1
	bge _0808C7D2
	ldr r1, _0808C7EC @ =0x0200CBF0
	mov sb, r1
_0808C792:
	adds r7, r5, #1
	lsls r0, r7, #2
	mov r2, sb
	adds r6, r0, r2
	ldr r0, [r6]
	ldr r0, [r0]
	bl GetUnitPower
	adds r4, r0, #0
	lsls r0, r5, #2
	mov r3, sb
	adds r5, r0, r3
	ldr r0, [r5]
	ldr r0, [r0]
	bl GetUnitPower
	cmp r4, r0
	bge _0808C7C2
	ldr r1, [r5]
	ldr r0, [r6]
	str r0, [r5]
	str r1, [r6]
	movs r4, #1
	mov sl, r4
_0808C7C2:
	lsls r0, r7, #0x18
	lsrs r5, r0, #0x18
	ldr r0, _0808C7E8 @ =0x0200E668
	ldrb r0, [r0]
	mov r6, r8
	subs r0, r0, r6
	cmp r5, r0
	blt _0808C792
_0808C7D2:
	mov r7, r8
	lsls r0, r7, #0x18
	lsrs r1, r0, #0x18
	ldr r2, _0808C7E8 @ =0x0200E668
	ldrb r0, [r2]
	subs r0, #1
	cmp r1, r0
	blt _0808C780
	bl _0808E31E
	.align 2, 0
_0808C7E8: .4byte 0x0200E668
_0808C7EC: .4byte 0x0200CBF0
_0808C7F0:
	cmp r2, #0
	bne _0808C874
	movs r1, #0
	mov sl, r1
	ldr r3, _0808C86C @ =0x0200E668
	ldrb r0, [r3]
	subs r0, #1
	cmp r2, r0
	blt _0808C806
	bl _0808E20E
_0808C806:
	movs r5, #0
	adds r0, r1, #1
	ldrb r3, [r3]
	subs r1, r3, r0
	mov r8, r0
	cmp r5, r1
	bge _0808C858
	ldr r2, _0808C870 @ =0x0200CBF0
	mov sb, r2
_0808C818:
	adds r7, r5, #1
	lsls r0, r7, #2
	mov r3, sb
	adds r6, r0, r3
	ldr r0, [r6]
	ldr r0, [r0]
	bl GetUnitSkill
	adds r4, r0, #0
	lsls r0, r5, #2
	mov r1, sb
	adds r5, r0, r1
	ldr r0, [r5]
	ldr r0, [r0]
	bl GetUnitSkill
	cmp r4, r0
	ble _0808C848
	ldr r1, [r5]
	ldr r0, [r6]
	str r0, [r5]
	str r1, [r6]
	movs r2, #1
	mov sl, r2
_0808C848:
	lsls r0, r7, #0x18
	lsrs r5, r0, #0x18
	ldr r0, _0808C86C @ =0x0200E668
	ldrb r0, [r0]
	mov r3, r8
	subs r0, r0, r3
	cmp r5, r0
	blt _0808C818
_0808C858:
	mov r4, r8
	lsls r0, r4, #0x18
	lsrs r1, r0, #0x18
	ldr r3, _0808C86C @ =0x0200E668
	ldrb r0, [r3]
	subs r0, #1
	cmp r1, r0
	blt _0808C806
	bl _0808E20E
	.align 2, 0
_0808C86C: .4byte 0x0200E668
_0808C870: .4byte 0x0200CBF0
_0808C874:
	movs r7, #0
	mov sl, r7
	movs r1, #0
	ldr r2, _0808C8F0 @ =0x0200E668
	ldrb r0, [r2]
	subs r0, #1
	cmp sl, r0
	blt _0808C888
	bl _0808E29A
_0808C888:
	movs r5, #0
	adds r0, r1, #1
	ldrb r2, [r2]
	subs r1, r2, r0
	mov r8, r0
	cmp r5, r1
	bge _0808C8DA
	ldr r0, _0808C8F4 @ =0x0200CBF0
	mov sb, r0
_0808C89A:
	adds r7, r5, #1
	lsls r0, r7, #2
	mov r1, sb
	adds r6, r0, r1
	ldr r0, [r6]
	ldr r0, [r0]
	bl GetUnitSkill
	adds r4, r0, #0
	lsls r0, r5, #2
	mov r2, sb
	adds r5, r0, r2
	ldr r0, [r5]
	ldr r0, [r0]
	bl GetUnitSkill
	cmp r4, r0
	bge _0808C8CA
	ldr r1, [r5]
	ldr r0, [r6]
	str r0, [r5]
	str r1, [r6]
	movs r3, #1
	mov sl, r3
_0808C8CA:
	lsls r0, r7, #0x18
	lsrs r5, r0, #0x18
	ldr r0, _0808C8F0 @ =0x0200E668
	ldrb r0, [r0]
	mov r4, r8
	subs r0, r0, r4
	cmp r5, r0
	blt _0808C89A
_0808C8DA:
	mov r6, r8
	lsls r0, r6, #0x18
	lsrs r1, r0, #0x18
	ldr r2, _0808C8F0 @ =0x0200E668
	ldrb r0, [r2]
	subs r0, #1
	cmp r1, r0
	blt _0808C888
	bl _0808E29A
	.align 2, 0
_0808C8F0: .4byte 0x0200E668
_0808C8F4: .4byte 0x0200CBF0
_0808C8F8:
	cmp r2, #0
	bne _0808C980
	movs r0, #0
	mov sl, r0
	movs r1, #0
	ldr r3, _0808C978 @ =0x0200E668
	ldrb r0, [r3]
	subs r0, #1
	cmp r2, r0
	blt _0808C910
	bl _0808E31E
_0808C910:
	movs r5, #0
	adds r0, r1, #1
	ldrb r3, [r3]
	subs r1, r3, r0
	mov r8, r0
	cmp r5, r1
	bge _0808C962
	ldr r1, _0808C97C @ =0x0200CBF0
	mov sb, r1
_0808C922:
	adds r7, r5, #1
	lsls r0, r7, #2
	mov r2, sb
	adds r6, r0, r2
	ldr r0, [r6]
	ldr r0, [r0]
	bl GetUnitSpeed
	adds r4, r0, #0
	lsls r0, r5, #2
	mov r3, sb
	adds r5, r0, r3
	ldr r0, [r5]
	ldr r0, [r0]
	bl GetUnitSpeed
	cmp r4, r0
	ble _0808C952
	ldr r1, [r5]
	ldr r0, [r6]
	str r0, [r5]
	str r1, [r6]
	movs r4, #1
	mov sl, r4
_0808C952:
	lsls r0, r7, #0x18
	lsrs r5, r0, #0x18
	ldr r0, _0808C978 @ =0x0200E668
	ldrb r0, [r0]
	mov r6, r8
	subs r0, r0, r6
	cmp r5, r0
	blt _0808C922
_0808C962:
	mov r7, r8
	lsls r0, r7, #0x18
	lsrs r1, r0, #0x18
	ldr r3, _0808C978 @ =0x0200E668
	ldrb r0, [r3]
	subs r0, #1
	cmp r1, r0
	blt _0808C910
	bl _0808E31E
	.align 2, 0
_0808C978: .4byte 0x0200E668
_0808C97C: .4byte 0x0200CBF0
_0808C980:
	movs r1, #0
	mov sl, r1
	ldr r2, _0808C9F8 @ =0x0200E668
	ldrb r0, [r2]
	subs r0, #1
	cmp sl, r0
	blt _0808C992
	bl _0808E20E
_0808C992:
	movs r5, #0
	adds r0, r1, #1
	ldrb r2, [r2]
	subs r1, r2, r0
	mov r8, r0
	cmp r5, r1
	bge _0808C9E4
	ldr r2, _0808C9FC @ =0x0200CBF0
	mov sb, r2
_0808C9A4:
	adds r7, r5, #1
	lsls r0, r7, #2
	mov r3, sb
	adds r6, r0, r3
	ldr r0, [r6]
	ldr r0, [r0]
	bl GetUnitSpeed
	adds r4, r0, #0
	lsls r0, r5, #2
	mov r1, sb
	adds r5, r0, r1
	ldr r0, [r5]
	ldr r0, [r0]
	bl GetUnitSpeed
	cmp r4, r0
	bge _0808C9D4
	ldr r1, [r5]
	ldr r0, [r6]
	str r0, [r5]
	str r1, [r6]
	movs r2, #1
	mov sl, r2
_0808C9D4:
	lsls r0, r7, #0x18
	lsrs r5, r0, #0x18
	ldr r0, _0808C9F8 @ =0x0200E668
	ldrb r0, [r0]
	mov r3, r8
	subs r0, r0, r3
	cmp r5, r0
	blt _0808C9A4
_0808C9E4:
	mov r4, r8
	lsls r0, r4, #0x18
	lsrs r1, r0, #0x18
	ldr r2, _0808C9F8 @ =0x0200E668
	ldrb r0, [r2]
	subs r0, #1
	cmp r1, r0
	blt _0808C992
	bl _0808E20E
	.align 2, 0
_0808C9F8: .4byte 0x0200E668
_0808C9FC: .4byte 0x0200CBF0
_0808CA00:
	cmp r2, #0
	bne _0808CA88
	movs r7, #0
	mov sl, r7
	movs r1, #0
	ldr r3, _0808CA80 @ =0x0200E668
	ldrb r0, [r3]
	subs r0, #1
	cmp r2, r0
	blt _0808CA18
	bl _0808E29A
_0808CA18:
	movs r5, #0
	adds r0, r1, #1
	ldrb r3, [r3]
	subs r1, r3, r0
	mov r8, r0
	cmp r5, r1
	bge _0808CA6A
	ldr r0, _0808CA84 @ =0x0200CBF0
	mov sb, r0
_0808CA2A:
	adds r7, r5, #1
	lsls r0, r7, #2
	mov r1, sb
	adds r6, r0, r1
	ldr r0, [r6]
	ldr r0, [r0]
	bl GetUnitLuck
	adds r4, r0, #0
	lsls r0, r5, #2
	mov r2, sb
	adds r5, r0, r2
	ldr r0, [r5]
	ldr r0, [r0]
	bl GetUnitLuck
	cmp r4, r0
	ble _0808CA5A
	ldr r1, [r5]
	ldr r0, [r6]
	str r0, [r5]
	str r1, [r6]
	movs r3, #1
	mov sl, r3
_0808CA5A:
	lsls r0, r7, #0x18
	lsrs r5, r0, #0x18
	ldr r0, _0808CA80 @ =0x0200E668
	ldrb r0, [r0]
	mov r4, r8
	subs r0, r0, r4
	cmp r5, r0
	blt _0808CA2A
_0808CA6A:
	mov r6, r8
	lsls r0, r6, #0x18
	lsrs r1, r0, #0x18
	ldr r3, _0808CA80 @ =0x0200E668
	ldrb r0, [r3]
	subs r0, #1
	cmp r1, r0
	blt _0808CA18
	bl _0808E29A
	.align 2, 0
_0808CA80: .4byte 0x0200E668
_0808CA84: .4byte 0x0200CBF0
_0808CA88:
	movs r0, #0
	mov sl, r0
	movs r1, #0
	ldr r2, _0808CB04 @ =0x0200E668
	ldrb r0, [r2]
	subs r0, #1
	cmp sl, r0
	blt _0808CA9C
	bl _0808E31E
_0808CA9C:
	movs r5, #0
	adds r0, r1, #1
	ldrb r2, [r2]
	subs r1, r2, r0
	mov r8, r0
	cmp r5, r1
	bge _0808CAEE
	ldr r1, _0808CB08 @ =0x0200CBF0
	mov sb, r1
_0808CAAE:
	adds r7, r5, #1
	lsls r0, r7, #2
	mov r2, sb
	adds r6, r0, r2
	ldr r0, [r6]
	ldr r0, [r0]
	bl GetUnitLuck
	adds r4, r0, #0
	lsls r0, r5, #2
	mov r3, sb
	adds r5, r0, r3
	ldr r0, [r5]
	ldr r0, [r0]
	bl GetUnitLuck
	cmp r4, r0
	bge _0808CADE
	ldr r1, [r5]
	ldr r0, [r6]
	str r0, [r5]
	str r1, [r6]
	movs r4, #1
	mov sl, r4
_0808CADE:
	lsls r0, r7, #0x18
	lsrs r5, r0, #0x18
	ldr r0, _0808CB04 @ =0x0200E668
	ldrb r0, [r0]
	mov r6, r8
	subs r0, r0, r6
	cmp r5, r0
	blt _0808CAAE
_0808CAEE:
	mov r7, r8
	lsls r0, r7, #0x18
	lsrs r1, r0, #0x18
	ldr r2, _0808CB04 @ =0x0200E668
	ldrb r0, [r2]
	subs r0, #1
	cmp r1, r0
	blt _0808CA9C
	bl _0808E31E
	.align 2, 0
_0808CB04: .4byte 0x0200E668
_0808CB08: .4byte 0x0200CBF0
_0808CB0C:
	cmp r2, #0
	bne _0808CB90
	movs r1, #0
	mov sl, r1
	ldr r3, _0808CB88 @ =0x0200E668
	ldrb r0, [r3]
	subs r0, #1
	cmp r2, r0
	blt _0808CB22
	bl _0808E20E
_0808CB22:
	movs r5, #0
	adds r0, r1, #1
	ldrb r3, [r3]
	subs r1, r3, r0
	mov r8, r0
	cmp r5, r1
	bge _0808CB74
	ldr r2, _0808CB8C @ =0x0200CBF0
	mov sb, r2
_0808CB34:
	adds r7, r5, #1
	lsls r0, r7, #2
	mov r3, sb
	adds r6, r0, r3
	ldr r0, [r6]
	ldr r0, [r0]
	bl GetUnitDefense
	adds r4, r0, #0
	lsls r0, r5, #2
	mov r1, sb
	adds r5, r0, r1
	ldr r0, [r5]
	ldr r0, [r0]
	bl GetUnitDefense
	cmp r4, r0
	ble _0808CB64
	ldr r1, [r5]
	ldr r0, [r6]
	str r0, [r5]
	str r1, [r6]
	movs r2, #1
	mov sl, r2
_0808CB64:
	lsls r0, r7, #0x18
	lsrs r5, r0, #0x18
	ldr r0, _0808CB88 @ =0x0200E668
	ldrb r0, [r0]
	mov r3, r8
	subs r0, r0, r3
	cmp r5, r0
	blt _0808CB34
_0808CB74:
	mov r4, r8
	lsls r0, r4, #0x18
	lsrs r1, r0, #0x18
	ldr r3, _0808CB88 @ =0x0200E668
	ldrb r0, [r3]
	subs r0, #1
	cmp r1, r0
	blt _0808CB22
	bl _0808E20E
	.align 2, 0
_0808CB88: .4byte 0x0200E668
_0808CB8C: .4byte 0x0200CBF0
_0808CB90:
	movs r7, #0
	mov sl, r7
	movs r1, #0
	ldr r2, _0808CC0C @ =0x0200E668
	ldrb r0, [r2]
	subs r0, #1
	cmp sl, r0
	blt _0808CBA4
	bl _0808E29A
_0808CBA4:
	movs r5, #0
	adds r0, r1, #1
	ldrb r2, [r2]
	subs r1, r2, r0
	mov r8, r0
	cmp r5, r1
	bge _0808CBF6
	ldr r0, _0808CC10 @ =0x0200CBF0
	mov sb, r0
_0808CBB6:
	adds r7, r5, #1
	lsls r0, r7, #2
	mov r1, sb
	adds r6, r0, r1
	ldr r0, [r6]
	ldr r0, [r0]
	bl GetUnitDefense
	adds r4, r0, #0
	lsls r0, r5, #2
	mov r2, sb
	adds r5, r0, r2
	ldr r0, [r5]
	ldr r0, [r0]
	bl GetUnitDefense
	cmp r4, r0
	bge _0808CBE6
	ldr r1, [r5]
	ldr r0, [r6]
	str r0, [r5]
	str r1, [r6]
	movs r3, #1
	mov sl, r3
_0808CBE6:
	lsls r0, r7, #0x18
	lsrs r5, r0, #0x18
	ldr r0, _0808CC0C @ =0x0200E668
	ldrb r0, [r0]
	mov r4, r8
	subs r0, r0, r4
	cmp r5, r0
	blt _0808CBB6
_0808CBF6:
	mov r6, r8
	lsls r0, r6, #0x18
	lsrs r1, r0, #0x18
	ldr r2, _0808CC0C @ =0x0200E668
	ldrb r0, [r2]
	subs r0, #1
	cmp r1, r0
	blt _0808CBA4
	bl _0808E29A
	.align 2, 0
_0808CC0C: .4byte 0x0200E668
_0808CC10: .4byte 0x0200CBF0
_0808CC14:
	cmp r2, #0
	bne _0808CC9C
	movs r0, #0
	mov sl, r0
	movs r1, #0
	ldr r3, _0808CC94 @ =0x0200E668
	ldrb r0, [r3]
	subs r0, #1
	cmp r2, r0
	blt _0808CC2C
	bl _0808E31E
_0808CC2C:
	movs r5, #0
	adds r0, r1, #1
	ldrb r3, [r3]
	subs r1, r3, r0
	mov r8, r0
	cmp r5, r1
	bge _0808CC7E
	ldr r1, _0808CC98 @ =0x0200CBF0
	mov sb, r1
_0808CC3E:
	adds r7, r5, #1
	lsls r0, r7, #2
	mov r2, sb
	adds r6, r0, r2
	ldr r0, [r6]
	ldr r0, [r0]
	bl GetUnitResistance
	adds r4, r0, #0
	lsls r0, r5, #2
	mov r3, sb
	adds r5, r0, r3
	ldr r0, [r5]
	ldr r0, [r0]
	bl GetUnitResistance
	cmp r4, r0
	ble _0808CC6E
	ldr r1, [r5]
	ldr r0, [r6]
	str r0, [r5]
	str r1, [r6]
	movs r4, #1
	mov sl, r4
_0808CC6E:
	lsls r0, r7, #0x18
	lsrs r5, r0, #0x18
	ldr r0, _0808CC94 @ =0x0200E668
	ldrb r0, [r0]
	mov r6, r8
	subs r0, r0, r6
	cmp r5, r0
	blt _0808CC3E
_0808CC7E:
	mov r7, r8
	lsls r0, r7, #0x18
	lsrs r1, r0, #0x18
	ldr r3, _0808CC94 @ =0x0200E668
	ldrb r0, [r3]
	subs r0, #1
	cmp r1, r0
	blt _0808CC2C
	bl _0808E31E
	.align 2, 0
_0808CC94: .4byte 0x0200E668
_0808CC98: .4byte 0x0200CBF0
_0808CC9C:
	movs r1, #0
	mov sl, r1
	ldr r2, _0808CD14 @ =0x0200E668
	ldrb r0, [r2]
	subs r0, #1
	cmp sl, r0
	blt _0808CCAE
	bl _0808E20E
_0808CCAE:
	movs r5, #0
	adds r0, r1, #1
	ldrb r2, [r2]
	subs r1, r2, r0
	mov r8, r0
	cmp r5, r1
	bge _0808CD00
	ldr r2, _0808CD18 @ =0x0200CBF0
	mov sb, r2
_0808CCC0:
	adds r7, r5, #1
	lsls r0, r7, #2
	mov r3, sb
	adds r6, r0, r3
	ldr r0, [r6]
	ldr r0, [r0]
	bl GetUnitResistance
	adds r4, r0, #0
	lsls r0, r5, #2
	mov r1, sb
	adds r5, r0, r1
	ldr r0, [r5]
	ldr r0, [r0]
	bl GetUnitResistance
	cmp r4, r0
	bge _0808CCF0
	ldr r1, [r5]
	ldr r0, [r6]
	str r0, [r5]
	str r1, [r6]
	movs r2, #1
	mov sl, r2
_0808CCF0:
	lsls r0, r7, #0x18
	lsrs r5, r0, #0x18
	ldr r0, _0808CD14 @ =0x0200E668
	ldrb r0, [r0]
	mov r3, r8
	subs r0, r0, r3
	cmp r5, r0
	blt _0808CCC0
_0808CD00:
	mov r4, r8
	lsls r0, r4, #0x18
	lsrs r1, r0, #0x18
	ldr r2, _0808CD14 @ =0x0200E668
	ldrb r0, [r2]
	subs r0, #1
	cmp r1, r0
	blt _0808CCAE
	bl _0808E20E
	.align 2, 0
_0808CD14: .4byte 0x0200E668
_0808CD18: .4byte 0x0200CBF0
_0808CD1C:
	cmp r2, #0
	bne _0808CDCC
	movs r7, #0
	str r7, [sp, #0x48]
	movs r1, #0
	ldr r3, _0808CDC4 @ =0x0200E668
	ldrb r0, [r3]
	subs r0, #1
	cmp r2, r0
	bge _0808CDBC
	adds r4, r3, #0
	mov sl, r4
_0808CD34:
	movs r2, #0
	adds r0, r1, #1
	mov r6, sl
	ldrb r6, [r6]
	subs r1, r6, r0
	mov sb, r0
	cmp r2, r1
	bge _0808CDAC
	ldr r7, _0808CDC8 @ =0x0200CBF0
	mov ip, r7
_0808CD48:
	adds r0, r2, #1
	mov r8, r0
	lsls r0, r0, #2
	mov r1, ip
	adds r7, r0, r1
	ldr r6, [r7]
	ldr r1, [r6]
	ldr r0, [r1, #4]
	movs r3, #0x11
	ldrsb r3, [r0, r3]
	ldr r0, [r1]
	ldrb r0, [r0, #0x13]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r3, r3, r0
	movs r0, #0x1a
	ldrsb r0, [r1, r0]
	adds r3, r3, r0
	lsls r0, r2, #2
	mov r2, ip
	adds r4, r0, r2
	ldr r5, [r4]
	ldr r2, [r5]
	ldr r0, [r2, #4]
	ldrb r0, [r0, #0x11]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	ldr r1, [r2]
	ldrb r1, [r1, #0x13]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	adds r0, r0, r1
	movs r1, #0x1a
	ldrsb r1, [r2, r1]
	adds r0, r0, r1
	cmp r3, r0
	ble _0808CD9A
	str r6, [r4]
	str r5, [r7]
	movs r3, #1
	str r3, [sp, #0x48]
_0808CD9A:
	mov r4, r8
	lsls r0, r4, #0x18
	lsrs r2, r0, #0x18
	mov r6, sl
	ldrb r6, [r6]
	mov r7, sb
	subs r0, r6, r7
	cmp r2, r0
	blt _0808CD48
_0808CDAC:
	mov r1, sb
	lsls r0, r1, #0x18
	lsrs r1, r0, #0x18
	ldr r2, _0808CDC4 @ =0x0200E668
	ldrb r0, [r2]
	subs r0, #1
	cmp r1, r0
	blt _0808CD34
_0808CDBC:
	ldr r3, [sp, #0x48]
	bl _0808D68E
	.align 2, 0
_0808CDC4: .4byte 0x0200E668
_0808CDC8: .4byte 0x0200CBF0
_0808CDCC:
	movs r4, #0
	str r4, [sp, #0x4c]
	movs r1, #0
	ldr r6, _0808CE70 @ =0x0200E668
	ldrb r0, [r6]
	subs r0, #1
	cmp r4, r0
	bge _0808CE68
	adds r7, r6, #0
	mov sl, r7
_0808CDE0:
	movs r2, #0
	adds r0, r1, #1
	mov r3, sl
	ldrb r3, [r3]
	subs r1, r3, r0
	mov sb, r0
	cmp r2, r1
	bge _0808CE58
	ldr r4, _0808CE74 @ =0x0200CBF0
	mov ip, r4
_0808CDF4:
	adds r6, r2, #1
	mov r8, r6
	lsls r0, r6, #2
	mov r1, ip
	adds r7, r0, r1
	ldr r6, [r7]
	ldr r1, [r6]
	ldr r0, [r1, #4]
	movs r3, #0x11
	ldrsb r3, [r0, r3]
	ldr r0, [r1]
	ldrb r0, [r0, #0x13]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r3, r3, r0
	movs r0, #0x1a
	ldrsb r0, [r1, r0]
	adds r3, r3, r0
	lsls r0, r2, #2
	mov r2, ip
	adds r4, r0, r2
	ldr r5, [r4]
	ldr r2, [r5]
	ldr r0, [r2, #4]
	ldrb r0, [r0, #0x11]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	ldr r1, [r2]
	ldrb r1, [r1, #0x13]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	adds r0, r0, r1
	movs r1, #0x1a
	ldrsb r1, [r2, r1]
	adds r0, r0, r1
	cmp r3, r0
	bge _0808CE46
	str r6, [r4]
	str r5, [r7]
	movs r3, #1
	str r3, [sp, #0x4c]
_0808CE46:
	mov r4, r8
	lsls r0, r4, #0x18
	lsrs r2, r0, #0x18
	mov r6, sl
	ldrb r6, [r6]
	mov r7, sb
	subs r0, r6, r7
	cmp r2, r0
	blt _0808CDF4
_0808CE58:
	mov r1, sb
	lsls r0, r1, #0x18
	lsrs r1, r0, #0x18
	ldr r2, _0808CE70 @ =0x0200E668
	ldrb r0, [r2]
	subs r0, #1
	cmp r1, r0
	blt _0808CDE0
_0808CE68:
	ldr r3, [sp, #0x4c]
	bl _0808D68E
	.align 2, 0
_0808CE70: .4byte 0x0200E668
_0808CE74: .4byte 0x0200CBF0
_0808CE78:
	cmp r2, #0
	bne _0808CF00
	movs r4, #0
	mov sl, r4
	movs r1, #0
	ldr r3, _0808CEF8 @ =0x0200E668
	ldrb r0, [r3]
	subs r0, #1
	cmp r2, r0
	blt _0808CE90
	bl _0808E29A
_0808CE90:
	movs r5, #0
	adds r0, r1, #1
	ldrb r3, [r3]
	subs r1, r3, r0
	mov r8, r0
	cmp r5, r1
	bge _0808CEE2
	ldr r6, _0808CEFC @ =0x0200CBF0
	mov sb, r6
_0808CEA2:
	adds r7, r5, #1
	lsls r0, r7, #2
	mov r1, sb
	adds r6, r0, r1
	ldr r0, [r6]
	ldr r0, [r0]
	bl GetUnitAid
	adds r4, r0, #0
	lsls r0, r5, #2
	mov r2, sb
	adds r5, r0, r2
	ldr r0, [r5]
	ldr r0, [r0]
	bl GetUnitAid
	cmp r4, r0
	ble _0808CED2
	ldr r1, [r5]
	ldr r0, [r6]
	str r0, [r5]
	str r1, [r6]
	movs r3, #1
	mov sl, r3
_0808CED2:
	lsls r0, r7, #0x18
	lsrs r5, r0, #0x18
	ldr r0, _0808CEF8 @ =0x0200E668
	ldrb r0, [r0]
	mov r4, r8
	subs r0, r0, r4
	cmp r5, r0
	blt _0808CEA2
_0808CEE2:
	mov r6, r8
	lsls r0, r6, #0x18
	lsrs r1, r0, #0x18
	ldr r3, _0808CEF8 @ =0x0200E668
	ldrb r0, [r3]
	subs r0, #1
	cmp r1, r0
	blt _0808CE90
	bl _0808E29A
	.align 2, 0
_0808CEF8: .4byte 0x0200E668
_0808CEFC: .4byte 0x0200CBF0
_0808CF00:
	movs r0, #0
	mov sl, r0
	movs r1, #0
	ldr r2, _0808CF7C @ =0x0200E668
	ldrb r0, [r2]
	subs r0, #1
	cmp sl, r0
	blt _0808CF14
	bl _0808E31E
_0808CF14:
	movs r5, #0
	adds r0, r1, #1
	ldrb r2, [r2]
	subs r1, r2, r0
	mov r8, r0
	cmp r5, r1
	bge _0808CF66
	ldr r1, _0808CF80 @ =0x0200CBF0
	mov sb, r1
_0808CF26:
	adds r7, r5, #1
	lsls r0, r7, #2
	mov r2, sb
	adds r6, r0, r2
	ldr r0, [r6]
	ldr r0, [r0]
	bl GetUnitAid
	adds r4, r0, #0
	lsls r0, r5, #2
	mov r3, sb
	adds r5, r0, r3
	ldr r0, [r5]
	ldr r0, [r0]
	bl GetUnitAid
	cmp r4, r0
	bge _0808CF56
	ldr r1, [r5]
	ldr r0, [r6]
	str r0, [r5]
	str r1, [r6]
	movs r4, #1
	mov sl, r4
_0808CF56:
	lsls r0, r7, #0x18
	lsrs r5, r0, #0x18
	ldr r0, _0808CF7C @ =0x0200E668
	ldrb r0, [r0]
	mov r6, r8
	subs r0, r0, r6
	cmp r5, r0
	blt _0808CF26
_0808CF66:
	mov r7, r8
	lsls r0, r7, #0x18
	lsrs r1, r0, #0x18
	ldr r2, _0808CF7C @ =0x0200E668
	ldrb r0, [r2]
	subs r0, #1
	cmp r1, r0
	blt _0808CF14
	bl _0808E31E
	.align 2, 0
_0808CF7C: .4byte 0x0200E668
_0808CF80: .4byte 0x0200CBF0
_0808CF84:
	cmp r2, #0
	bne _0808D008
	movs r1, #0
	mov sl, r1
	ldr r3, _0808D000 @ =0x0200E668
	ldrb r0, [r3]
	subs r0, #1
	cmp r2, r0
	blt _0808CF9A
	bl _0808E20E
_0808CF9A:
	movs r5, #0
	adds r0, r1, #1
	ldrb r3, [r3]
	subs r1, r3, r0
	mov r8, r0
	cmp r5, r1
	bge _0808CFEC
	ldr r2, _0808D004 @ =0x0200CBF0
	mov sb, r2
_0808CFAC:
	adds r7, r5, #1
	lsls r0, r7, #2
	mov r3, sb
	adds r6, r0, r3
	ldr r0, [r6]
	ldr r0, [r0]
	bl GetUnitAffinityIcon
	adds r4, r0, #0
	lsls r0, r5, #2
	mov r1, sb
	adds r5, r0, r1
	ldr r0, [r5]
	ldr r0, [r0]
	bl GetUnitAffinityIcon
	cmp r4, r0
	bge _0808CFDC
	ldr r1, [r5]
	ldr r0, [r6]
	str r0, [r5]
	str r1, [r6]
	movs r2, #1
	mov sl, r2
_0808CFDC:
	lsls r0, r7, #0x18
	lsrs r5, r0, #0x18
	ldr r0, _0808D000 @ =0x0200E668
	ldrb r0, [r0]
	mov r3, r8
	subs r0, r0, r3
	cmp r5, r0
	blt _0808CFAC
_0808CFEC:
	mov r4, r8
	lsls r0, r4, #0x18
	lsrs r1, r0, #0x18
	ldr r3, _0808D000 @ =0x0200E668
	ldrb r0, [r3]
	subs r0, #1
	cmp r1, r0
	blt _0808CF9A
	bl _0808E20E
	.align 2, 0
_0808D000: .4byte 0x0200E668
_0808D004: .4byte 0x0200CBF0
_0808D008:
	movs r7, #0
	mov sl, r7
	movs r1, #0
	ldr r2, _0808D084 @ =0x0200E668
	ldrb r0, [r2]
	subs r0, #1
	cmp sl, r0
	blt _0808D01C
	bl _0808E29A
_0808D01C:
	movs r5, #0
	adds r0, r1, #1
	ldrb r2, [r2]
	subs r1, r2, r0
	mov r8, r0
	cmp r5, r1
	bge _0808D06E
	ldr r0, _0808D088 @ =0x0200CBF0
	mov sb, r0
_0808D02E:
	adds r7, r5, #1
	lsls r0, r7, #2
	mov r1, sb
	adds r6, r0, r1
	ldr r0, [r6]
	ldr r0, [r0]
	bl GetUnitAffinityIcon
	adds r4, r0, #0
	lsls r0, r5, #2
	mov r2, sb
	adds r5, r0, r2
	ldr r0, [r5]
	ldr r0, [r0]
	bl GetUnitAffinityIcon
	cmp r4, r0
	ble _0808D05E
	ldr r1, [r5]
	ldr r0, [r6]
	str r0, [r5]
	str r1, [r6]
	movs r3, #1
	mov sl, r3
_0808D05E:
	lsls r0, r7, #0x18
	lsrs r5, r0, #0x18
	ldr r0, _0808D084 @ =0x0200E668
	ldrb r0, [r0]
	mov r4, r8
	subs r0, r0, r4
	cmp r5, r0
	blt _0808D02E
_0808D06E:
	mov r6, r8
	lsls r0, r6, #0x18
	lsrs r1, r0, #0x18
	ldr r2, _0808D084 @ =0x0200E668
	ldrb r0, [r2]
	subs r0, #1
	cmp r1, r0
	blt _0808D01C
	bl _0808E29A
	.align 2, 0
_0808D084: .4byte 0x0200E668
_0808D088: .4byte 0x0200CBF0
_0808D08C:
	cmp r2, #0
	beq _0808D092
	b _0808D194
_0808D092:
	movs r0, #0
	str r0, [sp, #0x50]
	movs r4, #0
	ldr r0, _0808D0D0 @ =0x0200E668
	ldrb r0, [r0]
	cmp r2, r0
	bhs _0808D0CA
	ldr r5, _0808D0D4 @ =0x0200CBF0
_0808D0A2:
	lsls r0, r4, #2
	adds r0, r0, r5
	ldr r0, [r0]
	ldr r0, [r0]
	bl GetUnitEquippedWeapon
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl GetItemIndex
	mov r2, sp
	adds r1, r2, r4
	strb r0, [r1]
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	ldr r0, _0808D0D0 @ =0x0200E668
	ldrb r0, [r0]
	cmp r4, r0
	blo _0808D0A2
_0808D0CA:
	movs r4, #0
	b _0808D182
	.align 2, 0
_0808D0D0: .4byte 0x0200E668
_0808D0D4: .4byte 0x0200CBF0
_0808D0D8:
	movs r6, #0
	adds r0, r4, #1
	ldrb r1, [r1]
	subs r1, r1, r0
	str r0, [sp, #0x58]
	cmp r6, r1
	bge _0808D17C
	ldr r3, _0808D124 @ =0x0200CBF0
	mov sl, r3
_0808D0EA:
	adds r0, r6, #1
	mov r4, sp
	adds r4, r4, r0
	mov r8, r4
	mov r7, sp
	adds r5, r7, r6
	ldrb r4, [r4]
	adds r3, r4, #0
	ldrb r2, [r5]
	mov sb, r0
	cmp r3, r2
	bls _0808D128
	adds r1, r2, #0
	strb r4, [r5]
	mov r0, r8
	strb r1, [r0]
	lsls r2, r6, #2
	add r2, sl
	ldr r3, [r2]
	mov r4, sb
	lsls r1, r4, #2
	add r1, sl
	ldr r0, [r1]
	str r0, [r2]
	str r3, [r1]
	movs r6, #1
	str r6, [sp, #0x50]
	b _0808D16A
	.align 2, 0
_0808D124: .4byte 0x0200CBF0
_0808D128:
	cmp r3, r2
	bne _0808D16A
	mov r7, sb
	lsls r0, r7, #2
	mov r1, sl
	adds r7, r0, r1
	ldr r0, [r7]
	ldr r0, [r0]
	bl GetUnitEquippedWeapon
	adds r4, r0, #0
	lsls r0, r6, #2
	mov r2, sl
	adds r6, r0, r2
	ldr r0, [r6]
	ldr r0, [r0]
	bl GetUnitEquippedWeapon
	lsls r4, r4, #0x10
	lsls r0, r0, #0x10
	cmp r4, r0
	bls _0808D16A
	ldrb r1, [r5]
	mov r3, r8
	ldrb r0, [r3]
	strb r0, [r5]
	strb r1, [r3]
	ldr r3, [r6]
	ldr r0, [r7]
	str r0, [r6]
	str r3, [r7]
	movs r4, #1
	str r4, [sp, #0x50]
_0808D16A:
	mov r6, sb
	lsls r0, r6, #0x18
	lsrs r6, r0, #0x18
	ldr r0, _0808D190 @ =0x0200E668
	ldrb r0, [r0]
	ldr r7, [sp, #0x58]
	subs r0, r0, r7
	cmp r6, r0
	blt _0808D0EA
_0808D17C:
	ldr r1, [sp, #0x58]
	lsls r0, r1, #0x18
	lsrs r4, r0, #0x18
_0808D182:
	ldr r1, _0808D190 @ =0x0200E668
	ldrb r0, [r1]
	subs r0, #1
	cmp r4, r0
	blt _0808D0D8
	ldr r2, [sp, #0x50]
	b _0808D286
	.align 2, 0
_0808D190: .4byte 0x0200E668
_0808D194:
	movs r3, #0
	str r3, [sp, #0x54]
	movs r4, #0
	ldr r0, _0808D1D0 @ =0x0200E668
	ldrb r0, [r0]
	cmp r3, r0
	bhs _0808D1CC
	ldr r5, _0808D1D4 @ =0x0200CBF0
_0808D1A4:
	lsls r0, r4, #2
	adds r0, r0, r5
	ldr r0, [r0]
	ldr r0, [r0]
	bl GetUnitEquippedWeapon
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl GetItemIndex
	mov r6, sp
	adds r1, r6, r4
	strb r0, [r1]
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	ldr r0, _0808D1D0 @ =0x0200E668
	ldrb r0, [r0]
	cmp r4, r0
	blo _0808D1A4
_0808D1CC:
	movs r4, #0
	b _0808D27A
	.align 2, 0
_0808D1D0: .4byte 0x0200E668
_0808D1D4: .4byte 0x0200CBF0
_0808D1D8:
	movs r6, #0
	adds r0, r4, #1
	ldrb r1, [r1]
	subs r1, r1, r0
	str r0, [sp, #0x5c]
	cmp r6, r1
	bge _0808D274
	ldr r7, _0808D21C @ =0x0200CBF0
	mov sl, r7
_0808D1EA:
	adds r0, r6, #1
	mov r1, sp
	adds r1, r1, r0
	mov r8, r1
	mov r2, sp
	adds r5, r2, r6
	ldrb r4, [r1]
	adds r3, r4, #0
	ldrb r2, [r5]
	mov sb, r0
	cmp r3, r2
	bhs _0808D220
	adds r1, r2, #0
	strb r4, [r5]
	mov r3, r8
	strb r1, [r3]
	lsls r2, r6, #2
	add r2, sl
	ldr r3, [r2]
	lsls r1, r0, #2
	add r1, sl
	ldr r0, [r1]
	str r0, [r2]
	str r3, [r1]
	b _0808D25E
	.align 2, 0
_0808D21C: .4byte 0x0200CBF0
_0808D220:
	cmp r3, r2
	bne _0808D262
	mov r7, sb
	lsls r0, r7, #2
	mov r1, sl
	adds r7, r0, r1
	ldr r0, [r7]
	ldr r0, [r0]
	bl GetUnitEquippedWeapon
	adds r4, r0, #0
	lsls r0, r6, #2
	mov r2, sl
	adds r6, r0, r2
	ldr r0, [r6]
	ldr r0, [r0]
	bl GetUnitEquippedWeapon
	lsls r4, r4, #0x10
	lsls r0, r0, #0x10
	cmp r4, r0
	bhs _0808D262
	ldrb r1, [r5]
	mov r3, r8
	ldrb r0, [r3]
	strb r0, [r5]
	strb r1, [r3]
	ldr r3, [r6]
	ldr r0, [r7]
	str r0, [r6]
	str r3, [r7]
_0808D25E:
	movs r4, #1
	str r4, [sp, #0x54]
_0808D262:
	mov r6, sb
	lsls r0, r6, #0x18
	lsrs r6, r0, #0x18
	ldr r0, _0808D294 @ =0x0200E668
	ldrb r0, [r0]
	ldr r7, [sp, #0x5c]
	subs r0, r0, r7
	cmp r6, r0
	blt _0808D1EA
_0808D274:
	ldr r1, [sp, #0x5c]
	lsls r0, r1, #0x18
	lsrs r4, r0, #0x18
_0808D27A:
	ldr r1, _0808D294 @ =0x0200E668
	ldrb r0, [r1]
	subs r0, #1
	cmp r4, r0
	blt _0808D1D8
	ldr r2, [sp, #0x54]
_0808D286:
	cmp r2, #0
	bne _0808D28E
	bl _0808E330
_0808D28E:
	movs r0, #1
	bl _0808E332
	.align 2, 0
_0808D294: .4byte 0x0200E668
_0808D298:
	cmp r2, #0
	bne _0808D314
	movs r3, #0
	mov ip, r3
	movs r1, #0
	ldr r4, _0808D30C @ =0x0200E668
	ldrb r0, [r4]
	subs r0, #1
	cmp r2, r0
	bge _0808D306
	adds r6, r4, #0
	mov sl, r6
_0808D2B0:
	movs r2, #0
	adds r0, r1, #1
	mov r7, sl
	ldrb r7, [r7]
	subs r1, r7, r0
	mov sb, r0
	cmp r2, r1
	bge _0808D2F6
	mov r8, sb
_0808D2C2:
	adds r6, r2, #1
	lsls r0, r6, #2
	ldr r1, _0808D310 @ =0x0200CBF0
	adds r5, r0, r1
	ldr r4, [r5]
	lsls r0, r2, #2
	adds r2, r0, r1
	ldr r3, [r2]
	movs r7, #4
	ldrsh r1, [r4, r7]
	movs r7, #4
	ldrsh r0, [r3, r7]
	cmp r1, r0
	ble _0808D2E6
	str r4, [r2]
	str r3, [r5]
	movs r0, #1
	mov ip, r0
_0808D2E6:
	lsls r0, r6, #0x18
	lsrs r2, r0, #0x18
	mov r1, sl
	ldrb r1, [r1]
	mov r3, r8
	subs r0, r1, r3
	cmp r2, r0
	blt _0808D2C2
_0808D2F6:
	mov r4, sb
	lsls r0, r4, #0x18
	lsrs r1, r0, #0x18
	ldr r6, _0808D30C @ =0x0200E668
	ldrb r0, [r6]
	subs r0, #1
	cmp r1, r0
	blt _0808D2B0
_0808D306:
	mov r7, ip
	bl _0808E29C
	.align 2, 0
_0808D30C: .4byte 0x0200E668
_0808D310: .4byte 0x0200CBF0
_0808D314:
	movs r0, #0
	mov ip, r0
	movs r1, #0
	ldr r2, _0808D384 @ =0x0200E668
	ldrb r0, [r2]
	subs r0, #1
	cmp ip, r0
	bge _0808D37E
	adds r3, r2, #0
	mov sl, r3
_0808D328:
	movs r2, #0
	adds r0, r1, #1
	mov r4, sl
	ldrb r4, [r4]
	subs r1, r4, r0
	mov sb, r0
	cmp r2, r1
	bge _0808D36E
	mov r8, sb
_0808D33A:
	adds r6, r2, #1
	lsls r0, r6, #2
	ldr r7, _0808D388 @ =0x0200CBF0
	adds r5, r0, r7
	ldr r4, [r5]
	lsls r0, r2, #2
	adds r2, r0, r7
	ldr r3, [r2]
	movs r0, #4
	ldrsh r1, [r4, r0]
	movs r7, #4
	ldrsh r0, [r3, r7]
	cmp r1, r0
	bge _0808D35E
	str r4, [r2]
	str r3, [r5]
	movs r0, #1
	mov ip, r0
_0808D35E:
	lsls r0, r6, #0x18
	lsrs r2, r0, #0x18
	mov r1, sl
	ldrb r1, [r1]
	mov r3, r8
	subs r0, r1, r3
	cmp r2, r0
	blt _0808D33A
_0808D36E:
	mov r4, sb
	lsls r0, r4, #0x18
	lsrs r1, r0, #0x18
	ldr r6, _0808D384 @ =0x0200E668
	ldrb r0, [r6]
	subs r0, #1
	cmp r1, r0
	blt _0808D328
_0808D37E:
	mov r7, ip
	bl _0808E29C
	.align 2, 0
_0808D384: .4byte 0x0200E668
_0808D388: .4byte 0x0200CBF0
_0808D38C:
	cmp r2, #0
	bne _0808D408
	movs r0, #0
	mov ip, r0
	movs r1, #0
	ldr r3, _0808D400 @ =0x0200E668
	ldrb r0, [r3]
	subs r0, #1
	cmp r2, r0
	bge _0808D3FA
	adds r4, r3, #0
	mov sl, r4
_0808D3A4:
	movs r2, #0
	adds r0, r1, #1
	mov r6, sl
	ldrb r6, [r6]
	subs r1, r6, r0
	mov sb, r0
	cmp r2, r1
	bge _0808D3EA
	mov r8, sb
_0808D3B6:
	adds r6, r2, #1
	lsls r0, r6, #2
	ldr r7, _0808D404 @ =0x0200CBF0
	adds r5, r0, r7
	ldr r4, [r5]
	lsls r0, r2, #2
	adds r2, r0, r7
	ldr r3, [r2]
	movs r0, #6
	ldrsh r1, [r4, r0]
	movs r7, #6
	ldrsh r0, [r3, r7]
	cmp r1, r0
	ble _0808D3DA
	str r4, [r2]
	str r3, [r5]
	movs r0, #1
	mov ip, r0
_0808D3DA:
	lsls r0, r6, #0x18
	lsrs r2, r0, #0x18
	mov r1, sl
	ldrb r1, [r1]
	mov r3, r8
	subs r0, r1, r3
	cmp r2, r0
	blt _0808D3B6
_0808D3EA:
	mov r4, sb
	lsls r0, r4, #0x18
	lsrs r1, r0, #0x18
	ldr r6, _0808D400 @ =0x0200E668
	ldrb r0, [r6]
	subs r0, #1
	cmp r1, r0
	blt _0808D3A4
_0808D3FA:
	mov r7, ip
	bl _0808E29C
	.align 2, 0
_0808D400: .4byte 0x0200E668
_0808D404: .4byte 0x0200CBF0
_0808D408:
	movs r0, #0
	mov ip, r0
	movs r1, #0
	ldr r2, _0808D478 @ =0x0200E668
	ldrb r0, [r2]
	subs r0, #1
	cmp ip, r0
	bge _0808D472
	adds r3, r2, #0
	mov sl, r3
_0808D41C:
	movs r2, #0
	adds r0, r1, #1
	mov r4, sl
	ldrb r4, [r4]
	subs r1, r4, r0
	mov sb, r0
	cmp r2, r1
	bge _0808D462
	mov r8, sb
_0808D42E:
	adds r6, r2, #1
	lsls r0, r6, #2
	ldr r7, _0808D47C @ =0x0200CBF0
	adds r5, r0, r7
	ldr r4, [r5]
	lsls r0, r2, #2
	adds r2, r0, r7
	ldr r3, [r2]
	movs r0, #6
	ldrsh r1, [r4, r0]
	movs r7, #6
	ldrsh r0, [r3, r7]
	cmp r1, r0
	bge _0808D452
	str r4, [r2]
	str r3, [r5]
	movs r0, #1
	mov ip, r0
_0808D452:
	lsls r0, r6, #0x18
	lsrs r2, r0, #0x18
	mov r1, sl
	ldrb r1, [r1]
	mov r3, r8
	subs r0, r1, r3
	cmp r2, r0
	blt _0808D42E
_0808D462:
	mov r4, sb
	lsls r0, r4, #0x18
	lsrs r1, r0, #0x18
	ldr r6, _0808D478 @ =0x0200E668
	ldrb r0, [r6]
	subs r0, #1
	cmp r1, r0
	blt _0808D41C
_0808D472:
	mov r7, ip
	bl _0808E29C
	.align 2, 0
_0808D478: .4byte 0x0200E668
_0808D47C: .4byte 0x0200CBF0
_0808D480:
	cmp r2, #0
	bne _0808D4FC
	movs r0, #0
	mov ip, r0
	movs r1, #0
	ldr r3, _0808D4F4 @ =0x0200E668
	ldrb r0, [r3]
	subs r0, #1
	cmp r2, r0
	bge _0808D4EE
	adds r4, r3, #0
	mov sl, r4
_0808D498:
	movs r2, #0
	adds r0, r1, #1
	mov r6, sl
	ldrb r6, [r6]
	subs r1, r6, r0
	mov sb, r0
	cmp r2, r1
	bge _0808D4DE
	mov r8, sb
_0808D4AA:
	adds r6, r2, #1
	lsls r0, r6, #2
	ldr r7, _0808D4F8 @ =0x0200CBF0
	adds r5, r0, r7
	ldr r4, [r5]
	lsls r0, r2, #2
	adds r2, r0, r7
	ldr r3, [r2]
	movs r0, #8
	ldrsh r1, [r4, r0]
	movs r7, #8
	ldrsh r0, [r3, r7]
	cmp r1, r0
	ble _0808D4CE
	str r4, [r2]
	str r3, [r5]
	movs r0, #1
	mov ip, r0
_0808D4CE:
	lsls r0, r6, #0x18
	lsrs r2, r0, #0x18
	mov r1, sl
	ldrb r1, [r1]
	mov r3, r8
	subs r0, r1, r3
	cmp r2, r0
	blt _0808D4AA
_0808D4DE:
	mov r4, sb
	lsls r0, r4, #0x18
	lsrs r1, r0, #0x18
	ldr r6, _0808D4F4 @ =0x0200E668
	ldrb r0, [r6]
	subs r0, #1
	cmp r1, r0
	blt _0808D498
_0808D4EE:
	mov r7, ip
	bl _0808E29C
	.align 2, 0
_0808D4F4: .4byte 0x0200E668
_0808D4F8: .4byte 0x0200CBF0
_0808D4FC:
	movs r0, #0
	mov ip, r0
	movs r1, #0
	ldr r2, _0808D56C @ =0x0200E668
	ldrb r0, [r2]
	subs r0, #1
	cmp ip, r0
	bge _0808D566
	adds r3, r2, #0
	mov sl, r3
_0808D510:
	movs r2, #0
	adds r0, r1, #1
	mov r4, sl
	ldrb r4, [r4]
	subs r1, r4, r0
	mov sb, r0
	cmp r2, r1
	bge _0808D556
	mov r8, sb
_0808D522:
	adds r6, r2, #1
	lsls r0, r6, #2
	ldr r7, _0808D570 @ =0x0200CBF0
	adds r5, r0, r7
	ldr r4, [r5]
	lsls r0, r2, #2
	adds r2, r0, r7
	ldr r3, [r2]
	movs r0, #8
	ldrsh r1, [r4, r0]
	movs r7, #8
	ldrsh r0, [r3, r7]
	cmp r1, r0
	bge _0808D546
	str r4, [r2]
	str r3, [r5]
	movs r0, #1
	mov ip, r0
_0808D546:
	lsls r0, r6, #0x18
	lsrs r2, r0, #0x18
	mov r1, sl
	ldrb r1, [r1]
	mov r3, r8
	subs r0, r1, r3
	cmp r2, r0
	blt _0808D522
_0808D556:
	mov r4, sb
	lsls r0, r4, #0x18
	lsrs r1, r0, #0x18
	ldr r6, _0808D56C @ =0x0200E668
	ldrb r0, [r6]
	subs r0, #1
	cmp r1, r0
	blt _0808D510
_0808D566:
	mov r7, ip
	bl _0808E29C
	.align 2, 0
_0808D56C: .4byte 0x0200E668
_0808D570: .4byte 0x0200CBF0
_0808D574:
	cmp r2, #0
	bne _0808D608
	movs r0, #0
	mov ip, r0
	movs r1, #0
	ldr r3, _0808D600 @ =0x0200E668
	ldrb r0, [r3]
	subs r0, #1
	cmp r2, r0
	blt _0808D58A
	b _0808D68C
_0808D58A:
	adds r4, r3, #0
	mov sl, r4
_0808D58E:
	movs r3, #0
	adds r0, r1, #1
	mov r6, sl
	ldrb r6, [r6]
	subs r1, r6, r0
	mov r8, r0
	cmp r3, r1
	bge _0808D5EE
	ldr r7, _0808D604 @ =0x0200CBF0
	mov sb, r7
_0808D5A2:
	adds r7, r3, #1
	lsls r0, r7, #2
	mov r1, sb
	adds r6, r0, r1
	ldr r5, [r6]
	ldr r0, [r5]
	movs r2, #0x1d
	ldrsb r2, [r0, r2]
	ldr r0, [r0, #4]
	ldrb r0, [r0, #0x12]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r2, r2, r0
	lsls r0, r3, #2
	adds r3, r0, r1
	ldr r4, [r3]
	ldr r0, [r4]
	movs r1, #0x1d
	ldrsb r1, [r0, r1]
	ldr r0, [r0, #4]
	ldrb r0, [r0, #0x12]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r1, r1, r0
	cmp r2, r1
	ble _0808D5DE
	str r5, [r3]
	str r4, [r6]
	movs r2, #1
	mov ip, r2
_0808D5DE:
	lsls r0, r7, #0x18
	lsrs r3, r0, #0x18
	mov r4, sl
	ldrb r4, [r4]
	mov r6, r8
	subs r0, r4, r6
	cmp r3, r0
	blt _0808D5A2
_0808D5EE:
	mov r7, r8
	lsls r0, r7, #0x18
	lsrs r1, r0, #0x18
	ldr r2, _0808D600 @ =0x0200E668
	ldrb r0, [r2]
	subs r0, #1
	cmp r1, r0
	blt _0808D58E
	b _0808D68C
	.align 2, 0
_0808D600: .4byte 0x0200E668
_0808D604: .4byte 0x0200CBF0
_0808D608:
	movs r4, #0
	mov ip, r4
	movs r1, #0
	ldr r6, _0808D69C @ =0x0200E668
	ldrb r0, [r6]
	subs r0, #1
	cmp ip, r0
	bge _0808D68C
	adds r7, r6, #0
	mov sl, r7
_0808D61C:
	movs r3, #0
	adds r0, r1, #1
	mov r2, sl
	ldrb r2, [r2]
	subs r1, r2, r0
	mov r8, r0
	cmp r3, r1
	bge _0808D67C
	ldr r4, _0808D6A0 @ =0x0200CBF0
	mov sb, r4
_0808D630:
	adds r7, r3, #1
	lsls r0, r7, #2
	mov r1, sb
	adds r6, r0, r1
	ldr r5, [r6]
	ldr r0, [r5]
	movs r2, #0x1d
	ldrsb r2, [r0, r2]
	ldr r0, [r0, #4]
	ldrb r0, [r0, #0x12]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r2, r2, r0
	lsls r0, r3, #2
	adds r3, r0, r1
	ldr r4, [r3]
	ldr r0, [r4]
	movs r1, #0x1d
	ldrsb r1, [r0, r1]
	ldr r0, [r0, #4]
	ldrb r0, [r0, #0x12]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r1, r1, r0
	cmp r2, r1
	bge _0808D66C
	str r5, [r3]
	str r4, [r6]
	movs r2, #1
	mov ip, r2
_0808D66C:
	lsls r0, r7, #0x18
	lsrs r3, r0, #0x18
	mov r4, sl
	ldrb r4, [r4]
	mov r6, r8
	subs r0, r4, r6
	cmp r3, r0
	blt _0808D630
_0808D67C:
	mov r7, r8
	lsls r0, r7, #0x18
	lsrs r1, r0, #0x18
	ldr r2, _0808D69C @ =0x0200E668
	ldrb r0, [r2]
	subs r0, #1
	cmp r1, r0
	blt _0808D61C
_0808D68C:
	mov r3, ip
_0808D68E:
	cmp r3, #0
	bne _0808D696
	bl _0808E330
_0808D696:
	movs r0, #1
	bl _0808E332
	.align 2, 0
_0808D69C: .4byte 0x0200E668
_0808D6A0: .4byte 0x0200CBF0
_0808D6A4:
	cmp r2, #0
	bne _0808D72C
	movs r4, #0
	mov sl, r4
	movs r1, #0
	ldr r6, _0808D724 @ =0x0200E668
	mov ip, r6
	ldrb r0, [r6]
	subs r0, #1
	cmp r2, r0
	blt _0808D6BE
	bl _0808E31E
_0808D6BE:
	adds r7, r6, #0
	mov sb, r7
_0808D6C2:
	movs r2, #0
	adds r0, r1, #1
	mov r3, sb
	ldrb r3, [r3]
	subs r1, r3, r0
	adds r7, r0, #0
	cmp r2, r1
	bge _0808D712
	ldr r4, _0808D728 @ =0x0200CBF0
	mov r8, r4
_0808D6D6:
	adds r6, r2, #1
	lsls r0, r6, #2
	mov r1, r8
	adds r5, r0, r1
	ldr r4, [r5]
	ldr r0, [r4]
	adds r0, #0x30
	ldrb r0, [r0]
	lsls r1, r0, #0x1c
	lsls r0, r2, #2
	mov r3, r8
	adds r2, r0, r3
	ldr r3, [r2]
	ldr r0, [r3]
	adds r0, #0x30
	ldrb r0, [r0]
	lsls r0, r0, #0x1c
	cmp r1, r0
	bls _0808D704
	str r4, [r2]
	str r3, [r5]
	movs r4, #1
	mov sl, r4
_0808D704:
	lsls r0, r6, #0x18
	lsrs r2, r0, #0x18
	mov r6, sb
	ldrb r6, [r6]
	subs r0, r6, r7
	cmp r2, r0
	blt _0808D6D6
_0808D712:
	lsls r0, r7, #0x18
	lsrs r1, r0, #0x18
	mov r7, ip
	ldrb r0, [r7]
	subs r0, #1
	cmp r1, r0
	blt _0808D6C2
	bl _0808E31E
	.align 2, 0
_0808D724: .4byte 0x0200E668
_0808D728: .4byte 0x0200CBF0
_0808D72C:
	movs r1, #0
	mov sl, r1
	ldr r2, _0808D7A8 @ =0x0200E668
	mov ip, r2
	ldrb r0, [r2]
	subs r0, #1
	cmp sl, r0
	blt _0808D740
	bl _0808E31E
_0808D740:
	adds r3, r2, #0
	mov sb, r3
_0808D744:
	movs r2, #0
	adds r0, r1, #1
	mov r4, sb
	ldrb r4, [r4]
	subs r1, r4, r0
	adds r7, r0, #0
	cmp r2, r1
	bge _0808D794
	ldr r6, _0808D7AC @ =0x0200CBF0
	mov r8, r6
_0808D758:
	adds r6, r2, #1
	lsls r0, r6, #2
	mov r1, r8
	adds r5, r0, r1
	ldr r4, [r5]
	ldr r0, [r4]
	adds r0, #0x30
	ldrb r0, [r0]
	lsls r1, r0, #0x1c
	lsls r0, r2, #2
	mov r3, r8
	adds r2, r0, r3
	ldr r3, [r2]
	ldr r0, [r3]
	adds r0, #0x30
	ldrb r0, [r0]
	lsls r0, r0, #0x1c
	cmp r1, r0
	bhs _0808D786
	str r4, [r2]
	str r3, [r5]
	movs r4, #1
	mov sl, r4
_0808D786:
	lsls r0, r6, #0x18
	lsrs r2, r0, #0x18
	mov r6, sb
	ldrb r6, [r6]
	subs r0, r6, r7
	cmp r2, r0
	blt _0808D758
_0808D794:
	lsls r0, r7, #0x18
	lsrs r1, r0, #0x18
	mov r7, ip
	ldrb r0, [r7]
	subs r0, #1
	cmp r1, r0
	blt _0808D744
	bl _0808E31E
	.align 2, 0
_0808D7A8: .4byte 0x0200E668
_0808D7AC: .4byte 0x0200CBF0
_0808D7B0:
	cmp r2, #0
	bne _0808D878
	movs r1, #0
	mov sb, r1
	movs r3, #0
	ldr r0, _0808D7E4 @ =0x0200E668
	ldrb r1, [r0]
	cmp r2, r1
	bhs _0808D7FC
	ldr r6, _0808D7E8 @ =0x0200CBF0
	adds r2, r1, #0
	movs r5, #0x10
	movs r4, #1
_0808D7CA:
	lsls r0, r3, #2
	adds r0, r0, r6
	ldr r0, [r0]
	ldr r0, [r0]
	ldr r1, [r0, #0xc]
	ands r1, r5
	cmp r1, #0
	beq _0808D7EC
	mov r7, sp
	adds r0, r7, r3
	strb r4, [r0]
	b _0808D7F2
	.align 2, 0
_0808D7E4: .4byte 0x0200E668
_0808D7E8: .4byte 0x0200CBF0
_0808D7EC:
	mov r7, sp
	adds r0, r7, r3
	strb r1, [r0]
_0808D7F2:
	adds r0, r3, #1
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	cmp r3, r2
	blo _0808D7CA
_0808D7FC:
	movs r3, #0
	ldr r1, _0808D870 @ =0x0200E668
	ldrb r0, [r1]
	subs r0, #1
	cmp r3, r0
	bge _0808D868
	mov r8, r1
	ldr r2, _0808D874 @ =0x0200CBF0
	mov ip, r2
	mov sl, r8
_0808D810:
	movs r2, #0
	adds r0, r3, #1
	mov r3, r8
	ldrb r3, [r3]
	subs r1, r3, r0
	adds r6, r0, #0
	cmp r2, r1
	bge _0808D85A
	mov r7, ip
_0808D822:
	adds r5, r2, #1
	mov r0, sp
	adds r4, r0, r5
	adds r1, r0, r2
	ldrb r3, [r4]
	ldrb r0, [r1]
	cmp r3, r0
	bls _0808D84C
	ldrb r0, [r1]
	strb r3, [r1]
	strb r0, [r4]
	lsls r2, r2, #2
	adds r2, r2, r7
	ldr r3, [r2]
	lsls r1, r5, #2
	adds r1, r1, r7
	ldr r0, [r1]
	str r0, [r2]
	str r3, [r1]
	movs r1, #1
	mov sb, r1
_0808D84C:
	lsls r0, r5, #0x18
	lsrs r2, r0, #0x18
	mov r3, r8
	ldrb r3, [r3]
	subs r0, r3, r6
	cmp r2, r0
	blt _0808D822
_0808D85A:
	lsls r0, r6, #0x18
	lsrs r3, r0, #0x18
	mov r4, sl
	ldrb r0, [r4]
	subs r0, #1
	cmp r3, r0
	blt _0808D810
_0808D868:
	mov r6, sb
	bl _0808E210
	.align 2, 0
_0808D870: .4byte 0x0200E668
_0808D874: .4byte 0x0200CBF0
_0808D878:
	movs r7, #0
	mov sb, r7
	movs r3, #0
	ldr r0, _0808D8A8 @ =0x0200E668
	ldrb r1, [r0]
	cmp sb, r1
	bhs _0808D8C0
	ldr r6, _0808D8AC @ =0x0200CBF0
	adds r2, r1, #0
	movs r5, #0x10
	movs r4, #1
_0808D88E:
	lsls r0, r3, #2
	adds r0, r0, r6
	ldr r0, [r0]
	ldr r0, [r0]
	ldr r1, [r0, #0xc]
	ands r1, r5
	cmp r1, #0
	beq _0808D8B0
	mov r1, sp
	adds r0, r1, r3
	strb r4, [r0]
	b _0808D8B6
	.align 2, 0
_0808D8A8: .4byte 0x0200E668
_0808D8AC: .4byte 0x0200CBF0
_0808D8B0:
	mov r7, sp
	adds r0, r7, r3
	strb r1, [r0]
_0808D8B6:
	adds r0, r3, #1
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	cmp r3, r2
	blo _0808D88E
_0808D8C0:
	movs r3, #0
	ldr r1, _0808D934 @ =0x0200E668
	ldrb r0, [r1]
	subs r0, #1
	cmp r3, r0
	bge _0808D92C
	mov r8, r1
	ldr r2, _0808D938 @ =0x0200CBF0
	mov ip, r2
	mov sl, r8
_0808D8D4:
	movs r2, #0
	adds r0, r3, #1
	mov r3, r8
	ldrb r3, [r3]
	subs r1, r3, r0
	adds r6, r0, #0
	cmp r2, r1
	bge _0808D91E
	mov r7, ip
_0808D8E6:
	adds r5, r2, #1
	mov r0, sp
	adds r4, r0, r5
	adds r1, r0, r2
	ldrb r3, [r4]
	ldrb r0, [r1]
	cmp r3, r0
	bhs _0808D910
	ldrb r0, [r1]
	strb r3, [r1]
	strb r0, [r4]
	lsls r2, r2, #2
	adds r2, r2, r7
	ldr r3, [r2]
	lsls r1, r5, #2
	adds r1, r1, r7
	ldr r0, [r1]
	str r0, [r2]
	str r3, [r1]
	movs r1, #1
	mov sb, r1
_0808D910:
	lsls r0, r5, #0x18
	lsrs r2, r0, #0x18
	mov r3, r8
	ldrb r3, [r3]
	subs r0, r3, r6
	cmp r2, r0
	blt _0808D8E6
_0808D91E:
	lsls r0, r6, #0x18
	lsrs r3, r0, #0x18
	mov r4, sl
	ldrb r0, [r4]
	subs r0, #1
	cmp r3, r0
	blt _0808D8D4
_0808D92C:
	mov r6, sb
	bl _0808E210
	.align 2, 0
_0808D934: .4byte 0x0200E668
_0808D938: .4byte 0x0200CBF0
_0808D93C:
	cmp r2, #0
	bne _0808D9C0
	movs r7, #0
	mov sl, r7
	movs r1, #0
	ldr r0, _0808D9B8 @ =0x0200E668
	mov ip, r0
	ldrb r0, [r0]
	subs r0, #1
	cmp r2, r0
	blt _0808D956
	bl _0808E31E
_0808D956:
	ldr r2, _0808D9B8 @ =0x0200E668
	mov sb, r2
_0808D95A:
	movs r2, #0
	adds r0, r1, #1
	mov r3, sb
	ldrb r3, [r3]
	subs r1, r3, r0
	adds r7, r0, #0
	cmp r2, r1
	bge _0808D9A6
	ldr r4, _0808D9BC @ =0x0200CBF0
	mov r8, r4
_0808D96E:
	adds r6, r2, #1
	lsls r0, r6, #2
	mov r1, r8
	adds r5, r0, r1
	ldr r4, [r5]
	ldr r1, [r4]
	adds r1, #0x28
	lsls r0, r2, #2
	mov r3, r8
	adds r2, r0, r3
	ldr r3, [r2]
	ldr r0, [r3]
	adds r0, #0x28
	ldrb r1, [r1]
	ldrb r0, [r0]
	cmp r1, r0
	bls _0808D998
	str r4, [r2]
	str r3, [r5]
	movs r4, #1
	mov sl, r4
_0808D998:
	lsls r0, r6, #0x18
	lsrs r2, r0, #0x18
	mov r6, sb
	ldrb r6, [r6]
	subs r0, r6, r7
	cmp r2, r0
	blt _0808D96E
_0808D9A6:
	lsls r0, r7, #0x18
	lsrs r1, r0, #0x18
	mov r7, ip
	ldrb r0, [r7]
	subs r0, #1
	cmp r1, r0
	blt _0808D95A
	bl _0808E31E
	.align 2, 0
_0808D9B8: .4byte 0x0200E668
_0808D9BC: .4byte 0x0200CBF0
_0808D9C0:
	movs r1, #0
	mov sl, r1
	ldr r2, _0808DA38 @ =0x0200E668
	mov ip, r2
	ldrb r0, [r2]
	subs r0, #1
	cmp sl, r0
	blt _0808D9D4
	bl _0808E31E
_0808D9D4:
	adds r3, r2, #0
	mov sb, r3
_0808D9D8:
	movs r2, #0
	adds r0, r1, #1
	mov r4, sb
	ldrb r4, [r4]
	subs r1, r4, r0
	adds r7, r0, #0
	cmp r2, r1
	bge _0808DA24
	ldr r6, _0808DA3C @ =0x0200CBF0
	mov r8, r6
_0808D9EC:
	adds r6, r2, #1
	lsls r0, r6, #2
	mov r1, r8
	adds r5, r0, r1
	ldr r4, [r5]
	ldr r1, [r4]
	adds r1, #0x28
	lsls r0, r2, #2
	mov r3, r8
	adds r2, r0, r3
	ldr r3, [r2]
	ldr r0, [r3]
	adds r0, #0x28
	ldrb r1, [r1]
	ldrb r0, [r0]
	cmp r1, r0
	bhs _0808DA16
	str r4, [r2]
	str r3, [r5]
	movs r4, #1
	mov sl, r4
_0808DA16:
	lsls r0, r6, #0x18
	lsrs r2, r0, #0x18
	mov r6, sb
	ldrb r6, [r6]
	subs r0, r6, r7
	cmp r2, r0
	blt _0808D9EC
_0808DA24:
	lsls r0, r7, #0x18
	lsrs r1, r0, #0x18
	mov r7, ip
	ldrb r0, [r7]
	subs r0, #1
	cmp r1, r0
	blt _0808D9D8
	bl _0808E31E
	.align 2, 0
_0808DA38: .4byte 0x0200E668
_0808DA3C: .4byte 0x0200CBF0
_0808DA40:
	cmp r2, #0
	bne _0808DAC4
	movs r1, #0
	mov sl, r1
	ldr r3, _0808DABC @ =0x0200E668
	mov ip, r3
	ldrb r0, [r3]
	subs r0, #1
	cmp r2, r0
	blt _0808DA58
	bl _0808E31E
_0808DA58:
	adds r4, r3, #0
	mov sb, r4
_0808DA5C:
	movs r2, #0
	adds r0, r1, #1
	mov r6, sb
	ldrb r6, [r6]
	subs r1, r6, r0
	adds r7, r0, #0
	cmp r2, r1
	bge _0808DAA8
	ldr r0, _0808DAC0 @ =0x0200CBF0
	mov r8, r0
_0808DA70:
	adds r6, r2, #1
	lsls r0, r6, #2
	mov r1, r8
	adds r5, r0, r1
	ldr r4, [r5]
	ldr r1, [r4]
	adds r1, #0x29
	lsls r0, r2, #2
	mov r3, r8
	adds r2, r0, r3
	ldr r3, [r2]
	ldr r0, [r3]
	adds r0, #0x29
	ldrb r1, [r1]
	ldrb r0, [r0]
	cmp r1, r0
	bls _0808DA9A
	str r4, [r2]
	str r3, [r5]
	movs r4, #1
	mov sl, r4
_0808DA9A:
	lsls r0, r6, #0x18
	lsrs r2, r0, #0x18
	mov r6, sb
	ldrb r6, [r6]
	subs r0, r6, r7
	cmp r2, r0
	blt _0808DA70
_0808DAA8:
	lsls r0, r7, #0x18
	lsrs r1, r0, #0x18
	mov r7, ip
	ldrb r0, [r7]
	subs r0, #1
	cmp r1, r0
	blt _0808DA5C
	bl _0808E31E
	.align 2, 0
_0808DABC: .4byte 0x0200E668
_0808DAC0: .4byte 0x0200CBF0
_0808DAC4:
	movs r1, #0
	mov sl, r1
	ldr r2, _0808DB3C @ =0x0200E668
	mov ip, r2
	ldrb r0, [r2]
	subs r0, #1
	cmp sl, r0
	blt _0808DAD8
	bl _0808E31E
_0808DAD8:
	adds r3, r2, #0
	mov sb, r3
_0808DADC:
	movs r2, #0
	adds r0, r1, #1
	mov r4, sb
	ldrb r4, [r4]
	subs r1, r4, r0
	adds r7, r0, #0
	cmp r2, r1
	bge _0808DB28
	ldr r6, _0808DB40 @ =0x0200CBF0
	mov r8, r6
_0808DAF0:
	adds r6, r2, #1
	lsls r0, r6, #2
	mov r1, r8
	adds r5, r0, r1
	ldr r4, [r5]
	ldr r1, [r4]
	adds r1, #0x29
	lsls r0, r2, #2
	mov r3, r8
	adds r2, r0, r3
	ldr r3, [r2]
	ldr r0, [r3]
	adds r0, #0x29
	ldrb r1, [r1]
	ldrb r0, [r0]
	cmp r1, r0
	bhs _0808DB1A
	str r4, [r2]
	str r3, [r5]
	movs r4, #1
	mov sl, r4
_0808DB1A:
	lsls r0, r6, #0x18
	lsrs r2, r0, #0x18
	mov r6, sb
	ldrb r6, [r6]
	subs r0, r6, r7
	cmp r2, r0
	blt _0808DAF0
_0808DB28:
	lsls r0, r7, #0x18
	lsrs r1, r0, #0x18
	mov r7, ip
	ldrb r0, [r7]
	subs r0, #1
	cmp r1, r0
	blt _0808DADC
	bl _0808E31E
	.align 2, 0
_0808DB3C: .4byte 0x0200E668
_0808DB40: .4byte 0x0200CBF0
_0808DB44:
	cmp r2, #0
	bne _0808DBC4
	movs r1, #0
	mov sl, r1
	ldr r3, _0808DBBC @ =0x0200E668
	mov ip, r3
	ldrb r0, [r3]
	subs r0, #1
	cmp r2, r0
	blt _0808DB5A
	b _0808E31E
_0808DB5A:
	adds r4, r3, #0
	mov sb, r4
_0808DB5E:
	movs r2, #0
	adds r0, r1, #1
	mov r6, sb
	ldrb r6, [r6]
	subs r1, r6, r0
	adds r7, r0, #0
	cmp r2, r1
	bge _0808DBAA
	ldr r0, _0808DBC0 @ =0x0200CBF0
	mov r8, r0
_0808DB72:
	adds r6, r2, #1
	lsls r0, r6, #2
	mov r1, r8
	adds r5, r0, r1
	ldr r4, [r5]
	ldr r1, [r4]
	adds r1, #0x2a
	lsls r0, r2, #2
	mov r3, r8
	adds r2, r0, r3
	ldr r3, [r2]
	ldr r0, [r3]
	adds r0, #0x2a
	ldrb r1, [r1]
	ldrb r0, [r0]
	cmp r1, r0
	bls _0808DB9C
	str r4, [r2]
	str r3, [r5]
	movs r4, #1
	mov sl, r4
_0808DB9C:
	lsls r0, r6, #0x18
	lsrs r2, r0, #0x18
	mov r6, sb
	ldrb r6, [r6]
	subs r0, r6, r7
	cmp r2, r0
	blt _0808DB72
_0808DBAA:
	lsls r0, r7, #0x18
	lsrs r1, r0, #0x18
	mov r7, ip
	ldrb r0, [r7]
	subs r0, #1
	cmp r1, r0
	blt _0808DB5E
	b _0808E31E
	.align 2, 0
_0808DBBC: .4byte 0x0200E668
_0808DBC0: .4byte 0x0200CBF0
_0808DBC4:
	movs r1, #0
	mov sl, r1
	ldr r2, _0808DC38 @ =0x0200E668
	mov ip, r2
	ldrb r0, [r2]
	subs r0, #1
	cmp sl, r0
	blt _0808DBD6
	b _0808E31E
_0808DBD6:
	adds r3, r2, #0
	mov sb, r3
_0808DBDA:
	movs r2, #0
	adds r0, r1, #1
	mov r4, sb
	ldrb r4, [r4]
	subs r1, r4, r0
	adds r7, r0, #0
	cmp r2, r1
	bge _0808DC26
	ldr r6, _0808DC3C @ =0x0200CBF0
	mov r8, r6
_0808DBEE:
	adds r6, r2, #1
	lsls r0, r6, #2
	mov r1, r8
	adds r5, r0, r1
	ldr r4, [r5]
	ldr r1, [r4]
	adds r1, #0x2a
	lsls r0, r2, #2
	mov r3, r8
	adds r2, r0, r3
	ldr r3, [r2]
	ldr r0, [r3]
	adds r0, #0x2a
	ldrb r1, [r1]
	ldrb r0, [r0]
	cmp r1, r0
	bhs _0808DC18
	str r4, [r2]
	str r3, [r5]
	movs r4, #1
	mov sl, r4
_0808DC18:
	lsls r0, r6, #0x18
	lsrs r2, r0, #0x18
	mov r6, sb
	ldrb r6, [r6]
	subs r0, r6, r7
	cmp r2, r0
	blt _0808DBEE
_0808DC26:
	lsls r0, r7, #0x18
	lsrs r1, r0, #0x18
	mov r7, ip
	ldrb r0, [r7]
	subs r0, #1
	cmp r1, r0
	blt _0808DBDA
	b _0808E31E
	.align 2, 0
_0808DC38: .4byte 0x0200E668
_0808DC3C: .4byte 0x0200CBF0
_0808DC40:
	cmp r2, #0
	bne _0808DCC0
	movs r1, #0
	mov sl, r1
	ldr r3, _0808DCB8 @ =0x0200E668
	mov ip, r3
	ldrb r0, [r3]
	subs r0, #1
	cmp r2, r0
	blt _0808DC56
	b _0808E31E
_0808DC56:
	adds r4, r3, #0
	mov sb, r4
_0808DC5A:
	movs r2, #0
	adds r0, r1, #1
	mov r6, sb
	ldrb r6, [r6]
	subs r1, r6, r0
	adds r7, r0, #0
	cmp r2, r1
	bge _0808DCA6
	ldr r0, _0808DCBC @ =0x0200CBF0
	mov r8, r0
_0808DC6E:
	adds r6, r2, #1
	lsls r0, r6, #2
	mov r1, r8
	adds r5, r0, r1
	ldr r4, [r5]
	ldr r1, [r4]
	adds r1, #0x2b
	lsls r0, r2, #2
	mov r3, r8
	adds r2, r0, r3
	ldr r3, [r2]
	ldr r0, [r3]
	adds r0, #0x2b
	ldrb r1, [r1]
	ldrb r0, [r0]
	cmp r1, r0
	bls _0808DC98
	str r4, [r2]
	str r3, [r5]
	movs r4, #1
	mov sl, r4
_0808DC98:
	lsls r0, r6, #0x18
	lsrs r2, r0, #0x18
	mov r6, sb
	ldrb r6, [r6]
	subs r0, r6, r7
	cmp r2, r0
	blt _0808DC6E
_0808DCA6:
	lsls r0, r7, #0x18
	lsrs r1, r0, #0x18
	mov r7, ip
	ldrb r0, [r7]
	subs r0, #1
	cmp r1, r0
	blt _0808DC5A
	b _0808E31E
	.align 2, 0
_0808DCB8: .4byte 0x0200E668
_0808DCBC: .4byte 0x0200CBF0
_0808DCC0:
	movs r1, #0
	mov sl, r1
	ldr r2, _0808DD34 @ =0x0200E668
	mov ip, r2
	ldrb r0, [r2]
	subs r0, #1
	cmp sl, r0
	blt _0808DCD2
	b _0808E31E
_0808DCD2:
	adds r3, r2, #0
	mov sb, r3
_0808DCD6:
	movs r2, #0
	adds r0, r1, #1
	mov r4, sb
	ldrb r4, [r4]
	subs r1, r4, r0
	adds r7, r0, #0
	cmp r2, r1
	bge _0808DD22
	ldr r6, _0808DD38 @ =0x0200CBF0
	mov r8, r6
_0808DCEA:
	adds r6, r2, #1
	lsls r0, r6, #2
	mov r1, r8
	adds r5, r0, r1
	ldr r4, [r5]
	ldr r1, [r4]
	adds r1, #0x2b
	lsls r0, r2, #2
	mov r3, r8
	adds r2, r0, r3
	ldr r3, [r2]
	ldr r0, [r3]
	adds r0, #0x2b
	ldrb r1, [r1]
	ldrb r0, [r0]
	cmp r1, r0
	bhs _0808DD14
	str r4, [r2]
	str r3, [r5]
	movs r4, #1
	mov sl, r4
_0808DD14:
	lsls r0, r6, #0x18
	lsrs r2, r0, #0x18
	mov r6, sb
	ldrb r6, [r6]
	subs r0, r6, r7
	cmp r2, r0
	blt _0808DCEA
_0808DD22:
	lsls r0, r7, #0x18
	lsrs r1, r0, #0x18
	mov r7, ip
	ldrb r0, [r7]
	subs r0, #1
	cmp r1, r0
	blt _0808DCD6
	b _0808E31E
	.align 2, 0
_0808DD34: .4byte 0x0200E668
_0808DD38: .4byte 0x0200CBF0
_0808DD3C:
	cmp r2, #0
	bne _0808DDBC
	movs r1, #0
	mov sl, r1
	ldr r3, _0808DDB4 @ =0x0200E668
	mov ip, r3
	ldrb r0, [r3]
	subs r0, #1
	cmp r2, r0
	blt _0808DD52
	b _0808E31E
_0808DD52:
	adds r4, r3, #0
	mov sb, r4
_0808DD56:
	movs r2, #0
	adds r0, r1, #1
	mov r6, sb
	ldrb r6, [r6]
	subs r1, r6, r0
	adds r7, r0, #0
	cmp r2, r1
	bge _0808DDA2
	ldr r0, _0808DDB8 @ =0x0200CBF0
	mov r8, r0
_0808DD6A:
	adds r6, r2, #1
	lsls r0, r6, #2
	mov r1, r8
	adds r5, r0, r1
	ldr r4, [r5]
	ldr r1, [r4]
	adds r1, #0x2c
	lsls r0, r2, #2
	mov r3, r8
	adds r2, r0, r3
	ldr r3, [r2]
	ldr r0, [r3]
	adds r0, #0x2c
	ldrb r1, [r1]
	ldrb r0, [r0]
	cmp r1, r0
	bls _0808DD94
	str r4, [r2]
	str r3, [r5]
	movs r4, #1
	mov sl, r4
_0808DD94:
	lsls r0, r6, #0x18
	lsrs r2, r0, #0x18
	mov r6, sb
	ldrb r6, [r6]
	subs r0, r6, r7
	cmp r2, r0
	blt _0808DD6A
_0808DDA2:
	lsls r0, r7, #0x18
	lsrs r1, r0, #0x18
	mov r7, ip
	ldrb r0, [r7]
	subs r0, #1
	cmp r1, r0
	blt _0808DD56
	b _0808E31E
	.align 2, 0
_0808DDB4: .4byte 0x0200E668
_0808DDB8: .4byte 0x0200CBF0
_0808DDBC:
	movs r1, #0
	mov sl, r1
	ldr r2, _0808DE30 @ =0x0200E668
	mov ip, r2
	ldrb r0, [r2]
	subs r0, #1
	cmp sl, r0
	blt _0808DDCE
	b _0808E31E
_0808DDCE:
	adds r3, r2, #0
	mov sb, r3
_0808DDD2:
	movs r2, #0
	adds r0, r1, #1
	mov r4, sb
	ldrb r4, [r4]
	subs r1, r4, r0
	adds r7, r0, #0
	cmp r2, r1
	bge _0808DE1E
	ldr r6, _0808DE34 @ =0x0200CBF0
	mov r8, r6
_0808DDE6:
	adds r6, r2, #1
	lsls r0, r6, #2
	mov r1, r8
	adds r5, r0, r1
	ldr r4, [r5]
	ldr r1, [r4]
	adds r1, #0x2c
	lsls r0, r2, #2
	mov r3, r8
	adds r2, r0, r3
	ldr r3, [r2]
	ldr r0, [r3]
	adds r0, #0x2c
	ldrb r1, [r1]
	ldrb r0, [r0]
	cmp r1, r0
	bhs _0808DE10
	str r4, [r2]
	str r3, [r5]
	movs r4, #1
	mov sl, r4
_0808DE10:
	lsls r0, r6, #0x18
	lsrs r2, r0, #0x18
	mov r6, sb
	ldrb r6, [r6]
	subs r0, r6, r7
	cmp r2, r0
	blt _0808DDE6
_0808DE1E:
	lsls r0, r7, #0x18
	lsrs r1, r0, #0x18
	mov r7, ip
	ldrb r0, [r7]
	subs r0, #1
	cmp r1, r0
	blt _0808DDD2
	b _0808E31E
	.align 2, 0
_0808DE30: .4byte 0x0200E668
_0808DE34: .4byte 0x0200CBF0
_0808DE38:
	cmp r2, #0
	bne _0808DEB8
	movs r1, #0
	mov sl, r1
	ldr r3, _0808DEB0 @ =0x0200E668
	mov ip, r3
	ldrb r0, [r3]
	subs r0, #1
	cmp r2, r0
	blt _0808DE4E
	b _0808E31E
_0808DE4E:
	adds r4, r3, #0
	mov sb, r4
_0808DE52:
	movs r2, #0
	adds r0, r1, #1
	mov r6, sb
	ldrb r6, [r6]
	subs r1, r6, r0
	adds r7, r0, #0
	cmp r2, r1
	bge _0808DE9E
	ldr r0, _0808DEB4 @ =0x0200CBF0
	mov r8, r0
_0808DE66:
	adds r6, r2, #1
	lsls r0, r6, #2
	mov r1, r8
	adds r5, r0, r1
	ldr r4, [r5]
	ldr r1, [r4]
	adds r1, #0x2d
	lsls r0, r2, #2
	mov r3, r8
	adds r2, r0, r3
	ldr r3, [r2]
	ldr r0, [r3]
	adds r0, #0x2d
	ldrb r1, [r1]
	ldrb r0, [r0]
	cmp r1, r0
	bls _0808DE90
	str r4, [r2]
	str r3, [r5]
	movs r4, #1
	mov sl, r4
_0808DE90:
	lsls r0, r6, #0x18
	lsrs r2, r0, #0x18
	mov r6, sb
	ldrb r6, [r6]
	subs r0, r6, r7
	cmp r2, r0
	blt _0808DE66
_0808DE9E:
	lsls r0, r7, #0x18
	lsrs r1, r0, #0x18
	mov r7, ip
	ldrb r0, [r7]
	subs r0, #1
	cmp r1, r0
	blt _0808DE52
	b _0808E31E
	.align 2, 0
_0808DEB0: .4byte 0x0200E668
_0808DEB4: .4byte 0x0200CBF0
_0808DEB8:
	movs r1, #0
	mov sl, r1
	ldr r2, _0808DF2C @ =0x0200E668
	mov ip, r2
	ldrb r0, [r2]
	subs r0, #1
	cmp sl, r0
	blt _0808DECA
	b _0808E31E
_0808DECA:
	adds r3, r2, #0
	mov sb, r3
_0808DECE:
	movs r2, #0
	adds r0, r1, #1
	mov r4, sb
	ldrb r4, [r4]
	subs r1, r4, r0
	adds r7, r0, #0
	cmp r2, r1
	bge _0808DF1A
	ldr r6, _0808DF30 @ =0x0200CBF0
	mov r8, r6
_0808DEE2:
	adds r6, r2, #1
	lsls r0, r6, #2
	mov r1, r8
	adds r5, r0, r1
	ldr r4, [r5]
	ldr r1, [r4]
	adds r1, #0x2d
	lsls r0, r2, #2
	mov r3, r8
	adds r2, r0, r3
	ldr r3, [r2]
	ldr r0, [r3]
	adds r0, #0x2d
	ldrb r1, [r1]
	ldrb r0, [r0]
	cmp r1, r0
	bhs _0808DF0C
	str r4, [r2]
	str r3, [r5]
	movs r4, #1
	mov sl, r4
_0808DF0C:
	lsls r0, r6, #0x18
	lsrs r2, r0, #0x18
	mov r6, sb
	ldrb r6, [r6]
	subs r0, r6, r7
	cmp r2, r0
	blt _0808DEE2
_0808DF1A:
	lsls r0, r7, #0x18
	lsrs r1, r0, #0x18
	mov r7, ip
	ldrb r0, [r7]
	subs r0, #1
	cmp r1, r0
	blt _0808DECE
	b _0808E31E
	.align 2, 0
_0808DF2C: .4byte 0x0200E668
_0808DF30: .4byte 0x0200CBF0
_0808DF34:
	cmp r2, #0
	bne _0808DFB4
	movs r1, #0
	mov sl, r1
	ldr r3, _0808DFAC @ =0x0200E668
	mov ip, r3
	ldrb r0, [r3]
	subs r0, #1
	cmp r2, r0
	blt _0808DF4A
	b _0808E31E
_0808DF4A:
	adds r4, r3, #0
	mov sb, r4
_0808DF4E:
	movs r2, #0
	adds r0, r1, #1
	mov r6, sb
	ldrb r6, [r6]
	subs r1, r6, r0
	adds r7, r0, #0
	cmp r2, r1
	bge _0808DF9A
	ldr r0, _0808DFB0 @ =0x0200CBF0
	mov r8, r0
_0808DF62:
	adds r6, r2, #1
	lsls r0, r6, #2
	mov r1, r8
	adds r5, r0, r1
	ldr r4, [r5]
	ldr r1, [r4]
	adds r1, #0x2e
	lsls r0, r2, #2
	mov r3, r8
	adds r2, r0, r3
	ldr r3, [r2]
	ldr r0, [r3]
	adds r0, #0x2e
	ldrb r1, [r1]
	ldrb r0, [r0]
	cmp r1, r0
	bls _0808DF8C
	str r4, [r2]
	str r3, [r5]
	movs r4, #1
	mov sl, r4
_0808DF8C:
	lsls r0, r6, #0x18
	lsrs r2, r0, #0x18
	mov r6, sb
	ldrb r6, [r6]
	subs r0, r6, r7
	cmp r2, r0
	blt _0808DF62
_0808DF9A:
	lsls r0, r7, #0x18
	lsrs r1, r0, #0x18
	mov r7, ip
	ldrb r0, [r7]
	subs r0, #1
	cmp r1, r0
	blt _0808DF4E
	b _0808E31E
	.align 2, 0
_0808DFAC: .4byte 0x0200E668
_0808DFB0: .4byte 0x0200CBF0
_0808DFB4:
	movs r1, #0
	mov sl, r1
	ldr r2, _0808E028 @ =0x0200E668
	mov ip, r2
	ldrb r0, [r2]
	subs r0, #1
	cmp sl, r0
	blt _0808DFC6
	b _0808E31E
_0808DFC6:
	adds r3, r2, #0
	mov sb, r3
_0808DFCA:
	movs r2, #0
	adds r0, r1, #1
	mov r4, sb
	ldrb r4, [r4]
	subs r1, r4, r0
	adds r7, r0, #0
	cmp r2, r1
	bge _0808E016
	ldr r6, _0808E02C @ =0x0200CBF0
	mov r8, r6
_0808DFDE:
	adds r6, r2, #1
	lsls r0, r6, #2
	mov r1, r8
	adds r5, r0, r1
	ldr r4, [r5]
	ldr r1, [r4]
	adds r1, #0x2e
	lsls r0, r2, #2
	mov r3, r8
	adds r2, r0, r3
	ldr r3, [r2]
	ldr r0, [r3]
	adds r0, #0x2e
	ldrb r1, [r1]
	ldrb r0, [r0]
	cmp r1, r0
	bhs _0808E008
	str r4, [r2]
	str r3, [r5]
	movs r4, #1
	mov sl, r4
_0808E008:
	lsls r0, r6, #0x18
	lsrs r2, r0, #0x18
	mov r6, sb
	ldrb r6, [r6]
	subs r0, r6, r7
	cmp r2, r0
	blt _0808DFDE
_0808E016:
	lsls r0, r7, #0x18
	lsrs r1, r0, #0x18
	mov r7, ip
	ldrb r0, [r7]
	subs r0, #1
	cmp r1, r0
	blt _0808DFCA
	b _0808E31E
	.align 2, 0
_0808E028: .4byte 0x0200E668
_0808E02C: .4byte 0x0200CBF0
_0808E030:
	cmp r2, #0
	bne _0808E0B0
	movs r1, #0
	mov sl, r1
	ldr r3, _0808E0A8 @ =0x0200E668
	mov ip, r3
	ldrb r0, [r3]
	subs r0, #1
	cmp r2, r0
	blt _0808E046
	b _0808E31E
_0808E046:
	adds r4, r3, #0
	mov sb, r4
_0808E04A:
	movs r2, #0
	adds r0, r1, #1
	mov r6, sb
	ldrb r6, [r6]
	subs r1, r6, r0
	adds r7, r0, #0
	cmp r2, r1
	bge _0808E096
	ldr r0, _0808E0AC @ =0x0200CBF0
	mov r8, r0
_0808E05E:
	adds r6, r2, #1
	lsls r0, r6, #2
	mov r1, r8
	adds r5, r0, r1
	ldr r4, [r5]
	ldr r1, [r4]
	adds r1, #0x2f
	lsls r0, r2, #2
	mov r3, r8
	adds r2, r0, r3
	ldr r3, [r2]
	ldr r0, [r3]
	adds r0, #0x2f
	ldrb r1, [r1]
	ldrb r0, [r0]
	cmp r1, r0
	bls _0808E088
	str r4, [r2]
	str r3, [r5]
	movs r4, #1
	mov sl, r4
_0808E088:
	lsls r0, r6, #0x18
	lsrs r2, r0, #0x18
	mov r6, sb
	ldrb r6, [r6]
	subs r0, r6, r7
	cmp r2, r0
	blt _0808E05E
_0808E096:
	lsls r0, r7, #0x18
	lsrs r1, r0, #0x18
	mov r7, ip
	ldrb r0, [r7]
	subs r0, #1
	cmp r1, r0
	blt _0808E04A
	b _0808E31E
	.align 2, 0
_0808E0A8: .4byte 0x0200E668
_0808E0AC: .4byte 0x0200CBF0
_0808E0B0:
	movs r1, #0
	mov sl, r1
	ldr r2, _0808E124 @ =0x0200E668
	mov ip, r2
	ldrb r0, [r2]
	subs r0, #1
	cmp sl, r0
	blt _0808E0C2
	b _0808E31E
_0808E0C2:
	adds r3, r2, #0
	mov sb, r3
_0808E0C6:
	movs r2, #0
	adds r0, r1, #1
	mov r4, sb
	ldrb r4, [r4]
	subs r1, r4, r0
	adds r7, r0, #0
	cmp r2, r1
	bge _0808E112
	ldr r6, _0808E128 @ =0x0200CBF0
	mov r8, r6
_0808E0DA:
	adds r6, r2, #1
	lsls r0, r6, #2
	mov r1, r8
	adds r5, r0, r1
	ldr r4, [r5]
	ldr r1, [r4]
	adds r1, #0x2f
	lsls r0, r2, #2
	mov r3, r8
	adds r2, r0, r3
	ldr r3, [r2]
	ldr r0, [r3]
	adds r0, #0x2f
	ldrb r1, [r1]
	ldrb r0, [r0]
	cmp r1, r0
	bhs _0808E104
	str r4, [r2]
	str r3, [r5]
	movs r4, #1
	mov sl, r4
_0808E104:
	lsls r0, r6, #0x18
	lsrs r2, r0, #0x18
	mov r6, sb
	ldrb r6, [r6]
	subs r0, r6, r7
	cmp r2, r0
	blt _0808E0DA
_0808E112:
	lsls r0, r7, #0x18
	lsrs r1, r0, #0x18
	mov r7, ip
	ldrb r0, [r7]
	subs r0, #1
	cmp r1, r0
	blt _0808E0C6
	b _0808E31E
	.align 2, 0
_0808E124: .4byte 0x0200E668
_0808E128: .4byte 0x0200CBF0
_0808E12C:
	cmp r2, #0
	bne _0808E1A4
	movs r1, #0
	mov sl, r1
	ldr r3, _0808E19C @ =0x0200E668
	mov ip, r3
	ldrb r0, [r3]
	subs r0, #1
	cmp r2, r0
	bge _0808E20E
	adds r4, r3, #0
	mov sb, r4
_0808E144:
	movs r4, #0
	adds r0, r1, #1
	mov r6, sb
	ldrb r6, [r6]
	subs r1, r6, r0
	mov r8, r0
	cmp r4, r1
	bge _0808E188
	ldr r6, _0808E1A0 @ =0x0200CBF0
	mov r7, r8
	str r7, [sp, #0x64]
_0808E15A:
	adds r5, r4, #1
	lsls r0, r5, #2
	adds r3, r0, r6
	ldr r2, [r3]
	lsls r0, r4, #2
	adds r0, r0, r6
	ldr r1, [r0]
	ldrb r4, [r2, #0xa]
	ldrb r7, [r1, #0xa]
	cmp r4, r7
	bls _0808E178
	str r2, [r0]
	str r1, [r3]
	movs r0, #1
	mov sl, r0
_0808E178:
	lsls r0, r5, #0x18
	lsrs r4, r0, #0x18
	mov r1, sb
	ldrb r1, [r1]
	ldr r2, [sp, #0x64]
	subs r0, r1, r2
	cmp r4, r0
	blt _0808E15A
_0808E188:
	mov r3, r8
	lsls r0, r3, #0x18
	lsrs r1, r0, #0x18
	mov r4, ip
	ldrb r0, [r4]
	subs r0, #1
	cmp r1, r0
	blt _0808E144
	b _0808E20E
	.align 2, 0
_0808E19C: .4byte 0x0200E668
_0808E1A0: .4byte 0x0200CBF0
_0808E1A4:
	movs r7, #0
	mov sl, r7
	movs r1, #0
	ldr r0, _0808E21C @ =0x0200E668
	mov ip, r0
	ldrb r0, [r0]
	subs r0, #1
	cmp sl, r0
	bge _0808E20E
	ldr r2, _0808E21C @ =0x0200E668
	mov sb, r2
_0808E1BA:
	movs r4, #0
	adds r0, r1, #1
	mov r3, sb
	ldrb r3, [r3]
	subs r1, r3, r0
	mov r8, r0
	cmp r4, r1
	bge _0808E1FE
	ldr r6, _0808E220 @ =0x0200CBF0
	mov r7, r8
	str r7, [sp, #0x64]
_0808E1D0:
	adds r5, r4, #1
	lsls r0, r5, #2
	adds r3, r0, r6
	ldr r2, [r3]
	lsls r0, r4, #2
	adds r0, r0, r6
	ldr r1, [r0]
	ldrb r4, [r2, #0xa]
	ldrb r7, [r1, #0xa]
	cmp r4, r7
	bhs _0808E1EE
	str r2, [r0]
	str r1, [r3]
	movs r0, #1
	mov sl, r0
_0808E1EE:
	lsls r0, r5, #0x18
	lsrs r4, r0, #0x18
	mov r1, sb
	ldrb r1, [r1]
	ldr r2, [sp, #0x64]
	subs r0, r1, r2
	cmp r4, r0
	blt _0808E1D0
_0808E1FE:
	mov r3, r8
	lsls r0, r3, #0x18
	lsrs r1, r0, #0x18
	mov r4, ip
	ldrb r0, [r4]
	subs r0, #1
	cmp r1, r0
	blt _0808E1BA
_0808E20E:
	mov r6, sl
_0808E210:
	cmp r6, #0
	bne _0808E216
	b _0808E330
_0808E216:
	movs r0, #1
	b _0808E332
	.align 2, 0
_0808E21C: .4byte 0x0200E668
_0808E220: .4byte 0x0200CBF0
_0808E224:
	cmp r2, #0
	bne _0808E2AC
	movs r7, #0
	mov sl, r7
	movs r1, #0
	ldr r2, _0808E2A4 @ =0x0200E668
	ldrb r0, [r2]
	subs r0, #1
	cmp sl, r0
	bge _0808E29A
_0808E238:
	movs r5, #0
	adds r0, r1, #1
	ldrb r2, [r2]
	subs r1, r2, r0
	mov r8, r0
	cmp r5, r1
	bge _0808E28A
	ldr r0, _0808E2A8 @ =0x0200CBF0
	mov sb, r0
_0808E24A:
	adds r7, r5, #1
	lsls r0, r7, #2
	mov r1, sb
	adds r6, r0, r1
	ldr r0, [r6]
	ldr r0, [r0]
	bl sub_808BF14
	adds r4, r0, #0
	lsls r0, r5, #2
	mov r2, sb
	adds r5, r0, r2
	ldr r0, [r5]
	ldr r0, [r0]
	bl sub_808BF14
	cmp r4, r0
	ble _0808E27A
	ldr r1, [r5]
	ldr r0, [r6]
	str r0, [r5]
	str r1, [r6]
	movs r3, #1
	mov sl, r3
_0808E27A:
	lsls r0, r7, #0x18
	lsrs r5, r0, #0x18
	ldr r0, _0808E2A4 @ =0x0200E668
	ldrb r0, [r0]
	mov r4, r8
	subs r0, r0, r4
	cmp r5, r0
	blt _0808E24A
_0808E28A:
	mov r6, r8
	lsls r0, r6, #0x18
	lsrs r1, r0, #0x18
	ldr r2, _0808E2A4 @ =0x0200E668
	ldrb r0, [r2]
	subs r0, #1
	cmp r1, r0
	blt _0808E238
_0808E29A:
	mov r7, sl
_0808E29C:
	cmp r7, #0
	beq _0808E330
	movs r0, #1
	b _0808E332
	.align 2, 0
_0808E2A4: .4byte 0x0200E668
_0808E2A8: .4byte 0x0200CBF0
_0808E2AC:
	movs r0, #0
	mov sl, r0
	movs r2, #0
	ldr r1, _0808E328 @ =0x0200E668
	ldrb r0, [r1]
	subs r0, #1
	cmp sl, r0
	bge _0808E31E
_0808E2BC:
	movs r5, #0
	adds r0, r2, #1
	ldrb r1, [r1]
	subs r1, r1, r0
	mov r8, r0
	cmp r5, r1
	bge _0808E30E
	ldr r1, _0808E32C @ =0x0200CBF0
	mov sb, r1
_0808E2CE:
	adds r7, r5, #1
	lsls r0, r7, #2
	mov r2, sb
	adds r6, r0, r2
	ldr r0, [r6]
	ldr r0, [r0]
	bl sub_808BF14
	adds r4, r0, #0
	lsls r0, r5, #2
	mov r3, sb
	adds r5, r0, r3
	ldr r0, [r5]
	ldr r0, [r0]
	bl sub_808BF14
	cmp r4, r0
	bge _0808E2FE
	ldr r1, [r5]
	ldr r0, [r6]
	str r0, [r5]
	str r1, [r6]
	movs r4, #1
	mov sl, r4
_0808E2FE:
	lsls r0, r7, #0x18
	lsrs r5, r0, #0x18
	ldr r0, _0808E328 @ =0x0200E668
	ldrb r0, [r0]
	mov r6, r8
	subs r0, r0, r6
	cmp r5, r0
	blt _0808E2CE
_0808E30E:
	mov r7, r8
	lsls r0, r7, #0x18
	lsrs r2, r0, #0x18
	ldr r1, _0808E328 @ =0x0200E668
	ldrb r0, [r1]
	subs r0, #1
	cmp r2, r0
	blt _0808E2BC
_0808E31E:
	mov r0, sl
	cmp r0, #0
	beq _0808E330
	movs r0, #1
	b _0808E332
	.align 2, 0
_0808E328: .4byte 0x0200E668
_0808E32C: .4byte 0x0200CBF0
_0808E330:
	movs r0, #0
_0808E332:
	add sp, #0x68
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_808E344
sub_808E344: @ 0x0808E344
	push {r4, lr}
	bl sub_80908E8
	adds r4, r0, #0
	bl CheckInLinkArena
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0808E368
	ldr r0, _0808E364 @ =gUnk_08D8C0B8
	lsls r1, r4, #1
	adds r1, r1, r4
	lsls r1, r1, #2
	adds r0, #8
	b _0808E3A0
	.align 2, 0
_0808E364: .4byte gUnk_08D8C0B8
_0808E368:
	ldr r0, _0808E37C @ =gPlaySt
	ldrb r1, [r0, #0xe]
	cmp r1, #0x2e
	bne _0808E380
	cmp r4, #7
	bne _0808E380
	movs r0, #0xfd
	lsls r0, r0, #2
	b _0808E3A4
	.align 2, 0
_0808E37C: .4byte gPlaySt
_0808E380:
	ldrb r0, [r0, #0x1b]
	cmp r0, #1
	beq _0808E398
	ldr r0, _0808E394 @ =gUnk_08D8C0B8
	lsls r1, r4, #1
	adds r1, r1, r4
	lsls r1, r1, #2
	adds r0, #4
	b _0808E3A0
	.align 2, 0
_0808E394: .4byte gUnk_08D8C0B8
_0808E398:
	ldr r0, _0808E3AC @ =gUnk_08D8C0B8
	lsls r1, r4, #1
	adds r1, r1, r4
	lsls r1, r1, #2
_0808E3A0:
	adds r1, r1, r0
	ldr r0, [r1]
_0808E3A4:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0808E3AC: .4byte gUnk_08D8C0B8

	thumb_func_start sub_808E3B0
sub_808E3B0: @ 0x0808E3B0
	push {r4, r5, lr}
	adds r4, r0, #0
	movs r3, #0
	movs r2, #0
	movs r5, #1
_0808E3BA:
	adds r0, r1, #0
	asrs r0, r2
	ands r0, r5
	cmp r0, #0
	beq _0808E3CE
	cmp r4, r3
	bne _0808E3CC
	adds r0, r2, #0
	b _0808E3D8
_0808E3CC:
	adds r3, #1
_0808E3CE:
	adds r2, #1
	cmp r2, #3
	ble _0808E3BA
	movs r0, #1
	rsbs r0, r0, #0
_0808E3D8:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_808E3E0
sub_808E3E0: @ 0x0808E3E0
	push {r4, lr}
	adds r3, r0, #0
	movs r2, #0
	movs r1, #0
	movs r4, #1
_0808E3EA:
	adds r0, r3, #0
	asrs r0, r1
	ands r0, r4
	cmp r0, #0
	beq _0808E3F6
	adds r2, #1
_0808E3F6:
	adds r1, #1
	cmp r1, #3
	ble _0808E3EA
	adds r0, r2, #0
	pop {r4}
	pop {r1}
	bx r1

	thumb_func_start sub_808E404
sub_808E404: @ 0x0808E404
	push {r4, r5, r6, lr}
	sub sp, #0x10
	adds r2, r0, #0
	adds r4, r1, #0
	mov r1, sp
	ldr r0, _0808E448 @ =gUnk_0842CF1C
	ldm r0!, {r3, r5, r6}
	stm r1!, {r3, r5, r6}
	ldr r0, [r0]
	str r0, [r1]
	ldr r0, _0808E44C @ =gUnk_0841EF4C
	movs r1, #0xc0
	lsls r1, r1, #0x13
	adds r2, r2, r1
	adds r1, r2, #0
	bl Decompress
	ldr r1, _0808E450 @ =gPlaySt
	adds r1, #0x41
	movs r0, #0xc
	ldrb r1, [r1]
	ands r0, r1
	add r0, sp
	ldr r0, [r0]
	lsls r4, r4, #5
	adds r1, r4, #0
	movs r2, #0x20
	bl ApplyPaletteExt
	add sp, #0x10
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0808E448: .4byte gUnk_0842CF1C
_0808E44C: .4byte gUnk_0841EF4C
_0808E450: .4byte gPlaySt

	thumb_func_start sub_808E454
sub_808E454: @ 0x0808E454
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	mov r8, r0
	adds r7, r1, #0
	mov sb, r2
	mov sl, r3
	ldr r1, _0808E4C8 @ =gUnk_0842162C
	lsls r0, r2, #0xf
	lsrs r0, r0, #0x14
	movs r3, #0x80
	lsls r3, r3, #5
	adds r2, r3, #0
	adds r0, r0, r2
	lsls r6, r0, #0x10
	lsrs r2, r6, #0x10
	mov r0, r8
	bl TmApplyTsa_thm
	movs r5, #0
	cmp r5, r7
	bge _0808E49E
	mov r4, r8
	adds r4, #0x40
	adds r5, r7, #0
_0808E48A:
	adds r0, r4, #0
	ldr r1, _0808E4CC @ =gUnk_08421644
	lsrs r2, r6, #0x10
	bl TmApplyTsa_thm
	adds r4, #0x80
	subs r5, #1
	cmp r5, #0
	bne _0808E48A
	adds r5, r7, #0
_0808E49E:
	lsls r0, r5, #7
	add r0, r8
	adds r0, #0x40
	ldr r1, _0808E4D0 @ =gUnk_08421684
	mov r4, sl
	lsls r2, r4, #0xc
	mov r4, sb
	lsls r3, r4, #0xf
	lsrs r3, r3, #0x14
	adds r2, r2, r3
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	bl TmApplyTsa_thm
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0808E4C8: .4byte gUnk_0842162C
_0808E4CC: .4byte gUnk_08421644
_0808E4D0: .4byte gUnk_08421684

	thumb_func_start sub_808E4D4
sub_808E4D4: @ 0x0808E4D4
	push {lr}
	adds r2, r0, #0
	adds r2, #0x33
	movs r1, #1
	strb r1, [r2]
	movs r1, #0xa
	bl Proc_Goto
	pop {r0}
	bx r0

	thumb_func_start sub_808E4E8
sub_808E4E8: @ 0x0808E4E8
	push {lr}
	adds r2, r0, #0
	adds r2, #0x33
	movs r1, #2
	strb r1, [r2]
	movs r1, #0xa
	bl Proc_Goto
	pop {r0}
	bx r0

	thumb_func_start sub_808E4FC
sub_808E4FC: @ 0x0808E4FC
	push {lr}
	movs r1, #0xc
	bl Proc_Goto
	ldr r0, _0808E51C @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0808E516
	ldr r0, _0808E520 @ =0x0000038A
	bl m4aSongNumStart
_0808E516:
	pop {r0}
	bx r0
	.align 2, 0
_0808E51C: .4byte gPlaySt
_0808E520: .4byte 0x0000038A

	thumb_func_start sub_808E524
sub_808E524: @ 0x0808E524
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0808E550 @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0808E53A
	ldr r0, _0808E554 @ =0x0000038A
	bl m4aSongNumStart
_0808E53A:
	adds r1, r4, #0
	adds r1, #0x33
	movs r0, #3
	strb r0, [r1]
	adds r0, r4, #0
	movs r1, #8
	bl Proc_Goto
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0808E550: .4byte gPlaySt
_0808E554: .4byte 0x0000038A

	thumb_func_start sub_808E558
sub_808E558: @ 0x0808E558
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x2b
	ldrb r0, [r0]
	cmp r0, #0
	beq _0808E574
	bl sub_80903A8
	adds r0, r4, #0
	movs r1, #0xb
	bl Proc_Goto
	movs r0, #1
	b _0808E576
_0808E574:
	movs r0, #0
_0808E576:
	pop {r4}
	pop {r1}
	bx r1

	thumb_func_start sub_808E57C
sub_808E57C: @ 0x0808E57C
	push {lr}
	movs r1, #5
	bl Proc_Goto
	pop {r0}
	bx r0

	thumb_func_start sub_808E588
sub_808E588: @ 0x0808E588
	push {r4, lr}
	adds r4, r0, #0
	bl CheckInLinkArena
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0808E59E
	bl sub_808E8C8
	cmp r0, #0
	beq _0808E5AA
_0808E59E:
	adds r0, r4, #0
	movs r1, #5
	bl Proc_Goto
	movs r0, #1
	b _0808E5AC
_0808E5AA:
	movs r0, #0
_0808E5AC:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_808E5B4
sub_808E5B4: @ 0x0808E5B4
	push {lr}
	movs r1, #5
	bl Proc_Goto
	pop {r0}
	bx r0

	thumb_func_start nullsub_74
nullsub_74: @ 0x0808E5C0
	bx lr
	.align 2, 0

	thumb_func_start nullsub_75
nullsub_75: @ 0x0808E5C4
	bx lr
	.align 2, 0

	thumb_func_start sub_808E5C8
sub_808E5C8: @ 0x0808E5C8
	ldr r1, _0808E5D8 @ =0x0203E760
	movs r2, #0
	adds r0, r1, #4
_0808E5CE:
	strb r2, [r0]
	subs r0, #1
	cmp r0, r1
	bge _0808E5CE
	bx lr
	.align 2, 0
_0808E5D8: .4byte 0x0203E760

	thumb_func_start sub_808E5DC
sub_808E5DC: @ 0x0808E5DC
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	movs r2, #0
	ldr r4, _0808E5F4 @ =0x0203E760
_0808E5E6:
	adds r1, r2, r4
	ldrb r0, [r1]
	cmp r0, #0
	bne _0808E5F8
	strb r3, [r1]
	b _0808E5FE
	.align 2, 0
_0808E5F4: .4byte 0x0203E760
_0808E5F8:
	adds r2, #1
	cmp r2, #4
	ble _0808E5E6
_0808E5FE:
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_808E604
sub_808E604: @ 0x0808E604
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	movs r1, #0
	ldr r3, _0808E634 @ =0x0203E760
	adds r4, r3, #0
_0808E610:
	adds r0, r1, r3
	ldrb r0, [r0]
	cmp r0, r2
	bne _0808E638
	adds r2, r1, #0
	cmp r1, #3
	bgt _0808E62C
	adds r1, r1, r4
_0808E620:
	ldrb r0, [r1, #1]
	strb r0, [r1]
	adds r1, #1
	adds r2, #1
	cmp r2, #3
	ble _0808E620
_0808E62C:
	movs r0, #0
	strb r0, [r3, #4]
	b _0808E63E
	.align 2, 0
_0808E634: .4byte 0x0203E760
_0808E638:
	adds r1, #1
	cmp r1, #4
	ble _0808E610
_0808E63E:
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_808E644
sub_808E644: @ 0x0808E644
	ldr r1, _0808E650 @ =0x020116DC
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	bx lr
	.align 2, 0
_0808E650: .4byte 0x020116DC

	thumb_func_start sub_808E654
sub_808E654: @ 0x0808E654
	ldr r2, _0808E660 @ =0x020116DC
	lsls r0, r0, #2
	adds r0, r0, r2
	str r1, [r0]
	bx lr
	.align 2, 0
_0808E660: .4byte 0x020116DC

	thumb_func_start sub_808E664
sub_808E664: @ 0x0808E664
	ldr r0, _0808E670 @ =0x020116DC
	movs r1, #0x80
	lsls r1, r1, #1
	adds r0, r0, r1
	ldr r0, [r0]
	bx lr
	.align 2, 0
_0808E670: .4byte 0x020116DC

	thumb_func_start sub_808E674
sub_808E674: @ 0x0808E674
	ldr r1, _0808E680 @ =0x020116DC
	movs r2, #0x80
	lsls r2, r2, #1
	adds r1, r1, r2
	str r0, [r1]
	bx lr
	.align 2, 0
_0808E680: .4byte 0x020116DC

	thumb_func_start sub_808E684
sub_808E684: @ 0x0808E684
	ldr r0, _0808E690 @ =0x020116DC
	movs r1, #0x82
	lsls r1, r1, #1
	adds r0, r0, r1
	ldr r0, [r0]
	bx lr
	.align 2, 0
_0808E690: .4byte 0x020116DC

	thumb_func_start sub_808E694
sub_808E694: @ 0x0808E694
	ldr r1, _0808E6A0 @ =0x020116DC
	movs r2, #0x82
	lsls r2, r2, #1
	adds r1, r1, r2
	str r0, [r1]
	bx lr
	.align 2, 0
_0808E6A0: .4byte 0x020116DC

	thumb_func_start sub_808E6A4
sub_808E6A4: @ 0x0808E6A4
	push {r4, lr}
	adds r4, r0, #0
	bl CheckInLinkArena
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0808E78A
	ldr r0, _0808E6C4 @ =gPlaySt
	ldrb r1, [r0, #0x1b]
	cmp r1, #2
	beq _0808E6D6
	cmp r1, #2
	bgt _0808E6C8
	cmp r1, #1
	beq _0808E6CE
	b _0808E6E0
	.align 2, 0
_0808E6C4: .4byte gPlaySt
_0808E6C8:
	cmp r1, #3
	beq _0808E6DC
	b _0808E6E0
_0808E6CE:
	cmp r4, #3
	bne _0808E6E0
_0808E6D2:
	movs r0, #1
	b _0808E78C
_0808E6D6:
	cmp r4, #1
	bne _0808E6E0
	b _0808E6D2
_0808E6DC:
	cmp r4, #2
	beq _0808E6D2
_0808E6E0:
	ldrb r0, [r0, #0xe]
	subs r0, #0x1a
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0x14
	bhi _0808E78A
	lsls r0, r0, #2
	ldr r1, _0808E6F8 @ =_0808E6FC
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0808E6F8: .4byte _0808E6FC
_0808E6FC: @ jump table
	.4byte _0808E762 @ case 0
	.4byte _0808E750 @ case 1
	.4byte _0808E762 @ case 2
	.4byte _0808E78A @ case 3
	.4byte _0808E756 @ case 4
	.4byte _0808E78A @ case 5
	.4byte _0808E78A @ case 6
	.4byte _0808E78A @ case 7
	.4byte _0808E762 @ case 8
	.4byte _0808E78A @ case 9
	.4byte _0808E78A @ case 10
	.4byte _0808E78A @ case 11
	.4byte _0808E75C @ case 12
	.4byte _0808E78A @ case 13
	.4byte _0808E78A @ case 14
	.4byte _0808E78A @ case 15
	.4byte _0808E762 @ case 16
	.4byte _0808E78A @ case 17
	.4byte _0808E770 @ case 18
	.4byte _0808E78A @ case 19
	.4byte _0808E776 @ case 20
_0808E750:
	cmp r4, #1
	bne _0808E78A
	b _0808E6D2
_0808E756:
	cmp r4, #0x22
	bne _0808E78A
	b _0808E6D2
_0808E75C:
	cmp r4, #0x14
	bne _0808E78A
	b _0808E6D2
_0808E762:
	cmp r4, #0x2d
	beq _0808E6D2
	cmp r4, #1
	beq _0808E6D2
	cmp r4, #2
	bne _0808E78A
	b _0808E6D2
_0808E770:
	cmp r4, #0x26
	bne _0808E78A
	b _0808E6D2
_0808E776:
	cmp r4, #0x2d
	beq _0808E6D2
	cmp r4, #1
	beq _0808E6D2
	cmp r4, #2
	beq _0808E6D2
	cmp r4, #0x26
	beq _0808E6D2
	cmp r4, #0x27
	beq _0808E6D2
_0808E78A:
	movs r0, #0
_0808E78C:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_808E794
sub_808E794: @ 0x0808E794
	push {r4, r5, lr}
	movs r5, #0
	movs r4, #1
_0808E79A:
	adds r0, r4, #0
	bl GetUnit
	cmp r0, #0
	beq _0808E7C2
	ldr r2, [r0]
	cmp r2, #0
	beq _0808E7C2
	ldr r0, [r0, #0xc]
	ldr r1, _0808E7D0 @ =0x00010004
	ands r0, r1
	cmp r0, #0
	bne _0808E7C2
	ldrb r0, [r2, #4]
	bl sub_808E6A4
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0808E7C2
	adds r5, #1
_0808E7C2:
	adds r4, #1
	cmp r4, #0x3f
	ble _0808E79A
	adds r0, r5, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_0808E7D0: .4byte 0x00010004

	thumb_func_start sub_808E7D4
sub_808E7D4: @ 0x0808E7D4
	adds r1, r0, #0
	ldr r0, _0808E7F0 @ =gPlaySt
	ldrb r0, [r0, #0xe]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0x2b
	bgt _0808E818
	cmp r0, #0x2a
	bge _0808E80C
	cmp r0, #9
	beq _0808E7F4
	cmp r0, #0x29
	beq _0808E800
	b _0808E818
	.align 2, 0
_0808E7F0: .4byte gPlaySt
_0808E7F4:
	ldr r0, [r1]
	ldrb r0, [r0, #4]
	cmp r0, #0x23
	bne _0808E818
	movs r0, #1
	b _0808E81A
_0808E800:
	ldr r0, [r1]
	ldrb r0, [r0, #4]
	cmp r0, #0xb
	bne _0808E818
	movs r0, #1
	b _0808E81A
_0808E80C:
	ldr r0, [r1]
	ldrb r0, [r0, #4]
	cmp r0, #0x26
	bne _0808E818
	movs r0, #1
	b _0808E81A
_0808E818:
	movs r0, #0
_0808E81A:
	bx lr

	thumb_func_start sub_808E81C
sub_808E81C: @ 0x0808E81C
	adds r2, r0, #0
	ldr r0, [r2, #0xc]
	ldr r1, _0808E840 @ =0x00010004
	ands r0, r1
	cmp r0, #0
	bne _0808E848
	ldr r0, [r2]
	ldr r1, [r2, #4]
	ldr r0, [r0, #0x28]
	ldr r1, [r1, #0x28]
	orrs r0, r1
	movs r1, #0x80
	lsls r1, r1, #2
	ands r0, r1
	cmp r0, #0
	bne _0808E844
	movs r0, #1
	b _0808E84A
	.align 2, 0
_0808E840: .4byte 0x00010004
_0808E844:
	movs r0, #8
	str r0, [r2, #0xc]
_0808E848:
	movs r0, #0
_0808E84A:
	bx lr

	thumb_func_start sub_808E84C
sub_808E84C: @ 0x0808E84C
	push {r4, r5, r6, lr}
	sub sp, #4
	movs r6, #0
	adds r1, r0, #0
	adds r1, #0x2f
	strb r6, [r1]
	ldr r2, _0808E87C @ =gPlaySt
	movs r0, #0x80
	ldrb r3, [r2, #0x14]
	ands r0, r3
	cmp r0, #0
	bne _0808E8B8
	ldrb r2, [r2, #0x1b]
	cmp r2, #1
	bne _0808E888
	ldr r1, _0808E880 @ =sub_808E4FC
	ldr r3, _0808E884 @ =0x0000113A
	str r6, [sp]
	movs r0, #4
	movs r2, #1
	bl sub_8090800
	b _0808E8B8
	.align 2, 0
_0808E87C: .4byte gPlaySt
_0808E880: .4byte sub_808E4FC
_0808E884: .4byte 0x0000113A
_0808E888:
	movs r4, #0
	adds r5, r1, #0
_0808E88C:
	adds r0, r4, #0
	bl sub_8099BB0
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0808E8A2
	movs r0, #1
	lsls r0, r4
	ldrb r1, [r5]
	orrs r0, r1
	strb r0, [r5]
_0808E8A2:
	adds r4, #1
	cmp r4, #3
	ble _0808E88C
	ldr r1, _0808E8C0 @ =sub_808E4FC
	ldr r3, _0808E8C4 @ =0x0000113A
	movs r0, #0
	str r0, [sp]
	movs r0, #4
	adds r2, r6, #0
	bl sub_8090800
_0808E8B8:
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0808E8C0: .4byte sub_808E4FC
_0808E8C4: .4byte 0x0000113A

	thumb_func_start sub_808E8C8
sub_808E8C8: @ 0x0808E8C8
	ldr r0, _0808E8D4 @ =gPlaySt
	ldrb r0, [r0, #0xe]
	cmp r0, #0x2e
	beq _0808E8D8
	movs r0, #1
	b _0808E8DA
	.align 2, 0
_0808E8D4: .4byte gPlaySt
_0808E8D8:
	movs r0, #0
_0808E8DA:
	bx lr

	thumb_func_start sub_808E8DC
sub_808E8DC: @ 0x0808E8DC
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	bl sub_8090788
	bl CheckInLinkArena
	lsls r0, r0, #0x18
	asrs r4, r0, #0x18
	cmp r4, #0
	bne _0808E98C
	ldr r1, _0808E930 @ =sub_808E4D4
	ldr r3, _0808E934 @ =0x00001131
	str r4, [sp]
	movs r0, #0
	movs r2, #0
	bl sub_8090800
	ldr r1, _0808E938 @ =sub_808E4E8
	ldr r3, _0808E93C @ =0x00001132
	str r4, [sp]
	movs r0, #1
	movs r2, #0
	bl sub_8090800
	adds r0, r5, #0
	bl sub_808E84C
	bl sub_808E8C8
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _0808E948
	ldr r1, _0808E940 @ =sub_808E5B4
	ldr r3, _0808E944 @ =0x00001135
	str r4, [sp]
	movs r0, #7
	movs r2, #0
	bl sub_8090800
	b _0808E956
	.align 2, 0
_0808E930: .4byte sub_808E4D4
_0808E934: .4byte 0x00001131
_0808E938: .4byte sub_808E4E8
_0808E93C: .4byte 0x00001132
_0808E940: .4byte sub_808E5B4
_0808E944: .4byte 0x00001135
_0808E948:
	ldr r1, _0808E978 @ =sub_808E5B4
	ldr r3, _0808E97C @ =0x00001135
	str r0, [sp]
	movs r0, #7
	movs r2, #1
	bl sub_8090800
_0808E956:
	ldr r1, _0808E980 @ =gPlaySt
	movs r0, #0x80
	ldrb r1, [r1, #0x14]
	ands r0, r1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0
	bne _0808E9B8
	ldr r1, _0808E984 @ =sub_808E524
	ldr r3, _0808E988 @ =0x00001134
	str r0, [sp]
	movs r0, #2
	movs r2, #0
	bl sub_8090800
	b _0808E9B8
	.align 2, 0
_0808E978: .4byte sub_808E5B4
_0808E97C: .4byte 0x00001135
_0808E980: .4byte gPlaySt
_0808E984: .4byte sub_808E524
_0808E988: .4byte 0x00001134
_0808E98C:
	ldr r1, _0808E9F8 @ =sub_808E4D4
	ldr r3, _0808E9FC @ =0x00001131
	movs r4, #0
	str r4, [sp]
	movs r0, #0
	movs r2, #0
	bl sub_8090800
	ldr r1, _0808EA00 @ =sub_808E4E8
	ldr r3, _0808EA04 @ =0x00001132
	str r4, [sp]
	movs r0, #1
	movs r2, #0
	bl sub_8090800
	ldr r1, _0808EA08 @ =sub_808E57C
	ldr r3, _0808EA0C @ =0x00001146
	str r4, [sp]
	movs r0, #3
	movs r2, #0
	bl sub_8090800
_0808E9B8:
	ldr r0, _0808EA10 @ =sub_808E588
	bl sub_80907AC
	ldr r0, _0808EA14 @ =sub_808E558
	bl sub_80907C8
	ldr r0, _0808EA18 @ =gBg0Tm
	movs r1, #0xc
	movs r2, #0x13
	movs r3, #0
	bl TmFillRect_thm
	ldr r0, _0808EA1C @ =gBg1Tm
	movs r1, #0xc
	movs r2, #0x13
	movs r3, #0
	bl TmFillRect_thm
	movs r0, #1
	movs r1, #4
	bl sub_8090930
	adds r0, r5, #0
	adds r0, #0x2d
	ldrb r0, [r0]
	bl sub_80908A8
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0808E9F8: .4byte sub_808E4D4
_0808E9FC: .4byte 0x00001131
_0808EA00: .4byte sub_808E4E8
_0808EA04: .4byte 0x00001132
_0808EA08: .4byte sub_808E57C
_0808EA0C: .4byte 0x00001146
_0808EA10: .4byte sub_808E588
_0808EA14: .4byte sub_808E558
_0808EA18: .4byte gBg0Tm
_0808EA1C: .4byte gBg1Tm

	thumb_func_start sub_808EA20
sub_808EA20: @ 0x0808EA20
	push {r4, r5, lr}
	movs r5, #0
	b _0808EA42
_0808EA26:
	bl GetLastStatScreenUnitId
	adds r4, r0, #0
	adds r0, r5, #0
	bl sub_808E644
	ldrb r0, [r0, #0xb]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r4, r0
	bne _0808EA40
	adds r0, r5, #0
	b _0808EA4C
_0808EA40:
	adds r5, #1
_0808EA42:
	bl sub_808E664
	cmp r5, r0
	blt _0808EA26
	movs r0, #0
_0808EA4C:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_808EA54
sub_808EA54: @ 0x0808EA54
	push {r4, r5, lr}
	movs r5, #0
	b _0808EA72
_0808EA5A:
	adds r0, r5, #0
	bl sub_808E644
	ldr r0, [r0]
	ldrb r4, [r0, #4]
	bl sub_808E684
	cmp r4, r0
	bne _0808EA70
	adds r0, r5, #0
	b _0808EA7C
_0808EA70:
	adds r5, #1
_0808EA72:
	bl sub_808E664
	cmp r5, r0
	blt _0808EA5A
	movs r0, #0
_0808EA7C:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_808EA84
sub_808EA84: @ 0x0808EA84
	push {r4, lr}
	ldr r0, _0808EAEC @ =0x020106DC
	bl InitUnitStack
	movs r4, #1
_0808EA8E:
	adds r0, r4, #0
	bl GetUnit
	adds r2, r0, #0
	cmp r2, #0
	beq _0808EAB0
	ldr r0, [r2]
	cmp r0, #0
	beq _0808EAB0
	ldr r0, [r2, #0xc]
	ldr r1, _0808EAF0 @ =0x0001000C
	ands r0, r1
	cmp r0, #0
	bne _0808EAB0
	adds r0, r2, #0
	bl PushUnit
_0808EAB0:
	adds r4, #1
	cmp r4, #0x3f
	ble _0808EA8E
	movs r4, #1
_0808EAB8:
	adds r0, r4, #0
	bl GetUnit
	adds r2, r0, #0
	cmp r2, #0
	beq _0808EADA
	ldr r0, [r2]
	cmp r0, #0
	beq _0808EADA
	ldr r0, [r2, #0xc]
	ldr r1, _0808EAF0 @ =0x0001000C
	ands r0, r1
	cmp r0, #0
	beq _0808EADA
	adds r0, r2, #0
	bl PushUnit
_0808EADA:
	adds r4, #1
	cmp r4, #0x3f
	ble _0808EAB8
	bl LoadPlayerUnitsFromUnitStack
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0808EAEC: .4byte 0x020106DC
_0808EAF0: .4byte 0x0001000C

	thumb_func_start sub_808EAF4
sub_808EAF4: @ 0x0808EAF4
	push {r4, r5, r6, r7, lr}
	bl sub_800EFB8
	adds r7, r0, #0
	movs r6, #0
	ldr r0, _0808EBB8 @ =0x020106DC
	bl InitUnitStack
	movs r5, #1
_0808EB06:
	adds r0, r5, #0
	bl GetUnit
	adds r4, r0, #0
	cmp r4, #0
	beq _0808EB40
	ldr r0, [r4]
	cmp r0, #0
	beq _0808EB40
	ldr r0, [r4, #0xc]
	ldr r1, _0808EBBC @ =0xFDFFFFFF
	ands r0, r1
	str r0, [r4, #0xc]
	adds r0, r4, #0
	bl sub_808E81C
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0808EB40
	ldr r0, [r4]
	ldrb r0, [r0, #4]
	bl sub_808E6A4
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0808EB40
	adds r0, r4, #0
	bl PushUnit
_0808EB40:
	adds r5, #1
	cmp r5, #0x3f
	ble _0808EB06
	movs r5, #1
_0808EB48:
	adds r0, r5, #0
	bl GetUnit
	adds r4, r0, #0
	cmp r4, #0
	beq _0808EB7A
	ldr r0, [r4]
	cmp r0, #0
	beq _0808EB7A
	adds r0, r4, #0
	bl sub_808E81C
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0808EB74
	ldr r0, [r4]
	ldrb r0, [r0, #4]
	bl sub_808E6A4
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0808EB7A
_0808EB74:
	adds r0, r4, #0
	bl PushUnit
_0808EB7A:
	adds r5, #1
	cmp r5, #0x3f
	ble _0808EB48
	bl LoadPlayerUnitsFromUnitStack
	movs r5, #1
_0808EB86:
	adds r0, r5, #0
	bl GetUnit
	adds r4, r0, #0
	cmp r4, #0
	beq _0808EBDE
	ldr r0, [r4]
	cmp r0, #0
	beq _0808EBDE
	adds r0, r4, #0
	bl sub_808E81C
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0808EBDE
	adds r0, r4, #0
	bl sub_808E7D4
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0808EBC4
	ldr r0, [r4, #0xc]
	ldr r1, _0808EBC0 @ =0x02000008
	b _0808EBDA
	.align 2, 0
_0808EBB8: .4byte 0x020106DC
_0808EBBC: .4byte 0xFDFFFFFF
_0808EBC0: .4byte 0x02000008
_0808EBC4:
	cmp r7, r6
	ble _0808EBD6
	ldr r0, [r4, #0xc]
	movs r1, #9
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r4, #0xc]
	adds r6, #1
	b _0808EBDE
_0808EBD6:
	ldr r0, [r4, #0xc]
	movs r1, #8
_0808EBDA:
	orrs r0, r1
	str r0, [r4, #0xc]
_0808EBDE:
	adds r5, #1
	cmp r5, #0x3f
	ble _0808EB86
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_808EBEC
sub_808EBEC: @ 0x0808EBEC
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	movs r4, #1
_0808EBF6:
	adds r0, r4, #0
	bl GetUnit
	adds r5, r0, #0
	adds r4, #1
	mov r8, r4
	cmp r5, #0
	beq _0808EC5C
	ldr r0, [r5]
	cmp r0, #0
	beq _0808EC5C
	movs r2, #0
	ldr r0, [r5, #0xc]
	movs r1, #8
	orrs r0, r1
	str r0, [r5, #0xc]
	adds r0, r5, #0
	str r2, [sp]
	bl GetUnitItemCount
	adds r7, r0, #0
	movs r6, #0
	ldr r2, [sp]
	cmp r2, r7
	bge _0808EC52
_0808EC28:
	lsls r0, r6, #1
	adds r1, r5, #0
	adds r1, #0x1e
	adds r4, r1, r0
	ldrh r0, [r4]
	str r2, [sp]
	bl GetItemIndex
	ldr r2, [sp]
	cmp r0, #0x80
	blt _0808EC4C
	cmp r0, #0x83
	ble _0808EC46
	cmp r0, #0x8a
	bne _0808EC4C
_0808EC46:
	movs r0, #0
	strh r0, [r4]
	movs r2, #1
_0808EC4C:
	adds r6, #1
	cmp r6, r7
	blt _0808EC28
_0808EC52:
	cmp r2, #0
	beq _0808EC5C
	adds r0, r5, #0
	bl UnitRemoveInvalidItems
_0808EC5C:
	mov r4, r8
	cmp r4, #0x3f
	ble _0808EBF6
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_808EC70
sub_808EC70: @ 0x0808EC70
	push {r4, r5, r6, lr}
	movs r6, #0
	movs r5, #1
_0808EC76:
	adds r0, r5, #0
	bl GetUnit
	adds r4, r0, #0
	cmp r4, #0
	beq _0808EC9E
	ldr r0, [r4]
	cmp r0, #0
	beq _0808EC9E
	adds r0, r4, #0
	bl sub_808E81C
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0808EC9E
	adds r0, r6, #0
	adds r1, r4, #0
	bl sub_808E654
	adds r6, #1
_0808EC9E:
	adds r5, #1
	cmp r5, #0x3f
	ble _0808EC76
	adds r0, r6, #0
	bl sub_808E674
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	thumb_func_start sub_808ECB0
sub_808ECB0: @ 0x0808ECB0
	push {r4, r5, lr}
	adds r5, r0, #0
	movs r4, #0
	b _0808ECCC
_0808ECB8:
	adds r0, r4, #0
	bl sub_808E644
	ldr r0, [r0]
	ldrb r0, [r0, #4]
	cmp r0, r5
	bne _0808ECCA
	adds r0, r4, #0
	b _0808ECD6
_0808ECCA:
	adds r4, #1
_0808ECCC:
	bl sub_808E664
	cmp r4, r0
	blt _0808ECB8
	movs r0, #0
_0808ECD6:
	pop {r4, r5}
	pop {r1}
	bx r1

	thumb_func_start sub_808ECDC
sub_808ECDC: @ 0x0808ECDC
	push {r4, lr}
	bl ResetUnitSprites
	movs r4, #0
	b _0808ED12
_0808ECE6:
	adds r0, r4, #0
	bl sub_808E644
	adds r2, r0, #0
	ldr r1, [r2, #0xc]
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	bne _0808ED00
	movs r0, #3
	rsbs r0, r0, #0
	ands r1, r0
	b _0808ED04
_0808ED00:
	movs r0, #0xa
	orrs r1, r0
_0808ED04:
	str r1, [r2, #0xc]
	adds r0, r2, #0
	bl GetUnitSMSId
	bl sub_8025278
	adds r4, #1
_0808ED12:
	bl sub_808E664
	cmp r4, r0
	blt _0808ECE6
	bl ForceSyncUnitSpriteSheet
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_808ED24
sub_808ED24: @ 0x0808ED24
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	adds r1, r4, #0
	adds r1, #0x2b
	movs r0, #0
	strb r0, [r1]
	subs r1, #2
	strb r0, [r1]
	movs r6, #0
	adds r7, r1, #0
	b _0808ED6C
_0808ED3A:
	adds r0, r6, #0
	bl sub_808E644
	adds r3, r0, #0
	ldr r0, [r3, #0xc]
	movs r5, #8
	ands r0, r5
	cmp r0, #0
	bne _0808ED64
	adds r2, r4, #0
	adds r2, #0x2b
	adds r1, r4, #0
	adds r1, #0x2a
	ldrb r0, [r2]
	ldrb r1, [r1]
	cmp r0, r1
	blo _0808ED60
	str r5, [r3, #0xc]
	b _0808ED64
_0808ED60:
	adds r0, #1
	strb r0, [r2]
_0808ED64:
	ldrb r0, [r7]
	adds r0, #1
	strb r0, [r7]
	adds r6, #1
_0808ED6C:
	bl sub_808E664
	cmp r6, r0
	blt _0808ED3A
	adds r2, r4, #0
	adds r2, #0x29
	adds r0, r4, #0
	adds r0, #0x2a
	ldrb r2, [r2]
	ldrb r1, [r0]
	cmp r2, r1
	bhs _0808ED86
	strb r2, [r0]
_0808ED86:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_808ED8C
sub_808ED8C: @ 0x0808ED8C
	push {lr}
	bl CheckInLinkArena
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0808EDA4
	movs r0, #0
	movs r1, #0
	movs r2, #0xa
	bl StartMuralBackgroundAlt
	b _0808EDAC
_0808EDA4:
	movs r0, #0
	movs r1, #0xa
	bl sub_80910B0
_0808EDAC:
	pop {r0}
	bx r0

	thumb_func_start EndMuralBackground_
EndMuralBackground_: @ 0x0808EDB0
	push {lr}
	bl CheckInLinkArena
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0808EDC2
	bl EndMuralBackground
	b _0808EDC6
_0808EDC2:
	bl sub_8091104
_0808EDC6:
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start nullsub_76
nullsub_76: @ 0x0808EDCC
	bx lr
	.align 2, 0

	thumb_func_start sub_808EDD0
sub_808EDD0: @ 0x0808EDD0
	push {r4, r5, lr}
	sub sp, #0x20
	adds r2, r0, #0
	adds r4, r1, #0
	ldr r0, _0808EE48 @ =0x06010000
	adds r2, r2, r0
	mov r0, sp
	adds r1, r2, #0
	adds r2, r4, #0
	bl InitSpriteTextFont
	ldr r0, _0808EE4C @ =Pal_Text
	adds r4, #0x10
	lsls r4, r4, #5
	adds r1, r4, #0
	movs r2, #0x20
	bl ApplyPaletteExt
	add r5, sp, #0x18
	adds r0, r5, #0
	bl InitSpriteText
	mov r0, sp
	bl SetTextFont
	movs r0, #0
	bl SetTextFontGlyphs
	adds r0, r5, #0
	movs r1, #0
	bl SpriteText_DrawBackgroundExt
	ldr r0, _0808EE50 @ =gPlaySt
	ldrb r0, [r0, #0xe]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl GetChapterInfo
	adds r0, #0x8a
	ldrh r0, [r0]
	bl DecodeMsg
	adds r4, r0, #0
	movs r0, #0x60
	adds r1, r4, #0
	bl GetStringTextCenteredPos
	adds r1, r0, #0
	adds r0, r5, #0
	movs r2, #0
	adds r3, r4, #0
	bl Text_InsertDrawString
	movs r0, #0
	bl SetTextFont
	add sp, #0x20
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0808EE48: .4byte 0x06010000
_0808EE4C: .4byte Pal_Text
_0808EE50: .4byte gPlaySt

	thumb_func_start sub_808EE54
sub_808EE54: @ 0x0808EE54
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0
	bl sub_808E694
	movs r0, #0
	str r0, [r4, #0x40]
	strh r0, [r4, #0x3c]
	bl CheckInLinkArena
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0808EE76
	adds r1, r4, #0
	adds r1, #0x2a
	movs r0, #5
	b _0808EE7E
_0808EE76:
	bl sub_800EFB8
	adds r1, r4, #0
	adds r1, #0x2a
_0808EE7E:
	strb r0, [r1]
	adds r0, r4, #0
	adds r0, #0x30
	movs r1, #0
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r0, #2
	strb r1, [r0]
	subs r0, #9
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_808EEAC
sub_808EEAC: @ 0x0808EEAC
	push {r4, r5, lr}
	ldr r5, _0808EED8 @ =0x020106B4
	movs r4, #4
_0808EEB2:
	adds r0, r5, #0
	bl ClearText
	adds r5, #8
	subs r4, #1
	cmp r4, #0
	bge _0808EEB2
	ldr r0, _0808EEDC @ =gBg2Tm + 0x19c
	movs r1, #0xf
	movs r2, #0xa
	movs r3, #0
	bl TmFillRect_thm
	movs r0, #4
	bl EnableBgSync
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0808EED8: .4byte 0x020106B4
_0808EEDC: .4byte gBg2Tm + 0x19c

	thumb_func_start sub_808EEE0
sub_808EEE0: @ 0x0808EEE0
	push {r4, lr}
	ldr r4, _0808EEFC @ =0x020106B4
	bl DecodeMsg
_0808EEE8:
	adds r1, r0, #0
_0808EEEA:
	ldrb r0, [r1]
	cmp r0, #0
	beq _0808EF08
	cmp r0, #1
	bne _0808EF00
	adds r4, #8
	adds r1, #1
	b _0808EEEA
	.align 2, 0
_0808EEFC: .4byte 0x020106B4
_0808EF00:
	adds r0, r4, #0
	bl Text_DrawCharacter
	b _0808EEE8
_0808EF08:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_808EF10
sub_808EF10: @ 0x0808EF10
	push {r4, r5, r6, lr}
	movs r6, #0
	movs r5, #0xc0
	lsls r5, r5, #1
	ldr r4, _0808EF3C @ =0x020106B4
_0808EF1A:
	ldr r1, _0808EF40 @ =gBg2Tm + 0x1c
	adds r1, r5, r1
	adds r0, r4, #0
	bl PutText
	adds r5, #0x80
	adds r4, #8
	adds r6, #1
	cmp r6, #4
	ble _0808EF1A
	movs r0, #4
	bl EnableBgSync
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0808EF3C: .4byte 0x020106B4
_0808EF40: .4byte gBg2Tm + 0x1c

	thumb_func_start sub_808EF44
sub_808EF44: @ 0x0808EF44
	push {lr}
	adds r0, #0x4c
	movs r1, #0
	strh r1, [r0]
	bl sub_808EEAC
	pop {r0}
	bx r0

	thumb_func_start sub_808EF54
sub_808EF54: @ 0x0808EF54
	push {lr}
	ldr r0, [r0, #0x58]
	bl sub_808EEE0
	pop {r0}
	bx r0

	thumb_func_start sub_808EF60
sub_808EF60: @ 0x0808EF60
	push {lr}
	bl sub_808EF10
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_808EF6C
sub_808EF6C: @ 0x0808EF6C
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	adds r4, r1, #0
	ldr r5, _0808EF94 @ =gUnk_08D8C124
	adds r0, r5, #0
	bl Proc_Find
	cmp r0, #0
	beq _0808EF82
	bl Proc_End
_0808EF82:
	adds r0, r5, #0
	adds r1, r4, #0
	bl Proc_Start
	str r6, [r0, #0x58]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0808EF94: .4byte gUnk_08D8C124

	thumb_func_start sub_808EF98
sub_808EF98: @ 0x0808EF98
	push {r4, lr}
	adds r4, r0, #0
	bl EndSysBlackBoxs
	bl sub_80903E8
	bl EndMuralBackground_
	bl sub_80908E8
	adds r4, #0x2d
	strb r0, [r4]
	bl sub_80909F8
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_808EFBC
sub_808EFBC: @ 0x0808EFBC
	push {r4, lr}
	sub sp, #4
	adds r2, r0, #0
	adds r4, r1, #0
	ldr r0, _0808EFFC @ =gUnk_08428B00
	ldr r1, _0808F000 @ =0x06010000
	adds r2, r2, r1
	adds r1, r2, #0
	bl Decompress
	ldr r0, _0808F004 @ =gUnk_08428DB4
	adds r1, r4, #0
	adds r1, #0x10
	lsls r1, r1, #5
	movs r2, #0x20
	bl ApplyPaletteExt
	movs r0, #0
	str r0, [sp]
	adds r4, #1
	lsls r4, r4, #5
	ldr r0, _0808F008 @ =gPal + 0x200
	adds r4, r4, r0
	ldr r2, _0808F00C @ =0x01000008
	mov r0, sp
	adds r1, r4, #0
	bl CpuFastSet
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0808EFFC: .4byte gUnk_08428B00
_0808F000: .4byte 0x06010000
_0808F004: .4byte gUnk_08428DB4
_0808F008: .4byte gPal + 0x200
_0808F00C: .4byte 0x01000008

	thumb_func_start sub_808F010
sub_808F010: @ 0x0808F010
	push {r4, r5, r6, r7, lr}
	sub sp, #8
	adds r6, r0, #0
	ldr r0, _0808F1F8 @ =gUnk_08D8C0A0
	bl InitBgs
	bl ResetText
	bl UnpackUiWindowFrameGraphics
	movs r0, #0
	movs r1, #0xe
	bl LoadHelpBoxGfx
	ldr r2, _0808F1FC @ =gDispIo
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
	bl ApplySystemObjectsGraphics
	bl ResetUnitSprites
	bl sub_808EC70
	adds r0, r6, #0
	bl sub_808ED24
	bl sub_808EA84
	ldr r0, _0808F200 @ =gBg0Tm
	movs r1, #0
	bl TmFill
	ldr r0, _0808F204 @ =gBg1Tm
	movs r1, #0
	bl TmFill
	ldr r0, _0808F208 @ =gBg2Tm
	movs r1, #0
	bl TmFill
	ldr r5, _0808F20C @ =0x020106B4
	movs r4, #4
_0808F07C:
	adds r0, r5, #0
	movs r1, #0xe
	bl InitText
	adds r5, #8
	subs r4, #1
	cmp r4, #0
	bge _0808F07C
	adds r7, r6, #0
	adds r7, #0x35
	ldr r5, _0808F210 @ =0x02010694
	movs r4, #3
_0808F094:
	adds r0, r5, #0
	movs r1, #8
	bl InitText
	adds r5, #8
	subs r4, #1
	cmp r4, #0
	bge _0808F094
	ldr r0, _0808F214 @ =0x0201068C
	movs r1, #0xa
	bl InitText
	ldr r0, _0808F218 @ =gUnk_0841E814
	ldr r1, _0808F21C @ =0x06014800
	bl Decompress
	ldr r0, _0808F220 @ =Pal_SysBrownBox
	movs r1, #0x90
	lsls r1, r1, #2
	movs r2, #0x40
	bl ApplyPaletteExt
	movs r0, #0xe0
	lsls r0, r0, #7
	movs r1, #6
	bl sub_808EFBC
	ldr r0, _0808F224 @ =gUnk_084292A0
	ldr r1, _0808F228 @ =0x06016000
	bl Decompress
	ldr r0, _0808F22C @ =gUnk_084291AC
	movs r1, #0xa0
	lsls r1, r1, #2
	movs r2, #0x20
	bl ApplyPaletteExt
	bl EnablePalSync
	ldr r4, _0808F1FC @ =gDispIo
	movs r1, #4
	rsbs r1, r1, #0
	adds r0, r1, #0
	ldrb r2, [r4, #0xc]
	ands r0, r2
	strb r0, [r4, #0xc]
	adds r0, r1, #0
	ldrb r2, [r4, #0x10]
	ands r0, r2
	movs r2, #2
	orrs r0, r2
	strb r0, [r4, #0x10]
	ldrb r0, [r4, #0x14]
	ands r1, r0
	movs r0, #1
	orrs r1, r0
	strb r1, [r4, #0x14]
	movs r0, #3
	ldrb r1, [r4, #0x18]
	orrs r0, r1
	strb r0, [r4, #0x18]
	movs r0, #0x21
	rsbs r0, r0, #0
	ldrb r2, [r4, #1]
	ands r0, r2
	movs r1, #0x41
	rsbs r1, r1, #0
	ands r0, r1
	movs r1, #0x7f
	ands r0, r1
	strb r0, [r4, #1]
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
	adds r0, r6, #0
	bl sub_808E8DC
	movs r0, #0xf
	bl EnableBgSync
	adds r2, r4, #0
	adds r2, #0x3c
	movs r0, #0x3f
	ldrb r1, [r2]
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r2]
	adds r1, r4, #0
	adds r1, #0x44
	movs r2, #0
	movs r0, #0xe
	strb r0, [r1]
	adds r1, #1
	movs r0, #8
	strb r0, [r1]
	adds r0, r4, #0
	adds r0, #0x46
	strb r2, [r0]
	ldr r0, _0808F230 @ =0x0000FFE0
	ldrh r2, [r4, #0x3c]
	ands r0, r2
	ldr r1, _0808F234 @ =0x0000E0FF
	ands r0, r1
	movs r2, #0x80
	lsls r2, r2, #4
	adds r1, r2, #0
	orrs r0, r1
	strh r0, [r4, #0x3c]
	adds r0, r6, #0
	bl sub_80903C4
	bl sub_808ED8C
	ldr r0, _0808F238 @ =gUnk_0841D100
	movs r1, #0x60
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r0, _0808F23C @ =gUnk_0841D120
	ldr r1, _0808F240 @ =0x06007800
	bl Decompress
	ldr r0, _0808F244 @ =gBg1Tm + 0x118
	ldr r1, _0808F248 @ =gUnk_0841D614
	movs r2, #0xcf
	lsls r2, r2, #6
	bl TmApplyTsa_thm
	movs r0, #0xa0
	lsls r0, r0, #7
	movs r1, #0xb
	bl sub_808EDD0
	adds r0, r6, #0
	bl NewSysBlackBoxHandler
	movs r0, #0xd0
	lsls r0, r0, #7
	bl SysBlackBoxSetGfx
	movs r2, #0x90
	lsls r2, r2, #3
	movs r0, #3
	str r0, [sp]
	movs r0, #0xc0
	lsls r0, r0, #4
	str r0, [sp, #4]
	movs r0, #0
	movs r1, #4
	movs r3, #0xb
	bl EnableSysBlackBox
	bl sub_80908E8
	strb r0, [r7]
	bl sub_808E344
	bl sub_808EEE0
	bl sub_808EF10
	add sp, #8
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0808F1F8: .4byte gUnk_08D8C0A0
_0808F1FC: .4byte gDispIo
_0808F200: .4byte gBg0Tm
_0808F204: .4byte gBg1Tm
_0808F208: .4byte gBg2Tm
_0808F20C: .4byte 0x020106B4
_0808F210: .4byte 0x02010694
_0808F214: .4byte 0x0201068C
_0808F218: .4byte gUnk_0841E814
_0808F21C: .4byte 0x06014800
_0808F220: .4byte Pal_SysBrownBox
_0808F224: .4byte gUnk_084292A0
_0808F228: .4byte 0x06016000
_0808F22C: .4byte gUnk_084291AC
_0808F230: .4byte 0x0000FFE0
_0808F234: .4byte 0x0000E0FF
_0808F238: .4byte gUnk_0841D100
_0808F23C: .4byte gUnk_0841D120
_0808F240: .4byte 0x06007800
_0808F244: .4byte gBg1Tm + 0x118
_0808F248: .4byte gUnk_0841D614

	thumb_func_start sub_808F24C
sub_808F24C: @ 0x0808F24C
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	movs r5, #0
	ldr r2, _0808F2B8 @ =gDispIo
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
	movs r4, #1
_0808F272:
	adds r0, r4, #0
	bl GetUnit
	adds r1, r0, #0
	cmp r1, #0
	beq _0808F296
	ldr r0, [r1]
	cmp r0, #0
	beq _0808F296
	adds r0, r1, #0
	bl sub_808E81C
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0808F296
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
_0808F296:
	adds r4, #1
	cmp r4, #0x3f
	ble _0808F272
	cmp r5, #0
	bne _0808F2B0
	adds r1, r6, #0
	adds r1, #0x36
	movs r0, #1
	strb r0, [r1]
	adds r0, r6, #0
	movs r1, #6
	bl Proc_Goto
_0808F2B0:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0808F2B8: .4byte gDispIo

	thumb_func_start sub_808F2BC
sub_808F2BC: @ 0x0808F2BC
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	bl sub_80908E8
	adds r6, r0, #0
	adds r4, r5, #0
	adds r4, #0x35
	ldrb r0, [r4]
	cmp r0, r6
	beq _0808F2DC
	bl sub_808E344
	adds r1, r5, #0
	bl sub_808EF6C
	strb r6, [r4]
_0808F2DC:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_808F2E4
sub_808F2E4: @ 0x0808F2E4
	push {r4, r5, r6, r7, lr}
	sub sp, #8
	adds r7, r0, #0
	ldr r5, _0808F35C @ =0x02010694
	adds r0, #0x2f
	ldrb r0, [r0]
	bl sub_808E3E0
	adds r3, r0, #0
	lsls r3, r3, #1
	adds r3, #2
	movs r0, #1
	str r0, [sp]
	movs r0, #5
	movs r1, #6
	movs r2, #9
	bl sub_804A4CC
	movs r4, #0
	movs r6, #0xe0
	lsls r6, r6, #1
_0808F30E:
	adds r0, r7, #0
	adds r0, #0x2f
	ldrb r0, [r0]
	asrs r0, r4
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _0808F346
	adds r0, r5, #0
	bl ClearText
	ldr r1, _0808F360 @ =gUnk_08D8D5F8
	lsls r0, r4, #2
	adds r0, r0, r1
	ldr r0, [r0]
	bl DecodeMsg
	ldr r1, _0808F364 @ =gBg0Tm + 0xc
	adds r1, r6, r1
	movs r2, #0
	str r2, [sp]
	str r0, [sp, #4]
	adds r0, r5, #0
	movs r3, #0
	bl PutDrawText
	adds r5, #8
	adds r6, #0x80
_0808F346:
	adds r4, #1
	cmp r4, #3
	ble _0808F30E
	movs r0, #3
	bl EnableBgSync
	add sp, #8
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0808F35C: .4byte 0x02010694
_0808F360: .4byte gUnk_08D8D5F8
_0808F364: .4byte gBg0Tm + 0xc

	thumb_func_start sub_808F368
sub_808F368: @ 0x0808F368
	push {lr}
	ldr r0, _0808F38C @ =gBg0Tm + 0x18a
	movs r1, #8
	movs r2, #9
	movs r3, #0
	bl TmFillRect_thm
	ldr r0, _0808F390 @ =gBg1Tm + 0x18a
	movs r1, #8
	movs r2, #9
	movs r3, #0
	bl TmFillRect_thm
	movs r0, #3
	bl EnableBgSync
	pop {r0}
	bx r0
	.align 2, 0
_0808F38C: .4byte gBg0Tm + 0x18a
_0808F390: .4byte gBg1Tm + 0x18a

	thumb_func_start sub_808F394
sub_808F394: @ 0x0808F394
	push {r4, lr}
	adds r4, r0, #0
	bl sub_8090AA4
	adds r0, r4, #0
	bl sub_808F2E4
	adds r4, #0x2e
	ldrb r4, [r4]
	lsls r1, r4, #4
	adds r1, #0x38
	movs r3, #0x80
	lsls r3, r3, #3
	movs r0, #0x2c
	movs r2, #7
	bl ShowSysHandCursor
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_808F3BC
sub_808F3BC: @ 0x0808F3BC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x14
	adds r6, r0, #0
	add r1, sp, #4
	ldr r0, _0808F410 @ =gUnk_0842CF2C
	ldm r0!, {r2, r3, r4}
	stm r1!, {r2, r3, r4}
	ldr r0, [r0]
	str r0, [r1]
	adds r5, r6, #0
	adds r5, #0x2e
	ldrb r0, [r5]
	mov sb, r0
	movs r1, #0x2c
	mov sl, r1
	lsls r0, r0, #4
	adds r7, r0, #0
	adds r7, #0x38
	adds r4, r6, #0
	adds r4, #0x34
	ldrb r2, [r4]
	mov r8, r2
	cmp r2, #0
	beq _0808F418
	ldr r0, _0808F414 @ =gpKeySt
	ldr r1, [r0]
	movs r0, #0x81
	lsls r0, r0, #1
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _0808F4F0
	bl CloseHelpBox
	movs r0, #0
	strb r0, [r4]
	b _0808F5B2
	.align 2, 0
_0808F410: .4byte gUnk_0842CF2C
_0808F414: .4byte gpKeySt
_0808F418:
	ldr r0, _0808F46C @ =gpKeySt
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0808F478
	ldr r0, _0808F470 @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0808F438
	ldr r0, _0808F474 @ =0x0000038A
	bl m4aSongNumStart
_0808F438:
	ldrb r0, [r5]
	adds r1, r6, #0
	adds r1, #0x2f
	ldrb r1, [r1]
	bl sub_808E3B0
	cmp r0, #3
	bne _0808F45A
	movs r2, #0x80
	lsls r2, r2, #1
	mov r3, r8
	str r3, [sp]
	movs r0, #0x5e
	adds r1, r2, #0
	movs r3, #0x20
	bl CallSomeSoundMaybe
_0808F45A:
	adds r1, r6, #0
	adds r1, #0x33
	movs r0, #4
	strb r0, [r1]
	adds r0, r6, #0
	movs r1, #8
	bl Proc_Goto
	b _0808F5B2
	.align 2, 0
_0808F46C: .4byte gpKeySt
_0808F470: .4byte gPlaySt
_0808F474: .4byte 0x0000038A
_0808F478:
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0808F4A4
	movs r0, #1
	strb r0, [r4]
	ldrb r0, [r5]
	adds r1, r6, #0
	adds r1, #0x2f
	ldrb r1, [r1]
	bl sub_808E3B0
	lsls r0, r0, #2
	add r0, sp
	adds r0, #4
	ldr r2, [r0]
	movs r0, #0x2c
	adds r1, r7, #0
	bl StartHelpBox
	b _0808F5B2
_0808F4A4:
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0808F4F0
	adds r0, r6, #0
	bl sub_808F368
	ldr r0, _0808F4E0 @ =gBg1Tm + 0x118
	ldr r1, _0808F4E4 @ =gUnk_0841D614
	movs r2, #0xcf
	lsls r2, r2, #6
	bl TmApplyTsa_thm
	movs r0, #1
	movs r1, #4
	bl sub_8090930
	ldr r0, _0808F4E8 @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0808F4D8
	ldr r0, _0808F4EC @ =0x0000038B
	bl m4aSongNumStart
_0808F4D8:
	adds r0, r6, #0
	bl Proc_Break
	b _0808F5B2
	.align 2, 0
_0808F4E0: .4byte gBg1Tm + 0x118
_0808F4E4: .4byte gUnk_0841D614
_0808F4E8: .4byte gPlaySt
_0808F4EC: .4byte 0x0000038B
_0808F4F0:
	ldr r0, _0808F54C @ =gpKeySt
	ldr r1, [r0]
	movs r2, #0x40
	adds r0, r2, #0
	ldrh r4, [r1, #6]
	ands r0, r4
	adds r5, r6, #0
	adds r5, #0x2e
	cmp r0, #0
	beq _0808F522
	ldrb r0, [r5]
	cmp r0, #0
	bne _0808F51E
	adds r0, r2, #0
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _0808F522
	adds r0, r6, #0
	adds r0, #0x2f
	ldrb r0, [r0]
	bl sub_808E3E0
_0808F51E:
	subs r0, #1
	strb r0, [r5]
_0808F522:
	ldr r7, _0808F54C @ =gpKeySt
	ldr r1, [r7]
	movs r0, #0x80
	mov r8, r0
	ldrh r1, [r1, #6]
	ands r0, r1
	cmp r0, #0
	beq _0808F560
	ldrb r4, [r5]
	adds r0, r6, #0
	adds r0, #0x2f
	ldrb r0, [r0]
	bl sub_808E3E0
	subs r0, #1
	cmp r4, r0
	bge _0808F550
	ldrb r0, [r5]
	adds r0, #1
	b _0808F55E
	.align 2, 0
_0808F54C: .4byte gpKeySt
_0808F550:
	ldr r1, [r7]
	mov r0, r8
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _0808F560
	movs r0, #0
_0808F55E:
	strb r0, [r5]
_0808F560:
	ldrb r2, [r5]
	cmp sb, r2
	beq _0808F5B2
	lsls r0, r2, #4
	adds r7, r0, #0
	adds r7, #0x38
	adds r0, r6, #0
	adds r0, #0x34
	ldrb r0, [r0]
	cmp r0, #0
	beq _0808F592
	adds r0, r6, #0
	adds r0, #0x2f
	ldrb r1, [r0]
	adds r0, r2, #0
	bl sub_808E3B0
	lsls r0, r0, #2
	add r0, sp
	adds r0, #4
	ldr r2, [r0]
	mov r0, sl
	adds r1, r7, #0
	bl StartHelpBox
_0808F592:
	movs r3, #0x80
	lsls r3, r3, #3
	mov r0, sl
	adds r1, r7, #0
	movs r2, #7
	bl ShowSysHandCursor
	ldr r0, _0808F5C4 @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0808F5B2
	ldr r0, _0808F5C8 @ =0x00000386
	bl m4aSongNumStart
_0808F5B2:
	add sp, #0x14
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0808F5C4: .4byte gPlaySt
_0808F5C8: .4byte 0x00000386

	thumb_func_start sub_808F5CC
sub_808F5CC: @ 0x0808F5CC
	push {r4, r5, lr}
	adds r5, r0, #0
	movs r4, #1
_0808F5D2:
	adds r0, r4, #0
	bl GetUnit
	adds r2, r0, #0
	cmp r2, #0
	beq _0808F5EC
	ldr r0, [r2]
	cmp r0, #0
	beq _0808F5EC
	ldr r0, [r2, #0xc]
	ldr r1, _0808F600 @ =0xFDFFFFFF
	ands r0, r1
	str r0, [r2, #0xc]
_0808F5EC:
	adds r4, #1
	cmp r4, #0x3f
	ble _0808F5D2
	adds r1, r5, #0
	adds r1, #0x36
	movs r0, #1
	strb r0, [r1]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0808F600: .4byte 0xFDFFFFFF

	thumb_func_start sub_808F604
sub_808F604: @ 0x0808F604
	push {r4, lr}
	adds r4, r0, #0
	bl EndAllProcChildren
	bl EndMuralBackground_
	bl sub_80903E8
	movs r0, #0
	bl InitBgs
	ldr r3, _0808F668 @ =gDispIo
	adds r2, r3, #0
	adds r2, #0x3c
	movs r0, #0xc0
	ldrb r1, [r2]
	orrs r0, r1
	strb r0, [r2]
	adds r0, r3, #0
	adds r0, #0x44
	movs r1, #0
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r1, r3, #0
	adds r1, #0x46
	movs r0, #0x10
	strb r0, [r1]
	ldr r0, _0808F66C @ =0x0000FFE0
	ldrh r1, [r3, #0x3c]
	ands r0, r1
	movs r1, #0x1f
	orrs r0, r1
	strh r0, [r3, #0x3c]
	movs r0, #0x20
	ldrb r1, [r2]
	orrs r0, r1
	strb r0, [r2]
	adds r0, r4, #0
	adds r0, #0x36
	ldrb r0, [r0]
	cmp r0, #0
	beq _0808F660
	adds r0, r4, #0
	bl sub_807D6BC
_0808F660:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0808F668: .4byte gDispIo
_0808F66C: .4byte 0x0000FFE0

	thumb_func_start sub_808F670
sub_808F670: @ 0x0808F670
	push {r4, lr}
	adds r4, r0, #0
	bl sub_808EA84
	adds r4, #0x36
	ldrb r0, [r4]
	cmp r0, #0
	beq _0808F686
	bl sub_80316C8
	b _0808F694
_0808F686:
	bl CheckInLinkArena
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0808F694
	bl sub_803DED4
_0808F694:
	bl sub_800F070
	bl ResetUnitSprites
	bl RefreshEntityMaps
	bl RefreshUnitSprites
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_808F6AC
sub_808F6AC: @ 0x0808F6AC
	push {r4, lr}
	adds r4, r0, #0
	bl sub_808EF98
	adds r0, r4, #0
	adds r0, #0x33
	ldrb r0, [r0]
	subs r0, #1
	cmp r0, #4
	bhi _0808F734
	lsls r0, r0, #2
	ldr r1, _0808F6CC @ =_0808F6D0
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0808F6CC: .4byte _0808F6D0
_0808F6D0: @ jump table
	.4byte _0808F6F4 @ case 0
	.4byte _0808F6EC @ case 1
	.4byte _0808F71C @ case 2
	.4byte _0808F704 @ case 3
	.4byte _0808F6E4 @ case 4
_0808F6E4:
	adds r0, r4, #0
	bl sub_8087B80
	b _0808F734
_0808F6EC:
	adds r0, r4, #0
	bl sub_80932C8
	b _0808F734
_0808F6F4:
	ldr r0, _0808F700 @ =gUnk_08D8CDE4
	adds r1, r4, #0
	bl Proc_StartBlocking
	b _0808F734
	.align 2, 0
_0808F700: .4byte gUnk_08D8CDE4
_0808F704:
	adds r0, r4, #0
	adds r0, #0x2e
	ldrb r0, [r0]
	adds r1, r4, #0
	adds r1, #0x2f
	ldrb r1, [r1]
	bl sub_808E3B0
	adds r1, r4, #0
	bl sub_8099B94
	b _0808F734
_0808F71C:
	movs r0, #0x80
	lsls r0, r0, #1
	movs r1, #0x80
	movs r2, #0x20
	movs r3, #0
	bl StartBgmVolumeChange
	bl sub_800F070
	adds r0, r4, #0
	bl sub_80A5AF8
_0808F734:
	adds r0, r4, #0
	bl Proc_Break
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_808F740
sub_808F740: @ 0x0808F740
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r4, #0
	adds r5, #0x33
	ldrb r0, [r5]
	cmp r0, #3
	bne _0808F75C
	movs r1, #0x80
	lsls r1, r1, #1
	movs r0, #0x80
	movs r2, #0x20
	movs r3, #0
	bl StartBgmVolumeChange
_0808F75C:
	ldrb r0, [r5]
	subs r0, #1
	cmp r0, #4
	bhi _0808F7A4
	lsls r0, r0, #2
	ldr r1, _0808F770 @ =_0808F774
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0808F770: .4byte _0808F774
_0808F774: @ jump table
	.4byte _0808F79C @ case 0
	.4byte _0808F79C @ case 1
	.4byte _0808F792 @ case 2
	.4byte _0808F788 @ case 3
	.4byte _0808F79C @ case 4
_0808F788:
	adds r0, r4, #0
	movs r1, #0xd
	bl Proc_Goto
	b _0808F7A4
_0808F792:
	adds r0, r4, #0
	movs r1, #7
	bl Proc_Goto
	b _0808F7A4
_0808F79C:
	adds r0, r4, #0
	movs r1, #9
	bl Proc_Goto
_0808F7A4:
	adds r1, r4, #0
	adds r1, #0x33
	movs r0, #0
	strb r0, [r1]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_808F7B4
sub_808F7B4: @ 0x0808F7B4
	ldr r2, _0808F7D0 @ =gDispIo
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
_0808F7D0: .4byte gDispIo

	thumb_func_start sub_808F7D4
sub_808F7D4: @ 0x0808F7D4
	push {lr}
	bl CheckInLinkArena
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0808F7E8
	bl LockGame
	bl LockBmDisplay
_0808F7E8:
	pop {r0}
	bx r0

	thumb_func_start sub_808F7EC
sub_808F7EC: @ 0x0808F7EC
	push {lr}
	bl CheckInLinkArena
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0808F800
	bl UnlockBmDisplay
	bl UnlockGame
_0808F800:
	pop {r0}
	bx r0

	thumb_func_start sub_808F804
sub_808F804: @ 0x0808F804
	push {lr}
	ldr r0, _0808F814 @ =gUnk_08D8C154
	movs r1, #3
	bl Proc_Start
	pop {r0}
	bx r0
	.align 2, 0
_0808F814: .4byte gUnk_08D8C154

	thumb_func_start sub_808F818
sub_808F818: @ 0x0808F818
	push {lr}
	ldr r0, _0808F830 @ =gUnk_08D8C154
	movs r1, #3
	bl Proc_Start
	bl sub_808EBEC
	bl sub_808E5C8
	pop {r0}
	bx r0
	.align 2, 0
_0808F830: .4byte gUnk_08D8C154

	thumb_func_start sub_808F834
sub_808F834: @ 0x0808F834
	push {r4, lr}
	cmp r0, #0
	beq _0808F840
	cmp r0, #1
	beq _0808F870
	b _0808F8C2
_0808F840:
	movs r4, #1
_0808F842:
	adds r0, r4, #0
	bl GetUnit
	cmp r0, #0
	beq _0808F864
	ldr r1, [r0]
	cmp r1, #0
	beq _0808F864
	ldr r0, [r0, #4]
	ldr r1, [r1, #0x28]
	ldr r0, [r0, #0x28]
	orrs r1, r0
	movs r0, #0x80
	lsls r0, r0, #2
	ands r1, r0
	cmp r1, #0
	bne _0808F86C
_0808F864:
	adds r4, #1
	cmp r4, #0x3f
	ble _0808F842
	b _0808F8C2
_0808F86C:
	movs r0, #1
	b _0808F8C4
_0808F870:
	bl CheckInLinkArena
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0808F8C2
	ldr r4, _0808F8CC @ =gPlaySt
	movs r0, #0xe
	ldrsb r0, [r4, r0]
	bl GetChapterInfo
	movs r1, #0
	ldrb r4, [r4, #0x1b]
	cmp r4, #3
	bne _0808F88E
	movs r1, #1
_0808F88E:
	adds r0, #0x82
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #0xff
	beq _0808F8C2
	movs r4, #1
_0808F89A:
	adds r0, r4, #0
	bl GetUnit
	cmp r0, #0
	beq _0808F8BC
	ldr r1, [r0]
	cmp r1, #0
	beq _0808F8BC
	ldr r0, [r0, #4]
	ldr r1, [r1, #0x28]
	ldr r0, [r0, #0x28]
	orrs r1, r0
	movs r0, #0x80
	lsls r0, r0, #2
	ands r1, r0
	cmp r1, #0
	bne _0808F86C
_0808F8BC:
	adds r4, #1
	cmp r4, #0x3f
	ble _0808F89A
_0808F8C2:
	movs r0, #0
_0808F8C4:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0808F8CC: .4byte gPlaySt

	thumb_func_start sub_808F8D0
sub_808F8D0: @ 0x0808F8D0
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r7, r0, #0
	ldr r2, [r7, #0x5c]
	movs r3, #0x8f
	lsls r3, r3, #6
	movs r0, #0x70
	movs r1, #4
	bl sub_8090148
	movs r6, #0x8d
	lsls r6, r6, #7
	movs r5, #0x80
	movs r4, #2
_0808F8EC:
	str r6, [sp]
	movs r0, #4
	adds r1, r5, #0
	movs r2, #0x14
	ldr r3, _0808F930 @ =Sprite_32x16
	bl PutSpriteExt
	adds r6, #4
	adds r5, #0x20
	subs r4, #1
	cmp r4, #0
	bge _0808F8EC
	adds r2, r7, #0
	adds r2, #0x64
	ldrh r0, [r2]
	cmp r0, #1
	bne _0808F928
	ldr r0, _0808F934 @ =gpKeySt
	ldr r1, [r0]
	movs r0, #8
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _0808F928
	movs r0, #0
	strh r0, [r2]
	adds r0, r7, #0
	movs r1, #0x64
	bl Proc_Goto
_0808F928:
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0808F930: .4byte Sprite_32x16
_0808F934: .4byte gpKeySt

	thumb_func_start sub_808F938
sub_808F938: @ 0x0808F938
	push {r4, lr}
	movs r4, #1
_0808F93C:
	adds r0, r4, #0
	bl GetUnit
	cmp r0, #0
	beq _0808F960
	ldr r1, [r0]
	cmp r1, #0
	beq _0808F960
	ldrb r1, [r1, #4]
	cmp r1, #0x23
	bne _0808F960
	ldr r0, [r0, #0xc]
	movs r1, #4
	ands r0, r1
	cmp r0, #0
	bne _0808F966
	movs r0, #1
	b _0808F968
_0808F960:
	adds r4, #1
	cmp r4, #0x3f
	ble _0808F93C
_0808F966:
	movs r0, #0
_0808F968:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_808F970
sub_808F970: @ 0x0808F970
	push {r4, lr}
	ldr r4, _0808F9D4 @ =gPlaySt
	movs r0, #0x80
	ldrb r1, [r4, #0x14]
	ands r0, r1
	cmp r0, #0
	bne _0808F9D8
	bl CheckInLinkArena
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0808F9D8
	movs r0, #0xe
	ldrsb r0, [r4, r0]
	bl GetChapterInfo
	ldrb r0, [r0, #0xd]
	cmp r0, #0
	beq _0808F9D8
	movs r0, #0xe
	ldrsb r0, [r4, r0]
	bl GetChapterInfo
	movs r1, #0
	ldrb r4, [r4, #0x1b]
	cmp r4, #3
	bne _0808F9A8
	movs r1, #1
_0808F9A8:
	adds r0, #0x82
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #0xff
	beq _0808F9D8
	movs r0, #0x28
	bl GetUnitFromCharId
	cmp r0, #0
	beq _0808F9D8
	ldrb r1, [r0, #8]
	cmp r1, #0x14
	bne _0808F9D8
	ldr r0, [r0, #4]
	ldrb r0, [r0, #4]
	cmp r0, #0x44
	bne _0808F9D8
	movs r0, #0x90
	bl ClearFlag
	movs r0, #1
	b _0808F9DA
	.align 2, 0
_0808F9D4: .4byte gPlaySt
_0808F9D8:
	movs r0, #0
_0808F9DA:
	pop {r4}
	pop {r1}
	bx r1

	thumb_func_start sub_808F9E0
sub_808F9E0: @ 0x0808F9E0
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #8
	adds r6, r0, #0
	movs r5, #0
	str r5, [r6, #0x58]
	ldr r4, _0808FA04 @ =gPlaySt
	movs r0, #0xe
	ldrsb r0, [r4, r0]
	cmp r0, #0x11
	beq _0808FA1C
	cmp r0, #0x11
	bgt _0808FA08
	cmp r0, #9
	beq _0808FA0E
	b _0808FA68
	.align 2, 0
_0808FA04: .4byte gPlaySt
_0808FA08:
	cmp r0, #0x14
	beq _0808FA54
	b _0808FA68
_0808FA0E:
	bl sub_808F938
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0808FA68
	movs r0, #8
	b _0808FA66
_0808FA1C:
	movs r0, #0x6a
	bl CheckFlag
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0808FA42
	ldr r1, [r6, #0x58]
	movs r0, #4
	orrs r1, r0
	str r1, [r6, #0x58]
	movs r0, #0x40
	ldrb r4, [r4, #0x14]
	ands r0, r4
	cmp r0, #0
	bne _0808FA68
	movs r0, #1
	orrs r1, r0
	str r1, [r6, #0x58]
	b _0808FA68
_0808FA42:
	movs r0, #0x40
	ldrb r4, [r4, #0x14]
	ands r0, r4
	cmp r0, #0
	bne _0808FA68
	ldr r0, [r6, #0x58]
	movs r1, #2
	orrs r0, r1
	b _0808FA66
_0808FA54:
	movs r0, #0x6a
	bl CheckFlag
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0808FA64
	str r5, [r6, #0x58]
	b _0808FA68
_0808FA64:
	movs r0, #4
_0808FA66:
	str r0, [r6, #0x58]
_0808FA68:
	bl sub_808F970
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0808FA76
	movs r0, #0x10
	str r0, [r6, #0x58]
_0808FA76:
	ldr r0, [r6, #0x58]
	cmp r0, #0
	bne _0808FA86
	adds r0, r6, #0
	movs r1, #0xc8
	bl Proc_Goto
	b _0808FC96
_0808FA86:
	movs r0, #0
	bl InitBgs
	bl InitFaces
	bl ResetText
	bl UnpackUiWindowFrameGraphics
	bl ApplySystemObjectsGraphics
	ldr r3, _0808FC30 @ =gDispIo
	movs r1, #4
	rsbs r1, r1, #0
	adds r0, r1, #0
	ldrb r2, [r3, #0xc]
	ands r0, r2
	strb r0, [r3, #0xc]
	adds r0, r1, #0
	ldrb r2, [r3, #0x10]
	ands r0, r2
	movs r2, #2
	orrs r0, r2
	strb r0, [r3, #0x10]
	ldrb r0, [r3, #0x14]
	ands r1, r0
	movs r0, #1
	orrs r1, r0
	strb r1, [r3, #0x14]
	movs r0, #3
	ldrb r1, [r3, #0x18]
	orrs r0, r1
	strb r0, [r3, #0x18]
	ldr r4, _0808FC34 @ =gPlaySt
	movs r0, #0xe
	ldrsb r0, [r4, r0]
	bl GetChapterInfo
	movs r1, #0
	ldrb r4, [r4, #0x1b]
	cmp r4, #3
	bne _0808FADC
	movs r1, #1
_0808FADC:
	adds r0, #0x80
	adds r0, r0, r1
	ldrb r0, [r0]
	str r0, [r6, #0x5c]
	movs r0, #0
	str r0, [sp]
	movs r0, #1
	movs r1, #4
	movs r2, #0xa
	movs r3, #0xc
	bl sub_804A4CC
	ldr r0, _0808FC38 @ =0x00001131
	bl DecodeMsg
	ldr r5, _0808FC3C @ =gBg2Tm + 0x146
	movs r4, #8
	str r4, [sp]
	str r0, [sp, #4]
	movs r0, #0
	adds r1, r5, #0
	movs r2, #0
	movs r3, #0
	bl PutDrawText
	ldr r0, _0808FC40 @ =0x00001132
	bl DecodeMsg
	adds r1, r5, #0
	adds r1, #0x80
	str r4, [sp]
	str r0, [sp, #4]
	movs r0, #0
	movs r2, #0
	movs r3, #0
	bl PutDrawText
	ldr r0, _0808FC44 @ =0x0000113A
	bl DecodeMsg
	movs r2, #0x80
	lsls r2, r2, #1
	adds r1, r5, r2
	str r4, [sp]
	str r0, [sp, #4]
	movs r0, #0
	movs r2, #0
	movs r3, #0
	bl PutDrawText
	ldr r0, _0808FC48 @ =0x00001135
	bl DecodeMsg
	movs r2, #0xc0
	lsls r2, r2, #1
	adds r1, r5, r2
	str r4, [sp]
	str r0, [sp, #4]
	movs r0, #0
	movs r2, #0
	movs r3, #0
	bl PutDrawText
	ldr r0, _0808FC4C @ =0x00001134
	bl DecodeMsg
	movs r2, #0x80
	lsls r2, r2, #2
	adds r1, r5, r2
	str r4, [sp]
	str r0, [sp, #4]
	movs r0, #0
	movs r2, #0
	movs r3, #0
	bl PutDrawText
	ldr r0, _0808FC50 @ =gUnk_0841D100
	movs r1, #0xf0
	lsls r1, r1, #1
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r0, _0808FC54 @ =gUnk_0841D120
	ldr r1, _0808FC58 @ =0x06005800
	bl Decompress
	ldr r0, _0808FC5C @ =gBg1Tm + 0x118
	ldr r1, _0808FC60 @ =gUnk_0841D614
	ldr r2, _0808FC64 @ =0x0000F2C0
	bl TmApplyTsa_thm
	adds r7, r6, #0
	adds r7, #0x4c
	movs r0, #0x64
	adds r0, r0, r6
	mov r8, r0
	ldr r5, _0808FC68 @ =0x020106B4
	movs r4, #4
_0808FBA0:
	adds r0, r5, #0
	movs r1, #0xe
	bl InitText
	adds r5, #8
	subs r4, #1
	cmp r4, #0
	bge _0808FBA0
	ldr r0, _0808FC6C @ =gUnk_0841E814
	ldr r1, _0808FC70 @ =0x06011000
	bl Decompress
	ldr r0, _0808FC74 @ =Pal_SysBrownBox
	movs r1, #0xf0
	lsls r1, r1, #2
	movs r2, #0x40
	bl ApplyPaletteExt
	movs r0, #2
	bl EnableBgSync
	movs r0, #0
	movs r1, #8
	bl sub_80910B0
	ldr r0, _0808FC78 @ =gUnk_0841ECD0
	movs r2, #0x83
	lsls r2, r2, #3
	ldr r3, _0808FC7C @ =0x0000EC80
	movs r4, #0
	str r4, [sp]
	movs r1, #0xd
	str r1, [sp, #4]
	movs r1, #0x78
	bl StartSpriteAnimProc
	strh r4, [r7]
	movs r0, #0x80
	lsls r0, r0, #2
	movs r1, #3
	movs r2, #1
	bl InitTalk
	adds r0, r6, #0
	bl ResetSysHandCursor
	movs r0, #0xc0
	lsls r0, r0, #3
	movs r1, #1
	bl DisplaySysHandCursorTextShadow
	movs r0, #0xf0
	lsls r0, r0, #7
	movs r1, #2
	bl sub_808EFBC
	movs r0, #0xa0
	lsls r0, r0, #7
	movs r1, #4
	bl sub_808EDD0
	ldr r0, _0808FC34 @ =gPlaySt
	ldrb r0, [r0, #0x1b]
	cmp r0, #1
	bne _0808FC80
	movs r0, #0xfa
	lsls r0, r0, #2
	adds r1, r6, #0
	bl sub_808EF6C
	b _0808FC88
	.align 2, 0
_0808FC30: .4byte gDispIo
_0808FC34: .4byte gPlaySt
_0808FC38: .4byte 0x00001131
_0808FC3C: .4byte gBg2Tm + 0x146
_0808FC40: .4byte 0x00001132
_0808FC44: .4byte 0x0000113A
_0808FC48: .4byte 0x00001135
_0808FC4C: .4byte 0x00001134
_0808FC50: .4byte gUnk_0841D100
_0808FC54: .4byte gUnk_0841D120
_0808FC58: .4byte 0x06005800
_0808FC5C: .4byte gBg1Tm + 0x118
_0808FC60: .4byte gUnk_0841D614
_0808FC64: .4byte 0x0000F2C0
_0808FC68: .4byte 0x020106B4
_0808FC6C: .4byte gUnk_0841E814
_0808FC70: .4byte 0x06011000
_0808FC74: .4byte Pal_SysBrownBox
_0808FC78: .4byte gUnk_0841ECD0
_0808FC7C: .4byte 0x0000EC80
_0808FC80:
	ldr r0, _0808FCA4 @ =0x000003E9
	adds r1, r6, #0
	bl sub_808EF6C
_0808FC88:
	movs r0, #0
	mov r1, r8
	strh r0, [r1]
	ldr r0, _0808FCA8 @ =sub_808F8D0
	adds r1, r6, #0
	bl StartParallelWorker
_0808FC96:
	add sp, #8
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0808FCA4: .4byte 0x000003E9
_0808FCA8: .4byte sub_808F8D0

	thumb_func_start sub_808FCAC
sub_808FCAC: @ 0x0808FCAC
	ldr r3, _0808FCEC @ =gDispIo
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
	movs r0, #0xe
	strb r0, [r1]
	adds r1, #1
	movs r0, #8
	strb r0, [r1]
	adds r0, r3, #0
	adds r0, #0x46
	strb r2, [r0]
	ldr r0, _0808FCF0 @ =0x0000FFE0
	ldrh r2, [r3, #0x3c]
	ands r0, r2
	ldr r1, _0808FCF4 @ =0x0000E0FF
	ands r0, r1
	movs r2, #0x80
	lsls r2, r2, #4
	adds r1, r2, #0
	orrs r0, r1
	strh r0, [r3, #0x3c]
	bx lr
	.align 2, 0
_0808FCEC: .4byte gDispIo
_0808FCF0: .4byte 0x0000FFE0
_0808FCF4: .4byte 0x0000E0FF

	thumb_func_start sub_808FCF8
sub_808FCF8: @ 0x0808FCF8
	adds r2, r0, #0
	ldr r0, [r2, #0x58]
	movs r1, #0x10
	ands r0, r1
	cmp r0, #0
	bne _0808FD0C
	adds r1, r2, #0
	adds r1, #0x64
	movs r0, #1
	strh r0, [r1]
_0808FD0C:
	bx lr
	.align 2, 0

	thumb_func_start sub_808FD10
sub_808FD10: @ 0x0808FD10
	push {r4, lr}
	sub sp, #0x10
	adds r2, r0, #0
	ldr r0, [r2, #0x58]
	movs r1, #8
	ands r0, r1
	cmp r0, #0
	bne _0808FD2A
	adds r0, r2, #0
	movs r1, #1
	bl Proc_Goto
	b _0808FD68
_0808FD2A:
	movs r3, #0x80
	lsls r3, r3, #4
	movs r0, #0x14
	movs r1, #0x28
	movs r2, #6
	bl ShowSysHandCursor
	movs r4, #0
	str r4, [sp]
	movs r0, #0x20
	movs r1, #0xd4
	movs r2, #0x50
	movs r3, #0x82
	bl sub_8008DA8
	movs r3, #1
	rsbs r3, r3, #0
	ldr r0, _0808FD70 @ =0x00000FBF
	str r0, [sp]
	ldr r0, _0808FD74 @ =0x06011800
	str r0, [sp, #4]
	str r3, [sp, #8]
	str r4, [sp, #0xc]
	movs r0, #0x16
	movs r1, #0x12
	adds r2, r3, #0
	bl sub_8088584
	ldr r0, _0808FD78 @ =0x0002000A
	bl sub_8087E2C
_0808FD68:
	add sp, #0x10
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0808FD70: .4byte 0x00000FBF
_0808FD74: .4byte 0x06011800
_0808FD78: .4byte 0x0002000A

	thumb_func_start sub_808FD7C
sub_808FD7C: @ 0x0808FD7C
	push {r4, lr}
	sub sp, #0x10
	adds r2, r0, #0
	ldr r0, [r2, #0x58]
	movs r1, #4
	ands r0, r1
	cmp r0, #0
	bne _0808FD96
	adds r0, r2, #0
	movs r1, #2
	bl Proc_Goto
	b _0808FDD4
_0808FD96:
	movs r3, #0x80
	lsls r3, r3, #4
	movs r0, #0x14
	movs r1, #0x38
	movs r2, #6
	bl ShowSysHandCursor
	movs r4, #0
	str r4, [sp]
	movs r0, #0x4a
	movs r1, #0xd4
	movs r2, #0x50
	movs r3, #0x82
	bl sub_8008DA8
	movs r3, #1
	rsbs r3, r3, #0
	ldr r0, _0808FDDC @ =0x00000FB7
	str r0, [sp]
	ldr r0, _0808FDE0 @ =0x06011800
	str r0, [sp, #4]
	str r3, [sp, #8]
	str r4, [sp, #0xc]
	movs r0, #0x16
	movs r1, #0x12
	adds r2, r3, #0
	bl sub_8088584
	ldr r0, _0808FDE4 @ =0x0002000A
	bl sub_8087E2C
_0808FDD4:
	add sp, #0x10
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0808FDDC: .4byte 0x00000FB7
_0808FDE0: .4byte 0x06011800
_0808FDE4: .4byte 0x0002000A

	thumb_func_start sub_808FDE8
sub_808FDE8: @ 0x0808FDE8
	push {r4, r5, lr}
	sub sp, #0x10
	adds r2, r0, #0
	movs r5, #0
	ldr r1, [r2, #0x58]
	movs r0, #3
	ands r0, r1
	cmp r0, #0
	bne _0808FE04
	adds r0, r2, #0
	movs r1, #3
	bl Proc_Goto
	b _0808FE54
_0808FE04:
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0808FE0E
	ldr r5, _0808FE5C @ =0x00000FB8
_0808FE0E:
	movs r0, #2
	ands r1, r0
	cmp r1, #0
	beq _0808FE18
	ldr r5, _0808FE60 @ =0x00000FB9
_0808FE18:
	movs r3, #0x80
	lsls r3, r3, #4
	movs r0, #0x14
	movs r1, #0x48
	movs r2, #6
	bl ShowSysHandCursor
	movs r4, #0
	str r4, [sp]
	movs r0, #0x4b
	movs r1, #0xd4
	movs r2, #0x50
	movs r3, #0x82
	bl sub_8008DA8
	movs r3, #1
	rsbs r3, r3, #0
	str r5, [sp]
	ldr r0, _0808FE64 @ =0x06011800
	str r0, [sp, #4]
	str r3, [sp, #8]
	str r4, [sp, #0xc]
	movs r0, #0x16
	movs r1, #0x12
	adds r2, r3, #0
	bl sub_8088584
	ldr r0, _0808FE68 @ =0x0002000A
	bl sub_8087E2C
_0808FE54:
	add sp, #0x10
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0808FE5C: .4byte 0x00000FB8
_0808FE60: .4byte 0x00000FB9
_0808FE64: .4byte 0x06011800
_0808FE68: .4byte 0x0002000A

	thumb_func_start sub_808FE6C
sub_808FE6C: @ 0x0808FE6C
	push {r4, lr}
	sub sp, #0x10
	adds r2, r0, #0
	ldr r0, [r2, #0x58]
	movs r1, #0x10
	ands r0, r1
	cmp r0, #0
	bne _0808FE86
	adds r0, r2, #0
	movs r1, #0xa
	bl Proc_Goto
	b _0808FEC4
_0808FE86:
	movs r3, #0x80
	lsls r3, r3, #4
	movs r0, #0x14
	movs r1, #0x28
	movs r2, #6
	bl ShowSysHandCursor
	movs r4, #0
	str r4, [sp]
	movs r0, #0x4a
	movs r1, #0xd4
	movs r2, #0x50
	movs r3, #0x82
	bl sub_8008DA8
	movs r3, #1
	rsbs r3, r3, #0
	ldr r0, _0808FECC @ =0x00000FBE
	str r0, [sp]
	ldr r0, _0808FED0 @ =0x06011800
	str r0, [sp, #4]
	str r3, [sp, #8]
	str r4, [sp, #0xc]
	movs r0, #0x16
	movs r1, #0x12
	adds r2, r3, #0
	bl sub_8088584
	ldr r0, _0808FED4 @ =0x0002000A
	bl sub_8087E2C
_0808FEC4:
	add sp, #0x10
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0808FECC: .4byte 0x00000FBE
_0808FED0: .4byte 0x06011800
_0808FED4: .4byte 0x0002000A

	thumb_func_start sub_808FED8
sub_808FED8: @ 0x0808FED8
	adds r0, #0x64
	movs r1, #0
	strh r1, [r0]
	bx lr

	thumb_func_start sub_808FEE0
sub_808FEE0: @ 0x0808FEE0
	push {lr}
	bl EndCgText
	bl ClearTalk
	bl EndEachSpriteAnimProc
	bl sub_8091104
	ldr r3, _0808FF50 @ =gDispIo
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
	adds r1, r3, #0
	adds r1, #0x3c
	movs r0, #0xc0
	ldrb r2, [r1]
	orrs r0, r2
	strb r0, [r1]
	adds r0, r3, #0
	adds r0, #0x44
	movs r1, #0
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r1, r3, #0
	adds r1, #0x46
	movs r0, #0x10
	strb r0, [r1]
	ldr r0, _0808FF54 @ =0x0000FFE0
	ldrh r1, [r3, #0x3c]
	ands r0, r1
	movs r1, #0x1f
	orrs r0, r1
	strh r0, [r3, #0x3c]
	pop {r0}
	bx r0
	.align 2, 0
_0808FF50: .4byte gDispIo
_0808FF54: .4byte 0x0000FFE0

	thumb_func_start sub_808FF58
sub_808FF58: @ 0x0808FF58
	push {r4, r5, lr}
	adds r4, r0, #0
	movs r0, #0x28
	bl GetUnitFromCharId
	adds r5, r0, #0
	cmp r5, #0
	bne _0808FF70
	adds r0, r4, #0
	bl Proc_End
	b _0808FFB8
_0808FF70:
	bl GetGameLock
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r1, r4, #0
	adds r1, #0x4c
	movs r4, #0
	strh r0, [r1]
	ldr r2, _0808FFC0 @ =gDispIo
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
	subs r1, #0x80
	adds r0, r5, #0
	movs r2, #0
	bl sub_802D06C
	ldr r1, _0808FFC4 @ =gBattleStats
	movs r0, #0x88
	lsls r0, r0, #1
	strh r0, [r1]
	ldr r0, _0808FFC8 @ =gBattleActor
	adds r0, #0x4a
	strh r4, [r0]
	ldr r0, _0808FFCC @ =gBattleTarget
	adds r0, #0x4a
	strh r4, [r0]
	bl BeginBattleAnimations
_0808FFB8:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0808FFC0: .4byte gDispIo
_0808FFC4: .4byte gBattleStats
_0808FFC8: .4byte gBattleActor
_0808FFCC: .4byte gBattleTarget

	thumb_func_start sub_808FFD0
sub_808FFD0: @ 0x0808FFD0
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r0, #0x4c
	movs r1, #0
	ldrsh r4, [r0, r1]
	bl GetGameLock
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r4, r0
	bne _0808FFEC
	adds r0, r5, #0
	bl Proc_Break
_0808FFEC:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start NullExpForChar100AndResetScreen
NullExpForChar100AndResetScreen: @ 0x0808FFF4
	push {lr}
	sub sp, #4
	movs r0, #0x28
	bl GetUnitFromCharId
	adds r1, r0, #0
	cmp r1, #0
	beq _08090008
	movs r0, #0xff
	strb r0, [r1, #9]
_08090008:
	ldr r2, _08090058 @ =gDispIo
	adds r1, r2, #0
	adds r1, #0x3c
	movs r0, #0xc0
	ldrb r3, [r1]
	orrs r0, r3
	strb r0, [r1]
	adds r0, r2, #0
	adds r0, #0x44
	movs r3, #0
	strb r3, [r0]
	adds r0, #1
	strb r3, [r0]
	adds r1, #0xa
	movs r0, #0x10
	strb r0, [r1]
	subs r0, #0x12
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
	movs r2, #0x80
	lsls r2, r2, #1
	str r3, [sp]
	movs r0, #0x49
	adds r1, r2, #0
	movs r3, #0x20
	bl CallSomeSoundMaybe
	add sp, #4
	pop {r0}
	bx r0
	.align 2, 0
_08090058: .4byte gDispIo

	thumb_func_start PrepPromoteDebugMaybe
PrepPromoteDebugMaybe: @ 0x0809005C
	push {r4, lr}
	adds r4, r0, #0
	bl EndCgText
	bl ClearTalk
	bl EndEachSpriteAnimProc
	bl sub_8091104
	ldr r3, _080900DC @ =gDispIo
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
	adds r1, r3, #0
	adds r1, #0x3c
	movs r0, #0xc0
	ldrb r2, [r1]
	orrs r0, r2
	strb r0, [r1]
	adds r0, r3, #0
	adds r0, #0x44
	movs r1, #0
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r1, r3, #0
	adds r1, #0x46
	movs r0, #0x10
	strb r0, [r1]
	ldr r0, _080900E0 @ =0x0000FFE0
	ldrh r1, [r3, #0x3c]
	ands r0, r1
	movs r1, #0x1f
	orrs r0, r1
	strh r0, [r3, #0x3c]
	adds r0, r4, #0
	bl EndAllProcChildren
	ldr r0, _080900E4 @ =ProcScr_PrepPromoteDebug
	adds r1, r4, #0
	bl Proc_StartBlocking
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080900DC: .4byte gDispIo
_080900E0: .4byte 0x0000FFE0
_080900E4: .4byte ProcScr_PrepPromoteDebug

	thumb_func_start sub_80900E8
sub_80900E8: @ 0x080900E8
	push {lr}
	sub sp, #4
	movs r1, #0x80
	lsls r1, r1, #1
	movs r0, #0
	str r0, [sp]
	movs r2, #0
	movs r3, #0x20
	bl CallSomeSoundMaybe
	add sp, #4
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_8090104
sub_8090104: @ 0x08090104
	push {lr}
	ldr r0, _08090114 @ =gUnk_08D8C3A4
	movs r1, #3
	bl Proc_Start
	pop {r0}
	bx r0
	.align 2, 0
_08090114: .4byte gUnk_08D8C3A4

	thumb_func_start sub_8090118
sub_8090118: @ 0x08090118
	push {lr}
	ldr r0, _0809012C @ =gUnk_08D8C3A4
	bl Proc_Find
	cmp r0, #0
	beq _08090126
	movs r0, #1
_08090126:
	pop {r1}
	bx r1
	.align 2, 0
_0809012C: .4byte gUnk_08D8C3A4

	thumb_func_start sub_8090130
sub_8090130: @ 0x08090130
	push {lr}
	ldr r0, _08090144 @ =gUnk_08D8C154
	bl Proc_Find
	cmp r0, #0
	beq _0809013E
	movs r0, #1
_0809013E:
	pop {r1}
	bx r1
	.align 2, 0
_08090144: .4byte gUnk_08D8C154

	thumb_func_start sub_8090148
sub_8090148: @ 0x08090148
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #4
	adds r6, r0, #0
	mov r8, r1
	adds r4, r2, #0
	lsls r3, r3, #0x10
	lsrs r7, r3, #0x10
	movs r0, #1
	ands r0, r4
	cmp r0, #0
	beq _08090194
	subs r6, #4
	adds r1, r6, #2
	mov r2, r8
	adds r2, #2
	ldr r3, _0809018C @ =gUnk_08D8C55E
	str r7, [sp]
	movs r0, #4
	bl PutSpriteExt
	adds r1, r6, #0
	adds r1, #0x38
	ldr r0, _08090190 @ =gUnk_08D8C5D8
	ldr r3, [r0, #0x28]
	str r7, [sp]
	movs r0, #4
	mov r2, r8
	bl PutSpriteExt
	b _080901B4
	.align 2, 0
_0809018C: .4byte gUnk_08D8C55E
_08090190: .4byte gUnk_08D8C5D8
_08090194:
	adds r1, r6, #2
	mov r2, r8
	adds r2, #2
	ldr r3, _080901E0 @ =gUnk_08D8C544
	str r7, [sp]
	movs r0, #4
	bl PutSpriteExt
	adds r1, r6, #0
	adds r1, #0x38
	ldr r3, _080901E4 @ =gUnk_08D8C53C
	str r7, [sp]
	movs r0, #4
	mov r2, r8
	bl PutSpriteExt
_080901B4:
	ldr r3, _080901E8 @ =gUnk_08D8C52E
	str r7, [sp]
	movs r0, #4
	adds r1, r6, #0
	mov r2, r8
	bl PutSpriteExt
	asrs r4, r4, #1
	mov sb, r4
	cmp r4, #9
	bgt _080901F0
	adds r1, r6, #0
	adds r1, #0x28
	ldr r0, _080901EC @ =gUnk_08D8C5D8
	ldr r3, [r0, #0x2c]
	str r7, [sp]
	movs r0, #4
	mov r2, r8
	bl PutSpriteExt
	b _08090210
	.align 2, 0
_080901E0: .4byte gUnk_08D8C544
_080901E4: .4byte gUnk_08D8C53C
_080901E8: .4byte gUnk_08D8C52E
_080901EC: .4byte gUnk_08D8C5D8
_080901F0:
	adds r5, r6, #0
	adds r5, #0x28
	ldr r4, _08090240 @ =gUnk_08D8C5D8
	mov r0, sb
	movs r1, #0xa
	bl __divsi3
	lsls r0, r0, #2
	adds r0, r0, r4
	ldr r3, [r0]
	str r7, [sp]
	movs r0, #4
	adds r1, r5, #0
	mov r2, r8
	bl PutSpriteExt
_08090210:
	adds r5, r6, #0
	adds r5, #0x30
	ldr r4, _08090240 @ =gUnk_08D8C5D8
	mov r0, sb
	movs r1, #0xa
	bl __modsi3
	lsls r0, r0, #2
	adds r0, r0, r4
	ldr r3, [r0]
	str r7, [sp]
	movs r0, #4
	adds r1, r5, #0
	mov r2, r8
	bl PutSpriteExt
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08090240: .4byte gUnk_08D8C5D8

	thumb_func_start sub_8090244
sub_8090244: @ 0x08090244
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	adds r7, r0, #0
	bl CheckInLinkArena
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080902C8
	adds r1, r7, #0
	adds r1, #0x2f
	ldrb r0, [r1]
	cmp r0, #0
	beq _08090270
	adds r2, r0, #0
	movs r3, #0xc7
	lsls r3, r3, #7
	movs r0, #0x70
	movs r1, #4
	bl sub_8090148
_08090270:
	movs r0, #0x32
	adds r0, r0, r7
	mov r8, r0
	ldr r6, _080902BC @ =0x0000B680
	movs r5, #0x80
	movs r4, #2
_0809027C:
	str r6, [sp]
	movs r0, #4
	adds r1, r5, #0
	movs r2, #0x14
	ldr r3, _080902C0 @ =Sprite_32x16
	bl PutSpriteExt
	adds r6, #4
	adds r5, #0x20
	subs r4, #1
	cmp r4, #0
	bge _0809027C
	mov r1, r8
	ldrb r0, [r1]
	cmp r0, #0
	bne _080902A8
	ldrh r7, [r7, #0x34]
	lsrs r0, r7, #2
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _080902DA
_080902A8:
	ldr r3, _080902C4 @ =gUnk_08D8CDBC
	movs r0, #0xc0
	lsls r0, r0, #2
	str r0, [sp]
	movs r0, #4
	movs r1, #6
	movs r2, #0x80
	bl PutSpriteExt
	b _080902DA
	.align 2, 0
_080902BC: .4byte 0x0000B680
_080902C0: .4byte Sprite_32x16
_080902C4: .4byte gUnk_08D8CDBC
_080902C8:
	ldr r3, _080902E8 @ =gUnk_08D8CDD0
	movs r0, #0xc0
	lsls r0, r0, #2
	str r0, [sp]
	movs r0, #4
	movs r1, #6
	movs r2, #0x80
	bl PutSpriteExt
_080902DA:
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080902E8: .4byte gUnk_08D8CDD0

	thumb_func_start nullsub_77
nullsub_77: @ 0x080902EC
	bx lr
	.align 2, 0

	thumb_func_start sub_80902F0
sub_80902F0: @ 0x080902F0
	push {r4, r5, lr}
	sub sp, #8
	adds r5, r0, #0
	adds r1, r5, #0
	adds r1, #0x2a
	movs r0, #0
	strb r0, [r1]
	strh r0, [r5, #0x34]
	bl ForceSyncUnitSpriteSheet
	bl CheckInLinkArena
	lsls r0, r0, #0x18
	asrs r1, r0, #0x18
	cmp r1, #0
	beq _08090330
	ldr r0, _0809032C @ =gUnk_0841ECD0
	movs r2, #0x83
	lsls r2, r2, #3
	movs r3, #0xb9
	lsls r3, r3, #6
	movs r1, #1
	str r1, [sp]
	movs r1, #0xd
	str r1, [sp, #4]
	movs r1, #0x78
	bl StartSpriteAnimProc
	str r0, [r5, #0x38]
	b _08090368
	.align 2, 0
_0809032C: .4byte gUnk_0841ECD0
_08090330:
	ldr r0, _08090380 @ =gUnk_0841ECD0
	movs r2, #0x83
	lsls r2, r2, #3
	movs r3, #0xb9
	lsls r3, r3, #6
	str r1, [sp]
	movs r1, #0xd
	str r1, [sp, #4]
	movs r1, #0x78
	bl StartSpriteAnimProc
	str r0, [r5, #0x38]
	ldr r4, _08090384 @ =gPlaySt
	movs r0, #0xe
	ldrsb r0, [r4, r0]
	bl GetChapterInfo
	movs r1, #0
	ldrb r4, [r4, #0x1b]
	cmp r4, #3
	bne _0809035C
	movs r1, #1
_0809035C:
	adds r0, #0x80
	adds r0, r0, r1
	ldrb r0, [r0]
	adds r1, r5, #0
	adds r1, #0x2f
	strb r0, [r1]
_08090368:
	adds r1, r5, #0
	adds r1, #0x2b
	movs r0, #0
	strb r0, [r1]
	adds r1, #7
	movs r0, #1
	strb r0, [r1]
	add sp, #8
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08090380: .4byte gUnk_0841ECD0
_08090384: .4byte gPlaySt

	thumb_func_start sub_8090388
sub_8090388: @ 0x08090388
	push {r4, lr}
	adds r4, r0, #0
	bl sub_8090244
	ldrh r0, [r4, #0x34]
	adds r0, #1
	strh r0, [r4, #0x34]
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_809039C
sub_809039C: @ 0x0809039C
	push {lr}
	ldr r0, [r0, #0x38]
	bl EndSpriteAnimProc
	pop {r0}
	bx r0

	thumb_func_start sub_80903A8
sub_80903A8: @ 0x080903A8
	push {lr}
	ldr r0, _080903C0 @ =gUnk_08D8C6AC
	bl Proc_Find
	cmp r0, #0
	beq _080903BC
	adds r1, r0, #0
	adds r1, #0x32
	movs r0, #0
	strb r0, [r1]
_080903BC:
	pop {r0}
	bx r0
	.align 2, 0
_080903C0: .4byte gUnk_08D8C6AC

	thumb_func_start sub_80903C4
sub_80903C4: @ 0x080903C4
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r4, _080903E4 @ =gUnk_08D8C6AC
	adds r0, r4, #0
	bl Proc_Find
	bl Proc_End
	adds r0, r4, #0
	adds r1, r5, #0
	bl Proc_Start
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_080903E4: .4byte gUnk_08D8C6AC

	thumb_func_start sub_80903E8
sub_80903E8: @ 0x080903E8
	push {lr}
	ldr r0, _080903F8 @ =gUnk_08D8C6AC
	bl Proc_Find
	bl Proc_End
	pop {r0}
	bx r0
	.align 2, 0
_080903F8: .4byte gUnk_08D8C6AC

	thumb_func_start sub_80903FC
sub_80903FC: @ 0x080903FC
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r2, r0, #0
	adds r3, r2, #0
	subs r3, #0x38
	cmp r3, #0
	bge _08090412
	movs r7, #0
	adds r6, r2, #0
	b _08090428
_08090412:
	adds r0, r2, #0
	adds r0, #0x38
	cmp r0, #0xf0
	ble _08090422
	movs r7, #0xf
	adds r6, r2, #0
	subs r6, #0x78
	b _08090428
_08090422:
	asrs r7, r3, #3
	lsls r0, r7, #3
	subs r6, r2, r0
_08090428:
	adds r3, r1, #0
	subs r3, #0x28
	adds r0, r1, #0
	adds r0, #0x30
	cmp r0, #0xa0
	ble _0809043A
	movs r5, #8
	subs r1, #0x40
	b _0809044A
_0809043A:
	adds r0, r3, #0
	cmp r0, #0
	bge _08090444
	adds r0, r1, #0
	subs r0, #0x21
_08090444:
	asrs r5, r0, #3
	lsls r0, r5, #3
	subs r1, r1, r0
_0809044A:
	mov r8, r1
	ldr r4, _08090490 @ =gBg0Tm + 0x8
	adds r0, r4, #0
	movs r1, #2
	adds r2, r7, #0
	bl PutNumberOrBlank
	adds r0, r4, #0
	adds r0, #0x80
	movs r1, #2
	adds r2, r5, #0
	bl PutNumberOrBlank
	movs r1, #0x80
	lsls r1, r1, #1
	adds r0, r4, r1
	movs r1, #2
	adds r2, r6, #0
	bl PutNumberOrBlank
	movs r1, #0xc0
	lsls r1, r1, #1
	adds r0, r4, r1
	movs r1, #2
	mov r2, r8
	bl PutNumberOrBlank
	movs r0, #1
	bl EnableBgSync
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08090490: .4byte gBg0Tm + 0x8

	thumb_func_start sub_8090494
sub_8090494: @ 0x08090494
	push {r4, r5, lr}
	adds r5, r0, #0
	movs r2, #0
	movs r1, #7
	adds r0, #0x54
_0809049E:
	str r2, [r0]
	subs r0, #4
	subs r1, #1
	cmp r1, #0
	bge _0809049E
	movs r4, #0
	adds r0, r5, #0
	adds r0, #0x2a
	strb r4, [r0]
	adds r0, #1
	strb r4, [r0]
	adds r0, r5, #0
	bl ResetSysHandCursor
	movs r0, #0xc0
	lsls r0, r0, #3
	movs r1, #1
	bl DisplaySysHandCursorTextShadow
	str r4, [r5, #0x58]
	str r4, [r5, #0x5c]
	str r4, [r5, #0x60]
	adds r0, r5, #0
	adds r0, #0x29
	strb r4, [r0]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_80904D8
sub_80904D8: @ 0x080904D8
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	adds r4, r0, #0
	adds r5, r4, #0
	adds r5, #0x2a
	ldrb r0, [r5]
	mov sb, r0
	movs r1, #0x34
	ldrsh r0, [r4, r1]
	adds r0, #1
	lsls r0, r0, #3
	adds r0, #4
	mov r8, r0
	movs r2, #0x36
	ldrsh r0, [r4, r2]
	adds r0, #1
	lsls r0, r0, #3
	mov r3, sb
	lsls r1, r3, #4
	adds r7, r0, r1
	movs r3, #0x80
	lsls r3, r3, #3
	mov r0, r8
	adds r1, r7, #0
	movs r2, #6
	bl ShowSysHandCursor
	ldrb r5, [r5]
	lsls r1, r5, #2
	adds r0, r4, #0
	adds r0, #0x38
	adds r0, r0, r1
	ldr r5, [r0]
	adds r6, r4, #0
	adds r6, #0x29
	movs r0, #0
	ldrsb r0, [r6, r0]
	cmp r0, #0
	beq _0809054C
	ldr r2, _08090548 @ =gpKeySt
	ldr r1, [r2]
	movs r0, #0x81
	lsls r0, r0, #1
	ldrh r1, [r1, #8]
	ands r0, r1
	adds r1, r2, #0
	cmp r0, #0
	bne _0809053E
	b _08090664
_0809053E:
	bl CloseHelpBox
	movs r0, #0
	strb r0, [r6]
	b _0809070C
	.align 2, 0
_08090548: .4byte gpKeySt
_0809054C:
	ldr r1, _08090574 @ =gpKeySt
	ldr r0, [r1]
	ldrh r3, [r0, #8]
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r3
	cmp r0, #0
	beq _08090578
	ldr r2, [r5, #0x30]
	cmp r2, #0
	bne _08090564
	b _0809070C
_08090564:
	mov r0, r8
	adds r1, r7, #0
	bl StartHelpBox
	movs r0, #1
	strb r0, [r6]
	b _0809070C
	.align 2, 0
_08090574: .4byte gpKeySt
_08090578:
	movs r6, #1
	adds r0, r6, #0
	ands r0, r3
	cmp r0, #0
	beq _080905C4
	adds r1, r5, #0
	adds r1, #0x38
	adds r0, r6, #0
	ldrb r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _08090648
	ldr r0, [r5, #0x2c]
	cmp r0, #0
	beq _08090648
	adds r0, r4, #0
	movs r1, #0
	bl Proc_Goto
	ldr r0, [r4, #0x14]
	ldr r1, [r5, #0x2c]
	bl _call_via_r1
	ldr r0, _080905BC @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	bge _080905B4
	b _0809070C
_080905B4:
	ldr r0, _080905C0 @ =0x0000038A
	bl m4aSongNumStart
	b _0809070C
	.align 2, 0
_080905BC: .4byte gPlaySt
_080905C0: .4byte 0x0000038A
_080905C4:
	movs r0, #2
	ands r0, r3
	cmp r0, #0
	beq _08090608
	ldr r1, [r4, #0x58]
	cmp r1, #0
	bne _080905D4
	b _0809070C
_080905D4:
	ldr r0, [r4, #0x14]
	bl _call_via_r1
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08090648
	adds r0, r4, #0
	movs r1, #0
	bl Proc_Goto
	ldr r0, _08090600 @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	bge _080905F6
	b _0809070C
_080905F6:
	ldr r0, _08090604 @ =0x0000038B
	bl m4aSongNumStart
	b _0809070C
	.align 2, 0
_08090600: .4byte gPlaySt
_08090604: .4byte 0x0000038B
_08090608:
	movs r0, #8
	ands r0, r3
	cmp r0, #0
	beq _08090664
	ldr r1, [r4, #0x5c]
	cmp r1, #0
	beq _0809070C
	ldr r0, [r4, #0x14]
	bl _call_via_r1
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08090648
	ldr r0, _08090640 @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08090634
	ldr r0, _08090644 @ =0x0000038A
	bl m4aSongNumStart
_08090634:
	adds r0, r4, #0
	movs r1, #0
	bl Proc_Goto
	b _0809070C
	.align 2, 0
_08090640: .4byte gPlaySt
_08090644: .4byte 0x0000038A
_08090648:
	ldr r0, _08090660 @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0809070C
	movs r0, #0xe3
	lsls r0, r0, #2
	bl m4aSongNumStart
	b _0809070C
	.align 2, 0
_08090660: .4byte gPlaySt
_08090664:
	ldr r3, [r1]
	movs r6, #0x40
	adds r0, r6, #0
	ldrh r2, [r3, #6]
	ands r0, r2
	adds r5, r4, #0
	adds r5, #0x2a
	cmp r0, #0
	beq _08090690
	ldrb r0, [r5]
	cmp r0, #0
	bne _0809068C
	adds r0, r6, #0
	ldrh r3, [r3, #8]
	ands r0, r3
	cmp r0, #0
	beq _08090690
	adds r0, r4, #0
	adds r0, #0x2b
	ldrb r0, [r0]
_0809068C:
	subs r0, #1
	strb r0, [r5]
_08090690:
	ldr r1, [r1]
	movs r2, #0x80
	adds r0, r2, #0
	ldrh r3, [r1, #6]
	ands r0, r3
	cmp r0, #0
	beq _080906BE
	ldrb r3, [r5]
	adds r0, r4, #0
	adds r0, #0x2b
	ldrb r0, [r0]
	subs r0, #1
	cmp r3, r0
	bge _080906B0
	adds r0, r3, #1
	b _080906BC
_080906B0:
	adds r0, r2, #0
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _080906BE
	movs r0, #0
_080906BC:
	strb r0, [r5]
_080906BE:
	ldrb r0, [r5]
	cmp sb, r0
	beq _0809070C
	ldr r0, _08090718 @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080906D6
	ldr r0, _0809071C @ =0x00000386
	bl m4aSongNumStart
_080906D6:
	adds r0, r4, #0
	adds r0, #0x29
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _0809070C
	movs r1, #0x34
	ldrsh r0, [r4, r1]
	adds r0, #1
	lsls r0, r0, #3
	adds r0, #4
	movs r2, #0x36
	ldrsh r1, [r4, r2]
	adds r1, #1
	lsls r1, r1, #3
	ldrb r3, [r5]
	lsls r2, r3, #4
	adds r1, r1, r2
	lsls r3, r3, #2
	adds r2, r4, #0
	adds r2, #0x38
	adds r2, r2, r3
	ldr r5, [r2]
	ldr r2, [r5, #0x30]
	bl StartHelpBox
_0809070C:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08090718: .4byte gPlaySt
_0809071C: .4byte 0x00000386

	thumb_func_start sub_8090720
sub_8090720: @ 0x08090720
	push {lr}
	adds r2, r0, #0
	movs r1, #0x34
	ldrsh r0, [r2, r1]
	adds r0, #1
	lsls r0, r0, #3
	adds r0, #4
	movs r3, #0x36
	ldrsh r1, [r2, r3]
	adds r1, #1
	lsls r1, r1, #3
	adds r2, #0x2a
	ldrb r2, [r2]
	lsls r2, r2, #4
	adds r1, r1, r2
	bl sub_804A7EC
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_8090748
sub_8090748: @ 0x08090748
	push {lr}
	adds r2, r0, #0
	movs r1, #0x34
	ldrsh r0, [r2, r1]
	adds r0, #1
	lsls r0, r0, #3
	adds r0, #4
	movs r3, #0x36
	ldrsh r1, [r2, r3]
	adds r1, #1
	lsls r1, r1, #3
	adds r2, #0x2a
	ldrb r2, [r2]
	lsls r2, r2, #4
	adds r1, r1, r2
	movs r3, #0x80
	lsls r3, r3, #3
	movs r2, #6
	bl ShowSysHandCursor
	pop {r0}
	bx r0

	thumb_func_start sub_8090774
sub_8090774: @ 0x08090774
	push {lr}
	ldr r1, [r0, #0x60]
	cmp r1, #0
	beq _08090782
	ldr r0, [r0, #0x14]
	bl _call_via_r1
_08090782:
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_8090788
sub_8090788: @ 0x08090788
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r4, _080907A8 @ =gUnk_08D8C6E4
	adds r0, r4, #0
	bl Proc_Find
	bl Proc_End
	adds r0, r4, #0
	adds r1, r5, #0
	bl Proc_Start
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080907A8: .4byte gUnk_08D8C6E4

	thumb_func_start sub_80907AC
sub_80907AC: @ 0x080907AC
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _080907C4 @ =gUnk_08D8C6E4
	bl Proc_Find
	cmp r0, #0
	beq _080907BC
	str r4, [r0, #0x58]
_080907BC:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080907C4: .4byte gUnk_08D8C6E4

	thumb_func_start sub_80907C8
sub_80907C8: @ 0x080907C8
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _080907E0 @ =gUnk_08D8C6E4
	bl Proc_Find
	cmp r0, #0
	beq _080907D8
	str r4, [r0, #0x5c]
_080907D8:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080907E0: .4byte gUnk_08D8C6E4

	thumb_func_start sub_80907E4
sub_80907E4: @ 0x080907E4
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _080907FC @ =gUnk_08D8C6E4
	bl Proc_Find
	cmp r0, #0
	beq _080907F4
	str r4, [r0, #0x60]
_080907F4:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080907FC: .4byte gUnk_08D8C6E4

	thumb_func_start sub_8090800
sub_8090800: @ 0x08090800
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	adds r6, r0, #0
	adds r7, r1, #0
	mov r8, r2
	mov sb, r3
	ldr r0, _08090850 @ =gUnk_08D8C6E4
	bl Proc_Find
	adds r1, r0, #0
	cmp r1, #0
	beq _08090894
	movs r4, #0
	movs r0, #0x38
	adds r0, r0, r1
	mov sl, r0
	mov r3, sl
_08090828:
	ldr r2, [r3]
	cmp r2, #0
	beq _08090854
	adds r0, r2, #0
	adds r0, #0x39
	ldrb r0, [r0]
	cmp r0, r6
	bne _08090854
	str r7, [r2, #0x2c]
	adds r0, r2, #0
	adds r0, #0x38
	mov r1, r8
	strb r1, [r0]
	ldr r0, [r3]
	mov r2, sb
	str r2, [r0, #0x34]
	ldr r1, [sp, #0x20]
	str r1, [r0, #0x30]
	b _08090894
	.align 2, 0
_08090850: .4byte gUnk_08D8C6E4
_08090854:
	adds r3, #4
	adds r4, #1
	cmp r4, #7
	ble _08090828
	adds r5, r1, #0
	adds r5, #0x2b
	ldrb r4, [r5]
	ldr r0, _080908A4 @ =gUnk_08D8C6D4
	bl Proc_Start
	lsls r1, r4, #2
	add r1, sl
	str r0, [r1]
	adds r0, #0x39
	strb r6, [r0]
	ldr r0, [r1]
	str r7, [r0, #0x2c]
	adds r0, #0x38
	mov r2, r8
	strb r2, [r0]
	ldr r0, [r1]
	mov r1, sb
	str r1, [r0, #0x34]
	ldr r2, [sp, #0x20]
	str r2, [r0, #0x30]
	adds r0, #0x3c
	movs r1, #7
	bl InitText
	ldrb r0, [r5]
	adds r0, #1
	strb r0, [r5]
_08090894:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080908A4: .4byte gUnk_08D8C6D4

	thumb_func_start sub_80908A8
sub_80908A8: @ 0x080908A8
	push {r4, r5, lr}
	adds r5, r0, #0
	movs r4, #0
	ldr r0, _080908D4 @ =gUnk_08D8C6E4
	bl Proc_Find
	cmp r0, #0
	beq _080908E2
	movs r2, #0
	adds r3, r0, #0
	adds r3, #0x2a
	adds r1, r0, #0
	adds r1, #0x38
_080908C2:
	ldr r0, [r1]
	cmp r0, #0
	beq _080908DA
	adds r0, #0x39
	ldrb r0, [r0]
	cmp r0, r5
	bne _080908D8
	strb r4, [r3]
	b _080908E2
	.align 2, 0
_080908D4: .4byte gUnk_08D8C6E4
_080908D8:
	adds r4, #1
_080908DA:
	adds r1, #4
	adds r2, #1
	cmp r2, #7
	ble _080908C2
_080908E2:
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start sub_80908E8
sub_80908E8: @ 0x080908E8
	push {r4, r5, lr}
	movs r4, #0
	ldr r0, _08090918 @ =gUnk_08D8C6E4
	bl Proc_Find
	cmp r0, #0
	beq _08090926
	movs r3, #0
	movs r1, #0x2a
	adds r1, r1, r0
	mov ip, r1
	adds r2, r0, #0
	adds r2, #0x38
_08090902:
	ldr r1, [r2]
	cmp r1, #0
	beq _0809091E
	mov r5, ip
	ldrb r0, [r5]
	cmp r0, r4
	bne _0809091C
	adds r0, r1, #0
	adds r0, #0x39
	ldrb r0, [r0]
	b _08090928
	.align 2, 0
_08090918: .4byte gUnk_08D8C6E4
_0809091C:
	adds r4, #1
_0809091E:
	adds r2, #4
	adds r3, #1
	cmp r3, #7
	ble _08090902
_08090926:
	movs r0, #0
_08090928:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_8090930
sub_8090930: @ 0x08090930
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #8
	adds r6, r0, #0
	adds r5, r1, #0
	ldr r0, _080909D4 @ =gUnk_08D8C6E4
	bl Proc_Find
	mov sb, r0
	cmp r0, #0
	beq _080909C6
	movs r0, #0
	mov r1, sb
	strh r6, [r1, #0x34]
	strh r5, [r1, #0x36]
	mov r4, sb
	adds r4, #0x2b
	ldrb r1, [r4]
	lsls r3, r1, #1
	adds r3, #2
	str r0, [sp]
	adds r0, r6, #0
	adds r1, r5, #0
	movs r2, #0xa
	bl sub_804A4CC
	mov r8, r4
	ldrb r0, [r4]
	cmp r0, #1
	bls _080909C0
	movs r7, #0
	adds r1, r0, #0
	cmp r7, r1
	bge _080909C0
	adds r0, r5, #1
	lsls r0, r0, #5
	adds r0, #2
	adds r6, r0, r6
_08090980:
	lsls r1, r7, #2
	mov r0, sb
	adds r0, #0x38
	adds r0, r0, r1
	ldr r4, [r0]
	adds r5, r4, #0
	adds r5, #0x3c
	adds r0, r5, #0
	bl ClearText
	ldr r0, [r4, #0x34]
	bl DecodeMsg
	lsls r1, r6, #1
	ldr r2, _080909D8 @ =gBg0Tm
	adds r1, r1, r2
	adds r4, #0x38
	movs r2, #1
	ldrb r4, [r4]
	ands r2, r4
	movs r3, #0
	str r3, [sp]
	str r0, [sp, #4]
	adds r0, r5, #0
	bl PutDrawText
	adds r6, #0x40
	adds r7, #1
	mov r0, r8
	ldrb r0, [r0]
	cmp r7, r0
	blt _08090980
_080909C0:
	movs r0, #3
	bl EnableBgSync
_080909C6:
	add sp, #8
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080909D4: .4byte gUnk_08D8C6E4
_080909D8: .4byte gBg0Tm

	thumb_func_start sub_80909DC
sub_80909DC: @ 0x080909DC
	push {lr}
	ldr r0, _080909EC @ =gUnk_08D8C6E4
	bl Proc_Find
	cmp r0, #0
	bne _080909F0
	movs r0, #0
	b _080909F4
	.align 2, 0
_080909EC: .4byte gUnk_08D8C6E4
_080909F0:
	adds r0, #0x2b
	ldrb r0, [r0]
_080909F4:
	pop {r1}
	bx r1

	thumb_func_start sub_80909F8
sub_80909F8: @ 0x080909F8
	push {r4, lr}
	ldr r0, _08090A18 @ =gUnk_08D8C6E4
	bl Proc_Find
	adds r4, r0, #0
	cmp r4, #0
	beq _08090A12
	bl sub_8090A1C
	adds r0, r4, #0
	movs r1, #0xa
	bl Proc_Goto
_08090A12:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08090A18: .4byte gUnk_08D8C6E4

	thumb_func_start sub_8090A1C
sub_8090A1C: @ 0x08090A1C
	push {r4, r5, lr}
	ldr r0, _08090A7C @ =gUnk_08D8C6E4
	bl Proc_Find
	adds r4, r0, #0
	cmp r4, #0
	beq _08090A74
	movs r1, #0x36
	ldrsh r0, [r4, r1]
	lsls r0, r0, #5
	movs r2, #0x34
	ldrsh r1, [r4, r2]
	adds r0, r0, r1
	lsls r0, r0, #1
	ldr r1, _08090A80 @ =gBg0Tm
	adds r0, r0, r1
	adds r5, r4, #0
	adds r5, #0x2b
	ldrb r1, [r5]
	lsls r2, r1, #1
	adds r2, #2
	movs r1, #9
	movs r3, #0
	bl TmFillRect_thm
	movs r2, #0x36
	ldrsh r0, [r4, r2]
	lsls r0, r0, #5
	movs r2, #0x34
	ldrsh r1, [r4, r2]
	adds r0, r0, r1
	lsls r0, r0, #1
	ldr r1, _08090A84 @ =gBg1Tm
	adds r0, r0, r1
	ldrb r5, [r5]
	lsls r2, r5, #1
	adds r2, #2
	movs r1, #9
	movs r3, #0
	bl TmFillRect_thm
	movs r0, #3
	bl EnableBgSync
_08090A74:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08090A7C: .4byte gUnk_08D8C6E4
_08090A80: .4byte gBg0Tm
_08090A84: .4byte gBg1Tm

	thumb_func_start sub_8090A88
sub_8090A88: @ 0x08090A88
	push {lr}
	ldr r0, _08090A98 @ =gUnk_08D8C6E4
	bl Proc_Find
	cmp r0, #0
	bne _08090A9C
	movs r0, #0
	b _08090A9E
	.align 2, 0
_08090A98: .4byte gUnk_08D8C6E4
_08090A9C:
	movs r0, #1
_08090A9E:
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_8090AA4
sub_8090AA4: @ 0x08090AA4
	push {lr}
	ldr r0, _08090ABC @ =gUnk_08D8C6E4
	bl Proc_Find
	cmp r0, #0
	beq _08090AB6
	movs r1, #2
	bl Proc_Goto
_08090AB6:
	pop {r0}
	bx r0
	.align 2, 0
_08090ABC: .4byte gUnk_08D8C6E4

	thumb_func_start sub_8090AC0
sub_8090AC0: @ 0x08090AC0
	push {lr}
	ldr r0, _08090AD8 @ =gUnk_08D8C6E4
	bl Proc_Find
	cmp r0, #0
	beq _08090AD2
	movs r1, #0
	bl Proc_Goto
_08090AD2:
	pop {r0}
	bx r0
	.align 2, 0
_08090AD8: .4byte gUnk_08D8C6E4

	thumb_func_start sub_8090ADC
sub_8090ADC: @ 0x08090ADC
	push {lr}
	ldr r0, _08090AF4 @ =gUnk_08D8C6E4
	bl Proc_Find
	cmp r0, #0
	beq _08090AEE
	movs r1, #1
	bl Proc_Goto
_08090AEE:
	pop {r0}
	bx r0
	.align 2, 0
_08090AF4: .4byte gUnk_08D8C6E4

	thumb_func_start sub_8090AF8
sub_8090AF8: @ 0x08090AF8
	adds r3, r0, #0
	movs r2, #0
	movs r1, #0
	strh r1, [r3, #0x2a]
	adds r0, #0x2c
	strb r2, [r0]
	adds r0, #1
	strb r2, [r0]
	strh r1, [r3, #0x2e]
	strh r1, [r3, #0x32]
	adds r0, #7
	strb r2, [r0]
	ldrh r0, [r3, #0x2e]
	strh r0, [r3, #0x30]
	movs r0, #0xe4
	lsls r0, r0, #2
	strh r0, [r3, #0x36]
	movs r0, #0x80
	lsls r0, r0, #5
	strh r0, [r3, #0x38]
	adds r0, r3, #0
	adds r0, #0x3a
	strb r2, [r0]
	adds r0, #1
	strb r2, [r0]
	bx lr

	thumb_func_start sub_8090B2C
sub_8090B2C: @ 0x08090B2C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x1c
	adds r4, r0, #0
	ldrh r0, [r4, #0x38]
	ldrh r1, [r4, #0x36]
	adds r0, r0, r1
	mov sb, r0
	adds r0, r4, #0
	adds r0, #0x34
	ldrh r2, [r4, #0x32]
	ldrb r0, [r0]
	cmp r2, r0
	bhi _08090B50
	b _08090D62
_08090B50:
	movs r6, #0
	adds r0, r4, #0
	adds r0, #0x2d
	mov sl, r0
	adds r3, r4, #0
	adds r3, #0x3a
	str r3, [sp, #0x14]
	adds r5, r4, #0
	adds r5, #0x3b
	str r5, [sp, #0x18]
	ldrb r0, [r0]
	cmp r6, r0
	bge _08090B8C
_08090B6A:
	ldrh r1, [r4, #0x2a]
	adds r0, r4, #0
	adds r0, #0x2c
	lsls r2, r6, #3
	ldrb r0, [r0]
	adds r2, r0, r2
	mov r3, sb
	str r3, [sp]
	movs r0, #4
	ldr r3, _08090C74 @ =gUnk_08D8C73C
	bl PutSpriteExt
	adds r6, #1
	mov r5, sl
	ldrb r5, [r5]
	cmp r6, r5
	blt _08090B6A
_08090B8C:
	cmp r6, #0
	bne _08090B92
	b _08090D10
_08090B92:
	mov r6, sl
	ldrb r6, [r6]
	lsls r7, r6, #0x13
	ldrh r0, [r4, #0x2e]
	str r0, [sp, #0xc]
	ldrh r5, [r4, #0x32]
	adds r0, r4, #0
	adds r0, #0x34
	ldrb r6, [r0]
	str r0, [sp, #0x10]
	movs r1, #0x2c
	adds r1, r1, r4
	mov r8, r1
	cmp r5, r6
	bhi _08090BB2
	b _08090CE4
_08090BB2:
	adds r0, r7, #0
	adds r1, r5, #0
	bl __udivsi3
	str r0, [sp, #4]
	adds r0, r7, #0
	muls r0, r6, r0
	adds r1, r5, #0
	bl __udivsi3
	str r0, [sp, #8]
	ldr r2, [sp, #0xc]
	cmp r2, #0
	beq _08090BF2
	ldrh r3, [r4, #0x2a]
	ldr r5, _08090C78 @ =0x00002001
	adds r1, r3, r5
	mov r6, r8
	ldrb r2, [r6]
	subs r2, #8
	ldr r3, _08090C7C @ =gUnk_08D8C7E8
	ldr r5, [sp, #0x14]
	ldrb r5, [r5]
	lsrs r0, r5, #3
	lsls r0, r0, #2
	adds r0, r0, r3
	ldr r3, [r0]
	mov r6, sb
	str r6, [sp]
	movs r0, #4
	bl PutSpriteExt
_08090BF2:
	movs r6, #0
	ldr r0, [sp, #8]
	lsrs r5, r0, #0x13
	cmp r6, r5
	bhs _08090C28
	ldr r1, [sp, #4]
	ldr r2, [sp, #0xc]
	adds r0, r1, #0
	muls r0, r2, r0
	lsrs r7, r0, #0x14
_08090C06:
	ldrh r1, [r4, #0x2a]
	adds r1, #1
	mov r3, r8
	ldrb r3, [r3]
	adds r2, r3, r7
	lsls r0, r6, #3
	adds r2, r2, r0
	ldr r0, _08090C80 @ =gUnk_08D8C794
	ldr r3, [r0, #0x20]
	mov r0, sb
	str r0, [sp]
	movs r0, #4
	bl PutSpriteExt
	adds r6, #1
	cmp r6, r5
	blo _08090C06
_08090C28:
	ldrh r1, [r4, #0x2e]
	lsrs r0, r1, #4
	ldr r2, [sp, #0x10]
	ldrb r2, [r2]
	adds r0, r2, r0
	ldrh r3, [r4, #0x32]
	cmp r0, r3
	bne _08090C84
	mov r5, sl
	ldrb r5, [r5]
	lsls r0, r5, #3
	ldr r2, [sp, #4]
	ldr r3, [sp, #0xc]
	adds r1, r2, #0
	muls r1, r3, r1
	lsrs r2, r1, #0x14
	lsls r3, r6, #3
	adds r1, r2, r3
	subs r0, r0, r1
	cmp r0, #0
	beq _08090CE4
	ldrh r1, [r4, #0x2a]
	adds r1, #1
	mov r5, r8
	ldrb r5, [r5]
	adds r2, r5, r2
	adds r2, r2, r3
	ldr r3, _08090C80 @ =gUnk_08D8C794
	lsls r0, r0, #2
	adds r0, r0, r3
	ldr r3, [r0]
	mov r6, sb
	str r6, [sp]
	movs r0, #4
	bl PutSpriteExt
	b _08090CE4
	.align 2, 0
_08090C74: .4byte gUnk_08D8C73C
_08090C78: .4byte 0x00002001
_08090C7C: .4byte gUnk_08D8C7E8
_08090C80: .4byte gUnk_08D8C794
_08090C84:
	ldr r0, [sp, #8]
	lsrs r5, r0, #0x10
	movs r0, #7
	ands r5, r0
	cmp r5, #0
	beq _08090CBA
	ldrh r1, [r4, #0x2a]
	adds r1, #1
	ldr r3, [sp, #4]
	ldr r0, [sp, #0xc]
	adds r2, r3, #0
	muls r2, r0, r2
	lsrs r2, r2, #0x14
	mov r3, r8
	ldrb r3, [r3]
	adds r2, r3, r2
	lsls r0, r6, #3
	adds r2, r2, r0
	ldr r3, _08090D74 @ =gUnk_08D8C794
	lsls r0, r5, #2
	adds r0, r0, r3
	ldr r3, [r0]
	mov r5, sb
	str r5, [sp]
	movs r0, #4
	bl PutSpriteExt
_08090CBA:
	ldrh r1, [r4, #0x2a]
	adds r1, #1
	mov r6, sl
	ldrb r6, [r6]
	lsls r2, r6, #3
	mov r0, r8
	ldrb r0, [r0]
	adds r2, r0, r2
	adds r2, #1
	ldr r3, _08090D78 @ =gUnk_08D8C7E8
	ldr r5, [sp, #0x18]
	ldrb r5, [r5]
	lsrs r0, r5, #3
	lsls r0, r0, #2
	adds r0, r0, r3
	ldr r3, [r0]
	mov r6, sb
	str r6, [sp]
	movs r0, #4
	bl PutSpriteExt
_08090CE4:
	ldrh r1, [r4, #0x2a]
	mov r0, r8
	ldrb r2, [r0]
	subs r2, #8
	ldr r3, _08090D7C @ =gUnk_08D8C744
	mov r5, sb
	str r5, [sp]
	movs r0, #4
	bl PutSpriteExt
	ldrh r1, [r4, #0x2a]
	mov r6, sl
	ldrb r6, [r6]
	lsls r2, r6, #3
	mov r0, r8
	ldrb r0, [r0]
	adds r2, r0, r2
	ldr r3, _08090D80 @ =gUnk_08D8C74C
	str r5, [sp]
	movs r0, #4
	bl PutSpriteExt
_08090D10:
	ldrh r1, [r4, #0x30]
	ldrh r0, [r4, #0x2e]
	cmp r1, r0
	beq _08090D38
	cmp r1, r0
	bls _08090D24
	ldr r1, [sp, #0x14]
	ldrb r0, [r1]
	adds r0, #3
	strb r0, [r1]
_08090D24:
	ldrh r2, [r4, #0x30]
	ldrh r3, [r4, #0x2e]
	cmp r2, r3
	bhs _08090D34
	ldr r5, [sp, #0x18]
	ldrb r0, [r5]
	adds r0, #3
	strb r0, [r5]
_08090D34:
	ldrh r0, [r4, #0x2e]
	strh r0, [r4, #0x30]
_08090D38:
	ldr r6, [sp, #0x14]
	ldrb r0, [r6]
	adds r0, #1
	movs r1, #0
	strb r0, [r6]
	ldr r2, [sp, #0x18]
	ldrb r0, [r2]
	adds r0, #1
	strb r0, [r2]
	ldrb r3, [r6]
	lsrs r0, r3, #3
	cmp r0, #5
	bls _08090D54
	strb r1, [r6]
_08090D54:
	ldr r5, [sp, #0x18]
	ldrb r5, [r5]
	lsrs r0, r5, #3
	cmp r0, #5
	bls _08090D62
	ldr r6, [sp, #0x18]
	strb r1, [r6]
_08090D62:
	add sp, #0x1c
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08090D74: .4byte gUnk_08D8C794
_08090D78: .4byte gUnk_08D8C7E8
_08090D7C: .4byte gUnk_08D8C744
_08090D80: .4byte gUnk_08D8C74C

	thumb_func_start sub_8090D84
sub_8090D84: @ 0x08090D84
	push {lr}
	ldr r0, _08090D9C @ =gUnk_08D8C8AC
	bl Proc_Find
	cmp r0, #0
	beq _08090D96
	movs r1, #1
	bl Proc_Goto
_08090D96:
	pop {r0}
	bx r0
	.align 2, 0
_08090D9C: .4byte gUnk_08D8C8AC

	thumb_func_start sub_8090DA0
sub_8090DA0: @ 0x08090DA0
	push {lr}
	ldr r0, _08090DB8 @ =gUnk_08D8C8AC
	bl Proc_Find
	cmp r0, #0
	beq _08090DB2
	movs r1, #0
	bl Proc_Goto
_08090DB2:
	pop {r0}
	bx r0
	.align 2, 0
_08090DB8: .4byte gUnk_08D8C8AC

	thumb_func_start sub_8090DBC
sub_8090DBC: @ 0x08090DBC
	push {lr}
	ldr r0, _08090DCC @ =gUnk_08D8C8AC
	bl Proc_Find
	bl Proc_End
	pop {r0}
	bx r0
	.align 2, 0
_08090DCC: .4byte gUnk_08D8C8AC

	thumb_func_start sub_8090DD0
sub_8090DD0: @ 0x08090DD0
	push {lr}
	adds r1, r0, #0
	ldr r0, _08090DE0 @ =gUnk_08D8C8AC
	bl Proc_Start
	pop {r1}
	bx r1
	.align 2, 0
_08090DE0: .4byte gUnk_08D8C8AC

	thumb_func_start sub_8090DE4
sub_8090DE4: @ 0x08090DE4
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r0, _08090E00 @ =gUnk_08D8C8AC
	bl Proc_Find
	cmp r0, #0
	beq _08090DFA
	strh r4, [r0, #0x2a]
	adds r0, #0x2c
	strb r5, [r0]
_08090DFA:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08090E00: .4byte gUnk_08D8C8AC

	thumb_func_start sub_8090E04
sub_8090E04: @ 0x08090E04
	push {r4, r5, r6, r7, lr}
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	lsls r1, r1, #0x10
	lsrs r6, r1, #0x10
	lsls r2, r2, #0x10
	lsrs r4, r2, #0x10
	lsls r3, r3, #0x18
	lsrs r5, r3, #0x18
	ldr r0, _08090E34 @ =gUnk_08D8C8AC
	bl Proc_Find
	cmp r0, #0
	beq _08090E2E
	adds r1, r0, #0
	adds r1, #0x2d
	strb r7, [r1]
	strh r6, [r0, #0x2e]
	strh r4, [r0, #0x32]
	adds r0, #0x34
	strb r5, [r0]
_08090E2E:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08090E34: .4byte gUnk_08D8C8AC

	thumb_func_start sub_8090E38
sub_8090E38: @ 0x08090E38
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r0, _08090E70 @ =gUnk_0841E084
	adds r1, #0x10
	lsls r1, r1, #5
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r0, _08090E74 @ =gUnk_0841DFE0
	ldr r2, _08090E78 @ =0x06010000
	adds r1, r4, r2
	bl Decompress
	ldr r0, _08090E7C @ =gUnk_08D8C8AC
	bl Proc_Find
	adds r2, r0, #0
	cmp r2, #0
	beq _08090E68
	asrs r0, r4, #5
	strh r0, [r2, #0x36]
	lsls r0, r5, #0xc
	strh r0, [r2, #0x38]
_08090E68:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08090E70: .4byte gUnk_0841E084
_08090E74: .4byte gUnk_0841DFE0
_08090E78: .4byte 0x06010000
_08090E7C: .4byte gUnk_08D8C8AC

	thumb_func_start sub_8090E80
sub_8090E80: @ 0x08090E80
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r4, r0, #0
	mov r8, r1
	adds r5, r2, #0
	adds r6, r3, #0
	ldr r7, [sp, #0x18]
	bl ClearText
	adds r0, r4, #0
	adds r1, r5, #0
	bl Text_SetColor
	adds r0, r4, #0
	adds r1, r6, #0
	bl Text_SetCursor
	adds r0, r4, #0
	adds r1, r7, #0
	bl Text_DrawString
	adds r0, r4, #0
	mov r1, r8
	bl PutText
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_8090EC0
sub_8090EC0: @ 0x08090EC0
	push {r4, lr}
	adds r3, r0, #0
	ldr r4, _08090ED4 @ =0x02012466
	ldrh r0, [r4]
	adds r2, r0, #0
	cmp r2, #0
	bne _08090ED8
	strb r2, [r3]
	strh r2, [r1]
	b _08090F0C
	.align 2, 0
_08090ED4: .4byte 0x02012466
_08090ED8:
	cmp r2, #7
	bhi _08090EEA
	ldrb r4, [r3]
	cmp r4, r2
	blo _08090EE6
	subs r0, #1
	strb r0, [r3]
_08090EE6:
	movs r0, #0
	b _08090F0A
_08090EEA:
	ldrh r2, [r1]
	lsrs r0, r2, #4
	adds r2, r0, #7
	ldrh r0, [r4]
	cmp r2, r0
	bge _08090F02
	ldrb r4, [r3]
	cmp r4, #6
	bne _08090F0C
	movs r0, #5
	strb r0, [r3]
	b _08090F0C
_08090F02:
	cmp r2, r0
	ble _08090F0C
	subs r0, #7
	lsls r0, r0, #4
_08090F0A:
	strh r0, [r1]
_08090F0C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_8090F14
sub_8090F14: @ 0x08090F14
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	adds r6, r0, #0
	ldr r4, _08090FC8 @ =gBg3Tm
	adds r0, r4, #0
	movs r1, #0
	bl TmFill
	bl GetGameTime
	movs r0, #0
	strh r0, [r6, #0x2a]
	movs r7, #0
	mov sl, r4
	movs r0, #0x2d
	adds r0, r0, r6
	mov sb, r0
	adds r1, r6, #0
	adds r1, #0x2c
	str r1, [sp]
_08090F44:
	movs r5, #0
	adds r3, r7, #1
	mov r8, r3
_08090F4A:
	ldrh r0, [r6, #0x2a]
	lsrs r4, r0, #3
	adds r4, r7, r4
	adds r0, r4, #0
	movs r1, #0x28
	bl __modsi3
	movs r1, #0x27
	subs r1, r1, r0
	movs r0, #0x1f
	ands r4, r0
	lsls r4, r4, #6
	lsls r2, r5, #1
	adds r4, r4, r2
	add r4, sl
	lsls r0, r1, #4
	subs r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _08090FCC @ =gUnk_08426FF2
	adds r0, r0, r1
	adds r2, r2, r0
	mov r3, sb
	ldrb r3, [r3]
	lsls r0, r3, #0xc
	ldrh r2, [r2]
	adds r0, r2, r0
	strh r0, [r4]
	adds r0, r5, #1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	cmp r5, #0x1d
	bls _08090F4A
	mov r1, r8
	lsls r0, r1, #0x10
	lsrs r7, r0, #0x10
	cmp r7, #0x1f
	bls _08090F44
	movs r0, #8
	bl EnableBgSync
	movs r0, #0
	ldr r3, [sp]
	strb r0, [r3]
	movs r4, #0xff
	adds r2, r4, #0
	ldrh r0, [r6, #0x2a]
	ands r2, r0
	movs r0, #3
	movs r1, #0
	bl SetBgOffset
	ldr r0, _08090FD0 @ =0x0400001E
	ldrh r6, [r6, #0x2a]
	ands r4, r6
	strh r4, [r0]
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08090FC8: .4byte gBg3Tm
_08090FCC: .4byte gUnk_08426FF2
_08090FD0: .4byte 0x0400001E

	thumb_func_start sub_8090FD4
sub_8090FD4: @ 0x08090FD4
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	adds r6, r0, #0
	adds r5, r6, #0
	adds r5, #0x2c
	ldrb r0, [r5]
	cmp r0, #3
	bne _08091018
	ldrh r0, [r6, #0x2a]
	adds r0, #1
	strh r0, [r6, #0x2a]
	lsls r0, r0, #0x10
	movs r1, #0xa0
	lsls r1, r1, #0x13
	cmp r0, r1
	bne _08090FFC
	movs r0, #0
	strh r0, [r6, #0x2a]
_08090FFC:
	movs r4, #0xff
	adds r2, r4, #0
	ldrh r1, [r6, #0x2a]
	ands r2, r1
	movs r0, #3
	movs r1, #0
	bl SetBgOffset
	ldr r0, _080910A4 @ =0x0400001E
	ldrh r7, [r6, #0x2a]
	ands r4, r7
	strh r4, [r0]
	movs r0, #0
	strb r0, [r5]
_08091018:
	adds r1, r6, #0
	adds r1, #0x2c
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	ldrh r1, [r6, #0x2a]
	movs r0, #7
	ands r0, r1
	cmp r0, #0
	bne _08091098
	ldr r5, _080910A8 @ =gUnk_08426FF2
	lsrs r0, r1, #3
	subs r4, r0, #1
	movs r1, #0x1f
	ands r4, r1
	adds r0, #0x1f
	movs r1, #0x28
	bl __modsi3
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r3, #0
	ldr r1, _080910AC @ =gBg3Tm
	mov r8, r1
	lsls r4, r4, #6
	movs r1, #0x27
	subs r1, r1, r0
	lsls r0, r1, #4
	subs r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r5
	mov sb, r0
	mov ip, r8
	adds r5, r6, #0
	adds r5, #0x2d
	adds r6, r4, #0
_08091060:
	lsls r1, r3, #1
	adds r2, r4, r1
	add r2, ip
	add r1, sb
	ldrb r7, [r5]
	lsls r0, r7, #0xc
	ldrh r1, [r1]
	adds r0, r1, r0
	strh r0, [r2]
	adds r0, r3, #1
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	cmp r3, #0x1d
	bls _08091060
	mov r0, r8
	adds r4, r6, r0
	movs r0, #3
	bl GetBgTilemapOffset
	adds r1, r0, #0
	movs r0, #0xc0
	lsls r0, r0, #0x13
	adds r0, r6, r0
	adds r1, r1, r0
	adds r0, r4, #0
	movs r2, #0xf
	bl CpuFastSet
_08091098:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080910A4: .4byte 0x0400001E
_080910A8: .4byte gUnk_08426FF2
_080910AC: .4byte gBg3Tm

	thumb_func_start sub_80910B0
sub_80910B0: @ 0x080910B0
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	adds r5, r1, #0
	ldr r4, _080910F8 @ =gUnk_08421C64
	movs r0, #3
	bl GetBgChrOffset
	adds r1, r0, #0
	movs r0, #0xc0
	lsls r0, r0, #0x13
	adds r1, r1, r0
	adds r0, r4, #0
	bl Decompress
	ldr r0, _080910FC @ =gUnk_08427954
	lsls r1, r5, #5
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r4, _08091100 @ =gUnk_08D8C8E4
	adds r0, r4, #0
	bl Proc_Find
	bl Proc_End
	adds r0, r4, #0
	adds r1, r6, #0
	bl Proc_Start
	adds r1, r0, #0
	adds r1, #0x2d
	strb r5, [r1]
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_080910F8: .4byte gUnk_08421C64
_080910FC: .4byte gUnk_08427954
_08091100: .4byte gUnk_08D8C8E4

	thumb_func_start sub_8091104
sub_8091104: @ 0x08091104
	push {lr}
	ldr r0, _08091114 @ =gUnk_08D8C8E4
	bl Proc_Find
	bl Proc_End
	pop {r0}
	bx r0
	.align 2, 0
_08091114: .4byte gUnk_08D8C8E4

	thumb_func_start sub_8091118
sub_8091118: @ 0x08091118
	ldr r0, _08091130 @ =0x04000006
	ldrh r0, [r0]
	adds r3, r0, #0
	cmp r3, #0xa0
	bne _08091138
	movs r3, #0
	ldr r0, _08091134 @ =0x02012968
	ldr r2, [r0]
	ldr r1, [r0, #4]
	str r1, [r0]
	str r2, [r0, #4]
	b _08091140
	.align 2, 0
_08091130: .4byte 0x04000006
_08091134: .4byte 0x02012968
_08091138:
	ldr r0, _08091154 @ =0x02012968
	cmp r3, #0xa0
	bls _08091140
	movs r3, #0
_08091140:
	ldr r2, _08091158 @ =0x04000042
	ldr r0, [r0]
	lsls r1, r3, #2
	adds r1, r1, r0
	ldrb r3, [r1]
	lsls r0, r3, #8
	ldrb r1, [r1, #1]
	orrs r0, r1
	strh r0, [r2]
	bx lr
	.align 2, 0
_08091154: .4byte 0x02012968
_08091158: .4byte 0x04000042

	thumb_func_start sub_809115C
sub_809115C: @ 0x0809115C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	adds r4, r0, #0
	ldr r2, _080911D8 @ =gDispIo
	movs r0, #0x21
	rsbs r0, r0, #0
	ldrb r1, [r2, #1]
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	movs r1, #0x7f
	ands r0, r1
	strb r0, [r2, #1]
	adds r0, r4, #0
	adds r0, #0x2a
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	mov ip, r2
	cmp r0, #0
	bge _080911E8
	movs r0, #0x96
	str r0, [r4, #0x2c]
	movs r3, #0
	ldr r0, _080911DC @ =0x02012468
	mov sb, r0
	adds r4, #0x29
	mov r8, r4
	ldr r1, _080911E0 @ =0x02012968
	mov sl, r1
	mov r7, sb
	movs r4, #0
	movs r2, #0xf0
	movs r6, #0xa0
	lsls r6, r6, #2
	ldr r5, _080911E4 @ =0x00000281
_080911AA:
	lsls r0, r3, #2
	adds r0, r0, r7
	strb r4, [r0]
	strb r2, [r0, #1]
	adds r1, r0, r6
	strb r4, [r1]
	adds r0, r0, r5
	strb r2, [r0]
	adds r0, r3, #1
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	cmp r3, #0x9f
	bls _080911AA
	mov r1, ip
	adds r1, #0x2f
	movs r0, #0
	strb r0, [r1]
	adds r1, #4
	strb r0, [r1]
	subs r1, #5
	movs r0, #0xf0
	b _08091230
	.align 2, 0
_080911D8: .4byte gDispIo
_080911DC: .4byte 0x02012468
_080911E0: .4byte 0x02012968
_080911E4: .4byte 0x00000281
_080911E8:
	movs r0, #0
	str r0, [r4, #0x2c]
	movs r3, #0
	ldr r0, _0809129C @ =0x02012468
	mov sb, r0
	adds r4, #0x29
	mov r8, r4
	ldr r1, _080912A0 @ =0x02012968
	mov sl, r1
	mov r6, sb
	movs r2, #0x78
	movs r5, #0xa0
	lsls r5, r5, #2
	ldr r4, _080912A4 @ =0x00000281
_08091204:
	lsls r0, r3, #2
	adds r0, r0, r6
	strb r2, [r0]
	strb r2, [r0, #1]
	adds r1, r0, r5
	strb r2, [r1]
	adds r0, r0, r4
	strb r2, [r0]
	adds r0, r3, #1
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	cmp r3, #0x9f
	bls _08091204
	mov r2, ip
	adds r2, #0x2f
	movs r1, #0
	movs r0, #0x78
	strb r0, [r2]
	adds r2, #4
	strb r1, [r2]
	mov r1, ip
	adds r1, #0x2e
_08091230:
	strb r0, [r1]
	adds r1, #4
	movs r0, #0xa0
	strb r0, [r1]
	mov r2, ip
	adds r2, #0x35
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
	adds r2, #1
	movs r0, #2
	rsbs r0, r0, #0
	ldrb r1, [r2]
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
	strb r0, [r2]
	movs r0, #0
	mov r1, r8
	strb r0, [r1]
	mov r0, sb
	mov r1, sl
	str r0, [r1]
	movs r0, #0xa0
	lsls r0, r0, #2
	add r0, sb
	str r0, [r1, #4]
	ldr r0, _080912A8 @ =sub_8091118
	bl SetOnHBlankA
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0809129C: .4byte 0x02012468
_080912A0: .4byte 0x02012968
_080912A4: .4byte 0x00000281
_080912A8: .4byte sub_8091118

	thumb_func_start sub_80912AC
sub_80912AC: @ 0x080912AC
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	adds r6, r0, #0
	adds r0, #0x2a
	movs r1, #0
	ldrsb r1, [r0, r1]
	ldr r0, [r6, #0x2c]
	adds r0, r0, r1
	str r0, [r6, #0x2c]
	cmp r0, #0x96
	ble _080912CA
	movs r0, #0x96
	str r0, [r6, #0x2c]
_080912CA:
	ldr r0, [r6, #0x2c]
	cmp r0, #0
	bge _080912D4
	movs r0, #0
	str r0, [r6, #0x2c]
_080912D4:
	movs r1, #0
	movs r0, #0x29
	adds r0, r0, r6
	mov sb, r0
	ldr r7, _08091314 @ =0x02012968
	movs r2, #0x78
	mov r8, r2
_080912E2:
	ldr r0, [r6, #0x2c]
	lsls r5, r1, #0x10
	cmp r0, #0
	ble _08091302
	adds r4, r0, #0
	muls r4, r0, r4
	adds r0, r4, #0
	asrs r4, r5, #0x10
	adds r1, r4, #0
	subs r1, #0x50
	adds r2, r1, #0
	muls r2, r1, r2
	adds r1, r2, #0
	subs r0, r0, r1
	cmp r0, #0
	bge _08091318
_08091302:
	ldr r0, [r7, #4]
	asrs r1, r5, #0xe
	adds r0, r1, r0
	mov r4, r8
	strb r4, [r0]
	ldr r0, [r7, #4]
	adds r1, r1, r0
	strb r4, [r1, #1]
	b _0809133E
	.align 2, 0
_08091314: .4byte 0x02012968
_08091318:
	bl Sqrt
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x78
	ble _08091328
	movs r3, #0x78
_08091328:
	ldr r1, [r7, #4]
	lsls r2, r4, #2
	adds r1, r2, r1
	mov r4, r8
	subs r0, r4, r3
	strb r0, [r1]
	ldr r0, [r7, #4]
	adds r2, r2, r0
	adds r0, r3, #0
	adds r0, #0x78
	strb r0, [r2, #1]
_0809133E:
	movs r1, #0x80
	lsls r1, r1, #9
	adds r0, r5, r1
	lsrs r1, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x9f
	ble _080912E2
	mov r2, sb
	ldrb r0, [r2]
	adds r0, #1
	strb r0, [r2]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x28
	bne _08091362
	adds r0, r6, #0
	bl Proc_Break
_08091362:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_8091370
sub_8091370: @ 0x08091370
	push {lr}
	movs r0, #0
	bl SetOnHBlankA
	pop {r0}
	bx r0

	thumb_func_start sub_809137C
sub_809137C: @ 0x0809137C
	push {r4, lr}
	adds r2, r0, #0
	lsls r4, r1, #0x18
	lsrs r4, r4, #0x18
	ldr r0, _08091398 @ =gUnk_08D8C904
	adds r1, r2, #0
	bl Proc_StartBlocking
	adds r1, r0, #0
	adds r1, #0x2a
	strb r4, [r1]
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08091398: .4byte gUnk_08D8C904

	thumb_func_start sub_809139C
sub_809139C: @ 0x0809139C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r1, r0, #0
	adds r1, #0x29
	movs r7, #0
	strb r7, [r1]
	ldr r1, _08091434 @ =gDispIo
	mov ip, r1
	movs r3, #1
	ldrb r1, [r1, #1]
	orrs r1, r3
	movs r2, #2
	mov r8, r2
	mov r2, r8
	orrs r1, r2
	movs r6, #4
	orrs r1, r6
	movs r5, #8
	orrs r1, r5
	movs r4, #0x10
	orrs r1, r4
	movs r2, #0x21
	rsbs r2, r2, #0
	ands r1, r2
	movs r2, #0x40
	orrs r1, r2
	movs r2, #0x7f
	ands r1, r2
	mov r2, ip
	strb r1, [r2, #1]
	mov r1, ip
	adds r1, #0x35
	ldrb r2, [r1]
	orrs r3, r2
	mov r2, r8
	orrs r3, r2
	orrs r3, r6
	orrs r3, r5
	orrs r3, r4
	strb r3, [r1]
	mov r3, ip
	adds r3, #0x36
	movs r1, #2
	rsbs r1, r1, #0
	ldrb r2, [r3]
	ands r1, r2
	movs r2, #3
	rsbs r2, r2, #0
	ands r1, r2
	subs r2, #2
	ands r1, r2
	subs r2, #4
	ands r1, r2
	subs r2, #8
	ands r1, r2
	strb r1, [r3]
	adds r0, #0x2a
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	ble _08091438
	mov r0, ip
	adds r0, #0x2f
	strb r7, [r0]
	adds r0, #4
	strb r7, [r0]
	mov r1, ip
	adds r1, #0x2e
	movs r0, #0xf0
	strb r0, [r1]
	adds r1, #4
	movs r0, #0xa0
	strb r0, [r1]
	b _08091452
	.align 2, 0
_08091434: .4byte gDispIo
_08091438:
	mov r1, ip
	adds r1, #0x2f
	movs r0, #0x78
	strb r0, [r1]
	mov r2, ip
	adds r2, #0x33
	movs r1, #0x50
	strb r1, [r2]
	subs r2, #5
	strb r0, [r2]
	mov r0, ip
	adds r0, #0x32
	strb r1, [r0]
_08091452:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_809145C
sub_809145C: @ 0x0809145C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	adds r6, r0, #0
	adds r2, r6, #0
	adds r2, #0x29
	ldrb r0, [r2]
	adds r0, #1
	strb r0, [r2]
	ldr r4, _080914DC @ =gDispIo
	movs r0, #0x21
	rsbs r0, r0, #0
	ldrb r1, [r4, #1]
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	movs r1, #0x7f
	ands r0, r1
	strb r0, [r4, #1]
	movs r1, #0xf
	ldrb r2, [r2]
	subs r1, r1, r2
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #7
	muls r0, r1, r0
	movs r1, #0xe1
	bl __divsi3
	movs r1, #0xa0
	lsls r1, r1, #2
	subs r1, r1, r0
	asrs r5, r1, #4
	adds r0, r6, #0
	adds r0, #0x2a
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	ble _080914E0
	lsls r1, r5, #1
	adds r2, r1, r5
	adds r0, r4, #0
	adds r0, #0x2f
	strb r2, [r0]
	adds r0, #4
	strb r1, [r0]
	movs r3, #0x10
	rsbs r3, r3, #0
	adds r0, r3, #0
	subs r0, r0, r2
	adds r2, r4, #0
	adds r2, #0x2e
	strb r0, [r2]
	movs r2, #0x60
	rsbs r2, r2, #0
	adds r0, r2, #0
	subs r0, r0, r1
	adds r1, r4, #0
	adds r1, #0x32
	strb r0, [r1]
	b _08091504
	.align 2, 0
_080914DC: .4byte gDispIo
_080914E0:
	lsls r2, r5, #1
	adds r1, r2, r5
	movs r0, #0x78
	subs r0, r0, r1
	adds r3, r4, #0
	adds r3, #0x2f
	strb r0, [r3]
	movs r0, #0x50
	subs r0, r0, r2
	adds r3, #4
	strb r0, [r3]
	adds r1, #0x78
	adds r0, r4, #0
	adds r0, #0x2e
	strb r1, [r0]
	adds r2, #0x50
	adds r0, #4
	strb r2, [r0]
_08091504:
	adds r2, r4, #0
	adds r2, #0x35
	movs r0, #1
	ldrb r3, [r2]
	orrs r0, r3
	movs r1, #2
	orrs r0, r1
	movs r1, #4
	orrs r0, r1
	movs r1, #8
	orrs r0, r1
	movs r1, #0x10
	orrs r0, r1
	strb r0, [r2]
	adds r1, r4, #0
	adds r1, #0x36
	movs r0, #2
	rsbs r0, r0, #0
	ldrb r2, [r1]
	ands r0, r2
	movs r3, #3
	rsbs r3, r3, #0
	mov sl, r3
	ands r0, r3
	movs r2, #5
	rsbs r2, r2, #0
	mov sb, r2
	ands r0, r2
	subs r3, #6
	mov r8, r3
	ands r0, r3
	movs r7, #0x11
	rsbs r7, r7, #0
	ands r0, r7
	strb r0, [r1]
	cmp r5, #0x27
	ble _0809157A
	adds r0, r6, #0
	bl Proc_Break
	adds r0, r6, #0
	adds r0, #0x2a
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	ble _0809157A
	movs r0, #2
	rsbs r0, r0, #0
	ldrb r1, [r4, #1]
	ands r0, r1
	mov r2, sl
	ands r0, r2
	mov r3, sb
	ands r0, r3
	mov r1, r8
	ands r0, r1
	ands r0, r7
	strb r0, [r4, #1]
_0809157A:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_8091588
sub_8091588: @ 0x08091588
	movs r0, #0
	bx lr

	thumb_func_start sub_809158C
sub_809158C: @ 0x0809158C
	push {lr}
	bl sub_802EC3C
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_809159C
sub_809159C: @ 0x0809159C
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x2a]
	ldrh r1, [r4, #0x2c]
	cmp r0, r1
	bne _080915C8
	ldr r2, _080915D4 @ =gDispIo
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
	adds r0, r4, #0
	bl Proc_Break
_080915C8:
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080915D4: .4byte gDispIo

	thumb_func_start sub_80915D8
sub_80915D8: @ 0x080915D8
	push {r4, lr}
	adds r4, r0, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	ldr r0, _08091610 @ =gUnk_08D8C94C
	bl Proc_Start
	movs r1, #0
	strh r1, [r0, #0x2c]
	strh r4, [r0, #0x2a]
	ldr r2, _08091614 @ =gDispIo
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
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08091610: .4byte gUnk_08D8C94C
_08091614: .4byte gDispIo

	thumb_func_start TryLockProc
TryLockProc: @ 0x08091618
	cmp r0, #0
	beq _08091626
	adds r1, r0, #0
	adds r1, #0x28
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
_08091626:
	bx lr

	thumb_func_start TryUnlockProc
TryUnlockProc: @ 0x08091628
	cmp r0, #0
	beq _0809163A
	adds r1, r0, #0
	adds r1, #0x28
	ldrb r0, [r1]
	cmp r0, #0
	beq _0809163A
	subs r0, #1
	strb r0, [r1]
_0809163A:
	bx lr

	thumb_func_start sub_809163C
sub_809163C: @ 0x0809163C
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08091660 @ =gpKeySt
	ldr r1, [r0]
	movs r0, #0xf3
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _08091658
	bl CloseHelpBox
	adds r0, r4, #0
	bl Proc_Break
_08091658:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08091660: .4byte gpKeySt

	thumb_func_start sub_8091664
sub_8091664: @ 0x08091664
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r5, r2, #0
	adds r6, r3, #0
	cmp r4, #0
	bge _08091680
	cmp r1, #0
	bge _08091680
	bl GetUiHandPrevX
	adds r4, r0, #0
	bl GetUiHandPrevY
	adds r1, r0, #0
_08091680:
	adds r0, r4, #0
	adds r2, r5, #0
	bl StartHelpBox
	ldr r0, _08091698 @ =gUnk_08D8C96C
	adds r1, r6, #0
	bl Proc_StartBlocking
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_08091698: .4byte gUnk_08D8C96C

	thumb_func_start sub_809169C
sub_809169C: @ 0x0809169C
	push {r4, lr}
	adds r4, r1, #0
	bl CanUnitUseWeapon
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080916BC
	adds r0, r4, #0
	bl GetItemAttributes
	movs r1, #0x80
	ands r1, r0
	cmp r1, #0
	bne _080916BC
	movs r0, #1
	b _080916BE
_080916BC:
	movs r0, #0
_080916BE:
	pop {r4}
	pop {r1}
	bx r1

	thumb_func_start sub_80916C4
sub_80916C4: @ 0x080916C4
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	movs r6, #0
	movs r4, #0
_080916CC:
	lsls r1, r4, #1
	adds r0, r5, #0
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r1, [r0]
	adds r0, r5, #0
	bl sub_809169C
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne _080916E6
	adds r6, #1
_080916E6:
	adds r4, #1
	cmp r4, #4
	ble _080916CC
	adds r0, r6, #0
	pop {r4, r5, r6}
	pop {r1}
	bx r1

	thumb_func_start sub_80916F4
sub_80916F4: @ 0x080916F4
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4]
	ldr r1, [r4, #4]
	ldr r0, [r0, #0x28]
	ldr r1, [r1, #0x28]
	orrs r0, r1
	movs r1, #0x80
	lsls r1, r1, #2
	ands r0, r1
	cmp r0, #0
	bne _08091726
	adds r0, r4, #0
	bl sub_802F624
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08091726
	adds r0, r4, #0
	bl sub_80916C4
	cmp r0, #0
	beq _08091726
	movs r0, #1
	b _08091728
_08091726:
	movs r0, #0
_08091728:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_8091730
sub_8091730: @ 0x08091730
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	adds r7, r1, #0
	adds r5, r2, #0
	adds r6, r3, #0
	cmp r4, r5
	beq _080917CA
	bl CheckInLinkArena
	cmp r0, #0
	beq _080917CA
	ldr r0, [r4, #0xc]
	movs r1, #8
	ands r0, r1
	cmp r0, #0
	bne _08091786
	lsls r1, r7, #1
	adds r0, r4, #0
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r1, [r0]
	adds r0, r4, #0
	bl sub_809169C
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08091786
	adds r0, r4, #0
	bl sub_80916C4
	cmp r0, #1
	bgt _08091786
	lsls r1, r6, #1
	adds r0, r5, #0
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r1, [r0]
	adds r0, r4, #0
	bl sub_809169C
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080917C6
_08091786:
	ldr r0, [r5, #0xc]
	movs r1, #8
	ands r0, r1
	cmp r0, #0
	bne _080917CA
	lsls r1, r6, #1
	adds r0, r5, #0
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r1, [r0]
	adds r0, r5, #0
	bl sub_809169C
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080917CA
	adds r0, r5, #0
	bl sub_80916C4
	cmp r0, #1
	bgt _080917CA
	lsls r1, r7, #1
	adds r0, r4, #0
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r1, [r0]
	adds r0, r5, #0
	bl sub_809169C
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080917CA
_080917C6:
	movs r0, #0
	b _080917CC
_080917CA:
	movs r0, #1
_080917CC:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_80917D4
sub_80917D4: @ 0x080917D4
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r6, r2, #0
	bl CheckInLinkArena
	cmp r0, #0
	beq _08091820
	ldr r0, [r4, #0xc]
	movs r1, #8
	ands r0, r1
	cmp r0, #0
	bne _08091820
	lsls r1, r5, #1
	adds r0, r4, #0
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r1, [r0]
	adds r0, r4, #0
	bl sub_809169C
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08091820
	adds r0, r4, #0
	bl sub_80916C4
	cmp r0, #1
	bne _08091820
	adds r0, r4, #0
	adds r1, r6, #0
	bl sub_809169C
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08091820
	movs r0, #0
	b _08091822
_08091820:
	movs r0, #1
_08091822:
	pop {r4, r5, r6}
	pop {r1}
	bx r1

	thumb_func_start sub_8091828
sub_8091828: @ 0x08091828
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	bl CheckInLinkArena
	cmp r0, #0
	beq _08091864
	ldr r0, [r4, #0xc]
	movs r1, #8
	ands r0, r1
	cmp r0, #0
	bne _08091864
	lsls r1, r5, #1
	adds r0, r4, #0
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r1, [r0]
	adds r0, r4, #0
	bl sub_809169C
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08091864
	adds r0, r4, #0
	bl sub_80916C4
	cmp r0, #1
	bne _08091864
	movs r0, #0
	b _08091866
_08091864:
	movs r0, #1
_08091866:
	pop {r4, r5}
	pop {r1}
	bx r1

	thumb_func_start sub_809186C
sub_809186C: @ 0x0809186C
	push {r4, r5, lr}
	movs r1, #0
	ldr r4, _08091898 @ =0x0202BC35
	ldr r2, _0809189C @ =0x02012970
	ldr r3, _080918A0 @ =Pal_08428A80
_08091876:
	ldrb r5, [r4]
	lsls r0, r5, #0x1c
	lsrs r0, r0, #0x1e
	lsls r0, r0, #4
	adds r0, r0, r1
	lsls r0, r0, #1
	adds r0, r0, r3
	ldrh r0, [r0]
	strh r0, [r2]
	adds r2, #2
	adds r1, #1
	cmp r1, #0xf
	ble _08091876
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08091898: .4byte 0x0202BC35
_0809189C: .4byte 0x02012970
_080918A0: .4byte Pal_08428A80

	thumb_func_start sub_80918A4
sub_80918A4: @ 0x080918A4
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	movs r5, #0
	ldr r4, _080918C4 @ =gUnk_08D8C984
_080918AC:
	adds r0, r6, #0
	bl GetItemType
	ldrb r1, [r4]
	cmp r0, r1
	blt _080918C8
	ldrb r1, [r4, #1]
	cmp r0, r1
	bgt _080918C8
	adds r0, r5, #0
	b _080918D2
	.align 2, 0
_080918C4: .4byte gUnk_08D8C984
_080918C8:
	adds r4, #4
	adds r5, #1
	cmp r5, #8
	ble _080918AC
	movs r0, #8
_080918D2:
	pop {r4, r5, r6}
	pop {r1}
	bx r1

	thumb_func_start sub_80918D8
sub_80918D8: @ 0x080918D8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	mov sb, r0
	ldr r0, _08091990 @ =0x02011E24
	mov r8, r0
	ldr r0, _08091994 @ =0x02012466
	movs r1, #0
	strh r1, [r0]
	movs r4, #0
	ldr r1, _08091998 @ =0x02012464
	mov sl, r0
	adds r2, r1, #0
	ldrh r1, [r2]
	cmp r4, r1
	bge _08091944
	ldr r1, _0809199C @ =gUnk_08D8C984
	mov r3, sb
	lsls r0, r3, #2
	adds r6, r0, r1
	mov r7, sl
_08091908:
	ldr r1, _080919A0 @ =0x020117E4
	lsls r0, r4, #2
	adds r5, r0, r1
	ldrh r0, [r5, #2]
	str r2, [sp]
	bl GetItemType
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r2, [sp]
	ldrb r1, [r6]
	cmp r0, r1
	blo _0809193A
	ldrb r3, [r6, #1]
	cmp r0, r3
	bhi _0809193A
	ldr r0, [r5]
	mov r1, r8
	adds r1, #4
	mov r8, r1
	subs r1, #4
	stm r1!, {r0}
	ldrh r0, [r7]
	adds r0, #1
	strh r0, [r7]
_0809193A:
	adds r4, #1
	ldr r0, _08091998 @ =0x02012464
	ldrh r0, [r0]
	cmp r4, r0
	blt _08091908
_08091944:
	movs r4, #0
	ldrh r2, [r2]
	cmp r4, r2
	bge _08091986
	ldr r1, _0809199C @ =gUnk_08D8C984
	mov r2, sb
	lsls r0, r2, #2
	adds r6, r0, r1
_08091954:
	ldr r1, _080919A0 @ =0x020117E4
	lsls r0, r4, #2
	adds r5, r0, r1
	ldrh r0, [r5, #2]
	bl GetItemType
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldrb r3, [r6]
	cmp r0, r3
	blo _08091970
	ldrb r1, [r6, #1]
	cmp r0, r1
	bls _0809197C
_08091970:
	ldr r0, [r5]
	mov r2, r8
	adds r2, #4
	mov r8, r2
	subs r2, #4
	stm r2!, {r0}
_0809197C:
	adds r4, #1
	ldr r0, _08091998 @ =0x02012464
	ldrh r0, [r0]
	cmp r4, r0
	blt _08091954
_08091986:
	movs r2, #1
	ldr r5, _08091990 @ =0x02011E24
	ldr r3, _08091994 @ =0x02012466
	mov sl, r3
	b _080919AA
	.align 2, 0
_08091990: .4byte 0x02011E24
_08091994: .4byte 0x02012466
_08091998: .4byte 0x02012464
_0809199C: .4byte gUnk_08D8C984
_080919A0: .4byte 0x020117E4
_080919A4:
	lsls r0, r2, #1
	adds r0, r0, r2
	adds r2, r0, #1
_080919AA:
	mov r1, sl
	ldrh r0, [r1]
	movs r1, #3
	str r2, [sp]
	bl __udivsi3
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldr r2, [sp]
	cmp r2, r0
	blt _080919A4
	cmp r2, #0
	ble _08091A4C
_080919C4:
	adds r4, r2, #0
	mov r3, sl
	ldrh r3, [r3]
	cmp r2, r3
	bge _08091A3E
	ldr r0, _08091A68 @ =0x02012466
	mov sl, r0
_080919D2:
	subs r7, r4, r2
	adds r4, #1
	mov sb, r4
	cmp r7, #0
	blt _08091A32
	ldr r1, _08091A6C @ =0x02011E24
	mov r8, r1
_080919E0:
	lsls r0, r7, #2
	mov r3, r8
	adds r6, r0, r3
	ldrh r0, [r6, #2]
	str r2, [sp]
	bl GetItemIndex
	adds r4, r0, #0
	ldr r2, [sp]
	adds r0, r7, r2
	lsls r0, r0, #2
	mov r1, r8
	adds r5, r0, r1
	ldrh r0, [r5, #2]
	bl GetItemIndex
	ldr r2, [sp]
	cmp r4, r0
	bgt _08091A24
	ldrh r0, [r6, #2]
	str r2, [sp]
	bl GetItemIndex
	adds r4, r0, #0
	ldrh r0, [r5, #2]
	bl GetItemIndex
	ldr r2, [sp]
	cmp r4, r0
	bne _08091A32
	ldrh r3, [r6, #2]
	ldrh r0, [r5, #2]
	cmp r3, r0
	bls _08091A2C
_08091A24:
	ldr r1, [r6]
	ldr r0, [r5]
	str r0, [r6]
	str r1, [r5]
_08091A2C:
	subs r7, r7, r2
	cmp r7, #0
	bge _080919E0
_08091A32:
	mov r4, sb
	ldr r0, _08091A68 @ =0x02012466
	ldr r5, _08091A6C @ =0x02011E24
	ldrh r0, [r0]
	cmp r4, r0
	blt _080919D2
_08091A3E:
	adds r0, r2, #0
	movs r1, #3
	bl __divsi3
	adds r2, r0, #0
	cmp r2, #0
	bgt _080919C4
_08091A4C:
	ldr r1, _08091A70 @ =0x020117E4
	movs r2, #0xc8
	lsls r2, r2, #1
	adds r0, r5, #0
	bl CpuFastSet
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08091A68: .4byte 0x02012466
_08091A6C: .4byte 0x02011E24
_08091A70: .4byte 0x020117E4

	thumb_func_start sub_8091A74
sub_8091A74: @ 0x08091A74
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	mov r8, r0
	mov sl, r1
	mov sb, r2
	ldr r6, _08091B3C @ =0x020117E4
	ldr r1, _08091B40 @ =0x02012464
	movs r0, #0
	strh r0, [r1]
	movs r0, #2
	ands r0, r2
	cmp r0, #0
	beq _08091AEE
	movs r5, #1
_08091A96:
	adds r0, r5, #0
	bl GetUnit
	adds r4, r0, #0
	adds r7, r5, #1
	cmp r4, #0
	beq _08091AE8
	ldr r0, [r4]
	cmp r0, #0
	beq _08091AE8
	ldr r0, [r4, #0xc]
	ldr r1, _08091B44 @ =0x00010004
	ands r0, r1
	cmp r0, #0
	bne _08091AE8
	cmp r4, r8
	beq _08091AE8
	adds r0, r4, #0
	bl GetUnitItemCount
	adds r5, r0, #0
	movs r2, #0
	cmp r2, r5
	bge _08091AE8
	ldr r3, _08091B40 @ =0x02012464
	adds r1, r4, #0
	adds r1, #0x1e
_08091ACC:
	ldr r0, [r4]
	ldrb r0, [r0, #4]
	strb r0, [r6]
	ldrh r0, [r1]
	strh r0, [r6, #2]
	strb r2, [r6, #1]
	adds r6, #4
	ldrh r0, [r3]
	adds r0, #1
	strh r0, [r3]
	adds r1, #2
	adds r2, #1
	cmp r2, r5
	blt _08091ACC
_08091AE8:
	adds r5, r7, #0
	cmp r5, #0x3f
	ble _08091A96
_08091AEE:
	movs r0, #1
	mov r1, sb
	ands r0, r1
	cmp r0, #0
	beq _08091B28
	bl sub_802EBCC
	adds r1, r0, #0
	movs r2, #0
	ldrh r0, [r1]
	cmp r0, #0
	beq _08091B28
	movs r4, #0
	ldr r3, _08091B40 @ =0x02012464
_08091B0A:
	ldrh r0, [r1]
	strh r0, [r6, #2]
	strb r4, [r6]
	strb r2, [r6, #1]
	adds r6, #4
	ldrh r0, [r3]
	adds r0, #1
	strh r0, [r3]
	adds r1, #2
	adds r2, #1
	cmp r2, #0x63
	bgt _08091B28
	ldrh r0, [r1]
	cmp r0, #0
	bne _08091B0A
_08091B28:
	mov r0, sl
	bl sub_80918D8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08091B3C: .4byte 0x020117E4
_08091B40: .4byte 0x02012464
_08091B44: .4byte 0x00010004

	thumb_func_start sub_8091B48
sub_8091B48: @ 0x08091B48
	push {r4, r5, lr}
	bl sub_802EBD4
	movs r4, #0
	ldr r0, _08091B84 @ =0x02012464
	ldrh r0, [r0]
	cmp r4, r0
	bhs _08091B7C
	ldr r5, _08091B88 @ =0x020117E4
_08091B5A:
	lsls r0, r4, #2
	adds r1, r0, r5
	ldrb r0, [r1]
	cmp r0, #0
	bne _08091B6E
	ldrh r0, [r1, #2]
	cmp r0, #0
	beq _08091B6E
	bl AddItemToConvoy
_08091B6E:
	adds r0, r4, #1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	ldr r0, _08091B84 @ =0x02012464
	ldrh r0, [r0]
	cmp r4, r0
	blo _08091B5A
_08091B7C:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08091B84: .4byte 0x02012464
_08091B88: .4byte 0x020117E4

	thumb_func_start sub_8091B8C
sub_8091B8C: @ 0x08091B8C
	push {r4, r5, lr}
	bl sub_802EBD4
	movs r4, #0
	movs r5, #0x87
_08091B96:
	subs r0, r5, r4
	bl AddItemToConvoy
	adds r0, r4, #1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	cmp r4, #0x63
	bls _08091B96
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start sub_8091BAC
sub_8091BAC: @ 0x08091BAC
	push {r4, lr}
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	movs r2, #0
	movs r1, #0
	movs r4, #1
_08091BB8:
	adds r0, r3, #0
	asrs r0, r1
	ands r0, r4
	cmp r0, #0
	beq _08091BC4
	adds r2, #1
_08091BC4:
	adds r1, #1
	cmp r1, #0xf
	ble _08091BB8
	adds r0, r2, #0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_8091BD4
sub_8091BD4: @ 0x08091BD4
	push {r4, r5, lr}
	adds r5, r1, #0
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	movs r3, #0
	movs r2, #0
	movs r1, #1
_08091BE2:
	adds r0, r4, #0
	asrs r0, r2
	ands r0, r1
	cmp r0, #0
	beq _08091BF8
	cmp r3, r5
	bne _08091BF6
	adds r0, r1, #0
	lsls r0, r2
	b _08091C00
_08091BF6:
	adds r3, #1
_08091BF8:
	adds r2, #1
	cmp r2, #0xf
	ble _08091BE2
	movs r0, #0
_08091C00:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_8091C08
sub_8091C08: @ 0x08091C08
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	movs r1, #0
	movs r3, #1
_08091C10:
	adds r0, r2, #0
	asrs r0, r1
	ands r0, r3
	cmp r0, #0
	beq _08091C1E
	adds r0, r1, #0
	b _08091C26
_08091C1E:
	adds r1, #1
	cmp r1, #0xf
	ble _08091C10
	movs r0, #0
_08091C26:
	bx lr

	thumb_func_start sub_8091C28
sub_8091C28: @ 0x08091C28
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	bl GetUnitItemCount
	adds r6, r0, #0
	movs r4, #0
	cmp r4, r6
	bge _08091C56
_08091C38:
	lsls r1, r4, #1
	adds r0, r5, #0
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r1, [r0]
	adds r0, r5, #0
	bl sub_80284C8
	cmp r0, #0
	beq _08091C50
	movs r0, #1
	b _08091C58
_08091C50:
	adds r4, #1
	cmp r4, r6
	blt _08091C38
_08091C56:
	movs r0, #0
_08091C58:
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_8091C60
sub_8091C60: @ 0x08091C60
	ldr r0, _08091C88 @ =0x04000006
	ldrh r0, [r0]
	adds r0, #1
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	cmp r2, #0xa0
	bls _08091C70
	movs r2, #0
_08091C70:
	cmp r2, #0
	bne _08091C7A
	ldr r1, _08091C8C @ =0x04000012
	movs r0, #0xf8
	strh r0, [r1]
_08091C7A:
	cmp r2, #0x48
	bne _08091C84
	ldr r1, _08091C8C @ =0x04000012
	movs r0, #0xfc
	strh r0, [r1]
_08091C84:
	bx lr
	.align 2, 0
_08091C88: .4byte 0x04000006
_08091C8C: .4byte 0x04000012

	thumb_func_start sub_8091C90
sub_8091C90: @ 0x08091C90
	push {r4, lr}
	adds r4, r0, #0
	adds r2, r4, #0
	adds r2, #0x2a
	movs r0, #0xff
	ldrb r1, [r2]
	orrs r1, r0
	strb r1, [r2]
	adds r1, r4, #0
	adds r1, #0x2c
	ldrb r2, [r1]
	orrs r0, r2
	strb r0, [r1]
	adds r1, #1
	movs r0, #0
	strb r0, [r1]
	strh r0, [r4, #0x32]
	str r0, [r4, #0x44]
	str r0, [r4, #0x40]
	bl sub_808F834
	adds r1, r4, #0
	adds r1, #0x2b
	strb r0, [r1]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_8091CC8
sub_8091CC8: @ 0x08091CC8
	push {r4, r5, lr}
	ldr r0, _08091D0C @ =0x02012A90
	ldr r4, _08091D10 @ =gBg0Tm + 0x466
	adds r1, r4, #0
	bl PutText
	adds r5, r4, #0
	adds r5, #0x12
	bl GetGold
	adds r2, r0, #0
	adds r0, r5, #0
	movs r1, #2
	bl PutNumber
	adds r4, #0x14
	adds r0, r4, #0
	movs r1, #3
	movs r2, #0x1e
	bl PutSpecialChar
	movs r0, #0
	movs r1, #0x88
	movs r2, #0x8b
	movs r3, #2
	bl EnableSysBrownBox
	movs r0, #1
	bl EnableBgSync
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08091D0C: .4byte 0x02012A90
_08091D10: .4byte gBg0Tm + 0x466

	thumb_func_start sub_8091D14
sub_8091D14: @ 0x08091D14
	push {lr}
	ldr r0, _08091D34 @ =gBg0Tm + 0x466
	movs r1, #0xa
	movs r2, #1
	movs r3, #0
	bl TmFillRect_thm
	movs r0, #0
	bl DisableSysBrownBox
	movs r0, #1
	bl EnableBgSync
	pop {r0}
	bx r0
	.align 2, 0
_08091D34: .4byte gBg0Tm + 0x466

	thumb_func_start sub_8091D38
sub_8091D38: @ 0x08091D38
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x34
	mov r8, r0
	add r1, sp, #8
	ldr r0, _080920EC @ =gUnk_0842CF3C
	ldm r0!, {r2, r3, r4}
	stm r1!, {r2, r3, r4}
	ldm r0!, {r2, r3, r4}
	stm r1!, {r2, r3, r4}
	ldm r0!, {r2, r3}
	stm r1!, {r2, r3}
	ldr r0, _080920F0 @ =gUnk_08D8C0A0
	bl InitBgs
	ldr r4, _080920F4 @ =gDispIo
	movs r0, #8
	rsbs r0, r0, #0
	ldrb r1, [r4]
	ands r0, r1
	strb r0, [r4]
	add r0, sp, #8
	bl SetFaceConfig
	movs r0, #2
	rsbs r0, r0, #0
	ldrb r2, [r4, #1]
	ands r0, r2
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
	ldr r0, _080920F8 @ =0x06017800
	movs r1, #0
	bl sub_800515C
	movs r1, #4
	rsbs r1, r1, #0
	adds r0, r1, #0
	ldrb r3, [r4, #0xc]
	ands r0, r3
	strb r0, [r4, #0xc]
	adds r0, r1, #0
	ldrb r2, [r4, #0x10]
	ands r0, r2
	movs r2, #2
	orrs r0, r2
	strb r0, [r4, #0x10]
	ldrb r3, [r4, #0x14]
	ands r1, r3
	strb r1, [r4, #0x14]
	movs r0, #3
	ldrb r1, [r4, #0x18]
	orrs r0, r1
	strb r0, [r4, #0x18]
	bl ResetText
	bl InitIcons
	movs r0, #4
	bl ApplyIconPalettes
	bl UnpackUiWindowFrameGraphics
	bl ApplySystemObjectsGraphics
	bl sub_808EC70
	bl sub_808E684
	bl sub_808ECB0
	mov r1, r8
	adds r1, #0x29
	movs r4, #0
	strb r0, [r1]
	mov r0, r8
	bl ResetSysHandCursor
	ldr r0, _080920FC @ =sub_8093550
	mov r1, r8
	bl StartParallelWorker
	mov r0, r8
	bl sub_80A98C8
	movs r0, #0
	bl SetOnHBlankA
	movs r0, #0
	bl GetBgTilemap
	movs r1, #0
	bl TmFill
	movs r0, #1
	bl GetBgTilemap
	movs r1, #0
	bl TmFill
	movs r0, #2
	bl GetBgTilemap
	movs r1, #0
	bl TmFill
	ldr r0, _08092100 @ =gPal
	strh r4, [r0]
	bl EnablePalSync
	mov r2, sp
	adds r2, #0x28
	str r2, [sp, #0x2c]
	ldr r5, _08092104 @ =0x020129A8
	movs r4, #0xe
_08091E32:
	adds r0, r5, #0
	movs r1, #5
	bl InitText
	adds r5, #8
	subs r4, #1
	cmp r4, #0
	bge _08091E32
	movs r3, #0x2a
	add r3, r8
	mov sb, r3
	mov r4, r8
	adds r4, #0x2b
	str r4, [sp, #0x30]
	ldr r0, _08092108 @ =0x02012A20
	adds r6, r0, #0
	adds r6, #0x28
	adds r5, r0, #0
	movs r4, #4
_08091E58:
	adds r0, r5, #0
	movs r1, #7
	bl InitText
	adds r0, r6, #0
	movs r1, #7
	bl InitText
	adds r6, #8
	adds r5, #8
	subs r4, #1
	cmp r4, #0
	bge _08091E58
	ldr r4, _0809210C @ =0x02012A70
	adds r0, r4, #0
	movs r1, #8
	bl sub_800536C
	adds r0, r4, #0
	adds r0, #8
	movs r1, #8
	bl sub_800536C
	ldr r0, _08092110 @ =0x02012A80
	movs r1, #8
	bl InitText
	ldr r0, _08092114 @ =0x02012A90
	movs r1, #7
	bl InitText
	adds r0, r4, #0
	adds r0, #0x28
	movs r1, #5
	bl InitText
	ldr r0, _08092118 @ =0x06014000
	movs r1, #1
	rsbs r1, r1, #0
	bl LoadHelpBoxGfx
	ldr r7, _080920F4 @ =gDispIo
	movs r0, #0x3c
	adds r0, r0, r7
	mov sl, r0
	movs r1, #0x21
	rsbs r1, r1, #0
	adds r0, r1, #0
	mov r2, sl
	ldrb r2, [r2]
	ands r0, r2
	mov r3, sl
	strb r0, [r3]
	adds r0, r7, #0
	adds r0, #0x3d
	ldrb r4, [r0]
	ands r1, r4
	strb r1, [r0]
	ldr r0, _0809211C @ =0x0000FFE0
	ldrh r1, [r7, #0x3c]
	ands r0, r1
	ldr r2, _08092120 @ =0x0000E0FF
	ands r0, r2
	strh r0, [r7, #0x3c]
	movs r3, #0x36
	adds r3, r3, r7
	mov ip, r3
	movs r0, #0x20
	ldrb r2, [r3]
	orrs r2, r0
	ldrb r4, [r7, #1]
	orrs r0, r4
	movs r1, #0x41
	rsbs r1, r1, #0
	ands r0, r1
	movs r1, #0x7f
	ands r0, r1
	strb r0, [r7, #1]
	adds r0, r7, #0
	adds r0, #0x2d
	movs r1, #0
	strb r1, [r0]
	adds r1, r7, #0
	adds r1, #0x31
	movs r4, #4
	movs r0, #4
	strb r0, [r1]
	subs r1, #5
	movs r0, #0xf0
	strb r0, [r1]
	adds r1, #4
	movs r0, #0x44
	strb r0, [r1]
	adds r5, r7, #0
	adds r5, #0x34
	movs r6, #1
	ldrb r0, [r5]
	orrs r0, r6
	movs r3, #2
	orrs r0, r3
	orrs r0, r4
	movs r4, #8
	orrs r0, r4
	movs r1, #0x10
	orrs r0, r1
	strb r0, [r5]
	orrs r2, r6
	orrs r2, r3
	movs r0, #5
	rsbs r0, r0, #0
	ands r2, r0
	orrs r2, r4
	orrs r2, r1
	mov r3, ip
	strb r2, [r3]
	ldr r2, _08092124 @ =0x0000FFFC
	movs r0, #0
	movs r1, #4
	bl SetBgOffset
	movs r0, #1
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	ldr r1, _08092128 @ =0x0000FFD8
	mov r4, r8
	ldrh r2, [r4, #0x32]
	subs r2, #4
	movs r0, #0xff
	ands r2, r0
	movs r0, #2
	bl SetBgOffset
	movs r0, #7
	bl EnableBgSync
	bl ApplyUnitSpritePalettes
	movs r0, #0
	str r0, [sp, #0x28]
	ldr r1, _0809212C @ =gPal + 0x360
	ldr r2, _08092130 @ =0x01000008
	ldr r0, [sp, #0x2c]
	bl CpuFastSet
	bl ForceSyncUnitSpriteSheet
	ldr r0, _08092134 @ =Img_PrepTextShadow
	ldr r1, _08092138 @ =0x06013E00
	bl Decompress
	movs r0, #0x3c
	str r0, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #0
	movs r3, #0xd0
	bl sub_80A9954
	movs r0, #0xc0
	lsls r0, r0, #3
	movs r1, #1
	bl DisplaySysHandCursorTextShadow
	bl sub_808ED8C
	mov r1, sb
	ldrb r0, [r1]
	cmp r0, #0xff
	beq _08091FF6
	adds r5, r0, #0
	movs r1, #3
	bl __umodsi3
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x12
	adds r4, #0x18
	adds r0, r5, #0
	movs r1, #3
	bl __udivsi3
	adds r2, r0, #0
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x14
	mov r3, r8
	ldrh r0, [r3, #0x32]
	subs r0, #4
	subs r2, r2, r0
	movs r0, #0
	adds r1, r4, #0
	movs r3, #2
	bl sub_80A98DC
	mov r4, sb
	ldrb r0, [r4]
	bl sub_808E644
	adds r1, r0, #0
	ldr r0, _0809213C @ =0x00000503
	str r0, [sp]
	movs r0, #0
	movs r2, #0x44
	movs r3, #0x4e
	bl sub_80931F8
_08091FF6:
	mov r0, r8
	bl sub_8090DD0
	movs r5, #0x80
	lsls r5, r5, #2
	adds r0, r5, #0
	movs r1, #4
	bl sub_8090E38
	movs r0, #0xd8
	movs r1, #0xc
	bl sub_8090DE4
	mov r0, r8
	ldrh r4, [r0, #0x32]
	bl sub_808E664
	subs r0, #1
	movs r1, #3
	bl __divsi3
	adds r2, r0, #0
	adds r2, #1
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	movs r0, #6
	adds r1, r4, #0
	movs r3, #4
	bl sub_8090E04
	bl sub_8090DA0
	bl sub_808ECDC
	movs r0, #0x3f
	mov r1, sl
	ldrb r1, [r1]
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	mov r2, sl
	strb r0, [r2]
	adds r0, r7, #0
	adds r0, #0x44
	movs r1, #8
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r0, #1
	movs r3, #0
	strb r3, [r0]
	ldr r0, _0809211C @ =0x0000FFE0
	ldrh r4, [r7, #0x3c]
	ands r0, r4
	movs r1, #2
	orrs r0, r1
	ldr r1, _08092120 @ =0x0000E0FF
	ands r0, r1
	orrs r0, r5
	strh r0, [r7, #0x3c]
	ldr r0, _08092140 @ =sub_8091C60
	bl SetOnHBlankA
	movs r1, #0xe0
	lsls r1, r1, #4
	movs r3, #0xc0
	lsls r3, r3, #4
	movs r0, #0x80
	lsls r0, r0, #3
	str r0, [sp]
	mov r2, r8
	str r2, [sp, #4]
	movs r0, #6
	movs r2, #8
	bl StartSysBrownBox
	movs r0, #0
	movs r1, #1
	bl SetSysBrownBoxWidth
	ldr r0, _08092114 @ =0x02012A90
	movs r1, #3
	bl Text_SetColor
	ldr r1, _08092144 @ =gUnk_0842CF5C
	ldr r0, _08092114 @ =0x02012A90
	bl Text_DrawString
	movs r1, #0
	ldr r3, [sp, #0x30]
	movs r0, #0
	ldrsb r0, [r3, r0]
	cmp r0, #0
	bne _080920B4
	movs r1, #1
_080920B4:
	ldr r0, _08092110 @ =0x02012A80
	bl Text_SetColor
	ldr r0, _08092110 @ =0x02012A80
	movs r1, #0
	bl Text_SetCursor
	ldr r1, _08092148 @ =gUnk_0842CF64
	ldr r0, _08092110 @ =0x02012A80
	bl Text_DrawString
	ldr r0, _08092110 @ =0x02012A80
	movs r1, #0x20
	bl Text_SetCursor
	ldr r1, _0809214C @ =gUnk_0842CF6C
	ldr r0, _08092110 @ =0x02012A80
	bl Text_DrawString
	add sp, #0x34
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080920EC: .4byte gUnk_0842CF3C
_080920F0: .4byte gUnk_08D8C0A0
_080920F4: .4byte gDispIo
_080920F8: .4byte 0x06017800
_080920FC: .4byte sub_8093550
_08092100: .4byte gPal
_08092104: .4byte 0x020129A8
_08092108: .4byte 0x02012A20
_0809210C: .4byte 0x02012A70
_08092110: .4byte 0x02012A80
_08092114: .4byte 0x02012A90
_08092118: .4byte 0x06014000
_0809211C: .4byte 0x0000FFE0
_08092120: .4byte 0x0000E0FF
_08092124: .4byte 0x0000FFFC
_08092128: .4byte 0x0000FFD8
_0809212C: .4byte gPal + 0x360
_08092130: .4byte 0x01000008
_08092134: .4byte Img_PrepTextShadow
_08092138: .4byte 0x06013E00
_0809213C: .4byte 0x00000503
_08092140: .4byte sub_8091C60
_08092144: .4byte gUnk_0842CF5C
_08092148: .4byte gUnk_0842CF64
_0809214C: .4byte gUnk_0842CF6C

	thumb_func_start sub_8092150
sub_8092150: @ 0x08092150
	push {lr}
	adds r0, #0x29
	ldrb r0, [r0]
	bl sub_808E644
	ldr r0, [r0]
	ldrb r0, [r0, #4]
	bl sub_808E694
	bl EndAllParallelWorkers
	bl EndSysHandCursor
	bl EndUiCursorHand
	movs r0, #0
	bl sub_80932B0
	movs r0, #1
	bl sub_80932B0
	bl EndMuralBackground_
	bl EndHelpPromptSprite
	bl sub_8090DBC
	bl EndSysBrownBox
	movs r0, #0
	bl SetOnHBlankA
	pop {r0}
	bx r0

	thumb_func_start sub_8092194
sub_8092194: @ 0x08092194
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	sub sp, #8
	adds r5, r0, #0
	movs r1, #0xa
	movs r2, #6
	movs r3, #0
	bl TmFillRect_thm
	ldr r4, _080921F0 @ =0x02012A70
	adds r0, r4, #0
	bl ClearText
	movs r0, #8
	adds r0, r0, r4
	mov r8, r0
	bl ClearText
	adds r1, r5, #0
	adds r1, #0x42
	movs r6, #0
	str r6, [sp]
	ldr r0, _080921F4 @ =gUnk_0842CF74
	str r0, [sp, #4]
	adds r0, r4, #0
	movs r2, #0
	movs r3, #0
	bl PutDrawText
	adds r5, #0xc2
	str r6, [sp]
	ldr r0, _080921F8 @ =gUnk_0842CF84
	str r0, [sp, #4]
	mov r0, r8
	adds r1, r5, #0
	movs r2, #0
	movs r3, #0
	bl PutDrawText
	add sp, #8
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080921F0: .4byte 0x02012A70
_080921F4: .4byte gUnk_0842CF74
_080921F8: .4byte gUnk_0842CF84

	thumb_func_start sub_80921FC
sub_80921FC: @ 0x080921FC
	push {lr}
	sub sp, #4
	ldr r0, _08092218 @ =0x0000A580
	str r0, [sp]
	movs r0, #0x88
	movs r1, #0x58
	movs r2, #9
	movs r3, #4
	bl sub_80935C4
	add sp, #4
	pop {r0}
	bx r0
	.align 2, 0
_08092218: .4byte 0x0000A580

	thumb_func_start sub_809221C
sub_809221C: @ 0x0809221C
	push {lr}
	sub sp, #4
	ldr r0, _08092238 @ =0x0000A580
	str r0, [sp]
	movs r0, #8
	movs r1, #0x5c
	movs r2, #0xa
	movs r3, #5
	bl sub_80935C4
	add sp, #4
	pop {r0}
	bx r0
	.align 2, 0
_08092238: .4byte 0x0000A580

	thumb_func_start sub_809223C
sub_809223C: @ 0x0809223C
	push {lr}
	sub sp, #4
	ldr r0, _08092258 @ =0x0000A980
	str r0, [sp]
	movs r0, #0x82
	movs r1, #0x50
	movs r2, #8
	movs r3, #6
	bl sub_80935C4
	add sp, #4
	pop {r0}
	bx r0
	.align 2, 0
_08092258: .4byte 0x0000A980

	thumb_func_start sub_809225C
sub_809225C: @ 0x0809225C
	push {lr}
	ldr r0, _08092280 @ =sub_80921FC
	bl GetParallelWorker
	bl Proc_End
	ldr r0, _08092284 @ =sub_809221C
	bl GetParallelWorker
	bl Proc_End
	ldr r0, _08092288 @ =sub_809223C
	bl GetParallelWorker
	bl Proc_End
	pop {r0}
	bx r0
	.align 2, 0
_08092280: .4byte sub_80921FC
_08092284: .4byte sub_809221C
_08092288: .4byte sub_809223C

	thumb_func_start sub_809228C
sub_809228C: @ 0x0809228C
	push {r4, r5, r6, lr}
	sub sp, #0x10
	adds r2, r0, #0
	adds r4, r1, #0
	mov r1, sp
	ldr r0, _080922D0 @ =gUnk_0842CF94
	ldm r0!, {r3, r5, r6}
	stm r1!, {r3, r5, r6}
	ldr r0, [r0]
	str r0, [r1]
	ldr r0, _080922D4 @ =gUnk_0841EF4C
	movs r1, #0xc0
	lsls r1, r1, #0x13
	adds r2, r2, r1
	adds r1, r2, #0
	bl Decompress
	ldr r1, _080922D8 @ =gPlaySt
	adds r1, #0x41
	movs r0, #0xc
	ldrb r1, [r1]
	ands r0, r1
	add r0, sp
	ldr r0, [r0]
	lsls r4, r4, #5
	adds r1, r4, #0
	movs r2, #0xa0
	bl ApplyPaletteExt
	add sp, #0x10
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080922D0: .4byte gUnk_0842CF94
_080922D4: .4byte gUnk_0841EF4C
_080922D8: .4byte gPlaySt

	thumb_func_start sub_80922DC
sub_80922DC: @ 0x080922DC
	push {r4, lr}
	adds r2, r0, #0
	adds r4, r1, #0
	ldr r0, _08092304 @ =gUnk_084295B4
	ldr r1, _08092308 @ =0x06010000
	adds r2, r2, r1
	adds r1, r2, #0
	bl Decompress
	ldr r0, _0809230C @ =gUnk_08429638
	adds r4, #0x10
	lsls r4, r4, #5
	adds r1, r4, #0
	movs r2, #0x20
	bl ApplyPaletteExt
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08092304: .4byte gUnk_084295B4
_08092308: .4byte 0x06010000
_0809230C: .4byte gUnk_08429638

	thumb_func_start sub_8092310
sub_8092310: @ 0x08092310
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r6, r0, #0
	bl sub_80933F0
	movs r0, #0
	bl GetBgTilemap
	movs r1, #0
	bl TmFill
	movs r0, #1
	bl GetBgTilemap
	movs r1, #0
	bl TmFill
	movs r0, #2
	bl GetBgTilemap
	movs r1, #0
	bl TmFill
	movs r0, #0xc0
	lsls r0, r0, #7
	movs r1, #5
	bl sub_809228C
	movs r0, #0xc0
	lsls r0, r0, #6
	movs r1, #0xa
	bl sub_80922DC
	ldr r0, _08092408 @ =gBg1Tm
	ldr r1, _0809240C @ =gUnk_0842035C
	movs r2, #0xa6
	lsls r2, r2, #7
	bl TmApplyTsa_thm
	adds r7, r6, #0
	adds r7, #0x29
	ldrb r0, [r7]
	bl sub_808E644
	adds r1, r0, #0
	ldr r0, _08092410 @ =0x00000503
	str r0, [sp]
	movs r0, #0
	movs r2, #0x44
	movs r3, #0x4e
	bl sub_80931F8
	ldr r5, _08092414 @ =0x02012A20
	ldr r4, _08092418 @ =gBg0Tm + 0x244
	ldrb r0, [r7]
	bl sub_808E644
	adds r2, r0, #0
	adds r0, r5, #0
	adds r1, r4, #0
	movs r3, #2
	bl sub_80932DC
	adds r4, #0x60
	adds r0, r4, #0
	bl sub_8092194
	adds r1, r6, #0
	adds r1, #0x31
	movs r0, #0
	strb r0, [r1]
	ldrb r5, [r7]
	adds r0, r5, #0
	movs r1, #3
	bl __umodsi3
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x12
	adds r4, #0x18
	adds r0, r5, #0
	movs r1, #3
	bl __udivsi3
	adds r1, r0, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x14
	ldrh r0, [r6, #0x32]
	subs r0, #4
	subs r1, r1, r0
	movs r3, #0x80
	lsls r3, r3, #4
	adds r0, r4, #0
	movs r2, #7
	bl ShowSysHandCursor
	adds r0, r6, #0
	movs r1, #0
	bl sub_80937E0
	bl UnblockUiCursorHand
	bl sub_80A99AC
	movs r0, #0xc9
	movs r1, #0x7b
	adds r2, r6, #0
	bl StartHelpPromptSprite
	bl sub_809225C
	ldr r0, _0809241C @ =sub_80921FC
	adds r1, r6, #0
	bl StartParallelWorker
	bl sub_8091CC8
	movs r0, #7
	bl EnableBgSync
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08092408: .4byte gBg1Tm
_0809240C: .4byte gUnk_0842035C
_08092410: .4byte 0x00000503
_08092414: .4byte 0x02012A20
_08092418: .4byte gBg0Tm + 0x244
_0809241C: .4byte sub_80921FC

	thumb_func_start sub_8092420
sub_8092420: @ 0x08092420
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	mov r8, r0
	mov r2, r8
	adds r2, #0x29
	ldrb r7, [r2]
	ldr r0, _080924FC @ =gpKeySt
	ldr r1, [r0]
	ldrh r5, [r1, #6]
	mov r3, r8
	adds r3, #0x30
	movs r0, #4
	strb r0, [r3]
	movs r0, #0x80
	lsls r0, r0, #2
	ldrh r4, [r1, #4]
	ands r0, r4
	cmp r0, #0
	beq _0809244E
	ldrh r5, [r1, #4]
	movs r0, #8
	strb r0, [r3]
_0809244E:
	movs r0, #0x40
	ands r0, r5
	cmp r0, #0
	beq _08092460
	ldrb r0, [r2]
	subs r0, #3
	cmp r0, #0
	blt _08092460
	strb r0, [r2]
_08092460:
	movs r0, #0x80
	ands r0, r5
	mov r6, r8
	adds r6, #0x29
	cmp r0, #0
	beq _0809247E
	ldrb r4, [r6]
	adds r4, #3
	bl sub_808E664
	cmp r4, r0
	bge _0809247E
	ldrb r0, [r6]
	adds r0, #3
	strb r0, [r6]
_0809247E:
	movs r0, #0x20
	ands r0, r5
	cmp r0, #0
	beq _0809249A
	ldrb r4, [r6]
	adds r0, r4, #0
	movs r1, #3
	bl __umodsi3
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0809249A
	subs r0, r4, #1
	strb r0, [r6]
_0809249A:
	movs r0, #0x10
	ands r5, r0
	cmp r5, #0
	beq _080924C4
	ldrb r4, [r6]
	adds r0, r4, #0
	movs r1, #3
	bl __umodsi3
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bhi _080924C4
	adds r4, #1
	bl sub_808E664
	cmp r4, r0
	bge _080924C4
	ldrb r0, [r6]
	adds r0, #1
	strb r0, [r6]
_080924C4:
	ldrb r0, [r6]
	cmp r0, r7
	beq _08092570
	movs r1, #3
	bl __udivsi3
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x14
	bl sub_808E664
	subs r0, #1
	movs r1, #3
	bl __divsi3
	lsls r2, r0, #4
	mov r0, r8
	ldrh r1, [r0, #0x32]
	subs r0, r4, r1
	cmp r0, #0x20
	ble _08092500
	adds r0, r1, #0
	adds r0, #0x30
	cmp r0, r2
	bge _08092500
	lsrs r1, r1, #4
	adds r1, #4
	b _08092514
	.align 2, 0
_080924FC: .4byte gpKeySt
_08092500:
	mov r1, r8
	ldrh r0, [r1, #0x32]
	subs r1, r4, r0
	adds r7, r0, #0
	cmp r1, #0xf
	bgt _08092522
	cmp r7, #0
	beq _08092522
	lsrs r1, r7, #4
	subs r1, #1
_08092514:
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	mov r0, r8
	movs r2, #0
	bl sub_8093478
	b _08092552
_08092522:
	ldrb r5, [r6]
	adds r0, r5, #0
	movs r1, #3
	bl __umodsi3
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x12
	adds r4, #0x18
	adds r0, r5, #0
	movs r1, #3
	bl __udivsi3
	adds r1, r0, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x14
	subs r0, r7, #4
	subs r1, r1, r0
	movs r3, #0x80
	lsls r3, r3, #4
	adds r0, r4, #0
	movs r2, #7
	bl ShowSysHandCursor
_08092552:
	ldr r0, _08092568 @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08092564
	ldr r0, _0809256C @ =0x00000385
	bl m4aSongNumStart
_08092564:
	movs r0, #1
	b _08092572
	.align 2, 0
_08092568: .4byte gPlaySt
_0809256C: .4byte 0x00000385
_08092570:
	movs r0, #0
_08092572:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	thumb_func_start sub_809257C
sub_809257C: @ 0x0809257C
	push {r4, r5, r6, r7, lr}
	adds r6, r0, #0
	adds r0, #0x29
	ldrb r0, [r0]
	movs r1, #3
	bl __udivsi3
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x14
	bl sub_808E664
	subs r0, #1
	movs r1, #3
	bl __divsi3
	lsls r2, r0, #4
	ldrh r1, [r6, #0x32]
	subs r0, r7, r1
	cmp r0, #0x20
	ble _0809261C
	adds r0, r1, #0
	adds r0, #0x30
	cmp r0, r2
	bge _0809261C
	adds r0, r6, #0
	adds r0, #0x30
	ldrb r0, [r0]
	adds r2, r0, r1
	strh r2, [r6, #0x32]
	ldr r1, _080926A0 @ =0x0000FFD8
	subs r2, #4
	movs r0, #0xff
	ands r2, r0
	movs r0, #2
	bl SetBgOffset
	adds r1, r6, #0
	adds r1, #0x2a
	ldrb r0, [r1]
	cmp r0, #0xff
	beq _080925FC
	adds r5, r0, #0
	movs r1, #3
	bl __umodsi3
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x12
	adds r4, #0x18
	adds r0, r5, #0
	movs r1, #3
	bl __udivsi3
	adds r2, r0, #0
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x14
	ldrh r0, [r6, #0x32]
	subs r0, #4
	subs r2, r2, r0
	movs r0, #0
	adds r1, r4, #0
	movs r3, #2
	bl sub_80A98DC
_080925FC:
	ldrh r4, [r6, #0x32]
	bl sub_808E664
	subs r0, #1
	movs r1, #3
	bl __divsi3
	adds r2, r0, #0
	adds r2, #1
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	movs r0, #6
	adds r1, r4, #0
	movs r3, #4
	bl sub_8090E04
_0809261C:
	ldrh r2, [r6, #0x32]
	subs r0, r7, r2
	cmp r0, #0xf
	bgt _08092698
	cmp r2, #0
	beq _08092698
	adds r0, r6, #0
	adds r0, #0x30
	ldrb r0, [r0]
	subs r2, r2, r0
	strh r2, [r6, #0x32]
	ldr r1, _080926A0 @ =0x0000FFD8
	subs r2, #4
	movs r0, #0xff
	ands r2, r0
	movs r0, #2
	bl SetBgOffset
	adds r1, r6, #0
	adds r1, #0x2a
	ldrb r0, [r1]
	cmp r0, #0xff
	beq _08092678
	adds r5, r0, #0
	movs r1, #3
	bl __umodsi3
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x12
	adds r4, #0x18
	adds r0, r5, #0
	movs r1, #3
	bl __udivsi3
	adds r2, r0, #0
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x14
	ldrh r0, [r6, #0x32]
	subs r0, #4
	subs r2, r2, r0
	movs r0, #0
	adds r1, r4, #0
	movs r3, #2
	bl sub_80A98DC
_08092678:
	ldrh r4, [r6, #0x32]
	bl sub_808E664
	subs r0, #1
	movs r1, #3
	bl __divsi3
	adds r2, r0, #0
	adds r2, #1
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	movs r0, #6
	adds r1, r4, #0
	movs r3, #4
	bl sub_8090E04
_08092698:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080926A0: .4byte 0x0000FFD8

	thumb_func_start sub_80926A4
sub_80926A4: @ 0x080926A4
	push {r4, lr}
	adds r4, r0, #0
	bl sub_8092150
	movs r0, #0x31
	bl SetStatScreenExcludedUnitFlags
	adds r0, r4, #0
	adds r0, #0x29
	ldrb r0, [r0]
	bl sub_808E644
	adds r1, r4, #0
	bl StartStatScreen
	adds r0, r4, #0
	bl Proc_Break
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_80926D0
sub_80926D0: @ 0x080926D0
	push {r4, lr}
	adds r4, r0, #0
	bl sub_8091D38
	bl sub_808EA20
	adds r1, r4, #0
	adds r1, #0x29
	strb r0, [r1]
	adds r0, r4, #0
	bl sub_80933F0
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_80926F0
sub_80926F0: @ 0x080926F0
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r6, r0, #0
	movs r0, #0xf
	ldrh r1, [r6, #0x32]
	ands r0, r1
	cmp r0, #0
	beq _08092702
	b _0809281E
_08092702:
	ldr r0, _0809271C @ =gpKeySt
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r1
	cmp r0, #0
	beq _08092720
	adds r0, r6, #0
	bl Proc_Break
	b _08092824
	.align 2, 0
_0809271C: .4byte gpKeySt
_08092720:
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _080927B0
	adds r4, r6, #0
	adds r4, #0x29
	ldrb r0, [r4]
	adds r5, r6, #0
	adds r5, #0x2a
	strb r0, [r5]
	ldrb r7, [r4]
	adds r0, r7, #0
	movs r1, #3
	bl __umodsi3
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bhi _08092756
	bl sub_808E664
	subs r0, #1
	cmp r7, r0
	bge _08092756
	ldrb r0, [r4]
	adds r0, #1
	b _0809275A
_08092756:
	ldrb r0, [r4]
	subs r0, #1
_0809275A:
	strb r0, [r4]
	ldrb r5, [r5]
	adds r0, r5, #0
	movs r1, #3
	bl __umodsi3
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x12
	adds r4, #0x18
	adds r0, r5, #0
	movs r1, #3
	bl __udivsi3
	adds r2, r0, #0
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x14
	ldrh r0, [r6, #0x32]
	subs r0, #4
	subs r2, r2, r0
	movs r0, #0
	adds r1, r4, #0
	movs r3, #2
	bl sub_80A98DC
	adds r0, r6, #0
	movs r1, #2
	bl Proc_Goto
	ldr r0, _080927A8 @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08092824
	ldr r0, _080927AC @ =0x0000038A
	bl m4aSongNumStart
	b _08092824
	.align 2, 0
_080927A8: .4byte gPlaySt
_080927AC: .4byte 0x0000038A
_080927B0:
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _080927DC
	adds r0, r6, #0
	movs r1, #0xc
	bl Proc_Goto
	ldr r0, _080927D4 @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08092824
	ldr r0, _080927D8 @ =0x0000038B
	bl m4aSongNumStart
	b _08092824
	.align 2, 0
_080927D4: .4byte gPlaySt
_080927D8: .4byte 0x0000038B
_080927DC:
	adds r0, r6, #0
	bl sub_8092420
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0809281E
	adds r7, r6, #0
	adds r7, #0x29
	ldrb r0, [r7]
	bl sub_808E644
	adds r1, r0, #0
	ldr r0, _0809282C @ =0x00000503
	str r0, [sp]
	movs r0, #0
	movs r2, #0x44
	movs r3, #0x4e
	bl sub_80931F8
	ldr r4, _08092830 @ =0x02012A20
	ldr r5, _08092834 @ =gBg0Tm + 0x244
	ldrb r0, [r7]
	bl sub_808E644
	adds r2, r0, #0
	adds r0, r4, #0
	adds r1, r5, #0
	movs r3, #2
	bl sub_80932DC
	movs r0, #1
	bl EnableBgSync
_0809281E:
	adds r0, r6, #0
	bl sub_809257C
_08092824:
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0809282C: .4byte 0x00000503
_08092830: .4byte 0x02012A20
_08092834: .4byte gBg0Tm + 0x244

	thumb_func_start sub_8092838
sub_8092838: @ 0x08092838
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	mov r8, r0
	adds r5, r1, #0
	adds r7, r2, #0
	adds r0, r5, #0
	movs r1, #0xa
	movs r2, #6
	movs r3, #0
	bl TmFillRect_thm
	ldr r4, _08092908 @ =0x02012A70
	adds r0, r4, #0
	bl ClearText
	adds r6, r4, #0
	adds r6, #8
	adds r0, r6, #0
	bl ClearText
	bl sub_808E664
	movs r2, #0
	cmp r0, #1
	bgt _0809286E
	movs r2, #1
_0809286E:
	ldr r3, _0809290C @ =gUnk_0842CFA4
	adds r0, r4, #0
	movs r1, #0
	bl Text_InsertDrawString
	bl sub_808E664
	movs r2, #0
	cmp r0, #1
	bgt _08092884
	movs r2, #1
_08092884:
	ldr r3, _08092910 @ =gUnk_0842CFAC
	adds r0, r4, #0
	movs r1, #0x20
	bl Text_InsertDrawString
	adds r1, r5, #0
	adds r1, #0x40
	adds r0, r4, #0
	bl PutText
	adds r0, r7, #0
	bl sub_8091C28
	movs r2, #0
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080928A8
	movs r2, #1
_080928A8:
	ldr r3, _08092914 @ =gUnk_0842CFB4
	adds r0, r6, #0
	movs r1, #0
	bl Text_InsertDrawString
	movs r4, #0
	mov r0, r8
	adds r0, #0x2b
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _080928D4
	adds r0, r7, #0
	bl GetUnitItemCount
	cmp r0, #0
	ble _080928D4
	bl CheckInLinkArena
	cmp r0, #0
	beq _080928D6
_080928D4:
	movs r4, #1
_080928D6:
	ldr r3, _08092918 @ =gUnk_0842CFBC
	adds r0, r6, #0
	movs r1, #0x20
	adds r2, r4, #0
	bl Text_InsertDrawString
	ldr r4, _0809291C @ =0x02012A78
	adds r1, r5, #0
	adds r1, #0xc0
	adds r0, r4, #0
	bl PutText
	adds r4, #8
	movs r0, #0xa0
	lsls r0, r0, #1
	adds r1, r5, r0
	adds r0, r4, #0
	bl PutText
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08092908: .4byte 0x02012A70
_0809290C: .4byte gUnk_0842CFA4
_08092910: .4byte gUnk_0842CFAC
_08092914: .4byte gUnk_0842CFB4
_08092918: .4byte gUnk_0842CFBC
_0809291C: .4byte 0x02012A78

	thumb_func_start sub_8092920
sub_8092920: @ 0x08092920
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #8
	adds r5, r0, #0
	adds r0, #0x2a
	ldrb r0, [r0]
	bl sub_808E644
	mov r8, r0
	adds r1, r5, #0
	adds r1, #0x31
	movs r0, #1
	strb r0, [r1]
	ldr r0, _08092A08 @ =gBg1Tm
	ldr r1, _08092A0C @ =gUnk_08420810
	movs r2, #0xa6
	lsls r2, r2, #7
	bl TmApplyTsa_thm
	movs r4, #0
_0809294A:
	ldrh r1, [r5, #0x32]
	lsrs r0, r1, #3
	adds r0, r0, r4
	movs r1, #0x1f
	ands r0, r1
	adds r0, #4
	lsls r0, r0, #6
	ldr r1, _08092A10 @ =gBg2Tm
	adds r0, r0, r1
	movs r1, #9
	movs r2, #0
	movs r3, #0
	bl TmFillRect_thm
	adds r4, #1
	cmp r4, #7
	ble _0809294A
	mov r0, r8
	bl GetUnitPortraitId
	ldr r7, _08092A14 @ =gBg0Tm + 0x106
	movs r2, #0x9c
	lsls r2, r2, #2
	movs r6, #0
	str r6, [sp]
	adds r1, r7, #0
	movs r3, #2
	bl PutFaceChibi
	ldr r5, _08092A18 @ =0x02012A98
	adds r0, r5, #0
	bl ClearText
	mov r1, r8
	ldr r0, [r1]
	ldrh r0, [r0]
	bl DecodeMsg
	adds r4, r0, #0
	movs r0, #0x28
	adds r1, r4, #0
	bl GetStringTextCenteredPos
	adds r3, r0, #0
	adds r1, r7, #0
	adds r1, #0xa
	str r6, [sp]
	str r4, [sp, #4]
	adds r0, r5, #0
	movs r2, #0
	bl PutDrawText
	adds r0, r7, #0
	adds r0, #0x8a
	movs r1, #3
	movs r2, #0x24
	bl PutSpecialChar
	adds r0, r7, #0
	adds r0, #0x8c
	movs r1, #3
	movs r2, #0x25
	bl PutSpecialChar
	adds r0, r7, #0
	adds r0, #0x92
	movs r1, #3
	movs r2, #0x1d
	bl PutSpecialChar
	adds r0, r7, #0
	adds r0, #0x90
	mov r1, r8
	movs r2, #8
	ldrsb r2, [r1, r2]
	movs r1, #2
	bl PutNumberOrBlank
	adds r0, r7, #0
	adds r0, #0x96
	mov r1, r8
	ldrb r2, [r1, #9]
	movs r1, #2
	bl PutNumberOrBlank
	movs r0, #7
	bl EnableBgSync
	add sp, #8
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08092A08: .4byte gBg1Tm
_08092A0C: .4byte gUnk_08420810
_08092A10: .4byte gBg2Tm
_08092A14: .4byte gBg0Tm + 0x106
_08092A18: .4byte 0x02012A98

	thumb_func_start sub_8092A1C
sub_8092A1C: @ 0x08092A1C
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	ldr r0, _08092A84 @ =gBg0Tm + 0x25e
	movs r1, #0xc
	movs r2, #0x14
	movs r3, #0
	bl TmFillRect_thm
	movs r0, #0xc0
	lsls r0, r0, #7
	movs r1, #5
	bl sub_809228C
	movs r0, #0xc0
	lsls r0, r0, #6
	movs r1, #0xa
	bl sub_80922DC
	adds r0, r6, #0
	bl sub_8092920
	adds r0, r6, #0
	adds r0, #0x2a
	ldrb r5, [r0]
	adds r0, r5, #0
	movs r1, #3
	bl __umodsi3
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x12
	adds r4, #0x14
	adds r0, r5, #0
	movs r1, #3
	bl __udivsi3
	adds r1, r0, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x14
	ldrh r0, [r6, #0x32]
	subs r0, #4
	subs r1, r1, r0
	adds r0, r4, #0
	bl sub_8093540
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08092A88
	bl sub_80A99D0
	b _08092A8C
	.align 2, 0
_08092A84: .4byte gBg0Tm + 0x25e
_08092A88:
	bl UnblockUiCursorHand
_08092A8C:
	bl sub_809225C
	movs r0, #1
	bl EnableBgSync
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	thumb_func_start sub_8092A9C
sub_8092A9C: @ 0x08092A9C
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r5, _08092AF0 @ =gBg0Tm + 0x264
	adds r0, #0x2a
	ldrb r0, [r0]
	bl sub_808E644
	adds r2, r0, #0
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_8092838
	ldr r0, _08092AF4 @ =sub_809223C
	adds r1, r4, #0
	bl StartParallelWorker
	movs r0, #0xc9
	movs r1, #0x7b
	adds r2, r4, #0
	bl StartHelpPromptSprite
	adds r4, #0x2d
	ldrb r1, [r4]
	movs r0, #1
	ands r0, r1
	lsls r0, r0, #5
	adds r0, #0x88
	lsrs r1, r1, #1
	lsls r1, r1, #4
	adds r1, #0x54
	movs r3, #0x80
	lsls r3, r3, #3
	movs r2, #3
	bl ShowSysHandCursor
	movs r0, #1
	bl EnableBgSync
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08092AF0: .4byte gBg0Tm + 0x264
_08092AF4: .4byte sub_809223C

	thumb_func_start sub_8092AF8
sub_8092AF8: @ 0x08092AF8
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r0, #0x2a
	ldrb r0, [r0]
	bl sub_808E644
	adds r5, r0, #0
	adds r0, r4, #0
	movs r1, #0
	bl sub_80937E0
	ldr r0, _08092B28 @ =0x02012A20
	ldr r1, _08092B2C @ =gBg0Tm + 0x244
	adds r2, r5, #0
	movs r3, #0
	bl sub_80932DC
	movs r0, #4
	bl EnableBgSync
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08092B28: .4byte 0x02012A20
_08092B2C: .4byte gBg0Tm + 0x244

	thumb_func_start sub_8092B30
sub_8092B30: @ 0x08092B30
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	adds r2, r5, #0
	adds r2, #0x2d
	ldrb r7, [r2]
	adds r4, r5, #0
	adds r4, #0x2c
	ldrb r0, [r4]
	cmp r0, #0xff
	beq _08092B46
	b _08092D50
_08092B46:
	ldr r0, _08092B78 @ =gpKeySt
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r1
	cmp r0, #0
	beq _08092B80
	strb r7, [r4]
	ldrb r1, [r2]
	movs r0, #1
	ands r0, r1
	lsls r0, r0, #5
	adds r0, #0x88
	lsrs r1, r1, #1
	lsls r1, r1, #4
	adds r1, #0x54
	ldr r3, _08092B7C @ =gUnk_08D8C9A8
	ldrb r2, [r2]
	lsls r2, r2, #2
	adds r2, r2, r3
	ldr r2, [r2]
	bl StartHelpBox
	b _08092E70
	.align 2, 0
_08092B78: .4byte gpKeySt
_08092B7C: .4byte gUnk_08D8C9A8
_08092B80:
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	bne _08092B8A
	b _08092D0C
_08092B8A:
	cmp r7, #5
	bls _08092B90
	b _08092CF0
_08092B90:
	lsls r0, r7, #2
	ldr r1, _08092B9C @ =_08092BA0
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08092B9C: .4byte _08092BA0
_08092BA0: @ jump table
	.4byte _08092BB8 @ case 0
	.4byte _08092BCC @ case 1
	.4byte _08092BE0 @ case 2
	.4byte _08092C00 @ case 3
	.4byte _08092C32 @ case 4
	.4byte _08092C4A @ case 5
_08092BB8:
	bl sub_808E664
	cmp r0, #1
	bgt _08092BC2
	b _08092CF0
_08092BC2:
	adds r0, r5, #0
	movs r1, #4
	bl Proc_Goto
	b _08092CC8
_08092BCC:
	bl sub_808E664
	cmp r0, #1
	bgt _08092BD6
	b _08092CF0
_08092BD6:
	adds r0, r5, #0
	movs r1, #8
	bl Proc_Goto
	b _08092CC8
_08092BE0:
	adds r0, r5, #0
	adds r0, #0x2a
	ldrb r0, [r0]
	bl sub_808E644
	bl sub_8091C28
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08092BF6
	b _08092CF0
_08092BF6:
	adds r0, r5, #0
	movs r1, #9
	bl Proc_Goto
	b _08092CC8
_08092C00:
	adds r0, r5, #0
	adds r0, #0x2b
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _08092CF0
	adds r0, r5, #0
	adds r0, #0x2a
	ldrb r0, [r0]
	bl sub_808E644
	bl GetUnitItemCount
	cmp r0, #0
	ble _08092CF0
	bl CheckInLinkArena
	cmp r0, #0
	bne _08092CF0
	adds r0, r5, #0
	movs r1, #0xb
	bl Proc_Goto
	b _08092CC8
_08092C32:
	adds r0, r5, #0
	adds r0, #0x2b
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _08092CF0
	adds r0, r5, #0
	movs r1, #0xa
	bl Proc_Goto
	b _08092CC8
_08092C4A:
	bl CheckInLinkArena
	cmp r0, #0
	beq _08092C78
	adds r0, r5, #0
	adds r0, #0x2a
	ldrb r0, [r0]
	bl sub_808E644
	ldr r0, [r0, #0xc]
	movs r1, #8
	ands r0, r1
	cmp r0, #0
	bne _08092C78
	subs r1, #9
	ldr r2, _08092C74 @ =0x000003B3
	adds r0, r1, #0
	adds r3, r5, #0
	bl sub_8091664
	b _08092E70
	.align 2, 0
_08092C74: .4byte 0x000003B3
_08092C78:
	adds r0, r5, #0
	adds r0, #0x2b
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _08092CF0
	adds r6, r5, #0
	adds r6, #0x2a
	ldrb r0, [r6]
	bl sub_808E644
	bl sub_8093814
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08092CF0
	ldr r4, _08092CE0 @ =gBg0Tm + 0x264
	ldrb r0, [r6]
	bl sub_808E644
	adds r2, r0, #0
	adds r0, r5, #0
	adds r1, r4, #0
	bl sub_8092838
	ldr r5, _08092CE4 @ =0x02012A20
	subs r4, #0x20
	ldrb r0, [r6]
	bl sub_808E644
	adds r2, r0, #0
	adds r0, r5, #0
	adds r1, r4, #0
	movs r3, #0
	bl sub_80932DC
	movs r0, #1
	bl EnableBgSync
_08092CC8:
	ldr r0, _08092CE8 @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	bge _08092CD6
	b _08092E70
_08092CD6:
	ldr r0, _08092CEC @ =0x0000038A
	bl m4aSongNumStart
	b _08092E70
	.align 2, 0
_08092CE0: .4byte gBg0Tm + 0x264
_08092CE4: .4byte 0x02012A20
_08092CE8: .4byte gPlaySt
_08092CEC: .4byte 0x0000038A
_08092CF0:
	ldr r0, _08092D08 @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	bge _08092CFE
	b _08092E70
_08092CFE:
	movs r0, #0xe3
	lsls r0, r0, #2
	bl m4aSongNumStart
	b _08092E70
	.align 2, 0
_08092D08: .4byte gPlaySt
_08092D0C:
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _08092D68
	adds r2, r5, #0
	adds r2, #0x2a
	ldrb r0, [r2]
	adds r1, r5, #0
	adds r1, #0x29
	strb r0, [r1]
	movs r0, #0xff
	strb r0, [r2]
	movs r0, #0
	bl sub_80A998C
	ldr r0, _08092D48 @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08092D3C
	ldr r0, _08092D4C @ =0x0000038B
	bl m4aSongNumStart
_08092D3C:
	adds r0, r5, #0
	movs r1, #0
	bl Proc_Goto
	b _08092E70
	.align 2, 0
_08092D48: .4byte gPlaySt
_08092D4C: .4byte 0x0000038B
_08092D50:
	ldr r0, _08092D8C @ =gpKeySt
	ldr r1, [r0]
	movs r0, #0x81
	lsls r0, r0, #1
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _08092D68
	bl CloseHelpBox
	movs r0, #0xff
	strb r0, [r4]
_08092D68:
	ldr r1, _08092D8C @ =gpKeySt
	ldr r3, [r1]
	movs r6, #0x20
	adds r0, r6, #0
	ldrh r2, [r3, #6]
	ands r0, r2
	adds r4, r5, #0
	adds r4, #0x2d
	cmp r0, #0
	beq _08092D9E
	ldrb r2, [r4]
	movs r0, #1
	ands r0, r2
	cmp r0, #0
	beq _08092D90
	subs r0, r2, #1
	b _08092D9C
	.align 2, 0
_08092D8C: .4byte gpKeySt
_08092D90:
	adds r0, r6, #0
	ldrh r3, [r3, #8]
	ands r0, r3
	cmp r0, #0
	beq _08092D9E
	adds r0, r2, #1
_08092D9C:
	strb r0, [r4]
_08092D9E:
	ldr r3, [r1]
	movs r6, #0x10
	adds r0, r6, #0
	ldrh r2, [r3, #6]
	ands r0, r2
	cmp r0, #0
	beq _08092DC8
	ldrb r2, [r4]
	movs r0, #1
	ands r0, r2
	cmp r0, #0
	bne _08092DBA
	adds r0, r2, #1
	b _08092DC6
_08092DBA:
	adds r0, r6, #0
	ldrh r3, [r3, #8]
	ands r0, r3
	cmp r0, #0
	beq _08092DC8
	subs r0, r2, #1
_08092DC6:
	strb r0, [r4]
_08092DC8:
	ldr r3, [r1]
	movs r6, #0x40
	adds r0, r6, #0
	ldrh r2, [r3, #6]
	ands r0, r2
	cmp r0, #0
	beq _08092DEE
	ldrb r2, [r4]
	cmp r2, #1
	bls _08092DE0
	subs r0, r2, #2
	b _08092DEC
_08092DE0:
	adds r0, r6, #0
	ldrh r3, [r3, #8]
	ands r0, r3
	cmp r0, #0
	beq _08092DEE
	adds r0, r2, #4
_08092DEC:
	strb r0, [r4]
_08092DEE:
	ldr r1, [r1]
	movs r3, #0x80
	adds r0, r3, #0
	ldrh r2, [r1, #6]
	ands r0, r2
	cmp r0, #0
	beq _08092E14
	ldrb r2, [r4]
	cmp r2, #3
	bhi _08092E06
	adds r0, r2, #2
	b _08092E12
_08092E06:
	adds r0, r3, #0
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _08092E14
	subs r0, r2, #4
_08092E12:
	strb r0, [r4]
_08092E14:
	ldrb r0, [r4]
	cmp r7, r0
	beq _08092E70
	ldr r0, _08092E78 @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08092E2C
	ldr r0, _08092E7C @ =0x00000385
	bl m4aSongNumStart
_08092E2C:
	ldrb r1, [r4]
	movs r6, #1
	adds r0, r6, #0
	ands r0, r1
	lsls r0, r0, #5
	adds r0, #0x88
	lsrs r1, r1, #1
	lsls r1, r1, #4
	adds r1, #0x54
	movs r3, #0x80
	lsls r3, r3, #3
	movs r2, #3
	bl ShowSysHandCursor
	adds r0, r5, #0
	adds r0, #0x2c
	ldrb r0, [r0]
	cmp r0, #0xff
	beq _08092E70
	ldrb r1, [r4]
	adds r0, r6, #0
	ands r0, r1
	lsls r0, r0, #5
	adds r0, #0x88
	lsrs r1, r1, #1
	lsls r1, r1, #4
	adds r1, #0x54
	ldr r3, _08092E80 @ =gUnk_08D8C9A8
	ldrb r4, [r4]
	lsls r2, r4, #2
	adds r2, r2, r3
	ldr r2, [r2]
	bl StartHelpBox
_08092E70:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08092E78: .4byte gPlaySt
_08092E7C: .4byte 0x00000385
_08092E80: .4byte gUnk_08D8C9A8

	thumb_func_start sub_8092E84
sub_8092E84: @ 0x08092E84
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	movs r0, #0
	bl GetBgTilemap
	movs r1, #0
	bl TmFill
	ldr r4, _08092ED4 @ =0x02012A20
	ldr r5, _08092ED8 @ =gBg0Tm + 0x244
	adds r0, r6, #0
	adds r0, #0x2a
	ldrb r0, [r0]
	bl sub_808E644
	adds r2, r0, #0
	adds r0, r4, #0
	adds r1, r5, #0
	movs r3, #0
	bl sub_80932DC
	adds r4, #0x28
	adds r5, #0x1a
	adds r6, #0x29
	ldrb r0, [r6]
	bl sub_808E644
	adds r2, r0, #0
	adds r0, r4, #0
	adds r1, r5, #0
	movs r3, #0
	bl sub_80932DC
	movs r0, #1
	bl EnableBgSync
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08092ED4: .4byte 0x02012A20
_08092ED8: .4byte gBg0Tm + 0x244

	thumb_func_start sub_8092EDC
sub_8092EDC: @ 0x08092EDC
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r6, r0, #0
	movs r0, #1
	bl GetBgTilemap
	movs r1, #0
	bl TmFill
	movs r0, #2
	bl GetBgTilemap
	movs r1, #0
	bl TmFill
	ldr r0, _08092FEC @ =gBg0Tm
	movs r1, #0x1f
	movs r2, #8
	movs r3, #0
	bl TmFillRect_thm
	movs r0, #0xc0
	lsls r0, r0, #7
	movs r1, #5
	bl sub_809228C
	movs r0, #0xc0
	lsls r0, r0, #6
	movs r1, #0xa
	bl sub_80922DC
	ldr r0, _08092FF0 @ =gBg1Tm
	ldr r1, _08092FF4 @ =gUnk_08420CC4
	movs r2, #0xa6
	lsls r2, r2, #7
	bl TmApplyTsa_thm
	adds r1, r6, #0
	adds r1, #0x31
	movs r0, #0
	strb r0, [r1]
	adds r7, r6, #0
	adds r7, #0x29
	ldrb r5, [r7]
	adds r0, r5, #0
	movs r1, #3
	bl __umodsi3
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x12
	adds r4, #0x18
	adds r0, r5, #0
	movs r1, #3
	bl __udivsi3
	adds r1, r0, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x14
	ldrh r0, [r6, #0x32]
	subs r0, #4
	subs r1, r1, r0
	movs r3, #0x80
	lsls r3, r3, #4
	adds r0, r4, #0
	movs r2, #7
	bl ShowSysHandCursor
	adds r0, r6, #0
	movs r1, #0
	bl sub_80937E0
	movs r0, #7
	bl EnableBgSync
	adds r4, r6, #0
	adds r4, #0x2a
	ldrb r0, [r4]
	bl sub_808E644
	adds r1, r0, #0
	ldr r0, _08092FF8 @ =0x00000503
	str r0, [sp]
	movs r0, #0
	movs r2, #0x44
	movs r3, #0x4e
	bl sub_80931F8
	ldrb r0, [r7]
	bl sub_808E644
	adds r1, r0, #0
	ldr r0, _08092FFC @ =0x00000502
	str r0, [sp]
	movs r0, #1
	movs r2, #0xac
	movs r3, #0x4e
	bl sub_80931F8
	ldrb r5, [r4]
	adds r0, r5, #0
	movs r1, #3
	bl __umodsi3
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x12
	adds r4, #0x18
	adds r0, r5, #0
	movs r1, #3
	bl __udivsi3
	adds r2, r0, #0
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x14
	ldrh r0, [r6, #0x32]
	subs r0, #4
	subs r2, r2, r0
	movs r0, #0
	adds r1, r4, #0
	movs r3, #2
	bl sub_80A98DC
	ldr r0, _08093000 @ =sub_8092E84
	movs r1, #1
	adds r2, r6, #0
	bl StartParallelFiniteLoop
	bl UnblockUiCursorHand
	bl EndHelpPromptSprite
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08092FEC: .4byte gBg0Tm
_08092FF0: .4byte gBg1Tm
_08092FF4: .4byte gUnk_08420CC4
_08092FF8: .4byte 0x00000503
_08092FFC: .4byte 0x00000502
_08093000: .4byte sub_8092E84

	thumb_func_start sub_8093004
sub_8093004: @ 0x08093004
	push {lr}
	bl sub_809225C
	movs r0, #1
	bl EnableBgSync
	pop {r0}
	bx r0

	thumb_func_start sub_8093014
sub_8093014: @ 0x08093014
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r6, r0, #0
	movs r0, #0xf
	ldrh r1, [r6, #0x32]
	ands r0, r1
	cmp r0, #0
	beq _08093026
	b _0809314C
_08093026:
	ldr r0, _08093040 @ =gpKeySt
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r1
	cmp r0, #0
	beq _08093044
	adds r0, r6, #0
	bl Proc_Break
	b _08093152
	.align 2, 0
_08093040: .4byte gpKeySt
_08093044:
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _080930BC
	adds r5, r6, #0
	adds r5, #0x29
	ldrb r0, [r5]
	bl sub_808E644
	bl GetUnitItemCount
	adds r7, r0, #0
	adds r4, r6, #0
	adds r4, #0x2a
	ldrb r0, [r4]
	bl sub_808E644
	bl GetUnitItemCount
	ldrb r5, [r5]
	ldrb r4, [r4]
	cmp r5, r4
	beq _080930A0
	cmp r7, #0
	bgt _0809307A
	cmp r0, #0
	ble _080930A0
_0809307A:
	adds r0, r6, #0
	movs r1, #6
	bl Proc_Goto
	ldr r0, _08093098 @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08093152
	ldr r0, _0809309C @ =0x0000038A
	bl m4aSongNumStart
	b _08093152
	.align 2, 0
_08093098: .4byte gPlaySt
_0809309C: .4byte 0x0000038A
_080930A0:
	ldr r0, _080930B8 @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08093152
	movs r0, #0xe3
	lsls r0, r0, #2
	bl m4aSongNumStart
	b _08093152
	.align 2, 0
_080930B8: .4byte gPlaySt
_080930BC:
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _080930F0
	movs r0, #1
	bl sub_80932B0
	adds r0, r6, #0
	movs r1, #2
	bl Proc_Goto
	ldr r0, _080930E8 @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08093152
	ldr r0, _080930EC @ =0x0000038B
	bl m4aSongNumStart
	b _08093152
	.align 2, 0
_080930E8: .4byte gPlaySt
_080930EC: .4byte 0x0000038B
_080930F0:
	adds r0, r6, #0
	bl sub_8092420
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0809314C
	adds r7, r6, #0
	adds r7, #0x29
	ldrb r0, [r7]
	bl sub_808E644
	adds r1, r0, #0
	ldr r0, _0809315C @ =0x00000502
	str r0, [sp]
	movs r0, #1
	movs r2, #0xac
	movs r3, #0x4e
	bl sub_80931F8
	ldr r4, _08093160 @ =0x02012A48
	ldr r5, _08093164 @ =gBg0Tm + 0x25e
	ldrb r0, [r7]
	bl sub_808E644
	adds r2, r0, #0
	adds r0, r4, #0
	adds r1, r5, #0
	movs r3, #2
	bl sub_80932DC
	subs r4, #0x28
	subs r5, #0x1a
	adds r0, r6, #0
	adds r0, #0x2a
	ldrb r0, [r0]
	bl sub_808E644
	adds r2, r0, #0
	adds r0, r4, #0
	adds r1, r5, #0
	movs r3, #1
	bl sub_80932DC
	movs r0, #1
	bl EnableBgSync
_0809314C:
	adds r0, r6, #0
	bl sub_809257C
_08093152:
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0809315C: .4byte 0x00000502
_08093160: .4byte 0x02012A48
_08093164: .4byte gBg0Tm + 0x25e

	thumb_func_start sub_8093168
sub_8093168: @ 0x08093168
	push {r4, r5, lr}
	adds r4, r0, #0
	bl sub_8092150
	adds r0, r4, #0
	adds r0, #0x2a
	ldrb r0, [r0]
	bl sub_808E644
	adds r5, r0, #0
	adds r0, r4, #0
	adds r0, #0x29
	ldrb r0, [r0]
	bl sub_808E644
	adds r1, r0, #0
	adds r0, r5, #0
	adds r2, r4, #0
	bl sub_80951D8
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_8093198
sub_8093198: @ 0x08093198
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x2a
	ldrb r0, [r0]
	bl sub_808E644
	adds r1, r4, #0
	bl StartPrepItemUseScreen
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_80931B0
sub_80931B0: @ 0x080931B0
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x2a
	ldrb r0, [r0]
	bl sub_808E644
	adds r1, r4, #0
	bl sub_8097BF4
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_80931C8
sub_80931C8: @ 0x080931C8
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x2a
	ldrb r0, [r0]
	bl sub_808E644
	adds r1, r4, #0
	bl sub_8099828
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_80931E0
sub_80931E0: @ 0x080931E0
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x2a
	ldrb r0, [r0]
	bl sub_808E644
	adds r1, r4, #0
	bl sub_8098E74
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_80931F8
sub_80931F8: @ 0x080931F8
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #4
	adds r4, r0, #0
	adds r6, r1, #0
	ldr r0, [sp, #0x20]
	lsls r2, r2, #0x10
	lsrs r7, r2, #0x10
	lsls r3, r3, #0x10
	lsrs r3, r3, #0x10
	mov r8, r3
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov sb, r0
	ldr r0, _08093258 @ =gUnk_08D8C9C0
	bl Proc_Find
	adds r5, r0, #0
	lsls r1, r4, #2
	adds r0, #0x40
	adds r0, r0, r1
	ldr r0, [r0]
	cmp r0, r6
	beq _0809325C
	cmp r0, #0
	beq _08093236
	adds r0, r4, #0
	bl EndFaceById
_08093236:
	cmp r6, #0
	beq _08093278
	adds r0, r6, #0
	bl GetUnitPortraitId
	adds r1, r0, #0
	lsls r2, r7, #0x10
	asrs r2, r2, #0x10
	mov r0, r8
	lsls r3, r0, #0x10
	asrs r3, r3, #0x10
	mov r0, sb
	str r0, [sp]
	adds r0, r4, #0
	bl StartBmFace
	b _08093278
	.align 2, 0
_08093258: .4byte gUnk_08D8C9C0
_0809325C:
	cmp r6, #0
	beq _08093278
	lsls r1, r7, #0x10
	asrs r1, r1, #0x10
	mov r0, r8
	lsls r2, r0, #0x10
	asrs r2, r2, #0x10
	adds r0, r4, #0
	bl sub_8007B80
	adds r0, r4, #0
	mov r1, sb
	bl SetFaceDispById
_08093278:
	lsls r1, r4, #2
	adds r0, r5, #0
	adds r0, #0x40
	adds r0, r0, r1
	str r6, [r0]
	lsls r1, r4, #1
	adds r0, r5, #0
	adds r0, #0x34
	adds r0, r0, r1
	strh r7, [r0]
	adds r0, r5, #0
	adds r0, #0x38
	adds r0, r0, r1
	mov r2, r8
	strh r2, [r0]
	adds r0, r5, #0
	adds r0, #0x3c
	adds r0, r0, r1
	mov r1, sb
	strh r1, [r0]
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_80932B0
sub_80932B0: @ 0x080932B0
	push {lr}
	sub sp, #4
	movs r1, #0
	str r1, [sp]
	movs r2, #0
	movs r3, #0
	bl sub_80931F8
	add sp, #4
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_80932C8
sub_80932C8: @ 0x080932C8
	push {lr}
	adds r1, r0, #0
	ldr r0, _080932D8 @ =gUnk_08D8C9C0
	bl Proc_StartBlocking
	pop {r1}
	bx r1
	.align 2, 0
_080932D8: .4byte gUnk_08D8C9C0

	thumb_func_start sub_80932DC
sub_80932DC: @ 0x080932DC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x10
	adds r6, r0, #0
	adds r4, r1, #0
	mov r8, r2
	lsls r3, r3, #0x10
	lsrs r3, r3, #0x10
	str r3, [sp]
	adds r0, r4, #0
	movs r1, #0xc
	movs r2, #0x14
	movs r3, #0
	bl TmFillRect_thm
	movs r0, #2
	ldr r1, [sp]
	ands r0, r1
	cmp r0, #0
	beq _0809330E
	bl ClearIcons
_0809330E:
	mov r0, r8
	cmp r0, #0
	beq _080933DE
	bl GetUnitItemCount
	str r0, [sp, #4]
	movs r1, #0
	mov sb, r1
	cmp sb, r0
	bge _080933DE
	adds r0, r4, #0
	adds r0, #0x18
	str r0, [sp, #8]
	adds r1, r4, #6
	str r1, [sp, #0xc]
	adds r4, #2
	mov sl, r4
_08093330:
	mov r1, sb
	lsls r0, r1, #1
	mov r1, r8
	adds r1, #0x1e
	adds r1, r1, r0
	ldrh r5, [r1]
	movs r0, #4
	ldr r1, [sp]
	ands r0, r1
	cmp r0, #0
	beq _08093350
	mov r0, r8
	adds r1, r5, #0
	bl sub_80284C8
	b _08093358
_08093350:
	mov r0, r8
	adds r1, r5, #0
	bl IsItemDisplayUsable
_08093358:
	movs r7, #0
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08093362
	movs r7, #1
_08093362:
	movs r0, #1
	ldr r1, [sp]
	ands r0, r1
	cmp r0, #0
	bne _08093390
	adds r0, r6, #0
	bl ClearText
	adds r0, r6, #0
	adds r1, r7, #0
	bl Text_SetColor
	adds r0, r6, #0
	movs r1, #0
	bl Text_SetCursor
	adds r0, r5, #0
	bl GetItemName
	adds r1, r0, #0
	adds r0, r6, #0
	bl Text_DrawString
_08093390:
	adds r0, r5, #0
	bl sub_8017808
	adds r1, r0, #0
	mov r0, sl
	movs r2, #0x80
	lsls r2, r2, #7
	bl PutIcon
	adds r0, r6, #0
	ldr r1, [sp, #0xc]
	bl PutText
	movs r4, #1
	cmp r7, #0
	bne _080933B2
	movs r4, #2
_080933B2:
	adds r0, r5, #0
	bl GetItemUses
	adds r2, r0, #0
	ldr r0, [sp, #8]
	adds r1, r4, #0
	bl PutNumberOrBlank
	adds r6, #8
	ldr r0, [sp, #8]
	adds r0, #0x80
	str r0, [sp, #8]
	ldr r1, [sp, #0xc]
	adds r1, #0x80
	str r1, [sp, #0xc]
	movs r0, #0x80
	add sl, r0
	movs r1, #1
	add sb, r1
	ldr r0, [sp, #4]
	cmp sb, r0
	blt _08093330
_080933DE:
	add sp, #0x10
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_80933F0
sub_80933F0: @ 0x080933F0
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r0, #0x29
	ldrb r0, [r0]
	movs r1, #3
	bl __udivsi3
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x14
	adds r6, r4, #0
	bl sub_808E664
	subs r0, #1
	movs r1, #3
	bl __divsi3
	lsls r0, r0, #4
	ldrh r2, [r5, #0x32]
	subs r1, r4, r2
	cmp r1, #0x20
	ble _0809342A
	cmp r4, r0
	bne _08093424
	adds r0, r4, #0
	subs r0, #0x30
	b _0809343A
_08093424:
	adds r0, r4, #0
	subs r0, #0x20
	b _0809343A
_0809342A:
	cmp r1, #0xf
	bgt _0809343C
	cmp r4, #0
	bne _08093436
	strh r4, [r5, #0x32]
	b _0809343C
_08093436:
	adds r0, r6, #0
	subs r0, #0x10
_0809343A:
	strh r0, [r5, #0x32]
_0809343C:
	ldr r1, _08093474 @ =0x0000FFD8
	ldrh r2, [r5, #0x32]
	subs r2, #4
	movs r0, #0xff
	ands r2, r0
	movs r0, #2
	bl SetBgOffset
	ldrh r4, [r5, #0x32]
	bl sub_808E664
	subs r0, #1
	movs r1, #3
	bl __divsi3
	adds r2, r0, #0
	adds r2, #1
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	movs r0, #6
	adds r1, r4, #0
	movs r3, #4
	bl sub_8090E04
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08093474: .4byte 0x0000FFD8

	thumb_func_start sub_8093478
sub_8093478: @ 0x08093478
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	adds r4, r2, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	mov sl, r1
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	lsls r0, r1, #1
	add r0, sl
	str r0, [sp]
	movs r1, #0xf
	bl __modsi3
	lsls r0, r0, #3
	ldr r1, _08093538 @ =0x020129A8
	adds r6, r0, r1
	movs r0, #0
	mov r8, r0
	lsls r4, r4, #0x18
	asrs r4, r4, #0x18
	mov sb, r4
_080934AC:
	mov r1, sb
	cmp r1, #0
	bne _080934B8
	adds r0, r6, #0
	bl ClearText
_080934B8:
	ldr r4, [sp]
	add r4, r8
	bl sub_808E664
	cmp r4, r0
	bge _08093514
	mov r0, r8
	movs r1, #3
	bl __modsi3
	lsls r7, r0, #3
	mov r0, sl
	lsls r5, r0, #1
	movs r0, #0x1f
	ands r5, r0
	mov r1, sb
	cmp r1, #0
	bne _08093504
	adds r0, r4, #0
	bl sub_808E644
	adds r4, r0, #0
	adds r0, r6, #0
	movs r1, #0
	bl Text_SetCursor
	adds r0, r6, #0
	movs r1, #0
	bl Text_SetColor
	ldr r0, [r4]
	ldrh r0, [r0]
	bl DecodeMsg
	adds r1, r0, #0
	adds r0, r6, #0
	bl Text_DrawString
_08093504:
	lsls r1, r5, #5
	adds r1, r1, r7
	lsls r1, r1, #1
	ldr r0, _0809353C @ =gBg2Tm
	adds r1, r1, r0
	adds r0, r6, #0
	bl PutText
_08093514:
	adds r6, #8
	movs r0, #1
	add r8, r0
	mov r1, r8
	cmp r1, #2
	ble _080934AC
	movs r0, #4
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
_08093538: .4byte 0x020129A8
_0809353C: .4byte gBg2Tm

	thumb_func_start sub_8093540
sub_8093540: @ 0x08093540
	cmp r0, #0x60
	bhi _0809354C
	cmp r1, #0x1f
	ble _0809354C
	movs r0, #1
	b _0809354E
_0809354C:
	movs r0, #0
_0809354E:
	bx lr

	thumb_func_start sub_8093550
sub_8093550: @ 0x08093550
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	movs r6, #0
	b _080935B0
_08093558:
	adds r0, r6, #0
	movs r1, #3
	bl __modsi3
	lsls r5, r0, #6
	adds r0, r6, #0
	movs r1, #3
	bl __divsi3
	lsls r0, r0, #4
	ldrh r1, [r7, #0x32]
	subs r4, r0, r1
	adds r0, r4, #0
	adds r0, #0x14
	cmp r0, #0x44
	bhi _080935AE
	adds r0, r7, #0
	adds r0, #0x31
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _08093594
	adds r0, r5, #0
	adds r1, r4, #0
	bl sub_8093540
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080935AE
_08093594:
	adds r5, #0x18
	adds r4, #4
	movs r0, #0xff
	ands r4, r0
	adds r0, r6, #0
	bl sub_808E644
	adds r3, r0, #0
	movs r0, #0
	adds r1, r5, #0
	adds r2, r4, #0
	bl sub_8026540
_080935AE:
	adds r6, #1
_080935B0:
	bl sub_808E664
	cmp r6, r0
	blt _08093558
	bl sub_80259A4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_80935C4
sub_80935C4: @ 0x080935C4
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x1c
	str r0, [sp, #4]
	mov sl, r1
	str r2, [sp, #8]
	str r3, [sp, #0xc]
	cmp r2, #0
	bgt _080935DE
	b _080937BE
_080935DE:
	cmp r3, #0
	bgt _080935E4
	b _080937BE
_080935E4:
	ldr r5, _080937D0 @ =Sprite_8x8
	ldr r0, [sp, #0x3c]
	str r0, [sp]
	movs r0, #4
	ldr r1, [sp, #4]
	mov r2, sl
	adds r3, r5, #0
	bl PutSpriteExt
	ldr r1, [sp, #8]
	lsls r1, r1, #3
	mov sb, r1
	ldr r4, [sp, #4]
	add r4, sb
	movs r2, #0x80
	lsls r2, r2, #5
	adds r1, r4, r2
	ldr r3, [sp, #0x3c]
	str r3, [sp]
	movs r0, #4
	mov r2, sl
	adds r3, r5, #0
	bl PutSpriteExt
	movs r0, #0xc0
	lsls r0, r0, #6
	adds r4, r4, r0
	ldr r1, [sp, #0xc]
	lsls r1, r1, #3
	mov r8, r1
	mov r6, sl
	add r6, r8
	ldr r2, [sp, #0x3c]
	str r2, [sp]
	movs r0, #4
	adds r1, r4, #0
	adds r2, r6, #0
	adds r3, r5, #0
	bl PutSpriteExt
	ldr r3, [sp, #4]
	movs r0, #0x80
	lsls r0, r0, #6
	adds r1, r3, r0
	ldr r2, [sp, #0x3c]
	str r2, [sp]
	movs r0, #4
	adds r2, r6, #0
	adds r3, r5, #0
	bl PutSpriteExt
	movs r5, #1
	mov r3, sb
	str r3, [sp, #0x18]
	mov sb, r8
	ldr r0, [sp, #8]
	subs r0, #1
	str r0, [sp, #0x10]
	cmp r5, r0
	bge _08093698
	ldr r1, _080937D4 @ =Sprite_16x8
	mov r8, r1
	ldr r7, [sp, #0x3c]
	adds r7, #1
	ldr r2, [sp, #4]
	ldr r3, _080937D8 @ =0x00002008
	adds r6, r2, r3
	adds r4, r2, #0
	adds r4, #8
_0809366E:
	str r7, [sp]
	movs r0, #4
	adds r1, r4, #0
	mov r2, sl
	mov r3, r8
	bl PutSpriteExt
	str r7, [sp]
	movs r0, #4
	adds r1, r6, #0
	mov r2, sl
	add r2, sb
	mov r3, r8
	bl PutSpriteExt
	adds r6, #0x10
	adds r4, #0x10
	adds r5, #2
	ldr r0, [sp, #0x10]
	cmp r5, r0
	blt _0809366E
_08093698:
	ldr r1, [sp, #8]
	cmp r5, r1
	bge _080936E0
	ldr r2, _080937D0 @ =Sprite_8x8
	mov r8, r2
	ldr r7, [sp, #0x3c]
	adds r7, #1
	lsls r1, r5, #3
	movs r3, #0x80
	lsls r3, r3, #6
	adds r0, r1, r3
	ldr r2, [sp, #4]
	adds r6, r0, r2
	adds r4, r1, r2
	ldr r3, [sp, #8]
	subs r5, r3, r5
_080936B8:
	str r7, [sp]
	movs r0, #4
	adds r1, r4, #0
	mov r2, sl
	mov r3, r8
	bl PutSpriteExt
	str r7, [sp]
	movs r0, #4
	adds r1, r6, #0
	mov r2, sl
	add r2, sb
	mov r3, r8
	bl PutSpriteExt
	adds r6, #8
	adds r4, #8
	subs r5, #1
	cmp r5, #0
	bne _080936B8
_080936E0:
	ldr r0, [sp, #0xc]
	cmp r0, #1
	ble _08093724
	ldr r7, _080937D0 @ =Sprite_8x8
	ldr r5, [sp, #0x3c]
	adds r5, #3
	mov r4, sl
	adds r4, #8
	ldr r1, [sp, #4]
	ldr r2, [sp, #0x18]
	adds r1, r1, r2
	mov r8, r1
	adds r6, r0, #0
	subs r6, #1
_080936FC:
	str r5, [sp]
	movs r0, #4
	ldr r1, [sp, #4]
	adds r2, r4, #0
	adds r3, r7, #0
	bl PutSpriteExt
	str r5, [sp]
	movs r0, #4
	movs r1, #0x80
	lsls r1, r1, #5
	add r1, r8
	adds r2, r4, #0
	adds r3, r7, #0
	bl PutSpriteExt
	adds r4, #8
	subs r6, #1
	cmp r6, #0
	bne _080936FC
_08093724:
	movs r6, #1
	ldr r3, [sp, #0xc]
	cmp r6, r3
	bge _080937BE
	ldr r0, [sp, #8]
	subs r0, #3
	mov sb, r0
	ldr r1, [sp, #0x3c]
	adds r1, #4
	mov r8, r1
_08093738:
	movs r5, #1
	adds r2, r6, #1
	str r2, [sp, #0x14]
	cmp r5, sb
	bge _08093762
	ldr r4, [sp, #4]
	adds r4, #8
	lsls r7, r6, #3
_08093748:
	mov r3, r8
	str r3, [sp]
	movs r0, #4
	adds r1, r4, #0
	mov r3, sl
	adds r2, r3, r7
	ldr r3, _080937DC @ =Sprite_32x8
	bl PutSpriteExt
	adds r4, #0x20
	adds r5, #4
	cmp r5, sb
	blt _08093748
_08093762:
	ldr r0, [sp, #0x10]
	cmp r5, r0
	bge _0809378C
	lsls r0, r5, #3
	ldr r1, [sp, #4]
	adds r4, r0, r1
	lsls r7, r6, #3
_08093770:
	mov r2, r8
	str r2, [sp]
	movs r0, #4
	adds r1, r4, #0
	mov r3, sl
	adds r2, r3, r7
	ldr r3, _080937D4 @ =Sprite_16x8
	bl PutSpriteExt
	adds r4, #0x10
	adds r5, #2
	ldr r0, [sp, #0x10]
	cmp r5, r0
	blt _08093770
_0809378C:
	ldr r1, [sp, #8]
	cmp r5, r1
	bge _080937B6
	lsls r0, r5, #3
	ldr r2, [sp, #4]
	adds r4, r0, r2
	lsls r6, r6, #3
	subs r5, r1, r5
_0809379C:
	mov r3, r8
	str r3, [sp]
	movs r0, #4
	adds r1, r4, #0
	mov r3, sl
	adds r2, r3, r6
	ldr r3, _080937D0 @ =Sprite_8x8
	bl PutSpriteExt
	adds r4, #8
	subs r5, #1
	cmp r5, #0
	bne _0809379C
_080937B6:
	ldr r6, [sp, #0x14]
	ldr r0, [sp, #0xc]
	cmp r6, r0
	blt _08093738
_080937BE:
	add sp, #0x1c
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080937D0: .4byte Sprite_8x8
_080937D4: .4byte Sprite_16x8
_080937D8: .4byte 0x00002008
_080937DC: .4byte Sprite_32x8

	thumb_func_start sub_80937E0
sub_80937E0: @ 0x080937E0
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	ldrh r0, [r5, #0x32]
	lsrs r4, r0, #4
	adds r0, r4, #4
	cmp r4, r0
	bge _0809380C
	lsls r6, r1, #0x18
_080937F4:
	lsls r1, r4, #0x18
	lsrs r1, r1, #0x18
	adds r0, r5, #0
	asrs r2, r6, #0x18
	bl sub_8093478
	adds r4, #1
	ldrh r1, [r5, #0x32]
	lsrs r0, r1, #4
	adds r0, #4
	cmp r4, r0
	blt _080937F4
_0809380C:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_8093814
sub_8093814: @ 0x08093814
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	bl GetUnitItemCount
	adds r7, r0, #0
	bl sub_809158C
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	movs r4, #0
	cmp r4, r7
	bge _0809384A
	cmp r6, #0x63
	bgt _0809384A
_08093830:
	ldrh r0, [r5, #0x1e]
	bl AddItemToConvoy
	adds r0, r5, #0
	movs r1, #0
	bl UnitRemoveItem
	adds r4, #1
	cmp r4, r7
	bge _0809384A
	adds r0, r4, r6
	cmp r0, #0x63
	ble _08093830
_0809384A:
	cmp r4, #0
	bgt _08093852
	movs r0, #0
	b _08093854
_08093852:
	movs r0, #1
_08093854:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_809385C
sub_809385C: @ 0x0809385C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	adds r0, r1, #0
	movs r7, #0
	lsls r1, r0, #1
	mov r8, r1
	movs r1, #7
	bl __modsi3
	mov sl, r0
	movs r2, #0
	mov sb, r2
_0809387C:
	mov r0, r8
	adds r4, r0, r7
	bl sub_808E664
	cmp r4, r0
	bge _080938F6
	adds r0, r4, #0
	bl sub_808E644
	adds r5, r0, #0
	movs r6, #0
	bl CheckInLinkArena
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080938AE
	ldr r0, [r5]
	ldrb r0, [r0, #4]
	bl sub_808E6A4
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080938AE
	movs r6, #4
	b _080938BA
_080938AE:
	ldr r0, [r5, #0xc]
	movs r1, #8
	ands r0, r1
	cmp r0, #0
	beq _080938BA
	movs r6, #1
_080938BA:
	mov r1, sl
	lsls r4, r1, #1
	adds r4, r4, r7
	lsls r4, r4, #3
	ldr r0, _08093918 @ =0x02012AA0
	adds r4, r4, r0
	adds r0, r4, #0
	bl ClearText
	ldr r0, [r5]
	ldrh r0, [r0]
	bl DecodeMsg
	movs r1, #0x1f
	mov r2, r8
	ands r1, r2
	lsls r1, r1, #5
	adds r1, #0x10
	add r1, sb
	lsls r1, r1, #1
	ldr r2, _0809391C @ =gBg2Tm
	adds r1, r1, r2
	movs r2, #0
	str r2, [sp]
	str r0, [sp, #4]
	adds r0, r4, #0
	adds r2, r6, #0
	movs r3, #0
	bl PutDrawText
_080938F6:
	movs r0, #7
	add sb, r0
	adds r7, #1
	cmp r7, #1
	ble _0809387C
	movs r0, #4
	bl EnableBgSync
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08093918: .4byte 0x02012AA0
_0809391C: .4byte gBg2Tm

	thumb_func_start sub_8093920
sub_8093920: @ 0x08093920
	push {lr}
	lsls r0, r0, #1
	movs r1, #0x1f
	ands r0, r1
	lsls r0, r0, #6
	ldr r1, _08093944 @ =gBg2Tm + 0x20
	adds r0, r0, r1
	movs r1, #0xd
	movs r2, #1
	movs r3, #0
	bl TmFillRect_thm
	movs r0, #4
	bl EnableBgSync
	pop {r0}
	bx r0
	.align 2, 0
_08093944: .4byte gBg2Tm + 0x20

	thumb_func_start sub_8093948
sub_8093948: @ 0x08093948
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r7, r0, #0
	movs r6, #0
	b _08093984
_08093952:
	asrs r0, r6, #1
	lsls r0, r0, #4
	ldrh r1, [r7, #0x30]
	subs r5, r0, r1
	adds r0, r5, #0
	adds r0, #0xf
	cmp r0, #0x5f
	bhi _08093982
	movs r0, #1
	ands r0, r6
	lsls r4, r0, #3
	subs r4, r4, r0
	lsls r4, r4, #3
	adds r4, #0x70
	adds r5, #0x18
	adds r0, r6, #0
	bl sub_808E644
	adds r3, r0, #0
	movs r0, #0
	adds r1, r4, #0
	adds r2, r5, #0
	bl sub_8026540
_08093982:
	adds r6, #1
_08093984:
	bl sub_808E664
	cmp r6, r0
	blt _08093952
	movs r0, #0xf
	ldrh r2, [r7, #0x30]
	ands r0, r2
	cmp r0, #0
	beq _08093A2C
	ldr r0, _08093A28 @ =gDispIo
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
	movs r2, #0
	strb r2, [r0]
	adds r0, #4
	strb r2, [r0]
	subs r0, #5
	movs r3, #0xf0
	strb r3, [r0]
	mov r1, ip
	adds r1, #0x30
	movs r0, #0x18
	strb r0, [r1]
	mov r0, ip
	adds r0, #0x2f
	strb r2, [r0]
	adds r1, #3
	movs r0, #0x78
	strb r0, [r1]
	mov r0, ip
	adds r0, #0x2e
	strb r3, [r0]
	subs r1, #1
	movs r0, #0xa0
	strb r0, [r1]
	mov r6, ip
	adds r6, #0x34
	movs r2, #1
	ldrb r0, [r6]
	orrs r0, r2
	movs r4, #2
	orrs r0, r4
	movs r5, #5
	rsbs r5, r5, #0
	ands r0, r5
	movs r3, #8
	orrs r0, r3
	movs r1, #0x11
	rsbs r1, r1, #0
	ands r0, r1
	strb r0, [r6]
	mov r1, ip
	adds r1, #0x35
	ldrb r0, [r1]
	orrs r0, r2
	orrs r0, r4
	ands r0, r5
	orrs r0, r3
	movs r5, #0x10
	orrs r0, r5
	strb r0, [r1]
	adds r1, #1
	ldrb r0, [r1]
	orrs r2, r0
	orrs r2, r4
	movs r0, #4
	orrs r2, r0
	orrs r2, r3
	orrs r2, r5
	strb r2, [r1]
	b _08093A42
	.align 2, 0
_08093A28: .4byte gDispIo
_08093A2C:
	ldr r2, _08093A88 @ =gDispIo
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
_08093A42:
	ldr r3, _08093A8C @ =gUnk_08D8CDA8
	movs r4, #0x40
	str r4, [sp]
	movs r0, #4
	movs r1, #0x80
	movs r2, #0x8e
	bl PutSpriteExt
	adds r1, r7, #0
	adds r1, #0x37
	ldrb r0, [r1]
	cmp r0, #0
	beq _08093A60
	adds r0, #1
	strb r0, [r1]
_08093A60:
	ldrb r1, [r1]
	lsrs r0, r1, #2
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	bne _08093AA2
	bl CheckInLinkArena
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08093A94
	ldr r3, _08093A90 @ =gUnk_08D8CDD0
	str r4, [sp]
	movs r0, #4
	movs r1, #0x80
	movs r2, #0x7e
	bl PutSpriteExt
	b _08093AA2
	.align 2, 0
_08093A88: .4byte gDispIo
_08093A8C: .4byte gUnk_08D8CDA8
_08093A90: .4byte gUnk_08D8CDD0
_08093A94:
	ldr r3, _08093AB0 @ =gUnk_08D8CDBC
	str r4, [sp]
	movs r0, #4
	movs r1, #0x80
	movs r2, #0x7e
	bl PutSpriteExt
_08093AA2:
	bl sub_80259A4
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08093AB0: .4byte gUnk_08D8CDBC

	thumb_func_start sub_8093AB4
sub_8093AB4: @ 0x08093AB4
	push {r4, r5, lr}
	bl ResetText
	ldr r5, _08093B08 @ =0x02012AA0
	movs r4, #0xd
_08093ABE:
	adds r0, r5, #0
	movs r1, #5
	bl InitText
	adds r5, #8
	subs r4, #1
	cmp r4, #0
	bge _08093ABE
	ldr r5, _08093B0C @ =0x02012B10
	movs r4, #4
_08093AD2:
	adds r0, r5, #0
	movs r1, #7
	bl InitText
	adds r5, #8
	subs r4, #1
	cmp r4, #0
	bge _08093AD2
	ldr r4, _08093B10 @ =0x02012B38
	adds r0, r4, #0
	movs r1, #7
	bl InitText
	adds r0, r4, #0
	adds r0, #8
	movs r1, #0xa
	bl InitText
	adds r4, #0x10
	adds r0, r4, #0
	movs r1, #0xb
	bl InitText
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08093B08: .4byte 0x02012AA0
_08093B0C: .4byte 0x02012B10
_08093B10: .4byte 0x02012B38

	thumb_func_start sub_8093B14
sub_8093B14: @ 0x08093B14
	push {lr}
	bl InitIcons
	bl ApplySystemObjectsGraphics
	movs r0, #4
	bl ApplyIconPalettes
	movs r0, #0xc0
	lsls r0, r0, #7
	movs r1, #0xf
	bl sub_808E404
	ldr r0, _08093B4C @ =gBg1Tm
	ldr r1, _08093B50 @ =gUnk_0841F9F4
	movs r2, #0xf3
	lsls r2, r2, #8
	bl TmApplyTsa_thm
	ldr r0, _08093B54 @ =gUnk_084292A0
	ldr r1, _08093B58 @ =0x06010800
	bl Decompress
	bl EnablePalSync
	pop {r0}
	bx r0
	.align 2, 0
_08093B4C: .4byte gBg1Tm
_08093B50: .4byte gUnk_0841F9F4
_08093B54: .4byte gUnk_084292A0
_08093B58: .4byte 0x06010800

	thumb_func_start sub_8093B5C
sub_8093B5C: @ 0x08093B5C
	push {r4, lr}
	sub sp, #8
	adds r4, r1, #0
	bl NewSysBlackBoxHandler
	adds r0, r4, #0
	bl SysBlackBoxSetGfx
	bl CheckInLinkArena
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08093B90
	movs r2, #0x90
	lsls r2, r2, #3
	movs r0, #4
	str r0, [sp]
	movs r0, #0xc0
	lsls r0, r0, #4
	str r0, [sp, #4]
	movs r0, #0
	movs r1, #4
	movs r3, #0xc
	bl EnableSysBlackBox
	b _08093BA8
_08093B90:
	movs r2, #0x91
	lsls r2, r2, #3
	movs r0, #3
	str r0, [sp]
	movs r0, #0xc0
	lsls r0, r0, #4
	str r0, [sp, #4]
	movs r0, #0
	movs r1, #4
	movs r3, #0xc
	bl EnableSysBlackBox
_08093BA8:
	movs r2, #0x90
	lsls r2, r2, #3
	movs r0, #4
	str r0, [sp]
	movs r0, #0xc0
	lsls r0, r0, #4
	str r0, [sp, #4]
	movs r0, #1
	movs r1, #0x6c
	movs r3, #0x10
	bl EnableSysBlackBox
	add sp, #8
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_8093BC8
sub_8093BC8: @ 0x08093BC8
	push {r4, lr}
	sub sp, #4
	adds r4, r0, #0
	bl ApplyUnitSpritePalettes
	movs r0, #0
	str r0, [sp]
	ldr r1, _08093BF8 @ =gPal + 0x360
	ldr r2, _08093BFC @ =0x01000008
	mov r0, sp
	bl CpuFastSet
	bl sub_808EC70
	ldr r0, [r4, #0x14]
	bl sub_808ED24
	bl sub_808ECDC
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08093BF8: .4byte gPal + 0x360
_08093BFC: .4byte 0x01000008

	thumb_func_start sub_8093C00
sub_8093C00: @ 0x08093C00
	push {r4, r5, r6, lr}
	mov r6, sb
	mov r5, r8
	push {r5, r6}
	sub sp, #8
	adds r5, r0, #0
	ldr r4, _08093CB8 @ =gBg0Tm + 0xca
	adds r0, r4, #0
	movs r1, #6
	movs r2, #1
	movs r3, #0
	bl TmFillRect_thm
	adds r0, r5, #0
	bl GetUnitPortraitId
	adds r1, r4, #0
	subs r1, #0x88
	movs r2, #0x9c
	lsls r2, r2, #2
	movs r3, #0
	mov sb, r3
	str r3, [sp]
	movs r3, #2
	bl PutFaceChibi
	ldr r0, _08093CBC @ =0x02012B38
	mov r8, r0
	bl ClearText
	ldr r0, [r5]
	ldrh r0, [r0]
	bl DecodeMsg
	adds r1, r0, #0
	movs r0, #0x38
	bl GetStringTextCenteredPos
	adds r6, r0, #0
	ldr r0, [r5]
	ldrh r0, [r0]
	bl DecodeMsg
	adds r1, r4, #0
	subs r1, #0x80
	mov r2, sb
	str r2, [sp]
	str r0, [sp, #4]
	mov r0, r8
	movs r2, #0
	adds r3, r6, #0
	bl PutDrawText
	adds r0, r4, #0
	movs r1, #3
	movs r2, #0x24
	bl PutSpecialChar
	adds r0, r4, #2
	movs r1, #3
	movs r2, #0x25
	bl PutSpecialChar
	adds r0, r4, #0
	adds r0, #8
	movs r1, #3
	movs r2, #0x1d
	bl PutSpecialChar
	adds r0, r4, #6
	movs r2, #8
	ldrsb r2, [r5, r2]
	movs r1, #2
	bl PutNumberOrBlank
	adds r4, #0xc
	ldrb r2, [r5, #9]
	adds r0, r4, #0
	movs r1, #2
	bl PutNumberOrBlank
	movs r0, #1
	bl EnableBgSync
	add sp, #8
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08093CB8: .4byte gBg0Tm + 0xca
_08093CBC: .4byte 0x02012B38

	thumb_func_start sub_8093CC0
sub_8093CC0: @ 0x08093CC0
	push {lr}
	ldrh r0, [r0, #0x2e]
	bl sub_808E644
	bl sub_8093C00
	pop {r0}
	bx r0

	thumb_func_start sub_8093CD0
sub_8093CD0: @ 0x08093CD0
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x10
	adds r7, r0, #0
	bl InitIcons
	ldr r4, _08093DBC @ =gBg0Tm + 0x142
	adds r0, r4, #0
	movs r1, #0xb
	movs r2, #0xa
	movs r3, #0
	bl TmFillRect_thm
	adds r0, r7, #0
	bl GetUnitItemCount
	str r0, [sp, #8]
	movs r0, #0
	mov r8, r0
	ldr r2, [sp, #8]
	cmp r8, r2
	bge _08093DA4
	movs r0, #0x14
	adds r0, r0, r4
	mov sl, r0
	mov sb, r4
	movs r2, #0xa0
	lsls r2, r2, #1
	str r2, [sp, #0xc]
_08093D10:
	mov r0, r8
	lsls r1, r0, #1
	adds r0, r7, #0
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r4, [r0]
	adds r0, r4, #0
	bl sub_8017808
	adds r1, r0, #0
	mov r0, sb
	movs r2, #0x80
	lsls r2, r2, #7
	bl PutIcon
	mov r2, r8
	lsls r1, r2, #3
	ldr r0, _08093DC0 @ =0x02012B10
	adds r5, r1, r0
	adds r0, r5, #0
	bl ClearText
	adds r0, r7, #0
	adds r1, r4, #0
	bl IsItemDisplayUsable
	movs r6, #0
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08093D4E
	movs r6, #1
_08093D4E:
	adds r0, r4, #0
	bl GetItemName
	ldr r1, _08093DC4 @ =gBg0Tm + 0x2
	adds r1, #4
	ldr r2, [sp, #0xc]
	adds r1, r2, r1
	movs r2, #0
	str r2, [sp]
	str r0, [sp, #4]
	adds r0, r5, #0
	adds r2, r6, #0
	movs r3, #0
	bl PutDrawText
	adds r0, r7, #0
	adds r1, r4, #0
	bl IsItemDisplayUsable
	lsls r0, r0, #0x18
	movs r5, #1
	cmp r0, #0
	beq _08093D7E
	movs r5, #2
_08093D7E:
	adds r0, r4, #0
	bl GetItemUses
	adds r2, r0, #0
	mov r0, sl
	adds r1, r5, #0
	bl PutNumberOrBlank
	movs r0, #0x80
	add sl, r0
	add sb, r0
	ldr r2, [sp, #0xc]
	adds r2, #0x80
	str r2, [sp, #0xc]
	movs r0, #1
	add r8, r0
	ldr r2, [sp, #8]
	cmp r8, r2
	blt _08093D10
_08093DA4:
	movs r0, #1
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
_08093DBC: .4byte gBg0Tm + 0x142
_08093DC0: .4byte 0x02012B10
_08093DC4: .4byte gBg0Tm + 0x2

	thumb_func_start sub_8093DC8
sub_8093DC8: @ 0x08093DC8
	push {r4, r5, r6, r7, lr}
	sub sp, #8
	adds r7, r0, #0
	lsls r1, r1, #0x18
	asrs r6, r1, #0x18
	cmp r6, #0
	bne _08093E04
	ldr r4, _08093E88 @ =0x02012B48
	adds r0, r4, #0
	bl ClearText
	ldr r5, _08093E8C @ =gBg0Tm + 0x5c
	str r6, [sp]
	ldr r0, _08093E90 @ =gUnk_0842CFC4
	str r0, [sp, #4]
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #0
	movs r3, #0
	bl PutDrawText
	str r6, [sp]
	ldr r0, _08093E94 @ =gUnk_0842CFCC
	str r0, [sp, #4]
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #0
	movs r3, #0x20
	bl PutDrawText
_08093E04:
	ldr r6, _08093E98 @ =gBg0Tm + 0x60
	adds r0, r6, #0
	movs r1, #1
	movs r2, #1
	movs r3, #0
	bl TmFillRect_thm
	adds r0, r6, #2
	adds r4, r7, #0
	adds r4, #0x29
	adds r5, r7, #0
	adds r5, #0x2a
	movs r1, #2
	ldrb r2, [r4]
	ldrb r3, [r5]
	cmp r2, r3
	bne _08093E28
	movs r1, #1
_08093E28:
	ldrb r7, [r5]
	ldrb r3, [r4]
	subs r2, r7, r3
	bl PutNumberOrBlank
	adds r0, r6, #0
	adds r0, #0x12
	movs r1, #4
	movs r2, #1
	movs r3, #0
	bl TmFillRect_thm
	adds r0, r6, #0
	adds r0, #0x14
	movs r1, #2
	ldrb r7, [r4]
	ldrb r2, [r5]
	cmp r7, r2
	bne _08093E50
	movs r1, #4
_08093E50:
	ldrb r2, [r4]
	bl PutNumberOrBlank
	adds r0, r6, #0
	adds r0, #0x16
	movs r1, #0
	movs r2, #0x16
	bl PutSpecialChar
	adds r0, r6, #0
	adds r0, #0x1a
	movs r1, #2
	ldrb r4, [r4]
	ldrb r3, [r5]
	cmp r4, r3
	bne _08093E72
	movs r1, #4
_08093E72:
	ldrb r2, [r5]
	bl PutNumberOrBlank
	movs r0, #1
	bl EnableBgSync
	add sp, #8
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08093E88: .4byte 0x02012B48
_08093E8C: .4byte gBg0Tm + 0x5c
_08093E90: .4byte gUnk_0842CFC4
_08093E94: .4byte gUnk_0842CFCC
_08093E98: .4byte gBg0Tm + 0x60

	thumb_func_start sub_8093E9C
sub_8093E9C: @ 0x08093E9C
	push {r4, lr}
	adds r4, r0, #0
	adds r2, r1, #0
	adds r1, r4, #0
	adds r1, #0x2a
	adds r3, r4, #0
	adds r3, #0x29
	ldrb r0, [r3]
	ldrb r1, [r1]
	cmp r1, r0
	bls _08093EF0
	adds r0, #1
	strb r0, [r3]
	ldr r0, [r2, #0xc]
	movs r1, #0xb
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r2, #0xc]
	ldr r0, [r2]
	ldrb r0, [r0, #4]
	bl sub_808E5DC
	ldr r0, _08093EE8 @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08093EDA
	ldr r0, _08093EEC @ =0x0000038A
	bl m4aSongNumStart
_08093EDA:
	ldrh r0, [r4, #0x2e]
	lsrs r1, r0, #1
	adds r0, r4, #0
	bl sub_809385C
	movs r0, #1
	b _08093F06
	.align 2, 0
_08093EE8: .4byte gPlaySt
_08093EEC: .4byte 0x0000038A
_08093EF0:
	ldr r0, _08093F0C @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08093F04
	movs r0, #0xe3
	lsls r0, r0, #2
	bl m4aSongNumStart
_08093F04:
	movs r0, #0
_08093F06:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08093F0C: .4byte gPlaySt

	thumb_func_start sub_8093F10
sub_8093F10: @ 0x08093F10
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	ldr r0, [r4]
	ldrb r0, [r0, #4]
	bl sub_808E6A4
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08093F68
	adds r1, r5, #0
	adds r1, #0x29
	ldrb r0, [r1]
	subs r0, #1
	strb r0, [r1]
	ldr r0, [r4, #0xc]
	movs r1, #0xa
	orrs r0, r1
	str r0, [r4, #0xc]
	ldr r0, [r4]
	ldrb r0, [r0, #4]
	bl sub_808E604
	ldr r0, _08093F60 @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08093F50
	ldr r0, _08093F64 @ =0x0000038B
	bl m4aSongNumStart
_08093F50:
	ldrh r0, [r5, #0x2e]
	lsrs r1, r0, #1
	adds r0, r5, #0
	bl sub_809385C
	movs r0, #1
	b _08093F7E
	.align 2, 0
_08093F60: .4byte gPlaySt
_08093F64: .4byte 0x0000038B
_08093F68:
	ldr r0, _08093F84 @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08093F7C
	movs r0, #0xe3
	lsls r0, r0, #2
	bl m4aSongNumStart
_08093F7C:
	movs r0, #0
_08093F7E:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_08093F84: .4byte gPlaySt

	thumb_func_start sub_8093F88
sub_8093F88: @ 0x08093F88
	push {r4, r5, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x2e]
	bl sub_808E644
	adds r5, r0, #0
	ldr r1, [r5, #0xc]
	movs r0, #0x80
	lsls r0, r0, #0x12
	ands r0, r1
	cmp r0, #0
	beq _08093FC8
	ldrh r1, [r4, #0x2e]
	movs r2, #1
	ands r2, r1
	lsls r0, r2, #3
	subs r0, r0, r2
	lsls r0, r0, #3
	adds r0, #0x70
	lsrs r1, r1, #1
	lsls r1, r1, #4
	ldrh r2, [r4, #0x30]
	subs r1, r1, r2
	adds r1, #0x18
	ldr r2, _08093FC4 @ =0x000003B6
_08093FBA:
	adds r3, r4, #0
	bl sub_8091664
	b _08094024
	.align 2, 0
_08093FC4: .4byte 0x000003B6
_08093FC8:
	movs r0, #8
	ands r1, r0
	cmp r1, #0
	beq _08094012
	bl CheckInLinkArena
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08094008
	adds r0, r5, #0
	bl sub_80916F4
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08094008
	ldrh r1, [r4, #0x2e]
	movs r2, #1
	ands r2, r1
	lsls r0, r2, #3
	subs r0, r0, r2
	lsls r0, r0, #3
	adds r0, #0x70
	lsrs r1, r1, #1
	lsls r1, r1, #4
	ldrh r2, [r4, #0x30]
	subs r1, r1, r2
	adds r1, #0x18
	ldr r2, _08094004 @ =0x000003B2
	b _08093FBA
	.align 2, 0
_08094004: .4byte 0x000003B2
_08094008:
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_8093E9C
	b _0809401A
_08094012:
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_8093F10
_0809401A:
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08094024
	movs r0, #1
	b _08094026
_08094024:
	movs r0, #0
_08094026:
	pop {r4, r5}
	pop {r1}
	bx r1

	thumb_func_start sub_809402C
sub_809402C: @ 0x0809402C
	push {r4, r5, r6, lr}
	sub sp, #8
	bl CheckInLinkArena
	lsls r0, r0, #0x18
	asrs r6, r0, #0x18
	cmp r6, #0
	bne _08094078
	ldr r0, _08094080 @ =gPlaySt
	ldrb r0, [r0, #0xe]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl GetChapterInfo
	adds r0, #0x8a
	ldrh r0, [r0]
	bl DecodeMsg
	adds r4, r0, #0
	ldr r5, _08094084 @ =0x02012B40
	adds r0, r5, #0
	bl ClearText
	movs r0, #0x50
	adds r1, r4, #0
	bl GetStringTextCenteredPos
	adds r3, r0, #0
	ldr r1, _08094088 @ =gBg0Tm + 0x402
	str r6, [sp]
	str r4, [sp, #4]
	adds r0, r5, #0
	movs r2, #0
	bl PutDrawText
	movs r0, #1
	bl EnableBgSync
_08094078:
	add sp, #8
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08094080: .4byte gPlaySt
_08094084: .4byte 0x02012B40
_08094088: .4byte gBg0Tm + 0x402

	thumb_func_start sub_809408C
sub_809408C: @ 0x0809408C
	push {r4, r5, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x30]
	lsrs r1, r0, #4
	cmp r1, #0
	ble _080940A0
	ldrh r2, [r4, #0x2e]
	lsrs r0, r2, #1
	cmp r0, r1
	ble _080940B6
_080940A0:
	adds r5, r1, #5
	bl sub_808E664
	subs r0, #1
	asrs r0, r0, #1
	cmp r5, r0
	bge _080940BA
	ldrh r4, [r4, #0x2e]
	lsrs r0, r4, #1
	cmp r0, r5
	blt _080940BA
_080940B6:
	movs r0, #1
	b _080940BC
_080940BA:
	movs r0, #0
_080940BC:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_80940C4
sub_80940C4: @ 0x080940C4
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	bl sub_809408C
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08094106
	ldrh r0, [r5, #0x2e]
	lsrs r4, r0, #1
	ldrh r0, [r5, #0x30]
	lsrs r6, r0, #4
	bl sub_808E664
	subs r0, #1
	asrs r1, r0, #1
	cmp r4, r6
	bgt _080940F8
	cmp r4, #0
	bne _080940EE
	strh r4, [r5, #0x30]
	b _080940F4
_080940EE:
	subs r0, r4, #1
	lsls r0, r0, #4
	strh r0, [r5, #0x30]
_080940F4:
	cmp r4, r6
	ble _08094106
_080940F8:
	cmp r4, r1
	bne _08094100
	subs r0, r4, #5
	b _08094102
_08094100:
	subs r0, r4, #4
_08094102:
	lsls r0, r0, #4
	strh r0, [r5, #0x30]
_08094106:
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	thumb_func_start sub_809410C
sub_809410C: @ 0x0809410C
	push {r4, r5, lr}
	movs r5, #0
	ldrh r0, [r0, #0x30]
	lsrs r4, r0, #4
	bl sub_808E664
	subs r0, #1
	asrs r1, r0, #1
	cmp r4, #0
	ble _08094122
	movs r5, #1
_08094122:
	adds r0, r4, #5
	cmp r0, r1
	bge _0809412C
	movs r0, #2
	orrs r5, r0
_0809412C:
	adds r0, r5, #0
	bl SetUiSpinningArrowConfig
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start sub_8094138
sub_8094138: @ 0x08094138
	push {r4, lr}
	adds r4, r0, #0
	bl sub_808EC70
	bl sub_808E684
	bl sub_808ECB0
	movs r1, #0
	strh r0, [r4, #0x2e]
	ldr r0, [r4, #0x14]
	adds r0, #0x2a
	ldrb r0, [r0]
	adds r2, r4, #0
	adds r2, #0x2a
	strb r0, [r2]
	ldr r0, [r4, #0x14]
	adds r0, #0x2b
	ldrb r0, [r0]
	subs r2, #1
	strb r0, [r2]
	ldr r0, [r4, #0x14]
	ldrh r0, [r0, #0x3c]
	strh r0, [r4, #0x30]
	ldrh r0, [r4, #0x2e]
	strh r0, [r4, #0x2c]
	adds r0, r4, #0
	adds r0, #0x37
	strb r1, [r0]
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_8094178
sub_8094178: @ 0x08094178
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r0, _08094350 @ =gUnk_08D8C0A0
	bl InitBgs
	ldr r4, _08094354 @ =gDispIo
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
	adds r0, r5, #0
	bl sub_80940C4
	ldr r0, _08094358 @ =gBg0Tm
	movs r1, #0
	bl TmFill
	ldr r0, _0809435C @ =gBg1Tm
	movs r1, #0
	bl TmFill
	ldr r0, _08094360 @ =gBg2Tm
	movs r1, #0
	bl TmFill
	movs r1, #4
	rsbs r1, r1, #0
	adds r0, r1, #0
	ldrb r2, [r4, #0xc]
	ands r0, r2
	movs r2, #2
	orrs r0, r2
	strb r0, [r4, #0xc]
	adds r0, r1, #0
	ldrb r3, [r4, #0x10]
	ands r0, r3
	orrs r0, r2
	strb r0, [r4, #0x10]
	ldrb r0, [r4, #0x14]
	ands r1, r0
	movs r0, #1
	orrs r1, r0
	strb r1, [r4, #0x14]
	movs r0, #3
	ldrb r1, [r4, #0x18]
	orrs r0, r1
	strb r0, [r4, #0x18]
	movs r0, #0
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	movs r0, #1
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	ldrh r2, [r5, #0x30]
	subs r2, #0x18
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	movs r0, #2
	movs r1, #0
	bl SetBgOffset
	movs r0, #3
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	bl sub_8093AB4
	bl sub_8093B14
	movs r1, #0x80
	lsls r1, r1, #7
	adds r0, r5, #0
	bl sub_8093B5C
	movs r0, #7
	bl EnableBgSync
	adds r2, r4, #0
	adds r2, #0x3c
	movs r0, #0x3f
	ldrb r3, [r2]
	ands r0, r3
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r2]
	adds r1, r4, #0
	adds r1, #0x44
	movs r3, #0
	movs r0, #0xe
	strb r0, [r1]
	adds r1, #1
	movs r0, #8
	strb r0, [r1]
	adds r0, r4, #0
	adds r0, #0x46
	strb r3, [r0]
	ldr r0, _08094364 @ =0x0000FFE0
	ldrh r1, [r4, #0x3c]
	ands r0, r1
	ldr r1, _08094368 @ =0x0000E0FF
	ands r0, r1
	movs r3, #0x80
	lsls r3, r3, #4
	adds r1, r3, #0
	orrs r0, r1
	strh r0, [r4, #0x3c]
	movs r1, #0x21
	rsbs r1, r1, #0
	adds r0, r1, #0
	ldrb r3, [r2]
	ands r0, r3
	strb r0, [r2]
	adds r0, r4, #0
	adds r0, #0x3d
	ldrb r2, [r0]
	ands r1, r2
	strb r1, [r0]
	adds r0, r5, #0
	bl sub_8093BC8
	ldr r0, _0809436C @ =sub_8093948
	adds r1, r5, #0
	bl StartParallelWorker
	adds r0, r5, #0
	bl ResetSysHandCursor
	movs r0, #0xc0
	lsls r0, r0, #3
	movs r1, #1
	bl DisplaySysHandCursorTextShadow
	ldrh r1, [r5, #0x2e]
	movs r2, #1
	ands r2, r1
	lsls r0, r2, #3
	subs r0, r0, r2
	lsls r0, r0, #3
	adds r0, #0x70
	lsrs r1, r1, #1
	lsls r1, r1, #4
	ldrh r2, [r5, #0x30]
	subs r2, #0x18
	subs r1, r1, r2
	movs r3, #0x80
	lsls r3, r3, #4
	movs r2, #7
	bl ShowSysHandCursor
	adds r0, r5, #0
	bl sub_8090DD0
	movs r0, #0xe2
	movs r1, #0x20
	bl sub_8090DE4
	ldrh r4, [r5, #0x30]
	bl sub_808E664
	adds r2, r0, #0
	subs r2, #1
	lsrs r0, r2, #0x1f
	adds r2, r2, r0
	asrs r2, r2, #1
	adds r2, #1
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	movs r0, #0xa
	adds r1, r4, #0
	movs r3, #6
	bl sub_8090E04
	movs r0, #0x80
	lsls r0, r0, #2
	movs r1, #2
	bl sub_8090E38
	movs r0, #0x20
	movs r1, #0x8c
	adds r2, r5, #0
	bl StartHelpPromptSprite
	ldrh r0, [r5, #0x2e]
	bl sub_808E644
	bl sub_8093CD0
	ldrh r0, [r5, #0x2e]
	bl sub_808E644
	bl sub_8093C00
	bl sub_809402C
	movs r4, #0
_0809431C:
	ldrh r3, [r5, #0x30]
	lsrs r1, r3, #4
	adds r1, r1, r4
	adds r0, r5, #0
	bl sub_809385C
	adds r4, #1
	cmp r4, #5
	ble _0809431C
	adds r0, r5, #0
	movs r1, #0
	bl sub_8093DC8
	adds r0, r5, #0
	bl StartGreenText
	ldr r0, _08094370 @ =0x06015000
	movs r1, #5
	bl LoadHelpBoxGfx
	bl sub_808ED8C
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08094350: .4byte gUnk_08D8C0A0
_08094354: .4byte gDispIo
_08094358: .4byte gBg0Tm
_0809435C: .4byte gBg1Tm
_08094360: .4byte gBg2Tm
_08094364: .4byte 0x0000FFE0
_08094368: .4byte 0x0000E0FF
_0809436C: .4byte sub_8093948
_08094370: .4byte 0x06015000

	thumb_func_start sub_8094374
sub_8094374: @ 0x08094374
	push {lr}
	bl sub_8090DBC
	bl EndAllParallelWorkers
	bl EndSysBlackBoxs
	bl EndSysHandCursor
	bl EndHelpPromptSprite
	bl sub_80A9CE4
	bl EndMuralBackground_
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_8094398
sub_8094398: @ 0x08094398
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	ldrh r0, [r5, #0x2c]
	ldrh r1, [r5, #0x2e]
	cmp r0, r1
	beq _080943A6
	b _080945BA
_080943A6:
	ldr r3, _080943F4 @ =gpKeySt
	ldr r1, [r3]
	ldrh r6, [r1, #6]
	adds r2, r5, #0
	adds r2, #0x36
	movs r4, #4
	strb r4, [r2]
	movs r0, #0x80
	lsls r0, r0, #2
	ldrh r7, [r1, #4]
	ands r0, r7
	cmp r0, #0
	beq _080943C6
	ldrh r6, [r1, #4]
	movs r0, #8
	strb r0, [r2]
_080943C6:
	ldr r0, [r3]
	ldrh r1, [r0, #8]
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	beq _08094420
	adds r0, r5, #0
	adds r0, #0x29
	ldrb r0, [r0]
	cmp r0, #0
	bne _080943FC
	ldr r0, _080943F8 @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	bge _080943EA
	b _08094634
_080943EA:
	movs r0, #0xe3
	lsls r0, r0, #2
	bl m4aSongNumStart
	b _08094634
	.align 2, 0
_080943F4: .4byte gpKeySt
_080943F8: .4byte gPlaySt
_080943FC:
	ldr r0, _08094418 @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0809440E
	ldr r0, _0809441C @ =0x0000038A
	bl m4aSongNumStart
_0809440E:
	adds r0, r5, #0
	movs r1, #0x63
	bl Proc_Goto
	b _08094634
	.align 2, 0
_08094418: .4byte gPlaySt
_0809441C: .4byte 0x0000038A
_08094420:
	adds r0, r4, #0
	ands r0, r1
	cmp r0, #0
	beq _0809444C
	ldr r0, _08094444 @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0809443A
	ldr r0, _08094448 @ =0x0000038A
	bl m4aSongNumStart
_0809443A:
	adds r0, r5, #0
	movs r1, #3
	bl Proc_Goto
	b _08094634
	.align 2, 0
_08094444: .4byte gPlaySt
_08094448: .4byte 0x0000038A
_0809444C:
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r1
	cmp r0, #0
	beq _08094460
	adds r0, r5, #0
	movs r1, #4
	bl Proc_Goto
	b _08094634
_08094460:
	movs r2, #1
	adds r0, r2, #0
	ands r0, r1
	cmp r0, #0
	beq _08094482
	adds r0, r5, #0
	bl sub_8093F88
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08094478
	b _08094634
_08094478:
	adds r0, r5, #0
	movs r1, #1
	bl sub_8093DC8
	b _08094634
_08094482:
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _080944B0
	ldr r0, _080944A8 @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0809449C
	ldr r0, _080944AC @ =0x0000038B
	bl m4aSongNumStart
_0809449C:
	adds r0, r5, #0
	movs r1, #0xa
	bl Proc_Goto
	b _08094634
	.align 2, 0
_080944A8: .4byte gPlaySt
_080944AC: .4byte 0x0000038B
_080944B0:
	movs r0, #0x20
	ands r0, r6
	cmp r0, #0
	beq _080944C6
	ldrh r1, [r5, #0x2e]
	adds r0, r2, #0
	ands r0, r1
	cmp r0, #0
	beq _080944C6
	subs r0, r1, #1
	strh r0, [r5, #0x2e]
_080944C6:
	movs r0, #0x10
	ands r0, r6
	cmp r0, #0
	beq _080944EA
	movs r0, #1
	ldrh r1, [r5, #0x2e]
	ands r0, r1
	cmp r0, #0
	bne _080944EA
	ldrh r4, [r5, #0x2e]
	bl sub_808E664
	subs r0, #1
	cmp r4, r0
	bge _080944EA
	ldrh r0, [r5, #0x2e]
	adds r0, #1
	strh r0, [r5, #0x2e]
_080944EA:
	movs r0, #0x40
	ands r0, r6
	cmp r0, #0
	beq _080944FC
	ldrh r0, [r5, #0x2e]
	subs r0, #2
	cmp r0, #0
	blt _080944FC
	strh r0, [r5, #0x2e]
_080944FC:
	movs r0, #0x80
	ands r6, r0
	cmp r6, #0
	beq _08094518
	ldrh r4, [r5, #0x2e]
	adds r4, #2
	bl sub_808E664
	subs r0, #1
	cmp r4, r0
	bgt _08094518
	ldrh r0, [r5, #0x2e]
	adds r0, #2
	strh r0, [r5, #0x2e]
_08094518:
	ldrh r3, [r5, #0x2c]
	ldrh r7, [r5, #0x2e]
	cmp r3, r7
	bne _08094522
	b _08094634
_08094522:
	ldrh r0, [r5, #0x2e]
	bl sub_808E644
	bl sub_8093CD0
	ldr r0, _08094580 @ =sub_8093CC0
	movs r1, #1
	adds r2, r5, #0
	bl StartParallelFiniteLoop
	ldr r0, _08094584 @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08094548
	ldr r0, _08094588 @ =0x00000385
	bl m4aSongNumStart
_08094548:
	adds r0, r5, #0
	bl sub_809408C
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0809458C
	ldrh r0, [r5, #0x2e]
	ldrh r1, [r5, #0x2c]
	cmp r0, r1
	bhs _08094568
	ldrh r3, [r5, #0x30]
	lsrs r1, r3, #4
	subs r1, #1
	adds r0, r5, #0
	bl sub_809385C
_08094568:
	ldrh r7, [r5, #0x2e]
	ldrh r0, [r5, #0x2c]
	cmp r7, r0
	bls _080945B2
	ldrh r3, [r5, #0x30]
	lsrs r1, r3, #4
	adds r1, #6
	adds r0, r5, #0
	bl sub_809385C
	b _080945B2
	.align 2, 0
_08094580: .4byte sub_8093CC0
_08094584: .4byte gPlaySt
_08094588: .4byte 0x00000385
_0809458C:
	ldrh r1, [r5, #0x2e]
	strh r1, [r5, #0x2c]
	movs r2, #1
	ands r2, r1
	lsls r0, r2, #3
	subs r0, r0, r2
	lsls r0, r0, #3
	adds r0, #0x70
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x11
	lsls r1, r1, #4
	ldrh r2, [r5, #0x30]
	subs r2, #0x18
	subs r1, r1, r2
	movs r3, #0x80
	lsls r3, r3, #4
	movs r2, #7
	bl ShowSysHandCursor
_080945B2:
	ldrh r7, [r5, #0x2c]
	ldrh r0, [r5, #0x2e]
	cmp r7, r0
	beq _08094634
_080945BA:
	ldrh r2, [r5, #0x2e]
	ldrh r1, [r5, #0x2c]
	cmp r2, r1
	bhs _080945CE
	adds r0, r5, #0
	adds r0, #0x36
	ldrh r3, [r5, #0x30]
	ldrb r0, [r0]
	subs r0, r3, r0
	strh r0, [r5, #0x30]
_080945CE:
	cmp r2, r1
	bls _080945DE
	adds r0, r5, #0
	adds r0, #0x36
	ldrh r7, [r5, #0x30]
	ldrb r0, [r0]
	adds r0, r7, r0
	strh r0, [r5, #0x30]
_080945DE:
	ldrh r1, [r5, #0x30]
	movs r0, #0xf
	ands r0, r1
	cmp r0, #0
	bne _08094604
	lsrs r0, r1, #4
	subs r0, #1
	bl sub_8093920
	ldrh r1, [r5, #0x30]
	lsrs r0, r1, #4
	adds r0, #6
	bl sub_8093920
	adds r0, r5, #0
	bl sub_809410C
	ldrh r0, [r5, #0x2e]
	strh r0, [r5, #0x2c]
_08094604:
	ldrh r2, [r5, #0x30]
	subs r2, #0x18
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	movs r0, #2
	movs r1, #0
	bl SetBgOffset
	ldrh r4, [r5, #0x30]
	bl sub_808E664
	adds r2, r0, #0
	subs r2, #1
	lsrs r0, r2, #0x1f
	adds r2, r2, r0
	asrs r2, r2, #1
	adds r2, #1
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	movs r0, #0xa
	adds r1, r4, #0
	movs r3, #6
	bl sub_8090E04
_08094634:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_809463C
sub_809463C: @ 0x0809463C
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x34]
	adds r0, #4
	strh r0, [r4, #0x34]
	ldrh r1, [r4, #0x30]
	adds r1, #4
	strh r1, [r4, #0x30]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0x20
	bne _0809465A
	adds r0, r4, #0
	bl Proc_Break
_0809465A:
	ldrh r2, [r4, #0x30]
	subs r2, #0x18
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	movs r0, #2
	movs r1, #0
	bl SetBgOffset
	ldrh r1, [r4, #0x30]
	movs r0, #0xf
	ands r0, r1
	cmp r0, #0
	bne _0809467C
	lsrs r0, r1, #4
	subs r0, #1
	bl sub_8093920
_0809467C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_8094684
sub_8094684: @ 0x08094684
	push {r4, lr}
	adds r4, r0, #0
	ldrh r1, [r4, #0x30]
	movs r0, #0xf
	ands r0, r1
	cmp r0, #0
	bne _0809469C
	lsrs r1, r1, #4
	subs r1, #1
	adds r0, r4, #0
	bl sub_809385C
_0809469C:
	ldrh r0, [r4, #0x34]
	subs r0, #4
	strh r0, [r4, #0x34]
	ldrh r1, [r4, #0x30]
	subs r1, #4
	strh r1, [r4, #0x30]
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _080946B4
	adds r0, r4, #0
	bl Proc_Break
_080946B4:
	ldrh r2, [r4, #0x30]
	subs r2, #0x18
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	movs r0, #2
	movs r1, #0
	bl SetBgOffset
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start nullsub_11
nullsub_11: @ 0x080946CC
	bx lr
	.align 2, 0

	thumb_func_start sub_80946D0
sub_80946D0: @ 0x080946D0
	push {lr}
	bl nullsub_11
	movs r3, #0x80
	lsls r3, r3, #4
	movs r0, #0xd0
	movs r1, #0x68
	movs r2, #0
	bl ShowSysHandCursor
	pop {r0}
	bx r0

	thumb_func_start sub_80946E8
sub_80946E8: @ 0x080946E8
	push {lr}
	adds r3, r0, #0
	ldrh r1, [r3, #0x2e]
	movs r2, #1
	ands r2, r1
	lsls r0, r2, #3
	subs r0, r0, r2
	lsls r0, r0, #3
	adds r0, #0x70
	lsrs r1, r1, #1
	lsls r1, r1, #4
	ldrh r2, [r3, #0x30]
	subs r2, #0x18
	subs r1, r1, r2
	movs r3, #0x80
	lsls r3, r3, #4
	movs r2, #7
	bl ShowSysHandCursor
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_8094714
sub_8094714: @ 0x08094714
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08094768 @ =gpKeySt
	ldr r1, [r0]
	movs r0, #1
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _0809473A
	ldr r0, _0809476C @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0809473A
	movs r0, #0xe3
	lsls r0, r0, #2
	bl m4aSongNumStart
_0809473A:
	ldr r0, _08094768 @ =gpKeySt
	ldr r1, [r0]
	movs r0, #0x40
	ldrh r1, [r1, #6]
	ands r0, r1
	cmp r0, #0
	beq _08094760
	ldr r0, _0809476C @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0809475A
	ldr r0, _08094770 @ =0x00000385
	bl m4aSongNumStart
_0809475A:
	adds r0, r4, #0
	bl Proc_Break
_08094760:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08094768: .4byte gpKeySt
_0809476C: .4byte gPlaySt
_08094770: .4byte 0x00000385

	thumb_func_start sub_8094774
sub_8094774: @ 0x08094774
	push {lr}
	ldr r2, [r0, #0x14]
	ldrh r1, [r0, #0x30]
	strh r1, [r2, #0x3c]
	ldr r1, [r0, #0x14]
	adds r2, r0, #0
	adds r2, #0x29
	ldrb r2, [r2]
	adds r1, #0x2b
	strb r2, [r1]
	ldrh r0, [r0, #0x2e]
	bl sub_808E644
	ldr r0, [r0]
	ldrb r0, [r0, #4]
	bl sub_808E694
	bl EndMuralBackground_
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_80947A0
sub_80947A0: @ 0x080947A0
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x14]
	adds r0, #0x36
	movs r5, #1
	strb r5, [r0]
	ldr r0, [r4, #0x14]
	movs r1, #6
	bl Proc_Goto
	adds r4, #0x37
	strb r5, [r4]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_80947C0
sub_80947C0: @ 0x080947C0
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x2e]
	bl sub_808E644
	ldr r0, [r0]
	ldrb r0, [r0, #4]
	bl sub_808E694
	adds r0, r4, #0
	bl sub_808B468
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_80947E0
sub_80947E0: @ 0x080947E0
	push {r4, r5, lr}
	adds r4, r0, #0
	bl sub_808EA54
	movs r1, #0
	strh r0, [r4, #0x2c]
	strh r0, [r4, #0x2e]
	adds r4, #0x29
	strb r1, [r4]
	movs r5, #1
_080947F4:
	adds r0, r5, #0
	bl GetUnit
	adds r1, r0, #0
	cmp r1, #0
	beq _08094816
	ldr r0, [r1]
	cmp r0, #0
	beq _08094816
	ldr r0, [r1, #0xc]
	ldr r1, _08094824 @ =0x0001000C
	ands r0, r1
	cmp r0, #0
	bne _08094816
	ldrb r0, [r4]
	adds r0, #1
	strb r0, [r4]
_08094816:
	adds r5, #1
	cmp r5, #0x3f
	ble _080947F4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08094824: .4byte 0x0001000C

	thumb_func_start sub_8094828
sub_8094828: @ 0x08094828
	ldr r2, _08094848 @ =gDispIo
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
	bx lr
	.align 2, 0
_08094848: .4byte gDispIo

	thumb_func_start sub_809484C
sub_809484C: @ 0x0809484C
	ldr r2, _08094868 @ =gDispIo
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
_08094868: .4byte gDispIo

	thumb_func_start sub_809486C
sub_809486C: @ 0x0809486C
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0x11
	bl SetStatScreenExcludedUnitFlags
	ldrh r0, [r4, #0x2e]
	bl sub_808E644
	adds r1, r4, #0
	bl StartStatScreen
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_8094888
sub_8094888: @ 0x08094888
	push {r4, lr}
	adds r4, r0, #0
	bl sub_808EC70
	bl sub_808EA20
	strh r0, [r4, #0x2c]
	strh r0, [r4, #0x2e]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_80948A0
sub_80948A0: @ 0x080948A0
	push {r4, r5, r6, lr}
	adds r6, r2, #0
	lsls r1, r1, #1
	adds r4, r0, #0
	adds r4, #0x1e
	adds r4, r4, r1
	ldrh r5, [r4]
	lsls r3, r3, #1
	adds r1, r6, #0
	adds r1, #0x1e
	adds r1, r1, r3
	ldrh r2, [r1]
	strh r2, [r4]
	strh r5, [r1]
	bl UnitRemoveInvalidItems
	adds r0, r6, #0
	bl UnitRemoveInvalidItems
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	thumb_func_start sub_80948CC
sub_80948CC: @ 0x080948CC
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08094930 @ =gpKeySt
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	beq _08094954
	ldr r0, [r4, #0x34]
	movs r1, #8
	ands r0, r1
	cmp r0, #0
	bne _080948EA
	b _08094AB8
_080948EA:
	ldr r0, [r4, #0x2c]
	bl GetUnitItemCount
	adds r2, r0, #0
	ldr r3, [r4, #0x38]
	cmp r3, #0xff
	beq _08094918
	ldr r0, [r4, #0x3c]
	cmp r0, #0xff
	bne _08094918
	ldr r0, [r4, #0x34]
	adds r0, #8
	asrs r0, r0, #3
	movs r1, #1
	ands r0, r1
	asrs r1, r3, #3
	cmp r0, r1
	beq _08094918
	movs r0, #5
	cmp r2, #5
	beq _08094916
	adds r0, r2, #1
_08094916:
	adds r2, r0, #0
_08094918:
	cmp r2, #0
	bgt _0809491E
	b _08094AB8
_0809491E:
	ldr r1, [r4, #0x34]
	movs r0, #7
	ands r0, r1
	cmp r2, r0
	ble _08094934
	adds r0, r1, #0
	subs r0, #8
	b _08094936
	.align 2, 0
_08094930: .4byte gpKeySt
_08094934:
	subs r0, r2, #1
_08094936:
	str r0, [r4, #0x34]
	ldr r0, _0809494C @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	bge _08094946
	b _08094AA8
_08094946:
	ldr r0, _08094950 @ =0x00000387
	b _08094AA4
	.align 2, 0
_0809494C: .4byte gPlaySt
_08094950: .4byte 0x00000387
_08094954:
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	beq _080949C8
	ldr r0, [r4, #0x34]
	movs r1, #8
	ands r0, r1
	cmp r0, #0
	beq _08094968
	b _08094AB8
_08094968:
	ldr r0, [r4, #0x30]
	bl GetUnitItemCount
	adds r2, r0, #0
	ldr r3, [r4, #0x38]
	cmp r3, #0xff
	beq _08094996
	ldr r0, [r4, #0x3c]
	cmp r0, #0xff
	bne _08094996
	ldr r0, [r4, #0x34]
	adds r0, #8
	asrs r0, r0, #3
	movs r1, #1
	ands r0, r1
	asrs r1, r3, #3
	cmp r0, r1
	beq _08094996
	movs r0, #5
	cmp r2, #5
	beq _08094994
	adds r0, r2, #1
_08094994:
	adds r2, r0, #0
_08094996:
	cmp r2, #0
	bgt _0809499C
	b _08094AB8
_0809499C:
	ldr r1, [r4, #0x34]
	movs r0, #7
	ands r0, r1
	cmp r2, r0
	ble _080949AC
	adds r0, r1, #0
	adds r0, #8
	b _080949AE
_080949AC:
	adds r0, r2, #7
_080949AE:
	str r0, [r4, #0x34]
	ldr r0, _080949C0 @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08094AA8
	ldr r0, _080949C4 @ =0x00000387
	b _08094AA4
	.align 2, 0
_080949C0: .4byte gPlaySt
_080949C4: .4byte 0x00000387
_080949C8:
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _08094A34
	ldr r0, [r4, #0x34]
	asrs r0, r0, #3
	lsls r0, r0, #2
	adds r1, r4, #0
	adds r1, #0x2c
	adds r1, r1, r0
	ldr r0, [r1]
	bl GetUnitItemCount
	adds r3, r0, #0
	ldr r1, [r4, #0x38]
	cmp r1, #0xff
	beq _08094A04
	ldr r0, [r4, #0x3c]
	cmp r0, #0xff
	bne _08094A04
	ldr r0, [r4, #0x34]
	asrs r0, r0, #3
	asrs r1, r1, #3
	cmp r0, r1
	beq _08094A04
	movs r0, #5
	cmp r3, #5
	beq _08094A02
	adds r0, r3, #1
_08094A02:
	adds r3, r0, #0
_08094A04:
	ldr r2, [r4, #0x34]
	movs r0, #7
	ands r0, r2
	cmp r0, #0
	ble _08094A14
	subs r0, r2, #1
	str r0, [r4, #0x34]
	b _08094A96
_08094A14:
	ldr r0, _08094A30 @ =gpKeySt
	ldr r1, [r0]
	movs r0, #0x40
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _08094AB8
	movs r0, #8
	ands r2, r0
	adds r0, r2, r3
	subs r0, #1
	str r0, [r4, #0x34]
	b _08094A96
	.align 2, 0
_08094A30: .4byte gpKeySt
_08094A34:
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _08094AB8
	ldr r0, [r4, #0x34]
	asrs r0, r0, #3
	lsls r0, r0, #2
	adds r1, r4, #0
	adds r1, #0x2c
	adds r1, r1, r0
	ldr r0, [r1]
	bl GetUnitItemCount
	adds r3, r0, #0
	ldr r1, [r4, #0x38]
	cmp r1, #0xff
	beq _08094A70
	ldr r0, [r4, #0x3c]
	cmp r0, #0xff
	bne _08094A70
	ldr r0, [r4, #0x34]
	asrs r0, r0, #3
	asrs r1, r1, #3
	cmp r0, r1
	beq _08094A70
	movs r0, #5
	cmp r3, #5
	beq _08094A6E
	adds r0, r3, #1
_08094A6E:
	adds r3, r0, #0
_08094A70:
	ldr r2, [r4, #0x34]
	movs r0, #7
	ands r0, r2
	subs r1, r3, #1
	cmp r0, r1
	bge _08094A82
	adds r0, r2, #1
	str r0, [r4, #0x34]
	b _08094A96
_08094A82:
	ldr r0, _08094AAC @ =gpKeySt
	ldr r1, [r0]
	movs r0, #0x80
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _08094AB8
	movs r0, #8
	ands r2, r0
	str r2, [r4, #0x34]
_08094A96:
	ldr r0, _08094AB0 @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08094AA8
	ldr r0, _08094AB4 @ =0x00000386
_08094AA4:
	bl m4aSongNumStart
_08094AA8:
	movs r0, #1
	b _08094ABA
	.align 2, 0
_08094AAC: .4byte gpKeySt
_08094AB0: .4byte gPlaySt
_08094AB4: .4byte 0x00000386
_08094AB8:
	movs r0, #0
_08094ABA:
	pop {r4}
	pop {r1}
	bx r1

	thumb_func_start sub_8094AC0
sub_8094AC0: @ 0x08094AC0
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x18
	adds r4, r0, #0
	mov sb, r1
	mov sl, r2
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	str r3, [sp, #8]
	movs r1, #0xb
	movs r2, #9
	movs r3, #0
	bl TmFillRect_thm
	mov r0, sl
	bl GetUnitItemCount
	str r0, [sp, #0x10]
	movs r0, #0
	str r0, [sp, #0xc]
	ldr r1, [sp, #0x10]
	cmp r0, r1
	bge _08094B94
	adds r0, r4, #4
	str r0, [sp, #0x14]
	mov r8, r4
_08094AFA:
	ldr r0, [sp, #0xc]
	lsls r1, r0, #1
	mov r0, sl
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r6, [r0]
	ldr r1, [sp, #8]
	cmp r1, #0
	beq _08094B16
	mov r0, sl
	adds r1, r6, #0
	bl sub_80284C8
	b _08094B1E
_08094B16:
	mov r0, sl
	adds r1, r6, #0
	bl IsItemDisplayUsable
_08094B1E:
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	mov r0, sb
	bl ClearText
	adds r0, r6, #0
	bl GetItemName
	adds r1, r0, #0
	movs r2, #0
	lsls r0, r4, #0x18
	asrs r5, r0, #0x18
	cmp r5, #0
	bne _08094B3C
	movs r2, #1
_08094B3C:
	movs r0, #0
	str r0, [sp]
	str r1, [sp, #4]
	mov r0, sb
	ldr r1, [sp, #0x14]
	movs r3, #0
	bl PutDrawText
	mov r4, r8
	adds r4, #0x16
	movs r7, #1
	cmp r5, #0
	beq _08094B58
	movs r7, #2
_08094B58:
	adds r0, r6, #0
	bl GetItemUses
	adds r2, r0, #0
	adds r0, r4, #0
	adds r1, r7, #0
	bl PutNumberOrBlank
	adds r0, r6, #0
	bl sub_8017808
	adds r1, r0, #0
	mov r0, r8
	movs r2, #0x80
	lsls r2, r2, #7
	bl PutIcon
	movs r0, #8
	add sb, r0
	ldr r1, [sp, #0x14]
	adds r1, #0x80
	str r1, [sp, #0x14]
	movs r0, #0x80
	add r8, r0
	ldr r1, [sp, #0xc]
	adds r1, #1
	str r1, [sp, #0xc]
	ldr r0, [sp, #0x10]
	cmp r1, r0
	blt _08094AFA
_08094B94:
	add sp, #0x18
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_8094BA4
sub_8094BA4: @ 0x08094BA4
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	adds r7, r1, #0
	adds r0, r7, #0
	bl GetUnitItemCount
	adds r6, r0, #0
	movs r5, #0
	cmp r5, r6
	bge _08094BDA
_08094BB8:
	lsls r1, r5, #1
	adds r0, r7, #0
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r0, [r0]
	bl sub_8017808
	adds r1, r0, #0
	adds r0, r4, #0
	movs r2, #0x80
	lsls r2, r2, #7
	bl PutIcon
	adds r4, #0x80
	adds r5, #1
	cmp r5, r6
	blt _08094BB8
_08094BDA:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_8094BE0
sub_8094BE0: @ 0x08094BE0
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #0x28
	mov r8, r0
	add r1, sp, #8
	ldr r0, _08094CD8 @ =gUnk_0842CFDC
	ldm r0!, {r2, r3, r4}
	stm r1!, {r2, r3, r4}
	ldm r0!, {r2, r3, r4}
	stm r1!, {r2, r3, r4}
	ldm r0!, {r2, r3}
	stm r1!, {r2, r3}
	ldr r0, _08094CDC @ =gUnk_08D8C0A0
	ldrh r0, [r0]
	bl InitBgs
	add r0, sp, #8
	bl SetFaceConfig
	ldr r3, _08094CE0 @ =gDispIo
	movs r2, #4
	rsbs r2, r2, #0
	adds r0, r2, #0
	ldrb r4, [r3, #0xc]
	ands r0, r4
	movs r1, #1
	orrs r0, r1
	strb r0, [r3, #0xc]
	adds r0, r2, #0
	ldrb r1, [r3, #0x10]
	ands r0, r1
	movs r1, #2
	orrs r0, r1
	strb r0, [r3, #0x10]
	ldrb r4, [r3, #0x14]
	ands r2, r4
	strb r2, [r3, #0x14]
	movs r0, #3
	ldrb r1, [r3, #0x18]
	orrs r0, r1
	strb r0, [r3, #0x18]
	movs r0, #0
	bl GetBgTilemap
	movs r1, #0
	bl TmFill
	movs r0, #1
	bl GetBgTilemap
	movs r1, #0
	bl TmFill
	movs r0, #2
	bl GetBgTilemap
	movs r1, #0
	bl TmFill
	bl ResetText
	bl InitIcons
	bl UnpackUiWindowFrameGraphics
	bl ApplySystemObjectsGraphics
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
	ldr r0, _08094CE4 @ =0x06014000
	movs r1, #1
	rsbs r1, r1, #0
	bl LoadHelpBoxGfx
	movs r0, #4
	bl ApplyIconPalettes
	bl sub_808ED8C
	ldr r0, _08094CE8 @ =0x02012A20
	adds r6, r0, #0
	adds r6, #0x28
	adds r5, r0, #0
	movs r4, #4
_08094CA6:
	adds r0, r5, #0
	movs r1, #7
	bl sub_800536C
	adds r0, r6, #0
	movs r1, #7
	bl sub_800536C
	adds r6, #8
	adds r5, #8
	subs r4, #1
	cmp r4, #0
	bge _08094CA6
	movs r0, #0xff
	mov r2, r8
	str r0, [r2, #0x38]
	ldr r1, [r2, #0x40]
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	beq _08094CEC
	adds r0, r1, #0
	adds r0, #8
	str r0, [r2, #0x34]
	b _08094D06
	.align 2, 0
_08094CD8: .4byte gUnk_0842CFDC
_08094CDC: .4byte gUnk_08D8C0A0
_08094CE0: .4byte gDispIo
_08094CE4: .4byte 0x06014000
_08094CE8: .4byte 0x02012A20
_08094CEC:
	mov r3, r8
	ldr r0, [r3, #0x2c]
	bl GetUnitItemCount
	cmp r0, #0
	bne _08094D00
	movs r0, #8
	mov r4, r8
	str r0, [r4, #0x34]
	b _08094D06
_08094D00:
	movs r0, #0
	mov r1, r8
	str r0, [r1, #0x34]
_08094D06:
	movs r0, #0xff
	mov r2, r8
	str r0, [r2, #0x3c]
	ldr r0, [r2, #0x2c]
	bl GetUnitPortraitId
	adds r1, r0, #0
	movs r4, #4
	rsbs r4, r4, #0
	ldr r0, _08094EA4 @ =0x00000203
	str r0, [sp]
	movs r0, #0
	movs r2, #0x40
	adds r3, r4, #0
	bl StartBmFace
	mov r3, r8
	ldr r0, [r3, #0x30]
	bl GetUnitPortraitId
	adds r1, r0, #0
	ldr r0, _08094EA8 @ =0x00000202
	str r0, [sp]
	movs r0, #1
	movs r2, #0xae
	adds r3, r4, #0
	bl StartBmFace
	movs r6, #0
	str r6, [sp]
	movs r0, #1
	movs r1, #8
	movs r2, #0xe
	movs r3, #0xc
	bl sub_804A4CC
	str r6, [sp]
	movs r0, #0xf
	movs r1, #8
	movs r2, #0xe
	movs r3, #0xc
	bl sub_804A4CC
	movs r0, #7
	bl EnableBgSync
	mov r4, r8
	ldr r0, [r4, #0x2c]
	ldr r0, [r0]
	ldrh r0, [r0]
	bl DecodeMsg
	adds r7, r0, #0
	bl GetStringTextLen
	adds r3, r0, #0
	movs r4, #0x30
	subs r3, r4, r3
	lsrs r0, r3, #0x1f
	adds r3, r3, r0
	asrs r3, r3, #1
	ldr r0, _08094EAC @ =gBg0Tm
	mov sb, r0
	movs r5, #6
	str r5, [sp]
	str r7, [sp, #4]
	movs r0, #0
	mov r1, sb
	movs r2, #0
	bl PutDrawText
	mov r1, r8
	ldr r0, [r1, #0x30]
	ldr r0, [r0]
	ldrh r0, [r0]
	bl DecodeMsg
	adds r7, r0, #0
	bl GetStringTextLen
	subs r4, r4, r0
	lsrs r0, r4, #0x1f
	adds r4, r4, r0
	asrs r4, r4, #1
	mov r1, sb
	adds r1, #0x30
	str r5, [sp]
	str r7, [sp, #4]
	movs r0, #0
	movs r2, #0
	adds r3, r4, #0
	bl PutDrawText
	movs r0, #0x91
	lsls r0, r0, #2
	add r0, sb
	ldr r4, _08094EB0 @ =0x02012A20
	mov r3, r8
	ldr r2, [r3, #0x2c]
	adds r1, r4, #0
	movs r3, #0
	bl sub_8094AC0
	movs r0, #0x98
	lsls r0, r0, #2
	add r0, sb
	adds r4, #0x28
	mov r1, r8
	ldr r2, [r1, #0x30]
	adds r1, r4, #0
	movs r3, #0
	bl sub_8094AC0
	mov r0, r8
	bl sub_80A98C8
	mov r0, r8
	bl ResetSysHandCursor
	movs r0, #0xc0
	lsls r0, r0, #3
	movs r1, #1
	bl DisplaySysHandCursorTextShadow
	mov r2, r8
	ldr r1, [r2, #0x34]
	asrs r2, r1, #3
	lsls r0, r2, #3
	subs r0, r0, r2
	lsls r0, r0, #4
	adds r0, #0x10
	movs r2, #7
	ands r1, r2
	lsls r1, r1, #4
	adds r1, #0x48
	movs r5, #0x80
	lsls r5, r5, #4
	movs r2, #0xb
	adds r3, r5, #0
	bl ShowSysHandCursor
	movs r0, #0xc8
	movs r1, #0x90
	mov r2, r8
	bl StartHelpPromptSprite
	movs r1, #0xe0
	lsls r1, r1, #4
	movs r3, #0xc0
	lsls r3, r3, #4
	movs r0, #0x80
	lsls r0, r0, #3
	str r0, [sp]
	mov r4, r8
	str r4, [sp, #4]
	movs r0, #0xd
	movs r2, #0xf
	bl StartSysBrownBox
	movs r1, #0x28
	rsbs r1, r1, #0
	movs r4, #1
	rsbs r4, r4, #0
	movs r0, #0
	adds r2, r4, #0
	movs r3, #1
	bl EnableSysBrownBox
	movs r0, #1
	movs r1, #0xb8
	adds r2, r4, #0
	movs r3, #0
	bl EnableSysBrownBox
	ldr r3, _08094EB4 @ =gDispIo
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
	movs r0, #0xe
	strb r0, [r1]
	adds r1, #1
	movs r0, #4
	strb r0, [r1]
	adds r0, r3, #0
	adds r0, #0x46
	strb r6, [r0]
	ldr r0, _08094EB8 @ =0x0000FFE0
	ldrh r2, [r3, #0x3c]
	ands r0, r2
	ldr r1, _08094EBC @ =0x0000E0FF
	ands r0, r1
	orrs r0, r5
	strh r0, [r3, #0x3c]
	add sp, #0x28
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08094EA4: .4byte 0x00000203
_08094EA8: .4byte 0x00000202
_08094EAC: .4byte gBg0Tm
_08094EB0: .4byte 0x02012A20
_08094EB4: .4byte gDispIo
_08094EB8: .4byte 0x0000FFE0
_08094EBC: .4byte 0x0000E0FF

	thumb_func_start sub_8094EC0
sub_8094EC0: @ 0x08094EC0
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r6, r0, #0
	ldr r2, [r6, #0x3c]
	cmp r2, #0xff
	beq _08094EEC
	ldr r0, _08094EE8 @ =gpKeySt
	ldr r1, [r0]
	movs r0, #0x81
	lsls r0, r0, #1
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	bne _08094EE0
	b _08095154
_08094EE0:
	bl CloseHelpBox
	movs r0, #0xff
	b _080951B4
	.align 2, 0
_08094EE8: .4byte gpKeySt
_08094EEC:
	ldr r0, _08094F28 @ =gpKeySt
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r1
	cmp r0, #0
	beq _08094F2C
	ldr r2, [r6, #0x34]
	asrs r3, r2, #3
	lsls r1, r3, #2
	adds r0, r6, #0
	adds r0, #0x2c
	adds r0, r0, r1
	ldr r0, [r0]
	movs r4, #7
	ands r4, r2
	lsls r1, r4, #1
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r2, [r0]
	cmp r2, #0
	bne _08094F1C
	b _080951B6
_08094F1C:
	lsls r0, r3, #3
	subs r0, r0, r3
	lsls r0, r0, #4
	adds r0, #0x10
	lsls r1, r4, #4
	b _080951AC
	.align 2, 0
_08094F28: .4byte gpKeySt
_08094F2C:
	ldr r4, [r6, #0x38]
	cmp r4, #0xff
	bne _08094F34
	b _08095094
_08094F34:
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	bne _08094F3E
	b _08095048
_08094F3E:
	asrs r0, r4, #3
	lsls r0, r0, #2
	adds r7, r6, #0
	adds r7, #0x2c
	adds r0, r7, r0
	ldr r0, [r0]
	movs r1, #7
	mov r8, r1
	ands r4, r1
	ldr r3, [r6, #0x34]
	asrs r1, r3, #3
	lsls r1, r1, #2
	adds r1, r7, r1
	ldr r2, [r1]
	mov r1, r8
	ands r3, r1
	adds r1, r4, #0
	bl sub_8091730
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08094F80
	movs r1, #1
	rsbs r1, r1, #0
	ldr r2, _08094F7C @ =0x000003B3
	adds r0, r1, #0
	adds r3, r6, #0
	bl sub_8091664
	b _080951B6
	.align 2, 0
_08094F7C: .4byte 0x000003B3
_08094F80:
	ldr r1, [r6, #0x38]
	asrs r0, r1, #3
	lsls r0, r0, #2
	adds r0, r7, r0
	ldr r0, [r0]
	mov r2, r8
	ands r1, r2
	ldr r3, [r6, #0x34]
	asrs r2, r3, #3
	lsls r2, r2, #2
	adds r2, r7, r2
	ldr r2, [r2]
	mov r4, r8
	ands r3, r4
	bl sub_80948A0
	ldr r4, _08094FE4 @ =gBg0Tm + 0x244
	ldr r5, _08094FE8 @ =0x02012A20
	ldr r2, [r6, #0x2c]
	adds r0, r4, #0
	adds r1, r5, #0
	movs r3, #0
	bl sub_8094AC0
	adds r4, #0x1c
	adds r5, #0x28
	ldr r2, [r6, #0x30]
	adds r0, r4, #0
	adds r1, r5, #0
	movs r3, #0
	bl sub_8094AC0
	movs r0, #1
	bl EnableBgSync
	ldr r0, [r6, #0x38]
	asrs r0, r0, #3
	lsls r0, r0, #2
	adds r0, r7, r0
	ldr r0, [r0]
	bl GetUnitItemCount
	adds r2, r0, #0
	cmp r2, #0
	bne _08094FEC
	ldr r0, [r6, #0x38]
	adds r0, #8
	movs r1, #8
	ands r0, r1
	b _08095000
	.align 2, 0
_08094FE4: .4byte gBg0Tm + 0x244
_08094FE8: .4byte 0x02012A20
_08094FEC:
	ldr r1, [r6, #0x38]
	adds r0, r1, #0
	mov r3, r8
	ands r0, r3
	cmp r2, r0
	bgt _08095002
	movs r0, #8
	ands r1, r0
	adds r0, r1, r2
	subs r0, #1
_08095000:
	str r0, [r6, #0x38]
_08095002:
	ldr r0, _08095040 @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08095014
	ldr r0, _08095044 @ =0x0000038A
	bl m4aSongNumStart
_08095014:
	movs r0, #0
	bl sub_80A998C
	ldr r1, [r6, #0x38]
	str r1, [r6, #0x34]
	movs r0, #0xff
	str r0, [r6, #0x38]
	asrs r2, r1, #3
	lsls r0, r2, #3
	subs r0, r0, r2
	lsls r0, r0, #4
	adds r0, #0x10
	movs r2, #7
	ands r1, r2
	lsls r1, r1, #4
	adds r1, #0x48
	movs r3, #0x80
	lsls r3, r3, #4
	movs r2, #0xb
	bl ShowSysHandCursor
	b _080951B6
	.align 2, 0
_08095040: .4byte gPlaySt
_08095044: .4byte 0x0000038A
_08095048:
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	bne _08095052
	b _08095154
_08095052:
	str r4, [r6, #0x34]
	str r2, [r6, #0x38]
	asrs r1, r4, #3
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #4
	adds r0, #0x10
	movs r1, #7
	ands r4, r1
	lsls r1, r4, #4
	adds r1, #0x48
	movs r3, #0x80
	lsls r3, r3, #4
	movs r2, #0xb
	bl ShowSysHandCursor
	ldr r0, _0809508C @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08095084
	ldr r0, _08095090 @ =0x0000038B
	bl m4aSongNumStart
_08095084:
	movs r0, #0
	bl sub_80A998C
	b _080951B6
	.align 2, 0
_0809508C: .4byte gPlaySt
_08095090: .4byte 0x0000038B
_08095094:
	movs r2, #1
	adds r0, r2, #0
	ands r0, r1
	cmp r0, #0
	beq _08095128
	ldr r0, [r6, #0x34]
	asrs r0, r0, #3
	adds r0, #1
	ands r0, r2
	lsls r0, r0, #2
	adds r1, r6, #0
	adds r1, #0x2c
	adds r1, r1, r0
	ldr r0, [r1]
	bl GetUnitItemCount
	adds r4, r0, #0
	ldr r2, [r6, #0x34]
	str r2, [r6, #0x38]
	asrs r0, r2, #3
	lsls r1, r0, #3
	subs r1, r1, r0
	lsls r1, r1, #4
	adds r1, #0x10
	movs r0, #7
	ands r2, r0
	lsls r2, r2, #4
	adds r2, #0x48
	movs r0, #0
	movs r3, #0
	bl sub_80A98DC
	cmp r4, #4
	bgt _080950E4
	ldr r0, [r6, #0x34]
	adds r0, #8
	movs r1, #8
	ands r0, r1
	adds r0, r0, r4
	b _080950EC
_080950E4:
	ldr r0, [r6, #0x34]
	adds r0, #8
	movs r1, #0xf
	ands r0, r1
_080950EC:
	str r0, [r6, #0x34]
	ldr r1, [r6, #0x34]
	asrs r2, r1, #3
	lsls r0, r2, #3
	subs r0, r0, r2
	lsls r0, r0, #4
	adds r0, #0x10
	movs r2, #7
	ands r1, r2
	lsls r1, r1, #4
	adds r1, #0x48
	movs r3, #0x80
	lsls r3, r3, #4
	movs r2, #0xb
	bl ShowSysHandCursor
	ldr r0, _08095120 @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080951B6
	ldr r0, _08095124 @ =0x0000038A
	bl m4aSongNumStart
	b _080951B6
	.align 2, 0
_08095120: .4byte gPlaySt
_08095124: .4byte 0x0000038A
_08095128:
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _08095154
	adds r0, r6, #0
	bl Proc_Break
	ldr r0, _0809514C @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080951B6
	ldr r0, _08095150 @ =0x0000038B
	bl m4aSongNumStart
	b _080951B6
	.align 2, 0
_0809514C: .4byte gPlaySt
_08095150: .4byte 0x0000038B
_08095154:
	adds r0, r6, #0
	bl sub_80948CC
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080951B6
	ldr r1, [r6, #0x34]
	asrs r2, r1, #3
	lsls r0, r2, #3
	subs r0, r0, r2
	lsls r0, r0, #4
	adds r0, #0x10
	movs r5, #7
	ands r1, r5
	lsls r1, r1, #4
	adds r1, #0x48
	movs r3, #0x80
	lsls r3, r3, #4
	movs r2, #0xb
	bl ShowSysHandCursor
	ldr r0, [r6, #0x3c]
	cmp r0, #0xff
	beq _080951B6
	ldr r2, [r6, #0x34]
	asrs r4, r2, #3
	lsls r1, r4, #2
	adds r0, r6, #0
	adds r0, #0x2c
	adds r0, r0, r1
	ldr r0, [r0]
	adds r3, r5, #0
	ands r3, r2
	lsls r1, r3, #1
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r2, [r0]
	cmp r2, #0
	beq _080951B6
	lsls r0, r4, #3
	subs r0, r0, r4
	lsls r0, r0, #4
	adds r0, #0x10
	lsls r1, r3, #4
_080951AC:
	adds r1, #0x48
	bl StartItemHelpBox
	ldr r0, [r6, #0x34]
_080951B4:
	str r0, [r6, #0x3c]
_080951B6:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_80951C0
sub_80951C0: @ 0x080951C0
	push {lr}
	bl EndMuralBackground_
	movs r0, #0
	bl EndFaceById
	movs r0, #1
	bl EndFaceById
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_80951D8
sub_80951D8: @ 0x080951D8
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r1, r2, #0
	ldr r0, _080951F8 @ =gUnk_08D8CF74
	bl Proc_StartBlocking
	str r4, [r0, #0x2c]
	str r5, [r0, #0x30]
	movs r1, #1
	rsbs r1, r1, #0
	str r1, [r0, #0x40]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080951F8: .4byte gUnk_08D8CF74

	thumb_func_start sub_80951FC
sub_80951FC: @ 0x080951FC
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r6, r2, #0
	adds r1, r3, #0
	ldr r0, _08095218 @ =gUnk_08D8CF74
	bl Proc_StartBlocking
	str r4, [r0, #0x2c]
	str r5, [r0, #0x30]
	str r6, [r0, #0x40]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08095218: .4byte gUnk_08D8CF74

	thumb_func_start sub_809521C
sub_809521C: @ 0x0809521C
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	ldr r5, _08095248 @ =gpKeySt
	ldr r0, [r5]
	ldrh r1, [r0, #6]
	movs r7, #0x40
	adds r0, r7, #0
	ands r0, r1
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	cmp r6, #0
	beq _0809525E
	ldr r0, [r4, #0x2c]
	bl GetUnitItemCount
	adds r2, r0, #0
	ldr r0, [r4, #0x30]
	cmp r0, #0
	ble _0809524C
	subs r0, #1
	str r0, [r4, #0x30]
	b _0809528A
	.align 2, 0
_08095248: .4byte gpKeySt
_0809524C:
	ldr r1, [r5]
	adds r0, r7, #0
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _080952A8
	subs r0, r2, #1
	str r0, [r4, #0x30]
	b _0809528A
_0809525E:
	movs r7, #0x80
	adds r0, r7, #0
	ands r0, r1
	cmp r0, #0
	beq _080952A8
	ldr r0, [r4, #0x2c]
	bl GetUnitItemCount
	subs r0, #1
	ldr r1, [r4, #0x30]
	cmp r1, r0
	bge _0809527C
	adds r0, r1, #1
	str r0, [r4, #0x30]
	b _0809528A
_0809527C:
	ldr r1, [r5]
	adds r0, r7, #0
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _080952A8
	str r6, [r4, #0x30]
_0809528A:
	ldr r0, _080952A0 @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0809529C
	ldr r0, _080952A4 @ =0x00000386
	bl m4aSongNumStart
_0809529C:
	movs r0, #1
	b _080952AA
	.align 2, 0
_080952A0: .4byte gPlaySt
_080952A4: .4byte 0x00000386
_080952A8:
	movs r0, #0
_080952AA:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	thumb_func_start sub_80952B0
sub_80952B0: @ 0x080952B0
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #8
	mov r8, r0
	ldr r6, _0809530C @ =0x020129A8
	adds r5, r6, #0
	movs r4, #7
_080952C0:
	adds r0, r5, #0
	bl ClearText
	adds r5, #8
	subs r4, #1
	cmp r4, #0
	bge _080952C0
	adds r0, r6, #0
	adds r6, #8
	ldr r4, _08095310 @ =gBg2Tm + 0x122
	movs r5, #0
	str r5, [sp]
	ldr r1, _08095314 @ =gUnk_0842CFFC
	str r1, [sp, #4]
	adds r1, r4, #0
	movs r2, #3
	movs r3, #0
	bl PutDrawText
	mov r0, r8
	bl UnitHasMagicRank
	lsls r0, r0, #0x18
	asrs r2, r0, #0x18
	cmp r2, #0
	beq _0809531C
	adds r0, r6, #0
	adds r6, #8
	adds r1, r4, #0
	adds r1, #0x80
	str r5, [sp]
	ldr r2, _08095318 @ =gUnk_0842D004
	str r2, [sp, #4]
	movs r2, #3
	movs r3, #0
	bl PutDrawText
	b _08095332
	.align 2, 0
_0809530C: .4byte 0x020129A8
_08095310: .4byte gBg2Tm + 0x122
_08095314: .4byte gUnk_0842CFFC
_08095318: .4byte gUnk_0842D004
_0809531C:
	adds r0, r6, #0
	adds r6, #8
	adds r1, r4, #0
	adds r1, #0x80
	str r2, [sp]
	ldr r2, _08095404 @ =gUnk_0842D00C
	str r2, [sp, #4]
	movs r2, #3
	movs r3, #4
	bl PutDrawText
_08095332:
	adds r0, r6, #0
	adds r6, #8
	ldr r7, _08095408 @ =gBg2Tm + 0x222
	movs r5, #0
	str r5, [sp]
	ldr r1, _0809540C @ =gUnk_0842D010
	str r1, [sp, #4]
	adds r1, r7, #0
	movs r2, #3
	movs r3, #4
	bl PutDrawText
	adds r0, r6, #0
	adds r6, #8
	adds r1, r7, #0
	adds r1, #0x80
	str r5, [sp]
	ldr r2, _08095410 @ =gUnk_0842D014
	str r2, [sp, #4]
	movs r2, #3
	movs r3, #0
	bl PutDrawText
	adds r0, r6, #0
	adds r6, #8
	adds r1, r7, #0
	subs r1, #0xf4
	str r5, [sp]
	ldr r2, _08095414 @ =gUnk_0842D01C
	str r2, [sp, #4]
	movs r2, #3
	movs r3, #0
	bl PutDrawText
	adds r0, r6, #0
	adds r6, #8
	adds r1, r7, #0
	subs r1, #0x74
	str r5, [sp]
	ldr r2, _08095418 @ =gUnk_0842D024
	str r2, [sp, #4]
	movs r2, #3
	movs r3, #0
	bl PutDrawText
	adds r0, r6, #0
	adds r6, #8
	adds r1, r7, #0
	adds r1, #0xc
	str r5, [sp]
	ldr r2, _0809541C @ =gUnk_0842D02C
	str r2, [sp, #4]
	movs r2, #3
	movs r3, #0
	bl PutDrawText
	adds r0, r6, #0
	adds r6, #8
	adds r1, r7, #0
	adds r1, #0x8c
	str r5, [sp]
	ldr r2, _08095420 @ =gUnk_0842D034
	str r2, [sp, #4]
	movs r2, #3
	movs r3, #0
	bl PutDrawText
	mov r1, r8
	ldr r0, [r1, #4]
	ldrh r0, [r0]
	bl DecodeMsg
	adds r4, r0, #0
	movs r0, #0x38
	adds r1, r4, #0
	bl GetStringTextCenteredPos
	adds r3, r0, #0
	adds r0, r6, #0
	ldr r2, _08095424 @ =0xFFFFFE0A
	adds r1, r7, r2
	str r5, [sp]
	str r4, [sp, #4]
	movs r2, #0
	bl PutDrawText
	ldr r1, _08095428 @ =0xFFFFFE02
	adds r0, r7, r1
	movs r1, #3
	movs r2, #0x24
	bl PutSpecialChar
	ldr r2, _0809542C @ =0xFFFFFE04
	adds r0, r7, r2
	movs r1, #3
	movs r2, #0x25
	bl PutSpecialChar
	add sp, #8
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08095404: .4byte gUnk_0842D00C
_08095408: .4byte gBg2Tm + 0x222
_0809540C: .4byte gUnk_0842D010
_08095410: .4byte gUnk_0842D014
_08095414: .4byte gUnk_0842D01C
_08095418: .4byte gUnk_0842D024
_0809541C: .4byte gUnk_0842D02C
_08095420: .4byte gUnk_0842D034
_08095424: .4byte 0xFFFFFE0A
_08095428: .4byte 0xFFFFFE02
_0809542C: .4byte 0xFFFFFE04

	thumb_func_start sub_8095430
sub_8095430: @ 0x08095430
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #0x2c
	adds r5, r0, #0
	mov r8, r1
	movs r0, #2
	bl ApplyUiStatBarPal
	add r4, sp, #0xc
	adds r0, r5, #0
	bl GetUnitCurrentHp
	adds r1, r0, #0
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r2, r0, #3
	movs r0, #0xc0
	ldrb r3, [r5, #0xb]
	ands r0, r3
	cmp r0, #0x80
	beq _08095462
	adds r0, r2, #0
	movs r1, #0x3c
	b _08095466
_08095462:
	adds r0, r1, #0
	movs r1, #5
_08095466:
	bl __divsi3
	str r0, [r4]
	adds r0, r5, #0
	bl GetUnitPower
	adds r1, r0, #0
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #3
	ldr r1, [r5, #4]
	ldrb r1, [r1, #0x14]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	bl __divsi3
	str r0, [sp, #0x10]
	adds r0, r5, #0
	bl GetUnitSkill
	adds r1, r0, #0
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #3
	ldr r1, [r5, #4]
	ldrb r1, [r1, #0x15]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	bl __divsi3
	str r0, [sp, #0x14]
	adds r0, r5, #0
	bl GetUnitSpeed
	adds r1, r0, #0
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #3
	ldr r1, [r5, #4]
	ldrb r1, [r1, #0x16]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	bl __divsi3
	str r0, [sp, #0x18]
	adds r0, r5, #0
	bl GetUnitLuck
	adds r1, r0, #0
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #3
	movs r1, #0x1e
	bl __divsi3
	str r0, [sp, #0x1c]
	adds r0, r5, #0
	bl GetUnitDefense
	adds r1, r0, #0
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #3
	ldr r1, [r5, #4]
	ldrb r1, [r1, #0x17]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	bl __divsi3
	str r0, [sp, #0x20]
	adds r0, r5, #0
	bl GetUnitResistance
	adds r1, r0, #0
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #3
	ldr r4, [r5, #4]
	movs r1, #0x18
	ldrsb r1, [r4, r1]
	bl __divsi3
	str r0, [sp, #0x24]
	movs r1, #0x11
	ldrsb r1, [r4, r1]
	ldr r0, [r5]
	ldrb r0, [r0, #0x13]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r1, r1, r0
	movs r0, #0x1a
	ldrsb r0, [r5, r0]
	adds r1, r1, r0
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #3
	movs r1, #0x19
	ldrsb r1, [r4, r1]
	bl __divsi3
	str r0, [sp, #0x28]
	movs r5, #0
	add r6, sp, #0xc
	movs r7, #0xe0
	lsls r7, r7, #7
_08095538:
	mov r4, r8
	asrs r4, r5
	movs r0, #1
	ands r4, r0
	cmp r4, #0
	beq _0809557C
	lsls r0, r7, #0xf
	lsrs r0, r0, #0x14
	movs r2, #3
	ands r2, r5
	lsls r2, r2, #6
	adds r2, #0xb3
	asrs r3, r5, #2
	lsls r1, r3, #1
	adds r1, r1, r3
	lsls r1, r1, #1
	adds r2, r2, r1
	lsls r2, r2, #1
	ldr r1, _08095578 @ =gBg0Tm
	adds r2, r2, r1
	movs r1, #0x18
	str r1, [sp]
	ldr r1, [r6]
	str r1, [sp, #4]
	movs r1, #0
	str r1, [sp, #8]
	movs r1, #4
	movs r3, #0xc0
	lsls r3, r3, #6
	bl PutDrawUiGauge
	b _080955AC
	.align 2, 0
_08095578: .4byte gBg0Tm
_0809557C:
	lsls r0, r7, #0xf
	lsrs r0, r0, #0x14
	movs r2, #3
	ands r2, r5
	lsls r2, r2, #6
	adds r2, #0xb3
	asrs r3, r5, #2
	lsls r1, r3, #1
	adds r1, r1, r3
	lsls r1, r1, #1
	adds r2, r2, r1
	lsls r2, r2, #1
	ldr r1, _080955CC @ =gBg0Tm
	adds r2, r2, r1
	movs r1, #0x18
	str r1, [sp]
	ldr r1, [r6]
	str r1, [sp, #4]
	str r4, [sp, #8]
	movs r1, #4
	movs r3, #0x80
	lsls r3, r3, #6
	bl PutDrawUiGauge
_080955AC:
	adds r6, #4
	movs r0, #0x80
	lsls r0, r0, #1
	adds r7, r7, r0
	adds r5, #1
	cmp r5, #7
	ble _08095538
	movs r0, #1
	bl EnableBgSync
	add sp, #0x2c
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080955CC: .4byte gBg0Tm

	thumb_func_start sub_80955D0
sub_80955D0: @ 0x080955D0
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	ldr r6, _080955EC @ =gBg2Tm + 0x12a
	bl GetUnitCurrentHp
	adds r1, r0, #0
	movs r0, #0xc0
	ldrb r2, [r4, #0xb]
	ands r0, r2
	cmp r0, #0x80
	bne _080955F0
	cmp r1, #0x78
	beq _080955F4
	b _080955F8
	.align 2, 0
_080955EC: .4byte gBg2Tm + 0x12a
_080955F0:
	cmp r1, #0x3c
	bne _080955F8
_080955F4:
	movs r5, #4
	b _080955FA
_080955F8:
	movs r5, #2
_080955FA:
	adds r0, r4, #0
	bl GetUnitCurrentHp
	adds r2, r0, #0
	adds r0, r6, #0
	adds r1, r5, #0
	bl PutNumberOrBlank
	ldr r5, _08095748 @ =gBg2Tm + 0x1aa
	adds r0, r4, #0
	bl GetUnitPower
	ldr r1, [r4, #4]
	ldrb r1, [r1, #0x14]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	movs r6, #2
	cmp r0, r1
	bne _08095622
	movs r6, #4
_08095622:
	adds r0, r4, #0
	bl GetUnitPower
	adds r2, r0, #0
	adds r0, r5, #0
	adds r1, r6, #0
	bl PutNumberOrBlank
	adds r7, r5, #0
	adds r7, #0x80
	adds r0, r4, #0
	bl GetUnitSkill
	ldr r1, [r4, #4]
	ldrb r1, [r1, #0x15]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	movs r6, #2
	cmp r0, r1
	bne _0809564C
	movs r6, #4
_0809564C:
	adds r0, r4, #0
	bl GetUnitSkill
	adds r2, r0, #0
	adds r0, r7, #0
	adds r1, r6, #0
	bl PutNumberOrBlank
	movs r0, #0x80
	lsls r0, r0, #1
	adds r7, r5, r0
	adds r0, r4, #0
	bl GetUnitSpeed
	ldr r1, [r4, #4]
	ldrb r1, [r1, #0x16]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	movs r6, #2
	cmp r0, r1
	bne _08095678
	movs r6, #4
_08095678:
	adds r0, r4, #0
	bl GetUnitSpeed
	adds r2, r0, #0
	adds r0, r7, #0
	adds r1, r6, #0
	bl PutNumberOrBlank
	adds r7, r5, #0
	subs r7, #0x74
	adds r0, r4, #0
	bl GetUnitLuck
	movs r6, #2
	cmp r0, #0x1e
	bne _0809569A
	movs r6, #4
_0809569A:
	adds r0, r4, #0
	bl GetUnitLuck
	adds r2, r0, #0
	adds r0, r7, #0
	adds r1, r6, #0
	bl PutNumberOrBlank
	adds r7, r5, #0
	adds r7, #0xc
	adds r0, r4, #0
	bl GetUnitDefense
	ldr r1, [r4, #4]
	ldrb r1, [r1, #0x17]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	movs r6, #2
	cmp r0, r1
	bne _080956C4
	movs r6, #4
_080956C4:
	adds r0, r4, #0
	bl GetUnitDefense
	adds r2, r0, #0
	adds r0, r7, #0
	adds r1, r6, #0
	bl PutNumberOrBlank
	adds r7, r5, #0
	adds r7, #0x8c
	adds r0, r4, #0
	bl GetUnitResistance
	ldr r1, [r4, #4]
	ldrb r1, [r1, #0x18]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	movs r6, #2
	cmp r0, r1
	bne _080956EE
	movs r6, #4
_080956EE:
	adds r0, r4, #0
	bl GetUnitResistance
	adds r2, r0, #0
	adds r0, r7, #0
	adds r1, r6, #0
	bl PutNumberOrBlank
	movs r1, #0x86
	lsls r1, r1, #1
	adds r6, r5, r1
	ldr r2, [r4, #4]
	movs r1, #0x11
	ldrsb r1, [r2, r1]
	ldr r0, [r4]
	ldrb r0, [r0, #0x13]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r1, r1, r0
	movs r0, #0x1a
	ldrsb r0, [r4, r0]
	adds r3, r1, r0
	movs r0, #0x19
	ldrsb r0, [r2, r0]
	movs r1, #2
	cmp r3, r0
	bne _08095726
	movs r1, #4
_08095726:
	adds r0, r6, #0
	adds r2, r3, #0
	bl PutNumberOrBlank
	ldr r2, _0809574C @ =0xFFFFFE80
	adds r0, r5, r2
	movs r2, #8
	ldrsb r2, [r4, r2]
	movs r1, #2
	bl PutNumberOrBlank
	movs r0, #4
	bl EnableBgSync
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08095748: .4byte gBg2Tm + 0x1aa
_0809574C: .4byte 0xFFFFFE80

	thumb_func_start sub_8095750
sub_8095750: @ 0x08095750
	push {r4, r5, r6, lr}
	sub sp, #8
	adds r6, r0, #0
	adds r5, r1, #0
	ldr r4, _080957C0 @ =0x02012A70
	adds r0, r4, #0
	bl ClearText
	adds r4, #8
	adds r0, r4, #0
	bl ClearText
	movs r0, #1
	rsbs r0, r0, #0
	cmp r5, r0
	beq _080957EE
	lsls r1, r5, #1
	adds r0, r6, #0
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r5, [r0]
	adds r0, r5, #0
	bl GetItemUseDescId
	adds r4, r0, #0
	ldr r0, _080957C4 @ =gUnk_0842D03C
	ldr r1, [r0, #4]
	ldr r0, [r0]
	str r0, [sp]
	str r1, [sp, #4]
	cmp r4, #0
	beq _080957EE
	adds r0, r6, #0
	adds r1, r5, #0
	bl sub_80284C8
	cmp r0, #0
	beq _080957CC
	ldr r0, [sp]
	movs r1, #0
	bl Text_SetColor
	ldr r0, [sp, #4]
	movs r1, #0
	bl Text_SetColor
	adds r0, r4, #0
	bl DecodeMsg
	adds r1, r0, #0
	ldr r2, _080957C8 @ =gBg0Tm + 0x39e
	mov r0, sp
	movs r3, #2
	bl PrintStringToTexts
	b _080957EE
	.align 2, 0
_080957C0: .4byte 0x02012A70
_080957C4: .4byte gUnk_0842D03C
_080957C8: .4byte gBg0Tm + 0x39e
_080957CC:
	ldr r0, [sp]
	movs r1, #1
	bl Text_SetColor
	ldr r0, [sp, #4]
	movs r1, #1
	bl Text_SetColor
	adds r0, r4, #0
	bl DecodeMsg
	adds r1, r0, #0
	ldr r2, _080957FC @ =gBg0Tm + 0x39e
	mov r0, sp
	movs r3, #2
	bl PrintStringToTexts
_080957EE:
	movs r0, #1
	bl EnableBgSync
	add sp, #8
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080957FC: .4byte gBg0Tm + 0x39e

	thumb_func_start sub_8095800
sub_8095800: @ 0x08095800
	push {lr}
	sub sp, #4
	movs r3, #0xc8
	lsls r3, r3, #8
	ldr r0, [r0, #0x2c]
	ldr r0, [r0, #4]
	ldrb r0, [r0, #4]
	str r0, [sp]
	movs r0, #0
	movs r1, #0x80
	movs r2, #2
	bl sub_8026628
	bl sub_80259A4
	add sp, #4
	pop {r0}
	bx r0

	thumb_func_start sub_8095824
sub_8095824: @ 0x08095824
	movs r1, #0
	str r1, [r0, #0x30]
	movs r1, #0xff
	str r1, [r0, #0x38]
	bx lr
	.align 2, 0

	thumb_func_start sub_8095830
sub_8095830: @ 0x08095830
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x28
	adds r7, r0, #0
	add r1, sp, #8
	ldr r0, _08095B2C @ =gUnk_0842D044
	ldm r0!, {r2, r3, r4}
	stm r1!, {r2, r3, r4}
	ldm r0!, {r2, r5, r6}
	stm r1!, {r2, r5, r6}
	ldm r0!, {r3, r4}
	stm r1!, {r3, r4}
	ldr r4, _08095B30 @ =gDispIo
	movs r0, #8
	rsbs r0, r0, #0
	ldrb r5, [r4]
	ands r0, r5
	strb r0, [r4]
	ldr r0, _08095B34 @ =gUnk_08D8C0A0
	bl InitBgs
	add r0, sp, #8
	bl SetFaceConfig
	movs r0, #0xff
	str r0, [r7, #0x34]
	movs r0, #0
	bl GetBgTilemap
	movs r1, #0
	bl TmFill
	movs r0, #1
	bl GetBgTilemap
	movs r1, #0
	bl TmFill
	movs r0, #2
	bl GetBgTilemap
	movs r1, #0
	bl TmFill
	movs r2, #4
	rsbs r2, r2, #0
	adds r0, r2, #0
	ldrb r6, [r4, #0xc]
	ands r0, r6
	movs r1, #1
	orrs r0, r1
	strb r0, [r4, #0xc]
	adds r0, r2, #0
	ldrb r1, [r4, #0x10]
	ands r0, r1
	movs r1, #2
	orrs r0, r1
	strb r0, [r4, #0x10]
	ldrb r3, [r4, #0x14]
	ands r2, r3
	strb r2, [r4, #0x14]
	movs r0, #3
	ldrb r5, [r4, #0x18]
	orrs r0, r5
	strb r0, [r4, #0x18]
	bl ResetText
	bl InitIcons
	bl UnpackUiWindowFrameGraphics
	bl ApplySystemObjectsGraphics
	bl ApplyUnitSpritePalettes
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
	ldr r0, _08095B38 @ =0x06014000
	movs r1, #1
	rsbs r1, r1, #0
	bl LoadHelpBoxGfx
	movs r0, #4
	bl ApplyIconPalettes
	bl sub_808ED8C
	ldr r4, _08095B3C @ =0x02012A20
	movs r6, #4
	mov sl, r6
_08095904:
	adds r0, r4, #0
	movs r1, #7
	bl sub_800536C
	adds r4, #8
	movs r0, #1
	rsbs r0, r0, #0
	add sl, r0
	mov r1, sl
	cmp r1, #0
	bge _08095904
	ldr r4, _08095B40 @ =0x020129A8
	movs r2, #7
	mov sl, r2
_08095920:
	adds r0, r4, #0
	movs r1, #3
	bl InitText
	adds r4, #8
	movs r3, #1
	rsbs r3, r3, #0
	add sl, r3
	mov r5, sl
	cmp r5, #0
	bge _08095920
	movs r6, #8
	mov sl, r6
	ldr r0, _08095B40 @ =0x020129A8
	mov r8, r0
	adds r0, #0x40
	movs r1, #7
	bl InitText
	mov r0, r8
	adds r0, #0xc8
	movs r1, #0xf
	bl InitText
	mov r0, r8
	adds r0, #0xd0
	movs r1, #0xf
	bl InitText
	mov r0, r8
	adds r0, #0xd8
	movs r1, #0xc
	bl InitText
	mov r0, r8
	adds r0, #0xe0
	movs r1, #8
	bl InitText
	ldr r0, [r7, #0x2c]
	bl sub_80952B0
	ldr r0, [r7, #0x2c]
	bl sub_80955D0
	ldr r0, [r7, #0x2c]
	movs r1, #0
	bl sub_8095430
	ldr r0, [r7, #0x2c]
	bl GetUnitPortraitId
	adds r1, r0, #0
	movs r3, #4
	rsbs r3, r3, #0
	ldr r0, _08095B44 @ =0x00000203
	str r0, [sp]
	movs r0, #0
	movs r2, #0x40
	bl StartBmFace
	movs r0, #0xc0
	lsls r0, r0, #7
	movs r1, #5
	bl sub_809228C
	movs r0, #0xc0
	lsls r0, r0, #6
	movs r1, #0xa
	bl sub_80922DC
	ldr r0, _08095B48 @ =gBg1Tm
	ldr r1, _08095B4C @ =gUnk_0842973C
	movs r2, #0xa6
	lsls r2, r2, #7
	bl TmApplyTsa_thm
	movs r0, #7
	bl EnableBgSync
	movs r1, #0xe0
	lsls r1, r1, #4
	movs r3, #0xc0
	lsls r3, r3, #4
	movs r2, #0
	str r2, [sp]
	str r7, [sp, #4]
	movs r0, #0xd
	movs r2, #0xf
	bl StartSysBrownBox
	movs r1, #0x28
	rsbs r1, r1, #0
	movs r2, #1
	rsbs r2, r2, #0
	movs r0, #0
	movs r3, #1
	bl EnableSysBrownBox
	ldr r0, [r7, #0x2c]
	ldr r0, [r0]
	ldrh r0, [r0]
	bl DecodeMsg
	adds r4, r0, #0
	bl GetStringTextLen
	movs r3, #0x30
	subs r3, r3, r0
	lsrs r0, r3, #0x1f
	adds r3, r3, r0
	asrs r3, r3, #1
	movs r0, #6
	str r0, [sp]
	str r4, [sp, #4]
	movs r0, #0
	ldr r1, _08095B50 @ =gBg0Tm
	movs r2, #0
	bl PutDrawText
	adds r0, r7, #0
	bl sub_80A98C8
	adds r0, r7, #0
	bl ResetSysHandCursor
	movs r0, #0xc0
	lsls r0, r0, #3
	movs r1, #1
	bl DisplaySysHandCursorTextShadow
	ldr r0, _08095B54 @ =sub_8095800
	adds r1, r7, #0
	bl StartParallelWorker
	ldr r3, _08095B30 @ =gDispIo
	mov ip, r3
	movs r0, #0x20
	ldrb r4, [r3, #1]
	orrs r0, r4
	movs r1, #0x41
	rsbs r1, r1, #0
	ands r0, r1
	movs r1, #0x7f
	ands r0, r1
	strb r0, [r3, #1]
	mov r1, ip
	adds r1, #0x2d
	movs r0, #0x68
	strb r0, [r1]
	adds r1, #4
	movs r0, #0x6e
	strb r0, [r1]
	subs r1, #5
	movs r0, #0xf0
	strb r0, [r1]
	adds r1, #4
	movs r0, #0x92
	strb r0, [r1]
	movs r0, #1
	ldr r5, _08095B58 @ =0x030027C4
	ldrb r1, [r5]
	orrs r1, r0
	movs r6, #2
	orrs r1, r6
	movs r4, #4
	orrs r1, r4
	movs r3, #8
	orrs r1, r3
	movs r2, #0x10
	orrs r1, r2
	movs r5, #0x36
	add r5, ip
	mov sb, r5
	ldrb r6, [r5]
	orrs r0, r6
	movs r5, #2
	orrs r0, r5
	orrs r0, r4
	orrs r0, r3
	orrs r0, r2
	movs r6, #0x20
	orrs r1, r6
	ldr r2, _08095B58 @ =0x030027C4
	strb r1, [r2]
	movs r1, #0x21
	rsbs r1, r1, #0
	ands r0, r1
	mov r3, sb
	strb r0, [r3]
	mov r1, ip
	adds r1, #0x3c
	movs r0, #0xc0
	ldrb r4, [r1]
	orrs r0, r4
	strb r0, [r1]
	mov r0, ip
	adds r0, #0x44
	movs r5, #0
	strb r5, [r0]
	adds r0, #1
	strb r5, [r0]
	adds r0, #1
	mov r6, sl
	strb r6, [r0]
	ldr r0, _08095B5C @ =0x0000FFE0
	mov r1, ip
	ldrh r1, [r1, #0x3c]
	ands r0, r1
	movs r1, #8
	orrs r0, r1
	mov r2, ip
	strh r0, [r2, #0x3c]
	adds r0, r7, #0
	bl StartGreenText
	movs r0, #0xc0
	movs r1, #0x8c
	adds r2, r7, #0
	bl StartHelpPromptSprite
	ldr r0, [r7, #0x2c]
	ldr r1, [r7, #0x30]
	bl sub_8095750
	mov r1, r8
	adds r1, #0x78
	ldr r2, [r7, #0x2c]
	ldr r0, _08095B60 @ =gBg0Tm + 0x244
	movs r3, #1
	bl sub_8094AC0
	ldr r1, [r7, #0x30]
	asrs r2, r1, #3
	lsls r0, r2, #3
	subs r0, r0, r2
	lsls r0, r0, #4
	adds r0, #0x10
	movs r2, #7
	ands r1, r2
	lsls r1, r1, #4
	adds r1, #0x48
	movs r3, #0x80
	lsls r3, r3, #4
	movs r2, #0xb
	bl ShowSysHandCursor
	ldr r0, [r7, #0x2c]
	bl GetUnitSMSId
	bl sub_8025278
	bl ForceSyncUnitSpriteSheet
	add sp, #0x28
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08095B2C: .4byte gUnk_0842D044
_08095B30: .4byte gDispIo
_08095B34: .4byte gUnk_08D8C0A0
_08095B38: .4byte 0x06014000
_08095B3C: .4byte 0x02012A20
_08095B40: .4byte 0x020129A8
_08095B44: .4byte 0x00000203
_08095B48: .4byte gBg1Tm
_08095B4C: .4byte gUnk_0842973C
_08095B50: .4byte gBg0Tm
_08095B54: .4byte sub_8095800
_08095B58: .4byte 0x030027C4
_08095B5C: .4byte 0x0000FFE0
_08095B60: .4byte gBg0Tm + 0x244

	thumb_func_start sub_8095B64
sub_8095B64: @ 0x08095B64
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x38]
	cmp r0, #0xff
	beq _08095B8C
	ldr r0, _08095B88 @ =gpKeySt
	ldr r1, [r0]
	movs r0, #0x81
	lsls r0, r0, #1
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _08095C40
	bl CloseHelpBox
	movs r0, #0xff
	b _08095C88
	.align 2, 0
_08095B88: .4byte gpKeySt
_08095B8C:
	ldr r0, _08095BEC @ =gpKeySt
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r1
	cmp r0, #0
	bne _08095C6C
	movs r5, #1
	adds r0, r5, #0
	ands r0, r1
	cmp r0, #0
	beq _08095C14
	ldr r0, [r4, #0x2c]
	ldr r2, [r4, #0x30]
	lsls r2, r2, #1
	adds r1, r0, #0
	adds r1, #0x1e
	adds r1, r1, r2
	ldrh r1, [r1]
	bl sub_80284C8
	cmp r0, #0
	beq _08095BF8
	ldr r2, [r4, #0x30]
	str r2, [r4, #0x34]
	lsls r2, r2, #4
	adds r2, #0x48
	movs r0, #0
	movs r1, #0x10
	movs r3, #0
	bl sub_80A98DC
	str r5, [r4, #0x3c]
	ldr r0, _08095BF0 @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08095BE2
	ldr r0, _08095BF4 @ =0x0000038A
	bl m4aSongNumStart
_08095BE2:
	adds r0, r4, #0
	movs r1, #2
	bl Proc_Goto
	b _08095C8A
	.align 2, 0
_08095BEC: .4byte gpKeySt
_08095BF0: .4byte gPlaySt
_08095BF4: .4byte 0x0000038A
_08095BF8:
	ldr r0, _08095C10 @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08095C8A
	movs r0, #0xe3
	lsls r0, r0, #2
	bl m4aSongNumStart
	b _08095C8A
	.align 2, 0
_08095C10: .4byte gPlaySt
_08095C14:
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _08095C40
	adds r0, r4, #0
	movs r1, #5
	bl Proc_Goto
	ldr r0, _08095C38 @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08095C8A
	ldr r0, _08095C3C @ =0x0000038B
	bl m4aSongNumStart
	b _08095C8A
	.align 2, 0
_08095C38: .4byte gPlaySt
_08095C3C: .4byte 0x0000038B
_08095C40:
	adds r0, r4, #0
	bl sub_809521C
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08095C8A
	ldr r1, [r4, #0x30]
	lsls r1, r1, #4
	adds r1, #0x48
	movs r3, #0x80
	lsls r3, r3, #4
	movs r0, #0x10
	movs r2, #0xb
	bl ShowSysHandCursor
	ldr r0, [r4, #0x2c]
	ldr r1, [r4, #0x30]
	bl sub_8095750
	ldr r0, [r4, #0x38]
	cmp r0, #0xff
	beq _08095C8A
_08095C6C:
	ldr r0, [r4, #0x2c]
	ldr r3, [r4, #0x30]
	lsls r1, r3, #1
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r2, [r0]
	cmp r2, #0
	beq _08095C8A
	lsls r1, r3, #4
	adds r1, #0x48
	movs r0, #0x10
	bl StartItemHelpBox
	ldr r0, [r4, #0x30]
_08095C88:
	str r0, [r4, #0x38]
_08095C8A:
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start sub_8095C90
sub_8095C90: @ 0x08095C90
	push {lr}
	bl EndMuralBackground_
	movs r0, #0
	bl EndFaceById
	movs r0, #1
	bl EndFaceById
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_8095CA8
sub_8095CA8: @ 0x08095CA8
	push {r4, r5, r6, lr}
	sub sp, #8
	ldr r4, _08095D08 @ =0x02012A80
	adds r0, r4, #0
	bl ClearText
	adds r0, r4, #0
	adds r4, #8
	ldr r5, _08095D0C @ =gBg2Tm + 0x364
	movs r6, #0
	str r6, [sp]
	ldr r1, _08095D10 @ =gUnk_0842D064
	str r1, [sp, #4]
	adds r1, r5, #0
	movs r2, #0
	movs r3, #0
	bl PutDrawText
	adds r0, r4, #0
	bl ClearText
	adds r5, #0x82
	str r6, [sp]
	ldr r0, _08095D14 @ =gUnk_0842D07C
	str r0, [sp, #4]
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #0
	movs r3, #0
	bl PutDrawText
	str r6, [sp]
	ldr r0, _08095D18 @ =gUnk_0842D084
	str r0, [sp, #4]
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #0
	movs r3, #0x20
	bl PutDrawText
	movs r0, #4
	bl EnableBgSync
	add sp, #8
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08095D08: .4byte 0x02012A80
_08095D0C: .4byte gBg2Tm + 0x364
_08095D10: .4byte gUnk_0842D064
_08095D14: .4byte gUnk_0842D07C
_08095D18: .4byte gUnk_0842D084

	thumb_func_start sub_8095D1C
sub_8095D1C: @ 0x08095D1C
	push {lr}
	ldr r0, _08095D34 @ =gBg2Tm + 0x364
	movs r1, #0xc
	movs r2, #4
	movs r3, #0
	bl TmFillRect_thm
	movs r0, #4
	bl EnableBgSync
	pop {r0}
	bx r0
	.align 2, 0
_08095D34: .4byte gBg2Tm + 0x364

	thumb_func_start sub_8095D38
sub_8095D38: @ 0x08095D38
	push {r4, lr}
	adds r4, r0, #0
	bl sub_8095CA8
	ldr r0, [r4, #0x3c]
	lsls r0, r0, #5
	adds r0, #0x94
	movs r3, #0x80
	lsls r3, r3, #4
	movs r1, #0x78
	movs r2, #0
	bl ShowSysHandCursor
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_8095D58
sub_8095D58: @ 0x08095D58
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r4, r0, #0
	ldr r7, [r4, #0x3c]
	ldr r0, _08095DB0 @ =0x0000A580
	str r0, [sp]
	movs r0, #0x88
	movs r1, #0x64
	movs r2, #0xb
	movs r3, #4
	bl sub_80935C4
	ldr r5, _08095DB4 @ =gpKeySt
	ldr r1, [r5]
	ldrh r3, [r1, #8]
	movs r0, #2
	ands r0, r3
	cmp r0, #0
	beq _08095DC0
	ldr r1, [r4, #0x30]
	lsls r1, r1, #4
	adds r1, #0x48
	movs r3, #0x80
	lsls r3, r3, #4
	movs r0, #0x10
	movs r2, #0xb
	bl ShowSysHandCursor
	movs r0, #0
	bl sub_80A998C
	bl sub_8095D1C
	ldr r0, _08095DB8 @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08095E26
	ldr r0, _08095DBC @ =0x0000038B
	bl m4aSongNumStart
	b _08095E26
	.align 2, 0
_08095DB0: .4byte 0x0000A580
_08095DB4: .4byte gpKeySt
_08095DB8: .4byte gPlaySt
_08095DBC: .4byte 0x0000038B
_08095DC0:
	movs r6, #1
	adds r2, r6, #0
	ands r2, r3
	cmp r2, #0
	beq _08095E38
	bl sub_8095D1C
	ldr r0, [r4, #0x3c]
	cmp r0, #0
	bne _08095DFC
	bl HideSysHandCursor
	ldr r0, _08095DF4 @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08095DEA
	ldr r0, _08095DF8 @ =0x0000038A
	bl m4aSongNumStart
_08095DEA:
	adds r0, r4, #0
	movs r1, #3
	bl Proc_Goto
	b _08095E7A
	.align 2, 0
_08095DF4: .4byte gPlaySt
_08095DF8: .4byte 0x0000038A
_08095DFC:
	ldr r1, [r4, #0x30]
	lsls r1, r1, #4
	adds r1, #0x48
	movs r3, #0x80
	lsls r3, r3, #4
	movs r0, #0x10
	movs r2, #0xb
	bl ShowSysHandCursor
	ldr r0, _08095E30 @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08095E20
	ldr r0, _08095E34 @ =0x0000038B
	bl m4aSongNumStart
_08095E20:
	movs r0, #0
	bl sub_80A998C
_08095E26:
	adds r0, r4, #0
	bl Proc_Break
	b _08095E7A
	.align 2, 0
_08095E30: .4byte gPlaySt
_08095E34: .4byte 0x0000038B
_08095E38:
	movs r0, #0x20
	ldrh r1, [r1, #6]
	ands r0, r1
	cmp r0, #0
	beq _08095E44
	str r2, [r4, #0x3c]
_08095E44:
	ldr r1, [r5]
	movs r0, #0x10
	ldrh r1, [r1, #6]
	ands r0, r1
	cmp r0, #0
	beq _08095E52
	str r6, [r4, #0x3c]
_08095E52:
	ldr r0, [r4, #0x3c]
	cmp r7, r0
	beq _08095E7A
	lsls r0, r0, #5
	adds r0, #0x94
	movs r3, #0x80
	lsls r3, r3, #4
	movs r1, #0x78
	movs r2, #0
	bl ShowSysHandCursor
	ldr r0, _08095E84 @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08095E7A
	ldr r0, _08095E88 @ =0x00000387
	bl m4aSongNumStart
_08095E7A:
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08095E84: .4byte gPlaySt
_08095E88: .4byte 0x00000387

	thumb_func_start PrepItemUse_HandleItemEffect
PrepItemUse_HandleItemEffect: @ 0x08095E8C
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, [r4, #0x2c]
	ldr r0, [r4, #0x30]
	lsls r0, r0, #1
	adds r1, #0x1e
	adds r1, r1, r0
	ldrh r0, [r1]
	bl GetItemIndex
	subs r0, #0x63
	cmp r0, #0x33
	bhi _08095F9E
	lsls r0, r0, #2
	ldr r1, _08095EB0 @ =_08095EB4
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08095EB0: .4byte _08095EB4
_08095EB4: @ jump table
	.4byte _08095F84 @ case 0
	.4byte _08095F84 @ case 1
	.4byte _08095F84 @ case 2
	.4byte _08095F84 @ case 3
	.4byte _08095F84 @ case 4
	.4byte _08095F9E @ case 5
	.4byte _08095F9E @ case 6
	.4byte _08095F9E @ case 7
	.4byte _08095F9E @ case 8
	.4byte _08095F9E @ case 9
	.4byte _08095F9E @ case 10
	.4byte _08095F9E @ case 11
	.4byte _08095F9E @ case 12
	.4byte _08095F9E @ case 13
	.4byte _08095F9E @ case 14
	.4byte _08095F9E @ case 15
	.4byte _08095F9E @ case 16
	.4byte _08095F9E @ case 17
	.4byte _08095F9E @ case 18
	.4byte _08095F9E @ case 19
	.4byte _08095F9E @ case 20
	.4byte _08095F9E @ case 21
	.4byte _08095F9E @ case 22
	.4byte _08095F9E @ case 23
	.4byte _08095F9E @ case 24
	.4byte _08095F9E @ case 25
	.4byte _08095F9E @ case 26
	.4byte _08095F9E @ case 27
	.4byte _08095F9E @ case 28
	.4byte _08095F9E @ case 29
	.4byte _08095F9E @ case 30
	.4byte _08095F9E @ case 31
	.4byte _08095F9E @ case 32
	.4byte _08095F9E @ case 33
	.4byte _08095F9E @ case 34
	.4byte _08095F9E @ case 35
	.4byte _08095F84 @ case 36
	.4byte _08095F9E @ case 37
	.4byte _08095F84 @ case 38
	.4byte _08095F9E @ case 39
	.4byte _08095F84 @ case 40
	.4byte _08095F9E @ case 41
	.4byte _08095F9E @ case 42
	.4byte _08095F9E @ case 43
	.4byte _08095F9E @ case 44
	.4byte _08095F9E @ case 45
	.4byte _08095F9E @ case 46
	.4byte _08095F9E @ case 47
	.4byte _08095F9E @ case 48
	.4byte _08095F9E @ case 49
	.4byte _08095F9E @ case 50
	.4byte _08095F84 @ case 51
_08095F84:
	ldr r0, _08095FA4 @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08095F96
	ldr r0, _08095FA8 @ =0x0000038A
	bl m4aSongNumStart
_08095F96:
	adds r0, r4, #0
	movs r1, #4
	bl Proc_Goto
_08095F9E:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08095FA4: .4byte gPlaySt
_08095FA8: .4byte 0x0000038A

	thumb_func_start PrepItemUse_ExecPromotionItem
PrepItemUse_ExecPromotionItem: @ 0x08095FAC
	push {r4, lr}
	adds r4, r0, #0
	bl EndMuralBackground_
	bl ResetText
	movs r0, #0
	bl InitBgs
	bl EndGreenText
	bl GetGameLock
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [r4, #0x40]
	bl InitFaces
	bl EndHelpPromptSprite
	ldr r3, _08096050 @ =gDispIo
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
	adds r2, #0x34
	movs r0, #0x20
	ldrb r1, [r2]
	orrs r1, r0
	strb r1, [r2]
	adds r1, r3, #0
	adds r1, #0x36
	ldrb r2, [r1]
	orrs r0, r2
	strb r0, [r1]
	adds r1, #6
	movs r0, #0x3f
	ldrb r2, [r1]
	ands r0, r2
	strb r0, [r1]
	adds r0, r3, #0
	adds r0, #0x44
	movs r1, #0
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r1, r3, #0
	adds r1, #0x46
	movs r0, #8
	strb r0, [r1]
	bl EndSysBrownBox
	bl EndAllParallelWorkers
	movs r0, #0
	bl EndFaceById
	movs r0, #0
	bl sub_80A998C
	ldr r0, [r4, #0x2c]
	ldr r1, [r4, #0x30]
	movs r2, #0
	bl sub_802D06C
	ldr r1, _08096054 @ =gBattleStats
	movs r0, #0x88
	lsls r0, r0, #1
	strh r0, [r1]
	bl BeginBattleAnimations
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08096050: .4byte gDispIo
_08096054: .4byte gBattleStats

	thumb_func_start PrepItemUse_WaitPromotionDone
PrepItemUse_WaitPromotionDone: @ 0x08096058
	push {r4, lr}
	adds r4, r0, #0
	bl GetGameLock
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r1, [r4, #0x40]
	cmp r1, r0
	bne _08096070
	adds r0, r4, #0
	bl Proc_Break
_08096070:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start PrepItemUse_PostPromotion
PrepItemUse_PostPromotion: @ 0x08096078
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x2c]
	bl GetUnitItemCount
	adds r1, r0, #0
	cmp r1, #0
	bne _08096092
	adds r0, r4, #0
	movs r1, #6
	bl Proc_Goto
	b _080960A2
_08096092:
	ldr r0, [r4, #0x30]
	cmp r0, r1
	blt _0809609C
	subs r0, #1
	str r0, [r4, #0x30]
_0809609C:
	adds r0, r4, #0
	bl Proc_Break
_080960A2:
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start PrepItemUse_ResetBgmAfterPromo
PrepItemUse_ResetBgmAfterPromo: @ 0x080960A8
	push {lr}
	sub sp, #4
	movs r2, #0x80
	lsls r2, r2, #1
	movs r0, #0
	str r0, [sp]
	movs r0, #0x49
	adds r1, r2, #0
	movs r3, #0x20
	bl CallSomeSoundMaybe
	add sp, #4
	pop {r0}
	bx r0

	thumb_func_start sub_80960C4
sub_80960C4: @ 0x080960C4
	push {lr}
	sub sp, #4
	movs r1, #0x80
	lsls r1, r1, #1
	movs r0, #0
	str r0, [sp]
	movs r2, #0
	movs r3, #0x10
	bl CallSomeSoundMaybe
	add sp, #4
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start StartPrepItemUseScreen
StartPrepItemUseScreen: @ 0x080960E0
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _080960F4 @ =ProcScr_PrepItemUseScreen
	bl Proc_StartBlocking
	str r4, [r0, #0x2c]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080960F4: .4byte ProcScr_PrepItemUseScreen

	thumb_func_start PrepItemUseBooster_OnDraw
PrepItemUseBooster_OnDraw: @ 0x080960F8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	adds r6, r0, #0
	adds r5, r1, #0
	adds r7, r2, #0
	adds r0, r3, #0
	bl DecodeMsg
	mov sb, r0
	ldr r0, [sp, #0x28]
	bl sub_8017808
	mov r8, r0
	mov r0, sb
	bl GetStringTextLen
	mov sl, r0
	mov r0, r8
	cmp r0, #0
	beq _08096144
	lsls r4, r7, #5
	adds r4, r4, r5
	lsls r4, r4, #1
	ldr r0, _080961B0 @ =gBg2Tm
	adds r4, r4, r0
	ldr r0, [sp, #0x28]
	bl sub_8017808
	adds r1, r0, #0
	movs r2, #0x80
	lsls r2, r2, #7
	adds r0, r4, #0
	bl PutIcon
_08096144:
	ldr r4, _080961B4 @ =0x02012A80
	adds r0, r4, #0
	bl ClearText
	lsls r0, r7, #5
	mov r1, r8
	cmp r1, #0
	beq _08096156
	adds r0, #2
_08096156:
	adds r0, r0, r5
	lsls r0, r0, #1
	ldr r1, _080961B0 @ =gBg2Tm
	adds r1, r0, r1
	movs r0, #0
	str r0, [sp]
	mov r0, sb
	str r0, [sp, #4]
	adds r0, r4, #0
	movs r2, #0
	movs r3, #0
	bl PutDrawText
	movs r0, #4
	bl EnableBgSync
	lsls r0, r5, #3
	subs r0, #4
	str r0, [r6, #0x40]
	lsls r0, r7, #3
	subs r0, #4
	str r0, [r6, #0x44]
	mov r0, sl
	cmp r0, #0
	bge _0809618A
	adds r0, #7
_0809618A:
	asrs r1, r0, #3
	adds r0, r1, #1
	str r0, [r6, #0x48]
	mov r0, r8
	cmp r0, #0
	beq _0809619A
	adds r0, r1, #3
	str r0, [r6, #0x48]
_0809619A:
	movs r0, #2
	str r0, [r6, #0x4c]
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080961B0: .4byte gBg2Tm
_080961B4: .4byte 0x02012A80

	thumb_func_start sub_80961B8
sub_80961B8: @ 0x080961B8
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r7, r0, #0
	ldr r4, [r7, #0x14]
	movs r0, #0xe0
	lsls r0, r0, #1
	movs r1, #3
	movs r2, #0
	adds r3, r7, #0
	bl sub_8074C70
	ldr r0, [r4, #0x2c]
	bl GetUnitCurrentHp
	adds r1, r7, #0
	adds r1, #0x30
	strb r0, [r1]
	ldr r0, [r4, #0x2c]
	bl GetUnitPower
	adds r1, r7, #0
	adds r1, #0x31
	strb r0, [r1]
	ldr r0, [r4, #0x2c]
	bl GetUnitSkill
	adds r1, r7, #0
	adds r1, #0x32
	strb r0, [r1]
	ldr r0, [r4, #0x2c]
	bl GetUnitSpeed
	adds r1, r7, #0
	adds r1, #0x33
	strb r0, [r1]
	ldr r0, [r4, #0x2c]
	bl GetUnitLuck
	adds r1, r7, #0
	adds r1, #0x34
	strb r0, [r1]
	ldr r0, [r4, #0x2c]
	bl GetUnitDefense
	adds r1, r7, #0
	adds r1, #0x35
	strb r0, [r1]
	ldr r0, [r4, #0x2c]
	bl GetUnitResistance
	adds r1, r7, #0
	adds r1, #0x36
	strb r0, [r1]
	ldr r1, [r4, #0x2c]
	ldr r2, [r1, #4]
	ldr r0, [r1]
	ldrb r2, [r2, #0x11]
	ldrb r0, [r0, #0x13]
	adds r0, r2, r0
	ldrb r1, [r1, #0x1a]
	adds r0, r1, r0
	adds r1, r7, #0
	adds r1, #0x37
	strb r0, [r1]
	ldr r0, [r4, #0x2c]
	ldr r1, [r4, #0x30]
	lsls r3, r1, #1
	adds r2, r0, #0
	adds r2, #0x1e
	adds r2, r2, r3
	ldrh r5, [r2]
	bl sub_802D1E8
	adds r6, r0, #0
	ldr r0, [r4, #0x2c]
	movs r1, #0
	bl sub_8095430
	ldr r0, [r4, #0x2c]
	bl sub_80955D0
	ldr r0, [r4, #0x2c]
	bl GetUnitCurrentHp
	adds r1, r7, #0
	adds r1, #0x38
	strb r0, [r1]
	ldr r0, [r4, #0x2c]
	bl GetUnitPower
	adds r1, r7, #0
	adds r1, #0x39
	strb r0, [r1]
	ldr r0, [r4, #0x2c]
	bl GetUnitSkill
	adds r1, r7, #0
	adds r1, #0x3a
	strb r0, [r1]
	ldr r0, [r4, #0x2c]
	bl GetUnitSpeed
	adds r1, r7, #0
	adds r1, #0x3b
	strb r0, [r1]
	ldr r0, [r4, #0x2c]
	bl GetUnitLuck
	adds r1, r7, #0
	adds r1, #0x3c
	strb r0, [r1]
	ldr r0, [r4, #0x2c]
	bl GetUnitDefense
	adds r1, r7, #0
	adds r1, #0x3d
	strb r0, [r1]
	ldr r0, [r4, #0x2c]
	bl GetUnitResistance
	adds r1, r7, #0
	adds r1, #0x3e
	strb r0, [r1]
	ldr r1, [r4, #0x2c]
	ldr r2, [r1, #4]
	ldr r0, [r1]
	ldrb r2, [r2, #0x11]
	ldrb r0, [r0, #0x13]
	adds r0, r2, r0
	ldrb r1, [r1, #0x1a]
	adds r0, r1, r0
	adds r1, r7, #0
	adds r1, #0x3f
	strb r0, [r1]
	str r5, [sp]
	adds r0, r7, #0
	movs r1, #0x11
	movs r2, #0xe
	adds r3, r6, #0
	bl PrepItemUseBooster_OnDraw
	movs r4, #0
_080962D4:
	adds r0, r7, #0
	adds r0, #0x30
	adds r3, r0, r4
	adds r0, #8
	adds r2, r0, r4
	ldrb r0, [r3]
	ldrb r1, [r2]
	cmp r0, r1
	beq _08096302
	asrs r1, r4, #2
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #4
	adds r0, #0xb8
	movs r1, #3
	ands r1, r4
	lsls r1, r1, #4
	adds r1, #0x32
	ldrb r2, [r2]
	ldrb r3, [r3]
	subs r2, r2, r3
	bl sub_8074F40
_08096302:
	adds r4, #1
	cmp r4, #7
	ble _080962D4
	movs r0, #0x78
	str r0, [r7, #0x2c]
	ldr r0, _08096328 @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0809631E
	ldr r0, _0809632C @ =0x0000037A
	bl m4aSongNumStart
_0809631E:
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08096328: .4byte gPlaySt
_0809632C: .4byte 0x0000037A

	thumb_func_start sub_8096330
sub_8096330: @ 0x08096330
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	ldr r0, [r5, #0x40]
	ldr r1, [r5, #0x44]
	ldr r2, [r5, #0x48]
	ldr r3, [r5, #0x4c]
	ldr r4, _0809636C @ =0x0000A580
	str r4, [sp]
	bl sub_80935C4
	ldr r0, [r5, #0x2c]
	subs r0, #1
	str r0, [r5, #0x2c]
	cmp r0, #0
	beq _0809635E
	ldr r0, _08096370 @ =gpKeySt
	ldr r1, [r0]
	movs r0, #3
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _08096364
_0809635E:
	adds r0, r5, #0
	bl Proc_Break
_08096364:
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0809636C: .4byte 0x0000A580
_08096370: .4byte gpKeySt

	thumb_func_start sub_8096374
sub_8096374: @ 0x08096374
	push {r4, r5, lr}
	ldr r4, [r0, #0x14]
	ldr r0, [r4, #0x2c]
	bl GetUnitItemCount
	adds r5, r0, #0
	ldr r0, _0809639C @ =gBg2Tm + 0x3a2
	movs r1, #0xc
	movs r2, #1
	movs r3, #0
	bl TmFillRect_thm
	cmp r5, #0
	bne _080963A0
	adds r0, r4, #0
	movs r1, #5
	bl Proc_Goto
	b _080963BC
	.align 2, 0
_0809639C: .4byte gBg2Tm + 0x3a2
_080963A0:
	ldr r0, [r4, #0x30]
	cmp r0, r5
	blt _080963AA
	subs r0, #1
	str r0, [r4, #0x30]
_080963AA:
	ldr r1, [r4, #0x30]
	lsls r1, r1, #4
	adds r1, #0x48
	movs r3, #0x80
	lsls r3, r3, #4
	movs r0, #0x10
	movs r2, #0xb
	bl ShowSysHandCursor
_080963BC:
	ldr r0, _080963F0 @ =gBg0Tm + 0x244
	ldr r1, _080963F4 @ =0x02012A20
	ldr r2, [r4, #0x2c]
	movs r3, #1
	bl sub_8094AC0
	ldr r0, [r4, #0x2c]
	ldr r1, [r4, #0x30]
	bl sub_8095750
	movs r0, #0
	bl sub_80A998C
	bl sub_8074D38
	movs r0, #5
	bl EnableBgSync
	ldr r0, _080963F8 @ =0x06014000
	movs r1, #1
	rsbs r1, r1, #0
	bl LoadHelpBoxGfx
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080963F0: .4byte gBg0Tm + 0x244
_080963F4: .4byte 0x02012A20
_080963F8: .4byte 0x06014000

	thumb_func_start sub_80963FC
sub_80963FC: @ 0x080963FC
	push {r4, r5, r6, lr}
	sub sp, #4
	ldr r6, _08096428 @ =0x0000DFC0
	movs r5, #0x30
	movs r4, #3
_08096406:
	str r6, [sp]
	movs r0, #4
	adds r1, r5, #0
	movs r2, #0x10
	ldr r3, _0809642C @ =Sprite_32x16
	bl PutSpriteExt
	adds r6, #4
	adds r5, #0x20
	subs r4, #1
	cmp r4, #0
	bge _08096406
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08096428: .4byte 0x0000DFC0
_0809642C: .4byte Sprite_32x16

	thumb_func_start sub_8096430
sub_8096430: @ 0x08096430
	push {r4, lr}
	sub sp, #4
	adds r4, r0, #0
	ldr r0, _0809645C @ =sub_80963FC
	bl StartParallelWorker
	movs r0, #0xf0
	lsls r0, r0, #7
	ldr r1, _08096460 @ =gUnk_08D8D10C
	lsls r4, r4, #2
	adds r4, r4, r1
	ldr r2, [r4]
	movs r1, #0
	str r1, [sp]
	movs r1, #0xd
	movs r3, #1
	bl NewSysboxText
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0809645C: .4byte sub_80963FC
_08096460: .4byte gUnk_08D8D10C

	thumb_func_start sub_8096464
sub_8096464: @ 0x08096464
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08096490 @ =gUnk_0841E7F4
	lsls r1, r1, #5
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r0, _08096494 @ =gUnk_0841E49C
	movs r2, #0xc0
	lsls r2, r2, #0x13
	adds r1, r4, r2
	bl Decompress
	ldr r0, _08096498 @ =gUnk_0841E634
	ldr r1, _0809649C @ =0x06000200
	adds r4, r4, r1
	adds r1, r4, #0
	bl Decompress
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08096490: .4byte gUnk_0841E7F4
_08096494: .4byte gUnk_0841E49C
_08096498: .4byte gUnk_0841E634
_0809649C: .4byte 0x06000200

	thumb_func_start sub_80964A0
sub_80964A0: @ 0x080964A0
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	str r0, [sp]
	mov sl, r1
	str r2, [sp, #4]
	str r3, [sp, #8]
	mov r0, sl
	movs r1, #0xc
	movs r2, #0x1f
	movs r3, #0
	bl TmFillRect_thm
	ldr r1, _080964E8 @ =0x02012466
	ldrh r0, [r1]
	cmp r0, #0
	bne _080964F0
	ldr r0, [sp]
	bl ClearText
	ldr r3, _080964EC @ =gUnk_0842D0C4
	ldr r0, [sp]
	movs r1, #0
	movs r2, #1
	bl Text_InsertDrawString
	mov r1, sl
	adds r1, #6
	ldr r0, [sp]
	bl PutText
	b _0809659A
	.align 2, 0
_080964E8: .4byte 0x02012466
_080964EC: .4byte gUnk_0842D0C4
_080964F0:
	ldr r6, [sp, #4]
	adds r0, r6, #7
	cmp r6, r0
	bge _0809659A
	ldrh r1, [r1]
	cmp r6, r1
	bge _0809659A
_080964FE:
	movs r0, #7
	ands r0, r6
	lsls r0, r0, #3
	ldr r1, [sp]
	adds r1, r1, r0
	mov r8, r1
	ldr r1, _080965AC @ =0x020117E4
	lsls r0, r6, #2
	adds r0, r0, r1
	ldrh r7, [r0, #2]
	ldr r0, [sp, #8]
	adds r1, r7, #0
	bl IsItemDisplayUsable
	movs r1, #0
	mov sb, r1
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08096528
	movs r0, #1
	mov sb, r0
_08096528:
	mov r0, r8
	bl ClearText
	adds r0, r7, #0
	bl GetItemName
	adds r3, r0, #0
	mov r0, r8
	movs r1, #0
	mov r2, sb
	bl Text_InsertDrawString
	lsls r5, r6, #1
	movs r0, #0x1f
	ands r5, r0
	lsls r5, r5, #6
	adds r4, r5, #2
	add r4, sl
	adds r0, r7, #0
	bl sub_8017808
	adds r1, r0, #0
	adds r0, r4, #0
	movs r2, #0x80
	lsls r2, r2, #7
	bl PutIcon
	adds r1, r5, #6
	add r1, sl
	mov r0, r8
	bl PutText
	adds r5, #0x18
	mov r1, sl
	adds r4, r1, r5
	movs r5, #1
	mov r0, sb
	cmp r0, #0
	bne _08096578
	movs r5, #2
_08096578:
	adds r0, r7, #0
	bl GetItemUses
	adds r2, r0, #0
	adds r0, r4, #0
	adds r1, r5, #0
	bl PutNumberOrBlank
	adds r6, #1
	ldr r0, [sp, #4]
	adds r0, #7
	cmp r6, r0
	bge _0809659A
	ldr r0, _080965B0 @ =0x02012466
	ldrh r0, [r0]
	cmp r6, r0
	blt _080964FE
_0809659A:
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080965AC: .4byte 0x020117E4
_080965B0: .4byte 0x02012466

	thumb_func_start sub_80965B4
sub_80965B4: @ 0x080965B4
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	mov r8, r0
	adds r5, r1, #0
	adds r7, r5, #0
	adds r0, r5, #7
	cmp r5, r0
	bge _08096604
	ldr r0, _08096610 @ =0x02012466
	ldrh r0, [r0]
	cmp r5, r0
	bge _08096604
	ldr r1, _08096614 @ =0x020117E4
	lsls r0, r5, #2
	adds r6, r0, r1
_080965D4:
	ldrh r0, [r6, #2]
	lsls r4, r5, #1
	movs r1, #0x1f
	ands r4, r1
	lsls r4, r4, #6
	adds r4, #2
	add r4, r8
	bl sub_8017808
	adds r1, r0, #0
	adds r0, r4, #0
	movs r2, #0x80
	lsls r2, r2, #7
	bl PutIcon
	adds r6, #4
	adds r5, #1
	adds r0, r7, #7
	cmp r5, r0
	bge _08096604
	ldr r0, _08096610 @ =0x02012466
	ldrh r0, [r0]
	cmp r5, r0
	blt _080965D4
_08096604:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08096610: .4byte 0x02012466
_08096614: .4byte 0x020117E4

	thumb_func_start sub_8096618
sub_8096618: @ 0x08096618
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	adds r5, r0, #0
	mov sb, r1
	ldr r0, _080966C4 @ =0x02012466
	ldrh r0, [r0]
	cmp r0, r2
	ble _080966B8
	lsls r4, r2, #1
	movs r0, #0x1f
	ands r4, r0
	movs r0, #7
	ands r0, r2
	lsls r0, r0, #3
	adds r7, r5, r0
	ldr r1, _080966C8 @ =0x020117E4
	lsls r0, r2, #2
	adds r0, r0, r1
	ldrh r6, [r0, #2]
	adds r0, r3, #0
	adds r1, r6, #0
	bl IsItemDisplayUsable
	movs r1, #0
	mov r8, r1
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08096658
	movs r0, #1
	mov r8, r0
_08096658:
	lsls r4, r4, #6
	add r4, sb
	adds r0, r4, #0
	movs r1, #0xc
	movs r2, #1
	movs r3, #0
	bl TmFillRect_thm
	adds r0, r7, #0
	bl ClearText
	adds r0, r6, #0
	bl GetItemName
	adds r3, r0, #0
	adds r0, r7, #0
	movs r1, #0
	mov r2, r8
	bl Text_InsertDrawString
	adds r5, r4, #2
	adds r0, r6, #0
	bl sub_8017808
	adds r1, r0, #0
	movs r2, #0x80
	lsls r2, r2, #7
	adds r0, r5, #0
	bl PutIcon
	adds r1, r4, #6
	adds r0, r7, #0
	bl PutText
	adds r4, #0x18
	movs r5, #1
	mov r1, r8
	cmp r1, #0
	bne _080966A8
	movs r5, #2
_080966A8:
	adds r0, r6, #0
	bl GetItemUses
	adds r2, r0, #0
	adds r0, r4, #0
	adds r1, r5, #0
	bl PutNumberOrBlank
_080966B8:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080966C4: .4byte 0x02012466
_080966C8: .4byte 0x020117E4

	thumb_func_start sub_80966CC
sub_80966CC: @ 0x080966CC
	ldr r0, _08096700 @ =0x04000006
	ldrh r0, [r0]
	adds r0, #1
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	cmp r2, #0xa0
	bls _080966DC
	movs r2, #0
_080966DC:
	cmp r2, #0xc
	bne _080966EC
	ldr r1, _08096704 @ =0x04000050
	movs r0, #0xc8
	strh r0, [r1]
	adds r1, #4
	movs r0, #8
	strh r0, [r1]
_080966EC:
	cmp r2, #0x34
	beq _080966F4
	cmp r2, #0
	bne _080966FE
_080966F4:
	ldr r0, _08096704 @ =0x04000050
	movs r1, #0
	strh r1, [r0]
	adds r0, #4
	strh r1, [r0]
_080966FE:
	bx lr
	.align 2, 0
_08096700: .4byte 0x04000006
_08096704: .4byte 0x04000050

	thumb_func_start sub_8096708
sub_8096708: @ 0x08096708
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0
	strh r0, [r4, #0x38]
	movs r0, #0xff
	strh r0, [r4, #0x36]
	ldr r0, [r4, #0x2c]
	bl GetUnitItemCount
	cmp r0, #0
	bne _08096726
	adds r1, r4, #0
	adds r1, #0x33
	movs r0, #1
	b _0809672C
_08096726:
	adds r1, r4, #0
	adds r1, #0x33
	movs r0, #0
_0809672C:
	strb r0, [r1]
	adds r0, r4, #0
	adds r0, #0x30
	ldrb r0, [r0]
	cmp r0, #0
	bne _0809674C
	ldr r0, _08096748 @ =gUnk_08D8C154
	bl Proc_Find
	adds r0, #0x32
	ldrb r0, [r0]
	adds r1, r4, #0
	adds r1, #0x35
	b _08096752
	.align 2, 0
_08096748: .4byte gUnk_08D8C154
_0809674C:
	adds r1, r4, #0
	adds r1, #0x35
	movs r0, #0
_08096752:
	strb r0, [r1]
	adds r2, r4, #0
	adds r2, #0x32
	movs r1, #0
	movs r0, #4
	strb r0, [r2]
	adds r0, r4, #0
	adds r0, #0x31
	strb r1, [r0]
	movs r3, #0
	adds r1, r4, #0
	adds r1, #0x4c
	adds r0, #9
	movs r2, #8
_0809676E:
	strh r3, [r0]
	strh r3, [r1]
	adds r1, #2
	adds r0, #2
	subs r2, #1
	cmp r2, #0
	bge _0809676E
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_8096784
sub_8096784: @ 0x08096784
	push {r4, lr}
	ldr r4, _080967B4 @ =0x02012B50
	ldr r1, _080967B8 @ =0x06011000
	adds r0, r4, #0
	movs r2, #0xb
	bl InitSpriteTextFont
	ldr r0, _080967BC @ =Pal_Text
	movs r1, #0xd8
	lsls r1, r1, #2
	movs r2, #0x20
	bl ApplyPaletteExt
	adds r4, #0x90
	adds r0, r4, #0
	bl InitSpriteText
	movs r0, #0
	bl SetTextFont
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080967B4: .4byte 0x02012B50
_080967B8: .4byte 0x06011000
_080967BC: .4byte Pal_Text

	thumb_func_start sub_80967C0
sub_80967C0: @ 0x080967C0
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	bl sub_809158C
	adds r5, r0, #0
	lsls r5, r5, #0x18
	lsrs r5, r5, #0x18
	ldr r0, [r4, #0x2c]
	bl GetUnitItemCount
	adds r6, r0, #0
	ldr r4, _08096824 @ =0x02012B50
	adds r0, r4, #0
	bl SetTextFont
	movs r0, #0
	bl SetTextFontGlyphs
	adds r4, #0x90
	adds r0, r4, #0
	movs r1, #0
	bl SpriteText_DrawBackgroundExt
	adds r0, r4, #0
	movs r2, #0
	cmp r5, #0x64
	beq _080967FA
	cmp r6, #0
	bne _080967FC
_080967FA:
	movs r2, #1
_080967FC:
	ldr r3, _08096828 @ =gUnk_0842D0D4
	movs r1, #0
	bl Text_InsertDrawString
	ldr r0, _0809682C @ =0x02012BE0
	movs r2, #0
	cmp r6, #5
	bne _0809680E
	movs r2, #1
_0809680E:
	ldr r3, _08096830 @ =gUnk_0842D0E0
	movs r1, #0x40
	bl Text_InsertDrawString
	movs r0, #0
	bl SetTextFont
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08096824: .4byte 0x02012B50
_08096828: .4byte gUnk_0842D0D4
_0809682C: .4byte 0x02012BE0
_08096830: .4byte gUnk_0842D0E0

	thumb_func_start sub_8096834
sub_8096834: @ 0x08096834
	push {r4, r5, r6, lr}
	sub sp, #8
	movs r0, #0
	bl SetTextFont
	ldr r6, _080968D8 @ =gBg0Tm + 0x68
	adds r0, r6, #0
	movs r1, #0xc
	movs r2, #1
	movs r3, #0
	bl TmFillRect_thm
	ldr r4, _080968DC @ =0x02012B68
	adds r1, r6, #0
	adds r1, #0xda
	movs r5, #0
	str r5, [sp]
	ldr r0, _080968E0 @ =gUnk_0842D0EC
	str r0, [sp, #4]
	adds r0, r4, #0
	movs r2, #0
	movs r3, #2
	bl PutDrawText
	adds r1, r6, #0
	subs r1, #0x26
	movs r2, #0x9c
	lsls r2, r2, #2
	movs r0, #1
	str r0, [sp]
	movs r0, #0x4a
	movs r3, #2
	bl PutFaceChibi
	adds r4, #8
	str r5, [sp]
	ldr r0, _080968E4 @ =gUnk_0842D0F4
	str r0, [sp, #4]
	adds r0, r4, #0
	adds r1, r6, #0
	movs r2, #0
	movs r3, #0
	bl PutDrawText
	adds r5, r6, #0
	adds r5, #0xa
	bl sub_809158C
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r4, #2
	cmp r0, #0x64
	bne _080968A0
	movs r4, #4
_080968A0:
	bl sub_809158C
	adds r2, r0, #0
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	adds r0, r5, #0
	adds r1, r4, #0
	bl PutNumber
	adds r0, r6, #0
	adds r0, #0xc
	movs r1, #0
	movs r2, #0x16
	bl PutSpecialChar
	adds r0, r6, #0
	adds r0, #0x12
	movs r1, #2
	movs r2, #0x64
	bl PutNumber
	movs r0, #1
	bl EnableBgSync
	add sp, #8
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080968D8: .4byte gBg0Tm + 0x68
_080968DC: .4byte 0x02012B68
_080968E0: .4byte gUnk_0842D0EC
_080968E4: .4byte gUnk_0842D0F4

	thumb_func_start sub_80968E8
sub_80968E8: @ 0x080968E8
	push {r4, lr}
	sub sp, #4
	ldr r0, _08096928 @ =0x0000A980
	str r0, [sp]
	movs r0, #0x40
	movs r1, #0x22
	movs r2, #5
	movs r3, #4
	bl sub_80935C4
	ldr r4, _0809692C @ =Sprite_32x16
	ldr r0, _08096930 @ =0x0000B080
	str r0, [sp]
	movs r0, #4
	movs r1, #0x48
	movs r2, #0x26
	adds r3, r4, #0
	bl PutSpriteExt
	ldr r0, _08096934 @ =0x0000B088
	str r0, [sp]
	movs r0, #4
	movs r1, #0x48
	movs r2, #0x36
	adds r3, r4, #0
	bl PutSpriteExt
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08096928: .4byte 0x0000A980
_0809692C: .4byte Sprite_32x16
_08096930: .4byte 0x0000B080
_08096934: .4byte 0x0000B088

	thumb_func_start sub_8096938
sub_8096938: @ 0x08096938
	push {lr}
	sub sp, #4
	ldr r0, _08096964 @ =0x0000A980
	str r0, [sp]
	movs r0, #0x40
	movs r1, #0x22
	movs r2, #5
	movs r3, #2
	bl sub_80935C4
	ldr r3, _08096968 @ =Sprite_32x16
	ldr r0, _0809696C @ =0x0000B080
	str r0, [sp]
	movs r0, #4
	movs r1, #0x48
	movs r2, #0x26
	bl PutSpriteExt
	add sp, #4
	pop {r0}
	bx r0
	.align 2, 0
_08096964: .4byte 0x0000A980
_08096968: .4byte Sprite_32x16
_0809696C: .4byte 0x0000B080

	thumb_func_start sub_8096970
sub_8096970: @ 0x08096970
	push {lr}
	sub sp, #4
	ldr r0, _0809699C @ =0x0000A980
	str r0, [sp]
	movs r0, #0x40
	movs r1, #0x32
	movs r2, #5
	movs r3, #2
	bl sub_80935C4
	ldr r3, _080969A0 @ =Sprite_32x16
	ldr r0, _080969A4 @ =0x0000B088
	str r0, [sp]
	movs r0, #4
	movs r1, #0x48
	movs r2, #0x36
	bl PutSpriteExt
	add sp, #4
	pop {r0}
	bx r0
	.align 2, 0
_0809699C: .4byte 0x0000A980
_080969A0: .4byte Sprite_32x16
_080969A4: .4byte 0x0000B088

	thumb_func_start sub_80969A8
sub_80969A8: @ 0x080969A8
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r6, r0, #0
	adds r7, r6, #0
	adds r7, #0x35
	ldrb r0, [r7]
	lsls r4, r0, #1
	adds r4, r4, r0
	lsls r4, r4, #2
	adds r4, #0x7c
	bl GetGameTime
	ldr r2, _08096A20 @ =gPal
	lsrs r0, r0, #2
	movs r1, #0xf
	ands r0, r1
	lsls r0, r0, #1
	ldr r1, _08096A24 @ =gUnk_08421C24
	adds r0, r0, r1
	ldrh r0, [r0]
	ldr r1, _08096A28 @ =0x000002DA
	adds r2, r2, r1
	strh r0, [r2]
	bl EnablePalSync
	ldr r1, _08096A2C @ =gUnk_08D8D4F8
	ldrb r2, [r7]
	lsls r0, r2, #2
	adds r0, r0, r1
	ldr r3, [r0]
	movs r5, #0xc5
	lsls r5, r5, #7
	str r5, [sp]
	movs r0, #4
	adds r1, r4, #0
	movs r2, #0x18
	bl PutSprite
	ldr r3, _08096A30 @ =gUnk_08D8D4E8
	str r5, [sp]
	movs r0, #4
	adds r1, r4, #0
	movs r2, #0x18
	bl PutSprite
	ldrb r7, [r7]
	lsls r0, r7, #1
	adds r6, #0x4c
	adds r6, r6, r0
	ldrh r1, [r6]
	ldr r0, _08096A34 @ =0x02012466
	ldrh r2, [r0]
	movs r0, #0xb
	movs r3, #7
	bl sub_8090E04
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08096A20: .4byte gPal
_08096A24: .4byte gUnk_08421C24
_08096A28: .4byte 0x000002DA
_08096A2C: .4byte gUnk_08D8D4F8
_08096A30: .4byte gUnk_08D8D4E8
_08096A34: .4byte 0x02012466

	thumb_func_start sub_8096A38
sub_8096A38: @ 0x08096A38
	push {r4, r5, r6, lr}
	movs r5, #0
	lsls r2, r2, #0xc
	ldr r4, _08096A74 @ =0x0001FFFF
	adds r3, r1, #0
	ands r3, r4
	lsrs r3, r3, #5
	adds r6, r2, r3
	movs r3, #0x80
	lsls r3, r3, #2
	adds r1, r1, r3
	ands r1, r4
	lsrs r1, r1, #5
	adds r2, r2, r1
	adds r3, r0, #0
	adds r3, #0x40
	adds r1, r0, #0
_08096A5A:
	adds r0, r6, r5
	strh r0, [r1]
	adds r0, r2, r5
	strh r0, [r3]
	adds r3, #2
	adds r1, #2
	adds r5, #1
	cmp r5, #0xe
	ble _08096A5A
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08096A74: .4byte 0x0001FFFF

	thumb_func_start sub_8096A78
sub_8096A78: @ 0x08096A78
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	mov sl, r0
	ldr r7, _08096D54 @ =gDispIo
	movs r0, #8
	rsbs r0, r0, #0
	ldrb r1, [r7]
	ands r0, r1
	strb r0, [r7]
	movs r0, #0
	bl InitBgs
	movs r0, #0
	bl GetBgTilemap
	movs r1, #0
	bl TmFill
	movs r0, #1
	bl GetBgTilemap
	movs r1, #0
	bl TmFill
	movs r0, #2
	bl GetBgTilemap
	movs r1, #0
	bl TmFill
	movs r1, #4
	rsbs r1, r1, #0
	adds r0, r1, #0
	ldrb r2, [r7, #0xc]
	ands r0, r2
	movs r4, #1
	orrs r0, r4
	strb r0, [r7, #0xc]
	adds r0, r1, #0
	ldrb r6, [r7, #0x10]
	ands r0, r6
	movs r2, #2
	mov sb, r2
	mov r6, sb
	orrs r0, r6
	strb r0, [r7, #0x10]
	ldrb r0, [r7, #0x14]
	ands r1, r0
	strb r1, [r7, #0x14]
	movs r0, #3
	ldrb r1, [r7, #0x18]
	orrs r0, r1
	strb r0, [r7, #0x18]
	bl InitFaces
	bl ResetText
	bl InitIcons
	bl UnpackUiWindowFrameGraphics
	bl ApplySystemObjectsGraphics
	movs r0, #0
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	movs r0, #1
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	mov r0, sl
	adds r0, #0x35
	ldrb r0, [r0]
	lsls r1, r0, #1
	mov r0, sl
	adds r0, #0x4c
	adds r0, r0, r1
	ldrh r2, [r0]
	subs r2, #0x28
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	movs r0, #2
	movs r1, #0
	bl SetBgOffset
	ldr r0, _08096D58 @ =0x06016000
	movs r1, #1
	rsbs r1, r1, #0
	bl LoadHelpBoxGfx
	movs r0, #4
	bl ApplyIconPalettes
	bl sub_808ED8C
	movs r0, #0xa0
	lsls r0, r0, #7
	movs r1, #5
	bl sub_809228C
	movs r0, #0xc0
	lsls r0, r0, #6
	movs r1, #0xa
	bl sub_80922DC
	ldr r0, _08096D5C @ =gBg1Tm
	ldr r1, _08096D60 @ =gUnk_0842A0A4
	movs r2, #0xa5
	lsls r2, r2, #7
	bl TmApplyTsa_thm
	movs r0, #7
	bl EnableBgSync
	movs r1, #0xe0
	lsls r1, r1, #4
	movs r3, #0xc0
	lsls r3, r3, #4
	movs r2, #0
	mov r8, r2
	str r2, [sp]
	mov r6, sl
	str r6, [sp, #4]
	movs r0, #0xd
	movs r2, #0xf
	bl StartSysBrownBox
	movs r0, #0
	movs r1, #0x98
	movs r2, #6
	movs r3, #2
	bl EnableSysBrownBox
	ldr r0, [r6, #0x2c]
	ldr r0, [r0]
	ldrh r0, [r0]
	bl DecodeMsg
	mov r0, sl
	bl sub_80A98C8
	mov r0, sl
	bl ResetSysHandCursor
	movs r0, #0xc0
	lsls r0, r0, #3
	movs r1, #1
	bl DisplaySysHandCursorTextShadow
	movs r5, #0x20
	ldrb r0, [r7, #1]
	orrs r0, r5
	movs r1, #0x41
	rsbs r1, r1, #0
	ands r0, r1
	movs r1, #0x7f
	ands r0, r1
	strb r0, [r7, #1]
	adds r1, r7, #0
	adds r1, #0x2d
	movs r0, #0x80
	strb r0, [r1]
	adds r1, #4
	movs r0, #0x28
	strb r0, [r1]
	subs r1, #5
	movs r0, #0xe0
	strb r0, [r1]
	adds r1, #4
	movs r0, #0x98
	strb r0, [r1]
	ldr r1, _08096D64 @ =0x030027C4
	ldrb r0, [r1]
	orrs r0, r4
	mov r2, sb
	orrs r0, r2
	movs r1, #4
	orrs r0, r1
	movs r3, #8
	orrs r0, r3
	movs r2, #0x10
	orrs r0, r2
	movs r6, #0x36
	adds r6, r6, r7
	mov ip, r6
	ldrb r1, [r6]
	orrs r4, r1
	mov r6, sb
	orrs r4, r6
	movs r1, #5
	rsbs r1, r1, #0
	ands r4, r1
	orrs r4, r3
	orrs r4, r2
	orrs r0, r5
	ldr r1, _08096D64 @ =0x030027C4
	strb r0, [r1]
	orrs r4, r5
	mov r2, ip
	strb r4, [r2]
	adds r1, r7, #0
	adds r1, #0x3c
	movs r0, #0x3f
	ldrb r6, [r1]
	ands r0, r6
	strb r0, [r1]
	adds r0, r7, #0
	adds r0, #0x44
	mov r1, r8
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r1, r7, #0
	adds r1, #0x46
	movs r0, #8
	strb r0, [r1]
	mov r0, sl
	bl StartGreenText
	movs r0, #0xc8
	movs r1, #0x90
	mov r2, sl
	bl StartHelpPromptSprite
	ldr r4, _08096D68 @ =0x02012B68
	adds r0, r4, #0
	movs r1, #4
	bl InitText
	adds r0, r4, #0
	adds r0, #8
	movs r1, #3
	bl InitText
	bl sub_8096784
	adds r4, #0x10
	movs r5, #4
_08096C62:
	adds r0, r4, #0
	movs r1, #7
	bl InitText
	adds r4, #8
	subs r5, #1
	cmp r5, #0
	bge _08096C62
	mov r6, sl
	adds r6, #0x35
	mov r7, sl
	adds r7, #0x4c
	ldr r4, _08096D6C @ =0x02012BA0
	movs r5, #7
_08096C7E:
	adds r0, r4, #0
	movs r1, #7
	bl sub_800536C
	adds r4, #8
	subs r5, #1
	cmp r5, #0
	bge _08096C7E
	movs r0, #0
	bl SetOnHBlankA
	ldr r0, _08096D70 @ =sub_80966CC
	bl SetOnHBlankA
	movs r4, #0x80
	lsls r4, r4, #7
	adds r0, r4, #0
	movs r1, #6
	bl sub_8096464
	ldr r5, _08096D74 @ =gBg0Tm + 0xde
	adds r0, r5, #0
	adds r1, r4, #0
	movs r2, #6
	bl sub_8096A38
	ldr r0, _08096D78 @ =gUnk_0841E0A4
	ldr r1, _08096D7C @ =0x06015000
	bl Decompress
	mov r0, sl
	bl sub_8090DD0
	movs r0, #0xb0
	lsls r0, r0, #7
	movs r1, #6
	bl sub_8090E38
	movs r0, #0xe2
	movs r1, #0x30
	bl sub_8090DE4
	bl sub_8090DA0
	mov r2, sl
	ldr r0, [r2, #0x2c]
	ldrb r1, [r6]
	movs r2, #1
	bl sub_8091A74
	ldr r4, _08096D6C @ =0x02012BA0
	ldr r1, _08096D80 @ =gBg2Tm + 0x1e
	ldrb r6, [r6]
	lsls r0, r6, #1
	adds r0, r7, r0
	ldrh r0, [r0]
	lsrs r2, r0, #4
	mov r6, sl
	ldr r3, [r6, #0x2c]
	adds r0, r4, #0
	bl sub_80964A0
	movs r0, #4
	bl EnableBgSync
	movs r0, #0xb3
	lsls r0, r0, #1
	adds r5, r5, r0
	subs r4, #0x28
	ldr r2, [r6, #0x2c]
	adds r0, r5, #0
	adds r1, r4, #0
	movs r3, #0
	bl sub_8094AC0
	bl sub_8096834
	mov r0, sl
	bl StartUiSpinningArrows
	movs r1, #0xa0
	lsls r1, r1, #2
	movs r0, #0
	movs r2, #2
	bl LoadUiSpinningArrowGfx
	movs r0, #0x78
	movs r1, #0x18
	movs r2, #0xea
	movs r3, #0x18
	bl SetUiSpinningArrowPositions
	movs r0, #3
	bl SetUiSpinningArrowConfig
	ldr r0, _08096D84 @ =sub_80969A8
	mov r1, sl
	bl StartParallelWorker
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08096D54: .4byte gDispIo
_08096D58: .4byte 0x06016000
_08096D5C: .4byte gBg1Tm
_08096D60: .4byte gUnk_0842A0A4
_08096D64: .4byte 0x030027C4
_08096D68: .4byte 0x02012B68
_08096D6C: .4byte 0x02012BA0
_08096D70: .4byte sub_80966CC
_08096D74: .4byte gBg0Tm + 0xde
_08096D78: .4byte gUnk_0841E0A4
_08096D7C: .4byte 0x06015000
_08096D80: .4byte gBg2Tm + 0x1e
_08096D84: .4byte sub_80969A8

	thumb_func_start sub_8096D88
sub_8096D88: @ 0x08096D88
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0
	adds r1, r4, #0
	bl sub_8096430
	movs r0, #0
	bl sub_80A998C
	adds r0, r4, #0
	bl sub_80967C0
	adds r0, r4, #0
	adds r0, #0x33
	ldrb r0, [r0]
	lsls r1, r0, #4
	adds r1, #0x24
	movs r3, #0x80
	lsls r3, r3, #3
	movs r0, #0x44
	movs r2, #4
	bl ShowSysHandCursor
	ldr r0, _08096DE0 @ =sub_8096938
	bl GetParallelWorker
	bl Proc_End
	ldr r0, _08096DE4 @ =sub_8096970
	bl GetParallelWorker
	bl Proc_End
	ldr r0, _08096DE8 @ =sub_80968E8
	adds r1, r4, #0
	bl StartParallelWorker
	movs r0, #7
	bl EnableBgSync
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08096DE0: .4byte sub_8096938
_08096DE4: .4byte sub_8096970
_08096DE8: .4byte sub_80968E8

	thumb_func_start sub_8096DEC
sub_8096DEC: @ 0x08096DEC
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	adds r4, r5, #0
	adds r4, #0x33
	ldrb r6, [r4]
	ldrh r0, [r5, #0x38]
	cmp r0, #0
	beq _08096DFE
	b _08096F58
_08096DFE:
	ldr r1, _08096E1C @ =gpKeySt
	ldr r0, [r1]
	ldrh r3, [r0, #8]
	movs r7, #1
	adds r0, r7, #0
	ands r0, r3
	adds r2, r1, #0
	cmp r0, #0
	bne _08096E12
	b _08096F08
_08096E12:
	cmp r6, #0
	beq _08096E20
	cmp r6, #1
	beq _08096E8C
	b _0809700C
	.align 2, 0
_08096E1C: .4byte gpKeySt
_08096E20:
	bl sub_809158C
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x63
	bhi _08096EEC
	ldr r0, [r5, #0x2c]
	bl GetUnitItemCount
	cmp r0, #0
	ble _08096EEC
	ldrb r4, [r4]
	lsls r2, r4, #4
	adds r2, #0x24
	movs r0, #0
	movs r1, #0x44
	movs r3, #2
	bl sub_80A98DC
	ldr r0, _08096E7C @ =sub_80968E8
	bl GetParallelWorker
	bl Proc_End
	ldr r0, _08096E80 @ =sub_8096938
	adds r1, r5, #0
	bl StartParallelWorker
	movs r0, #1
	adds r1, r5, #0
	bl sub_8096430
	ldr r0, _08096E84 @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08096E72
	ldr r0, _08096E88 @ =0x0000038A
	bl m4aSongNumStart
_08096E72:
	adds r0, r5, #0
	movs r1, #3
	bl Proc_Goto
	b _0809700C
	.align 2, 0
_08096E7C: .4byte sub_80968E8
_08096E80: .4byte sub_8096938
_08096E84: .4byte gPlaySt
_08096E88: .4byte 0x0000038A
_08096E8C:
	ldr r0, [r5, #0x2c]
	bl GetUnitItemCount
	cmp r0, #4
	bgt _08096EEC
	ldrb r4, [r4]
	lsls r2, r4, #4
	adds r2, #0x24
	movs r0, #0
	movs r1, #0x44
	movs r3, #2
	bl sub_80A98DC
	ldr r0, _08096EDC @ =sub_80968E8
	bl GetParallelWorker
	bl Proc_End
	ldr r0, _08096EE0 @ =sub_8096970
	adds r1, r5, #0
	bl StartParallelWorker
	movs r0, #2
	adds r1, r5, #0
	bl sub_8096430
	ldr r0, _08096EE4 @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08096ED2
	ldr r0, _08096EE8 @ =0x0000038A
	bl m4aSongNumStart
_08096ED2:
	adds r0, r5, #0
	movs r1, #4
	bl Proc_Goto
	b _0809700C
	.align 2, 0
_08096EDC: .4byte sub_80968E8
_08096EE0: .4byte sub_8096970
_08096EE4: .4byte gPlaySt
_08096EE8: .4byte 0x0000038A
_08096EEC:
	ldr r0, _08096F04 @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	bge _08096EFA
	b _0809700C
_08096EFA:
	movs r0, #0xe3
	lsls r0, r0, #2
	bl m4aSongNumStart
	b _0809700C
	.align 2, 0
_08096F04: .4byte gPlaySt
_08096F08:
	movs r0, #2
	ands r0, r3
	cmp r0, #0
	beq _08096F34
	adds r0, r5, #0
	movs r1, #8
	bl Proc_Goto
	ldr r0, _08096F2C @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0809700C
	ldr r0, _08096F30 @ =0x0000038B
	bl m4aSongNumStart
	b _0809700C
	.align 2, 0
_08096F2C: .4byte gPlaySt
_08096F30: .4byte 0x0000038B
_08096F34:
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r3
	cmp r0, #0
	beq _08096F78
	lsls r1, r6, #4
	adds r1, #0x24
	ldr r2, _08096F54 @ =gUnk_08D8D118
	lsls r0, r6, #2
	adds r0, r0, r2
	ldr r2, [r0]
	movs r0, #0x44
	bl StartHelpBox
	strh r7, [r5, #0x38]
	b _0809700C
	.align 2, 0
_08096F54: .4byte gUnk_08D8D118
_08096F58:
	ldr r2, _08096F74 @ =gpKeySt
	ldr r1, [r2]
	movs r0, #0x81
	lsls r0, r0, #1
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _08096F78
	bl CloseHelpBox
	movs r0, #0
	strh r0, [r5, #0x38]
	b _0809700C
	.align 2, 0
_08096F74: .4byte gpKeySt
_08096F78:
	ldr r3, [r2]
	movs r1, #0x40
	adds r0, r1, #0
	ldrh r4, [r3, #6]
	ands r0, r4
	adds r4, r5, #0
	adds r4, #0x33
	cmp r0, #0
	beq _08096FA2
	ldrb r0, [r4]
	cmp r0, #0
	beq _08096F94
	subs r0, #1
	b _08096FA0
_08096F94:
	adds r0, r1, #0
	ldrh r3, [r3, #8]
	ands r0, r3
	cmp r0, #0
	beq _08096FA2
	movs r0, #1
_08096FA0:
	strb r0, [r4]
_08096FA2:
	ldr r1, [r2]
	movs r2, #0x80
	adds r0, r2, #0
	ldrh r3, [r1, #6]
	ands r0, r3
	cmp r0, #0
	beq _08096FC8
	ldrb r0, [r4]
	cmp r0, #0
	bne _08096FBA
	adds r0, #1
	b _08096FC6
_08096FBA:
	adds r0, r2, #0
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _08096FC8
	movs r0, #0
_08096FC6:
	strb r0, [r4]
_08096FC8:
	ldrb r0, [r4]
	cmp r6, r0
	beq _0809700C
	ldr r0, _08097014 @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08096FE0
	ldr r0, _08097018 @ =0x00000386
	bl m4aSongNumStart
_08096FE0:
	ldrb r3, [r4]
	lsls r1, r3, #4
	adds r1, #0x24
	movs r3, #0x80
	lsls r3, r3, #3
	movs r0, #0x44
	movs r2, #4
	bl ShowSysHandCursor
	ldrh r0, [r5, #0x38]
	cmp r0, #0
	beq _0809700C
	ldrb r0, [r4]
	lsls r1, r0, #4
	adds r1, #0x24
	ldr r2, _0809701C @ =gUnk_08D8D118
	lsls r0, r0, #2
	adds r0, r0, r2
	ldr r2, [r0]
	movs r0, #0x44
	bl StartHelpBox
_0809700C:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08097014: .4byte gPlaySt
_08097018: .4byte 0x00000386
_0809701C: .4byte gUnk_08D8D118

	thumb_func_start sub_8097020
sub_8097020: @ 0x08097020
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	bl InitIcons
	ldr r0, [r4, #0x2c]
	adds r5, r4, #0
	adds r5, #0x35
	ldrb r1, [r5]
	movs r2, #1
	bl sub_8091A74
	ldr r0, _080970B0 @ =0x02012BA0
	ldr r1, _080970B4 @ =gBg2Tm + 0x1e
	ldrb r3, [r5]
	lsls r2, r3, #1
	adds r6, r4, #0
	adds r6, #0x4c
	adds r2, r6, r2
	ldrh r2, [r2]
	lsrs r2, r2, #4
	ldr r3, [r4, #0x2c]
	bl sub_80964A0
	ldr r0, _080970B8 @ =gBg0Tm + 0x244
	ldr r1, [r4, #0x2c]
	bl sub_8094BA4
	ldrb r1, [r5]
	lsls r0, r1, #1
	adds r7, r4, #0
	adds r7, #0x3a
	adds r1, r7, r0
	ldrh r1, [r1]
	lsls r1, r1, #4
	adds r0, r6, r0
	ldrh r0, [r0]
	subs r0, #0x28
	subs r1, r1, r0
	movs r3, #0x80
	lsls r3, r3, #4
	movs r0, #0x80
	movs r2, #0xb
	bl ShowSysHandCursor
	movs r0, #5
	bl EnableBgSync
	ldrh r0, [r4, #0x38]
	cmp r0, #0
	beq _080970CC
	ldr r0, _080970BC @ =0x02012466
	ldrh r0, [r0]
	cmp r0, #0
	beq _080970C4
	ldr r2, _080970C0 @ =0x020117E4
	ldrb r5, [r5]
	lsls r3, r5, #1
	adds r0, r7, r3
	ldrh r1, [r0]
	lsls r0, r1, #2
	adds r0, r0, r2
	ldrh r2, [r0, #2]
	lsls r1, r1, #4
	adds r3, r6, r3
	ldrh r0, [r3]
	subs r0, #0x28
	subs r1, r1, r0
	movs r0, #0x80
	bl StartItemHelpBox
	movs r0, #1
	b _080970CA
	.align 2, 0
_080970B0: .4byte 0x02012BA0
_080970B4: .4byte gBg2Tm + 0x1e
_080970B8: .4byte gBg0Tm + 0x244
_080970BC: .4byte 0x02012466
_080970C0: .4byte 0x020117E4
_080970C4:
	bl CloseHelpBox
	movs r0, #0xff
_080970CA:
	strh r0, [r4, #0x38]
_080970CC:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_80970D4
sub_80970D4: @ 0x080970D4
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r6, r0, #0
	movs r3, #0
	movs r7, #4
	adds r0, #0x34
	ldrb r1, [r0]
	adds r1, #1
	strb r1, [r0]
	ldrb r4, [r0]
	cmp r4, #4
	bge _08097100
	subs r1, r7, r4
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #5
	muls r0, r1, r0
	movs r1, #0x10
	bl __divsi3
	adds r3, r0, #0
	subs r3, #0x60
_08097100:
	adds r5, r6, #0
	adds r5, #0x35
	cmp r4, #4
	bne _08097120
	ldrb r0, [r5]
	cmp r0, #0
	bne _08097112
	movs r0, #8
	b _08097114
_08097112:
	subs r0, #1
_08097114:
	strb r0, [r5]
	adds r0, r6, #0
	str r3, [sp]
	bl sub_8097020
	ldr r3, [sp]
_08097120:
	adds r4, r6, #0
	adds r4, #0x34
	ldrb r1, [r4]
	cmp r1, r7
	blt _08097140
	subs r1, r1, r7
	subs r1, r7, r1
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #5
	muls r0, r1, r0
	adds r1, r7, #0
	muls r1, r7, r1
	bl __divsi3
	adds r3, r0, #0
_08097140:
	movs r0, #0xff
	ands r3, r0
	ldrb r5, [r5]
	lsls r1, r5, #1
	adds r0, r6, #0
	adds r0, #0x4c
	adds r0, r0, r1
	ldrh r2, [r0]
	subs r2, #0x28
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	movs r0, #2
	adds r1, r3, #0
	bl SetBgOffset
	lsls r0, r7, #1
	ldrb r4, [r4]
	cmp r4, r0
	bne _0809716E
	adds r0, r6, #0
	movs r1, #4
	bl Proc_Goto
_0809716E:
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_8097178
sub_8097178: @ 0x08097178
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r7, r0, #0
	movs r0, #4
	mov r8, r0
	adds r0, r7, #0
	adds r0, #0x34
	ldrb r1, [r0]
	adds r1, #1
	strb r1, [r0]
	ldrb r4, [r0]
	cmp r4, #4
	bge _080971AA
	mov r2, r8
	subs r1, r2, r4
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #5
	muls r0, r1, r0
	movs r1, #0x10
	bl __divsi3
	movs r1, #0x60
	subs r6, r1, r0
_080971AA:
	adds r5, r7, #0
	adds r5, #0x35
	cmp r4, #4
	bne _080971C6
	ldrb r0, [r5]
	cmp r0, #8
	bne _080971BC
	movs r0, #0
	b _080971BE
_080971BC:
	adds r0, #1
_080971BE:
	strb r0, [r5]
	adds r0, r7, #0
	bl sub_8097020
_080971C6:
	adds r4, r7, #0
	adds r4, #0x34
	ldrb r1, [r4]
	cmp r1, r8
	blt _080971EA
	mov r0, r8
	subs r1, r1, r0
	subs r1, r0, r1
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #5
	muls r0, r1, r0
	mov r2, r8
	mov r1, r8
	muls r1, r2, r1
	bl __divsi3
	rsbs r6, r0, #0
_080971EA:
	movs r0, #0xff
	ands r6, r0
	ldrb r5, [r5]
	lsls r1, r5, #1
	adds r0, r7, #0
	adds r0, #0x4c
	adds r0, r0, r1
	ldrh r2, [r0]
	subs r2, #0x28
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	movs r0, #2
	adds r1, r6, #0
	bl SetBgOffset
	mov r1, r8
	lsls r0, r1, #1
	ldrb r4, [r4]
	cmp r4, r0
	bne _0809721A
	adds r0, r7, #0
	movs r1, #4
	bl Proc_Goto
_0809721A:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_8097224
sub_8097224: @ 0x08097224
	push {r4, r5, lr}
	mov ip, r0
	ldr r0, _0809724C @ =0x02012466
	ldrh r4, [r0]
	adds r5, r0, #0
	cmp r4, #0
	bne _08097250
	mov r3, ip
	adds r3, #0x35
	ldrb r1, [r3]
	lsls r0, r1, #1
	mov r1, ip
	adds r1, #0x3a
	adds r1, r1, r0
	mov r2, ip
	adds r2, #0x4c
	adds r0, r2, r0
	strh r4, [r0]
	strh r4, [r1]
	b _0809726E
	.align 2, 0
_0809724C: .4byte 0x02012466
_08097250:
	mov r2, ip
	adds r2, #0x35
	ldrb r0, [r2]
	lsls r1, r0, #1
	mov r0, ip
	adds r0, #0x3a
	adds r0, r0, r1
	ldrh r4, [r5]
	subs r4, #1
	adds r3, r2, #0
	adds r2, #0x17
	ldrh r1, [r0]
	cmp r1, r4
	ble _0809726E
	strh r4, [r0]
_0809726E:
	ldrh r0, [r5]
	cmp r0, #6
	bls _0809728C
	ldrb r1, [r3]
	lsls r0, r1, #1
	adds r4, r2, r0
	ldrh r1, [r4]
	lsrs r0, r1, #4
	adds r0, #7
	ldrh r1, [r5]
	cmp r0, r1
	ble _0809728C
	subs r0, r1, #7
	lsls r0, r0, #4
	strh r0, [r4]
_0809728C:
	ldrb r3, [r3]
	lsls r0, r3, #1
	adds r0, r2, r0
	ldrh r2, [r0]
	subs r2, #0x28
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	movs r0, #2
	movs r1, #0
	bl SetBgOffset
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start sub_80972A8
sub_80972A8: @ 0x080972A8
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	mov ip, r0
	adds r0, #0x35
	ldrb r0, [r0]
	lsls r2, r0, #1
	mov r0, ip
	adds r0, #0x3a
	adds r4, r0, r2
	ldrh r3, [r4]
	lsls r1, r3, #4
	adds r0, #0x12
	adds r0, r0, r2
	ldrh r0, [r0]
	subs r0, #0x28
	subs r1, r1, r0
	cmp r1, #0x37
	bgt _080972D6
	cmp r3, #0
	beq _080972D6
	adds r0, r3, #1
	strh r0, [r4]
_080972D6:
	mov r4, ip
	adds r4, #0x35
	ldrb r1, [r4]
	lsls r0, r1, #1
	mov r3, ip
	adds r3, #0x3a
	adds r6, r3, r0
	ldrh r5, [r6]
	lsls r1, r5, #4
	mov r2, ip
	adds r2, #0x4c
	adds r0, r2, r0
	ldrh r0, [r0]
	subs r0, #0x28
	subs r1, r1, r0
	adds r7, r3, #0
	mov r8, r2
	cmp r1, #0x78
	ble _0809730A
	ldr r0, _08097338 @ =0x02012466
	ldrh r0, [r0]
	subs r0, #1
	cmp r5, r0
	beq _0809730A
	subs r0, r5, #1
	strh r0, [r6]
_0809730A:
	mov r0, ip
	bl sub_8097224
	ldrb r4, [r4]
	lsls r0, r4, #1
	adds r1, r7, r0
	ldrh r1, [r1]
	lsls r1, r1, #4
	add r0, r8
	ldrh r0, [r0]
	subs r0, #0x28
	subs r1, r1, r0
	movs r3, #0x80
	lsls r3, r3, #4
	movs r0, #0x80
	movs r2, #0xb
	bl ShowSysHandCursor
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08097338: .4byte 0x02012466

	thumb_func_start sub_809733C
sub_809733C: @ 0x0809733C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r4, r0, #0
	adds r7, r1, #0
	bl InitIcons
	ldr r0, _080973D4 @ =gBg2Tm + 0x1e
	mov r8, r0
	adds r6, r4, #0
	adds r6, #0x35
	ldrb r1, [r6]
	lsls r0, r1, #1
	adds r5, r4, #0
	adds r5, #0x4c
	adds r0, r5, r0
	ldrh r0, [r0]
	lsrs r1, r0, #4
	mov r0, r8
	bl sub_80965B4
	ldr r0, _080973D8 @ =gBg0Tm + 0x244
	ldr r1, [r4, #0x2c]
	bl sub_8094BA4
	movs r0, #5
	bl EnableBgSync
	cmp r7, #0
	bge _0809738E
	ldr r0, _080973DC @ =0x02012BA0
	ldrb r2, [r6]
	lsls r1, r2, #1
	adds r1, r5, r1
	ldrh r1, [r1]
	lsrs r2, r1, #4
	subs r2, #1
	ldr r3, [r4, #0x2c]
	mov r1, r8
	bl sub_8096618
_0809738E:
	cmp r7, #0
	ble _080973A8
	ldr r0, _080973DC @ =0x02012BA0
	ldrb r2, [r6]
	lsls r1, r2, #1
	adds r1, r5, r1
	ldrh r1, [r1]
	lsrs r2, r1, #4
	adds r2, #7
	ldr r3, [r4, #0x2c]
	mov r1, r8
	bl sub_8096618
_080973A8:
	ldrb r1, [r6]
	lsls r0, r1, #1
	adds r0, r5, r0
	ldrh r2, [r0]
	adds r1, r2, r7
	strh r1, [r0]
	ldrb r6, [r6]
	lsls r0, r6, #1
	adds r0, r5, r0
	ldrh r2, [r0]
	subs r2, #0x28
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	movs r0, #2
	movs r1, #0
	bl SetBgOffset
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080973D4: .4byte gBg2Tm + 0x1e
_080973D8: .4byte gBg0Tm + 0x244
_080973DC: .4byte 0x02012BA0

	thumb_func_start sub_80973E0
sub_80973E0: @ 0x080973E0
	push {lr}
	bl sub_8096834
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_80973EC
sub_80973EC: @ 0x080973EC
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r7, r0, #0
	ldr r0, [r7, #0x2c]
	bl GetUnitItemCount
	adds r2, r0, #0
	cmp r2, #5
	beq _08097408
	ldr r0, _08097420 @ =0x02012466
	ldrh r0, [r0]
	cmp r0, #0
	bne _08097428
_08097408:
	ldr r0, _08097424 @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	bge _08097416
	b _0809753A
_08097416:
	movs r0, #0xe3
	lsls r0, r0, #2
	bl m4aSongNumStart
	b _0809753A
	.align 2, 0
_08097420: .4byte 0x02012466
_08097424: .4byte gPlaySt
_08097428:
	movs r5, #0
	strh r5, [r7, #0x38]
	ldr r1, [r7, #0x2c]
	lsls r0, r2, #1
	adds r1, #0x1e
	adds r1, r1, r0
	ldr r4, _08097508 @ =0x020117E4
	movs r0, #0x35
	adds r0, r0, r7
	mov r8, r0
	ldrb r2, [r0]
	lsls r0, r2, #1
	adds r6, r7, #0
	adds r6, #0x3a
	adds r0, r6, r0
	ldrh r0, [r0]
	lsls r0, r0, #2
	adds r0, r0, r4
	ldrh r0, [r0, #2]
	strh r0, [r1]
	ldr r0, [r7, #0x2c]
	bl UnitRemoveInvalidItems
	mov r3, r8
	ldrb r3, [r3]
	lsls r0, r3, #1
	adds r0, r6, r0
	ldrh r0, [r0]
	lsls r0, r0, #2
	adds r0, r0, r4
	strh r5, [r0, #2]
	bl sub_8091B48
	ldr r0, [r7, #0x2c]
	mov r2, r8
	ldrb r1, [r2]
	movs r2, #1
	bl sub_8091A74
	adds r0, r7, #0
	bl sub_8097224
	bl InitIcons
	ldr r0, _0809750C @ =gBg0Tm + 0x244
	ldr r4, _08097510 @ =0x02012B78
	ldr r2, [r7, #0x2c]
	adds r1, r4, #0
	movs r3, #0
	bl sub_8094AC0
	adds r4, #0x28
	ldr r1, _08097514 @ =gBg2Tm + 0x1e
	mov r3, r8
	ldrb r3, [r3]
	lsls r0, r3, #1
	adds r5, r7, #0
	adds r5, #0x4c
	adds r0, r5, r0
	ldrh r0, [r0]
	lsrs r2, r0, #4
	ldr r3, [r7, #0x2c]
	adds r0, r4, #0
	bl sub_80964A0
	ldr r0, _08097518 @ =sub_80973E0
	movs r1, #1
	adds r2, r7, #0
	bl StartParallelFiniteLoop
	mov r1, r8
	ldrb r1, [r1]
	lsls r0, r1, #1
	adds r6, r6, r0
	ldrh r6, [r6]
	lsls r1, r6, #4
	adds r5, r5, r0
	ldrh r0, [r5]
	subs r0, #0x28
	subs r1, r1, r0
	movs r3, #0x80
	lsls r3, r3, #4
	movs r0, #0x80
	movs r2, #0xb
	bl ShowSysHandCursor
	movs r0, #5
	bl EnableBgSync
	ldr r1, _0809751C @ =gActionSt
	movs r0, #0x19
	strb r0, [r1, #0x11]
	ldr r0, [r7, #0x2c]
	bl GetUnitItemCount
	cmp r0, #5
	bne _08097528
	adds r0, r7, #0
	movs r1, #1
	bl Proc_Goto
	ldr r0, _08097520 @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0809753A
	ldr r0, _08097524 @ =0x0000038B
	bl m4aSongNumStart
	b _0809753A
	.align 2, 0
_08097508: .4byte 0x020117E4
_0809750C: .4byte gBg0Tm + 0x244
_08097510: .4byte 0x02012B78
_08097514: .4byte gBg2Tm + 0x1e
_08097518: .4byte sub_80973E0
_0809751C: .4byte gActionSt
_08097520: .4byte gPlaySt
_08097524: .4byte 0x0000038B
_08097528:
	ldr r0, _08097544 @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0809753A
	ldr r0, _08097548 @ =0x0000038A
	bl m4aSongNumStart
_0809753A:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08097544: .4byte gPlaySt
_08097548: .4byte 0x0000038A

	thumb_func_start sub_809754C
sub_809754C: @ 0x0809754C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	adds r4, r0, #0
	adds r7, r4, #0
	adds r7, #0x35
	ldrb r0, [r7]
	lsls r1, r0, #1
	movs r2, #0x3a
	adds r2, r2, r4
	mov r8, r2
	adds r0, r2, r1
	ldrh r0, [r0]
	mov sl, r0
	adds r5, r4, #0
	adds r5, #0x4c
	adds r6, r5, r1
	movs r3, #0xf
	ldrh r0, [r6]
	ands r0, r3
	mov sb, r0
	cmp r0, #0
	beq _08097580
	b _08097778
_08097580:
	ldrh r0, [r4, #0x38]
	cmp r0, #0
	beq _0809758A
	cmp r0, #0xff
	bne _0809762C
_0809758A:
	ldr r1, _080975C4 @ =gpKeySt
	ldr r0, [r1]
	ldrh r3, [r0, #8]
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r3
	mov r8, r1
	cmp r0, #0
	beq _080975EC
	ldr r0, _080975C8 @ =0x02012466
	ldrh r0, [r0]
	cmp r0, #0
	beq _080975D0
	ldr r1, _080975CC @ =0x020117E4
	mov r2, sl
	lsls r0, r2, #2
	adds r0, r0, r1
	ldrh r2, [r0, #2]
	mov r3, sl
	lsls r1, r3, #4
	ldrh r0, [r6]
	subs r0, #0x28
	subs r1, r1, r0
	movs r0, #0x80
	bl StartItemHelpBox
	movs r0, #1
	strh r0, [r4, #0x38]
	b _080978CA
	.align 2, 0
_080975C4: .4byte gpKeySt
_080975C8: .4byte 0x02012466
_080975CC: .4byte 0x020117E4
_080975D0:
	ldr r0, _080975E8 @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	bge _080975DE
	b _080978CA
_080975DE:
	movs r0, #0xe3
	lsls r0, r0, #2
	bl m4aSongNumStart
	b _080978CA
	.align 2, 0
_080975E8: .4byte gPlaySt
_080975EC:
	movs r0, #1
	ands r0, r3
	cmp r0, #0
	beq _080975FC
	adds r0, r4, #0
	bl sub_80973EC
	b _080978CA
_080975FC:
	movs r0, #2
	ands r0, r3
	cmp r0, #0
	beq _0809764C
	adds r0, r4, #0
	movs r1, #1
	bl Proc_Goto
	ldr r0, _08097624 @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0809761E
	ldr r0, _08097628 @ =0x0000038B
	bl m4aSongNumStart
_0809761E:
	mov r0, sb
	strh r0, [r4, #0x38]
	b _080978CA
	.align 2, 0
_08097624: .4byte gPlaySt
_08097628: .4byte 0x0000038B
_0809762C:
	ldr r2, _08097648 @ =gpKeySt
	ldr r1, [r2]
	movs r0, #0x81
	lsls r0, r0, #1
	ldrh r1, [r1, #8]
	ands r0, r1
	mov r8, r2
	cmp r0, #0
	beq _0809764C
	bl CloseHelpBox
	mov r1, sb
	strh r1, [r4, #0x38]
	b _080978CA
	.align 2, 0
_08097648: .4byte gpKeySt
_0809764C:
	mov r3, r8
	ldr r2, [r3]
	ldrh r1, [r2, #6]
	movs r0, #0x20
	ands r0, r1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	cmp r5, #0
	beq _08097698
	movs r0, #0
	bl SetUiSpinningArrowFastMaybe
	ldr r0, _08097690 @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08097676
	ldr r0, _08097694 @ =0x00000387
	bl m4aSongNumStart
_08097676:
	adds r0, r4, #0
	movs r1, #5
	bl Proc_Goto
	adds r1, r4, #0
	adds r1, #0x34
	movs r0, #0
	strb r0, [r1]
	adds r0, r4, #0
	bl sub_80970D4
	b _080978CA
	.align 2, 0
_08097690: .4byte gPlaySt
_08097694: .4byte 0x00000387
_08097698:
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	beq _080976D8
	movs r0, #1
	bl SetUiSpinningArrowFastMaybe
	ldr r0, _080976D0 @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080976B8
	ldr r0, _080976D4 @ =0x00000387
	bl m4aSongNumStart
_080976B8:
	adds r0, r4, #0
	movs r1, #6
	bl Proc_Goto
	adds r0, r4, #0
	adds r0, #0x34
	strb r5, [r0]
	adds r0, r4, #0
	bl sub_8097178
	b _080978CA
	.align 2, 0
_080976D0: .4byte gPlaySt
_080976D4: .4byte 0x00000387
_080976D8:
	movs r0, #0x80
	lsls r0, r0, #2
	ldrh r2, [r2, #4]
	ands r0, r2
	cmp r0, #0
	beq _080976EC
	adds r1, r4, #0
	adds r1, #0x32
	movs r0, #8
	b _080976F2
_080976EC:
	adds r1, r4, #0
	adds r1, #0x32
	movs r0, #4
_080976F2:
	strb r0, [r1]
	adds r5, r1, #0
	mov r0, r8
	ldr r1, [r0]
	movs r2, #0x40
	adds r0, r2, #0
	ldrh r3, [r1, #6]
	ands r0, r3
	cmp r0, #0
	bne _0809771E
	adds r0, r2, #0
	ldrh r1, [r1, #4]
	ands r0, r1
	adds r7, r4, #0
	adds r7, #0x35
	adds r6, r4, #0
	adds r6, #0x3a
	cmp r0, #0
	beq _0809773A
	ldrb r0, [r5]
	cmp r0, #8
	bne _0809773A
_0809771E:
	adds r0, r4, #0
	adds r0, #0x35
	ldrb r2, [r0]
	lsls r1, r2, #1
	adds r2, r4, #0
	adds r2, #0x3a
	adds r3, r2, r1
	ldrh r1, [r3]
	adds r7, r0, #0
	adds r6, r2, #0
	cmp r1, #0
	beq _0809773A
	subs r0, r1, #1
	strh r0, [r3]
_0809773A:
	mov r3, r8
	ldr r1, [r3]
	movs r2, #0x80
	adds r0, r2, #0
	ldrh r3, [r1, #6]
	ands r0, r3
	cmp r0, #0
	bne _0809775A
	adds r0, r2, #0
	ldrh r1, [r1, #4]
	ands r0, r1
	cmp r0, #0
	beq _080977D6
	ldrb r5, [r5]
	cmp r5, #8
	bne _080977D6
_0809775A:
	ldrb r1, [r7]
	lsls r0, r1, #1
	adds r2, r6, r0
	ldrh r1, [r2]
	ldr r0, _08097774 @ =0x02012466
	ldrh r0, [r0]
	subs r0, #1
	cmp r1, r0
	bge _080977D6
	adds r0, r1, #1
	strh r0, [r2]
	b _080977D6
	.align 2, 0
_08097774: .4byte 0x02012466
_08097778:
	mov r2, sl
	lsls r0, r2, #4
	ldrh r2, [r6]
	adds r1, r2, #0
	subs r1, #0x28
	subs r0, r0, r1
	cmp r0, #0x37
	bgt _08097796
	adds r0, r4, #0
	adds r0, #0x32
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r0, r2, r0
	strh r0, [r6]
_08097796:
	ldrb r3, [r7]
	lsls r2, r3, #1
	mov r1, r8
	adds r0, r1, r2
	ldrh r0, [r0]
	lsls r1, r0, #4
	adds r3, r5, r2
	ldrh r2, [r3]
	adds r0, r2, #0
	subs r0, #0x28
	subs r1, r1, r0
	cmp r1, #0x78
	ble _080977BE
	adds r0, r4, #0
	adds r0, #0x32
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r0, r2, r0
	strh r0, [r3]
_080977BE:
	ldrb r2, [r7]
	lsls r0, r2, #1
	adds r0, r5, r0
	ldrh r2, [r0]
	subs r2, #0x28
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	movs r0, #2
	movs r1, #0
	bl SetBgOffset
	mov r6, r8
_080977D6:
	ldrb r3, [r7]
	lsls r0, r3, #1
	adds r0, r6, r0
	ldrh r0, [r0]
	cmp sl, r0
	beq _080978CA
	ldr r1, _0809783C @ =0x020117E4
	lsls r0, r0, #2
	adds r0, r0, r1
	ldrh r0, [r0, #2]
	mov sb, r0
	ldr r0, _08097840 @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080977FE
	ldr r0, _08097844 @ =0x00000386
	bl m4aSongNumStart
_080977FE:
	ldrb r0, [r7]
	lsls r1, r0, #1
	adds r0, r6, r1
	ldrh r5, [r0]
	lsls r3, r5, #4
	adds r2, r4, #0
	adds r2, #0x4c
	adds r1, r2, r1
	ldrh r0, [r1]
	subs r0, #0x28
	subs r1, r3, r0
	mov r8, r2
	cmp r1, #0x37
	bgt _08097848
	cmp r5, #0
	beq _08097848
	ldrh r0, [r4, #0x38]
	cmp r0, #0
	beq _0809782E
	adds r1, #0x10
	movs r0, #0x80
	mov r2, sb
	bl StartItemHelpBox
_0809782E:
	adds r0, r4, #0
	adds r0, #0x32
	movs r1, #0
	ldrsb r1, [r0, r1]
	rsbs r1, r1, #0
	b _08097880
	.align 2, 0
_0809783C: .4byte 0x020117E4
_08097840: .4byte gPlaySt
_08097844: .4byte 0x00000386
_08097848:
	ldrb r1, [r7]
	lsls r0, r1, #1
	adds r1, r6, r0
	ldrh r2, [r1]
	lsls r1, r2, #4
	add r0, r8
	ldrh r0, [r0]
	subs r0, #0x28
	subs r1, r1, r0
	cmp r1, #0x78
	ble _0809788C
	ldr r0, _08097888 @ =0x02012466
	ldrh r0, [r0]
	subs r0, #1
	cmp r2, r0
	beq _0809788C
	ldrh r0, [r4, #0x38]
	cmp r0, #0
	beq _08097878
	subs r1, #0x10
	movs r0, #0x80
	mov r2, sb
	bl StartItemHelpBox
_08097878:
	adds r0, r4, #0
	adds r0, #0x32
	movs r1, #0
	ldrsb r1, [r0, r1]
_08097880:
	adds r0, r4, #0
	bl sub_809733C
	b _080978CA
	.align 2, 0
_08097888: .4byte 0x02012466
_0809788C:
	ldrh r0, [r4, #0x38]
	cmp r0, #0
	beq _080978AC
	ldrb r2, [r7]
	lsls r0, r2, #1
	adds r1, r6, r0
	ldrh r1, [r1]
	lsls r1, r1, #4
	add r0, r8
	ldrh r0, [r0]
	subs r0, #0x28
	subs r1, r1, r0
	movs r0, #0x80
	mov r2, sb
	bl StartItemHelpBox
_080978AC:
	ldrb r7, [r7]
	lsls r0, r7, #1
	adds r1, r6, r0
	ldrh r1, [r1]
	lsls r1, r1, #4
	add r0, r8
	ldrh r0, [r0]
	subs r0, #0x28
	subs r1, r1, r0
	movs r3, #0x80
	lsls r3, r3, #4
	movs r0, #0x80
	movs r2, #0xb
	bl ShowSysHandCursor
_080978CA:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_80978D8
sub_80978D8: @ 0x080978D8
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	ldr r6, _08097908 @ =gpKeySt
	ldr r0, [r6]
	ldrh r1, [r0, #6]
	movs r7, #0x40
	adds r0, r7, #0
	ands r0, r1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	cmp r5, #0
	beq _0809791E
	ldr r0, [r4, #0x2c]
	bl GetUnitItemCount
	adds r3, r0, #0
	adds r2, r4, #0
	adds r2, #0x31
	ldrb r0, [r2]
	cmp r0, #0
	beq _0809790C
	subs r0, #1
	strb r0, [r2]
	b _0809794E
	.align 2, 0
_08097908: .4byte gpKeySt
_0809790C:
	ldr r1, [r6]
	adds r0, r7, #0
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _0809796C
	subs r0, r3, #1
	strb r0, [r2]
	b _0809794E
_0809791E:
	movs r7, #0x80
	adds r0, r7, #0
	ands r0, r1
	cmp r0, #0
	beq _0809796C
	ldr r0, [r4, #0x2c]
	bl GetUnitItemCount
	adds r2, r4, #0
	adds r2, #0x31
	ldrb r1, [r2]
	subs r0, #1
	cmp r1, r0
	bge _08097940
	adds r0, r1, #1
	strb r0, [r2]
	b _0809794E
_08097940:
	ldr r1, [r6]
	adds r0, r7, #0
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _0809796C
	strb r5, [r2]
_0809794E:
	ldr r0, _08097964 @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08097960
	ldr r0, _08097968 @ =0x00000386
	bl m4aSongNumStart
_08097960:
	movs r0, #1
	b _0809796E
	.align 2, 0
_08097964: .4byte gPlaySt
_08097968: .4byte 0x00000386
_0809796C:
	movs r0, #0
_0809796E:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	thumb_func_start sub_8097974
sub_8097974: @ 0x08097974
	push {lr}
	adds r0, #0x31
	ldrb r0, [r0]
	lsls r1, r0, #4
	adds r1, #0x48
	movs r3, #0x80
	lsls r3, r3, #4
	movs r0, #0x10
	movs r2, #0xb
	bl ShowSysHandCursor
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_8097990
sub_8097990: @ 0x08097990
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	ldr r0, [r5, #0x2c]
	adds r7, r5, #0
	adds r7, #0x31
	ldrb r1, [r7]
	lsls r2, r1, #1
	adds r1, r0, #0
	adds r1, #0x1e
	adds r1, r1, r2
	ldrh r4, [r1]
	bl GetUnitItemCount
	ldr r0, [r5, #0x2c]
	ldrb r2, [r7]
	lsls r1, r2, #1
	adds r0, #0x1e
	adds r0, r0, r1
	movs r1, #0
	strh r1, [r0]
	ldr r0, [r5, #0x2c]
	bl UnitRemoveInvalidItems
	adds r0, r4, #0
	bl sub_80918A4
	adds r6, r5, #0
	adds r6, #0x35
	strb r0, [r6]
	adds r0, r4, #0
	bl AddItemToConvoy
	ldr r0, [r5, #0x2c]
	ldrb r1, [r6]
	movs r2, #1
	bl sub_8091A74
	adds r0, r5, #0
	bl sub_8097224
	bl InitIcons
	ldr r0, _08097A58 @ =gBg0Tm + 0x244
	ldr r4, _08097A5C @ =0x02012B78
	ldr r2, [r5, #0x2c]
	adds r1, r4, #0
	movs r3, #0
	bl sub_8094AC0
	adds r4, #0x28
	ldr r1, _08097A60 @ =gBg2Tm + 0x1e
	ldrb r6, [r6]
	lsls r2, r6, #1
	adds r0, r5, #0
	adds r0, #0x4c
	adds r0, r0, r2
	ldrh r0, [r0]
	lsrs r2, r0, #4
	ldr r3, [r5, #0x2c]
	adds r0, r4, #0
	bl sub_80964A0
	ldr r0, _08097A64 @ =sub_80973E0
	movs r1, #1
	adds r2, r5, #0
	bl StartParallelFiniteLoop
	movs r0, #4
	bl EnableBgSync
	ldr r0, [r5, #0x2c]
	bl GetUnitItemCount
	adds r4, r0, #0
	ldr r1, _08097A68 @ =gActionSt
	movs r0, #0x19
	strb r0, [r1, #0x11]
	cmp r4, #0
	beq _08097A3A
	bl sub_809158C
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x64
	bne _08097A74
_08097A3A:
	adds r0, r5, #0
	movs r1, #1
	bl Proc_Goto
	ldr r0, _08097A6C @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08097AA0
	ldr r0, _08097A70 @ =0x0000038B
	bl m4aSongNumStart
	b _08097AA0
	.align 2, 0
_08097A58: .4byte gBg0Tm + 0x244
_08097A5C: .4byte 0x02012B78
_08097A60: .4byte gBg2Tm + 0x1e
_08097A64: .4byte sub_80973E0
_08097A68: .4byte gActionSt
_08097A6C: .4byte gPlaySt
_08097A70: .4byte 0x0000038B
_08097A74:
	ldr r0, _08097AA8 @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08097A86
	ldr r0, _08097AAC @ =0x0000038A
	bl m4aSongNumStart
_08097A86:
	ldrb r0, [r7]
	cmp r4, r0
	bgt _08097AA0
	subs r0, r4, #1
	strb r0, [r7]
	lsls r1, r0, #4
	adds r1, #0x48
	movs r3, #0x80
	lsls r3, r3, #4
	movs r0, #0x10
	movs r2, #0xb
	bl ShowSysHandCursor
_08097AA0:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08097AA8: .4byte gPlaySt
_08097AAC: .4byte 0x0000038A

	thumb_func_start sub_8097AB0
sub_8097AB0: @ 0x08097AB0
	push {r4, r5, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x38]
	cmp r0, #1
	bne _08097AD8
	ldr r0, _08097AD4 @ =gpKeySt
	ldr r1, [r0]
	movs r0, #0x81
	lsls r0, r0, #1
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _08097B74
	bl CloseHelpBox
	movs r0, #0
	strh r0, [r4, #0x38]
	b _08097BB6
	.align 2, 0
_08097AD4: .4byte gpKeySt
_08097AD8:
	ldr r0, _08097B0C @ =gpKeySt
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r1
	cmp r0, #0
	beq _08097B10
	ldr r0, [r4, #0x2c]
	adds r1, r4, #0
	adds r1, #0x31
	ldrb r3, [r1]
	lsls r1, r3, #1
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r2, [r0]
	cmp r2, #0
	beq _08097BB6
	lsls r1, r3, #4
	adds r1, #0x48
	movs r0, #0x10
	bl StartItemHelpBox
	movs r0, #1
	strh r0, [r4, #0x38]
	b _08097BB6
	.align 2, 0
_08097B0C: .4byte gpKeySt
_08097B10:
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _08097B48
	ldr r0, [r4, #0x2c]
	adds r1, r4, #0
	adds r1, #0x31
	ldrb r1, [r1]
	bl sub_8091828
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08097B40
	movs r1, #1
	rsbs r1, r1, #0
	ldr r2, _08097B3C @ =0x000003B3
	adds r0, r1, #0
	adds r3, r4, #0
	bl sub_8091664
	b _08097BB6
	.align 2, 0
_08097B3C: .4byte 0x000003B3
_08097B40:
	adds r0, r4, #0
	bl sub_8097990
	b _08097BB6
_08097B48:
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _08097B74
	adds r0, r4, #0
	movs r1, #1
	bl Proc_Goto
	ldr r0, _08097B6C @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08097BB6
	ldr r0, _08097B70 @ =0x0000038B
	bl m4aSongNumStart
	b _08097BB6
	.align 2, 0
_08097B6C: .4byte gPlaySt
_08097B70: .4byte 0x0000038B
_08097B74:
	adds r0, r4, #0
	bl sub_80978D8
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08097BB6
	adds r5, r4, #0
	adds r5, #0x31
	ldrb r0, [r5]
	lsls r1, r0, #4
	adds r1, #0x48
	movs r3, #0x80
	lsls r3, r3, #4
	movs r0, #0x10
	movs r2, #0xb
	bl ShowSysHandCursor
	ldrh r0, [r4, #0x38]
	cmp r0, #1
	bne _08097BB6
	ldr r0, [r4, #0x2c]
	ldrb r3, [r5]
	lsls r1, r3, #1
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r2, [r0]
	cmp r2, #0
	beq _08097BB6
	lsls r1, r3, #4
	adds r1, #0x48
	movs r0, #0x10
	bl StartItemHelpBox
_08097BB6:
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start sub_8097BBC
sub_8097BBC: @ 0x08097BBC
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x30
	ldrb r0, [r0]
	cmp r0, #0
	bne _08097BD8
	ldr r0, _08097BF0 @ =gUnk_08D8C154
	bl Proc_Find
	adds r1, r4, #0
	adds r1, #0x35
	ldrb r1, [r1]
	adds r0, #0x32
	strb r1, [r0]
_08097BD8:
	adds r0, r4, #0
	bl EndAllProcChildren
	bl EndMuralBackground_
	movs r0, #0
	bl SetOnHBlankA
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08097BF0: .4byte gUnk_08D8C154

	thumb_func_start sub_8097BF4
sub_8097BF4: @ 0x08097BF4
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08097C0C @ =gUnk_08D8D120
	bl Proc_StartBlocking
	str r4, [r0, #0x2c]
	adds r0, #0x30
	movs r1, #0
	strb r1, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08097C0C: .4byte gUnk_08D8D120

	thumb_func_start sub_8097C10
sub_8097C10: @ 0x08097C10
	push {r4, lr}
	ldr r4, _08097C2C @ =gActiveUnit
	ldr r0, [r4]
	cmp r0, #0
	beq _08097C24
	bl EndAllMus
	ldr r0, [r4]
	bl ShowUnitSprite
_08097C24:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08097C2C: .4byte gActiveUnit

	thumb_func_start sub_8097C30
sub_8097C30: @ 0x08097C30
	push {r4, lr}
	ldr r4, _08097C50 @ =gActiveUnit
	ldr r0, [r4]
	cmp r0, #0
	beq _08097C48
	bl HideUnitSprite
	ldr r0, [r4]
	bl StartMu
	bl MU_SetDefaultFacing_Auto
_08097C48:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08097C50: .4byte gActiveUnit

	thumb_func_start sub_8097C54
sub_8097C54: @ 0x08097C54
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08097C70 @ =gUnk_08D8D1F0
	movs r1, #3
	bl Proc_Start
	str r4, [r0, #0x2c]
	adds r0, #0x30
	movs r1, #1
	strb r1, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08097C70: .4byte gUnk_08D8D1F0

	thumb_func_start sub_8097C74
sub_8097C74: @ 0x08097C74
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08097C90 @ =gUnk_08D8D1F0
	movs r1, #3
	bl Proc_Start
	str r4, [r0, #0x2c]
	adds r0, #0x30
	movs r1, #2
	strb r1, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08097C90: .4byte gUnk_08D8D1F0

	thumb_func_start sub_8097C94
sub_8097C94: @ 0x08097C94
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08097CD8 @ =gUnk_08D8C154
	bl Proc_Find
	movs r2, #0
	movs r1, #0
	strh r1, [r4, #0x36]
	movs r1, #0xff
	strh r1, [r4, #0x34]
	adds r0, #0x31
	ldrb r0, [r0]
	adds r1, r4, #0
	adds r1, #0x33
	strb r0, [r1]
	subs r1, #2
	movs r0, #4
	strb r0, [r1]
	adds r0, r4, #0
	adds r0, #0x30
	strb r2, [r0]
	movs r2, #0
	adds r0, #8
	movs r1, #8
_08097CC4:
	strh r2, [r0]
	strh r2, [r0, #0x12]
	adds r0, #2
	subs r1, #1
	cmp r1, #0
	bge _08097CC4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08097CD8: .4byte gUnk_08D8C154

	thumb_func_start sub_8097CDC
sub_8097CDC: @ 0x08097CDC
	push {r4, lr}
	sub sp, #8
	ldr r4, _08097D10 @ =gBg0Tm + 0x68
	adds r0, r4, #0
	movs r1, #0xc
	movs r2, #1
	movs r3, #0
	bl TmFillRect_thm
	ldr r0, _08097D14 @ =0x02012BE0
	movs r1, #0
	str r1, [sp]
	ldr r1, _08097D18 @ =gUnk_0842D0FC
	str r1, [sp, #4]
	adds r1, r4, #0
	movs r2, #0
	movs r3, #0
	bl PutDrawText
	movs r0, #1
	bl EnableBgSync
	add sp, #8
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08097D10: .4byte gBg0Tm + 0x68
_08097D14: .4byte 0x02012BE0
_08097D18: .4byte gUnk_0842D0FC

	thumb_func_start sub_8097D1C
sub_8097D1C: @ 0x08097D1C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #8
	adds r6, r0, #0
	adds r6, #0x33
	ldrb r2, [r6]
	lsls r1, r2, #1
	adds r5, r0, #0
	adds r5, #0x38
	adds r1, r5, r1
	ldrh r4, [r1]
	ldr r0, _08097D64 @ =gBg0Tm + 0x70
	mov r8, r0
	movs r1, #0xa
	movs r2, #1
	movs r3, #0
	bl TmFillRect_thm
	ldr r7, _08097D68 @ =0x02012B70
	adds r0, r7, #0
	bl ClearText
	ldr r0, _08097D6C @ =0x02012466
	ldrh r0, [r0]
	cmp r0, r4
	bgt _08097D74
	movs r0, #0
	str r0, [sp]
	ldr r0, _08097D70 @ =gUnk_0842D108
	str r0, [sp, #4]
	adds r0, r7, #0
	mov r1, r8
	movs r2, #1
	b _08097D94
	.align 2, 0
_08097D64: .4byte gBg0Tm + 0x70
_08097D68: .4byte 0x02012B70
_08097D6C: .4byte 0x02012466
_08097D70: .4byte gUnk_0842D108
_08097D74:
	ldr r0, _08097D9C @ =0x020117E4
	ldrb r6, [r6]
	lsls r1, r6, #1
	adds r1, r5, r1
	ldrh r1, [r1]
	lsls r1, r1, #2
	adds r1, r1, r0
	ldrb r0, [r1]
	cmp r0, #0
	bne _08097DA4
	str r0, [sp]
	ldr r0, _08097DA0 @ =gUnk_0842D110
	str r0, [sp, #4]
	adds r0, r7, #0
	mov r1, r8
	movs r2, #3
_08097D94:
	movs r3, #0
	bl PutDrawText
	b _08097DC2
	.align 2, 0
_08097D9C: .4byte 0x020117E4
_08097DA0: .4byte gUnk_0842D110
_08097DA4:
	bl GetUnitFromCharId
	ldr r0, [r0]
	ldrh r0, [r0]
	bl DecodeMsg
	movs r1, #0
	str r1, [sp]
	str r0, [sp, #4]
	adds r0, r7, #0
	mov r1, r8
	movs r2, #0
	movs r3, #0
	bl PutDrawText
_08097DC2:
	movs r0, #1
	bl EnableBgSync
	add sp, #8
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_8097DD4
sub_8097DD4: @ 0x08097DD4
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r6, r0, #0
	adds r7, r6, #0
	adds r7, #0x33
	ldrb r0, [r7]
	lsls r4, r0, #1
	adds r4, r4, r0
	lsls r4, r4, #2
	adds r4, #0x7c
	bl GetGameTime
	ldr r2, _08097E4C @ =gPal
	lsrs r0, r0, #2
	movs r1, #0xf
	ands r0, r1
	lsls r0, r0, #1
	ldr r1, _08097E50 @ =gUnk_08421C24
	adds r0, r0, r1
	ldrh r0, [r0]
	ldr r1, _08097E54 @ =0x0000029A
	adds r2, r2, r1
	strh r0, [r2]
	bl EnablePalSync
	ldr r1, _08097E58 @ =gUnk_08D8D4F8
	ldrb r2, [r7]
	lsls r0, r2, #2
	adds r0, r0, r1
	ldr r3, [r0]
	movs r5, #0x85
	lsls r5, r5, #7
	str r5, [sp]
	movs r0, #4
	adds r1, r4, #0
	movs r2, #0x18
	bl PutSprite
	ldr r3, _08097E5C @ =gUnk_08D8D4E8
	str r5, [sp]
	movs r0, #4
	adds r1, r4, #0
	movs r2, #0x18
	bl PutSprite
	ldrb r7, [r7]
	lsls r0, r7, #1
	adds r6, #0x4a
	adds r6, r6, r0
	ldrh r1, [r6]
	ldr r0, _08097E60 @ =0x02012466
	ldrh r2, [r0]
	movs r0, #0xb
	movs r3, #7
	bl sub_8090E04
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08097E4C: .4byte gPal
_08097E50: .4byte gUnk_08421C24
_08097E54: .4byte 0x0000029A
_08097E58: .4byte gUnk_08D8D4F8
_08097E5C: .4byte gUnk_08D8D4E8
_08097E60: .4byte 0x02012466

	thumb_func_start sub_8097E64
sub_8097E64: @ 0x08097E64
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #8
	adds r7, r0, #0
	ldr r0, _080981A4 @ =gDispIo
	mov r8, r0
	movs r0, #8
	rsbs r0, r0, #0
	mov r1, r8
	ldrb r1, [r1]
	ands r0, r1
	mov r2, r8
	strb r0, [r2]
	movs r0, #0
	bl InitBgs
	movs r0, #0
	bl GetBgTilemap
	movs r1, #0
	bl TmFill
	movs r0, #1
	bl GetBgTilemap
	movs r1, #0
	bl TmFill
	movs r0, #2
	bl GetBgTilemap
	movs r1, #0
	bl TmFill
	movs r1, #4
	rsbs r1, r1, #0
	adds r0, r1, #0
	mov r3, r8
	ldrb r3, [r3, #0xc]
	ands r0, r3
	movs r4, #1
	orrs r0, r4
	mov r2, r8
	strb r0, [r2, #0xc]
	adds r0, r1, #0
	ldrb r3, [r2, #0x10]
	ands r0, r3
	movs r2, #2
	mov sb, r2
	mov r3, sb
	orrs r0, r3
	mov r2, r8
	strb r0, [r2, #0x10]
	ldrb r3, [r2, #0x14]
	ands r1, r3
	strb r1, [r2, #0x14]
	movs r0, #3
	ldrb r1, [r2, #0x18]
	orrs r0, r1
	strb r0, [r2, #0x18]
	bl InitFaces
	bl ResetText
	bl InitIcons
	bl UnpackUiWindowFrameGraphics
	bl ApplySystemObjectsGraphics
	movs r0, #0
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	movs r0, #1
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	adds r0, r7, #0
	adds r0, #0x33
	ldrb r0, [r0]
	lsls r1, r0, #1
	adds r0, r7, #0
	adds r0, #0x4a
	adds r0, r0, r1
	ldrh r2, [r0]
	subs r2, #0x28
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	movs r0, #2
	movs r1, #0
	bl SetBgOffset
	ldr r0, _080981A8 @ =0x06012000
	movs r1, #1
	rsbs r1, r1, #0
	bl LoadHelpBoxGfx
	movs r0, #4
	bl ApplyIconPalettes
	bl sub_808ED8C
	movs r0, #0xa0
	lsls r0, r0, #7
	movs r1, #5
	bl sub_809228C
	ldr r0, _080981AC @ =gBg1Tm
	ldr r1, _080981B0 @ =gUnk_0842AA0C
	movs r2, #0xa5
	lsls r2, r2, #7
	bl TmApplyTsa_thm
	movs r0, #7
	bl EnableBgSync
	adds r0, r7, #0
	bl sub_80A98C8
	adds r0, r7, #0
	bl ResetSysHandCursor
	movs r0, #0xc0
	lsls r0, r0, #3
	movs r1, #1
	bl DisplaySysHandCursorTextShadow
	movs r0, #0x20
	mov r2, r8
	ldrb r2, [r2, #1]
	orrs r0, r2
	movs r1, #0x41
	rsbs r1, r1, #0
	ands r0, r1
	movs r1, #0x7f
	ands r0, r1
	mov r3, r8
	strb r0, [r3, #1]
	mov r1, r8
	adds r1, #0x2d
	movs r0, #0x80
	strb r0, [r1]
	adds r1, #4
	movs r0, #0x28
	strb r0, [r1]
	subs r1, #5
	movs r0, #0xe0
	strb r0, [r1]
	adds r1, #4
	movs r0, #0x98
	strb r0, [r1]
	mov r2, r8
	adds r2, #0x34
	ldrb r0, [r2]
	orrs r0, r4
	mov r1, sb
	orrs r0, r1
	movs r1, #4
	orrs r0, r1
	movs r5, #8
	orrs r0, r5
	movs r3, #0x10
	orrs r0, r3
	strb r0, [r2]
	mov r1, r8
	adds r1, #0x36
	ldrb r2, [r1]
	orrs r4, r2
	mov r0, sb
	orrs r4, r0
	movs r0, #5
	rsbs r0, r0, #0
	ands r4, r0
	orrs r4, r5
	orrs r4, r3
	strb r4, [r1]
	adds r0, r7, #0
	bl StartGreenText
	movs r0, #0xc8
	movs r1, #0x90
	adds r2, r7, #0
	bl StartHelpPromptSprite
	ldr r4, _080981B4 @ =0x02012B68
	adds r0, r4, #0
	movs r1, #6
	bl InitText
	adds r0, r4, #0
	adds r0, #8
	movs r1, #5
	bl InitText
	adds r0, r4, #0
	adds r0, #0x78
	movs r1, #4
	bl InitText
	adds r4, #0x10
	movs r5, #4
_08098000:
	adds r0, r4, #0
	movs r1, #7
	bl InitText
	adds r4, #8
	subs r5, #1
	cmp r5, #0
	bge _08098000
	movs r1, #0x33
	adds r1, r1, r7
	mov r8, r1
	adds r6, r7, #0
	adds r6, #0x4a
	ldr r4, _080981B8 @ =0x02012BA0
	movs r5, #7
_0809801E:
	adds r0, r4, #0
	movs r1, #7
	bl sub_800536C
	adds r4, #8
	subs r5, #1
	cmp r5, #0
	bge _0809801E
	movs r4, #0x80
	lsls r4, r4, #7
	adds r0, r4, #0
	movs r1, #6
	bl sub_8096464
	ldr r2, _080981BC @ =gBg0Tm + 0xde
	mov sb, r2
	mov r0, sb
	adds r1, r4, #0
	movs r2, #6
	bl sub_8096A38
	ldr r0, _080981C0 @ =gUnk_0841E0A4
	ldr r1, _080981C4 @ =0x06015000
	bl Decompress
	adds r0, r7, #0
	bl sub_8090DD0
	movs r0, #0xb0
	lsls r0, r0, #7
	movs r1, #4
	bl sub_8090E38
	movs r0, #0xe2
	movs r1, #0x30
	bl sub_8090DE4
	bl sub_8090DA0
	ldr r0, [r7, #0x2c]
	mov r3, r8
	ldrb r1, [r3]
	movs r2, #3
	bl sub_8091A74
	adds r0, r7, #0
	bl sub_80986C0
	ldr r5, _080981B8 @ =0x02012BA0
	ldr r1, _080981C8 @ =gBg2Tm + 0x1e
	mov r2, r8
	ldrb r2, [r2]
	lsls r0, r2, #1
	adds r0, r6, r0
	ldrh r0, [r0]
	lsrs r2, r0, #4
	ldr r3, [r7, #0x2c]
	adds r0, r5, #0
	bl sub_80964A0
	movs r0, #4
	bl EnableBgSync
	movs r0, #0xb3
	lsls r0, r0, #1
	add r0, sb
	adds r1, r5, #0
	subs r1, #0x28
	ldr r2, [r7, #0x2c]
	movs r3, #0
	bl sub_8094AC0
	bl sub_8097CDC
	adds r0, r7, #0
	bl StartUiSpinningArrows
	movs r1, #0xa0
	lsls r1, r1, #2
	movs r0, #0
	movs r2, #2
	bl LoadUiSpinningArrowGfx
	movs r0, #0x78
	movs r1, #0x18
	movs r2, #0xea
	movs r3, #0x18
	bl SetUiSpinningArrowPositions
	movs r0, #3
	bl SetUiSpinningArrowConfig
	ldr r0, _080981CC @ =sub_8097DD4
	adds r1, r7, #0
	bl StartParallelWorker
	ldr r0, [r7, #0x2c]
	bl GetUnitPortraitId
	adds r1, r0, #0
	movs r3, #4
	rsbs r3, r3, #0
	ldr r0, _080981D0 @ =0x00000203
	str r0, [sp]
	movs r0, #0
	movs r2, #0x40
	bl StartBmFace
	ldr r0, [r7, #0x2c]
	ldr r0, [r0]
	ldrh r0, [r0]
	bl DecodeMsg
	mov r8, r0
	movs r1, #0xe0
	lsls r1, r1, #4
	movs r3, #0xc0
	lsls r3, r3, #4
	movs r0, #0x80
	lsls r0, r0, #3
	str r0, [sp]
	str r7, [sp, #4]
	movs r0, #0xd
	movs r2, #0xf
	bl StartSysBrownBox
	movs r1, #0x28
	rsbs r1, r1, #0
	movs r2, #1
	rsbs r2, r2, #0
	movs r0, #0
	movs r3, #1
	bl EnableSysBrownBox
	movs r0, #1
	movs r1, #0x98
	movs r2, #6
	movs r3, #2
	bl EnableSysBrownBox
	ldr r3, _080981A4 @ =gDispIo
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
	movs r4, #0
	movs r0, #0xe
	strb r0, [r1]
	adds r1, #1
	movs r0, #4
	strb r0, [r1]
	adds r0, r3, #0
	adds r0, #0x46
	strb r4, [r0]
	ldr r0, _080981D4 @ =0x0000FFE0
	ldrh r2, [r3, #0x3c]
	ands r0, r2
	ldr r1, _080981D8 @ =0x0000E0FF
	ands r0, r1
	movs r2, #0x80
	lsls r2, r2, #4
	adds r1, r2, #0
	orrs r0, r1
	strh r0, [r3, #0x3c]
	movs r0, #0x30
	mov r1, r8
	bl GetStringTextCenteredPos
	adds r3, r0, #0
	subs r5, #0x38
	str r4, [sp]
	mov r0, r8
	str r0, [sp, #4]
	adds r0, r5, #0
	ldr r1, _080981DC @ =gBg0Tm
	movs r2, #0
	bl PutDrawText
	adds r0, r7, #0
	bl sub_8097D1C
	add sp, #8
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080981A4: .4byte gDispIo
_080981A8: .4byte 0x06012000
_080981AC: .4byte gBg1Tm
_080981B0: .4byte gUnk_0842AA0C
_080981B4: .4byte 0x02012B68
_080981B8: .4byte 0x02012BA0
_080981BC: .4byte gBg0Tm + 0xde
_080981C0: .4byte gUnk_0841E0A4
_080981C4: .4byte 0x06015000
_080981C8: .4byte gBg2Tm + 0x1e
_080981CC: .4byte sub_8097DD4
_080981D0: .4byte 0x00000203
_080981D4: .4byte 0x0000FFE0
_080981D8: .4byte 0x0000E0FF
_080981DC: .4byte gBg0Tm

	thumb_func_start sub_80981E0
sub_80981E0: @ 0x080981E0
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0809820C @ =gUnk_08D8C154
	bl Proc_Find
	adds r1, r4, #0
	adds r1, #0x33
	ldrb r1, [r1]
	adds r0, #0x31
	strb r1, [r0]
	adds r0, r4, #0
	bl EndAllProcChildren
	movs r0, #0
	bl EndFaceById
	bl EndMuralBackground_
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0809820C: .4byte gUnk_08D8C154

	thumb_func_start sub_8098210
sub_8098210: @ 0x08098210
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	bl InitIcons
	ldr r0, [r4, #0x2c]
	adds r5, r4, #0
	adds r5, #0x33
	ldrb r1, [r5]
	movs r2, #3
	bl sub_8091A74
	adds r0, r4, #0
	bl sub_8098430
	ldr r0, _080982B0 @ =0x02012BA0
	ldr r1, _080982B4 @ =gBg2Tm + 0x1e
	ldrb r3, [r5]
	lsls r2, r3, #1
	adds r6, r4, #0
	adds r6, #0x4a
	adds r2, r6, r2
	ldrh r2, [r2]
	lsrs r2, r2, #4
	ldr r3, [r4, #0x2c]
	bl sub_80964A0
	ldr r0, _080982B8 @ =gBg0Tm + 0x244
	ldr r1, [r4, #0x2c]
	bl sub_8094BA4
	ldrb r1, [r5]
	lsls r0, r1, #1
	adds r7, r4, #0
	adds r7, #0x38
	adds r1, r7, r0
	ldrh r1, [r1]
	lsls r1, r1, #4
	adds r0, r6, r0
	ldrh r0, [r0]
	subs r0, #0x28
	subs r1, r1, r0
	movs r3, #0x80
	lsls r3, r3, #4
	movs r0, #0x80
	movs r2, #0xb
	bl ShowSysHandCursor
	movs r0, #5
	bl EnableBgSync
	ldr r0, _080982BC @ =sub_8097D1C
	movs r1, #2
	adds r2, r4, #0
	bl StartParallelFiniteLoop
	ldrh r0, [r4, #0x36]
	cmp r0, #0
	beq _080982D0
	ldr r0, _080982C0 @ =0x02012466
	ldrh r0, [r0]
	cmp r0, #0
	beq _080982C8
	ldr r2, _080982C4 @ =0x020117E4
	ldrb r5, [r5]
	lsls r3, r5, #1
	adds r0, r7, r3
	ldrh r1, [r0]
	lsls r0, r1, #2
	adds r0, r0, r2
	ldrh r2, [r0, #2]
	lsls r1, r1, #4
	adds r3, r6, r3
	ldrh r0, [r3]
	subs r0, #0x28
	subs r1, r1, r0
	movs r0, #0x80
	bl StartItemHelpBox
	movs r0, #1
	b _080982CE
	.align 2, 0
_080982B0: .4byte 0x02012BA0
_080982B4: .4byte gBg2Tm + 0x1e
_080982B8: .4byte gBg0Tm + 0x244
_080982BC: .4byte sub_8097D1C
_080982C0: .4byte 0x02012466
_080982C4: .4byte 0x020117E4
_080982C8:
	bl CloseHelpBox
	movs r0, #0xff
_080982CE:
	strh r0, [r4, #0x36]
_080982D0:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_80982D8
sub_80982D8: @ 0x080982D8
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r7, r0, #0
	movs r0, #4
	mov r8, r0
	adds r1, r7, #0
	adds r1, #0x32
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	ldrb r4, [r1]
	cmp r4, #4
	bge _0809830A
	mov r2, r8
	subs r1, r2, r4
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #5
	muls r0, r1, r0
	movs r1, #0x10
	bl __divsi3
	adds r6, r0, #0
	subs r6, #0x60
_0809830A:
	adds r5, r7, #0
	adds r5, #0x33
	cmp r4, #4
	bne _08098326
	ldrb r0, [r5]
	cmp r0, #0
	bne _0809831C
	movs r0, #8
	b _0809831E
_0809831C:
	subs r0, #1
_0809831E:
	strb r0, [r5]
	adds r0, r7, #0
	bl sub_8098210
_08098326:
	adds r4, r7, #0
	adds r4, #0x32
	ldrb r1, [r4]
	cmp r1, r8
	blt _0809834A
	mov r0, r8
	subs r1, r1, r0
	subs r1, r0, r1
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #5
	muls r0, r1, r0
	mov r2, r8
	mov r1, r8
	muls r1, r2, r1
	bl __divsi3
	adds r6, r0, #0
_0809834A:
	movs r0, #0xff
	ands r6, r0
	ldrb r5, [r5]
	lsls r1, r5, #1
	adds r0, r7, #0
	adds r0, #0x4a
	adds r0, r0, r1
	ldrh r2, [r0]
	subs r2, #0x28
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	movs r0, #2
	adds r1, r6, #0
	bl SetBgOffset
	mov r1, r8
	lsls r0, r1, #1
	ldrb r4, [r4]
	cmp r4, r0
	bne _0809837A
	adds r0, r7, #0
	movs r1, #1
	bl Proc_Goto
_0809837A:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_8098384
sub_8098384: @ 0x08098384
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r7, r0, #0
	movs r0, #4
	mov r8, r0
	adds r1, r7, #0
	adds r1, #0x32
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	ldrb r4, [r1]
	cmp r4, #4
	bge _080983B6
	mov r2, r8
	subs r1, r2, r4
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #5
	muls r0, r1, r0
	movs r1, #0x10
	bl __divsi3
	movs r1, #0x60
	subs r6, r1, r0
_080983B6:
	adds r5, r7, #0
	adds r5, #0x33
	cmp r4, #4
	bne _080983D2
	ldrb r0, [r5]
	cmp r0, #8
	bne _080983C8
	movs r0, #0
	b _080983CA
_080983C8:
	adds r0, #1
_080983CA:
	strb r0, [r5]
	adds r0, r7, #0
	bl sub_8098210
_080983D2:
	adds r4, r7, #0
	adds r4, #0x32
	ldrb r1, [r4]
	cmp r1, r8
	blt _080983F6
	mov r0, r8
	subs r1, r1, r0
	subs r1, r0, r1
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #5
	muls r0, r1, r0
	mov r2, r8
	mov r1, r8
	muls r1, r2, r1
	bl __divsi3
	rsbs r6, r0, #0
_080983F6:
	movs r0, #0xff
	ands r6, r0
	ldrb r5, [r5]
	lsls r1, r5, #1
	adds r0, r7, #0
	adds r0, #0x4a
	adds r0, r0, r1
	ldrh r2, [r0]
	subs r2, #0x28
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	movs r0, #2
	adds r1, r6, #0
	bl SetBgOffset
	mov r1, r8
	lsls r0, r1, #1
	ldrb r4, [r4]
	cmp r4, r0
	bne _08098426
	adds r0, r7, #0
	movs r1, #1
	bl Proc_Goto
_08098426:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_8098430
sub_8098430: @ 0x08098430
	push {r4, r5, lr}
	mov ip, r0
	ldr r0, _08098458 @ =0x02012466
	ldrh r4, [r0]
	adds r5, r0, #0
	cmp r4, #0
	bne _0809845C
	mov r3, ip
	adds r3, #0x33
	ldrb r1, [r3]
	lsls r0, r1, #1
	mov r1, ip
	adds r1, #0x38
	adds r1, r1, r0
	mov r2, ip
	adds r2, #0x4a
	adds r0, r2, r0
	strh r4, [r0]
	strh r4, [r1]
	b _0809847A
	.align 2, 0
_08098458: .4byte 0x02012466
_0809845C:
	mov r2, ip
	adds r2, #0x33
	ldrb r0, [r2]
	lsls r1, r0, #1
	mov r0, ip
	adds r0, #0x38
	adds r0, r0, r1
	ldrh r4, [r5]
	subs r4, #1
	adds r3, r2, #0
	adds r2, #0x17
	ldrh r1, [r0]
	cmp r1, r4
	ble _0809847A
	strh r4, [r0]
_0809847A:
	ldrh r0, [r5]
	cmp r0, #6
	bls _08098498
	ldrb r1, [r3]
	lsls r0, r1, #1
	adds r4, r2, r0
	ldrh r1, [r4]
	lsrs r0, r1, #4
	adds r0, #7
	ldrh r1, [r5]
	cmp r0, r1
	ble _08098498
	subs r0, r1, #7
	lsls r0, r0, #4
	strh r0, [r4]
_08098498:
	ldrb r3, [r3]
	lsls r0, r3, #1
	adds r0, r2, r0
	ldrh r2, [r0]
	subs r2, #0x28
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	movs r0, #2
	movs r1, #0
	bl SetBgOffset
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start sub_80984B4
sub_80984B4: @ 0x080984B4
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r4, r0, #0
	adds r7, r1, #0
	bl InitIcons
	ldr r0, _0809854C @ =gBg2Tm + 0x1e
	mov r8, r0
	adds r6, r4, #0
	adds r6, #0x33
	ldrb r1, [r6]
	lsls r0, r1, #1
	adds r5, r4, #0
	adds r5, #0x4a
	adds r0, r5, r0
	ldrh r0, [r0]
	lsrs r1, r0, #4
	mov r0, r8
	bl sub_80965B4
	ldr r0, _08098550 @ =gBg0Tm + 0x244
	ldr r1, [r4, #0x2c]
	bl sub_8094BA4
	movs r0, #5
	bl EnableBgSync
	cmp r7, #0
	bge _08098506
	ldr r0, _08098554 @ =0x02012BA0
	ldrb r2, [r6]
	lsls r1, r2, #1
	adds r1, r5, r1
	ldrh r1, [r1]
	lsrs r2, r1, #4
	subs r2, #1
	ldr r3, [r4, #0x2c]
	mov r1, r8
	bl sub_8096618
_08098506:
	cmp r7, #0
	ble _08098520
	ldr r0, _08098554 @ =0x02012BA0
	ldrb r2, [r6]
	lsls r1, r2, #1
	adds r1, r5, r1
	ldrh r1, [r1]
	lsrs r2, r1, #4
	adds r2, #7
	ldr r3, [r4, #0x2c]
	mov r1, r8
	bl sub_8096618
_08098520:
	ldrb r1, [r6]
	lsls r0, r1, #1
	adds r0, r5, r0
	ldrh r2, [r0]
	adds r1, r2, r7
	strh r1, [r0]
	ldrb r6, [r6]
	lsls r0, r6, #1
	adds r0, r5, r0
	ldrh r2, [r0]
	subs r2, #0x28
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	movs r0, #2
	movs r1, #0
	bl SetBgOffset
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0809854C: .4byte gBg2Tm + 0x1e
_08098550: .4byte gBg0Tm + 0x244
_08098554: .4byte 0x02012BA0

	thumb_func_start sub_8098558
sub_8098558: @ 0x08098558
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	adds r6, r0, #0
	ldr r0, [r6, #0x2c]
	bl GetUnitItemCount
	adds r2, r0, #0
	cmp r2, #5
	beq _08098576
	ldr r0, _08098590 @ =0x02012466
	ldrh r0, [r0]
	cmp r0, #0
	bne _08098598
_08098576:
	ldr r0, _08098594 @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	bge _08098584
	b _080986AA
_08098584:
	movs r0, #0xe3
	lsls r0, r0, #2
	bl m4aSongNumStart
	b _080986AA
	.align 2, 0
_08098590: .4byte 0x02012466
_08098594: .4byte gPlaySt
_08098598:
	movs r4, #0
	strh r4, [r6, #0x36]
	ldr r1, [r6, #0x2c]
	lsls r0, r2, #1
	adds r1, #0x1e
	adds r1, r1, r0
	ldr r0, _0809867C @ =0x020117E4
	mov sb, r0
	adds r7, r6, #0
	adds r7, #0x33
	ldrb r2, [r7]
	lsls r0, r2, #1
	adds r5, r6, #0
	adds r5, #0x38
	adds r0, r5, r0
	ldrh r0, [r0]
	lsls r0, r0, #2
	add r0, sb
	ldrh r0, [r0, #2]
	strh r0, [r1]
	ldr r0, [r6, #0x2c]
	bl UnitRemoveInvalidItems
	ldrb r1, [r7]
	lsls r0, r1, #1
	adds r0, r5, r0
	ldrh r0, [r0]
	lsls r0, r0, #2
	add r0, sb
	strh r4, [r0, #2]
	bl sub_8091B48
	ldr r0, [r6, #0x2c]
	ldrb r1, [r7]
	movs r2, #3
	bl sub_8091A74
	adds r0, r6, #0
	bl sub_8098430
	bl InitIcons
	ldr r0, _08098680 @ =gBg0Tm + 0x244
	ldr r4, _08098684 @ =0x02012B78
	ldr r2, [r6, #0x2c]
	adds r1, r4, #0
	movs r3, #0
	bl sub_8094AC0
	adds r4, #0x28
	ldr r1, _08098688 @ =gBg2Tm + 0x1e
	ldrb r2, [r7]
	lsls r0, r2, #1
	movs r2, #0x4a
	adds r2, r2, r6
	mov r8, r2
	add r0, r8
	ldrh r0, [r0]
	lsrs r2, r0, #4
	ldr r3, [r6, #0x2c]
	adds r0, r4, #0
	bl sub_80964A0
	ldrb r1, [r7]
	lsls r0, r1, #1
	adds r0, r5, r0
	ldrh r0, [r0]
	lsls r0, r0, #2
	add r0, sb
	ldrb r0, [r0]
	cmp r0, #0
	beq _08098632
	ldr r0, _0809868C @ =sub_8097D1C
	movs r1, #1
	adds r2, r6, #0
	bl StartParallelFiniteLoop
_08098632:
	ldrb r7, [r7]
	lsls r0, r7, #1
	adds r1, r5, r0
	ldrh r1, [r1]
	lsls r1, r1, #4
	add r0, r8
	ldrh r0, [r0]
	subs r0, #0x28
	subs r1, r1, r0
	movs r3, #0x80
	lsls r3, r3, #4
	movs r0, #0x80
	movs r2, #0xb
	bl ShowSysHandCursor
	movs r0, #5
	bl EnableBgSync
	ldr r0, [r6, #0x2c]
	bl GetUnitItemCount
	cmp r0, #5
	bne _08098698
	adds r0, r6, #0
	movs r1, #1
	bl Proc_Goto
	ldr r0, _08098690 @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080986AA
	ldr r0, _08098694 @ =0x0000038B
	bl m4aSongNumStart
	b _080986AA
	.align 2, 0
_0809867C: .4byte 0x020117E4
_08098680: .4byte gBg0Tm + 0x244
_08098684: .4byte 0x02012B78
_08098688: .4byte gBg2Tm + 0x1e
_0809868C: .4byte sub_8097D1C
_08098690: .4byte gPlaySt
_08098694: .4byte 0x0000038B
_08098698:
	ldr r0, _080986B8 @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080986AA
	ldr r0, _080986BC @ =0x0000038A
	bl m4aSongNumStart
_080986AA:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080986B8: .4byte gPlaySt
_080986BC: .4byte 0x0000038A

	thumb_func_start sub_80986C0
sub_80986C0: @ 0x080986C0
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	mov ip, r0
	adds r0, #0x33
	ldrb r0, [r0]
	lsls r2, r0, #1
	mov r0, ip
	adds r0, #0x38
	adds r4, r0, r2
	ldrh r3, [r4]
	lsls r1, r3, #4
	adds r0, #0x12
	adds r0, r0, r2
	ldrh r0, [r0]
	subs r0, #0x28
	subs r1, r1, r0
	cmp r1, #0x37
	bgt _080986EE
	cmp r3, #0
	beq _080986EE
	adds r0, r3, #1
	strh r0, [r4]
_080986EE:
	mov r4, ip
	adds r4, #0x33
	ldrb r1, [r4]
	lsls r0, r1, #1
	mov r3, ip
	adds r3, #0x38
	adds r6, r3, r0
	ldrh r5, [r6]
	lsls r1, r5, #4
	mov r2, ip
	adds r2, #0x4a
	adds r0, r2, r0
	ldrh r0, [r0]
	subs r0, #0x28
	subs r1, r1, r0
	adds r7, r3, #0
	mov r8, r2
	cmp r1, #0x78
	ble _08098722
	ldr r0, _08098750 @ =0x02012466
	ldrh r0, [r0]
	subs r0, #1
	cmp r5, r0
	beq _08098722
	subs r0, r5, #1
	strh r0, [r6]
_08098722:
	mov r0, ip
	bl sub_8098430
	ldrb r4, [r4]
	lsls r0, r4, #1
	adds r1, r7, r0
	ldrh r1, [r1]
	lsls r1, r1, #4
	add r0, r8
	ldrh r0, [r0]
	subs r0, #0x28
	subs r1, r1, r0
	movs r3, #0x80
	lsls r3, r3, #4
	movs r0, #0x80
	movs r2, #0xb
	bl ShowSysHandCursor
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08098750: .4byte 0x02012466

	thumb_func_start sub_8098754
sub_8098754: @ 0x08098754
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	adds r4, r0, #0
	adds r6, r4, #0
	adds r6, #0x33
	ldrb r0, [r6]
	lsls r1, r0, #1
	movs r2, #0x38
	adds r2, r2, r4
	mov r8, r2
	adds r0, r2, r1
	ldrh r0, [r0]
	mov sb, r0
	adds r5, r4, #0
	adds r5, #0x4a
	adds r7, r5, r1
	movs r3, #0xf
	ldrh r0, [r7]
	ands r0, r3
	mov sl, r0
	cmp r0, #0
	beq _08098788
	b _080989DC
_08098788:
	ldrh r0, [r4, #0x36]
	cmp r0, #0
	beq _08098794
	cmp r0, #0xff
	beq _08098794
	b _08098890
_08098794:
	ldr r1, _080987D0 @ =gpKeySt
	ldr r0, [r1]
	ldrh r3, [r0, #8]
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r3
	mov r8, r1
	cmp r0, #0
	beq _080987DC
	ldr r0, _080987D4 @ =0x02012466
	ldrh r0, [r0]
	cmp r0, #0
	beq _080987EC
	ldr r1, _080987D8 @ =0x020117E4
	mov r2, sb
	lsls r0, r2, #2
	adds r0, r0, r1
	ldrh r2, [r0, #2]
	mov r3, sb
	lsls r1, r3, #4
	ldrh r0, [r7]
	subs r0, #0x28
	subs r1, r1, r0
	movs r0, #0x80
	bl StartItemHelpBox
	movs r0, #1
	strh r0, [r4, #0x36]
	b _08098B52
	.align 2, 0
_080987D0: .4byte gpKeySt
_080987D4: .4byte 0x02012466
_080987D8: .4byte 0x020117E4
_080987DC:
	movs r0, #1
	ands r0, r3
	cmp r0, #0
	beq _08098860
	ldr r0, _08098804 @ =0x02012466
	ldrh r0, [r0]
	cmp r0, #0
	bne _0809880C
_080987EC:
	ldr r0, _08098808 @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	bge _080987FA
	b _08098B52
_080987FA:
	movs r0, #0xe3
	lsls r0, r0, #2
	bl m4aSongNumStart
	b _08098B52
	.align 2, 0
_08098804: .4byte 0x02012466
_08098808: .4byte gPlaySt
_0809880C:
	ldr r0, _08098834 @ =0x020117E4
	mov r2, sb
	lsls r1, r2, #2
	adds r1, r1, r0
	ldrb r0, [r1]
	cmp r0, #0
	bne _08098838
	lsls r2, r2, #4
	ldrh r0, [r7]
	subs r0, #0x28
	subs r2, r2, r0
	movs r0, #0
	movs r1, #0x80
	movs r3, #2
	bl sub_80A98DC
	adds r0, r4, #0
	movs r1, #7
	b _0809883C
	.align 2, 0
_08098834: .4byte 0x020117E4
_08098838:
	adds r0, r4, #0
	movs r1, #6
_0809883C:
	bl Proc_Goto
	ldr r0, _08098858 @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	bge _0809884E
	b _08098B52
_0809884E:
	ldr r0, _0809885C @ =0x0000038A
	bl m4aSongNumStart
	b _08098B52
	.align 2, 0
_08098858: .4byte gPlaySt
_0809885C: .4byte 0x0000038A
_08098860:
	movs r0, #2
	ands r0, r3
	cmp r0, #0
	beq _080988B0
	adds r0, r4, #0
	movs r1, #8
	bl Proc_Goto
	ldr r0, _08098888 @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08098882
	ldr r0, _0809888C @ =0x0000038B
	bl m4aSongNumStart
_08098882:
	mov r3, sl
	strh r3, [r4, #0x36]
	b _08098B52
	.align 2, 0
_08098888: .4byte gPlaySt
_0809888C: .4byte 0x0000038B
_08098890:
	ldr r2, _080988AC @ =gpKeySt
	ldr r1, [r2]
	movs r0, #0x81
	lsls r0, r0, #1
	ldrh r1, [r1, #8]
	ands r0, r1
	mov r8, r2
	cmp r0, #0
	beq _080988B0
	bl CloseHelpBox
	mov r0, sl
	strh r0, [r4, #0x36]
	b _08098B52
	.align 2, 0
_080988AC: .4byte gpKeySt
_080988B0:
	mov r1, r8
	ldr r2, [r1]
	ldrh r1, [r2, #6]
	movs r0, #0x20
	ands r0, r1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	cmp r5, #0
	beq _080988FC
	movs r0, #0
	bl SetUiSpinningArrowFastMaybe
	ldr r0, _080988F4 @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080988DA
	ldr r0, _080988F8 @ =0x00000387
	bl m4aSongNumStart
_080988DA:
	adds r0, r4, #0
	movs r1, #3
	bl Proc_Goto
	adds r1, r4, #0
	adds r1, #0x32
	movs r0, #0
	strb r0, [r1]
	adds r0, r4, #0
	bl sub_80982D8
	b _08098B52
	.align 2, 0
_080988F4: .4byte gPlaySt
_080988F8: .4byte 0x00000387
_080988FC:
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	beq _0809893C
	movs r0, #1
	bl SetUiSpinningArrowFastMaybe
	ldr r0, _08098934 @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0809891C
	ldr r0, _08098938 @ =0x00000387
	bl m4aSongNumStart
_0809891C:
	adds r0, r4, #0
	movs r1, #4
	bl Proc_Goto
	adds r0, r4, #0
	adds r0, #0x32
	strb r5, [r0]
	adds r0, r4, #0
	bl sub_8098384
	b _08098B52
	.align 2, 0
_08098934: .4byte gPlaySt
_08098938: .4byte 0x00000387
_0809893C:
	movs r0, #0x80
	lsls r0, r0, #2
	ldrh r2, [r2, #4]
	ands r0, r2
	cmp r0, #0
	beq _08098950
	adds r1, r4, #0
	adds r1, #0x31
	movs r0, #8
	b _08098956
_08098950:
	adds r1, r4, #0
	adds r1, #0x31
	movs r0, #4
_08098956:
	strb r0, [r1]
	adds r5, r1, #0
	mov r2, r8
	ldr r1, [r2]
	movs r2, #0x40
	adds r0, r2, #0
	ldrh r3, [r1, #6]
	ands r0, r3
	cmp r0, #0
	bne _08098982
	adds r0, r2, #0
	ldrh r1, [r1, #4]
	ands r0, r1
	adds r7, r4, #0
	adds r7, #0x33
	adds r6, r4, #0
	adds r6, #0x38
	cmp r0, #0
	beq _0809899E
	ldrb r0, [r5]
	cmp r0, #8
	bne _0809899E
_08098982:
	adds r0, r4, #0
	adds r0, #0x33
	ldrb r2, [r0]
	lsls r1, r2, #1
	adds r2, r4, #0
	adds r2, #0x38
	adds r3, r2, r1
	ldrh r1, [r3]
	adds r7, r0, #0
	adds r6, r2, #0
	cmp r1, #0
	beq _0809899E
	subs r0, r1, #1
	strh r0, [r3]
_0809899E:
	mov r3, r8
	ldr r1, [r3]
	movs r2, #0x80
	adds r0, r2, #0
	ldrh r3, [r1, #6]
	ands r0, r3
	cmp r0, #0
	bne _080989BE
	adds r0, r2, #0
	ldrh r1, [r1, #4]
	ands r0, r1
	cmp r0, #0
	beq _08098A3C
	ldrb r5, [r5]
	cmp r5, #8
	bne _08098A3C
_080989BE:
	ldrb r1, [r7]
	lsls r0, r1, #1
	adds r2, r6, r0
	ldrh r1, [r2]
	ldr r0, _080989D8 @ =0x02012466
	ldrh r0, [r0]
	subs r0, #1
	cmp r1, r0
	bge _08098A3C
	adds r0, r1, #1
	strh r0, [r2]
	b _08098A3C
	.align 2, 0
_080989D8: .4byte 0x02012466
_080989DC:
	mov r2, sb
	lsls r0, r2, #4
	ldrh r2, [r7]
	adds r1, r2, #0
	subs r1, #0x28
	subs r0, r0, r1
	cmp r0, #0x37
	bgt _080989FA
	adds r0, r4, #0
	adds r0, #0x31
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r0, r2, r0
	strh r0, [r7]
_080989FA:
	ldrb r3, [r6]
	lsls r2, r3, #1
	mov r1, r8
	adds r0, r1, r2
	ldrh r0, [r0]
	lsls r1, r0, #4
	adds r3, r5, r2
	ldrh r2, [r3]
	adds r0, r2, #0
	subs r0, #0x28
	subs r1, r1, r0
	cmp r1, #0x78
	ble _08098A22
	adds r0, r4, #0
	adds r0, #0x31
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r0, r2, r0
	strh r0, [r3]
_08098A22:
	ldrb r2, [r6]
	lsls r0, r2, #1
	adds r0, r5, r0
	ldrh r2, [r0]
	subs r2, #0x28
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	movs r0, #2
	movs r1, #0
	bl SetBgOffset
	adds r7, r6, #0
	mov r6, r8
_08098A3C:
	ldrb r3, [r7]
	lsls r0, r3, #1
	adds r0, r6, r0
	ldrh r0, [r0]
	cmp sb, r0
	bne _08098A4A
	b _08098B52
_08098A4A:
	ldr r5, _08098AC4 @ =0x020117E4
	lsls r0, r0, #2
	adds r0, r0, r5
	ldrh r0, [r0, #2]
	mov sl, r0
	ldr r0, _08098AC8 @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08098A66
	ldr r0, _08098ACC @ =0x00000386
	bl m4aSongNumStart
_08098A66:
	ldrb r1, [r7]
	lsls r0, r1, #1
	adds r0, r6, r0
	ldrh r0, [r0]
	lsls r1, r0, #2
	adds r1, r1, r5
	mov r2, sb
	lsls r0, r2, #2
	adds r0, r0, r5
	ldrb r1, [r1]
	ldrb r0, [r0]
	cmp r1, r0
	beq _08098A86
	adds r0, r4, #0
	bl sub_8097D1C
_08098A86:
	ldrb r3, [r7]
	lsls r1, r3, #1
	adds r0, r6, r1
	ldrh r5, [r0]
	lsls r3, r5, #4
	adds r2, r4, #0
	adds r2, #0x4a
	adds r1, r2, r1
	ldrh r0, [r1]
	subs r0, #0x28
	subs r1, r3, r0
	mov r8, r2
	cmp r1, #0x37
	bgt _08098AD0
	cmp r5, #0
	beq _08098AD0
	ldrh r0, [r4, #0x36]
	cmp r0, #0
	beq _08098AB6
	adds r1, #0x10
	movs r0, #0x80
	mov r2, sl
	bl StartItemHelpBox
_08098AB6:
	adds r0, r4, #0
	adds r0, #0x31
	movs r1, #0
	ldrsb r1, [r0, r1]
	rsbs r1, r1, #0
	b _08098B08
	.align 2, 0
_08098AC4: .4byte 0x020117E4
_08098AC8: .4byte gPlaySt
_08098ACC: .4byte 0x00000386
_08098AD0:
	ldrb r1, [r7]
	lsls r0, r1, #1
	adds r1, r6, r0
	ldrh r2, [r1]
	lsls r1, r2, #4
	add r0, r8
	ldrh r0, [r0]
	subs r0, #0x28
	subs r1, r1, r0
	cmp r1, #0x78
	ble _08098B14
	ldr r0, _08098B10 @ =0x02012466
	ldrh r0, [r0]
	subs r0, #1
	cmp r2, r0
	beq _08098B14
	ldrh r0, [r4, #0x36]
	cmp r0, #0
	beq _08098B00
	subs r1, #0x10
	movs r0, #0x80
	mov r2, sl
	bl StartItemHelpBox
_08098B00:
	adds r0, r4, #0
	adds r0, #0x31
	movs r1, #0
	ldrsb r1, [r0, r1]
_08098B08:
	adds r0, r4, #0
	bl sub_80984B4
	b _08098B52
	.align 2, 0
_08098B10: .4byte 0x02012466
_08098B14:
	ldrh r0, [r4, #0x36]
	cmp r0, #0
	beq _08098B34
	ldrb r2, [r7]
	lsls r0, r2, #1
	adds r1, r6, r0
	ldrh r1, [r1]
	lsls r1, r1, #4
	add r0, r8
	ldrh r0, [r0]
	subs r0, #0x28
	subs r1, r1, r0
	movs r0, #0x80
	mov r2, sl
	bl StartItemHelpBox
_08098B34:
	ldrb r7, [r7]
	lsls r0, r7, #1
	adds r1, r6, r0
	ldrh r1, [r1]
	lsls r1, r1, #4
	add r0, r8
	ldrh r0, [r0]
	subs r0, #0x28
	subs r1, r1, r0
	movs r3, #0x80
	lsls r3, r3, #4
	movs r0, #0x80
	movs r2, #0xb
	bl ShowSysHandCursor
_08098B52:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_8098B60
sub_8098B60: @ 0x08098B60
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x2c]
	bl GetUnitItemCount
	adds r1, r0, #0
	adds r0, r4, #0
	adds r0, #0x30
	ldrb r7, [r0]
	adds r3, r1, #0
	cmp r3, #5
	bne _08098B7C
	movs r3, #4
	b _08098B84
_08098B7C:
	ldrh r0, [r4, #0x36]
	cmp r0, #0
	beq _08098B84
	subs r3, #1
_08098B84:
	cmp r1, #0
	beq _08098C04
	ldr r1, _08098BA8 @ =gpKeySt
	ldr r5, [r1]
	movs r6, #0x40
	adds r0, r6, #0
	ldrh r2, [r5, #6]
	ands r0, r2
	adds r2, r4, #0
	adds r2, #0x30
	cmp r0, #0
	beq _08098BB8
	ldrb r0, [r2]
	cmp r0, #0
	beq _08098BAC
	subs r0, #1
	strb r0, [r2]
	b _08098BB8
	.align 2, 0
_08098BA8: .4byte gpKeySt
_08098BAC:
	adds r0, r6, #0
	ldrh r5, [r5, #8]
	ands r0, r5
	cmp r0, #0
	beq _08098BB8
	strb r3, [r2]
_08098BB8:
	ldr r1, [r1]
	movs r4, #0x80
	adds r0, r4, #0
	ldrh r5, [r1, #6]
	ands r0, r5
	cmp r0, #0
	beq _08098BDE
	ldrb r0, [r2]
	cmp r0, r3
	bge _08098BD0
	adds r0, #1
	b _08098BDC
_08098BD0:
	adds r0, r4, #0
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _08098BDE
	movs r0, #0
_08098BDC:
	strb r0, [r2]
_08098BDE:
	ldrb r2, [r2]
	cmp r7, r2
	beq _08098C04
	ldr r0, _08098BFC @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08098BF6
	ldr r0, _08098C00 @ =0x00000386
	bl m4aSongNumStart
_08098BF6:
	movs r0, #1
	b _08098C06
	.align 2, 0
_08098BFC: .4byte gPlaySt
_08098C00: .4byte 0x00000386
_08098C04:
	movs r0, #0
_08098C06:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	thumb_func_start sub_8098C0C
sub_8098C0C: @ 0x08098C0C
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x2c]
	bl GetUnitItemCount
	adds r1, r0, #0
	cmp r1, #5
	bne _08098C28
	adds r1, r4, #0
	adds r1, #0x30
	movs r0, #4
	strb r0, [r1]
	adds r0, r1, #0
	b _08098C2E
_08098C28:
	adds r0, r4, #0
	adds r0, #0x30
	strb r1, [r0]
_08098C2E:
	ldrb r0, [r0]
	lsls r1, r0, #4
	adds r1, #0x48
	movs r3, #0x80
	lsls r3, r3, #4
	movs r0, #0x10
	movs r2, #0xb
	bl ShowSysHandCursor
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_8098C48
sub_8098C48: @ 0x08098C48
	push {r4, r5, r6, r7, lr}
	adds r6, r0, #0
	adds r7, r6, #0
	adds r7, #0x33
	ldrb r1, [r7]
	lsls r0, r1, #1
	adds r2, r6, #0
	adds r2, #0x38
	adds r2, r2, r0
	ldr r1, [r6, #0x2c]
	adds r0, r6, #0
	adds r0, #0x30
	ldrb r0, [r0]
	lsls r0, r0, #1
	adds r1, #0x1e
	adds r1, r1, r0
	ldrh r5, [r1]
	ldr r0, _08098CE8 @ =0x020117E4
	ldrh r2, [r2]
	lsls r4, r2, #2
	adds r4, r4, r0
	ldrh r0, [r4, #2]
	strh r0, [r1]
	ldr r0, [r6, #0x2c]
	bl UnitRemoveInvalidItems
	strh r5, [r4, #2]
	bl sub_8091B48
	cmp r5, #0
	bne _08098C90
	ldr r0, [r6, #0x2c]
	ldrb r1, [r7]
	movs r2, #3
	bl sub_8091A74
_08098C90:
	adds r0, r6, #0
	bl sub_8098430
	ldr r0, _08098CEC @ =gBg0Tm + 0x244
	ldr r4, _08098CF0 @ =0x02012B78
	ldr r2, [r6, #0x2c]
	adds r1, r4, #0
	movs r3, #0
	bl sub_8094AC0
	adds r4, #0x28
	ldr r1, _08098CF4 @ =gBg2Tm + 0x1e
	ldrb r7, [r7]
	lsls r2, r7, #1
	adds r0, r6, #0
	adds r0, #0x4a
	adds r0, r0, r2
	ldrh r0, [r0]
	lsrs r2, r0, #4
	ldr r3, [r6, #0x2c]
	adds r0, r4, #0
	bl sub_80964A0
	ldr r0, _08098CF8 @ =sub_8097D1C
	movs r1, #1
	adds r2, r6, #0
	bl StartParallelFiniteLoop
	movs r0, #4
	bl EnableBgSync
	ldr r0, _08098CFC @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08098CE0
	ldr r0, _08098D00 @ =0x0000038A
	bl m4aSongNumStart
_08098CE0:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08098CE8: .4byte 0x020117E4
_08098CEC: .4byte gBg0Tm + 0x244
_08098CF0: .4byte 0x02012B78
_08098CF4: .4byte gBg2Tm + 0x1e
_08098CF8: .4byte sub_8097D1C
_08098CFC: .4byte gPlaySt
_08098D00: .4byte 0x0000038A

	thumb_func_start sub_8098D04
sub_8098D04: @ 0x08098D04
	push {r4, r5, lr}
	adds r5, r0, #0
	ldrh r0, [r5, #0x36]
	cmp r0, #1
	bne _08098D2C
	ldr r0, _08098D28 @ =gpKeySt
	ldr r1, [r0]
	movs r0, #0x81
	lsls r0, r0, #1
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _08098DF4
	bl CloseHelpBox
	movs r0, #0
	strh r0, [r5, #0x36]
	b _08098E36
	.align 2, 0
_08098D28: .4byte gpKeySt
_08098D2C:
	ldr r0, _08098D60 @ =gpKeySt
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r1
	cmp r0, #0
	beq _08098D64
	ldr r0, [r5, #0x2c]
	adds r1, r5, #0
	adds r1, #0x30
	ldrb r3, [r1]
	lsls r1, r3, #1
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r2, [r0]
	cmp r2, #0
	beq _08098E36
	lsls r1, r3, #4
	adds r1, #0x48
	movs r0, #0x10
	bl StartItemHelpBox
	movs r0, #1
	strh r0, [r5, #0x36]
	b _08098E36
	.align 2, 0
_08098D60: .4byte gpKeySt
_08098D64:
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _08098DC4
	ldr r0, [r5, #0x2c]
	adds r1, r5, #0
	adds r1, #0x30
	ldrb r1, [r1]
	ldr r4, _08098DA8 @ =0x020117E4
	adds r2, r5, #0
	adds r2, #0x33
	ldrb r2, [r2]
	lsls r3, r2, #1
	adds r2, r5, #0
	adds r2, #0x38
	adds r2, r2, r3
	ldrh r2, [r2]
	lsls r2, r2, #2
	adds r2, r2, r4
	ldrh r2, [r2, #2]
	bl sub_80917D4
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08098DB0
	movs r1, #1
	rsbs r1, r1, #0
	ldr r2, _08098DAC @ =0x000003B3
	adds r0, r1, #0
	adds r3, r5, #0
	bl sub_8091664
	b _08098E36
	.align 2, 0
_08098DA8: .4byte 0x020117E4
_08098DAC: .4byte 0x000003B3
_08098DB0:
	movs r0, #0
	bl sub_80A998C
	adds r0, r5, #0
	bl Proc_Break
	adds r0, r5, #0
	bl sub_8098C48
	b _08098E36
_08098DC4:
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _08098DF4
	movs r0, #0
	bl sub_80A998C
	adds r0, r5, #0
	bl Proc_Break
	ldr r0, _08098DEC @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08098E36
	ldr r0, _08098DF0 @ =0x0000038B
	bl m4aSongNumStart
	b _08098E36
	.align 2, 0
_08098DEC: .4byte gPlaySt
_08098DF0: .4byte 0x0000038B
_08098DF4:
	adds r0, r5, #0
	bl sub_8098B60
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08098E36
	adds r4, r5, #0
	adds r4, #0x30
	ldrb r0, [r4]
	lsls r1, r0, #4
	adds r1, #0x48
	movs r3, #0x80
	lsls r3, r3, #4
	movs r0, #0x10
	movs r2, #0xb
	bl ShowSysHandCursor
	ldrh r0, [r5, #0x36]
	cmp r0, #1
	bne _08098E36
	ldr r0, [r5, #0x2c]
	ldrb r3, [r4]
	lsls r1, r3, #1
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r2, [r0]
	cmp r2, #0
	beq _08098E36
	lsls r1, r3, #4
	adds r1, #0x48
	movs r0, #0x10
	bl StartItemHelpBox
_08098E36:
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start sub_8098E3C
sub_8098E3C: @ 0x08098E3C
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r0, #0x33
	ldrb r0, [r0]
	lsls r1, r0, #1
	adds r0, r5, #0
	adds r0, #0x38
	adds r0, r0, r1
	ldrh r0, [r0]
	lsls r4, r0, #2
	ldr r0, _08098E70 @ =0x020117E4
	adds r4, r4, r0
	ldr r6, [r5, #0x2c]
	ldrb r0, [r4]
	bl GetUnitFromCharId
	adds r1, r0, #0
	ldrb r2, [r4, #1]
	adds r0, r6, #0
	adds r3, r5, #0
	bl sub_80951FC
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08098E70: .4byte 0x020117E4

	thumb_func_start sub_8098E74
sub_8098E74: @ 0x08098E74
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08098E88 @ =gUnk_08D8D318
	bl Proc_StartBlocking
	str r4, [r0, #0x2c]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08098E88: .4byte gUnk_08D8D318

	thumb_func_start sub_8098E8C
sub_8098E8C: @ 0x08098E8C
	push {r4, r5, r6, lr}
	sub sp, #4
	ldr r6, _08098EB8 @ =0x0000DF80
	movs r5, #0x30
	movs r4, #3
_08098E96:
	str r6, [sp]
	movs r0, #4
	adds r1, r5, #0
	movs r2, #0x10
	ldr r3, _08098EBC @ =Sprite_32x16
	bl PutSpriteExt
	adds r6, #4
	adds r5, #0x20
	subs r4, #1
	cmp r4, #0
	bge _08098E96
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08098EB8: .4byte 0x0000DF80
_08098EBC: .4byte Sprite_32x16

	thumb_func_start sub_8098EC0
sub_8098EC0: @ 0x08098EC0
	push {r4, lr}
	sub sp, #4
	adds r4, r0, #0
	ldr r0, _08098EEC @ =sub_8098E8C
	bl StartParallelWorker
	movs r0, #0xe0
	lsls r0, r0, #7
	ldr r1, _08098EF0 @ =gUnk_08D8D410
	lsls r4, r4, #2
	adds r4, r4, r1
	ldr r2, [r4]
	movs r1, #0
	str r1, [sp]
	movs r1, #0xd
	movs r3, #1
	bl NewSysboxText
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08098EEC: .4byte sub_8098E8C
_08098EF0: .4byte gUnk_08D8D410

	thumb_func_start sub_8098EF4
sub_8098EF4: @ 0x08098EF4
	ldr r0, _08098F20 @ =0x04000006
	ldrh r0, [r0]
	adds r0, #1
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	cmp r2, #0xa0
	bls _08098F04
	movs r2, #0
_08098F04:
	cmp r2, #0xc
	bne _08098F0E
	ldr r1, _08098F24 @ =0x04000050
	movs r0, #0xc8
	strh r0, [r1]
_08098F0E:
	cmp r2, #0x34
	beq _08098F16
	cmp r2, #0
	bne _08098F1E
_08098F16:
	ldr r1, _08098F24 @ =0x04000050
	ldr r2, _08098F28 @ =0x00000242
	adds r0, r2, #0
	strh r0, [r1]
_08098F1E:
	bx lr
	.align 2, 0
_08098F20: .4byte 0x04000006
_08098F24: .4byte 0x04000050
_08098F28: .4byte 0x00000242

	thumb_func_start sub_8098F2C
sub_8098F2C: @ 0x08098F2C
	movs r2, #0
	movs r1, #0
	strh r1, [r0, #0x34]
	movs r1, #0xff
	strh r1, [r0, #0x32]
	adds r0, #0x30
	strb r2, [r0]
	bx lr

	thumb_func_start sub_8098F3C
sub_8098F3C: @ 0x08098F3C
	push {r4, r5, lr}
	ldr r5, _08098FBC @ =0x02012B50
	ldr r1, _08098FC0 @ =0x06011000
	adds r0, r5, #0
	movs r2, #0xb
	bl InitSpriteTextFont
	ldr r0, _08098FC4 @ =Pal_Text
	movs r1, #0xd8
	lsls r1, r1, #2
	movs r2, #0x20
	bl ApplyPaletteExt
	adds r4, r5, #0
	adds r4, #0x90
	adds r0, r4, #0
	bl InitSpriteText
	adds r0, r5, #0
	bl SetTextFont
	movs r0, #0
	bl SetTextFontGlyphs
	adds r0, r4, #0
	movs r1, #0
	bl SpriteText_DrawBackgroundExt
	ldr r3, _08098FC8 @ =gUnk_0842D150
	adds r0, r4, #0
	movs r1, #0
	movs r2, #0
	bl Text_InsertDrawString
	ldr r3, _08098FCC @ =gUnk_0842D158
	adds r0, r4, #0
	movs r1, #0x20
	movs r2, #0
	bl Text_InsertDrawString
	ldr r3, _08098FD0 @ =gUnk_0842D160
	adds r0, r4, #0
	movs r1, #0x40
	movs r2, #0
	bl Text_InsertDrawString
	ldr r3, _08098FD4 @ =gUnk_0842D170
	adds r0, r4, #0
	movs r1, #0x80
	movs r2, #3
	bl Text_InsertDrawString
	ldr r3, _08098FD8 @ =gUnk_0842D17C
	adds r0, r4, #0
	movs r1, #0xc0
	movs r2, #3
	bl Text_InsertDrawString
	movs r0, #0
	bl SetTextFont
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08098FBC: .4byte 0x02012B50
_08098FC0: .4byte 0x06011000
_08098FC4: .4byte Pal_Text
_08098FC8: .4byte gUnk_0842D150
_08098FCC: .4byte gUnk_0842D158
_08098FD0: .4byte gUnk_0842D160
_08098FD4: .4byte gUnk_0842D170
_08098FD8: .4byte gUnk_0842D17C

	thumb_func_start sub_8098FDC
sub_8098FDC: @ 0x08098FDC
	push {r4, lr}
	sub sp, #4
	movs r0, #0xaa
	lsls r0, r0, #8
	str r0, [sp]
	movs r0, #0xa0
	movs r1, #0x68
	movs r2, #8
	movs r3, #4
	bl sub_80935C4
	ldr r4, _0809903C @ =Sprite_32x16
	ldr r0, _08099040 @ =0x0000B088
	str r0, [sp]
	movs r0, #4
	movs r1, #0xb0
	movs r2, #0x6c
	adds r3, r4, #0
	bl PutSpriteExt
	ldr r0, _08099044 @ =0x0000B08C
	str r0, [sp]
	movs r0, #4
	movs r1, #0xd0
	movs r2, #0x6c
	adds r3, r4, #0
	bl PutSpriteExt
	ldr r0, _08099048 @ =0x0000B080
	str r0, [sp]
	movs r0, #4
	movs r1, #0xa8
	movs r2, #0x7c
	adds r3, r4, #0
	bl PutSpriteExt
	ldr r0, _0809904C @ =0x0000B084
	str r0, [sp]
	movs r0, #4
	movs r1, #0xc8
	movs r2, #0x7c
	adds r3, r4, #0
	bl PutSpriteExt
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0809903C: .4byte Sprite_32x16
_08099040: .4byte 0x0000B088
_08099044: .4byte 0x0000B08C
_08099048: .4byte 0x0000B080
_0809904C: .4byte 0x0000B084

	thumb_func_start sub_8099050
sub_8099050: @ 0x08099050
	push {r4, lr}
	sub sp, #4
	ldr r4, _08099090 @ =Sprite_32x16
	ldr r0, _08099094 @ =0x0000B090
	str r0, [sp]
	movs r0, #4
	movs r1, #0x8c
	movs r2, #0x58
	adds r3, r4, #0
	bl PutSpriteExt
	ldr r3, _08099098 @ =Sprite_8x16
	ldr r0, _0809909C @ =0x0000B094
	str r0, [sp]
	movs r0, #4
	movs r1, #0xac
	movs r2, #0x58
	bl PutSpriteExt
	ldr r0, _080990A0 @ =0x0000B098
	str r0, [sp]
	movs r0, #4
	movs r1, #0x90
	movs r2, #0x38
	adds r3, r4, #0
	bl PutSpriteExt
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08099090: .4byte Sprite_32x16
_08099094: .4byte 0x0000B090
_08099098: .4byte Sprite_8x16
_0809909C: .4byte 0x0000B094
_080990A0: .4byte 0x0000B098

	thumb_func_start sub_80990A4
sub_80990A4: @ 0x080990A4
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	ldr r6, _080990FC @ =gBg0Tm + 0x2e8
	adds r0, r6, #0
	movs r1, #0xa
	movs r2, #1
	movs r3, #0
	bl TmFillRect_thm
	cmp r4, #0
	beq _08099116
	adds r0, r4, #0
	bl sub_80B2BB4
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	cmp r5, #0
	beq _080990D6
	adds r0, r4, #0
	bl GetItemAttributes
	movs r1, #0x10
	ands r1, r0
	cmp r1, #0
	beq _08099100
_080990D6:
	adds r0, r6, #0
	adds r0, #0xa
	movs r1, #1
	movs r2, #0x14
	bl PutSpecialChar
	adds r0, r6, #0
	adds r0, #0xc
	movs r1, #1
	movs r2, #0x14
	bl PutSpecialChar
	adds r0, r6, #0
	adds r0, #0xe
	movs r1, #1
	movs r2, #0x14
	bl PutSpecialChar
	b _0809910C
	.align 2, 0
_080990FC: .4byte gBg0Tm + 0x2e8
_08099100:
	adds r0, r6, #0
	adds r0, #0xc
	movs r1, #2
	adds r2, r5, #0
	bl PutNumber
_0809910C:
	ldr r0, _08099124 @ =gBg0Tm + 0x2f6
	movs r1, #3
	movs r2, #0x1e
	bl PutSpecialChar
_08099116:
	movs r0, #1
	bl EnableBgSync
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08099124: .4byte gBg0Tm + 0x2f6

	thumb_func_start sub_8099128
sub_8099128: @ 0x08099128
	push {r4, r5, lr}
	ldr r4, _08099164 @ =gBg0Tm + 0x1e8
	adds r0, r4, #0
	movs r1, #0xa
	movs r2, #1
	movs r3, #0
	bl TmFillRect_thm
	adds r5, r4, #0
	adds r5, #0xe
	bl GetGold
	adds r2, r0, #0
	adds r0, r5, #0
	movs r1, #2
	bl PutNumber
	adds r4, #0x10
	adds r0, r4, #0
	movs r1, #3
	movs r2, #0x1e
	bl PutSpecialChar
	movs r0, #1
	bl EnableBgSync
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08099164: .4byte gBg0Tm + 0x1e8

	thumb_func_start sub_8099168
sub_8099168: @ 0x08099168
	push {r4, lr}
	sub sp, #8
	movs r0, #0
	bl SetTextFont
	ldr r4, _080991B8 @ =gBg0Tm + 0x68
	adds r0, r4, #0
	movs r1, #0xc
	movs r2, #1
	movs r3, #0
	bl TmFillRect_thm
	ldr r0, _080991BC @ =0x02012B68
	adds r1, r4, #0
	adds r1, #0xda
	movs r2, #0
	str r2, [sp]
	ldr r2, _080991C0 @ =gUnk_0842D184
	str r2, [sp, #4]
	movs r2, #0
	movs r3, #2
	bl PutDrawText
	subs r4, #0x26
	movs r2, #0x9c
	lsls r2, r2, #2
	movs r0, #1
	str r0, [sp]
	movs r0, #0x4a
	adds r1, r4, #0
	movs r3, #2
	bl PutFaceChibi
	movs r0, #1
	bl EnableBgSync
	add sp, #8
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080991B8: .4byte gBg0Tm + 0x68
_080991BC: .4byte 0x02012B68
_080991C0: .4byte gUnk_0842D184

	thumb_func_start sub_80991C4
sub_80991C4: @ 0x080991C4
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	mov sb, r0
	ldr r7, _08099410 @ =gDispIo
	movs r0, #8
	rsbs r0, r0, #0
	ldrb r1, [r7]
	ands r0, r1
	strb r0, [r7]
	movs r0, #0
	bl InitBgs
	movs r0, #0
	bl GetBgTilemap
	movs r1, #0
	bl TmFill
	movs r0, #1
	bl GetBgTilemap
	movs r1, #0
	bl TmFill
	movs r0, #2
	bl GetBgTilemap
	movs r1, #0
	bl TmFill
	movs r1, #4
	rsbs r1, r1, #0
	adds r0, r1, #0
	ldrb r2, [r7, #0xc]
	ands r0, r2
	strb r0, [r7, #0xc]
	adds r0, r1, #0
	ldrb r3, [r7, #0x10]
	ands r0, r3
	movs r6, #2
	mov r8, r6
	mov r2, r8
	orrs r0, r2
	strb r0, [r7, #0x10]
	ldrb r3, [r7, #0x14]
	ands r1, r3
	strb r1, [r7, #0x14]
	movs r0, #3
	ldrb r6, [r7, #0x18]
	orrs r0, r6
	strb r0, [r7, #0x18]
	bl InitFaces
	bl ResetText
	bl InitIcons
	bl UnpackUiWindowFrameGraphics
	bl ApplySystemObjectsGraphics
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
	ldr r0, _08099414 @ =0x06012800
	movs r1, #1
	rsbs r1, r1, #0
	bl LoadHelpBoxGfx
	movs r0, #4
	bl ApplyIconPalettes
	bl sub_808ED8C
	movs r0, #0xa0
	lsls r0, r0, #7
	movs r1, #5
	bl sub_809228C
	movs r0, #0x80
	lsls r0, r0, #7
	movs r1, #0xa
	bl sub_80922DC
	ldr r0, _08099418 @ =gBg1Tm
	ldr r1, _0809941C @ =gUnk_0842A558
	movs r2, #0xa5
	lsls r2, r2, #7
	bl TmApplyTsa_thm
	movs r0, #7
	bl EnableBgSync
	mov r1, sb
	ldr r0, [r1, #0x2c]
	bl GetUnitPortraitId
	adds r1, r0, #0
	ldr r0, _08099420 @ =0x00000503
	str r0, [sp]
	movs r0, #0
	movs r2, #0x44
	movs r3, #0x4a
	bl StartBmFace
	mov r0, sb
	bl sub_80A98C8
	mov r0, sb
	bl ResetSysHandCursor
	movs r0, #0xc0
	lsls r0, r0, #3
	movs r1, #1
	bl DisplaySysHandCursorTextShadow
	movs r5, #0x20
	ldrb r0, [r7, #1]
	orrs r0, r5
	movs r1, #0x41
	rsbs r1, r1, #0
	ands r0, r1
	movs r1, #0x7f
	ands r0, r1
	strb r0, [r7, #1]
	adds r1, r7, #0
	adds r1, #0x2d
	movs r0, #0x80
	strb r0, [r1]
	adds r1, #4
	movs r0, #0x28
	strb r0, [r1]
	subs r1, #5
	movs r0, #0xe0
	strb r0, [r1]
	adds r1, #4
	movs r0, #0x98
	strb r0, [r1]
	movs r2, #0x34
	adds r2, r2, r7
	mov sl, r2
	movs r0, #1
	ldrb r1, [r2]
	orrs r1, r0
	mov r3, r8
	orrs r1, r3
	movs r2, #4
	orrs r1, r2
	movs r4, #8
	orrs r1, r4
	movs r3, #0x10
	orrs r1, r3
	movs r6, #0x36
	adds r6, r6, r7
	mov ip, r6
	ldrb r2, [r6]
	orrs r0, r2
	mov r6, r8
	orrs r0, r6
	movs r2, #5
	rsbs r2, r2, #0
	ands r0, r2
	orrs r0, r4
	orrs r0, r3
	orrs r1, r5
	mov r2, sl
	strb r1, [r2]
	orrs r0, r5
	mov r3, ip
	strb r0, [r3]
	adds r1, r7, #0
	adds r1, #0x3c
	movs r0, #0x3f
	ldrb r6, [r1]
	ands r0, r6
	strb r0, [r1]
	adds r0, r7, #0
	adds r0, #0x44
	movs r1, #8
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	mov r0, sb
	bl StartGreenText
	movs r0, #0xc8
	movs r1, #0x90
	mov r2, sb
	bl StartHelpPromptSprite
	ldr r4, _08099424 @ =0x02012B68
	adds r0, r4, #0
	movs r1, #4
	bl InitText
	adds r0, r4, #0
	adds r0, #8
	movs r1, #2
	bl InitText
	bl sub_8098F3C
	adds r4, #0x10
	movs r5, #4
_08099380:
	adds r0, r4, #0
	movs r1, #7
	bl InitText
	adds r4, #8
	subs r5, #1
	cmp r5, #0
	bge _08099380
	movs r0, #0
	bl SetOnHBlankA
	ldr r0, _08099428 @ =sub_8098EF4
	bl SetOnHBlankA
	movs r0, #4
	bl EnableBgSync
	ldr r0, _0809942C @ =gBg0Tm + 0x244
	ldr r1, _08099430 @ =0x02012B78
	mov r3, sb
	ldr r2, [r3, #0x2c]
	movs r3, #0
	bl sub_8094AC0
	bl sub_8099168
	ldr r0, _08099434 @ =sub_8099050
	mov r1, sb
	bl StartParallelWorker
	mov r6, sb
	ldr r0, [r6, #0x2c]
	mov r1, sb
	adds r1, #0x30
	ldrb r1, [r1]
	lsls r1, r1, #1
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r0, [r0]
	bl sub_80990A4
	bl sub_8099128
	movs r1, #0xe0
	lsls r1, r1, #4
	movs r3, #0xc0
	lsls r3, r3, #4
	movs r0, #0
	str r0, [sp]
	str r6, [sp, #4]
	movs r0, #0xd
	movs r2, #0xf
	bl StartSysBrownBox
	movs r0, #0
	movs r1, #1
	bl SetSysBrownBoxWidth
	movs r0, #0
	movs r1, #0x88
	movs r2, #0x36
	movs r3, #2
	bl EnableSysBrownBox
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08099410: .4byte gDispIo
_08099414: .4byte 0x06012800
_08099418: .4byte gBg1Tm
_0809941C: .4byte gUnk_0842A558
_08099420: .4byte 0x00000503
_08099424: .4byte 0x02012B68
_08099428: .4byte sub_8098EF4
_0809942C: .4byte gBg0Tm + 0x244
_08099430: .4byte 0x02012B78
_08099434: .4byte sub_8099050

	thumb_func_start sub_8099438
sub_8099438: @ 0x08099438
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	ldr r6, _08099468 @ =gpKeySt
	ldr r0, [r6]
	ldrh r1, [r0, #6]
	movs r7, #0x40
	adds r0, r7, #0
	ands r0, r1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	cmp r5, #0
	beq _0809947E
	ldr r0, [r4, #0x2c]
	bl GetUnitItemCount
	adds r3, r0, #0
	adds r2, r4, #0
	adds r2, #0x30
	ldrb r0, [r2]
	cmp r0, #0
	beq _0809946C
	subs r0, #1
	strb r0, [r2]
	b _080994AE
	.align 2, 0
_08099468: .4byte gpKeySt
_0809946C:
	ldr r1, [r6]
	adds r0, r7, #0
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _080994CC
	subs r0, r3, #1
	strb r0, [r2]
	b _080994AE
_0809947E:
	movs r7, #0x80
	adds r0, r7, #0
	ands r0, r1
	cmp r0, #0
	beq _080994CC
	ldr r0, [r4, #0x2c]
	bl GetUnitItemCount
	adds r2, r4, #0
	adds r2, #0x30
	ldrb r1, [r2]
	subs r0, #1
	cmp r1, r0
	bge _080994A0
	adds r0, r1, #1
	strb r0, [r2]
	b _080994AE
_080994A0:
	ldr r1, [r6]
	adds r0, r7, #0
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _080994CC
	strb r5, [r2]
_080994AE:
	ldr r0, _080994C4 @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080994C0
	ldr r0, _080994C8 @ =0x00000386
	bl m4aSongNumStart
_080994C0:
	movs r0, #1
	b _080994CE
	.align 2, 0
_080994C4: .4byte gPlaySt
_080994C8: .4byte 0x00000386
_080994CC:
	movs r0, #0
_080994CE:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	thumb_func_start sub_80994D4
sub_80994D4: @ 0x080994D4
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r0, _08099528 @ =gBg0Tm + 0x244
	ldr r1, _0809952C @ =0x02012B78
	ldr r2, [r4, #0x2c]
	movs r3, #0
	bl sub_8094AC0
	ldr r0, [r4, #0x2c]
	adds r5, r4, #0
	adds r5, #0x30
	ldrb r2, [r5]
	lsls r1, r2, #1
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r0, [r0]
	bl sub_80990A4
	movs r0, #0
	bl sub_80A998C
	ldr r0, _08099530 @ =sub_8098FDC
	bl GetParallelWorker
	bl Proc_End
	ldrb r5, [r5]
	lsls r1, r5, #4
	adds r1, #0x48
	movs r3, #0x80
	lsls r3, r3, #3
	movs r0, #0x10
	movs r2, #0xb
	bl ShowSysHandCursor
	movs r0, #0
	adds r1, r4, #0
	bl sub_8098EC0
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08099528: .4byte gBg0Tm + 0x244
_0809952C: .4byte 0x02012B78
_08099530: .4byte sub_8098FDC

	thumb_func_start sub_8099534
sub_8099534: @ 0x08099534
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x34]
	cmp r0, #1
	bne _0809955C
	ldr r0, _08099558 @ =gpKeySt
	ldr r1, [r0]
	movs r0, #0x81
	lsls r0, r0, #1
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _08099630
	bl CloseHelpBox
	movs r0, #0
	strh r0, [r4, #0x34]
	b _08099682
	.align 2, 0
_08099558: .4byte gpKeySt
_0809955C:
	ldr r0, _08099594 @ =gpKeySt
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r1
	cmp r0, #0
	beq _08099598
	ldr r0, [r4, #0x2c]
	adds r1, r4, #0
	adds r1, #0x30
	ldrb r3, [r1]
	lsls r1, r3, #1
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r2, [r0]
	cmp r2, #0
	bne _08099582
	b _08099682
_08099582:
	lsls r1, r3, #4
	adds r1, #0x48
	movs r0, #0x10
	bl StartItemHelpBox
	movs r0, #1
	strh r0, [r4, #0x34]
	b _08099682
	.align 2, 0
_08099594: .4byte gpKeySt
_08099598:
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _08099604
	ldr r0, [r4, #0x2c]
	adds r6, r4, #0
	adds r6, #0x30
	ldrb r2, [r6]
	lsls r1, r2, #1
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r5, [r0]
	adds r0, r5, #0
	bl sub_80B2BB4
	lsls r0, r0, #0x10
	cmp r0, #0
	beq _080995CA
	adds r0, r5, #0
	bl GetItemAttributes
	movs r1, #0x10
	ands r1, r0
	cmp r1, #0
	beq _080995E0
_080995CA:
	ldrb r6, [r6]
	lsls r1, r6, #4
	adds r1, #0x48
	ldr r2, _080995DC @ =0x00000704
	movs r0, #0x10
	adds r3, r4, #0
	bl sub_8091664
	b _08099682
	.align 2, 0
_080995DC: .4byte 0x00000704
_080995E0:
	adds r0, r4, #0
	movs r1, #2
	bl Proc_Goto
	ldr r0, _080995FC @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08099682
	ldr r0, _08099600 @ =0x0000038A
	bl m4aSongNumStart
	b _08099682
	.align 2, 0
_080995FC: .4byte gPlaySt
_08099600: .4byte 0x0000038A
_08099604:
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _08099630
	adds r0, r4, #0
	movs r1, #3
	bl Proc_Goto
	ldr r0, _08099628 @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08099682
	ldr r0, _0809962C @ =0x0000038B
	bl m4aSongNumStart
	b _08099682
	.align 2, 0
_08099628: .4byte gPlaySt
_0809962C: .4byte 0x0000038B
_08099630:
	adds r0, r4, #0
	bl sub_8099438
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08099682
	adds r5, r4, #0
	adds r5, #0x30
	ldrb r0, [r5]
	lsls r1, r0, #4
	adds r1, #0x48
	movs r3, #0x80
	lsls r3, r3, #3
	movs r0, #0x10
	movs r2, #0xb
	bl ShowSysHandCursor
	ldr r0, [r4, #0x2c]
	ldrb r2, [r5]
	lsls r1, r2, #1
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r0, [r0]
	bl sub_80990A4
	ldrh r0, [r4, #0x34]
	cmp r0, #1
	bne _08099682
	ldr r0, [r4, #0x2c]
	ldrb r3, [r5]
	lsls r1, r3, #1
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r2, [r0]
	cmp r2, #0
	beq _08099682
	lsls r1, r3, #4
	adds r1, #0x48
	movs r0, #0x10
	bl StartItemHelpBox
_08099682:
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	thumb_func_start sub_8099688
sub_8099688: @ 0x08099688
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r4, #0
	adds r5, #0x31
	movs r0, #1
	strb r0, [r5]
	ldr r0, _080996D0 @ =sub_8098FDC
	adds r1, r4, #0
	bl StartParallelWorker
	adds r0, r4, #0
	adds r0, #0x30
	ldrb r0, [r0]
	lsls r2, r0, #4
	adds r2, #0x48
	movs r0, #0
	movs r1, #0x10
	movs r3, #2
	bl sub_80A98DC
	ldrb r5, [r5]
	lsls r0, r5, #5
	adds r0, #0xa4
	movs r3, #0x80
	lsls r3, r3, #3
	movs r1, #0x7c
	movs r2, #0
	bl ShowSysHandCursor
	movs r0, #1
	adds r1, r4, #0
	bl sub_8098EC0
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080996D0: .4byte sub_8098FDC

	thumb_func_start sub_80996D4
sub_80996D4: @ 0x080996D4
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x2c]
	adds r5, r4, #0
	adds r5, #0x30
	ldrb r2, [r5]
	lsls r1, r2, #1
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r0, [r0]
	bl sub_80B2BB4
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl AddGold
	ldr r0, [r4, #0x2c]
	ldrb r2, [r5]
	lsls r1, r2, #1
	adds r0, #0x1e
	adds r0, r0, r1
	movs r1, #0
	strh r1, [r0]
	ldr r0, [r4, #0x2c]
	bl UnitRemoveInvalidItems
	ldr r0, _08099740 @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0809971A
	movs r0, #0xb9
	bl m4aSongNumStart
_0809971A:
	bl sub_8099128
	ldr r0, [r4, #0x2c]
	bl GetUnitItemCount
	cmp r0, #0
	bne _0809974C
	ldr r0, _08099744 @ =gBg0Tm + 0x244
	ldr r1, _08099748 @ =0x02012B78
	ldr r2, [r4, #0x2c]
	movs r3, #0
	bl sub_8094AC0
	adds r0, r4, #0
	movs r1, #3
	bl Proc_Goto
	b _0809975E
	.align 2, 0
_08099740: .4byte gPlaySt
_08099744: .4byte gBg0Tm + 0x244
_08099748: .4byte 0x02012B78
_0809974C:
	ldrb r1, [r5]
	cmp r0, r1
	bne _08099756
	subs r0, #1
	strb r0, [r5]
_08099756:
	adds r0, r4, #0
	movs r1, #1
	bl Proc_Goto
_0809975E:
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start sub_8099764
sub_8099764: @ 0x08099764
	push {r4, r5, r6, lr}
	adds r2, r0, #0
	adds r4, r2, #0
	adds r4, #0x31
	ldrb r5, [r4]
	ldr r6, _08099788 @ =gpKeySt
	ldr r1, [r6]
	ldrh r3, [r1, #8]
	movs r0, #1
	ands r0, r3
	cmp r0, #0
	beq _0809978C
	cmp r5, #0
	bne _08099798
	adds r0, r2, #0
	bl sub_80996D4
	b _08099802
	.align 2, 0
_08099788: .4byte gpKeySt
_0809978C:
	movs r0, #2
	ands r0, r3
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	cmp r3, #0
	beq _080997BC
_08099798:
	adds r0, r2, #0
	movs r1, #1
	bl Proc_Goto
	ldr r0, _080997B4 @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08099802
	ldr r0, _080997B8 @ =0x0000038B
	bl m4aSongNumStart
	b _08099802
	.align 2, 0
_080997B4: .4byte gPlaySt
_080997B8: .4byte 0x0000038B
_080997BC:
	movs r0, #0x20
	ldrh r1, [r1, #6]
	ands r0, r1
	cmp r0, #0
	beq _080997C8
	strb r3, [r4]
_080997C8:
	ldr r1, [r6]
	movs r0, #0x10
	ldrh r1, [r1, #6]
	ands r0, r1
	cmp r0, #0
	beq _080997D8
	movs r0, #1
	strb r0, [r4]
_080997D8:
	ldrb r0, [r4]
	cmp r5, r0
	beq _08099802
	ldr r0, _08099808 @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080997F0
	ldr r0, _0809980C @ =0x00000387
	bl m4aSongNumStart
_080997F0:
	ldrb r4, [r4]
	lsls r0, r4, #5
	adds r0, #0xa4
	movs r3, #0x80
	lsls r3, r3, #3
	movs r1, #0x7c
	movs r2, #0
	bl ShowSysHandCursor
_08099802:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08099808: .4byte gPlaySt
_0809980C: .4byte 0x00000387

	thumb_func_start sub_8099810
sub_8099810: @ 0x08099810
	push {lr}
	bl EndMuralBackground_
	movs r0, #0
	bl EndFaceById
	movs r0, #0
	bl SetOnHBlankA
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_8099828
sub_8099828: @ 0x08099828
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0809983C @ =gUnk_08D8D418
	bl Proc_StartBlocking
	str r4, [r0, #0x2c]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0809983C: .4byte gUnk_08D8D418

	thumb_func_start sub_8099840
sub_8099840: @ 0x08099840
	push {lr}
	sub sp, #0x10
	ldr r0, [r0, #0x2c]
	str r0, [sp]
	ldr r0, _08099870 @ =0x06011000
	str r0, [sp, #4]
	movs r0, #1
	rsbs r0, r0, #0
	str r0, [sp, #8]
	movs r0, #0
	str r0, [sp, #0xc]
	movs r0, #0xa
	movs r1, #7
	movs r2, #0x11
	movs r3, #4
	bl sub_8088584
	movs r0, #0x7c
	bl sub_8087E2C
	add sp, #0x10
	pop {r0}
	bx r0
	.align 2, 0
_08099870: .4byte 0x06011000

	thumb_func_start nullsub_78
nullsub_78: @ 0x08099874
	bx lr
	.align 2, 0

	thumb_func_start nullsub_79
nullsub_79: @ 0x08099878
	bx lr
	.align 2, 0

	thumb_func_start sub_809987C
sub_809987C: @ 0x0809987C
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r0, #0x30
	movs r4, #1
	strb r4, [r0]
	bl sub_8099CB4
	adds r1, r5, #0
	adds r1, #0x31
	strb r0, [r1]
	bl sub_8099CF0
	adds r1, r5, #0
	adds r1, #0x32
	strb r0, [r1]
	adds r0, r5, #0
	adds r0, #0x33
	strb r4, [r0]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_80998A8
sub_80998A8: @ 0x080998A8
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #8
	mov sb, r0
	ldr r6, _08099968 @ =0x020129A8
	movs r0, #0
	bl SetTextFontGlyphs
	movs r0, #0
	bl SetTextFont
	ldr r0, _0809996C @ =gBg0Tm + 0x280
	movs r1, #0x1f
	movs r2, #0xa
	movs r3, #0
	bl TmFillRect_thm
	movs r4, #0
_080998D0:
	adds r0, r6, #0
	bl ClearText
	ldr r1, _08099970 @ =gUnk_08D8D60C
	lsls r0, r4, #2
	adds r0, r0, r1
	ldr r0, [r0]
	bl DecodeMsg
	adds r3, r0, #0
	adds r5, r6, #0
	adds r6, #8
	asrs r2, r4, #1
	lsls r2, r2, #6
	movs r0, #0xa2
	lsls r0, r0, #1
	adds r2, r2, r0
	movs r1, #1
	ands r1, r4
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #1
	adds r2, r2, r0
	lsls r2, r2, #1
	ldr r0, _08099974 @ =gBg0Tm
	mov r8, r0
	adds r1, r2, r0
	movs r2, #0
	mov r0, sb
	adds r0, #0x30
	adds r0, r0, r4
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne _0809991A
	movs r2, #1
_0809991A:
	movs r7, #0
	str r7, [sp]
	str r3, [sp, #4]
	adds r0, r5, #0
	movs r3, #0
	bl PutDrawText
	adds r4, #1
	cmp r4, #3
	ble _080998D0
	ldr r0, _08099968 @ =0x020129A8
	adds r6, r0, #0
	adds r6, #0xe8
	adds r0, r6, #0
	bl ClearText
	ldr r0, _08099978 @ =gUnk_08D8D5F8
	ldr r0, [r0, #0x10]
	bl DecodeMsg
	mov r1, r8
	adds r1, #0x2c
	str r7, [sp]
	str r0, [sp, #4]
	adds r0, r6, #0
	movs r2, #0
	movs r3, #0
	bl PutDrawText
	movs r0, #1
	bl EnableBgSync
	add sp, #8
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08099968: .4byte 0x020129A8
_0809996C: .4byte gBg0Tm + 0x280
_08099970: .4byte gUnk_08D8D60C
_08099974: .4byte gBg0Tm
_08099978: .4byte gUnk_08D8D5F8

	thumb_func_start sub_809997C
sub_809997C: @ 0x0809997C
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r3, r5, #0
	adds r3, #0x29
	ldrb r4, [r3]
	ldr r2, _08099A0C @ =gpKeySt
	ldr r1, [r2]
	movs r0, #0x20
	ldrh r1, [r1, #6]
	ands r0, r1
	cmp r0, #0
	beq _080999A0
	movs r0, #1
	ands r0, r4
	cmp r0, #0
	beq _080999A0
	subs r0, r4, #1
	strb r0, [r3]
_080999A0:
	ldr r1, [r2]
	movs r0, #0x10
	ldrh r1, [r1, #6]
	ands r0, r1
	adds r3, r5, #0
	adds r3, #0x29
	cmp r0, #0
	beq _080999BE
	ldrb r1, [r3]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	bne _080999BE
	adds r0, r1, #1
	strb r0, [r3]
_080999BE:
	ldr r1, [r2]
	movs r0, #0x80
	ldrh r1, [r1, #6]
	ands r0, r1
	cmp r0, #0
	beq _080999D6
	ldrb r1, [r3]
	lsrs r0, r1, #1
	cmp r0, #0
	bne _080999D6
	adds r0, r1, #2
	strb r0, [r3]
_080999D6:
	ldr r1, [r2]
	movs r0, #0x40
	ldrh r1, [r1, #6]
	ands r0, r1
	cmp r0, #0
	beq _080999EE
	ldrb r1, [r3]
	lsrs r0, r1, #1
	cmp r0, #0
	beq _080999EE
	subs r0, r1, #2
	strb r0, [r3]
_080999EE:
	ldrb r3, [r3]
	cmp r4, r3
	beq _08099A18
	ldr r0, _08099A10 @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08099A06
	ldr r0, _08099A14 @ =0x00000385
	bl m4aSongNumStart
_08099A06:
	movs r0, #1
	b _08099A1A
	.align 2, 0
_08099A0C: .4byte gpKeySt
_08099A10: .4byte gPlaySt
_08099A14: .4byte 0x00000385
_08099A18:
	movs r0, #0
_08099A1A:
	pop {r4, r5}
	pop {r1}
	bx r1

	thumb_func_start sub_8099A20
sub_8099A20: @ 0x08099A20
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	ldr r0, _08099A54 @ =gpKeySt
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r6, #1
	adds r0, r6, #0
	ands r0, r1
	cmp r0, #0
	beq _08099AB4
	adds r0, r4, #0
	adds r0, #0x29
	ldrb r1, [r0]
	adds r0, #7
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #1
	bne _08099A98
	cmp r1, #1
	beq _08099A74
	cmp r1, #1
	bgt _08099A58
	cmp r1, #0
	beq _08099A62
	b _08099A98
	.align 2, 0
_08099A54: .4byte gpKeySt
_08099A58:
	cmp r1, #2
	beq _08099A68
	cmp r1, #3
	beq _08099A6E
	b _08099A98
_08099A62:
	adds r0, r4, #0
	movs r1, #2
	b _08099A78
_08099A68:
	adds r0, r4, #0
	movs r1, #3
	b _08099A78
_08099A6E:
	adds r0, r4, #0
	movs r1, #4
	b _08099A78
_08099A74:
	adds r0, r4, #0
	movs r1, #5
_08099A78:
	bl Proc_Goto
	ldr r0, _08099A90 @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08099B20
	ldr r0, _08099A94 @ =0x0000038A
	bl m4aSongNumStart
	b _08099B20
	.align 2, 0
_08099A90: .4byte gPlaySt
_08099A94: .4byte 0x0000038A
_08099A98:
	ldr r0, _08099AB0 @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08099B20
	movs r0, #0xe3
	lsls r0, r0, #2
	bl m4aSongNumStart
	b _08099B20
	.align 2, 0
_08099AB0: .4byte gPlaySt
_08099AB4:
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _08099AE0
	adds r0, r4, #0
	movs r1, #6
	bl Proc_Goto
	ldr r0, _08099AD8 @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08099B20
	ldr r0, _08099ADC @ =0x0000038B
	bl m4aSongNumStart
	b _08099B20
	.align 2, 0
_08099AD8: .4byte gPlaySt
_08099ADC: .4byte 0x0000038B
_08099AE0:
	adds r0, r4, #0
	bl sub_809997C
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08099B20
	adds r5, r4, #0
	adds r5, #0x29
	ldrb r1, [r5]
	adds r2, r6, #0
	ands r2, r1
	lsls r0, r2, #3
	subs r0, r0, r2
	lsls r0, r0, #4
	adds r0, #0x1c
	lsrs r1, r1, #1
	lsls r1, r1, #4
	adds r1, #0x50
	movs r3, #0x80
	lsls r3, r3, #4
	movs r2, #8
	bl ShowSysHandCursor
	ldr r1, _08099B28 @ =gUnk_08D8D620
	ldrb r5, [r5]
	lsls r0, r5, #2
	adds r0, r0, r1
	ldr r0, [r0]
	str r0, [r4, #0x2c]
	adds r0, r4, #0
	bl sub_8099840
_08099B20:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08099B28: .4byte gUnk_08D8D620

	thumb_func_start sub_8099B2C
sub_8099B2C: @ 0x08099B2C
	push {r4, lr}
	adds r4, r0, #0
	bl EndCgText
	adds r0, r4, #0
	bl EndAllProcChildren
	bl EndMuralBackground_
	movs r0, #0
	bl EndFaceById
	movs r0, #0
	bl SetOnHBlankA
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_8099B50
sub_8099B50: @ 0x08099B50
	push {lr}
	adds r1, r0, #0
	adds r1, #0x29
	ldrb r1, [r1]
	cmp r1, #1
	beq _08099B88
	cmp r1, #1
	bgt _08099B66
	cmp r1, #0
	beq _08099B70
	b _08099B8E
_08099B66:
	cmp r1, #2
	beq _08099B78
	cmp r1, #3
	beq _08099B80
	b _08099B8E
_08099B70:
	movs r1, #2
	bl Proc_Goto
	b _08099B8E
_08099B78:
	movs r1, #3
	bl Proc_Goto
	b _08099B8E
_08099B80:
	movs r1, #4
	bl Proc_Goto
	b _08099B8E
_08099B88:
	movs r1, #5
	bl Proc_Goto
_08099B8E:
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_8099B94
sub_8099B94: @ 0x08099B94
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08099BAC @ =gUnk_08D8D538
	bl Proc_StartBlocking
	adds r1, r0, #0
	adds r0, #0x29
	strb r4, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08099BAC: .4byte gUnk_08D8D538

	thumb_func_start sub_8099BB0
sub_8099BB0: @ 0x08099BB0
	push {lr}
	adds r1, r0, #0
	cmp r1, #1
	beq _08099BDC
	cmp r1, #1
	bgt _08099BC2
	cmp r1, #0
	beq _08099BE8
	b _08099BF0
_08099BC2:
	cmp r1, #2
	beq _08099BCC
	cmp r1, #3
	beq _08099BD2
	b _08099BF0
_08099BCC:
	bl sub_8099CB4
	b _08099BD6
_08099BD2:
	bl sub_8099CF0
_08099BD6:
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	b _08099BF2
_08099BDC:
	ldr r0, _08099BEC @ =gPlaySt
	adds r0, #0x2b
	ldrb r0, [r0]
	ands r1, r0
	cmp r1, #0
	beq _08099BF0
_08099BE8:
	movs r0, #1
	b _08099BF2
	.align 2, 0
_08099BEC: .4byte gPlaySt
_08099BF0:
	movs r0, #0
_08099BF2:
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_8099BF8
sub_8099BF8: @ 0x08099BF8
	push {lr}
	ldr r0, _08099C10 @ =gPlaySt
	ldrb r1, [r0, #0x1b]
	cmp r1, #3
	bne _08099C14
	ldrb r0, [r0, #0xe]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl GetChapterInfo
	adds r0, #0x78
	b _08099C20
	.align 2, 0
_08099C10: .4byte gPlaySt
_08099C14:
	ldrb r0, [r0, #0xe]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl GetChapterInfo
	adds r0, #0x7a
_08099C20:
	ldrh r0, [r0]
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_8099C28
sub_8099C28: @ 0x08099C28
	push {lr}
	ldr r0, _08099C40 @ =gPlaySt
	ldrb r0, [r0, #0xe]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl GetChapterInfo
	adds r0, #0x76
	ldrh r0, [r0]
	pop {r1}
	bx r1
	.align 2, 0
_08099C40: .4byte gPlaySt

	thumb_func_start sub_8099C44
sub_8099C44: @ 0x08099C44
	push {lr}
	ldr r0, _08099C5C @ =gPlaySt
	ldrb r0, [r0, #0xe]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl GetChapterInfo
	adds r0, #0x7c
	ldrh r0, [r0]
	pop {r1}
	bx r1
	.align 2, 0
_08099C5C: .4byte gPlaySt

	thumb_func_start sub_8099C60
sub_8099C60: @ 0x08099C60
	push {lr}
	ldr r0, _08099C78 @ =gPlaySt
	ldrb r0, [r0, #0xe]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl GetChapterInfo
	adds r0, #0x7f
	ldrb r0, [r0]
	pop {r1}
	bx r1
	.align 2, 0
_08099C78: .4byte gPlaySt

	thumb_func_start sub_8099C7C
sub_8099C7C: @ 0x08099C7C
	push {lr}
	ldr r0, _08099C94 @ =gPlaySt
	ldrb r0, [r0, #0xe]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl GetChapterInfo
	adds r0, #0x7e
	ldrb r0, [r0]
	pop {r1}
	bx r1
	.align 2, 0
_08099C94: .4byte gPlaySt

	thumb_func_start sub_8099C98
sub_8099C98: @ 0x08099C98
	push {lr}
	bl sub_8099BF8
	cmp r0, #0
	beq _08099CAE
	bl sub_8099C28
	cmp r0, #0
	bne _08099CAE
	movs r0, #1
	b _08099CB0
_08099CAE:
	movs r0, #0
_08099CB0:
	pop {r1}
	bx r1

	thumb_func_start sub_8099CB4
sub_8099CB4: @ 0x08099CB4
	push {lr}
	ldr r1, _08099CD0 @ =gPlaySt
	movs r0, #0x40
	ldrb r1, [r1, #0x14]
	ands r0, r1
	cmp r0, #0
	bne _08099CCA
	bl sub_8099BF8
	cmp r0, #0
	bne _08099CD4
_08099CCA:
	movs r0, #0
	b _08099CD6
	.align 2, 0
_08099CD0: .4byte gPlaySt
_08099CD4:
	movs r0, #1
_08099CD6:
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_8099CDC
sub_8099CDC: @ 0x08099CDC
	push {lr}
	bl sub_8099C7C
	cmp r0, #0x41
	beq _08099CEA
	movs r0, #0
	b _08099CEC
_08099CEA:
	movs r0, #1
_08099CEC:
	pop {r1}
	bx r1

	thumb_func_start sub_8099CF0
sub_8099CF0: @ 0x08099CF0
	push {lr}
	bl sub_8099CDC
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_8099D00
sub_8099D00: @ 0x08099D00
	ldr r0, _08099D10 @ =gPlaySt
	ldrb r0, [r0, #0xe]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0x12
	bgt _08099D14
	movs r0, #0
	b _08099D16
	.align 2, 0
_08099D10: .4byte gPlaySt
_08099D14:
	movs r0, #1
_08099D16:
	bx lr

	thumb_func_start sub_8099D18
sub_8099D18: @ 0x08099D18
	push {r4, lr}
	ldr r4, _08099DBC @ =gDispIo
	movs r0, #8
	rsbs r0, r0, #0
	ldrb r1, [r4]
	ands r0, r1
	strb r0, [r4]
	movs r0, #0
	bl InitBgs
	movs r0, #0
	bl GetBgTilemap
	movs r1, #0
	bl TmFill
	movs r0, #1
	bl GetBgTilemap
	movs r1, #0
	bl TmFill
	movs r0, #2
	bl GetBgTilemap
	movs r1, #0
	bl TmFill
	movs r1, #4
	rsbs r1, r1, #0
	adds r0, r1, #0
	ldrb r2, [r4, #0xc]
	ands r0, r2
	movs r2, #1
	orrs r0, r2
	strb r0, [r4, #0xc]
	movs r2, #3
	ldrb r0, [r4, #0x10]
	orrs r0, r2
	strb r0, [r4, #0x10]
	ldrb r0, [r4, #0x14]
	ands r1, r0
	movs r0, #2
	orrs r1, r0
	strb r1, [r4, #0x14]
	ldrb r1, [r4, #0x18]
	orrs r2, r1
	strb r2, [r4, #0x18]
	bl InitFaces
	bl ResetText
	bl InitIcons
	bl UnpackUiWindowFrameGraphics
	bl ApplySystemObjectsGraphics
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
	movs r2, #4
	bl SetBgOffset
	movs r0, #4
	bl ApplyIconPalettes
	bl sub_808ED8C
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08099DBC: .4byte gDispIo

	thumb_func_start sub_8099DC0
sub_8099DC0: @ 0x08099DC0
	adds r0, #0x4c
	movs r1, #0
	strh r1, [r0]
	bx lr

	thumb_func_start sub_8099DC8
sub_8099DC8: @ 0x08099DC8
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r4, r5, #0
	adds r4, #0x4c
	ldrh r0, [r4]
	adds r0, #1
	strh r0, [r4]
	movs r0, #3
	ldrh r1, [r4]
	ands r0, r1
	cmp r0, #0
	bne _08099E0E
	movs r0, #0
	ldrsh r4, [r4, r0]
	cmp r4, #0
	bge _08099DEA
	adds r4, #3
_08099DEA:
	asrs r4, r4, #2
	lsls r0, r4, #5
	ldr r1, _08099E14 @ =gUnk_0842B4BC
	adds r0, r0, r1
	ldr r1, [r5, #0x58]
	lsls r1, r1, #5
	ldr r2, _08099E18 @ =gPal + 0x200
	adds r1, r1, r2
	movs r2, #8
	bl CpuFastSet
	bl EnablePalSync
	cmp r4, #5
	bne _08099E0E
	adds r0, r5, #0
	bl Proc_Break
_08099E0E:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08099E14: .4byte gUnk_0842B4BC
_08099E18: .4byte gPal + 0x200

	thumb_func_start sub_8099E1C
sub_8099E1C: @ 0x08099E1C
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08099E30 @ =gUnk_08D8D688
	bl Proc_Start
	str r4, [r0, #0x58]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08099E30: .4byte gUnk_08D8D688

	thumb_func_start sub_8099E34
sub_8099E34: @ 0x08099E34
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	mov sb, r0
	ldr r1, [r0, #0x2c]
	asrs r0, r1, #3
	cmp r0, #5
	bgt _08099E5C
	adds r0, r1, #2
	mov r1, sb
	str r0, [r1, #0x2c]
	asrs r0, r0, #3
	cmp r0, #6
	bne _08099E5C
	movs r0, #0xf
	bl sub_8099E1C
_08099E5C:
	mov r6, sb
	adds r6, #0x34
	movs r2, #9
	str r2, [sp, #8]
	movs r3, #4
	mov r8, r3
_08099E68:
	ldrb r0, [r6]
	cmp r0, #0xff
	beq _08099EBE
	movs r5, #0
	ldrb r7, [r6]
	cmp r5, r7
	bgt _08099EBE
	mov r1, sb
	ldr r0, [r1, #0x2c]
	asrs r0, r0, #3
	cmp r5, r0
	bge _08099EBE
	movs r4, #0x50
	ldr r2, _08099F5C @ =gUnk_08D8D674
	mov sl, r2
_08099E86:
	lsls r1, r5, #9
	adds r1, r4, r1
	mov r3, sl
	adds r3, #4
	mov sl, r3
	subs r3, #4
	ldr r3, [r3]
	mov ip, r3
	ldr r0, _08099F60 @ =0x0000F380
	str r0, [sp]
	movs r0, #4
	ldr r7, [sp, #8]
	movs r3, #0x80
	lsls r3, r3, #1
	adds r2, r7, r3
	mov r3, ip
	bl PutSpriteExt
	adds r4, #0xf
	adds r5, #1
	ldrb r7, [r6]
	cmp r5, r7
	bgt _08099EBE
	mov r1, sb
	ldr r0, [r1, #0x2c]
	asrs r0, r0, #3
	cmp r5, r0
	blt _08099E86
_08099EBE:
	adds r6, #1
	ldr r2, [sp, #8]
	adds r2, #0x10
	str r2, [sp, #8]
	movs r3, #1
	rsbs r3, r3, #0
	add r8, r3
	mov r7, r8
	cmp r7, #0
	bge _08099E68
	movs r0, #0
	mov r8, r0
	movs r7, #0x80
	lsls r7, r7, #1
	ldr r1, _08099F64 @ =gSinLut
	mov sl, r1
_08099EDE:
	mov r2, r8
	adds r2, #1
	lsls r1, r2, #3
	mov r3, sb
	ldr r0, [r3, #0x2c]
	subs r0, r0, r1
	lsls r4, r0, #5
	str r2, [sp, #4]
	cmp r4, r7
	ble _08099EF6
	movs r4, #0x80
	lsls r4, r4, #1
_08099EF6:
	cmp r4, #0x20
	ble _08099F6C
	ldr r1, _08099F68 @ =gCosLut
	movs r2, #0
	ldrsh r0, [r1, r2]
	lsls r0, r0, #4
	adds r1, r4, #0
	bl Div
	adds r6, r0, #0
	lsls r6, r6, #0x10
	asrs r6, r6, #0x10
	mov r3, sl
	movs r1, #0
	ldrsh r0, [r3, r1]
	rsbs r0, r0, #0
	lsls r0, r0, #4
	adds r1, r7, #0
	bl Div
	adds r5, r0, #0
	lsls r5, r5, #0x10
	asrs r5, r5, #0x10
	mov r2, sl
	movs r3, #0
	ldrsh r0, [r2, r3]
	lsls r0, r0, #4
	adds r1, r4, #0
	bl Div
	adds r4, r0, #0
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	ldr r1, _08099F68 @ =gCosLut
	movs r2, #0
	ldrsh r0, [r1, r2]
	lsls r0, r0, #4
	adds r1, r7, #0
	bl Div
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	str r0, [sp]
	mov r0, r8
	adds r1, r6, #0
	adds r2, r5, #0
	adds r3, r4, #0
	bl SetObjAffine
	b _08099FCA
	.align 2, 0
_08099F5C: .4byte gUnk_08D8D674
_08099F60: .4byte 0x0000F380
_08099F64: .4byte gSinLut
_08099F68: .4byte gCosLut
_08099F6C:
	ldr r3, _08099FE4 @ =gCosLut
	movs r1, #0
	ldrsh r0, [r3, r1]
	lsls r0, r0, #4
	movs r1, #0x20
	bl Div
	adds r6, r0, #0
	lsls r6, r6, #0x10
	asrs r6, r6, #0x10
	mov r2, sl
	movs r3, #0
	ldrsh r0, [r2, r3]
	rsbs r0, r0, #0
	lsls r0, r0, #4
	adds r1, r7, #0
	bl Div
	adds r5, r0, #0
	lsls r5, r5, #0x10
	asrs r5, r5, #0x10
	mov r1, sl
	movs r2, #0
	ldrsh r0, [r1, r2]
	lsls r0, r0, #4
	movs r1, #0x20
	bl Div
	adds r4, r0, #0
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	ldr r3, _08099FE4 @ =gCosLut
	movs r1, #0
	ldrsh r0, [r3, r1]
	lsls r0, r0, #4
	adds r1, r7, #0
	bl Div
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	str r0, [sp]
	mov r0, r8
	adds r1, r6, #0
	adds r2, r5, #0
	adds r3, r4, #0
	bl SetObjAffine
_08099FCA:
	ldr r2, [sp, #4]
	mov r8, r2
	cmp r2, #4
	ble _08099EDE
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08099FE4: .4byte gCosLut

	thumb_func_start sub_8099FE8
sub_8099FE8: @ 0x08099FE8
	push {r4, r5, r6, r7, lr}
	sub sp, #8
	ldr r4, _0809A038 @ =0x020129A8
	movs r0, #0
	bl SetTextFontGlyphs
	movs r0, #0
	bl SetTextFont
	movs r6, #0
	movs r5, #0x80
	ldr r7, _0809A03C @ =gUnk_08D8D634
_0809A000:
	adds r0, r4, #0
	bl ClearText
	ldm r7!, {r0}
	bl DecodeMsg
	adds r3, r4, #0
	adds r4, #8
	ldr r1, _0809A040 @ =gBg2Tm + 0x8
	adds r1, r5, r1
	movs r2, #0
	str r2, [sp]
	str r0, [sp, #4]
	adds r0, r3, #0
	movs r3, #0
	bl PutDrawText
	adds r5, #0x80
	adds r6, #1
	cmp r6, #4
	ble _0809A000
	movs r0, #4
	bl EnableBgSync
	add sp, #8
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0809A038: .4byte 0x020129A8
_0809A03C: .4byte gUnk_08D8D634
_0809A040: .4byte gBg2Tm + 0x8

	thumb_func_start sub_809A044
sub_809A044: @ 0x0809A044
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	adds r7, r0, #0
	bl sub_80B7100
	adds r5, r7, #0
	adds r5, #0x34
	movs r6, #0
	strb r0, [r5]
	bl sub_80B71F8
	movs r1, #0x35
	adds r1, r1, r7
	mov sl, r1
	strb r0, [r1]
	bl sub_80B735C
	movs r2, #0x36
	adds r2, r2, r7
	mov sb, r2
	strb r0, [r2]
	bl sub_80B7230
	movs r3, #0x37
	adds r3, r3, r7
	mov r8, r3
	strb r0, [r3]
	bl sub_80B7328
	adds r4, r7, #0
	adds r4, #0x38
	strb r0, [r4]
	ldrb r0, [r5]
	mov r5, sl
	ldrb r1, [r5]
	mov r3, sb
	ldrb r2, [r3]
	mov r5, r8
	ldrb r3, [r5]
	ldrb r4, [r4]
	str r4, [sp]
	bl sub_80B73FC
	adds r1, r7, #0
	adds r1, #0x39
	strb r0, [r1]
	str r6, [r7, #0x2c]
	ldr r0, _0809A0D8 @ =gUnk_0842B374
	ldr r1, _0809A0DC @ =0x06017000
	bl Decompress
	ldr r0, _0809A0E0 @ =gUnk_0842B4BC
	movs r1, #0xf8
	lsls r1, r1, #2
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r0, _0809A0E4 @ =sub_8099E34
	adds r1, r7, #0
	bl StartParallelWorker
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0809A0D8: .4byte gUnk_0842B374
_0809A0DC: .4byte 0x06017000
_0809A0E0: .4byte gUnk_0842B4BC
_0809A0E4: .4byte sub_8099E34

	thumb_func_start sub_809A0E8
sub_809A0E8: @ 0x0809A0E8
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r4, r0, #0
	bl sub_8099D18
	movs r0, #0xa0
	lsls r0, r0, #7
	movs r1, #5
	bl sub_809228C
	ldr r0, _0809A1E4 @ =gBg1Tm
	ldr r1, _0809A1E8 @ =gUnk_0842B57C
	movs r2, #0xa5
	lsls r2, r2, #7
	bl TmApplyTsa_thm
	movs r0, #7
	bl EnableBgSync
	adds r0, r4, #0
	bl ResetSysHandCursor
	movs r0, #0xc0
	lsls r0, r0, #3
	movs r1, #1
	bl DisplaySysHandCursorTextShadow
	ldr r0, _0809A1EC @ =gDispIo
	mov ip, r0
	movs r0, #0x21
	rsbs r0, r0, #0
	mov r1, ip
	ldrb r1, [r1, #1]
	ands r0, r1
	movs r1, #0x41
	rsbs r1, r1, #0
	ands r0, r1
	movs r1, #0x7f
	ands r0, r1
	mov r2, ip
	strb r0, [r2, #1]
	mov r1, ip
	adds r1, #0x2d
	movs r0, #0x80
	strb r0, [r1]
	adds r1, #4
	movs r0, #0x28
	strb r0, [r1]
	subs r1, #5
	movs r0, #0xe0
	strb r0, [r1]
	adds r1, #4
	movs r0, #0x98
	strb r0, [r1]
	mov r6, ip
	adds r6, #0x34
	movs r0, #1
	ldrb r1, [r6]
	orrs r1, r0
	movs r5, #2
	orrs r1, r5
	movs r2, #4
	orrs r1, r2
	movs r4, #8
	orrs r1, r4
	movs r3, #0x10
	orrs r1, r3
	mov r7, ip
	adds r7, #0x36
	ldrb r2, [r7]
	orrs r0, r2
	orrs r0, r5
	movs r2, #5
	rsbs r2, r2, #0
	ands r0, r2
	orrs r0, r4
	orrs r0, r3
	movs r2, #0x20
	orrs r1, r2
	strb r1, [r6]
	orrs r0, r2
	strb r0, [r7]
	mov r1, ip
	adds r1, #0x3c
	movs r0, #0x3f
	ldrb r2, [r1]
	ands r0, r2
	strb r0, [r1]
	mov r0, ip
	adds r0, #0x44
	movs r1, #8
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	ldr r5, _0809A1F0 @ =0x020129A8
	movs r4, #5
_0809A1AC:
	adds r0, r5, #0
	movs r1, #8
	bl InitText
	adds r5, #8
	subs r4, #1
	cmp r4, #0
	bge _0809A1AC
	ldr r0, _0809A1F4 @ =0x02012A90
	movs r1, #8
	bl InitText
	bl sub_8099FE8
	ldr r0, _0809A1F8 @ =gPlaySt
	ldrb r0, [r0, #0x1b]
	cmp r0, #3
	bne _0809A1FC
	movs r0, #0
	str r0, [sp]
	movs r0, #0x29
	movs r1, #0xd8
	movs r2, #0x58
	movs r3, #0x82
	bl sub_8008DA8
	b _0809A20C
	.align 2, 0
_0809A1E4: .4byte gBg1Tm
_0809A1E8: .4byte gUnk_0842B57C
_0809A1EC: .4byte gDispIo
_0809A1F0: .4byte 0x020129A8
_0809A1F4: .4byte 0x02012A90
_0809A1F8: .4byte gPlaySt
_0809A1FC:
	movs r0, #0
	str r0, [sp]
	movs r0, #0x32
	movs r1, #0xd8
	movs r2, #0x58
	movs r3, #0x82
	bl sub_8008DA8
_0809A20C:
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_809A214
sub_809A214: @ 0x0809A214
	adds r2, r0, #0
	ldr r3, _0809A234 @ =gPlaySt
	adds r1, r3, #0
	adds r1, #0x2b
	movs r0, #1
	ldrb r1, [r1]
	ands r0, r1
	cmp r0, #0
	beq _0809A248
	ldrb r3, [r3, #0x1b]
	cmp r3, #3
	bne _0809A23C
	adds r1, r2, #0
	adds r1, #0x39
	ldr r0, _0809A238 @ =0x00000F73
	b _0809A262
	.align 2, 0
_0809A234: .4byte gPlaySt
_0809A238: .4byte 0x00000F73
_0809A23C:
	adds r1, r2, #0
	adds r1, #0x39
	ldr r0, _0809A244 @ =0x00000F67
	b _0809A262
	.align 2, 0
_0809A244: .4byte 0x00000F67
_0809A248:
	ldrb r3, [r3, #0x1b]
	cmp r3, #3
	bne _0809A25C
	adds r1, r2, #0
	adds r1, #0x39
	ldr r0, _0809A258 @ =0x00000F79
	b _0809A262
	.align 2, 0
_0809A258: .4byte 0x00000F79
_0809A25C:
	adds r1, r2, #0
	adds r1, #0x39
	ldr r0, _0809A26C @ =0x00000F6D
_0809A262:
	ldrb r1, [r1]
	subs r0, r0, r1
	str r0, [r2, #0x30]
	bx lr
	.align 2, 0
_0809A26C: .4byte 0x00000F6D

	thumb_func_start sub_809A270
sub_809A270: @ 0x0809A270
	push {r4, lr}
	adds r4, r0, #0
	bl EndCgText
	adds r0, r4, #0
	bl EndAllProcChildren
	bl EndMuralBackground_
	movs r0, #0
	bl EndFaceById
	movs r0, #0
	bl SetOnHBlankA
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_809A294
sub_809A294: @ 0x0809A294
	push {r4, lr}
	adds r4, r0, #0
	bl sub_80893F4
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0809A2AA
	adds r0, r4, #0
	bl Proc_Break
	b _0809A2D2
_0809A2AA:
	ldr r0, _0809A2D8 @ =gpKeySt
	ldr r1, [r0]
	movs r0, #8
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _0809A2D2
	adds r0, r4, #0
	movs r1, #0
	bl Proc_Goto
	ldr r0, _0809A2DC @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0809A2D2
	ldr r0, _0809A2E0 @ =0x0000038B
	bl m4aSongNumStart
_0809A2D2:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0809A2D8: .4byte gpKeySt
_0809A2DC: .4byte gPlaySt
_0809A2E0: .4byte 0x0000038B

	thumb_func_start sub_809A2E4
sub_809A2E4: @ 0x0809A2E4
	push {r4, lr}
	sub sp, #0x10
	adds r4, r0, #0
	movs r0, #0x28
	movs r1, #0
	movs r2, #1
	bl InitTalk
	ldr r0, [r4, #0x30]
	str r0, [sp]
	ldr r0, _0809A320 @ =0x06011000
	str r0, [sp, #4]
	movs r0, #0xa
	str r0, [sp, #8]
	movs r0, #0
	str r0, [sp, #0xc]
	movs r0, #0x16
	movs r1, #0x13
	movs r2, #0x12
	movs r3, #4
	bl sub_8088584
	movs r0, #0x4e
	bl sub_8087E2C
	add sp, #0x10
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0809A320: .4byte 0x06011000

	thumb_func_start sub_809A324
sub_809A324: @ 0x0809A324
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	adds r7, r0, #0
	adds r0, #0x3b
	ldrb r0, [r0]
	cmp r0, #0
	beq _0809A3E6
	movs r0, #0
	mov r8, r0
	movs r1, #0x34
	adds r1, r1, r7
	mov sb, r1
	adds r2, r7, #0
	adds r2, #0x3e
	str r2, [sp, #4]
_0809A34A:
	mov r3, sb
	add r3, r8
	ldrb r0, [r3]
	movs r4, #1
	add r4, r8
	mov sl, r4
	cmp r0, #0xff
	beq _0809A3AC
	adds r0, r7, #0
	adds r0, #0x52
	movs r1, #0
	ldrsh r0, [r0, r1]
	adds r2, r0, #0
	adds r2, #0x34
	ldr r0, _0809A3F8 @ =0x000001FF
	ands r2, r0
	adds r0, r7, #0
	adds r0, #0x54
	movs r4, #0
	ldrsh r1, [r0, r4]
	mov r4, r8
	lsls r0, r4, #4
	adds r0, #0x19
	adds r6, r1, r0
	movs r0, #0xff
	ands r6, r0
	movs r5, #0
	ldrb r3, [r3]
	cmp r5, r3
	bgt _0809A3AC
	adds r4, r2, #0
_0809A388:
	lsls r0, r5, #2
	ldr r1, _0809A3FC @ =gUnk_08D8D674
	adds r0, r0, r1
	ldr r3, [r0]
	ldr r0, _0809A400 @ =0x0000F380
	str r0, [sp]
	movs r0, #0xd
	adds r1, r4, #0
	adds r2, r6, #0
	bl PutSpriteExt
	adds r4, #0xa
	adds r5, #1
	mov r0, sb
	add r0, r8
	ldrb r0, [r0]
	cmp r5, r0
	ble _0809A388
_0809A3AC:
	mov r8, sl
	mov r0, r8
	cmp r0, #4
	ble _0809A34A
	ldr r1, [sp, #4]
	ldrb r0, [r1]
	cmp r0, #0
	beq _0809A3E6
	adds r0, r7, #0
	adds r0, #0x52
	movs r2, #0
	ldrsh r1, [r0, r2]
	adds r1, #0xc0
	ldr r0, _0809A3F8 @ =0x000001FF
	ands r1, r0
	adds r0, r7, #0
	adds r0, #0x54
	movs r3, #0
	ldrsh r2, [r0, r3]
	adds r2, #0x1c
	movs r0, #0xff
	ands r2, r0
	ldr r0, _0809A3FC @ =gUnk_08D8D674
	ldr r3, [r0]
	ldr r0, _0809A400 @ =0x0000F380
	str r0, [sp]
	movs r0, #0xd
	bl PutSpriteExt
_0809A3E6:
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0809A3F8: .4byte 0x000001FF
_0809A3FC: .4byte gUnk_08D8D674
_0809A400: .4byte 0x0000F380

	thumb_func_start sub_809A404
sub_809A404: @ 0x0809A404
	push {r4, r5, r6, lr}
	sub sp, #0x10
	adds r4, r0, #0
	movs r2, #0
	mov r1, sp
	ldr r0, _0809A428 @ =gUnk_0842D18C
	ldm r0!, {r3, r5, r6}
	stm r1!, {r3, r5, r6}
	ldr r0, [r0]
	str r0, [r1]
	adds r0, r4, #0
	adds r0, #0x3d
	ldrb r0, [r0]
	cmp r0, #0
	beq _0809A42C
	movs r2, #1
	b _0809A44C
	.align 2, 0
_0809A428: .4byte gUnk_0842D18C
_0809A42C:
	adds r0, r4, #0
	adds r0, #0x3c
	ldrb r0, [r0]
	cmp r0, #1
	beq _0809A44C
	cmp r0, #1
	bgt _0809A440
	cmp r0, #0
	beq _0809A446
	b _0809A44C
_0809A440:
	cmp r0, #2
	beq _0809A44A
	b _0809A44C
_0809A446:
	movs r2, #3
	b _0809A44C
_0809A44A:
	movs r2, #2
_0809A44C:
	lsls r0, r2, #2
	add r0, sp
	ldr r0, [r0]
	movs r1, #0xa0
	movs r2, #0x20
	bl ApplyPaletteExt
	adds r0, r4, #0
	adds r0, #0x3b
	ldrb r0, [r0]
	cmp r0, #0
	bne _0809A474
	movs r0, #0x20
	bl ArchivePalette
	movs r0, #0xc0
	movs r1, #0xc0
	movs r2, #0xc0
	bl sub_8013B4C
_0809A474:
	add sp, #0x10
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	thumb_func_start sub_809A47C
sub_809A47C: @ 0x0809A47C
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r0, #0x3c
	movs r1, #0
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r0, #0x14
	strh r1, [r0]
	adds r0, #2
	strh r1, [r0]
	adds r0, #8
	strh r1, [r0]
	adds r0, #2
	strh r1, [r0]
	movs r2, #0
	ldr r6, _0809A510 @ =gUnk_0842B374
	adds r3, r4, #0
	adds r3, #0x34
	movs r5, #0xff
_0809A4A8:
	adds r1, r3, r2
	ldrb r0, [r1]
	orrs r0, r5
	strb r0, [r1]
	adds r2, #1
	cmp r2, #4
	ble _0809A4A8
	movs r0, #0
	str r0, [r4, #0x2c]
	ldr r1, _0809A514 @ =0x06017000
	adds r0, r6, #0
	bl Decompress
	ldr r0, _0809A518 @ =gUnk_0842B4BC
	movs r1, #0xf8
	lsls r1, r1, #2
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r2, _0809A51C @ =gPlaySt
	adds r2, #0x40
	movs r0, #0x61
	rsbs r0, r0, #0
	ldrb r1, [r2]
	ands r0, r1
	movs r1, #0x20
	orrs r0, r1
	strb r0, [r2]
	ldr r0, _0809A520 @ =sub_809A324
	adds r1, r4, #0
	bl StartParallelWorker
	adds r0, r4, #0
	bl StartGreenText
	ldr r2, _0809A524 @ =gDispIo
	adds r3, r2, #0
	adds r3, #0x3c
	movs r1, #0x21
	rsbs r1, r1, #0
	adds r0, r1, #0
	ldrb r4, [r3]
	ands r0, r4
	strb r0, [r3]
	adds r2, #0x3d
	ldrb r0, [r2]
	ands r1, r0
	strb r1, [r2]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0809A510: .4byte gUnk_0842B374
_0809A514: .4byte 0x06017000
_0809A518: .4byte gUnk_0842B4BC
_0809A51C: .4byte gPlaySt
_0809A520: .4byte sub_809A324
_0809A524: .4byte gDispIo

	thumb_func_start sub_809A528
sub_809A528: @ 0x0809A528
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	adds r7, r2, #0
	adds r6, r3, #0
	ldr r2, [sp, #0x14]
	cmp r2, #0
	ble _0809A554
	lsls r0, r1, #5
	adds r0, r4, r0
	ldr r1, _0809A55C @ =gBg2Tm
	adds r5, r2, #0
	lsls r0, r0, #1
	adds r4, r0, r1
_0809A542:
	adds r0, r4, #0
	adds r1, r7, #0
	adds r2, r6, #0
	bl PutSpecialChar
	adds r4, #2
	subs r5, #1
	cmp r5, #0
	bne _0809A542
_0809A554:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0809A55C: .4byte gBg2Tm

	thumb_func_start sub_809A560
sub_809A560: @ 0x0809A560
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x1c
	adds r7, r0, #0
	bl ResetText
	ldr r4, _0809A6EC @ =gBg2Tm
	adds r0, r4, #0
	movs r1, #0
	bl TmFill
	movs r0, #0
	bl SetTextFontGlyphs
	movs r0, #0
	bl SetTextFont
	adds r0, r7, #0
	adds r0, #0x3b
	ldrb r0, [r0]
	cmp r0, #0
	bne _0809A594
	b _0809A7FC
_0809A594:
	adds r1, r4, #0
	adds r1, #0x42
	movs r0, #0xc
	str r0, [sp]
	ldr r2, _0809A6F0 @ =gUnk_08D8D738
	adds r0, r7, #0
	adds r0, #0x3c
	ldrb r0, [r0]
	lsls r0, r0, #2
	adds r0, r0, r2
	ldr r0, [r0]
	str r0, [sp, #4]
	movs r0, #0
	movs r2, #0
	movs r3, #0
	bl PutDrawText
	movs r0, #0x40
	adds r0, r0, r7
	mov sb, r0
	adds r1, r7, #0
	adds r1, #0x41
	str r1, [sp, #0x10]
	adds r2, r7, #0
	adds r2, #0x42
	str r2, [sp, #0x14]
	adds r3, r7, #0
	adds r3, #0x39
	str r3, [sp, #8]
	movs r5, #0x3d
	adds r5, r5, r7
	mov sl, r5
	adds r0, r7, #0
	adds r0, #0x4e
	str r0, [sp, #0x18]
	subs r1, #3
	str r1, [sp, #0xc]
	movs r6, #0x80
	lsls r6, r6, #1
	ldr r2, _0809A6F4 @ =gUnk_08D8D634
	mov r8, r2
	movs r5, #4
_0809A5E8:
	mov r3, r8
	adds r3, #4
	mov r8, r3
	subs r3, #4
	ldm r3!, {r0}
	bl DecodeMsg
	ldr r4, _0809A6F8 @ =gBg2Tm + 0x4
	adds r1, r6, r4
	movs r2, #5
	str r2, [sp]
	str r0, [sp, #4]
	movs r0, #0
	movs r2, #0
	movs r3, #0
	bl PutDrawText
	adds r6, #0x80
	subs r5, #1
	cmp r5, #0
	bge _0809A5E8
	movs r5, #5
	movs r0, #0xef
	lsls r0, r0, #1
	adds r1, r4, r0
	movs r6, #4
	str r6, [sp]
	ldr r0, _0809A6FC @ =gUnk_0842D1C0
	str r0, [sp, #4]
	movs r0, #0
	movs r2, #0
	movs r3, #0
	bl PutDrawText
	movs r1, #0xf9
	lsls r1, r1, #1
	adds r0, r4, r1
	ldr r2, [r7, #0x58]
	movs r1, #2
	bl PutNumber
	movs r2, #0xfa
	lsls r2, r2, #1
	adds r0, r4, r2
	movs r1, #3
	movs r2, #0x1e
	bl PutSpecialChar
	ldr r3, _0809A700 @ =0x0000025E
	adds r1, r4, r3
	str r6, [sp]
	ldr r0, _0809A704 @ =gUnk_0842D1C8
	str r0, [sp, #4]
	movs r0, #0
	movs r2, #0
	movs r3, #0
	bl PutDrawText
	ldr r1, _0809A708 @ =0x0000026A
	adds r0, r4, r1
	movs r1, #0
	movs r2, #0x20
	bl PutSpecialChar
	movs r2, #0x9c
	lsls r2, r2, #2
	adds r0, r4, r2
	movs r1, #0
	movs r2, #0x20
	bl PutSpecialChar
	movs r3, #0x9a
	lsls r3, r3, #2
	adds r0, r4, r3
	mov r1, sb
	ldrb r2, [r1]
	movs r1, #2
	bl PutNumber
	ldr r2, _0809A70C @ =0x0000026E
	adds r0, r4, r2
	ldr r3, [sp, #0x10]
	ldrb r2, [r3]
	movs r1, #2
	bl sub_800625C
	movs r1, #0x9d
	lsls r1, r1, #2
	adds r0, r4, r1
	ldr r3, [sp, #0x14]
	ldrb r2, [r3]
	movs r1, #2
	bl sub_800625C
	adds r1, r4, #0
	adds r1, #0x4e
	str r5, [sp]
	ldr r0, _0809A710 @ =gUnk_0842D1D0
	str r0, [sp, #4]
	movs r0, #0
	movs r2, #3
	movs r3, #0
	bl PutDrawText
	adds r0, r4, #0
	adds r0, #0x56
	ldr r2, _0809A714 @ =gUnk_08D8D720
	ldr r5, [sp, #8]
	ldrb r5, [r5]
	lsls r1, r5, #2
	adds r1, r1, r2
	ldr r2, [r1]
	movs r1, #4
	bl PutSpecialChar
	mov r1, sl
	ldrb r0, [r1]
	cmp r0, #0
	bne _0809A71C
	adds r1, r4, #0
	adds r1, #0x5c
	str r6, [sp]
	ldr r0, _0809A718 @ =gUnk_0842D1D8
	str r0, [sp, #4]
	movs r0, #0
	movs r2, #3
	movs r3, #0
	bl PutDrawText
	b _0809A730
	.align 2, 0
_0809A6EC: .4byte gBg2Tm
_0809A6F0: .4byte gUnk_08D8D738
_0809A6F4: .4byte gUnk_08D8D634
_0809A6F8: .4byte gBg2Tm + 0x4
_0809A6FC: .4byte gUnk_0842D1C0
_0809A700: .4byte 0x0000025E
_0809A704: .4byte gUnk_0842D1C8
_0809A708: .4byte 0x0000026A
_0809A70C: .4byte 0x0000026E
_0809A710: .4byte gUnk_0842D1D0
_0809A714: .4byte gUnk_08D8D720
_0809A718: .4byte gUnk_0842D1D8
_0809A71C:
	adds r1, r4, #0
	adds r1, #0x5c
	str r6, [sp]
	ldr r0, _0809A7AC @ =gUnk_0842D1E4
	str r0, [sp, #4]
	movs r0, #0
	movs r2, #3
	movs r3, #4
	bl PutDrawText
_0809A730:
	ldr r5, _0809A7B0 @ =gBg2Tm + 0x6c
	movs r4, #2
	str r4, [sp]
	ldr r0, _0809A7B4 @ =gUnk_0842D1EC
	str r0, [sp, #4]
	movs r0, #0
	adds r1, r5, #0
	movs r2, #3
	movs r3, #0
	bl PutDrawText
	adds r0, r5, #4
	ldr r3, [sp, #0x18]
	ldrb r2, [r3]
	movs r1, #2
	bl PutNumber
	adds r1, r5, #6
	str r4, [sp]
	ldr r0, _0809A7B8 @ =gUnk_0842D1F0
	str r0, [sp, #4]
	movs r0, #0
	movs r2, #3
	movs r3, #0
	bl PutDrawText
	ldr r1, [sp, #0xc]
	ldrb r0, [r1]
	cmp r0, #0
	beq _0809A7C0
	adds r1, r5, #0
	adds r1, #0xb4
	movs r0, #3
	str r0, [sp]
	ldr r0, _0809A7BC @ =gUnk_0842D1F4
	str r0, [sp, #4]
	movs r0, #0
	movs r2, #3
	movs r3, #0
	bl PutDrawText
	adds r1, r5, #0
	adds r1, #0xba
	movs r0, #6
	str r0, [sp]
	adds r0, r7, #0
	adds r0, #0x43
	str r0, [sp, #4]
	movs r0, #0
	movs r2, #0
	movs r3, #0
	bl PutDrawText
	adds r0, r5, #0
	adds r0, #0xcc
	adds r1, r7, #0
	adds r1, #0x3a
	ldrb r2, [r1]
	movs r1, #2
	bl PutNumber
	b _0809A95C
	.align 2, 0
_0809A7AC: .4byte gUnk_0842D1E4
_0809A7B0: .4byte gBg2Tm + 0x6c
_0809A7B4: .4byte gUnk_0842D1EC
_0809A7B8: .4byte gUnk_0842D1F0
_0809A7BC: .4byte gUnk_0842D1F4
_0809A7C0:
	adds r1, r5, #0
	adds r1, #0xb4
	movs r0, #5
	str r0, [sp]
	ldr r0, _0809A7F8 @ =gUnk_0842D1F4
	str r0, [sp, #4]
	movs r0, #0
	movs r2, #1
	movs r3, #0
	bl PutDrawText
	movs r4, #3
	str r4, [sp]
	movs r0, #0x13
	movs r1, #4
	movs r2, #1
	movs r3, #0x14
	bl sub_809A528
	str r4, [sp]
	movs r0, #0x1a
	movs r1, #4
	movs r2, #1
	movs r3, #0x14
	bl sub_809A528
	b _0809A95C
	.align 2, 0
_0809A7F8: .4byte gUnk_0842D1F4
_0809A7FC:
	adds r1, r4, #0
	adds r1, #0x42
	movs r0, #0xc
	str r0, [sp]
	ldr r2, _0809A8F8 @ =gUnk_08D8D738
	adds r0, r7, #0
	adds r0, #0x3c
	ldrb r0, [r0]
	lsls r0, r0, #2
	adds r0, r0, r2
	ldr r0, [r0]
	str r0, [sp, #4]
	movs r0, #0
	movs r2, #0
	movs r3, #0
	bl PutDrawText
	movs r5, #0
	adds r7, #0x3d
	mov sl, r7
	movs r6, #0x80
	lsls r6, r6, #1
	movs r4, #4
_0809A82A:
	ldr r1, _0809A8FC @ =gUnk_08D8D634
	lsls r0, r5, #2
	adds r0, r0, r1
	ldr r0, [r0]
	bl DecodeMsg
	ldr r7, _0809A900 @ =gBg2Tm + 0x4
	adds r1, r6, r7
	movs r2, #5
	mov sb, r2
	str r2, [sp]
	str r0, [sp, #4]
	movs r0, #0
	movs r2, #1
	movs r3, #0
	bl PutDrawText
	movs r3, #3
	mov r8, r3
	str r3, [sp]
	movs r0, #8
	adds r1, r4, #0
	movs r2, #1
	movs r3, #0x14
	bl sub_809A528
	adds r6, #0x80
	adds r4, #2
	adds r5, #1
	cmp r5, #4
	ble _0809A82A
	movs r5, #0xef
	lsls r5, r5, #1
	adds r1, r7, r5
	movs r4, #4
	str r4, [sp]
	ldr r0, _0809A904 @ =gUnk_0842D1C0
	str r0, [sp, #4]
	movs r0, #0
	movs r2, #1
	movs r3, #0
	bl PutDrawText
	mov r0, r8
	str r0, [sp]
	movs r0, #0x16
	movs r1, #7
	movs r2, #1
	movs r3, #0x14
	bl sub_809A528
	ldr r2, _0809A908 @ =0x0000025E
	adds r1, r7, r2
	str r4, [sp]
	ldr r0, _0809A90C @ =gUnk_0842D1C8
	str r0, [sp, #4]
	movs r0, #0
	movs r2, #1
	movs r3, #0
	bl PutDrawText
	mov r3, r8
	str r3, [sp]
	movs r0, #0x16
	movs r1, #9
	movs r2, #1
	movs r3, #0x14
	bl sub_809A528
	adds r1, r7, #0
	adds r1, #0x4e
	mov r5, sb
	str r5, [sp]
	ldr r0, _0809A910 @ =gUnk_0842D1D0
	str r0, [sp, #4]
	movs r0, #0
	movs r2, #1
	movs r3, #0
	bl PutDrawText
	movs r0, #1
	str r0, [sp]
	movs r0, #0xd
	movs r1, #1
	movs r2, #1
	movs r3, #0x14
	bl sub_809A528
	mov r1, sl
	ldrb r0, [r1]
	cmp r0, #0
	bne _0809A918
	adds r1, r7, #0
	adds r1, #0x5c
	str r4, [sp]
	ldr r0, _0809A914 @ =gUnk_0842D1D8
	str r0, [sp, #4]
	movs r0, #0
	movs r2, #1
	movs r3, #0
	bl PutDrawText
	b _0809A92C
	.align 2, 0
_0809A8F8: .4byte gUnk_08D8D738
_0809A8FC: .4byte gUnk_08D8D634
_0809A900: .4byte gBg2Tm + 0x4
_0809A904: .4byte gUnk_0842D1C0
_0809A908: .4byte 0x0000025E
_0809A90C: .4byte gUnk_0842D1C8
_0809A910: .4byte gUnk_0842D1D0
_0809A914: .4byte gUnk_0842D1D8
_0809A918:
	adds r1, r7, #0
	adds r1, #0x5c
	str r4, [sp]
	ldr r0, _0809A974 @ =gUnk_0842D1E4
	str r0, [sp, #4]
	movs r0, #0
	movs r2, #1
	movs r3, #4
	bl PutDrawText
_0809A92C:
	movs r0, #4
	str r0, [sp]
	movs r0, #0x16
	movs r1, #1
	movs r2, #1
	movs r3, #0x14
	bl sub_809A528
	movs r0, #5
	str r0, [sp]
	movs r0, #0x11
	movs r1, #4
	movs r2, #1
	movs r3, #0x14
	bl sub_809A528
	movs r0, #3
	str r0, [sp]
	movs r0, #0x1a
	movs r1, #4
	movs r2, #1
	movs r3, #0x14
	bl sub_809A528
_0809A95C:
	movs r0, #4
	bl EnableBgSync
	add sp, #0x1c
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0809A974: .4byte gUnk_0842D1E4

	thumb_func_start sub_809A978
sub_809A978: @ 0x0809A978
	push {r4, lr}
	adds r4, r0, #0
	bl sub_8099D18
	adds r0, r4, #0
	bl ResetSysHandCursor
	movs r0, #0xc0
	lsls r0, r0, #3
	movs r1, #1
	bl DisplaySysHandCursorTextShadow
	adds r0, r4, #0
	bl StartUiSpinningArrows
	movs r1, #0xa0
	lsls r1, r1, #2
	movs r0, #0
	movs r2, #2
	bl LoadUiSpinningArrowGfx
	movs r0, #3
	bl SetUiSpinningArrowConfig
	movs r0, #0
	movs r1, #0x40
	movs r2, #0xe8
	movs r3, #0x40
	bl SetUiSpinningArrowPositions
	ldr r3, _0809A9F8 @ =gDispIo
	adds r2, r3, #0
	adds r2, #0x34
	movs r0, #0x20
	ldrb r1, [r2]
	orrs r1, r0
	strb r1, [r2]
	adds r1, r3, #0
	adds r1, #0x36
	ldrb r2, [r1]
	orrs r0, r2
	strb r0, [r1]
	adds r1, #6
	movs r0, #0x3f
	ldrb r2, [r1]
	ands r0, r2
	strb r0, [r1]
	adds r0, r3, #0
	adds r0, #0x44
	movs r1, #0
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	movs r0, #0xa0
	lsls r0, r0, #7
	movs r1, #5
	bl sub_809228C
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0809A9F8: .4byte gDispIo

	thumb_func_start sub_809A9FC
sub_809A9FC: @ 0x0809A9FC
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #0x2c
	adds r6, r0, #0
	add r0, sp, #0x28
	movs r1, #0
	strh r1, [r0]
	ldr r2, _0809AB18 @ =0x0100000C
	add r1, sp, #0x10
	bl CpuSet
	adds r0, r6, #0
	adds r0, #0x3c
	ldrb r1, [r0]
	adds r0, #1
	ldrb r2, [r0]
	add r0, sp, #0x10
	bl sub_809FC60
	add r0, sp, #0x10
	ldrb r2, [r0]
	lsls r0, r2, #0x1f
	lsrs r0, r0, #0x1f
	adds r1, r6, #0
	adds r1, #0x3b
	strb r0, [r1]
	cmp r0, #0
	bne _0809AA3A
	b _0809AB8C
_0809AA3A:
	lsls r0, r2, #0x19
	lsrs r0, r0, #0x1d
	adds r3, r6, #0
	adds r3, #0x34
	strb r0, [r3]
	add r0, sp, #0x10
	ldrh r0, [r0]
	lsls r0, r0, #0x16
	lsrs r0, r0, #0x1d
	movs r1, #0x35
	adds r1, r1, r6
	mov r8, r1
	strb r0, [r1]
	add r0, sp, #0x10
	ldrb r1, [r0, #1]
	lsls r0, r1, #0x1b
	lsrs r0, r0, #0x1d
	movs r2, #0x36
	adds r2, r2, r6
	mov ip, r2
	strb r0, [r2]
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x1d
	adds r7, r6, #0
	adds r7, #0x37
	strb r1, [r7]
	add r0, sp, #0x10
	ldrb r1, [r0, #2]
	lsls r0, r1, #0x1d
	lsrs r0, r0, #0x1d
	adds r4, r6, #0
	adds r4, #0x38
	strb r0, [r4]
	lsls r1, r1, #0x19
	lsrs r1, r1, #0x1f
	movs r0, #0x3e
	adds r0, r0, r6
	mov sb, r0
	strb r1, [r0]
	ldr r0, [sp, #0x14]
	lsrs r0, r0, #7
	adds r1, r6, #0
	adds r1, #0x40
	strb r0, [r1]
	add r0, sp, #0x10
	ldrb r0, [r0, #6]
	lsls r0, r0, #0x19
	lsrs r0, r0, #0x1a
	adds r1, #1
	strb r0, [r1]
	add r0, sp, #0x10
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x13
	lsrs r0, r0, #0x1a
	adds r1, #1
	strb r0, [r1]
	add r0, sp, #0x10
	ldrb r0, [r0, #7]
	lsrs r2, r0, #5
	ldr r0, [sp, #0x18]
	ldr r1, _0809AB1C @ =0x001FFFFF
	ands r0, r1
	lsls r0, r0, #3
	orrs r0, r2
	str r0, [r6, #0x58]
	add r0, sp, #0x10
	ldrb r0, [r0, #0x17]
	adds r5, r6, #0
	adds r5, #0x3f
	strb r0, [r5]
	ldrb r0, [r3]
	mov r2, r8
	ldrb r1, [r2]
	mov r3, ip
	ldrb r2, [r3]
	ldrb r3, [r7]
	ldrb r4, [r4]
	str r4, [sp]
	bl sub_80B73FC
	adds r1, r6, #0
	adds r1, #0x39
	strb r0, [r1]
	add r0, sp, #0x10
	ldrh r0, [r0, #0xa]
	lsls r0, r0, #0x15
	lsrs r0, r0, #0x1a
	adds r2, r6, #0
	adds r2, #0x4e
	strb r0, [r2]
	add r0, sp, #0x10
	ldrh r0, [r0, #2]
	lsrs r0, r0, #7
	subs r2, #0x14
	strb r0, [r2]
	mov r2, sb
	ldrb r0, [r2]
	adds r7, r1, #0
	cmp r0, #0
	beq _0809AB20
	adds r4, r6, #0
	adds r4, #0x43
	add r1, sp, #0x1c
	adds r0, r4, #0
	bl strcpy
	adds r0, r4, #0
	bl SetTacticianName
	b _0809AB2A
	.align 2, 0
_0809AB18: .4byte 0x0100000C
_0809AB1C: .4byte 0x001FFFFF
_0809AB20:
	ldr r0, _0809AB68 @ =0x00000569
	bl DecodeMsg
	bl SetTacticianName
_0809AB2A:
	ldrb r0, [r5]
	cmp r0, #0
	beq _0809AB4C
	ldrb r1, [r7]
	bl sub_809B214
	cmp r0, #0
	bne _0809AB3C
	strb r0, [r5]
_0809AB3C:
	ldrb r0, [r5]
	adds r4, r6, #0
	adds r4, #0x3b
	ldr r3, _0809AB6C @ =gBg1Tm
	mov r8, r3
	ldr r7, _0809AB70 @ =gUnk_0842BA30
	cmp r0, #0
	bne _0809ABAA
_0809AB4C:
	adds r0, r6, #0
	adds r0, #0x3c
	ldrb r0, [r0]
	cmp r0, #0
	bne _0809AB74
	movs r0, #0x2d
	strb r0, [r5]
	adds r4, r6, #0
	adds r4, #0x3b
	ldr r0, _0809AB6C @ =gBg1Tm
	mov r8, r0
	ldr r7, _0809AB70 @ =gUnk_0842BA30
	b _0809ABAA
	.align 2, 0
_0809AB68: .4byte 0x00000569
_0809AB6C: .4byte gBg1Tm
_0809AB70: .4byte gUnk_0842BA30
_0809AB74:
	movs r0, #0x28
	strb r0, [r5]
	adds r4, r6, #0
	adds r4, #0x3b
	ldr r1, _0809AB84 @ =gBg1Tm
	mov r8, r1
	ldr r7, _0809AB88 @ =gUnk_0842BA30
	b _0809ABAA
	.align 2, 0
_0809AB84: .4byte gBg1Tm
_0809AB88: .4byte gUnk_0842BA30
_0809AB8C:
	movs r2, #0
	adds r4, r1, #0
	ldr r3, _0809AC48 @ =gBg1Tm
	mov r8, r3
	ldr r7, _0809AC4C @ =gUnk_0842BA30
	adds r3, r6, #0
	adds r3, #0x34
	movs r5, #0xff
_0809AB9C:
	adds r1, r3, r2
	ldrb r0, [r1]
	orrs r0, r5
	strb r0, [r1]
	adds r2, #1
	cmp r2, #4
	ble _0809AB9C
_0809ABAA:
	movs r2, #0xa5
	lsls r2, r2, #7
	mov r0, r8
	adds r1, r7, #0
	bl TmApplyTsa_thm
	adds r0, r6, #0
	bl sub_809A560
	adds r0, r6, #0
	bl sub_809A404
	movs r0, #7
	bl EnableBgSync
	movs r0, #0
	bl EndFaceById
	bl EndCgText
	ldrb r0, [r4]
	cmp r0, #0
	beq _0809AC38
	adds r4, r6, #0
	adds r4, #0x3f
	ldrb r0, [r4]
	cmp r0, #0
	beq _0809AC38
	ldr r2, _0809AC50 @ =gCharacterData
	ldrb r1, [r4]
	subs r1, #1
	movs r0, #0x34
	muls r0, r1, r0
	adds r0, r0, r2
	ldrh r1, [r0, #6]
	movs r0, #0xc1
	lsls r0, r0, #1
	str r0, [sp]
	movs r0, #0
	movs r2, #0xd8
	movs r3, #0x58
	bl StartBmFace
	ldrb r0, [r4]
	adds r1, r6, #0
	adds r1, #0x39
	ldrb r1, [r1]
	bl sub_809B214
	adds r4, r0, #0
	movs r0, #0x28
	movs r1, #0
	movs r2, #1
	bl InitTalk
	str r4, [sp]
	ldr r0, _0809AC54 @ =0x06011000
	str r0, [sp, #4]
	movs r0, #0xa
	str r0, [sp, #8]
	movs r0, #0
	str r0, [sp, #0xc]
	movs r0, #0x16
	movs r1, #0x13
	movs r2, #0x12
	movs r3, #4
	bl sub_8088584
	ldr r0, _0809AC58 @ =0x000809FE
	bl sub_8087E2C
_0809AC38:
	add sp, #0x2c
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0809AC48: .4byte gBg1Tm
_0809AC4C: .4byte gUnk_0842BA30
_0809AC50: .4byte gCharacterData
_0809AC54: .4byte 0x06011000
_0809AC58: .4byte 0x000809FE

	thumb_func_start sub_809AC5C
sub_809AC5C: @ 0x0809AC5C
	push {r4, r5, lr}
	sub sp, #4
	adds r4, r0, #0
	adds r0, #0x4f
	movs r5, #0
	strb r5, [r0]
	adds r0, #1
	strb r5, [r0]
	ldr r1, _0809ACA8 @ =gpKeySt
	ldr r2, [r1]
	movs r0, #2
	ldrh r3, [r2, #8]
	ands r0, r3
	adds r3, r1, #0
	cmp r0, #0
	beq _0809ACB4
	ldr r0, _0809ACAC @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0809AC8E
	ldr r0, _0809ACB0 @ =0x0000038B
	bl m4aSongNumStart
_0809AC8E:
	movs r1, #0x80
	lsls r1, r1, #1
	str r5, [sp]
	movs r0, #0x5a
	movs r2, #0xc0
	movs r3, #0x18
	bl CallSomeSoundMaybe
	adds r0, r4, #0
	movs r1, #0
	bl Proc_Goto
	b _0809AD4C
	.align 2, 0
_0809ACA8: .4byte gpKeySt
_0809ACAC: .4byte gPlaySt
_0809ACB0: .4byte 0x0000038B
_0809ACB4:
	movs r0, #4
	ldrh r2, [r2, #4]
	ands r0, r2
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0
	beq _0809AD00
	adds r0, r4, #0
	adds r0, #0x5e
	ldrh r1, [r0]
	adds r1, #1
	strh r1, [r0]
	subs r0, #0x23
	ldrb r0, [r0]
	cmp r0, #0
	beq _0809AD06
	lsls r0, r1, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0xb4
	bls _0809AD06
	ldr r0, _0809ACF8 @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0809ACEE
	ldr r0, _0809ACFC @ =0x0000038A
	bl m4aSongNumStart
_0809ACEE:
	adds r0, r4, #0
	movs r1, #3
	bl Proc_Goto
	b _0809AD4C
	.align 2, 0
_0809ACF8: .4byte gPlaySt
_0809ACFC: .4byte 0x0000038A
_0809AD00:
	adds r1, r4, #0
	adds r1, #0x5e
	strh r0, [r1]
_0809AD06:
	ldr r1, [r3]
	movs r0, #0x88
	lsls r0, r0, #2
	ldrh r1, [r1, #8]
	ands r0, r1
	adds r2, r4, #0
	adds r2, #0x4f
	cmp r0, #0
	beq _0809AD1C
	movs r0, #0xff
	strb r0, [r2]
_0809AD1C:
	ldr r1, [r3]
	movs r0, #0x88
	lsls r0, r0, #1
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _0809AD2E
	movs r0, #1
	strb r0, [r2]
_0809AD2E:
	movs r0, #0
	ldrsb r0, [r2, r0]
	cmp r0, #0
	bne _0809AD44
	adds r0, r4, #0
	adds r0, #0x50
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _0809AD4C
_0809AD44:
	adds r0, r4, #0
	movs r1, #2
	bl Proc_Goto
_0809AD4C:
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start sub_809AD54
sub_809AD54: @ 0x0809AD54
	push {r4, r5, r6, r7, lr}
	sub sp, #0x10
	adds r6, r0, #0
	adds r6, #0x5c
	ldrh r0, [r6]
	bl sub_809B2A0
	adds r7, r0, #0
	cmp r7, #0
	bne _0809AD72
	strh r7, [r6]
	movs r0, #0
	bl sub_809B2A0
	adds r7, r0, #0
_0809AD72:
	ldrh r0, [r6]
	bl sub_809B248
	adds r5, r0, #0
	ldrh r0, [r6]
	adds r0, #1
	movs r4, #0
	strh r0, [r6]
	movs r0, #0
	bl EndFaceById
	ldr r2, _0809ADD0 @ =gCharacterData
	subs r1, r7, #1
	movs r0, #0x34
	muls r0, r1, r0
	adds r0, r0, r2
	ldrh r0, [r0, #6]
	str r4, [sp]
	movs r1, #0xd8
	movs r2, #0x58
	movs r3, #0x82
	bl sub_8008DA8
	movs r0, #0x28
	movs r1, #0
	movs r2, #1
	bl InitTalk
	str r5, [sp]
	ldr r0, _0809ADD4 @ =0x06011000
	str r0, [sp, #4]
	movs r0, #0xa
	str r0, [sp, #8]
	str r4, [sp, #0xc]
	movs r0, #0x16
	movs r1, #0x13
	movs r2, #0x12
	movs r3, #4
	bl sub_8088584
	ldr r0, _0809ADD8 @ =0x0002000A
	bl sub_8087E2C
	add sp, #0x10
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0809ADD0: .4byte gCharacterData
_0809ADD4: .4byte 0x06011000
_0809ADD8: .4byte 0x0002000A

	thumb_func_start sub_809ADDC
sub_809ADDC: @ 0x0809ADDC
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	ldr r4, _0809AECC @ =gDispIo
	movs r2, #4
	rsbs r2, r2, #0
	adds r1, r2, #0
	ldrb r3, [r4, #0xc]
	ands r1, r3
	movs r3, #1
	mov r8, r3
	mov r3, r8
	orrs r1, r3
	strb r1, [r4, #0xc]
	movs r1, #3
	ldrb r3, [r4, #0x10]
	orrs r1, r3
	strb r1, [r4, #0x10]
	adds r1, r2, #0
	ldrb r3, [r4, #0x14]
	ands r1, r3
	movs r6, #2
	orrs r1, r6
	strb r1, [r4, #0x14]
	ldrb r1, [r4, #0x18]
	ands r2, r1
	strb r2, [r4, #0x18]
	movs r5, #0
	str r5, [r0, #0x2c]
	adds r2, r4, #0
	adds r2, #0x3c
	movs r0, #0x3f
	ldrb r3, [r2]
	ands r0, r3
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r2]
	adds r0, r4, #0
	adds r0, #0x44
	strb r5, [r0]
	adds r1, r4, #0
	adds r1, #0x45
	movs r7, #0x10
	movs r0, #0x10
	strb r0, [r1]
	adds r0, r4, #0
	adds r0, #0x46
	strb r5, [r0]
	ldr r0, _0809AED0 @ =0x0000FFE0
	ldrh r1, [r4, #0x3c]
	ands r0, r1
	movs r1, #8
	orrs r0, r1
	ldr r1, _0809AED4 @ =0x0000E0FF
	ands r0, r1
	movs r2, #0xb8
	lsls r2, r2, #5
	adds r1, r2, #0
	orrs r0, r1
	strh r0, [r4, #0x3c]
	ldr r0, _0809AED8 @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0809AE66
	movs r0, #0xc8
	bl m4aSongNumStart
_0809AE66:
	movs r0, #0x20
	ldrb r3, [r4, #1]
	orrs r0, r3
	movs r1, #0x41
	rsbs r1, r1, #0
	ands r0, r1
	movs r1, #0x7f
	ands r0, r1
	strb r0, [r4, #1]
	adds r2, r4, #0
	adds r2, #0x34
	mov r0, r8
	ldrb r1, [r2]
	orrs r0, r1
	orrs r0, r6
	movs r1, #4
	orrs r0, r1
	movs r3, #8
	orrs r0, r3
	orrs r0, r7
	strb r0, [r2]
	adds r2, #2
	movs r0, #2
	rsbs r0, r0, #0
	ldrb r1, [r2]
	ands r0, r1
	movs r1, #3
	rsbs r1, r1, #0
	ands r0, r1
	subs r1, #2
	ands r0, r1
	orrs r0, r3
	orrs r0, r7
	strb r0, [r2]
	adds r0, r4, #0
	adds r0, #0x2d
	strb r5, [r0]
	adds r0, #4
	strb r5, [r0]
	adds r1, r4, #0
	adds r1, #0x2c
	movs r0, #0xf0
	strb r0, [r1]
	adds r1, #4
	movs r0, #0xa0
	strb r0, [r1]
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0809AECC: .4byte gDispIo
_0809AED0: .4byte 0x0000FFE0
_0809AED4: .4byte 0x0000E0FF
_0809AED8: .4byte gPlaySt

	thumb_func_start sub_809AEDC
sub_809AEDC: @ 0x0809AEDC
	push {r4, lr}
	movs r1, #0
	movs r4, #0xf0
	cmp r0, #0
	ble _0809AEE8
	adds r1, r0, #0
_0809AEE8:
	cmp r0, #0
	bge _0809AEF2
	movs r2, #0x80
	lsls r2, r2, #1
	adds r4, r0, r2
_0809AEF2:
	cmp r4, #0xf0
	bgt _0809AF00
	adds r0, r4, #0
	cmp r0, #0
	bge _0809AF02
	movs r0, #0
	b _0809AF02
_0809AF00:
	movs r0, #0xf0
_0809AF02:
	adds r4, r0, #0
	cmp r1, #0xf0
	bgt _0809AF10
	cmp r1, #0
	bge _0809AF12
	movs r1, #0
	b _0809AF12
_0809AF10:
	movs r1, #0xf0
_0809AF12:
	ldr r2, _0809AF34 @ =gDispIo
	adds r3, r2, #0
	adds r3, #0x2d
	movs r0, #0
	strb r1, [r3]
	adds r1, r2, #0
	adds r1, #0x31
	strb r0, [r1]
	adds r0, r2, #0
	adds r0, #0x2c
	strb r4, [r0]
	subs r1, #1
	movs r0, #0xa0
	strb r0, [r1]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0809AF34: .4byte gDispIo

	thumb_func_start sub_809AF38
sub_809AF38: @ 0x0809AF38
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r6, r0, #0
	ldr r0, [r6, #0x2c]
	adds r0, #1
	str r0, [r6, #0x2c]
	movs r4, #0xa
	subs r4, r4, r0
	lsls r0, r4, #3
	muls r0, r4, r0
	movs r1, #0x64
	bl __divsi3
	movs r5, #8
	subs r5, r5, r0
	lsls r0, r4, #4
	muls r0, r4, r0
	movs r1, #0x64
	bl __divsi3
	movs r3, #0x10
	subs r3, r3, r0
	adds r0, r6, #0
	adds r0, #0x4f
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r0, r0, #3
	adds r1, r5, #0
	muls r1, r0, r1
	mov r8, r1
	adds r0, r6, #0
	adds r0, #0x50
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r0, r0, #3
	adds r7, r5, #0
	muls r7, r0, r7
	ldr r4, _0809B024 @ =gDispIo
	adds r2, r4, #0
	adds r2, #0x3c
	movs r0, #0x3f
	ldrb r1, [r2]
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r2]
	adds r0, r4, #0
	adds r0, #0x44
	movs r1, #0
	strb r3, [r0]
	movs r0, #0x10
	subs r0, r0, r3
	adds r2, #9
	strb r0, [r2]
	adds r0, r4, #0
	adds r0, #0x46
	strb r1, [r0]
	mov r0, r8
	lsls r5, r0, #0x10
	lsrs r5, r5, #0x10
	lsls r4, r7, #0x10
	lsrs r4, r4, #0x10
	movs r0, #0
	adds r1, r5, #0
	adds r2, r4, #0
	bl SetBgOffset
	movs r0, #1
	adds r1, r5, #0
	adds r2, r4, #0
	bl SetBgOffset
	adds r2, r7, #4
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	movs r0, #2
	adds r1, r5, #0
	bl SetBgOffset
	mov r1, r8
	rsbs r0, r1, #0
	adds r1, r6, #0
	adds r1, #0x52
	strh r0, [r1]
	rsbs r1, r7, #0
	adds r2, r6, #0
	adds r2, #0x54
	strh r1, [r2]
	bl sub_809AEDC
	adds r0, r6, #0
	adds r0, #0x3f
	ldrb r0, [r0]
	cmp r0, #0
	beq _0809B00C
	movs r1, #0xd8
	mov r0, r8
	subs r1, r1, r0
	movs r2, #0x58
	subs r2, r2, r7
	movs r0, #0
	bl sub_8007B80
_0809B00C:
	ldr r0, [r6, #0x2c]
	cmp r0, #0xa
	bne _0809B018
	adds r0, r6, #0
	bl Proc_Break
_0809B018:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0809B024: .4byte gDispIo

	thumb_func_start sub_809B028
sub_809B028: @ 0x0809B028
	push {r4, r5, lr}
	adds r4, r0, #0
	movs r5, #0
	str r5, [r4, #0x2c]
	adds r0, #0x4f
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	ble _0809B060
	movs r0, #1
	bl SetUiSpinningArrowFastMaybe
	adds r2, r4, #0
	adds r2, #0x3c
	ldrb r0, [r2]
	cmp r0, #2
	bne _0809B05C
	adds r1, r4, #0
	adds r1, #0x3d
	movs r0, #1
	ldrb r3, [r1]
	subs r0, r0, r3
	strb r0, [r1]
	strb r5, [r2]
	b _0809B060
_0809B05C:
	adds r0, #1
	strb r0, [r2]
_0809B060:
	adds r0, r4, #0
	adds r0, #0x4f
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bge _0809B092
	movs r0, #0
	bl SetUiSpinningArrowFastMaybe
	adds r2, r4, #0
	adds r2, #0x3c
	ldrb r0, [r2]
	cmp r0, #0
	bne _0809B08E
	adds r0, r4, #0
	adds r0, #0x3d
	movs r1, #1
	ldrb r3, [r0]
	subs r1, r1, r3
	strb r1, [r0]
	movs r0, #2
	b _0809B090
_0809B08E:
	subs r0, #1
_0809B090:
	strb r0, [r2]
_0809B092:
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start sub_809B098
sub_809B098: @ 0x0809B098
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	adds r7, r0, #0
	ldr r0, [r7, #0x2c]
	adds r0, #1
	str r0, [r7, #0x2c]
	movs r5, #0xa
	subs r5, r5, r0
	lsls r0, r5, #3
	muls r0, r5, r0
	movs r1, #0x64
	bl __divsi3
	movs r4, #8
	subs r4, r4, r0
	lsls r0, r5, #4
	muls r0, r5, r0
	movs r1, #0x64
	bl __divsi3
	movs r2, #0x10
	subs r2, r2, r0
	lsls r4, r4, #3
	subs r4, #0x40
	adds r0, r7, #0
	adds r0, #0x4f
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r1, r4, #0
	muls r1, r0, r1
	mov sb, r1
	adds r0, r7, #0
	adds r0, #0x50
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r3, r4, #0
	muls r3, r0, r3
	mov r8, r3
	ldr r6, _0809B1EC @ =gDispIo
	movs r0, #0x3c
	adds r0, r0, r6
	mov sl, r0
	movs r0, #0x3f
	mov r1, sl
	ldrb r1, [r1]
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	mov r3, sl
	strb r0, [r3]
	movs r0, #0x10
	subs r0, r0, r2
	movs r1, #0
	ldr r3, _0809B1F0 @ =0x030027D4
	strb r0, [r3]
	ldr r0, _0809B1F4 @ =0x030027D5
	strb r2, [r0]
	ldr r2, _0809B1F8 @ =0x030027D6
	strb r1, [r2]
	mov r3, sb
	lsls r5, r3, #0x10
	lsrs r5, r5, #0x10
	mov r0, r8
	lsls r4, r0, #0x10
	lsrs r4, r4, #0x10
	movs r0, #0
	adds r1, r5, #0
	adds r2, r4, #0
	bl SetBgOffset
	movs r0, #1
	adds r1, r5, #0
	adds r2, r4, #0
	bl SetBgOffset
	mov r2, r8
	adds r2, #4
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	movs r0, #2
	adds r1, r5, #0
	bl SetBgOffset
	mov r1, sb
	rsbs r0, r1, #0
	adds r1, r7, #0
	adds r1, #0x52
	movs r4, #0
	strh r0, [r1]
	mov r2, r8
	rsbs r1, r2, #0
	adds r2, r7, #0
	adds r2, #0x54
	strh r1, [r2]
	bl sub_809AEDC
	adds r0, r7, #0
	adds r0, #0x3f
	ldrb r0, [r0]
	cmp r0, #0
	beq _0809B17E
	movs r1, #0xd8
	mov r3, sb
	subs r1, r1, r3
	movs r2, #0x58
	mov r0, r8
	subs r2, r2, r0
	movs r0, #0
	bl sub_8007B80
_0809B17E:
	ldr r0, [r7, #0x2c]
	cmp r0, #0xa
	bne _0809B1DE
	adds r0, r7, #0
	bl Proc_Break
	movs r1, #4
	rsbs r1, r1, #0
	adds r0, r1, #0
	ldrb r2, [r6, #0xc]
	ands r0, r2
	movs r2, #1
	orrs r0, r2
	strb r0, [r6, #0xc]
	movs r2, #3
	ldrb r0, [r6, #0x10]
	orrs r0, r2
	strb r0, [r6, #0x10]
	ldrb r3, [r6, #0x14]
	ands r1, r3
	movs r0, #2
	orrs r1, r0
	strb r1, [r6, #0x14]
	ldrb r0, [r6, #0x18]
	orrs r2, r0
	strb r2, [r6, #0x18]
	movs r0, #0x3f
	mov r1, sl
	ldrb r1, [r1]
	ands r0, r1
	mov r2, sl
	strb r0, [r2]
	ldr r3, _0809B1F0 @ =0x030027D4
	strb r4, [r3]
	ldr r0, _0809B1F4 @ =0x030027D5
	strb r4, [r0]
	ldr r1, _0809B1F8 @ =0x030027D6
	strb r4, [r1]
	movs r0, #0x21
	rsbs r0, r0, #0
	ldrb r2, [r6, #1]
	ands r0, r2
	movs r1, #0x41
	rsbs r1, r1, #0
	ands r0, r1
	movs r1, #0x7f
	ands r0, r1
	strb r0, [r6, #1]
_0809B1DE:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0809B1EC: .4byte gDispIo
_0809B1F0: .4byte 0x030027D4
_0809B1F4: .4byte 0x030027D5
_0809B1F8: .4byte 0x030027D6

	thumb_func_start sub_809B1FC
sub_809B1FC: @ 0x0809B1FC
	push {lr}
	adds r2, r0, #0
	adds r0, #0x3c
	ldrb r0, [r0]
	adds r1, r2, #0
	adds r1, #0x3d
	ldrb r1, [r1]
	bl sub_809EDF0
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_809B214
sub_809B214: @ 0x0809B214
	adds r3, r0, #0
	ldr r2, _0809B21C @ =gUnk_08D8D84C
	b _0809B23C
	.align 2, 0
_0809B21C: .4byte gUnk_08D8D84C
_0809B220:
	ldr r0, [r2]
	cmp r3, r0
	bne _0809B23A
	cmp r1, #3
	ble _0809B22E
	ldr r0, [r2, #4]
	b _0809B244
_0809B22E:
	cmp r1, #1
	ble _0809B236
	ldr r0, [r2, #8]
	b _0809B244
_0809B236:
	ldr r0, [r2, #0xc]
	b _0809B244
_0809B23A:
	adds r2, #0x10
_0809B23C:
	ldr r0, [r2]
	cmp r0, #0
	bne _0809B220
	movs r0, #0
_0809B244:
	bx lr
	.align 2, 0

	thumb_func_start sub_809B248
sub_809B248: @ 0x0809B248
	push {r4, r5, lr}
	adds r5, r0, #0
	movs r1, #3
	bl __modsi3
	cmp r0, #0
	bne _0809B26C
	ldr r4, _0809B268 @ =gUnk_08D8D84C
	adds r0, r5, #0
	movs r1, #3
	bl __divsi3
	lsls r0, r0, #4
	adds r4, #4
	b _0809B292
	.align 2, 0
_0809B268: .4byte gUnk_08D8D84C
_0809B26C:
	cmp r0, #1
	beq _0809B284
	ldr r4, _0809B280 @ =gUnk_08D8D84C
	adds r0, r5, #0
	movs r1, #3
	bl __divsi3
	lsls r0, r0, #4
	adds r4, #0xc
	b _0809B292
	.align 2, 0
_0809B280: .4byte gUnk_08D8D84C
_0809B284:
	ldr r4, _0809B29C @ =gUnk_08D8D84C
	adds r0, r5, #0
	movs r1, #3
	bl __divsi3
	lsls r0, r0, #4
	adds r4, #8
_0809B292:
	adds r0, r0, r4
	ldr r0, [r0]
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_0809B29C: .4byte gUnk_08D8D84C

	thumb_func_start sub_809B2A0
sub_809B2A0: @ 0x0809B2A0
	push {r4, lr}
	ldr r4, _0809B2B8 @ =gUnk_08D8D84C
	movs r1, #3
	bl __divsi3
	lsls r0, r0, #4
	adds r0, r0, r4
	ldr r0, [r0]
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0809B2B8: .4byte gUnk_08D8D84C

	thumb_func_start sub_809B2BC
sub_809B2BC: @ 0x0809B2BC
	push {r4, r5, r6, lr}
	sub sp, #4
	ldr r2, [r0, #0x30]
	movs r3, #0x8f
	lsls r3, r3, #6
	movs r0, #0x90
	movs r1, #3
	bl sub_8090148
	movs r6, #0x9c
	lsls r6, r6, #5
	movs r5, #0x94
	movs r4, #2
_0809B2D6:
	str r6, [sp]
	movs r0, #4
	adds r1, r5, #0
	movs r2, #0x12
	ldr r3, _0809B2F8 @ =Sprite_32x16
	bl PutSpriteExt
	adds r6, #4
	adds r5, #0x20
	subs r4, #1
	cmp r4, #0
	bge _0809B2D6
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0809B2F8: .4byte Sprite_32x16

	thumb_func_start sub_809B2FC
sub_809B2FC: @ 0x0809B2FC
	push {r4, r5, r6, lr}
	sub sp, #0x20
	adds r5, r0, #0
	adds r4, r1, #0
	ldr r0, _0809B374 @ =gPlaySt
	ldrb r0, [r0, #0xe]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl GetChapterInfo
	adds r0, #0x8a
	ldrh r0, [r0]
	bl DecodeMsg
	adds r6, r0, #0
	ldr r0, _0809B378 @ =0x06010000
	adds r5, r5, r0
	mov r0, sp
	adds r1, r5, #0
	movs r2, #1
	bl InitSpriteTextFont
	ldr r0, _0809B37C @ =Pal_Text
	adds r4, #0x10
	lsls r4, r4, #5
	adds r1, r4, #0
	movs r2, #0x20
	bl ApplyPaletteExt
	add r4, sp, #0x18
	adds r0, r4, #0
	bl InitSpriteText
	mov r0, sp
	bl SetTextFont
	movs r0, #0
	bl SetTextFontGlyphs
	adds r0, r4, #0
	movs r1, #0
	bl SpriteText_DrawBackgroundExt
	movs r0, #0x60
	adds r1, r6, #0
	bl GetStringTextCenteredPos
	adds r1, r0, #0
	adds r0, r4, #0
	movs r2, #0
	adds r3, r6, #0
	bl Text_InsertDrawString
	movs r0, #0
	bl SetTextFont
	add sp, #0x20
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0809B374: .4byte gPlaySt
_0809B378: .4byte 0x06010000
_0809B37C: .4byte Pal_Text

	thumb_func_start sub_809B380
sub_809B380: @ 0x0809B380
	push {r4, r5, r6, lr}
	sub sp, #8
	adds r5, r0, #0
	bl sub_8099C7C
	adds r6, r0, #0
	ldr r4, _0809B4B0 @ =gDispIo
	movs r0, #8
	rsbs r0, r0, #0
	ldrb r1, [r4]
	ands r0, r1
	strb r0, [r4]
	movs r0, #0
	bl InitBgs
	movs r0, #0
	bl GetBgTilemap
	movs r1, #0
	bl TmFill
	movs r0, #1
	bl GetBgTilemap
	movs r1, #0
	bl TmFill
	movs r0, #2
	bl GetBgTilemap
	movs r1, #0
	bl TmFill
	movs r1, #4
	rsbs r1, r1, #0
	adds r0, r1, #0
	ldrb r2, [r4, #0xc]
	ands r0, r2
	strb r0, [r4, #0xc]
	adds r0, r1, #0
	ldrb r2, [r4, #0x10]
	ands r0, r2
	movs r2, #2
	orrs r0, r2
	strb r0, [r4, #0x10]
	ldrb r0, [r4, #0x14]
	ands r1, r0
	strb r1, [r4, #0x14]
	movs r0, #3
	ldrb r1, [r4, #0x18]
	orrs r0, r1
	strb r0, [r4, #0x18]
	bl InitFaces
	bl ResetText
	bl InitIcons
	bl UnpackUiWindowFrameGraphics
	bl ApplySystemObjectsGraphics
	ldr r2, _0809B4B4 @ =0x0000FFFC
	movs r0, #0
	movs r1, #4
	bl SetBgOffset
	movs r0, #1
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	movs r0, #2
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	movs r0, #4
	bl ApplyIconPalettes
	bl sub_808ED8C
	movs r0, #7
	bl EnableBgSync
	adds r0, r5, #0
	bl StartGreenText
	ldr r0, _0809B4B8 @ =0x02012A90
	movs r1, #8
	bl InitText
	movs r1, #0xe0
	lsls r1, r1, #4
	movs r3, #0xc0
	lsls r3, r3, #4
	movs r0, #0
	str r0, [sp]
	str r5, [sp, #4]
	movs r0, #0xd
	movs r2, #0xf
	bl StartSysBrownBox
	movs r0, #0
	movs r1, #0x90
	movs r2, #0x10
	movs r3, #0
	bl EnableSysBrownBox
	movs r0, #0xe0
	lsls r0, r0, #7
	movs r1, #1
	bl sub_809B2FC
	ldr r4, _0809B4BC @ =gPlaySt
	movs r0, #0xe
	ldrsb r0, [r4, r0]
	bl GetChapterInfo
	movs r1, #0
	ldrb r2, [r4, #0x1b]
	cmp r2, #3
	bne _0809B478
	movs r1, #1
_0809B478:
	adds r0, #0x80
	adds r0, r0, r1
	ldrb r0, [r0]
	str r0, [r5, #0x30]
	movs r0, #0xf0
	lsls r0, r0, #7
	movs r1, #2
	bl sub_808EFBC
	ldr r0, _0809B4C0 @ =sub_809B2BC
	adds r1, r5, #0
	bl StartParallelWorker
	movs r0, #0x80
	lsls r0, r0, #2
	movs r1, #3
	movs r2, #1
	bl InitTalk
	ldrb r0, [r4, #0xe]
	cmp r0, #0x2e
	bne _0809B4C4
	adds r0, r5, #0
	movs r1, #3
	bl Proc_Goto
	b _0809B4F4
	.align 2, 0
_0809B4B0: .4byte gDispIo
_0809B4B4: .4byte 0x0000FFFC
_0809B4B8: .4byte 0x02012A90
_0809B4BC: .4byte gPlaySt
_0809B4C0: .4byte sub_809B2BC
_0809B4C4:
	cmp r6, #0x4b
	bne _0809B4D0
	movs r0, #0x99
	bl SetFlag
	b _0809B4F4
_0809B4D0:
	movs r0, #0x99
	bl CheckFlag
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0809B4F4
	movs r0, #0xe
	ldrsb r0, [r4, r0]
	cmp r0, #0x2a
	bgt _0809B4F4
	movs r6, #0x4b
	movs r0, #0x99
	bl ClearFlag
	adds r0, r5, #0
	movs r1, #4
	bl Proc_Goto
_0809B4F4:
	ldr r3, _0809B50C @ =0x00000202
	movs r0, #0
	str r0, [sp]
	adds r0, r6, #0
	movs r1, #0xd4
	movs r2, #0x52
	bl sub_8008DA8
	add sp, #8
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0809B50C: .4byte 0x00000202

	thumb_func_start sub_809B510
sub_809B510: @ 0x0809B510
	push {r4, lr}
	sub sp, #0x10
	adds r4, r0, #0
	bl sub_8099C28
	str r0, [r4, #0x2c]
	movs r3, #1
	rsbs r3, r3, #0
	str r0, [sp]
	ldr r0, _0809B54C @ =0x06011000
	str r0, [sp, #4]
	str r3, [sp, #8]
	movs r0, #0
	str r0, [sp, #0xc]
	movs r0, #0x16
	movs r1, #0x10
	adds r2, r3, #0
	bl sub_8088584
	bl sub_8087E90
	adds r1, r0, #0
	ldr r0, _0809B550 @ =0x0004004E
	orrs r0, r1
	bl sub_8087E2C
	add sp, #0x10
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0809B54C: .4byte 0x06011000
_0809B550: .4byte 0x0004004E

	thumb_func_start sub_809B554
sub_809B554: @ 0x0809B554
	push {r4, lr}
	sub sp, #0x10
	adds r4, r0, #0
	bl sub_8099BF8
	str r0, [r4, #0x2c]
	movs r3, #1
	rsbs r3, r3, #0
	str r0, [sp]
	ldr r0, _0809B590 @ =0x06011000
	str r0, [sp, #4]
	str r3, [sp, #8]
	str r4, [sp, #0xc]
	movs r0, #0x16
	movs r1, #0x10
	adds r2, r3, #0
	bl sub_8088584
	bl sub_8087E90
	adds r1, r0, #0
	ldr r0, _0809B594 @ =0x0004000A
	orrs r0, r1
	bl sub_8087E2C
	add sp, #0x10
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0809B590: .4byte 0x06011000
_0809B594: .4byte 0x0004000A

	thumb_func_start sub_809B598
sub_809B598: @ 0x0809B598
	push {lr}
	sub sp, #0x10
	adds r2, r0, #0
	ldr r1, _0809B5B0 @ =gPlaySt
	adds r1, #0x2b
	movs r0, #1
	ldrb r1, [r1]
	ands r0, r1
	cmp r0, #0
	beq _0809B5B8
	ldr r0, _0809B5B4 @ =0x00000FAD
	b _0809B5BA
	.align 2, 0
_0809B5B0: .4byte gPlaySt
_0809B5B4: .4byte 0x00000FAD
_0809B5B8:
	ldr r0, _0809B5EC @ =0x00000FAE
_0809B5BA:
	str r0, [r2, #0x2c]
	movs r3, #1
	rsbs r3, r3, #0
	ldr r0, [r2, #0x2c]
	str r0, [sp]
	ldr r0, _0809B5F0 @ =0x06011000
	str r0, [sp, #4]
	str r3, [sp, #8]
	str r2, [sp, #0xc]
	movs r0, #0x16
	movs r1, #0x10
	adds r2, r3, #0
	bl sub_8088584
	bl sub_8087E90
	adds r1, r0, #0
	ldr r0, _0809B5F4 @ =0x0004000A
	orrs r0, r1
	bl sub_8087E2C
	add sp, #0x10
	pop {r0}
	bx r0
	.align 2, 0
_0809B5EC: .4byte 0x00000FAE
_0809B5F0: .4byte 0x06011000
_0809B5F4: .4byte 0x0004000A

	thumb_func_start sub_809B5F8
sub_809B5F8: @ 0x0809B5F8
	push {lr}
	sub sp, #0x10
	adds r2, r0, #0
	ldr r1, _0809B610 @ =gPlaySt
	adds r1, #0x2b
	movs r0, #1
	ldrb r1, [r1]
	ands r0, r1
	cmp r0, #0
	beq _0809B618
	ldr r0, _0809B614 @ =0x00000FAF
	b _0809B61C
	.align 2, 0
_0809B610: .4byte gPlaySt
_0809B614: .4byte 0x00000FAF
_0809B618:
	movs r0, #0xfb
	lsls r0, r0, #4
_0809B61C:
	str r0, [r2, #0x2c]
	movs r3, #1
	rsbs r3, r3, #0
	ldr r0, [r2, #0x2c]
	str r0, [sp]
	ldr r0, _0809B64C @ =0x06011000
	str r0, [sp, #4]
	str r3, [sp, #8]
	str r2, [sp, #0xc]
	movs r0, #0x16
	movs r1, #0x10
	adds r2, r3, #0
	bl sub_8088584
	bl sub_8087E90
	adds r1, r0, #0
	ldr r0, _0809B650 @ =0x0006000A
	orrs r0, r1
	bl sub_8087E2C
	add sp, #0x10
	pop {r0}
	bx r0
	.align 2, 0
_0809B64C: .4byte 0x06011000
_0809B650: .4byte 0x0006000A

	thumb_func_start sub_809B654
sub_809B654: @ 0x0809B654
	push {lr}
	sub sp, #4
	ldr r3, _0809B670 @ =0x00000202
	movs r0, #0
	str r0, [sp]
	movs r0, #0x41
	movs r1, #0xd4
	movs r2, #0x52
	bl sub_8008DA8
	add sp, #4
	pop {r0}
	bx r0
	.align 2, 0
_0809B670: .4byte 0x00000202

	thumb_func_start sub_809B674
sub_809B674: @ 0x0809B674
	push {lr}
	sub sp, #0x10
	adds r2, r0, #0
	ldr r1, _0809B68C @ =gPlaySt
	adds r1, #0x2b
	movs r0, #1
	ldrb r1, [r1]
	ands r0, r1
	cmp r0, #0
	beq _0809B694
	ldr r0, _0809B690 @ =0x00000FB1
	b _0809B696
	.align 2, 0
_0809B68C: .4byte gPlaySt
_0809B690: .4byte 0x00000FB1
_0809B694:
	ldr r0, _0809B6C8 @ =0x00000FB2
_0809B696:
	str r0, [r2, #0x2c]
	movs r3, #1
	rsbs r3, r3, #0
	ldr r0, [r2, #0x2c]
	str r0, [sp]
	ldr r0, _0809B6CC @ =0x06011000
	str r0, [sp, #4]
	str r3, [sp, #8]
	str r2, [sp, #0xc]
	movs r0, #0x16
	movs r1, #0x10
	adds r2, r3, #0
	bl sub_8088584
	bl sub_8087E90
	adds r1, r0, #0
	ldr r0, _0809B6D0 @ =0x0004000A
	orrs r0, r1
	bl sub_8087E2C
	add sp, #0x10
	pop {r0}
	bx r0
	.align 2, 0
_0809B6C8: .4byte 0x00000FB2
_0809B6CC: .4byte 0x06011000
_0809B6D0: .4byte 0x0004000A

	thumb_func_start sub_809B6D4
sub_809B6D4: @ 0x0809B6D4
	push {r4, lr}
	adds r4, r0, #0
	bl EndCgText
	adds r0, r4, #0
	bl EndAllProcChildren
	bl EndMuralBackground_
	movs r0, #0
	bl EndFaceById
	movs r0, #0
	bl SetOnHBlankA
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_809B6F8
sub_809B6F8: @ 0x0809B6F8
	push {r4, lr}
	sub sp, #0x10
	adds r4, r0, #0
	bl sub_8099C44
	str r0, [r4, #0x2c]
	movs r3, #1
	rsbs r3, r3, #0
	str r0, [sp]
	ldr r0, _0809B734 @ =0x06011000
	str r0, [sp, #4]
	str r3, [sp, #8]
	movs r0, #0
	str r0, [sp, #0xc]
	movs r0, #0x16
	movs r1, #0x10
	adds r2, r3, #0
	bl sub_8088584
	bl sub_8087E90
	adds r1, r0, #0
	ldr r0, _0809B738 @ =0x0004004E
	orrs r0, r1
	bl sub_8087E2C
	add sp, #0x10
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0809B734: .4byte 0x06011000
_0809B738: .4byte 0x0004004E

	thumb_func_start sub_809B73C
sub_809B73C: @ 0x0809B73C
	push {r4, r5, lr}
	adds r5, r0, #0
	bl GetTalkChoiceResult
	cmp r0, #1
	bne _0809B78A
	bl sub_8099C60
	adds r4, r0, #0
	bl GetGold
	cmp r0, r4
	blt _0809B780
	cmp r4, #0
	ble _0809B772
	rsbs r0, r4, #0
	bl AddGold
	ldr r0, _0809B77C @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0809B772
	movs r0, #0xb9
	bl m4aSongNumStart
_0809B772:
	adds r0, r5, #0
	movs r1, #0
	bl Proc_Goto
	b _0809B792
	.align 2, 0
_0809B77C: .4byte gPlaySt
_0809B780:
	adds r0, r5, #0
	movs r1, #2
	bl Proc_Goto
	b _0809B792
_0809B78A:
	adds r0, r5, #0
	movs r1, #1
	bl Proc_Goto
_0809B792:
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start sub_809B798
sub_809B798: @ 0x0809B798
	push {r4, lr}
	adds r4, r0, #0
	bl GetTalkChoiceResult
	cmp r0, #1
	bne _0809B7AE
	adds r0, r4, #0
	movs r1, #0
	bl Proc_Goto
	b _0809B7B6
_0809B7AE:
	adds r0, r4, #0
	movs r1, #1
	bl Proc_Goto
_0809B7B6:
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_809B7BC
sub_809B7BC: @ 0x0809B7BC
	push {r4, lr}
	sub sp, #0x10
	adds r4, r0, #0
	bl sub_8099CDC
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0809B7D4
	ldr r0, _0809B7D0 @ =0x00000F61
	b _0809B7D6
	.align 2, 0
_0809B7D0: .4byte 0x00000F61
_0809B7D4:
	ldr r0, _0809B80C @ =0x00000F5F
_0809B7D6:
	str r0, [r4, #0x2c]
	movs r3, #1
	rsbs r3, r3, #0
	ldr r0, [r4, #0x2c]
	str r0, [sp]
	ldr r0, _0809B810 @ =0x06011000
	str r0, [sp, #4]
	str r3, [sp, #8]
	movs r0, #0
	str r0, [sp, #0xc]
	movs r0, #0x16
	movs r1, #0x10
	adds r2, r3, #0
	bl sub_8088584
	bl sub_8087E90
	adds r1, r0, #0
	ldr r0, _0809B814 @ =0x0004004E
	orrs r0, r1
	bl sub_8087E2C
	add sp, #0x10
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0809B80C: .4byte 0x00000F5F
_0809B810: .4byte 0x06011000
_0809B814: .4byte 0x0004004E

	thumb_func_start sub_809B818
sub_809B818: @ 0x0809B818
	push {lr}
	sub sp, #0x10
	movs r1, #0xf6
	lsls r1, r1, #4
	str r1, [r0, #0x2c]
	movs r3, #1
	rsbs r3, r3, #0
	str r1, [sp]
	ldr r0, _0809B850 @ =0x06011000
	str r0, [sp, #4]
	str r3, [sp, #8]
	movs r0, #0
	str r0, [sp, #0xc]
	movs r0, #0x16
	movs r1, #0x10
	adds r2, r3, #0
	bl sub_8088584
	bl sub_8087E90
	adds r1, r0, #0
	ldr r0, _0809B854 @ =0x0004004E
	orrs r0, r1
	bl sub_8087E2C
	add sp, #0x10
	pop {r0}
	bx r0
	.align 2, 0
_0809B850: .4byte 0x06011000
_0809B854: .4byte 0x0004004E

	thumb_func_start sub_809B858
sub_809B858: @ 0x0809B858
	push {lr}
	sub sp, #4
	movs r2, #0x80
	lsls r2, r2, #1
	movs r0, #0
	str r0, [sp]
	movs r0, #0x5e
	adds r1, r2, #0
	movs r3, #0x20
	bl CallSomeSoundMaybe
	add sp, #4
	pop {r0}
	bx r0

	thumb_func_start sub_809B874
sub_809B874: @ 0x0809B874
	push {lr}
	sub sp, #4
	movs r2, #0x80
	lsls r2, r2, #1
	movs r0, #0
	str r0, [sp]
	movs r0, #0x49
	adds r1, r2, #0
	movs r3, #0x20
	bl CallSomeSoundMaybe
	add sp, #4
	pop {r0}
	bx r0

	thumb_func_start sub_809B890
sub_809B890: @ 0x0809B890
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r3, _0809B8C8 @ =gPal + 0x142
	ldr r5, _0809B8CC @ =gPlaySt
	adds r1, r4, #0
	adds r1, #0x2c
	movs r2, #0xe
_0809B89E:
	ldrh r0, [r3]
	strh r0, [r1]
	adds r3, #2
	adds r1, #2
	subs r2, #1
	cmp r2, #0
	bge _0809B89E
	adds r0, r5, #0
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0809B8BE
	movs r0, #0xee
	bl m4aSongNumStart
_0809B8BE:
	movs r0, #0
	strh r0, [r4, #0x2a]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0809B8C8: .4byte gPal + 0x142
_0809B8CC: .4byte gPlaySt

	thumb_func_start sub_809B8D0
sub_809B8D0: @ 0x0809B8D0
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	adds r6, r0, #0
	ldr r0, _0809B964 @ =gPal + 0x142
	mov ip, r0
	ldrh r0, [r6, #0x2a]
	adds r0, #1
	strh r0, [r6, #0x2a]
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x11
	movs r5, #0
	movs r7, #0x1f
	movs r0, #0xf8
	lsls r0, r0, #2
	mov sb, r0
	movs r0, #0xf8
	lsls r0, r0, #7
	mov r8, r0
_0809B8F8:
	lsls r1, r5, #1
	adds r0, r6, #0
	adds r0, #0x2c
	adds r0, r0, r1
	ldrh r1, [r0]
	movs r0, #0x1f
	ands r0, r1
	adds r3, r0, r4
	mov r0, sb
	ands r0, r1
	lsrs r0, r0, #5
	adds r2, r0, r4
	mov r0, r8
	ands r0, r1
	lsrs r0, r0, #0xa
	adds r0, r0, r4
	cmp r3, #0x1f
	ble _0809B91E
	movs r3, #0x1f
_0809B91E:
	cmp r2, #0x1f
	ble _0809B924
	movs r2, #0x1f
_0809B924:
	cmp r0, #0x1f
	ble _0809B92A
	movs r0, #0x1f
_0809B92A:
	ands r3, r7
	ands r2, r7
	lsls r1, r2, #5
	adds r1, r3, r1
	ands r0, r7
	lsls r0, r0, #0xa
	adds r1, r1, r0
	mov r0, ip
	strh r1, [r0]
	movs r0, #2
	add ip, r0
	adds r5, #1
	cmp r5, #0xe
	ble _0809B8F8
	bl EnablePalSync
	ldrh r0, [r6, #0x2a]
	cmp r0, #0x10
	bne _0809B956
	adds r0, r6, #0
	bl Proc_Break
_0809B956:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0809B964: .4byte gPal + 0x142

	thumb_func_start sub_809B968
sub_809B968: @ 0x0809B968
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	adds r6, r0, #0
	ldr r0, _0809B9FC @ =gPal + 0x142
	mov ip, r0
	ldrh r0, [r6, #0x2a]
	subs r0, #1
	strh r0, [r6, #0x2a]
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x11
	movs r5, #0
	movs r7, #0x1f
	movs r0, #0xf8
	lsls r0, r0, #2
	mov sb, r0
	movs r0, #0xf8
	lsls r0, r0, #7
	mov r8, r0
_0809B990:
	lsls r1, r5, #1
	adds r0, r6, #0
	adds r0, #0x2c
	adds r0, r0, r1
	ldrh r1, [r0]
	movs r0, #0x1f
	ands r0, r1
	adds r3, r0, r4
	mov r0, sb
	ands r0, r1
	lsrs r0, r0, #5
	adds r2, r0, r4
	mov r0, r8
	ands r0, r1
	lsrs r0, r0, #0xa
	adds r0, r0, r4
	cmp r3, #0x1f
	ble _0809B9B6
	movs r3, #0x1f
_0809B9B6:
	cmp r2, #0x1f
	ble _0809B9BC
	movs r2, #0x1f
_0809B9BC:
	cmp r0, #0x1f
	ble _0809B9C2
	movs r0, #0x1f
_0809B9C2:
	ands r3, r7
	ands r2, r7
	lsls r1, r2, #5
	adds r1, r3, r1
	ands r0, r7
	lsls r0, r0, #0xa
	adds r1, r1, r0
	mov r0, ip
	strh r1, [r0]
	movs r0, #2
	add ip, r0
	adds r5, #1
	cmp r5, #0xe
	ble _0809B990
	bl EnablePalSync
	ldrh r0, [r6, #0x2a]
	cmp r0, #0
	bne _0809B9EE
	adds r0, r6, #0
	bl Proc_Break
_0809B9EE:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0809B9FC: .4byte gPal + 0x142

	thumb_func_start sub_809BA00
sub_809BA00: @ 0x0809BA00
	push {lr}
	adds r1, r0, #0
	ldr r0, _0809BA10 @ =gUnk_08D8DCD4
	bl Proc_StartBlocking
	pop {r0}
	bx r0
	.align 2, 0
_0809BA10: .4byte gUnk_08D8DCD4

	thumb_func_start sub_809BA14
sub_809BA14: @ 0x0809BA14
	ldr r0, _0809BA1C @ =0x02012BF8
	ldr r0, [r0]
	bx lr
	.align 2, 0
_0809BA1C: .4byte 0x02012BF8

	thumb_func_start sub_809BA20
sub_809BA20: @ 0x0809BA20
	adds r1, r0, #0
	ldr r0, _0809BA30 @ =0x02012BF8
	ldr r0, [r0]
	subs r0, #1
	cmp r1, r0
	bge _0809BA34
	adds r0, r1, #1
	b _0809BA36
	.align 2, 0
_0809BA30: .4byte 0x02012BF8
_0809BA34:
	movs r0, #0
_0809BA36:
	bx lr

	thumb_func_start sub_809BA38
sub_809BA38: @ 0x0809BA38
	cmp r0, #0
	bne _0809BA40
	ldr r0, _0809BA44 @ =0x02012BF8
	ldr r0, [r0]
_0809BA40:
	subs r0, #1
	bx lr
	.align 2, 0
_0809BA44: .4byte 0x02012BF8

	thumb_func_start sub_809BA48
sub_809BA48: @ 0x0809BA48
	ldr r2, _0809BA5C @ =gUnk_08D8DD0C
	ldr r3, [r2]
	lsls r2, r0, #1
	adds r2, r2, r0
	lsls r2, r2, #3
	adds r2, r2, r3
	adds r2, #2
	adds r2, r2, r1
	ldrb r0, [r2]
	bx lr
	.align 2, 0
_0809BA5C: .4byte gUnk_08D8DD0C

	thumb_func_start sub_809BA60
sub_809BA60: @ 0x0809BA60
	ldr r2, _0809BA74 @ =gUnk_08D8DD0C
	ldr r3, [r2]
	lsls r2, r0, #1
	adds r2, r2, r0
	lsls r2, r2, #3
	adds r2, r2, r3
	adds r2, #9
	adds r2, r2, r1
	ldrb r0, [r2]
	bx lr
	.align 2, 0
_0809BA74: .4byte gUnk_08D8DD0C

	thumb_func_start sub_809BA78
sub_809BA78: @ 0x0809BA78
	ldr r2, _0809BA90 @ =gUnk_08D8DD0C
	ldr r3, [r2]
	lsls r2, r0, #1
	adds r2, r2, r0
	lsls r2, r2, #3
	adds r2, r2, r3
	adds r2, #0x10
	adds r2, r2, r1
	movs r0, #0
	ldrsb r0, [r2, r0]
	bx lr
	.align 2, 0
_0809BA90: .4byte gUnk_08D8DD0C

	thumb_func_start sub_809BA94
sub_809BA94: @ 0x0809BA94
	push {r4, r5, lr}
	adds r5, r1, #0
	ldr r4, _0809BAB4 @ =gCharacterData
	bl sub_809BAB8
	subs r0, #1
	movs r1, #0x34
	muls r0, r1, r0
	adds r4, #0x2c
	adds r0, r0, r4
	ldr r0, [r0]
	adds r0, r0, r5
	ldrb r0, [r0]
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_0809BAB4: .4byte gCharacterData

	thumb_func_start sub_809BAB8
sub_809BAB8: @ 0x0809BAB8
	ldr r1, _0809BAC8 @ =gUnk_08D8DD0C
	ldr r2, [r1]
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #3
	adds r1, r1, r2
	ldrb r0, [r1]
	bx lr
	.align 2, 0
_0809BAC8: .4byte gUnk_08D8DD0C

	thumb_func_start sub_809BACC
sub_809BACC: @ 0x0809BACC
	ldr r1, _0809BADC @ =gUnk_08D8DD0C
	ldr r2, [r1]
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #3
	adds r1, r1, r2
	ldrb r0, [r1, #1]
	bx lr
	.align 2, 0
_0809BADC: .4byte gUnk_08D8DD0C

	thumb_func_start sub_809BAE0
sub_809BAE0: @ 0x0809BAE0
	push {r4, r5, lr}
	adds r5, r0, #0
	movs r4, #1
_0809BAE6:
	adds r0, r4, #0
	bl GetUnit
	adds r2, r0, #0
	cmp r2, #0
	beq _0809BB14
	ldr r3, [r2]
	cmp r3, #0
	beq _0809BB14
	ldr r0, [r2, #0xc]
	ldr r1, _0809BB10 @ =0x00010004
	ands r0, r1
	cmp r0, #0
	bne _0809BB14
	ldrb r0, [r3, #4]
	cmp r0, r5
	bne _0809BB14
	ldr r0, [r2, #4]
	ldrb r0, [r0, #4]
	b _0809BB26
	.align 2, 0
_0809BB10: .4byte 0x00010004
_0809BB14:
	adds r4, #1
	cmp r4, #0x3f
	ble _0809BAE6
	ldr r2, _0809BB2C @ =gCharacterData
	subs r1, r5, #1
	movs r0, #0x34
	muls r0, r1, r0
	adds r0, r0, r2
	ldrb r0, [r0, #5]
_0809BB26:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_0809BB2C: .4byte gCharacterData

	thumb_func_start sub_809BB30
sub_809BB30: @ 0x0809BB30
	adds r2, r0, #0
	ldr r1, _0809BB38 @ =gUnk_08D67934
	b _0809BB4E
	.align 2, 0
_0809BB38: .4byte gUnk_08D67934
_0809BB3C:
	ldrb r0, [r1]
	cmp r0, r2
	beq _0809BB48
	ldrb r0, [r1, #1]
	cmp r0, r2
	bne _0809BB4C
_0809BB48:
	movs r0, #1
	b _0809BB56
_0809BB4C:
	adds r1, #0x14
_0809BB4E:
	ldrb r0, [r1]
	cmp r0, #0
	bne _0809BB3C
	movs r0, #0
_0809BB56:
	bx lr

	thumb_func_start sub_809BB58
sub_809BB58: @ 0x0809BB58
	push {r4, r5, r6, lr}
	ldr r6, _0809BB60 @ =gUnk_08D67934
	b _0809BB8C
	.align 2, 0
_0809BB60: .4byte gUnk_08D67934
_0809BB64:
	ldrb r0, [r6]
	movs r1, #0
	bl sub_809F908
	ldrb r0, [r6, #1]
	movs r1, #0
	bl sub_809F908
	ldrb r4, [r6]
	ldrb r5, [r6, #1]
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_809F5FC
	adds r2, r0, #0
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_809F88C
	adds r6, #0x14
_0809BB8C:
	ldrb r0, [r6]
	cmp r0, #0
	bne _0809BB64
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	thumb_func_start sub_809BB98
sub_809BB98: @ 0x0809BB98
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x90
	adds r4, r0, #0
	mov r1, sp
	movs r0, #0
	strh r0, [r1]
	ldr r7, _0809BD18 @ =gUnk_08D8DD0C
	ldr r1, [r7]
	ldr r2, _0809BD1C @ =0x01000600
	mov r0, sp
	bl CpuSet
	ldr r5, _0809BD20 @ =0x02012BF8
	movs r1, #0
	str r1, [r5]
	adds r4, #0x42
	movs r0, #0
	ldrsb r0, [r4, r0]
	cmp r0, #0
	bne _0809BBCA
	b _0809BD30
_0809BBCA:
	add r0, sp, #0x24
	strh r1, [r0]
	add r1, sp, #4
	ldr r2, _0809BD24 @ =0x01000010
	bl CpuSet
	movs r4, #1
_0809BBD8:
	adds r0, r4, #0
	bl GetUnit
	cmp r0, #0
	beq _0809BC08
	ldr r2, [r0]
	cmp r2, #0
	beq _0809BC08
	ldr r0, [r0, #0xc]
	ldr r1, _0809BD28 @ =0x00010004
	ands r0, r1
	cmp r0, #0
	bne _0809BC08
	ldrb r1, [r2, #4]
	lsrs r2, r1, #5
	lsls r2, r2, #2
	add r2, sp
	movs r0, #0x1f
	ands r0, r1
	movs r1, #1
	lsls r1, r0
	ldr r0, [r2, #4]
	orrs r0, r1
	str r0, [r2, #4]
_0809BC08:
	adds r4, #1
	cmp r4, #0x3f
	ble _0809BBD8
	movs r4, #1
	ldr r0, _0809BD20 @ =0x02012BF8
	mov sl, r0
_0809BC14:
	adds r0, r4, #0
	bl GetUnit
	adds r5, r0, #0
	adds r4, #1
	str r4, [sp, #0x8c]
	cmp r5, #0
	beq _0809BD0E
	ldr r2, [r5]
	cmp r2, #0
	beq _0809BD0E
	ldr r0, [r5, #0xc]
	ldr r1, _0809BD28 @ =0x00010004
	ands r0, r1
	cmp r0, #0
	bne _0809BD0E
	ldrb r0, [r2, #4]
	bl sub_809CEA8
	cmp r0, #0
	beq _0809BD0E
	mov r0, sl
	ldr r1, [r0]
	ldr r0, _0809BD18 @ =gUnk_08D8DD0C
	ldr r2, [r0]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r0, r0, r2
	ldr r1, [r5]
	ldrb r1, [r1, #4]
	strb r1, [r0]
	mov r0, sl
	ldr r1, [r0]
	ldr r0, _0809BD18 @ =gUnk_08D8DD0C
	ldr r2, [r0]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r0, r0, r2
	ldr r1, [r5, #4]
	ldrb r1, [r1, #4]
	strb r1, [r0, #1]
	movs r6, #0
	ldr r0, [r5]
	ldrb r1, [r0, #4]
	subs r1, #1
	movs r0, #0x34
	muls r0, r1, r0
	ldr r1, _0809BD2C @ =0x08C4C184
	adds r0, r0, r1
	ldr r0, [r0]
	ldrb r0, [r0, #0x15]
	cmp r6, r0
	bge _0809BD06
	ldr r7, _0809BD20 @ =0x02012BF8
	ldr r0, _0809BD18 @ =gUnk_08D8DD0C
	mov r8, r0
_0809BC88:
	ldr r0, [r7]
	adds r1, r6, #0
	bl sub_809BA94
	adds r4, r0, #0
	adds r0, r5, #0
	adds r1, r6, #0
	bl GetUnitSupportLevel
	ldr r2, [r7]
	mov r1, r8
	ldr r3, [r1]
	lsls r1, r2, #1
	adds r1, r1, r2
	lsls r1, r1, #3
	adds r1, r1, r3
	adds r1, #2
	adds r1, r1, r6
	strb r0, [r1]
	adds r0, r4, #0
	bl sub_809BAE0
	ldr r2, [r7]
	mov r1, r8
	ldr r3, [r1]
	lsls r1, r2, #1
	adds r1, r1, r2
	lsls r1, r1, #3
	adds r1, r1, r3
	adds r1, #9
	adds r1, r1, r6
	strb r0, [r1]
	ldr r0, [r7]
	mov r1, r8
	ldr r2, [r1]
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #3
	adds r1, r1, r2
	adds r1, #0x10
	add r1, sb
	asrs r0, r4, #5
	lsls r0, r0, #2
	add r0, sp
	movs r2, #0x1f
	ands r2, r4
	ldr r0, [r0, #4]
	lsrs r0, r2
	movs r2, #1
	ands r0, r2
	strb r0, [r1]
	adds r6, #1
	ldr r0, [r5]
	ldrb r1, [r0, #4]
	subs r1, #1
	movs r0, #0x34
	muls r0, r1, r0
	ldr r1, _0809BD2C @ =0x08C4C184
	adds r0, r0, r1
	ldr r0, [r0]
	ldrb r0, [r0, #0x15]
	cmp r6, r0
	blt _0809BC88
_0809BD06:
	mov r1, sl
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
_0809BD0E:
	ldr r4, [sp, #0x8c]
	cmp r4, #0x3f
	bgt _0809BD16
	b _0809BC14
_0809BD16:
	b _0809BE06
	.align 2, 0
_0809BD18: .4byte gUnk_08D8DD0C
_0809BD1C: .4byte 0x01000600
_0809BD20: .4byte 0x02012BF8
_0809BD24: .4byte 0x01000010
_0809BD28: .4byte 0x00010004
_0809BD2C: .4byte 0x08C4C184
_0809BD30:
	add r4, sp, #0x28
	adds r0, r4, #0
	bl ReadGlobalSaveInfo
	ldr r0, _0809BDA8 @ =0x00000569
	bl DecodeMsg
	bl SetTacticianName
	movs r6, #0
	add r0, sp, #0x28
	mov sl, r0
	ldr r1, _0809BDAC @ =gCharacterData
	mov r8, r1
_0809BD4C:
	adds r0, r6, #0
	mov r1, sl
	bl sub_809F950
	lsls r0, r0, #0x18
	adds r4, r6, #1
	cmp r0, #0
	beq _0809BE00
	adds r0, r6, #0
	bl sub_809CEA8
	cmp r0, #0
	beq _0809BE00
	ldr r1, [r5]
	ldr r2, [r7]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r0, r0, r2
	strb r6, [r0]
	ldr r0, [r5]
	ldr r2, [r7]
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #3
	adds r1, r1, r2
	subs r2, r6, #1
	movs r0, #0x34
	muls r0, r2, r0
	add r0, r8
	ldrb r0, [r0, #5]
	strb r0, [r1, #1]
	ldr r1, [r5]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #3
	ldr r1, [r7]
	adds r1, r1, r0
	adds r1, #2
	adds r0, r6, #0
	mov r2, sl
	bl sub_809F770
	movs r0, #0
	mov sb, r0
	b _0809BDF0
	.align 2, 0
_0809BDA8: .4byte 0x00000569
_0809BDAC: .4byte gCharacterData
_0809BDB0:
	ldr r0, [r5]
	mov r1, sb
	bl sub_809BA94
	ldr r1, [r5]
	ldr r3, [r7]
	lsls r2, r1, #1
	adds r2, r2, r1
	lsls r2, r2, #3
	adds r2, r2, r3
	adds r2, #9
	add r2, sb
	subs r3, r0, #1
	movs r1, #0x34
	muls r1, r3, r1
	add r1, r8
	ldrb r1, [r1, #5]
	strb r1, [r2]
	add r1, sp, #0x28
	bl sub_809F950
	ldr r2, [r5]
	ldr r3, [r7]
	lsls r1, r2, #1
	adds r1, r1, r2
	lsls r1, r1, #3
	adds r1, r1, r3
	adds r1, #0x10
	add r1, sb
	strb r0, [r1]
	movs r1, #1
	add sb, r1
_0809BDF0:
	adds r0, r6, #0
	bl sub_809CEA8
	cmp sb, r0
	blt _0809BDB0
	ldr r0, [r5]
	adds r0, #1
	str r0, [r5]
_0809BE00:
	adds r6, r4, #0
	cmp r6, #0xff
	ble _0809BD4C
_0809BE06:
	add sp, #0x90
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_809BE18
sub_809BE18: @ 0x0809BE18
	push {r4, r5, lr}
	adds r0, #0x42
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _0809BE4C
	movs r4, #1
_0809BE28:
	adds r0, r4, #0
	bl GetUnit
	adds r1, r0, #0
	cmp r1, #0
	beq _0809BE44
	ldr r0, [r1]
	cmp r0, #0
	beq _0809BE44
	adds r0, r1, #0
	bl GetUnitSMSId
	bl sub_8025278
_0809BE44:
	adds r4, #1
	cmp r4, #0x3f
	ble _0809BE28
	b _0809BE74
_0809BE4C:
	movs r4, #0
	ldr r0, _0809BE80 @ =0x02012BF8
	ldr r0, [r0]
	cmp r4, r0
	bge _0809BE74
	movs r5, #0
_0809BE58:
	ldr r0, _0809BE84 @ =gUnk_08D8DD0C
	ldr r0, [r0]
	adds r0, r5, r0
	ldrb r0, [r0, #1]
	bl GetClassSMSId
	bl sub_8025278
	adds r5, #0x18
	adds r4, #1
	ldr r0, _0809BE80 @ =0x02012BF8
	ldr r0, [r0]
	cmp r4, r0
	blt _0809BE58
_0809BE74:
	bl ForceSyncUnitSpriteSheet
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0809BE80: .4byte 0x02012BF8
_0809BE84: .4byte gUnk_08D8DD0C

	thumb_func_start sub_809BE88
sub_809BE88: @ 0x0809BE88
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	movs r6, #0
	movs r4, #0
	ldr r7, _0809BE94 @ =0x08C4C184
	b _0809BEA4
	.align 2, 0
_0809BE94: .4byte 0x08C4C184
_0809BE98:
	adds r0, r5, #0
	adds r1, r4, #0
	bl sub_809BA48
	adds r6, r6, r0
	adds r4, #1
_0809BEA4:
	adds r0, r5, #0
	bl sub_809BAB8
	subs r0, #1
	movs r1, #0x34
	muls r0, r1, r0
	adds r0, r0, r7
	ldr r0, [r0]
	ldrb r0, [r0, #0x15]
	cmp r4, r0
	blt _0809BE98
	adds r0, r6, #0
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_809BEC4
sub_809BEC4: @ 0x0809BEC4
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	adds r6, r1, #0
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0809BEE0
	adds r0, r6, #0
	bl sub_809BE88
	cmp r0, #5
	beq _0809BF22
	b _0809BF28
_0809BEE0:
	movs r0, #0
	mov r8, r0
	adds r0, r6, #0
	bl sub_809BE88
	mov sb, r0
	adds r0, r6, #0
	bl sub_809BAB8
	bl sub_809CEA8
	adds r7, r0, #0
	movs r5, #0
	cmp r8, r7
	bge _0809BF1E
_0809BEFE:
	adds r0, r6, #0
	bl sub_809BAB8
	adds r4, r0, #0
	adds r0, r6, #0
	adds r1, r5, #0
	bl sub_809BA94
	adds r1, r0, #0
	adds r0, r4, #0
	bl sub_809F5FC
	add r8, r0
	adds r5, #1
	cmp r5, r7
	blt _0809BEFE
_0809BF1E:
	cmp r8, sb
	bne _0809BF26
_0809BF22:
	movs r0, #2
	b _0809BF32
_0809BF26:
	mov r0, sb
_0809BF28:
	cmp r0, #0
	beq _0809BF30
	movs r0, #1
	b _0809BF32
_0809BF30:
	movs r0, #0
_0809BF32:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_809BF40
sub_809BF40: @ 0x0809BF40
	push {r4, r5, lr}
	ldr r4, _0809BFA8 @ =0x02012A90
	bl sub_809F6CC
	adds r5, r0, #0
	adds r4, #8
	adds r0, r4, #0
	bl ClearText
	movs r2, #0
	cmp r5, #0x64
	bne _0809BF5A
	movs r2, #4
_0809BF5A:
	ldr r3, _0809BFAC @ =gUnk_0842D1FC
	adds r0, r4, #0
	movs r1, #0
	bl Text_InsertDrawString
	adds r0, r4, #0
	movs r1, #0x30
	bl Text_SetCursor
	movs r1, #2
	cmp r5, #0x64
	bne _0809BF74
	movs r1, #4
_0809BF74:
	adds r0, r4, #0
	bl Text_SetColor
	adds r0, r4, #0
	adds r1, r5, #0
	bl Text_DrawNumberOrBlank
	movs r2, #0
	cmp r5, #0x64
	bne _0809BF8A
	movs r2, #4
_0809BF8A:
	ldr r3, _0809BFB0 @ =gUnk_0842D204
	adds r0, r4, #0
	movs r1, #0x38
	bl Text_InsertDrawString
	ldr r1, _0809BFB4 @ =gBg0Tm + 0x4a8
	adds r0, r4, #0
	bl PutText
	movs r0, #1
	bl EnableBgSync
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0809BFA8: .4byte 0x02012A90
_0809BFAC: .4byte gUnk_0842D1FC
_0809BFB0: .4byte gUnk_0842D204
_0809BFB4: .4byte gBg0Tm + 0x4a8

	thumb_func_start sub_809BFB8
sub_809BFB8: @ 0x0809BFB8
	movs r1, #0
	str r1, [r0, #0x2c]
	adds r2, r0, #0
	adds r2, #0x40
	strb r1, [r2]
	str r1, [r0, #0x34]
	str r1, [r0, #0x38]
	subs r1, #1
	str r1, [r0, #0x3c]
	bx lr

	thumb_func_start sub_809BFCC
sub_809BFCC: @ 0x0809BFCC
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	mov r8, r0
	bl sub_809BA14
	adds r7, r0, #0
	movs r6, #0
	cmp r6, r7
	bge _0809C026
_0809BFE2:
	adds r0, r6, #0
	movs r1, #3
	bl __divsi3
	lsls r0, r0, #4
	mov r2, r8
	ldr r1, [r2, #0x34]
	subs r1, #0x4c
	subs r5, r0, r1
	adds r0, r6, #0
	movs r1, #3
	bl __modsi3
	lsls r0, r0, #6
	adds r4, r0, #0
	adds r4, #0x18
	adds r0, r5, #0
	subs r0, #0x4c
	cmp r0, #0x30
	bhi _0809C020
	adds r0, r6, #0
	bl sub_809BACC
	str r0, [sp]
	movs r0, #0
	adds r1, r4, #0
	adds r2, r5, #0
	movs r3, #0xc8
	lsls r3, r3, #8
	bl sub_8026628
_0809C020:
	adds r6, #1
	cmp r6, r7
	blt _0809BFE2
_0809C026:
	bl sub_80259A4
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_809C038
sub_809C038: @ 0x0809C038
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x3c]
	movs r1, #1
	rsbs r1, r1, #0
	cmp r0, r1
	beq _0809C0C0
	str r0, [r4, #0x38]
	str r1, [r4, #0x3c]
	movs r1, #3
	bl __divsi3
	adds r1, r0, #0
	ldr r0, [r4, #0x34]
	cmp r0, #0
	bge _0809C05A
	adds r0, #0xf
_0809C05A:
	asrs r0, r0, #4
	subs r0, r1, r0
	lsls r0, r0, #4
	adds r0, #0x4c
	cmp r0, #0x4c
	bgt _0809C074
	cmp r1, #0
	bne _0809C06E
	str r1, [r4, #0x34]
	b _0809C074
_0809C06E:
	subs r0, r1, #1
	lsls r0, r0, #4
	str r0, [r4, #0x34]
_0809C074:
	ldr r0, [r4, #0x38]
	movs r1, #3
	bl __divsi3
	adds r5, r0, #0
	ldr r0, [r4, #0x34]
	cmp r0, #0
	bge _0809C086
	adds r0, #0xf
_0809C086:
	asrs r0, r0, #4
	subs r0, r5, r0
	lsls r0, r0, #4
	adds r0, #0x4c
	cmp r0, #0x7b
	ble _0809C0C0
	bl sub_809BA14
	subs r0, #1
	movs r1, #3
	bl __divsi3
	cmp r5, r0
	bne _0809C0B2
	bl sub_809BA14
	subs r0, #1
	movs r1, #3
	bl __divsi3
	subs r0, #3
	b _0809C0BC
_0809C0B2:
	ldr r0, [r4, #0x38]
	movs r1, #3
	bl __divsi3
	subs r0, #2
_0809C0BC:
	lsls r0, r0, #4
	str r0, [r4, #0x34]
_0809C0C0:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_809C0C8
sub_809C0C8: @ 0x0809C0C8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	adds r7, r0, #0
	ldr r4, _0809C2F8 @ =gDispIo
	movs r0, #8
	rsbs r0, r0, #0
	ldrb r1, [r4]
	ands r0, r1
	strb r0, [r4]
	movs r0, #0
	bl InitBgs
	movs r0, #0
	bl GetBgTilemap
	movs r1, #0
	bl TmFill
	movs r0, #1
	bl GetBgTilemap
	movs r1, #0
	bl TmFill
	movs r0, #2
	bl GetBgTilemap
	movs r1, #0
	bl TmFill
	movs r1, #4
	rsbs r1, r1, #0
	adds r0, r1, #0
	ldrb r2, [r4, #0xc]
	ands r0, r2
	strb r0, [r4, #0xc]
	movs r2, #3
	ldrb r0, [r4, #0x10]
	orrs r0, r2
	strb r0, [r4, #0x10]
	ldrb r5, [r4, #0x14]
	ands r1, r5
	movs r0, #1
	orrs r1, r0
	strb r1, [r4, #0x14]
	ldrb r0, [r4, #0x18]
	orrs r2, r0
	strb r2, [r4, #0x18]
	bl InitFaces
	bl ResetText
	bl InitIcons
	bl UnpackUiWindowFrameGraphics
	bl ApplySystemObjectsGraphics
	movs r0, #0xe
	bl ApplyIconPalettes
	adds r0, r7, #0
	bl sub_809C038
	movs r0, #0
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	movs r0, #1
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	ldr r1, _0809C2FC @ =0x0000FFD8
	ldr r2, [r7, #0x34]
	subs r2, #0x4c
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	movs r0, #2
	bl SetBgOffset
	bl sub_808ED8C
	bl ApplyUnitSpritePalettes
	bl ResetUnitSprites
	adds r0, r7, #0
	bl sub_809BE18
	movs r0, #0xa0
	lsls r0, r0, #7
	movs r1, #5
	bl sub_809228C
	ldr r0, _0809C300 @ =gBg1Tm
	ldr r1, _0809C304 @ =gUnk_0842BF0C
	movs r2, #0xa5
	lsls r2, r2, #7
	bl TmApplyTsa_thm
	movs r0, #7
	bl EnableBgSync
	bl sub_809BA14
	cmp r0, #0
	beq _0809C1EE
	adds r0, r7, #0
	bl ResetSysHandCursor
	movs r0, #0xc0
	lsls r0, r0, #3
	movs r1, #1
	bl DisplaySysHandCursorTextShadow
	ldr r4, [r7, #0x38]
	adds r0, r4, #0
	movs r1, #3
	bl __modsi3
	lsls r0, r0, #6
	adds r5, r0, #0
	adds r5, #0x14
	adds r0, r4, #0
	movs r1, #3
	bl __divsi3
	ldr r1, [r7, #0x34]
	cmp r1, #0
	bge _0809C1DA
	adds r1, #0xf
_0809C1DA:
	asrs r1, r1, #4
	subs r1, r0, r1
	lsls r1, r1, #4
	adds r1, #0x4c
	movs r3, #0x80
	lsls r3, r3, #4
	adds r0, r5, #0
	movs r2, #7
	bl ShowSysHandCursor
_0809C1EE:
	ldr r1, _0809C2F8 @ =gDispIo
	mov ip, r1
	movs r6, #0x20
	ldrb r0, [r1, #1]
	orrs r0, r6
	movs r1, #0x41
	rsbs r1, r1, #0
	ands r0, r1
	movs r1, #0x7f
	ands r0, r1
	mov r2, ip
	strb r0, [r2, #1]
	mov r0, ip
	adds r0, #0x2d
	movs r5, #0
	mov r8, r5
	mov r1, r8
	strb r1, [r0]
	mov r1, ip
	adds r1, #0x31
	movs r0, #0x4c
	strb r0, [r1]
	subs r1, #5
	movs r0, #0xf0
	strb r0, [r1]
	adds r1, #4
	movs r0, #0x8c
	strb r0, [r1]
	movs r2, #0x34
	add r2, ip
	mov sb, r2
	movs r0, #1
	ldrb r1, [r2]
	orrs r1, r0
	movs r5, #2
	orrs r1, r5
	movs r2, #4
	orrs r1, r2
	movs r4, #8
	orrs r1, r4
	movs r3, #0x10
	orrs r1, r3
	movs r2, #0x36
	add r2, ip
	mov sl, r2
	ldrb r5, [r2]
	orrs r0, r5
	movs r2, #2
	orrs r0, r2
	subs r2, #7
	ands r0, r2
	orrs r0, r4
	orrs r0, r3
	orrs r1, r6
	mov r5, sb
	strb r1, [r5]
	orrs r0, r6
	mov r1, sl
	strb r0, [r1]
	mov r1, ip
	adds r1, #0x3c
	movs r0, #0xc0
	ldrb r2, [r1]
	orrs r0, r2
	strb r0, [r1]
	mov r0, ip
	adds r0, #0x44
	mov r5, r8
	strb r5, [r0]
	adds r0, #1
	strb r5, [r0]
	adds r1, #0xa
	movs r0, #0x10
	strb r0, [r1]
	ldr r0, _0809C308 @ =0x0000FFE0
	mov r1, ip
	ldrh r1, [r1, #0x3c]
	ands r0, r1
	movs r1, #0x1f
	orrs r0, r1
	mov r2, ip
	strh r0, [r2, #0x3c]
	adds r6, r7, #0
	adds r6, #0x42
	movs r5, #0x43
	adds r5, r5, r7
	mov r8, r5
	ldr r5, _0809C30C @ =0x020129A8
	movs r4, #0xe
_0809C2A0:
	adds r0, r5, #0
	movs r1, #5
	bl InitText
	adds r5, #8
	subs r4, #1
	cmp r4, #0
	bge _0809C2A0
	ldr r4, _0809C310 @ =0x02012A90
	adds r0, r4, #0
	movs r1, #4
	bl InitText
	adds r4, #8
	adds r0, r4, #0
	movs r1, #9
	bl InitText
	bl sub_809BF40
	movs r3, #0xa
	rsbs r3, r3, #0
	ldr r0, _0809C314 @ =0x00000901
	str r0, [sp]
	movs r0, #0
	movs r1, #0x41
	movs r2, #0x38
	bl StartBmFace
	movs r0, #0x28
	movs r1, #0
	movs r2, #1
	bl InitTalk
	ldr r0, _0809C318 @ =Img_SysBlackBox
	ldr r1, _0809C31C @ =0x06017800
	bl Decompress
	movs r0, #0
	ldrsb r0, [r6, r0]
	cmp r0, #0
	beq _0809C324
	ldr r0, _0809C320 @ =0x00000F4B
	b _0809C326
	.align 2, 0
_0809C2F8: .4byte gDispIo
_0809C2FC: .4byte 0x0000FFD8
_0809C300: .4byte gBg1Tm
_0809C304: .4byte gUnk_0842BF0C
_0809C308: .4byte 0x0000FFE0
_0809C30C: .4byte 0x020129A8
_0809C310: .4byte 0x02012A90
_0809C314: .4byte 0x00000901
_0809C318: .4byte Img_SysBlackBox
_0809C31C: .4byte 0x06017800
_0809C320: .4byte 0x00000F4B
_0809C324:
	ldr r0, _0809C378 @ =0x00000FB5
_0809C326:
	str r0, [r7, #0x30]
	ldr r0, _0809C37C @ =sub_809BFCC
	adds r1, r7, #0
	bl StartParallelWorker
	adds r0, r7, #0
	bl sub_8090DD0
	movs r0, #0x80
	lsls r0, r0, #2
	movs r1, #4
	bl sub_8090E38
	movs r0, #0xd8
	movs r1, #0x54
	bl sub_8090DE4
	ldrh r4, [r7, #0x34]
	bl sub_809BA14
	subs r0, #1
	movs r1, #3
	bl __divsi3
	adds r2, r0, #0
	adds r2, #1
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	movs r0, #6
	adds r1, r4, #0
	movs r3, #4
	bl sub_8090E04
	bl sub_8090DA0
	ldr r1, [r7, #0x34]
	cmp r1, #0
	bge _0809C374
	adds r1, #0xf
_0809C374:
	asrs r4, r1, #4
	b _0809C38A
	.align 2, 0
_0809C378: .4byte 0x00000FB5
_0809C37C: .4byte sub_809BFCC
_0809C380:
	adds r0, r7, #0
	adds r1, r4, #0
	bl sub_809C838
	adds r4, #1
_0809C38A:
	ldr r0, [r7, #0x34]
	cmp r0, #0
	bge _0809C392
	adds r0, #0xf
_0809C392:
	asrs r0, r0, #4
	adds r0, #4
	cmp r4, r0
	blt _0809C380
	adds r0, r7, #0
	bl StartGreenText
	movs r0, #0
	mov r1, r8
	strb r0, [r1]
	ldr r0, _0809C3E4 @ =0x06014800
	movs r1, #0xa
	bl LoadHelpBoxGfx
	ldr r2, _0809C3E8 @ =gDispIo
	movs r0, #1
	ldrb r5, [r2, #1]
	orrs r0, r5
	movs r1, #2
	orrs r0, r1
	movs r1, #4
	orrs r0, r1
	movs r1, #8
	orrs r0, r1
	movs r1, #0x10
	orrs r0, r1
	strb r0, [r2, #1]
	movs r0, #0x10
	movs r1, #0x8c
	adds r2, r7, #0
	bl StartHelpPromptSprite
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0809C3E4: .4byte 0x06014800
_0809C3E8: .4byte gDispIo

	thumb_func_start sub_809C3EC
sub_809C3EC: @ 0x0809C3EC
	push {r4, lr}
	adds r4, r0, #0
	bl EndCgText
	adds r0, r4, #0
	bl EndAllProcChildren
	bl EndMuralBackground_
	movs r0, #0
	bl EndFaceById
	movs r0, #0
	bl SetOnHBlankA
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_809C410
sub_809C410: @ 0x0809C410
	push {lr}
	sub sp, #0x10
	ldr r0, [r0, #0x30]
	str r0, [sp]
	ldr r0, _0809C440 @ =0x06013000
	str r0, [sp, #4]
	movs r0, #1
	rsbs r0, r0, #0
	str r0, [sp, #8]
	movs r0, #0
	str r0, [sp, #0xc]
	movs r0, #0xa
	movs r1, #7
	movs r2, #0x11
	movs r3, #4
	bl sub_8088584
	ldr r0, _0809C444 @ =0x000008FC
	bl sub_8087E2C
	add sp, #0x10
	pop {r0}
	bx r0
	.align 2, 0
_0809C440: .4byte 0x06013000
_0809C444: .4byte 0x000008FC

	thumb_func_start sub_809C448
sub_809C448: @ 0x0809C448
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	adds r6, r0, #0
	bl sub_809BA14
	cmp r0, #0
	bne _0809C45E
	b _0809C770
_0809C45E:
	adds r0, r6, #0
	adds r0, #0x40
	movs r4, #0
	ldrsb r4, [r0, r4]
	mov r8, r0
	cmp r4, #0
	beq _0809C46E
	b _0809C6FC
_0809C46E:
	ldr r0, [r6, #0x38]
	mov sl, r0
	ldr r3, _0809C4B8 @ =gpKeySt
	ldr r1, [r3]
	ldrh r5, [r1, #6]
	adds r2, r6, #0
	adds r2, #0x41
	movs r0, #4
	strb r0, [r2]
	movs r0, #0x80
	lsls r0, r0, #2
	ldrh r7, [r1, #4]
	ands r0, r7
	cmp r0, #0
	beq _0809C492
	ldrh r5, [r1, #4]
	movs r0, #8
	strb r0, [r2]
_0809C492:
	adds r0, r6, #0
	adds r0, #0x43
	movs r1, #0
	ldrsb r1, [r0, r1]
	mov sb, r0
	cmp r1, #0
	beq _0809C4BC
	ldr r1, [r3]
	movs r0, #2
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _0809C57C
	bl CloseHelpBox
	mov r0, sb
	strb r4, [r0]
	b _0809C798
	.align 2, 0
_0809C4B8: .4byte gpKeySt
_0809C4BC:
	ldr r0, [r3]
	ldrh r1, [r0, #8]
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0809C51C
	ldr r7, [r6, #0x38]
	adds r0, r7, #0
	movs r1, #3
	bl __modsi3
	lsls r0, r0, #6
	adds r0, #0x14
	mov r8, r0
	adds r0, r7, #0
	movs r1, #3
	bl __divsi3
	adds r1, r0, #0
	ldr r0, [r6, #0x34]
	cmp r0, #0
	bge _0809C4EC
	adds r0, #0xf
_0809C4EC:
	asrs r4, r0, #4
	subs r4, r1, r4
	lsls r4, r4, #4
	adds r4, #0x4c
	ldr r5, _0809C518 @ =gCharacterData
	adds r0, r7, #0
	bl sub_809BAB8
	subs r0, #1
	movs r1, #0x34
	muls r0, r1, r0
	adds r0, r0, r5
	ldrh r2, [r0, #2]
	mov r0, r8
	adds r1, r4, #0
	bl StartHelpBox
	movs r0, #1
	mov r1, sb
	strb r0, [r1]
	b _0809C798
	.align 2, 0
_0809C518: .4byte gCharacterData
_0809C51C:
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0809C54C
	adds r0, r6, #0
	movs r1, #2
	bl Proc_Goto
	ldr r0, _0809C544 @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	bge _0809C53A
	b _0809C798
_0809C53A:
	ldr r0, _0809C548 @ =0x0000038A
	bl m4aSongNumStart
	b _0809C798
	.align 2, 0
_0809C544: .4byte gPlaySt
_0809C548: .4byte 0x0000038A
_0809C54C:
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0809C57C
	adds r0, r6, #0
	movs r1, #3
	bl Proc_Goto
	ldr r0, _0809C574 @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	bge _0809C56A
	b _0809C798
_0809C56A:
	ldr r0, _0809C578 @ =0x0000038B
	bl m4aSongNumStart
	b _0809C798
	.align 2, 0
_0809C574: .4byte gPlaySt
_0809C578: .4byte 0x0000038B
_0809C57C:
	movs r0, #0x20
	ands r0, r5
	cmp r0, #0
	beq _0809C596
	ldr r4, [r6, #0x38]
	adds r0, r4, #0
	movs r1, #3
	bl __modsi3
	cmp r0, #0
	beq _0809C596
	subs r0, r4, #1
	str r0, [r6, #0x38]
_0809C596:
	movs r0, #0x10
	ands r0, r5
	cmp r0, #0
	beq _0809C5C2
	ldr r4, [r6, #0x38]
	adds r0, r4, #0
	movs r1, #3
	bl __modsi3
	cmp r0, #2
	beq _0809C5C2
	adds r0, r4, #1
	str r0, [r6, #0x38]
	bl sub_809BA14
	ldr r1, [r6, #0x38]
	cmp r1, r0
	blt _0809C5C2
	bl sub_809BA14
	subs r0, #1
	str r0, [r6, #0x38]
_0809C5C2:
	movs r0, #0x40
	ands r0, r5
	cmp r0, #0
	beq _0809C5D4
	ldr r0, [r6, #0x38]
	cmp r0, #2
	ble _0809C5D4
	subs r0, #3
	str r0, [r6, #0x38]
_0809C5D4:
	movs r0, #0x80
	ands r5, r0
	cmp r5, #0
	beq _0809C5EE
	ldr r4, [r6, #0x38]
	adds r4, #3
	bl sub_809BA14
	cmp r4, r0
	bge _0809C5EE
	ldr r0, [r6, #0x38]
	adds r0, #3
	str r0, [r6, #0x38]
_0809C5EE:
	ldr r0, [r6, #0x38]
	cmp sl, r0
	bne _0809C5F6
	b _0809C6F2
_0809C5F6:
	movs r1, #3
	bl __divsi3
	adds r1, r0, #0
	ldr r0, [r6, #0x34]
	cmp r0, #0
	bge _0809C606
	adds r0, #0xf
_0809C606:
	asrs r0, r0, #4
	subs r0, r1, r0
	lsls r4, r0, #4
	movs r0, #0
	mov r7, r8
	strb r0, [r7]
	ldr r0, _0809C648 @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0809C624
	ldr r0, _0809C64C @ =0x00000385
	bl m4aSongNumStart
_0809C624:
	cmp r4, #0xf
	bgt _0809C650
	ldr r1, [r6, #0x34]
	cmp r1, #0
	beq _0809C650
	cmp r1, #0
	bge _0809C634
	adds r1, #0xf
_0809C634:
	asrs r1, r1, #4
	subs r1, #1
	adds r0, r6, #0
	bl sub_809C838
	movs r0, #0xff
	mov r1, r8
	strb r0, [r1]
	b _0809C69C
	.align 2, 0
_0809C648: .4byte gPlaySt
_0809C64C: .4byte 0x00000385
_0809C650:
	cmp r4, #0x2f
	ble _0809C682
	bl sub_809BA14
	subs r0, #1
	movs r1, #3
	bl __divsi3
	subs r0, #3
	lsls r0, r0, #4
	ldr r1, [r6, #0x34]
	cmp r1, r0
	beq _0809C682
	cmp r1, #0
	bge _0809C670
	adds r1, #0xf
_0809C670:
	asrs r1, r1, #4
	adds r1, #4
	adds r0, r6, #0
	bl sub_809C838
	movs r0, #1
	mov r7, r8
	strb r0, [r7]
	b _0809C69C
_0809C682:
	ldr r0, [r6, #0x38]
	movs r1, #3
	bl __modsi3
	lsls r0, r0, #6
	adds r0, #0x14
	adds r1, r4, #0
	adds r1, #0x4c
	movs r3, #0x80
	lsls r3, r3, #4
	movs r2, #7
	bl ShowSysHandCursor
_0809C69C:
	mov r1, sb
	movs r0, #0
	ldrsb r0, [r1, r0]
	cmp r0, #0
	beq _0809C6F2
	ldr r7, [r6, #0x38]
	adds r0, r7, #0
	movs r1, #3
	bl __modsi3
	lsls r0, r0, #6
	adds r0, #0x14
	mov sb, r0
	adds r0, r7, #0
	movs r1, #3
	bl __divsi3
	ldr r4, [r6, #0x34]
	cmp r4, #0
	bge _0809C6C6
	adds r4, #0xf
_0809C6C6:
	asrs r4, r4, #4
	subs r4, r0, r4
	lsls r4, r4, #4
	mov r1, r8
	movs r0, #0
	ldrsb r0, [r1, r0]
	lsls r0, r0, #4
	subs r0, #0x4c
	subs r4, r4, r0
	ldr r5, _0809C768 @ =gCharacterData
	adds r0, r7, #0
	bl sub_809BAB8
	subs r0, #1
	movs r1, #0x34
	muls r0, r1, r0
	adds r0, r0, r5
	ldrh r2, [r0, #2]
	mov r0, sb
	adds r1, r4, #0
	bl StartHelpBox
_0809C6F2:
	mov r7, r8
	movs r0, #0
	ldrsb r0, [r7, r0]
	cmp r0, #0
	beq _0809C798
_0809C6FC:
	mov r2, r8
	movs r0, #0
	ldrsb r0, [r2, r0]
	cmp r0, #0
	bge _0809C712
	adds r1, r6, #0
	adds r1, #0x41
	ldr r0, [r6, #0x34]
	ldrb r1, [r1]
	subs r0, r0, r1
	str r0, [r6, #0x34]
_0809C712:
	movs r0, #0
	ldrsb r0, [r2, r0]
	cmp r0, #0
	ble _0809C726
	adds r1, r6, #0
	adds r1, #0x41
	ldr r0, [r6, #0x34]
	ldrb r1, [r1]
	adds r0, r1, r0
	str r0, [r6, #0x34]
_0809C726:
	ldr r1, [r6, #0x34]
	movs r0, #0xf
	ands r1, r0
	cmp r1, #0
	bne _0809C734
	mov r0, r8
	strb r1, [r0]
_0809C734:
	ldrh r4, [r6, #0x34]
	bl sub_809BA14
	subs r0, #1
	movs r1, #3
	bl __divsi3
	adds r2, r0, #0
	adds r2, #1
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	movs r0, #6
	adds r1, r4, #0
	movs r3, #4
	bl sub_8090E04
	ldr r1, _0809C76C @ =0x0000FFD8
	ldr r2, [r6, #0x34]
	subs r2, #0x4c
	movs r0, #0xff
	ands r2, r0
	movs r0, #2
	bl SetBgOffset
	b _0809C798
	.align 2, 0
_0809C768: .4byte gCharacterData
_0809C76C: .4byte 0x0000FFD8
_0809C770:
	ldr r0, _0809C7A8 @ =gpKeySt
	ldr r1, [r0]
	movs r0, #2
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _0809C798
	adds r0, r6, #0
	movs r1, #3
	bl Proc_Goto
	ldr r0, _0809C7AC @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0809C798
	ldr r0, _0809C7B0 @ =0x0000038B
	bl m4aSongNumStart
_0809C798:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0809C7A8: .4byte gpKeySt
_0809C7AC: .4byte gPlaySt
_0809C7B0: .4byte 0x0000038B

	thumb_func_start sub_809C7B4
sub_809C7B4: @ 0x0809C7B4
	push {lr}
	adds r2, r0, #0
	adds r0, #0x42
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	ldr r1, [r2, #0x38]
	bl sub_809E16C
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_809C7CC
sub_809C7CC: @ 0x0809C7CC
	push {lr}
	sub sp, #4
	adds r0, #0x42
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne _0809C7EE
	movs r1, #0x80
	lsls r1, r1, #1
	str r0, [sp]
	movs r0, #0x5a
	movs r2, #0xc0
	movs r3, #0x18
	bl CallSomeSoundMaybe
	b _0809C800
_0809C7EE:
	movs r2, #0x80
	lsls r2, r2, #1
	movs r0, #0
	str r0, [sp]
	movs r0, #0x49
	adds r1, r2, #0
	movs r3, #0x18
	bl CallSomeSoundMaybe
_0809C800:
	add sp, #4
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_809C808
sub_809C808: @ 0x0809C808
	push {lr}
	adds r1, r0, #0
	ldr r0, _0809C81C @ =gUnk_08D8DD68
	bl Proc_StartBlocking
	adds r0, #0x42
	movs r1, #1
	strb r1, [r0]
	pop {r0}
	bx r0
	.align 2, 0
_0809C81C: .4byte gUnk_08D8DD68

	thumb_func_start sub_809C820
sub_809C820: @ 0x0809C820
	push {lr}
	adds r1, r0, #0
	ldr r0, _0809C834 @ =gUnk_08D8DD68
	bl Proc_StartBlocking
	adds r0, #0x42
	movs r1, #0
	strb r1, [r0]
	pop {r0}
	bx r0
	.align 2, 0
_0809C834: .4byte gUnk_08D8DD68

	thumb_func_start sub_809C838
sub_809C838: @ 0x0809C838
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	str r0, [sp]
	mov sl, r1
	movs r0, #0
	bl SetTextFontGlyphs
	movs r0, #0
	bl SetTextFont
	mov r0, sl
	lsls r4, r0, #1
	add r4, sl
	adds r0, r4, #0
	movs r1, #0xf
	bl __modsi3
	lsls r0, r0, #3
	ldr r1, _0809C8AC @ =0x020129A8
	adds r5, r0, r1
	movs r7, #0
	adds r6, r4, #0
_0809C86C:
	adds r0, r5, #0
	bl ClearText
	bl sub_809BA14
	cmp r6, r0
	bge _0809C902
	adds r0, r7, #0
	movs r1, #3
	bl __modsi3
	lsls r0, r0, #3
	mov r8, r0
	mov r1, sl
	lsls r4, r1, #1
	movs r0, #0x1f
	ands r4, r0
	ldr r0, [sp]
	adds r0, #0x42
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r1, r6, #0
	bl sub_809BEC4
	cmp r0, #1
	beq _0809C8BA
	cmp r0, #1
	bgt _0809C8B0
	cmp r0, #0
	beq _0809C8B6
	b _0809C8C4
	.align 2, 0
_0809C8AC: .4byte 0x020129A8
_0809C8B0:
	cmp r0, #2
	beq _0809C8C0
	b _0809C8C4
_0809C8B6:
	movs r0, #1
	b _0809C8C2
_0809C8BA:
	movs r1, #0
	mov sb, r1
	b _0809C8C4
_0809C8C0:
	movs r0, #4
_0809C8C2:
	mov sb, r0
_0809C8C4:
	adds r0, r5, #0
	movs r1, #0
	bl Text_SetCursor
	adds r0, r5, #0
	mov r1, sb
	bl Text_SetColor
	adds r0, r6, #0
	bl sub_809BAB8
	subs r0, #1
	movs r1, #0x34
	muls r0, r1, r0
	ldr r1, _0809C924 @ =gCharacterData
	adds r0, r0, r1
	ldrh r0, [r0]
	bl DecodeMsg
	adds r1, r0, #0
	adds r0, r5, #0
	bl Text_DrawString
	lsls r1, r4, #5
	add r1, r8
	lsls r1, r1, #1
	ldr r0, _0809C928 @ =gBg2Tm
	adds r1, r1, r0
	adds r0, r5, #0
	bl PutText
_0809C902:
	adds r5, #8
	adds r6, #1
	adds r7, #1
	cmp r7, #2
	ble _0809C86C
	movs r0, #4
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
_0809C924: .4byte gCharacterData
_0809C928: .4byte gBg2Tm

	thumb_func_start sub_809C92C
sub_809C92C: @ 0x0809C92C
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0809C944 @ =gUnk_08D8DD68
	bl Proc_Find
	cmp r0, #0
	beq _0809C93C
	str r4, [r0, #0x3c]
_0809C93C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0809C944: .4byte gUnk_08D8DD68

	thumb_func_start sub_809C948
sub_809C948: @ 0x0809C948
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	adds r5, r0, #0
	adds r6, r1, #0
	mov r8, r2
	bl sub_809BAB8
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	adds r0, r5, #0
	adds r1, r6, #0
	bl sub_809BA94
	adds r2, r0, #0
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	movs r0, #0
	adds r1, r4, #0
	mov r3, r8
	bl sub_807931C
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r1}
	bx r1

	thumb_func_start sub_809C980
sub_809C980: @ 0x0809C980
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #4
	mov r8, r0
	ldr r2, [r0, #0x34]
	subs r1, r2, #1
	lsls r0, r1, #4
	subs r0, r0, r1
	lsrs r1, r0, #0x1f
	adds r0, r0, r1
	asrs r0, r0, #1
	movs r1, #0x7e
	subs r1, r1, r0
	movs r0, #0x54
	mov sb, r0
	movs r6, #0
	cmp r6, r2
	bge _0809C9DC
	ldr r7, _0809C9EC @ =gUnk_08D8DE48
	adds r5, r1, #2
	adds r4, r1, #0
_0809C9AE:
	ldr r0, _0809C9F0 @ =0x0000EF80
	str r0, [sp]
	movs r0, #4
	adds r1, r5, #0
	mov r2, sb
	adds r3, r7, #0
	bl PutSpriteExt
	ldr r0, _0809C9F4 @ =0x0000FF80
	str r0, [sp]
	movs r0, #4
	adds r1, r4, #0
	mov r2, sb
	adds r3, r7, #0
	bl PutSpriteExt
	adds r5, #0xf
	adds r4, #0xf
	adds r6, #1
	mov r1, r8
	ldr r0, [r1, #0x34]
	cmp r6, r0
	blt _0809C9AE
_0809C9DC:
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0809C9EC: .4byte gUnk_08D8DE48
_0809C9F0: .4byte 0x0000EF80
_0809C9F4: .4byte 0x0000FF80

	thumb_func_start sub_809C9F8
sub_809C9F8: @ 0x0809C9F8
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #8
	ldr r4, _0809CAE8 @ =0x020129A8
	ldr r0, _0809CAEC @ =gUnk_08190268
	movs r1, #0
	movs r2, #0x20
	bl ApplyPaletteExt
	adds r0, r4, #0
	subs r0, #0x18
	bl SetTextFont
	movs r0, #1
	bl SetTextFontGlyphs
	bl sub_802EBB0
	adds r1, r4, #0
	adds r4, #8
	ldr r7, _0809CAF0 @ =gBg2Tm + 0x120
	movs r6, #0
	str r6, [sp]
	str r0, [sp, #4]
	adds r0, r1, #0
	adds r1, r7, #0
	movs r2, #4
	movs r3, #0
	bl PutDrawText
	subs r0, r7, #4
	ldr r3, _0809CAF4 @ =Unk_081C8FCC
	ldr r5, _0809CAF8 @ =gPlaySt
	movs r1, #0x2b
	adds r1, r1, r5
	mov r8, r1
	ldrb r2, [r1]
	lsls r1, r2, #0x1c
	lsrs r1, r1, #0x1d
	lsls r1, r1, #2
	lsrs r2, r2, #4
	lsls r2, r2, #4
	adds r1, r1, r2
	adds r1, r1, r3
	ldr r1, [r1]
	adds r1, #0x79
	movs r2, #0xa0
	lsls r2, r2, #7
	bl PutIcon
	mov r2, r8
	ldrb r2, [r2]
	lsls r0, r2, #0x1c
	lsrs r0, r0, #0x1d
	bl sub_80A7AA8
	bl DecodeMsg
	adds r2, r4, #0
	adds r4, #8
	adds r1, r7, #0
	adds r1, #0xf2
	str r6, [sp]
	str r0, [sp, #4]
	adds r0, r2, #0
	movs r2, #4
	movs r3, #0
	bl PutDrawText
	mov r3, r8
	ldrb r3, [r3]
	lsrs r0, r3, #4
	bl sub_80A7AB8
	bl DecodeMsg
	adds r2, r4, #0
	adds r4, #8
	movs r3, #0x80
	lsls r3, r3, #1
	adds r1, r7, r3
	str r6, [sp]
	str r0, [sp, #4]
	adds r0, r2, #0
	movs r2, #4
	movs r3, #0
	bl PutDrawText
	adds r5, #0x2c
	ldrb r5, [r5]
	lsls r0, r5, #0x1f
	lsrs r0, r0, #0x1f
	bl sub_80A7AC8
	bl DecodeMsg
	movs r2, #0x88
	lsls r2, r2, #1
	adds r1, r7, r2
	str r6, [sp]
	str r0, [sp, #4]
	adds r0, r4, #0
	movs r2, #4
	movs r3, #0
	bl PutDrawText
	movs r0, #0
	bl SetTextFont
	movs r0, #4
	bl EnableBgSync
	add sp, #8
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0809CAE8: .4byte 0x020129A8
_0809CAEC: .4byte gUnk_08190268
_0809CAF0: .4byte gBg2Tm + 0x120
_0809CAF4: .4byte Unk_081C8FCC
_0809CAF8: .4byte gPlaySt

	thumb_func_start sub_809CAFC
sub_809CAFC: @ 0x0809CAFC
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0809CB20 @ =gPlaySt
	ldrh r0, [r0, #0x2c]
	lsls r0, r0, #0x13
	lsrs r0, r0, #0x17
	movs r1, #0xc
	bl __divsi3
	cmp r0, #0xa
	ble _0809CB14
	movs r0, #0xa
_0809CB14:
	str r0, [r4, #0x34]
	movs r0, #0
	str r0, [r4, #0x2c]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0809CB20: .4byte gPlaySt

	thumb_func_start sub_809CB24
sub_809CB24: @ 0x0809CB24
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #0xc
	mov r8, r0
	ldr r7, _0809CD20 @ =gDispIo
	movs r0, #8
	rsbs r0, r0, #0
	ldrb r1, [r7]
	ands r0, r1
	strb r0, [r7]
	movs r0, #0
	bl InitBgs
	movs r0, #0
	bl GetBgTilemap
	movs r1, #0
	bl TmFill
	movs r0, #1
	bl GetBgTilemap
	movs r1, #0
	bl TmFill
	movs r0, #2
	bl GetBgTilemap
	movs r1, #0
	bl TmFill
	movs r1, #4
	rsbs r1, r1, #0
	adds r0, r1, #0
	ldrb r2, [r7, #0xc]
	ands r0, r2
	strb r0, [r7, #0xc]
	movs r2, #3
	ldrb r0, [r7, #0x10]
	orrs r0, r2
	strb r0, [r7, #0x10]
	ldrb r3, [r7, #0x14]
	ands r1, r3
	strb r1, [r7, #0x14]
	ldrb r6, [r7, #0x18]
	orrs r2, r6
	strb r2, [r7, #0x18]
	bl InitFaces
	bl ResetText
	bl InitIcons
	bl ApplySystemObjectsGraphics
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
	movs r0, #4
	bl ApplyIconPalettes
	bl sub_808ED8C
	ldr r0, _0809CD24 @ =gUnk_084364A0
	ldr r1, _0809CD28 @ =0x06000400
	bl Decompress
	ldr r0, _0809CD2C @ =gUnk_08436480
	movs r1, #0xf0
	lsls r1, r1, #1
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r0, _0809CD30 @ =gBg1Tm
	ldr r1, _0809CD34 @ =gUnk_08438D90
	ldr r2, _0809CD38 @ =0x0000F020
	bl TmApplyTsa_thm
	movs r0, #7
	bl EnableBgSync
	movs r0, #0x21
	rsbs r0, r0, #0
	ldrb r1, [r7, #1]
	ands r0, r1
	movs r1, #0x41
	rsbs r1, r1, #0
	ands r0, r1
	movs r1, #0x7f
	ands r0, r1
	strb r0, [r7, #1]
	adds r1, r7, #0
	adds r1, #0x2d
	movs r0, #0x80
	strb r0, [r1]
	adds r1, #4
	movs r0, #0x28
	strb r0, [r1]
	subs r1, #5
	movs r0, #0xe0
	strb r0, [r1]
	adds r1, #4
	movs r0, #0x98
	strb r0, [r1]
	movs r2, #0x34
	adds r2, r2, r7
	mov sb, r2
	movs r0, #1
	ldrb r1, [r2]
	orrs r1, r0
	movs r5, #2
	orrs r1, r5
	movs r2, #4
	orrs r1, r2
	movs r4, #8
	orrs r1, r4
	movs r3, #0x10
	orrs r1, r3
	movs r6, #0x36
	ldrb r2, [r6, r7]
	orrs r0, r2
	orrs r0, r5
	movs r2, #5
	rsbs r2, r2, #0
	ands r0, r2
	orrs r0, r4
	orrs r0, r3
	movs r2, #0x20
	orrs r1, r2
	mov r3, sb
	strb r1, [r3]
	orrs r0, r2
	strb r0, [r6, r7]
	adds r1, r7, #0
	adds r1, #0x3c
	movs r0, #0x3f
	ldrb r6, [r1]
	ands r0, r6
	strb r0, [r1]
	adds r0, r7, #0
	adds r0, #0x44
	movs r1, #8
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	ldr r4, _0809CD3C @ =0x02012990
	ldr r1, _0809CD40 @ =0x06004000
	movs r2, #0x80
	lsls r2, r2, #2
	adds r0, r4, #0
	movs r3, #0
	bl InitTextFont
	adds r0, r4, #0
	bl SetTextFont
	adds r4, #0x18
	movs r5, #0xb
_0809CC80:
	adds r0, r4, #0
	movs r1, #8
	bl InitText
	adds r4, #8
	subs r5, #1
	cmp r5, #0
	bge _0809CC80
	ldr r0, _0809CD44 @ =0x02012A90
	movs r1, #8
	bl InitText
	movs r0, #0
	bl SetTextFont
	bl sub_809C9F8
	movs r3, #0x81
	lsls r3, r3, #1
	movs r4, #0
	str r4, [sp]
	movs r0, #0x32
	movs r1, #0xd8
	movs r2, #0x58
	bl sub_8008DA8
	movs r0, #0
	movs r1, #0
	movs r2, #1
	bl InitTalk
	ldr r0, _0809CD48 @ =gUnk_0842B374
	ldr r1, _0809CD4C @ =0x06017000
	bl Decompress
	str r4, [sp, #8]
	ldr r1, _0809CD50 @ =gPal + 0x3c0
	ldr r2, _0809CD54 @ =0x01000008
	add r0, sp, #8
	bl CpuFastSet
	ldr r0, _0809CD58 @ =gUnk_0842B4BC
	movs r1, #0xf8
	lsls r1, r1, #2
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r0, _0809CD5C @ =sub_809C980
	mov r1, r8
	bl StartParallelWorker
	ldr r0, _0809CD60 @ =gUnk_08439190
	ldr r1, _0809CD64 @ =0x06017800
	bl Decompress
	ldr r0, _0809CD68 @ =gUnk_0843927C
	movs r1, #0xe8
	lsls r1, r1, #2
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r0, _0809CD6C @ =gUnk_0843929C
	ldr r3, _0809CD70 @ =0x0000DBC0
	str r4, [sp]
	movs r1, #0xd
	str r1, [sp, #4]
	movs r1, #0x86
	movs r2, #0x6c
	bl StartSpriteAnimProc
	ldr r0, _0809CD74 @ =0x00000FB3
	mov r1, r8
	str r0, [r1, #0x30]
	add sp, #0xc
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0809CD20: .4byte gDispIo
_0809CD24: .4byte gUnk_084364A0
_0809CD28: .4byte 0x06000400
_0809CD2C: .4byte gUnk_08436480
_0809CD30: .4byte gBg1Tm
_0809CD34: .4byte gUnk_08438D90
_0809CD38: .4byte 0x0000F020
_0809CD3C: .4byte 0x02012990
_0809CD40: .4byte 0x06004000
_0809CD44: .4byte 0x02012A90
_0809CD48: .4byte gUnk_0842B374
_0809CD4C: .4byte 0x06017000
_0809CD50: .4byte gPal + 0x3c0
_0809CD54: .4byte 0x01000008
_0809CD58: .4byte gUnk_0842B4BC
_0809CD5C: .4byte sub_809C980
_0809CD60: .4byte gUnk_08439190
_0809CD64: .4byte 0x06017800
_0809CD68: .4byte gUnk_0843927C
_0809CD6C: .4byte gUnk_0843929C
_0809CD70: .4byte 0x0000DBC0
_0809CD74: .4byte 0x00000FB3

	thumb_func_start sub_809CD78
sub_809CD78: @ 0x0809CD78
	push {r4, lr}
	adds r4, r0, #0
	bl EndEachSpriteAnimProc
	bl EndCgText
	adds r0, r4, #0
	bl EndAllProcChildren
	bl EndMuralBackground_
	movs r0, #0
	bl EndFaceById
	movs r0, #0
	bl SetOnHBlankA
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_809CDA0
sub_809CDA0: @ 0x0809CDA0
	push {lr}
	sub sp, #0x10
	ldr r0, [r0, #0x30]
	str r0, [sp]
	ldr r0, _0809CDCC @ =0x06011000
	str r0, [sp, #4]
	movs r0, #0xa
	str r0, [sp, #8]
	movs r0, #0
	str r0, [sp, #0xc]
	movs r0, #0x16
	movs r1, #0x13
	movs r2, #0x12
	movs r3, #4
	bl sub_8088584
	movs r0, #0x4e
	bl sub_8087E2C
	add sp, #0x10
	pop {r0}
	bx r0
	.align 2, 0
_0809CDCC: .4byte 0x06011000

	thumb_func_start sub_809CDD0
sub_809CDD0: @ 0x0809CDD0
	push {r4, lr}
	adds r4, r0, #0
	bl sub_80893F4
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0809CDE6
	adds r0, r4, #0
	bl Proc_Break
	b _0809CE0C
_0809CDE6:
	ldr r0, _0809CE14 @ =gpKeySt
	ldr r1, [r0]
	movs r0, #8
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _0809CE0C
	adds r0, r4, #0
	bl Proc_Break
	ldr r0, _0809CE18 @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0809CE0C
	ldr r0, _0809CE1C @ =0x0000038B
	bl m4aSongNumStart
_0809CE0C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0809CE14: .4byte gpKeySt
_0809CE18: .4byte gPlaySt
_0809CE1C: .4byte 0x0000038B

	thumb_func_start sub_809CE20
sub_809CE20: @ 0x0809CE20
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	movs r0, #0
	ldr r1, _0809CE94 @ =gBg1Tm
	mov sl, r1
	ldr r6, _0809CE98 @ =gBg2Tm
	mov sb, r6
	ldr r7, _0809CE9C @ =0x02012BFC
	ldr r1, _0809CEA0 @ =gBg0Tm
	mov r8, r1
	movs r6, #0x80
	lsls r6, r6, #4
	adds r6, r6, r7
	mov ip, r6
_0809CE44:
	adds r1, r0, #1
	str r1, [sp]
	lsls r0, r0, #1
	ldr r6, _0809CEA4 @ =0x02013BFC
	adds r4, r0, r6
	adds r3, r0, r7
	adds r2, r0, #0
	movs r5, #0x13
_0809CE54:
	mov r1, r8
	adds r0, r2, r1
	ldrh r0, [r0]
	strh r0, [r3]
	mov r6, ip
	adds r1, r2, r6
	mov r6, sl
	adds r0, r2, r6
	ldrh r0, [r0]
	strh r0, [r1]
	mov r1, sb
	adds r0, r2, r1
	ldrh r0, [r0]
	strh r0, [r4]
	adds r4, #0x40
	adds r3, #0x40
	adds r2, #0x40
	subs r5, #1
	cmp r5, #0
	bge _0809CE54
	ldr r0, [sp]
	cmp r0, #0x1d
	ble _0809CE44
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0809CE94: .4byte gBg1Tm
_0809CE98: .4byte gBg2Tm
_0809CE9C: .4byte 0x02012BFC
_0809CEA0: .4byte gBg0Tm
_0809CEA4: .4byte 0x02013BFC

	thumb_func_start sub_809CEA8
sub_809CEA8: @ 0x0809CEA8
	ldr r2, _0809CEC0 @ =gCharacterData
	subs r0, #1
	movs r1, #0x34
	muls r0, r1, r0
	adds r2, #0x2c
	adds r0, r0, r2
	ldr r0, [r0]
	cmp r0, #0
	beq _0809CEC4
	ldrb r0, [r0, #0x15]
	b _0809CEC6
	.align 2, 0
_0809CEC0: .4byte gCharacterData
_0809CEC4:
	movs r0, #0
_0809CEC6:
	bx lr

	thumb_func_start sub_809CEC8
sub_809CEC8: @ 0x0809CEC8
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r6, r0, #0
	ldr r1, [r6, #0x30]
	adds r1, #0x80
	ldr r5, _0809CFB8 @ =0x000001FF
	ands r1, r5
	ldr r3, _0809CFBC @ =gUnk_08D8DEB0
	movs r4, #0xe0
	lsls r4, r4, #2
	str r4, [sp]
	movs r0, #4
	movs r2, #0xa
	bl PutSpriteExt
	ldr r1, [r6, #0x30]
	adds r1, #0xa8
	ands r1, r5
	ldr r3, _0809CFC0 @ =gUnk_08D8DEB8
	str r4, [sp]
	movs r0, #4
	movs r2, #0xa
	bl PutSpriteExt
	ldr r1, [r6, #0x30]
	adds r1, #0xc8
	ands r1, r5
	ldr r3, _0809CFC4 @ =gUnk_08D8DEC6
	str r4, [sp]
	movs r0, #4
	movs r2, #0xa
	bl PutSpriteExt
	ldr r1, [r6, #0x30]
	adds r1, #0x20
	ands r1, r5
	ldr r3, _0809CFC8 @ =gUnk_08D8DED4
	ldr r4, _0809CFCC @ =0x0000E280
	str r4, [sp]
	movs r0, #4
	movs r2, #0x50
	bl PutSpriteExt
	ldr r1, [r6, #0x30]
	adds r1, #0xa0
	ands r1, r5
	ldr r3, _0809CFD0 @ =gUnk_08D8DEE2
	str r4, [sp]
	movs r0, #4
	movs r2, #0x90
	bl PutSpriteExt
	ldr r0, [r6, #0x30]
	adds r7, r0, #0
	adds r7, #0x70
	ands r7, r5
	ldr r0, [r6, #0x34]
	adds r2, r0, #0
	adds r2, #0x16
	movs r4, #0
	adds r0, r6, #0
	adds r0, #0x3c
	ldrb r0, [r0]
	cmp r4, r0
	bge _0809CF92
	adds r5, r2, #0
_0809CF4C:
	movs r3, #0xc0
	lsls r3, r3, #8
	adds r0, r6, #0
	adds r0, #0x40
	adds r0, r0, r4
	ldrb r0, [r0]
	cmp r0, #0
	bne _0809CF60
	movs r3, #0xd0
	lsls r3, r3, #8
_0809CF60:
	cmp r0, #2
	bne _0809CF68
	movs r3, #0xf0
	lsls r3, r3, #8
_0809CF68:
	movs r1, #0xc0
	lsls r1, r1, #4
	adds r0, r1, #0
	orrs r3, r0
	adds r0, r6, #0
	adds r0, #0x4e
	adds r0, r0, r4
	ldrb r0, [r0]
	str r0, [sp]
	movs r0, #0
	adds r1, r7, #0
	adds r2, r5, #0
	bl sub_8026628
	adds r5, #0x10
	adds r4, #1
	adds r0, r6, #0
	adds r0, #0x3c
	ldrb r0, [r0]
	cmp r4, r0
	blt _0809CF4C
_0809CF92:
	ldr r1, [r6, #0x30]
	adds r1, #8
	ldr r0, _0809CFB8 @ =0x000001FF
	ands r1, r0
	ldr r3, _0809CFD4 @ =gUnk_08D8D51C
	movs r0, #0xaf
	lsls r0, r0, #6
	str r0, [sp]
	movs r0, #4
	movs r2, #0x90
	bl PutSpriteExt
	bl sub_80259A4
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0809CFB8: .4byte 0x000001FF
_0809CFBC: .4byte gUnk_08D8DEB0
_0809CFC0: .4byte gUnk_08D8DEB8
_0809CFC4: .4byte gUnk_08D8DEC6
_0809CFC8: .4byte gUnk_08D8DED4
_0809CFCC: .4byte 0x0000E280
_0809CFD0: .4byte gUnk_08D8DEE2
_0809CFD4: .4byte gUnk_08D8D51C

	thumb_func_start sub_809CFD8
sub_809CFD8: @ 0x0809CFD8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x24
	mov sb, r0
	mov sl, r1
	add r1, sp, #8
	ldr r0, _0809D06C @ =gUnk_0842D208
	ldm r0!, {r2, r3, r4}
	stm r1!, {r2, r3, r4}
	mov r0, sb
	adds r0, #0x40
	mov r1, sl
	adds r4, r0, r1
	ldrb r0, [r4]
	cmp r0, #0
	bne _0809D074
	movs r5, #0
	lsls r1, r1, #1
	mov r8, r1
	mov r0, r8
	adds r0, #3
	lsls r0, r0, #5
	adds r0, #0x10
	ldr r1, _0809D070 @ =gBg2Tm
	lsls r0, r0, #1
	adds r4, r0, r1
_0809D012:
	adds r0, r4, #0
	movs r1, #1
	movs r2, #0x14
	bl PutSpecialChar
	adds r4, #2
	adds r5, #1
	cmp r5, #4
	ble _0809D012
	movs r5, #0
	mov r0, r8
	adds r0, #3
	lsls r0, r0, #5
	adds r0, #0x16
	ldr r1, _0809D070 @ =gBg2Tm
	lsls r0, r0, #1
	adds r4, r0, r1
_0809D034:
	adds r0, r4, #0
	movs r1, #1
	movs r2, #0x14
	bl PutSpecialChar
	adds r4, #2
	adds r5, #1
	cmp r5, #1
	ble _0809D034
	movs r5, #0
	mov r0, r8
	adds r0, #3
	lsls r0, r0, #5
	adds r0, #0x19
	ldr r1, _0809D070 @ =gBg2Tm
	lsls r0, r0, #1
	adds r4, r0, r1
_0809D056:
	adds r0, r4, #0
	movs r1, #1
	movs r2, #0x14
	bl PutSpecialChar
	adds r4, #2
	adds r5, #1
	cmp r5, #2
	ble _0809D056
	b _0809D1B4
	.align 2, 0
_0809D06C: .4byte gUnk_0842D208
_0809D070: .4byte gBg2Tm
_0809D074:
	movs r7, #0
	mov r2, sb
	ldr r0, [r2, #0x2c]
	bl sub_809BAB8
	str r0, [sp, #0x14]
	mov r3, sb
	ldr r0, [r3, #0x2c]
	mov r1, sl
	bl sub_809BA94
	str r0, [sp, #0x18]
	ldrb r4, [r4]
	cmp r4, #2
	bne _0809D094
	movs r7, #1
_0809D094:
	mov r4, sb
	ldr r0, [r4, #0x2c]
	mov r1, sl
	bl sub_809BA94
	subs r0, #1
	movs r6, #0x34
	muls r0, r6, r0
	ldr r1, _0809D124 @ =gCharacterData
	adds r0, r0, r1
	ldrh r0, [r0]
	bl DecodeMsg
	mov r2, sl
	lsls r2, r2, #1
	mov r8, r2
	mov r4, r8
	adds r4, #3
	lsls r3, r4, #5
	str r3, [sp, #0x1c]
	lsls r4, r4, #6
	ldr r5, _0809D128 @ =gBg2Tm + 0x20
	adds r1, r4, r5
	movs r2, #5
	str r2, [sp]
	str r0, [sp, #4]
	movs r0, #0
	adds r2, r7, #0
	movs r3, #0
	bl PutDrawText
	adds r5, #0xc
	adds r4, r4, r5
	mov r1, sb
	ldr r0, [r1, #0x2c]
	mov r1, sl
	bl sub_809BA94
	subs r0, #1
	muls r0, r6, r0
	ldr r2, _0809D124 @ =gCharacterData
	adds r0, r0, r2
	ldrb r1, [r0, #9]
	adds r1, #0x79
	movs r2, #0xe0
	lsls r2, r2, #8
	adds r0, r4, #0
	bl PutIcon
	ldr r0, [sp, #0x14]
	ldr r1, [sp, #0x18]
	bl sub_809F5FC
	cmp r0, #2
	bne _0809D170
	movs r5, #0
	mov r0, sb
	adds r0, #0x47
	mov r3, sl
	adds r6, r0, r3
	ldr r0, [sp, #0x1c]
	adds r0, #0x19
	add r4, sp, #8
	mov sb, r4
	lsls r4, r0, #1
_0809D116:
	movs r7, #1
	ldrb r0, [r6]
	cmp r0, #2
	bne _0809D12C
	movs r7, #4
	b _0809D134
	.align 2, 0
_0809D124: .4byte gCharacterData
_0809D128: .4byte gBg2Tm + 0x20
_0809D12C:
	ldrb r1, [r6]
	cmp r1, r5
	ble _0809D134
	movs r7, #0
_0809D134:
	ldr r3, _0809D16C @ =gBg2Tm
	adds r0, r4, r3
	mov r1, sb
	adds r1, #4
	mov sb, r1
	subs r1, #4
	ldm r1!, {r2}
	adds r1, r7, #0
	str r3, [sp, #0x20]
	bl PutSpecialChar
	adds r4, #2
	adds r5, #1
	ldr r3, [sp, #0x20]
	cmp r5, #1
	ble _0809D116
	mov r0, r8
	adds r0, #3
	lsls r0, r0, #6
	adds r1, r3, #0
	adds r1, #0x36
	adds r0, r0, r1
	movs r1, #1
	movs r2, #0x14
	bl PutSpecialChar
	b _0809D1B4
	.align 2, 0
_0809D16C: .4byte gBg2Tm
_0809D170:
	movs r5, #0
	mov r0, sb
	adds r0, #0x47
	mov r2, sl
	adds r6, r0, r2
	ldr r0, [sp, #0x1c]
	adds r0, #0x19
	add r3, sp, #8
	mov r8, r3
	lsls r4, r0, #1
_0809D184:
	movs r7, #1
	ldrb r0, [r6]
	cmp r0, #3
	bne _0809D190
	movs r7, #4
	b _0809D198
_0809D190:
	ldrb r1, [r6]
	cmp r1, r5
	ble _0809D198
	movs r7, #0
_0809D198:
	ldr r0, _0809D1C4 @ =gBg2Tm
	adds r0, r4, r0
	mov r3, r8
	adds r3, #4
	mov r8, r3
	subs r3, #4
	ldm r3!, {r2}
	adds r1, r7, #0
	bl PutSpecialChar
	adds r4, #2
	adds r5, #1
	cmp r5, #2
	ble _0809D184
_0809D1B4:
	add sp, #0x24
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0809D1C4: .4byte gBg2Tm

	thumb_func_start sub_809D1C8
sub_809D1C8: @ 0x0809D1C8
	push {r4, r5, r6, lr}
	sub sp, #0x20
	adds r6, r0, #0
	ldr r1, _0809D288 @ =0x06015000
	mov r0, sp
	movs r2, #0xe
	bl InitSpriteTextFont
	ldr r0, _0809D28C @ =Pal_Text
	movs r1, #0xf0
	lsls r1, r1, #2
	movs r2, #0x20
	bl ApplyPaletteExt
	add r5, sp, #0x18
	adds r0, r5, #0
	bl InitSpriteText
	mov r0, sp
	bl SetTextFont
	movs r0, #0
	bl SetTextFontGlyphs
	adds r0, r5, #0
	movs r1, #0
	bl SpriteText_DrawBackgroundExt
	ldr r4, _0809D290 @ =gCharacterData
	ldr r0, [r6, #0x2c]
	bl sub_809BAB8
	subs r0, #1
	movs r1, #0x34
	muls r0, r1, r0
	adds r0, r0, r4
	ldrh r0, [r0]
	bl DecodeMsg
	adds r4, r0, #0
	movs r0, #0x30
	adds r1, r4, #0
	bl GetStringTextCenteredPos
	adds r1, r0, #0
	adds r0, r5, #0
	movs r2, #0
	adds r3, r4, #0
	bl Text_InsertDrawString
	adds r0, r6, #0
	adds r0, #0x38
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _0809D29C
	movs r2, #0
	adds r4, r6, #0
	adds r4, #0x3d
	ldrb r0, [r4]
	cmp r0, #0
	bne _0809D248
	movs r2, #1
_0809D248:
	ldr r3, _0809D294 @ =gUnk_0842D214
	adds r0, r5, #0
	movs r1, #0x30
	bl Text_InsertDrawString
	adds r0, r5, #0
	movs r1, #0x60
	bl Text_SetCursor
	ldrb r0, [r4]
	movs r1, #2
	cmp r0, #0
	bne _0809D264
	movs r1, #1
_0809D264:
	adds r0, r5, #0
	bl Text_SetColor
	ldrb r1, [r4]
	adds r0, r5, #0
	bl Text_DrawNumberOrBlank
	movs r2, #0
	ldrb r0, [r4]
	cmp r0, #0
	bne _0809D27C
	movs r2, #1
_0809D27C:
	ldr r3, _0809D298 @ =gUnk_0842D220
	adds r0, r5, #0
	movs r1, #0x68
	bl Text_InsertDrawString
	b _0809D2E8
	.align 2, 0
_0809D288: .4byte 0x06015000
_0809D28C: .4byte Pal_Text
_0809D290: .4byte gCharacterData
_0809D294: .4byte gUnk_0842D214
_0809D298: .4byte gUnk_0842D220
_0809D29C:
	movs r2, #0
	adds r4, r6, #0
	adds r4, #0x3d
	ldrb r0, [r4]
	cmp r0, #0
	bne _0809D2AA
	movs r2, #1
_0809D2AA:
	ldr r3, _0809D328 @ =gUnk_0842D214
	adds r0, r5, #0
	movs r1, #0x30
	bl Text_InsertDrawString
	adds r0, r5, #0
	movs r1, #0x60
	bl Text_SetCursor
	ldrb r0, [r4]
	movs r1, #2
	cmp r0, #0
	bne _0809D2C6
	movs r1, #1
_0809D2C6:
	adds r0, r5, #0
	bl Text_SetColor
	ldrb r1, [r4]
	adds r0, r5, #0
	bl Text_DrawNumberOrBlank
	movs r2, #0
	ldrb r0, [r4]
	cmp r0, #0
	bne _0809D2DE
	movs r2, #1
_0809D2DE:
	ldr r3, _0809D32C @ =gUnk_0842D220
	adds r0, r5, #0
	movs r1, #0x68
	bl Text_InsertDrawString
_0809D2E8:
	ldr r3, _0809D330 @ =gUnk_0842D224
	adds r0, r5, #0
	movs r1, #0x80
	movs r2, #0
	bl Text_InsertDrawString
	adds r0, r5, #0
	bl InitSpriteText
	adds r0, r5, #0
	movs r1, #0
	bl SpriteText_DrawBackgroundExt
	ldr r3, _0809D334 @ =gUnk_0842D238
	adds r0, r5, #0
	movs r1, #0
	movs r2, #0
	bl Text_InsertDrawString
	ldr r3, _0809D338 @ =gUnk_0842D254
	adds r0, r5, #0
	movs r1, #0x80
	movs r2, #0
	bl Text_InsertDrawString
	movs r0, #0
	bl SetTextFont
	add sp, #0x20
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0809D328: .4byte gUnk_0842D214
_0809D32C: .4byte gUnk_0842D220
_0809D330: .4byte gUnk_0842D224
_0809D334: .4byte gUnk_0842D238
_0809D338: .4byte gUnk_0842D254

	thumb_func_start InitSupportSubScreenPartners
InitSupportSubScreenPartners: @ 0x0809D33C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	adds r6, r0, #0
	adds r0, #0x38
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _0809D3C8
	movs r4, #0
	adds r0, r6, #0
	adds r0, #0x3c
	mov r8, r0
	ldrb r0, [r0]
	cmp r4, r0
	bge _0809D412
	movs r1, #0x40
	adds r1, r1, r6
	mov sl, r1
_0809D368:
	ldr r0, [r6, #0x2c]
	adds r1, r4, #0
	bl sub_809BA94
	adds r7, r0, #0
	mov r2, sl
	adds r1, r2, r4
	movs r0, #0
	strb r0, [r1]
	movs r5, #1
	adds r4, #1
	mov sb, r4
	adds r4, r1, #0
_0809D382:
	adds r0, r5, #0
	bl GetUnit
	adds r1, r0, #0
	cmp r1, #0
	beq _0809D3B6
	ldr r0, [r1]
	cmp r0, #0
	beq _0809D3B6
	ldrb r0, [r0, #4]
	cmp r0, r7
	bne _0809D3B6
	ldr r1, [r1, #0xc]
	movs r0, #0x80
	lsls r0, r0, #9
	ands r0, r1
	cmp r0, #0
	bne _0809D3B6
	movs r0, #4
	ands r1, r0
	cmp r1, #0
	beq _0809D3B2
	movs r0, #2
	b _0809D3B4
_0809D3B2:
	movs r0, #1
_0809D3B4:
	strb r0, [r4]
_0809D3B6:
	adds r5, #1
	cmp r5, #0x3f
	ble _0809D382
	mov r4, sb
	mov r0, r8
	ldrb r0, [r0]
	cmp r4, r0
	blt _0809D368
	b _0809D412
_0809D3C8:
	adds r1, r6, #0
	adds r1, #0x3b
	strb r0, [r1]
	movs r4, #0
	adds r0, r6, #0
	adds r0, #0x3c
	mov r8, r0
	ldrb r2, [r0]
	cmp r4, r2
	bge _0809D412
	adds r7, r1, #0
_0809D3DE:
	adds r0, r6, #0
	adds r0, #0x40
	adds r5, r0, r4
	movs r0, #0
	strb r0, [r5]
	ldr r0, [r6, #0x2c]
	adds r1, r4, #0
	bl sub_809BA78
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0809D408
	movs r0, #1
	strb r0, [r5]
	ldr r0, [r6, #0x2c]
	adds r1, r4, #0
	bl sub_809BA48
	ldrb r1, [r7]
	adds r0, r1, r0
	strb r0, [r7]
_0809D408:
	adds r4, #1
	mov r2, r8
	ldrb r2, [r2]
	cmp r4, r2
	blt _0809D3DE
_0809D412:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_809D420
sub_809D420: @ 0x0809D420
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	movs r4, #0
	adds r0, #0x3c
	ldrb r1, [r0]
	cmp r4, r1
	bge _0809D448
	adds r7, r5, #0
	adds r7, #0x47
	adds r6, r0, #0
_0809D434:
	ldr r0, [r5, #0x2c]
	adds r1, r4, #0
	bl sub_809BA48
	adds r1, r7, r4
	strb r0, [r1]
	adds r4, #1
	ldrb r0, [r6]
	cmp r4, r0
	blt _0809D434
_0809D448:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_809D450
sub_809D450: @ 0x0809D450
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	adds r4, r0, #0
	adds r0, #0x38
	movs r5, #0
	ldrsb r5, [r0, r5]
	cmp r5, #0
	beq _0809D476
	ldr r0, [r4, #0x2c]
	bl sub_809BE88
	movs r1, #5
	subs r1, r1, r0
	adds r0, r4, #0
	adds r0, #0x3d
	strb r1, [r0]
	b _0809D4C4
_0809D476:
	ldr r0, [r4, #0x2c]
	bl sub_809BAB8
	mov sb, r0
	adds r1, r4, #0
	adds r1, #0x3d
	strb r5, [r1]
	movs r5, #0
	adds r0, r4, #0
	adds r0, #0x3c
	mov r8, r1
	adds r7, r0, #0
	ldrb r0, [r7]
	cmp r5, r0
	bge _0809D4B4
	mov r6, r8
_0809D496:
	ldr r0, [r4, #0x2c]
	adds r1, r5, #0
	bl sub_809BA94
	adds r1, r0, #0
	mov r0, sb
	bl sub_809F5FC
	ldrb r1, [r6]
	adds r0, r1, r0
	strb r0, [r6]
	adds r5, #1
	ldrb r2, [r7]
	cmp r5, r2
	blt _0809D496
_0809D4B4:
	ldr r0, [r4, #0x2c]
	bl sub_809BE88
	mov r1, r8
	ldrb r1, [r1]
	subs r0, r1, r0
	mov r2, r8
	strb r0, [r2]
_0809D4C4:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_809D4D0
sub_809D4D0: @ 0x0809D4D0
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	bl ResetUnitSprites
	movs r4, #0
	b _0809D4F8
_0809D4DC:
	ldr r0, [r5, #0x2c]
	adds r1, r4, #0
	bl sub_809BA60
	adds r1, r5, #0
	adds r1, #0x4e
	adds r1, r1, r4
	strb r0, [r1]
	ldrb r0, [r1]
	bl GetClassSMSId
	bl sub_8025278
	adds r4, #1
_0809D4F8:
	adds r0, r5, #0
	adds r0, #0x3c
	ldrb r0, [r0]
	cmp r4, r0
	blt _0809D4DC
	bl ForceSyncUnitSpriteSheet
	movs r4, #0
	adds r0, r5, #0
	adds r0, #0x3c
	adds r6, r0, #0
	b _0809D51A
_0809D510:
	adds r0, r5, #0
	adds r1, r4, #0
	bl sub_809CFD8
	adds r4, #1
_0809D51A:
	ldrb r0, [r6]
	cmp r4, r0
	blt _0809D510
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_809D528
sub_809D528: @ 0x0809D528
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	adds r5, r1, #0
	adds r4, r2, #0
_0809D530:
	cmp r5, #0
	blt _0809D59C
	adds r0, r7, #0
	adds r0, #0x3c
	ldrb r0, [r0]
	subs r0, #1
	cmp r5, r0
	bgt _0809D59C
	adds r1, r7, #0
	adds r1, #0x40
	adds r1, r1, r5
	movs r0, #1
	ldrb r1, [r1]
	ands r0, r1
	cmp r0, #0
	beq _0809D598
	ldr r0, [r7, #0x2c]
	adds r1, r5, #0
	bl sub_809BA48
	cmp r0, #0
	ble _0809D598
	adds r6, r7, #0
	adds r6, #0x39
	movs r1, #0xe3
	ldrb r0, [r6]
	ands r1, r0
	movs r2, #7
	adds r0, r5, #0
	ands r0, r2
	lsls r0, r0, #2
	adds r1, r1, r0
	strb r1, [r6]
	movs r4, #3
	ands r4, r1
	ldr r0, [r7, #0x2c]
	adds r1, r5, #0
	bl sub_809BA48
	cmp r4, r0
	blt _0809D59C
	ldr r0, [r7, #0x2c]
	adds r1, r5, #0
	bl sub_809BA48
	movs r1, #0xfc
	ldrb r2, [r6]
	ands r1, r2
	subs r0, #1
	adds r1, r1, r0
	strb r1, [r6]
	b _0809D59C
_0809D598:
	adds r5, r5, r4
	b _0809D530
_0809D59C:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_809D5A4
sub_809D5A4: @ 0x0809D5A4
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0
	str r0, [r4, #0x30]
	str r0, [r4, #0x34]
	adds r2, r4, #0
	adds r2, #0x39
	movs r0, #0xfc
	ldrb r1, [r2]
	ands r0, r1
	movs r1, #0xe3
	ands r0, r1
	strb r0, [r2]
	ldr r0, [r4, #0x2c]
	bl sub_809BAB8
	bl sub_809CEA8
	adds r1, r4, #0
	adds r1, #0x3c
	strb r0, [r1]
	adds r0, r4, #0
	bl InitSupportSubScreenPartners
	adds r0, r4, #0
	bl sub_809D420
	adds r0, r4, #0
	bl sub_809D450
	adds r0, r4, #0
	movs r1, #0
	movs r2, #1
	bl sub_809D528
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_809D5F0
sub_809D5F0: @ 0x0809D5F0
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	ldr r3, _0809D644 @ =gPal + 0x380
	adds r5, r3, #0
	adds r5, #0x20
	movs r0, #0x1f
	mov r8, r0
	movs r7, #0xf8
	lsls r7, r7, #2
	movs r6, #0xf8
	lsls r6, r6, #7
	movs r4, #0xf
	movs r0, #0x1f
	mov ip, r0
_0809D60E:
	ldrh r2, [r3]
	mov r1, ip
	ands r1, r2
	lsrs r1, r1, #1
	mov r0, r8
	ands r1, r0
	adds r0, r7, #0
	ands r0, r2
	lsrs r0, r0, #1
	ands r0, r7
	adds r1, r1, r0
	adds r0, r6, #0
	ands r0, r2
	lsrs r0, r0, #1
	ands r0, r6
	adds r1, r1, r0
	strh r1, [r5]
	adds r5, #2
	adds r3, #2
	subs r4, #1
	cmp r4, #0
	bge _0809D60E
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0809D644: .4byte gPal + 0x380

	thumb_func_start sub_809D648
sub_809D648: @ 0x0809D648
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r5, r0, #0
	ldr r4, _0809D7CC @ =gDispIo
	movs r0, #8
	rsbs r0, r0, #0
	ldrb r1, [r4]
	ands r0, r1
	strb r0, [r4]
	movs r0, #0
	bl InitBgs
	movs r1, #4
	rsbs r1, r1, #0
	adds r0, r1, #0
	ldrb r2, [r4, #0xc]
	ands r0, r2
	movs r3, #1
	orrs r0, r3
	strb r0, [r4, #0xc]
	movs r2, #3
	ldrb r0, [r4, #0x10]
	orrs r0, r2
	strb r0, [r4, #0x10]
	ldrb r0, [r4, #0x14]
	ands r1, r0
	orrs r1, r3
	strb r1, [r4, #0x14]
	ldrb r1, [r4, #0x18]
	orrs r2, r1
	strb r2, [r4, #0x18]
	bl ResetText
	bl InitIcons
	bl UnpackUiWindowFrameGraphics
	bl ApplySystemObjectsGraphics
	bl ApplyUnitSpritePalettes
	bl sub_809D5F0
	movs r0, #0xd
	bl ApplyIconPalettes
	adds r0, r5, #0
	bl StartGreenText
	adds r0, r5, #0
	adds r0, #0x38
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne _0809D714
	ldr r2, _0809D7D0 @ =gPlaySt
	adds r2, #0x40
	movs r0, #0x61
	rsbs r0, r0, #0
	ldrb r4, [r2]
	ands r0, r4
	movs r1, #0x20
	orrs r0, r1
	strb r0, [r2]
	adds r0, r5, #0
	bl ResetSysHandCursor
	movs r0, #0xc0
	lsls r0, r0, #3
	movs r1, #1
	bl DisplaySysHandCursorTextShadow
	movs r0, #1
	bl ConfigSysHandCursorShadowEnabled
	adds r1, r5, #0
	adds r1, #0x3a
	movs r0, #0xff
	strb r0, [r1]
	adds r0, r5, #0
	adds r0, #0x3b
	ldrb r0, [r0]
	cmp r0, #0
	beq _0809D714
	adds r0, r5, #0
	adds r0, #0x39
	ldrb r1, [r0]
	movs r0, #3
	ands r0, r1
	lsls r0, r0, #3
	adds r0, #0xc4
	lsrs r1, r1, #2
	movs r2, #7
	ands r1, r2
	lsls r1, r1, #4
	adds r1, #0x18
	movs r3, #0x80
	lsls r3, r3, #4
	movs r2, #1
	bl ShowSysHandCursor
_0809D714:
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
	ldr r3, _0809D7CC @ =gDispIo
	adds r2, r3, #0
	adds r2, #0x3c
	movs r0, #0x3f
	ldrb r1, [r2]
	ands r0, r1
	strb r0, [r2]
	adds r0, r3, #0
	adds r0, #0x44
	movs r6, #0
	strb r6, [r0]
	adds r0, #1
	strb r6, [r0]
	adds r0, #1
	strb r6, [r0]
	ldr r0, _0809D7D4 @ =0x0000FFE0
	ldrh r4, [r3, #0x3c]
	ands r0, r4
	ldr r1, _0809D7D8 @ =0x0000E0FF
	ands r0, r1
	movs r4, #0x80
	lsls r4, r4, #4
	adds r1, r4, #0
	orrs r0, r1
	strh r0, [r3, #0x3c]
	movs r1, #0x21
	rsbs r1, r1, #0
	adds r0, r1, #0
	ldrb r4, [r2]
	ands r0, r4
	strb r0, [r2]
	adds r0, r3, #0
	adds r0, #0x3d
	ldrb r2, [r0]
	ands r1, r2
	strb r1, [r0]
	bl sub_808ED8C
	movs r0, #0x80
	lsls r0, r0, #7
	movs r1, #5
	bl sub_809228C
	ldr r0, _0809D7DC @ =gBg1Tm
	ldr r1, _0809D7E0 @ =gUnk_0842C3C0
	movs r2, #0xa4
	lsls r2, r2, #7
	bl TmApplyTsa_thm
	ldr r4, _0809D7E4 @ =gCharacterData
	ldr r0, [r5, #0x2c]
	bl sub_809BAB8
	subs r0, #1
	movs r1, #0x34
	muls r0, r1, r0
	adds r0, r0, r4
	ldrh r4, [r0, #6]
	adds r0, r4, #0
	bl ShouldFaceBeRaised
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0809D7E8
	adds r0, r5, #0
	adds r0, #0x3f
	strb r6, [r0]
	movs r0, #0x80
	lsls r0, r0, #1
	str r0, [sp]
	movs r0, #0
	adds r1, r4, #0
	movs r2, #0x38
	movs r3, #0
	bl StartBmFace
	b _0809D800
	.align 2, 0
_0809D7CC: .4byte gDispIo
_0809D7D0: .4byte gPlaySt
_0809D7D4: .4byte 0x0000FFE0
_0809D7D8: .4byte 0x0000E0FF
_0809D7DC: .4byte gBg1Tm
_0809D7E0: .4byte gUnk_0842C3C0
_0809D7E4: .4byte gCharacterData
_0809D7E8:
	adds r1, r5, #0
	adds r1, #0x3f
	movs r0, #8
	strb r0, [r1]
	adds r0, #0xfc
	str r0, [sp]
	movs r0, #0
	adds r1, r4, #0
	movs r2, #0x38
	movs r3, #8
	bl StartBmFace
_0809D800:
	ldr r0, _0809D838 @ =gUnk_0842C874
	ldr r1, _0809D83C @ =0x06017000
	bl Decompress
	ldr r0, _0809D840 @ =gUnk_08429658
	ldr r1, _0809D844 @ =0x06017800
	bl Decompress
	ldr r0, _0809D848 @ =gUnk_0842971C
	movs r1, #0x90
	lsls r1, r1, #2
	movs r2, #0x20
	bl ApplyPaletteExt
	adds r0, r5, #0
	bl sub_809D4D0
	adds r0, r5, #0
	bl sub_809D1C8
	ldr r0, _0809D84C @ =sub_809CEC8
	adds r1, r5, #0
	bl StartParallelWorker
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0809D838: .4byte gUnk_0842C874
_0809D83C: .4byte 0x06017000
_0809D840: .4byte gUnk_08429658
_0809D844: .4byte 0x06017800
_0809D848: .4byte gUnk_0842971C
_0809D84C: .4byte sub_809CEC8

	thumb_func_start sub_809D850
sub_809D850: @ 0x0809D850
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r6, r0, #0
	ldr r0, _0809D884 @ =gpKeySt
	ldr r1, [r0]
	ldrh r3, [r1, #8]
	movs r0, #2
	ands r0, r3
	cmp r0, #0
	beq _0809D890
	ldr r0, _0809D888 @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0809D878
	ldr r0, _0809D88C @ =0x0000038B
	bl m4aSongNumStart
_0809D878:
	adds r0, r6, #0
	movs r1, #3
	bl Proc_Goto
	b _0809DA00
	.align 2, 0
_0809D884: .4byte gpKeySt
_0809D888: .4byte gPlaySt
_0809D88C: .4byte 0x0000038B
_0809D890:
	ldrh r2, [r1, #6]
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r2
	cmp r0, #0
	beq _0809D8A6
	adds r0, r6, #0
	movs r1, #4
	bl Proc_Goto
	b _0809DA00
_0809D8A6:
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r2
	cmp r0, #0
	beq _0809D8BA
	adds r0, r6, #0
	movs r1, #5
	bl Proc_Goto
	b _0809DA00
_0809D8BA:
	adds r0, r6, #0
	adds r0, #0x38
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _0809D8CA
	b _0809DA00
_0809D8CA:
	adds r0, r6, #0
	adds r0, #0x3b
	ldrb r0, [r0]
	cmp r0, #0
	bne _0809D8D6
	b _0809D9E4
_0809D8D6:
	adds r1, r6, #0
	adds r1, #0x39
	ldrb r7, [r1]
	movs r0, #1
	ands r0, r3
	adds r5, r1, #0
	cmp r0, #0
	beq _0809D90C
	ldr r0, _0809D904 @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0809D8F8
	ldr r0, _0809D908 @ =0x0000038A
	bl m4aSongNumStart
_0809D8F8:
	adds r0, r6, #0
	movs r1, #2
	bl Proc_Goto
	b _0809DA00
	.align 2, 0
_0809D904: .4byte gPlaySt
_0809D908: .4byte 0x0000038A
_0809D90C:
	movs r0, #0x20
	ands r0, r2
	cmp r0, #0
	beq _0809D926
	movs r1, #3
	ands r1, r7
	cmp r1, #0
	beq _0809D926
	movs r0, #0xfc
	ands r0, r7
	adds r0, #0xff
	adds r0, r0, r1
	strb r0, [r5]
_0809D926:
	ldr r0, _0809D9D8 @ =gpKeySt
	ldr r1, [r0]
	movs r0, #0x10
	ldrh r1, [r1, #6]
	ands r0, r1
	cmp r0, #0
	beq _0809D960
	ldrb r1, [r5]
	movs r0, #3
	mov r8, r0
	mov r4, r8
	ands r4, r1
	ldr r0, [r6, #0x2c]
	lsrs r1, r1, #2
	movs r2, #7
	ands r1, r2
	bl sub_809BA48
	subs r0, #1
	cmp r4, r0
	bge _0809D960
	ldrb r0, [r5]
	movs r1, #0xfc
	ands r1, r0
	adds r1, #1
	mov r2, r8
	ands r2, r0
	adds r1, r1, r2
	strb r1, [r5]
_0809D960:
	ldr r4, _0809D9D8 @ =gpKeySt
	ldr r1, [r4]
	movs r0, #0x40
	ldrh r1, [r1, #6]
	ands r0, r1
	cmp r0, #0
	beq _0809D982
	ldrb r0, [r5]
	lsrs r1, r0, #2
	movs r0, #7
	ands r1, r0
	subs r1, #1
	movs r2, #1
	rsbs r2, r2, #0
	adds r0, r6, #0
	bl sub_809D528
_0809D982:
	ldr r1, [r4]
	movs r0, #0x80
	ldrh r1, [r1, #6]
	ands r0, r1
	cmp r0, #0
	beq _0809D9A0
	ldrb r0, [r5]
	lsrs r1, r0, #2
	movs r0, #7
	ands r1, r0
	adds r1, #1
	adds r0, r6, #0
	movs r2, #1
	bl sub_809D528
_0809D9A0:
	ldrb r1, [r5]
	cmp r7, r1
	beq _0809DA00
	movs r0, #3
	ands r0, r1
	lsls r0, r0, #3
	adds r0, #0xc4
	lsrs r1, r1, #2
	movs r2, #7
	ands r1, r2
	lsls r1, r1, #4
	adds r1, #0x18
	movs r3, #0x80
	lsls r3, r3, #4
	movs r2, #1
	bl ShowSysHandCursor
	ldr r0, _0809D9DC @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0809DA00
	ldr r0, _0809D9E0 @ =0x00000385
	bl m4aSongNumStart
	b _0809DA00
	.align 2, 0
_0809D9D8: .4byte gpKeySt
_0809D9DC: .4byte gPlaySt
_0809D9E0: .4byte 0x00000385
_0809D9E4:
	movs r0, #1
	ands r0, r3
	cmp r0, #0
	beq _0809DA00
	ldr r0, _0809DA0C @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0809DA00
	movs r0, #0xe3
	lsls r0, r0, #2
	bl m4aSongNumStart
_0809DA00:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0809DA0C: .4byte gPlaySt

	thumb_func_start sub_809DA10
sub_809DA10: @ 0x0809DA10
	push {r4, r5, lr}
	adds r5, r0, #0
	movs r0, #0
	bl InitBgs
	ldr r3, _0809DAC8 @ =gDispIo
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
	adds r1, r3, #0
	adds r1, #0x3c
	movs r0, #0xc0
	ldrb r2, [r1]
	orrs r0, r2
	strb r0, [r1]
	adds r0, r3, #0
	adds r0, #0x44
	movs r1, #0
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r1, r3, #0
	adds r1, #0x46
	movs r0, #0x10
	strb r0, [r1]
	ldr r0, _0809DACC @ =0x0000FFE0
	ldrh r1, [r3, #0x3c]
	ands r0, r1
	movs r1, #0x1f
	orrs r0, r1
	ldr r1, _0809DAD0 @ =0x0000E0FF
	ands r0, r1
	movs r2, #0x80
	lsls r2, r2, #2
	adds r1, r2, #0
	orrs r0, r1
	strh r0, [r3, #0x3c]
	bl InitFaces
	bl ResetText
	bl InitIcons
	bl UnpackUiWindowFrameGraphics
	bl ApplySystemObjectsGraphics
	ldr r0, [r5, #0x2c]
	bl sub_809BAB8
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	ldr r0, [r5, #0x2c]
	adds r5, #0x39
	ldrb r2, [r5]
	lsrs r1, r2, #2
	movs r2, #7
	ands r1, r2
	bl sub_809BA94
	adds r1, r0, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	movs r2, #3
	ldrb r5, [r5]
	ands r2, r5
	adds r2, #1
	adds r0, r4, #0
	bl sub_80792C4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0809DAC8: .4byte gDispIo
_0809DACC: .4byte 0x0000FFE0
_0809DAD0: .4byte 0x0000E0FF

	thumb_func_start sub_809DAD4
sub_809DAD4: @ 0x0809DAD4
	push {r4, r5, lr}
	adds r0, #0x3a
	movs r4, #0
	strb r4, [r0]
	bl HideSysHandCursor
	ldr r3, _0809DB64 @ =gDispIo
	movs r1, #4
	rsbs r1, r1, #0
	adds r0, r1, #0
	ldrb r2, [r3, #0xc]
	ands r0, r2
	movs r2, #1
	orrs r0, r2
	strb r0, [r3, #0xc]
	movs r0, #3
	ldrb r5, [r3, #0x10]
	orrs r0, r5
	strb r0, [r3, #0x10]
	adds r0, r1, #0
	ldrb r5, [r3, #0x14]
	ands r0, r5
	orrs r0, r2
	strb r0, [r3, #0x14]
	ldrb r0, [r3, #0x18]
	ands r1, r0
	strb r1, [r3, #0x18]
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
	strb r4, [r0]
	adds r1, r3, #0
	adds r1, #0x45
	movs r0, #0x10
	strb r0, [r1]
	adds r0, r3, #0
	adds r0, #0x46
	strb r4, [r0]
	ldr r0, _0809DB68 @ =0x0000FFE0
	ldrh r2, [r3, #0x3c]
	ands r0, r2
	movs r1, #8
	orrs r0, r1
	ldr r1, _0809DB6C @ =0x0000E0FF
	ands r0, r1
	movs r5, #0xb8
	lsls r5, r5, #5
	adds r1, r5, #0
	orrs r0, r1
	strh r0, [r3, #0x3c]
	bl sub_809CE20
	ldr r0, _0809DB70 @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0809DB5C
	movs r0, #0xc8
	bl m4aSongNumStart
_0809DB5C:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0809DB64: .4byte gDispIo
_0809DB68: .4byte 0x0000FFE0
_0809DB6C: .4byte 0x0000E0FF
_0809DB70: .4byte gPlaySt

	thumb_func_start sub_809DB74
sub_809DB74: @ 0x0809DB74
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	str r0, [sp]
	movs r4, #0
	ldr r0, _0809DBE4 @ =gBg2Tm
	mov sl, r0
_0809DB88:
	ldr r2, [sp]
	adds r1, r4, r2
	cmp r1, #0x1d
	bhi _0809DBF8
	adds r3, r4, #1
	mov sb, r3
	ldr r2, _0809DBE8 @ =0x02012BFC
	lsls r1, r1, #1
	movs r3, #0x80
	lsls r3, r3, #5
	adds r0, r2, r3
	adds r0, r0, r1
	mov ip, r0
	adds r7, r1, r2
	adds r6, r1, #0
	lsls r0, r4, #1
	ldr r4, _0809DBEC @ =gBg0Tm
	adds r5, r0, r4
	adds r3, r0, #0
	ldr r0, _0809DBF0 @ =gBg1Tm
	mov r8, r0
	movs r4, #0x13
_0809DBB4:
	ldrh r0, [r7]
	strh r0, [r5]
	mov r2, r8
	adds r1, r3, r2
	ldr r2, _0809DBF4 @ =0x020133FC
	adds r0, r6, r2
	ldrh r0, [r0]
	strh r0, [r1]
	mov r0, sl
	adds r1, r3, r0
	mov r2, ip
	ldrh r0, [r2]
	strh r0, [r1]
	movs r0, #0x40
	add ip, r0
	adds r7, #0x40
	adds r6, #0x40
	adds r5, #0x40
	adds r3, #0x40
	subs r4, #1
	cmp r4, #0
	bge _0809DBB4
	b _0809DC20
	.align 2, 0
_0809DBE4: .4byte gBg2Tm
_0809DBE8: .4byte 0x02012BFC
_0809DBEC: .4byte gBg0Tm
_0809DBF0: .4byte gBg1Tm
_0809DBF4: .4byte 0x020133FC
_0809DBF8:
	adds r1, r4, #1
	mov sb, r1
	movs r3, #0
	lsls r0, r4, #1
	mov r4, sl
	adds r2, r0, r4
	ldr r4, _0809DC3C @ =gBg1Tm
	adds r1, r0, r4
	ldr r4, _0809DC40 @ =gBg0Tm
	adds r0, r0, r4
	movs r4, #0x13
_0809DC0E:
	strh r3, [r0]
	strh r3, [r1]
	strh r3, [r2]
	adds r2, #0x40
	adds r1, #0x40
	adds r0, #0x40
	subs r4, #1
	cmp r4, #0
	bge _0809DC0E
_0809DC20:
	mov r4, sb
	cmp r4, #0x1d
	ble _0809DB88
	movs r0, #7
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
_0809DC3C: .4byte gBg1Tm
_0809DC40: .4byte gBg0Tm

	thumb_func_start sub_809DC44
sub_809DC44: @ 0x0809DC44
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r7, r0, #0
	movs r0, #0x3a
	adds r0, r0, r7
	mov r8, r0
	ldrb r0, [r0]
	adds r0, #1
	movs r6, #0
	mov r1, r8
	strb r0, [r1]
	movs r4, #0xa
	subs r4, r4, r0
	lsls r0, r4, #3
	muls r0, r4, r0
	movs r1, #0x64
	bl __divsi3
	movs r5, #8
	subs r5, r5, r0
	lsls r0, r4, #4
	muls r0, r4, r0
	movs r1, #0x64
	bl __divsi3
	movs r4, #0x10
	subs r4, r4, r0
	rsbs r0, r5, #0
	lsls r0, r0, #3
	str r0, [r7, #0x30]
	adds r0, r5, #0
	bl sub_809DB74
	ldr r1, [r7, #0x30]
	adds r1, #0x38
	ldr r0, _0809DCE4 @ =0x000001FF
	ands r1, r0
	adds r0, r7, #0
	adds r0, #0x3f
	ldrb r2, [r0]
	movs r0, #0
	bl sub_8007B80
	ldr r3, _0809DCE8 @ =gDispIo
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
	strb r4, [r0]
	movs r0, #0x10
	subs r0, r0, r4
	adds r1, r3, #0
	adds r1, #0x45
	strb r0, [r1]
	adds r0, r3, #0
	adds r0, #0x46
	strb r6, [r0]
	mov r0, r8
	ldrb r0, [r0]
	cmp r0, #0xa
	bne _0809DCDA
	adds r0, r7, #0
	bl Proc_Break
	ldr r0, [r7, #0x2c]
	bl sub_809BA20
	str r0, [r7, #0x2c]
_0809DCDA:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0809DCE4: .4byte 0x000001FF
_0809DCE8: .4byte gDispIo

	thumb_func_start sub_809DCEC
sub_809DCEC: @ 0x0809DCEC
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	adds r7, r0, #0
	movs r0, #0x3a
	adds r0, r0, r7
	mov sb, r0
	ldrb r0, [r0]
	adds r0, #1
	movs r1, #0
	mov r8, r1
	mov r1, sb
	strb r0, [r1]
	movs r4, #0xa
	subs r4, r4, r0
	lsls r0, r4, #3
	muls r0, r4, r0
	movs r1, #0x64
	bl __divsi3
	adds r6, r0, #0
	movs r5, #8
	subs r6, r5, r6
	lsls r0, r4, #4
	muls r0, r4, r0
	movs r1, #0x64
	bl __divsi3
	movs r4, #0x10
	subs r4, r4, r0
	subs r5, r5, r6
	lsls r5, r5, #3
	str r5, [r7, #0x30]
	subs r6, #8
	adds r0, r6, #0
	bl sub_809DB74
	ldr r1, [r7, #0x30]
	adds r1, #0x38
	ldr r0, _0809DD90 @ =0x000001FF
	ands r1, r0
	adds r0, r7, #0
	adds r0, #0x3f
	ldrb r2, [r0]
	movs r0, #0
	bl sub_8007B80
	ldr r3, _0809DD94 @ =gDispIo
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
	adds r0, r3, #0
	adds r0, #0x45
	strb r4, [r0]
	adds r0, #1
	mov r1, r8
	strb r1, [r0]
	mov r0, sb
	ldrb r0, [r0]
	cmp r0, #0xa
	bne _0809DD82
	adds r0, r7, #0
	bl Proc_Break
_0809DD82:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0809DD90: .4byte 0x000001FF
_0809DD94: .4byte gDispIo

	thumb_func_start sub_809DD98
sub_809DD98: @ 0x0809DD98
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r7, r0, #0
	movs r0, #0x3a
	adds r0, r0, r7
	mov r8, r0
	ldrb r0, [r0]
	adds r0, #1
	movs r6, #0
	mov r1, r8
	strb r0, [r1]
	movs r4, #0xa
	subs r4, r4, r0
	lsls r0, r4, #3
	muls r0, r4, r0
	movs r1, #0x64
	bl __divsi3
	movs r5, #8
	subs r5, r5, r0
	lsls r0, r4, #4
	muls r0, r4, r0
	movs r1, #0x64
	bl __divsi3
	movs r4, #0x10
	subs r4, r4, r0
	lsls r0, r5, #3
	str r0, [r7, #0x30]
	rsbs r5, r5, #0
	adds r0, r5, #0
	bl sub_809DB74
	ldr r1, [r7, #0x30]
	adds r1, #0x38
	ldr r0, _0809DE38 @ =0x000001FF
	ands r1, r0
	adds r0, r7, #0
	adds r0, #0x3f
	ldrb r2, [r0]
	movs r0, #0
	bl sub_8007B80
	ldr r3, _0809DE3C @ =gDispIo
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
	strb r4, [r0]
	movs r0, #0x10
	subs r0, r0, r4
	adds r1, r3, #0
	adds r1, #0x45
	strb r0, [r1]
	adds r0, r3, #0
	adds r0, #0x46
	strb r6, [r0]
	mov r0, r8
	ldrb r0, [r0]
	cmp r0, #0xa
	bne _0809DE2E
	adds r0, r7, #0
	bl Proc_Break
	ldr r0, [r7, #0x2c]
	bl sub_809BA38
	str r0, [r7, #0x2c]
_0809DE2E:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0809DE38: .4byte 0x000001FF
_0809DE3C: .4byte gDispIo

	thumb_func_start sub_809DE40
sub_809DE40: @ 0x0809DE40
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	adds r7, r0, #0
	movs r0, #0x3a
	adds r0, r0, r7
	mov sb, r0
	ldrb r0, [r0]
	adds r0, #1
	movs r1, #0
	mov r8, r1
	mov r1, sb
	strb r0, [r1]
	movs r4, #0xa
	subs r4, r4, r0
	lsls r0, r4, #3
	muls r0, r4, r0
	movs r1, #0x64
	bl __divsi3
	adds r5, r0, #0
	movs r6, #8
	subs r5, r6, r5
	lsls r0, r4, #4
	muls r0, r4, r0
	movs r1, #0x64
	bl __divsi3
	movs r4, #0x10
	subs r4, r4, r0
	adds r0, r5, #0
	subs r0, #8
	lsls r0, r0, #3
	str r0, [r7, #0x30]
	subs r6, r6, r5
	adds r0, r6, #0
	bl sub_809DB74
	ldr r1, [r7, #0x30]
	adds r1, #0x38
	ldr r0, _0809DEE4 @ =0x000001FF
	ands r1, r0
	adds r0, r7, #0
	adds r0, #0x3f
	ldrb r2, [r0]
	movs r0, #0
	bl sub_8007B80
	ldr r3, _0809DEE8 @ =gDispIo
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
	adds r0, r3, #0
	adds r0, #0x45
	strb r4, [r0]
	adds r0, #1
	mov r1, r8
	strb r1, [r0]
	mov r0, sb
	ldrb r0, [r0]
	cmp r0, #0xa
	bne _0809DED8
	adds r0, r7, #0
	bl Proc_Break
_0809DED8:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0809DEE4: .4byte 0x000001FF
_0809DEE8: .4byte gDispIo

	thumb_func_start sub_809DEEC
sub_809DEEC: @ 0x0809DEEC
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	bl InitFaces
	bl ResetText
	bl InitIcons
	ldr r0, _0809DF9C @ =gBg0Tm
	movs r1, #0
	bl TmFill
	ldr r4, _0809DFA0 @ =gBg1Tm
	adds r0, r4, #0
	movs r1, #0
	bl TmFill
	ldr r0, _0809DFA4 @ =gBg2Tm
	movs r1, #0
	bl TmFill
	adds r2, r5, #0
	adds r2, #0x39
	movs r0, #0xfc
	ldrb r1, [r2]
	ands r0, r1
	movs r1, #0xe3
	ands r0, r1
	strb r0, [r2]
	ldr r0, [r5, #0x2c]
	bl sub_809BAB8
	bl sub_809CEA8
	adds r1, r5, #0
	adds r1, #0x3c
	strb r0, [r1]
	adds r0, r5, #0
	bl InitSupportSubScreenPartners
	adds r0, r5, #0
	bl sub_809D420
	adds r0, r5, #0
	bl sub_809D450
	adds r0, r5, #0
	movs r1, #0
	movs r2, #1
	bl sub_809D528
	ldr r1, _0809DFA8 @ =gUnk_0842C3C0
	movs r2, #0xa4
	lsls r2, r2, #7
	adds r0, r4, #0
	bl TmApplyTsa_thm
	ldr r4, _0809DFAC @ =gCharacterData
	ldr r0, [r5, #0x2c]
	bl sub_809BAB8
	subs r0, #1
	movs r1, #0x34
	muls r0, r1, r0
	adds r0, r0, r4
	ldrh r4, [r0, #6]
	adds r0, r4, #0
	bl ShouldFaceBeRaised
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0809DFB0
	adds r1, r5, #0
	adds r1, #0x3f
	movs r0, #0
	strb r0, [r1]
	movs r0, #0x80
	lsls r0, r0, #1
	str r0, [sp]
	movs r0, #0
	adds r1, r4, #0
	movs r2, #0x38
	movs r3, #0
	bl StartBmFace
	b _0809DFC8
	.align 2, 0
_0809DF9C: .4byte gBg0Tm
_0809DFA0: .4byte gBg1Tm
_0809DFA4: .4byte gBg2Tm
_0809DFA8: .4byte gUnk_0842C3C0
_0809DFAC: .4byte gCharacterData
_0809DFB0:
	adds r1, r5, #0
	adds r1, #0x3f
	movs r0, #8
	strb r0, [r1]
	adds r0, #0xfc
	str r0, [sp]
	movs r0, #0
	adds r1, r4, #0
	movs r2, #0x38
	movs r3, #8
	bl StartBmFace
_0809DFC8:
	adds r0, r5, #0
	bl sub_809D4D0
	adds r0, r5, #0
	bl sub_809D1C8
	bl sub_809CE20
	adds r1, r5, #0
	adds r1, #0x3a
	movs r0, #0
	strb r0, [r1]
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start sub_809DFE8
sub_809DFE8: @ 0x0809DFE8
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r0, _0809E0B4 @ =gDispIo
	mov ip, r0
	movs r1, #4
	rsbs r1, r1, #0
	adds r0, r1, #0
	mov r2, ip
	ldrb r2, [r2, #0xc]
	ands r0, r2
	movs r3, #1
	orrs r0, r3
	mov r5, ip
	strb r0, [r5, #0xc]
	movs r2, #3
	ldrb r0, [r5, #0x10]
	orrs r0, r2
	strb r0, [r5, #0x10]
	ldrb r0, [r5, #0x14]
	ands r1, r0
	orrs r1, r3
	strb r1, [r5, #0x14]
	ldrb r1, [r5, #0x18]
	orrs r2, r1
	strb r2, [r5, #0x18]
	mov r2, ip
	adds r2, #0x3c
	movs r0, #0x3f
	ldrb r3, [r2]
	ands r0, r3
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r2]
	mov r0, ip
	adds r0, #0x44
	movs r1, #0
	strb r1, [r0]
	mov r3, ip
	adds r3, #0x45
	movs r0, #0xc
	strb r0, [r3]
	mov r0, ip
	adds r0, #0x46
	strb r1, [r0]
	ldr r0, _0809E0B8 @ =0x0000FFE0
	ldrh r5, [r5, #0x3c]
	ands r0, r5
	ldr r1, _0809E0BC @ =0x0000E0FF
	ands r0, r1
	movs r3, #0xf8
	lsls r3, r3, #5
	adds r1, r3, #0
	orrs r0, r1
	mov r5, ip
	strh r0, [r5, #0x3c]
	movs r1, #0x21
	rsbs r1, r1, #0
	adds r0, r1, #0
	ldrb r3, [r2]
	ands r0, r3
	strb r0, [r2]
	mov r0, ip
	adds r0, #0x3d
	ldrb r5, [r0]
	ands r1, r5
	strb r1, [r0]
	adds r0, r4, #0
	adds r0, #0x38
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne _0809E0AE
	adds r0, r4, #0
	adds r0, #0x3b
	ldrb r0, [r0]
	cmp r0, #0
	beq _0809E0AE
	adds r0, r4, #0
	adds r0, #0x39
	ldrb r1, [r0]
	movs r0, #3
	ands r0, r1
	lsls r0, r0, #3
	adds r0, #0xc4
	lsrs r1, r1, #2
	movs r2, #7
	ands r1, r2
	lsls r1, r1, #4
	adds r1, #0x18
	movs r3, #0x80
	lsls r3, r3, #4
	movs r2, #1
	bl ShowSysHandCursor
	adds r1, r4, #0
	adds r1, #0x3a
	movs r0, #0xff
	strb r0, [r1]
_0809E0AE:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0809E0B4: .4byte gDispIo
_0809E0B8: .4byte 0x0000FFE0
_0809E0BC: .4byte 0x0000E0FF

	thumb_func_start sub_809E0C0
sub_809E0C0: @ 0x0809E0C0
	push {r4, lr}
	adds r4, r0, #0
	bl EndAllProcChildren
	bl EndMuralBackground_
	movs r0, #0
	bl EndFaceById
	ldr r0, [r4, #0x2c]
	bl sub_809C92C
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_809E0E0
sub_809E0E0: @ 0x0809E0E0
	push {r4, lr}
	sub sp, #4
	adds r4, r0, #0
	ldr r0, [r4, #0x2c]
	adds r1, r4, #0
	adds r1, #0x39
	ldrb r3, [r1]
	lsrs r1, r3, #2
	movs r2, #7
	ands r1, r2
	movs r2, #3
	ands r2, r3
	adds r2, #1
	bl sub_809C948
	adds r4, #0x3e
	movs r3, #0
	strb r0, [r4]
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0809E11C
	movs r1, #0x80
	lsls r1, r1, #1
	str r3, [sp]
	movs r0, #0x30
	movs r2, #0x80
	movs r3, #0x10
	bl CallSomeSoundMaybe
	b _0809E12C
_0809E11C:
	ldrb r0, [r4]
	movs r2, #0x80
	lsls r2, r2, #1
	str r3, [sp]
	adds r1, r2, #0
	movs r3, #0x10
	bl CallSomeSoundMaybe
_0809E12C:
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_809E134
sub_809E134: @ 0x0809E134
	push {lr}
	sub sp, #4
	adds r0, #0x3e
	ldrb r0, [r0]
	cmp r0, #0
	bne _0809E152
	movs r2, #0x80
	lsls r2, r2, #1
	str r0, [sp]
	movs r0, #0x30
	movs r1, #0x80
	movs r3, #0x10
	bl CallSomeSoundMaybe
	b _0809E164
_0809E152:
	movs r2, #0x80
	lsls r2, r2, #1
	movs r0, #0
	str r0, [sp]
	movs r0, #0x30
	adds r1, r2, #0
	movs r3, #0x10
	bl CallSomeSoundMaybe
_0809E164:
	add sp, #4
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_809E16C
sub_809E16C: @ 0x0809E16C
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r1, r2, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	ldr r0, _0809E18C @ =gUnk_08D8DEF8
	bl Proc_StartBlocking
	adds r1, r0, #0
	adds r1, #0x38
	strb r4, [r1]
	str r5, [r0, #0x2c]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0809E18C: .4byte gUnk_08D8DEF8

	thumb_func_start sub_809E190
sub_809E190: @ 0x0809E190
	push {r4, lr}
	ldrb r3, [r1]
	str r3, [r0, #8]
	ldrb r4, [r1, #2]
	lsls r2, r4, #8
	ldrb r1, [r1, #1]
	orrs r2, r1
	str r2, [r0, #4]
	str r3, [r0, #0xc]
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_809E1A8
sub_809E1A8: @ 0x0809E1A8
	ldr r2, [r0, #8]
	strb r2, [r1]
	ldr r0, [r0, #4]
	strb r0, [r1, #1]
	asrs r0, r0, #0x10
	strb r0, [r1, #2]
	bx lr
	.align 2, 0

	thumb_func_start sub_809E1B8
sub_809E1B8: @ 0x0809E1B8
	adds r2, r0, #0
	ldr r1, [r2, #0xc]
	movs r0, #0xd
	muls r0, r1, r0
	adds r0, #1
	movs r1, #0xff
	ands r0, r1
	str r0, [r2, #0xc]
	bx lr
	.align 2, 0

	thumb_func_start sub_809E1CC
sub_809E1CC: @ 0x0809E1CC
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	adds r7, r1, #0
	ldr r0, _0809E208 @ =0x020143FC
	str r4, [r0]
	ldr r1, _0809E20C @ =0x02014400
	movs r0, #1
	lsls r0, r4
	subs r0, #1
	str r0, [r1]
	ldr r6, _0809E210 @ =0x02014404
	movs r0, #0x1e
	adds r1, r4, #0
	bl __divsi3
	adds r5, r0, #0
	str r5, [r6]
	movs r0, #0x1e
	adds r1, r4, #0
	bl __modsi3
	cmp r0, #0
	ble _0809E1FE
	adds r0, r5, #1
	str r0, [r6]
_0809E1FE:
	ldr r0, _0809E214 @ =0x02014408
	str r7, [r0]
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0809E208: .4byte 0x020143FC
_0809E20C: .4byte 0x02014400
_0809E210: .4byte 0x02014404
_0809E214: .4byte 0x02014408

	thumb_func_start sub_809E218
sub_809E218: @ 0x0809E218
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	ldr r0, _0809E240 @ =0x020143FC
	ldr r4, [r0]
	adds r0, r5, #0
	adds r1, r4, #0
	bl __divsi3
	adds r6, r0, #0
	adds r0, r5, #0
	adds r1, r4, #0
	bl __modsi3
	cmp r0, #0
	ble _0809E238
	adds r6, #1
_0809E238:
	adds r0, r6, #0
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_0809E240: .4byte 0x020143FC

	thumb_func_start sub_809E244
sub_809E244: @ 0x0809E244
	ldr r2, _0809E258 @ =0x02014434
	ldr r1, [r2]
	movs r0, #0xd
	muls r0, r1, r0
	adds r0, #1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [r2]
	bx lr
	.align 2, 0
_0809E258: .4byte 0x02014434

	thumb_func_start sub_809E25C
sub_809E25C: @ 0x0809E25C
	push {r4, r5, r6, lr}
	movs r4, #0
	ldr r1, _0809E290 @ =0x02014404
	ldr r0, [r1]
	cmp r4, r0
	bge _0809E288
	ldr r6, _0809E294 @ =0x02014438
	adds r5, r1, #0
_0809E26C:
	ldr r0, [r5]
	adds r0, r4, r0
	lsls r1, r4, #1
	adds r0, r0, r1
	adds r0, r0, r6
	ldrb r3, [r0]
	adds r2, r4, r6
	ldrb r1, [r2]
	strb r1, [r0]
	strb r3, [r2]
	adds r4, #1
	ldr r0, [r5]
	cmp r4, r0
	blt _0809E26C
_0809E288:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0809E290: .4byte 0x02014404
_0809E294: .4byte 0x02014438

	thumb_func_start sub_809E298
sub_809E298: @ 0x0809E298
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	str r0, [sp]
	mov sl, r1
	mov r8, r2
	mov sb, r3
	bl sub_809E244
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	add r8, r0
	movs r0, #1
	mov r1, sb
	lsls r0, r1
	subs r0, #1
	mov r1, r8
	ands r1, r0
	mov r8, r1
	movs r2, #0
	cmp r2, sb
	bge _0809E318
_0809E2CA:
	ldr r0, _0809E328 @ =0x020143FC
	mov r1, sl
	ldr r6, [r1]
	ldr r4, [r0]
	adds r0, r6, #0
	adds r1, r4, #0
	str r2, [sp, #4]
	bl __divsi3
	ldr r1, [sp]
	adds r7, r1, r0
	movs r5, #1
	ldr r2, [sp, #4]
	lsls r5, r2
	mov r0, r8
	ands r5, r0
	asrs r5, r2
	adds r0, r6, #0
	adds r1, r4, #0
	bl __modsi3
	adds r1, r0, #0
	ldr r2, [sp, #4]
	cmp r1, #0
	bge _0809E2FE
	adds r0, r1, #7
_0809E2FE:
	asrs r0, r0, #3
	lsls r0, r0, #3
	subs r0, r1, r0
	lsls r5, r0
	ldrb r1, [r7]
	orrs r5, r1
	strb r5, [r7]
	adds r0, r6, #1
	mov r1, sl
	str r0, [r1]
	adds r2, #1
	cmp r2, sb
	blt _0809E2CA
_0809E318:
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0809E328: .4byte 0x020143FC

	thumb_func_start sub_809E32C
sub_809E32C: @ 0x0809E32C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	str r0, [sp]
	mov r8, r1
	mov sb, r2
	movs r0, #0
	mov sl, r0
	movs r7, #0
	cmp sl, sb
	bge _0809E390
_0809E348:
	ldr r0, _0809E3B8 @ =0x020143FC
	mov r1, r8
	ldr r6, [r1]
	ldr r4, [r0]
	adds r0, r6, #0
	adds r1, r4, #0
	bl __divsi3
	ldr r2, [sp]
	adds r0, r2, r0
	ldrb r5, [r0]
	adds r0, r6, #0
	adds r1, r4, #0
	bl __modsi3
	adds r1, r0, #0
	cmp r1, #0
	bge _0809E36E
	adds r0, r1, #7
_0809E36E:
	asrs r0, r0, #3
	lsls r0, r0, #3
	subs r0, r1, r0
	movs r1, #1
	lsls r1, r0
	ands r5, r1
	asrs r5, r0
	lsls r5, r7
	mov r0, sl
	orrs r0, r5
	mov sl, r0
	adds r0, r6, #1
	mov r1, r8
	str r0, [r1]
	adds r7, #1
	cmp r7, sb
	blt _0809E348
_0809E390:
	bl sub_809E244
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov r2, sl
	subs r0, r2, r0
	movs r1, #1
	mov r2, sb
	lsls r1, r2
	subs r1, #1
	ands r0, r1
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0809E3B8: .4byte 0x020143FC

	thumb_func_start sub_809E3BC
sub_809E3BC: @ 0x0809E3BC
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r3, r1, #0
	movs r2, #0
	movs r1, #0
	cmp r2, r3
	bge _0809E3E2
_0809E3CA:
	adds r0, r4, r1
	ldrb r6, [r0]
	adds r5, r6, #0
	muls r5, r6, r5
	adds r0, r5, #0
	adds r1, #1
	muls r0, r1, r0
	adds r0, r2, r0
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	cmp r1, r3
	blt _0809E3CA
_0809E3E2:
	lsrs r0, r2, #8
	adds r0, r2, r0
	asrs r1, r2, #0x10
	adds r0, r0, r1
	ldr r2, _0809E3F8 @ =0x000003FF
	adds r1, r2, #0
	ands r0, r1
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_0809E3F8: .4byte 0x000003FF

	thumb_func_start sub_809E3FC
sub_809E3FC: @ 0x0809E3FC
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	movs r6, #0
	ldr r0, _0809E434 @ =0x02014404
	ldr r0, [r0]
	ldr r5, _0809E438 @ =0x02014438
	adds r0, r0, r5
	ldr r4, _0809E43C @ =0x020144D8
	ldrh r1, [r4, #6]
	bl sub_809E3BC
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov sb, r0
	adds r7, r5, #0
	mov r8, r4
_0809E420:
	adds r0, r6, #0
	movs r1, #3
	bl __modsi3
	adds r5, r0, #0
	cmp r5, #0
	bne _0809E440
	mov r0, r8
	ldrh r4, [r0]
	b _0809E458
	.align 2, 0
_0809E434: .4byte 0x02014404
_0809E438: .4byte 0x02014438
_0809E43C: .4byte 0x020144D8
_0809E440:
	cmp r5, #1
	bne _0809E454
	mov r0, r8
	ldrh r4, [r0, #2]
	adds r0, r6, #0
	movs r1, #3
	bl __divsi3
	adds r1, r5, #0
	b _0809E462
_0809E454:
	mov r0, r8
	ldrh r4, [r0, #4]
_0809E458:
	adds r0, r6, #0
	movs r1, #3
	bl __divsi3
	movs r1, #1
_0809E462:
	lsls r1, r0
	ands r4, r1
	asrs r4, r0
	ldr r5, _0809E4C0 @ =0x020143FC
	ldr r1, [r5]
	adds r0, r6, #0
	bl __modsi3
	lsls r4, r0
	ldrb r0, [r7]
	orrs r4, r0
	strb r4, [r7]
	adds r6, #1
	ldr r1, [r5]
	adds r0, r6, #0
	bl __modsi3
	cmp r0, #0
	bne _0809E48A
	adds r7, #1
_0809E48A:
	cmp r6, #0x1e
	bne _0809E420
	movs r2, #0
	ldr r3, _0809E4C4 @ =0x02014404
	ldr r0, [r3]
	cmp r2, r0
	bge _0809E4B0
	ldr r5, _0809E4C8 @ =0x02014438
	ldr r4, _0809E4CC @ =0x02014400
_0809E49C:
	adds r0, r2, r5
	ldrb r1, [r0]
	add r1, sb
	ldrb r6, [r4]
	ands r1, r6
	strb r1, [r0]
	adds r2, #1
	ldr r0, [r3]
	cmp r2, r0
	blt _0809E49C
_0809E4B0:
	bl sub_809E25C
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0809E4C0: .4byte 0x020143FC
_0809E4C4: .4byte 0x02014404
_0809E4C8: .4byte 0x02014438
_0809E4CC: .4byte 0x02014400

	thumb_func_start sub_809E4D0
sub_809E4D0: @ 0x0809E4D0
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	movs r0, #0
	mov sl, r0
	movs r7, #0
	bl sub_809E25C
	ldr r4, _0809E568 @ =0x02014404
	ldr r0, [r4]
	ldr r5, _0809E56C @ =0x02014438
	adds r0, r0, r5
	ldr r1, _0809E570 @ =0x020144D8
	ldrh r1, [r1, #6]
	bl sub_809E3BC
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	movs r2, #0
	ldr r0, [r4]
	cmp sl, r0
	bge _0809E51A
	mov r8, r5
	ldr r5, _0809E574 @ =0x02014400
_0809E504:
	mov r1, r8
	adds r0, r2, r1
	ldrb r6, [r0]
	subs r1, r6, r3
	ldrb r6, [r5]
	ands r1, r6
	strb r1, [r0]
	adds r2, #1
	ldr r0, [r4]
	cmp r2, r0
	blt _0809E504
_0809E51A:
	ldr r0, _0809E570 @ =0x020144D8
	movs r1, #0
	strh r1, [r0]
	strh r1, [r0, #2]
	strh r1, [r0, #4]
	ldr r1, _0809E56C @ =0x02014438
	ldr r2, _0809E578 @ =0x020143FC
	mov sb, r2
	mov r8, r0
	mov r0, sl
	adds r6, r0, r1
_0809E530:
	adds r0, r7, #0
	movs r1, #3
	bl __modsi3
	adds r5, r0, #0
	cmp r5, #0
	bne _0809E57C
	ldrb r4, [r6]
	mov r2, sb
	ldr r1, [r2]
	adds r0, r7, #0
	bl __modsi3
	asrs r4, r0
	movs r0, #1
	ands r4, r0
	adds r0, r7, #0
	movs r1, #3
	bl __divsi3
	lsls r4, r0
	mov r0, r8
	ldrh r0, [r0]
	orrs r4, r0
	mov r1, r8
	strh r4, [r1]
	b _0809E5CC
	.align 2, 0
_0809E568: .4byte 0x02014404
_0809E56C: .4byte 0x02014438
_0809E570: .4byte 0x020144D8
_0809E574: .4byte 0x02014400
_0809E578: .4byte 0x020143FC
_0809E57C:
	cmp r5, #1
	bne _0809E5A6
	ldrb r4, [r6]
	mov r2, sb
	ldr r1, [r2]
	adds r0, r7, #0
	bl __modsi3
	asrs r4, r0
	ands r4, r5
	adds r0, r7, #0
	movs r1, #3
	bl __divsi3
	lsls r4, r0
	mov r0, r8
	ldrh r0, [r0, #2]
	orrs r4, r0
	mov r1, r8
	strh r4, [r1, #2]
	b _0809E5CC
_0809E5A6:
	ldrb r4, [r6]
	mov r2, sb
	ldr r1, [r2]
	adds r0, r7, #0
	bl __modsi3
	asrs r4, r0
	movs r0, #1
	ands r4, r0
	adds r0, r7, #0
	movs r1, #3
	bl __divsi3
	lsls r4, r0
	mov r0, r8
	ldrh r0, [r0, #4]
	orrs r4, r0
	mov r1, r8
	strh r4, [r1, #4]
_0809E5CC:
	adds r7, #1
	mov r2, sb
	ldr r1, [r2]
	adds r0, r7, #0
	bl __modsi3
	cmp r0, #0
	bne _0809E5DE
	adds r6, #1
_0809E5DE:
	cmp r7, #0x1e
	bne _0809E530
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_809E5F0
sub_809E5F0: @ 0x0809E5F0
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r3, r0, #0
	movs r0, #0
	str r0, [sp]
	ldr r6, _0809E6A8 @ =0x02014438
	ldr r5, _0809E6AC @ =0x02014404
	adds r2, r6, #0
	movs r1, #0
	adds r0, r6, #0
	adds r0, #0x9f
_0809E606:
	strb r1, [r0]
	subs r0, #1
	cmp r0, r2
	bge _0809E606
	ldr r1, [r5]
	adds r1, r1, r6
	mov r0, sp
	bl _call_via_r3
	ldr r0, [sp]
	bl sub_809E218
	ldr r4, _0809E6B0 @ =0x020144D8
	strh r0, [r4, #6]
	ldr r0, [r5]
	adds r0, r0, r6
	ldrh r1, [r4, #6]
	bl sub_809E3BC
	strh r0, [r4, #2]
	bl GetGameTime
	lsrs r0, r0, #3
	ldrh r1, [r4, #2]
	adds r0, r1, r0
	ldr r5, _0809E6B4 @ =0x000003FF
	ands r0, r5
	strh r0, [r4]
	ldr r1, _0809E6B8 @ =0x02014434
	ldrh r0, [r4]
	str r0, [r1]
	bl sub_809E244
	ldrh r1, [r4, #2]
	adds r0, r0, r1
	ands r0, r5
	strh r0, [r4, #2]
	movs r5, #0
	ldrh r4, [r4, #6]
	cmp r5, r4
	bge _0809E67C
	adds r4, r6, #0
_0809E65A:
	bl sub_809E244
	ldr r1, _0809E6AC @ =0x02014404
	ldr r2, [r1]
	adds r2, r5, r2
	adds r2, r2, r4
	ldrb r1, [r2]
	adds r0, r1, r0
	ldr r1, _0809E6BC @ =0x02014400
	ldrb r1, [r1]
	ands r0, r1
	strb r0, [r2]
	adds r5, #1
	ldr r0, _0809E6B0 @ =0x020144D8
	ldrh r0, [r0, #6]
	cmp r5, r0
	blt _0809E65A
_0809E67C:
	ldr r0, _0809E6AC @ =0x02014404
	ldr r0, [r0]
	ldr r1, _0809E6A8 @ =0x02014438
	adds r0, r0, r1
	ldr r5, _0809E6B0 @ =0x020144D8
	ldrh r1, [r5, #6]
	bl sub_809E3BC
	adds r4, r0, #0
	bl sub_809E244
	adds r4, r4, r0
	ldr r1, _0809E6B4 @ =0x000003FF
	adds r0, r1, #0
	ands r4, r0
	strh r4, [r5, #4]
	bl sub_809E3FC
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0809E6A8: .4byte 0x02014438
_0809E6AC: .4byte 0x02014404
_0809E6B0: .4byte 0x020144D8
_0809E6B4: .4byte 0x000003FF
_0809E6B8: .4byte 0x02014434
_0809E6BC: .4byte 0x02014400

	thumb_func_start sub_809E6C0
sub_809E6C0: @ 0x0809E6C0
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #8
	mov sb, r0
	movs r0, #0
	str r0, [sp, #4]
	bl sub_809E4D0
	ldr r1, _0809E76C @ =0x02014434
	ldr r4, _0809E770 @ =0x020144D8
	ldrh r0, [r4]
	str r0, [r1]
	ldr r0, _0809E774 @ =0x02014404
	ldr r0, [r0]
	ldr r7, _0809E778 @ =0x02014438
	adds r0, r0, r7
	ldrh r1, [r4, #6]
	bl sub_809E3BC
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	bl sub_809E244
	mov r1, sp
	strh r0, [r1]
	movs r5, #0
	add r0, sp, #4
	mov r8, r0
	ldrh r4, [r4, #6]
	cmp r5, r4
	bge _0809E726
	adds r4, r7, #0
_0809E704:
	bl sub_809E244
	ldr r1, _0809E774 @ =0x02014404
	ldr r2, [r1]
	adds r2, r5, r2
	adds r2, r2, r4
	ldrb r1, [r2]
	subs r0, r1, r0
	ldr r1, _0809E77C @ =0x02014400
	ldrb r1, [r1]
	ands r0, r1
	strb r0, [r2]
	adds r5, #1
	ldr r0, _0809E770 @ =0x020144D8
	ldrh r0, [r0, #6]
	cmp r5, r0
	blt _0809E704
_0809E726:
	bl sub_809E244
	mov r1, sp
	strh r0, [r1, #2]
	ldr r5, _0809E774 @ =0x02014404
	ldr r1, [r5]
	ldr r4, _0809E778 @ =0x02014438
	adds r1, r1, r4
	mov r0, r8
	bl _call_via_r9
	ldr r0, [r5]
	adds r0, r0, r4
	ldr r4, _0809E770 @ =0x020144D8
	ldrh r1, [r4, #6]
	bl sub_809E3BC
	mov r1, sp
	ldrh r1, [r1]
	adds r0, r1, r0
	ldr r1, _0809E780 @ =0x000003FF
	adds r2, r1, #0
	ands r0, r2
	mov r1, sp
	ldrh r1, [r1, #2]
	adds r6, r6, r1
	ands r6, r2
	ldrh r1, [r4, #2]
	cmp r1, r0
	bne _0809E768
	ldrh r4, [r4, #4]
	cmp r4, r6
	beq _0809E784
_0809E768:
	movs r0, #0
	b _0809E786
	.align 2, 0
_0809E76C: .4byte 0x02014434
_0809E770: .4byte 0x020144D8
_0809E774: .4byte 0x02014404
_0809E778: .4byte 0x02014438
_0809E77C: .4byte 0x02014400
_0809E780: .4byte 0x000003FF
_0809E784:
	movs r0, #1
_0809E786:
	add sp, #8
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	thumb_func_start sub_809E794
sub_809E794: @ 0x0809E794
	adds r3, r0, #0
	movs r2, #0
	movs r0, #0
	ldrsb r0, [r1, r0]
	cmp r0, #0
	beq _0809E7BA
	ldrh r3, [r3]
_0809E7A2:
	ldrh r0, [r1]
	cmp r0, r3
	bne _0809E7AE
	lsls r0, r2, #0x10
	lsrs r0, r0, #0x10
	b _0809E7BC
_0809E7AE:
	adds r1, #2
	adds r2, #1
	movs r0, #0
	ldrsb r0, [r1, r0]
	cmp r0, #0
	bne _0809E7A2
_0809E7BA:
	ldr r0, _0809E7C0 @ =0x0000FFFF
_0809E7BC:
	bx lr
	.align 2, 0
_0809E7C0: .4byte 0x0000FFFF

	thumb_func_start sub_809E7C4
sub_809E7C4: @ 0x0809E7C4
	push {r4, r5, r6, lr}
	adds r2, r0, #0
	adds r6, r1, #0
	movs r5, #0
	movs r0, #0
	ldrsb r0, [r2, r0]
	cmp r0, #0
	beq _0809E7F0
	adds r4, r2, #0
_0809E7D6:
	adds r0, r4, #0
	adds r1, r6, #0
	bl sub_809E794
	ldr r1, _0809E7F8 @ =0x02014438
	adds r1, r5, r1
	strb r0, [r1]
	adds r4, #2
	adds r5, #1
	movs r0, #0
	ldrsb r0, [r4, r0]
	cmp r0, #0
	bne _0809E7D6
_0809E7F0:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0809E7F8: .4byte 0x02014438

	thumb_func_start sub_809E7FC
sub_809E7FC: @ 0x0809E7FC
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	adds r5, r1, #0
	ldr r1, _0809E8E4 @ =0x02014434
	ldr r0, _0809E8E8 @ =0x02014408
	ldr r0, [r0]
	str r0, [r1]
	ldr r4, _0809E8EC @ =0x020144E0
	ldrb r2, [r4]
	adds r0, r5, #0
	adds r1, r6, #0
	movs r3, #2
	bl sub_809E298
	ldrb r2, [r4, #1]
	adds r0, r5, #0
	adds r1, r6, #0
	movs r3, #1
	bl sub_809E298
	ldrb r2, [r4, #2]
	adds r0, r5, #0
	adds r1, r6, #0
	movs r3, #1
	bl sub_809E298
	ldrb r2, [r4, #0xa]
	adds r0, r5, #0
	adds r1, r6, #0
	movs r3, #8
	bl sub_809E298
	bl GetGameTime
	adds r2, r0, #0
	adds r0, r5, #0
	adds r1, r6, #0
	movs r3, #5
	bl sub_809E298
	ldrb r2, [r4, #3]
	adds r0, r5, #0
	adds r1, r6, #0
	movs r3, #3
	bl sub_809E298
	ldrb r2, [r4, #4]
	adds r0, r5, #0
	adds r1, r6, #0
	movs r3, #3
	bl sub_809E298
	ldrb r2, [r4, #5]
	adds r0, r5, #0
	adds r1, r6, #0
	movs r3, #3
	bl sub_809E298
	ldrb r2, [r4, #6]
	adds r0, r5, #0
	adds r1, r6, #0
	movs r3, #3
	bl sub_809E298
	ldrb r2, [r4, #7]
	adds r0, r5, #0
	adds r1, r6, #0
	movs r3, #3
	bl sub_809E298
	ldrb r2, [r4, #9]
	adds r0, r5, #0
	adds r1, r6, #0
	movs r3, #8
	bl sub_809E298
	ldrb r2, [r4, #8]
	adds r0, r5, #0
	adds r1, r6, #0
	movs r3, #6
	bl sub_809E298
	ldrh r2, [r4, #0xc]
	adds r0, r5, #0
	adds r1, r6, #0
	movs r3, #0xa
	bl sub_809E298
	ldrb r2, [r4, #0xe]
	adds r0, r5, #0
	adds r1, r6, #0
	movs r3, #6
	bl sub_809E298
	ldrb r2, [r4, #0xf]
	adds r0, r5, #0
	adds r1, r6, #0
	movs r3, #6
	bl sub_809E298
	ldrb r2, [r4, #0xb]
	adds r0, r5, #0
	adds r1, r6, #0
	movs r3, #8
	bl sub_809E298
	ldr r2, [r4, #0x10]
	adds r0, r5, #0
	adds r1, r6, #0
	movs r3, #0x18
	bl sub_809E298
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0809E8E4: .4byte 0x02014434
_0809E8E8: .4byte 0x02014408
_0809E8EC: .4byte 0x020144E0

	thumb_func_start sub_809E8F0
sub_809E8F0: @ 0x0809E8F0
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	adds r4, r1, #0
	ldr r1, _0809E9D0 @ =0x02014434
	ldr r0, _0809E9D4 @ =0x02014408
	ldr r0, [r0]
	str r0, [r1]
	adds r0, r4, #0
	adds r1, r6, #0
	movs r2, #2
	bl sub_809E32C
	ldr r5, _0809E9D8 @ =0x020144E0
	strb r0, [r5]
	adds r0, r4, #0
	adds r1, r6, #0
	movs r2, #1
	bl sub_809E32C
	strb r0, [r5, #1]
	adds r0, r4, #0
	adds r1, r6, #0
	movs r2, #1
	bl sub_809E32C
	strb r0, [r5, #2]
	adds r0, r4, #0
	adds r1, r6, #0
	movs r2, #8
	bl sub_809E32C
	strb r0, [r5, #0xa]
	adds r0, r4, #0
	adds r1, r6, #0
	movs r2, #5
	bl sub_809E32C
	adds r0, r4, #0
	adds r1, r6, #0
	movs r2, #3
	bl sub_809E32C
	strb r0, [r5, #3]
	adds r0, r4, #0
	adds r1, r6, #0
	movs r2, #3
	bl sub_809E32C
	strb r0, [r5, #4]
	adds r0, r4, #0
	adds r1, r6, #0
	movs r2, #3
	bl sub_809E32C
	strb r0, [r5, #5]
	adds r0, r4, #0
	adds r1, r6, #0
	movs r2, #3
	bl sub_809E32C
	strb r0, [r5, #6]
	adds r0, r4, #0
	adds r1, r6, #0
	movs r2, #3
	bl sub_809E32C
	strb r0, [r5, #7]
	adds r0, r4, #0
	adds r1, r6, #0
	movs r2, #8
	bl sub_809E32C
	strb r0, [r5, #9]
	adds r0, r4, #0
	adds r1, r6, #0
	movs r2, #6
	bl sub_809E32C
	strb r0, [r5, #8]
	adds r0, r4, #0
	adds r1, r6, #0
	movs r2, #0xa
	bl sub_809E32C
	strh r0, [r5, #0xc]
	adds r0, r4, #0
	adds r1, r6, #0
	movs r2, #6
	bl sub_809E32C
	strb r0, [r5, #0xe]
	adds r0, r4, #0
	adds r1, r6, #0
	movs r2, #6
	bl sub_809E32C
	strb r0, [r5, #0xf]
	adds r0, r4, #0
	adds r1, r6, #0
	movs r2, #8
	bl sub_809E32C
	strb r0, [r5, #0xb]
	adds r0, r4, #0
	adds r1, r6, #0
	movs r2, #0x18
	bl sub_809E32C
	str r0, [r5, #0x10]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0809E9D0: .4byte 0x02014434
_0809E9D4: .4byte 0x02014408
_0809E9D8: .4byte 0x020144E0

	thumb_func_start sub_809E9DC
sub_809E9DC: @ 0x0809E9DC
	push {r4, r5, r6, lr}
	sub sp, #0x1c
	adds r5, r0, #0
	adds r6, r1, #0
	add r0, sp, #0x18
	movs r1, #0
	strh r1, [r0]
	ldr r4, _0809EA94 @ =0x020144E0
	ldr r2, _0809EA98 @ =0x0100000A
	adds r1, r4, #0
	bl CpuSet
	mov r0, sp
	adds r1, r5, #0
	adds r2, r6, #0
	bl sub_809FC60
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0809EAA0
	strb r5, [r4]
	strb r6, [r4, #2]
	mov r0, sp
	ldrb r0, [r0]
	lsls r0, r0, #0x19
	lsrs r0, r0, #0x1d
	strb r0, [r4, #3]
	mov r0, sp
	ldrh r0, [r0]
	lsls r0, r0, #0x16
	lsrs r0, r0, #0x1d
	strb r0, [r4, #4]
	mov r0, sp
	ldrb r1, [r0, #1]
	lsls r0, r1, #0x1b
	lsrs r0, r0, #0x1d
	strb r0, [r4, #5]
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x1d
	strb r1, [r4, #6]
	strb r1, [r4, #7]
	mov r0, sp
	ldrh r0, [r0, #2]
	lsrs r0, r0, #7
	strb r0, [r4, #9]
	mov r0, sp
	ldrh r0, [r0, #0xa]
	lsls r0, r0, #0x15
	lsrs r0, r0, #0x1a
	strb r0, [r4, #8]
	mov r0, sp
	ldrb r0, [r0, #2]
	lsls r0, r0, #0x19
	lsrs r0, r0, #0x1f
	strb r0, [r4, #1]
	ldr r0, [sp, #4]
	lsls r0, r0, #0xf
	lsrs r0, r0, #0x16
	strh r0, [r4, #0xc]
	mov r0, sp
	ldrb r0, [r0, #6]
	lsls r0, r0, #0x19
	lsrs r0, r0, #0x1a
	strb r0, [r4, #0xe]
	mov r0, sp
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x13
	lsrs r0, r0, #0x1a
	strb r0, [r4, #0xf]
	mov r0, sp
	ldrb r0, [r0, #7]
	lsrs r2, r0, #5
	ldr r0, [sp, #8]
	ldr r1, _0809EA9C @ =0x001FFFFF
	ands r0, r1
	lsls r0, r0, #3
	orrs r0, r2
	str r0, [r4, #0x10]
	mov r0, sp
	ldrb r0, [r0, #0x17]
	strb r0, [r4, #0xa]
	mov r2, sp
	ldrb r1, [r2, #3]
	lsrs r1, r1, #7
	movs r0, #0x7f
	ldrb r2, [r2, #4]
	ands r0, r2
	lsls r0, r0, #1
	orrs r0, r1
	strb r0, [r4, #0xb]
	movs r0, #1
	b _0809EAA2
	.align 2, 0
_0809EA94: .4byte 0x020144E0
_0809EA98: .4byte 0x0100000A
_0809EA9C: .4byte 0x001FFFFF
_0809EAA0:
	movs r0, #0
_0809EAA2:
	add sp, #0x1c
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_809EAAC
sub_809EAAC: @ 0x0809EAAC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x14
	str r0, [sp, #0xc]
	mov r8, r1
	add r1, sp, #8
	movs r0, #0
	strb r0, [r1, #2]
	movs r0, #4
	bl EnableBgSync
	movs r0, #0
	str r0, [sp, #0x10]
	add r7, sp, #8
	movs r1, #0xe0
	lsls r1, r1, #1
	mov sl, r1
	mov sb, r0
	movs r6, #0
_0809EAD8:
	ldr r2, [sp, #0xc]
	adds r0, r2, r6
	bl ClearText
	movs r5, #2
	bl InitTalkTextFont
	movs r4, #0
_0809EAE8:
	mov r0, sb
	adds r2, r0, r4
	ldr r1, _0809EB64 @ =0x020144D8
	ldr r0, _0809EB68 @ =0x02014404
	ldr r0, [r0]
	ldrh r1, [r1, #6]
	adds r0, r1, r0
	cmp r2, r0
	beq _0809EB54
	ldr r1, _0809EB6C @ =0x02014438
	adds r1, r2, r1
	ldrb r2, [r1]
	lsls r0, r2, #1
	add r0, r8
	ldrb r0, [r0]
	strb r0, [r7]
	ldrb r1, [r1]
	lsls r0, r1, #1
	add r0, r8
	ldrb r0, [r0, #1]
	strb r0, [r7, #1]
	movs r0, #0
	str r0, [sp]
	add r1, sp, #8
	str r1, [sp, #4]
	ldr r2, [sp, #0xc]
	adds r0, r2, r6
	ldr r1, _0809EB70 @ =gBg2Tm + 0x8
	add r1, sl
	movs r2, #1
	adds r3, r5, #0
	bl PutDrawText
	adds r5, #0xb
	adds r4, #1
	adds r0, r4, #0
	movs r1, #5
	bl __modsi3
	cmp r0, #0
	bne _0809EB3C
	adds r5, #0xb
_0809EB3C:
	cmp r4, #0xd
	ble _0809EAE8
	movs r0, #0xc0
	add sl, r0
	movs r1, #0xe
	add sb, r1
	adds r6, #8
	ldr r2, [sp, #0x10]
	adds r2, #1
	str r2, [sp, #0x10]
	cmp r2, #2
	ble _0809EAD8
_0809EB54:
	add sp, #0x14
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0809EB64: .4byte 0x020144D8
_0809EB68: .4byte 0x02014404
_0809EB6C: .4byte 0x02014438
_0809EB70: .4byte gBg2Tm + 0x8

	thumb_func_start sub_809EB74
sub_809EB74: @ 0x0809EB74
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	adds r6, r0, #0
	lsls r4, r6, #6
	ldr r7, _0809EC6C @ =gBg2Tm + 0x4
	adds r0, r4, r7
	ldr r5, _0809EC70 @ =0x020144E0
	ldrb r2, [r5]
	movs r1, #2
	bl PutNumberOrBlank
	adds r0, r7, #6
	mov r8, r0
	adds r0, r4, r0
	ldrb r2, [r5, #2]
	movs r1, #2
	bl PutNumberOrBlank
	movs r1, #0x14
	adds r1, r1, r7
	mov sl, r1
	adds r0, r4, r1
	ldrb r2, [r5, #0xb]
	movs r1, #2
	bl PutNumberOrBlank
	movs r0, #0x1e
	adds r0, r0, r7
	mov sb, r0
	add r4, sb
	ldrb r2, [r5, #0xa]
	adds r0, r4, #0
	movs r1, #2
	bl PutNumberOrBlank
	adds r4, r6, #2
	lsls r4, r4, #6
	adds r0, r4, r7
	ldrb r2, [r5, #3]
	movs r1, #2
	bl PutNumberOrBlank
	add r8, r4
	ldrb r2, [r5, #4]
	mov r0, r8
	movs r1, #2
	bl PutNumberOrBlank
	movs r1, #0xc
	adds r1, r1, r7
	mov r8, r1
	adds r0, r4, r1
	ldrb r2, [r5, #5]
	movs r1, #2
	bl PutNumberOrBlank
	adds r0, r7, #0
	adds r0, #0x12
	adds r0, r4, r0
	ldrb r2, [r5, #6]
	movs r1, #2
	bl PutNumberOrBlank
	adds r0, r7, #0
	adds r0, #0x18
	adds r0, r4, r0
	ldrb r2, [r5, #7]
	movs r1, #2
	bl PutNumberOrBlank
	add sb, r4
	ldrb r2, [r5, #9]
	mov r0, sb
	movs r1, #2
	bl PutNumberOrBlank
	adds r0, r7, #0
	adds r0, #0x24
	adds r4, r4, r0
	ldrb r2, [r5, #8]
	adds r0, r4, #0
	movs r1, #2
	bl PutNumberOrBlank
	adds r6, #4
	lsls r6, r6, #6
	add r8, r6
	ldr r2, [r5, #0x10]
	mov r0, r8
	movs r1, #2
	bl PutNumber
	add sl, r6
	ldrh r2, [r5, #0xc]
	mov r0, sl
	movs r1, #2
	bl PutNumber
	adds r0, r7, #0
	adds r0, #0x1a
	adds r0, r6, r0
	ldrb r2, [r5, #0xe]
	movs r1, #2
	bl PutNumber
	adds r0, r7, #0
	adds r0, #0x20
	adds r6, r6, r0
	ldrb r2, [r5, #0xf]
	adds r0, r6, #0
	movs r1, #2
	bl PutNumber
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0809EC6C: .4byte gBg2Tm + 0x4
_0809EC70: .4byte 0x020144E0

	thumb_func_start sub_809EC74
sub_809EC74: @ 0x0809EC74
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r6, r0, #0
	movs r0, #0
	bl InitBgs
	bl ResetTextFont
	bl ResetText
	ldr r4, _0809ED6C @ =gDispIo
	movs r2, #1
	ldrb r0, [r4, #1]
	orrs r0, r2
	movs r3, #2
	orrs r0, r3
	movs r1, #4
	orrs r0, r1
	movs r1, #8
	orrs r0, r1
	movs r1, #0x11
	rsbs r1, r1, #0
	ands r0, r1
	strb r0, [r4, #1]
	adds r1, #0xd
	adds r0, r1, #0
	ldrb r5, [r4, #0xc]
	ands r0, r5
	orrs r0, r2
	strb r0, [r4, #0xc]
	adds r0, r1, #0
	ldrb r2, [r4, #0x10]
	ands r0, r2
	orrs r0, r3
	strb r0, [r4, #0x10]
	ldrb r5, [r4, #0x14]
	ands r1, r5
	strb r1, [r4, #0x14]
	movs r0, #3
	ldrb r1, [r4, #0x18]
	orrs r0, r1
	strb r0, [r4, #0x18]
	bl UnpackUiWindowFrameGraphics
	bl EnablePalSync
	ldr r0, _0809ED70 @ =gBg0Tm
	movs r1, #0
	bl TmFill
	ldr r0, _0809ED74 @ =gBg1Tm
	movs r1, #0
	bl TmFill
	ldr r0, _0809ED78 @ =gBg2Tm
	movs r1, #0
	bl TmFill
	ldr r0, _0809ED7C @ =gBg3Tm
	movs r1, #0
	bl TmFill
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
	movs r0, #0x21
	rsbs r0, r0, #0
	ldrb r2, [r4, #1]
	ands r0, r2
	movs r1, #0x41
	rsbs r1, r1, #0
	ands r0, r1
	movs r1, #0x7f
	ands r0, r1
	strb r0, [r4, #1]
	movs r0, #2
	str r0, [sp]
	movs r1, #6
	movs r2, #0x1a
	movs r3, #7
	bl sub_804A4CC
	movs r0, #0xf
	bl EnableBgSync
	ldr r5, _0809ED80 @ =0x0201440C
	movs r4, #2
_0809ED44:
	adds r0, r5, #0
	movs r1, #0x1b
	bl InitText
	adds r5, #8
	subs r4, #1
	cmp r4, #0
	bge _0809ED44
	ldr r0, [r6, #0x30]
	ldr r1, [r6, #0x34]
	bl sub_809E9DC
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0809ED84
	adds r0, r6, #0
	movs r1, #0x63
	bl Proc_Goto
	b _0809EDA6
	.align 2, 0
_0809ED6C: .4byte gDispIo
_0809ED70: .4byte gBg0Tm
_0809ED74: .4byte gBg1Tm
_0809ED78: .4byte gBg2Tm
_0809ED7C: .4byte gBg3Tm
_0809ED80: .4byte 0x0201440C
_0809ED84:
	movs r0, #5
	movs r1, #0x11
	bl sub_809E1CC
	ldr r0, _0809EDB0 @ =sub_809E7FC
	bl sub_809E5F0
	ldr r0, _0809EDB4 @ =0x0201440C
	ldr r1, _0809EDB8 @ =gUnk_08D8E040
	bl sub_809EAAC
	movs r0, #0
	movs r1, #0
	movs r2, #0xa
	bl StartMuralBackgroundAlt
	str r0, [r6, #0x2c]
_0809EDA6:
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0809EDB0: .4byte sub_809E7FC
_0809EDB4: .4byte 0x0201440C
_0809EDB8: .4byte gUnk_08D8E040

	thumb_func_start nullsub_80
nullsub_80: @ 0x0809EDBC
	bx lr
	.align 2, 0

	thumb_func_start sub_809EDC0
sub_809EDC0: @ 0x0809EDC0
	push {lr}
	ldr r0, [r0, #0x2c]
	bl Proc_End
	ldr r2, _0809EDEC @ =gDispIo
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
	pop {r0}
	bx r0
	.align 2, 0
_0809EDEC: .4byte gDispIo

	thumb_func_start sub_809EDF0
sub_809EDF0: @ 0x0809EDF0
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r1, r2, #0
	ldr r0, _0809EE08 @ =gUnk_08D8E084
	bl Proc_StartBlocking
	str r4, [r0, #0x30]
	str r5, [r0, #0x34]
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_0809EE08: .4byte gUnk_08D8E084

	thumb_func_start sub_809EE0C
sub_809EE0C: @ 0x0809EE0C
	ldr r0, _0809EE14 @ =0x0203E768
	movs r1, #0
	strb r1, [r0]
	bx lr
	.align 2, 0
_0809EE14: .4byte 0x0203E768

	thumb_func_start nullsub_81
nullsub_81: @ 0x0809EE18
	bx lr

	.align 2, 0
