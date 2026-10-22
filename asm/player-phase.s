	.include "macro.inc"
	.syntax unified

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
	ldr r0, _0801D038 @ =gBmMapRange
	ldr r0, [r0]
	movs r1, #0
	bl BmMapFill
	ldr r0, [r5]
	bl UnitBeginCantoAction
	ldr r2, [r5]
	ldr r0, [r2, #0xc]
	movs r1, #0x40
	orrs r0, r1
	subs r1, #0x43
	ands r0, r1
	str r0, [r2, #0xc]
	bl EndAllMus
	ldr r0, [r5]
	bl StartMu
	bl MU_SetDefaultFacing_Auto
	ldr r0, _0801D03C @ =gPlaySt
	ldrb r0, [r0, #0xd]
	cmp r0, #0
	beq _0801D040
	adds r0, r6, #0
	movs r1, #4
	bl Proc_Goto
	b _0801D048
	.align 2, 0
_0801D038: .4byte gBmMapRange
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
	bl CheckForWaitEvents
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0801D060
	movs r0, #1
	b _0801D066
_0801D060:
	bl RunWaitEvents
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
	bl EnsureCameraOntoPosition
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
	bl SetMapCursorPosition
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
	bl EndAllMus
	bl RefreshEntityMaps
	bl RenderMap
	bl RefreshUnitSprites
	bl sub_807978C
	adds r0, r5, #0
	movs r1, #8
	bl Proc_Goto
	b _0801D14C
_0801D148:
	bl EndAllMus
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
	bl EndAllMus
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

	thumb_func_start GetPlayerSelectKind
GetPlayerSelectKind: @ 0x0801D270
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

	thumb_func_start CanMoveActiveUnitTo
CanMoveActiveUnitTo: @ 0x0801D2F8
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
	ldr r0, _0801D398 @ =gWorkingMoveScr
	bl sub_806C7F8
	pop {r0}
	bx r0
	.align 2, 0
_0801D394: .4byte gActiveUnit
_0801D398: .4byte gWorkingMoveScr

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
	bl RefreshBMapGraphics
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
	bl RefreshBMapGraphics
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
	bl GetPlayerSelectKind
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
	bl RefreshBMapGraphics
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

	thumb_func_start DisplayMoveRangeGraphics
DisplayMoveRangeGraphics: @ 0x0801D6A4
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

	thumb_func_start HideMoveRangeGraphics
HideMoveRangeGraphics: @ 0x0801D6D8
	push {lr}
	ldr r0, _0801D6E4 @ =gUnk_08C02870
	bl Proc_EndEach
	pop {r0}
	bx r0
	.align 2, 0
_0801D6E4: .4byte gUnk_08C02870

	thumb_func_start TrySetCursorOn
TrySetCursorOn: @ 0x0801D6E8
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
	ldr r0, _0801D750 @ =ProcScr_PlayerPhase
	bl Proc_Find
	cmp r0, #0
	bne _0801D730
	ldr r0, _0801D754 @ =ProcScr_SALLYCURSOR
	bl Proc_Find
_0801D730:
	movs r1, #0x10
	ldrsb r1, [r4, r1]
	movs r2, #0x11
	ldrsb r2, [r4, r2]
	bl EnsureCameraOntoPosition
	movs r0, #0x10
	ldrsb r0, [r4, r0]
	movs r1, #0x11
	ldrsb r1, [r4, r1]
	bl SetMapCursorPosition
	movs r0, #1
_0801D74A:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0801D750: .4byte ProcScr_PlayerPhase
_0801D754: .4byte ProcScr_SALLYCURSOR

	thumb_func_start TrySwitchViewedUnit
TrySwitchViewedUnit: @ 0x0801D758
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
	bl TrySetCursorOn
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
	bl TrySetCursorOn
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
