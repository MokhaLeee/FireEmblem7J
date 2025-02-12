	.include "macro.inc"
	.syntax unified

	thumb_func_start AtMenu_UpdateDesc
AtMenu_UpdateDesc: @ 0x0808F2BC
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	bl GetActivePrepMenuItemIndex
	adds r6, r0, #0
	adds r4, r5, #0
	adds r4, #0x35
	ldrb r0, [r4]
	cmp r0, r6
	beq _0808F2DC
	bl GetPrepMainMenuInfoxMsg
	adds r1, r5, #0
	bl StartPrepMenuDescHandler
	strb r6, [r4]
_0808F2DC:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_808F2E4
sub_808F2E4: @ 0x0808F2E4
	push {r4, r5, r6, r7, lr}
	sub sp, #8
	adds r7, r0, #0
	ldr r5, _0808F35C @ =gPrepMainMenuTexts + 8
	adds r0, #0x2f
	ldrb r0, [r0]
	bl GetPrepOptionCount
	adds r3, r0, #0
	lsls r3, r3, #1
	adds r3, #2
	movs r0, #1
	str r0, [sp]
	movs r0, #5
	movs r1, #6
	movs r2, #9
	bl DrawUiFrame2
	movs r4, #0
	movs r6, #0xe0
	lsls r6, r6, #1
