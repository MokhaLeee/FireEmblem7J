	.include "macro.inc"
	.syntax unified


	thumb_func_start TactBlood_Loop
TactBlood_Loop: @ 0x080A7BB4
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
	ldr r3, _080A7C90 @ =TacticianAffins
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
	ldr r4, _080A7C94 @ =gTactInfoFont
	adds r0, r4, #0
	bl SetTextFont
	movs r0, #1
	bl SetTextFontGlyphs
	ldr r0, _080A7C98 @ =0x06011000
	movs r1, #8
	movs r2, #4
	bl Tact_ClearNrVrams
	adds r4, #0x18
	ldrb r5, [r5]
	lsls r0, r5, #0x1c
	lsrs r0, r0, #0x1d
	bl TactGetMsg_Blood
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
_080A7C90: .4byte TacticianAffins
_080A7C94: .4byte gTactInfoFont
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

	thumb_func_start TactBlood_End
TactBlood_End: @ 0x080A7D50
	push {r4, lr}
	ldr r0, _080A7D80 @ =gBg1Tm
	movs r1, #0
	bl TmFill
	ldr r4, _080A7D84 @ =gTactInfoFont
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
_080A7D84: .4byte gTactInfoFont

	thumb_func_start StartTactBloodSelect
StartTactBloodSelect: @ 0x080A7D88
	push {lr}
	adds r1, r0, #0
	ldr r0, _080A7D98 @ =ProcScr_TactBloodSelect
	bl Proc_StartBlocking
	pop {r0}
	bx r0
	.align 2, 0
_080A7D98: .4byte ProcScr_TactBloodSelect

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
	bl DrawUiFrame2
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
	ldr r4, _080A7E48 @ =gTactInfoFont
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
	bl TactGetMsg_Birth
	bl DecodeMsg
	adds r3, r0, #0
	adds r0, r6, #0
	adds r1, r4, #0
	movs r2, #0
	bl Text_InsertDrawString
	adds r0, r5, #6
	bl TactGetMsg_Birth
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
_080A7E48: .4byte gTactInfoFont

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
	ldr r4, _080A7F24 @ =TacticianAffins
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
	ldr r4, _080A7F28 @ =gTactInfoFont
	adds r0, r4, #0
	bl SetTextFont
	movs r0, #1
	bl SetTextFontGlyphs
	ldr r0, _080A7F2C @ =0x06011000
	movs r1, #0xc
	movs r2, #4
	bl Tact_ClearNrVrams
	adds r4, #0x18
	ldrb r5, [r5]
	lsrs r0, r5, #4
	bl TactGetMsg_Birth
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
_080A7F24: .4byte TacticianAffins
_080A7F28: .4byte gTactInfoFont
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
	ldr r4, _080A80A0 @ =gTactInfoFont
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
_080A80A0: .4byte gTactInfoFont

	thumb_func_start StartTactBirthSelect
StartTactBirthSelect: @ 0x080A80A4
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
	bl DrawUiFrame2
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
	ldr r0, _080A8138 @ =gTactInfoFont
	bl SetTextFont
	movs r0, #0
	bl SetTextFontGlyphs
	movs r4, #0
	movs r5, #0
_080A8106:
	adds r0, r4, #0
	bl TactGetMsg_Gender
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
_080A8138: .4byte gTactInfoFont
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
	ldr r4, _080A81FC @ =gTactInfoFont
	adds r0, r4, #0
	bl SetTextFont
	movs r0, #1
	bl SetTextFontGlyphs
	ldr r0, _080A8200 @ =0x06011000
	movs r1, #0x10
	movs r2, #4
	bl Tact_ClearNrVrams
	adds r4, #0x18
	ldrb r5, [r5]
	lsls r0, r5, #0x1f
	lsrs r0, r0, #0x1f
	bl TactGetMsg_Gender
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
_080A81FC: .4byte gTactInfoFont
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
	ldr r4, _080A82EC @ =gTactInfoFont
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
_080A82EC: .4byte gTactInfoFont

	thumb_func_start StartTactGenderSelect
StartTactGenderSelect: @ 0x080A82F0
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
