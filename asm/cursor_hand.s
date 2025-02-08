	.include "macro.inc"
	.syntax unified

	thumb_func_start UiCursorHand_Init
UiCursorHand_Init: @ 0x080A980C
	push {r4, r5, r6, lr}
	movs r2, #0
	adds r4, r0, #0
	adds r4, #0x3c
	movs r3, #0
	movs r6, #0xf0
	adds r1, r0, #0
	adds r1, #0x2c
	movs r5, #0xa0
_080A981E:
	adds r0, r4, r2
	strb r3, [r0]
	strb r3, [r1]
	strb r3, [r1, #1]
	strb r6, [r1, #2]
	strb r5, [r1, #3]
	adds r1, #4
	adds r2, #1
	cmp r2, #3
	ble _080A981E
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	thumb_func_start sub_80A9838
sub_80A9838: @ 0x080A9838
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r6, r0, #0
	movs r7, #0
	adds r4, r6, #0
	adds r4, #0x2c
_080A9844:
	adds r0, r6, #0
	adds r0, #0x3c
	adds r0, r0, r7
	ldrb r5, [r0]
	movs r0, #1
	ands r0, r5
	cmp r0, #0
	beq _080A98B2
	lsls r0, r7, #1
	adds r1, r6, #0
	adds r1, #0x40
	adds r1, r1, r0
	movs r2, #0
	ldrsh r3, [r1, r2]
	adds r1, r6, #0
	adds r1, #0x48
	adds r1, r1, r0
	movs r0, #0
	ldrsh r2, [r1, r0]
	ldrb r0, [r4]
	cmp r3, r0
	blt _080A98B2
	ldrb r0, [r4, #2]
	cmp r3, r0
	bge _080A98B2
	ldrb r0, [r4, #1]
	cmp r2, r0
	blt _080A98B2
	ldrb r0, [r4, #3]
	cmp r2, r0
	bge _080A98B2
	movs r0, #2
	ands r0, r5
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0
	beq _080A98A4
	adds r1, r3, #0
	subs r1, #0xc
	movs r0, #0
	str r0, [sp]
	movs r0, #3
	ldr r3, _080A98A0 @ =gUnk_08DAE1DC
	bl PutSprite
	b _080A98B2
	.align 2, 0
_080A98A0: .4byte gUnk_08DAE1DC
_080A98A4:
	adds r1, r3, #0
	subs r1, #0xc
	str r0, [sp]
	movs r0, #3
	ldr r3, _080A98C4 @ =gUnk_08DAE1D4
	bl PutSprite
_080A98B2:
	adds r4, #4
	adds r7, #1
	cmp r7, #3
	ble _080A9844
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A98C4: .4byte gUnk_08DAE1D4

	thumb_func_start StartUiCursorHand
StartUiCursorHand: @ 0x080A98C8
	push {lr}
	adds r1, r0, #0
	ldr r0, _080A98D8 @ =ProcScr_UiCursorHand
	bl Proc_Start
	pop {r1}
	bx r1
	.align 2, 0
_080A98D8: .4byte ProcScr_UiCursorHand

	thumb_func_start SetUiCursorHandConfig
SetUiCursorHandConfig: @ 0x080A98DC
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r5, r0, #0
	adds r7, r1, #0
	mov r8, r2
	lsls r3, r3, #0x18
	lsrs r6, r3, #0x18
	ldr r0, _080A9940 @ =ProcScr_UiCursorHand
	bl Proc_Find
	adds r4, r0, #0
	cmp r4, #0
	beq _080A9936
	adds r1, r4, #0
	adds r1, #0x3c
	adds r1, r1, r5
	movs r3, #1
	movs r0, #1
	strb r0, [r1]
	lsls r2, r5, #1
	adds r0, r4, #0
	adds r0, #0x40
	adds r0, r0, r2
	strh r7, [r0]
	adds r0, r4, #0
	adds r0, #0x48
	adds r0, r0, r2
	mov r2, r8
	strh r2, [r0]
	adds r0, r6, #0
	orrs r0, r3
	strb r0, [r1]
	movs r0, #2
	ands r0, r6
	cmp r0, #0
	beq _080A9936
	ldr r0, _080A9944 @ =gUnk_0818FEB0
	ldr r1, _080A9948 @ =0x060100C0
	bl Decompress
	ldr r0, _080A994C @ =gUnk_0818FEEC
	ldr r1, _080A9950 @ =0x060104C0
	bl Decompress
_080A9936:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A9940: .4byte ProcScr_UiCursorHand
_080A9944: .4byte gUnk_0818FEB0
_080A9948: .4byte 0x060100C0
_080A994C: .4byte gUnk_0818FEEC
_080A9950: .4byte 0x060104C0

	thumb_func_start UiCursorHand_80A9954
UiCursorHand_80A9954: @ 0x080A9954
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r6, r2, #0
	adds r7, r3, #0
	ldr r0, _080A9988 @ =ProcScr_UiCursorHand
	bl Proc_Find
	adds r1, r0, #0
	cmp r1, #0
	beq _080A9982
	lsls r0, r4, #2
	adds r1, r1, r0
	adds r0, r1, #0
	adds r0, #0x2c
	strb r5, [r0]
	adds r0, #1
	strb r6, [r0]
	adds r0, #1
	strb r7, [r0]
	adds r1, #0x2f
	ldr r0, [sp, #0x14]
	strb r0, [r1]
_080A9982:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A9988: .4byte ProcScr_UiCursorHand

	thumb_func_start sub_80A998C
sub_80A998C: @ 0x080A998C
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _080A99A8 @ =ProcScr_UiCursorHand
	bl Proc_Find
	cmp r0, #0
	beq _080A99A2
	adds r0, #0x3c
	adds r0, r0, r4
	movs r1, #0
	strb r1, [r0]
_080A99A2:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A99A8: .4byte ProcScr_UiCursorHand

	thumb_func_start sub_80A99AC
sub_80A99AC: @ 0x080A99AC
	push {lr}
	ldr r0, _080A99CC @ =ProcScr_UiCursorHand
	bl Proc_Find
	cmp r0, #0
	beq _080A99C8
	adds r1, r0, #0
	adds r1, #0x3c
	movs r2, #0
	adds r0, #0x43
_080A99C0:
	strb r2, [r0]
	subs r0, #1
	cmp r0, r1
	bge _080A99C0
_080A99C8:
	pop {r0}
	bx r0
	.align 2, 0
_080A99CC: .4byte ProcScr_UiCursorHand

	thumb_func_start sub_80A99D0
sub_80A99D0: @ 0x080A99D0
	push {lr}
	ldr r0, _080A99E8 @ =ProcScr_UiCursorHand
	bl Proc_Find
	cmp r0, #0
	beq _080A99E2
	movs r1, #1
	bl Proc_Goto
_080A99E2:
	pop {r0}
	bx r0
	.align 2, 0
_080A99E8: .4byte ProcScr_UiCursorHand

	thumb_func_start UnblockUiCursorHand
UnblockUiCursorHand: @ 0x080A99EC
	push {lr}
	ldr r0, _080A9A04 @ =ProcScr_UiCursorHand
	bl Proc_Find
	cmp r0, #0
	beq _080A99FE
	movs r1, #0
	bl Proc_Goto
_080A99FE:
	pop {r0}
	bx r0
	.align 2, 0
_080A9A04: .4byte ProcScr_UiCursorHand

	thumb_func_start EndUiCursorHand
EndUiCursorHand: @ 0x080A9A08
	push {lr}
	ldr r0, _080A9A18 @ =ProcScr_UiCursorHand
	bl Proc_Find
	bl Proc_End
	pop {r0}
	bx r0
	.align 2, 0
_080A9A18: .4byte ProcScr_UiCursorHand
