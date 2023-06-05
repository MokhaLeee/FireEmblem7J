

	.include "macro.inc"
	.syntax unified

	thumb_func_start GetUnitKeyItemSlotForTerrain
GetUnitKeyItemSlotForTerrain: @ 0x08018914
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	movs r6, #0
	ldr r0, [r4]
	ldr r1, [r4, #4]
	ldr r0, [r0, #0x28]
	ldr r1, [r1, #0x28]
	orrs r0, r1
	movs r1, #8
	ands r0, r1
	cmp r0, #0
	beq _0801893A
	adds r0, r4, #0
	movs r1, #0x6a
	bl sub_08017160
	cmp r0, #0
	bge _08018962
_0801893A:
	cmp r5, #0x1e
	beq _08018958
	cmp r5, #0x21
	bne _0801895A
	adds r0, r4, #0
	movs r1, #0x68
	bl sub_08017160
	cmp r0, #0
	bge _08018962
	adds r0, r4, #0
	movs r1, #0x78
	bl sub_08017160
	b _08018962
_08018958:
	movs r6, #0x69
_0801895A:
	adds r0, r4, #0
	adds r1, r6, #0
	bl sub_08017160
_08018962:
	pop {r4, r5, r6}
	pop {r1}
	bx r1

	thumb_func_start GetUnitAidIconId
GetUnitAidIconId: @ 0x08018968
	adds r1, r0, #0
	movs r0, #0x80
	lsls r0, r0, #3
	ands r0, r1
	cmp r0, #0
	beq _08018978
	movs r0, #0x81
	b _08018998
_08018978:
	movs r0, #0x80
	lsls r0, r0, #5
	ands r0, r1
	cmp r0, #0
	beq _08018986
	movs r0, #0x82
	b _08018998
_08018986:
	movs r0, #0x80
	lsls r0, r0, #4
	ands r0, r1
	cmp r0, #0
	bne _08018996
	movs r0, #1
	rsbs r0, r0, #0
	b _08018998
_08018996:
	movs r0, #0x83
_08018998:
	bx lr
	.align 2, 0

	thumb_func_start GetUnitWeaponUsabilityBits
GetUnitWeaponUsabilityBits: @ 0x0801899C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r5, r0, #0
	movs r6, #0
	movs r7, #0
	ldrh r4, [r5, #0x1e]
	cmp r4, #0
	beq _08018A06
	movs r0, #1
	mov r8, r0
_080189B2:
	adds r0, r4, #0
	bl GetItemAttributes
	mov r1, r8
	ands r0, r1
	cmp r0, #0
	beq _080189D2
	adds r0, r5, #0
	adds r1, r4, #0
	bl CanUnitUseWeapon
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080189D2
	mov r0, r8
	orrs r6, r0
_080189D2:
	adds r0, r4, #0
	bl GetItemAttributes
	movs r1, #4
	ands r1, r0
	cmp r1, #0
	beq _080189F2
	adds r0, r5, #0
	adds r1, r4, #0
	bl CanUnitUseStaff
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080189F2
	movs r0, #2
	orrs r6, r0
_080189F2:
	adds r7, #1
	cmp r7, #4
	bgt _08018A06
	lsls r1, r7, #1
	adds r0, r5, #0
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r4, [r0]
	cmp r4, #0
	bne _080189B2
_08018A06:
	adds r0, r6, #0
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start GetCombinedEnemyWeaponUsabilityBits
GetCombinedEnemyWeaponUsabilityBits: @ 0x08018A14
	push {r4, r5, r6, lr}
	movs r5, #0
	movs r4, #0x81
	ldr r6, _08018A48 @ =gUnitLut
_08018A1C:
	movs r0, #0xff
	ands r0, r4
	lsls r0, r0, #2
	adds r0, r0, r6
	ldr r1, [r0]
	cmp r1, #0
	beq _08018A38
	ldr r0, [r1]
	cmp r0, #0
	beq _08018A38
	adds r0, r1, #0
	bl GetUnitWeaponUsabilityBits
	orrs r5, r0
_08018A38:
	adds r4, #1
	cmp r4, #0xbf
	ble _08018A1C
	adds r0, r5, #0
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_08018A48: .4byte gUnitLut

	thumb_func_start CanUnitMove
CanUnitMove: @ 0x08018A4C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	ldr r1, _08018ADC @ =0x081C922F
	mov r0, sp
	movs r2, #8
	bl memcpy
	ldr r0, _08018AE0 @ =gActiveUnit
	ldr r2, [r0]
	movs r1, #0x1d
	ldrsb r1, [r2, r1]
	ldr r0, [r2, #4]
	ldrb r0, [r0, #0x12]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r1, r1, r0
	ldr r0, _08018AE4 @ =gActionSt
	ldrb r0, [r0, #0x10]
	subs r0, r1, r0
	mov sl, r0
	movs r0, #0x10
	ldrsb r0, [r2, r0]
	mov sb, r0
	ldrb r2, [r2, #0x11]
	lsls r2, r2, #0x18
	asrs r2, r2, #0x18
	mov r8, r2
	movs r7, #0
	mov r4, sp
_08018A8E:
	movs r0, #0
	ldrsb r0, [r4, r0]
	mov r1, sb
	adds r6, r1, r0
	movs r1, #1
	ldrsb r1, [r4, r1]
	add r1, r8
	ldr r0, _08018AE8 @ =gBmMapUnit
	ldr r0, [r0]
	lsls r5, r1, #2
	adds r0, r5, r0
	ldr r1, [r0]
	adds r1, r1, r6
	movs r0, #0x80
	ldrb r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _08018AF0
	ldr r0, _08018AE0 @ =gActiveUnit
	ldr r0, [r0]
	bl GetUnitMovementCost
	ldr r1, _08018AEC @ =gBmMapTerrain
	ldr r1, [r1]
	adds r1, r5, r1
	ldr r1, [r1]
	adds r1, r1, r6
	ldrb r1, [r1]
	adds r0, r1, r0
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	blt _08018AF0
	cmp r0, sl
	bgt _08018AF0
	movs r0, #1
	b _08018AFA
	.align 2, 0
_08018ADC: .4byte 0x081C922F
_08018AE0: .4byte gActiveUnit
_08018AE4: .4byte gActionSt
_08018AE8: .4byte gBmMapUnit
_08018AEC: .4byte gBmMapTerrain
_08018AF0:
	adds r4, #2
	adds r7, #1
	cmp r7, #3
	ble _08018A8E
	movs r0, #0
_08018AFA:
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start IsPositionMagicSealed
IsPositionMagicSealed: @ 0x08018B0C
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	movs r3, #0x81
	ldr r6, _08018B5C @ =gUnitLut
_08018B16:
	movs r0, #0xff
	ands r0, r3
	lsls r0, r0, #2
	adds r0, r0, r6
	ldr r2, [r0]
	cmp r2, #0
	beq _08018B6C
	ldr r1, [r2]
	cmp r1, #0
	beq _08018B6C
	ldr r0, [r2, #4]
	ldr r1, [r1, #0x28]
	ldr r0, [r0, #0x28]
	orrs r1, r0
	movs r0, #0x80
	lsls r0, r0, #0x13
	ands r1, r0
	cmp r1, #0
	beq _08018B6C
	movs r0, #0x10
	ldrsb r0, [r2, r0]
	subs r1, r0, r5
	cmp r1, #0
	bge _08018B48
	subs r1, r5, r0
_08018B48:
	ldrb r2, [r2, #0x11]
	lsls r2, r2, #0x18
	asrs r2, r2, #0x18
	subs r0, r2, r4
	cmp r0, #0
	blt _08018B60
	adds r0, r1, r0
	cmp r0, #0xa
	ble _08018B68
	b _08018B6C
	.align 2, 0
_08018B5C: .4byte gUnitLut
_08018B60:
	subs r0, r4, r2
	adds r0, r1, r0
	cmp r0, #0xa
	bgt _08018B6C
_08018B68:
	movs r0, #1
	b _08018B74
_08018B6C:
	adds r3, #1
	cmp r3, #0xbf
	ble _08018B16
	movs r0, #0
_08018B74:
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start IsUnitMagicSealed
IsUnitMagicSealed: @ 0x08018B7C
	push {lr}
	adds r2, r0, #0
	adds r1, r2, #0
	adds r1, #0x30
	movs r0, #0xf
	ldrb r1, [r1]
	ands r0, r1
	cmp r0, #3
	beq _08018BA4
	movs r0, #0x10
	ldrsb r0, [r2, r0]
	movs r1, #0x11
	ldrsb r1, [r2, r1]
	bl IsPositionMagicSealed
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08018BA4
	movs r0, #0
	b _08018BA6
_08018BA4:
	movs r0, #1
_08018BA6:
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start GetUnitLastItem
GetUnitLastItem: @ 0x08018BAC
	push {r4, lr}
	adds r4, r0, #0
	bl GetUnitItemCount
	subs r0, #1
	lsls r0, r0, #1
	adds r4, #0x1e
	adds r4, r4, r0
	ldrh r0, [r4]
	pop {r4}
	pop {r1}
	bx r1

	thumb_func_start GetUnitMovementCost
GetUnitMovementCost: @ 0x08018BC4
	adds r2, r0, #0
	ldr r0, [r2, #0xc]
	movs r1, #0x80
	lsls r1, r1, #4
	ands r0, r1
	cmp r0, #0
	beq _08018BDC
	ldr r0, _08018BD8 @ =0x08C52FA4
	b _08018C02
	.align 2, 0
_08018BD8: .4byte 0x08C52FA4
_08018BDC:
	ldr r0, _08018BF4 @ =gPlaySt
	ldrb r0, [r0, #0x15]
	cmp r0, #1
	blt _08018BFE
	cmp r0, #2
	ble _08018BF8
	cmp r0, #4
	bne _08018BFE
	ldr r0, [r2, #4]
	ldr r0, [r0, #0x3c]
	b _08018C02
	.align 2, 0
_08018BF4: .4byte gPlaySt
_08018BF8:
	ldr r0, [r2, #4]
	ldr r0, [r0, #0x40]
	b _08018C02
_08018BFE:
	ldr r0, [r2, #4]
	ldr r0, [r0, #0x38]
_08018C02:
	bx lr

	thumb_func_start GetClassSMSId
GetClassSMSId: @ 0x08018C04
	adds r1, r0, #0
	cmp r1, #0
	bgt _08018C0E
	movs r0, #0
	b _08018C16
_08018C0E:
	movs r0, #0x54
	muls r1, r0, r1
	ldr r0, _08018C1C @ =0x08C4F468
	adds r0, r1, r0
_08018C16:
	ldrb r0, [r0, #6]
	bx lr
	.align 2, 0
_08018C1C: .4byte 0x08C4F468

	thumb_func_start UpdatePrevDeployStates
UpdatePrevDeployStates: @ 0x08018C20
	push {r4, r5, lr}
	movs r4, #1
	ldr r5, _08018C58 @ =gUnitLut
_08018C26:
	movs r0, #0xff
	ands r0, r4
	lsls r0, r0, #2
	adds r0, r0, r5
	ldr r2, [r0]
	adds r3, r2, #0
	cmp r2, #0
	beq _08018C62
	ldr r0, [r2]
	cmp r0, #0
	beq _08018C62
	ldr r1, [r2, #0xc]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	beq _08018C5C
	movs r0, #0x80
	lsls r0, r0, #0xd
	orrs r1, r0
	movs r0, #5
	rsbs r0, r0, #0
	ands r1, r0
	str r1, [r2, #0xc]
	b _08018C62
	.align 2, 0
_08018C58: .4byte gUnitLut
_08018C5C:
	ldr r0, _08018C74 @ =0xFFEFFFFF
	ands r1, r0
	str r1, [r3, #0xc]
_08018C62:
	adds r4, #1
	cmp r4, #0x3f
	ble _08018C26
	bl sub_0807B32C
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08018C74: .4byte 0xFFEFFFFF

	thumb_func_start LoadUnitPrepScreenPositions
LoadUnitPrepScreenPositions: @ 0x08018C78
	push {r4, r5, r6, lr}
	movs r4, #1
	ldr r6, _08018CAC @ =gUnitLut
	ldr r5, _08018CB0 @ =0xFFEFFFFF
_08018C80:
	movs r0, #0xff
	ands r0, r4
	lsls r0, r0, #2
	adds r0, r0, r6
	ldr r2, [r0]
	adds r3, r2, #0
	cmp r2, #0
	beq _08018CB8
	ldr r0, [r2]
	cmp r0, #0
	beq _08018CB8
	ldr r1, [r2, #0xc]
	movs r0, #0x80
	lsls r0, r0, #0xd
	ands r0, r1
	cmp r0, #0
	beq _08018CB4
	movs r0, #4
	orrs r1, r0
	ands r1, r5
	str r1, [r2, #0xc]
	b _08018CB8
	.align 2, 0
_08018CAC: .4byte gUnitLut
_08018CB0: .4byte 0xFFEFFFFF
_08018CB4:
	ands r1, r5
	str r1, [r3, #0xc]
_08018CB8:
	adds r4, #1
	cmp r4, #0x3f
	ble _08018C80
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	thumb_func_start ClearTemporaryUnits
ClearTemporaryUnits: @ 0x08018CC4
	push {r4, r5, lr}
	movs r3, #1
	ldr r5, _08018CF4 @ =gPlaySt
	ldr r4, _08018CF8 @ =gUnitLut
_08018CCC:
	movs r0, #0xff
	ands r0, r3
	lsls r0, r0, #2
	adds r0, r0, r4
	ldr r2, [r0]
	cmp r2, #0
	beq _08018D22
	ldr r0, [r2]
	cmp r0, #0
	beq _08018D22
	ldr r1, [r2, #0xc]
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	beq _08018CFC
	movs r0, #0x80
	lsls r0, r0, #0xe
	orrs r1, r0
	b _08018D00
	.align 2, 0
_08018CF4: .4byte gPlaySt
_08018CF8: .4byte gUnitLut
_08018CFC:
	ldr r0, _08018D18 @ =0xFFDFFFFF
	ands r1, r0
_08018D00:
	str r1, [r2, #0xc]
	ldr r1, [r2, #0xc]
	movs r0, #0x80
	lsls r0, r0, #9
	ands r0, r1
	cmp r0, #0
	beq _08018D1C
	movs r0, #0x80
	lsls r0, r0, #0x13
	orrs r1, r0
	b _08018D20
	.align 2, 0
_08018D18: .4byte 0xFFDFFFFF
_08018D1C:
	ldr r0, _08018D68 @ =0xFBFFFFFF
	ands r1, r0
_08018D20:
	str r1, [r2, #0xc]
_08018D22:
	adds r3, #1
	cmp r3, #0x3f
	ble _08018CCC
	movs r0, #0x10
	ldrb r5, [r5, #0x14]
	ands r0, r5
	cmp r0, #0
	beq _08018D5E
	movs r3, #1
	ldr r5, _08018D6C @ =gUnitLut
	movs r4, #0xff
_08018D38:
	adds r0, r3, #0
	ands r0, r4
	lsls r0, r0, #2
	adds r0, r0, r5
	ldr r2, [r0]
	cmp r2, #0
	beq _08018D58
	ldr r0, [r2]
	cmp r0, #0
	beq _08018D58
	adds r0, r2, #0
	adds r0, #0x40
	ldrb r1, [r2, #0x10]
	strb r1, [r0]
	ldrb r1, [r2, #0x11]
	strb r1, [r0, #1]
_08018D58:
	adds r3, #1
	cmp r3, #0x3f
	ble _08018D38
_08018D5E:
	bl sub_0807B32C
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08018D68: .4byte 0xFBFFFFFF
_08018D6C: .4byte gUnitLut

	thumb_func_start IsUnitSlotAvailable
IsUnitSlotAvailable: @ 0x08018D70
	push {r4, r5, r6, lr}
	bl sub_0807B32C
	movs r4, #1
	ldr r5, _08018DA4 @ =gUnitLut
_08018D7A:
	movs r0, #0xff
	ands r0, r4
	lsls r0, r0, #2
	adds r0, r0, r5
	ldr r2, [r0]
	cmp r2, #0
	beq _08018DE2
	ldr r0, [r2]
	cmp r0, #0
	beq _08018DE2
	ldr r1, [r2, #0xc]
	movs r0, #0x80
	lsls r0, r0, #0xf
	ands r0, r1
	cmp r0, #0
	beq _08018DA8
	adds r0, r2, #0
	bl ClearUnit
	b _08018DE2
	.align 2, 0
_08018DA4: .4byte gUnitLut
_08018DA8:
	movs r0, #0x80
	lsls r0, r0, #0xe
	ands r0, r1
	cmp r0, #0
	beq _08018DB8
	movs r0, #8
	orrs r1, r0
	b _08018DBE
_08018DB8:
	movs r0, #9
	rsbs r0, r0, #0
	ands r1, r0
_08018DBE:
	str r1, [r2, #0xc]
	ldr r1, [r2, #0xc]
	movs r0, #0x80
	lsls r0, r0, #0x13
	ands r0, r1
	cmp r0, #0
	beq _08018DD4
	movs r0, #0x80
	lsls r0, r0, #9
	orrs r1, r0
	b _08018DD8
_08018DD4:
	ldr r0, _08018E54 @ =0xFFFEFFFF
	ands r1, r0
_08018DD8:
	str r1, [r2, #0xc]
	ldr r0, [r2, #0xc]
	movs r1, #1
	orrs r0, r1
	str r0, [r2, #0xc]
_08018DE2:
	adds r4, #1
	cmp r4, #0x3f
	ble _08018D7A
	ldr r1, _08018E58 @ =gPlaySt
	movs r0, #0x10
	ldrb r1, [r1, #0x14]
	ands r0, r1
	cmp r0, #0
	beq _08018E24
	movs r3, #1
	ldr r6, _08018E5C @ =gUnitLut
	movs r5, #0xff
	movs r4, #0
_08018DFC:
	adds r0, r3, #0
	ands r0, r5
	lsls r0, r0, #2
	adds r0, r0, r6
	ldr r2, [r0]
	cmp r2, #0
	beq _08018E1E
	ldr r0, [r2]
	cmp r0, #0
	beq _08018E1E
	adds r0, r2, #0
	adds r0, #0x40
	ldrb r1, [r0]
	strb r1, [r2, #0x10]
	ldrb r1, [r0, #1]
	strb r1, [r2, #0x11]
	strh r4, [r0]
_08018E1E:
	adds r3, #1
	cmp r3, #0x3f
	ble _08018DFC
_08018E24:
	movs r4, #0x41
	ldr r5, _08018E5C @ =gUnitLut
_08018E28:
	movs r0, #0xff
	ands r0, r4
	lsls r0, r0, #2
	adds r0, r0, r5
	ldr r1, [r0]
	cmp r1, #0
	beq _08018E42
	ldr r0, [r1]
	cmp r0, #0
	beq _08018E42
	adds r0, r1, #0
	bl ClearUnit
_08018E42:
	adds r4, #1
	cmp r4, #0xbf
	ble _08018E28
	bl sub_080799E4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08018E54: .4byte 0xFFFEFFFF
_08018E58: .4byte gPlaySt
_08018E5C: .4byte gUnitLut

	thumb_func_start sub_08018E60
sub_08018E60: @ 0x08018E60
	push {r4, r5, lr}
	adds r5, r0, #0
	movs r4, #0x13
	ldrsb r4, [r5, r4]
	bl GetUnitEquippedWeapon
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl GetItemHpBonus
	movs r1, #0x12
	ldrsb r1, [r5, r1]
	adds r1, r1, r0
	cmp r4, r1
	ble _08018E94
	adds r0, r5, #0
	bl GetUnitEquippedWeapon
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl GetItemHpBonus
	movs r1, #0x12
	ldrsb r1, [r5, r1]
	adds r1, r1, r0
	strb r1, [r5, #0x13]
_08018E94:
	movs r0, #0x13
	ldrsb r0, [r5, r0]
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_08018EA0
sub_08018EA0: @ 0x08018EA0
	push {r4, lr}
	adds r4, r0, #0
	bl GetUnitEquippedWeapon
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl GetItemHpBonus
	adds r1, r0, #0
	movs r0, #0x12
	ldrsb r0, [r4, r0]
	adds r0, r0, r1
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_08018EC0
sub_08018EC0: @ 0x08018EC0
	push {r4, lr}
	adds r4, r0, #0
	bl GetUnitEquippedWeapon
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl GetItemPowBonus
	adds r1, r0, #0
	movs r0, #0x14
	ldrsb r0, [r4, r0]
	adds r0, r0, r1
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_08018EE0
sub_08018EE0: @ 0x08018EE0
	push {r4, lr}
	adds r4, r0, #0
	bl GetUnitEquippedWeapon
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	ldr r0, [r4, #0xc]
	movs r1, #0x10
	ands r0, r1
	cmp r0, #0
	bne _08018F04
	adds r0, r2, #0
	bl sub_08016514
	adds r1, r0, #0
	movs r0, #0x15
	ldrsb r0, [r4, r0]
	b _08018F16
_08018F04:
	adds r0, r2, #0
	bl sub_08016514
	adds r1, r0, #0
	movs r0, #0x15
	ldrsb r0, [r4, r0]
	lsrs r2, r0, #0x1f
	adds r0, r0, r2
	asrs r0, r0, #1
_08018F16:
	adds r0, r0, r1
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_08018F20
sub_08018F20: @ 0x08018F20
	push {r4, lr}
	adds r4, r0, #0
	bl GetUnitEquippedWeapon
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	ldr r0, [r4, #0xc]
	movs r1, #0x10
	ands r0, r1
	cmp r0, #0
	bne _08018F44
	adds r0, r2, #0
	bl sub_08016540
	adds r1, r0, #0
	movs r0, #0x16
	ldrsb r0, [r4, r0]
	b _08018F56
_08018F44:
	adds r0, r2, #0
	bl sub_08016540
	adds r1, r0, #0
	movs r0, #0x16
	ldrsb r0, [r4, r0]
	lsrs r2, r0, #0x1f
	adds r0, r0, r2
	asrs r0, r0, #1
_08018F56:
	adds r0, r0, r1
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_08018F60
sub_08018F60: @ 0x08018F60
	push {r4, lr}
	adds r4, r0, #0
	bl GetUnitEquippedWeapon
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl sub_0801656C
	adds r1, r0, #0
	movs r0, #0x17
	ldrsb r0, [r4, r0]
	adds r0, r0, r1
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_08018F80
sub_08018F80: @ 0x08018F80
	push {r4, lr}
	adds r4, r0, #0
	bl GetUnitEquippedWeapon
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl sub_08016598
	adds r1, r0, #0
	movs r0, #0x18
	ldrsb r0, [r4, r0]
	adds r0, r0, r1
	adds r4, #0x31
	ldrb r4, [r4]
	lsrs r1, r4, #4
	adds r0, r0, r1
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_08018FA8
sub_08018FA8: @ 0x08018FA8
	push {r4, lr}
	adds r4, r0, #0
	bl GetUnitEquippedWeapon
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl sub_080165C4
	adds r1, r0, #0
	movs r0, #0x19
	ldrsb r0, [r4, r0]
	adds r0, r0, r1
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_08018FC8
sub_08018FC8: @ 0x08018FC8
	adds r2, r0, #0
	ldr r1, [r2]
	ldrh r0, [r1, #6]
	cmp r0, #0
	bne _08018FE0
	ldr r1, [r2, #4]
	ldrh r0, [r1, #8]
	cmp r0, #0
	bne _08018FDE
	movs r0, #0
	b _08018FE0
_08018FDE:
	ldrh r0, [r1, #8]
_08018FE0:
	bx lr
	.align 2, 0

	thumb_func_start sub_08018FE4
sub_08018FE4: @ 0x08018FE4
	adds r2, r0, #0
	ldr r1, [r2]
	ldrb r0, [r1, #8]
	cmp r0, #0
	beq _08018FF8
	movs r0, #0xfe
	lsls r0, r0, #7
	ldrb r1, [r1, #8]
	orrs r0, r1
	b _0801900C
_08018FF8:
	ldrh r0, [r1, #6]
	cmp r0, #0
	bne _08019008
	ldr r2, [r2, #4]
	ldrh r0, [r2, #8]
	movs r1, #0
	cmp r0, #0
	beq _0801900A
_08019008:
	adds r1, r0, #0
_0801900A:
	adds r0, r1, #0
_0801900C:
	bx lr
	.align 2, 0

	thumb_func_start sub_08019010
sub_08019010: @ 0x08019010
	adds r1, r0, #0
	movs r0, #0xc0
	ldrb r2, [r1, #0xb]
	ands r0, r2
	cmp r0, #0
	beq _08019024
	adds r0, r1, #0
	adds r0, #0x38
	ldrb r0, [r0]
	b _08019026
_08019024:
	movs r0, #0
_08019026:
	bx lr

	thumb_func_start sub_08019028
sub_08019028: @ 0x08019028
	adds r0, #0x38
	strb r1, [r0]
	bx lr
	.align 2, 0

	thumb_func_start sub_08019030
sub_08019030: @ 0x08019030
	push {r4, r5, lr}
	adds r5, r0, #0
	strb r1, [r5, #0x13]
	movs r4, #0x13
	ldrsb r4, [r5, r4]
	bl GetUnitEquippedWeapon
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl GetItemHpBonus
	movs r1, #0x12
	ldrsb r1, [r5, r1]
	adds r1, r1, r0
	cmp r4, r1
	ble _08019066
	adds r0, r5, #0
	bl GetUnitEquippedWeapon
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl GetItemHpBonus
	movs r1, #0x12
	ldrsb r1, [r5, r1]
	adds r1, r1, r0
	strb r1, [r5, #0x13]
_08019066:
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start sub_0801906C
sub_0801906C: @ 0x0801906C
	push {r4, r5, lr}
	adds r5, r0, #0
	movs r4, #0x13
	ldrsb r4, [r5, r4]
	adds r4, r4, r1
	bl GetUnitEquippedWeapon
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl GetItemHpBonus
	movs r1, #0x12
	ldrsb r1, [r5, r1]
	adds r1, r1, r0
	cmp r4, r1
	ble _080190A0
	adds r0, r5, #0
	bl GetUnitEquippedWeapon
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl GetItemHpBonus
	movs r1, #0x12
	ldrsb r1, [r5, r1]
	adds r4, r1, r0
_080190A0:
	cmp r4, #0
	bge _080190A6
	movs r4, #0
_080190A6:
	strb r4, [r5, #0x13]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_080190B0
sub_080190B0: @ 0x080190B0
	push {lr}
	adds r2, r0, #0
	ldrb r0, [r2, #0x1b]
	cmp r0, #0
	beq _080190D4
	ldr r1, _080190D0 @ =gUnitLut
	ldrb r2, [r2, #0x1b]
	lsls r0, r2, #2
	adds r0, r0, r1
	ldr r0, [r0]
	ldr r0, [r0]
	ldrh r0, [r0]
	bl sub_08013318
	b _080190D8
	.align 2, 0
_080190D0: .4byte gUnitLut
_080190D4:
	ldr r0, _080190DC @ =0x08C02144
	ldr r0, [r0]
_080190D8:
	pop {r1}
	bx r1
	.align 2, 0
_080190DC: .4byte 0x08C02144

	thumb_func_start sub_080190E0
sub_080190E0: @ 0x080190E0
	ldr r1, _080190F0 @ =0x08C02144
	adds r0, #0x30
	ldrb r0, [r0]
	lsls r0, r0, #0x1c
	lsrs r0, r0, #0x1a
	adds r0, r0, r1
	ldr r0, [r0]
	bx lr
	.align 2, 0
_080190F0: .4byte 0x08C02144

	thumb_func_start GetUnit
GetUnit: @ 0x080190F4
	ldr r2, _08019104 @ =gUnitLut
	movs r1, #0xff
	ands r1, r0
	lsls r1, r1, #2
	adds r1, r1, r2
	ldr r0, [r1]
	bx lr
	.align 2, 0
_08019104: .4byte gUnitLut

	thumb_func_start GetClassData
GetClassData: @ 0x08019108
	adds r1, r0, #0
	cmp r1, #0
	ble _0801911C
	movs r0, #0x54
	muls r0, r1, r0
	ldr r1, _08019118 @ =0x08C4F468
	adds r0, r0, r1
	b _0801911E
	.align 2, 0
_08019118: .4byte 0x08C4F468
_0801911C:
	movs r0, #0
_0801911E:
	bx lr

	thumb_func_start GetCharacterData
GetCharacterData: @ 0x08019120
	adds r1, r0, #0
	cmp r1, #0
	ble _08019134
	movs r0, #0x34
	muls r0, r1, r0
	ldr r1, _08019130 @ =0x08C4C124
	adds r0, r0, r1
	b _08019136
	.align 2, 0
_08019130: .4byte 0x08C4C124
_08019134:
	movs r0, #0
_08019136:
	bx lr

	thumb_func_start UnitRemoveItem
UnitRemoveItem: @ 0x08019138
	push {lr}
	lsls r1, r1, #1
	adds r2, r0, #0
	adds r2, #0x1e
	adds r2, r2, r1
	movs r1, #0
	strh r1, [r2]
	bl UnitRemoveInvalidItems
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start CanUnitCrossTerrain
CanUnitCrossTerrain: @ 0x08019150
	push {r4, lr}
	adds r4, r1, #0
	bl GetUnitMovementCost
	movs r1, #0
	adds r0, r0, r4
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	ble _08019168
	movs r1, #1
_08019168:
	adds r0, r1, #0
	pop {r4}
	pop {r1}
	bx r1
