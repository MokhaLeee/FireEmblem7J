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
	bl sub_8082F30
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
	bl sub_8082DB8
	adds r0, r4, #0
	adds r1, r7, #0
	bl sub_8082DB8
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
	bl sub_80A98DC
	pop {r0}
	bx r0
	.align 2, 0
_080A7420: .4byte gUnk_08DADD90

	thumb_func_start sub_80A7424
sub_80A7424: @ 0x080A7424
	push {r4, r5, r6, lr}
	ldr r4, _080A74F8 @ =gpProcEkrDispUP
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
	ldr r0, _080A7500 @ =gUnk_08190268
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
_080A74F8: .4byte gpProcEkrDispUP
_080A74FC: .4byte 0x06011000
_080A7500: .4byte gUnk_08190268
_080A7504: .4byte 0x02000084
_080A7508: .4byte gPlaySt
_080A750C: .4byte gBg0Tm + 0x15c
_080A7510: .4byte Unk_081C8FCC

	thumb_func_start sub_80A7514
sub_80A7514: @ 0x080A7514
	push {r4, r5, r6, lr}
	sub sp, #4
	ldr r6, _080A7570 @ =0x0000F880
	movs r5, #0x80
	movs r4, #1
_080A751E:
	str r6, [sp]
	movs r0, #4
	adds r1, r5, #0
	movs r2, #0x28
	ldr r3, _080A7574 @ =Sprite_32x16
	bl PutSpriteExt
	adds r6, #4
	adds r5, #0x20
	subs r4, #1
	cmp r4, #0
	bge _080A751E
	ldr r4, _080A7574 @ =Sprite_32x16
	ldr r0, _080A7578 @ =0x0000F888
	str r0, [sp]
	movs r0, #4
	movs r1, #0x48
	movs r2, #0x48
	adds r3, r4, #0
	bl PutSpriteExt
	ldr r0, _080A757C @ =0x0000F88C
	str r0, [sp]
	movs r0, #4
	movs r1, #0x80
	movs r2, #0x48
	adds r3, r4, #0
	bl PutSpriteExt
	ldr r0, _080A7580 @ =0x0000F890
	str r0, [sp]
	movs r0, #4
	movs r1, #0xc0
	movs r2, #0x48
	adds r3, r4, #0
	bl PutSpriteExt
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080A7570: .4byte 0x0000F880
_080A7574: .4byte Sprite_32x16
_080A7578: .4byte 0x0000F888
_080A757C: .4byte 0x0000F88C
_080A7580: .4byte 0x0000F890

	thumb_func_start sub_80A7584
