	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_8091588
sub_8091588: @ 0x08091588
	movs r0, #0
	bx lr

	thumb_func_start GetConvoyItemCount_
GetConvoyItemCount_: @ 0x0809158C
	push {lr}
	bl GetConvoyItemCount
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start ViewCounter_Loop
ViewCounter_Loop: @ 0x0809159C
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

	thumb_func_start StartViewCounter
StartViewCounter: @ 0x080915D8
	push {r4, lr}
	adds r4, r0, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	ldr r0, _08091610 @ =ProcScr_ViewCounter
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
_08091610: .4byte ProcScr_ViewCounter
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

	thumb_func_start PrepHbKeyListener_Loop
PrepHbKeyListener_Loop: @ 0x0809163C
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

	thumb_func_start StartPrepErrorHelpbox
StartPrepErrorHelpbox: @ 0x08091664
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
	ldr r0, _08091698 @ =ProcScr_PrepHelpboxListener
	adds r1, r6, #0
	bl Proc_StartBlocking
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_08091698: .4byte ProcScr_PrepHelpboxListener

	thumb_func_start IsWeaponUsable
IsWeaponUsable: @ 0x0809169C
	push {r4, lr}
	adds r4, r1, #0
	bl CanUnitUseWeapon
	lsls r0, r0, #0x18
	cmp r0, #0
	beq 1f
	adds r0, r4, #0
	bl GetItemAttributes
	movs r1, #0x80
	ands r1, r0
	cmp r1, #0
	bne 1f
	movs r0, #1
	b 2f
1:
	movs r0, #0
2:
	pop {r4}
	pop {r1}
	bx r1

	thumb_func_start CountUnitUsableWeapons
CountUnitUsableWeapons: @ 0x080916C4
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	movs r6, #0
	movs r4, #0
1:
	lsls r1, r4, #1
	adds r0, r5, #0
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r1, [r0]
	adds r0, r5, #0
	bl IsWeaponUsable
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne 2f
	adds r6, #1
2:
	adds r4, #1
	cmp r4, #4
	ble 1b
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
	bne 1f
	adds r0, r4, #0
	bl sub_802F624
	lsls r0, r0, #0x18
	cmp r0, #0
	beq 1f
	adds r0, r4, #0
	bl CountUnitUsableWeapons
	cmp r0, #0
	beq 1f
	movs r0, #1
	b 2f
1:
	movs r0, #0
2:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start CheckValidLinkArenaItemSwap
CheckValidLinkArenaItemSwap: @ 0x08091730
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	adds r7, r1, #0
	adds r5, r2, #0
	adds r6, r3, #0
	cmp r4, r5
	beq 3f
	bl CheckInLinkArena
	cmp r0, #0
	beq 3f
	ldr r0, [r4, #0xc]
	movs r1, #8
	ands r0, r1
	cmp r0, #0
	bne 1f
	lsls r1, r7, #1
	adds r0, r4, #0
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r1, [r0]
	adds r0, r4, #0
	bl IsWeaponUsable
	lsls r0, r0, #0x18
	cmp r0, #0
	beq 1f
	adds r0, r4, #0
	bl CountUnitUsableWeapons
	cmp r0, #1
	bgt 1f
	lsls r1, r6, #1
	adds r0, r5, #0
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r1, [r0]
	adds r0, r4, #0
	bl IsWeaponUsable
	lsls r0, r0, #0x18
	cmp r0, #0
	beq 2f
1:
	ldr r0, [r5, #0xc]
	movs r1, #8
	ands r0, r1
	cmp r0, #0
	bne 3f
	lsls r1, r6, #1
	adds r0, r5, #0
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r1, [r0]
	adds r0, r5, #0
	bl IsWeaponUsable
	lsls r0, r0, #0x18
	cmp r0, #0
	beq 3f
	adds r0, r5, #0
	bl CountUnitUsableWeapons
	cmp r0, #1
	bgt 3f
	lsls r1, r7, #1
	adds r0, r4, #0
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r1, [r0]
	adds r0, r5, #0
	bl IsWeaponUsable
	lsls r0, r0, #0x18
	cmp r0, #0
	bne 3f
2:
	movs r0, #0
	b 4f
3:
	movs r0, #1
4:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start CheckValidLinkArenaItemSupply
CheckValidLinkArenaItemSupply: @ 0x080917D4
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r6, r2, #0
	bl CheckInLinkArena
	cmp r0, #0
	beq 1f
	ldr r0, [r4, #0xc]
	movs r1, #8
	ands r0, r1
	cmp r0, #0
	bne 1f
	lsls r1, r5, #1
	adds r0, r4, #0
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r1, [r0]
	adds r0, r4, #0
	bl IsWeaponUsable
	lsls r0, r0, #0x18
	cmp r0, #0
	beq 1f
	adds r0, r4, #0
	bl CountUnitUsableWeapons
	cmp r0, #1
	bne 1f
	adds r0, r4, #0
	adds r1, r6, #0
	bl IsWeaponUsable
	lsls r0, r0, #0x18
	cmp r0, #0
	bne 1f
	movs r0, #0
	b 2f
1:
	movs r0, #1
2:
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
	bl IsWeaponUsable
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08091864
	adds r0, r4, #0
	bl CountUnitUsableWeapons
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
	ldr r4, _08091898 @ =gPlaySt + 0x41
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
_08091898: .4byte gPlaySt + 0x41
_0809189C: .4byte 0x02012970
_080918A0: .4byte Pal_08428A80

	thumb_func_start GetPrepPageForItem
GetPrepPageForItem: @ 0x080918A4
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	movs r5, #0
	ldr r4, _080918C4 @ =gPrepItemTypePageLut
1:
	adds r0, r6, #0
	bl GetItemType
	ldrb r1, [r4]
	cmp r0, r1
	blt 2f
	ldrb r1, [r4, #1]
	cmp r0, r1
	bgt 2f
	adds r0, r5, #0
	b 3f
	.align 2, 0
_080918C4: .4byte gPrepItemTypePageLut
2:
	adds r4, #4
	adds r5, #1
	cmp r5, #8
	ble 1b
	movs r0, #8
3:
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
	ldr r0, _08091990 @ =gPrepScreenExtraItemList
	mov r8, r0
	ldr r0, _08091994 @ =Unk_Prep_02012466
	movs r1, #0
	strh r1, [r0]
	movs r4, #0
	ldr r1, _08091998 @ =Unk_Prep_02012464
	mov sl, r0
	adds r2, r1, #0
	ldrh r1, [r2]
	cmp r4, r1
	bge 3f
	ldr r1, _0809199C @ =gPrepItemTypePageLut
	mov r3, sb
	lsls r0, r3, #2
	adds r6, r0, r1
	mov r7, sl
1:
	ldr r1, _080919A0 @ =gPrepScreenItemList
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
	blo 2f
	ldrb r3, [r6, #1]
	cmp r0, r3
	bhi 2f
	ldr r0, [r5]
	mov r1, r8
	adds r1, #4
	mov r8, r1
	subs r1, #4
	stm r1!, {r0}
	ldrh r0, [r7]
	adds r0, #1
	strh r0, [r7]
2:
	adds r4, #1
	ldr r0, _08091998 @ =Unk_Prep_02012464
	ldrh r0, [r0]
	cmp r4, r0
	blt 1b
3:
	movs r4, #0
	ldrh r2, [r2]
	cmp r4, r2
	bge 7f
	ldr r1, _0809199C @ =gPrepItemTypePageLut
	mov r2, sb
	lsls r0, r2, #2
	adds r6, r0, r1
4:
	ldr r1, _080919A0 @ =gPrepScreenItemList
	lsls r0, r4, #2
	adds r5, r0, r1
	ldrh r0, [r5, #2]
	bl GetItemType
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldrb r3, [r6]
	cmp r0, r3
	blo 5f
	ldrb r1, [r6, #1]
	cmp r0, r1
	bls 6f
5:
	ldr r0, [r5]
	mov r2, r8
	adds r2, #4
	mov r8, r2
	subs r2, #4
	stm r2!, {r0}
6:
	adds r4, #1
	ldr r0, _08091998 @ =Unk_Prep_02012464
	ldrh r0, [r0]
	cmp r4, r0
	blt 4b
7:
	movs r2, #1
	ldr r5, _08091990 @ =gPrepScreenExtraItemList
	ldr r3, _08091994 @ =Unk_Prep_02012466
	mov sl, r3
	b _080919AA
	.align 2, 0
_08091990: .4byte gPrepScreenExtraItemList
_08091994: .4byte Unk_Prep_02012466
_08091998: .4byte Unk_Prep_02012464
_0809199C: .4byte gPrepItemTypePageLut
_080919A0: .4byte gPrepScreenItemList
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
	ldr r0, _08091A68 @ =Unk_Prep_02012466
	mov sl, r0
_080919D2:
	subs r7, r4, r2
	adds r4, #1
	mov sb, r4
	cmp r7, #0
	blt _08091A32
	ldr r1, _08091A6C @ =gPrepScreenExtraItemList
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
	ldr r0, _08091A68 @ =Unk_Prep_02012466
	ldr r5, _08091A6C @ =gPrepScreenExtraItemList
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
	ldr r1, _08091A70 @ =gPrepScreenItemList
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
_08091A68: .4byte Unk_Prep_02012466
_08091A6C: .4byte gPrepScreenExtraItemList
_08091A70: .4byte gPrepScreenItemList

	thumb_func_start SomethingPrepListRelated
SomethingPrepListRelated: @ 0x08091A74
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	mov r8, r0
	mov sl, r1
	mov sb, r2
	ldr r6, _08091B3C @ =gPrepScreenItemList
	ldr r1, _08091B40 @ =Unk_Prep_02012464
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
	ldr r3, _08091B40 @ =Unk_Prep_02012464
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
	ldr r3, _08091B40 @ =Unk_Prep_02012464
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
_08091B3C: .4byte gPrepScreenItemList
_08091B40: .4byte Unk_Prep_02012464
_08091B44: .4byte 0x00010004

	thumb_func_start sub_8091B48
sub_8091B48: @ 0x08091B48
	push {r4, r5, lr}
	bl sub_802EBD4
	movs r4, #0
	ldr r0, _08091B84 @ =Unk_Prep_02012464
	ldrh r0, [r0]
	cmp r4, r0
	bhs _08091B7C
	ldr r5, _08091B88 @ =gPrepScreenItemList
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
	ldr r0, _08091B84 @ =Unk_Prep_02012464
	ldrh r0, [r0]
	cmp r4, r0
	blo _08091B5A
_08091B7C:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08091B84: .4byte Unk_Prep_02012464
_08091B88: .4byte gPrepScreenItemList

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

	thumb_func_start CanUnitPrepScreenUse
CanUnitPrepScreenUse: @ 0x08091C28
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
	bl CanUnitUseItemPrepScreen
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
