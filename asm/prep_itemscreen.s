	.include "macro.inc"
	.syntax unified

	thumb_func_start PrepItemScreen_OnHBlank
PrepItemScreen_OnHBlank: @ 0x08091C60
	ldr r0, _08091C88 @ =0x04000006
	ldrh r0, [r0]
	adds r0, #1
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	cmp r2, #0xa0
	bls 1f
	movs r2, #0
1:
	cmp r2, #0
	bne 2f
	ldr r1, _08091C8C @ =0x04000012
	movs r0, #0xf8
	strh r0, [r1]
2:
	cmp r2, #0x48
	bne 3f
	ldr r1, _08091C8C @ =0x04000012
	movs r0, #0xfc
	strh r0, [r1]
3:
	bx lr
	.align 2, 0
_08091C88: .4byte 0x04000006
_08091C8C: .4byte 0x04000012

	thumb_func_start PrepItemScreen_Init
PrepItemScreen_Init: @ 0x08091C90
	push {r4, lr}
	adds r4, r0, #0
	adds r2, r4, #0
	adds r2, #0x2a
	movs r0, #0xff
	ldrb r1, [r2]
	orrs r1, r0
	strb r1, [r2]
	adds r1, r4, #0
	adds r1, #0x2c
	ldrb r2, [r1]
	orrs r0, r2
	strb r0, [r1]
	adds r1, #1
	movs r0, #0
	strb r0, [r1]
	strh r0, [r4, #0x32]
	str r0, [r4, #0x44]
	str r0, [r4, #0x40]
	bl HasConvoyAccess_
	adds r1, r4, #0
	adds r1, #0x2b
	strb r0, [r1]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start PrepItemScreen_DrawFunds
PrepItemScreen_DrawFunds: @ 0x08091CC8
	push {r4, r5, lr}
	ldr r0, _08091D0C @ =0x02012A90
	ldr r4, _08091D10 @ =gBg0Tm + 0x466
	adds r1, r4, #0
	bl PutText
	adds r5, r4, #0
	adds r5, #0x12
	bl GetGold
	adds r2, r0, #0
	adds r0, r5, #0
	movs r1, #2
	bl PutNumber
	adds r4, #0x14
	adds r0, r4, #0
	movs r1, #3
	movs r2, #0x1e
	bl PutSpecialChar
	movs r0, #0
	movs r1, #0x88
	movs r2, #0x8b
	movs r3, #2
	bl EnableSysBrownBox
	movs r0, #1
	bl EnableBgSync
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08091D0C: .4byte 0x02012A90
_08091D10: .4byte gBg0Tm + 0x466

	thumb_func_start PrepItemScreen_HideFunds
PrepItemScreen_HideFunds: @ 0x08091D14
	push {lr}
	ldr r0, _08091D34 @ =gBg0Tm + 0x466
	movs r1, #0xa
	movs r2, #1
	movs r3, #0
	bl TmFillRect_thm
	movs r0, #0
	bl DisableSysBrownBox
	movs r0, #1
	bl EnableBgSync
	pop {r0}
	bx r0
	.align 2, 0
_08091D34: .4byte gBg0Tm + 0x466

	thumb_func_start PrepItemScreen_SetupGfx
PrepItemScreen_SetupGfx: @ 0x08091D38
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x34
	mov r8, r0
	add r1, sp, #8
	ldr r0, _080920EC @ =gUnk_0842CF3C
	ldm r0!, {r2, r3, r4}
	stm r1!, {r2, r3, r4}
	ldm r0!, {r2, r3, r4}
	stm r1!, {r2, r3, r4}
	ldm r0!, {r2, r3}
	stm r1!, {r2, r3}
	ldr r0, _080920F0 @ =gBgConfig_PrepScreen
	bl InitBgs
	ldr r4, _080920F4 @ =gDispIo
	movs r0, #8
	rsbs r0, r0, #0
	ldrb r1, [r4]
	ands r0, r1
	strb r0, [r4]
	add r0, sp, #8
	bl SetFaceConfig
	movs r0, #2
	rsbs r0, r0, #0
	ldrb r2, [r4, #1]
	ands r0, r2
	movs r1, #3
	rsbs r1, r1, #0
	ands r0, r1
	subs r1, #2
	ands r0, r1
	subs r1, #4
	ands r0, r1
	subs r1, #8
	ands r0, r1
	strb r0, [r4, #1]
	ldr r0, _080920F8 @ =0x06017800
	movs r1, #0
	bl SetupDebugFontForOBJ
	movs r1, #4
	rsbs r1, r1, #0
	adds r0, r1, #0
	ldrb r3, [r4, #0xc]
	ands r0, r3
	strb r0, [r4, #0xc]
	adds r0, r1, #0
	ldrb r2, [r4, #0x10]
	ands r0, r2
	movs r2, #2
	orrs r0, r2
	strb r0, [r4, #0x10]
	ldrb r3, [r4, #0x14]
	ands r1, r3
	strb r1, [r4, #0x14]
	movs r0, #3
	ldrb r1, [r4, #0x18]
	orrs r0, r1
	strb r0, [r4, #0x18]
	bl ResetText
	bl InitIcons
	movs r0, #4
	bl ApplyIconPalettes
	bl UnpackUiWindowFrameGraphics
	bl ApplySystemObjectsGraphics
	bl MakePrepUnitList
	bl PrepGetLatestCharId
	bl UnitGetIndexInPrepList
	mov r1, r8
	adds r1, #0x29
	movs r4, #0
	strb r0, [r1]
	mov r0, r8
	bl ResetSysHandCursor
	ldr r0, _080920FC @ =PrepItem_DrawSMS
	mov r1, r8
	bl StartParallelWorker
	mov r0, r8
	bl StartUiCursorHand
	movs r0, #0
	bl SetOnHBlankA
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
	ldr r0, _08092100 @ =gPal
	strh r4, [r0]
	bl EnablePalSync
	mov r2, sp
	adds r2, #0x28
	str r2, [sp, #0x2c]
	ldr r5, _08092104 @ =0x020129A8
	movs r4, #0xe
_08091E32:
	adds r0, r5, #0
	movs r1, #5
	bl InitText
	adds r5, #8
	subs r4, #1
	cmp r4, #0
	bge _08091E32
	movs r3, #0x2a
	add r3, r8
	mov sb, r3
	mov r4, r8
	adds r4, #0x2b
	str r4, [sp, #0x30]
	ldr r0, _08092108 @ =0x02012A20
	adds r6, r0, #0
	adds r6, #0x28
	adds r5, r0, #0
	movs r4, #4
_08091E58:
	adds r0, r5, #0
	movs r1, #7
	bl InitText
	adds r0, r6, #0
	movs r1, #7
	bl InitText
	adds r6, #8
	adds r5, #8
	subs r4, #1
	cmp r4, #0
	bge _08091E58
	ldr r4, _0809210C @ =0x02012A70
	adds r0, r4, #0
	movs r1, #8
	bl InitTextDb
	adds r0, r4, #0
	adds r0, #8
	movs r1, #8
	bl InitTextDb
	ldr r0, _08092110 @ =0x02012A80
	movs r1, #8
	bl InitText
	ldr r0, _08092114 @ =0x02012A90
	movs r1, #7
	bl InitText
	adds r0, r4, #0
	adds r0, #0x28
	movs r1, #5
	bl InitText
	ldr r0, _08092118 @ =0x06014000
	movs r1, #1
	rsbs r1, r1, #0
	bl LoadHelpBoxGfx
	ldr r7, _080920F4 @ =gDispIo
	movs r0, #0x3c
	adds r0, r0, r7
	mov sl, r0
	movs r1, #0x21
	rsbs r1, r1, #0
	adds r0, r1, #0
	mov r2, sl
	ldrb r2, [r2]
	ands r0, r2
	mov r3, sl
	strb r0, [r3]
	adds r0, r7, #0
	adds r0, #0x3d
	ldrb r4, [r0]
	ands r1, r4
	strb r1, [r0]
	ldr r0, _0809211C @ =0x0000FFE0
	ldrh r1, [r7, #0x3c]
	ands r0, r1
	ldr r2, _08092120 @ =0x0000E0FF
	ands r0, r2
	strh r0, [r7, #0x3c]
	movs r3, #0x36
	adds r3, r3, r7
	mov ip, r3
	movs r0, #0x20
	ldrb r2, [r3]
	orrs r2, r0
	ldrb r4, [r7, #1]
	orrs r0, r4
	movs r1, #0x41
	rsbs r1, r1, #0
	ands r0, r1
	movs r1, #0x7f
	ands r0, r1
	strb r0, [r7, #1]
	adds r0, r7, #0
	adds r0, #0x2d
	movs r1, #0
	strb r1, [r0]
	adds r1, r7, #0
	adds r1, #0x31
	movs r4, #4
	movs r0, #4
	strb r0, [r1]
	subs r1, #5
	movs r0, #0xf0
	strb r0, [r1]
	adds r1, #4
	movs r0, #0x44
	strb r0, [r1]
	adds r5, r7, #0
	adds r5, #0x34
	movs r6, #1
	ldrb r0, [r5]
	orrs r0, r6
	movs r3, #2
	orrs r0, r3
	orrs r0, r4
	movs r4, #8
	orrs r0, r4
	movs r1, #0x10
	orrs r0, r1
	strb r0, [r5]
	orrs r2, r6
	orrs r2, r3
	movs r0, #5
	rsbs r0, r0, #0
	ands r2, r0
	orrs r2, r4
	orrs r2, r1
	mov r3, ip
	strb r2, [r3]
	ldr r2, _08092124 @ =0x0000FFFC
	movs r0, #0
	movs r1, #4
	bl SetBgOffset
	movs r0, #1
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	ldr r1, _08092128 @ =0x0000FFD8
	mov r4, r8
	ldrh r2, [r4, #0x32]
	subs r2, #4
	movs r0, #0xff
	ands r2, r0
	movs r0, #2
	bl SetBgOffset
	movs r0, #7
	bl EnableBgSync
	bl ApplyUnitSpritePalettes
	movs r0, #0
	str r0, [sp, #0x28]
	ldr r1, _0809212C @ =gPal + 0x360
	ldr r2, _08092130 @ =0x01000008
	ldr r0, [sp, #0x2c]
	bl CpuFastSet
	bl ForceSyncUnitSpriteSheet
	ldr r0, _08092134 @ =Img_PrepTextShadow
	ldr r1, _08092138 @ =0x06013E00
	bl Decompress
	movs r0, #0x3c
	str r0, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #0
	movs r3, #0xd0
	bl UiCursorHand_80A9954
	movs r0, #0xc0
	lsls r0, r0, #3
	movs r1, #1
	bl DisplaySysHandCursorTextShadow
	bl PrepRestartMuralBackground
	mov r1, sb
	ldrb r0, [r1]
	cmp r0, #0xff
	beq _08091FF6
	adds r5, r0, #0
	movs r1, #3
	bl __umodsi3
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x12
	adds r4, #0x18
	adds r0, r5, #0
	movs r1, #3
	bl __udivsi3
	adds r2, r0, #0
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x14
	mov r3, r8
	ldrh r0, [r3, #0x32]
	subs r0, #4
	subs r2, r2, r0
	movs r0, #0
	adds r1, r4, #0
	movs r3, #2
	bl SetUiCursorHandConfig
	mov r4, sb
	ldrb r0, [r4]
	bl GetUnitFromPrepList
	adds r1, r0, #0
	ldr r0, _0809213C @ =0x00000503
	str r0, [sp]
	movs r0, #0
	movs r2, #0x44
	movs r3, #0x4e
	bl UpdatePrepItemScreenFace
_08091FF6:
	mov r0, r8
	bl StartMenuScrollBar
	movs r5, #0x80
	lsls r5, r5, #2
	adds r0, r5, #0
	movs r1, #4
	bl InitMenuScrollBarImg
	movs r0, #0xd8
	movs r1, #0xc
	bl PutMenuScrollBarAt
	mov r0, r8
	ldrh r4, [r0, #0x32]
	bl PrepGetUnitAmount
	subs r0, #1
	movs r1, #3
	bl __divsi3
	adds r2, r0, #0
	adds r2, #1
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	movs r0, #6
	adds r1, r4, #0
	movs r3, #4
	bl UpdateMenuScrollBarConfig
	bl TryHideMenuScrollBar
	bl PrepUpdateSMS
	movs r0, #0x3f
	mov r1, sl
	ldrb r1, [r1]
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	mov r2, sl
	strb r0, [r2]
	adds r0, r7, #0
	adds r0, #0x44
	movs r1, #8
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r0, #1
	movs r3, #0
	strb r3, [r0]
	ldr r0, _0809211C @ =0x0000FFE0
	ldrh r4, [r7, #0x3c]
	ands r0, r4
	movs r1, #2
	orrs r0, r1
	ldr r1, _08092120 @ =0x0000E0FF
	ands r0, r1
	orrs r0, r5
	strh r0, [r7, #0x3c]
	ldr r0, _08092140 @ =PrepItemScreen_OnHBlank
	bl SetOnHBlankA
	movs r1, #0xe0
	lsls r1, r1, #4
	movs r3, #0xc0
	lsls r3, r3, #4
	movs r0, #0x80
	lsls r0, r0, #3
	str r0, [sp]
	mov r2, r8
	str r2, [sp, #4]
	movs r0, #6
	movs r2, #8
	bl StartSysBrownBox
	movs r0, #0
	movs r1, #1
	bl SetSysBrownBoxWidth
	ldr r0, _08092114 @ =0x02012A90
	movs r1, #3
	bl Text_SetColor
	ldr r1, _08092144 @ =gUnk_0842CF5C
	ldr r0, _08092114 @ =0x02012A90
	bl Text_DrawString
	movs r1, #0
	ldr r3, [sp, #0x30]
	movs r0, #0
	ldrsb r0, [r3, r0]
	cmp r0, #0
	bne _080920B4
	movs r1, #1
_080920B4:
	ldr r0, _08092110 @ =0x02012A80
	bl Text_SetColor
	ldr r0, _08092110 @ =0x02012A80
	movs r1, #0
	bl Text_SetCursor
	ldr r1, _08092148 @ =gUnk_0842CF64
	ldr r0, _08092110 @ =0x02012A80
	bl Text_DrawString
	ldr r0, _08092110 @ =0x02012A80
	movs r1, #0x20
	bl Text_SetCursor
	ldr r1, _0809214C @ =gUnk_0842CF6C
	ldr r0, _08092110 @ =0x02012A80
	bl Text_DrawString
	add sp, #0x34
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080920EC: .4byte gUnk_0842CF3C
_080920F0: .4byte gBgConfig_PrepScreen
_080920F4: .4byte gDispIo
_080920F8: .4byte 0x06017800
_080920FC: .4byte PrepItem_DrawSMS
_08092100: .4byte gPal
_08092104: .4byte 0x020129A8
_08092108: .4byte 0x02012A20
_0809210C: .4byte 0x02012A70
_08092110: .4byte 0x02012A80
_08092114: .4byte 0x02012A90
_08092118: .4byte 0x06014000
_0809211C: .4byte 0x0000FFE0
_08092120: .4byte 0x0000E0FF
_08092124: .4byte 0x0000FFFC
_08092128: .4byte 0x0000FFD8
_0809212C: .4byte gPal + 0x360
_08092130: .4byte 0x01000008
_08092134: .4byte Img_PrepTextShadow
_08092138: .4byte 0x06013E00
_0809213C: .4byte 0x00000503
_08092140: .4byte PrepItemScreen_OnHBlank
_08092144: .4byte gUnk_0842CF5C
_08092148: .4byte gUnk_0842CF64
_0809214C: .4byte gUnk_0842CF6C

	thumb_func_start PrepItemScreen_OnEnd
PrepItemScreen_OnEnd: @ 0x08092150
	push {lr}
	adds r0, #0x29
	ldrb r0, [r0]
	bl GetUnitFromPrepList
	ldr r0, [r0]
	ldrb r0, [r0, #4]
	bl PrepSetLatestCharId
	bl EndAllParallelWorkers
	bl EndSysHandCursor
	bl EndUiCursorHand
	movs r0, #0
	bl EndPrepItemScreenFace
	movs r0, #1
	bl EndPrepItemScreenFace
	bl EndMuralBackground_
	bl EndHelpPromptSprite
	bl EndMenuScrollBar
	bl EndSysBrownBox
	movs r0, #0
	bl SetOnHBlankA
	pop {r0}
	bx r0

	thumb_func_start sub_8092194
sub_8092194: @ 0x08092194
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	sub sp, #8
	adds r5, r0, #0
	movs r1, #0xa
	movs r2, #6
	movs r3, #0
	bl TmFillRect_thm
	ldr r4, _080921F0 @ =0x02012A70
	adds r0, r4, #0
	bl ClearText
	movs r0, #8
	adds r0, r0, r4
	mov r8, r0
	bl ClearText
	adds r1, r5, #0
	adds r1, #0x42
	movs r6, #0
	str r6, [sp]
	ldr r0, _080921F4 @ =gUnk_0842CF74
	str r0, [sp, #4]
	adds r0, r4, #0
	movs r2, #0
	movs r3, #0
	bl PutDrawText
	adds r5, #0xc2
	str r6, [sp]
	ldr r0, _080921F8 @ =gUnk_0842CF84
	str r0, [sp, #4]
	mov r0, r8
	adds r1, r5, #0
	movs r2, #0
	movs r3, #0
	bl PutDrawText
	add sp, #8
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080921F0: .4byte 0x02012A70
_080921F4: .4byte gUnk_0842CF74
_080921F8: .4byte gUnk_0842CF84

	thumb_func_start sub_80921FC
sub_80921FC: @ 0x080921FC
	push {lr}
	sub sp, #4
	ldr r0, _08092218 @ =0x0000A580
	str r0, [sp]
	movs r0, #0x88
	movs r1, #0x58
	movs r2, #9
	movs r3, #4
	bl sub_80935C4
	add sp, #4
	pop {r0}
	bx r0
	.align 2, 0
_08092218: .4byte 0x0000A580

	thumb_func_start sub_809221C
sub_809221C: @ 0x0809221C
	push {lr}
	sub sp, #4
	ldr r0, _08092238 @ =0x0000A580
	str r0, [sp]
	movs r0, #8
	movs r1, #0x5c
	movs r2, #0xa
	movs r3, #5
	bl sub_80935C4
	add sp, #4
	pop {r0}
	bx r0
	.align 2, 0
_08092238: .4byte 0x0000A580

	thumb_func_start sub_809223C
sub_809223C: @ 0x0809223C
	push {lr}
	sub sp, #4
	ldr r0, _08092258 @ =0x0000A980
	str r0, [sp]
	movs r0, #0x82
	movs r1, #0x50
	movs r2, #8
	movs r3, #6
	bl sub_80935C4
	add sp, #4
	pop {r0}
	bx r0
	.align 2, 0
_08092258: .4byte 0x0000A980

	thumb_func_start sub_809225C
sub_809225C: @ 0x0809225C
	push {lr}
	ldr r0, _08092280 @ =sub_80921FC
	bl GetParallelWorker
	bl Proc_End
	ldr r0, _08092284 @ =sub_809221C
	bl GetParallelWorker
	bl Proc_End
	ldr r0, _08092288 @ =sub_809223C
	bl GetParallelWorker
	bl Proc_End
	pop {r0}
	bx r0
	.align 2, 0
_08092280: .4byte sub_80921FC
_08092284: .4byte sub_809221C
_08092288: .4byte sub_809223C

	thumb_func_start sub_809228C
sub_809228C: @ 0x0809228C
	push {r4, r5, r6, lr}
	sub sp, #0x10
	adds r2, r0, #0
	adds r4, r1, #0
	mov r1, sp
	ldr r0, _080922D0 @ =gUnk_0842CF94
	ldm r0!, {r3, r5, r6}
	stm r1!, {r3, r5, r6}
	ldr r0, [r0]
	str r0, [r1]
	ldr r0, _080922D4 @ =Img_PrepWindow
	movs r1, #0xc0
	lsls r1, r1, #0x13
	adds r2, r2, r1
	adds r1, r2, #0
	bl Decompress
	ldr r1, _080922D8 @ =gPlaySt
	adds r1, #0x41
	movs r0, #0xc
	ldrb r1, [r1]
	ands r0, r1
	add r0, sp
	ldr r0, [r0]
	lsls r4, r4, #5
	adds r1, r4, #0
	movs r2, #0xa0
	bl ApplyPaletteExt
	add sp, #0x10
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080922D0: .4byte gUnk_0842CF94
_080922D4: .4byte Img_PrepWindow
_080922D8: .4byte gPlaySt

	thumb_func_start sub_80922DC
sub_80922DC: @ 0x080922DC
	push {r4, lr}
	adds r2, r0, #0
	adds r4, r1, #0
	ldr r0, _08092304 @ =gUnk_084295B4
	ldr r1, _08092308 @ =0x06010000
	adds r2, r2, r1
	adds r1, r2, #0
	bl Decompress
	ldr r0, _0809230C @ =gUnk_08429638
	adds r4, #0x10
	lsls r4, r4, #5
	adds r1, r4, #0
	movs r2, #0x20
	bl ApplyPaletteExt
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08092304: .4byte gUnk_084295B4
_08092308: .4byte 0x06010000
_0809230C: .4byte gUnk_08429638

	thumb_func_start sub_8092310
sub_8092310: @ 0x08092310
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r6, r0, #0
	bl sub_80933F0
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
	movs r0, #0xc0
	lsls r0, r0, #7
	movs r1, #5
	bl sub_809228C
	movs r0, #0xc0
	lsls r0, r0, #6
	movs r1, #0xa
	bl sub_80922DC
	ldr r0, _08092408 @ =gBg1Tm
	ldr r1, _0809240C @ =gUnk_0842035C
	movs r2, #0xa6
	lsls r2, r2, #7
	bl TmApplyTsa_thm
	adds r7, r6, #0
	adds r7, #0x29
	ldrb r0, [r7]
	bl GetUnitFromPrepList
	adds r1, r0, #0
	ldr r0, _08092410 @ =0x00000503
	str r0, [sp]
	movs r0, #0
	movs r2, #0x44
	movs r3, #0x4e
	bl UpdatePrepItemScreenFace
	ldr r5, _08092414 @ =0x02012A20
	ldr r4, _08092418 @ =gBg0Tm + 0x244
	ldrb r0, [r7]
	bl GetUnitFromPrepList
	adds r2, r0, #0
	adds r0, r5, #0
	adds r1, r4, #0
	movs r3, #2
	bl sub_80932DC
	adds r4, #0x60
	adds r0, r4, #0
	bl sub_8092194
	adds r1, r6, #0
	adds r1, #0x31
	movs r0, #0
	strb r0, [r1]
	ldrb r5, [r7]
	adds r0, r5, #0
	movs r1, #3
	bl __umodsi3
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x12
	adds r4, #0x18
	adds r0, r5, #0
	movs r1, #3
	bl __udivsi3
	adds r1, r0, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x14
	ldrh r0, [r6, #0x32]
	subs r0, #4
	subs r1, r1, r0
	movs r3, #0x80
	lsls r3, r3, #4
	adds r0, r4, #0
	movs r2, #7
	bl ShowSysHandCursor
	adds r0, r6, #0
	movs r1, #0
	bl sub_80937E0
	bl UnblockUiCursorHand
	bl sub_80A99AC
	movs r0, #0xc9
	movs r1, #0x7b
	adds r2, r6, #0
	bl StartHelpPromptSprite
	bl sub_809225C
	ldr r0, _0809241C @ =sub_80921FC
	adds r1, r6, #0
	bl StartParallelWorker
	bl PrepItemScreen_DrawFunds
	movs r0, #7
	bl EnableBgSync
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08092408: .4byte gBg1Tm
_0809240C: .4byte gUnk_0842035C
_08092410: .4byte 0x00000503
_08092414: .4byte 0x02012A20
_08092418: .4byte gBg0Tm + 0x244
_0809241C: .4byte sub_80921FC

	thumb_func_start sub_8092420
sub_8092420: @ 0x08092420
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	mov r8, r0
	mov r2, r8
	adds r2, #0x29
	ldrb r7, [r2]
	ldr r0, _080924FC @ =gpKeySt
	ldr r1, [r0]
	ldrh r5, [r1, #6]
	mov r3, r8
	adds r3, #0x30
	movs r0, #4
	strb r0, [r3]
	movs r0, #0x80
	lsls r0, r0, #2
	ldrh r4, [r1, #4]
	ands r0, r4
	cmp r0, #0
	beq _0809244E
	ldrh r5, [r1, #4]
	movs r0, #8
	strb r0, [r3]
_0809244E:
	movs r0, #0x40
	ands r0, r5
	cmp r0, #0
	beq _08092460
	ldrb r0, [r2]
	subs r0, #3
	cmp r0, #0
	blt _08092460
	strb r0, [r2]
_08092460:
	movs r0, #0x80
	ands r0, r5
	mov r6, r8
	adds r6, #0x29
	cmp r0, #0
	beq _0809247E
	ldrb r4, [r6]
	adds r4, #3
	bl PrepGetUnitAmount
	cmp r4, r0
	bge _0809247E
	ldrb r0, [r6]
	adds r0, #3
	strb r0, [r6]
_0809247E:
	movs r0, #0x20
	ands r0, r5
	cmp r0, #0
	beq _0809249A
	ldrb r4, [r6]
	adds r0, r4, #0
	movs r1, #3
	bl __umodsi3
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0809249A
	subs r0, r4, #1
	strb r0, [r6]
_0809249A:
	movs r0, #0x10
	ands r5, r0
	cmp r5, #0
	beq _080924C4
	ldrb r4, [r6]
	adds r0, r4, #0
	movs r1, #3
	bl __umodsi3
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bhi _080924C4
	adds r4, #1
	bl PrepGetUnitAmount
	cmp r4, r0
	bge _080924C4
	ldrb r0, [r6]
	adds r0, #1
	strb r0, [r6]
_080924C4:
	ldrb r0, [r6]
	cmp r0, r7
	beq _08092570
	movs r1, #3
	bl __udivsi3
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x14
	bl PrepGetUnitAmount
	subs r0, #1
	movs r1, #3
	bl __divsi3
	lsls r2, r0, #4
	mov r0, r8
	ldrh r1, [r0, #0x32]
	subs r0, r4, r1
	cmp r0, #0x20
	ble _08092500
	adds r0, r1, #0
	adds r0, #0x30
	cmp r0, r2
	bge _08092500
	lsrs r1, r1, #4
	adds r1, #4
	b _08092514
	.align 2, 0
_080924FC: .4byte gpKeySt
_08092500:
	mov r1, r8
	ldrh r0, [r1, #0x32]
	subs r1, r4, r0
	adds r7, r0, #0
	cmp r1, #0xf
	bgt _08092522
	cmp r7, #0
	beq _08092522
	lsrs r1, r7, #4
	subs r1, #1
_08092514:
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	mov r0, r8
	movs r2, #0
	bl sub_8093478
	b _08092552
_08092522:
	ldrb r5, [r6]
	adds r0, r5, #0
	movs r1, #3
	bl __umodsi3
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x12
	adds r4, #0x18
	adds r0, r5, #0
	movs r1, #3
	bl __udivsi3
	adds r1, r0, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x14
	subs r0, r7, #4
	subs r1, r1, r0
	movs r3, #0x80
	lsls r3, r3, #4
	adds r0, r4, #0
	movs r2, #7
	bl ShowSysHandCursor
_08092552:
	ldr r0, _08092568 @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08092564
	ldr r0, _0809256C @ =0x00000385
	bl m4aSongNumStart
_08092564:
	movs r0, #1
	b _08092572
	.align 2, 0
_08092568: .4byte gPlaySt
_0809256C: .4byte 0x00000385
_08092570:
	movs r0, #0
_08092572:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	thumb_func_start sub_809257C
sub_809257C: @ 0x0809257C
	push {r4, r5, r6, r7, lr}
	adds r6, r0, #0
	adds r0, #0x29
	ldrb r0, [r0]
	movs r1, #3
	bl __udivsi3
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x14
	bl PrepGetUnitAmount
	subs r0, #1
	movs r1, #3
	bl __divsi3
	lsls r2, r0, #4
	ldrh r1, [r6, #0x32]
	subs r0, r7, r1
	cmp r0, #0x20
	ble _0809261C
	adds r0, r1, #0
	adds r0, #0x30
	cmp r0, r2
	bge _0809261C
	adds r0, r6, #0
	adds r0, #0x30
	ldrb r0, [r0]
	adds r2, r0, r1
	strh r2, [r6, #0x32]
	ldr r1, _080926A0 @ =0x0000FFD8
	subs r2, #4
	movs r0, #0xff
	ands r2, r0
	movs r0, #2
	bl SetBgOffset
	adds r1, r6, #0
	adds r1, #0x2a
	ldrb r0, [r1]
	cmp r0, #0xff
	beq _080925FC
	adds r5, r0, #0
	movs r1, #3
	bl __umodsi3
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x12
	adds r4, #0x18
	adds r0, r5, #0
	movs r1, #3
	bl __udivsi3
	adds r2, r0, #0
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x14
	ldrh r0, [r6, #0x32]
	subs r0, #4
	subs r2, r2, r0
	movs r0, #0
	adds r1, r4, #0
	movs r3, #2
	bl SetUiCursorHandConfig
_080925FC:
	ldrh r4, [r6, #0x32]
	bl PrepGetUnitAmount
	subs r0, #1
	movs r1, #3
	bl __divsi3
	adds r2, r0, #0
	adds r2, #1
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	movs r0, #6
	adds r1, r4, #0
	movs r3, #4
	bl UpdateMenuScrollBarConfig
_0809261C:
	ldrh r2, [r6, #0x32]
	subs r0, r7, r2
	cmp r0, #0xf
	bgt _08092698
	cmp r2, #0
	beq _08092698
	adds r0, r6, #0
	adds r0, #0x30
	ldrb r0, [r0]
	subs r2, r2, r0
	strh r2, [r6, #0x32]
	ldr r1, _080926A0 @ =0x0000FFD8
	subs r2, #4
	movs r0, #0xff
	ands r2, r0
	movs r0, #2
	bl SetBgOffset
	adds r1, r6, #0
	adds r1, #0x2a
	ldrb r0, [r1]
	cmp r0, #0xff
	beq _08092678
	adds r5, r0, #0
	movs r1, #3
	bl __umodsi3
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x12
	adds r4, #0x18
	adds r0, r5, #0
	movs r1, #3
	bl __udivsi3
	adds r2, r0, #0
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x14
	ldrh r0, [r6, #0x32]
	subs r0, #4
	subs r2, r2, r0
	movs r0, #0
	adds r1, r4, #0
	movs r3, #2
	bl SetUiCursorHandConfig
_08092678:
	ldrh r4, [r6, #0x32]
	bl PrepGetUnitAmount
	subs r0, #1
	movs r1, #3
	bl __divsi3
	adds r2, r0, #0
	adds r2, #1
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	movs r0, #6
	adds r1, r4, #0
	movs r3, #4
	bl UpdateMenuScrollBarConfig
_08092698:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080926A0: .4byte 0x0000FFD8

	thumb_func_start sub_80926A4
sub_80926A4: @ 0x080926A4
	push {r4, lr}
	adds r4, r0, #0
	bl PrepItemScreen_OnEnd
	movs r0, #0x31
	bl SetStatScreenExcludedUnitFlags
	adds r0, r4, #0
	adds r0, #0x29
	ldrb r0, [r0]
	bl GetUnitFromPrepList
	adds r1, r4, #0
	bl StartStatScreen
	adds r0, r4, #0
	bl Proc_Break
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_80926D0
sub_80926D0: @ 0x080926D0
	push {r4, lr}
	adds r4, r0, #0
	bl PrepItemScreen_SetupGfx
	bl GetLatestUnitIndexInPrepListByUId
	adds r1, r4, #0
	adds r1, #0x29
	strb r0, [r1]
	adds r0, r4, #0
	bl sub_80933F0
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_80926F0
sub_80926F0: @ 0x080926F0
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r6, r0, #0
	movs r0, #0xf
	ldrh r1, [r6, #0x32]
	ands r0, r1
	cmp r0, #0
	beq _08092702
	b _0809281E
_08092702:
	ldr r0, _0809271C @ =gpKeySt
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r1
	cmp r0, #0
	beq _08092720
	adds r0, r6, #0
	bl Proc_Break
	b _08092824
	.align 2, 0
_0809271C: .4byte gpKeySt
_08092720:
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _080927B0
	adds r4, r6, #0
	adds r4, #0x29
	ldrb r0, [r4]
	adds r5, r6, #0
	adds r5, #0x2a
	strb r0, [r5]
	ldrb r7, [r4]
	adds r0, r7, #0
	movs r1, #3
	bl __umodsi3
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bhi _08092756
	bl PrepGetUnitAmount
	subs r0, #1
	cmp r7, r0
	bge _08092756
	ldrb r0, [r4]
	adds r0, #1
	b _0809275A
_08092756:
	ldrb r0, [r4]
	subs r0, #1
_0809275A:
	strb r0, [r4]
	ldrb r5, [r5]
	adds r0, r5, #0
	movs r1, #3
	bl __umodsi3
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x12
	adds r4, #0x18
	adds r0, r5, #0
	movs r1, #3
	bl __udivsi3
	adds r2, r0, #0
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x14
	ldrh r0, [r6, #0x32]
	subs r0, #4
	subs r2, r2, r0
	movs r0, #0
	adds r1, r4, #0
	movs r3, #2
	bl SetUiCursorHandConfig
	adds r0, r6, #0
	movs r1, #2
	bl Proc_Goto
	ldr r0, _080927A8 @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08092824
	ldr r0, _080927AC @ =0x0000038A
	bl m4aSongNumStart
	b _08092824
	.align 2, 0
_080927A8: .4byte gPlaySt
_080927AC: .4byte 0x0000038A
_080927B0:
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _080927DC
	adds r0, r6, #0
	movs r1, #0xc
	bl Proc_Goto
	ldr r0, _080927D4 @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08092824
	ldr r0, _080927D8 @ =0x0000038B
	bl m4aSongNumStart
	b _08092824
	.align 2, 0
_080927D4: .4byte gPlaySt
_080927D8: .4byte 0x0000038B
_080927DC:
	adds r0, r6, #0
	bl sub_8092420
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0809281E
	adds r7, r6, #0
	adds r7, #0x29
	ldrb r0, [r7]
	bl GetUnitFromPrepList
	adds r1, r0, #0
	ldr r0, _0809282C @ =0x00000503
	str r0, [sp]
	movs r0, #0
	movs r2, #0x44
	movs r3, #0x4e
	bl UpdatePrepItemScreenFace
	ldr r4, _08092830 @ =0x02012A20
	ldr r5, _08092834 @ =gBg0Tm + 0x244
	ldrb r0, [r7]
	bl GetUnitFromPrepList
	adds r2, r0, #0
	adds r0, r4, #0
	adds r1, r5, #0
	movs r3, #2
	bl sub_80932DC
	movs r0, #1
	bl EnableBgSync
_0809281E:
	adds r0, r6, #0
	bl sub_809257C
_08092824:
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0809282C: .4byte 0x00000503
_08092830: .4byte 0x02012A20
_08092834: .4byte gBg0Tm + 0x244

	thumb_func_start sub_8092838
sub_8092838: @ 0x08092838
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	mov r8, r0
	adds r5, r1, #0
	adds r7, r2, #0
	adds r0, r5, #0
	movs r1, #0xa
	movs r2, #6
	movs r3, #0
	bl TmFillRect_thm
	ldr r4, _08092908 @ =0x02012A70
	adds r0, r4, #0
	bl ClearText
	adds r6, r4, #0
	adds r6, #8
	adds r0, r6, #0
	bl ClearText
	bl PrepGetUnitAmount
	movs r2, #0
	cmp r0, #1
	bgt _0809286E
	movs r2, #1
_0809286E:
	ldr r3, _0809290C @ =gUnk_0842CFA4
	adds r0, r4, #0
	movs r1, #0
	bl Text_InsertDrawString
	bl PrepGetUnitAmount
	movs r2, #0
	cmp r0, #1
	bgt _08092884
	movs r2, #1
_08092884:
	ldr r3, _08092910 @ =gUnk_0842CFAC
	adds r0, r4, #0
	movs r1, #0x20
	bl Text_InsertDrawString
	adds r1, r5, #0
	adds r1, #0x40
	adds r0, r4, #0
	bl PutText
	adds r0, r7, #0
	bl CanUnitPrepScreenUse
	movs r2, #0
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080928A8
	movs r2, #1
_080928A8:
	ldr r3, _08092914 @ =gUnk_0842CFB4
	adds r0, r6, #0
	movs r1, #0
	bl Text_InsertDrawString
	movs r4, #0
	mov r0, r8
	adds r0, #0x2b
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _080928D4
	adds r0, r7, #0
	bl GetUnitItemCount
	cmp r0, #0
	ble _080928D4
	bl CheckInLinkArena
	cmp r0, #0
	beq _080928D6
_080928D4:
	movs r4, #1
_080928D6:
	ldr r3, _08092918 @ =gUnk_0842CFBC
	adds r0, r6, #0
	movs r1, #0x20
	adds r2, r4, #0
	bl Text_InsertDrawString
	ldr r4, _0809291C @ =0x02012A78
	adds r1, r5, #0
	adds r1, #0xc0
	adds r0, r4, #0
	bl PutText
	adds r4, #8
	movs r0, #0xa0
	lsls r0, r0, #1
	adds r1, r5, r0
	adds r0, r4, #0
	bl PutText
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08092908: .4byte 0x02012A70
_0809290C: .4byte gUnk_0842CFA4
_08092910: .4byte gUnk_0842CFAC
_08092914: .4byte gUnk_0842CFB4
_08092918: .4byte gUnk_0842CFBC
_0809291C: .4byte 0x02012A78

	thumb_func_start sub_8092920
sub_8092920: @ 0x08092920
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #8
	adds r5, r0, #0
	adds r0, #0x2a
	ldrb r0, [r0]
	bl GetUnitFromPrepList
	mov r8, r0
	adds r1, r5, #0
	adds r1, #0x31
	movs r0, #1
	strb r0, [r1]
	ldr r0, _08092A08 @ =gBg1Tm
	ldr r1, _08092A0C @ =gUnk_08420810
	movs r2, #0xa6
	lsls r2, r2, #7
	bl TmApplyTsa_thm
	movs r4, #0
_0809294A:
	ldrh r1, [r5, #0x32]
	lsrs r0, r1, #3
	adds r0, r0, r4
	movs r1, #0x1f
	ands r0, r1
	adds r0, #4
	lsls r0, r0, #6
	ldr r1, _08092A10 @ =gBg2Tm
	adds r0, r0, r1
	movs r1, #9
	movs r2, #0
	movs r3, #0
	bl TmFillRect_thm
	adds r4, #1
	cmp r4, #7
	ble _0809294A
	mov r0, r8
	bl GetUnitPortraitId
	ldr r7, _08092A14 @ =gBg0Tm + 0x106
	movs r2, #0x9c
	lsls r2, r2, #2
	movs r6, #0
	str r6, [sp]
	adds r1, r7, #0
	movs r3, #2
	bl PutFaceChibi
	ldr r5, _08092A18 @ =0x02012A98
	adds r0, r5, #0
	bl ClearText
	mov r1, r8
	ldr r0, [r1]
	ldrh r0, [r0]
	bl DecodeMsg
	adds r4, r0, #0
	movs r0, #0x28
	adds r1, r4, #0
	bl GetStringTextCenteredPos
	adds r3, r0, #0
	adds r1, r7, #0
	adds r1, #0xa
	str r6, [sp]
	str r4, [sp, #4]
	adds r0, r5, #0
	movs r2, #0
	bl PutDrawText
	adds r0, r7, #0
	adds r0, #0x8a
	movs r1, #3
	movs r2, #0x24
	bl PutSpecialChar
	adds r0, r7, #0
	adds r0, #0x8c
	movs r1, #3
	movs r2, #0x25
	bl PutSpecialChar
	adds r0, r7, #0
	adds r0, #0x92
	movs r1, #3
	movs r2, #0x1d
	bl PutSpecialChar
	adds r0, r7, #0
	adds r0, #0x90
	mov r1, r8
	movs r2, #8
	ldrsb r2, [r1, r2]
	movs r1, #2
	bl PutNumberOrBlank
	adds r0, r7, #0
	adds r0, #0x96
	mov r1, r8
	ldrb r2, [r1, #9]
	movs r1, #2
	bl PutNumberOrBlank
	movs r0, #7
	bl EnableBgSync
	add sp, #8
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08092A08: .4byte gBg1Tm
_08092A0C: .4byte gUnk_08420810
_08092A10: .4byte gBg2Tm
_08092A14: .4byte gBg0Tm + 0x106
_08092A18: .4byte 0x02012A98

	thumb_func_start sub_8092A1C
sub_8092A1C: @ 0x08092A1C
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	ldr r0, _08092A84 @ =gBg0Tm + 0x25e
	movs r1, #0xc
	movs r2, #0x14
	movs r3, #0
	bl TmFillRect_thm
	movs r0, #0xc0
	lsls r0, r0, #7
	movs r1, #5
	bl sub_809228C
	movs r0, #0xc0
	lsls r0, r0, #6
	movs r1, #0xa
	bl sub_80922DC
	adds r0, r6, #0
	bl sub_8092920
	adds r0, r6, #0
	adds r0, #0x2a
	ldrb r5, [r0]
	adds r0, r5, #0
	movs r1, #3
	bl __umodsi3
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x12
	adds r4, #0x14
	adds r0, r5, #0
	movs r1, #3
	bl __udivsi3
	adds r1, r0, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x14
	ldrh r0, [r6, #0x32]
	subs r0, #4
	subs r1, r1, r0
	adds r0, r4, #0
	bl sub_8093540
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08092A88
	bl sub_80A99D0
	b _08092A8C
	.align 2, 0
_08092A84: .4byte gBg0Tm + 0x25e
_08092A88:
	bl UnblockUiCursorHand
_08092A8C:
	bl sub_809225C
	movs r0, #1
	bl EnableBgSync
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	thumb_func_start sub_8092A9C
sub_8092A9C: @ 0x08092A9C
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r5, _08092AF0 @ =gBg0Tm + 0x264
	adds r0, #0x2a
	ldrb r0, [r0]
	bl GetUnitFromPrepList
	adds r2, r0, #0
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_8092838
	ldr r0, _08092AF4 @ =sub_809223C
	adds r1, r4, #0
	bl StartParallelWorker
	movs r0, #0xc9
	movs r1, #0x7b
	adds r2, r4, #0
	bl StartHelpPromptSprite
	adds r4, #0x2d
	ldrb r1, [r4]
	movs r0, #1
	ands r0, r1
	lsls r0, r0, #5
	adds r0, #0x88
	lsrs r1, r1, #1
	lsls r1, r1, #4
	adds r1, #0x54
	movs r3, #0x80
	lsls r3, r3, #3
	movs r2, #3
	bl ShowSysHandCursor
	movs r0, #1
	bl EnableBgSync
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08092AF0: .4byte gBg0Tm + 0x264
_08092AF4: .4byte sub_809223C

	thumb_func_start sub_8092AF8
sub_8092AF8: @ 0x08092AF8
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r0, #0x2a
	ldrb r0, [r0]
	bl GetUnitFromPrepList
	adds r5, r0, #0
	adds r0, r4, #0
	movs r1, #0
	bl sub_80937E0
	ldr r0, _08092B28 @ =0x02012A20
	ldr r1, _08092B2C @ =gBg0Tm + 0x244
	adds r2, r5, #0
	movs r3, #0
	bl sub_80932DC
	movs r0, #4
	bl EnableBgSync
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08092B28: .4byte 0x02012A20
_08092B2C: .4byte gBg0Tm + 0x244

	thumb_func_start sub_8092B30
sub_8092B30: @ 0x08092B30
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	adds r2, r5, #0
	adds r2, #0x2d
	ldrb r7, [r2]
	adds r4, r5, #0
	adds r4, #0x2c
	ldrb r0, [r4]
	cmp r0, #0xff
	beq _08092B46
	b _08092D50
_08092B46:
	ldr r0, _08092B78 @ =gpKeySt
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r1
	cmp r0, #0
	beq _08092B80
	strb r7, [r4]
	ldrb r1, [r2]
	movs r0, #1
	ands r0, r1
	lsls r0, r0, #5
	adds r0, #0x88
	lsrs r1, r1, #1
	lsls r1, r1, #4
	adds r1, #0x54
	ldr r3, _08092B7C @ =gUnk_08D8C9A8
	ldrb r2, [r2]
	lsls r2, r2, #2
	adds r2, r2, r3
	ldr r2, [r2]
	bl StartHelpBox
	b _08092E70
	.align 2, 0
_08092B78: .4byte gpKeySt
_08092B7C: .4byte gUnk_08D8C9A8
_08092B80:
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	bne _08092B8A
	b _08092D0C
_08092B8A:
	cmp r7, #5
	bls _08092B90
	b _08092CF0
_08092B90:
	lsls r0, r7, #2
	ldr r1, _08092B9C @ =_08092BA0
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08092B9C: .4byte _08092BA0
_08092BA0: @ jump table
	.4byte _08092BB8 @ case 0
	.4byte _08092BCC @ case 1
	.4byte _08092BE0 @ case 2
	.4byte _08092C00 @ case 3
	.4byte _08092C32 @ case 4
	.4byte _08092C4A @ case 5
_08092BB8:
	bl PrepGetUnitAmount
	cmp r0, #1
	bgt _08092BC2
	b _08092CF0
_08092BC2:
	adds r0, r5, #0
	movs r1, #4
	bl Proc_Goto
	b _08092CC8
_08092BCC:
	bl PrepGetUnitAmount
	cmp r0, #1
	bgt _08092BD6
	b _08092CF0
_08092BD6:
	adds r0, r5, #0
	movs r1, #8
	bl Proc_Goto
	b _08092CC8
_08092BE0:
	adds r0, r5, #0
	adds r0, #0x2a
	ldrb r0, [r0]
	bl GetUnitFromPrepList
	bl CanUnitPrepScreenUse
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08092BF6
	b _08092CF0
_08092BF6:
	adds r0, r5, #0
	movs r1, #9
	bl Proc_Goto
	b _08092CC8
_08092C00:
	adds r0, r5, #0
	adds r0, #0x2b
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _08092CF0
	adds r0, r5, #0
	adds r0, #0x2a
	ldrb r0, [r0]
	bl GetUnitFromPrepList
	bl GetUnitItemCount
	cmp r0, #0
	ble _08092CF0
	bl CheckInLinkArena
	cmp r0, #0
	bne _08092CF0
	adds r0, r5, #0
	movs r1, #0xb
	bl Proc_Goto
	b _08092CC8
_08092C32:
	adds r0, r5, #0
	adds r0, #0x2b
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _08092CF0
	adds r0, r5, #0
	movs r1, #0xa
	bl Proc_Goto
	b _08092CC8
_08092C4A:
	bl CheckInLinkArena
	cmp r0, #0
	beq _08092C78
	adds r0, r5, #0
	adds r0, #0x2a
	ldrb r0, [r0]
	bl GetUnitFromPrepList
	ldr r0, [r0, #0xc]
	movs r1, #8
	ands r0, r1
	cmp r0, #0
	bne _08092C78
	subs r1, #9
	ldr r2, _08092C74 @ =0x000003B3
	adds r0, r1, #0
	adds r3, r5, #0
	bl StartPrepErrorHelpbox
	b _08092E70
	.align 2, 0
_08092C74: .4byte 0x000003B3
_08092C78:
	adds r0, r5, #0
	adds r0, #0x2b
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _08092CF0
	adds r6, r5, #0
	adds r6, #0x2a
	ldrb r0, [r6]
	bl GetUnitFromPrepList
	bl PrepItemScreen_GiveAll
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08092CF0
	ldr r4, _08092CE0 @ =gBg0Tm + 0x264
	ldrb r0, [r6]
	bl GetUnitFromPrepList
	adds r2, r0, #0
	adds r0, r5, #0
	adds r1, r4, #0
	bl sub_8092838
	ldr r5, _08092CE4 @ =0x02012A20
	subs r4, #0x20
	ldrb r0, [r6]
	bl GetUnitFromPrepList
	adds r2, r0, #0
	adds r0, r5, #0
	adds r1, r4, #0
	movs r3, #0
	bl sub_80932DC
	movs r0, #1
	bl EnableBgSync
_08092CC8:
	ldr r0, _08092CE8 @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	bge _08092CD6
	b _08092E70
_08092CD6:
	ldr r0, _08092CEC @ =0x0000038A
	bl m4aSongNumStart
	b _08092E70
	.align 2, 0
_08092CE0: .4byte gBg0Tm + 0x264
_08092CE4: .4byte 0x02012A20
_08092CE8: .4byte gPlaySt
_08092CEC: .4byte 0x0000038A
_08092CF0:
	ldr r0, _08092D08 @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	bge _08092CFE
	b _08092E70
_08092CFE:
	movs r0, #0xe3
	lsls r0, r0, #2
	bl m4aSongNumStart
	b _08092E70
	.align 2, 0
_08092D08: .4byte gPlaySt
_08092D0C:
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _08092D68
	adds r2, r5, #0
	adds r2, #0x2a
	ldrb r0, [r2]
	adds r1, r5, #0
	adds r1, #0x29
	strb r0, [r1]
	movs r0, #0xff
	strb r0, [r2]
	movs r0, #0
	bl sub_80A998C
	ldr r0, _08092D48 @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08092D3C
	ldr r0, _08092D4C @ =0x0000038B
	bl m4aSongNumStart
_08092D3C:
	adds r0, r5, #0
	movs r1, #0
	bl Proc_Goto
	b _08092E70
	.align 2, 0
_08092D48: .4byte gPlaySt
_08092D4C: .4byte 0x0000038B
_08092D50:
	ldr r0, _08092D8C @ =gpKeySt
	ldr r1, [r0]
	movs r0, #0x81
	lsls r0, r0, #1
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _08092D68
	bl CloseHelpBox
	movs r0, #0xff
	strb r0, [r4]
_08092D68:
	ldr r1, _08092D8C @ =gpKeySt
	ldr r3, [r1]
	movs r6, #0x20
	adds r0, r6, #0
	ldrh r2, [r3, #6]
	ands r0, r2
	adds r4, r5, #0
	adds r4, #0x2d
	cmp r0, #0
	beq _08092D9E
	ldrb r2, [r4]
	movs r0, #1
	ands r0, r2
	cmp r0, #0
	beq _08092D90
	subs r0, r2, #1
	b _08092D9C
	.align 2, 0
_08092D8C: .4byte gpKeySt
_08092D90:
	adds r0, r6, #0
	ldrh r3, [r3, #8]
	ands r0, r3
	cmp r0, #0
	beq _08092D9E
	adds r0, r2, #1
_08092D9C:
	strb r0, [r4]
_08092D9E:
	ldr r3, [r1]
	movs r6, #0x10
	adds r0, r6, #0
	ldrh r2, [r3, #6]
	ands r0, r2
	cmp r0, #0
	beq _08092DC8
	ldrb r2, [r4]
	movs r0, #1
	ands r0, r2
	cmp r0, #0
	bne _08092DBA
	adds r0, r2, #1
	b _08092DC6
_08092DBA:
	adds r0, r6, #0
	ldrh r3, [r3, #8]
	ands r0, r3
	cmp r0, #0
	beq _08092DC8
	subs r0, r2, #1
_08092DC6:
	strb r0, [r4]
_08092DC8:
	ldr r3, [r1]
	movs r6, #0x40
	adds r0, r6, #0
	ldrh r2, [r3, #6]
	ands r0, r2
	cmp r0, #0
	beq _08092DEE
	ldrb r2, [r4]
	cmp r2, #1
	bls _08092DE0
	subs r0, r2, #2
	b _08092DEC
_08092DE0:
	adds r0, r6, #0
	ldrh r3, [r3, #8]
	ands r0, r3
	cmp r0, #0
	beq _08092DEE
	adds r0, r2, #4
_08092DEC:
	strb r0, [r4]
_08092DEE:
	ldr r1, [r1]
	movs r3, #0x80
	adds r0, r3, #0
	ldrh r2, [r1, #6]
	ands r0, r2
	cmp r0, #0
	beq _08092E14
	ldrb r2, [r4]
	cmp r2, #3
	bhi _08092E06
	adds r0, r2, #2
	b _08092E12
_08092E06:
	adds r0, r3, #0
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _08092E14
	subs r0, r2, #4
_08092E12:
	strb r0, [r4]
_08092E14:
	ldrb r0, [r4]
	cmp r7, r0
	beq _08092E70
	ldr r0, _08092E78 @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08092E2C
	ldr r0, _08092E7C @ =0x00000385
	bl m4aSongNumStart
_08092E2C:
	ldrb r1, [r4]
	movs r6, #1
	adds r0, r6, #0
	ands r0, r1
	lsls r0, r0, #5
	adds r0, #0x88
	lsrs r1, r1, #1
	lsls r1, r1, #4
	adds r1, #0x54
	movs r3, #0x80
	lsls r3, r3, #3
	movs r2, #3
	bl ShowSysHandCursor
	adds r0, r5, #0
	adds r0, #0x2c
	ldrb r0, [r0]
	cmp r0, #0xff
	beq _08092E70
	ldrb r1, [r4]
	adds r0, r6, #0
	ands r0, r1
	lsls r0, r0, #5
	adds r0, #0x88
	lsrs r1, r1, #1
	lsls r1, r1, #4
	adds r1, #0x54
	ldr r3, _08092E80 @ =gUnk_08D8C9A8
	ldrb r4, [r4]
	lsls r2, r4, #2
	adds r2, r2, r3
	ldr r2, [r2]
	bl StartHelpBox
_08092E70:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08092E78: .4byte gPlaySt
_08092E7C: .4byte 0x00000385
_08092E80: .4byte gUnk_08D8C9A8

	thumb_func_start sub_8092E84
sub_8092E84: @ 0x08092E84
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	movs r0, #0
	bl GetBgTilemap
	movs r1, #0
	bl TmFill
	ldr r4, _08092ED4 @ =0x02012A20
	ldr r5, _08092ED8 @ =gBg0Tm + 0x244
	adds r0, r6, #0
	adds r0, #0x2a
	ldrb r0, [r0]
	bl GetUnitFromPrepList
	adds r2, r0, #0
	adds r0, r4, #0
	adds r1, r5, #0
	movs r3, #0
	bl sub_80932DC
	adds r4, #0x28
	adds r5, #0x1a
	adds r6, #0x29
	ldrb r0, [r6]
	bl GetUnitFromPrepList
	adds r2, r0, #0
	adds r0, r4, #0
	adds r1, r5, #0
	movs r3, #0
	bl sub_80932DC
	movs r0, #1
	bl EnableBgSync
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08092ED4: .4byte 0x02012A20
_08092ED8: .4byte gBg0Tm + 0x244

	thumb_func_start sub_8092EDC
sub_8092EDC: @ 0x08092EDC
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r6, r0, #0
	movs r0, #1
	bl GetBgTilemap
	movs r1, #0
	bl TmFill
	movs r0, #2
	bl GetBgTilemap
	movs r1, #0
	bl TmFill
	ldr r0, _08092FEC @ =gBg0Tm
	movs r1, #0x1f
	movs r2, #8
	movs r3, #0
	bl TmFillRect_thm
	movs r0, #0xc0
	lsls r0, r0, #7
	movs r1, #5
	bl sub_809228C
	movs r0, #0xc0
	lsls r0, r0, #6
	movs r1, #0xa
	bl sub_80922DC
	ldr r0, _08092FF0 @ =gBg1Tm
	ldr r1, _08092FF4 @ =gUnk_08420CC4
	movs r2, #0xa6
	lsls r2, r2, #7
	bl TmApplyTsa_thm
	adds r1, r6, #0
	adds r1, #0x31
	movs r0, #0
	strb r0, [r1]
	adds r7, r6, #0
	adds r7, #0x29
	ldrb r5, [r7]
	adds r0, r5, #0
	movs r1, #3
	bl __umodsi3
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x12
	adds r4, #0x18
	adds r0, r5, #0
	movs r1, #3
	bl __udivsi3
	adds r1, r0, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x14
	ldrh r0, [r6, #0x32]
	subs r0, #4
	subs r1, r1, r0
	movs r3, #0x80
	lsls r3, r3, #4
	adds r0, r4, #0
	movs r2, #7
	bl ShowSysHandCursor
	adds r0, r6, #0
	movs r1, #0
	bl sub_80937E0
	movs r0, #7
	bl EnableBgSync
	adds r4, r6, #0
	adds r4, #0x2a
	ldrb r0, [r4]
	bl GetUnitFromPrepList
	adds r1, r0, #0
	ldr r0, _08092FF8 @ =0x00000503
	str r0, [sp]
	movs r0, #0
	movs r2, #0x44
	movs r3, #0x4e
	bl UpdatePrepItemScreenFace
	ldrb r0, [r7]
	bl GetUnitFromPrepList
	adds r1, r0, #0
	ldr r0, _08092FFC @ =0x00000502
	str r0, [sp]
	movs r0, #1
	movs r2, #0xac
	movs r3, #0x4e
	bl UpdatePrepItemScreenFace
	ldrb r5, [r4]
	adds r0, r5, #0
	movs r1, #3
	bl __umodsi3
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x12
	adds r4, #0x18
	adds r0, r5, #0
	movs r1, #3
	bl __udivsi3
	adds r2, r0, #0
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x14
	ldrh r0, [r6, #0x32]
	subs r0, #4
	subs r2, r2, r0
	movs r0, #0
	adds r1, r4, #0
	movs r3, #2
	bl SetUiCursorHandConfig
	ldr r0, _08093000 @ =sub_8092E84
	movs r1, #1
	adds r2, r6, #0
	bl StartParallelFiniteLoop
	bl UnblockUiCursorHand
	bl EndHelpPromptSprite
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08092FEC: .4byte gBg0Tm
_08092FF0: .4byte gBg1Tm
_08092FF4: .4byte gUnk_08420CC4
_08092FF8: .4byte 0x00000503
_08092FFC: .4byte 0x00000502
_08093000: .4byte sub_8092E84

	thumb_func_start sub_8093004
sub_8093004: @ 0x08093004
	push {lr}
	bl sub_809225C
	movs r0, #1
	bl EnableBgSync
	pop {r0}
	bx r0

	thumb_func_start sub_8093014
sub_8093014: @ 0x08093014
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r6, r0, #0
	movs r0, #0xf
	ldrh r1, [r6, #0x32]
	ands r0, r1
	cmp r0, #0
	beq _08093026
	b _0809314C
_08093026:
	ldr r0, _08093040 @ =gpKeySt
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r1
	cmp r0, #0
	beq _08093044
	adds r0, r6, #0
	bl Proc_Break
	b _08093152
	.align 2, 0
_08093040: .4byte gpKeySt
_08093044:
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _080930BC
	adds r5, r6, #0
	adds r5, #0x29
	ldrb r0, [r5]
	bl GetUnitFromPrepList
	bl GetUnitItemCount
	adds r7, r0, #0
	adds r4, r6, #0
	adds r4, #0x2a
	ldrb r0, [r4]
	bl GetUnitFromPrepList
	bl GetUnitItemCount
	ldrb r5, [r5]
	ldrb r4, [r4]
	cmp r5, r4
	beq _080930A0
	cmp r7, #0
	bgt _0809307A
	cmp r0, #0
	ble _080930A0
_0809307A:
	adds r0, r6, #0
	movs r1, #6
	bl Proc_Goto
	ldr r0, _08093098 @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08093152
	ldr r0, _0809309C @ =0x0000038A
	bl m4aSongNumStart
	b _08093152
	.align 2, 0
_08093098: .4byte gPlaySt
_0809309C: .4byte 0x0000038A
_080930A0:
	ldr r0, _080930B8 @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08093152
	movs r0, #0xe3
	lsls r0, r0, #2
	bl m4aSongNumStart
	b _08093152
	.align 2, 0
_080930B8: .4byte gPlaySt
_080930BC:
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _080930F0
	movs r0, #1
	bl EndPrepItemScreenFace
	adds r0, r6, #0
	movs r1, #2
	bl Proc_Goto
	ldr r0, _080930E8 @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08093152
	ldr r0, _080930EC @ =0x0000038B
	bl m4aSongNumStart
	b _08093152
	.align 2, 0
_080930E8: .4byte gPlaySt
_080930EC: .4byte 0x0000038B
_080930F0:
	adds r0, r6, #0
	bl sub_8092420
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0809314C
	adds r7, r6, #0
	adds r7, #0x29
	ldrb r0, [r7]
	bl GetUnitFromPrepList
	adds r1, r0, #0
	ldr r0, _0809315C @ =0x00000502
	str r0, [sp]
	movs r0, #1
	movs r2, #0xac
	movs r3, #0x4e
	bl UpdatePrepItemScreenFace
	ldr r4, _08093160 @ =0x02012A48
	ldr r5, _08093164 @ =gBg0Tm + 0x25e
	ldrb r0, [r7]
	bl GetUnitFromPrepList
	adds r2, r0, #0
	adds r0, r4, #0
	adds r1, r5, #0
	movs r3, #2
	bl sub_80932DC
	subs r4, #0x28
	subs r5, #0x1a
	adds r0, r6, #0
	adds r0, #0x2a
	ldrb r0, [r0]
	bl GetUnitFromPrepList
	adds r2, r0, #0
	adds r0, r4, #0
	adds r1, r5, #0
	movs r3, #1
	bl sub_80932DC
	movs r0, #1
	bl EnableBgSync
_0809314C:
	adds r0, r6, #0
	bl sub_809257C
_08093152:
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0809315C: .4byte 0x00000502
_08093160: .4byte 0x02012A48
_08093164: .4byte gBg0Tm + 0x25e

	thumb_func_start sub_8093168
sub_8093168: @ 0x08093168
	push {r4, r5, lr}
	adds r4, r0, #0
	bl PrepItemScreen_OnEnd
	adds r0, r4, #0
	adds r0, #0x2a
	ldrb r0, [r0]
	bl GetUnitFromPrepList
	adds r5, r0, #0
	adds r0, r4, #0
	adds r0, #0x29
	ldrb r0, [r0]
	bl GetUnitFromPrepList
	adds r1, r0, #0
	adds r0, r5, #0
	adds r2, r4, #0
	bl StartPrepItemTradeScreenProc
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_8093198
sub_8093198: @ 0x08093198
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x2a
	ldrb r0, [r0]
	bl GetUnitFromPrepList
	adds r1, r4, #0
	bl StartPrepItemUseScreen
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_80931B0
sub_80931B0: @ 0x080931B0
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x2a
	ldrb r0, [r0]
	bl GetUnitFromPrepList
	adds r1, r4, #0
	bl StartPrepItemSupplyProc
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_80931C8
sub_80931C8: @ 0x080931C8
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x2a
	ldrb r0, [r0]
	bl GetUnitFromPrepList
	adds r1, r4, #0
	bl StartWorldMapSellScreen
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_80931E0
sub_80931E0: @ 0x080931E0
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x2a
	ldrb r0, [r0]
	bl GetUnitFromPrepList
	adds r1, r4, #0
	bl StartPrepItemListScreenProc
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start UpdatePrepItemScreenFace
UpdatePrepItemScreenFace: @ 0x080931F8
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #4
	adds r4, r0, #0
	adds r6, r1, #0
	ldr r0, [sp, #0x20]
	lsls r2, r2, #0x10
	lsrs r7, r2, #0x10
	lsls r3, r3, #0x10
	lsrs r3, r3, #0x10
	mov r8, r3
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov sb, r0
	ldr r0, _08093258 @ =gUnk_08D8C9C0
	bl Proc_Find
	adds r5, r0, #0
	lsls r1, r4, #2
	adds r0, #0x40
	adds r0, r0, r1
	ldr r0, [r0]
	cmp r0, r6
	beq _0809325C
	cmp r0, #0
	beq _08093236
	adds r0, r4, #0
	bl EndFaceById
_08093236:
	cmp r6, #0
	beq _08093278
	adds r0, r6, #0
	bl GetUnitPortraitId
	adds r1, r0, #0
	lsls r2, r7, #0x10
	asrs r2, r2, #0x10
	mov r0, r8
	lsls r3, r0, #0x10
	asrs r3, r3, #0x10
	mov r0, sb
	str r0, [sp]
	adds r0, r4, #0
	bl StartBmFace
	b _08093278
	.align 2, 0
_08093258: .4byte gUnk_08D8C9C0
_0809325C:
	cmp r6, #0
	beq _08093278
	lsls r1, r7, #0x10
	asrs r1, r1, #0x10
	mov r0, r8
	lsls r2, r0, #0x10
	asrs r2, r2, #0x10
	adds r0, r4, #0
	bl sub_8007B80
	adds r0, r4, #0
	mov r1, sb
	bl SetFaceDispById
_08093278:
	lsls r1, r4, #2
	adds r0, r5, #0
	adds r0, #0x40
	adds r0, r0, r1
	str r6, [r0]
	lsls r1, r4, #1
	adds r0, r5, #0
	adds r0, #0x34
	adds r0, r0, r1
	strh r7, [r0]
	adds r0, r5, #0
	adds r0, #0x38
	adds r0, r0, r1
	mov r2, r8
	strh r2, [r0]
	adds r0, r5, #0
	adds r0, #0x3c
	adds r0, r0, r1
	mov r1, sb
	strh r1, [r0]
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start EndPrepItemScreenFace
EndPrepItemScreenFace: @ 0x080932B0
	push {lr}
	sub sp, #4
	movs r1, #0
	str r1, [sp]
	movs r2, #0
	movs r3, #0
	bl UpdatePrepItemScreenFace
	add sp, #4
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_80932C8
sub_80932C8: @ 0x080932C8
	push {lr}
	adds r1, r0, #0
	ldr r0, _080932D8 @ =gUnk_08D8C9C0
	bl Proc_StartBlocking
	pop {r1}
	bx r1
	.align 2, 0
_080932D8: .4byte gUnk_08D8C9C0

	thumb_func_start sub_80932DC
sub_80932DC: @ 0x080932DC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x10
	adds r6, r0, #0
	adds r4, r1, #0
	mov r8, r2
	lsls r3, r3, #0x10
	lsrs r3, r3, #0x10
	str r3, [sp]
	adds r0, r4, #0
	movs r1, #0xc
	movs r2, #0x14
	movs r3, #0
	bl TmFillRect_thm
	movs r0, #2
	ldr r1, [sp]
	ands r0, r1
	cmp r0, #0
	beq _0809330E
	bl ClearIcons
_0809330E:
	mov r0, r8
	cmp r0, #0
	beq _080933DE
	bl GetUnitItemCount
	str r0, [sp, #4]
	movs r1, #0
	mov sb, r1
	cmp sb, r0
	bge _080933DE
	adds r0, r4, #0
	adds r0, #0x18
	str r0, [sp, #8]
	adds r1, r4, #6
	str r1, [sp, #0xc]
	adds r4, #2
	mov sl, r4
_08093330:
	mov r1, sb
	lsls r0, r1, #1
	mov r1, r8
	adds r1, #0x1e
	adds r1, r1, r0
	ldrh r5, [r1]
	movs r0, #4
	ldr r1, [sp]
	ands r0, r1
	cmp r0, #0
	beq _08093350
	mov r0, r8
	adds r1, r5, #0
	bl CanUnitUseItemPrepScreen
	b _08093358
_08093350:
	mov r0, r8
	adds r1, r5, #0
	bl IsItemDisplayUsable
_08093358:
	movs r7, #0
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08093362
	movs r7, #1
_08093362:
	movs r0, #1
	ldr r1, [sp]
	ands r0, r1
	cmp r0, #0
	bne _08093390
	adds r0, r6, #0
	bl ClearText
	adds r0, r6, #0
	adds r1, r7, #0
	bl Text_SetColor
	adds r0, r6, #0
	movs r1, #0
	bl Text_SetCursor
	adds r0, r5, #0
	bl GetItemName
	adds r1, r0, #0
	adds r0, r6, #0
	bl Text_DrawString
_08093390:
	adds r0, r5, #0
	bl GetItemIconId
	adds r1, r0, #0
	mov r0, sl
	movs r2, #0x80
	lsls r2, r2, #7
	bl PutIcon
	adds r0, r6, #0
	ldr r1, [sp, #0xc]
	bl PutText
	movs r4, #1
	cmp r7, #0
	bne _080933B2
	movs r4, #2
_080933B2:
	adds r0, r5, #0
	bl GetItemUses
	adds r2, r0, #0
	ldr r0, [sp, #8]
	adds r1, r4, #0
	bl PutNumberOrBlank
	adds r6, #8
	ldr r0, [sp, #8]
	adds r0, #0x80
	str r0, [sp, #8]
	ldr r1, [sp, #0xc]
	adds r1, #0x80
	str r1, [sp, #0xc]
	movs r0, #0x80
	add sl, r0
	movs r1, #1
	add sb, r1
	ldr r0, [sp, #4]
	cmp sb, r0
	blt _08093330
_080933DE:
	add sp, #0x10
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_80933F0
sub_80933F0: @ 0x080933F0
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r0, #0x29
	ldrb r0, [r0]
	movs r1, #3
	bl __udivsi3
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x14
	adds r6, r4, #0
	bl PrepGetUnitAmount
	subs r0, #1
	movs r1, #3
	bl __divsi3
	lsls r0, r0, #4
	ldrh r2, [r5, #0x32]
	subs r1, r4, r2
	cmp r1, #0x20
	ble _0809342A
	cmp r4, r0
	bne _08093424
	adds r0, r4, #0
	subs r0, #0x30
	b _0809343A
_08093424:
	adds r0, r4, #0
	subs r0, #0x20
	b _0809343A
_0809342A:
	cmp r1, #0xf
	bgt _0809343C
	cmp r4, #0
	bne _08093436
	strh r4, [r5, #0x32]
	b _0809343C
_08093436:
	adds r0, r6, #0
	subs r0, #0x10
_0809343A:
	strh r0, [r5, #0x32]
_0809343C:
	ldr r1, _08093474 @ =0x0000FFD8
	ldrh r2, [r5, #0x32]
	subs r2, #4
	movs r0, #0xff
	ands r2, r0
	movs r0, #2
	bl SetBgOffset
	ldrh r4, [r5, #0x32]
	bl PrepGetUnitAmount
	subs r0, #1
	movs r1, #3
	bl __divsi3
	adds r2, r0, #0
	adds r2, #1
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	movs r0, #6
	adds r1, r4, #0
	movs r3, #4
	bl UpdateMenuScrollBarConfig
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08093474: .4byte 0x0000FFD8

	thumb_func_start sub_8093478
sub_8093478: @ 0x08093478
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	adds r4, r2, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	mov sl, r1
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	lsls r0, r1, #1
	add r0, sl
	str r0, [sp]
	movs r1, #0xf
	bl __modsi3
	lsls r0, r0, #3
	ldr r1, _08093538 @ =0x020129A8
	adds r6, r0, r1
	movs r0, #0
	mov r8, r0
	lsls r4, r4, #0x18
	asrs r4, r4, #0x18
	mov sb, r4
_080934AC:
	mov r1, sb
	cmp r1, #0
	bne _080934B8
	adds r0, r6, #0
	bl ClearText
_080934B8:
	ldr r4, [sp]
	add r4, r8
	bl PrepGetUnitAmount
	cmp r4, r0
	bge _08093514
	mov r0, r8
	movs r1, #3
	bl __modsi3
	lsls r7, r0, #3
	mov r0, sl
	lsls r5, r0, #1
	movs r0, #0x1f
	ands r5, r0
	mov r1, sb
	cmp r1, #0
	bne _08093504
	adds r0, r4, #0
	bl GetUnitFromPrepList
	adds r4, r0, #0
	adds r0, r6, #0
	movs r1, #0
	bl Text_SetCursor
	adds r0, r6, #0
	movs r1, #0
	bl Text_SetColor
	ldr r0, [r4]
	ldrh r0, [r0]
	bl DecodeMsg
	adds r1, r0, #0
	adds r0, r6, #0
	bl Text_DrawString
_08093504:
	lsls r1, r5, #5
	adds r1, r1, r7
	lsls r1, r1, #1
	ldr r0, _0809353C @ =gBg2Tm
	adds r1, r1, r0
	adds r0, r6, #0
	bl PutText
_08093514:
	adds r6, #8
	movs r0, #1
	add r8, r0
	mov r1, r8
	cmp r1, #2
	ble _080934AC
	movs r0, #4
	bl EnableBgSync
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08093538: .4byte 0x020129A8
_0809353C: .4byte gBg2Tm

	thumb_func_start sub_8093540
sub_8093540: @ 0x08093540
	cmp r0, #0x60
	bhi _0809354C
	cmp r1, #0x1f
	ble _0809354C
	movs r0, #1
	b _0809354E
_0809354C:
	movs r0, #0
_0809354E:
	bx lr

	thumb_func_start PrepItem_DrawSMS
PrepItem_DrawSMS: @ 0x08093550
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	movs r6, #0
	b _080935B0
_08093558:
	adds r0, r6, #0
	movs r1, #3
	bl __modsi3
	lsls r5, r0, #6
	adds r0, r6, #0
	movs r1, #3
	bl __divsi3
	lsls r0, r0, #4
	ldrh r1, [r7, #0x32]
	subs r4, r0, r1
	adds r0, r4, #0
	adds r0, #0x14
	cmp r0, #0x44
	bhi _080935AE
	adds r0, r7, #0
	adds r0, #0x31
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _08093594
	adds r0, r5, #0
	adds r1, r4, #0
	bl sub_8093540
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080935AE
_08093594:
	adds r5, #0x18
	adds r4, #4
	movs r0, #0xff
	ands r4, r0
	adds r0, r6, #0
	bl GetUnitFromPrepList
	adds r3, r0, #0
	movs r0, #0
	adds r1, r5, #0
	adds r2, r4, #0
	bl sub_8026540
_080935AE:
	adds r6, #1
_080935B0:
	bl PrepGetUnitAmount
	cmp r6, r0
	blt _08093558
	bl SyncUnitSpriteSheet
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_80935C4
sub_80935C4: @ 0x080935C4
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x1c
	str r0, [sp, #4]
	mov sl, r1
	str r2, [sp, #8]
	str r3, [sp, #0xc]
	cmp r2, #0
	bgt _080935DE
	b _080937BE
_080935DE:
	cmp r3, #0
	bgt _080935E4
	b _080937BE
_080935E4:
	ldr r5, _080937D0 @ =Sprite_8x8
	ldr r0, [sp, #0x3c]
	str r0, [sp]
	movs r0, #4
	ldr r1, [sp, #4]
	mov r2, sl
	adds r3, r5, #0
	bl PutSpriteExt
	ldr r1, [sp, #8]
	lsls r1, r1, #3
	mov sb, r1
	ldr r4, [sp, #4]
	add r4, sb
	movs r2, #0x80
	lsls r2, r2, #5
	adds r1, r4, r2
	ldr r3, [sp, #0x3c]
	str r3, [sp]
	movs r0, #4
	mov r2, sl
	adds r3, r5, #0
	bl PutSpriteExt
	movs r0, #0xc0
	lsls r0, r0, #6
	adds r4, r4, r0
	ldr r1, [sp, #0xc]
	lsls r1, r1, #3
	mov r8, r1
	mov r6, sl
	add r6, r8
	ldr r2, [sp, #0x3c]
	str r2, [sp]
	movs r0, #4
	adds r1, r4, #0
	adds r2, r6, #0
	adds r3, r5, #0
	bl PutSpriteExt
	ldr r3, [sp, #4]
	movs r0, #0x80
	lsls r0, r0, #6
	adds r1, r3, r0
	ldr r2, [sp, #0x3c]
	str r2, [sp]
	movs r0, #4
	adds r2, r6, #0
	adds r3, r5, #0
	bl PutSpriteExt
	movs r5, #1
	mov r3, sb
	str r3, [sp, #0x18]
	mov sb, r8
	ldr r0, [sp, #8]
	subs r0, #1
	str r0, [sp, #0x10]
	cmp r5, r0
	bge _08093698
	ldr r1, _080937D4 @ =Sprite_16x8
	mov r8, r1
	ldr r7, [sp, #0x3c]
	adds r7, #1
	ldr r2, [sp, #4]
	ldr r3, _080937D8 @ =0x00002008
	adds r6, r2, r3
	adds r4, r2, #0
	adds r4, #8
_0809366E:
	str r7, [sp]
	movs r0, #4
	adds r1, r4, #0
	mov r2, sl
	mov r3, r8
	bl PutSpriteExt
	str r7, [sp]
	movs r0, #4
	adds r1, r6, #0
	mov r2, sl
	add r2, sb
	mov r3, r8
	bl PutSpriteExt
	adds r6, #0x10
	adds r4, #0x10
	adds r5, #2
	ldr r0, [sp, #0x10]
	cmp r5, r0
	blt _0809366E
_08093698:
	ldr r1, [sp, #8]
	cmp r5, r1
	bge _080936E0
	ldr r2, _080937D0 @ =Sprite_8x8
	mov r8, r2
	ldr r7, [sp, #0x3c]
	adds r7, #1
	lsls r1, r5, #3
	movs r3, #0x80
	lsls r3, r3, #6
	adds r0, r1, r3
	ldr r2, [sp, #4]
	adds r6, r0, r2
	adds r4, r1, r2
	ldr r3, [sp, #8]
	subs r5, r3, r5
_080936B8:
	str r7, [sp]
	movs r0, #4
	adds r1, r4, #0
	mov r2, sl
	mov r3, r8
	bl PutSpriteExt
	str r7, [sp]
	movs r0, #4
	adds r1, r6, #0
	mov r2, sl
	add r2, sb
	mov r3, r8
	bl PutSpriteExt
	adds r6, #8
	adds r4, #8
	subs r5, #1
	cmp r5, #0
	bne _080936B8
_080936E0:
	ldr r0, [sp, #0xc]
	cmp r0, #1
	ble _08093724
	ldr r7, _080937D0 @ =Sprite_8x8
	ldr r5, [sp, #0x3c]
	adds r5, #3
	mov r4, sl
	adds r4, #8
	ldr r1, [sp, #4]
	ldr r2, [sp, #0x18]
	adds r1, r1, r2
	mov r8, r1
	adds r6, r0, #0
	subs r6, #1
_080936FC:
	str r5, [sp]
	movs r0, #4
	ldr r1, [sp, #4]
	adds r2, r4, #0
	adds r3, r7, #0
	bl PutSpriteExt
	str r5, [sp]
	movs r0, #4
	movs r1, #0x80
	lsls r1, r1, #5
	add r1, r8
	adds r2, r4, #0
	adds r3, r7, #0
	bl PutSpriteExt
	adds r4, #8
	subs r6, #1
	cmp r6, #0
	bne _080936FC
_08093724:
	movs r6, #1
	ldr r3, [sp, #0xc]
	cmp r6, r3
	bge _080937BE
	ldr r0, [sp, #8]
	subs r0, #3
	mov sb, r0
	ldr r1, [sp, #0x3c]
	adds r1, #4
	mov r8, r1
_08093738:
	movs r5, #1
	adds r2, r6, #1
	str r2, [sp, #0x14]
	cmp r5, sb
	bge _08093762
	ldr r4, [sp, #4]
	adds r4, #8
	lsls r7, r6, #3
_08093748:
	mov r3, r8
	str r3, [sp]
	movs r0, #4
	adds r1, r4, #0
	mov r3, sl
	adds r2, r3, r7
	ldr r3, _080937DC @ =Sprite_32x8
	bl PutSpriteExt
	adds r4, #0x20
	adds r5, #4
	cmp r5, sb
	blt _08093748
_08093762:
	ldr r0, [sp, #0x10]
	cmp r5, r0
	bge _0809378C
	lsls r0, r5, #3
	ldr r1, [sp, #4]
	adds r4, r0, r1
	lsls r7, r6, #3
_08093770:
	mov r2, r8
	str r2, [sp]
	movs r0, #4
	adds r1, r4, #0
	mov r3, sl
	adds r2, r3, r7
	ldr r3, _080937D4 @ =Sprite_16x8
	bl PutSpriteExt
	adds r4, #0x10
	adds r5, #2
	ldr r0, [sp, #0x10]
	cmp r5, r0
	blt _08093770
_0809378C:
	ldr r1, [sp, #8]
	cmp r5, r1
	bge _080937B6
	lsls r0, r5, #3
	ldr r2, [sp, #4]
	adds r4, r0, r2
	lsls r6, r6, #3
	subs r5, r1, r5
_0809379C:
	mov r3, r8
	str r3, [sp]
	movs r0, #4
	adds r1, r4, #0
	mov r3, sl
	adds r2, r3, r6
	ldr r3, _080937D0 @ =Sprite_8x8
	bl PutSpriteExt
	adds r4, #8
	subs r5, #1
	cmp r5, #0
	bne _0809379C
_080937B6:
	ldr r6, [sp, #0x14]
	ldr r0, [sp, #0xc]
	cmp r6, r0
	blt _08093738
_080937BE:
	add sp, #0x1c
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080937D0: .4byte Sprite_8x8
_080937D4: .4byte Sprite_16x8
_080937D8: .4byte 0x00002008
_080937DC: .4byte Sprite_32x8

	thumb_func_start sub_80937E0
sub_80937E0: @ 0x080937E0
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	ldrh r0, [r5, #0x32]
	lsrs r4, r0, #4
	adds r0, r4, #4
	cmp r4, r0
	bge _0809380C
	lsls r6, r1, #0x18
_080937F4:
	lsls r1, r4, #0x18
	lsrs r1, r1, #0x18
	adds r0, r5, #0
	asrs r2, r6, #0x18
	bl sub_8093478
	adds r4, #1
	ldrh r1, [r5, #0x32]
	lsrs r0, r1, #4
	adds r0, #4
	cmp r4, r0
	blt _080937F4
_0809380C:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start PrepItemScreen_GiveAll
PrepItemScreen_GiveAll: @ 0x08093814
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	bl GetUnitItemCount
	adds r7, r0, #0
	bl GetConvoyItemCount_
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	movs r4, #0
	cmp r4, r7
	bge _0809384A
	cmp r6, #0x63
	bgt _0809384A
_08093830:
	ldrh r0, [r5, #0x1e]
	bl AddItemToConvoy
	adds r0, r5, #0
	movs r1, #0
	bl UnitRemoveItem
	adds r4, #1
	cmp r4, r7
	bge _0809384A
	adds r0, r4, r6
	cmp r0, #0x63
	ble _08093830
_0809384A:
	cmp r4, #0
	bgt _08093852
	movs r0, #0
	b _08093854
_08093852:
	movs r0, #1
_08093854:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
