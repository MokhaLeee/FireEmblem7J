	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_80A7058
sub_80A7058: @ 0x080A7058
	push {r4, r5, r6, lr}
	sub sp, #0x48
	adds r5, r1, #0
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	adds r6, r4, #0
	cmp r4, #2
	bhi _080A711C
	adds r0, r4, #0
	bl IsSaveValid
	lsls r0, r0, #0x18
	asrs r2, r0, #0x18
	cmp r2, #0
	beq _080A70E8
	adds r0, r4, #0
	mov r1, sp
	bl ReadGameSavePlaySt
	mov r0, sp
	bl GetChapterTitle
	adds r1, r5, #0
	adds r1, #0x37
	adds r1, r1, r4
	movs r2, #0
	strb r0, [r1]
	lsls r1, r4, #2
	adds r0, r5, #0
	adds r0, #0x48
	adds r0, r0, r1
	ldr r1, [sp]
	str r1, [r0]
	adds r0, r5, #0
	adds r0, #0x3a
	adds r5, r0, r4
	strb r2, [r5]
	adds r0, r4, #0
	bl sub_80A1398
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080A70B6
	movs r0, #1
	ldrb r1, [r5]
	orrs r0, r1
	strb r0, [r5]
_080A70B6:
	mov r0, sp
	bl sub_80A1384
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080A70CA
	movs r0, #2
	ldrb r1, [r5]
	orrs r0, r1
	strb r0, [r5]
