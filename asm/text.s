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

.ifdef VERSION_CN
@ Chinese patch: hand-written replacement
	thumb_func_start SetTextFontGlyphs
SetTextFontGlyphs: @ 0x080052E0
	.2byte 0x4903 @ ldr r1, [pc, #12] @ (0x80052f0)
	.2byte 0x2800 @ cmp r0, #0
	.2byte 0xD100 @ bne.n 0x80052e8
	.2byte 0x312C @ adds r1, #44 @ 0x2c
	.2byte 0x4802 @ ldr r0, [pc, #8] @ (0x80052f4)
	.2byte 0x6800 @ ldr r0, [r0, #0]
_080052EC:
	.2byte 0x6041 @ str r1, [r0, #4]
	.2byte 0x4770 @ bx lr
_080052F0:
	.2byte 0x0698 @ lsls r0, r3, #26
	.2byte 0x08BC @ lsrs r4, r7, #2
_080052F4:
	.2byte 0x8D68 @ ldrh r0, [r5, #42] @ 0x2a
	.2byte 0x0202 @ lsls r2, r0, #8
	.2byte 0x4802 @ ldr r0, [pc, #8] @ (0x8005304)
_080052FA:
	.2byte 0x6048 @ str r0, [r1, #4]
	.2byte 0x4770 @ bx lr
	.2byte 0x0000 @ movs r0, r0
_08005300:
	.2byte 0x8D68 @ ldrh r0, [r5, #42] @ 0x2a
	.2byte 0x0202 @ lsls r2, r0, #8
_08005304:
	.2byte 0xC1E0 @ stmia r1!, {r5, r6, r7}
	.2byte 0x08BD @ lsrs r5, r7, #2
.else
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
.ifdef VERSION_CN
_080052F0: .4byte gCn_08BC0698
.else
_080052F0: .4byte gUnk_08BC1FEC
.endif
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
.endif

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

	thumb_func_start InitTextDb
InitTextDb: @ 0x0800536C
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

	thumb_func_start InitTextList
InitTextList: @ 0x08005394
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

	thumb_func_start ClearTextPart
ClearTextPart: @ 0x080053E8
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

	thumb_func_start Text_GetChrOffset
Text_GetChrOffset: @ 0x0800542C
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

	thumb_func_start Text_GetCursor
Text_GetCursor: @ 0x08005440
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

.ifdef VERSION_CN
@ Chinese patch: hand-written replacement
	thumb_func_start GetStringTextLen
GetStringTextLen: @ 0x080054CC
	.2byte 0xB530 @ push {r4, r5, lr}
	.2byte 0x1C04 @ adds r4, r0, #0
	.2byte 0x4913 @ ldr r1, [pc, #76] @ (0x8005520)
	.2byte 0x680A @ ldr r2, [r1, #0]
	.2byte 0x7D91 @ ldrb r1, [r2, #22]
	.2byte 0x2900 @ cmp r1, #0
	.2byte 0xD002 @ beq.n 0x80054e0
	.2byte 0xF000 @ bl 0x8005a94
	.2byte 0xFADB
	.2byte 0xE01C @ b.n 0x800551a
	.2byte 0x2000 @ movs r0, #0
	.2byte 0x6855 @ ldr r5, [r2, #4]
	.2byte 0x2180 @ movs r1, #128 @ 0x80
	.2byte 0x7823 @ ldrb r3, [r4, #0]
_080054E8:
	.2byte 0x2B01 @ cmp r3, #1
	.2byte 0xD916 @ bls.n 0x800551a
_080054EC:
	.2byte 0x3401 @ adds r4, #1
	.2byte 0x2B1F @ cmp r3, #31
	.2byte 0xD9F9 @ bls.n 0x80054e6
	.2byte 0x7822 @ ldrb r2, [r4, #0]
	.2byte 0x3401 @ adds r4, #1
	.2byte 0x2B81 @ cmp r3, #129 @ 0x81
	.2byte 0xD3F5 @ bcc.n 0x80054e6
	.2byte 0x2B98 @ cmp r3, #152 @ 0x98
	.2byte 0xD801 @ bhi.n 0x8005502
	.2byte 0x2A80 @ cmp r2, #128 @ 0x80
	.2byte 0xD201 @ bcs.n 0x8005506
	.2byte 0x2383 @ movs r3, #131 @ 0x83
_08005504:
	.2byte 0x229B @ movs r2, #155 @ 0x9b
	.2byte 0x3B81 @ subs r3, #129 @ 0x81
	.2byte 0x434B @ muls r3, r1
	.2byte 0x3A80 @ subs r2, #128 @ 0x80
	.2byte 0x18D2 @ adds r2, r2, r3
	.2byte 0x2354 @ movs r3, #84 @ 0x54
	.2byte 0x435A @ muls r2, r3
	.2byte 0x1953 @ adds r3, r2, r5
_08005514:
	.2byte 0x789A @ ldrb r2, [r3, #2]
	.2byte 0x1880 @ adds r0, r0, r2
	.2byte 0xE7E5 @ b.n 0x80054e6
	.2byte 0xBC30 @ pop {r4, r5}
_0800551C:
	.2byte 0xBC02 @ pop {r1}
	.2byte 0x4708 @ bx r1
	.2byte 0x8D68 @ ldrh r0, [r5, #42] @ 0x2a
	.2byte 0x0202 @ lsls r2, r0, #8
_08005524:
	.2byte 0xFF00 @ vmaxnm.f32 <illegal reg q7.5>, q8, <illegal reg q15.5>
	.2byte 0xFFFF
.else
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
.endif

.ifdef VERSION_CN
@ Chinese patch: hand-written replacement
	thumb_func_start GetCharTextLen
GetCharTextLen: @ 0x08005528
	.2byte 0xB410 @ push {r4}
	.2byte 0x7803 @ ldrb r3, [r0, #0]
	.2byte 0x7842 @ ldrb r2, [r0, #1]
	.2byte 0x3002 @ adds r0, #2
	.2byte 0x2B81 @ cmp r3, #129 @ 0x81
	.2byte 0xD313 @ bcc.n 0x800555c
	.2byte 0x2B98 @ cmp r3, #152 @ 0x98
	.2byte 0xD801 @ bhi.n 0x800553c
	.2byte 0x2A80 @ cmp r2, #128 @ 0x80
	.2byte 0xD201 @ bcs.n 0x8005540
	.2byte 0x2383 @ movs r3, #131 @ 0x83
	.2byte 0x229A @ movs r2, #154 @ 0x9a
	.2byte 0x3B81 @ subs r3, #129 @ 0x81
	.2byte 0x2480 @ movs r4, #128 @ 0x80
_08005544:
	.2byte 0x4363 @ muls r3, r4
	.2byte 0x3A80 @ subs r2, #128 @ 0x80
	.2byte 0x18D2 @ adds r2, r2, r3
	.2byte 0x2354 @ movs r3, #84 @ 0x54
	.2byte 0x435A @ muls r2, r3
	.2byte 0x46C0 @ nop   @ (mov r8, r8)
	.2byte 0x4B03 @ ldr r3, [pc, #12] @ (0x8005560)
	.2byte 0x681B @ ldr r3, [r3, #0]
_08005554:
	.2byte 0x685B @ ldr r3, [r3, #4]
	.2byte 0x18D2 @ adds r2, r2, r3
	.2byte 0x7893 @ ldrb r3, [r2, #2]
	.2byte 0x600B @ str r3, [r1, #0]
_0800555C:
	.2byte 0xBC10 @ pop {r4}
	.2byte 0x4770 @ bx lr
_08005560:
	.2byte 0x8D68 @ ldrh r0, [r5, #42] @ 0x2a
	.2byte 0x0202 @ lsls r2, r0, #8
.else
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
.endif

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

.ifdef VERSION_CN
@ Chinese patch: hand-written replacement
	thumb_func_start Text_DrawString
Text_DrawString: @ 0x080055DC
	.2byte 0xB5F0 @ push {r4, r5, r6, r7, lr}
	.2byte 0x1C0C @ adds r4, r1, #0
	.2byte 0x4B14 @ ldr r3, [pc, #80] @ (0x8005634)
	.2byte 0x681D @ ldr r5, [r3, #0]
	.2byte 0x7DAB @ ldrb r3, [r5, #22]
	.2byte 0x2B00 @ cmp r3, #0
	.2byte 0xD002 @ beq.n 0x80055f0
	.2byte 0xF000 @ bl 0x8005a24
	.2byte 0xFA1B
	.2byte 0xE01E @ b.n 0x800562e
	.2byte 0x686E @ ldr r6, [r5, #4]
	.2byte 0x1C07 @ adds r7, r0, #0
_080055F4:
	.2byte 0x7821 @ ldrb r1, [r4, #0]
	.2byte 0x2901 @ cmp r1, #1
_080055F8:
	.2byte 0xD919 @ bls.n 0x800562e
	.2byte 0x3401 @ adds r4, #1
	.2byte 0x291F @ cmp r1, #31
_080055FE:
	.2byte 0xD9F9 @ bls.n 0x80055f4
	.2byte 0x7822 @ ldrb r2, [r4, #0]
	.2byte 0x3401 @ adds r4, #1
	.2byte 0x2981 @ cmp r1, #129 @ 0x81
	.2byte 0xD303 @ bcc.n 0x8005610
	.2byte 0x2998 @ cmp r1, #152 @ 0x98
	.2byte 0xD801 @ bhi.n 0x8005610
_0800560C:
	.2byte 0x2A80 @ cmp r2, #128 @ 0x80
	.2byte 0xD201 @ bcs.n 0x8005614
	.2byte 0x2183 @ movs r1, #131 @ 0x83
	.2byte 0x229A @ movs r2, #154 @ 0x9a
	.2byte 0x3981 @ subs r1, #129 @ 0x81
	.2byte 0x2380 @ movs r3, #128 @ 0x80
	.2byte 0x4359 @ muls r1, r3
	.2byte 0x3A80 @ subs r2, #128 @ 0x80
	.2byte 0x1852 @ adds r2, r2, r1
	.2byte 0x2154 @ movs r1, #84 @ 0x54
_08005620:
	.2byte 0x434A @ muls r2, r1
	.2byte 0x1991 @ adds r1, r2, r6
_08005624:
	.2byte 0x1C38 @ adds r0, r7, #0
	.2byte 0x68AA @ ldr r2, [r5, #8]
_08005628:
	.2byte 0xF0BB @ bl 0x80c0798
	.2byte 0xF8B6
	.2byte 0xE7E2 @ b.n 0x80055f4
	.2byte 0xBCF0 @ pop {r4, r5, r6, r7}
	.2byte 0xBC01 @ pop {r0}
	.2byte 0x4700 @ bx r0
_08005634:
	.2byte 0x8D68 @ ldrh r0, [r5, #42] @ 0x2a
	.2byte 0x0202 @ lsls r2, r0, #8
	.2byte 0xD1F6 @ bne.n 0x8005628
	.2byte 0x6828 @ ldr r0, [r5, #0]
	.2byte 0x6882 @ ldr r2, [r0, #8]
	.2byte 0x1C30 @ adds r0, r6, #0
	.2byte 0xF0BB @ bl 0x80c0798
	.2byte 0xF8AA
_08005644:
	.2byte 0x7821 @ ldrb r1, [r4, #0]
	.2byte 0x2901 @ cmp r1, #1
	.2byte 0xD8D9 @ bhi.n 0x80055fe
_0800564A:
	.2byte 0xBC70 @ pop {r4, r5, r6}
	.2byte 0xBC01 @ pop {r0}
	.2byte 0x4700 @ bx r0
.else
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
.endif

.ifdef VERSION_CN
@ Chinese patch: hand-written replacement
	thumb_func_start Text_DrawNumber
Text_DrawNumber: @ 0x08005650
	.2byte 0xB530 @ push {r4, r5, lr}
	.2byte 0xB081 @ sub sp, #4
	.2byte 0x1C05 @ adds r5, r0, #0
	.2byte 0x1C0C @ adds r4, r1, #0
	.2byte 0x2C00 @ cmp r4, #0
	.2byte 0xD105 @ bne.n 0x8005668
	.2byte 0x4901 @ ldr r1, [pc, #4] @ (0x8005664)
	.2byte 0xF000 @ bl 0x80056d8
	.2byte 0xF83B
	.2byte 0xE019 @ b.n 0x8005698
_08005664:
	.2byte 0xF8F8 @ ldr??.w r0, [r8, #2072] @ 0x818
	.2byte 0x0818
_08005668:
	.2byte 0x1C20 @ adds r0, r4, #0
	.2byte 0x210A @ movs r1, #10
	.2byte 0xF0BB @ bl 0x80c0864
	.2byte 0xF8FA
	.2byte 0x0600 @ lsls r0, r0, #24
	.2byte 0x490B @ ldr r1, [pc, #44] @ (0x80056a0)
	.2byte 0x1840 @ adds r0, r0, r1
	.2byte 0x0C00 @ lsrs r0, r0, #16
	.2byte 0x4669 @ mov r1, sp
	.2byte 0x8008 @ strh r0, [r1, #0]
	.2byte 0x1C20 @ adds r0, r4, #0
	.2byte 0x210A @ movs r1, #10
	.2byte 0xF0BB @ bl 0x80c07cc
	.2byte 0xF8A4
	.2byte 0x1C04 @ adds r4, r0, #0
	.2byte 0x1C28 @ adds r0, r5, #0
	.2byte 0x4669 @ mov r1, sp
	.2byte 0xF000 @ bl 0x80056d8
	.2byte 0xF825
	.2byte 0x78A8 @ ldrb r0, [r5, #2]
	.2byte 0x3810 @ subs r0, #16
	.2byte 0x70A8 @ strb r0, [r5, #2]
	.2byte 0x2C00 @ cmp r4, #0
	.2byte 0xD1E7 @ bne.n 0x8005668
_08005698:
	.2byte 0xB001 @ add sp, #4
	.2byte 0xBC30 @ pop {r4, r5}
	.2byte 0xBC01 @ pop {r0}
	.2byte 0x4700 @ bx r0
_080056A0:
	.2byte 0x0000 @ movs r0, r0
	.2byte 0xB681 @ @ <UNDEFINED> instruction: 0xb681
.else
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
.endif

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

.ifdef VERSION_CN
@ Chinese patch: hand-written replacement
	thumb_func_start Text_DrawCharacter
Text_DrawCharacter: @ 0x080056D8
	.2byte 0xB570 @ push {r4, r5, r6, lr}
	.2byte 0x1C0C @ adds r4, r1, #0
	.2byte 0x4B11 @ ldr r3, [pc, #68] @ (0x8005724)
	.2byte 0x681D @ ldr r5, [r3, #0]
	.2byte 0x7DAB @ ldrb r3, [r5, #22]
	.2byte 0x2B00 @ cmp r3, #0
	.2byte 0xD002 @ beq.n 0x80056ec
	.2byte 0xF000 @ bl 0x8005a60
	.2byte 0xF9BB
	.2byte 0xE017 @ b.n 0x800571c
	.2byte 0x686E @ ldr r6, [r5, #4]
	.2byte 0x7821 @ ldrb r1, [r4, #0]
	.2byte 0x7862 @ ldrb r2, [r4, #1]
	.2byte 0x3402 @ adds r4, #2
_080056F4:
	.2byte 0x2981 @ cmp r1, #129 @ 0x81
	.2byte 0xD303 @ bcc.n 0x8005700
_080056F8:
	.2byte 0x2998 @ cmp r1, #152 @ 0x98
	.2byte 0xD801 @ bhi.n 0x8005700
	.2byte 0x2A80 @ cmp r2, #128 @ 0x80
	.2byte 0xD201 @ bcs.n 0x8005704
_08005700:
	.2byte 0x2183 @ movs r1, #131 @ 0x83
	.2byte 0x229B @ movs r2, #155 @ 0x9b
	.2byte 0x3981 @ subs r1, #129 @ 0x81
	.2byte 0x2380 @ movs r3, #128 @ 0x80
	.2byte 0x4359 @ muls r1, r3
	.2byte 0x3A80 @ subs r2, #128 @ 0x80
	.2byte 0x1852 @ adds r2, r2, r1
	.2byte 0x2154 @ movs r1, #84 @ 0x54
_08005710:
	.2byte 0x434A @ muls r2, r1
	.2byte 0x1991 @ adds r1, r2, r6
_08005714:
	.2byte 0x68AA @ ldr r2, [r5, #8]
_08005716:
	.2byte 0xF0BB @ bl 0x80c0798
	.2byte 0xF83F
	.2byte 0x1C20 @ adds r0, r4, #0
	.2byte 0xBC70 @ pop {r4, r5, r6}
	.2byte 0xBC02 @ pop {r1}
	.2byte 0x4708 @ bx r1
	.2byte 0x0000 @ movs r0, r0
_08005724:
	.2byte 0x8D68 @ ldrh r0, [r5, #42] @ 0x2a
	.2byte 0x0202 @ lsls r2, r0, #8
_08005728:
	.2byte 0x7908 @ ldrb r0, [r1, #4]
	.2byte 0x4298 @ cmp r0, r3
	.2byte 0xD1F2 @ bne.n 0x8005714
	.2byte 0x6830 @ ldr r0, [r6, #0]
	.2byte 0x6882 @ ldr r2, [r0, #8]
	.2byte 0x1C28 @ adds r0, r5, #0
	.2byte 0xF0BB @ bl 0x80c0798
	.2byte 0xF830
	.2byte 0x1C20 @ adds r0, r4, #0
_0800573A:
	.2byte 0xBC70 @ pop {r4, r5, r6}
	.2byte 0xBC02 @ pop {r1}
	.2byte 0x4708 @ bx r1
.else
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
.endif

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
.ifdef VERSION_CN
_08005770: .4byte gCn_08BC05B8
.else
_08005770: .4byte gUnk_08BC0590
.endif

.ifdef VERSION_CN
@ Chinese patch: hand-written replacement
	thumb_func_start DrawTextGlyph
DrawTextGlyph: @ 0x08005774
	.2byte 0xB570 @ push {r4, r5, r6, lr}
	.2byte 0x1C04 @ adds r4, r0, #0
	.2byte 0x4A0B @ ldr r2, [pc, #44] @ (0x80057a8)
	.2byte 0x6813 @ ldr r3, [r2, #0]
	.2byte 0x1C0D @ adds r5, r1, #0
	.2byte 0x68D9 @ ldr r1, [r3, #12]
	.2byte 0xF0BB @ bl 0x80c0794
	.2byte 0xF808
	.2byte 0x1C06 @ adds r6, r0, #0
	.2byte 0x78E0 @ ldrb r0, [r4, #3]
	.2byte 0xF7FF @ bl 0x8005764
	.2byte 0xFFEC
	.2byte 0x2307 @ movs r3, #7
	.2byte 0x78A2 @ ldrb r2, [r4, #2]
	.2byte 0x4013 @ ands r3, r2
	.2byte 0x1C29 @ adds r1, r5, #0
	.2byte 0x1C32 @ adds r2, r6, #0
	.2byte 0xF7FE @ bl 0x8004214
	.2byte 0xFD3D
	.2byte 0x78A0 @ ldrb r0, [r4, #2]
	.2byte 0x78A9 @ ldrb r1, [r5, #2]
	.2byte 0x180A @ adds r2, r1, r0
	.2byte 0x70A2 @ strb r2, [r4, #2]
	.2byte 0xBC70 @ pop {r4, r5, r6}
	.2byte 0xBC01 @ pop {r0}
	.2byte 0x4700 @ bx r0
	.2byte 0x8D68 @ ldrh r0, [r5, #42] @ 0x2a
	.2byte 0x0202 @ lsls r2, r0, #8
	.2byte 0x7949 @ ldrb r1, [r1, #5]
	.2byte 0x1850 @ adds r0, r2, r1
	.2byte 0x70A8 @ strb r0, [r5, #2]
	.2byte 0xBC18 @ pop {r3, r4}
	.2byte 0x4698 @ mov r8, r3
	.2byte 0x46A1 @ mov r9, r4
	.2byte 0xBC70 @ pop {r4, r5, r6}
	.2byte 0xBC01 @ pop {r0}
	.2byte 0x4700 @ bx r0
	.2byte 0x0000 @ movs r0, r0
_080057C0:
	.2byte 0x8D68 @ ldrh r0, [r5, #42] @ 0x2a
	.2byte 0x0202 @ lsls r2, r0, #8
.else
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
.endif

.ifdef VERSION_CN
@ Chinese patch: hand-written replacement
	thumb_func_start DrawTextGlyphNoClear
DrawTextGlyphNoClear: @ 0x080057C4
	.2byte 0xB5F0 @ push {r4, r5, r6, r7, lr}
	.2byte 0x4643 @ mov r3, r8
	.2byte 0x464C @ mov r4, r9
	.2byte 0x4655 @ mov r5, sl
	.2byte 0x465E @ mov r6, fp
	.2byte 0x4667 @ mov r7, ip
	.2byte 0xB4F8 @ push {r3, r4, r5, r6, r7}
	.2byte 0x788A @ ldrb r2, [r1, #2]
	.2byte 0xB405 @ push {r0, r2}
	.2byte 0x784A @ ldrb r2, [r1, #1]
	.2byte 0x4694 @ mov ip, r2
	.2byte 0x2310 @ movs r3, #16
	.2byte 0x1A9B @ subs r3, r3, r2
	.2byte 0x2B03 @ cmp r3, #3
	.2byte 0xDB00 @ blt.n 0x80057e4
	.2byte 0x3B01 @ subs r3, #1
	.2byte 0x009C @ lsls r4, r3, #2
	.2byte 0x780A @ ldrb r2, [r1, #0]
	.2byte 0x4693 @ mov fp, r2
	.2byte 0x7882 @ ldrb r2, [r0, #2]
	.2byte 0x2307 @ movs r3, #7
	.2byte 0x401A @ ands r2, r3
	.2byte 0x0093 @ lsls r3, r2, #2
	.2byte 0x469A @ mov sl, r3
	.2byte 0x3104 @ adds r1, #4
	.2byte 0x4688 @ mov r8, r1
	.2byte 0x4A28 @ ldr r2, [pc, #160] @ (0x800589c)
	.2byte 0x6812 @ ldr r2, [r2, #0]
	.2byte 0x68D1 @ ldr r1, [r2, #12]
	.2byte 0xF0BA @ bl 0x80c0794
	.2byte 0xFFC9
	.2byte 0x1900 @ adds r0, r0, r4
	.2byte 0x4681 @ mov r9, r0
	.2byte 0x9800 @ ldr r0, [sp, #0]
	.2byte 0x78C0 @ ldrb r0, [r0, #3]
	.2byte 0xF7FF @ bl 0x8005764
_0800580C:
	.2byte 0xFFAB
	.2byte 0xB401 @ push {r0}
	.2byte 0x4823 @ ldr r0, [pc, #140] @ (0x80058a0)
	.2byte 0xB401 @ push {r0}
	.2byte 0x2500 @ movs r5, #0
	.2byte 0x464F @ mov r7, r9
	.2byte 0x4653 @ mov r3, sl
	.2byte 0x465C @ mov r4, fp
	.2byte 0x2100 @ movs r1, #0
	.2byte 0x43C9 @ mvns r1, r1
	.2byte 0x2200 @ movs r2, #0
	.2byte 0x2D00 @ cmp r5, #0
	.2byte 0xD103 @ bne.n 0x800582e
	.2byte 0x4640 @ mov r0, r8
	.2byte 0xC840 @ ldmia r0!, {r6}
	.2byte 0x4680 @ mov r8, r0
	.2byte 0x2510 @ movs r5, #16
	.2byte 0x2003 @ movs r0, #3
	.2byte 0x4030 @ ands r0, r6
	.2byte 0x4468 @ add r0, sp
	.2byte 0x7800 @ ldrb r0, [r0, #0]
	.2byte 0x4098 @ lsls r0, r3
	.2byte 0x4381 @ bics r1, r0
	.2byte 0x2003 @ movs r0, #3
	.2byte 0x4030 @ ands r0, r6
	.2byte 0x4468 @ add r0, sp
	.2byte 0x3004 @ adds r0, #4
	.2byte 0x7800 @ ldrb r0, [r0, #0]
	.2byte 0x4098 @ lsls r0, r3
	.2byte 0x4302 @ orrs r2, r0
	.2byte 0x3D01 @ subs r5, #1
	.2byte 0x08B6 @ lsrs r6, r6, #2
	.2byte 0x3C01 @ subs r4, #1
	.2byte 0xD007 @ beq.n 0x8005860
	.2byte 0x3304 @ adds r3, #4
	.2byte 0x2B20 @ cmp r3, #32
	.2byte 0xD3E5 @ bcc.n 0x8005822
	.2byte 0xF000 @ bl 0x8005890
	.2byte 0xF81B
	.2byte 0x3740 @ adds r7, #64 @ 0x40
	.2byte 0x2300 @ movs r3, #0
	.2byte 0xE7DD @ b.n 0x800581c
	.2byte 0xF000 @ bl 0x8005890
	.2byte 0xF816
	.2byte 0x4660 @ mov r0, ip
	.2byte 0x3801 @ subs r0, #1
	.2byte 0xD004 @ beq.n 0x8005874
	.2byte 0x4684 @ mov ip, r0
	.2byte 0x464F @ mov r7, r9
	.2byte 0x3704 @ adds r7, #4
	.2byte 0x46B9 @ mov r9, r7
	.2byte 0xE7D1 @ b.n 0x8005818
	.2byte 0xB002 @ add sp, #8
	.2byte 0xBC03 @ pop {r0, r1}
	.2byte 0x7882 @ ldrb r2, [r0, #2]
	.2byte 0x1852 @ adds r2, r2, r1
	.2byte 0x7082 @ strb r2, [r0, #2]
	.2byte 0xBCF8 @ pop {r3, r4, r5, r6, r7}
	.2byte 0x4698 @ mov r8, r3
	.2byte 0x46A1 @ mov r9, r4
	.2byte 0x46AA @ mov sl, r5
	.2byte 0x46B3 @ mov fp, r6
	.2byte 0x46BC @ mov ip, r7
	.2byte 0xBCF0 @ pop {r4, r5, r6, r7}
	.2byte 0xBC01 @ pop {r0}
	.2byte 0x4700 @ bx r0
	.2byte 0x6838 @ ldr r0, [r7, #0]
	.2byte 0x4008 @ ands r0, r1
	.2byte 0x4310 @ orrs r0, r2
	.2byte 0x6038 @ str r0, [r7, #0]
	.2byte 0x4770 @ bx lr
	.2byte 0x0000 @ movs r0, r0
	.2byte 0x8D68 @ ldrh r0, [r5, #42] @ 0x2a
	.2byte 0x0202 @ lsls r2, r0, #8
	.2byte 0x0F00 @ lsrs r0, r0, #28
	.2byte 0x0F0F @ lsrs r7, r1, #28
	.2byte 0x24FF @ movs r4, #255 @ 0xff
	.2byte 0x4014 @ ands r4, r2
	.2byte 0x0064 @ lsls r4, r4, #1
	.2byte 0x4652 @ mov r2, sl
	.2byte 0x18A5 @ adds r5, r4, r2
	.2byte 0x0A0A @ lsrs r2, r1, #8
	.2byte 0x21FF @ movs r1, #255 @ 0xff
	.2byte 0x4011 @ ands r1, r2
	.2byte 0x0049 @ lsls r1, r1, #1
	.2byte 0x4653 @ mov r3, sl
	.2byte 0x18C8 @ adds r0, r1, r3
	.2byte 0x8800 @ ldrh r0, [r0, #0]
	.2byte 0x0400 @ lsls r0, r0, #16
	.2byte 0x882D @ ldrh r5, [r5, #0]
	.2byte 0x4328 @ orrs r0, r5
	.2byte 0x6C3A @ ldr r2, [r7, #64] @ 0x40
	.2byte 0x4002 @ ands r2, r0
	.2byte 0x444C @ add r4, r9
	.2byte 0x4449 @ add r1, r9
	.2byte 0x8809 @ ldrh r1, [r1, #0]
	.2byte 0x0408 @ lsls r0, r1, #16
	.2byte 0x8824 @ ldrh r4, [r4, #0]
	.2byte 0x4320 @ orrs r0, r4
	.2byte 0x4302 @ orrs r2, r0
	.2byte 0x643A @ str r2, [r7, #64] @ 0x40
	.2byte 0x3704 @ adds r7, #4
	.2byte 0x9E02 @ ldr r6, [sp, #8]
	.2byte 0x3E01 @ subs r6, #1
	.2byte 0x9602 @ str r6, [sp, #8]
	.2byte 0x2E00 @ cmp r6, #0
	.2byte 0xDA94 @ bge.n 0x800580c
	.2byte 0x9900 @ ldr r1, [sp, #0]
	.2byte 0x788A @ ldrb r2, [r1, #2]
	.2byte 0x9901 @ ldr r1, [sp, #4]
	.2byte 0x7949 @ ldrb r1, [r1, #5]
	.2byte 0x1850 @ adds r0, r2, r1
	.2byte 0x9A00 @ ldr r2, [sp, #0]
	.2byte 0x7090 @ strb r0, [r2, #2]
	.2byte 0xB006 @ add sp, #24
	.2byte 0xBC38 @ pop {r3, r4, r5}
	.2byte 0x4698 @ mov r8, r3
	.2byte 0x46A1 @ mov r9, r4
	.2byte 0x46AA @ mov sl, r5
	.2byte 0xBCF0 @ pop {r4, r5, r6, r7}
	.2byte 0xBC01 @ pop {r0}
	.2byte 0x4700 @ bx r0
_08005900:
	.2byte 0x8D68 @ ldrh r0, [r5, #42] @ 0x2a
	.2byte 0x0202 @ lsls r2, r0, #8
.else
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
.endif

	thumb_func_start InitSystemTextFont
InitSystemTextFont: @ 0x08005904
	push {r4, lr}
	ldr r0, _08005934 @ =Pal_Text
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
_08005934: .4byte Pal_Text
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

.ifdef VERSION_CN
@ Chinese patch: hand-written replacement
	thumb_func_start DrawSpriteTextGlyph
DrawSpriteTextGlyph: @ 0x08005BDC
	.2byte 0xB5F0 @ push {r4, r5, r6, r7, lr}
	.2byte 0x4643 @ mov r3, r8
	.2byte 0x464C @ mov r4, r9
	.2byte 0x4655 @ mov r5, sl
	.2byte 0x465E @ mov r6, fp
	.2byte 0x4667 @ mov r7, ip
	.2byte 0xB4F8 @ push {r3, r4, r5, r6, r7}
	.2byte 0x788A @ ldrb r2, [r1, #2]
	.2byte 0xB405 @ push {r0, r2}
	.2byte 0x784A @ ldrb r2, [r1, #1]
	.2byte 0x4694 @ mov ip, r2
	.2byte 0x2310 @ movs r3, #16
	.2byte 0x1A9B @ subs r3, r3, r2
	.2byte 0x2B03 @ cmp r3, #3
	.2byte 0xDB00 @ blt.n 0x8005bfc
	.2byte 0x3B01 @ subs r3, #1
	.2byte 0x009C @ lsls r4, r3, #2
	.2byte 0x2508 @ movs r5, #8
	.2byte 0x1AED @ subs r5, r5, r3
	.2byte 0x780A @ ldrb r2, [r1, #0]
	.2byte 0x4693 @ mov fp, r2
	.2byte 0x7882 @ ldrb r2, [r0, #2]
	.2byte 0x2307 @ movs r3, #7
	.2byte 0x401A @ ands r2, r3
	.2byte 0x0093 @ lsls r3, r2, #2
	.2byte 0x469A @ mov sl, r3
	.2byte 0x3104 @ adds r1, #4
	.2byte 0x4688 @ mov r8, r1
	.2byte 0x4A27 @ ldr r2, [pc, #156] @ (0x8005cb4)
	.2byte 0x6812 @ ldr r2, [r2, #0]
	.2byte 0x68D1 @ ldr r1, [r2, #12]
	.2byte 0xF0BA @ bl 0x80c0794
	.2byte 0xFDBB
	.2byte 0x1900 @ adds r0, r0, r4
_08005C20:
	.2byte 0x4681 @ mov r9, r0
	.2byte 0x9800 @ ldr r0, [sp, #0]
	.2byte 0x78C0 @ ldrb r0, [r0, #3]
	.2byte 0xF7FF @ bl 0x8005764
	.2byte 0xFD9D
	.2byte 0xB401 @ push {r0}
	.2byte 0x1C29 @ adds r1, r5, #0
	.2byte 0x2500 @ movs r5, #0
	.2byte 0x464F @ mov r7, r9
	.2byte 0x4653 @ mov r3, sl
	.2byte 0x465C @ mov r4, fp
	.2byte 0x2200 @ movs r2, #0
	.2byte 0x2D00 @ cmp r5, #0
	.2byte 0xD103 @ bne.n 0x8005c44
	.2byte 0x4640 @ mov r0, r8
	.2byte 0xC840 @ ldmia r0!, {r6}
	.2byte 0x4680 @ mov r8, r0
	.2byte 0x2510 @ movs r5, #16
	.2byte 0x3D01 @ subs r5, #1
	.2byte 0x2003 @ movs r0, #3
	.2byte 0x4030 @ ands r0, r6
	.2byte 0x08B6 @ lsrs r6, r6, #2
	.2byte 0x4468 @ add r0, sp
	.2byte 0x7800 @ ldrb r0, [r0, #0]
	.2byte 0x4098 @ lsls r0, r3
	.2byte 0x4302 @ orrs r2, r0
	.2byte 0x3C01 @ subs r4, #1
	.2byte 0xD007 @ beq.n 0x8005c68
	.2byte 0x3304 @ adds r3, #4
	.2byte 0x2B20 @ cmp r3, #32
	.2byte 0xD3EC @ bcc.n 0x8005c38
	.2byte 0xF000 @ bl 0x8005caa
	.2byte 0xF824
	.2byte 0x3720 @ adds r7, #32
	.2byte 0x2300 @ movs r3, #0
	.2byte 0xE7E6 @ b.n 0x8005c36
	.2byte 0xF000 @ bl 0x8005caa
	.2byte 0xF81F
	.2byte 0x4660 @ mov r0, ip
	.2byte 0x3801 @ subs r0, #1
	.2byte 0xD00D @ beq.n 0x8005c8e
	.2byte 0x4684 @ mov ip, r0
	.2byte 0x464F @ mov r7, r9
	.2byte 0x2900 @ cmp r1, #0
	.2byte 0xD006 @ beq.n 0x8005c88
	.2byte 0x3901 @ subs r1, #1
	.2byte 0x2900 @ cmp r1, #0
	.2byte 0xDC03 @ bgt.n 0x8005c88
	.2byte 0x2080 @ movs r0, #128 @ 0x80
	.2byte 0x00C0 @ lsls r0, r0, #3
	.2byte 0x3820 @ subs r0, #32
	.2byte 0x183F @ adds r7, r7, r0
	.2byte 0x3704 @ adds r7, #4
	.2byte 0x46B9 @ mov r9, r7
	.2byte 0xE7D1 @ b.n 0x8005c32
	.2byte 0xB001 @ add sp, #4
	.2byte 0xBC03 @ pop {r0, r1}
	.2byte 0x7882 @ ldrb r2, [r0, #2]
	.2byte 0x1852 @ adds r2, r2, r1
	.2byte 0x7082 @ strb r2, [r0, #2]
	.2byte 0xBCF8 @ pop {r3, r4, r5, r6, r7}
	.2byte 0x4698 @ mov r8, r3
	.2byte 0x46A1 @ mov r9, r4
	.2byte 0x46AA @ mov sl, r5
	.2byte 0x46B3 @ mov fp, r6
	.2byte 0x46BC @ mov ip, r7
	.2byte 0xBCF0 @ pop {r4, r5, r6, r7}
	.2byte 0xBC01 @ pop {r0}
	.2byte 0x4700 @ bx r0
	.2byte 0x6838 @ ldr r0, [r7, #0]
	.2byte 0x4310 @ orrs r0, r2
	.2byte 0x6038 @ str r0, [r7, #0]
	.2byte 0x4770 @ bx lr
	.2byte 0x0000 @ movs r0, r0
	.2byte 0x8D68 @ ldrh r0, [r5, #42] @ 0x2a
	.2byte 0x0202 @ lsls r2, r0, #8
	.2byte 0x0000
	.2byte 0x0000
	.2byte 0x0000
	.2byte 0x0000
	.2byte 0x0000
	.2byte 0x0000
	.2byte 0x0000
	.2byte 0x0000
	.2byte 0x0000
	.2byte 0x0000
	.2byte 0x0000
	.2byte 0x0000
	.2byte 0x0000
_08005CD2:
	.2byte 0x0000
	.2byte 0x0000
	.2byte 0x0000
	.2byte 0x0000
	.2byte 0x0000
	.2byte 0xB5F0 @ push {r4, r5, r6, r7, lr}
	.2byte 0x4644 @ mov r4, r8
	.2byte 0xB410 @ push {r4}
	.2byte 0x0180 @ lsls r0, r0, #6
	.2byte 0x4C19 @ ldr r4, [pc, #100] @ (0x8005d4c)
	.2byte 0x6823 @ ldr r3, [r4, #0]
	.2byte 0x681C @ ldr r4, [r3, #0]
	.2byte 0x1826 @ adds r6, r4, r0
	.2byte 0x2000 @ movs r0, #0
	.2byte 0x233F @ movs r3, #63 @ 0x3f
	.2byte 0x54F0 @ strb r0, [r6, r3]
	.2byte 0x3B01 @ subs r3, #1
	.2byte 0xDAFC @ bge.n 0x8005cf0
	.2byte 0x7854 @ ldrb r4, [r2, #1]
	.2byte 0x2510 @ movs r5, #16
	.2byte 0x1B2D @ subs r5, r5, r4
	.2byte 0x2D03 @ cmp r5, #3
	.2byte 0xDB00 @ blt.n 0x8005d02
	.2byte 0x3D01 @ subs r5, #1
	.2byte 0x00AD @ lsls r5, r5, #2
	.2byte 0x1976 @ adds r6, r6, r5
	.2byte 0x7817 @ ldrb r7, [r2, #0]
	.2byte 0x00BF @ lsls r7, r7, #2
	.2byte 0x46B8 @ mov r8, r7
	.2byte 0x1D15 @ adds r5, r2, #4
	.2byte 0x1C08 @ adds r0, r1, #0
	.2byte 0xF7FF @ bl 0x8005764
	.2byte 0xFD28
	.2byte 0xB401 @ push {r0}
	.2byte 0x2700 @ movs r7, #0
	.2byte 0x2100 @ movs r1, #0
	.2byte 0x2200 @ movs r2, #0
	.2byte 0x2F00 @ cmp r7, #0
	.2byte 0xD101 @ bne.n 0x8005d24
	.2byte 0xCD08 @ ldmia r5!, {r3}
	.2byte 0x2710 @ movs r7, #16
	.2byte 0x2003 @ movs r0, #3
	.2byte 0x4018 @ ands r0, r3
	.2byte 0x089B @ lsrs r3, r3, #2
	.2byte 0x3F01 @ subs r7, #1
	.2byte 0x4468 @ add r0, sp
	.2byte 0x7800 @ ldrb r0, [r0, #0]
	.2byte 0x4088 @ lsls r0, r1
	.2byte 0x4302 @ orrs r2, r0
	.2byte 0x3104 @ adds r1, #4
	.2byte 0x4541 @ cmp r1, r8
	.2byte 0xD3F0 @ bcc.n 0x8005d1c
	.2byte 0xC604 @ stmia r6!, {r2}
	.2byte 0x3C01 @ subs r4, #1
	.2byte 0xD1EB @ bne.n 0x8005d18
	.2byte 0xBC18 @ pop {r3, r4}
	.2byte 0x46A0 @ mov r8, r4
	.2byte 0xBCF0 @ pop {r4, r5, r6, r7}
	.2byte 0xBC01 @ pop {r0}
	.2byte 0x4700 @ bx r0
	.2byte 0x0000 @ movs r0, r0
	.2byte 0x8D68 @ ldrh r0, [r5, #42] @ 0x2a
	.2byte 0x0202 @ lsls r2, r0, #8
	.2byte 0x881B @ ldrh r3, [r3, #0]
	.2byte 0x4319 @ orrs r1, r3
	.2byte 0x6C38 @ ldr r0, [r7, #64] @ 0x40
	.2byte 0x4308 @ orrs r0, r1
	.2byte 0x6438 @ str r0, [r7, #64] @ 0x40
	.2byte 0x3704 @ adds r7, #4
	.2byte 0x2301 @ movs r3, #1
	.2byte 0x425B @ negs r3, r3
	.2byte 0x449A @ add sl, r3
	.2byte 0x4650 @ mov r0, sl
	.2byte 0x2800 @ cmp r0, #0
	.2byte 0xDAB4 @ bge.n 0x8005cd2
	.2byte 0x9900 @ ldr r1, [sp, #0]
	.2byte 0x788A @ ldrb r2, [r1, #2]
	.2byte 0x9901 @ ldr r1, [sp, #4]
	.2byte 0x7949 @ ldrb r1, [r1, #5]
	.2byte 0x1850 @ adds r0, r2, r1
	.2byte 0x9A00 @ ldr r2, [sp, #0]
	.2byte 0x7090 @ strb r0, [r2, #2]
	.2byte 0xB005 @ add sp, #20
	.2byte 0xBC38 @ pop {r3, r4, r5}
	.2byte 0x4698 @ mov r8, r3
	.2byte 0x46A1 @ mov r9, r4
	.2byte 0x46AA @ mov sl, r5
	.2byte 0xBCF0 @ pop {r4, r5, r6, r7}
	.2byte 0xBC01 @ pop {r0}
	.2byte 0x4700 @ bx r0
	.2byte 0x0000 @ movs r0, r0
_08005D88:
	.2byte 0x8D68 @ ldrh r0, [r5, #42] @ 0x2a
	.2byte 0x0202 @ lsls r2, r0, #8
.else
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
.endif

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
.ifdef VERSION_CN
_08005E44: .4byte gUnk_08BC0590
.else
_08005E44: .4byte gUnk_08BC05C4
.endif

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
	bl Proc_EndEach
	pop {r0}
	bx r0
	.align 2, 0
.ifdef VERSION_CN
_08005E5C: .4byte gUnk_08BC0590
.else
_08005E5C: .4byte gUnk_08BC05C4
.endif

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

	thumb_func_start StartGreenText
StartGreenText: @ 0x08005E88
	push {lr}
	adds r1, r0, #0
	cmp r1, #0
	beq _08005E9C
	ldr r0, _08005E98 @ =gUnk_08BC05D4
	bl Proc_Start
	b _08005EA4
	.align 2, 0
.ifdef VERSION_CN
_08005E98: .4byte gCn_08BC05A0
.else
_08005E98: .4byte gUnk_08BC05D4
.endif
_08005E9C:
	ldr r0, _08005EA8 @ =gUnk_08BC05D4
	movs r1, #3
	bl Proc_Start
_08005EA4:
	pop {r0}
	bx r0
	.align 2, 0
.ifdef VERSION_CN
_08005EA8: .4byte gCn_08BC05A0
.else
_08005EA8: .4byte gUnk_08BC05D4
.endif

	thumb_func_start EndGreenText
EndGreenText: @ 0x08005EAC
	push {lr}
	ldr r0, _08005EB8 @ =gUnk_08BC05D4
	bl Proc_EndEach
	pop {r0}
	bx r0
	.align 2, 0
.ifdef VERSION_CN
_08005EB8: .4byte gCn_08BC05A0
.else
_08005EB8: .4byte gUnk_08BC05D4
.endif

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

.ifdef VERSION_CN
@ Chinese patch: hand-written replacement
	thumb_func_start sub_8005F14
sub_8005F14: @ 0x08005F14
	.2byte 0xB500 @ push {lr}
	.2byte 0xF7FF @ bl 0x8005cdc
	.2byte 0xFEE1
	.2byte 0xBC01 @ pop {r0}
	.2byte 0x4700 @ bx r0
	.2byte 0x0180 @ lsls r0, r0, #6
	.2byte 0x681B @ ldr r3, [r3, #0]
	.2byte 0x181B @ adds r3, r3, r0
	.2byte 0x4698 @ mov r8, r3
	.2byte 0x1C17 @ adds r7, r2, #0
	.2byte 0x3708 @ adds r7, #8
	.2byte 0x1C08 @ adds r0, r1, #0
	.2byte 0xF7FF @ bl 0x8005764
	.2byte 0xFC1A
	.2byte 0x1C02 @ adds r2, r0, #0
	.2byte 0x26FF @ movs r6, #255 @ 0xff
	.2byte 0x230F @ movs r3, #15
_08005F36:
	.2byte 0xCF01 @ ldmia r7!, {r0}
	.2byte 0x1C01 @ adds r1, r0, #0
	.2byte 0x4031 @ ands r1, r6
	.2byte 0x0049 @ lsls r1, r1, #1
	.2byte 0x1889 @ adds r1, r1, r2
	.2byte 0x880C @ ldrh r4, [r1, #0]
	.2byte 0x0A00 @ lsrs r0, r0, #8
	.2byte 0x4030 @ ands r0, r6
	.2byte 0x0040 @ lsls r0, r0, #1
	.2byte 0x1880 @ adds r0, r0, r2
	.2byte 0x8805 @ ldrh r5, [r0, #0]
	.2byte 0x0428 @ lsls r0, r5, #16
	.2byte 0x1900 @ adds r0, r0, r4
	.2byte 0x4641 @ mov r1, r8
	.2byte 0x3104 @ adds r1, #4
	.2byte 0x4688 @ mov r8, r1
	.2byte 0x3904 @ subs r1, #4
	.2byte 0xC101 @ stmia r1!, {r0}
	.2byte 0x3B01 @ subs r3, #1
	.2byte 0x2B00 @ cmp r3, #0
	.2byte 0xDAEA @ bge.n 0x8005f36
	.2byte 0xBC08 @ pop {r3}
	.2byte 0x4698 @ mov r8, r3
	.2byte 0xBCF0 @ pop {r4, r5, r6, r7}
	.2byte 0xBC01 @ pop {r0}
	.2byte 0x4700 @ bx r0
	.2byte 0x0000 @ movs r0, r0
_08005F6C:
	.2byte 0x8D68 @ ldrh r0, [r5, #42] @ 0x2a
	.2byte 0x0202 @ lsls r2, r0, #8
.else
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
.endif

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
.ifdef VERSION_CN
_08005FA8: .4byte gCn_08BC05EC
.else
_08005FA8: .4byte gUnk_08BDC134
.endif

	thumb_func_start GetSpecialCharChr
GetSpecialCharChr: @ 0x08005FAC
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

	thumb_func_start PutSpecialChar
PutSpecialChar: @ 0x08005FEC
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
	bl GetSpecialCharChr
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

	thumb_func_start PutNumberExt
PutNumberExt: @ 0x08006028
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	adds r7, r1, #0
	adds r4, r2, #0
	adds r6, r3, #0
	cmp r4, #0
	bne _0800603E
	adds r2, r6, #0
	bl PutSpecialChar
	b _08006062
_0800603E:
	adds r0, r4, #0
	movs r1, #0xa
	bl __modsi3
	adds r2, r0, #0
	adds r2, r2, r6
	adds r0, r5, #0
	adds r1, r7, #0
	bl PutSpecialChar
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

	thumb_func_start PutNumber
PutNumber: @ 0x08006068
	push {lr}
	movs r3, #0
	bl PutNumberExt
	pop {r0}
	bx r0

	thumb_func_start PutNumberOrBlank
PutNumberOrBlank: @ 0x08006074
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
	bl PutNumber
_0800608E:
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start PutNumberTwoChr
PutNumberTwoChr: @ 0x08006094
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
	bl PutNumber
_080060BE:
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start PutNumberSmall
PutNumberSmall: @ 0x080060C4
	push {lr}
	movs r3, #0xa
	bl PutNumberExt
	pop {r0}
	bx r0

	thumb_func_start PutNumberBonus
PutNumberBonus: @ 0x080060D0
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	cmp r5, #0
	beq _080060F4
	adds r0, r4, #0
	movs r1, #4
	movs r2, #0x15
	bl PutSpecialChar
	adds r0, r4, #2
	cmp r5, #9
	ble _080060EC
	adds r0, r4, #4
_080060EC:
	movs r1, #4
	adds r2, r5, #0
	bl PutNumberSmall
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
	bl PutSpecialChar
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
	bl PutNumber
	ldrh r5, [r4]
	adds r4, r7, #0
	adds r4, #0xa
	adds r0, r5, #0
	movs r1, #0xa
	bl __modsi3
	adds r2, r0, #0
	adds r0, r4, #0
	adds r1, r6, #0
	bl PutSpecialChar
	subs r4, #2
	adds r0, r5, #0
	movs r1, #0xa
	bl __divsi3
	movs r1, #0xa
	bl __modsi3
	adds r2, r0, #0
	adds r0, r4, #0
	adds r1, r6, #0
	bl PutSpecialChar
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
	bl PutSpecialChar
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
	bl PutSpecialChar
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
	bl PutSpecialChar
	adds r0, r7, #0
	adds r0, #0xc
	adds r1, r6, #0
	movs r2, #0x21
	bl PutSpecialChar
	b _0800622A
_08006214:
	adds r0, r7, #6
	adds r1, r6, #0
	movs r2, #0xff
	bl PutSpecialChar
	adds r0, r7, #0
	adds r0, #0xc
	adds r1, r6, #0
	movs r2, #0xff
	bl PutSpecialChar
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
	bl PutSpecialChar
	adds r0, r4, #0
	adds r1, r5, #0
	adds r2, r6, #0
	bl PutSpecialChar
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
	bl PutSpecialChar
	subs r4, #2
	adds r0, r5, #0
	movs r1, #0xa
	bl __divsi3
	movs r1, #0xa
	bl __modsi3
	adds r2, r0, #0
	adds r0, r4, #0
	adds r1, r6, #0
	bl PutSpecialChar
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
	bl PutSpecialChar
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
	bl PutSpecialChar
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
	bl PutSpecialChar
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
	bl PutSpecialChar
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
