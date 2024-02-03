	.include "macro.inc"

	.syntax unified

	thumb_func_start GetLang
GetLang: @ 0x0800527C
	movs r0, #0
	bx lr

	thumb_func_start ResetText
ResetText: @ 0x08005280
	push {lr}
	ldr r0, _08005298 @ =0x02028D50
	ldr r1, _0800529C @ =0x06001000
	movs r2, #0x80
	movs r3, #0
	bl InitTextFont
	ldr r1, _080052A0 @ =0x02028D6C
	movs r0, #0xff
	strb r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_08005298: .4byte 0x02028D50
_0800529C: .4byte 0x06001000
_080052A0: .4byte 0x02028D6C

	thumb_func_start InitTextFont
InitTextFont: @ 0x080052A4
	push {r4, lr}
	adds r4, r0, #0
	cmp r4, #0
	bne _080052AE
	ldr r4, _080052D8 @ =0x02028D50
_080052AE:
	str r1, [r4]
	ldr r0, _080052DC @ =GetTextDrawDest
	str r0, [r4, #0xc]
	movs r1, #0
	strh r3, [r4, #0x14]
	lsls r0, r3, #0xc
	adds r0, r2, r0
	strh r0, [r4, #0x10]
	strh r1, [r4, #0x12]
	bl GetLang
	strb r0, [r4, #0x16]
	adds r0, r4, #0
	bl SetTextFont
	bl InitSystemTextFont
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080052D8: .4byte 0x02028D50
_080052DC: .4byte GetTextDrawDest

	thumb_func_start SetTextFontGlyphs
SetTextFontGlyphs: @ 0x080052E0
	cmp r0, #0
	bne _080052F4
	ldr r0, _080052EC @ =gActiveFont
	ldr r1, [r0]
	ldr r0, _080052F0 @ =gUnk_08BC1FEC
	b _080052FA
	.align 2, 0
_080052EC: .4byte gActiveFont
_080052F0: .4byte gUnk_08BC1FEC
_080052F4:
	ldr r0, _08005300 @ =gActiveFont
	ldr r1, [r0]
	ldr r0, _08005304 @ =gUnk_08BDC1E0
_080052FA:
	str r0, [r1, #4]
	bx lr
	.align 2, 0
_08005300: .4byte gActiveFont
_08005304: .4byte gUnk_08BDC1E0

	thumb_func_start ResetTextFont
ResetTextFont: @ 0x08005308
	ldr r0, _08005318 @ =gActiveFont
	ldr r1, [r0]
	movs r0, #0
	strh r0, [r1, #0x12]
	ldr r1, _0800531C @ =0x02028D6C
	movs r0, #0xff
	strb r0, [r1]
	bx lr
	.align 2, 0
_08005318: .4byte gActiveFont
_0800531C: .4byte 0x02028D6C

	thumb_func_start SetTextFont
SetTextFont: @ 0x08005320
	adds r1, r0, #0
	cmp r1, #0
	bne _08005338
	ldr r1, _08005330 @ =gActiveFont
	ldr r0, _08005334 @ =0x02028D50
	str r0, [r1]
	b _0800533C
	.align 2, 0
_08005330: .4byte gActiveFont
_08005334: .4byte 0x02028D50
_08005338:
	ldr r0, _08005340 @ =gActiveFont
	str r1, [r0]
_0800533C:
	bx lr
	.align 2, 0
_08005340: .4byte gActiveFont

	thumb_func_start InitText
InitText: @ 0x08005344
	push {r4, lr}
	ldr r2, _08005368 @ =gActiveFont
	ldr r4, [r2]
	ldrh r3, [r4, #0x12]
	movs r2, #0
	strh r3, [r0]
	strb r1, [r0, #4]
	strb r2, [r0, #6]
	strb r2, [r0, #5]
	strb r2, [r0, #7]
	ldrh r2, [r4, #0x12]
	adds r1, r2, r1
	strh r1, [r4, #0x12]
	bl ClearText
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08005368: .4byte gActiveFont

	thumb_func_start sub_800536C
sub_800536C: @ 0x0800536C
	push {r4, lr}
	ldr r2, _08005390 @ =gActiveFont
	ldr r3, [r2]
	ldrh r2, [r3, #0x12]
	movs r4, #0
	strh r2, [r0]
	strb r1, [r0, #4]
	strb r4, [r0, #6]
	movs r2, #1
	strb r2, [r0, #5]
	strb r4, [r0, #7]
	lsls r1, r1, #1
	ldrh r0, [r3, #0x12]
	adds r1, r0, r1
	strh r1, [r3, #0x12]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08005390: .4byte gActiveFont

	thumb_func_start sub_8005394
sub_8005394: @ 0x08005394
	push {r4, lr}
	adds r4, r0, #0
	b _080053A4
_0800539A:
	ldr r0, [r4]
	ldrb r1, [r4, #4]
	bl InitText
	adds r4, #8
_080053A4:
	ldr r0, [r4]
	cmp r0, #0
	bne _0800539A
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start ClearText
ClearText: @ 0x080053B0
	push {r4, lr}
	sub sp, #4
	adds r4, r0, #0
	movs r0, #0
	strb r0, [r4, #2]
	strb r0, [r4, #3]
	str r0, [sp]
	ldr r0, _080053E4 @ =gActiveFont
	ldr r0, [r0]
	ldr r1, [r0, #0xc]
	adds r0, r4, #0
	bl _call_via_r1
	adds r1, r0, #0
	ldrb r4, [r4, #4]
	lsls r2, r4, #4
	movs r0, #0x80
	lsls r0, r0, #0x11
	orrs r2, r0
	mov r0, sp
	bl CpuFastSet
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080053E4: .4byte gActiveFont

	thumb_func_start sub_80053E8
sub_80053E8: @ 0x080053E8
	push {r4, r5, r6, lr}
	sub sp, #4
	ldr r3, _08005424 @ =gActiveFont
	ldr r4, [r3]
	ldrb r5, [r0, #4]
	ldrb r6, [r0, #6]
	adds r3, r5, #0
	muls r3, r6, r3
	ldrh r0, [r0]
	adds r3, r0, r3
	adds r3, r3, r1
	lsls r3, r3, #6
	ldr r1, [r4]
	adds r1, r1, r3
	movs r0, #0
	str r0, [sp]
	lsls r2, r2, #4
	ldr r0, _08005428 @ =0x001FFFFF
	ands r2, r0
	movs r0, #0x80
	lsls r0, r0, #0x11
	orrs r2, r0
	mov r0, sp
	bl CpuFastSet
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08005424: .4byte gActiveFont
_08005428: .4byte 0x001FFFFF

	thumb_func_start sub_800542C
sub_800542C: @ 0x0800542C
	ldrb r2, [r0, #4]
	ldrb r3, [r0, #6]
	adds r1, r2, #0
	muls r1, r3, r1
	ldrh r0, [r0]
	adds r1, r0, r1
	lsls r1, r1, #1
	adds r0, r1, #0
	bx lr
	.align 2, 0

	thumb_func_start sub_8005440
sub_8005440: @ 0x08005440
	ldrb r0, [r0, #2]
	bx lr

	thumb_func_start Text_SetCursor
Text_SetCursor: @ 0x08005444
	strb r1, [r0, #2]
	bx lr

	thumb_func_start Text_Skip
Text_Skip: @ 0x08005448
	ldrb r2, [r0, #2]
	adds r1, r2, r1
	strb r1, [r0, #2]
	bx lr

	thumb_func_start Text_SetColor
Text_SetColor: @ 0x08005450
	strb r1, [r0, #3]
	bx lr

	thumb_func_start Text_GetColor
Text_GetColor: @ 0x08005454
	ldrb r0, [r0, #3]
	bx lr

	thumb_func_start Text_SetParams
Text_SetParams: @ 0x08005458
	strb r1, [r0, #2]
	strb r2, [r0, #3]
	bx lr
	.align 2, 0

	thumb_func_start PutText
PutText: @ 0x08005460
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r2, r1, #0
	ldr r0, _080054AC @ =gActiveFont
	ldr r1, [r0]
	ldrb r3, [r4, #4]
	ldrb r5, [r4, #6]
	adds r0, r5, #0
	muls r0, r3, r0
	ldrh r5, [r4]
	adds r0, r5, r0
	lsls r0, r0, #1
	ldrh r1, [r1, #0x10]
	adds r1, r1, r0
	cmp r3, #0
	beq _08005494
_08005480:
	strh r1, [r2]
	adds r1, #1
	adds r0, r2, #0
	adds r0, #0x40
	strh r1, [r0]
	adds r1, #1
	adds r2, #2
	subs r3, #1
	cmp r3, #0
	bne _08005480
_08005494:
	movs r0, #5
	ldrsb r0, [r4, r0]
	cmp r0, #0
	beq _080054A4
	movs r0, #1
	ldrb r1, [r4, #6]
	eors r0, r1
	strb r0, [r4, #6]
_080054A4:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080054AC: .4byte gActiveFont

	thumb_func_start PutBlankText
PutBlankText: @ 0x080054B0
	ldrb r0, [r0, #4]
	cmp r0, #0
	beq _080054CA
	movs r3, #0
	adds r2, r0, #0
_080054BA:
	strh r3, [r1]
	adds r0, r1, #0
	adds r0, #0x40
	strh r3, [r0]
	adds r1, #2
	subs r2, #1
	cmp r2, #0
	bne _080054BA
_080054CA:
	bx lr

	thumb_func_start GetStringTextLen
GetStringTextLen: @ 0x080054CC
	push {r4, r5, lr}
	adds r2, r0, #0
	movs r4, #0
	ldr r0, _080054E8 @ =gActiveFont
	ldr r1, [r0]
	ldrb r1, [r1, #0x16]
	adds r5, r0, #0
	cmp r1, #0
	beq _08005514
	adds r0, r2, #0
	bl GetStringTextLenAscii
	b _0800551C
	.align 2, 0
_080054E8: .4byte gActiveFont
_080054EC:
	ldrb r3, [r2]
	adds r2, #1
	cmp r3, #0x1f
	bls _08005514
	ldrb r0, [r2]
	adds r2, #1
	ldr r1, [r5]
	ldr r1, [r1, #4]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, _08005524 @ =0xFFFFFF00
	adds r0, r0, r1
_08005504:
	ldr r0, [r0]
	cmp r0, #0
	beq _08005514
	ldrb r1, [r0, #4]
	cmp r1, r3
	bne _08005504
	ldrb r0, [r0, #5]
	adds r4, r0, r4
_08005514:
	ldrb r0, [r2]
	cmp r0, #1
	bhi _080054EC
	adds r0, r4, #0
_0800551C:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_08005524: .4byte 0xFFFFFF00

	thumb_func_start GetCharTextLen
GetCharTextLen: @ 0x08005528
	push {r4, lr}
	adds r2, r0, #0
	adds r4, r1, #0
	ldr r0, _0800555C @ =gActiveFont
	ldr r1, [r0]
	ldrb r3, [r2]
	adds r2, #1
	ldrb r0, [r2]
	adds r2, #1
	ldr r1, [r1, #4]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, _08005560 @ =0xFFFFFF00
	adds r0, r0, r1
_08005544:
	ldr r0, [r0]
	cmp r0, #0
	beq _08005554
	ldrb r1, [r0, #4]
	cmp r1, r3
	bne _08005544
	ldrb r0, [r0, #5]
	str r0, [r4]
_08005554:
	adds r0, r2, #0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0800555C: .4byte gActiveFont
_08005560: .4byte 0xFFFFFF00

	thumb_func_start GetStringTextCenteredPos
GetStringTextCenteredPos: @ 0x08005564
	push {r4, lr}
	adds r4, r0, #0
	adds r0, r1, #0
	bl GetStringTextLen
	subs r4, r4, r0
	lsrs r0, r4, #0x1f
	adds r4, r4, r0
	asrs r4, r4, #1
	adds r0, r4, #0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start GetStringTextBox
GetStringTextBox: @ 0x08005580
	push {r4, r5, r6, lr}
	adds r6, r1, #0
	adds r5, r2, #0
	movs r0, #0
	str r0, [r6]
	str r0, [r5]
	bl sub_8013374
	adds r4, r0, #0
	b _08005596
_08005594:
	adds r4, #1
_08005596:
	ldrb r0, [r4]
	cmp r0, #1
	bls _080055C0
	adds r0, r4, #0
	bl GetStringTextLen
	adds r1, r0, #0
	ldr r0, [r6]
	cmp r0, r1
	bge _080055AC
	str r1, [r6]
_080055AC:
	ldr r0, [r5]
	adds r0, #0x10
	str r0, [r5]
	adds r0, r4, #0
	bl GetStringLineEnd
	adds r4, r0, #0
	ldrb r0, [r4]
	cmp r0, #0
	bne _08005594
_080055C0:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start GetStringLineEnd
GetStringLineEnd: @ 0x080055C8
	b _080055D4
_080055CA:
	cmp r1, #4
	bne _080055D2
	adds r0, #1
	b _080055D4
_080055D2:
	adds r0, #2
_080055D4:
	ldrb r1, [r0]
	cmp r1, #1
	bhi _080055CA
	bx lr

	thumb_func_start Text_DrawString
Text_DrawString: @ 0x080055DC
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	adds r4, r1, #0
	ldr r0, _080055F4 @ =gActiveFont
	ldr r0, [r0]
	ldrb r0, [r0, #0x16]
	cmp r0, #0
	beq _080055F8
	adds r0, r6, #0
	bl Text_DrawStringAscii
	b _0800564A
	.align 2, 0
_080055F4: .4byte gActiveFont
_080055F8:
	ldrb r0, [r4]
	cmp r0, #1
	bls _0800564A
_080055FE:
	ldrb r3, [r4]
	adds r4, #1
	cmp r3, #0x1f
	bls _08005644
	ldrb r2, [r4]
	adds r4, #1
	ldr r5, _08005620 @ =gActiveFont
_0800560C:
	ldr r0, [r5]
	ldr r1, [r0, #4]
	lsls r0, r2, #2
	adds r0, r0, r1
	ldr r1, _08005624 @ =0xFFFFFF00
	adds r0, r0, r1
	ldr r1, [r0]
	cmp r1, #0
	beq _08005644
	b _08005634
	.align 2, 0
_08005620: .4byte gActiveFont
_08005624: .4byte 0xFFFFFF00
_08005628:
	ldr r1, [r1]
	cmp r1, #0
	bne _08005634
	movs r3, #0x81
	movs r2, #0xa7
	b _0800560C
_08005634:
	ldrb r0, [r1, #4]
	cmp r0, r3
	bne _08005628
	ldr r0, [r5]
	ldr r2, [r0, #8]
	adds r0, r6, #0
	bl _call_via_r2
_08005644:
	ldrb r1, [r4]
	cmp r1, #1
	bhi _080055FE
_0800564A:
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	thumb_func_start Text_DrawNumber
Text_DrawNumber: @ 0x08005650
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	adds r4, r1, #0
	cmp r4, #0
	bne _08005668
	ldr r1, _08005664 @ =gUnk_0818F8F8
	bl Text_DrawCharacter
	b _08005698
	.align 2, 0
_08005664: .4byte gUnk_0818F8F8
_08005668:
	adds r0, r4, #0
	movs r1, #0xa
	bl __modsi3
	lsls r0, r0, #0x18
	ldr r1, _080056A0 @ =0x4F820000
	adds r0, r0, r1
	lsrs r0, r0, #0x10
	mov r1, sp
	strh r0, [r1]
	adds r0, r4, #0
	movs r1, #0xa
	bl __divsi3
	adds r4, r0, #0
	adds r0, r5, #0
	mov r1, sp
	bl Text_DrawCharacter
	ldrb r0, [r5, #2]
	subs r0, #0x10
	strb r0, [r5, #2]
	cmp r4, #0
	bne _08005668
_08005698:
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080056A0: .4byte 0x4F820000

	thumb_func_start Text_DrawNumberOrBlank
Text_DrawNumberOrBlank: @ 0x080056A4
	push {r4, lr}
	adds r4, r0, #0
	cmp r1, #0xff
	beq _080056B4
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	bne _080056CC
_080056B4:
	movs r1, #8
	rsbs r1, r1, #0
	adds r0, r4, #0
	bl Text_Skip
	ldr r1, _080056C8 @ =gUnk_0818F8FC
	adds r0, r4, #0
	bl Text_DrawString
	b _080056D2
	.align 2, 0
_080056C8: .4byte gUnk_0818F8FC
_080056CC:
	adds r0, r4, #0
	bl Text_DrawNumber
_080056D2:
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start Text_DrawCharacter
Text_DrawCharacter: @ 0x080056D8
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	ldr r0, _080056F4 @ =gActiveFont
	ldr r1, [r0]
	ldrb r1, [r1, #0x16]
	adds r6, r0, #0
	cmp r1, #0
	beq _080056F8
	adds r0, r5, #0
	adds r1, r4, #0
	bl Text_DrawCharacterAscii
	b _0800573A
	.align 2, 0
_080056F4: .4byte gActiveFont
_080056F8:
	ldrb r3, [r4]
	adds r4, #1
	ldrb r2, [r4]
	adds r4, #1
_08005700:
	ldr r0, [r6]
	ldr r1, [r0, #4]
	lsls r0, r2, #2
	adds r0, r0, r1
	ldr r1, _08005710 @ =0xFFFFFF00
	adds r0, r0, r1
	ldr r1, [r0]
	b _08005716
	.align 2, 0
_08005710: .4byte 0xFFFFFF00
_08005714:
	ldr r1, [r1]
_08005716:
	cmp r1, #0
	bne _08005728
	movs r3, #0x81
	movs r2, #0xa7
	ldr r6, _08005724 @ =gActiveFont
	b _08005700
	.align 2, 0
_08005724: .4byte gActiveFont
_08005728:
	ldrb r0, [r1, #4]
	cmp r0, r3
	bne _08005714
	ldr r0, [r6]
	ldr r2, [r0, #8]
	adds r0, r5, #0
	bl _call_via_r2
	adds r0, r4, #0
_0800573A:
	pop {r4, r5, r6}
	pop {r1}
	bx r1

	thumb_func_start GetTextDrawDest
GetTextDrawDest: @ 0x08005740
	ldrb r2, [r0, #4]
	ldrb r3, [r0, #6]
	adds r1, r2, #0
	muls r1, r3, r1
	ldrh r2, [r0]
	adds r1, r2, r1
	ldrb r0, [r0, #2]
	lsrs r0, r0, #3
	adds r1, r1, r0
	ldr r0, _08005760 @ =gActiveFont
	ldr r0, [r0]
	lsls r1, r1, #6
	ldr r0, [r0]
	adds r0, r0, r1
	bx lr
	.align 2, 0
_08005760: .4byte gActiveFont

	thumb_func_start GetColorLut
GetColorLut: @ 0x08005764
	ldr r1, _08005770 @ =gUnk_08BC0590
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	bx lr
	.align 2, 0
_08005770: .4byte gUnk_08BC0590

	thumb_func_start DrawTextGlyph
DrawTextGlyph: @ 0x08005774
	push {r4, r5, r6, lr}
	mov r6, sb
	mov r5, r8
	push {r5, r6}
	adds r5, r0, #0
	mov sb, r1
	ldr r0, _080057C0 @ =gActiveFont
	ldr r0, [r0]
	ldr r1, [r0, #0xc]
	adds r0, r5, #0
	bl _call_via_r1
	mov r8, r0
	movs r4, #7
	ldrb r0, [r5, #2]
	ands r4, r0
	mov r6, sb
	adds r6, #8
	ldrb r0, [r5, #3]
	bl GetColorLut
	mov r1, r8
	adds r2, r6, #0
	adds r3, r4, #0
	bl DrawGlyphRam
	ldrb r2, [r5, #2]
	mov r1, sb
	ldrb r1, [r1, #5]
	adds r0, r2, r1
	strb r0, [r5, #2]
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080057C0: .4byte gActiveFont

	thumb_func_start DrawTextGlyphNoClear
DrawTextGlyphNoClear: @ 0x080057C4
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x18
	str r0, [sp]
	str r1, [sp, #4]
	ldr r0, _08005900 @ =gActiveFont
	ldr r0, [r0]
	ldr r1, [r0, #0xc]
	ldr r0, [sp]
	bl _call_via_r1
	str r0, [sp, #0xc]
	movs r0, #7
	ldr r1, [sp]
	ldrb r2, [r1, #2]
	ands r2, r0
	str r2, [sp, #0x10]
	ldr r3, [sp, #4]
	adds r3, #8
	str r3, [sp, #0x14]
	movs r0, #9
	bl GetColorLut
	mov sl, r0
	ldr r6, [sp]
	ldrb r0, [r6, #3]
	bl GetColorLut
	mov sb, r0
	movs r0, #0xf
	str r0, [sp, #8]
	ldr r7, [sp, #0xc]
	adds r7, #0x40
_0800580C:
	ldr r2, [sp, #0x14]
	ldm r2!, {r0}
	str r2, [sp, #0x14]
	movs r1, #0
	ldr r3, [sp, #0x10]
	lsls r2, r3, #1
	bl __ashldi3
	movs r5, #0xff
	ands r5, r0
	lsls r5, r5, #1
	adds r6, r5, #0
	add r6, sl
	mov r8, r6
	lsls r6, r1, #0x18
	lsrs r4, r0, #8
	adds r2, r6, #0
	orrs r2, r4
	movs r4, #0xff
	ands r4, r2
	lsls r4, r4, #1
	mov r3, sl
	adds r2, r4, r3
	ldrh r2, [r2]
	lsls r2, r2, #0x10
	mov r6, r8
	ldrh r6, [r6]
	orrs r2, r6
	ldr r6, [sp, #0xc]
	ldr r3, [r6]
	ands r3, r2
	str r3, [r6]
	add r5, sb
	add r4, sb
	ldrh r4, [r4]
	lsls r2, r4, #0x10
	ldrh r5, [r5]
	orrs r2, r5
	orrs r3, r2
	stm r6!, {r3}
	str r6, [sp, #0xc]
	lsls r5, r1, #0x10
	lsrs r4, r0, #0x10
	adds r2, r5, #0
	orrs r2, r4
	movs r5, #0xff
	ands r5, r2
	lsls r5, r5, #1
	adds r2, r5, #0
	add r2, sl
	mov r8, r2
	lsls r6, r1, #8
	lsrs r4, r0, #0x18
	adds r2, r6, #0
	orrs r2, r4
	movs r4, #0xff
	ands r4, r2
	lsls r4, r4, #1
	mov r3, sl
	adds r2, r4, r3
	ldrh r2, [r2]
	lsls r2, r2, #0x10
	mov r6, r8
	ldrh r6, [r6]
	orrs r2, r6
	ldr r3, [r7]
	ands r3, r2
	add r5, sb
	add r4, sb
	ldrh r4, [r4]
	lsls r2, r4, #0x10
	ldrh r5, [r5]
	orrs r2, r5
	orrs r3, r2
	str r3, [r7]
	adds r2, r1, #0
	movs r4, #0xff
	ands r4, r2
	lsls r4, r4, #1
	mov r2, sl
	adds r5, r4, r2
	lsrs r2, r1, #8
	movs r1, #0xff
	ands r1, r2
	lsls r1, r1, #1
	mov r3, sl
	adds r0, r1, r3
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	ldrh r5, [r5]
	orrs r0, r5
	ldr r2, [r7, #0x40]
	ands r2, r0
	add r4, sb
	add r1, sb
	ldrh r1, [r1]
	lsls r0, r1, #0x10
	ldrh r4, [r4]
	orrs r0, r4
	orrs r2, r0
	str r2, [r7, #0x40]
	adds r7, #4
	ldr r6, [sp, #8]
	subs r6, #1
	str r6, [sp, #8]
	cmp r6, #0
	bge _0800580C
	ldr r1, [sp]
	ldrb r2, [r1, #2]
	ldr r1, [sp, #4]
	ldrb r1, [r1, #5]
	adds r0, r2, r1
	ldr r2, [sp]
	strb r0, [r2, #2]
	add sp, #0x18
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08005900: .4byte gActiveFont

	thumb_func_start InitSystemTextFont
InitSystemTextFont: @ 0x08005904
	push {r4, lr}
	ldr r0, _08005934 @ =gUnk_081901C8
	ldr r4, _08005938 @ =gActiveFont
	ldr r1, [r4]
	ldrh r1, [r1, #0x14]
	lsls r1, r1, #5
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r1, _0800593C @ =gPal
	ldr r2, [r4]
	ldrh r3, [r2, #0x14]
	lsls r0, r3, #5
	adds r0, r0, r1
	movs r1, #0
	strh r1, [r0]
	ldr r0, _08005940 @ =DrawTextGlyph
	str r0, [r2, #8]
	movs r0, #0
	bl SetTextFontGlyphs
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08005934: .4byte gUnk_081901C8
_08005938: .4byte gActiveFont
_0800593C: .4byte gPal
_08005940: .4byte DrawTextGlyph

	thumb_func_start InitTalkTextFont
InitTalkTextFont: @ 0x08005944
	push {r4, lr}
	ldr r0, _08005974 @ =gUnk_081901E8
	ldr r4, _08005978 @ =gActiveFont
	ldr r1, [r4]
	ldrh r1, [r1, #0x14]
	lsls r1, r1, #5
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r1, _0800597C @ =gPal
	ldr r2, [r4]
	ldrh r3, [r2, #0x14]
	lsls r0, r3, #5
	adds r0, r0, r1
	movs r1, #0
	strh r1, [r0]
	ldr r0, _08005980 @ =DrawTextGlyph
	str r0, [r2, #8]
	movs r0, #1
	bl SetTextFontGlyphs
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08005974: .4byte gUnk_081901E8
_08005978: .4byte gActiveFont
_0800597C: .4byte gPal
_08005980: .4byte DrawTextGlyph

	thumb_func_start SetTextDrawNoClear
SetTextDrawNoClear: @ 0x08005984
	ldr r0, _08005990 @ =gActiveFont
	ldr r1, [r0]
	ldr r0, _08005994 @ =DrawTextGlyphNoClear
	str r0, [r1, #8]
	bx lr
	.align 2, 0
_08005990: .4byte gActiveFont
_08005994: .4byte DrawTextGlyphNoClear

	thumb_func_start PutDrawText
PutDrawText: @ 0x08005998
	push {r4, r5, r6, r7, lr}
	sub sp, #8
	adds r4, r0, #0
	adds r7, r1, #0
	adds r6, r2, #0
	adds r5, r3, #0
	cmp r4, #0
	bne _080059B2
	mov r4, sp
	mov r0, sp
	ldr r1, [sp, #0x1c]
	bl InitText
_080059B2:
	adds r0, r4, #0
	adds r1, r5, #0
	bl Text_SetCursor
	adds r0, r4, #0
	adds r1, r6, #0
	bl Text_SetColor
	adds r0, r4, #0
	ldr r1, [sp, #0x20]
	bl Text_DrawString
	adds r0, r4, #0
	adds r1, r7, #0
	bl PutText
	add sp, #8
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start Text_InsertDrawString
Text_InsertDrawString: @ 0x080059DC
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r5, r2, #0
	adds r6, r3, #0
	bl Text_SetCursor
	adds r0, r4, #0
	adds r1, r5, #0
	bl Text_SetColor
	adds r0, r4, #0
	adds r1, r6, #0
	bl Text_DrawString
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start Text_InsertDrawNumberOrBlank
Text_InsertDrawNumberOrBlank: @ 0x08005A00
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r5, r2, #0
	adds r6, r3, #0
	bl Text_SetCursor
	adds r0, r4, #0
	adds r1, r5, #0
	bl Text_SetColor
	adds r0, r4, #0
	adds r1, r6, #0
	bl Text_DrawNumberOrBlank
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start Text_DrawStringAscii
Text_DrawStringAscii: @ 0x08005A24
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	b _08005A4E
_08005A2C:
	ldr r0, _08005A5C @ =gActiveFont
	ldr r3, [r0]
	ldr r2, [r3, #4]
	ldrb r1, [r4]
	lsls r0, r1, #2
	adds r0, r0, r2
	ldr r1, [r0]
	adds r4, #1
	cmp r1, #0
	bne _08005A46
	adds r0, r2, #0
	adds r0, #0xfc
	ldr r1, [r0]
_08005A46:
	ldr r2, [r3, #8]
	adds r0, r5, #0
	bl _call_via_r2
_08005A4E:
	ldrb r0, [r4]
	cmp r0, #0
	bne _08005A2C
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08005A5C: .4byte gActiveFont

	thumb_func_start Text_DrawCharacterAscii
Text_DrawCharacterAscii: @ 0x08005A60
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	ldr r0, _08005A90 @ =gActiveFont
	ldr r3, [r0]
	ldr r2, [r3, #4]
	ldrb r1, [r4]
	lsls r0, r1, #2
	adds r0, r0, r2
	ldr r1, [r0]
	adds r4, #1
	cmp r1, #0
	bne _08005A80
	adds r0, r2, #0
	adds r0, #0xfc
	ldr r1, [r0]
_08005A80:
	ldr r2, [r3, #8]
	adds r0, r5, #0
	bl _call_via_r2
	adds r0, r4, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_08005A90: .4byte gActiveFont

	thumb_func_start GetStringTextLenAscii
GetStringTextLenAscii: @ 0x08005A94
	push {r4, lr}
	adds r1, r0, #0
	movs r2, #0
	ldrb r0, [r1]
	cmp r0, #0
	beq _08005ABA
	ldr r0, _08005AC4 @ =gActiveFont
	ldr r0, [r0]
	ldr r3, [r0, #4]
_08005AA6:
	ldrb r4, [r1]
	lsls r0, r4, #2
	adds r0, r0, r3
	ldr r0, [r0]
	adds r1, #1
	ldrb r0, [r0, #5]
	adds r2, r0, r2
	ldrb r0, [r1]
	cmp r0, #0
	bne _08005AA6
_08005ABA:
	adds r0, r2, #0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08005AC4: .4byte gActiveFont

	thumb_func_start nullsub_23
nullsub_23: @ 0x08005AC8
	bx lr
	.align 2, 0

	thumb_func_start InitSpriteTextFont
InitSpriteTextFont: @ 0x08005ACC
	push {r4, lr}
	adds r4, r0, #0
	str r1, [r4]
	ldr r0, _08005B00 @ =GetSpriteTextDrawDest
	str r0, [r4, #0xc]
	movs r0, #0xf
	ands r2, r0
	adds r2, #0x10
	movs r0, #0
	strh r2, [r4, #0x14]
	lsls r1, r1, #0xf
	lsrs r1, r1, #0x14
	strh r1, [r4, #0x10]
	strh r0, [r4, #0x12]
	bl GetLang
	strb r0, [r4, #0x16]
	adds r0, r4, #0
	bl SetTextFont
	ldr r0, _08005B04 @ =DrawSpriteTextGlyph
	str r0, [r4, #8]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08005B00: .4byte GetSpriteTextDrawDest
_08005B04: .4byte DrawSpriteTextGlyph

	thumb_func_start InitSpriteText
InitSpriteText: @ 0x08005B08
	ldr r1, _08005B28 @ =gActiveFont
	ldr r3, [r1]
	ldrh r1, [r3, #0x12]
	movs r2, #0
	strh r1, [r0]
	movs r1, #0x20
	strb r1, [r0, #4]
	strb r2, [r0, #6]
	strb r2, [r0, #5]
	strb r2, [r0, #7]
	ldrh r1, [r3, #0x12]
	adds r1, #0x40
	strh r1, [r3, #0x12]
	strb r2, [r0, #2]
	strb r2, [r0, #3]
	bx lr
	.align 2, 0
_08005B28: .4byte gActiveFont

	thumb_func_start SpriteText_DrawBackground
SpriteText_DrawBackground: @ 0x08005B2C
	push {r4, r5, r6, r7, lr}
	sub sp, #8
	adds r7, r0, #0
	ldrb r0, [r7, #4]
	cmp r0, #0
	beq _08005B76
	movs r0, #0
	strb r0, [r7, #2]
	ldr r4, _08005B80 @ =0x44444444
	str r4, [sp]
	ldr r5, _08005B84 @ =gActiveFont
	ldr r0, [r5]
	ldr r1, [r0, #0xc]
	adds r0, r7, #0
	bl _call_via_r1
	adds r1, r0, #0
	ldr r6, _08005B88 @ =0x010000D8
	mov r0, sp
	adds r2, r6, #0
	bl CpuFastSet
	str r4, [sp, #4]
	add r4, sp, #4
	ldr r0, [r5]
	ldr r1, [r0, #0xc]
	adds r0, r7, #0
	bl _call_via_r1
	adds r1, r0, #0
	movs r0, #0x80
	lsls r0, r0, #3
	adds r1, r1, r0
	adds r0, r4, #0
	adds r2, r6, #0
	bl CpuFastSet
_08005B76:
	add sp, #8
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08005B80: .4byte 0x44444444
_08005B84: .4byte gActiveFont
_08005B88: .4byte 0x010000D8

	thumb_func_start SpriteText_DrawBackgroundExt
SpriteText_DrawBackgroundExt: @ 0x08005B8C
	push {lr}
	sub sp, #4
	movs r2, #0
	strb r2, [r0, #2]
	str r1, [sp]
	ldr r1, _08005BB0 @ =gActiveFont
	ldr r1, [r1]
	ldr r1, [r1, #0xc]
	bl _call_via_r1
	adds r1, r0, #0
	ldr r2, _08005BB4 @ =0x01000200
	mov r0, sp
	bl CpuFastSet
	add sp, #4
	pop {r0}
	bx r0
	.align 2, 0
_08005BB0: .4byte gActiveFont
_08005BB4: .4byte 0x01000200

	thumb_func_start GetSpriteTextDrawDest
GetSpriteTextDrawDest: @ 0x08005BB8
	ldrb r2, [r0, #4]
	ldrb r3, [r0, #6]
	adds r1, r2, #0
	muls r1, r3, r1
	ldrh r2, [r0]
	adds r1, r2, r1
	ldrb r0, [r0, #2]
	lsrs r0, r0, #3
	adds r1, r1, r0
	ldr r0, _08005BD8 @ =gActiveFont
	ldr r0, [r0]
	lsls r1, r1, #5
	ldr r0, [r0]
	adds r0, r0, r1
	bx lr
	.align 2, 0
_08005BD8: .4byte gActiveFont

	thumb_func_start DrawSpriteTextGlyph
DrawSpriteTextGlyph: @ 0x08005BDC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x14
	str r0, [sp]
	str r1, [sp, #4]
	ldr r0, _08005D88 @ =gActiveFont
	ldr r0, [r0]
	ldr r1, [r0, #0xc]
	ldr r0, [sp]
	bl _call_via_r1
	adds r7, r0, #0
	movs r0, #7
	ldr r1, [sp]
	ldrb r2, [r1, #2]
	ands r2, r0
	str r2, [sp, #8]
	ldr r3, [sp, #4]
	adds r3, #8
	str r3, [sp, #0xc]
	ldrb r0, [r1, #3]
	bl GetColorLut
	mov r8, r0
	movs r0, #0xff
	mov sb, r0
	ldr r1, [sp, #8]
	lsls r1, r1, #1
	str r1, [sp, #0x10]
	movs r2, #7
	mov sl, r2
_08005C20:
	ldr r3, [sp, #0xc]
	ldm r3!, {r0}
	str r3, [sp, #0xc]
	movs r1, #0
	ldr r3, [sp, #8]
	lsls r2, r3, #1
	bl __ashldi3
	adds r6, r1, #0
	adds r5, r0, #0
	mov r3, sb
	ands r3, r5
	lsls r3, r3, #1
	add r3, r8
	lsls r4, r6, #0x18
	lsrs r2, r5, #8
	adds r0, r4, #0
	orrs r0, r2
	mov r2, sb
	ands r2, r0
	lsls r2, r2, #1
	add r2, r8
	ldrh r2, [r2]
	lsls r1, r2, #0x10
	ldrh r3, [r3]
	orrs r1, r3
	ldr r0, [r7]
	orrs r0, r1
	str r0, [r7]
	lsls r3, r6, #0x10
	lsrs r2, r5, #0x10
	adds r0, r3, #0
	orrs r0, r2
	mov r3, sb
	ands r3, r0
	lsls r3, r3, #1
	add r3, r8
	lsls r4, r6, #8
	lsrs r2, r5, #0x18
	adds r0, r4, #0
	orrs r0, r2
	mov r2, sb
	ands r2, r0
	lsls r2, r2, #1
	add r2, r8
	ldrh r2, [r2]
	lsls r1, r2, #0x10
	ldrh r3, [r3]
	orrs r1, r3
	ldr r0, [r7, #0x20]
	orrs r0, r1
	str r0, [r7, #0x20]
	adds r0, r6, #0
	mov r3, sb
	ands r3, r0
	lsls r3, r3, #1
	add r3, r8
	lsrs r0, r6, #8
	mov r2, sb
	ands r2, r0
	lsls r2, r2, #1
	add r2, r8
	ldrh r2, [r2]
	lsls r1, r2, #0x10
	ldrh r3, [r3]
	orrs r1, r3
	ldr r0, [r7, #0x40]
	orrs r0, r1
	str r0, [r7, #0x40]
	adds r7, #4
	movs r0, #1
	rsbs r0, r0, #0
	add sl, r0
	mov r1, sl
	cmp r1, #0
	bge _08005C20
	ldr r0, _08005D88 @ =gActiveFont
	ldr r0, [r0]
	ldr r1, [r0, #0xc]
	ldr r0, [sp]
	bl _call_via_r1
	movs r2, #0x80
	lsls r2, r2, #3
	adds r7, r0, r2
	movs r3, #0xff
	mov sb, r3
	movs r0, #7
	mov sl, r0
_08005CD2:
	ldr r2, [sp, #0xc]
	ldm r2!, {r0}
	str r2, [sp, #0xc]
	movs r1, #0
	ldr r2, [sp, #0x10]
	bl __ashldi3
	adds r6, r1, #0
	adds r5, r0, #0
	mov r3, sb
	ands r3, r5
	lsls r3, r3, #1
	add r3, r8
	lsls r4, r6, #0x18
	lsrs r2, r5, #8
	adds r0, r4, #0
	orrs r0, r2
	mov r2, sb
	ands r2, r0
	lsls r2, r2, #1
	add r2, r8
	ldrh r2, [r2]
	lsls r1, r2, #0x10
	ldrh r3, [r3]
	orrs r1, r3
	ldr r0, [r7]
	orrs r0, r1
	str r0, [r7]
	lsls r3, r6, #0x10
	lsrs r2, r5, #0x10
	adds r0, r3, #0
	orrs r0, r2
	mov r3, sb
	ands r3, r0
	lsls r3, r3, #1
	add r3, r8
	lsls r4, r6, #8
	lsrs r2, r5, #0x18
	adds r0, r4, #0
	orrs r0, r2
	mov r2, sb
	ands r2, r0
	lsls r2, r2, #1
	add r2, r8
	ldrh r2, [r2]
	lsls r1, r2, #0x10
	ldrh r3, [r3]
	orrs r1, r3
	ldr r0, [r7, #0x20]
	orrs r0, r1
	str r0, [r7, #0x20]
	adds r0, r6, #0
	mov r3, sb
	ands r3, r0
	lsls r3, r3, #1
	add r3, r8
	lsrs r0, r6, #8
	mov r2, sb
	ands r2, r0
	lsls r2, r2, #1
	add r2, r8
	ldrh r2, [r2]
	lsls r1, r2, #0x10
	ldrh r3, [r3]
	orrs r1, r3
	ldr r0, [r7, #0x40]
	orrs r0, r1
	str r0, [r7, #0x40]
	adds r7, #4
	movs r3, #1
	rsbs r3, r3, #0
	add sl, r3
	mov r0, sl
	cmp r0, #0
	bge _08005CD2
	ldr r1, [sp]
	ldrb r2, [r1, #2]
	ldr r1, [sp, #4]
	ldrb r1, [r1, #5]
	adds r0, r2, r1
	ldr r2, [sp]
	strb r0, [r2, #2]
	add sp, #0x14
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08005D88: .4byte gActiveFont

	thumb_func_start sub_8005D8C
sub_8005D8C: @ 0x08005D8C
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r1, r4, #0
	adds r1, #0x35
	ldrb r0, [r1]
	subs r0, #1
	strb r0, [r1]
	lsls r0, r0, #0x18
	cmp r0, #0
	bgt _08005DFA
	adds r0, r4, #0
	adds r0, #0x34
	ldrb r0, [r0]
	strb r0, [r1]
	movs r5, #0
	adds r0, r4, #0
	adds r0, #0x36
	movs r1, #0
	ldrsb r1, [r0, r1]
	adds r6, r0, #0
	cmp r5, r1
	bge _08005DFA
_08005DB8:
	ldr r0, [r4, #0x30]
	ldrb r2, [r0]
	adds r1, r0, #0
	cmp r2, #0
	blt _08005DE8
	cmp r2, #1
	ble _08005DCC
	cmp r2, #4
	beq _08005DDA
	b _08005DE8
_08005DCC:
	ldr r1, [r4, #0x2c]
	movs r0, #0
	strb r0, [r1, #7]
	adds r0, r4, #0
	bl Proc_Break
	b _08005DFA
_08005DDA:
	adds r0, r1, #1
	str r0, [r4, #0x30]
	ldr r0, [r4, #0x2c]
	movs r1, #6
	bl Text_Skip
	b _08005DF0
_08005DE8:
	ldr r0, [r4, #0x2c]
	bl Text_DrawCharacter
	str r0, [r4, #0x30]
_08005DF0:
	adds r5, #1
	movs r0, #0
	ldrsb r0, [r6, r0]
	cmp r5, r0
	blt _08005DB8
_08005DFA:
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	thumb_func_start sub_8005E00
sub_8005E00: @ 0x08005E00
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	adds r6, r1, #0
	adds r7, r2, #0
	adds r4, r3, #0
	cmp r7, #0
	bne _08005E12
	bl Text_DrawString
_08005E12:
	cmp r4, #0
	bne _08005E18
	movs r4, #1
_08005E18:
	ldr r0, _08005E44 @ =gUnk_08BC05C4
	movs r1, #3
	bl Proc_Start
	adds r2, r0, #0
	str r5, [r2, #0x2c]
	str r6, [r2, #0x30]
	adds r0, #0x36
	movs r1, #0
	strb r4, [r0]
	subs r0, #2
	strb r7, [r0]
	adds r0, #1
	strb r1, [r0]
	movs r0, #1
	strb r0, [r5, #7]
	adds r0, r6, #0
	bl GetStringLineEnd
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_08005E44: .4byte gUnk_08BC05C4

	thumb_func_start sub_8005E48
sub_8005E48: @ 0x08005E48
	ldrb r0, [r0, #7]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bx lr

	thumb_func_start sub_8005E50
sub_8005E50: @ 0x08005E50
	push {lr}
	ldr r0, _08005E5C @ =gUnk_08BC05C4
	bl sub_8004748
	pop {r0}
	bx r0
	.align 2, 0
_08005E5C: .4byte gUnk_08BC05C4

	thumb_func_start sub_8005E60
sub_8005E60: @ 0x08005E60
	push {lr}
	bl GetGameTime
	lsrs r0, r0, #2
	movs r1, #0xf
	ands r0, r1
	ldr r2, _08005E80 @ =gPal
	lsls r0, r0, #1
	ldr r1, _08005E84 @ =gUnk_08190288
	adds r0, r0, r1
	ldrh r0, [r0]
	strh r0, [r2, #0x1c]
	bl EnablePalSync
	pop {r0}
	bx r0
	.align 2, 0
_08005E80: .4byte gPal
_08005E84: .4byte gUnk_08190288

	thumb_func_start sub_8005E88
sub_8005E88: @ 0x08005E88
	push {lr}
	adds r1, r0, #0
	cmp r1, #0
	beq _08005E9C
	ldr r0, _08005E98 @ =gUnk_08BC05D4
	bl Proc_Start
	b _08005EA4
	.align 2, 0
_08005E98: .4byte gUnk_08BC05D4
_08005E9C:
	ldr r0, _08005EA8 @ =gUnk_08BC05D4
	movs r1, #3
	bl Proc_Start
_08005EA4:
	pop {r0}
	bx r0
	.align 2, 0
_08005EA8: .4byte gUnk_08BC05D4

	thumb_func_start sub_8005EAC
sub_8005EAC: @ 0x08005EAC
	push {lr}
	ldr r0, _08005EB8 @ =gUnk_08BC05D4
	bl sub_8004748
	pop {r0}
	bx r0
	.align 2, 0
_08005EB8: .4byte gUnk_08BC05D4

	thumb_func_start sub_8005EBC
sub_8005EBC: @ 0x08005EBC
	push {r4, r5, lr}
	adds r4, r0, #0
	mov ip, r1
	adds r5, r2, #0
	ldr r0, _08005EE0 @ =gActiveFont
	ldr r1, [r0]
	ldrb r2, [r4, #4]
	ldrb r3, [r4, #6]
	adds r0, r3, #0
	muls r0, r2, r0
	ldrh r3, [r4]
	adds r0, r3, r0
	lsls r0, r0, #1
	ldrh r1, [r1, #0x10]
	adds r1, r1, r0
	movs r3, #0
	b _08005EF6
	.align 2, 0
_08005EE0: .4byte gActiveFont
_08005EE4:
	mov r0, ip
	strh r1, [r0]
	adds r1, #1
	adds r0, #0x40
	strh r1, [r0]
	adds r1, #1
	movs r0, #2
	add ip, r0
	adds r3, #1
_08005EF6:
	cmp r3, r2
	bge _08005EFE
	cmp r3, r5
	blt _08005EE4
_08005EFE:
	movs r0, #5
	ldrsb r0, [r4, r0]
	cmp r0, #0
	beq _08005F0E
	movs r0, #1
	ldrb r1, [r4, #6]
	eors r0, r1
	strb r0, [r4, #6]
_08005F0E:
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start sub_8005F14
sub_8005F14: @ 0x08005F14
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	ldr r3, _08005F6C @ =gActiveFont
	ldr r3, [r3]
	lsls r0, r0, #6
	ldr r3, [r3]
	adds r3, r3, r0
	mov r8, r3
	adds r7, r2, #0
	adds r7, #8
	adds r0, r1, #0
	bl GetColorLut
	adds r2, r0, #0
	movs r6, #0xff
	movs r3, #0xf
_08005F36:
	ldm r7!, {r0}
	adds r1, r0, #0
	ands r1, r6
	lsls r1, r1, #1
	adds r1, r1, r2
	ldrh r4, [r1]
	lsrs r0, r0, #8
	ands r0, r6
	lsls r0, r0, #1
	adds r0, r0, r2
	ldrh r5, [r0]
	lsls r0, r5, #0x10
	adds r0, r0, r4
	mov r1, r8
	adds r1, #4
	mov r8, r1
	subs r1, #4
	stm r1!, {r0}
	subs r3, #1
	cmp r3, #0
	bge _08005F36
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08005F6C: .4byte gActiveFont

	thumb_func_start sub_8005F70
sub_8005F70: @ 0x08005F70
	push {r4, r5, lr}
	adds r5, r0, #0
	strb r1, [r5]
	strb r2, [r5, #1]
	ldr r0, _08005FA4 @ =gActiveFont
	ldr r3, [r0]
	ldrh r4, [r3, #0x12]
	adds r0, r4, #1
	strh r0, [r3, #0x12]
	strh r4, [r5, #2]
	movs r0, #0xff
	strb r0, [r5, #4]
	movs r3, #2
	ldrsh r0, [r5, r3]
	ldr r3, _08005FA8 @ =gUnk_08BDC134
	lsls r2, r2, #2
	adds r2, r2, r3
	ldr r2, [r2]
	bl sub_8005F14
	movs r1, #2
	ldrsh r0, [r5, r1]
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_08005FA4: .4byte gActiveFont
_08005FA8: .4byte gUnk_08BDC134

	thumb_func_start sub_8005FAC
sub_8005FAC: @ 0x08005FAC
	push {lr}
	adds r3, r0, #0
	adds r2, r1, #0
	ldr r1, _08005FC8 @ =0x02028D6C
_08005FB4:
	movs r0, #0
	ldrsb r0, [r1, r0]
	cmp r0, #0
	bge _08005FCC
	adds r0, r1, #0
	adds r1, r3, #0
	bl sub_8005F70
	b _08005FE6
	.align 2, 0
_08005FC8: .4byte 0x02028D6C
_08005FCC:
	movs r0, #0
	ldrsb r0, [r1, r0]
	cmp r0, r3
	bne _08005FE2
	movs r0, #1
	ldrsb r0, [r1, r0]
	cmp r0, r2
	bne _08005FE2
	movs r2, #2
	ldrsh r0, [r1, r2]
	b _08005FE6
_08005FE2:
	adds r1, #4
	b _08005FB4
_08005FE6:
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_8005FEC
sub_8005FEC: @ 0x08005FEC
	push {r4, lr}
	adds r4, r0, #0
	adds r0, r1, #0
	adds r1, r2, #0
	cmp r1, #0xff
	bne _08006004
	movs r1, #0
	strh r1, [r4]
	adds r0, r4, #0
	adds r0, #0x40
	strh r1, [r0]
	b _0800601C
_08006004:
	bl sub_8005FAC
	lsls r0, r0, #1
	ldr r1, _08006024 @ =gActiveFont
	ldr r1, [r1]
	ldrh r1, [r1, #0x10]
	adds r0, r1, r0
	strh r0, [r4]
	adds r1, r4, #0
	adds r1, #0x40
	adds r0, #1
	strh r0, [r1]
_0800601C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08006024: .4byte gActiveFont

	thumb_func_start sub_8006028
sub_8006028: @ 0x08006028
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	adds r7, r1, #0
	adds r4, r2, #0
	adds r6, r3, #0
	cmp r4, #0
	bne _0800603E
	adds r2, r6, #0
	bl sub_8005FEC
	b _08006062
_0800603E:
	adds r0, r4, #0
	movs r1, #0xa
	bl __modsi3
	adds r2, r0, #0
	adds r2, r2, r6
	adds r0, r5, #0
	adds r1, r7, #0
	bl sub_8005FEC
	adds r0, r4, #0
	movs r1, #0xa
	bl __divsi3
	adds r4, r0, #0
	subs r5, #2
	cmp r4, #0
	bne _0800603E
_08006062:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_8006068
sub_8006068: @ 0x08006068
	push {lr}
	movs r3, #0
	bl sub_8006028
	pop {r0}
	bx r0

	thumb_func_start sub_8006074
sub_8006074: @ 0x08006074
	push {lr}
	cmp r2, #0
	blt _0800607E
	cmp r2, #0xff
	bne _0800608A
_0800607E:
	subs r0, #2
	movs r2, #0x14
	movs r3, #0x14
	bl PutTwoSpecialChar
	b _0800608E
_0800608A:
	bl sub_8006068
_0800608E:
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_8006094
sub_8006094: @ 0x08006094
	push {lr}
	cmp r2, #0x64
	bne _080060A6
	subs r0, #2
	movs r2, #0x28
	movs r3, #0x29
	bl PutTwoSpecialChar
	b _080060BE
_080060A6:
	cmp r2, #0
	blt _080060AE
	cmp r2, #0xff
	bne _080060BA
_080060AE:
	subs r0, #2
	movs r2, #0x14
	movs r3, #0x14
	bl PutTwoSpecialChar
	b _080060BE
_080060BA:
	bl sub_8006068
_080060BE:
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_80060C4
sub_80060C4: @ 0x080060C4
	push {lr}
	movs r3, #0xa
	bl sub_8006028
	pop {r0}
	bx r0

	thumb_func_start sub_80060D0
sub_80060D0: @ 0x080060D0
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	cmp r5, #0
	beq _080060F4
	adds r0, r4, #0
	movs r1, #4
	movs r2, #0x15
	bl sub_8005FEC
	adds r0, r4, #2
	cmp r5, #9
	ble _080060EC
	adds r0, r4, #4
_080060EC:
	movs r1, #4
	adds r2, r5, #0
	bl sub_80060C4
_080060F4:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_80060FC
sub_80060FC: @ 0x080060FC
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	bl GetGameTime
	adds r5, r0, #0
	movs r0, #0
	ldr r1, _08006144 @ =gBg0Tm
	mov r8, r1
_0800610E:
	adds r7, r0, #1
	lsls r4, r0, #7
	movs r6, #0x1d
_08006114:
	mov r1, r8
	adds r0, r4, r1
	movs r2, #1
	ands r2, r5
	adds r5, #1
	movs r1, #0
	bl sub_8005FEC
	adds r4, #2
	subs r6, #1
	cmp r6, #0
	bge _08006114
	adds r0, r7, #0
	cmp r0, #9
	ble _0800610E
	movs r0, #1
	bl EnableBgSync
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08006144: .4byte gBg0Tm

	thumb_func_start PutTime
PutTime: @ 0x08006148
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x10
	adds r7, r0, #0
	adds r6, r1, #0
	adds r0, r2, #0
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	mov sl, r3
	mov r4, sp
	adds r4, #2
	add r1, sp, #4
	mov r8, r1
	mov r1, sp
	adds r2, r4, #0
	mov r3, r8
	bl FormatTime
	mov r1, sp
	strb r0, [r1, #8]
	lsls r0, r0, #0x18
	str r0, [sp, #0xc]
	lsrs r0, r0, #0x18
	mov sb, r0
	adds r0, r7, #4
	ldrh r2, [r1]
	adds r1, r6, #0
	bl sub_8006068
	ldrh r5, [r4]
	adds r4, r7, #0
	adds r4, #0xa
	adds r0, r5, #0
	movs r1, #0xa
	bl __modsi3
	adds r2, r0, #0
	adds r0, r4, #0
	adds r1, r6, #0
	bl sub_8005FEC
	subs r4, #2
	adds r0, r5, #0
	movs r1, #0xa
	bl __divsi3
	movs r1, #0xa
	bl __modsi3
	adds r2, r0, #0
	adds r0, r4, #0
	adds r1, r6, #0
	bl sub_8005FEC
	mov r1, r8
	ldrh r5, [r1]
	adds r4, #8
	adds r0, r5, #0
	movs r1, #0xa
	bl __modsi3
	adds r2, r0, #0
	adds r2, #0xa
	adds r0, r4, #0
	adds r1, r6, #0
	bl sub_8005FEC
	subs r4, #2
	adds r0, r5, #0
	movs r1, #0xa
	bl __divsi3
	movs r1, #0xa
	bl __modsi3
	adds r2, r0, #0
	adds r2, #0xa
	adds r0, r4, #0
	adds r1, r6, #0
	bl sub_8005FEC
	mov r0, sb
	cmp r0, #0
	beq _080061FC
	mov r1, sl
	cmp r1, #0
	beq _08006214
_080061FC:
	adds r0, r7, #6
	adds r1, r6, #0
	movs r2, #0x20
	bl sub_8005FEC
	adds r0, r7, #0
	adds r0, #0xc
	adds r1, r6, #0
	movs r2, #0x21
	bl sub_8005FEC
	b _0800622A
_08006214:
	adds r0, r7, #6
	adds r1, r6, #0
	movs r2, #0xff
	bl sub_8005FEC
	adds r0, r7, #0
	adds r0, #0xc
	adds r1, r6, #0
	movs r2, #0xff
	bl sub_8005FEC
_0800622A:
	add sp, #0x10
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start PutTwoSpecialChar
PutTwoSpecialChar: @ 0x0800623C
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r6, r3, #0
	adds r4, #2
	bl sub_8005FEC
	adds r0, r4, #0
	adds r1, r5, #0
	adds r2, r6, #0
	bl sub_8005FEC
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_800625C
sub_800625C: @ 0x0800625C
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r6, r1, #0
	adds r5, r2, #0
	adds r0, r5, #0
	movs r1, #0xa
	bl __modsi3
	adds r2, r0, #0
	adds r0, r4, #0
	adds r1, r6, #0
	bl sub_8005FEC
	subs r4, #2
	adds r0, r5, #0
	movs r1, #0xa
	bl __divsi3
	movs r1, #0xa
	bl __modsi3
	adds r2, r0, #0
	adds r0, r4, #0
	adds r1, r6, #0
	bl sub_8005FEC
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_8006298
sub_8006298: @ 0x08006298
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r6, r1, #0
	adds r5, r2, #0
	adds r0, r5, #0
	movs r1, #0xa
	bl __modsi3
	adds r2, r0, #0
	adds r2, #0xa
	adds r0, r4, #0
	adds r1, r6, #0
	bl sub_8005FEC
	subs r4, #2
	adds r0, r5, #0
	movs r1, #0xa
	bl __divsi3
	movs r1, #0xa
	bl __modsi3
	adds r2, r0, #0
	adds r2, #0xa
	adds r0, r4, #0
	adds r1, r6, #0
	bl sub_8005FEC
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_80062D8
sub_80062D8: @ 0x080062D8
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	adds r4, r0, #0
	mov r8, r1
	adds r5, r2, #0
	adds r6, r3, #0
	adds r0, r5, #0
	movs r1, #0xa
	bl __modsi3
	adds r2, r0, #0
	adds r2, r2, r6
	adds r0, r4, #0
	mov r1, r8
	bl sub_8005FEC
	subs r4, #2
	adds r0, r5, #0
	movs r1, #0xa
	bl __divsi3
	movs r1, #0xa
	bl __modsi3
	adds r2, r0, #0
	adds r2, r2, r6
	adds r0, r4, #0
	mov r1, r8
	bl sub_8005FEC
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
