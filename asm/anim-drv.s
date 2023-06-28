	.include "macro.inc"

	.syntax unified

	thumb_func_start AnimUpdateAll
AnimUpdateAll: @ 0x08006320
	push {r4, r5, lr}
	movs r5, #0
	ldr r0, _08006330 @ =0x02029C7C
	ldr r0, [r0]
	cmp r0, #0
	beq _08006392
	adds r4, r0, #0
	b _08006336
	.align 2, 0
_08006330: .4byte 0x02029C7C
_08006334:
	ldr r4, [r4, #0x38]
_08006336:
	ldrh r0, [r4]
	adds r1, r0, #0
	cmp r1, #0
	beq _08006334
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	bne _08006376
	ldrh r1, [r4, #6]
	movs r2, #6
	ldrsh r0, [r4, r2]
	cmp r0, #0
	beq _0800635A
	subs r0, r1, #1
	strh r0, [r4, #6]
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _0800636E
_0800635A:
	adds r0, r4, #0
	bl sub_08006518
	cmp r0, #1
	bne _08006366
	movs r5, #1
_08006366:
	movs r1, #6
	ldrsh r0, [r4, r1]
	cmp r0, #0
	beq _0800635A
_0800636E:
	ldrh r0, [r4]
	adds r1, r0, #0
	cmp r1, #0
	beq _08006334
_08006376:
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	bne _08006384
	adds r0, r4, #0
	bl sub_080066E0
_08006384:
	ldr r0, [r4, #0x38]
	cmp r0, #0
	bne _08006334
	cmp r5, #1
	bne _08006392
	bl AnimSort
_08006392:
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start AnimClearAll
AnimClearAll: @ 0x08006398
	ldr r0, _080063BC @ =0x02028E6C
	movs r1, #0xe1
	lsls r1, r1, #4
	adds r2, r0, r1
	ldr r3, _080063C0 @ =0x02029C7C
	cmp r0, r2
	bhs _080063B4
	movs r1, #0
_080063A8:
	strh r1, [r0]
	str r1, [r0, #0x34]
	str r1, [r0, #0x38]
	adds r0, #0x48
	cmp r0, r2
	blo _080063A8
_080063B4:
	movs r0, #0
	str r0, [r3]
	bx lr
	.align 2, 0
_080063BC: .4byte 0x02028E6C
_080063C0: .4byte 0x02029C7C

	thumb_func_start AnimCreate_unused
AnimCreate_unused: @ 0x080063C4
	push {r4, lr}
	adds r3, r0, #0
	ldr r4, _08006418 @ =0x02028E6C
	movs r0, #0xe1
	lsls r0, r0, #4
	adds r2, r4, r0
	cmp r4, r2
	bhs _080063E8
	ldrh r0, [r4]
	cmp r0, #0
	beq _080063E8
	adds r1, r2, #0
_080063DC:
	adds r4, #0x48
	cmp r4, r1
	bhs _080063E8
	ldrh r0, [r4]
	cmp r0, #0
	bne _080063DC
_080063E8:
	cmp r4, r2
	beq _0800641C
	movs r0, #0
	movs r1, #0
	movs r2, #1
	strh r2, [r4]
	str r3, [r4, #0x20]
	str r3, [r4, #0x24]
	strh r1, [r4, #6]
	strh r1, [r4, #8]
	strh r1, [r4, #0xa]
	strh r1, [r4, #0xc]
	strh r1, [r4, #0x10]
	str r1, [r4, #0x1c]
	strb r0, [r4, #0x14]
	str r1, [r4, #0x2c]
	str r1, [r4, #0x30]
	str r1, [r4, #0x40]
	str r1, [r4, #0x44]
	adds r0, r4, #0
	bl sub_08006698
	adds r0, r4, #0
	b _0800641E
	.align 2, 0
_08006418: .4byte 0x02028E6C
_0800641C:
	movs r0, #0
_0800641E:
	pop {r4}
	pop {r1}
	bx r1

	thumb_func_start AnimCreate
AnimCreate: @ 0x08006424
	push {r4, r5, lr}
	adds r3, r0, #0
	lsls r1, r1, #0x10
	lsrs r5, r1, #0x10
	ldr r4, _0800647C @ =0x02028E6C
	movs r0, #0xe1
	lsls r0, r0, #4
	adds r2, r4, r0
	cmp r4, r2
	bhs _0800644C
	ldrh r0, [r4]
	cmp r0, #0
	beq _0800644C
	adds r1, r2, #0
_08006440:
	adds r4, #0x48
	cmp r4, r1
	bhs _0800644C
	ldrh r0, [r4]
	cmp r0, #0
	bne _08006440
_0800644C:
	cmp r4, r2
	beq _08006480
	movs r0, #0
	movs r1, #0
	movs r2, #1
	strh r2, [r4]
	str r3, [r4, #0x20]
	str r3, [r4, #0x24]
	strh r1, [r4, #6]
	strh r1, [r4, #8]
	strh r5, [r4, #0xa]
	strh r1, [r4, #0xc]
	strh r1, [r4, #0x10]
	str r1, [r4, #0x1c]
	strb r0, [r4, #0x14]
	str r1, [r4, #0x2c]
	str r1, [r4, #0x30]
	str r1, [r4, #0x40]
	str r1, [r4, #0x44]
	adds r0, r4, #0
	bl sub_08006698
	adds r0, r4, #0
	b _08006482
	.align 2, 0
_0800647C: .4byte 0x02028E6C
_08006480:
	movs r0, #0
_08006482:
	pop {r4, r5}
	pop {r1}
	bx r1

	thumb_func_start AnimSort
AnimSort: @ 0x08006488
	push {r4, r5, lr}
	ldr r4, _080064D8 @ =0x02028E6C
	movs r1, #0xe1
	lsls r1, r1, #4
	adds r0, r4, r1
	adds r5, r4, #0
	ldr r3, _080064DC @ =0x02029C7C
	cmp r4, r0
	bhs _080064AE
	movs r1, #0
	adds r2, r0, #0
_0800649E:
	ldrh r0, [r4]
	cmp r0, #0
	beq _080064A8
	str r1, [r4, #0x34]
	str r1, [r4, #0x38]
_080064A8:
	adds r4, #0x48
	cmp r4, r2
	blo _0800649E
_080064AE:
	movs r0, #0
	str r0, [r3]
	adds r4, r5, #0
	movs r1, #0xe1
	lsls r1, r1, #4
	adds r0, r4, r1
	cmp r4, r0
	bhs _080064D2
	adds r5, r0, #0
_080064C0:
	ldrh r0, [r4]
	cmp r0, #0
	beq _080064CC
	adds r0, r4, #0
	bl sub_08006698
_080064CC:
	adds r4, #0x48
	cmp r4, r5
	blo _080064C0
_080064D2:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080064D8: .4byte 0x02028E6C
_080064DC: .4byte 0x02029C7C

	thumb_func_start sub_080064E0
sub_080064E0: @ 0x080064E0
	adds r2, r0, #0
	ldr r3, [r2, #0x34]
	cmp r3, #0
	bne _080064F8
	ldr r1, _080064F4 @ =0x02029C7C
	ldr r0, [r2, #0x38]
	str r0, [r1]
	str r3, [r0, #0x34]
	b _08006502
	.align 2, 0
_080064F4: .4byte 0x02029C7C
_080064F8:
	ldr r0, [r2, #0x38]
	str r0, [r3, #0x38]
	ldr r1, [r2, #0x38]
	ldr r0, [r2, #0x34]
	str r0, [r1, #0x34]
_08006502:
	movs r0, #0
	strh r0, [r2]
	str r0, [r2, #0x34]
	str r0, [r2, #0x38]
	bx lr

	thumb_func_start sub_0800650C
sub_0800650C: @ 0x0800650C
	push {lr}
	bl sub_080066E0
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_08006518
sub_08006518: @ 0x08006518
	push {r4, r5, lr}
	adds r2, r0, #0
	movs r4, #0
	ldr r0, [r2, #0x20]
	ldm r0!, {r3}
	str r0, [r2, #0x20]
	cmp r3, #0
	blt _0800652A
	b _08006678
_0800652A:
	movs r0, #0x80
	lsls r0, r0, #0x17
	ands r0, r3
	cmp r0, #0
	beq _08006564
	lsrs r1, r3, #0x1c
	movs r0, #3
	ands r1, r0
	cmp r1, #0
	beq _08006544
	cmp r1, #1
	beq _08006554
	b _0800668C
_08006544:
	ldr r0, _08006550 @ =0x0FFFFFFF
	ands r3, r0
	adds r0, r2, #0
	bl _call_via_r3
	b _0800668C
	.align 2, 0
_08006550: .4byte 0x0FFFFFFF
_08006554:
	ldr r0, _08006560 @ =0x0FFFFFFF
	ands r0, r3
	str r0, [r2, #0x24]
	str r0, [r2, #0x20]
	strh r1, [r2, #6]
	b _0800668C
	.align 2, 0
_08006560: .4byte 0x0FFFFFFF
_08006564:
	lsrs r1, r3, #0x18
	movs r0, #0x3f
	ands r1, r0
	cmp r1, #6
	bls _08006570
	b _0800668C
_08006570:
	lsls r0, r1, #2
	ldr r1, _0800657C @ =_08006580
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0800657C: .4byte _08006580
_08006580: @ jump table
	.4byte _0800659C @ case 0
	.4byte _080065B8 @ case 1
	.4byte _080065C4 @ case 2
	.4byte _080065D0 @ case 3
	.4byte _080065CC @ case 4
	.4byte _080065EC @ case 5
	.4byte _0800664A @ case 6
_0800659C:
	ldr r0, [r2, #0x20]
	subs r0, #4
	str r0, [r2, #0x20]
	movs r0, #1
	strh r0, [r2, #6]
	ldr r0, _080065B4 @ =0x00000FFF
	ldrh r1, [r2, #0xc]
	ands r0, r1
	movs r3, #0x80
	lsls r3, r3, #7
	adds r1, r3, #0
	b _0800666E
	.align 2, 0
_080065B4: .4byte 0x00000FFF
_080065B8:
	movs r0, #0
	strh r0, [r2]
	movs r0, #1
	strh r0, [r2, #6]
	movs r4, #1
	b _0800668C
_080065C4:
	ldr r0, [r2, #0x24]
	str r0, [r2, #0x20]
	movs r0, #1
	b _0800668A
_080065CC:
	strh r3, [r2, #6]
	b _0800668C
_080065D0:
	lsls r0, r3, #0x18
	asrs r0, r0, #0x18
	ldrh r5, [r2, #2]
	adds r0, r5, r0
	strh r0, [r2, #2]
	lsls r0, r3, #0x10
	asrs r0, r0, #0x18
	ldrh r1, [r2, #4]
	adds r0, r1, r0
	strh r0, [r2, #4]
	lsrs r0, r3, #0x10
	movs r1, #0xff
	ands r0, r1
	b _0800668A
_080065EC:
	ldr r0, _0800662C @ =0x00000FFF
	ldrh r5, [r2, #0xc]
	ands r0, r5
	movs r5, #0x80
	lsls r5, r5, #5
	adds r1, r5, #0
	orrs r0, r1
	strh r0, [r2, #0xc]
	adds r0, r2, #0
	adds r0, #0x15
	ldrb r1, [r2, #0x14]
	adds r0, r1, r0
	strb r3, [r0]
	ldrb r0, [r2, #0x14]
	adds r0, #1
	strb r0, [r2, #0x14]
	movs r0, #1
	strh r0, [r2, #6]
	movs r0, #0xff
	ands r0, r3
	cmp r0, #0x18
	beq _08006642
	cmp r0, #0x18
	bhi _08006630
	cmp r0, #1
	blo _0800668C
	cmp r0, #5
	bls _08006642
	cmp r0, #0x13
	beq _08006642
	b _0800668C
	.align 2, 0
_0800662C: .4byte 0x00000FFF
_08006630:
	cmp r0, #0x39
	beq _08006642
	cmp r0, #0x39
	bhi _0800663E
	cmp r0, #0x2d
	beq _08006642
	b _0800668C
_0800663E:
	cmp r0, #0x52
	bne _0800668C
_08006642:
	ldr r0, [r2, #0x20]
	subs r0, #4
	str r0, [r2, #0x20]
	b _0800668C
_0800664A:
	strh r3, [r2, #6]
	lsrs r0, r3, #0x10
	strb r0, [r2, #0x13]
	ldr r0, [r2, #0x20]
	ldm r0!, {r1}
	str r1, [r2, #0x28]
	str r0, [r2, #0x20]
	ldm r0!, {r1}
	str r0, [r2, #0x20]
	ldr r0, [r2, #0x30]
	adds r1, r1, r0
	str r1, [r2, #0x3c]
	ldr r0, _08006674 @ =0x00000FFF
	ldrh r3, [r2, #0xc]
	ands r0, r3
	movs r5, #0x80
	lsls r5, r5, #6
	adds r1, r5, #0
_0800666E:
	orrs r0, r1
	strh r0, [r2, #0xc]
	b _0800668C
	.align 2, 0
_08006674: .4byte 0x00000FFF
_08006678:
	ldr r0, _08006694 @ =0x0FFFFFFC
	ands r0, r3
	str r0, [r2, #0x3c]
	lsrs r0, r3, #0x1a
	movs r1, #0x1c
	ands r0, r1
	movs r1, #3
	ands r3, r1
	adds r0, r0, r3
_0800668A:
	strh r0, [r2, #6]
_0800668C:
	adds r0, r4, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_08006694: .4byte 0x0FFFFFFC

	thumb_func_start sub_08006698
sub_08006698: @ 0x08006698
	push {r4, lr}
	adds r2, r0, #0
	ldr r0, _080066AC @ =0x02029C7C
	ldr r1, [r0]
	adds r4, r0, #0
	cmp r1, #0
	bne _080066B8
_080066A6:
	str r2, [r4]
	b _080066DA
	.align 2, 0
_080066AC: .4byte 0x02029C7C
_080066B0:
	str r0, [r2, #0x38]
	str r1, [r2, #0x34]
	str r2, [r1, #0x38]
	b _080066DA
_080066B8:
	ldrh r3, [r2, #0xa]
	b _080066C4
_080066BC:
	ldr r0, [r1, #0x38]
	cmp r0, #0
	beq _080066B0
	adds r1, r0, #0
_080066C4:
	ldrh r0, [r1, #0xa]
	cmp r3, r0
	bls _080066BC
	ldr r3, [r1, #0x34]
	str r3, [r2, #0x34]
	str r1, [r2, #0x38]
	str r2, [r1, #0x34]
	ldr r0, [r2, #0x34]
	cmp r0, #0
	beq _080066A6
	str r2, [r3, #0x38]
_080066DA:
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_080066E0
sub_080066E0: @ 0x080066E0
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
