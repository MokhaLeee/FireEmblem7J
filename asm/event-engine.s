	.include "macro.inc"

	.syntax unified

	thumb_func_start LoadUnitCore
LoadUnitCore: @ 0x0800A614
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	adds r7, r1, #0
	bl sub_800CEF4
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0800A6FE
	movs r0, #6
	ldrb r1, [r5, #3]
	ands r0, r1
	cmp r0, #0
	beq _0800A668
	ldrb r0, [r5]
	movs r1, #0
	bl GetUnitFromCharIdAndFaction
	adds r4, r0, #0
	cmp r4, #0
	beq _0800A674
	ldrb r2, [r5, #3]
	lsls r0, r2, #0x1d
	lsrs r0, r0, #0x1e
	cmp r0, #1
	beq _0800A65E
	cmp r0, #1
	bgt _0800A650
	cmp r0, #0
	beq _0800A656
	b _0800A660
_0800A650:
	cmp r0, #2
	beq _0800A65A
	b _0800A660
_0800A656:
	movs r6, #0
	b _0800A660
_0800A65A:
	movs r6, #0x80
	b _0800A660
_0800A65E:
	movs r6, #0x40
_0800A660:
	adds r0, r4, #0
	adds r1, r6, #0
	bl UnitChangeFaction
_0800A668:
	ldrb r0, [r5]
	bl GetUnitFromCharId
	adds r4, r0, #0
	cmp r4, #0
	bne _0800A688
_0800A674:
	adds r0, r5, #0
	bl LoadUnit
	adds r4, r0, #0
	ldr r0, [r4, #0xc]
	movs r1, #0x80
	lsls r1, r1, #0xf
	orrs r0, r1
	str r0, [r4, #0xc]
	b _0800A6BA
_0800A688:
	adds r0, r4, #0
	bl sub_807A124
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0800A6A4
	adds r0, r4, #0
	adds r1, r5, #0
	bl UnitLoadItemsFromDefinition
	ldr r0, [r4, #0xc]
	ldr r1, _0800A704 @ =0xFFFEFFFF
	ands r0, r1
	str r0, [r4, #0xc]
_0800A6A4:
	adds r0, r4, #0
	bl sub_807A1E4
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0800A6BA
	ldr r0, [r4, #0xc]
	movs r1, #4
	ands r0, r1
	cmp r0, #0
	bne _0800A6FE
_0800A6BA:
	ldrb r0, [r5, #4]
	strb r0, [r4, #0x10]
	ldrb r0, [r5, #5]
	strb r0, [r4, #0x11]
	ldr r1, _0800A708 @ =gPlaySt
	movs r0, #0x40
	ldrb r2, [r1, #0x14]
	ands r0, r2
	cmp r0, #0
	beq _0800A6EE
	ldrb r0, [r1, #0x1b]
	cmp r0, #3
	bne _0800A6EE
	movs r0, #6
	ldrb r2, [r5, #3]
	ands r0, r2
	cmp r0, #4
	bne _0800A6EE
	movs r0, #0xe
	ldrsb r0, [r1, r0]
	bl GetChapterInfo
	ldrb r1, [r0, #0x14]
	adds r0, r4, #0
	bl UnitApplyBonusLevels
_0800A6EE:
	adds r0, r5, #0
	adds r1, r4, #0
	adds r2, r7, #0
	movs r3, #1
	bl sub_800A720
	bl RefreshEntityMaps
_0800A6FE:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0800A704: .4byte 0xFFFEFFFF
_0800A708: .4byte gPlaySt

	thumb_func_start sub_800A70C
sub_800A70C: @ 0x0800A70C
	push {lr}
	movs r2, #0
	movs r3, #0
	bl sub_800A720
	bl RefreshEntityMaps
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_800A720
sub_800A720: @ 0x0800A720
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r4, r0, #0
	adds r6, r1, #0
	adds r7, r2, #0
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	cmp r6, #0
	beq _0800A79A
	cmp r3, #0
	beq _0800A78A
	cmp r7, #0
	beq _0800A778
	ldr r5, [r6, #0xc]
	movs r0, #0x80
	ands r5, r0
	cmp r5, #0
	bne _0800A778
	ldrb r1, [r4, #4]
	ldrb r2, [r4, #5]
	adds r0, r6, #0
	movs r3, #0
	bl TryMoveUnit
	bl RefreshUnitSprites
	ldr r0, _0800A774 @ =0x0000FFFF
	adds r1, r0, #0
	ldrh r2, [r4, #4]
	ands r1, r2
	ldrh r2, [r4, #6]
	ands r0, r2
	cmp r1, r0
	beq _0800A79A
	ldrb r2, [r4, #6]
	ldrb r3, [r4, #7]
	str r5, [sp]
	adds r0, r7, #0
	adds r1, r6, #0
	bl TryMoveUnitDisplayed
	b _0800A79A
	.align 2, 0
_0800A774: .4byte 0x0000FFFF
_0800A778:
	ldrb r1, [r4, #6]
	ldrb r2, [r4, #7]
	adds r0, r6, #0
	movs r3, #1
	bl TryMoveUnit
	bl RefreshUnitSprites
	b _0800A79A
_0800A78A:
	ldrb r1, [r4, #6]
	ldrb r2, [r4, #7]
	adds r0, r6, #0
	movs r3, #1
	bl TryMoveUnit
	bl RefreshUnitSprites
_0800A79A:
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_800A7A4
sub_800A7A4: @ 0x0800A7A4
	ldr r0, _0800A7B8 @ =gpKeySt
	ldr r1, [r0]
	movs r0, #0x80
	lsls r0, r0, #1
	ldrh r1, [r1, #4]
	ands r0, r1
	cmp r0, #0
	bne _0800A7BC
	movs r0, #0
	b _0800A7BE
	.align 2, 0
_0800A7B8: .4byte gpKeySt
_0800A7BC:
	movs r0, #1
_0800A7BE:
	bx lr

	thumb_func_start sub_800A7C0
sub_800A7C0: @ 0x0800A7C0
	ldr r1, _0800A7CC @ =0x03000100
	movs r0, #0
	str r0, [r1]
	movs r0, #1
	bx lr
	.align 2, 0
_0800A7CC: .4byte 0x03000100

	thumb_func_start sub_800A7D0
sub_800A7D0: @ 0x0800A7D0
	ldr r0, _0800A7E0 @ =gUnk_08BFFE8C
	ldr r2, _0800A7E4 @ =0x03000100
	ldr r1, [r2]
	adds r0, r1, r0
	ldrb r0, [r0]
	adds r1, #1
	str r1, [r2]
	bx lr
	.align 2, 0
_0800A7E0: .4byte gUnk_08BFFE8C
_0800A7E4: .4byte 0x03000100

	thumb_func_start sub_800A7E8
sub_800A7E8: @ 0x0800A7E8
	push {r4, r5, r6, lr}
	sub sp, #0x10
	adds r6, r0, #0
	movs r4, #0
	ldr r5, [r6, #0x2c]
	b _0800A8DA
_0800A7F4:
	ldrb r0, [r5]
	subs r0, #1
	cmp r0, #9
	bhi _0800A8D8
	lsls r0, r0, #2
	ldr r1, _0800A808 @ =_0800A80C
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0800A808: .4byte _0800A80C
_0800A80C: @ jump table
	.4byte _0800A8D4 @ case 0
	.4byte _0800A8C0 @ case 1
	.4byte _0800A8A8 @ case 2
	.4byte _0800A894 @ case 3
	.4byte _0800A8A0 @ case 4
	.4byte _0800A8D8 @ case 5
	.4byte _0800A850 @ case 6
	.4byte _0800A870 @ case 7
	.4byte _0800A83E @ case 8
	.4byte _0800A834 @ case 9
_0800A834:
	ldr r1, [r5, #4]
	adds r0, r6, #0
	adds r0, #0x48
	strh r1, [r0]
	b _0800A8D8
_0800A83E:
	ldr r0, _0800A84C @ =0x0300010C
	ldr r0, [r0]
	mov r1, sp
	bl sub_80149EC
	lsls r0, r0, #3
	b _0800A8D6
	.align 2, 0
_0800A84C: .4byte 0x0300010C
_0800A850:
	adds r0, r6, #0
	adds r0, #0x44
	strb r4, [r0]
	ldr r0, _0800A86C @ =0x03000108
	ldrh r0, [r0]
	bl sub_8017808
	strh r0, [r6, #0x3e]
	adds r0, r6, #0
	adds r0, #0x42
	ldrb r1, [r0]
	movs r0, #0
	b _0800A886
	.align 2, 0
_0800A86C: .4byte 0x03000108
_0800A870:
	adds r0, r6, #0
	adds r0, #0x44
	strb r4, [r0]
	ldr r0, _0800A890 @ =0x03000108
	ldrh r0, [r0]
	adds r0, #0x70
	strh r0, [r6, #0x3e]
	adds r0, r6, #0
	adds r0, #0x42
	ldrb r1, [r0]
	movs r0, #1
_0800A886:
	bl ApplyIconPalette
	adds r4, #0x10
	b _0800A8D8
	.align 2, 0
_0800A890: .4byte 0x03000108
_0800A894:
	ldr r0, [r5, #4]
	bl DecodeMsg
	bl GetStringTextLen
	b _0800A8D6
_0800A8A0:
	ldr r0, [r5, #4]
	bl GetStringTextLen
	b _0800A8D6
_0800A8A8:
	ldr r0, _0800A8BC @ =0x03000104
	ldr r0, [r0]
	ldr r0, [r0]
	ldrh r0, [r0]
	bl DecodeMsg
	bl GetStringTextLen
	b _0800A8D6
	.align 2, 0
_0800A8BC: .4byte 0x03000104
_0800A8C0:
	ldr r0, _0800A8D0 @ =0x03000108
	ldrh r0, [r0]
	bl GetItemName
	bl GetStringTextLen
	b _0800A8D6
	.align 2, 0
_0800A8D0: .4byte 0x03000108
_0800A8D4:
	ldr r0, [r5, #4]
_0800A8D6:
	adds r4, r4, r0
_0800A8D8:
	adds r5, #8
_0800A8DA:
	ldrb r0, [r5]
	cmp r0, #0
	bne _0800A7F4
	adds r0, r4, #0
	add sp, #0x10
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_800A8EC
sub_800A8EC: @ 0x0800A8EC
	push {r4, r5, lr}
	sub sp, #0x18
	adds r5, r0, #0
	str r1, [sp, #0x10]
	str r2, [sp, #0x14]
	b _0800A9AA
_0800A8F8:
	ldrb r0, [r5]
	subs r0, #1
	cmp r0, #8
	bhi _0800A9A8
	lsls r0, r0, #2
	ldr r1, _0800A90C @ =_0800A910
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0800A90C: .4byte _0800A910
_0800A910: @ jump table
	.4byte _0800A9A0 @ case 0
	.4byte _0800A988 @ case 1
	.4byte _0800A974 @ case 2
	.4byte _0800A960 @ case 3
	.4byte _0800A96A @ case 4
	.4byte _0800A956 @ case 5
	.4byte _0800A94C @ case 6
	.4byte _0800A94C @ case 7
	.4byte _0800A934 @ case 8
_0800A934:
	ldr r0, _0800A948 @ =0x0300010C
	ldr r0, [r0]
	mov r1, sp
	bl sub_80149EC
	add r0, sp, #0x10
	mov r1, sp
	bl Text_DrawString
	b _0800A9A8
	.align 2, 0
_0800A948: .4byte 0x0300010C
_0800A94C:
	add r0, sp, #0x10
	movs r1, #0x10
	bl Text_Skip
	b _0800A9A8
_0800A956:
	add r0, sp, #0x10
	ldr r1, [r5, #4]
	bl Text_SetColor
	b _0800A9A8
_0800A960:
	add r4, sp, #0x10
	ldr r0, [r5, #4]
	bl DecodeMsg
	b _0800A992
_0800A96A:
	add r0, sp, #0x10
	ldr r1, [r5, #4]
	bl Text_DrawString
	b _0800A9A8
_0800A974:
	add r4, sp, #0x10
	ldr r0, _0800A984 @ =0x03000104
	ldr r0, [r0]
	ldr r0, [r0]
	ldrh r0, [r0]
	bl DecodeMsg
	b _0800A992
	.align 2, 0
_0800A984: .4byte 0x03000104
_0800A988:
	add r4, sp, #0x10
	ldr r0, _0800A99C @ =0x03000108
	ldrh r0, [r0]
	bl GetItemName
_0800A992:
	adds r1, r0, #0
	adds r0, r4, #0
	bl Text_DrawString
	b _0800A9A8
	.align 2, 0
_0800A99C: .4byte 0x03000108
_0800A9A0:
	add r0, sp, #0x10
	ldr r1, [r5, #4]
	bl Text_Skip
_0800A9A8:
	adds r5, #8
_0800A9AA:
	ldrb r0, [r5]
	cmp r0, #0
	bne _0800A8F8
	movs r0, #3
	bl EnableBgSync
	add sp, #0x18
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_800A9C0
sub_800A9C0: @ 0x0800A9C0
	adds r3, r0, #0
	adds r2, r3, #0
	adds r2, #0x34
	movs r0, #0xff
	ldrb r1, [r2]
	orrs r1, r0
	strb r1, [r2]
	adds r1, r3, #0
	adds r1, #0x35
	ldrb r2, [r1]
	orrs r0, r2
	strb r0, [r1]
	adds r0, r3, #0
	adds r0, #0x3b
	movs r1, #0
	strb r1, [r0]
	ldr r0, _0800A9F0 @ =0x0000FFFF
	strh r0, [r3, #0x3e]
	adds r0, r3, #0
	adds r0, #0x44
	strb r1, [r0]
	adds r0, #4
	strh r1, [r0]
	bx lr
	.align 2, 0
_0800A9F0: .4byte 0x0000FFFF

	thumb_func_start sub_800A9F4
sub_800A9F4: @ 0x0800A9F4
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0
	bl GetBgChrOffset
	adds r1, r0, #0
	ldr r0, _0800AA5C @ =0x06002000
	adds r1, r1, r0
	movs r2, #0x80
	lsls r2, r2, #1
	movs r0, #0
	movs r3, #0
	bl InitTextFont
	bl ClearIcons
	bl UnpackUiWindowFrameGraphics
	ldr r3, _0800AA60 @ =gDispIo
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
	adds r0, r4, #0
	bl sub_800A7E8
	adds r4, #0x46
	strh r0, [r4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0800AA5C: .4byte 0x06002000
_0800AA60: .4byte gDispIo

	thumb_func_start sub_800AA64
sub_800AA64: @ 0x0800AA64
	push {lr}
	adds r3, r0, #0
	adds r0, #0x48
	ldrh r0, [r0]
	cmp r0, #0
	beq _0800AA7C
	movs r0, #0x80
	lsls r0, r0, #1
	movs r1, #0x80
	movs r2, #0x10
	bl StartBgmVolumeChange
_0800AA7C:
	pop {r0}
	bx r0

	thumb_func_start sub_800AA80
sub_800AA80: @ 0x0800AA80
	push {lr}
	adds r1, r0, #0
	adds r1, #0x48
	ldrh r0, [r1]
	cmp r0, #0
	beq _0800AA9E
	ldr r0, _0800AAA4 @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0800AA9E
	ldrh r0, [r1]
	bl m4aSongNumStart
_0800AA9E:
	pop {r0}
	bx r0
	.align 2, 0
_0800AAA4: .4byte gPlaySt

	thumb_func_start sub_800AAA8
sub_800AAA8: @ 0x0800AAA8
	push {lr}
	adds r3, r0, #0
	adds r0, #0x48
	ldrh r0, [r0]
	cmp r0, #0
	beq _0800AAC0
	movs r1, #0x80
	lsls r1, r1, #1
	movs r0, #0x80
	movs r2, #0x10
	bl StartBgmVolumeChange
_0800AAC0:
	pop {r0}
	bx r0

	thumb_func_start sub_800AAC4
sub_800AAC4: @ 0x0800AAC4
	push {r4, lr}
	ldr r4, [r0, #0x2c]
	ldr r1, [r0, #0x30]
	ldr r2, _0800AADC @ =Sprite_16x16
	adds r0, #0x4a
	ldrh r3, [r0]
	adds r0, r4, #0
	bl PutOamHiRam
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0800AADC: .4byte Sprite_16x16

	thumb_func_start sub_800AAE0
sub_800AAE0: @ 0x0800AAE0
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x10
	adds r5, r0, #0
	bl sub_800A7E8
	adds r2, r5, #0
	adds r2, #0x46
	strh r0, [r2]
	lsls r1, r0, #0x10
	lsrs r6, r1, #0x13
	movs r1, #7
	ands r1, r0
	cmp r1, #0
	beq _0800AB06
	adds r6, #1
_0800AB06:
	lsls r0, r6, #3
	ldrh r2, [r2]
	subs r0, r0, r2
	asrs r0, r0, #1
	mov sb, r0
	adds r2, r5, #0
	adds r2, #0x34
	movs r1, #0
	ldrsb r1, [r2, r1]
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	bne _0800AB2A
	movs r0, #0x1e
	subs r0, r0, r6
	asrs r0, r0, #1
	subs r7, r0, #1
	b _0800AB2E
_0800AB2A:
	movs r7, #0
	ldrsb r7, [r2, r7]
_0800AB2E:
	adds r2, r5, #0
	adds r2, #0x35
	movs r1, #0
	ldrsb r1, [r2, r1]
	movs r0, #1
	rsbs r0, r0, #0
	movs r3, #8
	mov r8, r3
	cmp r1, r0
	beq _0800AB46
	adds r2, r1, #0
	mov r8, r2
_0800AB46:
	adds r4, r6, #2
	adds r0, r5, #0
	adds r0, #0x36
	ldrb r0, [r0]
	str r0, [sp]
	adds r0, r7, #0
	mov r1, r8
	adds r2, r4, #0
	movs r3, #4
	bl sub_804A4CC
	movs r0, #0x37
	adds r0, r0, r5
	mov sl, r0
	strb r7, [r0]
	adds r1, r5, #0
	adds r1, #0x38
	str r1, [sp, #0xc]
	mov r2, r8
	strb r2, [r1]
	adds r0, r5, #0
	adds r0, #0x39
	strb r4, [r0]
	adds r1, #2
	movs r0, #3
	strb r0, [r1]
	adds r4, r5, #0
	adds r4, #0x44
	ldrb r0, [r4]
	add r0, sb
	strb r0, [r4]
	add r0, sp, #4
	adds r1, r6, #0
	bl InitText
	adds r0, r5, #0
	adds r0, #0x3b
	ldrb r1, [r0]
	add r0, sp, #4
	bl Text_SetColor
	add r0, sp, #4
	mov r1, sb
	bl Text_SetCursor
	ldr r0, [r5, #0x2c]
	ldr r1, [sp, #4]
	ldr r2, [sp, #8]
	bl sub_800A8EC
	ldr r6, _0800AC28 @ =0x0000FFFF
	ldrh r3, [r5, #0x3e]
	cmp r3, r6
	beq _0800ABBE
	ldrh r0, [r5, #0x3e]
	adds r1, r5, #0
	adds r1, #0x40
	ldrh r1, [r1]
	bl PutIconObjImg
_0800ABBE:
	mov r1, r8
	adds r1, #1
	lsls r1, r1, #5
	adds r1, #1
	adds r1, r1, r7
	lsls r1, r1, #1
	ldr r0, _0800AC2C @ =gBg0Tm
	adds r1, r1, r0
	add r0, sp, #4
	bl PutText
	bl ResetText
	ldrh r0, [r5, #0x3e]
	cmp r0, r6
	beq _0800AC16
	ldr r0, _0800AC30 @ =gUnk_08BFFEF0
	adds r1, r5, #0
	bl Proc_Start
	mov r2, sl
	ldrb r1, [r2]
	adds r1, #1
	lsls r1, r1, #3
	ldrb r4, [r4]
	adds r1, r4, r1
	str r1, [r0, #0x2c]
	ldr r3, [sp, #0xc]
	ldrb r1, [r3]
	adds r1, #1
	lsls r1, r1, #3
	str r1, [r0, #0x30]
	adds r3, r5, #0
	adds r3, #0x40
	adds r2, r5, #0
	adds r2, #0x42
	movs r1, #0xf
	ldrb r2, [r2]
	ands r1, r2
	lsls r1, r1, #0xc
	ldrh r3, [r3]
	orrs r1, r3
	adds r0, #0x4a
	strh r1, [r0]
_0800AC16:
	add sp, #0x10
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0800AC28: .4byte 0x0000FFFF
_0800AC2C: .4byte gBg0Tm
_0800AC30: .4byte gUnk_08BFFEF0

	thumb_func_start sub_800AC34
sub_800AC34: @ 0x0800AC34
	push {lr}
	adds r1, r0, #0
	ldr r0, [r1, #0x30]
	cmp r0, #0
	bge _0800AC54
	ldr r0, _0800AC50 @ =gpKeySt
	ldr r0, [r0]
	ldrh r0, [r0, #8]
	cmp r0, #0
	beq _0800AC66
	adds r0, r1, #0
	bl Proc_Break
	b _0800AC66
	.align 2, 0
_0800AC50: .4byte gpKeySt
_0800AC54:
	cmp r0, #0
	beq _0800AC66
	subs r0, #1
	str r0, [r1, #0x30]
	cmp r0, #0
	bne _0800AC66
	adds r0, r1, #0
	bl Proc_Break
_0800AC66:
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_800AC6C
sub_800AC6C: @ 0x0800AC6C
	push {r4, r5, r6, r7, lr}
	adds r2, r0, #0
	adds r5, r2, #0
	adds r5, #0x38
	ldrb r1, [r5]
	lsls r0, r1, #5
	adds r7, r2, #0
	adds r7, #0x37
	ldrb r1, [r7]
	adds r0, r1, r0
	lsls r0, r0, #1
	ldr r1, _0800ACBC @ =gBg0Tm
	adds r0, r0, r1
	adds r6, r2, #0
	adds r6, #0x39
	ldrb r1, [r6]
	adds r4, r2, #0
	adds r4, #0x3a
	ldrb r2, [r4]
	movs r3, #0
	bl TmFillRect_thm
	ldrb r5, [r5]
	lsls r0, r5, #5
	ldrb r7, [r7]
	adds r0, r7, r0
	lsls r0, r0, #1
	ldr r1, _0800ACC0 @ =gBg1Tm
	adds r0, r0, r1
	ldrb r1, [r6]
	ldrb r2, [r4]
	movs r3, #0
	bl TmFillRect_thm
	movs r0, #3
	bl EnableBgSync
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0800ACBC: .4byte gBg0Tm
_0800ACC0: .4byte gBg1Tm

	thumb_func_start sub_800ACC4
sub_800ACC4: @ 0x0800ACC4
	ldr r1, _0800ACCC @ =0x03000104
	str r0, [r1]
	bx lr
	.align 2, 0
_0800ACCC: .4byte 0x03000104

	thumb_func_start sub_800ACD0
sub_800ACD0: @ 0x0800ACD0
	ldr r1, _0800ACD8 @ =0x03000108
	strh r0, [r1]
	bx lr
	.align 2, 0
_0800ACD8: .4byte 0x03000108

	thumb_func_start sub_800ACDC
sub_800ACDC: @ 0x0800ACDC
	ldr r1, _0800ACE4 @ =0x0300010C
	str r0, [r1]
	bx lr
	.align 2, 0
_0800ACE4: .4byte 0x0300010C

	thumb_func_start sub_800ACE8
sub_800ACE8: @ 0x0800ACE8
	push {r4, r5, lr}
	sub sp, #8
	movs r5, #0x90
	lsls r5, r5, #2
	movs r4, #4
	str r4, [sp]
	str r3, [sp, #4]
	adds r3, r5, #0
	bl sub_800AD04
	add sp, #8
	pop {r4, r5}
	pop {r1}
	bx r1

	thumb_func_start sub_800AD04
sub_800AD04: @ 0x0800AD04
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	adds r6, r2, #0
	adds r7, r3, #0
	ldr r1, [sp, #0x18]
	cmp r1, #0
	beq _0800AD20
	ldr r0, _0800AD1C @ =gUnk_08BFFE90
	bl Proc_StartBlocking
	b _0800AD28
	.align 2, 0
_0800AD1C: .4byte gUnk_08BFFE90
_0800AD20:
	ldr r0, _0800AD4C @ =gUnk_08BFFE90
	movs r1, #3
	bl Proc_Start
_0800AD28:
	adds r1, r0, #0
	str r4, [r1, #0x30]
	str r5, [r1, #0x2c]
	adds r0, r1, #0
	adds r0, #0x36
	strb r6, [r0]
	adds r0, #0xa
	strh r7, [r0]
	ldr r0, [sp, #0x14]
	adds r0, #0x10
	adds r2, r1, #0
	adds r2, #0x42
	strb r0, [r2]
	adds r0, r1, #0
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0800AD4C: .4byte gUnk_08BFFE90

	thumb_func_start sub_800AD50
sub_800AD50: @ 0x0800AD50
	push {lr}
	ldr r0, _0800AD5C @ =gUnk_08BFFE90
	bl Proc_EndEach
	pop {r0}
	bx r0
	.align 2, 0
_0800AD5C: .4byte gUnk_08BFFE90

	thumb_func_start sub_800AD60
sub_800AD60: @ 0x0800AD60
	push {lr}
	ldr r0, _0800AD70 @ =ProcScr_UnkEvt
	ldr r1, _0800AD74 @ =sub_800AD78
	bl Proc_ForEach
	pop {r0}
	bx r0
	.align 2, 0
_0800AD70: .4byte ProcScr_UnkEvt
_0800AD74: .4byte sub_800AD78

	thumb_func_start sub_800AD78
sub_800AD78: @ 0x0800AD78
	push {lr}
	bl sub_800E570
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start Event_FadeOutOfBackgroundTalk
Event_FadeOutOfBackgroundTalk: @ 0x0800AD84
	push {lr}
	adds r1, r0, #0
	ldr r0, _0800AD94 @ =gUnk_08BFFEF8
	bl Proc_StartBlocking
	pop {r0}
	bx r0
	.align 2, 0
_0800AD94: .4byte gUnk_08BFFEF8

	thumb_func_start Event_FadeOutOfSkip
Event_FadeOutOfSkip: @ 0x0800AD98
	push {lr}
	adds r1, r0, #0
	ldr r0, _0800ADA8 @ =gUnk_08BFFF58
	bl Proc_StartBlocking
	pop {r0}
	bx r0
	.align 2, 0
_0800ADA8: .4byte gUnk_08BFFF58

	thumb_func_start sub_800ADAC
sub_800ADAC: @ 0x0800ADAC
	push {lr}
	adds r1, r0, #0
	ldr r0, _0800ADBC @ =gUnk_08BFFF30
	bl Proc_StartBlocking
	pop {r0}
	bx r0
	.align 2, 0
_0800ADBC: .4byte gUnk_08BFFF30

	thumb_func_start sub_800ADC0
sub_800ADC0: @ 0x0800ADC0
	push {lr}
	adds r2, r0, #0
	ldr r1, [r2, #0x14]
	adds r1, #0x5e
	movs r0, #4
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _0800ADD8
	adds r0, r2, #0
	bl StartMidLockingFadeFromBlack
_0800ADD8:
	pop {r0}
	bx r0

	thumb_func_start sub_800ADDC
sub_800ADDC: @ 0x0800ADDC
	push {lr}
	adds r2, r0, #0
	ldr r1, [r2, #0x14]
	adds r1, #0x5e
	movs r0, #4
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _0800ADF4
	adds r0, r2, #0
	bl sub_8014530
_0800ADF4:
	pop {r0}
	bx r0

	thumb_func_start sub_800ADF8
sub_800ADF8: @ 0x0800ADF8
	push {lr}
	bl RefreshBMapGraphics
	bl UnlockBmDisplay
	bl ReleaseMus
	ldr r0, _0800AE2C @ =gBg0Tm
	movs r1, #0
	bl TmFill
	ldr r0, _0800AE30 @ =gBg1Tm
	movs r1, #0
	bl TmFill
	movs r0, #1
	bl EnableBgSync
	movs r0, #2
	bl EnableBgSync
	bl ClearTalk
	pop {r0}
	bx r0
	.align 2, 0
_0800AE2C: .4byte gBg0Tm
_0800AE30: .4byte gBg1Tm

	thumb_func_start sub_800AE34
sub_800AE34: @ 0x0800AE34
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r5, [r4, #0x14]
	ldr r0, _0800AE84 @ =gBg0Tm
	movs r1, #0
	bl TmFill
	ldr r0, _0800AE88 @ =gBg1Tm
	movs r1, #0
	bl TmFill
	movs r0, #1
	bl EnableBgSync
	movs r0, #2
	bl EnableBgSync
	bl ClearTalk
	bl RefreshBMapGraphics
	adds r1, r5, #0
	adds r1, #0x5e
	movs r0, #4
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	beq _0800AE8C
	adds r0, r5, #0
	adds r0, #0x4d
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _0800AE92
	movs r0, #0x20
	adds r1, r4, #0
	bl sub_8014470
	b _0800AE92
	.align 2, 0
_0800AE84: .4byte gBg0Tm
_0800AE88: .4byte gBg1Tm
_0800AE8C:
	adds r0, r4, #0
	bl sub_8014530
_0800AE92:
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start StartEvent
StartEvent: @ 0x0800AE98
	push {lr}
	movs r1, #3
	bl StartEventInternal
	pop {r1}
	bx r1

	thumb_func_start StartEventLocking
StartEventLocking: @ 0x0800AEA4
	push {lr}
	bl StartEventInternal
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start StartEventInternal
StartEventInternal: @ 0x0800AEB0
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	adds r5, r1, #0
	ldr r6, _0800AED8 @ =ProcScr_UnkEvt
	adds r0, r6, #0
	bl Proc_Find
	adds r4, r0, #0
	cmp r4, #0
	beq _0800AEE4
	ldr r2, _0800AEDC @ =0x03004090
	ldr r1, _0800AEE0 @ =0x03004080
	ldrb r3, [r1]
	lsls r0, r3, #2
	adds r0, r0, r2
	str r7, [r0]
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	b _0800B024
	.align 2, 0
_0800AED8: .4byte ProcScr_UnkEvt
_0800AEDC: .4byte 0x03004090
_0800AEE0: .4byte 0x03004080
_0800AEE4:
	ldr r0, _0800AEFC @ =0x03004080
	strb r4, [r0]
	ldr r0, _0800AF00 @ =0x03004090
	str r4, [r0]
	cmp r5, #7
	bgt _0800AF04
	adds r0, r6, #0
	adds r1, r5, #0
	bl Proc_Start
	b _0800AF0C
	.align 2, 0
_0800AEFC: .4byte 0x03004080
_0800AF00: .4byte 0x03004090
_0800AF04:
	adds r0, r6, #0
	adds r1, r5, #0
	bl Proc_StartBlocking
_0800AF0C:
	adds r4, r0, #0
	str r7, [r4, #0x2c]
	str r7, [r4, #0x30]
	movs r1, #0
	str r1, [r4, #0x34]
	str r1, [r4, #0x38]
	str r1, [r4, #0x40]
	str r1, [r4, #0x3c]
	str r1, [r4, #0x48]
	adds r3, r4, #0
	adds r3, #0x5e
	movs r2, #0
	movs r0, #1
	strh r0, [r3]
	adds r0, r4, #0
	adds r0, #0x50
	strh r1, [r0]
	subs r0, #2
	strb r2, [r0]
	adds r0, #8
	strh r1, [r0]
	adds r2, r4, #0
	adds r2, #0x4c
	movs r0, #0xff
	ldrb r1, [r2]
	orrs r1, r0
	strb r1, [r2]
	adds r1, r4, #0
	adds r1, #0x68
	ldrb r2, [r1]
	orrs r0, r2
	strb r0, [r1]
	ldr r2, _0800AF70 @ =gDispIo
	adds r1, r2, #0
	adds r1, #0x3c
	movs r0, #0xc0
	ldrb r1, [r1]
	ands r0, r1
	cmp r0, #0xc0
	bne _0800AF74
	adds r0, r2, #0
	adds r0, #0x46
	ldrb r0, [r0]
	cmp r0, #0x10
	bne _0800AF74
	adds r1, r4, #0
	adds r1, #0x4d
	movs r0, #1
	b _0800AF7A
	.align 2, 0
_0800AF70: .4byte gDispIo
_0800AF74:
	adds r1, r4, #0
	adds r1, #0x4d
	movs r0, #0
_0800AF7A:
	strb r0, [r1]
	ldr r0, _0800AF9C @ =0x0202E3F0
	ldr r0, [r0]
	movs r1, #0
	bl BmMapFillg
	ldr r0, [r4, #0x30]
	ldr r0, [r0]
	subs r0, #0x84
	cmp r0, #7
	bhi _0800B024
	lsls r0, r0, #2
	ldr r1, _0800AFA0 @ =_0800AFA4
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0800AF9C: .4byte 0x0202E3F0
_0800AFA0: .4byte _0800AFA4
_0800AFA4: @ jump table
	.4byte _0800AFD2 @ case 0
	.4byte _0800AFE0 @ case 1
	.4byte _0800AFEE @ case 2
	.4byte _0800B024 @ case 3
	.4byte _0800AFC4 @ case 4
	.4byte _0800AFFC @ case 5
	.4byte _0800B00A @ case 6
	.4byte _0800B018 @ case 7
_0800AFC4:
	ldr r0, [r4, #0x30]
	adds r0, #4
	str r0, [r4, #0x30]
	adds r0, r4, #0
	bl sub_800E60C
	b _0800B024
_0800AFD2:
	ldr r0, [r4, #0x30]
	adds r0, #4
	str r0, [r4, #0x30]
	adds r0, r4, #0
	bl sub_800E570
	b _0800B024
_0800AFE0:
	ldr r0, [r4, #0x30]
	adds r0, #4
	str r0, [r4, #0x30]
	adds r0, r4, #0
	bl sub_800E598
	b _0800B024
_0800AFEE:
	ldr r0, [r4, #0x30]
	adds r0, #4
	str r0, [r4, #0x30]
	adds r0, r4, #0
	bl sub_800E5C0
	b _0800B024
_0800AFFC:
	ldr r0, [r4, #0x30]
	adds r0, #4
	str r0, [r4, #0x30]
	adds r0, r4, #0
	bl sub_800E628
	b _0800B024
_0800B00A:
	ldr r0, [r4, #0x30]
	adds r0, #4
	str r0, [r4, #0x30]
	adds r0, r4, #0
	bl sub_800E65C
	b _0800B024
_0800B018:
	ldr r0, [r4, #0x30]
	adds r0, #4
	str r0, [r4, #0x30]
	adds r0, r4, #0
	bl sub_800E698
_0800B024:
	adds r0, r4, #0
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	thumb_func_start sub_800B02C
sub_800B02C: @ 0x0800B02C
	push {r4, lr}
	adds r4, r0, #0
	bl sub_8015784
	movs r0, #0
	str r0, [r4, #0x40]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_800B040
sub_800B040: @ 0x0800B040
	push {lr}
	bl sub_8015794
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_800B04C
sub_800B04C: @ 0x0800B04C
	push {lr}
	adds r0, #0x5e
	movs r1, #0x10
	ldrh r0, [r0]
	ands r1, r0
	cmp r1, #0
	bne _0800B068
	movs r0, #0
	bl SetTextFont
	bl InitSystemTextFont
	bl UnpackUiWindowFrameGraphics
_0800B068:
	pop {r0}
	bx r0

	thumb_func_start sub_800B06C
sub_800B06C: @ 0x0800B06C
	push {r4, lr}
	adds r2, r0, #0
	adds r1, r2, #0
	adds r1, #0x5e
	ldr r0, _0800B0B0 @ =0x0000FFFB
	ldrh r3, [r1]
	ands r0, r3
	strh r0, [r1]
	ldr r3, _0800B0B4 @ =0x03004080
	ldrb r0, [r3]
	cmp r0, #0
	beq _0800B0AA
	subs r0, #1
	strb r0, [r3]
	movs r0, #0
	str r0, [r2, #0x40]
	ldr r1, _0800B0B8 @ =0x03004090
	ldrb r4, [r3]
	lsls r0, r4, #2
	adds r0, r0, r1
	ldr r0, [r0]
	str r0, [r2, #0x2c]
	ldrb r3, [r3]
	lsls r0, r3, #2
	adds r0, r0, r1
	ldr r0, [r0]
	str r0, [r2, #0x30]
	adds r0, r2, #0
	movs r1, #0
	bl Proc_Goto
_0800B0AA:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0800B0B0: .4byte 0x0000FFFB
_0800B0B4: .4byte 0x03004080
_0800B0B8: .4byte 0x03004090

	thumb_func_start sub_800B0BC
sub_800B0BC: @ 0x0800B0BC
	push {lr}
	adds r0, #0x5e
	movs r1, #8
	ldrh r0, [r0]
	ands r1, r0
	cmp r1, #0
	beq _0800B0CE
	bl EndMapMain
_0800B0CE:
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_800B0D4
sub_800B0D4: @ 0x0800B0D4
	push {r4, lr}
	adds r4, r0, #0
	bl sub_8014900
	ldr r0, _0800B0FC @ =gUnk_08BFFD4C
	bl Proc_EndEach
	adds r4, #0x4c
	movs r1, #0
	ldrsb r1, [r4, r1]
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	bne _0800B0F4
	bl sub_806E930
_0800B0F4:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0800B0FC: .4byte gUnk_08BFFD4C

	thumb_func_start sub_800B100
sub_800B100: @ 0x0800B100
	push {lr}
	adds r0, #0x5e
	ldrh r1, [r0]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	bne _0800B124
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	bne _0800B124
	bl IsBattleDeamonActive
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0800B124
	movs r0, #1
	b _0800B126
_0800B124:
	movs r0, #0
_0800B126:
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_800B12C
sub_800B12C: @ 0x0800B12C
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	ldr r0, _0800B144 @ =gUnk_08C00018
	bl Proc_StartBlocking
	str r5, [r0, #0x50]
	str r4, [r0, #0x4c]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0800B144: .4byte gUnk_08C00018

	thumb_func_start sub_800B148
sub_800B148: @ 0x0800B148
	push {r4, lr}
	adds r4, r0, #0
	bl sub_800B188
	adds r4, #0x64
	movs r0, #0x40
	strh r0, [r4]
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_800B15C
sub_800B15C: @ 0x0800B15C
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r5, [r4, #0x50]
	bl sub_800B200
	ldr r0, _0800B184 @ =gDispIo
	adds r0, #0x46
	ldrb r0, [r0]
	cmp r0, #0x10
	bne _0800B17C
	ldr r0, [r4, #0x4c]
	bl _call_via_r5
	adds r0, r4, #0
	bl Proc_Break
_0800B17C:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0800B184: .4byte gDispIo

	thumb_func_start sub_800B188
sub_800B188: @ 0x0800B188
	push {r4, r5, r6, lr}
	ldr r1, _0800B1F8 @ =gDispIo
	mov ip, r1
	mov r2, ip
	adds r2, #0x34
	movs r3, #0x20
	ldrb r1, [r2]
	orrs r1, r3
	strb r1, [r2]
	adds r2, #1
	ldrb r1, [r2]
	orrs r1, r3
	strb r1, [r2]
	adds r2, #2
	ldrb r1, [r2]
	orrs r1, r3
	strb r1, [r2]
	subs r2, #1
	ldrb r1, [r2]
	orrs r1, r3
	strb r1, [r2]
	mov r4, ip
	adds r4, #0x3c
	movs r1, #0xc0
	ldrb r2, [r4]
	orrs r1, r2
	strb r1, [r4]
	mov r1, ip
	adds r1, #0x44
	movs r5, #0
	strb r5, [r1]
	adds r1, #1
	strb r5, [r1]
	adds r1, #1
	strb r5, [r1]
	ldr r1, _0800B1FC @ =0x0000FFE0
	mov r6, ip
	ldrh r6, [r6, #0x3c]
	ands r1, r6
	movs r2, #0x1f
	orrs r1, r2
	mov r2, ip
	strh r1, [r2, #0x3c]
	ldrb r6, [r4]
	orrs r3, r6
	strb r3, [r4]
	adds r2, r0, #0
	adds r2, #0x64
	movs r1, #0x10
	strh r1, [r2]
	adds r0, #0x66
	strh r5, [r0]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0800B1F8: .4byte gDispIo
_0800B1FC: .4byte 0x0000FFE0

	thumb_func_start sub_800B200
sub_800B200: @ 0x0800B200
	push {lr}
	adds r2, r0, #0
	ldr r0, _0800B218 @ =gDispIo
	adds r3, r0, #0
	adds r3, #0x46
	ldrb r0, [r3]
	cmp r0, #0x10
	bne _0800B21C
	adds r0, r2, #0
	bl Proc_End
	b _0800B240
	.align 2, 0
_0800B218: .4byte gDispIo
_0800B21C:
	adds r1, r2, #0
	adds r1, #0x66
	adds r0, r2, #0
	adds r0, #0x64
	ldrh r2, [r1]
	ldrh r0, [r0]
	adds r0, r2, r0
	strh r0, [r1]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0xff
	ble _0800B23A
	movs r0, #0x80
	lsls r0, r0, #1
	strh r0, [r1]
_0800B23A:
	ldrh r1, [r1]
	lsrs r0, r1, #4
	strb r0, [r3]
_0800B240:
	pop {r0}
	bx r0

	thumb_func_start sub_800B244
sub_800B244: @ 0x0800B244
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r1, r4, #0
	adds r1, #0x50
	movs r0, #0
	strh r0, [r1]
	ldr r0, [r4, #0x3c]
	cmp r0, #0
	beq _0800B25A
	bl _call_via_r0
_0800B25A:
	adds r5, r4, #0
	adds r5, #0x5e
	movs r0, #4
	ldrh r1, [r5]
	orrs r0, r1
	strh r0, [r5]
	bl sub_800A378
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0800B2AE
	bl sub_80B6464
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0800B284
	adds r0, r4, #0
	bl sub_800B0D4
	subs r5, #0x11
	b _0800B2AA
_0800B284:
	movs r0, #0x20
	ldrh r5, [r5]
	ands r0, r5
	adds r5, r4, #0
	adds r5, #0x4d
	cmp r0, #0
	bne _0800B2AA
	movs r0, #0
	ldrsb r0, [r5, r0]
	cmp r0, #0
	beq _0800B2A2
	adds r0, r4, #0
	bl sub_800B0D4
	b _0800B2AA
_0800B2A2:
	ldr r0, _0800B2C8 @ =sub_800B0D4
	adds r1, r4, #0
	bl sub_800B12C
_0800B2AA:
	movs r0, #1
	strb r0, [r5]
_0800B2AE:
	movs r0, #5
	bl Proc_BlockEachMarked
	ldr r1, [r4, #0x40]
	cmp r1, #0
	beq _0800B2C0
	adds r0, r4, #0
	bl _call_via_r1
_0800B2C0:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0800B2C8: .4byte sub_800B0D4

	thumb_func_start sub_800B2CC
sub_800B2CC: @ 0x0800B2CC
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r4, r0, #0
	ldr r0, _0800B314 @ =gUnk_08C05CA0
	bl Proc_Find
	cmp r0, #0
	bne _0800B3D0
	bl sub_8032CDC
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0800B3D0
	bl sub_801DA38
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0800B3D0
	adds r0, r4, #0
	bl sub_800B100
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0800B31C
	ldr r0, _0800B318 @ =gpKeySt
	ldr r1, [r0]
	movs r0, #8
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _0800B31C
	adds r0, r4, #0
	bl sub_800B244
	b _0800B3D0
	.align 2, 0
_0800B314: .4byte gUnk_08C05CA0
_0800B318: .4byte gpKeySt
_0800B31C:
	adds r3, r4, #0
	adds r3, #0x50
	ldrh r2, [r3]
	cmp r2, #0
	beq _0800B378
	subs r5, r2, #1
	strh r5, [r3]
	adds r0, r4, #0
	adds r0, #0x4e
	ldrb r0, [r0]
	cmp r0, #0
	beq _0800B3D0
	ldr r0, _0800B370 @ =gPlaySt
	adds r0, #0x40
	ldrb r0, [r0]
	lsrs r0, r0, #7
	cmp r0, #0
	bne _0800B34E
	ldr r0, _0800B374 @ =gpKeySt
	ldr r1, [r0]
	movs r0, #1
	ldrh r1, [r1, #4]
	ands r0, r1
	cmp r0, #0
	beq _0800B3D0
_0800B34E:
	lsls r0, r5, #0x10
	cmp r0, #0
	beq _0800B3D0
	subs r0, r2, #2
	strh r0, [r3]
	lsls r0, r0, #0x10
	cmp r0, #0
	beq _0800B3D0
	subs r0, r2, #3
	strh r0, [r3]
	lsls r0, r0, #0x10
	cmp r0, #0
	beq _0800B3D0
	subs r0, r2, #4
	strh r0, [r3]
	b _0800B3D0
	.align 2, 0
_0800B370: .4byte gPlaySt
_0800B374: .4byte gpKeySt
_0800B378:
	ldr r1, [r4, #0x40]
	cmp r1, #0
	beq _0800B386
	adds r0, r4, #0
	bl _call_via_r1
	b _0800B3D0
_0800B386:
	adds r6, r4, #0
	adds r6, #0x56
	ldr r7, _0800B3A4 @ =gEventCmdTable
	adds r0, r7, #4
	mov r8, r0
_0800B390:
	ldr r0, [r4, #0x30]
	ldrh r5, [r0]
	ldrh r0, [r6]
	cmp r0, #0
	beq _0800B3A8
	subs r0, #1
	strh r0, [r6]
	movs r2, #0
	b _0800B3B6
	.align 2, 0
_0800B3A4: .4byte gEventCmdTable
_0800B3A8:
	lsls r0, r5, #3
	adds r0, r0, r7
	ldr r1, [r0]
	adds r0, r4, #0
	bl _call_via_r1
	adds r2, r0, #0
_0800B3B6:
	cmp r2, #1
	beq _0800B390
	cmp r2, #3
	beq _0800B3D0
	lsls r0, r5, #3
	add r0, r8
	ldr r1, [r0]
	lsls r1, r1, #2
	ldr r0, [r4, #0x30]
	adds r0, r0, r1
	str r0, [r4, #0x30]
	cmp r2, #2
	bne _0800B390
_0800B3D0:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_800B3DC
sub_800B3DC: @ 0x0800B3DC
	push {r4, lr}
	adds r4, r0, #0
	adds r1, r4, #0
	adds r1, #0x5e
	movs r0, #0x10
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _0800B3F8
	bl FaceExists
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0800B3FE
_0800B3F8:
	adds r0, r4, #0
	bl Proc_Break
_0800B3FE:
	pop {r4}
	pop {r0}
	bx r0
