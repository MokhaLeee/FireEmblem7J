	.include "macro.inc"
	.syntax unified

	thumb_func_start WmSell_DrawSupplyDialogueSpriteText
WmSell_DrawSupplyDialogueSpriteText: @ 0x08098E8C
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
	ldr r0, _08098EEC @ =WmSell_DrawSupplyDialogueSpriteText
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
_08098EEC: .4byte WmSell_DrawSupplyDialogueSpriteText
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

	thumb_func_start WmSell_Init
WmSell_Init: @ 0x08098F2C
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
	bl PrepRestartMuralBackground
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
	bl StartUiCursorHand
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
	bl StartPrepErrorHelpbox
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
	bl SetUiCursorHandConfig
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

	thumb_func_start WmSell_OnEnd
WmSell_OnEnd: @ 0x08099810
	push {lr}
	bl EndMuralBackground_
	movs r0, #0
	bl EndFaceById
	movs r0, #0
	bl SetOnHBlankA
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start StartWorldMapSellScreen
StartWorldMapSellScreen: @ 0x08099828
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0809983C @ =gProcScr_PrepWMShopSell
	bl Proc_StartBlocking
	str r4, [r0, #0x2c]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0809983C: .4byte gProcScr_PrepWMShopSell
