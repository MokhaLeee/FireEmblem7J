	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_808954C
sub_808954C: @ 0x0808954C
	push {r4, r5, lr}
	ldr r0, _080895B8 @ =0x0200D668
	bl InitUnitStack
	movs r5, #1
_08089556:
	adds r0, r5, #0
	bl GetUnit
	adds r4, r0, #0
	cmp r4, #0
	beq _0808957A
	ldr r0, [r4]
	cmp r0, #0
	beq _0808957A
	adds r0, r4, #0
	bl IsUnitInCurrentRoster
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0808957A
	adds r0, r4, #0
	bl PushUnit
_0808957A:
	adds r5, #1
	cmp r5, #0x3f
	ble _08089556
	movs r5, #1
_08089582:
	adds r0, r5, #0
	bl GetUnit
	adds r4, r0, #0
	cmp r4, #0
	beq _080895A6
	ldr r0, [r4]
	cmp r0, #0
	beq _080895A6
	adds r0, r4, #0
	bl IsUnitInCurrentRoster
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080895A6
	adds r0, r4, #0
	bl PushUnit
_080895A6:
	adds r5, #1
	cmp r5, #0x3f
	ble _08089582
	bl LoadPlayerUnitsFromUnitStack
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080895B8: .4byte 0x0200D668

	thumb_func_start sub_80895BC
sub_80895BC: @ 0x080895BC
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r8, r0
	lsls r1, r1, #0x18
	lsrs r7, r1, #0x18
	lsls r2, r2, #0x18
	lsrs r6, r2, #0x18
	ldr r0, _08089634 @ =gUnk_08D8BA04
	ldr r3, [r0]
	movs r0, #0xa0
	lsls r0, r0, #7
	str r0, [sp]
	movs r0, #0xd
	mov r1, r8
	adds r2, r7, #0
	bl PutSpriteExt
	movs r5, #0
	subs r0, r6, #1
	cmp r5, r0
	bge _08089610
	mov r4, r8
	adds r4, #8
