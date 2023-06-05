	.include "macro.inc"
	.syntax unified

	thumb_func_start GetPortraitData
GetPortraitData: @ 0x080069B0
	adds r1, r0, #0
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _080069C0 @ =0x08D5E23C
	adds r0, r0, r1
	bx lr
	.align 2, 0
_080069C0: .4byte 0x08D5E23C

	thumb_func_start sub_080069C4
sub_080069C4: @ 0x080069C4
	push {r4, lr}
	movs r4, #0
_080069C8:
	adds r0, r4, #0
	bl EndFaceById
	adds r4, #1
	cmp r4, #3
	ble _080069C8
	movs r0, #0
	bl sub_080069E0
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_080069E0
sub_080069E0: @ 0x080069E0
	cmp r0, #0
	bne _080069E6
	ldr r0, _08006A00 @ =0x08BFF808
_080069E6:
	ldr r2, _08006A04 @ =0x0202A580
	adds r1, r0, #0
	movs r3, #3
_080069EC:
	ldr r0, [r1]
	str r0, [r2]
	ldrh r0, [r1, #4]
	strh r0, [r2, #4]
	adds r2, #8
	adds r1, #8
	subs r3, #1
	cmp r3, #0
	bge _080069EC
	bx lr
	.align 2, 0
_08006A00: .4byte 0x08BFF808
_08006A04: .4byte 0x0202A580

	thumb_func_start sub_08006A08
sub_08006A08: @ 0x08006A08
	movs r1, #0
	ldr r2, _08006A18 @ =0x030040E0
_08006A0C:
	ldr r0, [r2]
	cmp r0, #0
	bne _08006A1C
	adds r0, r1, #0
	b _08006A28
	.align 2, 0
_08006A18: .4byte 0x030040E0
_08006A1C:
	adds r2, #4
	adds r1, #1
	cmp r1, #3
	ble _08006A0C
	movs r0, #1
	rsbs r0, r0, #0
_08006A28:
	bx lr
	.align 2, 0

	thumb_func_start sub_08006A2C
sub_08006A2C: @ 0x08006A2C
	push {lr}
	ldr r1, [r0, #0x2c]
	ldr r2, [r1]
	ldr r1, _08006A4C @ =0x0202A580
	adds r0, #0x40
	ldrb r0, [r0]
	lsls r0, r0, #3
	adds r0, r0, r1
	ldr r1, [r0]
	ldr r0, _08006A50 @ =0x06010000
	adds r1, r1, r0
	adds r0, r2, #0
	bl sub_08013688
	pop {r0}
	bx r0
	.align 2, 0
_08006A4C: .4byte 0x0202A580
_08006A50: .4byte 0x06010000

	thumb_func_start sub_08006A54
sub_08006A54: @ 0x08006A54
	push {r4, lr}
	sub sp, #4
	adds r4, r0, #0
	bl sub_08006C2C
	adds r2, r0, #0
	movs r0, #0x80
	lsls r0, r0, #3
	ands r2, r0
	rsbs r2, r2, #0
	asrs r2, r2, #0x1f
	ands r2, r0
	movs r0, #0xff
	ldrh r1, [r4, #0x36]
	ands r0, r1
	adds r2, r2, r0
	adds r0, r4, #0
	adds r0, #0x41
	ldrb r0, [r0]
	ldr r1, _08006A94 @ =0x000001FF
	ldrh r3, [r4, #0x34]
	ands r1, r3
	ldr r3, [r4, #0x38]
	ldrh r4, [r4, #0x3c]
	str r4, [sp]
	bl sub_080068C4
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08006A94: .4byte 0x000001FF

	thumb_func_start sub_08006A98
sub_08006A98: @ 0x08006A98
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r5, r0, #0
	adds r6, r1, #0
	adds r7, r2, #0
	adds r4, r3, #0
	bl sub_08006A08
	cmp r0, #0
	blt _08006ABA
	str r4, [sp]
	adds r1, r5, #0
	adds r2, r6, #0
	adds r3, r7, #0
	bl sub_08006AC4
	b _08006ABC
_08006ABA:
	movs r0, #0
_08006ABC:
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	thumb_func_start sub_08006AC4
sub_08006AC4: @ 0x08006AC4
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	adds r6, r0, #0
	mov r8, r1
	mov sb, r2
	mov sl, r3
	ldr r1, _08006AE8 @ =0x030040E0
	lsls r0, r6, #2
	adds r5, r0, r1
	ldr r7, [r5]
	cmp r7, #0
	beq _08006AEC
	movs r0, #0
	b _08006BA8
	.align 2, 0
_08006AE8: .4byte 0x030040E0
_08006AEC:
	ldr r0, _08006B2C @ =0x08BFF970
	movs r1, #5
	bl Proc_Start
	adds r4, r0, #0
	str r4, [r5]
	mov r0, r8
	bl GetPortraitData
	adds r5, r0, #0
	movs r0, #0x80
	lsls r0, r0, #6
	ldr r1, [sp, #0x24]
	ands r0, r1
	cmp r0, #0
	beq _08006B3C
	str r7, [sp]
	ldr r1, _08006B30 @ =0x0202A580
	lsls r0, r6, #3
	adds r0, r0, r1
	ldrh r0, [r0, #4]
	lsls r1, r0, #5
	ldr r0, _08006B34 @ =0x02022A60
	adds r1, r1, r0
	ldr r2, _08006B38 @ =0x01000008
	mov r0, sp
	bl CpuFastSet
	bl EnablePalSync
	b _08006B50
	.align 2, 0
_08006B2C: .4byte 0x08BFF970
_08006B30: .4byte 0x0202A580
_08006B34: .4byte 0x02022A60
_08006B38: .4byte 0x01000008
_08006B3C:
	ldr r0, [r5, #8]
	ldr r2, _08006B80 @ =0x0202A580
	lsls r1, r6, #3
	adds r1, r1, r2
	ldrh r1, [r1, #4]
	adds r1, #0x10
	lsls r1, r1, #5
	movs r2, #0x20
	bl ApplyPaletteExt
_08006B50:
	str r5, [r4, #0x2c]
	adds r0, r4, #0
	adds r0, #0x40
	movs r2, #0
	strb r6, [r0]
	mov r0, r8
	strh r0, [r4, #0x3e]
	adds r1, r4, #0
	adds r1, #0x41
	movs r0, #5
	strb r0, [r1]
	mov r1, sb
	strh r1, [r4, #0x34]
	mov r0, sl
	strh r0, [r4, #0x36]
	movs r0, #0x80
	lsls r0, r0, #5
	ldr r1, [sp, #0x24]
	ands r0, r1
	cmp r0, #0
	beq _08006B84
	str r2, [r4, #0x44]
	str r2, [r4, #0x48]
	b _08006B98
	.align 2, 0
_08006B80: .4byte 0x0202A580
_08006B84:
	ldr r0, _08006BB8 @ =0x08BFFA68
	adds r1, r4, #0
	bl Proc_Start
	str r0, [r4, #0x44]
	ldr r0, _08006BBC @ =0x08BFFA80
	adds r1, r4, #0
	bl Proc_Start
	str r0, [r4, #0x48]
_08006B98:
	ldr r1, [sp, #0x24]
	mvns r0, r1
	str r0, [r4, #0x30]
	adds r0, r4, #0
	ldr r1, [sp, #0x24]
	bl sub_08006BF8
	adds r0, r4, #0
_08006BA8:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_08006BB8: .4byte 0x08BFFA68
_08006BBC: .4byte 0x08BFFA80

	thumb_func_start sub_08006BC0
sub_08006BC0: @ 0x08006BC0
	push {lr}
	ldr r2, _08006BDC @ =0x030040E0
	adds r1, r0, #0
	adds r1, #0x40
	ldrb r1, [r1]
	lsls r1, r1, #2
	adds r1, r1, r2
	movs r2, #0
	str r2, [r1]
	bl Proc_End
	pop {r0}
	bx r0
	.align 2, 0
_08006BDC: .4byte 0x030040E0

	thumb_func_start EndFaceById
EndFaceById: @ 0x08006BE0
	push {lr}
	ldr r1, _08006BF4 @ =0x030040E0
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	bl sub_08006BC0
	pop {r0}
	bx r0
	.align 2, 0
_08006BF4: .4byte 0x030040E0

	thumb_func_start sub_08006BF8
sub_08006BF8: @ 0x08006BF8
	push {r4, lr}
	adds r4, r0, #0
	cmp r4, #0
	beq _08006C0A
	str r1, [r4, #0x30]
	bl sub_08006C48
	ldr r0, [r4, #0x30]
	b _08006C0C
_08006C0A:
	movs r0, #0
_08006C0C:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_08006C14
sub_08006C14: @ 0x08006C14
	push {lr}
	ldr r2, _08006C28 @ =0x030040E0
	lsls r0, r0, #2
	adds r0, r0, r2
	ldr r0, [r0]
	bl sub_08006BF8
	pop {r1}
	bx r1
	.align 2, 0
_08006C28: .4byte 0x030040E0

	thumb_func_start sub_08006C2C
sub_08006C2C: @ 0x08006C2C
	ldr r0, [r0, #0x30]
	bx lr

	thumb_func_start sub_08006C30
sub_08006C30: @ 0x08006C30
	push {lr}
	ldr r1, _08006C44 @ =0x030040E0
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	bl sub_08006C2C
	pop {r1}
	bx r1
	.align 2, 0
_08006C44: .4byte 0x030040E0

	thumb_func_start sub_08006C48
sub_08006C48: @ 0x08006C48
	push {r4, lr}
	adds r3, r0, #0
	ldr r1, [r3, #0x30]
	ldr r0, _08006C70 @ =0x00000807
	ands r1, r0
	cmp r1, #3
	beq _08006C94
	cmp r1, #3
	bls _08006C74
	cmp r1, #5
	beq _08006CA4
	cmp r1, #5
	blo _08006C9C
	subs r0, #7
	cmp r1, r0
	beq _08006CAC
	adds r0, #1
	cmp r1, r0
	beq _08006CB4
	b _08006CB8
	.align 2, 0
_08006C70: .4byte 0x00000807
_08006C74:
	cmp r1, #1
	beq _08006C84
	cmp r1, #1
	bhi _08006C8C
	ldr r0, _08006C80 @ =0x08BFF828
	b _08006CB6
	.align 2, 0
_08006C80: .4byte 0x08BFF828
_08006C84:
	ldr r0, _08006C88 @ =0x08BFF842
	b _08006CB6
	.align 2, 0
_08006C88: .4byte 0x08BFF842
_08006C8C:
	ldr r0, _08006C90 @ =0x08BFF85C
	b _08006CB6
	.align 2, 0
_08006C90: .4byte 0x08BFF85C
_08006C94:
	ldr r0, _08006C98 @ =0x08BFF882
	b _08006CB6
	.align 2, 0
_08006C98: .4byte 0x08BFF882
_08006C9C:
	ldr r0, _08006CA0 @ =0x08BFF8A8
	b _08006CB6
	.align 2, 0
_08006CA0: .4byte 0x08BFF8A8
_08006CA4:
	ldr r0, _08006CA8 @ =0x08BFF8DA
	b _08006CB6
	.align 2, 0
_08006CA8: .4byte 0x08BFF8DA
_08006CAC:
	ldr r0, _08006CB0 @ =0x08BFF90C
	b _08006CB6
	.align 2, 0
_08006CB0: .4byte 0x08BFF90C
_08006CB4:
	ldr r0, _08006CD0 @ =0x08BFF93E
_08006CB6:
	str r0, [r3, #0x38]
_08006CB8:
	ldr r1, [r3, #0x30]
	movs r0, #0xf0
	lsls r0, r0, #2
	ands r1, r0
	cmp r1, #0x80
	beq _08006CE2
	cmp r1, #0x80
	bhi _08006CD4
	cmp r1, #0x40
	beq _08006CDE
	b _08006CEE
	.align 2, 0
_08006CD0: .4byte 0x08BFF93E
_08006CD4:
	movs r0, #0x80
	lsls r0, r0, #2
	cmp r1, r0
	beq _08006CE8
	b _08006CEE
_08006CDE:
	movs r4, #0
	b _08006CF2
_08006CE2:
	movs r4, #0x80
	lsls r4, r4, #3
	b _08006CF2
_08006CE8:
	movs r4, #0xc0
	lsls r4, r4, #4
	b _08006CF2
_08006CEE:
	movs r4, #0x80
	lsls r4, r4, #4
_08006CF2:
	ldr r1, _08006D18 @ =0x0202A580
	adds r0, r3, #0
	adds r0, #0x40
	ldrb r0, [r0]
	lsls r2, r0, #3
	adds r2, r2, r1
	ldr r1, [r2]
	lsrs r1, r1, #5
	movs r0, #0xf
	ldrh r2, [r2, #4]
	ands r0, r2
	lsls r0, r0, #0xc
	adds r1, r1, r0
	adds r1, r1, r4
	strh r1, [r3, #0x3c]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08006D18: .4byte 0x0202A580

	thumb_func_start sub_08006D1C
sub_08006D1C: @ 0x08006D1C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	mov r8, r0
	mov ip, r2
	ldrb r7, [r1]
	adds r1, #1
	ldrb r6, [r1]
	adds r2, r1, #1
	lsls r3, r3, #0x18
	cmp r3, #0
	bne _08006D66
	movs r0, #0
	cmp r0, r6
	bge _08006DA0
_08006D3A:
	adds r4, r0, #1
	cmp r7, #0
	beq _08006D5E
	lsls r0, r0, #6
	mov r3, r8
	adds r1, r0, r3
	adds r3, r7, #0
_08006D48:
	ldrb r0, [r2]
	cmp r0, #0xff
	beq _08006D54
	ldrb r0, [r2]
	add r0, ip
	strh r0, [r1]
_08006D54:
	adds r2, #1
	adds r1, #2
	subs r3, #1
	cmp r3, #0
	bne _08006D48
_08006D5E:
	adds r0, r4, #0
	cmp r0, r6
	blt _08006D3A
	b _08006DA0
_08006D66:
	movs r0, #0
	cmp r0, r6
	bge _08006DA0
_08006D6C:
	subs r3, r7, #1
	adds r4, r0, #1
	cmp r3, #0
	blt _08006D9A
	movs r1, #0x80
	lsls r1, r1, #3
	adds r5, r1, #0
	lsls r1, r3, #1
	lsls r0, r0, #6
	add r0, r8
	adds r1, r1, r0
_08006D82:
	ldrb r0, [r2]
	cmp r0, #0xff
	beq _08006D90
	ldrb r0, [r2]
	add r0, ip
	adds r0, r0, r5
	strh r0, [r1]
_08006D90:
	adds r2, #1
	subs r1, #2
	subs r3, #1
	cmp r3, #0
	bge _08006D82
_08006D9A:
	adds r0, r4, #0
	cmp r0, r6
	blt _08006D6C
_08006DA0:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_08006DAC
sub_08006DAC: @ 0x08006DAC
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r6, r2, #0
	ldr r0, _08006DE0 @ =0x00007EFF
	cmp r4, r0
	ble _08006DE8
	adds r0, r4, #0
	bl sub_08007428
	lsls r1, r5, #5
	movs r3, #0xc0
	lsls r3, r3, #0x13
	adds r1, r1, r3
	ldr r2, _08006DE4 @ =0x0001FFFF
	ands r1, r2
	adds r1, r1, r3
	movs r2, #0x80
	lsls r2, r2, #2
	bl RegisterDataMove
	adds r0, r4, #0
	adds r1, r6, #0
	bl sub_08007458
	b _08006E08
	.align 2, 0
_08006DE0: .4byte 0x00007EFF
_08006DE4: .4byte 0x0001FFFF
_08006DE8:
	adds r0, r4, #0
	bl GetPortraitData
	adds r4, r0, #0
	ldr r0, [r4, #4]
	lsls r1, r5, #5
	movs r2, #0xc0
	lsls r2, r2, #0x13
	adds r1, r1, r2
	bl sub_08013688
	ldr r0, [r4, #8]
	lsls r1, r6, #5
	movs r2, #0x20
	bl ApplyPaletteExt
_08006E08:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_08006E10
sub_08006E10: @ 0x08006E10
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	mov r8, r1
	adds r6, r2, #0
	adds r5, r3, #0
	ldr r4, [sp, #0x14]
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	adds r1, r6, #0
	adds r2, r5, #0
	bl sub_08006DAC
	ldr r2, _08006E4C @ =0x000003FF
	ands r2, r6
	ldr r1, _08006E50 @ =0x08BFF9E0
	lsls r5, r5, #0xc
	adds r2, r2, r5
	lsls r4, r4, #0x18
	asrs r4, r4, #0x18
	mov r0, r8
	adds r3, r4, #0
	bl sub_08006D1C
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08006E4C: .4byte 0x000003FF
_08006E50: .4byte 0x08BFF9E0

	thumb_func_start sub_08006E54
sub_08006E54: @ 0x08006E54
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	ldr r4, _08006EE4 @ =0xFFFFFE00
	add sp, r4
	adds r6, r0, #0
	adds r7, r1, #0
	mov r8, r2
	movs r0, #0x80
	lsls r0, r0, #4
	adds r7, r7, r0
	ldr r0, _08006EE8 @ =0x00007EFF
	cmp r6, r0
	ble _08006EF0
	adds r0, r6, #0
	bl sub_08007428
	lsls r1, r7, #5
	ldr r5, _08006EEC @ =0x0001FFFF
	ands r1, r5
	movs r4, #0xc0
	lsls r4, r4, #0x13
	adds r1, r1, r4
	movs r2, #0x80
	bl RegisterDataMove
	adds r0, r6, #0
	bl sub_08007428
	adds r0, #0x80
	adds r1, r7, #0
	adds r1, #0x20
	lsls r1, r1, #5
	ands r1, r5
	adds r1, r1, r4
	movs r2, #0x80
	bl RegisterDataMove
	adds r0, r6, #0
	bl sub_08007428
	movs r1, #0x80
	lsls r1, r1, #1
	adds r0, r0, r1
	adds r1, r7, #4
	lsls r1, r1, #5
	ands r1, r5
	adds r1, r1, r4
	movs r2, #0x80
	bl RegisterDataMove
	adds r0, r6, #0
	bl sub_08007428
	movs r1, #0xc0
	lsls r1, r1, #1
	adds r0, r0, r1
	adds r1, r7, #0
	adds r1, #0x24
	lsls r1, r1, #5
	ands r1, r5
	adds r1, r1, r4
	movs r2, #0x80
	bl RegisterDataMove
	mov r1, r8
	adds r1, #0x10
	adds r0, r6, #0
	bl sub_08007458
	b _08006F4C
	.align 2, 0
_08006EE4: .4byte 0xFFFFFE00
_08006EE8: .4byte 0x00007EFF
_08006EEC: .4byte 0x0001FFFF
_08006EF0:
	adds r0, r6, #0
	bl GetPortraitData
	adds r5, r0, #0
	ldr r0, [r5, #4]
	mov r1, sp
	bl sub_08013688
	lsls r1, r7, #5
	movs r4, #0xc0
	lsls r4, r4, #0x13
	adds r1, r1, r4
	mov r0, sp
	movs r2, #0x20
	bl CpuFastSet
	add r0, sp, #0x80
	adds r1, r7, #0
	adds r1, #0x20
	lsls r1, r1, #5
	adds r1, r1, r4
	movs r2, #0x20
	bl CpuFastSet
	add r0, sp, #0x100
	adds r1, r7, #4
	lsls r1, r1, #5
	adds r1, r1, r4
	movs r2, #0x20
	bl CpuFastSet
	add r0, sp, #0x180
	adds r1, r7, #0
	adds r1, #0x24
	lsls r1, r1, #5
	adds r1, r1, r4
	movs r2, #0x20
	bl CpuFastSet
	ldr r0, [r5, #8]
	mov r1, r8
	adds r1, #0x10
	lsls r1, r1, #5
	movs r2, #0x20
	bl ApplyPaletteExt
_08006F4C:
	movs r3, #0x80
	lsls r3, r3, #2
	add sp, r3
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_08006F5C
sub_08006F5C: @ 0x08006F5C
	push {r4, lr}
	sub sp, #4
	movs r2, #0x34
	ldrsh r1, [r0, r2]
	ldr r3, _08006F88 @ =0x03002790
	ldrh r4, [r3, #0x1c]
	subs r1, r1, r4
	movs r4, #0x36
	ldrsh r2, [r0, r4]
	ldrh r3, [r3, #0x1e]
	subs r2, r2, r3
	ldr r3, [r0, #0x38]
	ldrh r0, [r0, #0x3c]
	str r0, [sp]
	movs r0, #5
	bl sub_08006884
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08006F88: .4byte 0x03002790

	thumb_func_start sub_08006F8C
sub_08006F8C: @ 0x08006F8C
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	mov r8, r0
	mov sb, r1
	adds r0, r2, #0
	adds r6, r3, #0
	ldr r4, [sp, #0x1c]
	ldr r5, [sp, #0x20]
	ldr r7, [sp, #0x24]
	lsls r5, r5, #0x18
	lsrs r5, r5, #0x18
	adds r1, r6, #0
	adds r2, r4, #0
	bl sub_08006E54
	ldr r0, _08006FD4 @ =0x08BFF9F4
	adds r1, r7, #0
	bl Proc_Start
	adds r1, r0, #0
	mov r0, r8
	strh r0, [r1, #0x34]
	mov r0, sb
	strh r0, [r1, #0x36]
	movs r0, #0xf
	ands r4, r0
	lsls r4, r4, #0xc
	adds r6, r6, r4
	strh r6, [r1, #0x3c]
	cmp r5, #0
	beq _08006FDC
	ldr r0, _08006FD8 @ =0x08BFFA12
	b _08006FDE
	.align 2, 0
_08006FD4: .4byte 0x08BFF9F4
_08006FD8: .4byte 0x08BFFA12
_08006FDC:
	ldr r0, _08006FEC @ =0x08BFFA04
_08006FDE:
	str r0, [r1, #0x38]
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08006FEC: .4byte 0x08BFFA04

	thumb_func_start sub_08006FF0
sub_08006FF0: @ 0x08006FF0
	push {lr}
	ldr r0, _08006FFC @ =0x08BFF9F4
	bl sub_08004748
	pop {r0}
	bx r0
	.align 2, 0
_08006FFC: .4byte 0x08BFF9F4

	thumb_func_start sub_08007000
sub_08007000: @ 0x08007000
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	adds r7, r1, #0
	ldrb r6, [r2, #0x14]
	subs r6, #1
	ldrb r4, [r2, #0x15]
	ldr r1, _08007050 @ =0x081911D4
	lsls r2, r7, #0x10
	lsrs r2, r2, #0x10
	bl TmApplyTsa_thm
	lsls r4, r4, #5
	adds r4, r4, r6
	lsls r4, r4, #1
	adds r2, r4, r5
	adds r0, r7, #0
	adds r0, #0x1c
	strh r0, [r2]
	adds r0, #1
	strh r0, [r2, #2]
	adds r0, #1
	strh r0, [r2, #4]
	adds r0, #1
	strh r0, [r2, #6]
	adds r1, r2, #0
	adds r1, #0x40
	adds r0, #0x1d
	strh r0, [r1]
	adds r1, #2
	adds r0, #1
	strh r0, [r1]
	adds r1, #2
	adds r0, #1
	strh r0, [r1]
	adds r1, #2
	adds r0, #1
	strh r0, [r1]
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08007050: .4byte 0x081911D4

	thumb_func_start sub_08007054
sub_08007054: @ 0x08007054
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	adds r7, r1, #0
	ldrb r6, [r2, #0x14]
	subs r6, #1
	ldrb r4, [r2, #0x15]
	subs r4, #1
	ldr r1, _080070A8 @ =0x0819128C
	lsls r2, r7, #0x10
	lsrs r2, r2, #0x10
	bl TmApplyTsa_thm
	lsls r4, r4, #5
	adds r4, r4, r6
	lsls r4, r4, #1
	adds r2, r4, r5
	adds r0, r7, #0
	adds r0, #0x1c
	strh r0, [r2]
	adds r0, #1
	strh r0, [r2, #2]
	adds r0, #1
	strh r0, [r2, #4]
	adds r0, #1
	strh r0, [r2, #6]
	adds r1, r2, #0
	adds r1, #0x40
	adds r0, #0x1d
	strh r0, [r1]
	adds r1, #2
	adds r0, #1
	strh r0, [r1]
	adds r1, #2
	adds r0, #1
	strh r0, [r1]
	adds r1, #2
	adds r0, #1
	strh r0, [r1]
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080070A8: .4byte 0x0819128C

	thumb_func_start sub_080070AC
sub_080070AC: @ 0x080070AC
	subs r0, #0x1c
	cmp r0, #0x25
	bhi _0800715C
	lsls r0, r0, #2
	ldr r1, _080070BC @ =_080070C0
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080070BC: .4byte _080070C0
_080070C0: @ jump table
	.4byte _08007158 @ case 0
	.4byte _0800715C @ case 1
	.4byte _0800715C @ case 2
	.4byte _0800715C @ case 3
	.4byte _0800715C @ case 4
	.4byte _0800715C @ case 5
	.4byte _0800715C @ case 6
	.4byte _0800715C @ case 7
	.4byte _0800715C @ case 8
	.4byte _0800715C @ case 9
	.4byte _0800715C @ case 10
	.4byte _0800715C @ case 11
	.4byte _0800715C @ case 12
	.4byte _0800715C @ case 13
	.4byte _0800715C @ case 14
	.4byte _0800715C @ case 15
	.4byte _0800715C @ case 16
	.4byte _0800715C @ case 17
	.4byte _0800715C @ case 18
	.4byte _0800715C @ case 19
	.4byte _0800715C @ case 20
	.4byte _0800715C @ case 21
	.4byte _0800715C @ case 22
	.4byte _08007158 @ case 23
	.4byte _0800715C @ case 24
	.4byte _0800715C @ case 25
	.4byte _0800715C @ case 26
	.4byte _0800715C @ case 27
	.4byte _0800715C @ case 28
	.4byte _08007158 @ case 29
	.4byte _0800715C @ case 30
	.4byte _0800715C @ case 31
	.4byte _0800715C @ case 32
	.4byte _0800715C @ case 33
	.4byte _08007158 @ case 34
	.4byte _08007158 @ case 35
	.4byte _0800715C @ case 36
	.4byte _08007158 @ case 37
_08007158:
	movs r0, #1
	b _0800715E
_0800715C:
	movs r0, #0
_0800715E:
	bx lr

	thumb_func_start sub_08007160
sub_08007160: @ 0x08007160
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	mov sb, r0
	adds r5, r1, #0
	adds r6, r2, #0
	adds r7, r3, #0
	cmp r5, #0
	beq _08007210
	adds r0, r5, #0
	bl GetPortraitData
	adds r4, r0, #0
	ldr r0, [r4, #8]
	lsls r1, r7, #5
	mov r8, r1
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r0, [r4]
	cmp r0, #0
	beq _080071F0
	lsls r1, r6, #5
	movs r2, #0xc0
	lsls r2, r2, #0x13
	adds r1, r1, r2
	bl sub_08013688
	ldr r0, [r4, #8]
	mov r1, r8
	movs r2, #0x20
	bl ApplyPaletteExt
	adds r0, r5, #0
	bl sub_080070AC
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080071C8
	lsls r1, r7, #0xc
	ldr r0, _080071C4 @ =0x000003FF
	ands r0, r6
	adds r1, r1, r0
	mov r0, sb
	adds r2, r4, #0
	bl sub_08007054
	b _080071D8
	.align 2, 0
_080071C4: .4byte 0x000003FF
_080071C8:
	lsls r1, r7, #0xc
	ldr r0, _080071EC @ =0x000003FF
	ands r0, r6
	adds r1, r1, r0
	mov r0, sb
	adds r2, r4, #0
	bl sub_08007000
_080071D8:
	movs r2, #0
	mov r0, sb
	movs r1, #5
_080071DE:
	strh r2, [r0]
	strh r2, [r0, #0x12]
	adds r0, #0x40
	subs r1, #1
	cmp r1, #0
	bge _080071DE
	b _08007210
	.align 2, 0
_080071EC: .4byte 0x000003FF
_080071F0:
	ldr r0, [r4, #0x10]
	lsls r1, r6, #5
	movs r2, #0xc0
	lsls r2, r2, #0x13
	adds r1, r1, r2
	bl sub_08013688
	lsls r1, r7, #0xc
	ldr r0, _0800721C @ =0x000003FF
	ands r0, r6
	adds r1, r1, r0
	mov r0, sb
	movs r2, #0xa
	movs r3, #9
	bl sub_0801383C
_08007210:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0800721C: .4byte 0x000003FF

	thumb_func_start sub_08007220
sub_08007220: @ 0x08007220
	movs r2, #0
	str r2, [r0, #0x2c]
	movs r1, #0x78
	str r1, [r0, #0x38]
	strh r2, [r0, #0x32]
	bx lr

	thumb_func_start sub_0800722C
sub_0800722C: @ 0x0800722C
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x38]
	subs r0, #1
	str r0, [r4, #0x38]
	cmp r0, #0
	bge _0800724C
	adds r0, r4, #0
	bl sub_0800790C
	str r0, [r4, #0x38]
	movs r0, #0
	strh r0, [r4, #0x34]
	adds r0, r4, #0
	bl Proc_Break
_0800724C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_08007254
sub_08007254: @ 0x08007254
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	adds r0, #0x42
	ldrh r0, [r0]
	lsls r2, r0, #0xc
	adds r1, r4, #0
	adds r1, #0x40
	ldr r0, _0800728C @ =0x000003FF
	ldrh r1, [r1]
	ands r0, r1
	adds r7, r2, r0
	adds r0, r4, #0
	adds r0, #0x44
	ldrh r0, [r0]
	bl GetPortraitData
	adds r5, r0, #0
	movs r6, #0
	movs r1, #0x34
	ldrsh r0, [r4, r1]
	cmp r0, #9
	bhi _080072F8
	lsls r0, r0, #2
	ldr r1, _08007290 @ =_08007294
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0800728C: .4byte 0x000003FF
_08007290: .4byte _08007294
_08007294: @ jump table
	.4byte _080072C0 @ case 0
	.4byte _08007348 @ case 1
	.4byte _08007348 @ case 2
	.4byte _080072BC @ case 3
	.4byte _08007348 @ case 4
	.4byte _08007348 @ case 5
	.4byte _080072C0 @ case 6
	.4byte _08007348 @ case 7
	.4byte _08007348 @ case 8
	.4byte _080072C4 @ case 9
_080072BC:
	movs r6, #0x58
	b _080072F8
_080072C0:
	movs r6, #0x18
	b _080072F8
_080072C4:
	ldr r0, [r4, #0x3c]
	adds r1, r4, #0
	adds r1, #0x42
	ldrh r1, [r1]
	lsls r1, r1, #0xc
	adds r3, r4, #0
	adds r3, #0x40
	ldr r2, _080072F4 @ =0x000003FF
	ldrh r3, [r3]
	ands r2, r3
	adds r1, r1, r2
	adds r2, r5, #0
	bl sub_08007000
	ldr r0, [r4, #0x3c]
	bl sub_08002E30
	bl EnableBgSyncById
	adds r0, r4, #0
	bl Proc_Break
	b _0800734E
	.align 2, 0
_080072F4: .4byte 0x000003FF
_080072F8:
	adds r0, r4, #0
	adds r0, #0x44
	ldrh r0, [r0]
	bl GetPortraitData
	adds r5, r0, #0
	ldrb r3, [r5, #0x17]
	lsls r1, r3, #6
	ldr r0, [r4, #0x3c]
	adds r0, r0, r1
	ldrb r5, [r5, #0x16]
	lsls r1, r5, #1
	adds r0, r0, r1
	mov ip, r0
	subs r0, #2
	adds r2, r7, r6
	strh r2, [r0]
	adds r1, r2, #1
	strh r1, [r0, #2]
	adds r1, r2, #2
	strh r1, [r0, #4]
	adds r1, r2, #3
	strh r1, [r0, #6]
	adds r1, #0x1d
	mov r3, ip
	strh r1, [r3, #0x3e]
	adds r3, #0x40
	adds r1, #1
	strh r1, [r3]
	adds r3, #2
	adds r1, #1
	strh r1, [r3]
	mov r1, ip
	adds r1, #0x44
	adds r2, #0x23
	strh r2, [r1]
	bl sub_08002E30
	bl EnableBgSyncById
_08007348:
	ldrh r0, [r4, #0x34]
	adds r0, #1
	strh r0, [r4, #0x34]
_0800734E:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_08007354
sub_08007354: @ 0x08007354
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	adds r4, r1, #0
	mov r8, r2
	adds r5, r3, #0
	ldr r6, [sp, #0x14]
	ldr r0, _08007384 @ =0x08BFFA20
	bl sub_08004748
	adds r0, r4, #0
	mov r1, r8
	adds r2, r5, #0
	adds r3, r6, #0
	bl sub_08007160
	mov r0, r8
	bl GetPortraitData
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08007384: .4byte 0x08BFFA20

	thumb_func_start sub_08007388
sub_08007388: @ 0x08007388
	push {lr}
	ldr r0, [r0, #0x54]
	bl sub_08006BC0
	pop {r0}
	bx r0

	thumb_func_start sub_08007394
sub_08007394: @ 0x08007394
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _080073A8 @ =0x08BFFA50
	movs r1, #3
	bl Proc_Start
	str r4, [r0, #0x54]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080073A8: .4byte 0x08BFFA50

	thumb_func_start sub_080073AC
sub_080073AC: @ 0x080073AC
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	adds r5, r0, #0
	ldrh r0, [r5, #0x3e]
	bl GetPortraitData
	mov r8, r0
	ldr r6, _080073F0 @ =0x0202A580
	adds r4, r5, #0
	adds r4, #0x40
	ldrb r1, [r4]
	lsls r0, r1, #3
	adds r0, r0, r6
	ldrh r0, [r0, #4]
	adds r0, #0x10
	bl sub_0801417C
	mov r1, r8
	ldr r0, [r1, #8]
	ldrb r4, [r4]
	lsls r1, r4, #3
	adds r1, r1, r6
	ldrh r1, [r1, #4]
	adds r1, #0x10
	movs r2, #0xc
	adds r3, r5, #0
	bl sub_08014020
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080073F0: .4byte 0x0202A580

	thumb_func_start sub_080073F4
sub_080073F4: @ 0x080073F4
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x3e]
	bl GetPortraitData
	ldr r1, _08007424 @ =0x0202A580
	adds r0, r4, #0
	adds r0, #0x40
	ldrb r0, [r0]
	lsls r0, r0, #3
	adds r0, r0, r1
	ldrh r0, [r0, #4]
	adds r0, #0x10
	movs r1, #0xc
	adds r2, r4, #0
	bl sub_08013FE8
	adds r0, r4, #0
	bl sub_08007394
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08007424: .4byte 0x0202A580

	thumb_func_start sub_08007428
sub_08007428: @ 0x08007428
	push {r4, r5, lr}
	sub sp, #0x1c
	mov r2, sp
	ldr r1, _08007450 @ =0x0818F904
	ldm r1!, {r3, r4, r5}
	stm r2!, {r3, r4, r5}
	ldm r1!, {r3, r4, r5}
	stm r2!, {r3, r4, r5}
	ldr r1, [r1]
	str r1, [r2]
	ldr r1, _08007454 @ =0xFFFF8100
	adds r0, r0, r1
	lsls r0, r0, #2
	add r0, sp
	ldr r0, [r0]
	add sp, #0x1c
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_08007450: .4byte 0x0818F904
_08007454: .4byte 0xFFFF8100

	thumb_func_start sub_08007458
sub_08007458: @ 0x08007458
	push {r4, r5, r6, lr}
	sub sp, #0x1c
	mov r3, sp
	ldr r2, _08007488 @ =0x0818F920
	ldm r2!, {r4, r5, r6}
	stm r3!, {r4, r5, r6}
	ldm r2!, {r4, r5, r6}
	stm r3!, {r4, r5, r6}
	ldr r2, [r2]
	str r2, [r3]
	ldr r2, _0800748C @ =0xFFFF8100
	adds r0, r0, r2
	lsls r0, r0, #2
	add r0, sp
	ldr r0, [r0]
	lsls r1, r1, #5
	movs r2, #0x20
	bl ApplyPaletteExt
	add sp, #0x1c
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08007488: .4byte 0x0818F920
_0800748C: .4byte 0xFFFF8100

	thumb_func_start sub_08007490
sub_08007490: @ 0x08007490
	ldr r1, [r0, #0x14]
	str r1, [r0, #0x2c]
	movs r1, #0
	strh r1, [r0, #0x32]
	bx lr
	.align 2, 0

	thumb_func_start sub_0800749C
sub_0800749C: @ 0x0800749C
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r4, r0, #0
	ldr r0, [r4, #0x2c]
	bl sub_08006C2C
	movs r1, #0x30
	ands r1, r0
	cmp r1, #0
	bne _080074F0
	ldr r0, [r4, #0x2c]
	bl sub_08006C2C
	movs r1, #8
	ands r1, r0
	movs r3, #0
	cmp r1, #0
	bne _080074C2
	movs r3, #0x18
_080074C2:
	adds r3, #0x10
	ldr r2, [r4, #0x2c]
	ldr r0, [r2, #0x2c]
	lsls r1, r3, #5
	ldr r0, [r0, #0xc]
	adds r0, r0, r1
	ldrh r1, [r2, #0x3c]
	adds r1, #0x1c
	ldr r2, _080074E8 @ =0x000003FF
	ands r1, r2
	lsls r1, r1, #5
	ldr r2, _080074EC @ =0x06010000
	adds r1, r1, r2
	movs r2, #4
	movs r3, #2
	bl sub_0801372C
	b _08007560
	.align 2, 0
_080074E8: .4byte 0x000003FF
_080074EC: .4byte 0x06010000
_080074F0:
	ldrh r0, [r4, #0x32]
	subs r0, #1
	strh r0, [r4, #0x32]
	lsls r0, r0, #0x10
	cmp r0, #0
	bge _08007560
	ldr r0, [r4, #0x2c]
	bl sub_08006C2C
	movs r1, #8
	ands r1, r0
	movs r5, #0
	cmp r1, #0
	bne _0800750E
	movs r5, #0x18
_0800750E:
	bl RandNextB
	lsrs r0, r0, #0x10
	movs r1, #7
	ands r0, r1
	adds r0, #1
	strh r0, [r4, #0x32]
	ldrh r0, [r4, #0x30]
	adds r0, #1
	movs r1, #3
	ands r0, r1
	strh r0, [r4, #0x30]
	movs r1, #0x30
	ldrsh r0, [r4, r1]
	cmp r0, #1
	beq _0800753A
	cmp r0, #1
	ble _08007540
	cmp r0, #2
	beq _0800753E
	cmp r0, #3
	bne _08007540
_0800753A:
	adds r5, #8
	b _08007540
_0800753E:
	adds r5, #0x10
_08007540:
	ldr r2, [r4, #0x2c]
	ldr r0, [r2, #0x2c]
	lsls r1, r5, #5
	ldr r0, [r0, #0xc]
	adds r0, r0, r1
	ldrh r1, [r2, #0x3c]
	adds r1, #0x1c
	ldr r2, _080075E0 @ =0x000003FF
	ands r1, r2
	lsls r1, r1, #5
	ldr r2, _080075E4 @ =0x06010000
	adds r1, r1, r2
	movs r2, #4
	movs r3, #2
	bl sub_0801372C
_08007560:
	ldr r0, [r4, #0x2c]
	ldr r2, [r0, #0x2c]
	movs r1, #4
	ldrb r2, [r2, #0x14]
	subs r5, r1, r2
	bl sub_08006C2C
	movs r6, #1
	ands r0, r6
	cmp r0, #0
	bne _08007578
	rsbs r5, r5, #0
_08007578:
	lsls r1, r5, #3
	ldr r0, [r4, #0x2c]
	movs r3, #0x34
	ldrsh r2, [r0, r3]
	adds r1, r1, r2
	adds r5, r1, #0
	subs r5, #0x10
	ldr r1, _080075E8 @ =0x000001FF
	ands r5, r1
	bl sub_08006C2C
	ands r0, r6
	cmp r0, #0
	beq _0800759A
	movs r0, #0x80
	lsls r0, r0, #5
	adds r5, r5, r0
_0800759A:
	ldr r0, [r4, #0x2c]
	bl sub_08006C2C
	adds r2, r0, #0
	movs r0, #0x80
	lsls r0, r0, #3
	ands r2, r0
	rsbs r2, r2, #0
	asrs r2, r2, #0x1f
	ands r2, r0
	ldr r4, [r4, #0x2c]
	movs r1, #0x36
	ldrsh r0, [r4, r1]
	ldr r1, [r4, #0x2c]
	ldrb r1, [r1, #0x15]
	lsls r1, r1, #3
	adds r0, r0, r1
	movs r1, #0xff
	ands r0, r1
	adds r2, r2, r0
	adds r0, r4, #0
	adds r0, #0x41
	ldrb r0, [r0]
	ldr r3, _080075EC @ =0x08BFF7A8
	ldrh r1, [r4, #0x3c]
	adds r1, #0x1c
	str r1, [sp]
	adds r1, r5, #0
	bl sub_080068C4
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080075E0: .4byte 0x000003FF
_080075E4: .4byte 0x06010000
_080075E8: .4byte 0x000001FF
_080075EC: .4byte 0x08BFF7A8

	thumb_func_start sub_080075F0
sub_080075F0: @ 0x080075F0
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #4
	adds r7, r0, #0
	adds r5, r1, #0
	movs r0, #0
	mov sb, r0
	cmp r5, #1
	beq _0800761E
	cmp r5, #1
	bgt _08007610
	cmp r5, #0
	beq _0800761A
	b _080076E6
_08007610:
	cmp r5, #0x80
	beq _08007622
	cmp r5, #0x81
	beq _0800762A
	b _080076E6
_0800761A:
	movs r5, #0x58
	b _08007630
_0800761E:
	movs r5, #0x18
	b _08007630
_08007622:
	movs r5, #0x58
	movs r1, #1
	mov sb, r1
	b _08007630
_0800762A:
	movs r5, #0x18
	movs r3, #1
	mov sb, r3
_08007630:
	ldr r0, [r7, #0x2c]
	ldr r2, [r0, #0x2c]
	movs r1, #4
	ldrb r2, [r2, #0x16]
	subs r4, r1, r2
	bl sub_08006C2C
	movs r1, #1
	mov r8, r1
	ands r0, r1
	cmp r0, #0
	bne _0800764A
	rsbs r4, r4, #0
_0800764A:
	lsls r1, r4, #3
	ldr r0, [r7, #0x2c]
	movs r3, #0x34
	ldrsh r2, [r0, r3]
	adds r1, r1, r2
	adds r4, r1, #0
	subs r4, #0x10
	ldr r1, _080076C8 @ =0x000001FF
	ands r4, r1
	bl sub_08006C2C
	mov r1, r8
	ands r0, r1
	cmp r0, #0
	beq _0800766E
	movs r0, #0x80
	lsls r0, r0, #5
	adds r4, r4, r0
_0800766E:
	ldr r0, [r7, #0x2c]
	bl sub_08006C2C
	movs r1, #0x80
	lsls r1, r1, #3
	ands r0, r1
	rsbs r0, r0, #0
	asrs r6, r0, #0x1f
	ands r6, r1
	ldr r2, [r7, #0x2c]
	movs r3, #0x36
	ldrsh r0, [r2, r3]
	ldr r1, [r2, #0x2c]
	ldrb r1, [r1, #0x17]
	lsls r1, r1, #3
	adds r0, r0, r1
	movs r1, #0xff
	ands r0, r1
	adds r6, r6, r0
	mov r0, sb
	cmp r0, #0
	beq _080076D0
	adds r0, r2, #0
	bl sub_08006C2C
	mov r1, r8
	ands r0, r1
	cmp r0, #0
	bne _080076AA
	adds r4, #0x10
_080076AA:
	ldr r1, [r7, #0x2c]
	adds r0, r1, #0
	adds r0, #0x41
	ldrb r0, [r0]
	ldr r3, _080076CC @ =0x08BFF768
	ldrh r1, [r1, #0x3c]
	adds r1, r1, r5
	adds r1, #2
	str r1, [sp]
	adds r1, r4, #0
	adds r2, r6, #0
	bl sub_080068C4
	b _080076E6
	.align 2, 0
_080076C8: .4byte 0x000001FF
_080076CC: .4byte 0x08BFF768
_080076D0:
	adds r0, r2, #0
	adds r0, #0x41
	ldrb r0, [r0]
	ldr r3, _080076F4 @ =0x08BFF7A8
	ldrh r2, [r2, #0x3c]
	adds r1, r2, r5
	str r1, [sp]
	adds r1, r4, #0
	adds r2, r6, #0
	bl sub_080068C4
_080076E6:
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080076F4: .4byte 0x08BFF7A8

	thumb_func_start sub_080076F8
sub_080076F8: @ 0x080076F8
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r0, [r5, #0x14]
	str r0, [r5, #0x2c]
	ldr r0, [r0, #0x2c]
	ldrb r0, [r0, #0x18]
	movs r4, #0
	strh r0, [r5, #0x30]
	adds r0, r5, #0
	bl sub_0800790C
	str r0, [r5, #0x38]
	strh r4, [r5, #0x32]
	movs r0, #0x30
	ldrsh r1, [r5, r0]
	cmp r1, #6
	bne _08007730
	movs r0, #5
	strh r0, [r5, #0x30]
	ldr r0, _08007738 @ =0x7FFFFFFF
	str r0, [r5, #0x38]
	movs r0, #2
	strh r0, [r5, #0x32]
	strh r1, [r5, #0x34]
	adds r0, r5, #0
	movs r1, #0x61
	bl Proc_Goto
_08007730:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08007738: .4byte 0x7FFFFFFF

	thumb_func_start sub_0800773C
sub_0800773C: @ 0x0800773C
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x38]
	subs r0, #1
	str r0, [r4, #0x38]
	movs r1, #0x32
	ldrsh r5, [r4, r1]
	cmp r5, #0
	beq _08007758
	adds r1, r5, #0
	adds r0, r4, #0
	bl Proc_Goto
	b _0800776E
_08007758:
	cmp r0, #0
	bge _0800776E
	adds r0, r4, #0
	bl sub_0800790C
	str r0, [r4, #0x38]
	strh r5, [r4, #0x34]
	adds r0, r4, #0
	movs r1, #1
	bl Proc_Goto
_0800776E:
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start sub_08007774
sub_08007774: @ 0x08007774
	push {r4, r5, lr}
	adds r4, r0, #0
	movs r5, #2
	movs r1, #0x34
	ldrsh r0, [r4, r1]
	cmp r0, #0xa
	bhi _080077CC
	lsls r0, r0, #2
	ldr r1, _0800778C @ =_08007790
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0800778C: .4byte _08007790
_08007790: @ jump table
	.4byte _080077C0 @ case 0
	.4byte _080077C0 @ case 1
	.4byte _080077C0 @ case 2
	.4byte _080077BC @ case 3
	.4byte _080077BC @ case 4
	.4byte _080077BC @ case 5
	.4byte _080077C0 @ case 6
	.4byte _080077C0 @ case 7
	.4byte _080077C0 @ case 8
	.4byte _080077CC @ case 9
	.4byte _080077C4 @ case 10
_080077BC:
	movs r5, #0
	b _080077CC
_080077C0:
	movs r5, #1
	b _080077CC
_080077C4:
	adds r0, r4, #0
	movs r1, #0
	bl Proc_Goto
_080077CC:
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_080075F0
	ldrh r0, [r4, #0x34]
	adds r0, #1
	strh r0, [r4, #0x34]
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start sub_080077E0
sub_080077E0: @ 0x080077E0
	movs r1, #0
	strh r1, [r0, #0x34]
	bx lr
	.align 2, 0

	thumb_func_start sub_080077E8
sub_080077E8: @ 0x080077E8
	push {r4, lr}
	adds r4, r0, #0
	movs r1, #0x34
	ldrsh r0, [r4, r1]
	cmp r0, #5
	bgt _080077FC
	adds r0, r4, #0
	bl sub_08007774
	b _08007814
_080077FC:
	adds r0, r4, #0
	movs r1, #0
	bl sub_080075F0
	movs r1, #0x32
	ldrsh r0, [r4, r1]
	cmp r0, #0
	bne _08007814
	adds r0, r4, #0
	movs r1, #1
	bl Proc_Goto
_08007814:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_0800781C
sub_0800781C: @ 0x0800781C
	movs r1, #0
	strh r1, [r0, #0x34]
	bx lr
	.align 2, 0

	thumb_func_start sub_08007824
sub_08007824: @ 0x08007824
	push {r4, lr}
	adds r4, r0, #0
	movs r1, #0x34
	ldrsh r0, [r4, r1]
	cmp r0, #2
	bgt _08007838
	adds r0, r4, #0
	bl sub_08007774
	b _08007850
_08007838:
	adds r0, r4, #0
	movs r1, #1
	bl sub_080075F0
	movs r1, #0x32
	ldrsh r0, [r4, r1]
	cmp r0, #0
	bne _08007850
	adds r0, r4, #0
	movs r1, #1
	bl Proc_Goto
_08007850:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_08007858
sub_08007858: @ 0x08007858
	movs r1, #0
	strh r1, [r0, #0x34]
	bx lr
	.align 2, 0

	thumb_func_start sub_08007860
sub_08007860: @ 0x08007860
	push {r4, r5, lr}
	adds r4, r0, #0
	movs r5, #2
	movs r1, #0x34
	ldrsh r0, [r4, r1]
	cmp r0, #0xa
	bhi _080078BC
	lsls r0, r0, #2
	ldr r1, _08007878 @ =_0800787C
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08007878: .4byte _0800787C
_0800787C: @ jump table
	.4byte _080078AC @ case 0
	.4byte _080078AC @ case 1
	.4byte _080078AC @ case 2
	.4byte _080078A8 @ case 3
	.4byte _080078A8 @ case 4
	.4byte _080078A8 @ case 5
	.4byte _080078AC @ case 6
	.4byte _080078AC @ case 7
	.4byte _080078AC @ case 8
	.4byte _080078BC @ case 9
	.4byte _080078B0 @ case 10
_080078A8:
	movs r5, #0
	b _080078BC
_080078AC:
	movs r5, #1
	b _080078BC
_080078B0:
	adds r0, r4, #0
	movs r1, #0
	bl Proc_Goto
	movs r0, #0
	strh r0, [r4, #0x32]
_080078BC:
	adds r1, r5, #0
	adds r1, #0x80
	adds r0, r4, #0
	bl sub_080075F0
	ldrh r0, [r4, #0x34]
	adds r0, #1
	strh r0, [r4, #0x34]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_080078D4
sub_080078D4: @ 0x080078D4
	push {r4, lr}
	adds r2, r0, #0
	cmp r1, #0
	bne _080078E0
	ldr r0, [r2, #0x2c]
	ldrb r1, [r0, #0x18]
_080078E0:
	ldr r4, [r2, #0x48]
	strh r1, [r4, #0x30]
	adds r0, r4, #0
	bl sub_0800790C
	str r0, [r4, #0x38]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_080078F4
sub_080078F4: @ 0x080078F4
	push {lr}
	ldr r2, _08007908 @ =0x030040E0
	lsls r0, r0, #2
	adds r0, r0, r2
	ldr r0, [r0]
	bl sub_080078D4
	pop {r0}
	bx r0
	.align 2, 0
_08007908: .4byte 0x030040E0

	thumb_func_start sub_0800790C
sub_0800790C: @ 0x0800790C
	push {r4, lr}
	adds r4, r0, #0
	bl RandNextB
	lsrs r2, r0, #0x10
	ldrh r0, [r4, #0x30]
	subs r0, #1
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #4
	bhi _08007960
	lsls r0, r0, #2
	ldr r1, _0800792C @ =_08007930
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0800792C: .4byte _08007930
_08007930: @ jump table
	.4byte _0800794E @ case 0
	.4byte _08007954 @ case 1
	.4byte _08007944 @ case 2
	.4byte _0800795A @ case 3
	.4byte _0800795E @ case 4
_08007944:
	asrs r0, r2, #7
	movs r1, #0x96
	lsls r1, r1, #1
	adds r0, r0, r1
	b _08007960
_0800794E:
	asrs r0, r2, #7
	adds r0, #0x1e
	b _08007960
_08007954:
	asrs r0, r2, #9
	adds r0, #0x1e
	b _08007960
_0800795A:
	movs r0, #1
	b _08007960
_0800795E:
	ldr r0, _08007968 @ =0x7FFFFFFF
_08007960:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08007968: .4byte 0x7FFFFFFF

	thumb_func_start sub_0800796C
sub_0800796C: @ 0x0800796C
	ldr r0, [r0, #0x48]
	strh r1, [r0, #0x32]
	bx lr
	.align 2, 0

	thumb_func_start sub_08007974
sub_08007974: @ 0x08007974
	push {lr}
	ldr r2, _08007988 @ =0x030040E0
	lsls r0, r0, #2
	adds r0, r0, r2
	ldr r0, [r0]
	bl sub_0800796C
	pop {r0}
	bx r0
	.align 2, 0
_08007988: .4byte 0x030040E0

	thumb_func_start sub_0800798C
sub_0800798C: @ 0x0800798C
	push {r4, r5, lr}
	ldr r2, _080079AC @ =0x030040E0
	ldr r0, [r2]
	ldr r4, [r0, #0x48]
	ldr r1, _080079B0 @ =gpKeySt
	ldr r0, [r1]
	movs r3, #1
	ldrh r0, [r0, #4]
	ands r3, r0
	adds r5, r1, #0
	cmp r3, #0
	beq _080079B4
	movs r0, #2
	strh r0, [r4, #0x32]
	b _080079B6
	.align 2, 0
_080079AC: .4byte 0x030040E0
_080079B0: .4byte gpKeySt
_080079B4:
	strh r3, [r4, #0x32]
_080079B6:
	ldr r0, [r2, #8]
	ldr r4, [r0, #0x48]
	ldr r1, [r5]
	movs r0, #2
	ldrh r1, [r1, #4]
	ands r0, r1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0
	beq _080079CC
	movs r0, #3
_080079CC:
	strh r0, [r4, #0x32]
	ldr r0, [r2, #4]
	ldr r4, [r0, #0x48]
	ldr r1, [r5]
	movs r0, #0x80
	lsls r0, r0, #2
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _080079E4
	movs r0, #4
	strh r0, [r4, #0x32]
_080079E4:
	ldr r0, [r2, #0xc]
	ldr r4, [r0, #0x48]
	ldr r1, [r5]
	movs r0, #0x80
	lsls r0, r0, #1
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _080079FA
	movs r0, #4
	strh r0, [r4, #0x32]
_080079FA:
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start sub_08007A00
sub_08007A00: @ 0x08007A00
	push {lr}
	movs r0, #0x16
	movs r1, #0x30
	movs r2, #0
	movs r3, #0x13
	bl sub_08006A98
	movs r1, #3
	bl sub_080078D4
	movs r0, #0x16
	movs r1, #0x30
	movs r2, #0x50
	movs r3, #0x1b
	bl sub_08006A98
	movs r1, #1
	bl sub_080078D4
	movs r0, #0x16
	movs r1, #0xc0
	movs r2, #0
	movs r3, #0x12
	bl sub_08006A98
	movs r1, #2
	bl sub_080078D4
	movs r0, #0x16
	movs r1, #0xc0
	movs r2, #0x50
	movs r3, #0x1a
	bl sub_08006A98
	movs r1, #4
	bl sub_080078D4
	ldr r0, _08007A58 @ =0x08BFFB20
	movs r1, #3
	bl Proc_Start
	pop {r0}
	bx r0
	.align 2, 0
_08007A58: .4byte 0x08BFFB20

	thumb_func_start sub_08007A5C
sub_08007A5C: @ 0x08007A5C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	adds r7, r0, #0
	mov sb, r1
	mov sl, r2
	str r3, [sp, #4]
	ldr r1, _08007A80 @ =0x030040E0
	lsls r0, r7, #2
	adds r4, r0, r1
	ldr r6, [r4]
	cmp r6, #0
	beq _08007A84
	movs r0, #0
	b _08007B6A
	.align 2, 0
_08007A80: .4byte 0x030040E0
_08007A84:
	ldr r0, _08007AC4 @ =0x08BFF9A8
	movs r1, #5
	bl Proc_Start
	adds r5, r0, #0
	str r5, [r4]
	mov r0, sb
	bl GetPortraitData
	mov r8, r0
	movs r0, #0x80
	lsls r0, r0, #6
	ldr r1, [sp, #0x28]
	ands r0, r1
	cmp r0, #0
	beq _08007AD4
	str r6, [sp]
	ldr r0, _08007AC8 @ =0x0202A580
	lsls r4, r7, #3
	adds r0, r4, r0
	ldrh r0, [r0, #4]
	lsls r1, r0, #5
	ldr r0, _08007ACC @ =0x02022A60
	adds r1, r1, r0
	ldr r2, _08007AD0 @ =0x01000008
	mov r0, sp
	bl CpuFastSet
	bl EnablePalSync
	b _08007AEA
	.align 2, 0
_08007AC4: .4byte 0x08BFF9A8
_08007AC8: .4byte 0x0202A580
_08007ACC: .4byte 0x02022A60
_08007AD0: .4byte 0x01000008
_08007AD4:
	mov r2, r8
	ldr r0, [r2, #8]
	ldr r1, _08007B30 @ =0x0202A580
	lsls r4, r7, #3
	adds r1, r4, r1
	ldrh r1, [r1, #4]
	adds r1, #0x10
	lsls r1, r1, #5
	movs r2, #0x20
	bl ApplyPaletteExt
_08007AEA:
	mov r0, r8
	str r0, [r5, #0x2c]
	adds r0, r5, #0
	adds r0, #0x40
	movs r1, #0
	strb r7, [r0]
	mov r2, sb
	strh r2, [r5, #0x3e]
	adds r2, r5, #0
	adds r2, #0x41
	movs r0, #5
	strb r0, [r2]
	mov r0, sl
	strh r0, [r5, #0x34]
	mov r2, sp
	ldrh r2, [r2, #4]
	strh r2, [r5, #0x36]
	str r1, [r5, #0x44]
	str r1, [r5, #0x48]
	ldr r0, [sp, #0x28]
	str r0, [r5, #0x30]
	adds r0, r5, #0
	bl sub_08006C48
	movs r1, #0xf0
	lsls r1, r1, #2
	ldr r2, [sp, #0x28]
	ands r1, r2
	cmp r1, #0x80
	beq _08007B42
	cmp r1, #0x80
	bgt _08007B34
	cmp r1, #0x40
	beq _08007B3E
	b _08007B4E
	.align 2, 0
_08007B30: .4byte 0x0202A580
_08007B34:
	movs r0, #0x80
	lsls r0, r0, #2
	cmp r1, r0
	beq _08007B48
	b _08007B4E
_08007B3E:
	movs r3, #0
	b _08007B52
_08007B42:
	movs r3, #0x80
	lsls r3, r3, #3
	b _08007B52
_08007B48:
	movs r3, #0xc0
	lsls r3, r3, #4
	b _08007B52
_08007B4E:
	movs r3, #0x80
	lsls r3, r3, #4
_08007B52:
	ldr r2, _08007B7C @ =0x0202A580
	adds r2, r4, r2
	ldr r1, [r2]
	lsrs r1, r1, #5
	movs r0, #0xf
	ldrh r2, [r2, #4]
	ands r0, r2
	lsls r0, r0, #0xc
	adds r1, r1, r0
	adds r1, r1, r3
	strh r1, [r5, #0x3c]
	adds r0, r5, #0
_08007B6A:
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_08007B7C: .4byte 0x0202A580

	thumb_func_start sub_08007B80
sub_08007B80: @ 0x08007B80
	ldr r3, _08007B90 @ =0x030040E0
	lsls r0, r0, #2
	adds r0, r0, r3
	ldr r3, [r0]
	strh r1, [r3, #0x34]
	ldr r0, [r0]
	strh r2, [r0, #0x36]
	bx lr
	.align 2, 0
_08007B90: .4byte 0x030040E0

	thumb_func_start sub_08007B94
sub_08007B94: @ 0x08007B94
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x2c]
	ldr r0, [r0, #0x48]
	cmp r0, #0
	beq _08007BA4
	bl sub_08091618
_08007BA4:
	ldr r0, [r4, #0x2c]
	ldr r0, [r0, #0x44]
	cmp r0, #0
	beq _08007BB0
	bl sub_08091618
_08007BB0:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_08007BB8
sub_08007BB8: @ 0x08007BB8
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x34]
	bl GetPortraitData
	str r0, [r4, #0x30]
	ldr r0, [r0]
	ldr r5, _08007C08 @ =0x0202A580
	ldr r1, [r4, #0x2c]
	adds r1, #0x40
	ldrb r1, [r1]
	lsls r1, r1, #3
	adds r1, r1, r5
	ldr r1, [r1]
	ldr r2, _08007C0C @ =0x06010000
	adds r1, r1, r2
	bl sub_08013688
	ldr r0, [r4, #0x30]
	ldr r0, [r0, #8]
	ldr r1, [r4, #0x2c]
	adds r1, #0x40
	ldrb r1, [r1]
	lsls r1, r1, #3
	adds r1, r1, r5
	ldrh r1, [r1, #4]
	adds r1, #0x10
	lsls r1, r1, #5
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r1, [r4, #0x2c]
	ldr r0, [r4, #0x30]
	str r0, [r1, #0x2c]
	ldr r0, [r4, #0x34]
	strh r0, [r1, #0x3e]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08007C08: .4byte 0x0202A580
_08007C0C: .4byte 0x06010000

	thumb_func_start sub_08007C10
sub_08007C10: @ 0x08007C10
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x2c]
	ldr r1, [r0, #0x48]
	cmp r1, #0
	beq _08007C34
	ldr r0, [r4, #0x30]
	ldrb r0, [r0, #0x18]
	strh r0, [r1, #0x30]
	ldr r0, [r4, #0x2c]
	ldr r0, [r0, #0x48]
	movs r1, #0
	bl Proc_Goto
	ldr r0, [r4, #0x2c]
	ldr r0, [r0, #0x48]
	bl sub_08091628
_08007C34:
	ldr r0, [r4, #0x2c]
	ldr r0, [r0, #0x44]
	cmp r0, #0
	beq _08007C40
	bl sub_08091628
_08007C40:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_08007C48
sub_08007C48: @ 0x08007C48
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r0, _08007C60 @ =0x08BFFB30
	adds r1, r4, #0
	bl Proc_Start
	str r4, [r0, #0x2c]
	str r5, [r0, #0x34]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08007C60: .4byte 0x08BFFB30

	thumb_func_start sub_08007C64
sub_08007C64: @ 0x08007C64
	push {r4, lr}
	movs r2, #0
	ldr r4, _08007C84 @ =0x08BFFB68
	movs r3, #0
_08007C6C:
	ldr r0, [r4]
	lsls r1, r2, #2
	adds r0, #0x18
	adds r0, r0, r1
	str r3, [r0]
	adds r2, #1
	cmp r2, #7
	ble _08007C6C
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08007C84: .4byte 0x08BFFB68
