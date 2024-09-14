	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_8007C10
sub_8007C10: @ 0x08007C10
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x2c]
	ldr r1, [r0, #0x48]
	cmp r1, #0
	beq _08007C34
	ldr r0, [r4, #0x30]
	ldrb r0, [r0, #0x18]
	strh r0, [r1, #0x30]
	ldr r0, [r4, #0x2c]
	ldr r0, [r0, #0x48]
	movs r1, #0
	bl Proc_Goto
	ldr r0, [r4, #0x2c]
	ldr r0, [r0, #0x48]
	bl TryUnlockProc
_08007C34:
	ldr r0, [r4, #0x2c]
	ldr r0, [r0, #0x44]
	cmp r0, #0
	beq _08007C40
	bl TryUnlockProc
_08007C40:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_8007C48
sub_8007C48: @ 0x08007C48
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r0, _08007C60 @ =gUnk_08BFFB30
	adds r1, r4, #0
	bl Proc_Start
	str r4, [r0, #0x2c]
	str r5, [r0, #0x34]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08007C60: .4byte gUnk_08BFFB30

	thumb_func_start sub_8007C64
sub_8007C64: @ 0x08007C64
	push {r4, lr}
	movs r2, #0
	ldr r4, _08007C84 @ =sTalkSt
	movs r3, #0
_08007C6C:
	ldr r0, [r4]
	lsls r1, r2, #2
	adds r0, #0x18
	adds r0, r0, r1
	str r3, [r0]
	adds r2, #1
	cmp r2, #7
	ble _08007C6C
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08007C84: .4byte sTalkSt

	thumb_func_start InitTalk
InitTalk: @ 0x08007C88
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	adds r6, r1, #0
	lsls r2, r2, #0x18
	lsrs r7, r2, #0x18
	ldr r4, _08007D0C @ =0x030000E8
	movs r0, #0
	bl GetBgChrOffset
	adds r1, r0, #0
	ldr r0, _08007D10 @ =0x000003FF
	ands r0, r5
	lsls r0, r0, #5
	movs r2, #0xc0
	lsls r2, r2, #0x13
	adds r0, r0, r2
	adds r1, r1, r0
	adds r0, r4, #0
	adds r2, r5, #0
	movs r3, #2
	bl InitTextFont
	bl sub_8007DF4
	ldr r0, _08007D14 @ =sTalkSt
	ldr r0, [r0]
	strb r6, [r0, #0xa]
	cmp r6, #0
	ble _08007CDE
	ldr r4, _08007D18 @ =0x030000C8
	adds r5, r6, #0
_08007CC6:
	adds r0, r4, #0
	movs r1, #0x1e
	bl InitText
	adds r0, r4, #0
	movs r1, #1
	bl Text_SetColor
	adds r4, #8
	subs r5, #1
	cmp r5, #0
	bne _08007CC6
_08007CDE:
	cmp r7, #0
	beq _08007D00
	ldr r4, _08007D1C @ =gUnk_084027B0
	movs r0, #1
	bl GetBgChrOffset
	adds r1, r0, #0
	ldr r0, _08007D20 @ =0x06000200
	adds r1, r1, r0
	adds r0, r4, #0
	bl Decompress
	ldr r0, _08007D24 @ =gUnk_08402A4C
	movs r1, #0x60
	movs r2, #0x20
	bl ApplyPaletteExt
_08007D00:
	bl sub_8007C64
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08007D0C: .4byte 0x030000E8
_08007D10: .4byte 0x000003FF
_08007D14: .4byte sTalkSt
_08007D18: .4byte 0x030000C8
_08007D1C: .4byte gUnk_084027B0
_08007D20: .4byte 0x06000200
_08007D24: .4byte gUnk_08402A4C

	thumb_func_start InitSpriteTalk
InitSpriteTalk: @ 0x08007D28
	push {r4, r5, r6, lr}
	adds r6, r1, #0
	adds r4, r2, #0
	ldr r5, _08007DB8 @ =0x030000E8
	ldr r1, _08007DBC @ =0x000003FF
	ands r1, r0
	lsls r1, r1, #5
	ldr r0, _08007DC0 @ =0x06010000
	adds r1, r1, r0
	adds r0, r5, #0
	bl InitSpriteTextFont
	adds r0, r5, #0
	bl SetTextFont
	movs r0, #1
	bl SetTextFontGlyphs
	ldr r0, _08007DC4 @ =gUnk_081901E8
	adds r4, #0x10
	lsls r1, r4, #5
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r2, _08007DC8 @ =gPal
	lsls r4, r4, #4
	adds r0, r4, #4
	lsls r0, r0, #1
	adds r0, r0, r2
	ldr r1, _08007DCC @ =0x00007247
	strh r1, [r0]
	adds r0, r4, #0
	adds r0, #0xe
	lsls r0, r0, #1
	adds r0, r0, r2
	ldr r1, _08007DD0 @ =0x000031AE
	strh r1, [r0]
	adds r4, #0xf
	lsls r4, r4, #1
	adds r4, r4, r2
	ldr r0, _08007DD4 @ =0x00007FFF
	strh r0, [r4]
	ldr r0, _08007DD8 @ =sTalkSt
	ldr r0, [r0]
	strb r6, [r0, #0xa]
	movs r5, #0
	cmp r5, r6
	bge _08007DB0
_08007D88:
	lsls r4, r5, #3
	ldr r0, _08007DDC @ =0x030000C8
	adds r4, r4, r0
	adds r0, r4, #0
	bl InitSpriteText
	adds r0, r4, #0
	bl SpriteText_DrawBackground
	adds r0, r4, #0
	movs r1, #6
	bl Text_SetColor
	adds r0, r4, #0
	movs r1, #4
	bl Text_SetCursor
	adds r5, #1
	cmp r5, r6
	blt _08007D88
_08007DB0:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08007DB8: .4byte 0x030000E8
_08007DBC: .4byte 0x000003FF
_08007DC0: .4byte 0x06010000
_08007DC4: .4byte gUnk_081901E8
_08007DC8: .4byte gPal
_08007DCC: .4byte 0x00007247
_08007DD0: .4byte 0x000031AE
_08007DD4: .4byte 0x00007FFF
_08007DD8: .4byte sTalkSt
_08007DDC: .4byte 0x030000C8

	thumb_func_start sub_8007DE0
sub_8007DE0: @ 0x08007DE0
	push {lr}
	ldr r0, _08007DF0 @ =Pal_Text
	movs r1, #0x40
	movs r2, #0x20
	bl ApplyPaletteExt
	pop {r0}
	bx r0
	.align 2, 0
_08007DF0: .4byte Pal_Text

	thumb_func_start sub_8007DF4
sub_8007DF4: @ 0x08007DF4
	push {lr}
	ldr r0, _08007E04 @ =0x030000E8
	bl SetTextFont
	bl InitTalkTextFont
	pop {r0}
	bx r0
	.align 2, 0
_08007E04: .4byte 0x030000E8

	thumb_func_start StartTalkExt
StartTalkExt: @ 0x08007E08
	push {r4, r5, r6, r7, lr}
	adds r7, r3, #0
	ldr r4, _08007E90 @ =sTalkSt
	ldr r3, [r4]
	movs r5, #0
	strb r0, [r3, #0xc]
	ldr r0, [r4]
	strb r1, [r0, #0xd]
	ldr r0, [r4]
	str r2, [r0]
	str r5, [r0, #4]
	movs r6, #1
	strb r6, [r0, #8]
	ldr r0, [r4]
	strb r5, [r0, #9]
	ldr r0, [r4]
	adds r0, #0x82
	strb r5, [r0]
	ldr r0, [r4]
	strb r5, [r0, #0xb]
	bl GetTextPrintDelay
	ldr r1, [r4]
	strb r0, [r1, #0x13]
	ldr r0, [r4]
	strb r5, [r0, #0x14]
	movs r0, #0xff
	bl sub_8008CB8
	ldr r1, [r4]
	movs r0, #0xff
	strb r0, [r1, #0xf]
	ldr r0, [r4]
	strb r5, [r0, #0x15]
	ldr r0, [r4]
	strb r5, [r0, #0x12]
	ldr r0, [r4]
	strb r6, [r0, #0x16]
	ldr r0, [r4]
	strb r5, [r0, #0x17]
	ldr r0, [r4]
	adds r1, r0, #0
	adds r1, #0x80
	movs r2, #0
	strh r5, [r1]
	str r5, [r0, #0x38]
	adds r0, #0x83
	strb r2, [r0]
	ldr r0, [r4]
	ldr r0, [r0]
	movs r1, #0
	bl sub_8009FAC
	adds r0, #7
	movs r1, #8
	bl Div
	ldr r1, [r4]
	adds r0, #2
	strb r0, [r1, #0xe]
	cmp r7, #0
	bne _08007E98
	ldr r0, _08007E94 @ =ProcScr_Talk
	movs r1, #3
	bl Proc_Start
	b _08007EA0
	.align 2, 0
_08007E90: .4byte sTalkSt
_08007E94: .4byte ProcScr_Talk
_08007E98:
	ldr r0, _08007EA8 @ =ProcScr_Talk
	adds r1, r7, #0
	bl Proc_StartBlocking
_08007EA0:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_08007EA8: .4byte ProcScr_Talk

	thumb_func_start StartTalkMsg
StartTalkMsg: @ 0x08007EAC
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r0, r2, #0
	bl DecodeMsg
	adds r2, r0, #0
	adds r0, r4, #0
	adds r1, r5, #0
	movs r3, #0
	bl StartTalkExt
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start StartTalkMsgExt
StartTalkMsgExt: @ 0x08007ECC
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r0, r2, #0
	adds r6, r3, #0
	bl DecodeMsg
	adds r2, r0, #0
	adds r0, r4, #0
	adds r1, r5, #0
	adds r3, r6, #0
	bl StartTalkExt
	pop {r4, r5, r6}
	pop {r1}
	bx r1

	thumb_func_start StartTalk
StartTalk: @ 0x08007EEC
	push {lr}
	movs r3, #0
	bl StartTalkExt
	pop {r1}
	bx r1

	thumb_func_start EndTalk
EndTalk: @ 0x08007EF8
	push {lr}
	ldr r0, _08007F04 @ =ProcScr_Talk
	bl Proc_EndEach
	pop {r0}
	bx r0
	.align 2, 0
_08007F04: .4byte ProcScr_Talk

	thumb_func_start SetTalkLines
SetTalkLines: @ 0x08007F08
	ldr r1, _08007F10 @ =sTalkSt
	ldr r1, [r1]
	strb r0, [r1, #0xa]
	bx lr
	.align 2, 0
_08007F10: .4byte sTalkSt

	thumb_func_start ClearAllTalkFlags
ClearAllTalkFlags: @ 0x08007F14
	ldr r0, _08007F20 @ =sTalkSt
	ldr r0, [r0]
	adds r0, #0x80
	movs r1, #0
	strh r1, [r0]
	bx lr
	.align 2, 0
_08007F20: .4byte sTalkSt

	thumb_func_start SetTalkFlag
SetTalkFlag: @ 0x08007F24
	ldr r1, _08007F34 @ =sTalkSt
	ldr r1, [r1]
	adds r1, #0x80
	ldrh r2, [r1]
	orrs r0, r2
	strh r0, [r1]
	bx lr
	.align 2, 0
_08007F34: .4byte sTalkSt

	thumb_func_start sub_8007F38
sub_8007F38: @ 0x08007F38
	ldr r1, _08007F40 @ =sTalkSt
	ldr r1, [r1]
	str r0, [r1, #0x38]
	bx lr
	.align 2, 0
_08007F40: .4byte sTalkSt

	thumb_func_start sub_8007F44
sub_8007F44: @ 0x08007F44
	ldr r1, _08007F54 @ =sTalkSt
	ldr r1, [r1]
	adds r1, #0x80
	ldrh r2, [r1]
	bics r2, r0
	adds r0, r2, #0
	strh r0, [r1]
	bx lr
	.align 2, 0
_08007F54: .4byte sTalkSt

	thumb_func_start sub_8007F58
sub_8007F58: @ 0x08007F58
	ldr r1, _08007F64 @ =sTalkSt
	ldr r1, [r1]
	adds r1, #0x80
	ldrh r1, [r1]
	ands r0, r1
	bx lr
	.align 2, 0
_08007F64: .4byte sTalkSt

	thumb_func_start sub_8007F68
sub_8007F68: @ 0x08007F68
	ldr r2, _08007F80 @ =sTalkSt
	ldr r1, [r2]
	strb r0, [r1, #0x13]
	ldr r2, [r2]
	movs r0, #0x13
	ldrsb r0, [r2, r0]
	cmp r0, #0
	bge _08007F7C
	movs r0, #0
	strb r0, [r2, #0x13]
_08007F7C:
	bx lr
	.align 2, 0
_08007F80: .4byte sTalkSt

	thumb_func_start sub_8007F84
sub_8007F84: @ 0x08007F84
	push {r4, r5, r6, lr}
	ldr r2, _08007FB8 @ =sTalkSt
	ldr r1, [r2]
	strb r0, [r1, #8]
	movs r4, #0
	ldr r0, [r2]
	ldrb r0, [r0, #0xa]
	cmp r4, r0
	bge _08007FB0
	adds r6, r2, #0
	ldr r5, _08007FBC @ =0x030000C8
_08007F9A:
	ldr r0, [r6]
	ldrb r1, [r0, #8]
	adds r0, r5, #0
	bl Text_SetColor
	adds r5, #8
	adds r4, #1
	ldr r0, [r6]
	ldrb r0, [r0, #0xa]
	cmp r4, r0
	blt _08007F9A
_08007FB0:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08007FB8: .4byte sTalkSt
_08007FBC: .4byte 0x030000C8

	thumb_func_start sub_8007FC0
sub_8007FC0: @ 0x08007FC0
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08008020 @ =gUnk_08BFFC7C
	bl Proc_Find
	cmp r0, #0
	bne _08008062
	ldr r0, _08008024 @ =gUnk_08BFFCD4
	bl Proc_Find
	cmp r0, #0
	bne _08008062
	movs r0, #4
	bl sub_8007F58
	cmp r0, #0
	bne _08008038
	ldr r0, _08008028 @ =gpKeySt
	ldr r1, [r0]
	movs r0, #0xa
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _08008038
	bl sub_800EF98
	ldr r0, _0800802C @ =sTalkSt
	ldr r0, [r0]
	ldrb r0, [r0, #0x11]
	bl SetTalkFaceNoMouthMove
	adds r0, r4, #0
	bl Proc_End
	bl EndTalk
	ldr r0, _08008030 @ =gBg0Tm
	movs r1, #0
	bl TmFill
	ldr r0, _08008034 @ =gBg1Tm
	movs r1, #0
	bl TmFill
	movs r0, #3
	bl EnableBgSync
	b _08008062
	.align 2, 0
_08008020: .4byte gUnk_08BFFC7C
_08008024: .4byte gUnk_08BFFCD4
_08008028: .4byte gpKeySt
_0800802C: .4byte sTalkSt
_08008030: .4byte gBg0Tm
_08008034: .4byte gBg1Tm
_08008038:
	ldr r0, _08008068 @ =gUnk_08BFFBFC
	bl Proc_Find
	cmp r0, #0
	bne _08008062
	movs r0, #8
	bl sub_8007F58
	cmp r0, #0
	bne _08008062
	ldr r0, _0800806C @ =gpKeySt
	ldr r1, [r0]
	movs r0, #0xf3
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _08008062
	ldr r0, _08008070 @ =sTalkSt
	ldr r1, [r0]
	movs r0, #1
	strb r0, [r1, #0x12]
_08008062:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08008068: .4byte gUnk_08BFFBFC
_0800806C: .4byte gpKeySt
_08008070: .4byte sTalkSt

	thumb_func_start sub_8008074
sub_8008074: @ 0x08008074
	push {lr}
	movs r0, #0x20
	bl sub_8007F58
	cmp r0, #0
	bne _08008098
	bl ApplySystemObjectsGraphics
	movs r0, #0
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	movs r0, #1
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
_08008098:
	ldr r0, _080080A4 @ =gUnk_08BFFB6C
	movs r1, #3
	bl Proc_Start
	pop {r0}
	bx r0
	.align 2, 0
_080080A4: .4byte gUnk_08BFFB6C

	thumb_func_start sub_80080A8
sub_80080A8: @ 0x080080A8
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r6, r0, #0
	bl sub_8008EB0
	lsls r0, r0, #0x18
	asrs r3, r0, #0x18
	cmp r3, #0
	beq _080080BE
	b _0800820E
_080080BE:
	ldr r2, _08008108 @ =sTalkSt
	ldr r1, [r2]
	movs r0, #0x12
	ldrsb r0, [r1, r0]
	cmp r0, #0
	bne _080080E2
	ldrb r0, [r1, #0x14]
	adds r0, #1
	strb r0, [r1, #0x14]
	ldr r0, [r2]
	movs r1, #0x14
	ldrsb r1, [r0, r1]
	ldrb r0, [r0, #0x13]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r1, r0
	bge _080080E2
	b _0800820E
_080080E2:
	ldr r0, [r2]
	strb r3, [r0, #0x14]
_080080E6:
	ldr r7, _08008108 @ =sTalkSt
	ldr r0, _0800810C @ =0x0202BC35
	mov r8, r0
_080080EC:
	ldr r0, [r7]
	ldrb r0, [r0, #0x11]
	bl SetTalkFaceNoMouthMove
	adds r0, r6, #0
	bl TalkInterpret
	cmp r0, #1
	beq _08008144
	cmp r0, #1
	bgt _08008110
	cmp r0, #0
	beq _0800811A
	b _08008144
	.align 2, 0
_08008108: .4byte sTalkSt
_0800810C: .4byte 0x0202BC35
_08008110:
	cmp r0, #2
	beq _08008122
	cmp r0, #3
	beq _08008136
	b _08008144
_0800811A:
	adds r0, r6, #0
	bl Proc_Break
	b _0800820E
_08008122:
	ldr r1, [r7]
	movs r0, #0x12
	ldrsb r0, [r1, r0]
	cmp r0, #0
	bne _080080E6
	movs r0, #0x13
	ldrsb r0, [r1, r0]
	cmp r0, #0
	ble _080081F8
	b _0800820E
_08008136:
	ldr r0, [r7]
	ldrb r1, [r0, #0x13]
	movs r2, #0
	strb r1, [r0, #0x14]
	ldr r0, [r7]
	strb r2, [r0, #0x12]
	b _0800820E
_08008144:
	movs r0, #0x20
	bl sub_8007F58
	cmp r0, #0
	bne _08008156
	adds r0, r6, #0
	bl sub_800821C
	b _0800815C
_08008156:
	adds r0, r6, #0
	bl sub_8008308
_0800815C:
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	beq _0800820E
	ldr r5, _080081AC @ =sTalkSt
	ldr r4, [r5]
	ldrb r1, [r4, #0xb]
	ldrb r2, [r4, #9]
	adds r0, r1, r2
	ldrb r1, [r4, #0xa]
	bl __modsi3
	lsls r0, r0, #3
	ldr r1, _080081B0 @ =0x030000C8
	adds r0, r0, r1
	ldr r1, [r4]
	bl Text_DrawCharacter
	ldr r1, [r5]
	str r0, [r1]
	movs r0, #0x40
	bl sub_8007F58
	cmp r0, #0
	bne _080081F8
	movs r0, #0x80
	bl sub_8007F58
	cmp r0, #0
	beq _080081B8
	mov r1, r8
	ldrb r1, [r1]
	lsls r0, r1, #0x1e
	cmp r0, #0
	blt _080081F8
	ldr r0, _080081B4 @ =0x0000039A
	bl m4aSongNumStart
	b _080081F8
	.align 2, 0
_080081AC: .4byte sTalkSt
_080081B0: .4byte 0x030000C8
_080081B4: .4byte 0x0000039A
_080081B8:
	bl GetTextPrintDelay
	adds r4, r0, #0
	cmp r4, #1
	bne _080081CC
	bl GetGameTime
	ands r0, r4
	cmp r0, #0
	beq _080081F8
_080081CC:
	ldr r1, [r5]
	movs r0, #0x12
	ldrsb r0, [r1, r0]
	cmp r0, #0
	beq _080081E0
	adds r0, r1, #0
	adds r0, #0x82
	ldrb r0, [r0]
	cmp r0, #0
	bne _080081F8
_080081E0:
	adds r0, r1, #0
	adds r0, #0x82
	movs r1, #1
	strb r1, [r0]
	mov r2, r8
	ldrb r2, [r2]
	lsls r0, r2, #0x1e
	cmp r0, #0
	blt _080081F8
	ldr r0, _08008218 @ =0x0000038E
	bl m4aSongNumStart
_080081F8:
	ldr r1, [r7]
	movs r0, #0x12
	ldrsb r0, [r1, r0]
	cmp r0, #0
	beq _08008204
	b _080080EC
_08008204:
	movs r0, #0x13
	ldrsb r0, [r1, r0]
	cmp r0, #0
	bgt _0800820E
	b _080080EC
_0800820E:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08008218: .4byte 0x0000038E

	thumb_func_start sub_800821C
sub_800821C: @ 0x0800821C
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	bl sub_8009D70
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08008288
	ldr r4, _08008284 @ =sTalkSt
	ldr r0, [r4]
	ldrb r0, [r0, #0x11]
	cmp r0, #0xff
	beq _08008288
	movs r0, #2
	bl sub_8007F58
	cmp r0, #0
	bne _08008288
	ldr r1, [r4]
	ldr r0, [r1, #4]
	cmp r0, #0
	bne _08008248
	ldr r0, [r1]
_08008248:
	movs r1, #0
	bl sub_8009FAC
	adds r0, #7
	movs r1, #8
	bl Div
	ldr r1, [r4]
	adds r0, #2
	strb r0, [r1, #0xe]
	bl sub_80095E4
	ldr r4, _08008284 @ =sTalkSt
	ldr r0, [r4]
	ldrb r0, [r0, #0x11]
	adds r1, r7, #0
	bl sub_8009D0C
	ldr r0, [r4]
	ldrb r4, [r0, #0x11]
	movs r0, #0x10
	bl sub_8007F58
	adds r1, r0, #0
	adds r0, r4, #0
	bl sub_8008DFC
	movs r0, #1
	b _080082F8
	.align 2, 0
_08008284: .4byte sTalkSt
_08008288:
	ldr r6, _080082A4 @ =sTalkSt
	ldr r5, [r6]
	ldrb r0, [r5, #9]
	ldrb r1, [r5, #0xa]
	cmp r0, r1
	blo _080082AC
	movs r0, #0
	strb r0, [r5, #0x12]
	ldr r0, _080082A8 @ =gUnk_08BFFCD4
	adds r1, r7, #0
	bl Proc_StartBlocking
	movs r0, #1
	b _080082F8
	.align 2, 0
_080082A4: .4byte sTalkSt
_080082A8: .4byte gUnk_08BFFCD4
_080082AC:
	ldrb r0, [r5, #0x15]
	cmp r0, #0
	bne _080082E8
	ldrb r4, [r5, #9]
	ldrb r1, [r5, #0xb]
	adds r0, r1, r4
	ldrb r1, [r5, #0xa]
	bl __modsi3
	lsls r0, r0, #3
	ldr r1, _08008300 @ =0x030000C8
	adds r0, r0, r1
	lsls r4, r4, #1
	ldrb r1, [r5, #0xd]
	adds r4, r1, r4
	lsls r4, r4, #5
	ldrb r5, [r5, #0xc]
	adds r4, r5, r4
	lsls r4, r4, #1
	ldr r1, _08008304 @ =gBg0Tm
	adds r4, r4, r1
	adds r1, r4, #0
	bl PutText
	movs r0, #1
	bl TalkBgSync
	ldr r1, [r6]
	movs r0, #1
	strb r0, [r1, #0x15]
_080082E8:
	ldr r1, [r6]
	ldrb r0, [r1, #0x16]
	cmp r0, #0
	beq _080082F6
	ldrb r0, [r1, #0x11]
	bl SetTalkFaceMouthMove
_080082F6:
	movs r0, #0
_080082F8:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_08008300: .4byte 0x030000C8
_08008304: .4byte gBg0Tm
