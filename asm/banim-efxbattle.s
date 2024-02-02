	.include "macro.inc"
	.syntax unified

	thumb_func_start CheckEfxHpBarExist
CheckEfxHpBarExist: @ 0x0804DD70
	ldr r1, _0804DD7C @ =0x02017780
	lsls r0, r0, #1
	adds r0, r0, r1
	movs r1, #0
	ldrsh r0, [r0, r1]
	bx lr
	.align 2, 0
_0804DD7C: .4byte 0x02017780

	thumb_func_start sub_0804DD80
sub_0804DD80: @ 0x0804DD80
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	ldr r1, _0804DDB0 @ =0x02017728
	ldr r0, [r1]
	cmp r0, #0
	bne _0804DE40
	movs r0, #1
	str r0, [r1]
	ldr r0, _0804DDB4 @ =gUnk_08C09F10
	movs r1, #3
	bl Proc_Start
	adds r6, r0, #0
	str r4, [r6, #0x64]
	adds r0, r4, #0
	bl GetAnimPosition
	cmp r0, #0
	bne _0804DDBC
	ldr r0, _0804DDB8 @ =gAnims
	ldr r1, [r0, #8]
	str r1, [r6, #0x5c]
	ldr r0, [r0]
	b _0804DDC4
	.align 2, 0
_0804DDB0: .4byte 0x02017728
_0804DDB4: .4byte gUnk_08C09F10
_0804DDB8: .4byte gAnims
_0804DDBC:
	ldr r0, _0804DE18 @ =gAnims
	ldr r1, [r0]
	str r1, [r6, #0x5c]
	ldr r0, [r0, #8]
_0804DDC4:
	str r0, [r6, #0x60]
	ldr r4, _0804DE1C @ =gEfxPairHpBufOffset
	ldr r0, [r6, #0x60]
	bl GetAnimPosition
	lsls r0, r0, #1
	adds r0, r0, r4
	movs r1, #0
	ldrsh r5, [r0, r1]
	adds r4, r5, #1
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	ldr r0, [r6, #0x60]
	bl GetAnimPosition
	lsls r5, r5, #1
	adds r5, r5, r0
	adds r0, r5, #0
	bl GetEfxHp
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	str r0, [r6, #0x4c]
	ldr r0, [r6, #0x60]
	bl GetAnimPosition
	lsls r4, r4, #0x10
	asrs r4, r4, #0xf
	adds r4, r4, r0
	adds r0, r4, #0
	bl GetEfxHp
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	str r0, [r6, #0x50]
	ldr r1, [r6, #0x4c]
	cmp r1, r0
	ble _0804DE20
	movs r0, #1
	rsbs r0, r0, #0
	b _0804DE22
	.align 2, 0
_0804DE18: .4byte gAnims
_0804DE1C: .4byte gEfxPairHpBufOffset
_0804DE20:
	movs r0, #1
_0804DE22:
	str r0, [r6, #0x48]
	movs r1, #0
	strh r1, [r6, #0x2c]
	ldr r0, [r6, #0x4c]
	strh r0, [r6, #0x2e]
	str r1, [r6, #0x54]
	str r1, [r6, #0x58]
	ldr r0, [r6, #0x60]
	bl GetAnimPosition
	ldr r1, _0804DE48 @ =0x02017780
	lsls r0, r0, #1
	adds r0, r0, r1
	movs r1, #1
	strh r1, [r0]
_0804DE40:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0804DE48: .4byte 0x02017780

	thumb_func_start sub_0804DE4C
sub_0804DE4C: @ 0x0804DE4C
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	ldr r4, _0804DEF0 @ =gAnims
	ldr r0, [r5, #0x60]
	bl GetAnimPosition
	lsls r0, r0, #3
	adds r0, r0, r4
	ldr r6, [r0]
	ldr r0, [r5, #0x60]
	bl GetAnimPosition
	lsls r0, r0, #1
	adds r0, #1
	lsls r0, r0, #2
	adds r0, r0, r4
	ldr r7, [r0]
	ldr r1, [r5, #0x58]
	cmp r1, #0
	bne _0804DEAE
	ldrh r0, [r5, #0x2c]
	adds r0, #1
	strh r0, [r5, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #2
	bne _0804DEAE
	strh r1, [r5, #0x2c]
	ldr r0, [r5, #0x48]
	ldrh r1, [r5, #0x2e]
	adds r0, r1, r0
	strh r0, [r5, #0x2e]
	ldr r0, [r5, #0x60]
	bl GetAnimPosition
	ldr r1, _0804DEF4 @ =gEkrPairHpInitial
	lsls r0, r0, #1
	adds r0, r0, r1
	ldr r1, [r5, #0x48]
	ldrh r2, [r0]
	adds r1, r2, r1
	strh r1, [r0]
	movs r0, #0x2e
	ldrsh r1, [r5, r0]
	ldr r0, [r5, #0x50]
	cmp r1, r0
	bne _0804DEAE
	movs r0, #1
	str r0, [r5, #0x58]
_0804DEAE:
	ldr r1, [r5, #0x54]
	cmp r1, #0x1e
	bne _0804DF50
	ldr r0, [r5, #0x58]
	cmp r0, #1
	bne _0804DF50
	ldr r4, _0804DEF8 @ =gEfxPairHpBufOffset
	ldr r0, [r5, #0x60]
	bl GetAnimPosition
	lsls r0, r0, #1
	adds r0, r0, r4
	ldrh r1, [r0]
	adds r1, #1
	movs r4, #0
	strh r1, [r0]
	ldr r0, [r5, #0x60]
	bl GetAnimPosition
	ldr r1, _0804DEFC @ =0x02017780
	lsls r0, r0, #1
	adds r0, r0, r1
	strh r4, [r0]
	ldr r0, [r5, #0x50]
	cmp r0, #0
	bne _0804DF44
	bl GetBanimLinkArenaFlag
	cmp r0, #1
	bne _0804DF00
	movs r0, #0
	b _0804DF14
	.align 2, 0
_0804DEF0: .4byte gAnims
_0804DEF4: .4byte gEkrPairHpInitial
_0804DEF8: .4byte gEfxPairHpBufOffset
_0804DEFC: .4byte 0x02017780
_0804DF00:
	ldr r4, _0804DF24 @ =gEkrPids
	adds r0, r6, #0
	bl GetAnimPosition
	adds r0, r0, r4
	ldrb r0, [r0]
	bl sub_08079CE4
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
_0804DF14:
	cmp r0, #1
	bne _0804DF28
	adds r0, r6, #0
	adds r1, r7, #0
	bl sub_0804E7F4
	b _0804DF44
	.align 2, 0
_0804DF24: .4byte gEkrPids
_0804DF28:
	bl sub_08055D2C
	adds r0, r6, #0
	adds r1, r7, #0
	bl sub_0804E9D0
	ldr r0, [r5, #0x60]
	bl GetAnimPosition
	ldr r1, _0804DF4C @ =0x0203DFE8
	lsls r0, r0, #1
	adds r0, r0, r1
	movs r1, #0
	strh r1, [r0]
_0804DF44:
	adds r0, r5, #0
	bl Proc_Break
	b _0804DF5C
	.align 2, 0
_0804DF4C: .4byte 0x0203DFE8
_0804DF50:
	adds r0, r1, #1
	str r0, [r5, #0x54]
	cmp r0, #0x1d
	bls _0804DF5C
	movs r0, #0x1e
	str r0, [r5, #0x54]
_0804DF5C:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_0804DF64
sub_0804DF64: @ 0x0804DF64
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r0, _0804DFAC @ =gEfxBgSemaphore
	ldr r0, [r0]
	cmp r0, #0
	bne _0804DFFC
	ldr r0, _0804DFB0 @ =0x0201772C
	ldr r0, [r0]
	cmp r0, #0
	bne _0804DFFC
	strh r0, [r5, #0x2c]
	movs r0, #1
	strh r0, [r5, #0x2e]
	ldr r0, [r5, #0x64]
	bl GetAnimAnotherSide
	adds r4, r0, #0
	bl GetAnimNextRoundType
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	bl CheckRound2
	cmp r0, #1
	bne _0804DFF6
	ldr r0, _0804DFB4 @ =gEkrDistanceType
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #4
	bhi _0804DFF6
	lsls r0, r0, #2
	ldr r1, _0804DFB8 @ =_0804DFBC
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0804DFAC: .4byte gEfxBgSemaphore
_0804DFB0: .4byte 0x0201772C
_0804DFB4: .4byte gEkrDistanceType
_0804DFB8: .4byte _0804DFBC
_0804DFBC: @ jump table
	.4byte _0804DFD0 @ case 0
	.4byte _0804DFD0 @ case 1
	.4byte _0804DFE4 @ case 2
	.4byte _0804DFD0 @ case 3
	.4byte _0804DFD0 @ case 4
_0804DFD0:
	movs r0, #0x10
	strh r0, [r5, #0x2e]
	adds r0, r4, #0
	bl GetAnimAnotherSide
	movs r1, #1
	rsbs r1, r1, #0
	bl sub_0804EC74
	b _0804DFF6
_0804DFE4:
	movs r0, #0x14
	strh r0, [r5, #0x2e]
	adds r0, r4, #0
	bl GetAnimAnotherSide
	movs r1, #1
	rsbs r1, r1, #0
	bl sub_0804EC74
_0804DFF6:
	adds r0, r5, #0
	bl Proc_Break
_0804DFFC:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_0804E004
sub_0804E004: @ 0x0804E004
	push {lr}
	adds r2, r0, #0
	ldrh r0, [r2, #0x2c]
	adds r0, #1
	strh r0, [r2, #0x2c]
	lsls r0, r0, #0x10
	asrs r1, r0, #0x10
	movs r3, #0x2e
	ldrsh r0, [r2, r3]
	subs r0, #4
	cmp r1, r0
	bne _0804E02A
	ldr r0, [r2, #0x64]
	bl GetAnimAnotherSide
	movs r0, #4
	bl EnableBgSync
	b _0804E040
_0804E02A:
	movs r3, #0x2e
	ldrsh r0, [r2, r3]
	cmp r1, r0
	bne _0804E040
	ldr r1, _0804E044 @ =0x02017728
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	adds r0, r2, #0
	bl Proc_Break
_0804E040:
	pop {r0}
	bx r0
	.align 2, 0
_0804E044: .4byte 0x02017728

	thumb_func_start sub_0804E048
sub_0804E048: @ 0x0804E048
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	ldr r1, _0804E080 @ =0x02017728
	ldr r0, [r1]
	cmp r0, #0
	bne _0804E11A
	movs r0, #1
	str r0, [r1]
	ldr r0, _0804E084 @ =gUnk_08C09F38
	movs r1, #3
	bl Proc_Start
	adds r6, r0, #0
	adds r0, r4, #0
	bl GetAnimAnotherSide
	str r0, [r6, #0x64]
	adds r0, r4, #0
	bl GetAnimPosition
	cmp r0, #0
	bne _0804E08C
	ldr r0, _0804E088 @ =gAnims
	ldr r1, [r0, #8]
	str r1, [r6, #0x5c]
	ldr r0, [r0]
	b _0804E094
	.align 2, 0
_0804E080: .4byte 0x02017728
_0804E084: .4byte gUnk_08C09F38
_0804E088: .4byte gAnims
_0804E08C:
	ldr r0, _0804E0E8 @ =gAnims
	ldr r1, [r0]
	str r1, [r6, #0x5c]
	ldr r0, [r0, #8]
_0804E094:
	str r0, [r6, #0x60]
	ldr r4, _0804E0EC @ =gEfxPairHpBufOffset
	ldr r0, [r6, #0x60]
	bl GetAnimPosition
	lsls r0, r0, #1
	adds r0, r0, r4
	movs r1, #0
	ldrsh r5, [r0, r1]
	adds r4, r5, #1
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	ldr r0, [r6, #0x60]
	bl GetAnimPosition
	lsls r5, r5, #1
	adds r5, r5, r0
	adds r0, r5, #0
	bl GetEfxHp
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	str r0, [r6, #0x4c]
	ldr r0, [r6, #0x60]
	bl GetAnimPosition
	lsls r4, r4, #0x10
	asrs r4, r4, #0xf
	adds r4, r4, r0
	adds r0, r4, #0
	bl GetEfxHp
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	str r0, [r6, #0x50]
	ldr r1, [r6, #0x4c]
	cmp r1, r0
	ble _0804E0F0
	movs r0, #1
	rsbs r0, r0, #0
	b _0804E0F2
	.align 2, 0
_0804E0E8: .4byte gAnims
_0804E0EC: .4byte gEfxPairHpBufOffset
_0804E0F0:
	movs r0, #1
_0804E0F2:
	str r0, [r6, #0x48]
	adds r0, r6, #0
	adds r0, #0x29
	movs r1, #0
	strb r1, [r0]
	strh r1, [r6, #0x2c]
	ldr r0, [r6, #0x4c]
	strh r0, [r6, #0x2e]
	str r1, [r6, #0x54]
	str r1, [r6, #0x58]
	ldr r0, _0804E120 @ =0x02017750
	str r1, [r0]
	ldr r0, [r6, #0x60]
	bl GetAnimPosition
	ldr r1, _0804E124 @ =0x02017780
	lsls r0, r0, #1
	adds r0, r0, r1
	movs r1, #1
	strh r1, [r0]
_0804E11A:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0804E120: .4byte 0x02017750
_0804E124: .4byte 0x02017780

	thumb_func_start sub_0804E128
sub_0804E128: @ 0x0804E128
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	ldr r0, [r5, #0x60]
	bl GetAnimPosition
	ldr r0, [r5, #0x60]
	bl GetAnimPosition
	ldr r1, [r5, #0x58]
	cmp r1, #0
	bne _0804E178
	ldrh r0, [r5, #0x2c]
	adds r0, #1
	strh r0, [r5, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #2
	bne _0804E178
	strh r1, [r5, #0x2c]
	ldr r0, [r5, #0x48]
	ldrh r1, [r5, #0x2e]
	adds r0, r1, r0
	strh r0, [r5, #0x2e]
	ldr r0, [r5, #0x60]
	bl GetAnimPosition
	ldr r1, _0804E1C4 @ =gEkrPairHpInitial
	lsls r0, r0, #1
	adds r0, r0, r1
	ldr r1, [r5, #0x48]
	ldrh r2, [r0]
	adds r1, r2, r1
	strh r1, [r0]
	movs r0, #0x2e
	ldrsh r1, [r5, r0]
	ldr r0, [r5, #0x50]
	cmp r1, r0
	bne _0804E178
	movs r0, #1
	str r0, [r5, #0x58]
_0804E178:
	ldr r0, [r5, #0x54]
	cmp r0, #0x54
	bne _0804E1D4
	ldr r6, [r5, #0x58]
	cmp r6, #1
	bne _0804E1D4
	ldr r4, _0804E1C8 @ =gEfxPairHpBufOffset
	ldr r0, [r5, #0x60]
	bl GetAnimPosition
	lsls r0, r0, #1
	adds r0, r0, r4
	ldrh r1, [r0]
	adds r1, #1
	movs r4, #0
	strh r1, [r0]
	ldr r0, [r5, #0x60]
	bl GetAnimPosition
	ldr r1, _0804E1CC @ =0x02017780
	lsls r0, r0, #1
	adds r0, r0, r1
	strh r4, [r0]
	ldr r0, [r5, #0x50]
	cmp r0, #0
	bne _0804E1B2
	adds r0, r5, #0
	adds r0, #0x29
	strb r6, [r0]
_0804E1B2:
	strh r4, [r5, #0x2c]
	movs r0, #0xa
	strh r0, [r5, #0x2e]
	ldr r0, _0804E1D0 @ =0x02017750
	str r6, [r0]
	adds r0, r5, #0
	bl Proc_Break
	b _0804E1E0
	.align 2, 0
_0804E1C4: .4byte gEkrPairHpInitial
_0804E1C8: .4byte gEfxPairHpBufOffset
_0804E1CC: .4byte 0x02017780
_0804E1D0: .4byte 0x02017750
_0804E1D4:
	adds r0, #1
	str r0, [r5, #0x54]
	cmp r0, #0x53
	bls _0804E1E0
	movs r0, #0x54
	str r0, [r5, #0x54]
_0804E1E0:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_0804E1E8
sub_0804E1E8: @ 0x0804E1E8
	push {r4, r5, r6, r7, lr}
	adds r6, r0, #0
	ldrh r0, [r6, #0x2c]
	adds r0, #1
	movs r7, #0
	strh r0, [r6, #0x2c]
	lsls r0, r0, #0x10
	ldrh r2, [r6, #0x2e]
	lsls r1, r2, #0x10
	cmp r0, r1
	ble _0804E282
	ldr r4, _0804E264 @ =gEfxPairHpBufOffset
	ldr r0, [r6, #0x5c]
	bl GetAnimPosition
	lsls r0, r0, #1
	adds r0, r0, r4
	movs r1, #0
	ldrsh r5, [r0, r1]
	adds r4, r5, #1
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	ldr r0, [r6, #0x5c]
	bl GetAnimPosition
	lsls r5, r5, #1
	adds r5, r5, r0
	adds r0, r5, #0
	bl GetEfxHp
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	str r0, [r6, #0x4c]
	ldr r0, [r6, #0x5c]
	bl GetAnimPosition
	lsls r4, r4, #0x10
	asrs r4, r4, #0xf
	adds r4, r4, r0
	adds r0, r4, #0
	bl GetEfxHp
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	str r0, [r6, #0x50]
	strh r7, [r6, #0x2c]
	ldr r1, [r6, #0x4c]
	strh r1, [r6, #0x2e]
	str r7, [r6, #0x54]
	str r7, [r6, #0x58]
	cmp r1, r0
	bne _0804E254
	movs r0, #1
	str r0, [r6, #0x58]
_0804E254:
	ldr r1, [r6, #0x4c]
	ldr r0, [r6, #0x50]
	cmp r1, r0
	ble _0804E268
	movs r0, #1
	rsbs r0, r0, #0
	b _0804E26A
	.align 2, 0
_0804E264: .4byte gEfxPairHpBufOffset
_0804E268:
	movs r0, #1
_0804E26A:
	str r0, [r6, #0x48]
	adds r0, r6, #0
	bl Proc_Break
	ldr r0, [r6, #0x5c]
	bl GetAnimPosition
	ldr r1, _0804E288 @ =0x02017780
	lsls r0, r0, #1
	adds r0, r0, r1
	movs r1, #2
	strh r1, [r0]
_0804E282:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0804E288: .4byte 0x02017780

	thumb_func_start sub_0804E28C
sub_0804E28C: @ 0x0804E28C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r5, r0, #0
	ldr r4, _0804E364 @ =gAnims
	ldr r0, [r5, #0x5c]
	bl GetAnimPosition
	lsls r0, r0, #3
	adds r0, r0, r4
	ldr r7, [r0]
	ldr r0, [r5, #0x5c]
	bl GetAnimPosition
	ldr r0, [r5, #0x60]
	bl GetAnimPosition
	lsls r0, r0, #3
	adds r0, r0, r4
	ldr r6, [r0]
	ldr r0, [r5, #0x60]
	bl GetAnimPosition
	lsls r0, r0, #1
	adds r0, #1
	lsls r0, r0, #2
	adds r0, r0, r4
	ldr r0, [r0]
	mov r8, r0
	ldr r1, [r5, #0x58]
	cmp r1, #0
	bne _0804E31E
	ldrh r0, [r5, #0x2c]
	adds r0, #1
	strh r0, [r5, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #4
	bne _0804E31E
	strh r1, [r5, #0x2c]
	ldr r0, [r5, #0x48]
	ldrh r1, [r5, #0x2e]
	adds r0, r1, r0
	strh r0, [r5, #0x2e]
	ldr r0, [r5, #0x5c]
	bl GetAnimPosition
	ldr r1, _0804E368 @ =gEkrPairHpInitial
	lsls r0, r0, #1
	adds r0, r0, r1
	ldr r1, [r5, #0x48]
	ldrh r2, [r0]
	adds r1, r2, r1
	strh r1, [r0]
	ldr r4, _0804E36C @ =0x00000395
	movs r1, #0x80
	lsls r1, r1, #1
	adds r0, r4, #0
	bl EfxPlaySE
	movs r0, #2
	ldrsh r1, [r7, r0]
	adds r0, r4, #0
	movs r2, #1
	bl M4aPlayWithPostionCtrl
	movs r2, #0x2e
	ldrsh r1, [r5, r2]
	ldr r0, [r5, #0x50]
	cmp r1, r0
	bne _0804E31E
	movs r0, #1
	str r0, [r5, #0x58]
_0804E31E:
	ldr r1, [r5, #0x54]
	cmp r1, #0x1e
	bne _0804E3C8
	ldr r0, [r5, #0x58]
	cmp r0, #1
	bne _0804E3C8
	ldr r4, _0804E370 @ =gEfxPairHpBufOffset
	ldr r0, [r5, #0x5c]
	bl GetAnimPosition
	lsls r0, r0, #1
	adds r0, r0, r4
	ldrh r1, [r0]
	adds r1, #1
	movs r4, #0
	strh r1, [r0]
	ldr r0, [r5, #0x5c]
	bl GetAnimPosition
	ldr r1, _0804E374 @ =0x02017780
	lsls r0, r0, #1
	adds r0, r0, r1
	strh r4, [r0]
	adds r0, r5, #0
	adds r0, #0x29
	ldrb r0, [r0]
	cmp r0, #1
	bne _0804E3BC
	bl GetBanimLinkArenaFlag
	cmp r0, #1
	bne _0804E378
	movs r0, #0
	b _0804E38C
	.align 2, 0
_0804E364: .4byte gAnims
_0804E368: .4byte gEkrPairHpInitial
_0804E36C: .4byte 0x00000395
_0804E370: .4byte gEfxPairHpBufOffset
_0804E374: .4byte 0x02017780
_0804E378:
	ldr r4, _0804E39C @ =gEkrPids
	adds r0, r6, #0
	bl GetAnimPosition
	adds r0, r0, r4
	ldrb r0, [r0]
	bl sub_08079CE4
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
_0804E38C:
	cmp r0, #1
	bne _0804E3A0
	adds r0, r6, #0
	mov r1, r8
	bl sub_0804E7F4
	b _0804E3BC
	.align 2, 0
_0804E39C: .4byte gEkrPids
_0804E3A0:
	bl sub_08055D2C
	adds r0, r6, #0
	mov r1, r8
	bl sub_0804E9D0
	ldr r0, [r5, #0x60]
	bl GetAnimPosition
	ldr r1, _0804E3C4 @ =0x0203DFE8
	lsls r0, r0, #1
	adds r0, r0, r1
	movs r1, #0
	strh r1, [r0]
_0804E3BC:
	adds r0, r5, #0
	bl Proc_Break
	b _0804E3D4
	.align 2, 0
_0804E3C4: .4byte 0x0203DFE8
_0804E3C8:
	adds r0, r1, #1
	str r0, [r5, #0x54]
	cmp r0, #0x1d
	bls _0804E3D4
	movs r0, #0x1e
	str r0, [r5, #0x54]
_0804E3D4:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_0804E3E0
sub_0804E3E0: @ 0x0804E3E0
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	ldr r1, _0804E410 @ =0x02017728
	ldr r5, [r1]
	cmp r5, #0
	bne _0804E44E
	movs r0, #1
	str r0, [r1]
	ldr r0, _0804E414 @ =gUnk_08C09F70
	movs r1, #3
	bl Proc_Start
	adds r4, r0, #0
	strh r5, [r4, #0x2c]
	adds r0, r6, #0
	bl GetAnimPosition
	cmp r0, #0
	bne _0804E41C
	ldr r0, _0804E418 @ =gAnims
	ldr r1, [r0, #8]
	str r1, [r4, #0x5c]
	ldr r0, [r0]
	b _0804E424
	.align 2, 0
_0804E410: .4byte 0x02017728
_0804E414: .4byte gUnk_08C09F70
_0804E418: .4byte gAnims
_0804E41C:
	ldr r0, _0804E454 @ =gAnims
	ldr r1, [r0]
	str r1, [r4, #0x5c]
	ldr r0, [r0, #8]
_0804E424:
	str r0, [r4, #0x60]
	ldr r0, [r4, #0x60]
	movs r1, #1
	bl sub_08062C68
	str r6, [r4, #0x64]
	adds r1, r4, #0
	adds r1, #0x29
	movs r0, #0
	strb r0, [r1]
	movs r1, #0x80
	lsls r1, r1, #1
	movs r0, #0xd7
	bl EfxPlaySE
	movs r0, #2
	ldrsh r1, [r6, r0]
	movs r0, #0xd7
	movs r2, #1
	bl M4aPlayWithPostionCtrl
_0804E44E:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0804E454: .4byte gAnims

	thumb_func_start sub_0804E458
sub_0804E458: @ 0x0804E458
	push {lr}
	adds r1, r0, #0
	ldrh r0, [r1, #0x2c]
	adds r0, #1
	strh r0, [r1, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x1e
	bne _0804E470
	adds r0, r1, #0
	bl Proc_Break
_0804E470:
	pop {r0}
	bx r0

	thumb_func_start sub_0804E474
sub_0804E474: @ 0x0804E474
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	ldr r1, _0804E4A4 @ =0x02017728
	ldr r0, [r1]
	cmp r0, #0
	bne _0804E540
	movs r0, #1
	str r0, [r1]
	ldr r0, _0804E4A8 @ =gUnk_08C09F98
	movs r1, #3
	bl Proc_Start
	adds r6, r0, #0
	adds r0, r7, #0
	bl GetAnimPosition
	cmp r0, #0
	bne _0804E4B0
	ldr r0, _0804E4AC @ =gAnims
	ldr r1, [r0, #8]
	str r1, [r6, #0x5c]
	ldr r0, [r0]
	b _0804E4B8
	.align 2, 0
_0804E4A4: .4byte 0x02017728
_0804E4A8: .4byte gUnk_08C09F98
_0804E4AC: .4byte gAnims
_0804E4B0:
	ldr r0, _0804E510 @ =gAnims
	ldr r1, [r0]
	str r1, [r6, #0x5c]
	ldr r0, [r0, #8]
_0804E4B8:
	str r0, [r6, #0x60]
	ldr r4, _0804E514 @ =gEfxPairHpBufOffset
	ldr r0, [r6, #0x60]
	bl GetAnimPosition
	lsls r0, r0, #1
	adds r0, r0, r4
	movs r1, #0
	ldrsh r5, [r0, r1]
	adds r4, r5, #1
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	ldr r0, [r6, #0x60]
	bl GetAnimPosition
	lsls r5, r5, #1
	adds r5, r5, r0
	adds r0, r5, #0
	bl GetEfxHp
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	str r0, [r6, #0x4c]
	ldr r0, [r6, #0x60]
	bl GetAnimPosition
	lsls r4, r4, #0x10
	asrs r4, r4, #0xf
	adds r4, r4, r0
	adds r0, r4, #0
	bl GetEfxHp
	lsls r0, r0, #0x10
	asrs r1, r0, #0x10
	str r1, [r6, #0x50]
	movs r0, #0
	str r0, [r6, #0x54]
	str r0, [r6, #0x58]
	ldr r0, [r6, #0x4c]
	cmp r0, r1
	bne _0804E518
	movs r0, #1
	str r0, [r6, #0x58]
	b _0804E526
	.align 2, 0
_0804E510: .4byte gAnims
_0804E514: .4byte gEfxPairHpBufOffset
_0804E518:
	cmp r0, r1
	ble _0804E522
	movs r0, #1
	rsbs r0, r0, #0
	b _0804E524
_0804E522:
	movs r0, #1
_0804E524:
	str r0, [r6, #0x48]
_0804E526:
	movs r0, #0
	strh r0, [r6, #0x2c]
	ldr r0, [r6, #0x4c]
	strh r0, [r6, #0x2e]
	str r7, [r6, #0x64]
	ldr r0, [r6, #0x5c]
	bl GetAnimPosition
	ldr r1, _0804E548 @ =0x02017780
	lsls r0, r0, #1
	adds r0, r0, r1
	movs r1, #2
	strh r1, [r0]
_0804E540:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0804E548: .4byte 0x02017780

	thumb_func_start sub_0804E54C
sub_0804E54C: @ 0x0804E54C
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	ldr r6, [r5, #0x60]
	ldr r1, [r5, #0x58]
	cmp r1, #0
	bne _0804E5AA
	ldrh r0, [r5, #0x2c]
	adds r0, #1
	strh r0, [r5, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #4
	bne _0804E5AA
	strh r1, [r5, #0x2c]
	ldr r0, [r5, #0x48]
	ldrh r1, [r5, #0x2e]
	adds r0, r1, r0
	strh r0, [r5, #0x2e]
	adds r0, r6, #0
	bl GetAnimPosition
	ldr r1, _0804E5E0 @ =gEkrPairHpInitial
	lsls r0, r0, #1
	adds r0, r0, r1
	ldr r1, [r5, #0x48]
	ldrh r2, [r0]
	adds r1, r2, r1
	strh r1, [r0]
	ldr r4, _0804E5E4 @ =0x00000395
	movs r1, #0x80
	lsls r1, r1, #1
	adds r0, r4, #0
	bl EfxPlaySE
	movs r0, #2
	ldrsh r1, [r6, r0]
	adds r0, r4, #0
	movs r2, #1
	bl M4aPlayWithPostionCtrl
	movs r2, #0x2e
	ldrsh r1, [r5, r2]
	ldr r0, [r5, #0x50]
	cmp r1, r0
	bne _0804E5AA
	movs r0, #1
	str r0, [r5, #0x58]
_0804E5AA:
	ldr r1, [r5, #0x54]
	cmp r1, #0x1e
	bne _0804E5F0
	ldr r0, [r5, #0x58]
	cmp r0, #1
	bne _0804E5F0
	ldr r4, _0804E5E8 @ =gEfxPairHpBufOffset
	adds r0, r6, #0
	bl GetAnimPosition
	lsls r0, r0, #1
	adds r0, r0, r4
	ldrh r1, [r0]
	adds r1, #1
	movs r4, #0
	strh r1, [r0]
	adds r0, r6, #0
	bl GetAnimPosition
	ldr r1, _0804E5EC @ =0x02017780
	lsls r0, r0, #1
	adds r0, r0, r1
	strh r4, [r0]
	adds r0, r5, #0
	bl Proc_Break
	b _0804E5FC
	.align 2, 0
_0804E5E0: .4byte gEkrPairHpInitial
_0804E5E4: .4byte 0x00000395
_0804E5E8: .4byte gEfxPairHpBufOffset
_0804E5EC: .4byte 0x02017780
_0804E5F0:
	adds r0, r1, #1
	str r0, [r5, #0x54]
	cmp r0, #0x1d
	bls _0804E5FC
	movs r0, #0x1e
	str r0, [r5, #0x54]
_0804E5FC:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_0804E604
sub_0804E604: @ 0x0804E604
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	adds r5, r0, #0
	adds r6, r1, #0
	mov r8, r2
	ldr r1, _0804E650 @ =0x02017728
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _0804E654 @ =gUnk_08C09FC0
	movs r1, #3
	bl Proc_Start
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	str r6, [r4, #0x60]
	movs r0, #0
	strh r0, [r4, #0x2c]
	adds r0, r4, #0
	adds r0, #0x29
	mov r1, r8
	strb r1, [r0]
	str r5, [r4, #0x64]
	ldr r0, [r4, #0x5c]
	movs r1, #0
	bl sub_08062C68
	ldr r0, [r4, #0x5c]
	ldr r1, [r4, #0x60]
	bl sub_0804E6AC
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0804E650: .4byte 0x02017728
_0804E654: .4byte gUnk_08C09FC0

	thumb_func_start sub_0804E658
sub_0804E658: @ 0x0804E658
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x5c]
	bl GetAnimAnotherSide
	adds r5, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	cmp r0, #8
	bne _0804E6A0
	ldr r6, _0804E6A8 @ =gEfxPairHpBufOffset
	ldr r0, [r4, #0x5c]
	bl GetAnimPosition
	lsls r0, r0, #1
	adds r0, r0, r6
	ldrh r1, [r0]
	adds r1, #1
	strh r1, [r0]
	adds r0, r4, #0
	adds r0, #0x29
	ldrb r0, [r0]
	cmp r0, #1
	bne _0804E69A
	adds r0, r5, #0
	bl GetAnimPosition
	lsls r0, r0, #1
	adds r0, r0, r6
	ldrh r1, [r0]
	adds r1, #1
	strh r1, [r0]
_0804E69A:
	adds r0, r4, #0
	bl Proc_Break
_0804E6A0:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0804E6A8: .4byte gEfxPairHpBufOffset

	thumb_func_start sub_0804E6AC
sub_0804E6AC: @ 0x0804E6AC
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r0, _0804E6CC @ =gUnk_08C09FE8
	movs r1, #3
	bl Proc_Start
	str r4, [r0, #0x5c]
	str r5, [r0, #0x60]
	movs r1, #0
	strh r1, [r0, #0x2c]
	strh r1, [r0, #0x2e]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0804E6CC: .4byte gUnk_08C09FE8

	thumb_func_start sub_0804E6D0
sub_0804E6D0: @ 0x0804E6D0
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	adds r7, r0, #0
	ldr r0, [r7, #0x5c]
	mov r8, r0
	ldr r1, [r7, #0x60]
	mov sb, r1
	ldr r4, _0804E72C @ =gUnk_081DDB58
	movs r2, #0x2c
	ldrsh r0, [r7, r2]
	lsls r0, r0, #1
	adds r0, r0, r4
	movs r2, #0
	ldrsh r1, [r0, r2]
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	bne _0804E738
	mov r0, r8
	bl GetAnimPosition
	ldr r5, _0804E730 @ =gEkrXPosReal
	lsls r0, r0, #1
	adds r0, r0, r5
	ldr r4, _0804E734 @ =gEkrBgPosition
	ldrh r0, [r0]
	ldrh r1, [r4]
	subs r0, r0, r1
	mov r2, r8
	strh r0, [r2, #2]
	ldr r0, [r7, #0x60]
	bl GetAnimPosition
	lsls r0, r0, #1
	adds r0, r0, r5
	ldrh r0, [r0]
	ldrh r4, [r4]
	subs r0, r0, r4
	mov r1, sb
	strh r0, [r1, #2]
	adds r0, r7, #0
	bl Proc_Break
	b _0804E798
	.align 2, 0
_0804E72C: .4byte gUnk_081DDB58
_0804E730: .4byte gEkrXPosReal
_0804E734: .4byte gEkrBgPosition
_0804E738:
	mov r0, r8
	bl GetAnimPosition
	cmp r0, #1
	bne _0804E754
	movs r2, #0x2c
	ldrsh r0, [r7, r2]
	lsls r0, r0, #1
	adds r0, r0, r4
	ldrh r0, [r0]
	rsbs r0, r0, #0
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	b _0804E75E
_0804E754:
	movs r1, #0x2c
	ldrsh r0, [r7, r1]
	lsls r0, r0, #1
	adds r0, r0, r4
	ldrh r4, [r0]
_0804E75E:
	ldr r0, [r7, #0x5c]
	bl GetAnimPosition
	ldr r6, _0804E7A4 @ =gEkrXPosReal
	lsls r0, r0, #1
	adds r0, r0, r6
	ldr r5, _0804E7A8 @ =gEkrBgPosition
	ldr r1, [r5]
	ldrh r0, [r0]
	subs r1, r0, r1
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	adds r1, r4, r1
	mov r2, r8
	strh r1, [r2, #2]
	ldr r0, [r7, #0x60]
	bl GetAnimPosition
	lsls r0, r0, #1
	adds r0, r0, r6
	ldr r1, [r5]
	ldrh r0, [r0]
	subs r1, r0, r1
	adds r4, r4, r1
	mov r0, sb
	strh r4, [r0, #2]
	ldrh r0, [r7, #0x2c]
	adds r0, #1
	strh r0, [r7, #0x2c]
_0804E798:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0804E7A4: .4byte gEkrXPosReal
_0804E7A8: .4byte gEkrBgPosition

	thumb_func_start sub_0804E7AC
sub_0804E7AC: @ 0x0804E7AC
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r1, _0804E7D0 @ =0x02017728
	ldr r4, [r1]
	cmp r4, #0
	bne _0804E7C8
	movs r0, #1
	str r0, [r1]
	ldr r0, _0804E7D4 @ =gUnk_08C0A000
	movs r1, #3
	bl Proc_Start
	strh r4, [r0, #0x2c]
	str r5, [r0, #0x64]
_0804E7C8:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0804E7D0: .4byte 0x02017728
_0804E7D4: .4byte gUnk_08C0A000

	thumb_func_start sub_0804E7D8
sub_0804E7D8: @ 0x0804E7D8
	push {lr}
	adds r1, r0, #0
	ldrh r0, [r1, #0x2c]
	adds r0, #1
	strh r0, [r1, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x11
	bne _0804E7F0
	adds r0, r1, #0
	bl Proc_Break
_0804E7F0:
	pop {r0}
	bx r0

	thumb_func_start sub_0804E7F4
sub_0804E7F4: @ 0x0804E7F4
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r0, _0804E814 @ =gUnk_08C0A030
	movs r1, #3
	bl Proc_Start
	str r4, [r0, #0x5c]
	str r5, [r0, #0x60]
	ldr r1, _0804E818 @ =0x02017738
	movs r0, #1
	str r0, [r1]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0804E814: .4byte gUnk_08C0A030
_0804E818: .4byte 0x02017738

	thumb_func_start sub_0804E81C
sub_0804E81C: @ 0x0804E81C
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	ldr r0, [r5, #0x5c]
	bl GetAnimAnotherSide
	adds r7, r0, #0
	movs r6, #0
	ldr r0, _0804E888 @ =gEfxBgSemaphore
	ldr r0, [r0]
	cmp r0, #0
	bne _0804E84E
	ldr r0, _0804E88C @ =0x0201772C
	ldr r0, [r0]
	cmp r0, #0
	bne _0804E84E
	ldr r4, _0804E890 @ =gBanimDoneFlag
	adds r0, r7, #0
	bl GetAnimPosition
	lsls r0, r0, #2
	adds r0, r0, r4
	ldr r0, [r0]
	cmp r0, #1
	bne _0804E84E
	movs r6, #1
_0804E84E:
	cmp r6, #1
	bne _0804E882
	movs r0, #7
	strh r0, [r5, #0x2c]
	ldr r0, _0804E894 @ =gEkrDistanceType
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	beq _0804E87C
	ldr r0, [r5, #0x5c]
	bl GetAnimPosition
	ldr r1, _0804E898 @ =gEkrInitPosReal
	ldr r1, [r1]
	cmp r0, r1
	beq _0804E87C
	movs r1, #1
	rsbs r1, r1, #0
	adds r0, r7, #0
	bl sub_0804EC74
	movs r0, #0
	strh r0, [r5, #0x2c]
_0804E87C:
	adds r0, r5, #0
	bl Proc_Break
_0804E882:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0804E888: .4byte gEfxBgSemaphore
_0804E88C: .4byte 0x0201772C
_0804E890: .4byte gBanimDoneFlag
_0804E894: .4byte gEkrDistanceType
_0804E898: .4byte gEkrInitPosReal

	thumb_func_start sub_0804E89C
sub_0804E89C: @ 0x0804E89C
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #8
	bne _0804E8C6
	movs r0, #1
	movs r1, #7
	bl NewEkrWindowAppear
	movs r0, #1
	movs r1, #7
	movs r2, #0
	bl NewEkrNamewinAppear
	adds r0, r4, #0
	bl Proc_Break
_0804E8C6:
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_0804E8CC
sub_0804E8CC: @ 0x0804E8CC
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	bl CheckEkrWindowAppearUnexist
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne _0804E92A
	bl EnableEkrGauge
	bl EkrGauge_0804D60C
	movs r0, #0
	str r0, [sp]
	ldr r1, _0804E934 @ =gBg0Tm
	ldr r2, _0804E938 @ =0x01000200
	mov r0, sp
	bl CpuFastSet
	ldr r0, _0804E93C @ =0x02000038
	ldrh r1, [r0]
	ldrh r2, [r0, #2]
	movs r0, #0
	bl SetBgOffset
	movs r0, #1
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	movs r0, #1
	bl EnableBgSync
	bl EkrGauge_0804CC38
	ldr r4, _0804E940 @ =gEkrPids
	ldr r0, [r5, #0x5c]
	bl GetAnimPosition
	adds r0, r0, r4
	ldrb r0, [r0]
	bl sub_08079DF4
	adds r0, r5, #0
	bl Proc_Break
_0804E92A:
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0804E934: .4byte gBg0Tm
_0804E938: .4byte 0x01000200
_0804E93C: .4byte 0x02000038
_0804E940: .4byte gEkrPids

	thumb_func_start sub_0804E944
sub_0804E944: @ 0x0804E944
	push {r4, r5, lr}
	adds r4, r0, #0
	bl IsEventRunning
	lsls r0, r0, #0x18
	asrs r5, r0, #0x18
	cmp r5, #0
	bne _0804E99C
	bl sub_08055D2C
	ldr r0, [r4, #0x5c]
	ldr r1, [r4, #0x60]
	bl sub_0804E9D0
	bl EfxPrepareScreenFx
	ldr r0, [r4, #0x5c]
	bl GetAnimPosition
	ldr r1, _0804E9A4 @ =0x0203DFE8
	lsls r0, r0, #1
	adds r0, r0, r1
	strh r5, [r0]
	movs r0, #1
	bl EnableBgSync
	movs r0, #0
	movs r1, #7
	bl NewEkrWindowAppear
	movs r0, #0
	movs r1, #7
	movs r2, #0
	bl NewEkrNamewinAppear
	bl DisableEkrGauge
	bl EkrGauge_0804D61C
	bl EkrGauge_0804CC28
	adds r0, r4, #0
	bl Proc_Break
_0804E99C:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0804E9A4: .4byte 0x0203DFE8

	thumb_func_start sub_0804E9A8
sub_0804E9A8: @ 0x0804E9A8
	push {r4, lr}
	adds r4, r0, #0
	bl CheckEkrWindowAppearUnexist
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne _0804E9C4
	ldr r1, _0804E9CC @ =0x02017738
	movs r0, #0
	str r0, [r1]
	adds r0, r4, #0
	bl Proc_Break
_0804E9C4:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0804E9CC: .4byte 0x02017738

	thumb_func_start sub_0804E9D0
sub_0804E9D0: @ 0x0804E9D0
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r1, _0804EA04 @ =0x02017728
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r1, _0804EA08 @ =0x02017734
	movs r0, #1
	str r0, [r1]
	ldr r0, _0804EA0C @ =gUnk_08C0A068
	movs r1, #3
	bl Proc_Start
	str r4, [r0, #0x5c]
	str r5, [r0, #0x60]
	movs r1, #0
	strh r1, [r0, #0x2c]
	strh r1, [r0, #0x2e]
	adds r0, r4, #0
	bl sub_0804FFAC
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0804EA04: .4byte 0x02017728
_0804EA08: .4byte 0x02017734
_0804EA0C: .4byte gUnk_08C0A068

	thumb_func_start sub_0804EA10
sub_0804EA10: @ 0x0804EA10
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0804EA34 @ =gEfxBgSemaphore
	ldr r0, [r0]
	cmp r0, #0
	bne _0804EA4E
	ldr r0, _0804EA38 @ =0x0201772C
	ldr r0, [r0]
	cmp r0, #0
	bne _0804EA4E
	bl CheckInEkrDragon
	cmp r0, #0
	beq _0804EA3C
	ldr r0, [r4, #0x5c]
	bl SetEkrDragonDead
	b _0804EA44
	.align 2, 0
_0804EA34: .4byte gEfxBgSemaphore
_0804EA38: .4byte 0x0201772C
_0804EA3C:
	ldr r0, [r4, #0x5c]
	ldr r1, [r4, #0x60]
	bl sub_0804EAC4
_0804EA44:
	movs r0, #0x32
	strh r0, [r4, #0x2e]
	adds r0, r4, #0
	bl Proc_Break
_0804EA4E:
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_0804EA54
sub_0804EA54: @ 0x0804EA54
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r5, [r4, #0x5c]
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r1, r0, #0x10
	cmp r1, #0x1e
	bne _0804EA9A
	adds r0, r5, #0
	bl CheckEkrDragonDead
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	beq _0804EAB6
	ldr r0, [r4, #0x5c]
	ldr r1, [r4, #0x60]
	bl sub_0804EB48
	movs r1, #0x80
	lsls r1, r1, #1
	movs r0, #0xd6
	bl EfxPlaySE
	movs r0, #2
	ldrsh r1, [r5, r0]
	movs r0, #0xd6
	movs r2, #1
	bl M4aPlayWithPostionCtrl
	movs r0, #0x32
	strh r0, [r4, #0x2e]
	b _0804EAB6
_0804EA9A:
	movs r2, #0x2e
	ldrsh r0, [r4, r2]
	cmp r1, r0
	bne _0804EAB6
	ldr r1, _0804EABC @ =0x02017728
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	ldr r1, _0804EAC0 @ =0x02017734
	movs r0, #0
	str r0, [r1]
	adds r0, r4, #0
	bl Proc_Break
_0804EAB6:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0804EABC: .4byte 0x02017728
_0804EAC0: .4byte 0x02017734

	thumb_func_start sub_0804EAC4
sub_0804EAC4: @ 0x0804EAC4
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r0, _0804EAE4 @ =gUnk_08C0A088
	movs r1, #3
	bl Proc_Start
	str r4, [r0, #0x5c]
	str r5, [r0, #0x60]
	movs r1, #0
	strh r1, [r0, #0x2c]
	strh r1, [r0, #0x2e]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0804EAE4: .4byte gUnk_08C0A088

	thumb_func_start sub_0804EAE8
sub_0804EAE8: @ 0x0804EAE8
	push {r4, r5, lr}
	adds r2, r0, #0
	ldr r3, [r2, #0x5c]
	ldr r4, [r2, #0x60]
	ldrh r0, [r2, #0x2c]
	adds r0, #1
	strh r0, [r2, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #6
	ble _0804EB20
	ldr r1, _0804EB1C @ =0x0000FFFD
	adds r0, r1, #0
	ldrh r5, [r3]
	ands r0, r5
	strh r0, [r3]
	ldrh r0, [r4]
	ands r1, r0
	strh r1, [r4]
	movs r0, #0
	strh r0, [r2, #0x2c]
	ldrh r0, [r2, #0x2e]
	adds r0, #1
	strh r0, [r2, #0x2e]
	b _0804EB2E
	.align 2, 0
_0804EB1C: .4byte 0x0000FFFD
_0804EB20:
	movs r0, #2
	ldrh r1, [r3]
	orrs r1, r0
	strh r1, [r3]
	ldrh r1, [r4]
	orrs r0, r1
	strh r0, [r4]
_0804EB2E:
	movs r5, #0x2e
	ldrsh r0, [r2, r5]
	cmp r0, #5
	ble _0804EB42
	movs r0, #0
	strh r0, [r2, #0x2c]
	strh r0, [r2, #0x2e]
	adds r0, r2, #0
	bl Proc_Break
_0804EB42:
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start sub_0804EB48
sub_0804EB48: @ 0x0804EB48
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r0, _0804EBB0 @ =gUnk_08C0A0A0
	movs r1, #3
	bl Proc_Start
	str r4, [r0, #0x5c]
	str r5, [r0, #0x60]
	movs r6, #0
	movs r1, #0
	strh r1, [r0, #0x2c]
	strh r1, [r0, #0x2e]
	movs r0, #0xa
	strh r0, [r4, #0xa]
	strh r0, [r5, #0xa]
	bl AnimSort
	ldr r2, _0804EBB4 @ =gDispIo
	adds r1, r2, #0
	adds r1, #0x3c
	movs r0, #0x3f
	ldrb r3, [r1]
	ands r0, r3
	strb r0, [r1]
	adds r0, r2, #0
	adds r0, #0x44
	movs r1, #0x10
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r0, #1
	strb r6, [r0]
	ldr r0, _0804EBB8 @ =0x0000FFE0
	ldrh r1, [r2, #0x3c]
	ands r0, r1
	ldr r1, _0804EBBC @ =0x0000E0FF
	ands r0, r1
	movs r3, #0xc0
	lsls r3, r3, #4
	adds r1, r3, #0
	orrs r0, r1
	strh r0, [r2, #0x3c]
	adds r1, r2, #0
	adds r1, #0x3d
	movs r0, #0x20
	ldrb r2, [r1]
	orrs r0, r2
	strb r0, [r1]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0804EBB0: .4byte gUnk_08C0A0A0
_0804EBB4: .4byte gDispIo
_0804EBB8: .4byte 0x0000FFE0
_0804EBBC: .4byte 0x0000E0FF

	thumb_func_start sub_0804EBC0
sub_0804EBC0: @ 0x0804EBC0
	push {r4, r5, lr}
	sub sp, #4
	adds r4, r0, #0
	ldr r2, [r4, #0x5c]
	ldr r3, [r4, #0x60]
	ldr r0, [r2, #0x1c]
	movs r1, #0x80
	lsls r1, r1, #3
	orrs r0, r1
	str r0, [r2, #0x1c]
	ldr r0, [r3, #0x1c]
	orrs r0, r1
	str r0, [r3, #0x1c]
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	movs r5, #0
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x3c
	ble _0804EC34
	movs r0, #2
	ldrh r1, [r2]
	orrs r1, r0
	strh r1, [r2]
	ldrh r1, [r3]
	orrs r0, r1
	strh r0, [r3]
	ldr r0, [r2, #0x1c]
	ldr r1, _0804EC2C @ =0xFFFFFBFF
	ands r0, r1
	str r0, [r2, #0x1c]
	ldr r0, [r3, #0x1c]
	ands r0, r1
	str r0, [r3, #0x1c]
	ldr r2, _0804EC30 @ =gDispIo
	adds r1, r2, #0
	adds r1, #0x3c
	movs r0, #0x3f
	ldrb r3, [r1]
	ands r0, r3
	strb r0, [r1]
	adds r1, #8
	movs r0, #0x10
	strb r0, [r1]
	adds r0, r2, #0
	adds r0, #0x45
	strb r5, [r0]
	adds r0, #1
	strb r5, [r0]
	adds r0, r4, #0
	bl Proc_Break
	b _0804EC66
	.align 2, 0
_0804EC2C: .4byte 0xFFFFFBFF
_0804EC30: .4byte gDispIo
_0804EC34:
	movs r0, #0x2c
	ldrsh r3, [r4, r0]
	movs r0, #0x3c
	str r0, [sp]
	movs r0, #0
	movs r1, #0x10
	movs r2, #0
	bl Interpolate
	ldr r3, _0804EC70 @ =gDispIo
	adds r2, r3, #0
	adds r2, #0x3c
	movs r1, #0x3f
	ldrb r4, [r2]
	ands r1, r4
	strb r1, [r2]
	adds r1, r3, #0
	adds r1, #0x44
	strb r0, [r1]
	adds r1, #1
	movs r0, #0x10
	strb r0, [r1]
	adds r0, r3, #0
	adds r0, #0x46
	strb r5, [r0]
_0804EC66:
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0804EC70: .4byte gDispIo

	thumb_func_start sub_0804EC74
sub_0804EC74: @ 0x0804EC74
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	lsls r1, r1, #0x10
	lsrs r6, r1, #0x10
	ldr r0, _0804EC90 @ =gEkrDistanceType
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #4
	bhi _0804ED40
	lsls r0, r0, #2
	ldr r1, _0804EC94 @ =_0804EC98
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0804EC90: .4byte gEkrDistanceType
_0804EC94: .4byte _0804EC98
_0804EC98: @ jump table
	.4byte _0804ED40 @ case 0
	.4byte _0804ECAC @ case 1
	.4byte _0804ECAC @ case 2
	.4byte _0804ED40 @ case 3
	.4byte _0804ED40 @ case 4
_0804ECAC:
	ldr r0, _0804ECE0 @ =gUnk_08C0A0B8
	movs r1, #3
	bl Proc_Start
	adds r4, r0, #0
	adds r0, r5, #0
	bl GetAnimPosition
	adds r2, r4, #0
	adds r2, #0x29
	movs r1, #0
	strb r0, [r2]
	strh r1, [r4, #0x2c]
	lsls r1, r6, #0x10
	asrs r2, r1, #0x10
	movs r0, #1
	rsbs r0, r0, #0
	cmp r2, r0
	beq _0804ECE8
	asrs r0, r1, #0x11
	strh r0, [r4, #0x2e]
	subs r0, r2, r0
	strh r0, [r4, #0x30]
	ldr r2, _0804ECE4 @ =gEkrDistanceType
	b _0804ED02
	.align 2, 0
_0804ECE0: .4byte gUnk_08C0A0B8
_0804ECE4: .4byte gEkrDistanceType
_0804ECE8:
	ldr r0, _0804ECF8 @ =gEkrDistanceType
	adds r2, r0, #0
	ldrh r0, [r2]
	cmp r0, #1
	bne _0804ECFC
	movs r0, #5
	b _0804ECFE
	.align 2, 0
_0804ECF8: .4byte gEkrDistanceType
_0804ECFC:
	movs r0, #7
_0804ECFE:
	strh r0, [r4, #0x2e]
	strh r0, [r4, #0x30]
_0804ED02:
	movs r1, #0xf0
	ldrh r2, [r2]
	cmp r2, #1
	bne _0804ED0C
	movs r1, #0x20
_0804ED0C:
	adds r0, r4, #0
	adds r0, #0x29
	ldrb r2, [r0]
	cmp r2, #0
	bne _0804ED24
	rsbs r0, r1, #0
	strh r0, [r4, #0x32]
	lsrs r0, r0, #1
	strh r0, [r4, #0x34]
	strh r0, [r4, #0x36]
	strh r2, [r4, #0x38]
	b _0804ED32
_0804ED24:
	movs r0, #0
	strh r0, [r4, #0x32]
	rsbs r1, r1, #0
	lsrs r0, r1, #1
	strh r0, [r4, #0x34]
	strh r0, [r4, #0x36]
	strh r1, [r4, #0x38]
_0804ED32:
	ldr r1, _0804ED48 @ =gEkrBgPosition
	movs r2, #0x32
	ldrsh r0, [r4, r2]
	str r0, [r1]
	ldr r1, _0804ED4C @ =0x02017748
	movs r0, #1
	str r0, [r1]
_0804ED40:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0804ED48: .4byte gEkrBgPosition
_0804ED4C: .4byte 0x02017748

	thumb_func_start sub_0804ED50
sub_0804ED50: @ 0x0804ED50
	push {r4, r5, lr}
	ldr r3, _0804ED80 @ =gAnims
	ldr r4, [r3]
	rsbs r1, r1, #0
	ldr r2, _0804ED84 @ =gEkrXPosReal
	ldrh r5, [r2]
	adds r0, r5, r1
	strh r0, [r4, #2]
	ldr r4, [r3, #4]
	ldrh r5, [r2]
	adds r0, r5, r1
	strh r0, [r4, #2]
	ldr r4, [r3, #8]
	ldrh r5, [r2, #2]
	adds r0, r5, r1
	strh r0, [r4, #2]
	ldr r4, [r3, #0xc]
	ldrh r2, [r2, #2]
	adds r1, r2, r1
	strh r1, [r4, #2]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0804ED80: .4byte gAnims
_0804ED84: .4byte gEkrXPosReal

	thumb_func_start sub_0804ED88
sub_0804ED88: @ 0x0804ED88
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0x32
	ldrsh r1, [r4, r0]
	adds r0, r4, #0
	bl sub_0804ED50
	movs r1, #0x32
	ldrsh r0, [r4, r1]
	movs r1, #0
	bl EkrDragonTmCpyExt
	movs r1, #0x32
	ldrsh r0, [r4, r1]
	bl sub_0804EEB8
	movs r0, #0
	strh r0, [r4, #0x2c]
	adds r0, r4, #0
	bl Proc_Break
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_0804EDB8
sub_0804EDB8: @ 0x0804EDB8
	push {r4, r5, lr}
	sub sp, #4
	adds r4, r0, #0
	movs r0, #0x32
	ldrsh r1, [r4, r0]
	movs r5, #0x34
	ldrsh r2, [r4, r5]
	movs r0, #0x2c
	ldrsh r3, [r4, r0]
	movs r5, #0x2e
	ldrsh r0, [r4, r5]
	str r0, [sp]
	movs r0, #1
	bl Interpolate
	adds r1, r0, #0
	ldr r5, _0804EE20 @ =gEkrBgPosition
	str r1, [r5]
	adds r0, r4, #0
	bl sub_0804ED50
	ldr r0, [r5]
	movs r1, #0
	bl EkrDragonTmCpyExt
	ldr r0, [r5]
	bl sub_0804EEB8
	bl GetBattleAnimArenaFlag
	cmp r0, #0
	beq _0804EDFE
	ldr r0, [r5]
	bl sub_08055CE4
_0804EDFE:
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	ldrh r2, [r4, #0x2e]
	lsls r1, r2, #0x10
	cmp r0, r1
	ble _0804EE18
	movs r0, #1
	strh r0, [r4, #0x2c]
	adds r0, r4, #0
	bl Proc_Break
_0804EE18:
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0804EE20: .4byte gEkrBgPosition

	thumb_func_start sub_0804EE24
sub_0804EE24: @ 0x0804EE24
	push {r4, r5, lr}
	sub sp, #4
	adds r4, r0, #0
	movs r0, #0x36
	ldrsh r1, [r4, r0]
	movs r5, #0x38
	ldrsh r2, [r4, r5]
	movs r0, #0x2c
	ldrsh r3, [r4, r0]
	movs r5, #0x30
	ldrsh r0, [r4, r5]
	str r0, [sp]
	movs r0, #4
	bl Interpolate
	adds r1, r0, #0
	ldr r5, _0804EE8C @ =gEkrBgPosition
	str r1, [r5]
	adds r0, r4, #0
	bl sub_0804ED50
	ldr r0, [r5]
	movs r1, #0
	bl EkrDragonTmCpyExt
	ldr r0, [r5]
	bl sub_0804EEB8
	bl GetBattleAnimArenaFlag
	cmp r0, #0
	beq _0804EE6A
	ldr r0, [r5]
	bl sub_08055CE4
_0804EE6A:
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	ldrh r2, [r4, #0x30]
	lsls r1, r2, #0x10
	cmp r0, r1
	ble _0804EEA6
	adds r0, r4, #0
	adds r0, #0x29
	ldrb r0, [r0]
	cmp r0, #0
	bne _0804EE94
	ldr r1, _0804EE90 @ =gEkrInitPosReal
	movs r0, #1
	b _0804EE98
	.align 2, 0
_0804EE8C: .4byte gEkrBgPosition
_0804EE90: .4byte gEkrInitPosReal
_0804EE94:
	ldr r1, _0804EEB0 @ =gEkrInitPosReal
	movs r0, #0
_0804EE98:
	str r0, [r1]
	ldr r1, _0804EEB4 @ =0x02017748
	movs r0, #0
	str r0, [r1]
	adds r0, r4, #0
	bl Proc_Break
_0804EEA6:
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0804EEB0: .4byte gEkrInitPosReal
_0804EEB4: .4byte 0x02017748

	thumb_func_start sub_0804EEB8
sub_0804EEB8: @ 0x0804EEB8
	push {r4, r5, lr}
	sub sp, #0x10
	adds r5, r0, #0
	bl CheckInEkrDragon
	cmp r0, #0
	bne _0804EF08
	bl GetBattleAnimArenaFlag
	cmp r0, #0
	bne _0804EF08
	asrs r4, r5, #3
	movs r1, #7
	ands r1, r5
	movs r0, #2
	movs r2, #0
	bl SetBgOffset
	lsls r4, r4, #1
	ldr r0, _0804EF10 @ =0x0201C906
	adds r4, r4, r0
	movs r0, #0x84
	lsls r0, r0, #1
	adds r4, r4, r0
	ldr r2, _0804EF14 @ =gBg2Tm
	movs r0, #0x20
	str r0, [sp]
	movs r0, #0x14
	str r0, [sp, #4]
	subs r0, #0x15
	str r0, [sp, #8]
	str r0, [sp, #0xc]
	adds r0, r4, #0
	movs r1, #0x42
	movs r3, #0x20
	bl EfxTmCpyExt
	movs r0, #4
	bl EnableBgSync
_0804EF08:
	add sp, #0x10
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0804EF10: .4byte 0x0201C906
_0804EF14: .4byte gBg2Tm

	thumb_func_start NewEfxQuakePure
NewEfxQuakePure: @ 0x0804EF18
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r0, _0804EF50 @ =ProcScr_EfxQuakePure
	movs r1, #3
	bl Proc_Start
	ldr r2, _0804EF54 @ =gUnk_08C0A0F8
	lsls r1, r4, #3
	adds r1, r1, r2
	ldr r1, [r1]
	str r1, [r0, #0x44]
	lsls r4, r4, #1
	adds r4, #1
	lsls r4, r4, #2
	adds r4, r4, r2
	ldr r1, [r4]
	adds r3, r0, #0
	adds r3, #0x29
	movs r2, #0
	strb r1, [r3]
	adds r1, r0, #0
	adds r1, #0x2a
	strb r5, [r1]
	strh r2, [r0, #0x2c]
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_0804EF50: .4byte ProcScr_EfxQuakePure
_0804EF54: .4byte gUnk_08C0A0F8

	thumb_func_start sub_0804EF58
sub_0804EF58: @ 0x0804EF58
	push {r4, lr}
	adds r2, r0, #0
	ldr r3, [r2, #0x44]
	movs r1, #0x2c
	ldrsh r0, [r2, r1]
	lsls r0, r0, #2
	adds r0, r0, r3
	ldrh r4, [r0]
	ldr r1, _0804EF88 @ =0x00007FFF
	cmp r4, r1
	beq _0804EF90
	ldr r1, _0804EF8C @ =0x02017760
	strh r4, [r1]
	movs r4, #0x2c
	ldrsh r0, [r2, r4]
	lsls r0, r0, #2
	adds r0, r0, r3
	ldrh r0, [r0, #2]
	strh r0, [r1, #2]
	ldrh r0, [r2, #0x2c]
	adds r0, #1
	strh r0, [r2, #0x2c]
	b _0804EFBC
	.align 2, 0
_0804EF88: .4byte 0x00007FFF
_0804EF8C: .4byte 0x02017760
_0804EF90:
	adds r0, r2, #0
	adds r0, #0x2a
	ldrb r0, [r0]
	cmp r0, #0
	beq _0804EFA0
	cmp r0, #1
	beq _0804EFB4
	b _0804EFBC
_0804EFA0:
	strh r0, [r2, #0x2c]
	ldr r0, _0804EFB0 @ =0x02017760
	ldrh r1, [r3]
	strh r1, [r0]
	ldrh r1, [r3, #2]
	strh r1, [r0, #2]
	b _0804EFBC
	.align 2, 0
_0804EFB0: .4byte 0x02017760
_0804EFB4:
	ldr r1, _0804EFC4 @ =0x02017760
	movs r0, #0
	strh r0, [r1, #2]
	strh r0, [r1]
_0804EFBC:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0804EFC4: .4byte 0x02017760

	thumb_func_start NewEfxHitQuakePure
NewEfxHitQuakePure: @ 0x0804EFC8
	push {lr}
	ldr r0, _0804EFD8 @ =gUnk_08C0A150
	movs r1, #3
	bl Proc_Start
	pop {r1}
	bx r1
	.align 2, 0
_0804EFD8: .4byte gUnk_08C0A150

	thumb_func_start nullsub_48
nullsub_48: @ 0x0804EFDC
	bx lr
	.align 2, 0

	thumb_func_start NewEfxQuake
NewEfxQuake: @ 0x0804EFE0
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0804EFF0 @ =0x02017748
	ldr r0, [r0]
	cmp r0, #1
	bne _0804EFF4
	movs r0, #0
	b _0804F0D0
	.align 2, 0
_0804EFF0: .4byte 0x02017748
_0804EFF4:
	ldr r1, _0804F020 @ =0x0201773C
	movs r0, #1
	str r0, [r1]
	ldr r0, _0804F024 @ =gUnk_08C0A168
	movs r1, #3
	bl Proc_Start
	adds r2, r0, #0
	movs r0, #0
	strh r0, [r2, #0x2c]
	ldr r1, _0804F028 @ =gAnims
	ldr r0, [r1]
	str r0, [r2, #0x5c]
	ldr r0, [r1, #8]
	str r0, [r2, #0x60]
	cmp r4, #6
	bhi _0804F0BC
	lsls r0, r4, #2
	ldr r1, _0804F02C @ =_0804F030
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0804F020: .4byte 0x0201773C
_0804F024: .4byte gUnk_08C0A168
_0804F028: .4byte gAnims
_0804F02C: .4byte _0804F030
_0804F030: @ jump table
	.4byte _0804F04C @ case 0
	.4byte _0804F05C @ case 1
	.4byte _0804F06C @ case 2
	.4byte _0804F07C @ case 3
	.4byte _0804F08C @ case 4
	.4byte _0804F09C @ case 5
	.4byte _0804F0AC @ case 6
_0804F04C:
	ldr r0, _0804F058 @ =gUnk_081DDB74
	str r0, [r2, #0x44]
	adds r1, r2, #0
	adds r1, #0x29
	movs r0, #0
	b _0804F0C6
	.align 2, 0
_0804F058: .4byte gUnk_081DDB74
_0804F05C:
	ldr r0, _0804F068 @ =gEfxQuakeVecs
	str r0, [r2, #0x44]
	adds r1, r2, #0
	adds r1, #0x29
	movs r0, #0
	b _0804F0C6
	.align 2, 0
_0804F068: .4byte gEfxQuakeVecs
_0804F06C:
	ldr r0, _0804F078 @ =gUnk_081DDBE0
	str r0, [r2, #0x44]
	adds r1, r2, #0
	adds r1, #0x29
	movs r0, #0
	b _0804F0C6
	.align 2, 0
_0804F078: .4byte gUnk_081DDBE0
_0804F07C:
	ldr r0, _0804F088 @ =gUnk_081DDC2A
	str r0, [r2, #0x44]
	adds r1, r2, #0
	adds r1, #0x29
	movs r0, #0
	b _0804F0C6
	.align 2, 0
_0804F088: .4byte gUnk_081DDC2A
_0804F08C:
	ldr r0, _0804F098 @ =gUnk_081DDC74
	str r0, [r2, #0x44]
	adds r1, r2, #0
	adds r1, #0x29
	movs r0, #0
	b _0804F0C6
	.align 2, 0
_0804F098: .4byte gUnk_081DDC74
_0804F09C:
	ldr r0, _0804F0A8 @ =gUnk_081DDCBE
	str r0, [r2, #0x44]
	adds r1, r2, #0
	adds r1, #0x29
	movs r0, #1
	b _0804F0C6
	.align 2, 0
_0804F0A8: .4byte gUnk_081DDCBE
_0804F0AC:
	ldr r0, _0804F0B8 @ =gUnk_081DDD28
	str r0, [r2, #0x44]
	adds r1, r2, #0
	adds r1, #0x29
	movs r0, #1
	b _0804F0C6
	.align 2, 0
_0804F0B8: .4byte gUnk_081DDD28
_0804F0BC:
	ldr r0, _0804F0D8 @ =gUnk_081DDB74
	str r0, [r2, #0x44]
	adds r1, r2, #0
	adds r1, #0x29
	movs r0, #0
_0804F0C6:
	strb r0, [r1]
	movs r0, #0
	strh r0, [r2, #0x34]
	strh r0, [r2, #0x3c]
	adds r0, r2, #0
_0804F0D0:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0804F0D8: .4byte gUnk_081DDB74

	thumb_func_start sub_0804F0DC
sub_0804F0DC: @ 0x0804F0DC
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r6, r0, #0
	ldr r3, [r6, #0x44]
	ldrh r4, [r6, #0x2c]
	movs r1, #0x2c
	ldrsh r0, [r6, r1]
	lsls r0, r0, #2
	adds r0, r0, r3
	ldrh r2, [r0]
	ldr r1, _0804F154 @ =0x00007FFF
	cmp r2, r1
	bne _0804F168
	ldr r3, _0804F158 @ =gEkrXPosReal
	movs r4, #0
	ldrsh r2, [r3, r4]
	ldr r0, _0804F15C @ =gEkrBgPosition
	ldr r1, [r0]
	subs r7, r2, r1
	ldr r2, _0804F160 @ =gEkrYPosReal
	movs r4, #2
	ldrsh r0, [r3, r4]
	subs r4, r0, r1
	movs r0, #2
	ldrsh r5, [r2, r0]
	lsls r1, r7, #0x10
	asrs r1, r1, #0x10
	movs r3, #0
	ldrsh r2, [r2, r3]
	movs r0, #0
	bl SetEkrFrontAnimPostion
	lsls r1, r4, #0x10
	asrs r1, r1, #0x10
	adds r2, r5, #0
	movs r0, #1
	bl SetEkrFrontAnimPostion
	movs r0, #2
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	bl CheckInEkrDragon
	cmp r0, #0
	beq _0804F146
	ldrh r1, [r6, #0x34]
	ldrh r2, [r6, #0x3c]
	movs r0, #3
	bl SetBgOffset
_0804F146:
	ldr r1, _0804F164 @ =0x0201773C
	movs r0, #0
	str r0, [r1]
	adds r0, r6, #0
	bl Proc_End
	b _0804F27A
	.align 2, 0
_0804F154: .4byte 0x00007FFF
_0804F158: .4byte gEkrXPosReal
_0804F15C: .4byte gEkrBgPosition
_0804F160: .4byte gEkrYPosReal
_0804F164: .4byte 0x0201773C
_0804F168:
	ldr r5, _0804F1C0 @ =0x02017760
	strh r2, [r5]
	movs r1, #0x2c
	ldrsh r0, [r6, r1]
	lsls r0, r0, #2
	adds r0, r0, r3
	ldrh r0, [r0, #2]
	strh r0, [r5, #2]
	adds r0, r4, #1
	strh r0, [r6, #0x2c]
	ldrh r1, [r5]
	ldrh r2, [r5, #2]
	movs r0, #2
	bl SetBgOffset
	bl CheckInEkrDragon
	cmp r0, #0
	beq _0804F1A8
	ldrh r2, [r6, #0x34]
	ldrh r3, [r5]
	adds r1, r2, r3
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	ldrh r4, [r6, #0x3c]
	ldrh r0, [r5, #2]
	adds r2, r4, r0
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	movs r0, #3
	bl SetBgOffset
_0804F1A8:
	bl CheckInEkrDragon
	cmp r0, #0
	beq _0804F1C8
	ldr r4, _0804F1C4 @ =gEkrXPosReal
	movs r2, #0
	ldrsh r1, [r4, r2]
	movs r3, #0
	ldrsh r0, [r5, r3]
	subs r1, r1, r0
	b _0804F1D4
	.align 2, 0
_0804F1C0: .4byte 0x02017760
_0804F1C4: .4byte gEkrXPosReal
_0804F1C8:
	ldr r4, _0804F234 @ =gEkrXPosReal
	movs r2, #0
	ldrsh r1, [r4, r2]
	movs r3, #0
	ldrsh r0, [r5, r3]
	adds r1, r1, r0
_0804F1D4:
	ldr r3, _0804F238 @ =gEkrBgPosition
	ldr r0, [r3]
	subs r7, r1, r0
	ldr r2, _0804F23C @ =gEkrYPosReal
	movs r1, #0
	ldrsh r0, [r2, r1]
	mov r8, r0
	movs r1, #2
	ldrsh r0, [r5, r1]
	mov r1, r8
	subs r1, r1, r0
	mov r8, r1
	adds r5, r2, #0
	movs r2, #2
	ldrsh r1, [r4, r2]
	ldr r2, _0804F240 @ =0x02017760
	movs r4, #0
	ldrsh r0, [r2, r4]
	adds r1, r1, r0
	ldr r0, [r3]
	subs r4, r1, r0
	movs r0, #2
	ldrsh r1, [r5, r0]
	movs r3, #2
	ldrsh r0, [r2, r3]
	subs r5, r1, r0
	ldr r0, _0804F244 @ =gEkrDistanceType
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	bne _0804F248
	lsls r1, r7, #0x10
	asrs r1, r1, #0x10
	mov r3, r8
	lsls r2, r3, #0x10
	asrs r2, r2, #0x10
	movs r0, #0
	bl SetEkrFrontAnimPostion
	lsls r1, r4, #0x10
	asrs r1, r1, #0x10
	lsls r2, r5, #0x10
	asrs r2, r2, #0x10
	movs r0, #1
	bl SetEkrFrontAnimPostion
	b _0804F27A
	.align 2, 0
_0804F234: .4byte gEkrXPosReal
_0804F238: .4byte gEkrBgPosition
_0804F23C: .4byte gEkrYPosReal
_0804F240: .4byte 0x02017760
_0804F244: .4byte gEkrDistanceType
_0804F248:
	cmp r0, #0
	blt _0804F27A
	cmp r0, #2
	bgt _0804F27A
	ldr r0, [r6, #0x5c]
	bl GetAnimPosition
	cmp r0, #0
	bne _0804F26C
	lsls r1, r7, #0x10
	asrs r1, r1, #0x10
	mov r4, r8
	lsls r2, r4, #0x10
	asrs r2, r2, #0x10
	movs r0, #0
	bl SetEkrFrontAnimPostion
	b _0804F27A
_0804F26C:
	lsls r1, r4, #0x10
	asrs r1, r1, #0x10
	lsls r2, r5, #0x10
	asrs r2, r2, #0x10
	movs r0, #1
	bl SetEkrFrontAnimPostion
_0804F27A:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start NewEfxHitQuake
NewEfxHitQuake: @ 0x0804F284
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	mov r8, r0
	mov sb, r1
	adds r6, r2, #0
	ldr r0, _0804F2C8 @ =0x02017740
	ldr r7, [r0]
	cmp r7, #0
	beq _0804F29C
	b _0804F436
_0804F29C:
	movs r4, #1
	str r4, [r0]
	ldr r0, _0804F2CC @ =ProcScr_EfxHitQuake
	movs r1, #3
	bl Proc_Start
	adds r5, r0, #0
	mov r0, r8
	str r0, [r5, #0x5c]
	mov r1, sb
	str r1, [r5, #0x60]
	strh r7, [r5, #0x2c]
	adds r0, r5, #0
	adds r0, #0x29
	strb r4, [r0]
	cmp r6, #0
	beq _0804F304
	cmp r6, #1
	bne _0804F2D4
	ldr r0, _0804F2D0 @ =gEfxQuakeVecs
	b _0804F306
	.align 2, 0
_0804F2C8: .4byte 0x02017740
_0804F2CC: .4byte ProcScr_EfxHitQuake
_0804F2D0: .4byte gEfxQuakeVecs
_0804F2D4:
	cmp r6, #2
	bne _0804F2E0
	ldr r0, _0804F2DC @ =gUnk_081DDBE0
	b _0804F306
	.align 2, 0
_0804F2DC: .4byte gUnk_081DDBE0
_0804F2E0:
	cmp r6, #3
	bne _0804F2EC
	ldr r0, _0804F2E8 @ =gUnk_081DDC2A
	b _0804F306
	.align 2, 0
_0804F2E8: .4byte gUnk_081DDC2A
_0804F2EC:
	cmp r6, #4
	bne _0804F2F8
	ldr r0, _0804F2F4 @ =gUnk_081DDE44
	b _0804F306
	.align 2, 0
_0804F2F4: .4byte gUnk_081DDE44
_0804F2F8:
	cmp r6, #5
	bne _0804F304
	ldr r0, _0804F300 @ =gUnk_081DDEDA
	b _0804F306
	.align 2, 0
_0804F300: .4byte gUnk_081DDEDA
_0804F304:
	ldr r0, _0804F31C @ =gUnk_081DDB74
_0804F306:
	str r0, [r5, #0x44]
	movs r0, #1
	str r0, [r5, #0x48]
	bl CheckInEkrDragon
	adds r4, r0, #0
	cmp r4, #0
	beq _0804F320
	movs r0, #0
	str r0, [r5, #0x64]
	b _0804F436
	.align 2, 0
_0804F31C: .4byte gUnk_081DDB74
_0804F320:
	bl GetBattleAnimArenaFlag
	cmp r0, #0
	beq _0804F32C
	str r4, [r5, #0x64]
	b _0804F436
_0804F32C:
	ldr r0, _0804F33C @ =gEkrDistanceType
	movs r2, #0
	ldrsh r0, [r0, r2]
	cmp r0, #0
	bne _0804F340
	str r0, [r5, #0x64]
	b _0804F436
	.align 2, 0
_0804F33C: .4byte gEkrDistanceType
_0804F340:
	ldr r0, [r5, #0x5c]
	bl GetAnimPosition
	ldr r1, _0804F370 @ =gEkrBgPosition
	ldr r1, [r1]
	ldr r2, _0804F374 @ =gEkrXPosBase
	lsls r0, r0, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	subs r1, r1, r0
	lsls r1, r1, #0x10
	lsrs r4, r1, #0x10
	mov r0, r8
	bl GetAnimPosition
	cmp r0, #0
	bne _0804F37C
	movs r0, #0x40
	strh r0, [r5, #0x36]
	movs r0, #0x68
	strh r0, [r5, #0x3e]
	ldr r0, _0804F378 @ =gUnk_08C0BED0
	b _0804F386
	.align 2, 0
_0804F370: .4byte gEkrBgPosition
_0804F374: .4byte gEkrXPosBase
_0804F378: .4byte gUnk_08C0BED0
_0804F37C:
	movs r0, #0xb0
	strh r0, [r5, #0x36]
	movs r0, #0x68
	strh r0, [r5, #0x3e]
	ldr r0, _0804F3AC @ =gUnk_08C0BE44
_0804F386:
	movs r1, #5
	bl AnimCreate
	adds r1, r0, #0
	lsls r0, r4, #0x10
	asrs r0, r0, #0x10
	ldrh r2, [r5, #0x36]
	subs r0, r2, r0
	strh r0, [r1, #2]
	ldrh r0, [r5, #0x3e]
	strh r0, [r1, #4]
	ldr r0, _0804F3B0 @ =0x0201775C
	ldr r0, [r0]
	cmp r0, #1
	bne _0804F3B4
	movs r0, #0xd3
	lsls r0, r0, #6
	b _0804F3B8
	.align 2, 0
_0804F3AC: .4byte gUnk_08C0BE44
_0804F3B0: .4byte 0x0201775C
_0804F3B4:
	movs r0, #0xf3
	lsls r0, r0, #6
_0804F3B8:
	strh r0, [r1, #8]
	str r1, [r5, #0x64]
	ldr r4, _0804F444 @ =0x0200003C
	mov r0, r8
	bl GetAnimPosition
	lsls r0, r0, #2
	adds r0, r0, r4
	ldr r0, [r0]
	ldr r1, _0804F448 @ =0x06011800
	movs r2, #0x80
	lsls r2, r2, #4
	bl RegisterDataMove
	ldr r4, _0804F44C @ =gEkrSpellAnimIndex
	mov r0, sb
	bl GetAnimPosition
	lsls r0, r0, #1
	adds r0, r0, r4
	ldrh r0, [r0]
	cmp r0, #0x39
	bne _0804F3FC
	ldr r4, _0804F450 @ =0x0200004C
	mov r0, sb
	bl GetAnimPosition
	lsls r0, r0, #2
	adds r0, r0, r4
	ldr r0, [r0]
	ldr r1, _0804F454 @ =0x02016828
	movs r2, #8
	bl CpuFastSet
_0804F3FC:
	ldr r4, _0804F450 @ =0x0200004C
	mov r0, r8
	bl GetAnimPosition
	lsls r0, r0, #2
	adds r0, r0, r4
	ldr r0, [r0]
	ldr r1, _0804F458 @ =gPal + 0x260
	movs r2, #8
	bl CpuFastSet
	bl EnablePalSync
	ldr r0, _0804F45C @ =gEkrDistanceType
	movs r1, #0
	ldrsh r4, [r0, r1]
	mov r0, r8
	bl GetAnimPosition
	adds r1, r0, #0
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	adds r0, r4, #0
	bl sub_08055C50
	ldr r0, _0804F460 @ =gEkrBgPosition
	ldr r0, [r0]
	bl sub_0804EEB8
_0804F436:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0804F444: .4byte 0x0200003C
_0804F448: .4byte 0x06011800
_0804F44C: .4byte gEkrSpellAnimIndex
_0804F450: .4byte 0x0200004C
_0804F454: .4byte 0x02016828
_0804F458: .4byte gPal + 0x260
_0804F45C: .4byte gEkrDistanceType
_0804F460: .4byte gEkrBgPosition

	thumb_func_start sub_0804F464
sub_0804F464: @ 0x0804F464
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	adds r7, r0, #0
	ldr r5, [r7, #0x44]
	movs r1, #0x2c
	ldrsh r0, [r7, r1]
	lsls r0, r0, #2
	adds r0, r0, r5
	ldr r1, _0804F4AC @ =0x00007FFF
	ldrh r0, [r0]
	cmp r0, r1
	beq _0804F482
	b _0804F590
_0804F482:
	ldr r0, _0804F4B0 @ =gEkrDistanceType
	movs r2, #0
	ldrsh r0, [r0, r2]
	cmp r0, #0
	bne _0804F4B4
	movs r0, #2
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	bl CheckInEkrDragon
	cmp r0, #0
	beq _0804F4D6
	movs r0, #3
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	b _0804F4D6
	.align 2, 0
_0804F4AC: .4byte 0x00007FFF
_0804F4B0: .4byte gEkrDistanceType
_0804F4B4:
	cmp r0, #0
	blt _0804F4D6
	cmp r0, #2
	bgt _0804F4D6
	bl CheckInEkrDragon
	cmp r0, #0
	beq _0804F4CE
	movs r0, #3
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
_0804F4CE:
	ldr r0, _0804F578 @ =gEkrBgPosition
	ldr r0, [r0]
	bl sub_0804EEB8
_0804F4D6:
	ldr r0, [r7, #0x64]
	cmp r0, #0
	beq _0804F4E6
	bl AnimDelete
	ldr r0, _0804F57C @ =0x0201FAD0
	bl sub_08055B08
_0804F4E6:
	ldr r3, _0804F580 @ =gEkrXPosReal
	movs r4, #0
	ldrsh r2, [r3, r4]
	ldr r0, _0804F578 @ =gEkrBgPosition
	ldr r1, [r0]
	subs r6, r2, r1
	ldr r2, _0804F584 @ =gEkrYPosReal
	movs r5, #2
	ldrsh r0, [r3, r5]
	subs r4, r0, r1
	movs r0, #2
	ldrsh r5, [r2, r0]
	lsls r1, r6, #0x10
	asrs r1, r1, #0x10
	movs r3, #0
	ldrsh r2, [r2, r3]
	movs r0, #0
	bl SetEkrFrontAnimPostion
	lsls r1, r4, #0x10
	asrs r1, r1, #0x10
	adds r2, r5, #0
	movs r0, #1
	bl SetEkrFrontAnimPostion
	ldr r1, _0804F588 @ =0x02017740
	movs r0, #0
	str r0, [r1]
	adds r0, r7, #0
	adds r0, #0x29
	ldrb r0, [r0]
	cmp r0, #1
	bne _0804F56E
	bl CheckInEkrDragon
	cmp r0, #0
	beq _0804F53A
	movs r0, #3
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
_0804F53A:
	ldr r4, _0804F58C @ =0x02000038
	ldrh r1, [r4]
	ldrh r2, [r4, #2]
	movs r0, #0
	bl SetBgOffset
	ldrh r5, [r4]
	rsbs r0, r5, #0
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	ldrh r6, [r4, #2]
	rsbs r1, r6, #0
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	bl sub_0804CC8C
	ldrh r1, [r4]
	rsbs r0, r1, #0
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldrh r4, [r4, #2]
	rsbs r1, r4, #0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	bl sub_0804D5D8
_0804F56E:
	adds r0, r7, #0
	bl Proc_End
	b _0804F7AA
	.align 2, 0
_0804F578: .4byte gEkrBgPosition
_0804F57C: .4byte 0x0201FAD0
_0804F580: .4byte gEkrXPosReal
_0804F584: .4byte gEkrYPosReal
_0804F588: .4byte 0x02017740
_0804F58C: .4byte 0x02000038
_0804F590:
	movs r2, #0x2c
	ldrsh r4, [r7, r2]
	cmp r4, #0
	bne _0804F5BC
	ldr r0, [r7, #0x64]
	cmp r0, #0
	beq _0804F5BC
	ldr r0, [r7, #0x5c]
	bl GetAnimPosition
	adds r1, r0, #0
	lsls r0, r1, #4
	subs r0, r0, r1
	lsls r0, r0, #1
	ldr r1, _0804F618 @ =gBg2Tm + 0x2c0
	adds r0, r0, r1
	str r4, [sp]
	movs r1, #0xf
	movs r2, #5
	movs r3, #0
	bl FillBGRect
_0804F5BC:
	ldr r4, _0804F61C @ =0x02017760
	movs r3, #0x2c
	ldrsh r0, [r7, r3]
	lsls r0, r0, #2
	adds r0, r0, r5
	movs r1, #0
	ldrsh r6, [r0, r1]
	mov r8, r6
	strh r6, [r4]
	movs r2, #0x2c
	ldrsh r0, [r7, r2]
	lsls r0, r0, #2
	adds r0, r0, r5
	movs r3, #2
	ldrsh r5, [r0, r3]
	strh r5, [r4, #2]
	ldrh r0, [r7, #0x2c]
	adds r0, #1
	strh r0, [r7, #0x2c]
	ldr r0, [r7, #0x64]
	cmp r0, #0
	beq _0804F628
	ldr r0, [r7, #0x5c]
	bl GetAnimPosition
	ldr r1, _0804F620 @ =gEkrBgPosition
	ldr r1, [r1]
	ldr r2, _0804F624 @ =gEkrXPosBase
	lsls r0, r0, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	subs r1, r1, r0
	ldr r2, [r7, #0x64]
	ldrh r6, [r7, #0x36]
	ldrh r3, [r4]
	adds r0, r6, r3
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	subs r0, r0, r1
	strh r0, [r2, #2]
	ldrh r6, [r7, #0x3e]
	ldrh r4, [r4, #2]
	subs r0, r6, r4
	strh r0, [r2, #4]
	b _0804F632
	.align 2, 0
_0804F618: .4byte gBg2Tm + 0x2c0
_0804F61C: .4byte 0x02017760
_0804F620: .4byte gEkrBgPosition
_0804F624: .4byte gEkrXPosBase
_0804F628:
	ldrh r1, [r4]
	ldrh r2, [r4, #2]
	movs r0, #2
	bl SetBgOffset
_0804F632:
	adds r0, r7, #0
	adds r0, #0x29
	ldrb r0, [r0]
	cmp r0, #1
	bne _0804F6AC
	bl CheckInEkrDragon
	cmp r0, #0
	beq _0804F656
	mov r0, r8
	rsbs r1, r0, #0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	lsls r2, r5, #0x10
	lsrs r2, r2, #0x10
	movs r0, #3
	bl SetBgOffset
_0804F656:
	ldr r5, _0804F6E8 @ =0x02017760
	ldr r4, _0804F6EC @ =0x02000038
	ldrh r2, [r5]
	ldrh r3, [r4]
	adds r1, r2, r3
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	ldrh r6, [r5, #2]
	ldrh r0, [r4, #2]
	adds r2, r6, r0
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	movs r0, #0
	bl SetBgOffset
	ldrh r1, [r5]
	ldrh r2, [r4]
	adds r0, r1, r2
	rsbs r0, r0, #0
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	ldrh r3, [r5, #2]
	ldrh r6, [r4, #2]
	adds r1, r3, r6
	rsbs r1, r1, #0
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	bl sub_0804CC8C
	ldrh r1, [r5]
	ldrh r2, [r4]
	adds r0, r1, r2
	rsbs r0, r0, #0
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldrh r5, [r5, #2]
	ldrh r4, [r4, #2]
	adds r1, r5, r4
	rsbs r1, r1, #0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	bl sub_0804D5D8
_0804F6AC:
	bl CheckInEkrDragon
	cmp r0, #0
	beq _0804F6C0
	ldr r0, _0804F6E8 @ =0x02017760
	ldrh r1, [r0]
	ldrh r2, [r0, #2]
	movs r0, #3
	bl SetBgOffset
_0804F6C0:
	bl CheckInEkrDragon
	cmp r0, #0
	beq _0804F6FC
	ldr r3, _0804F6F0 @ =gEkrXPosReal
	mov ip, r3
	movs r4, #0
	ldrsh r1, [r3, r4]
	ldr r2, _0804F6E8 @ =0x02017760
	movs r5, #0
	ldrsh r0, [r2, r5]
	subs r1, r1, r0
	ldr r4, _0804F6F4 @ =gEkrBgPosition
	ldr r0, [r4]
	subs r6, r1, r0
	ldr r3, _0804F6F8 @ =gEkrYPosReal
	movs r0, #0
	ldrsh r1, [r3, r0]
	b _0804F718
	.align 2, 0
_0804F6E8: .4byte 0x02017760
_0804F6EC: .4byte 0x02000038
_0804F6F0: .4byte gEkrXPosReal
_0804F6F4: .4byte gEkrBgPosition
_0804F6F8: .4byte gEkrYPosReal
_0804F6FC:
	ldr r6, _0804F764 @ =gEkrXPosReal
	mov ip, r6
	movs r0, #0
	ldrsh r1, [r6, r0]
	ldr r2, _0804F768 @ =0x02017760
	movs r3, #0
	ldrsh r0, [r2, r3]
	adds r1, r1, r0
	ldr r4, _0804F76C @ =gEkrBgPosition
	ldr r0, [r4]
	subs r6, r1, r0
	ldr r3, _0804F770 @ =gEkrYPosReal
	movs r5, #0
	ldrsh r1, [r3, r5]
_0804F718:
	movs r5, #2
	ldrsh r0, [r2, r5]
	subs r1, r1, r0
	mov r8, r1
	mov r5, ip
	movs r1, #2
	ldrsh r0, [r5, r1]
	movs r5, #0
	ldrsh r1, [r2, r5]
	adds r0, r0, r1
	ldr r1, [r4]
	subs r4, r0, r1
	movs r0, #2
	ldrsh r1, [r3, r0]
	movs r3, #2
	ldrsh r0, [r2, r3]
	subs r5, r1, r0
	ldr r0, _0804F774 @ =gEkrDistanceType
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	bne _0804F778
	lsls r1, r6, #0x10
	asrs r1, r1, #0x10
	mov r3, r8
	lsls r2, r3, #0x10
	asrs r2, r2, #0x10
	movs r0, #0
	bl SetEkrFrontAnimPostion
	lsls r1, r4, #0x10
	asrs r1, r1, #0x10
	lsls r2, r5, #0x10
	asrs r2, r2, #0x10
	movs r0, #1
	bl SetEkrFrontAnimPostion
	b _0804F7AA
	.align 2, 0
_0804F764: .4byte gEkrXPosReal
_0804F768: .4byte 0x02017760
_0804F76C: .4byte gEkrBgPosition
_0804F770: .4byte gEkrYPosReal
_0804F774: .4byte gEkrDistanceType
_0804F778:
	cmp r0, #0
	blt _0804F7AA
	cmp r0, #2
	bgt _0804F7AA
	ldr r0, [r7, #0x5c]
	bl GetAnimPosition
	cmp r0, #0
	bne _0804F79C
	lsls r1, r6, #0x10
	asrs r1, r1, #0x10
	mov r4, r8
	lsls r2, r4, #0x10
	asrs r2, r2, #0x10
	movs r0, #0
	bl SetEkrFrontAnimPostion
	b _0804F7AA
_0804F79C:
	lsls r1, r4, #0x10
	asrs r1, r1, #0x10
	lsls r2, r5, #0x10
	asrs r2, r2, #0x10
	movs r0, #1
	bl SetEkrFrontAnimPostion
_0804F7AA:
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start NewEfxFlashBgWhite
NewEfxFlashBgWhite: @ 0x0804F7B8
	push {r4, r5, lr}
	sub sp, #4
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r0, _0804F7E8 @ =ProcScr_efxFlashBG
	movs r1, #0
	bl Proc_Start
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	strh r5, [r0, #0x2e]
	movs r0, #1
	rsbs r0, r0, #0
	str r0, [sp]
	ldr r1, _0804F7EC @ =gEfxPal
	ldr r2, _0804F7F0 @ =0x01000100
	mov r0, sp
	bl CpuFastSet
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0804F7E8: .4byte ProcScr_efxFlashBG
_0804F7EC: .4byte gEfxPal
_0804F7F0: .4byte 0x01000100

	thumb_func_start NewEfxFlashBgRed
NewEfxFlashBgRed: @ 0x0804F7F4
	push {r4, r5, lr}
	sub sp, #4
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r0, _0804F824 @ =ProcScr_efxFlashBG
	movs r1, #0
	bl Proc_Start
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	strh r5, [r0, #0x2e]
	ldr r0, _0804F828 @ =0x001F001F
	str r0, [sp]
	ldr r1, _0804F82C @ =gEfxPal
	ldr r2, _0804F830 @ =0x01000100
	mov r0, sp
	bl CpuFastSet
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0804F824: .4byte ProcScr_efxFlashBG
_0804F828: .4byte 0x001F001F
_0804F82C: .4byte gEfxPal
_0804F830: .4byte 0x01000100

	thumb_func_start NewEfxFlashBgBlack
NewEfxFlashBgBlack: @ 0x0804F834
	push {r4, r5, lr}
	sub sp, #4
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r0, _0804F860 @ =ProcScr_efxFlashBG
	movs r1, #0
	bl Proc_Start
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	strh r5, [r0, #0x2e]
	str r1, [sp]
	ldr r1, _0804F864 @ =gEfxPal
	ldr r2, _0804F868 @ =0x01000100
	mov r0, sp
	bl CpuFastSet
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0804F860: .4byte ProcScr_efxFlashBG
_0804F864: .4byte gEfxPal
_0804F868: .4byte 0x01000100

	thumb_func_start NewEfxFlashBgDirectly
NewEfxFlashBgDirectly: @ 0x0804F86C
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r0, _0804F888 @ =ProcScr_efxFlashBG
	movs r1, #0
	bl Proc_Start
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	strh r5, [r0, #0x2e]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0804F888: .4byte ProcScr_efxFlashBG

	thumb_func_start EfxFlashBgMain
EfxFlashBgMain: @ 0x0804F88C
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0804F8C0 @ =gEfxPal
	movs r1, #0xa0
	lsls r1, r1, #0x13
	movs r2, #0x80
	lsls r2, r2, #1
	bl CpuFastSet
	bl DisablePalSync
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	ldrh r2, [r4, #0x2e]
	lsls r1, r2, #0x10
	cmp r0, r1
	blt _0804F8B8
	adds r0, r4, #0
	bl Proc_Break
_0804F8B8:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0804F8C0: .4byte gEfxPal

	thumb_func_start EfxFlashRestorePalSync
EfxFlashRestorePalSync: @ 0x0804F8C4
	push {r4, lr}
	adds r4, r0, #0
	bl EnablePalSync
	adds r0, r4, #0
	bl Proc_Break
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start NewEfxWhiteOUT
NewEfxWhiteOUT: @ 0x0804F8D8
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r6, r2, #0
	ldr r0, _0804F8F8 @ =ProcScr_efxWhiteOUT
	movs r1, #0
	bl Proc_Start
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	strh r5, [r0, #0x2e]
	strh r6, [r0, #0x30]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0804F8F8: .4byte ProcScr_efxWhiteOUT

	thumb_func_start EfxWhiteOutMain1
EfxWhiteOutMain1: @ 0x0804F8FC
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	ldr r0, _0804F94C @ =gPal
	ldr r4, _0804F950 @ =gEfxPal
	movs r5, #0x80
	lsls r5, r5, #1
	adds r1, r4, #0
	adds r2, r5, #0
	bl CpuFastSet
	adds r0, r4, #0
	movs r1, #0
	movs r2, #0x20
	movs r3, #0x10
	bl EfxPalWhiteInOut
	movs r1, #0xa0
	lsls r1, r1, #0x13
	adds r0, r4, #0
	adds r2, r5, #0
	bl CpuFastSet
	bl DisablePalSync
	ldrh r0, [r6, #0x2c]
	adds r0, #1
	strh r0, [r6, #0x2c]
	lsls r0, r0, #0x10
	ldrh r2, [r6, #0x2e]
	lsls r1, r2, #0x10
	cmp r0, r1
	ble _0804F946
	movs r0, #0
	strh r0, [r6, #0x2c]
	adds r0, r6, #0
	bl Proc_Break
_0804F946:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0804F94C: .4byte gPal
_0804F950: .4byte gEfxPal

	thumb_func_start EfxWhiteOutMain2
EfxWhiteOutMain2: @ 0x0804F954
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r7, r0, #0
	movs r0, #0x2c
	ldrsh r3, [r7, r0]
	movs r1, #0x30
	ldrsh r0, [r7, r1]
	str r0, [sp]
	movs r0, #0
	movs r1, #0x10
	movs r2, #0
	bl Interpolate
	adds r6, r0, #0
	ldr r0, _0804F9BC @ =gPal
	ldr r4, _0804F9C0 @ =gEfxPal
	movs r5, #0x80
	lsls r5, r5, #1
	adds r1, r4, #0
	adds r2, r5, #0
	bl CpuFastSet
	adds r0, r4, #0
	movs r1, #0
	movs r2, #0x20
	adds r3, r6, #0
	bl EfxPalWhiteInOut
	movs r1, #0xa0
	lsls r1, r1, #0x13
	adds r0, r4, #0
	adds r2, r5, #0
	bl CpuFastSet
	bl DisablePalSync
	ldrh r0, [r7, #0x2c]
	adds r0, #1
	strh r0, [r7, #0x2c]
	lsls r0, r0, #0x10
	ldrh r2, [r7, #0x30]
	lsls r1, r2, #0x10
	cmp r0, r1
	ble _0804F9B2
	adds r0, r7, #0
	bl Proc_Break
_0804F9B2:
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0804F9BC: .4byte gPal
_0804F9C0: .4byte gEfxPal

	thumb_func_start EfxWhiteOutRestorePalSync
EfxWhiteOutRestorePalSync: @ 0x0804F9C4
	push {r4, lr}
	adds r4, r0, #0
	bl EnablePalSync
	adds r0, r4, #0
	bl Proc_Break
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start NewEfxWhiteIN
NewEfxWhiteIN: @ 0x0804F9D8
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	adds r4, r1, #0
	adds r5, r2, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	ldr r0, _0804FA0C @ =ProcScr_efxWhiteIN
	movs r1, #4
	bl Proc_Start
	adds r1, r0, #0
	str r6, [r1, #0x5c]
	movs r0, #0
	strh r0, [r1, #0x2c]
	strh r4, [r1, #0x2e]
	strh r5, [r1, #0x30]
	cmp r4, #0
	bne _0804FA06
	adds r0, r1, #0
	bl Proc_Break
_0804FA06:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0804FA0C: .4byte ProcScr_efxWhiteIN

	thumb_func_start EfxWhiteInMain1
EfxWhiteInMain1: @ 0x0804FA10
	push {lr}
	adds r2, r0, #0
	ldrh r0, [r2, #0x2c]
	adds r0, #1
	strh r0, [r2, #0x2c]
	lsls r0, r0, #0x10
	ldrh r3, [r2, #0x2e]
	lsls r1, r3, #0x10
	cmp r0, r1
	blt _0804FA2A
	adds r0, r2, #0
	bl Proc_Break
_0804FA2A:
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_0804FA30
sub_0804FA30: @ 0x0804FA30
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x5c]
	bl GetAnimPosition
	cmp r0, #0
	bne _0804FA6C
	ldr r0, _0804FA50 @ =gEkrPairHpInitial
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0x50
	bgt _0804FA5C
	ldr r0, _0804FA54 @ =gUnk_081DF2A4
	ldr r1, _0804FA58 @ =gPal + 0x360
	b _0804FA7A
	.align 2, 0
_0804FA50: .4byte gEkrPairHpInitial
_0804FA54: .4byte gUnk_081DF2A4
_0804FA58: .4byte gPal + 0x360
_0804FA5C:
	ldr r0, _0804FA64 @ =gUnk_081DF3A4
	ldr r1, _0804FA68 @ =gPal + 0x360
	b _0804FA7A
	.align 2, 0
_0804FA64: .4byte gUnk_081DF3A4
_0804FA68: .4byte gPal + 0x360
_0804FA6C:
	ldr r0, _0804FA84 @ =gEkrPairHpInitial
	movs r2, #2
	ldrsh r0, [r0, r2]
	cmp r0, #0x50
	bgt _0804FA90
	ldr r0, _0804FA88 @ =gUnk_081DF2A4
	ldr r1, _0804FA8C @ =gPal + 0x380
_0804FA7A:
	movs r2, #0x10
	bl CpuSet
	b _0804FA9A
	.align 2, 0
_0804FA84: .4byte gEkrPairHpInitial
_0804FA88: .4byte gUnk_081DF2A4
_0804FA8C: .4byte gPal + 0x380
_0804FA90:
	ldr r0, _0804FABC @ =gUnk_081DF3A4
	ldr r1, _0804FAC0 @ =gPal + 0x380
	movs r2, #0x10
	bl CpuSet
_0804FA9A:
	bl EnablePalSync
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	ldrh r2, [r4, #0x30]
	lsls r1, r2, #0x10
	cmp r0, r1
	blt _0804FAB4
	adds r0, r4, #0
	bl Proc_Break
_0804FAB4:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0804FABC: .4byte gUnk_081DF3A4
_0804FAC0: .4byte gPal + 0x380

	thumb_func_start sub_0804FAC4
sub_0804FAC4: @ 0x0804FAC4
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x5c]
	bl GetAnimPosition
	cmp r0, #0
	bne _0804FB04
	ldr r0, _0804FAEC @ =gEkrPairHpInitial
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0x50
	bgt _0804FAFC
	ldr r0, _0804FAF0 @ =0x0203DFF8
	movs r1, #0
	ldrsh r0, [r0, r1]
	lsls r0, r0, #5
	ldr r1, _0804FAF4 @ =gUnk_081DF224
	adds r0, r0, r1
	ldr r1, _0804FAF8 @ =gPal + 0x360
	b _0804FB1C
	.align 2, 0
_0804FAEC: .4byte gEkrPairHpInitial
_0804FAF0: .4byte 0x0203DFF8
_0804FAF4: .4byte gUnk_081DF224
_0804FAF8: .4byte gPal + 0x360
_0804FAFC:
	ldr r0, _0804FB00 @ =gUnk_081DF3A4
	b _0804FB1A
	.align 2, 0
_0804FB00: .4byte gUnk_081DF3A4
_0804FB04:
	ldr r0, _0804FB24 @ =gEkrPairHpInitial
	movs r1, #2
	ldrsh r0, [r0, r1]
	cmp r0, #0x50
	bgt _0804FB34
	ldr r0, _0804FB28 @ =0x0203DFF8
	movs r1, #2
	ldrsh r0, [r0, r1]
	lsls r0, r0, #5
	ldr r1, _0804FB2C @ =gUnk_081DF224
	adds r0, r0, r1
_0804FB1A:
	ldr r1, _0804FB30 @ =gPal + 0x380
_0804FB1C:
	movs r2, #0x10
	bl CpuSet
	b _0804FB3E
	.align 2, 0
_0804FB24: .4byte gEkrPairHpInitial
_0804FB28: .4byte 0x0203DFF8
_0804FB2C: .4byte gUnk_081DF224
_0804FB30: .4byte gPal + 0x380
_0804FB34:
	ldr r0, _0804FB50 @ =gUnk_081DF3A4
	ldr r1, _0804FB54 @ =gPal + 0x380
	movs r2, #0x10
	bl CpuSet
_0804FB3E:
	bl EnablePalSync
	adds r0, r4, #0
	bl Proc_Break
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0804FB50: .4byte gUnk_081DF3A4
_0804FB54: .4byte gPal + 0x380

	thumb_func_start sub_0804FB58
sub_0804FB58: @ 0x0804FB58
	push {r4, r5, r6, lr}
	mov r6, sl
	mov r5, sb
	mov r4, r8
	push {r4, r5, r6}
	sub sp, #4
	adds r5, r0, #0
	ldr r4, _0804FC14 @ =0x0201777C
	ldr r0, _0804FC18 @ =gUnk_08C0A218
	movs r1, #3
	bl Proc_Start
	str r0, [r4]
	str r5, [r0, #0x5c]
	movs r3, #0
	movs r2, #0
	strh r2, [r0, #0x2c]
	str r2, [r0, #0x44]
	ldr r1, _0804FC1C @ =gUnk_081DE00C
	str r1, [r0, #0x48]
	str r2, [r0, #0x54]
	strh r2, [r0, #0x2e]
	str r2, [r0, #0x4c]
	ldr r1, _0804FC20 @ =gUnk_081DE036
	str r1, [r0, #0x50]
	str r2, [r0, #0x58]
	adds r0, #0x29
	strb r3, [r0]
	ldr r5, _0804FC24 @ =0x0203DFF8
	movs r1, #0
	ldrsh r0, [r5, r1]
	lsls r0, r0, #5
	ldr r1, _0804FC28 @ =gUnk_081DF224
	mov sl, r1
	add r0, sl
	ldr r6, _0804FC2C @ =0x0201F93C
	adds r1, r6, #0
	movs r2, #0x10
	bl EfxSplitColor
	movs r1, #0
	ldrsh r0, [r5, r1]
	lsls r0, r0, #5
	ldr r1, _0804FC30 @ =gUnk_081DF2E4
	mov sb, r1
	add r0, sb
	ldr r4, _0804FC34 @ =0x0201F96C
	adds r1, r4, #0
	movs r2, #0x10
	bl EfxSplitColor
	ldr r2, _0804FC38 @ =0x0201F99C
	movs r0, #5
	mov r8, r0
	str r0, [sp]
	adds r0, r6, #0
	adds r1, r4, #0
	movs r3, #0x10
	bl sub_08067998
	movs r1, #2
	ldrsh r0, [r5, r1]
	lsls r0, r0, #5
	add r0, sl
	ldr r6, _0804FC3C @ =0x0201F9FC
	adds r1, r6, #0
	movs r2, #0x10
	bl EfxSplitColor
	movs r1, #2
	ldrsh r0, [r5, r1]
	lsls r0, r0, #5
	add r0, sb
	ldr r4, _0804FC40 @ =0x0201FA2C
	adds r1, r4, #0
	movs r2, #0x10
	bl EfxSplitColor
	ldr r2, _0804FC44 @ =0x0201FA5C
	mov r0, r8
	str r0, [sp]
	adds r0, r6, #0
	adds r1, r4, #0
	movs r3, #0x10
	bl sub_08067998
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0804FC14: .4byte 0x0201777C
_0804FC18: .4byte gUnk_08C0A218
_0804FC1C: .4byte gUnk_081DE00C
_0804FC20: .4byte gUnk_081DE036
_0804FC24: .4byte 0x0203DFF8
_0804FC28: .4byte gUnk_081DF224
_0804FC2C: .4byte 0x0201F93C
_0804FC30: .4byte gUnk_081DF2E4
_0804FC34: .4byte 0x0201F96C
_0804FC38: .4byte 0x0201F99C
_0804FC3C: .4byte 0x0201F9FC
_0804FC40: .4byte 0x0201FA2C
_0804FC44: .4byte 0x0201FA5C

	thumb_func_start EndEfxHPBarColorChange
EndEfxHPBarColorChange: @ 0x0804FC48
	push {lr}
	ldr r0, _0804FC58 @ =0x0201777C
	ldr r0, [r0]
	bl Proc_End
	pop {r0}
	bx r0
	.align 2, 0
_0804FC58: .4byte 0x0201777C

	thumb_func_start sub_0804FC5C
sub_0804FC5C: @ 0x0804FC5C
	ldr r0, _0804FC68 @ =0x0201777C
	ldr r0, [r0]
	adds r0, #0x29
	movs r1, #1
	strb r1, [r0]
	bx lr
	.align 2, 0
_0804FC68: .4byte 0x0201777C

	thumb_func_start sub_0804FC6C
sub_0804FC6C: @ 0x0804FC6C
	ldr r0, _0804FC78 @ =0x0201777C
	ldr r0, [r0]
	adds r0, #0x29
	movs r1, #0
	strb r1, [r0]
	bx lr
	.align 2, 0
_0804FC78: .4byte 0x0201777C

	thumb_func_start sub_0804FC7C
sub_0804FC7C: @ 0x0804FC7C
	push {r4, r5, lr}
	sub sp, #0xc
	adds r4, r0, #0
	adds r0, #0x29
	ldrb r0, [r0]
	cmp r0, #1
	beq _0804FD64
	adds r0, r4, #0
	adds r0, #0x2c
	adds r1, r4, #0
	adds r1, #0x44
	ldr r2, [r4, #0x48]
	bl EfxAdvanceFrameLut
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0
	blt _0804FCA2
	str r0, [r4, #0x54]
_0804FCA2:
	adds r0, r4, #0
	adds r0, #0x2e
	adds r1, r4, #0
	adds r1, #0x4c
	ldr r2, [r4, #0x50]
	bl EfxAdvanceFrameLut
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0
	blt _0804FCBA
	str r0, [r4, #0x58]
_0804FCBA:
	ldr r0, _0804FCE4 @ =gEkrPairHpInitial
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0x50
	bgt _0804FCF8
	ldr r2, _0804FCE8 @ =0x0201F93C
	ldr r3, _0804FCEC @ =0x0201F96C
	ldr r5, _0804FCF0 @ =0x0201F99C
	ldr r0, _0804FCF4 @ =gPal + 0x360
	movs r1, #0x10
	str r1, [sp]
	ldr r1, [r4, #0x54]
	str r1, [sp, #4]
	movs r1, #5
	str r1, [sp, #8]
	adds r1, r2, #0
	adds r2, r3, #0
	adds r3, r5, #0
	bl EfxDecodeSplitedPalette
	b _0804FD08
	.align 2, 0
_0804FCE4: .4byte gEkrPairHpInitial
_0804FCE8: .4byte 0x0201F93C
_0804FCEC: .4byte 0x0201F96C
_0804FCF0: .4byte 0x0201F99C
_0804FCF4: .4byte gPal + 0x360
_0804FCF8:
	ldr r0, [r4, #0x58]
	lsls r0, r0, #5
	ldr r1, _0804FD34 @ =gUnk_081DF3A4
	adds r0, r0, r1
	ldr r1, _0804FD38 @ =gPal + 0x360
	movs r2, #8
	bl CpuFastSet
_0804FD08:
	ldr r0, _0804FD3C @ =gEkrPairHpInitial
	movs r1, #2
	ldrsh r0, [r0, r1]
	cmp r0, #0x50
	bgt _0804FD50
	ldr r2, _0804FD40 @ =0x0201F9FC
	ldr r3, _0804FD44 @ =0x0201FA2C
	ldr r5, _0804FD48 @ =0x0201FA5C
	ldr r0, _0804FD4C @ =gPal + 0x380
	movs r1, #0x10
	str r1, [sp]
	ldr r1, [r4, #0x54]
	str r1, [sp, #4]
	movs r1, #5
	str r1, [sp, #8]
	adds r1, r2, #0
	adds r2, r3, #0
	adds r3, r5, #0
	bl EfxDecodeSplitedPalette
	b _0804FD60
	.align 2, 0
_0804FD34: .4byte gUnk_081DF3A4
_0804FD38: .4byte gPal + 0x360
_0804FD3C: .4byte gEkrPairHpInitial
_0804FD40: .4byte 0x0201F9FC
_0804FD44: .4byte 0x0201FA2C
_0804FD48: .4byte 0x0201FA5C
_0804FD4C: .4byte gPal + 0x380
_0804FD50:
	ldr r0, [r4, #0x58]
	lsls r0, r0, #5
	ldr r1, _0804FD6C @ =gUnk_081DF3A4
	adds r0, r0, r1
	ldr r1, _0804FD70 @ =gPal + 0x380
	movs r2, #8
	bl CpuFastSet
_0804FD60:
	bl EnablePalSync
_0804FD64:
	add sp, #0xc
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0804FD6C: .4byte gUnk_081DF3A4
_0804FD70: .4byte gPal + 0x380

	thumb_func_start sub_0804FD74
sub_0804FD74: @ 0x0804FD74
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	adds r6, r0, #0
	adds r4, r1, #0
	adds r5, r2, #0
	mov r8, r3
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	ldr r0, _0804FDAC @ =gUnk_08C0A238
	movs r1, #4
	bl Proc_Start
	str r6, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	strh r4, [r0, #0x2e]
	strh r5, [r0, #0x30]
	adds r0, #0x29
	mov r1, r8
	strb r1, [r0]
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0804FDAC: .4byte gUnk_08C0A238

	thumb_func_start sub_0804FDB0
sub_0804FDB0: @ 0x0804FDB0
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	ldrh r2, [r4, #0x2e]
	lsls r1, r2, #0x10
	cmp r0, r1
	blt _0804FE0E
	ldr r0, [r4, #0x5c]
	bl GetAnimPosition
	cmp r0, #0
	bne _0804FDE8
	ldr r0, _0804FDE0 @ =Pal_EkrDragon
	ldr r1, _0804FDE4 @ =gPal + 0x2e0
	movs r2, #8
	bl CpuFastSet
	ldr r0, [r4, #0x5c]
	bl EkrDragonUpdateFlashingUnit
	b _0804FDF8
	.align 2, 0
_0804FDE0: .4byte Pal_EkrDragon
_0804FDE4: .4byte gPal + 0x2e0
_0804FDE8:
	ldr r0, _0804FE14 @ =Pal_EkrDragon
	ldr r1, _0804FE18 @ =gPal + 0x320
	movs r2, #8
	bl CpuFastSet
	ldr r0, [r4, #0x5c]
	bl EkrDragonUpdateFlashingUnit
_0804FDF8:
	bl EnablePalSync
	movs r0, #0x2c
	ldrsh r1, [r4, r0]
	movs r2, #0x30
	ldrsh r0, [r4, r2]
	cmp r1, r0
	blt _0804FE0E
	adds r0, r4, #0
	bl Proc_Break
_0804FE0E:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0804FE14: .4byte Pal_EkrDragon
_0804FE18: .4byte gPal + 0x320

	thumb_func_start sub_0804FE1C
sub_0804FE1C: @ 0x0804FE1C
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x5c]
	bl GetAnimPosition
	cmp r0, #0
	bne _0804FE48
	ldr r0, _0804FE40 @ =0x02000054
	ldr r0, [r0]
	ldr r1, _0804FE44 @ =gPal + 0x2e0
	movs r2, #8
	bl CpuFastSet
	ldr r0, [r4, #0x5c]
	bl EkrDragonUpdatePal_080654C8
	b _0804FE5A
	.align 2, 0
_0804FE40: .4byte 0x02000054
_0804FE44: .4byte gPal + 0x2e0
_0804FE48:
	ldr r0, _0804FE6C @ =0x02000054
	ldr r0, [r0, #4]
	ldr r1, _0804FE70 @ =gPal + 0x320
	movs r2, #8
	bl CpuFastSet
	ldr r0, [r4, #0x5c]
	bl EkrDragonUpdatePal_080654C8
_0804FE5A:
	bl EnablePalSync
	adds r0, r4, #0
	bl Proc_Break
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0804FE6C: .4byte 0x02000054
_0804FE70: .4byte gPal + 0x320

	thumb_func_start sub_0804FE74
sub_0804FE74: @ 0x0804FE74
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r5, r0, #0
	bl GetAnimPosition
	cmp r0, #0
	bne _0804FE8C
	ldr r0, _0804FE88 @ =gpEkrBattleUnitLeft
	b _0804FE8E
	.align 2, 0
_0804FE88: .4byte gpEkrBattleUnitLeft
_0804FE8C:
	ldr r0, _0804FF14 @ =gpEkrBattleUnitRight
_0804FE8E:
	ldr r6, [r0]
	ldr r0, _0804FF18 @ =gUnk_08C0A260
	movs r1, #3
	bl Proc_Start
	adds r4, r0, #0
	adds r0, #0x29
	movs r1, #0
	strb r1, [r0]
	str r5, [r4, #0x5c]
	strh r1, [r4, #0x2c]
	str r1, [r4, #0x44]
	ldr r0, _0804FF1C @ =gUnk_081DE058
	str r0, [r4, #0x48]
	adds r0, r6, #0
	adds r0, #0x30
	ldrb r0, [r0]
	lsls r0, r0, #0x1c
	lsrs r0, r0, #0x1c
	str r0, [r4, #0x4c]
	ldr r0, _0804FF20 @ =gEkrDebugModeMaybe
	ldrh r0, [r0]
	cmp r0, #1
	bne _0804FEC0
	str r1, [r4, #0x4c]
_0804FEC0:
	str r1, [r4, #0x50]
	strh r1, [r4, #0x36]
	strh r1, [r4, #0x34]
	strh r1, [r4, #0x32]
	adds r0, r5, #0
	bl GetAnimPosition
	ldr r1, _0804FF24 @ =0x0201776C
	lsls r0, r0, #2
	adds r0, r0, r1
	str r4, [r0]
	adds r0, r5, #0
	bl GetAnimPosition
	cmp r0, #0
	bne _0804FF30
	ldr r5, _0804FF28 @ =0x02000054
	ldr r0, [r5]
	ldr r4, _0804FF2C @ =gFadeComponents
	adds r1, r4, #0
	movs r2, #0x10
	bl EfxSplitColor
	ldr r0, [r5]
	adds r5, r4, #0
	adds r5, #0x30
	adds r1, r5, #0
	movs r2, #0x10
	bl EfxSplitColorPetrify
	movs r0, #0xc0
	lsls r0, r0, #1
	adds r2, r4, r0
	movs r0, #0x10
	str r0, [sp]
	adds r0, r4, #0
	adds r1, r5, #0
	movs r3, #0x10
	bl sub_08067998
	b _0804FF60
	.align 2, 0
_0804FF14: .4byte gpEkrBattleUnitRight
_0804FF18: .4byte gUnk_08C0A260
_0804FF1C: .4byte gUnk_081DE058
_0804FF20: .4byte gEkrDebugModeMaybe
_0804FF24: .4byte 0x0201776C
_0804FF28: .4byte 0x02000054
_0804FF2C: .4byte gFadeComponents
_0804FF30:
	ldr r5, _0804FF68 @ =0x02000054
	ldr r0, [r5, #4]
	ldr r4, _0804FF6C @ =0x020222C0
	adds r1, r4, #0
	movs r2, #0x10
	bl EfxSplitColor
	ldr r0, [r5, #4]
	adds r5, r4, #0
	adds r5, #0x30
	adds r1, r5, #0
	movs r2, #0x10
	bl EfxSplitColorPetrify
	movs r0, #0xa8
	lsls r0, r0, #2
	adds r2, r4, r0
	movs r0, #0x10
	str r0, [sp]
	adds r0, r4, #0
	adds r1, r5, #0
	movs r3, #0x10
	bl sub_08067998
_0804FF60:
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0804FF68: .4byte 0x02000054
_0804FF6C: .4byte 0x020222C0

	thumb_func_start EndEfxStatusUnits
EndEfxStatusUnits: @ 0x0804FF70
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r5, _0804FFA8 @ =0x0201776C
	bl GetAnimPosition
	lsls r0, r0, #2
	adds r0, r0, r5
	ldr r0, [r0]
	cmp r0, #0
	beq _0804FFA2
	adds r0, r4, #0
	bl GetAnimPosition
	lsls r0, r0, #2
	adds r0, r0, r5
	ldr r0, [r0]
	bl Proc_End
	adds r0, r4, #0
	bl GetAnimPosition
	lsls r0, r0, #2
	adds r0, r0, r5
	movs r1, #0
	str r1, [r0]
_0804FFA2:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0804FFA8: .4byte 0x0201776C

	thumb_func_start sub_0804FFAC
sub_0804FFAC: @ 0x0804FFAC
	push {r4, lr}
	ldr r4, _0804FFC8 @ =0x0201776C
	bl GetAnimPosition
	lsls r0, r0, #2
	adds r0, r0, r4
	ldr r0, [r0]
	adds r0, #0x29
	movs r1, #1
	strb r1, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0804FFC8: .4byte 0x0201776C

	thumb_func_start sub_0804FFCC
sub_0804FFCC: @ 0x0804FFCC
	push {r4, lr}
	ldr r4, _0804FFE8 @ =0x0201776C
	bl GetAnimPosition
	lsls r0, r0, #2
	adds r0, r0, r4
	ldr r0, [r0]
	adds r0, #0x29
	movs r1, #0
	strb r1, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0804FFE8: .4byte 0x0201776C

	thumb_func_start sub_0804FFEC
sub_0804FFEC: @ 0x0804FFEC
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	adds r5, r1, #0
	ldr r4, _08050018 @ =0x0201776C
	bl GetAnimPosition
	lsls r0, r0, #2
	adds r0, r0, r4
	ldr r0, [r0]
	str r5, [r0, #0x4c]
	cmp r5, #0
	bne _08050010
	adds r0, r6, #0
	movs r1, #0
	movs r2, #0
	movs r3, #0
	bl sub_08050038
_08050010:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08050018: .4byte 0x0201776C

	thumb_func_start sub_0805001C
sub_0805001C: @ 0x0805001C
	push {r4, lr}
	ldr r4, _08050034 @ =0x0201776C
	bl GetAnimPosition
	lsls r0, r0, #2
	adds r0, r0, r4
	ldr r0, [r0]
	ldr r0, [r0, #0x4c]
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08050034: .4byte 0x0201776C

	thumb_func_start sub_08050038
sub_08050038: @ 0x08050038
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #8
	mov r8, r0
	adds r7, r1, #0
	adds r5, r2, #0
	adds r6, r3, #0
	bl GetAnimPosition
	cmp r0, #0
	bne _080500A0
	ldr r0, _08050094 @ =0x02000054
	ldr r0, [r0]
	ldr r4, _08050098 @ =gPal + 0x2e0
	adds r1, r4, #0
	movs r2, #8
	bl CpuFastSet
	ldr r0, _0805009C @ =0xFFFFFD20
	adds r4, r4, r0
	str r5, [sp]
	str r6, [sp, #4]
	adds r0, r4, #0
	movs r1, #0x17
	movs r2, #1
	adds r3, r7, #0
	bl EfxPalGrayInOut
	bl CheckInEkrDragon
	cmp r0, #0
	beq _080500C2
	mov r0, r8
	bl EkrDragonUpdatePal_080654C8
	str r5, [sp]
	str r6, [sp, #4]
	adds r0, r4, #0
	movs r1, #6
	movs r2, #1
	adds r3, r7, #0
	bl EfxPalGrayInOut
	b _080500C2
	.align 2, 0
_08050094: .4byte 0x02000054
_08050098: .4byte gPal + 0x2e0
_0805009C: .4byte 0xFFFFFD20
_080500A0:
	ldr r0, _080500D0 @ =0x02000054
	ldr r0, [r0, #4]
	ldr r4, _080500D4 @ =gPal + 0x320
	adds r1, r4, #0
	movs r2, #8
	bl CpuFastSet
	ldr r0, _080500D8 @ =0xFFFFFCE0
	adds r4, r4, r0
	str r5, [sp]
	str r6, [sp, #4]
	adds r0, r4, #0
	movs r1, #0x19
	movs r2, #1
	adds r3, r7, #0
	bl EfxPalGrayInOut
_080500C2:
	add sp, #8
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080500D0: .4byte 0x02000054
_080500D4: .4byte gPal + 0x320
_080500D8: .4byte 0xFFFFFCE0

	thumb_func_start sub_080500DC
sub_080500DC: @ 0x080500DC
	push {r4, r5, r6, lr}
	sub sp, #0xc
	adds r4, r0, #0
	ldr r0, [r4, #0x5c]
	bl sub_0805001C
	cmp r0, #0
	beq _080501D2
	adds r0, r4, #0
	adds r0, #0x29
	ldrb r0, [r0]
	cmp r0, #1
	beq _080501D2
	ldr r1, [r4, #0x4c]
	ldr r0, [r4, #0x50]
	cmp r1, r0
	beq _08050106
	movs r0, #0
	strh r0, [r4, #0x2c]
	str r0, [r4, #0x44]
	str r1, [r4, #0x50]
_08050106:
	adds r0, r4, #0
	adds r0, #0x2c
	adds r1, r4, #0
	adds r1, #0x44
	ldr r2, [r4, #0x48]
	bl EfxAdvanceFrameLut
	lsls r0, r0, #0x10
	asrs r1, r0, #0x10
	cmp r1, #0
	blt _08050156
	ldr r0, [r4, #0x4c]
	cmp r0, #2
	beq _0805013E
	cmp r0, #2
	bgt _0805012C
	cmp r0, #1
	beq _08050136
	b _08050150
_0805012C:
	cmp r0, #3
	beq _08050150
	cmp r0, #4
	beq _08050146
	b _08050150
_08050136:
	movs r0, #0
	strh r1, [r4, #0x32]
	strh r0, [r4, #0x34]
	b _08050154
_0805013E:
	movs r0, #0
	strh r0, [r4, #0x32]
	strh r0, [r4, #0x34]
	b _08050154
_08050146:
	movs r0, #0
	strh r1, [r4, #0x32]
	strh r0, [r4, #0x34]
	strh r0, [r4, #0x36]
	b _08050156
_08050150:
	strh r1, [r4, #0x32]
	strh r1, [r4, #0x34]
_08050154:
	strh r1, [r4, #0x36]
_08050156:
	ldr r0, [r4, #0x4c]
	cmp r0, #3
	beq _0805017E
	cmp r0, #3
	bgt _08050166
	cmp r0, #1
	blt _080501CE
	b _0805016A
_08050166:
	cmp r0, #4
	bne _080501CE
_0805016A:
	ldr r0, [r4, #0x5c]
	movs r2, #0x32
	ldrsh r1, [r4, r2]
	movs r3, #0x34
	ldrsh r2, [r4, r3]
	movs r5, #0x36
	ldrsh r3, [r4, r5]
	bl sub_08050038
	b _080501CE
_0805017E:
	ldr r0, [r4, #0x5c]
	bl GetAnimPosition
	cmp r0, #0
	bne _080501B0
	ldr r0, _080501A8 @ =gPal + 0x2e0
	ldr r1, _080501AC @ =gFadeComponents
	adds r2, r1, #0
	adds r2, #0x30
	movs r6, #0xc0
	lsls r6, r6, #1
	adds r3, r1, r6
	movs r5, #0x10
	str r5, [sp]
	movs r6, #0x32
	ldrsh r4, [r4, r6]
	str r4, [sp, #4]
	str r5, [sp, #8]
	bl EfxDecodeSplitedPalette
	b _080501CE
	.align 2, 0
_080501A8: .4byte gPal + 0x2e0
_080501AC: .4byte gFadeComponents
_080501B0:
	ldr r0, _080501DC @ =gPal + 0x320
	ldr r1, _080501E0 @ =0x020222C0
	adds r2, r1, #0
	adds r2, #0x30
	movs r5, #0xa8
	lsls r5, r5, #2
	adds r3, r1, r5
	movs r5, #0x10
	str r5, [sp]
	movs r6, #0x32
	ldrsh r4, [r4, r6]
	str r4, [sp, #4]
	str r5, [sp, #8]
	bl EfxDecodeSplitedPalette
_080501CE:
	bl EnablePalSync
_080501D2:
	add sp, #0xc
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080501DC: .4byte gPal + 0x320
_080501E0: .4byte 0x020222C0

	thumb_func_start sub_080501E4
sub_080501E4: @ 0x080501E4
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x5c]
	bl GetAnimPosition
	cmp r0, #0
	bne _08050208
	ldr r0, _08050200 @ =0x02000054
	ldr r0, [r0]
	ldr r1, _08050204 @ =gPal + 0x2e0
	movs r2, #8
	bl CpuFastSet
	b _08050214
	.align 2, 0
_08050200: .4byte 0x02000054
_08050204: .4byte gPal + 0x2e0
_08050208:
	ldr r0, _08050224 @ =0x02000054
	ldr r0, [r0, #4]
	ldr r1, _08050228 @ =gPal + 0x320
	movs r2, #8
	bl CpuFastSet
_08050214:
	ldr r0, [r4, #0x5c]
	bl EkrDragonUpdatePal_080654C8
	bl EnablePalSync
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08050224: .4byte 0x02000054
_08050228: .4byte gPal + 0x320

	thumb_func_start sub_0805022C
sub_0805022C: @ 0x0805022C
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	ldr r0, _08050268 @ =gUnk_08C0A288
	movs r1, #3
	bl Proc_Start
	movs r2, #0
	strh r2, [r0, #0x2c]
	str r2, [r0, #0x44]
	ldr r1, _0805026C @ =gUnk_081DE07A
	str r1, [r0, #0x48]
	str r2, [r0, #0x4c]
	str r2, [r0, #0x50]
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	str r4, [r0, #0x54]
	lsls r5, r5, #0x10
	asrs r5, r5, #0x10
	str r5, [r0, #0x58]
	ldr r1, _08050270 @ =0x02017774
	str r0, [r1]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08050268: .4byte gUnk_08C0A288
_0805026C: .4byte gUnk_081DE07A
_08050270: .4byte 0x02017774

	thumb_func_start EndProcEfxWeaponIcon
EndProcEfxWeaponIcon: @ 0x08050274
	push {r4, lr}
	ldr r4, _0805028C @ =0x02017774
	ldr r0, [r4]
	cmp r0, #0
	beq _08050286
	bl Proc_End
	movs r0, #0
	str r0, [r4]
_08050286:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0805028C: .4byte 0x02017774

	thumb_func_start sub_08050290
sub_08050290: @ 0x08050290
	ldr r0, _0805029C @ =0x02017774
	ldr r1, [r0]
	movs r0, #1
	str r0, [r1, #0x50]
	bx lr
	.align 2, 0
_0805029C: .4byte 0x02017774

	thumb_func_start sub_080502A0
sub_080502A0: @ 0x080502A0
	ldr r0, _080502AC @ =0x02017774
	ldr r1, [r0]
	movs r0, #0
	str r0, [r1, #0x50]
	bx lr
	.align 2, 0
_080502AC: .4byte 0x02017774

	thumb_func_start sub_080502B0
sub_080502B0: @ 0x080502B0
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x50]
	cmp r0, #1
	beq _0805030E
	bl InitIcons
	adds r0, r4, #0
	adds r0, #0x2c
	adds r1, r4, #0
	adds r1, #0x44
	ldr r2, [r4, #0x48]
	bl EfxAdvanceFrameLut
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0
	blt _080502D6
	str r0, [r4, #0x4c]
_080502D6:
	ldr r0, [r4, #0x54]
	cmp r0, #0
	beq _080502F0
	movs r0, #0
	movs r1, #0x1d
	bl ApplyIconPalette
	ldr r0, _08050314 @ =gPal
	ldr r3, [r4, #0x4c]
	movs r1, #0x1d
	movs r2, #1
	bl EfxPalWhiteInOut
_080502F0:
	ldr r0, [r4, #0x58]
	cmp r0, #0
	beq _0805030A
	movs r0, #0
	movs r1, #0x1e
	bl ApplyIconPalette
	ldr r0, _08050314 @ =gPal
	ldr r3, [r4, #0x4c]
	movs r1, #0x1e
	movs r2, #1
	bl EfxPalWhiteInOut
_0805030A:
	bl EnablePalSync
_0805030E:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08050314: .4byte gPal

	thumb_func_start sub_08050318
sub_08050318: @ 0x08050318
	push {r4, lr}
	adds r4, r0, #0
	bl InitIcons
	ldr r0, [r4, #0x54]
	cmp r0, #0
	beq _0805032E
	movs r0, #0
	movs r1, #0x1d
	bl ApplyIconPalette
_0805032E:
	ldr r0, [r4, #0x58]
	cmp r0, #0
	beq _0805033C
	movs r0, #0
	movs r1, #0x1e
	bl ApplyIconPalette
_0805033C:
	bl EnablePalSync
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_08050348
sub_08050348: @ 0x08050348
	push {r4, r5, lr}
	bl CheckInEkrDragon
	adds r4, r0, #0
	cmp r4, #0
	bne _08050394
	ldr r0, _0805037C @ =gUnk_08C0A2B0
	movs r1, #4
	bl Proc_Start
	adds r5, r0, #0
	adds r0, #0x29
	strb r4, [r0]
	strh r4, [r5, #0x2c]
	movs r0, #4
	strh r0, [r5, #0x2e]
	ldr r0, _08050380 @ =0x02017778
	ldr r0, [r0]
	cmp r0, #0
	bne _0805038C
	ldr r0, _08050384 @ =gPal + 0xc0
	ldr r1, _08050388 @ =0x0201C784
	movs r2, #0x50
	bl CpuFastSet
	b _08050390
	.align 2, 0
_0805037C: .4byte gUnk_08C0A2B0
_08050380: .4byte 0x02017778
_08050384: .4byte gPal + 0xc0
_08050388: .4byte 0x0201C784
_0805038C:
	bl Proc_End
_08050390:
	ldr r0, _0805039C @ =0x02017778
	str r5, [r0]
_08050394:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0805039C: .4byte 0x02017778

	thumb_func_start sub_080503A0
sub_080503A0: @ 0x080503A0
	ldr r0, _080503B4 @ =0x02017778
	ldr r0, [r0]
	cmp r0, #0
	beq _080503B0
	adds r1, r0, #0
	adds r1, #0x29
	movs r0, #1
	strb r0, [r1]
_080503B0:
	bx lr
	.align 2, 0
_080503B4: .4byte 0x02017778

	thumb_func_start sub_080503B8
sub_080503B8: @ 0x080503B8
	push {lr}
	ldr r1, _080503D0 @ =0x02017778
	ldr r0, [r1]
	cmp r0, #0
	beq _080503CA
	movs r0, #0
	str r0, [r1]
	bl Proc_End
_080503CA:
	pop {r0}
	bx r0
	.align 2, 0
_080503D0: .4byte 0x02017778

	thumb_func_start sub_080503D4
sub_080503D4: @ 0x080503D4
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r6, r0, #0
	movs r0, #0x2c
	ldrsh r3, [r6, r0]
	movs r1, #0x2e
	ldrsh r0, [r6, r1]
	str r0, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #8
	bl Interpolate
	adds r5, r0, #0
	ldr r0, _08050430 @ =0x0201C784
	ldr r4, _08050434 @ =gPal + 0xc0
	adds r1, r4, #0
	movs r2, #0x50
	bl CpuFastSet
	subs r4, #0xc0
	adds r0, r4, #0
	movs r1, #6
	movs r2, #0xa
	adds r3, r5, #0
	bl EfxPalBlackInOut
	bl EnablePalSync
	ldrh r1, [r6, #0x2c]
	adds r1, #1
	strh r1, [r6, #0x2c]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	movs r2, #0x2e
	ldrsh r0, [r6, r2]
	adds r0, #1
	cmp r1, r0
	bne _08050428
	adds r0, r6, #0
	bl Proc_Break
_08050428:
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08050430: .4byte 0x0201C784
_08050434: .4byte gPal + 0xc0

	thumb_func_start sub_08050438
sub_08050438: @ 0x08050438
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r0, _08050470 @ =0x0201C784
	ldr r4, _08050474 @ =gPal + 0xc0
	adds r1, r4, #0
	movs r2, #0x50
	bl CpuFastSet
	subs r4, #0xc0
	adds r0, r4, #0
	movs r1, #6
	movs r2, #0xa
	movs r3, #8
	bl EfxPalBlackInOut
	adds r0, r5, #0
	adds r0, #0x29
	ldrb r0, [r0]
	cmp r0, #1
	bne _0805046A
	movs r0, #0
	strh r0, [r5, #0x2c]
	adds r0, r5, #0
	bl Proc_Break
_0805046A:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08050470: .4byte 0x0201C784
_08050474: .4byte gPal + 0xc0

	thumb_func_start sub_08050478
sub_08050478: @ 0x08050478
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r5, r0, #0
	movs r0, #0x2c
	ldrsh r3, [r5, r0]
	movs r1, #0x2e
	ldrsh r0, [r5, r1]
	str r0, [sp]
	movs r0, #0
	movs r1, #8
	movs r2, #0
	bl Interpolate
	adds r4, r0, #0
	ldr r7, _080504EC @ =0x0201C784
	ldr r6, _080504F0 @ =gPal + 0xc0
	adds r0, r7, #0
	adds r1, r6, #0
	movs r2, #0x50
	bl CpuFastSet
	adds r0, r6, #0
	subs r0, #0xc0
	movs r1, #6
	movs r2, #0xa
	adds r3, r4, #0
	bl EfxPalBlackInOut
	bl EnablePalSync
	ldrh r1, [r5, #0x2c]
	adds r1, #1
	strh r1, [r5, #0x2c]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	movs r2, #0x2e
	ldrsh r0, [r5, r2]
	adds r0, #1
	cmp r1, r0
	bne _080504E2
	ldr r1, _080504F4 @ =0x02017778
	movs r0, #0
	str r0, [r1]
	adds r0, r7, #0
	adds r1, r6, #0
	movs r2, #0x50
	bl CpuFastSet
	bl EnablePalSync
	adds r0, r5, #0
	bl Proc_Break
_080504E2:
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080504EC: .4byte 0x0201C784
_080504F0: .4byte gPal + 0xc0
_080504F4: .4byte 0x02017778

	thumb_func_start sub_080504F8
sub_080504F8: @ 0x080504F8
	push {r4, r5, lr}
	ldr r0, _08050528 @ =gUnk_08C0A2E0
	movs r1, #4
	bl Proc_Start
	adds r4, r0, #0
	adds r1, r4, #0
	adds r1, #0x29
	movs r0, #0
	strb r0, [r1]
	strh r0, [r4, #0x2c]
	movs r0, #4
	strh r0, [r4, #0x2e]
	ldr r5, _0805052C @ =0x02017778
	ldr r0, [r5]
	cmp r0, #0
	beq _0805051E
	bl Proc_End
_0805051E:
	str r4, [r5]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08050528: .4byte gUnk_08C0A2E0
_0805052C: .4byte 0x02017778

	thumb_func_start sub_08050530
sub_08050530: @ 0x08050530
	ldr r0, _08050544 @ =0x02017778
	ldr r0, [r0]
	cmp r0, #0
	beq _08050540
	adds r1, r0, #0
	adds r1, #0x29
	movs r0, #1
	strb r0, [r1]
_08050540:
	bx lr
	.align 2, 0
_08050544: .4byte 0x02017778

	thumb_func_start sub_08050548
sub_08050548: @ 0x08050548
	ldr r0, _0805055C @ =0x02017778
	ldr r0, [r0]
	cmp r0, #0
	beq _08050558
	adds r1, r0, #0
	adds r1, #0x29
	movs r0, #2
	strb r0, [r1]
_08050558:
	bx lr
	.align 2, 0
_0805055C: .4byte 0x02017778

	thumb_func_start sub_08050560
sub_08050560: @ 0x08050560
	push {lr}
	ldr r1, _08050578 @ =0x02017778
	ldr r0, [r1]
	cmp r0, #0
	beq _08050572
	movs r0, #0
	str r0, [r1]
	bl Proc_End
_08050572:
	pop {r0}
	bx r0
	.align 2, 0
_08050578: .4byte 0x02017778

	thumb_func_start sub_0805057C
sub_0805057C: @ 0x0805057C
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r5, r0, #0
	ldr r6, _080505A8 @ =0x0203DFE2
	movs r1, #0
	ldrsh r0, [r6, r1]
	cmp r0, #0
	bne _080505AC
	movs r2, #0x2c
	ldrsh r3, [r5, r2]
	movs r1, #0x2e
	ldrsh r0, [r5, r1]
	str r0, [sp]
	movs r0, #0
	movs r1, #4
	movs r2, #0x10
	bl Interpolate
	adds r4, r0, #0
	bl EfxChapterMapFadeOUT
	b _080505DC
	.align 2, 0
_080505A8: .4byte 0x0203DFE2
_080505AC:
	movs r2, #0x2c
	ldrsh r3, [r5, r2]
	movs r1, #0x2e
	ldrsh r0, [r5, r1]
	str r0, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #0x10
	bl Interpolate
	adds r4, r0, #0
	movs r2, #0
	ldrsh r0, [r6, r2]
	subs r0, #1
	bl sub_0806B7DC
	ldr r0, _08050600 @ =gPal
	movs r1, #6
	movs r2, #0xa
	adds r3, r4, #0
	bl EfxPalBlackInOut
	bl EnablePalSync
_080505DC:
	ldrh r1, [r5, #0x2c]
	adds r1, #1
	strh r1, [r5, #0x2c]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	movs r2, #0x2e
	ldrsh r0, [r5, r2]
	adds r0, #1
	cmp r1, r0
	bne _080505F6
	adds r0, r5, #0
	bl Proc_Break
_080505F6:
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08050600: .4byte gPal

	thumb_func_start sub_08050604
sub_08050604: @ 0x08050604
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x29
	ldrb r0, [r0]
	cmp r0, #1
	bne _08050636
	movs r0, #0
	strh r0, [r4, #0x2c]
	str r0, [r4, #0x44]
	ldr r0, _0805063C @ =gUnk_081DE0A8
	str r0, [r4, #0x48]
	ldr r0, _08050640 @ =gUnk_08C0A320
	str r0, [r4, #0x4c]
	ldr r0, _08050644 @ =gUnk_082CDB44
	ldr r1, _08050648 @ =0x06008000
	bl LZ77UnCompVram
	ldr r0, _0805064C @ =gUnk_082D3338
	ldr r1, _08050650 @ =gPal + 0xc0
	movs r2, #8
	bl CpuFastSet
	adds r0, r4, #0
	bl Proc_Break
_08050636:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0805063C: .4byte gUnk_081DE0A8
_08050640: .4byte gUnk_08C0A320
_08050644: .4byte gUnk_082CDB44
_08050648: .4byte 0x06008000
_0805064C: .4byte gUnk_082D3338
_08050650: .4byte gPal + 0xc0

	thumb_func_start sub_08050654
sub_08050654: @ 0x08050654
	push {r4, r5, lr}
	sub sp, #8
	adds r4, r0, #0
	ldr r5, _080506D0 @ =0x0201B784
	adds r0, #0x2c
	adds r1, r4, #0
	adds r1, #0x44
	ldr r2, [r4, #0x48]
	bl EfxAdvanceFrameLut
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0
	blt _08050698
	ldr r1, [r4, #0x4c]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	adds r1, r5, #0
	bl LZ77UnCompWram
	ldr r1, _080506D4 @ =gBg3Tm
	movs r0, #6
	str r0, [sp]
	movs r0, #0
	str r0, [sp, #4]
	adds r0, r5, #0
	movs r2, #0x1e
	movs r3, #0x14
	bl EfxTmCpyBG
	movs r0, #8
	bl EnableBgSync
_08050698:
	adds r0, r4, #0
	adds r0, #0x29
	ldrb r0, [r0]
	cmp r0, #2
	bne _080506C6
	ldr r0, _080506D4 @ =gBg3Tm
	ldr r1, _080506D8 @ =0x0000601F
	bl TmFill
	movs r0, #8
	bl EnableBgSync
	ldr r0, _080506DC @ =gPal
	movs r1, #6
	movs r2, #0xa
	movs r3, #0x10
	bl EfxPalBlackInOut
	bl EnablePalSync
	adds r0, r4, #0
	bl Proc_Break
_080506C6:
	add sp, #8
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080506D0: .4byte 0x0201B784
_080506D4: .4byte gBg3Tm
_080506D8: .4byte 0x0000601F
_080506DC: .4byte gPal

	thumb_func_start sub_080506E0
sub_080506E0: @ 0x080506E0
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, _08050700 @ =0x0203DFE2
	movs r2, #0
	ldrsh r0, [r1, r2]
	cmp r0, #0
	bne _08050708
	ldr r0, _08050704 @ =gPlaySt
	ldrb r0, [r0, #0xe]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl sub_080195BC
	bl RenderMap
	b _08050712
	.align 2, 0
_08050700: .4byte 0x0203DFE2
_08050704: .4byte gPlaySt
_08050708:
	movs r2, #0
	ldrsh r0, [r1, r2]
	subs r0, #1
	bl sub_0806B800
_08050712:
	ldr r0, _08050738 @ =gPal
	movs r1, #6
	movs r2, #0xa
	movs r3, #0x10
	bl EfxPalBlackInOut
	bl EnablePalSync
	movs r0, #0
	strh r0, [r4, #0x2c]
	movs r0, #4
	strh r0, [r4, #0x2e]
	adds r0, r4, #0
	bl Proc_Break
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08050738: .4byte gPal

	thumb_func_start sub_0805073C
sub_0805073C: @ 0x0805073C
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r5, r0, #0
	ldr r6, _08050768 @ =0x0203DFE2
	movs r1, #0
	ldrsh r0, [r6, r1]
	cmp r0, #0
	bne _0805076C
	movs r2, #0x2c
	ldrsh r3, [r5, r2]
	movs r1, #0x2e
	ldrsh r0, [r5, r1]
	str r0, [sp]
	movs r0, #0
	movs r1, #0x10
	movs r2, #4
	bl Interpolate
	adds r4, r0, #0
	bl EfxChapterMapFadeOUT
	b _0805079C
	.align 2, 0
_08050768: .4byte 0x0203DFE2
_0805076C:
	movs r2, #0x2c
	ldrsh r3, [r5, r2]
	movs r1, #0x2e
	ldrsh r0, [r5, r1]
	str r0, [sp]
	movs r0, #0
	movs r1, #0x10
	movs r2, #0
	bl Interpolate
	adds r4, r0, #0
	movs r2, #0
	ldrsh r0, [r6, r2]
	subs r0, #1
	bl sub_0806B7DC
	ldr r0, _080507C4 @ =gPal
	movs r1, #6
	movs r2, #0xa
	adds r3, r4, #0
	bl EfxPalBlackInOut
	bl EnablePalSync
_0805079C:
	ldrh r1, [r5, #0x2c]
	adds r1, #1
	strh r1, [r5, #0x2c]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	movs r2, #0x2e
	ldrsh r0, [r5, r2]
	adds r0, #1
	cmp r1, r0
	bne _080507BC
	ldr r1, _080507C8 @ =0x02017778
	movs r0, #0
	str r0, [r1]
	adds r0, r5, #0
	bl Proc_Break
_080507BC:
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080507C4: .4byte gPal
_080507C8: .4byte 0x02017778

	thumb_func_start SpellFx_Begin
SpellFx_Begin: @ 0x080507CC
	ldr r1, _080507D4 @ =0x0201772C
	movs r0, #1
	str r0, [r1]
	bx lr
	.align 2, 0
_080507D4: .4byte 0x0201772C

	thumb_func_start SpellFx_Finish
SpellFx_Finish: @ 0x080507D8
	ldr r1, _080507E0 @ =0x0201772C
	movs r0, #0
	str r0, [r1]
	bx lr
	.align 2, 0
_080507E0: .4byte 0x0201772C

	thumb_func_start SpellFx_ClearBG1Position
SpellFx_ClearBG1Position: @ 0x080507E4
	push {lr}
	movs r0, #1
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	pop {r0}
	bx r0

	thumb_func_start SpellFx_ClearBG1
SpellFx_ClearBG1: @ 0x080507F4
	push {lr}
	sub sp, #4
	movs r0, #0
	str r0, [sp]
	ldr r1, _08050814 @ =gBg1Tm
	ldr r2, _08050818 @ =0x01000200
	mov r0, sp
	bl CpuFastSet
	movs r0, #2
	bl EnableBgSync
	add sp, #4
	pop {r0}
	bx r0
	.align 2, 0
_08050814: .4byte gBg1Tm
_08050818: .4byte 0x01000200

	thumb_func_start SpellFx_SetSomeColorEffect
SpellFx_SetSomeColorEffect: @ 0x0805081C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	ldr r0, _080508E8 @ =gDispIo
	mov ip, r0
	mov r2, ip
	adds r2, #0x3c
	movs r0, #0x3f
	ldrb r1, [r2]
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r2]
	mov r1, ip
	adds r1, #0x44
	movs r2, #0
	movs r3, #0x10
	mov r8, r3
	movs r0, #0x10
	strb r0, [r1]
	adds r1, #1
	strb r0, [r1]
	mov r0, ip
	adds r0, #0x46
	strb r2, [r0]
	ldr r0, _080508EC @ =0x0000FFE0
	mov r1, ip
	ldrh r1, [r1, #0x3c]
	ands r0, r1
	movs r1, #2
	orrs r0, r1
	ldr r1, _080508F0 @ =0x0000E0FF
	ands r0, r1
	movs r3, #0xe0
	lsls r3, r3, #5
	adds r1, r3, #0
	orrs r0, r1
	mov r1, ip
	strh r0, [r1, #0x3c]
	movs r5, #0x20
	ldrb r0, [r1, #1]
	orrs r0, r5
	movs r1, #0x41
	rsbs r1, r1, #0
	ands r0, r1
	movs r1, #0x7f
	ands r0, r1
	mov r3, ip
	strb r0, [r3, #1]
	mov r0, ip
	adds r0, #0x2d
	strb r2, [r0]
	adds r0, #4
	strb r2, [r0]
	mov r1, ip
	adds r1, #0x2c
	movs r0, #0xf0
	strb r0, [r1]
	adds r1, #4
	movs r0, #0xa0
	strb r0, [r1]
	mov r6, ip
	adds r6, #0x34
	movs r0, #1
	ldrb r1, [r6]
	orrs r1, r0
	movs r2, #2
	orrs r1, r2
	movs r4, #4
	orrs r1, r4
	movs r3, #8
	orrs r1, r3
	mov r2, r8
	orrs r1, r2
	mov r7, ip
	adds r7, #0x36
	ldrb r2, [r7]
	orrs r0, r2
	movs r2, #3
	rsbs r2, r2, #0
	ands r0, r2
	orrs r0, r4
	orrs r0, r3
	mov r3, r8
	orrs r0, r3
	orrs r1, r5
	strb r1, [r6]
	movs r1, #0x21
	rsbs r1, r1, #0
	ands r0, r1
	strb r0, [r7]
	mov r0, ip
	adds r0, #0x3d
	ldrb r1, [r0]
	orrs r5, r1
	strb r5, [r0]
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080508E8: .4byte gDispIo
_080508EC: .4byte 0x0000FFE0
_080508F0: .4byte 0x0000E0FF

	thumb_func_start SpellFx_ClearColorEffects
SpellFx_ClearColorEffects: @ 0x080508F4
	ldr r3, _08050918 @ =gDispIo
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
	bx lr
	.align 2, 0
_08050918: .4byte gDispIo

	thumb_func_start StartBattleAnimHitEffectsDefault
StartBattleAnimHitEffectsDefault: @ 0x0805091C
	push {lr}
	movs r2, #3
	movs r3, #4
	bl StartBattleAnimHitEffects
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_0805092C
sub_0805092C: @ 0x0805092C
	push {lr}
	movs r2, #5
	movs r3, #5
	bl StartBattleAnimHitEffects
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start StartBattleAnimHitEffects
StartBattleAnimHitEffects: @ 0x0805093C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	adds r4, r1, #0
	str r2, [sp]
	mov sl, r3
	bl GetAnimPosition
	cmp r0, #0
	bne _08050968
	ldr r0, _08050964 @ =gAnims
	ldr r7, [r0, #8]
	ldr r1, [r0, #0xc]
	mov sb, r1
	ldr r5, [r0]
	ldr r0, [r0, #4]
	b _08050974
	.align 2, 0
_08050964: .4byte gAnims
_08050968:
	ldr r0, _08050984 @ =gAnims
	ldr r7, [r0]
	ldr r1, [r0, #4]
	mov sb, r1
	ldr r5, [r0, #8]
	ldr r0, [r0, #0xc]
_08050974:
	mov r8, r0
	cmp r4, #0
	beq _08050988
	cmp r4, #1
	bne _08050980
	b _08050AB2
_08050980:
	b _08050AB8
	.align 2, 0
_08050984: .4byte gAnims
_08050988:
	adds r0, r7, #0
	bl GetAnimPosition
	adds r1, r0, #0
	ldrh r0, [r7, #0xe]
	subs r0, #1
	lsls r0, r0, #1
	adds r0, r0, r1
	bl GetBattleAnimRoundTypeFlags
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	adds r0, r5, #0
	bl GetAnimPosition
	adds r1, r0, #0
	ldrh r0, [r5, #0xe]
	subs r0, #1
	lsls r0, r0, #1
	adds r0, r0, r1
	bl GetBattleAnimRoundTypeFlags
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	lsls r0, r6, #0x10
	asrs r0, r0, #0x10
	movs r1, #0x80
	lsls r1, r1, #6
	ands r0, r1
	cmp r0, #0
	beq _080509D8
	adds r0, r7, #0
	bl sub_0805001C
	cmp r0, #0
	bne _080509D8
	adds r0, r7, #0
	movs r1, #1
	bl sub_0804FFEC
_080509D8:
	lsls r0, r4, #0x10
	asrs r1, r0, #0x10
	movs r2, #0x80
	lsls r2, r2, #6
	ands r1, r2
	adds r4, r0, #0
	cmp r1, #0
	beq _080509FA
	adds r0, r5, #0
	bl sub_0805001C
	cmp r0, #0
	bne _080509FA
	adds r0, r5, #0
	movs r1, #1
	bl sub_0804FFEC
_080509FA:
	lsls r0, r6, #0x10
	asrs r0, r0, #0x10
	movs r1, #0x80
	lsls r1, r1, #8
	ands r0, r1
	cmp r0, #0
	bne _08050A10
	asrs r0, r4, #0x10
	ands r0, r1
	cmp r0, #0
	beq _08050A18
_08050A10:
	adds r0, r5, #0
	adds r5, r7, #0
	adds r7, r0, #0
	mov r8, sb
_08050A18:
	ldr r4, _08050A80 @ =gEfxPairHpBufOffset
	adds r0, r5, #0
	bl GetAnimPosition
	lsls r0, r0, #1
	adds r0, r0, r4
	movs r1, #0
	ldrsh r6, [r0, r1]
	adds r0, r5, #0
	bl GetAnimPosition
	lsls r0, r0, #1
	adds r0, r0, r4
	movs r1, #0
	ldrsh r4, [r0, r1]
	adds r4, #1
	adds r0, r5, #0
	bl GetAnimPosition
	adds r1, r0, #0
	lsls r0, r6, #1
	adds r0, r0, r1
	bl GetEfxHp
	lsls r0, r0, #0x10
	asrs r6, r0, #0x10
	adds r0, r5, #0
	bl GetAnimPosition
	adds r1, r0, #0
	lsls r0, r4, #1
	adds r0, r0, r1
	bl GetEfxHp
	lsls r0, r0, #0x10
	asrs r4, r0, #0x10
	cmp r6, r4
	beq _08050AA6
	adds r0, r5, #0
	bl sub_0804DD80
	adds r0, r7, #0
	bl CheckRoundCrit
	cmp r0, #1
	bne _08050A84
	adds r0, r5, #0
	adds r1, r7, #0
	mov r2, sl
	bl NewEfxHitQuake
	b _08050A8E
	.align 2, 0
_08050A80: .4byte gEfxPairHpBufOffset
_08050A84:
	adds r0, r5, #0
	adds r1, r7, #0
	ldr r2, [sp]
	bl NewEfxHitQuake
_08050A8E:
	adds r0, r5, #0
	movs r1, #0
	movs r2, #5
	bl NewEfxWhiteIN
	adds r0, r5, #0
	movs r1, #0
	movs r2, #8
	movs r3, #0
	bl sub_0804FD74
	b _08050AB8
_08050AA6:
	adds r0, r5, #0
	mov r1, r8
	movs r2, #0
	bl sub_0804E604
	b _08050AB8
_08050AB2:
	adds r0, r5, #0
	bl sub_0804E3E0
_08050AB8:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start StartBattleAnimResireHitEffects
StartBattleAnimResireHitEffects: @ 0x08050AC8
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	mov sb, r1
	bl GetAnimPosition
	cmp r0, #0
	bne _08050AE8
	ldr r0, _08050AE4 @ =gAnims
	ldr r7, [r0, #8]
	ldr r5, [r0]
	ldr r0, [r0, #4]
	b _08050AF0
	.align 2, 0
_08050AE4: .4byte gAnims
_08050AE8:
	ldr r0, _08050B48 @ =gAnims
	ldr r7, [r0]
	ldr r5, [r0, #8]
	ldr r0, [r0, #0xc]
_08050AF0:
	mov r8, r0
	ldr r4, _08050B4C @ =gEfxPairHpBufOffset
	adds r0, r5, #0
	bl GetAnimPosition
	lsls r0, r0, #1
	adds r0, r0, r4
	movs r1, #0
	ldrsh r6, [r0, r1]
	adds r0, r5, #0
	bl GetAnimPosition
	lsls r0, r0, #1
	adds r0, r0, r4
	movs r1, #0
	ldrsh r4, [r0, r1]
	adds r4, #1
	adds r0, r5, #0
	bl GetAnimPosition
	adds r1, r0, #0
	lsls r0, r6, #1
	adds r0, r0, r1
	bl GetEfxHp
	lsls r0, r0, #0x10
	asrs r6, r0, #0x10
	adds r0, r5, #0
	bl GetAnimPosition
	adds r1, r0, #0
	lsls r0, r4, #1
	adds r0, r0, r1
	bl GetEfxHp
	lsls r0, r0, #0x10
	asrs r4, r0, #0x10
	mov r0, sb
	cmp r0, #0
	beq _08050B50
	cmp r0, #1
	beq _08050BA8
	b _08050BAE
	.align 2, 0
_08050B48: .4byte gAnims
_08050B4C: .4byte gEfxPairHpBufOffset
_08050B50:
	cmp r6, r4
	beq _08050B92
	adds r0, r5, #0
	bl sub_0804E048
	adds r0, r7, #0
	bl CheckRoundCrit
	cmp r0, #1
	bne _08050B70
	adds r0, r5, #0
	adds r1, r7, #0
	movs r2, #4
	bl NewEfxHitQuake
	b _08050B7A
_08050B70:
	adds r0, r5, #0
	adds r1, r7, #0
	movs r2, #3
	bl NewEfxHitQuake
_08050B7A:
	adds r0, r5, #0
	movs r1, #0
	movs r2, #5
	bl NewEfxWhiteIN
	adds r0, r5, #0
	movs r1, #0
	movs r2, #8
	movs r3, #0
	bl sub_0804FD74
	b _08050BAE
_08050B92:
	ldr r1, _08050BA4 @ =0x02017750
	movs r0, #2
	str r0, [r1]
	adds r0, r5, #0
	mov r1, r8
	movs r2, #1
	bl sub_0804E604
	b _08050BAE
	.align 2, 0
_08050BA4: .4byte 0x02017750
_08050BA8:
	adds r0, r5, #0
	bl sub_0804E3E0
_08050BAE:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_08050BBC
sub_08050BBC: @ 0x08050BBC
	push {r4, lr}
	adds r4, r1, #0
	bl GetAnimPosition
	cmp r0, #0
	bne _08050BD4
	ldr r0, _08050BD0 @ =gAnims
	ldr r0, [r0]
	b _08050BD8
	.align 2, 0
_08050BD0: .4byte gAnims
_08050BD4:
	ldr r0, _08050BE4 @ =gAnims
	ldr r0, [r0, #8]
_08050BD8:
	cmp r4, #0
	beq _08050BE8
	cmp r4, #1
	beq _08050BEE
	b _08050BF2
	.align 2, 0
_08050BE4: .4byte gAnims
_08050BE8:
	bl sub_0804E7AC
	b _08050BF2
_08050BEE:
	bl sub_0804E3E0
_08050BF2:
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_08050BF8
sub_08050BF8: @ 0x08050BF8
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	adds r7, r1, #0
	adds r6, r2, #0
	adds r5, r3, #0
	ldr r0, _08050C1C @ =gEkrDistanceType
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	bne _08050C24
	adds r0, r4, #0
	bl GetAnimPosition
	cmp r0, #0
	bne _08050C20
	adds r0, r7, #0
	b _08050C34
	.align 2, 0
_08050C1C: .4byte gEkrDistanceType
_08050C20:
	adds r0, r6, #0
	b _08050C34
_08050C24:
	adds r0, r4, #0
	bl GetAnimPosition
	cmp r0, #0
	bne _08050C32
	adds r0, r5, #0
	b _08050C34
_08050C32:
	ldr r0, [sp, #0x14]
_08050C34:
	movs r1, #0x78
	bl AnimCreate
	adds r1, r0, #0
	movs r0, #0xa1
	lsls r0, r0, #6
	strh r0, [r1, #8]
	ldrh r0, [r4, #2]
	strh r0, [r1, #2]
	ldrh r0, [r4, #4]
	strh r0, [r1, #4]
	adds r0, r1, #0
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_08050C54
sub_08050C54: @ 0x08050C54
	push {r4, lr}
	sub sp, #8
	adds r3, r0, #0
	ldr r0, _08050C88 @ =gEkrDistanceType
	movs r4, #0
	ldrsh r0, [r0, r4]
	adds r4, r2, #0
	cmp r0, #0
	bne _08050C68
	adds r4, r1, #0
_08050C68:
	adds r0, r3, #0
	bl GetAnimPosition
	cmp r0, #0
	bne _08050C90
	ldr r1, _08050C8C @ =gBg1Tm
	movs r0, #1
	str r0, [sp]
	adds r0, #0xff
	str r0, [sp, #4]
	adds r0, r4, #0
	movs r2, #0x1e
	movs r3, #0x14
	bl EfxTmCpyBgHFlip
	b _08050CA4
	.align 2, 0
_08050C88: .4byte gEkrDistanceType
_08050C8C: .4byte gBg1Tm
_08050C90:
	ldr r1, _08050CB4 @ =gBg1Tm
	movs r0, #1
	str r0, [sp]
	adds r0, #0xff
	str r0, [sp, #4]
	adds r0, r4, #0
	movs r2, #0x1e
	movs r3, #0x14
	bl EfxTmCpyBG
_08050CA4:
	movs r0, #2
	bl EnableBgSync
	add sp, #8
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08050CB4: .4byte gBg1Tm

	thumb_func_start SpellFx_WriteBgMap
SpellFx_WriteBgMap: @ 0x08050CB8
	push {r4, r5, lr}
	sub sp, #8
	adds r4, r0, #0
	adds r3, r1, #0
	ldr r0, _08050CD4 @ =gEkrDistanceType
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	bne _08050CDC
	ldr r1, _08050CD8 @ =gEkrTsaBuffer
	adds r0, r3, #0
	bl LZ77UnCompWram
	b _08050CE4
	.align 2, 0
_08050CD4: .4byte gEkrDistanceType
_08050CD8: .4byte gEkrTsaBuffer
_08050CDC:
	ldr r1, _08050D08 @ =gEkrTsaBuffer
	adds r0, r2, #0
	bl LZ77UnCompWram
_08050CE4:
	ldr r5, _08050D08 @ =gEkrTsaBuffer
	adds r0, r4, #0
	bl GetAnimPosition
	cmp r0, #0
	bne _08050D10
	ldr r1, _08050D0C @ =gBg1Tm
	movs r0, #1
	str r0, [sp]
	adds r0, #0xff
	str r0, [sp, #4]
	adds r0, r5, #0
	movs r2, #0x1e
	movs r3, #0x14
	bl EfxTmCpyBgHFlip
	b _08050D24
	.align 2, 0
_08050D08: .4byte gEkrTsaBuffer
_08050D0C: .4byte gBg1Tm
_08050D10:
	ldr r1, _08050D34 @ =gBg1Tm
	movs r0, #1
	str r0, [sp]
	adds r0, #0xff
	str r0, [sp, #4]
	adds r0, r5, #0
	movs r2, #0x1e
	movs r3, #0x14
	bl EfxTmCpyBG
_08050D24:
	movs r0, #2
	bl EnableBgSync
	add sp, #8
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08050D34: .4byte gBg1Tm

	thumb_func_start sub_08050D38
sub_08050D38: @ 0x08050D38
	push {r4, r5, r6, r7, lr}
	sub sp, #8
	adds r4, r0, #0
	adds r0, r1, #0
	adds r5, r2, #0
	adds r6, r3, #0
	ldr r7, _08050D70 @ =gEkrTsaBuffer
	adds r1, r7, #0
	bl LZ77UnCompWram
	adds r0, r4, #0
	bl GetAnimPosition
	cmp r0, #0
	bne _08050D78
	ldr r1, _08050D74 @ =gBg1Tm
	lsls r2, r5, #0x10
	lsrs r2, r2, #0x10
	lsls r3, r6, #0x10
	lsrs r3, r3, #0x10
	movs r0, #1
	str r0, [sp]
	adds r0, #0xff
	str r0, [sp, #4]
	adds r0, r7, #0
	bl EfxTmCpyBgHFlip
	b _08050D90
	.align 2, 0
_08050D70: .4byte gEkrTsaBuffer
_08050D74: .4byte gBg1Tm
_08050D78:
	ldr r1, _08050DA0 @ =gBg1Tm
	lsls r2, r5, #0x10
	lsrs r2, r2, #0x10
	lsls r3, r6, #0x10
	lsrs r3, r3, #0x10
	movs r0, #1
	str r0, [sp]
	adds r0, #0xff
	str r0, [sp, #4]
	adds r0, r7, #0
	bl EfxTmCpyBG
_08050D90:
	movs r0, #2
	bl EnableBgSync
	add sp, #8
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08050DA0: .4byte gBg1Tm

	thumb_func_start SpellFx_RegisterObjGfx
SpellFx_RegisterObjGfx: @ 0x08050DA4
	push {r4, r5, r6, lr}
	adds r6, r1, #0
	ldr r5, _08050DC4 @ =0x06010800
	ldr r4, _08050DC8 @ =0x0201A784
	adds r1, r4, #0
	bl LZ77UnCompWram
	adds r0, r4, #0
	adds r1, r5, #0
	adds r2, r6, #0
	bl RegisterDataMove
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08050DC4: .4byte 0x06010800
_08050DC8: .4byte 0x0201A784

	thumb_func_start SpellFx_RegisterObjPal
SpellFx_RegisterObjPal: @ 0x08050DCC
	push {lr}
	adds r2, r1, #0
	ldr r1, _08050DE4 @ =gPal + 0x240
	lsls r2, r2, #9
	lsrs r2, r2, #0xb
	bl CpuFastSet
	bl EnablePalSync
	pop {r0}
	bx r0
	.align 2, 0
_08050DE4: .4byte gPal + 0x240

	thumb_func_start SpellFx_RegisterBgGfx
SpellFx_RegisterBgGfx: @ 0x08050DE8
	push {r4, r5, r6, lr}
	adds r6, r1, #0
	ldr r5, _08050E08 @ =0x06002000
	ldr r4, _08050E0C @ =0x02017784
	adds r1, r4, #0
	bl LZ77UnCompWram
	adds r0, r4, #0
	adds r1, r5, #0
	adds r2, r6, #0
	bl RegisterDataMove
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08050E08: .4byte 0x06002000
_08050E0C: .4byte 0x02017784

	thumb_func_start SpellFx_RegisterBgPal
SpellFx_RegisterBgPal: @ 0x08050E10
	push {lr}
	adds r2, r1, #0
	ldr r1, _08050E28 @ =gPal + 0x20
	lsls r2, r2, #9
	lsrs r2, r2, #0xb
	bl CpuFastSet
	bl EnablePalSync
	pop {r0}
	bx r0
	.align 2, 0
_08050E28: .4byte gPal + 0x20

	thumb_func_start sub_08050E2C
sub_08050E2C: @ 0x08050E2C
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	adds r5, r3, #0
	ldr r4, [sp, #0x10]
	movs r3, #0
	cmp r3, r4
	bhs _08050E52
_08050E3A:
	cmp r2, r5
	blo _08050E40
	movs r2, #0
_08050E40:
	lsls r0, r2, #1
	adds r0, r0, r6
	ldrh r0, [r0]
	strh r0, [r1]
	adds r1, #2
	adds r3, #1
	adds r2, #1
	cmp r3, r4
	blo _08050E3A
_08050E52:
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	thumb_func_start sub_08050E58
sub_08050E58: @ 0x08050E58
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	adds r5, r3, #0
	ldr r4, [sp, #0x10]
	movs r3, #0
	cmp r3, r4
	bhs _08050E7E
_08050E66:
	cmp r2, r5
	blo _08050E6C
	movs r2, #0
_08050E6C:
	lsls r0, r2, #1
	adds r0, r0, r6
	ldrh r0, [r0]
	strh r0, [r1, #0x20]
	adds r1, #2
	adds r3, #1
	adds r2, #1
	cmp r3, r4
	blo _08050E66
_08050E7E:
	bl EnablePalSync
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	thumb_func_start sub_08050E88
sub_08050E88: @ 0x08050E88
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	adds r5, r3, #0
	ldr r4, [sp, #0x10]
	movs r3, #0
	cmp r3, r4
	bhs _08050EB4
	movs r0, #0x90
	lsls r0, r0, #2
	adds r1, r1, r0
_08050E9C:
	cmp r2, r5
	blo _08050EA2
	movs r2, #0
_08050EA2:
	lsls r0, r2, #1
	adds r0, r0, r6
	ldrh r0, [r0]
	strh r0, [r1]
	adds r1, #2
	adds r3, #1
	adds r2, #1
	cmp r3, r4
	blo _08050E9C
_08050EB4:
	bl EnablePalSync
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start EfxAdvanceFrameLut
EfxAdvanceFrameLut: @ 0x08050EC0
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	adds r3, r1, #0
	ldrh r0, [r5]
	adds r6, r0, #0
	cmp r6, #0
	bne _08050F38
	ldrh r0, [r3]
	mov ip, r0
	lsls r0, r0, #2
	adds r0, r0, r2
	ldrh r4, [r0]
	movs r7, #0
	ldrsh r1, [r0, r7]
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	beq _08050EFC
	movs r0, #6
	rsbs r0, r0, #0
	cmp r1, r0
	beq _08050EFC
	movs r0, #5
	rsbs r0, r0, #0
	cmp r1, r0
	beq _08050EFC
	movs r0, #4
	rsbs r0, r0, #0
	cmp r1, r0
	bne _08050F00
_08050EFC:
	adds r0, r1, #0
	b _08050F40
_08050F00:
	movs r0, #2
	rsbs r0, r0, #0
	cmp r1, r0
	bne _08050F0E
	strh r6, [r3]
	ldrh r4, [r2]
	b _08050F22
_08050F0E:
	movs r0, #3
	rsbs r0, r0, #0
	cmp r1, r0
	bne _08050F22
	mov r0, ip
	subs r0, #1
	strh r0, [r3]
	lsls r0, r0, #2
	adds r0, r0, r2
	ldrh r4, [r0]
_08050F22:
	ldrh r1, [r3]
	lsls r0, r1, #2
	adds r0, r0, r2
	ldrh r0, [r0, #2]
	adds r1, #1
	strh r1, [r3]
	subs r0, #1
	strh r0, [r5]
	lsls r0, r4, #0x10
	asrs r0, r0, #0x10
	b _08050F40
_08050F38:
	subs r0, #1
	strh r0, [r5]
	movs r0, #7
	rsbs r0, r0, #0
_08050F40:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_08050F48
sub_08050F48: @ 0x08050F48
	ldr r1, _08050F50 @ =0x0201775C
	movs r0, #1
	str r0, [r1]
	bx lr
	.align 2, 0
_08050F50: .4byte 0x0201775C

	thumb_func_start EfxGetCamMovDuration
EfxGetCamMovDuration: @ 0x08050F54
	ldr r0, _08050F64 @ =gEkrDistanceType
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #2
	bne _08050F68
	movs r0, #0x18
	b _08050F72
	.align 2, 0
_08050F64: .4byte gEkrDistanceType
_08050F68:
	cmp r0, #1
	beq _08050F70
	movs r0, #0
	b _08050F72
_08050F70:
	movs r0, #0x10
_08050F72:
	bx lr

	thumb_func_start sub_08050F74
sub_08050F74: @ 0x08050F74
	push {lr}
	sub sp, #4
	ldr r1, _08050F8C @ =0x0201C8C4
	str r0, [sp]
	ldr r2, _08050F90 @ =0x050002D6
	mov r0, sp
	bl CpuSet
	add sp, #4
	pop {r0}
	bx r0
	.align 2, 0
_08050F8C: .4byte 0x0201C8C4
_08050F90: .4byte 0x050002D6

	thumb_func_start EfxTmFill
EfxTmFill: @ 0x08050F94
	push {lr}
	sub sp, #4
	ldr r1, _08050FAC @ =gEfxFrameTmap
	str r0, [sp]
	ldr r2, _08050FB0 @ =0x05000948
	mov r0, sp
	bl CpuSet
	add sp, #4
	pop {r0}
	bx r0
	.align 2, 0
_08050FAC: .4byte gEfxFrameTmap
_08050FB0: .4byte 0x05000948

	thumb_func_start SetEkrFrontAnimPostion
SetEkrFrontAnimPostion: @ 0x08050FB4
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	cmp r0, #0
	bne _08050FD0
	ldr r0, _08050FCC @ =gAnims
	ldr r3, [r0]
	strh r1, [r3, #2]
	strh r2, [r3, #4]
	ldr r3, [r0, #4]
	b _08050FDA
	.align 2, 0
_08050FCC: .4byte gAnims
_08050FD0:
	ldr r0, _08050FE0 @ =gAnims
	ldr r3, [r0, #8]
	strh r1, [r3, #2]
	strh r2, [r3, #4]
	ldr r3, [r0, #0xc]
_08050FDA:
	strh r1, [r3, #2]
	strh r2, [r3, #4]
	bx lr
	.align 2, 0
_08050FE0: .4byte gAnims

	thumb_func_start sub_08050FE4
sub_08050FE4: @ 0x08050FE4
	ldr r0, _08050FEC @ =0x0201FABC
	ldr r0, [r0]
	bx lr
	.align 2, 0
_08050FEC: .4byte 0x0201FABC

	thumb_func_start sub_08050FF0
sub_08050FF0: @ 0x08050FF0
	ldr r1, _08050FF8 @ =0x0201FABC
	str r0, [r1]
	bx lr
	.align 2, 0
_08050FF8: .4byte 0x0201FABC

	thumb_func_start NewEfxspdquake
NewEfxspdquake: @ 0x08050FFC
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08051018 @ =gUnk_08C0A330
	movs r1, #1
	bl Proc_Start
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	ldr r1, _0805101C @ =gEfxQuakeVecs
	str r1, [r0, #0x44]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08051018: .4byte gUnk_08C0A330
_0805101C: .4byte gEfxQuakeVecs

	thumb_func_start sub_08051020
sub_08051020: @ 0x08051020
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	adds r7, r0, #0
	ldr r0, [r7, #0x44]
	mov r8, r0
	movs r1, #0x2c
	ldrsh r0, [r7, r1]
	lsls r0, r0, #2
	add r0, r8
	ldrh r4, [r0, #2]
	ldr r3, _080510A4 @ =gAnims
	ldr r6, [r3]
	ldrh r2, [r0]
	mov ip, r2
	movs r5, #0
	ldrsh r2, [r0, r5]
	ldrh r1, [r6, #2]
	adds r0, r1, r2
	movs r5, #0
	mov sb, r5
	strh r0, [r6, #2]
	lsls r1, r4, #0x10
	asrs r1, r1, #0x10
	ldrh r5, [r6, #4]
	adds r0, r5, r1
	strh r0, [r6, #4]
	ldr r6, [r3, #4]
	ldrh r5, [r6, #2]
	adds r0, r5, r2
	strh r0, [r6, #2]
	ldrh r5, [r6, #4]
	adds r0, r5, r1
	strh r0, [r6, #4]
	ldr r6, [r3, #8]
	ldrh r5, [r6, #2]
	adds r0, r5, r2
	strh r0, [r6, #2]
	ldrh r5, [r6, #4]
	adds r0, r5, r1
	strh r0, [r6, #4]
	ldr r6, [r3, #0xc]
	ldrh r0, [r6, #2]
	adds r2, r0, r2
	strh r2, [r6, #2]
	ldrh r2, [r6, #4]
	adds r1, r2, r1
	strh r1, [r6, #4]
	ldr r0, _080510A8 @ =gDispIo
	ldrh r1, [r0, #0x26]
	mov r2, ip
	subs r5, r1, r2
	strh r5, [r0, #0x26]
	ldrh r5, [r0, #0x24]
	subs r4, r5, r4
	strh r4, [r0, #0x24]
	bl sub_08050FE4
	cmp r0, #0
	bne _080510AC
	adds r0, r7, #0
	bl Proc_Break
	b _080510E2
	.align 2, 0
_080510A4: .4byte gAnims
_080510A8: .4byte gDispIo
_080510AC:
	bl sub_08050FE4
	cmp r0, #2
	bne _080510C8
	ldr r0, _080510C4 @ =gUnk_081DDC2A
	str r0, [r7, #0x44]
	mov r0, sb
	strh r0, [r7, #0x2c]
	movs r0, #3
	bl sub_08050FF0
	b _080510E2
	.align 2, 0
_080510C4: .4byte gUnk_081DDC2A
_080510C8:
	ldrh r0, [r7, #0x2c]
	adds r0, #1
	strh r0, [r7, #0x2c]
	movs r1, #0x2c
	ldrsh r0, [r7, r1]
	lsls r0, r0, #2
	add r0, r8
	ldr r1, _080510F0 @ =0x00007FFF
	ldrh r0, [r0]
	cmp r0, r1
	bne _080510E2
	mov r2, sb
	strh r2, [r7, #0x2c]
_080510E2:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080510F0: .4byte 0x00007FFF

	thumb_func_start sub_080510F4
sub_080510F4: @ 0x080510F4
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	ldr r2, _08051144 @ =gEkrXPosReal
	movs r0, #0
	ldrsh r1, [r2, r0]
	ldr r6, _08051148 @ =gEkrBgPosition
	ldr r0, [r6]
	subs r1, r1, r0
	ldr r3, _0805114C @ =gEkrYPosReal
	movs r5, #2
	ldrsh r4, [r2, r5]
	subs r4, r4, r0
	movs r0, #2
	ldrsh r5, [r3, r0]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	movs r0, #0
	ldrsh r2, [r3, r0]
	movs r0, #0
	bl SetEkrFrontAnimPostion
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	movs r0, #1
	adds r1, r4, #0
	adds r2, r5, #0
	bl SetEkrFrontAnimPostion
	ldr r0, _08051150 @ =gEkrDistanceType
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	bne _08051154
	movs r0, #2
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	b _08051162
	.align 2, 0
_08051144: .4byte gEkrXPosReal
_08051148: .4byte gEkrBgPosition
_0805114C: .4byte gEkrYPosReal
_08051150: .4byte gEkrDistanceType
_08051154:
	cmp r0, #0
	blt _08051162
	cmp r0, #2
	bgt _08051162
	ldr r0, [r6]
	bl sub_0804EEB8
_08051162:
	adds r0, r7, #0
	bl Proc_Break
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
