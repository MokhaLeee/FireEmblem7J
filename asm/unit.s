

	.include "macro.inc"
	.syntax unified

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