_0808F30E:
	adds r0, r7, #0
	adds r0, #0x2f
	ldrb r0, [r0]
	asrs r0, r4
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _0808F346
	adds r0, r5, #0
	bl ClearText
	ldr r1, _0808F360 @ =gUnk_08D8D5F8
	lsls r0, r4, #2
	adds r0, r0, r1
	ldr r0, [r0]
	bl DecodeMsg
	ldr r1, _0808F364 @ =gBg0Tm + 0xc
	adds r1, r6, r1
	movs r2, #0
	str r2, [sp]
	str r0, [sp, #4]
	adds r0, r5, #0
	movs r3, #0
	bl PutDrawText
	adds r5, #8
	adds r6, #0x80
_0808F346:
	adds r4, #1
	cmp r4, #3
	ble _0808F30E
	movs r0, #3
	bl EnableBgSync
	add sp, #8
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0808F35C: .4byte gPrepMainMenuTexts + 8
_0808F360: .4byte gUnk_08D8D5F8
_0808F364: .4byte gBg0Tm + 0xc

	thumb_func_start sub_808F368
sub_808F368: @ 0x0808F368
	push {lr}
	ldr r0, _0808F38C @ =gBg0Tm + 0x18a
	movs r1, #8
	movs r2, #9
	movs r3, #0
	bl TmFillRect_thm
	ldr r0, _0808F390 @ =gBg1Tm + 0x18a
	movs r1, #8
	movs r2, #9
	movs r3, #0
	bl TmFillRect_thm
	movs r0, #3
	bl EnableBgSync
	pop {r0}
	bx r0
	.align 2, 0
_0808F38C: .4byte gBg0Tm + 0x18a
_0808F390: .4byte gBg1Tm + 0x18a

	thumb_func_start AtMenu_SetupCtrlUI
AtMenu_SetupCtrlUI: @ 0x0808F394
	push {r4, lr}
	adds r4, r0, #0
	bl sub_8090AA4
	adds r0, r4, #0
	bl sub_808F2E4
	adds r4, #0x2e
	ldrb r4, [r4]
	lsls r1, r4, #4
	adds r1, #0x38
	movs r3, #0x80
	lsls r3, r3, #3
	movs r0, #0x2c
	movs r2, #7
	bl ShowSysHandCursor
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start AtMenu_CtrlLoop
AtMenu_CtrlLoop: @ 0x0808F3BC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x14
	adds r6, r0, #0
	add r1, sp, #4
	ldr r0, _0808F410 @ =gUnk_0842CF2C
	ldm r0!, {r2, r3, r4}
	stm r1!, {r2, r3, r4}
	ldr r0, [r0]
	str r0, [r1]
	adds r5, r6, #0
	adds r5, #0x2e
	ldrb r0, [r5]
	mov sb, r0
	movs r1, #0x2c
	mov sl, r1
	lsls r0, r0, #4
	adds r7, r0, #0
	adds r7, #0x38
	adds r4, r6, #0
	adds r4, #0x34
	ldrb r2, [r4]
	mov r8, r2
	cmp r2, #0
	beq _0808F418
	ldr r0, _0808F414 @ =gpKeySt
	ldr r1, [r0]
	movs r0, #0x81
	lsls r0, r0, #1
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _0808F4F0
	bl CloseHelpBox
	movs r0, #0
	strb r0, [r4]
	b _0808F5B2
	.align 2, 0
_0808F410: .4byte gUnk_0842CF2C
_0808F414: .4byte gpKeySt
_0808F418:
	ldr r0, _0808F46C @ =gpKeySt
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0808F478
	ldr r0, _0808F470 @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0808F438
	ldr r0, _0808F474 @ =0x0000038A
	bl m4aSongNumStart
_0808F438:
	ldrb r0, [r5]
	adds r1, r6, #0
	adds r1, #0x2f
	ldrb r1, [r1]
	bl PrepOptionCountToRealIndexByMask
	cmp r0, #3
	bne _0808F45A
	movs r2, #0x80
	lsls r2, r2, #1
	mov r3, r8
	str r3, [sp]
	movs r0, #0x5e
	adds r1, r2, #0
	movs r3, #0x20
	bl CallSomeSoundMaybe
_0808F45A:
	adds r1, r6, #0
	adds r1, #0x33
	movs r0, #4
	strb r0, [r1]
	adds r0, r6, #0
	movs r1, #8
	bl Proc_Goto
	b _0808F5B2
	.align 2, 0
_0808F46C: .4byte gpKeySt
_0808F470: .4byte gPlaySt
_0808F474: .4byte 0x0000038A
_0808F478:
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0808F4A4
	movs r0, #1
	strb r0, [r4]
	ldrb r0, [r5]
	adds r1, r6, #0
	adds r1, #0x2f
	ldrb r1, [r1]
	bl PrepOptionCountToRealIndexByMask
	lsls r0, r0, #2
	add r0, sp
	adds r0, #4
	ldr r2, [r0]
	movs r0, #0x2c
	adds r1, r7, #0
	bl StartHelpBox
	b _0808F5B2
_0808F4A4:
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0808F4F0
	adds r0, r6, #0
	bl sub_808F368
	ldr r0, _0808F4E0 @ =gBg1Tm + 0x118
	ldr r1, _0808F4E4 @ =Tsa_0841D614
	movs r2, #0xcf
	lsls r2, r2, #6
	bl TmApplyTsa_thm
	movs r0, #1
	movs r1, #4
	bl DrawPrepScreenMenuFrameAt
	ldr r0, _0808F4E8 @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0808F4D8
	ldr r0, _0808F4EC @ =0x0000038B
	bl m4aSongNumStart
_0808F4D8:
	adds r0, r6, #0
	bl Proc_Break
	b _0808F5B2
	.align 2, 0
_0808F4E0: .4byte gBg1Tm + 0x118
_0808F4E4: .4byte Tsa_0841D614
_0808F4E8: .4byte gPlaySt
_0808F4EC: .4byte 0x0000038B
_0808F4F0:
	ldr r0, _0808F54C @ =gpKeySt
	ldr r1, [r0]
	movs r2, #0x40
	adds r0, r2, #0
	ldrh r4, [r1, #6]
	ands r0, r4
	adds r5, r6, #0
	adds r5, #0x2e
	cmp r0, #0
	beq _0808F522
	ldrb r0, [r5]
	cmp r0, #0
	bne _0808F51E
	adds r0, r2, #0
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _0808F522
	adds r0, r6, #0
	adds r0, #0x2f
	ldrb r0, [r0]
	bl GetPrepOptionCount
_0808F51E:
	subs r0, #1
	strb r0, [r5]
_0808F522:
	ldr r7, _0808F54C @ =gpKeySt
	ldr r1, [r7]
	movs r0, #0x80
	mov r8, r0
	ldrh r1, [r1, #6]
	ands r0, r1
	cmp r0, #0
	beq _0808F560
	ldrb r4, [r5]
	adds r0, r6, #0
	adds r0, #0x2f
	ldrb r0, [r0]
	bl GetPrepOptionCount
	subs r0, #1
	cmp r4, r0
	bge _0808F550
	ldrb r0, [r5]
	adds r0, #1
	b _0808F55E
	.align 2, 0
_0808F54C: .4byte gpKeySt
_0808F550:
	ldr r1, [r7]
	mov r0, r8
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _0808F560
	movs r0, #0
_0808F55E:
	strb r0, [r5]
_0808F560:
	ldrb r2, [r5]
	cmp sb, r2
	beq _0808F5B2
	lsls r0, r2, #4
	adds r7, r0, #0
	adds r7, #0x38
	adds r0, r6, #0
	adds r0, #0x34
	ldrb r0, [r0]
	cmp r0, #0
	beq _0808F592
	adds r0, r6, #0
	adds r0, #0x2f
	ldrb r1, [r0]
	adds r0, r2, #0
	bl PrepOptionCountToRealIndexByMask
	lsls r0, r0, #2
	add r0, sp
	adds r0, #4
	ldr r2, [r0]
	mov r0, sl
	adds r1, r7, #0
	bl StartHelpBox
_0808F592:
	movs r3, #0x80
	lsls r3, r3, #3
	mov r0, sl
	adds r1, r7, #0
	movs r2, #7
	bl ShowSysHandCursor
	ldr r0, _0808F5C4 @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0808F5B2
	ldr r0, _0808F5C8 @ =0x00000386
	bl m4aSongNumStart
_0808F5B2:
	add sp, #0x14
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0808F5C4: .4byte gPlaySt
_0808F5C8: .4byte 0x00000386

	thumb_func_start AtMenuSetUnitStateAndEndFlag
AtMenuSetUnitStateAndEndFlag: @ 0x0808F5CC
	push {r4, r5, lr}
	adds r5, r0, #0
	movs r4, #1
_0808F5D2:
	adds r0, r4, #0
	bl GetUnit
	adds r2, r0, #0
	cmp r2, #0
	beq _0808F5EC
	ldr r0, [r2]
	cmp r0, #0
	beq _0808F5EC
	ldr r0, [r2, #0xc]
	ldr r1, _0808F600 @ =0xFDFFFFFF
	ands r0, r1
	str r0, [r2, #0xc]
_0808F5EC:
	adds r4, #1
	cmp r4, #0x3f
	ble _0808F5D2
	adds r1, r5, #0
	adds r1, #0x36
	movs r0, #1
	strb r0, [r1]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0808F600: .4byte 0xFDFFFFFF

	thumb_func_start AtMenu_ResetScreenEffect
AtMenu_ResetScreenEffect: @ 0x0808F604
	push {r4, lr}
	adds r4, r0, #0
	bl EndAllProcChildren
	bl EndMuralBackground_
	bl EndPrepSpecialCharEffect
	movs r0, #0
	bl InitBgs
	ldr r3, _0808F668 @ =gDispIo
	adds r2, r3, #0
	adds r2, #0x3c
	movs r0, #0xc0
	ldrb r1, [r2]
	orrs r0, r1
	strb r0, [r2]
	adds r0, r3, #0
	adds r0, #0x44
	movs r1, #0
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r1, r3, #0
	adds r1, #0x46
	movs r0, #0x10
	strb r0, [r1]
	ldr r0, _0808F66C @ =0x0000FFE0
	ldrh r1, [r3, #0x3c]
	ands r0, r1
	movs r1, #0x1f
	orrs r0, r1
	strh r0, [r3, #0x3c]
	movs r0, #0x20
	ldrb r1, [r2]
	orrs r0, r1
	strb r0, [r2]
	adds r0, r4, #0
	adds r0, #0x36
	ldrb r0, [r0]
	cmp r0, #0
	beq _0808F660
	adds r0, r4, #0
	bl sub_807D6BC
_0808F660:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0808F668: .4byte gDispIo
_0808F66C: .4byte 0x0000FFE0

	thumb_func_start AtMenu_ResetBmUiEffect
AtMenu_ResetBmUiEffect: @ 0x0808F670
	push {r4, lr}
	adds r4, r0, #0
	bl ReorderPlayerUnitsBasedOnDeployment
	adds r4, #0x36
	ldrb r0, [r4]
	cmp r0, #0
	beq _0808F686
	bl EndPrepScreen
	b _0808F694
_0808F686:
	bl CheckInLinkArena
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0808F694
	bl sub_803DED4
_0808F694:
	bl sub_800F070
	bl ResetUnitSprites
	bl RefreshEntityMaps
	bl RefreshUnitSprites
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start AtMenu_StartSubmenu
AtMenu_StartSubmenu: @ 0x0808F6AC
	push {r4, lr}
	adds r4, r0, #0
	bl StartPrepAtSubMenuUI
	adds r0, r4, #0
	adds r0, #0x33
	ldrb r0, [r0]
	subs r0, #1
	cmp r0, #4
	bhi _0808F734
	lsls r0, r0, #2
	ldr r1, _0808F6CC @ =_0808F6D0
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0808F6CC: .4byte _0808F6D0
_0808F6D0: @ jump table
	.4byte _0808F6F4 @ case 0
	.4byte _0808F6EC @ case 1
	.4byte _0808F71C @ case 2
	.4byte _0808F704 @ case 3
	.4byte _0808F6E4 @ case 4
_0808F6E4:
	adds r0, r4, #0
	bl sub_8087B80
	b _0808F734
_0808F6EC:
	adds r0, r4, #0
	bl StartPrepItemScreen
	b _0808F734
_0808F6F4:
	ldr r0, _0808F700 @ =ProcScr_PrepUnitScreen
	adds r1, r4, #0
	bl Proc_StartBlocking
	b _0808F734
	.align 2, 0
_0808F700: .4byte ProcScr_PrepUnitScreen
_0808F704:
	adds r0, r4, #0
	adds r0, #0x2e
	ldrb r0, [r0]
	adds r1, r4, #0
	adds r1, #0x2f
	ldrb r1, [r1]
	bl PrepOptionCountToRealIndexByMask
	adds r1, r4, #0
	bl StartFortuneSubMenu
	b _0808F734
_0808F71C:
	movs r0, #0x80
	lsls r0, r0, #1
	movs r1, #0x80
	movs r2, #0x20
	movs r3, #0
	bl StartBgmVolumeChange
	bl sub_800F070
	adds r0, r4, #0
	bl sub_80A5AF8
_0808F734:
	adds r0, r4, #0
	bl Proc_Break
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start AtMenu_OnSubmenuEnd
AtMenu_OnSubmenuEnd: @ 0x0808F740
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r4, #0
	adds r5, #0x33
	ldrb r0, [r5]
	cmp r0, #3
	bne _0808F75C
	movs r1, #0x80
	lsls r1, r1, #1
	movs r0, #0x80
	movs r2, #0x20
	movs r3, #0
	bl StartBgmVolumeChange
_0808F75C:
	ldrb r0, [r5]
	subs r0, #1
	cmp r0, #4
	bhi _0808F7A4
	lsls r0, r0, #2
	ldr r1, _0808F770 @ =_0808F774
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0808F770: .4byte _0808F774
_0808F774: @ jump table
	.4byte _0808F79C @ case 0
	.4byte _0808F79C @ case 1
	.4byte _0808F792 @ case 2
	.4byte _0808F788 @ case 3
	.4byte _0808F79C @ case 4
_0808F788:
	adds r0, r4, #0
	movs r1, #0xd
	bl Proc_Goto
	b _0808F7A4
_0808F792:
	adds r0, r4, #0
	movs r1, #7
	bl Proc_Goto
	b _0808F7A4
_0808F79C:
	adds r0, r4, #0
	movs r1, #9
	bl Proc_Goto
_0808F7A4:
	adds r1, r4, #0
	adds r1, #0x33
	movs r0, #0
	strb r0, [r1]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_808F7B4
sub_808F7B4: @ 0x0808F7B4
	ldr r2, _0808F7D0 @ =gDispIo
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
_0808F7D0: .4byte gDispIo

	thumb_func_start AtMenu_LockGame
AtMenu_LockGame: @ 0x0808F7D4
	push {lr}
	bl CheckInLinkArena
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0808F7E8
	bl LockGame
	bl LockBmDisplay
_0808F7E8:
	pop {r0}
	bx r0

	thumb_func_start AtMenu_UnlockGame
AtMenu_UnlockGame: @ 0x0808F7EC
	push {lr}
	bl CheckInLinkArena
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0808F800
	bl UnlockBmDisplay
	bl UnlockGame
_0808F800:
	pop {r0}
	bx r0

	thumb_func_start sub_808F804
sub_808F804: @ 0x0808F804
	push {lr}
	ldr r0, _0808F814 @ =ProcScr_AtMenu
	movs r1, #3
	bl Proc_Start
	pop {r0}
	bx r0
	.align 2, 0
_0808F814: .4byte ProcScr_AtMenu

	thumb_func_start sub_808F818
sub_808F818: @ 0x0808F818
	push {lr}
	ldr r0, _0808F830 @ =ProcScr_AtMenu
	movs r1, #3
	bl Proc_Start
	bl RemoveSomeUnitItems
	bl ResetSioPidPool
	pop {r0}
	bx r0
	.align 2, 0
_0808F830: .4byte ProcScr_AtMenu

	thumb_func_start HasConvoyAccess_
HasConvoyAccess_: @ 0x0808F834
	push {r4, lr}
	cmp r0, #0
	beq _0808F840
	cmp r0, #1
	beq _0808F870
	b _0808F8C2
_0808F840:
	movs r4, #1
_0808F842:
	adds r0, r4, #0
	bl GetUnit
	cmp r0, #0
	beq _0808F864
	ldr r1, [r0]
	cmp r1, #0
	beq _0808F864
	ldr r0, [r0, #4]
	ldr r1, [r1, #0x28]
	ldr r0, [r0, #0x28]
	orrs r1, r0
	movs r0, #0x80
	lsls r0, r0, #2
	ands r1, r0
	cmp r1, #0
	bne _0808F86C
_0808F864:
	adds r4, #1
	cmp r4, #0x3f
	ble _0808F842
	b _0808F8C2
_0808F86C:
	movs r0, #1
	b _0808F8C4
_0808F870:
	bl CheckInLinkArena
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0808F8C2
	ldr r4, _0808F8CC @ =gPlaySt
	movs r0, #0xe
	ldrsb r0, [r4, r0]
	bl GetChapterInfo
	movs r1, #0
	ldrb r4, [r4, #0x1b]
	cmp r4, #3
	bne _0808F88E
	movs r1, #1
_0808F88E:
	adds r0, #0x82
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #0xff
	beq _0808F8C2
	movs r4, #1
_0808F89A:
	adds r0, r4, #0
	bl GetUnit
	cmp r0, #0
	beq _0808F8BC
	ldr r1, [r0]
	cmp r1, #0
	beq _0808F8BC
	ldr r0, [r0, #4]
	ldr r1, [r1, #0x28]
	ldr r0, [r0, #0x28]
	orrs r1, r0
	movs r0, #0x80
	lsls r0, r0, #2
	ands r1, r0
	cmp r1, #0
	bne _0808F86C
_0808F8BC:
	adds r4, #1
	cmp r4, #0x3f
	ble _0808F89A
_0808F8C2:
	movs r0, #0
_0808F8C4:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0808F8CC: .4byte gPlaySt

	thumb_func_start sub_808F8D0
sub_808F8D0: @ 0x0808F8D0
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r7, r0, #0
	ldr r2, [r7, #0x5c]
	movs r3, #0x8f
	lsls r3, r3, #6
	movs r0, #0x70
	movs r1, #4
	bl sub_8090148
	movs r6, #0x8d
	lsls r6, r6, #7
	movs r5, #0x80
	movs r4, #2
_0808F8EC:
	str r6, [sp]
	movs r0, #4
	adds r1, r5, #0
	movs r2, #0x14
	ldr r3, _0808F930 @ =Sprite_32x16
	bl PutSpriteExt
	adds r6, #4
	adds r5, #0x20
	subs r4, #1
	cmp r4, #0
	bge _0808F8EC
	adds r2, r7, #0
	adds r2, #0x64
	ldrh r0, [r2]
	cmp r0, #1
	bne _0808F928
	ldr r0, _0808F934 @ =gpKeySt
	ldr r1, [r0]
	movs r0, #8
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _0808F928
	movs r0, #0
	strh r0, [r2]
	adds r0, r7, #0
	movs r1, #0x64
	bl Proc_Goto
_0808F928:
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0808F930: .4byte Sprite_32x16
_0808F934: .4byte gpKeySt

	thumb_func_start sub_808F938
sub_808F938: @ 0x0808F938
	push {r4, lr}
	movs r4, #1
_0808F93C:
	adds r0, r4, #0
	bl GetUnit
	cmp r0, #0
	beq _0808F960
	ldr r1, [r0]
	cmp r1, #0
	beq _0808F960
	ldrb r1, [r1, #4]
	cmp r1, #0x23
	bne _0808F960
	ldr r0, [r0, #0xc]
	movs r1, #4
	ands r0, r1
	cmp r0, #0
	bne _0808F966
	movs r0, #1
	b _0808F968
_0808F960:
	adds r4, #1
	cmp r4, #0x3f
	ble _0808F93C
_0808F966:
	movs r0, #0
_0808F968:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_808F970
sub_808F970: @ 0x0808F970
	push {r4, lr}
	ldr r4, _0808F9D4 @ =gPlaySt
	movs r0, #0x80
	ldrb r1, [r4, #0x14]
	ands r0, r1
	cmp r0, #0
	bne _0808F9D8
	bl CheckInLinkArena
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0808F9D8
	movs r0, #0xe
	ldrsb r0, [r4, r0]
	bl GetChapterInfo
	ldrb r0, [r0, #0xd]
	cmp r0, #0
	beq _0808F9D8
	movs r0, #0xe
	ldrsb r0, [r4, r0]
	bl GetChapterInfo
	movs r1, #0
	ldrb r4, [r4, #0x1b]
	cmp r4, #3
	bne _0808F9A8
	movs r1, #1
_0808F9A8:
	adds r0, #0x82
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #0xff
	beq _0808F9D8
	movs r0, #0x28
	bl GetUnitFromCharId
	cmp r0, #0
	beq _0808F9D8
	ldrb r1, [r0, #8]
	cmp r1, #0x14
	bne _0808F9D8
	ldr r0, [r0, #4]
	ldrb r0, [r0, #4]
	cmp r0, #0x44
	bne _0808F9D8
	movs r0, #0x90
	bl ClearFlag
	movs r0, #1
	b _0808F9DA
	.align 2, 0
_0808F9D4: .4byte gPlaySt
_0808F9D8:
	movs r0, #0
_0808F9DA:
	pop {r4}
	pop {r1}
	bx r1

	thumb_func_start AtUnkMenu_Reinitialize
AtUnkMenu_Reinitialize: @ 0x0808F9E0
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #8
	adds r6, r0, #0
	movs r5, #0
	str r5, [r6, #0x58]
	ldr r4, _0808FA04 @ =gPlaySt
	movs r0, #0xe
	ldrsb r0, [r4, r0]
	cmp r0, #0x11
	beq _0808FA1C
	cmp r0, #0x11
	bgt _0808FA08
	cmp r0, #9
	beq _0808FA0E
	b _0808FA68
	.align 2, 0
_0808FA04: .4byte gPlaySt
_0808FA08:
	cmp r0, #0x14
	beq _0808FA54
	b _0808FA68
_0808FA0E:
	bl sub_808F938
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0808FA68
	movs r0, #8
	b _0808FA66
_0808FA1C:
	movs r0, #0x6a
	bl CheckFlag
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0808FA42
	ldr r1, [r6, #0x58]
	movs r0, #4
	orrs r1, r0
	str r1, [r6, #0x58]
	movs r0, #0x40
	ldrb r4, [r4, #0x14]
	ands r0, r4
	cmp r0, #0
	bne _0808FA68
	movs r0, #1
	orrs r1, r0
	str r1, [r6, #0x58]
	b _0808FA68
_0808FA42:
	movs r0, #0x40
	ldrb r4, [r4, #0x14]
	ands r0, r4
	cmp r0, #0
	bne _0808FA68
	ldr r0, [r6, #0x58]
	movs r1, #2
	orrs r0, r1
	b _0808FA66
_0808FA54:
	movs r0, #0x6a
	bl CheckFlag
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0808FA64
	str r5, [r6, #0x58]
	b _0808FA68
_0808FA64:
	movs r0, #4
_0808FA66:
	str r0, [r6, #0x58]
_0808FA68:
	bl sub_808F970
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0808FA76
	movs r0, #0x10
	str r0, [r6, #0x58]
_0808FA76:
	ldr r0, [r6, #0x58]
	cmp r0, #0
	bne _0808FA86
	adds r0, r6, #0
	movs r1, #0xc8
	bl Proc_Goto
	b _0808FC96
_0808FA86:
	movs r0, #0
	bl InitBgs
	bl InitFaces
	bl ResetText
	bl UnpackUiWindowFrameGraphics
	bl ApplySystemObjectsGraphics
	ldr r3, _0808FC30 @ =gDispIo
	movs r1, #4
	rsbs r1, r1, #0
	adds r0, r1, #0
	ldrb r2, [r3, #0xc]
	ands r0, r2
	strb r0, [r3, #0xc]
	adds r0, r1, #0
	ldrb r2, [r3, #0x10]
	ands r0, r2
	movs r2, #2
	orrs r0, r2
	strb r0, [r3, #0x10]
	ldrb r0, [r3, #0x14]
	ands r1, r0
	movs r0, #1
	orrs r1, r0
	strb r1, [r3, #0x14]
	movs r0, #3
	ldrb r1, [r3, #0x18]
	orrs r0, r1
	strb r0, [r3, #0x18]
	ldr r4, _0808FC34 @ =gPlaySt
	movs r0, #0xe
	ldrsb r0, [r4, r0]
	bl GetChapterInfo
	movs r1, #0
	ldrb r4, [r4, #0x1b]
	cmp r4, #3
	bne _0808FADC
	movs r1, #1
_0808FADC:
	adds r0, #0x80
	adds r0, r0, r1
	ldrb r0, [r0]
	str r0, [r6, #0x5c]
	movs r0, #0
	str r0, [sp]
	movs r0, #1
	movs r1, #4
	movs r2, #0xa
	movs r3, #0xc
	bl DrawUiFrame2
	ldr r0, _0808FC38 @ =0x00001131
	bl DecodeMsg
	ldr r5, _0808FC3C @ =gBg2Tm + 0x146
	movs r4, #8
	str r4, [sp]
	str r0, [sp, #4]
	movs r0, #0
	adds r1, r5, #0
	movs r2, #0
	movs r3, #0
	bl PutDrawText
	ldr r0, _0808FC40 @ =0x00001132
	bl DecodeMsg
	adds r1, r5, #0
	adds r1, #0x80
	str r4, [sp]
	str r0, [sp, #4]
	movs r0, #0
	movs r2, #0
	movs r3, #0
	bl PutDrawText
	ldr r0, _0808FC44 @ =0x0000113A
	bl DecodeMsg
	movs r2, #0x80
	lsls r2, r2, #1
	adds r1, r5, r2
	str r4, [sp]
	str r0, [sp, #4]
	movs r0, #0
	movs r2, #0
	movs r3, #0
	bl PutDrawText
	ldr r0, _0808FC48 @ =0x00001135
	bl DecodeMsg
	movs r2, #0xc0
	lsls r2, r2, #1
	adds r1, r5, r2
	str r4, [sp]
	str r0, [sp, #4]
	movs r0, #0
	movs r2, #0
	movs r3, #0
	bl PutDrawText
	ldr r0, _0808FC4C @ =0x00001134
	bl DecodeMsg
	movs r2, #0x80
	lsls r2, r2, #2
	adds r1, r5, r2
	str r4, [sp]
	str r0, [sp, #4]
	movs r0, #0
	movs r2, #0
	movs r3, #0
	bl PutDrawText
	ldr r0, _0808FC50 @ =Pal_0841D100
	movs r1, #0xf0
	lsls r1, r1, #1
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r0, _0808FC54 @ =Img_0841D120
	ldr r1, _0808FC58 @ =0x06005800
	bl Decompress
	ldr r0, _0808FC5C @ =gBg1Tm + 0x118
	ldr r1, _0808FC60 @ =Tsa_0841D614
	ldr r2, _0808FC64 @ =0x0000F2C0
	bl TmApplyTsa_thm
	adds r7, r6, #0
	adds r7, #0x4c
	movs r0, #0x64
	adds r0, r0, r6
	mov r8, r0
	ldr r5, _0808FC68 @ =gPrepMainMenuTexts + 0x28
	movs r4, #4
_0808FBA0:
	adds r0, r5, #0
	movs r1, #0xe
	bl InitText
	adds r5, #8
	subs r4, #1
	cmp r4, #0
	bge _0808FBA0
	ldr r0, _0808FC6C @ =Img_PrepScreenTitle
	ldr r1, _0808FC70 @ =0x06011000
	bl Decompress
	ldr r0, _0808FC74 @ =Pal_SysBrownBox
	movs r1, #0xf0
	lsls r1, r1, #2
	movs r2, #0x40
	bl ApplyPaletteExt
	movs r0, #2
	bl EnableBgSync
	movs r0, #0
	movs r1, #8
	bl StartPrepMuralBackground
	ldr r0, _0808FC78 @ =SpriteAnim_0841ECD0
	movs r2, #0x83
	lsls r2, r2, #3
	ldr r3, _0808FC7C @ =0x0000EC80
	movs r4, #0
	str r4, [sp]
	movs r1, #0xd
	str r1, [sp, #4]
	movs r1, #0x78
	bl StartSpriteAnimProc
	strh r4, [r7]
	movs r0, #0x80
	lsls r0, r0, #2
	movs r1, #3
	movs r2, #1
	bl InitTalk
	adds r0, r6, #0
	bl ResetSysHandCursor
	movs r0, #0xc0
	lsls r0, r0, #3
	movs r1, #1
	bl DisplaySysHandCursorTextShadow
	movs r0, #0xf0
	lsls r0, r0, #7
	movs r1, #2
	bl DrawAtMenuUpfx
	movs r0, #0xa0
	lsls r0, r0, #7
	movs r1, #4
	bl Prep_DrawChapterGoal
	ldr r0, _0808FC34 @ =gPlaySt
	ldrb r0, [r0, #0x1b]
	cmp r0, #1
	bne _0808FC80
	movs r0, #0xfa
	lsls r0, r0, #2
	adds r1, r6, #0
	bl StartPrepMenuDescHandler
	b _0808FC88
	.align 2, 0
_0808FC30: .4byte gDispIo
_0808FC34: .4byte gPlaySt
_0808FC38: .4byte 0x00001131
_0808FC3C: .4byte gBg2Tm + 0x146
_0808FC40: .4byte 0x00001132
_0808FC44: .4byte 0x0000113A
_0808FC48: .4byte 0x00001135
_0808FC4C: .4byte 0x00001134
_0808FC50: .4byte Pal_0841D100
_0808FC54: .4byte Img_0841D120
_0808FC58: .4byte 0x06005800
_0808FC5C: .4byte gBg1Tm + 0x118
_0808FC60: .4byte Tsa_0841D614
_0808FC64: .4byte 0x0000F2C0
_0808FC68: .4byte gPrepMainMenuTexts + 0x28
_0808FC6C: .4byte Img_PrepScreenTitle
_0808FC70: .4byte 0x06011000
_0808FC74: .4byte Pal_SysBrownBox
_0808FC78: .4byte SpriteAnim_0841ECD0
_0808FC7C: .4byte 0x0000EC80
_0808FC80:
	ldr r0, _0808FCA4 @ =0x000003E9
	adds r1, r6, #0
	bl StartPrepMenuDescHandler
_0808FC88:
	movs r0, #0
	mov r1, r8
	strh r0, [r1]
	ldr r0, _0808FCA8 @ =sub_808F8D0
	adds r1, r6, #0
	bl StartParallelWorker
_0808FC96:
	add sp, #8
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0808FCA4: .4byte 0x000003E9
_0808FCA8: .4byte sub_808F8D0

	thumb_func_start sub_808FCAC
sub_808FCAC: @ 0x0808FCAC
	ldr r3, _0808FCEC @ =gDispIo
	adds r2, r3, #0
	adds r2, #0x3c
	movs r0, #0x3f
	ldrb r1, [r2]
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r2]
	adds r1, r3, #0
	adds r1, #0x44
	movs r2, #0
	movs r0, #0xe
	strb r0, [r1]
	adds r1, #1
	movs r0, #8
	strb r0, [r1]
	adds r0, r3, #0
	adds r0, #0x46
	strb r2, [r0]
	ldr r0, _0808FCF0 @ =0x0000FFE0
	ldrh r2, [r3, #0x3c]
	ands r0, r2
	ldr r1, _0808FCF4 @ =0x0000E0FF
	ands r0, r1
	movs r2, #0x80
	lsls r2, r2, #4
	adds r1, r2, #0
	orrs r0, r1
	strh r0, [r3, #0x3c]
	bx lr
	.align 2, 0
_0808FCEC: .4byte gDispIo
_0808FCF0: .4byte 0x0000FFE0
_0808FCF4: .4byte 0x0000E0FF

	thumb_func_start sub_808FCF8
sub_808FCF8: @ 0x0808FCF8
	adds r2, r0, #0
	ldr r0, [r2, #0x58]
	movs r1, #0x10
	ands r0, r1
	cmp r0, #0
	bne _0808FD0C
	adds r1, r2, #0
	adds r1, #0x64
	movs r0, #1
	strh r0, [r1]
_0808FD0C:
	bx lr
	.align 2, 0

	thumb_func_start sub_808FD10
sub_808FD10: @ 0x0808FD10
	push {r4, lr}
	sub sp, #0x10
	adds r2, r0, #0
	ldr r0, [r2, #0x58]
	movs r1, #8
	ands r0, r1
	cmp r0, #0
	bne _0808FD2A
	adds r0, r2, #0
	movs r1, #1
	bl Proc_Goto
	b _0808FD68
_0808FD2A:
	movs r3, #0x80
	lsls r3, r3, #4
	movs r0, #0x14
	movs r1, #0x28
	movs r2, #6
	bl ShowSysHandCursor
	movs r4, #0
	str r4, [sp]
	movs r0, #0x20
	movs r1, #0xd4
	movs r2, #0x50
	movs r3, #0x82
	bl sub_8008DA8
	movs r3, #1
	rsbs r3, r3, #0
	ldr r0, _0808FD70 @ =0x00000FBF
	str r0, [sp]
	ldr r0, _0808FD74 @ =0x06011800
	str r0, [sp, #4]
	str r3, [sp, #8]
	str r4, [sp, #0xc]
	movs r0, #0x16
	movs r1, #0x12
	adds r2, r3, #0
	bl StartCgText
	ldr r0, _0808FD78 @ =0x0002000A
	bl SetCgTextFlags
_0808FD68:
	add sp, #0x10
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0808FD70: .4byte 0x00000FBF
_0808FD74: .4byte 0x06011800
_0808FD78: .4byte 0x0002000A

	thumb_func_start sub_808FD7C
sub_808FD7C: @ 0x0808FD7C
	push {r4, lr}
	sub sp, #0x10
	adds r2, r0, #0
	ldr r0, [r2, #0x58]
	movs r1, #4
	ands r0, r1
	cmp r0, #0
	bne _0808FD96
	adds r0, r2, #0
	movs r1, #2
	bl Proc_Goto
	b _0808FDD4
_0808FD96:
	movs r3, #0x80
	lsls r3, r3, #4
	movs r0, #0x14
	movs r1, #0x38
	movs r2, #6
	bl ShowSysHandCursor
	movs r4, #0
	str r4, [sp]
	movs r0, #0x4a
	movs r1, #0xd4
	movs r2, #0x50
	movs r3, #0x82
	bl sub_8008DA8
	movs r3, #1
	rsbs r3, r3, #0
	ldr r0, _0808FDDC @ =0x00000FB7
	str r0, [sp]
	ldr r0, _0808FDE0 @ =0x06011800
	str r0, [sp, #4]
	str r3, [sp, #8]
	str r4, [sp, #0xc]
	movs r0, #0x16
	movs r1, #0x12
	adds r2, r3, #0
	bl StartCgText
	ldr r0, _0808FDE4 @ =0x0002000A
	bl SetCgTextFlags
_0808FDD4:
	add sp, #0x10
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0808FDDC: .4byte 0x00000FB7
_0808FDE0: .4byte 0x06011800
_0808FDE4: .4byte 0x0002000A

	thumb_func_start sub_808FDE8
sub_808FDE8: @ 0x0808FDE8
	push {r4, r5, lr}
	sub sp, #0x10
	adds r2, r0, #0
	movs r5, #0
	ldr r1, [r2, #0x58]
	movs r0, #3
	ands r0, r1
	cmp r0, #0
	bne _0808FE04
	adds r0, r2, #0
	movs r1, #3
	bl Proc_Goto
	b _0808FE54
_0808FE04:
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0808FE0E
	ldr r5, _0808FE5C @ =0x00000FB8
_0808FE0E:
	movs r0, #2
	ands r1, r0
	cmp r1, #0
	beq _0808FE18
	ldr r5, _0808FE60 @ =0x00000FB9
_0808FE18:
	movs r3, #0x80
	lsls r3, r3, #4
	movs r0, #0x14
	movs r1, #0x48
	movs r2, #6
	bl ShowSysHandCursor
	movs r4, #0
	str r4, [sp]
	movs r0, #0x4b
	movs r1, #0xd4
	movs r2, #0x50
	movs r3, #0x82
	bl sub_8008DA8
	movs r3, #1
	rsbs r3, r3, #0
	str r5, [sp]
	ldr r0, _0808FE64 @ =0x06011800
	str r0, [sp, #4]
	str r3, [sp, #8]
	str r4, [sp, #0xc]
	movs r0, #0x16
	movs r1, #0x12
	adds r2, r3, #0
	bl StartCgText
	ldr r0, _0808FE68 @ =0x0002000A
	bl SetCgTextFlags
_0808FE54:
	add sp, #0x10
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0808FE5C: .4byte 0x00000FB8
_0808FE60: .4byte 0x00000FB9
_0808FE64: .4byte 0x06011800
_0808FE68: .4byte 0x0002000A

	thumb_func_start sub_808FE6C
sub_808FE6C: @ 0x0808FE6C
	push {r4, lr}
	sub sp, #0x10
	adds r2, r0, #0
	ldr r0, [r2, #0x58]
	movs r1, #0x10
	ands r0, r1
	cmp r0, #0
	bne _0808FE86
	adds r0, r2, #0
	movs r1, #0xa
	bl Proc_Goto
	b _0808FEC4
_0808FE86:
	movs r3, #0x80
	lsls r3, r3, #4
	movs r0, #0x14
	movs r1, #0x28
	movs r2, #6
	bl ShowSysHandCursor
	movs r4, #0
	str r4, [sp]
	movs r0, #0x4a
	movs r1, #0xd4
	movs r2, #0x50
	movs r3, #0x82
	bl sub_8008DA8
	movs r3, #1
	rsbs r3, r3, #0
	ldr r0, _0808FECC @ =0x00000FBE
	str r0, [sp]
	ldr r0, _0808FED0 @ =0x06011800
	str r0, [sp, #4]
	str r3, [sp, #8]
	str r4, [sp, #0xc]
	movs r0, #0x16
	movs r1, #0x12
	adds r2, r3, #0
	bl StartCgText
	ldr r0, _0808FED4 @ =0x0002000A
	bl SetCgTextFlags
_0808FEC4:
	add sp, #0x10
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0808FECC: .4byte 0x00000FBE
_0808FED0: .4byte 0x06011800
_0808FED4: .4byte 0x0002000A

	thumb_func_start sub_808FED8
sub_808FED8: @ 0x0808FED8
	adds r0, #0x64
	movs r1, #0
	strh r1, [r0]
	bx lr

	thumb_func_start sub_808FEE0
sub_808FEE0: @ 0x0808FEE0
	push {lr}
	bl EndCgText
	bl ClearTalk
	bl EndEachSpriteAnimProc
	bl EndPrepMuralBackground
	ldr r3, _0808FF50 @ =gDispIo
	movs r1, #4
	rsbs r1, r1, #0
	adds r0, r1, #0
	ldrb r2, [r3, #0xc]
	ands r0, r2
	strb r0, [r3, #0xc]
	adds r0, r1, #0
	ldrb r2, [r3, #0x10]
	ands r0, r2
	movs r2, #1
	orrs r0, r2
	strb r0, [r3, #0x10]
	ldrb r0, [r3, #0x14]
	ands r1, r0
	movs r0, #2
	orrs r1, r0
	strb r1, [r3, #0x14]
	movs r0, #3
	ldrb r1, [r3, #0x18]
	orrs r0, r1
	strb r0, [r3, #0x18]
	adds r1, r3, #0
	adds r1, #0x3c
	movs r0, #0xc0
	ldrb r2, [r1]
	orrs r0, r2
	strb r0, [r1]
	adds r0, r3, #0
	adds r0, #0x44
	movs r1, #0
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r1, r3, #0
	adds r1, #0x46
	movs r0, #0x10
	strb r0, [r1]
	ldr r0, _0808FF54 @ =0x0000FFE0
	ldrh r1, [r3, #0x3c]
	ands r0, r1
	movs r1, #0x1f
	orrs r0, r1
	strh r0, [r3, #0x3c]
	pop {r0}
	bx r0
	.align 2, 0
_0808FF50: .4byte gDispIo
_0808FF54: .4byte 0x0000FFE0

	thumb_func_start ConvoyPromotion_Init
ConvoyPromotion_Init: @ 0x0808FF58
	push {r4, r5, lr}
	adds r4, r0, #0
	movs r0, #0x28
	bl GetUnitFromCharId
	adds r5, r0, #0
	cmp r5, #0
	bne _0808FF70
	adds r0, r4, #0
	bl Proc_End
	b _0808FFB8
_0808FF70:
	bl GetGameLock
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r1, r4, #0
	adds r1, #0x4c
	movs r4, #0
	strh r0, [r1]
	ldr r2, _0808FFC0 @ =gDispIo
	movs r0, #0x21
	rsbs r0, r0, #0
	ldrb r1, [r2, #1]
	ands r0, r1
	movs r1, #0x41
	rsbs r1, r1, #0
	ands r0, r1
	movs r1, #0x7f
	ands r0, r1
	strb r0, [r2, #1]
	subs r1, #0x80
	adds r0, r5, #0
	movs r2, #0
	bl sub_802D06C
	ldr r1, _0808FFC4 @ =gBattleStats
	movs r0, #0x88
	lsls r0, r0, #1
	strh r0, [r1]
	ldr r0, _0808FFC8 @ =gBattleActor
	adds r0, #0x4a
	strh r4, [r0]
	ldr r0, _0808FFCC @ =gBattleTarget
	adds r0, #0x4a
	strh r4, [r0]
	bl BeginBattleAnimations
_0808FFB8:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0808FFC0: .4byte gDispIo
_0808FFC4: .4byte gBattleStats
_0808FFC8: .4byte gBattleActor
_0808FFCC: .4byte gBattleTarget

	thumb_func_start sub_808FFD0
sub_808FFD0: @ 0x0808FFD0
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r0, #0x4c
	movs r1, #0
	ldrsh r4, [r0, r1]
	bl GetGameLock
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r4, r0
	bne _0808FFEC
	adds r0, r5, #0
	bl Proc_Break
_0808FFEC:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start NullExpForChar100AndResetScreen
NullExpForChar100AndResetScreen: @ 0x0808FFF4
	push {lr}
	sub sp, #4
	movs r0, #0x28
	bl GetUnitFromCharId
	adds r1, r0, #0
	cmp r1, #0
	beq _08090008
	movs r0, #0xff
	strb r0, [r1, #9]
_08090008:
	ldr r2, _08090058 @ =gDispIo
	adds r1, r2, #0
	adds r1, #0x3c
	movs r0, #0xc0
	ldrb r3, [r1]
	orrs r0, r3
	strb r0, [r1]
	adds r0, r2, #0
	adds r0, #0x44
	movs r3, #0
	strb r3, [r0]
	adds r0, #1
	strb r3, [r0]
	adds r1, #0xa
	movs r0, #0x10
	strb r0, [r1]
	subs r0, #0x12
	ldrb r1, [r2, #1]
	ands r0, r1
	movs r1, #3
	rsbs r1, r1, #0
	ands r0, r1
	subs r1, #2
	ands r0, r1
	subs r1, #4
	ands r0, r1
	subs r1, #8
	ands r0, r1
	strb r0, [r2, #1]
	movs r2, #0x80
	lsls r2, r2, #1
	str r3, [sp]
	movs r0, #0x49
	adds r1, r2, #0
	movs r3, #0x20
	bl CallSomeSoundMaybe
	add sp, #4
	pop {r0}
	bx r0
	.align 2, 0
_08090058: .4byte gDispIo

	thumb_func_start PrepPromoteDebugMaybe
PrepPromoteDebugMaybe: @ 0x0809005C
	push {r4, lr}
	adds r4, r0, #0
	bl EndCgText
	bl ClearTalk
	bl EndEachSpriteAnimProc
	bl EndPrepMuralBackground
	ldr r3, _080900DC @ =gDispIo
	movs r1, #4
	rsbs r1, r1, #0
	adds r0, r1, #0
	ldrb r2, [r3, #0xc]
	ands r0, r2
	strb r0, [r3, #0xc]
	adds r0, r1, #0
	ldrb r2, [r3, #0x10]
	ands r0, r2
	movs r2, #1
	orrs r0, r2
	strb r0, [r3, #0x10]
	ldrb r0, [r3, #0x14]
	ands r1, r0
	movs r0, #2
	orrs r1, r0
	strb r1, [r3, #0x14]
	movs r0, #3
	ldrb r1, [r3, #0x18]
	orrs r0, r1
	strb r0, [r3, #0x18]
	adds r1, r3, #0
	adds r1, #0x3c
	movs r0, #0xc0
	ldrb r2, [r1]
	orrs r0, r2
	strb r0, [r1]
	adds r0, r3, #0
	adds r0, #0x44
	movs r1, #0
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r1, r3, #0
	adds r1, #0x46
	movs r0, #0x10
	strb r0, [r1]
	ldr r0, _080900E0 @ =0x0000FFE0
	ldrh r1, [r3, #0x3c]
	ands r0, r1
	movs r1, #0x1f
	orrs r0, r1
	strh r0, [r3, #0x3c]
	adds r0, r4, #0
	bl EndAllProcChildren
	ldr r0, _080900E4 @ =ProcScr_PrepPromoteDebug
	adds r1, r4, #0
	bl Proc_StartBlocking
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080900DC: .4byte gDispIo
_080900E0: .4byte 0x0000FFE0
_080900E4: .4byte ProcScr_PrepPromoteDebug

	thumb_func_start sub_80900E8
sub_80900E8: @ 0x080900E8
	push {lr}
	sub sp, #4
	movs r1, #0x80
	lsls r1, r1, #1
	movs r0, #0
	str r0, [sp]
	movs r2, #0
	movs r3, #0x20
	bl CallSomeSoundMaybe
	add sp, #4
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_8090104
sub_8090104: @ 0x08090104
	push {lr}
	ldr r0, _08090114 @ =ProcScr_AtUnkMenu
	movs r1, #3
	bl Proc_Start
	pop {r0}
	bx r0
	.align 2, 0
_08090114: .4byte ProcScr_AtUnkMenu

	thumb_func_start sub_8090118
sub_8090118: @ 0x08090118
	push {lr}
	ldr r0, _0809012C @ =ProcScr_AtUnkMenu
	bl Proc_Find
	cmp r0, #0
	beq _08090126
	movs r0, #1
_08090126:
	pop {r1}
	bx r1
	.align 2, 0
_0809012C: .4byte ProcScr_AtUnkMenu

	thumb_func_start sub_8090130
sub_8090130: @ 0x08090130
	push {lr}
	ldr r0, _08090144 @ =ProcScr_AtMenu
	bl Proc_Find
	cmp r0, #0
	beq _0809013E
	movs r0, #1
_0809013E:
	pop {r1}
	bx r1
	.align 2, 0
_08090144: .4byte ProcScr_AtMenu
