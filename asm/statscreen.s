	.include "macro.inc"
	.syntax unified

	thumb_func_start DisplayPage0
DisplayPage0: @ 0x08080B5C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #8
	ldr r0, _08080BA8 @ =sPage0TextInfo
	ldr r4, _08080BAC @ =gBuf
	adds r1, r4, #0
	bl Decompress
	ldr r0, _08080BB0 @ =gUiTmScratchB
	movs r2, #0x80
	lsls r2, r2, #5
	adds r1, r4, #0
	bl TmApplyTsa_thm
	ldr r0, _08080BB4 @ =gUnk_0841CBB8
	bl PutStatScreenText
	ldr r4, _08080BB8 @ =gStatScreenSt
	ldr r0, [r4, #0xc]
	bl UnitHasMagicRank
	lsls r0, r0, #0x18
	asrs r2, r0, #0x18
	cmp r2, #0
	beq _08080BC4
	adds r0, r4, #0
	adds r0, #0x30
	ldr r1, _08080BBC @ =0x0200327E
	movs r2, #0
	str r2, [sp]
	ldr r2, _08080BC0 @ =gUnk_0841CD84
	str r2, [sp, #4]
	movs r2, #3
	movs r3, #0
	bl PutDrawText
	b _08080BD8
	.align 2, 0
_08080BA8: .4byte sPage0TextInfo
_08080BAC: .4byte gBuf
_08080BB0: .4byte gUiTmScratchB
_08080BB4: .4byte gUnk_0841CBB8
_08080BB8: .4byte gStatScreenSt
_08080BBC: .4byte 0x0200327E
_08080BC0: .4byte gUnk_0841CD84
_08080BC4:
	adds r0, r4, #0
	adds r0, #0x30
	ldr r1, _08080DF4 @ =0x0200327E
	str r2, [sp]
	ldr r2, _08080DF8 @ =gUnk_0841CD8C
	str r2, [sp, #4]
	movs r2, #3
	movs r3, #4
	bl PutDrawText
_08080BD8:
	ldr r6, _08080DFC @ =gStatScreenSt
	ldr r0, [r6, #0xc]
	bl GetUnitPower
	ldr r1, [r6, #0xc]
	movs r3, #0x14
	ldrsb r3, [r1, r3]
	str r0, [sp]
	ldr r0, [r1, #4]
	ldrb r0, [r0, #0x14]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	str r0, [sp, #4]
	movs r0, #0
	movs r1, #5
	movs r2, #1
	bl PutStatScreenStatWithBar
	ldr r0, [r6, #0xc]
	bl GetUnitSkill
	adds r4, r0, #0
	ldr r2, [r6, #0xc]
	ldrb r1, [r2, #0x15]
	ldr r0, [r2, #0xc]
	movs r5, #0x10
	ands r0, r5
	cmp r0, #0
	beq _08080C1C
	lsls r0, r1, #0x18
	asrs r1, r0, #0x18
	lsrs r0, r0, #0x1f
	adds r1, r1, r0
	lsrs r1, r1, #1
_08080C1C:
	lsls r0, r1, #0x18
	asrs r3, r0, #0x18
	str r4, [sp]
	ldr r0, [r2, #4]
	ldrb r1, [r0, #0x15]
	ldr r0, [r2, #0xc]
	ands r0, r5
	cmp r0, #0
	beq _08080C38
	lsls r0, r1, #0x18
	asrs r1, r0, #0x18
	lsrs r0, r0, #0x1f
	adds r1, r1, r0
	lsrs r1, r1, #1
_08080C38:
	lsls r0, r1, #0x18
	asrs r0, r0, #0x18
	str r0, [sp, #4]
	movs r0, #1
	movs r1, #5
	movs r2, #3
	bl PutStatScreenStatWithBar
	ldr r0, [r6, #0xc]
	bl GetUnitSpeed
	adds r4, r0, #0
	ldr r2, [r6, #0xc]
	ldrb r1, [r2, #0x16]
	ldr r0, [r2, #0xc]
	ands r0, r5
	cmp r0, #0
	beq _08080C66
	lsls r0, r1, #0x18
	asrs r1, r0, #0x18
	lsrs r0, r0, #0x1f
	adds r1, r1, r0
	lsrs r1, r1, #1
_08080C66:
	lsls r0, r1, #0x18
	asrs r3, r0, #0x18
	str r4, [sp]
	ldr r0, [r2, #4]
	ldrb r1, [r0, #0x16]
	ldr r0, [r2, #0xc]
	ands r0, r5
	cmp r0, #0
	beq _08080C82
	lsls r0, r1, #0x18
	asrs r1, r0, #0x18
	lsrs r0, r0, #0x1f
	adds r1, r1, r0
	lsrs r1, r1, #1
_08080C82:
	lsls r0, r1, #0x18
	asrs r0, r0, #0x18
	str r0, [sp, #4]
	movs r0, #2
	movs r1, #5
	movs r2, #5
	bl PutStatScreenStatWithBar
	ldr r0, [r6, #0xc]
	bl GetUnitLuck
	ldr r1, [r6, #0xc]
	movs r3, #0x19
	ldrsb r3, [r1, r3]
	str r0, [sp]
	movs r0, #0x1e
	str r0, [sp, #4]
	movs r0, #3
	movs r1, #5
	movs r2, #7
	bl PutStatScreenStatWithBar
	ldr r0, [r6, #0xc]
	bl GetUnitDefense
	ldr r1, [r6, #0xc]
	movs r3, #0x17
	ldrsb r3, [r1, r3]
	str r0, [sp]
	ldr r0, [r1, #4]
	ldrb r0, [r0, #0x17]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	str r0, [sp, #4]
	movs r0, #4
	movs r1, #5
	movs r2, #9
	bl PutStatScreenStatWithBar
	ldr r0, [r6, #0xc]
	bl GetUnitResistance
	ldr r1, [r6, #0xc]
	movs r3, #0x18
	ldrsb r3, [r1, r3]
	str r0, [sp]
	ldr r0, [r1, #4]
	ldrb r0, [r0, #0x18]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	str r0, [sp, #4]
	movs r0, #5
	movs r1, #5
	movs r2, #0xb
	bl PutStatScreenStatWithBar
	ldr r1, [r6, #0xc]
	ldr r0, [r1, #4]
	movs r3, #0x12
	ldrsb r3, [r0, r3]
	movs r0, #0x1d
	ldrsb r0, [r1, r0]
	adds r0, r0, r3
	str r0, [sp]
	movs r5, #0xf
	str r5, [sp, #4]
	movs r0, #6
	movs r1, #0xd
	movs r2, #1
	bl PutStatScreenStatWithBar
	ldr r1, [r6, #0xc]
	ldr r0, [r1, #4]
	movs r3, #0x11
	ldrsb r3, [r0, r3]
	ldr r0, [r1]
	ldrb r0, [r0, #0x13]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r3, r3, r0
	movs r0, #0x1a
	ldrsb r0, [r1, r0]
	adds r0, r3, r0
	str r0, [sp]
	ldr r0, [r1, #4]
	ldrb r0, [r0, #0x19]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	str r0, [sp, #4]
	movs r0, #7
	movs r1, #0xd
	movs r2, #3
	bl PutStatScreenStatWithBar
	ldr r7, _08080E00 @ =0x02003396
	ldr r0, [r6, #0xc]
	bl GetUnitAid
	adds r2, r0, #0
	adds r0, r7, #0
	movs r1, #2
	bl PutNumber
	adds r4, r7, #2
	ldr r0, [r6, #0xc]
	ldr r1, [r0]
	ldr r2, [r0, #4]
	ldr r0, [r1, #0x28]
	ldr r1, [r2, #0x28]
	orrs r0, r1
	bl GetUnitAidIconId
	adds r1, r0, #0
	movs r0, #0xa0
	lsls r0, r0, #7
	mov r8, r0
	adds r0, r4, #0
	mov r2, r8
	bl PutIcon
	adds r4, r6, #0
	adds r4, #0x78
	ldr r0, [r6, #0xc]
	bl GetUnitRescueName
	adds r3, r0, #0
	adds r0, r4, #0
	movs r1, #0x18
	movs r2, #2
	bl Text_InsertDrawString
	adds r4, #0x10
	ldr r0, [r6, #0xc]
	bl GetUnitStatusName
	adds r3, r0, #0
	adds r0, r4, #0
	movs r1, #0x18
	movs r2, #2
	bl Text_InsertDrawString
	ldr r0, [r6, #0xc]
	adds r0, #0x30
	ldrb r2, [r0]
	ands r5, r2
	cmp r5, #0
	beq _08080DB6
	movs r1, #0xc3
	lsls r1, r1, #1
	adds r0, r7, r1
	lsrs r2, r2, #4
	movs r1, #0
	bl PutNumberSmall
_08080DB6:
	adds r4, r7, #0
	adds r4, #0xfe
	ldr r0, [r6, #0xc]
	bl sub_8026FB0
	adds r1, r0, #0
	adds r0, r4, #0
	mov r2, r8
	bl PutIcon
	adds r4, r6, #0
	adds r4, #0x80
	ldr r0, [r6, #0xc]
	ldr r0, [r0]
	ldrb r0, [r0, #9]
	bl sub_8027000
	adds r3, r0, #0
	adds r0, r4, #0
	movs r1, #0x28
	movs r2, #2
	bl Text_InsertDrawString
	bl DisplayBwl
	add sp, #8
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08080DF4: .4byte 0x0200327E
_08080DF8: .4byte gUnk_0841CD8C
_08080DFC: .4byte gStatScreenSt
_08080E00: .4byte 0x02003396

	thumb_func_start sub_8080E04
sub_8080E04: @ 0x08080E04
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	ldr r0, _08080E68 @ =gUnk_08403560
	ldr r4, _08080E6C @ =gBuf
	adds r1, r4, #0
	bl Decompress
	ldr r0, _08080E70 @ =gUiTmScratchB
	movs r2, #0x80
	lsls r2, r2, #5
	adds r1, r4, #0
	bl TmApplyTsa_thm
	ldr r0, _08080E74 @ =gUnk_084038CC
	adds r1, r4, #0
	bl Decompress
	ldr r0, _08080E78 @ =0x02003EFE
	ldr r2, _08080E7C @ =0x00007060
	adds r1, r4, #0
	bl TmApplyTsa_thm
	ldr r0, _08080E80 @ =gUnk_0841CC78
	bl PutStatScreenText
	movs r4, #0
	ldr r1, _08080E84 @ =gStatScreenSt
	ldr r0, [r1, #0xc]
	ldrh r5, [r0, #0x1e]
	cmp r5, #0
	beq _08080EC2
	adds r7, r1, #0
	mov r8, r4
	movs r6, #0x40
_08080E4A:
	ldr r2, [r7, #0xc]
	ldr r0, [r2, #0xc]
	movs r1, #0x80
	lsls r1, r1, #5
	ands r0, r1
	cmp r0, #0
	beq _08080E88
	adds r0, r2, #0
	bl GetUnitItemCount
	subs r0, #1
	cmp r4, r0
	bne _08080E88
	movs r2, #4
	b _08080E9A
	.align 2, 0
_08080E68: .4byte gUnk_08403560
_08080E6C: .4byte gBuf
_08080E70: .4byte gUiTmScratchB
_08080E74: .4byte gUnk_084038CC
_08080E78: .4byte 0x02003EFE
_08080E7C: .4byte 0x00007060
_08080E80: .4byte gUnk_0841CC78
_08080E84: .4byte gStatScreenSt
_08080E88:
	ldr r0, [r7, #0xc]
	adds r1, r5, #0
	bl sub_8016F04
	movs r2, #0
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08080E9A
	movs r2, #1
_08080E9A:
	lsls r0, r4, #3
	ldr r1, _08080F8C @ =0x0200319C
	adds r0, r0, r1
	ldr r3, _08080F90 @ =0x0200323E
	adds r3, r6, r3
	adds r1, r5, #0
	bl sub_8016AD0
	movs r0, #2
	add r8, r0
	adds r6, #0x80
	adds r4, #1
	cmp r4, #4
	bgt _08080EC2
	ldr r0, [r7, #0xc]
	adds r0, #0x1e
	add r0, r8
	ldrh r5, [r0]
	cmp r5, #0
	bne _08080E4A
_08080EC2:
	ldr r7, _08080F94 @ =gStatScreenSt
	ldr r0, [r7, #0xc]
	bl GetUnitEquippedWeaponSlot
	adds r4, r0, #0
	movs r5, #0
	cmp r4, #0
	blt _08080EFC
	lsls r4, r4, #1
	adds r0, r4, #1
	lsls r0, r0, #6
	ldr r1, _08080F98 @ =0x0200325C
	adds r0, r0, r1
	movs r1, #0
	movs r2, #0x1f
	bl PutSpecialChar
	adds r0, r4, #2
	lsls r0, r0, #6
	ldr r1, _08080F9C @ =0x02003C3E
	adds r0, r0, r1
	ldr r1, _08080FA0 @ =gUnk_08403908
	ldr r2, _08080FA4 @ =0x00007060
	bl TmApplyTsa_thm
	ldr r0, [r7, #0xc]
	adds r0, #0x1e
	adds r0, r0, r4
	ldrh r5, [r0]
_08080EFC:
	ldr r6, _08080FA8 @ =0x0200358C
	ldr r4, _08080FAC @ =gBattleActor
	adds r0, r4, #0
	adds r0, #0x5a
	movs r1, #0
	ldrsh r2, [r0, r1]
	adds r0, r6, #0
	movs r1, #2
	bl PutNumberOrBlank
	adds r0, r6, #0
	adds r0, #0x80
	adds r1, r4, #0
	adds r1, #0x60
	movs r3, #0
	ldrsh r2, [r1, r3]
	movs r1, #2
	bl PutNumberOrBlank
	adds r0, r6, #0
	adds r0, #0xe
	adds r1, r4, #0
	adds r1, #0x66
	movs r3, #0
	ldrsh r2, [r1, r3]
	movs r1, #2
	bl PutNumberOrBlank
	adds r0, r6, #0
	adds r0, #0x8e
	adds r1, r4, #0
	adds r1, #0x62
	movs r3, #0
	ldrsh r2, [r1, r3]
	movs r1, #2
	bl PutNumberOrBlank
	adds r4, r7, #0
	adds r4, #0xb8
	adds r0, r5, #0
	bl GetItemDisplayRangeString
	adds r3, r0, #0
	adds r0, r4, #0
	movs r1, #0x10
	movs r2, #2
	bl Text_InsertDrawString
	movs r4, #0
	ldr r0, _08080FB0 @ =0x00005278
	adds r5, r0, #0
	adds r2, r6, #0
	subs r2, #0x8c
	ldr r1, _08080FB4 @ =0x00005270
	adds r3, r1, #0
	adds r1, r6, #0
	subs r1, #0x4c
_08080F6E:
	adds r0, r4, r5
	strh r0, [r2]
	adds r0, r4, r3
	strh r0, [r1]
	adds r2, #2
	adds r1, #2
	adds r4, #1
	cmp r4, #7
	ble _08080F6E
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08080F8C: .4byte 0x0200319C
_08080F90: .4byte 0x0200323E
_08080F94: .4byte gStatScreenSt
_08080F98: .4byte 0x0200325C
_08080F9C: .4byte 0x02003C3E
_08080FA0: .4byte gUnk_08403908
_08080FA4: .4byte 0x00007060
_08080FA8: .4byte 0x0200358C
_08080FAC: .4byte gBattleActor
_08080FB0: .4byte 0x00005278
_08080FB4: .4byte 0x00005270

	thumb_func_start sub_8080FB8
sub_8080FB8: @ 0x08080FB8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x14
	movs r0, #6
	str r0, [sp, #8]
	ldr r4, _080810A0 @ =gStatScreenSt
	ldr r0, [r4, #0xc]
	bl GetUnitTotalSupportLevel
	movs r1, #0
	str r1, [sp, #0xc]
	cmp r0, #5
	bne _08080FDC
	movs r0, #4
	str r0, [sp, #0xc]
_08080FDC:
	ldr r0, [r4, #0xc]
	bl GetUnitSupporterCount
	mov sl, r0
	movs r1, #0
	mov sb, r1
	movs r0, #0
	cmp r0, sl
	bge _08081090
	movs r1, #0x80
	lsls r1, r1, #1
	ldr r0, _080810A0 @ =gStatScreenSt
	adds r1, r0, r1
	str r1, [sp, #0x10]
_08080FF8:
	ldr r1, _080810A0 @ =gStatScreenSt
	ldr r0, [r1, #0xc]
	mov r1, sb
	bl GetUnitSupportLevel
	adds r7, r0, #0
	cmp r7, #0
	beq _08081088
	ldr r1, _080810A0 @ =gStatScreenSt
	ldr r0, [r1, #0xc]
	mov r1, sb
	bl GetUnitSupportPid
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	ldr r0, [sp, #8]
	lsls r6, r0, #6
	ldr r1, _080810A4 @ =0x02003244
	mov r8, r1
	adds r5, r6, r1
	adds r0, r4, #0
	bl sub_8026FC4
	adds r1, r0, #0
	adds r0, r5, #0
	movs r2, #0xa0
	lsls r2, r2, #7
	bl PutIcon
	adds r0, r4, #0
	bl GetCharacterData
	ldrh r0, [r0]
	bl DecodeMsg
	mov r1, r8
	adds r1, #6
	adds r1, r6, r1
	movs r2, #0
	str r2, [sp]
	str r0, [sp, #4]
	ldr r0, [sp, #0x10]
	ldr r2, [sp, #0xc]
	movs r3, #0
	bl PutDrawText
	movs r5, #2
	cmp r7, #3
	bne _0808105E
	movs r5, #4
_0808105E:
	ldr r0, [sp, #0xc]
	cmp r0, #4
	bne _08081066
	movs r5, #4
_08081066:
	mov r4, r8
	adds r4, #0x12
	adds r4, r6, r4
	adds r0, r7, #0
	bl GetSupportLevelUiChar
	adds r2, r0, #0
	adds r0, r4, #0
	adds r1, r5, #0
	bl PutSpecialChar
	ldr r1, [sp, #8]
	adds r1, #2
	str r1, [sp, #8]
	ldr r0, [sp, #0x10]
	adds r0, #8
	str r0, [sp, #0x10]
_08081088:
	movs r1, #1
	add sb, r1
	cmp sb, sl
	blt _08080FF8
_08081090:
	add sp, #0x14
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080810A0: .4byte gStatScreenSt
_080810A4: .4byte 0x02003244

	thumb_func_start sub_80810A8
sub_80810A8: @ 0x080810A8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x14
	mov sb, r0
	adds r6, r1, #0
	mov sl, r2
	adds r1, r3, #0
	ldr r0, _0808115C @ =gStatScreenSt
	ldr r0, [r0, #0xc]
	adds r0, #0x28
	adds r0, r0, r1
	ldrb r5, [r0]
	lsls r4, r2, #5
	adds r0, r4, r6
	lsls r0, r0, #1
	ldr r2, _08081160 @ =gUiTmScratchA
	mov r8, r2
	add r0, r8
	adds r1, #0x70
	movs r2, #0xa0
	lsls r2, r2, #7
	bl PutIcon
	movs r7, #2
	cmp r5, #0xfa
	ble _080810E4
	movs r7, #4
_080810E4:
	adds r4, #5
	adds r4, r4, r6
	lsls r4, r4, #1
	add r4, r8
	adds r0, r5, #0
	bl sub_8016E38
	adds r2, r0, #0
	adds r0, r4, #0
	adds r1, r7, #0
	bl PutSpecialChar
	add r2, sp, #0x10
	adds r0, r5, #0
	add r1, sp, #0xc
	bl sub_8016E8C
	mov r0, sb
	lsls r5, r0, #1
	add r5, sb
	lsls r5, r5, #1
	ldr r2, _08081164 @ =0x00000401
	adds r5, r5, r2
	mov r4, sl
	adds r4, #1
	lsls r4, r4, #5
	adds r4, #3
	adds r4, r4, r6
	lsls r4, r4, #1
	ldr r0, _08081168 @ =gUiTmScratchC
	adds r4, r4, r0
	movs r6, #0xc0
	lsls r6, r6, #7
	movs r0, #0x22
	str r0, [sp]
	ldr r1, [sp, #0xc]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #1
	ldr r1, [sp, #0x10]
	subs r1, #1
	bl __divsi3
	str r0, [sp, #4]
	movs r0, #0
	str r0, [sp, #8]
	adds r0, r5, #0
	movs r1, #5
	adds r2, r4, #0
	adds r3, r6, #0
	bl PutDrawUiGauge
	add sp, #0x14
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0808115C: .4byte gStatScreenSt
_08081160: .4byte gUiTmScratchA
_08081164: .4byte 0x00000401
_08081168: .4byte gUiTmScratchC

	thumb_func_start sub_808116C
sub_808116C: @ 0x0808116C
	push {r4, lr}
	ldr r0, _080811CC @ =gUnk_084035D0
	ldr r4, _080811D0 @ =gBuf
	adds r1, r4, #0
	bl Decompress
	ldr r0, _080811D4 @ =gUiTmScratchB
	movs r2, #0x80
	lsls r2, r2, #5
	adds r1, r4, #0
	bl TmApplyTsa_thm
	ldr r0, _080811D8 @ =gStatScreenSt
	ldr r0, [r0, #0xc]
	bl UnitHasMagicRank
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080811E0
	ldr r0, _080811DC @ =gUnk_0841CD28
	bl PutStatScreenText
	movs r0, #0
	movs r1, #1
	movs r2, #1
	movs r3, #5
	bl sub_80810A8
	movs r0, #1
	movs r1, #1
	movs r2, #3
	movs r3, #6
	bl sub_80810A8
	movs r0, #2
	movs r1, #9
	movs r2, #1
	movs r3, #7
	bl sub_80810A8
	movs r0, #3
	movs r1, #9
	movs r2, #3
	movs r3, #4
	bl sub_80810A8
	b _08081216
	.align 2, 0
_080811CC: .4byte gUnk_084035D0
_080811D0: .4byte gBuf
_080811D4: .4byte gUiTmScratchB
_080811D8: .4byte gStatScreenSt
_080811DC: .4byte gUnk_0841CD28
_080811E0:
	ldr r0, _08081220 @ =gUnk_0841CCD8
	bl PutStatScreenText
	movs r0, #0
	movs r1, #1
	movs r2, #1
	movs r3, #0
	bl sub_80810A8
	movs r0, #1
	movs r1, #1
	movs r2, #3
	movs r3, #1
	bl sub_80810A8
	movs r0, #2
	movs r1, #9
	movs r2, #1
	movs r3, #2
	bl sub_80810A8
	movs r0, #3
	movs r1, #9
	movs r2, #3
	movs r3, #3
	bl sub_80810A8
_08081216:
	bl sub_8080FB8
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08081220: .4byte gUnk_0841CCD8

	thumb_func_start sub_8081224
sub_8081224: @ 0x08081224
	push {r4, r5, lr}
	sub sp, #0x18
	adds r4, r0, #0
	mov r1, sp
	ldr r0, _08081264 @ =gUnk_0841CD90
	ldm r0!, {r2, r3, r5}
	stm r1!, {r2, r3, r5}
	ldr r0, [r0]
	str r0, [r1]
	movs r5, #0
	str r5, [sp, #0x10]
	add r0, sp, #0x10
	ldr r1, _08081268 @ =gUiTmScratchA
	ldr r2, _0808126C @ =0x01000140
	bl CpuFastSet
	str r5, [sp, #0x14]
	add r0, sp, #0x14
	ldr r1, _08081270 @ =gUiTmScratchC
	ldr r2, _08081274 @ =0x01000120
	bl CpuFastSet
	lsls r4, r4, #2
	mov r1, sp
	adds r0, r1, r4
	ldr r0, [r0]
	bl _call_via_r0

	thumb_func_start sub_808125C
sub_808125C: @ 0x0808125C
	add sp, #0x18
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08081264: .4byte gUnk_0841CD90
_08081268: .4byte gUiTmScratchA
_0808126C: .4byte 0x01000140
_08081270: .4byte gUiTmScratchC
_08081274: .4byte 0x01000120

	thumb_func_start sub_8081278
sub_8081278: @ 0x08081278
	push {r4, r5, r6, r7, lr}
	adds r7, r1, #0
	ldrb r0, [r0, #0xb]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	movs r6, #0xc0
	ands r6, r0
	adds r4, r0, #0
_08081288:
	adds r4, r4, r7
	movs r0, #0x3f
	ands r4, r0
	adds r0, r6, r4
	bl GetUnit
	adds r3, r0, #0
	cmp r3, #0
	beq _08081288
	ldr r5, [r3]
	cmp r5, #0
	beq _08081288
	ldr r0, _08081330 @ =gStatScreenInfo
	ldrh r2, [r0, #2]
	movs r0, #1
	ands r0, r2
	cmp r0, #0
	beq _080812B6
	ldr r0, [r3, #0xc]
	movs r1, #4
	ands r0, r1
	cmp r0, #0
	bne _08081288
_080812B6:
	movs r0, #2
	ands r0, r2
	cmp r0, #0
	beq _080812C8
	ldr r0, [r3, #0xc]
	movs r1, #8
	ands r0, r1
	cmp r0, #0
	bne _08081288
_080812C8:
	movs r0, #4
	ands r0, r2
	cmp r0, #0
	beq _080812DC
	ldr r0, [r3, #0xc]
	movs r1, #0x80
	lsls r1, r1, #2
	ands r0, r1
	cmp r0, #0
	bne _08081288
_080812DC:
	movs r0, #8
	ands r0, r2
	cmp r0, #0
	beq _080812EE
	ldr r0, [r3, #0xc]
	movs r1, #0x80
	ands r0, r1
	cmp r0, #0
	bne _08081288
_080812EE:
	movs r0, #0x10
	ands r0, r2
	cmp r0, #0
	beq _08081302
	ldr r0, [r3, #0xc]
	movs r1, #0x80
	lsls r1, r1, #9
	ands r0, r1
	cmp r0, #0
	bne _08081288
_08081302:
	movs r0, #0x20
	ands r0, r2
	ldr r2, [r3, #4]
	cmp r0, #0
	beq _0808131C
	ldr r0, [r5, #0x28]
	ldr r1, [r2, #0x28]
	orrs r0, r1
	movs r1, #0x80
	lsls r1, r1, #2
	ands r0, r1
	cmp r0, #0
	bne _08081288
_0808131C:
	ldrb r2, [r2, #4]
	cmp r2, #0x49
	beq _08081288
	ldrb r5, [r5, #4]
	cmp r5, #0x9e
	beq _08081288
	adds r0, r3, #0
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_08081330: .4byte gStatScreenInfo

	thumb_func_start sub_8081334
sub_8081334: @ 0x08081334
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	ldr r0, _080813B4 @ =gBg0Tm + 0x98
	movs r1, #0x12
	movs r2, #0x12
	movs r3, #0
	bl TmFillRect_thm
	ldr r0, _080813B8 @ =gBg1Tm + 0x98
	movs r1, #0x12
	movs r2, #0x12
	movs r3, #0
	bl TmFillRect_thm
	ldr r0, _080813BC @ =gBg2Tm + 0x98
	movs r1, #0x12
	movs r2, #0x12
	movs r3, #0
	bl TmFillRect_thm
	ldr r6, _080813C0 @ =gUnk_08D8A358
	adds r4, r7, #0
	adds r4, #0x4c
	movs r1, #0
	ldrsh r0, [r4, r1]
	adds r0, r0, r6
	movs r5, #0
	ldrsb r5, [r0, r5]
	cmp r5, #0x7f
	bne _0808138C
	adds r0, r7, #0
	adds r0, #0x4a
	movs r2, #0
	ldrsh r0, [r0, r2]
	bl sub_8081224
	ldrh r0, [r4]
	adds r0, #1
	strh r0, [r4]
	movs r1, #0
	ldrsh r0, [r4, r1]
	adds r0, r0, r6
	movs r5, #0
	ldrsb r5, [r0, r5]
_0808138C:
	adds r1, r7, #0
	adds r1, #0x52
	movs r0, #0x20
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	beq _0808139C
	rsbs r5, r5, #0
_0808139C:
	adds r2, r5, #0
	cmp r5, #0
	bge _080813A4
	rsbs r2, r5, #0
_080813A4:
	movs r0, #0x12
	subs r6, r0, r2
	cmp r5, #0
	bge _080813C4
	movs r4, #0
	rsbs r5, r5, #0
	b _080813C8
	.align 2, 0
_080813B4: .4byte gBg0Tm + 0x98
_080813B8: .4byte gBg1Tm + 0x98
_080813BC: .4byte gBg2Tm + 0x98
_080813C0: .4byte gUnk_08D8A358
_080813C4:
	adds r4, r5, #0
	movs r5, #0
_080813C8:
	lsls r5, r5, #1
	ldr r0, _08081430 @ =gUiTmScratchA
	adds r0, r5, r0
	lsls r4, r4, #1
	ldr r1, _08081434 @ =gBg0Tm + 0x98
	adds r1, r4, r1
	adds r2, r6, #0
	movs r3, #0x12
	bl TmCopyRect_thm
	ldr r0, _08081438 @ =gUiTmScratchB
	adds r0, r5, r0
	ldr r1, _0808143C @ =gBg1Tm + 0x98
	adds r1, r4, r1
	adds r2, r6, #0
	movs r3, #0x12
	bl TmCopyRect_thm
	ldr r0, _08081440 @ =gUiTmScratchC
	adds r5, r5, r0
	ldr r0, _08081444 @ =gBg2Tm + 0x98
	adds r4, r4, r0
	adds r0, r5, #0
	adds r1, r4, #0
	adds r2, r6, #0
	movs r3, #0x12
	bl TmCopyRect_thm
	movs r0, #7
	bl EnableBgSync
	adds r0, r7, #0
	adds r0, #0x4c
	ldrh r1, [r0]
	adds r1, #1
	strh r1, [r0]
	ldr r1, _08081448 @ =gUnk_08D8A358
	movs r2, #0
	ldrsh r0, [r0, r2]
	adds r0, r0, r1
	movs r5, #0
	ldrsb r5, [r0, r5]
	movs r0, #0x80
	rsbs r0, r0, #0
	cmp r5, r0
	bne _0808142A
	adds r0, r7, #0
	bl Proc_Break
_0808142A:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08081430: .4byte gUiTmScratchA
_08081434: .4byte gBg0Tm + 0x98
_08081438: .4byte gUiTmScratchB
_0808143C: .4byte gBg1Tm + 0x98
_08081440: .4byte gUiTmScratchC
_08081444: .4byte gBg2Tm + 0x98
_08081448: .4byte gUnk_08D8A358

	thumb_func_start sub_808144C
sub_808144C: @ 0x0808144C
	ldr r1, _08081454 @ =gStatScreenSt
	movs r0, #0
	strb r0, [r1, #8]
	bx lr
	.align 2, 0
_08081454: .4byte gStatScreenSt

	thumb_func_start sub_8081458
sub_8081458: @ 0x08081458
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	mov r8, r1
	adds r6, r2, #0
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	ldr r7, _080814B4 @ =gUnk_08D8A368
	adds r0, r7, #0
	bl Proc_Find
	adds r4, r0, #0
	cmp r4, #0
	bne _080814A8
	ldr r0, _080814B8 @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08081486
	ldr r0, _080814BC @ =0x0000038F
	bl m4aSongNumStart
_08081486:
	adds r0, r7, #0
	adds r1, r6, #0
	bl Proc_StartBlocking
	adds r1, r0, #0
	adds r0, #0x4c
	strh r4, [r0]
	subs r0, #2
	mov r2, r8
	strh r2, [r0]
	adds r0, #8
	strh r5, [r0]
	ldr r0, _080814C0 @ =gStatScreenSt
	strh r5, [r0, #2]
	str r4, [r0, #0x14]
	movs r1, #1
	strb r1, [r0, #8]
_080814A8:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080814B4: .4byte gUnk_08D8A368
_080814B8: .4byte gPlaySt
_080814BC: .4byte 0x0000038F
_080814C0: .4byte gStatScreenSt

	thumb_func_start sub_80814C4
sub_80814C4: @ 0x080814C4
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	ldr r1, _08081538 @ =gStatScreenSt
	movs r6, #0
	movs r4, #1
	movs r0, #1
	strb r0, [r1, #8]
	adds r1, r5, #0
	adds r1, #0x4c
	movs r0, #4
	strh r0, [r1]
	ldr r3, _0808153C @ =gDispIo
	movs r2, #4
	rsbs r2, r2, #0
	adds r0, r2, #0
	ldrb r1, [r3, #0xc]
	ands r0, r1
	orrs r0, r4
	strb r0, [r3, #0xc]
	movs r0, #3
	ldrb r1, [r3, #0x10]
	orrs r0, r1
	strb r0, [r3, #0x10]
	adds r0, r2, #0
	ldrb r1, [r3, #0x14]
	ands r0, r1
	movs r1, #2
	orrs r0, r1
	strb r0, [r3, #0x14]
	ldrb r0, [r3, #0x18]
	ands r2, r0
	strb r2, [r3, #0x18]
	ldr r0, _08081540 @ =0x0000FFE0
	ldrh r1, [r3, #0x3c]
	ands r0, r1
	movs r1, #8
	orrs r0, r1
	ldr r1, _08081544 @ =0x0000E0FF
	ands r0, r1
	movs r2, #0xb8
	lsls r2, r2, #5
	adds r1, r2, #0
	orrs r0, r1
	strh r0, [r3, #0x3c]
	adds r3, #0x3d
	movs r0, #0x21
	rsbs r0, r0, #0
	ldrb r1, [r3]
	ands r0, r1
	strb r0, [r3]
	ldr r0, [r5, #0x38]
	cmp r0, #0
	ble _08081548
	str r6, [r5, #0x3c]
	movs r0, #0x3c
	rsbs r0, r0, #0
	b _0808154C
	.align 2, 0
_08081538: .4byte gStatScreenSt
_0808153C: .4byte gDispIo
_08081540: .4byte 0x0000FFE0
_08081544: .4byte 0x0000E0FF
_08081548:
	str r6, [r5, #0x3c]
	movs r0, #0x3c
_0808154C:
	str r0, [r5, #0x40]
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	thumb_func_start sub_8081554
sub_8081554: @ 0x08081554
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r6, r0, #0
	ldr r3, _080815CC @ =gDispIo
	adds r2, r3, #0
	adds r2, #0x3c
	movs r0, #0x3f
	ldrb r1, [r2]
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r2]
	adds r5, r6, #0
	adds r5, #0x4c
	ldrh r1, [r5]
	adds r0, r3, #0
	adds r0, #0x44
	movs r2, #0
	strb r1, [r0]
	movs r0, #0x10
	subs r0, r0, r1
	adds r1, r3, #0
	adds r1, #0x45
	strb r0, [r1]
	adds r0, r3, #0
	adds r0, #0x46
	strb r2, [r0]
	ldr r4, _080815D0 @ =gStatScreenSt
	ldr r0, [r4, #0x10]
	movs r1, #6
	ldrsh r2, [r4, r1]
	adds r2, #0x8a
	movs r1, #0x50
	bl sub_806E2E8
	ldr r1, [r6, #0x3c]
	ldr r2, [r6, #0x40]
	movs r0, #0
	ldrsh r3, [r5, r0]
	movs r0, #0x10
	str r0, [sp]
	movs r0, #2
	bl Interpolate
	strh r0, [r4, #6]
	ldrh r0, [r5]
	adds r0, #3
	strh r0, [r5]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x10
	ble _080815C2
	adds r0, r6, #0
	bl Proc_Break
_080815C2:
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080815CC: .4byte gDispIo
_080815D0: .4byte gStatScreenSt

	thumb_func_start sub_80815D4
sub_80815D4: @ 0x080815D4
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r1, r4, #0
	adds r1, #0x4c
	movs r5, #0
	movs r0, #1
	strh r0, [r1]
	ldr r3, _08081630 @ =gDispIo
	movs r2, #4
	rsbs r2, r2, #0
	adds r0, r2, #0
	ldrb r1, [r3, #0xc]
	ands r0, r1
	movs r1, #1
	orrs r0, r1
	strb r0, [r3, #0xc]
	movs r0, #3
	ldrb r1, [r3, #0x10]
	orrs r0, r1
	strb r0, [r3, #0x10]
	adds r0, r2, #0
	ldrb r1, [r3, #0x14]
	ands r0, r1
	movs r1, #2
	orrs r0, r1
	strb r0, [r3, #0x14]
	ldrb r0, [r3, #0x18]
	ands r2, r0
	strb r2, [r3, #0x18]
	ldr r0, _08081634 @ =0x0000FFE0
	ldrh r1, [r3, #0x3c]
	ands r0, r1
	movs r1, #8
	orrs r0, r1
	ldr r1, _08081638 @ =0x0000E0FF
	ands r0, r1
	movs r2, #0xb8
	lsls r2, r2, #5
	adds r1, r2, #0
	orrs r0, r1
	strh r0, [r3, #0x3c]
	ldr r0, [r4, #0x38]
	cmp r0, #0
	ble _0808163C
	movs r0, #0x3c
	b _08081640
	.align 2, 0
_08081630: .4byte gDispIo
_08081634: .4byte 0x0000FFE0
_08081638: .4byte 0x0000E0FF
_0808163C:
	movs r0, #0x3c
	rsbs r0, r0, #0
_08081640:
	str r0, [r4, #0x3c]
	str r5, [r4, #0x40]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_808164C
sub_808164C: @ 0x0808164C
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r6, r0, #0
	ldr r4, _080816C0 @ =gDispIo
	adds r2, r4, #0
	adds r2, #0x3c
	movs r0, #0x3f
	ldrb r1, [r2]
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r2]
	adds r5, r6, #0
	adds r5, #0x4c
	ldrh r2, [r5]
	movs r0, #0x10
	subs r0, r0, r2
	adds r1, r4, #0
	adds r1, #0x44
	movs r3, #0
	strb r0, [r1]
	adds r0, r4, #0
	adds r0, #0x45
	strb r2, [r0]
	adds r0, #1
	strb r3, [r0]
	ldr r4, _080816C4 @ =gStatScreenSt
	ldr r0, [r4, #0x10]
	movs r1, #6
	ldrsh r2, [r4, r1]
	adds r2, #0x8a
	movs r1, #0x50
	bl sub_806E2E8
	ldr r1, [r6, #0x3c]
	ldr r2, [r6, #0x40]
	movs r0, #0
	ldrsh r3, [r5, r0]
	movs r0, #0x10
	str r0, [sp]
	movs r0, #5
	bl Interpolate
	strh r0, [r4, #6]
	ldrh r0, [r5]
	adds r0, #3
	strh r0, [r5]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0xf
	ble _080816B8
	adds r0, r6, #0
	bl Proc_Break
_080816B8:
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080816C0: .4byte gDispIo
_080816C4: .4byte gStatScreenSt

	thumb_func_start sub_80816C8
sub_80816C8: @ 0x080816C8
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x4a
	movs r1, #0
	ldrsh r0, [r0, r1]
	bl GetUnit
	ldr r1, _080816F0 @ =gStatScreenSt
	str r0, [r1, #0xc]
	ldr r0, _080816F4 @ =gUnk_08D8A530
	bl Proc_Find
	bl sub_8081EF8
	adds r0, r4, #0
	bl Proc_Break
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080816F0: .4byte gStatScreenSt
_080816F4: .4byte gUnk_08D8A530

	thumb_func_start sub_80816F8
sub_80816F8: @ 0x080816F8
	push {r4, r5, lr}
	ldr r4, _0808177C @ =gStatScreenSt
	ldr r0, [r4, #0x10]
	cmp r0, #0
	beq _0808170A
	movs r1, #0x50
	movs r2, #0x8a
	bl sub_806E2E8
_0808170A:
	ldr r3, _08081780 @ =gDispIo
	movs r1, #4
	rsbs r1, r1, #0
	adds r0, r1, #0
	ldrb r2, [r3, #0xc]
	ands r0, r2
	movs r2, #1
	orrs r0, r2
	strb r0, [r3, #0xc]
	movs r2, #3
	ldrb r0, [r3, #0x10]
	orrs r0, r2
	strb r0, [r3, #0x10]
	ldrb r5, [r3, #0x14]
	ands r1, r5
	movs r0, #2
	orrs r1, r0
	strb r1, [r3, #0x14]
	ldrb r0, [r3, #0x18]
	orrs r2, r0
	strb r2, [r3, #0x18]
	adds r2, r3, #0
	adds r2, #0x3c
	ldr r0, _08081784 @ =0x0000FFE0
	ldrh r1, [r3, #0x3c]
	ands r0, r1
	movs r1, #4
	orrs r0, r1
	ldr r1, _08081788 @ =0x0000E0FF
	ands r0, r1
	movs r5, #0x80
	lsls r5, r5, #4
	adds r1, r5, #0
	orrs r0, r1
	strh r0, [r3, #0x3c]
	movs r0, #0x3f
	ldrb r1, [r2]
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r2]
	adds r1, r3, #0
	adds r1, #0x44
	movs r2, #0
	movs r0, #6
	strb r0, [r1]
	adds r1, #1
	movs r0, #8
	strb r0, [r1]
	adds r0, r3, #0
	adds r0, #0x46
	strb r2, [r0]
	strb r2, [r4, #8]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0808177C: .4byte gStatScreenSt
_08081780: .4byte gDispIo
_08081784: .4byte 0x0000FFE0
_08081788: .4byte 0x0000E0FF

	thumb_func_start sub_808178C
sub_808178C: @ 0x0808178C
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r1, r2, #0
	ldr r0, _080817C0 @ =gUnk_08D8A380
	bl Proc_StartBlocking
	movs r1, #0xb
	ldrsb r1, [r4, r1]
	adds r2, r0, #0
	adds r2, #0x4a
	strh r1, [r2]
	str r5, [r0, #0x38]
	ldr r0, _080817C4 @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080817B8
	movs r0, #0xc8
	bl m4aSongNumStart
_080817B8:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080817C0: .4byte gUnk_08D8A380
_080817C4: .4byte gPlaySt

	thumb_func_start sub_80817C8
sub_80817C8: @ 0x080817C8
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	ldr r0, _08081820 @ =gStatScreenSt
	movs r2, #4
	ldrsh r1, [r0, r2]
	adds r1, #0x6d
	movs r3, #6
	ldrsh r2, [r0, r3]
	adds r2, #5
	ldr r3, _08081824 @ =gUnk_08D8A3C0
	ldr r4, _08081828 @ =gUnk_08D8A3D4
	lsls r0, r5, #1
	adds r0, r0, r4
	ldrh r0, [r0]
	movs r4, #0xf9
	lsls r4, r4, #6
	adds r0, r0, r4
	str r0, [sp]
	movs r0, #4
	bl PutSprite
	bl GetGameTime
	lsrs r0, r0, #2
	movs r1, #0xf
	ands r0, r1
	lsls r5, r5, #6
	lsls r0, r0, #1
	ldr r1, _0808182C @ =gUnk_08404024
	adds r0, r0, r1
	adds r5, r5, r0
	ldr r1, _08081830 @ =gPal + 0x268
	adds r0, r5, #0
	movs r2, #0xb
	bl CpuSet
	bl EnablePalSync
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08081820: .4byte gStatScreenSt
_08081824: .4byte gUnk_08D8A3C0
_08081828: .4byte gUnk_08D8A3D4
_0808182C: .4byte gUnk_08404024
_08081830: .4byte gPal + 0x268

	thumb_func_start sub_8081834
sub_8081834: @ 0x08081834
	push {r4, r5, r6, lr}
	mov r6, sl
	mov r5, sb
	mov r4, r8
	push {r4, r5, r6}
	sub sp, #4
	mov sb, r0
	ldr r4, _080818C4 @ =gSinLut
	movs r0, #0x80
	adds r0, r0, r4
	mov sl, r0
	movs r1, #0
	ldrsh r0, [r0, r1]
	lsls r0, r0, #4
	movs r2, #0x80
	lsls r2, r2, #1
	mov r8, r2
	mov r1, r8
	bl Div
	adds r6, r0, #0
	lsls r6, r6, #0x10
	asrs r6, r6, #0x10
	movs r1, #0
	ldrsh r0, [r4, r1]
	rsbs r0, r0, #0
	lsls r0, r0, #4
	mov r1, r8
	bl Div
	adds r5, r0, #0
	lsls r5, r5, #0x10
	asrs r5, r5, #0x10
	movs r2, #0
	ldrsh r0, [r4, r2]
	lsls r0, r0, #4
	mov r1, r8
	bl Div
	adds r4, r0, #0
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	mov r1, sl
	movs r2, #0
	ldrsh r0, [r1, r2]
	lsls r0, r0, #4
	mov r1, r8
	bl Div
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	str r0, [sp]
	movs r0, #8
	adds r1, r6, #0
	adds r2, r5, #0
	adds r3, r4, #0
	bl SetObjAffine
	ldr r0, _080818C8 @ =gStatScreenSt
	ldrb r0, [r0]
	movs r1, #0x36
	add sb, r1
	mov r2, sb
	strb r0, [r2]
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080818C4: .4byte gSinLut
_080818C8: .4byte gStatScreenSt

	thumb_func_start sub_80818CC
sub_80818CC: @ 0x080818CC
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r4, #0
	adds r5, #0x36
	ldrb r0, [r5]
	bl sub_80817C8
	ldr r1, _080818F0 @ =gStatScreenSt
	ldrh r0, [r1, #2]
	cmp r0, #0
	beq _080818F4
	movs r0, #5
	strh r0, [r4, #0x38]
	adds r0, r4, #0
	bl Proc_Break
	b _080818F8
	.align 2, 0
_080818F0: .4byte gStatScreenSt
_080818F4:
	ldrb r0, [r1]
	strb r0, [r5]
_080818F8:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_8081900
sub_8081900: @ 0x08081900
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	adds r7, r0, #0
	ldr r5, _080819C4 @ =gSinLut
	movs r0, #0x80
	adds r0, r0, r5
	mov sl, r0
	movs r1, #0
	ldrsh r0, [r0, r1]
	lsls r0, r0, #4
	movs r2, #0x80
	lsls r2, r2, #1
	mov sb, r2
	mov r1, sb
	bl Div
	mov r8, r0
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	mov r8, r0
	movs r1, #0
	ldrsh r4, [r5, r1]
	rsbs r4, r4, #0
	lsls r4, r4, #4
	movs r2, #0x38
	ldrsh r0, [r7, r2]
	lsls r0, r0, #8
	movs r1, #6
	bl __divsi3
	adds r1, r0, #0
	adds r0, r4, #0
	bl Div
	adds r6, r0, #0
	lsls r6, r6, #0x10
	asrs r6, r6, #0x10
	movs r1, #0
	ldrsh r0, [r5, r1]
	lsls r0, r0, #4
	mov r1, sb
	bl Div
	adds r5, r0, #0
	lsls r5, r5, #0x10
	asrs r5, r5, #0x10
	mov r2, sl
	movs r0, #0
	ldrsh r4, [r2, r0]
	lsls r4, r4, #4
	movs r1, #0x38
	ldrsh r0, [r7, r1]
	lsls r0, r0, #8
	movs r1, #6
	bl __divsi3
	adds r1, r0, #0
	adds r0, r4, #0
	bl Div
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	str r0, [sp]
	movs r0, #8
	mov r1, r8
	adds r2, r6, #0
	adds r3, r5, #0
	bl SetObjAffine
	adds r0, r7, #0
	adds r0, #0x36
	ldrb r0, [r0]
	bl sub_80817C8
	ldrh r0, [r7, #0x38]
	subs r0, #1
	strh r0, [r7, #0x38]
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _080819B2
	movs r0, #1
	strh r0, [r7, #0x38]
	adds r0, r7, #0
	bl Proc_Break
_080819B2:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080819C4: .4byte gSinLut

	thumb_func_start sub_80819C8
sub_80819C8: @ 0x080819C8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	adds r7, r0, #0
	ldr r5, _08081A90 @ =gSinLut
	movs r0, #0x80
	adds r0, r0, r5
	mov sl, r0
	movs r1, #0
	ldrsh r0, [r0, r1]
	lsls r0, r0, #4
	movs r2, #0x80
	lsls r2, r2, #1
	mov sb, r2
	mov r1, sb
	bl Div
	mov r8, r0
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	mov r8, r0
	movs r1, #0
	ldrsh r4, [r5, r1]
	rsbs r4, r4, #0
	lsls r4, r4, #4
	movs r2, #0x38
	ldrsh r0, [r7, r2]
	lsls r0, r0, #8
	movs r1, #6
	bl __divsi3
	adds r1, r0, #0
	adds r0, r4, #0
	bl Div
	adds r6, r0, #0
	lsls r6, r6, #0x10
	asrs r6, r6, #0x10
	movs r1, #0
	ldrsh r0, [r5, r1]
	lsls r0, r0, #4
	mov r1, sb
	bl Div
	adds r5, r0, #0
	lsls r5, r5, #0x10
	asrs r5, r5, #0x10
	mov r2, sl
	movs r0, #0
	ldrsh r4, [r2, r0]
	lsls r4, r4, #4
	movs r1, #0x38
	ldrsh r0, [r7, r1]
	lsls r0, r0, #8
	movs r1, #6
	bl __divsi3
	adds r1, r0, #0
	adds r0, r4, #0
	bl Div
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	str r0, [sp]
	movs r0, #8
	mov r1, r8
	adds r2, r6, #0
	adds r3, r5, #0
	bl SetObjAffine
	ldr r4, _08081A94 @ =gStatScreenSt
	ldrb r0, [r4]
	bl sub_80817C8
	ldrh r0, [r7, #0x38]
	adds r0, #1
	strh r0, [r7, #0x38]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #6
	ble _08081A7E
	ldrb r0, [r4]
	adds r1, r7, #0
	adds r1, #0x36
	strb r0, [r1]
	adds r0, r7, #0
	bl Proc_Break
_08081A7E:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08081A90: .4byte gSinLut
_08081A94: .4byte gStatScreenSt

	thumb_func_start sub_8081A98
sub_8081A98: @ 0x08081A98
	movs r2, #0
	movs r1, #0x69
	strh r1, [r0, #0x2a]
	movs r1, #0xca
	strh r1, [r0, #0x2c]
	strh r2, [r0, #0x30]
	strh r2, [r0, #0x2e]
	movs r1, #4
	strh r1, [r0, #0x34]
	strh r1, [r0, #0x32]
	bx lr
	.align 2, 0

	thumb_func_start sub_8081AB0
sub_8081AB0: @ 0x08081AB0
	adds r1, r0, #0
	ldr r2, _08081AE0 @ =gStatScreenSt
	movs r0, #0x20
	ldrh r3, [r2, #2]
	ands r0, r3
	cmp r0, #0
	beq _08081AC6
	movs r0, #0x1f
	strh r0, [r1, #0x32]
	movs r0, #0x63
	strh r0, [r1, #0x2a]
_08081AC6:
	movs r0, #0x10
	ldrh r3, [r2, #2]
	ands r0, r3
	cmp r0, #0
	beq _08081AD8
	movs r0, #0x1f
	strh r0, [r1, #0x34]
	movs r0, #0xd0
	strh r0, [r1, #0x2c]
_08081AD8:
	movs r0, #0
	strh r0, [r2, #2]
	bx lr
	.align 2, 0
_08081AE0: .4byte gStatScreenSt

	thumb_func_start sub_8081AE4
sub_8081AE4: @ 0x08081AE4
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #4
	adds r7, r0, #0
	ldr r0, _08081BBC @ =0x00004640
	mov sb, r0
	ldrh r1, [r7, #0x32]
	ldrh r2, [r7, #0x2e]
	adds r0, r1, r2
	strh r0, [r7, #0x2e]
	ldrh r3, [r7, #0x30]
	ldrh r2, [r7, #0x34]
	adds r0, r3, r2
	strh r0, [r7, #0x30]
	lsls r0, r1, #0x10
	asrs r0, r0, #0x10
	cmp r0, #4
	ble _08081B10
	subs r0, r1, #1
	strh r0, [r7, #0x32]
_08081B10:
	ldrh r1, [r7, #0x34]
	movs r3, #0x34
	ldrsh r0, [r7, r3]
	cmp r0, #4
	ble _08081B1E
	subs r0, r1, #1
	strh r0, [r7, #0x34]
_08081B1E:
	bl GetGameTime
	movs r1, #3
	ands r1, r0
	cmp r1, #0
	bne _08081B46
	ldrh r1, [r7, #0x2a]
	movs r2, #0x2a
	ldrsh r0, [r7, r2]
	cmp r0, #0x68
	bgt _08081B38
	adds r0, r1, #1
	strh r0, [r7, #0x2a]
_08081B38:
	ldrh r1, [r7, #0x2c]
	movs r3, #0x2c
	ldrsh r0, [r7, r3]
	cmp r0, #0xca
	ble _08081B46
	subs r0, r1, #1
	strh r0, [r7, #0x2c]
_08081B46:
	ldr r6, _08081BC0 @ =gStatScreenSt
	movs r0, #4
	ldrsh r5, [r6, r0]
	movs r1, #0x2a
	ldrsh r0, [r7, r1]
	adds r5, r5, r0
	movs r2, #6
	ldrsh r4, [r6, r2]
	adds r4, #6
	ldr r3, _08081BC4 @ =Sprite_8x16
	mov r8, r3
	ldrh r1, [r7, #0x2e]
	lsrs r0, r1, #5
	movs r1, #6
	bl __umodsi3
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	adds r0, #0x4a
	add r0, sb
	str r0, [sp]
	movs r0, #0
	adds r1, r5, #0
	adds r2, r4, #0
	mov r3, r8
	bl PutSprite
	movs r2, #4
	ldrsh r5, [r6, r2]
	movs r3, #0x2c
	ldrsh r0, [r7, r3]
	adds r5, r5, r0
	movs r0, #6
	ldrsh r4, [r6, r0]
	adds r4, #6
	ldr r6, _08081BC8 @ =Sprite_8x16_HFlipped
	ldrh r7, [r7, #0x30]
	lsrs r0, r7, #5
	movs r1, #6
	bl __umodsi3
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	adds r0, #0x4a
	add r0, sb
	str r0, [sp]
	movs r0, #0
	adds r1, r5, #0
	adds r2, r4, #0
	adds r3, r6, #0
	bl PutSprite
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08081BBC: .4byte 0x00004640
_08081BC0: .4byte gStatScreenSt
_08081BC4: .4byte Sprite_8x16
_08081BC8: .4byte Sprite_8x16_HFlipped

	thumb_func_start sub_8081BCC
sub_8081BCC: @ 0x08081BCC
	push {r4, r5, r6, lr}
	sub sp, #4
	ldr r4, _08081C2C @ =gStatScreenSt
	movs r0, #4
	ldrsh r1, [r4, r0]
	adds r1, #0xe3
	movs r3, #6
	ldrsh r2, [r4, r3]
	adds r2, #0xc
	ldr r5, _08081C30 @ =Sprite_8x8
	ldrb r6, [r4, #1]
	ldr r3, _08081C34 @ =0x00004EA4
	adds r0, r6, r3
	str r0, [sp]
	movs r0, #2
	adds r3, r5, #0
	bl PutSprite
	movs r6, #4
	ldrsh r1, [r4, r6]
	adds r1, #0xdd
	movs r0, #6
	ldrsh r2, [r4, r0]
	adds r2, #0xc
	ldr r0, _08081C38 @ =0x00004E45
	str r0, [sp]
	movs r0, #2
	adds r3, r5, #0
	bl PutSprite
	movs r3, #4
	ldrsh r1, [r4, r3]
	adds r1, #0xd6
	movs r6, #6
	ldrsh r2, [r4, r6]
	adds r2, #0xc
	ldrb r4, [r4]
	ldr r3, _08081C3C @ =0x00004EA5
	adds r0, r4, r3
	str r0, [sp]
	movs r0, #2
	adds r3, r5, #0
	bl PutSprite
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08081C2C: .4byte gStatScreenSt
_08081C30: .4byte Sprite_8x8
_08081C34: .4byte 0x00004EA4
_08081C38: .4byte 0x00004E45
_08081C3C: .4byte 0x00004EA5

	thumb_func_start sub_8081C40
sub_8081C40: @ 0x08081C40
	push {r4, lr}
	sub sp, #4
	ldr r4, _08081C94 @ =gStatScreenSt
	movs r0, #4
	ldrsh r1, [r4, r0]
	movs r0, #6
	ldrsh r2, [r4, r0]
	ldr r3, _08081C98 @ =gUnk_08D8A41C
	movs r0, #0xb9
	lsls r0, r0, #6
	str r0, [sp]
	movs r0, #0xc
	bl PutSprite
	movs r0, #4
	ldrsh r1, [r4, r0]
	adds r1, #0x40
	movs r0, #6
	ldrsh r2, [r4, r0]
	adds r2, #0x83
	ldr r3, _08081C9C @ =Sprite_32x16
	ldr r0, _08081CA0 @ =0x00004E90
	str r0, [sp]
	movs r0, #0xb
	bl PutSprite
	movs r0, #4
	ldrsh r1, [r4, r0]
	adds r1, #0x60
	ldr r0, _08081CA4 @ =0x000001FF
	ands r1, r0
	ldrb r2, [r4, #6]
	ldr r3, _08081CA8 @ =gUnk_08D8A466
	ldr r0, _08081CAC @ =0x0000A460
	str r0, [sp]
	movs r0, #2
	bl PutSpriteExt
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08081C94: .4byte gStatScreenSt
_08081C98: .4byte gUnk_08D8A41C
_08081C9C: .4byte Sprite_32x16
_08081CA0: .4byte 0x00004E90
_08081CA4: .4byte 0x000001FF
_08081CA8: .4byte gUnk_08D8A466
_08081CAC: .4byte 0x0000A460

	thumb_func_start sub_8081CB0
sub_8081CB0: @ 0x08081CB0
	push {r4, r5, lr}
	sub sp, #0xc
	bl GetGameTime
	movs r2, #0
	movs r1, #0x1f
	ands r1, r0
	cmp r1, #0x13
	bhi _08081CC4
	movs r2, #1
_08081CC4:
	adds r5, r2, #0
	ldr r1, _08081D6C @ =gUnk_0841CDA0
	add r0, sp, #4
	movs r2, #6
	bl memcpy
	ldr r4, _08081D70 @ =gStatScreenSt
	movs r0, #8
	ldrsb r0, [r4, r0]
	cmp r0, #0
	bne _08081D64
	ldrb r0, [r4]
	cmp r0, #0
	bne _08081D2C
	ldr r0, [r4, #0xc]
	ldr r0, [r0, #0xc]
	movs r1, #0x10
	ands r0, r1
	cmp r0, #0
	beq _08081D2C
	movs r0, #0x78
	movs r1, #0x28
	movs r2, #1
	bl sub_8015F24
	movs r0, #0x78
	movs r1, #0x38
	movs r2, #1
	bl sub_8015F24
	cmp r5, #0
	beq _08081D2C
	ldr r3, _08081D74 @ =Sprite_8x8
	ldr r0, [r4, #0xc]
	ldrb r0, [r0, #0x1b]
	lsrs r0, r0, #6
	lsls r0, r0, #1
	mov r1, sp
	adds r1, r1, r0
	adds r1, #4
	movs r0, #0xf
	ldrh r1, [r1]
	ands r0, r1
	lsls r0, r0, #0xc
	ldr r1, _08081D78 @ =0x00000803
	adds r0, r0, r1
	str r0, [sp]
	movs r0, #4
	movs r1, #0xb8
	movs r2, #0x4e
	bl PutSprite
_08081D2C:
	ldr r0, _08081D70 @ =gStatScreenSt
	ldr r2, [r0, #0xc]
	ldr r0, [r2, #0xc]
	movs r1, #0x20
	ands r0, r1
	cmp r0, #0
	beq _08081D64
	cmp r5, #0
	beq _08081D64
	ldr r3, _08081D74 @ =Sprite_8x8
	ldrb r2, [r2, #0x1b]
	lsrs r0, r2, #6
	lsls r0, r0, #1
	mov r1, sp
	adds r1, r1, r0
	adds r1, #4
	movs r0, #0xf
	ldrh r1, [r1]
	ands r0, r1
	lsls r0, r0, #0xc
	ldr r1, _08081D78 @ =0x00000803
	adds r0, r0, r1
	str r0, [sp]
	movs r0, #4
	movs r1, #0x20
	movs r2, #0x56
	bl PutSprite
_08081D64:
	add sp, #0xc
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08081D6C: .4byte gUnk_0841CDA0
_08081D70: .4byte gStatScreenSt
_08081D74: .4byte Sprite_8x8
_08081D78: .4byte 0x00000803

	thumb_func_start sub_8081D7C
sub_8081D7C: @ 0x08081D7C
	push {r4, lr}
	ldr r3, _08081DD8 @ =gDispIo
	movs r0, #2
	rsbs r0, r0, #0
	ldrb r1, [r3, #1]
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
	strb r0, [r3, #1]
	adds r1, r3, #0
	adds r1, #0x3c
	movs r0, #0xc0
	ldrb r2, [r1]
	orrs r0, r2
	strb r0, [r1]
	adds r0, r3, #0
	adds r0, #0x44
	movs r2, #0
	strb r2, [r0]
	adds r0, #1
	strb r2, [r0]
	movs r4, #0x46
	movs r0, #0x10
	strb r0, [r4, r3]
	ldr r0, _08081DDC @ =0x0000FFE0
	ldrh r4, [r3, #0x3c]
	ands r0, r4
	strh r0, [r3, #0x3c]
	movs r0, #0x20
	ldrb r3, [r1]
	orrs r0, r3
	strb r0, [r1]
	ldr r0, _08081DE0 @ =gPal
	strh r2, [r0]
	bl EnablePalSync
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08081DD8: .4byte gDispIo
_08081DDC: .4byte 0x0000FFE0
_08081DE0: .4byte gPal

	thumb_func_start sub_8081DE4
sub_8081DE4: @ 0x08081DE4
	push {r4, r5, lr}
	sub sp, #0x18
	adds r5, r0, #0
	ldr r1, _08081EB0 @ =gUnk_0841CDA6
	mov r0, sp
	movs r2, #0x18
	bl memcpy
	mov r0, sp
	bl InitBgs
	movs r0, #0x80
	lsls r0, r0, #3
	bl SetBlankChr
	ldr r0, _08081EB4 @ =gBg2Tm
	movs r1, #0
	bl TmFill
	movs r0, #4
	bl EnableBgSync
	bl ApplySystemGraphics
	bl ApplyUnitSpritePalettes
	ldr r1, _08081EB8 @ =0x0600B000
	movs r2, #1
	rsbs r2, r2, #0
	movs r0, #0
	bl StartMuralBackgroundAlt
	ldr r0, _08081EBC @ =gUnk_0840392C
	ldr r1, _08081EC0 @ =0x06014800
	bl Decompress
	movs r0, #4
	bl ApplyIconPalettes
	movs r0, #6
	bl sub_804A2DC
	movs r0, #1
	movs r1, #0x13
	bl ApplyIconPalette
	ldr r0, _08081EC4 @ =gUnk_0840349C
	ldr r4, _08081EC8 @ =gBuf
	adds r1, r4, #0
	bl Decompress
	ldr r0, _08081ECC @ =gBg1Tm
	movs r2, #0x80
	lsls r2, r2, #5
	adds r1, r4, #0
	bl TmApplyTsa_thm
	ldr r0, _08081ED0 @ =gUnk_08403730
	ldr r1, _08081ED4 @ =0x06008C00
	bl Decompress
	ldr r0, _08081ED8 @ =gUnk_084038AC
	movs r1, #0xe0
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r0, _08081EDC @ =gPal + 0x20
	movs r2, #0x88
	lsls r2, r2, #2
	adds r1, r0, r2
	movs r2, #8
	bl CpuFastSet
	movs r0, #1
	movs r1, #0x14
	bl ApplyIconPalette
	ldr r0, _08081EE0 @ =gUnk_0840417C
	ldr r1, _08081EE4 @ =0x06004E00
	bl Decompress
	ldr r0, _08081EE8 @ =gUnk_0840368C
	ldr r1, _08081EEC @ =0x06010C00
	bl Decompress
	ldr r0, _08081EF0 @ =gUnk_081DBD64
	movs r1, #0xd0
	lsls r1, r1, #2
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r1, _08081EF4 @ =gStatScreenSt
	movs r0, #0
	str r0, [r1, #0x10]
	adds r0, r5, #0
	bl sub_80816F8
	add sp, #0x18
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08081EB0: .4byte gUnk_0841CDA6
_08081EB4: .4byte gBg2Tm
_08081EB8: .4byte 0x0600B000
_08081EBC: .4byte gUnk_0840392C
_08081EC0: .4byte 0x06014800
_08081EC4: .4byte gUnk_0840349C
_08081EC8: .4byte gBuf
_08081ECC: .4byte gBg1Tm
_08081ED0: .4byte gUnk_08403730
_08081ED4: .4byte 0x06008C00
_08081ED8: .4byte gUnk_084038AC
_08081EDC: .4byte gPal + 0x20
_08081EE0: .4byte gUnk_0840417C
_08081EE4: .4byte 0x06004E00
_08081EE8: .4byte gUnk_0840368C
_08081EEC: .4byte 0x06010C00
_08081EF0: .4byte gUnk_081DBD64
_08081EF4: .4byte gStatScreenSt

	thumb_func_start sub_8081EF8
sub_8081EF8: @ 0x08081EF8
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r6, r0, #0
	ldr r5, _08081F54 @ =gStatScreenSt
	ldr r0, [r5, #0xc]
	bl GetUnitPortraitId
	adds r4, r0, #0
	ldr r0, [r5, #0xc]
	ldr r0, [r0, #0xc]
	movs r1, #0x80
	lsls r1, r1, #0x10
	ands r0, r1
	cmp r0, #0
	beq _08081F18
	adds r4, #1
_08081F18:
	movs r0, #3
	strb r0, [r5, #1]
	bl ResetText
	bl InitIcons
	bl InitStatScreenText
	ldr r1, _08081F58 @ =gBg2Tm + 0x44
	movs r3, #0x9c
	lsls r3, r3, #3
	movs r0, #0xd
	str r0, [sp]
	adds r0, r6, #0
	adds r2, r4, #0
	bl PutFace80x72
	adds r0, r4, #0
	bl GetFaceInfo
	ldr r0, [r0]
	cmp r0, #0
	beq _08081F60
	ldr r0, _08081F5C @ =gUnk_0840364C
	movs r1, #0x40
	movs r2, #0x20
	bl ApplyPaletteExt
	b _08081F6A
	.align 2, 0
_08081F54: .4byte gStatScreenSt
_08081F58: .4byte gBg2Tm + 0x44
_08081F5C: .4byte gUnk_0840364C
_08081F60:
	ldr r0, _08081FB8 @ =gUnk_0840366C
	movs r1, #0x40
	movs r2, #0x20
	bl ApplyPaletteExt
_08081F6A:
	bl MU_EndAll
	ldr r4, _08081FBC @ =gStatScreenSt
	ldr r0, [r4, #0xc]
	movs r1, #0x50
	movs r2, #0x8a
	bl sub_806C3F8
	str r0, [r4, #0x10]
	bl PutStatScreenLeftPanelInfo
	ldrb r0, [r4]
	bl sub_8081224
	ldr r0, _08081FC0 @ =gUiTmScratchA
	ldr r1, _08081FC4 @ =gBg0Tm + 0x98
	movs r2, #0x12
	movs r3, #0x12
	bl TmCopyRect_thm
	ldr r0, _08081FC8 @ =gUiTmScratchB
	ldr r1, _08081FCC @ =gBg1Tm + 0x98
	movs r2, #0x12
	movs r3, #0x12
	bl TmCopyRect_thm
	ldr r0, _08081FD0 @ =gUiTmScratchC
	ldr r1, _08081FD4 @ =gBg2Tm + 0x98
	movs r2, #0x12
	movs r3, #0x12
	bl TmCopyRect_thm
	movs r0, #7
	bl EnableBgSync
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08081FB8: .4byte gUnk_0840366C
_08081FBC: .4byte gStatScreenSt
_08081FC0: .4byte gUiTmScratchA
_08081FC4: .4byte gBg0Tm + 0x98
_08081FC8: .4byte gUiTmScratchB
_08081FCC: .4byte gBg1Tm + 0x98
_08081FD0: .4byte gUiTmScratchC
_08081FD4: .4byte gBg2Tm + 0x98

	thumb_func_start sub_8081FD8
sub_8081FD8: @ 0x08081FD8
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	ldr r1, _08082060 @ =gpKeySt
	ldr r2, [r1]
	movs r0, #2
	ldrh r3, [r2, #8]
	ands r0, r3
	adds r3, r1, #0
	cmp r0, #0
	beq _08082078
	ldr r3, _08082064 @ =gDispIo
	movs r0, #2
	rsbs r0, r0, #0
	ldrb r4, [r3, #1]
	ands r0, r4
	movs r1, #3
	rsbs r1, r1, #0
	ands r0, r1
	subs r1, #2
	ands r0, r1
	subs r1, #4
	ands r0, r1
	subs r1, #8
	ands r0, r1
	strb r0, [r3, #1]
	adds r1, r3, #0
	adds r1, #0x3c
	movs r0, #0xc0
	ldrb r2, [r1]
	orrs r0, r2
	strb r0, [r1]
	adds r0, r3, #0
	adds r0, #0x44
	movs r2, #0
	strb r2, [r0]
	adds r0, #1
	strb r2, [r0]
	adds r4, r3, #0
	adds r4, #0x46
	movs r0, #0x10
	strb r0, [r4]
	ldr r0, _08082068 @ =0x0000FFE0
	ldrh r4, [r3, #0x3c]
	ands r0, r4
	strh r0, [r3, #0x3c]
	movs r0, #0x20
	ldrb r3, [r1]
	orrs r0, r3
	strb r0, [r1]
	ldr r0, _0808206C @ =gPal
	strh r2, [r0]
	bl EnablePalSync
	adds r0, r5, #0
	bl Proc_Break
	ldr r0, _08082070 @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	bge _08082056
	b _0808215C
_08082056:
	ldr r0, _08082074 @ =0x0000038B
	bl m4aSongNumStart
	b _0808215C
	.align 2, 0
_08082060: .4byte gpKeySt
_08082064: .4byte gDispIo
_08082068: .4byte 0x0000FFE0
_0808206C: .4byte gPal
_08082070: .4byte gPlaySt
_08082074: .4byte 0x0000038B
_08082078:
	ldrh r1, [r2, #6]
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	beq _0808209C
	ldr r4, _08082098 @ =gStatScreenSt
	ldrb r1, [r4, #1]
	ldrb r2, [r4]
	adds r0, r2, r1
	subs r0, #1
	bl __modsi3
	strb r0, [r4]
	ldrb r1, [r4]
	movs r0, #0x20
	b _080820BA
	.align 2, 0
_08082098: .4byte gStatScreenSt
_0808209C:
	movs r6, #0x10
	adds r0, r6, #0
	ands r0, r1
	cmp r0, #0
	beq _080820C8
	ldr r4, _080820C4 @ =gStatScreenSt
	ldrb r1, [r4, #1]
	ldrb r3, [r4]
	adds r0, r3, r1
	adds r0, #1
	bl __modsi3
	strb r0, [r4]
	ldrb r1, [r4]
	movs r0, #0x10
_080820BA:
	adds r2, r5, #0
	bl sub_8081458
	b _0808215C
	.align 2, 0
_080820C4: .4byte gStatScreenSt
_080820C8:
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _080820E8
	ldr r0, _080820E4 @ =gStatScreenSt
	ldr r0, [r0, #0xc]
	movs r4, #1
	rsbs r4, r4, #0
	adds r1, r4, #0
	bl sub_8081278
	adds r2, r0, #0
	adds r1, r4, #0
	b _0808212E
	.align 2, 0
_080820E4: .4byte gStatScreenSt
_080820E8:
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _08082104
	ldr r0, _08082100 @ =gStatScreenSt
	ldr r0, [r0, #0xc]
	movs r1, #1
	bl sub_8081278
	adds r2, r0, #0
	movs r1, #1
	b _0808212E
	.align 2, 0
_08082100: .4byte gStatScreenSt
_08082104:
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0808213C
	ldr r4, _08082138 @ =gStatScreenSt
	ldr r2, [r4, #0xc]
	ldrb r0, [r2, #0x1b]
	cmp r0, #0
	beq _0808213C
	bl GetUnit
	adds r2, r0, #0
	ldr r0, [r4, #0xc]
	ldr r0, [r0, #0xc]
	ands r0, r6
	movs r1, #1
	rsbs r1, r1, #0
	cmp r0, #0
	beq _0808212C
	movs r1, #1
_0808212C:
	adds r0, r2, #0
_0808212E:
	adds r2, r5, #0
	bl sub_808178C
	b _0808215C
	.align 2, 0
_08082138: .4byte gStatScreenSt
_0808213C:
	ldr r1, [r3]
	movs r0, #0x80
	lsls r0, r0, #1
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _0808215C
	adds r0, r5, #0
	movs r1, #0
	bl Proc_Goto
	ldr r0, _08082164 @ =gStatScreenSt
	ldrb r0, [r0]
	adds r1, r5, #0
	bl StartStatScreenHelp
_0808215C:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08082164: .4byte gStatScreenSt

	thumb_func_start sub_8082168
sub_8082168: @ 0x08082168
	push {r4, lr}
	ldr r3, _08082194 @ =gPlaySt
	movs r1, #0xfc
	ldrb r0, [r3, #0x14]
	ands r1, r0
	ldr r2, _08082198 @ =gStatScreenSt
	movs r0, #3
	ldrb r4, [r2]
	ands r0, r4
	orrs r1, r0
	strb r1, [r3, #0x14]
	ldr r1, _0808219C @ =gStatScreenInfo
	ldr r0, [r2, #0xc]
	ldrb r0, [r0, #0xb]
	strb r0, [r1, #1]
	movs r0, #0
	bl SetOnVMatch
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08082194: .4byte gPlaySt
_08082198: .4byte gStatScreenSt
_0808219C: .4byte gStatScreenInfo

	thumb_func_start sub_80821A0
sub_80821A0: @ 0x080821A0
	push {lr}
	bl sub_8082DAC
	ldr r1, _080821B0 @ =gStatScreenSt
	str r0, [r1, #0x14]
	pop {r0}
	bx r0
	.align 2, 0
_080821B0: .4byte gStatScreenSt

	thumb_func_start sub_80821B4
sub_80821B4: @ 0x080821B4
	push {r4, lr}
	ldr r0, _080821E8 @ =gStatScreenSt
	movs r1, #6
	ldrsh r4, [r0, r1]
	rsbs r4, r4, #0
	movs r0, #0xff
	ands r4, r0
	movs r0, #0
	movs r1, #0
	adds r2, r4, #0
	bl SetBgOffset
	movs r0, #1
	movs r1, #0
	adds r2, r4, #0
	bl SetBgOffset
	movs r0, #2
	movs r1, #0
	adds r2, r4, #0
	bl SetBgOffset
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080821E8: .4byte gStatScreenSt

	thumb_func_start sub_80821EC
sub_80821EC: @ 0x080821EC
	push {lr}
	bl EndMuralBackground
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_80821F8
sub_80821F8: @ 0x080821F8
	push {r4, r5, r6, r7, lr}
	adds r6, r1, #0
	ldr r2, _08082240 @ =gStatScreenSt
	movs r5, #0
	movs r3, #0
	strh r3, [r2, #4]
	strh r3, [r2, #6]
	ldr r4, _08082244 @ =gPlaySt
	movs r1, #3
	ldrb r7, [r4, #0x14]
	ands r1, r7
	strb r1, [r2]
	str r0, [r2, #0xc]
	str r3, [r2, #0x14]
	strh r3, [r2, #2]
	strb r5, [r2, #8]
	ldr r0, [r0]
	ldrb r0, [r0, #4]
	bl sub_80A0978
	adds r4, #0x41
	ldrb r4, [r4]
	lsls r0, r4, #0x1e
	cmp r0, #0
	blt _08082230
	ldr r0, _08082248 @ =0x0000038A
	bl m4aSongNumStart
_08082230:
	ldr r0, _0808224C @ =gUnk_08D8A530
	adds r1, r6, #0
	bl Proc_StartBlocking
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08082240: .4byte gStatScreenSt
_08082244: .4byte gPlaySt
_08082248: .4byte 0x0000038A
_0808224C: .4byte gUnk_08D8A530

	thumb_func_start StartStatScreenHelp
StartStatScreenHelp: @ 0x08082250
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	movs r1, #1
	rsbs r1, r1, #0
	movs r0, #0
	bl LoadHelpBoxGfx
	ldr r1, _08082278 @ =gStatScreenSt
	ldr r0, [r1, #0x14]
	cmp r0, #0
	bne _08082298
	cmp r4, #1
	beq _0808228C
	cmp r4, #1
	bgt _0808227C
	cmp r4, #0
	beq _08082282
	b _08082298
	.align 2, 0
_08082278: .4byte gStatScreenSt
_0808227C:
	cmp r4, #2
	beq _08082294
	b _08082298
_08082282:
	ldr r0, _08082288 @ =gUnk_08D8A704
	b _08082296
	.align 2, 0
_08082288: .4byte gUnk_08D8A704
_0808228C:
	ldr r0, _08082290 @ =gUnk_08D8A8E0
	b _08082296
	.align 2, 0
_08082290: .4byte gUnk_08D8A8E0
_08082294:
	ldr r0, _080822A8 @ =gUnk_08D8AA84
_08082296:
	str r0, [r1, #0x14]
_08082298:
	ldr r0, _080822AC @ =gStatScreenSt
	ldr r0, [r0, #0x14]
	adds r1, r5, #0
	bl sub_80829F4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080822A8: .4byte gUnk_08D8AA84
_080822AC: .4byte gStatScreenSt

	thumb_func_start sub_80822B0
sub_80822B0: @ 0x080822B0
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _080822D8 @ =gStatScreenSt
	ldr r0, [r0, #0xc]
	ldr r1, [r4, #0x2c]
	ldrh r1, [r1, #0x12]
	lsls r1, r1, #1
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r0, [r0]
	adds r1, r4, #0
	adds r1, #0x4e
	strh r0, [r1]
	bl GetItemDescId
	adds r4, #0x4c
	strh r0, [r4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080822D8: .4byte gStatScreenSt

	thumb_func_start sub_80822DC
sub_80822DC: @ 0x080822DC
	adds r2, r0, #0
	ldr r0, _080822F8 @ =gStatScreenSt
	ldr r0, [r0, #0xc]
	adds r0, #0x30
	ldrb r0, [r0]
	lsls r0, r0, #0x1c
	lsrs r0, r0, #0x1c
	cmp r0, #8
	bhi _0808238C
	lsls r0, r0, #2
	ldr r1, _080822FC @ =_08082300
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080822F8: .4byte gStatScreenSt
_080822FC: .4byte _08082300
_08082300: @ jump table
	.4byte _08082324 @ case 0
	.4byte _08082330 @ case 1
	.4byte _0808233A @ case 2
	.4byte _08082348 @ case 3
	.4byte _08082354 @ case 4
	.4byte _08082360 @ case 5
	.4byte _0808236A @ case 6
	.4byte _08082378 @ case 7
	.4byte _08082384 @ case 8
_08082324:
	adds r1, r2, #0
	adds r1, #0x4c
	ldr r0, _0808232C @ =0x00000273
	b _0808238A
	.align 2, 0
_0808232C: .4byte 0x00000273
_08082330:
	adds r1, r2, #0
	adds r1, #0x4c
	movs r0, #0x9d
	lsls r0, r0, #2
	b _0808238A
_0808233A:
	adds r1, r2, #0
	adds r1, #0x4c
	ldr r0, _08082344 @ =0x00000275
	b _0808238A
	.align 2, 0
_08082344: .4byte 0x00000275
_08082348:
	adds r1, r2, #0
	adds r1, #0x4c
	ldr r0, _08082350 @ =0x00000277
	b _0808238A
	.align 2, 0
_08082350: .4byte 0x00000277
_08082354:
	adds r1, r2, #0
	adds r1, #0x4c
	ldr r0, _0808235C @ =0x00000276
	b _0808238A
	.align 2, 0
_0808235C: .4byte 0x00000276
_08082360:
	adds r1, r2, #0
	adds r1, #0x4c
	movs r0, #0x9e
	lsls r0, r0, #2
	b _0808238A
_0808236A:
	adds r1, r2, #0
	adds r1, #0x4c
	ldr r0, _08082374 @ =0x00000279
	b _0808238A
	.align 2, 0
_08082374: .4byte 0x00000279
_08082378:
	adds r1, r2, #0
	adds r1, #0x4c
	ldr r0, _08082380 @ =0x0000027A
	b _0808238A
	.align 2, 0
_08082380: .4byte 0x0000027A
_08082384:
	adds r1, r2, #0
	adds r1, #0x4c
	ldr r0, _08082390 @ =0x0000027B
_0808238A:
	strh r0, [r1]
_0808238C:
	bx lr
	.align 2, 0
_08082390: .4byte 0x0000027B

	thumb_func_start sub_8082394
sub_8082394: @ 0x08082394
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _080823B0 @ =gStatScreenSt
	ldr r0, [r0, #0xc]
	bl UnitHasMagicRank
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080823B4
	adds r1, r4, #0
	adds r1, #0x4c
	movs r0, #0x9a
	lsls r0, r0, #2
	b _080823BA
	.align 2, 0
_080823B0: .4byte gStatScreenSt
_080823B4:
	adds r1, r4, #0
	adds r1, #0x4c
	ldr r0, _080823C4 @ =0x00000267
_080823BA:
	strh r0, [r1]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080823C4: .4byte 0x00000267

	thumb_func_start sub_80823C8
sub_80823C8: @ 0x080823C8
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r5, _08082408 @ =gStatScreenSt
	ldr r0, [r5, #0xc]
	ldrh r0, [r0, #0x1e]
	cmp r0, #0
	bne _080823DC
	adds r0, r4, #0
	bl HelpBoxTryRelocateLeft
_080823DC:
	ldr r0, [r5, #0xc]
	ldr r1, [r4, #0x2c]
	ldrh r1, [r1, #0x12]
	lsls r1, r1, #1
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r0, [r0]
	cmp r0, #0
	bne _08082416
	adds r0, r4, #0
	adds r0, #0x50
	ldrh r0, [r0]
	cmp r0, #0
	beq _08082400
	cmp r0, #0x10
	beq _08082400
	cmp r0, #0x40
	bne _0808240C
_08082400:
	adds r0, r4, #0
	bl HelpBoxTryRelocateUp
	b _08082416
	.align 2, 0
_08082408: .4byte gStatScreenSt
_0808240C:
	cmp r0, #0x80
	bne _08082416
	adds r0, r4, #0
	bl HelpBoxTryRelocateDown
_08082416:
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start sub_808241C
sub_808241C: @ 0x0808241C
	push {r4, r5, lr}
	sub sp, #0x10
	adds r5, r0, #0
	ldr r1, _08082454 @ =gUnk_0841CDBE
	mov r0, sp
	movs r2, #0x10
	bl memcpy
	ldr r0, [r5, #0x2c]
	ldrh r4, [r0, #0x12]
	ldr r0, _08082458 @ =gStatScreenSt
	ldr r0, [r0, #0xc]
	bl UnitHasMagicRank
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08082440
	adds r4, #4
_08082440:
	lsls r0, r4, #1
	add r0, sp
	ldrh r1, [r0]
	adds r0, r5, #0
	adds r0, #0x4c
	strh r1, [r0]
	add sp, #0x10
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08082454: .4byte gUnk_0841CDBE
_08082458: .4byte gStatScreenSt

	thumb_func_start sub_808245C
sub_808245C: @ 0x0808245C
	adds r1, r0, #0
	ldr r0, _08082474 @ =gStatScreenSt
	ldr r0, [r0, #0xc]
	ldr r0, [r0]
	ldrh r2, [r0, #2]
	cmp r2, #0
	beq _08082478
	adds r0, r1, #0
	adds r0, #0x4c
	strh r2, [r0]
	b _0808247E
	.align 2, 0
_08082474: .4byte gStatScreenSt
_08082478:
	adds r1, #0x4c
	ldr r0, _08082480 @ =0x0000039B
	strh r0, [r1]
_0808247E:
	bx lr
	.align 2, 0
_08082480: .4byte 0x0000039B

	thumb_func_start sub_8082484
sub_8082484: @ 0x08082484
	ldr r1, _08082494 @ =gStatScreenSt
	ldr r1, [r1, #0xc]
	ldr r1, [r1, #4]
	ldrh r1, [r1, #2]
	adds r0, #0x4c
	strh r1, [r0]
	bx lr
	.align 2, 0
_08082494: .4byte gStatScreenSt

	thumb_func_start sub_8082498
sub_8082498: @ 0x08082498
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _080824BC @ =gStatScreenSt
	ldr r0, [r0, #0xc]
	bl GetUnitTotalSupportLevel
	cmp r0, #0
	bne _080824C6
	adds r0, r4, #0
	adds r0, #0x50
	ldrh r0, [r0]
	cmp r0, #0x80
	bne _080824C0
	adds r0, r4, #0
	bl HelpBoxTryRelocateDown
	b _080824C6
	.align 2, 0
_080824BC: .4byte gStatScreenSt
_080824C0:
	adds r0, r4, #0
	bl HelpBoxTryRelocateUp
_080824C6:
	pop {r4}
	pop {r0}
	bx r0
