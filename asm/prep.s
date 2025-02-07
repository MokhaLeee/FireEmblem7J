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
	bl sub_804A7EC
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
	bl sub_804A4CC
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

	thumb_func_start sub_8090AF8
sub_8090AF8: @ 0x08090AF8
	adds r3, r0, #0
	movs r2, #0
	movs r1, #0
	strh r1, [r3, #0x2a]
	adds r0, #0x2c
	strb r2, [r0]
	adds r0, #1
	strb r2, [r0]
	strh r1, [r3, #0x2e]
	strh r1, [r3, #0x32]
	adds r0, #7
	strb r2, [r0]
	ldrh r0, [r3, #0x2e]
	strh r0, [r3, #0x30]
	movs r0, #0xe4
	lsls r0, r0, #2
	strh r0, [r3, #0x36]
	movs r0, #0x80
	lsls r0, r0, #5
	strh r0, [r3, #0x38]
	adds r0, r3, #0
	adds r0, #0x3a
	strb r2, [r0]
	adds r0, #1
	strb r2, [r0]
	bx lr

	thumb_func_start sub_8090B2C
sub_8090B2C: @ 0x08090B2C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x1c
	adds r4, r0, #0
	ldrh r0, [r4, #0x38]
	ldrh r1, [r4, #0x36]
	adds r0, r0, r1
	mov sb, r0
	adds r0, r4, #0
	adds r0, #0x34
	ldrh r2, [r4, #0x32]
	ldrb r0, [r0]
	cmp r2, r0
	bhi _08090B50
	b _08090D62
_08090B50:
	movs r6, #0
	adds r0, r4, #0
	adds r0, #0x2d
	mov sl, r0
	adds r3, r4, #0
	adds r3, #0x3a
	str r3, [sp, #0x14]
	adds r5, r4, #0
	adds r5, #0x3b
	str r5, [sp, #0x18]
	ldrb r0, [r0]
	cmp r6, r0
	bge _08090B8C
_08090B6A:
	ldrh r1, [r4, #0x2a]
	adds r0, r4, #0
	adds r0, #0x2c
	lsls r2, r6, #3
	ldrb r0, [r0]
	adds r2, r0, r2
	mov r3, sb
	str r3, [sp]
	movs r0, #4
	ldr r3, _08090C74 @ =gUnk_08D8C73C
	bl PutSpriteExt
	adds r6, #1
	mov r5, sl
	ldrb r5, [r5]
	cmp r6, r5
	blt _08090B6A
_08090B8C:
	cmp r6, #0
	bne _08090B92
	b _08090D10
_08090B92:
	mov r6, sl
	ldrb r6, [r6]
	lsls r7, r6, #0x13
	ldrh r0, [r4, #0x2e]
	str r0, [sp, #0xc]
	ldrh r5, [r4, #0x32]
	adds r0, r4, #0
	adds r0, #0x34
	ldrb r6, [r0]
	str r0, [sp, #0x10]
	movs r1, #0x2c
	adds r1, r1, r4
	mov r8, r1
	cmp r5, r6
	bhi _08090BB2
	b _08090CE4
_08090BB2:
	adds r0, r7, #0
	adds r1, r5, #0
	bl __udivsi3
	str r0, [sp, #4]
	adds r0, r7, #0
	muls r0, r6, r0
	adds r1, r5, #0
	bl __udivsi3
	str r0, [sp, #8]
	ldr r2, [sp, #0xc]
	cmp r2, #0
	beq _08090BF2
	ldrh r3, [r4, #0x2a]
	ldr r5, _08090C78 @ =0x00002001
	adds r1, r3, r5
	mov r6, r8
	ldrb r2, [r6]
	subs r2, #8
	ldr r3, _08090C7C @ =gUnk_08D8C7E8
	ldr r5, [sp, #0x14]
	ldrb r5, [r5]
	lsrs r0, r5, #3
	lsls r0, r0, #2
	adds r0, r0, r3
	ldr r3, [r0]
	mov r6, sb
	str r6, [sp]
	movs r0, #4
	bl PutSpriteExt
_08090BF2:
	movs r6, #0
	ldr r0, [sp, #8]
	lsrs r5, r0, #0x13
	cmp r6, r5
	bhs _08090C28
	ldr r1, [sp, #4]
	ldr r2, [sp, #0xc]
	adds r0, r1, #0
	muls r0, r2, r0
	lsrs r7, r0, #0x14
_08090C06:
	ldrh r1, [r4, #0x2a]
	adds r1, #1
	mov r3, r8
	ldrb r3, [r3]
	adds r2, r3, r7
	lsls r0, r6, #3
	adds r2, r2, r0
	ldr r0, _08090C80 @ =gUnk_08D8C794
	ldr r3, [r0, #0x20]
	mov r0, sb
	str r0, [sp]
	movs r0, #4
	bl PutSpriteExt
	adds r6, #1
	cmp r6, r5
	blo _08090C06
_08090C28:
	ldrh r1, [r4, #0x2e]
	lsrs r0, r1, #4
	ldr r2, [sp, #0x10]
	ldrb r2, [r2]
	adds r0, r2, r0
	ldrh r3, [r4, #0x32]
	cmp r0, r3
	bne _08090C84
	mov r5, sl
	ldrb r5, [r5]
	lsls r0, r5, #3
	ldr r2, [sp, #4]
	ldr r3, [sp, #0xc]
	adds r1, r2, #0
	muls r1, r3, r1
	lsrs r2, r1, #0x14
	lsls r3, r6, #3
	adds r1, r2, r3
	subs r0, r0, r1
	cmp r0, #0
	beq _08090CE4
	ldrh r1, [r4, #0x2a]
	adds r1, #1
	mov r5, r8
	ldrb r5, [r5]
	adds r2, r5, r2
	adds r2, r2, r3
	ldr r3, _08090C80 @ =gUnk_08D8C794
	lsls r0, r0, #2
	adds r0, r0, r3
	ldr r3, [r0]
	mov r6, sb
	str r6, [sp]
	movs r0, #4
	bl PutSpriteExt
	b _08090CE4
	.align 2, 0
_08090C74: .4byte gUnk_08D8C73C
_08090C78: .4byte 0x00002001
_08090C7C: .4byte gUnk_08D8C7E8
_08090C80: .4byte gUnk_08D8C794
_08090C84:
	ldr r0, [sp, #8]
	lsrs r5, r0, #0x10
	movs r0, #7
	ands r5, r0
	cmp r5, #0
	beq _08090CBA
	ldrh r1, [r4, #0x2a]
	adds r1, #1
	ldr r3, [sp, #4]
	ldr r0, [sp, #0xc]
	adds r2, r3, #0
	muls r2, r0, r2
	lsrs r2, r2, #0x14
	mov r3, r8
	ldrb r3, [r3]
	adds r2, r3, r2
	lsls r0, r6, #3
	adds r2, r2, r0
	ldr r3, _08090D74 @ =gUnk_08D8C794
	lsls r0, r5, #2
	adds r0, r0, r3
	ldr r3, [r0]
	mov r5, sb
	str r5, [sp]
	movs r0, #4
	bl PutSpriteExt
_08090CBA:
	ldrh r1, [r4, #0x2a]
	adds r1, #1
	mov r6, sl
	ldrb r6, [r6]
	lsls r2, r6, #3
	mov r0, r8
	ldrb r0, [r0]
	adds r2, r0, r2
	adds r2, #1
	ldr r3, _08090D78 @ =gUnk_08D8C7E8
	ldr r5, [sp, #0x18]
	ldrb r5, [r5]
	lsrs r0, r5, #3
	lsls r0, r0, #2
	adds r0, r0, r3
	ldr r3, [r0]
	mov r6, sb
	str r6, [sp]
	movs r0, #4
	bl PutSpriteExt
_08090CE4:
	ldrh r1, [r4, #0x2a]
	mov r0, r8
	ldrb r2, [r0]
	subs r2, #8
	ldr r3, _08090D7C @ =gUnk_08D8C744
	mov r5, sb
	str r5, [sp]
	movs r0, #4
	bl PutSpriteExt
	ldrh r1, [r4, #0x2a]
	mov r6, sl
	ldrb r6, [r6]
	lsls r2, r6, #3
	mov r0, r8
	ldrb r0, [r0]
	adds r2, r0, r2
	ldr r3, _08090D80 @ =gUnk_08D8C74C
	str r5, [sp]
	movs r0, #4
	bl PutSpriteExt
_08090D10:
	ldrh r1, [r4, #0x30]
	ldrh r0, [r4, #0x2e]
	cmp r1, r0
	beq _08090D38
	cmp r1, r0
	bls _08090D24
	ldr r1, [sp, #0x14]
	ldrb r0, [r1]
	adds r0, #3
	strb r0, [r1]
_08090D24:
	ldrh r2, [r4, #0x30]
	ldrh r3, [r4, #0x2e]
	cmp r2, r3
	bhs _08090D34
	ldr r5, [sp, #0x18]
	ldrb r0, [r5]
	adds r0, #3
	strb r0, [r5]
_08090D34:
	ldrh r0, [r4, #0x2e]
	strh r0, [r4, #0x30]
_08090D38:
	ldr r6, [sp, #0x14]
	ldrb r0, [r6]
	adds r0, #1
	movs r1, #0
	strb r0, [r6]
	ldr r2, [sp, #0x18]
	ldrb r0, [r2]
	adds r0, #1
	strb r0, [r2]
	ldrb r3, [r6]
	lsrs r0, r3, #3
	cmp r0, #5
	bls _08090D54
	strb r1, [r6]
_08090D54:
	ldr r5, [sp, #0x18]
	ldrb r5, [r5]
	lsrs r0, r5, #3
	cmp r0, #5
	bls _08090D62
	ldr r6, [sp, #0x18]
	strb r1, [r6]
_08090D62:
	add sp, #0x1c
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08090D74: .4byte gUnk_08D8C794
_08090D78: .4byte gUnk_08D8C7E8
_08090D7C: .4byte gUnk_08D8C744
_08090D80: .4byte gUnk_08D8C74C

	thumb_func_start sub_8090D84
sub_8090D84: @ 0x08090D84
	push {lr}
	ldr r0, _08090D9C @ =gUnk_08D8C8AC
	bl Proc_Find
	cmp r0, #0
	beq _08090D96
	movs r1, #1
	bl Proc_Goto
_08090D96:
	pop {r0}
	bx r0
	.align 2, 0
_08090D9C: .4byte gUnk_08D8C8AC

	thumb_func_start sub_8090DA0
sub_8090DA0: @ 0x08090DA0
	push {lr}
	ldr r0, _08090DB8 @ =gUnk_08D8C8AC
	bl Proc_Find
	cmp r0, #0
	beq _08090DB2
	movs r1, #0
	bl Proc_Goto
_08090DB2:
	pop {r0}
	bx r0
	.align 2, 0
_08090DB8: .4byte gUnk_08D8C8AC

	thumb_func_start sub_8090DBC
sub_8090DBC: @ 0x08090DBC
	push {lr}
	ldr r0, _08090DCC @ =gUnk_08D8C8AC
	bl Proc_Find
	bl Proc_End
	pop {r0}
	bx r0
	.align 2, 0
_08090DCC: .4byte gUnk_08D8C8AC

	thumb_func_start sub_8090DD0
sub_8090DD0: @ 0x08090DD0
	push {lr}
	adds r1, r0, #0
	ldr r0, _08090DE0 @ =gUnk_08D8C8AC
	bl Proc_Start
	pop {r1}
	bx r1
	.align 2, 0
_08090DE0: .4byte gUnk_08D8C8AC

	thumb_func_start sub_8090DE4
sub_8090DE4: @ 0x08090DE4
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r0, _08090E00 @ =gUnk_08D8C8AC
	bl Proc_Find
	cmp r0, #0
	beq _08090DFA
	strh r4, [r0, #0x2a]
	adds r0, #0x2c
	strb r5, [r0]
_08090DFA:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08090E00: .4byte gUnk_08D8C8AC

	thumb_func_start sub_8090E04
sub_8090E04: @ 0x08090E04
	push {r4, r5, r6, r7, lr}
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	lsls r1, r1, #0x10
	lsrs r6, r1, #0x10
	lsls r2, r2, #0x10
	lsrs r4, r2, #0x10
	lsls r3, r3, #0x18
	lsrs r5, r3, #0x18
	ldr r0, _08090E34 @ =gUnk_08D8C8AC
	bl Proc_Find
	cmp r0, #0
	beq _08090E2E
	adds r1, r0, #0
	adds r1, #0x2d
	strb r7, [r1]
	strh r6, [r0, #0x2e]
	strh r4, [r0, #0x32]
	adds r0, #0x34
	strb r5, [r0]
_08090E2E:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08090E34: .4byte gUnk_08D8C8AC

	thumb_func_start sub_8090E38
sub_8090E38: @ 0x08090E38
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r0, _08090E70 @ =gUnk_0841E084
	adds r1, #0x10
	lsls r1, r1, #5
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r0, _08090E74 @ =gUnk_0841DFE0
	ldr r2, _08090E78 @ =0x06010000
	adds r1, r4, r2
	bl Decompress
	ldr r0, _08090E7C @ =gUnk_08D8C8AC
	bl Proc_Find
	adds r2, r0, #0
	cmp r2, #0
	beq _08090E68
	asrs r0, r4, #5
	strh r0, [r2, #0x36]
	lsls r0, r5, #0xc
	strh r0, [r2, #0x38]
_08090E68:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08090E70: .4byte gUnk_0841E084
_08090E74: .4byte gUnk_0841DFE0
_08090E78: .4byte 0x06010000
_08090E7C: .4byte gUnk_08D8C8AC

	thumb_func_start sub_8090E80
sub_8090E80: @ 0x08090E80
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r4, r0, #0
	mov r8, r1
	adds r5, r2, #0
	adds r6, r3, #0
	ldr r7, [sp, #0x18]
	bl ClearText
	adds r0, r4, #0
	adds r1, r5, #0
	bl Text_SetColor
	adds r0, r4, #0
	adds r1, r6, #0
	bl Text_SetCursor
	adds r0, r4, #0
	adds r1, r7, #0
	bl Text_DrawString
	adds r0, r4, #0
	mov r1, r8
	bl PutText
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_8090EC0
sub_8090EC0: @ 0x08090EC0
	push {r4, lr}
	adds r3, r0, #0
	ldr r4, _08090ED4 @ =0x02012466
	ldrh r0, [r4]
	adds r2, r0, #0
	cmp r2, #0
	bne _08090ED8
	strb r2, [r3]
	strh r2, [r1]
	b _08090F0C
	.align 2, 0
_08090ED4: .4byte 0x02012466
_08090ED8:
	cmp r2, #7
	bhi _08090EEA
	ldrb r4, [r3]
	cmp r4, r2
	blo _08090EE6
	subs r0, #1
	strb r0, [r3]
_08090EE6:
	movs r0, #0
	b _08090F0A
_08090EEA:
	ldrh r2, [r1]
	lsrs r0, r2, #4
	adds r2, r0, #7
	ldrh r0, [r4]
	cmp r2, r0
	bge _08090F02
	ldrb r4, [r3]
	cmp r4, #6
	bne _08090F0C
	movs r0, #5
	strb r0, [r3]
	b _08090F0C
_08090F02:
	cmp r2, r0
	ble _08090F0C
	subs r0, #7
	lsls r0, r0, #4
_08090F0A:
	strh r0, [r1]
_08090F0C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_8090F14
sub_8090F14: @ 0x08090F14
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	adds r6, r0, #0
	ldr r4, _08090FC8 @ =gBg3Tm
	adds r0, r4, #0
	movs r1, #0
	bl TmFill
	bl GetGameTime
	movs r0, #0
	strh r0, [r6, #0x2a]
	movs r7, #0
	mov sl, r4
	movs r0, #0x2d
	adds r0, r0, r6
	mov sb, r0
	adds r1, r6, #0
	adds r1, #0x2c
	str r1, [sp]
_08090F44:
	movs r5, #0
	adds r3, r7, #1
	mov r8, r3
_08090F4A:
	ldrh r0, [r6, #0x2a]
	lsrs r4, r0, #3
	adds r4, r7, r4
	adds r0, r4, #0
	movs r1, #0x28
	bl __modsi3
	movs r1, #0x27
	subs r1, r1, r0
	movs r0, #0x1f
	ands r4, r0
	lsls r4, r4, #6
	lsls r2, r5, #1
	adds r4, r4, r2
	add r4, sl
	lsls r0, r1, #4
	subs r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _08090FCC @ =gUnk_08426FF2
	adds r0, r0, r1
	adds r2, r2, r0
	mov r3, sb
	ldrb r3, [r3]
	lsls r0, r3, #0xc
	ldrh r2, [r2]
	adds r0, r2, r0
	strh r0, [r4]
	adds r0, r5, #1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	cmp r5, #0x1d
	bls _08090F4A
	mov r1, r8
	lsls r0, r1, #0x10
	lsrs r7, r0, #0x10
	cmp r7, #0x1f
	bls _08090F44
	movs r0, #8
	bl EnableBgSync
	movs r0, #0
	ldr r3, [sp]
	strb r0, [r3]
	movs r4, #0xff
	adds r2, r4, #0
	ldrh r0, [r6, #0x2a]
	ands r2, r0
	movs r0, #3
	movs r1, #0
	bl SetBgOffset
	ldr r0, _08090FD0 @ =0x0400001E
	ldrh r6, [r6, #0x2a]
	ands r4, r6
	strh r4, [r0]
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08090FC8: .4byte gBg3Tm
_08090FCC: .4byte gUnk_08426FF2
_08090FD0: .4byte 0x0400001E

	thumb_func_start sub_8090FD4
sub_8090FD4: @ 0x08090FD4
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	adds r6, r0, #0
	adds r5, r6, #0
	adds r5, #0x2c
	ldrb r0, [r5]
	cmp r0, #3
	bne _08091018
	ldrh r0, [r6, #0x2a]
	adds r0, #1
	strh r0, [r6, #0x2a]
	lsls r0, r0, #0x10
	movs r1, #0xa0
	lsls r1, r1, #0x13
	cmp r0, r1
	bne _08090FFC
	movs r0, #0
	strh r0, [r6, #0x2a]
_08090FFC:
	movs r4, #0xff
	adds r2, r4, #0
	ldrh r1, [r6, #0x2a]
	ands r2, r1
	movs r0, #3
	movs r1, #0
	bl SetBgOffset
	ldr r0, _080910A4 @ =0x0400001E
	ldrh r7, [r6, #0x2a]
	ands r4, r7
	strh r4, [r0]
	movs r0, #0
	strb r0, [r5]
_08091018:
	adds r1, r6, #0
	adds r1, #0x2c
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	ldrh r1, [r6, #0x2a]
	movs r0, #7
	ands r0, r1
	cmp r0, #0
	bne _08091098
	ldr r5, _080910A8 @ =gUnk_08426FF2
	lsrs r0, r1, #3
	subs r4, r0, #1
	movs r1, #0x1f
	ands r4, r1
	adds r0, #0x1f
	movs r1, #0x28
	bl __modsi3
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r3, #0
	ldr r1, _080910AC @ =gBg3Tm
	mov r8, r1
	lsls r4, r4, #6
	movs r1, #0x27
	subs r1, r1, r0
	lsls r0, r1, #4
	subs r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r5
	mov sb, r0
	mov ip, r8
	adds r5, r6, #0
	adds r5, #0x2d
	adds r6, r4, #0
_08091060:
	lsls r1, r3, #1
	adds r2, r4, r1
	add r2, ip
	add r1, sb
	ldrb r7, [r5]
	lsls r0, r7, #0xc
	ldrh r1, [r1]
	adds r0, r1, r0
	strh r0, [r2]
	adds r0, r3, #1
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	cmp r3, #0x1d
	bls _08091060
	mov r0, r8
	adds r4, r6, r0
	movs r0, #3
	bl GetBgTilemapOffset
	adds r1, r0, #0
	movs r0, #0xc0
	lsls r0, r0, #0x13
	adds r0, r6, r0
	adds r1, r1, r0
	adds r0, r4, #0
	movs r2, #0xf
	bl CpuFastSet
_08091098:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080910A4: .4byte 0x0400001E
_080910A8: .4byte gUnk_08426FF2
_080910AC: .4byte gBg3Tm

	thumb_func_start StartPrepMuralBackground
StartPrepMuralBackground: @ 0x080910B0
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	adds r5, r1, #0
	ldr r4, _080910F8 @ =gUnk_08421C64
	movs r0, #3
	bl GetBgChrOffset
	adds r1, r0, #0
	movs r0, #0xc0
	lsls r0, r0, #0x13
	adds r1, r1, r0
	adds r0, r4, #0
	bl Decompress
	ldr r0, _080910FC @ =gUnk_08427954
	lsls r1, r5, #5
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r4, _08091100 @ =gUnk_08D8C8E4
	adds r0, r4, #0
	bl Proc_Find
	bl Proc_End
	adds r0, r4, #0
	adds r1, r6, #0
	bl Proc_Start
	adds r1, r0, #0
	adds r1, #0x2d
	strb r5, [r1]
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_080910F8: .4byte gUnk_08421C64
_080910FC: .4byte gUnk_08427954
_08091100: .4byte gUnk_08D8C8E4

	thumb_func_start EndPrepMuralBackground
EndPrepMuralBackground: @ 0x08091104
	push {lr}
	ldr r0, _08091114 @ =gUnk_08D8C8E4
	bl Proc_Find
	bl Proc_End
	pop {r0}
	bx r0
	.align 2, 0
_08091114: .4byte gUnk_08D8C8E4

	thumb_func_start sub_8091118
sub_8091118: @ 0x08091118
	ldr r0, _08091130 @ =0x04000006
	ldrh r0, [r0]
	adds r3, r0, #0
	cmp r3, #0xa0
	bne _08091138
	movs r3, #0
	ldr r0, _08091134 @ =0x02012968
	ldr r2, [r0]
	ldr r1, [r0, #4]
	str r1, [r0]
	str r2, [r0, #4]
	b _08091140
	.align 2, 0
_08091130: .4byte 0x04000006
_08091134: .4byte 0x02012968
_08091138:
	ldr r0, _08091154 @ =0x02012968
	cmp r3, #0xa0
	bls _08091140
	movs r3, #0
_08091140:
	ldr r2, _08091158 @ =0x04000042
	ldr r0, [r0]
	lsls r1, r3, #2
	adds r1, r1, r0
	ldrb r3, [r1]
	lsls r0, r3, #8
	ldrb r1, [r1, #1]
	orrs r0, r1
	strh r0, [r2]
	bx lr
	.align 2, 0
_08091154: .4byte 0x02012968
_08091158: .4byte 0x04000042

	thumb_func_start sub_809115C
sub_809115C: @ 0x0809115C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	adds r4, r0, #0
	ldr r2, _080911D8 @ =gDispIo
	movs r0, #0x21
	rsbs r0, r0, #0
	ldrb r1, [r2, #1]
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	movs r1, #0x7f
	ands r0, r1
	strb r0, [r2, #1]
	adds r0, r4, #0
	adds r0, #0x2a
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	mov ip, r2
	cmp r0, #0
	bge _080911E8
	movs r0, #0x96
	str r0, [r4, #0x2c]
	movs r3, #0
	ldr r0, _080911DC @ =0x02012468
	mov sb, r0
	adds r4, #0x29
	mov r8, r4
	ldr r1, _080911E0 @ =0x02012968
	mov sl, r1
	mov r7, sb
	movs r4, #0
	movs r2, #0xf0
	movs r6, #0xa0
	lsls r6, r6, #2
	ldr r5, _080911E4 @ =0x00000281
_080911AA:
	lsls r0, r3, #2
	adds r0, r0, r7
	strb r4, [r0]
	strb r2, [r0, #1]
	adds r1, r0, r6
	strb r4, [r1]
	adds r0, r0, r5
	strb r2, [r0]
	adds r0, r3, #1
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	cmp r3, #0x9f
	bls _080911AA
	mov r1, ip
	adds r1, #0x2f
	movs r0, #0
	strb r0, [r1]
	adds r1, #4
	strb r0, [r1]
	subs r1, #5
	movs r0, #0xf0
	b _08091230
	.align 2, 0
_080911D8: .4byte gDispIo
_080911DC: .4byte 0x02012468
_080911E0: .4byte 0x02012968
_080911E4: .4byte 0x00000281
_080911E8:
	movs r0, #0
	str r0, [r4, #0x2c]
	movs r3, #0
	ldr r0, _0809129C @ =0x02012468
	mov sb, r0
	adds r4, #0x29
	mov r8, r4
	ldr r1, _080912A0 @ =0x02012968
	mov sl, r1
	mov r6, sb
	movs r2, #0x78
	movs r5, #0xa0
	lsls r5, r5, #2
	ldr r4, _080912A4 @ =0x00000281
_08091204:
	lsls r0, r3, #2
	adds r0, r0, r6
	strb r2, [r0]
	strb r2, [r0, #1]
	adds r1, r0, r5
	strb r2, [r1]
	adds r0, r0, r4
	strb r2, [r0]
	adds r0, r3, #1
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	cmp r3, #0x9f
	bls _08091204
	mov r2, ip
	adds r2, #0x2f
	movs r1, #0
	movs r0, #0x78
	strb r0, [r2]
	adds r2, #4
	strb r1, [r2]
	mov r1, ip
	adds r1, #0x2e
_08091230:
	strb r0, [r1]
	adds r1, #4
	movs r0, #0xa0
	strb r0, [r1]
	mov r2, ip
	adds r2, #0x35
	movs r0, #1
	ldrb r1, [r2]
	orrs r0, r1
	movs r1, #2
	orrs r0, r1
	movs r1, #4
	orrs r0, r1
	movs r1, #8
	orrs r0, r1
	movs r1, #0x10
	orrs r0, r1
	strb r0, [r2]
	adds r2, #1
	movs r0, #2
	rsbs r0, r0, #0
	ldrb r1, [r2]
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
	strb r0, [r2]
	movs r0, #0
	mov r1, r8
	strb r0, [r1]
	mov r0, sb
	mov r1, sl
	str r0, [r1]
	movs r0, #0xa0
	lsls r0, r0, #2
	add r0, sb
	str r0, [r1, #4]
	ldr r0, _080912A8 @ =sub_8091118
	bl SetOnHBlankA
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0809129C: .4byte 0x02012468
_080912A0: .4byte 0x02012968
_080912A4: .4byte 0x00000281
_080912A8: .4byte sub_8091118

	thumb_func_start sub_80912AC
sub_80912AC: @ 0x080912AC
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	adds r6, r0, #0
	adds r0, #0x2a
	movs r1, #0
	ldrsb r1, [r0, r1]
	ldr r0, [r6, #0x2c]
	adds r0, r0, r1
	str r0, [r6, #0x2c]
	cmp r0, #0x96
	ble _080912CA
	movs r0, #0x96
	str r0, [r6, #0x2c]
_080912CA:
	ldr r0, [r6, #0x2c]
	cmp r0, #0
	bge _080912D4
	movs r0, #0
	str r0, [r6, #0x2c]
_080912D4:
	movs r1, #0
	movs r0, #0x29
	adds r0, r0, r6
	mov sb, r0
	ldr r7, _08091314 @ =0x02012968
	movs r2, #0x78
	mov r8, r2
_080912E2:
	ldr r0, [r6, #0x2c]
	lsls r5, r1, #0x10
	cmp r0, #0
	ble _08091302
	adds r4, r0, #0
	muls r4, r0, r4
	adds r0, r4, #0
	asrs r4, r5, #0x10
	adds r1, r4, #0
	subs r1, #0x50
	adds r2, r1, #0
	muls r2, r1, r2
	adds r1, r2, #0
	subs r0, r0, r1
	cmp r0, #0
	bge _08091318
_08091302:
	ldr r0, [r7, #4]
	asrs r1, r5, #0xe
	adds r0, r1, r0
	mov r4, r8
	strb r4, [r0]
	ldr r0, [r7, #4]
	adds r1, r1, r0
	strb r4, [r1, #1]
	b _0809133E
	.align 2, 0
_08091314: .4byte 0x02012968
_08091318:
	bl Sqrt
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x78
	ble _08091328
	movs r3, #0x78
_08091328:
	ldr r1, [r7, #4]
	lsls r2, r4, #2
	adds r1, r2, r1
	mov r4, r8
	subs r0, r4, r3
	strb r0, [r1]
	ldr r0, [r7, #4]
	adds r2, r2, r0
	adds r0, r3, #0
	adds r0, #0x78
	strb r0, [r2, #1]
_0809133E:
	movs r1, #0x80
	lsls r1, r1, #9
	adds r0, r5, r1
	lsrs r1, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x9f
	ble _080912E2
	mov r2, sb
	ldrb r0, [r2]
	adds r0, #1
	strb r0, [r2]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x28
	bne _08091362
	adds r0, r6, #0
	bl Proc_Break
_08091362:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_8091370
sub_8091370: @ 0x08091370
	push {lr}
	movs r0, #0
	bl SetOnHBlankA
	pop {r0}
	bx r0

	thumb_func_start sub_809137C
sub_809137C: @ 0x0809137C
	push {r4, lr}
	adds r2, r0, #0
	lsls r4, r1, #0x18
	lsrs r4, r4, #0x18
	ldr r0, _08091398 @ =gUnk_08D8C904
	adds r1, r2, #0
	bl Proc_StartBlocking
	adds r1, r0, #0
	adds r1, #0x2a
	strb r4, [r1]
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08091398: .4byte gUnk_08D8C904

	thumb_func_start sub_809139C
sub_809139C: @ 0x0809139C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r1, r0, #0
	adds r1, #0x29
	movs r7, #0
	strb r7, [r1]
	ldr r1, _08091434 @ =gDispIo
	mov ip, r1
	movs r3, #1
	ldrb r1, [r1, #1]
	orrs r1, r3
	movs r2, #2
	mov r8, r2
	mov r2, r8
	orrs r1, r2
	movs r6, #4
	orrs r1, r6
	movs r5, #8
	orrs r1, r5
	movs r4, #0x10
	orrs r1, r4
	movs r2, #0x21
	rsbs r2, r2, #0
	ands r1, r2
	movs r2, #0x40
	orrs r1, r2
	movs r2, #0x7f
	ands r1, r2
	mov r2, ip
	strb r1, [r2, #1]
	mov r1, ip
	adds r1, #0x35
	ldrb r2, [r1]
	orrs r3, r2
	mov r2, r8
	orrs r3, r2
	orrs r3, r6
	orrs r3, r5
	orrs r3, r4
	strb r3, [r1]
	mov r3, ip
	adds r3, #0x36
	movs r1, #2
	rsbs r1, r1, #0
	ldrb r2, [r3]
	ands r1, r2
	movs r2, #3
	rsbs r2, r2, #0
	ands r1, r2
	subs r2, #2
	ands r1, r2
	subs r2, #4
	ands r1, r2
	subs r2, #8
	ands r1, r2
	strb r1, [r3]
	adds r0, #0x2a
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	ble _08091438
	mov r0, ip
	adds r0, #0x2f
	strb r7, [r0]
	adds r0, #4
	strb r7, [r0]
	mov r1, ip
	adds r1, #0x2e
	movs r0, #0xf0
	strb r0, [r1]
	adds r1, #4
	movs r0, #0xa0
	strb r0, [r1]
	b _08091452
	.align 2, 0
_08091434: .4byte gDispIo
_08091438:
	mov r1, ip
	adds r1, #0x2f
	movs r0, #0x78
	strb r0, [r1]
	mov r2, ip
	adds r2, #0x33
	movs r1, #0x50
	strb r1, [r2]
	subs r2, #5
	strb r0, [r2]
	mov r0, ip
	adds r0, #0x32
	strb r1, [r0]
_08091452:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_809145C
sub_809145C: @ 0x0809145C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	adds r6, r0, #0
	adds r2, r6, #0
	adds r2, #0x29
	ldrb r0, [r2]
	adds r0, #1
	strb r0, [r2]
	ldr r4, _080914DC @ =gDispIo
	movs r0, #0x21
	rsbs r0, r0, #0
	ldrb r1, [r4, #1]
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	movs r1, #0x7f
	ands r0, r1
	strb r0, [r4, #1]
	movs r1, #0xf
	ldrb r2, [r2]
	subs r1, r1, r2
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #7
	muls r0, r1, r0
	movs r1, #0xe1
	bl __divsi3
	movs r1, #0xa0
	lsls r1, r1, #2
	subs r1, r1, r0
	asrs r5, r1, #4
	adds r0, r6, #0
	adds r0, #0x2a
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	ble _080914E0
	lsls r1, r5, #1
	adds r2, r1, r5
	adds r0, r4, #0
	adds r0, #0x2f
	strb r2, [r0]
	adds r0, #4
	strb r1, [r0]
	movs r3, #0x10
	rsbs r3, r3, #0
	adds r0, r3, #0
	subs r0, r0, r2
	adds r2, r4, #0
	adds r2, #0x2e
	strb r0, [r2]
	movs r2, #0x60
	rsbs r2, r2, #0
	adds r0, r2, #0
	subs r0, r0, r1
	adds r1, r4, #0
	adds r1, #0x32
	strb r0, [r1]
	b _08091504
	.align 2, 0
_080914DC: .4byte gDispIo
_080914E0:
	lsls r2, r5, #1
	adds r1, r2, r5
	movs r0, #0x78
	subs r0, r0, r1
	adds r3, r4, #0
	adds r3, #0x2f
	strb r0, [r3]
	movs r0, #0x50
	subs r0, r0, r2
	adds r3, #4
	strb r0, [r3]
	adds r1, #0x78
	adds r0, r4, #0
	adds r0, #0x2e
	strb r1, [r0]
	adds r2, #0x50
	adds r0, #4
	strb r2, [r0]
_08091504:
	adds r2, r4, #0
	adds r2, #0x35
	movs r0, #1
	ldrb r3, [r2]
	orrs r0, r3
	movs r1, #2
	orrs r0, r1
	movs r1, #4
	orrs r0, r1
	movs r1, #8
	orrs r0, r1
	movs r1, #0x10
	orrs r0, r1
	strb r0, [r2]
	adds r1, r4, #0
	adds r1, #0x36
	movs r0, #2
	rsbs r0, r0, #0
	ldrb r2, [r1]
	ands r0, r2
	movs r3, #3
	rsbs r3, r3, #0
	mov sl, r3
	ands r0, r3
	movs r2, #5
	rsbs r2, r2, #0
	mov sb, r2
	ands r0, r2
	subs r3, #6
	mov r8, r3
	ands r0, r3
	movs r7, #0x11
	rsbs r7, r7, #0
	ands r0, r7
	strb r0, [r1]
	cmp r5, #0x27
	ble _0809157A
	adds r0, r6, #0
	bl Proc_Break
	adds r0, r6, #0
	adds r0, #0x2a
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	ble _0809157A
	movs r0, #2
	rsbs r0, r0, #0
	ldrb r1, [r4, #1]
	ands r0, r1
	mov r2, sl
	ands r0, r2
	mov r3, sb
	ands r0, r3
	mov r1, r8
	ands r0, r1
	ands r0, r7
	strb r0, [r4, #1]
_0809157A:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_8091588
sub_8091588: @ 0x08091588
	movs r0, #0
	bx lr

	thumb_func_start sub_809158C
sub_809158C: @ 0x0809158C
	push {lr}
	bl sub_802EC3C
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_809159C
sub_809159C: @ 0x0809159C
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x2a]
	ldrh r1, [r4, #0x2c]
	cmp r0, r1
	bne _080915C8
	ldr r2, _080915D4 @ =gDispIo
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
	adds r0, r4, #0
	bl Proc_Break
_080915C8:
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080915D4: .4byte gDispIo

	thumb_func_start sub_80915D8
sub_80915D8: @ 0x080915D8
	push {r4, lr}
	adds r4, r0, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	ldr r0, _08091610 @ =gUnk_08D8C94C
	bl Proc_Start
	movs r1, #0
	strh r1, [r0, #0x2c]
	strh r4, [r0, #0x2a]
	ldr r2, _08091614 @ =gDispIo
	movs r0, #2
	rsbs r0, r0, #0
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
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08091610: .4byte gUnk_08D8C94C
_08091614: .4byte gDispIo

	thumb_func_start TryLockProc
TryLockProc: @ 0x08091618
	cmp r0, #0
	beq _08091626
	adds r1, r0, #0
	adds r1, #0x28
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
_08091626:
	bx lr

	thumb_func_start TryUnlockProc
TryUnlockProc: @ 0x08091628
	cmp r0, #0
	beq _0809163A
	adds r1, r0, #0
	adds r1, #0x28
	ldrb r0, [r1]
	cmp r0, #0
	beq _0809163A
	subs r0, #1
	strb r0, [r1]
_0809163A:
	bx lr

	thumb_func_start sub_809163C
sub_809163C: @ 0x0809163C
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08091660 @ =gpKeySt
	ldr r1, [r0]
	movs r0, #0xf3
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _08091658
	bl CloseHelpBox
	adds r0, r4, #0
	bl Proc_Break
_08091658:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08091660: .4byte gpKeySt

	thumb_func_start sub_8091664
sub_8091664: @ 0x08091664
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r5, r2, #0
	adds r6, r3, #0
	cmp r4, #0
	bge _08091680
	cmp r1, #0
	bge _08091680
	bl GetUiHandPrevX
	adds r4, r0, #0
	bl GetUiHandPrevY
	adds r1, r0, #0
_08091680:
	adds r0, r4, #0
	adds r2, r5, #0
	bl StartHelpBox
	ldr r0, _08091698 @ =gUnk_08D8C96C
	adds r1, r6, #0
	bl Proc_StartBlocking
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_08091698: .4byte gUnk_08D8C96C

	thumb_func_start sub_809169C
sub_809169C: @ 0x0809169C
	push {r4, lr}
	adds r4, r1, #0
	bl CanUnitUseWeapon
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080916BC
	adds r0, r4, #0
	bl GetItemAttributes
	movs r1, #0x80
	ands r1, r0
	cmp r1, #0
	bne _080916BC
	movs r0, #1
	b _080916BE
_080916BC:
	movs r0, #0
_080916BE:
	pop {r4}
	pop {r1}
	bx r1

	thumb_func_start sub_80916C4
sub_80916C4: @ 0x080916C4
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	movs r6, #0
	movs r4, #0
_080916CC:
	lsls r1, r4, #1
	adds r0, r5, #0
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r1, [r0]
	adds r0, r5, #0
	bl sub_809169C
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne _080916E6
	adds r6, #1
_080916E6:
	adds r4, #1
	cmp r4, #4
	ble _080916CC
	adds r0, r6, #0
	pop {r4, r5, r6}
	pop {r1}
	bx r1

	thumb_func_start sub_80916F4
sub_80916F4: @ 0x080916F4
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4]
	ldr r1, [r4, #4]
	ldr r0, [r0, #0x28]
	ldr r1, [r1, #0x28]
	orrs r0, r1
	movs r1, #0x80
	lsls r1, r1, #2
	ands r0, r1
	cmp r0, #0
	bne _08091726
	adds r0, r4, #0
	bl sub_802F624
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08091726
	adds r0, r4, #0
	bl sub_80916C4
	cmp r0, #0
	beq _08091726
	movs r0, #1
	b _08091728
_08091726:
	movs r0, #0
_08091728:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_8091730
sub_8091730: @ 0x08091730
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	adds r7, r1, #0
	adds r5, r2, #0
	adds r6, r3, #0
	cmp r4, r5
	beq _080917CA
	bl CheckInLinkArena
	cmp r0, #0
	beq _080917CA
	ldr r0, [r4, #0xc]
	movs r1, #8
	ands r0, r1
	cmp r0, #0
	bne _08091786
	lsls r1, r7, #1
	adds r0, r4, #0
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r1, [r0]
	adds r0, r4, #0
	bl sub_809169C
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08091786
	adds r0, r4, #0
	bl sub_80916C4
	cmp r0, #1
	bgt _08091786
	lsls r1, r6, #1
	adds r0, r5, #0
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r1, [r0]
	adds r0, r4, #0
	bl sub_809169C
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080917C6
_08091786:
	ldr r0, [r5, #0xc]
	movs r1, #8
	ands r0, r1
	cmp r0, #0
	bne _080917CA
	lsls r1, r6, #1
	adds r0, r5, #0
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r1, [r0]
	adds r0, r5, #0
	bl sub_809169C
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080917CA
	adds r0, r5, #0
	bl sub_80916C4
	cmp r0, #1
	bgt _080917CA
	lsls r1, r7, #1
	adds r0, r4, #0
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r1, [r0]
	adds r0, r5, #0
	bl sub_809169C
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080917CA
_080917C6:
	movs r0, #0
	b _080917CC
_080917CA:
	movs r0, #1
_080917CC:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_80917D4
sub_80917D4: @ 0x080917D4
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r6, r2, #0
	bl CheckInLinkArena
	cmp r0, #0
	beq _08091820
	ldr r0, [r4, #0xc]
	movs r1, #8
	ands r0, r1
	cmp r0, #0
	bne _08091820
	lsls r1, r5, #1
	adds r0, r4, #0
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r1, [r0]
	adds r0, r4, #0
	bl sub_809169C
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08091820
	adds r0, r4, #0
	bl sub_80916C4
	cmp r0, #1
	bne _08091820
	adds r0, r4, #0
	adds r1, r6, #0
	bl sub_809169C
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08091820
	movs r0, #0
	b _08091822
_08091820:
	movs r0, #1
_08091822:
	pop {r4, r5, r6}
	pop {r1}
	bx r1

	thumb_func_start sub_8091828
sub_8091828: @ 0x08091828
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	bl CheckInLinkArena
	cmp r0, #0
	beq _08091864
	ldr r0, [r4, #0xc]
	movs r1, #8
	ands r0, r1
	cmp r0, #0
	bne _08091864
	lsls r1, r5, #1
	adds r0, r4, #0
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r1, [r0]
	adds r0, r4, #0
	bl sub_809169C
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08091864
	adds r0, r4, #0
	bl sub_80916C4
	cmp r0, #1
	bne _08091864
	movs r0, #0
	b _08091866
_08091864:
	movs r0, #1
_08091866:
	pop {r4, r5}
	pop {r1}
	bx r1

	thumb_func_start sub_809186C
sub_809186C: @ 0x0809186C
	push {r4, r5, lr}
	movs r1, #0
	ldr r4, _08091898 @ =0x0202BC35
	ldr r2, _0809189C @ =0x02012970
	ldr r3, _080918A0 @ =Pal_08428A80
_08091876:
	ldrb r5, [r4]
	lsls r0, r5, #0x1c
	lsrs r0, r0, #0x1e
	lsls r0, r0, #4
	adds r0, r0, r1
	lsls r0, r0, #1
	adds r0, r0, r3
	ldrh r0, [r0]
	strh r0, [r2]
	adds r2, #2
	adds r1, #1
	cmp r1, #0xf
	ble _08091876
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08091898: .4byte 0x0202BC35
_0809189C: .4byte 0x02012970
_080918A0: .4byte Pal_08428A80

	thumb_func_start sub_80918A4
sub_80918A4: @ 0x080918A4
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	movs r5, #0
	ldr r4, _080918C4 @ =gUnk_08D8C984
_080918AC:
	adds r0, r6, #0
	bl GetItemType
	ldrb r1, [r4]
	cmp r0, r1
	blt _080918C8
	ldrb r1, [r4, #1]
	cmp r0, r1
	bgt _080918C8
	adds r0, r5, #0
	b _080918D2
	.align 2, 0
_080918C4: .4byte gUnk_08D8C984
_080918C8:
	adds r4, #4
	adds r5, #1
	cmp r5, #8
	ble _080918AC
	movs r0, #8
_080918D2:
	pop {r4, r5, r6}
	pop {r1}
	bx r1

	thumb_func_start sub_80918D8
sub_80918D8: @ 0x080918D8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	mov sb, r0
	ldr r0, _08091990 @ =0x02011E24
	mov r8, r0
	ldr r0, _08091994 @ =0x02012466
	movs r1, #0
	strh r1, [r0]
	movs r4, #0
	ldr r1, _08091998 @ =0x02012464
	mov sl, r0
	adds r2, r1, #0
	ldrh r1, [r2]
	cmp r4, r1
	bge _08091944
	ldr r1, _0809199C @ =gUnk_08D8C984
	mov r3, sb
	lsls r0, r3, #2
	adds r6, r0, r1
	mov r7, sl
_08091908:
	ldr r1, _080919A0 @ =0x020117E4
	lsls r0, r4, #2
	adds r5, r0, r1
	ldrh r0, [r5, #2]
	str r2, [sp]
	bl GetItemType
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r2, [sp]
	ldrb r1, [r6]
	cmp r0, r1
	blo _0809193A
	ldrb r3, [r6, #1]
	cmp r0, r3
	bhi _0809193A
	ldr r0, [r5]
	mov r1, r8
	adds r1, #4
	mov r8, r1
	subs r1, #4
	stm r1!, {r0}
	ldrh r0, [r7]
	adds r0, #1
	strh r0, [r7]
_0809193A:
	adds r4, #1
	ldr r0, _08091998 @ =0x02012464
	ldrh r0, [r0]
	cmp r4, r0
	blt _08091908
_08091944:
	movs r4, #0
	ldrh r2, [r2]
	cmp r4, r2
	bge _08091986
	ldr r1, _0809199C @ =gUnk_08D8C984
	mov r2, sb
	lsls r0, r2, #2
	adds r6, r0, r1
_08091954:
	ldr r1, _080919A0 @ =0x020117E4
	lsls r0, r4, #2
	adds r5, r0, r1
	ldrh r0, [r5, #2]
	bl GetItemType
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldrb r3, [r6]
	cmp r0, r3
	blo _08091970
	ldrb r1, [r6, #1]
	cmp r0, r1
	bls _0809197C
_08091970:
	ldr r0, [r5]
	mov r2, r8
	adds r2, #4
	mov r8, r2
	subs r2, #4
	stm r2!, {r0}
_0809197C:
	adds r4, #1
	ldr r0, _08091998 @ =0x02012464
	ldrh r0, [r0]
	cmp r4, r0
	blt _08091954
_08091986:
	movs r2, #1
	ldr r5, _08091990 @ =0x02011E24
	ldr r3, _08091994 @ =0x02012466
	mov sl, r3
	b _080919AA
	.align 2, 0
_08091990: .4byte 0x02011E24
_08091994: .4byte 0x02012466
_08091998: .4byte 0x02012464
_0809199C: .4byte gUnk_08D8C984
_080919A0: .4byte 0x020117E4
_080919A4:
	lsls r0, r2, #1
	adds r0, r0, r2
	adds r2, r0, #1
_080919AA:
	mov r1, sl
	ldrh r0, [r1]
	movs r1, #3
	str r2, [sp]
	bl __udivsi3
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldr r2, [sp]
	cmp r2, r0
	blt _080919A4
	cmp r2, #0
	ble _08091A4C
_080919C4:
	adds r4, r2, #0
	mov r3, sl
	ldrh r3, [r3]
	cmp r2, r3
	bge _08091A3E
	ldr r0, _08091A68 @ =0x02012466
	mov sl, r0
_080919D2:
	subs r7, r4, r2
	adds r4, #1
	mov sb, r4
	cmp r7, #0
	blt _08091A32
	ldr r1, _08091A6C @ =0x02011E24
	mov r8, r1
_080919E0:
	lsls r0, r7, #2
	mov r3, r8
	adds r6, r0, r3
	ldrh r0, [r6, #2]
	str r2, [sp]
	bl GetItemIndex
	adds r4, r0, #0
	ldr r2, [sp]
	adds r0, r7, r2
	lsls r0, r0, #2
	mov r1, r8
	adds r5, r0, r1
	ldrh r0, [r5, #2]
	bl GetItemIndex
	ldr r2, [sp]
	cmp r4, r0
	bgt _08091A24
	ldrh r0, [r6, #2]
	str r2, [sp]
	bl GetItemIndex
	adds r4, r0, #0
	ldrh r0, [r5, #2]
	bl GetItemIndex
	ldr r2, [sp]
	cmp r4, r0
	bne _08091A32
	ldrh r3, [r6, #2]
	ldrh r0, [r5, #2]
	cmp r3, r0
	bls _08091A2C
_08091A24:
	ldr r1, [r6]
	ldr r0, [r5]
	str r0, [r6]
	str r1, [r5]
_08091A2C:
	subs r7, r7, r2
	cmp r7, #0
	bge _080919E0
_08091A32:
	mov r4, sb
	ldr r0, _08091A68 @ =0x02012466
	ldr r5, _08091A6C @ =0x02011E24
	ldrh r0, [r0]
	cmp r4, r0
	blt _080919D2
_08091A3E:
	adds r0, r2, #0
	movs r1, #3
	bl __divsi3
	adds r2, r0, #0
	cmp r2, #0
	bgt _080919C4
_08091A4C:
	ldr r1, _08091A70 @ =0x020117E4
	movs r2, #0xc8
	lsls r2, r2, #1
	adds r0, r5, #0
	bl CpuFastSet
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08091A68: .4byte 0x02012466
_08091A6C: .4byte 0x02011E24
_08091A70: .4byte 0x020117E4

	thumb_func_start sub_8091A74
sub_8091A74: @ 0x08091A74
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	mov r8, r0
	mov sl, r1
	mov sb, r2
	ldr r6, _08091B3C @ =0x020117E4
	ldr r1, _08091B40 @ =0x02012464
	movs r0, #0
	strh r0, [r1]
	movs r0, #2
	ands r0, r2
	cmp r0, #0
	beq _08091AEE
	movs r5, #1
_08091A96:
	adds r0, r5, #0
	bl GetUnit
	adds r4, r0, #0
	adds r7, r5, #1
	cmp r4, #0
	beq _08091AE8
	ldr r0, [r4]
	cmp r0, #0
	beq _08091AE8
	ldr r0, [r4, #0xc]
	ldr r1, _08091B44 @ =0x00010004
	ands r0, r1
	cmp r0, #0
	bne _08091AE8
	cmp r4, r8
	beq _08091AE8
	adds r0, r4, #0
	bl GetUnitItemCount
	adds r5, r0, #0
	movs r2, #0
	cmp r2, r5
	bge _08091AE8
	ldr r3, _08091B40 @ =0x02012464
	adds r1, r4, #0
	adds r1, #0x1e
_08091ACC:
	ldr r0, [r4]
	ldrb r0, [r0, #4]
	strb r0, [r6]
	ldrh r0, [r1]
	strh r0, [r6, #2]
	strb r2, [r6, #1]
	adds r6, #4
	ldrh r0, [r3]
	adds r0, #1
	strh r0, [r3]
	adds r1, #2
	adds r2, #1
	cmp r2, r5
	blt _08091ACC
_08091AE8:
	adds r5, r7, #0
	cmp r5, #0x3f
	ble _08091A96
_08091AEE:
	movs r0, #1
	mov r1, sb
	ands r0, r1
	cmp r0, #0
	beq _08091B28
	bl sub_802EBCC
	adds r1, r0, #0
	movs r2, #0
	ldrh r0, [r1]
	cmp r0, #0
	beq _08091B28
	movs r4, #0
	ldr r3, _08091B40 @ =0x02012464
_08091B0A:
	ldrh r0, [r1]
	strh r0, [r6, #2]
	strb r4, [r6]
	strb r2, [r6, #1]
	adds r6, #4
	ldrh r0, [r3]
	adds r0, #1
	strh r0, [r3]
	adds r1, #2
	adds r2, #1
	cmp r2, #0x63
	bgt _08091B28
	ldrh r0, [r1]
	cmp r0, #0
	bne _08091B0A
_08091B28:
	mov r0, sl
	bl sub_80918D8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08091B3C: .4byte 0x020117E4
_08091B40: .4byte 0x02012464
_08091B44: .4byte 0x00010004

	thumb_func_start sub_8091B48
sub_8091B48: @ 0x08091B48
	push {r4, r5, lr}
	bl sub_802EBD4
	movs r4, #0
	ldr r0, _08091B84 @ =0x02012464
	ldrh r0, [r0]
	cmp r4, r0
	bhs _08091B7C
	ldr r5, _08091B88 @ =0x020117E4
_08091B5A:
	lsls r0, r4, #2
	adds r1, r0, r5
	ldrb r0, [r1]
	cmp r0, #0
	bne _08091B6E
	ldrh r0, [r1, #2]
	cmp r0, #0
	beq _08091B6E
	bl AddItemToConvoy
_08091B6E:
	adds r0, r4, #1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	ldr r0, _08091B84 @ =0x02012464
	ldrh r0, [r0]
	cmp r4, r0
	blo _08091B5A
_08091B7C:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08091B84: .4byte 0x02012464
_08091B88: .4byte 0x020117E4

	thumb_func_start sub_8091B8C
sub_8091B8C: @ 0x08091B8C
	push {r4, r5, lr}
	bl sub_802EBD4
	movs r4, #0
	movs r5, #0x87
_08091B96:
	subs r0, r5, r4
	bl AddItemToConvoy
	adds r0, r4, #1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	cmp r4, #0x63
	bls _08091B96
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start sub_8091BAC
sub_8091BAC: @ 0x08091BAC
	push {r4, lr}
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	movs r2, #0
	movs r1, #0
	movs r4, #1
_08091BB8:
	adds r0, r3, #0
	asrs r0, r1
	ands r0, r4
	cmp r0, #0
	beq _08091BC4
	adds r2, #1
_08091BC4:
	adds r1, #1
	cmp r1, #0xf
	ble _08091BB8
	adds r0, r2, #0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_8091BD4
sub_8091BD4: @ 0x08091BD4
	push {r4, r5, lr}
	adds r5, r1, #0
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	movs r3, #0
	movs r2, #0
	movs r1, #1
_08091BE2:
	adds r0, r4, #0
	asrs r0, r2
	ands r0, r1
	cmp r0, #0
	beq _08091BF8
	cmp r3, r5
	bne _08091BF6
	adds r0, r1, #0
	lsls r0, r2
	b _08091C00
_08091BF6:
	adds r3, #1
_08091BF8:
	adds r2, #1
	cmp r2, #0xf
	ble _08091BE2
	movs r0, #0
_08091C00:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_8091C08
sub_8091C08: @ 0x08091C08
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	movs r1, #0
	movs r3, #1
_08091C10:
	adds r0, r2, #0
	asrs r0, r1
	ands r0, r3
	cmp r0, #0
	beq _08091C1E
	adds r0, r1, #0
	b _08091C26
_08091C1E:
	adds r1, #1
	cmp r1, #0xf
	ble _08091C10
	movs r0, #0
_08091C26:
	bx lr

	thumb_func_start sub_8091C28
sub_8091C28: @ 0x08091C28
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	bl GetUnitItemCount
	adds r6, r0, #0
	movs r4, #0
	cmp r4, r6
	bge _08091C56
_08091C38:
	lsls r1, r4, #1
	adds r0, r5, #0
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r1, [r0]
	adds r0, r5, #0
	bl sub_80284C8
	cmp r0, #0
	beq _08091C50
	movs r0, #1
	b _08091C58
_08091C50:
	adds r4, #1
	cmp r4, r6
	blt _08091C38
_08091C56:
	movs r0, #0
_08091C58:
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_8091C60
sub_8091C60: @ 0x08091C60
	ldr r0, _08091C88 @ =0x04000006
	ldrh r0, [r0]
	adds r0, #1
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	cmp r2, #0xa0
	bls _08091C70
	movs r2, #0
_08091C70:
	cmp r2, #0
	bne _08091C7A
	ldr r1, _08091C8C @ =0x04000012
	movs r0, #0xf8
	strh r0, [r1]
_08091C7A:
	cmp r2, #0x48
	bne _08091C84
	ldr r1, _08091C8C @ =0x04000012
	movs r0, #0xfc
	strh r0, [r1]
_08091C84:
	bx lr
	.align 2, 0
_08091C88: .4byte 0x04000006
_08091C8C: .4byte 0x04000012

	thumb_func_start sub_8091C90
sub_8091C90: @ 0x08091C90
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
	bl sub_808F834
	adds r1, r4, #0
	adds r1, #0x2b
	strb r0, [r1]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_8091CC8
sub_8091CC8: @ 0x08091CC8
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

	thumb_func_start sub_8091D14
sub_8091D14: @ 0x08091D14
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

	thumb_func_start sub_8091D38
sub_8091D38: @ 0x08091D38
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
	bl sub_800515C
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
	ldr r0, _080920FC @ =sub_8093550
	mov r1, r8
	bl StartParallelWorker
	mov r0, r8
	bl sub_80A98C8
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
	bl sub_800536C
	adds r0, r4, #0
	adds r0, #8
	movs r1, #8
	bl sub_800536C
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
	bl sub_80A9954
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
	bl sub_80A98DC
	mov r4, sb
	ldrb r0, [r4]
	bl GetUnitFromPrepList
	adds r1, r0, #0
	ldr r0, _0809213C @ =0x00000503
	str r0, [sp]
	movs r0, #0
	movs r2, #0x44
	movs r3, #0x4e
	bl sub_80931F8
_08091FF6:
	mov r0, r8
	bl sub_8090DD0
	movs r5, #0x80
	lsls r5, r5, #2
	adds r0, r5, #0
	movs r1, #4
	bl sub_8090E38
	movs r0, #0xd8
	movs r1, #0xc
	bl sub_8090DE4
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
	bl sub_8090E04
	bl sub_8090DA0
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
	ldr r0, _08092140 @ =sub_8091C60
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
_080920FC: .4byte sub_8093550
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
_08092140: .4byte sub_8091C60
_08092144: .4byte gUnk_0842CF5C
_08092148: .4byte gUnk_0842CF64
_0809214C: .4byte gUnk_0842CF6C

	thumb_func_start sub_8092150
sub_8092150: @ 0x08092150
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
	bl sub_80932B0
	movs r0, #1
	bl sub_80932B0
	bl EndMuralBackground_
	bl EndHelpPromptSprite
	bl sub_8090DBC
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
	bl sub_80931F8
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
	bl sub_8091CC8
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
	bl sub_80A98DC
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
	bl sub_8090E04
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
	bl sub_80A98DC
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
	bl sub_8090E04
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
	bl sub_8092150
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
	bl sub_8091D38
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
	bl sub_80A98DC
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
	bl sub_80931F8
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
	bl sub_8091C28
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
	bl sub_8091C28
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
	bl sub_8091664
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
	bl sub_8093814
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
	bl sub_80931F8
	ldrb r0, [r7]
	bl GetUnitFromPrepList
	adds r1, r0, #0
	ldr r0, _08092FFC @ =0x00000502
	str r0, [sp]
	movs r0, #1
	movs r2, #0xac
	movs r3, #0x4e
	bl sub_80931F8
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
	bl sub_80A98DC
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
	bl sub_80932B0
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
	bl sub_80931F8
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
	bl sub_8092150
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
	bl sub_80951D8
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
	bl sub_8097BF4
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
	bl sub_8099828
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
	bl sub_8098E74
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_80931F8
sub_80931F8: @ 0x080931F8
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

	thumb_func_start sub_80932B0
sub_80932B0: @ 0x080932B0
	push {lr}
	sub sp, #4
	movs r1, #0
	str r1, [sp]
	movs r2, #0
	movs r3, #0
	bl sub_80931F8
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
	bl sub_80284C8
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
	bl sub_8017808
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
	bl sub_8090E04
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

	thumb_func_start sub_8093550
sub_8093550: @ 0x08093550
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
	bl sub_80259A4
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

	thumb_func_start sub_8093814
sub_8093814: @ 0x08093814
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	bl GetUnitItemCount
	adds r7, r0, #0
	bl sub_809158C
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

	thumb_func_start sub_809385C
sub_809385C: @ 0x0809385C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	adds r0, r1, #0
	movs r7, #0
	lsls r1, r0, #1
	mov r8, r1
	movs r1, #7
	bl __modsi3
	mov sl, r0
	movs r2, #0
	mov sb, r2
_0809387C:
	mov r0, r8
	adds r4, r0, r7
	bl PrepGetUnitAmount
	cmp r4, r0
	bge _080938F6
	adds r0, r4, #0
	bl GetUnitFromPrepList
	adds r5, r0, #0
	movs r6, #0
	bl CheckInLinkArena
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080938AE
	ldr r0, [r5]
	ldrb r0, [r0, #4]
	bl IsCharacterForceDeployed
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080938AE
	movs r6, #4
	b _080938BA
_080938AE:
	ldr r0, [r5, #0xc]
	movs r1, #8
	ands r0, r1
	cmp r0, #0
	beq _080938BA
	movs r6, #1
_080938BA:
	mov r1, sl
	lsls r4, r1, #1
	adds r4, r4, r7
	lsls r4, r4, #3
	ldr r0, _08093918 @ =0x02012AA0
	adds r4, r4, r0
	adds r0, r4, #0
	bl ClearText
	ldr r0, [r5]
	ldrh r0, [r0]
	bl DecodeMsg
	movs r1, #0x1f
	mov r2, r8
	ands r1, r2
	lsls r1, r1, #5
	adds r1, #0x10
	add r1, sb
	lsls r1, r1, #1
	ldr r2, _0809391C @ =gBg2Tm
	adds r1, r1, r2
	movs r2, #0
	str r2, [sp]
	str r0, [sp, #4]
	adds r0, r4, #0
	adds r2, r6, #0
	movs r3, #0
	bl PutDrawText
_080938F6:
	movs r0, #7
	add sb, r0
	adds r7, #1
	cmp r7, #1
	ble _0809387C
	movs r0, #4
	bl EnableBgSync
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08093918: .4byte 0x02012AA0
_0809391C: .4byte gBg2Tm

	thumb_func_start sub_8093920
sub_8093920: @ 0x08093920
	push {lr}
	lsls r0, r0, #1
	movs r1, #0x1f
	ands r0, r1
	lsls r0, r0, #6
	ldr r1, _08093944 @ =gBg2Tm + 0x20
	adds r0, r0, r1
	movs r1, #0xd
	movs r2, #1
	movs r3, #0
	bl TmFillRect_thm
	movs r0, #4
	bl EnableBgSync
	pop {r0}
	bx r0
	.align 2, 0
_08093944: .4byte gBg2Tm + 0x20

	thumb_func_start sub_8093948
sub_8093948: @ 0x08093948
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r7, r0, #0
	movs r6, #0
	b _08093984
_08093952:
	asrs r0, r6, #1
	lsls r0, r0, #4
	ldrh r1, [r7, #0x30]
	subs r5, r0, r1
	adds r0, r5, #0
	adds r0, #0xf
	cmp r0, #0x5f
	bhi _08093982
	movs r0, #1
	ands r0, r6
	lsls r4, r0, #3
	subs r4, r4, r0
	lsls r4, r4, #3
	adds r4, #0x70
	adds r5, #0x18
	adds r0, r6, #0
	bl GetUnitFromPrepList
	adds r3, r0, #0
	movs r0, #0
	adds r1, r4, #0
	adds r2, r5, #0
	bl sub_8026540
_08093982:
	adds r6, #1
_08093984:
	bl PrepGetUnitAmount
	cmp r6, r0
	blt _08093952
	movs r0, #0xf
	ldrh r2, [r7, #0x30]
	ands r0, r2
	cmp r0, #0
	beq _08093A2C
	ldr r0, _08093A28 @ =gDispIo
	mov ip, r0
	movs r0, #0x20
	mov r1, ip
	ldrb r1, [r1, #1]
	orrs r0, r1
	movs r1, #0x40
	orrs r0, r1
	movs r1, #0x7f
	ands r0, r1
	mov r2, ip
	strb r0, [r2, #1]
	mov r0, ip
	adds r0, #0x2d
	movs r2, #0
	strb r2, [r0]
	adds r0, #4
	strb r2, [r0]
	subs r0, #5
	movs r3, #0xf0
	strb r3, [r0]
	mov r1, ip
	adds r1, #0x30
	movs r0, #0x18
	strb r0, [r1]
	mov r0, ip
	adds r0, #0x2f
	strb r2, [r0]
	adds r1, #3
	movs r0, #0x78
	strb r0, [r1]
	mov r0, ip
	adds r0, #0x2e
	strb r3, [r0]
	subs r1, #1
	movs r0, #0xa0
	strb r0, [r1]
	mov r6, ip
	adds r6, #0x34
	movs r2, #1
	ldrb r0, [r6]
	orrs r0, r2
	movs r4, #2
	orrs r0, r4
	movs r5, #5
	rsbs r5, r5, #0
	ands r0, r5
	movs r3, #8
	orrs r0, r3
	movs r1, #0x11
	rsbs r1, r1, #0
	ands r0, r1
	strb r0, [r6]
	mov r1, ip
	adds r1, #0x35
	ldrb r0, [r1]
	orrs r0, r2
	orrs r0, r4
	ands r0, r5
	orrs r0, r3
	movs r5, #0x10
	orrs r0, r5
	strb r0, [r1]
	adds r1, #1
	ldrb r0, [r1]
	orrs r2, r0
	orrs r2, r4
	movs r0, #4
	orrs r2, r0
	orrs r2, r3
	orrs r2, r5
	strb r2, [r1]
	b _08093A42
	.align 2, 0
_08093A28: .4byte gDispIo
_08093A2C:
	ldr r2, _08093A88 @ =gDispIo
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
_08093A42:
	ldr r3, _08093A8C @ =gUnk_08D8CDA8
	movs r4, #0x40
	str r4, [sp]
	movs r0, #4
	movs r1, #0x80
	movs r2, #0x8e
	bl PutSpriteExt
	adds r1, r7, #0
	adds r1, #0x37
	ldrb r0, [r1]
	cmp r0, #0
	beq _08093A60
	adds r0, #1
	strb r0, [r1]
_08093A60:
	ldrb r1, [r1]
	lsrs r0, r1, #2
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	bne _08093AA2
	bl CheckInLinkArena
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08093A94
	ldr r3, _08093A90 @ =Sprite_08D8CDD0
	str r4, [sp]
	movs r0, #4
	movs r1, #0x80
	movs r2, #0x7e
	bl PutSpriteExt
	b _08093AA2
	.align 2, 0
_08093A88: .4byte gDispIo
_08093A8C: .4byte gUnk_08D8CDA8
_08093A90: .4byte Sprite_08D8CDD0
_08093A94:
	ldr r3, _08093AB0 @ =Sprite_08D8CDBC
	str r4, [sp]
	movs r0, #4
	movs r1, #0x80
	movs r2, #0x7e
	bl PutSpriteExt
_08093AA2:
	bl sub_80259A4
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08093AB0: .4byte Sprite_08D8CDBC

	thumb_func_start sub_8093AB4
sub_8093AB4: @ 0x08093AB4
	push {r4, r5, lr}
	bl ResetText
	ldr r5, _08093B08 @ =0x02012AA0
	movs r4, #0xd
_08093ABE:
	adds r0, r5, #0
	movs r1, #5
	bl InitText
	adds r5, #8
	subs r4, #1
	cmp r4, #0
	bge _08093ABE
	ldr r5, _08093B0C @ =0x02012B10
	movs r4, #4
_08093AD2:
	adds r0, r5, #0
	movs r1, #7
	bl InitText
	adds r5, #8
	subs r4, #1
	cmp r4, #0
	bge _08093AD2
	ldr r4, _08093B10 @ =0x02012B38
	adds r0, r4, #0
	movs r1, #7
	bl InitText
	adds r0, r4, #0
	adds r0, #8
	movs r1, #0xa
	bl InitText
	adds r4, #0x10
	adds r0, r4, #0
	movs r1, #0xb
	bl InitText
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08093B08: .4byte 0x02012AA0
_08093B0C: .4byte 0x02012B10
_08093B10: .4byte 0x02012B38

	thumb_func_start sub_8093B14
sub_8093B14: @ 0x08093B14
	push {lr}
	bl InitIcons
	bl ApplySystemObjectsGraphics
	movs r0, #4
	bl ApplyIconPalettes
	movs r0, #0xc0
	lsls r0, r0, #7
	movs r1, #0xf
	bl PutPrepMenuUiImg
	ldr r0, _08093B4C @ =gBg1Tm
	ldr r1, _08093B50 @ =gUnk_0841F9F4
	movs r2, #0xf3
	lsls r2, r2, #8
	bl TmApplyTsa_thm
	ldr r0, _08093B54 @ =Img_PrepScreenTitleSprites
	ldr r1, _08093B58 @ =0x06010800
	bl Decompress
	bl EnablePalSync
	pop {r0}
	bx r0
	.align 2, 0
_08093B4C: .4byte gBg1Tm
_08093B50: .4byte gUnk_0841F9F4
_08093B54: .4byte Img_PrepScreenTitleSprites
_08093B58: .4byte 0x06010800

	thumb_func_start sub_8093B5C
sub_8093B5C: @ 0x08093B5C
	push {r4, lr}
	sub sp, #8
	adds r4, r1, #0
	bl NewSysBlackBoxHandler
	adds r0, r4, #0
	bl SysBlackBoxSetGfx
	bl CheckInLinkArena
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08093B90
	movs r2, #0x90
	lsls r2, r2, #3
	movs r0, #4
	str r0, [sp]
	movs r0, #0xc0
	lsls r0, r0, #4
	str r0, [sp, #4]
	movs r0, #0
	movs r1, #4
	movs r3, #0xc
	bl EnableSysBlackBox
	b _08093BA8
_08093B90:
	movs r2, #0x91
	lsls r2, r2, #3
	movs r0, #3
	str r0, [sp]
	movs r0, #0xc0
	lsls r0, r0, #4
	str r0, [sp, #4]
	movs r0, #0
	movs r1, #4
	movs r3, #0xc
	bl EnableSysBlackBox
_08093BA8:
	movs r2, #0x90
	lsls r2, r2, #3
	movs r0, #4
	str r0, [sp]
	movs r0, #0xc0
	lsls r0, r0, #4
	str r0, [sp, #4]
	movs r0, #1
	movs r1, #0x6c
	movs r3, #0x10
	bl EnableSysBlackBox
	add sp, #8
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_8093BC8
sub_8093BC8: @ 0x08093BC8
	push {r4, lr}
	sub sp, #4
	adds r4, r0, #0
	bl ApplyUnitSpritePalettes
	movs r0, #0
	str r0, [sp]
	ldr r1, _08093BF8 @ =gPal + 0x360
	ldr r2, _08093BFC @ =0x01000008
	mov r0, sp
	bl CpuFastSet
	bl MakePrepUnitList
	ldr r0, [r4, #0x14]
	bl PrepAutoCapDeployUnits
	bl PrepUpdateSMS
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08093BF8: .4byte gPal + 0x360
_08093BFC: .4byte 0x01000008

	thumb_func_start sub_8093C00
sub_8093C00: @ 0x08093C00
	push {r4, r5, r6, lr}
	mov r6, sb
	mov r5, r8
	push {r5, r6}
	sub sp, #8
	adds r5, r0, #0
	ldr r4, _08093CB8 @ =gBg0Tm + 0xca
	adds r0, r4, #0
	movs r1, #6
	movs r2, #1
	movs r3, #0
	bl TmFillRect_thm
	adds r0, r5, #0
	bl GetUnitPortraitId
	adds r1, r4, #0
	subs r1, #0x88
	movs r2, #0x9c
	lsls r2, r2, #2
	movs r3, #0
	mov sb, r3
	str r3, [sp]
	movs r3, #2
	bl PutFaceChibi
	ldr r0, _08093CBC @ =0x02012B38
	mov r8, r0
	bl ClearText
	ldr r0, [r5]
	ldrh r0, [r0]
	bl DecodeMsg
	adds r1, r0, #0
	movs r0, #0x38
	bl GetStringTextCenteredPos
	adds r6, r0, #0
	ldr r0, [r5]
	ldrh r0, [r0]
	bl DecodeMsg
	adds r1, r4, #0
	subs r1, #0x80
	mov r2, sb
	str r2, [sp]
	str r0, [sp, #4]
	mov r0, r8
	movs r2, #0
	adds r3, r6, #0
	bl PutDrawText
	adds r0, r4, #0
	movs r1, #3
	movs r2, #0x24
	bl PutSpecialChar
	adds r0, r4, #2
	movs r1, #3
	movs r2, #0x25
	bl PutSpecialChar
	adds r0, r4, #0
	adds r0, #8
	movs r1, #3
	movs r2, #0x1d
	bl PutSpecialChar
	adds r0, r4, #6
	movs r2, #8
	ldrsb r2, [r5, r2]
	movs r1, #2
	bl PutNumberOrBlank
	adds r4, #0xc
	ldrb r2, [r5, #9]
	adds r0, r4, #0
	movs r1, #2
	bl PutNumberOrBlank
	movs r0, #1
	bl EnableBgSync
	add sp, #8
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08093CB8: .4byte gBg0Tm + 0xca
_08093CBC: .4byte 0x02012B38

	thumb_func_start sub_8093CC0
sub_8093CC0: @ 0x08093CC0
	push {lr}
	ldrh r0, [r0, #0x2e]
	bl GetUnitFromPrepList
	bl sub_8093C00
	pop {r0}
	bx r0

	thumb_func_start sub_8093CD0
sub_8093CD0: @ 0x08093CD0
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x10
	adds r7, r0, #0
	bl InitIcons
	ldr r4, _08093DBC @ =gBg0Tm + 0x142
	adds r0, r4, #0
	movs r1, #0xb
	movs r2, #0xa
	movs r3, #0
	bl TmFillRect_thm
	adds r0, r7, #0
	bl GetUnitItemCount
	str r0, [sp, #8]
	movs r0, #0
	mov r8, r0
	ldr r2, [sp, #8]
	cmp r8, r2
	bge _08093DA4
	movs r0, #0x14
	adds r0, r0, r4
	mov sl, r0
	mov sb, r4
	movs r2, #0xa0
	lsls r2, r2, #1
	str r2, [sp, #0xc]
_08093D10:
	mov r0, r8
	lsls r1, r0, #1
	adds r0, r7, #0
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r4, [r0]
	adds r0, r4, #0
	bl sub_8017808
	adds r1, r0, #0
	mov r0, sb
	movs r2, #0x80
	lsls r2, r2, #7
	bl PutIcon
	mov r2, r8
	lsls r1, r2, #3
	ldr r0, _08093DC0 @ =0x02012B10
	adds r5, r1, r0
	adds r0, r5, #0
	bl ClearText
	adds r0, r7, #0
	adds r1, r4, #0
	bl IsItemDisplayUsable
	movs r6, #0
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08093D4E
	movs r6, #1
_08093D4E:
	adds r0, r4, #0
	bl GetItemName
	ldr r1, _08093DC4 @ =gBg0Tm + 0x2
	adds r1, #4
	ldr r2, [sp, #0xc]
	adds r1, r2, r1
	movs r2, #0
	str r2, [sp]
	str r0, [sp, #4]
	adds r0, r5, #0
	adds r2, r6, #0
	movs r3, #0
	bl PutDrawText
	adds r0, r7, #0
	adds r1, r4, #0
	bl IsItemDisplayUsable
	lsls r0, r0, #0x18
	movs r5, #1
	cmp r0, #0
	beq _08093D7E
	movs r5, #2
_08093D7E:
	adds r0, r4, #0
	bl GetItemUses
	adds r2, r0, #0
	mov r0, sl
	adds r1, r5, #0
	bl PutNumberOrBlank
	movs r0, #0x80
	add sl, r0
	add sb, r0
	ldr r2, [sp, #0xc]
	adds r2, #0x80
	str r2, [sp, #0xc]
	movs r0, #1
	add r8, r0
	ldr r2, [sp, #8]
	cmp r8, r2
	blt _08093D10
_08093DA4:
	movs r0, #1
	bl EnableBgSync
	add sp, #0x10
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08093DBC: .4byte gBg0Tm + 0x142
_08093DC0: .4byte 0x02012B10
_08093DC4: .4byte gBg0Tm + 0x2

	thumb_func_start sub_8093DC8
sub_8093DC8: @ 0x08093DC8
	push {r4, r5, r6, r7, lr}
	sub sp, #8
	adds r7, r0, #0
	lsls r1, r1, #0x18
	asrs r6, r1, #0x18
	cmp r6, #0
	bne _08093E04
	ldr r4, _08093E88 @ =0x02012B48
	adds r0, r4, #0
	bl ClearText
	ldr r5, _08093E8C @ =gBg0Tm + 0x5c
	str r6, [sp]
	ldr r0, _08093E90 @ =gUnk_0842CFC4
	str r0, [sp, #4]
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #0
	movs r3, #0
	bl PutDrawText
	str r6, [sp]
	ldr r0, _08093E94 @ =gUnk_0842CFCC
	str r0, [sp, #4]
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #0
	movs r3, #0x20
	bl PutDrawText
_08093E04:
	ldr r6, _08093E98 @ =gBg0Tm + 0x60
	adds r0, r6, #0
	movs r1, #1
	movs r2, #1
	movs r3, #0
	bl TmFillRect_thm
	adds r0, r6, #2
	adds r4, r7, #0
	adds r4, #0x29
	adds r5, r7, #0
	adds r5, #0x2a
	movs r1, #2
	ldrb r2, [r4]
	ldrb r3, [r5]
	cmp r2, r3
	bne _08093E28
	movs r1, #1
_08093E28:
	ldrb r7, [r5]
	ldrb r3, [r4]
	subs r2, r7, r3
	bl PutNumberOrBlank
	adds r0, r6, #0
	adds r0, #0x12
	movs r1, #4
	movs r2, #1
	movs r3, #0
	bl TmFillRect_thm
	adds r0, r6, #0
	adds r0, #0x14
	movs r1, #2
	ldrb r7, [r4]
	ldrb r2, [r5]
	cmp r7, r2
	bne _08093E50
	movs r1, #4
_08093E50:
	ldrb r2, [r4]
	bl PutNumberOrBlank
	adds r0, r6, #0
	adds r0, #0x16
	movs r1, #0
	movs r2, #0x16
	bl PutSpecialChar
	adds r0, r6, #0
	adds r0, #0x1a
	movs r1, #2
	ldrb r4, [r4]
	ldrb r3, [r5]
	cmp r4, r3
	bne _08093E72
	movs r1, #4
_08093E72:
	ldrb r2, [r5]
	bl PutNumberOrBlank
	movs r0, #1
	bl EnableBgSync
	add sp, #8
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08093E88: .4byte 0x02012B48
_08093E8C: .4byte gBg0Tm + 0x5c
_08093E90: .4byte gUnk_0842CFC4
_08093E94: .4byte gUnk_0842CFCC
_08093E98: .4byte gBg0Tm + 0x60

	thumb_func_start sub_8093E9C
sub_8093E9C: @ 0x08093E9C
	push {r4, lr}
	adds r4, r0, #0
	adds r2, r1, #0
	adds r1, r4, #0
	adds r1, #0x2a
	adds r3, r4, #0
	adds r3, #0x29
	ldrb r0, [r3]
	ldrb r1, [r1]
	cmp r1, r0
	bls _08093EF0
	adds r0, #1
	strb r0, [r3]
	ldr r0, [r2, #0xc]
	movs r1, #0xb
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r2, #0xc]
	ldr r0, [r2]
	ldrb r0, [r0, #4]
	bl RegisterSioPid
	ldr r0, _08093EE8 @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08093EDA
	ldr r0, _08093EEC @ =0x0000038A
	bl m4aSongNumStart
_08093EDA:
	ldrh r0, [r4, #0x2e]
	lsrs r1, r0, #1
	adds r0, r4, #0
	bl sub_809385C
	movs r0, #1
	b _08093F06
	.align 2, 0
_08093EE8: .4byte gPlaySt
_08093EEC: .4byte 0x0000038A
_08093EF0:
	ldr r0, _08093F0C @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08093F04
	movs r0, #0xe3
	lsls r0, r0, #2
	bl m4aSongNumStart
_08093F04:
	movs r0, #0
_08093F06:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08093F0C: .4byte gPlaySt

	thumb_func_start sub_8093F10
sub_8093F10: @ 0x08093F10
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	ldr r0, [r4]
	ldrb r0, [r0, #4]
	bl IsCharacterForceDeployed
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08093F68
	adds r1, r5, #0
	adds r1, #0x29
	ldrb r0, [r1]
	subs r0, #1
	strb r0, [r1]
	ldr r0, [r4, #0xc]
	movs r1, #0xa
	orrs r0, r1
	str r0, [r4, #0xc]
	ldr r0, [r4]
	ldrb r0, [r0, #4]
	bl RemoveSioPid
	ldr r0, _08093F60 @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08093F50
	ldr r0, _08093F64 @ =0x0000038B
	bl m4aSongNumStart
_08093F50:
	ldrh r0, [r5, #0x2e]
	lsrs r1, r0, #1
	adds r0, r5, #0
	bl sub_809385C
	movs r0, #1
	b _08093F7E
	.align 2, 0
_08093F60: .4byte gPlaySt
_08093F64: .4byte 0x0000038B
_08093F68:
	ldr r0, _08093F84 @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08093F7C
	movs r0, #0xe3
	lsls r0, r0, #2
	bl m4aSongNumStart
_08093F7C:
	movs r0, #0
_08093F7E:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_08093F84: .4byte gPlaySt

	thumb_func_start sub_8093F88
sub_8093F88: @ 0x08093F88
	push {r4, r5, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x2e]
	bl GetUnitFromPrepList
	adds r5, r0, #0
	ldr r1, [r5, #0xc]
	movs r0, #0x80
	lsls r0, r0, #0x12
	ands r0, r1
	cmp r0, #0
	beq _08093FC8
	ldrh r1, [r4, #0x2e]
	movs r2, #1
	ands r2, r1
	lsls r0, r2, #3
	subs r0, r0, r2
	lsls r0, r0, #3
	adds r0, #0x70
	lsrs r1, r1, #1
	lsls r1, r1, #4
	ldrh r2, [r4, #0x30]
	subs r1, r1, r2
	adds r1, #0x18
	ldr r2, _08093FC4 @ =0x000003B6
_08093FBA:
	adds r3, r4, #0
	bl sub_8091664
	b _08094024
	.align 2, 0
_08093FC4: .4byte 0x000003B6
_08093FC8:
	movs r0, #8
	ands r1, r0
	cmp r1, #0
	beq _08094012
	bl CheckInLinkArena
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08094008
	adds r0, r5, #0
	bl sub_80916F4
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08094008
	ldrh r1, [r4, #0x2e]
	movs r2, #1
	ands r2, r1
	lsls r0, r2, #3
	subs r0, r0, r2
	lsls r0, r0, #3
	adds r0, #0x70
	lsrs r1, r1, #1
	lsls r1, r1, #4
	ldrh r2, [r4, #0x30]
	subs r1, r1, r2
	adds r1, #0x18
	ldr r2, _08094004 @ =0x000003B2
	b _08093FBA
	.align 2, 0
_08094004: .4byte 0x000003B2
_08094008:
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_8093E9C
	b _0809401A
_08094012:
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_8093F10
_0809401A:
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08094024
	movs r0, #1
	b _08094026
_08094024:
	movs r0, #0
_08094026:
	pop {r4, r5}
	pop {r1}
	bx r1

	thumb_func_start sub_809402C
sub_809402C: @ 0x0809402C
	push {r4, r5, r6, lr}
	sub sp, #8
	bl CheckInLinkArena
	lsls r0, r0, #0x18
	asrs r6, r0, #0x18
	cmp r6, #0
	bne _08094078
	ldr r0, _08094080 @ =gPlaySt
	ldrb r0, [r0, #0xe]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl GetChapterInfo
	adds r0, #0x8a
	ldrh r0, [r0]
	bl DecodeMsg
	adds r4, r0, #0
	ldr r5, _08094084 @ =0x02012B40
	adds r0, r5, #0
	bl ClearText
	movs r0, #0x50
	adds r1, r4, #0
	bl GetStringTextCenteredPos
	adds r3, r0, #0
	ldr r1, _08094088 @ =gBg0Tm + 0x402
	str r6, [sp]
	str r4, [sp, #4]
	adds r0, r5, #0
	movs r2, #0
	bl PutDrawText
	movs r0, #1
	bl EnableBgSync
_08094078:
	add sp, #8
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08094080: .4byte gPlaySt
_08094084: .4byte 0x02012B40
_08094088: .4byte gBg0Tm + 0x402

	thumb_func_start sub_809408C
sub_809408C: @ 0x0809408C
	push {r4, r5, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x30]
	lsrs r1, r0, #4
	cmp r1, #0
	ble _080940A0
	ldrh r2, [r4, #0x2e]
	lsrs r0, r2, #1
	cmp r0, r1
	ble _080940B6
_080940A0:
	adds r5, r1, #5
	bl PrepGetUnitAmount
	subs r0, #1
	asrs r0, r0, #1
	cmp r5, r0
	bge _080940BA
	ldrh r4, [r4, #0x2e]
	lsrs r0, r4, #1
	cmp r0, r5
	blt _080940BA
_080940B6:
	movs r0, #1
	b _080940BC
_080940BA:
	movs r0, #0
_080940BC:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_80940C4
sub_80940C4: @ 0x080940C4
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	bl sub_809408C
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08094106
	ldrh r0, [r5, #0x2e]
	lsrs r4, r0, #1
	ldrh r0, [r5, #0x30]
	lsrs r6, r0, #4
	bl PrepGetUnitAmount
	subs r0, #1
	asrs r1, r0, #1
	cmp r4, r6
	bgt _080940F8
	cmp r4, #0
	bne _080940EE
	strh r4, [r5, #0x30]
	b _080940F4
_080940EE:
	subs r0, r4, #1
	lsls r0, r0, #4
	strh r0, [r5, #0x30]
_080940F4:
	cmp r4, r6
	ble _08094106
_080940F8:
	cmp r4, r1
	bne _08094100
	subs r0, r4, #5
	b _08094102
_08094100:
	subs r0, r4, #4
_08094102:
	lsls r0, r0, #4
	strh r0, [r5, #0x30]
_08094106:
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	thumb_func_start sub_809410C
sub_809410C: @ 0x0809410C
	push {r4, r5, lr}
	movs r5, #0
	ldrh r0, [r0, #0x30]
	lsrs r4, r0, #4
	bl PrepGetUnitAmount
	subs r0, #1
	asrs r1, r0, #1
	cmp r4, #0
	ble _08094122
	movs r5, #1
_08094122:
	adds r0, r4, #5
	cmp r0, r1
	bge _0809412C
	movs r0, #2
	orrs r5, r0
_0809412C:
	adds r0, r5, #0
	bl SetUiSpinningArrowConfig
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start sub_8094138
sub_8094138: @ 0x08094138
	push {r4, lr}
	adds r4, r0, #0
	bl MakePrepUnitList
	bl PrepGetLatestCharId
	bl UnitGetIndexInPrepList
	movs r1, #0
	strh r0, [r4, #0x2e]
	ldr r0, [r4, #0x14]
	adds r0, #0x2a
	ldrb r0, [r0]
	adds r2, r4, #0
	adds r2, #0x2a
	strb r0, [r2]
	ldr r0, [r4, #0x14]
	adds r0, #0x2b
	ldrb r0, [r0]
	subs r2, #1
	strb r0, [r2]
	ldr r0, [r4, #0x14]
	ldrh r0, [r0, #0x3c]
	strh r0, [r4, #0x30]
	ldrh r0, [r4, #0x2e]
	strh r0, [r4, #0x2c]
	adds r0, r4, #0
	adds r0, #0x37
	strb r1, [r0]
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_8094178
sub_8094178: @ 0x08094178
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r0, _08094350 @ =gBgConfig_PrepScreen
	bl InitBgs
	ldr r4, _08094354 @ =gDispIo
	movs r0, #2
	rsbs r0, r0, #0
	ldrb r1, [r4, #1]
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
	strb r0, [r4, #1]
	adds r0, r5, #0
	bl sub_80940C4
	ldr r0, _08094358 @ =gBg0Tm
	movs r1, #0
	bl TmFill
	ldr r0, _0809435C @ =gBg1Tm
	movs r1, #0
	bl TmFill
	ldr r0, _08094360 @ =gBg2Tm
	movs r1, #0
	bl TmFill
	movs r1, #4
	rsbs r1, r1, #0
	adds r0, r1, #0
	ldrb r2, [r4, #0xc]
	ands r0, r2
	movs r2, #2
	orrs r0, r2
	strb r0, [r4, #0xc]
	adds r0, r1, #0
	ldrb r3, [r4, #0x10]
	ands r0, r3
	orrs r0, r2
	strb r0, [r4, #0x10]
	ldrb r0, [r4, #0x14]
	ands r1, r0
	movs r0, #1
	orrs r1, r0
	strb r1, [r4, #0x14]
	movs r0, #3
	ldrb r1, [r4, #0x18]
	orrs r0, r1
	strb r0, [r4, #0x18]
	movs r0, #0
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	movs r0, #1
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	ldrh r2, [r5, #0x30]
	subs r2, #0x18
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	movs r0, #2
	movs r1, #0
	bl SetBgOffset
	movs r0, #3
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	bl sub_8093AB4
	bl sub_8093B14
	movs r1, #0x80
	lsls r1, r1, #7
	adds r0, r5, #0
	bl sub_8093B5C
	movs r0, #7
	bl EnableBgSync
	adds r2, r4, #0
	adds r2, #0x3c
	movs r0, #0x3f
	ldrb r3, [r2]
	ands r0, r3
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r2]
	adds r1, r4, #0
	adds r1, #0x44
	movs r3, #0
	movs r0, #0xe
	strb r0, [r1]
	adds r1, #1
	movs r0, #8
	strb r0, [r1]
	adds r0, r4, #0
	adds r0, #0x46
	strb r3, [r0]
	ldr r0, _08094364 @ =0x0000FFE0
	ldrh r1, [r4, #0x3c]
	ands r0, r1
	ldr r1, _08094368 @ =0x0000E0FF
	ands r0, r1
	movs r3, #0x80
	lsls r3, r3, #4
	adds r1, r3, #0
	orrs r0, r1
	strh r0, [r4, #0x3c]
	movs r1, #0x21
	rsbs r1, r1, #0
	adds r0, r1, #0
	ldrb r3, [r2]
	ands r0, r3
	strb r0, [r2]
	adds r0, r4, #0
	adds r0, #0x3d
	ldrb r2, [r0]
	ands r1, r2
	strb r1, [r0]
	adds r0, r5, #0
	bl sub_8093BC8
	ldr r0, _0809436C @ =sub_8093948
	adds r1, r5, #0
	bl StartParallelWorker
	adds r0, r5, #0
	bl ResetSysHandCursor
	movs r0, #0xc0
	lsls r0, r0, #3
	movs r1, #1
	bl DisplaySysHandCursorTextShadow
	ldrh r1, [r5, #0x2e]
	movs r2, #1
	ands r2, r1
	lsls r0, r2, #3
	subs r0, r0, r2
	lsls r0, r0, #3
	adds r0, #0x70
	lsrs r1, r1, #1
	lsls r1, r1, #4
	ldrh r2, [r5, #0x30]
	subs r2, #0x18
	subs r1, r1, r2
	movs r3, #0x80
	lsls r3, r3, #4
	movs r2, #7
	bl ShowSysHandCursor
	adds r0, r5, #0
	bl sub_8090DD0
	movs r0, #0xe2
	movs r1, #0x20
	bl sub_8090DE4
	ldrh r4, [r5, #0x30]
	bl PrepGetUnitAmount
	adds r2, r0, #0
	subs r2, #1
	lsrs r0, r2, #0x1f
	adds r2, r2, r0
	asrs r2, r2, #1
	adds r2, #1
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	movs r0, #0xa
	adds r1, r4, #0
	movs r3, #6
	bl sub_8090E04
	movs r0, #0x80
	lsls r0, r0, #2
	movs r1, #2
	bl sub_8090E38
	movs r0, #0x20
	movs r1, #0x8c
	adds r2, r5, #0
	bl StartHelpPromptSprite
	ldrh r0, [r5, #0x2e]
	bl GetUnitFromPrepList
	bl sub_8093CD0
	ldrh r0, [r5, #0x2e]
	bl GetUnitFromPrepList
	bl sub_8093C00
	bl sub_809402C
	movs r4, #0
_0809431C:
	ldrh r3, [r5, #0x30]
	lsrs r1, r3, #4
	adds r1, r1, r4
	adds r0, r5, #0
	bl sub_809385C
	adds r4, #1
	cmp r4, #5
	ble _0809431C
	adds r0, r5, #0
	movs r1, #0
	bl sub_8093DC8
	adds r0, r5, #0
	bl StartGreenText
	ldr r0, _08094370 @ =0x06015000
	movs r1, #5
	bl LoadHelpBoxGfx
	bl PrepRestartMuralBackground
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08094350: .4byte gBgConfig_PrepScreen
_08094354: .4byte gDispIo
_08094358: .4byte gBg0Tm
_0809435C: .4byte gBg1Tm
_08094360: .4byte gBg2Tm
_08094364: .4byte 0x0000FFE0
_08094368: .4byte 0x0000E0FF
_0809436C: .4byte sub_8093948
_08094370: .4byte 0x06015000

	thumb_func_start sub_8094374
sub_8094374: @ 0x08094374
	push {lr}
	bl sub_8090DBC
	bl EndAllParallelWorkers
	bl EndSysBlackBoxs
	bl EndSysHandCursor
	bl EndHelpPromptSprite
	bl sub_80A9CE4
	bl EndMuralBackground_
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_8094398
sub_8094398: @ 0x08094398
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	ldrh r0, [r5, #0x2c]
	ldrh r1, [r5, #0x2e]
	cmp r0, r1
	beq _080943A6
	b _080945BA
_080943A6:
	ldr r3, _080943F4 @ =gpKeySt
	ldr r1, [r3]
	ldrh r6, [r1, #6]
	adds r2, r5, #0
	adds r2, #0x36
	movs r4, #4
	strb r4, [r2]
	movs r0, #0x80
	lsls r0, r0, #2
	ldrh r7, [r1, #4]
	ands r0, r7
	cmp r0, #0
	beq _080943C6
	ldrh r6, [r1, #4]
	movs r0, #8
	strb r0, [r2]
_080943C6:
	ldr r0, [r3]
	ldrh r1, [r0, #8]
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	beq _08094420
	adds r0, r5, #0
	adds r0, #0x29
	ldrb r0, [r0]
	cmp r0, #0
	bne _080943FC
	ldr r0, _080943F8 @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	bge _080943EA
	b _08094634
_080943EA:
	movs r0, #0xe3
	lsls r0, r0, #2
	bl m4aSongNumStart
	b _08094634
	.align 2, 0
_080943F4: .4byte gpKeySt
_080943F8: .4byte gPlaySt
_080943FC:
	ldr r0, _08094418 @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0809440E
	ldr r0, _0809441C @ =0x0000038A
	bl m4aSongNumStart
_0809440E:
	adds r0, r5, #0
	movs r1, #0x63
	bl Proc_Goto
	b _08094634
	.align 2, 0
_08094418: .4byte gPlaySt
_0809441C: .4byte 0x0000038A
_08094420:
	adds r0, r4, #0
	ands r0, r1
	cmp r0, #0
	beq _0809444C
	ldr r0, _08094444 @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0809443A
	ldr r0, _08094448 @ =0x0000038A
	bl m4aSongNumStart
_0809443A:
	adds r0, r5, #0
	movs r1, #3
	bl Proc_Goto
	b _08094634
	.align 2, 0
_08094444: .4byte gPlaySt
_08094448: .4byte 0x0000038A
_0809444C:
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r1
	cmp r0, #0
	beq _08094460
	adds r0, r5, #0
	movs r1, #4
	bl Proc_Goto
	b _08094634
_08094460:
	movs r2, #1
	adds r0, r2, #0
	ands r0, r1
	cmp r0, #0
	beq _08094482
	adds r0, r5, #0
	bl sub_8093F88
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08094478
	b _08094634
_08094478:
	adds r0, r5, #0
	movs r1, #1
	bl sub_8093DC8
	b _08094634
_08094482:
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _080944B0
	ldr r0, _080944A8 @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0809449C
	ldr r0, _080944AC @ =0x0000038B
	bl m4aSongNumStart
_0809449C:
	adds r0, r5, #0
	movs r1, #0xa
	bl Proc_Goto
	b _08094634
	.align 2, 0
_080944A8: .4byte gPlaySt
_080944AC: .4byte 0x0000038B
_080944B0:
	movs r0, #0x20
	ands r0, r6
	cmp r0, #0
	beq _080944C6
	ldrh r1, [r5, #0x2e]
	adds r0, r2, #0
	ands r0, r1
	cmp r0, #0
	beq _080944C6
	subs r0, r1, #1
	strh r0, [r5, #0x2e]
_080944C6:
	movs r0, #0x10
	ands r0, r6
	cmp r0, #0
	beq _080944EA
	movs r0, #1
	ldrh r1, [r5, #0x2e]
	ands r0, r1
	cmp r0, #0
	bne _080944EA
	ldrh r4, [r5, #0x2e]
	bl PrepGetUnitAmount
	subs r0, #1
	cmp r4, r0
	bge _080944EA
	ldrh r0, [r5, #0x2e]
	adds r0, #1
	strh r0, [r5, #0x2e]
_080944EA:
	movs r0, #0x40
	ands r0, r6
	cmp r0, #0
	beq _080944FC
	ldrh r0, [r5, #0x2e]
	subs r0, #2
	cmp r0, #0
	blt _080944FC
	strh r0, [r5, #0x2e]
_080944FC:
	movs r0, #0x80
	ands r6, r0
	cmp r6, #0
	beq _08094518
	ldrh r4, [r5, #0x2e]
	adds r4, #2
	bl PrepGetUnitAmount
	subs r0, #1
	cmp r4, r0
	bgt _08094518
	ldrh r0, [r5, #0x2e]
	adds r0, #2
	strh r0, [r5, #0x2e]
_08094518:
	ldrh r3, [r5, #0x2c]
	ldrh r7, [r5, #0x2e]
	cmp r3, r7
	bne _08094522
	b _08094634
_08094522:
	ldrh r0, [r5, #0x2e]
	bl GetUnitFromPrepList
	bl sub_8093CD0
	ldr r0, _08094580 @ =sub_8093CC0
	movs r1, #1
	adds r2, r5, #0
	bl StartParallelFiniteLoop
	ldr r0, _08094584 @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08094548
	ldr r0, _08094588 @ =0x00000385
	bl m4aSongNumStart
_08094548:
	adds r0, r5, #0
	bl sub_809408C
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0809458C
	ldrh r0, [r5, #0x2e]
	ldrh r1, [r5, #0x2c]
	cmp r0, r1
	bhs _08094568
	ldrh r3, [r5, #0x30]
	lsrs r1, r3, #4
	subs r1, #1
	adds r0, r5, #0
	bl sub_809385C
_08094568:
	ldrh r7, [r5, #0x2e]
	ldrh r0, [r5, #0x2c]
	cmp r7, r0
	bls _080945B2
	ldrh r3, [r5, #0x30]
	lsrs r1, r3, #4
	adds r1, #6
	adds r0, r5, #0
	bl sub_809385C
	b _080945B2
	.align 2, 0
_08094580: .4byte sub_8093CC0
_08094584: .4byte gPlaySt
_08094588: .4byte 0x00000385
_0809458C:
	ldrh r1, [r5, #0x2e]
	strh r1, [r5, #0x2c]
	movs r2, #1
	ands r2, r1
	lsls r0, r2, #3
	subs r0, r0, r2
	lsls r0, r0, #3
	adds r0, #0x70
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x11
	lsls r1, r1, #4
	ldrh r2, [r5, #0x30]
	subs r2, #0x18
	subs r1, r1, r2
	movs r3, #0x80
	lsls r3, r3, #4
	movs r2, #7
	bl ShowSysHandCursor
_080945B2:
	ldrh r7, [r5, #0x2c]
	ldrh r0, [r5, #0x2e]
	cmp r7, r0
	beq _08094634
_080945BA:
	ldrh r2, [r5, #0x2e]
	ldrh r1, [r5, #0x2c]
	cmp r2, r1
	bhs _080945CE
	adds r0, r5, #0
	adds r0, #0x36
	ldrh r3, [r5, #0x30]
	ldrb r0, [r0]
	subs r0, r3, r0
	strh r0, [r5, #0x30]
_080945CE:
	cmp r2, r1
	bls _080945DE
	adds r0, r5, #0
	adds r0, #0x36
	ldrh r7, [r5, #0x30]
	ldrb r0, [r0]
	adds r0, r7, r0
	strh r0, [r5, #0x30]
_080945DE:
	ldrh r1, [r5, #0x30]
	movs r0, #0xf
	ands r0, r1
	cmp r0, #0
	bne _08094604
	lsrs r0, r1, #4
	subs r0, #1
	bl sub_8093920
	ldrh r1, [r5, #0x30]
	lsrs r0, r1, #4
	adds r0, #6
	bl sub_8093920
	adds r0, r5, #0
	bl sub_809410C
	ldrh r0, [r5, #0x2e]
	strh r0, [r5, #0x2c]
_08094604:
	ldrh r2, [r5, #0x30]
	subs r2, #0x18
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	movs r0, #2
	movs r1, #0
	bl SetBgOffset
	ldrh r4, [r5, #0x30]
	bl PrepGetUnitAmount
	adds r2, r0, #0
	subs r2, #1
	lsrs r0, r2, #0x1f
	adds r2, r2, r0
	asrs r2, r2, #1
	adds r2, #1
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	movs r0, #0xa
	adds r1, r4, #0
	movs r3, #6
	bl sub_8090E04
_08094634:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_809463C
sub_809463C: @ 0x0809463C
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x34]
	adds r0, #4
	strh r0, [r4, #0x34]
	ldrh r1, [r4, #0x30]
	adds r1, #4
	strh r1, [r4, #0x30]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0x20
	bne _0809465A
	adds r0, r4, #0
	bl Proc_Break
_0809465A:
	ldrh r2, [r4, #0x30]
	subs r2, #0x18
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	movs r0, #2
	movs r1, #0
	bl SetBgOffset
	ldrh r1, [r4, #0x30]
	movs r0, #0xf
	ands r0, r1
	cmp r0, #0
	bne _0809467C
	lsrs r0, r1, #4
	subs r0, #1
	bl sub_8093920
_0809467C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_8094684
sub_8094684: @ 0x08094684
	push {r4, lr}
	adds r4, r0, #0
	ldrh r1, [r4, #0x30]
	movs r0, #0xf
	ands r0, r1
	cmp r0, #0
	bne _0809469C
	lsrs r1, r1, #4
	subs r1, #1
	adds r0, r4, #0
	bl sub_809385C
_0809469C:
	ldrh r0, [r4, #0x34]
	subs r0, #4
	strh r0, [r4, #0x34]
	ldrh r1, [r4, #0x30]
	subs r1, #4
	strh r1, [r4, #0x30]
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _080946B4
	adds r0, r4, #0
	bl Proc_Break
_080946B4:
	ldrh r2, [r4, #0x30]
	subs r2, #0x18
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	movs r0, #2
	movs r1, #0
	bl SetBgOffset
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start nullsub_11
nullsub_11: @ 0x080946CC
	bx lr
	.align 2, 0

	thumb_func_start sub_80946D0
sub_80946D0: @ 0x080946D0
	push {lr}
	bl nullsub_11
	movs r3, #0x80
	lsls r3, r3, #4
	movs r0, #0xd0
	movs r1, #0x68
	movs r2, #0
	bl ShowSysHandCursor
	pop {r0}
	bx r0

	thumb_func_start sub_80946E8
sub_80946E8: @ 0x080946E8
	push {lr}
	adds r3, r0, #0
	ldrh r1, [r3, #0x2e]
	movs r2, #1
	ands r2, r1
	lsls r0, r2, #3
	subs r0, r0, r2
	lsls r0, r0, #3
	adds r0, #0x70
	lsrs r1, r1, #1
	lsls r1, r1, #4
	ldrh r2, [r3, #0x30]
	subs r2, #0x18
	subs r1, r1, r2
	movs r3, #0x80
	lsls r3, r3, #4
	movs r2, #7
	bl ShowSysHandCursor
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_8094714
sub_8094714: @ 0x08094714
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08094768 @ =gpKeySt
	ldr r1, [r0]
	movs r0, #1
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _0809473A
	ldr r0, _0809476C @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0809473A
	movs r0, #0xe3
	lsls r0, r0, #2
	bl m4aSongNumStart
_0809473A:
	ldr r0, _08094768 @ =gpKeySt
	ldr r1, [r0]
	movs r0, #0x40
	ldrh r1, [r1, #6]
	ands r0, r1
	cmp r0, #0
	beq _08094760
	ldr r0, _0809476C @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0809475A
	ldr r0, _08094770 @ =0x00000385
	bl m4aSongNumStart
_0809475A:
	adds r0, r4, #0
	bl Proc_Break
_08094760:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08094768: .4byte gpKeySt
_0809476C: .4byte gPlaySt
_08094770: .4byte 0x00000385

	thumb_func_start sub_8094774
sub_8094774: @ 0x08094774
	push {lr}
	ldr r2, [r0, #0x14]
	ldrh r1, [r0, #0x30]
	strh r1, [r2, #0x3c]
	ldr r1, [r0, #0x14]
	adds r2, r0, #0
	adds r2, #0x29
	ldrb r2, [r2]
	adds r1, #0x2b
	strb r2, [r1]
	ldrh r0, [r0, #0x2e]
	bl GetUnitFromPrepList
	ldr r0, [r0]
	ldrb r0, [r0, #4]
	bl PrepSetLatestCharId
	bl EndMuralBackground_
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_80947A0
sub_80947A0: @ 0x080947A0
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x14]
	adds r0, #0x36
	movs r5, #1
	strb r5, [r0]
	ldr r0, [r4, #0x14]
	movs r1, #6
	bl Proc_Goto
	adds r4, #0x37
	strb r5, [r4]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_80947C0
sub_80947C0: @ 0x080947C0
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x2e]
	bl GetUnitFromPrepList
	ldr r0, [r0]
	ldrb r0, [r0, #4]
	bl PrepSetLatestCharId
	adds r0, r4, #0
	bl sub_808B468
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_80947E0
sub_80947E0: @ 0x080947E0
	push {r4, r5, lr}
	adds r4, r0, #0
	bl PrepGetLatestUnitIndex
	movs r1, #0
	strh r0, [r4, #0x2c]
	strh r0, [r4, #0x2e]
	adds r4, #0x29
	strb r1, [r4]
	movs r5, #1
_080947F4:
	adds r0, r5, #0
	bl GetUnit
	adds r1, r0, #0
	cmp r1, #0
	beq _08094816
	ldr r0, [r1]
	cmp r0, #0
	beq _08094816
	ldr r0, [r1, #0xc]
	ldr r1, _08094824 @ =0x0001000C
	ands r0, r1
	cmp r0, #0
	bne _08094816
	ldrb r0, [r4]
	adds r0, #1
	strb r0, [r4]
_08094816:
	adds r5, #1
	cmp r5, #0x3f
	ble _080947F4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08094824: .4byte 0x0001000C

	thumb_func_start sub_8094828
sub_8094828: @ 0x08094828
	ldr r2, _08094848 @ =gDispIo
	movs r0, #2
	rsbs r0, r0, #0
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
	bx lr
	.align 2, 0
_08094848: .4byte gDispIo

	thumb_func_start sub_809484C
sub_809484C: @ 0x0809484C
	ldr r2, _08094868 @ =gDispIo
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
_08094868: .4byte gDispIo

	thumb_func_start sub_809486C
sub_809486C: @ 0x0809486C
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0x11
	bl SetStatScreenExcludedUnitFlags
	ldrh r0, [r4, #0x2e]
	bl GetUnitFromPrepList
	adds r1, r4, #0
	bl StartStatScreen
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_8094888
sub_8094888: @ 0x08094888
	push {r4, lr}
	adds r4, r0, #0
	bl MakePrepUnitList
	bl GetLatestUnitIndexInPrepListByUId
	strh r0, [r4, #0x2c]
	strh r0, [r4, #0x2e]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_80948A0
sub_80948A0: @ 0x080948A0
	push {r4, r5, r6, lr}
	adds r6, r2, #0
	lsls r1, r1, #1
	adds r4, r0, #0
	adds r4, #0x1e
	adds r4, r4, r1
	ldrh r5, [r4]
	lsls r3, r3, #1
	adds r1, r6, #0
	adds r1, #0x1e
	adds r1, r1, r3
	ldrh r2, [r1]
	strh r2, [r4]
	strh r5, [r1]
	bl UnitRemoveInvalidItems
	adds r0, r6, #0
	bl UnitRemoveInvalidItems
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	thumb_func_start sub_80948CC
sub_80948CC: @ 0x080948CC
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08094930 @ =gpKeySt
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	beq _08094954
	ldr r0, [r4, #0x34]
	movs r1, #8
	ands r0, r1
	cmp r0, #0
	bne _080948EA
	b _08094AB8
_080948EA:
	ldr r0, [r4, #0x2c]
	bl GetUnitItemCount
	adds r2, r0, #0
	ldr r3, [r4, #0x38]
	cmp r3, #0xff
	beq _08094918
	ldr r0, [r4, #0x3c]
	cmp r0, #0xff
	bne _08094918
	ldr r0, [r4, #0x34]
	adds r0, #8
	asrs r0, r0, #3
	movs r1, #1
	ands r0, r1
	asrs r1, r3, #3
	cmp r0, r1
	beq _08094918
	movs r0, #5
	cmp r2, #5
	beq _08094916
	adds r0, r2, #1
_08094916:
	adds r2, r0, #0
_08094918:
	cmp r2, #0
	bgt _0809491E
	b _08094AB8
_0809491E:
	ldr r1, [r4, #0x34]
	movs r0, #7
	ands r0, r1
	cmp r2, r0
	ble _08094934
	adds r0, r1, #0
	subs r0, #8
	b _08094936
	.align 2, 0
_08094930: .4byte gpKeySt
_08094934:
	subs r0, r2, #1
_08094936:
	str r0, [r4, #0x34]
	ldr r0, _0809494C @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	bge _08094946
	b _08094AA8
_08094946:
	ldr r0, _08094950 @ =0x00000387
	b _08094AA4
	.align 2, 0
_0809494C: .4byte gPlaySt
_08094950: .4byte 0x00000387
_08094954:
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	beq _080949C8
	ldr r0, [r4, #0x34]
	movs r1, #8
	ands r0, r1
	cmp r0, #0
	beq _08094968
	b _08094AB8
_08094968:
	ldr r0, [r4, #0x30]
	bl GetUnitItemCount
	adds r2, r0, #0
	ldr r3, [r4, #0x38]
	cmp r3, #0xff
	beq _08094996
	ldr r0, [r4, #0x3c]
	cmp r0, #0xff
	bne _08094996
	ldr r0, [r4, #0x34]
	adds r0, #8
	asrs r0, r0, #3
	movs r1, #1
	ands r0, r1
	asrs r1, r3, #3
	cmp r0, r1
	beq _08094996
	movs r0, #5
	cmp r2, #5
	beq _08094994
	adds r0, r2, #1
_08094994:
	adds r2, r0, #0
_08094996:
	cmp r2, #0
	bgt _0809499C
	b _08094AB8
_0809499C:
	ldr r1, [r4, #0x34]
	movs r0, #7
	ands r0, r1
	cmp r2, r0
	ble _080949AC
	adds r0, r1, #0
	adds r0, #8
	b _080949AE
_080949AC:
	adds r0, r2, #7
_080949AE:
	str r0, [r4, #0x34]
	ldr r0, _080949C0 @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08094AA8
	ldr r0, _080949C4 @ =0x00000387
	b _08094AA4
	.align 2, 0
_080949C0: .4byte gPlaySt
_080949C4: .4byte 0x00000387
_080949C8:
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _08094A34
	ldr r0, [r4, #0x34]
	asrs r0, r0, #3
	lsls r0, r0, #2
	adds r1, r4, #0
	adds r1, #0x2c
	adds r1, r1, r0
	ldr r0, [r1]
	bl GetUnitItemCount
	adds r3, r0, #0
	ldr r1, [r4, #0x38]
	cmp r1, #0xff
	beq _08094A04
	ldr r0, [r4, #0x3c]
	cmp r0, #0xff
	bne _08094A04
	ldr r0, [r4, #0x34]
	asrs r0, r0, #3
	asrs r1, r1, #3
	cmp r0, r1
	beq _08094A04
	movs r0, #5
	cmp r3, #5
	beq _08094A02
	adds r0, r3, #1
_08094A02:
	adds r3, r0, #0
_08094A04:
	ldr r2, [r4, #0x34]
	movs r0, #7
	ands r0, r2
	cmp r0, #0
	ble _08094A14
	subs r0, r2, #1
	str r0, [r4, #0x34]
	b _08094A96
_08094A14:
	ldr r0, _08094A30 @ =gpKeySt
	ldr r1, [r0]
	movs r0, #0x40
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _08094AB8
	movs r0, #8
	ands r2, r0
	adds r0, r2, r3
	subs r0, #1
	str r0, [r4, #0x34]
	b _08094A96
	.align 2, 0
_08094A30: .4byte gpKeySt
_08094A34:
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _08094AB8
	ldr r0, [r4, #0x34]
	asrs r0, r0, #3
	lsls r0, r0, #2
	adds r1, r4, #0
	adds r1, #0x2c
	adds r1, r1, r0
	ldr r0, [r1]
	bl GetUnitItemCount
	adds r3, r0, #0
	ldr r1, [r4, #0x38]
	cmp r1, #0xff
	beq _08094A70
	ldr r0, [r4, #0x3c]
	cmp r0, #0xff
	bne _08094A70
	ldr r0, [r4, #0x34]
	asrs r0, r0, #3
	asrs r1, r1, #3
	cmp r0, r1
	beq _08094A70
	movs r0, #5
	cmp r3, #5
	beq _08094A6E
	adds r0, r3, #1
_08094A6E:
	adds r3, r0, #0
_08094A70:
	ldr r2, [r4, #0x34]
	movs r0, #7
	ands r0, r2
	subs r1, r3, #1
	cmp r0, r1
	bge _08094A82
	adds r0, r2, #1
	str r0, [r4, #0x34]
	b _08094A96
_08094A82:
	ldr r0, _08094AAC @ =gpKeySt
	ldr r1, [r0]
	movs r0, #0x80
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _08094AB8
	movs r0, #8
	ands r2, r0
	str r2, [r4, #0x34]
_08094A96:
	ldr r0, _08094AB0 @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08094AA8
	ldr r0, _08094AB4 @ =0x00000386
_08094AA4:
	bl m4aSongNumStart
_08094AA8:
	movs r0, #1
	b _08094ABA
	.align 2, 0
_08094AAC: .4byte gpKeySt
_08094AB0: .4byte gPlaySt
_08094AB4: .4byte 0x00000386
_08094AB8:
	movs r0, #0
_08094ABA:
	pop {r4}
	pop {r1}
	bx r1

	thumb_func_start sub_8094AC0
sub_8094AC0: @ 0x08094AC0
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x18
	adds r4, r0, #0
	mov sb, r1
	mov sl, r2
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	str r3, [sp, #8]
	movs r1, #0xb
	movs r2, #9
	movs r3, #0
	bl TmFillRect_thm
	mov r0, sl
	bl GetUnitItemCount
	str r0, [sp, #0x10]
	movs r0, #0
	str r0, [sp, #0xc]
	ldr r1, [sp, #0x10]
	cmp r0, r1
	bge _08094B94
	adds r0, r4, #4
	str r0, [sp, #0x14]
	mov r8, r4
_08094AFA:
	ldr r0, [sp, #0xc]
	lsls r1, r0, #1
	mov r0, sl
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r6, [r0]
	ldr r1, [sp, #8]
	cmp r1, #0
	beq _08094B16
	mov r0, sl
	adds r1, r6, #0
	bl sub_80284C8
	b _08094B1E
_08094B16:
	mov r0, sl
	adds r1, r6, #0
	bl IsItemDisplayUsable
_08094B1E:
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	mov r0, sb
	bl ClearText
	adds r0, r6, #0
	bl GetItemName
	adds r1, r0, #0
	movs r2, #0
	lsls r0, r4, #0x18
	asrs r5, r0, #0x18
	cmp r5, #0
	bne _08094B3C
	movs r2, #1
_08094B3C:
	movs r0, #0
	str r0, [sp]
	str r1, [sp, #4]
	mov r0, sb
	ldr r1, [sp, #0x14]
	movs r3, #0
	bl PutDrawText
	mov r4, r8
	adds r4, #0x16
	movs r7, #1
	cmp r5, #0
	beq _08094B58
	movs r7, #2
_08094B58:
	adds r0, r6, #0
	bl GetItemUses
	adds r2, r0, #0
	adds r0, r4, #0
	adds r1, r7, #0
	bl PutNumberOrBlank
	adds r0, r6, #0
	bl sub_8017808
	adds r1, r0, #0
	mov r0, r8
	movs r2, #0x80
	lsls r2, r2, #7
	bl PutIcon
	movs r0, #8
	add sb, r0
	ldr r1, [sp, #0x14]
	adds r1, #0x80
	str r1, [sp, #0x14]
	movs r0, #0x80
	add r8, r0
	ldr r1, [sp, #0xc]
	adds r1, #1
	str r1, [sp, #0xc]
	ldr r0, [sp, #0x10]
	cmp r1, r0
	blt _08094AFA
_08094B94:
	add sp, #0x18
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_8094BA4
sub_8094BA4: @ 0x08094BA4
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	adds r7, r1, #0
	adds r0, r7, #0
	bl GetUnitItemCount
	adds r6, r0, #0
	movs r5, #0
	cmp r5, r6
	bge _08094BDA
_08094BB8:
	lsls r1, r5, #1
	adds r0, r7, #0
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r0, [r0]
	bl sub_8017808
	adds r1, r0, #0
	adds r0, r4, #0
	movs r2, #0x80
	lsls r2, r2, #7
	bl PutIcon
	adds r4, #0x80
	adds r5, #1
	cmp r5, r6
	blt _08094BB8
_08094BDA:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_8094BE0
sub_8094BE0: @ 0x08094BE0
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #0x28
	mov r8, r0
	add r1, sp, #8
	ldr r0, _08094CD8 @ =gUnk_0842CFDC
	ldm r0!, {r2, r3, r4}
	stm r1!, {r2, r3, r4}
	ldm r0!, {r2, r3, r4}
	stm r1!, {r2, r3, r4}
	ldm r0!, {r2, r3}
	stm r1!, {r2, r3}
	ldr r0, _08094CDC @ =gBgConfig_PrepScreen
	ldrh r0, [r0]
	bl InitBgs
	add r0, sp, #8
	bl SetFaceConfig
	ldr r3, _08094CE0 @ =gDispIo
	movs r2, #4
	rsbs r2, r2, #0
	adds r0, r2, #0
	ldrb r4, [r3, #0xc]
	ands r0, r4
	movs r1, #1
	orrs r0, r1
	strb r0, [r3, #0xc]
	adds r0, r2, #0
	ldrb r1, [r3, #0x10]
	ands r0, r1
	movs r1, #2
	orrs r0, r1
	strb r0, [r3, #0x10]
	ldrb r4, [r3, #0x14]
	ands r2, r4
	strb r2, [r3, #0x14]
	movs r0, #3
	ldrb r1, [r3, #0x18]
	orrs r0, r1
	strb r0, [r3, #0x18]
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
	bl ResetText
	bl InitIcons
	bl UnpackUiWindowFrameGraphics
	bl ApplySystemObjectsGraphics
	movs r0, #0
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	movs r0, #1
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	movs r0, #2
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	ldr r0, _08094CE4 @ =0x06014000
	movs r1, #1
	rsbs r1, r1, #0
	bl LoadHelpBoxGfx
	movs r0, #4
	bl ApplyIconPalettes
	bl PrepRestartMuralBackground
	ldr r0, _08094CE8 @ =0x02012A20
	adds r6, r0, #0
	adds r6, #0x28
	adds r5, r0, #0
	movs r4, #4
_08094CA6:
	adds r0, r5, #0
	movs r1, #7
	bl sub_800536C
	adds r0, r6, #0
	movs r1, #7
	bl sub_800536C
	adds r6, #8
	adds r5, #8
	subs r4, #1
	cmp r4, #0
	bge _08094CA6
	movs r0, #0xff
	mov r2, r8
	str r0, [r2, #0x38]
	ldr r1, [r2, #0x40]
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	beq _08094CEC
	adds r0, r1, #0
	adds r0, #8
	str r0, [r2, #0x34]
	b _08094D06
	.align 2, 0
_08094CD8: .4byte gUnk_0842CFDC
_08094CDC: .4byte gBgConfig_PrepScreen
_08094CE0: .4byte gDispIo
_08094CE4: .4byte 0x06014000
_08094CE8: .4byte 0x02012A20
_08094CEC:
	mov r3, r8
	ldr r0, [r3, #0x2c]
	bl GetUnitItemCount
	cmp r0, #0
	bne _08094D00
	movs r0, #8
	mov r4, r8
	str r0, [r4, #0x34]
	b _08094D06
_08094D00:
	movs r0, #0
	mov r1, r8
	str r0, [r1, #0x34]
_08094D06:
	movs r0, #0xff
	mov r2, r8
	str r0, [r2, #0x3c]
	ldr r0, [r2, #0x2c]
	bl GetUnitPortraitId
	adds r1, r0, #0
	movs r4, #4
	rsbs r4, r4, #0
	ldr r0, _08094EA4 @ =0x00000203
	str r0, [sp]
	movs r0, #0
	movs r2, #0x40
	adds r3, r4, #0
	bl StartBmFace
	mov r3, r8
	ldr r0, [r3, #0x30]
	bl GetUnitPortraitId
	adds r1, r0, #0
	ldr r0, _08094EA8 @ =0x00000202
	str r0, [sp]
	movs r0, #1
	movs r2, #0xae
	adds r3, r4, #0
	bl StartBmFace
	movs r6, #0
	str r6, [sp]
	movs r0, #1
	movs r1, #8
	movs r2, #0xe
	movs r3, #0xc
	bl sub_804A4CC
	str r6, [sp]
	movs r0, #0xf
	movs r1, #8
	movs r2, #0xe
	movs r3, #0xc
	bl sub_804A4CC
	movs r0, #7
	bl EnableBgSync
	mov r4, r8
	ldr r0, [r4, #0x2c]
	ldr r0, [r0]
	ldrh r0, [r0]
	bl DecodeMsg
	adds r7, r0, #0
	bl GetStringTextLen
	adds r3, r0, #0
	movs r4, #0x30
	subs r3, r4, r3
	lsrs r0, r3, #0x1f
	adds r3, r3, r0
	asrs r3, r3, #1
	ldr r0, _08094EAC @ =gBg0Tm
	mov sb, r0
	movs r5, #6
	str r5, [sp]
	str r7, [sp, #4]
	movs r0, #0
	mov r1, sb
	movs r2, #0
	bl PutDrawText
	mov r1, r8
	ldr r0, [r1, #0x30]
	ldr r0, [r0]
	ldrh r0, [r0]
	bl DecodeMsg
	adds r7, r0, #0
	bl GetStringTextLen
	subs r4, r4, r0
	lsrs r0, r4, #0x1f
	adds r4, r4, r0
	asrs r4, r4, #1
	mov r1, sb
	adds r1, #0x30
	str r5, [sp]
	str r7, [sp, #4]
	movs r0, #0
	movs r2, #0
	adds r3, r4, #0
	bl PutDrawText
	movs r0, #0x91
	lsls r0, r0, #2
	add r0, sb
	ldr r4, _08094EB0 @ =0x02012A20
	mov r3, r8
	ldr r2, [r3, #0x2c]
	adds r1, r4, #0
	movs r3, #0
	bl sub_8094AC0
	movs r0, #0x98
	lsls r0, r0, #2
	add r0, sb
	adds r4, #0x28
	mov r1, r8
	ldr r2, [r1, #0x30]
	adds r1, r4, #0
	movs r3, #0
	bl sub_8094AC0
	mov r0, r8
	bl sub_80A98C8
	mov r0, r8
	bl ResetSysHandCursor
	movs r0, #0xc0
	lsls r0, r0, #3
	movs r1, #1
	bl DisplaySysHandCursorTextShadow
	mov r2, r8
	ldr r1, [r2, #0x34]
	asrs r2, r1, #3
	lsls r0, r2, #3
	subs r0, r0, r2
	lsls r0, r0, #4
	adds r0, #0x10
	movs r2, #7
	ands r1, r2
	lsls r1, r1, #4
	adds r1, #0x48
	movs r5, #0x80
	lsls r5, r5, #4
	movs r2, #0xb
	adds r3, r5, #0
	bl ShowSysHandCursor
	movs r0, #0xc8
	movs r1, #0x90
	mov r2, r8
	bl StartHelpPromptSprite
	movs r1, #0xe0
	lsls r1, r1, #4
	movs r3, #0xc0
	lsls r3, r3, #4
	movs r0, #0x80
	lsls r0, r0, #3
	str r0, [sp]
	mov r4, r8
	str r4, [sp, #4]
	movs r0, #0xd
	movs r2, #0xf
	bl StartSysBrownBox
	movs r1, #0x28
	rsbs r1, r1, #0
	movs r4, #1
	rsbs r4, r4, #0
	movs r0, #0
	adds r2, r4, #0
	movs r3, #1
	bl EnableSysBrownBox
	movs r0, #1
	movs r1, #0xb8
	adds r2, r4, #0
	movs r3, #0
	bl EnableSysBrownBox
	ldr r3, _08094EB4 @ =gDispIo
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
	movs r0, #0xe
	strb r0, [r1]
	adds r1, #1
	movs r0, #4
	strb r0, [r1]
	adds r0, r3, #0
	adds r0, #0x46
	strb r6, [r0]
	ldr r0, _08094EB8 @ =0x0000FFE0
	ldrh r2, [r3, #0x3c]
	ands r0, r2
	ldr r1, _08094EBC @ =0x0000E0FF
	ands r0, r1
	orrs r0, r5
	strh r0, [r3, #0x3c]
	add sp, #0x28
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08094EA4: .4byte 0x00000203
_08094EA8: .4byte 0x00000202
_08094EAC: .4byte gBg0Tm
_08094EB0: .4byte 0x02012A20
_08094EB4: .4byte gDispIo
_08094EB8: .4byte 0x0000FFE0
_08094EBC: .4byte 0x0000E0FF

	thumb_func_start sub_8094EC0
sub_8094EC0: @ 0x08094EC0
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r6, r0, #0
	ldr r2, [r6, #0x3c]
	cmp r2, #0xff
	beq _08094EEC
	ldr r0, _08094EE8 @ =gpKeySt
	ldr r1, [r0]
	movs r0, #0x81
	lsls r0, r0, #1
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	bne _08094EE0
	b _08095154
_08094EE0:
	bl CloseHelpBox
	movs r0, #0xff
	b _080951B4
	.align 2, 0
_08094EE8: .4byte gpKeySt
_08094EEC:
	ldr r0, _08094F28 @ =gpKeySt
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r1
	cmp r0, #0
	beq _08094F2C
	ldr r2, [r6, #0x34]
	asrs r3, r2, #3
	lsls r1, r3, #2
	adds r0, r6, #0
	adds r0, #0x2c
	adds r0, r0, r1
	ldr r0, [r0]
	movs r4, #7
	ands r4, r2
	lsls r1, r4, #1
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r2, [r0]
	cmp r2, #0
	bne _08094F1C
	b _080951B6
_08094F1C:
	lsls r0, r3, #3
	subs r0, r0, r3
	lsls r0, r0, #4
	adds r0, #0x10
	lsls r1, r4, #4
	b _080951AC
	.align 2, 0
_08094F28: .4byte gpKeySt
_08094F2C:
	ldr r4, [r6, #0x38]
	cmp r4, #0xff
	bne _08094F34
	b _08095094
_08094F34:
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	bne _08094F3E
	b _08095048
_08094F3E:
	asrs r0, r4, #3
	lsls r0, r0, #2
	adds r7, r6, #0
	adds r7, #0x2c
	adds r0, r7, r0
	ldr r0, [r0]
	movs r1, #7
	mov r8, r1
	ands r4, r1
	ldr r3, [r6, #0x34]
	asrs r1, r3, #3
	lsls r1, r1, #2
	adds r1, r7, r1
	ldr r2, [r1]
	mov r1, r8
	ands r3, r1
	adds r1, r4, #0
	bl sub_8091730
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08094F80
	movs r1, #1
	rsbs r1, r1, #0
	ldr r2, _08094F7C @ =0x000003B3
	adds r0, r1, #0
	adds r3, r6, #0
	bl sub_8091664
	b _080951B6
	.align 2, 0
_08094F7C: .4byte 0x000003B3
_08094F80:
	ldr r1, [r6, #0x38]
	asrs r0, r1, #3
	lsls r0, r0, #2
	adds r0, r7, r0
	ldr r0, [r0]
	mov r2, r8
	ands r1, r2
	ldr r3, [r6, #0x34]
	asrs r2, r3, #3
	lsls r2, r2, #2
	adds r2, r7, r2
	ldr r2, [r2]
	mov r4, r8
	ands r3, r4
	bl sub_80948A0
	ldr r4, _08094FE4 @ =gBg0Tm + 0x244
	ldr r5, _08094FE8 @ =0x02012A20
	ldr r2, [r6, #0x2c]
	adds r0, r4, #0
	adds r1, r5, #0
	movs r3, #0
	bl sub_8094AC0
	adds r4, #0x1c
	adds r5, #0x28
	ldr r2, [r6, #0x30]
	adds r0, r4, #0
	adds r1, r5, #0
	movs r3, #0
	bl sub_8094AC0
	movs r0, #1
	bl EnableBgSync
	ldr r0, [r6, #0x38]
	asrs r0, r0, #3
	lsls r0, r0, #2
	adds r0, r7, r0
	ldr r0, [r0]
	bl GetUnitItemCount
	adds r2, r0, #0
	cmp r2, #0
	bne _08094FEC
	ldr r0, [r6, #0x38]
	adds r0, #8
	movs r1, #8
	ands r0, r1
	b _08095000
	.align 2, 0
_08094FE4: .4byte gBg0Tm + 0x244
_08094FE8: .4byte 0x02012A20
_08094FEC:
	ldr r1, [r6, #0x38]
	adds r0, r1, #0
	mov r3, r8
	ands r0, r3
	cmp r2, r0
	bgt _08095002
	movs r0, #8
	ands r1, r0
	adds r0, r1, r2
	subs r0, #1
_08095000:
	str r0, [r6, #0x38]
_08095002:
	ldr r0, _08095040 @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08095014
	ldr r0, _08095044 @ =0x0000038A
	bl m4aSongNumStart
_08095014:
	movs r0, #0
	bl sub_80A998C
	ldr r1, [r6, #0x38]
	str r1, [r6, #0x34]
	movs r0, #0xff
	str r0, [r6, #0x38]
	asrs r2, r1, #3
	lsls r0, r2, #3
	subs r0, r0, r2
	lsls r0, r0, #4
	adds r0, #0x10
	movs r2, #7
	ands r1, r2
	lsls r1, r1, #4
	adds r1, #0x48
	movs r3, #0x80
	lsls r3, r3, #4
	movs r2, #0xb
	bl ShowSysHandCursor
	b _080951B6
	.align 2, 0
_08095040: .4byte gPlaySt
_08095044: .4byte 0x0000038A
_08095048:
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	bne _08095052
	b _08095154
_08095052:
	str r4, [r6, #0x34]
	str r2, [r6, #0x38]
	asrs r1, r4, #3
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #4
	adds r0, #0x10
	movs r1, #7
	ands r4, r1
	lsls r1, r4, #4
	adds r1, #0x48
	movs r3, #0x80
	lsls r3, r3, #4
	movs r2, #0xb
	bl ShowSysHandCursor
	ldr r0, _0809508C @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08095084
	ldr r0, _08095090 @ =0x0000038B
	bl m4aSongNumStart
_08095084:
	movs r0, #0
	bl sub_80A998C
	b _080951B6
	.align 2, 0
_0809508C: .4byte gPlaySt
_08095090: .4byte 0x0000038B
_08095094:
	movs r2, #1
	adds r0, r2, #0
	ands r0, r1
	cmp r0, #0
	beq _08095128
	ldr r0, [r6, #0x34]
	asrs r0, r0, #3
	adds r0, #1
	ands r0, r2
	lsls r0, r0, #2
	adds r1, r6, #0
	adds r1, #0x2c
	adds r1, r1, r0
	ldr r0, [r1]
	bl GetUnitItemCount
	adds r4, r0, #0
	ldr r2, [r6, #0x34]
	str r2, [r6, #0x38]
	asrs r0, r2, #3
	lsls r1, r0, #3
	subs r1, r1, r0
	lsls r1, r1, #4
	adds r1, #0x10
	movs r0, #7
	ands r2, r0
	lsls r2, r2, #4
	adds r2, #0x48
	movs r0, #0
	movs r3, #0
	bl sub_80A98DC
	cmp r4, #4
	bgt _080950E4
	ldr r0, [r6, #0x34]
	adds r0, #8
	movs r1, #8
	ands r0, r1
	adds r0, r0, r4
	b _080950EC
_080950E4:
	ldr r0, [r6, #0x34]
	adds r0, #8
	movs r1, #0xf
	ands r0, r1
_080950EC:
	str r0, [r6, #0x34]
	ldr r1, [r6, #0x34]
	asrs r2, r1, #3
	lsls r0, r2, #3
	subs r0, r0, r2
	lsls r0, r0, #4
	adds r0, #0x10
	movs r2, #7
	ands r1, r2
	lsls r1, r1, #4
	adds r1, #0x48
	movs r3, #0x80
	lsls r3, r3, #4
	movs r2, #0xb
	bl ShowSysHandCursor
	ldr r0, _08095120 @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080951B6
	ldr r0, _08095124 @ =0x0000038A
	bl m4aSongNumStart
	b _080951B6
	.align 2, 0
_08095120: .4byte gPlaySt
_08095124: .4byte 0x0000038A
_08095128:
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _08095154
	adds r0, r6, #0
	bl Proc_Break
	ldr r0, _0809514C @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080951B6
	ldr r0, _08095150 @ =0x0000038B
	bl m4aSongNumStart
	b _080951B6
	.align 2, 0
_0809514C: .4byte gPlaySt
_08095150: .4byte 0x0000038B
_08095154:
	adds r0, r6, #0
	bl sub_80948CC
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080951B6
	ldr r1, [r6, #0x34]
	asrs r2, r1, #3
	lsls r0, r2, #3
	subs r0, r0, r2
	lsls r0, r0, #4
	adds r0, #0x10
	movs r5, #7
	ands r1, r5
	lsls r1, r1, #4
	adds r1, #0x48
	movs r3, #0x80
	lsls r3, r3, #4
	movs r2, #0xb
	bl ShowSysHandCursor
	ldr r0, [r6, #0x3c]
	cmp r0, #0xff
	beq _080951B6
	ldr r2, [r6, #0x34]
	asrs r4, r2, #3
	lsls r1, r4, #2
	adds r0, r6, #0
	adds r0, #0x2c
	adds r0, r0, r1
	ldr r0, [r0]
	adds r3, r5, #0
	ands r3, r2
	lsls r1, r3, #1
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r2, [r0]
	cmp r2, #0
	beq _080951B6
	lsls r0, r4, #3
	subs r0, r0, r4
	lsls r0, r0, #4
	adds r0, #0x10
	lsls r1, r3, #4
_080951AC:
	adds r1, #0x48
	bl StartItemHelpBox
	ldr r0, [r6, #0x34]
_080951B4:
	str r0, [r6, #0x3c]
_080951B6:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_80951C0
sub_80951C0: @ 0x080951C0
	push {lr}
	bl EndMuralBackground_
	movs r0, #0
	bl EndFaceById
	movs r0, #1
	bl EndFaceById
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_80951D8
sub_80951D8: @ 0x080951D8
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r1, r2, #0
	ldr r0, _080951F8 @ =gUnk_08D8CF74
	bl Proc_StartBlocking
	str r4, [r0, #0x2c]
	str r5, [r0, #0x30]
	movs r1, #1
	rsbs r1, r1, #0
	str r1, [r0, #0x40]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080951F8: .4byte gUnk_08D8CF74

	thumb_func_start sub_80951FC
sub_80951FC: @ 0x080951FC
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r6, r2, #0
	adds r1, r3, #0
	ldr r0, _08095218 @ =gUnk_08D8CF74
	bl Proc_StartBlocking
	str r4, [r0, #0x2c]
	str r5, [r0, #0x30]
	str r6, [r0, #0x40]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08095218: .4byte gUnk_08D8CF74

	thumb_func_start sub_809521C
sub_809521C: @ 0x0809521C
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	ldr r5, _08095248 @ =gpKeySt
	ldr r0, [r5]
	ldrh r1, [r0, #6]
	movs r7, #0x40
	adds r0, r7, #0
	ands r0, r1
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	cmp r6, #0
	beq _0809525E
	ldr r0, [r4, #0x2c]
	bl GetUnitItemCount
	adds r2, r0, #0
	ldr r0, [r4, #0x30]
	cmp r0, #0
	ble _0809524C
	subs r0, #1
	str r0, [r4, #0x30]
	b _0809528A
	.align 2, 0
_08095248: .4byte gpKeySt
_0809524C:
	ldr r1, [r5]
	adds r0, r7, #0
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _080952A8
	subs r0, r2, #1
	str r0, [r4, #0x30]
	b _0809528A
_0809525E:
	movs r7, #0x80
	adds r0, r7, #0
	ands r0, r1
	cmp r0, #0
	beq _080952A8
	ldr r0, [r4, #0x2c]
	bl GetUnitItemCount
	subs r0, #1
	ldr r1, [r4, #0x30]
	cmp r1, r0
	bge _0809527C
	adds r0, r1, #1
	str r0, [r4, #0x30]
	b _0809528A
_0809527C:
	ldr r1, [r5]
	adds r0, r7, #0
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _080952A8
	str r6, [r4, #0x30]
_0809528A:
	ldr r0, _080952A0 @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0809529C
	ldr r0, _080952A4 @ =0x00000386
	bl m4aSongNumStart
_0809529C:
	movs r0, #1
	b _080952AA
	.align 2, 0
_080952A0: .4byte gPlaySt
_080952A4: .4byte 0x00000386
_080952A8:
	movs r0, #0
_080952AA:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	thumb_func_start sub_80952B0
sub_80952B0: @ 0x080952B0
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #8
	mov r8, r0
	ldr r6, _0809530C @ =0x020129A8
	adds r5, r6, #0
	movs r4, #7
_080952C0:
	adds r0, r5, #0
	bl ClearText
	adds r5, #8
	subs r4, #1
	cmp r4, #0
	bge _080952C0
	adds r0, r6, #0
	adds r6, #8
	ldr r4, _08095310 @ =gBg2Tm + 0x122
	movs r5, #0
	str r5, [sp]
	ldr r1, _08095314 @ =gUnk_0842CFFC
	str r1, [sp, #4]
	adds r1, r4, #0
	movs r2, #3
	movs r3, #0
	bl PutDrawText
	mov r0, r8
	bl UnitHasMagicRank
	lsls r0, r0, #0x18
	asrs r2, r0, #0x18
	cmp r2, #0
	beq _0809531C
	adds r0, r6, #0
	adds r6, #8
	adds r1, r4, #0
	adds r1, #0x80
	str r5, [sp]
	ldr r2, _08095318 @ =gUnk_0842D004
	str r2, [sp, #4]
	movs r2, #3
	movs r3, #0
	bl PutDrawText
	b _08095332
	.align 2, 0
_0809530C: .4byte 0x020129A8
_08095310: .4byte gBg2Tm + 0x122
_08095314: .4byte gUnk_0842CFFC
_08095318: .4byte gUnk_0842D004
_0809531C:
	adds r0, r6, #0
	adds r6, #8
	adds r1, r4, #0
	adds r1, #0x80
	str r2, [sp]
	ldr r2, _08095404 @ =gUnk_0842D00C
	str r2, [sp, #4]
	movs r2, #3
	movs r3, #4
	bl PutDrawText
_08095332:
	adds r0, r6, #0
	adds r6, #8
	ldr r7, _08095408 @ =gBg2Tm + 0x222
	movs r5, #0
	str r5, [sp]
	ldr r1, _0809540C @ =gUnk_0842D010
	str r1, [sp, #4]
	adds r1, r7, #0
	movs r2, #3
	movs r3, #4
	bl PutDrawText
	adds r0, r6, #0
	adds r6, #8
	adds r1, r7, #0
	adds r1, #0x80
	str r5, [sp]
	ldr r2, _08095410 @ =gUnk_0842D014
	str r2, [sp, #4]
	movs r2, #3
	movs r3, #0
	bl PutDrawText
	adds r0, r6, #0
	adds r6, #8
	adds r1, r7, #0
	subs r1, #0xf4
	str r5, [sp]
	ldr r2, _08095414 @ =gUnk_0842D01C
	str r2, [sp, #4]
	movs r2, #3
	movs r3, #0
	bl PutDrawText
	adds r0, r6, #0
	adds r6, #8
	adds r1, r7, #0
	subs r1, #0x74
	str r5, [sp]
	ldr r2, _08095418 @ =gUnk_0842D024
	str r2, [sp, #4]
	movs r2, #3
	movs r3, #0
	bl PutDrawText
	adds r0, r6, #0
	adds r6, #8
	adds r1, r7, #0
	adds r1, #0xc
	str r5, [sp]
	ldr r2, _0809541C @ =gUnk_0842D02C
	str r2, [sp, #4]
	movs r2, #3
	movs r3, #0
	bl PutDrawText
	adds r0, r6, #0
	adds r6, #8
	adds r1, r7, #0
	adds r1, #0x8c
	str r5, [sp]
	ldr r2, _08095420 @ =gUnk_0842D034
	str r2, [sp, #4]
	movs r2, #3
	movs r3, #0
	bl PutDrawText
	mov r1, r8
	ldr r0, [r1, #4]
	ldrh r0, [r0]
	bl DecodeMsg
	adds r4, r0, #0
	movs r0, #0x38
	adds r1, r4, #0
	bl GetStringTextCenteredPos
	adds r3, r0, #0
	adds r0, r6, #0
	ldr r2, _08095424 @ =0xFFFFFE0A
	adds r1, r7, r2
	str r5, [sp]
	str r4, [sp, #4]
	movs r2, #0
	bl PutDrawText
	ldr r1, _08095428 @ =0xFFFFFE02
	adds r0, r7, r1
	movs r1, #3
	movs r2, #0x24
	bl PutSpecialChar
	ldr r2, _0809542C @ =0xFFFFFE04
	adds r0, r7, r2
	movs r1, #3
	movs r2, #0x25
	bl PutSpecialChar
	add sp, #8
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08095404: .4byte gUnk_0842D00C
_08095408: .4byte gBg2Tm + 0x222
_0809540C: .4byte gUnk_0842D010
_08095410: .4byte gUnk_0842D014
_08095414: .4byte gUnk_0842D01C
_08095418: .4byte gUnk_0842D024
_0809541C: .4byte gUnk_0842D02C
_08095420: .4byte gUnk_0842D034
_08095424: .4byte 0xFFFFFE0A
_08095428: .4byte 0xFFFFFE02
_0809542C: .4byte 0xFFFFFE04

	thumb_func_start sub_8095430
sub_8095430: @ 0x08095430
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #0x2c
	adds r5, r0, #0
	mov r8, r1
	movs r0, #2
	bl ApplyUiStatBarPal
	add r4, sp, #0xc
	adds r0, r5, #0
	bl GetUnitCurrentHp
	adds r1, r0, #0
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r2, r0, #3
	movs r0, #0xc0
	ldrb r3, [r5, #0xb]
	ands r0, r3
	cmp r0, #0x80
	beq _08095462
	adds r0, r2, #0
	movs r1, #0x3c
	b _08095466
_08095462:
	adds r0, r1, #0
	movs r1, #5
_08095466:
	bl __divsi3
	str r0, [r4]
	adds r0, r5, #0
	bl GetUnitPower
	adds r1, r0, #0
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #3
	ldr r1, [r5, #4]
	ldrb r1, [r1, #0x14]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	bl __divsi3
	str r0, [sp, #0x10]
	adds r0, r5, #0
	bl GetUnitSkill
	adds r1, r0, #0
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #3
	ldr r1, [r5, #4]
	ldrb r1, [r1, #0x15]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	bl __divsi3
	str r0, [sp, #0x14]
	adds r0, r5, #0
	bl GetUnitSpeed
	adds r1, r0, #0
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #3
	ldr r1, [r5, #4]
	ldrb r1, [r1, #0x16]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	bl __divsi3
	str r0, [sp, #0x18]
	adds r0, r5, #0
	bl GetUnitLuck
	adds r1, r0, #0
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #3
	movs r1, #0x1e
	bl __divsi3
	str r0, [sp, #0x1c]
	adds r0, r5, #0
	bl GetUnitDefense
	adds r1, r0, #0
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #3
	ldr r1, [r5, #4]
	ldrb r1, [r1, #0x17]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	bl __divsi3
	str r0, [sp, #0x20]
	adds r0, r5, #0
	bl GetUnitResistance
	adds r1, r0, #0
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #3
	ldr r4, [r5, #4]
	movs r1, #0x18
	ldrsb r1, [r4, r1]
	bl __divsi3
	str r0, [sp, #0x24]
	movs r1, #0x11
	ldrsb r1, [r4, r1]
	ldr r0, [r5]
	ldrb r0, [r0, #0x13]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r1, r1, r0
	movs r0, #0x1a
	ldrsb r0, [r5, r0]
	adds r1, r1, r0
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #3
	movs r1, #0x19
	ldrsb r1, [r4, r1]
	bl __divsi3
	str r0, [sp, #0x28]
	movs r5, #0
	add r6, sp, #0xc
	movs r7, #0xe0
	lsls r7, r7, #7
_08095538:
	mov r4, r8
	asrs r4, r5
	movs r0, #1
	ands r4, r0
	cmp r4, #0
	beq _0809557C
	lsls r0, r7, #0xf
	lsrs r0, r0, #0x14
	movs r2, #3
	ands r2, r5
	lsls r2, r2, #6
	adds r2, #0xb3
	asrs r3, r5, #2
	lsls r1, r3, #1
	adds r1, r1, r3
	lsls r1, r1, #1
	adds r2, r2, r1
	lsls r2, r2, #1
	ldr r1, _08095578 @ =gBg0Tm
	adds r2, r2, r1
	movs r1, #0x18
	str r1, [sp]
	ldr r1, [r6]
	str r1, [sp, #4]
	movs r1, #0
	str r1, [sp, #8]
	movs r1, #4
	movs r3, #0xc0
	lsls r3, r3, #6
	bl PutDrawUiGauge
	b _080955AC
	.align 2, 0
_08095578: .4byte gBg0Tm
_0809557C:
	lsls r0, r7, #0xf
	lsrs r0, r0, #0x14
	movs r2, #3
	ands r2, r5
	lsls r2, r2, #6
	adds r2, #0xb3
	asrs r3, r5, #2
	lsls r1, r3, #1
	adds r1, r1, r3
	lsls r1, r1, #1
	adds r2, r2, r1
	lsls r2, r2, #1
	ldr r1, _080955CC @ =gBg0Tm
	adds r2, r2, r1
	movs r1, #0x18
	str r1, [sp]
	ldr r1, [r6]
	str r1, [sp, #4]
	str r4, [sp, #8]
	movs r1, #4
	movs r3, #0x80
	lsls r3, r3, #6
	bl PutDrawUiGauge
_080955AC:
	adds r6, #4
	movs r0, #0x80
	lsls r0, r0, #1
	adds r7, r7, r0
	adds r5, #1
	cmp r5, #7
	ble _08095538
	movs r0, #1
	bl EnableBgSync
	add sp, #0x2c
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080955CC: .4byte gBg0Tm

	thumb_func_start sub_80955D0
sub_80955D0: @ 0x080955D0
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	ldr r6, _080955EC @ =gBg2Tm + 0x12a
	bl GetUnitCurrentHp
	adds r1, r0, #0
	movs r0, #0xc0
	ldrb r2, [r4, #0xb]
	ands r0, r2
	cmp r0, #0x80
	bne _080955F0
	cmp r1, #0x78
	beq _080955F4
	b _080955F8
	.align 2, 0
_080955EC: .4byte gBg2Tm + 0x12a
_080955F0:
	cmp r1, #0x3c
	bne _080955F8
_080955F4:
	movs r5, #4
	b _080955FA
_080955F8:
	movs r5, #2
_080955FA:
	adds r0, r4, #0
	bl GetUnitCurrentHp
	adds r2, r0, #0
	adds r0, r6, #0
	adds r1, r5, #0
	bl PutNumberOrBlank
	ldr r5, _08095748 @ =gBg2Tm + 0x1aa
	adds r0, r4, #0
	bl GetUnitPower
	ldr r1, [r4, #4]
	ldrb r1, [r1, #0x14]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	movs r6, #2
	cmp r0, r1
	bne _08095622
	movs r6, #4
_08095622:
	adds r0, r4, #0
	bl GetUnitPower
	adds r2, r0, #0
	adds r0, r5, #0
	adds r1, r6, #0
	bl PutNumberOrBlank
	adds r7, r5, #0
	adds r7, #0x80
	adds r0, r4, #0
	bl GetUnitSkill
	ldr r1, [r4, #4]
	ldrb r1, [r1, #0x15]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	movs r6, #2
	cmp r0, r1
	bne _0809564C
	movs r6, #4
_0809564C:
	adds r0, r4, #0
	bl GetUnitSkill
	adds r2, r0, #0
	adds r0, r7, #0
	adds r1, r6, #0
	bl PutNumberOrBlank
	movs r0, #0x80
	lsls r0, r0, #1
	adds r7, r5, r0
	adds r0, r4, #0
	bl GetUnitSpeed
	ldr r1, [r4, #4]
	ldrb r1, [r1, #0x16]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	movs r6, #2
	cmp r0, r1
	bne _08095678
	movs r6, #4
_08095678:
	adds r0, r4, #0
	bl GetUnitSpeed
	adds r2, r0, #0
	adds r0, r7, #0
	adds r1, r6, #0
	bl PutNumberOrBlank
	adds r7, r5, #0
	subs r7, #0x74
	adds r0, r4, #0
	bl GetUnitLuck
	movs r6, #2
	cmp r0, #0x1e
	bne _0809569A
	movs r6, #4
_0809569A:
	adds r0, r4, #0
	bl GetUnitLuck
	adds r2, r0, #0
	adds r0, r7, #0
	adds r1, r6, #0
	bl PutNumberOrBlank
	adds r7, r5, #0
	adds r7, #0xc
	adds r0, r4, #0
	bl GetUnitDefense
	ldr r1, [r4, #4]
	ldrb r1, [r1, #0x17]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	movs r6, #2
	cmp r0, r1
	bne _080956C4
	movs r6, #4
_080956C4:
	adds r0, r4, #0
	bl GetUnitDefense
	adds r2, r0, #0
	adds r0, r7, #0
	adds r1, r6, #0
	bl PutNumberOrBlank
	adds r7, r5, #0
	adds r7, #0x8c
	adds r0, r4, #0
	bl GetUnitResistance
	ldr r1, [r4, #4]
	ldrb r1, [r1, #0x18]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	movs r6, #2
	cmp r0, r1
	bne _080956EE
	movs r6, #4
_080956EE:
	adds r0, r4, #0
	bl GetUnitResistance
	adds r2, r0, #0
	adds r0, r7, #0
	adds r1, r6, #0
	bl PutNumberOrBlank
	movs r1, #0x86
	lsls r1, r1, #1
	adds r6, r5, r1
	ldr r2, [r4, #4]
	movs r1, #0x11
	ldrsb r1, [r2, r1]
	ldr r0, [r4]
	ldrb r0, [r0, #0x13]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r1, r1, r0
	movs r0, #0x1a
	ldrsb r0, [r4, r0]
	adds r3, r1, r0
	movs r0, #0x19
	ldrsb r0, [r2, r0]
	movs r1, #2
	cmp r3, r0
	bne _08095726
	movs r1, #4
_08095726:
	adds r0, r6, #0
	adds r2, r3, #0
	bl PutNumberOrBlank
	ldr r2, _0809574C @ =0xFFFFFE80
	adds r0, r5, r2
	movs r2, #8
	ldrsb r2, [r4, r2]
	movs r1, #2
	bl PutNumberOrBlank
	movs r0, #4
	bl EnableBgSync
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08095748: .4byte gBg2Tm + 0x1aa
_0809574C: .4byte 0xFFFFFE80

	thumb_func_start sub_8095750
sub_8095750: @ 0x08095750
	push {r4, r5, r6, lr}
	sub sp, #8
	adds r6, r0, #0
	adds r5, r1, #0
	ldr r4, _080957C0 @ =0x02012A70
	adds r0, r4, #0
	bl ClearText
	adds r4, #8
	adds r0, r4, #0
	bl ClearText
	movs r0, #1
	rsbs r0, r0, #0
	cmp r5, r0
	beq _080957EE
	lsls r1, r5, #1
	adds r0, r6, #0
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r5, [r0]
	adds r0, r5, #0
	bl GetItemUseDescId
	adds r4, r0, #0
	ldr r0, _080957C4 @ =gUnk_0842D03C
	ldr r1, [r0, #4]
	ldr r0, [r0]
	str r0, [sp]
	str r1, [sp, #4]
	cmp r4, #0
	beq _080957EE
	adds r0, r6, #0
	adds r1, r5, #0
	bl sub_80284C8
	cmp r0, #0
	beq _080957CC
	ldr r0, [sp]
	movs r1, #0
	bl Text_SetColor
	ldr r0, [sp, #4]
	movs r1, #0
	bl Text_SetColor
	adds r0, r4, #0
	bl DecodeMsg
	adds r1, r0, #0
	ldr r2, _080957C8 @ =gBg0Tm + 0x39e
	mov r0, sp
	movs r3, #2
	bl PrintStringToTexts
	b _080957EE
	.align 2, 0
_080957C0: .4byte 0x02012A70
_080957C4: .4byte gUnk_0842D03C
_080957C8: .4byte gBg0Tm + 0x39e
_080957CC:
	ldr r0, [sp]
	movs r1, #1
	bl Text_SetColor
	ldr r0, [sp, #4]
	movs r1, #1
	bl Text_SetColor
	adds r0, r4, #0
	bl DecodeMsg
	adds r1, r0, #0
	ldr r2, _080957FC @ =gBg0Tm + 0x39e
	mov r0, sp
	movs r3, #2
	bl PrintStringToTexts
_080957EE:
	movs r0, #1
	bl EnableBgSync
	add sp, #8
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080957FC: .4byte gBg0Tm + 0x39e

	thumb_func_start sub_8095800
sub_8095800: @ 0x08095800
	push {lr}
	sub sp, #4
	movs r3, #0xc8
	lsls r3, r3, #8
	ldr r0, [r0, #0x2c]
	ldr r0, [r0, #4]
	ldrb r0, [r0, #4]
	str r0, [sp]
	movs r0, #0
	movs r1, #0x80
	movs r2, #2
	bl sub_8026628
	bl sub_80259A4
	add sp, #4
	pop {r0}
	bx r0

	thumb_func_start sub_8095824
sub_8095824: @ 0x08095824
	movs r1, #0
	str r1, [r0, #0x30]
	movs r1, #0xff
	str r1, [r0, #0x38]
	bx lr
	.align 2, 0

	thumb_func_start sub_8095830
sub_8095830: @ 0x08095830
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x28
	adds r7, r0, #0
	add r1, sp, #8
	ldr r0, _08095B2C @ =gUnk_0842D044
	ldm r0!, {r2, r3, r4}
	stm r1!, {r2, r3, r4}
	ldm r0!, {r2, r5, r6}
	stm r1!, {r2, r5, r6}
	ldm r0!, {r3, r4}
	stm r1!, {r3, r4}
	ldr r4, _08095B30 @ =gDispIo
	movs r0, #8
	rsbs r0, r0, #0
	ldrb r5, [r4]
	ands r0, r5
	strb r0, [r4]
	ldr r0, _08095B34 @ =gBgConfig_PrepScreen
	bl InitBgs
	add r0, sp, #8
	bl SetFaceConfig
	movs r0, #0xff
	str r0, [r7, #0x34]
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
	movs r2, #4
	rsbs r2, r2, #0
	adds r0, r2, #0
	ldrb r6, [r4, #0xc]
	ands r0, r6
	movs r1, #1
	orrs r0, r1
	strb r0, [r4, #0xc]
	adds r0, r2, #0
	ldrb r1, [r4, #0x10]
	ands r0, r1
	movs r1, #2
	orrs r0, r1
	strb r0, [r4, #0x10]
	ldrb r3, [r4, #0x14]
	ands r2, r3
	strb r2, [r4, #0x14]
	movs r0, #3
	ldrb r5, [r4, #0x18]
	orrs r0, r5
	strb r0, [r4, #0x18]
	bl ResetText
	bl InitIcons
	bl UnpackUiWindowFrameGraphics
	bl ApplySystemObjectsGraphics
	bl ApplyUnitSpritePalettes
	movs r0, #0
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	movs r0, #1
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	movs r0, #2
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	ldr r0, _08095B38 @ =0x06014000
	movs r1, #1
	rsbs r1, r1, #0
	bl LoadHelpBoxGfx
	movs r0, #4
	bl ApplyIconPalettes
	bl PrepRestartMuralBackground
	ldr r4, _08095B3C @ =0x02012A20
	movs r6, #4
	mov sl, r6
_08095904:
	adds r0, r4, #0
	movs r1, #7
	bl sub_800536C
	adds r4, #8
	movs r0, #1
	rsbs r0, r0, #0
	add sl, r0
	mov r1, sl
	cmp r1, #0
	bge _08095904
	ldr r4, _08095B40 @ =0x020129A8
	movs r2, #7
	mov sl, r2
_08095920:
	adds r0, r4, #0
	movs r1, #3
	bl InitText
	adds r4, #8
	movs r3, #1
	rsbs r3, r3, #0
	add sl, r3
	mov r5, sl
	cmp r5, #0
	bge _08095920
	movs r6, #8
	mov sl, r6
	ldr r0, _08095B40 @ =0x020129A8
	mov r8, r0
	adds r0, #0x40
	movs r1, #7
	bl InitText
	mov r0, r8
	adds r0, #0xc8
	movs r1, #0xf
	bl InitText
	mov r0, r8
	adds r0, #0xd0
	movs r1, #0xf
	bl InitText
	mov r0, r8
	adds r0, #0xd8
	movs r1, #0xc
	bl InitText
	mov r0, r8
	adds r0, #0xe0
	movs r1, #8
	bl InitText
	ldr r0, [r7, #0x2c]
	bl sub_80952B0
	ldr r0, [r7, #0x2c]
	bl sub_80955D0
	ldr r0, [r7, #0x2c]
	movs r1, #0
	bl sub_8095430
	ldr r0, [r7, #0x2c]
	bl GetUnitPortraitId
	adds r1, r0, #0
	movs r3, #4
	rsbs r3, r3, #0
	ldr r0, _08095B44 @ =0x00000203
	str r0, [sp]
	movs r0, #0
	movs r2, #0x40
	bl StartBmFace
	movs r0, #0xc0
	lsls r0, r0, #7
	movs r1, #5
	bl sub_809228C
	movs r0, #0xc0
	lsls r0, r0, #6
	movs r1, #0xa
	bl sub_80922DC
	ldr r0, _08095B48 @ =gBg1Tm
	ldr r1, _08095B4C @ =gUnk_0842973C
	movs r2, #0xa6
	lsls r2, r2, #7
	bl TmApplyTsa_thm
	movs r0, #7
	bl EnableBgSync
	movs r1, #0xe0
	lsls r1, r1, #4
	movs r3, #0xc0
	lsls r3, r3, #4
	movs r2, #0
	str r2, [sp]
	str r7, [sp, #4]
	movs r0, #0xd
	movs r2, #0xf
	bl StartSysBrownBox
	movs r1, #0x28
	rsbs r1, r1, #0
	movs r2, #1
	rsbs r2, r2, #0
	movs r0, #0
	movs r3, #1
	bl EnableSysBrownBox
	ldr r0, [r7, #0x2c]
	ldr r0, [r0]
	ldrh r0, [r0]
	bl DecodeMsg
	adds r4, r0, #0
	bl GetStringTextLen
	movs r3, #0x30
	subs r3, r3, r0
	lsrs r0, r3, #0x1f
	adds r3, r3, r0
	asrs r3, r3, #1
	movs r0, #6
	str r0, [sp]
	str r4, [sp, #4]
	movs r0, #0
	ldr r1, _08095B50 @ =gBg0Tm
	movs r2, #0
	bl PutDrawText
	adds r0, r7, #0
	bl sub_80A98C8
	adds r0, r7, #0
	bl ResetSysHandCursor
	movs r0, #0xc0
	lsls r0, r0, #3
	movs r1, #1
	bl DisplaySysHandCursorTextShadow
	ldr r0, _08095B54 @ =sub_8095800
	adds r1, r7, #0
	bl StartParallelWorker
	ldr r3, _08095B30 @ =gDispIo
	mov ip, r3
	movs r0, #0x20
	ldrb r4, [r3, #1]
	orrs r0, r4
	movs r1, #0x41
	rsbs r1, r1, #0
	ands r0, r1
	movs r1, #0x7f
	ands r0, r1
	strb r0, [r3, #1]
	mov r1, ip
	adds r1, #0x2d
	movs r0, #0x68
	strb r0, [r1]
	adds r1, #4
	movs r0, #0x6e
	strb r0, [r1]
	subs r1, #5
	movs r0, #0xf0
	strb r0, [r1]
	adds r1, #4
	movs r0, #0x92
	strb r0, [r1]
	movs r0, #1
	ldr r5, _08095B58 @ =0x030027C4
	ldrb r1, [r5]
	orrs r1, r0
	movs r6, #2
	orrs r1, r6
	movs r4, #4
	orrs r1, r4
	movs r3, #8
	orrs r1, r3
	movs r2, #0x10
	orrs r1, r2
	movs r5, #0x36
	add r5, ip
	mov sb, r5
	ldrb r6, [r5]
	orrs r0, r6
	movs r5, #2
	orrs r0, r5
	orrs r0, r4
	orrs r0, r3
	orrs r0, r2
	movs r6, #0x20
	orrs r1, r6
	ldr r2, _08095B58 @ =0x030027C4
	strb r1, [r2]
	movs r1, #0x21
	rsbs r1, r1, #0
	ands r0, r1
	mov r3, sb
	strb r0, [r3]
	mov r1, ip
	adds r1, #0x3c
	movs r0, #0xc0
	ldrb r4, [r1]
	orrs r0, r4
	strb r0, [r1]
	mov r0, ip
	adds r0, #0x44
	movs r5, #0
	strb r5, [r0]
	adds r0, #1
	strb r5, [r0]
	adds r0, #1
	mov r6, sl
	strb r6, [r0]
	ldr r0, _08095B5C @ =0x0000FFE0
	mov r1, ip
	ldrh r1, [r1, #0x3c]
	ands r0, r1
	movs r1, #8
	orrs r0, r1
	mov r2, ip
	strh r0, [r2, #0x3c]
	adds r0, r7, #0
	bl StartGreenText
	movs r0, #0xc0
	movs r1, #0x8c
	adds r2, r7, #0
	bl StartHelpPromptSprite
	ldr r0, [r7, #0x2c]
	ldr r1, [r7, #0x30]
	bl sub_8095750
	mov r1, r8
	adds r1, #0x78
	ldr r2, [r7, #0x2c]
	ldr r0, _08095B60 @ =gBg0Tm + 0x244
	movs r3, #1
	bl sub_8094AC0
	ldr r1, [r7, #0x30]
	asrs r2, r1, #3
	lsls r0, r2, #3
	subs r0, r0, r2
	lsls r0, r0, #4
	adds r0, #0x10
	movs r2, #7
	ands r1, r2
	lsls r1, r1, #4
	adds r1, #0x48
	movs r3, #0x80
	lsls r3, r3, #4
	movs r2, #0xb
	bl ShowSysHandCursor
	ldr r0, [r7, #0x2c]
	bl GetUnitSMSId
	bl StartUiSMS
	bl ForceSyncUnitSpriteSheet
	add sp, #0x28
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08095B2C: .4byte gUnk_0842D044
_08095B30: .4byte gDispIo
_08095B34: .4byte gBgConfig_PrepScreen
_08095B38: .4byte 0x06014000
_08095B3C: .4byte 0x02012A20
_08095B40: .4byte 0x020129A8
_08095B44: .4byte 0x00000203
_08095B48: .4byte gBg1Tm
_08095B4C: .4byte gUnk_0842973C
_08095B50: .4byte gBg0Tm
_08095B54: .4byte sub_8095800
_08095B58: .4byte 0x030027C4
_08095B5C: .4byte 0x0000FFE0
_08095B60: .4byte gBg0Tm + 0x244

	thumb_func_start sub_8095B64
sub_8095B64: @ 0x08095B64
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x38]
	cmp r0, #0xff
	beq _08095B8C
	ldr r0, _08095B88 @ =gpKeySt
	ldr r1, [r0]
	movs r0, #0x81
	lsls r0, r0, #1
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _08095C40
	bl CloseHelpBox
	movs r0, #0xff
	b _08095C88
	.align 2, 0
_08095B88: .4byte gpKeySt
_08095B8C:
	ldr r0, _08095BEC @ =gpKeySt
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r1
	cmp r0, #0
	bne _08095C6C
	movs r5, #1
	adds r0, r5, #0
	ands r0, r1
	cmp r0, #0
	beq _08095C14
	ldr r0, [r4, #0x2c]
	ldr r2, [r4, #0x30]
	lsls r2, r2, #1
	adds r1, r0, #0
	adds r1, #0x1e
	adds r1, r1, r2
	ldrh r1, [r1]
	bl sub_80284C8
	cmp r0, #0
	beq _08095BF8
	ldr r2, [r4, #0x30]
	str r2, [r4, #0x34]
	lsls r2, r2, #4
	adds r2, #0x48
	movs r0, #0
	movs r1, #0x10
	movs r3, #0
	bl sub_80A98DC
	str r5, [r4, #0x3c]
	ldr r0, _08095BF0 @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08095BE2
	ldr r0, _08095BF4 @ =0x0000038A
	bl m4aSongNumStart
_08095BE2:
	adds r0, r4, #0
	movs r1, #2
	bl Proc_Goto
	b _08095C8A
	.align 2, 0
_08095BEC: .4byte gpKeySt
_08095BF0: .4byte gPlaySt
_08095BF4: .4byte 0x0000038A
_08095BF8:
	ldr r0, _08095C10 @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08095C8A
	movs r0, #0xe3
	lsls r0, r0, #2
	bl m4aSongNumStart
	b _08095C8A
	.align 2, 0
_08095C10: .4byte gPlaySt
_08095C14:
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _08095C40
	adds r0, r4, #0
	movs r1, #5
	bl Proc_Goto
	ldr r0, _08095C38 @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08095C8A
	ldr r0, _08095C3C @ =0x0000038B
	bl m4aSongNumStart
	b _08095C8A
	.align 2, 0
_08095C38: .4byte gPlaySt
_08095C3C: .4byte 0x0000038B
_08095C40:
	adds r0, r4, #0
	bl sub_809521C
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08095C8A
	ldr r1, [r4, #0x30]
	lsls r1, r1, #4
	adds r1, #0x48
	movs r3, #0x80
	lsls r3, r3, #4
	movs r0, #0x10
	movs r2, #0xb
	bl ShowSysHandCursor
	ldr r0, [r4, #0x2c]
	ldr r1, [r4, #0x30]
	bl sub_8095750
	ldr r0, [r4, #0x38]
	cmp r0, #0xff
	beq _08095C8A
_08095C6C:
	ldr r0, [r4, #0x2c]
	ldr r3, [r4, #0x30]
	lsls r1, r3, #1
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r2, [r0]
	cmp r2, #0
	beq _08095C8A
	lsls r1, r3, #4
	adds r1, #0x48
	movs r0, #0x10
	bl StartItemHelpBox
	ldr r0, [r4, #0x30]
_08095C88:
	str r0, [r4, #0x38]
_08095C8A:
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start sub_8095C90
sub_8095C90: @ 0x08095C90
	push {lr}
	bl EndMuralBackground_
	movs r0, #0
	bl EndFaceById
	movs r0, #1
	bl EndFaceById
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_8095CA8
sub_8095CA8: @ 0x08095CA8
	push {r4, r5, r6, lr}
	sub sp, #8
	ldr r4, _08095D08 @ =0x02012A80
	adds r0, r4, #0
	bl ClearText
	adds r0, r4, #0
	adds r4, #8
	ldr r5, _08095D0C @ =gBg2Tm + 0x364
	movs r6, #0
	str r6, [sp]
	ldr r1, _08095D10 @ =gUnk_0842D064
	str r1, [sp, #4]
	adds r1, r5, #0
	movs r2, #0
	movs r3, #0
	bl PutDrawText
	adds r0, r4, #0
	bl ClearText
	adds r5, #0x82
	str r6, [sp]
	ldr r0, _08095D14 @ =gUnk_0842D07C
	str r0, [sp, #4]
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #0
	movs r3, #0
	bl PutDrawText
	str r6, [sp]
	ldr r0, _08095D18 @ =gUnk_0842D084
	str r0, [sp, #4]
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #0
	movs r3, #0x20
	bl PutDrawText
	movs r0, #4
	bl EnableBgSync
	add sp, #8
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08095D08: .4byte 0x02012A80
_08095D0C: .4byte gBg2Tm + 0x364
_08095D10: .4byte gUnk_0842D064
_08095D14: .4byte gUnk_0842D07C
_08095D18: .4byte gUnk_0842D084

	thumb_func_start sub_8095D1C
sub_8095D1C: @ 0x08095D1C
	push {lr}
	ldr r0, _08095D34 @ =gBg2Tm + 0x364
	movs r1, #0xc
	movs r2, #4
	movs r3, #0
	bl TmFillRect_thm
	movs r0, #4
	bl EnableBgSync
	pop {r0}
	bx r0
	.align 2, 0
_08095D34: .4byte gBg2Tm + 0x364

	thumb_func_start sub_8095D38
sub_8095D38: @ 0x08095D38
	push {r4, lr}
	adds r4, r0, #0
	bl sub_8095CA8
	ldr r0, [r4, #0x3c]
	lsls r0, r0, #5
	adds r0, #0x94
	movs r3, #0x80
	lsls r3, r3, #4
	movs r1, #0x78
	movs r2, #0
	bl ShowSysHandCursor
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_8095D58
sub_8095D58: @ 0x08095D58
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r4, r0, #0
	ldr r7, [r4, #0x3c]
	ldr r0, _08095DB0 @ =0x0000A580
	str r0, [sp]
	movs r0, #0x88
	movs r1, #0x64
	movs r2, #0xb
	movs r3, #4
	bl sub_80935C4
	ldr r5, _08095DB4 @ =gpKeySt
	ldr r1, [r5]
	ldrh r3, [r1, #8]
	movs r0, #2
	ands r0, r3
	cmp r0, #0
	beq _08095DC0
	ldr r1, [r4, #0x30]
	lsls r1, r1, #4
	adds r1, #0x48
	movs r3, #0x80
	lsls r3, r3, #4
	movs r0, #0x10
	movs r2, #0xb
	bl ShowSysHandCursor
	movs r0, #0
	bl sub_80A998C
	bl sub_8095D1C
	ldr r0, _08095DB8 @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08095E26
	ldr r0, _08095DBC @ =0x0000038B
	bl m4aSongNumStart
	b _08095E26
	.align 2, 0
_08095DB0: .4byte 0x0000A580
_08095DB4: .4byte gpKeySt
_08095DB8: .4byte gPlaySt
_08095DBC: .4byte 0x0000038B
_08095DC0:
	movs r6, #1
	adds r2, r6, #0
	ands r2, r3
	cmp r2, #0
	beq _08095E38
	bl sub_8095D1C
	ldr r0, [r4, #0x3c]
	cmp r0, #0
	bne _08095DFC
	bl HideSysHandCursor
	ldr r0, _08095DF4 @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08095DEA
	ldr r0, _08095DF8 @ =0x0000038A
	bl m4aSongNumStart
_08095DEA:
	adds r0, r4, #0
	movs r1, #3
	bl Proc_Goto
	b _08095E7A
	.align 2, 0
_08095DF4: .4byte gPlaySt
_08095DF8: .4byte 0x0000038A
_08095DFC:
	ldr r1, [r4, #0x30]
	lsls r1, r1, #4
	adds r1, #0x48
	movs r3, #0x80
	lsls r3, r3, #4
	movs r0, #0x10
	movs r2, #0xb
	bl ShowSysHandCursor
	ldr r0, _08095E30 @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08095E20
	ldr r0, _08095E34 @ =0x0000038B
	bl m4aSongNumStart
_08095E20:
	movs r0, #0
	bl sub_80A998C
_08095E26:
	adds r0, r4, #0
	bl Proc_Break
	b _08095E7A
	.align 2, 0
_08095E30: .4byte gPlaySt
_08095E34: .4byte 0x0000038B
_08095E38:
	movs r0, #0x20
	ldrh r1, [r1, #6]
	ands r0, r1
	cmp r0, #0
	beq _08095E44
	str r2, [r4, #0x3c]
_08095E44:
	ldr r1, [r5]
	movs r0, #0x10
	ldrh r1, [r1, #6]
	ands r0, r1
	cmp r0, #0
	beq _08095E52
	str r6, [r4, #0x3c]
_08095E52:
	ldr r0, [r4, #0x3c]
	cmp r7, r0
	beq _08095E7A
	lsls r0, r0, #5
	adds r0, #0x94
	movs r3, #0x80
	lsls r3, r3, #4
	movs r1, #0x78
	movs r2, #0
	bl ShowSysHandCursor
	ldr r0, _08095E84 @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08095E7A
	ldr r0, _08095E88 @ =0x00000387
	bl m4aSongNumStart
_08095E7A:
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08095E84: .4byte gPlaySt
_08095E88: .4byte 0x00000387

	thumb_func_start PrepItemUse_HandleItemEffect
PrepItemUse_HandleItemEffect: @ 0x08095E8C
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, [r4, #0x2c]
	ldr r0, [r4, #0x30]
	lsls r0, r0, #1
	adds r1, #0x1e
	adds r1, r1, r0
	ldrh r0, [r1]
	bl GetItemIndex
	subs r0, #0x63
	cmp r0, #0x33
	bhi _08095F9E
	lsls r0, r0, #2
	ldr r1, _08095EB0 @ =_08095EB4
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08095EB0: .4byte _08095EB4
_08095EB4: @ jump table
	.4byte _08095F84 @ case 0
	.4byte _08095F84 @ case 1
	.4byte _08095F84 @ case 2
	.4byte _08095F84 @ case 3
	.4byte _08095F84 @ case 4
	.4byte _08095F9E @ case 5
	.4byte _08095F9E @ case 6
	.4byte _08095F9E @ case 7
	.4byte _08095F9E @ case 8
	.4byte _08095F9E @ case 9
	.4byte _08095F9E @ case 10
	.4byte _08095F9E @ case 11
	.4byte _08095F9E @ case 12
	.4byte _08095F9E @ case 13
	.4byte _08095F9E @ case 14
	.4byte _08095F9E @ case 15
	.4byte _08095F9E @ case 16
	.4byte _08095F9E @ case 17
	.4byte _08095F9E @ case 18
	.4byte _08095F9E @ case 19
	.4byte _08095F9E @ case 20
	.4byte _08095F9E @ case 21
	.4byte _08095F9E @ case 22
	.4byte _08095F9E @ case 23
	.4byte _08095F9E @ case 24
	.4byte _08095F9E @ case 25
	.4byte _08095F9E @ case 26
	.4byte _08095F9E @ case 27
	.4byte _08095F9E @ case 28
	.4byte _08095F9E @ case 29
	.4byte _08095F9E @ case 30
	.4byte _08095F9E @ case 31
	.4byte _08095F9E @ case 32
	.4byte _08095F9E @ case 33
	.4byte _08095F9E @ case 34
	.4byte _08095F9E @ case 35
	.4byte _08095F84 @ case 36
	.4byte _08095F9E @ case 37
	.4byte _08095F84 @ case 38
	.4byte _08095F9E @ case 39
	.4byte _08095F84 @ case 40
	.4byte _08095F9E @ case 41
	.4byte _08095F9E @ case 42
	.4byte _08095F9E @ case 43
	.4byte _08095F9E @ case 44
	.4byte _08095F9E @ case 45
	.4byte _08095F9E @ case 46
	.4byte _08095F9E @ case 47
	.4byte _08095F9E @ case 48
	.4byte _08095F9E @ case 49
	.4byte _08095F9E @ case 50
	.4byte _08095F84 @ case 51
_08095F84:
	ldr r0, _08095FA4 @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08095F96
	ldr r0, _08095FA8 @ =0x0000038A
	bl m4aSongNumStart
_08095F96:
	adds r0, r4, #0
	movs r1, #4
	bl Proc_Goto
_08095F9E:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08095FA4: .4byte gPlaySt
_08095FA8: .4byte 0x0000038A

	thumb_func_start PrepItemUse_ExecPromotionItem
PrepItemUse_ExecPromotionItem: @ 0x08095FAC
	push {r4, lr}
	adds r4, r0, #0
	bl EndMuralBackground_
	bl ResetText
	movs r0, #0
	bl InitBgs
	bl EndGreenText
	bl GetGameLock
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [r4, #0x40]
	bl InitFaces
	bl EndHelpPromptSprite
	ldr r3, _08096050 @ =gDispIo
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
	adds r2, r3, #0
	adds r2, #0x34
	movs r0, #0x20
	ldrb r1, [r2]
	orrs r1, r0
	strb r1, [r2]
	adds r1, r3, #0
	adds r1, #0x36
	ldrb r2, [r1]
	orrs r0, r2
	strb r0, [r1]
	adds r1, #6
	movs r0, #0x3f
	ldrb r2, [r1]
	ands r0, r2
	strb r0, [r1]
	adds r0, r3, #0
	adds r0, #0x44
	movs r1, #0
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r1, r3, #0
	adds r1, #0x46
	movs r0, #8
	strb r0, [r1]
	bl EndSysBrownBox
	bl EndAllParallelWorkers
	movs r0, #0
	bl EndFaceById
	movs r0, #0
	bl sub_80A998C
	ldr r0, [r4, #0x2c]
	ldr r1, [r4, #0x30]
	movs r2, #0
	bl sub_802D06C
	ldr r1, _08096054 @ =gBattleStats
	movs r0, #0x88
	lsls r0, r0, #1
	strh r0, [r1]
	bl BeginBattleAnimations
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08096050: .4byte gDispIo
_08096054: .4byte gBattleStats

	thumb_func_start PrepItemUse_WaitPromotionDone
PrepItemUse_WaitPromotionDone: @ 0x08096058
	push {r4, lr}
	adds r4, r0, #0
	bl GetGameLock
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r1, [r4, #0x40]
	cmp r1, r0
	bne _08096070
	adds r0, r4, #0
	bl Proc_Break
_08096070:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start PrepItemUse_PostPromotion
PrepItemUse_PostPromotion: @ 0x08096078
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x2c]
	bl GetUnitItemCount
	adds r1, r0, #0
	cmp r1, #0
	bne _08096092
	adds r0, r4, #0
	movs r1, #6
	bl Proc_Goto
	b _080960A2
_08096092:
	ldr r0, [r4, #0x30]
	cmp r0, r1
	blt _0809609C
	subs r0, #1
	str r0, [r4, #0x30]
_0809609C:
	adds r0, r4, #0
	bl Proc_Break
_080960A2:
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start PrepItemUse_ResetBgmAfterPromo
PrepItemUse_ResetBgmAfterPromo: @ 0x080960A8
	push {lr}
	sub sp, #4
	movs r2, #0x80
	lsls r2, r2, #1
	movs r0, #0
	str r0, [sp]
	movs r0, #0x49
	adds r1, r2, #0
	movs r3, #0x20
	bl CallSomeSoundMaybe
	add sp, #4
	pop {r0}
	bx r0

	thumb_func_start sub_80960C4
sub_80960C4: @ 0x080960C4
	push {lr}
	sub sp, #4
	movs r1, #0x80
	lsls r1, r1, #1
	movs r0, #0
	str r0, [sp]
	movs r2, #0
	movs r3, #0x10
	bl CallSomeSoundMaybe
	add sp, #4
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start StartPrepItemUseScreen
StartPrepItemUseScreen: @ 0x080960E0
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _080960F4 @ =ProcScr_PrepItemUseScreen
	bl Proc_StartBlocking
	str r4, [r0, #0x2c]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080960F4: .4byte ProcScr_PrepItemUseScreen

	thumb_func_start PrepItemUseBooster_OnDraw
PrepItemUseBooster_OnDraw: @ 0x080960F8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	adds r6, r0, #0
	adds r5, r1, #0
	adds r7, r2, #0
	adds r0, r3, #0
	bl DecodeMsg
	mov sb, r0
	ldr r0, [sp, #0x28]
	bl sub_8017808
	mov r8, r0
	mov r0, sb
	bl GetStringTextLen
	mov sl, r0
	mov r0, r8
	cmp r0, #0
	beq _08096144
	lsls r4, r7, #5
	adds r4, r4, r5
	lsls r4, r4, #1
	ldr r0, _080961B0 @ =gBg2Tm
	adds r4, r4, r0
	ldr r0, [sp, #0x28]
	bl sub_8017808
	adds r1, r0, #0
	movs r2, #0x80
	lsls r2, r2, #7
	adds r0, r4, #0
	bl PutIcon
_08096144:
	ldr r4, _080961B4 @ =0x02012A80
	adds r0, r4, #0
	bl ClearText
	lsls r0, r7, #5
	mov r1, r8
	cmp r1, #0
	beq _08096156
	adds r0, #2
_08096156:
	adds r0, r0, r5
	lsls r0, r0, #1
	ldr r1, _080961B0 @ =gBg2Tm
	adds r1, r0, r1
	movs r0, #0
	str r0, [sp]
	mov r0, sb
	str r0, [sp, #4]
	adds r0, r4, #0
	movs r2, #0
	movs r3, #0
	bl PutDrawText
	movs r0, #4
	bl EnableBgSync
	lsls r0, r5, #3
	subs r0, #4
	str r0, [r6, #0x40]
	lsls r0, r7, #3
	subs r0, #4
	str r0, [r6, #0x44]
	mov r0, sl
	cmp r0, #0
	bge _0809618A
	adds r0, #7
_0809618A:
	asrs r1, r0, #3
	adds r0, r1, #1
	str r0, [r6, #0x48]
	mov r0, r8
	cmp r0, #0
	beq _0809619A
	adds r0, r1, #3
	str r0, [r6, #0x48]
_0809619A:
	movs r0, #2
	str r0, [r6, #0x4c]
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080961B0: .4byte gBg2Tm
_080961B4: .4byte 0x02012A80

	thumb_func_start sub_80961B8
sub_80961B8: @ 0x080961B8
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r7, r0, #0
	ldr r4, [r7, #0x14]
	movs r0, #0xe0
	lsls r0, r0, #1
	movs r1, #3
	movs r2, #0
	adds r3, r7, #0
	bl sub_8074C70
	ldr r0, [r4, #0x2c]
	bl GetUnitCurrentHp
	adds r1, r7, #0
	adds r1, #0x30
	strb r0, [r1]
	ldr r0, [r4, #0x2c]
	bl GetUnitPower
	adds r1, r7, #0
	adds r1, #0x31
	strb r0, [r1]
	ldr r0, [r4, #0x2c]
	bl GetUnitSkill
	adds r1, r7, #0
	adds r1, #0x32
	strb r0, [r1]
	ldr r0, [r4, #0x2c]
	bl GetUnitSpeed
	adds r1, r7, #0
	adds r1, #0x33
	strb r0, [r1]
	ldr r0, [r4, #0x2c]
	bl GetUnitLuck
	adds r1, r7, #0
	adds r1, #0x34
	strb r0, [r1]
	ldr r0, [r4, #0x2c]
	bl GetUnitDefense
	adds r1, r7, #0
	adds r1, #0x35
	strb r0, [r1]
	ldr r0, [r4, #0x2c]
	bl GetUnitResistance
	adds r1, r7, #0
	adds r1, #0x36
	strb r0, [r1]
	ldr r1, [r4, #0x2c]
	ldr r2, [r1, #4]
	ldr r0, [r1]
	ldrb r2, [r2, #0x11]
	ldrb r0, [r0, #0x13]
	adds r0, r2, r0
	ldrb r1, [r1, #0x1a]
	adds r0, r1, r0
	adds r1, r7, #0
	adds r1, #0x37
	strb r0, [r1]
	ldr r0, [r4, #0x2c]
	ldr r1, [r4, #0x30]
	lsls r3, r1, #1
	adds r2, r0, #0
	adds r2, #0x1e
	adds r2, r2, r3
	ldrh r5, [r2]
	bl sub_802D1E8
	adds r6, r0, #0
	ldr r0, [r4, #0x2c]
	movs r1, #0
	bl sub_8095430
	ldr r0, [r4, #0x2c]
	bl sub_80955D0
	ldr r0, [r4, #0x2c]
	bl GetUnitCurrentHp
	adds r1, r7, #0
	adds r1, #0x38
	strb r0, [r1]
	ldr r0, [r4, #0x2c]
	bl GetUnitPower
	adds r1, r7, #0
	adds r1, #0x39
	strb r0, [r1]
	ldr r0, [r4, #0x2c]
	bl GetUnitSkill
	adds r1, r7, #0
	adds r1, #0x3a
	strb r0, [r1]
	ldr r0, [r4, #0x2c]
	bl GetUnitSpeed
	adds r1, r7, #0
	adds r1, #0x3b
	strb r0, [r1]
	ldr r0, [r4, #0x2c]
	bl GetUnitLuck
	adds r1, r7, #0
	adds r1, #0x3c
	strb r0, [r1]
	ldr r0, [r4, #0x2c]
	bl GetUnitDefense
	adds r1, r7, #0
	adds r1, #0x3d
	strb r0, [r1]
	ldr r0, [r4, #0x2c]
	bl GetUnitResistance
	adds r1, r7, #0
	adds r1, #0x3e
	strb r0, [r1]
	ldr r1, [r4, #0x2c]
	ldr r2, [r1, #4]
	ldr r0, [r1]
	ldrb r2, [r2, #0x11]
	ldrb r0, [r0, #0x13]
	adds r0, r2, r0
	ldrb r1, [r1, #0x1a]
	adds r0, r1, r0
	adds r1, r7, #0
	adds r1, #0x3f
	strb r0, [r1]
	str r5, [sp]
	adds r0, r7, #0
	movs r1, #0x11
	movs r2, #0xe
	adds r3, r6, #0
	bl PrepItemUseBooster_OnDraw
	movs r4, #0
_080962D4:
	adds r0, r7, #0
	adds r0, #0x30
	adds r3, r0, r4
	adds r0, #8
	adds r2, r0, r4
	ldrb r0, [r3]
	ldrb r1, [r2]
	cmp r0, r1
	beq _08096302
	asrs r1, r4, #2
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #4
	adds r0, #0xb8
	movs r1, #3
	ands r1, r4
	lsls r1, r1, #4
	adds r1, #0x32
	ldrb r2, [r2]
	ldrb r3, [r3]
	subs r2, r2, r3
	bl sub_8074F40
_08096302:
	adds r4, #1
	cmp r4, #7
	ble _080962D4
	movs r0, #0x78
	str r0, [r7, #0x2c]
	ldr r0, _08096328 @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0809631E
	ldr r0, _0809632C @ =0x0000037A
	bl m4aSongNumStart
_0809631E:
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08096328: .4byte gPlaySt
_0809632C: .4byte 0x0000037A

	thumb_func_start sub_8096330
sub_8096330: @ 0x08096330
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	ldr r0, [r5, #0x40]
	ldr r1, [r5, #0x44]
	ldr r2, [r5, #0x48]
	ldr r3, [r5, #0x4c]
	ldr r4, _0809636C @ =0x0000A580
	str r4, [sp]
	bl sub_80935C4
	ldr r0, [r5, #0x2c]
	subs r0, #1
	str r0, [r5, #0x2c]
	cmp r0, #0
	beq _0809635E
	ldr r0, _08096370 @ =gpKeySt
	ldr r1, [r0]
	movs r0, #3
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _08096364
_0809635E:
	adds r0, r5, #0
	bl Proc_Break
_08096364:
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0809636C: .4byte 0x0000A580
_08096370: .4byte gpKeySt

	thumb_func_start sub_8096374
sub_8096374: @ 0x08096374
	push {r4, r5, lr}
	ldr r4, [r0, #0x14]
	ldr r0, [r4, #0x2c]
	bl GetUnitItemCount
	adds r5, r0, #0
	ldr r0, _0809639C @ =gBg2Tm + 0x3a2
	movs r1, #0xc
	movs r2, #1
	movs r3, #0
	bl TmFillRect_thm
	cmp r5, #0
	bne _080963A0
	adds r0, r4, #0
	movs r1, #5
	bl Proc_Goto
	b _080963BC
	.align 2, 0
_0809639C: .4byte gBg2Tm + 0x3a2
_080963A0:
	ldr r0, [r4, #0x30]
	cmp r0, r5
	blt _080963AA
	subs r0, #1
	str r0, [r4, #0x30]
_080963AA:
	ldr r1, [r4, #0x30]
	lsls r1, r1, #4
	adds r1, #0x48
	movs r3, #0x80
	lsls r3, r3, #4
	movs r0, #0x10
	movs r2, #0xb
	bl ShowSysHandCursor
_080963BC:
	ldr r0, _080963F0 @ =gBg0Tm + 0x244
	ldr r1, _080963F4 @ =0x02012A20
	ldr r2, [r4, #0x2c]
	movs r3, #1
	bl sub_8094AC0
	ldr r0, [r4, #0x2c]
	ldr r1, [r4, #0x30]
	bl sub_8095750
	movs r0, #0
	bl sub_80A998C
	bl sub_8074D38
	movs r0, #5
	bl EnableBgSync
	ldr r0, _080963F8 @ =0x06014000
	movs r1, #1
	rsbs r1, r1, #0
	bl LoadHelpBoxGfx
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080963F0: .4byte gBg0Tm + 0x244
_080963F4: .4byte 0x02012A20
_080963F8: .4byte 0x06014000

	thumb_func_start sub_80963FC
sub_80963FC: @ 0x080963FC
	push {r4, r5, r6, lr}
	sub sp, #4
	ldr r6, _08096428 @ =0x0000DFC0
	movs r5, #0x30
	movs r4, #3
_08096406:
	str r6, [sp]
	movs r0, #4
	adds r1, r5, #0
	movs r2, #0x10
	ldr r3, _0809642C @ =Sprite_32x16
	bl PutSpriteExt
	adds r6, #4
	adds r5, #0x20
	subs r4, #1
	cmp r4, #0
	bge _08096406
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08096428: .4byte 0x0000DFC0
_0809642C: .4byte Sprite_32x16

	thumb_func_start sub_8096430
sub_8096430: @ 0x08096430
	push {r4, lr}
	sub sp, #4
	adds r4, r0, #0
	ldr r0, _0809645C @ =sub_80963FC
	bl StartParallelWorker
	movs r0, #0xf0
	lsls r0, r0, #7
	ldr r1, _08096460 @ =gUnk_08D8D10C
	lsls r4, r4, #2
	adds r4, r4, r1
	ldr r2, [r4]
	movs r1, #0
	str r1, [sp]
	movs r1, #0xd
	movs r3, #1
	bl NewSysboxText
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0809645C: .4byte sub_80963FC
_08096460: .4byte gUnk_08D8D10C

	thumb_func_start sub_8096464
sub_8096464: @ 0x08096464
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08096490 @ =gUnk_0841E7F4
	lsls r1, r1, #5
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r0, _08096494 @ =gUnk_0841E49C
	movs r2, #0xc0
	lsls r2, r2, #0x13
	adds r1, r4, r2
	bl Decompress
	ldr r0, _08096498 @ =gUnk_0841E634
	ldr r1, _0809649C @ =0x06000200
	adds r4, r4, r1
	adds r1, r4, #0
	bl Decompress
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08096490: .4byte gUnk_0841E7F4
_08096494: .4byte gUnk_0841E49C
_08096498: .4byte gUnk_0841E634
_0809649C: .4byte 0x06000200

	thumb_func_start sub_80964A0
sub_80964A0: @ 0x080964A0
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	str r0, [sp]
	mov sl, r1
	str r2, [sp, #4]
	str r3, [sp, #8]
	mov r0, sl
	movs r1, #0xc
	movs r2, #0x1f
	movs r3, #0
	bl TmFillRect_thm
	ldr r1, _080964E8 @ =0x02012466
	ldrh r0, [r1]
	cmp r0, #0
	bne _080964F0
	ldr r0, [sp]
	bl ClearText
	ldr r3, _080964EC @ =gUnk_0842D0C4
	ldr r0, [sp]
	movs r1, #0
	movs r2, #1
	bl Text_InsertDrawString
	mov r1, sl
	adds r1, #6
	ldr r0, [sp]
	bl PutText
	b _0809659A
	.align 2, 0
_080964E8: .4byte 0x02012466
_080964EC: .4byte gUnk_0842D0C4
_080964F0:
	ldr r6, [sp, #4]
	adds r0, r6, #7
	cmp r6, r0
	bge _0809659A
	ldrh r1, [r1]
	cmp r6, r1
	bge _0809659A
_080964FE:
	movs r0, #7
	ands r0, r6
	lsls r0, r0, #3
	ldr r1, [sp]
	adds r1, r1, r0
	mov r8, r1
	ldr r1, _080965AC @ =0x020117E4
	lsls r0, r6, #2
	adds r0, r0, r1
	ldrh r7, [r0, #2]
	ldr r0, [sp, #8]
	adds r1, r7, #0
	bl IsItemDisplayUsable
	movs r1, #0
	mov sb, r1
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08096528
	movs r0, #1
	mov sb, r0
_08096528:
	mov r0, r8
	bl ClearText
	adds r0, r7, #0
	bl GetItemName
	adds r3, r0, #0
	mov r0, r8
	movs r1, #0
	mov r2, sb
	bl Text_InsertDrawString
	lsls r5, r6, #1
	movs r0, #0x1f
	ands r5, r0
	lsls r5, r5, #6
	adds r4, r5, #2
	add r4, sl
	adds r0, r7, #0
	bl sub_8017808
	adds r1, r0, #0
	adds r0, r4, #0
	movs r2, #0x80
	lsls r2, r2, #7
	bl PutIcon
	adds r1, r5, #6
	add r1, sl
	mov r0, r8
	bl PutText
	adds r5, #0x18
	mov r1, sl
	adds r4, r1, r5
	movs r5, #1
	mov r0, sb
	cmp r0, #0
	bne _08096578
	movs r5, #2
_08096578:
	adds r0, r7, #0
	bl GetItemUses
	adds r2, r0, #0
	adds r0, r4, #0
	adds r1, r5, #0
	bl PutNumberOrBlank
	adds r6, #1
	ldr r0, [sp, #4]
	adds r0, #7
	cmp r6, r0
	bge _0809659A
	ldr r0, _080965B0 @ =0x02012466
	ldrh r0, [r0]
	cmp r6, r0
	blt _080964FE
_0809659A:
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080965AC: .4byte 0x020117E4
_080965B0: .4byte 0x02012466

	thumb_func_start sub_80965B4
sub_80965B4: @ 0x080965B4
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	mov r8, r0
	adds r5, r1, #0
	adds r7, r5, #0
	adds r0, r5, #7
	cmp r5, r0
	bge _08096604
	ldr r0, _08096610 @ =0x02012466
	ldrh r0, [r0]
	cmp r5, r0
	bge _08096604
	ldr r1, _08096614 @ =0x020117E4
	lsls r0, r5, #2
	adds r6, r0, r1
_080965D4:
	ldrh r0, [r6, #2]
	lsls r4, r5, #1
	movs r1, #0x1f
	ands r4, r1
	lsls r4, r4, #6
	adds r4, #2
	add r4, r8
	bl sub_8017808
	adds r1, r0, #0
	adds r0, r4, #0
	movs r2, #0x80
	lsls r2, r2, #7
	bl PutIcon
	adds r6, #4
	adds r5, #1
	adds r0, r7, #7
	cmp r5, r0
	bge _08096604
	ldr r0, _08096610 @ =0x02012466
	ldrh r0, [r0]
	cmp r5, r0
	blt _080965D4
_08096604:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08096610: .4byte 0x02012466
_08096614: .4byte 0x020117E4

	thumb_func_start sub_8096618
sub_8096618: @ 0x08096618
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	adds r5, r0, #0
	mov sb, r1
	ldr r0, _080966C4 @ =0x02012466
	ldrh r0, [r0]
	cmp r0, r2
	ble _080966B8
	lsls r4, r2, #1
	movs r0, #0x1f
	ands r4, r0
	movs r0, #7
	ands r0, r2
	lsls r0, r0, #3
	adds r7, r5, r0
	ldr r1, _080966C8 @ =0x020117E4
	lsls r0, r2, #2
	adds r0, r0, r1
	ldrh r6, [r0, #2]
	adds r0, r3, #0
	adds r1, r6, #0
	bl IsItemDisplayUsable
	movs r1, #0
	mov r8, r1
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08096658
	movs r0, #1
	mov r8, r0
_08096658:
	lsls r4, r4, #6
	add r4, sb
	adds r0, r4, #0
	movs r1, #0xc
	movs r2, #1
	movs r3, #0
	bl TmFillRect_thm
	adds r0, r7, #0
	bl ClearText
	adds r0, r6, #0
	bl GetItemName
	adds r3, r0, #0
	adds r0, r7, #0
	movs r1, #0
	mov r2, r8
	bl Text_InsertDrawString
	adds r5, r4, #2
	adds r0, r6, #0
	bl sub_8017808
	adds r1, r0, #0
	movs r2, #0x80
	lsls r2, r2, #7
	adds r0, r5, #0
	bl PutIcon
	adds r1, r4, #6
	adds r0, r7, #0
	bl PutText
	adds r4, #0x18
	movs r5, #1
	mov r1, r8
	cmp r1, #0
	bne _080966A8
	movs r5, #2
_080966A8:
	adds r0, r6, #0
	bl GetItemUses
	adds r2, r0, #0
	adds r0, r4, #0
	adds r1, r5, #0
	bl PutNumberOrBlank
_080966B8:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080966C4: .4byte 0x02012466
_080966C8: .4byte 0x020117E4

	thumb_func_start sub_80966CC
sub_80966CC: @ 0x080966CC
	ldr r0, _08096700 @ =0x04000006
	ldrh r0, [r0]
	adds r0, #1
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	cmp r2, #0xa0
	bls _080966DC
	movs r2, #0
_080966DC:
	cmp r2, #0xc
	bne _080966EC
	ldr r1, _08096704 @ =0x04000050
	movs r0, #0xc8
	strh r0, [r1]
	adds r1, #4
	movs r0, #8
	strh r0, [r1]
_080966EC:
	cmp r2, #0x34
	beq _080966F4
	cmp r2, #0
	bne _080966FE
_080966F4:
	ldr r0, _08096704 @ =0x04000050
	movs r1, #0
	strh r1, [r0]
	adds r0, #4
	strh r1, [r0]
_080966FE:
	bx lr
	.align 2, 0
_08096700: .4byte 0x04000006
_08096704: .4byte 0x04000050

	thumb_func_start sub_8096708
sub_8096708: @ 0x08096708
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0
	strh r0, [r4, #0x38]
	movs r0, #0xff
	strh r0, [r4, #0x36]
	ldr r0, [r4, #0x2c]
	bl GetUnitItemCount
	cmp r0, #0
	bne _08096726
	adds r1, r4, #0
	adds r1, #0x33
	movs r0, #1
	b _0809672C
_08096726:
	adds r1, r4, #0
	adds r1, #0x33
	movs r0, #0
_0809672C:
	strb r0, [r1]
	adds r0, r4, #0
	adds r0, #0x30
	ldrb r0, [r0]
	cmp r0, #0
	bne _0809674C
	ldr r0, _08096748 @ =ProcScr_AtMenu
	bl Proc_Find
	adds r0, #0x32
	ldrb r0, [r0]
	adds r1, r4, #0
	adds r1, #0x35
	b _08096752
	.align 2, 0
_08096748: .4byte ProcScr_AtMenu
_0809674C:
	adds r1, r4, #0
	adds r1, #0x35
	movs r0, #0
_08096752:
	strb r0, [r1]
	adds r2, r4, #0
	adds r2, #0x32
	movs r1, #0
	movs r0, #4
	strb r0, [r2]
	adds r0, r4, #0
	adds r0, #0x31
	strb r1, [r0]
	movs r3, #0
	adds r1, r4, #0
	adds r1, #0x4c
	adds r0, #9
	movs r2, #8
_0809676E:
	strh r3, [r0]
	strh r3, [r1]
	adds r1, #2
	adds r0, #2
	subs r2, #1
	cmp r2, #0
	bge _0809676E
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_8096784
sub_8096784: @ 0x08096784
	push {r4, lr}
	ldr r4, _080967B4 @ =0x02012B50
	ldr r1, _080967B8 @ =0x06011000
	adds r0, r4, #0
	movs r2, #0xb
	bl InitSpriteTextFont
	ldr r0, _080967BC @ =Pal_Text
	movs r1, #0xd8
	lsls r1, r1, #2
	movs r2, #0x20
	bl ApplyPaletteExt
	adds r4, #0x90
	adds r0, r4, #0
	bl InitSpriteText
	movs r0, #0
	bl SetTextFont
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080967B4: .4byte 0x02012B50
_080967B8: .4byte 0x06011000
_080967BC: .4byte Pal_Text

	thumb_func_start sub_80967C0
sub_80967C0: @ 0x080967C0
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	bl sub_809158C
	adds r5, r0, #0
	lsls r5, r5, #0x18
	lsrs r5, r5, #0x18
	ldr r0, [r4, #0x2c]
	bl GetUnitItemCount
	adds r6, r0, #0
	ldr r4, _08096824 @ =0x02012B50
	adds r0, r4, #0
	bl SetTextFont
	movs r0, #0
	bl SetTextFontGlyphs
	adds r4, #0x90
	adds r0, r4, #0
	movs r1, #0
	bl SpriteText_DrawBackgroundExt
	adds r0, r4, #0
	movs r2, #0
	cmp r5, #0x64
	beq _080967FA
	cmp r6, #0
	bne _080967FC
_080967FA:
	movs r2, #1
_080967FC:
	ldr r3, _08096828 @ =gUnk_0842D0D4
	movs r1, #0
	bl Text_InsertDrawString
	ldr r0, _0809682C @ =0x02012BE0
	movs r2, #0
	cmp r6, #5
	bne _0809680E
	movs r2, #1
_0809680E:
	ldr r3, _08096830 @ =gUnk_0842D0E0
	movs r1, #0x40
	bl Text_InsertDrawString
	movs r0, #0
	bl SetTextFont
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08096824: .4byte 0x02012B50
_08096828: .4byte gUnk_0842D0D4
_0809682C: .4byte 0x02012BE0
_08096830: .4byte gUnk_0842D0E0

	thumb_func_start sub_8096834
sub_8096834: @ 0x08096834
	push {r4, r5, r6, lr}
	sub sp, #8
	movs r0, #0
	bl SetTextFont
	ldr r6, _080968D8 @ =gBg0Tm + 0x68
	adds r0, r6, #0
	movs r1, #0xc
	movs r2, #1
	movs r3, #0
	bl TmFillRect_thm
	ldr r4, _080968DC @ =0x02012B68
	adds r1, r6, #0
	adds r1, #0xda
	movs r5, #0
	str r5, [sp]
	ldr r0, _080968E0 @ =gUnk_0842D0EC
	str r0, [sp, #4]
	adds r0, r4, #0
	movs r2, #0
	movs r3, #2
	bl PutDrawText
	adds r1, r6, #0
	subs r1, #0x26
	movs r2, #0x9c
	lsls r2, r2, #2
	movs r0, #1
	str r0, [sp]
	movs r0, #0x4a
	movs r3, #2
	bl PutFaceChibi
	adds r4, #8
	str r5, [sp]
	ldr r0, _080968E4 @ =gUnk_0842D0F4
	str r0, [sp, #4]
	adds r0, r4, #0
	adds r1, r6, #0
	movs r2, #0
	movs r3, #0
	bl PutDrawText
	adds r5, r6, #0
	adds r5, #0xa
	bl sub_809158C
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r4, #2
	cmp r0, #0x64
	bne _080968A0
	movs r4, #4
_080968A0:
	bl sub_809158C
	adds r2, r0, #0
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	adds r0, r5, #0
	adds r1, r4, #0
	bl PutNumber
	adds r0, r6, #0
	adds r0, #0xc
	movs r1, #0
	movs r2, #0x16
	bl PutSpecialChar
	adds r0, r6, #0
	adds r0, #0x12
	movs r1, #2
	movs r2, #0x64
	bl PutNumber
	movs r0, #1
	bl EnableBgSync
	add sp, #8
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080968D8: .4byte gBg0Tm + 0x68
_080968DC: .4byte 0x02012B68
_080968E0: .4byte gUnk_0842D0EC
_080968E4: .4byte gUnk_0842D0F4

	thumb_func_start sub_80968E8
sub_80968E8: @ 0x080968E8
	push {r4, lr}
	sub sp, #4
	ldr r0, _08096928 @ =0x0000A980
	str r0, [sp]
	movs r0, #0x40
	movs r1, #0x22
	movs r2, #5
	movs r3, #4
	bl sub_80935C4
	ldr r4, _0809692C @ =Sprite_32x16
	ldr r0, _08096930 @ =0x0000B080
	str r0, [sp]
	movs r0, #4
	movs r1, #0x48
	movs r2, #0x26
	adds r3, r4, #0
	bl PutSpriteExt
	ldr r0, _08096934 @ =0x0000B088
	str r0, [sp]
	movs r0, #4
	movs r1, #0x48
	movs r2, #0x36
	adds r3, r4, #0
	bl PutSpriteExt
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08096928: .4byte 0x0000A980
_0809692C: .4byte Sprite_32x16
_08096930: .4byte 0x0000B080
_08096934: .4byte 0x0000B088

	thumb_func_start sub_8096938
sub_8096938: @ 0x08096938
	push {lr}
	sub sp, #4
	ldr r0, _08096964 @ =0x0000A980
	str r0, [sp]
	movs r0, #0x40
	movs r1, #0x22
	movs r2, #5
	movs r3, #2
	bl sub_80935C4
	ldr r3, _08096968 @ =Sprite_32x16
	ldr r0, _0809696C @ =0x0000B080
	str r0, [sp]
	movs r0, #4
	movs r1, #0x48
	movs r2, #0x26
	bl PutSpriteExt
	add sp, #4
	pop {r0}
	bx r0
	.align 2, 0
_08096964: .4byte 0x0000A980
_08096968: .4byte Sprite_32x16
_0809696C: .4byte 0x0000B080

	thumb_func_start sub_8096970
sub_8096970: @ 0x08096970
	push {lr}
	sub sp, #4
	ldr r0, _0809699C @ =0x0000A980
	str r0, [sp]
	movs r0, #0x40
	movs r1, #0x32
	movs r2, #5
	movs r3, #2
	bl sub_80935C4
	ldr r3, _080969A0 @ =Sprite_32x16
	ldr r0, _080969A4 @ =0x0000B088
	str r0, [sp]
	movs r0, #4
	movs r1, #0x48
	movs r2, #0x36
	bl PutSpriteExt
	add sp, #4
	pop {r0}
	bx r0
	.align 2, 0
_0809699C: .4byte 0x0000A980
_080969A0: .4byte Sprite_32x16
_080969A4: .4byte 0x0000B088

	thumb_func_start sub_80969A8
sub_80969A8: @ 0x080969A8
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r6, r0, #0
	adds r7, r6, #0
	adds r7, #0x35
	ldrb r0, [r7]
	lsls r4, r0, #1
	adds r4, r4, r0
	lsls r4, r4, #2
	adds r4, #0x7c
	bl GetGameTime
	ldr r2, _08096A20 @ =gPal
	lsrs r0, r0, #2
	movs r1, #0xf
	ands r0, r1
	lsls r0, r0, #1
	ldr r1, _08096A24 @ =gUnk_08421C24
	adds r0, r0, r1
	ldrh r0, [r0]
	ldr r1, _08096A28 @ =0x000002DA
	adds r2, r2, r1
	strh r0, [r2]
	bl EnablePalSync
	ldr r1, _08096A2C @ =gUnk_08D8D4F8
	ldrb r2, [r7]
	lsls r0, r2, #2
	adds r0, r0, r1
	ldr r3, [r0]
	movs r5, #0xc5
	lsls r5, r5, #7
	str r5, [sp]
	movs r0, #4
	adds r1, r4, #0
	movs r2, #0x18
	bl PutSprite
	ldr r3, _08096A30 @ =gUnk_08D8D4E8
	str r5, [sp]
	movs r0, #4
	adds r1, r4, #0
	movs r2, #0x18
	bl PutSprite
	ldrb r7, [r7]
	lsls r0, r7, #1
	adds r6, #0x4c
	adds r6, r6, r0
	ldrh r1, [r6]
	ldr r0, _08096A34 @ =0x02012466
	ldrh r2, [r0]
	movs r0, #0xb
	movs r3, #7
	bl sub_8090E04
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08096A20: .4byte gPal
_08096A24: .4byte gUnk_08421C24
_08096A28: .4byte 0x000002DA
_08096A2C: .4byte gUnk_08D8D4F8
_08096A30: .4byte gUnk_08D8D4E8
_08096A34: .4byte 0x02012466

	thumb_func_start sub_8096A38
sub_8096A38: @ 0x08096A38
	push {r4, r5, r6, lr}
	movs r5, #0
	lsls r2, r2, #0xc
	ldr r4, _08096A74 @ =0x0001FFFF
	adds r3, r1, #0
	ands r3, r4
	lsrs r3, r3, #5
	adds r6, r2, r3
	movs r3, #0x80
	lsls r3, r3, #2
	adds r1, r1, r3
	ands r1, r4
	lsrs r1, r1, #5
	adds r2, r2, r1
	adds r3, r0, #0
	adds r3, #0x40
	adds r1, r0, #0
_08096A5A:
	adds r0, r6, r5
	strh r0, [r1]
	adds r0, r2, r5
	strh r0, [r3]
	adds r3, #2
	adds r1, #2
	adds r5, #1
	cmp r5, #0xe
	ble _08096A5A
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08096A74: .4byte 0x0001FFFF

	thumb_func_start sub_8096A78
sub_8096A78: @ 0x08096A78
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	mov sl, r0
	ldr r7, _08096D54 @ =gDispIo
	movs r0, #8
	rsbs r0, r0, #0
	ldrb r1, [r7]
	ands r0, r1
	strb r0, [r7]
	movs r0, #0
	bl InitBgs
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
	movs r1, #4
	rsbs r1, r1, #0
	adds r0, r1, #0
	ldrb r2, [r7, #0xc]
	ands r0, r2
	movs r4, #1
	orrs r0, r4
	strb r0, [r7, #0xc]
	adds r0, r1, #0
	ldrb r6, [r7, #0x10]
	ands r0, r6
	movs r2, #2
	mov sb, r2
	mov r6, sb
	orrs r0, r6
	strb r0, [r7, #0x10]
	ldrb r0, [r7, #0x14]
	ands r1, r0
	strb r1, [r7, #0x14]
	movs r0, #3
	ldrb r1, [r7, #0x18]
	orrs r0, r1
	strb r0, [r7, #0x18]
	bl InitFaces
	bl ResetText
	bl InitIcons
	bl UnpackUiWindowFrameGraphics
	bl ApplySystemObjectsGraphics
	movs r0, #0
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	movs r0, #1
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	mov r0, sl
	adds r0, #0x35
	ldrb r0, [r0]
	lsls r1, r0, #1
	mov r0, sl
	adds r0, #0x4c
	adds r0, r0, r1
	ldrh r2, [r0]
	subs r2, #0x28
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	movs r0, #2
	movs r1, #0
	bl SetBgOffset
	ldr r0, _08096D58 @ =0x06016000
	movs r1, #1
	rsbs r1, r1, #0
	bl LoadHelpBoxGfx
	movs r0, #4
	bl ApplyIconPalettes
	bl PrepRestartMuralBackground
	movs r0, #0xa0
	lsls r0, r0, #7
	movs r1, #5
	bl sub_809228C
	movs r0, #0xc0
	lsls r0, r0, #6
	movs r1, #0xa
	bl sub_80922DC
	ldr r0, _08096D5C @ =gBg1Tm
	ldr r1, _08096D60 @ =gUnk_0842A0A4
	movs r2, #0xa5
	lsls r2, r2, #7
	bl TmApplyTsa_thm
	movs r0, #7
	bl EnableBgSync
	movs r1, #0xe0
	lsls r1, r1, #4
	movs r3, #0xc0
	lsls r3, r3, #4
	movs r2, #0
	mov r8, r2
	str r2, [sp]
	mov r6, sl
	str r6, [sp, #4]
	movs r0, #0xd
	movs r2, #0xf
	bl StartSysBrownBox
	movs r0, #0
	movs r1, #0x98
	movs r2, #6
	movs r3, #2
	bl EnableSysBrownBox
	ldr r0, [r6, #0x2c]
	ldr r0, [r0]
	ldrh r0, [r0]
	bl DecodeMsg
	mov r0, sl
	bl sub_80A98C8
	mov r0, sl
	bl ResetSysHandCursor
	movs r0, #0xc0
	lsls r0, r0, #3
	movs r1, #1
	bl DisplaySysHandCursorTextShadow
	movs r5, #0x20
	ldrb r0, [r7, #1]
	orrs r0, r5
	movs r1, #0x41
	rsbs r1, r1, #0
	ands r0, r1
	movs r1, #0x7f
	ands r0, r1
	strb r0, [r7, #1]
	adds r1, r7, #0
	adds r1, #0x2d
	movs r0, #0x80
	strb r0, [r1]
	adds r1, #4
	movs r0, #0x28
	strb r0, [r1]
	subs r1, #5
	movs r0, #0xe0
	strb r0, [r1]
	adds r1, #4
	movs r0, #0x98
	strb r0, [r1]
	ldr r1, _08096D64 @ =0x030027C4
	ldrb r0, [r1]
	orrs r0, r4
	mov r2, sb
	orrs r0, r2
	movs r1, #4
	orrs r0, r1
	movs r3, #8
	orrs r0, r3
	movs r2, #0x10
	orrs r0, r2
	movs r6, #0x36
	adds r6, r6, r7
	mov ip, r6
	ldrb r1, [r6]
	orrs r4, r1
	mov r6, sb
	orrs r4, r6
	movs r1, #5
	rsbs r1, r1, #0
	ands r4, r1
	orrs r4, r3
	orrs r4, r2
	orrs r0, r5
	ldr r1, _08096D64 @ =0x030027C4
	strb r0, [r1]
	orrs r4, r5
	mov r2, ip
	strb r4, [r2]
	adds r1, r7, #0
	adds r1, #0x3c
	movs r0, #0x3f
	ldrb r6, [r1]
	ands r0, r6
	strb r0, [r1]
	adds r0, r7, #0
	adds r0, #0x44
	mov r1, r8
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r1, r7, #0
	adds r1, #0x46
	movs r0, #8
	strb r0, [r1]
	mov r0, sl
	bl StartGreenText
	movs r0, #0xc8
	movs r1, #0x90
	mov r2, sl
	bl StartHelpPromptSprite
	ldr r4, _08096D68 @ =0x02012B68
	adds r0, r4, #0
	movs r1, #4
	bl InitText
	adds r0, r4, #0
	adds r0, #8
	movs r1, #3
	bl InitText
	bl sub_8096784
	adds r4, #0x10
	movs r5, #4
_08096C62:
	adds r0, r4, #0
	movs r1, #7
	bl InitText
	adds r4, #8
	subs r5, #1
	cmp r5, #0
	bge _08096C62
	mov r6, sl
	adds r6, #0x35
	mov r7, sl
	adds r7, #0x4c
	ldr r4, _08096D6C @ =0x02012BA0
	movs r5, #7
_08096C7E:
	adds r0, r4, #0
	movs r1, #7
	bl sub_800536C
	adds r4, #8
	subs r5, #1
	cmp r5, #0
	bge _08096C7E
	movs r0, #0
	bl SetOnHBlankA
	ldr r0, _08096D70 @ =sub_80966CC
	bl SetOnHBlankA
	movs r4, #0x80
	lsls r4, r4, #7
	adds r0, r4, #0
	movs r1, #6
	bl sub_8096464
	ldr r5, _08096D74 @ =gBg0Tm + 0xde
	adds r0, r5, #0
	adds r1, r4, #0
	movs r2, #6
	bl sub_8096A38
	ldr r0, _08096D78 @ =gUnk_0841E0A4
	ldr r1, _08096D7C @ =0x06015000
	bl Decompress
	mov r0, sl
	bl sub_8090DD0
	movs r0, #0xb0
	lsls r0, r0, #7
	movs r1, #6
	bl sub_8090E38
	movs r0, #0xe2
	movs r1, #0x30
	bl sub_8090DE4
	bl sub_8090DA0
	mov r2, sl
	ldr r0, [r2, #0x2c]
	ldrb r1, [r6]
	movs r2, #1
	bl sub_8091A74
	ldr r4, _08096D6C @ =0x02012BA0
	ldr r1, _08096D80 @ =gBg2Tm + 0x1e
	ldrb r6, [r6]
	lsls r0, r6, #1
	adds r0, r7, r0
	ldrh r0, [r0]
	lsrs r2, r0, #4
	mov r6, sl
	ldr r3, [r6, #0x2c]
	adds r0, r4, #0
	bl sub_80964A0
	movs r0, #4
	bl EnableBgSync
	movs r0, #0xb3
	lsls r0, r0, #1
	adds r5, r5, r0
	subs r4, #0x28
	ldr r2, [r6, #0x2c]
	adds r0, r5, #0
	adds r1, r4, #0
	movs r3, #0
	bl sub_8094AC0
	bl sub_8096834
	mov r0, sl
	bl StartUiSpinningArrows
	movs r1, #0xa0
	lsls r1, r1, #2
	movs r0, #0
	movs r2, #2
	bl LoadUiSpinningArrowGfx
	movs r0, #0x78
	movs r1, #0x18
	movs r2, #0xea
	movs r3, #0x18
	bl SetUiSpinningArrowPositions
	movs r0, #3
	bl SetUiSpinningArrowConfig
	ldr r0, _08096D84 @ =sub_80969A8
	mov r1, sl
	bl StartParallelWorker
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08096D54: .4byte gDispIo
_08096D58: .4byte 0x06016000
_08096D5C: .4byte gBg1Tm
_08096D60: .4byte gUnk_0842A0A4
_08096D64: .4byte 0x030027C4
_08096D68: .4byte 0x02012B68
_08096D6C: .4byte 0x02012BA0
_08096D70: .4byte sub_80966CC
_08096D74: .4byte gBg0Tm + 0xde
_08096D78: .4byte gUnk_0841E0A4
_08096D7C: .4byte 0x06015000
_08096D80: .4byte gBg2Tm + 0x1e
_08096D84: .4byte sub_80969A8

	thumb_func_start sub_8096D88
sub_8096D88: @ 0x08096D88
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0
	adds r1, r4, #0
	bl sub_8096430
	movs r0, #0
	bl sub_80A998C
	adds r0, r4, #0
	bl sub_80967C0
	adds r0, r4, #0
	adds r0, #0x33
	ldrb r0, [r0]
	lsls r1, r0, #4
	adds r1, #0x24
	movs r3, #0x80
	lsls r3, r3, #3
	movs r0, #0x44
	movs r2, #4
	bl ShowSysHandCursor
	ldr r0, _08096DE0 @ =sub_8096938
	bl GetParallelWorker
	bl Proc_End
	ldr r0, _08096DE4 @ =sub_8096970
	bl GetParallelWorker
	bl Proc_End
	ldr r0, _08096DE8 @ =sub_80968E8
	adds r1, r4, #0
	bl StartParallelWorker
	movs r0, #7
	bl EnableBgSync
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08096DE0: .4byte sub_8096938
_08096DE4: .4byte sub_8096970
_08096DE8: .4byte sub_80968E8

	thumb_func_start sub_8096DEC
sub_8096DEC: @ 0x08096DEC
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	adds r4, r5, #0
	adds r4, #0x33
	ldrb r6, [r4]
	ldrh r0, [r5, #0x38]
	cmp r0, #0
	beq _08096DFE
	b _08096F58
_08096DFE:
	ldr r1, _08096E1C @ =gpKeySt
	ldr r0, [r1]
	ldrh r3, [r0, #8]
	movs r7, #1
	adds r0, r7, #0
	ands r0, r3
	adds r2, r1, #0
	cmp r0, #0
	bne _08096E12
	b _08096F08
_08096E12:
	cmp r6, #0
	beq _08096E20
	cmp r6, #1
	beq _08096E8C
	b _0809700C
	.align 2, 0
_08096E1C: .4byte gpKeySt
_08096E20:
	bl sub_809158C
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x63
	bhi _08096EEC
	ldr r0, [r5, #0x2c]
	bl GetUnitItemCount
	cmp r0, #0
	ble _08096EEC
	ldrb r4, [r4]
	lsls r2, r4, #4
	adds r2, #0x24
	movs r0, #0
	movs r1, #0x44
	movs r3, #2
	bl sub_80A98DC
	ldr r0, _08096E7C @ =sub_80968E8
	bl GetParallelWorker
	bl Proc_End
	ldr r0, _08096E80 @ =sub_8096938
	adds r1, r5, #0
	bl StartParallelWorker
	movs r0, #1
	adds r1, r5, #0
	bl sub_8096430
	ldr r0, _08096E84 @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08096E72
	ldr r0, _08096E88 @ =0x0000038A
	bl m4aSongNumStart
_08096E72:
	adds r0, r5, #0
	movs r1, #3
	bl Proc_Goto
	b _0809700C
	.align 2, 0
_08096E7C: .4byte sub_80968E8
_08096E80: .4byte sub_8096938
_08096E84: .4byte gPlaySt
_08096E88: .4byte 0x0000038A
_08096E8C:
	ldr r0, [r5, #0x2c]
	bl GetUnitItemCount
	cmp r0, #4
	bgt _08096EEC
	ldrb r4, [r4]
	lsls r2, r4, #4
	adds r2, #0x24
	movs r0, #0
	movs r1, #0x44
	movs r3, #2
	bl sub_80A98DC
	ldr r0, _08096EDC @ =sub_80968E8
	bl GetParallelWorker
	bl Proc_End
	ldr r0, _08096EE0 @ =sub_8096970
	adds r1, r5, #0
	bl StartParallelWorker
	movs r0, #2
	adds r1, r5, #0
	bl sub_8096430
	ldr r0, _08096EE4 @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08096ED2
	ldr r0, _08096EE8 @ =0x0000038A
	bl m4aSongNumStart
_08096ED2:
	adds r0, r5, #0
	movs r1, #4
	bl Proc_Goto
	b _0809700C
	.align 2, 0
_08096EDC: .4byte sub_80968E8
_08096EE0: .4byte sub_8096970
_08096EE4: .4byte gPlaySt
_08096EE8: .4byte 0x0000038A
_08096EEC:
	ldr r0, _08096F04 @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	bge _08096EFA
	b _0809700C
_08096EFA:
	movs r0, #0xe3
	lsls r0, r0, #2
	bl m4aSongNumStart
	b _0809700C
	.align 2, 0
_08096F04: .4byte gPlaySt
_08096F08:
	movs r0, #2
	ands r0, r3
	cmp r0, #0
	beq _08096F34
	adds r0, r5, #0
	movs r1, #8
	bl Proc_Goto
	ldr r0, _08096F2C @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0809700C
	ldr r0, _08096F30 @ =0x0000038B
	bl m4aSongNumStart
	b _0809700C
	.align 2, 0
_08096F2C: .4byte gPlaySt
_08096F30: .4byte 0x0000038B
_08096F34:
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r3
	cmp r0, #0
	beq _08096F78
	lsls r1, r6, #4
	adds r1, #0x24
	ldr r2, _08096F54 @ =gUnk_08D8D118
	lsls r0, r6, #2
	adds r0, r0, r2
	ldr r2, [r0]
	movs r0, #0x44
	bl StartHelpBox
	strh r7, [r5, #0x38]
	b _0809700C
	.align 2, 0
_08096F54: .4byte gUnk_08D8D118
_08096F58:
	ldr r2, _08096F74 @ =gpKeySt
	ldr r1, [r2]
	movs r0, #0x81
	lsls r0, r0, #1
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _08096F78
	bl CloseHelpBox
	movs r0, #0
	strh r0, [r5, #0x38]
	b _0809700C
	.align 2, 0
_08096F74: .4byte gpKeySt
_08096F78:
	ldr r3, [r2]
	movs r1, #0x40
	adds r0, r1, #0
	ldrh r4, [r3, #6]
	ands r0, r4
	adds r4, r5, #0
	adds r4, #0x33
	cmp r0, #0
	beq _08096FA2
	ldrb r0, [r4]
	cmp r0, #0
	beq _08096F94
	subs r0, #1
	b _08096FA0
_08096F94:
	adds r0, r1, #0
	ldrh r3, [r3, #8]
	ands r0, r3
	cmp r0, #0
	beq _08096FA2
	movs r0, #1
_08096FA0:
	strb r0, [r4]
_08096FA2:
	ldr r1, [r2]
	movs r2, #0x80
	adds r0, r2, #0
	ldrh r3, [r1, #6]
	ands r0, r3
	cmp r0, #0
	beq _08096FC8
	ldrb r0, [r4]
	cmp r0, #0
	bne _08096FBA
	adds r0, #1
	b _08096FC6
_08096FBA:
	adds r0, r2, #0
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _08096FC8
	movs r0, #0
_08096FC6:
	strb r0, [r4]
_08096FC8:
	ldrb r0, [r4]
	cmp r6, r0
	beq _0809700C
	ldr r0, _08097014 @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08096FE0
	ldr r0, _08097018 @ =0x00000386
	bl m4aSongNumStart
_08096FE0:
	ldrb r3, [r4]
	lsls r1, r3, #4
	adds r1, #0x24
	movs r3, #0x80
	lsls r3, r3, #3
	movs r0, #0x44
	movs r2, #4
	bl ShowSysHandCursor
	ldrh r0, [r5, #0x38]
	cmp r0, #0
	beq _0809700C
	ldrb r0, [r4]
	lsls r1, r0, #4
	adds r1, #0x24
	ldr r2, _0809701C @ =gUnk_08D8D118
	lsls r0, r0, #2
	adds r0, r0, r2
	ldr r2, [r0]
	movs r0, #0x44
	bl StartHelpBox
_0809700C:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08097014: .4byte gPlaySt
_08097018: .4byte 0x00000386
_0809701C: .4byte gUnk_08D8D118

	thumb_func_start sub_8097020
sub_8097020: @ 0x08097020
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	bl InitIcons
	ldr r0, [r4, #0x2c]
	adds r5, r4, #0
	adds r5, #0x35
	ldrb r1, [r5]
	movs r2, #1
	bl sub_8091A74
	ldr r0, _080970B0 @ =0x02012BA0
	ldr r1, _080970B4 @ =gBg2Tm + 0x1e
	ldrb r3, [r5]
	lsls r2, r3, #1
	adds r6, r4, #0
	adds r6, #0x4c
	adds r2, r6, r2
	ldrh r2, [r2]
	lsrs r2, r2, #4
	ldr r3, [r4, #0x2c]
	bl sub_80964A0
	ldr r0, _080970B8 @ =gBg0Tm + 0x244
	ldr r1, [r4, #0x2c]
	bl sub_8094BA4
	ldrb r1, [r5]
	lsls r0, r1, #1
	adds r7, r4, #0
	adds r7, #0x3a
	adds r1, r7, r0
	ldrh r1, [r1]
	lsls r1, r1, #4
	adds r0, r6, r0
	ldrh r0, [r0]
	subs r0, #0x28
	subs r1, r1, r0
	movs r3, #0x80
	lsls r3, r3, #4
	movs r0, #0x80
	movs r2, #0xb
	bl ShowSysHandCursor
	movs r0, #5
	bl EnableBgSync
	ldrh r0, [r4, #0x38]
	cmp r0, #0
	beq _080970CC
	ldr r0, _080970BC @ =0x02012466
	ldrh r0, [r0]
	cmp r0, #0
	beq _080970C4
	ldr r2, _080970C0 @ =0x020117E4
	ldrb r5, [r5]
	lsls r3, r5, #1
	adds r0, r7, r3
	ldrh r1, [r0]
	lsls r0, r1, #2
	adds r0, r0, r2
	ldrh r2, [r0, #2]
	lsls r1, r1, #4
	adds r3, r6, r3
	ldrh r0, [r3]
	subs r0, #0x28
	subs r1, r1, r0
	movs r0, #0x80
	bl StartItemHelpBox
	movs r0, #1
	b _080970CA
	.align 2, 0
_080970B0: .4byte 0x02012BA0
_080970B4: .4byte gBg2Tm + 0x1e
_080970B8: .4byte gBg0Tm + 0x244
_080970BC: .4byte 0x02012466
_080970C0: .4byte 0x020117E4
_080970C4:
	bl CloseHelpBox
	movs r0, #0xff
_080970CA:
	strh r0, [r4, #0x38]
_080970CC:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_80970D4
sub_80970D4: @ 0x080970D4
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r6, r0, #0
	movs r3, #0
	movs r7, #4
	adds r0, #0x34
	ldrb r1, [r0]
	adds r1, #1
	strb r1, [r0]
	ldrb r4, [r0]
	cmp r4, #4
	bge _08097100
	subs r1, r7, r4
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #5
	muls r0, r1, r0
	movs r1, #0x10
	bl __divsi3
	adds r3, r0, #0
	subs r3, #0x60
_08097100:
	adds r5, r6, #0
	adds r5, #0x35
	cmp r4, #4
	bne _08097120
	ldrb r0, [r5]
	cmp r0, #0
	bne _08097112
	movs r0, #8
	b _08097114
_08097112:
	subs r0, #1
_08097114:
	strb r0, [r5]
	adds r0, r6, #0
	str r3, [sp]
	bl sub_8097020
	ldr r3, [sp]
_08097120:
	adds r4, r6, #0
	adds r4, #0x34
	ldrb r1, [r4]
	cmp r1, r7
	blt _08097140
	subs r1, r1, r7
	subs r1, r7, r1
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #5
	muls r0, r1, r0
	adds r1, r7, #0
	muls r1, r7, r1
	bl __divsi3
	adds r3, r0, #0
_08097140:
	movs r0, #0xff
	ands r3, r0
	ldrb r5, [r5]
	lsls r1, r5, #1
	adds r0, r6, #0
	adds r0, #0x4c
	adds r0, r0, r1
	ldrh r2, [r0]
	subs r2, #0x28
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	movs r0, #2
	adds r1, r3, #0
	bl SetBgOffset
	lsls r0, r7, #1
	ldrb r4, [r4]
	cmp r4, r0
	bne _0809716E
	adds r0, r6, #0
	movs r1, #4
	bl Proc_Goto
_0809716E:
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_8097178
sub_8097178: @ 0x08097178
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r7, r0, #0
	movs r0, #4
	mov r8, r0
	adds r0, r7, #0
	adds r0, #0x34
	ldrb r1, [r0]
	adds r1, #1
	strb r1, [r0]
	ldrb r4, [r0]
	cmp r4, #4
	bge _080971AA
	mov r2, r8
	subs r1, r2, r4
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #5
	muls r0, r1, r0
	movs r1, #0x10
	bl __divsi3
	movs r1, #0x60
	subs r6, r1, r0
_080971AA:
	adds r5, r7, #0
	adds r5, #0x35
	cmp r4, #4
	bne _080971C6
	ldrb r0, [r5]
	cmp r0, #8
	bne _080971BC
	movs r0, #0
	b _080971BE
_080971BC:
	adds r0, #1
_080971BE:
	strb r0, [r5]
	adds r0, r7, #0
	bl sub_8097020
_080971C6:
	adds r4, r7, #0
	adds r4, #0x34
	ldrb r1, [r4]
	cmp r1, r8
	blt _080971EA
	mov r0, r8
	subs r1, r1, r0
	subs r1, r0, r1
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #5
	muls r0, r1, r0
	mov r2, r8
	mov r1, r8
	muls r1, r2, r1
	bl __divsi3
	rsbs r6, r0, #0
_080971EA:
	movs r0, #0xff
	ands r6, r0
	ldrb r5, [r5]
	lsls r1, r5, #1
	adds r0, r7, #0
	adds r0, #0x4c
	adds r0, r0, r1
	ldrh r2, [r0]
	subs r2, #0x28
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	movs r0, #2
	adds r1, r6, #0
	bl SetBgOffset
	mov r1, r8
	lsls r0, r1, #1
	ldrb r4, [r4]
	cmp r4, r0
	bne _0809721A
	adds r0, r7, #0
	movs r1, #4
	bl Proc_Goto
_0809721A:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_8097224
sub_8097224: @ 0x08097224
	push {r4, r5, lr}
	mov ip, r0
	ldr r0, _0809724C @ =0x02012466
	ldrh r4, [r0]
	adds r5, r0, #0
	cmp r4, #0
	bne _08097250
	mov r3, ip
	adds r3, #0x35
	ldrb r1, [r3]
	lsls r0, r1, #1
	mov r1, ip
	adds r1, #0x3a
	adds r1, r1, r0
	mov r2, ip
	adds r2, #0x4c
	adds r0, r2, r0
	strh r4, [r0]
	strh r4, [r1]
	b _0809726E
	.align 2, 0
_0809724C: .4byte 0x02012466
_08097250:
	mov r2, ip
	adds r2, #0x35
	ldrb r0, [r2]
	lsls r1, r0, #1
	mov r0, ip
	adds r0, #0x3a
	adds r0, r0, r1
	ldrh r4, [r5]
	subs r4, #1
	adds r3, r2, #0
	adds r2, #0x17
	ldrh r1, [r0]
	cmp r1, r4
	ble _0809726E
	strh r4, [r0]
_0809726E:
	ldrh r0, [r5]
	cmp r0, #6
	bls _0809728C
	ldrb r1, [r3]
	lsls r0, r1, #1
	adds r4, r2, r0
	ldrh r1, [r4]
	lsrs r0, r1, #4
	adds r0, #7
	ldrh r1, [r5]
	cmp r0, r1
	ble _0809728C
	subs r0, r1, #7
	lsls r0, r0, #4
	strh r0, [r4]
_0809728C:
	ldrb r3, [r3]
	lsls r0, r3, #1
	adds r0, r2, r0
	ldrh r2, [r0]
	subs r2, #0x28
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	movs r0, #2
	movs r1, #0
	bl SetBgOffset
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start sub_80972A8
sub_80972A8: @ 0x080972A8
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	mov ip, r0
	adds r0, #0x35
	ldrb r0, [r0]
	lsls r2, r0, #1
	mov r0, ip
	adds r0, #0x3a
	adds r4, r0, r2
	ldrh r3, [r4]
	lsls r1, r3, #4
	adds r0, #0x12
	adds r0, r0, r2
	ldrh r0, [r0]
	subs r0, #0x28
	subs r1, r1, r0
	cmp r1, #0x37
	bgt _080972D6
	cmp r3, #0
	beq _080972D6
	adds r0, r3, #1
	strh r0, [r4]
_080972D6:
	mov r4, ip
	adds r4, #0x35
	ldrb r1, [r4]
	lsls r0, r1, #1
	mov r3, ip
	adds r3, #0x3a
	adds r6, r3, r0
	ldrh r5, [r6]
	lsls r1, r5, #4
	mov r2, ip
	adds r2, #0x4c
	adds r0, r2, r0
	ldrh r0, [r0]
	subs r0, #0x28
	subs r1, r1, r0
	adds r7, r3, #0
	mov r8, r2
	cmp r1, #0x78
	ble _0809730A
	ldr r0, _08097338 @ =0x02012466
	ldrh r0, [r0]
	subs r0, #1
	cmp r5, r0
	beq _0809730A
	subs r0, r5, #1
	strh r0, [r6]
_0809730A:
	mov r0, ip
	bl sub_8097224
	ldrb r4, [r4]
	lsls r0, r4, #1
	adds r1, r7, r0
	ldrh r1, [r1]
	lsls r1, r1, #4
	add r0, r8
	ldrh r0, [r0]
	subs r0, #0x28
	subs r1, r1, r0
	movs r3, #0x80
	lsls r3, r3, #4
	movs r0, #0x80
	movs r2, #0xb
	bl ShowSysHandCursor
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08097338: .4byte 0x02012466

	thumb_func_start sub_809733C
sub_809733C: @ 0x0809733C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r4, r0, #0
	adds r7, r1, #0
	bl InitIcons
	ldr r0, _080973D4 @ =gBg2Tm + 0x1e
	mov r8, r0
	adds r6, r4, #0
	adds r6, #0x35
	ldrb r1, [r6]
	lsls r0, r1, #1
	adds r5, r4, #0
	adds r5, #0x4c
	adds r0, r5, r0
	ldrh r0, [r0]
	lsrs r1, r0, #4
	mov r0, r8
	bl sub_80965B4
	ldr r0, _080973D8 @ =gBg0Tm + 0x244
	ldr r1, [r4, #0x2c]
	bl sub_8094BA4
	movs r0, #5
	bl EnableBgSync
	cmp r7, #0
	bge _0809738E
	ldr r0, _080973DC @ =0x02012BA0
	ldrb r2, [r6]
	lsls r1, r2, #1
	adds r1, r5, r1
	ldrh r1, [r1]
	lsrs r2, r1, #4
	subs r2, #1
	ldr r3, [r4, #0x2c]
	mov r1, r8
	bl sub_8096618
_0809738E:
	cmp r7, #0
	ble _080973A8
	ldr r0, _080973DC @ =0x02012BA0
	ldrb r2, [r6]
	lsls r1, r2, #1
	adds r1, r5, r1
	ldrh r1, [r1]
	lsrs r2, r1, #4
	adds r2, #7
	ldr r3, [r4, #0x2c]
	mov r1, r8
	bl sub_8096618
_080973A8:
	ldrb r1, [r6]
	lsls r0, r1, #1
	adds r0, r5, r0
	ldrh r2, [r0]
	adds r1, r2, r7
	strh r1, [r0]
	ldrb r6, [r6]
	lsls r0, r6, #1
	adds r0, r5, r0
	ldrh r2, [r0]
	subs r2, #0x28
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	movs r0, #2
	movs r1, #0
	bl SetBgOffset
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080973D4: .4byte gBg2Tm + 0x1e
_080973D8: .4byte gBg0Tm + 0x244
_080973DC: .4byte 0x02012BA0

	thumb_func_start sub_80973E0
sub_80973E0: @ 0x080973E0
	push {lr}
	bl sub_8096834
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_80973EC
sub_80973EC: @ 0x080973EC
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r7, r0, #0
	ldr r0, [r7, #0x2c]
	bl GetUnitItemCount
	adds r2, r0, #0
	cmp r2, #5
	beq _08097408
	ldr r0, _08097420 @ =0x02012466
	ldrh r0, [r0]
	cmp r0, #0
	bne _08097428
_08097408:
	ldr r0, _08097424 @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	bge _08097416
	b _0809753A
_08097416:
	movs r0, #0xe3
	lsls r0, r0, #2
	bl m4aSongNumStart
	b _0809753A
	.align 2, 0
_08097420: .4byte 0x02012466
_08097424: .4byte gPlaySt
_08097428:
	movs r5, #0
	strh r5, [r7, #0x38]
	ldr r1, [r7, #0x2c]
	lsls r0, r2, #1
	adds r1, #0x1e
	adds r1, r1, r0
	ldr r4, _08097508 @ =0x020117E4
	movs r0, #0x35
	adds r0, r0, r7
	mov r8, r0
	ldrb r2, [r0]
	lsls r0, r2, #1
	adds r6, r7, #0
	adds r6, #0x3a
	adds r0, r6, r0
	ldrh r0, [r0]
	lsls r0, r0, #2
	adds r0, r0, r4
	ldrh r0, [r0, #2]
	strh r0, [r1]
	ldr r0, [r7, #0x2c]
	bl UnitRemoveInvalidItems
	mov r3, r8
	ldrb r3, [r3]
	lsls r0, r3, #1
	adds r0, r6, r0
	ldrh r0, [r0]
	lsls r0, r0, #2
	adds r0, r0, r4
	strh r5, [r0, #2]
	bl sub_8091B48
	ldr r0, [r7, #0x2c]
	mov r2, r8
	ldrb r1, [r2]
	movs r2, #1
	bl sub_8091A74
	adds r0, r7, #0
	bl sub_8097224
	bl InitIcons
	ldr r0, _0809750C @ =gBg0Tm + 0x244
	ldr r4, _08097510 @ =0x02012B78
	ldr r2, [r7, #0x2c]
	adds r1, r4, #0
	movs r3, #0
	bl sub_8094AC0
	adds r4, #0x28
	ldr r1, _08097514 @ =gBg2Tm + 0x1e
	mov r3, r8
	ldrb r3, [r3]
	lsls r0, r3, #1
	adds r5, r7, #0
	adds r5, #0x4c
	adds r0, r5, r0
	ldrh r0, [r0]
	lsrs r2, r0, #4
	ldr r3, [r7, #0x2c]
	adds r0, r4, #0
	bl sub_80964A0
	ldr r0, _08097518 @ =sub_80973E0
	movs r1, #1
	adds r2, r7, #0
	bl StartParallelFiniteLoop
	mov r1, r8
	ldrb r1, [r1]
	lsls r0, r1, #1
	adds r6, r6, r0
	ldrh r6, [r6]
	lsls r1, r6, #4
	adds r5, r5, r0
	ldrh r0, [r5]
	subs r0, #0x28
	subs r1, r1, r0
	movs r3, #0x80
	lsls r3, r3, #4
	movs r0, #0x80
	movs r2, #0xb
	bl ShowSysHandCursor
	movs r0, #5
	bl EnableBgSync
	ldr r1, _0809751C @ =gActionSt
	movs r0, #0x19
	strb r0, [r1, #0x11]
	ldr r0, [r7, #0x2c]
	bl GetUnitItemCount
	cmp r0, #5
	bne _08097528
	adds r0, r7, #0
	movs r1, #1
	bl Proc_Goto
	ldr r0, _08097520 @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0809753A
	ldr r0, _08097524 @ =0x0000038B
	bl m4aSongNumStart
	b _0809753A
	.align 2, 0
_08097508: .4byte 0x020117E4
_0809750C: .4byte gBg0Tm + 0x244
_08097510: .4byte 0x02012B78
_08097514: .4byte gBg2Tm + 0x1e
_08097518: .4byte sub_80973E0
_0809751C: .4byte gActionSt
_08097520: .4byte gPlaySt
_08097524: .4byte 0x0000038B
_08097528:
	ldr r0, _08097544 @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0809753A
	ldr r0, _08097548 @ =0x0000038A
	bl m4aSongNumStart
_0809753A:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08097544: .4byte gPlaySt
_08097548: .4byte 0x0000038A

	thumb_func_start sub_809754C
sub_809754C: @ 0x0809754C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	adds r4, r0, #0
	adds r7, r4, #0
	adds r7, #0x35
	ldrb r0, [r7]
	lsls r1, r0, #1
	movs r2, #0x3a
	adds r2, r2, r4
	mov r8, r2
	adds r0, r2, r1
	ldrh r0, [r0]
	mov sl, r0
	adds r5, r4, #0
	adds r5, #0x4c
	adds r6, r5, r1
	movs r3, #0xf
	ldrh r0, [r6]
	ands r0, r3
	mov sb, r0
	cmp r0, #0
	beq _08097580
	b _08097778
_08097580:
	ldrh r0, [r4, #0x38]
	cmp r0, #0
	beq _0809758A
	cmp r0, #0xff
	bne _0809762C
_0809758A:
	ldr r1, _080975C4 @ =gpKeySt
	ldr r0, [r1]
	ldrh r3, [r0, #8]
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r3
	mov r8, r1
	cmp r0, #0
	beq _080975EC
	ldr r0, _080975C8 @ =0x02012466
	ldrh r0, [r0]
	cmp r0, #0
	beq _080975D0
	ldr r1, _080975CC @ =0x020117E4
	mov r2, sl
	lsls r0, r2, #2
	adds r0, r0, r1
	ldrh r2, [r0, #2]
	mov r3, sl
	lsls r1, r3, #4
	ldrh r0, [r6]
	subs r0, #0x28
	subs r1, r1, r0
	movs r0, #0x80
	bl StartItemHelpBox
	movs r0, #1
	strh r0, [r4, #0x38]
	b _080978CA
	.align 2, 0
_080975C4: .4byte gpKeySt
_080975C8: .4byte 0x02012466
_080975CC: .4byte 0x020117E4
_080975D0:
	ldr r0, _080975E8 @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	bge _080975DE
	b _080978CA
_080975DE:
	movs r0, #0xe3
	lsls r0, r0, #2
	bl m4aSongNumStart
	b _080978CA
	.align 2, 0
_080975E8: .4byte gPlaySt
_080975EC:
	movs r0, #1
	ands r0, r3
	cmp r0, #0
	beq _080975FC
	adds r0, r4, #0
	bl sub_80973EC
	b _080978CA
_080975FC:
	movs r0, #2
	ands r0, r3
	cmp r0, #0
	beq _0809764C
	adds r0, r4, #0
	movs r1, #1
	bl Proc_Goto
	ldr r0, _08097624 @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0809761E
	ldr r0, _08097628 @ =0x0000038B
	bl m4aSongNumStart
_0809761E:
	mov r0, sb
	strh r0, [r4, #0x38]
	b _080978CA
	.align 2, 0
_08097624: .4byte gPlaySt
_08097628: .4byte 0x0000038B
_0809762C:
	ldr r2, _08097648 @ =gpKeySt
	ldr r1, [r2]
	movs r0, #0x81
	lsls r0, r0, #1
	ldrh r1, [r1, #8]
	ands r0, r1
	mov r8, r2
	cmp r0, #0
	beq _0809764C
	bl CloseHelpBox
	mov r1, sb
	strh r1, [r4, #0x38]
	b _080978CA
	.align 2, 0
_08097648: .4byte gpKeySt
_0809764C:
	mov r3, r8
	ldr r2, [r3]
	ldrh r1, [r2, #6]
	movs r0, #0x20
	ands r0, r1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	cmp r5, #0
	beq _08097698
	movs r0, #0
	bl SetUiSpinningArrowFastMaybe
	ldr r0, _08097690 @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08097676
	ldr r0, _08097694 @ =0x00000387
	bl m4aSongNumStart
_08097676:
	adds r0, r4, #0
	movs r1, #5
	bl Proc_Goto
	adds r1, r4, #0
	adds r1, #0x34
	movs r0, #0
	strb r0, [r1]
	adds r0, r4, #0
	bl sub_80970D4
	b _080978CA
	.align 2, 0
_08097690: .4byte gPlaySt
_08097694: .4byte 0x00000387
_08097698:
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	beq _080976D8
	movs r0, #1
	bl SetUiSpinningArrowFastMaybe
	ldr r0, _080976D0 @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080976B8
	ldr r0, _080976D4 @ =0x00000387
	bl m4aSongNumStart
_080976B8:
	adds r0, r4, #0
	movs r1, #6
	bl Proc_Goto
	adds r0, r4, #0
	adds r0, #0x34
	strb r5, [r0]
	adds r0, r4, #0
	bl sub_8097178
	b _080978CA
	.align 2, 0
_080976D0: .4byte gPlaySt
_080976D4: .4byte 0x00000387
_080976D8:
	movs r0, #0x80
	lsls r0, r0, #2
	ldrh r2, [r2, #4]
	ands r0, r2
	cmp r0, #0
	beq _080976EC
	adds r1, r4, #0
	adds r1, #0x32
	movs r0, #8
	b _080976F2
_080976EC:
	adds r1, r4, #0
	adds r1, #0x32
	movs r0, #4
_080976F2:
	strb r0, [r1]
	adds r5, r1, #0
	mov r0, r8
	ldr r1, [r0]
	movs r2, #0x40
	adds r0, r2, #0
	ldrh r3, [r1, #6]
	ands r0, r3
	cmp r0, #0
	bne _0809771E
	adds r0, r2, #0
	ldrh r1, [r1, #4]
	ands r0, r1
	adds r7, r4, #0
	adds r7, #0x35
	adds r6, r4, #0
	adds r6, #0x3a
	cmp r0, #0
	beq _0809773A
	ldrb r0, [r5]
	cmp r0, #8
	bne _0809773A
_0809771E:
	adds r0, r4, #0
	adds r0, #0x35
	ldrb r2, [r0]
	lsls r1, r2, #1
	adds r2, r4, #0
	adds r2, #0x3a
	adds r3, r2, r1
	ldrh r1, [r3]
	adds r7, r0, #0
	adds r6, r2, #0
	cmp r1, #0
	beq _0809773A
	subs r0, r1, #1
	strh r0, [r3]
_0809773A:
	mov r3, r8
	ldr r1, [r3]
	movs r2, #0x80
	adds r0, r2, #0
	ldrh r3, [r1, #6]
	ands r0, r3
	cmp r0, #0
	bne _0809775A
	adds r0, r2, #0
	ldrh r1, [r1, #4]
	ands r0, r1
	cmp r0, #0
	beq _080977D6
	ldrb r5, [r5]
	cmp r5, #8
	bne _080977D6
_0809775A:
	ldrb r1, [r7]
	lsls r0, r1, #1
	adds r2, r6, r0
	ldrh r1, [r2]
	ldr r0, _08097774 @ =0x02012466
	ldrh r0, [r0]
	subs r0, #1
	cmp r1, r0
	bge _080977D6
	adds r0, r1, #1
	strh r0, [r2]
	b _080977D6
	.align 2, 0
_08097774: .4byte 0x02012466
_08097778:
	mov r2, sl
	lsls r0, r2, #4
	ldrh r2, [r6]
	adds r1, r2, #0
	subs r1, #0x28
	subs r0, r0, r1
	cmp r0, #0x37
	bgt _08097796
	adds r0, r4, #0
	adds r0, #0x32
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r0, r2, r0
	strh r0, [r6]
_08097796:
	ldrb r3, [r7]
	lsls r2, r3, #1
	mov r1, r8
	adds r0, r1, r2
	ldrh r0, [r0]
	lsls r1, r0, #4
	adds r3, r5, r2
	ldrh r2, [r3]
	adds r0, r2, #0
	subs r0, #0x28
	subs r1, r1, r0
	cmp r1, #0x78
	ble _080977BE
	adds r0, r4, #0
	adds r0, #0x32
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r0, r2, r0
	strh r0, [r3]
_080977BE:
	ldrb r2, [r7]
	lsls r0, r2, #1
	adds r0, r5, r0
	ldrh r2, [r0]
	subs r2, #0x28
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	movs r0, #2
	movs r1, #0
	bl SetBgOffset
	mov r6, r8
_080977D6:
	ldrb r3, [r7]
	lsls r0, r3, #1
	adds r0, r6, r0
	ldrh r0, [r0]
	cmp sl, r0
	beq _080978CA
	ldr r1, _0809783C @ =0x020117E4
	lsls r0, r0, #2
	adds r0, r0, r1
	ldrh r0, [r0, #2]
	mov sb, r0
	ldr r0, _08097840 @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080977FE
	ldr r0, _08097844 @ =0x00000386
	bl m4aSongNumStart
_080977FE:
	ldrb r0, [r7]
	lsls r1, r0, #1
	adds r0, r6, r1
	ldrh r5, [r0]
	lsls r3, r5, #4
	adds r2, r4, #0
	adds r2, #0x4c
	adds r1, r2, r1
	ldrh r0, [r1]
	subs r0, #0x28
	subs r1, r3, r0
	mov r8, r2
	cmp r1, #0x37
	bgt _08097848
	cmp r5, #0
	beq _08097848
	ldrh r0, [r4, #0x38]
	cmp r0, #0
	beq _0809782E
	adds r1, #0x10
	movs r0, #0x80
	mov r2, sb
	bl StartItemHelpBox
_0809782E:
	adds r0, r4, #0
	adds r0, #0x32
	movs r1, #0
	ldrsb r1, [r0, r1]
	rsbs r1, r1, #0
	b _08097880
	.align 2, 0
_0809783C: .4byte 0x020117E4
_08097840: .4byte gPlaySt
_08097844: .4byte 0x00000386
_08097848:
	ldrb r1, [r7]
	lsls r0, r1, #1
	adds r1, r6, r0
	ldrh r2, [r1]
	lsls r1, r2, #4
	add r0, r8
	ldrh r0, [r0]
	subs r0, #0x28
	subs r1, r1, r0
	cmp r1, #0x78
	ble _0809788C
	ldr r0, _08097888 @ =0x02012466
	ldrh r0, [r0]
	subs r0, #1
	cmp r2, r0
	beq _0809788C
	ldrh r0, [r4, #0x38]
	cmp r0, #0
	beq _08097878
	subs r1, #0x10
	movs r0, #0x80
	mov r2, sb
	bl StartItemHelpBox
_08097878:
	adds r0, r4, #0
	adds r0, #0x32
	movs r1, #0
	ldrsb r1, [r0, r1]
_08097880:
	adds r0, r4, #0
	bl sub_809733C
	b _080978CA
	.align 2, 0
_08097888: .4byte 0x02012466
_0809788C:
	ldrh r0, [r4, #0x38]
	cmp r0, #0
	beq _080978AC
	ldrb r2, [r7]
	lsls r0, r2, #1
	adds r1, r6, r0
	ldrh r1, [r1]
	lsls r1, r1, #4
	add r0, r8
	ldrh r0, [r0]
	subs r0, #0x28
	subs r1, r1, r0
	movs r0, #0x80
	mov r2, sb
	bl StartItemHelpBox
_080978AC:
	ldrb r7, [r7]
	lsls r0, r7, #1
	adds r1, r6, r0
	ldrh r1, [r1]
	lsls r1, r1, #4
	add r0, r8
	ldrh r0, [r0]
	subs r0, #0x28
	subs r1, r1, r0
	movs r3, #0x80
	lsls r3, r3, #4
	movs r0, #0x80
	movs r2, #0xb
	bl ShowSysHandCursor
_080978CA:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_80978D8
sub_80978D8: @ 0x080978D8
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	ldr r6, _08097908 @ =gpKeySt
	ldr r0, [r6]
	ldrh r1, [r0, #6]
	movs r7, #0x40
	adds r0, r7, #0
	ands r0, r1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	cmp r5, #0
	beq _0809791E
	ldr r0, [r4, #0x2c]
	bl GetUnitItemCount
	adds r3, r0, #0
	adds r2, r4, #0
	adds r2, #0x31
	ldrb r0, [r2]
	cmp r0, #0
	beq _0809790C
	subs r0, #1
	strb r0, [r2]
	b _0809794E
	.align 2, 0
_08097908: .4byte gpKeySt
_0809790C:
	ldr r1, [r6]
	adds r0, r7, #0
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _0809796C
	subs r0, r3, #1
	strb r0, [r2]
	b _0809794E
_0809791E:
	movs r7, #0x80
	adds r0, r7, #0
	ands r0, r1
	cmp r0, #0
	beq _0809796C
	ldr r0, [r4, #0x2c]
	bl GetUnitItemCount
	adds r2, r4, #0
	adds r2, #0x31
	ldrb r1, [r2]
	subs r0, #1
	cmp r1, r0
	bge _08097940
	adds r0, r1, #1
	strb r0, [r2]
	b _0809794E
_08097940:
	ldr r1, [r6]
	adds r0, r7, #0
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _0809796C
	strb r5, [r2]
_0809794E:
	ldr r0, _08097964 @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08097960
	ldr r0, _08097968 @ =0x00000386
	bl m4aSongNumStart
_08097960:
	movs r0, #1
	b _0809796E
	.align 2, 0
_08097964: .4byte gPlaySt
_08097968: .4byte 0x00000386
_0809796C:
	movs r0, #0
_0809796E:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	thumb_func_start sub_8097974
sub_8097974: @ 0x08097974
	push {lr}
	adds r0, #0x31
	ldrb r0, [r0]
	lsls r1, r0, #4
	adds r1, #0x48
	movs r3, #0x80
	lsls r3, r3, #4
	movs r0, #0x10
	movs r2, #0xb
	bl ShowSysHandCursor
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_8097990
sub_8097990: @ 0x08097990
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	ldr r0, [r5, #0x2c]
	adds r7, r5, #0
	adds r7, #0x31
	ldrb r1, [r7]
	lsls r2, r1, #1
	adds r1, r0, #0
	adds r1, #0x1e
	adds r1, r1, r2
	ldrh r4, [r1]
	bl GetUnitItemCount
	ldr r0, [r5, #0x2c]
	ldrb r2, [r7]
	lsls r1, r2, #1
	adds r0, #0x1e
	adds r0, r0, r1
	movs r1, #0
	strh r1, [r0]
	ldr r0, [r5, #0x2c]
	bl UnitRemoveInvalidItems
	adds r0, r4, #0
	bl sub_80918A4
	adds r6, r5, #0
	adds r6, #0x35
	strb r0, [r6]
	adds r0, r4, #0
	bl AddItemToConvoy
	ldr r0, [r5, #0x2c]
	ldrb r1, [r6]
	movs r2, #1
	bl sub_8091A74
	adds r0, r5, #0
	bl sub_8097224
	bl InitIcons
	ldr r0, _08097A58 @ =gBg0Tm + 0x244
	ldr r4, _08097A5C @ =0x02012B78
	ldr r2, [r5, #0x2c]
	adds r1, r4, #0
	movs r3, #0
	bl sub_8094AC0
	adds r4, #0x28
	ldr r1, _08097A60 @ =gBg2Tm + 0x1e
	ldrb r6, [r6]
	lsls r2, r6, #1
	adds r0, r5, #0
	adds r0, #0x4c
	adds r0, r0, r2
	ldrh r0, [r0]
	lsrs r2, r0, #4
	ldr r3, [r5, #0x2c]
	adds r0, r4, #0
	bl sub_80964A0
	ldr r0, _08097A64 @ =sub_80973E0
	movs r1, #1
	adds r2, r5, #0
	bl StartParallelFiniteLoop
	movs r0, #4
	bl EnableBgSync
	ldr r0, [r5, #0x2c]
	bl GetUnitItemCount
	adds r4, r0, #0
	ldr r1, _08097A68 @ =gActionSt
	movs r0, #0x19
	strb r0, [r1, #0x11]
	cmp r4, #0
	beq _08097A3A
	bl sub_809158C
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x64
	bne _08097A74
_08097A3A:
	adds r0, r5, #0
	movs r1, #1
	bl Proc_Goto
	ldr r0, _08097A6C @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08097AA0
	ldr r0, _08097A70 @ =0x0000038B
	bl m4aSongNumStart
	b _08097AA0
	.align 2, 0
_08097A58: .4byte gBg0Tm + 0x244
_08097A5C: .4byte 0x02012B78
_08097A60: .4byte gBg2Tm + 0x1e
_08097A64: .4byte sub_80973E0
_08097A68: .4byte gActionSt
_08097A6C: .4byte gPlaySt
_08097A70: .4byte 0x0000038B
_08097A74:
	ldr r0, _08097AA8 @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08097A86
	ldr r0, _08097AAC @ =0x0000038A
	bl m4aSongNumStart
_08097A86:
	ldrb r0, [r7]
	cmp r4, r0
	bgt _08097AA0
	subs r0, r4, #1
	strb r0, [r7]
	lsls r1, r0, #4
	adds r1, #0x48
	movs r3, #0x80
	lsls r3, r3, #4
	movs r0, #0x10
	movs r2, #0xb
	bl ShowSysHandCursor
_08097AA0:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08097AA8: .4byte gPlaySt
_08097AAC: .4byte 0x0000038A

	thumb_func_start sub_8097AB0
sub_8097AB0: @ 0x08097AB0
	push {r4, r5, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x38]
	cmp r0, #1
	bne _08097AD8
	ldr r0, _08097AD4 @ =gpKeySt
	ldr r1, [r0]
	movs r0, #0x81
	lsls r0, r0, #1
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _08097B74
	bl CloseHelpBox
	movs r0, #0
	strh r0, [r4, #0x38]
	b _08097BB6
	.align 2, 0
_08097AD4: .4byte gpKeySt
_08097AD8:
	ldr r0, _08097B0C @ =gpKeySt
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r1
	cmp r0, #0
	beq _08097B10
	ldr r0, [r4, #0x2c]
	adds r1, r4, #0
	adds r1, #0x31
	ldrb r3, [r1]
	lsls r1, r3, #1
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r2, [r0]
	cmp r2, #0
	beq _08097BB6
	lsls r1, r3, #4
	adds r1, #0x48
	movs r0, #0x10
	bl StartItemHelpBox
	movs r0, #1
	strh r0, [r4, #0x38]
	b _08097BB6
	.align 2, 0
_08097B0C: .4byte gpKeySt
_08097B10:
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _08097B48
	ldr r0, [r4, #0x2c]
	adds r1, r4, #0
	adds r1, #0x31
	ldrb r1, [r1]
	bl sub_8091828
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08097B40
	movs r1, #1
	rsbs r1, r1, #0
	ldr r2, _08097B3C @ =0x000003B3
	adds r0, r1, #0
	adds r3, r4, #0
	bl sub_8091664
	b _08097BB6
	.align 2, 0
_08097B3C: .4byte 0x000003B3
_08097B40:
	adds r0, r4, #0
	bl sub_8097990
	b _08097BB6
_08097B48:
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _08097B74
	adds r0, r4, #0
	movs r1, #1
	bl Proc_Goto
	ldr r0, _08097B6C @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08097BB6
	ldr r0, _08097B70 @ =0x0000038B
	bl m4aSongNumStart
	b _08097BB6
	.align 2, 0
_08097B6C: .4byte gPlaySt
_08097B70: .4byte 0x0000038B
_08097B74:
	adds r0, r4, #0
	bl sub_80978D8
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08097BB6
	adds r5, r4, #0
	adds r5, #0x31
	ldrb r0, [r5]
	lsls r1, r0, #4
	adds r1, #0x48
	movs r3, #0x80
	lsls r3, r3, #4
	movs r0, #0x10
	movs r2, #0xb
	bl ShowSysHandCursor
	ldrh r0, [r4, #0x38]
	cmp r0, #1
	bne _08097BB6
	ldr r0, [r4, #0x2c]
	ldrb r3, [r5]
	lsls r1, r3, #1
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r2, [r0]
	cmp r2, #0
	beq _08097BB6
	lsls r1, r3, #4
	adds r1, #0x48
	movs r0, #0x10
	bl StartItemHelpBox
_08097BB6:
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start sub_8097BBC
sub_8097BBC: @ 0x08097BBC
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x30
	ldrb r0, [r0]
	cmp r0, #0
	bne _08097BD8
	ldr r0, _08097BF0 @ =ProcScr_AtMenu
	bl Proc_Find
	adds r1, r4, #0
	adds r1, #0x35
	ldrb r1, [r1]
	adds r0, #0x32
	strb r1, [r0]
_08097BD8:
	adds r0, r4, #0
	bl EndAllProcChildren
	bl EndMuralBackground_
	movs r0, #0
	bl SetOnHBlankA
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08097BF0: .4byte ProcScr_AtMenu

	thumb_func_start sub_8097BF4
sub_8097BF4: @ 0x08097BF4
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08097C0C @ =gUnk_08D8D120
	bl Proc_StartBlocking
	str r4, [r0, #0x2c]
	adds r0, #0x30
	movs r1, #0
	strb r1, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08097C0C: .4byte gUnk_08D8D120

	thumb_func_start sub_8097C10
sub_8097C10: @ 0x08097C10
	push {r4, lr}
	ldr r4, _08097C2C @ =gActiveUnit
	ldr r0, [r4]
	cmp r0, #0
	beq _08097C24
	bl EndAllMus
	ldr r0, [r4]
	bl ShowUnitSprite
_08097C24:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08097C2C: .4byte gActiveUnit

	thumb_func_start sub_8097C30
sub_8097C30: @ 0x08097C30
	push {r4, lr}
	ldr r4, _08097C50 @ =gActiveUnit
	ldr r0, [r4]
	cmp r0, #0
	beq _08097C48
	bl HideUnitSprite
	ldr r0, [r4]
	bl StartMu
	bl MU_SetDefaultFacing_Auto
_08097C48:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08097C50: .4byte gActiveUnit

	thumb_func_start sub_8097C54
sub_8097C54: @ 0x08097C54
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08097C70 @ =gUnk_08D8D1F0
	movs r1, #3
	bl Proc_Start
	str r4, [r0, #0x2c]
	adds r0, #0x30
	movs r1, #1
	strb r1, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08097C70: .4byte gUnk_08D8D1F0

	thumb_func_start sub_8097C74
sub_8097C74: @ 0x08097C74
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08097C90 @ =gUnk_08D8D1F0
	movs r1, #3
	bl Proc_Start
	str r4, [r0, #0x2c]
	adds r0, #0x30
	movs r1, #2
	strb r1, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08097C90: .4byte gUnk_08D8D1F0

	thumb_func_start sub_8097C94
sub_8097C94: @ 0x08097C94
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08097CD8 @ =ProcScr_AtMenu
	bl Proc_Find
	movs r2, #0
	movs r1, #0
	strh r1, [r4, #0x36]
	movs r1, #0xff
	strh r1, [r4, #0x34]
	adds r0, #0x31
	ldrb r0, [r0]
	adds r1, r4, #0
	adds r1, #0x33
	strb r0, [r1]
	subs r1, #2
	movs r0, #4
	strb r0, [r1]
	adds r0, r4, #0
	adds r0, #0x30
	strb r2, [r0]
	movs r2, #0
	adds r0, #8
	movs r1, #8
_08097CC4:
	strh r2, [r0]
	strh r2, [r0, #0x12]
	adds r0, #2
	subs r1, #1
	cmp r1, #0
	bge _08097CC4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08097CD8: .4byte ProcScr_AtMenu

	thumb_func_start sub_8097CDC
sub_8097CDC: @ 0x08097CDC
	push {r4, lr}
	sub sp, #8
	ldr r4, _08097D10 @ =gBg0Tm + 0x68
	adds r0, r4, #0
	movs r1, #0xc
	movs r2, #1
	movs r3, #0
	bl TmFillRect_thm
	ldr r0, _08097D14 @ =0x02012BE0
	movs r1, #0
	str r1, [sp]
	ldr r1, _08097D18 @ =gUnk_0842D0FC
	str r1, [sp, #4]
	adds r1, r4, #0
	movs r2, #0
	movs r3, #0
	bl PutDrawText
	movs r0, #1
	bl EnableBgSync
	add sp, #8
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08097D10: .4byte gBg0Tm + 0x68
_08097D14: .4byte 0x02012BE0
_08097D18: .4byte gUnk_0842D0FC

	thumb_func_start sub_8097D1C
sub_8097D1C: @ 0x08097D1C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #8
	adds r6, r0, #0
	adds r6, #0x33
	ldrb r2, [r6]
	lsls r1, r2, #1
	adds r5, r0, #0
	adds r5, #0x38
	adds r1, r5, r1
	ldrh r4, [r1]
	ldr r0, _08097D64 @ =gBg0Tm + 0x70
	mov r8, r0
	movs r1, #0xa
	movs r2, #1
	movs r3, #0
	bl TmFillRect_thm
	ldr r7, _08097D68 @ =0x02012B70
	adds r0, r7, #0
	bl ClearText
	ldr r0, _08097D6C @ =0x02012466
	ldrh r0, [r0]
	cmp r0, r4
	bgt _08097D74
	movs r0, #0
	str r0, [sp]
	ldr r0, _08097D70 @ =gUnk_0842D108
	str r0, [sp, #4]
	adds r0, r7, #0
	mov r1, r8
	movs r2, #1
	b _08097D94
	.align 2, 0
_08097D64: .4byte gBg0Tm + 0x70
_08097D68: .4byte 0x02012B70
_08097D6C: .4byte 0x02012466
_08097D70: .4byte gUnk_0842D108
_08097D74:
	ldr r0, _08097D9C @ =0x020117E4
	ldrb r6, [r6]
	lsls r1, r6, #1
	adds r1, r5, r1
	ldrh r1, [r1]
	lsls r1, r1, #2
	adds r1, r1, r0
	ldrb r0, [r1]
	cmp r0, #0
	bne _08097DA4
	str r0, [sp]
	ldr r0, _08097DA0 @ =gUnk_0842D110
	str r0, [sp, #4]
	adds r0, r7, #0
	mov r1, r8
	movs r2, #3
_08097D94:
	movs r3, #0
	bl PutDrawText
	b _08097DC2
	.align 2, 0
_08097D9C: .4byte 0x020117E4
_08097DA0: .4byte gUnk_0842D110
_08097DA4:
	bl GetUnitFromCharId
	ldr r0, [r0]
	ldrh r0, [r0]
	bl DecodeMsg
	movs r1, #0
	str r1, [sp]
	str r0, [sp, #4]
	adds r0, r7, #0
	mov r1, r8
	movs r2, #0
	movs r3, #0
	bl PutDrawText
_08097DC2:
	movs r0, #1
	bl EnableBgSync
	add sp, #8
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_8097DD4
sub_8097DD4: @ 0x08097DD4
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r6, r0, #0
	adds r7, r6, #0
	adds r7, #0x33
	ldrb r0, [r7]
	lsls r4, r0, #1
	adds r4, r4, r0
	lsls r4, r4, #2
	adds r4, #0x7c
	bl GetGameTime
	ldr r2, _08097E4C @ =gPal
	lsrs r0, r0, #2
	movs r1, #0xf
	ands r0, r1
	lsls r0, r0, #1
	ldr r1, _08097E50 @ =gUnk_08421C24
	adds r0, r0, r1
	ldrh r0, [r0]
	ldr r1, _08097E54 @ =0x0000029A
	adds r2, r2, r1
	strh r0, [r2]
	bl EnablePalSync
	ldr r1, _08097E58 @ =gUnk_08D8D4F8
	ldrb r2, [r7]
	lsls r0, r2, #2
	adds r0, r0, r1
	ldr r3, [r0]
	movs r5, #0x85
	lsls r5, r5, #7
	str r5, [sp]
	movs r0, #4
	adds r1, r4, #0
	movs r2, #0x18
	bl PutSprite
	ldr r3, _08097E5C @ =gUnk_08D8D4E8
	str r5, [sp]
	movs r0, #4
	adds r1, r4, #0
	movs r2, #0x18
	bl PutSprite
	ldrb r7, [r7]
	lsls r0, r7, #1
	adds r6, #0x4a
	adds r6, r6, r0
	ldrh r1, [r6]
	ldr r0, _08097E60 @ =0x02012466
	ldrh r2, [r0]
	movs r0, #0xb
	movs r3, #7
	bl sub_8090E04
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08097E4C: .4byte gPal
_08097E50: .4byte gUnk_08421C24
_08097E54: .4byte 0x0000029A
_08097E58: .4byte gUnk_08D8D4F8
_08097E5C: .4byte gUnk_08D8D4E8
_08097E60: .4byte 0x02012466

	thumb_func_start sub_8097E64
sub_8097E64: @ 0x08097E64
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #8
	adds r7, r0, #0
	ldr r0, _080981A4 @ =gDispIo
	mov r8, r0
	movs r0, #8
	rsbs r0, r0, #0
	mov r1, r8
	ldrb r1, [r1]
	ands r0, r1
	mov r2, r8
	strb r0, [r2]
	movs r0, #0
	bl InitBgs
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
	movs r1, #4
	rsbs r1, r1, #0
	adds r0, r1, #0
	mov r3, r8
	ldrb r3, [r3, #0xc]
	ands r0, r3
	movs r4, #1
	orrs r0, r4
	mov r2, r8
	strb r0, [r2, #0xc]
	adds r0, r1, #0
	ldrb r3, [r2, #0x10]
	ands r0, r3
	movs r2, #2
	mov sb, r2
	mov r3, sb
	orrs r0, r3
	mov r2, r8
	strb r0, [r2, #0x10]
	ldrb r3, [r2, #0x14]
	ands r1, r3
	strb r1, [r2, #0x14]
	movs r0, #3
	ldrb r1, [r2, #0x18]
	orrs r0, r1
	strb r0, [r2, #0x18]
	bl InitFaces
	bl ResetText
	bl InitIcons
	bl UnpackUiWindowFrameGraphics
	bl ApplySystemObjectsGraphics
	movs r0, #0
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	movs r0, #1
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	adds r0, r7, #0
	adds r0, #0x33
	ldrb r0, [r0]
	lsls r1, r0, #1
	adds r0, r7, #0
	adds r0, #0x4a
	adds r0, r0, r1
	ldrh r2, [r0]
	subs r2, #0x28
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	movs r0, #2
	movs r1, #0
	bl SetBgOffset
	ldr r0, _080981A8 @ =0x06012000
	movs r1, #1
	rsbs r1, r1, #0
	bl LoadHelpBoxGfx
	movs r0, #4
	bl ApplyIconPalettes
	bl PrepRestartMuralBackground
	movs r0, #0xa0
	lsls r0, r0, #7
	movs r1, #5
	bl sub_809228C
	ldr r0, _080981AC @ =gBg1Tm
	ldr r1, _080981B0 @ =gUnk_0842AA0C
	movs r2, #0xa5
	lsls r2, r2, #7
	bl TmApplyTsa_thm
	movs r0, #7
	bl EnableBgSync
	adds r0, r7, #0
	bl sub_80A98C8
	adds r0, r7, #0
	bl ResetSysHandCursor
	movs r0, #0xc0
	lsls r0, r0, #3
	movs r1, #1
	bl DisplaySysHandCursorTextShadow
	movs r0, #0x20
	mov r2, r8
	ldrb r2, [r2, #1]
	orrs r0, r2
	movs r1, #0x41
	rsbs r1, r1, #0
	ands r0, r1
	movs r1, #0x7f
	ands r0, r1
	mov r3, r8
	strb r0, [r3, #1]
	mov r1, r8
	adds r1, #0x2d
	movs r0, #0x80
	strb r0, [r1]
	adds r1, #4
	movs r0, #0x28
	strb r0, [r1]
	subs r1, #5
	movs r0, #0xe0
	strb r0, [r1]
	adds r1, #4
	movs r0, #0x98
	strb r0, [r1]
	mov r2, r8
	adds r2, #0x34
	ldrb r0, [r2]
	orrs r0, r4
	mov r1, sb
	orrs r0, r1
	movs r1, #4
	orrs r0, r1
	movs r5, #8
	orrs r0, r5
	movs r3, #0x10
	orrs r0, r3
	strb r0, [r2]
	mov r1, r8
	adds r1, #0x36
	ldrb r2, [r1]
	orrs r4, r2
	mov r0, sb
	orrs r4, r0
	movs r0, #5
	rsbs r0, r0, #0
	ands r4, r0
	orrs r4, r5
	orrs r4, r3
	strb r4, [r1]
	adds r0, r7, #0
	bl StartGreenText
	movs r0, #0xc8
	movs r1, #0x90
	adds r2, r7, #0
	bl StartHelpPromptSprite
	ldr r4, _080981B4 @ =0x02012B68
	adds r0, r4, #0
	movs r1, #6
	bl InitText
	adds r0, r4, #0
	adds r0, #8
	movs r1, #5
	bl InitText
	adds r0, r4, #0
	adds r0, #0x78
	movs r1, #4
	bl InitText
	adds r4, #0x10
	movs r5, #4
_08098000:
	adds r0, r4, #0
	movs r1, #7
	bl InitText
	adds r4, #8
	subs r5, #1
	cmp r5, #0
	bge _08098000
	movs r1, #0x33
	adds r1, r1, r7
	mov r8, r1
	adds r6, r7, #0
	adds r6, #0x4a
	ldr r4, _080981B8 @ =0x02012BA0
	movs r5, #7
_0809801E:
	adds r0, r4, #0
	movs r1, #7
	bl sub_800536C
	adds r4, #8
	subs r5, #1
	cmp r5, #0
	bge _0809801E
	movs r4, #0x80
	lsls r4, r4, #7
	adds r0, r4, #0
	movs r1, #6
	bl sub_8096464
	ldr r2, _080981BC @ =gBg0Tm + 0xde
	mov sb, r2
	mov r0, sb
	adds r1, r4, #0
	movs r2, #6
	bl sub_8096A38
	ldr r0, _080981C0 @ =gUnk_0841E0A4
	ldr r1, _080981C4 @ =0x06015000
	bl Decompress
	adds r0, r7, #0
	bl sub_8090DD0
	movs r0, #0xb0
	lsls r0, r0, #7
	movs r1, #4
	bl sub_8090E38
	movs r0, #0xe2
	movs r1, #0x30
	bl sub_8090DE4
	bl sub_8090DA0
	ldr r0, [r7, #0x2c]
	mov r3, r8
	ldrb r1, [r3]
	movs r2, #3
	bl sub_8091A74
	adds r0, r7, #0
	bl sub_80986C0
	ldr r5, _080981B8 @ =0x02012BA0
	ldr r1, _080981C8 @ =gBg2Tm + 0x1e
	mov r2, r8
	ldrb r2, [r2]
	lsls r0, r2, #1
	adds r0, r6, r0
	ldrh r0, [r0]
	lsrs r2, r0, #4
	ldr r3, [r7, #0x2c]
	adds r0, r5, #0
	bl sub_80964A0
	movs r0, #4
	bl EnableBgSync
	movs r0, #0xb3
	lsls r0, r0, #1
	add r0, sb
	adds r1, r5, #0
	subs r1, #0x28
	ldr r2, [r7, #0x2c]
	movs r3, #0
	bl sub_8094AC0
	bl sub_8097CDC
	adds r0, r7, #0
	bl StartUiSpinningArrows
	movs r1, #0xa0
	lsls r1, r1, #2
	movs r0, #0
	movs r2, #2
	bl LoadUiSpinningArrowGfx
	movs r0, #0x78
	movs r1, #0x18
	movs r2, #0xea
	movs r3, #0x18
	bl SetUiSpinningArrowPositions
	movs r0, #3
	bl SetUiSpinningArrowConfig
	ldr r0, _080981CC @ =sub_8097DD4
	adds r1, r7, #0
	bl StartParallelWorker
	ldr r0, [r7, #0x2c]
	bl GetUnitPortraitId
	adds r1, r0, #0
	movs r3, #4
	rsbs r3, r3, #0
	ldr r0, _080981D0 @ =0x00000203
	str r0, [sp]
	movs r0, #0
	movs r2, #0x40
	bl StartBmFace
	ldr r0, [r7, #0x2c]
	ldr r0, [r0]
	ldrh r0, [r0]
	bl DecodeMsg
	mov r8, r0
	movs r1, #0xe0
	lsls r1, r1, #4
	movs r3, #0xc0
	lsls r3, r3, #4
	movs r0, #0x80
	lsls r0, r0, #3
	str r0, [sp]
	str r7, [sp, #4]
	movs r0, #0xd
	movs r2, #0xf
	bl StartSysBrownBox
	movs r1, #0x28
	rsbs r1, r1, #0
	movs r2, #1
	rsbs r2, r2, #0
	movs r0, #0
	movs r3, #1
	bl EnableSysBrownBox
	movs r0, #1
	movs r1, #0x98
	movs r2, #6
	movs r3, #2
	bl EnableSysBrownBox
	ldr r3, _080981A4 @ =gDispIo
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
	movs r4, #0
	movs r0, #0xe
	strb r0, [r1]
	adds r1, #1
	movs r0, #4
	strb r0, [r1]
	adds r0, r3, #0
	adds r0, #0x46
	strb r4, [r0]
	ldr r0, _080981D4 @ =0x0000FFE0
	ldrh r2, [r3, #0x3c]
	ands r0, r2
	ldr r1, _080981D8 @ =0x0000E0FF
	ands r0, r1
	movs r2, #0x80
	lsls r2, r2, #4
	adds r1, r2, #0
	orrs r0, r1
	strh r0, [r3, #0x3c]
	movs r0, #0x30
	mov r1, r8
	bl GetStringTextCenteredPos
	adds r3, r0, #0
	subs r5, #0x38
	str r4, [sp]
	mov r0, r8
	str r0, [sp, #4]
	adds r0, r5, #0
	ldr r1, _080981DC @ =gBg0Tm
	movs r2, #0
	bl PutDrawText
	adds r0, r7, #0
	bl sub_8097D1C
	add sp, #8
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080981A4: .4byte gDispIo
_080981A8: .4byte 0x06012000
_080981AC: .4byte gBg1Tm
_080981B0: .4byte gUnk_0842AA0C
_080981B4: .4byte 0x02012B68
_080981B8: .4byte 0x02012BA0
_080981BC: .4byte gBg0Tm + 0xde
_080981C0: .4byte gUnk_0841E0A4
_080981C4: .4byte 0x06015000
_080981C8: .4byte gBg2Tm + 0x1e
_080981CC: .4byte sub_8097DD4
_080981D0: .4byte 0x00000203
_080981D4: .4byte 0x0000FFE0
_080981D8: .4byte 0x0000E0FF
_080981DC: .4byte gBg0Tm

	thumb_func_start sub_80981E0
sub_80981E0: @ 0x080981E0
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0809820C @ =ProcScr_AtMenu
	bl Proc_Find
	adds r1, r4, #0
	adds r1, #0x33
	ldrb r1, [r1]
	adds r0, #0x31
	strb r1, [r0]
	adds r0, r4, #0
	bl EndAllProcChildren
	movs r0, #0
	bl EndFaceById
	bl EndMuralBackground_
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0809820C: .4byte ProcScr_AtMenu

	thumb_func_start sub_8098210
sub_8098210: @ 0x08098210
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	bl InitIcons
	ldr r0, [r4, #0x2c]
	adds r5, r4, #0
	adds r5, #0x33
	ldrb r1, [r5]
	movs r2, #3
	bl sub_8091A74
	adds r0, r4, #0
	bl sub_8098430
	ldr r0, _080982B0 @ =0x02012BA0
	ldr r1, _080982B4 @ =gBg2Tm + 0x1e
	ldrb r3, [r5]
	lsls r2, r3, #1
	adds r6, r4, #0
	adds r6, #0x4a
	adds r2, r6, r2
	ldrh r2, [r2]
	lsrs r2, r2, #4
	ldr r3, [r4, #0x2c]
	bl sub_80964A0
	ldr r0, _080982B8 @ =gBg0Tm + 0x244
	ldr r1, [r4, #0x2c]
	bl sub_8094BA4
	ldrb r1, [r5]
	lsls r0, r1, #1
	adds r7, r4, #0
	adds r7, #0x38
	adds r1, r7, r0
	ldrh r1, [r1]
	lsls r1, r1, #4
	adds r0, r6, r0
	ldrh r0, [r0]
	subs r0, #0x28
	subs r1, r1, r0
	movs r3, #0x80
	lsls r3, r3, #4
	movs r0, #0x80
	movs r2, #0xb
	bl ShowSysHandCursor
	movs r0, #5
	bl EnableBgSync
	ldr r0, _080982BC @ =sub_8097D1C
	movs r1, #2
	adds r2, r4, #0
	bl StartParallelFiniteLoop
	ldrh r0, [r4, #0x36]
	cmp r0, #0
	beq _080982D0
	ldr r0, _080982C0 @ =0x02012466
	ldrh r0, [r0]
	cmp r0, #0
	beq _080982C8
	ldr r2, _080982C4 @ =0x020117E4
	ldrb r5, [r5]
	lsls r3, r5, #1
	adds r0, r7, r3
	ldrh r1, [r0]
	lsls r0, r1, #2
	adds r0, r0, r2
	ldrh r2, [r0, #2]
	lsls r1, r1, #4
	adds r3, r6, r3
	ldrh r0, [r3]
	subs r0, #0x28
	subs r1, r1, r0
	movs r0, #0x80
	bl StartItemHelpBox
	movs r0, #1
	b _080982CE
	.align 2, 0
_080982B0: .4byte 0x02012BA0
_080982B4: .4byte gBg2Tm + 0x1e
_080982B8: .4byte gBg0Tm + 0x244
_080982BC: .4byte sub_8097D1C
_080982C0: .4byte 0x02012466
_080982C4: .4byte 0x020117E4
_080982C8:
	bl CloseHelpBox
	movs r0, #0xff
_080982CE:
	strh r0, [r4, #0x36]
_080982D0:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_80982D8
sub_80982D8: @ 0x080982D8
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r7, r0, #0
	movs r0, #4
	mov r8, r0
	adds r1, r7, #0
	adds r1, #0x32
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	ldrb r4, [r1]
	cmp r4, #4
	bge _0809830A
	mov r2, r8
	subs r1, r2, r4
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #5
	muls r0, r1, r0
	movs r1, #0x10
	bl __divsi3
	adds r6, r0, #0
	subs r6, #0x60
_0809830A:
	adds r5, r7, #0
	adds r5, #0x33
	cmp r4, #4
	bne _08098326
	ldrb r0, [r5]
	cmp r0, #0
	bne _0809831C
	movs r0, #8
	b _0809831E
_0809831C:
	subs r0, #1
_0809831E:
	strb r0, [r5]
	adds r0, r7, #0
	bl sub_8098210
_08098326:
	adds r4, r7, #0
	adds r4, #0x32
	ldrb r1, [r4]
	cmp r1, r8
	blt _0809834A
	mov r0, r8
	subs r1, r1, r0
	subs r1, r0, r1
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #5
	muls r0, r1, r0
	mov r2, r8
	mov r1, r8
	muls r1, r2, r1
	bl __divsi3
	adds r6, r0, #0
_0809834A:
	movs r0, #0xff
	ands r6, r0
	ldrb r5, [r5]
	lsls r1, r5, #1
	adds r0, r7, #0
	adds r0, #0x4a
	adds r0, r0, r1
	ldrh r2, [r0]
	subs r2, #0x28
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	movs r0, #2
	adds r1, r6, #0
	bl SetBgOffset
	mov r1, r8
	lsls r0, r1, #1
	ldrb r4, [r4]
	cmp r4, r0
	bne _0809837A
	adds r0, r7, #0
	movs r1, #1
	bl Proc_Goto
_0809837A:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_8098384
sub_8098384: @ 0x08098384
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r7, r0, #0
	movs r0, #4
	mov r8, r0
	adds r1, r7, #0
	adds r1, #0x32
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	ldrb r4, [r1]
	cmp r4, #4
	bge _080983B6
	mov r2, r8
	subs r1, r2, r4
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #5
	muls r0, r1, r0
	movs r1, #0x10
	bl __divsi3
	movs r1, #0x60
	subs r6, r1, r0
_080983B6:
	adds r5, r7, #0
	adds r5, #0x33
	cmp r4, #4
	bne _080983D2
	ldrb r0, [r5]
	cmp r0, #8
	bne _080983C8
	movs r0, #0
	b _080983CA
_080983C8:
	adds r0, #1
_080983CA:
	strb r0, [r5]
	adds r0, r7, #0
	bl sub_8098210
_080983D2:
	adds r4, r7, #0
	adds r4, #0x32
	ldrb r1, [r4]
	cmp r1, r8
	blt _080983F6
	mov r0, r8
	subs r1, r1, r0
	subs r1, r0, r1
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #5
	muls r0, r1, r0
	mov r2, r8
	mov r1, r8
	muls r1, r2, r1
	bl __divsi3
	rsbs r6, r0, #0
_080983F6:
	movs r0, #0xff
	ands r6, r0
	ldrb r5, [r5]
	lsls r1, r5, #1
	adds r0, r7, #0
	adds r0, #0x4a
	adds r0, r0, r1
	ldrh r2, [r0]
	subs r2, #0x28
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	movs r0, #2
	adds r1, r6, #0
	bl SetBgOffset
	mov r1, r8
	lsls r0, r1, #1
	ldrb r4, [r4]
	cmp r4, r0
	bne _08098426
	adds r0, r7, #0
	movs r1, #1
	bl Proc_Goto
_08098426:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_8098430
sub_8098430: @ 0x08098430
	push {r4, r5, lr}
	mov ip, r0
	ldr r0, _08098458 @ =0x02012466
	ldrh r4, [r0]
	adds r5, r0, #0
	cmp r4, #0
	bne _0809845C
	mov r3, ip
	adds r3, #0x33
	ldrb r1, [r3]
	lsls r0, r1, #1
	mov r1, ip
	adds r1, #0x38
	adds r1, r1, r0
	mov r2, ip
	adds r2, #0x4a
	adds r0, r2, r0
	strh r4, [r0]
	strh r4, [r1]
	b _0809847A
	.align 2, 0
_08098458: .4byte 0x02012466
_0809845C:
	mov r2, ip
	adds r2, #0x33
	ldrb r0, [r2]
	lsls r1, r0, #1
	mov r0, ip
	adds r0, #0x38
	adds r0, r0, r1
	ldrh r4, [r5]
	subs r4, #1
	adds r3, r2, #0
	adds r2, #0x17
	ldrh r1, [r0]
	cmp r1, r4
	ble _0809847A
	strh r4, [r0]
_0809847A:
	ldrh r0, [r5]
	cmp r0, #6
	bls _08098498
	ldrb r1, [r3]
	lsls r0, r1, #1
	adds r4, r2, r0
	ldrh r1, [r4]
	lsrs r0, r1, #4
	adds r0, #7
	ldrh r1, [r5]
	cmp r0, r1
	ble _08098498
	subs r0, r1, #7
	lsls r0, r0, #4
	strh r0, [r4]
_08098498:
	ldrb r3, [r3]
	lsls r0, r3, #1
	adds r0, r2, r0
	ldrh r2, [r0]
	subs r2, #0x28
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	movs r0, #2
	movs r1, #0
	bl SetBgOffset
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start sub_80984B4
sub_80984B4: @ 0x080984B4
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r4, r0, #0
	adds r7, r1, #0
	bl InitIcons
	ldr r0, _0809854C @ =gBg2Tm + 0x1e
	mov r8, r0
	adds r6, r4, #0
	adds r6, #0x33
	ldrb r1, [r6]
	lsls r0, r1, #1
	adds r5, r4, #0
	adds r5, #0x4a
	adds r0, r5, r0
	ldrh r0, [r0]
	lsrs r1, r0, #4
	mov r0, r8
	bl sub_80965B4
	ldr r0, _08098550 @ =gBg0Tm + 0x244
	ldr r1, [r4, #0x2c]
	bl sub_8094BA4
	movs r0, #5
	bl EnableBgSync
	cmp r7, #0
	bge _08098506
	ldr r0, _08098554 @ =0x02012BA0
	ldrb r2, [r6]
	lsls r1, r2, #1
	adds r1, r5, r1
	ldrh r1, [r1]
	lsrs r2, r1, #4
	subs r2, #1
	ldr r3, [r4, #0x2c]
	mov r1, r8
	bl sub_8096618
_08098506:
	cmp r7, #0
	ble _08098520
	ldr r0, _08098554 @ =0x02012BA0
	ldrb r2, [r6]
	lsls r1, r2, #1
	adds r1, r5, r1
	ldrh r1, [r1]
	lsrs r2, r1, #4
	adds r2, #7
	ldr r3, [r4, #0x2c]
	mov r1, r8
	bl sub_8096618
_08098520:
	ldrb r1, [r6]
	lsls r0, r1, #1
	adds r0, r5, r0
	ldrh r2, [r0]
	adds r1, r2, r7
	strh r1, [r0]
	ldrb r6, [r6]
	lsls r0, r6, #1
	adds r0, r5, r0
	ldrh r2, [r0]
	subs r2, #0x28
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	movs r0, #2
	movs r1, #0
	bl SetBgOffset
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0809854C: .4byte gBg2Tm + 0x1e
_08098550: .4byte gBg0Tm + 0x244
_08098554: .4byte 0x02012BA0

	thumb_func_start sub_8098558
sub_8098558: @ 0x08098558
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	adds r6, r0, #0
	ldr r0, [r6, #0x2c]
	bl GetUnitItemCount
	adds r2, r0, #0
	cmp r2, #5
	beq _08098576
	ldr r0, _08098590 @ =0x02012466
	ldrh r0, [r0]
	cmp r0, #0
	bne _08098598
_08098576:
	ldr r0, _08098594 @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	bge _08098584
	b _080986AA
_08098584:
	movs r0, #0xe3
	lsls r0, r0, #2
	bl m4aSongNumStart
	b _080986AA
	.align 2, 0
_08098590: .4byte 0x02012466
_08098594: .4byte gPlaySt
_08098598:
	movs r4, #0
	strh r4, [r6, #0x36]
	ldr r1, [r6, #0x2c]
	lsls r0, r2, #1
	adds r1, #0x1e
	adds r1, r1, r0
	ldr r0, _0809867C @ =0x020117E4
	mov sb, r0
	adds r7, r6, #0
	adds r7, #0x33
	ldrb r2, [r7]
	lsls r0, r2, #1
	adds r5, r6, #0
	adds r5, #0x38
	adds r0, r5, r0
	ldrh r0, [r0]
	lsls r0, r0, #2
	add r0, sb
	ldrh r0, [r0, #2]
	strh r0, [r1]
	ldr r0, [r6, #0x2c]
	bl UnitRemoveInvalidItems
	ldrb r1, [r7]
	lsls r0, r1, #1
	adds r0, r5, r0
	ldrh r0, [r0]
	lsls r0, r0, #2
	add r0, sb
	strh r4, [r0, #2]
	bl sub_8091B48
	ldr r0, [r6, #0x2c]
	ldrb r1, [r7]
	movs r2, #3
	bl sub_8091A74
	adds r0, r6, #0
	bl sub_8098430
	bl InitIcons
	ldr r0, _08098680 @ =gBg0Tm + 0x244
	ldr r4, _08098684 @ =0x02012B78
	ldr r2, [r6, #0x2c]
	adds r1, r4, #0
	movs r3, #0
	bl sub_8094AC0
	adds r4, #0x28
	ldr r1, _08098688 @ =gBg2Tm + 0x1e
	ldrb r2, [r7]
	lsls r0, r2, #1
	movs r2, #0x4a
	adds r2, r2, r6
	mov r8, r2
	add r0, r8
	ldrh r0, [r0]
	lsrs r2, r0, #4
	ldr r3, [r6, #0x2c]
	adds r0, r4, #0
	bl sub_80964A0
	ldrb r1, [r7]
	lsls r0, r1, #1
	adds r0, r5, r0
	ldrh r0, [r0]
	lsls r0, r0, #2
	add r0, sb
	ldrb r0, [r0]
	cmp r0, #0
	beq _08098632
	ldr r0, _0809868C @ =sub_8097D1C
	movs r1, #1
	adds r2, r6, #0
	bl StartParallelFiniteLoop
_08098632:
	ldrb r7, [r7]
	lsls r0, r7, #1
	adds r1, r5, r0
	ldrh r1, [r1]
	lsls r1, r1, #4
	add r0, r8
	ldrh r0, [r0]
	subs r0, #0x28
	subs r1, r1, r0
	movs r3, #0x80
	lsls r3, r3, #4
	movs r0, #0x80
	movs r2, #0xb
	bl ShowSysHandCursor
	movs r0, #5
	bl EnableBgSync
	ldr r0, [r6, #0x2c]
	bl GetUnitItemCount
	cmp r0, #5
	bne _08098698
	adds r0, r6, #0
	movs r1, #1
	bl Proc_Goto
	ldr r0, _08098690 @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080986AA
	ldr r0, _08098694 @ =0x0000038B
	bl m4aSongNumStart
	b _080986AA
	.align 2, 0
_0809867C: .4byte 0x020117E4
_08098680: .4byte gBg0Tm + 0x244
_08098684: .4byte 0x02012B78
_08098688: .4byte gBg2Tm + 0x1e
_0809868C: .4byte sub_8097D1C
_08098690: .4byte gPlaySt
_08098694: .4byte 0x0000038B
_08098698:
	ldr r0, _080986B8 @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080986AA
	ldr r0, _080986BC @ =0x0000038A
	bl m4aSongNumStart
_080986AA:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080986B8: .4byte gPlaySt
_080986BC: .4byte 0x0000038A

	thumb_func_start sub_80986C0
sub_80986C0: @ 0x080986C0
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	mov ip, r0
	adds r0, #0x33
	ldrb r0, [r0]
	lsls r2, r0, #1
	mov r0, ip
	adds r0, #0x38
	adds r4, r0, r2
	ldrh r3, [r4]
	lsls r1, r3, #4
	adds r0, #0x12
	adds r0, r0, r2
	ldrh r0, [r0]
	subs r0, #0x28
	subs r1, r1, r0
	cmp r1, #0x37
	bgt _080986EE
	cmp r3, #0
	beq _080986EE
	adds r0, r3, #1
	strh r0, [r4]
_080986EE:
	mov r4, ip
	adds r4, #0x33
	ldrb r1, [r4]
	lsls r0, r1, #1
	mov r3, ip
	adds r3, #0x38
	adds r6, r3, r0
	ldrh r5, [r6]
	lsls r1, r5, #4
	mov r2, ip
	adds r2, #0x4a
	adds r0, r2, r0
	ldrh r0, [r0]
	subs r0, #0x28
	subs r1, r1, r0
	adds r7, r3, #0
	mov r8, r2
	cmp r1, #0x78
	ble _08098722
	ldr r0, _08098750 @ =0x02012466
	ldrh r0, [r0]
	subs r0, #1
	cmp r5, r0
	beq _08098722
	subs r0, r5, #1
	strh r0, [r6]
_08098722:
	mov r0, ip
	bl sub_8098430
	ldrb r4, [r4]
	lsls r0, r4, #1
	adds r1, r7, r0
	ldrh r1, [r1]
	lsls r1, r1, #4
	add r0, r8
	ldrh r0, [r0]
	subs r0, #0x28
	subs r1, r1, r0
	movs r3, #0x80
	lsls r3, r3, #4
	movs r0, #0x80
	movs r2, #0xb
	bl ShowSysHandCursor
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08098750: .4byte 0x02012466

	thumb_func_start sub_8098754
sub_8098754: @ 0x08098754
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	adds r4, r0, #0
	adds r6, r4, #0
	adds r6, #0x33
	ldrb r0, [r6]
	lsls r1, r0, #1
	movs r2, #0x38
	adds r2, r2, r4
	mov r8, r2
	adds r0, r2, r1
	ldrh r0, [r0]
	mov sb, r0
	adds r5, r4, #0
	adds r5, #0x4a
	adds r7, r5, r1
	movs r3, #0xf
	ldrh r0, [r7]
	ands r0, r3
	mov sl, r0
	cmp r0, #0
	beq _08098788
	b _080989DC
_08098788:
	ldrh r0, [r4, #0x36]
	cmp r0, #0
	beq _08098794
	cmp r0, #0xff
	beq _08098794
	b _08098890
_08098794:
	ldr r1, _080987D0 @ =gpKeySt
	ldr r0, [r1]
	ldrh r3, [r0, #8]
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r3
	mov r8, r1
	cmp r0, #0
	beq _080987DC
	ldr r0, _080987D4 @ =0x02012466
	ldrh r0, [r0]
	cmp r0, #0
	beq _080987EC
	ldr r1, _080987D8 @ =0x020117E4
	mov r2, sb
	lsls r0, r2, #2
	adds r0, r0, r1
	ldrh r2, [r0, #2]
	mov r3, sb
	lsls r1, r3, #4
	ldrh r0, [r7]
	subs r0, #0x28
	subs r1, r1, r0
	movs r0, #0x80
	bl StartItemHelpBox
	movs r0, #1
	strh r0, [r4, #0x36]
	b _08098B52
	.align 2, 0
_080987D0: .4byte gpKeySt
_080987D4: .4byte 0x02012466
_080987D8: .4byte 0x020117E4
_080987DC:
	movs r0, #1
	ands r0, r3
	cmp r0, #0
	beq _08098860
	ldr r0, _08098804 @ =0x02012466
	ldrh r0, [r0]
	cmp r0, #0
	bne _0809880C
_080987EC:
	ldr r0, _08098808 @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	bge _080987FA
	b _08098B52
_080987FA:
	movs r0, #0xe3
	lsls r0, r0, #2
	bl m4aSongNumStart
	b _08098B52
	.align 2, 0
_08098804: .4byte 0x02012466
_08098808: .4byte gPlaySt
_0809880C:
	ldr r0, _08098834 @ =0x020117E4
	mov r2, sb
	lsls r1, r2, #2
	adds r1, r1, r0
	ldrb r0, [r1]
	cmp r0, #0
	bne _08098838
	lsls r2, r2, #4
	ldrh r0, [r7]
	subs r0, #0x28
	subs r2, r2, r0
	movs r0, #0
	movs r1, #0x80
	movs r3, #2
	bl sub_80A98DC
	adds r0, r4, #0
	movs r1, #7
	b _0809883C
	.align 2, 0
_08098834: .4byte 0x020117E4
_08098838:
	adds r0, r4, #0
	movs r1, #6
_0809883C:
	bl Proc_Goto
	ldr r0, _08098858 @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	bge _0809884E
	b _08098B52
_0809884E:
	ldr r0, _0809885C @ =0x0000038A
	bl m4aSongNumStart
	b _08098B52
	.align 2, 0
_08098858: .4byte gPlaySt
_0809885C: .4byte 0x0000038A
_08098860:
	movs r0, #2
	ands r0, r3
	cmp r0, #0
	beq _080988B0
	adds r0, r4, #0
	movs r1, #8
	bl Proc_Goto
	ldr r0, _08098888 @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08098882
	ldr r0, _0809888C @ =0x0000038B
	bl m4aSongNumStart
_08098882:
	mov r3, sl
	strh r3, [r4, #0x36]
	b _08098B52
	.align 2, 0
_08098888: .4byte gPlaySt
_0809888C: .4byte 0x0000038B
_08098890:
	ldr r2, _080988AC @ =gpKeySt
	ldr r1, [r2]
	movs r0, #0x81
	lsls r0, r0, #1
	ldrh r1, [r1, #8]
	ands r0, r1
	mov r8, r2
	cmp r0, #0
	beq _080988B0
	bl CloseHelpBox
	mov r0, sl
	strh r0, [r4, #0x36]
	b _08098B52
	.align 2, 0
_080988AC: .4byte gpKeySt
_080988B0:
	mov r1, r8
	ldr r2, [r1]
	ldrh r1, [r2, #6]
	movs r0, #0x20
	ands r0, r1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	cmp r5, #0
	beq _080988FC
	movs r0, #0
	bl SetUiSpinningArrowFastMaybe
	ldr r0, _080988F4 @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080988DA
	ldr r0, _080988F8 @ =0x00000387
	bl m4aSongNumStart
_080988DA:
	adds r0, r4, #0
	movs r1, #3
	bl Proc_Goto
	adds r1, r4, #0
	adds r1, #0x32
	movs r0, #0
	strb r0, [r1]
	adds r0, r4, #0
	bl sub_80982D8
	b _08098B52
	.align 2, 0
_080988F4: .4byte gPlaySt
_080988F8: .4byte 0x00000387
_080988FC:
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	beq _0809893C
	movs r0, #1
	bl SetUiSpinningArrowFastMaybe
	ldr r0, _08098934 @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0809891C
	ldr r0, _08098938 @ =0x00000387
	bl m4aSongNumStart
_0809891C:
	adds r0, r4, #0
	movs r1, #4
	bl Proc_Goto
	adds r0, r4, #0
	adds r0, #0x32
	strb r5, [r0]
	adds r0, r4, #0
	bl sub_8098384
	b _08098B52
	.align 2, 0
_08098934: .4byte gPlaySt
_08098938: .4byte 0x00000387
_0809893C:
	movs r0, #0x80
	lsls r0, r0, #2
	ldrh r2, [r2, #4]
	ands r0, r2
	cmp r0, #0
	beq _08098950
	adds r1, r4, #0
	adds r1, #0x31
	movs r0, #8
	b _08098956
_08098950:
	adds r1, r4, #0
	adds r1, #0x31
	movs r0, #4
_08098956:
	strb r0, [r1]
	adds r5, r1, #0
	mov r2, r8
	ldr r1, [r2]
	movs r2, #0x40
	adds r0, r2, #0
	ldrh r3, [r1, #6]
	ands r0, r3
	cmp r0, #0
	bne _08098982
	adds r0, r2, #0
	ldrh r1, [r1, #4]
	ands r0, r1
	adds r7, r4, #0
	adds r7, #0x33
	adds r6, r4, #0
	adds r6, #0x38
	cmp r0, #0
	beq _0809899E
	ldrb r0, [r5]
	cmp r0, #8
	bne _0809899E
_08098982:
	adds r0, r4, #0
	adds r0, #0x33
	ldrb r2, [r0]
	lsls r1, r2, #1
	adds r2, r4, #0
	adds r2, #0x38
	adds r3, r2, r1
	ldrh r1, [r3]
	adds r7, r0, #0
	adds r6, r2, #0
	cmp r1, #0
	beq _0809899E
	subs r0, r1, #1
	strh r0, [r3]
_0809899E:
	mov r3, r8
	ldr r1, [r3]
	movs r2, #0x80
	adds r0, r2, #0
	ldrh r3, [r1, #6]
	ands r0, r3
	cmp r0, #0
	bne _080989BE
	adds r0, r2, #0
	ldrh r1, [r1, #4]
	ands r0, r1
	cmp r0, #0
	beq _08098A3C
	ldrb r5, [r5]
	cmp r5, #8
	bne _08098A3C
_080989BE:
	ldrb r1, [r7]
	lsls r0, r1, #1
	adds r2, r6, r0
	ldrh r1, [r2]
	ldr r0, _080989D8 @ =0x02012466
	ldrh r0, [r0]
	subs r0, #1
	cmp r1, r0
	bge _08098A3C
	adds r0, r1, #1
	strh r0, [r2]
	b _08098A3C
	.align 2, 0
_080989D8: .4byte 0x02012466
_080989DC:
	mov r2, sb
	lsls r0, r2, #4
	ldrh r2, [r7]
	adds r1, r2, #0
	subs r1, #0x28
	subs r0, r0, r1
	cmp r0, #0x37
	bgt _080989FA
	adds r0, r4, #0
	adds r0, #0x31
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r0, r2, r0
	strh r0, [r7]
_080989FA:
	ldrb r3, [r6]
	lsls r2, r3, #1
	mov r1, r8
	adds r0, r1, r2
	ldrh r0, [r0]
	lsls r1, r0, #4
	adds r3, r5, r2
	ldrh r2, [r3]
	adds r0, r2, #0
	subs r0, #0x28
	subs r1, r1, r0
	cmp r1, #0x78
	ble _08098A22
	adds r0, r4, #0
	adds r0, #0x31
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r0, r2, r0
	strh r0, [r3]
_08098A22:
	ldrb r2, [r6]
	lsls r0, r2, #1
	adds r0, r5, r0
	ldrh r2, [r0]
	subs r2, #0x28
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	movs r0, #2
	movs r1, #0
	bl SetBgOffset
	adds r7, r6, #0
	mov r6, r8
_08098A3C:
	ldrb r3, [r7]
	lsls r0, r3, #1
	adds r0, r6, r0
	ldrh r0, [r0]
	cmp sb, r0
	bne _08098A4A
	b _08098B52
_08098A4A:
	ldr r5, _08098AC4 @ =0x020117E4
	lsls r0, r0, #2
	adds r0, r0, r5
	ldrh r0, [r0, #2]
	mov sl, r0
	ldr r0, _08098AC8 @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08098A66
	ldr r0, _08098ACC @ =0x00000386
	bl m4aSongNumStart
_08098A66:
	ldrb r1, [r7]
	lsls r0, r1, #1
	adds r0, r6, r0
	ldrh r0, [r0]
	lsls r1, r0, #2
	adds r1, r1, r5
	mov r2, sb
	lsls r0, r2, #2
	adds r0, r0, r5
	ldrb r1, [r1]
	ldrb r0, [r0]
	cmp r1, r0
	beq _08098A86
	adds r0, r4, #0
	bl sub_8097D1C
_08098A86:
	ldrb r3, [r7]
	lsls r1, r3, #1
	adds r0, r6, r1
	ldrh r5, [r0]
	lsls r3, r5, #4
	adds r2, r4, #0
	adds r2, #0x4a
	adds r1, r2, r1
	ldrh r0, [r1]
	subs r0, #0x28
	subs r1, r3, r0
	mov r8, r2
	cmp r1, #0x37
	bgt _08098AD0
	cmp r5, #0
	beq _08098AD0
	ldrh r0, [r4, #0x36]
	cmp r0, #0
	beq _08098AB6
	adds r1, #0x10
	movs r0, #0x80
	mov r2, sl
	bl StartItemHelpBox
_08098AB6:
	adds r0, r4, #0
	adds r0, #0x31
	movs r1, #0
	ldrsb r1, [r0, r1]
	rsbs r1, r1, #0
	b _08098B08
	.align 2, 0
_08098AC4: .4byte 0x020117E4
_08098AC8: .4byte gPlaySt
_08098ACC: .4byte 0x00000386
_08098AD0:
	ldrb r1, [r7]
	lsls r0, r1, #1
	adds r1, r6, r0
	ldrh r2, [r1]
	lsls r1, r2, #4
	add r0, r8
	ldrh r0, [r0]
	subs r0, #0x28
	subs r1, r1, r0
	cmp r1, #0x78
	ble _08098B14
	ldr r0, _08098B10 @ =0x02012466
	ldrh r0, [r0]
	subs r0, #1
	cmp r2, r0
	beq _08098B14
	ldrh r0, [r4, #0x36]
	cmp r0, #0
	beq _08098B00
	subs r1, #0x10
	movs r0, #0x80
	mov r2, sl
	bl StartItemHelpBox
_08098B00:
	adds r0, r4, #0
	adds r0, #0x31
	movs r1, #0
	ldrsb r1, [r0, r1]
_08098B08:
	adds r0, r4, #0
	bl sub_80984B4
	b _08098B52
	.align 2, 0
_08098B10: .4byte 0x02012466
_08098B14:
	ldrh r0, [r4, #0x36]
	cmp r0, #0
	beq _08098B34
	ldrb r2, [r7]
	lsls r0, r2, #1
	adds r1, r6, r0
	ldrh r1, [r1]
	lsls r1, r1, #4
	add r0, r8
	ldrh r0, [r0]
	subs r0, #0x28
	subs r1, r1, r0
	movs r0, #0x80
	mov r2, sl
	bl StartItemHelpBox
_08098B34:
	ldrb r7, [r7]
	lsls r0, r7, #1
	adds r1, r6, r0
	ldrh r1, [r1]
	lsls r1, r1, #4
	add r0, r8
	ldrh r0, [r0]
	subs r0, #0x28
	subs r1, r1, r0
	movs r3, #0x80
	lsls r3, r3, #4
	movs r0, #0x80
	movs r2, #0xb
	bl ShowSysHandCursor
_08098B52:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_8098B60
sub_8098B60: @ 0x08098B60
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x2c]
	bl GetUnitItemCount
	adds r1, r0, #0
	adds r0, r4, #0
	adds r0, #0x30
	ldrb r7, [r0]
	adds r3, r1, #0
	cmp r3, #5
	bne _08098B7C
	movs r3, #4
	b _08098B84
_08098B7C:
	ldrh r0, [r4, #0x36]
	cmp r0, #0
	beq _08098B84
	subs r3, #1
_08098B84:
	cmp r1, #0
	beq _08098C04
	ldr r1, _08098BA8 @ =gpKeySt
	ldr r5, [r1]
	movs r6, #0x40
	adds r0, r6, #0
	ldrh r2, [r5, #6]
	ands r0, r2
	adds r2, r4, #0
	adds r2, #0x30
	cmp r0, #0
	beq _08098BB8
	ldrb r0, [r2]
	cmp r0, #0
	beq _08098BAC
	subs r0, #1
	strb r0, [r2]
	b _08098BB8
	.align 2, 0
_08098BA8: .4byte gpKeySt
_08098BAC:
	adds r0, r6, #0
	ldrh r5, [r5, #8]
	ands r0, r5
	cmp r0, #0
	beq _08098BB8
	strb r3, [r2]
_08098BB8:
	ldr r1, [r1]
	movs r4, #0x80
	adds r0, r4, #0
	ldrh r5, [r1, #6]
	ands r0, r5
	cmp r0, #0
	beq _08098BDE
	ldrb r0, [r2]
	cmp r0, r3
	bge _08098BD0
	adds r0, #1
	b _08098BDC
_08098BD0:
	adds r0, r4, #0
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _08098BDE
	movs r0, #0
_08098BDC:
	strb r0, [r2]
_08098BDE:
	ldrb r2, [r2]
	cmp r7, r2
	beq _08098C04
	ldr r0, _08098BFC @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08098BF6
	ldr r0, _08098C00 @ =0x00000386
	bl m4aSongNumStart
_08098BF6:
	movs r0, #1
	b _08098C06
	.align 2, 0
_08098BFC: .4byte gPlaySt
_08098C00: .4byte 0x00000386
_08098C04:
	movs r0, #0
_08098C06:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	thumb_func_start sub_8098C0C
sub_8098C0C: @ 0x08098C0C
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x2c]
	bl GetUnitItemCount
	adds r1, r0, #0
	cmp r1, #5
	bne _08098C28
	adds r1, r4, #0
	adds r1, #0x30
	movs r0, #4
	strb r0, [r1]
	adds r0, r1, #0
	b _08098C2E
_08098C28:
	adds r0, r4, #0
	adds r0, #0x30
	strb r1, [r0]
_08098C2E:
	ldrb r0, [r0]
	lsls r1, r0, #4
	adds r1, #0x48
	movs r3, #0x80
	lsls r3, r3, #4
	movs r0, #0x10
	movs r2, #0xb
	bl ShowSysHandCursor
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_8098C48
sub_8098C48: @ 0x08098C48
	push {r4, r5, r6, r7, lr}
	adds r6, r0, #0
	adds r7, r6, #0
	adds r7, #0x33
	ldrb r1, [r7]
	lsls r0, r1, #1
	adds r2, r6, #0
	adds r2, #0x38
	adds r2, r2, r0
	ldr r1, [r6, #0x2c]
	adds r0, r6, #0
	adds r0, #0x30
	ldrb r0, [r0]
	lsls r0, r0, #1
	adds r1, #0x1e
	adds r1, r1, r0
	ldrh r5, [r1]
	ldr r0, _08098CE8 @ =0x020117E4
	ldrh r2, [r2]
	lsls r4, r2, #2
	adds r4, r4, r0
	ldrh r0, [r4, #2]
	strh r0, [r1]
	ldr r0, [r6, #0x2c]
	bl UnitRemoveInvalidItems
	strh r5, [r4, #2]
	bl sub_8091B48
	cmp r5, #0
	bne _08098C90
	ldr r0, [r6, #0x2c]
	ldrb r1, [r7]
	movs r2, #3
	bl sub_8091A74
_08098C90:
	adds r0, r6, #0
	bl sub_8098430
	ldr r0, _08098CEC @ =gBg0Tm + 0x244
	ldr r4, _08098CF0 @ =0x02012B78
	ldr r2, [r6, #0x2c]
	adds r1, r4, #0
	movs r3, #0
	bl sub_8094AC0
	adds r4, #0x28
	ldr r1, _08098CF4 @ =gBg2Tm + 0x1e
	ldrb r7, [r7]
	lsls r2, r7, #1
	adds r0, r6, #0
	adds r0, #0x4a
	adds r0, r0, r2
	ldrh r0, [r0]
	lsrs r2, r0, #4
	ldr r3, [r6, #0x2c]
	adds r0, r4, #0
	bl sub_80964A0
	ldr r0, _08098CF8 @ =sub_8097D1C
	movs r1, #1
	adds r2, r6, #0
	bl StartParallelFiniteLoop
	movs r0, #4
	bl EnableBgSync
	ldr r0, _08098CFC @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08098CE0
	ldr r0, _08098D00 @ =0x0000038A
	bl m4aSongNumStart
_08098CE0:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08098CE8: .4byte 0x020117E4
_08098CEC: .4byte gBg0Tm + 0x244
_08098CF0: .4byte 0x02012B78
_08098CF4: .4byte gBg2Tm + 0x1e
_08098CF8: .4byte sub_8097D1C
_08098CFC: .4byte gPlaySt
_08098D00: .4byte 0x0000038A

	thumb_func_start sub_8098D04
sub_8098D04: @ 0x08098D04
	push {r4, r5, lr}
	adds r5, r0, #0
	ldrh r0, [r5, #0x36]
	cmp r0, #1
	bne _08098D2C
	ldr r0, _08098D28 @ =gpKeySt
	ldr r1, [r0]
	movs r0, #0x81
	lsls r0, r0, #1
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _08098DF4
	bl CloseHelpBox
	movs r0, #0
	strh r0, [r5, #0x36]
	b _08098E36
	.align 2, 0
_08098D28: .4byte gpKeySt
_08098D2C:
	ldr r0, _08098D60 @ =gpKeySt
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r1
	cmp r0, #0
	beq _08098D64
	ldr r0, [r5, #0x2c]
	adds r1, r5, #0
	adds r1, #0x30
	ldrb r3, [r1]
	lsls r1, r3, #1
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r2, [r0]
	cmp r2, #0
	beq _08098E36
	lsls r1, r3, #4
	adds r1, #0x48
	movs r0, #0x10
	bl StartItemHelpBox
	movs r0, #1
	strh r0, [r5, #0x36]
	b _08098E36
	.align 2, 0
_08098D60: .4byte gpKeySt
_08098D64:
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _08098DC4
	ldr r0, [r5, #0x2c]
	adds r1, r5, #0
	adds r1, #0x30
	ldrb r1, [r1]
	ldr r4, _08098DA8 @ =0x020117E4
	adds r2, r5, #0
	adds r2, #0x33
	ldrb r2, [r2]
	lsls r3, r2, #1
	adds r2, r5, #0
	adds r2, #0x38
	adds r2, r2, r3
	ldrh r2, [r2]
	lsls r2, r2, #2
	adds r2, r2, r4
	ldrh r2, [r2, #2]
	bl sub_80917D4
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08098DB0
	movs r1, #1
	rsbs r1, r1, #0
	ldr r2, _08098DAC @ =0x000003B3
	adds r0, r1, #0
	adds r3, r5, #0
	bl sub_8091664
	b _08098E36
	.align 2, 0
_08098DA8: .4byte 0x020117E4
_08098DAC: .4byte 0x000003B3
_08098DB0:
	movs r0, #0
	bl sub_80A998C
	adds r0, r5, #0
	bl Proc_Break
	adds r0, r5, #0
	bl sub_8098C48
	b _08098E36
_08098DC4:
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _08098DF4
	movs r0, #0
	bl sub_80A998C
	adds r0, r5, #0
	bl Proc_Break
	ldr r0, _08098DEC @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08098E36
	ldr r0, _08098DF0 @ =0x0000038B
	bl m4aSongNumStart
	b _08098E36
	.align 2, 0
_08098DEC: .4byte gPlaySt
_08098DF0: .4byte 0x0000038B
_08098DF4:
	adds r0, r5, #0
	bl sub_8098B60
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08098E36
	adds r4, r5, #0
	adds r4, #0x30
	ldrb r0, [r4]
	lsls r1, r0, #4
	adds r1, #0x48
	movs r3, #0x80
	lsls r3, r3, #4
	movs r0, #0x10
	movs r2, #0xb
	bl ShowSysHandCursor
	ldrh r0, [r5, #0x36]
	cmp r0, #1
	bne _08098E36
	ldr r0, [r5, #0x2c]
	ldrb r3, [r4]
	lsls r1, r3, #1
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r2, [r0]
	cmp r2, #0
	beq _08098E36
	lsls r1, r3, #4
	adds r1, #0x48
	movs r0, #0x10
	bl StartItemHelpBox
_08098E36:
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start sub_8098E3C
sub_8098E3C: @ 0x08098E3C
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r0, #0x33
	ldrb r0, [r0]
	lsls r1, r0, #1
	adds r0, r5, #0
	adds r0, #0x38
	adds r0, r0, r1
	ldrh r0, [r0]
	lsls r4, r0, #2
	ldr r0, _08098E70 @ =0x020117E4
	adds r4, r4, r0
	ldr r6, [r5, #0x2c]
	ldrb r0, [r4]
	bl GetUnitFromCharId
	adds r1, r0, #0
	ldrb r2, [r4, #1]
	adds r0, r6, #0
	adds r3, r5, #0
	bl sub_80951FC
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08098E70: .4byte 0x020117E4

	thumb_func_start sub_8098E74
sub_8098E74: @ 0x08098E74
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08098E88 @ =gUnk_08D8D318
	bl Proc_StartBlocking
	str r4, [r0, #0x2c]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08098E88: .4byte gUnk_08D8D318

	thumb_func_start sub_8098E8C
sub_8098E8C: @ 0x08098E8C
	push {r4, r5, r6, lr}
	sub sp, #4
	ldr r6, _08098EB8 @ =0x0000DF80
	movs r5, #0x30
	movs r4, #3
_08098E96:
	str r6, [sp]
	movs r0, #4
	adds r1, r5, #0
	movs r2, #0x10
	ldr r3, _08098EBC @ =Sprite_32x16
	bl PutSpriteExt
	adds r6, #4
	adds r5, #0x20
	subs r4, #1
	cmp r4, #0
	bge _08098E96
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08098EB8: .4byte 0x0000DF80
_08098EBC: .4byte Sprite_32x16

	thumb_func_start sub_8098EC0
sub_8098EC0: @ 0x08098EC0
	push {r4, lr}
	sub sp, #4
	adds r4, r0, #0
	ldr r0, _08098EEC @ =sub_8098E8C
	bl StartParallelWorker
	movs r0, #0xe0
	lsls r0, r0, #7
	ldr r1, _08098EF0 @ =gUnk_08D8D410
	lsls r4, r4, #2
	adds r4, r4, r1
	ldr r2, [r4]
	movs r1, #0
	str r1, [sp]
	movs r1, #0xd
	movs r3, #1
	bl NewSysboxText
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08098EEC: .4byte sub_8098E8C
_08098EF0: .4byte gUnk_08D8D410

	thumb_func_start sub_8098EF4
sub_8098EF4: @ 0x08098EF4
	ldr r0, _08098F20 @ =0x04000006
	ldrh r0, [r0]
	adds r0, #1
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	cmp r2, #0xa0
	bls _08098F04
	movs r2, #0
_08098F04:
	cmp r2, #0xc
	bne _08098F0E
	ldr r1, _08098F24 @ =0x04000050
	movs r0, #0xc8
	strh r0, [r1]
_08098F0E:
	cmp r2, #0x34
	beq _08098F16
	cmp r2, #0
	bne _08098F1E
_08098F16:
	ldr r1, _08098F24 @ =0x04000050
	ldr r2, _08098F28 @ =0x00000242
	adds r0, r2, #0
	strh r0, [r1]
_08098F1E:
	bx lr
	.align 2, 0
_08098F20: .4byte 0x04000006
_08098F24: .4byte 0x04000050
_08098F28: .4byte 0x00000242

	thumb_func_start sub_8098F2C
sub_8098F2C: @ 0x08098F2C
	movs r2, #0
	movs r1, #0
	strh r1, [r0, #0x34]
	movs r1, #0xff
	strh r1, [r0, #0x32]
	adds r0, #0x30
	strb r2, [r0]
	bx lr

	thumb_func_start sub_8098F3C
sub_8098F3C: @ 0x08098F3C
	push {r4, r5, lr}
	ldr r5, _08098FBC @ =0x02012B50
	ldr r1, _08098FC0 @ =0x06011000
	adds r0, r5, #0
	movs r2, #0xb
	bl InitSpriteTextFont
	ldr r0, _08098FC4 @ =Pal_Text
	movs r1, #0xd8
	lsls r1, r1, #2
	movs r2, #0x20
	bl ApplyPaletteExt
	adds r4, r5, #0
	adds r4, #0x90
	adds r0, r4, #0
	bl InitSpriteText
	adds r0, r5, #0
	bl SetTextFont
	movs r0, #0
	bl SetTextFontGlyphs
	adds r0, r4, #0
	movs r1, #0
	bl SpriteText_DrawBackgroundExt
	ldr r3, _08098FC8 @ =gUnk_0842D150
	adds r0, r4, #0
	movs r1, #0
	movs r2, #0
	bl Text_InsertDrawString
	ldr r3, _08098FCC @ =gUnk_0842D158
	adds r0, r4, #0
	movs r1, #0x20
	movs r2, #0
	bl Text_InsertDrawString
	ldr r3, _08098FD0 @ =gUnk_0842D160
	adds r0, r4, #0
	movs r1, #0x40
	movs r2, #0
	bl Text_InsertDrawString
	ldr r3, _08098FD4 @ =gUnk_0842D170
	adds r0, r4, #0
	movs r1, #0x80
	movs r2, #3
	bl Text_InsertDrawString
	ldr r3, _08098FD8 @ =gUnk_0842D17C
	adds r0, r4, #0
	movs r1, #0xc0
	movs r2, #3
	bl Text_InsertDrawString
	movs r0, #0
	bl SetTextFont
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08098FBC: .4byte 0x02012B50
_08098FC0: .4byte 0x06011000
_08098FC4: .4byte Pal_Text
_08098FC8: .4byte gUnk_0842D150
_08098FCC: .4byte gUnk_0842D158
_08098FD0: .4byte gUnk_0842D160
_08098FD4: .4byte gUnk_0842D170
_08098FD8: .4byte gUnk_0842D17C

	thumb_func_start sub_8098FDC
sub_8098FDC: @ 0x08098FDC
	push {r4, lr}
	sub sp, #4
	movs r0, #0xaa
	lsls r0, r0, #8
	str r0, [sp]
	movs r0, #0xa0
	movs r1, #0x68
	movs r2, #8
	movs r3, #4
	bl sub_80935C4
	ldr r4, _0809903C @ =Sprite_32x16
	ldr r0, _08099040 @ =0x0000B088
	str r0, [sp]
	movs r0, #4
	movs r1, #0xb0
	movs r2, #0x6c
	adds r3, r4, #0
	bl PutSpriteExt
	ldr r0, _08099044 @ =0x0000B08C
	str r0, [sp]
	movs r0, #4
	movs r1, #0xd0
	movs r2, #0x6c
	adds r3, r4, #0
	bl PutSpriteExt
	ldr r0, _08099048 @ =0x0000B080
	str r0, [sp]
	movs r0, #4
	movs r1, #0xa8
	movs r2, #0x7c
	adds r3, r4, #0
	bl PutSpriteExt
	ldr r0, _0809904C @ =0x0000B084
	str r0, [sp]
	movs r0, #4
	movs r1, #0xc8
	movs r2, #0x7c
	adds r3, r4, #0
	bl PutSpriteExt
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0809903C: .4byte Sprite_32x16
_08099040: .4byte 0x0000B088
_08099044: .4byte 0x0000B08C
_08099048: .4byte 0x0000B080
_0809904C: .4byte 0x0000B084

	thumb_func_start sub_8099050
sub_8099050: @ 0x08099050
	push {r4, lr}
	sub sp, #4
	ldr r4, _08099090 @ =Sprite_32x16
	ldr r0, _08099094 @ =0x0000B090
	str r0, [sp]
	movs r0, #4
	movs r1, #0x8c
	movs r2, #0x58
	adds r3, r4, #0
	bl PutSpriteExt
	ldr r3, _08099098 @ =Sprite_8x16
	ldr r0, _0809909C @ =0x0000B094
	str r0, [sp]
	movs r0, #4
	movs r1, #0xac
	movs r2, #0x58
	bl PutSpriteExt
	ldr r0, _080990A0 @ =0x0000B098
	str r0, [sp]
	movs r0, #4
	movs r1, #0x90
	movs r2, #0x38
	adds r3, r4, #0
	bl PutSpriteExt
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08099090: .4byte Sprite_32x16
_08099094: .4byte 0x0000B090
_08099098: .4byte Sprite_8x16
_0809909C: .4byte 0x0000B094
_080990A0: .4byte 0x0000B098

	thumb_func_start sub_80990A4
sub_80990A4: @ 0x080990A4
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	ldr r6, _080990FC @ =gBg0Tm + 0x2e8
	adds r0, r6, #0
	movs r1, #0xa
	movs r2, #1
	movs r3, #0
	bl TmFillRect_thm
	cmp r4, #0
	beq _08099116
	adds r0, r4, #0
	bl sub_80B2BB4
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	cmp r5, #0
	beq _080990D6
	adds r0, r4, #0
	bl GetItemAttributes
	movs r1, #0x10
	ands r1, r0
	cmp r1, #0
	beq _08099100
_080990D6:
	adds r0, r6, #0
	adds r0, #0xa
	movs r1, #1
	movs r2, #0x14
	bl PutSpecialChar
	adds r0, r6, #0
	adds r0, #0xc
	movs r1, #1
	movs r2, #0x14
	bl PutSpecialChar
	adds r0, r6, #0
	adds r0, #0xe
	movs r1, #1
	movs r2, #0x14
	bl PutSpecialChar
	b _0809910C
	.align 2, 0
_080990FC: .4byte gBg0Tm + 0x2e8
_08099100:
	adds r0, r6, #0
	adds r0, #0xc
	movs r1, #2
	adds r2, r5, #0
	bl PutNumber
_0809910C:
	ldr r0, _08099124 @ =gBg0Tm + 0x2f6
	movs r1, #3
	movs r2, #0x1e
	bl PutSpecialChar
_08099116:
	movs r0, #1
	bl EnableBgSync
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08099124: .4byte gBg0Tm + 0x2f6

	thumb_func_start sub_8099128
sub_8099128: @ 0x08099128
	push {r4, r5, lr}
	ldr r4, _08099164 @ =gBg0Tm + 0x1e8
	adds r0, r4, #0
	movs r1, #0xa
	movs r2, #1
	movs r3, #0
	bl TmFillRect_thm
	adds r5, r4, #0
	adds r5, #0xe
	bl GetGold
	adds r2, r0, #0
	adds r0, r5, #0
	movs r1, #2
	bl PutNumber
	adds r4, #0x10
	adds r0, r4, #0
	movs r1, #3
	movs r2, #0x1e
	bl PutSpecialChar
	movs r0, #1
	bl EnableBgSync
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08099164: .4byte gBg0Tm + 0x1e8

	thumb_func_start sub_8099168
sub_8099168: @ 0x08099168
	push {r4, lr}
	sub sp, #8
	movs r0, #0
	bl SetTextFont
	ldr r4, _080991B8 @ =gBg0Tm + 0x68
	adds r0, r4, #0
	movs r1, #0xc
	movs r2, #1
	movs r3, #0
	bl TmFillRect_thm
	ldr r0, _080991BC @ =0x02012B68
	adds r1, r4, #0
	adds r1, #0xda
	movs r2, #0
	str r2, [sp]
	ldr r2, _080991C0 @ =gUnk_0842D184
	str r2, [sp, #4]
	movs r2, #0
	movs r3, #2
	bl PutDrawText
	subs r4, #0x26
	movs r2, #0x9c
	lsls r2, r2, #2
	movs r0, #1
	str r0, [sp]
	movs r0, #0x4a
	adds r1, r4, #0
	movs r3, #2
	bl PutFaceChibi
	movs r0, #1
	bl EnableBgSync
	add sp, #8
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080991B8: .4byte gBg0Tm + 0x68
_080991BC: .4byte 0x02012B68
_080991C0: .4byte gUnk_0842D184

	thumb_func_start sub_80991C4
sub_80991C4: @ 0x080991C4
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	mov sb, r0
	ldr r7, _08099410 @ =gDispIo
	movs r0, #8
	rsbs r0, r0, #0
	ldrb r1, [r7]
	ands r0, r1
	strb r0, [r7]
	movs r0, #0
	bl InitBgs
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
	movs r1, #4
	rsbs r1, r1, #0
	adds r0, r1, #0
	ldrb r2, [r7, #0xc]
	ands r0, r2
	strb r0, [r7, #0xc]
	adds r0, r1, #0
	ldrb r3, [r7, #0x10]
	ands r0, r3
	movs r6, #2
	mov r8, r6
	mov r2, r8
	orrs r0, r2
	strb r0, [r7, #0x10]
	ldrb r3, [r7, #0x14]
	ands r1, r3
	strb r1, [r7, #0x14]
	movs r0, #3
	ldrb r6, [r7, #0x18]
	orrs r0, r6
	strb r0, [r7, #0x18]
	bl InitFaces
	bl ResetText
	bl InitIcons
	bl UnpackUiWindowFrameGraphics
	bl ApplySystemObjectsGraphics
	movs r0, #0
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	movs r0, #1
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	movs r0, #2
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	ldr r0, _08099414 @ =0x06012800
	movs r1, #1
	rsbs r1, r1, #0
	bl LoadHelpBoxGfx
	movs r0, #4
	bl ApplyIconPalettes
	bl PrepRestartMuralBackground
	movs r0, #0xa0
	lsls r0, r0, #7
	movs r1, #5
	bl sub_809228C
	movs r0, #0x80
	lsls r0, r0, #7
	movs r1, #0xa
	bl sub_80922DC
	ldr r0, _08099418 @ =gBg1Tm
	ldr r1, _0809941C @ =gUnk_0842A558
	movs r2, #0xa5
	lsls r2, r2, #7
	bl TmApplyTsa_thm
	movs r0, #7
	bl EnableBgSync
	mov r1, sb
	ldr r0, [r1, #0x2c]
	bl GetUnitPortraitId
	adds r1, r0, #0
	ldr r0, _08099420 @ =0x00000503
	str r0, [sp]
	movs r0, #0
	movs r2, #0x44
	movs r3, #0x4a
	bl StartBmFace
	mov r0, sb
	bl sub_80A98C8
	mov r0, sb
	bl ResetSysHandCursor
	movs r0, #0xc0
	lsls r0, r0, #3
	movs r1, #1
	bl DisplaySysHandCursorTextShadow
	movs r5, #0x20
	ldrb r0, [r7, #1]
	orrs r0, r5
	movs r1, #0x41
	rsbs r1, r1, #0
	ands r0, r1
	movs r1, #0x7f
	ands r0, r1
	strb r0, [r7, #1]
	adds r1, r7, #0
	adds r1, #0x2d
	movs r0, #0x80
	strb r0, [r1]
	adds r1, #4
	movs r0, #0x28
	strb r0, [r1]
	subs r1, #5
	movs r0, #0xe0
	strb r0, [r1]
	adds r1, #4
	movs r0, #0x98
	strb r0, [r1]
	movs r2, #0x34
	adds r2, r2, r7
	mov sl, r2
	movs r0, #1
	ldrb r1, [r2]
	orrs r1, r0
	mov r3, r8
	orrs r1, r3
	movs r2, #4
	orrs r1, r2
	movs r4, #8
	orrs r1, r4
	movs r3, #0x10
	orrs r1, r3
	movs r6, #0x36
	adds r6, r6, r7
	mov ip, r6
	ldrb r2, [r6]
	orrs r0, r2
	mov r6, r8
	orrs r0, r6
	movs r2, #5
	rsbs r2, r2, #0
	ands r0, r2
	orrs r0, r4
	orrs r0, r3
	orrs r1, r5
	mov r2, sl
	strb r1, [r2]
	orrs r0, r5
	mov r3, ip
	strb r0, [r3]
	adds r1, r7, #0
	adds r1, #0x3c
	movs r0, #0x3f
	ldrb r6, [r1]
	ands r0, r6
	strb r0, [r1]
	adds r0, r7, #0
	adds r0, #0x44
	movs r1, #8
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	mov r0, sb
	bl StartGreenText
	movs r0, #0xc8
	movs r1, #0x90
	mov r2, sb
	bl StartHelpPromptSprite
	ldr r4, _08099424 @ =0x02012B68
	adds r0, r4, #0
	movs r1, #4
	bl InitText
	adds r0, r4, #0
	adds r0, #8
	movs r1, #2
	bl InitText
	bl sub_8098F3C
	adds r4, #0x10
	movs r5, #4
_08099380:
	adds r0, r4, #0
	movs r1, #7
	bl InitText
	adds r4, #8
	subs r5, #1
	cmp r5, #0
	bge _08099380
	movs r0, #0
	bl SetOnHBlankA
	ldr r0, _08099428 @ =sub_8098EF4
	bl SetOnHBlankA
	movs r0, #4
	bl EnableBgSync
	ldr r0, _0809942C @ =gBg0Tm + 0x244
	ldr r1, _08099430 @ =0x02012B78
	mov r3, sb
	ldr r2, [r3, #0x2c]
	movs r3, #0
	bl sub_8094AC0
	bl sub_8099168
	ldr r0, _08099434 @ =sub_8099050
	mov r1, sb
	bl StartParallelWorker
	mov r6, sb
	ldr r0, [r6, #0x2c]
	mov r1, sb
	adds r1, #0x30
	ldrb r1, [r1]
	lsls r1, r1, #1
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r0, [r0]
	bl sub_80990A4
	bl sub_8099128
	movs r1, #0xe0
	lsls r1, r1, #4
	movs r3, #0xc0
	lsls r3, r3, #4
	movs r0, #0
	str r0, [sp]
	str r6, [sp, #4]
	movs r0, #0xd
	movs r2, #0xf
	bl StartSysBrownBox
	movs r0, #0
	movs r1, #1
	bl SetSysBrownBoxWidth
	movs r0, #0
	movs r1, #0x88
	movs r2, #0x36
	movs r3, #2
	bl EnableSysBrownBox
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08099410: .4byte gDispIo
_08099414: .4byte 0x06012800
_08099418: .4byte gBg1Tm
_0809941C: .4byte gUnk_0842A558
_08099420: .4byte 0x00000503
_08099424: .4byte 0x02012B68
_08099428: .4byte sub_8098EF4
_0809942C: .4byte gBg0Tm + 0x244
_08099430: .4byte 0x02012B78
_08099434: .4byte sub_8099050

	thumb_func_start sub_8099438
sub_8099438: @ 0x08099438
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	ldr r6, _08099468 @ =gpKeySt
	ldr r0, [r6]
	ldrh r1, [r0, #6]
	movs r7, #0x40
	adds r0, r7, #0
	ands r0, r1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	cmp r5, #0
	beq _0809947E
	ldr r0, [r4, #0x2c]
	bl GetUnitItemCount
	adds r3, r0, #0
	adds r2, r4, #0
	adds r2, #0x30
	ldrb r0, [r2]
	cmp r0, #0
	beq _0809946C
	subs r0, #1
	strb r0, [r2]
	b _080994AE
	.align 2, 0
_08099468: .4byte gpKeySt
_0809946C:
	ldr r1, [r6]
	adds r0, r7, #0
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _080994CC
	subs r0, r3, #1
	strb r0, [r2]
	b _080994AE
_0809947E:
	movs r7, #0x80
	adds r0, r7, #0
	ands r0, r1
	cmp r0, #0
	beq _080994CC
	ldr r0, [r4, #0x2c]
	bl GetUnitItemCount
	adds r2, r4, #0
	adds r2, #0x30
	ldrb r1, [r2]
	subs r0, #1
	cmp r1, r0
	bge _080994A0
	adds r0, r1, #1
	strb r0, [r2]
	b _080994AE
_080994A0:
	ldr r1, [r6]
	adds r0, r7, #0
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _080994CC
	strb r5, [r2]
_080994AE:
	ldr r0, _080994C4 @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080994C0
	ldr r0, _080994C8 @ =0x00000386
	bl m4aSongNumStart
_080994C0:
	movs r0, #1
	b _080994CE
	.align 2, 0
_080994C4: .4byte gPlaySt
_080994C8: .4byte 0x00000386
_080994CC:
	movs r0, #0
_080994CE:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	thumb_func_start sub_80994D4
sub_80994D4: @ 0x080994D4
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r0, _08099528 @ =gBg0Tm + 0x244
	ldr r1, _0809952C @ =0x02012B78
	ldr r2, [r4, #0x2c]
	movs r3, #0
	bl sub_8094AC0
	ldr r0, [r4, #0x2c]
	adds r5, r4, #0
	adds r5, #0x30
	ldrb r2, [r5]
	lsls r1, r2, #1
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r0, [r0]
	bl sub_80990A4
	movs r0, #0
	bl sub_80A998C
	ldr r0, _08099530 @ =sub_8098FDC
	bl GetParallelWorker
	bl Proc_End
	ldrb r5, [r5]
	lsls r1, r5, #4
	adds r1, #0x48
	movs r3, #0x80
	lsls r3, r3, #3
	movs r0, #0x10
	movs r2, #0xb
	bl ShowSysHandCursor
	movs r0, #0
	adds r1, r4, #0
	bl sub_8098EC0
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08099528: .4byte gBg0Tm + 0x244
_0809952C: .4byte 0x02012B78
_08099530: .4byte sub_8098FDC

	thumb_func_start sub_8099534
sub_8099534: @ 0x08099534
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x34]
	cmp r0, #1
	bne _0809955C
	ldr r0, _08099558 @ =gpKeySt
	ldr r1, [r0]
	movs r0, #0x81
	lsls r0, r0, #1
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _08099630
	bl CloseHelpBox
	movs r0, #0
	strh r0, [r4, #0x34]
	b _08099682
	.align 2, 0
_08099558: .4byte gpKeySt
_0809955C:
	ldr r0, _08099594 @ =gpKeySt
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r1
	cmp r0, #0
	beq _08099598
	ldr r0, [r4, #0x2c]
	adds r1, r4, #0
	adds r1, #0x30
	ldrb r3, [r1]
	lsls r1, r3, #1
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r2, [r0]
	cmp r2, #0
	bne _08099582
	b _08099682
_08099582:
	lsls r1, r3, #4
	adds r1, #0x48
	movs r0, #0x10
	bl StartItemHelpBox
	movs r0, #1
	strh r0, [r4, #0x34]
	b _08099682
	.align 2, 0
_08099594: .4byte gpKeySt
_08099598:
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _08099604
	ldr r0, [r4, #0x2c]
	adds r6, r4, #0
	adds r6, #0x30
	ldrb r2, [r6]
	lsls r1, r2, #1
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r5, [r0]
	adds r0, r5, #0
	bl sub_80B2BB4
	lsls r0, r0, #0x10
	cmp r0, #0
	beq _080995CA
	adds r0, r5, #0
	bl GetItemAttributes
	movs r1, #0x10
	ands r1, r0
	cmp r1, #0
	beq _080995E0
_080995CA:
	ldrb r6, [r6]
	lsls r1, r6, #4
	adds r1, #0x48
	ldr r2, _080995DC @ =0x00000704
	movs r0, #0x10
	adds r3, r4, #0
	bl sub_8091664
	b _08099682
	.align 2, 0
_080995DC: .4byte 0x00000704
_080995E0:
	adds r0, r4, #0
	movs r1, #2
	bl Proc_Goto
	ldr r0, _080995FC @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08099682
	ldr r0, _08099600 @ =0x0000038A
	bl m4aSongNumStart
	b _08099682
	.align 2, 0
_080995FC: .4byte gPlaySt
_08099600: .4byte 0x0000038A
_08099604:
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _08099630
	adds r0, r4, #0
	movs r1, #3
	bl Proc_Goto
	ldr r0, _08099628 @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08099682
	ldr r0, _0809962C @ =0x0000038B
	bl m4aSongNumStart
	b _08099682
	.align 2, 0
_08099628: .4byte gPlaySt
_0809962C: .4byte 0x0000038B
_08099630:
	adds r0, r4, #0
	bl sub_8099438
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08099682
	adds r5, r4, #0
	adds r5, #0x30
	ldrb r0, [r5]
	lsls r1, r0, #4
	adds r1, #0x48
	movs r3, #0x80
	lsls r3, r3, #3
	movs r0, #0x10
	movs r2, #0xb
	bl ShowSysHandCursor
	ldr r0, [r4, #0x2c]
	ldrb r2, [r5]
	lsls r1, r2, #1
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r0, [r0]
	bl sub_80990A4
	ldrh r0, [r4, #0x34]
	cmp r0, #1
	bne _08099682
	ldr r0, [r4, #0x2c]
	ldrb r3, [r5]
	lsls r1, r3, #1
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r2, [r0]
	cmp r2, #0
	beq _08099682
	lsls r1, r3, #4
	adds r1, #0x48
	movs r0, #0x10
	bl StartItemHelpBox
_08099682:
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	thumb_func_start sub_8099688
sub_8099688: @ 0x08099688
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r4, #0
	adds r5, #0x31
	movs r0, #1
	strb r0, [r5]
	ldr r0, _080996D0 @ =sub_8098FDC
	adds r1, r4, #0
	bl StartParallelWorker
	adds r0, r4, #0
	adds r0, #0x30
	ldrb r0, [r0]
	lsls r2, r0, #4
	adds r2, #0x48
	movs r0, #0
	movs r1, #0x10
	movs r3, #2
	bl sub_80A98DC
	ldrb r5, [r5]
	lsls r0, r5, #5
	adds r0, #0xa4
	movs r3, #0x80
	lsls r3, r3, #3
	movs r1, #0x7c
	movs r2, #0
	bl ShowSysHandCursor
	movs r0, #1
	adds r1, r4, #0
	bl sub_8098EC0
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080996D0: .4byte sub_8098FDC

	thumb_func_start sub_80996D4
sub_80996D4: @ 0x080996D4
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x2c]
	adds r5, r4, #0
	adds r5, #0x30
	ldrb r2, [r5]
	lsls r1, r2, #1
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r0, [r0]
	bl sub_80B2BB4
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl AddGold
	ldr r0, [r4, #0x2c]
	ldrb r2, [r5]
	lsls r1, r2, #1
	adds r0, #0x1e
	adds r0, r0, r1
	movs r1, #0
	strh r1, [r0]
	ldr r0, [r4, #0x2c]
	bl UnitRemoveInvalidItems
	ldr r0, _08099740 @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0809971A
	movs r0, #0xb9
	bl m4aSongNumStart
_0809971A:
	bl sub_8099128
	ldr r0, [r4, #0x2c]
	bl GetUnitItemCount
	cmp r0, #0
	bne _0809974C
	ldr r0, _08099744 @ =gBg0Tm + 0x244
	ldr r1, _08099748 @ =0x02012B78
	ldr r2, [r4, #0x2c]
	movs r3, #0
	bl sub_8094AC0
	adds r0, r4, #0
	movs r1, #3
	bl Proc_Goto
	b _0809975E
	.align 2, 0
_08099740: .4byte gPlaySt
_08099744: .4byte gBg0Tm + 0x244
_08099748: .4byte 0x02012B78
_0809974C:
	ldrb r1, [r5]
	cmp r0, r1
	bne _08099756
	subs r0, #1
	strb r0, [r5]
_08099756:
	adds r0, r4, #0
	movs r1, #1
	bl Proc_Goto
_0809975E:
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start sub_8099764
sub_8099764: @ 0x08099764
	push {r4, r5, r6, lr}
	adds r2, r0, #0
	adds r4, r2, #0
	adds r4, #0x31
	ldrb r5, [r4]
	ldr r6, _08099788 @ =gpKeySt
	ldr r1, [r6]
	ldrh r3, [r1, #8]
	movs r0, #1
	ands r0, r3
	cmp r0, #0
	beq _0809978C
	cmp r5, #0
	bne _08099798
	adds r0, r2, #0
	bl sub_80996D4
	b _08099802
	.align 2, 0
_08099788: .4byte gpKeySt
_0809978C:
	movs r0, #2
	ands r0, r3
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	cmp r3, #0
	beq _080997BC
_08099798:
	adds r0, r2, #0
	movs r1, #1
	bl Proc_Goto
	ldr r0, _080997B4 @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08099802
	ldr r0, _080997B8 @ =0x0000038B
	bl m4aSongNumStart
	b _08099802
	.align 2, 0
_080997B4: .4byte gPlaySt
_080997B8: .4byte 0x0000038B
_080997BC:
	movs r0, #0x20
	ldrh r1, [r1, #6]
	ands r0, r1
	cmp r0, #0
	beq _080997C8
	strb r3, [r4]
_080997C8:
	ldr r1, [r6]
	movs r0, #0x10
	ldrh r1, [r1, #6]
	ands r0, r1
	cmp r0, #0
	beq _080997D8
	movs r0, #1
	strb r0, [r4]
_080997D8:
	ldrb r0, [r4]
	cmp r5, r0
	beq _08099802
	ldr r0, _08099808 @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080997F0
	ldr r0, _0809980C @ =0x00000387
	bl m4aSongNumStart
_080997F0:
	ldrb r4, [r4]
	lsls r0, r4, #5
	adds r0, #0xa4
	movs r3, #0x80
	lsls r3, r3, #3
	movs r1, #0x7c
	movs r2, #0
	bl ShowSysHandCursor
_08099802:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08099808: .4byte gPlaySt
_0809980C: .4byte 0x00000387

	thumb_func_start sub_8099810
sub_8099810: @ 0x08099810
	push {lr}
	bl EndMuralBackground_
	movs r0, #0
	bl EndFaceById
	movs r0, #0
	bl SetOnHBlankA
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_8099828
sub_8099828: @ 0x08099828
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0809983C @ =gUnk_08D8D418
	bl Proc_StartBlocking
	str r4, [r0, #0x2c]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0809983C: .4byte gUnk_08D8D418

	thumb_func_start sub_8099840
sub_8099840: @ 0x08099840
	push {lr}
	sub sp, #0x10
	ldr r0, [r0, #0x2c]
	str r0, [sp]
	ldr r0, _08099870 @ =0x06011000
	str r0, [sp, #4]
	movs r0, #1
	rsbs r0, r0, #0
	str r0, [sp, #8]
	movs r0, #0
	str r0, [sp, #0xc]
	movs r0, #0xa
	movs r1, #7
	movs r2, #0x11
	movs r3, #4
	bl sub_8088584
	movs r0, #0x7c
	bl SetCgTextFlags
	add sp, #0x10
	pop {r0}
	bx r0
	.align 2, 0
_08099870: .4byte 0x06011000

	thumb_func_start nullsub_78
nullsub_78: @ 0x08099874
	bx lr
	.align 2, 0

	thumb_func_start nullsub_79
nullsub_79: @ 0x08099878
	bx lr
	.align 2, 0

	thumb_func_start sub_809987C
sub_809987C: @ 0x0809987C
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r0, #0x30
	movs r4, #1
	strb r4, [r0]
	bl sub_8099CB4
	adds r1, r5, #0
	adds r1, #0x31
	strb r0, [r1]
	bl sub_8099CF0
	adds r1, r5, #0
	adds r1, #0x32
	strb r0, [r1]
	adds r0, r5, #0
	adds r0, #0x33
	strb r4, [r0]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_80998A8
sub_80998A8: @ 0x080998A8
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #8
	mov sb, r0
	ldr r6, _08099968 @ =0x020129A8
	movs r0, #0
	bl SetTextFontGlyphs
	movs r0, #0
	bl SetTextFont
	ldr r0, _0809996C @ =gBg0Tm + 0x280
	movs r1, #0x1f
	movs r2, #0xa
	movs r3, #0
	bl TmFillRect_thm
	movs r4, #0
_080998D0:
	adds r0, r6, #0
	bl ClearText
	ldr r1, _08099970 @ =gUnk_08D8D60C
	lsls r0, r4, #2
	adds r0, r0, r1
	ldr r0, [r0]
	bl DecodeMsg
	adds r3, r0, #0
	adds r5, r6, #0
	adds r6, #8
	asrs r2, r4, #1
	lsls r2, r2, #6
	movs r0, #0xa2
	lsls r0, r0, #1
	adds r2, r2, r0
	movs r1, #1
	ands r1, r4
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #1
	adds r2, r2, r0
	lsls r2, r2, #1
	ldr r0, _08099974 @ =gBg0Tm
	mov r8, r0
	adds r1, r2, r0
	movs r2, #0
	mov r0, sb
	adds r0, #0x30
	adds r0, r0, r4
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne _0809991A
	movs r2, #1
_0809991A:
	movs r7, #0
	str r7, [sp]
	str r3, [sp, #4]
	adds r0, r5, #0
	movs r3, #0
	bl PutDrawText
	adds r4, #1
	cmp r4, #3
	ble _080998D0
	ldr r0, _08099968 @ =0x020129A8
	adds r6, r0, #0
	adds r6, #0xe8
	adds r0, r6, #0
	bl ClearText
	ldr r0, _08099978 @ =gUnk_08D8D5F8
	ldr r0, [r0, #0x10]
	bl DecodeMsg
	mov r1, r8
	adds r1, #0x2c
	str r7, [sp]
	str r0, [sp, #4]
	adds r0, r6, #0
	movs r2, #0
	movs r3, #0
	bl PutDrawText
	movs r0, #1
	bl EnableBgSync
	add sp, #8
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08099968: .4byte 0x020129A8
_0809996C: .4byte gBg0Tm + 0x280
_08099970: .4byte gUnk_08D8D60C
_08099974: .4byte gBg0Tm
_08099978: .4byte gUnk_08D8D5F8

	thumb_func_start sub_809997C
sub_809997C: @ 0x0809997C
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r3, r5, #0
	adds r3, #0x29
	ldrb r4, [r3]
	ldr r2, _08099A0C @ =gpKeySt
	ldr r1, [r2]
	movs r0, #0x20
	ldrh r1, [r1, #6]
	ands r0, r1
	cmp r0, #0
	beq _080999A0
	movs r0, #1
	ands r0, r4
	cmp r0, #0
	beq _080999A0
	subs r0, r4, #1
	strb r0, [r3]
_080999A0:
	ldr r1, [r2]
	movs r0, #0x10
	ldrh r1, [r1, #6]
	ands r0, r1
	adds r3, r5, #0
	adds r3, #0x29
	cmp r0, #0
	beq _080999BE
	ldrb r1, [r3]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	bne _080999BE
	adds r0, r1, #1
	strb r0, [r3]
_080999BE:
	ldr r1, [r2]
	movs r0, #0x80
	ldrh r1, [r1, #6]
	ands r0, r1
	cmp r0, #0
	beq _080999D6
	ldrb r1, [r3]
	lsrs r0, r1, #1
	cmp r0, #0
	bne _080999D6
	adds r0, r1, #2
	strb r0, [r3]
_080999D6:
	ldr r1, [r2]
	movs r0, #0x40
	ldrh r1, [r1, #6]
	ands r0, r1
	cmp r0, #0
	beq _080999EE
	ldrb r1, [r3]
	lsrs r0, r1, #1
	cmp r0, #0
	beq _080999EE
	subs r0, r1, #2
	strb r0, [r3]
_080999EE:
	ldrb r3, [r3]
	cmp r4, r3
	beq _08099A18
	ldr r0, _08099A10 @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08099A06
	ldr r0, _08099A14 @ =0x00000385
	bl m4aSongNumStart
_08099A06:
	movs r0, #1
	b _08099A1A
	.align 2, 0
_08099A0C: .4byte gpKeySt
_08099A10: .4byte gPlaySt
_08099A14: .4byte 0x00000385
_08099A18:
	movs r0, #0
_08099A1A:
	pop {r4, r5}
	pop {r1}
	bx r1

	thumb_func_start sub_8099A20
sub_8099A20: @ 0x08099A20
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	ldr r0, _08099A54 @ =gpKeySt
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r6, #1
	adds r0, r6, #0
	ands r0, r1
	cmp r0, #0
	beq _08099AB4
	adds r0, r4, #0
	adds r0, #0x29
	ldrb r1, [r0]
	adds r0, #7
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #1
	bne _08099A98
	cmp r1, #1
	beq _08099A74
	cmp r1, #1
	bgt _08099A58
	cmp r1, #0
	beq _08099A62
	b _08099A98
	.align 2, 0
_08099A54: .4byte gpKeySt
_08099A58:
	cmp r1, #2
	beq _08099A68
	cmp r1, #3
	beq _08099A6E
	b _08099A98
_08099A62:
	adds r0, r4, #0
	movs r1, #2
	b _08099A78
_08099A68:
	adds r0, r4, #0
	movs r1, #3
	b _08099A78
_08099A6E:
	adds r0, r4, #0
	movs r1, #4
	b _08099A78
_08099A74:
	adds r0, r4, #0
	movs r1, #5
_08099A78:
	bl Proc_Goto
	ldr r0, _08099A90 @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08099B20
	ldr r0, _08099A94 @ =0x0000038A
	bl m4aSongNumStart
	b _08099B20
	.align 2, 0
_08099A90: .4byte gPlaySt
_08099A94: .4byte 0x0000038A
_08099A98:
	ldr r0, _08099AB0 @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08099B20
	movs r0, #0xe3
	lsls r0, r0, #2
	bl m4aSongNumStart
	b _08099B20
	.align 2, 0
_08099AB0: .4byte gPlaySt
_08099AB4:
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _08099AE0
	adds r0, r4, #0
	movs r1, #6
	bl Proc_Goto
	ldr r0, _08099AD8 @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08099B20
	ldr r0, _08099ADC @ =0x0000038B
	bl m4aSongNumStart
	b _08099B20
	.align 2, 0
_08099AD8: .4byte gPlaySt
_08099ADC: .4byte 0x0000038B
_08099AE0:
	adds r0, r4, #0
	bl sub_809997C
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08099B20
	adds r5, r4, #0
	adds r5, #0x29
	ldrb r1, [r5]
	adds r2, r6, #0
	ands r2, r1
	lsls r0, r2, #3
	subs r0, r0, r2
	lsls r0, r0, #4
	adds r0, #0x1c
	lsrs r1, r1, #1
	lsls r1, r1, #4
	adds r1, #0x50
	movs r3, #0x80
	lsls r3, r3, #4
	movs r2, #8
	bl ShowSysHandCursor
	ldr r1, _08099B28 @ =gUnk_08D8D620
	ldrb r5, [r5]
	lsls r0, r5, #2
	adds r0, r0, r1
	ldr r0, [r0]
	str r0, [r4, #0x2c]
	adds r0, r4, #0
	bl sub_8099840
_08099B20:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08099B28: .4byte gUnk_08D8D620

	thumb_func_start sub_8099B2C
sub_8099B2C: @ 0x08099B2C
	push {r4, lr}
	adds r4, r0, #0
	bl EndCgText
	adds r0, r4, #0
	bl EndAllProcChildren
	bl EndMuralBackground_
	movs r0, #0
	bl EndFaceById
	movs r0, #0
	bl SetOnHBlankA
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_8099B50
sub_8099B50: @ 0x08099B50
	push {lr}
	adds r1, r0, #0
	adds r1, #0x29
	ldrb r1, [r1]
	cmp r1, #1
	beq _08099B88
	cmp r1, #1
	bgt _08099B66
	cmp r1, #0
	beq _08099B70
	b _08099B8E
_08099B66:
	cmp r1, #2
	beq _08099B78
	cmp r1, #3
	beq _08099B80
	b _08099B8E
_08099B70:
	movs r1, #2
	bl Proc_Goto
	b _08099B8E
_08099B78:
	movs r1, #3
	bl Proc_Goto
	b _08099B8E
_08099B80:
	movs r1, #4
	bl Proc_Goto
	b _08099B8E
_08099B88:
	movs r1, #5
	bl Proc_Goto
_08099B8E:
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_8099B94
sub_8099B94: @ 0x08099B94
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08099BAC @ =gUnk_08D8D538
	bl Proc_StartBlocking
	adds r1, r0, #0
	adds r0, #0x29
	strb r4, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08099BAC: .4byte gUnk_08D8D538

	thumb_func_start sub_8099BB0
sub_8099BB0: @ 0x08099BB0
	push {lr}
	adds r1, r0, #0
	cmp r1, #1
	beq _08099BDC
	cmp r1, #1
	bgt _08099BC2
	cmp r1, #0
	beq _08099BE8
	b _08099BF0
_08099BC2:
	cmp r1, #2
	beq _08099BCC
	cmp r1, #3
	beq _08099BD2
	b _08099BF0
_08099BCC:
	bl sub_8099CB4
	b _08099BD6
_08099BD2:
	bl sub_8099CF0
_08099BD6:
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	b _08099BF2
_08099BDC:
	ldr r0, _08099BEC @ =gPlaySt
	adds r0, #0x2b
	ldrb r0, [r0]
	ands r1, r0
	cmp r1, #0
	beq _08099BF0
_08099BE8:
	movs r0, #1
	b _08099BF2
	.align 2, 0
_08099BEC: .4byte gPlaySt
_08099BF0:
	movs r0, #0
_08099BF2:
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_8099BF8
sub_8099BF8: @ 0x08099BF8
	push {lr}
	ldr r0, _08099C10 @ =gPlaySt
	ldrb r1, [r0, #0x1b]
	cmp r1, #3
	bne _08099C14
	ldrb r0, [r0, #0xe]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl GetChapterInfo
	adds r0, #0x78
	b _08099C20
	.align 2, 0
_08099C10: .4byte gPlaySt
_08099C14:
	ldrb r0, [r0, #0xe]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl GetChapterInfo
	adds r0, #0x7a
_08099C20:
	ldrh r0, [r0]
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_8099C28
sub_8099C28: @ 0x08099C28
	push {lr}
	ldr r0, _08099C40 @ =gPlaySt
	ldrb r0, [r0, #0xe]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl GetChapterInfo
	adds r0, #0x76
	ldrh r0, [r0]
	pop {r1}
	bx r1
	.align 2, 0
_08099C40: .4byte gPlaySt

	thumb_func_start sub_8099C44
sub_8099C44: @ 0x08099C44
	push {lr}
	ldr r0, _08099C5C @ =gPlaySt
	ldrb r0, [r0, #0xe]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl GetChapterInfo
	adds r0, #0x7c
	ldrh r0, [r0]
	pop {r1}
	bx r1
	.align 2, 0
_08099C5C: .4byte gPlaySt

	thumb_func_start sub_8099C60
sub_8099C60: @ 0x08099C60
	push {lr}
	ldr r0, _08099C78 @ =gPlaySt
	ldrb r0, [r0, #0xe]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl GetChapterInfo
	adds r0, #0x7f
	ldrb r0, [r0]
	pop {r1}
	bx r1
	.align 2, 0
_08099C78: .4byte gPlaySt

	thumb_func_start sub_8099C7C
sub_8099C7C: @ 0x08099C7C
	push {lr}
	ldr r0, _08099C94 @ =gPlaySt
	ldrb r0, [r0, #0xe]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl GetChapterInfo
	adds r0, #0x7e
	ldrb r0, [r0]
	pop {r1}
	bx r1
	.align 2, 0
_08099C94: .4byte gPlaySt

	thumb_func_start sub_8099C98
sub_8099C98: @ 0x08099C98
	push {lr}
	bl sub_8099BF8
	cmp r0, #0
	beq _08099CAE
	bl sub_8099C28
	cmp r0, #0
	bne _08099CAE
	movs r0, #1
	b _08099CB0
_08099CAE:
	movs r0, #0
_08099CB0:
	pop {r1}
	bx r1

	thumb_func_start sub_8099CB4
sub_8099CB4: @ 0x08099CB4
	push {lr}
	ldr r1, _08099CD0 @ =gPlaySt
	movs r0, #0x40
	ldrb r1, [r1, #0x14]
	ands r0, r1
	cmp r0, #0
	bne _08099CCA
	bl sub_8099BF8
	cmp r0, #0
	bne _08099CD4
_08099CCA:
	movs r0, #0
	b _08099CD6
	.align 2, 0
_08099CD0: .4byte gPlaySt
_08099CD4:
	movs r0, #1
_08099CD6:
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_8099CDC
sub_8099CDC: @ 0x08099CDC
	push {lr}
	bl sub_8099C7C
	cmp r0, #0x41
	beq _08099CEA
	movs r0, #0
	b _08099CEC
_08099CEA:
	movs r0, #1
_08099CEC:
	pop {r1}
	bx r1

	thumb_func_start sub_8099CF0
sub_8099CF0: @ 0x08099CF0
	push {lr}
	bl sub_8099CDC
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_8099D00
sub_8099D00: @ 0x08099D00
	ldr r0, _08099D10 @ =gPlaySt
	ldrb r0, [r0, #0xe]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0x12
	bgt _08099D14
	movs r0, #0
	b _08099D16
	.align 2, 0
_08099D10: .4byte gPlaySt
_08099D14:
	movs r0, #1
_08099D16:
	bx lr

	thumb_func_start sub_8099D18
sub_8099D18: @ 0x08099D18
	push {r4, lr}
	ldr r4, _08099DBC @ =gDispIo
	movs r0, #8
	rsbs r0, r0, #0
	ldrb r1, [r4]
	ands r0, r1
	strb r0, [r4]
	movs r0, #0
	bl InitBgs
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
	movs r1, #4
	rsbs r1, r1, #0
	adds r0, r1, #0
	ldrb r2, [r4, #0xc]
	ands r0, r2
	movs r2, #1
	orrs r0, r2
	strb r0, [r4, #0xc]
	movs r2, #3
	ldrb r0, [r4, #0x10]
	orrs r0, r2
	strb r0, [r4, #0x10]
	ldrb r0, [r4, #0x14]
	ands r1, r0
	movs r0, #2
	orrs r1, r0
	strb r1, [r4, #0x14]
	ldrb r1, [r4, #0x18]
	orrs r2, r1
	strb r2, [r4, #0x18]
	bl InitFaces
	bl ResetText
	bl InitIcons
	bl UnpackUiWindowFrameGraphics
	bl ApplySystemObjectsGraphics
	movs r0, #0
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	movs r0, #1
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	movs r0, #2
	movs r1, #0
	movs r2, #4
	bl SetBgOffset
	movs r0, #4
	bl ApplyIconPalettes
	bl PrepRestartMuralBackground
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08099DBC: .4byte gDispIo

	thumb_func_start sub_8099DC0
sub_8099DC0: @ 0x08099DC0
	adds r0, #0x4c
	movs r1, #0
	strh r1, [r0]
	bx lr

	thumb_func_start sub_8099DC8
sub_8099DC8: @ 0x08099DC8
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r4, r5, #0
	adds r4, #0x4c
	ldrh r0, [r4]
	adds r0, #1
	strh r0, [r4]
	movs r0, #3
	ldrh r1, [r4]
	ands r0, r1
	cmp r0, #0
	bne _08099E0E
	movs r0, #0
	ldrsh r4, [r4, r0]
	cmp r4, #0
	bge _08099DEA
	adds r4, #3
_08099DEA:
	asrs r4, r4, #2
	lsls r0, r4, #5
	ldr r1, _08099E14 @ =gUnk_0842B4BC
	adds r0, r0, r1
	ldr r1, [r5, #0x58]
	lsls r1, r1, #5
	ldr r2, _08099E18 @ =gPal + 0x200
	adds r1, r1, r2
	movs r2, #8
	bl CpuFastSet
	bl EnablePalSync
	cmp r4, #5
	bne _08099E0E
	adds r0, r5, #0
	bl Proc_Break
_08099E0E:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08099E14: .4byte gUnk_0842B4BC
_08099E18: .4byte gPal + 0x200

	thumb_func_start sub_8099E1C
sub_8099E1C: @ 0x08099E1C
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08099E30 @ =gUnk_08D8D688
	bl Proc_Start
	str r4, [r0, #0x58]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08099E30: .4byte gUnk_08D8D688

	thumb_func_start sub_8099E34
sub_8099E34: @ 0x08099E34
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	mov sb, r0
	ldr r1, [r0, #0x2c]
	asrs r0, r1, #3
	cmp r0, #5
	bgt _08099E5C
	adds r0, r1, #2
	mov r1, sb
	str r0, [r1, #0x2c]
	asrs r0, r0, #3
	cmp r0, #6
	bne _08099E5C
	movs r0, #0xf
	bl sub_8099E1C
_08099E5C:
	mov r6, sb
	adds r6, #0x34
	movs r2, #9
	str r2, [sp, #8]
	movs r3, #4
	mov r8, r3
_08099E68:
	ldrb r0, [r6]
	cmp r0, #0xff
	beq _08099EBE
	movs r5, #0
	ldrb r7, [r6]
	cmp r5, r7
	bgt _08099EBE
	mov r1, sb
	ldr r0, [r1, #0x2c]
	asrs r0, r0, #3
	cmp r5, r0
	bge _08099EBE
	movs r4, #0x50
	ldr r2, _08099F5C @ =gUnk_08D8D674
	mov sl, r2
_08099E86:
	lsls r1, r5, #9
	adds r1, r4, r1
	mov r3, sl
	adds r3, #4
	mov sl, r3
	subs r3, #4
	ldr r3, [r3]
	mov ip, r3
	ldr r0, _08099F60 @ =0x0000F380
	str r0, [sp]
	movs r0, #4
	ldr r7, [sp, #8]
	movs r3, #0x80
	lsls r3, r3, #1
	adds r2, r7, r3
	mov r3, ip
	bl PutSpriteExt
	adds r4, #0xf
	adds r5, #1
	ldrb r7, [r6]
	cmp r5, r7
	bgt _08099EBE
	mov r1, sb
	ldr r0, [r1, #0x2c]
	asrs r0, r0, #3
	cmp r5, r0
	blt _08099E86
_08099EBE:
	adds r6, #1
	ldr r2, [sp, #8]
	adds r2, #0x10
	str r2, [sp, #8]
	movs r3, #1
	rsbs r3, r3, #0
	add r8, r3
	mov r7, r8
	cmp r7, #0
	bge _08099E68
	movs r0, #0
	mov r8, r0
	movs r7, #0x80
	lsls r7, r7, #1
	ldr r1, _08099F64 @ =gSinLut
	mov sl, r1
_08099EDE:
	mov r2, r8
	adds r2, #1
	lsls r1, r2, #3
	mov r3, sb
	ldr r0, [r3, #0x2c]
	subs r0, r0, r1
	lsls r4, r0, #5
	str r2, [sp, #4]
	cmp r4, r7
	ble _08099EF6
	movs r4, #0x80
	lsls r4, r4, #1
_08099EF6:
	cmp r4, #0x20
	ble _08099F6C
	ldr r1, _08099F68 @ =gCosLut
	movs r2, #0
	ldrsh r0, [r1, r2]
	lsls r0, r0, #4
	adds r1, r4, #0
	bl Div
	adds r6, r0, #0
	lsls r6, r6, #0x10
	asrs r6, r6, #0x10
	mov r3, sl
	movs r1, #0
	ldrsh r0, [r3, r1]
	rsbs r0, r0, #0
	lsls r0, r0, #4
	adds r1, r7, #0
	bl Div
	adds r5, r0, #0
	lsls r5, r5, #0x10
	asrs r5, r5, #0x10
	mov r2, sl
	movs r3, #0
	ldrsh r0, [r2, r3]
	lsls r0, r0, #4
	adds r1, r4, #0
	bl Div
	adds r4, r0, #0
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	ldr r1, _08099F68 @ =gCosLut
	movs r2, #0
	ldrsh r0, [r1, r2]
	lsls r0, r0, #4
	adds r1, r7, #0
	bl Div
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	str r0, [sp]
	mov r0, r8
	adds r1, r6, #0
	adds r2, r5, #0
	adds r3, r4, #0
	bl SetObjAffine
	b _08099FCA
	.align 2, 0
_08099F5C: .4byte gUnk_08D8D674
_08099F60: .4byte 0x0000F380
_08099F64: .4byte gSinLut
_08099F68: .4byte gCosLut
_08099F6C:
	ldr r3, _08099FE4 @ =gCosLut
	movs r1, #0
	ldrsh r0, [r3, r1]
	lsls r0, r0, #4
	movs r1, #0x20
	bl Div
	adds r6, r0, #0
	lsls r6, r6, #0x10
	asrs r6, r6, #0x10
	mov r2, sl
	movs r3, #0
	ldrsh r0, [r2, r3]
	rsbs r0, r0, #0
	lsls r0, r0, #4
	adds r1, r7, #0
	bl Div
	adds r5, r0, #0
	lsls r5, r5, #0x10
	asrs r5, r5, #0x10
	mov r1, sl
	movs r2, #0
	ldrsh r0, [r1, r2]
	lsls r0, r0, #4
	movs r1, #0x20
	bl Div
	adds r4, r0, #0
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	ldr r3, _08099FE4 @ =gCosLut
	movs r1, #0
	ldrsh r0, [r3, r1]
	lsls r0, r0, #4
	adds r1, r7, #0
	bl Div
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	str r0, [sp]
	mov r0, r8
	adds r1, r6, #0
	adds r2, r5, #0
	adds r3, r4, #0
	bl SetObjAffine
_08099FCA:
	ldr r2, [sp, #4]
	mov r8, r2
	cmp r2, #4
	ble _08099EDE
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08099FE4: .4byte gCosLut

	thumb_func_start sub_8099FE8
sub_8099FE8: @ 0x08099FE8
	push {r4, r5, r6, r7, lr}
	sub sp, #8
	ldr r4, _0809A038 @ =0x020129A8
	movs r0, #0
	bl SetTextFontGlyphs
	movs r0, #0
	bl SetTextFont
	movs r6, #0
	movs r5, #0x80
	ldr r7, _0809A03C @ =gUnk_08D8D634
_0809A000:
	adds r0, r4, #0
	bl ClearText
	ldm r7!, {r0}
	bl DecodeMsg
	adds r3, r4, #0
	adds r4, #8
	ldr r1, _0809A040 @ =gBg2Tm + 0x8
	adds r1, r5, r1
	movs r2, #0
	str r2, [sp]
	str r0, [sp, #4]
	adds r0, r3, #0
	movs r3, #0
	bl PutDrawText
	adds r5, #0x80
	adds r6, #1
	cmp r6, #4
	ble _0809A000
	movs r0, #4
	bl EnableBgSync
	add sp, #8
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0809A038: .4byte 0x020129A8
_0809A03C: .4byte gUnk_08D8D634
_0809A040: .4byte gBg2Tm + 0x8

	thumb_func_start sub_809A044
sub_809A044: @ 0x0809A044
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	adds r7, r0, #0
	bl sub_80B7100
	adds r5, r7, #0
	adds r5, #0x34
	movs r6, #0
	strb r0, [r5]
	bl sub_80B71F8
	movs r1, #0x35
	adds r1, r1, r7
	mov sl, r1
	strb r0, [r1]
	bl sub_80B735C
	movs r2, #0x36
	adds r2, r2, r7
	mov sb, r2
	strb r0, [r2]
	bl sub_80B7230
	movs r3, #0x37
	adds r3, r3, r7
	mov r8, r3
	strb r0, [r3]
	bl sub_80B7328
	adds r4, r7, #0
	adds r4, #0x38
	strb r0, [r4]
	ldrb r0, [r5]
	mov r5, sl
	ldrb r1, [r5]
	mov r3, sb
	ldrb r2, [r3]
	mov r5, r8
	ldrb r3, [r5]
	ldrb r4, [r4]
	str r4, [sp]
	bl sub_80B73FC
	adds r1, r7, #0
	adds r1, #0x39
	strb r0, [r1]
	str r6, [r7, #0x2c]
	ldr r0, _0809A0D8 @ =gUnk_0842B374
	ldr r1, _0809A0DC @ =0x06017000
	bl Decompress
	ldr r0, _0809A0E0 @ =gUnk_0842B4BC
	movs r1, #0xf8
	lsls r1, r1, #2
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r0, _0809A0E4 @ =sub_8099E34
	adds r1, r7, #0
	bl StartParallelWorker
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0809A0D8: .4byte gUnk_0842B374
_0809A0DC: .4byte 0x06017000
_0809A0E0: .4byte gUnk_0842B4BC
_0809A0E4: .4byte sub_8099E34

	thumb_func_start sub_809A0E8
sub_809A0E8: @ 0x0809A0E8
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r4, r0, #0
	bl sub_8099D18
	movs r0, #0xa0
	lsls r0, r0, #7
	movs r1, #5
	bl sub_809228C
	ldr r0, _0809A1E4 @ =gBg1Tm
	ldr r1, _0809A1E8 @ =gUnk_0842B57C
	movs r2, #0xa5
	lsls r2, r2, #7
	bl TmApplyTsa_thm
	movs r0, #7
	bl EnableBgSync
	adds r0, r4, #0
	bl ResetSysHandCursor
	movs r0, #0xc0
	lsls r0, r0, #3
	movs r1, #1
	bl DisplaySysHandCursorTextShadow
	ldr r0, _0809A1EC @ =gDispIo
	mov ip, r0
	movs r0, #0x21
	rsbs r0, r0, #0
	mov r1, ip
	ldrb r1, [r1, #1]
	ands r0, r1
	movs r1, #0x41
	rsbs r1, r1, #0
	ands r0, r1
	movs r1, #0x7f
	ands r0, r1
	mov r2, ip
	strb r0, [r2, #1]
	mov r1, ip
	adds r1, #0x2d
	movs r0, #0x80
	strb r0, [r1]
	adds r1, #4
	movs r0, #0x28
	strb r0, [r1]
	subs r1, #5
	movs r0, #0xe0
	strb r0, [r1]
	adds r1, #4
	movs r0, #0x98
	strb r0, [r1]
	mov r6, ip
	adds r6, #0x34
	movs r0, #1
	ldrb r1, [r6]
	orrs r1, r0
	movs r5, #2
	orrs r1, r5
	movs r2, #4
	orrs r1, r2
	movs r4, #8
	orrs r1, r4
	movs r3, #0x10
	orrs r1, r3
	mov r7, ip
	adds r7, #0x36
	ldrb r2, [r7]
	orrs r0, r2
	orrs r0, r5
	movs r2, #5
	rsbs r2, r2, #0
	ands r0, r2
	orrs r0, r4
	orrs r0, r3
	movs r2, #0x20
	orrs r1, r2
	strb r1, [r6]
	orrs r0, r2
	strb r0, [r7]
	mov r1, ip
	adds r1, #0x3c
	movs r0, #0x3f
	ldrb r2, [r1]
	ands r0, r2
	strb r0, [r1]
	mov r0, ip
	adds r0, #0x44
	movs r1, #8
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	ldr r5, _0809A1F0 @ =0x020129A8
	movs r4, #5
_0809A1AC:
	adds r0, r5, #0
	movs r1, #8
	bl InitText
	adds r5, #8
	subs r4, #1
	cmp r4, #0
	bge _0809A1AC
	ldr r0, _0809A1F4 @ =0x02012A90
	movs r1, #8
	bl InitText
	bl sub_8099FE8
	ldr r0, _0809A1F8 @ =gPlaySt
	ldrb r0, [r0, #0x1b]
	cmp r0, #3
	bne _0809A1FC
	movs r0, #0
	str r0, [sp]
	movs r0, #0x29
	movs r1, #0xd8
	movs r2, #0x58
	movs r3, #0x82
	bl sub_8008DA8
	b _0809A20C
	.align 2, 0
_0809A1E4: .4byte gBg1Tm
_0809A1E8: .4byte gUnk_0842B57C
_0809A1EC: .4byte gDispIo
_0809A1F0: .4byte 0x020129A8
_0809A1F4: .4byte 0x02012A90
_0809A1F8: .4byte gPlaySt
_0809A1FC:
	movs r0, #0
	str r0, [sp]
	movs r0, #0x32
	movs r1, #0xd8
	movs r2, #0x58
	movs r3, #0x82
	bl sub_8008DA8
_0809A20C:
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_809A214
sub_809A214: @ 0x0809A214
	adds r2, r0, #0
	ldr r3, _0809A234 @ =gPlaySt
	adds r1, r3, #0
	adds r1, #0x2b
	movs r0, #1
	ldrb r1, [r1]
	ands r0, r1
	cmp r0, #0
	beq _0809A248
	ldrb r3, [r3, #0x1b]
	cmp r3, #3
	bne _0809A23C
	adds r1, r2, #0
	adds r1, #0x39
	ldr r0, _0809A238 @ =0x00000F73
	b _0809A262
	.align 2, 0
_0809A234: .4byte gPlaySt
_0809A238: .4byte 0x00000F73
_0809A23C:
	adds r1, r2, #0
	adds r1, #0x39
	ldr r0, _0809A244 @ =0x00000F67
	b _0809A262
	.align 2, 0
_0809A244: .4byte 0x00000F67
_0809A248:
	ldrb r3, [r3, #0x1b]
	cmp r3, #3
	bne _0809A25C
	adds r1, r2, #0
	adds r1, #0x39
	ldr r0, _0809A258 @ =0x00000F79
	b _0809A262
	.align 2, 0
_0809A258: .4byte 0x00000F79
_0809A25C:
	adds r1, r2, #0
	adds r1, #0x39
	ldr r0, _0809A26C @ =0x00000F6D
_0809A262:
	ldrb r1, [r1]
	subs r0, r0, r1
	str r0, [r2, #0x30]
	bx lr
	.align 2, 0
_0809A26C: .4byte 0x00000F6D

	thumb_func_start sub_809A270
sub_809A270: @ 0x0809A270
	push {r4, lr}
	adds r4, r0, #0
	bl EndCgText
	adds r0, r4, #0
	bl EndAllProcChildren
	bl EndMuralBackground_
	movs r0, #0
	bl EndFaceById
	movs r0, #0
	bl SetOnHBlankA
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_809A294
sub_809A294: @ 0x0809A294
	push {r4, lr}
	adds r4, r0, #0
	bl sub_80893F4
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0809A2AA
	adds r0, r4, #0
	bl Proc_Break
	b _0809A2D2
_0809A2AA:
	ldr r0, _0809A2D8 @ =gpKeySt
	ldr r1, [r0]
	movs r0, #8
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _0809A2D2
	adds r0, r4, #0
	movs r1, #0
	bl Proc_Goto
	ldr r0, _0809A2DC @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0809A2D2
	ldr r0, _0809A2E0 @ =0x0000038B
	bl m4aSongNumStart
_0809A2D2:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0809A2D8: .4byte gpKeySt
_0809A2DC: .4byte gPlaySt
_0809A2E0: .4byte 0x0000038B

	thumb_func_start sub_809A2E4
sub_809A2E4: @ 0x0809A2E4
	push {r4, lr}
	sub sp, #0x10
	adds r4, r0, #0
	movs r0, #0x28
	movs r1, #0
	movs r2, #1
	bl InitTalk
	ldr r0, [r4, #0x30]
	str r0, [sp]
	ldr r0, _0809A320 @ =0x06011000
	str r0, [sp, #4]
	movs r0, #0xa
	str r0, [sp, #8]
	movs r0, #0
	str r0, [sp, #0xc]
	movs r0, #0x16
	movs r1, #0x13
	movs r2, #0x12
	movs r3, #4
	bl sub_8088584
	movs r0, #0x4e
	bl SetCgTextFlags
	add sp, #0x10
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0809A320: .4byte 0x06011000

	thumb_func_start sub_809A324
sub_809A324: @ 0x0809A324
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	adds r7, r0, #0
	adds r0, #0x3b
	ldrb r0, [r0]
	cmp r0, #0
	beq _0809A3E6
	movs r0, #0
	mov r8, r0
	movs r1, #0x34
	adds r1, r1, r7
	mov sb, r1
	adds r2, r7, #0
	adds r2, #0x3e
	str r2, [sp, #4]
_0809A34A:
	mov r3, sb
	add r3, r8
	ldrb r0, [r3]
	movs r4, #1
	add r4, r8
	mov sl, r4
	cmp r0, #0xff
	beq _0809A3AC
	adds r0, r7, #0
	adds r0, #0x52
	movs r1, #0
	ldrsh r0, [r0, r1]
	adds r2, r0, #0
	adds r2, #0x34
	ldr r0, _0809A3F8 @ =0x000001FF
	ands r2, r0
	adds r0, r7, #0
	adds r0, #0x54
	movs r4, #0
	ldrsh r1, [r0, r4]
	mov r4, r8
	lsls r0, r4, #4
	adds r0, #0x19
	adds r6, r1, r0
	movs r0, #0xff
	ands r6, r0
	movs r5, #0
	ldrb r3, [r3]
	cmp r5, r3
	bgt _0809A3AC
	adds r4, r2, #0
_0809A388:
	lsls r0, r5, #2
	ldr r1, _0809A3FC @ =gUnk_08D8D674
	adds r0, r0, r1
	ldr r3, [r0]
	ldr r0, _0809A400 @ =0x0000F380
	str r0, [sp]
	movs r0, #0xd
	adds r1, r4, #0
	adds r2, r6, #0
	bl PutSpriteExt
	adds r4, #0xa
	adds r5, #1
	mov r0, sb
	add r0, r8
	ldrb r0, [r0]
	cmp r5, r0
	ble _0809A388
_0809A3AC:
	mov r8, sl
	mov r0, r8
	cmp r0, #4
	ble _0809A34A
	ldr r1, [sp, #4]
	ldrb r0, [r1]
	cmp r0, #0
	beq _0809A3E6
	adds r0, r7, #0
	adds r0, #0x52
	movs r2, #0
	ldrsh r1, [r0, r2]
	adds r1, #0xc0
	ldr r0, _0809A3F8 @ =0x000001FF
	ands r1, r0
	adds r0, r7, #0
	adds r0, #0x54
	movs r3, #0
	ldrsh r2, [r0, r3]
	adds r2, #0x1c
	movs r0, #0xff
	ands r2, r0
	ldr r0, _0809A3FC @ =gUnk_08D8D674
	ldr r3, [r0]
	ldr r0, _0809A400 @ =0x0000F380
	str r0, [sp]
	movs r0, #0xd
	bl PutSpriteExt
_0809A3E6:
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0809A3F8: .4byte 0x000001FF
_0809A3FC: .4byte gUnk_08D8D674
_0809A400: .4byte 0x0000F380

	thumb_func_start sub_809A404
sub_809A404: @ 0x0809A404
	push {r4, r5, r6, lr}
	sub sp, #0x10
	adds r4, r0, #0
	movs r2, #0
	mov r1, sp
	ldr r0, _0809A428 @ =gUnk_0842D18C
	ldm r0!, {r3, r5, r6}
	stm r1!, {r3, r5, r6}
	ldr r0, [r0]
	str r0, [r1]
	adds r0, r4, #0
	adds r0, #0x3d
	ldrb r0, [r0]
	cmp r0, #0
	beq _0809A42C
	movs r2, #1
	b _0809A44C
	.align 2, 0
_0809A428: .4byte gUnk_0842D18C
_0809A42C:
	adds r0, r4, #0
	adds r0, #0x3c
	ldrb r0, [r0]
	cmp r0, #1
	beq _0809A44C
	cmp r0, #1
	bgt _0809A440
	cmp r0, #0
	beq _0809A446
	b _0809A44C
_0809A440:
	cmp r0, #2
	beq _0809A44A
	b _0809A44C
_0809A446:
	movs r2, #3
	b _0809A44C
_0809A44A:
	movs r2, #2
_0809A44C:
	lsls r0, r2, #2
	add r0, sp
	ldr r0, [r0]
	movs r1, #0xa0
	movs r2, #0x20
	bl ApplyPaletteExt
	adds r0, r4, #0
	adds r0, #0x3b
	ldrb r0, [r0]
	cmp r0, #0
	bne _0809A474
	movs r0, #0x20
	bl ArchivePalette
	movs r0, #0xc0
	movs r1, #0xc0
	movs r2, #0xc0
	bl sub_8013B4C
_0809A474:
	add sp, #0x10
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	thumb_func_start sub_809A47C
sub_809A47C: @ 0x0809A47C
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r0, #0x3c
	movs r1, #0
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r0, #0x14
	strh r1, [r0]
	adds r0, #2
	strh r1, [r0]
	adds r0, #8
	strh r1, [r0]
	adds r0, #2
	strh r1, [r0]
	movs r2, #0
	ldr r6, _0809A510 @ =gUnk_0842B374
	adds r3, r4, #0
	adds r3, #0x34
	movs r5, #0xff
_0809A4A8:
	adds r1, r3, r2
	ldrb r0, [r1]
	orrs r0, r5
	strb r0, [r1]
	adds r2, #1
	cmp r2, #4
	ble _0809A4A8
	movs r0, #0
	str r0, [r4, #0x2c]
	ldr r1, _0809A514 @ =0x06017000
	adds r0, r6, #0
	bl Decompress
	ldr r0, _0809A518 @ =gUnk_0842B4BC
	movs r1, #0xf8
	lsls r1, r1, #2
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r2, _0809A51C @ =gPlaySt
	adds r2, #0x40
	movs r0, #0x61
	rsbs r0, r0, #0
	ldrb r1, [r2]
	ands r0, r1
	movs r1, #0x20
	orrs r0, r1
	strb r0, [r2]
	ldr r0, _0809A520 @ =sub_809A324
	adds r1, r4, #0
	bl StartParallelWorker
	adds r0, r4, #0
	bl StartGreenText
	ldr r2, _0809A524 @ =gDispIo
	adds r3, r2, #0
	adds r3, #0x3c
	movs r1, #0x21
	rsbs r1, r1, #0
	adds r0, r1, #0
	ldrb r4, [r3]
	ands r0, r4
	strb r0, [r3]
	adds r2, #0x3d
	ldrb r0, [r2]
	ands r1, r0
	strb r1, [r2]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0809A510: .4byte gUnk_0842B374
_0809A514: .4byte 0x06017000
_0809A518: .4byte gUnk_0842B4BC
_0809A51C: .4byte gPlaySt
_0809A520: .4byte sub_809A324
_0809A524: .4byte gDispIo

	thumb_func_start sub_809A528
sub_809A528: @ 0x0809A528
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	adds r7, r2, #0
	adds r6, r3, #0
	ldr r2, [sp, #0x14]
	cmp r2, #0
	ble _0809A554
	lsls r0, r1, #5
	adds r0, r4, r0
	ldr r1, _0809A55C @ =gBg2Tm
	adds r5, r2, #0
	lsls r0, r0, #1
	adds r4, r0, r1
_0809A542:
	adds r0, r4, #0
	adds r1, r7, #0
	adds r2, r6, #0
	bl PutSpecialChar
	adds r4, #2
	subs r5, #1
	cmp r5, #0
	bne _0809A542
_0809A554:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0809A55C: .4byte gBg2Tm

	thumb_func_start sub_809A560
sub_809A560: @ 0x0809A560
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x1c
	adds r7, r0, #0
	bl ResetText
	ldr r4, _0809A6EC @ =gBg2Tm
	adds r0, r4, #0
	movs r1, #0
	bl TmFill
	movs r0, #0
	bl SetTextFontGlyphs
	movs r0, #0
	bl SetTextFont
	adds r0, r7, #0
	adds r0, #0x3b
	ldrb r0, [r0]
	cmp r0, #0
	bne _0809A594
	b _0809A7FC
_0809A594:
	adds r1, r4, #0
	adds r1, #0x42
	movs r0, #0xc
	str r0, [sp]
	ldr r2, _0809A6F0 @ =gUnk_08D8D738
	adds r0, r7, #0
	adds r0, #0x3c
	ldrb r0, [r0]
	lsls r0, r0, #2
	adds r0, r0, r2
	ldr r0, [r0]
	str r0, [sp, #4]
	movs r0, #0
	movs r2, #0
	movs r3, #0
	bl PutDrawText
	movs r0, #0x40
	adds r0, r0, r7
	mov sb, r0
	adds r1, r7, #0
	adds r1, #0x41
	str r1, [sp, #0x10]
	adds r2, r7, #0
	adds r2, #0x42
	str r2, [sp, #0x14]
	adds r3, r7, #0
	adds r3, #0x39
	str r3, [sp, #8]
	movs r5, #0x3d
	adds r5, r5, r7
	mov sl, r5
	adds r0, r7, #0
	adds r0, #0x4e
	str r0, [sp, #0x18]
	subs r1, #3
	str r1, [sp, #0xc]
	movs r6, #0x80
	lsls r6, r6, #1
	ldr r2, _0809A6F4 @ =gUnk_08D8D634
	mov r8, r2
	movs r5, #4
_0809A5E8:
	mov r3, r8
	adds r3, #4
	mov r8, r3
	subs r3, #4
	ldm r3!, {r0}
	bl DecodeMsg
	ldr r4, _0809A6F8 @ =gBg2Tm + 0x4
	adds r1, r6, r4
	movs r2, #5
	str r2, [sp]
	str r0, [sp, #4]
	movs r0, #0
	movs r2, #0
	movs r3, #0
	bl PutDrawText
	adds r6, #0x80
	subs r5, #1
	cmp r5, #0
	bge _0809A5E8
	movs r5, #5
	movs r0, #0xef
	lsls r0, r0, #1
	adds r1, r4, r0
	movs r6, #4
	str r6, [sp]
	ldr r0, _0809A6FC @ =gUnk_0842D1C0
	str r0, [sp, #4]
	movs r0, #0
	movs r2, #0
	movs r3, #0
	bl PutDrawText
	movs r1, #0xf9
	lsls r1, r1, #1
	adds r0, r4, r1
	ldr r2, [r7, #0x58]
	movs r1, #2
	bl PutNumber
	movs r2, #0xfa
	lsls r2, r2, #1
	adds r0, r4, r2
	movs r1, #3
	movs r2, #0x1e
	bl PutSpecialChar
	ldr r3, _0809A700 @ =0x0000025E
	adds r1, r4, r3
	str r6, [sp]
	ldr r0, _0809A704 @ =gUnk_0842D1C8
	str r0, [sp, #4]
	movs r0, #0
	movs r2, #0
	movs r3, #0
	bl PutDrawText
	ldr r1, _0809A708 @ =0x0000026A
	adds r0, r4, r1
	movs r1, #0
	movs r2, #0x20
	bl PutSpecialChar
	movs r2, #0x9c
	lsls r2, r2, #2
	adds r0, r4, r2
	movs r1, #0
	movs r2, #0x20
	bl PutSpecialChar
	movs r3, #0x9a
	lsls r3, r3, #2
	adds r0, r4, r3
	mov r1, sb
	ldrb r2, [r1]
	movs r1, #2
	bl PutNumber
	ldr r2, _0809A70C @ =0x0000026E
	adds r0, r4, r2
	ldr r3, [sp, #0x10]
	ldrb r2, [r3]
	movs r1, #2
	bl sub_800625C
	movs r1, #0x9d
	lsls r1, r1, #2
	adds r0, r4, r1
	ldr r3, [sp, #0x14]
	ldrb r2, [r3]
	movs r1, #2
	bl sub_800625C
	adds r1, r4, #0
	adds r1, #0x4e
	str r5, [sp]
	ldr r0, _0809A710 @ =gUnk_0842D1D0
	str r0, [sp, #4]
	movs r0, #0
	movs r2, #3
	movs r3, #0
	bl PutDrawText
	adds r0, r4, #0
	adds r0, #0x56
	ldr r2, _0809A714 @ =gUnk_08D8D720
	ldr r5, [sp, #8]
	ldrb r5, [r5]
	lsls r1, r5, #2
	adds r1, r1, r2
	ldr r2, [r1]
	movs r1, #4
	bl PutSpecialChar
	mov r1, sl
	ldrb r0, [r1]
	cmp r0, #0
	bne _0809A71C
	adds r1, r4, #0
	adds r1, #0x5c
	str r6, [sp]
	ldr r0, _0809A718 @ =gUnk_0842D1D8
	str r0, [sp, #4]
	movs r0, #0
	movs r2, #3
	movs r3, #0
	bl PutDrawText
	b _0809A730
	.align 2, 0
_0809A6EC: .4byte gBg2Tm
_0809A6F0: .4byte gUnk_08D8D738
_0809A6F4: .4byte gUnk_08D8D634
_0809A6F8: .4byte gBg2Tm + 0x4
_0809A6FC: .4byte gUnk_0842D1C0
_0809A700: .4byte 0x0000025E
_0809A704: .4byte gUnk_0842D1C8
_0809A708: .4byte 0x0000026A
_0809A70C: .4byte 0x0000026E
_0809A710: .4byte gUnk_0842D1D0
_0809A714: .4byte gUnk_08D8D720
_0809A718: .4byte gUnk_0842D1D8
_0809A71C:
	adds r1, r4, #0
	adds r1, #0x5c
	str r6, [sp]
	ldr r0, _0809A7AC @ =gUnk_0842D1E4
	str r0, [sp, #4]
	movs r0, #0
	movs r2, #3
	movs r3, #4
	bl PutDrawText
_0809A730:
	ldr r5, _0809A7B0 @ =gBg2Tm + 0x6c
	movs r4, #2
	str r4, [sp]
	ldr r0, _0809A7B4 @ =gUnk_0842D1EC
	str r0, [sp, #4]
	movs r0, #0
	adds r1, r5, #0
	movs r2, #3
	movs r3, #0
	bl PutDrawText
	adds r0, r5, #4
	ldr r3, [sp, #0x18]
	ldrb r2, [r3]
	movs r1, #2
	bl PutNumber
	adds r1, r5, #6
	str r4, [sp]
	ldr r0, _0809A7B8 @ =gUnk_0842D1F0
	str r0, [sp, #4]
	movs r0, #0
	movs r2, #3
	movs r3, #0
	bl PutDrawText
	ldr r1, [sp, #0xc]
	ldrb r0, [r1]
	cmp r0, #0
	beq _0809A7C0
	adds r1, r5, #0
	adds r1, #0xb4
	movs r0, #3
	str r0, [sp]
	ldr r0, _0809A7BC @ =gUnk_0842D1F4
	str r0, [sp, #4]
	movs r0, #0
	movs r2, #3
	movs r3, #0
	bl PutDrawText
	adds r1, r5, #0
	adds r1, #0xba
	movs r0, #6
	str r0, [sp]
	adds r0, r7, #0
	adds r0, #0x43
	str r0, [sp, #4]
	movs r0, #0
	movs r2, #0
	movs r3, #0
	bl PutDrawText
	adds r0, r5, #0
	adds r0, #0xcc
	adds r1, r7, #0
	adds r1, #0x3a
	ldrb r2, [r1]
	movs r1, #2
	bl PutNumber
	b _0809A95C
	.align 2, 0
_0809A7AC: .4byte gUnk_0842D1E4
_0809A7B0: .4byte gBg2Tm + 0x6c
_0809A7B4: .4byte gUnk_0842D1EC
_0809A7B8: .4byte gUnk_0842D1F0
_0809A7BC: .4byte gUnk_0842D1F4
_0809A7C0:
	adds r1, r5, #0
	adds r1, #0xb4
	movs r0, #5
	str r0, [sp]
	ldr r0, _0809A7F8 @ =gUnk_0842D1F4
	str r0, [sp, #4]
	movs r0, #0
	movs r2, #1
	movs r3, #0
	bl PutDrawText
	movs r4, #3
	str r4, [sp]
	movs r0, #0x13
	movs r1, #4
	movs r2, #1
	movs r3, #0x14
	bl sub_809A528
	str r4, [sp]
	movs r0, #0x1a
	movs r1, #4
	movs r2, #1
	movs r3, #0x14
	bl sub_809A528
	b _0809A95C
	.align 2, 0
_0809A7F8: .4byte gUnk_0842D1F4
_0809A7FC:
	adds r1, r4, #0
	adds r1, #0x42
	movs r0, #0xc
	str r0, [sp]
	ldr r2, _0809A8F8 @ =gUnk_08D8D738
	adds r0, r7, #0
	adds r0, #0x3c
	ldrb r0, [r0]
	lsls r0, r0, #2
	adds r0, r0, r2
	ldr r0, [r0]
	str r0, [sp, #4]
	movs r0, #0
	movs r2, #0
	movs r3, #0
	bl PutDrawText
	movs r5, #0
	adds r7, #0x3d
	mov sl, r7
	movs r6, #0x80
	lsls r6, r6, #1
	movs r4, #4
_0809A82A:
	ldr r1, _0809A8FC @ =gUnk_08D8D634
	lsls r0, r5, #2
	adds r0, r0, r1
	ldr r0, [r0]
	bl DecodeMsg
	ldr r7, _0809A900 @ =gBg2Tm + 0x4
	adds r1, r6, r7
	movs r2, #5
	mov sb, r2
	str r2, [sp]
	str r0, [sp, #4]
	movs r0, #0
	movs r2, #1
	movs r3, #0
	bl PutDrawText
	movs r3, #3
	mov r8, r3
	str r3, [sp]
	movs r0, #8
	adds r1, r4, #0
	movs r2, #1
	movs r3, #0x14
	bl sub_809A528
	adds r6, #0x80
	adds r4, #2
	adds r5, #1
	cmp r5, #4
	ble _0809A82A
	movs r5, #0xef
	lsls r5, r5, #1
	adds r1, r7, r5
	movs r4, #4
	str r4, [sp]
	ldr r0, _0809A904 @ =gUnk_0842D1C0
	str r0, [sp, #4]
	movs r0, #0
	movs r2, #1
	movs r3, #0
	bl PutDrawText
	mov r0, r8
	str r0, [sp]
	movs r0, #0x16
	movs r1, #7
	movs r2, #1
	movs r3, #0x14
	bl sub_809A528
	ldr r2, _0809A908 @ =0x0000025E
	adds r1, r7, r2
	str r4, [sp]
	ldr r0, _0809A90C @ =gUnk_0842D1C8
	str r0, [sp, #4]
	movs r0, #0
	movs r2, #1
	movs r3, #0
	bl PutDrawText
	mov r3, r8
	str r3, [sp]
	movs r0, #0x16
	movs r1, #9
	movs r2, #1
	movs r3, #0x14
	bl sub_809A528
	adds r1, r7, #0
	adds r1, #0x4e
	mov r5, sb
	str r5, [sp]
	ldr r0, _0809A910 @ =gUnk_0842D1D0
	str r0, [sp, #4]
	movs r0, #0
	movs r2, #1
	movs r3, #0
	bl PutDrawText
	movs r0, #1
	str r0, [sp]
	movs r0, #0xd
	movs r1, #1
	movs r2, #1
	movs r3, #0x14
	bl sub_809A528
	mov r1, sl
	ldrb r0, [r1]
	cmp r0, #0
	bne _0809A918
	adds r1, r7, #0
	adds r1, #0x5c
	str r4, [sp]
	ldr r0, _0809A914 @ =gUnk_0842D1D8
	str r0, [sp, #4]
	movs r0, #0
	movs r2, #1
	movs r3, #0
	bl PutDrawText
	b _0809A92C
	.align 2, 0
_0809A8F8: .4byte gUnk_08D8D738
_0809A8FC: .4byte gUnk_08D8D634
_0809A900: .4byte gBg2Tm + 0x4
_0809A904: .4byte gUnk_0842D1C0
_0809A908: .4byte 0x0000025E
_0809A90C: .4byte gUnk_0842D1C8
_0809A910: .4byte gUnk_0842D1D0
_0809A914: .4byte gUnk_0842D1D8
_0809A918:
	adds r1, r7, #0
	adds r1, #0x5c
	str r4, [sp]
	ldr r0, _0809A974 @ =gUnk_0842D1E4
	str r0, [sp, #4]
	movs r0, #0
	movs r2, #1
	movs r3, #4
	bl PutDrawText
_0809A92C:
	movs r0, #4
	str r0, [sp]
	movs r0, #0x16
	movs r1, #1
	movs r2, #1
	movs r3, #0x14
	bl sub_809A528
	movs r0, #5
	str r0, [sp]
	movs r0, #0x11
	movs r1, #4
	movs r2, #1
	movs r3, #0x14
	bl sub_809A528
	movs r0, #3
	str r0, [sp]
	movs r0, #0x1a
	movs r1, #4
	movs r2, #1
	movs r3, #0x14
	bl sub_809A528
_0809A95C:
	movs r0, #4
	bl EnableBgSync
	add sp, #0x1c
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0809A974: .4byte gUnk_0842D1E4

	thumb_func_start sub_809A978
sub_809A978: @ 0x0809A978
	push {r4, lr}
	adds r4, r0, #0
	bl sub_8099D18
	adds r0, r4, #0
	bl ResetSysHandCursor
	movs r0, #0xc0
	lsls r0, r0, #3
	movs r1, #1
	bl DisplaySysHandCursorTextShadow
	adds r0, r4, #0
	bl StartUiSpinningArrows
	movs r1, #0xa0
	lsls r1, r1, #2
	movs r0, #0
	movs r2, #2
	bl LoadUiSpinningArrowGfx
	movs r0, #3
	bl SetUiSpinningArrowConfig
	movs r0, #0
	movs r1, #0x40
	movs r2, #0xe8
	movs r3, #0x40
	bl SetUiSpinningArrowPositions
	ldr r3, _0809A9F8 @ =gDispIo
	adds r2, r3, #0
	adds r2, #0x34
	movs r0, #0x20
	ldrb r1, [r2]
	orrs r1, r0
	strb r1, [r2]
	adds r1, r3, #0
	adds r1, #0x36
	ldrb r2, [r1]
	orrs r0, r2
	strb r0, [r1]
	adds r1, #6
	movs r0, #0x3f
	ldrb r2, [r1]
	ands r0, r2
	strb r0, [r1]
	adds r0, r3, #0
	adds r0, #0x44
	movs r1, #0
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	movs r0, #0xa0
	lsls r0, r0, #7
	movs r1, #5
	bl sub_809228C
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0809A9F8: .4byte gDispIo

	thumb_func_start sub_809A9FC
sub_809A9FC: @ 0x0809A9FC
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #0x2c
	adds r6, r0, #0
	add r0, sp, #0x28
	movs r1, #0
	strh r1, [r0]
	ldr r2, _0809AB18 @ =0x0100000C
	add r1, sp, #0x10
	bl CpuSet
	adds r0, r6, #0
	adds r0, #0x3c
	ldrb r1, [r0]
	adds r0, #1
	ldrb r2, [r0]
	add r0, sp, #0x10
	bl sub_809FC60
	add r0, sp, #0x10
	ldrb r2, [r0]
	lsls r0, r2, #0x1f
	lsrs r0, r0, #0x1f
	adds r1, r6, #0
	adds r1, #0x3b
	strb r0, [r1]
	cmp r0, #0
	bne _0809AA3A
	b _0809AB8C
_0809AA3A:
	lsls r0, r2, #0x19
	lsrs r0, r0, #0x1d
	adds r3, r6, #0
	adds r3, #0x34
	strb r0, [r3]
	add r0, sp, #0x10
	ldrh r0, [r0]
	lsls r0, r0, #0x16
	lsrs r0, r0, #0x1d
	movs r1, #0x35
	adds r1, r1, r6
	mov r8, r1
	strb r0, [r1]
	add r0, sp, #0x10
	ldrb r1, [r0, #1]
	lsls r0, r1, #0x1b
	lsrs r0, r0, #0x1d
	movs r2, #0x36
	adds r2, r2, r6
	mov ip, r2
	strb r0, [r2]
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x1d
	adds r7, r6, #0
	adds r7, #0x37
	strb r1, [r7]
	add r0, sp, #0x10
	ldrb r1, [r0, #2]
	lsls r0, r1, #0x1d
	lsrs r0, r0, #0x1d
	adds r4, r6, #0
	adds r4, #0x38
	strb r0, [r4]
	lsls r1, r1, #0x19
	lsrs r1, r1, #0x1f
	movs r0, #0x3e
	adds r0, r0, r6
	mov sb, r0
	strb r1, [r0]
	ldr r0, [sp, #0x14]
	lsrs r0, r0, #7
	adds r1, r6, #0
	adds r1, #0x40
	strb r0, [r1]
	add r0, sp, #0x10
	ldrb r0, [r0, #6]
	lsls r0, r0, #0x19
	lsrs r0, r0, #0x1a
	adds r1, #1
	strb r0, [r1]
	add r0, sp, #0x10
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x13
	lsrs r0, r0, #0x1a
	adds r1, #1
	strb r0, [r1]
	add r0, sp, #0x10
	ldrb r0, [r0, #7]
	lsrs r2, r0, #5
	ldr r0, [sp, #0x18]
	ldr r1, _0809AB1C @ =0x001FFFFF
	ands r0, r1
	lsls r0, r0, #3
	orrs r0, r2
	str r0, [r6, #0x58]
	add r0, sp, #0x10
	ldrb r0, [r0, #0x17]
	adds r5, r6, #0
	adds r5, #0x3f
	strb r0, [r5]
	ldrb r0, [r3]
	mov r2, r8
	ldrb r1, [r2]
	mov r3, ip
	ldrb r2, [r3]
	ldrb r3, [r7]
	ldrb r4, [r4]
	str r4, [sp]
	bl sub_80B73FC
	adds r1, r6, #0
	adds r1, #0x39
	strb r0, [r1]
	add r0, sp, #0x10
	ldrh r0, [r0, #0xa]
	lsls r0, r0, #0x15
	lsrs r0, r0, #0x1a
	adds r2, r6, #0
	adds r2, #0x4e
	strb r0, [r2]
	add r0, sp, #0x10
	ldrh r0, [r0, #2]
	lsrs r0, r0, #7
	subs r2, #0x14
	strb r0, [r2]
	mov r2, sb
	ldrb r0, [r2]
	adds r7, r1, #0
	cmp r0, #0
	beq _0809AB20
	adds r4, r6, #0
	adds r4, #0x43
	add r1, sp, #0x1c
	adds r0, r4, #0
	bl strcpy
	adds r0, r4, #0
	bl SetTacticianName
	b _0809AB2A
	.align 2, 0
_0809AB18: .4byte 0x0100000C
_0809AB1C: .4byte 0x001FFFFF
_0809AB20:
	ldr r0, _0809AB68 @ =0x00000569
	bl DecodeMsg
	bl SetTacticianName
_0809AB2A:
	ldrb r0, [r5]
	cmp r0, #0
	beq _0809AB4C
	ldrb r1, [r7]
	bl sub_809B214
	cmp r0, #0
	bne _0809AB3C
	strb r0, [r5]
_0809AB3C:
	ldrb r0, [r5]
	adds r4, r6, #0
	adds r4, #0x3b
	ldr r3, _0809AB6C @ =gBg1Tm
	mov r8, r3
	ldr r7, _0809AB70 @ =gUnk_0842BA30
	cmp r0, #0
	bne _0809ABAA
_0809AB4C:
	adds r0, r6, #0
	adds r0, #0x3c
	ldrb r0, [r0]
	cmp r0, #0
	bne _0809AB74
	movs r0, #0x2d
	strb r0, [r5]
	adds r4, r6, #0
	adds r4, #0x3b
	ldr r0, _0809AB6C @ =gBg1Tm
	mov r8, r0
	ldr r7, _0809AB70 @ =gUnk_0842BA30
	b _0809ABAA
	.align 2, 0
_0809AB68: .4byte 0x00000569
_0809AB6C: .4byte gBg1Tm
_0809AB70: .4byte gUnk_0842BA30
_0809AB74:
	movs r0, #0x28
	strb r0, [r5]
	adds r4, r6, #0
	adds r4, #0x3b
	ldr r1, _0809AB84 @ =gBg1Tm
	mov r8, r1
	ldr r7, _0809AB88 @ =gUnk_0842BA30
	b _0809ABAA
	.align 2, 0
_0809AB84: .4byte gBg1Tm
_0809AB88: .4byte gUnk_0842BA30
_0809AB8C:
	movs r2, #0
	adds r4, r1, #0
	ldr r3, _0809AC48 @ =gBg1Tm
	mov r8, r3
	ldr r7, _0809AC4C @ =gUnk_0842BA30
	adds r3, r6, #0
	adds r3, #0x34
	movs r5, #0xff
_0809AB9C:
	adds r1, r3, r2
	ldrb r0, [r1]
	orrs r0, r5
	strb r0, [r1]
	adds r2, #1
	cmp r2, #4
	ble _0809AB9C
_0809ABAA:
	movs r2, #0xa5
	lsls r2, r2, #7
	mov r0, r8
	adds r1, r7, #0
	bl TmApplyTsa_thm
	adds r0, r6, #0
	bl sub_809A560
	adds r0, r6, #0
	bl sub_809A404
	movs r0, #7
	bl EnableBgSync
	movs r0, #0
	bl EndFaceById
	bl EndCgText
	ldrb r0, [r4]
	cmp r0, #0
	beq _0809AC38
	adds r4, r6, #0
	adds r4, #0x3f
	ldrb r0, [r4]
	cmp r0, #0
	beq _0809AC38
	ldr r2, _0809AC50 @ =gCharacterData
	ldrb r1, [r4]
	subs r1, #1
	movs r0, #0x34
	muls r0, r1, r0
	adds r0, r0, r2
	ldrh r1, [r0, #6]
	movs r0, #0xc1
	lsls r0, r0, #1
	str r0, [sp]
	movs r0, #0
	movs r2, #0xd8
	movs r3, #0x58
	bl StartBmFace
	ldrb r0, [r4]
	adds r1, r6, #0
	adds r1, #0x39
	ldrb r1, [r1]
	bl sub_809B214
	adds r4, r0, #0
	movs r0, #0x28
	movs r1, #0
	movs r2, #1
	bl InitTalk
	str r4, [sp]
	ldr r0, _0809AC54 @ =0x06011000
	str r0, [sp, #4]
	movs r0, #0xa
	str r0, [sp, #8]
	movs r0, #0
	str r0, [sp, #0xc]
	movs r0, #0x16
	movs r1, #0x13
	movs r2, #0x12
	movs r3, #4
	bl sub_8088584
	ldr r0, _0809AC58 @ =0x000809FE
	bl SetCgTextFlags
_0809AC38:
	add sp, #0x2c
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0809AC48: .4byte gBg1Tm
_0809AC4C: .4byte gUnk_0842BA30
_0809AC50: .4byte gCharacterData
_0809AC54: .4byte 0x06011000
_0809AC58: .4byte 0x000809FE

	thumb_func_start sub_809AC5C
sub_809AC5C: @ 0x0809AC5C
	push {r4, r5, lr}
	sub sp, #4
	adds r4, r0, #0
	adds r0, #0x4f
	movs r5, #0
	strb r5, [r0]
	adds r0, #1
	strb r5, [r0]
	ldr r1, _0809ACA8 @ =gpKeySt
	ldr r2, [r1]
	movs r0, #2
	ldrh r3, [r2, #8]
	ands r0, r3
	adds r3, r1, #0
	cmp r0, #0
	beq _0809ACB4
	ldr r0, _0809ACAC @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0809AC8E
	ldr r0, _0809ACB0 @ =0x0000038B
	bl m4aSongNumStart
_0809AC8E:
	movs r1, #0x80
	lsls r1, r1, #1
	str r5, [sp]
	movs r0, #0x5a
	movs r2, #0xc0
	movs r3, #0x18
	bl CallSomeSoundMaybe
	adds r0, r4, #0
	movs r1, #0
	bl Proc_Goto
	b _0809AD4C
	.align 2, 0
_0809ACA8: .4byte gpKeySt
_0809ACAC: .4byte gPlaySt
_0809ACB0: .4byte 0x0000038B
_0809ACB4:
	movs r0, #4
	ldrh r2, [r2, #4]
	ands r0, r2
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0
	beq _0809AD00
	adds r0, r4, #0
	adds r0, #0x5e
	ldrh r1, [r0]
	adds r1, #1
	strh r1, [r0]
	subs r0, #0x23
	ldrb r0, [r0]
	cmp r0, #0
	beq _0809AD06
	lsls r0, r1, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0xb4
	bls _0809AD06
	ldr r0, _0809ACF8 @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0809ACEE
	ldr r0, _0809ACFC @ =0x0000038A
	bl m4aSongNumStart
_0809ACEE:
	adds r0, r4, #0
	movs r1, #3
	bl Proc_Goto
	b _0809AD4C
	.align 2, 0
_0809ACF8: .4byte gPlaySt
_0809ACFC: .4byte 0x0000038A
_0809AD00:
	adds r1, r4, #0
	adds r1, #0x5e
	strh r0, [r1]
_0809AD06:
	ldr r1, [r3]
	movs r0, #0x88
	lsls r0, r0, #2
	ldrh r1, [r1, #8]
	ands r0, r1
	adds r2, r4, #0
	adds r2, #0x4f
	cmp r0, #0
	beq _0809AD1C
	movs r0, #0xff
	strb r0, [r2]
_0809AD1C:
	ldr r1, [r3]
	movs r0, #0x88
	lsls r0, r0, #1
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _0809AD2E
	movs r0, #1
	strb r0, [r2]
_0809AD2E:
	movs r0, #0
	ldrsb r0, [r2, r0]
	cmp r0, #0
	bne _0809AD44
	adds r0, r4, #0
	adds r0, #0x50
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _0809AD4C
_0809AD44:
	adds r0, r4, #0
	movs r1, #2
	bl Proc_Goto
_0809AD4C:
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start sub_809AD54
sub_809AD54: @ 0x0809AD54
	push {r4, r5, r6, r7, lr}
	sub sp, #0x10
	adds r6, r0, #0
	adds r6, #0x5c
	ldrh r0, [r6]
	bl sub_809B2A0
	adds r7, r0, #0
	cmp r7, #0
	bne _0809AD72
	strh r7, [r6]
	movs r0, #0
	bl sub_809B2A0
	adds r7, r0, #0
_0809AD72:
	ldrh r0, [r6]
	bl sub_809B248
	adds r5, r0, #0
	ldrh r0, [r6]
	adds r0, #1
	movs r4, #0
	strh r0, [r6]
	movs r0, #0
	bl EndFaceById
	ldr r2, _0809ADD0 @ =gCharacterData
	subs r1, r7, #1
	movs r0, #0x34
	muls r0, r1, r0
	adds r0, r0, r2
	ldrh r0, [r0, #6]
	str r4, [sp]
	movs r1, #0xd8
	movs r2, #0x58
	movs r3, #0x82
	bl sub_8008DA8
	movs r0, #0x28
	movs r1, #0
	movs r2, #1
	bl InitTalk
	str r5, [sp]
	ldr r0, _0809ADD4 @ =0x06011000
	str r0, [sp, #4]
	movs r0, #0xa
	str r0, [sp, #8]
	str r4, [sp, #0xc]
	movs r0, #0x16
	movs r1, #0x13
	movs r2, #0x12
	movs r3, #4
	bl sub_8088584
	ldr r0, _0809ADD8 @ =0x0002000A
	bl SetCgTextFlags
	add sp, #0x10
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0809ADD0: .4byte gCharacterData
_0809ADD4: .4byte 0x06011000
_0809ADD8: .4byte 0x0002000A

	thumb_func_start sub_809ADDC
sub_809ADDC: @ 0x0809ADDC
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	ldr r4, _0809AECC @ =gDispIo
	movs r2, #4
	rsbs r2, r2, #0
	adds r1, r2, #0
	ldrb r3, [r4, #0xc]
	ands r1, r3
	movs r3, #1
	mov r8, r3
	mov r3, r8
	orrs r1, r3
	strb r1, [r4, #0xc]
	movs r1, #3
	ldrb r3, [r4, #0x10]
	orrs r1, r3
	strb r1, [r4, #0x10]
	adds r1, r2, #0
	ldrb r3, [r4, #0x14]
	ands r1, r3
	movs r6, #2
	orrs r1, r6
	strb r1, [r4, #0x14]
	ldrb r1, [r4, #0x18]
	ands r2, r1
	strb r2, [r4, #0x18]
	movs r5, #0
	str r5, [r0, #0x2c]
	adds r2, r4, #0
	adds r2, #0x3c
	movs r0, #0x3f
	ldrb r3, [r2]
	ands r0, r3
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r2]
	adds r0, r4, #0
	adds r0, #0x44
	strb r5, [r0]
	adds r1, r4, #0
	adds r1, #0x45
	movs r7, #0x10
	movs r0, #0x10
	strb r0, [r1]
	adds r0, r4, #0
	adds r0, #0x46
	strb r5, [r0]
	ldr r0, _0809AED0 @ =0x0000FFE0
	ldrh r1, [r4, #0x3c]
	ands r0, r1
	movs r1, #8
	orrs r0, r1
	ldr r1, _0809AED4 @ =0x0000E0FF
	ands r0, r1
	movs r2, #0xb8
	lsls r2, r2, #5
	adds r1, r2, #0
	orrs r0, r1
	strh r0, [r4, #0x3c]
	ldr r0, _0809AED8 @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0809AE66
	movs r0, #0xc8
	bl m4aSongNumStart
_0809AE66:
	movs r0, #0x20
	ldrb r3, [r4, #1]
	orrs r0, r3
	movs r1, #0x41
	rsbs r1, r1, #0
	ands r0, r1
	movs r1, #0x7f
	ands r0, r1
	strb r0, [r4, #1]
	adds r2, r4, #0
	adds r2, #0x34
	mov r0, r8
	ldrb r1, [r2]
	orrs r0, r1
	orrs r0, r6
	movs r1, #4
	orrs r0, r1
	movs r3, #8
	orrs r0, r3
	orrs r0, r7
	strb r0, [r2]
	adds r2, #2
	movs r0, #2
	rsbs r0, r0, #0
	ldrb r1, [r2]
	ands r0, r1
	movs r1, #3
	rsbs r1, r1, #0
	ands r0, r1
	subs r1, #2
	ands r0, r1
	orrs r0, r3
	orrs r0, r7
	strb r0, [r2]
	adds r0, r4, #0
	adds r0, #0x2d
	strb r5, [r0]
	adds r0, #4
	strb r5, [r0]
	adds r1, r4, #0
	adds r1, #0x2c
	movs r0, #0xf0
	strb r0, [r1]
	adds r1, #4
	movs r0, #0xa0
	strb r0, [r1]
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0809AECC: .4byte gDispIo
_0809AED0: .4byte 0x0000FFE0
_0809AED4: .4byte 0x0000E0FF
_0809AED8: .4byte gPlaySt

	thumb_func_start sub_809AEDC
sub_809AEDC: @ 0x0809AEDC
	push {r4, lr}
	movs r1, #0
	movs r4, #0xf0
	cmp r0, #0
	ble _0809AEE8
	adds r1, r0, #0
_0809AEE8:
	cmp r0, #0
	bge _0809AEF2
	movs r2, #0x80
	lsls r2, r2, #1
	adds r4, r0, r2
_0809AEF2:
	cmp r4, #0xf0
	bgt _0809AF00
	adds r0, r4, #0
	cmp r0, #0
	bge _0809AF02
	movs r0, #0
	b _0809AF02
_0809AF00:
	movs r0, #0xf0
_0809AF02:
	adds r4, r0, #0
	cmp r1, #0xf0
	bgt _0809AF10
	cmp r1, #0
	bge _0809AF12
	movs r1, #0
	b _0809AF12
_0809AF10:
	movs r1, #0xf0
_0809AF12:
	ldr r2, _0809AF34 @ =gDispIo
	adds r3, r2, #0
	adds r3, #0x2d
	movs r0, #0
	strb r1, [r3]
	adds r1, r2, #0
	adds r1, #0x31
	strb r0, [r1]
	adds r0, r2, #0
	adds r0, #0x2c
	strb r4, [r0]
	subs r1, #1
	movs r0, #0xa0
	strb r0, [r1]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0809AF34: .4byte gDispIo

	thumb_func_start sub_809AF38
sub_809AF38: @ 0x0809AF38
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r6, r0, #0
	ldr r0, [r6, #0x2c]
	adds r0, #1
	str r0, [r6, #0x2c]
	movs r4, #0xa
	subs r4, r4, r0
	lsls r0, r4, #3
	muls r0, r4, r0
	movs r1, #0x64
	bl __divsi3
	movs r5, #8
	subs r5, r5, r0
	lsls r0, r4, #4
	muls r0, r4, r0
	movs r1, #0x64
	bl __divsi3
	movs r3, #0x10
	subs r3, r3, r0
	adds r0, r6, #0
	adds r0, #0x4f
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r0, r0, #3
	adds r1, r5, #0
	muls r1, r0, r1
	mov r8, r1
	adds r0, r6, #0
	adds r0, #0x50
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r0, r0, #3
	adds r7, r5, #0
	muls r7, r0, r7
	ldr r4, _0809B024 @ =gDispIo
	adds r2, r4, #0
	adds r2, #0x3c
	movs r0, #0x3f
	ldrb r1, [r2]
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r2]
	adds r0, r4, #0
	adds r0, #0x44
	movs r1, #0
	strb r3, [r0]
	movs r0, #0x10
	subs r0, r0, r3
	adds r2, #9
	strb r0, [r2]
	adds r0, r4, #0
	adds r0, #0x46
	strb r1, [r0]
	mov r0, r8
	lsls r5, r0, #0x10
	lsrs r5, r5, #0x10
	lsls r4, r7, #0x10
	lsrs r4, r4, #0x10
	movs r0, #0
	adds r1, r5, #0
	adds r2, r4, #0
	bl SetBgOffset
	movs r0, #1
	adds r1, r5, #0
	adds r2, r4, #0
	bl SetBgOffset
	adds r2, r7, #4
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	movs r0, #2
	adds r1, r5, #0
	bl SetBgOffset
	mov r1, r8
	rsbs r0, r1, #0
	adds r1, r6, #0
	adds r1, #0x52
	strh r0, [r1]
	rsbs r1, r7, #0
	adds r2, r6, #0
	adds r2, #0x54
	strh r1, [r2]
	bl sub_809AEDC
	adds r0, r6, #0
	adds r0, #0x3f
	ldrb r0, [r0]
	cmp r0, #0
	beq _0809B00C
	movs r1, #0xd8
	mov r0, r8
	subs r1, r1, r0
	movs r2, #0x58
	subs r2, r2, r7
	movs r0, #0
	bl sub_8007B80
_0809B00C:
	ldr r0, [r6, #0x2c]
	cmp r0, #0xa
	bne _0809B018
	adds r0, r6, #0
	bl Proc_Break
_0809B018:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0809B024: .4byte gDispIo

	thumb_func_start sub_809B028
sub_809B028: @ 0x0809B028
	push {r4, r5, lr}
	adds r4, r0, #0
	movs r5, #0
	str r5, [r4, #0x2c]
	adds r0, #0x4f
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	ble _0809B060
	movs r0, #1
	bl SetUiSpinningArrowFastMaybe
	adds r2, r4, #0
	adds r2, #0x3c
	ldrb r0, [r2]
	cmp r0, #2
	bne _0809B05C
	adds r1, r4, #0
	adds r1, #0x3d
	movs r0, #1
	ldrb r3, [r1]
	subs r0, r0, r3
	strb r0, [r1]
	strb r5, [r2]
	b _0809B060
_0809B05C:
	adds r0, #1
	strb r0, [r2]
_0809B060:
	adds r0, r4, #0
	adds r0, #0x4f
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bge _0809B092
	movs r0, #0
	bl SetUiSpinningArrowFastMaybe
	adds r2, r4, #0
	adds r2, #0x3c
	ldrb r0, [r2]
	cmp r0, #0
	bne _0809B08E
	adds r0, r4, #0
	adds r0, #0x3d
	movs r1, #1
	ldrb r3, [r0]
	subs r1, r1, r3
	strb r1, [r0]
	movs r0, #2
	b _0809B090
_0809B08E:
	subs r0, #1
_0809B090:
	strb r0, [r2]
_0809B092:
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start sub_809B098
sub_809B098: @ 0x0809B098
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	adds r7, r0, #0
	ldr r0, [r7, #0x2c]
	adds r0, #1
	str r0, [r7, #0x2c]
	movs r5, #0xa
	subs r5, r5, r0
	lsls r0, r5, #3
	muls r0, r5, r0
	movs r1, #0x64
	bl __divsi3
	movs r4, #8
	subs r4, r4, r0
	lsls r0, r5, #4
	muls r0, r5, r0
	movs r1, #0x64
	bl __divsi3
	movs r2, #0x10
	subs r2, r2, r0
	lsls r4, r4, #3
	subs r4, #0x40
	adds r0, r7, #0
	adds r0, #0x4f
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r1, r4, #0
	muls r1, r0, r1
	mov sb, r1
	adds r0, r7, #0
	adds r0, #0x50
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r3, r4, #0
	muls r3, r0, r3
	mov r8, r3
	ldr r6, _0809B1EC @ =gDispIo
	movs r0, #0x3c
	adds r0, r0, r6
	mov sl, r0
	movs r0, #0x3f
	mov r1, sl
	ldrb r1, [r1]
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	mov r3, sl
	strb r0, [r3]
	movs r0, #0x10
	subs r0, r0, r2
	movs r1, #0
	ldr r3, _0809B1F0 @ =0x030027D4
	strb r0, [r3]
	ldr r0, _0809B1F4 @ =0x030027D5
	strb r2, [r0]
	ldr r2, _0809B1F8 @ =0x030027D6
	strb r1, [r2]
	mov r3, sb
	lsls r5, r3, #0x10
	lsrs r5, r5, #0x10
	mov r0, r8
	lsls r4, r0, #0x10
	lsrs r4, r4, #0x10
	movs r0, #0
	adds r1, r5, #0
	adds r2, r4, #0
	bl SetBgOffset
	movs r0, #1
	adds r1, r5, #0
	adds r2, r4, #0
	bl SetBgOffset
	mov r2, r8
	adds r2, #4
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	movs r0, #2
	adds r1, r5, #0
	bl SetBgOffset
	mov r1, sb
	rsbs r0, r1, #0
	adds r1, r7, #0
	adds r1, #0x52
	movs r4, #0
	strh r0, [r1]
	mov r2, r8
	rsbs r1, r2, #0
	adds r2, r7, #0
	adds r2, #0x54
	strh r1, [r2]
	bl sub_809AEDC
	adds r0, r7, #0
	adds r0, #0x3f
	ldrb r0, [r0]
	cmp r0, #0
	beq _0809B17E
	movs r1, #0xd8
	mov r3, sb
	subs r1, r1, r3
	movs r2, #0x58
	mov r0, r8
	subs r2, r2, r0
	movs r0, #0
	bl sub_8007B80
_0809B17E:
	ldr r0, [r7, #0x2c]
	cmp r0, #0xa
	bne _0809B1DE
	adds r0, r7, #0
	bl Proc_Break
	movs r1, #4
	rsbs r1, r1, #0
	adds r0, r1, #0
	ldrb r2, [r6, #0xc]
	ands r0, r2
	movs r2, #1
	orrs r0, r2
	strb r0, [r6, #0xc]
	movs r2, #3
	ldrb r0, [r6, #0x10]
	orrs r0, r2
	strb r0, [r6, #0x10]
	ldrb r3, [r6, #0x14]
	ands r1, r3
	movs r0, #2
	orrs r1, r0
	strb r1, [r6, #0x14]
	ldrb r0, [r6, #0x18]
	orrs r2, r0
	strb r2, [r6, #0x18]
	movs r0, #0x3f
	mov r1, sl
	ldrb r1, [r1]
	ands r0, r1
	mov r2, sl
	strb r0, [r2]
	ldr r3, _0809B1F0 @ =0x030027D4
	strb r4, [r3]
	ldr r0, _0809B1F4 @ =0x030027D5
	strb r4, [r0]
	ldr r1, _0809B1F8 @ =0x030027D6
	strb r4, [r1]
	movs r0, #0x21
	rsbs r0, r0, #0
	ldrb r2, [r6, #1]
	ands r0, r2
	movs r1, #0x41
	rsbs r1, r1, #0
	ands r0, r1
	movs r1, #0x7f
	ands r0, r1
	strb r0, [r6, #1]
_0809B1DE:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0809B1EC: .4byte gDispIo
_0809B1F0: .4byte 0x030027D4
_0809B1F4: .4byte 0x030027D5
_0809B1F8: .4byte 0x030027D6

	thumb_func_start sub_809B1FC
sub_809B1FC: @ 0x0809B1FC
	push {lr}
	adds r2, r0, #0
	adds r0, #0x3c
	ldrb r0, [r0]
	adds r1, r2, #0
	adds r1, #0x3d
	ldrb r1, [r1]
	bl sub_809EDF0
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_809B214
sub_809B214: @ 0x0809B214
	adds r3, r0, #0
	ldr r2, _0809B21C @ =gUnk_08D8D84C
	b _0809B23C
	.align 2, 0
_0809B21C: .4byte gUnk_08D8D84C
_0809B220:
	ldr r0, [r2]
	cmp r3, r0
	bne _0809B23A
	cmp r1, #3
	ble _0809B22E
	ldr r0, [r2, #4]
	b _0809B244
_0809B22E:
	cmp r1, #1
	ble _0809B236
	ldr r0, [r2, #8]
	b _0809B244
_0809B236:
	ldr r0, [r2, #0xc]
	b _0809B244
_0809B23A:
	adds r2, #0x10
_0809B23C:
	ldr r0, [r2]
	cmp r0, #0
	bne _0809B220
	movs r0, #0
_0809B244:
	bx lr
	.align 2, 0

	thumb_func_start sub_809B248
sub_809B248: @ 0x0809B248
	push {r4, r5, lr}
	adds r5, r0, #0
	movs r1, #3
	bl __modsi3
	cmp r0, #0
	bne _0809B26C
	ldr r4, _0809B268 @ =gUnk_08D8D84C
	adds r0, r5, #0
	movs r1, #3
	bl __divsi3
	lsls r0, r0, #4
	adds r4, #4
	b _0809B292
	.align 2, 0
_0809B268: .4byte gUnk_08D8D84C
_0809B26C:
	cmp r0, #1
	beq _0809B284
	ldr r4, _0809B280 @ =gUnk_08D8D84C
	adds r0, r5, #0
	movs r1, #3
	bl __divsi3
	lsls r0, r0, #4
	adds r4, #0xc
	b _0809B292
	.align 2, 0
_0809B280: .4byte gUnk_08D8D84C
_0809B284:
	ldr r4, _0809B29C @ =gUnk_08D8D84C
	adds r0, r5, #0
	movs r1, #3
	bl __divsi3
	lsls r0, r0, #4
	adds r4, #8
_0809B292:
	adds r0, r0, r4
	ldr r0, [r0]
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_0809B29C: .4byte gUnk_08D8D84C

	thumb_func_start sub_809B2A0
sub_809B2A0: @ 0x0809B2A0
	push {r4, lr}
	ldr r4, _0809B2B8 @ =gUnk_08D8D84C
	movs r1, #3
	bl __divsi3
	lsls r0, r0, #4
	adds r0, r0, r4
	ldr r0, [r0]
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0809B2B8: .4byte gUnk_08D8D84C

	thumb_func_start sub_809B2BC
sub_809B2BC: @ 0x0809B2BC
	push {r4, r5, r6, lr}
	sub sp, #4
	ldr r2, [r0, #0x30]
	movs r3, #0x8f
	lsls r3, r3, #6
	movs r0, #0x90
	movs r1, #3
	bl sub_8090148
	movs r6, #0x9c
	lsls r6, r6, #5
	movs r5, #0x94
	movs r4, #2
_0809B2D6:
	str r6, [sp]
	movs r0, #4
	adds r1, r5, #0
	movs r2, #0x12
	ldr r3, _0809B2F8 @ =Sprite_32x16
	bl PutSpriteExt
	adds r6, #4
	adds r5, #0x20
	subs r4, #1
	cmp r4, #0
	bge _0809B2D6
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0809B2F8: .4byte Sprite_32x16

	thumb_func_start sub_809B2FC
sub_809B2FC: @ 0x0809B2FC
	push {r4, r5, r6, lr}
	sub sp, #0x20
	adds r5, r0, #0
	adds r4, r1, #0
	ldr r0, _0809B374 @ =gPlaySt
	ldrb r0, [r0, #0xe]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl GetChapterInfo
	adds r0, #0x8a
	ldrh r0, [r0]
	bl DecodeMsg
	adds r6, r0, #0
	ldr r0, _0809B378 @ =0x06010000
	adds r5, r5, r0
	mov r0, sp
	adds r1, r5, #0
	movs r2, #1
	bl InitSpriteTextFont
	ldr r0, _0809B37C @ =Pal_Text
	adds r4, #0x10
	lsls r4, r4, #5
	adds r1, r4, #0
	movs r2, #0x20
	bl ApplyPaletteExt
	add r4, sp, #0x18
	adds r0, r4, #0
	bl InitSpriteText
	mov r0, sp
	bl SetTextFont
	movs r0, #0
	bl SetTextFontGlyphs
	adds r0, r4, #0
	movs r1, #0
	bl SpriteText_DrawBackgroundExt
	movs r0, #0x60
	adds r1, r6, #0
	bl GetStringTextCenteredPos
	adds r1, r0, #0
	adds r0, r4, #0
	movs r2, #0
	adds r3, r6, #0
	bl Text_InsertDrawString
	movs r0, #0
	bl SetTextFont
	add sp, #0x20
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0809B374: .4byte gPlaySt
_0809B378: .4byte 0x06010000
_0809B37C: .4byte Pal_Text

	thumb_func_start sub_809B380
sub_809B380: @ 0x0809B380
	push {r4, r5, r6, lr}
	sub sp, #8
	adds r5, r0, #0
	bl sub_8099C7C
	adds r6, r0, #0
	ldr r4, _0809B4B0 @ =gDispIo
	movs r0, #8
	rsbs r0, r0, #0
	ldrb r1, [r4]
	ands r0, r1
	strb r0, [r4]
	movs r0, #0
	bl InitBgs
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
	movs r1, #4
	rsbs r1, r1, #0
	adds r0, r1, #0
	ldrb r2, [r4, #0xc]
	ands r0, r2
	strb r0, [r4, #0xc]
	adds r0, r1, #0
	ldrb r2, [r4, #0x10]
	ands r0, r2
	movs r2, #2
	orrs r0, r2
	strb r0, [r4, #0x10]
	ldrb r0, [r4, #0x14]
	ands r1, r0
	strb r1, [r4, #0x14]
	movs r0, #3
	ldrb r1, [r4, #0x18]
	orrs r0, r1
	strb r0, [r4, #0x18]
	bl InitFaces
	bl ResetText
	bl InitIcons
	bl UnpackUiWindowFrameGraphics
	bl ApplySystemObjectsGraphics
	ldr r2, _0809B4B4 @ =0x0000FFFC
	movs r0, #0
	movs r1, #4
	bl SetBgOffset
	movs r0, #1
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	movs r0, #2
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	movs r0, #4
	bl ApplyIconPalettes
	bl PrepRestartMuralBackground
	movs r0, #7
	bl EnableBgSync
	adds r0, r5, #0
	bl StartGreenText
	ldr r0, _0809B4B8 @ =0x02012A90
	movs r1, #8
	bl InitText
	movs r1, #0xe0
	lsls r1, r1, #4
	movs r3, #0xc0
	lsls r3, r3, #4
	movs r0, #0
	str r0, [sp]
	str r5, [sp, #4]
	movs r0, #0xd
	movs r2, #0xf
	bl StartSysBrownBox
	movs r0, #0
	movs r1, #0x90
	movs r2, #0x10
	movs r3, #0
	bl EnableSysBrownBox
	movs r0, #0xe0
	lsls r0, r0, #7
	movs r1, #1
	bl sub_809B2FC
	ldr r4, _0809B4BC @ =gPlaySt
	movs r0, #0xe
	ldrsb r0, [r4, r0]
	bl GetChapterInfo
	movs r1, #0
	ldrb r2, [r4, #0x1b]
	cmp r2, #3
	bne _0809B478
	movs r1, #1
_0809B478:
	adds r0, #0x80
	adds r0, r0, r1
	ldrb r0, [r0]
	str r0, [r5, #0x30]
	movs r0, #0xf0
	lsls r0, r0, #7
	movs r1, #2
	bl DrawAtMenuUpfx
	ldr r0, _0809B4C0 @ =sub_809B2BC
	adds r1, r5, #0
	bl StartParallelWorker
	movs r0, #0x80
	lsls r0, r0, #2
	movs r1, #3
	movs r2, #1
	bl InitTalk
	ldrb r0, [r4, #0xe]
	cmp r0, #0x2e
	bne _0809B4C4
	adds r0, r5, #0
	movs r1, #3
	bl Proc_Goto
	b _0809B4F4
	.align 2, 0
_0809B4B0: .4byte gDispIo
_0809B4B4: .4byte 0x0000FFFC
_0809B4B8: .4byte 0x02012A90
_0809B4BC: .4byte gPlaySt
_0809B4C0: .4byte sub_809B2BC
_0809B4C4:
	cmp r6, #0x4b
	bne _0809B4D0
	movs r0, #0x99
	bl SetFlag
	b _0809B4F4
_0809B4D0:
	movs r0, #0x99
	bl CheckFlag
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0809B4F4
	movs r0, #0xe
	ldrsb r0, [r4, r0]
	cmp r0, #0x2a
	bgt _0809B4F4
	movs r6, #0x4b
	movs r0, #0x99
	bl ClearFlag
	adds r0, r5, #0
	movs r1, #4
	bl Proc_Goto
_0809B4F4:
	ldr r3, _0809B50C @ =0x00000202
	movs r0, #0
	str r0, [sp]
	adds r0, r6, #0
	movs r1, #0xd4
	movs r2, #0x52
	bl sub_8008DA8
	add sp, #8
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0809B50C: .4byte 0x00000202

	thumb_func_start sub_809B510
sub_809B510: @ 0x0809B510
	push {r4, lr}
	sub sp, #0x10
	adds r4, r0, #0
	bl sub_8099C28
	str r0, [r4, #0x2c]
	movs r3, #1
	rsbs r3, r3, #0
	str r0, [sp]
	ldr r0, _0809B54C @ =0x06011000
	str r0, [sp, #4]
	str r3, [sp, #8]
	movs r0, #0
	str r0, [sp, #0xc]
	movs r0, #0x16
	movs r1, #0x10
	adds r2, r3, #0
	bl sub_8088584
	bl GetCgTextFlags
	adds r1, r0, #0
	ldr r0, _0809B550 @ =0x0004004E
	orrs r0, r1
	bl SetCgTextFlags
	add sp, #0x10
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0809B54C: .4byte 0x06011000
_0809B550: .4byte 0x0004004E

	thumb_func_start sub_809B554
sub_809B554: @ 0x0809B554
	push {r4, lr}
	sub sp, #0x10
	adds r4, r0, #0
	bl sub_8099BF8
	str r0, [r4, #0x2c]
	movs r3, #1
	rsbs r3, r3, #0
	str r0, [sp]
	ldr r0, _0809B590 @ =0x06011000
	str r0, [sp, #4]
	str r3, [sp, #8]
	str r4, [sp, #0xc]
	movs r0, #0x16
	movs r1, #0x10
	adds r2, r3, #0
	bl sub_8088584
	bl GetCgTextFlags
	adds r1, r0, #0
	ldr r0, _0809B594 @ =0x0004000A
	orrs r0, r1
	bl SetCgTextFlags
	add sp, #0x10
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0809B590: .4byte 0x06011000
_0809B594: .4byte 0x0004000A

	thumb_func_start sub_809B598
sub_809B598: @ 0x0809B598
	push {lr}
	sub sp, #0x10
	adds r2, r0, #0
	ldr r1, _0809B5B0 @ =gPlaySt
	adds r1, #0x2b
	movs r0, #1
	ldrb r1, [r1]
	ands r0, r1
	cmp r0, #0
	beq _0809B5B8
	ldr r0, _0809B5B4 @ =0x00000FAD
	b _0809B5BA
	.align 2, 0
_0809B5B0: .4byte gPlaySt
_0809B5B4: .4byte 0x00000FAD
_0809B5B8:
	ldr r0, _0809B5EC @ =0x00000FAE
_0809B5BA:
	str r0, [r2, #0x2c]
	movs r3, #1
	rsbs r3, r3, #0
	ldr r0, [r2, #0x2c]
	str r0, [sp]
	ldr r0, _0809B5F0 @ =0x06011000
	str r0, [sp, #4]
	str r3, [sp, #8]
	str r2, [sp, #0xc]
	movs r0, #0x16
	movs r1, #0x10
	adds r2, r3, #0
	bl sub_8088584
	bl GetCgTextFlags
	adds r1, r0, #0
	ldr r0, _0809B5F4 @ =0x0004000A
	orrs r0, r1
	bl SetCgTextFlags
	add sp, #0x10
	pop {r0}
	bx r0
	.align 2, 0
_0809B5EC: .4byte 0x00000FAE
_0809B5F0: .4byte 0x06011000
_0809B5F4: .4byte 0x0004000A

	thumb_func_start sub_809B5F8
sub_809B5F8: @ 0x0809B5F8
	push {lr}
	sub sp, #0x10
	adds r2, r0, #0
	ldr r1, _0809B610 @ =gPlaySt
	adds r1, #0x2b
	movs r0, #1
	ldrb r1, [r1]
	ands r0, r1
	cmp r0, #0
	beq _0809B618
	ldr r0, _0809B614 @ =0x00000FAF
	b _0809B61C
	.align 2, 0
_0809B610: .4byte gPlaySt
_0809B614: .4byte 0x00000FAF
_0809B618:
	movs r0, #0xfb
	lsls r0, r0, #4
_0809B61C:
	str r0, [r2, #0x2c]
	movs r3, #1
	rsbs r3, r3, #0
	ldr r0, [r2, #0x2c]
	str r0, [sp]
	ldr r0, _0809B64C @ =0x06011000
	str r0, [sp, #4]
	str r3, [sp, #8]
	str r2, [sp, #0xc]
	movs r0, #0x16
	movs r1, #0x10
	adds r2, r3, #0
	bl sub_8088584
	bl GetCgTextFlags
	adds r1, r0, #0
	ldr r0, _0809B650 @ =0x0006000A
	orrs r0, r1
	bl SetCgTextFlags
	add sp, #0x10
	pop {r0}
	bx r0
	.align 2, 0
_0809B64C: .4byte 0x06011000
_0809B650: .4byte 0x0006000A

	thumb_func_start sub_809B654
sub_809B654: @ 0x0809B654
	push {lr}
	sub sp, #4
	ldr r3, _0809B670 @ =0x00000202
	movs r0, #0
	str r0, [sp]
	movs r0, #0x41
	movs r1, #0xd4
	movs r2, #0x52
	bl sub_8008DA8
	add sp, #4
	pop {r0}
	bx r0
	.align 2, 0
_0809B670: .4byte 0x00000202

	thumb_func_start sub_809B674
sub_809B674: @ 0x0809B674
	push {lr}
	sub sp, #0x10
	adds r2, r0, #0
	ldr r1, _0809B68C @ =gPlaySt
	adds r1, #0x2b
	movs r0, #1
	ldrb r1, [r1]
	ands r0, r1
	cmp r0, #0
	beq _0809B694
	ldr r0, _0809B690 @ =0x00000FB1
	b _0809B696
	.align 2, 0
_0809B68C: .4byte gPlaySt
_0809B690: .4byte 0x00000FB1
_0809B694:
	ldr r0, _0809B6C8 @ =0x00000FB2
_0809B696:
	str r0, [r2, #0x2c]
	movs r3, #1
	rsbs r3, r3, #0
	ldr r0, [r2, #0x2c]
	str r0, [sp]
	ldr r0, _0809B6CC @ =0x06011000
	str r0, [sp, #4]
	str r3, [sp, #8]
	str r2, [sp, #0xc]
	movs r0, #0x16
	movs r1, #0x10
	adds r2, r3, #0
	bl sub_8088584
	bl GetCgTextFlags
	adds r1, r0, #0
	ldr r0, _0809B6D0 @ =0x0004000A
	orrs r0, r1
	bl SetCgTextFlags
	add sp, #0x10
	pop {r0}
	bx r0
	.align 2, 0
_0809B6C8: .4byte 0x00000FB2
_0809B6CC: .4byte 0x06011000
_0809B6D0: .4byte 0x0004000A

	thumb_func_start sub_809B6D4
sub_809B6D4: @ 0x0809B6D4
	push {r4, lr}
	adds r4, r0, #0
	bl EndCgText
	adds r0, r4, #0
	bl EndAllProcChildren
	bl EndMuralBackground_
	movs r0, #0
	bl EndFaceById
	movs r0, #0
	bl SetOnHBlankA
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_809B6F8
sub_809B6F8: @ 0x0809B6F8
	push {r4, lr}
	sub sp, #0x10
	adds r4, r0, #0
	bl sub_8099C44
	str r0, [r4, #0x2c]
	movs r3, #1
	rsbs r3, r3, #0
	str r0, [sp]
	ldr r0, _0809B734 @ =0x06011000
	str r0, [sp, #4]
	str r3, [sp, #8]
	movs r0, #0
	str r0, [sp, #0xc]
	movs r0, #0x16
	movs r1, #0x10
	adds r2, r3, #0
	bl sub_8088584
	bl GetCgTextFlags
	adds r1, r0, #0
	ldr r0, _0809B738 @ =0x0004004E
	orrs r0, r1
	bl SetCgTextFlags
	add sp, #0x10
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0809B734: .4byte 0x06011000
_0809B738: .4byte 0x0004004E

	thumb_func_start sub_809B73C
sub_809B73C: @ 0x0809B73C
	push {r4, r5, lr}
	adds r5, r0, #0
	bl GetTalkChoiceResult
	cmp r0, #1
	bne _0809B78A
	bl sub_8099C60
	adds r4, r0, #0
	bl GetGold
	cmp r0, r4
	blt _0809B780
	cmp r4, #0
	ble _0809B772
	rsbs r0, r4, #0
	bl AddGold
	ldr r0, _0809B77C @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0809B772
	movs r0, #0xb9
	bl m4aSongNumStart
_0809B772:
	adds r0, r5, #0
	movs r1, #0
	bl Proc_Goto
	b _0809B792
	.align 2, 0
_0809B77C: .4byte gPlaySt
_0809B780:
	adds r0, r5, #0
	movs r1, #2
	bl Proc_Goto
	b _0809B792
_0809B78A:
	adds r0, r5, #0
	movs r1, #1
	bl Proc_Goto
_0809B792:
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start sub_809B798
sub_809B798: @ 0x0809B798
	push {r4, lr}
	adds r4, r0, #0
	bl GetTalkChoiceResult
	cmp r0, #1
	bne _0809B7AE
	adds r0, r4, #0
	movs r1, #0
	bl Proc_Goto
	b _0809B7B6
_0809B7AE:
	adds r0, r4, #0
	movs r1, #1
	bl Proc_Goto
_0809B7B6:
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_809B7BC
sub_809B7BC: @ 0x0809B7BC
	push {r4, lr}
	sub sp, #0x10
	adds r4, r0, #0
	bl sub_8099CDC
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0809B7D4
	ldr r0, _0809B7D0 @ =0x00000F61
	b _0809B7D6
	.align 2, 0
_0809B7D0: .4byte 0x00000F61
_0809B7D4:
	ldr r0, _0809B80C @ =0x00000F5F
_0809B7D6:
	str r0, [r4, #0x2c]
	movs r3, #1
	rsbs r3, r3, #0
	ldr r0, [r4, #0x2c]
	str r0, [sp]
	ldr r0, _0809B810 @ =0x06011000
	str r0, [sp, #4]
	str r3, [sp, #8]
	movs r0, #0
	str r0, [sp, #0xc]
	movs r0, #0x16
	movs r1, #0x10
	adds r2, r3, #0
	bl sub_8088584
	bl GetCgTextFlags
	adds r1, r0, #0
	ldr r0, _0809B814 @ =0x0004004E
	orrs r0, r1
	bl SetCgTextFlags
	add sp, #0x10
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0809B80C: .4byte 0x00000F5F
_0809B810: .4byte 0x06011000
_0809B814: .4byte 0x0004004E

	thumb_func_start sub_809B818
sub_809B818: @ 0x0809B818
	push {lr}
	sub sp, #0x10
	movs r1, #0xf6
	lsls r1, r1, #4
	str r1, [r0, #0x2c]
	movs r3, #1
	rsbs r3, r3, #0
	str r1, [sp]
	ldr r0, _0809B850 @ =0x06011000
	str r0, [sp, #4]
	str r3, [sp, #8]
	movs r0, #0
	str r0, [sp, #0xc]
	movs r0, #0x16
	movs r1, #0x10
	adds r2, r3, #0
	bl sub_8088584
	bl GetCgTextFlags
	adds r1, r0, #0
	ldr r0, _0809B854 @ =0x0004004E
	orrs r0, r1
	bl SetCgTextFlags
	add sp, #0x10
	pop {r0}
	bx r0
	.align 2, 0
_0809B850: .4byte 0x06011000
_0809B854: .4byte 0x0004004E

	thumb_func_start sub_809B858
sub_809B858: @ 0x0809B858
	push {lr}
	sub sp, #4
	movs r2, #0x80
	lsls r2, r2, #1
	movs r0, #0
	str r0, [sp]
	movs r0, #0x5e
	adds r1, r2, #0
	movs r3, #0x20
	bl CallSomeSoundMaybe
	add sp, #4
	pop {r0}
	bx r0

	thumb_func_start sub_809B874
sub_809B874: @ 0x0809B874
	push {lr}
	sub sp, #4
	movs r2, #0x80
	lsls r2, r2, #1
	movs r0, #0
	str r0, [sp]
	movs r0, #0x49
	adds r1, r2, #0
	movs r3, #0x20
	bl CallSomeSoundMaybe
	add sp, #4
	pop {r0}
	bx r0

	thumb_func_start sub_809B890
sub_809B890: @ 0x0809B890
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r3, _0809B8C8 @ =gPal + 0x142
	ldr r5, _0809B8CC @ =gPlaySt
	adds r1, r4, #0
	adds r1, #0x2c
	movs r2, #0xe
_0809B89E:
	ldrh r0, [r3]
	strh r0, [r1]
	adds r3, #2
	adds r1, #2
	subs r2, #1
	cmp r2, #0
	bge _0809B89E
	adds r0, r5, #0
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0809B8BE
	movs r0, #0xee
	bl m4aSongNumStart
_0809B8BE:
	movs r0, #0
	strh r0, [r4, #0x2a]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0809B8C8: .4byte gPal + 0x142
_0809B8CC: .4byte gPlaySt

	thumb_func_start sub_809B8D0
sub_809B8D0: @ 0x0809B8D0
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	adds r6, r0, #0
	ldr r0, _0809B964 @ =gPal + 0x142
	mov ip, r0
	ldrh r0, [r6, #0x2a]
	adds r0, #1
	strh r0, [r6, #0x2a]
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x11
	movs r5, #0
	movs r7, #0x1f
	movs r0, #0xf8
	lsls r0, r0, #2
	mov sb, r0
	movs r0, #0xf8
	lsls r0, r0, #7
	mov r8, r0
_0809B8F8:
	lsls r1, r5, #1
	adds r0, r6, #0
	adds r0, #0x2c
	adds r0, r0, r1
	ldrh r1, [r0]
	movs r0, #0x1f
	ands r0, r1
	adds r3, r0, r4
	mov r0, sb
	ands r0, r1
	lsrs r0, r0, #5
	adds r2, r0, r4
	mov r0, r8
	ands r0, r1
	lsrs r0, r0, #0xa
	adds r0, r0, r4
	cmp r3, #0x1f
	ble _0809B91E
	movs r3, #0x1f
_0809B91E:
	cmp r2, #0x1f
	ble _0809B924
	movs r2, #0x1f
_0809B924:
	cmp r0, #0x1f
	ble _0809B92A
	movs r0, #0x1f
_0809B92A:
	ands r3, r7
	ands r2, r7
	lsls r1, r2, #5
	adds r1, r3, r1
	ands r0, r7
	lsls r0, r0, #0xa
	adds r1, r1, r0
	mov r0, ip
	strh r1, [r0]
	movs r0, #2
	add ip, r0
	adds r5, #1
	cmp r5, #0xe
	ble _0809B8F8
	bl EnablePalSync
	ldrh r0, [r6, #0x2a]
	cmp r0, #0x10
	bne _0809B956
	adds r0, r6, #0
	bl Proc_Break
_0809B956:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0809B964: .4byte gPal + 0x142

	thumb_func_start sub_809B968
sub_809B968: @ 0x0809B968
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	adds r6, r0, #0
	ldr r0, _0809B9FC @ =gPal + 0x142
	mov ip, r0
	ldrh r0, [r6, #0x2a]
	subs r0, #1
	strh r0, [r6, #0x2a]
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x11
	movs r5, #0
	movs r7, #0x1f
	movs r0, #0xf8
	lsls r0, r0, #2
	mov sb, r0
	movs r0, #0xf8
	lsls r0, r0, #7
	mov r8, r0
_0809B990:
	lsls r1, r5, #1
	adds r0, r6, #0
	adds r0, #0x2c
	adds r0, r0, r1
	ldrh r1, [r0]
	movs r0, #0x1f
	ands r0, r1
	adds r3, r0, r4
	mov r0, sb
	ands r0, r1
	lsrs r0, r0, #5
	adds r2, r0, r4
	mov r0, r8
	ands r0, r1
	lsrs r0, r0, #0xa
	adds r0, r0, r4
	cmp r3, #0x1f
	ble _0809B9B6
	movs r3, #0x1f
_0809B9B6:
	cmp r2, #0x1f
	ble _0809B9BC
	movs r2, #0x1f
_0809B9BC:
	cmp r0, #0x1f
	ble _0809B9C2
	movs r0, #0x1f
_0809B9C2:
	ands r3, r7
	ands r2, r7
	lsls r1, r2, #5
	adds r1, r3, r1
	ands r0, r7
	lsls r0, r0, #0xa
	adds r1, r1, r0
	mov r0, ip
	strh r1, [r0]
	movs r0, #2
	add ip, r0
	adds r5, #1
	cmp r5, #0xe
	ble _0809B990
	bl EnablePalSync
	ldrh r0, [r6, #0x2a]
	cmp r0, #0
	bne _0809B9EE
	adds r0, r6, #0
	bl Proc_Break
_0809B9EE:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0809B9FC: .4byte gPal + 0x142

	thumb_func_start sub_809BA00
sub_809BA00: @ 0x0809BA00
	push {lr}
	adds r1, r0, #0
	ldr r0, _0809BA10 @ =gUnk_08D8DCD4
	bl Proc_StartBlocking
	pop {r0}
	bx r0
	.align 2, 0
_0809BA10: .4byte gUnk_08D8DCD4

	thumb_func_start sub_809BA14
sub_809BA14: @ 0x0809BA14
	ldr r0, _0809BA1C @ =0x02012BF8
	ldr r0, [r0]
	bx lr
	.align 2, 0
_0809BA1C: .4byte 0x02012BF8

	thumb_func_start GetNextSupportScreenUnit
GetNextSupportScreenUnit: @ 0x0809BA20
	adds r1, r0, #0
	ldr r0, _0809BA30 @ =0x02012BF8
	ldr r0, [r0]
	subs r0, #1
	cmp r1, r0
	bge _0809BA34
	adds r0, r1, #1
	b _0809BA36
	.align 2, 0
_0809BA30: .4byte 0x02012BF8
_0809BA34:
	movs r0, #0
_0809BA36:
	bx lr

	thumb_func_start sub_809BA38
sub_809BA38: @ 0x0809BA38
	cmp r0, #0
	bne _0809BA40
	ldr r0, _0809BA44 @ =0x02012BF8
	ldr r0, [r0]
_0809BA40:
	subs r0, #1
	bx lr
	.align 2, 0
_0809BA44: .4byte 0x02012BF8

	thumb_func_start sub_809BA48
sub_809BA48: @ 0x0809BA48
	ldr r2, _0809BA5C @ =gUnk_08D8DD0C
	ldr r3, [r2]
	lsls r2, r0, #1
	adds r2, r2, r0
	lsls r2, r2, #3
	adds r2, r2, r3
	adds r2, #2
	adds r2, r2, r1
	ldrb r0, [r2]
	bx lr
	.align 2, 0
_0809BA5C: .4byte gUnk_08D8DD0C

	thumb_func_start sub_809BA60
sub_809BA60: @ 0x0809BA60
	ldr r2, _0809BA74 @ =gUnk_08D8DD0C
	ldr r3, [r2]
	lsls r2, r0, #1
	adds r2, r2, r0
	lsls r2, r2, #3
	adds r2, r2, r3
	adds r2, #9
	adds r2, r2, r1
	ldrb r0, [r2]
	bx lr
	.align 2, 0
_0809BA74: .4byte gUnk_08D8DD0C

	thumb_func_start sub_809BA78
sub_809BA78: @ 0x0809BA78
	ldr r2, _0809BA90 @ =gUnk_08D8DD0C
	ldr r3, [r2]
	lsls r2, r0, #1
	adds r2, r2, r0
	lsls r2, r2, #3
	adds r2, r2, r3
	adds r2, #0x10
	adds r2, r2, r1
	movs r0, #0
	ldrsb r0, [r2, r0]
	bx lr
	.align 2, 0
_0809BA90: .4byte gUnk_08D8DD0C

	thumb_func_start sub_809BA94
sub_809BA94: @ 0x0809BA94
	push {r4, r5, lr}
	adds r5, r1, #0
	ldr r4, _0809BAB4 @ =gCharacterData
	bl sub_809BAB8
	subs r0, #1
	movs r1, #0x34
	muls r0, r1, r0
	adds r4, #0x2c
	adds r0, r0, r4
	ldr r0, [r0]
	adds r0, r0, r5
	ldrb r0, [r0]
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_0809BAB4: .4byte gCharacterData

	thumb_func_start sub_809BAB8
sub_809BAB8: @ 0x0809BAB8
	ldr r1, _0809BAC8 @ =gUnk_08D8DD0C
	ldr r2, [r1]
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #3
	adds r1, r1, r2
	ldrb r0, [r1]
	bx lr
	.align 2, 0
_0809BAC8: .4byte gUnk_08D8DD0C

	thumb_func_start sub_809BACC
sub_809BACC: @ 0x0809BACC
	ldr r1, _0809BADC @ =gUnk_08D8DD0C
	ldr r2, [r1]
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #3
	adds r1, r1, r2
	ldrb r0, [r1, #1]
	bx lr
	.align 2, 0
_0809BADC: .4byte gUnk_08D8DD0C

	thumb_func_start GetSupportClassForCharId
GetSupportClassForCharId: @ 0x0809BAE0
	push {r4, r5, lr}
	adds r5, r0, #0
	movs r4, #1
_0809BAE6:
	adds r0, r4, #0
	bl GetUnit
	adds r2, r0, #0
	cmp r2, #0
	beq _0809BB14
	ldr r3, [r2]
	cmp r3, #0
	beq _0809BB14
	ldr r0, [r2, #0xc]
	ldr r1, _0809BB10 @ =0x00010004
	ands r0, r1
	cmp r0, #0
	bne _0809BB14
	ldrb r0, [r3, #4]
	cmp r0, r5
	bne _0809BB14
	ldr r0, [r2, #4]
	ldrb r0, [r0, #4]
	b _0809BB26
	.align 2, 0
_0809BB10: .4byte 0x00010004
_0809BB14:
	adds r4, #1
	cmp r4, #0x3f
	ble _0809BAE6
	ldr r2, _0809BB2C @ =gCharacterData
	subs r1, r5, #1
	movs r0, #0x34
	muls r0, r1, r0
	adds r0, r0, r2
	ldrb r0, [r0, #5]
_0809BB26:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_0809BB2C: .4byte gCharacterData

	thumb_func_start sub_809BB30
sub_809BB30: @ 0x0809BB30
	adds r2, r0, #0
	ldr r1, _0809BB38 @ =gUnk_08D67934
	b _0809BB4E
	.align 2, 0
_0809BB38: .4byte gUnk_08D67934
_0809BB3C:
	ldrb r0, [r1]
	cmp r0, r2
	beq _0809BB48
	ldrb r0, [r1, #1]
	cmp r0, r2
	bne _0809BB4C
_0809BB48:
	movs r0, #1
	b _0809BB56
_0809BB4C:
	adds r1, #0x14
_0809BB4E:
	ldrb r0, [r1]
	cmp r0, #0
	bne _0809BB3C
	movs r0, #0
_0809BB56:
	bx lr

	thumb_func_start sub_809BB58
sub_809BB58: @ 0x0809BB58
	push {r4, r5, r6, lr}
	ldr r6, _0809BB60 @ =gUnk_08D67934
	b _0809BB8C
	.align 2, 0
_0809BB60: .4byte gUnk_08D67934
_0809BB64:
	ldrb r0, [r6]
	movs r1, #0
	bl sub_809F908
	ldrb r0, [r6, #1]
	movs r1, #0
	bl sub_809F908
	ldrb r4, [r6]
	ldrb r5, [r6, #1]
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_809F5FC
	adds r2, r0, #0
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_809F88C
	adds r6, #0x14
_0809BB8C:
	ldrb r0, [r6]
	cmp r0, #0
	bne _0809BB64
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	thumb_func_start sub_809BB98
sub_809BB98: @ 0x0809BB98
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x90
	adds r4, r0, #0
	mov r1, sp
	movs r0, #0
	strh r0, [r1]
	ldr r7, _0809BD18 @ =gUnk_08D8DD0C
	ldr r1, [r7]
	ldr r2, _0809BD1C @ =0x01000600
	mov r0, sp
	bl CpuSet
	ldr r5, _0809BD20 @ =0x02012BF8
	movs r1, #0
	str r1, [r5]
	adds r4, #0x42
	movs r0, #0
	ldrsb r0, [r4, r0]
	cmp r0, #0
	bne _0809BBCA
	b _0809BD30
_0809BBCA:
	add r0, sp, #0x24
	strh r1, [r0]
	add r1, sp, #4
	ldr r2, _0809BD24 @ =0x01000010
	bl CpuSet
	movs r4, #1
_0809BBD8:
	adds r0, r4, #0
	bl GetUnit
	cmp r0, #0
	beq _0809BC08
	ldr r2, [r0]
	cmp r2, #0
	beq _0809BC08
	ldr r0, [r0, #0xc]
	ldr r1, _0809BD28 @ =0x00010004
	ands r0, r1
	cmp r0, #0
	bne _0809BC08
	ldrb r1, [r2, #4]
	lsrs r2, r1, #5
	lsls r2, r2, #2
	add r2, sp
	movs r0, #0x1f
	ands r0, r1
	movs r1, #1
	lsls r1, r0
	ldr r0, [r2, #4]
	orrs r0, r1
	str r0, [r2, #4]
_0809BC08:
	adds r4, #1
	cmp r4, #0x3f
	ble _0809BBD8
	movs r4, #1
	ldr r0, _0809BD20 @ =0x02012BF8
	mov sl, r0
_0809BC14:
	adds r0, r4, #0
	bl GetUnit
	adds r5, r0, #0
	adds r4, #1
	str r4, [sp, #0x8c]
	cmp r5, #0
	beq _0809BD0E
	ldr r2, [r5]
	cmp r2, #0
	beq _0809BD0E
	ldr r0, [r5, #0xc]
	ldr r1, _0809BD28 @ =0x00010004
	ands r0, r1
	cmp r0, #0
	bne _0809BD0E
	ldrb r0, [r2, #4]
	bl sub_809CEA8
	cmp r0, #0
	beq _0809BD0E
	mov r0, sl
	ldr r1, [r0]
	ldr r0, _0809BD18 @ =gUnk_08D8DD0C
	ldr r2, [r0]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r0, r0, r2
	ldr r1, [r5]
	ldrb r1, [r1, #4]
	strb r1, [r0]
	mov r0, sl
	ldr r1, [r0]
	ldr r0, _0809BD18 @ =gUnk_08D8DD0C
	ldr r2, [r0]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r0, r0, r2
	ldr r1, [r5, #4]
	ldrb r1, [r1, #4]
	strb r1, [r0, #1]
	movs r6, #0
	ldr r0, [r5]
	ldrb r1, [r0, #4]
	subs r1, #1
	movs r0, #0x34
	muls r0, r1, r0
	ldr r1, _0809BD2C @ =0x08C4C184
	adds r0, r0, r1
	ldr r0, [r0]
	ldrb r0, [r0, #0x15]
	cmp r6, r0
	bge _0809BD06
	ldr r7, _0809BD20 @ =0x02012BF8
	ldr r0, _0809BD18 @ =gUnk_08D8DD0C
	mov r8, r0
_0809BC88:
	ldr r0, [r7]
	adds r1, r6, #0
	bl sub_809BA94
	adds r4, r0, #0
	adds r0, r5, #0
	adds r1, r6, #0
	bl GetUnitSupportLevel
	ldr r2, [r7]
	mov r1, r8
	ldr r3, [r1]
	lsls r1, r2, #1
	adds r1, r1, r2
	lsls r1, r1, #3
	adds r1, r1, r3
	adds r1, #2
	adds r1, r1, r6
	strb r0, [r1]
	adds r0, r4, #0
	bl GetSupportClassForCharId
	ldr r2, [r7]
	mov r1, r8
	ldr r3, [r1]
	lsls r1, r2, #1
	adds r1, r1, r2
	lsls r1, r1, #3
	adds r1, r1, r3
	adds r1, #9
	adds r1, r1, r6
	strb r0, [r1]
	ldr r0, [r7]
	mov r1, r8
	ldr r2, [r1]
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #3
	adds r1, r1, r2
	adds r1, #0x10
	add r1, sb
	asrs r0, r4, #5
	lsls r0, r0, #2
	add r0, sp
	movs r2, #0x1f
	ands r2, r4
	ldr r0, [r0, #4]
	lsrs r0, r2
	movs r2, #1
	ands r0, r2
	strb r0, [r1]
	adds r6, #1
	ldr r0, [r5]
	ldrb r1, [r0, #4]
	subs r1, #1
	movs r0, #0x34
	muls r0, r1, r0
	ldr r1, _0809BD2C @ =0x08C4C184
	adds r0, r0, r1
	ldr r0, [r0]
	ldrb r0, [r0, #0x15]
	cmp r6, r0
	blt _0809BC88
_0809BD06:
	mov r1, sl
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
_0809BD0E:
	ldr r4, [sp, #0x8c]
	cmp r4, #0x3f
	bgt _0809BD16
	b _0809BC14
_0809BD16:
	b _0809BE06
	.align 2, 0
_0809BD18: .4byte gUnk_08D8DD0C
_0809BD1C: .4byte 0x01000600
_0809BD20: .4byte 0x02012BF8
_0809BD24: .4byte 0x01000010
_0809BD28: .4byte 0x00010004
_0809BD2C: .4byte 0x08C4C184
_0809BD30:
	add r4, sp, #0x28
	adds r0, r4, #0
	bl ReadGlobalSaveInfo
	ldr r0, _0809BDA8 @ =0x00000569
	bl DecodeMsg
	bl SetTacticianName
	movs r6, #0
	add r0, sp, #0x28
	mov sl, r0
	ldr r1, _0809BDAC @ =gCharacterData
	mov r8, r1
_0809BD4C:
	adds r0, r6, #0
	mov r1, sl
	bl sub_809F950
	lsls r0, r0, #0x18
	adds r4, r6, #1
	cmp r0, #0
	beq _0809BE00
	adds r0, r6, #0
	bl sub_809CEA8
	cmp r0, #0
	beq _0809BE00
	ldr r1, [r5]
	ldr r2, [r7]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r0, r0, r2
	strb r6, [r0]
	ldr r0, [r5]
	ldr r2, [r7]
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #3
	adds r1, r1, r2
	subs r2, r6, #1
	movs r0, #0x34
	muls r0, r2, r0
	add r0, r8
	ldrb r0, [r0, #5]
	strb r0, [r1, #1]
	ldr r1, [r5]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #3
	ldr r1, [r7]
	adds r1, r1, r0
	adds r1, #2
	adds r0, r6, #0
	mov r2, sl
	bl sub_809F770
	movs r0, #0
	mov sb, r0
	b _0809BDF0
	.align 2, 0
_0809BDA8: .4byte 0x00000569
_0809BDAC: .4byte gCharacterData
_0809BDB0:
	ldr r0, [r5]
	mov r1, sb
	bl sub_809BA94
	ldr r1, [r5]
	ldr r3, [r7]
	lsls r2, r1, #1
	adds r2, r2, r1
	lsls r2, r2, #3
	adds r2, r2, r3
	adds r2, #9
	add r2, sb
	subs r3, r0, #1
	movs r1, #0x34
	muls r1, r3, r1
	add r1, r8
	ldrb r1, [r1, #5]
	strb r1, [r2]
	add r1, sp, #0x28
	bl sub_809F950
	ldr r2, [r5]
	ldr r3, [r7]
	lsls r1, r2, #1
	adds r1, r1, r2
	lsls r1, r1, #3
	adds r1, r1, r3
	adds r1, #0x10
	add r1, sb
	strb r0, [r1]
	movs r1, #1
	add sb, r1
_0809BDF0:
	adds r0, r6, #0
	bl sub_809CEA8
	cmp sb, r0
	blt _0809BDB0
	ldr r0, [r5]
	adds r0, #1
	str r0, [r5]
_0809BE00:
	adds r6, r4, #0
	cmp r6, #0xff
	ble _0809BD4C
_0809BE06:
	add sp, #0x90
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_809BE18
sub_809BE18: @ 0x0809BE18
	push {r4, r5, lr}
	adds r0, #0x42
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _0809BE4C
	movs r4, #1
_0809BE28:
	adds r0, r4, #0
	bl GetUnit
	adds r1, r0, #0
	cmp r1, #0
	beq _0809BE44
	ldr r0, [r1]
	cmp r0, #0
	beq _0809BE44
	adds r0, r1, #0
	bl GetUnitSMSId
	bl StartUiSMS
_0809BE44:
	adds r4, #1
	cmp r4, #0x3f
	ble _0809BE28
	b _0809BE74
_0809BE4C:
	movs r4, #0
	ldr r0, _0809BE80 @ =0x02012BF8
	ldr r0, [r0]
	cmp r4, r0
	bge _0809BE74
	movs r5, #0
_0809BE58:
	ldr r0, _0809BE84 @ =gUnk_08D8DD0C
	ldr r0, [r0]
	adds r0, r5, r0
	ldrb r0, [r0, #1]
	bl GetClassSMSId
	bl StartUiSMS
	adds r5, #0x18
	adds r4, #1
	ldr r0, _0809BE80 @ =0x02012BF8
	ldr r0, [r0]
	cmp r4, r0
	blt _0809BE58
_0809BE74:
	bl ForceSyncUnitSpriteSheet
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0809BE80: .4byte 0x02012BF8
_0809BE84: .4byte gUnk_08D8DD0C

	thumb_func_start sub_809BE88
sub_809BE88: @ 0x0809BE88
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	movs r6, #0
	movs r4, #0
	ldr r7, _0809BE94 @ =0x08C4C184
	b _0809BEA4
	.align 2, 0
_0809BE94: .4byte 0x08C4C184
_0809BE98:
	adds r0, r5, #0
	adds r1, r4, #0
	bl sub_809BA48
	adds r6, r6, r0
	adds r4, #1
_0809BEA4:
	adds r0, r5, #0
	bl sub_809BAB8
	subs r0, #1
	movs r1, #0x34
	muls r0, r1, r0
	adds r0, r0, r7
	ldr r0, [r0]
	ldrb r0, [r0, #0x15]
	cmp r4, r0
	blt _0809BE98
	adds r0, r6, #0
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_809BEC4
sub_809BEC4: @ 0x0809BEC4
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	adds r6, r1, #0
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0809BEE0
	adds r0, r6, #0
	bl sub_809BE88
	cmp r0, #5
	beq _0809BF22
	b _0809BF28
_0809BEE0:
	movs r0, #0
	mov r8, r0
	adds r0, r6, #0
	bl sub_809BE88
	mov sb, r0
	adds r0, r6, #0
	bl sub_809BAB8
	bl sub_809CEA8
	adds r7, r0, #0
	movs r5, #0
	cmp r8, r7
	bge _0809BF1E
_0809BEFE:
	adds r0, r6, #0
	bl sub_809BAB8
	adds r4, r0, #0
	adds r0, r6, #0
	adds r1, r5, #0
	bl sub_809BA94
	adds r1, r0, #0
	adds r0, r4, #0
	bl sub_809F5FC
	add r8, r0
	adds r5, #1
	cmp r5, r7
	blt _0809BEFE
_0809BF1E:
	cmp r8, sb
	bne _0809BF26
_0809BF22:
	movs r0, #2
	b _0809BF32
_0809BF26:
	mov r0, sb
_0809BF28:
	cmp r0, #0
	beq _0809BF30
	movs r0, #1
	b _0809BF32
_0809BF30:
	movs r0, #0
_0809BF32:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_809BF40
sub_809BF40: @ 0x0809BF40
	push {r4, r5, lr}
	ldr r4, _0809BFA8 @ =0x02012A90
	bl sub_809F6CC
	adds r5, r0, #0
	adds r4, #8
	adds r0, r4, #0
	bl ClearText
	movs r2, #0
	cmp r5, #0x64
	bne _0809BF5A
	movs r2, #4
_0809BF5A:
	ldr r3, _0809BFAC @ =gUnk_0842D1FC
	adds r0, r4, #0
	movs r1, #0
	bl Text_InsertDrawString
	adds r0, r4, #0
	movs r1, #0x30
	bl Text_SetCursor
	movs r1, #2
	cmp r5, #0x64
	bne _0809BF74
	movs r1, #4
_0809BF74:
	adds r0, r4, #0
	bl Text_SetColor
	adds r0, r4, #0
	adds r1, r5, #0
	bl Text_DrawNumberOrBlank
	movs r2, #0
	cmp r5, #0x64
	bne _0809BF8A
	movs r2, #4
_0809BF8A:
	ldr r3, _0809BFB0 @ =gUnk_0842D204
	adds r0, r4, #0
	movs r1, #0x38
	bl Text_InsertDrawString
	ldr r1, _0809BFB4 @ =gBg0Tm + 0x4a8
	adds r0, r4, #0
	bl PutText
	movs r0, #1
	bl EnableBgSync
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0809BFA8: .4byte 0x02012A90
_0809BFAC: .4byte gUnk_0842D1FC
_0809BFB0: .4byte gUnk_0842D204
_0809BFB4: .4byte gBg0Tm + 0x4a8

	thumb_func_start sub_809BFB8
sub_809BFB8: @ 0x0809BFB8
	movs r1, #0
	str r1, [r0, #0x2c]
	adds r2, r0, #0
	adds r2, #0x40
	strb r1, [r2]
	str r1, [r0, #0x34]
	str r1, [r0, #0x38]
	subs r1, #1
	str r1, [r0, #0x3c]
	bx lr

	thumb_func_start sub_809BFCC
sub_809BFCC: @ 0x0809BFCC
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	mov r8, r0
	bl sub_809BA14
	adds r7, r0, #0
	movs r6, #0
	cmp r6, r7
	bge _0809C026
_0809BFE2:
	adds r0, r6, #0
	movs r1, #3
	bl __divsi3
	lsls r0, r0, #4
	mov r2, r8
	ldr r1, [r2, #0x34]
	subs r1, #0x4c
	subs r5, r0, r1
	adds r0, r6, #0
	movs r1, #3
	bl __modsi3
	lsls r0, r0, #6
	adds r4, r0, #0
	adds r4, #0x18
	adds r0, r5, #0
	subs r0, #0x4c
	cmp r0, #0x30
	bhi _0809C020
	adds r0, r6, #0
	bl sub_809BACC
	str r0, [sp]
	movs r0, #0
	adds r1, r4, #0
	adds r2, r5, #0
	movs r3, #0xc8
	lsls r3, r3, #8
	bl sub_8026628
_0809C020:
	adds r6, #1
	cmp r6, r7
	blt _0809BFE2
_0809C026:
	bl sub_80259A4
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_809C038
sub_809C038: @ 0x0809C038
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x3c]
	movs r1, #1
	rsbs r1, r1, #0
	cmp r0, r1
	beq _0809C0C0
	str r0, [r4, #0x38]
	str r1, [r4, #0x3c]
	movs r1, #3
	bl __divsi3
	adds r1, r0, #0
	ldr r0, [r4, #0x34]
	cmp r0, #0
	bge _0809C05A
	adds r0, #0xf
_0809C05A:
	asrs r0, r0, #4
	subs r0, r1, r0
	lsls r0, r0, #4
	adds r0, #0x4c
	cmp r0, #0x4c
	bgt _0809C074
	cmp r1, #0
	bne _0809C06E
	str r1, [r4, #0x34]
	b _0809C074
_0809C06E:
	subs r0, r1, #1
	lsls r0, r0, #4
	str r0, [r4, #0x34]
_0809C074:
	ldr r0, [r4, #0x38]
	movs r1, #3
	bl __divsi3
	adds r5, r0, #0
	ldr r0, [r4, #0x34]
	cmp r0, #0
	bge _0809C086
	adds r0, #0xf
_0809C086:
	asrs r0, r0, #4
	subs r0, r5, r0
	lsls r0, r0, #4
	adds r0, #0x4c
	cmp r0, #0x7b
	ble _0809C0C0
	bl sub_809BA14
	subs r0, #1
	movs r1, #3
	bl __divsi3
	cmp r5, r0
	bne _0809C0B2
	bl sub_809BA14
	subs r0, #1
	movs r1, #3
	bl __divsi3
	subs r0, #3
	b _0809C0BC
_0809C0B2:
	ldr r0, [r4, #0x38]
	movs r1, #3
	bl __divsi3
	subs r0, #2
_0809C0BC:
	lsls r0, r0, #4
	str r0, [r4, #0x34]
_0809C0C0:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_809C0C8
sub_809C0C8: @ 0x0809C0C8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	adds r7, r0, #0
	ldr r4, _0809C2F8 @ =gDispIo
	movs r0, #8
	rsbs r0, r0, #0
	ldrb r1, [r4]
	ands r0, r1
	strb r0, [r4]
	movs r0, #0
	bl InitBgs
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
	movs r1, #4
	rsbs r1, r1, #0
	adds r0, r1, #0
	ldrb r2, [r4, #0xc]
	ands r0, r2
	strb r0, [r4, #0xc]
	movs r2, #3
	ldrb r0, [r4, #0x10]
	orrs r0, r2
	strb r0, [r4, #0x10]
	ldrb r5, [r4, #0x14]
	ands r1, r5
	movs r0, #1
	orrs r1, r0
	strb r1, [r4, #0x14]
	ldrb r0, [r4, #0x18]
	orrs r2, r0
	strb r2, [r4, #0x18]
	bl InitFaces
	bl ResetText
	bl InitIcons
	bl UnpackUiWindowFrameGraphics
	bl ApplySystemObjectsGraphics
	movs r0, #0xe
	bl ApplyIconPalettes
	adds r0, r7, #0
	bl sub_809C038
	movs r0, #0
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	movs r0, #1
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	ldr r1, _0809C2FC @ =0x0000FFD8
	ldr r2, [r7, #0x34]
	subs r2, #0x4c
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	movs r0, #2
	bl SetBgOffset
	bl PrepRestartMuralBackground
	bl ApplyUnitSpritePalettes
	bl ResetUnitSprites
	adds r0, r7, #0
	bl sub_809BE18
	movs r0, #0xa0
	lsls r0, r0, #7
	movs r1, #5
	bl sub_809228C
	ldr r0, _0809C300 @ =gBg1Tm
	ldr r1, _0809C304 @ =gUnk_0842BF0C
	movs r2, #0xa5
	lsls r2, r2, #7
	bl TmApplyTsa_thm
	movs r0, #7
	bl EnableBgSync
	bl sub_809BA14
	cmp r0, #0
	beq _0809C1EE
	adds r0, r7, #0
	bl ResetSysHandCursor
	movs r0, #0xc0
	lsls r0, r0, #3
	movs r1, #1
	bl DisplaySysHandCursorTextShadow
	ldr r4, [r7, #0x38]
	adds r0, r4, #0
	movs r1, #3
	bl __modsi3
	lsls r0, r0, #6
	adds r5, r0, #0
	adds r5, #0x14
	adds r0, r4, #0
	movs r1, #3
	bl __divsi3
	ldr r1, [r7, #0x34]
	cmp r1, #0
	bge _0809C1DA
	adds r1, #0xf
_0809C1DA:
	asrs r1, r1, #4
	subs r1, r0, r1
	lsls r1, r1, #4
	adds r1, #0x4c
	movs r3, #0x80
	lsls r3, r3, #4
	adds r0, r5, #0
	movs r2, #7
	bl ShowSysHandCursor
_0809C1EE:
	ldr r1, _0809C2F8 @ =gDispIo
	mov ip, r1
	movs r6, #0x20
	ldrb r0, [r1, #1]
	orrs r0, r6
	movs r1, #0x41
	rsbs r1, r1, #0
	ands r0, r1
	movs r1, #0x7f
	ands r0, r1
	mov r2, ip
	strb r0, [r2, #1]
	mov r0, ip
	adds r0, #0x2d
	movs r5, #0
	mov r8, r5
	mov r1, r8
	strb r1, [r0]
	mov r1, ip
	adds r1, #0x31
	movs r0, #0x4c
	strb r0, [r1]
	subs r1, #5
	movs r0, #0xf0
	strb r0, [r1]
	adds r1, #4
	movs r0, #0x8c
	strb r0, [r1]
	movs r2, #0x34
	add r2, ip
	mov sb, r2
	movs r0, #1
	ldrb r1, [r2]
	orrs r1, r0
	movs r5, #2
	orrs r1, r5
	movs r2, #4
	orrs r1, r2
	movs r4, #8
	orrs r1, r4
	movs r3, #0x10
	orrs r1, r3
	movs r2, #0x36
	add r2, ip
	mov sl, r2
	ldrb r5, [r2]
	orrs r0, r5
	movs r2, #2
	orrs r0, r2
	subs r2, #7
	ands r0, r2
	orrs r0, r4
	orrs r0, r3
	orrs r1, r6
	mov r5, sb
	strb r1, [r5]
	orrs r0, r6
	mov r1, sl
	strb r0, [r1]
	mov r1, ip
	adds r1, #0x3c
	movs r0, #0xc0
	ldrb r2, [r1]
	orrs r0, r2
	strb r0, [r1]
	mov r0, ip
	adds r0, #0x44
	mov r5, r8
	strb r5, [r0]
	adds r0, #1
	strb r5, [r0]
	adds r1, #0xa
	movs r0, #0x10
	strb r0, [r1]
	ldr r0, _0809C308 @ =0x0000FFE0
	mov r1, ip
	ldrh r1, [r1, #0x3c]
	ands r0, r1
	movs r1, #0x1f
	orrs r0, r1
	mov r2, ip
	strh r0, [r2, #0x3c]
	adds r6, r7, #0
	adds r6, #0x42
	movs r5, #0x43
	adds r5, r5, r7
	mov r8, r5
	ldr r5, _0809C30C @ =0x020129A8
	movs r4, #0xe
_0809C2A0:
	adds r0, r5, #0
	movs r1, #5
	bl InitText
	adds r5, #8
	subs r4, #1
	cmp r4, #0
	bge _0809C2A0
	ldr r4, _0809C310 @ =0x02012A90
	adds r0, r4, #0
	movs r1, #4
	bl InitText
	adds r4, #8
	adds r0, r4, #0
	movs r1, #9
	bl InitText
	bl sub_809BF40
	movs r3, #0xa
	rsbs r3, r3, #0
	ldr r0, _0809C314 @ =0x00000901
	str r0, [sp]
	movs r0, #0
	movs r1, #0x41
	movs r2, #0x38
	bl StartBmFace
	movs r0, #0x28
	movs r1, #0
	movs r2, #1
	bl InitTalk
	ldr r0, _0809C318 @ =Img_SysBlackBox
	ldr r1, _0809C31C @ =0x06017800
	bl Decompress
	movs r0, #0
	ldrsb r0, [r6, r0]
	cmp r0, #0
	beq _0809C324
	ldr r0, _0809C320 @ =0x00000F4B
	b _0809C326
	.align 2, 0
_0809C2F8: .4byte gDispIo
_0809C2FC: .4byte 0x0000FFD8
_0809C300: .4byte gBg1Tm
_0809C304: .4byte gUnk_0842BF0C
_0809C308: .4byte 0x0000FFE0
_0809C30C: .4byte 0x020129A8
_0809C310: .4byte 0x02012A90
_0809C314: .4byte 0x00000901
_0809C318: .4byte Img_SysBlackBox
_0809C31C: .4byte 0x06017800
_0809C320: .4byte 0x00000F4B
_0809C324:
	ldr r0, _0809C378 @ =0x00000FB5
_0809C326:
	str r0, [r7, #0x30]
	ldr r0, _0809C37C @ =sub_809BFCC
	adds r1, r7, #0
	bl StartParallelWorker
	adds r0, r7, #0
	bl sub_8090DD0
	movs r0, #0x80
	lsls r0, r0, #2
	movs r1, #4
	bl sub_8090E38
	movs r0, #0xd8
	movs r1, #0x54
	bl sub_8090DE4
	ldrh r4, [r7, #0x34]
	bl sub_809BA14
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
	bl sub_8090E04
	bl sub_8090DA0
	ldr r1, [r7, #0x34]
	cmp r1, #0
	bge _0809C374
	adds r1, #0xf
_0809C374:
	asrs r4, r1, #4
	b _0809C38A
	.align 2, 0
_0809C378: .4byte 0x00000FB5
_0809C37C: .4byte sub_809BFCC
_0809C380:
	adds r0, r7, #0
	adds r1, r4, #0
	bl sub_809C838
	adds r4, #1
_0809C38A:
	ldr r0, [r7, #0x34]
	cmp r0, #0
	bge _0809C392
	adds r0, #0xf
_0809C392:
	asrs r0, r0, #4
	adds r0, #4
	cmp r4, r0
	blt _0809C380
	adds r0, r7, #0
	bl StartGreenText
	movs r0, #0
	mov r1, r8
	strb r0, [r1]
	ldr r0, _0809C3E4 @ =0x06014800
	movs r1, #0xa
	bl LoadHelpBoxGfx
	ldr r2, _0809C3E8 @ =gDispIo
	movs r0, #1
	ldrb r5, [r2, #1]
	orrs r0, r5
	movs r1, #2
	orrs r0, r1
	movs r1, #4
	orrs r0, r1
	movs r1, #8
	orrs r0, r1
	movs r1, #0x10
	orrs r0, r1
	strb r0, [r2, #1]
	movs r0, #0x10
	movs r1, #0x8c
	adds r2, r7, #0
	bl StartHelpPromptSprite
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0809C3E4: .4byte 0x06014800
_0809C3E8: .4byte gDispIo

	thumb_func_start sub_809C3EC
sub_809C3EC: @ 0x0809C3EC
	push {r4, lr}
	adds r4, r0, #0
	bl EndCgText
	adds r0, r4, #0
	bl EndAllProcChildren
	bl EndMuralBackground_
	movs r0, #0
	bl EndFaceById
	movs r0, #0
	bl SetOnHBlankA
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_809C410
sub_809C410: @ 0x0809C410
	push {lr}
	sub sp, #0x10
	ldr r0, [r0, #0x30]
	str r0, [sp]
	ldr r0, _0809C440 @ =0x06013000
	str r0, [sp, #4]
	movs r0, #1
	rsbs r0, r0, #0
	str r0, [sp, #8]
	movs r0, #0
	str r0, [sp, #0xc]
	movs r0, #0xa
	movs r1, #7
	movs r2, #0x11
	movs r3, #4
	bl sub_8088584
	ldr r0, _0809C444 @ =0x000008FC
	bl SetCgTextFlags
	add sp, #0x10
	pop {r0}
	bx r0
	.align 2, 0
_0809C440: .4byte 0x06013000
_0809C444: .4byte 0x000008FC

	thumb_func_start sub_809C448
sub_809C448: @ 0x0809C448
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	adds r6, r0, #0
	bl sub_809BA14
	cmp r0, #0
	bne _0809C45E
	b _0809C770
_0809C45E:
	adds r0, r6, #0
	adds r0, #0x40
	movs r4, #0
	ldrsb r4, [r0, r4]
	mov r8, r0
	cmp r4, #0
	beq _0809C46E
	b _0809C6FC
_0809C46E:
	ldr r0, [r6, #0x38]
	mov sl, r0
	ldr r3, _0809C4B8 @ =gpKeySt
	ldr r1, [r3]
	ldrh r5, [r1, #6]
	adds r2, r6, #0
	adds r2, #0x41
	movs r0, #4
	strb r0, [r2]
	movs r0, #0x80
	lsls r0, r0, #2
	ldrh r7, [r1, #4]
	ands r0, r7
	cmp r0, #0
	beq _0809C492
	ldrh r5, [r1, #4]
	movs r0, #8
	strb r0, [r2]
_0809C492:
	adds r0, r6, #0
	adds r0, #0x43
	movs r1, #0
	ldrsb r1, [r0, r1]
	mov sb, r0
	cmp r1, #0
	beq _0809C4BC
	ldr r1, [r3]
	movs r0, #2
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _0809C57C
	bl CloseHelpBox
	mov r0, sb
	strb r4, [r0]
	b _0809C798
	.align 2, 0
_0809C4B8: .4byte gpKeySt
_0809C4BC:
	ldr r0, [r3]
	ldrh r1, [r0, #8]
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0809C51C
	ldr r7, [r6, #0x38]
	adds r0, r7, #0
	movs r1, #3
	bl __modsi3
	lsls r0, r0, #6
	adds r0, #0x14
	mov r8, r0
	adds r0, r7, #0
	movs r1, #3
	bl __divsi3
	adds r1, r0, #0
	ldr r0, [r6, #0x34]
	cmp r0, #0
	bge _0809C4EC
	adds r0, #0xf
_0809C4EC:
	asrs r4, r0, #4
	subs r4, r1, r4
	lsls r4, r4, #4
	adds r4, #0x4c
	ldr r5, _0809C518 @ =gCharacterData
	adds r0, r7, #0
	bl sub_809BAB8
	subs r0, #1
	movs r1, #0x34
	muls r0, r1, r0
	adds r0, r0, r5
	ldrh r2, [r0, #2]
	mov r0, r8
	adds r1, r4, #0
	bl StartHelpBox
	movs r0, #1
	mov r1, sb
	strb r0, [r1]
	b _0809C798
	.align 2, 0
_0809C518: .4byte gCharacterData
_0809C51C:
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0809C54C
	adds r0, r6, #0
	movs r1, #2
	bl Proc_Goto
	ldr r0, _0809C544 @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	bge _0809C53A
	b _0809C798
_0809C53A:
	ldr r0, _0809C548 @ =0x0000038A
	bl m4aSongNumStart
	b _0809C798
	.align 2, 0
_0809C544: .4byte gPlaySt
_0809C548: .4byte 0x0000038A
_0809C54C:
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0809C57C
	adds r0, r6, #0
	movs r1, #3
	bl Proc_Goto
	ldr r0, _0809C574 @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	bge _0809C56A
	b _0809C798
_0809C56A:
	ldr r0, _0809C578 @ =0x0000038B
	bl m4aSongNumStart
	b _0809C798
	.align 2, 0
_0809C574: .4byte gPlaySt
_0809C578: .4byte 0x0000038B
_0809C57C:
	movs r0, #0x20
	ands r0, r5
	cmp r0, #0
	beq _0809C596
	ldr r4, [r6, #0x38]
	adds r0, r4, #0
	movs r1, #3
	bl __modsi3
	cmp r0, #0
	beq _0809C596
	subs r0, r4, #1
	str r0, [r6, #0x38]
_0809C596:
	movs r0, #0x10
	ands r0, r5
	cmp r0, #0
	beq _0809C5C2
	ldr r4, [r6, #0x38]
	adds r0, r4, #0
	movs r1, #3
	bl __modsi3
	cmp r0, #2
	beq _0809C5C2
	adds r0, r4, #1
	str r0, [r6, #0x38]
	bl sub_809BA14
	ldr r1, [r6, #0x38]
	cmp r1, r0
	blt _0809C5C2
	bl sub_809BA14
	subs r0, #1
	str r0, [r6, #0x38]
_0809C5C2:
	movs r0, #0x40
	ands r0, r5
	cmp r0, #0
	beq _0809C5D4
	ldr r0, [r6, #0x38]
	cmp r0, #2
	ble _0809C5D4
	subs r0, #3
	str r0, [r6, #0x38]
_0809C5D4:
	movs r0, #0x80
	ands r5, r0
	cmp r5, #0
	beq _0809C5EE
	ldr r4, [r6, #0x38]
	adds r4, #3
	bl sub_809BA14
	cmp r4, r0
	bge _0809C5EE
	ldr r0, [r6, #0x38]
	adds r0, #3
	str r0, [r6, #0x38]
_0809C5EE:
	ldr r0, [r6, #0x38]
	cmp sl, r0
	bne _0809C5F6
	b _0809C6F2
_0809C5F6:
	movs r1, #3
	bl __divsi3
	adds r1, r0, #0
	ldr r0, [r6, #0x34]
	cmp r0, #0
	bge _0809C606
	adds r0, #0xf
_0809C606:
	asrs r0, r0, #4
	subs r0, r1, r0
	lsls r4, r0, #4
	movs r0, #0
	mov r7, r8
	strb r0, [r7]
	ldr r0, _0809C648 @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0809C624
	ldr r0, _0809C64C @ =0x00000385
	bl m4aSongNumStart
_0809C624:
	cmp r4, #0xf
	bgt _0809C650
	ldr r1, [r6, #0x34]
	cmp r1, #0
	beq _0809C650
	cmp r1, #0
	bge _0809C634
	adds r1, #0xf
_0809C634:
	asrs r1, r1, #4
	subs r1, #1
	adds r0, r6, #0
	bl sub_809C838
	movs r0, #0xff
	mov r1, r8
	strb r0, [r1]
	b _0809C69C
	.align 2, 0
_0809C648: .4byte gPlaySt
_0809C64C: .4byte 0x00000385
_0809C650:
	cmp r4, #0x2f
	ble _0809C682
	bl sub_809BA14
	subs r0, #1
	movs r1, #3
	bl __divsi3
	subs r0, #3
	lsls r0, r0, #4
	ldr r1, [r6, #0x34]
	cmp r1, r0
	beq _0809C682
	cmp r1, #0
	bge _0809C670
	adds r1, #0xf
_0809C670:
	asrs r1, r1, #4
	adds r1, #4
	adds r0, r6, #0
	bl sub_809C838
	movs r0, #1
	mov r7, r8
	strb r0, [r7]
	b _0809C69C
_0809C682:
	ldr r0, [r6, #0x38]
	movs r1, #3
	bl __modsi3
	lsls r0, r0, #6
	adds r0, #0x14
	adds r1, r4, #0
	adds r1, #0x4c
	movs r3, #0x80
	lsls r3, r3, #4
	movs r2, #7
	bl ShowSysHandCursor
_0809C69C:
	mov r1, sb
	movs r0, #0
	ldrsb r0, [r1, r0]
	cmp r0, #0
	beq _0809C6F2
	ldr r7, [r6, #0x38]
	adds r0, r7, #0
	movs r1, #3
	bl __modsi3
	lsls r0, r0, #6
	adds r0, #0x14
	mov sb, r0
	adds r0, r7, #0
	movs r1, #3
	bl __divsi3
	ldr r4, [r6, #0x34]
	cmp r4, #0
	bge _0809C6C6
	adds r4, #0xf
_0809C6C6:
	asrs r4, r4, #4
	subs r4, r0, r4
	lsls r4, r4, #4
	mov r1, r8
	movs r0, #0
	ldrsb r0, [r1, r0]
	lsls r0, r0, #4
	subs r0, #0x4c
	subs r4, r4, r0
	ldr r5, _0809C768 @ =gCharacterData
	adds r0, r7, #0
	bl sub_809BAB8
	subs r0, #1
	movs r1, #0x34
	muls r0, r1, r0
	adds r0, r0, r5
	ldrh r2, [r0, #2]
	mov r0, sb
	adds r1, r4, #0
	bl StartHelpBox
_0809C6F2:
	mov r7, r8
	movs r0, #0
	ldrsb r0, [r7, r0]
	cmp r0, #0
	beq _0809C798
_0809C6FC:
	mov r2, r8
	movs r0, #0
	ldrsb r0, [r2, r0]
	cmp r0, #0
	bge _0809C712
	adds r1, r6, #0
	adds r1, #0x41
	ldr r0, [r6, #0x34]
	ldrb r1, [r1]
	subs r0, r0, r1
	str r0, [r6, #0x34]
_0809C712:
	movs r0, #0
	ldrsb r0, [r2, r0]
	cmp r0, #0
	ble _0809C726
	adds r1, r6, #0
	adds r1, #0x41
	ldr r0, [r6, #0x34]
	ldrb r1, [r1]
	adds r0, r1, r0
	str r0, [r6, #0x34]
_0809C726:
	ldr r1, [r6, #0x34]
	movs r0, #0xf
	ands r1, r0
	cmp r1, #0
	bne _0809C734
	mov r0, r8
	strb r1, [r0]
_0809C734:
	ldrh r4, [r6, #0x34]
	bl sub_809BA14
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
	bl sub_8090E04
	ldr r1, _0809C76C @ =0x0000FFD8
	ldr r2, [r6, #0x34]
	subs r2, #0x4c
	movs r0, #0xff
	ands r2, r0
	movs r0, #2
	bl SetBgOffset
	b _0809C798
	.align 2, 0
_0809C768: .4byte gCharacterData
_0809C76C: .4byte 0x0000FFD8
_0809C770:
	ldr r0, _0809C7A8 @ =gpKeySt
	ldr r1, [r0]
	movs r0, #2
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _0809C798
	adds r0, r6, #0
	movs r1, #3
	bl Proc_Goto
	ldr r0, _0809C7AC @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0809C798
	ldr r0, _0809C7B0 @ =0x0000038B
	bl m4aSongNumStart
_0809C798:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0809C7A8: .4byte gpKeySt
_0809C7AC: .4byte gPlaySt
_0809C7B0: .4byte 0x0000038B

	thumb_func_start sub_809C7B4
sub_809C7B4: @ 0x0809C7B4
	push {lr}
	adds r2, r0, #0
	adds r0, #0x42
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	ldr r1, [r2, #0x38]
	bl sub_809E16C
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_809C7CC
sub_809C7CC: @ 0x0809C7CC
	push {lr}
	sub sp, #4
	adds r0, #0x42
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne _0809C7EE
	movs r1, #0x80
	lsls r1, r1, #1
	str r0, [sp]
	movs r0, #0x5a
	movs r2, #0xc0
	movs r3, #0x18
	bl CallSomeSoundMaybe
	b _0809C800
_0809C7EE:
	movs r2, #0x80
	lsls r2, r2, #1
	movs r0, #0
	str r0, [sp]
	movs r0, #0x49
	adds r1, r2, #0
	movs r3, #0x18
	bl CallSomeSoundMaybe
_0809C800:
	add sp, #4
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_809C808
sub_809C808: @ 0x0809C808
	push {lr}
	adds r1, r0, #0
	ldr r0, _0809C81C @ =gUnk_08D8DD68
	bl Proc_StartBlocking
	adds r0, #0x42
	movs r1, #1
	strb r1, [r0]
	pop {r0}
	bx r0
	.align 2, 0
_0809C81C: .4byte gUnk_08D8DD68

	thumb_func_start sub_809C820
sub_809C820: @ 0x0809C820
	push {lr}
	adds r1, r0, #0
	ldr r0, _0809C834 @ =gUnk_08D8DD68
	bl Proc_StartBlocking
	adds r0, #0x42
	movs r1, #0
	strb r1, [r0]
	pop {r0}
	bx r0
	.align 2, 0
_0809C834: .4byte gUnk_08D8DD68

	thumb_func_start sub_809C838
sub_809C838: @ 0x0809C838
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	str r0, [sp]
	mov sl, r1
	movs r0, #0
	bl SetTextFontGlyphs
	movs r0, #0
	bl SetTextFont
	mov r0, sl
	lsls r4, r0, #1
	add r4, sl
	adds r0, r4, #0
	movs r1, #0xf
	bl __modsi3
	lsls r0, r0, #3
	ldr r1, _0809C8AC @ =0x020129A8
	adds r5, r0, r1
	movs r7, #0
	adds r6, r4, #0
_0809C86C:
	adds r0, r5, #0
	bl ClearText
	bl sub_809BA14
	cmp r6, r0
	bge _0809C902
	adds r0, r7, #0
	movs r1, #3
	bl __modsi3
	lsls r0, r0, #3
	mov r8, r0
	mov r1, sl
	lsls r4, r1, #1
	movs r0, #0x1f
	ands r4, r0
	ldr r0, [sp]
	adds r0, #0x42
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r1, r6, #0
	bl sub_809BEC4
	cmp r0, #1
	beq _0809C8BA
	cmp r0, #1
	bgt _0809C8B0
	cmp r0, #0
	beq _0809C8B6
	b _0809C8C4
	.align 2, 0
_0809C8AC: .4byte 0x020129A8
_0809C8B0:
	cmp r0, #2
	beq _0809C8C0
	b _0809C8C4
_0809C8B6:
	movs r0, #1
	b _0809C8C2
_0809C8BA:
	movs r1, #0
	mov sb, r1
	b _0809C8C4
_0809C8C0:
	movs r0, #4
_0809C8C2:
	mov sb, r0
_0809C8C4:
	adds r0, r5, #0
	movs r1, #0
	bl Text_SetCursor
	adds r0, r5, #0
	mov r1, sb
	bl Text_SetColor
	adds r0, r6, #0
	bl sub_809BAB8
	subs r0, #1
	movs r1, #0x34
	muls r0, r1, r0
	ldr r1, _0809C924 @ =gCharacterData
	adds r0, r0, r1
	ldrh r0, [r0]
	bl DecodeMsg
	adds r1, r0, #0
	adds r0, r5, #0
	bl Text_DrawString
	lsls r1, r4, #5
	add r1, r8
	lsls r1, r1, #1
	ldr r0, _0809C928 @ =gBg2Tm
	adds r1, r1, r0
	adds r0, r5, #0
	bl PutText
_0809C902:
	adds r5, #8
	adds r6, #1
	adds r7, #1
	cmp r7, #2
	ble _0809C86C
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
_0809C924: .4byte gCharacterData
_0809C928: .4byte gBg2Tm

	thumb_func_start sub_809C92C
sub_809C92C: @ 0x0809C92C
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0809C944 @ =gUnk_08D8DD68
	bl Proc_Find
	cmp r0, #0
	beq _0809C93C
	str r4, [r0, #0x3c]
_0809C93C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0809C944: .4byte gUnk_08D8DD68

	thumb_func_start sub_809C948
sub_809C948: @ 0x0809C948
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	adds r5, r0, #0
	adds r6, r1, #0
	mov r8, r2
	bl sub_809BAB8
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	adds r0, r5, #0
	adds r1, r6, #0
	bl sub_809BA94
	adds r2, r0, #0
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	movs r0, #0
	adds r1, r4, #0
	mov r3, r8
	bl sub_807931C
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r1}
	bx r1

	thumb_func_start sub_809C980
sub_809C980: @ 0x0809C980
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #4
	mov r8, r0
	ldr r2, [r0, #0x34]
	subs r1, r2, #1
	lsls r0, r1, #4
	subs r0, r0, r1
	lsrs r1, r0, #0x1f
	adds r0, r0, r1
	asrs r0, r0, #1
	movs r1, #0x7e
	subs r1, r1, r0
	movs r0, #0x54
	mov sb, r0
	movs r6, #0
	cmp r6, r2
	bge _0809C9DC
	ldr r7, _0809C9EC @ =gUnk_08D8DE48
	adds r5, r1, #2
	adds r4, r1, #0
_0809C9AE:
	ldr r0, _0809C9F0 @ =0x0000EF80
	str r0, [sp]
	movs r0, #4
	adds r1, r5, #0
	mov r2, sb
	adds r3, r7, #0
	bl PutSpriteExt
	ldr r0, _0809C9F4 @ =0x0000FF80
	str r0, [sp]
	movs r0, #4
	adds r1, r4, #0
	mov r2, sb
	adds r3, r7, #0
	bl PutSpriteExt
	adds r5, #0xf
	adds r4, #0xf
	adds r6, #1
	mov r1, r8
	ldr r0, [r1, #0x34]
	cmp r6, r0
	blt _0809C9AE
_0809C9DC:
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0809C9EC: .4byte gUnk_08D8DE48
_0809C9F0: .4byte 0x0000EF80
_0809C9F4: .4byte 0x0000FF80

	thumb_func_start sub_809C9F8
sub_809C9F8: @ 0x0809C9F8
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #8
	ldr r4, _0809CAE8 @ =0x020129A8
	ldr r0, _0809CAEC @ =gUnk_08190268
	movs r1, #0
	movs r2, #0x20
	bl ApplyPaletteExt
	adds r0, r4, #0
	subs r0, #0x18
	bl SetTextFont
	movs r0, #1
	bl SetTextFontGlyphs
	bl sub_802EBB0
	adds r1, r4, #0
	adds r4, #8
	ldr r7, _0809CAF0 @ =gBg2Tm + 0x120
	movs r6, #0
	str r6, [sp]
	str r0, [sp, #4]
	adds r0, r1, #0
	adds r1, r7, #0
	movs r2, #4
	movs r3, #0
	bl PutDrawText
	subs r0, r7, #4
	ldr r3, _0809CAF4 @ =Unk_081C8FCC
	ldr r5, _0809CAF8 @ =gPlaySt
	movs r1, #0x2b
	adds r1, r1, r5
	mov r8, r1
	ldrb r2, [r1]
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
	mov r2, r8
	ldrb r2, [r2]
	lsls r0, r2, #0x1c
	lsrs r0, r0, #0x1d
	bl sub_80A7AA8
	bl DecodeMsg
	adds r2, r4, #0
	adds r4, #8
	adds r1, r7, #0
	adds r1, #0xf2
	str r6, [sp]
	str r0, [sp, #4]
	adds r0, r2, #0
	movs r2, #4
	movs r3, #0
	bl PutDrawText
	mov r3, r8
	ldrb r3, [r3]
	lsrs r0, r3, #4
	bl sub_80A7AB8
	bl DecodeMsg
	adds r2, r4, #0
	adds r4, #8
	movs r3, #0x80
	lsls r3, r3, #1
	adds r1, r7, r3
	str r6, [sp]
	str r0, [sp, #4]
	adds r0, r2, #0
	movs r2, #4
	movs r3, #0
	bl PutDrawText
	adds r5, #0x2c
	ldrb r5, [r5]
	lsls r0, r5, #0x1f
	lsrs r0, r0, #0x1f
	bl sub_80A7AC8
	bl DecodeMsg
	movs r2, #0x88
	lsls r2, r2, #1
	adds r1, r7, r2
	str r6, [sp]
	str r0, [sp, #4]
	adds r0, r4, #0
	movs r2, #4
	movs r3, #0
	bl PutDrawText
	movs r0, #0
	bl SetTextFont
	movs r0, #4
	bl EnableBgSync
	add sp, #8
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0809CAE8: .4byte 0x020129A8
_0809CAEC: .4byte gUnk_08190268
_0809CAF0: .4byte gBg2Tm + 0x120
_0809CAF4: .4byte Unk_081C8FCC
_0809CAF8: .4byte gPlaySt

	thumb_func_start sub_809CAFC
sub_809CAFC: @ 0x0809CAFC
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0809CB20 @ =gPlaySt
	ldrh r0, [r0, #0x2c]
	lsls r0, r0, #0x13
	lsrs r0, r0, #0x17
	movs r1, #0xc
	bl __divsi3
	cmp r0, #0xa
	ble _0809CB14
	movs r0, #0xa
_0809CB14:
	str r0, [r4, #0x34]
	movs r0, #0
	str r0, [r4, #0x2c]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0809CB20: .4byte gPlaySt

	thumb_func_start sub_809CB24
sub_809CB24: @ 0x0809CB24
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #0xc
	mov r8, r0
	ldr r7, _0809CD20 @ =gDispIo
	movs r0, #8
	rsbs r0, r0, #0
	ldrb r1, [r7]
	ands r0, r1
	strb r0, [r7]
	movs r0, #0
	bl InitBgs
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
	movs r1, #4
	rsbs r1, r1, #0
	adds r0, r1, #0
	ldrb r2, [r7, #0xc]
	ands r0, r2
	strb r0, [r7, #0xc]
	movs r2, #3
	ldrb r0, [r7, #0x10]
	orrs r0, r2
	strb r0, [r7, #0x10]
	ldrb r3, [r7, #0x14]
	ands r1, r3
	strb r1, [r7, #0x14]
	ldrb r6, [r7, #0x18]
	orrs r2, r6
	strb r2, [r7, #0x18]
	bl InitFaces
	bl ResetText
	bl InitIcons
	bl ApplySystemObjectsGraphics
	movs r0, #0
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	movs r0, #1
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	movs r0, #2
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	movs r0, #4
	bl ApplyIconPalettes
	bl PrepRestartMuralBackground
	ldr r0, _0809CD24 @ =gUnk_084364A0
	ldr r1, _0809CD28 @ =0x06000400
	bl Decompress
	ldr r0, _0809CD2C @ =gUnk_08436480
	movs r1, #0xf0
	lsls r1, r1, #1
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r0, _0809CD30 @ =gBg1Tm
	ldr r1, _0809CD34 @ =gUnk_08438D90
	ldr r2, _0809CD38 @ =0x0000F020
	bl TmApplyTsa_thm
	movs r0, #7
	bl EnableBgSync
	movs r0, #0x21
	rsbs r0, r0, #0
	ldrb r1, [r7, #1]
	ands r0, r1
	movs r1, #0x41
	rsbs r1, r1, #0
	ands r0, r1
	movs r1, #0x7f
	ands r0, r1
	strb r0, [r7, #1]
	adds r1, r7, #0
	adds r1, #0x2d
	movs r0, #0x80
	strb r0, [r1]
	adds r1, #4
	movs r0, #0x28
	strb r0, [r1]
	subs r1, #5
	movs r0, #0xe0
	strb r0, [r1]
	adds r1, #4
	movs r0, #0x98
	strb r0, [r1]
	movs r2, #0x34
	adds r2, r2, r7
	mov sb, r2
	movs r0, #1
	ldrb r1, [r2]
	orrs r1, r0
	movs r5, #2
	orrs r1, r5
	movs r2, #4
	orrs r1, r2
	movs r4, #8
	orrs r1, r4
	movs r3, #0x10
	orrs r1, r3
	movs r6, #0x36
	ldrb r2, [r6, r7]
	orrs r0, r2
	orrs r0, r5
	movs r2, #5
	rsbs r2, r2, #0
	ands r0, r2
	orrs r0, r4
	orrs r0, r3
	movs r2, #0x20
	orrs r1, r2
	mov r3, sb
	strb r1, [r3]
	orrs r0, r2
	strb r0, [r6, r7]
	adds r1, r7, #0
	adds r1, #0x3c
	movs r0, #0x3f
	ldrb r6, [r1]
	ands r0, r6
	strb r0, [r1]
	adds r0, r7, #0
	adds r0, #0x44
	movs r1, #8
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	ldr r4, _0809CD3C @ =0x02012990
	ldr r1, _0809CD40 @ =0x06004000
	movs r2, #0x80
	lsls r2, r2, #2
	adds r0, r4, #0
	movs r3, #0
	bl InitTextFont
	adds r0, r4, #0
	bl SetTextFont
	adds r4, #0x18
	movs r5, #0xb
_0809CC80:
	adds r0, r4, #0
	movs r1, #8
	bl InitText
	adds r4, #8
	subs r5, #1
	cmp r5, #0
	bge _0809CC80
	ldr r0, _0809CD44 @ =0x02012A90
	movs r1, #8
	bl InitText
	movs r0, #0
	bl SetTextFont
	bl sub_809C9F8
	movs r3, #0x81
	lsls r3, r3, #1
	movs r4, #0
	str r4, [sp]
	movs r0, #0x32
	movs r1, #0xd8
	movs r2, #0x58
	bl sub_8008DA8
	movs r0, #0
	movs r1, #0
	movs r2, #1
	bl InitTalk
	ldr r0, _0809CD48 @ =gUnk_0842B374
	ldr r1, _0809CD4C @ =0x06017000
	bl Decompress
	str r4, [sp, #8]
	ldr r1, _0809CD50 @ =gPal + 0x3c0
	ldr r2, _0809CD54 @ =0x01000008
	add r0, sp, #8
	bl CpuFastSet
	ldr r0, _0809CD58 @ =gUnk_0842B4BC
	movs r1, #0xf8
	lsls r1, r1, #2
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r0, _0809CD5C @ =sub_809C980
	mov r1, r8
	bl StartParallelWorker
	ldr r0, _0809CD60 @ =gUnk_08439190
	ldr r1, _0809CD64 @ =0x06017800
	bl Decompress
	ldr r0, _0809CD68 @ =gUnk_0843927C
	movs r1, #0xe8
	lsls r1, r1, #2
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r0, _0809CD6C @ =gUnk_0843929C
	ldr r3, _0809CD70 @ =0x0000DBC0
	str r4, [sp]
	movs r1, #0xd
	str r1, [sp, #4]
	movs r1, #0x86
	movs r2, #0x6c
	bl StartSpriteAnimProc
	ldr r0, _0809CD74 @ =0x00000FB3
	mov r1, r8
	str r0, [r1, #0x30]
	add sp, #0xc
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0809CD20: .4byte gDispIo
_0809CD24: .4byte gUnk_084364A0
_0809CD28: .4byte 0x06000400
_0809CD2C: .4byte gUnk_08436480
_0809CD30: .4byte gBg1Tm
_0809CD34: .4byte gUnk_08438D90
_0809CD38: .4byte 0x0000F020
_0809CD3C: .4byte 0x02012990
_0809CD40: .4byte 0x06004000
_0809CD44: .4byte 0x02012A90
_0809CD48: .4byte gUnk_0842B374
_0809CD4C: .4byte 0x06017000
_0809CD50: .4byte gPal + 0x3c0
_0809CD54: .4byte 0x01000008
_0809CD58: .4byte gUnk_0842B4BC
_0809CD5C: .4byte sub_809C980
_0809CD60: .4byte gUnk_08439190
_0809CD64: .4byte 0x06017800
_0809CD68: .4byte gUnk_0843927C
_0809CD6C: .4byte gUnk_0843929C
_0809CD70: .4byte 0x0000DBC0
_0809CD74: .4byte 0x00000FB3

	thumb_func_start sub_809CD78
sub_809CD78: @ 0x0809CD78
	push {r4, lr}
	adds r4, r0, #0
	bl EndEachSpriteAnimProc
	bl EndCgText
	adds r0, r4, #0
	bl EndAllProcChildren
	bl EndMuralBackground_
	movs r0, #0
	bl EndFaceById
	movs r0, #0
	bl SetOnHBlankA
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_809CDA0
sub_809CDA0: @ 0x0809CDA0
	push {lr}
	sub sp, #0x10
	ldr r0, [r0, #0x30]
	str r0, [sp]
	ldr r0, _0809CDCC @ =0x06011000
	str r0, [sp, #4]
	movs r0, #0xa
	str r0, [sp, #8]
	movs r0, #0
	str r0, [sp, #0xc]
	movs r0, #0x16
	movs r1, #0x13
	movs r2, #0x12
	movs r3, #4
	bl sub_8088584
	movs r0, #0x4e
	bl SetCgTextFlags
	add sp, #0x10
	pop {r0}
	bx r0
	.align 2, 0
_0809CDCC: .4byte 0x06011000

	thumb_func_start sub_809CDD0
sub_809CDD0: @ 0x0809CDD0
	push {r4, lr}
	adds r4, r0, #0
	bl sub_80893F4
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0809CDE6
	adds r0, r4, #0
	bl Proc_Break
	b _0809CE0C
_0809CDE6:
	ldr r0, _0809CE14 @ =gpKeySt
	ldr r1, [r0]
	movs r0, #8
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _0809CE0C
	adds r0, r4, #0
	bl Proc_Break
	ldr r0, _0809CE18 @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0809CE0C
	ldr r0, _0809CE1C @ =0x0000038B
	bl m4aSongNumStart
_0809CE0C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0809CE14: .4byte gpKeySt
_0809CE18: .4byte gPlaySt
_0809CE1C: .4byte 0x0000038B

	thumb_func_start sub_809CE20
sub_809CE20: @ 0x0809CE20
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	movs r0, #0
	ldr r1, _0809CE94 @ =gBg1Tm
	mov sl, r1
	ldr r6, _0809CE98 @ =gBg2Tm
	mov sb, r6
	ldr r7, _0809CE9C @ =0x02012BFC
	ldr r1, _0809CEA0 @ =gBg0Tm
	mov r8, r1
	movs r6, #0x80
	lsls r6, r6, #4
	adds r6, r6, r7
	mov ip, r6
_0809CE44:
	adds r1, r0, #1
	str r1, [sp]
	lsls r0, r0, #1
	ldr r6, _0809CEA4 @ =0x02013BFC
	adds r4, r0, r6
	adds r3, r0, r7
	adds r2, r0, #0
	movs r5, #0x13
_0809CE54:
	mov r1, r8
	adds r0, r2, r1
	ldrh r0, [r0]
	strh r0, [r3]
	mov r6, ip
	adds r1, r2, r6
	mov r6, sl
	adds r0, r2, r6
	ldrh r0, [r0]
	strh r0, [r1]
	mov r1, sb
	adds r0, r2, r1
	ldrh r0, [r0]
	strh r0, [r4]
	adds r4, #0x40
	adds r3, #0x40
	adds r2, #0x40
	subs r5, #1
	cmp r5, #0
	bge _0809CE54
	ldr r0, [sp]
	cmp r0, #0x1d
	ble _0809CE44
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0809CE94: .4byte gBg1Tm
_0809CE98: .4byte gBg2Tm
_0809CE9C: .4byte 0x02012BFC
_0809CEA0: .4byte gBg0Tm
_0809CEA4: .4byte 0x02013BFC

	thumb_func_start sub_809CEA8
sub_809CEA8: @ 0x0809CEA8
	ldr r2, _0809CEC0 @ =gCharacterData
	subs r0, #1
	movs r1, #0x34
	muls r0, r1, r0
	adds r2, #0x2c
	adds r0, r0, r2
	ldr r0, [r0]
	cmp r0, #0
	beq _0809CEC4
	ldrb r0, [r0, #0x15]
	b _0809CEC6
	.align 2, 0
_0809CEC0: .4byte gCharacterData
_0809CEC4:
	movs r0, #0
_0809CEC6:
	bx lr

	thumb_func_start sub_809CEC8
sub_809CEC8: @ 0x0809CEC8
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r6, r0, #0
	ldr r1, [r6, #0x30]
	adds r1, #0x80
	ldr r5, _0809CFB8 @ =0x000001FF
	ands r1, r5
	ldr r3, _0809CFBC @ =gUnk_08D8DEB0
	movs r4, #0xe0
	lsls r4, r4, #2
	str r4, [sp]
	movs r0, #4
	movs r2, #0xa
	bl PutSpriteExt
	ldr r1, [r6, #0x30]
	adds r1, #0xa8
	ands r1, r5
	ldr r3, _0809CFC0 @ =gUnk_08D8DEB8
	str r4, [sp]
	movs r0, #4
	movs r2, #0xa
	bl PutSpriteExt
	ldr r1, [r6, #0x30]
	adds r1, #0xc8
	ands r1, r5
	ldr r3, _0809CFC4 @ =gUnk_08D8DEC6
	str r4, [sp]
	movs r0, #4
	movs r2, #0xa
	bl PutSpriteExt
	ldr r1, [r6, #0x30]
	adds r1, #0x20
	ands r1, r5
	ldr r3, _0809CFC8 @ =gUnk_08D8DED4
	ldr r4, _0809CFCC @ =0x0000E280
	str r4, [sp]
	movs r0, #4
	movs r2, #0x50
	bl PutSpriteExt
	ldr r1, [r6, #0x30]
	adds r1, #0xa0
	ands r1, r5
	ldr r3, _0809CFD0 @ =gUnk_08D8DEE2
	str r4, [sp]
	movs r0, #4
	movs r2, #0x90
	bl PutSpriteExt
	ldr r0, [r6, #0x30]
	adds r7, r0, #0
	adds r7, #0x70
	ands r7, r5
	ldr r0, [r6, #0x34]
	adds r2, r0, #0
	adds r2, #0x16
	movs r4, #0
	adds r0, r6, #0
	adds r0, #0x3c
	ldrb r0, [r0]
	cmp r4, r0
	bge _0809CF92
	adds r5, r2, #0
_0809CF4C:
	movs r3, #0xc0
	lsls r3, r3, #8
	adds r0, r6, #0
	adds r0, #0x40
	adds r0, r0, r4
	ldrb r0, [r0]
	cmp r0, #0
	bne _0809CF60
	movs r3, #0xd0
	lsls r3, r3, #8
_0809CF60:
	cmp r0, #2
	bne _0809CF68
	movs r3, #0xf0
	lsls r3, r3, #8
_0809CF68:
	movs r1, #0xc0
	lsls r1, r1, #4
	adds r0, r1, #0
	orrs r3, r0
	adds r0, r6, #0
	adds r0, #0x4e
	adds r0, r0, r4
	ldrb r0, [r0]
	str r0, [sp]
	movs r0, #0
	adds r1, r7, #0
	adds r2, r5, #0
	bl sub_8026628
	adds r5, #0x10
	adds r4, #1
	adds r0, r6, #0
	adds r0, #0x3c
	ldrb r0, [r0]
	cmp r4, r0
	blt _0809CF4C
_0809CF92:
	ldr r1, [r6, #0x30]
	adds r1, #8
	ldr r0, _0809CFB8 @ =0x000001FF
	ands r1, r0
	ldr r3, _0809CFD4 @ =gUnk_08D8D51C
	movs r0, #0xaf
	lsls r0, r0, #6
	str r0, [sp]
	movs r0, #4
	movs r2, #0x90
	bl PutSpriteExt
	bl sub_80259A4
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0809CFB8: .4byte 0x000001FF
_0809CFBC: .4byte gUnk_08D8DEB0
_0809CFC0: .4byte gUnk_08D8DEB8
_0809CFC4: .4byte gUnk_08D8DEC6
_0809CFC8: .4byte gUnk_08D8DED4
_0809CFCC: .4byte 0x0000E280
_0809CFD0: .4byte gUnk_08D8DEE2
_0809CFD4: .4byte gUnk_08D8D51C

	thumb_func_start sub_809CFD8
sub_809CFD8: @ 0x0809CFD8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x24
	mov sb, r0
	mov sl, r1
	add r1, sp, #8
	ldr r0, _0809D06C @ =gUnk_0842D208
	ldm r0!, {r2, r3, r4}
	stm r1!, {r2, r3, r4}
	mov r0, sb
	adds r0, #0x40
	mov r1, sl
	adds r4, r0, r1
	ldrb r0, [r4]
	cmp r0, #0
	bne _0809D074
	movs r5, #0
	lsls r1, r1, #1
	mov r8, r1
	mov r0, r8
	adds r0, #3
	lsls r0, r0, #5
	adds r0, #0x10
	ldr r1, _0809D070 @ =gBg2Tm
	lsls r0, r0, #1
	adds r4, r0, r1
_0809D012:
	adds r0, r4, #0
	movs r1, #1
	movs r2, #0x14
	bl PutSpecialChar
	adds r4, #2
	adds r5, #1
	cmp r5, #4
	ble _0809D012
	movs r5, #0
	mov r0, r8
	adds r0, #3
	lsls r0, r0, #5
	adds r0, #0x16
	ldr r1, _0809D070 @ =gBg2Tm
	lsls r0, r0, #1
	adds r4, r0, r1
_0809D034:
	adds r0, r4, #0
	movs r1, #1
	movs r2, #0x14
	bl PutSpecialChar
	adds r4, #2
	adds r5, #1
	cmp r5, #1
	ble _0809D034
	movs r5, #0
	mov r0, r8
	adds r0, #3
	lsls r0, r0, #5
	adds r0, #0x19
	ldr r1, _0809D070 @ =gBg2Tm
	lsls r0, r0, #1
	adds r4, r0, r1
_0809D056:
	adds r0, r4, #0
	movs r1, #1
	movs r2, #0x14
	bl PutSpecialChar
	adds r4, #2
	adds r5, #1
	cmp r5, #2
	ble _0809D056
	b _0809D1B4
	.align 2, 0
_0809D06C: .4byte gUnk_0842D208
_0809D070: .4byte gBg2Tm
_0809D074:
	movs r7, #0
	mov r2, sb
	ldr r0, [r2, #0x2c]
	bl sub_809BAB8
	str r0, [sp, #0x14]
	mov r3, sb
	ldr r0, [r3, #0x2c]
	mov r1, sl
	bl sub_809BA94
	str r0, [sp, #0x18]
	ldrb r4, [r4]
	cmp r4, #2
	bne _0809D094
	movs r7, #1
_0809D094:
	mov r4, sb
	ldr r0, [r4, #0x2c]
	mov r1, sl
	bl sub_809BA94
	subs r0, #1
	movs r6, #0x34
	muls r0, r6, r0
	ldr r1, _0809D124 @ =gCharacterData
	adds r0, r0, r1
	ldrh r0, [r0]
	bl DecodeMsg
	mov r2, sl
	lsls r2, r2, #1
	mov r8, r2
	mov r4, r8
	adds r4, #3
	lsls r3, r4, #5
	str r3, [sp, #0x1c]
	lsls r4, r4, #6
	ldr r5, _0809D128 @ =gBg2Tm + 0x20
	adds r1, r4, r5
	movs r2, #5
	str r2, [sp]
	str r0, [sp, #4]
	movs r0, #0
	adds r2, r7, #0
	movs r3, #0
	bl PutDrawText
	adds r5, #0xc
	adds r4, r4, r5
	mov r1, sb
	ldr r0, [r1, #0x2c]
	mov r1, sl
	bl sub_809BA94
	subs r0, #1
	muls r0, r6, r0
	ldr r2, _0809D124 @ =gCharacterData
	adds r0, r0, r2
	ldrb r1, [r0, #9]
	adds r1, #0x79
	movs r2, #0xe0
	lsls r2, r2, #8
	adds r0, r4, #0
	bl PutIcon
	ldr r0, [sp, #0x14]
	ldr r1, [sp, #0x18]
	bl sub_809F5FC
	cmp r0, #2
	bne _0809D170
	movs r5, #0
	mov r0, sb
	adds r0, #0x47
	mov r3, sl
	adds r6, r0, r3
	ldr r0, [sp, #0x1c]
	adds r0, #0x19
	add r4, sp, #8
	mov sb, r4
	lsls r4, r0, #1
_0809D116:
	movs r7, #1
	ldrb r0, [r6]
	cmp r0, #2
	bne _0809D12C
	movs r7, #4
	b _0809D134
	.align 2, 0
_0809D124: .4byte gCharacterData
_0809D128: .4byte gBg2Tm + 0x20
_0809D12C:
	ldrb r1, [r6]
	cmp r1, r5
	ble _0809D134
	movs r7, #0
_0809D134:
	ldr r3, _0809D16C @ =gBg2Tm
	adds r0, r4, r3
	mov r1, sb
	adds r1, #4
	mov sb, r1
	subs r1, #4
	ldm r1!, {r2}
	adds r1, r7, #0
	str r3, [sp, #0x20]
	bl PutSpecialChar
	adds r4, #2
	adds r5, #1
	ldr r3, [sp, #0x20]
	cmp r5, #1
	ble _0809D116
	mov r0, r8
	adds r0, #3
	lsls r0, r0, #6
	adds r1, r3, #0
	adds r1, #0x36
	adds r0, r0, r1
	movs r1, #1
	movs r2, #0x14
	bl PutSpecialChar
	b _0809D1B4
	.align 2, 0
_0809D16C: .4byte gBg2Tm
_0809D170:
	movs r5, #0
	mov r0, sb
	adds r0, #0x47
	mov r2, sl
	adds r6, r0, r2
	ldr r0, [sp, #0x1c]
	adds r0, #0x19
	add r3, sp, #8
	mov r8, r3
	lsls r4, r0, #1
_0809D184:
	movs r7, #1
	ldrb r0, [r6]
	cmp r0, #3
	bne _0809D190
	movs r7, #4
	b _0809D198
_0809D190:
	ldrb r1, [r6]
	cmp r1, r5
	ble _0809D198
	movs r7, #0
_0809D198:
	ldr r0, _0809D1C4 @ =gBg2Tm
	adds r0, r4, r0
	mov r3, r8
	adds r3, #4
	mov r8, r3
	subs r3, #4
	ldm r3!, {r2}
	adds r1, r7, #0
	bl PutSpecialChar
	adds r4, #2
	adds r5, #1
	cmp r5, #2
	ble _0809D184
_0809D1B4:
	add sp, #0x24
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0809D1C4: .4byte gBg2Tm

	thumb_func_start sub_809D1C8
sub_809D1C8: @ 0x0809D1C8
	push {r4, r5, r6, lr}
	sub sp, #0x20
	adds r6, r0, #0
	ldr r1, _0809D288 @ =0x06015000
	mov r0, sp
	movs r2, #0xe
	bl InitSpriteTextFont
	ldr r0, _0809D28C @ =Pal_Text
	movs r1, #0xf0
	lsls r1, r1, #2
	movs r2, #0x20
	bl ApplyPaletteExt
	add r5, sp, #0x18
	adds r0, r5, #0
	bl InitSpriteText
	mov r0, sp
	bl SetTextFont
	movs r0, #0
	bl SetTextFontGlyphs
	adds r0, r5, #0
	movs r1, #0
	bl SpriteText_DrawBackgroundExt
	ldr r4, _0809D290 @ =gCharacterData
	ldr r0, [r6, #0x2c]
	bl sub_809BAB8
	subs r0, #1
	movs r1, #0x34
	muls r0, r1, r0
	adds r0, r0, r4
	ldrh r0, [r0]
	bl DecodeMsg
	adds r4, r0, #0
	movs r0, #0x30
	adds r1, r4, #0
	bl GetStringTextCenteredPos
	adds r1, r0, #0
	adds r0, r5, #0
	movs r2, #0
	adds r3, r4, #0
	bl Text_InsertDrawString
	adds r0, r6, #0
	adds r0, #0x38
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _0809D29C
	movs r2, #0
	adds r4, r6, #0
	adds r4, #0x3d
	ldrb r0, [r4]
	cmp r0, #0
	bne _0809D248
	movs r2, #1
_0809D248:
	ldr r3, _0809D294 @ =gUnk_0842D214
	adds r0, r5, #0
	movs r1, #0x30
	bl Text_InsertDrawString
	adds r0, r5, #0
	movs r1, #0x60
	bl Text_SetCursor
	ldrb r0, [r4]
	movs r1, #2
	cmp r0, #0
	bne _0809D264
	movs r1, #1
_0809D264:
	adds r0, r5, #0
	bl Text_SetColor
	ldrb r1, [r4]
	adds r0, r5, #0
	bl Text_DrawNumberOrBlank
	movs r2, #0
	ldrb r0, [r4]
	cmp r0, #0
	bne _0809D27C
	movs r2, #1
_0809D27C:
	ldr r3, _0809D298 @ =gUnk_0842D220
	adds r0, r5, #0
	movs r1, #0x68
	bl Text_InsertDrawString
	b _0809D2E8
	.align 2, 0
_0809D288: .4byte 0x06015000
_0809D28C: .4byte Pal_Text
_0809D290: .4byte gCharacterData
_0809D294: .4byte gUnk_0842D214
_0809D298: .4byte gUnk_0842D220
_0809D29C:
	movs r2, #0
	adds r4, r6, #0
	adds r4, #0x3d
	ldrb r0, [r4]
	cmp r0, #0
	bne _0809D2AA
	movs r2, #1
_0809D2AA:
	ldr r3, _0809D328 @ =gUnk_0842D214
	adds r0, r5, #0
	movs r1, #0x30
	bl Text_InsertDrawString
	adds r0, r5, #0
	movs r1, #0x60
	bl Text_SetCursor
	ldrb r0, [r4]
	movs r1, #2
	cmp r0, #0
	bne _0809D2C6
	movs r1, #1
_0809D2C6:
	adds r0, r5, #0
	bl Text_SetColor
	ldrb r1, [r4]
	adds r0, r5, #0
	bl Text_DrawNumberOrBlank
	movs r2, #0
	ldrb r0, [r4]
	cmp r0, #0
	bne _0809D2DE
	movs r2, #1
_0809D2DE:
	ldr r3, _0809D32C @ =gUnk_0842D220
	adds r0, r5, #0
	movs r1, #0x68
	bl Text_InsertDrawString
_0809D2E8:
	ldr r3, _0809D330 @ =gUnk_0842D224
	adds r0, r5, #0
	movs r1, #0x80
	movs r2, #0
	bl Text_InsertDrawString
	adds r0, r5, #0
	bl InitSpriteText
	adds r0, r5, #0
	movs r1, #0
	bl SpriteText_DrawBackgroundExt
	ldr r3, _0809D334 @ =gUnk_0842D238
	adds r0, r5, #0
	movs r1, #0
	movs r2, #0
	bl Text_InsertDrawString
	ldr r3, _0809D338 @ =gUnk_0842D254
	adds r0, r5, #0
	movs r1, #0x80
	movs r2, #0
	bl Text_InsertDrawString
	movs r0, #0
	bl SetTextFont
	add sp, #0x20
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0809D328: .4byte gUnk_0842D214
_0809D32C: .4byte gUnk_0842D220
_0809D330: .4byte gUnk_0842D224
_0809D334: .4byte gUnk_0842D238
_0809D338: .4byte gUnk_0842D254

	thumb_func_start InitSupportSubScreenPartners
InitSupportSubScreenPartners: @ 0x0809D33C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	adds r6, r0, #0
	adds r0, #0x38
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _0809D3C8
	movs r4, #0
	adds r0, r6, #0
	adds r0, #0x3c
	mov r8, r0
	ldrb r0, [r0]
	cmp r4, r0
	bge _0809D412
	movs r1, #0x40
	adds r1, r1, r6
	mov sl, r1
_0809D368:
	ldr r0, [r6, #0x2c]
	adds r1, r4, #0
	bl sub_809BA94
	adds r7, r0, #0
	mov r2, sl
	adds r1, r2, r4
	movs r0, #0
	strb r0, [r1]
	movs r5, #1
	adds r4, #1
	mov sb, r4
	adds r4, r1, #0
_0809D382:
	adds r0, r5, #0
	bl GetUnit
	adds r1, r0, #0
	cmp r1, #0
	beq _0809D3B6
	ldr r0, [r1]
	cmp r0, #0
	beq _0809D3B6
	ldrb r0, [r0, #4]
	cmp r0, r7
	bne _0809D3B6
	ldr r1, [r1, #0xc]
	movs r0, #0x80
	lsls r0, r0, #9
	ands r0, r1
	cmp r0, #0
	bne _0809D3B6
	movs r0, #4
	ands r1, r0
	cmp r1, #0
	beq _0809D3B2
	movs r0, #2
	b _0809D3B4
_0809D3B2:
	movs r0, #1
_0809D3B4:
	strb r0, [r4]
_0809D3B6:
	adds r5, #1
	cmp r5, #0x3f
	ble _0809D382
	mov r4, sb
	mov r0, r8
	ldrb r0, [r0]
	cmp r4, r0
	blt _0809D368
	b _0809D412
_0809D3C8:
	adds r1, r6, #0
	adds r1, #0x3b
	strb r0, [r1]
	movs r4, #0
	adds r0, r6, #0
	adds r0, #0x3c
	mov r8, r0
	ldrb r2, [r0]
	cmp r4, r2
	bge _0809D412
	adds r7, r1, #0
_0809D3DE:
	adds r0, r6, #0
	adds r0, #0x40
	adds r5, r0, r4
	movs r0, #0
	strb r0, [r5]
	ldr r0, [r6, #0x2c]
	adds r1, r4, #0
	bl sub_809BA78
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0809D408
	movs r0, #1
	strb r0, [r5]
	ldr r0, [r6, #0x2c]
	adds r1, r4, #0
	bl sub_809BA48
	ldrb r1, [r7]
	adds r0, r1, r0
	strb r0, [r7]
_0809D408:
	adds r4, #1
	mov r2, r8
	ldrb r2, [r2]
	cmp r4, r2
	blt _0809D3DE
_0809D412:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_809D420
sub_809D420: @ 0x0809D420
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	movs r4, #0
	adds r0, #0x3c
	ldrb r1, [r0]
	cmp r4, r1
	bge _0809D448
	adds r7, r5, #0
	adds r7, #0x47
	adds r6, r0, #0
_0809D434:
	ldr r0, [r5, #0x2c]
	adds r1, r4, #0
	bl sub_809BA48
	adds r1, r7, r4
	strb r0, [r1]
	adds r4, #1
	ldrb r0, [r6]
	cmp r4, r0
	blt _0809D434
_0809D448:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_809D450
sub_809D450: @ 0x0809D450
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	adds r4, r0, #0
	adds r0, #0x38
	movs r5, #0
	ldrsb r5, [r0, r5]
	cmp r5, #0
	beq _0809D476
	ldr r0, [r4, #0x2c]
	bl sub_809BE88
	movs r1, #5
	subs r1, r1, r0
	adds r0, r4, #0
	adds r0, #0x3d
	strb r1, [r0]
	b _0809D4C4
_0809D476:
	ldr r0, [r4, #0x2c]
	bl sub_809BAB8
	mov sb, r0
	adds r1, r4, #0
	adds r1, #0x3d
	strb r5, [r1]
	movs r5, #0
	adds r0, r4, #0
	adds r0, #0x3c
	mov r8, r1
	adds r7, r0, #0
	ldrb r0, [r7]
	cmp r5, r0
	bge _0809D4B4
	mov r6, r8
_0809D496:
	ldr r0, [r4, #0x2c]
	adds r1, r5, #0
	bl sub_809BA94
	adds r1, r0, #0
	mov r0, sb
	bl sub_809F5FC
	ldrb r1, [r6]
	adds r0, r1, r0
	strb r0, [r6]
	adds r5, #1
	ldrb r2, [r7]
	cmp r5, r2
	blt _0809D496
_0809D4B4:
	ldr r0, [r4, #0x2c]
	bl sub_809BE88
	mov r1, r8
	ldrb r1, [r1]
	subs r0, r1, r0
	mov r2, r8
	strb r0, [r2]
_0809D4C4:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_809D4D0
sub_809D4D0: @ 0x0809D4D0
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	bl ResetUnitSprites
	movs r4, #0
	b _0809D4F8
_0809D4DC:
	ldr r0, [r5, #0x2c]
	adds r1, r4, #0
	bl sub_809BA60
	adds r1, r5, #0
	adds r1, #0x4e
	adds r1, r1, r4
	strb r0, [r1]
	ldrb r0, [r1]
	bl GetClassSMSId
	bl StartUiSMS
	adds r4, #1
_0809D4F8:
	adds r0, r5, #0
	adds r0, #0x3c
	ldrb r0, [r0]
	cmp r4, r0
	blt _0809D4DC
	bl ForceSyncUnitSpriteSheet
	movs r4, #0
	adds r0, r5, #0
	adds r0, #0x3c
	adds r6, r0, #0
	b _0809D51A
_0809D510:
	adds r0, r5, #0
	adds r1, r4, #0
	bl sub_809CFD8
	adds r4, #1
_0809D51A:
	ldrb r0, [r6]
	cmp r4, r0
	blt _0809D510
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_809D528
sub_809D528: @ 0x0809D528
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	adds r5, r1, #0
	adds r4, r2, #0
_0809D530:
	cmp r5, #0
	blt _0809D59C
	adds r0, r7, #0
	adds r0, #0x3c
	ldrb r0, [r0]
	subs r0, #1
	cmp r5, r0
	bgt _0809D59C
	adds r1, r7, #0
	adds r1, #0x40
	adds r1, r1, r5
	movs r0, #1
	ldrb r1, [r1]
	ands r0, r1
	cmp r0, #0
	beq _0809D598
	ldr r0, [r7, #0x2c]
	adds r1, r5, #0
	bl sub_809BA48
	cmp r0, #0
	ble _0809D598
	adds r6, r7, #0
	adds r6, #0x39
	movs r1, #0xe3
	ldrb r0, [r6]
	ands r1, r0
	movs r2, #7
	adds r0, r5, #0
	ands r0, r2
	lsls r0, r0, #2
	adds r1, r1, r0
	strb r1, [r6]
	movs r4, #3
	ands r4, r1
	ldr r0, [r7, #0x2c]
	adds r1, r5, #0
	bl sub_809BA48
	cmp r4, r0
	blt _0809D59C
	ldr r0, [r7, #0x2c]
	adds r1, r5, #0
	bl sub_809BA48
	movs r1, #0xfc
	ldrb r2, [r6]
	ands r1, r2
	subs r0, #1
	adds r1, r1, r0
	strb r1, [r6]
	b _0809D59C
_0809D598:
	adds r5, r5, r4
	b _0809D530
_0809D59C:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_809D5A4
sub_809D5A4: @ 0x0809D5A4
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0
	str r0, [r4, #0x30]
	str r0, [r4, #0x34]
	adds r2, r4, #0
	adds r2, #0x39
	movs r0, #0xfc
	ldrb r1, [r2]
	ands r0, r1
	movs r1, #0xe3
	ands r0, r1
	strb r0, [r2]
	ldr r0, [r4, #0x2c]
	bl sub_809BAB8
	bl sub_809CEA8
	adds r1, r4, #0
	adds r1, #0x3c
	strb r0, [r1]
	adds r0, r4, #0
	bl InitSupportSubScreenPartners
	adds r0, r4, #0
	bl sub_809D420
	adds r0, r4, #0
	bl sub_809D450
	adds r0, r4, #0
	movs r1, #0
	movs r2, #1
	bl sub_809D528
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_809D5F0
sub_809D5F0: @ 0x0809D5F0
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	ldr r3, _0809D644 @ =gPal + 0x380
	adds r5, r3, #0
	adds r5, #0x20
	movs r0, #0x1f
	mov r8, r0
	movs r7, #0xf8
	lsls r7, r7, #2
	movs r6, #0xf8
	lsls r6, r6, #7
	movs r4, #0xf
	movs r0, #0x1f
	mov ip, r0
_0809D60E:
	ldrh r2, [r3]
	mov r1, ip
	ands r1, r2
	lsrs r1, r1, #1
	mov r0, r8
	ands r1, r0
	adds r0, r7, #0
	ands r0, r2
	lsrs r0, r0, #1
	ands r0, r7
	adds r1, r1, r0
	adds r0, r6, #0
	ands r0, r2
	lsrs r0, r0, #1
	ands r0, r6
	adds r1, r1, r0
	strh r1, [r5]
	adds r5, #2
	adds r3, #2
	subs r4, #1
	cmp r4, #0
	bge _0809D60E
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0809D644: .4byte gPal + 0x380

	thumb_func_start sub_809D648
sub_809D648: @ 0x0809D648
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r5, r0, #0
	ldr r4, _0809D7CC @ =gDispIo
	movs r0, #8
	rsbs r0, r0, #0
	ldrb r1, [r4]
	ands r0, r1
	strb r0, [r4]
	movs r0, #0
	bl InitBgs
	movs r1, #4
	rsbs r1, r1, #0
	adds r0, r1, #0
	ldrb r2, [r4, #0xc]
	ands r0, r2
	movs r3, #1
	orrs r0, r3
	strb r0, [r4, #0xc]
	movs r2, #3
	ldrb r0, [r4, #0x10]
	orrs r0, r2
	strb r0, [r4, #0x10]
	ldrb r0, [r4, #0x14]
	ands r1, r0
	orrs r1, r3
	strb r1, [r4, #0x14]
	ldrb r1, [r4, #0x18]
	orrs r2, r1
	strb r2, [r4, #0x18]
	bl ResetText
	bl InitIcons
	bl UnpackUiWindowFrameGraphics
	bl ApplySystemObjectsGraphics
	bl ApplyUnitSpritePalettes
	bl sub_809D5F0
	movs r0, #0xd
	bl ApplyIconPalettes
	adds r0, r5, #0
	bl StartGreenText
	adds r0, r5, #0
	adds r0, #0x38
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne _0809D714
	ldr r2, _0809D7D0 @ =gPlaySt
	adds r2, #0x40
	movs r0, #0x61
	rsbs r0, r0, #0
	ldrb r4, [r2]
	ands r0, r4
	movs r1, #0x20
	orrs r0, r1
	strb r0, [r2]
	adds r0, r5, #0
	bl ResetSysHandCursor
	movs r0, #0xc0
	lsls r0, r0, #3
	movs r1, #1
	bl DisplaySysHandCursorTextShadow
	movs r0, #1
	bl ConfigSysHandCursorShadowEnabled
	adds r1, r5, #0
	adds r1, #0x3a
	movs r0, #0xff
	strb r0, [r1]
	adds r0, r5, #0
	adds r0, #0x3b
	ldrb r0, [r0]
	cmp r0, #0
	beq _0809D714
	adds r0, r5, #0
	adds r0, #0x39
	ldrb r1, [r0]
	movs r0, #3
	ands r0, r1
	lsls r0, r0, #3
	adds r0, #0xc4
	lsrs r1, r1, #2
	movs r2, #7
	ands r1, r2
	lsls r1, r1, #4
	adds r1, #0x18
	movs r3, #0x80
	lsls r3, r3, #4
	movs r2, #1
	bl ShowSysHandCursor
_0809D714:
	movs r0, #0
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	movs r0, #1
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	movs r0, #2
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	ldr r3, _0809D7CC @ =gDispIo
	adds r2, r3, #0
	adds r2, #0x3c
	movs r0, #0x3f
	ldrb r1, [r2]
	ands r0, r1
	strb r0, [r2]
	adds r0, r3, #0
	adds r0, #0x44
	movs r6, #0
	strb r6, [r0]
	adds r0, #1
	strb r6, [r0]
	adds r0, #1
	strb r6, [r0]
	ldr r0, _0809D7D4 @ =0x0000FFE0
	ldrh r4, [r3, #0x3c]
	ands r0, r4
	ldr r1, _0809D7D8 @ =0x0000E0FF
	ands r0, r1
	movs r4, #0x80
	lsls r4, r4, #4
	adds r1, r4, #0
	orrs r0, r1
	strh r0, [r3, #0x3c]
	movs r1, #0x21
	rsbs r1, r1, #0
	adds r0, r1, #0
	ldrb r4, [r2]
	ands r0, r4
	strb r0, [r2]
	adds r0, r3, #0
	adds r0, #0x3d
	ldrb r2, [r0]
	ands r1, r2
	strb r1, [r0]
	bl PrepRestartMuralBackground
	movs r0, #0x80
	lsls r0, r0, #7
	movs r1, #5
	bl sub_809228C
	ldr r0, _0809D7DC @ =gBg1Tm
	ldr r1, _0809D7E0 @ =gUnk_0842C3C0
	movs r2, #0xa4
	lsls r2, r2, #7
	bl TmApplyTsa_thm
	ldr r4, _0809D7E4 @ =gCharacterData
	ldr r0, [r5, #0x2c]
	bl sub_809BAB8
	subs r0, #1
	movs r1, #0x34
	muls r0, r1, r0
	adds r0, r0, r4
	ldrh r4, [r0, #6]
	adds r0, r4, #0
	bl ShouldFaceBeRaised
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0809D7E8
	adds r0, r5, #0
	adds r0, #0x3f
	strb r6, [r0]
	movs r0, #0x80
	lsls r0, r0, #1
	str r0, [sp]
	movs r0, #0
	adds r1, r4, #0
	movs r2, #0x38
	movs r3, #0
	bl StartBmFace
	b _0809D800
	.align 2, 0
_0809D7CC: .4byte gDispIo
_0809D7D0: .4byte gPlaySt
_0809D7D4: .4byte 0x0000FFE0
_0809D7D8: .4byte 0x0000E0FF
_0809D7DC: .4byte gBg1Tm
_0809D7E0: .4byte gUnk_0842C3C0
_0809D7E4: .4byte gCharacterData
_0809D7E8:
	adds r1, r5, #0
	adds r1, #0x3f
	movs r0, #8
	strb r0, [r1]
	adds r0, #0xfc
	str r0, [sp]
	movs r0, #0
	adds r1, r4, #0
	movs r2, #0x38
	movs r3, #8
	bl StartBmFace
_0809D800:
	ldr r0, _0809D838 @ =gUnk_0842C874
	ldr r1, _0809D83C @ =0x06017000
	bl Decompress
	ldr r0, _0809D840 @ =gUnk_08429658
	ldr r1, _0809D844 @ =0x06017800
	bl Decompress
	ldr r0, _0809D848 @ =gUnk_0842971C
	movs r1, #0x90
	lsls r1, r1, #2
	movs r2, #0x20
	bl ApplyPaletteExt
	adds r0, r5, #0
	bl sub_809D4D0
	adds r0, r5, #0
	bl sub_809D1C8
	ldr r0, _0809D84C @ =sub_809CEC8
	adds r1, r5, #0
	bl StartParallelWorker
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0809D838: .4byte gUnk_0842C874
_0809D83C: .4byte 0x06017000
_0809D840: .4byte gUnk_08429658
_0809D844: .4byte 0x06017800
_0809D848: .4byte gUnk_0842971C
_0809D84C: .4byte sub_809CEC8

	thumb_func_start sub_809D850
sub_809D850: @ 0x0809D850
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r6, r0, #0
	ldr r0, _0809D884 @ =gpKeySt
	ldr r1, [r0]
	ldrh r3, [r1, #8]
	movs r0, #2
	ands r0, r3
	cmp r0, #0
	beq _0809D890
	ldr r0, _0809D888 @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0809D878
	ldr r0, _0809D88C @ =0x0000038B
	bl m4aSongNumStart
_0809D878:
	adds r0, r6, #0
	movs r1, #3
	bl Proc_Goto
	b _0809DA00
	.align 2, 0
_0809D884: .4byte gpKeySt
_0809D888: .4byte gPlaySt
_0809D88C: .4byte 0x0000038B
_0809D890:
	ldrh r2, [r1, #6]
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r2
	cmp r0, #0
	beq _0809D8A6
	adds r0, r6, #0
	movs r1, #4
	bl Proc_Goto
	b _0809DA00
_0809D8A6:
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r2
	cmp r0, #0
	beq _0809D8BA
	adds r0, r6, #0
	movs r1, #5
	bl Proc_Goto
	b _0809DA00
_0809D8BA:
	adds r0, r6, #0
	adds r0, #0x38
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _0809D8CA
	b _0809DA00
_0809D8CA:
	adds r0, r6, #0
	adds r0, #0x3b
	ldrb r0, [r0]
	cmp r0, #0
	bne _0809D8D6
	b _0809D9E4
_0809D8D6:
	adds r1, r6, #0
	adds r1, #0x39
	ldrb r7, [r1]
	movs r0, #1
	ands r0, r3
	adds r5, r1, #0
	cmp r0, #0
	beq _0809D90C
	ldr r0, _0809D904 @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0809D8F8
	ldr r0, _0809D908 @ =0x0000038A
	bl m4aSongNumStart
_0809D8F8:
	adds r0, r6, #0
	movs r1, #2
	bl Proc_Goto
	b _0809DA00
	.align 2, 0
_0809D904: .4byte gPlaySt
_0809D908: .4byte 0x0000038A
_0809D90C:
	movs r0, #0x20
	ands r0, r2
	cmp r0, #0
	beq _0809D926
	movs r1, #3
	ands r1, r7
	cmp r1, #0
	beq _0809D926
	movs r0, #0xfc
	ands r0, r7
	adds r0, #0xff
	adds r0, r0, r1
	strb r0, [r5]
_0809D926:
	ldr r0, _0809D9D8 @ =gpKeySt
	ldr r1, [r0]
	movs r0, #0x10
	ldrh r1, [r1, #6]
	ands r0, r1
	cmp r0, #0
	beq _0809D960
	ldrb r1, [r5]
	movs r0, #3
	mov r8, r0
	mov r4, r8
	ands r4, r1
	ldr r0, [r6, #0x2c]
	lsrs r1, r1, #2
	movs r2, #7
	ands r1, r2
	bl sub_809BA48
	subs r0, #1
	cmp r4, r0
	bge _0809D960
	ldrb r0, [r5]
	movs r1, #0xfc
	ands r1, r0
	adds r1, #1
	mov r2, r8
	ands r2, r0
	adds r1, r1, r2
	strb r1, [r5]
_0809D960:
	ldr r4, _0809D9D8 @ =gpKeySt
	ldr r1, [r4]
	movs r0, #0x40
	ldrh r1, [r1, #6]
	ands r0, r1
	cmp r0, #0
	beq _0809D982
	ldrb r0, [r5]
	lsrs r1, r0, #2
	movs r0, #7
	ands r1, r0
	subs r1, #1
	movs r2, #1
	rsbs r2, r2, #0
	adds r0, r6, #0
	bl sub_809D528
_0809D982:
	ldr r1, [r4]
	movs r0, #0x80
	ldrh r1, [r1, #6]
	ands r0, r1
	cmp r0, #0
	beq _0809D9A0
	ldrb r0, [r5]
	lsrs r1, r0, #2
	movs r0, #7
	ands r1, r0
	adds r1, #1
	adds r0, r6, #0
	movs r2, #1
	bl sub_809D528
_0809D9A0:
	ldrb r1, [r5]
	cmp r7, r1
	beq _0809DA00
	movs r0, #3
	ands r0, r1
	lsls r0, r0, #3
	adds r0, #0xc4
	lsrs r1, r1, #2
	movs r2, #7
	ands r1, r2
	lsls r1, r1, #4
	adds r1, #0x18
	movs r3, #0x80
	lsls r3, r3, #4
	movs r2, #1
	bl ShowSysHandCursor
	ldr r0, _0809D9DC @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0809DA00
	ldr r0, _0809D9E0 @ =0x00000385
	bl m4aSongNumStart
	b _0809DA00
	.align 2, 0
_0809D9D8: .4byte gpKeySt
_0809D9DC: .4byte gPlaySt
_0809D9E0: .4byte 0x00000385
_0809D9E4:
	movs r0, #1
	ands r0, r3
	cmp r0, #0
	beq _0809DA00
	ldr r0, _0809DA0C @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0809DA00
	movs r0, #0xe3
	lsls r0, r0, #2
	bl m4aSongNumStart
_0809DA00:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0809DA0C: .4byte gPlaySt

	thumb_func_start sub_809DA10
sub_809DA10: @ 0x0809DA10
	push {r4, r5, lr}
	adds r5, r0, #0
	movs r0, #0
	bl InitBgs
	ldr r3, _0809DAC8 @ =gDispIo
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
	ldr r0, _0809DACC @ =0x0000FFE0
	ldrh r1, [r3, #0x3c]
	ands r0, r1
	movs r1, #0x1f
	orrs r0, r1
	ldr r1, _0809DAD0 @ =0x0000E0FF
	ands r0, r1
	movs r2, #0x80
	lsls r2, r2, #2
	adds r1, r2, #0
	orrs r0, r1
	strh r0, [r3, #0x3c]
	bl InitFaces
	bl ResetText
	bl InitIcons
	bl UnpackUiWindowFrameGraphics
	bl ApplySystemObjectsGraphics
	ldr r0, [r5, #0x2c]
	bl sub_809BAB8
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	ldr r0, [r5, #0x2c]
	adds r5, #0x39
	ldrb r2, [r5]
	lsrs r1, r2, #2
	movs r2, #7
	ands r1, r2
	bl sub_809BA94
	adds r1, r0, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	movs r2, #3
	ldrb r5, [r5]
	ands r2, r5
	adds r2, #1
	adds r0, r4, #0
	bl sub_80792C4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0809DAC8: .4byte gDispIo
_0809DACC: .4byte 0x0000FFE0
_0809DAD0: .4byte 0x0000E0FF

	thumb_func_start sub_809DAD4
sub_809DAD4: @ 0x0809DAD4
	push {r4, r5, lr}
	adds r0, #0x3a
	movs r4, #0
	strb r4, [r0]
	bl HideSysHandCursor
	ldr r3, _0809DB64 @ =gDispIo
	movs r1, #4
	rsbs r1, r1, #0
	adds r0, r1, #0
	ldrb r2, [r3, #0xc]
	ands r0, r2
	movs r2, #1
	orrs r0, r2
	strb r0, [r3, #0xc]
	movs r0, #3
	ldrb r5, [r3, #0x10]
	orrs r0, r5
	strb r0, [r3, #0x10]
	adds r0, r1, #0
	ldrb r5, [r3, #0x14]
	ands r0, r5
	orrs r0, r2
	strb r0, [r3, #0x14]
	ldrb r0, [r3, #0x18]
	ands r1, r0
	strb r1, [r3, #0x18]
	adds r2, r3, #0
	adds r2, #0x3c
	movs r0, #0x3f
	ldrb r1, [r2]
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r2]
	adds r0, r3, #0
	adds r0, #0x44
	strb r4, [r0]
	adds r1, r3, #0
	adds r1, #0x45
	movs r0, #0x10
	strb r0, [r1]
	adds r0, r3, #0
	adds r0, #0x46
	strb r4, [r0]
	ldr r0, _0809DB68 @ =0x0000FFE0
	ldrh r2, [r3, #0x3c]
	ands r0, r2
	movs r1, #8
	orrs r0, r1
	ldr r1, _0809DB6C @ =0x0000E0FF
	ands r0, r1
	movs r5, #0xb8
	lsls r5, r5, #5
	adds r1, r5, #0
	orrs r0, r1
	strh r0, [r3, #0x3c]
	bl sub_809CE20
	ldr r0, _0809DB70 @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0809DB5C
	movs r0, #0xc8
	bl m4aSongNumStart
_0809DB5C:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0809DB64: .4byte gDispIo
_0809DB68: .4byte 0x0000FFE0
_0809DB6C: .4byte 0x0000E0FF
_0809DB70: .4byte gPlaySt

	thumb_func_start sub_809DB74
sub_809DB74: @ 0x0809DB74
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	str r0, [sp]
	movs r4, #0
	ldr r0, _0809DBE4 @ =gBg2Tm
	mov sl, r0
_0809DB88:
	ldr r2, [sp]
	adds r1, r4, r2
	cmp r1, #0x1d
	bhi _0809DBF8
	adds r3, r4, #1
	mov sb, r3
	ldr r2, _0809DBE8 @ =0x02012BFC
	lsls r1, r1, #1
	movs r3, #0x80
	lsls r3, r3, #5
	adds r0, r2, r3
	adds r0, r0, r1
	mov ip, r0
	adds r7, r1, r2
	adds r6, r1, #0
	lsls r0, r4, #1
	ldr r4, _0809DBEC @ =gBg0Tm
	adds r5, r0, r4
	adds r3, r0, #0
	ldr r0, _0809DBF0 @ =gBg1Tm
	mov r8, r0
	movs r4, #0x13
_0809DBB4:
	ldrh r0, [r7]
	strh r0, [r5]
	mov r2, r8
	adds r1, r3, r2
	ldr r2, _0809DBF4 @ =0x020133FC
	adds r0, r6, r2
	ldrh r0, [r0]
	strh r0, [r1]
	mov r0, sl
	adds r1, r3, r0
	mov r2, ip
	ldrh r0, [r2]
	strh r0, [r1]
	movs r0, #0x40
	add ip, r0
	adds r7, #0x40
	adds r6, #0x40
	adds r5, #0x40
	adds r3, #0x40
	subs r4, #1
	cmp r4, #0
	bge _0809DBB4
	b _0809DC20
	.align 2, 0
_0809DBE4: .4byte gBg2Tm
_0809DBE8: .4byte 0x02012BFC
_0809DBEC: .4byte gBg0Tm
_0809DBF0: .4byte gBg1Tm
_0809DBF4: .4byte 0x020133FC
_0809DBF8:
	adds r1, r4, #1
	mov sb, r1
	movs r3, #0
	lsls r0, r4, #1
	mov r4, sl
	adds r2, r0, r4
	ldr r4, _0809DC3C @ =gBg1Tm
	adds r1, r0, r4
	ldr r4, _0809DC40 @ =gBg0Tm
	adds r0, r0, r4
	movs r4, #0x13
_0809DC0E:
	strh r3, [r0]
	strh r3, [r1]
	strh r3, [r2]
	adds r2, #0x40
	adds r1, #0x40
	adds r0, #0x40
	subs r4, #1
	cmp r4, #0
	bge _0809DC0E
_0809DC20:
	mov r4, sb
	cmp r4, #0x1d
	ble _0809DB88
	movs r0, #7
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
_0809DC3C: .4byte gBg1Tm
_0809DC40: .4byte gBg0Tm

	thumb_func_start sub_809DC44
sub_809DC44: @ 0x0809DC44
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r7, r0, #0
	movs r0, #0x3a
	adds r0, r0, r7
	mov r8, r0
	ldrb r0, [r0]
	adds r0, #1
	movs r6, #0
	mov r1, r8
	strb r0, [r1]
	movs r4, #0xa
	subs r4, r4, r0
	lsls r0, r4, #3
	muls r0, r4, r0
	movs r1, #0x64
	bl __divsi3
	movs r5, #8
	subs r5, r5, r0
	lsls r0, r4, #4
	muls r0, r4, r0
	movs r1, #0x64
	bl __divsi3
	movs r4, #0x10
	subs r4, r4, r0
	rsbs r0, r5, #0
	lsls r0, r0, #3
	str r0, [r7, #0x30]
	adds r0, r5, #0
	bl sub_809DB74
	ldr r1, [r7, #0x30]
	adds r1, #0x38
	ldr r0, _0809DCE4 @ =0x000001FF
	ands r1, r0
	adds r0, r7, #0
	adds r0, #0x3f
	ldrb r2, [r0]
	movs r0, #0
	bl sub_8007B80
	ldr r3, _0809DCE8 @ =gDispIo
	adds r2, r3, #0
	adds r2, #0x3c
	movs r0, #0x3f
	ldrb r1, [r2]
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r2]
	adds r0, r3, #0
	adds r0, #0x44
	strb r4, [r0]
	movs r0, #0x10
	subs r0, r0, r4
	adds r1, r3, #0
	adds r1, #0x45
	strb r0, [r1]
	adds r0, r3, #0
	adds r0, #0x46
	strb r6, [r0]
	mov r0, r8
	ldrb r0, [r0]
	cmp r0, #0xa
	bne _0809DCDA
	adds r0, r7, #0
	bl Proc_Break
	ldr r0, [r7, #0x2c]
	bl GetNextSupportScreenUnit
	str r0, [r7, #0x2c]
_0809DCDA:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0809DCE4: .4byte 0x000001FF
_0809DCE8: .4byte gDispIo

	thumb_func_start sub_809DCEC
sub_809DCEC: @ 0x0809DCEC
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	adds r7, r0, #0
	movs r0, #0x3a
	adds r0, r0, r7
	mov sb, r0
	ldrb r0, [r0]
	adds r0, #1
	movs r1, #0
	mov r8, r1
	mov r1, sb
	strb r0, [r1]
	movs r4, #0xa
	subs r4, r4, r0
	lsls r0, r4, #3
	muls r0, r4, r0
	movs r1, #0x64
	bl __divsi3
	adds r6, r0, #0
	movs r5, #8
	subs r6, r5, r6
	lsls r0, r4, #4
	muls r0, r4, r0
	movs r1, #0x64
	bl __divsi3
	movs r4, #0x10
	subs r4, r4, r0
	subs r5, r5, r6
	lsls r5, r5, #3
	str r5, [r7, #0x30]
	subs r6, #8
	adds r0, r6, #0
	bl sub_809DB74
	ldr r1, [r7, #0x30]
	adds r1, #0x38
	ldr r0, _0809DD90 @ =0x000001FF
	ands r1, r0
	adds r0, r7, #0
	adds r0, #0x3f
	ldrb r2, [r0]
	movs r0, #0
	bl sub_8007B80
	ldr r3, _0809DD94 @ =gDispIo
	adds r2, r3, #0
	adds r2, #0x3c
	movs r0, #0x3f
	ldrb r1, [r2]
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r2]
	movs r0, #0x10
	subs r0, r0, r4
	adds r1, r3, #0
	adds r1, #0x44
	strb r0, [r1]
	adds r0, r3, #0
	adds r0, #0x45
	strb r4, [r0]
	adds r0, #1
	mov r1, r8
	strb r1, [r0]
	mov r0, sb
	ldrb r0, [r0]
	cmp r0, #0xa
	bne _0809DD82
	adds r0, r7, #0
	bl Proc_Break
_0809DD82:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0809DD90: .4byte 0x000001FF
_0809DD94: .4byte gDispIo

	thumb_func_start sub_809DD98
sub_809DD98: @ 0x0809DD98
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r7, r0, #0
	movs r0, #0x3a
	adds r0, r0, r7
	mov r8, r0
	ldrb r0, [r0]
	adds r0, #1
	movs r6, #0
	mov r1, r8
	strb r0, [r1]
	movs r4, #0xa
	subs r4, r4, r0
	lsls r0, r4, #3
	muls r0, r4, r0
	movs r1, #0x64
	bl __divsi3
	movs r5, #8
	subs r5, r5, r0
	lsls r0, r4, #4
	muls r0, r4, r0
	movs r1, #0x64
	bl __divsi3
	movs r4, #0x10
	subs r4, r4, r0
	lsls r0, r5, #3
	str r0, [r7, #0x30]
	rsbs r5, r5, #0
	adds r0, r5, #0
	bl sub_809DB74
	ldr r1, [r7, #0x30]
	adds r1, #0x38
	ldr r0, _0809DE38 @ =0x000001FF
	ands r1, r0
	adds r0, r7, #0
	adds r0, #0x3f
	ldrb r2, [r0]
	movs r0, #0
	bl sub_8007B80
	ldr r3, _0809DE3C @ =gDispIo
	adds r2, r3, #0
	adds r2, #0x3c
	movs r0, #0x3f
	ldrb r1, [r2]
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r2]
	adds r0, r3, #0
	adds r0, #0x44
	strb r4, [r0]
	movs r0, #0x10
	subs r0, r0, r4
	adds r1, r3, #0
	adds r1, #0x45
	strb r0, [r1]
	adds r0, r3, #0
	adds r0, #0x46
	strb r6, [r0]
	mov r0, r8
	ldrb r0, [r0]
	cmp r0, #0xa
	bne _0809DE2E
	adds r0, r7, #0
	bl Proc_Break
	ldr r0, [r7, #0x2c]
	bl sub_809BA38
	str r0, [r7, #0x2c]
_0809DE2E:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0809DE38: .4byte 0x000001FF
_0809DE3C: .4byte gDispIo

	thumb_func_start sub_809DE40
sub_809DE40: @ 0x0809DE40
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	adds r7, r0, #0
	movs r0, #0x3a
	adds r0, r0, r7
	mov sb, r0
	ldrb r0, [r0]
	adds r0, #1
	movs r1, #0
	mov r8, r1
	mov r1, sb
	strb r0, [r1]
	movs r4, #0xa
	subs r4, r4, r0
	lsls r0, r4, #3
	muls r0, r4, r0
	movs r1, #0x64
	bl __divsi3
	adds r5, r0, #0
	movs r6, #8
	subs r5, r6, r5
	lsls r0, r4, #4
	muls r0, r4, r0
	movs r1, #0x64
	bl __divsi3
	movs r4, #0x10
	subs r4, r4, r0
	adds r0, r5, #0
	subs r0, #8
	lsls r0, r0, #3
	str r0, [r7, #0x30]
	subs r6, r6, r5
	adds r0, r6, #0
	bl sub_809DB74
	ldr r1, [r7, #0x30]
	adds r1, #0x38
	ldr r0, _0809DEE4 @ =0x000001FF
	ands r1, r0
	adds r0, r7, #0
	adds r0, #0x3f
	ldrb r2, [r0]
	movs r0, #0
	bl sub_8007B80
	ldr r3, _0809DEE8 @ =gDispIo
	adds r2, r3, #0
	adds r2, #0x3c
	movs r0, #0x3f
	ldrb r1, [r2]
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r2]
	movs r0, #0x10
	subs r0, r0, r4
	adds r1, r3, #0
	adds r1, #0x44
	strb r0, [r1]
	adds r0, r3, #0
	adds r0, #0x45
	strb r4, [r0]
	adds r0, #1
	mov r1, r8
	strb r1, [r0]
	mov r0, sb
	ldrb r0, [r0]
	cmp r0, #0xa
	bne _0809DED8
	adds r0, r7, #0
	bl Proc_Break
_0809DED8:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0809DEE4: .4byte 0x000001FF
_0809DEE8: .4byte gDispIo

	thumb_func_start sub_809DEEC
sub_809DEEC: @ 0x0809DEEC
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	bl InitFaces
	bl ResetText
	bl InitIcons
	ldr r0, _0809DF9C @ =gBg0Tm
	movs r1, #0
	bl TmFill
	ldr r4, _0809DFA0 @ =gBg1Tm
	adds r0, r4, #0
	movs r1, #0
	bl TmFill
	ldr r0, _0809DFA4 @ =gBg2Tm
	movs r1, #0
	bl TmFill
	adds r2, r5, #0
	adds r2, #0x39
	movs r0, #0xfc
	ldrb r1, [r2]
	ands r0, r1
	movs r1, #0xe3
	ands r0, r1
	strb r0, [r2]
	ldr r0, [r5, #0x2c]
	bl sub_809BAB8
	bl sub_809CEA8
	adds r1, r5, #0
	adds r1, #0x3c
	strb r0, [r1]
	adds r0, r5, #0
	bl InitSupportSubScreenPartners
	adds r0, r5, #0
	bl sub_809D420
	adds r0, r5, #0
	bl sub_809D450
	adds r0, r5, #0
	movs r1, #0
	movs r2, #1
	bl sub_809D528
	ldr r1, _0809DFA8 @ =gUnk_0842C3C0
	movs r2, #0xa4
	lsls r2, r2, #7
	adds r0, r4, #0
	bl TmApplyTsa_thm
	ldr r4, _0809DFAC @ =gCharacterData
	ldr r0, [r5, #0x2c]
	bl sub_809BAB8
	subs r0, #1
	movs r1, #0x34
	muls r0, r1, r0
	adds r0, r0, r4
	ldrh r4, [r0, #6]
	adds r0, r4, #0
	bl ShouldFaceBeRaised
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0809DFB0
	adds r1, r5, #0
	adds r1, #0x3f
	movs r0, #0
	strb r0, [r1]
	movs r0, #0x80
	lsls r0, r0, #1
	str r0, [sp]
	movs r0, #0
	adds r1, r4, #0
	movs r2, #0x38
	movs r3, #0
	bl StartBmFace
	b _0809DFC8
	.align 2, 0
_0809DF9C: .4byte gBg0Tm
_0809DFA0: .4byte gBg1Tm
_0809DFA4: .4byte gBg2Tm
_0809DFA8: .4byte gUnk_0842C3C0
_0809DFAC: .4byte gCharacterData
_0809DFB0:
	adds r1, r5, #0
	adds r1, #0x3f
	movs r0, #8
	strb r0, [r1]
	adds r0, #0xfc
	str r0, [sp]
	movs r0, #0
	adds r1, r4, #0
	movs r2, #0x38
	movs r3, #8
	bl StartBmFace
_0809DFC8:
	adds r0, r5, #0
	bl sub_809D4D0
	adds r0, r5, #0
	bl sub_809D1C8
	bl sub_809CE20
	adds r1, r5, #0
	adds r1, #0x3a
	movs r0, #0
	strb r0, [r1]
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start sub_809DFE8
sub_809DFE8: @ 0x0809DFE8
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r0, _0809E0B4 @ =gDispIo
	mov ip, r0
	movs r1, #4
	rsbs r1, r1, #0
	adds r0, r1, #0
	mov r2, ip
	ldrb r2, [r2, #0xc]
	ands r0, r2
	movs r3, #1
	orrs r0, r3
	mov r5, ip
	strb r0, [r5, #0xc]
	movs r2, #3
	ldrb r0, [r5, #0x10]
	orrs r0, r2
	strb r0, [r5, #0x10]
	ldrb r0, [r5, #0x14]
	ands r1, r0
	orrs r1, r3
	strb r1, [r5, #0x14]
	ldrb r1, [r5, #0x18]
	orrs r2, r1
	strb r2, [r5, #0x18]
	mov r2, ip
	adds r2, #0x3c
	movs r0, #0x3f
	ldrb r3, [r2]
	ands r0, r3
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r2]
	mov r0, ip
	adds r0, #0x44
	movs r1, #0
	strb r1, [r0]
	mov r3, ip
	adds r3, #0x45
	movs r0, #0xc
	strb r0, [r3]
	mov r0, ip
	adds r0, #0x46
	strb r1, [r0]
	ldr r0, _0809E0B8 @ =0x0000FFE0
	ldrh r5, [r5, #0x3c]
	ands r0, r5
	ldr r1, _0809E0BC @ =0x0000E0FF
	ands r0, r1
	movs r3, #0xf8
	lsls r3, r3, #5
	adds r1, r3, #0
	orrs r0, r1
	mov r5, ip
	strh r0, [r5, #0x3c]
	movs r1, #0x21
	rsbs r1, r1, #0
	adds r0, r1, #0
	ldrb r3, [r2]
	ands r0, r3
	strb r0, [r2]
	mov r0, ip
	adds r0, #0x3d
	ldrb r5, [r0]
	ands r1, r5
	strb r1, [r0]
	adds r0, r4, #0
	adds r0, #0x38
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne _0809E0AE
	adds r0, r4, #0
	adds r0, #0x3b
	ldrb r0, [r0]
	cmp r0, #0
	beq _0809E0AE
	adds r0, r4, #0
	adds r0, #0x39
	ldrb r1, [r0]
	movs r0, #3
	ands r0, r1
	lsls r0, r0, #3
	adds r0, #0xc4
	lsrs r1, r1, #2
	movs r2, #7
	ands r1, r2
	lsls r1, r1, #4
	adds r1, #0x18
	movs r3, #0x80
	lsls r3, r3, #4
	movs r2, #1
	bl ShowSysHandCursor
	adds r1, r4, #0
	adds r1, #0x3a
	movs r0, #0xff
	strb r0, [r1]
_0809E0AE:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0809E0B4: .4byte gDispIo
_0809E0B8: .4byte 0x0000FFE0
_0809E0BC: .4byte 0x0000E0FF

	thumb_func_start sub_809E0C0
sub_809E0C0: @ 0x0809E0C0
	push {r4, lr}
	adds r4, r0, #0
	bl EndAllProcChildren
	bl EndMuralBackground_
	movs r0, #0
	bl EndFaceById
	ldr r0, [r4, #0x2c]
	bl sub_809C92C
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_809E0E0
sub_809E0E0: @ 0x0809E0E0
	push {r4, lr}
	sub sp, #4
	adds r4, r0, #0
	ldr r0, [r4, #0x2c]
	adds r1, r4, #0
	adds r1, #0x39
	ldrb r3, [r1]
	lsrs r1, r3, #2
	movs r2, #7
	ands r1, r2
	movs r2, #3
	ands r2, r3
	adds r2, #1
	bl sub_809C948
	adds r4, #0x3e
	movs r3, #0
	strb r0, [r4]
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0809E11C
	movs r1, #0x80
	lsls r1, r1, #1
	str r3, [sp]
	movs r0, #0x30
	movs r2, #0x80
	movs r3, #0x10
	bl CallSomeSoundMaybe
	b _0809E12C
_0809E11C:
	ldrb r0, [r4]
	movs r2, #0x80
	lsls r2, r2, #1
	str r3, [sp]
	adds r1, r2, #0
	movs r3, #0x10
	bl CallSomeSoundMaybe
_0809E12C:
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_809E134
sub_809E134: @ 0x0809E134
	push {lr}
	sub sp, #4
	adds r0, #0x3e
	ldrb r0, [r0]
	cmp r0, #0
	bne _0809E152
	movs r2, #0x80
	lsls r2, r2, #1
	str r0, [sp]
	movs r0, #0x30
	movs r1, #0x80
	movs r3, #0x10
	bl CallSomeSoundMaybe
	b _0809E164
_0809E152:
	movs r2, #0x80
	lsls r2, r2, #1
	movs r0, #0
	str r0, [sp]
	movs r0, #0x30
	adds r1, r2, #0
	movs r3, #0x10
	bl CallSomeSoundMaybe
_0809E164:
	add sp, #4
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_809E16C
sub_809E16C: @ 0x0809E16C
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r1, r2, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	ldr r0, _0809E18C @ =gUnk_08D8DEF8
	bl Proc_StartBlocking
	adds r1, r0, #0
	adds r1, #0x38
	strb r4, [r1]
	str r5, [r0, #0x2c]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0809E18C: .4byte gUnk_08D8DEF8

	thumb_func_start sub_809E190
sub_809E190: @ 0x0809E190
	push {r4, lr}
	ldrb r3, [r1]
	str r3, [r0, #8]
	ldrb r4, [r1, #2]
	lsls r2, r4, #8
	ldrb r1, [r1, #1]
	orrs r2, r1
	str r2, [r0, #4]
	str r3, [r0, #0xc]
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_809E1A8
sub_809E1A8: @ 0x0809E1A8
	ldr r2, [r0, #8]
	strb r2, [r1]
	ldr r0, [r0, #4]
	strb r0, [r1, #1]
	asrs r0, r0, #0x10
	strb r0, [r1, #2]
	bx lr
	.align 2, 0

	thumb_func_start sub_809E1B8
sub_809E1B8: @ 0x0809E1B8
	adds r2, r0, #0
	ldr r1, [r2, #0xc]
	movs r0, #0xd
	muls r0, r1, r0
	adds r0, #1
	movs r1, #0xff
	ands r0, r1
	str r0, [r2, #0xc]
	bx lr
	.align 2, 0

	thumb_func_start sub_809E1CC
sub_809E1CC: @ 0x0809E1CC
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	adds r7, r1, #0
	ldr r0, _0809E208 @ =0x020143FC
	str r4, [r0]
	ldr r1, _0809E20C @ =0x02014400
	movs r0, #1
	lsls r0, r4
	subs r0, #1
	str r0, [r1]
	ldr r6, _0809E210 @ =0x02014404
	movs r0, #0x1e
	adds r1, r4, #0
	bl __divsi3
	adds r5, r0, #0
	str r5, [r6]
	movs r0, #0x1e
	adds r1, r4, #0
	bl __modsi3
	cmp r0, #0
	ble _0809E1FE
	adds r0, r5, #1
	str r0, [r6]
_0809E1FE:
	ldr r0, _0809E214 @ =0x02014408
	str r7, [r0]
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0809E208: .4byte 0x020143FC
_0809E20C: .4byte 0x02014400
_0809E210: .4byte 0x02014404
_0809E214: .4byte 0x02014408

	thumb_func_start sub_809E218
sub_809E218: @ 0x0809E218
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	ldr r0, _0809E240 @ =0x020143FC
	ldr r4, [r0]
	adds r0, r5, #0
	adds r1, r4, #0
	bl __divsi3
	adds r6, r0, #0
	adds r0, r5, #0
	adds r1, r4, #0
	bl __modsi3
	cmp r0, #0
	ble _0809E238
	adds r6, #1
_0809E238:
	adds r0, r6, #0
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_0809E240: .4byte 0x020143FC

	thumb_func_start sub_809E244
sub_809E244: @ 0x0809E244
	ldr r2, _0809E258 @ =0x02014434
	ldr r1, [r2]
	movs r0, #0xd
	muls r0, r1, r0
	adds r0, #1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [r2]
	bx lr
	.align 2, 0
_0809E258: .4byte 0x02014434

	thumb_func_start sub_809E25C
sub_809E25C: @ 0x0809E25C
	push {r4, r5, r6, lr}
	movs r4, #0
	ldr r1, _0809E290 @ =0x02014404
	ldr r0, [r1]
	cmp r4, r0
	bge _0809E288
	ldr r6, _0809E294 @ =0x02014438
	adds r5, r1, #0
_0809E26C:
	ldr r0, [r5]
	adds r0, r4, r0
	lsls r1, r4, #1
	adds r0, r0, r1
	adds r0, r0, r6
	ldrb r3, [r0]
	adds r2, r4, r6
	ldrb r1, [r2]
	strb r1, [r0]
	strb r3, [r2]
	adds r4, #1
	ldr r0, [r5]
	cmp r4, r0
	blt _0809E26C
_0809E288:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0809E290: .4byte 0x02014404
_0809E294: .4byte 0x02014438

	thumb_func_start sub_809E298
sub_809E298: @ 0x0809E298
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	str r0, [sp]
	mov sl, r1
	mov r8, r2
	mov sb, r3
	bl sub_809E244
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	add r8, r0
	movs r0, #1
	mov r1, sb
	lsls r0, r1
	subs r0, #1
	mov r1, r8
	ands r1, r0
	mov r8, r1
	movs r2, #0
	cmp r2, sb
	bge _0809E318
_0809E2CA:
	ldr r0, _0809E328 @ =0x020143FC
	mov r1, sl
	ldr r6, [r1]
	ldr r4, [r0]
	adds r0, r6, #0
	adds r1, r4, #0
	str r2, [sp, #4]
	bl __divsi3
	ldr r1, [sp]
	adds r7, r1, r0
	movs r5, #1
	ldr r2, [sp, #4]
	lsls r5, r2
	mov r0, r8
	ands r5, r0
	asrs r5, r2
	adds r0, r6, #0
	adds r1, r4, #0
	bl __modsi3
	adds r1, r0, #0
	ldr r2, [sp, #4]
	cmp r1, #0
	bge _0809E2FE
	adds r0, r1, #7
_0809E2FE:
	asrs r0, r0, #3
	lsls r0, r0, #3
	subs r0, r1, r0
	lsls r5, r0
	ldrb r1, [r7]
	orrs r5, r1
	strb r5, [r7]
	adds r0, r6, #1
	mov r1, sl
	str r0, [r1]
	adds r2, #1
	cmp r2, sb
	blt _0809E2CA
_0809E318:
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0809E328: .4byte 0x020143FC

	thumb_func_start sub_809E32C
sub_809E32C: @ 0x0809E32C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	str r0, [sp]
	mov r8, r1
	mov sb, r2
	movs r0, #0
	mov sl, r0
	movs r7, #0
	cmp sl, sb
	bge _0809E390
_0809E348:
	ldr r0, _0809E3B8 @ =0x020143FC
	mov r1, r8
	ldr r6, [r1]
	ldr r4, [r0]
	adds r0, r6, #0
	adds r1, r4, #0
	bl __divsi3
	ldr r2, [sp]
	adds r0, r2, r0
	ldrb r5, [r0]
	adds r0, r6, #0
	adds r1, r4, #0
	bl __modsi3
	adds r1, r0, #0
	cmp r1, #0
	bge _0809E36E
	adds r0, r1, #7
_0809E36E:
	asrs r0, r0, #3
	lsls r0, r0, #3
	subs r0, r1, r0
	movs r1, #1
	lsls r1, r0
	ands r5, r1
	asrs r5, r0
	lsls r5, r7
	mov r0, sl
	orrs r0, r5
	mov sl, r0
	adds r0, r6, #1
	mov r1, r8
	str r0, [r1]
	adds r7, #1
	cmp r7, sb
	blt _0809E348
_0809E390:
	bl sub_809E244
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov r2, sl
	subs r0, r2, r0
	movs r1, #1
	mov r2, sb
	lsls r1, r2
	subs r1, #1
	ands r0, r1
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0809E3B8: .4byte 0x020143FC

	thumb_func_start sub_809E3BC
sub_809E3BC: @ 0x0809E3BC
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r3, r1, #0
	movs r2, #0
	movs r1, #0
	cmp r2, r3
	bge _0809E3E2
_0809E3CA:
	adds r0, r4, r1
	ldrb r6, [r0]
	adds r5, r6, #0
	muls r5, r6, r5
	adds r0, r5, #0
	adds r1, #1
	muls r0, r1, r0
	adds r0, r2, r0
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	cmp r1, r3
	blt _0809E3CA
_0809E3E2:
	lsrs r0, r2, #8
	adds r0, r2, r0
	asrs r1, r2, #0x10
	adds r0, r0, r1
	ldr r2, _0809E3F8 @ =0x000003FF
	adds r1, r2, #0
	ands r0, r1
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_0809E3F8: .4byte 0x000003FF

	thumb_func_start sub_809E3FC
sub_809E3FC: @ 0x0809E3FC
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	movs r6, #0
	ldr r0, _0809E434 @ =0x02014404
	ldr r0, [r0]
	ldr r5, _0809E438 @ =0x02014438
	adds r0, r0, r5
	ldr r4, _0809E43C @ =0x020144D8
	ldrh r1, [r4, #6]
	bl sub_809E3BC
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov sb, r0
	adds r7, r5, #0
	mov r8, r4
_0809E420:
	adds r0, r6, #0
	movs r1, #3
	bl __modsi3
	adds r5, r0, #0
	cmp r5, #0
	bne _0809E440
	mov r0, r8
	ldrh r4, [r0]
	b _0809E458
	.align 2, 0
_0809E434: .4byte 0x02014404
_0809E438: .4byte 0x02014438
_0809E43C: .4byte 0x020144D8
_0809E440:
	cmp r5, #1
	bne _0809E454
	mov r0, r8
	ldrh r4, [r0, #2]
	adds r0, r6, #0
	movs r1, #3
	bl __divsi3
	adds r1, r5, #0
	b _0809E462
_0809E454:
	mov r0, r8
	ldrh r4, [r0, #4]
_0809E458:
	adds r0, r6, #0
	movs r1, #3
	bl __divsi3
	movs r1, #1
_0809E462:
	lsls r1, r0
	ands r4, r1
	asrs r4, r0
	ldr r5, _0809E4C0 @ =0x020143FC
	ldr r1, [r5]
	adds r0, r6, #0
	bl __modsi3
	lsls r4, r0
	ldrb r0, [r7]
	orrs r4, r0
	strb r4, [r7]
	adds r6, #1
	ldr r1, [r5]
	adds r0, r6, #0
	bl __modsi3
	cmp r0, #0
	bne _0809E48A
	adds r7, #1
_0809E48A:
	cmp r6, #0x1e
	bne _0809E420
	movs r2, #0
	ldr r3, _0809E4C4 @ =0x02014404
	ldr r0, [r3]
	cmp r2, r0
	bge _0809E4B0
	ldr r5, _0809E4C8 @ =0x02014438
	ldr r4, _0809E4CC @ =0x02014400
_0809E49C:
	adds r0, r2, r5
	ldrb r1, [r0]
	add r1, sb
	ldrb r6, [r4]
	ands r1, r6
	strb r1, [r0]
	adds r2, #1
	ldr r0, [r3]
	cmp r2, r0
	blt _0809E49C
_0809E4B0:
	bl sub_809E25C
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0809E4C0: .4byte 0x020143FC
_0809E4C4: .4byte 0x02014404
_0809E4C8: .4byte 0x02014438
_0809E4CC: .4byte 0x02014400

	thumb_func_start sub_809E4D0
sub_809E4D0: @ 0x0809E4D0
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	movs r0, #0
	mov sl, r0
	movs r7, #0
	bl sub_809E25C
	ldr r4, _0809E568 @ =0x02014404
	ldr r0, [r4]
	ldr r5, _0809E56C @ =0x02014438
	adds r0, r0, r5
	ldr r1, _0809E570 @ =0x020144D8
	ldrh r1, [r1, #6]
	bl sub_809E3BC
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	movs r2, #0
	ldr r0, [r4]
	cmp sl, r0
	bge _0809E51A
	mov r8, r5
	ldr r5, _0809E574 @ =0x02014400
_0809E504:
	mov r1, r8
	adds r0, r2, r1
	ldrb r6, [r0]
	subs r1, r6, r3
	ldrb r6, [r5]
	ands r1, r6
	strb r1, [r0]
	adds r2, #1
	ldr r0, [r4]
	cmp r2, r0
	blt _0809E504
_0809E51A:
	ldr r0, _0809E570 @ =0x020144D8
	movs r1, #0
	strh r1, [r0]
	strh r1, [r0, #2]
	strh r1, [r0, #4]
	ldr r1, _0809E56C @ =0x02014438
	ldr r2, _0809E578 @ =0x020143FC
	mov sb, r2
	mov r8, r0
	mov r0, sl
	adds r6, r0, r1
_0809E530:
	adds r0, r7, #0
	movs r1, #3
	bl __modsi3
	adds r5, r0, #0
	cmp r5, #0
	bne _0809E57C
	ldrb r4, [r6]
	mov r2, sb
	ldr r1, [r2]
	adds r0, r7, #0
	bl __modsi3
	asrs r4, r0
	movs r0, #1
	ands r4, r0
	adds r0, r7, #0
	movs r1, #3
	bl __divsi3
	lsls r4, r0
	mov r0, r8
	ldrh r0, [r0]
	orrs r4, r0
	mov r1, r8
	strh r4, [r1]
	b _0809E5CC
	.align 2, 0
_0809E568: .4byte 0x02014404
_0809E56C: .4byte 0x02014438
_0809E570: .4byte 0x020144D8
_0809E574: .4byte 0x02014400
_0809E578: .4byte 0x020143FC
_0809E57C:
	cmp r5, #1
	bne _0809E5A6
	ldrb r4, [r6]
	mov r2, sb
	ldr r1, [r2]
	adds r0, r7, #0
	bl __modsi3
	asrs r4, r0
	ands r4, r5
	adds r0, r7, #0
	movs r1, #3
	bl __divsi3
	lsls r4, r0
	mov r0, r8
	ldrh r0, [r0, #2]
	orrs r4, r0
	mov r1, r8
	strh r4, [r1, #2]
	b _0809E5CC
_0809E5A6:
	ldrb r4, [r6]
	mov r2, sb
	ldr r1, [r2]
	adds r0, r7, #0
	bl __modsi3
	asrs r4, r0
	movs r0, #1
	ands r4, r0
	adds r0, r7, #0
	movs r1, #3
	bl __divsi3
	lsls r4, r0
	mov r0, r8
	ldrh r0, [r0, #4]
	orrs r4, r0
	mov r1, r8
	strh r4, [r1, #4]
_0809E5CC:
	adds r7, #1
	mov r2, sb
	ldr r1, [r2]
	adds r0, r7, #0
	bl __modsi3
	cmp r0, #0
	bne _0809E5DE
	adds r6, #1
_0809E5DE:
	cmp r7, #0x1e
	bne _0809E530
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_809E5F0
sub_809E5F0: @ 0x0809E5F0
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r3, r0, #0
	movs r0, #0
	str r0, [sp]
	ldr r6, _0809E6A8 @ =0x02014438
	ldr r5, _0809E6AC @ =0x02014404
	adds r2, r6, #0
	movs r1, #0
	adds r0, r6, #0
	adds r0, #0x9f
_0809E606:
	strb r1, [r0]
	subs r0, #1
	cmp r0, r2
	bge _0809E606
	ldr r1, [r5]
	adds r1, r1, r6
	mov r0, sp
	bl _call_via_r3
	ldr r0, [sp]
	bl sub_809E218
	ldr r4, _0809E6B0 @ =0x020144D8
	strh r0, [r4, #6]
	ldr r0, [r5]
	adds r0, r0, r6
	ldrh r1, [r4, #6]
	bl sub_809E3BC
	strh r0, [r4, #2]
	bl GetGameTime
	lsrs r0, r0, #3
	ldrh r1, [r4, #2]
	adds r0, r1, r0
	ldr r5, _0809E6B4 @ =0x000003FF
	ands r0, r5
	strh r0, [r4]
	ldr r1, _0809E6B8 @ =0x02014434
	ldrh r0, [r4]
	str r0, [r1]
	bl sub_809E244
	ldrh r1, [r4, #2]
	adds r0, r0, r1
	ands r0, r5
	strh r0, [r4, #2]
	movs r5, #0
	ldrh r4, [r4, #6]
	cmp r5, r4
	bge _0809E67C
	adds r4, r6, #0
_0809E65A:
	bl sub_809E244
	ldr r1, _0809E6AC @ =0x02014404
	ldr r2, [r1]
	adds r2, r5, r2
	adds r2, r2, r4
	ldrb r1, [r2]
	adds r0, r1, r0
	ldr r1, _0809E6BC @ =0x02014400
	ldrb r1, [r1]
	ands r0, r1
	strb r0, [r2]
	adds r5, #1
	ldr r0, _0809E6B0 @ =0x020144D8
	ldrh r0, [r0, #6]
	cmp r5, r0
	blt _0809E65A
_0809E67C:
	ldr r0, _0809E6AC @ =0x02014404
	ldr r0, [r0]
	ldr r1, _0809E6A8 @ =0x02014438
	adds r0, r0, r1
	ldr r5, _0809E6B0 @ =0x020144D8
	ldrh r1, [r5, #6]
	bl sub_809E3BC
	adds r4, r0, #0
	bl sub_809E244
	adds r4, r4, r0
	ldr r1, _0809E6B4 @ =0x000003FF
	adds r0, r1, #0
	ands r4, r0
	strh r4, [r5, #4]
	bl sub_809E3FC
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0809E6A8: .4byte 0x02014438
_0809E6AC: .4byte 0x02014404
_0809E6B0: .4byte 0x020144D8
_0809E6B4: .4byte 0x000003FF
_0809E6B8: .4byte 0x02014434
_0809E6BC: .4byte 0x02014400

	thumb_func_start sub_809E6C0
sub_809E6C0: @ 0x0809E6C0
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #8
	mov sb, r0
	movs r0, #0
	str r0, [sp, #4]
	bl sub_809E4D0
	ldr r1, _0809E76C @ =0x02014434
	ldr r4, _0809E770 @ =0x020144D8
	ldrh r0, [r4]
	str r0, [r1]
	ldr r0, _0809E774 @ =0x02014404
	ldr r0, [r0]
	ldr r7, _0809E778 @ =0x02014438
	adds r0, r0, r7
	ldrh r1, [r4, #6]
	bl sub_809E3BC
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	bl sub_809E244
	mov r1, sp
	strh r0, [r1]
	movs r5, #0
	add r0, sp, #4
	mov r8, r0
	ldrh r4, [r4, #6]
	cmp r5, r4
	bge _0809E726
	adds r4, r7, #0
_0809E704:
	bl sub_809E244
	ldr r1, _0809E774 @ =0x02014404
	ldr r2, [r1]
	adds r2, r5, r2
	adds r2, r2, r4
	ldrb r1, [r2]
	subs r0, r1, r0
	ldr r1, _0809E77C @ =0x02014400
	ldrb r1, [r1]
	ands r0, r1
	strb r0, [r2]
	adds r5, #1
	ldr r0, _0809E770 @ =0x020144D8
	ldrh r0, [r0, #6]
	cmp r5, r0
	blt _0809E704
_0809E726:
	bl sub_809E244
	mov r1, sp
	strh r0, [r1, #2]
	ldr r5, _0809E774 @ =0x02014404
	ldr r1, [r5]
	ldr r4, _0809E778 @ =0x02014438
	adds r1, r1, r4
	mov r0, r8
	bl _call_via_r9
	ldr r0, [r5]
	adds r0, r0, r4
	ldr r4, _0809E770 @ =0x020144D8
	ldrh r1, [r4, #6]
	bl sub_809E3BC
	mov r1, sp
	ldrh r1, [r1]
	adds r0, r1, r0
	ldr r1, _0809E780 @ =0x000003FF
	adds r2, r1, #0
	ands r0, r2
	mov r1, sp
	ldrh r1, [r1, #2]
	adds r6, r6, r1
	ands r6, r2
	ldrh r1, [r4, #2]
	cmp r1, r0
	bne _0809E768
	ldrh r4, [r4, #4]
	cmp r4, r6
	beq _0809E784
_0809E768:
	movs r0, #0
	b _0809E786
	.align 2, 0
_0809E76C: .4byte 0x02014434
_0809E770: .4byte 0x020144D8
_0809E774: .4byte 0x02014404
_0809E778: .4byte 0x02014438
_0809E77C: .4byte 0x02014400
_0809E780: .4byte 0x000003FF
_0809E784:
	movs r0, #1
_0809E786:
	add sp, #8
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	thumb_func_start sub_809E794
sub_809E794: @ 0x0809E794
	adds r3, r0, #0
	movs r2, #0
	movs r0, #0
	ldrsb r0, [r1, r0]
	cmp r0, #0
	beq _0809E7BA
	ldrh r3, [r3]
_0809E7A2:
	ldrh r0, [r1]
	cmp r0, r3
	bne _0809E7AE
	lsls r0, r2, #0x10
	lsrs r0, r0, #0x10
	b _0809E7BC
_0809E7AE:
	adds r1, #2
	adds r2, #1
	movs r0, #0
	ldrsb r0, [r1, r0]
	cmp r0, #0
	bne _0809E7A2
_0809E7BA:
	ldr r0, _0809E7C0 @ =0x0000FFFF
_0809E7BC:
	bx lr
	.align 2, 0
_0809E7C0: .4byte 0x0000FFFF

	thumb_func_start sub_809E7C4
sub_809E7C4: @ 0x0809E7C4
	push {r4, r5, r6, lr}
	adds r2, r0, #0
	adds r6, r1, #0
	movs r5, #0
	movs r0, #0
	ldrsb r0, [r2, r0]
	cmp r0, #0
	beq _0809E7F0
	adds r4, r2, #0
_0809E7D6:
	adds r0, r4, #0
	adds r1, r6, #0
	bl sub_809E794
	ldr r1, _0809E7F8 @ =0x02014438
	adds r1, r5, r1
	strb r0, [r1]
	adds r4, #2
	adds r5, #1
	movs r0, #0
	ldrsb r0, [r4, r0]
	cmp r0, #0
	bne _0809E7D6
_0809E7F0:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0809E7F8: .4byte 0x02014438

	thumb_func_start sub_809E7FC
sub_809E7FC: @ 0x0809E7FC
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	adds r5, r1, #0
	ldr r1, _0809E8E4 @ =0x02014434
	ldr r0, _0809E8E8 @ =0x02014408
	ldr r0, [r0]
	str r0, [r1]
	ldr r4, _0809E8EC @ =0x020144E0
	ldrb r2, [r4]
	adds r0, r5, #0
	adds r1, r6, #0
	movs r3, #2
	bl sub_809E298
	ldrb r2, [r4, #1]
	adds r0, r5, #0
	adds r1, r6, #0
	movs r3, #1
	bl sub_809E298
	ldrb r2, [r4, #2]
	adds r0, r5, #0
	adds r1, r6, #0
	movs r3, #1
	bl sub_809E298
	ldrb r2, [r4, #0xa]
	adds r0, r5, #0
	adds r1, r6, #0
	movs r3, #8
	bl sub_809E298
	bl GetGameTime
	adds r2, r0, #0
	adds r0, r5, #0
	adds r1, r6, #0
	movs r3, #5
	bl sub_809E298
	ldrb r2, [r4, #3]
	adds r0, r5, #0
	adds r1, r6, #0
	movs r3, #3
	bl sub_809E298
	ldrb r2, [r4, #4]
	adds r0, r5, #0
	adds r1, r6, #0
	movs r3, #3
	bl sub_809E298
	ldrb r2, [r4, #5]
	adds r0, r5, #0
	adds r1, r6, #0
	movs r3, #3
	bl sub_809E298
	ldrb r2, [r4, #6]
	adds r0, r5, #0
	adds r1, r6, #0
	movs r3, #3
	bl sub_809E298
	ldrb r2, [r4, #7]
	adds r0, r5, #0
	adds r1, r6, #0
	movs r3, #3
	bl sub_809E298
	ldrb r2, [r4, #9]
	adds r0, r5, #0
	adds r1, r6, #0
	movs r3, #8
	bl sub_809E298
	ldrb r2, [r4, #8]
	adds r0, r5, #0
	adds r1, r6, #0
	movs r3, #6
	bl sub_809E298
	ldrh r2, [r4, #0xc]
	adds r0, r5, #0
	adds r1, r6, #0
	movs r3, #0xa
	bl sub_809E298
	ldrb r2, [r4, #0xe]
	adds r0, r5, #0
	adds r1, r6, #0
	movs r3, #6
	bl sub_809E298
	ldrb r2, [r4, #0xf]
	adds r0, r5, #0
	adds r1, r6, #0
	movs r3, #6
	bl sub_809E298
	ldrb r2, [r4, #0xb]
	adds r0, r5, #0
	adds r1, r6, #0
	movs r3, #8
	bl sub_809E298
	ldr r2, [r4, #0x10]
	adds r0, r5, #0
	adds r1, r6, #0
	movs r3, #0x18
	bl sub_809E298
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0809E8E4: .4byte 0x02014434
_0809E8E8: .4byte 0x02014408
_0809E8EC: .4byte 0x020144E0

	thumb_func_start sub_809E8F0
sub_809E8F0: @ 0x0809E8F0
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	adds r4, r1, #0
	ldr r1, _0809E9D0 @ =0x02014434
	ldr r0, _0809E9D4 @ =0x02014408
	ldr r0, [r0]
	str r0, [r1]
	adds r0, r4, #0
	adds r1, r6, #0
	movs r2, #2
	bl sub_809E32C
	ldr r5, _0809E9D8 @ =0x020144E0
	strb r0, [r5]
	adds r0, r4, #0
	adds r1, r6, #0
	movs r2, #1
	bl sub_809E32C
	strb r0, [r5, #1]
	adds r0, r4, #0
	adds r1, r6, #0
	movs r2, #1
	bl sub_809E32C
	strb r0, [r5, #2]
	adds r0, r4, #0
	adds r1, r6, #0
	movs r2, #8
	bl sub_809E32C
	strb r0, [r5, #0xa]
	adds r0, r4, #0
	adds r1, r6, #0
	movs r2, #5
	bl sub_809E32C
	adds r0, r4, #0
	adds r1, r6, #0
	movs r2, #3
	bl sub_809E32C
	strb r0, [r5, #3]
	adds r0, r4, #0
	adds r1, r6, #0
	movs r2, #3
	bl sub_809E32C
	strb r0, [r5, #4]
	adds r0, r4, #0
	adds r1, r6, #0
	movs r2, #3
	bl sub_809E32C
	strb r0, [r5, #5]
	adds r0, r4, #0
	adds r1, r6, #0
	movs r2, #3
	bl sub_809E32C
	strb r0, [r5, #6]
	adds r0, r4, #0
	adds r1, r6, #0
	movs r2, #3
	bl sub_809E32C
	strb r0, [r5, #7]
	adds r0, r4, #0
	adds r1, r6, #0
	movs r2, #8
	bl sub_809E32C
	strb r0, [r5, #9]
	adds r0, r4, #0
	adds r1, r6, #0
	movs r2, #6
	bl sub_809E32C
	strb r0, [r5, #8]
	adds r0, r4, #0
	adds r1, r6, #0
	movs r2, #0xa
	bl sub_809E32C
	strh r0, [r5, #0xc]
	adds r0, r4, #0
	adds r1, r6, #0
	movs r2, #6
	bl sub_809E32C
	strb r0, [r5, #0xe]
	adds r0, r4, #0
	adds r1, r6, #0
	movs r2, #6
	bl sub_809E32C
	strb r0, [r5, #0xf]
	adds r0, r4, #0
	adds r1, r6, #0
	movs r2, #8
	bl sub_809E32C
	strb r0, [r5, #0xb]
	adds r0, r4, #0
	adds r1, r6, #0
	movs r2, #0x18
	bl sub_809E32C
	str r0, [r5, #0x10]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0809E9D0: .4byte 0x02014434
_0809E9D4: .4byte 0x02014408
_0809E9D8: .4byte 0x020144E0

	thumb_func_start sub_809E9DC
sub_809E9DC: @ 0x0809E9DC
	push {r4, r5, r6, lr}
	sub sp, #0x1c
	adds r5, r0, #0
	adds r6, r1, #0
	add r0, sp, #0x18
	movs r1, #0
	strh r1, [r0]
	ldr r4, _0809EA94 @ =0x020144E0
	ldr r2, _0809EA98 @ =0x0100000A
	adds r1, r4, #0
	bl CpuSet
	mov r0, sp
	adds r1, r5, #0
	adds r2, r6, #0
	bl sub_809FC60
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0809EAA0
	strb r5, [r4]
	strb r6, [r4, #2]
	mov r0, sp
	ldrb r0, [r0]
	lsls r0, r0, #0x19
	lsrs r0, r0, #0x1d
	strb r0, [r4, #3]
	mov r0, sp
	ldrh r0, [r0]
	lsls r0, r0, #0x16
	lsrs r0, r0, #0x1d
	strb r0, [r4, #4]
	mov r0, sp
	ldrb r1, [r0, #1]
	lsls r0, r1, #0x1b
	lsrs r0, r0, #0x1d
	strb r0, [r4, #5]
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x1d
	strb r1, [r4, #6]
	strb r1, [r4, #7]
	mov r0, sp
	ldrh r0, [r0, #2]
	lsrs r0, r0, #7
	strb r0, [r4, #9]
	mov r0, sp
	ldrh r0, [r0, #0xa]
	lsls r0, r0, #0x15
	lsrs r0, r0, #0x1a
	strb r0, [r4, #8]
	mov r0, sp
	ldrb r0, [r0, #2]
	lsls r0, r0, #0x19
	lsrs r0, r0, #0x1f
	strb r0, [r4, #1]
	ldr r0, [sp, #4]
	lsls r0, r0, #0xf
	lsrs r0, r0, #0x16
	strh r0, [r4, #0xc]
	mov r0, sp
	ldrb r0, [r0, #6]
	lsls r0, r0, #0x19
	lsrs r0, r0, #0x1a
	strb r0, [r4, #0xe]
	mov r0, sp
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x13
	lsrs r0, r0, #0x1a
	strb r0, [r4, #0xf]
	mov r0, sp
	ldrb r0, [r0, #7]
	lsrs r2, r0, #5
	ldr r0, [sp, #8]
	ldr r1, _0809EA9C @ =0x001FFFFF
	ands r0, r1
	lsls r0, r0, #3
	orrs r0, r2
	str r0, [r4, #0x10]
	mov r0, sp
	ldrb r0, [r0, #0x17]
	strb r0, [r4, #0xa]
	mov r2, sp
	ldrb r1, [r2, #3]
	lsrs r1, r1, #7
	movs r0, #0x7f
	ldrb r2, [r2, #4]
	ands r0, r2
	lsls r0, r0, #1
	orrs r0, r1
	strb r0, [r4, #0xb]
	movs r0, #1
	b _0809EAA2
	.align 2, 0
_0809EA94: .4byte 0x020144E0
_0809EA98: .4byte 0x0100000A
_0809EA9C: .4byte 0x001FFFFF
_0809EAA0:
	movs r0, #0
_0809EAA2:
	add sp, #0x1c
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_809EAAC
sub_809EAAC: @ 0x0809EAAC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x14
	str r0, [sp, #0xc]
	mov r8, r1
	add r1, sp, #8
	movs r0, #0
	strb r0, [r1, #2]
	movs r0, #4
	bl EnableBgSync
	movs r0, #0
	str r0, [sp, #0x10]
	add r7, sp, #8
	movs r1, #0xe0
	lsls r1, r1, #1
	mov sl, r1
	mov sb, r0
	movs r6, #0
_0809EAD8:
	ldr r2, [sp, #0xc]
	adds r0, r2, r6
	bl ClearText
	movs r5, #2
	bl InitTalkTextFont
	movs r4, #0
_0809EAE8:
	mov r0, sb
	adds r2, r0, r4
	ldr r1, _0809EB64 @ =0x020144D8
	ldr r0, _0809EB68 @ =0x02014404
	ldr r0, [r0]
	ldrh r1, [r1, #6]
	adds r0, r1, r0
	cmp r2, r0
	beq _0809EB54
	ldr r1, _0809EB6C @ =0x02014438
	adds r1, r2, r1
	ldrb r2, [r1]
	lsls r0, r2, #1
	add r0, r8
	ldrb r0, [r0]
	strb r0, [r7]
	ldrb r1, [r1]
	lsls r0, r1, #1
	add r0, r8
	ldrb r0, [r0, #1]
	strb r0, [r7, #1]
	movs r0, #0
	str r0, [sp]
	add r1, sp, #8
	str r1, [sp, #4]
	ldr r2, [sp, #0xc]
	adds r0, r2, r6
	ldr r1, _0809EB70 @ =gBg2Tm + 0x8
	add r1, sl
	movs r2, #1
	adds r3, r5, #0
	bl PutDrawText
	adds r5, #0xb
	adds r4, #1
	adds r0, r4, #0
	movs r1, #5
	bl __modsi3
	cmp r0, #0
	bne _0809EB3C
	adds r5, #0xb
_0809EB3C:
	cmp r4, #0xd
	ble _0809EAE8
	movs r0, #0xc0
	add sl, r0
	movs r1, #0xe
	add sb, r1
	adds r6, #8
	ldr r2, [sp, #0x10]
	adds r2, #1
	str r2, [sp, #0x10]
	cmp r2, #2
	ble _0809EAD8
_0809EB54:
	add sp, #0x14
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0809EB64: .4byte 0x020144D8
_0809EB68: .4byte 0x02014404
_0809EB6C: .4byte 0x02014438
_0809EB70: .4byte gBg2Tm + 0x8

	thumb_func_start sub_809EB74
sub_809EB74: @ 0x0809EB74
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	adds r6, r0, #0
	lsls r4, r6, #6
	ldr r7, _0809EC6C @ =gBg2Tm + 0x4
	adds r0, r4, r7
	ldr r5, _0809EC70 @ =0x020144E0
	ldrb r2, [r5]
	movs r1, #2
	bl PutNumberOrBlank
	adds r0, r7, #6
	mov r8, r0
	adds r0, r4, r0
	ldrb r2, [r5, #2]
	movs r1, #2
	bl PutNumberOrBlank
	movs r1, #0x14
	adds r1, r1, r7
	mov sl, r1
	adds r0, r4, r1
	ldrb r2, [r5, #0xb]
	movs r1, #2
	bl PutNumberOrBlank
	movs r0, #0x1e
	adds r0, r0, r7
	mov sb, r0
	add r4, sb
	ldrb r2, [r5, #0xa]
	adds r0, r4, #0
	movs r1, #2
	bl PutNumberOrBlank
	adds r4, r6, #2
	lsls r4, r4, #6
	adds r0, r4, r7
	ldrb r2, [r5, #3]
	movs r1, #2
	bl PutNumberOrBlank
	add r8, r4
	ldrb r2, [r5, #4]
	mov r0, r8
	movs r1, #2
	bl PutNumberOrBlank
	movs r1, #0xc
	adds r1, r1, r7
	mov r8, r1
	adds r0, r4, r1
	ldrb r2, [r5, #5]
	movs r1, #2
	bl PutNumberOrBlank
	adds r0, r7, #0
	adds r0, #0x12
	adds r0, r4, r0
	ldrb r2, [r5, #6]
	movs r1, #2
	bl PutNumberOrBlank
	adds r0, r7, #0
	adds r0, #0x18
	adds r0, r4, r0
	ldrb r2, [r5, #7]
	movs r1, #2
	bl PutNumberOrBlank
	add sb, r4
	ldrb r2, [r5, #9]
	mov r0, sb
	movs r1, #2
	bl PutNumberOrBlank
	adds r0, r7, #0
	adds r0, #0x24
	adds r4, r4, r0
	ldrb r2, [r5, #8]
	adds r0, r4, #0
	movs r1, #2
	bl PutNumberOrBlank
	adds r6, #4
	lsls r6, r6, #6
	add r8, r6
	ldr r2, [r5, #0x10]
	mov r0, r8
	movs r1, #2
	bl PutNumber
	add sl, r6
	ldrh r2, [r5, #0xc]
	mov r0, sl
	movs r1, #2
	bl PutNumber
	adds r0, r7, #0
	adds r0, #0x1a
	adds r0, r6, r0
	ldrb r2, [r5, #0xe]
	movs r1, #2
	bl PutNumber
	adds r0, r7, #0
	adds r0, #0x20
	adds r6, r6, r0
	ldrb r2, [r5, #0xf]
	adds r0, r6, #0
	movs r1, #2
	bl PutNumber
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0809EC6C: .4byte gBg2Tm + 0x4
_0809EC70: .4byte 0x020144E0

	thumb_func_start sub_809EC74
sub_809EC74: @ 0x0809EC74
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r6, r0, #0
	movs r0, #0
	bl InitBgs
	bl ResetTextFont
	bl ResetText
	ldr r4, _0809ED6C @ =gDispIo
	movs r2, #1
	ldrb r0, [r4, #1]
	orrs r0, r2
	movs r3, #2
	orrs r0, r3
	movs r1, #4
	orrs r0, r1
	movs r1, #8
	orrs r0, r1
	movs r1, #0x11
	rsbs r1, r1, #0
	ands r0, r1
	strb r0, [r4, #1]
	adds r1, #0xd
	adds r0, r1, #0
	ldrb r5, [r4, #0xc]
	ands r0, r5
	orrs r0, r2
	strb r0, [r4, #0xc]
	adds r0, r1, #0
	ldrb r2, [r4, #0x10]
	ands r0, r2
	orrs r0, r3
	strb r0, [r4, #0x10]
	ldrb r5, [r4, #0x14]
	ands r1, r5
	strb r1, [r4, #0x14]
	movs r0, #3
	ldrb r1, [r4, #0x18]
	orrs r0, r1
	strb r0, [r4, #0x18]
	bl UnpackUiWindowFrameGraphics
	bl EnablePalSync
	ldr r0, _0809ED70 @ =gBg0Tm
	movs r1, #0
	bl TmFill
	ldr r0, _0809ED74 @ =gBg1Tm
	movs r1, #0
	bl TmFill
	ldr r0, _0809ED78 @ =gBg2Tm
	movs r1, #0
	bl TmFill
	ldr r0, _0809ED7C @ =gBg3Tm
	movs r1, #0
	bl TmFill
	movs r0, #0
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	movs r0, #1
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	movs r0, #2
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	movs r0, #3
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	movs r0, #0x21
	rsbs r0, r0, #0
	ldrb r2, [r4, #1]
	ands r0, r2
	movs r1, #0x41
	rsbs r1, r1, #0
	ands r0, r1
	movs r1, #0x7f
	ands r0, r1
	strb r0, [r4, #1]
	movs r0, #2
	str r0, [sp]
	movs r1, #6
	movs r2, #0x1a
	movs r3, #7
	bl sub_804A4CC
	movs r0, #0xf
	bl EnableBgSync
	ldr r5, _0809ED80 @ =0x0201440C
	movs r4, #2
_0809ED44:
	adds r0, r5, #0
	movs r1, #0x1b
	bl InitText
	adds r5, #8
	subs r4, #1
	cmp r4, #0
	bge _0809ED44
	ldr r0, [r6, #0x30]
	ldr r1, [r6, #0x34]
	bl sub_809E9DC
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0809ED84
	adds r0, r6, #0
	movs r1, #0x63
	bl Proc_Goto
	b _0809EDA6
	.align 2, 0
_0809ED6C: .4byte gDispIo
_0809ED70: .4byte gBg0Tm
_0809ED74: .4byte gBg1Tm
_0809ED78: .4byte gBg2Tm
_0809ED7C: .4byte gBg3Tm
_0809ED80: .4byte 0x0201440C
_0809ED84:
	movs r0, #5
	movs r1, #0x11
	bl sub_809E1CC
	ldr r0, _0809EDB0 @ =sub_809E7FC
	bl sub_809E5F0
	ldr r0, _0809EDB4 @ =0x0201440C
	ldr r1, _0809EDB8 @ =gUnk_08D8E040
	bl sub_809EAAC
	movs r0, #0
	movs r1, #0
	movs r2, #0xa
	bl StartMuralBackgroundAlt
	str r0, [r6, #0x2c]
_0809EDA6:
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0809EDB0: .4byte sub_809E7FC
_0809EDB4: .4byte 0x0201440C
_0809EDB8: .4byte gUnk_08D8E040

	thumb_func_start nullsub_80
nullsub_80: @ 0x0809EDBC
	bx lr
	.align 2, 0

	thumb_func_start sub_809EDC0
sub_809EDC0: @ 0x0809EDC0
	push {lr}
	ldr r0, [r0, #0x2c]
	bl Proc_End
	ldr r2, _0809EDEC @ =gDispIo
	movs r0, #2
	rsbs r0, r0, #0
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
	pop {r0}
	bx r0
	.align 2, 0
_0809EDEC: .4byte gDispIo

	thumb_func_start sub_809EDF0
sub_809EDF0: @ 0x0809EDF0
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r1, r2, #0
	ldr r0, _0809EE08 @ =gUnk_08D8E084
	bl Proc_StartBlocking
	str r4, [r0, #0x30]
	str r5, [r0, #0x34]
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_0809EE08: .4byte gUnk_08D8E084

	thumb_func_start sub_809EE0C
sub_809EE0C: @ 0x0809EE0C
	ldr r0, _0809EE14 @ =0x0203E768
	movs r1, #0
	strb r1, [r0]
	bx lr
	.align 2, 0
_0809EE14: .4byte 0x0203E768

	thumb_func_start nullsub_81
nullsub_81: @ 0x0809EE18
	bx lr

	.align 2, 0
