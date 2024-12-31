	.include "macro.inc"
	.syntax unified

	thumb_func_start StartChapterStatusHelpBox
StartChapterStatusHelpBox: @ 0x080871E4
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
	bl StartUiSMS
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
	bl StartChapterStatusHelpBox
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

	thumb_func_start NewChapterStatusScreen
NewChapterStatusScreen: @ 0x08087B48
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
	bl PutChapterTitlePalette
	movs r4, #0xb8
	lsls r4, r4, #4
	ldr r0, _08087C68 @ =gPlaySt
	bl GetChapterTitle
	adds r1, r0, #0
	adds r0, r4, #0
	bl PutChapterTitleGfx
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
