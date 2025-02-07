	.include "macro.inc"
	.syntax unified

	thumb_func_start GetLatestUnitIndexInPrepListByUId
GetLatestUnitIndexInPrepListByUId: @ 0x0808EA20
	push {r4, r5, lr}
	movs r5, #0
	b _0808EA42
_0808EA26:
	bl GetLastStatScreenUnitId
	adds r4, r0, #0
	adds r0, r5, #0
	bl GetUnitFromPrepList
	ldrb r0, [r0, #0xb]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r4, r0
	bne _0808EA40
	adds r0, r5, #0
	b _0808EA4C
_0808EA40:
	adds r5, #1
_0808EA42:
	bl PrepGetUnitAmount
	cmp r5, r0
	blt _0808EA26
	movs r0, #0
_0808EA4C:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start PrepGetLatestUnitIndex
PrepGetLatestUnitIndex: @ 0x0808EA54
	push {r4, r5, lr}
	movs r5, #0
	b _0808EA72
_0808EA5A:
	adds r0, r5, #0
	bl GetUnitFromPrepList
	ldr r0, [r0]
	ldrb r4, [r0, #4]
	bl PrepGetLatestCharId
	cmp r4, r0
	bne _0808EA70
	adds r0, r5, #0
	b _0808EA7C
_0808EA70:
	adds r5, #1
_0808EA72:
	bl PrepGetUnitAmount
	cmp r5, r0
	blt _0808EA5A
	movs r0, #0
_0808EA7C:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start ReorderPlayerUnitsBasedOnDeployment
ReorderPlayerUnitsBasedOnDeployment: @ 0x0808EA84
	push {r4, lr}
	ldr r0, _0808EAEC @ =0x020106DC
	bl InitUnitStack
	movs r4, #1
_0808EA8E:
	adds r0, r4, #0
	bl GetUnit
	adds r2, r0, #0
	cmp r2, #0
	beq _0808EAB0
	ldr r0, [r2]
	cmp r0, #0
	beq _0808EAB0
	ldr r0, [r2, #0xc]
	ldr r1, _0808EAF0 @ =0x0001000C
	ands r0, r1
	cmp r0, #0
	bne _0808EAB0
	adds r0, r2, #0
	bl PushUnit
_0808EAB0:
	adds r4, #1
	cmp r4, #0x3f
	ble _0808EA8E
	movs r4, #1
_0808EAB8:
	adds r0, r4, #0
	bl GetUnit
	adds r2, r0, #0
	cmp r2, #0
	beq _0808EADA
	ldr r0, [r2]
	cmp r0, #0
	beq _0808EADA
	ldr r0, [r2, #0xc]
	ldr r1, _0808EAF0 @ =0x0001000C
	ands r0, r1
	cmp r0, #0
	beq _0808EADA
	adds r0, r2, #0
	bl PushUnit
_0808EADA:
	adds r4, #1
	cmp r4, #0x3f
	ble _0808EAB8
	bl LoadPlayerUnitsFromUnitStack
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0808EAEC: .4byte 0x020106DC
_0808EAF0: .4byte 0x0001000C

	thumb_func_start SortPlayerUnitsForPrepScreen
SortPlayerUnitsForPrepScreen: @ 0x0808EAF4
	push {r4, r5, r6, r7, lr}
	bl GetChapterAllyUnitCount
	adds r7, r0, #0
	movs r6, #0
	ldr r0, _0808EBB8 @ =0x020106DC
	bl InitUnitStack
	movs r5, #1
_0808EB06:
	adds r0, r5, #0
	bl GetUnit
	adds r4, r0, #0
	cmp r4, #0
	beq _0808EB40
	ldr r0, [r4]
	cmp r0, #0
	beq _0808EB40
	ldr r0, [r4, #0xc]
	ldr r1, _0808EBBC @ =0xFDFFFFFF
	ands r0, r1
	str r0, [r4, #0xc]
	adds r0, r4, #0
	bl IsUnitInCurrentRoster
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0808EB40
	ldr r0, [r4]
	ldrb r0, [r0, #4]
	bl IsCharacterForceDeployed
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0808EB40
	adds r0, r4, #0
	bl PushUnit
_0808EB40:
	adds r5, #1
	cmp r5, #0x3f
	ble _0808EB06
	movs r5, #1
_0808EB48:
	adds r0, r5, #0
	bl GetUnit
	adds r4, r0, #0
	cmp r4, #0
	beq _0808EB7A
	ldr r0, [r4]
	cmp r0, #0
	beq _0808EB7A
	adds r0, r4, #0
	bl IsUnitInCurrentRoster
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0808EB74
	ldr r0, [r4]
	ldrb r0, [r0, #4]
	bl IsCharacterForceDeployed
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0808EB7A
_0808EB74:
	adds r0, r4, #0
	bl PushUnit
_0808EB7A:
	adds r5, #1
	cmp r5, #0x3f
	ble _0808EB48
	bl LoadPlayerUnitsFromUnitStack
	movs r5, #1
_0808EB86:
	adds r0, r5, #0
	bl GetUnit
	adds r4, r0, #0
	cmp r4, #0
	beq _0808EBDE
	ldr r0, [r4]
	cmp r0, #0
	beq _0808EBDE
	adds r0, r4, #0
	bl IsUnitInCurrentRoster
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0808EBDE
	adds r0, r4, #0
	bl sub_808E7D4
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0808EBC4
	ldr r0, [r4, #0xc]
	ldr r1, _0808EBC0 @ =0x02000008
	b _0808EBDA
	.align 2, 0
_0808EBB8: .4byte 0x020106DC
_0808EBBC: .4byte 0xFDFFFFFF
_0808EBC0: .4byte 0x02000008
_0808EBC4:
	cmp r7, r6
	ble _0808EBD6
	ldr r0, [r4, #0xc]
	movs r1, #9
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r4, #0xc]
	adds r6, #1
	b _0808EBDE
_0808EBD6:
	ldr r0, [r4, #0xc]
	movs r1, #8
_0808EBDA:
	orrs r0, r1
	str r0, [r4, #0xc]
_0808EBDE:
	adds r5, #1
	cmp r5, #0x3f
	ble _0808EB86
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