_080A70CA:
	ldr r0, _080A70E0 @ =0x02000064
	adds r0, r4, r0
	mov r1, sp
	ldrb r1, [r1, #0x14]
	strb r1, [r0]
	ldr r0, _080A70E4 @ =0x02000068
	adds r0, r4, r0
	mov r1, sp
	ldrb r1, [r1, #0x1b]
	strb r1, [r0]
	b _080A7152
	.align 2, 0
_080A70E0: .4byte 0x02000064
_080A70E4: .4byte 0x02000068
_080A70E8:
	adds r0, r5, #0
	adds r0, #0x37
	adds r0, r0, r6
	movs r1, #0xff
	strb r1, [r0]
	adds r0, r5, #0
	adds r0, #0x3a
	adds r0, r0, r6
	strb r2, [r0]
	lsls r1, r6, #2
	adds r0, r5, #0
	adds r0, #0x48
	adds r0, r0, r1
	str r2, [r0]
	ldr r0, _080A7114 @ =0x02000064
	adds r0, r6, r0
	strb r2, [r0]
	ldr r0, _080A7118 @ =0x02000068
	adds r0, r6, r0
	strb r2, [r0]
	b _080A7152
	.align 2, 0
_080A7114: .4byte 0x02000064
_080A7118: .4byte 0x02000068
_080A711C:
	adds r4, r5, #0
	adds r4, #0x44
	movs r0, #0x80
	lsls r0, r0, #1
	ldrh r1, [r4]
	cmp r1, r0
	bne _080A7152
	movs r0, #3
	bl IsValidSuspendSave
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080A714E
	movs r0, #3
	mov r1, sp
	bl ReadSuspendSavePlaySt
	mov r0, sp
	ldrb r0, [r0, #0xc]
	adds r1, r5, #0
	adds r1, #0x3f
	strb r0, [r1]
	ldr r0, [sp]
	str r0, [r5, #0x54]
	b _080A7152
_080A714E:
	movs r0, #0xf0
	strh r0, [r4]
_080A7152:
	add sp, #0x48
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_80A715C
sub_80A715C: @ 0x080A715C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r8, r0
	movs r5, #0
	movs r7, #0x1b
	movs r6, #0x1a
_080A716E:
	ldr r1, _080A71E4 @ =0x02000064
	adds r1, r5, r1
	movs r0, #0x40
	ldrb r1, [r1]
	ands r0, r1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	rsbs r0, r0, #0
	asrs r4, r0, #0x1f
	movs r0, #4
	ands r4, r0
	ldr r0, _080A71E8 @ =0x02000068
	adds r0, r5, r0
	ldrb r1, [r0]
	cmp r1, #1
	bne _080A7192
	movs r0, #0x10
	orrs r4, r0
_080A7192:
	cmp r1, #2
	bne _080A719E
	movs r0, #0x20
	orrs r4, r0
	lsls r0, r4, #0x18
	lsrs r4, r0, #0x18
_080A719E:
	cmp r1, #3
	bne _080A71AA
	movs r0, #0x40
	orrs r4, r0
	lsls r0, r4, #0x18
	lsrs r4, r0, #0x18
_080A71AA:
	cmp r5, r8
	beq _080A71B6
	movs r0, #2
	orrs r4, r0
	lsls r0, r4, #0x18
	lsrs r4, r0, #0x18
_080A71B6:
	movs r1, #1
	adds r0, r4, #0
	orrs r0, r1
	adds r1, r6, #0
	bl PutChapterTitlePalette
	adds r0, r4, #0
	adds r1, r7, #0
	bl PutChapterTitlePalette
	adds r7, #2
	adds r6, #2
	adds r5, #1
	cmp r5, #2
	ble _080A716E
	bl EnablePalSync
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A71E4: .4byte 0x02000064
_080A71E8: .4byte 0x02000068

	thumb_func_start sub_80A71EC
sub_80A71EC: @ 0x080A71EC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	adds r5, r0, #0
	str r1, [sp]
	asrs r5, r5, #1
	movs r0, #0x1f
	ands r5, r0
	cmp r5, #0x10
	ble _080A720E
	movs r0, #0xf
	ands r0, r5
	movs r1, #0x10
	subs r5, r1, r0
_080A720E:
	movs r2, #0
_080A7210:
	ldr r0, _080A7240 @ =0x02000064
	adds r1, r2, r0
	movs r0, #0x40
	ldrb r1, [r1]
	ands r0, r1
	adds r1, r2, #1
	str r1, [sp, #4]
	cmp r0, #0
	beq _080A72D2
	lsls r0, r2, #6
	movs r1, #0xa0
	lsls r1, r1, #1
	adds r0, r0, r1
	ldr r1, _080A7244 @ =gPal + 0x212
	adds r0, r0, r1
	mov r8, r0
	ldr r0, [sp]
	cmp r2, r0
	bne _080A7250
	ldr r1, _080A7248 @ =gUnk_08404DA2
	mov ip, r1
	ldr r6, _080A724C @ =gUnk_08404EA2
	b _080A7256
	.align 2, 0
_080A7240: .4byte 0x02000064
_080A7244: .4byte gPal + 0x212
_080A7248: .4byte gUnk_08404DA2
_080A724C: .4byte gUnk_08404EA2
_080A7250:
	ldr r0, _080A72EC @ =gUnk_08404DC2
	mov ip, r0
	ldr r6, _080A72F0 @ =gUnk_08404EC2
_080A7256:
	adds r2, #1
	str r2, [sp, #4]
	movs r0, #0x10
	subs r7, r0, r5
	movs r1, #0xf8
	lsls r1, r1, #7
	mov sl, r1
	movs r0, #6
	mov sb, r0
_080A7268:
	mov r1, ip
	ldrh r4, [r1]
	movs r0, #0x1f
	ands r0, r4
	adds r2, r0, #0
	muls r2, r5, r2
	ldrh r3, [r6]
	movs r0, #0x1f
	ands r0, r3
	muls r0, r7, r0
	adds r2, r2, r0
	asrs r2, r2, #4
	movs r0, #0x1f
	ands r2, r0
	movs r0, #0xf8
	lsls r0, r0, #2
	ands r0, r4
	adds r1, r0, #0
	muls r1, r5, r1
	movs r0, #0xf8
	lsls r0, r0, #2
	ands r0, r3
	muls r0, r7, r0
	adds r1, r1, r0
	asrs r1, r1, #4
	movs r0, #0xf8
	lsls r0, r0, #2
	ands r1, r0
	adds r2, r2, r1
	mov r0, sl
	ands r0, r4
	adds r1, r0, #0
	muls r1, r5, r1
	mov r0, sl
	ands r0, r3
	muls r0, r7, r0
	adds r1, r1, r0
	asrs r1, r1, #4
	mov r0, sl
	ands r1, r0
	adds r2, r2, r1
	mov r1, r8
	strh r2, [r1]
	movs r0, #2
	add r8, r0
	add ip, r0
	adds r6, #2
	movs r1, #1
	rsbs r1, r1, #0
	add sb, r1
	mov r0, sb
	cmp r0, #0
	bge _080A7268
_080A72D2:
	ldr r2, [sp, #4]
	cmp r2, #2
	ble _080A7210
	bl EnablePalSync
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A72EC: .4byte gUnk_08404DC2
_080A72F0: .4byte gUnk_08404EC2

	thumb_func_start SaveMenuGetValidMenuAmt
SaveMenuGetValidMenuAmt: @ 0x080A72F4
	push {r4, lr}
	adds r4, r1, #0
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	movs r1, #0
	movs r2, #1
	cmp r2, r3
	bge _080A731A
	adds r0, r4, #0
	adds r0, #0x30
	ldrb r4, [r0]
_080A730A:
	adds r0, r4, #0
	ands r0, r2
	cmp r0, #0
	beq _080A7314
	adds r1, #1
_080A7314:
	lsls r2, r2, #1
	cmp r2, r3
	blt _080A730A
_080A731A:
	lsls r0, r1, #0x18
	lsrs r0, r0, #0x18
	pop {r4}
	pop {r1}
	bx r1

	thumb_func_start nullsub_84
nullsub_84: @ 0x080A7324
	bx lr
	.align 2, 0

	thumb_func_start sub_80A7328
sub_80A7328: @ 0x080A7328
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r4, r5, #0
	adds r4, #0x30
	movs r0, #0
	ldrsb r0, [r4, r0]
	cmp r0, #0
	bne _080A7344
	ldr r0, _080A7368 @ =0x06016000
	movs r1, #0xd
	bl LoadHelpBoxGfx
	movs r0, #1
	strb r0, [r4]
_080A7344:
	ldr r2, _080A736C @ =gUnk_08DADD90
	ldr r3, [r5, #0x2c]
	lsls r1, r3, #3
	adds r0, r1, r2
	ldr r0, [r0]
	adds r2, #4
	adds r1, r1, r2
	ldr r1, [r1]
	ldr r2, _080A7370 @ =gUnk_08DADDB0
	lsls r3, r3, #2
	adds r3, r3, r2
	ldr r2, [r3]
	bl StartHelpBox
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080A7368: .4byte 0x06016000
_080A736C: .4byte gUnk_08DADD90
_080A7370: .4byte gUnk_08DADDB0

	thumb_func_start sub_80A7374
sub_80A7374: @ 0x080A7374
	push {r4, lr}
	adds r4, r0, #0
	bl CloseHelpBox
	adds r4, #0x30
	movs r0, #0
	strb r0, [r4]
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_80A7388
sub_80A7388: @ 0x080A7388
	push {lr}
	bl sub_8032CDC
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080A7398
	bl sub_8032CCC
_080A7398:
	pop {r0}
	bx r0

	thumb_func_start sub_80A739C
sub_80A739C: @ 0x080A739C
	push {r4, lr}
	adds r4, r0, #0
	bl sub_8032CDC
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080A73B8
	ldr r0, _080A73C0 @ =0x0000079C
	bl DecodeMsg
	adds r1, r0, #0
	adds r0, r4, #0
	bl sub_8032CF4
_080A73B8:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A73C0: .4byte 0x0000079C

	thumb_func_start sub_80A73C4
sub_80A73C4: @ 0x080A73C4
	push {r4, r5, lr}
	sub sp, #0x10
	mov r2, sp
	ldr r1, _080A73FC @ =gUnk_08439338
	ldm r1!, {r3, r4, r5}
	stm r2!, {r3, r4, r5}
	ldr r1, [r1]
	str r1, [r2]
	ldr r1, _080A7400 @ =gUnk_08DADD90
	lsls r2, r0, #3
	adds r3, r2, r1
	ldr r4, [r3]
	adds r1, #4
	adds r2, r2, r1
	ldr r1, [r2]
	lsls r0, r0, #2
	add r0, sp
	ldr r2, [r0]
	movs r3, #0xc0
	lsls r3, r3, #4
	adds r0, r4, #0
	bl ShowSysHandCursor
	add sp, #0x10
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080A73FC: .4byte gUnk_08439338
_080A7400: .4byte gUnk_08DADD90

	thumb_func_start sub_80A7404
sub_80A7404: @ 0x080A7404
	push {lr}
	ldr r2, _080A7420 @ =gUnk_08DADD90
	lsls r0, r0, #3
	adds r1, r0, r2
	ldr r1, [r1]
	adds r2, #4
	adds r0, r0, r2
	ldr r2, [r0]
	movs r0, #0
	movs r3, #0
	bl SetUiCursorHandConfig
	pop {r0}
	bx r0
	.align 2, 0
_080A7420: .4byte gUnk_08DADD90

	thumb_func_start sub_80A7424
sub_80A7424: @ 0x080A7424
	push {r4, r5, r6, lr}
	ldr r4, _080A74F8 @ =gTacticianConfigFont
	ldr r1, _080A74FC @ =0x06011000
	adds r0, r4, #0
	movs r2, #0xf
	bl InitSpriteTextFont
	adds r0, r4, #0
	bl SetTextFont
	movs r0, #1
	bl SetTextFontGlyphs
	adds r4, #0x18

	movs r5, #2
_080A7442:
	adds r0, r4, #0
	bl InitSpriteText
	adds r0, r4, #0
	movs r1, #0
	bl SpriteText_DrawBackgroundExt
	adds r4, #8
	subs r5, #1
	cmp r5, #0
	bge _080A7442

	ldr r0, _080A7500 @ =Pal_08190268
	movs r1, #0xf8
	lsls r1, r1, #2
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r5, _080A7504 @ =0x02000084
	bl sub_802EBB0
	adds r3, r0, #0
	adds r0, r5, #0
	movs r1, #0
	movs r2, #4
	bl Text_InsertDrawString
	ldr r4, _080A7508 @ =gPlaySt
	adds r6, r4, #0
	adds r6, #0x2b
	ldrb r1, [r6]
	lsls r0, r1, #0x1c
	lsrs r0, r0, #0x1d
	bl sub_80A7AA8
	bl DecodeMsg
	adds r3, r0, #0
	adds r0, r5, #0
	movs r1, #0x40
	movs r2, #4
	bl Text_InsertDrawString
	ldrb r1, [r6]
	lsrs r0, r1, #4
	bl sub_80A7AB8
	bl DecodeMsg
	adds r3, r0, #0
	adds r0, r5, #0
	movs r1, #0x60
	movs r2, #4
	bl Text_InsertDrawString
	adds r4, #0x2c
	ldrb r4, [r4]
	lsls r0, r4, #0x1f
	lsrs r0, r0, #0x1f
	bl sub_80A7AC8
	bl DecodeMsg
	adds r3, r0, #0
	adds r0, r5, #0
	movs r1, #0x80
	movs r2, #4
	bl Text_InsertDrawString
	ldr r0, _080A750C @ =gBg0Tm + 0x15c
	ldr r3, _080A7510 @ =Unk_081C8FCC
	ldrb r2, [r6]
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
	movs r0, #0
	bl SetTextFont
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080A74F8: .4byte gTacticianConfigFont
_080A74FC: .4byte 0x06011000
_080A7500: .4byte Pal_08190268
_080A7504: .4byte 0x02000084
_080A7508: .4byte gPlaySt
_080A750C: .4byte gBg0Tm + 0x15c
_080A7510: .4byte Unk_081C8FCC