_080895F2:
	ldr r0, _08089634 @ =gUnk_08D8BA04
	ldr r3, [r0, #4]
	movs r0, #0xa0
	lsls r0, r0, #7
	str r0, [sp]
	movs r0, #0xd
	adds r1, r4, #0
	adds r2, r7, #0
	bl PutSpriteExt
	adds r4, #0x10
	adds r5, #1
	subs r0, r6, #1
	cmp r5, r0
	blt _080895F2
_08089610:
	lsls r1, r5, #4
	add r1, r8
	adds r1, #8
	ldr r0, _08089634 @ =gUnk_08D8BA04
	ldr r3, [r0, #8]
	movs r0, #0xa0
	lsls r0, r0, #7
	str r0, [sp]
	movs r0, #0xd
	adds r2, r7, #0
	bl PutSpriteExt
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08089634: .4byte gUnk_08D8BA04

	thumb_func_start sub_8089638
sub_8089638: @ 0x08089638
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	ldr r0, _08089694 @ =gBg2Tm + 0x68
	movs r1, #4
	movs r2, #1
	movs r3, #0
	bl TmFillRect_thm
	ldr r4, _08089698 @ =0x0200D660
	adds r0, r4, #0
	bl ClearText
	movs r3, #0
	ldr r0, _0808969C @ =gUnk_08D8BB00
	mov r8, r0
	adds r5, r4, #0
	mov sb, r8
_08089662:
	movs r2, #0
	lsls r1, r3, #3
	adds r6, r3, #1
	adds r1, r1, r3
	lsls r1, r1, #4
	mov r0, sb
	adds r0, #4
	adds r4, r1, r0
	add r1, r8
_08089674:
	ldrb r0, [r1]
	cmp r0, r7
	bne _080896C8
	cmp r3, #5
	bne _080896A0
	cmp r2, #0
	beq _080896A0
	adds r1, r2, #0
	adds r1, #0x6f
	ldr r0, _08089694 @ =gBg2Tm + 0x68
	movs r2, #0xa0
	lsls r2, r2, #7
	bl PutIcon
	b _080896D2
	.align 2, 0
_08089694: .4byte gBg2Tm + 0x68
_08089698: .4byte 0x0200D660
_0808969C: .4byte gUnk_08D8BB00
_080896A0:
	adds r0, r5, #0
	movs r1, #0
	bl Text_SetCursor
	adds r0, r5, #0
	movs r1, #0
	bl Text_SetColor
	ldr r1, [r4]
	adds r0, r5, #0
	bl Text_DrawString
	adds r0, r5, #0
	ldr r1, _080896C4 @ =gBg2Tm + 0x68
	bl PutText
	b _080896D2
	.align 2, 0
_080896C4: .4byte gBg2Tm + 0x68
_080896C8:
	adds r4, #0x10
	adds r1, #0x10
	adds r2, #1
	cmp r2, #8
	ble _08089674
_080896D2:
	adds r3, r6, #0
	cmp r3, #9
	ble _08089662
	movs r0, #4
	bl EnableBgSync
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_80896EC
sub_80896EC: @ 0x080896EC
	adds r3, r0, #0
	movs r2, #0
	ldr r1, _08089710 @ =0x0200E66C
_080896F2:
	ldr r0, [r1]
	cmp r0, r3
	beq _0808971C
	adds r1, #4
	adds r2, #1
	cmp r2, #7
	ble _080896F2
	movs r2, #0
	ldr r1, _08089710 @ =0x0200E66C
_08089704:
	ldr r0, [r1]
	cmp r0, #0xff
	bne _08089714
	str r3, [r1]
	b _0808971C
	.align 2, 0
_08089710: .4byte 0x0200E66C
_08089714:
	adds r1, #4
	adds r2, #1
	cmp r2, #7
	ble _08089704
_0808971C:
	bx lr
	.align 2, 0

	thumb_func_start sub_8089720
sub_8089720: @ 0x08089720
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #0x28
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x14
	ldr r3, _080897D4 @ =0x0200E668
	movs r2, #0xff
	add r1, sp, #0x1c
_08089732:
	str r2, [r1]
	subs r1, #4
	cmp r1, r13
	bge _08089732
	cmp r0, #0
	ble _08089740
	subs r0, #1
_08089740:
	movs r6, #0
	ldrb r3, [r3]
	cmp r0, r3
	bge _08089786
	ldr r1, _080897D8 @ =0x0200CBF0
	adds r5, r0, #0
	mov r7, sp
	lsls r0, r5, #2
	adds r4, r0, r1
_08089752:
	ldr r0, [r4]
	ldr r0, [r0]
	bl GetUnitEquippedWeapon
	lsls r0, r0, #0x10
	cmp r0, #0
	beq _08089772
	ldr r0, [r4]
	ldr r0, [r0]
	bl GetUnitEquippedWeapon
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl sub_8017808
	str r0, [r7]
_08089772:
	adds r5, #1
	adds r7, #4
	adds r4, #4
	adds r6, #1
	cmp r6, #7
	bgt _08089786
	ldr r0, _080897D4 @ =0x0200E668
	ldrb r0, [r0]
	cmp r5, r0
	blt _08089752
_08089786:
	movs r6, #0
	ldr r7, _080897DC @ =0x0200E66C
	mov r8, r7
_0808978C:
	lsls r1, r6, #2
	mov r2, r8
	adds r0, r1, r2
	ldr r0, [r0]
	adds r4, r1, #0
	adds r6, #1
	cmp r0, #0xff
	beq _080897C4
	movs r5, #0
	adds r1, r0, #0
	mov r2, sp
	movs r3, #7
_080897A4:
	ldr r0, [r2]
	cmp r0, r1
	bne _080897AC
	movs r5, #1
_080897AC:
	adds r2, #4
	subs r3, #1
	cmp r3, #0
	bge _080897A4
	cmp r5, #0
	bne _080897C4
	adds r4, r4, r7
	ldr r0, [r4]
	bl ClearIcon
	movs r0, #0xff
	str r0, [r4]
_080897C4:
	cmp r6, #7
	ble _0808978C
	add sp, #0x28
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080897D4: .4byte 0x0200E668
_080897D8: .4byte 0x0200CBF0
_080897DC: .4byte 0x0200E66C

	thumb_func_start sub_80897E0
sub_80897E0: @ 0x080897E0
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r0, r1, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	lsls r0, r0, #0x18
	lsls r2, r2, #0x18
	lsrs r5, r2, #0x18
	lsrs r0, r0, #0x1b
	movs r1, #6
	bl __umodsi3
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	cmp r4, #0
	bne _08089848
	lsls r0, r5, #0x18
	asrs r2, r0, #0x18
	cmp r2, #0
	beq _08089830
	ldr r2, _08089824 @ =gBg2Tm
	ldr r0, _08089828 @ =0xFFFFF368
	adds r1, r3, r0
	movs r4, #0x80
	lsls r4, r4, #1
	adds r0, r2, r4
	strh r1, [r0]
	ldr r0, _0808982C @ =0xFFFFF36E
	adds r1, r3, r0
	movs r3, #0xa0
	lsls r3, r3, #1
	adds r0, r2, r3
	strh r1, [r0]
	b _0808988A
	.align 2, 0
_08089824: .4byte gBg2Tm
_08089828: .4byte 0xFFFFF368
_0808982C: .4byte 0xFFFFF36E
_08089830:
	ldr r1, _08089844 @ =gBg2Tm
	movs r4, #0x80
	lsls r4, r4, #1
	adds r0, r1, r4
	strh r2, [r0]
	movs r3, #0xa0
	lsls r3, r3, #1
	adds r0, r1, r3
	strh r2, [r0]
	b _0808988A
	.align 2, 0
_08089844: .4byte gBg2Tm
_08089848:
	lsls r0, r5, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _08089878
	ldr r2, _0808986C @ =gBg2Tm
	ldr r4, _08089870 @ =0xFFFFF768
	adds r0, r3, r4
	movs r4, #0x9d
	lsls r4, r4, #1
	adds r1, r2, r4
	strh r0, [r1]
	ldr r1, _08089874 @ =0xFFFFF76E
	adds r0, r3, r1
	movs r3, #0xbd
	lsls r3, r3, #1
	adds r1, r2, r3
	b _08089888
	.align 2, 0
_0808986C: .4byte gBg2Tm
_08089870: .4byte 0xFFFFF768
_08089874: .4byte 0xFFFFF76E
_08089878:
	ldr r1, _08089898 @ =gBg2Tm
	movs r4, #0x9d
	lsls r4, r4, #1
	adds r2, r1, r4
	strh r0, [r2]
	movs r2, #0xbd
	lsls r2, r2, #1
	adds r1, r1, r2
_08089888:
	strh r0, [r1]
_0808988A:
	movs r0, #4
	bl EnableBgSync
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08089898: .4byte gBg2Tm

	thumb_func_start sub_808989C
sub_808989C: @ 0x0808989C
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	adds r4, r0, #0
	lsls r1, r1, #0x18
	lsrs r5, r1, #0x18
	cmp r1, #0
	beq _080898DE
	bl PrepGetLatestCharId
	b _080898E2
_080898B4:
	adds r0, r4, #0
	adds r0, #0x2c
	strb r3, [r0]
	strh r3, [r4, #0x3e]
	b _0808998C
_080898BE:
	adds r0, r4, #0
	adds r0, #0x2c
	strb r3, [r0]
	strh r1, [r4, #0x3e]
	b _0808998C
_080898C8:
	subs r1, r3, r1
	adds r0, r4, #0
	adds r0, #0x2c
	strb r1, [r0]
	b _0808998C
_080898D2:
	adds r1, r4, #0
	adds r1, #0x2c
	movs r0, #1
	strb r0, [r1]
	strh r7, [r4, #0x3e]
	b _0808998C
_080898DE:
	bl GetLastStatScreenUnitId
_080898E2:
	adds r1, r0, #0
	movs r3, #0
	ldr r0, _0808991C @ =0x0200E668
	ldrb r6, [r0]
	mov sb, r0
	cmp r3, r6
	bge _0808998C
	lsls r0, r5, #0x18
	asrs r0, r0, #0x18
	mov r8, r0
	movs r0, #0x2c
	adds r0, r0, r4
	mov ip, r0
	movs r5, #0x40
	rsbs r5, r5, #0
	movs r7, #0x10
	rsbs r7, r7, #0
	ldr r2, _08089920 @ =0x0200CBF0
_08089906:
	mov r0, r8
	cmp r0, #0
	beq _08089924
	ldr r0, [r2]
	ldr r0, [r0]
	ldr r0, [r0]
	ldrb r0, [r0, #4]
	cmp r0, r1
	beq _08089932
	b _08089980
	.align 2, 0
_0808991C: .4byte 0x0200E668
_08089920: .4byte 0x0200CBF0
_08089924:
	ldr r0, [r2]
	ldr r0, [r0]
	ldrb r0, [r0, #0xb]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, r1
	bne _08089980
_08089932:
	adds r0, r4, #0
	adds r0, #0x30
	movs r1, #0
	strb r3, [r0]
	cmp r3, #0
	beq _080898B4
	mov r0, sb
	ldrb r2, [r0]
	subs r0, r2, #1
	cmp r3, r0
	bne _0808995E
	cmp r2, #6
	bls _080898BE
	movs r0, #5
	mov r1, ip
	strb r0, [r1]
	mov r1, sb
	ldrb r0, [r1]
	subs r0, #6
	lsls r0, r0, #4
	strh r0, [r4, #0x3e]
	b _0808998C
_0808995E:
	ldrh r2, [r4, #0x3e]
	lsrs r1, r2, #4
	adds r0, r1, #0
	cmp r3, r0
	ble _0808996E
	adds r0, #5
	cmp r3, r0
	blt _080898C8
_0808996E:
	cmp r2, r7
	bgt _080898D2
	cmp r2, r5
	bge _0808998C
	movs r0, #4
	mov r1, ip
	strb r0, [r1]
	strh r5, [r4, #0x3e]
	b _0808998C
_08089980:
	adds r5, #0x10
	adds r7, #0x10
	adds r2, #4
	adds r3, #1
	cmp r3, r6
	blt _08089906
_0808998C:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_8089998
sub_8089998: @ 0x08089998
	push {r4, r5, r6, r7, lr}
	lsls r0, r0, #0x18
	asrs r2, r0, #0x18
	cmp r2, #0
	beq _08089A3C
	ldr r0, _08089A38 @ =gDispIo
	mov ip, r0
	movs r0, #0x20
	mov r1, ip
	ldrb r1, [r1, #1]
	orrs r0, r1
	movs r1, #0x40
	orrs r0, r1
	movs r1, #0x7f
	ands r0, r1
	mov r2, ip
	strb r0, [r2, #1]
	mov r0, ip
	adds r0, #0x2d
	movs r2, #0
	strb r2, [r0]
	mov r1, ip
	adds r1, #0x31
	movs r0, #0x38
	strb r0, [r1]
	mov r0, ip
	adds r0, #0x2c
	movs r3, #0xf0
	strb r3, [r0]
	subs r1, #1
	movs r0, #0x98
	strb r0, [r1]
	mov r0, ip
	adds r0, #0x2f
	strb r2, [r0]
	adds r0, #4
	strb r2, [r0]
	subs r0, #5
	strb r3, [r0]
	adds r1, #2
	movs r0, #0x20
	strb r0, [r1]
	adds r1, #2
	movs r0, #1
	ldrb r3, [r1]
	orrs r0, r3
	movs r4, #2
	orrs r0, r4
	movs r3, #4
	orrs r0, r3
	movs r2, #8
	orrs r0, r2
	movs r5, #0x10
	orrs r0, r5
	strb r0, [r1]
	mov r6, ip
	adds r6, #0x35
	movs r1, #2
	rsbs r1, r1, #0
	adds r0, r1, #0
	ldrb r7, [r6]
	ands r0, r7
	orrs r0, r4
	orrs r0, r3
	orrs r0, r2
	orrs r0, r5
	strb r0, [r6]
	mov r5, ip
	adds r5, #0x36
	ldrb r0, [r5]
	ands r1, r0
	orrs r1, r4
	orrs r1, r3
	orrs r1, r2
	movs r0, #0x11
	rsbs r0, r0, #0
	ands r1, r0
	strb r1, [r5]
	b _08089A9C
	.align 2, 0
_08089A38: .4byte gDispIo
_08089A3C:
	ldr r1, _08089AA4 @ =gDispIo
	mov ip, r1
	movs r0, #0x20
	ldrb r3, [r1, #1]
	orrs r0, r3
	movs r1, #0x41
	rsbs r1, r1, #0
	ands r0, r1
	movs r1, #0x7f
	ands r0, r1
	mov r6, ip
	strb r0, [r6, #1]
	mov r0, ip
	adds r0, #0x2d
	strb r2, [r0]
	mov r1, ip
	adds r1, #0x31
	movs r0, #0x38
	strb r0, [r1]
	subs r1, #5
	movs r0, #0xf0
	strb r0, [r1]
	adds r1, #4
	movs r0, #0x98
	strb r0, [r1]
	adds r1, #4
	movs r0, #1
	ldrb r7, [r1]
	orrs r0, r7
	movs r5, #2
	orrs r0, r5
	movs r4, #4
	orrs r0, r4
	movs r3, #8
	orrs r0, r3
	movs r2, #0x10
	orrs r0, r2
	strb r0, [r1]
	adds r1, #2
	movs r0, #2
	rsbs r0, r0, #0
	ldrb r6, [r1]
	ands r0, r6
	orrs r0, r5
	orrs r0, r4
	orrs r0, r3
	orrs r0, r2
	strb r0, [r1]
_08089A9C:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08089AA4: .4byte gDispIo

	thumb_func_start sub_8089AA8
sub_8089AA8: @ 0x08089AA8
	push {r4, lr}
	adds r4, r0, #0
	bl EndAllMus
	ldr r0, [r4, #0x40]
	bl Proc_End
	ldr r0, [r4, #0x44]
	bl Proc_End
	bl EndGreenText
	ldr r2, _08089AE8 @ =gDispIo
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
	adds r0, r4, #0
	adds r0, #0x39
	ldrb r0, [r0]
	cmp r0, #1
	bne _08089AEC
	movs r0, #0x11
	bl SetStatScreenExcludedUnitFlags
	b _08089AF2
	.align 2, 0
_08089AE8: .4byte gDispIo
_08089AEC:
	movs r0, #0x1f
	bl SetStatScreenExcludedUnitFlags
_08089AF2:
	ldr r1, _08089B2C @ =0x0200CBF0
	adds r0, r4, #0
	adds r0, #0x30
	ldrb r0, [r0]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	ldr r0, [r0]
	adds r1, r4, #0
	bl StartStatScreen
	ldr r1, _08089B30 @ =gPlaySt
	adds r0, r4, #0
	adds r0, #0x34
	ldrb r0, [r0]
	lsls r0, r0, #7
	adds r2, r4, #0
	adds r2, #0x32
	ldrb r2, [r2]
	adds r0, r2, r0
	strb r0, [r1, #0x1a]
	adds r1, r4, #0
	adds r1, #0x29
	movs r0, #4
	strb r0, [r1]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08089B2C: .4byte 0x0200CBF0
_08089B30: .4byte gPlaySt

	thumb_func_start sub_8089B34
sub_8089B34: @ 0x08089B34
	push {lr}
	bl sub_808A0F4
	ldr r2, _08089B5C @ =gDispIo
	movs r0, #2
	rsbs r0, r0, #0
	ldrb r1, [r2, #1]
	ands r0, r1
	movs r1, #3
	rsbs r1, r1, #0
	ands r0, r1
	subs r1, #2
	ands r0, r1
	subs r1, #4
	ands r0, r1
	subs r1, #8
	ands r0, r1
	strb r0, [r2, #1]
	pop {r0}
	bx r0
	.align 2, 0
_08089B5C: .4byte gDispIo

	thumb_func_start sub_8089B60
sub_8089B60: @ 0x08089B60
	ldr r2, _08089B7C @ =gDispIo
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
	bx lr
	.align 2, 0
_08089B7C: .4byte gDispIo

	thumb_func_start sub_8089B80
sub_8089B80: @ 0x08089B80
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x14]
	str r0, [r4, #0x2c]
	adds r0, r4, #0
	adds r0, #0x3b
	movs r1, #0
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	ldr r0, [r4, #0x2c]
	ldrh r0, [r0, #0x3e]
	strh r0, [r4, #0x38]
	adds r0, r4, #0
	adds r0, #0x3a
	strb r1, [r0]
	subs r0, #0xa
	strb r1, [r0]
	adds r0, r4, #0
	bl sub_8090DD0
	str r0, [r4, #0x34]
	movs r0, #0xe0
	movs r1, #0x40
	bl sub_8090DE4
	ldr r0, [r4, #0x2c]
	ldrh r1, [r0, #0x3e]
	ldr r0, _08089BD8 @ =0x0200E668
	ldrb r2, [r0]
	movs r0, #0xa
	movs r3, #6
	bl sub_8090E04
	movs r0, #0xe4
	lsls r0, r0, #7
	movs r1, #1
	bl sub_8090E38
	bl ForceSyncUnitSpriteSheet
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08089BD8: .4byte 0x0200E668

	thumb_func_start sub_8089BDC
sub_8089BDC: @ 0x08089BDC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x20
	adds r6, r0, #0
	add r1, sp, #4
	ldr r0, _08089C28 @ =gUnk_0842CE04
	ldm r0!, {r2, r3, r4}
	stm r1!, {r2, r3, r4}
	ldr r0, [r0]
	str r0, [r1]
	ldr r0, [r6, #0x2c]
	adds r0, #0x34
	ldrb r0, [r0]
	cmp r0, #0
	bne _08089C30
	adds r4, r6, #0
	adds r4, #0x3b
	ldrb r5, [r4]
	lsrs r0, r5, #3
	movs r1, #3
	ands r0, r1
	lsls r0, r0, #2
	add r0, sp
	adds r0, #4
	ldr r2, [r0]
	adds r2, #7
	ldr r3, _08089C2C @ =gUnk_08D8BA10
	movs r0, #0x90
	lsls r0, r0, #8
	str r0, [sp]
	movs r0, #0xb
	movs r1, #0xb8
	bl PutSpriteExt
	b _08089C56
	.align 2, 0
_08089C28: .4byte gUnk_0842CE04
_08089C2C: .4byte gUnk_08D8BA10
_08089C30:
	ldr r1, _08089CCC @ =0x000020B8
	adds r4, r6, #0
	adds r4, #0x3b
	ldrb r2, [r4]
	lsrs r0, r2, #3
	movs r2, #3
	ands r0, r2
	lsls r0, r0, #2
	add r0, sp
	adds r0, #4
	ldr r2, [r0]
	adds r2, #7
	ldr r3, _08089CD0 @ =gUnk_08D8BA10
	movs r0, #0x90
	lsls r0, r0, #8
	str r0, [sp]
	movs r0, #0xb
	bl PutSpriteExt
_08089C56:
	str r4, [sp, #0x14]
	ldr r1, _08089CD4 @ =gUnk_08D8BAD8
	ldr r0, [r6, #0x2c]
	adds r0, #0x2f
	ldrb r0, [r0]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r3, [r0]
	movs r5, #0x90
	lsls r5, r5, #8
	str r5, [sp]
	movs r0, #0xd
	movs r1, #0x20
	movs r2, #8
	bl PutSpriteExt
	ldr r3, _08089CD8 @ =gUnk_08D8BA18
	str r5, [sp]
	movs r0, #0xd
	movs r1, #0xa0
	movs r2, #0
	bl PutSpriteExt
	ldr r0, [r6, #0x2c]
	ldrh r1, [r0, #0x3e]
	ldr r0, _08089CDC @ =0x0200E668
	ldrb r2, [r0]
	movs r0, #0xa
	movs r3, #6
	bl sub_8090E04
	ldr r4, [r6, #0x2c]
	adds r0, r4, #0
	adds r0, #0x29
	ldrb r0, [r0]
	cmp r0, #2
	bls _08089CE4
	ldr r1, _08089CE0 @ =gUnk_08D8BB00
	adds r3, r4, #0
	adds r3, #0x2d
	adds r2, r4, #0
	adds r2, #0x2f
	ldrb r5, [r2]
	lsls r0, r5, #3
	adds r0, r0, r5
	ldrb r3, [r3]
	adds r0, r3, r0
	lsls r0, r0, #4
	adds r0, r0, r1
	ldrb r0, [r0, #8]
	adds r1, r4, #0
	adds r1, #0x2c
	ldrb r1, [r1]
	lsls r1, r1, #4
	adds r1, #0x28
	bl PutUiHand
	b _08089CFA
	.align 2, 0
_08089CCC: .4byte 0x000020B8
_08089CD0: .4byte gUnk_08D8BA10
_08089CD4: .4byte gUnk_08D8BAD8
_08089CD8: .4byte gUnk_08D8BA18
_08089CDC: .4byte 0x0200E668
_08089CE0: .4byte gUnk_08D8BB00
_08089CE4:
	adds r0, r4, #0
	adds r0, #0x2c
	ldrb r0, [r0]
	lsls r2, r0, #4
	adds r2, #0x40
	ldr r3, _08089D48 @ =gUnk_08D8BA20
	str r5, [sp]
	movs r0, #0xd
	movs r1, #4
	bl PutSpriteExt
_08089CFA:
	ldr r1, [r6, #0x2c]
	ldrh r0, [r6, #0x38]
	ldrh r2, [r1, #0x3e]
	cmp r0, r2
	bne _08089D0C
	movs r0, #0xf
	ands r0, r2
	cmp r0, #0
	beq _08089D54
_08089D0C:
	ldr r0, _08089D4C @ =gPal
	ldr r1, _08089D50 @ =0x02012970
	ldrh r1, [r1, #0x10]
	movs r3, #0xcf
	lsls r3, r3, #2
	adds r0, r0, r3
	strh r1, [r0]
	bl EnablePalSync
	adds r2, r6, #0
	adds r2, #0x3c
	movs r0, #0x20
	strb r0, [r2]
	ldr r0, [r6, #0x2c]
	ldrh r0, [r0, #0x3e]
	strh r0, [r6, #0x38]
	adds r0, r6, #0
	adds r0, #0x3a
	ldrb r1, [r0]
	str r2, [sp, #0x18]
	mov r8, r0
	cmp r1, #0
	bne _08089D90
	movs r0, #1
	bl sub_8089998
	movs r0, #1
	mov r4, r8
	strb r0, [r4]
	b _08089D90
	.align 2, 0
_08089D48: .4byte gUnk_08D8BA20
_08089D4C: .4byte gPal
_08089D50: .4byte 0x02012970
_08089D54:
	ldr r2, _08089E38 @ =gPal
	ldr r3, _08089E3C @ =0x02012970
	adds r4, r6, #0
	adds r4, #0x3c
	ldrb r5, [r4]
	lsrs r0, r5, #2
	movs r1, #0xf
	ands r0, r1
	lsls r0, r0, #1
	adds r0, r0, r3
	ldrh r0, [r0]
	movs r1, #0xcf
	lsls r1, r1, #2
	adds r2, r2, r1
	strh r0, [r2]
	bl EnablePalSync
	adds r0, r6, #0
	adds r0, #0x3a
	str r4, [sp, #0x18]
	mov r8, r0
	ldrb r2, [r0]
	cmp r2, #1
	bne _08089D90
	movs r0, #0
	bl sub_8089998
	movs r0, #0
	mov r3, r8
	strb r0, [r3]
_08089D90:
	bl sub_80259A4
	ldrh r0, [r6, #0x38]
	lsrs r7, r0, #4
	movs r1, #0xf
	ands r0, r1
	rsbs r0, r0, #0
	mov sl, r0
	movs r5, #0
	ldr r0, _08089E40 @ =0x0200E668
	movs r4, #0x30
	adds r4, r4, r6
	mov sb, r4
	ldrb r0, [r0]
	cmp r7, r0
	bge _08089DE2
	ldr r1, _08089E44 @ =0x0200CBF0
	adds r4, r7, #0
	lsls r0, r7, #2
	adds r0, r0, r1
	str r0, [sp, #0x1c]
_08089DBA:
	lsls r2, r5, #4
	mov r0, sl
	adds r0, #0x38
	adds r2, r2, r0
	ldr r1, [sp, #0x1c]
	ldm r1!, {r0}
	str r1, [sp, #0x1c]
	ldr r3, [r0]
	movs r0, #4
	movs r1, #8
	bl sub_8026540
	adds r4, #1
	adds r5, #1
	cmp r5, #5
	bgt _08089DE2
	ldr r0, _08089E40 @ =0x0200E668
	ldrb r0, [r0]
	cmp r4, r0
	blt _08089DBA
_08089DE2:
	mov r2, r8
	ldrb r0, [r2]
	cmp r0, #0
	beq _08089E0E
	adds r3, r5, r7
	ldr r0, _08089E40 @ =0x0200E668
	ldrb r0, [r0]
	cmp r3, r0
	bge _08089E0E
	lsls r2, r5, #4
	mov r0, sl
	adds r0, #0x38
	adds r2, r2, r0
	ldr r1, _08089E44 @ =0x0200CBF0
	lsls r0, r3, #2
	adds r0, r0, r1
	ldr r0, [r0]
	ldr r3, [r0]
	movs r0, #4
	movs r1, #8
	bl sub_8026540
_08089E0E:
	ldr r0, [r6, #0x2c]
	adds r1, r0, #0
	adds r1, #0x2f
	adds r2, r0, #0
	adds r2, #0x2e
	ldrb r1, [r1]
	ldrb r2, [r2]
	cmp r1, r2
	bhs _08089E48
	adds r0, #0x39
	ldrb r0, [r0]
	cmp r0, #3
	beq _08089E48
	mov r3, sb
	ldrb r1, [r3]
	movs r0, #1
	movs r2, #1
	bl sub_80897E0
	b _08089E54
	.align 2, 0
_08089E38: .4byte gPal
_08089E3C: .4byte 0x02012970
_08089E40: .4byte 0x0200E668
_08089E44: .4byte 0x0200CBF0
_08089E48:
	mov r4, sb
	ldrb r1, [r4]
	movs r0, #1
	movs r2, #0
	bl sub_80897E0
_08089E54:
	ldr r0, [r6, #0x2c]
	adds r1, r0, #0
	adds r1, #0x2f
	ldrb r1, [r1]
	cmp r1, #1
	bls _08089E76
	adds r0, #0x39
	ldrb r0, [r0]
	cmp r0, #3
	beq _08089E76
	mov r5, sb
	ldrb r1, [r5]
	movs r0, #0
	movs r2, #1
	bl sub_80897E0
	b _08089E82
_08089E76:
	mov r0, sb
	ldrb r1, [r0]
	movs r0, #0
	movs r2, #0
	bl sub_80897E0
_08089E82:
	mov r1, sb
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x1b
	cmp r0, #5
	bls _08089E96
	movs r0, #0
	strb r0, [r1]
_08089E96:
	ldr r2, [sp, #0x14]
	ldrb r0, [r2]
	adds r0, #1
	strb r0, [r2]
	ldr r3, [sp, #0x18]
	ldrb r0, [r3]
	adds r0, #1
	strb r0, [r3]
	add sp, #0x20
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start nullsub_21
nullsub_21: @ 0x08089EB8
	bx lr
	.align 2, 0

	thumb_func_start sub_8089EBC
sub_8089EBC: @ 0x08089EBC
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r7, r0, #0
	mov r8, r1
	ldr r0, [r7, #0xc]
	movs r1, #8
	ands r0, r1
	cmp r0, #0
	bne _08089EDA
	mov r1, r8
	adds r1, #0x3b
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
_08089EDA:
	ldr r5, _08089FBC @ =0x0200C8F0
	ldr r4, _08089FC0 @ =0x0200E668
	ldrb r1, [r4]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r5
	str r7, [r0]
	movs r1, #1
	rsbs r1, r1, #0
	adds r0, r7, #0
	bl BattleGenerateUiStats
	ldrb r0, [r4]
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r5
	ldr r3, _08089FC4 @ =gBattleActor
	adds r0, r3, #0
	adds r0, #0x5a
	ldrh r0, [r0]
	adds r0, #1
	movs r2, #0xff
	ands r0, r2
	subs r0, #1
	strh r0, [r1, #4]
	ldrb r0, [r4]
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r5
	adds r0, r3, #0
	adds r0, #0x60
	ldrh r0, [r0]
	adds r0, #1
	ands r0, r2
	subs r0, #1
	strh r0, [r1, #6]
	ldrb r0, [r4]
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r5
	adds r0, r3, #0
	adds r0, #0x62
	ldrh r0, [r0]
	adds r0, #1
	ands r0, r2
	subs r0, #1
	strh r0, [r1, #8]
	adds r0, r7, #0
	bl GetUnitSupporterCount
	adds r5, r0, #0
	movs r6, #0
	movs r4, #0
	cmp r6, r5
	bge _08089F66
_08089F50:
	adds r0, r7, #0
	adds r1, r4, #0
	bl sub_8026C04
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08089F60
	adds r6, #1
_08089F60:
	adds r4, #1
	cmp r4, r5
	blt _08089F50
_08089F66:
	cmp r6, #3
	ble _08089F80
	mov r5, r8
	adds r5, #0x2e
	ldrb r4, [r5]
	subs r0, r6, #1
	movs r1, #3
	bl __divsi3
	adds r0, #6
	cmp r4, r0
	bge _08089F80
	strb r0, [r5]
_08089F80:
	ldr r4, _08089FBC @ =0x0200C8F0
	ldr r3, _08089FC0 @ =0x0200E668
	ldrb r1, [r3]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r4
	strb r6, [r0, #0xa]
	ldr r0, _08089FC8 @ =0x0200CBF0
	ldrb r1, [r3]
	lsls r2, r1, #2
	adds r2, r2, r0
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r4
	str r0, [r2]
	ldrb r0, [r3]
	adds r0, #1
	strb r0, [r3]
	adds r0, r7, #0
	bl GetUnitSMSId
	bl UseUnitSprite
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08089FBC: .4byte 0x0200C8F0
_08089FC0: .4byte 0x0200E668
_08089FC4: .4byte gBattleActor
_08089FC8: .4byte 0x0200CBF0

	thumb_func_start sub_8089FCC
sub_8089FCC: @ 0x08089FCC
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	ldr r1, _0808A020 @ =0x0200E668
	movs r0, #0
	strb r0, [r1]
	adds r0, r6, #0
	adds r0, #0x39
	ldrb r0, [r0]
	cmp r0, #1
	bne _0808A028
	ldr r0, _0808A024 @ =gPlaySt
	ldrb r0, [r0, #0xf]
	adds r5, r0, #1
	adds r0, #0x40
	cmp r5, r0
	bge _0808A064
_08089FEC:
	adds r0, r5, #0
	bl GetUnit
	adds r4, r0, #0
	cmp r4, #0
	beq _0808A012
	ldr r0, [r4]
	cmp r0, #0
	beq _0808A012
	adds r0, r4, #0
	bl IsUnitInCurrentRoster
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0808A012
	adds r0, r4, #0
	adds r1, r6, #0
	bl sub_8089EBC
_0808A012:
	adds r5, #1
	ldr r0, _0808A024 @ =gPlaySt
	ldrb r0, [r0, #0xf]
	adds r0, #0x40
	cmp r5, r0
	blt _08089FEC
	b _0808A064
	.align 2, 0
_0808A020: .4byte 0x0200E668
_0808A024: .4byte gPlaySt
_0808A028:
	ldr r0, _0808A030 @ =gPlaySt
	ldrb r0, [r0, #0xf]
	adds r4, r0, #1
	b _0808A05E
	.align 2, 0
_0808A030: .4byte gPlaySt
_0808A034:
	adds r0, r4, #0
	bl GetUnit
	adds r2, r0, #0
	cmp r2, #0
	beq _0808A058
	ldr r0, [r2]
	cmp r0, #0
	beq _0808A058
	ldr r0, [r2, #0xc]
	ldr r1, _0808A06C @ =0x0001000C
	ands r0, r1
	cmp r0, #0
	bne _0808A058
	adds r0, r2, #0
	adds r1, r6, #0
	bl sub_8089EBC
_0808A058:
	adds r4, #1
	ldr r0, _0808A070 @ =gPlaySt
	ldrb r0, [r0, #0xf]
_0808A05E:
	adds r0, #0x40
	cmp r4, r0
	blt _0808A034
_0808A064:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0808A06C: .4byte 0x0001000C
_0808A070: .4byte gPlaySt

	thumb_func_start sub_808A074
sub_808A074: @ 0x0808A074
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	ldr r1, _0808A0B8 @ =0x0200E668
	movs r0, #0
	strb r0, [r1]
	adds r0, r6, #0
	adds r0, #0x39
	ldrb r0, [r0]
	cmp r0, #1
	bne _0808A0BC
	movs r5, #1
_0808A08A:
	adds r0, r5, #0
	bl GetUnit
	adds r4, r0, #0
	cmp r4, #0
	beq _0808A0B0
	ldr r0, [r4]
	cmp r0, #0
	beq _0808A0B0
	adds r0, r4, #0
	bl IsUnitInCurrentRoster
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0808A0B0
	adds r0, r4, #0
	adds r1, r6, #0
	bl sub_8089EBC
_0808A0B0:
	adds r5, #1
	cmp r5, #0x3f
	ble _0808A08A
	b _0808A0E8
	.align 2, 0
_0808A0B8: .4byte 0x0200E668
_0808A0BC:
	movs r4, #1
_0808A0BE:
	adds r0, r4, #0
	bl GetUnit
	adds r2, r0, #0
	cmp r2, #0
	beq _0808A0E2
	ldr r0, [r2]
	cmp r0, #0
	beq _0808A0E2
	ldr r0, [r2, #0xc]
	ldr r1, _0808A0F0 @ =0x0001000C
	ands r0, r1
	cmp r0, #0
	bne _0808A0E2
	adds r0, r2, #0
	adds r1, r6, #0
	bl sub_8089EBC
_0808A0E2:
	adds r4, #1
	cmp r4, #0x3f
	ble _0808A0BE
_0808A0E8:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0808A0F0: .4byte 0x0001000C

	thumb_func_start sub_808A0F4
sub_808A0F4: @ 0x0808A0F4
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x1c
	mov r8, r0
	ldr r2, _0808A1D8 @ =gDispIo
	movs r6, #1
	ldrb r0, [r2, #1]
	orrs r0, r6
	movs r1, #2
	orrs r0, r1
	movs r1, #4
	orrs r0, r1
	movs r1, #8
	orrs r0, r1
	movs r1, #0x10
	orrs r0, r1
	strb r0, [r2, #1]
	movs r0, #0
	bl SetOnVMatch
	movs r0, #0
	bl InitBgs
	bl ResetText
	bl ResetTextFont
	bl ClearIcons
	bl ApplyUnitSpritePalettes
	movs r4, #0
	str r4, [sp, #4]
	ldr r1, _0808A1DC @ =gPal + 0x360
	ldr r2, _0808A1E0 @ =0x01000008
	add r0, sp, #4
	bl CpuFastSet
	bl ApplySystemObjectsGraphics
	mov r0, r8
	bl StartGreenText
	mov r0, r8
	adds r0, #0x3b
	strb r4, [r0]
	subs r0, #0xd
	movs r5, #6
	strb r5, [r0]
	mov r0, r8
	bl sub_808A074
	mov r0, r8
	adds r0, #0x39
	ldrb r0, [r0]
	cmp r0, #1
	bne _0808A188
	mov r0, r8
	adds r0, #0x2a
	mov r1, r8
	adds r1, #0x32
	str r1, [sp, #0x14]
	mov r2, r8
	adds r2, #0x29
	str r2, [sp, #8]
	movs r1, #0x2f
	add r1, r8
	mov sl, r1
	ldrb r0, [r0]
	cmp r0, #1
	bne _0808A200
_0808A188:
	ldr r4, _0808A1E4 @ =gPlaySt
	ldrb r1, [r4, #0x1a]
	mov r3, r8
	adds r3, #0x34
	mov r2, r8
	adds r2, #0x32
	str r2, [sp, #0x14]
	cmp r1, #0
	beq _0808A1AC
	lsrs r0, r1, #7
	ands r0, r6
	adds r2, #1
	strb r0, [r2]
	strb r0, [r3]
	movs r0, #0x7f
	ands r1, r0
	ldr r6, [sp, #0x14]
	strb r1, [r6]
_0808A1AC:
	mov r0, r8
	adds r0, #0x29
	str r0, [sp, #8]
	movs r0, #0x2f
	add r0, r8
	mov sl, r0
	ldr r1, [sp, #8]
	ldrb r1, [r1]
	cmp r1, #4
	beq _0808A1F6
	ldrb r0, [r0]
	cmp r0, #0
	beq _0808A1F6
	ldrb r4, [r4, #0x19]
	lsrs r1, r4, #4
	cmp r1, #0
	beq _0808A1F6
	cmp r1, #6
	bls _0808A1E8
	mov r2, sl
	strb r5, [r2]
	b _0808A1EC
	.align 2, 0
_0808A1D8: .4byte gDispIo
_0808A1DC: .4byte gPal + 0x360
_0808A1E0: .4byte 0x01000008
_0808A1E4: .4byte gPlaySt
_0808A1E8:
	mov r6, sl
	strb r1, [r6]
_0808A1EC:
	mov r1, sl
	ldrb r0, [r1]
	mov r1, r8
	adds r1, #0x36
	strb r0, [r1]
_0808A1F6:
	ldr r2, [sp, #0x14]
	ldrb r0, [r2]
	ldrb r1, [r3]
	bl SortUnitList
_0808A200:
	ldr r0, _0808A2DC @ =gBg0Tm
	movs r1, #0
	bl TmFill
	ldr r4, _0808A2E0 @ =gBg1Tm
	adds r0, r4, #0
	movs r1, #0
	bl TmFill
	ldr r0, _0808A2E4 @ =gBg2Tm
	movs r1, #0
	bl TmFill
	bl InitIcons
	movs r0, #4
	bl ApplyIconPalettes
	bl UnpackUiWindowFrameGraphics
	ldr r0, _0808A2E8 @ =gUnk_08428114
	ldr r1, _0808A2EC @ =0x06014800
	bl Decompress
	ldr r0, _0808A2F0 @ =gUnk_08428A40
	movs r1, #0xc8
	lsls r1, r1, #2
	movs r2, #0x20
	bl ApplyPaletteExt
	bl sub_809186C
	ldr r1, _0808A2F4 @ =gUnk_08427BFC
	movs r2, #0x80
	lsls r2, r2, #5
	adds r0, r4, #0
	bl TmApplyTsa_thm
	movs r4, #0
	mov r6, r8
	adds r6, #0x2e
	str r6, [sp, #0x10]
	mov r0, r8
	adds r0, #0x39
	str r0, [sp, #0x18]
	mov r1, r8
	adds r1, #0x2b
	str r1, [sp, #0xc]
	ldr r6, _0808A2F8 @ =0x0200D5A8
	movs r2, #0x10
	adds r2, r2, r6
	mov sb, r2
	adds r5, r6, #0
	movs r7, #0
_0808A26C:
	lsls r0, r4, #3
	ldr r1, _0808A2FC @ =0x0200D570
	adds r0, r0, r1
	movs r1, #5
	bl InitText
	adds r0, r5, #0
	movs r1, #7
	bl sub_800536C
	adds r0, r6, #0
	adds r0, #8
	adds r0, r7, r0
	movs r1, #7
	bl InitText
	mov r0, sb
	movs r1, #5
	bl InitText
	movs r0, #0x18
	add sb, r0
	adds r5, #0x18
	adds r7, #0x18
	adds r4, #1
	cmp r4, #6
	ble _0808A26C
	ldr r0, _0808A300 @ =0x0200D650
	movs r1, #4
	bl InitText
	ldr r0, _0808A304 @ =0x0200D658
	movs r1, #0x14
	bl InitText
	ldr r0, _0808A308 @ =0x0200D660
	movs r1, #4
	bl InitText
	ldr r1, [sp, #0x14]
	ldrb r0, [r1]
	bl sub_8089638
	ldr r2, [sp, #8]
	ldrb r2, [r2]
	cmp r2, #4
	bne _0808A30C
	mov r0, r8
	movs r1, #0
	bl sub_808989C
	movs r0, #0
	ldr r6, [sp, #8]
	strb r0, [r6]
	b _0808A31C
	.align 2, 0
_0808A2DC: .4byte gBg0Tm
_0808A2E0: .4byte gBg1Tm
_0808A2E4: .4byte gBg2Tm
_0808A2E8: .4byte gUnk_08428114
_0808A2EC: .4byte 0x06014800
_0808A2F0: .4byte gUnk_08428A40
_0808A2F4: .4byte gUnk_08427BFC
_0808A2F8: .4byte 0x0200D5A8
_0808A2FC: .4byte 0x0200D570
_0808A300: .4byte 0x0200D650
_0808A304: .4byte 0x0200D658
_0808A308: .4byte 0x0200D660
_0808A30C:
	ldr r0, [sp, #0x18]
	ldrb r0, [r0]
	cmp r0, #1
	bne _0808A31C
	mov r0, r8
	movs r1, #1
	bl sub_808989C
_0808A31C:
	movs r1, #0
	movs r0, #0
	mov r2, r8
	strh r0, [r2, #0x3c]
	ldr r6, [sp, #0xc]
	strb r1, [r6]
	ldr r4, _0808A36C @ =0x0200D650
	adds r0, r4, #0
	bl ClearText
	adds r0, r4, #0
	movs r1, #0
	bl Text_SetCursor
	adds r0, r4, #0
	movs r1, #0
	bl Text_SetColor
	ldr r1, _0808A370 @ =gUnk_0842CE14
	adds r0, r4, #0
	bl Text_DrawString
	ldr r1, _0808A374 @ =gBg2Tm + 0x146
	adds r0, r4, #0
	bl PutText
	ldr r1, _0808A378 @ =0x0200E66C
	movs r2, #0xff
	adds r0, r1, #0
	adds r0, #0x4c
_0808A358:
	str r2, [r0]
	subs r0, #4
	cmp r0, r1
	bge _0808A358
	mov r0, r8
	ldrh r0, [r0, #0x3e]
	lsrs r4, r0, #4
	adds r0, r4, #6
	b _0808A39A
	.align 2, 0
_0808A36C: .4byte 0x0200D650
_0808A370: .4byte gUnk_0842CE14
_0808A374: .4byte gBg2Tm + 0x146
_0808A378: .4byte 0x0200E66C
_0808A37C:
	lsls r1, r4, #0x18
	lsrs r1, r1, #0x18
	mov r2, sl
	ldrb r3, [r2]
	movs r0, #1
	str r0, [sp]
	mov r0, r8
	ldr r2, _0808A4B4 @ =gBg0Tm
	bl sub_808B654
	adds r4, #1
	mov r6, r8
	ldrh r6, [r6, #0x3e]
	lsrs r0, r6, #4
	adds r0, #6
_0808A39A:
	cmp r4, r0
	bge _0808A3A6
	ldr r0, _0808A4B8 @ =0x0200E668
	ldrb r0, [r0]
	cmp r4, r0
	blt _0808A37C
_0808A3A6:
	ldr r1, [sp, #0x10]
	ldrb r0, [r1]
	mov r2, sl
	ldrb r1, [r2]
	movs r2, #1
	bl sub_808B5E4
	ldr r7, _0808A4BC @ =gDispIo
	movs r0, #0x20
	ldrb r6, [r7, #1]
	orrs r0, r6
	movs r1, #0x41
	rsbs r1, r1, #0
	ands r0, r1
	movs r1, #0x7f
	ands r0, r1
	strb r0, [r7, #1]
	adds r1, r7, #0
	adds r1, #0x2d
	movs r5, #0x10
	movs r0, #0x10
	strb r0, [r1]
	adds r1, #4
	movs r0, #0x38
	strb r0, [r1]
	subs r1, #5
	movs r0, #0xe0
	strb r0, [r1]
	adds r1, #4
	movs r0, #0x98
	strb r0, [r1]
	adds r2, r7, #0
	adds r2, #0x34
	movs r0, #1
	mov sb, r0
	ldrb r0, [r2]
	mov r1, sb
	orrs r0, r1
	movs r4, #2
	orrs r0, r4
	movs r3, #4
	orrs r0, r3
	movs r1, #8
	orrs r0, r1
	orrs r0, r5
	strb r0, [r2]
	adds r2, #2
	movs r0, #2
	rsbs r0, r0, #0
	ldrb r6, [r2]
	ands r0, r6
	orrs r0, r4
	orrs r0, r3
	orrs r0, r1
	orrs r0, r5
	strb r0, [r2]
	movs r0, #0xf
	bl EnableBgSync
	movs r0, #3
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	movs r0, #2
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	movs r0, #1
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	mov r0, r8
	ldrh r2, [r0, #0x3e]
	subs r2, #0x38
	movs r0, #0xff
	ands r2, r0
	movs r0, #0
	movs r1, #0
	bl SetBgOffset
	movs r1, #4
	rsbs r1, r1, #0
	adds r0, r1, #0
	ldrb r2, [r7, #0xc]
	ands r0, r2
	strb r0, [r7, #0xc]
	adds r0, r1, #0
	ldrb r6, [r7, #0x10]
	ands r0, r6
	orrs r0, r4
	strb r0, [r7, #0x10]
	ldrb r0, [r7, #0x14]
	ands r1, r0
	mov r2, sb
	orrs r1, r2
	strb r1, [r7, #0x14]
	movs r0, #3
	ldrb r6, [r7, #0x18]
	orrs r0, r6
	strb r0, [r7, #0x18]
	ldr r0, _0808A4C0 @ =gUnk_08427A48
	ldr r1, _0808A4C4 @ =gBg1Tm + 0x500
	bl Decompress
	ldr r0, _0808A4C8 @ =gUnk_0841E45C
	movs r1, #0xf0
	lsls r1, r1, #1
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r0, _0808A4CC @ =gUnk_08D8B98C
	mov r1, r8
	bl Proc_Start
	mov r1, r8
	str r0, [r1, #0x40]
	ldr r2, [sp, #0x18]
	ldrb r2, [r2]
	cmp r2, #1
	bne _0808A4D0
	bl CheckInLinkArena
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0808A4D0
	movs r0, #0
	movs r1, #0xa
	bl StartPrepMuralBackground
	mov r6, r8
	str r0, [r6, #0x44]
	b _0808A4DE
	.align 2, 0
_0808A4B4: .4byte gBg0Tm
_0808A4B8: .4byte 0x0200E668
_0808A4BC: .4byte gDispIo
_0808A4C0: .4byte gUnk_08427A48
_0808A4C4: .4byte gBg1Tm + 0x500
_0808A4C8: .4byte gUnk_0841E45C
_0808A4CC: .4byte gUnk_08D8B98C
_0808A4D0:
	movs r0, #0
	movs r1, #0
	movs r2, #0xa
	bl StartMuralBackgroundAlt
	mov r1, r8
	str r0, [r1, #0x44]
_0808A4DE:
	movs r1, #1
	rsbs r1, r1, #0
	movs r0, #0
	bl LoadHelpBoxGfx
	add sp, #0x1c
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_808A4F8
sub_808A4F8: @ 0x0808A4F8
	push {lr}
	adds r3, r0, #0
	adds r0, #0x29
	movs r1, #0
	strb r1, [r0]
	adds r0, #8
	movs r2, #1
	strb r2, [r0]
	subs r0, #5
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r0, #3
	strb r1, [r0]
	adds r0, #9
	ldrb r0, [r0]
	cmp r0, #3
	bne _0808A524
	adds r0, r3, #0
	adds r0, #0x2f
	strb r1, [r0]
	b _0808A52A
_0808A524:
	adds r0, r3, #0
	adds r0, #0x2f
	strb r2, [r0]
_0808A52A:
	ldrb r0, [r0]
	adds r2, r3, #0
	adds r2, #0x36
	movs r1, #0
	strb r0, [r2]
	movs r2, #0
	strh r1, [r3, #0x3e]
	adds r1, r3, #0
	adds r1, #0x32
	movs r0, #1
	strb r0, [r1]
	subs r1, #8
	strb r2, [r1]
	adds r1, #9
	strb r0, [r1]
	adds r0, r3, #0
	adds r0, #0x34
	strb r2, [r0]
	adds r0, #1
	strb r2, [r0]
	adds r0, r3, #0
	bl sub_808A0F4
	pop {r0}
	bx r0

	thumb_func_start sub_808A55C
sub_808A55C: @ 0x0808A55C
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r2, r0, #0
	adds r5, r1, #0
	adds r0, r5, #0
	adds r0, #0x3a
	adds r6, r5, #0
	adds r6, #0x3b
	ldrb r0, [r0]
	ldrb r1, [r6]
	cmp r0, r1
	bls _0808A5E4
	ldr r0, [r2, #0xc]
	movs r1, #0xb
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r2, #0xc]
	ldr r0, [r2]
	ldrb r0, [r0, #4]
	bl RegisterSioPid
	ldrh r0, [r5, #0x3e]
	lsrs r4, r0, #4
	adds r0, r4, #6
	b _0808A5AC
_0808A58E:
	lsls r1, r4, #0x18
	lsrs r1, r1, #0x18
	adds r0, r5, #0
	adds r0, #0x2f
	ldrb r3, [r0]
	movs r0, #1
	str r0, [sp]
	adds r0, r5, #0
	ldr r2, _0808A5D4 @ =gBg0Tm
	bl sub_808B654
	adds r4, #1
	ldrh r1, [r5, #0x3e]
	lsrs r0, r1, #4
	adds r0, #6
_0808A5AC:
	cmp r4, r0
	bge _0808A5B8
	ldr r0, _0808A5D8 @ =0x0200E668
	ldrb r0, [r0]
	cmp r4, r0
	blt _0808A58E
_0808A5B8:
	ldrb r0, [r6]
	adds r0, #1
	strb r0, [r6]
	ldr r0, _0808A5DC @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0808A5F8
	ldr r0, _0808A5E0 @ =0x0000038A
	bl m4aSongNumStart
	b _0808A5F8
	.align 2, 0
_0808A5D4: .4byte gBg0Tm
_0808A5D8: .4byte 0x0200E668
_0808A5DC: .4byte gPlaySt
_0808A5E0: .4byte 0x0000038A
_0808A5E4:
	ldr r0, _0808A600 @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0808A5F8
	movs r0, #0xe3
	lsls r0, r0, #2
	bl m4aSongNumStart
_0808A5F8:
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0808A600: .4byte gPlaySt

	thumb_func_start sub_808A604
sub_808A604: @ 0x0808A604
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r0, [r4]
	ldrb r0, [r0, #4]
	bl IsCharacterForceDeployed
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0808A68C
	ldr r0, [r4, #0xc]
	movs r1, #0xa
	orrs r0, r1
	str r0, [r4, #0xc]
	ldr r0, [r4]
	ldrb r0, [r0, #4]
	bl RemoveSioPid
	ldrh r0, [r5, #0x3e]
	lsrs r4, r0, #4
	adds r0, r4, #6
	adds r6, r5, #0
	adds r6, #0x3b
	b _0808A654
_0808A636:
	lsls r1, r4, #0x18
	lsrs r1, r1, #0x18
	adds r0, r5, #0
	adds r0, #0x2f
	ldrb r3, [r0]
	movs r0, #1
	str r0, [sp]
	adds r0, r5, #0
	ldr r2, _0808A67C @ =gBg0Tm
	bl sub_808B654
	adds r4, #1
	ldrh r1, [r5, #0x3e]
	lsrs r0, r1, #4
	adds r0, #6
_0808A654:
	cmp r4, r0
	bge _0808A660
	ldr r0, _0808A680 @ =0x0200E668
	ldrb r0, [r0]
	cmp r4, r0
	blt _0808A636
_0808A660:
	ldrb r0, [r6]
	subs r0, #1
	strb r0, [r6]
	ldr r0, _0808A684 @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0808A6A0
	ldr r0, _0808A688 @ =0x0000038B
	bl m4aSongNumStart
	b _0808A6A0
	.align 2, 0
_0808A67C: .4byte gBg0Tm
_0808A680: .4byte 0x0200E668
_0808A684: .4byte gPlaySt
_0808A688: .4byte 0x0000038B
_0808A68C:
	ldr r0, _0808A6A8 @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0808A6A0
	movs r0, #0xe3
	lsls r0, r0, #2
	bl m4aSongNumStart
_0808A6A0:
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0808A6A8: .4byte gPlaySt

	thumb_func_start sub_808A6AC
sub_808A6AC: @ 0x0808A6AC
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r0, #0x30
	ldr r1, _0808A6D8 @ =0x0200CBF0
	ldrb r0, [r0]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	ldr r5, [r0]
	ldr r1, [r5, #0xc]
	movs r0, #0x80
	lsls r0, r0, #0x12
	ands r0, r1
	cmp r0, #0
	beq _0808A6E0
	adds r0, r4, #0
	adds r0, #0x2c
	ldrb r0, [r0]
	lsls r1, r0, #4
	adds r1, #0x38
	ldr r2, _0808A6DC @ =0x000003B6
	b _0808A70A
	.align 2, 0
_0808A6D8: .4byte 0x0200CBF0
_0808A6DC: .4byte 0x000003B6
_0808A6E0:
	movs r0, #8
	ands r1, r0
	cmp r1, #0
	beq _0808A722
	bl CheckInLinkArena
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0808A718
	adds r0, r5, #0
	bl sub_80916F4
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0808A718
	adds r0, r4, #0
	adds r0, #0x2c
	ldrb r0, [r0]
	lsls r1, r0, #4
	adds r1, #0x38
	ldr r2, _0808A714 @ =0x000003B2
_0808A70A:
	movs r0, #0
	adds r3, r4, #0
	bl sub_8091664
	b _0808A72A
	.align 2, 0
_0808A714: .4byte 0x000003B2
_0808A718:
	adds r0, r5, #0
	adds r1, r4, #0
	bl sub_808A55C
	b _0808A72A
_0808A722:
	adds r0, r5, #0
	adds r1, r4, #0
	bl sub_808A604
_0808A72A:
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start sub_808A730
sub_808A730: @ 0x0808A730
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	adds r2, r1, #0
	ldr r0, [r6]
	ldr r1, [r6, #4]
	ldr r0, [r0, #0x28]
	ldr r1, [r1, #0x28]
	orrs r0, r1
	movs r1, #0x80
	lsls r1, r1, #2
	ands r0, r1
	cmp r0, #0
	beq _0808A764
	ldr r0, _0808A760 @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0808A7BE
	movs r0, #0xe3
	lsls r0, r0, #2
	bl m4aSongNumStart
	b _0808A7BE
	.align 2, 0
_0808A760: .4byte gPlaySt
_0808A764:
	ldr r4, [r6, #0xc]
	movs r5, #0xc0
	lsls r5, r5, #8
	adds r0, r4, #0
	ands r0, r5
	lsrs r1, r0, #0xe
	adds r0, r1, r2
	adds r0, #3
	movs r1, #3
	bl __modsi3
	lsls r1, r0, #0xe
	ldr r0, _0808A7A0 @ =0xFFFF3FFF
	ands r4, r0
	orrs r4, r1
	str r4, [r6, #0xc]
	ands r1, r5
	cmp r1, #0
	beq _0808A7AC
	ldr r0, _0808A7A4 @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0808A7BE
	ldr r0, _0808A7A8 @ =0x0000038A
	bl m4aSongNumStart
	b _0808A7BE
	.align 2, 0
_0808A7A0: .4byte 0xFFFF3FFF
_0808A7A4: .4byte gPlaySt
_0808A7A8: .4byte 0x0000038A
_0808A7AC:
	ldr r0, _0808A7C4 @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0808A7BE
	ldr r0, _0808A7C8 @ =0x0000038B
	bl m4aSongNumStart
_0808A7BE:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0808A7C4: .4byte gPlaySt
_0808A7C8: .4byte 0x0000038B

	thumb_func_start sub_808A7CC
sub_808A7CC: @ 0x0808A7CC
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #4
	adds r5, r0, #0
	ldr r2, _0808A7F4 @ =gpKeySt
	ldr r1, [r2]
	movs r0, #0x80
	lsls r0, r0, #2
	ldrh r1, [r1, #4]
	ands r0, r1
	mov ip, r2
	cmp r0, #0
	beq _0808A7F8
	adds r1, r5, #0
	adds r1, #0x31
	movs r0, #2
	b _0808A7FE
	.align 2, 0
_0808A7F4: .4byte gpKeySt
_0808A7F8:
	adds r1, r5, #0
	adds r1, #0x31
	movs r0, #1
_0808A7FE:
	strb r0, [r1]
	mov r8, r1
	mov r0, ip
	ldr r3, [r0]
	ldrh r4, [r3, #8]
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r4
	lsls r0, r0, #0x10
	lsrs r7, r0, #0x10
	cmp r7, #0
	beq _0808A820
	adds r0, r5, #0
	movs r1, #3
	bl Proc_Goto
	b _0808AB62
_0808A820:
	movs r1, #1
	mov sb, r1
	mov r6, sb
	ands r6, r4
	cmp r6, #0
	beq _0808A890
	adds r0, r5, #0
	adds r0, #0x39
	ldrb r0, [r0]
	cmp r0, #1
	beq _0808A848
	cmp r0, #1
	bgt _0808A840
	cmp r0, #0
	beq _0808A850
	b _0808AB62
_0808A840:
	cmp r0, #3
	bne _0808A846
	b _0808A946
_0808A846:
	b _0808AB62
_0808A848:
	adds r0, r5, #0
	bl sub_808A6AC
	b _0808AB62
_0808A850:
	ldr r1, _0808A884 @ =0x0200CBF0
	adds r0, r5, #0
	adds r0, #0x30
	ldrb r0, [r0]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	ldr r0, [r0]
	ldrb r0, [r0, #0xb]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl SetStatScreenLastUnitId
	ldr r0, _0808A888 @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0808A87C
	ldr r0, _0808A88C @ =0x0000038A
	bl m4aSongNumStart
_0808A87C:
	adds r0, r5, #0
	bl Proc_Break
	b _0808AB62
	.align 2, 0
_0808A884: .4byte 0x0200CBF0
_0808A888: .4byte gPlaySt
_0808A88C: .4byte 0x0000038A
_0808A890:
	ldrh r1, [r3, #6]
	movs r2, #0x20
	adds r0, r2, #0
	ands r0, r1
	lsls r0, r0, #0x10
	lsrs r7, r0, #0x10
	cmp r7, #0
	beq _0808A928
	adds r0, r5, #0
	adds r0, #0x39
	ldrb r0, [r0]
	cmp r0, #3
	bne _0808A8E4
	adds r0, r2, #0
	ands r0, r4
	cmp r0, #0
	bne _0808A8B4
	b _0808AB62
_0808A8B4:
	ldr r1, _0808A8DC @ =0x0200CBF0
	adds r4, r5, #0
	adds r4, #0x30
	ldrb r3, [r4]
	lsls r0, r3, #2
	adds r0, r0, r1
	ldr r0, [r0]
	ldr r0, [r0]
	movs r1, #1
	rsbs r1, r1, #0
	bl sub_808A730
	ldrb r1, [r4]
	ldr r2, _0808A8E0 @ =gBg0Tm
	adds r0, r5, #0
	adds r0, #0x2f
	ldrb r3, [r0]
	str r6, [sp]
	b _0808A968
	.align 2, 0
_0808A8DC: .4byte 0x0200CBF0
_0808A8E0: .4byte gBg0Tm
_0808A8E4:
	adds r0, r5, #0
	adds r0, #0x2f
	ldrb r0, [r0]
	cmp r0, #1
	bhi _0808A8F0
	b _0808AB62
_0808A8F0:
	adds r1, r5, #0
	adds r1, #0x36
	ldrb r0, [r1]
	subs r0, #1
	strb r0, [r1]
	adds r0, r5, #0
	movs r1, #2
	bl Proc_Goto
	adds r0, r5, #0
	adds r0, #0x2d
	strb r6, [r0]
	ldr r0, _0808A920 @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	bge _0808A916
	b _0808AB62
_0808A916:
	ldr r0, _0808A924 @ =0x0000038F
	bl m4aSongNumStart
	b _0808AB62
	.align 2, 0
_0808A920: .4byte gPlaySt
_0808A924: .4byte 0x0000038F
_0808A928:
	movs r6, #0x10
	adds r0, r6, #0
	ands r0, r1
	cmp r0, #0
	beq _0808A9C0
	adds r0, r5, #0
	adds r0, #0x39
	ldrb r0, [r0]
	cmp r0, #3
	bne _0808A978
	adds r0, r6, #0
	ands r0, r4
	cmp r0, #0
	bne _0808A946
	b _0808AB62
_0808A946:
	ldr r1, _0808A970 @ =0x0200CBF0
	adds r4, r5, #0
	adds r4, #0x30
	ldrb r2, [r4]
	lsls r0, r2, #2
	adds r0, r0, r1
	ldr r0, [r0]
	ldr r0, [r0]
	movs r1, #1
	bl sub_808A730
	ldrb r1, [r4]
	ldr r2, _0808A974 @ =gBg0Tm
	adds r0, r5, #0
	adds r0, #0x2f
	ldrb r3, [r0]
	str r7, [sp]
_0808A968:
	adds r0, r5, #0
	bl sub_808B654
	b _0808AB62
	.align 2, 0
_0808A970: .4byte 0x0200CBF0
_0808A974: .4byte gBg0Tm
_0808A978:
	adds r0, r5, #0
	adds r0, #0x2f
	adds r1, r5, #0
	adds r1, #0x2e
	ldrb r0, [r0]
	ldrb r1, [r1]
	cmp r0, r1
	blo _0808A98A
	b _0808AB62
_0808A98A:
	adds r1, r5, #0
	adds r1, #0x36
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	adds r0, r5, #0
	adds r0, #0x2d
	strb r7, [r0]
	ldr r0, _0808A9B8 @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0808A9AC
	ldr r0, _0808A9BC @ =0x0000038F
	bl m4aSongNumStart
_0808A9AC:
	adds r0, r5, #0
	movs r1, #2
	bl Proc_Goto
	b _0808AB62
	.align 2, 0
_0808A9B8: .4byte gPlaySt
_0808A9BC: .4byte 0x0000038F
_0808A9C0:
	movs r7, #0x40
	adds r0, r7, #0
	ands r0, r1
	cmp r0, #0
	bne _0808A9E0
	movs r0, #0x80
	lsls r0, r0, #2
	ldrh r1, [r3, #4]
	ands r0, r1
	cmp r0, #0
	beq _0808AAAA
	adds r0, r7, #0
	ldrh r3, [r3, #0x10]
	ands r0, r3
	cmp r0, #0
	beq _0808AAAA
_0808A9E0:
	adds r6, r5, #0
	adds r6, #0x30
	ldrb r0, [r6]
	cmp r0, #0
	bne _0808AA18
	adds r0, r7, #0
	ands r0, r4
	cmp r0, #0
	bne _0808A9F4
	b _0808AB62
_0808A9F4:
	ldr r0, _0808AA10 @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0808AA06
	ldr r0, _0808AA14 @ =0x00000386
	bl m4aSongNumStart
_0808AA06:
	adds r1, r5, #0
	adds r1, #0x29
	movs r0, #3
	strb r0, [r1]
	b _0808AB62
	.align 2, 0
_0808AA10: .4byte gPlaySt
_0808AA14: .4byte 0x00000386
_0808AA18:
	subs r0, #1
	strb r0, [r6]
	ldr r0, _0808AA98 @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0808AA2E
	ldr r0, _0808AA9C @ =0x00000386
	bl m4aSongNumStart
_0808AA2E:
	adds r0, r5, #0
	adds r0, #0x2c
	ldrb r1, [r0]
	adds r4, r0, #0
	cmp r1, #1
	bhi _0808AAA4
	ldrh r2, [r5, #0x3e]
	lsrs r0, r2, #4
	cmp r0, #0
	beq _0808AAA4
	cmp r1, #0
	bne _0808AA50
	ldrb r0, [r6]
	adds r0, #1
	strb r0, [r6]
	movs r0, #1
	strb r0, [r4]
_0808AA50:
	ldrh r3, [r5, #0x3e]
	lsrs r1, r3, #4
	subs r1, #1
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	ldr r2, _0808AAA0 @ =gBg0Tm
	adds r0, r5, #0
	adds r0, #0x2f
	ldrb r3, [r0]
	mov r0, sb
	str r0, [sp]
	adds r0, r5, #0
	bl sub_808B654
	adds r1, r5, #0
	adds r1, #0x29
	movs r0, #2
	strb r0, [r1]
	mov r1, r8
	ldrb r1, [r1]
	lsls r2, r1, #2
	ldrh r3, [r5, #0x3e]
	subs r2, r3, r2
	strh r2, [r5, #0x3e]
	subs r2, #0x38
	movs r0, #0xff
	ands r2, r0
	movs r0, #0
	movs r1, #0
	bl SetBgOffset
	ldrb r0, [r4]
	cmp r0, #0
	bne _0808AB62
	b _0808AB5E
	.align 2, 0
_0808AA98: .4byte gPlaySt
_0808AA9C: .4byte 0x00000386
_0808AAA0: .4byte gBg0Tm
_0808AAA4:
	ldrb r0, [r4]
	subs r0, #1
	b _0808AB60
_0808AAAA:
	mov r0, ip
	ldr r2, [r0]
	movs r1, #0x80
	adds r0, r1, #0
	ldrh r3, [r2, #6]
	ands r0, r3
	cmp r0, #0
	bne _0808AAD0
	movs r0, #0x80
	lsls r0, r0, #2
	ldrh r3, [r2, #4]
	ands r0, r3
	cmp r0, #0
	beq _0808AB62
	adds r0, r1, #0
	ldrh r2, [r2, #0x10]
	ands r0, r2
	cmp r0, #0
	beq _0808AB62
_0808AAD0:
	adds r6, r5, #0
	adds r6, #0x30
	ldrb r1, [r6]
	ldr r7, _0808AB4C @ =0x0200E668
	ldrb r0, [r7]
	subs r0, #1
	cmp r1, r0
	bge _0808AB62
	adds r0, r1, #1
	strb r0, [r6]
	ldr r0, _0808AB50 @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0808AAF6
	ldr r0, _0808AB54 @ =0x00000386
	bl m4aSongNumStart
_0808AAF6:
	adds r0, r5, #0
	adds r0, #0x2c
	adds r4, r0, #0
	ldrb r0, [r4]
	cmp r0, #4
	bne _0808AB5C
	ldrb r1, [r6]
	ldrb r0, [r7]
	subs r0, #1
	cmp r1, r0
	beq _0808AB5C
	ldrh r2, [r5, #0x3e]
	lsrs r1, r2, #4
	adds r1, #6
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	ldr r2, _0808AB58 @ =gBg0Tm
	adds r0, r5, #0
	adds r0, #0x2f
	ldrb r3, [r0]
	movs r4, #1
	str r4, [sp]
	adds r0, r5, #0
	bl sub_808B654
	adds r0, r5, #0
	adds r0, #0x29
	strb r4, [r0]
	mov r3, r8
	ldrb r3, [r3]
	lsls r2, r3, #2
	ldrh r0, [r5, #0x3e]
	adds r2, r0, r2
	strh r2, [r5, #0x3e]
	subs r2, #0x38
	movs r0, #0xff
	ands r2, r0
	movs r0, #0
	movs r1, #0
	bl SetBgOffset
	b _0808AB62
	.align 2, 0
_0808AB4C: .4byte 0x0200E668
_0808AB50: .4byte gPlaySt
_0808AB54: .4byte 0x00000386
_0808AB58: .4byte gBg0Tm
_0808AB5C:
	ldrb r0, [r4]
_0808AB5E:
	adds r0, #1
_0808AB60:
	strb r0, [r4]
_0808AB62:
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_808AB70
sub_808AB70: @ 0x0808AB70
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	adds r7, r0, #0
	adds r4, r7, #0
	adds r4, #0x2b
	ldrb r0, [r4]
	ldr r2, _0808ABA4 @ =gpKeySt
	cmp r0, #0
	beq _0808ABA8
	ldr r1, [r2]
	movs r0, #0x81
	lsls r0, r0, #1
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _0808ABA8
	bl CloseHelpBox
	movs r0, #0
	strb r0, [r4]
	b _0808AE50
	.align 2, 0
_0808ABA4: .4byte gpKeySt
_0808ABA8:
	ldr r1, [r2]
	movs r0, #1
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _0808AC94
	adds r0, r7, #0
	adds r0, #0x2b
	ldrb r0, [r0]
	cmp r0, #0
	bne _0808AC94
	adds r1, r7, #0
	adds r1, #0x32
	ldrb r0, [r1]
	str r0, [sp, #4]
	adds r2, r7, #0
	adds r2, #0x2a
	movs r0, #1
	strb r0, [r2]
	ldr r0, _0808AC30 @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	mov r8, r1
	cmp r0, #0
	blt _0808ABE2
	ldr r0, _0808AC34 @ =0x0000038A
	bl m4aSongNumStart
_0808ABE2:
	ldr r1, _0808AC38 @ =gUnk_08D8BB00
	adds r6, r7, #0
	adds r6, #0x2d
	adds r5, r7, #0
	adds r5, #0x2f
	ldrb r2, [r5]
	lsls r0, r2, #3
	adds r0, r0, r2
	ldrb r3, [r6]
	adds r0, r3, r0
	lsls r0, r0, #4
	adds r0, r0, r1
	ldrb r0, [r0]
	mov r4, r8
	strb r0, [r4]
	adds r4, r7, #0
	adds r4, #0x33
	ldrb r0, [r4]
	adds r0, #1
	movs r1, #1
	ands r0, r1
	strb r0, [r4]
	mov r1, r8
	ldrb r0, [r1]
	ldrb r1, [r4]
	bl SortUnitList
	lsls r0, r0, #0x18
	mov sb, r4
	movs r2, #0x34
	adds r2, r2, r7
	mov sl, r2
	adds r3, r7, #0
	adds r3, #0x35
	str r3, [sp, #8]
	cmp r0, #0
	beq _0808AC68
	movs r4, #0
	b _0808AC54
	.align 2, 0
_0808AC30: .4byte gPlaySt
_0808AC34: .4byte 0x0000038A
_0808AC38: .4byte gUnk_08D8BB00
_0808AC3C:
	lsls r1, r4, #0x18
	lsrs r1, r1, #0x18
	ldrb r3, [r5]
	movs r0, #1
	str r0, [sp]
	adds r0, r7, #0
	ldr r2, _0808AC8C @ =gBg0Tm
	bl sub_808B654
	adds r4, #1
	cmp r4, #5
	bgt _0808AC5C
_0808AC54:
	ldr r0, _0808AC90 @ =0x0200E668
	ldrb r0, [r0]
	cmp r4, r0
	blt _0808AC3C
_0808AC5C:
	ldrh r0, [r7, #0x3e]
	bl sub_8089720
	movs r0, #1
	bl EnableBgSync
_0808AC68:
	mov r4, sb
	ldrb r0, [r4]
	mov r1, sl
	strb r0, [r1]
	ldrb r0, [r6]
	ldr r2, [sp, #8]
	strb r0, [r2]
	mov r3, r8
	ldrb r3, [r3]
	ldr r4, [sp, #4]
	cmp r3, r4
	bne _0808AC82
	b _0808AE50
_0808AC82:
	mov r6, r8
	ldrb r0, [r6]
	bl sub_8089638
	b _0808AE50
	.align 2, 0
_0808AC8C: .4byte gBg0Tm
_0808AC90: .4byte 0x0200E668
_0808AC94:
	ldr r1, [r2]
	movs r0, #0x80
	ldrh r1, [r1, #6]
	ands r0, r1
	cmp r0, #0
	beq _0808ACD4
	adds r0, r7, #0
	adds r0, #0x2b
	ldrb r4, [r0]
	cmp r4, #0
	bne _0808ACD4
	ldr r0, _0808ACCC @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0808ACBC
	ldr r0, _0808ACD0 @ =0x00000386
	bl m4aSongNumStart
_0808ACBC:
	adds r1, r7, #0
	adds r1, #0x33
	movs r0, #1
	strb r0, [r1]
	adds r0, r7, #0
	adds r0, #0x29
	strb r4, [r0]
	b _0808AE50
	.align 2, 0
_0808ACCC: .4byte gPlaySt
_0808ACD0: .4byte 0x00000386
_0808ACD4:
	ldr r1, [r2]
	ldrh r2, [r1, #6]
	movs r0, #0x20
	ands r0, r2
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	cmp r4, #0
	beq _0808AD6E
	adds r1, r7, #0
	adds r1, #0x33
	movs r0, #1
	strb r0, [r1]
	subs r1, #6
	ldrb r0, [r1]
	adds r6, r1, #0
	cmp r0, #0
	bne _0808AD68
	adds r0, r7, #0
	adds r0, #0x2f
	ldrb r0, [r0]
	cmp r0, #1
	bhi _0808AD02
	b _0808AE50
_0808AD02:
	adds r0, r7, #0
	adds r0, #0x39
	ldrb r0, [r0]
	cmp r0, #3
	bne _0808AD0E
	b _0808AE50
_0808AD0E:
	ldr r0, _0808AD5C @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0808AD20
	ldr r0, _0808AD60 @ =0x0000038F
	bl m4aSongNumStart
_0808AD20:
	adds r1, r7, #0
	adds r1, #0x36
	ldrb r0, [r1]
	subs r0, #1
	strb r0, [r1]
	movs r4, #8
	ldr r2, _0808AD64 @ =gUnk_08D8BB00
	lsls r0, r0, #3
	ldrb r1, [r1]
	adds r0, r0, r1
	lsls r1, r0, #4
	adds r0, r1, #0
	adds r0, #0x80
	adds r0, r0, r2
	ldrb r0, [r0, #8]
	cmp r0, #0
	bne _0808AD56
	adds r0, r1, r2
	adds r1, r0, #0
	adds r1, #0x80
_0808AD48:
	subs r1, #0x10
	subs r4, #1
	cmp r4, #0
	ble _0808AD56
	ldrb r0, [r1, #8]
	cmp r0, #0
	beq _0808AD48
_0808AD56:
	strb r4, [r6]
	b _0808ADD8
	.align 2, 0
_0808AD5C: .4byte gPlaySt
_0808AD60: .4byte 0x0000038F
_0808AD64: .4byte gUnk_08D8BB00
_0808AD68:
	subs r0, #1
	strb r0, [r1]
	b _0808ADF2
_0808AD6E:
	movs r0, #0x10
	ands r0, r2
	cmp r0, #0
	beq _0808AE10
	adds r1, r7, #0
	adds r1, #0x33
	movs r0, #1
	strb r0, [r1]
	adds r2, r7, #0
	adds r2, #0x2d
	adds r5, r7, #0
	adds r5, #0x2f
	ldrb r0, [r2]
	cmp r0, #8
	beq _0808ADA4
	ldr r0, _0808ADE4 @ =gUnk_08D8BB00
	ldrb r3, [r2]
	adds r3, #1
	ldrb r6, [r5]
	lsls r1, r6, #3
	adds r1, r1, r6
	adds r1, r1, r3
	lsls r1, r1, #4
	adds r1, r1, r0
	ldrb r0, [r1, #8]
	cmp r0, #0
	bne _0808ADF0
_0808ADA4:
	adds r0, r7, #0
	adds r0, #0x2e
	ldrb r5, [r5]
	ldrb r0, [r0]
	cmp r5, r0
	bhs _0808AE50
	adds r0, r7, #0
	adds r0, #0x39
	ldrb r0, [r0]
	cmp r0, #3
	beq _0808AE50
	strb r4, [r2]
	ldr r0, _0808ADE8 @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0808ADCE
	ldr r0, _0808ADEC @ =0x0000038F
	bl m4aSongNumStart
_0808ADCE:
	adds r1, r7, #0
	adds r1, #0x36
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
_0808ADD8:
	adds r0, r7, #0
	movs r1, #2
	bl Proc_Goto
	b _0808AE50
	.align 2, 0
_0808ADE4: .4byte gUnk_08D8BB00
_0808ADE8: .4byte gPlaySt
_0808ADEC: .4byte 0x0000038F
_0808ADF0:
	strb r3, [r2]
_0808ADF2:
	ldr r0, _0808AE08 @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0808AE50
	ldr r0, _0808AE0C @ =0x00000387
	bl m4aSongNumStart
	b _0808AE50
	.align 2, 0
_0808AE08: .4byte gPlaySt
_0808AE0C: .4byte 0x00000387
_0808AE10:
	movs r0, #0x80
	lsls r0, r0, #1
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _0808AE50
	adds r1, r7, #0
	adds r1, #0x2b
	ldrb r0, [r1]
	cmp r0, #0
	bne _0808AE50
	movs r0, #1
	strb r0, [r1]
	ldr r2, _0808AE60 @ =gUnk_08D8BB00
	adds r3, r7, #0
	adds r3, #0x2d
	adds r0, r7, #0
	adds r0, #0x2f
	ldrb r4, [r0]
	lsls r1, r4, #3
	adds r1, r1, r4
	ldrb r3, [r3]
	adds r1, r3, r1
	lsls r1, r1, #4
	adds r0, r1, r2
	ldrb r0, [r0, #8]
	adds r2, #0xc
	adds r1, r1, r2
	ldr r2, [r1]
	movs r1, #0x28
	bl StartHelpBox
_0808AE50:
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0808AE60: .4byte gUnk_08D8BB00

	thumb_func_start sub_808AE64
sub_808AE64: @ 0x0808AE64
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r0, #0x2d
	ldrb r6, [r0]
	adds r5, r4, #0
	adds r5, #0x29
	ldrb r0, [r5]
	cmp r0, #1
	beq _0808AE9A
	cmp r0, #1
	bgt _0808AE80
	cmp r0, #0
	beq _0808AE8A
	b _0808AEFC
_0808AE80:
	cmp r0, #2
	beq _0808AECC
	cmp r0, #3
	beq _0808AE92
	b _0808AEFC
_0808AE8A:
	adds r0, r4, #0
	bl sub_808A7CC
	b _0808AEFC
_0808AE92:
	adds r0, r4, #0
	bl sub_808AB70
	b _0808AEFC
_0808AE9A:
	adds r0, r4, #0
	adds r0, #0x31
	ldrb r0, [r0]
	lsls r2, r0, #2
	ldrh r0, [r4, #0x3e]
	adds r2, r0, r2
	strh r2, [r4, #0x3e]
	subs r2, #0x38
	movs r0, #0xff
	ands r2, r0
	movs r0, #0
	movs r1, #0
	bl SetBgOffset
	movs r0, #0xf
	ldrh r1, [r4, #0x3e]
	ands r0, r1
	cmp r0, #0
	bne _0808AEFC
	movs r0, #0
	strb r0, [r5]
	ldrh r0, [r4, #0x3e]
	bl sub_8089720
	b _0808AEFC
_0808AECC:
	adds r0, r4, #0
	adds r0, #0x31
	ldrb r0, [r0]
	lsls r2, r0, #2
	ldrh r0, [r4, #0x3e]
	subs r2, r0, r2
	strh r2, [r4, #0x3e]
	subs r2, #0x38
	movs r0, #0xff
	ands r2, r0
	movs r0, #0
	movs r1, #0
	bl SetBgOffset
	movs r0, #0xf
	ldrh r1, [r4, #0x3e]
	ands r0, r1
	cmp r0, #0
	bne _0808AEFC
	movs r0, #0
	strb r0, [r5]
	ldrh r0, [r4, #0x3e]
	bl sub_8089720
_0808AEFC:
	ldr r0, _0808AF68 @ =gpKeySt
	ldr r1, [r0]
	movs r0, #2
	ldrh r1, [r1, #8]
	ands r0, r1
	adds r5, r4, #0
	adds r5, #0x2b
	cmp r0, #0
	beq _0808AF32
	ldrb r0, [r5]
	cmp r0, #0
	bne _0808AF38
	ldr r0, _0808AF6C @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0808AF26
	ldr r0, _0808AF70 @ =0x0000038B
	bl m4aSongNumStart
_0808AF26:
	movs r0, #0
	bl SetStatScreenLastUnitId
	adds r0, r4, #0
	bl Proc_Break
_0808AF32:
	ldrb r0, [r5]
	cmp r0, #0
	beq _0808AF60
_0808AF38:
	adds r0, r4, #0
	adds r0, #0x2d
	ldrb r3, [r0]
	cmp r6, r3
	beq _0808AF60
	ldr r2, _0808AF74 @ =gUnk_08D8BB00
	adds r0, #9
	ldrb r4, [r0]
	lsls r1, r4, #3
	adds r1, r1, r4
	adds r1, r1, r3
	lsls r1, r1, #4
	adds r0, r1, r2
	ldrb r0, [r0, #8]
	adds r2, #0xc
	adds r1, r1, r2
	ldr r2, [r1]
	movs r1, #0x28
	bl StartHelpBox
_0808AF60:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0808AF68: .4byte gpKeySt
_0808AF6C: .4byte gPlaySt
_0808AF70: .4byte 0x0000038B
_0808AF74: .4byte gUnk_08D8BB00

	thumb_func_start sub_808AF78
sub_808AF78: @ 0x0808AF78
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x39
	ldrb r0, [r0]
	cmp r0, #1
	bne _0808AFA0
	ldr r1, _0808B020 @ =0x0200CBF0
	adds r0, r4, #0
	adds r0, #0x30
	ldrb r0, [r0]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	ldr r0, [r0]
	ldr r0, [r0]
	ldrb r0, [r0, #4]
	bl PrepSetLatestCharId
	bl sub_808954C
_0808AFA0:
	ldr r2, _0808B024 @ =gPlaySt
	adds r0, r4, #0
	adds r0, #0x34
	ldrb r0, [r0]
	lsls r0, r0, #7
	adds r1, r4, #0
	adds r1, #0x32
	ldrb r1, [r1]
	adds r0, r1, r0
	strb r0, [r2, #0x1a]
	adds r0, r4, #0
	adds r0, #0x2f
	ldrb r1, [r0]
	cmp r1, #0
	beq _0808AFCA
	lsls r1, r1, #4
	movs r0, #0xf
	ldrb r3, [r2, #0x19]
	ands r0, r3
	orrs r0, r1
	strb r0, [r2, #0x19]
_0808AFCA:
	ldr r0, [r4, #0x40]
	bl Proc_End
	ldr r0, [r4, #0x44]
	cmp r0, #0
	beq _0808AFDA
	bl Proc_End
_0808AFDA:
	bl EndGreenText
	ldr r0, _0808B028 @ =gBg0Tm
	movs r1, #0
	bl TmFill
	ldr r0, _0808B02C @ =gBg1Tm
	movs r1, #0
	bl TmFill
	ldr r0, _0808B030 @ =gBg2Tm
	movs r1, #0
	bl TmFill
	movs r0, #0xf
	bl EnableBgSync
	ldr r2, _0808B034 @ =gDispIo
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
	bl ResetTextFont
	bl ClearIcons
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0808B020: .4byte 0x0200CBF0
_0808B024: .4byte gPlaySt
_0808B028: .4byte gBg0Tm
_0808B02C: .4byte gBg1Tm
_0808B030: .4byte gBg2Tm
_0808B034: .4byte gDispIo

	thumb_func_start sub_808B038
sub_808B038: @ 0x0808B038
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r5, r0, #0
	ldr r0, _0808B05C @ =0x0200CCF0
	movs r1, #0x1f
	movs r2, #0x1f
	movs r3, #0
	bl TmFillRect_thm
	ldrh r0, [r5, #0x3e]
	lsrs r4, r0, #4
	adds r0, r4, #6
	cmp r4, r0
	bge _0808B08A
	ldr r0, _0808B060 @ =0x0200E668
	adds r6, r5, #0
	adds r6, #0x2f
	b _0808B084
	.align 2, 0
_0808B05C: .4byte 0x0200CCF0
_0808B060: .4byte 0x0200E668
_0808B064:
	lsls r1, r4, #0x18
	lsrs r1, r1, #0x18
	ldrb r3, [r6]
	movs r0, #0
	str r0, [sp]
	adds r0, r5, #0
	ldr r2, _0808B0C0 @ =0x0200CCF0
	bl sub_808B654
	adds r4, #1
	ldrh r1, [r5, #0x3e]
	lsrs r0, r1, #4
	adds r0, #6
	cmp r4, r0
	bge _0808B08A
	ldr r0, _0808B0C4 @ =0x0200E668
_0808B084:
	ldrb r0, [r0]
	cmp r4, r0
	blt _0808B064
_0808B08A:
	ldr r4, _0808B0C8 @ =0x0200D4F0
	adds r0, r4, #0
	movs r1, #0x1f
	movs r2, #1
	movs r3, #0
	bl TmFillRect_thm
	adds r6, r5, #0
	adds r6, #0x2f
	ldrb r1, [r6]
	adds r0, r4, #0
	bl sub_808B520
	movs r1, #0
	movs r0, #0
	strh r0, [r5, #0x3c]
	ldrb r0, [r6]
	adds r2, r5, #0
	adds r2, #0x37
	strb r0, [r2]
	adds r0, r5, #0
	adds r0, #0x38
	strb r1, [r0]
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0808B0C0: .4byte 0x0200CCF0
_0808B0C4: .4byte 0x0200E668
_0808B0C8: .4byte 0x0200D4F0

	thumb_func_start sub_808B0CC
sub_808B0CC: @ 0x0808B0CC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x10
	adds r5, r0, #0
	adds r1, r5, #0
	adds r1, #0x38
	ldr r0, _0808B12C @ =gUnk_08D8B9B4
	ldrh r2, [r5, #0x3c]
	adds r0, r2, r0
	ldrb r2, [r1]
	ldrb r0, [r0]
	adds r0, r2, r0
	strb r0, [r1]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x14
	bls _0808B0F8
	movs r0, #0x14
	strb r0, [r1]
_0808B0F8:
	ldrh r0, [r5, #0x3c]
	adds r0, #1
	strh r0, [r5, #0x3c]
	movs r3, #0
	str r1, [sp, #0xc]
	adds r0, r5, #0
	adds r0, #0x36
	str r0, [sp, #8]
	movs r1, #0x2f
	adds r1, r1, r5
	mov sl, r1
	ldr r2, [sp, #0xc]
	str r2, [sp, #4]
_0808B112:
	ldr r0, [sp, #8]
	ldrb r1, [r0]
	mov r0, sl
	ldrb r0, [r0]
	cmp r1, r0
	bls _0808B130
	ldr r1, [sp, #4]
	ldrb r1, [r1]
	adds r0, r1, r3
	cmp r0, #0x14
	bgt _0808B138
	b _0808B13E
	.align 2, 0
_0808B12C: .4byte gUnk_08D8B9B4
_0808B130:
	ldr r2, [sp, #4]
	ldrb r0, [r2]
	cmp r3, r0
	bge _0808B13C
_0808B138:
	movs r1, #0
	b _0808B144
_0808B13C:
	subs r0, r3, r0
_0808B13E:
	adds r0, #8
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
_0808B144:
	ldrh r0, [r5, #0x3e]
	lsrs r4, r0, #3
	adds r0, r4, #0
	adds r0, #0xc
	lsls r6, r1, #1
	adds r1, r3, #1
	mov sb, r1
	cmp r4, r0
	bge _0808B188
	movs r2, #0x1f
	mov r8, r2
	ldr r0, _0808B204 @ =gBg0Tm
	mov ip, r0
	ldr r7, _0808B208 @ =0x0200CCF0
	adds r2, r6, #0
_0808B162:
	adds r0, r4, #0
	mov r1, r8
	ands r0, r1
	lsls r1, r0, #5
	adds r1, #8
	adds r1, r1, r3
	lsls r1, r1, #1
	add r1, ip
	lsls r0, r0, #6
	adds r0, r2, r0
	adds r0, r0, r7
	ldrh r0, [r0]
	strh r0, [r1]
	adds r4, #1
	ldrh r1, [r5, #0x3e]
	lsrs r0, r1, #3
	adds r0, #0xc
	cmp r4, r0
	blt _0808B162
_0808B188:
	ldr r0, _0808B20C @ =gBg2Tm
	ldr r1, _0808B210 @ =0x0200D4F0
	adds r2, r6, r1
	adds r1, r3, #0
	adds r1, #0xa8
	movs r4, #1
	lsls r1, r1, #1
	adds r1, r1, r0
_0808B198:
	ldrh r0, [r2]
	strh r0, [r1]
	adds r2, #0x40
	adds r1, #0x40
	subs r4, #1
	cmp r4, #0
	bge _0808B198
	mov r3, sb
	cmp r3, #0x13
	ble _0808B112
	movs r0, #5
	bl EnableBgSync
	ldr r2, [sp, #0xc]
	ldrb r2, [r2]
	cmp r2, #0x13
	bls _0808B26C
	ldr r1, [sp, #8]
	ldrb r0, [r1]
	mov r2, sl
	strb r0, [r2]
	ldr r0, _0808B214 @ =gBg2Tm + 0x150
	movs r1, #0x16
	movs r2, #1
	movs r3, #0
	bl TmFillRect_thm
	ldr r0, _0808B218 @ =gBg0Tm + 0x10
	movs r1, #0x16
	movs r2, #0x1f
	movs r3, #0
	bl TmFillRect_thm
	adds r4, r5, #0
	adds r4, #0x32
	adds r6, r5, #0
	adds r6, #0x2e
	ldr r1, _0808B21C @ =0x0200E66C
	movs r2, #0xff
	adds r0, r1, #0
	adds r0, #0x4c
_0808B1EA:
	str r2, [r0]
	subs r0, #4
	cmp r0, r1
	bge _0808B1EA
	bl ClearIcons
	ldrb r0, [r4]
	bl sub_8089638
	ldrh r0, [r5, #0x3e]
	lsrs r4, r0, #4
	adds r0, r4, #6
	b _0808B23C
	.align 2, 0
_0808B204: .4byte gBg0Tm
_0808B208: .4byte 0x0200CCF0
_0808B20C: .4byte gBg2Tm
_0808B210: .4byte 0x0200D4F0
_0808B214: .4byte gBg2Tm + 0x150
_0808B218: .4byte gBg0Tm + 0x10
_0808B21C: .4byte 0x0200E66C
_0808B220:
	lsls r1, r4, #0x18
	lsrs r1, r1, #0x18
	mov r2, sl
	ldrb r3, [r2]
	movs r0, #0
	str r0, [sp]
	adds r0, r5, #0
	ldr r2, _0808B27C @ =0x0200CCF0
	bl sub_808B654
	adds r4, #1
	ldrh r1, [r5, #0x3e]
	lsrs r0, r1, #4
	adds r0, #6
_0808B23C:
	cmp r4, r0
	bge _0808B248
	ldr r0, _0808B280 @ =0x0200E668
	ldrb r0, [r0]
	cmp r4, r0
	blt _0808B220
_0808B248:
	ldr r0, _0808B284 @ =0x0200D4F0
	mov r2, sl
	ldrb r1, [r2]
	bl sub_808B520
	ldrb r0, [r6]
	mov r2, sl
	ldrb r1, [r2]
	movs r2, #0
	bl sub_808B5E4
	movs r0, #0
	ldr r1, [sp, #0xc]
	strb r0, [r1]
	strh r0, [r5, #0x3c]
	adds r0, r5, #0
	bl Proc_Break
_0808B26C:
	add sp, #0x10
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0808B27C: .4byte 0x0200CCF0
_0808B280: .4byte 0x0200E668
_0808B284: .4byte 0x0200D4F0

	thumb_func_start sub_808B288
sub_808B288: @ 0x0808B288
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x10
	mov r8, r0
	mov r2, r8
	adds r2, #0x38
	ldr r0, _0808B370 @ =gUnk_08D8B9BA
	mov r1, r8
	ldrh r1, [r1, #0x3c]
	adds r0, r1, r0
	ldrb r3, [r2]
	ldrb r0, [r0]
	adds r0, r3, r0
	strb r0, [r2]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x14
	bls _0808B2B6
	movs r0, #0x14
	strb r0, [r2]
_0808B2B6:
	mov r5, r8
	ldrh r0, [r5, #0x3c]
	adds r0, #1
	strh r0, [r5, #0x3c]
	mov r0, r8
	adds r0, #0x36
	mov r1, r8
	adds r1, #0x37
	ldrb r0, [r0]
	ldrb r1, [r1]
	cmp r0, r1
	bls _0808B384
	movs r5, #0
	str r2, [sp]
	ldrb r6, [r2]
	cmp r5, r6
	blt _0808B2DA
	b _0808B41C
_0808B2DA:
	str r2, [sp, #8]
_0808B2DC:
	mov r7, r8
	ldrh r7, [r7, #0x3e]
	lsrs r4, r7, #3
	adds r0, r4, #0
	adds r0, #0xc
	adds r6, r5, #0
	adds r6, #0x1c
	movs r1, #8
	adds r1, r1, r5
	mov ip, r1
	adds r5, #1
	mov sl, r5
	cmp r4, r0
	bge _0808B336
	str r6, [sp, #4]
	lsls r1, r1, #1
	str r1, [sp, #0xc]
	movs r2, #0x1f
	mov sb, r2
_0808B302:
	adds r3, r4, #0
	mov r5, sb
	ands r3, r5
	lsls r1, r3, #5
	ldr r2, [sp, #4]
	ldr r7, [sp, #8]
	ldrb r7, [r7]
	subs r0, r2, r7
	adds r1, r1, r0
	lsls r1, r1, #1
	ldr r0, _0808B374 @ =gBg0Tm
	adds r1, r1, r0
	lsls r0, r3, #6
	ldr r2, [sp, #0xc]
	adds r0, r2, r0
	ldr r3, _0808B378 @ =0x0200CCF0
	adds r0, r0, r3
	ldrh r0, [r0]
	strh r0, [r1]
	adds r4, #1
	mov r5, r8
	ldrh r5, [r5, #0x3e]
	lsrs r0, r5, #3
	adds r0, #0xc
	cmp r4, r0
	blt _0808B302
_0808B336:
	ldr r7, _0808B37C @ =gBg2Tm
	mov sb, r7
	adds r5, r6, #0
	mov r1, ip
	lsls r0, r1, #1
	ldr r3, _0808B380 @ =0x0200D4F0
	adds r2, r0, r3
	movs r3, #0xa0
	movs r4, #1
_0808B348:
	ldr r6, [sp, #8]
	ldrb r6, [r6]
	subs r0, r5, r6
	adds r0, r3, r0
	lsls r0, r0, #1
	add r0, sb
	ldrh r1, [r2]
	strh r1, [r0]
	adds r2, #0x40
	adds r3, #0x20
	subs r4, #1
	cmp r4, #0
	bge _0808B348
	mov r5, sl
	ldr r7, [sp, #8]
	ldrb r7, [r7]
	cmp r5, r7
	blt _0808B2DC
	b _0808B41C
	.align 2, 0
_0808B370: .4byte gUnk_08D8B9BA
_0808B374: .4byte gBg0Tm
_0808B378: .4byte 0x0200CCF0
_0808B37C: .4byte gBg2Tm
_0808B380: .4byte 0x0200D4F0
_0808B384:
	movs r5, #0
	str r2, [sp]
	ldrb r0, [r2]
	cmp r5, r0
	bge _0808B41C
	str r2, [sp, #8]
_0808B390:
	mov r1, r8
	ldrh r1, [r1, #0x3e]
	lsrs r4, r1, #3
	adds r0, r4, #0
	adds r0, #0xc
	adds r6, r5, #0
	adds r6, #0x1c
	adds r2, r5, #1
	mov sl, r2
	cmp r4, r0
	bge _0808B3E6
	mov ip, r6
	movs r3, #0x1f
	mov sb, r3
_0808B3AC:
	adds r3, r4, #0
	mov r7, sb
	ands r3, r7
	lsls r2, r3, #5
	adds r2, #8
	adds r2, r2, r5
	lsls r2, r2, #1
	ldr r0, _0808B440 @ =gBg0Tm
	adds r2, r2, r0
	str r2, [sp, #0xc]
	mov r2, ip
	ldr r1, [sp, #8]
	ldrb r1, [r1]
	subs r0, r2, r1
	lsls r0, r0, #1
	lsls r1, r3, #6
	adds r0, r0, r1
	ldr r2, _0808B444 @ =0x0200CCF0
	adds r0, r0, r2
	ldrh r0, [r0]
	ldr r3, [sp, #0xc]
	strh r0, [r3]
	adds r4, #1
	mov r7, r8
	ldrh r7, [r7, #0x3e]
	lsrs r0, r7, #3
	adds r0, #0xc
	cmp r4, r0
	blt _0808B3AC
_0808B3E6:
	movs r4, #0
	ldr r0, _0808B448 @ =0x0200D4F0
	mov ip, r0
	adds r3, r6, #0
	adds r0, r5, #0
	adds r0, #0xa8
	lsls r0, r0, #1
	ldr r1, _0808B44C @ =gBg2Tm
	adds r2, r0, r1
_0808B3F8:
	ldr r5, [sp, #8]
	ldrb r5, [r5]
	subs r0, r3, r5
	lsls r0, r0, #1
	lsls r1, r4, #6
	adds r0, r0, r1
	add r0, ip
	ldrh r0, [r0]
	strh r0, [r2]
	adds r2, #0x40
	adds r4, #1
	cmp r4, #1
	ble _0808B3F8
	mov r5, sl
	ldr r6, [sp, #8]
	ldrb r6, [r6]
	cmp r5, r6
	blt _0808B390
_0808B41C:
	movs r0, #5
	bl EnableBgSync
	ldr r7, [sp]
	ldrb r7, [r7]
	cmp r7, #0x13
	bls _0808B430
	mov r0, r8
	bl Proc_Break
_0808B430:
	add sp, #0x10
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0808B440: .4byte gBg0Tm
_0808B444: .4byte 0x0200CCF0
_0808B448: .4byte 0x0200D4F0
_0808B44C: .4byte gBg2Tm

	thumb_func_start sub_808B450
sub_808B450: @ 0x0808B450
	push {lr}
	ldr r0, _0808B464 @ =gUnk_08D8B71C
	movs r1, #3
	bl Proc_Start
	adds r0, #0x39
	movs r1, #0
	strb r1, [r0]
	pop {r0}
	bx r0
	.align 2, 0
_0808B464: .4byte gUnk_08D8B71C

	thumb_func_start sub_808B468
sub_808B468: @ 0x0808B468
	push {r4, lr}
	adds r1, r0, #0
	cmp r1, #0
	bne _0808B480
	ldr r0, _0808B47C @ =gUnk_08D8B82C
	movs r1, #3
	bl Proc_Start
	b _0808B486
	.align 2, 0
_0808B47C: .4byte gUnk_08D8B82C
_0808B480:
	ldr r0, _0808B4A4 @ =gUnk_08D8B82C
	bl Proc_StartBlocking
_0808B486:
	adds r4, r0, #0
	adds r1, r4, #0
	adds r1, #0x39
	movs r0, #1
	strb r0, [r1]
	bl CheckInLinkArena
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne _0808B4A8
	adds r1, r4, #0
	adds r1, #0x3a
	movs r0, #5
	b _0808B4B0
	.align 2, 0
_0808B4A4: .4byte gUnk_08D8B82C
_0808B4A8:
	bl GetChapterAllyUnitCount
	adds r1, r4, #0
	adds r1, #0x3a
_0808B4B0:
	strb r0, [r1]
	adds r1, r4, #0
	adds r1, #0x3b
	movs r0, #0
	strb r0, [r1]
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_808B4C0
sub_808B4C0: @ 0x0808B4C0
	push {lr}
	adds r1, r0, #0
	cmp r1, #0
	bne _0808B4D8
	ldr r0, _0808B4D4 @ =gUnk_08D8B8F4
	movs r1, #3
	bl Proc_Start
	b _0808B4DE
	.align 2, 0
_0808B4D4: .4byte gUnk_08D8B8F4
_0808B4D8:
	ldr r0, _0808B4EC @ =gUnk_08D8B8F4
	bl Proc_StartBlocking
_0808B4DE:
	adds r1, r0, #0
	adds r1, #0x39
	movs r0, #3
	strb r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_0808B4EC: .4byte gUnk_08D8B8F4

	thumb_func_start sub_808B4F0
sub_808B4F0: @ 0x0808B4F0
	push {lr}
	adds r1, r0, #0
	cmp r1, #0
	bne _0808B508
	ldr r0, _0808B504 @ =gUnk_08D8B82C
	movs r1, #3
	bl Proc_Start
	b _0808B50E
	.align 2, 0
_0808B504: .4byte gUnk_08D8B82C
_0808B508:
	ldr r0, _0808B51C @ =gUnk_08D8B82C
	bl Proc_StartBlocking
_0808B50E:
	adds r1, r0, #0
	adds r1, #0x39
	movs r0, #4
	strb r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_0808B51C: .4byte gUnk_08D8B82C

	thumb_func_start sub_808B520
sub_808B520: @ 0x0808B520
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	adds r7, r0, #0
	lsls r1, r1, #0x18
	lsrs r4, r1, #0x18
	adds r6, r7, #0
	adds r6, #0x12
	adds r0, r6, #0
	movs r1, #0x13
	movs r2, #1
	movs r3, #0
	bl TmFillRect_thm
	ldr r0, _0808B568 @ =0x0200D658
	mov r8, r0
	bl ClearText
	cmp r4, #5
	bne _0808B56C
	movs r5, #0
	adds r4, r6, #0
_0808B54E:
	adds r1, r5, #0
	adds r1, #0x70
	adds r0, r4, #0
	movs r2, #0xa0
	lsls r2, r2, #7
	bl PutIcon
	adds r4, #4
	adds r5, #1
	cmp r5, #7
	ble _0808B54E
	b _0808B5CA
	.align 2, 0
_0808B568: .4byte 0x0200D658
_0808B56C:
	movs r5, #1
	ldr r3, _0808B5DC @ =gUnk_08D8BB00
	lsls r0, r4, #3
	adds r0, r0, r4
	lsls r1, r0, #4
	adds r2, r1, #0
	adds r2, #0x10
	adds r0, r2, r3
	ldrb r0, [r0, #8]
	adds r7, #0x10
	mov sb, r7
	cmp r0, #0
	beq _0808B5C2
	mov r7, r8
	mov r8, r3
	adds r0, r1, r3
	adds r4, r0, #0
	adds r4, #0x10
	adds r6, r2, #0
_0808B592:
	ldrb r1, [r4, #8]
	subs r1, #0x40
	adds r0, r7, #0
	bl Text_SetCursor
	adds r0, r7, #0
	movs r1, #0
	bl Text_SetColor
	mov r0, r8
	adds r0, #4
	adds r0, r6, r0
	ldr r1, [r0]
	adds r0, r7, #0
	bl Text_DrawString
	adds r4, #0x10
	adds r6, #0x10
	adds r5, #1
	cmp r5, #8
	bgt _0808B5C2
	ldrb r0, [r4, #8]
	cmp r0, #0
	bne _0808B592
_0808B5C2:
	ldr r0, _0808B5E0 @ =0x0200D658
	mov r1, sb
	bl PutText
_0808B5CA:
	movs r0, #4
	bl EnableBgSync
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0808B5DC: .4byte gUnk_08D8BB00
_0808B5E0: .4byte 0x0200D658

	thumb_func_start sub_808B5E4
sub_808B5E4: @ 0x0808B5E4
	push {r4, r5, r6, r7, lr}
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r5, r1, #0x18
	lsls r2, r2, #0x18
	lsrs r7, r2, #0x18
	cmp r5, #0
	beq _0808B620
	ldr r4, _0808B61C @ =gBg2Tm + 0x74
	adds r0, r4, #0
	movs r1, #2
	adds r2, r5, #0
	bl PutNumber
	adds r0, r4, #2
	movs r1, #0
	movs r2, #0x16
	bl PutSpecialChar
	adds r4, #4
	adds r0, r4, #0
	movs r1, #2
	adds r2, r6, #0
	bl PutNumber
	b _0808B632
	.align 2, 0
_0808B61C: .4byte gBg2Tm + 0x74
_0808B620:
	ldr r0, _0808B64C @ =gBg1Tm + 0x32
	movs r1, #6
	movs r2, #3
	movs r3, #0
	bl TmFillRect_thm
	movs r0, #2
	bl EnableBgSync
_0808B632:
	cmp r7, #0
	beq _0808B63E
	ldr r0, _0808B650 @ =gBg2Tm + 0x140
	adds r1, r5, #0
	bl sub_808B520
_0808B63E:
	movs r0, #4
	bl EnableBgSync
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0808B64C: .4byte gBg1Tm + 0x32
_0808B650: .4byte gBg2Tm + 0x140

	thumb_func_start sub_808B654
sub_808B654: @ 0x0808B654
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x58
	str r0, [sp, #0x24]
	mov sl, r2
	ldr r4, [sp, #0x78]
	lsls r1, r1, #0x18
	lsrs r7, r1, #0x18
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	str r3, [sp, #0x28]
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	adds r0, r7, #0
	movs r1, #7
	bl __umodsi3
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp, #0x2c]
	lsls r0, r7, #1
	str r0, [sp, #0x30]
	movs r0, #0x1f
	ldr r1, [sp, #0x30]
	ands r1, r0
	str r1, [sp, #0x30]
	ldr r1, _0808B6F0 @ =0x0200CBF0
	lsls r0, r7, #2
	adds r6, r0, r1
	ldr r0, [r6]
	ldr r0, [r0]
	ldr r0, [r0, #0xc]
	movs r1, #8
	ands r0, r1
	rsbs r0, r0, #0
	lsrs r0, r0, #0x1f
	mov sb, r0
	cmp r4, #0
	beq _0808B72E
	ldr r2, [sp, #0x2c]
	lsls r4, r2, #3
	ldr r0, _0808B6F4 @ =0x0200D570
	adds r5, r4, r0
	adds r0, r5, #0
	bl ClearText
	adds r0, r5, #0
	movs r1, #0
	bl Text_SetCursor
	bl CheckInLinkArena
	lsls r0, r0, #0x18
	mov r8, r4
	cmp r0, #0
	bne _0808B6F8
	ldr r0, [sp, #0x24]
	adds r0, #0x39
	ldrb r0, [r0]
	cmp r0, #1
	bne _0808B6F8
	ldr r0, [r6]
	ldr r0, [r0]
	ldr r0, [r0]
	ldrb r0, [r0, #4]
	bl IsCharacterForceDeployed
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0808B6F8
	adds r0, r5, #0
	movs r1, #4
	bl Text_SetColor
	b _0808B702
	.align 2, 0
_0808B6F0: .4byte 0x0200CBF0
_0808B6F4: .4byte 0x0200D570
_0808B6F8:
	ldr r0, _0808B778 @ =0x0200D570
	add r0, r8
	mov r1, sb
	bl Text_SetColor
_0808B702:
	ldr r4, _0808B778 @ =0x0200D570
	add r4, r8
	ldr r1, _0808B77C @ =0x0200CBF0
	lsls r0, r7, #2
	adds r0, r0, r1
	ldr r0, [r0]
	ldr r0, [r0]
	ldr r0, [r0]
	ldrh r0, [r0]
	bl DecodeMsg
	adds r1, r0, #0
	adds r0, r4, #0
	bl Text_DrawString
	ldr r3, [sp, #0x30]
	lsls r1, r3, #6
	add r1, sl
	adds r1, #6
	adds r0, r4, #0
	bl PutText
_0808B72E:
	ldr r4, [sp, #0x2c]
	lsls r5, r4, #1
	adds r0, r5, r4
	lsls r0, r0, #3
	mov r8, r0
	ldr r6, _0808B780 @ =0x0200D5A8
	adds r0, r0, r6
	bl ClearText
	adds r0, r6, #0
	adds r0, #8
	add r0, r8
	bl ClearText
	ldr r0, [sp, #0x30]
	lsls r4, r0, #6
	mov r1, sl
	adds r1, r1, r4
	str r1, [sp, #0x34]
	adds r0, r1, #0
	adds r0, #0x10
	movs r1, #0x18
	movs r2, #1
	movs r3, #0
	bl TmFillRect_thm
	str r4, [sp, #0x54]
	str r5, [sp, #0x50]
	ldr r2, [sp, #0x28]
	cmp r2, #5
	bls _0808B76E
	b _0808BD8C
_0808B76E:
	lsls r0, r2, #2
	ldr r1, _0808B784 @ =_0808B788
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0808B778: .4byte 0x0200D570
_0808B77C: .4byte 0x0200CBF0
_0808B780: .4byte 0x0200D5A8
_0808B784: .4byte _0808B788
_0808B788: @ jump table
	.4byte _0808B7A0 @ case 0
	.4byte _0808B910 @ case 1
	.4byte _0808B9D4 @ case 2
	.4byte _0808BAF2 @ case 3
	.4byte _0808BC00 @ case 4
	.4byte _0808BD2C @ case 5
_0808B7A0:
	ldr r0, _0808B810 @ =0x0200CBF0
	lsls r6, r7, #2
	adds r0, r0, r6
	mov r8, r0
	ldr r0, [r0]
	ldr r0, [r0]
	ldr r0, [r0, #4]
	ldrh r0, [r0]
	bl DecodeMsg
	adds r2, r0, #0
	ldr r3, [sp, #0x50]
	ldr r4, [sp, #0x2c]
	adds r5, r3, r4
	lsls r5, r5, #3
	ldr r4, _0808B814 @ =0x0200D5A8
	adds r0, r5, r4
	ldr r7, [sp, #0x54]
	add r7, sl
	adds r1, r7, #0
	adds r1, #0x10
	movs r3, #0
	str r3, [sp]
	str r2, [sp, #4]
	movs r2, #0
	bl PutDrawText
	adds r4, #8
	adds r5, r5, r4
	mov r4, sb
	adds r0, r5, #0
	adds r1, r4, #0
	bl Text_SetColor
	mov r1, r8
	ldr r0, [r1]
	ldr r0, [r0]
	bl GetUnitEquippedWeapon
	lsls r0, r0, #0x10
	str r6, [sp, #0x4c]
	cmp r0, #0
	bne _0808B81C
	adds r1, r7, #0
	adds r1, #0x22
	movs r2, #0
	str r2, [sp]
	ldr r0, _0808B818 @ =gUnk_0842CE1C
	str r0, [sp, #4]
	adds r0, r5, #0
	adds r2, r4, #0
	movs r3, #0
	bl PutDrawText
	b _0808B87A
	.align 2, 0
_0808B810: .4byte 0x0200CBF0
_0808B814: .4byte 0x0200D5A8
_0808B818: .4byte gUnk_0842CE1C
_0808B81C:
	mov r3, r8
	ldr r0, [r3]
	ldr r0, [r0]
	bl GetUnitEquippedWeapon
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl GetItemName
	adds r1, r7, #0
	adds r1, #0x22
	movs r6, #0
	str r6, [sp]
	str r0, [sp, #4]
	adds r0, r5, #0
	adds r2, r4, #0
	movs r3, #0
	bl PutDrawText
	adds r4, r7, #0
	adds r4, #0x1e
	mov r1, r8
	ldr r0, [r1]
	ldr r0, [r0]
	bl GetUnitEquippedWeapon
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl sub_8017808
	adds r1, r0, #0
	movs r2, #0x80
	lsls r2, r2, #7
	adds r0, r4, #0
	bl PutIcon
	mov r2, r8
	ldr r0, [r2]
	ldr r0, [r0]
	bl GetUnitEquippedWeapon
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl sub_8017808
	bl sub_80896EC
_0808B87A:
	ldr r3, [sp, #0x50]
	ldr r4, [sp, #0x2c]
	adds r0, r3, r4
	lsls r0, r0, #3
	ldr r1, _0808B8B0 @ =0x0200D5B8
	adds r5, r0, r1
	adds r0, r5, #0
	bl ClearText
	ldr r0, _0808B8B4 @ =0x0200CBF0
	ldr r6, [sp, #0x4c]
	adds r0, r6, r0
	ldr r0, [r0]
	ldr r0, [r0]
	ldr r4, [r0, #0xc]
	movs r0, #0xc0
	lsls r0, r0, #8
	ands r4, r0
	movs r0, #0x80
	lsls r0, r0, #7
	cmp r4, r0
	beq _0808B8C2
	cmp r4, r0
	bhi _0808B8B8
	cmp r4, #0
	beq _0808B8F4
	b _0808BEF4
	.align 2, 0
_0808B8B0: .4byte 0x0200D5B8
_0808B8B4: .4byte 0x0200CBF0
_0808B8B8:
	movs r0, #0x80
	lsls r0, r0, #8
	cmp r4, r0
	beq _0808B8D4
	b _0808BEF4
_0808B8C2:
	ldr r1, [sp, #0x54]
	add r1, sl
	adds r1, #0x30
	movs r0, #0
	str r0, [sp]
	ldr r0, _0808B8D0 @ =gUnk_0842CE28
	b _0808B8E0
	.align 2, 0
_0808B8D0: .4byte gUnk_0842CE28
_0808B8D4:
	ldr r1, [sp, #0x54]
	add r1, sl
	adds r1, #0x30
	movs r0, #0
	str r0, [sp]
	ldr r0, _0808B8F0 @ =gUnk_0842CE2C
_0808B8E0:
	str r0, [sp, #4]
	adds r0, r5, #0
	movs r2, #4
	movs r3, #8
	bl PutDrawText
	b _0808BEF4
	.align 2, 0
_0808B8F0: .4byte gUnk_0842CE2C
_0808B8F4:
	ldr r1, [sp, #0x54]
	add r1, sl
	adds r1, #0x30
	str r4, [sp]
	ldr r0, _0808B90C @ =gUnk_0842CE30
	str r0, [sp, #4]
	adds r0, r5, #0
	movs r2, #1
	movs r3, #4
	bl PutDrawText
	b _0808BEF4
	.align 2, 0
_0808B90C: .4byte gUnk_0842CE30
_0808B910:
	ldr r1, _0808B9CC @ =0x0200CBF0
	lsls r0, r7, #2
	adds r6, r0, r1
	ldr r0, [r6]
	ldr r0, [r0]
	ldr r0, [r0, #4]
	ldrh r0, [r0]
	bl DecodeMsg
	adds r3, r0, #0
	ldr r1, [sp, #0x50]
	ldr r2, [sp, #0x2c]
	adds r0, r1, r2
	lsls r0, r0, #3
	ldr r1, _0808B9D0 @ =0x0200D5A8
	adds r0, r0, r1
	ldr r4, [sp, #0x54]
	add r4, sl
	adds r1, r4, #0
	adds r1, #0x10
	mov r8, sb
	movs r2, #0
	str r2, [sp]
	str r3, [sp, #4]
	mov r2, r8
	movs r3, #0
	bl PutDrawText
	adds r3, r4, #0
	adds r3, #0x22
	movs r1, #2
	mov r0, sb
	cmp r0, #0
	beq _0808B956
	movs r1, #1
_0808B956:
	ldr r0, [r6]
	ldr r0, [r0]
	movs r2, #8
	ldrsb r2, [r0, r2]
	adds r0, r3, #0
	bl PutNumberOrBlank
	adds r3, r4, #0
	adds r3, #0x28
	movs r1, #2
	mov r2, sb
	cmp r2, #0
	beq _0808B972
	movs r1, #1
_0808B972:
	ldr r0, [r6]
	ldr r0, [r0]
	ldrb r2, [r0, #9]
	adds r0, r3, #0
	bl PutNumberOrBlank
	adds r5, r4, #0
	adds r5, #0x2e
	movs r7, #2
	mov r3, sb
	cmp r3, #0
	beq _0808B98C
	movs r7, #1
_0808B98C:
	ldr r0, [r6]
	ldr r0, [r0]
	bl GetUnitCurrentHp
	adds r2, r0, #0
	adds r0, r5, #0
	adds r1, r7, #0
	bl PutNumberOrBlank
	adds r0, r4, #0
	adds r0, #0x30
	mov r1, r8
	movs r2, #0x16
	bl PutSpecialChar
	adds r4, #0x34
	movs r5, #2
	mov r0, sb
	cmp r0, #0
	beq _0808B9B6
	movs r5, #1
_0808B9B6:
	ldr r0, [r6]
	ldr r0, [r0]
	bl GetUnitMaxHp
	adds r2, r0, #0
	adds r0, r4, #0
	adds r1, r5, #0
	bl PutNumberOrBlank
	b _0808BEF4
	.align 2, 0
_0808B9CC: .4byte 0x0200CBF0
_0808B9D0: .4byte 0x0200D5A8
_0808B9D4:
	ldr r5, [sp, #0x54]
	add r5, sl
	movs r1, #0x12
	adds r1, r1, r5
	mov r8, r1
	ldr r1, _0808BAE0 @ =0x0200CBF0
	lsls r0, r7, #2
	adds r4, r0, r1
	ldr r0, [r4]
	ldr r1, [r0]
	ldr r0, [r1, #4]
	movs r6, #2
	ldrb r0, [r0, #0x14]
	ldrb r2, [r1, #0x14]
	cmp r0, r2
	bne _0808B9F6
	movs r6, #4
_0808B9F6:
	adds r0, r1, #0
	bl GetUnitPower
	adds r2, r0, #0
	mov r0, r8
	adds r1, r6, #0
	bl PutNumberOrBlank
	adds r7, r5, #0
	adds r7, #0x18
	ldr r0, [r4]
	ldr r1, [r0]
	ldr r0, [r1, #4]
	movs r6, #2
	ldrb r0, [r0, #0x15]
	ldrb r3, [r1, #0x15]
	cmp r0, r3
	bne _0808BA1C
	movs r6, #4
_0808BA1C:
	adds r0, r1, #0
	bl GetUnitSkill
	adds r2, r0, #0
	adds r0, r7, #0
	adds r1, r6, #0
	bl PutNumberOrBlank
	adds r7, r5, #0
	adds r7, #0x1e
	ldr r0, [r4]
	ldr r1, [r0]
	ldr r0, [r1, #4]
	movs r6, #2
	ldrb r0, [r0, #0x16]
	ldrb r2, [r1, #0x16]
	cmp r0, r2
	bne _0808BA42
	movs r6, #4
_0808BA42:
	adds r0, r1, #0
	bl GetUnitSpeed
	adds r2, r0, #0
	adds r0, r7, #0
	adds r1, r6, #0
	bl PutNumberOrBlank
	adds r7, r5, #0
	adds r7, #0x24
	ldr r0, [r4]
	ldr r0, [r0]
	movs r6, #2
	ldrb r3, [r0, #0x19]
	cmp r3, #0x1e
	bne _0808BA64
	movs r6, #4
_0808BA64:
	bl GetUnitLuck
	adds r2, r0, #0
	adds r0, r7, #0
	adds r1, r6, #0
	bl PutNumberOrBlank
	adds r7, r5, #0
	adds r7, #0x2a
	ldr r0, [r4]
	ldr r1, [r0]
	ldr r0, [r1, #4]
	movs r6, #2
	ldrb r0, [r0, #0x17]
	ldrb r2, [r1, #0x17]
	cmp r0, r2
	bne _0808BA88
	movs r6, #4
_0808BA88:
	adds r0, r1, #0
	bl GetUnitDefense
	adds r2, r0, #0
	adds r0, r7, #0
	adds r1, r6, #0
	bl PutNumberOrBlank
	adds r7, r5, #0
	adds r7, #0x30
	ldr r0, [r4]
	ldr r1, [r0]
	ldr r0, [r1, #4]
	movs r6, #2
	ldrb r0, [r0, #0x18]
	ldrb r3, [r1, #0x18]
	cmp r0, r3
	bne _0808BAAE
	movs r6, #4
_0808BAAE:
	adds r0, r1, #0
	bl GetUnitResistance
	adds r2, r0, #0
	adds r0, r7, #0
	adds r1, r6, #0
	bl PutNumberOrBlank
	ldr r0, [r4]
	ldr r0, [r0]
	bl GetUnitAffinityIcon
	adds r1, r0, #0
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	bne _0808BAE4
	adds r0, r5, #0
	adds r0, #0x34
	movs r1, #2
	movs r2, #0x14
	bl PutSpecialChar
	b _0808BEF4
	.align 2, 0
_0808BAE0: .4byte 0x0200CBF0
_0808BAE4:
	adds r0, r5, #0
	adds r0, #0x34
	movs r2, #0xa0
	lsls r2, r2, #7
	bl PutIcon
	b _0808BEF4
_0808BAF2:
	ldr r0, _0808BB2C @ =0x0200CBF0
	lsls r4, r7, #2
	adds r7, r4, r0
	ldr r0, [r7]
	ldr r0, [r0]
	bl GetUnitEquippedWeapon
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	str r4, [sp, #0x4c]
	cmp r3, #0
	bne _0808BB38
	ldr r4, [sp, #0x50]
	ldr r6, [sp, #0x2c]
	adds r0, r4, r6
	lsls r0, r0, #3
	ldr r1, _0808BB30 @ =0x0200D5A8
	adds r0, r0, r1
	ldr r1, [sp, #0x54]
	add r1, sl
	adds r1, #0x14
	mov r2, sb
	str r3, [sp]
	ldr r3, _0808BB34 @ =gUnk_0842CE1C
	str r3, [sp, #4]
	movs r3, #0
	bl PutDrawText
	b _0808BB9C
	.align 2, 0
_0808BB2C: .4byte 0x0200CBF0
_0808BB30: .4byte 0x0200D5A8
_0808BB34: .4byte gUnk_0842CE1C
_0808BB38:
	ldr r0, [r7]
	ldr r0, [r0]
	bl GetUnitEquippedWeapon
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl GetItemName
	adds r5, r0, #0
	ldr r1, [sp, #0x50]
	ldr r2, [sp, #0x2c]
	adds r0, r1, r2
	lsls r0, r0, #3
	ldr r1, _0808BBF8 @ =0x0200D5A8
	adds r0, r0, r1
	ldr r4, [sp, #0x54]
	add r4, sl
	adds r1, r4, #0
	adds r1, #0x14
	mov r2, sb
	movs r3, #0
	str r3, [sp]
	str r5, [sp, #4]
	bl PutDrawText
	adds r4, #0x10
	ldr r0, [r7]
	ldr r0, [r0]
	bl GetUnitEquippedWeapon
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl sub_8017808
	adds r1, r0, #0
	movs r2, #0x80
	lsls r2, r2, #7
	adds r0, r4, #0
	bl PutIcon
	ldr r0, [r7]
	ldr r0, [r0]
	bl GetUnitEquippedWeapon
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl sub_8017808
	bl sub_80896EC
_0808BB9C:
	ldr r5, [sp, #0x54]
	add r5, sl
	adds r3, r5, #0
	adds r3, #0x24
	movs r1, #2
	mov r4, sb
	cmp r4, #0
	beq _0808BBAE
	movs r1, #1
_0808BBAE:
	ldr r0, _0808BBFC @ =0x0200CBF0
	ldr r6, [sp, #0x4c]
	adds r4, r6, r0
	ldr r0, [r4]
	movs r6, #4
	ldrsh r2, [r0, r6]
	adds r0, r3, #0
	bl PutNumberOrBlank
	adds r3, r5, #0
	adds r3, #0x2c
	movs r1, #2
	mov r0, sb
	cmp r0, #0
	beq _0808BBCE
	movs r1, #1
_0808BBCE:
	ldr r0, [r4]
	movs r6, #6
	ldrsh r2, [r0, r6]
	adds r0, r3, #0
	bl PutNumberOrBlank
	adds r1, r5, #0
	adds r1, #0x34
	movs r3, #2
	mov r0, sb
	cmp r0, #0
	beq _0808BBE8
	movs r3, #1
_0808BBE8:
	ldr r0, [r4]
	movs r4, #8
	ldrsh r2, [r0, r4]
	adds r0, r1, #0
	adds r1, r3, #0
	bl PutNumberOrBlank
	b _0808BEF4
	.align 2, 0
_0808BBF8: .4byte 0x0200D5A8
_0808BBFC: .4byte 0x0200CBF0
_0808BC00:
	ldr r0, _0808BC40 @ =0x0200CBF0
	lsls r1, r7, #2
	adds r0, r1, r0
	ldr r0, [r0]
	ldr r2, [r0]
	ldr r3, [r2, #0xc]
	movs r0, #0x10
	ands r3, r0
	str r1, [sp, #0x4c]
	cmp r3, #0
	beq _0808BC48
	adds r0, r2, #0
	bl GetUnitRescueName
	adds r5, r0, #0
	ldr r6, [sp, #0x50]
	ldr r1, [sp, #0x2c]
	adds r0, r6, r1
	lsls r0, r0, #3
	ldr r1, _0808BC44 @ =0x0200D5B0
	adds r0, r0, r1
	ldr r1, [sp, #0x54]
	add r1, sl
	adds r1, #0x24
	mov r2, sb
	rsbs r4, r2, #0
	movs r3, #0
	str r3, [sp]
	str r5, [sp, #4]
	bl PutDrawText
	b _0808BC6A
	.align 2, 0
_0808BC40: .4byte 0x0200CBF0
_0808BC44: .4byte 0x0200D5B0
_0808BC48:
	ldr r4, [sp, #0x50]
	ldr r6, [sp, #0x2c]
	adds r0, r4, r6
	lsls r0, r0, #3
	ldr r1, _0808BD1C @ =0x0200D5B0
	adds r0, r0, r1
	ldr r1, [sp, #0x54]
	add r1, sl
	adds r1, #0x24
	mov r2, sb
	rsbs r4, r2, #0
	str r3, [sp]
	ldr r3, _0808BD20 @ =gUnk_0842CE38
	str r3, [sp, #4]
	movs r3, #0
	bl PutDrawText
_0808BC6A:
	mov r8, r4
	ldr r7, [sp, #0x54]
	add r7, sl
	adds r3, r7, #0
	adds r3, #0x14
	movs r1, #2
	mov r4, sb
	cmp r4, #0
	beq _0808BC7E
	movs r1, #1
_0808BC7E:
	ldr r0, _0808BD24 @ =0x0200CBF0
	ldr r6, [sp, #0x4c]
	adds r4, r6, r0
	ldr r0, [r4]
	ldr r0, [r0]
	movs r2, #0x1d
	ldrsb r2, [r0, r2]
	ldr r0, [r0, #4]
	ldrb r0, [r0, #0x12]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r2, r2, r0
	adds r0, r3, #0
	bl PutNumberOrBlank
	adds r3, r7, #0
	adds r3, #0x1a
	movs r5, #2
	mov r0, sb
	cmp r0, #0
	beq _0808BCAA
	movs r5, #1
_0808BCAA:
	ldr r0, [r4]
	ldr r1, [r0]
	ldr r0, [r1, #4]
	movs r2, #0x11
	ldrsb r2, [r0, r2]
	ldr r0, [r1]
	ldrb r0, [r0, #0x13]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r2, r2, r0
	movs r0, #0x1a
	ldrsb r0, [r1, r0]
	adds r2, r2, r0
	adds r0, r3, #0
	adds r1, r5, #0
	bl PutNumberOrBlank
	adds r5, r7, #0
	adds r5, #0x20
	movs r6, #2
	mov r1, sb
	cmp r1, #0
	beq _0808BCDA
	movs r6, #1
_0808BCDA:
	ldr r0, [r4]
	ldr r0, [r0]
	bl GetUnitAid
	adds r2, r0, #0
	adds r0, r5, #0
	adds r1, r6, #0
	bl PutNumberOrBlank
	ldr r0, [r4]
	ldr r0, [r0]
	bl GetUnitStatusName
	adds r4, r0, #0
	ldr r2, [sp, #0x50]
	ldr r3, [sp, #0x2c]
	adds r0, r2, r3
	lsls r0, r0, #3
	ldr r1, _0808BD28 @ =0x0200D5A8
	adds r0, r0, r1
	adds r1, r7, #0
	adds r1, #0x2e
	mov r6, r8
	mov r2, sb
	orrs r6, r2
	lsrs r2, r6, #0x1f
	movs r3, #0
	str r3, [sp]
	str r4, [sp, #4]
	bl PutDrawText
	b _0808BEF4
	.align 2, 0
_0808BD1C: .4byte 0x0200D5B0
_0808BD20: .4byte gUnk_0842CE38
_0808BD24: .4byte 0x0200CBF0
_0808BD28: .4byte 0x0200D5A8
_0808BD2C:
	movs r6, #0
	lsls r3, r7, #2
	ldr r0, _0808BD84 @ =0x0200CBF0
	adds r7, r3, r0
	ldr r5, [sp, #0x54]
	add r5, sl
_0808BD38:
	add r1, sp, #8
	ldr r0, _0808BD88 @ =gUnk_0842CE40
	ldm r0!, {r2, r3, r4}
	stm r1!, {r2, r3, r4}
	ldm r0!, {r2, r3, r4}
	stm r1!, {r2, r3, r4}
	ldr r0, [r0]
	str r0, [r1]
	ldr r0, [r7]
	ldr r0, [r0]
	adds r0, #0x28
	adds r0, r0, r6
	ldrb r0, [r0]
	bl GetWeaponLevelFromExp
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	lsls r0, r6, #2
	adds r0, #0x14
	adds r3, r5, r0
	movs r1, #2
	cmp r4, #6
	bne _0808BD68
	movs r1, #4
_0808BD68:
	lsls r0, r4, #2
	add r0, sp
	adds r0, #8
	ldr r2, [r0]
	adds r0, r3, #0
	bl PutSpecialChar
	adds r0, r6, #1
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	cmp r6, #7
	bls _0808BD38
	b _0808BEF4
	.align 2, 0
_0808BD84: .4byte 0x0200CBF0
_0808BD88: .4byte gUnk_0842CE40
_0808BD8C:
	ldr r1, [sp, #0x28]
	subs r1, #6
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp, #0x38]
	movs r4, #0
	str r4, [sp, #0x3c]
	ldr r1, _0808BE44 @ =0x0200CBF0
	lsls r0, r7, #2
	adds r5, r0, r1
	ldr r0, [r5]
	ldr r0, [r0]
	bl GetUnitSupporterCount
	str r0, [sp, #0x40]
	adds r0, r6, #0
	adds r0, #0x10
	add r0, r8
	bl ClearText
	movs r6, #0
	ldr r0, [sp, #0x40]
	cmp r4, r0
	bge _0808BEB2
	adds r7, r5, #0
	mov r1, r8
	str r1, [sp, #0x44]
	ldr r2, [sp, #0x34]
	str r2, [sp, #0x48]
	mov r3, sb
	rsbs r3, r3, #0
	mov r0, sb
	orrs r3, r0
	mov r8, r3
_0808BDD4:
	ldr r0, [r7]
	ldr r0, [r0]
	adds r1, r6, #0
	bl sub_8026C04
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0808BEA6
	ldr r1, [sp, #0x3c]
	ldr r2, [sp, #0x38]
	cmp r1, r2
	blo _0808BE9C
	ldr r0, [r7]
	ldr r0, [r0]
	adds r1, r6, #0
	bl GetUnitSupportUnit
	ldr r0, [r0, #0xc]
	movs r1, #8
	ands r0, r1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	cmp r5, #0
	bne _0808BE4C
	ldr r0, [r7]
	ldr r0, [r0]
	adds r1, r6, #0
	bl GetUnitSupportPid
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl GetCharacterData
	ldrh r0, [r0]
	bl DecodeMsg
	adds r2, r0, #0
	lsls r0, r4, #3
	ldr r1, _0808BE48 @ =0x0200D5A8
	adds r0, r0, r1
	ldr r3, [sp, #0x44]
	adds r0, r3, r0
	lsls r1, r4, #1
	adds r1, r1, r4
	lsls r1, r1, #2
	adds r1, #0x12
	ldr r3, [sp, #0x48]
	adds r1, r3, r1
	str r5, [sp]
	str r2, [sp, #4]
	mov r3, r8
	lsrs r2, r3, #0x1f
	movs r3, #0
	bl PutDrawText
	b _0808BE8A
	.align 2, 0
_0808BE44: .4byte 0x0200CBF0
_0808BE48: .4byte 0x0200D5A8
_0808BE4C:
	ldr r0, [r7]
	ldr r0, [r0]
	adds r1, r6, #0
	bl GetUnitSupportPid
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl GetCharacterData
	ldrh r0, [r0]
	bl DecodeMsg
	adds r3, r0, #0
	lsls r0, r4, #3
	ldr r1, _0808BE98 @ =0x0200D5A8
	adds r0, r0, r1
	ldr r1, [sp, #0x44]
	adds r0, r1, r0
	lsls r1, r4, #1
	adds r1, r1, r4
	lsls r1, r1, #2
	adds r1, #0x12
	ldr r2, [sp, #0x48]
	adds r1, r2, r1
	movs r2, #0
	str r2, [sp]
	str r3, [sp, #4]
	movs r2, #1
	movs r3, #0
	bl PutDrawText
_0808BE8A:
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #3
	beq _0808BEB2
	b _0808BEA6
	.align 2, 0
_0808BE98: .4byte 0x0200D5A8
_0808BE9C:
	ldr r0, [sp, #0x3c]
	adds r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp, #0x3c]
_0808BEA6:
	adds r0, r6, #1
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	ldr r3, [sp, #0x40]
	cmp r6, r3
	blt _0808BDD4
_0808BEB2:
	cmp r4, #2
	bhi _0808BEF4
	ldr r6, [sp, #0x50]
	ldr r1, [sp, #0x2c]
	adds r0, r6, r1
	lsls r5, r0, #3
	ldr r7, [sp, #0x54]
	add r7, sl
	mov r2, sb
	rsbs r6, r2, #0
	orrs r6, r2
_0808BEC8:
	lsls r0, r4, #3
	ldr r1, _0808BF0C @ =0x0200D5A8
	adds r0, r0, r1
	adds r0, r5, r0
	lsls r1, r4, #1
	adds r1, r1, r4
	lsls r1, r1, #2
	adds r1, #0x12
	adds r1, r7, r1
	movs r2, #0
	str r2, [sp]
	ldr r2, _0808BF10 @ =gUnk_0842CE38
	str r2, [sp, #4]
	lsrs r2, r6, #0x1f
	movs r3, #0
	bl PutDrawText
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #2
	bls _0808BEC8
_0808BEF4:
	movs r0, #1
	bl EnableBgSync
	add sp, #0x58
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0808BF0C: .4byte 0x0200D5A8
_0808BF10: .4byte gUnk_0842CE38

	thumb_func_start sub_808BF14
sub_808BF14: @ 0x0808BF14
	ldr r0, [r0, #0xc]
	movs r1, #0xc0
	lsls r1, r1, #8
	ands r0, r1
	bx lr
	.align 2, 0

	thumb_func_start SortUnitList
SortUnitList: @ 0x0808BF20
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x68
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r2, r1, #0x18
	movs r1, #1
	ands r2, r1
	subs r0, #1
	cmp r0, #0x1f
	bls _0808BF42
	bl _0808E330
_0808BF42:
	lsls r0, r0, #2
	ldr r1, _0808BF4C @ =_0808BF50
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0808BF4C: .4byte _0808BF50
_0808BF50: @ jump table
	.4byte _0808BFD0 @ case 0
	.4byte _0808C2D4 @ case 1
	.4byte _0808C1C8 @ case 2
	.4byte _0808C3D8 @ case 3
	.4byte _0808C4D4 @ case 4
	.4byte _0808C5DC @ case 5
	.4byte _0808C6E4 @ case 6
	.4byte _0808C7F0 @ case 7
	.4byte _0808C8F8 @ case 8
	.4byte _0808CA00 @ case 9
	.4byte _0808CB0C @ case 10
	.4byte _0808CC14 @ case 11
	.4byte _0808CF84 @ case 12
	.4byte _0808D08C @ case 13
	.4byte _0808D298 @ case 14
	.4byte _0808D38C @ case 15
	.4byte _0808D480 @ case 16
	.4byte _0808D574 @ case 17
	.4byte _0808CD1C @ case 18
	.4byte _0808CE78 @ case 19
	.4byte _0808D6A4 @ case 20
	.4byte _0808D7B0 @ case 21
	.4byte _0808D93C @ case 22
	.4byte _0808DA40 @ case 23
	.4byte _0808DB44 @ case 24
	.4byte _0808DC40 @ case 25
	.4byte _0808DD3C @ case 26
	.4byte _0808DE38 @ case 27
	.4byte _0808DF34 @ case 28
	.4byte _0808E030 @ case 29
	.4byte _0808E12C @ case 30
	.4byte _0808E224 @ case 31
_0808BFD0:
	cmp r2, #0
	bne _0808C0CC
	movs r0, #0
	str r0, [sp, #0x40]
	movs r1, #0
	ldr r3, _0808C0C4 @ =0x0200E668
	mov sl, r3
	ldrb r0, [r3]
	subs r0, #1
	cmp r2, r0
	bge _0808C046
	adds r4, r3, #0
	mov sb, r4
	ldr r6, _0808C0C8 @ =0x0200CBF0
	mov ip, r6
_0808BFEE:
	movs r2, #0
	adds r0, r1, #1
	mov r7, sb
	ldrb r7, [r7]
	subs r1, r7, r0
	adds r7, r0, #0
	cmp r2, r1
	bge _0808C038
	mov r8, ip
_0808C000:
	adds r6, r2, #1
	lsls r0, r6, #2
	mov r1, r8
	adds r5, r0, r1
	ldr r4, [r5]
	ldr r0, [r4]
	ldr r1, [r0]
	lsls r0, r2, #2
	mov r2, r8
	adds r3, r0, r2
	ldr r2, [r3]
	ldr r0, [r2]
	ldr r0, [r0]
	ldrb r1, [r1, #0xa]
	ldrb r0, [r0, #0xa]
	cmp r1, r0
	bhs _0808C02A
	str r4, [r3]
	str r2, [r5]
	movs r3, #1
	str r3, [sp, #0x40]
_0808C02A:
	lsls r0, r6, #0x18
	lsrs r2, r0, #0x18
	mov r4, sb
	ldrb r4, [r4]
	subs r0, r4, r7
	cmp r2, r0
	blt _0808C000
_0808C038:
	lsls r0, r7, #0x18
	lsrs r1, r0, #0x18
	mov r6, sl
	ldrb r0, [r6]
	subs r0, #1
	cmp r1, r0
	blt _0808BFEE
_0808C046:
	movs r1, #0
	ldr r7, _0808C0C4 @ =0x0200E668
	ldrb r0, [r7]
	subs r0, #1
	cmp r1, r0
	bge _0808C0BE
	mov sl, r7
_0808C054:
	movs r2, #0
	adds r0, r1, #1
	mov r3, sl
	ldrb r3, [r3]
	subs r1, r3, r0
	adds r7, r0, #0
	cmp r2, r1
	bge _0808C0B0
	ldr r4, _0808C0C8 @ =0x0200CBF0
	mov sb, r4
	movs r6, #2
	mov r8, r6
	mov ip, r7
_0808C06E:
	adds r0, r2, #1
	str r0, [sp, #0x60]
	lsls r0, r0, #2
	mov r1, sb
	adds r5, r0, r1
	ldr r4, [r5]
	ldr r0, [r4]
	ldr r1, [r0, #0xc]
	mov r3, r8
	ands r1, r3
	lsls r0, r2, #2
	mov r6, sb
	adds r3, r0, r6
	ldr r2, [r3]
	ldr r0, [r2]
	ldr r0, [r0, #0xc]
	mov r6, r8
	ands r0, r6
	cmp r1, r0
	bhs _0808C09E
	str r4, [r3]
	str r2, [r5]
	movs r0, #1
	str r0, [sp, #0x40]
_0808C09E:
	ldr r1, [sp, #0x60]
	lsls r0, r1, #0x18
	lsrs r2, r0, #0x18
	mov r3, sl
	ldrb r3, [r3]
	mov r4, ip
	subs r0, r3, r4
	cmp r2, r0
	blt _0808C06E
_0808C0B0:
	lsls r0, r7, #0x18
	lsrs r1, r0, #0x18
	ldr r6, _0808C0C4 @ =0x0200E668
	ldrb r0, [r6]
	subs r0, #1
	cmp r1, r0
	blt _0808C054
_0808C0BE:
	ldr r7, [sp, #0x40]
	bl _0808E29C
	.align 2, 0
_0808C0C4: .4byte 0x0200E668
_0808C0C8: .4byte 0x0200CBF0
_0808C0CC:
	movs r0, #0
	str r0, [sp, #0x44]
	movs r1, #0
	ldr r2, _0808C1C0 @ =0x0200E668
	mov sl, r2
	ldrb r0, [r2]
	subs r0, #1
	ldr r3, [sp, #0x44]
	cmp r3, r0
	bge _0808C140
	adds r4, r2, #0
	mov sb, r4
	ldr r6, _0808C1C4 @ =0x0200CBF0
	mov ip, r6
_0808C0E8:
	movs r2, #0
	adds r0, r1, #1
	mov r7, sb
	ldrb r7, [r7]
	subs r1, r7, r0
	adds r7, r0, #0
	cmp r2, r1
	bge _0808C132
	mov r8, ip
_0808C0FA:
	adds r6, r2, #1
	lsls r0, r6, #2
	mov r1, r8
	adds r5, r0, r1
	ldr r4, [r5]
	ldr r0, [r4]
	ldr r1, [r0]
	lsls r0, r2, #2
	mov r2, r8
	adds r3, r0, r2
	ldr r2, [r3]
	ldr r0, [r2]
	ldr r0, [r0]
	ldrb r1, [r1, #0xa]
	ldrb r0, [r0, #0xa]
	cmp r1, r0
	bls _0808C124
	str r4, [r3]
	str r2, [r5]
	movs r3, #1
	str r3, [sp, #0x44]
_0808C124:
	lsls r0, r6, #0x18
	lsrs r2, r0, #0x18
	mov r4, sb
	ldrb r4, [r4]
	subs r0, r4, r7
	cmp r2, r0
	blt _0808C0FA
_0808C132:
	lsls r0, r7, #0x18
	lsrs r1, r0, #0x18
	mov r6, sl
	ldrb r0, [r6]
	subs r0, #1
	cmp r1, r0
	blt _0808C0E8
_0808C140:
	movs r1, #0
	ldr r7, _0808C1C0 @ =0x0200E668
	ldrb r0, [r7]
	subs r0, #1
	cmp r1, r0
	bge _0808C1B8
	mov sl, r7
_0808C14E:
	movs r2, #0
	adds r0, r1, #1
	mov r3, sl
	ldrb r3, [r3]
	subs r1, r3, r0
	adds r7, r0, #0
	cmp r2, r1
	bge _0808C1AA
	ldr r4, _0808C1C4 @ =0x0200CBF0
	mov sb, r4
	movs r6, #2
	mov r8, r6
	mov ip, r7
_0808C168:
	adds r0, r2, #1
	str r0, [sp, #0x60]
	lsls r0, r0, #2
	mov r1, sb
	adds r5, r0, r1
	ldr r4, [r5]
	ldr r0, [r4]
	ldr r1, [r0, #0xc]
	mov r3, r8
	ands r1, r3
	lsls r0, r2, #2
	mov r6, sb
	adds r3, r0, r6
	ldr r2, [r3]
	ldr r0, [r2]
	ldr r0, [r0, #0xc]
	mov r6, r8
	ands r0, r6
	cmp r1, r0
	bls _0808C198
	str r4, [r3]
	str r2, [r5]
	movs r0, #1
	str r0, [sp, #0x44]
_0808C198:
	ldr r1, [sp, #0x60]
	lsls r0, r1, #0x18
	lsrs r2, r0, #0x18
	mov r3, sl
	ldrb r3, [r3]
	mov r4, ip
	subs r0, r3, r4
	cmp r2, r0
	blt _0808C168
_0808C1AA:
	lsls r0, r7, #0x18
	lsrs r1, r0, #0x18
	ldr r6, _0808C1C0 @ =0x0200E668
	ldrb r0, [r6]
	subs r0, #1
	cmp r1, r0
	blt _0808C14E
_0808C1B8:
	ldr r7, [sp, #0x44]
	bl _0808E29C
	.align 2, 0
_0808C1C0: .4byte 0x0200E668
_0808C1C4: .4byte 0x0200CBF0
_0808C1C8:
	cmp r2, #0
	bne _0808C250
	movs r0, #0
	mov sl, r0
	movs r1, #0
	ldr r3, _0808C248 @ =0x0200E668
	mov ip, r3
	ldrb r0, [r3]
	subs r0, #1
	cmp r2, r0
	blt _0808C1E2
	bl _0808E31E
_0808C1E2:
	adds r4, r3, #0
	mov sb, r4
_0808C1E6:
	movs r2, #0
	adds r0, r1, #1
	mov r6, sb
	ldrb r6, [r6]
	subs r1, r6, r0
	adds r7, r0, #0
	cmp r2, r1
	bge _0808C236
	ldr r0, _0808C24C @ =0x0200CBF0
	mov r8, r0
_0808C1FA:
	adds r6, r2, #1
	lsls r0, r6, #2
	mov r1, r8
	adds r5, r0, r1
	ldr r4, [r5]
	ldr r1, [r4]
	lsls r0, r2, #2
	mov r3, r8
	adds r2, r0, r3
	ldr r3, [r2]
	ldr r0, [r3]
	ldrb r1, [r1, #8]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	ldrb r0, [r0, #8]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r1, r0
	ble _0808C228
	str r4, [r2]
	str r3, [r5]
	movs r4, #1
	mov sl, r4
_0808C228:
	lsls r0, r6, #0x18
	lsrs r2, r0, #0x18
	mov r6, sb
	ldrb r6, [r6]
	subs r0, r6, r7
	cmp r2, r0
	blt _0808C1FA
_0808C236:
	lsls r0, r7, #0x18
	lsrs r1, r0, #0x18
	mov r7, ip
	ldrb r0, [r7]
	subs r0, #1
	cmp r1, r0
	blt _0808C1E6
	bl _0808E31E
	.align 2, 0
_0808C248: .4byte 0x0200E668
_0808C24C: .4byte 0x0200CBF0
_0808C250:
	movs r1, #0
	mov sl, r1
	ldr r2, _0808C2CC @ =0x0200E668
	mov ip, r2
	ldrb r0, [r2]
	subs r0, #1
	cmp sl, r0
	blt _0808C264
	bl _0808E31E
_0808C264:
	adds r3, r2, #0
	mov sb, r3
_0808C268:
	movs r2, #0
	adds r0, r1, #1
	mov r4, sb
	ldrb r4, [r4]
	subs r1, r4, r0
	adds r7, r0, #0
	cmp r2, r1
	bge _0808C2B8
	ldr r6, _0808C2D0 @ =0x0200CBF0
	mov r8, r6
_0808C27C:
	adds r6, r2, #1
	lsls r0, r6, #2
	mov r1, r8
	adds r5, r0, r1
	ldr r4, [r5]
	ldr r1, [r4]
	lsls r0, r2, #2
	mov r3, r8
	adds r2, r0, r3
	ldr r3, [r2]
	ldr r0, [r3]
	ldrb r1, [r1, #8]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	ldrb r0, [r0, #8]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r1, r0
	bge _0808C2AA
	str r4, [r2]
	str r3, [r5]
	movs r4, #1
	mov sl, r4
_0808C2AA:
	lsls r0, r6, #0x18
	lsrs r2, r0, #0x18
	mov r6, sb
	ldrb r6, [r6]
	subs r0, r6, r7
	cmp r2, r0
	blt _0808C27C
_0808C2B8:
	lsls r0, r7, #0x18
	lsrs r1, r0, #0x18
	mov r7, ip
	ldrb r0, [r7]
	subs r0, #1
	cmp r1, r0
	blt _0808C268
	bl _0808E31E
	.align 2, 0
_0808C2CC: .4byte 0x0200E668
_0808C2D0: .4byte 0x0200CBF0
_0808C2D4:
	cmp r2, #0
	bne _0808C358
	movs r1, #0
	mov sl, r1
	ldr r3, _0808C350 @ =0x0200E668
	mov ip, r3
	ldrb r0, [r3]
	subs r0, #1
	cmp r2, r0
	blt _0808C2EC
	bl _0808E31E
_0808C2EC:
	adds r4, r3, #0
	mov sb, r4
_0808C2F0:
	movs r2, #0
	adds r0, r1, #1
	mov r6, sb
	ldrb r6, [r6]
	subs r1, r6, r0
	adds r7, r0, #0
	cmp r2, r1
	bge _0808C33C
	ldr r0, _0808C354 @ =0x0200CBF0
	mov r8, r0
_0808C304:
	adds r6, r2, #1
	lsls r0, r6, #2
	mov r1, r8
	adds r5, r0, r1
	ldr r4, [r5]
	ldr r0, [r4]
	ldr r1, [r0, #4]
	lsls r0, r2, #2
	mov r3, r8
	adds r2, r0, r3
	ldr r3, [r2]
	ldr r0, [r3]
	ldr r0, [r0, #4]
	ldrb r1, [r1, #0xa]
	ldrb r0, [r0, #0xa]
	cmp r1, r0
	bhs _0808C32E
	str r4, [r2]
	str r3, [r5]
	movs r4, #1
	mov sl, r4
_0808C32E:
	lsls r0, r6, #0x18
	lsrs r2, r0, #0x18
	mov r6, sb
	ldrb r6, [r6]
	subs r0, r6, r7
	cmp r2, r0
	blt _0808C304
_0808C33C:
	lsls r0, r7, #0x18
	lsrs r1, r0, #0x18
	mov r7, ip
	ldrb r0, [r7]
	subs r0, #1
	cmp r1, r0
	blt _0808C2F0
	bl _0808E31E
	.align 2, 0
_0808C350: .4byte 0x0200E668
_0808C354: .4byte 0x0200CBF0
_0808C358:
	movs r1, #0
	mov sl, r1
	ldr r2, _0808C3D0 @ =0x0200E668
	mov ip, r2
	ldrb r0, [r2]
	subs r0, #1
	cmp sl, r0
	blt _0808C36C
	bl _0808E31E
_0808C36C:
	adds r3, r2, #0
	mov sb, r3
_0808C370:
	movs r2, #0
	adds r0, r1, #1
	mov r4, sb
	ldrb r4, [r4]
	subs r1, r4, r0
	adds r7, r0, #0
	cmp r2, r1
	bge _0808C3BC
	ldr r6, _0808C3D4 @ =0x0200CBF0
	mov r8, r6
_0808C384:
	adds r6, r2, #1
	lsls r0, r6, #2
	mov r1, r8
	adds r5, r0, r1
	ldr r4, [r5]
	ldr r0, [r4]
	ldr r1, [r0, #4]
	lsls r0, r2, #2
	mov r3, r8
	adds r2, r0, r3
	ldr r3, [r2]
	ldr r0, [r3]
	ldr r0, [r0, #4]
	ldrb r1, [r1, #0xa]
	ldrb r0, [r0, #0xa]
	cmp r1, r0
	bls _0808C3AE
	str r4, [r2]
	str r3, [r5]
	movs r4, #1
	mov sl, r4
_0808C3AE:
	lsls r0, r6, #0x18
	lsrs r2, r0, #0x18
	mov r6, sb
	ldrb r6, [r6]
	subs r0, r6, r7
	cmp r2, r0
	blt _0808C384
_0808C3BC:
	lsls r0, r7, #0x18
	lsrs r1, r0, #0x18
	mov r7, ip
	ldrb r0, [r7]
	subs r0, #1
	cmp r1, r0
	blt _0808C370
	bl _0808E31E
	.align 2, 0
_0808C3D0: .4byte 0x0200E668
_0808C3D4: .4byte 0x0200CBF0
_0808C3D8:
	cmp r2, #0
	bne _0808C458
	movs r1, #0
	mov sl, r1
	ldr r3, _0808C450 @ =0x0200E668
	mov ip, r3
	ldrb r0, [r3]
	subs r0, #1
	cmp r2, r0
	blt _0808C3F0
	bl _0808E31E
_0808C3F0:
	adds r4, r3, #0
	mov sb, r4
_0808C3F4:
	movs r2, #0
	adds r0, r1, #1
	mov r6, sb
	ldrb r6, [r6]
	subs r1, r6, r0
	adds r7, r0, #0
	cmp r2, r1
	bge _0808C43C
	ldr r0, _0808C454 @ =0x0200CBF0
	mov r8, r0
_0808C408:
	adds r6, r2, #1
	lsls r0, r6, #2
	mov r1, r8
	adds r5, r0, r1
	ldr r4, [r5]
	ldr r1, [r4]
	lsls r0, r2, #2
	mov r3, r8
	adds r2, r0, r3
	ldr r3, [r2]
	ldr r0, [r3]
	ldrb r1, [r1, #9]
	ldrb r0, [r0, #9]
	cmp r1, r0
	bls _0808C42E
	str r4, [r2]
	str r3, [r5]
	movs r4, #1
	mov sl, r4
_0808C42E:
	lsls r0, r6, #0x18
	lsrs r2, r0, #0x18
	mov r6, sb
	ldrb r6, [r6]
	subs r0, r6, r7
	cmp r2, r0
	blt _0808C408
_0808C43C:
	lsls r0, r7, #0x18
	lsrs r1, r0, #0x18
	mov r7, ip
	ldrb r0, [r7]
	subs r0, #1
	cmp r1, r0
	blt _0808C3F4
	bl _0808E31E
	.align 2, 0
_0808C450: .4byte 0x0200E668
_0808C454: .4byte 0x0200CBF0
_0808C458:
	movs r1, #0
	mov sl, r1
	ldr r2, _0808C4CC @ =0x0200E668
	mov ip, r2
	ldrb r0, [r2]
	subs r0, #1
	cmp sl, r0
	blt _0808C46C
	bl _0808E31E
_0808C46C:
	adds r3, r2, #0
	mov sb, r3
_0808C470:
	movs r2, #0
	adds r0, r1, #1
	mov r4, sb
	ldrb r4, [r4]
	subs r1, r4, r0
	adds r7, r0, #0
	cmp r2, r1
	bge _0808C4B8
	ldr r6, _0808C4D0 @ =0x0200CBF0
	mov r8, r6
_0808C484:
	adds r6, r2, #1
	lsls r0, r6, #2
	mov r1, r8
	adds r5, r0, r1
	ldr r4, [r5]
	ldr r1, [r4]
	lsls r0, r2, #2
	mov r3, r8
	adds r2, r0, r3
	ldr r3, [r2]
	ldr r0, [r3]
	ldrb r1, [r1, #9]
	ldrb r0, [r0, #9]
	cmp r1, r0
	bhs _0808C4AA
	str r4, [r2]
	str r3, [r5]
	movs r4, #1
	mov sl, r4
_0808C4AA:
	lsls r0, r6, #0x18
	lsrs r2, r0, #0x18
	mov r6, sb
	ldrb r6, [r6]
	subs r0, r6, r7
	cmp r2, r0
	blt _0808C484
_0808C4B8:
	lsls r0, r7, #0x18
	lsrs r1, r0, #0x18
	mov r7, ip
	ldrb r0, [r7]
	subs r0, #1
	cmp r1, r0
	blt _0808C470
	bl _0808E31E
	.align 2, 0
_0808C4CC: .4byte 0x0200E668
_0808C4D0: .4byte 0x0200CBF0
_0808C4D4:
	cmp r2, #0
	bne _0808C558
	movs r1, #0
	mov sl, r1
	ldr r3, _0808C550 @ =0x0200E668
	ldrb r0, [r3]
	subs r0, #1
	cmp r2, r0
	blt _0808C4EA
	bl _0808E20E
_0808C4EA:
	movs r5, #0
	adds r0, r1, #1
	ldrb r3, [r3]
	subs r1, r3, r0
	mov r8, r0
	cmp r5, r1
	bge _0808C53C
	ldr r2, _0808C554 @ =0x0200CBF0
	mov sb, r2
_0808C4FC:
	adds r7, r5, #1
	lsls r0, r7, #2
	mov r3, sb
	adds r6, r0, r3
	ldr r0, [r6]
	ldr r0, [r0]
	bl GetUnitCurrentHp
	adds r4, r0, #0
	lsls r0, r5, #2
	mov r1, sb
	adds r5, r0, r1
	ldr r0, [r5]
	ldr r0, [r0]
	bl GetUnitCurrentHp
	cmp r4, r0
	ble _0808C52C
	ldr r1, [r5]
	ldr r0, [r6]
	str r0, [r5]
	str r1, [r6]
	movs r2, #1
	mov sl, r2
_0808C52C:
	lsls r0, r7, #0x18
	lsrs r5, r0, #0x18
	ldr r0, _0808C550 @ =0x0200E668
	ldrb r0, [r0]
	mov r3, r8
	subs r0, r0, r3
	cmp r5, r0
	blt _0808C4FC
_0808C53C:
	mov r4, r8
	lsls r0, r4, #0x18
	lsrs r1, r0, #0x18
	ldr r3, _0808C550 @ =0x0200E668
	ldrb r0, [r3]
	subs r0, #1
	cmp r1, r0
	blt _0808C4EA
	bl _0808E20E
	.align 2, 0
_0808C550: .4byte 0x0200E668
_0808C554: .4byte 0x0200CBF0
_0808C558:
	movs r7, #0
	mov sl, r7
	movs r1, #0
	ldr r2, _0808C5D4 @ =0x0200E668
	ldrb r0, [r2]
	subs r0, #1
	cmp sl, r0
	blt _0808C56C
	bl _0808E29A
_0808C56C:
	movs r5, #0
	adds r0, r1, #1
	ldrb r2, [r2]
	subs r1, r2, r0
	mov r8, r0
	cmp r5, r1
	bge _0808C5BE
	ldr r0, _0808C5D8 @ =0x0200CBF0
	mov sb, r0
_0808C57E:
	adds r7, r5, #1
	lsls r0, r7, #2
	mov r1, sb
	adds r6, r0, r1
	ldr r0, [r6]
	ldr r0, [r0]
	bl GetUnitCurrentHp
	adds r4, r0, #0
	lsls r0, r5, #2
	mov r2, sb
	adds r5, r0, r2
	ldr r0, [r5]
	ldr r0, [r0]
	bl GetUnitCurrentHp
	cmp r4, r0
	bge _0808C5AE
	ldr r1, [r5]
	ldr r0, [r6]
	str r0, [r5]
	str r1, [r6]
	movs r3, #1
	mov sl, r3
_0808C5AE:
	lsls r0, r7, #0x18
	lsrs r5, r0, #0x18
	ldr r0, _0808C5D4 @ =0x0200E668
	ldrb r0, [r0]
	mov r4, r8
	subs r0, r0, r4
	cmp r5, r0
	blt _0808C57E
_0808C5BE:
	mov r6, r8
	lsls r0, r6, #0x18
	lsrs r1, r0, #0x18
	ldr r2, _0808C5D4 @ =0x0200E668
	ldrb r0, [r2]
	subs r0, #1
	cmp r1, r0
	blt _0808C56C
	bl _0808E29A
	.align 2, 0
_0808C5D4: .4byte 0x0200E668
_0808C5D8: .4byte 0x0200CBF0
_0808C5DC:
	cmp r2, #0
	bne _0808C664
	movs r0, #0
	mov sl, r0
	movs r1, #0
	ldr r3, _0808C65C @ =0x0200E668
	ldrb r0, [r3]
	subs r0, #1
	cmp r2, r0
	blt _0808C5F4
	bl _0808E31E
_0808C5F4:
	movs r5, #0
	adds r0, r1, #1
	ldrb r3, [r3]
	subs r1, r3, r0
	mov r8, r0
	cmp r5, r1
	bge _0808C646
	ldr r1, _0808C660 @ =0x0200CBF0
	mov sb, r1
_0808C606:
	adds r7, r5, #1
	lsls r0, r7, #2
	mov r2, sb
	adds r6, r0, r2
	ldr r0, [r6]
	ldr r0, [r0]
	bl GetUnitMaxHp
	adds r4, r0, #0
	lsls r0, r5, #2
	mov r3, sb
	adds r5, r0, r3
	ldr r0, [r5]
	ldr r0, [r0]
	bl GetUnitMaxHp
	cmp r4, r0
	ble _0808C636
	ldr r1, [r5]
	ldr r0, [r6]
	str r0, [r5]
	str r1, [r6]
	movs r4, #1
	mov sl, r4
_0808C636:
	lsls r0, r7, #0x18
	lsrs r5, r0, #0x18
	ldr r0, _0808C65C @ =0x0200E668
	ldrb r0, [r0]
	mov r6, r8
	subs r0, r0, r6
	cmp r5, r0
	blt _0808C606
_0808C646:
	mov r7, r8
	lsls r0, r7, #0x18
	lsrs r1, r0, #0x18
	ldr r3, _0808C65C @ =0x0200E668
	ldrb r0, [r3]
	subs r0, #1
	cmp r1, r0
	blt _0808C5F4
	bl _0808E31E
	.align 2, 0
_0808C65C: .4byte 0x0200E668
_0808C660: .4byte 0x0200CBF0
_0808C664:
	movs r1, #0
	mov sl, r1
	ldr r2, _0808C6DC @ =0x0200E668
	ldrb r0, [r2]
	subs r0, #1
	cmp sl, r0
	blt _0808C676
	bl _0808E20E
_0808C676:
	movs r5, #0
	adds r0, r1, #1
	ldrb r2, [r2]
	subs r1, r2, r0
	mov r8, r0
	cmp r5, r1
	bge _0808C6C8
	ldr r2, _0808C6E0 @ =0x0200CBF0
	mov sb, r2
_0808C688:
	adds r7, r5, #1
	lsls r0, r7, #2
	mov r3, sb
	adds r6, r0, r3
	ldr r0, [r6]
	ldr r0, [r0]
	bl GetUnitMaxHp
	adds r4, r0, #0
	lsls r0, r5, #2
	mov r1, sb
	adds r5, r0, r1
	ldr r0, [r5]
	ldr r0, [r0]
	bl GetUnitMaxHp
	cmp r4, r0
	bge _0808C6B8
	ldr r1, [r5]
	ldr r0, [r6]
	str r0, [r5]
	str r1, [r6]
	movs r2, #1
	mov sl, r2
_0808C6B8:
	lsls r0, r7, #0x18
	lsrs r5, r0, #0x18
	ldr r0, _0808C6DC @ =0x0200E668
	ldrb r0, [r0]
	mov r3, r8
	subs r0, r0, r3
	cmp r5, r0
	blt _0808C688
_0808C6C8:
	mov r4, r8
	lsls r0, r4, #0x18
	lsrs r1, r0, #0x18
	ldr r2, _0808C6DC @ =0x0200E668
	ldrb r0, [r2]
	subs r0, #1
	cmp r1, r0
	blt _0808C676
	bl _0808E20E
	.align 2, 0
_0808C6DC: .4byte 0x0200E668
_0808C6E0: .4byte 0x0200CBF0
_0808C6E4:
	cmp r2, #0
	bne _0808C76C
	movs r7, #0
	mov sl, r7
	movs r1, #0
	ldr r3, _0808C764 @ =0x0200E668
	ldrb r0, [r3]
	subs r0, #1
	cmp r2, r0
	blt _0808C6FC
	bl _0808E29A
_0808C6FC:
	movs r5, #0
	adds r0, r1, #1
	ldrb r3, [r3]
	subs r1, r3, r0
	mov r8, r0
	cmp r5, r1
	bge _0808C74E
	ldr r0, _0808C768 @ =0x0200CBF0
	mov sb, r0
_0808C70E:
	adds r7, r5, #1
	lsls r0, r7, #2
	mov r1, sb
	adds r6, r0, r1
	ldr r0, [r6]
	ldr r0, [r0]
	bl GetUnitPower
	adds r4, r0, #0
	lsls r0, r5, #2
	mov r2, sb
	adds r5, r0, r2
	ldr r0, [r5]
	ldr r0, [r0]
	bl GetUnitPower
	cmp r4, r0
	ble _0808C73E
	ldr r1, [r5]
	ldr r0, [r6]
	str r0, [r5]
	str r1, [r6]
	movs r3, #1
	mov sl, r3
_0808C73E:
	lsls r0, r7, #0x18
	lsrs r5, r0, #0x18
	ldr r0, _0808C764 @ =0x0200E668
	ldrb r0, [r0]
	mov r4, r8
	subs r0, r0, r4
	cmp r5, r0
	blt _0808C70E
_0808C74E:
	mov r6, r8
	lsls r0, r6, #0x18
	lsrs r1, r0, #0x18
	ldr r3, _0808C764 @ =0x0200E668
	ldrb r0, [r3]
	subs r0, #1
	cmp r1, r0
	blt _0808C6FC
	bl _0808E29A
	.align 2, 0
_0808C764: .4byte 0x0200E668
_0808C768: .4byte 0x0200CBF0
_0808C76C:
	movs r0, #0
	mov sl, r0
	movs r1, #0
	ldr r2, _0808C7E8 @ =0x0200E668
	ldrb r0, [r2]
	subs r0, #1
	cmp sl, r0
	blt _0808C780
	bl _0808E31E
_0808C780:
	movs r5, #0
	adds r0, r1, #1
	ldrb r2, [r2]
	subs r1, r2, r0
	mov r8, r0
	cmp r5, r1
	bge _0808C7D2
	ldr r1, _0808C7EC @ =0x0200CBF0
	mov sb, r1
_0808C792:
	adds r7, r5, #1
	lsls r0, r7, #2
	mov r2, sb
	adds r6, r0, r2
	ldr r0, [r6]
	ldr r0, [r0]
	bl GetUnitPower
	adds r4, r0, #0
	lsls r0, r5, #2
	mov r3, sb
	adds r5, r0, r3
	ldr r0, [r5]
	ldr r0, [r0]
	bl GetUnitPower
	cmp r4, r0
	bge _0808C7C2
	ldr r1, [r5]
	ldr r0, [r6]
	str r0, [r5]
	str r1, [r6]
	movs r4, #1
	mov sl, r4
_0808C7C2:
	lsls r0, r7, #0x18
	lsrs r5, r0, #0x18
	ldr r0, _0808C7E8 @ =0x0200E668
	ldrb r0, [r0]
	mov r6, r8
	subs r0, r0, r6
	cmp r5, r0
	blt _0808C792
_0808C7D2:
	mov r7, r8
	lsls r0, r7, #0x18
	lsrs r1, r0, #0x18
	ldr r2, _0808C7E8 @ =0x0200E668
	ldrb r0, [r2]
	subs r0, #1
	cmp r1, r0
	blt _0808C780
	bl _0808E31E
	.align 2, 0
_0808C7E8: .4byte 0x0200E668
_0808C7EC: .4byte 0x0200CBF0
_0808C7F0:
	cmp r2, #0
	bne _0808C874
	movs r1, #0
	mov sl, r1
	ldr r3, _0808C86C @ =0x0200E668
	ldrb r0, [r3]
	subs r0, #1
	cmp r2, r0
	blt _0808C806
	bl _0808E20E
_0808C806:
	movs r5, #0
	adds r0, r1, #1
	ldrb r3, [r3]
	subs r1, r3, r0
	mov r8, r0
	cmp r5, r1
	bge _0808C858
	ldr r2, _0808C870 @ =0x0200CBF0
	mov sb, r2
_0808C818:
	adds r7, r5, #1
	lsls r0, r7, #2
	mov r3, sb
	adds r6, r0, r3
	ldr r0, [r6]
	ldr r0, [r0]
	bl GetUnitSkill
	adds r4, r0, #0
	lsls r0, r5, #2
	mov r1, sb
	adds r5, r0, r1
	ldr r0, [r5]
	ldr r0, [r0]
	bl GetUnitSkill
	cmp r4, r0
	ble _0808C848
	ldr r1, [r5]
	ldr r0, [r6]
	str r0, [r5]
	str r1, [r6]
	movs r2, #1
	mov sl, r2
_0808C848:
	lsls r0, r7, #0x18
	lsrs r5, r0, #0x18
	ldr r0, _0808C86C @ =0x0200E668
	ldrb r0, [r0]
	mov r3, r8
	subs r0, r0, r3
	cmp r5, r0
	blt _0808C818
_0808C858:
	mov r4, r8
	lsls r0, r4, #0x18
	lsrs r1, r0, #0x18
	ldr r3, _0808C86C @ =0x0200E668
	ldrb r0, [r3]
	subs r0, #1
	cmp r1, r0
	blt _0808C806
	bl _0808E20E
	.align 2, 0
_0808C86C: .4byte 0x0200E668
_0808C870: .4byte 0x0200CBF0
_0808C874:
	movs r7, #0
	mov sl, r7
	movs r1, #0
	ldr r2, _0808C8F0 @ =0x0200E668
	ldrb r0, [r2]
	subs r0, #1
	cmp sl, r0
	blt _0808C888
	bl _0808E29A
_0808C888:
	movs r5, #0
	adds r0, r1, #1
	ldrb r2, [r2]
	subs r1, r2, r0
	mov r8, r0
	cmp r5, r1
	bge _0808C8DA
	ldr r0, _0808C8F4 @ =0x0200CBF0
	mov sb, r0
_0808C89A:
	adds r7, r5, #1
	lsls r0, r7, #2
	mov r1, sb
	adds r6, r0, r1
	ldr r0, [r6]
	ldr r0, [r0]
	bl GetUnitSkill
	adds r4, r0, #0
	lsls r0, r5, #2
	mov r2, sb
	adds r5, r0, r2
	ldr r0, [r5]
	ldr r0, [r0]
	bl GetUnitSkill
	cmp r4, r0
	bge _0808C8CA
	ldr r1, [r5]
	ldr r0, [r6]
	str r0, [r5]
	str r1, [r6]
	movs r3, #1
	mov sl, r3
_0808C8CA:
	lsls r0, r7, #0x18
	lsrs r5, r0, #0x18
	ldr r0, _0808C8F0 @ =0x0200E668
	ldrb r0, [r0]
	mov r4, r8
	subs r0, r0, r4
	cmp r5, r0
	blt _0808C89A
_0808C8DA:
	mov r6, r8
	lsls r0, r6, #0x18
	lsrs r1, r0, #0x18
	ldr r2, _0808C8F0 @ =0x0200E668
	ldrb r0, [r2]
	subs r0, #1
	cmp r1, r0
	blt _0808C888
	bl _0808E29A
	.align 2, 0
_0808C8F0: .4byte 0x0200E668
_0808C8F4: .4byte 0x0200CBF0
_0808C8F8:
	cmp r2, #0
	bne _0808C980
	movs r0, #0
	mov sl, r0
	movs r1, #0
	ldr r3, _0808C978 @ =0x0200E668
	ldrb r0, [r3]
	subs r0, #1
	cmp r2, r0
	blt _0808C910
	bl _0808E31E
_0808C910:
	movs r5, #0
	adds r0, r1, #1
	ldrb r3, [r3]
	subs r1, r3, r0
	mov r8, r0
	cmp r5, r1
	bge _0808C962
	ldr r1, _0808C97C @ =0x0200CBF0
	mov sb, r1
_0808C922:
	adds r7, r5, #1
	lsls r0, r7, #2
	mov r2, sb
	adds r6, r0, r2
	ldr r0, [r6]
	ldr r0, [r0]
	bl GetUnitSpeed
	adds r4, r0, #0
	lsls r0, r5, #2
	mov r3, sb
	adds r5, r0, r3
	ldr r0, [r5]
	ldr r0, [r0]
	bl GetUnitSpeed
	cmp r4, r0
	ble _0808C952
	ldr r1, [r5]
	ldr r0, [r6]
	str r0, [r5]
	str r1, [r6]
	movs r4, #1
	mov sl, r4
_0808C952:
	lsls r0, r7, #0x18
	lsrs r5, r0, #0x18
	ldr r0, _0808C978 @ =0x0200E668
	ldrb r0, [r0]
	mov r6, r8
	subs r0, r0, r6
	cmp r5, r0
	blt _0808C922
_0808C962:
	mov r7, r8
	lsls r0, r7, #0x18
	lsrs r1, r0, #0x18
	ldr r3, _0808C978 @ =0x0200E668
	ldrb r0, [r3]
	subs r0, #1
	cmp r1, r0
	blt _0808C910
	bl _0808E31E
	.align 2, 0
_0808C978: .4byte 0x0200E668
_0808C97C: .4byte 0x0200CBF0
_0808C980:
	movs r1, #0
	mov sl, r1
	ldr r2, _0808C9F8 @ =0x0200E668
	ldrb r0, [r2]
	subs r0, #1
	cmp sl, r0
	blt _0808C992
	bl _0808E20E
_0808C992:
	movs r5, #0
	adds r0, r1, #1
	ldrb r2, [r2]
	subs r1, r2, r0
	mov r8, r0
	cmp r5, r1
	bge _0808C9E4
	ldr r2, _0808C9FC @ =0x0200CBF0
	mov sb, r2
_0808C9A4:
	adds r7, r5, #1
	lsls r0, r7, #2
	mov r3, sb
	adds r6, r0, r3
	ldr r0, [r6]
	ldr r0, [r0]
	bl GetUnitSpeed
	adds r4, r0, #0
	lsls r0, r5, #2
	mov r1, sb
	adds r5, r0, r1
	ldr r0, [r5]
	ldr r0, [r0]
	bl GetUnitSpeed
	cmp r4, r0
	bge _0808C9D4
	ldr r1, [r5]
	ldr r0, [r6]
	str r0, [r5]
	str r1, [r6]
	movs r2, #1
	mov sl, r2
_0808C9D4:
	lsls r0, r7, #0x18
	lsrs r5, r0, #0x18
	ldr r0, _0808C9F8 @ =0x0200E668
	ldrb r0, [r0]
	mov r3, r8
	subs r0, r0, r3
	cmp r5, r0
	blt _0808C9A4
_0808C9E4:
	mov r4, r8
	lsls r0, r4, #0x18
	lsrs r1, r0, #0x18
	ldr r2, _0808C9F8 @ =0x0200E668
	ldrb r0, [r2]
	subs r0, #1
	cmp r1, r0
	blt _0808C992
	bl _0808E20E
	.align 2, 0
_0808C9F8: .4byte 0x0200E668
_0808C9FC: .4byte 0x0200CBF0
_0808CA00:
	cmp r2, #0
	bne _0808CA88
	movs r7, #0
	mov sl, r7
	movs r1, #0
	ldr r3, _0808CA80 @ =0x0200E668
	ldrb r0, [r3]
	subs r0, #1
	cmp r2, r0
	blt _0808CA18
	bl _0808E29A
_0808CA18:
	movs r5, #0
	adds r0, r1, #1
	ldrb r3, [r3]
	subs r1, r3, r0
	mov r8, r0
	cmp r5, r1
	bge _0808CA6A
	ldr r0, _0808CA84 @ =0x0200CBF0
	mov sb, r0
_0808CA2A:
	adds r7, r5, #1
	lsls r0, r7, #2
	mov r1, sb
	adds r6, r0, r1
	ldr r0, [r6]
	ldr r0, [r0]
	bl GetUnitLuck
	adds r4, r0, #0
	lsls r0, r5, #2
	mov r2, sb
	adds r5, r0, r2
	ldr r0, [r5]
	ldr r0, [r0]
	bl GetUnitLuck
	cmp r4, r0
	ble _0808CA5A
	ldr r1, [r5]
	ldr r0, [r6]
	str r0, [r5]
	str r1, [r6]
	movs r3, #1
	mov sl, r3
_0808CA5A:
	lsls r0, r7, #0x18
	lsrs r5, r0, #0x18
	ldr r0, _0808CA80 @ =0x0200E668
	ldrb r0, [r0]
	mov r4, r8
	subs r0, r0, r4
	cmp r5, r0
	blt _0808CA2A
_0808CA6A:
	mov r6, r8
	lsls r0, r6, #0x18
	lsrs r1, r0, #0x18
	ldr r3, _0808CA80 @ =0x0200E668
	ldrb r0, [r3]
	subs r0, #1
	cmp r1, r0
	blt _0808CA18
	bl _0808E29A
	.align 2, 0
_0808CA80: .4byte 0x0200E668
_0808CA84: .4byte 0x0200CBF0
_0808CA88:
	movs r0, #0
	mov sl, r0
	movs r1, #0
	ldr r2, _0808CB04 @ =0x0200E668
	ldrb r0, [r2]
	subs r0, #1
	cmp sl, r0
	blt _0808CA9C
	bl _0808E31E
_0808CA9C:
	movs r5, #0
	adds r0, r1, #1
	ldrb r2, [r2]
	subs r1, r2, r0
	mov r8, r0
	cmp r5, r1
	bge _0808CAEE
	ldr r1, _0808CB08 @ =0x0200CBF0
	mov sb, r1
_0808CAAE:
	adds r7, r5, #1
	lsls r0, r7, #2
	mov r2, sb
	adds r6, r0, r2
	ldr r0, [r6]
	ldr r0, [r0]
	bl GetUnitLuck
	adds r4, r0, #0
	lsls r0, r5, #2
	mov r3, sb
	adds r5, r0, r3
	ldr r0, [r5]
	ldr r0, [r0]
	bl GetUnitLuck
	cmp r4, r0
	bge _0808CADE
	ldr r1, [r5]
	ldr r0, [r6]
	str r0, [r5]
	str r1, [r6]
	movs r4, #1
	mov sl, r4
_0808CADE:
	lsls r0, r7, #0x18
	lsrs r5, r0, #0x18
	ldr r0, _0808CB04 @ =0x0200E668
	ldrb r0, [r0]
	mov r6, r8
	subs r0, r0, r6
	cmp r5, r0
	blt _0808CAAE
_0808CAEE:
	mov r7, r8
	lsls r0, r7, #0x18
	lsrs r1, r0, #0x18
	ldr r2, _0808CB04 @ =0x0200E668
	ldrb r0, [r2]
	subs r0, #1
	cmp r1, r0
	blt _0808CA9C
	bl _0808E31E
	.align 2, 0
_0808CB04: .4byte 0x0200E668
_0808CB08: .4byte 0x0200CBF0
_0808CB0C:
	cmp r2, #0
	bne _0808CB90
	movs r1, #0
	mov sl, r1
	ldr r3, _0808CB88 @ =0x0200E668
	ldrb r0, [r3]
	subs r0, #1
	cmp r2, r0
	blt _0808CB22
	bl _0808E20E
_0808CB22:
	movs r5, #0
	adds r0, r1, #1
	ldrb r3, [r3]
	subs r1, r3, r0
	mov r8, r0
	cmp r5, r1
	bge _0808CB74
	ldr r2, _0808CB8C @ =0x0200CBF0
	mov sb, r2
_0808CB34:
	adds r7, r5, #1
	lsls r0, r7, #2
	mov r3, sb
	adds r6, r0, r3
	ldr r0, [r6]
	ldr r0, [r0]
	bl GetUnitDefense
	adds r4, r0, #0
	lsls r0, r5, #2
	mov r1, sb
	adds r5, r0, r1
	ldr r0, [r5]
	ldr r0, [r0]
	bl GetUnitDefense
	cmp r4, r0
	ble _0808CB64
	ldr r1, [r5]
	ldr r0, [r6]
	str r0, [r5]
	str r1, [r6]
	movs r2, #1
	mov sl, r2
_0808CB64:
	lsls r0, r7, #0x18
	lsrs r5, r0, #0x18
	ldr r0, _0808CB88 @ =0x0200E668
	ldrb r0, [r0]
	mov r3, r8
	subs r0, r0, r3
	cmp r5, r0
	blt _0808CB34
_0808CB74:
	mov r4, r8
	lsls r0, r4, #0x18
	lsrs r1, r0, #0x18
	ldr r3, _0808CB88 @ =0x0200E668
	ldrb r0, [r3]
	subs r0, #1
	cmp r1, r0
	blt _0808CB22
	bl _0808E20E
	.align 2, 0
_0808CB88: .4byte 0x0200E668
_0808CB8C: .4byte 0x0200CBF0
_0808CB90:
	movs r7, #0
	mov sl, r7
	movs r1, #0
	ldr r2, _0808CC0C @ =0x0200E668
	ldrb r0, [r2]
	subs r0, #1
	cmp sl, r0
	blt _0808CBA4
	bl _0808E29A
_0808CBA4:
	movs r5, #0
	adds r0, r1, #1
	ldrb r2, [r2]
	subs r1, r2, r0
	mov r8, r0
	cmp r5, r1
	bge _0808CBF6
	ldr r0, _0808CC10 @ =0x0200CBF0
	mov sb, r0
_0808CBB6:
	adds r7, r5, #1
	lsls r0, r7, #2
	mov r1, sb
	adds r6, r0, r1
	ldr r0, [r6]
	ldr r0, [r0]
	bl GetUnitDefense
	adds r4, r0, #0
	lsls r0, r5, #2
	mov r2, sb
	adds r5, r0, r2
	ldr r0, [r5]
	ldr r0, [r0]
	bl GetUnitDefense
	cmp r4, r0
	bge _0808CBE6
	ldr r1, [r5]
	ldr r0, [r6]
	str r0, [r5]
	str r1, [r6]
	movs r3, #1
	mov sl, r3
_0808CBE6:
	lsls r0, r7, #0x18
	lsrs r5, r0, #0x18
	ldr r0, _0808CC0C @ =0x0200E668
	ldrb r0, [r0]
	mov r4, r8
	subs r0, r0, r4
	cmp r5, r0
	blt _0808CBB6
_0808CBF6:
	mov r6, r8
	lsls r0, r6, #0x18
	lsrs r1, r0, #0x18
	ldr r2, _0808CC0C @ =0x0200E668
	ldrb r0, [r2]
	subs r0, #1
	cmp r1, r0
	blt _0808CBA4
	bl _0808E29A
	.align 2, 0
_0808CC0C: .4byte 0x0200E668
_0808CC10: .4byte 0x0200CBF0
_0808CC14:
	cmp r2, #0
	bne _0808CC9C
	movs r0, #0
	mov sl, r0
	movs r1, #0
	ldr r3, _0808CC94 @ =0x0200E668
	ldrb r0, [r3]
	subs r0, #1
	cmp r2, r0
	blt _0808CC2C
	bl _0808E31E
_0808CC2C:
	movs r5, #0
	adds r0, r1, #1
	ldrb r3, [r3]
	subs r1, r3, r0
	mov r8, r0
	cmp r5, r1
	bge _0808CC7E
	ldr r1, _0808CC98 @ =0x0200CBF0
	mov sb, r1
_0808CC3E:
	adds r7, r5, #1
	lsls r0, r7, #2
	mov r2, sb
	adds r6, r0, r2
	ldr r0, [r6]
	ldr r0, [r0]
	bl GetUnitResistance
	adds r4, r0, #0
	lsls r0, r5, #2
	mov r3, sb
	adds r5, r0, r3
	ldr r0, [r5]
	ldr r0, [r0]
	bl GetUnitResistance
	cmp r4, r0
	ble _0808CC6E
	ldr r1, [r5]
	ldr r0, [r6]
	str r0, [r5]
	str r1, [r6]
	movs r4, #1
	mov sl, r4
_0808CC6E:
	lsls r0, r7, #0x18
	lsrs r5, r0, #0x18
	ldr r0, _0808CC94 @ =0x0200E668
	ldrb r0, [r0]
	mov r6, r8
	subs r0, r0, r6
	cmp r5, r0
	blt _0808CC3E
_0808CC7E:
	mov r7, r8
	lsls r0, r7, #0x18
	lsrs r1, r0, #0x18
	ldr r3, _0808CC94 @ =0x0200E668
	ldrb r0, [r3]
	subs r0, #1
	cmp r1, r0
	blt _0808CC2C
	bl _0808E31E
	.align 2, 0
_0808CC94: .4byte 0x0200E668
_0808CC98: .4byte 0x0200CBF0
_0808CC9C:
	movs r1, #0
	mov sl, r1
	ldr r2, _0808CD14 @ =0x0200E668
	ldrb r0, [r2]
	subs r0, #1
	cmp sl, r0
	blt _0808CCAE
	bl _0808E20E
_0808CCAE:
	movs r5, #0
	adds r0, r1, #1
	ldrb r2, [r2]
	subs r1, r2, r0
	mov r8, r0
	cmp r5, r1
	bge _0808CD00
	ldr r2, _0808CD18 @ =0x0200CBF0
	mov sb, r2
_0808CCC0:
	adds r7, r5, #1
	lsls r0, r7, #2
	mov r3, sb
	adds r6, r0, r3
	ldr r0, [r6]
	ldr r0, [r0]
	bl GetUnitResistance
	adds r4, r0, #0
	lsls r0, r5, #2
	mov r1, sb
	adds r5, r0, r1
	ldr r0, [r5]
	ldr r0, [r0]
	bl GetUnitResistance
	cmp r4, r0
	bge _0808CCF0
	ldr r1, [r5]
	ldr r0, [r6]
	str r0, [r5]
	str r1, [r6]
	movs r2, #1
	mov sl, r2
_0808CCF0:
	lsls r0, r7, #0x18
	lsrs r5, r0, #0x18
	ldr r0, _0808CD14 @ =0x0200E668
	ldrb r0, [r0]
	mov r3, r8
	subs r0, r0, r3
	cmp r5, r0
	blt _0808CCC0
_0808CD00:
	mov r4, r8
	lsls r0, r4, #0x18
	lsrs r1, r0, #0x18
	ldr r2, _0808CD14 @ =0x0200E668
	ldrb r0, [r2]
	subs r0, #1
	cmp r1, r0
	blt _0808CCAE
	bl _0808E20E
	.align 2, 0
_0808CD14: .4byte 0x0200E668
_0808CD18: .4byte 0x0200CBF0
_0808CD1C:
	cmp r2, #0
	bne _0808CDCC
	movs r7, #0
	str r7, [sp, #0x48]
	movs r1, #0
	ldr r3, _0808CDC4 @ =0x0200E668
	ldrb r0, [r3]
	subs r0, #1
	cmp r2, r0
	bge _0808CDBC
	adds r4, r3, #0
	mov sl, r4
_0808CD34:
	movs r2, #0
	adds r0, r1, #1
	mov r6, sl
	ldrb r6, [r6]
	subs r1, r6, r0
	mov sb, r0
	cmp r2, r1
	bge _0808CDAC
	ldr r7, _0808CDC8 @ =0x0200CBF0
	mov ip, r7
_0808CD48:
	adds r0, r2, #1
	mov r8, r0
	lsls r0, r0, #2
	mov r1, ip
	adds r7, r0, r1
	ldr r6, [r7]
	ldr r1, [r6]
	ldr r0, [r1, #4]
	movs r3, #0x11
	ldrsb r3, [r0, r3]
	ldr r0, [r1]
	ldrb r0, [r0, #0x13]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r3, r3, r0
	movs r0, #0x1a
	ldrsb r0, [r1, r0]
	adds r3, r3, r0
	lsls r0, r2, #2
	mov r2, ip
	adds r4, r0, r2
	ldr r5, [r4]
	ldr r2, [r5]
	ldr r0, [r2, #4]
	ldrb r0, [r0, #0x11]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	ldr r1, [r2]
	ldrb r1, [r1, #0x13]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	adds r0, r0, r1
	movs r1, #0x1a
	ldrsb r1, [r2, r1]
	adds r0, r0, r1
	cmp r3, r0
	ble _0808CD9A
	str r6, [r4]
	str r5, [r7]
	movs r3, #1
	str r3, [sp, #0x48]
_0808CD9A:
	mov r4, r8
	lsls r0, r4, #0x18
	lsrs r2, r0, #0x18
	mov r6, sl
	ldrb r6, [r6]
	mov r7, sb
	subs r0, r6, r7
	cmp r2, r0
	blt _0808CD48
_0808CDAC:
	mov r1, sb
	lsls r0, r1, #0x18
	lsrs r1, r0, #0x18
	ldr r2, _0808CDC4 @ =0x0200E668
	ldrb r0, [r2]
	subs r0, #1
	cmp r1, r0
	blt _0808CD34
_0808CDBC:
	ldr r3, [sp, #0x48]
	bl _0808D68E
	.align 2, 0
_0808CDC4: .4byte 0x0200E668
_0808CDC8: .4byte 0x0200CBF0
_0808CDCC:
	movs r4, #0
	str r4, [sp, #0x4c]
	movs r1, #0
	ldr r6, _0808CE70 @ =0x0200E668
	ldrb r0, [r6]
	subs r0, #1
	cmp r4, r0
	bge _0808CE68
	adds r7, r6, #0
	mov sl, r7
_0808CDE0:
	movs r2, #0
	adds r0, r1, #1
	mov r3, sl
	ldrb r3, [r3]
	subs r1, r3, r0
	mov sb, r0
	cmp r2, r1
	bge _0808CE58
	ldr r4, _0808CE74 @ =0x0200CBF0
	mov ip, r4
_0808CDF4:
	adds r6, r2, #1
	mov r8, r6
	lsls r0, r6, #2
	mov r1, ip
	adds r7, r0, r1
	ldr r6, [r7]
	ldr r1, [r6]
	ldr r0, [r1, #4]
	movs r3, #0x11
	ldrsb r3, [r0, r3]
	ldr r0, [r1]
	ldrb r0, [r0, #0x13]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r3, r3, r0
	movs r0, #0x1a
	ldrsb r0, [r1, r0]
	adds r3, r3, r0
	lsls r0, r2, #2
	mov r2, ip
	adds r4, r0, r2
	ldr r5, [r4]
	ldr r2, [r5]
	ldr r0, [r2, #4]
	ldrb r0, [r0, #0x11]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	ldr r1, [r2]
	ldrb r1, [r1, #0x13]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	adds r0, r0, r1
	movs r1, #0x1a
	ldrsb r1, [r2, r1]
	adds r0, r0, r1
	cmp r3, r0
	bge _0808CE46
	str r6, [r4]
	str r5, [r7]
	movs r3, #1
	str r3, [sp, #0x4c]
_0808CE46:
	mov r4, r8
	lsls r0, r4, #0x18
	lsrs r2, r0, #0x18
	mov r6, sl
	ldrb r6, [r6]
	mov r7, sb
	subs r0, r6, r7
	cmp r2, r0
	blt _0808CDF4
_0808CE58:
	mov r1, sb
	lsls r0, r1, #0x18
	lsrs r1, r0, #0x18
	ldr r2, _0808CE70 @ =0x0200E668
	ldrb r0, [r2]
	subs r0, #1
	cmp r1, r0
	blt _0808CDE0
_0808CE68:
	ldr r3, [sp, #0x4c]
	bl _0808D68E
	.align 2, 0
_0808CE70: .4byte 0x0200E668
_0808CE74: .4byte 0x0200CBF0
_0808CE78:
	cmp r2, #0
	bne _0808CF00
	movs r4, #0
	mov sl, r4
	movs r1, #0
	ldr r3, _0808CEF8 @ =0x0200E668
	ldrb r0, [r3]
	subs r0, #1
	cmp r2, r0
	blt _0808CE90
	bl _0808E29A
_0808CE90:
	movs r5, #0
	adds r0, r1, #1
	ldrb r3, [r3]
	subs r1, r3, r0
	mov r8, r0
	cmp r5, r1
	bge _0808CEE2
	ldr r6, _0808CEFC @ =0x0200CBF0
	mov sb, r6
_0808CEA2:
	adds r7, r5, #1
	lsls r0, r7, #2
	mov r1, sb
	adds r6, r0, r1
	ldr r0, [r6]
	ldr r0, [r0]
	bl GetUnitAid
	adds r4, r0, #0
	lsls r0, r5, #2
	mov r2, sb
	adds r5, r0, r2
	ldr r0, [r5]
	ldr r0, [r0]
	bl GetUnitAid
	cmp r4, r0
	ble _0808CED2
	ldr r1, [r5]
	ldr r0, [r6]
	str r0, [r5]
	str r1, [r6]
	movs r3, #1
	mov sl, r3
_0808CED2:
	lsls r0, r7, #0x18
	lsrs r5, r0, #0x18
	ldr r0, _0808CEF8 @ =0x0200E668
	ldrb r0, [r0]
	mov r4, r8
	subs r0, r0, r4
	cmp r5, r0
	blt _0808CEA2
_0808CEE2:
	mov r6, r8
	lsls r0, r6, #0x18
	lsrs r1, r0, #0x18
	ldr r3, _0808CEF8 @ =0x0200E668
	ldrb r0, [r3]
	subs r0, #1
	cmp r1, r0
	blt _0808CE90
	bl _0808E29A
	.align 2, 0
_0808CEF8: .4byte 0x0200E668
_0808CEFC: .4byte 0x0200CBF0
_0808CF00:
	movs r0, #0
	mov sl, r0
	movs r1, #0
	ldr r2, _0808CF7C @ =0x0200E668
	ldrb r0, [r2]
	subs r0, #1
	cmp sl, r0
	blt _0808CF14
	bl _0808E31E
_0808CF14:
	movs r5, #0
	adds r0, r1, #1
	ldrb r2, [r2]
	subs r1, r2, r0
	mov r8, r0
	cmp r5, r1
	bge _0808CF66
	ldr r1, _0808CF80 @ =0x0200CBF0
	mov sb, r1
_0808CF26:
	adds r7, r5, #1
	lsls r0, r7, #2
	mov r2, sb
	adds r6, r0, r2
	ldr r0, [r6]
	ldr r0, [r0]
	bl GetUnitAid
	adds r4, r0, #0
	lsls r0, r5, #2
	mov r3, sb
	adds r5, r0, r3
	ldr r0, [r5]
	ldr r0, [r0]
	bl GetUnitAid
	cmp r4, r0
	bge _0808CF56
	ldr r1, [r5]
	ldr r0, [r6]
	str r0, [r5]
	str r1, [r6]
	movs r4, #1
	mov sl, r4
_0808CF56:
	lsls r0, r7, #0x18
	lsrs r5, r0, #0x18
	ldr r0, _0808CF7C @ =0x0200E668
	ldrb r0, [r0]
	mov r6, r8
	subs r0, r0, r6
	cmp r5, r0
	blt _0808CF26
_0808CF66:
	mov r7, r8
	lsls r0, r7, #0x18
	lsrs r1, r0, #0x18
	ldr r2, _0808CF7C @ =0x0200E668
	ldrb r0, [r2]
	subs r0, #1
	cmp r1, r0
	blt _0808CF14
	bl _0808E31E
	.align 2, 0
_0808CF7C: .4byte 0x0200E668
_0808CF80: .4byte 0x0200CBF0
_0808CF84:
	cmp r2, #0
	bne _0808D008
	movs r1, #0
	mov sl, r1
	ldr r3, _0808D000 @ =0x0200E668
	ldrb r0, [r3]
	subs r0, #1
	cmp r2, r0
	blt _0808CF9A
	bl _0808E20E
_0808CF9A:
	movs r5, #0
	adds r0, r1, #1
	ldrb r3, [r3]
	subs r1, r3, r0
	mov r8, r0
	cmp r5, r1
	bge _0808CFEC
	ldr r2, _0808D004 @ =0x0200CBF0
	mov sb, r2
_0808CFAC:
	adds r7, r5, #1
	lsls r0, r7, #2
	mov r3, sb
	adds r6, r0, r3
	ldr r0, [r6]
	ldr r0, [r0]
	bl GetUnitAffinityIcon
	adds r4, r0, #0
	lsls r0, r5, #2
	mov r1, sb
	adds r5, r0, r1
	ldr r0, [r5]
	ldr r0, [r0]
	bl GetUnitAffinityIcon
	cmp r4, r0
	bge _0808CFDC
	ldr r1, [r5]
	ldr r0, [r6]
	str r0, [r5]
	str r1, [r6]
	movs r2, #1
	mov sl, r2
_0808CFDC:
	lsls r0, r7, #0x18
	lsrs r5, r0, #0x18
	ldr r0, _0808D000 @ =0x0200E668
	ldrb r0, [r0]
	mov r3, r8
	subs r0, r0, r3
	cmp r5, r0
	blt _0808CFAC
_0808CFEC:
	mov r4, r8
	lsls r0, r4, #0x18
	lsrs r1, r0, #0x18
	ldr r3, _0808D000 @ =0x0200E668
	ldrb r0, [r3]
	subs r0, #1
	cmp r1, r0
	blt _0808CF9A
	bl _0808E20E
	.align 2, 0
_0808D000: .4byte 0x0200E668
_0808D004: .4byte 0x0200CBF0
_0808D008:
	movs r7, #0
	mov sl, r7
	movs r1, #0
	ldr r2, _0808D084 @ =0x0200E668
	ldrb r0, [r2]
	subs r0, #1
	cmp sl, r0
	blt _0808D01C
	bl _0808E29A
_0808D01C:
	movs r5, #0
	adds r0, r1, #1
	ldrb r2, [r2]
	subs r1, r2, r0
	mov r8, r0
	cmp r5, r1
	bge _0808D06E
	ldr r0, _0808D088 @ =0x0200CBF0
	mov sb, r0
_0808D02E:
	adds r7, r5, #1
	lsls r0, r7, #2
	mov r1, sb
	adds r6, r0, r1
	ldr r0, [r6]
	ldr r0, [r0]
	bl GetUnitAffinityIcon
	adds r4, r0, #0
	lsls r0, r5, #2
	mov r2, sb
	adds r5, r0, r2
	ldr r0, [r5]
	ldr r0, [r0]
	bl GetUnitAffinityIcon
	cmp r4, r0
	ble _0808D05E
	ldr r1, [r5]
	ldr r0, [r6]
	str r0, [r5]
	str r1, [r6]
	movs r3, #1
	mov sl, r3
_0808D05E:
	lsls r0, r7, #0x18
	lsrs r5, r0, #0x18
	ldr r0, _0808D084 @ =0x0200E668
	ldrb r0, [r0]
	mov r4, r8
	subs r0, r0, r4
	cmp r5, r0
	blt _0808D02E
_0808D06E:
	mov r6, r8
	lsls r0, r6, #0x18
	lsrs r1, r0, #0x18
	ldr r2, _0808D084 @ =0x0200E668
	ldrb r0, [r2]
	subs r0, #1
	cmp r1, r0
	blt _0808D01C
	bl _0808E29A
	.align 2, 0
_0808D084: .4byte 0x0200E668
_0808D088: .4byte 0x0200CBF0
_0808D08C:
	cmp r2, #0
	beq _0808D092
	b _0808D194
_0808D092:
	movs r0, #0
	str r0, [sp, #0x50]
	movs r4, #0
	ldr r0, _0808D0D0 @ =0x0200E668
	ldrb r0, [r0]
	cmp r2, r0
	bhs _0808D0CA
	ldr r5, _0808D0D4 @ =0x0200CBF0
_0808D0A2:
	lsls r0, r4, #2
	adds r0, r0, r5
	ldr r0, [r0]
	ldr r0, [r0]
	bl GetUnitEquippedWeapon
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl GetItemIndex
	mov r2, sp
	adds r1, r2, r4
	strb r0, [r1]
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	ldr r0, _0808D0D0 @ =0x0200E668
	ldrb r0, [r0]
	cmp r4, r0
	blo _0808D0A2
_0808D0CA:
	movs r4, #0
	b _0808D182
	.align 2, 0
_0808D0D0: .4byte 0x0200E668
_0808D0D4: .4byte 0x0200CBF0
_0808D0D8:
	movs r6, #0
	adds r0, r4, #1
	ldrb r1, [r1]
	subs r1, r1, r0
	str r0, [sp, #0x58]
	cmp r6, r1
	bge _0808D17C
	ldr r3, _0808D124 @ =0x0200CBF0
	mov sl, r3
_0808D0EA:
	adds r0, r6, #1
	mov r4, sp
	adds r4, r4, r0
	mov r8, r4
	mov r7, sp
	adds r5, r7, r6
	ldrb r4, [r4]
	adds r3, r4, #0
	ldrb r2, [r5]
	mov sb, r0
	cmp r3, r2
	bls _0808D128
	adds r1, r2, #0
	strb r4, [r5]
	mov r0, r8
	strb r1, [r0]
	lsls r2, r6, #2
	add r2, sl
	ldr r3, [r2]
	mov r4, sb
	lsls r1, r4, #2
	add r1, sl
	ldr r0, [r1]
	str r0, [r2]
	str r3, [r1]
	movs r6, #1
	str r6, [sp, #0x50]
	b _0808D16A
	.align 2, 0
_0808D124: .4byte 0x0200CBF0
_0808D128:
	cmp r3, r2
	bne _0808D16A
	mov r7, sb
	lsls r0, r7, #2
	mov r1, sl
	adds r7, r0, r1
	ldr r0, [r7]
	ldr r0, [r0]
	bl GetUnitEquippedWeapon
	adds r4, r0, #0
	lsls r0, r6, #2
	mov r2, sl
	adds r6, r0, r2
	ldr r0, [r6]
	ldr r0, [r0]
	bl GetUnitEquippedWeapon
	lsls r4, r4, #0x10
	lsls r0, r0, #0x10
	cmp r4, r0
	bls _0808D16A
	ldrb r1, [r5]
	mov r3, r8
	ldrb r0, [r3]
	strb r0, [r5]
	strb r1, [r3]
	ldr r3, [r6]
	ldr r0, [r7]
	str r0, [r6]
	str r3, [r7]
	movs r4, #1
	str r4, [sp, #0x50]
_0808D16A:
	mov r6, sb
	lsls r0, r6, #0x18
	lsrs r6, r0, #0x18
	ldr r0, _0808D190 @ =0x0200E668
	ldrb r0, [r0]
	ldr r7, [sp, #0x58]
	subs r0, r0, r7
	cmp r6, r0
	blt _0808D0EA
_0808D17C:
	ldr r1, [sp, #0x58]
	lsls r0, r1, #0x18
	lsrs r4, r0, #0x18
_0808D182:
	ldr r1, _0808D190 @ =0x0200E668
	ldrb r0, [r1]
	subs r0, #1
	cmp r4, r0
	blt _0808D0D8
	ldr r2, [sp, #0x50]
	b _0808D286
	.align 2, 0
_0808D190: .4byte 0x0200E668
_0808D194:
	movs r3, #0
	str r3, [sp, #0x54]
	movs r4, #0
	ldr r0, _0808D1D0 @ =0x0200E668
	ldrb r0, [r0]
	cmp r3, r0
	bhs _0808D1CC
	ldr r5, _0808D1D4 @ =0x0200CBF0
_0808D1A4:
	lsls r0, r4, #2
	adds r0, r0, r5
	ldr r0, [r0]
	ldr r0, [r0]
	bl GetUnitEquippedWeapon
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl GetItemIndex
	mov r6, sp
	adds r1, r6, r4
	strb r0, [r1]
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	ldr r0, _0808D1D0 @ =0x0200E668
	ldrb r0, [r0]
	cmp r4, r0
	blo _0808D1A4
_0808D1CC:
	movs r4, #0
	b _0808D27A
	.align 2, 0
_0808D1D0: .4byte 0x0200E668
_0808D1D4: .4byte 0x0200CBF0
_0808D1D8:
	movs r6, #0
	adds r0, r4, #1
	ldrb r1, [r1]
	subs r1, r1, r0
	str r0, [sp, #0x5c]
	cmp r6, r1
	bge _0808D274
	ldr r7, _0808D21C @ =0x0200CBF0
	mov sl, r7
_0808D1EA:
	adds r0, r6, #1
	mov r1, sp
	adds r1, r1, r0
	mov r8, r1
	mov r2, sp
	adds r5, r2, r6
	ldrb r4, [r1]
	adds r3, r4, #0
	ldrb r2, [r5]
	mov sb, r0
	cmp r3, r2
	bhs _0808D220
	adds r1, r2, #0
	strb r4, [r5]
	mov r3, r8
	strb r1, [r3]
	lsls r2, r6, #2
	add r2, sl
	ldr r3, [r2]
	lsls r1, r0, #2
	add r1, sl
	ldr r0, [r1]
	str r0, [r2]
	str r3, [r1]
	b _0808D25E
	.align 2, 0
_0808D21C: .4byte 0x0200CBF0
_0808D220:
	cmp r3, r2
	bne _0808D262
	mov r7, sb
	lsls r0, r7, #2
	mov r1, sl
	adds r7, r0, r1
	ldr r0, [r7]
	ldr r0, [r0]
	bl GetUnitEquippedWeapon
	adds r4, r0, #0
	lsls r0, r6, #2
	mov r2, sl
	adds r6, r0, r2
	ldr r0, [r6]
	ldr r0, [r0]
	bl GetUnitEquippedWeapon
	lsls r4, r4, #0x10
	lsls r0, r0, #0x10
	cmp r4, r0
	bhs _0808D262
	ldrb r1, [r5]
	mov r3, r8
	ldrb r0, [r3]
	strb r0, [r5]
	strb r1, [r3]
	ldr r3, [r6]
	ldr r0, [r7]
	str r0, [r6]
	str r3, [r7]
_0808D25E:
	movs r4, #1
	str r4, [sp, #0x54]
_0808D262:
	mov r6, sb
	lsls r0, r6, #0x18
	lsrs r6, r0, #0x18
	ldr r0, _0808D294 @ =0x0200E668
	ldrb r0, [r0]
	ldr r7, [sp, #0x5c]
	subs r0, r0, r7
	cmp r6, r0
	blt _0808D1EA
_0808D274:
	ldr r1, [sp, #0x5c]
	lsls r0, r1, #0x18
	lsrs r4, r0, #0x18
_0808D27A:
	ldr r1, _0808D294 @ =0x0200E668
	ldrb r0, [r1]
	subs r0, #1
	cmp r4, r0
	blt _0808D1D8
	ldr r2, [sp, #0x54]
_0808D286:
	cmp r2, #0
	bne _0808D28E
	bl _0808E330
_0808D28E:
	movs r0, #1
	bl _0808E332
	.align 2, 0
_0808D294: .4byte 0x0200E668
_0808D298:
	cmp r2, #0
	bne _0808D314
	movs r3, #0
	mov ip, r3
	movs r1, #0
	ldr r4, _0808D30C @ =0x0200E668
	ldrb r0, [r4]
	subs r0, #1
	cmp r2, r0
	bge _0808D306
	adds r6, r4, #0
	mov sl, r6
_0808D2B0:
	movs r2, #0
	adds r0, r1, #1
	mov r7, sl
	ldrb r7, [r7]
	subs r1, r7, r0
	mov sb, r0
	cmp r2, r1
	bge _0808D2F6
	mov r8, sb
_0808D2C2:
	adds r6, r2, #1
	lsls r0, r6, #2
	ldr r1, _0808D310 @ =0x0200CBF0
	adds r5, r0, r1
	ldr r4, [r5]
	lsls r0, r2, #2
	adds r2, r0, r1
	ldr r3, [r2]
	movs r7, #4
	ldrsh r1, [r4, r7]
	movs r7, #4
	ldrsh r0, [r3, r7]
	cmp r1, r0
	ble _0808D2E6
	str r4, [r2]
	str r3, [r5]
	movs r0, #1
	mov ip, r0
_0808D2E6:
	lsls r0, r6, #0x18
	lsrs r2, r0, #0x18
	mov r1, sl
	ldrb r1, [r1]
	mov r3, r8
	subs r0, r1, r3
	cmp r2, r0
	blt _0808D2C2
_0808D2F6:
	mov r4, sb
	lsls r0, r4, #0x18
	lsrs r1, r0, #0x18
	ldr r6, _0808D30C @ =0x0200E668
	ldrb r0, [r6]
	subs r0, #1
	cmp r1, r0
	blt _0808D2B0
_0808D306:
	mov r7, ip
	bl _0808E29C
	.align 2, 0
_0808D30C: .4byte 0x0200E668
_0808D310: .4byte 0x0200CBF0
_0808D314:
	movs r0, #0
	mov ip, r0
	movs r1, #0
	ldr r2, _0808D384 @ =0x0200E668
	ldrb r0, [r2]
	subs r0, #1
	cmp ip, r0
	bge _0808D37E
	adds r3, r2, #0
	mov sl, r3
_0808D328:
	movs r2, #0
	adds r0, r1, #1
	mov r4, sl
	ldrb r4, [r4]
	subs r1, r4, r0
	mov sb, r0
	cmp r2, r1
	bge _0808D36E
	mov r8, sb
_0808D33A:
	adds r6, r2, #1
	lsls r0, r6, #2
	ldr r7, _0808D388 @ =0x0200CBF0
	adds r5, r0, r7
	ldr r4, [r5]
	lsls r0, r2, #2
	adds r2, r0, r7
	ldr r3, [r2]
	movs r0, #4
	ldrsh r1, [r4, r0]
	movs r7, #4
	ldrsh r0, [r3, r7]
	cmp r1, r0
	bge _0808D35E
	str r4, [r2]
	str r3, [r5]
	movs r0, #1
	mov ip, r0
_0808D35E:
	lsls r0, r6, #0x18
	lsrs r2, r0, #0x18
	mov r1, sl
	ldrb r1, [r1]
	mov r3, r8
	subs r0, r1, r3
	cmp r2, r0
	blt _0808D33A
_0808D36E:
	mov r4, sb
	lsls r0, r4, #0x18
	lsrs r1, r0, #0x18
	ldr r6, _0808D384 @ =0x0200E668
	ldrb r0, [r6]
	subs r0, #1
	cmp r1, r0
	blt _0808D328
_0808D37E:
	mov r7, ip
	bl _0808E29C
	.align 2, 0
_0808D384: .4byte 0x0200E668
_0808D388: .4byte 0x0200CBF0
_0808D38C:
	cmp r2, #0
	bne _0808D408
	movs r0, #0
	mov ip, r0
	movs r1, #0
	ldr r3, _0808D400 @ =0x0200E668
	ldrb r0, [r3]
	subs r0, #1
	cmp r2, r0
	bge _0808D3FA
	adds r4, r3, #0
	mov sl, r4
_0808D3A4:
	movs r2, #0
	adds r0, r1, #1
	mov r6, sl
	ldrb r6, [r6]
	subs r1, r6, r0
	mov sb, r0
	cmp r2, r1
	bge _0808D3EA
	mov r8, sb
_0808D3B6:
	adds r6, r2, #1
	lsls r0, r6, #2
	ldr r7, _0808D404 @ =0x0200CBF0
	adds r5, r0, r7
	ldr r4, [r5]
	lsls r0, r2, #2
	adds r2, r0, r7
	ldr r3, [r2]
	movs r0, #6
	ldrsh r1, [r4, r0]
	movs r7, #6
	ldrsh r0, [r3, r7]
	cmp r1, r0
	ble _0808D3DA
	str r4, [r2]
	str r3, [r5]
	movs r0, #1
	mov ip, r0
_0808D3DA:
	lsls r0, r6, #0x18
	lsrs r2, r0, #0x18
	mov r1, sl
	ldrb r1, [r1]
	mov r3, r8
	subs r0, r1, r3
	cmp r2, r0
	blt _0808D3B6
_0808D3EA:
	mov r4, sb
	lsls r0, r4, #0x18
	lsrs r1, r0, #0x18
	ldr r6, _0808D400 @ =0x0200E668
	ldrb r0, [r6]
	subs r0, #1
	cmp r1, r0
	blt _0808D3A4
_0808D3FA:
	mov r7, ip
	bl _0808E29C
	.align 2, 0
_0808D400: .4byte 0x0200E668
_0808D404: .4byte 0x0200CBF0
_0808D408:
	movs r0, #0
	mov ip, r0
	movs r1, #0
	ldr r2, _0808D478 @ =0x0200E668
	ldrb r0, [r2]
	subs r0, #1
	cmp ip, r0
	bge _0808D472
	adds r3, r2, #0
	mov sl, r3
_0808D41C:
	movs r2, #0
	adds r0, r1, #1
	mov r4, sl
	ldrb r4, [r4]
	subs r1, r4, r0
	mov sb, r0
	cmp r2, r1
	bge _0808D462
	mov r8, sb
_0808D42E:
	adds r6, r2, #1
	lsls r0, r6, #2
	ldr r7, _0808D47C @ =0x0200CBF0
	adds r5, r0, r7
	ldr r4, [r5]
	lsls r0, r2, #2
	adds r2, r0, r7
	ldr r3, [r2]
	movs r0, #6
	ldrsh r1, [r4, r0]
	movs r7, #6
	ldrsh r0, [r3, r7]
	cmp r1, r0
	bge _0808D452
	str r4, [r2]
	str r3, [r5]
	movs r0, #1
	mov ip, r0
_0808D452:
	lsls r0, r6, #0x18
	lsrs r2, r0, #0x18
	mov r1, sl
	ldrb r1, [r1]
	mov r3, r8
	subs r0, r1, r3
	cmp r2, r0
	blt _0808D42E
_0808D462:
	mov r4, sb
	lsls r0, r4, #0x18
	lsrs r1, r0, #0x18
	ldr r6, _0808D478 @ =0x0200E668
	ldrb r0, [r6]
	subs r0, #1
	cmp r1, r0
	blt _0808D41C
_0808D472:
	mov r7, ip
	bl _0808E29C
	.align 2, 0
_0808D478: .4byte 0x0200E668
_0808D47C: .4byte 0x0200CBF0
_0808D480:
	cmp r2, #0
	bne _0808D4FC
	movs r0, #0
	mov ip, r0
	movs r1, #0
	ldr r3, _0808D4F4 @ =0x0200E668
	ldrb r0, [r3]
	subs r0, #1
	cmp r2, r0
	bge _0808D4EE
	adds r4, r3, #0
	mov sl, r4
_0808D498:
	movs r2, #0
	adds r0, r1, #1
	mov r6, sl
	ldrb r6, [r6]
	subs r1, r6, r0
	mov sb, r0
	cmp r2, r1
	bge _0808D4DE
	mov r8, sb
_0808D4AA:
	adds r6, r2, #1
	lsls r0, r6, #2
	ldr r7, _0808D4F8 @ =0x0200CBF0
	adds r5, r0, r7
	ldr r4, [r5]
	lsls r0, r2, #2
	adds r2, r0, r7
	ldr r3, [r2]
	movs r0, #8
	ldrsh r1, [r4, r0]
	movs r7, #8
	ldrsh r0, [r3, r7]
	cmp r1, r0
	ble _0808D4CE
	str r4, [r2]
	str r3, [r5]
	movs r0, #1
	mov ip, r0
_0808D4CE:
	lsls r0, r6, #0x18
	lsrs r2, r0, #0x18
	mov r1, sl
	ldrb r1, [r1]
	mov r3, r8
	subs r0, r1, r3
	cmp r2, r0
	blt _0808D4AA
_0808D4DE:
	mov r4, sb
	lsls r0, r4, #0x18
	lsrs r1, r0, #0x18
	ldr r6, _0808D4F4 @ =0x0200E668
	ldrb r0, [r6]
	subs r0, #1
	cmp r1, r0
	blt _0808D498
_0808D4EE:
	mov r7, ip
	bl _0808E29C
	.align 2, 0
_0808D4F4: .4byte 0x0200E668
_0808D4F8: .4byte 0x0200CBF0
_0808D4FC:
	movs r0, #0
	mov ip, r0
	movs r1, #0
	ldr r2, _0808D56C @ =0x0200E668
	ldrb r0, [r2]
	subs r0, #1
	cmp ip, r0
	bge _0808D566
	adds r3, r2, #0
	mov sl, r3
_0808D510:
	movs r2, #0
	adds r0, r1, #1
	mov r4, sl
	ldrb r4, [r4]
	subs r1, r4, r0
	mov sb, r0
	cmp r2, r1
	bge _0808D556
	mov r8, sb
_0808D522:
	adds r6, r2, #1
	lsls r0, r6, #2
	ldr r7, _0808D570 @ =0x0200CBF0
	adds r5, r0, r7
	ldr r4, [r5]
	lsls r0, r2, #2
	adds r2, r0, r7
	ldr r3, [r2]
	movs r0, #8
	ldrsh r1, [r4, r0]
	movs r7, #8
	ldrsh r0, [r3, r7]
	cmp r1, r0
	bge _0808D546
	str r4, [r2]
	str r3, [r5]
	movs r0, #1
	mov ip, r0
_0808D546:
	lsls r0, r6, #0x18
	lsrs r2, r0, #0x18
	mov r1, sl
	ldrb r1, [r1]
	mov r3, r8
	subs r0, r1, r3
	cmp r2, r0
	blt _0808D522
_0808D556:
	mov r4, sb
	lsls r0, r4, #0x18
	lsrs r1, r0, #0x18
	ldr r6, _0808D56C @ =0x0200E668
	ldrb r0, [r6]
	subs r0, #1
	cmp r1, r0
	blt _0808D510
_0808D566:
	mov r7, ip
	bl _0808E29C
	.align 2, 0
_0808D56C: .4byte 0x0200E668
_0808D570: .4byte 0x0200CBF0
_0808D574:
	cmp r2, #0
	bne _0808D608
	movs r0, #0
	mov ip, r0
	movs r1, #0
	ldr r3, _0808D600 @ =0x0200E668
	ldrb r0, [r3]
	subs r0, #1
	cmp r2, r0
	blt _0808D58A
	b _0808D68C
_0808D58A:
	adds r4, r3, #0
	mov sl, r4
_0808D58E:
	movs r3, #0
	adds r0, r1, #1
	mov r6, sl
	ldrb r6, [r6]
	subs r1, r6, r0
	mov r8, r0
	cmp r3, r1
	bge _0808D5EE
	ldr r7, _0808D604 @ =0x0200CBF0
	mov sb, r7
_0808D5A2:
	adds r7, r3, #1
	lsls r0, r7, #2
	mov r1, sb
	adds r6, r0, r1
	ldr r5, [r6]
	ldr r0, [r5]
	movs r2, #0x1d
	ldrsb r2, [r0, r2]
	ldr r0, [r0, #4]
	ldrb r0, [r0, #0x12]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r2, r2, r0
	lsls r0, r3, #2
	adds r3, r0, r1
	ldr r4, [r3]
	ldr r0, [r4]
	movs r1, #0x1d
	ldrsb r1, [r0, r1]
	ldr r0, [r0, #4]
	ldrb r0, [r0, #0x12]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r1, r1, r0
	cmp r2, r1
	ble _0808D5DE
	str r5, [r3]
	str r4, [r6]
	movs r2, #1
	mov ip, r2
_0808D5DE:
	lsls r0, r7, #0x18
	lsrs r3, r0, #0x18
	mov r4, sl
	ldrb r4, [r4]
	mov r6, r8
	subs r0, r4, r6
	cmp r3, r0
	blt _0808D5A2
_0808D5EE:
	mov r7, r8
	lsls r0, r7, #0x18
	lsrs r1, r0, #0x18
	ldr r2, _0808D600 @ =0x0200E668
	ldrb r0, [r2]
	subs r0, #1
	cmp r1, r0
	blt _0808D58E
	b _0808D68C
	.align 2, 0
_0808D600: .4byte 0x0200E668
_0808D604: .4byte 0x0200CBF0
_0808D608:
	movs r4, #0
	mov ip, r4
	movs r1, #0
	ldr r6, _0808D69C @ =0x0200E668
	ldrb r0, [r6]
	subs r0, #1
	cmp ip, r0
	bge _0808D68C
	adds r7, r6, #0
	mov sl, r7
_0808D61C:
	movs r3, #0
	adds r0, r1, #1
	mov r2, sl
	ldrb r2, [r2]
	subs r1, r2, r0
	mov r8, r0
	cmp r3, r1
	bge _0808D67C
	ldr r4, _0808D6A0 @ =0x0200CBF0
	mov sb, r4
_0808D630:
	adds r7, r3, #1
	lsls r0, r7, #2
	mov r1, sb
	adds r6, r0, r1
	ldr r5, [r6]
	ldr r0, [r5]
	movs r2, #0x1d
	ldrsb r2, [r0, r2]
	ldr r0, [r0, #4]
	ldrb r0, [r0, #0x12]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r2, r2, r0
	lsls r0, r3, #2
	adds r3, r0, r1
	ldr r4, [r3]
	ldr r0, [r4]
	movs r1, #0x1d
	ldrsb r1, [r0, r1]
	ldr r0, [r0, #4]
	ldrb r0, [r0, #0x12]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r1, r1, r0
	cmp r2, r1
	bge _0808D66C
	str r5, [r3]
	str r4, [r6]
	movs r2, #1
	mov ip, r2
_0808D66C:
	lsls r0, r7, #0x18
	lsrs r3, r0, #0x18
	mov r4, sl
	ldrb r4, [r4]
	mov r6, r8
	subs r0, r4, r6
	cmp r3, r0
	blt _0808D630
_0808D67C:
	mov r7, r8
	lsls r0, r7, #0x18
	lsrs r1, r0, #0x18
	ldr r2, _0808D69C @ =0x0200E668
	ldrb r0, [r2]
	subs r0, #1
	cmp r1, r0
	blt _0808D61C
_0808D68C:
	mov r3, ip
_0808D68E:
	cmp r3, #0
	bne _0808D696
	bl _0808E330
_0808D696:
	movs r0, #1
	bl _0808E332
	.align 2, 0
_0808D69C: .4byte 0x0200E668
_0808D6A0: .4byte 0x0200CBF0
_0808D6A4:
	cmp r2, #0
	bne _0808D72C
	movs r4, #0
	mov sl, r4
	movs r1, #0
	ldr r6, _0808D724 @ =0x0200E668
	mov ip, r6
	ldrb r0, [r6]
	subs r0, #1
	cmp r2, r0
	blt _0808D6BE
	bl _0808E31E
_0808D6BE:
	adds r7, r6, #0
	mov sb, r7
_0808D6C2:
	movs r2, #0
	adds r0, r1, #1
	mov r3, sb
	ldrb r3, [r3]
	subs r1, r3, r0
	adds r7, r0, #0
	cmp r2, r1
	bge _0808D712
	ldr r4, _0808D728 @ =0x0200CBF0
	mov r8, r4
_0808D6D6:
	adds r6, r2, #1
	lsls r0, r6, #2
	mov r1, r8
	adds r5, r0, r1
	ldr r4, [r5]
	ldr r0, [r4]
	adds r0, #0x30
	ldrb r0, [r0]
	lsls r1, r0, #0x1c
	lsls r0, r2, #2
	mov r3, r8
	adds r2, r0, r3
	ldr r3, [r2]
	ldr r0, [r3]
	adds r0, #0x30
	ldrb r0, [r0]
	lsls r0, r0, #0x1c
	cmp r1, r0
	bls _0808D704
	str r4, [r2]
	str r3, [r5]
	movs r4, #1
	mov sl, r4
_0808D704:
	lsls r0, r6, #0x18
	lsrs r2, r0, #0x18
	mov r6, sb
	ldrb r6, [r6]
	subs r0, r6, r7
	cmp r2, r0
	blt _0808D6D6
_0808D712:
	lsls r0, r7, #0x18
	lsrs r1, r0, #0x18
	mov r7, ip
	ldrb r0, [r7]
	subs r0, #1
	cmp r1, r0
	blt _0808D6C2
	bl _0808E31E
	.align 2, 0
_0808D724: .4byte 0x0200E668
_0808D728: .4byte 0x0200CBF0
_0808D72C:
	movs r1, #0
	mov sl, r1
	ldr r2, _0808D7A8 @ =0x0200E668
	mov ip, r2
	ldrb r0, [r2]
	subs r0, #1
	cmp sl, r0
	blt _0808D740
	bl _0808E31E
_0808D740:
	adds r3, r2, #0
	mov sb, r3
_0808D744:
	movs r2, #0
	adds r0, r1, #1
	mov r4, sb
	ldrb r4, [r4]
	subs r1, r4, r0
	adds r7, r0, #0
	cmp r2, r1
	bge _0808D794
	ldr r6, _0808D7AC @ =0x0200CBF0
	mov r8, r6
_0808D758:
	adds r6, r2, #1
	lsls r0, r6, #2
	mov r1, r8
	adds r5, r0, r1
	ldr r4, [r5]
	ldr r0, [r4]
	adds r0, #0x30
	ldrb r0, [r0]
	lsls r1, r0, #0x1c
	lsls r0, r2, #2
	mov r3, r8
	adds r2, r0, r3
	ldr r3, [r2]
	ldr r0, [r3]
	adds r0, #0x30
	ldrb r0, [r0]
	lsls r0, r0, #0x1c
	cmp r1, r0
	bhs _0808D786
	str r4, [r2]
	str r3, [r5]
	movs r4, #1
	mov sl, r4
_0808D786:
	lsls r0, r6, #0x18
	lsrs r2, r0, #0x18
	mov r6, sb
	ldrb r6, [r6]
	subs r0, r6, r7
	cmp r2, r0
	blt _0808D758
_0808D794:
	lsls r0, r7, #0x18
	lsrs r1, r0, #0x18
	mov r7, ip
	ldrb r0, [r7]
	subs r0, #1
	cmp r1, r0
	blt _0808D744
	bl _0808E31E
	.align 2, 0
_0808D7A8: .4byte 0x0200E668
_0808D7AC: .4byte 0x0200CBF0
_0808D7B0:
	cmp r2, #0
	bne _0808D878
	movs r1, #0
	mov sb, r1
	movs r3, #0
	ldr r0, _0808D7E4 @ =0x0200E668
	ldrb r1, [r0]
	cmp r2, r1
	bhs _0808D7FC
	ldr r6, _0808D7E8 @ =0x0200CBF0
	adds r2, r1, #0
	movs r5, #0x10
	movs r4, #1
_0808D7CA:
	lsls r0, r3, #2
	adds r0, r0, r6
	ldr r0, [r0]
	ldr r0, [r0]
	ldr r1, [r0, #0xc]
	ands r1, r5
	cmp r1, #0
	beq _0808D7EC
	mov r7, sp
	adds r0, r7, r3
	strb r4, [r0]
	b _0808D7F2
	.align 2, 0
_0808D7E4: .4byte 0x0200E668
_0808D7E8: .4byte 0x0200CBF0
_0808D7EC:
	mov r7, sp
	adds r0, r7, r3
	strb r1, [r0]
_0808D7F2:
	adds r0, r3, #1
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	cmp r3, r2
	blo _0808D7CA
_0808D7FC:
	movs r3, #0
	ldr r1, _0808D870 @ =0x0200E668
	ldrb r0, [r1]
	subs r0, #1
	cmp r3, r0
	bge _0808D868
	mov r8, r1
	ldr r2, _0808D874 @ =0x0200CBF0
	mov ip, r2
	mov sl, r8
_0808D810:
	movs r2, #0
	adds r0, r3, #1
	mov r3, r8
	ldrb r3, [r3]
	subs r1, r3, r0
	adds r6, r0, #0
	cmp r2, r1
	bge _0808D85A
	mov r7, ip
_0808D822:
	adds r5, r2, #1
	mov r0, sp
	adds r4, r0, r5
	adds r1, r0, r2
	ldrb r3, [r4]
	ldrb r0, [r1]
	cmp r3, r0
	bls _0808D84C
	ldrb r0, [r1]
	strb r3, [r1]
	strb r0, [r4]
	lsls r2, r2, #2
	adds r2, r2, r7
	ldr r3, [r2]
	lsls r1, r5, #2
	adds r1, r1, r7
	ldr r0, [r1]
	str r0, [r2]
	str r3, [r1]
	movs r1, #1
	mov sb, r1
_0808D84C:
	lsls r0, r5, #0x18
	lsrs r2, r0, #0x18
	mov r3, r8
	ldrb r3, [r3]
	subs r0, r3, r6
	cmp r2, r0
	blt _0808D822
_0808D85A:
	lsls r0, r6, #0x18
	lsrs r3, r0, #0x18
	mov r4, sl
	ldrb r0, [r4]
	subs r0, #1
	cmp r3, r0
	blt _0808D810
_0808D868:
	mov r6, sb
	bl _0808E210
	.align 2, 0
_0808D870: .4byte 0x0200E668
_0808D874: .4byte 0x0200CBF0
_0808D878:
	movs r7, #0
	mov sb, r7
	movs r3, #0
	ldr r0, _0808D8A8 @ =0x0200E668
	ldrb r1, [r0]
	cmp sb, r1
	bhs _0808D8C0
	ldr r6, _0808D8AC @ =0x0200CBF0
	adds r2, r1, #0
	movs r5, #0x10
	movs r4, #1
_0808D88E:
	lsls r0, r3, #2
	adds r0, r0, r6
	ldr r0, [r0]
	ldr r0, [r0]
	ldr r1, [r0, #0xc]
	ands r1, r5
	cmp r1, #0
	beq _0808D8B0
	mov r1, sp
	adds r0, r1, r3
	strb r4, [r0]
	b _0808D8B6
	.align 2, 0
_0808D8A8: .4byte 0x0200E668
_0808D8AC: .4byte 0x0200CBF0
_0808D8B0:
	mov r7, sp
	adds r0, r7, r3
	strb r1, [r0]
_0808D8B6:
	adds r0, r3, #1
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	cmp r3, r2
	blo _0808D88E
_0808D8C0:
	movs r3, #0
	ldr r1, _0808D934 @ =0x0200E668
	ldrb r0, [r1]
	subs r0, #1
	cmp r3, r0
	bge _0808D92C
	mov r8, r1
	ldr r2, _0808D938 @ =0x0200CBF0
	mov ip, r2
	mov sl, r8
_0808D8D4:
	movs r2, #0
	adds r0, r3, #1
	mov r3, r8
	ldrb r3, [r3]
	subs r1, r3, r0
	adds r6, r0, #0
	cmp r2, r1
	bge _0808D91E
	mov r7, ip
_0808D8E6:
	adds r5, r2, #1
	mov r0, sp
	adds r4, r0, r5
	adds r1, r0, r2
	ldrb r3, [r4]
	ldrb r0, [r1]
	cmp r3, r0
	bhs _0808D910
	ldrb r0, [r1]
	strb r3, [r1]
	strb r0, [r4]
	lsls r2, r2, #2
	adds r2, r2, r7
	ldr r3, [r2]
	lsls r1, r5, #2
	adds r1, r1, r7
	ldr r0, [r1]
	str r0, [r2]
	str r3, [r1]
	movs r1, #1
	mov sb, r1
_0808D910:
	lsls r0, r5, #0x18
	lsrs r2, r0, #0x18
	mov r3, r8
	ldrb r3, [r3]
	subs r0, r3, r6
	cmp r2, r0
	blt _0808D8E6
_0808D91E:
	lsls r0, r6, #0x18
	lsrs r3, r0, #0x18
	mov r4, sl
	ldrb r0, [r4]
	subs r0, #1
	cmp r3, r0
	blt _0808D8D4
_0808D92C:
	mov r6, sb
	bl _0808E210
	.align 2, 0
_0808D934: .4byte 0x0200E668
_0808D938: .4byte 0x0200CBF0
_0808D93C:
	cmp r2, #0
	bne _0808D9C0
	movs r7, #0
	mov sl, r7
	movs r1, #0
	ldr r0, _0808D9B8 @ =0x0200E668
	mov ip, r0
	ldrb r0, [r0]
	subs r0, #1
	cmp r2, r0
	blt _0808D956
	bl _0808E31E
_0808D956:
	ldr r2, _0808D9B8 @ =0x0200E668
	mov sb, r2
_0808D95A:
	movs r2, #0
	adds r0, r1, #1
	mov r3, sb
	ldrb r3, [r3]
	subs r1, r3, r0
	adds r7, r0, #0
	cmp r2, r1
	bge _0808D9A6
	ldr r4, _0808D9BC @ =0x0200CBF0
	mov r8, r4
_0808D96E:
	adds r6, r2, #1
	lsls r0, r6, #2
	mov r1, r8
	adds r5, r0, r1
	ldr r4, [r5]
	ldr r1, [r4]
	adds r1, #0x28
	lsls r0, r2, #2
	mov r3, r8
	adds r2, r0, r3
	ldr r3, [r2]
	ldr r0, [r3]
	adds r0, #0x28
	ldrb r1, [r1]
	ldrb r0, [r0]
	cmp r1, r0
	bls _0808D998
	str r4, [r2]
	str r3, [r5]
	movs r4, #1
	mov sl, r4
_0808D998:
	lsls r0, r6, #0x18
	lsrs r2, r0, #0x18
	mov r6, sb
	ldrb r6, [r6]
	subs r0, r6, r7
	cmp r2, r0
	blt _0808D96E
_0808D9A6:
	lsls r0, r7, #0x18
	lsrs r1, r0, #0x18
	mov r7, ip
	ldrb r0, [r7]
	subs r0, #1
	cmp r1, r0
	blt _0808D95A
	bl _0808E31E
	.align 2, 0
_0808D9B8: .4byte 0x0200E668
_0808D9BC: .4byte 0x0200CBF0
_0808D9C0:
	movs r1, #0
	mov sl, r1
	ldr r2, _0808DA38 @ =0x0200E668
	mov ip, r2
	ldrb r0, [r2]
	subs r0, #1
	cmp sl, r0
	blt _0808D9D4
	bl _0808E31E
_0808D9D4:
	adds r3, r2, #0
	mov sb, r3
_0808D9D8:
	movs r2, #0
	adds r0, r1, #1
	mov r4, sb
	ldrb r4, [r4]
	subs r1, r4, r0
	adds r7, r0, #0
	cmp r2, r1
	bge _0808DA24
	ldr r6, _0808DA3C @ =0x0200CBF0
	mov r8, r6
_0808D9EC:
	adds r6, r2, #1
	lsls r0, r6, #2
	mov r1, r8
	adds r5, r0, r1
	ldr r4, [r5]
	ldr r1, [r4]
	adds r1, #0x28
	lsls r0, r2, #2
	mov r3, r8
	adds r2, r0, r3
	ldr r3, [r2]
	ldr r0, [r3]
	adds r0, #0x28
	ldrb r1, [r1]
	ldrb r0, [r0]
	cmp r1, r0
	bhs _0808DA16
	str r4, [r2]
	str r3, [r5]
	movs r4, #1
	mov sl, r4
_0808DA16:
	lsls r0, r6, #0x18
	lsrs r2, r0, #0x18
	mov r6, sb
	ldrb r6, [r6]
	subs r0, r6, r7
	cmp r2, r0
	blt _0808D9EC
_0808DA24:
	lsls r0, r7, #0x18
	lsrs r1, r0, #0x18
	mov r7, ip
	ldrb r0, [r7]
	subs r0, #1
	cmp r1, r0
	blt _0808D9D8
	bl _0808E31E
	.align 2, 0
_0808DA38: .4byte 0x0200E668
_0808DA3C: .4byte 0x0200CBF0
_0808DA40:
	cmp r2, #0
	bne _0808DAC4
	movs r1, #0
	mov sl, r1
	ldr r3, _0808DABC @ =0x0200E668
	mov ip, r3
	ldrb r0, [r3]
	subs r0, #1
	cmp r2, r0
	blt _0808DA58
	bl _0808E31E
_0808DA58:
	adds r4, r3, #0
	mov sb, r4
_0808DA5C:
	movs r2, #0
	adds r0, r1, #1
	mov r6, sb
	ldrb r6, [r6]
	subs r1, r6, r0
	adds r7, r0, #0
	cmp r2, r1
	bge _0808DAA8
	ldr r0, _0808DAC0 @ =0x0200CBF0
	mov r8, r0
_0808DA70:
	adds r6, r2, #1
	lsls r0, r6, #2
	mov r1, r8
	adds r5, r0, r1
	ldr r4, [r5]
	ldr r1, [r4]
	adds r1, #0x29
	lsls r0, r2, #2
	mov r3, r8
	adds r2, r0, r3
	ldr r3, [r2]
	ldr r0, [r3]
	adds r0, #0x29
	ldrb r1, [r1]
	ldrb r0, [r0]
	cmp r1, r0
	bls _0808DA9A
	str r4, [r2]
	str r3, [r5]
	movs r4, #1
	mov sl, r4
_0808DA9A:
	lsls r0, r6, #0x18
	lsrs r2, r0, #0x18
	mov r6, sb
	ldrb r6, [r6]
	subs r0, r6, r7
	cmp r2, r0
	blt _0808DA70
_0808DAA8:
	lsls r0, r7, #0x18
	lsrs r1, r0, #0x18
	mov r7, ip
	ldrb r0, [r7]
	subs r0, #1
	cmp r1, r0
	blt _0808DA5C
	bl _0808E31E
	.align 2, 0
_0808DABC: .4byte 0x0200E668
_0808DAC0: .4byte 0x0200CBF0
_0808DAC4:
	movs r1, #0
	mov sl, r1
	ldr r2, _0808DB3C @ =0x0200E668
	mov ip, r2
	ldrb r0, [r2]
	subs r0, #1
	cmp sl, r0
	blt _0808DAD8
	bl _0808E31E
_0808DAD8:
	adds r3, r2, #0
	mov sb, r3
_0808DADC:
	movs r2, #0
	adds r0, r1, #1
	mov r4, sb
	ldrb r4, [r4]
	subs r1, r4, r0
	adds r7, r0, #0
	cmp r2, r1
	bge _0808DB28
	ldr r6, _0808DB40 @ =0x0200CBF0
	mov r8, r6
_0808DAF0:
	adds r6, r2, #1
	lsls r0, r6, #2
	mov r1, r8
	adds r5, r0, r1
	ldr r4, [r5]
	ldr r1, [r4]
	adds r1, #0x29
	lsls r0, r2, #2
	mov r3, r8
	adds r2, r0, r3
	ldr r3, [r2]
	ldr r0, [r3]
	adds r0, #0x29
	ldrb r1, [r1]
	ldrb r0, [r0]
	cmp r1, r0
	bhs _0808DB1A
	str r4, [r2]
	str r3, [r5]
	movs r4, #1
	mov sl, r4
_0808DB1A:
	lsls r0, r6, #0x18
	lsrs r2, r0, #0x18
	mov r6, sb
	ldrb r6, [r6]
	subs r0, r6, r7
	cmp r2, r0
	blt _0808DAF0
_0808DB28:
	lsls r0, r7, #0x18
	lsrs r1, r0, #0x18
	mov r7, ip
	ldrb r0, [r7]
	subs r0, #1
	cmp r1, r0
	blt _0808DADC
	bl _0808E31E
	.align 2, 0
_0808DB3C: .4byte 0x0200E668
_0808DB40: .4byte 0x0200CBF0
_0808DB44:
	cmp r2, #0
	bne _0808DBC4
	movs r1, #0
	mov sl, r1
	ldr r3, _0808DBBC @ =0x0200E668
	mov ip, r3
	ldrb r0, [r3]
	subs r0, #1
	cmp r2, r0
	blt _0808DB5A
	b _0808E31E
_0808DB5A:
	adds r4, r3, #0
	mov sb, r4
_0808DB5E:
	movs r2, #0
	adds r0, r1, #1
	mov r6, sb
	ldrb r6, [r6]
	subs r1, r6, r0
	adds r7, r0, #0
	cmp r2, r1
	bge _0808DBAA
	ldr r0, _0808DBC0 @ =0x0200CBF0
	mov r8, r0
_0808DB72:
	adds r6, r2, #1
	lsls r0, r6, #2
	mov r1, r8
	adds r5, r0, r1
	ldr r4, [r5]
	ldr r1, [r4]
	adds r1, #0x2a
	lsls r0, r2, #2
	mov r3, r8
	adds r2, r0, r3
	ldr r3, [r2]
	ldr r0, [r3]
	adds r0, #0x2a
	ldrb r1, [r1]
	ldrb r0, [r0]
	cmp r1, r0
	bls _0808DB9C
	str r4, [r2]
	str r3, [r5]
	movs r4, #1
	mov sl, r4
_0808DB9C:
	lsls r0, r6, #0x18
	lsrs r2, r0, #0x18
	mov r6, sb
	ldrb r6, [r6]
	subs r0, r6, r7
	cmp r2, r0
	blt _0808DB72
_0808DBAA:
	lsls r0, r7, #0x18
	lsrs r1, r0, #0x18
	mov r7, ip
	ldrb r0, [r7]
	subs r0, #1
	cmp r1, r0
	blt _0808DB5E
	b _0808E31E
	.align 2, 0
_0808DBBC: .4byte 0x0200E668
_0808DBC0: .4byte 0x0200CBF0
_0808DBC4:
	movs r1, #0
	mov sl, r1
	ldr r2, _0808DC38 @ =0x0200E668
	mov ip, r2
	ldrb r0, [r2]
	subs r0, #1
	cmp sl, r0
	blt _0808DBD6
	b _0808E31E
_0808DBD6:
	adds r3, r2, #0
	mov sb, r3
_0808DBDA:
	movs r2, #0
	adds r0, r1, #1
	mov r4, sb
	ldrb r4, [r4]
	subs r1, r4, r0
	adds r7, r0, #0
	cmp r2, r1
	bge _0808DC26
	ldr r6, _0808DC3C @ =0x0200CBF0
	mov r8, r6
_0808DBEE:
	adds r6, r2, #1
	lsls r0, r6, #2
	mov r1, r8
	adds r5, r0, r1
	ldr r4, [r5]
	ldr r1, [r4]
	adds r1, #0x2a
	lsls r0, r2, #2
	mov r3, r8
	adds r2, r0, r3
	ldr r3, [r2]
	ldr r0, [r3]
	adds r0, #0x2a
	ldrb r1, [r1]
	ldrb r0, [r0]
	cmp r1, r0
	bhs _0808DC18
	str r4, [r2]
	str r3, [r5]
	movs r4, #1
	mov sl, r4
_0808DC18:
	lsls r0, r6, #0x18
	lsrs r2, r0, #0x18
	mov r6, sb
	ldrb r6, [r6]
	subs r0, r6, r7
	cmp r2, r0
	blt _0808DBEE
_0808DC26:
	lsls r0, r7, #0x18
	lsrs r1, r0, #0x18
	mov r7, ip
	ldrb r0, [r7]
	subs r0, #1
	cmp r1, r0
	blt _0808DBDA
	b _0808E31E
	.align 2, 0
_0808DC38: .4byte 0x0200E668
_0808DC3C: .4byte 0x0200CBF0
_0808DC40:
	cmp r2, #0
	bne _0808DCC0
	movs r1, #0
	mov sl, r1
	ldr r3, _0808DCB8 @ =0x0200E668
	mov ip, r3
	ldrb r0, [r3]
	subs r0, #1
	cmp r2, r0
	blt _0808DC56
	b _0808E31E
_0808DC56:
	adds r4, r3, #0
	mov sb, r4
_0808DC5A:
	movs r2, #0
	adds r0, r1, #1
	mov r6, sb
	ldrb r6, [r6]
	subs r1, r6, r0
	adds r7, r0, #0
	cmp r2, r1
	bge _0808DCA6
	ldr r0, _0808DCBC @ =0x0200CBF0
	mov r8, r0
_0808DC6E:
	adds r6, r2, #1
	lsls r0, r6, #2
	mov r1, r8
	adds r5, r0, r1
	ldr r4, [r5]
	ldr r1, [r4]
	adds r1, #0x2b
	lsls r0, r2, #2
	mov r3, r8
	adds r2, r0, r3
	ldr r3, [r2]
	ldr r0, [r3]
	adds r0, #0x2b
	ldrb r1, [r1]
	ldrb r0, [r0]
	cmp r1, r0
	bls _0808DC98
	str r4, [r2]
	str r3, [r5]
	movs r4, #1
	mov sl, r4
_0808DC98:
	lsls r0, r6, #0x18
	lsrs r2, r0, #0x18
	mov r6, sb
	ldrb r6, [r6]
	subs r0, r6, r7
	cmp r2, r0
	blt _0808DC6E
_0808DCA6:
	lsls r0, r7, #0x18
	lsrs r1, r0, #0x18
	mov r7, ip
	ldrb r0, [r7]
	subs r0, #1
	cmp r1, r0
	blt _0808DC5A
	b _0808E31E
	.align 2, 0
_0808DCB8: .4byte 0x0200E668
_0808DCBC: .4byte 0x0200CBF0
_0808DCC0:
	movs r1, #0
	mov sl, r1
	ldr r2, _0808DD34 @ =0x0200E668
	mov ip, r2
	ldrb r0, [r2]
	subs r0, #1
	cmp sl, r0
	blt _0808DCD2
	b _0808E31E
_0808DCD2:
	adds r3, r2, #0
	mov sb, r3
_0808DCD6:
	movs r2, #0
	adds r0, r1, #1
	mov r4, sb
	ldrb r4, [r4]
	subs r1, r4, r0
	adds r7, r0, #0
	cmp r2, r1
	bge _0808DD22
	ldr r6, _0808DD38 @ =0x0200CBF0
	mov r8, r6
_0808DCEA:
	adds r6, r2, #1
	lsls r0, r6, #2
	mov r1, r8
	adds r5, r0, r1
	ldr r4, [r5]
	ldr r1, [r4]
	adds r1, #0x2b
	lsls r0, r2, #2
	mov r3, r8
	adds r2, r0, r3
	ldr r3, [r2]
	ldr r0, [r3]
	adds r0, #0x2b
	ldrb r1, [r1]
	ldrb r0, [r0]
	cmp r1, r0
	bhs _0808DD14
	str r4, [r2]
	str r3, [r5]
	movs r4, #1
	mov sl, r4
_0808DD14:
	lsls r0, r6, #0x18
	lsrs r2, r0, #0x18
	mov r6, sb
	ldrb r6, [r6]
	subs r0, r6, r7
	cmp r2, r0
	blt _0808DCEA
_0808DD22:
	lsls r0, r7, #0x18
	lsrs r1, r0, #0x18
	mov r7, ip
	ldrb r0, [r7]
	subs r0, #1
	cmp r1, r0
	blt _0808DCD6
	b _0808E31E
	.align 2, 0
_0808DD34: .4byte 0x0200E668
_0808DD38: .4byte 0x0200CBF0
_0808DD3C:
	cmp r2, #0
	bne _0808DDBC
	movs r1, #0
	mov sl, r1
	ldr r3, _0808DDB4 @ =0x0200E668
	mov ip, r3
	ldrb r0, [r3]
	subs r0, #1
	cmp r2, r0
	blt _0808DD52
	b _0808E31E
_0808DD52:
	adds r4, r3, #0
	mov sb, r4
_0808DD56:
	movs r2, #0
	adds r0, r1, #1
	mov r6, sb
	ldrb r6, [r6]
	subs r1, r6, r0
	adds r7, r0, #0
	cmp r2, r1
	bge _0808DDA2
	ldr r0, _0808DDB8 @ =0x0200CBF0
	mov r8, r0
_0808DD6A:
	adds r6, r2, #1
	lsls r0, r6, #2
	mov r1, r8
	adds r5, r0, r1
	ldr r4, [r5]
	ldr r1, [r4]
	adds r1, #0x2c
	lsls r0, r2, #2
	mov r3, r8
	adds r2, r0, r3
	ldr r3, [r2]
	ldr r0, [r3]
	adds r0, #0x2c
	ldrb r1, [r1]
	ldrb r0, [r0]
	cmp r1, r0
	bls _0808DD94
	str r4, [r2]
	str r3, [r5]
	movs r4, #1
	mov sl, r4
_0808DD94:
	lsls r0, r6, #0x18
	lsrs r2, r0, #0x18
	mov r6, sb
	ldrb r6, [r6]
	subs r0, r6, r7
	cmp r2, r0
	blt _0808DD6A
_0808DDA2:
	lsls r0, r7, #0x18
	lsrs r1, r0, #0x18
	mov r7, ip
	ldrb r0, [r7]
	subs r0, #1
	cmp r1, r0
	blt _0808DD56
	b _0808E31E
	.align 2, 0
_0808DDB4: .4byte 0x0200E668
_0808DDB8: .4byte 0x0200CBF0
_0808DDBC:
	movs r1, #0
	mov sl, r1
	ldr r2, _0808DE30 @ =0x0200E668
	mov ip, r2
	ldrb r0, [r2]
	subs r0, #1
	cmp sl, r0
	blt _0808DDCE
	b _0808E31E
_0808DDCE:
	adds r3, r2, #0
	mov sb, r3
_0808DDD2:
	movs r2, #0
	adds r0, r1, #1
	mov r4, sb
	ldrb r4, [r4]
	subs r1, r4, r0
	adds r7, r0, #0
	cmp r2, r1
	bge _0808DE1E
	ldr r6, _0808DE34 @ =0x0200CBF0
	mov r8, r6
_0808DDE6:
	adds r6, r2, #1
	lsls r0, r6, #2
	mov r1, r8
	adds r5, r0, r1
	ldr r4, [r5]
	ldr r1, [r4]
	adds r1, #0x2c
	lsls r0, r2, #2
	mov r3, r8
	adds r2, r0, r3
	ldr r3, [r2]
	ldr r0, [r3]
	adds r0, #0x2c
	ldrb r1, [r1]
	ldrb r0, [r0]
	cmp r1, r0
	bhs _0808DE10
	str r4, [r2]
	str r3, [r5]
	movs r4, #1
	mov sl, r4
_0808DE10:
	lsls r0, r6, #0x18
	lsrs r2, r0, #0x18
	mov r6, sb
	ldrb r6, [r6]
	subs r0, r6, r7
	cmp r2, r0
	blt _0808DDE6
_0808DE1E:
	lsls r0, r7, #0x18
	lsrs r1, r0, #0x18
	mov r7, ip
	ldrb r0, [r7]
	subs r0, #1
	cmp r1, r0
	blt _0808DDD2
	b _0808E31E
	.align 2, 0
_0808DE30: .4byte 0x0200E668
_0808DE34: .4byte 0x0200CBF0
_0808DE38:
	cmp r2, #0
	bne _0808DEB8
	movs r1, #0
	mov sl, r1
	ldr r3, _0808DEB0 @ =0x0200E668
	mov ip, r3
	ldrb r0, [r3]
	subs r0, #1
	cmp r2, r0
	blt _0808DE4E
	b _0808E31E
_0808DE4E:
	adds r4, r3, #0
	mov sb, r4
_0808DE52:
	movs r2, #0
	adds r0, r1, #1
	mov r6, sb
	ldrb r6, [r6]
	subs r1, r6, r0
	adds r7, r0, #0
	cmp r2, r1
	bge _0808DE9E
	ldr r0, _0808DEB4 @ =0x0200CBF0
	mov r8, r0
_0808DE66:
	adds r6, r2, #1
	lsls r0, r6, #2
	mov r1, r8
	adds r5, r0, r1
	ldr r4, [r5]
	ldr r1, [r4]
	adds r1, #0x2d
	lsls r0, r2, #2
	mov r3, r8
	adds r2, r0, r3
	ldr r3, [r2]
	ldr r0, [r3]
	adds r0, #0x2d
	ldrb r1, [r1]
	ldrb r0, [r0]
	cmp r1, r0
	bls _0808DE90
	str r4, [r2]
	str r3, [r5]
	movs r4, #1
	mov sl, r4
_0808DE90:
	lsls r0, r6, #0x18
	lsrs r2, r0, #0x18
	mov r6, sb
	ldrb r6, [r6]
	subs r0, r6, r7
	cmp r2, r0
	blt _0808DE66
_0808DE9E:
	lsls r0, r7, #0x18
	lsrs r1, r0, #0x18
	mov r7, ip
	ldrb r0, [r7]
	subs r0, #1
	cmp r1, r0
	blt _0808DE52
	b _0808E31E
	.align 2, 0
_0808DEB0: .4byte 0x0200E668
_0808DEB4: .4byte 0x0200CBF0
_0808DEB8:
	movs r1, #0
	mov sl, r1
	ldr r2, _0808DF2C @ =0x0200E668
	mov ip, r2
	ldrb r0, [r2]
	subs r0, #1
	cmp sl, r0
	blt _0808DECA
	b _0808E31E
_0808DECA:
	adds r3, r2, #0
	mov sb, r3
_0808DECE:
	movs r2, #0
	adds r0, r1, #1
	mov r4, sb
	ldrb r4, [r4]
	subs r1, r4, r0
	adds r7, r0, #0
	cmp r2, r1
	bge _0808DF1A
	ldr r6, _0808DF30 @ =0x0200CBF0
	mov r8, r6
_0808DEE2:
	adds r6, r2, #1
	lsls r0, r6, #2
	mov r1, r8
	adds r5, r0, r1
	ldr r4, [r5]
	ldr r1, [r4]
	adds r1, #0x2d
	lsls r0, r2, #2
	mov r3, r8
	adds r2, r0, r3
	ldr r3, [r2]
	ldr r0, [r3]
	adds r0, #0x2d
	ldrb r1, [r1]
	ldrb r0, [r0]
	cmp r1, r0
	bhs _0808DF0C
	str r4, [r2]
	str r3, [r5]
	movs r4, #1
	mov sl, r4
_0808DF0C:
	lsls r0, r6, #0x18
	lsrs r2, r0, #0x18
	mov r6, sb
	ldrb r6, [r6]
	subs r0, r6, r7
	cmp r2, r0
	blt _0808DEE2
_0808DF1A:
	lsls r0, r7, #0x18
	lsrs r1, r0, #0x18
	mov r7, ip
	ldrb r0, [r7]
	subs r0, #1
	cmp r1, r0
	blt _0808DECE
	b _0808E31E
	.align 2, 0
_0808DF2C: .4byte 0x0200E668
_0808DF30: .4byte 0x0200CBF0
_0808DF34:
	cmp r2, #0
	bne _0808DFB4
	movs r1, #0
	mov sl, r1
	ldr r3, _0808DFAC @ =0x0200E668
	mov ip, r3
	ldrb r0, [r3]
	subs r0, #1
	cmp r2, r0
	blt _0808DF4A
	b _0808E31E
_0808DF4A:
	adds r4, r3, #0
	mov sb, r4
_0808DF4E:
	movs r2, #0
	adds r0, r1, #1
	mov r6, sb
	ldrb r6, [r6]
	subs r1, r6, r0
	adds r7, r0, #0
	cmp r2, r1
	bge _0808DF9A
	ldr r0, _0808DFB0 @ =0x0200CBF0
	mov r8, r0
_0808DF62:
	adds r6, r2, #1
	lsls r0, r6, #2
	mov r1, r8
	adds r5, r0, r1
	ldr r4, [r5]
	ldr r1, [r4]
	adds r1, #0x2e
	lsls r0, r2, #2
	mov r3, r8
	adds r2, r0, r3
	ldr r3, [r2]
	ldr r0, [r3]
	adds r0, #0x2e
	ldrb r1, [r1]
	ldrb r0, [r0]
	cmp r1, r0
	bls _0808DF8C
	str r4, [r2]
	str r3, [r5]
	movs r4, #1
	mov sl, r4
_0808DF8C:
	lsls r0, r6, #0x18
	lsrs r2, r0, #0x18
	mov r6, sb
	ldrb r6, [r6]
	subs r0, r6, r7
	cmp r2, r0
	blt _0808DF62
_0808DF9A:
	lsls r0, r7, #0x18
	lsrs r1, r0, #0x18
	mov r7, ip
	ldrb r0, [r7]
	subs r0, #1
	cmp r1, r0
	blt _0808DF4E
	b _0808E31E
	.align 2, 0
_0808DFAC: .4byte 0x0200E668
_0808DFB0: .4byte 0x0200CBF0
_0808DFB4:
	movs r1, #0
	mov sl, r1
	ldr r2, _0808E028 @ =0x0200E668
	mov ip, r2
	ldrb r0, [r2]
	subs r0, #1
	cmp sl, r0
	blt _0808DFC6
	b _0808E31E
_0808DFC6:
	adds r3, r2, #0
	mov sb, r3
_0808DFCA:
	movs r2, #0
	adds r0, r1, #1
	mov r4, sb
	ldrb r4, [r4]
	subs r1, r4, r0
	adds r7, r0, #0
	cmp r2, r1
	bge _0808E016
	ldr r6, _0808E02C @ =0x0200CBF0
	mov r8, r6
_0808DFDE:
	adds r6, r2, #1
	lsls r0, r6, #2
	mov r1, r8
	adds r5, r0, r1
	ldr r4, [r5]
	ldr r1, [r4]
	adds r1, #0x2e
	lsls r0, r2, #2
	mov r3, r8
	adds r2, r0, r3
	ldr r3, [r2]
	ldr r0, [r3]
	adds r0, #0x2e
	ldrb r1, [r1]
	ldrb r0, [r0]
	cmp r1, r0
	bhs _0808E008
	str r4, [r2]
	str r3, [r5]
	movs r4, #1
	mov sl, r4
_0808E008:
	lsls r0, r6, #0x18
	lsrs r2, r0, #0x18
	mov r6, sb
	ldrb r6, [r6]
	subs r0, r6, r7
	cmp r2, r0
	blt _0808DFDE
_0808E016:
	lsls r0, r7, #0x18
	lsrs r1, r0, #0x18
	mov r7, ip
	ldrb r0, [r7]
	subs r0, #1
	cmp r1, r0
	blt _0808DFCA
	b _0808E31E
	.align 2, 0
_0808E028: .4byte 0x0200E668
_0808E02C: .4byte 0x0200CBF0
_0808E030:
	cmp r2, #0
	bne _0808E0B0
	movs r1, #0
	mov sl, r1
	ldr r3, _0808E0A8 @ =0x0200E668
	mov ip, r3
	ldrb r0, [r3]
	subs r0, #1
	cmp r2, r0
	blt _0808E046
	b _0808E31E
_0808E046:
	adds r4, r3, #0
	mov sb, r4
_0808E04A:
	movs r2, #0
	adds r0, r1, #1
	mov r6, sb
	ldrb r6, [r6]
	subs r1, r6, r0
	adds r7, r0, #0
	cmp r2, r1
	bge _0808E096
	ldr r0, _0808E0AC @ =0x0200CBF0
	mov r8, r0
_0808E05E:
	adds r6, r2, #1
	lsls r0, r6, #2
	mov r1, r8
	adds r5, r0, r1
	ldr r4, [r5]
	ldr r1, [r4]
	adds r1, #0x2f
	lsls r0, r2, #2
	mov r3, r8
	adds r2, r0, r3
	ldr r3, [r2]
	ldr r0, [r3]
	adds r0, #0x2f
	ldrb r1, [r1]
	ldrb r0, [r0]
	cmp r1, r0
	bls _0808E088
	str r4, [r2]
	str r3, [r5]
	movs r4, #1
	mov sl, r4
_0808E088:
	lsls r0, r6, #0x18
	lsrs r2, r0, #0x18
	mov r6, sb
	ldrb r6, [r6]
	subs r0, r6, r7
	cmp r2, r0
	blt _0808E05E
_0808E096:
	lsls r0, r7, #0x18
	lsrs r1, r0, #0x18
	mov r7, ip
	ldrb r0, [r7]
	subs r0, #1
	cmp r1, r0
	blt _0808E04A
	b _0808E31E
	.align 2, 0
_0808E0A8: .4byte 0x0200E668
_0808E0AC: .4byte 0x0200CBF0
_0808E0B0:
	movs r1, #0
	mov sl, r1
	ldr r2, _0808E124 @ =0x0200E668
	mov ip, r2
	ldrb r0, [r2]
	subs r0, #1
	cmp sl, r0
	blt _0808E0C2
	b _0808E31E
_0808E0C2:
	adds r3, r2, #0
	mov sb, r3
_0808E0C6:
	movs r2, #0
	adds r0, r1, #1
	mov r4, sb
	ldrb r4, [r4]
	subs r1, r4, r0
	adds r7, r0, #0
	cmp r2, r1
	bge _0808E112
	ldr r6, _0808E128 @ =0x0200CBF0
	mov r8, r6
_0808E0DA:
	adds r6, r2, #1
	lsls r0, r6, #2
	mov r1, r8
	adds r5, r0, r1
	ldr r4, [r5]
	ldr r1, [r4]
	adds r1, #0x2f
	lsls r0, r2, #2
	mov r3, r8
	adds r2, r0, r3
	ldr r3, [r2]
	ldr r0, [r3]
	adds r0, #0x2f
	ldrb r1, [r1]
	ldrb r0, [r0]
	cmp r1, r0
	bhs _0808E104
	str r4, [r2]
	str r3, [r5]
	movs r4, #1
	mov sl, r4
_0808E104:
	lsls r0, r6, #0x18
	lsrs r2, r0, #0x18
	mov r6, sb
	ldrb r6, [r6]
	subs r0, r6, r7
	cmp r2, r0
	blt _0808E0DA
_0808E112:
	lsls r0, r7, #0x18
	lsrs r1, r0, #0x18
	mov r7, ip
	ldrb r0, [r7]
	subs r0, #1
	cmp r1, r0
	blt _0808E0C6
	b _0808E31E
	.align 2, 0
_0808E124: .4byte 0x0200E668
_0808E128: .4byte 0x0200CBF0
_0808E12C:
	cmp r2, #0
	bne _0808E1A4
	movs r1, #0
	mov sl, r1
	ldr r3, _0808E19C @ =0x0200E668
	mov ip, r3
	ldrb r0, [r3]
	subs r0, #1
	cmp r2, r0
	bge _0808E20E
	adds r4, r3, #0
	mov sb, r4
_0808E144:
	movs r4, #0
	adds r0, r1, #1
	mov r6, sb
	ldrb r6, [r6]
	subs r1, r6, r0
	mov r8, r0
	cmp r4, r1
	bge _0808E188
	ldr r6, _0808E1A0 @ =0x0200CBF0
	mov r7, r8
	str r7, [sp, #0x64]
_0808E15A:
	adds r5, r4, #1
	lsls r0, r5, #2
	adds r3, r0, r6
	ldr r2, [r3]
	lsls r0, r4, #2
	adds r0, r0, r6
	ldr r1, [r0]
	ldrb r4, [r2, #0xa]
	ldrb r7, [r1, #0xa]
	cmp r4, r7
	bls _0808E178
	str r2, [r0]
	str r1, [r3]
	movs r0, #1
	mov sl, r0
_0808E178:
	lsls r0, r5, #0x18
	lsrs r4, r0, #0x18
	mov r1, sb
	ldrb r1, [r1]
	ldr r2, [sp, #0x64]
	subs r0, r1, r2
	cmp r4, r0
	blt _0808E15A
_0808E188:
	mov r3, r8
	lsls r0, r3, #0x18
	lsrs r1, r0, #0x18
	mov r4, ip
	ldrb r0, [r4]
	subs r0, #1
	cmp r1, r0
	blt _0808E144
	b _0808E20E
	.align 2, 0
_0808E19C: .4byte 0x0200E668
_0808E1A0: .4byte 0x0200CBF0
_0808E1A4:
	movs r7, #0
	mov sl, r7
	movs r1, #0
	ldr r0, _0808E21C @ =0x0200E668
	mov ip, r0
	ldrb r0, [r0]
	subs r0, #1
	cmp sl, r0
	bge _0808E20E
	ldr r2, _0808E21C @ =0x0200E668
	mov sb, r2
_0808E1BA:
	movs r4, #0
	adds r0, r1, #1
	mov r3, sb
	ldrb r3, [r3]
	subs r1, r3, r0
	mov r8, r0
	cmp r4, r1
	bge _0808E1FE
	ldr r6, _0808E220 @ =0x0200CBF0
	mov r7, r8
	str r7, [sp, #0x64]
_0808E1D0:
	adds r5, r4, #1
	lsls r0, r5, #2
	adds r3, r0, r6
	ldr r2, [r3]
	lsls r0, r4, #2
	adds r0, r0, r6
	ldr r1, [r0]
	ldrb r4, [r2, #0xa]
	ldrb r7, [r1, #0xa]
	cmp r4, r7
	bhs _0808E1EE
	str r2, [r0]
	str r1, [r3]
	movs r0, #1
	mov sl, r0
_0808E1EE:
	lsls r0, r5, #0x18
	lsrs r4, r0, #0x18
	mov r1, sb
	ldrb r1, [r1]
	ldr r2, [sp, #0x64]
	subs r0, r1, r2
	cmp r4, r0
	blt _0808E1D0
_0808E1FE:
	mov r3, r8
	lsls r0, r3, #0x18
	lsrs r1, r0, #0x18
	mov r4, ip
	ldrb r0, [r4]
	subs r0, #1
	cmp r1, r0
	blt _0808E1BA
_0808E20E:
	mov r6, sl
_0808E210:
	cmp r6, #0
	bne _0808E216
	b _0808E330
_0808E216:
	movs r0, #1
	b _0808E332
	.align 2, 0
_0808E21C: .4byte 0x0200E668
_0808E220: .4byte 0x0200CBF0
_0808E224:
	cmp r2, #0
	bne _0808E2AC
	movs r7, #0
	mov sl, r7
	movs r1, #0
	ldr r2, _0808E2A4 @ =0x0200E668
	ldrb r0, [r2]
	subs r0, #1
	cmp sl, r0
	bge _0808E29A
_0808E238:
	movs r5, #0
	adds r0, r1, #1
	ldrb r2, [r2]
	subs r1, r2, r0
	mov r8, r0
	cmp r5, r1
	bge _0808E28A
	ldr r0, _0808E2A8 @ =0x0200CBF0
	mov sb, r0
_0808E24A:
	adds r7, r5, #1
	lsls r0, r7, #2
	mov r1, sb
	adds r6, r0, r1
	ldr r0, [r6]
	ldr r0, [r0]
	bl sub_808BF14
	adds r4, r0, #0
	lsls r0, r5, #2
	mov r2, sb
	adds r5, r0, r2
	ldr r0, [r5]
	ldr r0, [r0]
	bl sub_808BF14
	cmp r4, r0
	ble _0808E27A
	ldr r1, [r5]
	ldr r0, [r6]
	str r0, [r5]
	str r1, [r6]
	movs r3, #1
	mov sl, r3
_0808E27A:
	lsls r0, r7, #0x18
	lsrs r5, r0, #0x18
	ldr r0, _0808E2A4 @ =0x0200E668
	ldrb r0, [r0]
	mov r4, r8
	subs r0, r0, r4
	cmp r5, r0
	blt _0808E24A
_0808E28A:
	mov r6, r8
	lsls r0, r6, #0x18
	lsrs r1, r0, #0x18
	ldr r2, _0808E2A4 @ =0x0200E668
	ldrb r0, [r2]
	subs r0, #1
	cmp r1, r0
	blt _0808E238
_0808E29A:
	mov r7, sl
_0808E29C:
	cmp r7, #0
	beq _0808E330
	movs r0, #1
	b _0808E332
	.align 2, 0
_0808E2A4: .4byte 0x0200E668
_0808E2A8: .4byte 0x0200CBF0
_0808E2AC:
	movs r0, #0
	mov sl, r0
	movs r2, #0
	ldr r1, _0808E328 @ =0x0200E668
	ldrb r0, [r1]
	subs r0, #1
	cmp sl, r0
	bge _0808E31E
_0808E2BC:
	movs r5, #0
	adds r0, r2, #1
	ldrb r1, [r1]
	subs r1, r1, r0
	mov r8, r0
	cmp r5, r1
	bge _0808E30E
	ldr r1, _0808E32C @ =0x0200CBF0
	mov sb, r1
_0808E2CE:
	adds r7, r5, #1
	lsls r0, r7, #2
	mov r2, sb
	adds r6, r0, r2
	ldr r0, [r6]
	ldr r0, [r0]
	bl sub_808BF14
	adds r4, r0, #0
	lsls r0, r5, #2
	mov r3, sb
	adds r5, r0, r3
	ldr r0, [r5]
	ldr r0, [r0]
	bl sub_808BF14
	cmp r4, r0
	bge _0808E2FE
	ldr r1, [r5]
	ldr r0, [r6]
	str r0, [r5]
	str r1, [r6]
	movs r4, #1
	mov sl, r4
_0808E2FE:
	lsls r0, r7, #0x18
	lsrs r5, r0, #0x18
	ldr r0, _0808E328 @ =0x0200E668
	ldrb r0, [r0]
	mov r6, r8
	subs r0, r0, r6
	cmp r5, r0
	blt _0808E2CE
_0808E30E:
	mov r7, r8
	lsls r0, r7, #0x18
	lsrs r2, r0, #0x18
	ldr r1, _0808E328 @ =0x0200E668
	ldrb r0, [r1]
	subs r0, #1
	cmp r2, r0
	blt _0808E2BC
_0808E31E:
	mov r0, sl
	cmp r0, #0
	beq _0808E330
	movs r0, #1
	b _0808E332
	.align 2, 0
_0808E328: .4byte 0x0200E668
_0808E32C: .4byte 0x0200CBF0
_0808E330:
	movs r0, #0
_0808E332:
	add sp, #0x68
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
