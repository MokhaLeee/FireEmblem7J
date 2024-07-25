	.include "macro.inc"
	.syntax unified

	thumb_func_start DoItemHealStaffAction
DoItemHealStaffAction: @ 0x0802C7E4
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	ldr r4, _0802C860 @ =gActionSt
	ldrb r0, [r4, #0xc]
	bl GetUnit
	ldrb r1, [r4, #0x12]
	bl BattleInitItemEffect
	ldrb r0, [r4, #0xd]
	bl GetUnit
	bl BattleInitItemEffectTarget
	ldrb r0, [r4, #0xc]
	bl GetUnit
	adds r5, r0, #0
	ldrb r0, [r4, #0xc]
	bl GetUnit
	ldrb r2, [r4, #0x12]
	lsls r1, r2, #1
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r1, [r0]
	adds r0, r5, #0
	bl sub_8016FBC
	adds r5, r0, #0
	ldrb r0, [r4, #0xd]
	bl GetUnit
	adds r1, r5, #0
	bl AddUnitHp
	ldrb r0, [r4, #0xd]
	bl GetUnit
	bl GetUnitCurrentHp
	ldr r1, _0802C864 @ =gBattleHitIterator
	ldr r1, [r1]
	ldr r5, _0802C868 @ =gBattleTarget
	ldrb r2, [r5, #0x13]
	subs r0, r2, r0
	strb r0, [r1, #3]
	ldrb r0, [r4, #0xd]
	bl GetUnit
	bl GetUnitCurrentHp
	strb r0, [r5, #0x13]
	adds r0, r6, #0
	bl BattleApplyItemEffect
	bl BeginBattleAnimations
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0802C860: .4byte gActionSt
_0802C864: .4byte gBattleHitIterator
_0802C868: .4byte gBattleTarget

	thumb_func_start sub_802C86C
sub_802C86C: @ 0x0802C86C
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r4, _0802C8A4 @ =gActionSt
	ldrb r0, [r4, #0xc]
	bl GetUnit
	ldrb r1, [r4, #0x12]
	bl BattleInitItemEffect
	ldrb r0, [r4, #0xd]
	bl GetUnit
	bl BattleInitItemEffectTarget
	ldrb r0, [r4, #0xd]
	bl GetUnit
	movs r1, #0
	bl SetUnitStatus
	adds r0, r5, #0
	bl BattleApplyItemEffect
	bl BeginBattleAnimations
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0802C8A4: .4byte gActionSt

	thumb_func_start sub_802C8A8
sub_802C8A8: @ 0x0802C8A8
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r4, _0802C8E8 @ =gActionSt
	ldrb r0, [r4, #0xc]
	bl GetUnit
	ldrb r1, [r4, #0x12]
	bl BattleInitItemEffect
	ldrb r0, [r4, #0xd]
	bl GetUnit
	bl BattleInitItemEffectTarget
	ldrb r0, [r4, #0xd]
	bl GetUnit
	adds r0, #0x31
	movs r1, #0xf
	ldrb r2, [r0]
	ands r1, r2
	movs r2, #0x70
	orrs r1, r2
	strb r1, [r0]
	adds r0, r5, #0
	bl BattleApplyItemEffect
	bl BeginBattleAnimations
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0802C8E8: .4byte gActionSt

	thumb_func_start sub_802C8EC
sub_802C8EC: @ 0x0802C8EC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	adds r7, r0, #0
	str r1, [sp]
	mov sb, r2
	mov sl, r3
	movs r0, #1
	rsbs r0, r0, #0
	str r0, [r2]
	str r0, [r3]
	ldr r0, _0802C9B0 @ =0x0000270F
	str r0, [sp, #4]
	adds r0, r7, #0
	bl sub_8019FFC
	movs r0, #0x11
	ldrsb r0, [r7, r0]
	ldr r1, _0802C9B4 @ =gBmMapUnit
	ldr r1, [r1]
	lsls r0, r0, #2
	adds r0, r0, r1
	movs r1, #0x10
	ldrsb r1, [r7, r1]
	ldr r0, [r0]
	adds r0, r0, r1
	movs r1, #0xff
	strb r1, [r0]
	ldr r0, _0802C9B8 @ =gBmMapSize
	movs r1, #2
	ldrsh r0, [r0, r1]
	subs r5, r0, #1
	cmp r5, #0
	blt _0802C9E8
_0802C936:
	ldr r0, _0802C9B8 @ =gBmMapSize
	movs r1, #0
	ldrsh r0, [r0, r1]
	subs r4, r0, #1
	subs r0, r5, #1
	mov r8, r0
	cmp r4, #0
	blt _0802C9E2
	lsls r6, r5, #2
_0802C948:
	ldr r0, _0802C9BC @ =gBmMapMovement
	ldr r0, [r0]
	adds r0, r6, r0
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r0, [r0]
	cmp r0, #0x78
	bhi _0802C9DC
	ldr r0, _0802C9B4 @ =gBmMapUnit
	ldr r0, [r0]
	adds r0, r6, r0
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r0, [r0]
	cmp r0, #0
	bne _0802C9DC
	ldr r0, _0802C9C0 @ =gBmMapHidden
	ldr r0, [r0]
	adds r0, r6, r0
	ldr r1, [r0]
	adds r1, r1, r4
	movs r0, #1
	ldrb r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _0802C9DC
	ldr r0, _0802C9C4 @ =gBmMapTerrain
	ldr r0, [r0]
	adds r0, r6, r0
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r1, [r0]
	ldr r0, [sp]
	bl CanUnitCrossTerrain
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0802C9DC
	movs r0, #0x10
	ldrsb r0, [r7, r0]
	subs r2, r4, r0
	cmp r2, #0
	bge _0802C9A0
	subs r2, r0, r4
_0802C9A0:
	movs r0, #0x11
	ldrsb r0, [r7, r0]
	subs r1, r5, r0
	cmp r1, #0
	blt _0802C9C8
	adds r0, r2, r1
	b _0802C9CC
	.align 2, 0
_0802C9B0: .4byte 0x0000270F
_0802C9B4: .4byte gBmMapUnit
_0802C9B8: .4byte gBmMapSize
_0802C9BC: .4byte gBmMapMovement
_0802C9C0: .4byte gBmMapHidden
_0802C9C4: .4byte gBmMapTerrain
_0802C9C8:
	subs r0, r0, r5
	adds r0, r2, r0
_0802C9CC:
	ldr r1, [sp, #4]
	cmp r1, r0
	blt _0802C9DC
	str r0, [sp, #4]
	mov r0, sb
	str r4, [r0]
	mov r1, sl
	str r5, [r1]
_0802C9DC:
	subs r4, #1
	cmp r4, #0
	bge _0802C948
_0802C9E2:
	mov r5, r8
	cmp r5, #0
	bge _0802C936
_0802C9E8:
	mov r1, sb
	ldr r0, [r1]
	cmp r0, #0
	blt _0802C9F8
	mov r1, sl
	ldr r0, [r1]
	cmp r0, #0
	bge _0802CAE6
_0802C9F8:
	ldr r0, _0802CAF8 @ =0x0000270F
	str r0, [sp, #4]
	movs r0, #0x10
	ldrsb r0, [r7, r0]
	movs r1, #0x11
	ldrsb r1, [r7, r1]
	ldr r2, _0802CAFC @ =MoveTable_Flying
	bl GenerateExtendedMovementMap
	movs r0, #0x11
	ldrsb r0, [r7, r0]
	ldr r1, _0802CB00 @ =gBmMapUnit
	ldr r1, [r1]
	lsls r0, r0, #2
	adds r0, r0, r1
	movs r1, #0x10
	ldrsb r1, [r7, r1]
	ldr r0, [r0]
	adds r0, r0, r1
	movs r1, #0xff
	strb r1, [r0]
	ldr r0, _0802CB04 @ =gBmMapSize
	movs r1, #2
	ldrsh r0, [r0, r1]
	subs r5, r0, #1
	cmp r5, #0
	blt _0802CAC2
_0802CA2E:
	ldr r0, _0802CB04 @ =gBmMapSize
	movs r1, #0
	ldrsh r0, [r0, r1]
	subs r4, r0, #1
	subs r0, r5, #1
	mov r8, r0
	cmp r4, #0
	blt _0802CABC
	lsls r6, r5, #2
_0802CA40:
	ldr r0, _0802CB08 @ =gBmMapMovement
	ldr r0, [r0]
	adds r0, r6, r0
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r0, [r0]
	cmp r0, #0x78
	bhi _0802CAB6
	ldr r0, _0802CB00 @ =gBmMapUnit
	ldr r0, [r0]
	adds r0, r6, r0
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r0, [r0]
	cmp r0, #0
	bne _0802CAB6
	ldr r0, _0802CB0C @ =gBmMapHidden
	ldr r0, [r0]
	adds r0, r6, r0
	ldr r1, [r0]
	adds r1, r1, r4
	movs r0, #1
	ldrb r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _0802CAB6
	ldr r0, _0802CB10 @ =gBmMapTerrain
	ldr r0, [r0]
	adds r0, r6, r0
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r1, [r0]
	ldr r0, [sp]
	bl CanUnitCrossTerrain
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0802CAB6
	movs r0, #0x10
	ldrsb r0, [r7, r0]
	subs r2, r4, r0
	cmp r2, #0
	bge _0802CA98
	subs r2, r0, r4
_0802CA98:
	movs r1, #0x11
	ldrsb r1, [r7, r1]
	subs r0, r5, r1
	cmp r0, #0
	bge _0802CAA4
	subs r0, r1, r5
_0802CAA4:
	adds r0, r2, r0
	ldr r1, [sp, #4]
	cmp r1, r0
	blt _0802CAB6
	str r0, [sp, #4]
	mov r0, sb
	str r4, [r0]
	mov r1, sl
	str r5, [r1]
_0802CAB6:
	subs r4, #1
	cmp r4, #0
	bge _0802CA40
_0802CABC:
	mov r5, r8
	cmp r5, #0
	bge _0802CA2E
_0802CAC2:
	mov r1, sb
	ldr r0, [r1]
	cmp r0, #0
	blt _0802CAD2
	mov r1, sl
	ldr r0, [r1]
	cmp r0, #0
	bge _0802CAE6
_0802CAD2:
	ldr r1, [sp]
	movs r0, #0x10
	ldrsb r0, [r1, r0]
	mov r1, sb
	str r0, [r1]
	ldr r1, [sp]
	movs r0, #0x11
	ldrsb r0, [r1, r0]
	mov r1, sl
	str r0, [r1]
_0802CAE6:
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0802CAF8: .4byte 0x0000270F
_0802CAFC: .4byte MoveTable_Flying
_0802CB00: .4byte gBmMapUnit
_0802CB04: .4byte gBmMapSize
_0802CB08: .4byte gBmMapMovement
_0802CB0C: .4byte gBmMapHidden
_0802CB10: .4byte gBmMapTerrain

	thumb_func_start sub_802CB14
sub_802CB14: @ 0x0802CB14
	push {r4, r5, r6, lr}
	sub sp, #8
	adds r6, r0, #0
	ldr r4, _0802CB84 @ =gActionSt
	ldrb r0, [r4, #0xc]
	bl GetUnit
	ldrb r1, [r4, #0x12]
	bl BattleInitItemEffect
	ldrb r0, [r4, #0xd]
	bl GetUnit
	bl BattleInitItemEffectTarget
	ldrb r0, [r4, #0xc]
	bl GetUnit
	adds r5, r0, #0
	ldrb r0, [r4, #0xd]
	bl GetUnit
	adds r1, r0, #0
	add r3, sp, #4
	adds r0, r5, #0
	mov r2, sp
	bl sub_802C8EC
	ldrb r0, [r4, #0xd]
	bl GetUnit
	ldr r1, [sp]
	strb r1, [r0, #0x10]
	ldrb r0, [r4, #0xd]
	bl GetUnit
	ldr r1, [sp, #4]
	strb r1, [r0, #0x11]
	ldr r0, _0802CB88 @ =gBattleTarget
	ldr r1, [sp]
	adds r2, r0, #0
	adds r2, #0x73
	strb r1, [r2]
	ldr r1, [sp, #4]
	adds r0, #0x74
	strb r1, [r0]
	adds r0, r6, #0
	bl BattleApplyItemEffect
	bl BeginBattleAnimations
	add sp, #8
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0802CB84: .4byte gActionSt
_0802CB88: .4byte gBattleTarget

	thumb_func_start sub_802CB8C
sub_802CB8C: @ 0x0802CB8C
	push {lr}
	bl sub_8034A50
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_802CB9C
sub_802CB9C: @ 0x0802CB9C
	push {lr}
	ldr r0, _0802CBC4 @ =gActionSt
	ldrb r0, [r0, #0xd]
	bl GetUnit
	bl sub_806EAA4
	bl EndMu
	bl RefreshEntityMaps
	bl RenderMap
	bl RefreshUnitSprites
	bl ForceSyncUnitSpriteSheet
	pop {r1}
	bx r1
	.align 2, 0
_0802CBC4: .4byte gActionSt

	thumb_func_start sub_802CBC8
sub_802CBC8: @ 0x0802CBC8
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r4, _0802CC20 @ =gActionSt
	ldrb r0, [r4, #0xc]
	bl GetUnit
	ldrb r1, [r4, #0x12]
	bl BattleInitItemEffect
	ldrb r0, [r4, #0xd]
	bl GetUnit
	bl BattleInitItemEffectTarget
	ldrb r0, [r4, #0xd]
	bl GetUnit
	ldrb r1, [r4, #0x13]
	strb r1, [r0, #0x10]
	ldrb r0, [r4, #0xd]
	bl GetUnit
	ldrb r1, [r4, #0x14]
	strb r1, [r0, #0x11]
	ldr r0, _0802CC24 @ =gBattleTarget
	ldrb r1, [r4, #0x13]
	adds r2, r0, #0
	adds r2, #0x73
	strb r1, [r2]
	ldrb r1, [r4, #0x14]
	adds r0, #0x74
	strb r1, [r0]
	adds r0, r5, #0
	bl BattleApplyItemEffect
	bl BeginBattleAnimations
	ldr r0, _0802CC28 @ =gUnk_08C03884
	adds r1, r5, #0
	bl Proc_StartBlocking
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0802CC20: .4byte gActionSt
_0802CC24: .4byte gBattleTarget
_0802CC28: .4byte gUnk_08C03884

	thumb_func_start sub_802CC2C
sub_802CC2C: @ 0x0802CC2C
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	ldr r4, _0802CC80 @ =gActionSt
	ldrb r0, [r4, #0xc]
	bl GetUnit
	ldrb r1, [r4, #0x12]
	bl BattleInitItemEffect
	ldrb r0, [r4, #0xd]
	bl GetUnit
	bl BattleInitItemEffectTarget
	ldrb r0, [r4, #0xc]
	bl GetUnit
	adds r5, r0, #0
	ldrb r0, [r4, #0xd]
	bl GetUnit
	adds r1, r0, #0
	adds r0, r5, #0
	bl GetOffensiveStaffAccuracy
	ldr r4, _0802CC84 @ =gBattleActor
	adds r1, r4, #0
	adds r1, #0x64
	strh r0, [r1]
	bl RandRoll
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0802CC8C
	ldr r0, _0802CC88 @ =gBattleHitIterator
	ldr r1, [r0]
	movs r0, #2
	ldrh r2, [r1]
	orrs r0, r2
	strh r0, [r1]
	b _0802CCC8
	.align 2, 0
_0802CC80: .4byte gActionSt
_0802CC84: .4byte gBattleActor
_0802CC88: .4byte gBattleHitIterator
_0802CC8C:
	adds r0, r4, #0
	adds r0, #0x4a
	ldrh r0, [r0]
	bl GetItemIndex
	cmp r0, #0x51
	beq _0802CCC0
	cmp r0, #0x51
	bgt _0802CCA4
	cmp r0, #0x50
	beq _0802CCB4
	b _0802CCC8
_0802CCA4:
	cmp r0, #0x52
	bne _0802CCC8
	ldr r0, _0802CCB0 @ =gBattleTarget
	adds r0, #0x6f
	movs r1, #4
	b _0802CCC6
	.align 2, 0
_0802CCB0: .4byte gBattleTarget
_0802CCB4:
	ldr r0, _0802CCBC @ =gBattleTarget
	adds r0, #0x6f
	movs r1, #3
	b _0802CCC6
	.align 2, 0
_0802CCBC: .4byte gBattleTarget
_0802CCC0:
	ldr r0, _0802CCD8 @ =gBattleTarget
	adds r0, #0x6f
	movs r1, #2
_0802CCC6:
	strb r1, [r0]
_0802CCC8:
	adds r0, r6, #0
	bl BattleApplyItemEffect
	bl BeginBattleAnimations
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0802CCD8: .4byte gBattleTarget

	thumb_func_start sub_802CCDC
sub_802CCDC: @ 0x0802CCDC
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	ldr r4, _0802CD50 @ =gActionSt
	ldrb r0, [r4, #0xc]
	bl GetUnit
	ldrb r1, [r4, #0x12]
	bl BattleInitItemEffect
	ldrb r0, [r4, #0xc]
	bl GetUnit
	bl sub_8024A4C
	ldrb r0, [r4, #0xc]
	bl GetUnit
	adds r5, r0, #0
	ldrb r0, [r4, #0xc]
	bl GetUnit
	ldrb r4, [r4, #0x12]
	lsls r1, r4, #1
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r1, [r0]
	adds r0, r5, #0
	bl sub_8016FBC
	adds r6, r0, #0
	bl sub_804B950
	adds r5, r0, #0
	movs r4, #0
	cmp r4, r5
	bge _0802CD40
_0802CD24:
	adds r0, r4, #0
	bl sub_804B95C
	ldrb r0, [r0, #2]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl GetUnit
	adds r1, r6, #0
	bl AddUnitHp
	adds r4, #1
	cmp r4, r5
	blt _0802CD24
_0802CD40:
	adds r0, r7, #0
	bl BattleApplyItemEffect
	bl BeginBattleAnimations
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0802CD50: .4byte gActionSt

	thumb_func_start sub_802CD54
sub_802CD54: @ 0x0802CD54
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r4, _0802CD8C @ =gActionSt
	ldrb r0, [r4, #0xc]
	bl GetUnit
	ldrb r1, [r4, #0x12]
	bl BattleInitItemEffect
	ldr r0, _0802CD90 @ =gBattleTarget
	ldrb r1, [r4, #0x13]
	strb r1, [r0, #0x10]
	ldrb r2, [r4, #0x14]
	strb r2, [r0, #0x11]
	adds r3, r0, #0
	adds r3, #0x73
	strb r1, [r3]
	adds r0, #0x74
	strb r2, [r0]
	adds r0, r5, #0
	bl BattleApplyItemEffect
	bl BeginBattleAnimations
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0802CD8C: .4byte gActionSt
_0802CD90: .4byte gBattleTarget

	thumb_func_start sub_802CD94
sub_802CD94: @ 0x0802CD94
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	ldr r4, _0802CDE8 @ =gActionSt
	ldrb r0, [r4, #0xc]
	bl GetUnit
	ldrb r1, [r4, #0x12]
	bl BattleInitItemEffect
	ldrb r0, [r4, #0xd]
	bl GetUnit
	bl BattleInitItemEffectTarget
	ldrb r0, [r4, #0xd]
	bl GetUnit
	adds r5, r0, #0
	ldrb r0, [r4, #0xd]
	bl GetUnit
	ldrb r2, [r4, #0x15]
	lsls r1, r2, #1
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r0, [r0]
	bl MakeNewItem
	ldrb r4, [r4, #0x15]
	lsls r1, r4, #1
	adds r5, #0x1e
	adds r5, r5, r1
	strh r0, [r5]
	adds r0, r6, #0
	bl BattleApplyItemEffect
	bl BeginBattleAnimations
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0802CDE8: .4byte gActionSt

	thumb_func_start sub_802CDEC
sub_802CDEC: @ 0x0802CDEC
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	ldr r4, _0802CE50 @ =gActionSt
	ldrb r0, [r4, #0xc]
	bl GetUnit
	ldrb r1, [r4, #0x12]
	bl BattleInitItemEffect
	ldrb r0, [r4, #0xc]
	bl GetUnit
	bl sub_8024E88
	bl sub_804B950
	adds r6, r0, #0
	movs r5, #0
	cmp r5, r6
	bge _0802CE40
_0802CE14:
	adds r0, r5, #0
	bl sub_804B95C
	ldrb r0, [r0, #2]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl GetUnit
	adds r4, r0, #0
	bl GetUnitMaxHp
	adds r1, r0, #0
	adds r0, r4, #0
	bl SetUnitHp
	adds r0, r4, #0
	movs r1, #0
	bl SetUnitStatus
	adds r5, #1
	cmp r5, r6
	blt _0802CE14
_0802CE40:
	adds r0, r7, #0
	bl BattleApplyItemEffect
	bl BeginBattleAnimations
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0802CE50: .4byte gActionSt

	thumb_func_start sub_802CE54
sub_802CE54: @ 0x0802CE54
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	adds r4, r1, #0
	ldr r5, _0802CEAC @ =gActionSt
	ldrb r0, [r5, #0xc]
	bl GetUnit
	ldrb r1, [r5, #0x12]
	bl BattleInitItemEffect
	ldrb r0, [r5, #0xc]
	bl GetUnit
	adds r1, r4, #0
	bl AddUnitHp
	ldrb r0, [r5, #0xc]
	bl GetUnit
	bl GetUnitCurrentHp
	ldr r1, _0802CEB0 @ =gBattleHitIterator
	ldr r1, [r1]
	ldr r4, _0802CEB4 @ =gBattleActor
	ldrb r2, [r4, #0x13]
	subs r0, r2, r0
	strb r0, [r1, #3]
	ldrb r0, [r5, #0xc]
	bl GetUnit
	bl GetUnitCurrentHp
	strb r0, [r4, #0x13]
	adds r4, #0x4a
	movs r0, #0x6b
	strh r0, [r4]
	adds r0, r6, #0
	bl BattleApplyItemEffect
	bl BeginBattleAnimations
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0802CEAC: .4byte gActionSt
_0802CEB0: .4byte gBattleHitIterator
_0802CEB4: .4byte gBattleActor

	thumb_func_start sub_802CEB8
sub_802CEB8: @ 0x0802CEB8
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	ldr r4, _0802CF18 @ =gActionSt
	ldrb r0, [r4, #0xc]
	bl GetUnit
	ldrb r1, [r4, #0x12]
	bl BattleInitItemEffect
	ldrb r0, [r4, #0xc]
	bl GetUnit
	adds r5, r0, #0
	ldrb r0, [r4, #0xc]
	bl GetUnit
	bl GetUnitMaxHp
	adds r1, r0, #0
	adds r0, r5, #0
	bl SetUnitHp
	ldrb r0, [r4, #0xc]
	bl GetUnit
	bl GetUnitCurrentHp
	ldr r1, _0802CF1C @ =gBattleHitIterator
	ldr r1, [r1]
	ldr r5, _0802CF20 @ =gBattleActor
	ldrb r2, [r5, #0x13]
	subs r0, r2, r0
	strb r0, [r1, #3]
	ldrb r0, [r4, #0xc]
	bl GetUnit
	bl GetUnitCurrentHp
	strb r0, [r5, #0x13]
	adds r0, r6, #0
	bl BattleApplyItemEffect
	bl BeginBattleAnimations
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0802CF18: .4byte gActionSt
_0802CF1C: .4byte gBattleHitIterator
_0802CF20: .4byte gBattleActor

	thumb_func_start sub_802CF24
sub_802CF24: @ 0x0802CF24
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r4, _0802CF5C @ =gActionSt
	ldrb r0, [r4, #0xc]
	bl GetUnit
	ldrb r1, [r4, #0x12]
	bl BattleInitItemEffect
	ldrb r0, [r4, #0xc]
	bl GetUnit
	adds r0, #0x31
	movs r1, #0xf
	ldrb r2, [r0]
	ands r1, r2
	movs r2, #0x70
	orrs r1, r2
	strb r1, [r0]
	adds r0, r5, #0
	bl BattleApplyItemEffect
	bl BeginBattleAnimations
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0802CF5C: .4byte gActionSt

	thumb_func_start sub_802CF60
sub_802CF60: @ 0x0802CF60
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r4, _0802CFA0 @ =gActionSt
	ldrb r0, [r4, #0xc]
	bl GetUnit
	ldrb r1, [r4, #0x12]
	bl BattleInitItemEffect
	ldrb r0, [r4, #0xc]
	bl GetUnit
	adds r0, #0x31
	movs r1, #0x10
	rsbs r1, r1, #0
	ldrb r2, [r0]
	ands r1, r2
	movs r2, #4
	orrs r1, r2
	strb r1, [r0]
	ldrb r0, [r4, #0xe]
	strb r0, [r4, #0x13]
	ldrb r0, [r4, #0xf]
	strb r0, [r4, #0x14]
	adds r0, r5, #0
	bl BattleApplyItemEffect
	bl BeginBattleAnimations
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0802CFA0: .4byte gActionSt

	thumb_func_start sub_802CFA4
sub_802CFA4: @ 0x0802CFA4
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r4, _0802CFDC @ =gActionSt
	ldrb r0, [r4, #0xc]
	bl GetUnit
	ldrb r1, [r4, #0x12]
	bl BattleInitItemEffect
	ldrb r0, [r4, #0xc]
	bl GetUnit
	movs r1, #0
	bl SetUnitStatus
	ldr r0, _0802CFE0 @ =gBattleActor
	movs r1, #0
	bl SetUnitStatus
	adds r0, r5, #0
	bl BattleApplyItemEffect
	bl BeginBattleAnimations
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0802CFDC: .4byte gActionSt
_0802CFE0: .4byte gBattleActor

	thumb_func_start sub_802CFE4
sub_802CFE4: @ 0x0802CFE4
	push {r4, r5, lr}
	ldr r4, _0802D060 @ =gActionSt
	ldrb r0, [r4, #0xc]
	bl GetUnit
	ldrb r1, [r4, #0x12]
	bl UnitUpdateUsedItem
	ldrb r0, [r4, #0xc]
	bl GetUnit
	movs r5, #0x10
	ldrsb r5, [r0, r5]
	ldrb r0, [r4, #0xc]
	bl GetUnit
	movs r4, #0x11
	ldrsb r4, [r0, r4]
	subs r0, r5, #1
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r1, r4, #0
	bl sub_8079710
	adds r0, r5, #1
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r1, r4, #0
	bl sub_8079710
	subs r1, r4, #1
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	adds r0, r5, #0
	bl sub_8079710
	adds r1, r4, #1
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	adds r0, r5, #0
	bl sub_8079710
	adds r0, r5, #0
	adds r1, r4, #0
	bl sub_80796CC
	ldr r0, _0802D064 @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0802D052
	movs r0, #0xb1
	bl m4aSongNumStart
_0802D052:
	ldr r0, _0802D068 @ =gBattleTarget
	adds r0, #0x6f
	movs r1, #0xff
	strb r1, [r0]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0802D060: .4byte gActionSt
_0802D064: .4byte gPlaySt
_0802D068: .4byte gBattleTarget

	thumb_func_start sub_802D06C
sub_802D06C: @ 0x0802D06C
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	adds r6, r0, #0
	adds r7, r1, #0
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	mov r8, r2
	movs r0, #1
	rsbs r0, r0, #0
	mov sb, r0
	cmp r7, sb
	beq _0802D09E
	ldr r3, _0802D118 @ =gBattleActor
	ldr r1, _0802D11C @ =gBattleTarget
	lsls r2, r7, #1
	adds r0, r6, #0
	adds r0, #0x1e
	adds r0, r0, r2
	ldrh r0, [r0]
	adds r1, #0x4a
	strh r0, [r1]
	adds r3, #0x4a
	strh r0, [r3]
_0802D09E:
	adds r0, r6, #0
	bl GetUnitEquippedWeapon
	ldr r4, _0802D118 @ =gBattleActor
	ldr r5, _0802D11C @ =gBattleTarget
	adds r1, r5, #0
	adds r1, #0x48
	strh r0, [r1]
	adds r1, r4, #0
	adds r1, #0x48
	strh r0, [r1]
	adds r0, r5, #0
	adds r1, r6, #0
	bl InitBattleUnitWithoutBonuses
	adds r0, r6, #0
	bl UnitPromote
	adds r0, r4, #0
	adds r1, r6, #0
	bl InitBattleUnitWithoutBonuses
	adds r0, r4, #0
	adds r1, r5, #0
	bl GenerateBattleUnitStatGainsComparatively
	adds r0, r4, #0
	bl SetBattleUnitTerrainBonusesAuto
	adds r0, r5, #0
	bl SetBattleUnitTerrainBonusesAuto
	mov r0, r8
	cmp r0, #0
	beq _0802D0EC
	ldr r0, [r6, #0xc]
	movs r1, #0x40
	orrs r0, r1
	str r0, [r6, #0xc]
_0802D0EC:
	cmp r7, sb
	beq _0802D0F8
	adds r0, r6, #0
	adds r1, r7, #0
	bl UnitUpdateUsedItem
_0802D0F8:
	ldr r1, _0802D120 @ =gBattleHitArray
	movs r0, #0
	strh r0, [r1]
	movs r0, #0x80
	strb r0, [r1, #2]
	movs r0, #0
	strb r0, [r1, #3]
	ldr r1, _0802D124 @ =gBattleStats
	movs r0, #0x10
	strh r0, [r1]
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0802D118: .4byte gBattleActor
_0802D11C: .4byte gBattleTarget
_0802D120: .4byte gBattleHitArray
_0802D124: .4byte gBattleStats

	thumb_func_start sub_802D128
sub_802D128: @ 0x0802D128
	push {r4, lr}
	ldr r4, _0802D144 @ =gActionSt
	ldrb r0, [r4, #0xc]
	bl GetUnit
	ldrb r1, [r4, #0x12]
	movs r2, #1
	bl sub_802D06C
	bl BeginBattleAnimations
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0802D144: .4byte gActionSt

	thumb_func_start sub_802D148
sub_802D148: @ 0x0802D148
	push {r4, r5, r6, lr}
	mov r6, sb
	mov r5, r8
	push {r5, r6}
	adds r6, r0, #0
	ldr r4, _0802D1D4 @ =gBattleActor
	ldr r5, _0802D1D8 @ =gBattleTarget
	adds r0, r5, #0
	adds r0, #0x4a
	movs r2, #0
	mov sb, r2
	movs r2, #0
	mov r8, r2
	strh r1, [r0]
	ldr r2, _0802D1DC @ =0x0000FFFF
	adds r0, r2, #0
	adds r2, r1, #0
	ands r2, r0
	adds r0, r4, #0
	adds r0, #0x4a
	strh r2, [r0]
	adds r0, r5, #0
	adds r0, #0x48
	strh r1, [r0]
	adds r0, r4, #0
	adds r0, #0x48
	strh r2, [r0]
	adds r0, r5, #0
	adds r1, r6, #0
	bl InitBattleUnit
	adds r0, r6, #0
	bl UnitPromote
	adds r0, r4, #0
	adds r1, r6, #0
	bl InitBattleUnit
	adds r0, r4, #0
	adds r1, r5, #0
	bl GenerateBattleUnitStatGainsComparatively
	adds r0, r4, #0
	bl SetBattleUnitTerrainBonusesAuto
	adds r0, r5, #0
	bl SetBattleUnitTerrainBonusesAuto
	ldr r0, _0802D1E0 @ =gBattleHitArray
	mov r1, r8
	strh r1, [r0]
	movs r1, #0x80
	strb r1, [r0, #2]
	mov r2, sb
	strb r2, [r0, #3]
	ldr r1, _0802D1E4 @ =gBattleStats
	movs r0, #0x10
	strh r0, [r1]
	bl BeginBattleAnimations
	ldr r0, [r6, #0xc]
	movs r1, #1
	orrs r0, r1
	str r0, [r6, #0xc]
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0802D1D4: .4byte gBattleActor
_0802D1D8: .4byte gBattleTarget
_0802D1DC: .4byte 0x0000FFFF
_0802D1E0: .4byte gBattleHitArray
_0802D1E4: .4byte gBattleStats

	thumb_func_start sub_802D1E8
sub_802D1E8: @ 0x0802D1E8
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	adds r7, r1, #0
	movs r5, #0
	lsls r0, r7, #1
	adds r1, r4, #0
	adds r1, #0x1e
	adds r1, r1, r0
	ldrh r6, [r1]
	adds r0, r6, #0
	bl GetItemIndex
	cmp r0, #0x88
	bne _0802D220
	ldr r0, [r4, #0xc]
	movs r1, #0x80
	lsls r1, r1, #6
	orrs r0, r1
	str r0, [r4, #0xc]
	adds r0, r4, #0
	adds r1, r7, #0
	bl UnitUpdateUsedItem
	ldr r0, _0802D21C @ =0x000006E7
	b _0802D316
	.align 2, 0
_0802D21C: .4byte 0x000006E7
_0802D220:
	adds r0, r6, #0
	bl sub_80177F0
	ldrb r2, [r4, #0x12]
	ldrb r3, [r0]
	adds r1, r2, r3
	strb r1, [r4, #0x12]
	ldrb r2, [r4, #0x13]
	ldrb r3, [r0]
	adds r1, r2, r3
	strb r1, [r4, #0x13]
	ldrb r2, [r4, #0x14]
	ldrb r3, [r0, #1]
	adds r1, r2, r3
	strb r1, [r4, #0x14]
	ldrb r2, [r4, #0x15]
	ldrb r3, [r0, #2]
	adds r1, r2, r3
	strb r1, [r4, #0x15]
	ldrb r2, [r4, #0x16]
	ldrb r3, [r0, #3]
	adds r1, r2, r3
	strb r1, [r4, #0x16]
	ldrb r2, [r4, #0x17]
	ldrb r3, [r0, #4]
	adds r1, r2, r3
	strb r1, [r4, #0x17]
	ldrb r2, [r4, #0x18]
	ldrb r3, [r0, #5]
	adds r1, r2, r3
	strb r1, [r4, #0x18]
	ldrb r2, [r4, #0x19]
	ldrb r3, [r0, #6]
	adds r1, r2, r3
	strb r1, [r4, #0x19]
	ldrb r2, [r4, #0x1d]
	ldrb r3, [r0, #7]
	adds r1, r2, r3
	strb r1, [r4, #0x1d]
	ldrb r1, [r4, #0x1a]
	ldrb r0, [r0, #8]
	adds r0, r1, r0
	strb r0, [r4, #0x1a]
	adds r0, r4, #0
	bl UnitCheckStatCaps
	adds r0, r4, #0
	adds r1, r7, #0
	bl UnitUpdateUsedItem
	adds r0, r6, #0
	bl GetItemIndex
	subs r0, #0x5a
	cmp r0, #8
	bhi _0802D314
	lsls r0, r0, #2
	ldr r1, _0802D29C @ =_0802D2A0
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0802D29C: .4byte _0802D2A0
_0802D2A0: @ jump table
	.4byte _0802D2D4 @ case 0
	.4byte _0802D304 @ case 1
	.4byte _0802D2C4 @ case 2
	.4byte _0802D2E4 @ case 3
	.4byte _0802D2CC @ case 4
	.4byte _0802D2DC @ case 5
	.4byte _0802D2EA @ case 6
	.4byte _0802D2F4 @ case 7
	.4byte _0802D2FC @ case 8
_0802D2C4:
	ldr r5, _0802D2C8 @ =0x000006DF
	b _0802D314
	.align 2, 0
_0802D2C8: .4byte 0x000006DF
_0802D2CC:
	ldr r5, _0802D2D0 @ =0x000006E1
	b _0802D314
	.align 2, 0
_0802D2D0: .4byte 0x000006E1
_0802D2D4:
	ldr r5, _0802D2D8 @ =0x000006E6
	b _0802D314
	.align 2, 0
_0802D2D8: .4byte 0x000006E6
_0802D2DC:
	ldr r5, _0802D2E0 @ =0x000006E2
	b _0802D314
	.align 2, 0
_0802D2E0: .4byte 0x000006E2
_0802D2E4:
	movs r5, #0xdc
	lsls r5, r5, #3
	b _0802D314
_0802D2EA:
	ldr r5, _0802D2F0 @ =0x000006E3
	b _0802D314
	.align 2, 0
_0802D2F0: .4byte 0x000006E3
_0802D2F4:
	ldr r5, _0802D2F8 @ =0x000006E4
	b _0802D314
	.align 2, 0
_0802D2F8: .4byte 0x000006E4
_0802D2FC:
	ldr r5, _0802D300 @ =0x000006E5
	b _0802D314
	.align 2, 0
_0802D300: .4byte 0x000006E5
_0802D304:
	adds r0, r4, #0
	bl UnitHasMagicRank
	lsls r0, r0, #0x18
	ldr r5, _0802D31C @ =0x000006DD
	cmp r0, #0
	beq _0802D314
	adds r5, #1
_0802D314:
	adds r0, r5, #0
_0802D316:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0802D31C: .4byte 0x000006DD

	thumb_func_start sub_802D320
sub_802D320: @ 0x0802D320
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	ldr r4, _0802D378 @ =gActionSt
	ldrb r0, [r4, #0xc]
	bl GetUnit
	ldrb r1, [r4, #0x12]
	lsls r2, r1, #1
	adds r1, r0, #0
	adds r1, #0x1e
	adds r1, r1, r2
	ldrh r6, [r1]
	ldr r1, _0802D37C @ =gBattleTarget
	adds r1, #0x6f
	movs r2, #0xff
	strb r2, [r1]
	ldrb r1, [r4, #0x12]
	bl sub_802D1E8
	adds r5, r0, #0
	ldr r0, _0802D380 @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0802D35A
	ldr r0, _0802D384 @ =0x0000037A
	bl m4aSongNumStart
_0802D35A:
	adds r0, r6, #0
	bl sub_8017808
	adds r4, r0, #0
	adds r0, r5, #0
	bl DecodeMsg
	adds r2, r0, #0
	adds r0, r7, #0
	adds r1, r4, #0
	bl sub_801F484
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0802D378: .4byte gActionSt
_0802D37C: .4byte gBattleTarget
_0802D380: .4byte gPlaySt
_0802D384: .4byte 0x0000037A

	thumb_func_start sub_802D388
sub_802D388: @ 0x0802D388
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r4, _0802D3C4 @ =gActionSt
	ldrb r0, [r4, #0xc]
	bl GetUnit
	ldrb r1, [r4, #0x12]
	bl BattleInitItemEffect
	ldrb r0, [r4, #0x13]
	ldrb r1, [r4, #0x14]
	movs r2, #0xb
	movs r3, #0
	bl sub_802BF8C
	adds r0, r5, #0
	bl BattleApplyItemEffect
	ldr r0, _0802D3C8 @ =gBattleTarget
	adds r0, #0x6f
	movs r1, #0xff
	strb r1, [r0]
	ldrb r1, [r4, #0x13]
	ldrb r2, [r4, #0x14]
	adds r0, r5, #0
	bl StartMineAnim
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0802D3C4: .4byte gActionSt
_0802D3C8: .4byte gBattleTarget

	thumb_func_start sub_802D3CC
sub_802D3CC: @ 0x0802D3CC
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r4, _0802D404 @ =gActionSt
	ldrb r0, [r4, #0xc]
	bl GetUnit
	ldrb r1, [r4, #0x12]
	bl BattleInitItemEffect
	ldrb r0, [r4, #0x13]
	ldrb r1, [r4, #0x14]
	bl sub_802C6A8
	adds r0, r5, #0
	bl BattleApplyItemEffect
	ldrb r1, [r4, #0x13]
	ldrb r2, [r4, #0x14]
	adds r0, r5, #0
	bl StartLightRuneAnim3
	ldr r0, _0802D408 @ =gBattleTarget
	adds r0, #0x6f
	movs r1, #0xff
	strb r1, [r0]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0802D404: .4byte gActionSt
_0802D408: .4byte gBattleTarget

	thumb_func_start sub_802D40C
sub_802D40C: @ 0x0802D40C
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r4, _0802D43C @ =gActionSt
	ldrb r0, [r4, #0xc]
	bl GetUnit
	ldrb r1, [r4, #0x12]
	bl BattleInitItemEffect
	ldrb r0, [r4, #0x13]
	ldrb r1, [r4, #0x14]
	movs r2, #0xa
	movs r3, #8
	bl sub_802BF8C
	adds r0, r5, #0
	bl BattleApplyItemEffect
	bl BeginBattleAnimations
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0802D43C: .4byte gActionSt

	thumb_func_start sub_802D440
sub_802D440: @ 0x0802D440
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	movs r5, #0
	ldr r4, _0802D480 @ =gActionSt
	ldrb r0, [r4, #0xc]
	bl GetUnit
	ldrb r1, [r4, #0x12]
	bl BattleInitItemEffect
	ldrb r0, [r4, #0xd]
	bl GetUnit
	bl BattleInitItemEffectTarget
	ldrb r0, [r4, #0xc]
	bl GetUnit
	ldrb r4, [r4, #0x12]
	lsls r1, r4, #1
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r0, [r0]
	bl GetItemIndex
	cmp r0, #0x7d
	beq _0802D492
	cmp r0, #0x7d
	bgt _0802D484
	cmp r0, #0x7c
	beq _0802D48E
	b _0802D49C
	.align 2, 0
_0802D480: .4byte gActionSt
_0802D484:
	cmp r0, #0x7e
	beq _0802D496
	cmp r0, #0x7f
	beq _0802D49A
	b _0802D49C
_0802D48E:
	movs r5, #5
	b _0802D49C
_0802D492:
	movs r5, #6
	b _0802D49C
_0802D496:
	movs r5, #7
	b _0802D49C
_0802D49A:
	movs r5, #8
_0802D49C:
	ldr r0, _0802D4C4 @ =gActionSt
	ldrb r0, [r0, #0xd]
	bl GetUnit
	adds r1, r5, #0
	movs r2, #1
	bl SetUnitStatusExt
	ldr r1, _0802D4C8 @ =gBattleStats
	movs r0, #0x80
	lsls r0, r0, #2
	strh r0, [r1]
	adds r0, r6, #0
	bl BattleApplyItemEffect
	bl BeginBattleAnimations
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0802D4C4: .4byte gActionSt
_0802D4C8: .4byte gBattleStats

	thumb_func_start sub_802D4CC
sub_802D4CC: @ 0x0802D4CC
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r4, _0802D500 @ =gActionSt
	ldrb r0, [r4, #0xc]
	bl GetUnit
	ldrb r4, [r4, #0x12]
	lsls r1, r4, #1
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r0, [r0]
	bl GetItemIndex
	ldr r1, _0802D504 @ =gBattleActor
	adds r1, #0x7e
	movs r2, #0
	strb r2, [r1]
	subs r0, #0x4a
	cmp r0, #0x50
	bls _0802D4F6
	b _0802D6F4
_0802D4F6:
	lsls r0, r0, #2
	ldr r1, _0802D508 @ =_0802D50C
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0802D500: .4byte gActionSt
_0802D504: .4byte gBattleActor
_0802D508: .4byte _0802D50C
_0802D50C: @ jump table
	.4byte _0802D650 @ case 0
	.4byte _0802D650 @ case 1
	.4byte _0802D650 @ case 2
	.4byte _0802D650 @ case 3
	.4byte _0802D660 @ case 4
	.4byte _0802D668 @ case 5
	.4byte _0802D658 @ case 6
	.4byte _0802D658 @ case 7
	.4byte _0802D658 @ case 8
	.4byte _0802D680 @ case 9
	.4byte _0802D670 @ case 10
	.4byte _0802D6E6 @ case 11
	.4byte _0802D690 @ case 12
	.4byte _0802D688 @ case 13
	.4byte _0802D678 @ case 14
	.4byte _0802D6F4 @ case 15
	.4byte _0802D6CE @ case 16
	.4byte _0802D6CE @ case 17
	.4byte _0802D6CE @ case 18
	.4byte _0802D6CE @ case 19
	.4byte _0802D6CE @ case 20
	.4byte _0802D6CE @ case 21
	.4byte _0802D6CE @ case 22
	.4byte _0802D6CE @ case 23
	.4byte _0802D6CE @ case 24
	.4byte _0802D6C8 @ case 25
	.4byte _0802D6C8 @ case 26
	.4byte _0802D6C8 @ case 27
	.4byte _0802D6C8 @ case 28
	.4byte _0802D6C8 @ case 29
	.4byte _0802D6C2 @ case 30
	.4byte _0802D6C2 @ case 31
	.4byte _0802D6C2 @ case 32
	.4byte _0802D6A0 @ case 33
	.4byte _0802D6AA @ case 34
	.4byte _0802D6B2 @ case 35
	.4byte _0802D6BA @ case 36
	.4byte _0802D698 @ case 37
	.4byte _0802D6F4 @ case 38
	.4byte _0802D6F4 @ case 39
	.4byte _0802D6F4 @ case 40
	.4byte _0802D6F4 @ case 41
	.4byte _0802D6F4 @ case 42
	.4byte _0802D6F4 @ case 43
	.4byte _0802D6F4 @ case 44
	.4byte _0802D6F4 @ case 45
	.4byte _0802D6C2 @ case 46
	.4byte _0802D6D6 @ case 47
	.4byte _0802D6DE @ case 48
	.4byte _0802D6F4 @ case 49
	.4byte _0802D6EE @ case 50
	.4byte _0802D6EE @ case 51
	.4byte _0802D6EE @ case 52
	.4byte _0802D6EE @ case 53
	.4byte _0802D6F4 @ case 54
	.4byte _0802D6F4 @ case 55
	.4byte _0802D6F4 @ case 56
	.4byte _0802D6F4 @ case 57
	.4byte _0802D6F4 @ case 58
	.4byte _0802D6F4 @ case 59
	.4byte _0802D6F4 @ case 60
	.4byte _0802D6C8 @ case 61
	.4byte _0802D6CE @ case 62
	.4byte _0802D6C8 @ case 63
	.4byte _0802D6F4 @ case 64
	.4byte _0802D6C8 @ case 65
	.4byte _0802D6F4 @ case 66
	.4byte _0802D6F4 @ case 67
	.4byte _0802D6F4 @ case 68
	.4byte _0802D6F4 @ case 69
	.4byte _0802D6F4 @ case 70
	.4byte _0802D6F4 @ case 71
	.4byte _0802D6F4 @ case 72
	.4byte _0802D6F4 @ case 73
	.4byte _0802D6F4 @ case 74
	.4byte _0802D6F4 @ case 75
	.4byte _0802D6C8 @ case 76
	.4byte _0802D6F4 @ case 77
	.4byte _0802D6F4 @ case 78
	.4byte _0802D6F4 @ case 79
	.4byte _0802D6A0 @ case 80
_0802D650:
	adds r0, r5, #0
	bl DoItemHealStaffAction
	b _0802D6F4
_0802D658:
	adds r0, r5, #0
	bl sub_802CC2C
	b _0802D6F4
_0802D660:
	adds r0, r5, #0
	bl sub_802CCDC
	b _0802D6F4
_0802D668:
	adds r0, r5, #0
	bl sub_802C86C
	b _0802D6F4
_0802D670:
	adds r0, r5, #0
	bl sub_802CB14
	b _0802D6F4
_0802D678:
	adds r0, r5, #0
	bl sub_802C8A8
	b _0802D6F4
_0802D680:
	adds r0, r5, #0
	bl sub_802CBC8
	b _0802D6F4
_0802D688:
	adds r0, r5, #0
	bl sub_802CD54
	b _0802D6F4
_0802D690:
	adds r0, r5, #0
	bl sub_802CD94
	b _0802D6F4
_0802D698:
	adds r0, r5, #0
	bl sub_802CF60
	b _0802D6F4
_0802D6A0:
	adds r0, r5, #0
	movs r1, #0xa
	bl sub_802CE54
	b _0802D6F4
_0802D6AA:
	adds r0, r5, #0
	bl sub_802CEB8
	b _0802D6F4
_0802D6B2:
	adds r0, r5, #0
	bl sub_802CF24
	b _0802D6F4
_0802D6BA:
	adds r0, r5, #0
	bl sub_802CFA4
	b _0802D6F4
_0802D6C2:
	bl sub_802CFE4
	b _0802D6F4
_0802D6C8:
	bl sub_802D128
	b _0802D6F4
_0802D6CE:
	adds r0, r5, #0
	bl sub_802D320
	b _0802D6F4
_0802D6D6:
	adds r0, r5, #0
	bl sub_802D388
	b _0802D6F4
_0802D6DE:
	adds r0, r5, #0
	bl sub_802D3CC
	b _0802D6F4
_0802D6E6:
	adds r0, r5, #0
	bl sub_802D40C
	b _0802D6F4
_0802D6EE:
	adds r0, r5, #0
	bl sub_802D440
_0802D6F4:
	ldr r0, _0802D710 @ =gBattleTarget
	adds r0, #0x6f
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	blt _0802D70A
	ldr r0, _0802D714 @ =gUnk_08C038A4
	adds r1, r5, #0
	bl Proc_StartBlocking
_0802D70A:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0802D710: .4byte gBattleTarget
_0802D714: .4byte gUnk_08C038A4

	thumb_func_start ApplyStatusChange
ApplyStatusChange: @ 0x0802D718
	push {r4, lr}
	ldr r0, _0802D744 @ =gBattleTarget
	adds r4, r0, #0
	adds r4, #0x6f
	movs r0, #0
	ldrsb r0, [r4, r0]
	cmp r0, #0
	blt _0802D73C
	ldr r0, _0802D748 @ =gActionSt
	ldrb r0, [r0, #0xd]
	bl GetUnit
	movs r1, #0
	ldrsb r1, [r4, r1]
	bl SetUnitStatus
	movs r0, #0xff
	strb r0, [r4]
_0802D73C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0802D744: .4byte gBattleTarget
_0802D748: .4byte gActionSt
