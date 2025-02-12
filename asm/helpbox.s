	.include "macro.inc"
	.syntax unified

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
	ldr r0, _08083B90 @ =ProcScr_BoxDialogue
	bl Proc_Find
	cmp r0, #0
	bne _08083B94
	movs r0, #0
	b _08083B96
	.align 2, 0
_08083B90: .4byte ProcScr_BoxDialogue
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
	bl DrawBoxDialogueText
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
	ldr r0, _08083FE8 @ =ProcScr_TalkBoxIdle
	bl Proc_EndEach
_08083FE2:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08083FE8: .4byte ProcScr_TalkBoxIdle

	thumb_func_start sub_8083FEC
sub_8083FEC: @ 0x08083FEC
	push {lr}
	bl sub_8085008
	ldr r0, _08083FFC @ =ProcScr_MergeBoxDialogue
	bl Proc_BreakEach
	pop {r0}
	bx r0
	.align 2, 0
_08083FFC: .4byte ProcScr_MergeBoxDialogue

	thumb_func_start sub_8084000
sub_8084000: @ 0x08084000
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r6, r0, #0
	adds r7, r1, #0
	mov r8, r2
	adds r5, r3, #0
	ldr r4, _0808402C @ =ProcScr_BoxDialogue
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
_0808402C: .4byte ProcScr_BoxDialogue
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
	ldr r0, _08084064 @ =ProcScr_TalkBoxIdle
	movs r1, #0
	bl Proc_Start
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08084064: .4byte ProcScr_TalkBoxIdle

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
	ldr r4, _08084098 @ =ProcScr_BoxDialogue
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
_08084098: .4byte ProcScr_BoxDialogue
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
	ldr r0, _080840D4 @ =ProcScr_TalkBoxIdle
	movs r1, #0
	bl Proc_Start
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080840D4: .4byte ProcScr_TalkBoxIdle

	thumb_func_start GetBoxDialogueSize
GetBoxDialogueSize: @ 0x080840D8
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

	thumb_func_start DialogBoxGetGlyphLen
DialogBoxGetGlyphLen: @ 0x08084194
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

	thumb_func_start DrawBoxDialogueText
DrawBoxDialogueText: @ 0x08084208
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
	ldr r4, _08084258 @ =ProcScr_MergeBoxDialogue
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
_08084258: .4byte ProcScr_MergeBoxDialogue
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
	bl GetBoxDialogueSize
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
	ldr r0, _0808463C @ =ProcScr_MergeBoxDialogue
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
	bl DialogBoxGetGlyphLen
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0808463C: .4byte ProcScr_MergeBoxDialogue

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
	ldr r0, _0808473C @ =ProcScr_BoxDialogue
	bl Proc_Find
	movs r1, #1
	bl Proc_Goto
	adds r0, r6, #0
	movs r1, #1
	bl Proc_Goto
	ldr r0, _08084740 @ =ProcScr_TalkBoxIdle
	bl Proc_EndEach
	b _08084A24
	.align 2, 0
_0808473C: .4byte ProcScr_BoxDialogue
_08084740: .4byte ProcScr_TalkBoxIdle
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
	ldr r0, _080849E4 @ =ProcScr_MergeBoxDialogue
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
_080849E4: .4byte ProcScr_MergeBoxDialogue
_080849E8: .4byte gUnk_08D8AFE4
_080849EC:
	bl sub_8084640
	ldr r0, _08084A2C @ =ProcScr_MergeBoxDialogue
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
	bl StartYesNoChoice
_08084A24:
	ldr r0, [r6, #0x2c]
	adds r0, #1
	str r0, [r6, #0x2c]
	b _08084CD2
	.align 2, 0
_08084A2C: .4byte ProcScr_MergeBoxDialogue
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
	ldr r0, _08084AC8 @ =ProcScr_MergeBoxDialogue
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
	bl GetBoxDialogueSize
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
_08084AC8: .4byte ProcScr_MergeBoxDialogue
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
	ldr r0, _08084B90 @ =ProcScr_BoxDialogue
	bl Proc_Find
	movs r1, #1
	bl Proc_Goto
	adds r0, r6, #0
	movs r1, #1
	bl Proc_Goto
	ldr r0, _08084B94 @ =ProcScr_TalkBoxIdle
	bl Proc_EndEach
	b _08084CD2
	.align 2, 0
_08084B90: .4byte ProcScr_BoxDialogue
_08084B94: .4byte ProcScr_TalkBoxIdle
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
	ldr r0, _08084C04 @ =ProcScr_MergeBoxDialogue
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
	bl DialogBoxGetGlyphLen
	b _08084CD2
	.align 2, 0
_08084C04: .4byte ProcScr_MergeBoxDialogue
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
	ldr r0, _08084D14 @ =ProcScr_TalkBoxIdle
	bl Proc_Find
	cmp r0, #0
	beq _08084D0E
	ldr r0, _08084D18 @ =ProcScr_BoxDialogue
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
_08084D14: .4byte ProcScr_TalkBoxIdle
_08084D18: .4byte ProcScr_BoxDialogue

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
	ldr r0, _08084DD0 @ =ProcScr_BoxDialogue
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
_08084DD0: .4byte ProcScr_BoxDialogue

	thumb_func_start sub_8084DD4
sub_8084DD4: @ 0x08084DD4
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	ldr r0, _08084E64 @ =ProcScr_MergeBoxDialogue
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
_08084E64: .4byte ProcScr_MergeBoxDialogue

	thumb_func_start sub_8084E68
sub_8084E68: @ 0x08084E68
	push {lr}
	ldr r0, _08084E80 @ =ProcScr_BoxDialogue
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
_08084E80: .4byte ProcScr_BoxDialogue
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
	ldr r0, _080850B8 @ =ProcScr_TalkBoxIdle
	movs r1, #0
	bl Proc_Start
	pop {r0}
	bx r0
	.align 2, 0
_080850B8: .4byte ProcScr_TalkBoxIdle

	thumb_func_start sub_80850BC
sub_80850BC: @ 0x080850BC
	push {lr}
	ldr r0, _080850CC @ =ProcScr_TalkBoxIdle
	bl Proc_Find
	cmp r0, #0
	bne _080850D0
	movs r0, #0
	b _080850D2
	.align 2, 0
_080850CC: .4byte ProcScr_TalkBoxIdle
_080850D0:
	movs r0, #1
_080850D2:
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_80850D8
sub_80850D8: @ 0x080850D8
	push {lr}
	ldr r0, _080850FC @ =ProcScr_BoxDialogue
	bl Proc_EndEach
	ldr r0, _08085100 @ =ProcScr_TalkBoxIdle
	bl Proc_EndEach
	ldr r0, _08085104 @ =ProcScr_MergeBoxDialogue
	bl Proc_EndEach
	ldr r0, _08085108 @ =gUnk_08D8B06C
	bl Proc_EndEach
	ldr r0, _0808510C @ =gUnk_08D8B10C
	bl Proc_EndEach
	pop {r0}
	bx r0
	.align 2, 0
_080850FC: .4byte ProcScr_BoxDialogue
_08085100: .4byte ProcScr_TalkBoxIdle
_08085104: .4byte ProcScr_MergeBoxDialogue
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
