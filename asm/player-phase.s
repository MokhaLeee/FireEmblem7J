	.include "macro.inc"
	.syntax unified

	thumb_func_start PlayerPhase_Suspend
PlayerPhase_Suspend: @ 0x0801C56C
	push {lr}
	ldr r1, _0801C580 @ =gActionSt
	movs r0, #0
	strb r0, [r1, #0x16]
	movs r0, #3
	bl WriteSuspendSave
	pop {r0}
	bx r0
	.align 2, 0
_0801C580: .4byte gActionSt

	thumb_func_start sub_801C584
sub_801C584: @ 0x0801C584
	push {lr}
	ldr r1, _0801C5B8 @ =gpKeySt
	ldr r2, [r1]
	movs r0, #2
	ldrh r3, [r2, #4]
	ands r0, r3
	adds r3, r1, #0
	cmp r0, #0
	beq _0801C5C4
	ldr r0, _0801C5BC @ =gBmSt
	ldr r0, [r0, #0x20]
	ldr r1, _0801C5C0 @ =0x00070007
	ands r0, r1
	cmp r0, #0
	bne _0801C5C4
	ldrh r0, [r2, #0x10]
	bl HandleMapCursorInput
	movs r0, #8
	bl sub_8015B90
	movs r0, #8
	bl sub_8015BE4
	b _0801C5D8
	.align 2, 0
_0801C5B8: .4byte gpKeySt
_0801C5BC: .4byte gBmSt
_0801C5C0: .4byte 0x00070007
_0801C5C4:
	ldr r0, [r3]
	ldrh r0, [r0, #6]
	bl HandleMapCursorInput
	movs r0, #4
	bl sub_8015B90
	movs r0, #4
	bl sub_8015BE4
_0801C5D8:
	ldr r0, _0801C5FC @ =gBmSt
	ldrh r1, [r0, #0x20]
	ldrh r2, [r0, #0x22]
	orrs r1, r2
	adds r0, r1, #0
	movs r1, #0xf
	ands r0, r1
	cmp r0, #0
	beq _0801C5F6
	ldr r0, _0801C600 @ =gpKeySt
	ldr r1, [r0]
	ldr r0, _0801C604 @ =0x0000FCF4
	ldrh r3, [r1, #8]
	ands r0, r3
	strh r0, [r1, #8]
_0801C5F6:
	pop {r0}
	bx r0
	.align 2, 0
_0801C5FC: .4byte gBmSt
_0801C600: .4byte gpKeySt
_0801C604: .4byte 0x0000FCF4

	thumb_func_start sub_801C608
sub_801C608: @ 0x0801C608
	adds r1, r0, #0
	ldr r0, [r1, #4]
	ldrb r0, [r0, #4]
	cmp r0, #0x49
	beq _0801C61E
	ldr r0, [r1]
	ldrb r0, [r0, #4]
	cmp r0, #0x9e
	beq _0801C61E
	movs r0, #1
	b _0801C620
_0801C61E:
	movs r0, #0
_0801C620:
	bx lr
	.align 2, 0

	thumb_func_start sub_801C624
sub_801C624: @ 0x0801C624
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	bl sub_801C584
	ldr r4, _0801C660 @ =gpKeySt
	ldr r1, [r4]
	movs r0, #0x80
	lsls r0, r0, #2
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _0801C670
	ldr r1, _0801C664 @ =gBmSt
	movs r2, #0x14
	ldrsh r0, [r1, r2]
	movs r3, #0x16
	ldrsh r1, [r1, r3]
	bl sub_801D758
	ldr r0, _0801C668 @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	bge _0801C658
	b _0801C89C
_0801C658:
	ldr r0, _0801C66C @ =0x0000038B
	bl m4aSongNumStart
	b _0801C89C
	.align 2, 0
_0801C660: .4byte gpKeySt
_0801C664: .4byte gBmSt
_0801C668: .4byte gPlaySt
_0801C66C: .4byte 0x0000038B
_0801C670:
	bl sub_801DA38
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0801C67C
	b _0801C89C
_0801C67C:
	ldr r1, [r4]
	movs r0, #0x80
	lsls r0, r0, #1
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _0801C700
	bl sub_8031B40
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0801C696
	b _0801C8C8
_0801C696:
	ldr r4, _0801C6F8 @ =gBmSt
	movs r1, #0x16
	ldrsh r0, [r4, r1]
	ldr r5, _0801C6FC @ =gBmMapUnit
	ldr r1, [r5]
	lsls r0, r0, #2
	adds r0, r0, r1
	movs r2, #0x14
	ldrsh r1, [r4, r2]
	ldr r0, [r0]
	adds r1, r0, r1
	ldrb r0, [r1]
	cmp r0, #0
	beq _0801C700
	bl GetUnit
	bl sub_801C608
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0801C700
	bl MU_EndAll
	bl sub_808667C
	movs r0, #0x1f
	bl sub_80807E4
	movs r3, #0x16
	ldrsh r0, [r4, r3]
	ldr r1, [r5]
	lsls r0, r0, #2
	adds r0, r0, r1
	movs r2, #0x14
	ldrsh r1, [r4, r2]
	ldr r0, [r0]
	adds r0, r0, r1
	ldrb r0, [r0]
	bl GetUnit
	adds r1, r6, #0
	bl sub_80821F8
	adds r0, r6, #0
	movs r1, #5
	bl Proc_Goto
	b _0801C8C8
	.align 2, 0
_0801C6F8: .4byte gBmSt
_0801C6FC: .4byte gBmMapUnit
_0801C700:
	ldr r0, _0801C740 @ =gpKeySt
	ldr r1, [r0]
	movs r0, #1
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _0801C7D0
	ldr r5, _0801C744 @ =gBmSt
	movs r3, #0x16
	ldrsh r0, [r5, r3]
	ldr r1, _0801C748 @ =gBmMapUnit
	ldr r1, [r1]
	lsls r0, r0, #2
	adds r0, r0, r1
	movs r2, #0x14
	ldrsh r1, [r5, r2]
	ldr r0, [r0]
	adds r0, r0, r1
	ldrb r0, [r0]
	bl GetUnit
	adds r4, r0, #0
	bl sub_801D270
	cmp r0, #2
	beq _0801C798
	cmp r0, #2
	ble _0801C74C
	cmp r0, #3
	beq _0801C7B8
	b _0801C7D0
	.align 2, 0
_0801C740: .4byte gpKeySt
_0801C744: .4byte gBmSt
_0801C748: .4byte gBmMapUnit
_0801C74C:
	cmp r0, #0
	blt _0801C7D0
	bl sub_8031B40
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0801C7D0
	bl sub_808667C
	ldr r0, _0801C790 @ =gPlaySt
	ldrh r1, [r5, #0x14]
	strb r1, [r0, #0x12]
	ldrh r1, [r5, #0x16]
	strb r1, [r0, #0x13]
	cmp r4, #0
	beq _0801C776
	bl MU_EndAll
	adds r0, r4, #0
	bl ShowUnitSprite
_0801C776:
	ldr r0, _0801C794 @ =gUnk_08C04DB0
	movs r3, #0x1c
	ldrsh r1, [r5, r3]
	movs r3, #0xc
	ldrsh r2, [r5, r3]
	subs r1, r1, r2
	movs r2, #1
	movs r3, #0x17
	bl StartAdjustedMenu
	bl sub_8079890
	b _0801C88A
	.align 2, 0
_0801C790: .4byte gPlaySt
_0801C794: .4byte gUnk_08C04DB0
_0801C798:
	adds r0, r4, #0
	bl UnitBeginAction
	ldr r0, _0801C7B4 @ =gActiveUnit
	ldr r0, [r0]
	ldr r0, [r0]
	ldrb r0, [r0, #4]
	bl sub_80A0938
	adds r0, r6, #0
	bl Proc_Break
	b _0801C89C
	.align 2, 0
_0801C7B4: .4byte gActiveUnit
_0801C7B8:
	adds r0, r4, #0
	bl UnitBeginAction
	adds r1, r5, #0
	adds r1, #0x3e
	movs r0, #0
	strb r0, [r1]
	adds r0, r6, #0
	movs r1, #0xb
	bl Proc_Goto
	b _0801C89C
_0801C7D0:
	ldr r1, _0801C830 @ =gpKeySt
	ldr r2, [r1]
	movs r0, #4
	ldrh r3, [r2, #8]
	ands r0, r3
	cmp r0, #0
	beq _0801C840
	ldrh r2, [r2, #4]
	cmp r2, #4
	bne _0801C840
	ldr r2, _0801C834 @ =gPlaySt
	ldrb r0, [r2, #0x1b]
	cmp r0, #1
	bne _0801C840
	movs r0, #0x40
	ldrb r2, [r2, #0x14]
	ands r0, r2
	cmp r0, #0
	bne _0801C840
	ldr r2, _0801C838 @ =gBmSt
	movs r1, #0x16
	ldrsh r0, [r2, r1]
	ldr r1, _0801C83C @ =gBmMapUnit
	ldr r1, [r1]
	lsls r0, r0, #2
	adds r0, r0, r1
	movs r3, #0x14
	ldrsh r1, [r2, r3]
	ldr r0, [r0]
	adds r0, r0, r1
	ldrb r0, [r0]
	bl GetUnit
	adds r4, r0, #0
	cmp r4, #0
	beq _0801C822
	bl MU_EndAll
	adds r0, r4, #0
	bl ShowUnitSprite
_0801C822:
	bl sub_808667C
	adds r0, r6, #0
	bl sub_8032CA0
	b _0801C88A
	.align 2, 0
_0801C830: .4byte gpKeySt
_0801C834: .4byte gPlaySt
_0801C838: .4byte gBmSt
_0801C83C: .4byte gBmMapUnit
_0801C840:
	ldr r1, [r1]
	movs r0, #8
	ldrh r2, [r1, #8]
	ands r0, r2
	cmp r0, #0
	beq _0801C89C
	movs r0, #4
	ldrh r1, [r1, #4]
	ands r0, r1
	cmp r0, #0
	bne _0801C89C
	ldr r2, _0801C894 @ =gBmSt
	movs r3, #0x16
	ldrsh r0, [r2, r3]
	ldr r1, _0801C898 @ =gBmMapUnit
	ldr r1, [r1]
	lsls r0, r0, #2
	adds r0, r0, r1
	movs r3, #0x14
	ldrsh r1, [r2, r3]
	ldr r0, [r0]
	adds r0, r0, r1
	ldrb r0, [r0]
	bl GetUnit
	adds r4, r0, #0
	cmp r4, #0
	beq _0801C882
	bl MU_EndAll
	adds r0, r4, #0
	bl ShowUnitSprite
_0801C882:
	bl sub_808667C
	bl sub_80A3EF8
_0801C88A:
	adds r0, r6, #0
	movs r1, #9
	bl Proc_Goto
	b _0801C8C8
	.align 2, 0
_0801C894: .4byte gBmSt
_0801C898: .4byte gBmMapUnit
_0801C89C:
	bl UnitSpriteHoverUpdate
	ldr r1, _0801C8D0 @ =gBmSt
	movs r0, #0x20
	ldrsh r4, [r1, r0]
	movs r2, #0x22
	ldrsh r5, [r1, r2]
	movs r3, #0x14
	ldrsh r0, [r1, r3]
	movs r2, #0x16
	ldrsh r1, [r1, r2]
	bl sub_80264F0
	lsls r0, r0, #0x18
	movs r2, #0
	cmp r0, #0
	beq _0801C8C0
	movs r2, #3
_0801C8C0:
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_8015DE8
_0801C8C8:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0801C8D0: .4byte gBmSt

	thumb_func_start sub_801C8D4
sub_801C8D4: @ 0x0801C8D4
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	movs r4, #1
	ldr r5, _0801C93C @ =gActiveUnit
	ldr r0, [r5]
	ldr r1, [r0, #4]
	ldrb r2, [r0, #0x1d]
	ldrb r1, [r1, #0x12]
	adds r1, r2, r1
	ldr r2, _0801C940 @ =gActionSt
	ldrb r2, [r2, #0x10]
	subs r1, r1, r2
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	bl sub_8019FC0
	ldr r0, [r5]
	ldr r0, [r0, #0xc]
	movs r1, #0x40
	ands r0, r1
	cmp r0, #0
	bne _0801C974
	ldr r0, _0801C944 @ =0x0202E3F0
	ldr r0, [r0]
	movs r1, #0
	bl BmMapFillg
	adds r0, r6, #0
	bl UnitHasMagicRank
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0801C91C
	movs r0, #1
	bl sub_801B528
_0801C91C:
	ldr r0, _0801C948 @ =0x0202E3E4
	ldr r0, [r0]
	movs r1, #0
	bl BmMapFillg
	ldr r0, [r5]
	bl GetUnitWeaponUsabilityBits
	cmp r0, #2
	beq _0801C95C
	cmp r0, #2
	bgt _0801C94C
	cmp r0, #1
	beq _0801C96C
	b _0801C974
	.align 2, 0
_0801C93C: .4byte gActiveUnit
_0801C940: .4byte gActionSt
_0801C944: .4byte 0x0202E3F0
_0801C948: .4byte 0x0202E3E4
_0801C94C:
	cmp r0, #3
	bne _0801C974
	ldr r0, _0801C968 @ =gBmSt
	adds r0, #0x3e
	ldrb r0, [r0]
	ands r4, r0
	cmp r4, #0
	beq _0801C96C
_0801C95C:
	ldr r0, [r5]
	bl sub_801B1F0
	movs r4, #5
	b _0801C974
	.align 2, 0
_0801C968: .4byte gBmSt
_0801C96C:
	ldr r0, [r5]
	bl sub_801A8B4
	movs r4, #3
_0801C974:
	adds r0, r4, #0
	bl sub_801D6A4
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	thumb_func_start sub_801C980
sub_801C980: @ 0x0801C980
	push {r4, r5, lr}
	bl sub_806C82C
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0801C9BC
	ldr r4, _0801CA0C @ =gActiveUnit
	ldr r2, [r4]
	movs r0, #0xc0
	ldrb r1, [r2, #0xb]
	ands r0, r1
	ldr r1, _0801CA10 @ =gPlaySt
	ldrb r1, [r1, #0xf]
	cmp r0, r1
	bne _0801C9BC
	adds r0, r2, #0
	adds r0, #0x30
	movs r1, #0xf
	ldrb r0, [r0]
	ands r1, r0
	cmp r1, #2
	beq _0801C9BC
	cmp r1, #4
	beq _0801C9BC
	adds r0, r2, #0
	bl StartMu
	ldr r0, [r4]
	bl HideUnitSprite
_0801C9BC:
	bl sub_806C7CC
	bl sub_8079798
	ldr r5, _0801CA14 @ =gBmSt
	movs r0, #2
	ldrb r2, [r5, #4]
	orrs r0, r2
	strb r0, [r5, #4]
	ldr r4, _0801CA0C @ =gActiveUnit
	ldr r0, [r4]
	bl sub_801C8D4
	ldr r4, [r4]
	movs r1, #0x10
	ldrsb r1, [r4, r1]
	movs r2, #0x14
	ldrsh r0, [r5, r2]
	cmp r1, r0
	bne _0801CA1C
	movs r1, #0x11
	ldrsb r1, [r4, r1]
	movs r2, #0x16
	ldrsh r0, [r5, r2]
	cmp r1, r0
	bne _0801CA1C
	movs r0, #0
	bl sub_80303BC
	ldr r0, _0801CA10 @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0801CA22
	ldr r0, _0801CA18 @ =0x00000389
	bl m4aSongNumStart
	b _0801CA22
	.align 2, 0
_0801CA0C: .4byte gActiveUnit
_0801CA10: .4byte gPlaySt
_0801CA14: .4byte gBmSt
_0801CA18: .4byte 0x00000389
_0801CA1C:
	movs r0, #1
	bl sub_80303BC
_0801CA22:
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start sub_801CA28
sub_801CA28: @ 0x0801CA28
	push {lr}
	ldr r0, _0801CA54 @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0801CA3E
	movs r0, #0xe2
	lsls r0, r0, #2
	bl m4aSongNumStart
_0801CA3E:
	ldr r1, _0801CA58 @ =gBmSt
	movs r0, #0xfd
	ldrb r2, [r1, #4]
	ands r0, r2
	strb r0, [r1, #4]
	ldr r0, _0801CA5C @ =gActiveUnit
	ldr r0, [r0]
	bl sub_801C8D4
	pop {r0}
	bx r0
	.align 2, 0
_0801CA54: .4byte gPlaySt
_0801CA58: .4byte gBmSt
_0801CA5C: .4byte gActiveUnit

	thumb_func_start sub_801CA60
sub_801CA60: @ 0x0801CA60
	push {r4, r5, r6, lr}
	ldr r4, _0801CAB4 @ =gBmSt
	adds r5, r4, #0
	adds r5, #0x3e
	movs r6, #1
	adds r0, r6, #0
	ldrb r1, [r5]
	ands r0, r1
	bl sub_801B3E8
	ldr r0, _0801CAB8 @ =gBmMapMovement
	ldr r0, [r0]
	movs r1, #1
	rsbs r1, r1, #0
	bl BmMapFillg
	ldr r0, _0801CABC @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0801CA94
	movs r0, #0xe2
	lsls r0, r0, #2
	bl m4aSongNumStart
_0801CA94:
	movs r0, #8
	ldrb r1, [r4, #4]
	orrs r0, r1
	movs r1, #0xfd
	ands r0, r1
	strb r0, [r4, #4]
	adds r0, r6, #0
	ldrb r5, [r5]
	ands r0, r5
	cmp r0, #0
	beq _0801CAC0
	movs r0, #5
	bl sub_801D6A4
	b _0801CAC6
	.align 2, 0
_0801CAB4: .4byte gBmSt
_0801CAB8: .4byte gBmMapMovement
_0801CABC: .4byte gPlaySt
_0801CAC0:
	movs r0, #3
	bl sub_801D6A4
_0801CAC6:
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	thumb_func_start sub_801CACC
sub_801CACC: @ 0x0801CACC
	push {r4, r5, lr}
	adds r5, r0, #0
	movs r4, #0xff
	bl sub_801C584
	ldr r0, _0801CAF4 @ =gpKeySt
	ldr r1, [r0]
	movs r0, #1
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _0801CB48
	ldr r4, _0801CAF8 @ =gActiveUnit
	ldr r0, [r4]
	cmp r0, #0
	bne _0801CAFC
	bl GetCombinedEnemyWeaponUsabilityBits
	b _0801CB26
	.align 2, 0
_0801CAF4: .4byte gpKeySt
_0801CAF8: .4byte gActiveUnit
_0801CAFC:
	bl sub_807982C
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0801CB0A
	movs r4, #5
	b _0801CB92
_0801CB0A:
	ldr r0, [r4]
	bl sub_801D270
	cmp r0, #2
	beq _0801CB30
	ldr r2, [r4]
	ldr r0, [r2, #0xc]
	movs r1, #0x40
	ands r0, r1
	cmp r0, #0
	bne _0801CB30
	adds r0, r2, #0
	bl GetUnitWeaponUsabilityBits
_0801CB26:
	movs r4, #2
	cmp r0, #3
	bne _0801CB92
	movs r4, #6
	b _0801CB92
_0801CB30:
	ldr r1, _0801CB6C @ =gBmSt
	movs r2, #0x14
	ldrsh r0, [r1, r2]
	movs r3, #0x16
	ldrsh r1, [r1, r3]
	bl sub_801D2F8
	lsls r0, r0, #0x18
	movs r4, #0
	cmp r0, #0
	beq _0801CB92
	movs r4, #1
_0801CB48:
	ldr r0, _0801CB70 @ =gpKeySt
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0801CB78
	ldr r0, _0801CB74 @ =gActiveUnit
	ldr r0, [r0]
	ldr r0, [r0, #0xc]
	movs r1, #0x40
	ands r0, r1
	movs r4, #2
	cmp r0, #0
	beq _0801CB92
	movs r4, #0
	b _0801CB92
	.align 2, 0
_0801CB6C: .4byte gBmSt
_0801CB70: .4byte gpKeySt
_0801CB74: .4byte gActiveUnit
_0801CB78:
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0801CB86
	movs r4, #3
	b _0801CB92
_0801CB86:
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0801CB92
	movs r4, #4
_0801CB92:
	cmp r4, #6
	bls _0801CB98
	b _0801CD78
_0801CB98:
	lsls r0, r4, #2
	ldr r1, _0801CBA4 @ =_0801CBA8
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0801CBA4: .4byte _0801CBA8
_0801CBA8: @ jump table
	.4byte _0801CBC4 @ case 0
	.4byte _0801CBE0 @ case 1
	.4byte _0801CC00 @ case 2
	.4byte _0801CC84 @ case 3
	.4byte _0801CD00 @ case 4
	.4byte _0801CD78 @ case 5
	.4byte _0801CD48 @ case 6
_0801CBC4:
	ldr r0, _0801CBDC @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	bge _0801CBD2
	b _0801CD78
_0801CBD2:
	movs r0, #0xe3
	lsls r0, r0, #2
	bl m4aSongNumStart
	b _0801CD78
	.align 2, 0
_0801CBDC: .4byte gPlaySt
_0801CBE0:
	ldr r0, _0801CBFC @ =gActiveUnitMoveOrigin
	movs r2, #0
	ldrsh r1, [r0, r2]
	movs r3, #2
	ldrsh r2, [r0, r3]
	adds r0, r5, #0
	bl sub_801615C
	bl sub_801D6D8
	adds r0, r5, #0
	bl Proc_Break
	b _0801CD98
	.align 2, 0
_0801CBFC: .4byte gActiveUnitMoveOrigin
_0801CC00:
	ldr r4, _0801CC70 @ =gActiveUnit
	ldr r0, [r4]
	cmp r0, #0
	beq _0801CC3E
	bl MU_EndAll
	ldr r2, [r4]
	ldr r0, [r2, #0xc]
	movs r1, #2
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r2, #0xc]
	movs r0, #0xc0
	ldrb r2, [r2, #0xb]
	ands r0, r2
	cmp r0, #0
	bne _0801CC3E
	ldr r4, _0801CC74 @ =gActiveUnitMoveOrigin
	movs r0, #0
	ldrsh r1, [r4, r0]
	movs r3, #2
	ldrsh r2, [r4, r3]
	adds r0, r5, #0
	bl sub_801615C
	movs r1, #0
	ldrsh r0, [r4, r1]
	movs r2, #2
	ldrsh r1, [r4, r2]
	bl sub_8015F0C
_0801CC3E:
	ldr r1, _0801CC78 @ =gBmSt
	movs r0, #0xf7
	ldrb r3, [r1, #4]
	ands r0, r3
	strb r0, [r1, #4]
	bl sub_801D6D8
	bl RefreshEntityMaps
	bl RefreshUnitSprites
	ldr r0, _0801CC7C @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0801CC66
	ldr r0, _0801CC80 @ =0x0000038B
	bl m4aSongNumStart
_0801CC66:
	adds r0, r5, #0
	movs r1, #9
	bl Proc_Goto
	b _0801CD98
	.align 2, 0
_0801CC70: .4byte gActiveUnit
_0801CC74: .4byte gActiveUnitMoveOrigin
_0801CC78: .4byte gBmSt
_0801CC7C: .4byte gPlaySt
_0801CC80: .4byte 0x0000038B
_0801CC84:
	ldr r0, _0801CCEC @ =gUnk_08BFFF78
	bl Proc_Find
	cmp r0, #0
	bne _0801CD78
	ldr r2, _0801CCF0 @ =gBmSt
	movs r1, #0x16
	ldrsh r0, [r2, r1]
	ldr r1, _0801CCF4 @ =gBmMapUnit
	ldr r1, [r1]
	lsls r0, r0, #2
	adds r0, r0, r1
	movs r3, #0x14
	ldrsh r1, [r2, r3]
	ldr r0, [r0]
	adds r0, r0, r1
	ldrb r4, [r0]
	ldr r0, _0801CCF8 @ =gActiveUnitMoveOrigin
	ldr r1, [r0]
	ldr r0, [r2, #0x14]
	cmp r1, r0
	bne _0801CCB6
	ldr r0, _0801CCFC @ =gActiveUnit
	ldr r0, [r0]
	ldrb r4, [r0, #0xb]
_0801CCB6:
	cmp r4, #0
	beq _0801CD78
	adds r0, r4, #0
	bl GetUnit
	bl sub_801C608
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0801CD78
	bl MU_EndAll
	movs r0, #0x1f
	bl sub_80807E4
	adds r0, r4, #0
	bl GetUnit
	adds r1, r5, #0
	bl sub_80821F8
	adds r0, r5, #0
	movs r1, #6
	bl Proc_Goto
	b _0801CD98
	.align 2, 0
_0801CCEC: .4byte gUnk_08BFFF78
_0801CCF0: .4byte gBmSt
_0801CCF4: .4byte gBmMapUnit
_0801CCF8: .4byte gActiveUnitMoveOrigin
_0801CCFC: .4byte gActiveUnit
_0801CD00:
	ldr r0, _0801CD38 @ =gActiveUnit
	ldr r0, [r0]
	cmp r0, #0
	beq _0801CD78
	ldr r4, _0801CD3C @ =gActiveUnitMoveOrigin
	movs r0, #0
	ldrsh r1, [r4, r0]
	movs r3, #2
	ldrsh r2, [r4, r3]
	adds r0, r5, #0
	bl sub_801615C
	movs r1, #0
	ldrsh r0, [r4, r1]
	movs r2, #2
	ldrsh r1, [r4, r2]
	bl sub_8015F0C
	ldr r0, _0801CD40 @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0801CD78
	ldr r0, _0801CD44 @ =0x0000038B
	bl m4aSongNumStart
	b _0801CD78
	.align 2, 0
_0801CD38: .4byte gActiveUnit
_0801CD3C: .4byte gActiveUnitMoveOrigin
_0801CD40: .4byte gPlaySt
_0801CD44: .4byte 0x0000038B
_0801CD48:
	ldr r4, _0801CD6C @ =gBmSt
	adds r1, r4, #0
	adds r1, #0x3e
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	bl sub_801D6D8
	movs r0, #8
	ldrb r4, [r4, #4]
	ands r0, r4
	cmp r0, #0
	beq _0801CD70
	adds r0, r5, #0
	movs r1, #0xc
	bl Proc_Goto
	b _0801CD78
	.align 2, 0
_0801CD6C: .4byte gBmSt
_0801CD70:
	adds r0, r5, #0
	movs r1, #0xb
	bl Proc_Goto
_0801CD78:
	ldr r0, _0801CDA0 @ =gActiveUnit
	ldr r0, [r0]
	bl sub_801D270
	cmp r0, #2
	bne _0801CD88
	bl sub_80307D4
_0801CD88:
	ldr r1, _0801CDA4 @ =gBmSt
	movs r3, #0x20
	ldrsh r0, [r1, r3]
	movs r2, #0x22
	ldrsh r1, [r1, r2]
	movs r2, #1
	bl sub_8015DE8
_0801CD98:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0801CDA0: .4byte gActiveUnit
_0801CDA4: .4byte gBmSt

	thumb_func_start sub_801CDA8
sub_801CDA8: @ 0x0801CDA8
	push {lr}
	ldr r2, _0801CDBC @ =gActionSt
	movs r1, #0
	strb r1, [r2, #0x11]
	movs r1, #2
	bl Proc_Goto
	pop {r0}
	bx r0
	.align 2, 0
_0801CDBC: .4byte gActionSt

	thumb_func_start sub_801CDC0
sub_801CDC0: @ 0x0801CDC0
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r4, _0801CE08 @ =gActiveUnit
	ldr r1, [r4]
	ldr r2, _0801CE0C @ =gActiveUnitMoveOrigin
	ldrh r0, [r2]
	strb r0, [r1, #0x10]
	ldr r1, [r4]
	ldrh r0, [r2, #2]
	strb r0, [r1, #0x11]
	ldr r0, [r4]
	bl UnitSyncMovement
	ldr r2, [r4]
	ldr r0, [r2, #0xc]
	movs r1, #2
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r2, #0xc]
	bl RefreshEntityMaps
	bl RenderMap
	bl RefreshUnitSprites
	ldr r4, [r4]
	ldr r0, [r4, #0xc]
	movs r1, #0x40
	ands r0, r1
	cmp r0, #0
	bne _0801CE10
	adds r0, r4, #0
	bl UnitBeginAction
	b _0801CE16
	.align 2, 0
_0801CE08: .4byte gActiveUnit
_0801CE0C: .4byte gActiveUnitMoveOrigin
_0801CE10:
	adds r0, r4, #0
	bl UnitBeginCantoAction
_0801CE16:
	ldr r4, _0801CE38 @ =gActiveUnit
	ldr r0, [r4]
	bl HideUnitSprite
	bl MU_EndAll
	ldr r0, [r4]
	bl StartMu
	adds r0, r5, #0
	movs r1, #1
	bl Proc_Goto
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0801CE38: .4byte gActiveUnit

	thumb_func_start sub_801CE3C
sub_801CE3C: @ 0x0801CE3C
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	ldr r4, _0801CE7C @ =gActionSt
	ldrb r0, [r4, #0xc]
	bl GetUnit
	movs r5, #0x10
	ldrsb r5, [r0, r5]
	ldrb r0, [r4, #0xc]
	bl GetUnit
	movs r2, #0x11
	ldrsb r2, [r0, r2]
	adds r0, r6, #0
	adds r1, r5, #0
	bl sub_801615C
	lsls r0, r0, #0x18
	movs r1, #0x80
	lsls r1, r1, #0x11
	eors r1, r0
	lsrs r5, r1, #0x18
	ldrb r0, [r4, #0x11]
	cmp r0, #0x1f
	bls _0801CE70
	b _0801CF6C
_0801CE70:
	lsls r0, r0, #2
	ldr r1, _0801CE80 @ =_0801CE84
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0801CE7C: .4byte gActionSt
_0801CE80: .4byte _0801CE84
_0801CE84: @ jump table
	.4byte _0801CF04 @ case 0
	.4byte _0801CF6C @ case 1
	.4byte _0801CF6C @ case 2
	.4byte _0801CF6C @ case 3
	.4byte _0801CF6C @ case 4
	.4byte _0801CF6C @ case 5
	.4byte _0801CF6C @ case 6
	.4byte _0801CF6C @ case 7
	.4byte _0801CF6C @ case 8
	.4byte _0801CF44 @ case 9
	.4byte _0801CF44 @ case 10
	.4byte _0801CF6C @ case 11
	.4byte _0801CF6C @ case 12
	.4byte _0801CF6C @ case 13
	.4byte _0801CF6C @ case 14
	.4byte _0801CF6C @ case 15
	.4byte _0801CF6C @ case 16
	.4byte _0801CF6C @ case 17
	.4byte _0801CF6C @ case 18
	.4byte _0801CF6C @ case 19
	.4byte _0801CF6C @ case 20
	.4byte _0801CF6C @ case 21
	.4byte _0801CF6C @ case 22
	.4byte _0801CF6C @ case 23
	.4byte _0801CF2A @ case 24
	.4byte _0801CF38 @ case 25
	.4byte _0801CF5C @ case 26
	.4byte _0801CF6C @ case 27
	.4byte _0801CF6C @ case 28
	.4byte _0801CF6C @ case 29
	.4byte _0801CF50 @ case 30
	.4byte _0801CF50 @ case 31
_0801CF04:
	ldr r0, _0801CF18 @ =gBmSt
	adds r0, #0x3d
	ldrb r0, [r0]
	cmp r0, #0
	beq _0801CF20
	ldr r1, _0801CF1C @ =gActionSt
	movs r0, #0x1c
	strb r0, [r1, #0x11]
	b _0801CF6C
	.align 2, 0
_0801CF18: .4byte gBmSt
_0801CF1C: .4byte gActionSt
_0801CF20:
	adds r0, r6, #0
	bl sub_801CDC0
	movs r0, #1
	b _0801CF8C
_0801CF2A:
	ldr r0, _0801CF34 @ =gBmSt
	adds r0, #0x3d
	movs r1, #2
	b _0801CF56
	.align 2, 0
_0801CF34: .4byte gBmSt
_0801CF38:
	ldr r0, _0801CF40 @ =gBmSt
	adds r0, #0x3d
	movs r1, #4
	b _0801CF56
	.align 2, 0
_0801CF40: .4byte gBmSt
_0801CF44:
	ldr r0, _0801CF4C @ =gBmSt
	adds r0, #0x3d
	movs r1, #1
	b _0801CF56
	.align 2, 0
_0801CF4C: .4byte gBmSt
_0801CF50:
	ldr r0, _0801CF68 @ =gBmSt
	adds r0, #0x3d
	movs r1, #8
_0801CF56:
	ldrb r2, [r0]
	orrs r1, r2
	strb r1, [r0]
_0801CF5C:
	adds r0, r6, #0
	bl sub_801CDA8
	movs r0, #1
	b _0801CF8C
	.align 2, 0
_0801CF68: .4byte gBmSt
_0801CF6C:
	ldr r1, _0801CF94 @ =gActionSt
	ldrb r0, [r1, #0x11]
	cmp r0, #1
	beq _0801CF88
	ldr r0, _0801CF98 @ =gBmSt
	adds r0, #0x3c
	ldrb r0, [r0]
	cmp r0, #0
	bne _0801CF88
	movs r0, #1
	strb r0, [r1, #0x16]
	movs r0, #3
	bl WriteSuspendSave
_0801CF88:
	lsls r0, r5, #0x18
	asrs r0, r0, #0x18
_0801CF8C:
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_0801CF94: .4byte gActionSt
_0801CF98: .4byte gBmSt

	thumb_func_start sub_801CF9C
sub_801CF9C: @ 0x0801CF9C
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	ldr r5, _0801CFEC @ =gActiveUnit
	ldr r2, [r5]
	ldr r0, [r2]
	ldr r3, [r2, #4]
	ldr r0, [r0, #0x28]
	ldr r1, [r3, #0x28]
	orrs r0, r1
	movs r1, #2
	ands r0, r1
	cmp r0, #0
	beq _0801CFE8
	ldr r0, [r2, #0xc]
	ldr r1, _0801CFF0 @ =0x00010044
	ands r0, r1
	cmp r0, #0
	bne _0801CFE8
	ldr r4, _0801CFF4 @ =gActionSt
	ldrb r0, [r4, #0x11]
	subs r0, #2
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bls _0801CFE8
	movs r0, #0x1d
	ldrsb r0, [r2, r0]
	movs r1, #0x12
	ldrsb r1, [r3, r1]
	adds r0, r0, r1
	ldrb r4, [r4, #0x10]
	cmp r0, r4
	ble _0801CFE8
	bl CanActiveUnitStillMove
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0801CFF8
_0801CFE8:
	movs r0, #0
	b _0801D04A
	.align 2, 0
_0801CFEC: .4byte gActiveUnit
_0801CFF0: .4byte 0x00010044
_0801CFF4: .4byte gActionSt
_0801CFF8:
	ldr r0, _0801D038 @ =0x0202E3E4
	ldr r0, [r0]
	movs r1, #0
	bl BmMapFillg
	ldr r0, [r5]
	bl UnitBeginCantoAction
	ldr r2, [r5]
	ldr r0, [r2, #0xc]
	movs r1, #0x40
	orrs r0, r1
	subs r1, #0x43
	ands r0, r1
	str r0, [r2, #0xc]
	bl MU_EndAll
	ldr r0, [r5]
	bl StartMu
	bl sub_806C7CC
	ldr r0, _0801D03C @ =gPlaySt
	ldrb r0, [r0, #0xd]
	cmp r0, #0
	beq _0801D040
	adds r0, r6, #0
	movs r1, #4
	bl Proc_Goto
	b _0801D048
	.align 2, 0
_0801D038: .4byte 0x0202E3E4
_0801D03C: .4byte gPlaySt
_0801D040:
	adds r0, r6, #0
	movs r1, #1
	bl Proc_Goto
_0801D048:
	movs r0, #1
_0801D04A:
	pop {r4, r5, r6}
	pop {r1}
	bx r1

	thumb_func_start sub_801D050
sub_801D050: @ 0x0801D050
	push {lr}
	bl sub_8079910
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0801D060
	movs r0, #1
	b _0801D066
_0801D060:
	bl sub_8079950
	movs r0, #0
_0801D066:
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_801D06C
sub_801D06C: @ 0x0801D06C
	push {lr}
	ldr r1, _0801D090 @ =gActiveUnit
	ldr r2, [r1]
	movs r1, #0x10
	ldrsb r1, [r2, r1]
	ldrb r2, [r2, #0x11]
	lsls r2, r2, #0x18
	asrs r2, r2, #0x18
	bl sub_801615C
	movs r1, #0
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0801D08A
	movs r1, #1
_0801D08A:
	adds r0, r1, #0
	pop {r1}
	bx r1
	.align 2, 0
_0801D090: .4byte gActiveUnit

	thumb_func_start sub_801D094
sub_801D094: @ 0x0801D094
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r0, _0801D0C4 @ =gPlaySt
	ldrb r0, [r0, #0xd]
	cmp r0, #0
	beq _0801D0CC
	bl RenderMapForFade
	ldr r1, _0801D0C8 @ =gActionSt
	ldrb r0, [r1, #0xe]
	ldrb r1, [r1, #0xf]
	bl MoveActiveUnit
	bl RefreshEntityMaps
	bl RenderMap
	movs r0, #0
	bl StartMapFade
	bl RefreshUnitSprites
	b _0801D0DE
	.align 2, 0
_0801D0C4: .4byte gPlaySt
_0801D0C8: .4byte gActionSt
_0801D0CC:
	ldr r1, _0801D110 @ =gActionSt
	ldrb r0, [r1, #0xe]
	ldrb r1, [r1, #0xf]
	bl MoveActiveUnit
	bl RefreshEntityMaps
	bl RenderMap
_0801D0DE:
	ldr r4, _0801D114 @ =gActiveUnit
	ldr r1, [r4]
	movs r0, #0x10
	ldrsb r0, [r1, r0]
	ldrb r1, [r1, #0x11]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	bl sub_8015F0C
	ldr r2, _0801D118 @ =gPlaySt
	ldr r1, _0801D11C @ =gBmSt
	ldrh r0, [r1, #0x14]
	strb r0, [r2, #0x12]
	ldrh r0, [r1, #0x16]
	strb r0, [r2, #0x13]
	adds r0, r5, #0
	bl sub_801CF9C
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0801D120
	ldr r0, [r4]
	bl HideUnitSprite
	b _0801D14C
	.align 2, 0
_0801D110: .4byte gActionSt
_0801D114: .4byte gActiveUnit
_0801D118: .4byte gPlaySt
_0801D11C: .4byte gBmSt
_0801D120:
	bl sub_807977C
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0801D148
	bl MU_EndAll
	bl RefreshEntityMaps
	bl RenderMap
	bl RefreshUnitSprites
	bl sub_807978C
	adds r0, r5, #0
	movs r1, #8
	bl Proc_Goto
	b _0801D14C
_0801D148:
	bl MU_EndAll
_0801D14C:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_801D154
sub_801D154: @ 0x0801D154
	push {lr}
	ldr r0, _0801D17C @ =gPlaySt
	ldrb r0, [r0, #0xf]
	cmp r0, #0
	bne _0801D178
	ldr r1, _0801D180 @ =gActionSt
	ldrb r0, [r1, #0xe]
	ldrb r1, [r1, #0xf]
	bl MoveActiveUnit
	bl RefreshEntityMaps
	bl RenderMap
	bl RefreshUnitSprites
	bl MU_EndAll
_0801D178:
	pop {r0}
	bx r0
	.align 2, 0
_0801D17C: .4byte gPlaySt
_0801D180: .4byte gActionSt

	thumb_func_start sub_801D184
sub_801D184: @ 0x0801D184
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0801D1B4 @ =gActionSt
	ldrb r0, [r0, #0x11]
	cmp r0, #0x1b
	beq _0801D1A6
	ldr r0, _0801D1B8 @ =gUnk_08C04D68
	ldr r2, _0801D1BC @ =gBmSt
	movs r3, #0x1c
	ldrsh r1, [r2, r3]
	movs r3, #0xc
	ldrsh r2, [r2, r3]
	subs r1, r1, r2
	movs r2, #1
	movs r3, #0x16
	bl sub_804B2DC
_0801D1A6:
	adds r0, r4, #0
	bl Proc_Break
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0801D1B4: .4byte gActionSt
_0801D1B8: .4byte gUnk_08C04D68
_0801D1BC: .4byte gBmSt

	thumb_func_start sub_801D1C0
sub_801D1C0: @ 0x0801D1C0
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	ldr r4, _0801D224 @ =gActiveUnit
	ldr r1, [r4]
	ldr r5, _0801D228 @ =gActionSt
	ldrb r0, [r5, #0xe]
	strb r0, [r1, #0x10]
	ldr r1, [r4]
	ldrb r0, [r5, #0xf]
	strb r0, [r1, #0x11]
	ldr r0, [r4]
	bl UnitSyncMovement
	ldr r0, [r4]
	ldr r0, [r0, #0xc]
	movs r1, #0x40
	ands r0, r1
	cmp r0, #0
	bne _0801D20A
	ldrb r0, [r5, #0x11]
	cmp r0, #0
	bne _0801D20A
	ldr r0, _0801D22C @ =gBmSt
	adds r0, #0x3d
	ldrb r0, [r0]
	cmp r0, #0
	bne _0801D20A
	ldr r0, _0801D230 @ =gBmMapMovement
	ldr r1, [r0]
	ldrb r2, [r5, #0xf]
	lsls r0, r2, #2
	adds r0, r0, r1
	ldr r0, [r0]
	ldrb r3, [r5, #0xe]
	adds r0, r3, r0
	ldrb r0, [r0]
	strb r0, [r5, #0x10]
_0801D20A:
	bl ResetTextFont
	bl sub_80797D4
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne _0801D238
	ldr r1, _0801D234 @ =sub_801D184
	adds r0, r6, #0
	bl sub_8004B1C
	b _0801D25C
	.align 2, 0
_0801D224: .4byte gActiveUnit
_0801D228: .4byte gActionSt
_0801D22C: .4byte gBmSt
_0801D230: .4byte gBmMapMovement
_0801D234: .4byte sub_801D184
_0801D238:
	ldr r0, _0801D264 @ =gActionSt
	ldrb r0, [r0, #0x11]
	cmp r0, #0x1b
	beq _0801D256
	ldr r0, _0801D268 @ =gUnk_08C04D68
	ldr r2, _0801D26C @ =gBmSt
	movs r3, #0x1c
	ldrsh r1, [r2, r3]
	movs r3, #0xc
	ldrsh r2, [r2, r3]
	subs r1, r1, r2
	movs r2, #1
	movs r3, #0x16
	bl sub_804B2DC
_0801D256:
	adds r0, r6, #0
	bl Proc_Break
_0801D25C:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0801D264: .4byte gActionSt
_0801D268: .4byte gUnk_08C04D68
_0801D26C: .4byte gBmSt

	thumb_func_start sub_801D270
sub_801D270: @ 0x0801D270
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0801D29C @ =gPlaySt
	ldrb r2, [r0, #0xf]
	cmp r4, #0
	beq _0801D2AA
	ldr r1, _0801D2A0 @ =gBmSt
	movs r0, #0x10
	ldrb r1, [r1, #4]
	ands r0, r1
	cmp r0, #0
	beq _0801D2A6
	ldr r0, [r4]
	ldrb r0, [r0, #4]
	bl sub_8030C68
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0801D2A4
	movs r0, #4
	b _0801D2F2
	.align 2, 0
_0801D29C: .4byte gPlaySt
_0801D2A0: .4byte gBmSt
_0801D2A4:
	movs r2, #0
_0801D2A6:
	cmp r4, #0
	bne _0801D2AE
_0801D2AA:
	movs r0, #0
	b _0801D2F2
_0801D2AE:
	movs r0, #0xc0
	ldrb r1, [r4, #0xb]
	ands r0, r1
	cmp r0, r2
	bne _0801D2F0
	ldr r0, [r4, #0xc]
	movs r1, #2
	ands r0, r1
	cmp r0, #0
	bne _0801D2D6
	ldr r0, [r4]
	ldr r1, [r4, #4]
	ldr r0, [r0, #0x28]
	ldr r1, [r1, #0x28]
	orrs r0, r1
	movs r1, #0x80
	lsls r1, r1, #0xd
	ands r0, r1
	cmp r0, #0
	beq _0801D2DA
_0801D2D6:
	movs r0, #1
	b _0801D2F2
_0801D2DA:
	adds r0, r4, #0
	adds r0, #0x30
	movs r1, #0xf
	ldrb r0, [r0]
	ands r1, r0
	cmp r1, #2
	beq _0801D2F0
	cmp r1, #4
	beq _0801D2F0
	movs r0, #2
	b _0801D2F2
_0801D2F0:
	movs r0, #3
_0801D2F2:
	pop {r4}
	pop {r1}
	bx r1

	thumb_func_start sub_801D2F8
sub_801D2F8: @ 0x0801D2F8
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r0, _0801D35C @ =gBmMapUnit
	ldr r0, [r0]
	lsls r1, r5, #2
	adds r0, r1, r0
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r0, [r0]
	cmp r0, #0
	bne _0801D356
	ldr r0, _0801D360 @ =gBmMapMovement
	ldr r0, [r0]
	adds r0, r1, r0
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r0, [r0]
	cmp r0, #0x77
	bhi _0801D356
	ldr r0, _0801D364 @ =gActiveUnit
	ldr r0, [r0]
	ldr r0, [r0, #0xc]
	movs r1, #0x80
	lsls r1, r1, #4
	ands r0, r1
	cmp r0, #0
	beq _0801D36C
	adds r0, r4, #0
	adds r1, r5, #0
	bl GetTrapAt
	adds r2, r0, #0
	ldr r1, _0801D368 @ =gActiveUnitMoveOrigin
	movs r3, #0
	ldrsh r0, [r1, r3]
	cmp r4, r0
	bne _0801D34C
	movs r3, #2
	ldrsh r0, [r1, r3]
	cmp r5, r0
	beq _0801D36C
_0801D34C:
	cmp r2, #0
	beq _0801D36C
	ldrb r2, [r2, #2]
	cmp r2, #1
	bne _0801D36C
_0801D356:
	movs r0, #0
	b _0801D36E
	.align 2, 0
_0801D35C: .4byte gBmMapUnit
_0801D360: .4byte gBmMapMovement
_0801D364: .4byte gActiveUnit
_0801D368: .4byte gActiveUnitMoveOrigin
_0801D36C:
	movs r0, #1
_0801D36E:
	pop {r4, r5}
	pop {r1}
	bx r1

	thumb_func_start sub_801D374
sub_801D374: @ 0x0801D374
	push {lr}
	bl sub_803022C
	ldr r0, _0801D394 @ =gActiveUnit
	ldr r0, [r0]
	movs r1, #0x10
	ldrsb r1, [r0, r1]
	movs r2, #0x11
	ldrsb r2, [r0, r2]
	bl sub_801A424
	ldr r0, _0801D398 @ =0x02033DFC
	bl sub_806C7F8
	pop {r0}
	bx r0
	.align 2, 0
_0801D394: .4byte gActiveUnit
_0801D398: .4byte 0x02033DFC

	thumb_func_start sub_801D39C
sub_801D39C: @ 0x0801D39C
	push {r4, lr}
	adds r4, r0, #0
	bl sub_806C850
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0801D3B0
	adds r0, r4, #0
	bl Proc_Break
_0801D3B0:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_801D3B8
sub_801D3B8: @ 0x0801D3B8
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	ldr r5, _0801D3D4 @ =gActiveUnit
	ldr r2, [r5]
	cmp r2, #0
	bne _0801D3D8
	bl sub_802E834
	adds r0, r6, #0
	movs r1, #0xc
	bl Proc_Goto
	b _0801D444
	.align 2, 0
_0801D3D4: .4byte gActiveUnit
_0801D3D8:
	movs r0, #0x11
	ldrsb r0, [r2, r0]
	ldr r4, _0801D430 @ =gBmMapUnit
	ldr r1, [r4]
	lsls r0, r0, #2
	adds r0, r0, r1
	movs r1, #0x10
	ldrsb r1, [r2, r1]
	ldr r0, [r0]
	adds r0, r0, r1
	ldrb r1, [r2, #0xb]
	strb r1, [r0]
	ldr r2, [r5]
	ldr r0, [r2, #0xc]
	movs r1, #2
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r2, #0xc]
	bl sub_802E834
	ldr r2, [r5]
	movs r0, #0x11
	ldrsb r0, [r2, r0]
	ldr r1, [r4]
	lsls r0, r0, #2
	adds r0, r0, r1
	movs r1, #0x10
	ldrsb r1, [r2, r1]
	ldr r0, [r0]
	adds r0, r0, r1
	movs r1, #0
	strb r1, [r0]
	ldr r0, [r5]
	ldr r1, [r0, #0xc]
	movs r2, #1
	orrs r1, r2
	str r1, [r0, #0xc]
	bl sub_801D270
	cmp r0, #2
	beq _0801D434
	cmp r0, #3
	beq _0801D43C
	b _0801D444
	.align 2, 0
_0801D430: .4byte gBmMapUnit
_0801D434:
	ldr r0, [r5]
	bl HideUnitSprite
	b _0801D444
_0801D43C:
	adds r0, r6, #0
	movs r1, #0xb
	bl Proc_Goto
_0801D444:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_801D44C
sub_801D44C: @ 0x0801D44C
	push {lr}
	bl sub_802E834
	ldr r3, _0801D478 @ =gDispIo
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
	pop {r0}
	bx r0
	.align 2, 0
_0801D478: .4byte gDispIo

	thumb_func_start sub_801D47C
sub_801D47C: @ 0x0801D47C
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r5, _0801D4A4 @ =gUnk_08404734
	ldr r1, _0801D4A8 @ =0x06005080
	adds r0, r5, #0
	movs r2, #0x80
	bl RegisterDataMove
	ldr r1, _0801D4AC @ =gBmSt
	movs r0, #1
	ldrb r1, [r1, #4]
	ands r0, r1
	cmp r0, #0
	bne _0801D4B0
	adds r1, r4, #0
	adds r1, #0x4c
	movs r0, #2
	strh r0, [r1]
	b _0801D4C0
	.align 2, 0
_0801D4A4: .4byte gUnk_08404734
_0801D4A8: .4byte 0x06005080
_0801D4AC: .4byte gBmSt
_0801D4B0:
	ldr r1, _0801D4C8 @ =0x06005000
	adds r0, r5, #0
	movs r2, #0x80
	bl RegisterDataMove
	adds r0, r4, #0
	bl Proc_End
_0801D4C0:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0801D4C8: .4byte 0x06005000

	thumb_func_start sub_801D4CC
sub_801D4CC: @ 0x0801D4CC
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r1, _0801D504 @ =gUnk_08C02828
	adds r4, r5, #0
	adds r4, #0x4c
	movs r2, #0
	ldrsh r0, [r4, r2]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	ldr r1, _0801D508 @ =0x06005000
	movs r2, #0x80
	bl RegisterDataMove
	ldrh r0, [r4]
	adds r0, #1
	strh r0, [r4]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #8
	bne _0801D4FC
	adds r0, r5, #0
	bl Proc_Break
_0801D4FC:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0801D504: .4byte gUnk_08C02828
_0801D508: .4byte 0x06005000

	thumb_func_start sub_801D50C
sub_801D50C: @ 0x0801D50C
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	ldr r2, _0801D5D4 @ =gDispIo
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
	ldr r4, _0801D5D8 @ =gBmSt
	movs r0, #1
	ldrb r2, [r4, #4]
	orrs r0, r2
	strb r0, [r4, #4]
	bl RenderMap
	movs r5, #9
	adds r7, r4, #0
_0801D538:
	movs r4, #0xe
	subs r6, r5, #1
_0801D53C:
	movs r0, #0x24
	ldrsh r1, [r7, r0]
	adds r1, r1, r4
	movs r0, #0x26
	ldrsh r2, [r7, r0]
	adds r2, r2, r5
	str r5, [sp]
	ldr r0, _0801D5DC @ =gBg2Tm
	adds r3, r4, #0
	bl sub_801983C
	subs r4, #1
	cmp r4, #0
	bge _0801D53C
	adds r5, r6, #0
	cmp r5, #0
	bge _0801D538
	movs r0, #4
	bl EnableBgSync
	movs r0, #2
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	ldr r4, _0801D5D4 @ =gDispIo
	adds r2, r4, #0
	adds r2, #0x3c
	movs r0, #0x3f
	ldrb r1, [r2]
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r2]
	adds r1, r4, #0
	adds r1, #0x44
	movs r3, #0
	movs r0, #0xa
	strb r0, [r1]
	adds r1, #1
	movs r0, #6
	strb r0, [r1]
	adds r0, r4, #0
	adds r0, #0x46
	strb r3, [r0]
	ldr r0, _0801D5E0 @ =0x0000FFE0
	ldrh r1, [r4, #0x3c]
	ands r0, r1
	movs r1, #4
	orrs r0, r1
	strh r0, [r4, #0x3c]
	movs r0, #0x21
	rsbs r0, r0, #0
	ldrb r1, [r2]
	ands r0, r1
	strb r0, [r2]
	ldr r0, _0801D5E4 @ =0x0000E0FF
	ldrh r2, [r4, #0x3c]
	ands r0, r2
	movs r2, #0xc0
	lsls r2, r2, #5
	adds r1, r2, #0
	orrs r0, r1
	strh r0, [r4, #0x3c]
	adds r1, r4, #0
	adds r1, #0x3d
	movs r0, #0x20
	ldrb r2, [r1]
	orrs r0, r2
	strb r0, [r1]
	bl InitBmBgLayers
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0801D5D4: .4byte gDispIo
_0801D5D8: .4byte gBmSt
_0801D5DC: .4byte gBg2Tm
_0801D5E0: .4byte 0x0000FFE0
_0801D5E4: .4byte 0x0000E0FF

	thumb_func_start sub_801D5E8
sub_801D5E8: @ 0x0801D5E8
	push {r4, r5, lr}
	adds r4, r0, #0
	bl GetGameTime
	lsrs r5, r0, #1
	movs r0, #0x1f
	ands r5, r0
	adds r4, #0x4a
	movs r0, #1
	ldrh r1, [r4]
	ands r0, r1
	cmp r0, #0
	beq _0801D610
	lsls r0, r5, #1
	ldr r1, _0801D660 @ =gUnk_084047B4
	adds r0, r0, r1
	movs r1, #0x82
	movs r2, #0x20
	bl ApplyPaletteExt
_0801D610:
	movs r0, #2
	ldrh r1, [r4]
	ands r0, r1
	cmp r0, #0
	beq _0801D628
	lsls r0, r5, #1
	ldr r1, _0801D664 @ =gUnk_08404814
	adds r0, r0, r1
	movs r1, #0xa2
	movs r2, #0x20
	bl ApplyPaletteExt
_0801D628:
	movs r0, #4
	ldrh r1, [r4]
	ands r0, r1
	cmp r0, #0
	beq _0801D640
	lsls r0, r5, #1
	ldr r1, _0801D668 @ =gUnk_08404874
	adds r0, r0, r1
	movs r1, #0xa2
	movs r2, #0x20
	bl ApplyPaletteExt
_0801D640:
	movs r0, #0x10
	ldrh r4, [r4]
	ands r0, r4
	cmp r0, #0
	beq _0801D658
	lsls r0, r5, #1
	ldr r1, _0801D660 @ =gUnk_084047B4
	adds r0, r0, r1
	movs r1, #0xa2
	movs r2, #0x20
	bl ApplyPaletteExt
_0801D658:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0801D660: .4byte gUnk_084047B4
_0801D664: .4byte gUnk_08404814
_0801D668: .4byte gUnk_08404874

	thumb_func_start sub_801D66C
sub_801D66C: @ 0x0801D66C
	push {lr}
	adds r0, #0x4a
	movs r1, #0x11
	ldrh r0, [r0]
	ands r1, r0
	cmp r1, #0
	beq _0801D688
	ldr r0, _0801D69C @ =gBg2Tm
	movs r1, #0
	bl TmFill
	movs r0, #4
	bl EnableBgSync
_0801D688:
	ldr r1, _0801D6A0 @ =gBmSt
	movs r0, #0xfc
	ldrb r2, [r1, #4]
	ands r0, r2
	strb r0, [r1, #4]
	bl InitBmBgLayers
	pop {r0}
	bx r0
	.align 2, 0
_0801D69C: .4byte gBg2Tm
_0801D6A0: .4byte gBmSt

	thumb_func_start sub_801D6A4
sub_801D6A4: @ 0x0801D6A4
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r4, _0801D6C0 @ =gUnk_08C02870
	adds r0, r4, #0
	bl Proc_Find
	cmp r0, #0
	beq _0801D6C4
	bl sub_801D50C
	movs r0, #0
	bl sub_801D47C
	b _0801D6D0
	.align 2, 0
_0801D6C0: .4byte gUnk_08C02870
_0801D6C4:
	adds r0, r4, #0
	movs r1, #4
	bl Proc_Start
	adds r0, #0x4a
	strh r5, [r0]
_0801D6D0:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_801D6D8
sub_801D6D8: @ 0x0801D6D8
	push {lr}
	ldr r0, _0801D6E4 @ =gUnk_08C02870
	bl sub_8004748
	pop {r0}
	bx r0
	.align 2, 0
_0801D6E4: .4byte gUnk_08C02870

	thumb_func_start sub_801D6E8
sub_801D6E8: @ 0x0801D6E8
	push {r4, lr}
	bl GetUnit
	adds r4, r0, #0
	cmp r4, #0
	beq _0801D716
	ldr r0, [r4]
	cmp r0, #0
	beq _0801D716
	ldr r0, [r4, #0xc]
	ldr r1, _0801D71C @ =0x00010007
	ands r0, r1
	cmp r0, #0
	bne _0801D716
	adds r0, r4, #0
	adds r0, #0x30
	movs r1, #0xf
	ldrb r0, [r0]
	ands r1, r0
	cmp r1, #4
	beq _0801D716
	cmp r1, #2
	bne _0801D720
_0801D716:
	movs r0, #0
	b _0801D74A
	.align 2, 0
_0801D71C: .4byte 0x00010007
_0801D720:
	ldr r0, _0801D750 @ =gUnk_08C02630
	bl Proc_Find
	cmp r0, #0
	bne _0801D730
	ldr r0, _0801D754 @ =gUnk_08C0571C
	bl Proc_Find
_0801D730:
	movs r1, #0x10
	ldrsb r1, [r4, r1]
	movs r2, #0x11
	ldrsb r2, [r4, r2]
	bl sub_801615C
	movs r0, #0x10
	ldrsb r0, [r4, r0]
	movs r1, #0x11
	ldrsb r1, [r4, r1]
	bl sub_8015F0C
	movs r0, #1
_0801D74A:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0801D750: .4byte gUnk_08C02630
_0801D754: .4byte gUnk_08C0571C

	thumb_func_start sub_801D758
sub_801D758: @ 0x0801D758
	push {r4, r5, lr}
	ldr r2, _0801D7AC @ =gBmMapUnit
	ldr r2, [r2]
	lsls r1, r1, #2
	adds r1, r1, r2
	ldr r1, [r1]
	adds r1, r1, r0
	ldrb r5, [r1]
	movs r0, #0xc0
	ands r0, r5
	cmp r0, #0
	beq _0801D772
	movs r5, #0
_0801D772:
	adds r5, #1
	adds r4, r5, #0
	cmp r5, #0x3e
	bgt _0801D78C
_0801D77A:
	adds r0, r4, #0
	bl sub_801D6E8
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0801D7A4
	adds r4, #1
	cmp r4, #0x3e
	ble _0801D77A
_0801D78C:
	movs r4, #1
	cmp r4, r5
	bgt _0801D7A4
_0801D792:
	adds r0, r4, #0
	bl sub_801D6E8
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0801D7A4
	adds r4, #1
	cmp r4, r5
	ble _0801D792
_0801D7A4:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0801D7AC: .4byte gBmMapUnit

	thumb_func_start sub_801D7B0
sub_801D7B0: @ 0x0801D7B0
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, _0801D7DC @ =gPlaySt
	adds r0, r1, #0
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x19
	cmp r0, #0
	blt _0801D7D4
	ldrb r0, [r1, #0xf]
	bl CountFactionMoveableUnits
	cmp r0, #0
	bne _0801D7D4
	adds r0, r4, #0
	movs r1, #3
	bl Proc_Goto
_0801D7D4:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0801D7DC: .4byte gPlaySt
