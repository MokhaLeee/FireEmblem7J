	.include "macro.inc"
	.syntax unified

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
	bl MoveLimitView_OnInit
	movs r0, #0
	bl MoveLimitViewChange_OnInit
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
