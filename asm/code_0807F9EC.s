	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_807F9EC
sub_807F9EC: @ 0x0807F9EC
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r3, _0807FA54 @ =gDispIo
	adds r2, r3, #0
	adds r2, #0x3c
	movs r0, #0x3f
	ldrb r1, [r2]
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r2]
	adds r1, r3, #0
	adds r1, #0x44
	movs r4, #0
	movs r0, #0x10
	strb r0, [r1]
	adds r0, r3, #0
	adds r0, #0x45
	strb r4, [r0]
	adds r0, #1
	strb r4, [r0]
	ldr r0, _0807FA58 @ =0x0000FFE0
	ldrh r2, [r3, #0x3c]
	ands r0, r2
	ldr r1, _0807FA5C @ =0x0000E0FF
	ands r0, r1
	movs r2, #0xf8
	lsls r2, r2, #5
	adds r1, r2, #0
	orrs r0, r1
	strh r0, [r3, #0x3c]
	movs r0, #1
	bl sub_807F590
	movs r0, #2
	bl sub_807F590
	adds r5, #0x4c
	strh r4, [r5]
	ldr r0, _0807FA60 @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0807FA4C
	movs r0, #0xe5
	bl m4aSongNumStart
_0807FA4C:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0807FA54: .4byte gDispIo
_0807FA58: .4byte 0x0000FFE0
_0807FA5C: .4byte 0x0000E0FF
_0807FA60: .4byte gPlaySt

	thumb_func_start sub_807FA64
sub_807FA64: @ 0x0807FA64
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	mov sb, r0
	adds r0, #0x4c
	ldrh r1, [r0]
	adds r2, r1, #1
	strh r2, [r0]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x12
	lsls r3, r1, #1
	cmp r3, #0x10
	ble _0807FA84
	movs r3, #0x10
_0807FA84:
	ldr r2, _0807FAE4 @ =gDispIo
	adds r5, r2, #0
	adds r5, #0x3c
	movs r0, #0x3f
	mov sl, r0
	ldrb r4, [r5]
	ands r0, r4
	strb r0, [r5]
	movs r0, #0x10
	subs r0, r0, r1
	movs r6, #0x44
	adds r6, r6, r2
	mov r8, r6
	movs r4, #0
	strb r0, [r6]
	adds r7, r2, #0
	adds r7, #0x45
	strb r3, [r7]
	adds r6, r2, #0
	adds r6, #0x46
	strb r4, [r6]
	cmp r1, #0x10
	bne _0807FAD4
	movs r0, #1
	bl RemoveFireDragonSpritefx
	movs r0, #2
	bl RemoveFireDragonSpritefx
	mov r0, sl
	ldrb r1, [r5]
	ands r0, r1
	strb r0, [r5]
	mov r0, r8
	strb r4, [r0]
	strb r4, [r7]
	strb r4, [r6]
	mov r0, sb
	bl Proc_Break
_0807FAD4:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0807FAE4: .4byte gDispIo

	thumb_func_start sub_807FAE8
sub_807FAE8: @ 0x0807FAE8
	push {lr}
	adds r1, r0, #0
	ldr r0, _0807FAF8 @ =gUnk_08D87F68
	bl Proc_StartBlocking
	pop {r0}
	bx r0
	.align 2, 0
_0807FAF8: .4byte gUnk_08D87F68

	thumb_func_start ForceCenteredDragon
ForceCenteredDragon: @ 0x0807FAFC
	push {r4, r5, lr}
	adds r5, r0, #0
	movs r0, #0x86
	bl GetUnitFromCharId
	adds r4, r0, #0
	movs r0, #0x91
	bl SetFlag
	adds r0, r4, #0
	movs r1, #1
	bl SetUnitHp
	ldr r0, [r4, #0xc]
	movs r1, #7
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r4, #0xc]
	movs r1, #0x10
	ldrsb r1, [r4, r1]
	movs r2, #0x11
	ldrsb r2, [r4, r2]
	adds r0, r5, #0
	bl EnsureCameraOntoCenteredPosition
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start sub_807FB34
sub_807FB34: @ 0x0807FB34
	push {lr}
	bl sub_807AA5C
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_807FB40
sub_807FB40: @ 0x0807FB40
	ldr r0, _0807FB50 @ =gpKeySt
	ldr r1, [r0]
	movs r0, #8
	ldrb r1, [r1, #4]
	ands r0, r1
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bx lr
	.align 2, 0
_0807FB50: .4byte gpKeySt

	thumb_func_start sub_807FB54
sub_807FB54: @ 0x0807FB54
	ldr r0, _0807FB64 @ =gpKeySt
	ldr r1, [r0]
	movs r0, #4
	ldrb r1, [r1, #4]
	ands r0, r1
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bx lr
	.align 2, 0
_0807FB64: .4byte gpKeySt

	thumb_func_start sub_807FB68
sub_807FB68: @ 0x0807FB68
	movs r0, #0
	bx lr

	thumb_func_start sub_807FB6C
sub_807FB6C: @ 0x0807FB6C
	ldr r0, _0807FB7C @ =gpKeySt
	ldr r1, [r0]
	movs r0, #2
	ldrb r1, [r1, #4]
	ands r0, r1
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bx lr
	.align 2, 0
_0807FB7C: .4byte gpKeySt

	thumb_func_start sub_807FB80
sub_807FB80: @ 0x0807FB80
	push {lr}
	ldr r0, _0807FB90 @ =0x03005A30
	ldr r1, _0807FB94 @ =0x0000FFFF
	movs r2, #0x20
	bl MPlayVolumeControl
	pop {r0}
	bx r0
	.align 2, 0
_0807FB90: .4byte 0x03005A30
_0807FB94: .4byte 0x0000FFFF

	thumb_func_start sub_807FB98
sub_807FB98: @ 0x0807FB98
	push {lr}
	ldr r0, _0807FBA8 @ =0x03005CC0
	ldr r1, _0807FBAC @ =0x0000FFFF
	movs r2, #0x20
	bl MPlayVolumeControl
	pop {r0}
	bx r0
	.align 2, 0
_0807FBA8: .4byte 0x03005CC0
_0807FBAC: .4byte 0x0000FFFF

	thumb_func_start sub_807FBB0
sub_807FBB0: @ 0x0807FBB0
	push {lr}
	ldr r0, _0807FBC4 @ =0x03005A30
	ldr r1, _0807FBC8 @ =0x0000FFFF
	movs r2, #0x80
	lsls r2, r2, #1
	bl MPlayVolumeControl
	pop {r0}
	bx r0
	.align 2, 0
_0807FBC4: .4byte 0x03005A30
_0807FBC8: .4byte 0x0000FFFF

	thumb_func_start sub_807FBCC
sub_807FBCC: @ 0x0807FBCC
	push {lr}
	ldr r0, _0807FBE0 @ =0x03005CC0
	ldr r1, _0807FBE4 @ =0x0000FFFF
	movs r2, #0x80
	lsls r2, r2, #1
	bl MPlayVolumeControl
	pop {r0}
	bx r0
	.align 2, 0
_0807FBE0: .4byte 0x03005CC0
_0807FBE4: .4byte 0x0000FFFF

	thumb_func_start sub_807FBE8
sub_807FBE8: @ 0x0807FBE8
	ldr r0, _0807FBFC @ =gpKeySt
	ldr r1, [r0]
	movs r0, #1
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	bne _0807FC00
	movs r0, #1
	b _0807FC02
	.align 2, 0
_0807FBFC: .4byte gpKeySt
_0807FC00:
	movs r0, #0
_0807FC02:
	bx lr

	thumb_func_start GetLynModeDeathFlag
GetLynModeDeathFlag: @ 0x0807FC04
	push {lr}
	movs r0, #0x9d
	bl CheckFlag
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	pop {r1}
	bx r1

	thumb_func_start SetLynModeDeathFlag
SetLynModeDeathFlag: @ 0x0807FC14
	push {lr}
	movs r0, #0x9d
	bl SetFlag
	pop {r0}
	bx r0

	thumb_func_start sub_807FC20
sub_807FC20: @ 0x0807FC20
	push {lr}
	movs r0, #8
	bl GetUnitFromCharId
	movs r2, #0
	movs r1, #0xc0
	ldrb r0, [r0, #0xb]
	ands r1, r0
	cmp r1, #0
	bne _0807FC36
	movs r2, #1
_0807FC36:
	adds r0, r2, #0
	pop {r1}
	bx r1

	thumb_func_start sub_807FC3C
sub_807FC3C: @ 0x0807FC3C
	push {lr}
	movs r0, #0x11
	bl GetUnitFromCharId
	movs r2, #0
	movs r1, #0xc0
	ldrb r0, [r0, #0xb]
	ands r1, r0
	cmp r1, #0
	bne _0807FC52
	movs r2, #1
_0807FC52:
	adds r0, r2, #0
	pop {r1}
	bx r1

	thumb_func_start sub_807FC58
sub_807FC58: @ 0x0807FC58
	push {lr}
	movs r0, #0x13
	bl GetUnitFromCharId
	movs r2, #0
	movs r1, #0xc0
	ldrb r0, [r0, #0xb]
	ands r1, r0
	cmp r1, #0
	bne _0807FC6E
	movs r2, #1
_0807FC6E:
	adds r0, r2, #0
	pop {r1}
	bx r1

	thumb_func_start sub_807FC74
sub_807FC74: @ 0x0807FC74
	movs r1, #0
	ldr r0, _0807FC84 @ =gPlaySt
	ldrb r0, [r0, #0xe]
	cmp r0, #4
	bne _0807FC80
	movs r1, #1
_0807FC80:
	adds r0, r1, #0
	bx lr
	.align 2, 0
_0807FC84: .4byte gPlaySt

	thumb_func_start sub_807FC88
sub_807FC88: @ 0x0807FC88
	movs r1, #0
	ldr r0, _0807FC98 @ =gPlaySt
	ldrb r0, [r0, #0xe]
	cmp r0, #5
	bne _0807FC94
	movs r1, #1
_0807FC94:
	adds r0, r1, #0
	bx lr
	.align 2, 0
_0807FC98: .4byte gPlaySt

	thumb_func_start sub_807FC9C
sub_807FC9C: @ 0x0807FC9C
	movs r1, #0
	ldr r0, _0807FCAC @ =gPlaySt
	ldrb r0, [r0, #0xe]
	cmp r0, #6
	bne _0807FCA8
	movs r1, #1
_0807FCA8:
	adds r0, r1, #0
	bx lr
	.align 2, 0
_0807FCAC: .4byte gPlaySt

	thumb_func_start sub_807FCB0
sub_807FCB0: @ 0x0807FCB0
	movs r1, #0
	ldr r0, _0807FCC0 @ =gPlaySt
	ldrb r0, [r0, #0xe]
	cmp r0, #0x26
	bne _0807FCBC
	movs r1, #1
_0807FCBC:
	adds r0, r1, #0
	bx lr
	.align 2, 0
_0807FCC0: .4byte gPlaySt

	thumb_func_start sub_807FCC4
sub_807FCC4: @ 0x0807FCC4
	ldr r0, _0807FCF0 @ =gBattleActor
	ldr r0, [r0]
	ldrb r1, [r0, #4]
	ldr r0, _0807FCF4 @ =gBattleTarget
	ldr r0, [r0]
	ldrb r2, [r0, #4]
	subs r0, r1, #1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #1
	bls _0807FCEC
	cmp r1, #0x2d
	beq _0807FCEC
	subs r0, r2, #1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #1
	bls _0807FCEC
	cmp r2, #0x2d
	bne _0807FCF8
_0807FCEC:
	movs r0, #1
	b _0807FCFA
	.align 2, 0
_0807FCF0: .4byte gBattleActor
_0807FCF4: .4byte gBattleTarget
_0807FCF8:
	movs r0, #0
_0807FCFA:
	bx lr

	thumb_func_start sub_807FCFC
sub_807FCFC: @ 0x0807FCFC
	push {lr}
	movs r0, #0x14
	bl GetUnitFromCharId
	movs r2, #0
	movs r1, #0xc0
	ldrb r0, [r0, #0xb]
	ands r1, r0
	cmp r1, #0
	bne _0807FD12
	movs r2, #1
_0807FD12:
	adds r0, r2, #0
	pop {r1}
	bx r1

	thumb_func_start sub_807FD18
sub_807FD18: @ 0x0807FD18
	push {lr}
	movs r0, #0x32
	bl GetUnitFromCharId
	movs r2, #0
	movs r1, #0xc0
	ldrb r0, [r0, #0xb]
	ands r1, r0
	cmp r1, #0
	bne _0807FD2E
	movs r2, #1
_0807FD2E:
	adds r0, r2, #0
	pop {r1}
	bx r1

	thumb_func_start sub_807FD34
sub_807FD34: @ 0x0807FD34
	ldr r0, _0807FD4C @ =gBattleActor
	ldr r1, [r0]
	ldr r0, _0807FD50 @ =gBattleTarget
	ldr r0, [r0]
	ldrb r0, [r0, #4]
	ldrb r1, [r1, #4]
	cmp r1, #2
	beq _0807FD48
	cmp r0, #2
	bne _0807FD54
_0807FD48:
	movs r0, #1
	b _0807FD56
	.align 2, 0
_0807FD4C: .4byte gBattleActor
_0807FD50: .4byte gBattleTarget
_0807FD54:
	movs r0, #0
_0807FD56:
	bx lr

	thumb_func_start sub_807FD58
sub_807FD58: @ 0x0807FD58
	push {r4, lr}
	bl sub_8017574
	adds r4, r0, #0
	ldr r0, _0807FD7C @ =0x0000752F
	cmp r4, r0
	ble _0807FD84
	movs r0, #0x85
	bl SetFlag
	ldr r0, _0807FD80 @ =0x000080E7
	cmp r4, r0
	ble _0807FD90
	movs r0, #0x84
	bl SetFlag
	b _0807FD90
	.align 2, 0
_0807FD7C: .4byte 0x0000752F
_0807FD80: .4byte 0x000080E7
_0807FD84:
	ldr r0, _0807FD98 @ =0x00004E1F
	cmp r4, r0
	ble _0807FD90
	movs r0, #0x84
	bl SetFlag
_0807FD90:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0807FD98: .4byte 0x00004E1F

	thumb_func_start sub_807FD9C
sub_807FD9C: @ 0x0807FD9C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	movs r7, #0
	movs r6, #1
	ldr r0, _0807FDE4 @ =gPlaySt
	bl RegisterChapterStats
	bl sub_80B7880
	bl sub_80A0054
	bl sub_807FD58
	movs r5, #1
_0807FDBA:
	adds r0, r5, #0
	bl GetUnit
	adds r4, r0, #0
	adds r5, #1
	mov r8, r5
	cmp r4, #0
	beq _0807FE64
	ldr r0, [r4]
	cmp r0, #0
	beq _0807FE64
	adds r0, r4, #0
	bl UnitLoadSupports
	ldr r5, _0807FDE8 @ =gUnk_08D68388
	ldrb r2, [r5]
	adds r1, r2, #0
	cmp r1, #0
	beq _0807FE64
	ldr r0, [r4]
	b _0807FE52
	.align 2, 0
_0807FDE4: .4byte gPlaySt
_0807FDE8: .4byte gUnk_08D68388
_0807FDEC:
	ldrb r0, [r5, #1]
	cmp r0, r2
	beq _0807FDFA
	ldrb r0, [r5, #1]
	bl GetCharacterData
	str r0, [r4]
_0807FDFA:
	ldr r0, [r4, #0xc]
	ldr r1, _0807FE20 @ =0x00010008
	orrs r0, r1
	str r0, [r4, #0xc]
	adds r0, r4, #0
	bl UnitClearInventory
	ldr r0, [r5, #4]
	cmp r0, #0
	beq _0807FE12
	bl ClearFlag
_0807FE12:
	ldr r0, [r4, #0xc]
	movs r1, #4
	ands r0, r1
	cmp r0, #0
	beq _0807FE26
	b _0807FE40
	.align 2, 0
_0807FE20: .4byte 0x00010008
_0807FE24:
	adds r6, #1
_0807FE26:
	cmp r6, #0x3f
	bgt _0807FE38
	adds r0, r6, #0
	bl GetUnit
	adds r7, r0, #0
	ldr r0, [r7]
	cmp r0, #0
	bne _0807FE24
_0807FE38:
	adds r0, r4, #0
	adds r1, r7, #0
	bl CopyUnit
_0807FE40:
	adds r0, r4, #0
	bl ClearUnit
	b _0807FE64
_0807FE48:
	adds r5, #8
	ldrb r2, [r5]
	adds r1, r2, #0
	cmp r1, #0
	beq _0807FE64
_0807FE52:
	ldrb r3, [r0, #4]
	cmp r3, r1
	bne _0807FE48
	ldr r0, [r4, #0xc]
	movs r1, #0x80
	lsls r1, r1, #9
	ands r0, r1
	cmp r0, #0
	beq _0807FDEC
_0807FE64:
	mov r5, r8
	cmp r5, #0x3f
	ble _0807FDBA
	bl ClearPidStats_ret
	ldr r1, _0807FE88 @ =gPlaySt
	movs r0, #0xc
	strb r0, [r1, #0xe]
	bl CleanupUnitsBeforeChapter
	bl SavePlayThroughData
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0807FE88: .4byte gPlaySt

	thumb_func_start sub_807FE8C
sub_807FE8C: @ 0x0807FE8C
	push {r4, lr}
	ldr r4, _0807FE9C @ =gPlaySt
	ldrb r0, [r4, #0x1b]
	cmp r0, #2
	beq _0807FEA0
	cmp r0, #3
	beq _0807FEAA
	b _0807FEB4
	.align 2, 0
_0807FE9C: .4byte gPlaySt
_0807FEA0:
	movs r0, #0xc
	bl sub_8013214
	movs r0, #0xc
	b _0807FEB2
_0807FEAA:
	movs r0, #0xd
	bl sub_8013214
	movs r0, #0xd
_0807FEB2:
	strb r0, [r4, #0xe]
_0807FEB4:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_807FEBC
sub_807FEBC: @ 0x0807FEBC
	push {lr}
	ldr r3, _0807FF2C @ =gDispIo
	adds r1, r3, #0
	adds r1, #0x3c
	movs r0, #0xc0
	ldrb r2, [r1]
	orrs r0, r2
	strb r0, [r1]
	adds r0, r3, #0
	adds r0, #0x44
	movs r1, #0
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r1, r3, #0
	adds r1, #0x46
	movs r2, #0x10
	movs r0, #0x10
	strb r0, [r1]
	ldr r0, _0807FF30 @ =0x0000FFE0
	ldrh r1, [r3, #0x3c]
	ands r0, r1
	movs r1, #0x1f
	orrs r0, r1
	strh r0, [r3, #0x3c]
	movs r0, #1
	ldrb r1, [r3, #1]
	orrs r0, r1
	movs r1, #2
	orrs r0, r1
	movs r1, #4
	orrs r0, r1
	movs r1, #8
	orrs r0, r1
	orrs r0, r2
	strb r0, [r3, #1]
	ldr r0, _0807FF34 @ =gUnk_081C8610
	ldr r1, _0807FF38 @ =0x06000800
	bl Decompress
	ldr r0, _0807FF3C @ =gUnk_081C8AF8
	movs r1, #0xa0
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r0, _0807FF40 @ =gBg0Tm
	ldr r1, _0807FF44 @ =gUnk_081C8B18
	ldr r2, _0807FF48 @ =0x00005040
	bl TmApplyTsa_thm
	movs r0, #1
	bl EnableBgSync
	pop {r0}
	bx r0
	.align 2, 0
_0807FF2C: .4byte gDispIo
_0807FF30: .4byte 0x0000FFE0
_0807FF34: .4byte gUnk_081C8610
_0807FF38: .4byte 0x06000800
_0807FF3C: .4byte gUnk_081C8AF8
_0807FF40: .4byte gBg0Tm
_0807FF44: .4byte gUnk_081C8B18
_0807FF48: .4byte 0x00005040

	thumb_func_start sub_807FF4C
sub_807FF4C: @ 0x0807FF4C
	push {lr}
	ldr r0, _0807FF58 @ =gUnk_0840343C
	bl sub_807C66C
	pop {r0}
	bx r0
	.align 2, 0
_0807FF58: .4byte gUnk_0840343C

	thumb_func_start sub_807FF5C
sub_807FF5C: @ 0x0807FF5C
	push {lr}
	ldr r0, _0807FF68 @ =gUnk_08403454
	bl sub_807C66C
	pop {r0}
	bx r0
	.align 2, 0
_0807FF68: .4byte gUnk_08403454

	thumb_func_start sub_807FF6C
sub_807FF6C: @ 0x0807FF6C
	push {lr}
	ldr r0, _0807FF78 @ =gUnk_08403464
	bl sub_807C66C
	pop {r0}
	bx r0
	.align 2, 0
_0807FF78: .4byte gUnk_08403464

	thumb_func_start sub_807FF7C
sub_807FF7C: @ 0x0807FF7C
	push {lr}
	ldr r0, _0807FF88 @ =gUnk_08403474
	bl sub_807C66C
	pop {r0}
	bx r0
	.align 2, 0
_0807FF88: .4byte gUnk_08403474

	thumb_func_start sub_807FF8C
sub_807FF8C: @ 0x0807FF8C
	push {lr}
	ldr r0, _0807FF98 @ =gUnk_0840348C
	bl sub_807C66C
	pop {r0}
	bx r0
	.align 2, 0
_0807FF98: .4byte gUnk_0840348C

	thumb_func_start sub_807FF9C
sub_807FF9C: @ 0x0807FF9C
	ldr r3, _0807FFE0 @ =gDispIo
	movs r1, #4
	rsbs r1, r1, #0
	adds r0, r1, #0
	ldrb r2, [r3, #0xc]
	ands r0, r2
	strb r0, [r3, #0xc]
	movs r0, #3
	ldrb r2, [r3, #0x10]
	orrs r2, r0
	strb r2, [r3, #0x10]
	ldrb r2, [r3, #0x14]
	orrs r0, r2
	strb r0, [r3, #0x14]
	ldrb r0, [r3, #0x18]
	ands r1, r0
	movs r0, #2
	orrs r1, r0
	strb r1, [r3, #0x18]
	movs r0, #1
	ldrb r1, [r3, #1]
	orrs r0, r1
	movs r1, #3
	rsbs r1, r1, #0
	ands r0, r1
	movs r1, #4
	orrs r0, r1
	movs r1, #8
	orrs r0, r1
	movs r1, #0x10
	orrs r0, r1
	strb r0, [r3, #1]
	bx lr
	.align 2, 0
_0807FFE0: .4byte gDispIo

	thumb_func_start sub_807FFE4
sub_807FFE4: @ 0x0807FFE4
	push {r4, r5, r6, r7, lr}
	ldr r7, _08080078 @ =gDispIo
	movs r4, #1
	ldrb r0, [r7, #1]
	orrs r0, r4
	movs r1, #3
	rsbs r1, r1, #0
	ands r0, r1
	movs r6, #4
	orrs r0, r6
	movs r1, #8
	orrs r0, r1
	movs r5, #0x10
	orrs r0, r5
	strb r0, [r7, #1]
	ldr r0, _0808007C @ =0x06008000
	movs r1, #0xc0
	lsls r1, r1, #0x13
	movs r2, #0x80
	lsls r2, r2, #5
	bl CpuFastSet
	ldr r0, _08080080 @ =gBg3Tm
	ldr r1, _08080084 @ =gBg1Tm
	movs r2, #0x80
	lsls r2, r2, #2
	bl CpuFastSet
	movs r0, #2
	bl EnableBgSync
	ldrb r0, [r7, #1]
	orrs r4, r0
	movs r0, #2
	orrs r4, r0
	orrs r4, r6
	movs r0, #9
	rsbs r0, r0, #0
	ands r4, r0
	orrs r4, r5
	strb r4, [r7, #1]
	adds r2, r7, #0
	adds r2, #0x3c
	movs r0, #0x3f
	ldrb r1, [r2]
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r2]
	adds r0, r7, #0
	adds r0, #0x44
	movs r1, #0
	strb r1, [r0]
	adds r2, #9
	movs r0, #0x10
	strb r0, [r2]
	adds r0, r7, #0
	adds r0, #0x46
	strb r1, [r0]
	ldr r0, _08080088 @ =0x0000FFE0
	ldrh r2, [r7, #0x3c]
	ands r0, r2
	movs r1, #8
	orrs r0, r1
	ldr r1, _0808008C @ =0x0000E0FF
	ands r0, r1
	movs r2, #0xf8
	lsls r2, r2, #5
	adds r1, r2, #0
	orrs r0, r1
	strh r0, [r7, #0x3c]
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08080078: .4byte gDispIo
_0808007C: .4byte 0x06008000
_08080080: .4byte gBg3Tm
_08080084: .4byte gBg1Tm
_08080088: .4byte 0x0000FFE0
_0808008C: .4byte 0x0000E0FF

	thumb_func_start sub_8080090
sub_8080090: @ 0x08080090
	push {r4, lr}
	sub sp, #4
	adds r4, r0, #0
	ldr r0, _080800D8 @ =gBg3Tm
	movs r1, #0x80
	lsls r1, r1, #8
	movs r2, #0x2c
	str r2, [sp]
	movs r2, #0
	movs r3, #6
	bl sub_80B7980
	ldr r2, _080800DC @ =gDispIo
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
	movs r0, #8
	bl EnableBgSync
	adds r4, #0x4c
	movs r0, #0
	strh r0, [r4]
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080800D8: .4byte gBg3Tm
_080800DC: .4byte gDispIo

	thumb_func_start sub_80800E0
sub_80800E0: @ 0x080800E0
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r1, r5, #0
	adds r1, #0x4c
	ldrh r2, [r1]
	adds r0, r2, #1
	strh r0, [r1]
	lsls r2, r2, #0x10
	asrs r2, r2, #0x12
	ldr r0, _08080148 @ =gDispIo
	mov ip, r0
	mov r3, ip
	adds r3, #0x3c
	movs r0, #0x3f
	ldrb r1, [r3]
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r3]
	mov r0, ip
	adds r0, #0x44
	movs r1, #0
	strb r2, [r0]
	movs r4, #0x10
	subs r0, r4, r2
	adds r3, #9
	strb r0, [r3]
	mov r0, ip
	adds r0, #0x46
	strb r1, [r0]
	cmp r2, #0x10
	bne _08080140
	movs r0, #1
	mov r2, ip
	ldrb r2, [r2, #1]
	orrs r0, r2
	subs r1, #3
	ands r0, r1
	subs r1, #2
	ands r0, r1
	movs r1, #8
	orrs r0, r1
	orrs r0, r4
	mov r1, ip
	strb r0, [r1, #1]
	adds r0, r5, #0
	bl Proc_Break
_08080140:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08080148: .4byte gDispIo

	thumb_func_start sub_808014C
sub_808014C: @ 0x0808014C
	push {r4, lr}
	ldr r1, _080801C4 @ =gDispIo
	mov ip, r1
	movs r2, #4
	rsbs r2, r2, #0
	adds r1, r2, #0
	mov r3, ip
	ldrb r3, [r3, #0xc]
	ands r1, r3
	mov r4, ip
	strb r1, [r4, #0xc]
	adds r1, r2, #0
	ldrb r3, [r4, #0x10]
	ands r1, r3
	movs r3, #1
	orrs r1, r3
	strb r1, [r4, #0x10]
	ldrb r4, [r4, #0x14]
	ands r2, r4
	movs r1, #2
	orrs r2, r1
	mov r1, ip
	strb r2, [r1, #0x14]
	movs r1, #3
	mov r2, ip
	ldrb r2, [r2, #0x18]
	orrs r1, r2
	mov r3, ip
	strb r1, [r3, #0x18]
	mov r2, ip
	adds r2, #0x3c
	movs r1, #0x3f
	ldrb r4, [r2]
	ands r1, r4
	strb r1, [r2]
	mov r1, ip
	adds r1, #0x44
	movs r2, #0
	strb r2, [r1]
	adds r1, #1
	strb r2, [r1]
	adds r1, #1
	strb r2, [r1]
	bl EndDragonGatefx
	ldr r0, _080801C8 @ =gBg1Tm
	movs r1, #0
	bl TmFill
	ldr r0, _080801CC @ =gBg2Tm
	movs r1, #0
	bl TmFill
	movs r0, #6
	bl EnableBgSync
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080801C4: .4byte gDispIo
_080801C8: .4byte gBg1Tm
_080801CC: .4byte gBg2Tm

	thumb_func_start sub_80801D0
sub_80801D0: @ 0x080801D0
	push {lr}
	sub sp, #4
	ldr r0, _0808020C @ =gBg3Tm
	movs r1, #0x80
	lsls r1, r1, #8
	movs r2, #0x2c
	str r2, [sp]
	movs r2, #8
	movs r3, #6
	bl sub_80B7980
	movs r0, #8
	bl EnableBgSync
	ldr r2, _08080210 @ =gDispIo
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
	add sp, #4
	pop {r0}
	bx r0
	.align 2, 0
_0808020C: .4byte gBg3Tm
_08080210: .4byte gDispIo

	thumb_func_start sub_8080214
sub_8080214: @ 0x08080214
	push {lr}
	adds r1, r0, #0
	ldr r0, _08080224 @ =gUnk_08D8977C
	bl Proc_StartBlocking
	pop {r0}
	bx r0
	.align 2, 0
_08080224: .4byte gUnk_08D8977C

	thumb_func_start sub_8080228
sub_8080228: @ 0x08080228
	push {r4, lr}
	sub sp, #4
	ldr r4, _080802B4 @ =gDispIo
	movs r2, #4
	rsbs r2, r2, #0
	adds r0, r2, #0
	ldrb r1, [r4, #0xc]
	ands r0, r1
	strb r0, [r4, #0xc]
	adds r0, r2, #0
	ldrb r1, [r4, #0x10]
	ands r0, r1
	movs r1, #1
	orrs r0, r1
	strb r0, [r4, #0x10]
	movs r0, #3
	ldrb r1, [r4, #0x14]
	orrs r0, r1
	strb r0, [r4, #0x14]
	ldrb r0, [r4, #0x18]
	ands r2, r0
	movs r0, #2
	orrs r2, r0
	strb r2, [r4, #0x18]
	ldr r0, _080802B8 @ =gBg0Tm
	movs r1, #0x80
	lsls r1, r1, #4
	movs r2, #0x2c
	str r2, [sp]
	movs r2, #0
	movs r3, #6
	bl sub_80B7980
	movs r0, #1
	bl EnableBgSync
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
	movs r2, #0
	movs r0, #0x10
	strb r0, [r1]
	adds r0, r4, #0
	adds r0, #0x45
	strb r2, [r0]
	adds r0, #1
	strb r2, [r0]
	ldr r0, _080802BC @ =0x0000FFE0
	ldrh r2, [r4, #0x3c]
	ands r0, r2
	movs r1, #1
	orrs r0, r1
	ldr r1, _080802C0 @ =0x0000E0FF
	ands r0, r1
	movs r2, #0xf8
	lsls r2, r2, #5
	adds r1, r2, #0
	orrs r0, r1
	strh r0, [r4, #0x3c]
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080802B4: .4byte gDispIo
_080802B8: .4byte gBg0Tm
_080802BC: .4byte 0x0000FFE0
_080802C0: .4byte 0x0000E0FF

	thumb_func_start sub_80802C4
sub_80802C4: @ 0x080802C4
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r0, _08080324 @ =gUnk_0818BC3C
	movs r1, #0xe0
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r0, _08080328 @ =gUnk_0818B408
	ldr r1, _0808032C @ =0x06005800
	bl Decompress
	ldr r0, _08080330 @ =gBg2Tm
	ldr r1, _08080334 @ =gUnk_0818B760
	ldr r2, _08080338 @ =0x000072C0
	bl TmApplyTsa_thm
	ldr r4, _0808033C @ =gUnk_08187B5C
	movs r0, #3
	bl GetBgChrOffset
	adds r1, r0, #0
	movs r0, #0xc0
	lsls r0, r0, #0x13
	adds r1, r1, r0
	adds r0, r4, #0
	bl Decompress
	ldr r0, _08080340 @ =gBg3Tm
	ldr r1, _08080344 @ =gUnk_0818AE2C
	movs r2, #0x80
	lsls r2, r2, #8
	bl TmApplyTsa_thm
	ldr r0, _08080348 @ =gUnk_0818B308
	movs r2, #0x80
	lsls r2, r2, #1
	adds r1, r2, #0
	bl ApplyPaletteExt
	movs r0, #0xc
	bl EnableBgSync
	adds r5, #0x4c
	movs r0, #0
	strh r0, [r5]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08080324: .4byte gUnk_0818BC3C
_08080328: .4byte gUnk_0818B408
_0808032C: .4byte 0x06005800
_08080330: .4byte gBg2Tm
_08080334: .4byte gUnk_0818B760
_08080338: .4byte 0x000072C0
_0808033C: .4byte gUnk_08187B5C
_08080340: .4byte gBg3Tm
_08080344: .4byte gUnk_0818AE2C
_08080348: .4byte gUnk_0818B308

	thumb_func_start sub_808034C
sub_808034C: @ 0x0808034C
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r1, r4, #0
	adds r1, #0x4c
	ldrh r2, [r1]
	adds r0, r2, #1
	strh r0, [r1]
	lsls r2, r2, #0x10
	asrs r2, r2, #0x12
	ldr r0, _080803B4 @ =gDispIo
	mov ip, r0
	mov r3, ip
	adds r3, #0x3c
	movs r0, #0x3f
	ldrb r1, [r3]
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r3]
	movs r5, #0x10
	subs r1, r5, r2
	mov r0, ip
	adds r0, #0x44
	movs r3, #0
	strb r1, [r0]
	adds r0, #1
	strb r2, [r0]
	adds r0, #1
	strb r3, [r0]
	cmp r2, #0x10
	bne _080803AC
	movs r0, #2
	rsbs r0, r0, #0
	mov r2, ip
	ldrb r2, [r2, #1]
	ands r0, r2
	movs r1, #2
	orrs r0, r1
	movs r1, #4
	orrs r0, r1
	movs r1, #8
	orrs r0, r1
	orrs r0, r5
	mov r1, ip
	strb r0, [r1, #1]
	adds r0, r4, #0
	bl Proc_Break
_080803AC:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080803B4: .4byte gDispIo

	thumb_func_start sub_80803B8
sub_80803B8: @ 0x080803B8
	push {lr}
	ldr r0, _080803CC @ =gBg0Tm
	movs r1, #0
	bl TmFill
	movs r0, #1
	bl EnableBgSync
	pop {r0}
	bx r0
	.align 2, 0
_080803CC: .4byte gBg0Tm

	thumb_func_start sub_80803D0
sub_80803D0: @ 0x080803D0
	push {r4, lr}
	sub sp, #0x14
	adds r4, r0, #0
	ldr r3, _08080438 @ =gDispIo
	movs r0, #1
	ldrb r1, [r3, #1]
	orrs r0, r1
	movs r1, #2
	orrs r0, r1
	movs r1, #4
	orrs r0, r1
	movs r1, #8
	orrs r0, r1
	movs r1, #0x10
	orrs r0, r1
	strb r0, [r3, #1]
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
	bl ArchiveCurrentPalettes
	movs r2, #0x80
	lsls r2, r2, #1
	movs r3, #0x80
	lsls r3, r3, #2
	str r3, [sp]
	str r3, [sp, #4]
	movs r0, #0x80
	str r0, [sp, #8]
	movs r0, #4
	str r0, [sp, #0xc]
	str r4, [sp, #0x10]
	adds r0, r2, #0
	adds r1, r2, #0
	bl sub_8013EF8
	add sp, #0x14
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08080438: .4byte gDispIo

	thumb_func_start sub_808043C
sub_808043C: @ 0x0808043C
	push {r4, lr}
	sub sp, #0x14
	adds r4, r0, #0
	bl ArchiveCurrentPalettes
	movs r2, #0x80
	lsls r2, r2, #1
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	movs r0, #0x80
	str r0, [sp, #8]
	movs r0, #2
	str r0, [sp, #0xc]
	str r4, [sp, #0x10]
	adds r0, r2, #0
	adds r1, r2, #0
	movs r3, #0
	bl sub_8013EF8
	add sp, #0x14
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_808046C
sub_808046C: @ 0x0808046C
	push {lr}
	adds r1, r0, #0
	ldr r0, _0808047C @ =gUnk_08D897EC
	bl Proc_StartBlocking
	pop {r0}
	bx r0
	.align 2, 0
_0808047C: .4byte gUnk_08D897EC

	thumb_func_start sub_8080480
sub_8080480: @ 0x08080480
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0x98
	bl CheckFlag
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0808049C
	movs r0, #0x98
	bl SetFlag
	adds r0, r4, #0
	bl sub_80A5AF8
_0808049C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
