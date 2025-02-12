	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_80903FC
sub_80903FC: @ 0x080903FC
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r2, r0, #0
	adds r3, r2, #0
	subs r3, #0x38
	cmp r3, #0
	bge _08090412
	movs r7, #0
	adds r6, r2, #0
	b _08090428
_08090412:
	adds r0, r2, #0
	adds r0, #0x38
	cmp r0, #0xf0
	ble _08090422
	movs r7, #0xf
	adds r6, r2, #0
	subs r6, #0x78
	b _08090428
_08090422:
	asrs r7, r3, #3
	lsls r0, r7, #3
	subs r6, r2, r0
_08090428:
	adds r3, r1, #0
	subs r3, #0x28
	adds r0, r1, #0
	adds r0, #0x30
	cmp r0, #0xa0
	ble _0809043A
	movs r5, #8
	subs r1, #0x40
	b _0809044A
_0809043A:
	adds r0, r3, #0
	cmp r0, #0
	bge _08090444
	adds r0, r1, #0
	subs r0, #0x21
_08090444:
	asrs r5, r0, #3
	lsls r0, r5, #3
	subs r1, r1, r0
_0809044A:
	mov r8, r1
	ldr r4, _08090490 @ =gBg0Tm + 0x8
	adds r0, r4, #0
	movs r1, #2
	adds r2, r7, #0
	bl PutNumberOrBlank
	adds r0, r4, #0
	adds r0, #0x80
	movs r1, #2
	adds r2, r5, #0
	bl PutNumberOrBlank
	movs r1, #0x80
	lsls r1, r1, #1
	adds r0, r4, r1
	movs r1, #2
	adds r2, r6, #0
	bl PutNumberOrBlank
	movs r1, #0xc0
	lsls r1, r1, #1
	adds r0, r4, r1
	movs r1, #2
	mov r2, r8
	bl PutNumberOrBlank
	movs r0, #1
	bl EnableBgSync
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08090490: .4byte gBg0Tm + 0x8

	thumb_func_start PrepMenu_OnInit
PrepMenu_OnInit: @ 0x08090494
	push {r4, r5, lr}
	adds r5, r0, #0
	movs r2, #0
	movs r1, #7
	adds r0, #0x54
