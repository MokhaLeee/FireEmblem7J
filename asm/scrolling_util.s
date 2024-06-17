	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_80A95B4
sub_80A95B4: @ 0x080A95B4
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x20
	str r0, [sp]
	str r1, [sp, #4]
	mov sb, r2
	mov sl, r3
	ldr r3, [sp, #0x40]
	ldr r0, _080A9688 @ =0xFFFFFC00
	adds r0, r0, r3
	mov r8, r0
	mov r1, r8
	muls r1, r0, r1
	lsls r5, r3, #1
	movs r6, #0x80
	lsls r6, r6, #3
	adds r0, r5, r6
	muls r0, r1, r0
	asrs r1, r0, #0x1f
	adds r4, r3, #0
	muls r4, r3, r4
	movs r2, #0xc0
	lsls r2, r2, #4
	subs r2, r2, r5
	muls r4, r2, r4
	asrs r5, r4, #0x1f
	subs r6, r6, r3
	adds r2, r6, #0
	muls r2, r6, r2
	muls r2, r3, r2
	str r2, [sp, #0x18]
	asrs r2, r2, #0x1f
	str r2, [sp, #0x1c]
	mov r2, r8
	muls r2, r3, r2
	muls r2, r3, r2
	str r2, [sp, #8]
	asrs r2, r2, #0x1f
	str r2, [sp, #0xc]
	ldr r2, [sp, #4]
	asrs r3, r2, #0x1f
	bl __muldi3
	str r0, [sp, #0x10]
	str r1, [sp, #0x14]
	mov r2, sb
	asrs r3, r2, #0x1f
	adds r1, r5, #0
	adds r0, r4, #0
	bl __muldi3
	ldr r2, [sp, #0x10]
	ldr r3, [sp, #0x14]
	adds r2, r2, r0
	adcs r3, r1
	str r2, [sp, #0x10]
	str r3, [sp, #0x14]
	mov r3, sb
	ldr r6, [sp]
	subs r3, r3, r6
	mov sb, r3
	asrs r0, r3, #1
	adds r2, r0, #0
	mov r0, sb
	asrs r3, r0, #0x1f
	ldr r0, [sp, #0x18]
	ldr r1, [sp, #0x1c]
	bl __muldi3
	ldr r2, [sp, #0x10]
	ldr r3, [sp, #0x14]
	adds r2, r2, r0
	adcs r3, r1
	str r2, [sp, #0x10]
	str r3, [sp, #0x14]
	mov r3, sl
	ldr r6, [sp, #4]
	subs r3, r3, r6
	mov sl, r3
	asrs r0, r3, #1
	adds r2, r0, #0
	mov r0, sl
	asrs r3, r0, #0x1f
	ldr r0, [sp, #8]
	ldr r1, [sp, #0xc]
	bl __muldi3
	ldr r2, [sp, #0x10]
	ldr r3, [sp, #0x14]
	adds r0, r0, r2
	adcs r1, r3
	lsls r3, r1, #2
	lsrs r2, r0, #0x1e
	adds r0, r3, #0
	orrs r0, r2
	add sp, #0x20
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_080A9688: .4byte 0xFFFFFC00

	thumb_func_start sub_80A968C
sub_80A968C: @ 0x080A968C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x18
	mov sl, r0
	mov sb, r1
	adds r6, r2, #0
	mov r8, r3
	ldr r2, [sp, #0x38]
	lsls r3, r2, #1
	adds r3, r3, r2
	lsls r0, r3, #1
	adds r4, r2, #0
	muls r4, r0, r4
	lsls r5, r3, #0xb
	subs r0, r4, r5
	asrs r1, r0, #0x1f
	subs r4, r5, r4
	str r4, [sp]
	asrs r4, r4, #0x1f
	str r4, [sp, #4]
	muls r3, r2, r3
	lsls r4, r2, #0xc
	subs r4, r3, r4
	movs r5, #0x80
	lsls r5, r5, #0xd
	adds r4, r4, r5
	asrs r5, r4, #0x1f
	lsls r2, r2, #0xb
	subs r2, r3, r2
	str r2, [sp, #8]
	asrs r2, r2, #0x1f
	str r2, [sp, #0xc]
	mov r2, sb
	asrs r3, r2, #0x1f
	bl __muldi3
	str r0, [sp, #0x10]
	str r1, [sp, #0x14]
	adds r2, r6, #0
	asrs r3, r6, #0x1f
	ldr r0, [sp]
	ldr r1, [sp, #4]
	bl __muldi3
	ldr r2, [sp, #0x10]
	ldr r3, [sp, #0x14]
	adds r2, r2, r0
	adcs r3, r1
	str r2, [sp, #0x10]
	str r3, [sp, #0x14]
	mov r3, sl
	subs r6, r6, r3
	asrs r0, r6, #1
	adds r2, r0, #0
	asrs r3, r6, #0x1f
	adds r1, r5, #0
	adds r0, r4, #0
	bl __muldi3
	ldr r2, [sp, #0x10]
	ldr r3, [sp, #0x14]
	adds r2, r2, r0
	adcs r3, r1
	str r2, [sp, #0x10]
	str r3, [sp, #0x14]
	mov r3, r8
	mov r5, sb
	subs r3, r3, r5
	mov r8, r3
	asrs r0, r3, #1
	adds r2, r0, #0
	mov r7, r8
	asrs r3, r7, #0x1f
	ldr r0, [sp, #8]
	ldr r1, [sp, #0xc]
	bl __muldi3
	ldr r2, [sp, #0x10]
	ldr r3, [sp, #0x14]
	adds r0, r0, r2
	adcs r1, r3
	lsls r3, r1, #0xc
	lsrs r2, r0, #0x14
	adds r0, r3, #0
	orrs r0, r2
	add sp, #0x18
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	thumb_func_start sub_80A974C
sub_80A974C: @ 0x080A974C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	mov sl, r0
	adds r5, r1, #0
	adds r4, r2, #0
	ldr r0, [sp, #0x24]
	mov r8, r0
	ldr r7, [sp, #0x28]
	ldr r1, [sp, #0x2c]
	mov sb, r1
	movs r0, #3
	ands r0, r3
	bl GetBgTilemap
	str r0, [sp]
	lsls r4, r4, #5
	adds r4, r4, r5
	lsls r4, r4, #1
	add sl, r4
	mov r2, r8
	cmp r2, #0
	bge _080A978E
	add sb, r8
	lsls r0, r2, #1
	mov r1, sl
	subs r1, r1, r0
	mov sl, r1
	movs r2, #0
	mov r8, r2
_080A978E:
	cmp r7, #0
	bge _080A97A2
	ldr r0, [sp, #0x30]
	adds r0, r0, r7
	str r0, [sp, #0x30]
	lsls r0, r7, #6
	mov r1, sl
	subs r1, r1, r0
	mov sl, r1
	movs r7, #0
_080A97A2:
	movs r1, #0
	cmp r7, #0x1f
	bgt _080A97FC
	ldr r2, [sp, #0x30]
	cmp r1, r2
	bge _080A97FC
_080A97AE:
	movs r5, #0
	adds r4, r1, #1
	mov r0, r8
	cmp r0, #0x1f
	bgt _080A97EE
	cmp r5, sb
	bge _080A97EE
	adds r0, r7, r1
	movs r2, #0x1f
	mov ip, r2
	ands r0, r2
	lsls r6, r0, #5
	mov r2, r8
	lsls r0, r1, #6
	mov r1, sl
	adds r3, r0, r1
_080A97CE:
	adds r0, r2, #0
	mov r1, ip
	ands r0, r1
	adds r0, r6, r0
	lsls r0, r0, #1
	ldr r1, [sp]
	adds r0, r0, r1
	ldrh r1, [r3]
	strh r1, [r0]
	adds r2, #1
	adds r3, #2
	adds r5, #1
	cmp r2, #0x1f
	bgt _080A97EE
	cmp r5, sb
	blt _080A97CE
_080A97EE:
	adds r1, r4, #0
	adds r0, r7, r4
	cmp r0, #0x1f
	bgt _080A97FC
	ldr r2, [sp, #0x30]
	cmp r4, r2
	blt _080A97AE
_080A97FC:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
