	.include "macro.inc"
	.syntax unified

	thumb_func_start BattleGenerateSimulationInternal
BattleGenerateSimulationInternal: @ 0x08028654
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	mov r8, r0
	mov sb, r1
	adds r4, r2, #0
	adds r5, r3, #0
	ldr r6, _080286A0 @ =0x0203A3EC
	adds r0, r6, #0
	mov r1, r8
	bl sub_08028A60
	ldr r7, _080286A4 @ =0x0203A46C
	adds r0, r7, #0
	mov r1, sb
	bl sub_08028A60
	strb r4, [r6, #0x10]
	strb r5, [r6, #0x11]
	ldr r4, _080286A8 @ =0x0203A3D4
	movs r2, #0x10
	ldrsb r2, [r6, r2]
	movs r0, #0x10
	ldrsb r0, [r7, r0]
	subs r1, r2, r0
	cmp r1, #0
	bge _0802868E
	subs r1, r0, r2
_0802868E:
	movs r3, #0x11
	ldrsb r3, [r6, r3]
	movs r0, #0x11
	ldrsb r0, [r7, r0]
	subs r2, r3, r0
	cmp r2, #0
	blt _080286AC
	adds r0, r1, r2
	b _080286B0
	.align 2, 0
_080286A0: .4byte 0x0203A3EC
_080286A4: .4byte 0x0203A46C
_080286A8: .4byte 0x0203A3D4
_080286AC:
	subs r0, r0, r3
	adds r0, r1, r0
_080286B0:
	strb r0, [r4, #2]
	ldr r1, _080286C8 @ =0x0203A3D4
	movs r0, #8
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	beq _080286D0
	ldr r0, _080286CC @ =0x0203A3EC
	bl sub_08028DE8
	b _080286D8
	.align 2, 0
_080286C8: .4byte 0x0203A3D4
_080286CC: .4byte 0x0203A3EC
_080286D0:
	ldr r0, _0802871C @ =0x0203A3EC
	ldr r1, [sp, #0x1c]
	bl sub_08028C08
_080286D8:
	ldr r4, _08028720 @ =0x0203A46C
	movs r1, #1
	rsbs r1, r1, #0
	adds r0, r4, #0
	bl sub_08028C08
	bl sub_0802A6A4
	ldr r5, _0802871C @ =0x0203A3EC
	adds r0, r5, #0
	adds r1, r4, #0
	bl sub_0802A620
	bl sub_0802C75C
	adds r0, r5, #0
	bl sub_08028BB4
	adds r0, r4, #0
	bl sub_08028BB4
	mov r0, r8
	mov r1, sb
	bl sub_080288B0
	bl sub_0802C79C
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0802871C: .4byte 0x0203A3EC
_08028720: .4byte 0x0203A46C

	thumb_func_start sub_08028724
sub_08028724: @ 0x08028724
	push {r4, r5, r6, r7, lr}
	adds r6, r0, #0
	adds r7, r1, #0
	ldr r5, _08028764 @ =0x0203A3EC
	adds r0, r5, #0
	adds r1, r6, #0
	bl sub_08028A60
	ldr r4, _08028768 @ =0x0203A46C
	adds r0, r4, #0
	adds r1, r7, #0
	bl sub_08028A60
	ldr r0, _0802876C @ =0x0203A3D4
	mov ip, r0
	movs r2, #0x10
	ldrsb r2, [r5, r2]
	movs r0, #0x10
	ldrsb r0, [r4, r0]
	subs r1, r2, r0
	cmp r1, #0
	bge _08028752
	subs r1, r0, r2
_08028752:
	movs r3, #0x11
	ldrsb r3, [r5, r3]
	movs r0, #0x11
	ldrsb r0, [r4, r0]
	subs r2, r3, r0
	cmp r2, #0
	blt _08028770
	adds r0, r1, r2
	b _08028774
	.align 2, 0
_08028764: .4byte 0x0203A3EC
_08028768: .4byte 0x0203A46C
_0802876C: .4byte 0x0203A3D4
_08028770:
	subs r0, r0, r3
	adds r0, r1, r0
_08028774:
	mov r1, ip
	strb r0, [r1, #2]
	ldr r1, _0802878C @ =0x0203A3D4
	movs r0, #8
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	beq _08028794
	ldr r0, _08028790 @ =0x0203A3EC
	bl sub_08028DE8
	b _0802879E
	.align 2, 0
_0802878C: .4byte 0x0203A3D4
_08028790: .4byte 0x0203A3EC
_08028794:
	ldr r0, _08028804 @ =0x0203A3EC
	movs r1, #1
	rsbs r1, r1, #0
	bl sub_08028C08
_0802879E:
	ldr r4, _08028808 @ =0x0203A46C
	movs r1, #1
	rsbs r1, r1, #0
	adds r0, r4, #0
	bl sub_08028C08
	bl sub_0802A6A4
	ldr r5, _08028804 @ =0x0203A3EC
	adds r0, r5, #0
	adds r1, r4, #0
	bl sub_0802A620
	bl sub_0802C75C
	adds r0, r5, #0
	bl sub_08028BB4
	adds r0, r4, #0
	bl sub_08028BB4
	adds r0, r6, #0
	adds r1, r7, #0
	bl sub_080288B0
	bl sub_0802C79C
	adds r0, r4, #0
	bl sub_0802A5A8
	adds r0, r4, #0
	bl sub_0802A554
	movs r0, #0xb
	ldrsb r0, [r4, r0]
	cmp r0, #0
	beq _080287FC
	bl sub_08029A1C
	bl sub_080A0C84
	adds r0, r6, #0
	bl sub_080A06FC
	adds r0, r7, #0
	bl sub_080A06FC
_080287FC:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08028804: .4byte 0x0203A3EC
_08028808: .4byte 0x0203A46C

	thumb_func_start sub_0802880C
sub_0802880C: @ 0x0802880C
	push {lr}
	bl sub_08029F20
	bl sub_0802A1E8
	ldr r0, _08028828 @ =0x0203A3EC
	ldr r1, _0802882C @ =0x0203A46C
	bl nullsub_08
	bl sub_0802A944
	pop {r0}
	bx r0
	.align 2, 0
_08028828: .4byte 0x0203A3EC
_0802882C: .4byte 0x0203A46C

	thumb_func_start sub_08028830
sub_08028830: @ 0x08028830
	push {r4, r5, lr}
	sub sp, #4
	adds r4, r0, #0
	adds r5, r1, #0
	cmp r2, #0
	bge _08028848
	cmp r3, #0
	bge _08028848
	movs r2, #0x10
	ldrsb r2, [r4, r2]
	movs r3, #0x11
	ldrsb r3, [r4, r3]
_08028848:
	ldr r0, _08028864 @ =0x0203A3D4
	movs r1, #2
	strh r1, [r0]
	ldr r0, [sp, #0x10]
	str r0, [sp]
	adds r0, r4, #0
	adds r1, r5, #0
	bl BattleGenerateSimulationInternal
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08028864: .4byte 0x0203A3D4

	thumb_func_start sub_08028868
sub_08028868: @ 0x08028868
	push {lr}
	ldr r3, _08028878 @ =0x0203A3D4
	movs r2, #1
	strh r2, [r3]
	bl sub_08028724
	pop {r0}
	bx r0
	.align 2, 0
_08028878: .4byte 0x0203A3D4

	thumb_func_start sub_0802887C
sub_0802887C: @ 0x0802887C
	push {r4, r5, r6, lr}
	sub sp, #4
	ldr r5, _08028898 @ =0x0203A3D4
	movs r6, #0
	movs r4, #0xa
	strh r4, [r5]
	str r6, [sp]
	bl BattleGenerateSimulationInternal
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08028898: .4byte 0x0203A3D4

	thumb_func_start sub_0802889C
sub_0802889C: @ 0x0802889C
	push {lr}
	ldr r3, _080288AC @ =0x0203A3D4
	movs r2, #9
	strh r2, [r3]
	bl sub_08028724
	pop {r0}
	bx r0
	.align 2, 0
_080288AC: .4byte 0x0203A3D4

	thumb_func_start sub_080288B0
sub_080288B0: @ 0x080288B0
	push {r4, r5, r6, lr}
	adds r6, r1, #0
	ldr r5, _080288FC @ =0x0203A3EC
	ldr r4, _08028900 @ =0x0203A46C
	adds r0, r5, #0
	adds r1, r4, #0
	bl sub_08028E2C
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_08028E2C
	adds r0, r5, #0
	adds r1, r4, #0
	bl sub_08028E78
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_08028E78
	cmp r6, #0
	bne _080288E0
	bl sub_0802A788
_080288E0:
	ldr r1, _08028904 @ =0x0203A3D4
	movs r0, #1
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	beq _0802890C
	ldr r0, _08028908 @ =gActionSt
	ldr r0, [r0, #0x18]
	cmp r0, #0
	beq _0802890C
	bl sub_0802AD58
	b _08028910
	.align 2, 0
_080288FC: .4byte 0x0203A3EC
_08028900: .4byte 0x0203A46C
_08028904: .4byte 0x0203A3D4
_08028908: .4byte gActionSt
_0802890C:
	bl sub_08029460
_08028910:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_08028918
sub_08028918: @ 0x08028918
	push {r4, r5, r6, r7, lr}
	sub sp, #0x48
	adds r7, r0, #0
	lsls r1, r1, #0x18
	lsrs r6, r1, #0x18
	ldr r1, _08028974 @ =0x0203A3D4
	movs r3, #0
	movs r2, #0
	movs r0, #4
	strh r0, [r1]
	ldr r0, _08028978 @ =0x0203A46C
	mov ip, r0
	adds r0, #0x48
	strh r2, [r0]
	mov r1, ip
	str r2, [r1, #0x4c]
	adds r1, #0x50
	movs r0, #0xff
	strb r0, [r1]
	mov r0, ip
	str r2, [r0, #4]
	ldr r5, _0802897C @ =0x0203A3EC
	adds r0, r5, #0
	adds r0, #0x53
	strb r3, [r0]
	adds r0, #1
	strb r3, [r0]
	lsls r4, r6, #0x18
	lsrs r0, r4, #0x18
	cmp r0, #4
	bhi _08028980
	mov r0, sp
	adds r1, r7, #0
	movs r2, #0x48
	bl memcpy
	asrs r1, r4, #0x18
	mov r0, sp
	bl sub_08016C54
	movs r6, #0
	adds r0, r5, #0
	mov r1, sp
	bl sub_08028A60
	b _08028988
	.align 2, 0
_08028974: .4byte 0x0203A3D4
_08028978: .4byte 0x0203A46C
_0802897C: .4byte 0x0203A3EC
_08028980:
	adds r0, r5, #0
	adds r1, r7, #0
	bl sub_08028A60
_08028988:
	ldr r4, _08028A00 @ =0x0203A3EC
	adds r0, r4, #0
	bl sub_08028BB4
	lsls r1, r6, #0x18
	asrs r1, r1, #0x18
	adds r0, r4, #0
	bl sub_08028C08
	ldr r1, _08028A04 @ =0x0203A46C
	adds r0, r4, #0
	bl sub_08028E2C
	adds r5, r4, #0
	adds r5, #0x48
	ldrh r0, [r5]
	bl GetItemIndex
	cmp r0, #0x11
	bne _080289D0
	adds r2, r4, #0
	adds r2, #0x5a
	movs r0, #0x14
	ldrsb r0, [r4, r0]
	lsrs r1, r0, #0x1f
	adds r0, r0, r1
	asrs r0, r0, #1
	ldrh r1, [r2]
	subs r0, r1, r0
	movs r1, #0
	strh r0, [r2]
	adds r0, r4, #0
	adds r0, #0x66
	strh r1, [r0]
	adds r0, #4
	strh r1, [r0]
_080289D0:
	ldrh r0, [r5]
	cmp r0, #0
	bne _080289E6
	adds r0, r4, #0
	adds r0, #0x5a
	movs r1, #0xff
	strh r1, [r0]
	adds r0, #6
	strh r1, [r0]
	adds r0, #6
	strh r1, [r0]
_080289E6:
	ldrh r0, [r5]
	bl sub_0801782C
	cmp r0, #3
	bne _080289F8
	adds r1, r4, #0
	adds r1, #0x5a
	movs r0, #0xff
	strh r0, [r1]
_080289F8:
	add sp, #0x48
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08028A00: .4byte 0x0203A3EC
_08028A04: .4byte 0x0203A46C

	thumb_func_start sub_08028A08
sub_08028A08: @ 0x08028A08
	push {lr}
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	lsls r1, r1, #0x18
	lsrs r2, r1, #0x18
	ldr r1, _08028A28 @ =0x0203A3D4
	movs r0, #2
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _08028A2C
	adds r0, r3, #0
	bl RandRoll
	lsls r0, r0, #0x18
	b _08028A2E
	.align 2, 0
_08028A28: .4byte 0x0203A3D4
_08028A2C:
	lsls r0, r2, #0x18
_08028A2E:
	asrs r0, r0, #0x18
	pop {r1}
	bx r1

	thumb_func_start sub_08028A34
sub_08028A34: @ 0x08028A34
	push {lr}
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	lsls r1, r1, #0x18
	lsrs r2, r1, #0x18
	ldr r1, _08028A54 @ =0x0203A3D4
	movs r0, #2
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _08028A58
	adds r0, r3, #0
	bl RandRoll2Rn
	lsls r0, r0, #0x18
	b _08028A5A
	.align 2, 0
_08028A54: .4byte 0x0203A3D4
_08028A58:
	lsls r0, r2, #0x18
_08028A5A:
	asrs r0, r0, #0x18
	pop {r1}
	bx r1

	thumb_func_start sub_08028A60
sub_08028A60: @ 0x08028A60
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r6, r1, #0
	cmp r6, #0
	beq _08028B36
	movs r2, #0x48
	bl memcpy
	adds r0, r6, #0
	bl GetUnitMaxHp
	movs r4, #0
	strb r0, [r5, #0x12]
	adds r0, r6, #0
	bl GetUnitPower
	strb r0, [r5, #0x14]
	adds r0, r6, #0
	bl GetUnitSkill
	strb r0, [r5, #0x15]
	adds r0, r6, #0
	bl GetUnitSpeed
	strb r0, [r5, #0x16]
	adds r0, r6, #0
	bl GetUnitDefense
	strb r0, [r5, #0x17]
	adds r0, r6, #0
	bl GetUnitLuck
	strb r0, [r5, #0x19]
	adds r0, r6, #0
	bl GetUnitResistance
	strb r0, [r5, #0x18]
	ldr r1, [r6, #4]
	ldr r0, [r6]
	ldrb r2, [r1, #0x11]
	ldrb r0, [r0, #0x13]
	adds r0, r2, r0
	ldrb r2, [r6, #0x1a]
	adds r0, r2, r0
	strb r0, [r5, #0x1a]
	ldrb r6, [r6, #0x1d]
	ldrb r1, [r1, #0x12]
	adds r0, r6, r1
	strb r0, [r5, #0x1d]
	ldrb r1, [r5, #8]
	adds r0, r5, #0
	adds r0, #0x70
	strb r1, [r0]
	ldrb r0, [r5, #9]
	adds r1, r5, #0
	adds r1, #0x71
	strb r0, [r1]
	ldrb r0, [r5, #0x13]
	adds r1, #1
	strb r0, [r1]
	subs r1, #3
	movs r0, #0xff
	strb r0, [r1]
	adds r0, r5, #0
	adds r0, #0x73
	strb r4, [r0]
	adds r0, #1
	strb r4, [r0]
	adds r0, #1
	strb r4, [r0]
	adds r0, #1
	strb r4, [r0]
	adds r0, #1
	strb r4, [r0]
	adds r0, #1
	strb r4, [r0]
	adds r0, #1
	strb r4, [r0]
	adds r0, #1
	strb r4, [r0]
	ldr r2, _08028B3C @ =0x0203A3EC
	adds r0, r2, #0
	adds r0, #0x7b
	strb r4, [r0]
	ldr r1, _08028B40 @ =0x0203A46C
	adds r0, r1, #0
	adds r0, #0x7b
	strb r4, [r0]
	adds r0, r5, #0
	adds r0, #0x53
	strb r4, [r0]
	adds r0, #1
	strb r4, [r0]
	adds r0, #0x28
	strb r4, [r0]
	adds r0, r2, #0
	adds r0, #0x7d
	strb r4, [r0]
	adds r0, r1, #0
	adds r0, #0x7d
	strb r4, [r0]
	adds r0, r2, #0
	adds r0, #0x6e
	strb r4, [r0]
	adds r0, r1, #0
	adds r0, #0x6e
	strb r4, [r0]
_08028B36:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08028B3C: .4byte 0x0203A3EC
_08028B40: .4byte 0x0203A46C

	thumb_func_start sub_08028B44
sub_08028B44: @ 0x08028B44
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	bl sub_08028A60
	ldrb r0, [r4, #0x12]
	strb r0, [r5, #0x12]
	ldrb r0, [r4, #0x14]
	strb r0, [r5, #0x14]
	ldrb r0, [r4, #0x15]
	strb r0, [r5, #0x15]
	ldrb r0, [r4, #0x16]
	strb r0, [r5, #0x16]
	ldrb r0, [r4, #0x17]
	strb r0, [r5, #0x17]
	ldrb r0, [r4, #0x19]
	strb r0, [r5, #0x19]
	ldrb r0, [r4, #0x18]
	strb r0, [r5, #0x18]
	ldr r1, [r4, #4]
	ldr r0, [r4]
	ldrb r1, [r1, #0x11]
	ldrb r0, [r0, #0x13]
	adds r0, r1, r0
	strb r0, [r5, #0x1a]
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start sub_08028B7C
sub_08028B7C: @ 0x08028B7C
	adds r2, r0, #0
	adds r3, r2, #0
	adds r3, #0x55
	strb r1, [r3]
	ldr r0, [r2, #4]
	ldr r0, [r0, #0x44]
	adds r0, r1, r0
	ldrb r0, [r0]
	adds r1, r2, #0
	adds r1, #0x57
	strb r0, [r1]
	ldr r0, [r2, #4]
	ldr r0, [r0, #0x48]
	ldrb r1, [r3]
	adds r0, r1, r0
	ldrb r0, [r0]
	adds r1, r2, #0
	adds r1, #0x56
	strb r0, [r1]
	ldr r0, [r2, #4]
	ldr r0, [r0, #0x4c]
	ldrb r3, [r3]
	adds r0, r3, r0
	ldrb r1, [r0]
	adds r0, r2, #0
	adds r0, #0x58
	strb r1, [r0]
	bx lr

	thumb_func_start sub_08028BB4
sub_08028BB4: @ 0x08028BB4
	adds r2, r0, #0
	movs r0, #0x11
	ldrsb r0, [r2, r0]
	ldr r1, _08028C04 @ =gBmMapTerrain
	ldr r1, [r1]
	lsls r0, r0, #2
	adds r0, r0, r1
	movs r1, #0x10
	ldrsb r1, [r2, r1]
	ldr r0, [r0]
	adds r0, r0, r1
	ldrb r0, [r0]
	adds r3, r2, #0
	adds r3, #0x55
	strb r0, [r3]
	ldr r0, [r2, #4]
	ldr r0, [r0, #0x44]
	ldrb r1, [r3]
	adds r0, r1, r0
	ldrb r0, [r0]
	adds r1, r2, #0
	adds r1, #0x57
	strb r0, [r1]
	ldr r0, [r2, #4]
	ldr r0, [r0, #0x48]
	ldrb r1, [r3]
	adds r0, r1, r0
	ldrb r0, [r0]
	adds r1, r2, #0
	adds r1, #0x56
	strb r0, [r1]
	ldr r0, [r2, #4]
	ldr r0, [r0, #0x4c]
	ldrb r3, [r3]
	adds r0, r3, r0
	ldrb r1, [r0]
	adds r0, r2, #0
	adds r0, #0x58
	strb r1, [r0]
	bx lr
	.align 2, 0
_08028C04: .4byte gBmMapTerrain

	thumb_func_start sub_08028C08
sub_08028C08: @ 0x08028C08
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	adds r5, r0, #0
	adds r2, r1, #0
	movs r0, #1
	rsbs r0, r0, #0
	cmp r2, r0
	bne _08028C24
	adds r0, r5, #0
	bl GetUnitEquippedWeaponSlot
	adds r2, r0, #0
_08028C24:
	ldr r0, [r5, #0xc]
	movs r1, #0x80
	lsls r1, r1, #4
	ands r0, r1
	cmp r0, #0
	beq _08028C32
	movs r2, #8
_08028C32:
	adds r1, r5, #0
	adds r1, #0x52
	movs r0, #1
	strb r0, [r1]
	mov sb, r1
	cmp r2, #8
	bhi _08028D10
	lsls r0, r2, #2
	ldr r1, _08028C4C @ =_08028C50
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08028C4C: .4byte _08028C50
_08028C50: @ jump table
	.4byte _08028C74 @ case 0
	.4byte _08028C74 @ case 1
	.4byte _08028C74 @ case 2
	.4byte _08028C74 @ case 3
	.4byte _08028C74 @ case 4
	.4byte _08028C8E @ case 5
	.4byte _08028CAC @ case 6
	.4byte _08028CCC @ case 7
	.4byte _08028CEC @ case 8
_08028C74:
	adds r1, r5, #0
	adds r1, #0x51
	strb r2, [r1]
	lsls r2, r2, #1
	adds r0, r5, #0
	adds r0, #0x1e
	adds r0, r0, r2
	ldrh r0, [r0]
	adds r2, r5, #0
	adds r2, #0x48
	strh r0, [r2]
	mov r8, r1
	b _08028D28
_08028C8E:
	adds r2, r5, #0
	adds r2, #0x51
	movs r0, #0xff
	strb r0, [r2]
	ldr r0, _08028CA8 @ =gBmSt
	ldrh r0, [r0, #0x2c]
	adds r1, r5, #0
	adds r1, #0x48
	strh r0, [r1]
	mov r8, r2
	adds r4, r1, #0
	b _08028D2A
	.align 2, 0
_08028CA8: .4byte gBmSt
_08028CAC:
	adds r3, r5, #0
	adds r3, #0x51
	movs r0, #0
	strb r0, [r3]
	ldr r0, _08028CC8 @ =0x0203A7F0
	ldrh r1, [r0, #0x1a]
	adds r2, r5, #0
	adds r2, #0x48
	movs r0, #0
	strh r1, [r2]
	mov r1, sb
	strb r0, [r1]
	b _08028D26
	.align 2, 0
_08028CC8: .4byte 0x0203A7F0
_08028CCC:
	adds r3, r5, #0
	adds r3, #0x51
	movs r0, #0
	strb r0, [r3]
	ldr r0, _08028CE8 @ =0x0203A7F0
	ldrh r1, [r0, #0x1c]
	adds r2, r5, #0
	adds r2, #0x48
	movs r0, #0
	strh r1, [r2]
	mov r1, sb
	strb r0, [r1]
	b _08028D26
	.align 2, 0
_08028CE8: .4byte 0x0203A7F0
_08028CEC:
	adds r4, r5, #0
	adds r4, #0x51
	movs r0, #0xff
	strb r0, [r4]
	movs r0, #0x10
	ldrsb r0, [r5, r0]
	movs r1, #0x11
	ldrsb r1, [r5, r1]
	bl sub_08034BA0
	adds r2, r5, #0
	adds r2, #0x48
	movs r1, #0
	strh r0, [r2]
	mov r0, sb
	strb r1, [r0]
	mov r8, r4
	b _08028D28
_08028D10:
	adds r3, r5, #0
	adds r3, #0x51
	movs r0, #0xff
	strb r0, [r3]
	adds r2, r5, #0
	adds r2, #0x48
	movs r1, #0
	movs r0, #0
	strh r0, [r2]
	mov r0, sb
	strb r1, [r0]
_08028D26:
	mov r8, r3
_08028D28:
	adds r4, r2, #0
_08028D2A:
	ldrh r0, [r4]
	adds r1, r5, #0
	adds r1, #0x4a
	strh r0, [r1]
	ldrh r0, [r4]
	bl GetItemAttributes
	str r0, [r5, #0x4c]
	ldrh r0, [r4]
	bl GetItemType
	adds r6, r5, #0
	adds r6, #0x50
	strb r0, [r6]
	ldr r7, _08028D70 @ =0x0203A3D4
	movs r0, #4
	ldrh r1, [r7]
	ands r0, r1
	cmp r0, #0
	bne _08028DD6
	ldr r0, [r5, #0x4c]
	movs r1, #0x40
	ands r0, r1
	cmp r0, #0
	beq _08028D9C
	ldrh r0, [r4]
	bl GetItemIndex
	cmp r0, #0x11
	beq _08028D98
	cmp r0, #0x11
	bgt _08028D74
	cmp r0, #0x10
	beq _08028D82
	b _08028D9C
	.align 2, 0
_08028D70: .4byte 0x0203A3D4
_08028D74:
	cmp r0, #0x99
	bne _08028D9C
	ldrb r7, [r7, #2]
	cmp r7, #2
	bne _08028D8C
	movs r0, #5
	b _08028D9A
_08028D82:
	ldrb r7, [r7, #2]
	cmp r7, #2
	bne _08028D8C
	movs r0, #6
	b _08028D9A
_08028D8C:
	ldr r0, [r5, #0x4c]
	movs r1, #0x41
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r5, #0x4c]
	b _08028D9C
_08028D98:
	movs r0, #7
_08028D9A:
	strb r0, [r6]
_08028D9C:
	ldrh r0, [r4]
	ldr r1, _08028DE4 @ =0x0203A3D4
	ldrb r1, [r1, #2]
	bl sub_08016C28
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08028DB4
	mov r1, r8
	ldrb r0, [r1]
	cmp r0, #0xff
	bne _08028DBE
_08028DB4:
	movs r1, #0
	movs r0, #0
	strh r0, [r4]
	mov r0, sb
	strb r1, [r0]
_08028DBE:
	adds r1, r5, #0
	adds r1, #0x30
	movs r0, #0xf
	ldrb r1, [r1]
	ands r0, r1
	cmp r0, #2
	bne _08028DD6
	movs r1, #0
	movs r0, #0
	strh r0, [r4]
	mov r0, sb
	strb r1, [r0]
_08028DD6:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08028DE4: .4byte 0x0203A3D4

	thumb_func_start sub_08028DE8
sub_08028DE8: @ 0x08028DE8
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	movs r0, #0x10
	ldrsb r0, [r6, r0]
	movs r1, #0x11
	ldrsb r1, [r6, r1]
	bl sub_08034BA0
	adds r4, r6, #0
	adds r4, #0x48
	movs r5, #0
	strh r0, [r4]
	adds r1, r6, #0
	adds r1, #0x4a
	strh r0, [r1]
	ldrh r0, [r4]
	bl GetItemAttributes
	str r0, [r6, #0x4c]
	ldrh r0, [r4]
	bl GetItemType
	adds r1, r6, #0
	adds r1, #0x50
	strb r0, [r1]
	adds r0, r6, #0
	adds r0, #0x52
	strb r5, [r0]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start nullsub_42
nullsub_42: @ 0x08028E28
	bx lr
	.align 2, 0

	thumb_func_start sub_08028E2C
sub_08028E2C: @ 0x08028E2C
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	bl sub_08028F14
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_08028F8C
	adds r0, r4, #0
	bl sub_08029008
	adds r0, r4, #0
	bl sub_08029040
	adds r0, r4, #0
	bl sub_080290F8
	adds r0, r4, #0
	bl sub_080291B0
	adds r0, r4, #0
	bl sub_080291EC
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_08028EA0
	adds r0, r4, #0
	bl sub_08029328
	adds r0, r4, #0
	bl sub_08029364
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_08028E78
sub_08028E78: @ 0x08028E78
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	bl sub_080291F8
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_08029224
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_080292CC
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_0802939C
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start sub_08028EA0
sub_08028EA0: @ 0x08028EA0
	push {r4, r5, lr}
	sub sp, #8
	adds r5, r0, #0
	ldr r1, _08028F0C @ =0x0203A3D4
	movs r0, #0x20
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	beq _08028EBA
	ldr r0, _08028F10 @ =gPlaySt
	ldrb r0, [r0, #0x15]
	cmp r0, #0
	beq _08028F02
_08028EBA:
	mov r4, sp
	adds r0, r5, #0
	mov r1, sp
	bl sub_08026EA4
	adds r1, r5, #0
	adds r1, #0x5a
	ldrb r0, [r4, #1]
	ldrh r2, [r1]
	adds r0, r2, r0
	strh r0, [r1]
	adds r1, #2
	ldrb r0, [r4, #2]
	ldrh r3, [r1]
	adds r0, r3, r0
	strh r0, [r1]
	adds r1, #4
	ldrb r0, [r4, #3]
	ldrh r2, [r1]
	adds r0, r2, r0
	strh r0, [r1]
	adds r1, #2
	ldrh r3, [r1]
	ldrb r2, [r4, #4]
	adds r0, r3, r2
	strh r0, [r1]
	adds r1, #4
	ldrh r3, [r1]
	ldrb r2, [r4, #5]
	adds r0, r3, r2
	strh r0, [r1]
	adds r1, #2
	ldrh r3, [r1]
	ldrb r4, [r4, #6]
	adds r0, r3, r4
	strh r0, [r1]
_08028F02:
	add sp, #8
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08028F0C: .4byte 0x0203A3D4
_08028F10: .4byte gPlaySt

	thumb_func_start sub_08028F14
sub_08028F14: @ 0x08028F14
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r5, #0x48
	ldrh r0, [r5]
	bl GetItemAttributes
	movs r1, #0x40
	ands r1, r0
	cmp r1, #0
	beq _08028F3A
	adds r0, r4, #0
	adds r0, #0x58
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	movs r1, #0x18
	ldrsb r1, [r4, r1]
	b _08028F66
_08028F3A:
	ldrh r0, [r5]
	bl GetItemAttributes
	movs r1, #2
	ands r1, r0
	cmp r1, #0
	beq _08028F58
	adds r0, r4, #0
	adds r0, #0x58
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	movs r1, #0x18
	ldrsb r1, [r4, r1]
	b _08028F66
_08028F58:
	adds r0, r4, #0
	adds r0, #0x56
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	movs r1, #0x17
	ldrsb r1, [r4, r1]
_08028F66:
	adds r0, r0, r1
	adds r1, r4, #0
	adds r1, #0x5c
	strh r0, [r1]
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start sub_08028F74
sub_08028F74: @ 0x08028F74
	adds r1, r0, #0
	adds r1, #0x56
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	movs r2, #0x17
	ldrsb r2, [r0, r2]
	adds r1, r1, r2
	adds r0, #0x5c
	strh r1, [r0]
	bx lr
	.align 2, 0

	thumb_func_start sub_08028F8C
sub_08028F8C: @ 0x08028F8C
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	adds r6, r5, #0
	adds r6, #0x48
	ldrh r0, [r6]
	bl sub_080176E8
	adds r1, r5, #0
	adds r1, #0x54
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	adds r1, r1, r0
	adds r0, r5, #0
	adds r0, #0x5a
	strh r1, [r0]
	ldrh r0, [r6]
	adds r1, r4, #0
	bl sub_08016C80
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne _08028FF4
	ldrh r0, [r6]
	bl GetItemIndex
	cmp r0, #0x85
	bgt _08028FD6
	cmp r0, #0x84
	bge _08028FDA
	cmp r0, #0xf
	beq _08028FDA
	cmp r0, #0x3c
	beq _08028FDA
	b _08028FE6
_08028FD6:
	cmp r0, #0x8c
	bne _08028FE6
_08028FDA:
	adds r1, r5, #0
	adds r1, #0x5a
	ldrh r2, [r1]
	lsls r0, r2, #1
	strh r0, [r1]
	b _08028FF4
_08028FE6:
	adds r2, r5, #0
	adds r2, #0x5a
	movs r0, #0
	ldrsh r1, [r2, r0]
	lsls r0, r1, #1
	adds r0, r0, r1
	strh r0, [r2]
_08028FF4:
	adds r1, r5, #0
	adds r1, #0x5a
	movs r0, #0x14
	ldrsb r0, [r5, r0]
	ldrh r2, [r1]
	adds r0, r2, r0
	strh r0, [r1]
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	thumb_func_start sub_08029008
sub_08029008: @ 0x08029008
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x4a
	ldrh r0, [r0]
	bl sub_08017718
	adds r1, r0, #0
	movs r0, #0x1a
	ldrsb r0, [r4, r0]
	subs r1, r1, r0
	cmp r1, #0
	bge _08029022
	movs r1, #0
_08029022:
	movs r0, #0x16
	ldrsb r0, [r4, r0]
	subs r0, r0, r1
	adds r1, r4, #0
	adds r1, #0x5e
	strh r0, [r1]
	lsls r0, r0, #0x10
	cmp r0, #0
	bge _08029038
	movs r0, #0
	strh r0, [r1]
_08029038:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_08029040
sub_08029040: @ 0x08029040
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	adds r0, #0x48
	ldrh r0, [r0]
	bl sub_08017700
	movs r2, #0x15
	ldrsb r2, [r4, r2]
	lsls r2, r2, #1
	adds r2, r2, r0
	movs r0, #0x19
	ldrsb r0, [r4, r0]
	lsrs r1, r0, #0x1f
	adds r0, r0, r1
	asrs r0, r0, #1
	adds r0, r0, r2
	adds r1, r4, #0
	adds r1, #0x53
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	adds r6, r1, r0
	adds r7, r4, #0
	adds r7, #0x60
	strh r6, [r7]
	ldr r5, _080290EC @ =gPlaySt
	adds r0, r5, #0
	adds r0, #0x2b
	ldrb r3, [r0]
	movs r0, #1
	ands r0, r3
	cmp r0, #0
	beq _080290E4
	ldrb r0, [r5, #0x1b]
	cmp r0, #1
	beq _080290E4
	ldr r1, _080290F0 @ =gBmSt
	movs r0, #0x40
	ldrb r1, [r1, #4]
	ands r0, r1
	cmp r0, #0
	bne _080290E4
	movs r0, #0xc0
	ldrb r1, [r4, #0xb]
	ands r0, r1
	cmp r0, #0
	bne _080290E4
	ldr r2, _080290F4 @ =0x081C8FCC
	lsls r1, r3, #0x1c
	lsrs r1, r1, #0x1d
	lsls r1, r1, #2
	lsrs r0, r3, #4
	lsls r0, r0, #4
	adds r1, r1, r0
	adds r1, r1, r2
	ldr r2, [r4]
	ldr r0, [r1]
	ldrb r2, [r2, #9]
	cmp r0, r2
	bne _080290CE
	ldrh r5, [r5, #0x2c]
	lsls r0, r5, #0x13
	lsrs r0, r0, #0x17
	movs r1, #0xc
	bl __divsi3
	cmp r0, #0xa
	ble _080290CA
	movs r0, #0xa
_080290CA:
	adds r0, r6, r0
	strh r0, [r7]
_080290CE:
	adds r0, r4, #0
	bl sub_08028620
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080290E4
	adds r1, r4, #0
	adds r1, #0x60
	ldrh r0, [r1]
	adds r0, #0xa
	strh r0, [r1]
_080290E4:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080290EC: .4byte gPlaySt
_080290F0: .4byte gBmSt
_080290F4: .4byte 0x081C8FCC

	thumb_func_start sub_080290F8
sub_080290F8: @ 0x080290F8
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	adds r0, #0x5e
	movs r2, #0
	ldrsh r1, [r0, r2]
	lsls r1, r1, #1
	subs r0, #7
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r0, r0, r1
	movs r1, #0x19
	ldrsb r1, [r4, r1]
	adds r6, r1, r0
	adds r7, r4, #0
	adds r7, #0x62
	strh r6, [r7]
	ldr r5, _080291A4 @ =gPlaySt
	adds r0, r5, #0
	adds r0, #0x2b
	ldrb r3, [r0]
	movs r0, #1
	ands r0, r3
	cmp r0, #0
	beq _0802918C
	ldrb r0, [r5, #0x1b]
	cmp r0, #1
	beq _0802918C
	ldr r1, _080291A8 @ =gBmSt
	movs r0, #0x40
	ldrb r1, [r1, #4]
	ands r0, r1
	cmp r0, #0
	bne _0802918C
	movs r0, #0xc0
	ldrb r1, [r4, #0xb]
	ands r0, r1
	cmp r0, #0
	bne _0802918C
	ldr r2, _080291AC @ =0x081C8FCC
	lsls r1, r3, #0x1c
	lsrs r1, r1, #0x1d
	lsls r1, r1, #2
	lsrs r0, r3, #4
	lsls r0, r0, #4
	adds r1, r1, r0
	adds r1, r1, r2
	ldr r2, [r4]
	ldr r0, [r1]
	ldrb r2, [r2, #9]
	cmp r0, r2
	bne _08029176
	ldrh r5, [r5, #0x2c]
	lsls r0, r5, #0x13
	lsrs r0, r0, #0x17
	movs r1, #0xc
	bl __divsi3
	cmp r0, #0xa
	ble _08029172
	movs r0, #0xa
_08029172:
	adds r0, r6, r0
	strh r0, [r7]
_08029176:
	adds r0, r4, #0
	bl sub_08028620
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0802918C
	adds r1, r4, #0
	adds r1, #0x62
	ldrh r0, [r1]
	adds r0, #0xa
	strh r0, [r1]
_0802918C:
	adds r2, r4, #0
	adds r2, #0x62
	movs r1, #0
	ldrsh r0, [r2, r1]
	cmp r0, #0
	bge _0802919C
	movs r0, #0
	strh r0, [r2]
_0802919C:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080291A4: .4byte gPlaySt
_080291A8: .4byte gBmSt
_080291AC: .4byte 0x081C8FCC

	thumb_func_start sub_080291B0
sub_080291B0: @ 0x080291B0
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x48
	ldrh r0, [r0]
	bl sub_08017730
	movs r1, #0x15
	ldrsb r1, [r4, r1]
	lsrs r2, r1, #0x1f
	adds r1, r1, r2
	asrs r1, r1, #1
	adds r2, r1, r0
	adds r3, r4, #0
	adds r3, #0x66
	strh r2, [r3]
	ldr r0, [r4]
	ldr r1, [r4, #4]
	ldr r0, [r0, #0x28]
	ldr r1, [r1, #0x28]
	orrs r0, r1
	movs r1, #0x40
	ands r0, r1
	cmp r0, #0
	beq _080291E6
	adds r0, r2, #0
	adds r0, #0xf
	strh r0, [r3]
_080291E6:
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_080291EC
sub_080291EC: @ 0x080291EC
	movs r1, #0x19
	ldrsb r1, [r0, r1]
	adds r0, #0x68
	strh r1, [r0]
	bx lr
	.align 2, 0

	thumb_func_start sub_080291F8
sub_080291F8: @ 0x080291F8
	adds r2, r0, #0
	adds r2, #0x60
	adds r1, #0x62
	ldrh r2, [r2]
	ldrh r1, [r1]
	subs r1, r2, r1
	adds r2, r0, #0
	adds r2, #0x64
	strh r1, [r2]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	cmp r1, #0x64
	ble _08029216
	movs r0, #0x64
	strh r0, [r2]
_08029216:
	movs r1, #0
	ldrsh r0, [r2, r1]
	cmp r0, #0
	bge _08029222
	movs r0, #0
	strh r0, [r2]
_08029222:
	bx lr

	thumb_func_start sub_08029224
sub_08029224: @ 0x08029224
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	adds r6, r1, #0
	adds r1, r4, #0
	adds r1, #0x66
	adds r0, r6, #0
	adds r0, #0x68
	ldrh r1, [r1]
	ldrh r0, [r0]
	subs r5, r1, r0
	adds r7, r4, #0
	adds r7, #0x6a
	strh r5, [r7]
	ldr r2, _08029298 @ =gPlaySt
	adds r1, r2, #0
	adds r1, #0x2b
	movs r0, #1
	ldrb r1, [r1]
	ands r0, r1
	cmp r0, #0
	beq _08029280
	ldrb r0, [r2, #0x1b]
	cmp r0, #1
	beq _08029280
	ldr r1, _0802929C @ =gBmSt
	movs r0, #0x40
	ldrb r1, [r1, #4]
	ands r0, r1
	cmp r0, #0
	bne _08029280
	movs r0, #0xc0
	ldrb r1, [r6, #0xb]
	ands r0, r1
	cmp r0, #0
	bne _08029280
	ldrh r2, [r2, #0x2c]
	lsls r0, r2, #0x13
	lsrs r0, r0, #0x17
	movs r1, #0xc
	bl __divsi3
	cmp r0, #0xa
	ble _0802927C
	movs r0, #0xa
_0802927C:
	subs r0, r5, r0
	strh r0, [r7]
_08029280:
	adds r0, r4, #0
	adds r0, #0x6a
	movs r2, #0
	ldrsh r1, [r0, r2]
	adds r5, r0, #0
	cmp r1, #0
	bge _08029292
	movs r0, #0
	strh r0, [r5]
_08029292:
	movs r4, #0
	b _080292A2
	.align 2, 0
_08029298: .4byte gPlaySt
_0802929C: .4byte gBmSt
_080292A0:
	adds r4, #1
_080292A2:
	cmp r4, #4
	bgt _080292C6
	lsls r1, r4, #1
	adds r0, r6, #0
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r0, [r0]
	cmp r0, #0
	beq _080292C6
	bl GetItemAttributes
	movs r1, #0x80
	lsls r1, r1, #8
	ands r1, r0
	cmp r1, #0
	beq _080292A0
	movs r0, #0
	strh r0, [r5]
_080292C6:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_080292CC
sub_080292CC: @ 0x080292CC
	push {r4, lr}
	adds r3, r0, #0
	adds r4, r1, #0
	ldr r0, [r3]
	ldr r1, [r3, #4]
	ldr r2, [r0, #0x28]
	ldr r0, [r1, #0x28]
	orrs r2, r0
	movs r0, #0x80
	lsls r0, r0, #0x12
	ands r2, r0
	cmp r2, #0
	bne _080292EE
	adds r0, r3, #0
	adds r0, #0x6c
	strh r2, [r0]
	b _08029322
_080292EE:
	adds r2, r3, #0
	adds r2, #0x6c
	movs r0, #0x32
	strh r0, [r2]
	ldr r3, [r4]
	ldr r4, [r4, #4]
	ldr r0, [r3, #0x28]
	ldr r1, [r4, #0x28]
	orrs r0, r1
	movs r1, #0x80
	lsls r1, r1, #8
	ands r0, r1
	cmp r0, #0
	beq _0802930E
	movs r0, #0x19
	strh r0, [r2]
_0802930E:
	ldr r0, [r3, #0x28]
	ldr r1, [r4, #0x28]
	orrs r0, r1
	movs r1, #0x80
	lsls r1, r1, #0x11
	ands r0, r1
	cmp r0, #0
	beq _08029322
	movs r0, #0
	strh r0, [r2]
_08029322:
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_08029328
sub_08029328: @ 0x08029328
	push {r4, lr}
	adds r4, r0, #0
	adds r1, r4, #0
	adds r1, #0x48
	ldrh r0, [r1]
	cmp r0, #0
	beq _0802935E
	bl GetItemType
	adds r1, r0, #0
	cmp r1, #7
	bgt _0802935E
	adds r0, r4, #0
	adds r0, #0x28
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #0xfa
	bls _0802935E
	adds r1, r4, #0
	adds r1, #0x60
	ldrh r0, [r1]
	adds r0, #5
	strh r0, [r1]
	adds r1, #6
	ldrh r0, [r1]
	adds r0, #5
	strh r0, [r1]
_0802935E:
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_08029364
sub_08029364: @ 0x08029364
	adds r1, r0, #0
	adds r0, #0x30
	ldrb r0, [r0]
	lsls r0, r0, #0x1c
	lsrs r0, r0, #0x1c
	cmp r0, #6
	beq _0802938A
	cmp r0, #6
	bgt _0802937C
	cmp r0, #5
	beq _08029386
	b _0802939A
_0802937C:
	cmp r0, #7
	beq _0802938E
	cmp r0, #8
	beq _08029392
	b _0802939A
_08029386:
	adds r1, #0x5a
	b _08029394
_0802938A:
	adds r1, #0x5c
	b _08029394
_0802938E:
	adds r1, #0x66
	b _08029394
_08029392:
	adds r1, #0x62
_08029394:
	ldrh r0, [r1]
	adds r0, #0xa
	strh r0, [r1]
_0802939A:
	bx lr

	thumb_func_start sub_0802939C
sub_0802939C: @ 0x0802939C
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r6, r1, #0
	ldr r5, [r4, #0x4c]
	movs r0, #0x40
	ands r5, r0
	cmp r5, #0
	beq _080293E4
	adds r0, r4, #0
	adds r0, #0x48
	ldrh r0, [r0]
	bl GetItemIndex
	cmp r0, #0x10
	blt _0802942C
	cmp r0, #0x11
	ble _080293C2
	cmp r0, #0x99
	bne _0802942C
_080293C2:
	adds r2, r4, #0
	adds r2, #0x5a
	movs r0, #0x14
	ldrsb r0, [r4, r0]
	lsrs r1, r0, #0x1f
	adds r0, r0, r1
	asrs r0, r0, #1
	ldrh r1, [r2]
	subs r0, r1, r0
	movs r1, #0
	strh r0, [r2]
	adds r0, r4, #0
	adds r0, #0x66
	strh r1, [r0]
	adds r0, #4
	strh r1, [r0]
	b _0802942C
_080293E4:
	adds r0, r4, #0
	adds r0, #0x4a
	ldrh r0, [r0]
	bl sub_0801782C
	cmp r0, #3
	bne _08029418
	movs r0, #0x13
	ldrsb r0, [r6, r0]
	adds r0, #1
	asrs r0, r0, #1
	adds r1, r4, #0
	adds r1, #0x5a
	strh r0, [r1]
	cmp r0, #0
	bne _08029408
	movs r0, #1
	strh r0, [r1]
_08029408:
	adds r0, r6, #0
	adds r0, #0x5c
	strh r5, [r0]
	adds r0, r4, #0
	adds r0, #0x66
	strh r5, [r0]
	adds r0, #4
	strh r5, [r0]
_08029418:
	ldr r0, [r4, #0x4c]
	movs r1, #0x80
	lsls r1, r1, #0xa
	ands r0, r1
	cmp r0, #0
	beq _0802942C
	adds r1, r6, #0
	adds r1, #0x5c
	movs r0, #0
	strh r0, [r1]
_0802942C:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_08029434
sub_08029434: @ 0x08029434
	push {r4, r5, lr}
	ldr r4, _08029458 @ =0x0203A4EC
	ldr r5, _0802945C @ =0x0203A508
	movs r2, #0
	movs r3, #0
	adds r0, r4, #0
	movs r1, #6
_08029442:
	strh r3, [r0]
	strb r2, [r0, #2]
	strb r2, [r0, #3]
	adds r0, #4
	subs r1, #1
	cmp r1, #0
	bge _08029442
	str r4, [r5]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08029458: .4byte 0x0203A4EC
_0802945C: .4byte 0x0203A508

	thumb_func_start sub_08029460
sub_08029460: @ 0x08029460
	push {r4, r5, lr}
	sub sp, #8
	bl sub_08029434
	add r4, sp, #4
	mov r0, sp
	adds r1, r4, #0
	bl sub_080294D8
	ldr r5, _080294D4 @ =0x0203A508
	ldr r1, [r5]
	movs r0, #1
	ldrb r2, [r1, #2]
	orrs r0, r2
	strb r0, [r1, #2]
	ldr r0, [sp]
	ldr r1, [sp, #4]
	bl sub_08029568
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080294C0
	ldr r1, [r5]
	movs r0, #8
	ldrh r2, [r1]
	orrs r0, r2
	strh r0, [r1]
	ldr r0, [sp, #4]
	ldr r1, [sp]
	bl sub_08029568
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080294C0
	mov r0, sp
	adds r1, r4, #0
	bl sub_080294EC
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080294C0
	ldr r1, [r5]
	movs r0, #4
	strh r0, [r1]
	ldr r0, [sp]
	ldr r1, [sp, #4]
	bl sub_08029568
_080294C0:
	ldr r0, _080294D4 @ =0x0203A508
	ldr r1, [r0]
	movs r0, #0x80
	ldrb r2, [r1, #2]
	orrs r0, r2
	strb r0, [r1, #2]
	add sp, #8
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080294D4: .4byte 0x0203A508

	thumb_func_start sub_080294D8
sub_080294D8: @ 0x080294D8
	ldr r2, _080294E4 @ =0x0203A3EC
	str r2, [r0]
	ldr r0, _080294E8 @ =0x0203A46C
	str r0, [r1]
	bx lr
	.align 2, 0
_080294E4: .4byte 0x0203A3EC
_080294E8: .4byte 0x0203A46C

	thumb_func_start sub_080294EC
sub_080294EC: @ 0x080294EC
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	adds r7, r1, #0
	ldr r0, _08029520 @ =0x0203A46C
	adds r2, r0, #0
	adds r2, #0x5e
	movs r3, #0
	ldrsh r1, [r2, r3]
	adds r6, r0, #0
	cmp r1, #0xfa
	bgt _0802955E
	ldr r0, _08029524 @ =0x0203A3EC
	adds r1, r0, #0
	adds r1, #0x5e
	movs r5, #0
	ldrsh r3, [r1, r5]
	movs r1, #0
	ldrsh r2, [r2, r1]
	subs r1, r3, r2
	adds r5, r0, #0
	cmp r1, #0
	blt _08029528
	cmp r1, #3
	ble _0802955E
	b _0802952E
	.align 2, 0
_08029520: .4byte 0x0203A46C
_08029524: .4byte 0x0203A3EC
_08029528:
	subs r0, r2, r3
	cmp r0, #3
	ble _0802955E
_0802952E:
	adds r0, r5, #0
	adds r0, #0x5e
	adds r2, r6, #0
	adds r2, #0x5e
	movs r3, #0
	ldrsh r1, [r0, r3]
	movs r3, #0
	ldrsh r0, [r2, r3]
	cmp r1, r0
	ble _08029548
	str r5, [r4]
	str r6, [r7]
	b _0802954C
_08029548:
	str r6, [r4]
	str r5, [r7]
_0802954C:
	ldr r0, [r4]
	adds r0, #0x4a
	ldrh r0, [r0]
	bl sub_0801782C
	cmp r0, #3
	beq _0802955E
	movs r0, #1
	b _08029560
_0802955E:
	movs r0, #0
_08029560:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_08029568
sub_08029568: @ 0x08029568
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r6, r0, #0
	mov r8, r1
	adds r0, #0x48
	ldrh r0, [r0]
	cmp r0, #0
	bne _08029580
	b _080295B4
_0802957C:
	movs r0, #1
	b _080295B6
_08029580:
	ldr r0, _080295C0 @ =0x0203A508
	ldr r0, [r0]
	ldrh r7, [r0]
	adds r0, r6, #0
	bl sub_080295C4
	adds r5, r0, #0
	movs r4, #0
	cmp r4, r5
	bge _080295B4
_08029594:
	ldr r0, _080295C0 @ =0x0203A508
	ldr r1, [r0]
	adds r0, r7, #0
	ldrh r2, [r1]
	orrs r0, r2
	strh r0, [r1]
	adds r0, r6, #0
	mov r1, r8
	bl sub_08029988
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0802957C
	adds r4, #1
	cmp r4, r5
	blt _08029594
_080295B4:
	movs r0, #0
_080295B6:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_080295C0: .4byte 0x0203A508

	thumb_func_start sub_080295C4
sub_080295C4: @ 0x080295C4
	push {r4, lr}
	movs r4, #1
	bl sub_080295D8
	lsls r4, r0
	adds r0, r4, #0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_080295D8
sub_080295D8: @ 0x080295D8
	ldr r0, [r0, #0x4c]
	movs r1, #0x20
	ands r0, r1
	cmp r0, #0
	beq _080295F8
	ldr r0, _080295F4 @ =0x0203A508
	ldr r1, [r0]
	movs r0, #0x10
	ldrh r2, [r1]
	orrs r0, r2
	strh r0, [r1]
	movs r0, #1
	b _080295FA
	.align 2, 0
_080295F4: .4byte 0x0203A508
_080295F8:
	movs r0, #0
_080295FA:
	bx lr

	thumb_func_start sub_080295FC
sub_080295FC: @ 0x080295FC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r1, _080296A8 @ =0x081C94C0
	mov r0, sp
	movs r2, #8
	bl memcpy
	movs r3, #0
	ldr r0, [r4]
	ldr r1, [r4, #4]
	ldr r6, [r0, #0x28]
	ldr r0, [r1, #0x28]
	orrs r6, r0
	movs r0, #0xc0
	lsls r0, r0, #0xf
	ands r6, r0
	movs r0, #0x10
	ldrsb r0, [r5, r0]
	mov sl, r0
	ldrb r5, [r5, #0x11]
	lsls r5, r5, #0x18
	asrs r5, r5, #0x18
	mov sb, r5
	movs r7, #0xc0
	ldrb r4, [r4, #0xb]
	ands r7, r4
	ldr r0, _080296AC @ =0x0203A3D4
	str r3, [r0, #0x10]
	str r3, [r0, #0x14]
	mov r5, sp
	movs r0, #3
	mov r8, r0
_08029648:
	movs r0, #1
	ldrsb r0, [r5, r0]
	add r0, sb
	ldr r1, _080296B0 @ =gBmMapUnit
	ldr r1, [r1]
	lsls r0, r0, #2
	adds r0, r0, r1
	movs r1, #0
	ldrsb r1, [r5, r1]
	ldr r0, [r0]
	add r1, sl
	adds r0, r0, r1
	ldrb r4, [r0]
	cmp r4, #0
	beq _080296BC
	adds r0, r4, #0
	str r3, [sp, #8]
	bl GetUnit
	adds r2, r0, #0
	movs r0, #0xc0
	ands r4, r0
	ldr r3, [sp, #8]
	cmp r4, r7
	bne _080296BC
	adds r1, r2, #0
	adds r1, #0x30
	movs r0, #0xf
	ldrb r1, [r1]
	ands r0, r1
	cmp r0, #2
	beq _080296BC
	ldr r0, [r2]
	ldr r1, [r2, #4]
	ldr r0, [r0, #0x28]
	ldr r1, [r1, #0x28]
	orrs r0, r1
	ands r0, r6
	cmp r0, #0
	beq _080296BC
	adds r3, #1
	ldr r1, _080296AC @ =0x0203A3D4
	ldr r0, [r1, #0x10]
	cmp r0, #0
	bne _080296B4
	str r2, [r1, #0x10]
	b _080296BC
	.align 2, 0
_080296A8: .4byte 0x081C94C0
_080296AC: .4byte 0x0203A3D4
_080296B0: .4byte gBmMapUnit
_080296B4:
	ldr r0, [r1, #0x14]
	cmp r0, #0
	bne _080296BC
	str r2, [r1, #0x14]
_080296BC:
	adds r5, #2
	movs r0, #1
	rsbs r0, r0, #0
	add r8, r0
	mov r0, r8
	cmp r0, #0
	bge _08029648
	movs r0, #0
	cmp r3, #1
	ble _080296D2
	movs r0, #1
_080296D2:
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_080296E4
sub_080296E4: @ 0x080296E4
	adds r3, r0, #0
	ldr r2, _08029710 @ =0x0203A3D4
	adds r0, #0x5a
	ldrh r0, [r0]
	strh r0, [r2, #6]
	adds r1, #0x5c
	ldrh r0, [r1]
	strh r0, [r2, #8]
	adds r0, r3, #0
	adds r0, #0x64
	ldrh r0, [r0]
	strh r0, [r2, #0xa]
	adds r0, r3, #0
	adds r0, #0x6a
	ldrh r0, [r0]
	strh r0, [r2, #0xc]
	adds r0, r3, #0
	adds r0, #0x6c
	ldrh r0, [r0]
	strh r0, [r2, #0xe]
	bx lr
	.align 2, 0
_08029710: .4byte 0x0203A3D4

	thumb_func_start sub_08029714
sub_08029714: @ 0x08029714
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	ldr r4, _0802973C @ =0x0203A3D4
	movs r5, #0
	movs r0, #0
	strh r0, [r4, #4]
	ldrh r0, [r4, #0xa]
	movs r1, #1
	bl sub_08028A34
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08029744
	ldr r0, _08029740 @ =0x0203A508
	ldr r1, [r0]
	movs r0, #2
	ldrh r2, [r1]
	orrs r0, r2
	strh r0, [r1]
	b _080297C4
	.align 2, 0
_0802973C: .4byte 0x0203A3D4
_08029740: .4byte 0x0203A508
_08029744:
	ldrh r1, [r4, #6]
	ldrh r2, [r4, #8]
	subs r0, r1, r2
	strh r0, [r4, #4]
	ldrh r0, [r4, #0xc]
	movs r1, #0
	bl sub_08028A08
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne _0802979A
	ldrh r0, [r4, #0xe]
	movs r1, #0
	bl sub_08028A08
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne _08029784
	ldr r0, _08029780 @ =0x0203A508
	ldr r1, [r0]
	movs r2, #0x80
	lsls r2, r2, #4
	adds r0, r2, #0
	ldrh r2, [r1]
	orrs r0, r2
	strh r0, [r1]
	movs r0, #0x7f
	b _08029798
	.align 2, 0
_08029780: .4byte 0x0203A508
_08029784:
	ldr r0, _080297CC @ =0x0203A508
	ldr r1, [r0]
	movs r0, #1
	ldrh r2, [r1]
	orrs r0, r2
	strh r0, [r1]
	movs r0, #4
	ldrsh r1, [r4, r0]
	lsls r0, r1, #1
	adds r0, r0, r1
_08029798:
	strh r0, [r4, #4]
_0802979A:
	ldr r1, _080297D0 @ =0x0203A3D4
	movs r2, #4
	ldrsh r0, [r1, r2]
	cmp r0, #0x7f
	ble _080297A8
	movs r0, #0x7f
	strh r0, [r1, #4]
_080297A8:
	movs r2, #4
	ldrsh r0, [r1, r2]
	cmp r0, #0
	bge _080297B4
	movs r0, #0
	strh r0, [r1, #4]
_080297B4:
	movs r2, #4
	ldrsh r0, [r1, r2]
	cmp r0, #0
	beq _080297C4
	adds r1, r6, #0
	adds r1, #0x7c
	movs r0, #1
	strb r0, [r1]
_080297C4:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080297CC: .4byte 0x0203A508
_080297D0: .4byte 0x0203A3D4

	thumb_func_start sub_080297D4
sub_080297D4: @ 0x080297D4
	push {r4, r5, lr}
	adds r2, r0, #0
	adds r3, r1, #0
	ldr r0, [r2]
	ldr r1, [r2, #4]
	ldr r0, [r0, #0x28]
	ldr r1, [r1, #0x28]
	orrs r0, r1
	movs r1, #0xc0
	lsls r1, r1, #0xf
	ands r0, r1
	cmp r0, #0
	beq _0802983C
	ldr r4, _08029844 @ =0x0203A3D4
	ldrb r1, [r4, #2]
	cmp r1, #1
	bne _0802983C
	ldr r5, _08029848 @ =0x0203A508
	ldr r0, [r5]
	ldrb r0, [r0, #2]
	ands r1, r0
	cmp r1, #0
	beq _0802983C
	adds r1, r2, #0
	adds r1, #0x30
	movs r0, #0xf
	ldrb r1, [r1]
	ands r0, r1
	cmp r0, #4
	beq _0802983C
	movs r0, #0x20
	ldrh r1, [r4]
	ands r0, r1
	cmp r0, #0
	bne _0802983C
	adds r0, r2, #0
	adds r1, r3, #0
	bl sub_080295FC
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0802983C
	ldr r1, [r5]
	movs r2, #0x80
	lsls r2, r2, #3
	adds r0, r2, #0
	ldrh r2, [r1]
	orrs r0, r2
	strh r0, [r1]
	movs r0, #0x64
	strh r0, [r4, #0xc]
	strh r0, [r4, #0xa]
_0802983C:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08029844: .4byte 0x0203A3D4
_08029848: .4byte 0x0203A508

	thumb_func_start sub_0802984C
sub_0802984C: @ 0x0802984C
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	adds r7, r1, #0
	adds r1, r5, #0
	adds r1, #0x7b
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	ldr r6, _08029880 @ =0x0203A508
	ldr r1, [r6]
	movs r0, #2
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _0802993E
	adds r4, r5, #0
	adds r4, #0x48
	ldrh r0, [r4]
	bl sub_0801782C
	cmp r0, #1
	beq _08029884
	cmp r0, #3
	beq _08029890
	b _0802989E
	.align 2, 0
_08029880: .4byte 0x0203A508
_08029884:
	adds r1, r7, #0
	adds r1, #0x6f
	strb r0, [r1]
	ldr r0, [r6]
	movs r1, #0x40
	b _08029898
_08029890:
	ldr r0, [r6]
	movs r3, #0x80
	lsls r3, r3, #2
	adds r1, r3, #0
_08029898:
	ldrh r2, [r0]
	orrs r1, r2
	strh r1, [r0]
_0802989E:
	ldrh r0, [r4]
	bl sub_0801782C
	cmp r0, #4
	bne _080298EC
	movs r1, #0x19
	ldrsb r1, [r5, r1]
	movs r0, #0x1f
	subs r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	movs r1, #0
	bl sub_08028A08
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080298EC
	ldr r0, _080298E4 @ =0x0203A508
	ldr r1, [r0]
	movs r0, #0x80
	movs r2, #0
	ldrh r3, [r1]
	orrs r0, r3
	strh r0, [r1]
	ldr r0, _080298E8 @ =0x0203A3D4
	ldrb r1, [r5, #0x13]
	ldrb r0, [r0, #4]
	subs r0, r1, r0
	strb r0, [r5, #0x13]
	lsls r0, r0, #0x18
	cmp r0, #0
	bge _0802990E
	strb r2, [r5, #0x13]
	b _0802990E
	.align 2, 0
_080298E4: .4byte 0x0203A508
_080298E8: .4byte 0x0203A3D4
_080298EC:
	ldr r1, _08029980 @ =0x0203A3D4
	movs r2, #0x13
	ldrsb r2, [r7, r2]
	movs r3, #4
	ldrsh r0, [r1, r3]
	cmp r0, r2
	ble _080298FC
	strh r2, [r1, #4]
_080298FC:
	ldrb r2, [r7, #0x13]
	ldrb r1, [r1, #4]
	subs r0, r2, r1
	strb r0, [r7, #0x13]
	lsls r0, r0, #0x18
	cmp r0, #0
	bge _0802990E
	movs r0, #0
	strb r0, [r7, #0x13]
_0802990E:
	ldrh r0, [r4]
	bl sub_0801782C
	cmp r0, #2
	bne _0802993E
	ldr r0, _08029980 @ =0x0203A3D4
	ldrb r3, [r5, #0x13]
	ldrb r0, [r0, #4]
	adds r0, r3, r0
	strb r0, [r5, #0x13]
	lsls r0, r0, #0x18
	ldrb r2, [r5, #0x12]
	lsls r1, r2, #0x18
	cmp r0, r1
	ble _0802992E
	strb r2, [r5, #0x13]
_0802992E:
	ldr r0, _08029984 @ =0x0203A508
	ldr r1, [r0]
	movs r2, #0x80
	lsls r2, r2, #1
	adds r0, r2, #0
	ldrh r3, [r1]
	orrs r0, r3
	strh r0, [r1]
_0802993E:
	ldr r2, _08029984 @ =0x0203A508
	ldr r1, [r2]
	ldr r0, _08029980 @ =0x0203A3D4
	ldrh r0, [r0, #4]
	strb r0, [r1, #3]
	ldr r1, [r2]
	movs r0, #2
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	beq _0802995E
	ldr r0, [r5, #0x4c]
	movs r1, #0x82
	ands r0, r1
	cmp r0, #0
	beq _08029978
_0802995E:
	adds r4, r5, #0
	adds r4, #0x48
	ldrh r0, [r4]
	bl GetItemAfterUse
	strh r0, [r4]
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _08029978
	adds r1, r5, #0
	adds r1, #0x7d
	movs r0, #1
	strb r0, [r1]
_08029978:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08029980: .4byte 0x0203A3D4
_08029984: .4byte 0x0203A508

	thumb_func_start sub_08029988
sub_08029988: @ 0x08029988
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r6, _08029A00 @ =0x0203A46C
	cmp r4, r6
	bne _080299A0
	ldr r0, _08029A04 @ =0x0203A508
	ldr r1, [r0]
	movs r0, #8
	ldrb r2, [r1, #2]
	orrs r0, r2
	strb r0, [r1, #2]
_080299A0:
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_080296E4
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_080297D4
	adds r0, r4, #0
	bl sub_08029714
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_0802984C
	movs r0, #0x13
	ldrsb r0, [r4, r0]
	cmp r0, #0
	beq _080299CE
	movs r0, #0x13
	ldrsb r0, [r5, r0]
	cmp r0, #0
	bne _08029A08
_080299CE:
	adds r1, r4, #0
	adds r1, #0x7b
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	ldr r2, _08029A04 @ =0x0203A508
	ldr r1, [r2]
	movs r0, #2
	ldrb r3, [r1, #2]
	orrs r0, r3
	strb r0, [r1, #2]
	movs r0, #0x13
	ldrsb r0, [r6, r0]
	cmp r0, #0
	bne _080299F6
	ldr r1, [r2]
	movs r0, #4
	ldrb r3, [r1, #2]
	orrs r0, r3
	strb r0, [r1, #2]
_080299F6:
	ldr r0, [r2]
	adds r0, #4
	str r0, [r2]
	movs r0, #1
	b _08029A12
	.align 2, 0
_08029A00: .4byte 0x0203A46C
_08029A04: .4byte 0x0203A508
_08029A08:
	ldr r1, _08029A18 @ =0x0203A508
	ldr r0, [r1]
	adds r0, #4
	str r0, [r1]
	movs r0, #0
_08029A12:
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_08029A18: .4byte 0x0203A508

	thumb_func_start sub_08029A1C
sub_08029A1C: @ 0x08029A1C
	push {r4, r5, r6, lr}
	ldr r5, _08029A84 @ =0x0203A3EC
	movs r0, #0xb
	ldrsb r0, [r5, r0]
	movs r1, #0xc0
	ands r0, r1
	cmp r0, #0
	bne _08029A3A
	ldr r0, _08029A88 @ =0x0203A46C
	ldrb r0, [r0, #0xb]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	ands r0, r1
	cmp r0, #0
	beq _08029A7E
_08029A3A:
	ldr r1, _08029A8C @ =gPlaySt
	movs r0, #0x80
	ldrb r1, [r1, #0x14]
	ands r0, r1
	cmp r0, #0
	bne _08029A7E
	ldr r4, _08029A88 @ =0x0203A46C
	adds r0, r5, #0
	adds r1, r4, #0
	bl sub_0802A3C0
	adds r6, r5, #0
	adds r6, #0x6e
	strb r0, [r6]
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_0802A3C0
	adds r1, r4, #0
	adds r1, #0x6e
	strb r0, [r1]
	ldrb r2, [r5, #9]
	ldrb r6, [r6]
	adds r1, r2, r6
	strb r1, [r5, #9]
	ldrb r1, [r4, #9]
	adds r0, r1, r0
	strb r0, [r4, #9]
	adds r0, r5, #0
	bl sub_08029B10
	adds r0, r4, #0
	bl sub_08029B10
_08029A7E:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08029A84: .4byte 0x0203A3EC
_08029A88: .4byte 0x0203A46C
_08029A8C: .4byte gPlaySt

	thumb_func_start GetStatIncrease
GetStatIncrease: @ 0x08029A90
	push {r4, lr}
	movs r4, #0
	cmp r0, #0x64
	ble _08029AA0
_08029A98:
	adds r4, #1
	subs r0, #0x64
	cmp r0, #0x64
	bgt _08029A98
_08029AA0:
	bl RandRoll
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08029AAC
	adds r4, #1
_08029AAC:
	adds r0, r4, #0
	pop {r4}
	pop {r1}
	bx r1

	thumb_func_start GetAutoleveledStatIncrease
GetAutoleveledStatIncrease: @ 0x08029AB4
	push {r4, lr}
	adds r4, r0, #0
	muls r4, r1, r4
	adds r0, r4, #0
	cmp r4, #0
	bge _08029AC2
	adds r0, r4, #3
_08029AC2:
	asrs r0, r0, #2
	bl RandNext
	adds r1, r0, #0
	adds r0, r4, #0
	cmp r4, #0
	bge _08029AD2
	adds r0, r4, #7
_08029AD2:
	asrs r0, r0, #3
	subs r0, r1, r0
	adds r0, r4, r0
	bl GetStatIncrease
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_08029AE4
sub_08029AE4: @ 0x08029AE4
	adds r2, r0, #0
	ldr r1, _08029B08 @ =gBmSt
	movs r0, #0x40
	ldrb r1, [r1, #4]
	ands r0, r1
	cmp r0, #0
	bne _08029B02
	ldrb r0, [r2, #9]
	cmp r0, #0xff
	beq _08029B0C
	movs r0, #0xc0
	ldrb r2, [r2, #0xb]
	ands r0, r2
	cmp r0, #0
	bne _08029B0C
_08029B02:
	movs r0, #1
	b _08029B0E
	.align 2, 0
_08029B08: .4byte gBmSt
_08029B0C:
	movs r0, #0
_08029B0E:
	bx lr

	thumb_func_start sub_08029B10
sub_08029B10: @ 0x08029B10
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x10
	adds r7, r0, #0
	bl sub_08029AE4
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08029B2A
	b _08029CB8
_08029B2A:
	ldrb r0, [r7, #9]
	cmp r0, #0x63
	bhi _08029B32
	b _08029CB8
_08029B32:
	adds r2, r0, #0
	subs r2, #0x64
	strb r2, [r7, #9]
	ldrb r0, [r7, #8]
	adds r0, #1
	strb r0, [r7, #8]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0x14
	bne _08029B54
	adds r1, r7, #0
	adds r1, #0x6e
	ldrb r3, [r1]
	subs r0, r3, r2
	strb r0, [r1]
	movs r0, #0xff
	strb r0, [r7, #9]
_08029B54:
	ldr r0, [r7, #0xc]
	movs r1, #0x80
	lsls r1, r1, #6
	ands r0, r1
	movs r1, #0
	mov sl, r1
	cmp r0, #0
	beq _08029B68
	movs r3, #5
	mov sl, r3
_08029B68:
	ldr r0, [r7]
	ldrb r0, [r0, #0x1c]
	add r0, sl
	bl GetStatIncrease
	adds r1, r7, #0
	adds r1, #0x73
	str r1, [sp]
	strb r0, [r1]
	movs r6, #0
	ldrsb r6, [r1, r6]
	ldr r0, [r7]
	ldrb r0, [r0, #0x1d]
	add r0, sl
	bl GetStatIncrease
	adds r3, r7, #0
	adds r3, #0x74
	str r3, [sp, #4]
	strb r0, [r3]
	movs r0, #0
	ldrsb r0, [r3, r0]
	adds r6, r6, r0
	ldr r0, [r7]
	ldrb r0, [r0, #0x1e]
	add r0, sl
	bl GetStatIncrease
	movs r1, #0x75
	adds r1, r1, r7
	mov r8, r1
	strb r0, [r1]
	movs r0, #0
	ldrsb r0, [r1, r0]
	adds r6, r6, r0
	ldr r0, [r7]
	ldrb r0, [r0, #0x1f]
	add r0, sl
	bl GetStatIncrease
	movs r3, #0x76
	adds r3, r3, r7
	mov sb, r3
	strb r0, [r3]
	movs r0, #0
	ldrsb r0, [r3, r0]
	adds r6, r6, r0
	ldr r0, [r7]
	adds r0, #0x20
	ldrb r0, [r0]
	add r0, sl
	bl GetStatIncrease
	adds r5, r7, #0
	adds r5, #0x77
	strb r0, [r5]
	movs r0, #0
	ldrsb r0, [r5, r0]
	adds r6, r6, r0
	ldr r0, [r7]
	adds r0, #0x21
	ldrb r0, [r0]
	add r0, sl
	bl GetStatIncrease
	adds r4, r7, #0
	adds r4, #0x78
	strb r0, [r4]
	movs r0, #0
	ldrsb r0, [r4, r0]
	adds r6, r6, r0
	ldr r0, [r7]
	adds r0, #0x22
	ldrb r0, [r0]
	add r0, sl
	bl GetStatIncrease
	adds r1, r7, #0
	adds r1, #0x79
	strb r0, [r1]
	movs r0, #0
	ldrsb r0, [r1, r0]
	adds r6, r6, r0
	ldr r0, [sp]
	str r0, [sp, #0xc]
	ldr r3, [sp, #4]
	str r3, [sp, #8]
	mov sl, r8
	mov r8, r5
	adds r5, r4, #0
	adds r4, r1, #0
	cmp r6, #0
	bne _08029CAA
	b _08029C94
_08029C24:
	ldr r0, [r7]
	ldrb r0, [r0, #0x1d]
	bl GetStatIncrease
	ldr r1, [sp, #8]
	strb r0, [r1]
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08029CAA
	ldr r0, [r7]
	ldrb r0, [r0, #0x1e]
	bl GetStatIncrease
	mov r3, sl
	strb r0, [r3]
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08029CAA
	ldr r0, [r7]
	ldrb r0, [r0, #0x1f]
	bl GetStatIncrease
	mov r1, sb
	strb r0, [r1]
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08029CAA
	ldr r0, [r7]
	adds r0, #0x20
	ldrb r0, [r0]
	bl GetStatIncrease
	mov r3, r8
	strb r0, [r3]
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08029CAA
	ldr r0, [r7]
	adds r0, #0x21
	ldrb r0, [r0]
	bl GetStatIncrease
	strb r0, [r5]
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08029CAA
	ldr r0, [r7]
	adds r0, #0x22
	ldrb r0, [r0]
	bl GetStatIncrease
	strb r0, [r4]
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08029CAA
	adds r6, #1
_08029C94:
	cmp r6, #1
	bgt _08029CAA
	ldr r0, [r7]
	ldrb r0, [r0, #0x1c]
	bl GetStatIncrease
	ldr r1, [sp, #0xc]
	strb r0, [r1]
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08029C24
_08029CAA:
	movs r0, #0xb
	ldrsb r0, [r7, r0]
	bl GetUnit
	adds r1, r7, #0
	bl sub_08029E20
_08029CB8:
	add sp, #0x10
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_08029CC8
sub_08029CC8: @ 0x08029CC8
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	ldr r0, [r4, #4]
	ldrb r0, [r0, #5]
	bl GetClassData
	adds r3, r0, #0
	adds r0, #0x22
	ldrb r1, [r4, #0x12]
	ldrb r0, [r0]
	adds r0, r1, r0
	strb r0, [r4, #0x12]
	lsls r0, r0, #0x18
	ldrb r2, [r3, #0x13]
	lsls r1, r2, #0x18
	cmp r0, r1
	ble _08029CEC
	strb r2, [r4, #0x12]
_08029CEC:
	adds r0, r3, #0
	adds r0, #0x23
	ldrb r5, [r4, #0x14]
	ldrb r0, [r0]
	adds r0, r5, r0
	strb r0, [r4, #0x14]
	lsls r0, r0, #0x18
	ldrb r2, [r3, #0x14]
	lsls r1, r2, #0x18
	cmp r0, r1
	ble _08029D04
	strb r2, [r4, #0x14]
_08029D04:
	adds r0, r3, #0
	adds r0, #0x24
	ldrb r7, [r4, #0x15]
	ldrb r0, [r0]
	adds r0, r7, r0
	strb r0, [r4, #0x15]
	lsls r0, r0, #0x18
	ldrb r2, [r3, #0x15]
	lsls r1, r2, #0x18
	cmp r0, r1
	ble _08029D1C
	strb r2, [r4, #0x15]
_08029D1C:
	adds r0, r3, #0
	adds r0, #0x25
	ldrb r1, [r4, #0x16]
	ldrb r0, [r0]
	adds r0, r1, r0
	strb r0, [r4, #0x16]
	lsls r0, r0, #0x18
	ldrb r2, [r3, #0x16]
	lsls r1, r2, #0x18
	cmp r0, r1
	ble _08029D34
	strb r2, [r4, #0x16]
_08029D34:
	adds r0, r3, #0
	adds r0, #0x26
	ldrb r5, [r4, #0x17]
	ldrb r0, [r0]
	adds r0, r5, r0
	strb r0, [r4, #0x17]
	lsls r0, r0, #0x18
	ldrb r2, [r3, #0x17]
	lsls r1, r2, #0x18
	cmp r0, r1
	ble _08029D4C
	strb r2, [r4, #0x17]
_08029D4C:
	adds r0, r3, #0
	adds r0, #0x27
	ldrb r7, [r4, #0x18]
	ldrb r0, [r0]
	adds r0, r7, r0
	strb r0, [r4, #0x18]
	lsls r0, r0, #0x18
	ldrb r2, [r3, #0x18]
	lsls r1, r2, #0x18
	cmp r0, r1
	ble _08029D64
	strb r2, [r4, #0x18]
_08029D64:
	movs r2, #0
	adds r6, r4, #0
	adds r6, #0x28
	adds r5, r6, #0
_08029D6C:
	adds r0, r5, r2
	ldr r1, [r4, #4]
	adds r1, #0x2c
	adds r1, r1, r2
	ldrb r7, [r0]
	ldrb r1, [r1]
	subs r1, r7, r1
	strb r1, [r0]
	adds r2, #1
	cmp r2, #7
	ble _08029D6C
	str r3, [r4, #4]
	movs r2, #0
	adds r3, r6, #0
_08029D88:
	adds r1, r3, r2
	ldr r0, [r4, #4]
	adds r0, #0x2c
	adds r0, r0, r2
	ldrb r0, [r0]
	ldrb r5, [r1]
	adds r0, r0, r5
	cmp r0, #0xfb
	ble _08029D9C
	movs r0, #0xfb
_08029D9C:
	strb r0, [r1]
	adds r2, #1
	cmp r2, #7
	ble _08029D88
	movs r1, #0
	movs r0, #1
	strb r0, [r4, #8]
	strb r1, [r4, #9]
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_08029DB4
sub_08029DB4: @ 0x08029DB4
	push {r4, lr}
	adds r3, r0, #0
	ldrb r2, [r3, #0x12]
	ldrb r4, [r1, #0x12]
	subs r0, r2, r4
	adds r2, r3, #0
	adds r2, #0x73
	strb r0, [r2]
	ldrb r0, [r3, #0x14]
	ldrb r4, [r1, #0x14]
	subs r2, r0, r4
	adds r0, r3, #0
	adds r0, #0x74
	strb r2, [r0]
	ldrb r2, [r3, #0x15]
	ldrb r4, [r1, #0x15]
	subs r0, r2, r4
	adds r2, r3, #0
	adds r2, #0x75
	strb r0, [r2]
	ldrb r2, [r3, #0x16]
	ldrb r4, [r1, #0x16]
	subs r0, r2, r4
	adds r2, r3, #0
	adds r2, #0x76
	strb r0, [r2]
	ldrb r2, [r3, #0x17]
	ldrb r4, [r1, #0x17]
	subs r0, r2, r4
	adds r2, r3, #0
	adds r2, #0x77
	strb r0, [r2]
	ldrb r0, [r3, #0x18]
	ldrb r4, [r1, #0x18]
	subs r2, r0, r4
	adds r0, r3, #0
	adds r0, #0x78
	strb r2, [r0]
	ldrb r2, [r3, #0x19]
	ldrb r4, [r1, #0x19]
	subs r0, r2, r4
	adds r2, r3, #0
	adds r2, #0x79
	strb r0, [r2]
	ldrb r0, [r3, #0x1a]
	ldrb r1, [r1, #0x1a]
	subs r1, r0, r1
	adds r0, r3, #0
	adds r0, #0x7a
	strb r1, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_08029E20
sub_08029E20: @ 0x08029E20
	push {r4, r5, r6, lr}
	adds r2, r0, #0
	mov ip, r1
	movs r1, #0x12
	ldrsb r1, [r2, r1]
	mov r0, ip
	adds r0, #0x73
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r1, r1, r0
	movs r0, #0xc0
	ldrb r3, [r2, #0xb]
	ands r0, r3
	cmp r0, #0x80
	bne _08029E46
	cmp r1, #0x78
	bgt _08029E4A
	b _08029E66
_08029E46:
	cmp r1, #0x3c
	ble _08029E66
_08029E4A:
	movs r1, #0x12
	ldrsb r1, [r2, r1]
	movs r0, #0xc0
	ldrb r6, [r2, #0xb]
	ands r0, r6
	cmp r0, #0x80
	bne _08029E5C
	movs r0, #0x78
	b _08029E5E
_08029E5C:
	movs r0, #0x3c
_08029E5E:
	subs r0, r0, r1
	mov r1, ip
	adds r1, #0x73
	strb r0, [r1]
_08029E66:
	movs r0, #0x14
	ldrsb r0, [r2, r0]
	mov r4, ip
	adds r4, #0x74
	movs r1, #0
	ldrsb r1, [r4, r1]
	adds r0, r0, r1
	ldr r5, [r2, #4]
	movs r1, #0x14
	ldrsb r1, [r5, r1]
	adds r3, r5, #0
	cmp r0, r1
	ble _08029E88
	ldrb r1, [r3, #0x14]
	ldrb r6, [r2, #0x14]
	subs r0, r1, r6
	strb r0, [r4]
_08029E88:
	movs r0, #0x15
	ldrsb r0, [r2, r0]
	mov r4, ip
	adds r4, #0x75
	movs r1, #0
	ldrsb r1, [r4, r1]
	adds r0, r0, r1
	movs r1, #0x15
	ldrsb r1, [r3, r1]
	cmp r0, r1
	ble _08029EA6
	ldrb r1, [r3, #0x15]
	ldrb r6, [r2, #0x15]
	subs r0, r1, r6
	strb r0, [r4]
_08029EA6:
	movs r0, #0x16
	ldrsb r0, [r2, r0]
	mov r4, ip
	adds r4, #0x76
	movs r1, #0
	ldrsb r1, [r4, r1]
	adds r0, r0, r1
	movs r1, #0x16
	ldrsb r1, [r3, r1]
	cmp r0, r1
	ble _08029EC4
	ldrb r1, [r3, #0x16]
	ldrb r6, [r2, #0x16]
	subs r0, r1, r6
	strb r0, [r4]
_08029EC4:
	movs r0, #0x17
	ldrsb r0, [r2, r0]
	mov r4, ip
	adds r4, #0x77
	movs r1, #0
	ldrsb r1, [r4, r1]
	adds r0, r0, r1
	movs r1, #0x17
	ldrsb r1, [r3, r1]
	cmp r0, r1
	ble _08029EE2
	ldrb r3, [r3, #0x17]
	ldrb r1, [r2, #0x17]
	subs r0, r3, r1
	strb r0, [r4]
_08029EE2:
	movs r0, #0x18
	ldrsb r0, [r2, r0]
	mov r3, ip
	adds r3, #0x78
	movs r1, #0
	ldrsb r1, [r3, r1]
	adds r0, r0, r1
	movs r1, #0x18
	ldrsb r1, [r5, r1]
	cmp r0, r1
	ble _08029F00
	ldrb r5, [r5, #0x18]
	ldrb r6, [r2, #0x18]
	subs r0, r5, r6
	strb r0, [r3]
_08029F00:
	movs r0, #0x19
	ldrsb r0, [r2, r0]
	mov r3, ip
	adds r3, #0x79
	movs r1, #0
	ldrsb r1, [r3, r1]
	adds r0, r0, r1
	cmp r0, #0x1e
	ble _08029F1A
	movs r0, #0x1e
	ldrb r2, [r2, #0x19]
	subs r0, r0, r2
	strb r0, [r3]
_08029F1A:
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	thumb_func_start sub_08029F20
sub_08029F20: @ 0x08029F20
	push {r4, r5, r6, r7, lr}
	ldr r5, _08029F94 @ =0x0203A3EC
	movs r0, #0xb
	ldrsb r0, [r5, r0]
	bl GetUnit
	adds r7, r0, #0
	ldr r4, _08029F98 @ =0x0203A46C
	movs r0, #0xb
	ldrsb r0, [r4, r0]
	bl GetUnit
	adds r6, r0, #0
	adds r0, r5, #0
	adds r0, #0x52
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _08029F5C
	adds r0, r5, #0
	adds r0, #0x51
	ldrb r0, [r0]
	lsls r1, r0, #1
	adds r0, r5, #0
	adds r0, #0x1e
	adds r1, r1, r0
	adds r0, #0x2a
	ldrh r0, [r0]
	strh r0, [r1]
_08029F5C:
	adds r0, r4, #0
	adds r0, #0x52
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _08029F7E
	adds r0, r4, #0
	adds r0, #0x51
	ldrb r0, [r0]
	lsls r1, r0, #1
	adds r0, r4, #0
	adds r0, #0x1e
	adds r1, r1, r0
	adds r0, #0x2a
	ldrh r0, [r0]
	strh r0, [r1]
_08029F7E:
	adds r0, r7, #0
	adds r1, r5, #0
	bl sub_0802A0D4
	cmp r6, #0
	beq _08029F9C
	adds r0, r6, #0
	adds r1, r4, #0
	bl sub_0802A0D4
	b _08029FA2
	.align 2, 0
_08029F94: .4byte 0x0203A3EC
_08029F98: .4byte 0x0203A46C
_08029F9C:
	adds r0, r4, #0
	bl sub_0802A7C4
_08029FA2:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_08029FA8
sub_08029FA8: @ 0x08029FA8
	movs r0, #1
	bx lr

	thumb_func_start sub_08029FAC
sub_08029FAC: @ 0x08029FAC
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	movs r0, #0xc0
	ldrb r1, [r7, #0xb]
	ands r0, r1
	cmp r0, #0
	bne _0802A008
	movs r0, #0x13
	ldrsb r0, [r7, r0]
	cmp r0, #0
	beq _0802A008
	ldr r1, _0802A010 @ =gPlaySt
	movs r0, #0x80
	ldrb r1, [r1, #0x14]
	ands r0, r1
	cmp r0, #0
	bne _0802A008
	ldr r1, _0802A014 @ =gBmSt
	movs r0, #0x40
	ldrb r1, [r1, #4]
	ands r0, r1
	cmp r0, #0
	bne _0802A008
	ldr r1, _0802A018 @ =0x0203A3D4
	movs r0, #0x20
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _0802A01C
	adds r0, r7, #0
	adds r0, #0x52
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _0802A008
	ldr r1, [r7, #0x4c]
	movs r0, #5
	ands r0, r1
	cmp r0, #0
	beq _0802A008
	movs r0, #0x88
	lsls r0, r0, #3
	ands r1, r0
	cmp r1, #0
	beq _0802A01C
_0802A008:
	movs r0, #1
	rsbs r0, r0, #0
	b _0802A090
	.align 2, 0
_0802A010: .4byte gPlaySt
_0802A014: .4byte gBmSt
_0802A018: .4byte 0x0203A3D4
_0802A01C:
	adds r4, r7, #0
	adds r4, #0x50
	adds r5, r7, #0
	adds r5, #0x28
	ldrb r1, [r4]
	adds r0, r1, r5
	ldrb r6, [r0]
	adds r0, r7, #0
	adds r0, #0x48
	ldrh r0, [r0]
	bl GetItemAwardedExp
	adds r1, r7, #0
	adds r1, #0x7b
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	muls r0, r1, r0
	adds r6, r6, r0
	movs r1, #0
	ldrb r3, [r4]
_0802A046:
	ldr r2, [r7, #4]
	cmp r1, r3
	beq _0802A068
	adds r0, r2, #0
	adds r0, #0x2c
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #0xfb
	beq _0802A068
	adds r0, r5, r1
	ldrb r0, [r0]
	cmp r0, #0xfa
	bls _0802A068
	cmp r6, #0xfa
	ble _0802A06E
	movs r6, #0xfa
	b _0802A06E
_0802A068:
	adds r1, #1
	cmp r1, #7
	ble _0802A046
_0802A06E:
	ldr r0, [r7]
	ldr r0, [r0, #0x28]
	ldr r1, [r2, #0x28]
	orrs r0, r1
	movs r1, #0x80
	lsls r1, r1, #1
	ands r0, r1
	cmp r0, #0
	beq _0802A088
	cmp r6, #0xfb
	ble _0802A08E
	movs r6, #0xfb
	b _0802A08E
_0802A088:
	cmp r6, #0xb5
	ble _0802A08E
	movs r6, #0xb5
_0802A08E:
	adds r0, r6, #0
_0802A090:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_0802A098
sub_0802A098: @ 0x0802A098
	push {r4, r5, lr}
	adds r2, r0, #0
	adds r2, #0x50
	adds r1, r0, #0
	adds r1, #0x28
	ldrb r2, [r2]
	adds r1, r2, r1
	ldrb r4, [r1]
	bl sub_08029FAC
	adds r5, r0, #0
	cmp r5, #0
	blt _0802A0CC
	adds r0, r4, #0
	bl sub_08016DA4
	adds r4, r0, #0
	adds r0, r5, #0
	bl sub_08016DA4
	adds r1, r0, #0
	eors r1, r4
	rsbs r0, r1, #0
	orrs r0, r1
	lsrs r0, r0, #0x1f
	b _0802A0CE
_0802A0CC:
	movs r0, #0
_0802A0CE:
	pop {r4, r5}
	pop {r1}
	bx r1

	thumb_func_start sub_0802A0D4
sub_0802A0D4: @ 0x0802A0D4
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldrb r0, [r5, #8]
	strb r0, [r4, #8]
	ldrb r0, [r5, #9]
	strb r0, [r4, #9]
	ldrb r0, [r5, #0x13]
	strb r0, [r4, #0x13]
	ldr r0, [r5, #0xc]
	str r0, [r4, #0xc]
	ldr r2, _0802A1B8 @ =0x03002778
	lsrs r0, r0, #0x11
	movs r1, #7
	ands r0, r1
	strb r0, [r2]
	adds r1, r5, #0
	adds r1, #0x6f
	movs r0, #0
	ldrsb r0, [r1, r0]
	cmp r0, #0
	blt _0802A108
	adds r1, r0, #0
	adds r0, r4, #0
	bl SetUnitStatus
_0802A108:
	adds r0, r5, #0
	adds r0, #0x73
	ldrb r1, [r4, #0x12]
	ldrb r0, [r0]
	adds r0, r1, r0
	strb r0, [r4, #0x12]
	adds r0, r5, #0
	adds r0, #0x74
	ldrb r1, [r4, #0x14]
	ldrb r0, [r0]
	adds r0, r1, r0
	strb r0, [r4, #0x14]
	adds r0, r5, #0
	adds r0, #0x75
	ldrb r1, [r4, #0x15]
	ldrb r0, [r0]
	adds r0, r1, r0
	strb r0, [r4, #0x15]
	adds r0, r5, #0
	adds r0, #0x76
	ldrb r1, [r4, #0x16]
	ldrb r0, [r0]
	adds r0, r1, r0
	strb r0, [r4, #0x16]
	adds r0, r5, #0
	adds r0, #0x77
	ldrb r1, [r4, #0x17]
	ldrb r0, [r0]
	adds r0, r1, r0
	strb r0, [r4, #0x17]
	adds r0, r5, #0
	adds r0, #0x78
	ldrb r1, [r4, #0x18]
	ldrb r0, [r0]
	adds r0, r1, r0
	strb r0, [r4, #0x18]
	adds r0, r5, #0
	adds r0, #0x79
	ldrb r1, [r4, #0x19]
	ldrb r0, [r0]
	adds r0, r1, r0
	strb r0, [r4, #0x19]
	adds r0, r4, #0
	bl UnitCheckStatCaps
	adds r0, r5, #0
	bl sub_08029FAC
	adds r2, r0, #0
	cmp r2, #0
	ble _0802A17C
	adds r1, r5, #0
	adds r1, #0x50
	adds r0, r4, #0
	adds r0, #0x28
	ldrb r1, [r1]
	adds r0, r1, r0
	strb r2, [r0]
_0802A17C:
	adds r6, r5, #0
	adds r6, #0x6e
	adds r1, r5, #0
	adds r1, #0x1e
	adds r3, r4, #0
	adds r3, #0x1e
	movs r2, #4
_0802A18A:
	ldrh r0, [r1]
	strh r0, [r3]
	adds r1, #2
	adds r3, #2
	subs r2, #1
	cmp r2, #0
	bge _0802A18A
	adds r0, r4, #0
	bl UnitRemoveInvalidItems
	movs r0, #0
	ldrsb r0, [r6, r0]
	cmp r0, #0
	beq _0802A1B2
	ldr r0, [r4]
	ldrb r0, [r0, #4]
	movs r1, #0
	ldrsb r1, [r6, r1]
	bl sub_080A0A68
_0802A1B2:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0802A1B8: .4byte 0x03002778

	thumb_func_start sub_0802A1BC
sub_0802A1BC: @ 0x0802A1BC
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	ldrb r0, [r4, #0x13]
	strb r0, [r5, #0x13]
	adds r0, r4, #0
	bl sub_08029FAC
	adds r2, r0, #0
	cmp r2, #0
	ble _0802A1E0
	adds r1, r4, #0
	adds r1, #0x50
	adds r0, r5, #0
	adds r0, #0x28
	ldrb r1, [r1]
	adds r0, r1, r0
	strb r2, [r0]
_0802A1E0:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_0802A1E8
sub_0802A1E8: @ 0x0802A1E8
	push {r4, r5, lr}
	ldr r1, _0802A214 @ =0x0203A3D4
	movs r0, #8
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	beq _0802A20C
	ldr r4, _0802A218 @ =0x0203A3EC
	adds r0, r4, #0
	adds r0, #0x48
	ldrh r0, [r0]
	bl sub_0801769C
	adds r5, r0, #0
	ldrb r0, [r4, #0x1c]
	bl GetTrap
	strb r5, [r0, #6]
_0802A20C:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0802A214: .4byte 0x0203A3D4
_0802A218: .4byte 0x0203A3EC

	thumb_func_start sub_0802A21C
sub_0802A21C: @ 0x0802A21C
	ldr r1, _0802A228 @ =0x0203A50C
	movs r0, #0
	strb r0, [r1]
	strb r0, [r1, #1]
	strb r0, [r1, #2]
	bx lr
	.align 2, 0
_0802A228: .4byte 0x0203A50C

	thumb_func_start sub_0802A22C
sub_0802A22C: @ 0x0802A22C
	movs r3, #8
	ldrsb r3, [r0, r3]
	ldr r1, [r0]
	ldr r2, [r0, #4]
	ldr r0, [r1, #0x28]
	ldr r1, [r2, #0x28]
	orrs r0, r1
	movs r1, #0x80
	lsls r1, r1, #1
	ands r0, r1
	cmp r0, #0
	beq _0802A246
	adds r3, #0x14
_0802A246:
	adds r0, r3, #0
	bx lr
	.align 2, 0

	thumb_func_start sub_0802A24C
sub_0802A24C: @ 0x0802A24C
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	adds r4, r1, #0
	bl sub_0802A22C
	adds r5, r0, #0
	adds r0, r4, #0
	bl sub_0802A22C
	subs r5, r5, r0
	movs r0, #0x1f
	subs r5, r0, r5
	cmp r5, #0
	bge _0802A26A
	movs r5, #0
_0802A26A:
	ldr r0, [r6, #4]
	movs r1, #0x1a
	ldrsb r1, [r0, r1]
	adds r0, r5, #0
	bl __divsi3
	pop {r4, r5, r6}
	pop {r1}
	bx r1

	thumb_func_start sub_0802A27C
sub_0802A27C: @ 0x0802A27C
	push {r4, lr}
	movs r2, #8
	ldrsb r2, [r0, r2]
	ldr r3, [r0, #4]
	movs r1, #0x1a
	ldrsb r1, [r3, r1]
	adds r4, r2, #0
	muls r4, r1, r4
	ldr r0, [r0]
	ldr r0, [r0, #0x28]
	ldr r1, [r3, #0x28]
	orrs r0, r1
	movs r1, #0x80
	lsls r1, r1, #1
	ands r0, r1
	cmp r0, #0
	beq _0802A2B0
	ldrb r0, [r3, #5]
	bl GetClassData
	movs r1, #0x1a
	ldrsb r1, [r0, r1]
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r4, r4, r0
_0802A2B0:
	adds r0, r4, #0
	pop {r4}
	pop {r1}
	bx r1

	thumb_func_start sub_0802A2B8
sub_0802A2B8: @ 0x0802A2B8
	movs r3, #0
	ldr r0, [r1]
	ldr r1, [r1, #4]
	ldr r2, [r0, #0x28]
	ldr r0, [r1, #0x28]
	orrs r2, r0
	movs r0, #8
	ands r0, r2
	cmp r0, #0
	beq _0802A2CE
	movs r3, #0x14
_0802A2CE:
	movs r0, #0x80
	lsls r0, r0, #8
	ands r2, r0
	cmp r2, #0
	beq _0802A2DA
	adds r3, #0x28
_0802A2DA:
	adds r0, r3, #0
	bx lr
	.align 2, 0

	thumb_func_start sub_0802A2E0
sub_0802A2E0: @ 0x0802A2E0
	push {r4, lr}
	ldr r1, [r0]
	ldr r2, [r0, #4]
	ldr r0, [r1, #0x28]
	ldr r1, [r2, #0x28]
	orrs r0, r1
	movs r1, #0x80
	lsls r1, r1, #0x12
	ands r0, r1
	cmp r0, #0
	bne _0802A2FC
	b _0802A316
_0802A2F8:
	movs r0, #2
	b _0802A318
_0802A2FC:
	movs r2, #0
	movs r3, #0x80
	lsls r3, r3, #4
	ldr r1, _0802A320 @ =0x0203A4EC
_0802A304:
	adds r0, r3, #0
	ldrh r4, [r1]
	ands r0, r4
	cmp r0, #0
	bne _0802A2F8
	adds r1, #4
	adds r2, #1
	cmp r2, #6
	ble _0802A304
_0802A316:
	movs r0, #1
_0802A318:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0802A320: .4byte 0x0203A4EC

	thumb_func_start sub_0802A324
sub_0802A324: @ 0x0802A324
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	adds r5, r1, #0
	movs r0, #0x13
	ldrsb r0, [r5, r0]
	cmp r0, #0
	beq _0802A336
	movs r0, #0
	b _0802A3BA
_0802A336:
	movs r6, #0x14
	ldr r1, _0802A360 @ =gPlaySt
	ldrb r0, [r1, #0x1b]
	cmp r0, #1
	beq _0802A34A
	movs r0, #0x40
	ldrb r1, [r1, #0x14]
	ands r0, r1
	cmp r0, #0
	beq _0802A364
_0802A34A:
	adds r0, r5, #0
	bl sub_0802A27C
	adds r6, r0, #0
	adds r6, #0x14
	adds r0, r7, #0
	bl sub_0802A27C
	subs r6, r6, r0
	b _0802A39E
	.align 2, 0
_0802A360: .4byte gPlaySt
_0802A364:
	adds r0, r5, #0
	bl sub_0802A27C
	adds r4, r0, #0
	adds r0, r7, #0
	bl sub_0802A27C
	cmp r4, r0
	bgt _0802A38C
	adds r0, r5, #0
	bl sub_0802A27C
	adds r4, r0, #0
	adds r0, r7, #0
	bl sub_0802A27C
	lsrs r1, r0, #0x1f
	adds r0, r0, r1
	asrs r0, r0, #1
	b _0802A39A
_0802A38C:
	adds r0, r5, #0
	bl sub_0802A27C
	adds r4, r0, #0
	adds r0, r7, #0
	bl sub_0802A27C
_0802A39A:
	subs r4, r4, r0
	adds r6, r6, r4
_0802A39E:
	adds r0, r7, #0
	adds r1, r5, #0
	bl sub_0802A2B8
	adds r6, r6, r0
	adds r0, r7, #0
	adds r1, r5, #0
	bl sub_0802A2E0
	muls r6, r0, r6
	cmp r6, #0
	bge _0802A3B8
	movs r6, #0
_0802A3B8:
	adds r0, r6, #0
_0802A3BA:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	thumb_func_start sub_0802A3C0
sub_0802A3C0: @ 0x0802A3C0
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r6, r1, #0
	bl sub_08029AE4
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0802A3EC
	movs r0, #0x13
	ldrsb r0, [r5, r0]
	cmp r0, #0
	beq _0802A3EC
	ldr r0, [r6]
	ldr r1, [r6, #4]
	ldr r0, [r0, #0x28]
	ldr r1, [r1, #0x28]
	orrs r0, r1
	movs r1, #0x80
	lsls r1, r1, #0x11
	ands r0, r1
	cmp r0, #0
	beq _0802A3F0
_0802A3EC:
	movs r0, #0
	b _0802A424
_0802A3F0:
	adds r0, r5, #0
	adds r0, #0x7c
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne _0802A402
	movs r0, #1
	b _0802A424
_0802A402:
	adds r0, r5, #0
	adds r1, r6, #0
	bl sub_0802A24C
	adds r4, r0, #0
	adds r0, r5, #0
	adds r1, r6, #0
	bl sub_0802A324
	adds r4, r4, r0
	cmp r4, #0x64
	ble _0802A41C
	movs r4, #0x64
_0802A41C:
	cmp r4, #0
	bge _0802A422
	movs r4, #0
_0802A422:
	adds r0, r4, #0
_0802A424:
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_0802A42C
sub_0802A42C: @ 0x0802A42C
	push {r4, lr}
	ldr r1, _0802A474 @ =gPlaySt
	movs r0, #0x80
	ldrb r1, [r1, #0x14]
	ands r0, r1
	cmp r0, #0
	bne _0802A4A2
	ldr r4, _0802A478 @ =0x0203A3EC
	ldr r0, [r4, #0x4c]
	movs r1, #4
	ands r0, r1
	cmp r0, #0
	beq _0802A47C
	movs r0, #0xc0
	ldrb r1, [r4, #0xb]
	ands r0, r1
	cmp r0, #0
	bne _0802A45A
	adds r1, r4, #0
	adds r1, #0x7b
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
_0802A45A:
	adds r0, r4, #0
	bl sub_0802A4A8
	adds r1, r4, #0
	adds r1, #0x6e
	strb r0, [r1]
	ldrb r1, [r4, #9]
	adds r0, r1, r0
	strb r0, [r4, #9]
	adds r0, r4, #0
	bl sub_08029B10
	b _0802A4A2
	.align 2, 0
_0802A474: .4byte gPlaySt
_0802A478: .4byte 0x0203A3EC
_0802A47C:
	adds r0, r4, #0
	adds r0, #0x50
	ldrb r0, [r0]
	cmp r0, #0xc
	bne _0802A4A2
	ldrb r1, [r4, #9]
	adds r0, r1, #0
	cmp r0, #0xff
	beq _0802A4A2
	adds r2, r4, #0
	adds r2, #0x6e
	movs r0, #0x14
	strb r0, [r2]
	adds r0, r1, #0
	adds r0, #0x14
	strb r0, [r4, #9]
	adds r0, r4, #0
	bl sub_08029B10
_0802A4A2:
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_0802A4A8
sub_0802A4A8: @ 0x0802A4A8
	push {r4, lr}
	adds r4, r0, #0
	bl sub_08029AE4
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0802A4BA
	movs r0, #0
	b _0802A506
_0802A4BA:
	ldr r1, _0802A4CC @ =0x0203A4EC
	movs r0, #2
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	beq _0802A4D0
	movs r0, #1
	b _0802A506
	.align 2, 0
_0802A4CC: .4byte 0x0203A4EC
_0802A4D0:
	adds r0, r4, #0
	adds r0, #0x48
	ldrh r0, [r0]
	bl sub_0801785C
	movs r1, #0x14
	bl __divsi3
	adds r2, r0, #0
	adds r2, #0xa
	ldr r0, [r4]
	ldr r1, [r4, #4]
	ldr r0, [r0, #0x28]
	ldr r1, [r1, #0x28]
	orrs r0, r1
	movs r1, #0x80
	lsls r1, r1, #1
	ands r0, r1
	cmp r0, #0
	beq _0802A4FE
	lsrs r0, r2, #0x1f
	adds r0, r2, r0
	asrs r2, r0, #1
_0802A4FE:
	cmp r2, #0x64
	ble _0802A504
	movs r2, #0x64
_0802A504:
	adds r0, r2, #0
_0802A506:
	pop {r4}
	pop {r1}
	bx r1

	thumb_func_start sub_0802A50C
sub_0802A50C: @ 0x0802A50C
	push {r4, lr}
	ldr r4, _0802A54C @ =0x0203A3EC
	movs r0, #0xc0
	ldrb r1, [r4, #0xb]
	ands r0, r1
	cmp r0, #0
	bne _0802A546
	adds r0, r4, #0
	bl sub_08029AE4
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0802A546
	ldr r1, _0802A550 @ =gPlaySt
	movs r0, #0x80
	ldrb r1, [r1, #0x14]
	ands r0, r1
	cmp r0, #0
	bne _0802A546
	adds r1, r4, #0
	adds r1, #0x6e
	movs r0, #0xa
	strb r0, [r1]
	ldrb r0, [r4, #9]
	adds r0, #0xa
	strb r0, [r4, #9]
	adds r0, r4, #0
	bl sub_08029B10
_0802A546:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0802A54C: .4byte 0x0203A3EC
_0802A550: .4byte gPlaySt

	thumb_func_start sub_0802A554
sub_0802A554: @ 0x0802A554
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r4, r5, #0
	adds r4, #0x4a
	ldrh r0, [r4]
	cmp r0, #0
	bne _0802A5A2
	adds r0, r5, #0
	bl GetUnitEquippedWeapon
	strh r0, [r4]
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _0802A5A2
	adds r0, r5, #0
	bl UnitHasMagicRank
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0802A5A2
	movs r6, #0
	subs r4, #0x2c
_0802A580:
	ldrh r1, [r4]
	adds r0, r5, #0
	bl CanUnitUseStaff
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne _0802A59A
	ldrh r1, [r4]
	adds r0, r5, #0
	adds r0, #0x4a
	strh r1, [r0]
	b _0802A5A2
_0802A59A:
	adds r4, #2
	adds r6, #1
	cmp r6, #4
	ble _0802A580
_0802A5A2:
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	thumb_func_start sub_0802A5A8
sub_0802A5A8: @ 0x0802A5A8
	adds r2, r0, #0
	adds r0, #0x52
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne _0802A5CE
	adds r0, r2, #0
	adds r0, #0x5a
	movs r1, #0xff
	strh r1, [r0]
	adds r0, #6
	strh r1, [r0]
	adds r0, #4
	strh r1, [r0]
	adds r0, #2
	strh r1, [r0]
	adds r0, #4
	strh r1, [r0]
_0802A5CE:
	bx lr

	thumb_func_start sub_0802A5D0
sub_0802A5D0: @ 0x0802A5D0
	adds r2, r0, #0
	adds r3, r1, #0
	ldr r0, [r2, #0x4c]
	movs r1, #0x80
	lsls r1, r1, #1
	ands r0, r1
	cmp r0, #0
	beq _0802A5E8
	ldr r0, [r3, #0x4c]
	ands r0, r1
	cmp r0, #0
	bne _0802A61C
_0802A5E8:
	adds r1, r2, #0
	adds r1, #0x53
	movs r0, #0
	ldrsb r0, [r1, r0]
	lsls r0, r0, #1
	rsbs r0, r0, #0
	strb r0, [r1]
	adds r1, #1
	movs r0, #0
	ldrsb r0, [r1, r0]
	lsls r0, r0, #1
	rsbs r0, r0, #0
	strb r0, [r1]
	adds r1, r3, #0
	adds r1, #0x53
	movs r0, #0
	ldrsb r0, [r1, r0]
	lsls r0, r0, #1
	rsbs r0, r0, #0
	strb r0, [r1]
	adds r1, #1
	movs r0, #0
	ldrsb r0, [r1, r0]
	lsls r0, r0, #1
	rsbs r0, r0, #0
	strb r0, [r1]
_0802A61C:
	bx lr
	.align 2, 0

	thumb_func_start sub_0802A620
sub_0802A620: @ 0x0802A620
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r2, _0802A62C @ =0x08C03528
	b _0802A670
	.align 2, 0
_0802A62C: .4byte 0x08C03528
_0802A630:
	adds r0, r4, #0
	adds r0, #0x50
	ldrb r0, [r0]
	ldrb r1, [r2]
	cmp r0, r1
	bne _0802A66E
	adds r0, r5, #0
	adds r0, #0x50
	ldrb r0, [r0]
	ldrb r1, [r2, #1]
	cmp r0, r1
	bne _0802A66E
	ldrb r0, [r2, #2]
	adds r1, r4, #0
	adds r1, #0x53
	strb r0, [r1]
	ldrb r1, [r2, #3]
	adds r0, r4, #0
	adds r0, #0x54
	strb r1, [r0]
	ldrb r1, [r2, #2]
	rsbs r0, r1, #0
	adds r1, r5, #0
	adds r1, #0x53
	strb r0, [r1]
	ldrb r2, [r2, #3]
	rsbs r1, r2, #0
	adds r0, r5, #0
	adds r0, #0x54
	strb r1, [r0]
	b _0802A678
_0802A66E:
	adds r2, #4
_0802A670:
	movs r0, #0
	ldrsb r0, [r2, r0]
	cmp r0, #0
	bge _0802A630
_0802A678:
	ldr r0, [r4, #0x4c]
	movs r6, #0x80
	lsls r6, r6, #1
	ands r0, r6
	cmp r0, #0
	beq _0802A68C
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_0802A5D0
_0802A68C:
	ldr r0, [r5, #0x4c]
	ands r0, r6
	cmp r0, #0
	beq _0802A69C
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_0802A5D0
_0802A69C:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_0802A6A4
sub_0802A6A4: @ 0x0802A6A4
	push {r4, lr}
	ldr r4, _0802A6FC @ =0x0203A3EC
	ldr r3, _0802A700 @ =0x0203A46C
	ldr r0, [r4, #0x4c]
	ldr r1, [r3, #0x4c]
	orrs r0, r1
	movs r1, #0x80
	ands r0, r1
	cmp r0, #0
	beq _0802A6C6
	adds r0, r3, #0
	adds r0, #0x48
	movs r2, #0
	movs r1, #0
	strh r1, [r0]
	adds r0, #0xa
	strb r2, [r0]
_0802A6C6:
	adds r1, r4, #0
	adds r1, #0x30
	movs r0, #0xf
	ldrb r1, [r1]
	ands r0, r1
	cmp r0, #4
	bne _0802A6F6
	movs r0, #0xb
	ldrsb r0, [r4, r0]
	movs r1, #0xc0
	ands r0, r1
	cmp r0, #0
	bne _0802A6F6
	movs r2, #0xb
	ldrsb r2, [r3, r2]
	ands r2, r1
	cmp r2, #0
	bne _0802A6F6
	adds r0, r3, #0
	adds r0, #0x48
	movs r1, #0
	strh r2, [r0]
	adds r0, #0xa
	strb r1, [r0]
_0802A6F6:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0802A6FC: .4byte 0x0203A3EC
_0802A700: .4byte 0x0203A46C

	thumb_func_start sub_0802A704
sub_0802A704: @ 0x0802A704
	push {r4, lr}
	ldr r4, _0802A75C @ =0x0203A46C
	adds r0, r4, #0
	bl ClearUnit
	movs r0, #0
	strb r0, [r4, #0xb]
	movs r0, #1
	bl GetClassData
	str r0, [r4, #4]
	ldr r0, _0802A760 @ =gPlaySt
	ldrb r0, [r0, #0xe]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl sub_08031A5C
	adds r0, #0x2c
	ldrb r0, [r0]
	strb r0, [r4, #0x12]
	ldr r1, _0802A764 @ =gActionSt
	ldrb r0, [r1, #0x15]
	strb r0, [r4, #0x13]
	ldrb r0, [r1, #0x13]
	strb r0, [r4, #0x10]
	ldrb r0, [r1, #0x14]
	strb r0, [r4, #0x11]
	movs r0, #0x11
	ldrsb r0, [r4, r0]
	ldr r1, _0802A768 @ =gBmMapTerrain
	ldr r1, [r1]
	lsls r0, r0, #2
	adds r0, r0, r1
	movs r1, #0x10
	ldrsb r1, [r4, r1]
	ldr r0, [r0]
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #0x1b
	beq _0802A76C
	cmp r0, #0x33
	beq _0802A776
	b _0802A782
	.align 2, 0
_0802A75C: .4byte 0x0203A46C
_0802A760: .4byte gPlaySt
_0802A764: .4byte gActionSt
_0802A768: .4byte gBmMapTerrain
_0802A76C:
	movs r0, #0xfc
	bl GetCharacterData
	str r0, [r4]
	b _0802A782
_0802A776:
	movs r0, #0xfd
	bl GetCharacterData
	str r0, [r4]
	movs r0, #0x14
	strb r0, [r4, #0x12]
_0802A782:
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_0802A788
sub_0802A788: @ 0x0802A788
	push {r4, lr}
	ldr r1, _0802A7BC @ =0x0203A3EC
	adds r2, r1, #0
	adds r2, #0x64
	movs r4, #0
	movs r3, #0
	movs r0, #0x64
	strh r0, [r2]
	adds r1, #0x6a
	strh r3, [r1]
	ldr r1, _0802A7C0 @ =0x0203A46C
	adds r2, r1, #0
	adds r2, #0x5e
	movs r0, #0xff
	strh r0, [r2]
	ldrb r0, [r1, #0x13]
	adds r2, #0x14
	strb r0, [r2]
	adds r0, r1, #0
	adds r0, #0x53
	strb r4, [r0]
	adds r0, #1
	strb r4, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0802A7BC: .4byte 0x0203A3EC
_0802A7C0: .4byte 0x0203A46C

	thumb_func_start sub_0802A7C4
sub_0802A7C4: @ 0x0802A7C4
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	movs r0, #0x10
	ldrsb r0, [r4, r0]
	movs r1, #0x11
	ldrsb r1, [r4, r1]
	bl sub_0802BF30
	adds r5, r0, #0
	cmp r5, #0
	bne _0802A7EA
	movs r0, #0x10
	ldrsb r0, [r4, r0]
	movs r1, #0x11
	ldrsb r1, [r4, r1]
	subs r1, #1
	bl sub_0802BF30
	adds r5, r0, #0
_0802A7EA:
	ldrb r0, [r4, #0x13]
	strb r0, [r5, #3]
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0802A84C
	ldrb r0, [r5]
	ldrb r1, [r5, #1]
	bl sub_0802C1CC
	adds r6, r0, #0
	movs r0, #0x11
	ldrsb r0, [r4, r0]
	ldr r1, _0802A854 @ =gBmMapTerrain
	ldr r1, [r1]
	lsls r0, r0, #2
	adds r0, r0, r1
	movs r1, #0x10
	ldrsb r1, [r4, r1]
	ldr r0, [r0]
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #0x33
	bne _0802A82A
	ldr r0, _0802A858 @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0802A82A
	ldr r0, _0802A85C @ =0x000002D7
	bl m4aSongNumStart
_0802A82A:
	bl RenderMapForFade
	adds r0, r6, #0
	bl sub_0802C228
	movs r0, #0
	strb r0, [r5, #2]
	adds r0, r6, #0
	bl sub_0802C294
	bl sub_08019714
	bl RenderMap
	movs r0, #0
	bl StartMapFade
_0802A84C:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0802A854: .4byte gBmMapTerrain
_0802A858: .4byte gPlaySt
_0802A85C: .4byte 0x000002D7

	thumb_func_start sub_0802A860
sub_0802A860: @ 0x0802A860
	push {lr}
	ldr r0, _0802A894 @ =0x02023C60
	movs r1, #0
	bl sub_080017E8
	movs r0, #4
	bl EnableBgSync
	ldr r1, _0802A898 @ =0x02022860
	movs r0, #0
	strh r0, [r1]
	bl EnablePalSync
	bl RenderMap
	bl sub_08051170
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0802A89C
	movs r0, #0
	bl sub_0804B970
	bl sub_08051180
	b _0802A8B2
	.align 2, 0
_0802A894: .4byte 0x02023C60
_0802A898: .4byte 0x02022860
_0802A89C:
	bl sub_0806D4A4
	bl RenderMap
	bl sub_0806FA28
	ldr r1, _0802A8B8 @ =0x0203A3D4
	movs r0, #0x80
	ldrh r2, [r1]
	orrs r0, r2
	strh r0, [r1]
_0802A8B2:
	pop {r0}
	bx r0
	.align 2, 0
_0802A8B8: .4byte 0x0203A3D4

	thumb_func_start sub_0802A8BC
sub_0802A8BC: @ 0x0802A8BC
	ldr r1, [r0, #0xc]
	movs r0, #0x80
	lsls r0, r0, #7
	ands r0, r1
	cmp r0, #0
	beq _0802A8CC
	movs r0, #0
	b _0802A8DC
_0802A8CC:
	movs r0, #0x80
	lsls r0, r0, #8
	ands r1, r0
	cmp r1, #0
	bne _0802A8DA
	movs r0, #1
	b _0802A8DC
_0802A8DA:
	movs r0, #3
_0802A8DC:
	bx lr
	.align 2, 0

	thumb_func_start sub_0802A8E0
sub_0802A8E0: @ 0x0802A8E0
	push {lr}
	ldr r0, _0802A914 @ =gPlaySt
	adds r0, #0x42
	ldrb r0, [r0]
	lsls r0, r0, #0x1d
	lsrs r0, r0, #0x1e
	cmp r0, #2
	bne _0802A93A
	ldr r2, _0802A918 @ =0x0203A3EC
	movs r0, #0xb
	ldrsb r0, [r2, r0]
	movs r1, #0xc0
	ands r0, r1
	adds r3, r2, #0
	cmp r0, #0
	bne _0802A920
	ldr r0, _0802A91C @ =0x0203A46C
	ldrb r0, [r0, #0xb]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	ands r0, r1
	cmp r0, #0
	bne _0802A934
	adds r0, r3, #0
	b _0802A936
	.align 2, 0
_0802A914: .4byte gPlaySt
_0802A918: .4byte 0x0203A3EC
_0802A91C: .4byte 0x0203A46C
_0802A920:
	ldr r2, _0802A930 @ =0x0203A46C
	movs r0, #0xb
	ldrsb r0, [r2, r0]
	ands r0, r1
	cmp r0, #0
	beq _0802A934
	movs r0, #1
	b _0802A93A
	.align 2, 0
_0802A930: .4byte 0x0203A46C
_0802A934:
	adds r0, r2, #0
_0802A936:
	bl sub_0802A8BC
_0802A93A:
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start nullsub_08
nullsub_08: @ 0x0802A940
	bx lr
	.align 2, 0

	thumb_func_start sub_0802A944
sub_0802A944: @ 0x0802A944
	ldr r1, _0802A960 @ =0x0203A4EC
	movs r0, #0x80
	ldrb r2, [r1, #2]
	ands r0, r2
	cmp r0, #0
	bne _0802A95E
	movs r2, #0x80
_0802A952:
	adds r1, #4
	adds r0, r2, #0
	ldrb r3, [r1, #2]
	ands r0, r3
	cmp r0, #0
	beq _0802A952
_0802A95E:
	bx lr
	.align 2, 0
_0802A960: .4byte 0x0203A4EC

	thumb_func_start sub_0802A964
sub_0802A964: @ 0x0802A964
	push {r4, r5, r6, r7, lr}
	adds r2, r0, #0
	adds r7, r1, #0
	lsls r1, r7, #1
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r6, [r0]
	cmp r7, #0
	bge _0802A978
	movs r6, #0
_0802A978:
	ldr r1, _0802AA04 @ =0x0203A3D4
	movs r4, #0
	movs r0, #0
	strh r0, [r1]
	ldr r5, _0802AA08 @ =0x0203A3EC
	adds r0, r5, #0
	adds r1, r2, #0
	bl sub_08028A60
	adds r0, r5, #0
	bl sub_08028BB4
	adds r0, r5, #0
	bl sub_08028F74
	adds r0, r5, #0
	movs r1, #0
	bl sub_08028EA0
	adds r0, r5, #0
	adds r0, #0x5a
	movs r2, #0xff
	strh r2, [r0]
	adds r1, r5, #0
	adds r1, #0x64
	movs r0, #0x64
	strh r0, [r1]
	adds r0, r5, #0
	adds r0, #0x6a
	strh r2, [r0]
	subs r0, #0x22
	strh r6, [r0]
	adds r0, #2
	strh r6, [r0]
	adds r0, #7
	strb r7, [r0]
	adds r0, r6, #0
	bl GetItemType
	adds r1, r5, #0
	adds r1, #0x50
	strb r0, [r1]
	adds r0, r6, #0
	bl GetItemAttributes
	str r0, [r5, #0x4c]
	adds r1, r5, #0
	adds r1, #0x52
	movs r0, #1
	strb r0, [r1]
	adds r0, r5, #0
	adds r0, #0x7e
	strb r4, [r0]
	adds r2, r5, #0
	adds r2, #0x6f
	movs r1, #0xff
	ldrb r0, [r2]
	orrs r0, r1
	strb r0, [r2]
	ldr r0, _0802AA0C @ =0x0203A46C
	adds r0, #0x6f
	ldrb r2, [r0]
	orrs r1, r2
	strb r1, [r0]
	bl sub_08029434
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0802AA04: .4byte 0x0203A3D4
_0802AA08: .4byte 0x0203A3EC
_0802AA0C: .4byte 0x0203A46C

	thumb_func_start sub_0802AA10
sub_0802AA10: @ 0x0802AA10
	push {r4, lr}
	adds r1, r0, #0
	ldr r4, _0802AA5C @ =0x0203A46C
	adds r0, r4, #0
	bl sub_08028A60
	adds r0, r4, #0
	bl sub_08028BB4
	adds r0, r4, #0
	bl sub_08028F74
	adds r0, r4, #0
	movs r1, #0
	bl sub_08028EA0
	adds r0, r4, #0
	adds r0, #0x5a
	movs r2, #0
	movs r1, #0xff
	strh r1, [r0]
	adds r0, #0xa
	strh r1, [r0]
	adds r0, #6
	strh r1, [r0]
	subs r0, #0x20
	strh r2, [r0]
	adds r0, r4, #0
	bl sub_0802A554
	ldr r0, _0802AA60 @ =0x0203A3EC
	adds r0, #0x7e
	movs r1, #1
	strb r1, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0802AA5C: .4byte 0x0203A46C
_0802AA60: .4byte 0x0203A3EC

	thumb_func_start sub_0802AA64
sub_0802AA64: @ 0x0802AA64
	push {r4, lr}
	ldr r4, _0802AA7C @ =0x0203A3EC
	movs r0, #0xb
	ldrsb r0, [r4, r0]
	bl GetUnit
	adds r1, r4, #0
	bl sub_0802A0D4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0802AA7C: .4byte 0x0203A3EC

	thumb_func_start sub_0802AA80
sub_0802AA80: @ 0x0802AA80
	push {r4, lr}
	adds r4, r0, #0
	bl sub_0802A50C
	ldr r0, _0802AA98 @ =0x08C0355C
	adds r1, r4, #0
	bl Proc_StartBlocking
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0802AA98: .4byte 0x08C0355C

	thumb_func_start sub_0802AA9C
sub_0802AA9C: @ 0x0802AA9C
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	ldr r1, _0802AB10 @ =0x0203A508
	ldr r0, [r1]
	adds r0, #4
	str r0, [r1]
	movs r1, #0x80
	strb r1, [r0, #2]
	bl sub_0802A42C
	ldr r4, _0802AB14 @ =0x0203A3EC
	adds r0, r4, #0
	adds r0, #0x52
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _0802AB00
	adds r5, r4, #0
	adds r5, #0x48
	ldrh r0, [r5]
	bl GetItemAttributes
	movs r1, #4
	ands r1, r0
	cmp r1, #0
	beq _0802AADA
	adds r1, r4, #0
	adds r1, #0x7d
	movs r0, #1
	strb r0, [r1]
_0802AADA:
	ldrh r0, [r5]
	bl GetItemAfterUse
	strh r0, [r5]
	adds r1, r4, #0
	adds r1, #0x51
	ldrb r1, [r1]
	lsls r1, r1, #1
	adds r2, r4, #0
	adds r2, #0x1e
	adds r1, r1, r2
	strh r0, [r1]
	ldrh r0, [r5]
	cmp r0, #0
	beq _0802AB00
	adds r1, r4, #0
	adds r1, #0x7d
	movs r0, #0
	strb r0, [r1]
_0802AB00:
	ldr r0, _0802AB18 @ =0x08C0355C
	adds r1, r6, #0
	bl Proc_StartBlocking
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0802AB10: .4byte 0x0203A508
_0802AB14: .4byte 0x0203A3EC
_0802AB18: .4byte 0x08C0355C

	thumb_func_start sub_0802AB1C
sub_0802AB1C: @ 0x0802AB1C
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	adds r6, r1, #0
	bl GetUnitPower
	adds r4, r0, #0
	adds r0, r6, #0
	bl GetUnitResistance
	subs r4, r4, r0
	lsls r0, r4, #2
	adds r7, r0, r4
	adds r0, r5, #0
	bl GetUnitSkill
	adds r4, r0, #0
	movs r2, #0x10
	ldrsb r2, [r5, r2]
	movs r0, #0x10
	ldrsb r0, [r6, r0]
	subs r1, r2, r0
	cmp r1, #0
	bge _0802AB4C
	subs r1, r0, r2
_0802AB4C:
	movs r3, #0x11
	ldrsb r3, [r5, r3]
	movs r0, #0x11
	ldrsb r0, [r6, r0]
	subs r2, r3, r0
	cmp r2, #0
	blt _0802AB5E
	adds r1, r1, r2
	b _0802AB62
_0802AB5E:
	subs r0, r0, r3
	adds r1, r1, r0
_0802AB62:
	adds r0, r4, #0
	adds r0, #0x1e
	adds r0, r7, r0
	lsls r1, r1, #1
	subs r1, r0, r1
	ldr r0, [r6, #4]
	ldrb r0, [r0, #4]
	cmp r0, #0x46
	beq _0802AB78
	cmp r0, #0x45
	bne _0802AB7C
_0802AB78:
	movs r0, #0
	b _0802AB8A
_0802AB7C:
	cmp r1, #0
	bge _0802AB82
	movs r1, #0
_0802AB82:
	cmp r1, #0x64
	ble _0802AB88
	movs r1, #0x64
_0802AB88:
	adds r0, r1, #0
_0802AB8A:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	thumb_func_start sub_0802AB90
sub_0802AB90: @ 0x0802AB90
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	adds r6, r0, #0
	ldr r0, _0802AC60 @ =0x0203A7F0
	mov sb, r0
	ldr r1, [r0, #4]
	mov r8, r1
	ldr r0, _0802AC64 @ =gBmSt
	adds r0, #0x3c
	ldrb r0, [r0]
	str r0, [sp]
	ldr r7, _0802AC68 @ =0x0203A3D4
	movs r0, #0x21
	strh r0, [r7]
	ldr r5, _0802AC6C @ =0x0203A3EC
	adds r0, r5, #0
	adds r1, r6, #0
	bl sub_08028A60
	ldr r4, _0802AC70 @ =0x0203A46C
	adds r0, r4, #0
	mov r1, r8
	bl sub_08028A60
	ldr r0, _0802AC74 @ =gActionSt
	mov sl, r0
	ldrb r0, [r0, #0x15]
	cmp r0, #0
	beq _0802ABDA
	strb r0, [r4, #0x13]
	adds r1, r4, #0
	adds r1, #0x72
	strb r0, [r1]
_0802ABDA:
	mov r1, sb
	ldrb r0, [r1, #0xc]
	strb r0, [r7, #2]
	ldrb r1, [r5, #0x10]
	adds r0, r0, r1
	strb r0, [r4, #0x10]
	ldrb r0, [r5, #0x11]
	strb r0, [r4, #0x11]
	adds r0, r5, #0
	movs r1, #6
	bl sub_08028C08
	adds r0, r4, #0
	movs r1, #7
	bl sub_08028C08
	adds r0, r5, #0
	adds r1, r4, #0
	bl sub_0802A620
	movs r0, #4
	mov r1, sl
	strb r0, [r1, #0x16]
	movs r0, #3
	bl WriteSuspendSave
	adds r0, r5, #0
	bl sub_08028BB4
	adds r0, r4, #0
	movs r1, #8
	bl sub_08028B7C
	adds r0, r6, #0
	mov r1, r8
	bl sub_080288B0
	movs r0, #0x13
	ldrsb r0, [r4, r0]
	cmp r0, #0
	bne _0802AC30
	bl sub_08029A1C
_0802AC30:
	adds r0, r6, #0
	adds r1, r5, #0
	bl sub_0802A1BC
	ldr r0, [sp]
	cmp r0, #0
	beq _0802AC46
	movs r0, #0x13
	ldrsb r0, [r4, r0]
	cmp r0, #0
	bne _0802AC8E
_0802AC46:
	bl sub_080A0C84
	ldr r0, [r6, #0xc]
	ldr r2, _0802AC78 @ =0xFFF1FFFF
	ands r2, r0
	lsrs r0, r0, #0x11
	movs r1, #7
	ands r0, r1
	adds r0, #1
	cmp r0, #7
	bhi _0802AC7C
	lsls r0, r0, #0x11
	b _0802AC80
	.align 2, 0
_0802AC60: .4byte 0x0203A7F0
_0802AC64: .4byte gBmSt
_0802AC68: .4byte 0x0203A3D4
_0802AC6C: .4byte 0x0203A3EC
_0802AC70: .4byte 0x0203A46C
_0802AC74: .4byte gActionSt
_0802AC78: .4byte 0xFFF1FFFF
_0802AC7C:
	movs r0, #0xe0
	lsls r0, r0, #0xc
_0802AC80:
	adds r1, r2, r0
	str r1, [r6, #0xc]
	ldr r0, _0802ACA8 @ =0x03002778
	lsrs r1, r1, #0x11
	movs r2, #7
	ands r1, r2
	strb r1, [r0]
_0802AC8E:
	ldr r0, _0802ACAC @ =0x0203A3EC
	ldr r1, _0802ACB0 @ =0x0203A46C
	bl nullsub_08
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0802ACA8: .4byte 0x03002778
_0802ACAC: .4byte 0x0203A3EC
_0802ACB0: .4byte 0x0203A46C

	thumb_func_start sub_0802ACB4
sub_0802ACB4: @ 0x0802ACB4
	ldr r0, _0802ACC0 @ =0x0203A4EC
	ldrh r0, [r0]
	lsrs r0, r0, #0xa
	movs r1, #1
	ands r0, r1
	bx lr
	.align 2, 0
_0802ACC0: .4byte 0x0203A4EC

	thumb_func_start sub_0802ACC4
sub_0802ACC4: @ 0x0802ACC4
	adds r1, r0, #0
	movs r0, #0x13
	ldrsb r0, [r1, r0]
	cmp r0, #0
	beq _0802ACDA
	adds r0, r1, #0
	adds r0, #0x7d
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	b _0802ACDC
_0802ACDA:
	movs r0, #0
_0802ACDC:
	bx lr
	.align 2, 0

	thumb_func_start sub_0802ACE0
sub_0802ACE0: @ 0x0802ACE0
	ldr r1, _0802ACE8 @ =gActionSt
	str r0, [r1, #0x18]
	bx lr
	.align 2, 0
_0802ACE8: .4byte gActionSt

	thumb_func_start sub_0802ACEC
sub_0802ACEC: @ 0x0802ACEC
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	ldr r2, _0802AD50 @ =0x0203A3D4
	movs r0, #0
	strh r0, [r2, #4]
	ldr r0, _0802AD54 @ =0x0203A508
	ldr r1, [r0]
	movs r0, #2
	ldrh r3, [r1]
	ands r0, r3
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	cmp r3, #0
	bne _0802AD4A
	ldrh r5, [r2, #6]
	ldrh r6, [r2, #8]
	subs r0, r5, r6
	strh r0, [r2, #4]
	movs r0, #1
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	beq _0802AD24
	movs r0, #4
	ldrsh r1, [r2, r0]
	lsls r0, r1, #1
	adds r0, r0, r1
	strh r0, [r2, #4]
_0802AD24:
	movs r1, #4
	ldrsh r0, [r2, r1]
	cmp r0, #0x7f
	ble _0802AD30
	movs r0, #0x7f
	strh r0, [r2, #4]
_0802AD30:
	movs r5, #4
	ldrsh r0, [r2, r5]
	cmp r0, #0
	bge _0802AD3A
	strh r3, [r2, #4]
_0802AD3A:
	movs r6, #4
	ldrsh r0, [r2, r6]
	cmp r0, #0
	beq _0802AD4A
	adds r1, r4, #0
	adds r1, #0x7c
	movs r0, #1
	strb r0, [r1]
_0802AD4A:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0802AD50: .4byte 0x0203A3D4
_0802AD54: .4byte 0x0203A508

	thumb_func_start sub_0802AD58
sub_0802AD58: @ 0x0802AD58
	push {r4, r5, r6, lr}
	ldr r0, _0802ADA4 @ =gActionSt
	ldr r2, [r0, #0x18]
	ldr r3, _0802ADA8 @ =0x0203A4EC
	movs r0, #0x80
	ldrb r1, [r2, #2]
	ands r0, r1
	adds r5, r3, #0
	ldr r1, _0802ADAC @ =0x0203A508
	cmp r0, #0
	bne _0802AD7E
	movs r4, #0x80
_0802AD70:
	ldm r2!, {r0}
	stm r3!, {r0}
	adds r0, r4, #0
	ldrb r6, [r2, #2]
	ands r0, r6
	cmp r0, #0
	beq _0802AD70
_0802AD7E:
	ldr r0, [r2]
	str r0, [r3]
	str r5, [r1]
	movs r0, #0x80
	ldrb r5, [r5, #2]
	ands r0, r5
	cmp r0, #0
	bne _0802AE34
	adds r6, r1, #0
_0802AD90:
	ldr r1, [r6]
	movs r0, #8
	ldrb r1, [r1, #2]
	ands r0, r1
	cmp r0, #0
	beq _0802ADB8
	ldr r5, _0802ADB0 @ =0x0203A46C
	ldr r4, _0802ADB4 @ =0x0203A3EC
	b _0802ADBC
	.align 2, 0
_0802ADA4: .4byte gActionSt
_0802ADA8: .4byte 0x0203A4EC
_0802ADAC: .4byte 0x0203A508
_0802ADB0: .4byte 0x0203A46C
_0802ADB4: .4byte 0x0203A3EC
_0802ADB8:
	ldr r5, _0802AE18 @ =0x0203A3EC
	ldr r4, _0802AE1C @ =0x0203A46C
_0802ADBC:
	adds r0, r5, #0
	adds r1, r4, #0
	bl sub_080296E4
	adds r0, r5, #0
	bl sub_0802ACEC
	adds r0, r5, #0
	adds r1, r4, #0
	bl sub_0802984C
	movs r0, #0x13
	ldrsb r0, [r5, r0]
	cmp r0, #0
	beq _0802ADE2
	movs r0, #0x13
	ldrsb r0, [r4, r0]
	cmp r0, #0
	bne _0802AE24
_0802ADE2:
	adds r0, r5, #0
	adds r0, #0x7b
	ldrb r1, [r0]
	adds r1, #1
	movs r3, #0
	strb r1, [r0]
	ldr r2, _0802AE20 @ =0x0203A508
	ldr r1, [r2]
	movs r0, #2
	ldrb r4, [r1, #2]
	orrs r0, r4
	strb r0, [r1, #2]
	ldr r0, _0802AE1C @ =0x0203A46C
	ldrb r0, [r0, #0x13]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne _0802AE10
	ldr r1, [r2]
	movs r0, #4
	ldrb r6, [r1, #2]
	orrs r0, r6
	strb r0, [r1, #2]
_0802AE10:
	ldr r1, [r2]
	movs r0, #0x80
	strb r0, [r1, #6]
	b _0802AE34
	.align 2, 0
_0802AE18: .4byte 0x0203A3EC
_0802AE1C: .4byte 0x0203A46C
_0802AE20: .4byte 0x0203A508
_0802AE24:
	ldr r1, [r6]
	adds r1, #4
	str r1, [r6]
	movs r0, #0x80
	ldrb r1, [r1, #2]
	ands r0, r1
	cmp r0, #0
	beq _0802AD90
_0802AE34:
	ldr r1, _0802AE40 @ =gActionSt
	movs r0, #0
	str r0, [r1, #0x18]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0802AE40: .4byte gActionSt

	thumb_func_start sub_0802AE44
sub_0802AE44: @ 0x0802AE44
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	adds r4, r0, #0
	ldrb r1, [r4, #8]
	cmp r1, #0x14
	bne _0802AE5A
	b _0802B02E
_0802AE5A:
	movs r0, #0
	strb r0, [r4, #9]
	adds r0, r1, #1
	strb r0, [r4, #8]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	ldr r2, [r4]
	cmp r0, #0x14
	beq _0802AE72
	ldrb r0, [r2, #4]
	cmp r0, #0x28
	bne _0802AE76
_0802AE72:
	movs r0, #0xff
	strb r0, [r4, #9]
_0802AE76:
	ldr r0, [r4, #0xc]
	movs r1, #0x80
	lsls r1, r1, #6
	ands r0, r1
	movs r6, #0
	cmp r0, #0
	beq _0802AE86
	movs r6, #5
_0802AE86:
	ldrb r2, [r2, #0x1c]
	adds r0, r2, r6
	bl GetStatIncrease
	mov r8, r0
	ldr r0, [r4]
	ldrb r0, [r0, #0x1d]
	adds r0, r0, r6
	bl GetStatIncrease
	str r0, [sp]
	adds r5, r0, #0
	add r5, r8
	ldr r0, [r4]
	ldrb r0, [r0, #0x1e]
	adds r0, r0, r6
	bl GetStatIncrease
	str r0, [sp, #4]
	adds r5, r5, r0
	ldr r0, [r4]
	ldrb r0, [r0, #0x1f]
	adds r0, r0, r6
	bl GetStatIncrease
	mov sl, r0
	add r5, sl
	ldr r0, [r4]
	adds r0, #0x20
	ldrb r0, [r0]
	adds r0, r0, r6
	bl GetStatIncrease
	mov sb, r0
	add r5, sb
	ldr r0, [r4]
	adds r0, #0x21
	ldrb r0, [r0]
	adds r0, r0, r6
	bl GetStatIncrease
	adds r7, r0, #0
	adds r5, r5, r7
	ldr r0, [r4]
	adds r0, #0x22
	ldrb r0, [r0]
	adds r0, r0, r6
	bl GetStatIncrease
	adds r6, r0, #0
	adds r5, r5, r6
	cmp r5, #0
	bne _0802AF60
	b _0802AF32
_0802AEF2:
	ldr r0, [r4]
	ldrb r0, [r0, #0x1f]
	bl GetStatIncrease
	mov sl, r0
	cmp r0, #0
	bne _0802AF60
	ldr r0, [r4]
	adds r0, #0x20
	ldrb r0, [r0]
	bl GetStatIncrease
	mov sb, r0
	cmp r0, #0
	bne _0802AF60
	ldr r0, [r4]
	adds r0, #0x21
	ldrb r0, [r0]
	bl GetStatIncrease
	adds r7, r0, #0
	cmp r7, #0
	bne _0802AF60
	ldr r0, [r4]
	adds r0, #0x22
	ldrb r0, [r0]
	bl GetStatIncrease
	adds r6, r0, #0
	cmp r6, #0
	bne _0802AF60
	adds r5, #1
_0802AF32:
	cmp r5, #1
	bgt _0802AF60
	ldr r0, [r4]
	ldrb r0, [r0, #0x1c]
	bl GetStatIncrease
	mov r8, r0
	cmp r0, #0
	bne _0802AF60
	ldr r0, [r4]
	ldrb r0, [r0, #0x1d]
	bl GetStatIncrease
	str r0, [sp]
	cmp r0, #0
	bne _0802AF60
	ldr r0, [r4]
	ldrb r0, [r0, #0x1e]
	bl GetStatIncrease
	str r0, [sp, #4]
	cmp r0, #0
	beq _0802AEF2
_0802AF60:
	movs r2, #0x12
	ldrsb r2, [r4, r2]
	mov r1, r8
	adds r3, r2, r1
	movs r1, #0xb
	ldrsb r1, [r4, r1]
	movs r0, #0xc0
	ands r0, r1
	cmp r0, #0x80
	bne _0802AF7A
	cmp r3, #0x78
	bgt _0802AF7E
	b _0802AF90
_0802AF7A:
	cmp r3, #0x3c
	ble _0802AF90
_0802AF7E:
	movs r0, #0xc0
	ands r0, r1
	cmp r0, #0x80
	bne _0802AF8A
	movs r0, #0x78
	b _0802AF8C
_0802AF8A:
	movs r0, #0x3c
_0802AF8C:
	subs r0, r0, r2
	mov r8, r0
_0802AF90:
	movs r2, #0x14
	ldrsb r2, [r4, r2]
	ldr r1, [sp]
	adds r0, r2, r1
	ldr r3, [r4, #4]
	movs r1, #0x14
	ldrsb r1, [r3, r1]
	cmp r0, r1
	ble _0802AFA6
	subs r1, r1, r2
	str r1, [sp]
_0802AFA6:
	movs r2, #0x15
	ldrsb r2, [r4, r2]
	ldr r1, [sp, #4]
	adds r0, r2, r1
	movs r1, #0x15
	ldrsb r1, [r3, r1]
	cmp r0, r1
	ble _0802AFBA
	subs r1, r1, r2
	str r1, [sp, #4]
_0802AFBA:
	movs r2, #0x16
	ldrsb r2, [r4, r2]
	mov r1, sl
	adds r0, r2, r1
	movs r1, #0x16
	ldrsb r1, [r3, r1]
	cmp r0, r1
	ble _0802AFCE
	subs r1, r1, r2
	mov sl, r1
_0802AFCE:
	movs r2, #0x17
	ldrsb r2, [r4, r2]
	mov r1, sb
	adds r0, r2, r1
	movs r1, #0x17
	ldrsb r1, [r3, r1]
	cmp r0, r1
	ble _0802AFE2
	subs r1, r1, r2
	mov sb, r1
_0802AFE2:
	movs r2, #0x18
	ldrsb r2, [r4, r2]
	adds r0, r2, r7
	movs r1, #0x18
	ldrsb r1, [r3, r1]
	cmp r0, r1
	ble _0802AFF2
	subs r7, r1, r2
_0802AFF2:
	movs r1, #0x19
	ldrsb r1, [r4, r1]
	adds r0, r1, r6
	cmp r0, #0x1e
	ble _0802B000
	movs r0, #0x1e
	subs r6, r0, r1
_0802B000:
	ldrb r0, [r4, #0x12]
	add r0, r8
	strb r0, [r4, #0x12]
	ldrb r2, [r4, #0x14]
	ldr r1, [sp]
	adds r0, r2, r1
	strb r0, [r4, #0x14]
	ldrb r2, [r4, #0x15]
	ldr r1, [sp, #4]
	adds r0, r2, r1
	strb r0, [r4, #0x15]
	ldrb r0, [r4, #0x16]
	add r0, sl
	strb r0, [r4, #0x16]
	ldrb r0, [r4, #0x17]
	add r0, sb
	strb r0, [r4, #0x17]
	ldrb r2, [r4, #0x18]
	adds r0, r2, r7
	strb r0, [r4, #0x18]
	ldrb r1, [r4, #0x19]
	adds r0, r1, r6
	strb r0, [r4, #0x19]
_0802B02E:
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start BattleHitAdvance
BattleHitAdvance: @ 0x0802B040
	ldr r1, _0802B04C @ =0x0203A508
	ldr r0, [r1]
	adds r0, #4
	str r0, [r1]
	bx lr
	.align 2, 0
_0802B04C: .4byte 0x0203A508

	thumb_func_start BattleHitTerminate
BattleHitTerminate: @ 0x0802B050
	ldr r0, _0802B060 @ =0x0203A508
	ldr r1, [r0]
	adds r1, #4
	str r1, [r0]
	movs r0, #0x80
	strb r0, [r1, #2]
	bx lr
	.align 2, 0
_0802B060: .4byte 0x0203A508