_0809049E:
	str r2, [r0]
	subs r0, #4
	subs r1, #1
	cmp r1, #0
	bge _0809049E
	movs r4, #0
	adds r0, r5, #0
	adds r0, #0x2a
	strb r4, [r0]
	adds r0, #1
	strb r4, [r0]
	adds r0, r5, #0
	bl ResetSysHandCursor
	movs r0, #0xc0
	lsls r0, r0, #3
	movs r1, #1
	bl DisplaySysHandCursorTextShadow
	str r4, [r5, #0x58]
	str r4, [r5, #0x5c]
	str r4, [r5, #0x60]
	adds r0, r5, #0
	adds r0, #0x29
	strb r4, [r0]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start PrepMenu_CtrlLoop
PrepMenu_CtrlLoop: @ 0x080904D8
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	adds r4, r0, #0
	adds r5, r4, #0
	adds r5, #0x2a
	ldrb r0, [r5]
	mov sb, r0
	movs r1, #0x34
	ldrsh r0, [r4, r1]
	adds r0, #1
	lsls r0, r0, #3
	adds r0, #4
	mov r8, r0
	movs r2, #0x36
	ldrsh r0, [r4, r2]
	adds r0, #1
	lsls r0, r0, #3
	mov r3, sb
	lsls r1, r3, #4
	adds r7, r0, r1
	movs r3, #0x80
	lsls r3, r3, #3
	mov r0, r8
	adds r1, r7, #0
	movs r2, #6
	bl ShowSysHandCursor
	ldrb r5, [r5]
	lsls r1, r5, #2
	adds r0, r4, #0
	adds r0, #0x38
	adds r0, r0, r1
	ldr r5, [r0]
	adds r6, r4, #0
	adds r6, #0x29
	movs r0, #0
	ldrsb r0, [r6, r0]
	cmp r0, #0
	beq _0809054C
	ldr r2, _08090548 @ =gpKeySt
	ldr r1, [r2]
	movs r0, #0x81
	lsls r0, r0, #1
	ldrh r1, [r1, #8]
	ands r0, r1
	adds r1, r2, #0
	cmp r0, #0
	bne _0809053E
	b _08090664
_0809053E:
	bl CloseHelpBox
	movs r0, #0
	strb r0, [r6]
	b _0809070C
	.align 2, 0
_08090548: .4byte gpKeySt
_0809054C:
	ldr r1, _08090574 @ =gpKeySt
	ldr r0, [r1]
	ldrh r3, [r0, #8]
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r3
	cmp r0, #0
	beq _08090578
	ldr r2, [r5, #0x30]
	cmp r2, #0
	bne _08090564
	b _0809070C
_08090564:
	mov r0, r8
	adds r1, r7, #0
	bl StartHelpBox
	movs r0, #1
	strb r0, [r6]
	b _0809070C
	.align 2, 0
_08090574: .4byte gpKeySt
_08090578:
	movs r6, #1
	adds r0, r6, #0
	ands r0, r3
	cmp r0, #0
	beq _080905C4
	adds r1, r5, #0
	adds r1, #0x38
	adds r0, r6, #0
	ldrb r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _08090648
	ldr r0, [r5, #0x2c]
	cmp r0, #0
	beq _08090648
	adds r0, r4, #0
	movs r1, #0
	bl Proc_Goto
	ldr r0, [r4, #0x14]
	ldr r1, [r5, #0x2c]
	bl _call_via_r1
	ldr r0, _080905BC @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	bge _080905B4
	b _0809070C
_080905B4:
	ldr r0, _080905C0 @ =0x0000038A
	bl m4aSongNumStart
	b _0809070C
	.align 2, 0
_080905BC: .4byte gPlaySt
_080905C0: .4byte 0x0000038A
_080905C4:
	movs r0, #2
	ands r0, r3
	cmp r0, #0
	beq _08090608
	ldr r1, [r4, #0x58]
	cmp r1, #0
	bne _080905D4
	b _0809070C
_080905D4:
	ldr r0, [r4, #0x14]
	bl _call_via_r1
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08090648
	adds r0, r4, #0
	movs r1, #0
	bl Proc_Goto
	ldr r0, _08090600 @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	bge _080905F6
	b _0809070C
_080905F6:
	ldr r0, _08090604 @ =0x0000038B
	bl m4aSongNumStart
	b _0809070C
	.align 2, 0
_08090600: .4byte gPlaySt
_08090604: .4byte 0x0000038B
_08090608:
	movs r0, #8
	ands r0, r3
	cmp r0, #0
	beq _08090664
	ldr r1, [r4, #0x5c]
	cmp r1, #0
	beq _0809070C
	ldr r0, [r4, #0x14]
	bl _call_via_r1
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08090648
	ldr r0, _08090640 @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08090634
	ldr r0, _08090644 @ =0x0000038A
	bl m4aSongNumStart
_08090634:
	adds r0, r4, #0
	movs r1, #0
	bl Proc_Goto
	b _0809070C
	.align 2, 0
_08090640: .4byte gPlaySt
_08090644: .4byte 0x0000038A
_08090648:
	ldr r0, _08090660 @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0809070C
	movs r0, #0xe3
	lsls r0, r0, #2
	bl m4aSongNumStart
	b _0809070C
	.align 2, 0
_08090660: .4byte gPlaySt
_08090664:
	ldr r3, [r1]
	movs r6, #0x40
	adds r0, r6, #0
	ldrh r2, [r3, #6]
	ands r0, r2
	adds r5, r4, #0
	adds r5, #0x2a
	cmp r0, #0
	beq _08090690
	ldrb r0, [r5]
	cmp r0, #0
	bne _0809068C
	adds r0, r6, #0
	ldrh r3, [r3, #8]
	ands r0, r3
	cmp r0, #0
	beq _08090690
	adds r0, r4, #0
	adds r0, #0x2b
	ldrb r0, [r0]
_0809068C:
	subs r0, #1
	strb r0, [r5]
_08090690:
	ldr r1, [r1]
	movs r2, #0x80
	adds r0, r2, #0
	ldrh r3, [r1, #6]
	ands r0, r3
	cmp r0, #0
	beq _080906BE
	ldrb r3, [r5]
	adds r0, r4, #0
	adds r0, #0x2b
	ldrb r0, [r0]
	subs r0, #1
	cmp r3, r0
	bge _080906B0
	adds r0, r3, #1
	b _080906BC
_080906B0:
	adds r0, r2, #0
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _080906BE
	movs r0, #0
_080906BC:
	strb r0, [r5]
_080906BE:
	ldrb r0, [r5]
	cmp sb, r0
	beq _0809070C
	ldr r0, _08090718 @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080906D6
	ldr r0, _0809071C @ =0x00000386
	bl m4aSongNumStart
_080906D6:
	adds r0, r4, #0
	adds r0, #0x29
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _0809070C
	movs r1, #0x34
	ldrsh r0, [r4, r1]
	adds r0, #1
	lsls r0, r0, #3
	adds r0, #4
	movs r2, #0x36
	ldrsh r1, [r4, r2]
	adds r1, #1
	lsls r1, r1, #3
	ldrb r3, [r5]
	lsls r2, r3, #4
	adds r1, r1, r2
	lsls r3, r3, #2
	adds r2, r4, #0
	adds r2, #0x38
	adds r2, r2, r3
	ldr r5, [r2]
	ldr r2, [r5, #0x30]
	bl StartHelpBox
_0809070C:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08090718: .4byte gPlaySt
_0809071C: .4byte 0x00000386

	thumb_func_start PrepMenu_ShowFrozenHand
PrepMenu_ShowFrozenHand: @ 0x08090720
	push {lr}
	adds r2, r0, #0
	movs r1, #0x34
	ldrsh r0, [r2, r1]
	adds r0, #1
	lsls r0, r0, #3
	adds r0, #4
	movs r3, #0x36
	ldrsh r1, [r2, r3]
	adds r1, #1
	lsls r1, r1, #3
	adds r2, #0x2a
	ldrb r2, [r2]
	lsls r2, r2, #4
	adds r1, r1, r2
	bl DisplayFrozenUiHand
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start PrepMenu_ShowActiveHand
PrepMenu_ShowActiveHand: @ 0x08090748
	push {lr}
	adds r2, r0, #0
	movs r1, #0x34
	ldrsh r0, [r2, r1]
	adds r0, #1
	lsls r0, r0, #3
	adds r0, #4
	movs r3, #0x36
	ldrsh r1, [r2, r3]
	adds r1, #1
	lsls r1, r1, #3
	adds r2, #0x2a
	ldrb r2, [r2]
	lsls r2, r2, #4
	adds r1, r1, r2
	movs r3, #0x80
	lsls r3, r3, #3
	movs r2, #6
	bl ShowSysHandCursor
	pop {r0}
	bx r0

	thumb_func_start PrepMenu_OnEnd
PrepMenu_OnEnd: @ 0x08090774
	push {lr}
	ldr r1, [r0, #0x60]
	cmp r1, #0
	beq _08090782
	ldr r0, [r0, #0x14]
	bl _call_via_r1
_08090782:
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start StartPrepScreenMenu
StartPrepScreenMenu: @ 0x08090788
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r4, _080907A8 @ =ProcScr_PrepMenu
	adds r0, r4, #0
	bl Proc_Find
	bl Proc_End
	adds r0, r4, #0
	adds r1, r5, #0
	bl Proc_Start
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080907A8: .4byte ProcScr_PrepMenu

	thumb_func_start SetPrepScreenMenuOnBPress
SetPrepScreenMenuOnBPress: @ 0x080907AC
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _080907C4 @ =ProcScr_PrepMenu
	bl Proc_Find
	cmp r0, #0
	beq _080907BC
	str r4, [r0, #0x58]
_080907BC:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080907C4: .4byte ProcScr_PrepMenu

	thumb_func_start SetPrepScreenMenuOnStartPress
SetPrepScreenMenuOnStartPress: @ 0x080907C8
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _080907E0 @ =ProcScr_PrepMenu
	bl Proc_Find
	cmp r0, #0
	beq _080907D8
	str r4, [r0, #0x5c]
_080907D8:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080907E0: .4byte ProcScr_PrepMenu

	thumb_func_start SetPrepScreenMenuOnEnd
SetPrepScreenMenuOnEnd: @ 0x080907E4
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _080907FC @ =ProcScr_PrepMenu
	bl Proc_Find
	cmp r0, #0
	beq _080907F4
	str r4, [r0, #0x60]
_080907F4:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080907FC: .4byte ProcScr_PrepMenu

	thumb_func_start SetPrepScreenMenuItem
SetPrepScreenMenuItem: @ 0x08090800
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	adds r6, r0, #0
	adds r7, r1, #0
	mov r8, r2
	mov sb, r3
	ldr r0, _08090850 @ =ProcScr_PrepMenu
	bl Proc_Find
	adds r1, r0, #0
	cmp r1, #0
	beq _08090894
	movs r4, #0
	movs r0, #0x38
	adds r0, r0, r1
	mov sl, r0
	mov r3, sl
_08090828:
	ldr r2, [r3]
	cmp r2, #0
	beq _08090854
	adds r0, r2, #0
	adds r0, #0x39
	ldrb r0, [r0]
	cmp r0, r6
	bne _08090854
	str r7, [r2, #0x2c]
	adds r0, r2, #0
	adds r0, #0x38
	mov r1, r8
	strb r1, [r0]
	ldr r0, [r3]
	mov r2, sb
	str r2, [r0, #0x34]
	ldr r1, [sp, #0x20]
	str r1, [r0, #0x30]
	b _08090894
	.align 2, 0
_08090850: .4byte ProcScr_PrepMenu
_08090854:
	adds r3, #4
	adds r4, #1
	cmp r4, #7
	ble _08090828
	adds r5, r1, #0
	adds r5, #0x2b
	ldrb r4, [r5]
	ldr r0, _080908A4 @ =ProcScr_PrepScreenMenuDummyItem
	bl Proc_Start
	lsls r1, r4, #2
	add r1, sl
	str r0, [r1]
	adds r0, #0x39
	strb r6, [r0]
	ldr r0, [r1]
	str r7, [r0, #0x2c]
	adds r0, #0x38
	mov r2, r8
	strb r2, [r0]
	ldr r0, [r1]
	mov r1, sb
	str r1, [r0, #0x34]
	ldr r2, [sp, #0x20]
	str r2, [r0, #0x30]
	adds r0, #0x3c
	movs r1, #7
	bl InitText
	ldrb r0, [r5]
	adds r0, #1
	strb r0, [r5]
_08090894:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080908A4: .4byte ProcScr_PrepScreenMenuDummyItem

	thumb_func_start SetPrepScreenMenuSelectedItem
SetPrepScreenMenuSelectedItem: @ 0x080908A8
	push {r4, r5, lr}
	adds r5, r0, #0
	movs r4, #0
	ldr r0, _080908D4 @ =ProcScr_PrepMenu
	bl Proc_Find
	cmp r0, #0
	beq _080908E2
	movs r2, #0
	adds r3, r0, #0
	adds r3, #0x2a
	adds r1, r0, #0
	adds r1, #0x38
_080908C2:
	ldr r0, [r1]
	cmp r0, #0
	beq _080908DA
	adds r0, #0x39
	ldrb r0, [r0]
	cmp r0, r5
	bne _080908D8
	strb r4, [r3]
	b _080908E2
	.align 2, 0
_080908D4: .4byte ProcScr_PrepMenu
_080908D8:
	adds r4, #1
_080908DA:
	adds r1, #4
	adds r2, #1
	cmp r2, #7
	ble _080908C2
_080908E2:
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start GetActivePrepMenuItemIndex
GetActivePrepMenuItemIndex: @ 0x080908E8
	push {r4, r5, lr}
	movs r4, #0
	ldr r0, _08090918 @ =ProcScr_PrepMenu
	bl Proc_Find
	cmp r0, #0
	beq _08090926
	movs r3, #0
	movs r1, #0x2a
	adds r1, r1, r0
	mov ip, r1
	adds r2, r0, #0
	adds r2, #0x38
_08090902:
	ldr r1, [r2]
	cmp r1, #0
	beq _0809091E
	mov r5, ip
	ldrb r0, [r5]
	cmp r0, r4
	bne _0809091C
	adds r0, r1, #0
	adds r0, #0x39
	ldrb r0, [r0]
	b _08090928
	.align 2, 0
_08090918: .4byte ProcScr_PrepMenu
_0809091C:
	adds r4, #1
_0809091E:
	adds r2, #4
	adds r3, #1
	cmp r3, #7
	ble _08090902
_08090926:
	movs r0, #0
_08090928:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start DrawPrepScreenMenuFrameAt
DrawPrepScreenMenuFrameAt: @ 0x08090930
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #8
	adds r6, r0, #0
	adds r5, r1, #0
	ldr r0, _080909D4 @ =ProcScr_PrepMenu
	bl Proc_Find
	mov sb, r0
	cmp r0, #0
	beq _080909C6
	movs r0, #0
	mov r1, sb
	strh r6, [r1, #0x34]
	strh r5, [r1, #0x36]
	mov r4, sb
	adds r4, #0x2b
	ldrb r1, [r4]
	lsls r3, r1, #1
	adds r3, #2
	str r0, [sp]
	adds r0, r6, #0
	adds r1, r5, #0
	movs r2, #0xa
	bl DrawUiFrame2
	mov r8, r4
	ldrb r0, [r4]
	cmp r0, #1
	bls _080909C0
	movs r7, #0
	adds r1, r0, #0
	cmp r7, r1
	bge _080909C0
	adds r0, r5, #1
	lsls r0, r0, #5
	adds r0, #2
	adds r6, r0, r6
_08090980:
	lsls r1, r7, #2
	mov r0, sb
	adds r0, #0x38
	adds r0, r0, r1
	ldr r4, [r0]
	adds r5, r4, #0
	adds r5, #0x3c
	adds r0, r5, #0
	bl ClearText
	ldr r0, [r4, #0x34]
	bl DecodeMsg
	lsls r1, r6, #1
	ldr r2, _080909D8 @ =gBg0Tm
	adds r1, r1, r2
	adds r4, #0x38
	movs r2, #1
	ldrb r4, [r4]
	ands r2, r4
	movs r3, #0
	str r3, [sp]
	str r0, [sp, #4]
	adds r0, r5, #0
	bl PutDrawText
	adds r6, #0x40
	adds r7, #1
	mov r0, r8
	ldrb r0, [r0]
	cmp r7, r0
	blt _08090980
_080909C0:
	movs r0, #3
	bl EnableBgSync
_080909C6:
	add sp, #8
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080909D4: .4byte ProcScr_PrepMenu
_080909D8: .4byte gBg0Tm

	thumb_func_start GetPrepMenuItemAmt
GetPrepMenuItemAmt: @ 0x080909DC
	push {lr}
	ldr r0, _080909EC @ =ProcScr_PrepMenu
	bl Proc_Find
	cmp r0, #0
	bne _080909F0
	movs r0, #0
	b _080909F4
	.align 2, 0
_080909EC: .4byte ProcScr_PrepMenu
_080909F0:
	adds r0, #0x2b
	ldrb r0, [r0]
_080909F4:
	pop {r1}
	bx r1

	thumb_func_start EndPrepScreenMenu
EndPrepScreenMenu: @ 0x080909F8
	push {r4, lr}
	ldr r0, _08090A18 @ =ProcScr_PrepMenu
	bl Proc_Find
	adds r4, r0, #0
	cmp r4, #0
	beq _08090A12
	bl sub_8090A1C
	adds r0, r4, #0
	movs r1, #0xa
	bl Proc_Goto
_08090A12:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08090A18: .4byte ProcScr_PrepMenu

	thumb_func_start sub_8090A1C
sub_8090A1C: @ 0x08090A1C
	push {r4, r5, lr}
	ldr r0, _08090A7C @ =ProcScr_PrepMenu
	bl Proc_Find
	adds r4, r0, #0
	cmp r4, #0
	beq _08090A74
	movs r1, #0x36
	ldrsh r0, [r4, r1]
	lsls r0, r0, #5
	movs r2, #0x34
	ldrsh r1, [r4, r2]
	adds r0, r0, r1
	lsls r0, r0, #1
	ldr r1, _08090A80 @ =gBg0Tm
	adds r0, r0, r1
	adds r5, r4, #0
	adds r5, #0x2b
	ldrb r1, [r5]
	lsls r2, r1, #1
	adds r2, #2
	movs r1, #9
	movs r3, #0
	bl TmFillRect_thm
	movs r2, #0x36
	ldrsh r0, [r4, r2]
	lsls r0, r0, #5
	movs r2, #0x34
	ldrsh r1, [r4, r2]
	adds r0, r0, r1
	lsls r0, r0, #1
	ldr r1, _08090A84 @ =gBg1Tm
	adds r0, r0, r1
	ldrb r5, [r5]
	lsls r2, r5, #1
	adds r2, #2
	movs r1, #9
	movs r3, #0
	bl TmFillRect_thm
	movs r0, #3
	bl EnableBgSync
_08090A74:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08090A7C: .4byte ProcScr_PrepMenu
_08090A80: .4byte gBg0Tm
_08090A84: .4byte gBg1Tm

	thumb_func_start sub_8090A88
sub_8090A88: @ 0x08090A88
	push {lr}
	ldr r0, _08090A98 @ =ProcScr_PrepMenu
	bl Proc_Find
	cmp r0, #0
	bne _08090A9C
	movs r0, #0
	b _08090A9E
	.align 2, 0
_08090A98: .4byte ProcScr_PrepMenu
_08090A9C:
	movs r0, #1
_08090A9E:
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_8090AA4
sub_8090AA4: @ 0x08090AA4
	push {lr}
	ldr r0, _08090ABC @ =ProcScr_PrepMenu
	bl Proc_Find
	cmp r0, #0
	beq _08090AB6
	movs r1, #2
	bl Proc_Goto
_08090AB6:
	pop {r0}
	bx r0
	.align 2, 0
_08090ABC: .4byte ProcScr_PrepMenu

	thumb_func_start sub_8090AC0
sub_8090AC0: @ 0x08090AC0
	push {lr}
	ldr r0, _08090AD8 @ =ProcScr_PrepMenu
	bl Proc_Find
	cmp r0, #0
	beq _08090AD2
	movs r1, #0
	bl Proc_Goto
_08090AD2:
	pop {r0}
	bx r0
	.align 2, 0
_08090AD8: .4byte ProcScr_PrepMenu

	thumb_func_start EnablePrepScreenMenu
EnablePrepScreenMenu: @ 0x08090ADC
	push {lr}
	ldr r0, _08090AF4 @ =ProcScr_PrepMenu
	bl Proc_Find
	cmp r0, #0
	beq _08090AEE
	movs r1, #1
	bl Proc_Goto
_08090AEE:
	pop {r0}
	bx r0
	.align 2, 0
_08090AF4: .4byte ProcScr_PrepMenu