sub_80A7584: @ 0x080A7584
	push {lr}
	movs r1, #0
	str r1, [r0, #0x2c]
	adds r0, #0x30
	strb r1, [r0]
	ldr r0, _080A75BC @ =0x0000079D
	bl DecodeMsg
	bl SetTacticianName
	ldr r2, _080A75C0 @ =gPlaySt
	adds r3, r2, #0
	adds r3, #0x2b
	movs r0, #0xf
	rsbs r0, r0, #0
	ldrb r1, [r3]
	ands r0, r1
	movs r1, #0xf
	ands r0, r1
	strb r0, [r3]
	adds r2, #0x2c
	movs r0, #2
	rsbs r0, r0, #0
	ldrb r1, [r2]
	ands r0, r1
	strb r0, [r2]
	pop {r0}
	bx r0
	.align 2, 0
_080A75BC: .4byte 0x0000079D
_080A75C0: .4byte gPlaySt

	thumb_func_start sub_80A75C4
sub_80A75C4: @ 0x080A75C4
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	mov sb, r0
	movs r0, #0
	bl InitBgs
	bl ApplySystemObjectsGraphics
	ldr r7, _080A76A0 @ =gDispIo
	adds r6, r7, #0
	adds r6, #0x3c
	movs r4, #0x3f
	adds r0, r4, #0
	ldrb r1, [r6]
	ands r0, r1
	strb r0, [r6]
	movs r5, #0
	movs r0, #0x10
	ldr r2, _080A76A4 @ =0x030027D4
	strb r0, [r2]
	movs r1, #0x45
	adds r1, r1, r7
	mov r8, r1
	strb r5, [r1]
	movs r2, #0x46
	adds r2, r2, r7
	mov sl, r2
	strb r5, [r2]
	bl ResetText
	bl UnpackUiWindowFrameGraphics
	bl InitIcons
	movs r0, #4
	bl ApplyIconPalettes
	movs r1, #4
	rsbs r1, r1, #0
	adds r0, r1, #0
	ldrb r2, [r7, #0xc]
	ands r0, r2
	strb r0, [r7, #0xc]
	ldrb r0, [r7, #0x10]
	ands r1, r0
	movs r0, #2
	orrs r1, r0
	strb r1, [r7, #0x10]
	movs r0, #3
	ldrb r1, [r7, #0x14]
	orrs r1, r0
	strb r1, [r7, #0x14]
	ldrb r1, [r7, #0x18]
	orrs r0, r1
	strb r0, [r7, #0x18]
	ldrb r2, [r6]
	ands r4, r2
	strb r4, [r6]
	movs r1, #0x10
	ldr r0, _080A76A4 @ =0x030027D4
	strb r1, [r0]
	mov r2, r8
	strb r5, [r2]
	mov r0, sl
	strb r5, [r0]
	ldr r0, _080A76A8 @ =gUnk_084364A0
	ldr r1, _080A76AC @ =0x06001000
	bl Decompress
	ldr r0, _080A76B0 @ =gUnk_08436480
	movs r1, #0xf0
	lsls r1, r1, #1
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r0, _080A76B4 @ =gBg2Tm
	ldr r1, _080A76B8 @ =gUnk_08438954
	ldr r2, _080A76BC @ =0x0000F080
	bl TmApplyTsa_thm
	mov r0, sb
	bl sub_80A98C8
	ldr r1, _080A76C0 @ =0x06008000
	movs r0, #0
	movs r2, #0xa
	movs r3, #1
	bl StartMuralBackgroundExt
	bl sub_80A7424
	ldr r0, _080A76C4 @ =sub_80A7514
	mov r1, sb
	bl StartParallelWorker
	movs r0, #0xb4
	movs r1, #0x10
	mov r2, sb
	bl StartHelpPromptSprite
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A76A0: .4byte gDispIo
_080A76A4: .4byte 0x030027D4
_080A76A8: .4byte gUnk_084364A0
_080A76AC: .4byte 0x06001000
_080A76B0: .4byte gUnk_08436480
_080A76B4: .4byte gBg2Tm
_080A76B8: .4byte gUnk_08438954
_080A76BC: .4byte 0x0000F080
_080A76C0: .4byte 0x06008000
_080A76C4: .4byte sub_80A7514

	thumb_func_start sub_80A76C8
sub_80A76C8: @ 0x080A76C8
	push {r4, lr}
	adds r4, r0, #0
	bl EndSysHandCursor
	adds r0, r4, #0
	bl ResetSysHandCursor
	movs r0, #0xc0
	lsls r0, r0, #3
	movs r1, #1
	bl DisplaySysHandCursorTextShadow
	movs r0, #0
	bl sub_80A998C
	adds r0, r4, #0
	bl sub_80A739C
	ldr r0, [r4, #0x2c]
	adds r1, r4, #0
	bl sub_80A73C4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_80A76FC
sub_80A76FC: @ 0x080A76FC
	push {r4, lr}
	sub sp, #8
	adds r4, r0, #0
	bl IsGamePlayedThrough
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080A772C
	bl EndSysHandCursor
	bl sub_80A7388
	ldr r2, _080A7734 @ =0x0000079E
	ldr r3, _080A7738 @ =0x06016000
	movs r0, #0xd
	str r0, [sp]
	str r4, [sp, #4]
	movs r0, #0x30
	movs r1, #0x5a
	bl sub_8084068
	movs r0, #0x70
	bl sub_8083B9C
_080A772C:
	add sp, #8
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A7734: .4byte 0x0000079E
_080A7738: .4byte 0x06016000

	thumb_func_start sub_80A773C
sub_80A773C: @ 0x080A773C
	push {r4, lr}
	sub sp, #8
	adds r4, r0, #0
	bl EndSysHandCursor
	bl sub_80A7388
	ldr r2, _080A7770 @ =0x0000079F
	ldr r3, _080A7774 @ =0x06016000
	movs r0, #0xd
	str r0, [sp]
	str r4, [sp, #4]
	movs r0, #0x70
	movs r1, #0x5a
	bl sub_8084068
	movs r0, #0x70
	bl sub_8083B9C
	movs r0, #1
	bl SetTalkChoiceResult
	add sp, #8
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A7770: .4byte 0x0000079F
_080A7774: .4byte 0x06016000

	thumb_func_start sub_80A7778
sub_80A7778: @ 0x080A7778
	push {r4, lr}
	adds r4, r0, #0
	bl GetTalkChoiceResult
	cmp r0, #1
	bne _080A778C
	adds r0, r4, #0
	movs r1, #2
	bl Proc_Goto
_080A778C:
	bl GetTalkChoiceResult
	cmp r0, #2
	beq _080A779C
	bl GetTalkChoiceResult
	cmp r0, #0
	bne _080A77A4
_080A779C:
	adds r0, r4, #0
	movs r1, #3
	bl Proc_Goto
_080A77A4:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_80A77AC
sub_80A77AC: @ 0x080A77AC
	push {r4, lr}
	sub sp, #8
	adds r4, r0, #0
	bl EndSysHandCursor
	bl sub_80A7388
	movs r2, #0xf4
	lsls r2, r2, #3
	ldr r3, _080A77E4 @ =0x06016000
	movs r0, #0xd
	str r0, [sp]
	str r4, [sp, #4]
	movs r0, #0x60
	movs r1, #0x5a
	bl sub_8084068
	movs r0, #0xf0
	bl sub_8083B9C
	movs r0, #1
	bl SetTalkChoiceResult
	add sp, #8
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A77E4: .4byte 0x06016000

	thumb_func_start sub_80A77E8
sub_80A77E8: @ 0x080A77E8
	push {r4, lr}
	adds r4, r0, #0
	bl GetTalkChoiceResult
	cmp r0, #2
	beq _080A77FC
	bl GetTalkChoiceResult
	cmp r0, #0
	bne _080A7804
_080A77FC:
	adds r0, r4, #0
	movs r1, #2
	bl Proc_Goto
_080A7804:
	bl GetTalkChoiceResult
	cmp r0, #1
	bne _080A7814
	adds r0, r4, #0
	movs r1, #3
	bl Proc_Goto
_080A7814:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_80A781C
sub_80A781C: @ 0x080A781C
	push {r4, lr}
	adds r4, r0, #0
	bl EndMuralBackground
	bl EndMuralBackground_
	adds r0, r4, #0
	bl EndAllProcChildren
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_80A7834
sub_80A7834: @ 0x080A7834
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r5, [r4, #0x2c]
	adds r0, #0x30
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne _080A78FE
	ldr r0, _080A7878 @ =gpKeySt
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _080A78BE
	ldr r0, _080A787C @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080A7866
	ldr r0, _080A7880 @ =0x0000038A
	bl m4aSongNumStart
_080A7866:
	ldr r0, [r4, #0x2c]
	cmp r0, #1
	beq _080A7898
	cmp r0, #1
	bgt _080A7884
	cmp r0, #0
	beq _080A788E
	b _080A79A4
	.align 2, 0
_080A7878: .4byte gpKeySt
_080A787C: .4byte gPlaySt
_080A7880: .4byte 0x0000038A
_080A7884:
	cmp r0, #2
	beq _080A78A0
	cmp r0, #3
	beq _080A78A8
	b _080A79A4
_080A788E:
	adds r0, r4, #0
	movs r1, #4
	bl Proc_Goto
	b _080A79A4
_080A7898:
	adds r0, r4, #0
	bl sub_80A7D88
	b _080A78AE
_080A78A0:
	adds r0, r4, #0
	bl sub_80A80A4
	b _080A78AE
_080A78A8:
	adds r0, r4, #0
	bl sub_80A82F0
_080A78AE:
	ldr r0, [r4, #0x2c]
	bl sub_80A7404
	adds r0, r4, #0
	movs r1, #2
	bl Proc_Goto
	b _080A79A4
_080A78BE:
	movs r0, #0xa
	ands r0, r1
	cmp r0, #0
	beq _080A78EC
	adds r0, r4, #0
	movs r1, #1
	bl Proc_Goto
	ldr r0, _080A78E4 @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080A79A4
	ldr r0, _080A78E8 @ =0x0000038A
	bl m4aSongNumStart
	b _080A79A4
	.align 2, 0
_080A78E4: .4byte gPlaySt
_080A78E8: .4byte 0x0000038A
_080A78EC:
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r1
	cmp r0, #0
	beq _080A7914
	adds r0, r4, #0
	bl sub_80A7328
	b _080A79A4
_080A78FE:
	ldr r0, _080A79AC @ =gpKeySt
	ldr r1, [r0]
	movs r0, #0x81
	lsls r0, r0, #1
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _080A7914
	adds r0, r4, #0
	bl sub_80A7374
_080A7914:
	ldr r2, _080A79AC @ =gpKeySt
	ldr r1, [r2]
	movs r0, #0x80
	ldrh r1, [r1, #6]
	ands r0, r1
	cmp r0, #0
	beq _080A792C
	ldr r0, [r4, #0x2c]
	cmp r0, #0
	bne _080A792C
	movs r0, #2
	str r0, [r4, #0x2c]
_080A792C:
	ldr r1, [r2]
	movs r0, #0x40
	ldrh r1, [r1, #6]
	ands r0, r1
	cmp r0, #0
	beq _080A7942
	ldr r0, [r4, #0x2c]
	cmp r0, #0
	ble _080A7942
	movs r0, #0
	str r0, [r4, #0x2c]
_080A7942:
	ldr r1, [r2]
	movs r0, #0x20
	ldrh r1, [r1, #6]
	ands r0, r1
	cmp r0, #0
	beq _080A7958
	ldr r0, [r4, #0x2c]
	cmp r0, #1
	ble _080A7958
	subs r0, #1
	str r0, [r4, #0x2c]
_080A7958:
	ldr r1, [r2]
	movs r0, #0x10
	ldrh r1, [r1, #6]
	ands r0, r1
	cmp r0, #0
	beq _080A7970
	ldr r1, [r4, #0x2c]
	subs r0, r1, #1
	cmp r0, #1
	bhi _080A7970
	adds r0, r1, #1
	str r0, [r4, #0x2c]
_080A7970:
	ldr r0, [r4, #0x2c]
	cmp r5, r0
	beq _080A79A4
	adds r0, r4, #0
	adds r0, #0x30
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _080A798A
	adds r0, r4, #0
	bl sub_80A7328
_080A798A:
	ldr r0, [r4, #0x2c]
	adds r1, r4, #0
	bl sub_80A73C4
	ldr r0, _080A79B0 @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080A79A4
	ldr r0, _080A79B4 @ =0x00000385
	bl m4aSongNumStart
_080A79A4:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080A79AC: .4byte gpKeySt
_080A79B0: .4byte gPlaySt
_080A79B4: .4byte 0x00000385

	thumb_func_start sub_80A79B8
sub_80A79B8: @ 0x080A79B8
	push {lr}
	bl ReadLastGameSaveId
	bl WriteGameSave
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_80A79C8
sub_80A79C8: @ 0x080A79C8
	push {r4, lr}
	sub sp, #8
	adds r4, r0, #0
	ldr r0, _080A79E0 @ =gPlaySt
	ldrb r0, [r0, #0x1b]
	cmp r0, #1
	bne _080A79E4
	adds r0, r4, #0
	movs r1, #0
	bl Proc_Goto
	b _080A7A4A
	.align 2, 0
_080A79E0: .4byte gPlaySt
_080A79E4:
	movs r0, #0
	bl InitBgs
	bl ApplySystemObjectsGraphics
	ldr r0, _080A7A54 @ =gDispIo
	mov ip, r0
	mov r1, ip
	adds r1, #0x3c
	movs r0, #0x3f
	ldrb r2, [r1]
	ands r0, r2
	strb r0, [r1]
	adds r1, #8
	movs r2, #0
	movs r3, #0x10
	movs r0, #0x10
	strb r0, [r1]
	mov r0, ip
	adds r0, #0x45
	strb r2, [r0]
	adds r0, #1
	strb r2, [r0]
	movs r0, #1
	mov r1, ip
	ldrb r1, [r1, #1]
	orrs r0, r1
	movs r1, #2
	orrs r0, r1
	movs r1, #4
	orrs r0, r1
	movs r1, #8
	orrs r0, r1
	orrs r0, r3
	mov r2, ip
	strb r0, [r2, #1]
	ldr r2, _080A7A58 @ =0x000007A1
	ldr r3, _080A7A5C @ =0x06016000
	movs r0, #0xd
	str r0, [sp]
	str r4, [sp, #4]
	movs r0, #0x38
	movs r1, #0x20
	bl sub_8084068
	movs r0, #0xf0
	bl sub_8083B9C
	movs r0, #2
	bl SetTalkChoiceResult
_080A7A4A:
	add sp, #8
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A7A54: .4byte gDispIo
_080A7A58: .4byte 0x000007A1
_080A7A5C: .4byte 0x06016000

	thumb_func_start sub_80A7A60
sub_80A7A60: @ 0x080A7A60
	push {r4, lr}
	adds r4, r0, #0
	bl GetTalkChoiceResult
	cmp r0, #2
	beq _080A7A74
	bl GetTalkChoiceResult
	cmp r0, #0
	bne _080A7A8A
_080A7A74:
	ldr r1, _080A7A90 @ =gPlaySt
	adds r1, #0x2b
	movs r0, #2
	rsbs r0, r0, #0
	ldrb r2, [r1]
	ands r0, r2
	strb r0, [r1]
	adds r0, r4, #0
	movs r1, #5
	bl Proc_Goto
_080A7A8A:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A7A90: .4byte gPlaySt

	thumb_func_start GC_SelectMark
GC_SelectMark: @ 0x080A7A94
	push {lr}
	adds r1, r0, #0
	ldr r0, _080A7AA4 @ =gUnk_08DADDC0
	bl Proc_StartBlocking
	pop {r0}
	bx r0
	.align 2, 0
_080A7AA4: .4byte gUnk_08DADDC0

	thumb_func_start sub_80A7AA8
sub_80A7AA8: @ 0x080A7AA8
	ldr r1, _080A7AB4 @ =gUnk_08DADF00
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	bx lr
	.align 2, 0
_080A7AB4: .4byte gUnk_08DADF00

	thumb_func_start sub_80A7AB8
sub_80A7AB8: @ 0x080A7AB8
	ldr r1, _080A7AC4 @ =gUnk_08DADF10
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	bx lr
	.align 2, 0
_080A7AC4: .4byte gUnk_08DADF10

	thumb_func_start sub_80A7AC8
sub_80A7AC8: @ 0x080A7AC8
	ldr r1, _080A7AD4 @ =gUnk_08DADF40
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	bx lr
	.align 2, 0
_080A7AD4: .4byte gUnk_08DADF40

	thumb_func_start sub_80A7AD8
sub_80A7AD8: @ 0x080A7AD8
	ldr r1, _080A7AE4 @ =gUnk_08DADF48
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	bx lr
	.align 2, 0
_080A7AE4: .4byte gUnk_08DADF48

	thumb_func_start sub_80A7AE8
sub_80A7AE8: @ 0x080A7AE8
	push {r4, r5, r6, lr}
	sub sp, #8
	adds r5, r0, #0
	adds r4, r2, #0
	movs r6, #0
	str r6, [sp]
	lsls r1, r1, #5
	adds r5, r5, r1
	lsls r4, r4, #3
	ldr r0, _080A7B28 @ =0x001FFFFF
	ands r4, r0
	movs r0, #0x80
	lsls r0, r0, #0x11
	orrs r4, r0
	mov r0, sp
	adds r1, r5, #0
	adds r2, r4, #0
	bl CpuFastSet
	str r6, [sp, #4]
	add r0, sp, #4
	movs r1, #0x80
	lsls r1, r1, #3
	adds r5, r5, r1
	adds r1, r5, #0
	adds r2, r4, #0
	bl CpuFastSet
	add sp, #8
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080A7B28: .4byte 0x001FFFFF

	thumb_func_start sub_80A7B2C
sub_80A7B2C: @ 0x080A7B2C
	push {r4, r5, lr}
	sub sp, #4
	adds r4, r0, #0
	ldr r0, _080A7BA8 @ =gPlaySt
	adds r0, #0x2b
	ldrb r0, [r0]
	lsls r0, r0, #0x1c
	lsrs r0, r0, #0x1d
	str r0, [r4, #0x2c]
	movs r0, #0
	str r0, [sp]
	movs r0, #3
	movs r1, #0xb
	movs r2, #0xe
	movs r3, #4
	bl sub_804A4CC
	movs r0, #2
	bl EnableBgSync
	ldr r1, [r4, #0x2c]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r0, #0x22
	movs r3, #0x80
	lsls r3, r3, #4
	movs r1, #0x60
	movs r2, #2
	bl ShowSysHandCursor
	ldr r0, _080A7BAC @ =gpProcEkrDispUP
	bl SetTextFont
	movs r0, #0
	bl SetTextFontGlyphs
	movs r4, #0
	movs r5, #0
_080A7B7A:
	adds r0, r4, #0
	bl sub_80A7AA8
	bl DecodeMsg
	adds r3, r0, #0
	ldr r0, _080A7BB0 @ =0x0200008C
	adds r1, r5, #0
	movs r2, #0
	bl Text_InsertDrawString
	adds r5, #0x18
	adds r4, #1
	cmp r4, #3
	ble _080A7B7A
	movs r0, #0
	bl SetTextFont
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080A7BA8: .4byte gPlaySt
_080A7BAC: .4byte gpProcEkrDispUP
_080A7BB0: .4byte 0x0200008C

	thumb_func_start sub_80A7BB4
sub_80A7BB4: @ 0x080A7BB4
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	adds r7, r0, #0
	ldr r0, [r7, #0x2c]
	mov r8, r0
	ldr r6, _080A7C78 @ =0x0000F4C0
	movs r5, #0x26
	movs r4, #2
_080A7BC8:
	str r6, [sp]
	movs r0, #4
	adds r1, r5, #0
	movs r2, #0x60
	ldr r3, _080A7C7C @ =Sprite_32x16
	bl PutSpriteExt
	adds r6, #4
	adds r5, #0x20
	subs r4, #1
	cmp r4, #0
	bge _080A7BC8
	ldr r1, _080A7C80 @ =gpKeySt
	ldr r3, [r1]
	ldrh r2, [r3, #8]
	movs r0, #1
	ands r0, r2
	cmp r0, #0
	beq _080A7C9C
	ldr r5, _080A7C84 @ =gPlaySt
	adds r0, r5, #0
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080A7C02
	ldr r0, _080A7C88 @ =0x0000038A
	bl m4aSongNumStart
_080A7C02:
	ldr r1, [r7, #0x2c]
	adds r5, #0x2b
	movs r0, #7
	ands r1, r0
	lsls r1, r1, #1
	movs r2, #0xf
	rsbs r2, r2, #0
	ldrb r3, [r5]
	ands r2, r3
	orrs r2, r1
	strb r2, [r5]
	ldr r0, _080A7C8C @ =gBg0Tm + 0x15c
	ldr r3, _080A7C90 @ =Unk_081C8FCC
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
	ldr r4, _080A7C94 @ =gpProcEkrDispUP
	adds r0, r4, #0
	bl SetTextFont
	movs r0, #1
	bl SetTextFontGlyphs
	ldr r0, _080A7C98 @ =0x06011000
	movs r1, #8
	movs r2, #4
	bl sub_80A7AE8
	adds r4, #0x18
	ldrb r5, [r5]
	lsls r0, r5, #0x1c
	lsrs r0, r0, #0x1d
	bl sub_80A7AA8
	bl DecodeMsg
	adds r3, r0, #0
	adds r0, r4, #0
	movs r1, #0x40
	movs r2, #4
	bl Text_InsertDrawString
	movs r0, #0
	bl SetTextFont
	movs r0, #1
	bl EnableBgSync
	b _080A7CB6
	.align 2, 0
_080A7C78: .4byte 0x0000F4C0
_080A7C7C: .4byte Sprite_32x16
_080A7C80: .4byte gpKeySt
_080A7C84: .4byte gPlaySt
_080A7C88: .4byte 0x0000038A
_080A7C8C: .4byte gBg0Tm + 0x15c
_080A7C90: .4byte Unk_081C8FCC
_080A7C94: .4byte gpProcEkrDispUP
_080A7C98: .4byte 0x06011000
_080A7C9C:
	movs r0, #2
	ands r0, r2
	cmp r0, #0
	beq _080A7CC8
	ldr r0, _080A7CC0 @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080A7CB6
	ldr r0, _080A7CC4 @ =0x0000038B
	bl m4aSongNumStart
_080A7CB6:
	adds r0, r7, #0
	bl Proc_Break
	b _080A7D3C
	.align 2, 0
_080A7CC0: .4byte gPlaySt
_080A7CC4: .4byte 0x0000038B
_080A7CC8:
	movs r4, #0x20
	adds r0, r4, #0
	ldrh r3, [r3, #6]
	ands r0, r3
	cmp r0, #0
	beq _080A7CEA
	ldr r0, [r7, #0x2c]
	cmp r0, #0
	ble _080A7CDE
	subs r0, #1
	b _080A7CE8
_080A7CDE:
	adds r0, r4, #0
	ands r0, r2
	cmp r0, #0
	beq _080A7CEA
	movs r0, #3
_080A7CE8:
	str r0, [r7, #0x2c]
_080A7CEA:
	ldr r1, [r1]
	movs r2, #0x10
	adds r0, r2, #0
	ldrh r3, [r1, #6]
	ands r0, r3
	cmp r0, #0
	beq _080A7D10
	ldr r0, [r7, #0x2c]
	cmp r0, #2
	bgt _080A7D02
	adds r0, #1
	b _080A7D0E
_080A7D02:
	adds r0, r2, #0
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _080A7D10
	movs r0, #0
_080A7D0E:
	str r0, [r7, #0x2c]
_080A7D10:
	ldr r1, [r7, #0x2c]
	cmp r1, r8
	beq _080A7D3C
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r0, #0x22
	movs r3, #0x80
	lsls r3, r3, #4
	movs r1, #0x60
	movs r2, #2
	bl ShowSysHandCursor
	ldr r0, _080A7D48 @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080A7D3C
	ldr r0, _080A7D4C @ =0x00000385
	bl m4aSongNumStart
_080A7D3C:
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A7D48: .4byte gPlaySt
_080A7D4C: .4byte 0x00000385

	thumb_func_start sub_80A7D50
sub_80A7D50: @ 0x080A7D50
	push {r4, lr}
	ldr r0, _080A7D80 @ =gBg1Tm
	movs r1, #0
	bl TmFill
	ldr r4, _080A7D84 @ =gpProcEkrDispUP
	adds r0, r4, #0
	bl SetTextFont
	adds r4, #0x20
	adds r0, r4, #0
	movs r1, #0
	bl SpriteText_DrawBackgroundExt
	movs r0, #0
	bl SetTextFont
	movs r0, #2
	bl EnableBgSync
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A7D80: .4byte gBg1Tm
_080A7D84: .4byte gpProcEkrDispUP

	thumb_func_start sub_80A7D88
sub_80A7D88: @ 0x080A7D88
	push {lr}
	adds r1, r0, #0
	ldr r0, _080A7D98 @ =gUnk_08DADF68
	bl Proc_StartBlocking
	pop {r0}
	bx r0
	.align 2, 0
_080A7D98: .4byte gUnk_08DADF68

	thumb_func_start sub_80A7D9C
sub_80A7D9C: @ 0x080A7D9C
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r4, r0, #0
	ldr r0, _080A7E44 @ =gPlaySt
	adds r0, #0x2b
	ldrb r0, [r0]
	lsrs r0, r0, #4
	str r0, [r4, #0x2c]
	movs r0, #0
	str r0, [sp]
	movs r0, #2
	movs r1, #0xb
	movs r2, #0x1a
	movs r3, #6
	bl sub_804A4CC
	movs r0, #2
	bl EnableBgSync
	ldr r5, [r4, #0x2c]
	adds r0, r5, #0
	movs r1, #6
	bl __modsi3
	adds r4, r0, #0
	lsls r4, r4, #5
	adds r4, #0x1a
	adds r0, r5, #0
	movs r1, #6
	bl __divsi3
	adds r1, r0, #0
	lsls r1, r1, #4
	adds r1, #0x60
	movs r3, #0x80
	lsls r3, r3, #4
	adds r0, r4, #0
	movs r2, #1
	bl ShowSysHandCursor
	ldr r4, _080A7E48 @ =gpProcEkrDispUP
	adds r0, r4, #0
	bl SetTextFont
	movs r0, #0
	bl SetTextFontGlyphs
	movs r5, #0
	adds r6, r4, #0
	adds r6, #0x20
_080A7E00:
	lsls r4, r5, #5
	adds r0, r5, #0
	bl sub_80A7AB8
	bl DecodeMsg
	adds r3, r0, #0
	adds r0, r6, #0
	adds r1, r4, #0
	movs r2, #0
	bl Text_InsertDrawString
	adds r0, r5, #6
	bl sub_80A7AB8
	bl DecodeMsg
	adds r3, r0, #0
	adds r0, r6, #0
	adds r0, #8
	adds r1, r4, #0
	movs r2, #0
	bl Text_InsertDrawString
	adds r5, #1
	cmp r5, #5
	ble _080A7E00
	movs r0, #0
	bl SetTextFont
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080A7E44: .4byte gPlaySt
_080A7E48: .4byte gpProcEkrDispUP

	thumb_func_start sub_80A7E4C
sub_80A7E4C: @ 0x080A7E4C
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #4
	adds r7, r0, #0
	ldr r0, [r7, #0x2c]
	mov sb, r0
	ldr r6, _080A7F0C @ =0x0000F4C0
	movs r5, #0x1e
	movs r4, #2
_080A7E62:
	str r6, [sp]
	movs r0, #4
	adds r1, r5, #0
	movs r2, #0x60
	ldr r3, _080A7F10 @ =Sprite_64x32
	bl PutSpriteExt
	adds r6, #8
	adds r5, #0x40
	subs r4, #1
	cmp r4, #0
	bge _080A7E62
	ldr r1, _080A7F14 @ =gpKeySt
	ldr r2, [r1]
	ldrh r5, [r2, #8]
	movs r0, #1
	ands r0, r5
	mov r8, r1
	cmp r0, #0
	beq _080A7F30
	ldr r5, _080A7F18 @ =gPlaySt
	adds r0, r5, #0
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080A7E9E
	ldr r0, _080A7F1C @ =0x0000038A
	bl m4aSongNumStart
_080A7E9E:
	ldr r0, [r7, #0x2c]
	adds r5, #0x2b
	lsls r0, r0, #4
	movs r2, #0xf
	ldrb r1, [r5]
	ands r2, r1
	orrs r2, r0
	strb r2, [r5]
	ldr r0, _080A7F20 @ =gBg0Tm + 0x15c
	ldr r4, _080A7F24 @ =Unk_081C8FCC
	lsls r1, r2, #0x1c
	lsrs r1, r1, #0x1d
	lsls r1, r1, #2
	movs r3, #0xf0
	ands r2, r3
	adds r1, r1, r2
	adds r1, r1, r4
	ldr r1, [r1]
	adds r1, #0x79
	movs r2, #0xa0
	lsls r2, r2, #7
	bl PutIcon
	ldr r4, _080A7F28 @ =gpProcEkrDispUP
	adds r0, r4, #0
	bl SetTextFont
	movs r0, #1
	bl SetTextFontGlyphs
	ldr r0, _080A7F2C @ =0x06011000
	movs r1, #0xc
	movs r2, #4
	bl sub_80A7AE8
	adds r4, #0x18
	ldrb r5, [r5]
	lsrs r0, r5, #4
	bl sub_80A7AB8
	bl DecodeMsg
	adds r3, r0, #0
	adds r0, r4, #0
	movs r1, #0x60
	movs r2, #4
	bl Text_InsertDrawString
	movs r0, #0
	bl SetTextFont
	movs r0, #1
	bl EnableBgSync
	b _080A7F4A
	.align 2, 0
_080A7F0C: .4byte 0x0000F4C0
_080A7F10: .4byte Sprite_64x32
_080A7F14: .4byte gpKeySt
_080A7F18: .4byte gPlaySt
_080A7F1C: .4byte 0x0000038A
_080A7F20: .4byte gBg0Tm + 0x15c
_080A7F24: .4byte Unk_081C8FCC
_080A7F28: .4byte gpProcEkrDispUP
_080A7F2C: .4byte 0x06011000
_080A7F30:
	movs r0, #2
	ands r0, r5
	cmp r0, #0
	beq _080A7F5C
	ldr r0, _080A7F54 @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080A7F4A
	ldr r0, _080A7F58 @ =0x0000038B
	bl m4aSongNumStart
_080A7F4A:
	adds r0, r7, #0
	bl Proc_Break
	b _080A8054
	.align 2, 0
_080A7F54: .4byte gPlaySt
_080A7F58: .4byte 0x0000038B
_080A7F5C:
	movs r6, #0x40
	adds r0, r6, #0
	ldrh r2, [r2, #6]
	ands r0, r2
	cmp r0, #0
	beq _080A7F86
	ldr r4, [r7, #0x2c]
	adds r0, r4, #0
	movs r1, #6
	bl __divsi3
	cmp r0, #0
	ble _080A7F7A
	subs r0, r4, #6
	b _080A7F84
_080A7F7A:
	adds r0, r6, #0
	ands r0, r5
	cmp r0, #0
	beq _080A7F86
	adds r0, r4, #6
_080A7F84:
	str r0, [r7, #0x2c]
_080A7F86:
	mov r0, r8
	ldr r5, [r0]
	movs r0, #0x80
	ldrh r1, [r5, #6]
	ands r0, r1
	cmp r0, #0
	beq _080A7FB4
	ldr r4, [r7, #0x2c]
	adds r0, r4, #0
	movs r1, #6
	bl __divsi3
	cmp r0, #0
	bgt _080A7FA6
	adds r0, r4, #6
	b _080A7FB2
_080A7FA6:
	movs r0, #0x40
	ldrh r5, [r5, #8]
	ands r0, r5
	cmp r0, #0
	beq _080A7FB4
	subs r0, r4, #6
_080A7FB2:
	str r0, [r7, #0x2c]
_080A7FB4:
	mov r0, r8
	ldr r5, [r0]
	movs r6, #0x20
	adds r0, r6, #0
	ldrh r1, [r5, #6]
	ands r0, r1
	cmp r0, #0
	beq _080A7FE4
	ldr r4, [r7, #0x2c]
	adds r0, r4, #0
	movs r1, #6
	bl __modsi3
	cmp r0, #0
	ble _080A7FD6
	subs r0, r4, #1
	b _080A7FE2
_080A7FD6:
	adds r0, r6, #0
	ldrh r5, [r5, #8]
	ands r0, r5
	cmp r0, #0
	beq _080A7FE4
	adds r0, r4, #5
_080A7FE2:
	str r0, [r7, #0x2c]
_080A7FE4:
	mov r0, r8
	ldr r5, [r0]
	movs r6, #0x10
	adds r0, r6, #0
	ldrh r1, [r5, #6]
	ands r0, r1
	cmp r0, #0
	beq _080A8014
	ldr r4, [r7, #0x2c]
	adds r0, r4, #0
	movs r1, #6
	bl __modsi3
	cmp r0, #4
	bgt _080A8006
	adds r0, r4, #1
	b _080A8012
_080A8006:
	adds r0, r6, #0
	ldrh r5, [r5, #8]
	ands r0, r5
	cmp r0, #0
	beq _080A8014
	subs r0, r4, #5
_080A8012:
	str r0, [r7, #0x2c]
_080A8014:
	ldr r5, [r7, #0x2c]
	cmp r5, sb
	beq _080A8054
	adds r0, r5, #0
	movs r1, #6
	bl __modsi3
	adds r4, r0, #0
	lsls r4, r4, #5
	adds r4, #0x1a
	adds r0, r5, #0
	movs r1, #6
	bl __divsi3
	adds r1, r0, #0
	lsls r1, r1, #4
	adds r1, #0x60
	movs r3, #0x80
	lsls r3, r3, #4
	adds r0, r4, #0
	movs r2, #1
	bl ShowSysHandCursor
	ldr r0, _080A8064 @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080A8054
	ldr r0, _080A8068 @ =0x00000385
	bl m4aSongNumStart
_080A8054:
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A8064: .4byte gPlaySt
_080A8068: .4byte 0x00000385

	thumb_func_start sub_80A806C
sub_80A806C: @ 0x080A806C
	push {r4, lr}
	ldr r0, _080A809C @ =gBg1Tm
	movs r1, #0
	bl TmFill
	ldr r4, _080A80A0 @ =gpProcEkrDispUP
	adds r0, r4, #0
	bl SetTextFont
	adds r4, #0x20
	adds r0, r4, #0
	movs r1, #0
	bl SpriteText_DrawBackgroundExt
	movs r0, #0
	bl SetTextFont
	movs r0, #2
	bl EnableBgSync
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A809C: .4byte gBg1Tm
_080A80A0: .4byte gpProcEkrDispUP

	thumb_func_start sub_80A80A4
sub_80A80A4: @ 0x080A80A4
	push {lr}
	adds r1, r0, #0
	ldr r0, _080A80B4 @ =gUnk_08DADF98
	bl Proc_StartBlocking
	pop {r0}
	bx r0
	.align 2, 0
_080A80B4: .4byte gUnk_08DADF98

	thumb_func_start sub_80A80B8
sub_80A80B8: @ 0x080A80B8
	push {r4, r5, lr}
	sub sp, #4
	adds r4, r0, #0
	ldr r0, _080A8134 @ =gPlaySt
	adds r0, #0x2c
	ldrb r0, [r0]
	lsls r0, r0, #0x1f
	lsrs r0, r0, #0x1f
	str r0, [r4, #0x2c]
	movs r0, #0
	str r0, [sp]
	movs r0, #0x15
	movs r1, #0xb
	movs r2, #7
	movs r3, #4
	bl sub_804A4CC
	movs r0, #2
	bl EnableBgSync
	ldr r1, [r4, #0x2c]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r0, #0xb0
	movs r3, #0x80
	lsls r3, r3, #4
	movs r1, #0x60
	movs r2, #1
	bl ShowSysHandCursor
	ldr r0, _080A8138 @ =gpProcEkrDispUP
	bl SetTextFont
	movs r0, #0
	bl SetTextFontGlyphs
	movs r4, #0
	movs r5, #0
_080A8106:
	adds r0, r4, #0
	bl sub_80A7AC8
	bl DecodeMsg
	adds r3, r0, #0
	ldr r0, _080A813C @ =0x0200008C
	adds r1, r5, #0
	movs r2, #0
	bl Text_InsertDrawString
	adds r5, #0x18
	adds r4, #1
	cmp r4, #1
	ble _080A8106
	movs r0, #0
	bl SetTextFont
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080A8134: .4byte gPlaySt
_080A8138: .4byte gpProcEkrDispUP
_080A813C: .4byte 0x0200008C

	thumb_func_start sub_80A8140
sub_80A8140: @ 0x080A8140
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	adds r7, r0, #0
	ldr r0, [r7, #0x2c]
	mov r8, r0
	ldr r6, _080A81E8 @ =0x0000F4C0
	movs r5, #0xb4
	movs r4, #2
_080A8154:
	str r6, [sp]
	movs r0, #4
	adds r1, r5, #0
	movs r2, #0x60
	ldr r3, _080A81EC @ =Sprite_32x16
	bl PutSpriteExt
	adds r6, #4
	adds r5, #0x20
	subs r4, #1
	cmp r4, #0
	bge _080A8154
	ldr r1, _080A81F0 @ =gpKeySt
	ldr r3, [r1]
	ldrh r2, [r3, #8]
	movs r5, #1
	adds r0, r5, #0
	ands r0, r2
	cmp r0, #0
	beq _080A8204
	ldr r5, _080A81F4 @ =gPlaySt
	adds r0, r5, #0
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080A8190
	ldr r0, _080A81F8 @ =0x0000038A
	bl m4aSongNumStart
_080A8190:
	ldr r1, [r7, #0x2c]
	adds r5, #0x2c
	movs r0, #1
	ands r1, r0
	movs r0, #2
	rsbs r0, r0, #0
	ldrb r2, [r5]
	ands r0, r2
	orrs r0, r1
	strb r0, [r5]
	ldr r4, _080A81FC @ =gpProcEkrDispUP
	adds r0, r4, #0
	bl SetTextFont
	movs r0, #1
	bl SetTextFontGlyphs
	ldr r0, _080A8200 @ =0x06011000
	movs r1, #0x10
	movs r2, #4
	bl sub_80A7AE8
	adds r4, #0x18
	ldrb r5, [r5]
	lsls r0, r5, #0x1f
	lsrs r0, r0, #0x1f
	bl sub_80A7AC8
	bl DecodeMsg
	adds r3, r0, #0
	adds r0, r4, #0
	movs r1, #0x80
	movs r2, #4
	bl Text_InsertDrawString
	movs r0, #0
	bl SetTextFont
	movs r0, #1
	bl EnableBgSync
	b _080A821E
	.align 2, 0
_080A81E8: .4byte 0x0000F4C0
_080A81EC: .4byte Sprite_32x16
_080A81F0: .4byte gpKeySt
_080A81F4: .4byte gPlaySt
_080A81F8: .4byte 0x0000038A
_080A81FC: .4byte gpProcEkrDispUP
_080A8200: .4byte 0x06011000
_080A8204:
	movs r0, #2
	ands r0, r2
	cmp r0, #0
	beq _080A8230
	ldr r0, _080A8228 @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080A821E
	ldr r0, _080A822C @ =0x0000038B
	bl m4aSongNumStart
_080A821E:
	adds r0, r7, #0
	bl Proc_Break
	b _080A82A4
	.align 2, 0
_080A8228: .4byte gPlaySt
_080A822C: .4byte 0x0000038B
_080A8230:
	movs r4, #0x20
	adds r0, r4, #0
	ldrh r3, [r3, #6]
	ands r0, r3
	cmp r0, #0
	beq _080A8252
	ldr r0, [r7, #0x2c]
	cmp r0, #0
	ble _080A8248
	subs r0, #1
	str r0, [r7, #0x2c]
	b _080A8252
_080A8248:
	adds r0, r4, #0
	ands r0, r2
	cmp r0, #0
	beq _080A8252
	str r5, [r7, #0x2c]
_080A8252:
	ldr r1, [r1]
	movs r2, #0x10
	adds r0, r2, #0
	ldrh r3, [r1, #6]
	ands r0, r3
	cmp r0, #0
	beq _080A8278
	ldr r0, [r7, #0x2c]
	cmp r0, #0
	bgt _080A826A
	adds r0, #1
	b _080A8276
_080A826A:
	adds r0, r2, #0
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _080A8278
	movs r0, #0
_080A8276:
	str r0, [r7, #0x2c]
_080A8278:
	ldr r1, [r7, #0x2c]
	cmp r1, r8
	beq _080A82A4
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r0, #0xb0
	movs r3, #0x80
	lsls r3, r3, #4
	movs r1, #0x60
	movs r2, #1
	bl ShowSysHandCursor
	ldr r0, _080A82B0 @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080A82A4
	ldr r0, _080A82B4 @ =0x00000385
	bl m4aSongNumStart
_080A82A4:
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A82B0: .4byte gPlaySt
_080A82B4: .4byte 0x00000385

	thumb_func_start sub_80A82B8
sub_80A82B8: @ 0x080A82B8
	push {r4, lr}
	ldr r0, _080A82E8 @ =gBg1Tm
	movs r1, #0
	bl TmFill
	ldr r4, _080A82EC @ =gpProcEkrDispUP
	adds r0, r4, #0
	bl SetTextFont
	adds r4, #0x20
	adds r0, r4, #0
	movs r1, #0
	bl SpriteText_DrawBackgroundExt
	movs r0, #0
	bl SetTextFont
	movs r0, #2
	bl EnableBgSync
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A82E8: .4byte gBg1Tm
_080A82EC: .4byte gpProcEkrDispUP

	thumb_func_start sub_80A82F0
sub_80A82F0: @ 0x080A82F0
	push {lr}
	adds r1, r0, #0
	ldr r0, _080A8300 @ =gUnk_08DADFC8
	bl Proc_StartBlocking
	pop {r0}
	bx r0
	.align 2, 0
_080A8300: .4byte gUnk_08DADFC8

	thumb_func_start sub_80A8304
sub_80A8304: @ 0x080A8304
	push {r4, r5, r6, r7, lr}
	adds r2, r0, #0
	ldr r0, _080A8324 @ =gPal + 0x37a
	mov ip, r0
	ldr r0, _080A8328 @ =gUnk_08434460
	ldrh r4, [r0]
	ldrh r7, [r0, #2]
	movs r0, #0x3f
	ands r2, r0
	cmp r2, #0x1f
	bgt _080A832C
	movs r0, #0x20
	subs r5, r0, r2
	adds r6, r2, #0
	b _080A8334
	.align 2, 0
_080A8324: .4byte gPal + 0x37a
_080A8328: .4byte gUnk_08434460
_080A832C:
	adds r5, r2, #0
	subs r5, #0x20
	movs r0, #0x40
	subs r6, r0, r2
_080A8334:
	movs r3, #0x1f
	movs r1, #0x1f
	adds r0, r4, #0
	ands r0, r1
	adds r2, r0, #0
	muls r2, r5, r2
	adds r0, r7, #0
	ands r0, r1
	muls r0, r6, r0
	adds r2, r2, r0
	asrs r2, r2, #5
	ands r2, r3
	movs r3, #0xf8
	lsls r3, r3, #2
	adds r0, r4, #0
	ands r0, r3
	adds r1, r0, #0
	muls r1, r5, r1
	adds r0, r7, #0
	ands r0, r3
	muls r0, r6, r0
	adds r1, r1, r0
	asrs r1, r1, #5
	ands r1, r3
	adds r2, r2, r1
	movs r3, #0xf8
	lsls r3, r3, #7
	ands r4, r3
	adds r0, r4, #0
	muls r0, r5, r0
	ands r7, r3
	adds r1, r7, #0
	muls r1, r6, r1
	adds r0, r0, r1
	asrs r0, r0, #5
	ands r0, r3
	adds r2, r2, r0
	mov r0, ip
	strh r2, [r0]
	bl EnablePalSync
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
