

	.include "macro.inc"
	.syntax unified

	thumb_func_start InitUnits
InitUnits: @ 0x080178C8
	push {r4, r5, r6, r7, lr}
	movs r5, #0
	ldr r7, _080178F4 @ =0x08C0216C
	movs r6, #0xff
_080178D0:
	adds r0, r5, #0
	ands r0, r6
	lsls r0, r0, #2
	adds r0, r0, r7
	ldr r4, [r0]
	cmp r4, #0
	beq _080178E6
	adds r0, r4, #0
	bl ClearUnit
	strb r5, [r4, #0xb]
_080178E6:
	adds r5, #1
	cmp r5, #0xff
	ble _080178D0
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080178F4: .4byte 0x08C0216C

	thumb_func_start ClearUnit
ClearUnit: @ 0x080178F8
	push {r4, r5, lr}
	sub sp, #4
	adds r4, r0, #0
	ldrb r5, [r4, #0xb]
	mov r1, sp
	movs r0, #0
	strh r0, [r1]
	ldr r2, _0801791C @ =0x01000024
	mov r0, sp
	adds r1, r4, #0
	bl CpuSet
	strb r5, [r4, #0xb]
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0801791C: .4byte 0x01000024

	thumb_func_start CopyUnit
CopyUnit: @ 0x08017920
	push {r4, r5, lr}
	adds r2, r0, #0
	adds r4, r1, #0
	ldrb r5, [r4, #0xb]
	adds r0, r4, #0
	adds r1, r2, #0
	movs r2, #0x48
	bl memcpy
	strb r5, [r4, #0xb]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start GetFreeUnit
GetFreeUnit: @ 0x0801793C
	push {r4, r5, lr}
	adds r3, r0, #0
	adds r3, #0x40
	adds r2, r0, #1
	cmp r2, r3
	bge _0801796A
	ldr r5, _08017960 @ =0x08C0216C
	movs r4, #0xff
_0801794C:
	adds r0, r2, #0
	ands r0, r4
	lsls r0, r0, #2
	adds r0, r0, r5
	ldr r1, [r0]
	ldr r0, [r1]
	cmp r0, #0
	bne _08017964
	adds r0, r1, #0
	b _0801796C
	.align 2, 0
_08017960: .4byte 0x08C0216C
_08017964:
	adds r2, #1
	cmp r2, r3
	blt _0801794C
_0801796A:
	movs r0, #0
_0801796C:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start GetFreeBlueUnit
GetFreeBlueUnit: @ 0x08017974
	push {r4, r5, lr}
	movs r5, #0x40
	ldrb r4, [r0]
	bl sub_080307E4
	movs r2, #1
	ldr r4, _08017998 @ =0x08C0216C
	movs r3, #0xff
_08017984:
	adds r0, r2, #0
	ands r0, r3
	lsls r0, r0, #2
	adds r0, r0, r4
	ldr r1, [r0]
	ldr r0, [r1]
	cmp r0, #0
	bne _0801799C
	adds r0, r1, #0
	b _080179A4
	.align 2, 0
_08017998: .4byte 0x08C0216C
_0801799C:
	adds r2, #1
	cmp r2, r5
	blt _08017984
	movs r0, #0
_080179A4:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start GetUnitFogViewRange
GetUnitFogViewRange: @ 0x080179AC
	adds r2, r0, #0
	ldr r0, _080179D4 @ =0x0202BBF4
	ldrb r3, [r0, #0xd]
	ldr r0, [r2]
	ldr r1, [r2, #4]
	ldr r0, [r0, #0x28]
	ldr r1, [r1, #0x28]
	orrs r0, r1
	movs r1, #8
	ands r0, r1
	cmp r0, #0
	beq _080179C6
	adds r3, #5
_080179C6:
	adds r0, r2, #0
	adds r0, #0x31
	ldrb r0, [r0]
	lsls r0, r0, #0x1c
	lsrs r0, r0, #0x1c
	adds r0, r3, r0
	bx lr
	.align 2, 0
_080179D4: .4byte 0x0202BBF4

	thumb_func_start SetUnitStatus
SetUnitStatus: @ 0x080179D8
	adds r2, r1, #0
	cmp r2, #0
	bne _080179E2
	adds r0, #0x30
	b _080179EC
_080179E2:
	adds r0, #0x30
	movs r1, #0xf
	ands r2, r1
	movs r1, #0x50
	orrs r2, r1
_080179EC:
	strb r2, [r0]
	bx lr

	thumb_func_start GetUnitStatusName
GetUnitStatusName: @ 0x080179F0
	adds r0, #0x30
	movs r3, #0xf
	lsls r2, r2, #4
	ands r1, r3
	orrs r2, r1
	strb r2, [r0]
	bx lr
	.align 2, 0

	thumb_func_start GetUnitSMSId
GetUnitSMSId: @ 0x08017A00
	push {lr}
	adds r2, r0, #0
	ldr r0, [r2, #0xc]
	movs r1, #0x80
	lsls r1, r1, #4
	ands r0, r1
	cmp r0, #0
	bne _08017A16
	ldr r0, [r2, #4]
	ldrb r0, [r0, #6]
	b _08017A40
_08017A16:
	ldrb r0, [r2, #0x1c]
	bl sub_0802C7D8
	ldrb r0, [r0, #3]
	cmp r0, #0x35
	beq _08017A36
	cmp r0, #0x35
	bgt _08017A2C
	cmp r0, #0x34
	beq _08017A32
	b _08017A3E
_08017A2C:
	cmp r0, #0x36
	beq _08017A3A
	b _08017A3E
_08017A32:
	movs r0, #0x4f
	b _08017A40
_08017A36:
	movs r0, #0x50
	b _08017A40
_08017A3A:
	movs r0, #0x51
	b _08017A40
_08017A3E:
	movs r0, #0
_08017A40:
	pop {r1}
	bx r1

	thumb_func_start UnitAddItem
UnitAddItem: @ 0x08017A44
	movs r3, #0
	adds r2, r0, #0
	adds r2, #0x1e
_08017A4A:
	ldrh r0, [r2]
	cmp r0, #0
	bne _08017A56
	strh r1, [r2]
	movs r0, #1
	b _08017A60
_08017A56:
	adds r2, #2
	adds r3, #1
	cmp r3, #4
	ble _08017A4A
	movs r0, #0
_08017A60:
	bx lr
	.align 2, 0

	thumb_func_start UnitClearInventory
UnitClearInventory: @ 0x08017A64
	movs r2, #0
	movs r1, #4
	adds r0, #0x26
_08017A6A:
	strh r2, [r0]
	subs r0, #2
	subs r1, #1
	cmp r1, #0
	bge _08017A6A
	bx lr
	.align 2, 0

	thumb_func_start UnitRemoveInvalidItems
UnitRemoveInvalidItems: @ 0x08017A78
	push {r4, r5, r6, lr}
	sub sp, #0xc
	mov r2, sp
	movs r3, #0
	adds r5, r0, #0
	adds r5, #0x1e
	adds r4, r5, #0
	movs r6, #0
_08017A88:
	lsls r0, r3, #1
	adds r1, r4, r0
	ldrh r0, [r1]
	cmp r0, #0
	beq _08017A96
	strh r0, [r2]
	adds r2, #2
_08017A96:
	strh r6, [r1]
	adds r0, r3, #1
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	cmp r3, #4
	bls _08017A88
	movs r0, #0
	strh r0, [r2]
	movs r3, #0
	adds r4, r5, #0
_08017AAA:
	lsls r2, r3, #1
	mov r1, sp
	adds r0, r1, r2
	ldrh r1, [r0]
	cmp r1, #0
	beq _08017AC4
	adds r0, r4, r2
	strh r1, [r0]
	adds r0, r3, #1
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	cmp r3, #4
	bls _08017AAA
_08017AC4:
	add sp, #0xc
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	thumb_func_start GetUnitItemCount
GetUnitItemCount: @ 0x08017ACC
	movs r2, #4
	adds r1, r0, #0
	adds r1, #0x26
_08017AD2:
	ldrh r0, [r1]
	cmp r0, #0
	beq _08017ADC
	adds r0, r2, #1
	b _08017AE6
_08017ADC:
	subs r1, #2
	subs r2, #1
	cmp r2, #0
	bge _08017AD2
	movs r0, #0
_08017AE6:
	bx lr

	thumb_func_start UnitHasItem
UnitHasItem: @ 0x08017AE8
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r0, r5, #0
	bl GetItemIndex
	adds r5, r0, #0
	movs r6, #0
	ldrh r0, [r4, #0x1e]
	cmp r0, #0
	beq _08017B1C
	adds r4, #0x1e
_08017B00:
	ldrh r0, [r4]
	bl GetItemIndex
	cmp r0, r5
	bne _08017B0E
	movs r0, #1
	b _08017B1E
_08017B0E:
	adds r4, #2
	adds r6, #1
	cmp r6, #4
	bgt _08017B1C
	ldrh r0, [r4]
	cmp r0, #0
	bne _08017B00
_08017B1C:
	movs r0, #0
_08017B1E:
	pop {r4, r5, r6}
	pop {r1}
	bx r1

	thumb_func_start sub_08017B24
sub_08017B24: @ 0x08017B24
	push {r4, r5, lr}
	adds r4, r0, #0
	movs r5, #0
	b _08017B36
_08017B2C:
	adds r0, r4, #0
	bl LoadUnit
	adds r4, #0x10
	adds r5, #1
_08017B36:
	ldrb r0, [r4]
	cmp r0, #0
	bne _08017B2C
	adds r0, r5, #0
	pop {r4, r5}
	pop {r1}
	bx r1

	thumb_func_start sub_08017B44
sub_08017B44: @ 0x08017B44
	adds r2, r0, #0
	movs r0, #0x14
	ldrsb r0, [r2, r0]
	cmp r0, #3
	ble _08017B56
	lsrs r1, r0, #0x1f
	adds r0, r0, r1
	asrs r0, r0, #1
	strb r0, [r2, #0x14]
_08017B56:
	movs r0, #0x17
	ldrsb r0, [r2, r0]
	cmp r0, #3
	ble _08017B66
	lsrs r1, r0, #0x1f
	adds r0, r0, r1
	asrs r0, r0, #1
	strb r0, [r2, #0x17]
_08017B66:
	movs r0, #0x18
	ldrsb r0, [r2, r0]
	cmp r0, #3
	ble _08017B76
	lsrs r1, r0, #0x1f
	adds r0, r0, r1
	asrs r0, r0, #1
	strb r0, [r2, #0x18]
_08017B76:
	bx lr

	thumb_func_start LoadUnit
LoadUnit: @ 0x08017B78
	push {r4, r5, lr}
	adds r5, r0, #0
	movs r4, #0
	ldrb r1, [r5, #3]
	lsls r0, r1, #0x1d
	lsrs r0, r0, #0x1e
	cmp r0, #1
	beq _08017BA4
	cmp r0, #1
	bgt _08017B92
	cmp r0, #0
	beq _08017B98
	b _08017BAC
_08017B92:
	cmp r0, #2
	beq _08017BA0
	b _08017BAC
_08017B98:
	adds r0, r5, #0
	bl GetFreeBlueUnit
	b _08017BAA
_08017BA0:
	movs r0, #0x80
	b _08017BA6
_08017BA4:
	movs r0, #0x40
_08017BA6:
	bl GetFreeUnit
_08017BAA:
	adds r4, r0, #0
_08017BAC:
	cmp r4, #0
	bne _08017BB4
	movs r0, #0
	b _08017C52
_08017BB4:
	adds r0, r4, #0
	bl ClearUnit
	adds r0, r4, #0
	adds r1, r5, #0
	bl UnitInitFromDefinition
	ldr r1, [r4]
	adds r0, r4, #0
	bl UnitLoadStatsFromChracter
	adds r0, r4, #0
	bl sub_0802C2D4
	movs r0, #1
	ldrb r1, [r5, #3]
	ands r0, r1
	cmp r0, #0
	beq _08017C0A
	movs r0, #0xc0
	ldrb r1, [r4, #0xb]
	ands r0, r1
	cmp r0, #0
	bne _08017BF4
	adds r0, r4, #0
	bl UnitAutolevelRealistic
	adds r0, r4, #0
	adds r1, r5, #0
	bl UnitAutolevelWExp
	b _08017C0A
_08017BF4:
	adds r0, r4, #0
	bl UnitAutolevel
	adds r0, r4, #0
	adds r1, r5, #0
	bl UnitAutolevelWExp
	ldrb r1, [r5, #2]
	adds r0, r4, #0
	adds r0, #0x38
	strb r1, [r0]
_08017C0A:
	adds r0, r4, #0
	bl FixROMUnitStructPtr
	adds r0, r4, #0
	bl UnitLoadSupports
	ldr r0, [r4]
	ldr r1, [r4, #4]
	ldr r0, [r0, #0x28]
	ldr r1, [r1, #0x28]
	orrs r0, r1
	movs r1, #0x80
	lsls r1, r1, #0x14
	ands r0, r1
	cmp r0, #0
	beq _08017C34
	ldr r0, [r4, #0xc]
	movs r1, #0x80
	lsls r1, r1, #5
	orrs r0, r1
	str r0, [r4, #0xc]
_08017C34:
	adds r0, r4, #0
	bl UnitCheckStatCaps
	adds r0, r4, #0
	bl sub_08016BC4
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl sub_080164BC
	movs r1, #0x12
	ldrsb r1, [r4, r1]
	adds r1, r1, r0
	strb r1, [r4, #0x13]
	adds r0, r4, #0
_08017C52:
	pop {r4, r5}
	pop {r1}
	bx r1

	thumb_func_start UnitInitFromDefinition
UnitInitFromDefinition: @ 0x08017C58
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	adds r6, r1, #0
	ldrb r1, [r6]
	cmp r1, #0
	bgt _08017C68
	movs r1, #0
	b _08017C70
_08017C68:
	movs r0, #0x34
	muls r1, r0, r1
	ldr r0, _08017C80 @ =0x08C4C124
	adds r1, r1, r0
_08017C70:
	str r1, [r5]
	ldrb r0, [r6, #1]
	cmp r0, #0
	beq _08017C84
	adds r1, r0, #0
	cmp r1, #0
	ble _08017C8A
	b _08017C8E
	.align 2, 0
_08017C80: .4byte 0x08C4C124
_08017C84:
	ldrb r1, [r1, #5]
	cmp r1, #0
	bgt _08017C8E
_08017C8A:
	movs r1, #0
	b _08017C96
_08017C8E:
	movs r0, #0x54
	muls r1, r0, r1
	ldr r0, _08017CE0 @ =0x08C4F468
	adds r1, r1, r0
_08017C96:
	str r1, [r5, #4]
	ldrb r1, [r6, #3]
	lsrs r0, r1, #3
	strb r0, [r5, #8]
	ldrb r0, [r6, #6]
	strb r0, [r5, #0x10]
	ldrb r0, [r6, #7]
	strb r0, [r5, #0x11]
	adds r1, r6, #0
	adds r1, #8
	ldrb r0, [r6, #8]
	cmp r0, #0
	beq _08017CD0
	adds r4, r1, #0
	adds r7, r4, #0
_08017CB4:
	ldrb r0, [r4]
	bl sub_080165F0
	adds r1, r0, #0
	adds r0, r5, #0
	bl UnitAddItem
	adds r4, #1
	adds r0, r7, #3
	cmp r4, r0
	bgt _08017CD0
	ldrb r0, [r4]
	cmp r0, #0
	bne _08017CB4
_08017CD0:
	adds r0, r5, #0
	adds r1, r6, #0
	bl sub_08037804
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08017CE0: .4byte 0x08C4F468

	thumb_func_start UnitLoadItemsFromDefinition
UnitLoadItemsFromDefinition: @ 0x08017CE4
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	bl UnitClearInventory
	adds r1, r4, #0
	adds r1, #8
	ldrb r0, [r4, #8]
	cmp r0, #0
	beq _08017D18
	adds r4, r1, #0
	adds r6, r4, #0
_08017CFC:
	ldrb r0, [r4]
	bl sub_080165F0
	adds r1, r0, #0
	adds r0, r5, #0
	bl UnitAddItem
	adds r4, #1
	adds r0, r6, #3
	cmp r4, r0
	bgt _08017D18
	ldrb r0, [r4]
	cmp r0, #0
	bne _08017CFC
_08017D18:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start UnitLoadStatsFromChracter
UnitLoadStatsFromChracter: @ 0x08017D20
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	ldr r2, [r4, #4]
	ldrb r3, [r1, #0xc]
	ldrb r5, [r2, #0xb]
	adds r0, r3, r5
	movs r3, #0
	strb r0, [r4, #0x12]
	ldrb r6, [r1, #0xd]
	ldrb r5, [r2, #0xc]
	adds r0, r6, r5
	strb r0, [r4, #0x14]
	ldrb r6, [r1, #0xe]
	ldrb r5, [r2, #0xd]
	adds r0, r6, r5
	strb r0, [r4, #0x15]
	ldrb r6, [r1, #0xf]
	ldrb r5, [r2, #0xe]
	adds r0, r6, r5
	strb r0, [r4, #0x16]
	ldrb r6, [r1, #0x10]
	ldrb r5, [r2, #0xf]
	adds r0, r6, r5
	strb r0, [r4, #0x17]
	ldrb r6, [r1, #0x11]
	ldrb r2, [r2, #0x10]
	adds r0, r6, r2
	strb r0, [r4, #0x18]
	ldrb r0, [r1, #0x12]
	strb r0, [r4, #0x19]
	strb r3, [r4, #0x1a]
	movs r1, #0
	adds r3, r4, #0
	adds r3, #0x28
_08017D64:
	adds r2, r3, r1
	ldr r0, [r4, #4]
	adds r0, #0x2c
	adds r0, r0, r1
	ldrb r0, [r0]
	strb r0, [r2]
	ldr r0, [r4]
	adds r0, #0x14
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #0
	beq _08017D7E
	strb r0, [r2]
_08017D7E:
	adds r1, #1
	cmp r1, #7
	ble _08017D64
	movs r1, #0xc0
	ldrb r0, [r4, #0xb]
	ands r1, r0
	cmp r1, #0
	bne _08017DA0
	ldrb r3, [r4, #8]
	cmp r3, #0x14
	beq _08017DA0
	ldr r0, [r4]
	ldrb r0, [r0, #4]
	cmp r0, #0x28
	beq _08017DA0
	strb r1, [r4, #9]
	b _08017DA4
_08017DA0:
	movs r0, #0xff
	strb r0, [r4, #9]
_08017DA4:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start FixROMUnitStructPtr
FixROMUnitStructPtr: @ 0x08017DAC
	adds r2, r0, #0
	ldr r3, [r2]
	ldr r1, [r2, #4]
	ldr r0, [r3, #0x28]
	ldr r1, [r1, #0x28]
	orrs r0, r1
	movs r1, #0x80
	lsls r1, r1, #0x10
	ands r0, r1
	cmp r0, #0
	beq _08017DD8
	ldrb r1, [r3, #4]
	subs r1, #1
	cmp r1, #0
	bgt _08017DCE
	movs r1, #0
	b _08017DD6
_08017DCE:
	movs r0, #0x34
	muls r1, r0, r1
	ldr r0, _08017DDC @ =0x08C4C124
	adds r1, r1, r0
_08017DD6:
	str r1, [r2]
_08017DD8:
	bx lr
	.align 2, 0
_08017DDC: .4byte 0x08C4C124

	thumb_func_start UnitLoadSupports
UnitLoadSupports: @ 0x08017DE0
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	bl sub_08026AB4
	adds r6, r0, #0
	movs r4, #0
	cmp r4, r6
	bge _08017E06
	adds r7, r5, #0
	adds r7, #0x32
_08017DF4:
	adds r0, r5, #0
	adds r1, r4, #0
	bl sub_08026C80
	adds r1, r7, r4
	strb r0, [r1]
	adds r4, #1
	cmp r4, r6
	blt _08017DF4
_08017E06:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start UnitAutolevelWExp
UnitAutolevelWExp: @ 0x08017E0C
	push {r4, r5, r6, r7, lr}
	adds r6, r0, #0
	movs r0, #1
	ldrb r1, [r1, #3]
	ands r0, r1
	cmp r0, #0
	beq _08017EA4
	movs r7, #0
	b _08017E9A
_08017E1E:
	lsls r1, r7, #1
	adds r0, r6, #0
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r4, [r0]
	adds r0, r4, #0
	bl sub_08017684
	movs r1, #5
	ands r1, r0
	cmp r1, #0
	beq _08017E98
	adds r0, r4, #0
	bl sub_08017684
	movs r1, #1
	ands r1, r0
	cmp r1, #0
	beq _08017E52
	adds r0, r6, #0
	adds r1, r4, #0
	bl sub_08016620
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08017E98
_08017E52:
	adds r0, r4, #0
	bl sub_08017684
	movs r1, #4
	ands r1, r0
	cmp r1, #0
	beq _08017E6E
	adds r0, r6, #0
	adds r1, r4, #0
	bl sub_08016850
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08017E98
_08017E6E:
	adds r0, r4, #0
	bl sub_08017684
	ldr r1, _08017EAC @ =0x003D3C00
	ands r1, r0
	cmp r1, #0
	bne _08017E98
	adds r0, r4, #0
	bl sub_08017664
	adds r1, r6, #0
	adds r1, #0x28
	adds r5, r1, r0
	ldrb r0, [r5]
	cmp r0, #0
	bne _08017E90
	movs r4, #0
_08017E90:
	adds r0, r4, #0
	bl sub_080177C0
	strb r0, [r5]
_08017E98:
	adds r7, #1
_08017E9A:
	adds r0, r6, #0
	bl GetUnitItemCount
	cmp r7, r0
	blt _08017E1E
_08017EA4:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08017EAC: .4byte 0x003D3C00

	thumb_func_start UnitAutolevelCore
UnitAutolevelCore: @ 0x08017EB0
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r2, #0
	cmp r5, #0
	beq _08017F34
	ldr r0, [r4, #4]
	ldrb r0, [r0, #0x1b]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r1, r5, #0
	bl sub_08029AB4
	ldrb r1, [r4, #0x12]
	adds r0, r1, r0
	strb r0, [r4, #0x12]
	ldr r0, [r4, #4]
	ldrb r0, [r0, #0x1c]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r1, r5, #0
	bl sub_08029AB4
	ldrb r1, [r4, #0x14]
	adds r0, r1, r0
	strb r0, [r4, #0x14]
	ldr r0, [r4, #4]
	ldrb r0, [r0, #0x1d]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r1, r5, #0
	bl sub_08029AB4
	ldrb r1, [r4, #0x15]
	adds r0, r1, r0
	strb r0, [r4, #0x15]
	ldr r0, [r4, #4]
	ldrb r0, [r0, #0x1e]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r1, r5, #0
	bl sub_08029AB4
	ldrb r1, [r4, #0x16]
	adds r0, r1, r0
	strb r0, [r4, #0x16]
	ldr r0, [r4, #4]
	ldrb r0, [r0, #0x1f]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r1, r5, #0
	bl sub_08029AB4
	ldrb r1, [r4, #0x17]
	adds r0, r1, r0
	strb r0, [r4, #0x17]
	ldr r0, [r4, #4]
	adds r0, #0x20
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r1, r5, #0
	bl sub_08029AB4
	ldrb r1, [r4, #0x18]
	adds r0, r1, r0
	strb r0, [r4, #0x18]
_08017F34:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start UnitApplyBonusLevels
UnitApplyBonusLevels: @ 0x08017F3C
	push {r4, lr}
	adds r4, r0, #0
	adds r2, r1, #0
	ldr r0, [r4, #4]
	ldrb r1, [r0, #4]
	adds r0, r4, #0
	bl UnitAutolevelCore
	adds r0, r4, #0
	bl UnitCheckStatCaps
	adds r0, r4, #0
	bl sub_08016BC4
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl sub_080164BC
	movs r1, #0x12
	ldrsb r1, [r4, r1]
	adds r1, r1, r0
	strb r1, [r4, #0x13]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start UnitAutolevel
UnitAutolevel: @ 0x08017F70
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r0, [r5]
	ldr r2, [r5, #4]
	ldr r0, [r0, #0x28]
	ldr r1, [r2, #0x28]
	orrs r0, r1
	movs r1, #0x80
	lsls r1, r1, #1
	ands r0, r1
	cmp r0, #0
	beq _08017F98
	ldrb r4, [r2, #5]
	bl sub_08034D44
	adds r2, r0, #0
	adds r0, r5, #0
	adds r1, r4, #0
	bl UnitAutolevelCore
_08017F98:
	ldr r0, [r5, #4]
	ldrb r1, [r0, #4]
	movs r2, #8
	ldrsb r2, [r5, r2]
	subs r2, #1
	adds r0, r5, #0
	bl UnitAutolevelCore
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start UnitAutolevelRealistic
UnitAutolevelRealistic: @ 0x08017FB0
	push {r4, r5, lr}
	adds r4, r0, #0
	movs r3, #8
	ldrsb r3, [r4, r3]
	ldr r0, [r4]
	movs r2, #0xb
	ldrsb r2, [r0, r2]
	ldr r1, [r4, #4]
	ldr r0, [r0, #0x28]
	ldr r1, [r1, #0x28]
	orrs r0, r1
	movs r1, #0x80
	lsls r1, r1, #1
	ands r0, r1
	cmp r0, #0
	beq _08017FD8
	adds r0, r2, #0
	subs r0, #0xe
	subs r0, r3, r0
	b _08017FDA
_08017FD8:
	subs r0, r3, r2
_08017FDA:
	cmp r0, #0
	ble _0801804E
	adds r5, r0, #0
_08017FE0:
	ldr r0, [r4]
	ldrb r0, [r0, #0x1c]
	bl sub_08029A90
	ldrb r1, [r4, #0x12]
	adds r0, r1, r0
	strb r0, [r4, #0x12]
	ldr r0, [r4]
	ldrb r0, [r0, #0x1d]
	bl sub_08029A90
	ldrb r1, [r4, #0x14]
	adds r0, r1, r0
	strb r0, [r4, #0x14]
	ldr r0, [r4]
	ldrb r0, [r0, #0x1e]
	bl sub_08029A90
	ldrb r1, [r4, #0x15]
	adds r0, r1, r0
	strb r0, [r4, #0x15]
	ldr r0, [r4]
	ldrb r0, [r0, #0x1f]
	bl sub_08029A90
	ldrb r1, [r4, #0x16]
	adds r0, r1, r0
	strb r0, [r4, #0x16]
	ldr r0, [r4]
	adds r0, #0x20
	ldrb r0, [r0]
	bl sub_08029A90
	ldrb r1, [r4, #0x17]
	adds r0, r1, r0
	strb r0, [r4, #0x17]
	ldr r0, [r4]
	adds r0, #0x21
	ldrb r0, [r0]
	bl sub_08029A90
	ldrb r1, [r4, #0x18]
	adds r0, r1, r0
	strb r0, [r4, #0x18]
	ldr r0, [r4]
	adds r0, #0x22
	ldrb r0, [r0]
	bl sub_08029A90
	ldrb r1, [r4, #0x19]
	adds r0, r1, r0
	strb r0, [r4, #0x19]
	subs r5, #1
	cmp r5, #0
	bne _08017FE0
_0801804E:
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start UnitCheckStatCaps
UnitCheckStatCaps: @ 0x08018054
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	movs r1, #0x12
	ldrsb r1, [r4, r1]
	movs r0, #0xc0
	ldrb r2, [r4, #0xb]
	ands r0, r2
	cmp r0, #0x80
	bne _0801806C
	cmp r1, #0x78
	bgt _08018070
	b _08018080
_0801806C:
	cmp r1, #0x3c
	ble _08018080
_08018070:
	movs r0, #0xc0
	ldrb r1, [r4, #0xb]
	ands r0, r1
	movs r1, #0x3c
	cmp r0, #0x80
	bne _0801807E
	movs r1, #0x78
_0801807E:
	strb r1, [r4, #0x12]
_08018080:
	ldr r7, [r4, #4]
	movs r1, #0x14
	ldrsb r1, [r4, r1]
	ldrb r2, [r7, #0x14]
	movs r0, #0x14
	ldrsb r0, [r7, r0]
	adds r5, r7, #0
	cmp r1, r0
	ble _08018094
	strb r2, [r4, #0x14]
_08018094:
	movs r1, #0x15
	ldrsb r1, [r4, r1]
	ldrb r2, [r5, #0x15]
	movs r0, #0x15
	ldrsb r0, [r5, r0]
	cmp r1, r0
	ble _080180A4
	strb r2, [r4, #0x15]
_080180A4:
	movs r1, #0x16
	ldrsb r1, [r4, r1]
	ldrb r2, [r5, #0x16]
	movs r0, #0x16
	ldrsb r0, [r5, r0]
	cmp r1, r0
	ble _080180B4
	strb r2, [r4, #0x16]
_080180B4:
	movs r1, #0x17
	ldrsb r1, [r4, r1]
	ldrb r2, [r5, #0x17]
	movs r0, #0x17
	ldrsb r0, [r5, r0]
	cmp r1, r0
	ble _080180C4
	strb r2, [r4, #0x17]
_080180C4:
	movs r1, #0x18
	ldrsb r1, [r4, r1]
	ldrb r2, [r5, #0x18]
	movs r0, #0x18
	ldrsb r0, [r5, r0]
	cmp r1, r0
	ble _080180D4
	strb r2, [r4, #0x18]
_080180D4:
	movs r0, #0x19
	ldrsb r0, [r4, r0]
	cmp r0, #0x1e
	ble _080180E0
	movs r0, #0x1e
	strb r0, [r4, #0x19]
_080180E0:
	movs r3, #0x1a
	ldrsb r3, [r4, r3]
	movs r2, #0x19
	ldrsb r2, [r5, r2]
	movs r0, #0x11
	ldrsb r0, [r5, r0]
	ldr r6, [r4]
	movs r1, #0x13
	ldrsb r1, [r6, r1]
	adds r0, r0, r1
	subs r2, r2, r0
	cmp r3, r2
	ble _08018106
	ldrb r2, [r5, #0x11]
	ldrb r6, [r6, #0x13]
	adds r0, r2, r6
	ldrb r5, [r5, #0x19]
	subs r0, r5, r0
	strb r0, [r4, #0x1a]
_08018106:
	movs r2, #0x1d
	ldrsb r2, [r4, r2]
	movs r1, #0x12
	ldrsb r1, [r7, r1]
	movs r0, #0xf
	subs r0, r0, r1
	cmp r2, r0
	ble _0801811E
	movs r0, #0xf
	ldrb r7, [r7, #0x12]
	subs r0, r0, r7
	strb r0, [r4, #0x1d]
_0801811E:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start GetUnitFromCharId
GetUnitFromCharId: @ 0x08018124
	push {r4, r5, lr}
	adds r3, r0, #0
	movs r2, #1
	ldr r5, _0801814C @ =0x08C0216C
	movs r4, #0xff
_0801812E:
	adds r0, r2, #0
	ands r0, r4
	lsls r0, r0, #2
	adds r0, r0, r5
	ldr r1, [r0]
	cmp r1, #0
	beq _08018150
	ldr r0, [r1]
	cmp r0, #0
	beq _08018150
	ldrb r0, [r0, #4]
	cmp r0, r3
	bne _08018150
	adds r0, r1, #0
	b _08018158
	.align 2, 0
_0801814C: .4byte 0x08C0216C
_08018150:
	adds r2, #1
	cmp r2, #0xff
	ble _0801812E
	movs r0, #0
_08018158:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start GetUnitFromCharIdAndFaction
GetUnitFromCharIdAndFaction: @ 0x08018160
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r3, r1, #0
	adds r3, #0x40
	adds r1, #1
	cmp r1, r3
	bge _0801819A
	ldr r6, _08018190 @ =0x08C0216C
	movs r5, #0xff
_08018172:
	adds r0, r1, #0
	ands r0, r5
	lsls r0, r0, #2
	adds r0, r0, r6
	ldr r2, [r0]
	cmp r2, #0
	beq _08018194
	ldr r0, [r2]
	cmp r0, #0
	beq _08018194
	ldrb r0, [r0, #4]
	cmp r0, r4
	bne _08018194
	adds r0, r2, #0
	b _0801819C
	.align 2, 0
_08018190: .4byte 0x08C0216C
_08018194:
	adds r1, #1
	cmp r1, r3
	blt _08018172
_0801819A:
	movs r0, #0
_0801819C:
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start CanUnitRescue
CanUnitRescue: @ 0x080181A4
	push {r4, lr}
	adds r4, r1, #0
	bl GetUnitAid
	ldr r1, [r4, #4]
	movs r2, #0x11
	ldrsb r2, [r1, r2]
	ldr r1, [r4]
	ldrb r1, [r1, #0x13]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	adds r2, r2, r1
	movs r1, #0x1a
	ldrsb r1, [r4, r1]
	adds r2, r2, r1
	movs r1, #0
	cmp r0, r2
	blt _080181CA
	movs r1, #1
_080181CA:
	adds r0, r1, #0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start UnitRescue
UnitRescue: @ 0x080181D4
	ldr r2, [r0, #0xc]
	movs r3, #0x10
	orrs r2, r3
	str r2, [r0, #0xc]
	ldr r2, [r1, #0xc]
	movs r3, #0x21
	orrs r2, r3
	str r2, [r1, #0xc]
	ldrb r2, [r1, #0xb]
	strb r2, [r0, #0x1b]
	ldrb r2, [r0, #0xb]
	strb r2, [r1, #0x1b]
	ldrb r2, [r0, #0x10]
	strb r2, [r1, #0x10]
	ldrb r0, [r0, #0x11]
	strb r0, [r1, #0x11]
	bx lr
	.align 2, 0

	thumb_func_start UnitDrop
UnitDrop: @ 0x080181F8
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	adds r6, r1, #0
	adds r7, r2, #0
	ldr r1, _08018244 @ =0x08C0216C
	ldrb r2, [r5, #0x1b]
	lsls r0, r2, #2
	adds r0, r0, r1
	ldr r2, [r0]
	adds r4, r2, #0
	ldr r0, [r5, #0xc]
	movs r1, #0x31
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r5, #0xc]
	ldr r3, [r2, #0xc]
	movs r0, #0x32
	rsbs r0, r0, #0
	ands r3, r0
	str r3, [r2, #0xc]
	movs r0, #0xc0
	ldrb r1, [r2, #0xb]
	ands r0, r1
	ldr r1, _08018248 @ =0x0202BBF4
	ldrb r1, [r1, #0xf]
	cmp r0, r1
	bne _08018234
	movs r0, #2
	orrs r3, r0
	str r3, [r2, #0xc]
_08018234:
	movs r0, #0
	strb r0, [r5, #0x1b]
	strb r0, [r4, #0x1b]
	strb r6, [r4, #0x10]
	strb r7, [r4, #0x11]
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08018244: .4byte 0x08C0216C
_08018248: .4byte 0x0202BBF4

	thumb_func_start UnitGive
UnitGive: @ 0x0801824C
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r6, r1, #0
	ldr r1, _0801827C @ =0x08C0216C
	ldrb r2, [r4, #0x1b]
	lsls r0, r2, #2
	adds r0, r0, r1
	ldr r5, [r0]
	adds r0, r6, #0
	adds r1, r5, #0
	bl CanUnitRescue
	adds r0, r4, #0
	movs r1, #0
	movs r2, #0
	bl UnitDrop
	adds r0, r6, #0
	adds r1, r5, #0
	bl UnitRescue
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_0801827C: .4byte 0x08C0216C

	thumb_func_start UnitKill
UnitKill: @ 0x08018280
	push {lr}
	adds r2, r0, #0
	movs r0, #0xc0
	ldrb r1, [r2, #0xb]
	ands r0, r1
	cmp r0, #0
	bne _0801829E
	ldr r0, [r2, #0xc]
	movs r1, #5
	orrs r0, r1
	str r0, [r2, #0xc]
	adds r0, r2, #0
	bl sub_08026CD0
	b _080182A2
_0801829E:
	movs r0, #0
	str r0, [r2]
_080182A2:
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start UnitChangeFaction
UnitChangeFaction: @ 0x080182A8
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r6, r1, #0
	adds r0, r6, #0
	bl GetFreeUnit
	adds r4, r0, #0
	ldr r1, _080182E4 @ =0x030045B0
	ldr r0, [r1]
	cmp r0, r5
	bne _080182C0
	str r4, [r1]
_080182C0:
	adds r0, r5, #0
	adds r1, r4, #0
	bl CopyUnit
	adds r0, r5, #0
	bl ClearUnit
	ldrb r0, [r4, #9]
	cmp r0, #0xff
	bne _080182EC
	cmp r6, #0
	bne _080182E8
	ldrb r0, [r4, #8]
	cmp r0, #0x14
	beq _080182E8
	strb r6, [r4, #9]
	b _080182EC
	.align 2, 0
_080182E4: .4byte 0x030045B0
_080182E8:
	movs r0, #0xff
	strb r0, [r4, #9]
_080182EC:
	ldr r0, [r4, #0xc]
	ldr r1, _08018310 @ =0xFFFFEFFF
	ands r0, r1
	str r0, [r4, #0xc]
	ldrb r0, [r4, #0x1b]
	cmp r0, #0
	beq _08018308
	ldr r1, _08018314 @ =0x08C0216C
	ldrb r2, [r4, #0x1b]
	lsls r0, r2, #2
	adds r0, r0, r1
	ldr r1, [r0]
	ldrb r0, [r4, #0xb]
	strb r0, [r1, #0x1b]
_08018308:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08018310: .4byte 0xFFFFEFFF
_08018314: .4byte 0x08C0216C

	thumb_func_start UnitFinalizeMovement
UnitFinalizeMovement: @ 0x08018318
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0xc]
	movs r1, #0x10
	ands r0, r1
	cmp r0, #0
	beq _08018338
	ldr r1, _08018358 @ =0x08C0216C
	ldrb r2, [r4, #0x1b]
	lsls r0, r2, #2
	adds r0, r0, r1
	ldr r1, [r0]
	ldrb r0, [r4, #0x10]
	strb r0, [r1, #0x10]
	ldrb r0, [r4, #0x11]
	strb r0, [r1, #0x11]
_08018338:
	ldr r0, [r4, #0xc]
	movs r1, #0x80
	lsls r1, r1, #4
	ands r0, r1
	cmp r0, #0
	beq _08018352
	ldrb r0, [r4, #0x1c]
	bl sub_0802C7D8
	ldrb r1, [r4, #0x10]
	strb r1, [r0]
	ldrb r1, [r4, #0x11]
	strb r1, [r0, #1]
_08018352:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08018358: .4byte 0x08C0216C

	thumb_func_start UnitGetDeathDropLocation
UnitGetDeathDropLocation: @ 0x0801835C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	mov r8, r0
	str r1, [sp]
	str r2, [sp, #4]
	ldr r0, _08018460 @ =0x0000270F
	str r0, [sp, #8]
	ldr r1, _08018464 @ =0x08C0216C
	movs r4, #0xff
	mov r2, r8
	ldrb r2, [r2, #0x1b]
	lsls r0, r2, #2
	adds r0, r0, r1
	ldr r0, [r0]
	mov sl, r0
	mov r3, r8
	movs r0, #0x10
	ldrsb r0, [r3, r0]
	movs r1, #0x11
	ldrsb r1, [r3, r1]
	ldr r2, _08018468 @ =0x08C52F22
	bl sub_0801A060
	ldr r0, _0801846C @ =0x030045B0
	ldr r2, [r0]
	movs r0, #0x11
	ldrsb r0, [r2, r0]
	ldr r3, _08018470 @ =0x0202E3D8
	ldr r1, [r3]
	lsls r0, r0, #2
	adds r0, r0, r1
	movs r1, #0x10
	ldrsb r1, [r2, r1]
	ldr r0, [r0]
	adds r0, r0, r1
	strb r4, [r0]
	mov r1, r8
	movs r0, #0x11
	ldrsb r0, [r1, r0]
	ldr r1, [r3]
	lsls r0, r0, #2
	adds r0, r0, r1
	mov r2, r8
	movs r1, #0x10
	ldrsb r1, [r2, r1]
	ldr r0, [r0]
	adds r0, r0, r1
	movs r1, #0
	strb r1, [r0]
	ldr r0, _08018474 @ =0x0202E3D4
	movs r3, #2
	ldrsh r0, [r0, r3]
	subs r6, r0, #1
	cmp r6, #0
	blt _080184A6
_080183D2:
	ldr r0, _08018474 @ =0x0202E3D4
	movs r1, #0
	ldrsh r0, [r0, r1]
	subs r5, r0, #1
	ldr r2, _08018470 @ =0x0202E3D8
	subs r3, r6, #1
	mov sb, r3
	cmp r5, #0
	blt _080184A0
	lsls r7, r6, #2
_080183E6:
	ldr r0, _08018478 @ =0x0202E3E0
	ldr r0, [r0]
	adds r0, r7, r0
	ldr r0, [r0]
	adds r0, r0, r5
	ldrb r0, [r0]
	cmp r0, #0x78
	bhi _0801849A
	ldr r0, [r2]
	adds r0, r7, r0
	ldr r0, [r0]
	adds r0, r0, r5
	ldrb r0, [r0]
	cmp r0, #0
	bne _0801849A
	ldr r0, _0801847C @ =0x0202E3EC
	ldr r0, [r0]
	adds r0, r7, r0
	ldr r1, [r0]
	adds r1, r1, r5
	movs r0, #1
	ldrb r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _0801849A
	ldr r0, _08018480 @ =0x0202E3DC
	ldr r0, [r0]
	adds r0, r7, r0
	ldr r0, [r0]
	adds r0, r0, r5
	ldrb r4, [r0]
	mov r0, sl
	bl GetUnitMovementCost
	movs r1, #0
	adds r0, r0, r4
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	ble _0801843A
	movs r1, #1
_0801843A:
	ldr r2, _08018470 @ =0x0202E3D8
	cmp r1, #0
	beq _0801849A
	mov r1, r8
	movs r0, #0x10
	ldrsb r0, [r1, r0]
	subs r2, r5, r0
	cmp r2, #0
	bge _0801844E
	subs r2, r0, r5
_0801844E:
	mov r3, r8
	movs r0, #0x11
	ldrsb r0, [r3, r0]
	subs r1, r6, r0
	cmp r1, #0
	blt _08018484
	adds r0, r2, r1
	b _08018488
	.align 2, 0
_08018460: .4byte 0x0000270F
_08018464: .4byte 0x08C0216C
_08018468: .4byte 0x08C52F22
_0801846C: .4byte 0x030045B0
_08018470: .4byte 0x0202E3D8
_08018474: .4byte 0x0202E3D4
_08018478: .4byte 0x0202E3E0
_0801847C: .4byte 0x0202E3EC
_08018480: .4byte 0x0202E3DC
_08018484:
	subs r0, r0, r6
	adds r0, r2, r0
_08018488:
	ldr r2, _080184D4 @ =0x0202E3D8
	ldr r1, [sp, #8]
	cmp r1, r0
	blt _0801849A
	str r0, [sp, #8]
	ldr r3, [sp]
	str r5, [r3]
	ldr r0, [sp, #4]
	str r6, [r0]
_0801849A:
	subs r5, #1
	cmp r5, #0
	bge _080183E6
_080184A0:
	mov r6, sb
	cmp r6, #0
	bge _080183D2
_080184A6:
	ldr r0, _080184D8 @ =0x030045B0
	ldr r2, [r0]
	movs r0, #0x11
	ldrsb r0, [r2, r0]
	ldr r1, _080184D4 @ =0x0202E3D8
	ldr r1, [r1]
	lsls r0, r0, #2
	adds r0, r0, r1
	movs r1, #0x10
	ldrsb r1, [r2, r1]
	ldr r0, [r0]
	adds r0, r0, r1
	movs r1, #0
	strb r1, [r0]
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080184D4: .4byte 0x0202E3D8
_080184D8: .4byte 0x030045B0

	thumb_func_start UnitBeginAction
UnitBeginAction: @ 0x080184DC
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	ldr r6, _0801853C @ =0x030045B0
	str r4, [r6]
	ldr r0, _08018540 @ =0x0202BD44
	ldrb r2, [r4, #0xb]
	strb r2, [r0]
	ldr r1, _08018544 @ =0x0202BD48
	movs r0, #0x10
	ldrsb r0, [r4, r0]
	movs r5, #0
	strh r0, [r1]
	movs r0, #0x11
	ldrsb r0, [r4, r0]
	strh r0, [r1, #2]
	ldr r0, _08018548 @ =0x0203A858
	strb r2, [r0, #0xc]
	strb r5, [r0, #0x11]
	strb r5, [r0, #0x10]
	ldr r0, _0801854C @ =0x0202BBB4
	adds r1, r0, #0
	adds r1, #0x3d
	strb r5, [r1]
	adds r0, #0x3f
	movs r1, #0xff
	strb r1, [r0]
	bl sub_0802A21C
	ldr r2, [r6]
	ldr r0, [r2, #0xc]
	movs r1, #1
	orrs r0, r1
	str r0, [r2, #0xc]
	movs r0, #0x11
	ldrsb r0, [r4, r0]
	ldr r1, _08018550 @ =0x0202E3D8
	ldr r1, [r1]
	lsls r0, r0, #2
	adds r0, r0, r1
	movs r1, #0x10
	ldrsb r1, [r4, r1]
	ldr r0, [r0]
	adds r0, r0, r1
	strb r5, [r0]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0801853C: .4byte 0x030045B0
_08018540: .4byte 0x0202BD44
_08018544: .4byte 0x0202BD48
_08018548: .4byte 0x0203A858
_0801854C: .4byte 0x0202BBB4
_08018550: .4byte 0x0202E3D8

	thumb_func_start UnitBeginCantoAction
UnitBeginCantoAction: @ 0x08018554
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	ldr r6, _080185A8 @ =0x030045B0
	str r4, [r6]
	ldr r1, _080185AC @ =0x0202BD44
	ldrb r0, [r4, #0xb]
	strb r0, [r1]
	ldr r1, _080185B0 @ =0x0202BD48
	movs r0, #0x10
	ldrsb r0, [r4, r0]
	movs r5, #0
	strh r0, [r1]
	movs r0, #0x11
	ldrsb r0, [r4, r0]
	strh r0, [r1, #2]
	ldr r0, _080185B4 @ =0x0203A858
	strb r5, [r0, #0x11]
	ldr r0, _080185B8 @ =0x0202BBB4
	adds r0, #0x3d
	strb r5, [r0]
	bl sub_0802A21C
	ldr r2, [r6]
	ldr r0, [r2, #0xc]
	movs r1, #1
	orrs r0, r1
	str r0, [r2, #0xc]
	movs r0, #0x11
	ldrsb r0, [r4, r0]
	ldr r1, _080185BC @ =0x0202E3D8
	ldr r1, [r1]
	lsls r0, r0, #2
	adds r0, r0, r1
	movs r1, #0x10
	ldrsb r1, [r4, r1]
	ldr r0, [r0]
	adds r0, r0, r1
	strb r5, [r0]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080185A8: .4byte 0x030045B0
_080185AC: .4byte 0x0202BD44
_080185B0: .4byte 0x0202BD48
_080185B4: .4byte 0x0203A858
_080185B8: .4byte 0x0202BBB4
_080185BC: .4byte 0x0202E3D8

	thumb_func_start MoveActiveUnit
MoveActiveUnit: @ 0x080185C0
	push {r4, r5, r6, r7, lr}
	ldr r3, _080185E0 @ =0x030045B0
	ldr r2, [r3]
	strb r0, [r2, #0x10]
	ldr r0, [r3]
	strb r1, [r0, #0x11]
	ldr r2, [r3]
	ldr r0, [r2]
	adds r7, r3, #0
	ldrb r0, [r0, #4]
	cmp r0, #0xcd
	beq _080185E4
	ldr r0, [r2, #0xc]
	movs r1, #2
	orrs r0, r1
	b _080185EA
	.align 2, 0
_080185E0: .4byte 0x030045B0
_080185E4:
	ldr r0, [r2, #0xc]
	ldr r1, _08018650 @ =0xFFFFFBBD
	ands r0, r1
_080185EA:
	str r0, [r2, #0xc]
	adds r6, r7, #0
	ldr r0, [r6]
	ldr r0, [r0]
	ldrb r0, [r0, #4]
	ldr r1, _08018654 @ =0x0203A858
	ldrb r1, [r1, #0x10]
	bl sub_080A0A08
	ldr r5, [r6]
	movs r4, #0x13
	ldrsb r4, [r5, r4]
	adds r0, r5, #0
	bl sub_08016BC4
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl sub_080164BC
	movs r1, #0x12
	ldrsb r1, [r5, r1]
	adds r1, r1, r0
	cmp r4, r1
	ble _08018630
	adds r0, r5, #0
	bl sub_08016BC4
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl sub_080164BC
	movs r1, #0x12
	ldrsb r1, [r5, r1]
	adds r1, r1, r0
	strb r1, [r5, #0x13]
_08018630:
	movs r0, #0x13
	ldrsb r0, [r5, r0]
	cmp r0, #0
	beq _08018644
	ldr r0, [r6]
	ldr r1, [r0, #0xc]
	movs r2, #2
	rsbs r2, r2, #0
	ands r1, r2
	str r1, [r0, #0xc]
_08018644:
	ldr r0, [r7]
	bl UnitFinalizeMovement
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08018650: .4byte 0xFFFFFBBD
_08018654: .4byte 0x0203A858

	thumb_func_start ClearActiveFactionGrayedStates
ClearActiveFactionGrayedStates: @ 0x08018658
	push {r4, r5, r6, lr}
	ldr r0, _080186E0 @ =0x0202BBF4
	ldrb r0, [r0, #0xf]
	cmp r0, #0
	bne _080186A2
	movs r4, #1
	ldr r5, _080186E4 @ =0x08C0216C
_08018666:
	movs r0, #0xff
	ands r0, r4
	lsls r0, r0, #2
	adds r0, r0, r5
	ldr r2, [r0]
	cmp r2, #0
	beq _0801869C
	ldr r3, [r2]
	cmp r3, #0
	beq _0801869C
	ldr r0, [r2, #4]
	ldr r1, [r3, #0x28]
	ldr r0, [r0, #0x28]
	orrs r1, r0
	movs r0, #0x80
	lsls r0, r0, #2
	ands r1, r0
	cmp r1, #0
	bne _0801869C
	ldr r0, [r2, #0xc]
	ldr r1, _080186E8 @ =0x0001000E
	ands r0, r1
	cmp r0, #0
	bne _0801869C
	ldrb r0, [r3, #4]
	bl sub_080A0AC8
_0801869C:
	adds r4, #1
	cmp r4, #0x3f
	ble _08018666
_080186A2:
	ldr r1, _080186E0 @ =0x0202BBF4
	ldrb r0, [r1, #0xf]
	adds r2, r0, #1
	adds r0, #0x40
	cmp r2, r0
	bge _080186DA
	ldr r6, _080186E4 @ =0x08C0216C
	movs r5, #0xff
	ldr r4, _080186EC @ =0xFFFFFBBD
	adds r3, r1, #0
_080186B6:
	adds r0, r2, #0
	ands r0, r5
	lsls r0, r0, #2
	adds r0, r0, r6
	ldr r1, [r0]
	cmp r1, #0
	beq _080186D0
	ldr r0, [r1]
	cmp r0, #0
	beq _080186D0
	ldr r0, [r1, #0xc]
	ands r0, r4
	str r0, [r1, #0xc]
_080186D0:
	adds r2, #1
	ldrb r0, [r3, #0xf]
	adds r0, #0x40
	cmp r2, r0
	blt _080186B6
_080186DA:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080186E0: .4byte 0x0202BBF4
_080186E4: .4byte 0x08C0216C
_080186E8: .4byte 0x0001000E
_080186EC: .4byte 0xFFFFFBBD

	thumb_func_start TickActiveFactionTurn
TickActiveFactionTurn: @ 0x080186F0
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	movs r0, #0
	mov r8, r0
	movs r1, #0
	bl sub_0804B4C0
	ldr r0, _08018708 @ =0x0202BBF4
	ldrb r0, [r0, #0xf]
	adds r5, r0, #1
	b _080187AC
	.align 2, 0
_08018708: .4byte 0x0202BBF4
_0801870C:
	ldr r1, _080187D8 @ =0x08C0216C
	movs r0, #0xff
	ands r0, r5
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r2, [r0]
	adds r4, r2, #0
	cmp r2, #0
	beq _080187A6
	ldr r0, [r2]
	cmp r0, #0
	beq _080187A6
	ldr r0, [r2, #0xc]
	ldr r1, _080187DC @ =0x0001002C
	ands r0, r1
	cmp r0, #0
	bne _080187A6
	adds r3, r2, #0
	adds r3, #0x31
	ldrb r2, [r3]
	movs r6, #0xf0
	adds r0, r6, #0
	ands r0, r2
	cmp r0, #0
	beq _0801874C
	lsrs r1, r2, #4
	subs r1, #1
	lsls r1, r1, #4
	movs r0, #0xf
	ands r0, r2
	orrs r0, r1
	strb r0, [r3]
_0801874C:
	ldrb r2, [r3]
	movs r1, #0xf
	movs r7, #0xf
	mov ip, r7
	mov r0, ip
	ands r0, r2
	cmp r0, #0
	beq _08018772
	lsls r0, r2, #0x1c
	lsrs r0, r0, #0x1c
	subs r0, #1
	ands r0, r1
	subs r7, #0x1f
	adds r1, r7, #0
	ands r1, r2
	orrs r1, r0
	strb r1, [r3]
	movs r0, #1
	mov r8, r0
_08018772:
	adds r3, r4, #0
	adds r3, #0x30
	ldrb r2, [r3]
	adds r0, r6, #0
	ands r0, r2
	cmp r0, #0
	beq _080187A6
	lsrs r1, r2, #4
	subs r1, #1
	lsls r1, r1, #4
	mov r0, ip
	ands r0, r2
	orrs r0, r1
	strb r0, [r3]
	ands r0, r6
	cmp r0, #0
	bne _080187A6
	movs r0, #0x10
	ldrsb r0, [r4, r0]
	movs r1, #0x11
	ldrsb r1, [r4, r1]
	movs r2, #0xb
	ldrsb r2, [r4, r2]
	movs r3, #0
	bl sub_0804B4D8
_080187A6:
	adds r5, #1
	ldr r0, _080187E0 @ =0x0202BBF4
	ldrb r0, [r0, #0xf]
_080187AC:
	adds r0, #0x40
	cmp r5, r0
	blt _0801870C
	mov r7, r8
	cmp r7, #0
	beq _080187CE
	bl sub_0801996C
	bl sub_08019EA4
	bl sub_080198EC
	movs r0, #1
	bl sub_0801DA0C
	bl sub_08025BB0
_080187CE:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080187D8: .4byte 0x08C0216C
_080187DC: .4byte 0x0001002C
_080187E0: .4byte 0x0202BBF4

	thumb_func_start SetAllUnitNotBackSprite
SetAllUnitNotBackSprite: @ 0x080187E4
	push {r4, r5, lr}
	movs r2, #1
	ldr r5, _08018814 @ =0x08C0216C
	movs r4, #0xff
	ldr r3, _08018818 @ =0xFFFFFEFF
_080187EE:
	adds r0, r2, #0
	ands r0, r4
	lsls r0, r0, #2
	adds r0, r0, r5
	ldr r1, [r0]
	cmp r1, #0
	beq _08018808
	ldr r0, [r1]
	cmp r0, #0
	beq _08018808
	ldr r0, [r1, #0xc]
	ands r0, r3
	str r0, [r1, #0xc]
_08018808:
	adds r2, #1
	cmp r2, #0xbf
	ble _080187EE
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08018814: .4byte 0x08C0216C
_08018818: .4byte 0xFFFFFEFF

	thumb_func_start UnitUpdateUsedItem
UnitUpdateUsedItem: @ 0x0801881C
	push {r4, r5, lr}
	adds r5, r0, #0
	lsls r1, r1, #1
	adds r0, #0x1e
	adds r4, r0, r1
	ldrh r0, [r4]
	cmp r0, #0
	beq _08018838
	bl sub_08016B90
	strh r0, [r4]
	adds r0, r5, #0
	bl UnitRemoveInvalidItems
_08018838:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start GetUnitAid
GetUnitAid: @ 0x08018840
	push {r4, lr}
	adds r4, r0, #0
	ldr r3, [r4]
	ldr r2, [r4, #4]
	ldr r1, [r3, #0x28]
	ldr r0, [r2, #0x28]
	orrs r1, r0
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	bne _0801886A
	movs r0, #0x11
	ldrsb r0, [r2, r0]
	movs r1, #0x13
	ldrsb r1, [r3, r1]
	adds r0, r0, r1
	movs r1, #0x1a
	ldrsb r1, [r4, r1]
	adds r0, r0, r1
	subs r0, #1
	b _0801889C
_0801886A:
	movs r0, #0x80
	lsls r0, r0, #7
	ands r1, r0
	cmp r1, #0
	bne _08018888
	movs r1, #0x11
	ldrsb r1, [r2, r1]
	movs r0, #0x13
	ldrsb r0, [r3, r0]
	adds r1, r1, r0
	movs r0, #0x1a
	ldrsb r0, [r4, r0]
	adds r1, r1, r0
	movs r0, #0x19
	b _0801889A
_08018888:
	movs r1, #0x11
	ldrsb r1, [r2, r1]
	movs r0, #0x13
	ldrsb r0, [r3, r0]
	adds r1, r1, r0
	movs r0, #0x1a
	ldrsb r0, [r4, r0]
	adds r1, r1, r0
	movs r0, #0x14
_0801889A:
	subs r0, r0, r1
_0801889C:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start GetUnitMagBy2Range
GetUnitMagBy2Range: @ 0x080188A4
	push {r4, lr}
	adds r4, r0, #0
	bl sub_08016BC4
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl sub_080164E8
	movs r1, #0x14
	ldrsb r1, [r4, r1]
	adds r1, r1, r0
	lsrs r0, r1, #0x1f
	adds r1, r1, r0
	asrs r0, r1, #1
	cmp r0, #4
	bgt _080188C6
	movs r0, #5
_080188C6:
	pop {r4}
	pop {r1}
	bx r1

	thumb_func_start UnitHasMagicRank
UnitHasMagicRank: @ 0x080188CC
	adds r2, r0, #0
	adds r0, #0x2c
	adds r1, r2, #0
	adds r1, #0x2d
	ldrb r1, [r1]
	ldrb r0, [r0]
	orrs r1, r0
	adds r0, r2, #0
	adds r0, #0x2e
	ldrb r0, [r0]
	orrs r1, r0
	adds r0, r2, #0
	adds r0, #0x2f
	ldrb r0, [r0]
	orrs r1, r0
	rsbs r0, r1, #0
	orrs r0, r1
	lsrs r0, r0, #0x1f
	bx lr
	.align 2, 0

	thumb_func_start sub_080188F4
sub_080188F4: @ 0x080188F4
	push {r4, lr}
	adds r4, r0, #0
	ldr r3, [r4, #0xc]
	movs r0, #0x80
	ands r0, r3
	cmp r0, #0
	bne _0801890E
	movs r0, #0xa
	rsbs r0, r0, #0
	ands r3, r0
	str r3, [r4, #0xc]
	strb r1, [r4, #0x10]
	strb r2, [r4, #0x11]
_0801890E:
	pop {r4}
	pop {r0}
	bx r0

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
	bl sub_08017684
	mov r1, r8
	ands r0, r1
	cmp r0, #0
	beq _080189D2
	adds r0, r5, #0
	adds r1, r4, #0
	bl sub_08016620
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080189D2
	mov r0, r8
	orrs r6, r0
_080189D2:
	adds r0, r4, #0
	bl sub_08017684
	movs r1, #4
	ands r1, r0
	cmp r1, #0
	beq _080189F2
	adds r0, r5, #0
	adds r1, r4, #0
	bl sub_08016850
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
	ldr r6, _08018A48 @ =0x08C0216C
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
_08018A48: .4byte 0x08C0216C

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
	ldr r0, _08018AE0 @ =0x030045B0
	ldr r2, [r0]
	movs r1, #0x1d
	ldrsb r1, [r2, r1]
	ldr r0, [r2, #4]
	ldrb r0, [r0, #0x12]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r1, r1, r0
	ldr r0, _08018AE4 @ =0x0203A858
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
	ldr r0, _08018AE8 @ =0x0202E3D8
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
	ldr r0, _08018AE0 @ =0x030045B0
	ldr r0, [r0]
	bl GetUnitMovementCost
	ldr r1, _08018AEC @ =0x0202E3DC
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
_08018AE0: .4byte 0x030045B0
_08018AE4: .4byte 0x0203A858
_08018AE8: .4byte 0x0202E3D8
_08018AEC: .4byte 0x0202E3DC
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
	ldr r6, _08018B5C @ =0x08C0216C
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
_08018B5C: .4byte 0x08C0216C
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
	ldr r0, _08018BF4 @ =0x0202BBF4
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
_08018BF4: .4byte 0x0202BBF4
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
	ldr r5, _08018C58 @ =0x08C0216C
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
_08018C58: .4byte 0x08C0216C
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
	ldr r6, _08018CAC @ =0x08C0216C
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
_08018CAC: .4byte 0x08C0216C
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
	ldr r5, _08018CF4 @ =0x0202BBF4
	ldr r4, _08018CF8 @ =0x08C0216C
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
_08018CF4: .4byte 0x0202BBF4
_08018CF8: .4byte 0x08C0216C
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
	ldr r5, _08018D6C @ =0x08C0216C
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
_08018D6C: .4byte 0x08C0216C

	thumb_func_start IsUnitSlotAvailable
IsUnitSlotAvailable: @ 0x08018D70
	push {r4, r5, r6, lr}
	bl sub_0807B32C
	movs r4, #1
	ldr r5, _08018DA4 @ =0x08C0216C
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
_08018DA4: .4byte 0x08C0216C
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
	ldr r1, _08018E58 @ =0x0202BBF4
	movs r0, #0x10
	ldrb r1, [r1, #0x14]
	ands r0, r1
	cmp r0, #0
	beq _08018E24
	movs r3, #1
	ldr r6, _08018E5C @ =0x08C0216C
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
	ldr r5, _08018E5C @ =0x08C0216C
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
_08018E58: .4byte 0x0202BBF4
_08018E5C: .4byte 0x08C0216C

	thumb_func_start sub_08018E60
sub_08018E60: @ 0x08018E60
	push {r4, r5, lr}
	adds r5, r0, #0
	movs r4, #0x13
	ldrsb r4, [r5, r4]
	bl sub_08016BC4
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl sub_080164BC
	movs r1, #0x12
	ldrsb r1, [r5, r1]
	adds r1, r1, r0
	cmp r4, r1
	ble _08018E94
	adds r0, r5, #0
	bl sub_08016BC4
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl sub_080164BC
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
	bl sub_08016BC4
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl sub_080164BC
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
	bl sub_08016BC4
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl sub_080164E8
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
	bl sub_08016BC4
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
	bl sub_08016BC4
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
	bl sub_08016BC4
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
	bl sub_08016BC4
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
	bl sub_08016BC4
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
	bl sub_08016BC4
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl sub_080164BC
	movs r1, #0x12
	ldrsb r1, [r5, r1]
	adds r1, r1, r0
	cmp r4, r1
	ble _08019066
	adds r0, r5, #0
	bl sub_08016BC4
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl sub_080164BC
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
	bl sub_08016BC4
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl sub_080164BC
	movs r1, #0x12
	ldrsb r1, [r5, r1]
	adds r1, r1, r0
	cmp r4, r1
	ble _080190A0
	adds r0, r5, #0
	bl sub_08016BC4
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl sub_080164BC
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
	ldr r1, _080190D0 @ =0x08C0216C
	ldrb r2, [r2, #0x1b]
	lsls r0, r2, #2
	adds r0, r0, r1
	ldr r0, [r0]
	ldr r0, [r0]
	ldrh r0, [r0]
	bl sub_08013318
	b _080190D8
	.align 2, 0
_080190D0: .4byte 0x08C0216C
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

	thumb_func_start sub_080190F4
sub_080190F4: @ 0x080190F4
	ldr r2, _08019104 @ =0x08C0216C
	movs r1, #0xff
	ands r1, r0
	lsls r1, r1, #2
	adds r1, r1, r2
	ldr r0, [r1]
	bx lr
	.align 2, 0
_08019104: .4byte 0x08C0216C
