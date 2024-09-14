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
