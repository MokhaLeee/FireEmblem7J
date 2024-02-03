	.include "macro.inc"
	.syntax unified

	thumb_func_start ForEachUnitInMovement
ForEachUnitInMovement: @ 0x08023DD0
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	ldr r0, _08023E30 @ =gBmMapSize
	movs r1, #2
	ldrsh r0, [r0, r1]
	subs r1, r0, #1
	cmp r1, #0
	blt _08023E28
_08023DE0:
	ldr r0, _08023E30 @ =gBmMapSize
	movs r2, #0
	ldrsh r0, [r0, r2]
	subs r4, r0, #1
	subs r6, r1, #1
	cmp r4, #0
	blt _08023E22
	lsls r5, r1, #2
_08023DF0:
	ldr r0, _08023E34 @ =gBmMapMovement
	ldr r0, [r0]
	adds r0, r5, r0
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _08023E1C
	ldr r0, _08023E38 @ =gBmMapUnit
	ldr r0, [r0]
	adds r0, r5, r0
	ldr r0, [r0]
	adds r1, r0, r4
	ldrb r0, [r1]
	cmp r0, #0
	beq _08023E1C
	bl GetUnit
	bl _call_via_r7
_08023E1C:
	subs r4, #1
	cmp r4, #0
	bge _08023DF0
_08023E22:
	adds r1, r6, #0
	cmp r1, #0
	bge _08023DE0
_08023E28:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08023E30: .4byte gBmMapSize
_08023E34: .4byte gBmMapMovement
_08023E38: .4byte gBmMapUnit

	thumb_func_start sub_8023E3C
sub_8023E3C: @ 0x08023E3C
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	ldr r0, _08023E9C @ =gBmMapSize
	movs r1, #2
	ldrsh r0, [r0, r1]
	subs r1, r0, #1
	cmp r1, #0
	blt _08023E94
_08023E4C:
	ldr r0, _08023E9C @ =gBmMapSize
	movs r2, #0
	ldrsh r0, [r0, r2]
	subs r4, r0, #1
	subs r6, r1, #1
	cmp r4, #0
	blt _08023E8E
	lsls r5, r1, #2
_08023E5C:
	ldr r0, _08023EA0 @ =0x0202E3E4
	ldr r0, [r0]
	adds r0, r5, r0
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _08023E88
	ldr r0, _08023EA4 @ =gBmMapUnit
	ldr r0, [r0]
	adds r0, r5, r0
	ldr r0, [r0]
	adds r1, r0, r4
	ldrb r0, [r1]
	cmp r0, #0
	beq _08023E88
	bl GetUnit
	bl _call_via_r7
_08023E88:
	subs r4, #1
	cmp r4, #0
	bge _08023E5C
_08023E8E:
	adds r1, r6, #0
	cmp r1, #0
	bge _08023E4C
_08023E94:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08023E9C: .4byte gBmMapSize
_08023EA0: .4byte 0x0202E3E4
_08023EA4: .4byte gBmMapUnit

	thumb_func_start sub_8023EA8
sub_8023EA8: @ 0x08023EA8
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	ldr r0, _08023EF8 @ =gBmMapSize
	movs r1, #2
	ldrsh r0, [r0, r1]
	subs r5, r0, #1
	cmp r5, #0
	blt _08023EF0
_08023EB8:
	ldr r0, _08023EF8 @ =gBmMapSize
	movs r1, #0
	ldrsh r0, [r0, r1]
	subs r4, r0, #1
	subs r6, r5, #1
	cmp r4, #0
	blt _08023EEA
_08023EC6:
	ldr r0, _08023EFC @ =0x0202E3E4
	ldr r1, [r0]
	lsls r0, r5, #2
	adds r0, r0, r1
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _08023EE4
	adds r0, r4, #0
	adds r1, r5, #0
	bl _call_via_r7
_08023EE4:
	subs r4, #1
	cmp r4, #0
	bge _08023EC6
_08023EEA:
	adds r5, r6, #0
	cmp r5, #0
	bge _08023EB8
_08023EF0:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08023EF8: .4byte gBmMapSize
_08023EFC: .4byte 0x0202E3E4

	thumb_func_start sub_8023F00
sub_8023F00: @ 0x08023F00
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r6, r2, #0
	bl BeginTargetList
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #1
	movs r3, #1
	bl sub_801A6B4
	movs r3, #1
	rsbs r3, r3, #0
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #0
	bl sub_801A6B4
	adds r0, r6, #0
	bl sub_8023E3C
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_8023F34
sub_8023F34: @ 0x08023F34
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r6, r2, #0
	bl BeginTargetList
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #1
	movs r3, #1
	bl sub_801A6B4
	movs r3, #1
	rsbs r3, r3, #0
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #0
	bl sub_801A6B4
	adds r0, r6, #0
	bl sub_8023EA8
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_8023F68
sub_8023F68: @ 0x08023F68
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r6, r2, #0
	bl BeginTargetList
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #2
	movs r3, #1
	bl sub_801A6B4
	movs r3, #1
	rsbs r3, r3, #0
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #0
	bl sub_801A6B4
	adds r0, r6, #0
	bl sub_8023EA8
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_8023F9C
sub_8023F9C: @ 0x08023F9C
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	mov r8, r0
	ldr r6, _08023FE8 @ =0x02033E3C
	ldr r0, [r6]
	movs r4, #0x10
	ldrsb r4, [r0, r4]
	movs r5, #0x11
	ldrsb r5, [r0, r5]
	adds r0, r4, #0
	adds r1, r5, #0
	bl BeginTargetList
	ldr r0, [r6]
	bl GetUnitMagRange
	adds r2, r0, #0
	adds r0, r4, #0
	adds r1, r5, #0
	movs r3, #1
	bl sub_801A6B4
	movs r3, #1
	rsbs r3, r3, #0
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #0
	bl sub_801A6B4
	mov r0, r8
	bl sub_8023E3C
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08023FE8: .4byte 0x02033E3C

	thumb_func_start sub_8023FEC
