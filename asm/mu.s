	.include "macro.inc"
	.syntax unified

	thumb_func_start MU_Init
MU_Init: @ 0x0806C238
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	movs r0, #0
	str r0, [r7]
_0806C242:
	ldr r0, [r7]
	cmp r0, #3
	ble _0806C24A
	b _0806C26C
_0806C24A:
	ldr r0, _0806C268 @ =0x030014E8
	ldr r1, [r7]
	movs r2, #0x4c
	muls r1, r2, r1
	adds r0, r0, r1
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, [r7]
	adds r1, r0, #1
	str r1, [r7]
	b _0806C242
	.align 2, 0
_0806C268: .4byte 0x030014E8
_0806C26C:
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0

	thumb_func_start sub_806C274
sub_806C274: @ 0x0806C274
	push {r4, r7, lr}
	sub sp, #0x14
	add r7, sp, #4
	str r0, [r7]
	str r1, [r7, #4]
	str r2, [r7, #8]
	ldr r0, [r7]
	movs r1, #0x10
	ldrsb r1, [r0, r1]
	adds r0, r1, #0
	lsls r1, r0, #0x10
	lsrs r0, r1, #0x10
	ldr r1, [r7]
	movs r2, #0x11
	ldrsb r2, [r1, r2]
	adds r1, r2, #0
	lsls r2, r1, #0x10
	lsrs r1, r2, #0x10
	ldr r3, [r7, #4]
	adds r2, r3, #0
	lsls r3, r2, #0x10
	lsrs r2, r3, #0x10
	movs r3, #1
	rsbs r3, r3, #0
	ldr r4, [r7, #8]
	str r4, [sp]
	bl sub_806C4A0
	str r0, [r7, #0xc]
	ldr r0, [r7, #0xc]
	ldr r1, [r7]
	str r1, [r0, #0x2c]
	ldr r0, [r7, #0xc]
	adds r1, r0, #0
	adds r0, #0x3e
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #1
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	ldr r1, [r7, #0xc]
	adds r0, r1, #0
	b _0806C2D2
_0806C2D2:
	add sp, #0x14
	pop {r4, r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start StartMu
StartMu: @ 0x0806C2DC
	push {r4, r7, lr}
	sub sp, #0x10
	add r7, sp, #4
	str r0, [r7]
	ldr r0, [r7]
	ldr r1, [r0, #4]
	ldrb r0, [r1, #4]
	str r0, [r7, #8]
	ldr r0, [r7]
	ldr r1, [r0, #0xc]
	movs r2, #0x80
	lsls r2, r2, #4
	adds r0, r1, #0
	ands r0, r2
	cmp r0, #0
	beq _0806C330
	ldr r0, [r7]
	ldrb r1, [r0, #0x1c]
	adds r0, r1, #0
	bl GetTrap
	adds r1, r0, #0
	ldrb r0, [r1, #3]
	cmp r0, #0x35
	beq _0806C324
	cmp r0, #0x35
	bgt _0806C318
	cmp r0, #0x34
	beq _0806C31E
	b _0806C330
_0806C318:
	cmp r0, #0x36
	beq _0806C32A
	b _0806C330
_0806C31E:
	movs r0, #0x5b
	str r0, [r7, #8]
	b _0806C330
_0806C324:
	movs r0, #0x5c
	str r0, [r7, #8]
	b _0806C330
_0806C32A:
	movs r0, #0x5d
	str r0, [r7, #8]
	b _0806C330
_0806C330:
	ldr r0, [r7]
	bl sub_8025B80
	ldr r1, [r7]
	movs r2, #0x10
	ldrsb r2, [r1, r2]
	adds r1, r2, #0
	lsls r2, r1, #0x10
	lsrs r1, r2, #0x10
	ldr r2, [r7]
	movs r3, #0x11
	ldrsb r3, [r2, r3]
	adds r2, r3, #0
	lsls r3, r2, #0x10
	lsrs r2, r3, #0x10
	ldr r4, [r7, #8]
	adds r3, r4, #0
	lsls r4, r3, #0x10
	lsrs r3, r4, #0x10
	movs r4, #1
	rsbs r4, r4, #0
	str r0, [sp]
	adds r0, r1, #0
	adds r1, r2, #0
	adds r2, r3, #0
	adds r3, r4, #0
	bl sub_806C4A0
	str r0, [r7, #4]
	ldr r0, [r7, #4]
	ldr r1, [r7]
	str r1, [r0, #0x2c]
	ldr r0, [r7, #4]
	adds r1, r0, #0
	adds r0, #0x3e
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #1
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	ldr r1, [r7, #4]
	adds r0, r1, #0
	b _0806C38E
_0806C38E:
	add sp, #0x10
	pop {r4, r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_806C398
sub_806C398: @ 0x0806C398
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, [r7]
	bl sub_806D3F8
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_806C3B0
sub_806C3B0: @ 0x0806C3B0
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x3e
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #1
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0

	thumb_func_start sub_806C3D8
sub_806C3D8: @ 0x0806C3D8
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x3e
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0

	thumb_func_start StartUiMu
StartUiMu: @ 0x0806C3F8
	push {r7, lr}
	sub sp, #0x10
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	str r2, [r7, #8]
	ldr r0, [r7]
	bl StartMu
	str r0, [r7, #0xc]
	ldr r0, [r7, #0xc]
	cmp r0, #0
	bne _0806C416
	movs r0, #0
	b _0806C46C
_0806C416:
	ldr r0, [r7, #0xc]
	ldr r1, [r7, #4]
	adds r2, r1, #0
	lsls r1, r2, #4
	adds r2, r0, #0
	adds r0, #0x4c
	ldrh r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0]
	ldr r0, [r7, #0xc]
	ldr r1, [r7, #8]
	adds r2, r1, #0
	lsls r1, r2, #4
	adds r2, r0, #0
	adds r0, #0x4e
	ldrh r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0]
	ldr r0, [r7, #0xc]
	adds r1, r0, #0
	adds r0, #0x3f
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #6
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	ldr r1, [r7, #0xc]
	adds r0, r1, #0
	b _0806C46C
_0806C46C:
	add sp, #0x10
	pop {r7}
	pop {r1}
	bx r1

	thumb_func_start sub_806C474
sub_806C474: @ 0x0806C474
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x41
	ldrb r2, [r1]
	adds r0, r2, #0
	bl GetClassSMSId
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x3c
	ldrb r1, [r2]
	bl UseUnitSprite
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_806C4A0
sub_806C4A0: @ 0x0806C4A0
	push {r4, r7, lr}
	sub sp, #0x1c
	mov r7, sp
	adds r4, r0, #0
	adds r0, r2, #0
	str r3, [r7, #8]
	adds r2, r7, #0
	adds r3, r4, #0
	strh r3, [r2]
	adds r2, r7, #2
	strh r1, [r2]
	adds r1, r7, #4
	strh r0, [r1]
	adds r0, r7, #0
	adds r0, #0x18
	movs r1, #0
	strh r1, [r0]
	adds r0, r7, #0
	adds r0, #0x1a
	movs r1, #0
	strb r1, [r0]
	ldr r0, [r7, #8]
	movs r1, #1
	cmn r0, r1
	bne _0806C4E6
	movs r0, #0xe0
	lsls r0, r0, #2
	str r0, [r7, #8]
	ldr r0, [r7, #8]
	adds r1, r7, #0
	adds r1, #0x1a
	bl sub_806D6A0
	str r0, [r7, #0x14]
	b _0806C4F2
_0806C4E6:
	ldr r0, [r7, #8]
	adds r1, r7, #0
	adds r1, #0x1a
	bl sub_806D744
	str r0, [r7, #0x14]
_0806C4F2:
	ldr r0, [r7, #0x14]
	cmp r0, #0
	bne _0806C4FC
	movs r0, #0
	b _0806C730
_0806C4FC:
	ldr r1, _0806C528 @ =gUnk_08D64F4C
	adds r0, r1, #0
	bl Proc_Find
	cmp r0, #0
	beq _0806C510
	adds r0, r7, #0
	adds r0, #0x18
	movs r1, #0xfe
	strh r1, [r0]
_0806C510:
	ldr r1, _0806C528 @ =gUnk_08D64F4C
	adds r0, r1, #0
	movs r1, #5
	bl Proc_Start
	str r0, [r7, #0xc]
	ldr r0, [r7, #0xc]
	cmp r0, #0
	bne _0806C52C
	movs r0, #0
	b _0806C730
	.align 2, 0
_0806C528: .4byte gUnk_08D64F4C
_0806C52C:
	ldr r0, [r7, #0xc]
	movs r1, #0
	str r1, [r0, #0x2c]
	ldr r0, [r7, #0xc]
	adds r1, r0, #0
	adds r0, #0x3f
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #1
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, [r7, #0xc]
	adds r1, r7, #0
	ldrh r2, [r1]
	adds r1, r2, #0
	lsls r2, r1, #4
	adds r3, r2, #0
	lsls r1, r3, #4
	adds r2, r0, #0
	adds r0, #0x4c
	ldrh r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0]
	ldr r0, [r7, #0xc]
	adds r1, r7, #2
	ldrh r2, [r1]
	adds r1, r2, #0
	lsls r2, r1, #4
	adds r3, r2, #0
	lsls r1, r3, #4
	adds r2, r0, #0
	adds r0, #0x4e
	ldrh r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0]
	ldr r0, [r7, #0xc]
	adds r1, r0, #0
	adds r0, #0x50
	ldrh r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strh r2, [r0]
	ldr r0, [r7, #0xc]
	adds r1, r0, #0
	adds r0, #0x52
	ldrh r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strh r2, [r0]
	ldr r0, [r7, #0xc]
	adds r1, r0, #0
	adds r0, #0x42
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0xb
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, [r7, #0xc]
	adds r1, r0, #0
	adds r0, #0x48
	ldrh r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strh r2, [r0]
	ldr r1, [r7, #0xc]
	adds r0, r7, #0
	adds r0, #0x18
	ldrh r2, [r0]
	adds r0, r2, #0
	adds r2, r1, #0
	adds r1, #0x43
	ldrb r2, [r1]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	orrs r0, r3
	adds r2, r0, #0
	strb r2, [r1]
	ldr r1, [r7, #0xc]
	adds r0, r7, #4
	ldrh r2, [r0]
	adds r0, r2, #0
	adds r2, r1, #0
	adds r1, #0x41
	ldrb r2, [r1]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	orrs r0, r3
	adds r2, r0, #0
	strb r2, [r1]
	ldr r0, [r7, #0xc]
	adds r1, r0, #0
	adds r0, #0x40
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, [r7, #0xc]
	ldr r2, [r7, #8]
	lsls r1, r2, #5
	ldr r3, _0806C72C @ =0x06010000
	adds r2, r1, r3
	str r2, [r0, #0x38]
	ldr r0, [r7, #0xc]
	adds r1, r7, #0
	adds r1, #0x1a
	adds r2, r0, #0
	adds r0, #0x3c
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	ldrb r1, [r1]
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0]
	ldr r0, [r7, #0xc]
	adds r1, r0, #0
	adds r0, #0x46
	ldrh r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x80
	lsls r3, r3, #4
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strh r2, [r0]
	ldr r0, [r7, #0xc]
	adds r1, r0, #0
	adds r0, #0x4a
	ldrh r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strh r2, [r0]
	ldr r0, [r7, #0xc]
	adds r1, r0, #0
	adds r0, #0x44
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, [r7, #0x14]
	ldr r2, [r7, #0x28]
	adds r1, r2, #0
	ldrb r2, [r0, #1]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0, #1]
	adds r0, r7, #4
	ldrh r1, [r0]
	adds r0, r1, #0
	bl sub_806DD6C
	adds r1, r0, #0
	adds r0, r1, #0
	movs r1, #0xa
	bl StartSpriteAnim
	str r0, [r7, #0x10]
	ldr r1, [r7, #0x10]
	adds r0, r1, #0
	movs r1, #4
	bl SetSpriteAnimId
	ldr r1, [r7, #0xc]
	adds r0, r1, #0
	bl sub_806DD40
	adds r4, r0, #0
	ldr r0, [r7, #0x14]
	ldrb r1, [r0]
	adds r0, r1, #0
	bl sub_806DD10
	adds r1, r0, #0
	adds r0, r4, #0
	bl Decompress
	ldr r0, [r7, #0x14]
	ldrb r1, [r0]
	adds r0, r1, #0
	bl sub_806DD10
	ldr r1, [r7, #0x10]
	str r0, [r1, #0x24]
	ldr r0, [r7, #0x10]
	ldr r1, [r7, #0x14]
	ldr r2, [r7, #0x14]
	ldrb r3, [r2, #1]
	movs r4, #0xf
	adds r2, r3, #0
	ands r2, r4
	adds r4, r2, #0
	lsls r3, r4, #0x18
	lsrs r2, r3, #0x18
	adds r3, r2, #0
	lsls r2, r3, #0xc
	ldrh r1, [r1, #2]
	adds r1, r1, r2
	ldr r3, [r7, #0xc]
	adds r2, r3, #0
	adds r3, #0x46
	ldrh r2, [r3]
	adds r1, r1, r2
	ldrh r2, [r0, #0x22]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0, #0x22]
	ldr r0, [r7, #0xc]
	ldr r1, [r7, #0x10]
	str r1, [r0, #0x30]
	ldr r0, [r7, #0xc]
	ldr r1, [r7, #0x14]
	str r1, [r0, #0x34]
	ldr r0, [r7, #0xc]
	ldr r1, [r0, #0x34]
	ldr r0, [r7, #0xc]
	str r0, [r1, #0x48]
	ldr r1, [r7, #0xc]
	adds r0, r1, #0
	b _0806C730
	.align 2, 0
_0806C72C: .4byte 0x06010000
_0806C730:
	add sp, #0x1c
	pop {r4, r7}
	pop {r1}
	bx r1

	thumb_func_start sub_806C738
sub_806C738: @ 0x0806C738
	push {r7, lr}
	sub sp, #8
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	ldr r1, [r7]
	ldr r2, [r7, #4]
	adds r0, r2, #0
	adds r2, r1, #0
	adds r1, #0x42
	ldrb r2, [r1]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	orrs r0, r3
	adds r2, r0, #0
	strb r2, [r1]
	ldr r0, [r7, #4]
	cmp r0, #0xf
	bne _0806C774
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x3c
	ldrb r0, [r1]
	ldr r1, [r7]
	ldr r2, [r1, #0x38]
	adds r1, r2, #0
	bl sub_8025AE0
	b _0806C786
_0806C774:
	ldr r1, [r7]
	ldr r0, [r1, #0x30]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x42
	movs r1, #0
	ldrsb r1, [r2, r1]
	bl SetSpriteAnimId
_0806C786:
	add sp, #8
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_806C790
sub_806C790: @ 0x0806C790
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x41
	ldrb r2, [r1]
	adds r0, r2, #0
	bl GetClassData
	ldr r1, [r0, #0x28]
	movs r2, #1
	adds r0, r1, #0
	ands r0, r2
	cmp r0, #0
	beq _0806C7BC
	ldr r0, [r7]
	movs r1, #1
	bl sub_806C738
	b _0806C7C4
_0806C7BC:
	ldr r0, [r7]
	movs r1, #2
	bl sub_806C738
_0806C7C4:
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0

	thumb_func_start sub_806C7CC
sub_806C7CC: @ 0x0806C7CC
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	ldr r1, _0806C7E4 @ =gUnk_08D64F4C
	adds r0, r1, #0
	bl Proc_Find
	str r0, [r7]
	ldr r0, [r7]
	cmp r0, #0
	bne _0806C7E8
	b _0806C7EE
	.align 2, 0
_0806C7E4: .4byte gUnk_08D64F4C
_0806C7E8:
	ldr r0, [r7]
	bl sub_806C790
_0806C7EE:
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_806C7F8
sub_806C7F8: @ 0x0806C7F8
	push {r7, lr}
	sub sp, #8
	mov r7, sp
	str r0, [r7]
	ldr r1, _0806C814 @ =gUnk_08D64F4C
	adds r0, r1, #0
	bl Proc_Find
	str r0, [r7, #4]
	ldr r0, [r7, #4]
	cmp r0, #0
	bne _0806C818
	b _0806C822
	.align 2, 0
_0806C814: .4byte gUnk_08D64F4C
_0806C818:
	ldr r1, [r7, #4]
	adds r0, r1, #0
	ldr r1, [r7]
	bl sub_806C8F0
_0806C822:
	add sp, #8
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_806C82C
sub_806C82C: @ 0x0806C82C
	push {r7, lr}
	mov r7, sp
	ldr r1, _0806C844 @ =gUnk_08D64F4C
	adds r0, r1, #0
	bl Proc_Find
	adds r1, r0, #0
	adds r0, r1, #0
	cmp r0, #0
	beq _0806C842
	movs r0, #1
_0806C842:
	b _0806C848
	.align 2, 0
_0806C844: .4byte gUnk_08D64F4C
_0806C848:
	pop {r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_806C850
sub_806C850: @ 0x0806C850
	push {r7, lr}
	sub sp, #8
	mov r7, sp
	movs r0, #0
	str r0, [r7, #4]
_0806C85A:
	ldr r0, [r7, #4]
	cmp r0, #3
	ble _0806C862
	b _0806C8A2
_0806C862:
	ldr r0, _0806C890 @ =0x030014E8
	ldr r1, [r7, #4]
	movs r2, #0x4c
	muls r1, r2, r1
	adds r0, r0, r1
	ldrb r1, [r0]
	cmp r1, #0
	beq _0806C89A
	ldr r0, _0806C890 @ =0x030014E8
	ldr r1, [r7, #4]
	movs r2, #0x4c
	muls r1, r2, r1
	adds r0, #0x48
	adds r1, r0, r1
	ldr r0, [r1]
	str r0, [r7]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x3f
	ldrb r0, [r1]
	cmp r0, #1
	beq _0806C894
	b _0806C896
	.align 2, 0
_0806C890: .4byte 0x030014E8
_0806C894:
	b _0806C89A
_0806C896:
	movs r0, #1
	b _0806C8B0
_0806C89A:
	ldr r0, [r7, #4]
	adds r1, r0, #1
	str r1, [r7, #4]
	b _0806C85A
_0806C8A2:
	ldr r0, [r7, #4]
	cmp r0, #3
	ble _0806C8AC
	movs r0, #0
	b _0806C8B0
_0806C8AC:
	movs r0, #1
	b _0806C8B0
_0806C8B0:
	add sp, #8
	pop {r7}
	pop {r1}
	bx r1

	thumb_func_start sub_806C8B8
sub_806C8B8: @ 0x0806C8B8
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, [r7]
	ldr r1, [r0, #0x34]
	ldrb r0, [r1]
	cmp r0, #0
	bne _0806C8CE
	movs r0, #0
	b _0806C8E8
_0806C8CE:
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x3f
	ldrb r0, [r1]
	cmp r0, #1
	beq _0806C8DC
	b _0806C8E0
_0806C8DC:
	movs r0, #0
	b _0806C8E8
_0806C8E0:
	movs r0, #1
	b _0806C8E8
_0806C8E4:
	movs r0, #0
	b _0806C8E8
_0806C8E8:
	add sp, #4
	pop {r7}
	pop {r1}
	bx r1

	thumb_func_start sub_806C8F0
sub_806C8F0: @ 0x0806C8F0
	push {r7, lr}
	sub sp, #0xc
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	movs r0, #0
	str r0, [r7, #8]
_0806C8FE:
	ldr r0, [r7, #8]
	cmp r0, #0x3f
	ble _0806C906
	b _0806C930
_0806C906:
	ldr r0, [r7]
	ldr r1, [r0, #0x34]
	adds r0, r1, #5
	ldr r1, [r7, #8]
	adds r0, r0, r1
	ldr r1, [r7, #4]
	ldr r2, [r7, #8]
	adds r1, r1, r2
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	ldrb r1, [r1]
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0]
	ldr r0, [r7, #8]
	adds r1, r0, #1
	str r1, [r7, #8]
	b _0806C8FE
_0806C930:
	ldr r1, [r7]
	ldr r0, [r1, #0x34]
	ldrb r1, [r0, #4]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0, #4]
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x3f
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #2
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, [r7]
	bl sub_806CAD0
	add sp, #0xc
	pop {r7}
	pop {r0}
	bx r0

	thumb_func_start sub_806C964
sub_806C964: @ 0x0806C964
	push {r4, r7, lr}
	sub sp, #0x14
	add r7, sp, #4
	adds r4, r0, #0
	adds r0, r2, #0
	str r3, [r7, #8]
	adds r2, r7, #0
	adds r3, r4, #0
	strh r3, [r2]
	adds r2, r7, #2
	strh r1, [r2]
	adds r1, r7, #4
	strh r0, [r1]
	adds r1, r7, #0
	ldrh r0, [r1]
	adds r2, r7, #2
	ldrh r1, [r2]
	adds r3, r7, #4
	ldrh r2, [r3]
	movs r3, #1
	rsbs r3, r3, #0
	ldr r4, [r7, #8]
	str r4, [sp]
	bl sub_806C4A0
	str r0, [r7, #0xc]
	ldr r0, [r7, #0xc]
	cmp r0, #0
	bne _0806C9A2
	movs r0, #0
	b _0806C9B2
_0806C9A2:
	ldr r1, [r7, #0xc]
	adds r0, r1, #0
	ldr r1, [r7, #0x1c]
	bl sub_806C8F0
	ldr r1, [r7, #0xc]
	adds r0, r1, #0
	b _0806C9B2
_0806C9B2:
	add sp, #0x14
	pop {r4, r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_806C9BC
sub_806C9BC: @ 0x0806C9BC
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, [r7]
	movs r1, #0
	str r1, [r0, #0x58]
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x64
	ldrh r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strh r2, [r0]
	ldr r0, [r7]
	movs r1, #0
	str r1, [r0, #0x5c]
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x66
	ldrh r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strh r2, [r0]
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0

	thumb_func_start sub_806C9F8
sub_806C9F8: @ 0x0806C9F8
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r1, [r7]
	ldr r0, [r1, #0x58]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x64
	movs r3, #0
	ldrsh r1, [r2, r3]
	bl sub_80151FC
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_806CA1C
sub_806CA1C: @ 0x0806CA1C
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, [r7]
	ldr r1, [r0, #0x5c]
	cmp r1, #0
	beq _0806CA3E
	ldr r1, [r7]
	ldr r0, [r1, #0x5c]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x66
	movs r3, #0
	ldrsh r1, [r2, r3]
	bl sub_80151FC
_0806CA3E:
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_806CA48
sub_806CA48: @ 0x0806CA48
	push {r7, lr}
	sub sp, #0x10
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	str r2, [r7, #8]
	ldr r1, _0806CA98 @ =gUnk_08D64DB0
	adds r0, r1, #0
	bl Proc_Find
	str r0, [r7, #0xc]
	ldr r0, [r7, #0xc]
	cmp r0, #0
	bne _0806CA70
	ldr r1, _0806CA98 @ =gUnk_08D64DB0
	adds r0, r1, #0
	movs r1, #3
	bl Proc_Start
	str r0, [r7, #0xc]
_0806CA70:
	ldr r0, [r7, #0xc]
	ldr r1, [r0, #0x58]
	cmp r1, #0
	bne _0806CA9C
	ldr r0, [r7, #0xc]
	ldr r1, [r7]
	str r1, [r0, #0x58]
	ldr r1, [r7, #0xc]
	ldr r2, [r7, #8]
	adds r0, r2, #0
	adds r2, r1, #0
	adds r1, #0x64
	ldrh r2, [r1]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	orrs r0, r3
	adds r2, r0, #0
	strh r2, [r1]
	b _0806CAC6
	.align 2, 0
_0806CA98: .4byte gUnk_08D64DB0
_0806CA9C:
	ldr r0, [r7, #0xc]
	ldr r1, [r0, #0x60]
	cmp r1, #0
	bne _0806CAC6
	ldr r0, [r7, #0xc]
	ldr r1, [r7]
	ldr r2, [r7, #4]
	adds r1, r1, r2
	str r1, [r0, #0x5c]
	ldr r1, [r7, #0xc]
	ldr r2, [r7, #8]
	adds r0, r2, #0
	adds r2, r1, #0
	adds r1, #0x66
	ldrh r2, [r1]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	orrs r0, r3
	adds r2, r0, #0
	strh r2, [r1]
_0806CAC6:
	add sp, #0x10
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_806CAD0
sub_806CAD0: @ 0x0806CAD0
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, [r7]
	bl sub_806D2E4
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_806CAE8
sub_806CAE8: @ 0x0806CAE8
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0

	thumb_func_start sub_806CAF8
sub_806CAF8: @ 0x0806CAF8
	push {r4, r5, r7, lr}
	sub sp, #0xc
	mov r7, sp
	str r0, [r7]
_0806CB00:
	b _0806CB04
_0806CB02:
	b _0806CD22
_0806CB04:
	adds r0, r7, #4
	ldr r2, [r7]
	ldr r1, [r2, #0x34]
	ldr r3, [r7]
	ldr r2, [r3, #0x34]
	ldrb r3, [r2, #4]
	adds r4, r3, #1
	adds r5, r4, #0
	strb r5, [r2, #4]
	lsls r3, r3, #0x18
	lsrs r2, r3, #0x18
	adds r1, #5
	adds r2, r1, r2
	movs r1, #0
	ldrsb r1, [r2, r1]
	adds r2, r1, #0
	strh r2, [r0]
	adds r0, r7, #4
	ldrh r1, [r0]
	adds r0, r1, #1
	adds r2, r0, #0
	lsls r1, r2, #0x10
	asrs r0, r1, #0x10
	cmp r0, #0xf
	bls _0806CB38
	b _0806CD1E
_0806CB38:
	lsls r1, r0, #2
	ldr r2, _0806CB44 @ =_0806CB48
	adds r0, r1, r2
	ldr r1, [r0]
	mov pc, r1
	.align 2, 0
_0806CB44: .4byte _0806CB48
_0806CB48: @ jump table
	.4byte _0806CC38 @ case 0
	.4byte _0806CC46 @ case 1
	.4byte _0806CC46 @ case 2
	.4byte _0806CC46 @ case 3
	.4byte _0806CC46 @ case 4
	.4byte _0806CC30 @ case 5
	.4byte _0806CC96 @ case 6
	.4byte _0806CC96 @ case 7
	.4byte _0806CC96 @ case 8
	.4byte _0806CC96 @ case 9
	.4byte _0806CB88 @ case 10
	.4byte _0806CBD4 @ case 11
	.4byte _0806CD1E @ case 12
	.4byte _0806CCDA @ case 13
	.4byte _0806CD0E @ case 14
	.4byte _0806CD16 @ case 15
_0806CB88:
	ldr r0, [r7]
	ldr r2, [r7]
	ldr r1, [r2, #0x34]
	ldr r3, [r7]
	ldr r2, [r3, #0x34]
	ldrb r3, [r2, #4]
	adds r4, r3, #1
	adds r5, r4, #0
	strb r5, [r2, #4]
	lsls r3, r3, #0x18
	lsrs r2, r3, #0x18
	adds r1, #5
	adds r2, r1, r2
	movs r3, #0
	ldrsb r3, [r2, r3]
	adds r1, r3, #0
	adds r2, r0, #0
	adds r0, #0x48
	ldrh r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strh r2, [r0]
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x3f
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #3
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	b _0806CD22
_0806CBD4:
	ldr r0, [r7]
	bl sub_806CAE8
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x3f
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #5
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x4c
	movs r2, #0
	ldrsh r0, [r1, r2]
	asrs r1, r0, #4
	adds r0, r1, #0
	lsls r1, r0, #0x10
	asrs r0, r1, #0x10
	ldr r1, _0806CC2C @ =gBmSt
	movs r3, #0xc
	ldrsh r2, [r1, r3]
	subs r0, r0, r2
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x4e
	movs r4, #0
	ldrsh r1, [r2, r4]
	asrs r2, r1, #4
	adds r1, r2, #0
	lsls r2, r1, #0x10
	asrs r1, r2, #0x10
	ldr r2, _0806CC2C @ =gBmSt
	movs r4, #0xe
	ldrsh r3, [r2, r4]
	subs r1, r1, r3
	bl sub_806CD2C
	b _0806CD22
	.align 2, 0
_0806CC2C: .4byte gBmSt
_0806CC30:
	ldr r0, [r7]
	bl sub_806D4EC
	b _0806CD22
_0806CC38:
	ldr r0, [r7]
	bl sub_806CAE8
	ldr r0, [r7]
	bl sub_806D4BC
	b _0806CD22
_0806CC46:
	adds r0, r7, #4
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x42
	movs r3, #0
	ldrsb r3, [r2, r3]
	adds r1, r3, #0
	movs r2, #0
	ldrsh r0, [r0, r2]
	lsls r2, r1, #0x10
	asrs r1, r2, #0x10
	cmp r0, r1
	beq _0806CC94
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x41
	ldrb r2, [r1]
	adds r0, r2, #0
	bl sub_806DD6C
	str r0, [r7, #8]
	adds r0, r7, #4
	movs r3, #0
	ldrsh r1, [r0, r3]
	ldr r0, [r7]
	bl sub_806C738
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x3f
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #2
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
_0806CC94:
	b _0806CD22
_0806CC96:
	adds r0, r7, #4
	adds r1, r7, #4
	ldrh r2, [r1]
	subs r1, r2, #5
	adds r2, r1, #0
	strh r2, [r0]
	adds r0, r7, #4
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x42
	movs r3, #0
	ldrsb r3, [r2, r3]
	adds r1, r3, #0
	movs r4, #0
	ldrsh r0, [r0, r4]
	lsls r2, r1, #0x10
	asrs r1, r2, #0x10
	cmp r0, r1
	beq _0806CCD8
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x41
	ldrb r2, [r1]
	adds r0, r2, #0
	bl sub_806DD6C
	str r0, [r7, #8]
	adds r0, r7, #4
	movs r2, #0
	ldrsh r1, [r0, r2]
	ldr r0, [r7]
	bl sub_806C738
_0806CCD8:
	b _0806CB00
_0806CCDA:
	ldr r0, [r7]
	ldr r2, [r7]
	ldr r1, [r2, #0x34]
	ldr r3, [r7]
	ldr r2, [r3, #0x34]
	ldrb r3, [r2, #4]
	adds r4, r3, #1
	adds r5, r4, #0
	strb r5, [r2, #4]
	lsls r3, r3, #0x18
	lsrs r2, r3, #0x18
	adds r1, #5
	adds r2, r1, r2
	movs r3, #0
	ldrsb r3, [r2, r3]
	adds r1, r3, #0
	adds r2, r0, #0
	adds r0, #0x4a
	ldrh r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strh r2, [r0]
	b _0806CB00
_0806CD0E:
	ldr r0, [r7]
	bl sub_806C3B0
	b _0806CB00
_0806CD16:
	ldr r0, [r7]
	bl sub_806C3D8
	b _0806CB00
_0806CD1E:
	b _0806CD20
_0806CD20:
	b _0806CB00
_0806CD22:
	add sp, #0xc
	pop {r4, r5, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_806CD2C
sub_806CD2C: @ 0x0806CD2C
	push {r7, lr}
	sub sp, #0x10
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	ldr r0, _0806CD98 @ =gUnk_083FB1AC
	ldr r1, _0806CD9C @ =0x06013000
	bl Decompress
	ldr r1, _0806CDA0 @ =gUnk_083F641C
	adds r0, r1, #0
	movs r1, #2
	bl StartSpriteAnim
	str r0, [r7, #0xc]
	ldr r0, [r7, #0xc]
	ldrh r1, [r0, #0x22]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x8c
	lsls r3, r3, #5
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strh r2, [r0, #0x22]
	ldr r1, [r7, #0xc]
	adds r0, r1, #0
	movs r1, #0
	bl SetSpriteAnimId
	ldr r1, _0806CDA4 @ =gUnk_08D64DE0
	adds r0, r1, #0
	movs r1, #3
	bl Proc_Start
	str r0, [r7, #8]
	ldr r0, [r7, #8]
	ldr r1, [r7, #0xc]
	str r1, [r0, #0x50]
	ldr r0, [r7, #8]
	ldr r1, [r7]
	adds r2, r1, #0
	adds r2, #8
	str r2, [r0, #0x2c]
	ldr r0, [r7, #8]
	ldr r1, [r7, #4]
	subs r2, r1, #4
	str r2, [r0, #0x30]
	add sp, #0x10
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806CD98: .4byte gUnk_083FB1AC
_0806CD9C: .4byte 0x06013000
_0806CDA0: .4byte gUnk_083F641C
_0806CDA4: .4byte gUnk_08D64DE0

	thumb_func_start sub_806CDA8
sub_806CDA8: @ 0x0806CDA8
	push {r4, r5, r6, r7, lr}
	sub sp, #8
	add r7, sp, #4
	str r0, [r7]
	ldr r1, _0806CE5C @ =gPlaySt
	adds r0, r1, #0
	adds r1, #0x41
	ldrb r0, [r1]
	lsls r1, r0, #0x1e
	lsrs r0, r1, #0x1f
	cmp r0, #0
	bne _0806CDC8
	ldr r1, _0806CE60 @ =0x00000397
	adds r0, r1, #0
	bl m4aSongNumStart
_0806CDC8:
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x64
	ldrh r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strh r2, [r0]
	ldr r1, _0806CE64 @ =gSinLut
	adds r0, r1, #0
	adds r1, #0x80
	movs r2, #0
	ldrsh r0, [r1, r2]
	lsls r1, r0, #4
	movs r2, #0x80
	lsls r2, r2, #2
	adds r0, r1, #0
	adds r1, r2, #0
	bl Div
	adds r1, r0, #0
	lsls r0, r1, #0x10
	asrs r4, r0, #0x10
	ldr r0, _0806CE64 @ =gSinLut
	movs r2, #0
	ldrsh r1, [r0, r2]
	rsbs r0, r1, #0
	lsls r1, r0, #4
	movs r2, #0x80
	lsls r2, r2, #2
	adds r0, r1, #0
	adds r1, r2, #0
	bl Div
	adds r1, r0, #0
	lsls r0, r1, #0x10
	asrs r5, r0, #0x10
	ldr r0, _0806CE64 @ =gSinLut
	movs r2, #0
	ldrsh r1, [r0, r2]
	lsls r0, r1, #4
	movs r1, #0x80
	lsls r1, r1, #2
	bl Div
	adds r1, r0, #0
	lsls r0, r1, #0x10
	asrs r6, r0, #0x10
	ldr r1, _0806CE64 @ =gSinLut
	adds r0, r1, #0
	adds r1, #0x80
	movs r2, #0
	ldrsh r0, [r1, r2]
	lsls r1, r0, #4
	movs r2, #0x80
	lsls r2, r2, #2
	adds r0, r1, #0
	adds r1, r2, #0
	bl Div
	adds r2, r0, #0
	lsls r1, r2, #0x10
	asrs r0, r1, #0x10
	str r0, [sp]
	movs r0, #0
	adds r1, r4, #0
	adds r2, r5, #0
	adds r3, r6, #0
	bl SetObjAffine
	add sp, #8
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806CE5C: .4byte gPlaySt
_0806CE60: .4byte 0x00000397
_0806CE64: .4byte gSinLut

	thumb_func_start sub_806CE68
sub_806CE68: @ 0x0806CE68
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	add r7, sp, #4
	str r0, [r7]
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x64
	ldrh r1, [r0]
	adds r2, r1, #1
	adds r3, r2, #0
	strh r3, [r0]
	lsls r1, r1, #0x10
	asrs r0, r1, #0x10
	cmp r0, #7
	ble _0806CE8C
	ldr r0, [r7]
	bl Proc_Break
_0806CE8C:
	movs r1, #0x80
	lsls r1, r1, #2
	movs r2, #0x80
	lsls r2, r2, #1
	ldr r3, [r7]
	adds r0, r3, #0
	adds r4, r3, #0
	adds r4, #0x64
	movs r0, #0
	ldrsh r3, [r4, r0]
	movs r0, #8
	str r0, [sp]
	movs r0, #5
	bl Interpolate
	str r0, [r7, #4]
	ldr r1, _0806CF48 @ =gSinLut
	adds r0, r1, #0
	adds r1, #0x80
	movs r2, #0
	ldrsh r0, [r1, r2]
	lsls r1, r0, #4
	ldr r2, [r7, #4]
	adds r0, r1, #0
	adds r1, r2, #0
	bl Div
	adds r1, r0, #0
	lsls r0, r1, #0x10
	asrs r4, r0, #0x10
	ldr r0, _0806CF48 @ =gSinLut
	movs r2, #0
	ldrsh r1, [r0, r2]
	rsbs r0, r1, #0
	lsls r1, r0, #4
	ldr r2, [r7, #4]
	adds r0, r1, #0
	adds r1, r2, #0
	bl Div
	adds r1, r0, #0
	lsls r0, r1, #0x10
	asrs r5, r0, #0x10
	ldr r0, _0806CF48 @ =gSinLut
	movs r2, #0
	ldrsh r1, [r0, r2]
	lsls r0, r1, #4
	ldr r1, [r7, #4]
	bl Div
	adds r1, r0, #0
	lsls r0, r1, #0x10
	asrs r6, r0, #0x10
	ldr r1, _0806CF48 @ =gSinLut
	adds r0, r1, #0
	adds r1, #0x80
	movs r2, #0
	ldrsh r0, [r1, r2]
	lsls r1, r0, #4
	ldr r2, [r7, #4]
	adds r0, r1, #0
	adds r1, r2, #0
	bl Div
	adds r2, r0, #0
	lsls r1, r2, #0x10
	asrs r0, r1, #0x10
	str r0, [sp]
	movs r0, #0
	adds r1, r4, #0
	adds r2, r5, #0
	adds r3, r6, #0
	bl SetObjAffine
	ldr r1, [r7]
	ldr r0, [r1, #0x50]
	ldr r1, [r7]
	ldr r2, [r1, #0x2c]
	adds r1, r2, #0
	subs r1, #8
	ldr r2, [r7]
	ldr r3, [r2, #0x30]
	adds r2, r3, #0
	subs r2, #8
	movs r3, #0xc0
	lsls r3, r3, #2
	orrs r2, r3
	bl DisplaySpriteAnim
	add sp, #0xc
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806CF48: .4byte gSinLut

	thumb_func_start sub_806CF4C
sub_806CF4C: @ 0x0806CF4C
	push {r4, r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x64
	ldrh r1, [r0]
	adds r2, r1, #1
	adds r3, r2, #0
	strh r3, [r0]
	lsls r1, r1, #0x10
	asrs r0, r1, #0x10
	cmp r0, #0x27
	ble _0806CF70
	ldr r0, [r7]
	bl Proc_Break
_0806CF70:
	ldr r1, [r7]
	ldr r0, [r1, #0x50]
	ldr r2, [r7]
	ldr r1, [r2, #0x2c]
	ldr r2, [r7]
	ldr r3, [r2, #0x30]
	movs r4, #0x80
	lsls r4, r4, #1
	adds r2, r3, #0
	orrs r2, r4
	bl DisplaySpriteAnim
	add sp, #4
	pop {r4, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_806CF90
sub_806CF90: @ 0x0806CF90
	push {r7, lr}
	mov r7, sp
	ldr r1, _0806CFA8 @ =gUnk_08D64DE0
	adds r0, r1, #0
	bl Proc_Find
	adds r1, r0, #0
	adds r0, r1, #0
	cmp r0, #0
	beq _0806CFA6
	movs r0, #1
_0806CFA6:
	b _0806CFAC
	.align 2, 0
_0806CFA8: .4byte gUnk_08D64DE0
_0806CFAC:
	pop {r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_806CFB4
sub_806CFB4: @ 0x0806CFB4
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	bl sub_806CF90
	lsls r1, r0, #0x18
	asrs r0, r1, #0x18
	cmp r0, #0
	bne _0806CFE0
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x3f
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #3
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
_0806CFE0:
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0

	thumb_func_start sub_806CFE8
sub_806CFE8: @ 0x0806CFE8
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x3f
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #2
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0

	thumb_func_start sub_806D010
sub_806D010: @ 0x0806D010
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x48
	ldrh r0, [r1]
	cmp r0, #0
	bne _0806D03E
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x3f
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #2
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	b _0806D064
_0806D03E:
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x48
	ldr r0, [r7]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x48
	ldrh r3, [r2]
	subs r1, r3, #1
	adds r2, r0, #0
	adds r0, #0x48
	ldrh r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0]
_0806D064:
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0

	thumb_func_start sub_806D06C
sub_806D06C: @ 0x0806D06C
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0

	thumb_func_start sub_806D07C
sub_806D07C: @ 0x0806D07C
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0

	thumb_func_start sub_806D08C
sub_806D08C: @ 0x0806D08C
	push {r4, r5, r7, lr}
	sub sp, #8
	mov r7, sp
	str r0, [r7]
	ldr r0, [r7]
	bl sub_806DB6C
	lsls r1, r0, #0x10
	lsrs r0, r1, #0x10
	str r0, [r7, #4]
	ldr r0, [r7]
	ldr r1, [r7]
	adds r2, r1, #0
	adds r1, #0x48
	ldr r3, [r7, #4]
	adds r2, r3, #0
	ldrh r3, [r1]
	adds r1, r2, r3
	adds r2, r0, #0
	adds r0, #0x48
	ldrh r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0]
	ldr r0, [r7]
	ldr r1, [r7]
	adds r2, r1, #0
	adds r1, #0x4c
	ldr r2, _0806D2D8 @ =gUnk_08D64E00
	ldr r4, [r7]
	adds r3, r4, #0
	adds r4, #0x42
	movs r3, #0
	ldrsb r3, [r4, r3]
	adds r4, r3, #0
	lsls r3, r4, #2
	adds r2, r2, r3
	movs r4, #0
	ldrsh r3, [r2, r4]
	ldr r4, [r7, #4]
	adds r2, r3, #0
	muls r2, r4, r2
	ldrh r1, [r1]
	adds r1, r1, r2
	adds r2, r0, #0
	adds r0, #0x4c
	ldrh r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0]
	ldr r0, [r7]
	ldr r1, [r7]
	adds r2, r1, #0
	adds r1, #0x4e
	ldr r2, _0806D2D8 @ =gUnk_08D64E00
	ldr r4, [r7]
	adds r3, r4, #0
	adds r4, #0x42
	movs r3, #0
	ldrsb r3, [r4, r3]
	adds r4, r3, #0
	lsls r3, r4, #1
	adds r4, r3, #1
	adds r3, r4, #0
	lsls r4, r3, #1
	adds r2, r2, r4
	movs r5, #0
	ldrsh r3, [r2, r5]
	ldr r4, [r7, #4]
	adds r2, r3, #0
	muls r2, r4, r2
	ldrh r1, [r1]
	adds r1, r1, r2
	adds r2, r0, #0
	adds r0, #0x4e
	ldrh r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x48
	ldrh r0, [r1]
	lsrs r1, r0, #4
	adds r0, r1, #0
	lsls r1, r0, #0x10
	lsrs r0, r1, #0x10
	cmp r0, #0xf
	bhi _0806D158
	b _0806D254
_0806D158:
	ldr r0, [r7]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x48
	ldrh r3, [r2]
	ldr r2, _0806D2DC @ =0xFFFFFF00
	adds r1, r3, r2
	adds r2, r0, #0
	adds r0, #0x48
	ldrh r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0]
	ldr r0, [r7]
	ldr r1, [r7]
	adds r2, r1, #0
	adds r1, #0x4c
	ldr r3, [r7]
	adds r2, r3, #0
	adds r3, #0x48
	ldrh r2, [r3]
	ldr r3, _0806D2D8 @ =gUnk_08D64E00
	ldr r5, [r7]
	adds r4, r5, #0
	adds r5, #0x42
	movs r4, #0
	ldrsb r4, [r5, r4]
	adds r5, r4, #0
	lsls r4, r5, #2
	adds r3, r3, r4
	movs r5, #0
	ldrsh r4, [r3, r5]
	muls r2, r4, r2
	ldrh r1, [r1]
	subs r1, r1, r2
	adds r2, r0, #0
	adds r0, #0x4c
	ldrh r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0]
	ldr r0, [r7]
	ldr r1, [r7]
	adds r2, r1, #0
	adds r1, #0x4e
	ldr r3, [r7]
	adds r2, r3, #0
	adds r3, #0x48
	ldrh r2, [r3]
	ldr r3, _0806D2D8 @ =gUnk_08D64E00
	ldr r5, [r7]
	adds r4, r5, #0
	adds r5, #0x42
	movs r4, #0
	ldrsb r4, [r5, r4]
	adds r5, r4, #0
	lsls r4, r5, #1
	adds r5, r4, #1
	adds r4, r5, #0
	lsls r5, r4, #1
	adds r3, r3, r5
	movs r5, #0
	ldrsh r4, [r3, r5]
	muls r2, r4, r2
	ldrh r1, [r1]
	subs r1, r1, r2
	adds r2, r0, #0
	adds r0, #0x4e
	ldrh r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0]
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x48
	ldrh r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strh r2, [r0]
	ldr r0, [r7]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x4c
	ldrh r1, [r2]
	movs r2, #0xf
	bics r1, r2
	adds r2, r0, #0
	adds r0, #0x4c
	ldrh r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0]
	ldr r0, [r7]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x4e
	ldrh r1, [r2]
	movs r2, #0xf
	bics r1, r2
	adds r2, r0, #0
	adds r0, #0x4e
	ldrh r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0]
_0806D254:
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x3e
	ldrb r0, [r1]
	cmp r0, #0
	beq _0806D2B4
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x4c
	movs r2, #0
	ldrsh r0, [r1, r2]
	asrs r1, r0, #4
	adds r2, r1, #0
	lsls r0, r2, #0x10
	asrs r1, r0, #0x10
	adds r0, r1, #0
	bl sub_8015D10
	adds r1, r0, #0
	ldr r0, _0806D2E0 @ =gBmSt
	ldrh r2, [r0, #0xc]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strh r2, [r0, #0xc]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x4e
	movs r4, #0
	ldrsh r0, [r1, r4]
	asrs r1, r0, #4
	adds r2, r1, #0
	lsls r0, r2, #0x10
	asrs r1, r0, #0x10
	adds r0, r1, #0
	bl sub_8015D54
	adds r1, r0, #0
	ldr r0, _0806D2E0 @ =gBmSt
	ldrh r2, [r0, #0xe]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strh r2, [r0, #0xe]
_0806D2B4:
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x4a
	ldrh r0, [r1]
	movs r1, #0x80
	ands r0, r1
	adds r2, r0, #0
	lsls r1, r2, #0x10
	asrs r0, r1, #0x10
	cmp r0, #0
	bne _0806D2D0
	ldr r0, [r7]
	bl sub_806D2E4
_0806D2D0:
	add sp, #8
	pop {r4, r5, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806D2D8: .4byte gUnk_08D64E00
_0806D2DC: .4byte 0xFFFFFF00
_0806D2E0: .4byte gBmSt

	thumb_func_start sub_806D2E4
sub_806D2E4: @ 0x0806D2E4
	push {r4, r7, lr}
	sub sp, #0x14
	mov r7, sp
	str r0, [r7]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x41
	ldrb r2, [r1]
	adds r0, r2, #0
	bl GetClassData
	str r0, [r7, #4]
	ldr r0, [r7, #4]
	ldr r1, [r0, #0x28]
	movs r2, #1
	adds r0, r1, #0
	ands r0, r2
	cmp r0, #0
	beq _0806D346
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x41
	ldrb r0, [r1]
	cmp r0, #0x32
	blt _0806D338
	cmp r0, #0x33
	ble _0806D320
	cmp r0, #0x37
	bgt _0806D338
	b _0806D32C
_0806D320:
	ldr r0, _0806D328 @ =gUnk_08D64ED2
	str r0, [r7, #8]
	b _0806D344
	.align 2, 0
_0806D328: .4byte gUnk_08D64ED2
_0806D32C:
	ldr r0, _0806D334 @ =gUnk_08D64EA6
	str r0, [r7, #8]
	b _0806D344
	.align 2, 0
_0806D334: .4byte gUnk_08D64EA6
_0806D338:
	ldr r0, _0806D340 @ =gUnk_08D64E78
	str r0, [r7, #8]
	b _0806D344
	.align 2, 0
_0806D340: .4byte gUnk_08D64E78
_0806D344:
	b _0806D394
_0806D346:
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x41
	ldrb r0, [r1]
	cmp r0, #0x46
	beq _0806D37C
	cmp r0, #0x46
	bgt _0806D360
	cmp r0, #0x17
	bgt _0806D388
	cmp r0, #0x14
	blt _0806D388
	b _0806D372
_0806D360:
	cmp r0, #0x55
	beq _0806D372
	cmp r0, #0x55
	blt _0806D388
	cmp r0, #0x5d
	bgt _0806D388
	cmp r0, #0x5b
	blt _0806D388
	b _0806D372
_0806D372:
	ldr r0, _0806D378 @ =gUnk_08D64E34
	str r0, [r7, #8]
	b _0806D394
	.align 2, 0
_0806D378: .4byte gUnk_08D64E34
_0806D37C:
	ldr r0, _0806D384 @ =gUnk_08D64EFE
	str r0, [r7, #8]
	b _0806D394
	.align 2, 0
_0806D384: .4byte gUnk_08D64EFE
_0806D388:
	ldr r0, _0806D390 @ =gUnk_08D64E10
	str r0, [r7, #8]
	b _0806D394
	.align 2, 0
_0806D390: .4byte gUnk_08D64E10
_0806D394:
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x43
	ldrb r1, [r0]
	adds r2, r1, #1
	adds r3, r2, #0
	strb r3, [r0]
	lsls r1, r1, #0x18
	lsrs r0, r1, #0x18
	ldr r1, [r7, #8]
	ldrh r2, [r1]
	adds r1, r2, #0
	bl DivRem
	str r0, [r7, #0xc]
	adds r1, r7, #0
	adds r1, #0x10
	ldr r0, [r7]
	bl sub_806D7E8
	ldr r0, [r7, #0xc]
	adds r1, r0, #0
	lsls r0, r1, #1
	ldr r1, [r7, #8]
	adds r0, r0, r1
	adds r1, r0, #4
	ldrh r0, [r1]
	cmp r0, #0
	beq _0806D3EE
	ldr r0, [r7, #0xc]
	adds r1, r0, #0
	lsls r0, r1, #1
	ldr r1, [r7, #8]
	adds r0, r0, r1
	adds r1, r0, #4
	ldrh r0, [r1]
	ldr r1, [r7, #8]
	adds r2, r1, #2
	ldrh r1, [r2]
	adds r3, r7, #0
	adds r3, #0x10
	movs r4, #0
	ldrsh r2, [r3, r4]
	bl sub_806CA48
_0806D3EE:
	add sp, #0x14
	pop {r4, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_806D3F8
sub_806D3F8: @ 0x0806D3F8
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x3f
	ldrb r0, [r1]
	cmp r0, #0
	beq _0806D450
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x48
	ldrh r0, [r1]
	cmp r0, #0
	bne _0806D438
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x3f
	ldrb r0, [r1]
	cmp r0, #3
	beq _0806D432
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x3f
	ldrb r0, [r1]
	cmp r0, #2
	beq _0806D432
	b _0806D438
_0806D432:
	ldr r0, [r7]
	bl sub_806CAF8
_0806D438:
	ldr r0, _0806D468 @ =gUnk_08D64F2C
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x3f
	ldrb r1, [r2]
	adds r2, r1, #0
	lsls r1, r2, #2
	adds r0, r0, r1
	ldr r1, [r0]
	ldr r0, [r7]
	bl _call_via_r1
_0806D450:
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x42
	movs r0, #0
	ldrsb r0, [r1, r0]
	cmp r0, #0xf
	bne _0806D46C
	ldr r0, [r7]
	bl sub_806D934
	b _0806D472
	.align 2, 0
_0806D468: .4byte gUnk_08D64F2C
_0806D46C:
	ldr r0, [r7]
	bl sub_806DA3C
_0806D472:
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_806D47C
sub_806D47C: @ 0x0806D47C
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r1, [r7]
	ldr r0, [r1, #0x34]
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, [r7]
	ldr r1, [r0, #0x30]
	adds r0, r1, #0
	bl EndSpriteAnim
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0

	thumb_func_start EndAllMus
EndAllMus: @ 0x0806D4A4
	push {r7, lr}
	mov r7, sp
	ldr r1, _0806D4B8 @ =gUnk_08D64F4C
	adds r0, r1, #0
	bl Proc_EndEach
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806D4B8: .4byte gUnk_08D64F4C

	thumb_func_start sub_806D4BC
sub_806D4BC: @ 0x0806D4BC
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, [r7]
	bl sub_806D4D4
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_806D4D4
sub_806D4D4: @ 0x0806D4D4
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, [r7]
	bl Proc_End
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_806D4EC
sub_806D4EC: @ 0x0806D4EC
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, [r7]
	bl sub_806CAE8
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x3f
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #1
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start LockMus
LockMus: @ 0x0806D51C
	push {r7, lr}
	mov r7, sp
	movs r0, #4
	bl sub_80046C4
	pop {r7}
	pop {r0}
	bx r0

	thumb_func_start ReleaseMus
ReleaseMus: @ 0x0806D52C
	push {r7, lr}
	mov r7, sp
	movs r0, #4
	bl Proc_UnblockEachMarked
	pop {r7}
	pop {r0}
	bx r0

	thumb_func_start ApplyMoveScriptToCoordinates
ApplyMoveScriptToCoordinates: @ 0x0806D53C
	push {r7, lr}
	sub sp, #0xc
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	str r2, [r7, #8]
_0806D548:
	b _0806D54C
_0806D54A:
	b _0806D5E2
_0806D54C:
	adds r0, r7, #0
	adds r0, #8
	ldr r2, [r0]
	ldrb r3, [r2]
	adds r1, r3, #1
	adds r2, #1
	str r2, [r0]
	cmp r1, #0xa
	bhi _0806D5DE
	adds r0, r1, #0
	lsls r1, r0, #2
	ldr r2, _0806D56C @ =_0806D570
	adds r0, r1, r2
	ldr r1, [r0]
	mov pc, r1
	.align 2, 0
_0806D56C: .4byte _0806D570
_0806D570: @ jump table
	.4byte _0806D59C @ case 0
	.4byte _0806D59E @ case 1
	.4byte _0806D5AC @ case 2
	.4byte _0806D5C8 @ case 3
	.4byte _0806D5BA @ case 4
	.4byte _0806D59C @ case 5
	.4byte _0806D5DE @ case 6
	.4byte _0806D5DE @ case 7
	.4byte _0806D5DE @ case 8
	.4byte _0806D5DE @ case 9
	.4byte _0806D5D6 @ case 10
_0806D59C:
	b _0806D5E2
_0806D59E:
	ldr r1, [r7]
	ldr r0, [r7]
	ldr r1, [r7]
	ldr r2, [r1]
	subs r1, r2, #1
	str r1, [r0]
	b _0806D5E0
_0806D5AC:
	ldr r1, [r7]
	ldr r0, [r7]
	ldr r1, [r7]
	ldr r2, [r1]
	adds r1, r2, #1
	str r1, [r0]
	b _0806D5E0
_0806D5BA:
	ldr r1, [r7, #4]
	ldr r0, [r7, #4]
	ldr r1, [r7, #4]
	ldr r2, [r1]
	subs r1, r2, #1
	str r1, [r0]
	b _0806D5E0
_0806D5C8:
	ldr r1, [r7, #4]
	ldr r0, [r7, #4]
	ldr r1, [r7, #4]
	ldr r2, [r1]
	adds r1, r2, #1
	str r1, [r0]
	b _0806D5E0
_0806D5D6:
	ldr r0, [r7, #8]
	adds r1, r0, #1
	str r1, [r7, #8]
	b _0806D5E0
_0806D5DE:
	b _0806D5E0
_0806D5E0:
	b _0806D548
_0806D5E2:
	add sp, #0xc
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start CanStartMu
CanStartMu: @ 0x0806D5EC
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	movs r0, #0
	str r0, [r7]
_0806D5F6:
	ldr r0, [r7]
	cmp r0, #3
	ble _0806D5FE
	b _0806D620
_0806D5FE:
	ldr r0, _0806D614 @ =0x030014E8
	ldr r1, [r7]
	movs r2, #0x4c
	muls r1, r2, r1
	adds r0, r0, r1
	ldrb r1, [r0]
	cmp r1, #0
	bne _0806D618
	movs r0, #1
	b _0806D624
	.align 2, 0
_0806D614: .4byte 0x030014E8
_0806D618:
	ldr r0, [r7]
	adds r1, r0, #1
	str r1, [r7]
	b _0806D5F6
_0806D620:
	movs r0, #0
	b _0806D624
_0806D624:
	add sp, #4
	pop {r7}
	pop {r1}
	bx r1

	thumb_func_start ResetMuAnims
ResetMuAnims: @ 0x0806D62C
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	movs r0, #0
	str r0, [r7]
_0806D636:
	ldr r0, [r7]
	cmp r0, #3
	ble _0806D63E
	b _0806D698
_0806D63E:
	ldr r0, _0806D694 @ =0x030014E8
	ldr r1, [r7]
	movs r2, #0x4c
	muls r1, r2, r1
	adds r0, r0, r1
	ldrb r1, [r0]
	cmp r1, #0
	beq _0806D68C
	ldr r0, _0806D694 @ =0x030014E8
	ldr r1, [r7]
	movs r2, #0x4c
	muls r1, r2, r1
	adds r0, #0x48
	adds r1, r0, r1
	ldr r2, [r1]
	ldr r0, [r2, #0x30]
	ldrh r1, [r0, #0x18]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strh r2, [r0, #0x18]
	ldr r0, _0806D694 @ =0x030014E8
	ldr r1, [r7]
	movs r2, #0x4c
	muls r1, r2, r1
	adds r0, #0x48
	adds r1, r0, r1
	ldr r2, [r1]
	ldr r0, [r2, #0x30]
	ldrh r1, [r0, #0x1a]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x80
	lsls r3, r3, #1
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strh r2, [r0, #0x1a]
_0806D68C:
	ldr r0, [r7]
	adds r1, r0, #1
	str r1, [r7]
	b _0806D636
	.align 2, 0
_0806D694: .4byte 0x030014E8
_0806D698:
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0

	thumb_func_start sub_806D6A0
sub_806D6A0: @ 0x0806D6A0
	push {r4, r7, lr}
	sub sp, #0xc
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	movs r0, #0
	str r0, [r7, #8]
_0806D6AE:
	ldr r0, [r7, #8]
	cmp r0, #3
	ble _0806D6B6
	b _0806D738
_0806D6B6:
	ldr r0, _0806D728 @ =0x030014E8
	ldr r1, [r7, #8]
	movs r2, #0x4c
	muls r1, r2, r1
	adds r0, r0, r1
	ldrb r1, [r0]
	cmp r1, #0
	bne _0806D730
	ldr r0, _0806D728 @ =0x030014E8
	ldr r1, [r7, #8]
	movs r2, #0x4c
	muls r1, r2, r1
	adds r0, r0, r1
	ldr r1, [r7, #8]
	adds r2, r1, #0
	adds r1, r2, #1
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0]
	ldr r0, _0806D728 @ =0x030014E8
	ldr r1, [r7, #8]
	movs r2, #0x4c
	muls r1, r2, r1
	adds r0, r0, r1
	ldr r2, [r7]
	adds r1, r2, #0
	ldr r2, _0806D72C @ =gUnk_08D64F6C
	ldr r3, [r7, #8]
	adds r4, r3, #0
	lsls r3, r4, #1
	adds r2, r2, r3
	ldrh r3, [r2]
	adds r1, r1, r3
	ldrh r2, [r0, #2]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0, #2]
	ldr r0, [r7, #4]
	ldr r1, [r7, #8]
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, [r7, #8]
	movs r1, #0x4c
	muls r0, r1, r0
	ldr r2, _0806D728 @ =0x030014E8
	adds r1, r0, r2
	adds r0, r1, #0
	b _0806D73C
	.align 2, 0
_0806D728: .4byte 0x030014E8
_0806D72C: .4byte gUnk_08D64F6C
_0806D730:
	ldr r0, [r7, #8]
	adds r1, r0, #1
	str r1, [r7, #8]
	b _0806D6AE
_0806D738:
	movs r0, #0
	b _0806D73C
_0806D73C:
	add sp, #0xc
	pop {r4, r7}
	pop {r1}
	bx r1

	thumb_func_start sub_806D744
sub_806D744: @ 0x0806D744
	push {r4, r7, lr}
	sub sp, #0xc
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	movs r0, #0
	str r0, [r7, #8]
_0806D752:
	ldr r0, [r7, #8]
	cmp r0, #3
	ble _0806D75A
	b _0806D7DC
_0806D75A:
	ldr r0, _0806D7CC @ =0x030014E8
	ldr r1, [r7, #8]
	movs r2, #0x4c
	muls r1, r2, r1
	adds r0, r0, r1
	ldrb r1, [r0]
	cmp r1, #0
	bne _0806D7D4
	ldr r0, _0806D7CC @ =0x030014E8
	ldr r1, [r7, #8]
	movs r2, #0x4c
	muls r1, r2, r1
	adds r0, r0, r1
	ldr r1, [r7, #8]
	adds r2, r1, #0
	adds r1, r2, #1
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0]
	ldr r0, _0806D7CC @ =0x030014E8
	ldr r1, [r7, #8]
	movs r2, #0x4c
	muls r1, r2, r1
	adds r0, r0, r1
	ldr r2, [r7]
	adds r1, r2, #0
	ldr r2, _0806D7D0 @ =gUnk_08D64F74
	ldr r3, [r7, #8]
	adds r4, r3, #0
	lsls r3, r4, #1
	adds r2, r2, r3
	ldrh r3, [r2]
	adds r1, r1, r3
	ldrh r2, [r0, #2]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0, #2]
	ldr r0, [r7, #4]
	ldr r1, [r7, #8]
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, [r7, #8]
	movs r1, #0x4c
	muls r0, r1, r0
	ldr r2, _0806D7CC @ =0x030014E8
	adds r1, r0, r2
	adds r0, r1, #0
	b _0806D7E0
	.align 2, 0
_0806D7CC: .4byte 0x030014E8
_0806D7D0: .4byte gUnk_08D64F74
_0806D7D4:
	ldr r0, [r7, #8]
	adds r1, r0, #1
	str r1, [r7, #8]
	b _0806D752
_0806D7DC:
	movs r0, #0
	b _0806D7E0
_0806D7E0:
	add sp, #0xc
	pop {r4, r7}
	pop {r1}
	bx r1

	thumb_func_start sub_806D7E8
sub_806D7E8: @ 0x0806D7E8
	push {r4, r7, lr}
	sub sp, #0xc
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x3f
	ldrb r0, [r1]
	cmp r0, #6
	beq _0806D800
	b _0806D858
_0806D800:
	ldr r0, [r7, #4]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x4c
	movs r3, #0
	ldrsh r1, [r2, r3]
	ldr r3, [r7]
	adds r2, r3, #0
	adds r3, #0x50
	movs r4, #0
	ldrsh r2, [r3, r4]
	adds r3, r1, r2
	asrs r1, r3, #4
	ldrh r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0]
	ldr r0, [r7, #4]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x4e
	movs r3, #0
	ldrsh r1, [r2, r3]
	ldr r3, [r7]
	adds r2, r3, #0
	adds r3, #0x52
	movs r4, #0
	ldrsh r2, [r3, r4]
	adds r3, r1, r2
	asrs r1, r3, #4
	ldrh r2, [r0, #2]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0, #2]
	movs r0, #1
	b _0806D92C
_0806D858:
	adds r0, r7, #0
	adds r0, #8
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x4c
	movs r3, #0
	ldrsh r1, [r2, r3]
	ldr r3, [r7]
	adds r2, r3, #0
	adds r3, #0x50
	movs r4, #0
	ldrsh r2, [r3, r4]
	adds r1, r1, r2
	asrs r2, r1, #4
	ldr r1, _0806D920 @ =gBmSt
	ldrh r1, [r1, #0xc]
	subs r2, r2, r1
	adds r1, r2, #0
	adds r2, r1, #0
	adds r2, #8
	adds r1, r2, #0
	strh r1, [r0]
	adds r0, r7, #0
	adds r0, #0xa
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x4e
	movs r3, #0
	ldrsh r1, [r2, r3]
	ldr r3, [r7]
	adds r2, r3, #0
	adds r3, #0x52
	movs r4, #0
	ldrsh r2, [r3, r4]
	adds r1, r1, r2
	asrs r2, r1, #4
	ldr r1, _0806D920 @ =gBmSt
	ldrh r1, [r1, #0xe]
	subs r2, r2, r1
	adds r1, r2, #0
	adds r2, r1, #0
	adds r2, #8
	adds r1, r2, #0
	strh r1, [r0]
	ldr r0, [r7, #4]
	adds r1, r7, #0
	adds r1, #8
	ldrh r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	ldrh r1, [r1]
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0]
	ldr r0, [r7, #4]
	adds r1, r7, #0
	adds r1, #0xa
	ldrh r2, [r1]
	adds r1, r2, #0
	adds r1, #8
	ldrh r2, [r0, #2]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0, #2]
	adds r0, r7, #0
	adds r0, #8
	movs r2, #0
	ldrsh r1, [r0, r2]
	movs r0, #0x10
	cmn r1, r0
	blt _0806D924
	adds r0, r7, #0
	adds r0, #8
	movs r3, #0
	ldrsh r1, [r0, r3]
	movs r0, #0x80
	lsls r0, r0, #1
	cmp r1, r0
	bgt _0806D924
	adds r0, r7, #0
	adds r0, #0xa
	movs r4, #0
	ldrsh r1, [r0, r4]
	movs r0, #0x10
	cmn r1, r0
	blt _0806D924
	adds r0, r7, #0
	adds r0, #0xa
	movs r2, #0
	ldrsh r1, [r0, r2]
	cmp r1, #0xb0
	bgt _0806D924
	b _0806D928
	.align 2, 0
_0806D920: .4byte gBmSt
_0806D924:
	movs r0, #0
	b _0806D92C
_0806D928:
	movs r0, #1
	b _0806D92C
_0806D92C:
	add sp, #0xc
	pop {r4, r7}
	pop {r1}
	bx r1

	thumb_func_start sub_806D934
sub_806D934: @ 0x0806D934
	push {r4, r5, r6, r7, lr}
	sub sp, #0x10
	add r7, sp, #8
	str r0, [r7]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x40
	ldrb r0, [r1]
	cmp r0, #0
	beq _0806D94A
	b _0806DA30
_0806D94A:
	adds r1, r7, #4
	ldr r0, [r7]
	bl sub_806D7E8
	lsls r1, r0, #0x18
	asrs r0, r1, #0x18
	cmp r0, #0
	bne _0806D95C
	b _0806DA30
_0806D95C:
	adds r0, r7, #4
	ldrh r1, [r0]
	lsls r0, r1, #0x17
	lsrs r1, r0, #0x17
	adds r0, r7, #4
	ldrh r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0]
	adds r0, r7, #6
	ldrh r1, [r0]
	movs r0, #0xff
	ands r1, r0
	adds r0, r7, #6
	ldrh r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x3f
	ldrb r0, [r1]
	cmp r0, #7
	bne _0806D9B8
	adds r0, r7, #6
	ldrh r1, [r0]
	movs r0, #0x80
	lsls r0, r0, #3
	orrs r1, r0
	adds r0, r7, #6
	ldrh r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0]
_0806D9B8:
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x3c
	ldrb r0, [r1]
	ldr r1, [r7]
	ldr r2, [r1, #0x38]
	adds r1, r2, #0
	bl sub_8025A6C
	ldr r0, [r7]
	ldr r1, [r0, #0x30]
	ldrh r0, [r1, #0x1e]
	adds r1, r7, #4
	movs r3, #0
	ldrsh r2, [r1, r3]
	adds r1, r2, #0
	subs r1, #8
	adds r2, r7, #6
	movs r4, #0
	ldrsh r3, [r2, r4]
	adds r2, r3, #0
	subs r2, #0x10
	ldr r3, [r7]
	ldr r4, [r3, #0x38]
	ldr r5, _0806DA38 @ =0xF9FF0000
	adds r3, r4, r5
	lsls r5, r3, #0xf
	lsrs r4, r5, #0xf
	lsrs r3, r4, #5
	ldr r4, [r7]
	ldr r5, [r4, #0x34]
	ldrb r4, [r5, #1]
	movs r5, #0xf
	ands r4, r5
	adds r6, r4, #0
	lsls r5, r6, #0x18
	lsrs r4, r5, #0x18
	adds r5, r4, #0
	lsls r4, r5, #0xc
	adds r3, r3, r4
	ldr r5, [r7]
	adds r4, r5, #0
	adds r5, #0x46
	ldrh r4, [r5]
	adds r3, r3, r4
	adds r5, r3, #0
	lsls r4, r5, #0x10
	lsrs r3, r4, #0x10
	ldr r5, [r7]
	adds r4, r5, #0
	adds r5, #0x41
	ldrb r4, [r5]
	str r4, [sp]
	ldr r5, [r7]
	adds r4, r5, #0
	adds r5, #0x3c
	ldrb r4, [r5]
	str r4, [sp, #4]
	bl sub_8026794
_0806DA30:
	add sp, #0x10
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806DA38: .4byte 0xF9FF0000

	thumb_func_start sub_806DA3C
sub_806DA3C: @ 0x0806DA3C
	push {r4, r7, lr}
	sub sp, #8
	mov r7, sp
	str r0, [r7]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x40
	ldrb r0, [r1]
	cmp r0, #0
	beq _0806DA52
	b _0806DB64
_0806DA52:
	adds r1, r7, #4
	ldr r0, [r7]
	bl sub_806D7E8
	lsls r1, r0, #0x18
	asrs r0, r1, #0x18
	cmp r0, #0
	bne _0806DA64
	b _0806DB64
_0806DA64:
	adds r0, r7, #4
	ldrh r1, [r0]
	lsls r0, r1, #0x17
	lsrs r1, r0, #0x17
	adds r0, r7, #4
	ldrh r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0]
	adds r0, r7, #6
	ldrh r1, [r0]
	movs r0, #0xff
	ands r1, r0
	adds r0, r7, #6
	ldrh r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x3f
	ldrb r0, [r1]
	cmp r0, #6
	beq _0806DAA6
	b _0806DAA8
_0806DAA6:
	b _0806DB28
_0806DAA8:
	ldr r0, [r7]
	ldr r1, [r0, #0x2c]
	cmp r1, #0
	bne _0806DAB2
	b _0806DB28
_0806DAB2:
	ldr r0, [r7]
	ldr r1, [r0, #0x2c]
	movs r0, #0xb
	ldrsb r0, [r1, r0]
	movs r1, #0xc0
	ands r0, r1
	cmp r0, #0x80
	beq _0806DAC4
	b _0806DB28
_0806DAC4:
	ldr r0, _0806DB20 @ =gPlaySt
	ldrb r1, [r0, #0xd]
	cmp r1, #0
	beq _0806DB28
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x4e
	movs r2, #0
	ldrsh r0, [r1, r2]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x52
	movs r3, #0
	ldrsh r1, [r2, r3]
	adds r0, r0, r1
	asrs r1, r0, #4
	adds r0, r1, #0
	adds r0, #8
	asrs r1, r0, #4
	adds r2, r1, #0
	lsls r0, r2, #2
	ldr r2, _0806DB24 @ =0x0202E3E8
	ldr r1, [r2]
	adds r0, r0, r1
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x4c
	movs r4, #0
	ldrsh r1, [r2, r4]
	ldr r3, [r7]
	adds r2, r3, #0
	adds r3, #0x50
	movs r4, #0
	ldrsh r2, [r3, r4]
	adds r1, r1, r2
	asrs r2, r1, #4
	adds r1, r2, #0
	adds r1, #8
	asrs r2, r1, #4
	ldr r1, [r0]
	adds r0, r2, r1
	ldrb r1, [r0]
	cmp r1, #0
	bne _0806DB28
	b _0806DB64
	.align 2, 0
_0806DB20: .4byte gPlaySt
_0806DB24: .4byte 0x0202E3E8
_0806DB28:
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x3f
	ldrb r0, [r1]
	cmp r0, #7
	bne _0806DB50
	adds r0, r7, #6
	ldrh r1, [r0]
	movs r0, #0x80
	lsls r0, r0, #3
	orrs r1, r0
	adds r0, r7, #6
	ldrh r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0]
_0806DB50:
	ldr r1, [r7]
	ldr r0, [r1, #0x30]
	adds r2, r7, #4
	movs r3, #0
	ldrsh r1, [r2, r3]
	adds r3, r7, #6
	movs r4, #0
	ldrsh r2, [r3, r4]
	bl DisplaySpriteAnim
_0806DB64:
	add sp, #8
	pop {r4, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_806DB6C
sub_806DB6C: @ 0x0806DB6C
	push {r7, lr}
	sub sp, #0xc
	mov r7, sp
	str r0, [r7]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x4a
	movs r2, #0
	ldrsh r0, [r1, r2]
	str r0, [r7, #4]
	ldr r0, [r7, #4]
	movs r1, #0x80
	ands r0, r1
	cmp r0, #0
	beq _0806DB92
	ldr r0, [r7, #4]
	adds r1, r0, #0
	adds r1, #0x80
	str r1, [r7, #4]
_0806DB92:
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x44
	ldrb r0, [r1]
	cmp r0, #0
	beq _0806DBA4
	movs r0, #0x80
	lsls r0, r0, #1
	b _0806DCAE
_0806DBA4:
	ldr r0, [r7, #4]
	cmp r0, #0x40
	bne _0806DBD4
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x41
	ldrb r2, [r1]
	adds r0, r2, #0
	bl GetClassData
	ldr r1, _0806DBD0 @ =gUnk_08D64F7C
	ldrb r0, [r0, #7]
	adds r1, r1, r0
	ldrb r2, [r1]
	adds r0, r2, #0
	lsls r1, r0, #4
	adds r2, r1, #0
	lsls r0, r2, #0x10
	lsrs r1, r0, #0x10
	adds r0, r1, #0
	b _0806DCAE
	.align 2, 0
_0806DBD0: .4byte gUnk_08D64F7C
_0806DBD4:
	ldr r0, [r7, #4]
	cmp r0, #0
	beq _0806DC44
	ldr r0, [r7, #4]
	str r0, [r7, #8]
	ldr r0, [r7, #8]
	movs r1, #0x40
	ands r0, r1
	cmp r0, #0
	beq _0806DBF2
	ldr r0, [r7, #8]
	movs r1, #0x40
	eors r0, r1
	str r0, [r7, #8]
	b _0806DC2E
_0806DBF2:
	ldr r1, _0806DC20 @ =gPlaySt
	adds r0, r1, #0
	adds r1, #0x40
	ldrb r0, [r1]
	lsls r1, r0, #0x18
	lsrs r0, r1, #0x1f
	cmp r0, #0
	bne _0806DC28
	ldr r1, _0806DC24 @ =gpKeySt
	ldr r0, [r1]
	ldrh r1, [r0, #4]
	movs r2, #1
	adds r0, r1, #0
	ands r0, r2
	adds r2, r0, #0
	lsls r1, r2, #0x10
	lsrs r0, r1, #0x10
	cmp r0, #0
	beq _0806DC1E
	ldr r0, [r7, #4]
	lsls r1, r0, #2
	str r1, [r7, #8]
_0806DC1E:
	b _0806DC2E
	.align 2, 0
_0806DC20: .4byte gPlaySt
_0806DC24: .4byte gpKeySt
_0806DC28:
	ldr r0, [r7, #4]
	lsls r1, r0, #2
	str r1, [r7, #8]
_0806DC2E:
	ldr r0, [r7, #8]
	cmp r0, #0x80
	ble _0806DC38
	movs r0, #0x80
	str r0, [r7, #8]
_0806DC38:
	ldr r1, [r7, #8]
	adds r0, r1, #0
	lsls r2, r0, #0x10
	lsrs r1, r2, #0x10
	adds r0, r1, #0
	b _0806DCAE
_0806DC44:
	bl IsFirstPlaythrough
	cmp r0, #0
	bne _0806DC6C
	ldr r1, _0806DC68 @ =gpKeySt
	ldr r0, [r1]
	ldrh r1, [r0, #4]
	movs r2, #1
	adds r0, r1, #0
	ands r0, r2
	adds r2, r0, #0
	lsls r1, r2, #0x10
	lsrs r0, r1, #0x10
	cmp r0, #0
	beq _0806DC6C
	movs r0, #0x80
	b _0806DCAE
	.align 2, 0
_0806DC68: .4byte gpKeySt
_0806DC6C:
	ldr r1, _0806DCA0 @ =gPlaySt
	adds r0, r1, #0
	adds r1, #0x40
	ldrb r0, [r1]
	lsls r1, r0, #0x18
	lsrs r0, r1, #0x1f
	cmp r0, #0
	bne _0806DCAA
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x41
	ldrb r2, [r1]
	adds r0, r2, #0
	bl GetClassData
	ldr r1, _0806DCA4 @ =gUnk_08D64F7C
	ldrb r0, [r0, #7]
	adds r1, r1, r0
	ldrb r2, [r1]
	adds r0, r2, #0
	lsls r1, r0, #4
	adds r2, r1, #0
	lsls r0, r2, #0x10
	lsrs r1, r0, #0x10
	adds r0, r1, #0
	b _0806DCAE
	.align 2, 0
_0806DCA0: .4byte gPlaySt
_0806DCA4: .4byte gUnk_08D64F7C
_0806DCA8:
	b _0806DCAE
_0806DCAA:
	movs r0, #0x40
	b _0806DCAE
_0806DCAE:
	add sp, #0xc
	pop {r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_806DCB8
sub_806DCB8: @ 0x0806DCB8
	push {r7, lr}
	sub sp, #8
	mov r7, sp
	str r0, [r7]
	adds r0, r1, #0
	adds r1, r7, #4
	strh r0, [r1]
	adds r0, r7, #4
	ldrh r1, [r0]
	movs r0, #0x80
	lsls r0, r0, #1
	cmp r1, r0
	bls _0806DCEE
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x4a
	ldrh r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x80
	lsls r3, r3, #1
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strh r2, [r0]
	b _0806DD08
_0806DCEE:
	ldr r0, [r7]
	adds r1, r7, #4
	adds r2, r0, #0
	adds r0, #0x4a
	ldrh r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	ldrh r1, [r1]
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0]
_0806DD08:
	add sp, #8
	pop {r7}
	pop {r0}
	bx r0

	thumb_func_start sub_806DD10
sub_806DD10: @ 0x0806DD10
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, _0806DD30 @ =gUnk_08D64F7E
	ldr r1, [r7]
	adds r2, r0, r1
	ldrb r0, [r2]
	adds r2, r0, #0
	lsls r1, r2, #4
	adds r1, r1, r0
	lsls r0, r1, #9
	ldr r2, _0806DD34 @ =0x020040F0
	adds r1, r0, r2
	adds r0, r1, #0
	b _0806DD38
	.align 2, 0
_0806DD30: .4byte gUnk_08D64F7E
_0806DD34: .4byte 0x020040F0
_0806DD38:
	add sp, #4
	pop {r7}
	pop {r1}
	bx r1

	thumb_func_start sub_806DD40
sub_806DD40: @ 0x0806DD40
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, _0806DD60 @ =gUnk_08D650B4
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x41
	ldrb r1, [r2]
	subs r2, r1, #1
	adds r1, r2, #0
	lsls r2, r1, #3
	adds r0, r0, r2
	ldr r1, [r0]
	adds r0, r1, #0
	b _0806DD64
	.align 2, 0
_0806DD60: .4byte gUnk_08D650B4
_0806DD64:
	add sp, #4
	pop {r7}
	pop {r1}
	bx r1

	thumb_func_start sub_806DD6C
sub_806DD6C: @ 0x0806DD6C
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	adds r1, r7, #0
	strh r0, [r1]
	ldr r0, _0806DD8C @ =gUnk_08D650B4
	adds r1, r7, #0
	ldrh r2, [r1]
	subs r1, r2, #1
	adds r2, r1, #0
	lsls r1, r2, #3
	adds r0, #4
	adds r1, r0, r1
	ldr r2, [r1]
	adds r0, r2, #0
	b _0806DD90
	.align 2, 0
_0806DD8C: .4byte gUnk_08D650B4
_0806DD90:
	add sp, #4
	pop {r7}
	pop {r1}
	bx r1

	thumb_func_start sub_806DD98
sub_806DD98: @ 0x0806DD98
	push {r7, lr}
	sub sp, #8
	mov r7, sp
	str r0, [r7]
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x3f
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #7
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	ldr r1, _0806DEB8 @ =gUnk_08D64F84
	adds r0, r1, #0
	ldr r1, [r7]
	bl Proc_Start
	str r0, [r7, #4]
	ldr r0, [r7, #4]
	ldr r1, [r7]
	str r1, [r0, #0x54]
	ldr r0, [r7, #4]
	adds r1, r0, #0
	adds r0, #0x64
	ldrh r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x20
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strh r2, [r0]
	ldr r0, _0806DEBC @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x3c
	ldrb r1, [r0]
	movs r2, #0x3f
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _0806DEBC @ =gDispIo
	ldr r2, [r7, #4]
	adds r1, r2, #0
	adds r2, #0x64
	movs r3, #0
	ldrsh r1, [r2, r3]
	asrs r2, r1, #1
	adds r1, r2, #0
	adds r2, r0, #0
	adds r0, #0x44
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _0806DEBC @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x45
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x10
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _0806DEBC @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x46
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r1, [r7]
	ldr r0, [r1, #0x30]
	ldrh r1, [r0, #0x18]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strh r2, [r0, #0x18]
	ldr r1, [r7]
	ldr r0, [r1, #0x30]
	ldrh r1, [r0, #0x1a]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strh r2, [r0, #0x1a]
	ldr r0, [r7]
	movs r1, #0
	bl sub_806E840
	ldr r1, [r7]
	ldr r0, [r1, #0x30]
	ldrh r1, [r0, #0x1e]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0xd
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strh r2, [r0, #0x1e]
	ldr r1, _0806DEC0 @ =gPlaySt
	adds r0, r1, #0
	adds r1, #0x41
	ldrb r0, [r1]
	lsls r1, r0, #0x1e
	lsrs r0, r1, #0x1f
	cmp r0, #0
	bne _0806DE8C
	movs r0, #0xd6
	bl m4aSongNumStart
_0806DE8C:
	ldr r0, [r7]
	ldr r1, [r0, #0x2c]
	ldr r0, [r1, #0xc]
	movs r1, #0x80
	lsls r1, r1, #4
	ands r0, r1
	cmp r0, #0
	beq _0806DEB0
	ldr r0, [r7]
	ldr r1, [r0, #0x2c]
	adds r0, r1, #0
	bl sub_8034C80
	ldr r0, [r7]
	ldr r1, [r0, #0x2c]
	adds r0, r1, #0
	bl HideUnitSprite
_0806DEB0:
	add sp, #8
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806DEB8: .4byte gUnk_08D64F84
_0806DEBC: .4byte gDispIo
_0806DEC0: .4byte gPlaySt

	thumb_func_start sub_806DEC4
sub_806DEC4: @ 0x0806DEC4
	push {r4, r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, _0806DF54 @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x3c
	ldrb r1, [r0]
	movs r2, #0x3f
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _0806DF54 @ =gDispIo
	ldr r1, [r7]
	adds r2, r1, #0
	adds r1, #0x64
	ldrh r2, [r1]
	subs r3, r2, #1
	adds r4, r3, #0
	strh r4, [r1]
	lsls r2, r2, #0x10
	asrs r1, r2, #0x10
	asrs r2, r1, #1
	adds r1, r2, #0
	adds r2, r0, #0
	adds r0, #0x44
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _0806DF54 @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x45
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x10
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _0806DF54 @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x46
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x64
	movs r2, #0
	ldrsh r0, [r1, r2]
	cmp r0, #0
	bne _0806DF4C
	ldr r0, [r7]
	ldr r1, [r0, #0x54]
	adds r0, r1, #0
	bl sub_806D4BC
	ldr r0, [r7]
	bl Proc_Break
_0806DF4C:
	add sp, #4
	pop {r4, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806DF54: .4byte gDispIo

	thumb_func_start sub_806DF58
sub_806DF58: @ 0x0806DF58
	push {r4, r7, lr}
	sub sp, #8
	mov r7, sp
	str r0, [r7]
	ldr r0, [r7]
	ldr r1, [r0, #0x14]
	str r1, [r7, #4]
	ldr r1, [r7, #4]
	movs r0, #0
	ldr r3, [r7]
	adds r2, r3, #0
	adds r3, #0x64
	ldrh r2, [r3]
	movs r3, #7
	ands r2, r3
	adds r4, r2, #0
	lsls r3, r4, #0x10
	asrs r2, r3, #0x10
	cmp r2, #3
	bgt _0806DF82
	movs r0, #1
_0806DF82:
	adds r2, r1, #0
	adds r1, #0x40
	ldrb r2, [r1]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	orrs r0, r3
	adds r2, r0, #0
	strb r2, [r1]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x64
	ldr r0, [r7]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x64
	ldrh r3, [r2]
	subs r1, r3, #1
	adds r2, r0, #0
	adds r0, #0x64
	ldrh r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x64
	movs r2, #0
	ldrsh r0, [r1, r2]
	cmp r0, #0
	bge _0806DFE6
	ldr r0, [r7]
	bl Proc_Break
	ldr r0, [r7, #4]
	adds r1, r0, #0
	adds r0, #0x40
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #1
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
_0806DFE6:
	add sp, #8
	pop {r4, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_806DFF0
sub_806DFF0: @ 0x0806DFF0
	push {r7, lr}
	sub sp, #8
	mov r7, sp
	str r0, [r7]
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x3f
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #7
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	ldr r1, _0806E074 @ =gUnk_08D64F9C
	adds r0, r1, #0
	ldr r1, [r7]
	bl Proc_Start
	str r0, [r7, #4]
	ldr r0, [r7, #4]
	ldr r1, [r7]
	str r1, [r0, #0x54]
	ldr r0, [r7, #4]
	adds r1, r0, #0
	adds r0, #0x64
	ldrh r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x40
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strh r2, [r0]
	ldr r1, [r7]
	ldr r0, [r1, #0x30]
	ldrh r1, [r0, #0x18]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strh r2, [r0, #0x18]
	ldr r1, [r7]
	ldr r0, [r1, #0x30]
	ldrh r1, [r0, #0x1a]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strh r2, [r0, #0x1a]
	ldr r1, _0806E078 @ =gPlaySt
	adds r0, r1, #0
	adds r1, #0x41
	ldrb r0, [r1]
	lsls r1, r0, #0x1e
	lsrs r0, r1, #0x1f
	cmp r0, #0
	bne _0806E06C
	movs r0, #0xd6
	bl m4aSongNumStart
_0806E06C:
	add sp, #8
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806E074: .4byte gUnk_08D64F9C
_0806E078: .4byte gPlaySt

	thumb_func_start sub_806E07C
sub_806E07C: @ 0x0806E07C
	push {r7, lr}
	sub sp, #0x1c
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	ldr r0, _0806E0E4 @ =gUnk_08D64FAC
	ldr r1, [r7, #4]
	adds r0, r0, r1
	ldrb r1, [r0]
	movs r2, #7
	adds r0, r1, #0
	ands r0, r2
	adds r2, r0, #0
	lsls r1, r2, #0x18
	lsrs r0, r1, #0x18
	str r0, [r7, #0x10]
	ldr r0, _0806E0E4 @ =gUnk_08D64FAC
	ldr r1, [r7, #4]
	adds r0, r0, r1
	ldrb r1, [r0]
	lsrs r0, r1, #3
	adds r2, r0, #0
	lsls r1, r2, #0x18
	lsrs r0, r1, #0x18
	str r0, [r7, #0x14]
	ldr r0, _0806E0E8 @ =0x030014E0
	movs r1, #1
	rsbs r1, r1, #0
	str r1, [r0]
	ldr r0, _0806E0EC @ =0x030014E4
	ldr r1, [r7, #0x10]
	adds r2, r1, #0
	lsls r1, r2, #2
	movs r2, #0xf
	adds r3, r2, #0
	lsls r3, r1
	adds r1, r3, #0
	str r1, [r0]
	ldr r0, _0806E0E8 @ =0x030014E0
	ldr r1, _0806E0E8 @ =0x030014E0
	ldr r2, _0806E0EC @ =0x030014E4
	ldr r3, [r2]
	mvns r2, r3
	ldr r1, [r1]
	ands r2, r1
	str r2, [r0]
	movs r0, #0
	str r0, [r7, #8]
_0806E0DC:
	ldr r0, [r7, #8]
	cmp r0, #3
	ble _0806E0F0
	b _0806E14A
	.align 2, 0
_0806E0E4: .4byte gUnk_08D64FAC
_0806E0E8: .4byte 0x030014E0
_0806E0EC: .4byte 0x030014E4
_0806E0F0:
	movs r0, #0
	str r0, [r7, #0xc]
_0806E0F4:
	ldr r0, [r7, #0xc]
	cmp r0, #3
	ble _0806E0FC
	b _0806E138
_0806E0FC:
	ldr r0, [r7, #0x14]
	adds r1, r0, #0
	lsls r0, r1, #2
	ldr r1, [r7]
	adds r0, r0, r1
	ldr r1, [r0]
	str r1, [r7, #0x18]
	ldr r0, _0806E134 @ =0x030014E0
	ldr r1, [r7, #0x18]
	ldr r0, [r0]
	ands r1, r0
	str r1, [r7, #0x18]
	ldr r0, [r7, #0x14]
	adds r1, r0, #0
	lsls r0, r1, #2
	ldr r1, [r7]
	adds r0, r0, r1
	ldr r1, [r7, #0x18]
	str r1, [r0]
	ldr r0, [r7]
	adds r1, r0, #0
	adds r1, #0x20
	str r1, [r7]
	ldr r0, [r7, #0xc]
	adds r1, r0, #1
	str r1, [r7, #0xc]
	b _0806E0F4
	.align 2, 0
_0806E134: .4byte 0x030014E0
_0806E138:
	ldr r0, [r7]
	movs r2, #0xe0
	lsls r2, r2, #2
	adds r1, r0, r2
	str r1, [r7]
	ldr r0, [r7, #8]
	adds r1, r0, #1
	str r1, [r7, #8]
	b _0806E0DC
_0806E14A:
	add sp, #0x1c
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_806E154
sub_806E154: @ 0x0806E154
	push {r7, lr}
	sub sp, #8
	mov r7, sp
	str r0, [r7]
	ldr r0, [r7]
	ldr r1, [r0, #0x14]
	adds r0, r1, #0
	adds r1, #0x3c
	ldrb r2, [r1]
	adds r0, r2, #0
	bl sub_806DD10
	str r0, [r7, #4]
	ldr r0, [r7, #4]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x66
	movs r3, #0
	ldrsh r1, [r2, r3]
	bl sub_806E07C
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x66
	ldr r0, [r7]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x66
	ldrh r3, [r2]
	adds r1, r3, #1
	adds r2, r0, #0
	adds r0, #0x66
	ldrh r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0]
	ldr r0, _0806E1FC @ =0x020040F0
	ldr r1, _0806E200 @ =0x06017000
	movs r2, #0x80
	lsls r2, r2, #5
	bl RegisterDataMove
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x64
	ldr r0, [r7]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x64
	ldrh r3, [r2]
	subs r1, r3, #1
	adds r2, r0, #0
	adds r0, #0x64
	ldrh r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x64
	movs r2, #0
	ldrsh r0, [r1, r2]
	cmp r0, #0
	bne _0806E1F4
	ldr r0, [r7]
	ldr r1, [r0, #0x54]
	adds r0, r1, #0
	bl sub_806D4BC
	ldr r0, [r7]
	bl Proc_Break
_0806E1F4:
	add sp, #8
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806E1FC: .4byte 0x020040F0
_0806E200: .4byte 0x06017000

	thumb_func_start sub_806E204
sub_806E204: @ 0x0806E204
	push {r7, lr}
	sub sp, #8
	mov r7, sp
	str r0, [r7]
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x3f
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #7
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	ldr r1, _0806E298 @ =gUnk_08D64FEC
	adds r0, r1, #0
	ldr r1, [r7]
	bl Proc_Start
	str r0, [r7, #4]
	ldr r0, [r7, #4]
	ldr r1, [r7]
	str r1, [r0, #0x54]
	ldr r0, [r7, #4]
	adds r1, r0, #0
	adds r0, #0x64
	ldrh r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x40
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strh r2, [r0]
	ldr r0, [r7, #4]
	adds r1, r0, #0
	adds r0, #0x66
	ldrh r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strh r2, [r0]
	ldr r1, [r7]
	ldr r0, [r1, #0x30]
	ldrh r1, [r0, #0x18]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strh r2, [r0, #0x18]
	ldr r1, [r7]
	ldr r0, [r1, #0x30]
	ldrh r1, [r0, #0x1a]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strh r2, [r0, #0x1a]
	ldr r1, _0806E29C @ =gPlaySt
	adds r0, r1, #0
	adds r1, #0x41
	ldrb r0, [r1]
	lsls r1, r0, #0x1e
	lsrs r0, r1, #0x1f
	cmp r0, #0
	bne _0806E290
	movs r0, #0xd6
	bl m4aSongNumStart
_0806E290:
	add sp, #8
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806E298: .4byte gUnk_08D64FEC
_0806E29C: .4byte gPlaySt

	thumb_func_start sub_806E2A0
sub_806E2A0: @ 0x0806E2A0
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x40
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #1
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0

	thumb_func_start sub_806E2C8
sub_806E2C8: @ 0x0806E2C8
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x40
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0

	thumb_func_start SetMuScreenPosition
SetMuScreenPosition: @ 0x0806E2E8
	push {r7, lr}
	sub sp, #0xc
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	str r2, [r7, #8]
	ldr r0, [r7]
	ldr r1, [r7, #4]
	adds r2, r1, #0
	lsls r1, r2, #4
	adds r2, r0, #0
	adds r0, #0x4c
	ldrh r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0]
	ldr r0, [r7]
	ldr r1, [r7, #8]
	adds r2, r1, #0
	lsls r1, r2, #4
	adds r2, r0, #0
	adds r0, #0x4e
	ldrh r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0]
	add sp, #0xc
	pop {r7}
	pop {r0}
	bx r0

	thumb_func_start sub_806E334
sub_806E334: @ 0x0806E334
	push {r7, lr}
	sub sp, #0xc
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	str r2, [r7, #8]
	ldr r0, [r7]
	ldr r1, [r7, #4]
	adds r2, r1, #0
	lsls r1, r2, #4
	adds r2, r0, #0
	adds r0, #0x50
	ldrh r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0]
	ldr r0, [r7]
	ldr r1, [r7, #8]
	adds r2, r1, #0
	lsls r1, r2, #4
	adds r2, r0, #0
	adds r0, #0x52
	ldrh r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0]
	add sp, #0xc
	pop {r7}
	pop {r0}
	bx r0

	thumb_func_start sub_806E380
sub_806E380: @ 0x0806E380
	push {r4, r7, lr}
	sub sp, #8
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	ldr r1, [r7]
	ldr r0, [r1, #0x30]
	ldr r2, [r7]
	ldr r1, [r2, #0x34]
	ldr r3, [r7]
	adds r2, r3, #0
	adds r3, #0x46
	ldrh r2, [r3]
	movs r4, #0xa0
	lsls r4, r4, #7
	adds r3, r2, r4
	ldrh r1, [r1, #2]
	adds r2, r3, #0
	adds r1, r1, r2
	ldrh r2, [r0, #0x22]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0, #0x22]
	ldr r0, [r7]
	ldr r1, [r0, #0x34]
	ldrb r0, [r1, #1]
	adds r1, r0, #0
	adds r1, #0x10
	adds r0, r1, #0
	lsls r1, r0, #5
	asrs r0, r1, #1
	adds r1, r0, #0
	lsls r0, r1, #1
	ldr r1, _0806E3F8 @ =gPal
	adds r0, r0, r1
	movs r1, #0xa8
	lsls r1, r1, #2
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r0, _0806E3FC @ =gUnk_08D64D98
	ldr r1, [r7, #4]
	adds r2, r1, #0
	lsls r1, r2, #2
	adds r0, r0, r1
	ldr r1, [r0]
	adds r0, r1, #0
	movs r1, #0x15
	movs r2, #8
	ldr r3, [r7]
	bl StartPalFade
	add sp, #8
	pop {r4, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806E3F8: .4byte gPal
_0806E3FC: .4byte gUnk_08D64D98

	thumb_func_start sub_806E400
sub_806E400: @ 0x0806E400
	push {r7, lr}
	sub sp, #8
	mov r7, sp
	str r0, [r7]
	ldr r0, [r7]
	ldr r1, [r0, #0x34]
	ldrb r0, [r1, #1]
	adds r1, r0, #0
	adds r1, #0x10
	adds r0, r1, #0
	lsls r1, r0, #5
	asrs r0, r1, #1
	adds r1, r0, #0
	lsls r0, r1, #1
	ldr r2, _0806E448 @ =gPal
	adds r1, r0, r2
	adds r0, r1, #0
	movs r1, #0x15
	movs r2, #8
	ldr r3, [r7]
	bl StartPalFade
	ldr r1, _0806E44C @ =gUnk_08D64FFC
	adds r0, r1, #0
	movs r1, #3
	bl Proc_Start
	str r0, [r7, #4]
	ldr r0, [r7, #4]
	ldr r1, [r7]
	str r1, [r0, #0x54]
	add sp, #8
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806E448: .4byte gPal
_0806E44C: .4byte gUnk_08D64FFC

	thumb_func_start sub_806E450
sub_806E450: @ 0x0806E450
	push {r4, r7, lr}
	sub sp, #8
	mov r7, sp
	str r0, [r7]
	ldr r0, [r7]
	ldr r1, [r0, #0x54]
	str r1, [r7, #4]
	ldr r1, [r7, #4]
	ldr r0, [r1, #0x30]
	ldr r2, [r7, #4]
	ldr r1, [r2, #0x34]
	ldr r2, [r7, #4]
	ldr r3, [r2, #0x34]
	ldrb r2, [r3, #1]
	movs r3, #0xf
	ands r2, r3
	adds r4, r2, #0
	lsls r3, r4, #0x18
	lsrs r2, r3, #0x18
	adds r3, r2, #0
	lsls r2, r3, #0xc
	ldrh r1, [r1, #2]
	adds r1, r1, r2
	ldr r3, [r7, #4]
	adds r2, r3, #0
	adds r3, #0x46
	ldrh r2, [r3]
	adds r1, r1, r2
	ldrh r2, [r0, #0x22]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0, #0x22]
	add sp, #8
	pop {r4, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_806E4A0
sub_806E4A0: @ 0x0806E4A0
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, [r7]
	ldr r1, [r0, #0x30]
	adds r0, r1, #0
	movs r1, #4
	bl SetSpriteAnimId
	ldr r1, [r7]
	ldr r0, [r1, #0x30]
	ldrh r1, [r0, #0x18]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strh r2, [r0, #0x18]
	ldr r1, [r7]
	ldr r0, [r1, #0x30]
	ldrh r1, [r0, #0x1a]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x80
	lsls r3, r3, #1
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strh r2, [r0, #0x1a]
	ldr r0, _0806E4F0 @ =sub_806E4F4
	ldr r1, [r7]
	ldr r2, [r1, #0x30]
	adds r1, r2, #0
	movs r2, #0x1e
	bl sub_8014FCC
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806E4F0: .4byte sub_806E4F4

	thumb_func_start sub_806E4F4
sub_806E4F4: @ 0x0806E4F4
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, [r7]
	ldrh r1, [r0, #0x18]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strh r2, [r0, #0x18]
	ldr r0, [r7]
	ldrh r1, [r0, #0x1a]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strh r2, [r0, #0x1a]
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0

	thumb_func_start sub_806E51C
sub_806E51C: @ 0x0806E51C
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r1, [r7]
	ldr r0, [r1, #0x30]
	ldrh r1, [r0, #0x18]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strh r2, [r0, #0x18]
	ldr r1, [r7]
	ldr r0, [r1, #0x30]
	ldrh r1, [r0, #0x1a]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x80
	lsls r3, r3, #1
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strh r2, [r0, #0x1a]
	ldr r0, _0806E560 @ =sub_806E564
	ldr r1, [r7]
	ldr r2, [r1, #0x30]
	adds r1, r2, #0
	movs r2, #0x1e
	bl sub_8014FCC
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806E560: .4byte sub_806E564

	thumb_func_start sub_806E564
sub_806E564: @ 0x0806E564
	push {r4, r5, r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r1, _0806E5BC @ =gManimSt
	adds r0, r1, #0
	adds r1, #0x58
	ldrb r4, [r1]
	ldr r1, _0806E5BC @ =gManimSt
	adds r0, r1, #0
	adds r1, #0x58
	ldrb r0, [r1]
	movs r1, #1
	subs r5, r1, r0
	ldr r0, _0806E5BC @ =gManimSt
	ldr r1, [r0, #4]
	adds r0, r1, #0
	adds r1, #0x4a
	ldrh r2, [r1]
	adds r0, r2, #0
	bl sub_806C218
	lsls r1, r0, #0x18
	lsrs r2, r1, #0x18
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_806F404
	ldr r0, [r7]
	ldrh r1, [r0, #0x18]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strh r2, [r0, #0x18]
	ldr r0, [r7]
	ldrh r1, [r0, #0x1a]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strh r2, [r0, #0x1a]
	add sp, #4
	pop {r4, r5, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806E5BC: .4byte gManimSt

	thumb_func_start sub_806E5C0
sub_806E5C0: @ 0x0806E5C0
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r1, [r7]
	ldr r0, [r1, #0x30]
	ldrh r1, [r0, #0x18]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strh r2, [r0, #0x18]
	ldr r1, [r7]
	ldr r0, [r1, #0x30]
	ldrh r1, [r0, #0x1a]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x40
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strh r2, [r0, #0x1a]
	ldr r0, _0806E604 @ =sub_806E608
	ldr r1, [r7]
	ldr r2, [r1, #0x30]
	adds r1, r2, #0
	movs r2, #0x14
	bl sub_8014FCC
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806E604: .4byte sub_806E608

	thumb_func_start sub_806E608
sub_806E608: @ 0x0806E608
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, [r7]
	ldrh r1, [r0, #0x18]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strh r2, [r0, #0x18]
	ldr r0, [r7]
	ldrh r1, [r0, #0x1a]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strh r2, [r0, #0x1a]
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0

	thumb_func_start sub_806E630
sub_806E630: @ 0x0806E630
	push {r7, lr}
	sub sp, #0xc
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	ldr r0, _0806E670 @ =gUnk_08D64D98
	ldr r1, [r7, #4]
	adds r2, r1, #0
	lsls r1, r2, #2
	adds r0, r0, r1
	ldr r1, [r0]
	movs r2, #0xa8
	lsls r2, r2, #2
	adds r0, r1, #0
	adds r1, r2, #0
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r1, _0806E674 @ =gUnk_08D65014
	adds r0, r1, #0
	ldr r1, [r7]
	bl Proc_Start
	str r0, [r7, #8]
	ldr r0, [r7, #8]
	ldr r1, [r7]
	str r1, [r0, #0x2c]
	add sp, #0xc
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806E670: .4byte gUnk_08D64D98
_0806E674: .4byte gUnk_08D65014

	thumb_func_start sub_806E678
sub_806E678: @ 0x0806E678
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x30
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0

	thumb_func_start sub_806E698
sub_806E698: @ 0x0806E698
	push {r4, r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, [r7]
	ldr r1, [r0, #0x2c]
	ldr r0, [r1, #0x30]
	ldr r1, [r7]
	ldr r2, [r1, #0x2c]
	ldr r1, [r2, #0x34]
	ldr r2, [r7]
	ldr r3, [r2, #0x2c]
	adds r2, r3, #0
	adds r3, #0x46
	ldrh r2, [r3]
	movs r4, #0xa0
	lsls r4, r4, #7
	adds r3, r2, r4
	ldrh r1, [r1, #2]
	adds r2, r3, #0
	adds r1, r1, r2
	ldrh r2, [r0, #0x22]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0, #0x22]
	add sp, #4
	pop {r4, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_806E6DC
sub_806E6DC: @ 0x0806E6DC
	push {r4, r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, [r7]
	ldr r1, [r0, #0x2c]
	ldr r0, [r1, #0x30]
	ldr r1, [r7]
	ldr r2, [r1, #0x2c]
	ldr r1, [r2, #0x34]
	ldr r2, [r7]
	ldr r3, [r2, #0x2c]
	ldr r2, [r3, #0x34]
	ldrb r3, [r2, #1]
	movs r4, #0xf
	adds r2, r3, #0
	ands r2, r4
	adds r4, r2, #0
	lsls r3, r4, #0x18
	lsrs r2, r3, #0x18
	adds r3, r2, #0
	lsls r2, r3, #0xc
	ldrh r1, [r1, #2]
	adds r1, r1, r2
	ldr r2, [r7]
	ldr r3, [r2, #0x2c]
	adds r2, r3, #0
	adds r3, #0x46
	ldrh r2, [r3]
	adds r1, r1, r2
	ldrh r2, [r0, #0x22]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0, #0x22]
	add sp, #4
	pop {r4, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_806E730
sub_806E730: @ 0x0806E730
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, [r7]
	ldr r1, [r0, #0x2c]
	ldr r0, [r1, #0x34]
	ldrb r1, [r0, #1]
	adds r0, r1, #0
	adds r0, #0x10
	adds r1, r0, #0
	lsls r0, r1, #5
	asrs r1, r0, #1
	adds r0, r1, #0
	lsls r1, r0, #1
	ldr r0, _0806E768 @ =gPal
	adds r1, r1, r0
	adds r0, r1, #0
	movs r1, #0x15
	movs r2, #0x14
	ldr r3, [r7]
	bl StartPalFade
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806E768: .4byte gPal

	thumb_func_start sub_806E76C
sub_806E76C: @ 0x0806E76C
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x30
	ldr r0, [r7]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x30
	ldrb r3, [r2]
	adds r1, r3, #1
	adds r2, r0, #0
	adds r0, #0x30
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0]
	ldr r1, [r7]
	ldr r0, [r1, #0x2c]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x30
	ldrb r1, [r2]
	movs r2, #1
	ands r1, r2
	adds r3, r1, #0
	lsls r2, r3, #0x18
	lsrs r1, r2, #0x18
	cmp r1, #0
	beq _0806E7B8
	movs r1, #2
	b _0806E7BC
_0806E7B8:
	movs r1, #2
	rsbs r1, r1, #0
_0806E7BC:
	movs r2, #0
	bl sub_806E334
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x30
	ldrb r0, [r1]
	cmp r0, #0xb
	bls _0806E7E2
	ldr r0, [r7]
	ldr r1, [r0, #0x2c]
	adds r0, r1, #0
	movs r1, #0
	movs r2, #0
	bl sub_806E334
	ldr r0, [r7]
	bl Proc_Break
_0806E7E2:
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_806E7EC
sub_806E7EC: @ 0x0806E7EC
	push {r4, r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, [r7]
	ldr r1, [r0, #0x2c]
	ldr r0, [r1, #0x30]
	ldr r1, [r7]
	ldr r2, [r1, #0x2c]
	ldr r1, [r2, #0x34]
	ldr r2, [r7]
	ldr r3, [r2, #0x2c]
	ldr r2, [r3, #0x34]
	ldrb r3, [r2, #1]
	movs r4, #0xf
	adds r2, r3, #0
	ands r2, r4
	adds r4, r2, #0
	lsls r3, r4, #0x18
	lsrs r2, r3, #0x18
	adds r3, r2, #0
	lsls r2, r3, #0xc
	ldrh r1, [r1, #2]
	adds r1, r1, r2
	ldr r2, [r7]
	ldr r3, [r2, #0x2c]
	adds r2, r3, #0
	adds r3, #0x46
	ldrh r2, [r3]
	adds r1, r1, r2
	ldrh r2, [r0, #0x22]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0, #0x22]
	add sp, #4
	pop {r4, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_806E840
sub_806E840: @ 0x0806E840
	push {r4, r7, lr}
	sub sp, #0xc
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	ldr r0, _0806E8D0 @ =gUnk_08D64D98
	ldr r1, [r7, #4]
	adds r2, r1, #0
	lsls r1, r2, #2
	adds r0, r0, r1
	ldr r1, [r0]
	movs r2, #0xa8
	lsls r2, r2, #2
	adds r0, r1, #0
	adds r1, r2, #0
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r1, [r7]
	ldr r0, [r1, #0x30]
	ldr r2, [r7]
	ldr r1, [r2, #0x34]
	ldr r3, [r7]
	adds r2, r3, #0
	adds r3, #0x46
	ldrh r2, [r3]
	movs r4, #0xa0
	lsls r4, r4, #7
	adds r3, r2, r4
	ldrh r1, [r1, #2]
	adds r2, r3, #0
	adds r1, r1, r2
	ldrh r2, [r0, #0x22]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0, #0x22]
	ldr r0, [r7]
	ldr r1, [r0, #0x34]
	ldrb r0, [r1, #1]
	adds r1, r0, #0
	adds r1, #0x10
	adds r0, r1, #0
	lsls r1, r0, #5
	asrs r0, r1, #1
	adds r1, r0, #0
	lsls r0, r1, #1
	ldr r2, _0806E8D4 @ =gPal
	adds r1, r0, r2
	adds r0, r1, #0
	movs r1, #0x15
	movs r2, #0x14
	ldr r3, [r7]
	bl StartPalFade
	ldr r1, _0806E8D8 @ =gUnk_08D6509C
	adds r0, r1, #0
	ldr r1, [r7]
	bl Proc_Start
	str r0, [r7, #8]
	ldr r0, [r7, #8]
	ldr r1, [r7]
	str r1, [r0, #0x2c]
	add sp, #0xc
	pop {r4, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806E8D0: .4byte gUnk_08D64D98
_0806E8D4: .4byte gPal
_0806E8D8: .4byte gUnk_08D6509C

	thumb_func_start sub_806E8DC
sub_806E8DC: @ 0x0806E8DC
	push {r4, r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, [r7]
	ldr r1, [r0, #0x2c]
	ldr r0, [r1, #0x30]
	ldr r1, [r7]
	ldr r2, [r1, #0x2c]
	ldr r1, [r2, #0x34]
	ldr r2, [r7]
	ldr r3, [r2, #0x2c]
	ldr r2, [r3, #0x34]
	ldrb r3, [r2, #1]
	movs r4, #0xf
	adds r2, r3, #0
	ands r2, r4
	adds r4, r2, #0
	lsls r3, r4, #0x18
	lsrs r2, r3, #0x18
	adds r3, r2, #0
	lsls r2, r3, #0xc
	ldrh r1, [r1, #2]
	adds r1, r1, r2
	ldr r2, [r7]
	ldr r3, [r2, #0x2c]
	adds r2, r3, #0
	adds r3, #0x46
	ldrh r2, [r3]
	adds r1, r1, r2
	ldrh r2, [r0, #0x22]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0, #0x22]
	add sp, #4
	pop {r4, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_806E930
sub_806E930: @ 0x0806E930
	push {r7, lr}
	mov r7, sp
	ldr r0, _0806E944 @ =gUnk_08D64F4C
	ldr r1, _0806E948 @ =sub_806E94C
	bl Proc_ForEach
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806E944: .4byte gUnk_08D64F4C
_0806E948: .4byte sub_806E94C

	thumb_func_start sub_806E94C
sub_806E94C: @ 0x0806E94C
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x44
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #1
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0

	thumb_func_start sub_806E974
sub_806E974: @ 0x0806E974
	push {r4, r7, lr}
	sub sp, #0xc
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	str r2, [r7, #8]
	ldr r1, [r7]
	ldr r0, [r1, #0x30]
	ldrh r1, [r0, #0x18]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strh r2, [r0, #0x18]
	ldr r1, [r7]
	ldr r0, [r1, #0x30]
	ldrh r1, [r0, #0x1a]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strh r2, [r0, #0x1a]
	ldr r1, [r7]
	ldr r2, [r7, #4]
	adds r0, r2, #0
	adds r2, r1, #0
	adds r1, #0x41
	ldrb r2, [r1]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	orrs r0, r3
	adds r2, r0, #0
	strb r2, [r1]
	ldr r0, [r7]
	ldr r4, [r0, #0x30]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x41
	ldrb r2, [r1]
	adds r0, r2, #0
	bl sub_806DD6C
	adds r1, r0, #0
	adds r0, r4, #0
	bl SetSpriteAnimInfo
	ldr r0, [r7]
	bl sub_806DD40
	adds r4, r0, #0
	ldr r0, [r7]
	ldr r1, [r0, #0x34]
	ldrb r2, [r1]
	adds r0, r2, #0
	bl sub_806DD10
	adds r1, r0, #0
	adds r0, r4, #0
	bl Decompress
	ldr r0, [r7, #8]
	ldr r1, [r7]
	ldr r2, [r1, #0x34]
	ldrb r1, [r2, #1]
	adds r2, r1, #0
	adds r2, #0x10
	adds r1, r2, #0
	lsls r2, r1, #5
	adds r1, r2, #0
	movs r2, #0x20
	bl ApplyPaletteExt
	add sp, #0xc
	pop {r4, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_806EA0C
sub_806EA0C: @ 0x0806EA0C
	push {r7, lr}
	sub sp, #8
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	ldr r1, [r7]
	ldr r0, [r1, #0x34]
	ldr r2, [r7, #4]
	adds r1, r2, #0
	ldrb r2, [r0, #1]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0, #1]
	ldr r1, [r7]
	ldr r0, [r1, #0x30]
	ldr r2, [r7]
	ldr r1, [r2, #0x34]
	ldr r2, [r7, #4]
	movs r3, #0xf
	ands r2, r3
	adds r3, r2, #0
	lsls r2, r3, #0xc
	ldrh r1, [r1, #2]
	adds r1, r1, r2
	ldr r3, [r7]
	adds r2, r3, #0
	adds r3, #0x46
	ldrh r2, [r3]
	adds r1, r1, r2
	ldrh r2, [r0, #0x22]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0, #0x22]
	add sp, #8
	pop {r7}
	pop {r0}
	bx r0

	thumb_func_start sub_806EA64
sub_806EA64: @ 0x0806EA64
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, _0806EA80 @ =0x030014E8
	ldr r1, [r7]
	movs r2, #0x4c
	muls r1, r2, r1
	adds r0, r0, r1
	ldrb r1, [r0]
	cmp r1, #0
	bne _0806EA84
	movs r0, #0
	b _0806EA9C
	.align 2, 0
_0806EA80: .4byte 0x030014E8
_0806EA84:
	ldr r0, _0806EA98 @ =0x030014E8
	ldr r1, [r7]
	movs r2, #0x4c
	muls r1, r2, r1
	adds r0, #0x48
	adds r1, r0, r1
	ldr r2, [r1]
	adds r0, r2, #0
	b _0806EA9C
	.align 2, 0
_0806EA98: .4byte 0x030014E8
_0806EA9C:
	add sp, #4
	pop {r7}
	pop {r1}
	bx r1

	thumb_func_start sub_806EAA4
sub_806EAA4: @ 0x0806EAA4
	push {r7, lr}
	sub sp, #0xc
	mov r7, sp
	str r0, [r7]
	movs r0, #0
	str r0, [r7, #4]
_0806EAB0:
	ldr r0, [r7, #4]
	cmp r0, #3
	ble _0806EAB8
	b _0806EADA
_0806EAB8:
	ldr r1, [r7, #4]
	adds r0, r1, #0
	bl sub_806EA64
	str r0, [r7, #8]
	ldr r0, [r7, #8]
	ldr r1, [r0, #0x2c]
	ldr r0, [r7]
	cmp r1, r0
	bne _0806EAD2
	ldr r1, [r7, #8]
	adds r0, r1, #0
	b _0806EADE
_0806EAD2:
	ldr r0, [r7, #4]
	adds r1, r0, #1
	str r1, [r7, #4]
	b _0806EAB0
_0806EADA:
	movs r0, #0
	b _0806EADE
_0806EADE:
	add sp, #0xc
	pop {r7}
	pop {r1}
	bx r1
	.align 2, 0
