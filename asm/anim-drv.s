	.include "macro.inc"

	.syntax unified

	thumb_func_start AnimDisplayPrivate
AnimDisplayPrivate: @ 0x080066E0
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	adds r7, r0, #0
	ldr r4, _080067EC @ =gOamAffinePutId
	ldrh r0, [r4]
	str r0, [sp]
	ldr r2, [r7, #0x3c]
	cmp r2, #0
	beq _080067DC
	ldr r3, [r2]
	ldr r1, _080067F0 @ =0xFFFF0000
	adds r0, r3, #0
	ands r0, r1
	cmp r0, r1
	bne _08006740
	ldr r6, _080067F4 @ =0x0000FFFF
	ands r6, r3
	cmp r6, #0
	beq _08006740
	ldr r3, _080067F8 @ =gOamAffinePutIt
_08006710:
	ldr r0, [r3]
	ldrh r1, [r2, #4]
	strh r1, [r0, #6]
	adds r0, #8
	str r0, [r3]
	ldrh r1, [r2, #6]
	strh r1, [r0, #6]
	adds r0, #8
	str r0, [r3]
	ldrh r1, [r2, #8]
	strh r1, [r0, #6]
	adds r0, #8
	str r0, [r3]
	ldrh r1, [r2, #0xa]
	strh r1, [r0, #6]
	adds r0, #8
	str r0, [r3]
	ldrh r0, [r4]
	adds r0, #1
	strh r0, [r4]
	subs r6, #1
	adds r2, #0xc
	cmp r6, #0
	bne _08006710
_08006740:
	adds r5, r2, #0
	ldr r0, [r5]
	cmp r0, #1
	beq _080067DC
	ldr r2, _080067FC @ =gOamHiPutIt
	ldr r0, [r2]
	ldr r1, _08006800 @ =0x03002C50
	mov sl, r1
	cmp r0, sl
	bhs _080067DC
	movs r0, #0x80
	lsls r0, r0, #1
	mov sb, r0
	movs r1, #0x40
	rsbs r1, r1, #0
	mov r8, r1
	mov ip, r2
_08006762:
	movs r2, #6
	ldrsh r1, [r5, r2]
	movs r2, #2
	ldrsh r0, [r7, r2]
	adds r3, r1, r0
	movs r0, #8
	ldrsh r1, [r5, r0]
	movs r2, #4
	ldrsh r0, [r7, r2]
	adds r4, r1, r0
	cmp r3, sb
	bgt _0800677E
	cmp r3, r8
	bge _08006782
_0800677E:
	movs r3, #0xc0
	lsls r3, r3, #1
_08006782:
	cmp r4, #0xa0
	bgt _0800678A
	cmp r4, r8
	bge _0800678E
_0800678A:
	movs r3, #0xc0
	lsls r3, r3, #1
_0800678E:
	ldr r0, _08006804 @ =0x000001FF
	ands r3, r0
	movs r0, #0xff
	ands r4, r0
	movs r6, #0
	ldr r1, [r5]
	adds r0, r1, #0
	mov r2, sb
	ands r0, r2
	cmp r0, #0
	beq _080067A8
	ldr r0, [sp]
	lsls r6, r0, #0x19
_080067A8:
	ldr r0, [r7, #0x1c]
	adds r6, r6, r0
	mov r0, ip
	ldr r2, [r0]
	adds r0, r1, r6
	lsls r1, r3, #0x10
	orrs r0, r1
	orrs r0, r4
	stm r2!, {r0}
	mov r1, ip
	str r2, [r1]
	ldr r0, _08006808 @ =0x0000F3FF
	ldrh r1, [r5, #4]
	ands r0, r1
	ldrh r1, [r7, #8]
	adds r0, r1, r0
	strh r0, [r2]
	adds r2, #4
	mov r0, ip
	str r2, [r0]
	adds r5, #0xc
	ldr r0, [r5]
	cmp r0, #1
	beq _080067DC
	cmp r2, sl
	blo _08006762
_080067DC:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080067EC: .4byte gOamAffinePutId
_080067F0: .4byte 0xFFFF0000
_080067F4: .4byte 0x0000FFFF
_080067F8: .4byte gOamAffinePutIt
_080067FC: .4byte gOamHiPutIt
_08006800: .4byte 0x03002C50
_08006804: .4byte 0x000001FF
_08006808: .4byte 0x0000F3FF