sub_8023FEC: @ 0x08023FEC
	push {r4, r5, r6, lr}
	movs r0, #0
	bl GetTrap
	adds r4, r0, #0
	ldrb r0, [r4, #2]
	cmp r0, #0
	beq _0802409E
	ldr r6, _080240A4 @ =gBmMapTerrain
	ldr r5, _080240A8 @ =0x0202E3E4
_08024000:
	cmp r0, #2
	bne _08024096
	ldrb r1, [r4, #1]
	ldr r0, [r6]
	lsls r3, r1, #2
	adds r0, r3, r0
	ldrb r2, [r4]
	ldr r0, [r0]
	adds r0, r0, r2
	ldrb r0, [r0]
	cmp r0, #0x1b
	bne _08024034
	ldr r0, [r5]
	adds r0, r3, r0
	ldr r0, [r0]
	adds r0, r0, r2
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _08024034
	ldrb r3, [r4, #3]
	adds r0, r2, #0
	movs r2, #0
	bl EnlistTarget
_08024034:
	ldrb r1, [r4, #1]
	ldr r0, [r6]
	lsls r3, r1, #2
	adds r0, r3, r0
	ldrb r2, [r4]
	ldr r0, [r0, #4]
	adds r0, r0, r2
	ldrb r0, [r0]
	cmp r0, #0x1b
	bne _08024066
	ldr r0, [r5]
	adds r0, r3, r0
	ldr r0, [r0, #4]
	adds r0, r0, r2
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _08024066
	adds r1, #1
	ldrb r3, [r4, #3]
	adds r0, r2, #0
	movs r2, #0
	bl EnlistTarget
_08024066:
	ldrb r1, [r4, #1]
	ldr r0, [r6]
	lsls r3, r1, #2
	adds r0, r3, r0
	ldrb r2, [r4]
	ldr r0, [r0]
	adds r0, r0, r2
	ldrb r0, [r0]
	cmp r0, #0x33
	bne _08024096
	ldr r0, [r5]
	adds r0, r3, r0
	ldr r0, [r0]
	adds r0, r0, r2
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _08024096
	ldrb r3, [r4, #3]
	adds r0, r2, #0
	movs r2, #0
	bl EnlistTarget
_08024096:
	adds r4, #8
	ldrb r0, [r4, #2]
	cmp r0, #0
	bne _08024000
_0802409E:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080240A4: .4byte gBmMapTerrain
_080240A8: .4byte 0x0202E3E4

	thumb_func_start sub_80240AC
sub_80240AC: @ 0x080240AC
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _080240E0 @ =0x02033E3C
	ldr r0, [r0]
	ldrb r0, [r0, #0xb]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	movs r1, #0xb
	ldrsb r1, [r4, r1]
	bl AreUnitIdsAllied
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080240DA
	movs r0, #0x10
	ldrsb r0, [r4, r0]
	movs r1, #0x11
	ldrsb r1, [r4, r1]
	movs r2, #0xb
	ldrsb r2, [r4, r2]
	movs r3, #0
	bl EnlistTarget
_080240DA:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080240E0: .4byte 0x02033E3C

	thumb_func_start sub_80240E4
sub_80240E4: @ 0x080240E4
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	mov r8, r1
	movs r5, #0x10
	ldrsb r5, [r0, r5]
	movs r6, #0x11
	ldrsb r6, [r0, r6]
	ldr r1, _08024140 @ =0x02033E3C
	str r0, [r1]
	adds r0, r5, #0
	adds r1, r6, #0
	bl BeginTargetList
	ldr r0, _08024144 @ =0x0202E3E4
	ldr r0, [r0]
	movs r1, #0
	bl BmMapFillg
	mov r0, r8
	bl sub_8017774
	adds r4, r0, #0
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	mov r0, r8
	bl sub_801778C
	adds r3, r0, #0
	lsls r3, r3, #0x10
	asrs r3, r3, #0x10
	adds r0, r5, #0
	adds r1, r6, #0
	adds r2, r4, #0
	bl MapAddInBoundedRange
	ldr r0, _08024148 @ =sub_80240AC
	bl sub_8023E3C
	bl sub_8023FEC
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08024140: .4byte 0x02033E3C
_08024144: .4byte 0x0202E3E4
_08024148: .4byte sub_80240AC

	thumb_func_start sub_802414C
sub_802414C: @ 0x0802414C
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r5, _080241EC @ =0x02033E3C
	ldr r0, [r5]
	ldrb r0, [r0, #0xb]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	movs r1, #0xb
	ldrsb r1, [r4, r1]
	bl AreUnitIdsSameFaction
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080241E6
	adds r1, r4, #0
	adds r1, #0x30
	movs r0, #0xf
	ldrb r1, [r1]
	ands r0, r1
	cmp r0, #4
	beq _080241AA
	ldr r0, [r5]
	ldrh r0, [r0, #0x1e]
	cmp r0, #0
	bne _08024184
	ldrh r0, [r4, #0x1e]
	cmp r0, #0
	beq _080241AA
_08024184:
	ldr r0, [r4]
	ldr r1, [r4, #4]
	ldr r0, [r0, #0x28]
	ldr r1, [r1, #0x28]
	orrs r0, r1
	movs r1, #0x80
	lsls r1, r1, #2
	ands r0, r1
	cmp r0, #0
	bne _080241AA
	movs r0, #0x10
	ldrsb r0, [r4, r0]
	movs r1, #0x11
	ldrsb r1, [r4, r1]
	movs r2, #0xb
	ldrsb r2, [r4, r2]
	movs r3, #0
	bl EnlistTarget
_080241AA:
	ldr r0, [r4, #0xc]
	movs r1, #0x10
	ands r0, r1
	cmp r0, #0
	beq _080241E6
	ldrb r0, [r4, #0x1b]
	bl GetUnit
	adds r1, r0, #0
	movs r2, #0xb
	ldrsb r2, [r1, r2]
	movs r0, #0xc0
	ands r0, r2
	cmp r0, #0
	bne _080241E6
	ldr r0, _080241EC @ =0x02033E3C
	ldr r0, [r0]
	ldrh r0, [r0, #0x1e]
	cmp r0, #0
	bne _080241D8
	ldrh r0, [r1, #0x1e]
	cmp r0, #0
	beq _080241E6
_080241D8:
	movs r0, #0x10
	ldrsb r0, [r4, r0]
	movs r1, #0x11
	ldrsb r1, [r4, r1]
	movs r3, #0
	bl EnlistTarget
_080241E6:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080241EC: .4byte 0x02033E3C

	thumb_func_start sub_80241F0
sub_80241F0: @ 0x080241F0
	push {r4, r5, r6, r7, lr}
	movs r4, #0x10
	ldrsb r4, [r0, r4]
	movs r5, #0x11
	ldrsb r5, [r0, r5]
	ldr r6, _08024258 @ =0x02033E3C
	str r0, [r6]
	ldr r0, _0802425C @ =0x0202E3E4
	ldr r0, [r0]
	movs r1, #0
	bl BmMapFillg
	ldr r7, _08024260 @ =sub_802414C
	adds r0, r4, #0
	adds r1, r5, #0
	adds r2, r7, #0
	bl sub_8023F00
	ldr r0, [r6]
	ldr r0, [r0, #0xc]
	movs r1, #0x10
	ands r0, r1
	cmp r0, #0
	beq _08024252
	bl sub_804B950
	adds r4, r0, #0
	ldr r0, [r6]
	ldrb r0, [r0, #0x1b]
	bl GetUnit
	bl _call_via_r7
	bl sub_804B950
	cmp r4, r0
	beq _08024252
	adds r0, r4, #0
	bl sub_804B95C
	ldr r1, [r6]
	ldrb r1, [r1, #0x10]
	strb r1, [r0]
	adds r0, r4, #0
	bl sub_804B95C
	ldr r1, [r6]
	ldrb r1, [r1, #0x11]
	strb r1, [r0, #1]
_08024252:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08024258: .4byte 0x02033E3C
_0802425C: .4byte 0x0202E3E4
_08024260: .4byte sub_802414C

	thumb_func_start sub_8024264
sub_8024264: @ 0x08024264
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r5, _080242C0 @ =0x02033E3C
	ldr r0, [r5]
	ldrb r0, [r0, #0xb]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	movs r1, #0xb
	ldrsb r1, [r4, r1]
	bl AreUnitIdsAllied
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080242B8
	adds r1, r4, #0
	adds r1, #0x30
	movs r0, #0xf
	ldrb r1, [r1]
	ands r0, r1
	cmp r0, #4
	beq _080242B8
	ldr r0, [r4, #0xc]
	movs r1, #0x30
	ands r0, r1
	cmp r0, #0
	bne _080242B8
	ldr r0, [r5]
	adds r1, r4, #0
	bl CanUnitRescue
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080242B8
	movs r0, #0x10
	ldrsb r0, [r4, r0]
	movs r1, #0x11
	ldrsb r1, [r4, r1]
	movs r2, #0xb
	ldrsb r2, [r4, r2]
	movs r3, #0
	bl EnlistTarget
_080242B8:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080242C0: .4byte 0x02033E3C

	thumb_func_start sub_80242C4
sub_80242C4: @ 0x080242C4
	push {r4, r5, lr}
	movs r4, #0x10
	ldrsb r4, [r0, r4]
	movs r5, #0x11
	ldrsb r5, [r0, r5]
	ldr r1, _080242EC @ =0x02033E3C
	str r0, [r1]
	ldr r0, _080242F0 @ =0x0202E3E4
	ldr r0, [r0]
	movs r1, #0
	bl BmMapFillg
	ldr r2, _080242F4 @ =sub_8024264
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_8023F00
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080242EC: .4byte 0x02033E3C
_080242F0: .4byte 0x0202E3E4
_080242F4: .4byte sub_8024264

	thumb_func_start sub_80242F8
sub_80242F8: @ 0x080242F8
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r6, r1, #0
	ldr r0, _08024344 @ =gBmMapUnit
	ldr r0, [r0]
	lsls r5, r6, #2
	adds r0, r5, r0
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r0, [r0]
	cmp r0, #0
	bne _0802433C
	ldr r0, _08024348 @ =0x02033E3C
	ldr r0, [r0]
	ldrb r0, [r0, #0x1b]
	bl GetUnit
	ldr r1, _0802434C @ =gBmMapTerrain
	ldr r1, [r1]
	adds r1, r5, r1
	ldr r1, [r1]
	adds r1, r1, r4
	ldrb r1, [r1]
	bl CanUnitCrossTerrain
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0802433C
	adds r0, r4, #0
	adds r1, r6, #0
	movs r2, #0
	movs r3, #0
	bl EnlistTarget
_0802433C:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08024344: .4byte gBmMapUnit
_08024348: .4byte 0x02033E3C
_0802434C: .4byte gBmMapTerrain

	thumb_func_start sub_8024350
sub_8024350: @ 0x08024350
	push {r4, r5, lr}
	movs r4, #0x10
	ldrsb r4, [r0, r4]
	movs r5, #0x11
	ldrsb r5, [r0, r5]
	ldr r1, _08024378 @ =0x02033E3C
	str r0, [r1]
	ldr r0, _0802437C @ =0x0202E3E4
	ldr r0, [r0]
	movs r1, #0
	bl BmMapFillg
	ldr r2, _08024380 @ =sub_80242F8
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_8023F34
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08024378: .4byte 0x02033E3C
_0802437C: .4byte 0x0202E3E4
_08024380: .4byte sub_80242F8

	thumb_func_start sub_8024384
sub_8024384: @ 0x08024384
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r4, _080243EC @ =0x02033E3C
	ldr r0, [r4]
	ldrb r0, [r0, #0xb]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	movs r1, #0xb
	ldrsb r1, [r5, r1]
	bl AreUnitIdsSameFaction
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080243E6
	ldr r0, [r5, #0xc]
	movs r1, #0x10
	ands r0, r1
	cmp r0, #0
	beq _080243E6
	ldr r0, [r5]
	ldr r1, [r5, #4]
	ldr r0, [r0, #0x28]
	ldr r1, [r1, #0x28]
	orrs r0, r1
	movs r1, #0x80
	lsls r1, r1, #2
	ands r0, r1
	cmp r0, #0
	bne _080243E6
	ldr r4, [r4]
	ldrb r0, [r5, #0x1b]
	bl GetUnit
	adds r1, r0, #0
	adds r0, r4, #0
	bl CanUnitRescue
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080243E6
	movs r0, #0x10
	ldrsb r0, [r5, r0]
	movs r1, #0x11
	ldrsb r1, [r5, r1]
	movs r2, #0xb
	ldrsb r2, [r5, r2]
	movs r3, #0
	bl EnlistTarget
_080243E6:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080243EC: .4byte 0x02033E3C

	thumb_func_start sub_80243F0
sub_80243F0: @ 0x080243F0
	push {r4, r5, lr}
	movs r4, #0x10
	ldrsb r4, [r0, r4]
	movs r5, #0x11
	ldrsb r5, [r0, r5]
	ldr r1, _08024418 @ =0x02033E3C
	str r0, [r1]
	ldr r0, _0802441C @ =0x0202E3E4
	ldr r0, [r0]
	movs r1, #0
	bl BmMapFillg
	ldr r2, _08024420 @ =sub_8024384
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_8023F00
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08024418: .4byte 0x02033E3C
_0802441C: .4byte 0x0202E3E4
_08024420: .4byte sub_8024384

	thumb_func_start sub_8024424
sub_8024424: @ 0x08024424
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r5, _080244A0 @ =0x02033E3C
	ldr r0, [r5]
	ldrb r0, [r0, #0xb]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	movs r1, #0xb
	ldrsb r1, [r4, r1]
	bl AreUnitIdsSameFaction
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08024498
	ldr r0, [r4, #0xc]
	movs r1, #0x10
	ands r0, r1
	cmp r0, #0
	bne _08024498
	adds r0, r4, #0
	adds r0, #0x30
	movs r1, #0xf
	ldrb r0, [r0]
	ands r1, r0
	cmp r1, #4
	beq _08024498
	cmp r1, #2
	beq _08024498
	ldr r0, [r4]
	ldr r1, [r4, #4]
	ldr r0, [r0, #0x28]
	ldr r1, [r1, #0x28]
	orrs r0, r1
	movs r1, #0x80
	lsls r1, r1, #2
	ands r0, r1
	cmp r0, #0
	bne _08024498
	ldr r0, [r5]
	ldrb r0, [r0, #0x1b]
	bl GetUnit
	adds r1, r0, #0
	adds r0, r4, #0
	bl CanUnitRescue
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08024498
	movs r0, #0x10
	ldrsb r0, [r4, r0]
	movs r1, #0x11
	ldrsb r1, [r4, r1]
	movs r2, #0xb
	ldrsb r2, [r4, r2]
	movs r3, #0
	bl EnlistTarget
_08024498:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080244A0: .4byte 0x02033E3C

	thumb_func_start sub_80244A4
sub_80244A4: @ 0x080244A4
	push {r4, r5, lr}
	movs r4, #0x10
	ldrsb r4, [r0, r4]
	movs r5, #0x11
	ldrsb r5, [r0, r5]
	ldr r1, _080244CC @ =0x02033E3C
	str r0, [r1]
	ldr r0, _080244D0 @ =0x0202E3E4
	ldr r0, [r0]
	movs r1, #0
	bl BmMapFillg
	ldr r2, _080244D4 @ =sub_8024424
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_8023F00
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080244CC: .4byte 0x02033E3C
_080244D0: .4byte 0x0202E3E4
_080244D4: .4byte sub_8024424

	thumb_func_start sub_80244D8
sub_80244D8: @ 0x080244D8
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x30
	movs r1, #0xf
	ldrb r0, [r0]
	ands r1, r0
	cmp r1, #4
	beq _08024516
	cmp r1, #2
	beq _08024516
	ldr r0, _0802451C @ =0x02033E3C
	ldr r0, [r0]
	ldr r0, [r0]
	ldrb r0, [r0, #4]
	ldr r1, [r4]
	ldrb r1, [r1, #4]
	bl sub_80791CC
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08024516
	movs r0, #0x10
	ldrsb r0, [r4, r0]
	movs r1, #0x11
	ldrsb r1, [r4, r1]
	movs r2, #0xb
	ldrsb r2, [r4, r2]
	ldr r3, [r4]
	ldrb r3, [r3, #4]
	bl EnlistTarget
_08024516:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0802451C: .4byte 0x02033E3C

	thumb_func_start sub_8024520
sub_8024520: @ 0x08024520
	push {r4, r5, lr}
	movs r4, #0x10
	ldrsb r4, [r0, r4]
	movs r5, #0x11
	ldrsb r5, [r0, r5]
	ldr r1, _08024548 @ =0x02033E3C
	str r0, [r1]
	ldr r0, _0802454C @ =0x0202E3E4
	ldr r0, [r0]
	movs r1, #0
	bl BmMapFillg
	ldr r2, _08024550 @ =sub_80244D8
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_8023F00
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08024548: .4byte 0x02033E3C
_0802454C: .4byte 0x0202E3E4
_08024550: .4byte sub_80244D8

	thumb_func_start sub_8024554
sub_8024554: @ 0x08024554
	push {r4, r5, r6, r7, lr}
	ldr r4, _080245F8 @ =0x02033E3C
	str r0, [r4]
	movs r2, #0x10
	ldrsb r2, [r0, r2]
	movs r1, #0x11
	ldrsb r1, [r0, r1]
	adds r0, r2, #0
	bl BeginTargetList
	ldr r0, [r4]
	bl GetUnitSupporterCount
	adds r6, r0, #0
	movs r5, #0
	cmp r5, r6
	bge _080245F2
	adds r7, r4, #0
_08024578:
	ldr r0, [r7]
	adds r1, r5, #0
	bl GetUnitSupportUnit
	adds r4, r0, #0
	cmp r4, #0
	beq _080245EC
	ldr r3, [r7]
	movs r2, #0x10
	ldrsb r2, [r3, r2]
	movs r0, #0x10
	ldrsb r0, [r4, r0]
	subs r1, r2, r0
	cmp r1, #0
	bge _08024598
	subs r1, r0, r2
_08024598:
	ldrb r3, [r3, #0x11]
	lsls r3, r3, #0x18
	asrs r3, r3, #0x18
	movs r2, #0x11
	ldrsb r2, [r4, r2]
	subs r0, r3, r2
	cmp r0, #0
	bge _080245AA
	subs r0, r2, r3
_080245AA:
	adds r0, r1, r0
	cmp r0, #1
	bne _080245EC
	ldr r0, [r7]
	adds r1, r5, #0
	bl sub_8026C04
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080245EC
	ldr r0, [r4, #0xc]
	ldr r1, _080245FC @ =0x0001002C
	ands r0, r1
	cmp r0, #0
	bne _080245EC
	adds r0, r4, #0
	adds r0, #0x30
	movs r1, #0xf
	ldrb r0, [r0]
	ands r1, r0
	cmp r1, #4
	beq _080245EC
	cmp r1, #2
	beq _080245EC
	movs r0, #0x10
	ldrsb r0, [r4, r0]
	movs r1, #0x11
	ldrsb r1, [r4, r1]
	movs r2, #0xb
	ldrsb r2, [r4, r2]
	adds r3, r5, #0
	bl EnlistTarget
_080245EC:
	adds r5, #1
	cmp r5, r6
	blt _08024578
_080245F2:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080245F8: .4byte 0x02033E3C
_080245FC: .4byte 0x0001002C

	thumb_func_start sub_8024600
sub_8024600: @ 0x08024600
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08024634 @ =0x02033E3C
	ldr r0, [r0]
	ldrb r0, [r0, #0xb]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	movs r1, #0xb
	ldrsb r1, [r4, r1]
	bl AreUnitIdsAllied
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0802462E
	movs r0, #0x10
	ldrsb r0, [r4, r0]
	movs r1, #0x11
	ldrsb r1, [r4, r1]
	movs r2, #0xb
	ldrsb r2, [r4, r2]
	movs r3, #1
	bl EnlistTarget
_0802462E:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08024634: .4byte 0x02033E3C

	thumb_func_start sub_8024638
sub_8024638: @ 0x08024638
	push {r4, r5, r6, r7, lr}
	movs r5, #0x10
	ldrsb r5, [r0, r5]
	movs r6, #0x11
	ldrsb r6, [r0, r6]
	ldr r1, _08024698 @ =0x02033E3C
	str r0, [r1]
	adds r0, r5, #0
	adds r1, r6, #0
	bl BeginTargetList
	adds r0, r5, #0
	adds r1, r6, #0
	bl sub_8034BE8
	adds r7, r0, #0
	cmp r7, #0
	beq _08024692
	ldr r0, _0802469C @ =0x0202E3E4
	ldr r0, [r0]
	movs r1, #0
	bl BmMapFillg
	adds r0, r7, #0
	bl sub_8017774
	adds r4, r0, #0
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	adds r0, r7, #0
	bl sub_801778C
	adds r3, r0, #0
	lsls r3, r3, #0x10
	asrs r3, r3, #0x10
	adds r0, r5, #0
	adds r1, r6, #0
	adds r2, r4, #0
	bl MapAddInBoundedRange
	ldr r0, _080246A0 @ =sub_8024600
	bl sub_8023E3C
	bl sub_8023FEC
_08024692:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08024698: .4byte 0x02033E3C
_0802469C: .4byte 0x0202E3E4
_080246A0: .4byte sub_8024600

	thumb_func_start sub_80246A4
sub_80246A4: @ 0x080246A4
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r0, _080246E0 @ =gBmMapTerrain
	ldr r1, [r0]
	lsls r0, r5, #2
	adds r0, r0, r1
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r0, [r0]
	cmp r0, #0x1e
	bne _080246DA
	lsls r0, r4, #0x18
	asrs r0, r0, #0x18
	lsls r1, r5, #0x18
	asrs r1, r1, #0x18
	bl sub_80796F4
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080246DA
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #0x1e
	movs r3, #0
	bl EnlistTarget
_080246DA:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080246E0: .4byte gBmMapTerrain

	thumb_func_start sub_80246E4
sub_80246E4: @ 0x080246E4
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r0, _08024720 @ =gBmMapTerrain
	ldr r1, [r0]
	lsls r0, r5, #2
	adds r0, r0, r1
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r0, [r0]
	cmp r0, #0x14
	bne _0802471A
	lsls r0, r4, #0x18
	asrs r0, r0, #0x18
	lsls r1, r5, #0x18
	asrs r1, r1, #0x18
	bl sub_80796F4
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0802471A
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #0x14
	movs r3, #0
	bl EnlistTarget
_0802471A:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08024720: .4byte gBmMapTerrain

	thumb_func_start sub_8024724
sub_8024724: @ 0x08024724
	push {r4, r5, r6, lr}
	adds r4, r1, #0
	movs r5, #0x10
	ldrsb r5, [r0, r5]
	movs r6, #0x11
	ldrsb r6, [r0, r6]
	ldr r1, _08024754 @ =0x02033E3C
	str r0, [r1]
	ldr r0, _08024758 @ =0x0202E3E4
	ldr r0, [r0]
	movs r1, #0
	bl BmMapFillg
	cmp r4, #0x14
	beq _08024760
	cmp r4, #0x1e
	bne _0802476A
	ldr r2, _0802475C @ =sub_80246A4
	adds r0, r5, #0
	adds r1, r6, #0
	bl sub_8023F34
	b _0802476A
	.align 2, 0
_08024754: .4byte 0x02033E3C
_08024758: .4byte 0x0202E3E4
_0802475C: .4byte sub_80246A4
_08024760:
	ldr r2, _08024770 @ =sub_80246E4
	adds r0, r5, #0
	adds r1, r6, #0
	bl sub_8023F34
_0802476A:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08024770: .4byte sub_80246E4

	thumb_func_start sub_8024774
sub_8024774: @ 0x08024774
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	mov r8, r0
	movs r0, #0
	movs r1, #0
	bl BeginTargetList
	mov r7, r8
	b _0802482C
_08024788:
	adds r0, r7, #0
	bl GetUnit
	adds r5, r0, #0
	cmp r5, #0
	beq _0802482C
	ldr r0, [r5]
	cmp r0, #0
	beq _0802482C
	ldr r0, [r5, #0xc]
	ldr r1, _08024840 @ =0x0001002C
	ands r0, r1
	cmp r0, #0
	bne _0802482C
	movs r1, #0x11
	ldrsb r1, [r5, r1]
	ldr r0, _08024844 @ =gBmMapTerrain
	ldr r0, [r0]
	lsls r1, r1, #2
	adds r1, r1, r0
	movs r2, #0x10
	ldrsb r2, [r5, r2]
	ldr r0, [r1]
	adds r0, r0, r2
	ldrb r6, [r0]
	adds r0, r6, #0
	bl GetTerrainHealAmount
	cmp r0, #0
	beq _080247FE
	adds r0, r5, #0
	bl GetUnitCurrentHp
	adds r4, r0, #0
	adds r0, r5, #0
	bl GetUnitMaxHp
	cmp r4, r0
	beq _080247FE
	adds r0, r6, #0
	bl GetTerrainHealAmount
	adds r4, r0, #0
	adds r0, r5, #0
	bl GetUnitMaxHp
	muls r0, r4, r0
	movs r1, #0x64
	bl __divsi3
	adds r3, r0, #0
	movs r0, #0x10
	ldrsb r0, [r5, r0]
	movs r1, #0x11
	ldrsb r1, [r5, r1]
	movs r2, #0xb
	ldrsb r2, [r5, r2]
	bl EnlistTarget
_080247FE:
	adds r0, r6, #0
	bl GetTerrainHealsStatus
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0802482C
	adds r1, r5, #0
	adds r1, #0x30
	movs r0, #0xf
	ldrb r1, [r1]
	ands r0, r1
	cmp r0, #0
	beq _0802482C
	movs r0, #0x10
	ldrsb r0, [r5, r0]
	movs r1, #0x11
	ldrsb r1, [r5, r1]
	movs r2, #0xb
	ldrsb r2, [r5, r2]
	movs r3, #1
	rsbs r3, r3, #0
	bl EnlistTarget
_0802482C:
	adds r7, #1
	mov r0, r8
	adds r0, #0x40
	cmp r7, r0
	blt _08024788
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08024840: .4byte 0x0001002C
_08024844: .4byte gBmMapTerrain

	thumb_func_start sub_8024848
sub_8024848: @ 0x08024848
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	mov r8, r0
	movs r0, #0
	movs r1, #0
	bl BeginTargetList
	mov r7, r8
	b _080248A6
_0802485C:
	adds r0, r7, #0
	bl GetUnit
	adds r2, r0, #0
	cmp r2, #0
	beq _080248A6
	ldr r0, [r2]
	cmp r0, #0
	beq _080248A6
	ldr r0, [r2, #0xc]
	ldr r1, _080248BC @ =0x0001002C
	ands r0, r1
	cmp r0, #0
	bne _080248A6
	adds r1, r2, #0
	adds r1, #0x30
	movs r0, #0xf
	ldrb r1, [r1]
	ands r0, r1
	cmp r0, #1
	bne _080248A6
	movs r4, #0x10
	ldrsb r4, [r2, r4]
	movs r5, #0x11
	ldrsb r5, [r2, r5]
	movs r6, #0xb
	ldrsb r6, [r2, r6]
	movs r0, #3
	bl RandNext
	adds r3, r0, #0
	adds r3, #1
	adds r0, r4, #0
	adds r1, r5, #0
	adds r2, r6, #0
	bl EnlistTarget
_080248A6:
	adds r7, #1
	mov r0, r8
	adds r0, #0x40
	cmp r7, r0
	blt _0802485C
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080248BC: .4byte 0x0001002C

	thumb_func_start sub_80248C0
sub_80248C0: @ 0x080248C0
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08024900 @ =0x02033E3C
	ldr r0, [r0]
	ldrb r0, [r0, #0xb]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	movs r1, #0xb
	ldrsb r1, [r4, r1]
	bl AreUnitIdsSameFaction
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080248F8
	ldr r0, [r4, #0xc]
	movs r1, #2
	ands r0, r1
	cmp r0, #0
	beq _080248F8
	movs r0, #0x10
	ldrsb r0, [r4, r0]
	movs r1, #0x11
	ldrsb r1, [r4, r1]
	movs r2, #0xb
	ldrsb r2, [r4, r2]
	movs r3, #0
	bl EnlistTarget
_080248F8:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08024900: .4byte 0x02033E3C

	thumb_func_start sub_8024904
sub_8024904: @ 0x08024904
	push {r4, r5, lr}
	movs r4, #0x10
	ldrsb r4, [r0, r4]
	movs r5, #0x11
	ldrsb r5, [r0, r5]
	ldr r1, _0802492C @ =0x02033E3C
	str r0, [r1]
	ldr r0, _08024930 @ =0x0202E3E4
	ldr r0, [r0]
	movs r1, #0
	bl BmMapFillg
	ldr r2, _08024934 @ =sub_80248C0
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_8023F00
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0802492C: .4byte 0x02033E3C
_08024930: .4byte 0x0202E3E4
_08024934: .4byte sub_80248C0

	thumb_func_start sub_8024938
sub_8024938: @ 0x08024938
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	movs r0, #0xc0
	ldrb r1, [r5, #0xb]
	ands r0, r1
	cmp r0, #0x80
	bne _08024988
	ldr r0, _0802497C @ =gActiveUnit
	ldr r0, [r0]
	movs r1, #0x16
	ldrsb r1, [r0, r1]
	movs r0, #0x16
	ldrsb r0, [r5, r0]
	cmp r1, r0
	blt _08024988
	movs r6, #0
	adds r4, r5, #0
	adds r4, #0x1e
_0802495C:
	ldrh r0, [r4]
	bl sub_801718C
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08024980
	movs r0, #0x10
	ldrsb r0, [r5, r0]
	movs r1, #0x11
	ldrsb r1, [r5, r1]
	movs r2, #0xb
	ldrsb r2, [r5, r2]
	movs r3, #0
	bl EnlistTarget
	b _08024988
	.align 2, 0
_0802497C: .4byte gActiveUnit
_08024980:
	adds r4, #2
	adds r6, #1
	cmp r6, #4
	ble _0802495C
_08024988:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_8024990
sub_8024990: @ 0x08024990
	push {r4, r5, lr}
	movs r4, #0x10
	ldrsb r4, [r0, r4]
	movs r5, #0x11
	ldrsb r5, [r0, r5]
	ldr r1, _080249B8 @ =0x02033E3C
	str r0, [r1]
	ldr r0, _080249BC @ =0x0202E3E4
	ldr r0, [r0]
	movs r1, #0
	bl BmMapFillg
	ldr r2, _080249C0 @ =sub_8024938
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_8023F00
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080249B8: .4byte 0x02033E3C
_080249BC: .4byte 0x0202E3E4
_080249C0: .4byte sub_8024938

	thumb_func_start sub_80249C4
sub_80249C4: @ 0x080249C4
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r0, _08024A14 @ =0x02033E3C
	ldr r0, [r0]
	ldrb r0, [r0, #0xb]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	movs r1, #0xb
	ldrsb r1, [r5, r1]
	bl AreUnitIdsAllied
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08024A0E
	ldr r0, [r5, #0xc]
	movs r1, #0x20
	ands r0, r1
	cmp r0, #0
	bne _08024A0E
	adds r0, r5, #0
	bl GetUnitCurrentHp
	adds r4, r0, #0
	adds r0, r5, #0
	bl GetUnitMaxHp
	cmp r4, r0
	beq _08024A0E
	movs r0, #0x10
	ldrsb r0, [r5, r0]
	movs r1, #0x11
	ldrsb r1, [r5, r1]
	movs r2, #0xb
	ldrsb r2, [r5, r2]
	movs r3, #0
	bl EnlistTarget
_08024A0E:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08024A14: .4byte 0x02033E3C

	thumb_func_start sub_8024A18
sub_8024A18: @ 0x08024A18
	push {r4, r5, lr}
	movs r4, #0x10
	ldrsb r4, [r0, r4]
	movs r5, #0x11
	ldrsb r5, [r0, r5]
	ldr r1, _08024A40 @ =0x02033E3C
	str r0, [r1]
	ldr r0, _08024A44 @ =0x0202E3E4
	ldr r0, [r0]
	movs r1, #0
	bl BmMapFillg
	ldr r2, _08024A48 @ =sub_80249C4
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_8023F00
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08024A40: .4byte 0x02033E3C
_08024A44: .4byte 0x0202E3E4
_08024A48: .4byte sub_80249C4

	thumb_func_start sub_8024A4C
sub_8024A4C: @ 0x08024A4C
	push {r4, r5, r6, lr}
	movs r5, #0x10
	ldrsb r5, [r0, r5]
	movs r6, #0x11
	ldrsb r6, [r0, r6]
	ldr r4, _08024A8C @ =0x02033E3C
	str r0, [r4]
	adds r0, r5, #0
	adds r1, r6, #0
	bl BeginTargetList
	ldr r0, _08024A90 @ =0x0202E3E4
	ldr r0, [r0]
	movs r1, #0
	bl BmMapFillg
	ldr r0, [r4]
	bl GetUnitMagRange
	adds r2, r0, #0
	adds r0, r5, #0
	adds r1, r6, #0
	movs r3, #1
	bl sub_801A6B4
	ldr r0, _08024A94 @ =sub_80249C4
	bl sub_8023E3C
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08024A8C: .4byte 0x02033E3C
_08024A90: .4byte 0x0202E3E4
_08024A94: .4byte sub_80249C4

	thumb_func_start sub_8024A98
sub_8024A98: @ 0x08024A98
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08024AE4 @ =0x02033E3C
	ldr r0, [r0]
	ldrb r0, [r0, #0xb]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	movs r1, #0xb
	ldrsb r1, [r4, r1]
	bl AreUnitIdsAllied
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08024ADE
	ldr r0, [r4, #0xc]
	movs r1, #0x20
	ands r0, r1
	cmp r0, #0
	bne _08024ADE
	adds r1, r4, #0
	adds r1, #0x30
	movs r0, #0xf
	ldrb r1, [r1]
	ands r0, r1
	cmp r0, #0
	beq _08024ADE
	movs r0, #0x10
	ldrsb r0, [r4, r0]
	movs r1, #0x11
	ldrsb r1, [r4, r1]
	movs r2, #0xb
	ldrsb r2, [r4, r2]
	movs r3, #0
	bl EnlistTarget
_08024ADE:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08024AE4: .4byte 0x02033E3C

	thumb_func_start sub_8024AE8
sub_8024AE8: @ 0x08024AE8
	push {r4, r5, lr}
	movs r4, #0x10
	ldrsb r4, [r0, r4]
	movs r5, #0x11
	ldrsb r5, [r0, r5]
	ldr r1, _08024B10 @ =0x02033E3C
	str r0, [r1]
	ldr r0, _08024B14 @ =0x0202E3E4
	ldr r0, [r0]
	movs r1, #0
	bl BmMapFillg
	ldr r2, _08024B18 @ =sub_8024A98
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_8023F00
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08024B10: .4byte 0x02033E3C
_08024B14: .4byte 0x0202E3E4
_08024B18: .4byte sub_8024A98

	thumb_func_start sub_8024B1C
sub_8024B1C: @ 0x08024B1C
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08024B68 @ =0x02033E3C
	ldr r0, [r0]
	ldrb r0, [r0, #0xb]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	movs r1, #0xb
	ldrsb r1, [r4, r1]
	bl AreUnitIdsAllied
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08024B60
	ldr r0, [r4, #0xc]
	movs r1, #0x20
	ands r0, r1
	cmp r0, #0
	bne _08024B60
	adds r0, r4, #0
	adds r0, #0x31
	ldrb r0, [r0]
	lsrs r0, r0, #4
	cmp r0, #6
	bhi _08024B60
	movs r0, #0x10
	ldrsb r0, [r4, r0]
	movs r1, #0x11
	ldrsb r1, [r4, r1]
	movs r2, #0xb
	ldrsb r2, [r4, r2]
	movs r3, #0
	bl EnlistTarget
_08024B60:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08024B68: .4byte 0x02033E3C

	thumb_func_start sub_8024B6C
sub_8024B6C: @ 0x08024B6C
	push {r4, r5, lr}
	movs r4, #0x10
	ldrsb r4, [r0, r4]
	movs r5, #0x11
	ldrsb r5, [r0, r5]
	ldr r1, _08024B94 @ =0x02033E3C
	str r0, [r1]
	ldr r0, _08024B98 @ =0x0202E3E4
	ldr r0, [r0]
	movs r1, #0
	bl BmMapFillg
	ldr r2, _08024B9C @ =sub_8024B1C
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_8023F00
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08024B94: .4byte 0x02033E3C
_08024B98: .4byte 0x0202E3E4
_08024B9C: .4byte sub_8024B1C

	thumb_func_start sub_8024BA0
sub_8024BA0: @ 0x08024BA0
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08024BD4 @ =0x02033E3C
	ldr r0, [r0]
	ldrb r0, [r0, #0xb]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	movs r1, #0xb
	ldrsb r1, [r4, r1]
	bl AreUnitIdsAllied
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08024BCE
	movs r0, #0x10
	ldrsb r0, [r4, r0]
	movs r1, #0x11
	ldrsb r1, [r4, r1]
	movs r2, #0xb
	ldrsb r2, [r4, r2]
	movs r3, #0
	bl EnlistTarget
_08024BCE:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08024BD4: .4byte 0x02033E3C

	thumb_func_start sub_8024BD8
sub_8024BD8: @ 0x08024BD8
	push {lr}
	ldr r1, _08024BF4 @ =0x02033E3C
	str r0, [r1]
	ldr r0, _08024BF8 @ =0x0202E3E4
	ldr r0, [r0]
	movs r1, #0
	bl BmMapFillg
	ldr r0, _08024BFC @ =sub_8024BA0
	bl sub_8023F9C
	pop {r0}
	bx r0
	.align 2, 0
_08024BF4: .4byte 0x02033E3C
_08024BF8: .4byte 0x0202E3E4
_08024BFC: .4byte sub_8024BA0

	thumb_func_start sub_8024C00
sub_8024C00: @ 0x08024C00
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08024C48 @ =0x02033E3C
	ldr r0, [r0]
	ldrb r0, [r0, #0xb]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	movs r1, #0xb
	ldrsb r1, [r4, r1]
	bl AreUnitIdsAllied
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08024C40
	adds r0, r4, #0
	adds r0, #0x30
	movs r1, #0xf
	ldrb r0, [r0]
	ands r1, r0
	cmp r1, #0
	beq _08024C2E
	cmp r1, #3
	bne _08024C40
_08024C2E:
	movs r0, #0x10
	ldrsb r0, [r4, r0]
	movs r1, #0x11
	ldrsb r1, [r4, r1]
	movs r2, #0xb
	ldrsb r2, [r4, r2]
	movs r3, #0
	bl EnlistTarget
_08024C40:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08024C48: .4byte 0x02033E3C

	thumb_func_start sub_8024C4C
sub_8024C4C: @ 0x08024C4C
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08024C94 @ =0x02033E3C
	ldr r0, [r0]
	ldrb r0, [r0, #0xb]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	movs r1, #0xb
	ldrsb r1, [r4, r1]
	bl AreUnitIdsAllied
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08024C8C
	adds r0, r4, #0
	adds r0, #0x30
	movs r1, #0xf
	ldrb r0, [r0]
	ands r1, r0
	cmp r1, #0
	beq _08024C7A
	cmp r1, #2
	bne _08024C8C
_08024C7A:
	movs r0, #0x10
	ldrsb r0, [r4, r0]
	movs r1, #0x11
	ldrsb r1, [r4, r1]
	movs r2, #0xb
	ldrsb r2, [r4, r2]
	movs r3, #0
	bl EnlistTarget
_08024C8C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08024C94: .4byte 0x02033E3C

	thumb_func_start sub_8024C98
sub_8024C98: @ 0x08024C98
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08024CE0 @ =0x02033E3C
	ldr r0, [r0]
	ldrb r0, [r0, #0xb]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	movs r1, #0xb
	ldrsb r1, [r4, r1]
	bl AreUnitIdsAllied
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08024CD8
	adds r0, r4, #0
	adds r0, #0x30
	movs r1, #0xf
	ldrb r0, [r0]
	ands r1, r0
	cmp r1, #0
	beq _08024CC6
	cmp r1, #4
	bne _08024CD8
_08024CC6:
	movs r0, #0x10
	ldrsb r0, [r4, r0]
	movs r1, #0x11
	ldrsb r1, [r4, r1]
	movs r2, #0xb
	ldrsb r2, [r4, r2]
	movs r3, #0
	bl EnlistTarget
_08024CD8:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08024CE0: .4byte 0x02033E3C

	thumb_func_start sub_8024CE4
sub_8024CE4: @ 0x08024CE4
	push {lr}
	ldr r1, _08024D00 @ =0x02033E3C
	str r0, [r1]
	ldr r0, _08024D04 @ =0x0202E3E4
	ldr r0, [r0]
	movs r1, #0
	bl BmMapFillg
	ldr r0, _08024D08 @ =sub_8024C00
	bl sub_8023F9C
	pop {r0}
	bx r0
	.align 2, 0
_08024D00: .4byte 0x02033E3C
_08024D04: .4byte 0x0202E3E4
_08024D08: .4byte sub_8024C00

	thumb_func_start sub_8024D0C
sub_8024D0C: @ 0x08024D0C
	push {lr}
	ldr r1, _08024D28 @ =0x02033E3C
	str r0, [r1]
	ldr r0, _08024D2C @ =0x0202E3E4
	ldr r0, [r0]
	movs r1, #0
	bl BmMapFillg
	ldr r0, _08024D30 @ =sub_8024C4C
	bl sub_8023F9C
	pop {r0}
	bx r0
	.align 2, 0
_08024D28: .4byte 0x02033E3C
_08024D2C: .4byte 0x0202E3E4
_08024D30: .4byte sub_8024C4C

	thumb_func_start sub_8024D34
sub_8024D34: @ 0x08024D34
	push {lr}
	ldr r1, _08024D50 @ =0x02033E3C
	str r0, [r1]
	ldr r0, _08024D54 @ =0x0202E3E4
	ldr r0, [r0]
	movs r1, #0
	bl BmMapFillg
	ldr r0, _08024D58 @ =sub_8024C98
	bl sub_8023F9C
	pop {r0}
	bx r0
	.align 2, 0
_08024D50: .4byte 0x02033E3C
_08024D54: .4byte 0x0202E3E4
_08024D58: .4byte sub_8024C98

	thumb_func_start sub_8024D5C
sub_8024D5C: @ 0x08024D5C
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08024D90 @ =0x02033E3C
	ldr r0, [r0]
	ldrb r0, [r0, #0xb]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	movs r1, #0xb
	ldrsb r1, [r4, r1]
	bl AreUnitIdsAllied
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08024D8A
	movs r0, #0x10
	ldrsb r0, [r4, r0]
	movs r1, #0x11
	ldrsb r1, [r4, r1]
	movs r2, #0xb
	ldrsb r2, [r4, r2]
	movs r3, #0
	bl EnlistTarget
_08024D8A:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08024D90: .4byte 0x02033E3C

	thumb_func_start sub_8024D94
sub_8024D94: @ 0x08024D94
	push {r4, r5, lr}
	movs r4, #0x10
	ldrsb r4, [r0, r4]
	movs r5, #0x11
	ldrsb r5, [r0, r5]
	ldr r1, _08024DBC @ =0x02033E3C
	str r0, [r1]
	ldr r0, _08024DC0 @ =0x0202E3E4
	ldr r0, [r0]
	movs r1, #0
	bl BmMapFillg
	ldr r2, _08024DC4 @ =sub_8024D5C
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_8023F00
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08024DBC: .4byte 0x02033E3C
_08024DC0: .4byte 0x0202E3E4
_08024DC4: .4byte sub_8024D5C

	thumb_func_start sub_8024DC8
sub_8024DC8: @ 0x08024DC8
	push {r4, r5, lr}
	movs r4, #0x10
	ldrsb r4, [r0, r4]
	movs r5, #0x11
	ldrsb r5, [r0, r5]
	ldr r1, _08024DF0 @ =0x02033E3C
	str r0, [r1]
	ldr r0, _08024DF4 @ =0x0202E3E4
	ldr r0, [r0]
	movs r1, #0
	bl BmMapFillg
	ldr r2, _08024DF8 @ =sub_80246A4
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_8023F68
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08024DF0: .4byte 0x02033E3C
_08024DF4: .4byte 0x0202E3E4
_08024DF8: .4byte sub_80246A4

	thumb_func_start sub_8024DFC
sub_8024DFC: @ 0x08024DFC
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r0, _08024E1C @ =0x02033E3C
	ldr r0, [r0]
	ldrb r0, [r0, #0xb]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	movs r1, #0xb
	ldrsb r1, [r4, r1]
	bl AreUnitIdsSameFaction
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08024E4C
	movs r5, #0
	b _08024E22
	.align 2, 0
_08024E1C: .4byte 0x02033E3C
_08024E20:
	adds r5, #1
_08024E22:
	cmp r5, #4
	bgt _08024E4C
	lsls r1, r5, #1
	adds r0, r4, #0
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r0, [r0]
	bl sub_80171B4
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08024E20
	movs r0, #0x10
	ldrsb r0, [r4, r0]
	movs r1, #0x11
	ldrsb r1, [r4, r1]
	movs r2, #0xb
	ldrsb r2, [r4, r2]
	movs r3, #0
	bl EnlistTarget
_08024E4C:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_8024E54
sub_8024E54: @ 0x08024E54
	push {r4, r5, lr}
	movs r4, #0x10
	ldrsb r4, [r0, r4]
	movs r5, #0x11
	ldrsb r5, [r0, r5]
	ldr r1, _08024E7C @ =0x02033E3C
	str r0, [r1]
	ldr r0, _08024E80 @ =0x0202E3E4
	ldr r0, [r0]
	movs r1, #0
	bl BmMapFillg
	ldr r2, _08024E84 @ =sub_8024DFC
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_8023F00
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08024E7C: .4byte 0x02033E3C
_08024E80: .4byte 0x0202E3E4
_08024E84: .4byte sub_8024DFC

	thumb_func_start sub_8024E88
sub_8024E88: @ 0x08024E88
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	mov r8, r0
	ldrb r0, [r0, #0x10]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	mov r2, r8
	movs r1, #0x11
	ldrsb r1, [r2, r1]
	bl BeginTargetList
	bl GetActiveFactionAlliance
	adds r7, r0, #0
	adds r6, r7, #1
	b _08024F00
_08024EAA:
	adds r0, r6, #0
	bl GetUnit
	adds r5, r0, #0
	cmp r5, #0
	beq _08024EFC
	ldr r0, [r5]
	cmp r0, #0
	beq _08024EFC
	ldr r0, [r5, #0xc]
	ldr r1, _08024F10 @ =0x0001000C
	ands r0, r1
	cmp r0, #0
	bne _08024EFC
	adds r0, r5, #0
	bl GetUnitCurrentHp
	adds r4, r0, #0
	adds r0, r5, #0
	bl GetUnitMaxHp
	cmp r4, r0
	bne _08024EE6
	adds r1, r5, #0
	adds r1, #0x30
	movs r0, #0xf
	ldrb r1, [r1]
	ands r0, r1
	cmp r0, #0
	beq _08024EFC
_08024EE6:
	cmp r5, r8
	beq _08024EFC
	movs r0, #0x10
	ldrsb r0, [r5, r0]
	movs r1, #0x11
	ldrsb r1, [r5, r1]
	movs r2, #0xb
	ldrsb r2, [r5, r2]
	movs r3, #0
	bl EnlistTarget
_08024EFC:
	adds r6, #1
	adds r0, r7, #0
_08024F00:
	adds r0, #0x80
	cmp r6, r0
	blt _08024EAA
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08024F10: .4byte 0x0001000C

	thumb_func_start sub_8024F14
sub_8024F14: @ 0x08024F14
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	mov r8, r0
	bl sub_804B950
	adds r7, r0, #0
	movs r6, #0
	cmp r6, r7
	bge _08024F60
_08024F28:
	adds r0, r6, #0
	bl sub_804B95C
	adds r4, r0, #0
	movs r0, #2
	ldrsb r0, [r4, r0]
	bl GetUnit
	adds r5, r0, #0
	bl GetUnitCurrentHp
	movs r1, #3
	ldrsb r1, [r4, r1]
	cmp r0, r1
	bgt _08024F5A
	ldr r0, [r5]
	ldrb r0, [r0, #4]
	movs r1, #0
	mov r2, r8
	bl sub_80A08B4
	ldr r0, [r5]
	ldrb r0, [r0, #4]
	bl sub_80A07C8
_08024F5A:
	adds r6, #1
	cmp r6, r7
	blt _08024F28
_08024F60:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_8024F6C
sub_8024F6C: @ 0x08024F6C
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r0, _08024FDC @ =gBmMapUnit
	ldr r0, [r0]
	lsls r2, r5, #2
	adds r0, r2, r0
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r0, [r0]
	cmp r0, #0
	bne _08024FD4
	ldr r0, _08024FE0 @ =gPlaySt
	ldrb r0, [r0, #0xd]
	cmp r0, #0
	beq _08024F9C
	ldr r0, _08024FE4 @ =0x0202E3E8
	ldr r0, [r0]
	adds r0, r2, r0
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r0, [r0]
	cmp r0, #0
	beq _08024FD4
_08024F9C:
	ldr r0, _08024FE8 @ =0x02033E3C
	ldr r0, [r0]
	ldr r1, _08024FEC @ =gBmMapTerrain
	ldr r1, [r1]
	adds r1, r2, r1
	ldr r1, [r1]
	adds r1, r1, r4
	ldrb r1, [r1]
	bl CanUnitCrossTerrain
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08024FD4
	adds r0, r4, #0
	adds r1, r5, #0
	bl GetTrapAt
	cmp r0, #0
	beq _08024FC8
	ldrb r0, [r0, #2]
	cmp r0, #0xa
	bne _08024FD4
_08024FC8:
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #0
	movs r3, #0
	bl EnlistTarget
_08024FD4:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08024FDC: .4byte gBmMapUnit
_08024FE0: .4byte gPlaySt
_08024FE4: .4byte 0x0202E3E8
_08024FE8: .4byte 0x02033E3C
_08024FEC: .4byte gBmMapTerrain

	thumb_func_start MakeTargetListForDanceRing
MakeTargetListForDanceRing: @ 0x08024FF0
	push {r4, r5, lr}
	movs r4, #0x10
	ldrsb r4, [r0, r4]
	movs r5, #0x11
	ldrsb r5, [r0, r5]
	ldr r1, _08025018 @ =0x02033E3C
	str r0, [r1]
	ldr r0, _0802501C @ =0x0202E3E4
	ldr r0, [r0]
	movs r1, #0
	bl BmMapFillg
	ldr r2, _08025020 @ =sub_8024F6C
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_8023F34
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08025018: .4byte 0x02033E3C
_0802501C: .4byte 0x0202E3E4
_08025020: .4byte sub_8024F6C

	thumb_func_start sub_8025024
sub_8025024: @ 0x08025024
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r0, _08025070 @ =gBmMapUnit
	ldr r0, [r0]
	lsls r6, r5, #2
	adds r0, r6, r0
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r0, [r0]
	cmp r0, #0
	bne _0802506A
	adds r0, r4, #0
	bl GetTrapAt
	cmp r0, #0
	bne _0802506A
	ldr r1, _08025074 @ =MoveTable_Flying
	ldr r0, _08025078 @ =gBmMapTerrain
	ldr r0, [r0]
	adds r0, r6, r0
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r0, [r0]
	adds r1, r0, r1
	movs r0, #0
	ldrsb r0, [r1, r0]
	cmp r0, #0
	ble _0802506A
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #0
	movs r3, #0
	bl EnlistTarget
_0802506A:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08025070: .4byte gBmMapUnit
_08025074: .4byte MoveTable_Flying
_08025078: .4byte gBmMapTerrain

	thumb_func_start MakeTargetListForMine
MakeTargetListForMine: @ 0x0802507C
	push {r4, r5, lr}
	movs r4, #0x10
	ldrsb r4, [r0, r4]
	movs r5, #0x11
	ldrsb r5, [r0, r5]
	ldr r1, _080250A4 @ =0x02033E3C
	str r0, [r1]
	ldr r0, _080250A8 @ =0x0202E3E4
	ldr r0, [r0]
	movs r1, #0
	bl BmMapFillg
	ldr r2, _080250AC @ =sub_8025024
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_8023F34
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080250A4: .4byte 0x02033E3C
_080250A8: .4byte 0x0202E3E4
_080250AC: .4byte sub_8025024

	thumb_func_start sub_80250B0
sub_80250B0: @ 0x080250B0
	push {lr}
	adds r3, r0, #0
	movs r2, #0xb
	ldrsb r2, [r3, r2]
	movs r0, #0xc0
	ands r0, r2
	cmp r0, #0
	bne _080250DC
	adds r1, r3, #0
	adds r1, #0x30
	movs r0, #0xf
	ldrb r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _080250DC
	movs r0, #0x10
	ldrsb r0, [r3, r0]
	movs r1, #0x11
	ldrsb r1, [r3, r1]
	movs r3, #0
	bl EnlistTarget
_080250DC:
	pop {r0}
	bx r0

	thumb_func_start sub_80250E0
sub_80250E0: @ 0x080250E0
	push {r4, r5, lr}
	movs r4, #0x10
	ldrsb r4, [r0, r4]
	movs r5, #0x11
	ldrsb r5, [r0, r5]
	ldr r1, _08025108 @ =0x02033E3C
	str r0, [r1]
	ldr r0, _0802510C @ =0x0202E3E4
	ldr r0, [r0]
	movs r1, #0
	bl BmMapFillg
	ldr r2, _08025110 @ =sub_80250B0
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_8023F00
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08025108: .4byte 0x02033E3C
_0802510C: .4byte 0x0202E3E4
_08025110: .4byte sub_80250B0
