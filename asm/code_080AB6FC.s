	.include "macro.inc"
	.syntax unified


	thumb_func_start sub_80AB970
sub_80AB970: @ 0x080AB970
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #0x48
	adds r7, r0, #0
	adds r5, r1, #0
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	mov r8, r2
	mov r1, sp
	ldr r0, _080AB9D4 @ =gUnk_0843943C
	ldm r0!, {r2, r3, r4}
	stm r1!, {r2, r3, r4}
	ldm r0!, {r2, r3, r4}
	stm r1!, {r2, r3, r4}
	ldm r0!, {r2, r3, r4}
	stm r1!, {r2, r3, r4}
	ldr r0, [r0]
	str r0, [r1]
	adds r0, r7, #0
	bl GetROMChapterStruct
	adds r1, r0, #0
	movs r2, #0
	ldr r0, _080AB9D8 @ =gPlaySt
	ldrb r0, [r0, #0x1b]
	cmp r0, #3
	bne _080AB9AA
	movs r2, #1
_080AB9AA:
	adds r0, r1, #0
	adds r0, #0x80
	adds r0, r0, r2
	ldrb r0, [r0]
	lsrs r4, r0, #1
	cmp r7, #0x2f
	bgt _080AB9E4
	cmp r7, #0x2e
	blt _080AB9E4
	ldr r0, _080AB9DC @ =0x0000117D
	add r4, sp, #0x28
	adds r1, r4, #0
	bl DecodeMsgInBuffer
	adds r1, r5, #0
	bl AppendString
	adds r5, r0, #0
	ldr r0, _080AB9E0 @ =0x00001182
	adds r1, r4, #0
	b _080ABA80
	.align 2, 0
_080AB9D4: .4byte gUnk_0843943C
_080AB9D8: .4byte gPlaySt
_080AB9DC: .4byte 0x0000117D
_080AB9E0: .4byte 0x00001182
_080AB9E4:
	add r6, sp, #0x28
	mov r0, r8
	cmp r0, #0
	beq _080AB9FC
	ldr r0, _080ABA98 @ =0x0000117A
	adds r1, r6, #0
	bl DecodeMsgInBuffer
	adds r1, r5, #0
	bl AppendString
	adds r5, r0, #0
_080AB9FC:
	cmp r4, #9
	ble _080ABA1C
	adds r0, r4, #0
	movs r1, #0xa
	bl __divsi3
	lsls r0, r0, #2
	add r0, sp
	ldr r0, [r0]
	adds r1, r6, #0
	bl DecodeMsgInBuffer
	adds r1, r5, #0
	bl AppendString
	adds r5, r0, #0
_080ABA1C:
	adds r0, r4, #0
	movs r1, #0xa
	bl __modsi3
	lsls r0, r0, #2
	add r0, sp
	ldr r0, [r0]
	adds r4, r6, #0
	adds r1, r4, #0
	bl DecodeMsgInBuffer
	adds r1, r5, #0
	bl AppendString
	adds r5, r0, #0
	ldr r0, _080ABA9C @ =0x0000117B
	adds r1, r4, #0
	bl DecodeMsgInBuffer
	adds r1, r5, #0
	bl AppendString
	adds r5, r0, #0
	adds r0, r7, #0
	bl GetROMChapterStruct
	adds r1, r0, #0
	movs r2, #0
	ldr r0, _080ABAA0 @ =gPlaySt
	ldrb r0, [r0, #0x1b]
	cmp r0, #3
	bne _080ABA5E
	movs r2, #1
_080ABA5E:
	adds r1, #0x80
	adds r1, r1, r2
	movs r0, #1
	ldrb r1, [r1]
	ands r0, r1
	cmp r0, #0
	beq _080ABA7C
	ldr r0, _080ABAA4 @ =0x0000117C
	adds r1, r4, #0
	bl DecodeMsgInBuffer
	adds r1, r5, #0
	bl AppendString
	adds r5, r0, #0
_080ABA7C:
	ldr r0, _080ABAA8 @ =0x00001182
	adds r1, r6, #0
_080ABA80:
	bl DecodeMsgInBuffer
	adds r1, r5, #0
	bl AppendString
	adds r5, r0, #0
	add sp, #0x48
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_080ABA98: .4byte 0x0000117A
_080ABA9C: .4byte 0x0000117B
_080ABAA0: .4byte gPlaySt
_080ABAA4: .4byte 0x0000117C
_080ABAA8: .4byte 0x00001182

	thumb_func_start sub_80ABAAC
sub_80ABAAC: @ 0x080ABAAC
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r5, r0, #0
	adds r6, r1, #0
	ldr r0, [r5]
	mov r1, sp
	bl GetCharTextLen
	adds r4, r0, #0
	ldr r1, [r5]
	subs r4, r4, r1
	ldr r0, [r6]
	adds r2, r4, #0
	bl memcpy
	ldr r0, [r5]
	adds r0, r0, r4
	str r0, [r5]
	ldr r0, [r6]
	adds r0, r0, r4
	str r0, [r6]
	adds r0, r4, #0
	add sp, #4
	pop {r4, r5, r6}
	pop {r1}
	bx r1

	thumb_func_start sub_80ABAE0
sub_80ABAE0: @ 0x080ABAE0
	push {lr}
	movs r0, #0
	bl SetOnHBlankA
	pop {r0}
	bx r0

	thumb_func_start sub_80ABAEC
sub_80ABAEC: @ 0x080ABAEC
	push {lr}
	sub sp, #4
	adds r3, r0, #0
	movs r1, #0x80
	lsls r1, r1, #1
	movs r0, #0
	str r0, [sp]
	movs r2, #0
	bl sub_8003FD4
	add sp, #4
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_80ABB08
sub_80ABB08: @ 0x080ABB08
	push {lr}
	sub sp, #4
	movs r2, #0x80
	lsls r2, r2, #1
	movs r1, #0
	str r1, [sp]
	adds r1, r2, #0
	movs r3, #0x20
	bl sub_8003FD4
	add sp, #4
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_80ABB24
sub_80ABB24: @ 0x080ABB24
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _080ABB4C @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080ABB3C
	movs r0, #0xe4
	lsls r0, r0, #2
	bl m4aSongNumStart
_080ABB3C:
	ldr r0, [r4, #0x2c]
	ldr r1, [r4, #0x30]
	ldr r2, [r4, #0x58]
	bl sub_80826A0
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080ABB4C: .4byte gPlaySt

	thumb_func_start sub_80ABB50
sub_80ABB50: @ 0x080ABB50
	push {lr}
	adds r2, r0, #0
	ldr r0, _080ABB84 @ =gpKeySt
	ldr r1, [r0]
	ldr r0, _080ABB88 @ =0x0000030B
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _080ABB7E
	adds r0, r2, #0
	bl Proc_Break
	ldr r0, _080ABB8C @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080ABB7A
	ldr r0, _080ABB90 @ =0x00000391
	bl m4aSongNumStart
_080ABB7A:
	bl CloseHelpBox
_080ABB7E:
	pop {r0}
	bx r0
	.align 2, 0
_080ABB84: .4byte gpKeySt
_080ABB88: .4byte 0x0000030B
_080ABB8C: .4byte gPlaySt
_080ABB90: .4byte 0x00000391

	thumb_func_start sub_80ABB94
sub_80ABB94: @ 0x080ABB94
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r6, r2, #0
	adds r1, r3, #0
	ldr r0, _080ABBB0 @ =gUnk_08DAE4E4
	bl Proc_StartBlocking
	str r4, [r0, #0x2c]
	str r5, [r0, #0x30]
	str r6, [r0, #0x58]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080ABBB0: .4byte gUnk_08DAE4E4

	thumb_func_start sub_80ABBB4
sub_80ABBB4: @ 0x080ABBB4
	push {r4, r5, r6, r7, lr}
	adds r6, r0, #0
	adds r5, r1, #0
	ldr r4, [sp, #0x14]
	ldr r0, [sp, #0x18]
	subs r7, r2, r6
	subs r2, r0, r5
	adds r1, r7, #0
	muls r1, r2, r1
	subs r3, r3, r5
	subs r4, r4, r6
	adds r0, r3, #0
	muls r0, r4, r0
	subs r1, r1, r0
	cmp r1, #0
	blt _080ABBFC
	ldr r0, [sp, #0x20]
	subs r5, r0, r5
	adds r1, r4, #0
	muls r1, r5, r1
	ldr r0, [sp, #0x1c]
	subs r4, r0, r6
	adds r0, r2, #0
	muls r0, r4, r0
	subs r1, r1, r0
	cmp r1, #0
	blt _080ABBFC
	adds r0, r4, #0
	muls r0, r3, r0
	adds r1, r5, #0
	muls r1, r7, r1
	subs r0, r0, r1
	cmp r0, #0
	blt _080ABBFC
	movs r0, #1
	b _080ABBFE
_080ABBFC:
	movs r0, #0
_080ABBFE:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	thumb_func_start sub_80ABC04
sub_80ABC04: @ 0x080ABC04
	push {lr}
	sub sp, #0x64
	mov r0, sp
	bl ReadGlobalSaveInfo
	mov r1, sp
	movs r0, #0x48
	ldrb r1, [r1, #0xe]
	ands r0, r1
	cmp r0, #0
	bne _080ABC1E
	movs r0, #0
	b _080ABC20
_080ABC1E:
	movs r0, #1
_080ABC20:
	add sp, #0x64
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_80ABC28
sub_80ABC28: @ 0x080ABC28
	push {lr}
	sub sp, #0x64
	mov r0, sp
	bl ReadGlobalSaveInfo
	mov r1, sp
	movs r0, #0x90
	ldrb r1, [r1, #0xe]
	ands r0, r1
	cmp r0, #0
	bne _080ABC42
	movs r0, #0
	b _080ABC44
_080ABC42:
	movs r0, #1
_080ABC44:
	add sp, #0x64
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_80ABC4C
sub_80ABC4C: @ 0x080ABC4C
	adds r0, #0x34
	ldrb r0, [r0]
	cmp r0, #0x64
	beq _080ABC58
	movs r0, #0
	b _080ABC5A
_080ABC58:
	movs r0, #1
_080ABC5A:
	bx lr

	thumb_func_start sub_80ABC5C
sub_80ABC5C: @ 0x080ABC5C
	movs r0, #0
	bx lr

	thumb_func_start sub_80ABC60
sub_80ABC60: @ 0x080ABC60
	movs r2, #0
	ldr r1, _080ABC70 @ =gUnk_08DAE514
_080ABC64:
	ldr r0, [r1]
	cmp r0, #0
	blt _080ABC74
	adds r1, #0x10
	adds r2, #1
	b _080ABC64
	.align 2, 0
_080ABC70: .4byte gUnk_08DAE514
_080ABC74:
	adds r0, r2, #0
	bx lr

	thumb_func_start sub_80ABC78
sub_80ABC78: @ 0x080ABC78
	push {r4, r5, lr}
	movs r3, #0
	movs r4, #0
	ldr r0, _080ABC94 @ =gUnk_08DAE514
	adds r5, r0, #0
	adds r5, #8
	adds r2, r0, #0
_080ABC86:
	lsls r1, r3, #4
	ldr r0, [r2]
	cmp r0, #0
	bge _080ABC98
	adds r0, r4, #0
	b _080ABCA8
	.align 2, 0
_080ABC94: .4byte gUnk_08DAE514
_080ABC98:
	adds r0, r1, r5
	ldr r0, [r0]
	cmp r0, #0
	beq _080ABCA2
	adds r4, #1
_080ABCA2:
	adds r2, #0x10
	adds r3, #1
	b _080ABC86
_080ABCA8:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_80ABCB0
sub_80ABCB0: @ 0x080ABCB0
	asrs r3, r1, #5
	lsls r3, r3, #2
	adds r3, r3, r0
	movs r2, #0x1f
	ands r2, r1
	ldr r0, [r3, #0x40]
	lsrs r0, r2
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	bne _080ABCCA
	movs r0, #0
	b _080ABCCC
_080ABCCA:
	movs r0, #1
_080ABCCC:
	bx lr
	.align 2, 0

	thumb_func_start sub_80ABCD0
sub_80ABCD0: @ 0x080ABCD0
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	movs r2, #0
	movs r4, #0
	ldr r3, _080ABCEC @ =gUnk_08DAE514
	adds r5, r3, #0
_080ABCDC:
	lsls r1, r2, #4
	adds r0, r1, r5
	ldr r0, [r0]
	cmp r0, #0
	bge _080ABCF0
	adds r0, r4, #0
	b _080ABD1E
	.align 2, 0
_080ABCEC: .4byte gUnk_08DAE514
_080ABCF0:
	adds r0, r3, #0
	adds r0, #8
	adds r0, r1, r0
	ldr r0, [r0]
	cmp r0, #0
	beq _080ABD16
	asrs r1, r2, #5
	lsls r1, r1, #2
	adds r1, r1, r6
	movs r0, #0x1f
	ands r0, r2
	ldr r1, [r1, #0x40]
	lsrs r1, r0
	movs r0, #1
	ands r1, r0
	adds r0, r2, #1
	cmp r1, #0
	beq _080ABD1A
	b _080ABD18
_080ABD16:
	adds r0, r2, #1
_080ABD18:
	adds r4, r0, #0
_080ABD1A:
	adds r2, r0, #0
	b _080ABCDC
_080ABD1E:
	pop {r4, r5, r6}
	pop {r1}
	bx r1

	thumb_func_start sub_80ABD24
sub_80ABD24: @ 0x080ABD24
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x2c
	adds r7, r0, #0
	bl sub_80ABC60
	movs r1, #0x36
	adds r1, r1, r7
	mov r8, r1
	movs r1, #0
	mov r2, r8
	strb r0, [r2]
	add r0, sp, #0x24
	movs r4, #0
	strh r1, [r0]
	adds r1, r7, #0
	adds r1, #0x40
	ldr r2, _080ABE78 @ =0x01000008
	bl CpuSet
	adds r5, r7, #0
	adds r5, #0x33
	strb r4, [r5]
	mov r0, sp
	bl sub_80A00C8
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080ABE5A
	movs r6, #0
	ldr r1, _080ABE7C @ =gUnk_08DAE514
	ldr r0, [r1]
	mov sb, r8
	mov r8, r5
	movs r3, #0x34
	adds r3, r3, r7
	mov sl, r3
	cmp r0, #0
	blt _080ABDCC
	movs r4, #0
	movs r0, #8
	adds r0, r0, r1
	mov ip, r0
_080ABD80:
	mov r2, ip
	ldr r0, [r2]
	cmp r0, #0
	bne _080ABDBA
	adds r0, r4, r1
	ldr r1, [r0]
	asrs r0, r1, #5
	lsls r0, r0, #2
	add r0, sp
	movs r3, #0x1f
	ands r1, r3
	ldr r0, [r0]
	lsrs r0, r1
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _080ABDBA
	asrs r2, r6, #5
	lsls r2, r2, #2
	adds r2, r2, r7
	adds r0, r6, #0
	ands r0, r3
	lsls r1, r0
	ldr r0, [r2, #0x40]
	orrs r0, r1
	str r0, [r2, #0x40]
	ldrb r0, [r5]
	adds r0, #1
	strb r0, [r5]
_080ABDBA:
	adds r4, #0x10
	movs r3, #0x10
	add ip, r3
	adds r6, #1
	ldr r1, _080ABE7C @ =gUnk_08DAE514
	adds r0, r4, r1
	ldr r0, [r0]
	cmp r0, #0
	bge _080ABD80
_080ABDCC:
	bl sub_80ABC78
	adds r1, r0, #0
	movs r0, #0x64
	mov r2, r8
	ldrb r2, [r2]
	muls r0, r2, r0
	mov r3, sb
	ldrb r3, [r3]
	subs r1, r3, r1
	bl __divsi3
	mov r1, sl
	strb r0, [r1]
	movs r6, #0
	ldr r1, _080ABE7C @ =gUnk_08DAE514
	ldr r0, [r1]
	cmp r0, #0
	blt _080ABE5A
	movs r5, #0
_080ABDF4:
	adds r0, r1, #0
	adds r0, #8
	adds r0, r5, r0
	ldr r2, [r0]
	cmp r2, #0
	beq _080ABE4C
	adds r0, r5, r1
	ldr r1, [r0]
	asrs r0, r1, #5
	lsls r0, r0, #2
	add r0, sp
	movs r3, #0x1f
	ands r1, r3
	ldr r0, [r0]
	lsrs r0, r1
	movs r4, #1
	ands r0, r4
	cmp r0, #0
	bne _080ABE2A
	adds r0, r7, #0
	str r3, [sp, #0x28]
	bl _call_via_r2
	lsls r0, r0, #0x18
	ldr r3, [sp, #0x28]
	cmp r0, #0
	beq _080ABE4C
_080ABE2A:
	asrs r2, r6, #5
	lsls r2, r2, #2
	adds r2, r2, r7
	adds r0, r6, #0
	ands r0, r3
	adds r1, r4, #0
	lsls r1, r0
	ldr r0, [r2, #0x40]
	orrs r0, r1
	str r0, [r2, #0x40]
	mov r2, r8
	ldrb r0, [r2]
	adds r0, #1
	strb r0, [r2]
	adds r0, r7, #0
	adds r0, #0x2e
	strb r4, [r0]
_080ABE4C:
	adds r5, #0x10
	adds r6, #1
	ldr r1, _080ABE7C @ =gUnk_08DAE514
	adds r0, r5, r1
	ldr r0, [r0]
	cmp r0, #0
	bge _080ABDF4
_080ABE5A:
	adds r0, r7, #0
	bl sub_80ABCD0
	adds r1, r7, #0
	adds r1, #0x36
	strb r0, [r1]
	add sp, #0x2c
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080ABE78: .4byte 0x01000008
_080ABE7C: .4byte gUnk_08DAE514

	thumb_func_start nullsub_86
nullsub_86: @ 0x080ABE80
	bx lr
	.align 2, 0

	thumb_func_start sub_80ABE84
sub_80ABE84: @ 0x080ABE84
	push {r4, lr}
	sub sp, #4
	ldr r4, [r0, #0x14]
	movs r1, #0x80
	lsls r1, r1, #1
	str r0, [sp]
	movs r0, #0
	movs r2, #0
	movs r3, #0x78
	bl sub_8003FD4
	adds r4, #0x3f
	movs r0, #1
	strb r0, [r4]
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_80ABEA8
sub_80ABEA8: @ 0x080ABEA8
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r4, [r5, #0x14]
	adds r1, r4, #0
	adds r1, #0x31
	ldr r0, _080ABEEC @ =gUnk_08DAEC78
	ldr r0, [r0]
	ldrb r1, [r1]
	adds r0, r1, r0
	movs r1, #0
	ldrsb r1, [r0, r1]
	adds r0, r4, #0
	movs r2, #0
	bl sub_80AC998
	adds r0, r4, #0
	adds r0, #0x32
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl sub_80AD260
	ldr r0, [r5, #0x14]
	bl sub_80AC3D0
	ldr r1, [r5, #0x14]
	bl sub_80AD754
	adds r4, #0x3f
	movs r0, #0
	strb r0, [r4]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080ABEEC: .4byte gUnk_08DAEC78

	thumb_func_start sub_80ABEF0
sub_80ABEF0: @ 0x080ABEF0
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _080ABF28 @ =gUnk_08DAEC7C
	adds r1, r4, #0
	bl Proc_Start
	adds r4, #0x31
	ldrb r0, [r4]
	adds r0, #1
	strb r0, [r4]
	ldrb r2, [r4]
	ldr r0, _080ABF2C @ =gUnk_08DAEC78
	ldr r0, [r0]
	adds r0, r0, r2
	movs r1, #0
	ldrsb r1, [r0, r1]
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	beq _080ABF1C
	cmp r2, #0x80
	bne _080ABF20
_080ABF1C:
	movs r0, #0
	strb r0, [r4]
_080ABF20:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080ABF28: .4byte gUnk_08DAEC7C
_080ABF2C: .4byte gUnk_08DAEC78

	thumb_func_start sub_80ABF30
sub_80ABF30: @ 0x080ABF30
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	mov sb, r0
	movs r6, #0
	ldr r2, _080AC078 @ =gUnk_08DAEC78
	movs r0, #1
	rsbs r0, r0, #0
	adds r1, r0, #0
_080ABF48:
	ldr r0, [r2]
	adds r0, r0, r6
	strb r1, [r0]
	adds r6, #1
	cmp r6, #0x7f
	ble _080ABF48
	bl GetGameTime
	adds r3, r0, #0
	movs r0, #0x7f
	ands r3, r0
	adds r2, r3, #0
	movs r6, #0
	mov r7, sb
	adds r7, #0x31
	mov r1, sb
	adds r1, #0x35
	str r1, [sp, #4]
	mov r5, sb
	adds r5, #0x30
	str r5, [sp]
_080ABF72:
	asrs r0, r2, #5
	lsls r0, r0, #2
	add r0, sb
	movs r1, #0x1f
	ands r1, r2
	ldr r0, [r0, #0x40]
	lsrs r0, r1
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _080ABF92
	ldr r0, _080AC078 @ =gUnk_08DAEC78
	ldr r0, [r0]
	adds r0, r0, r6
	strb r2, [r0]
	adds r6, #1
_080ABF92:
	adds r1, r2, #1
	adds r0, r1, #0
	cmp r1, #0
	bge _080ABF9E
	adds r0, r2, #0
	adds r0, #0x80
_080ABF9E:
	asrs r2, r0, #7
	lsls r0, r2, #7
	subs r2, r1, r0
	cmp r2, r3
	bne _080ABF72
	mov r8, r6
	bl GetGameTime
	adds r4, r0, #0
	adds r4, #0x7b
	ldr r0, _080AC078 @ =gUnk_08DAEC78
	mov sl, r0
	movs r6, #0xff
_080ABFB8:
	movs r1, #0xd
	adds r2, r4, #0
	muls r2, r1, r2
	adds r1, r2, #1
	adds r0, r1, #0
	cmp r1, #0
	bge _080ABFCC
	movs r3, #0x80
	lsls r3, r3, #8
	adds r0, r2, r3
_080ABFCC:
	asrs r4, r0, #0xf
	lsls r0, r4, #0xf
	subs r4, r1, r0
	asrs r0, r4, #8
	mov r1, r8
	bl __modsi3
	adds r5, r0, #0
	movs r0, #0xd
	adds r2, r4, #0
	muls r2, r0, r2
	adds r1, r2, #1
	adds r0, r1, #0
	cmp r1, #0
	bge _080ABFF0
	movs r3, #0x80
	lsls r3, r3, #8
	adds r0, r2, r3
_080ABFF0:
	asrs r4, r0, #0xf
	lsls r0, r4, #0xf
	subs r4, r1, r0
	asrs r0, r4, #8
	mov r1, r8
	bl __modsi3
	adds r2, r0, #0
	cmp r5, r2
	beq _080AC034
	mov r1, sl
	ldr r0, [r1]
	adds r1, r0, r5
	adds r0, r0, r2
	ldrb r3, [r1]
	ldrb r0, [r0]
	adds r0, r3, r0
	strb r0, [r1]
	mov r1, sl
	ldr r0, [r1]
	adds r1, r0, r2
	adds r0, r0, r5
	ldrb r0, [r0]
	ldrb r3, [r1]
	subs r0, r0, r3
	strb r0, [r1]
	mov r1, sl
	ldr r0, [r1]
	adds r1, r0, r5
	adds r0, r0, r2
	ldrb r2, [r1]
	ldrb r0, [r0]
	subs r0, r2, r0
	strb r0, [r1]
_080AC034:
	subs r6, #1
	cmp r6, #0
	bge _080ABFB8
	movs r0, #0
	strb r0, [r7]
	ldr r3, [sp, #4]
	ldrb r2, [r3]
	lsrs r0, r2, #5
	lsls r0, r0, #2
	add r0, sb
	movs r1, #0x1f
	ands r1, r2
	ldr r0, [r0, #0x40]
	lsrs r0, r1
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _080AC08E
	ldr r0, _080AC078 @ =gUnk_08DAEC78
	ldr r1, [r0]
	movs r0, #0
	ldrsb r0, [r1, r0]
	adds r5, r2, #0
	cmp r0, r5
	beq _080AC08E
	adds r3, r7, #0
	movs r4, #0
	ldr r2, [sp, #4]
_080AC06C:
	ldrb r0, [r3]
	cmp r0, #0x80
	bne _080AC07C
	strb r4, [r7]
	b _080AC08E
	.align 2, 0
_080AC078: .4byte gUnk_08DAEC78
_080AC07C:
	adds r0, #1
	strb r0, [r7]
	adds r0, r0, r1
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	ldrb r5, [r2]
	cmp r0, r5
	bne _080AC06C
_080AC08E:
	movs r0, #1
	ldr r1, [sp]
	strb r0, [r1]
	mov r0, sb
	bl sub_80ABEF0
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_80AC0AC
sub_80AC0AC: @ 0x080AC0AC
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x32
	ldrb r2, [r0]
	adds r2, #1
	movs r0, #0x7f
	ands r2, r0
_080AC0BA:
	lsrs r0, r2, #5
	lsls r0, r0, #2
	adds r0, r0, r4
	movs r1, #0x1f
	ands r1, r2
	ldr r0, [r0, #0x40]
	lsrs r0, r1
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _080AC0F6
	adds r0, r4, #0
	adds r1, r2, #0
	movs r2, #0x20
	bl sub_80AC998
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080AC0F2
	adds r0, r4, #0
	adds r0, #0x32
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl sub_80AD260
	movs r0, #1
	b _080AC104
_080AC0F2:
	movs r0, #0
	b _080AC104
_080AC0F6:
	adds r1, r2, #1
	lsls r1, r1, #0x18
	movs r0, #0xfe
	lsls r0, r0, #0x17
	ands r0, r1
	lsrs r2, r0, #0x18
	b _080AC0BA
_080AC104:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_80AC10C
sub_80AC10C: @ 0x080AC10C
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x32
	ldrb r2, [r0]
	subs r2, #1
	movs r0, #0x7f
	ands r2, r0
_080AC11A:
	lsrs r0, r2, #5
	lsls r0, r0, #2
	adds r0, r0, r4
	movs r1, #0x1f
	ands r1, r2
	ldr r0, [r0, #0x40]
	lsrs r0, r1
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _080AC156
	adds r0, r4, #0
	adds r1, r2, #0
	movs r2, #0x20
	bl sub_80AC998
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080AC152
	adds r0, r4, #0
	adds r0, #0x32
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl sub_80AD260
	movs r0, #1
	b _080AC164
_080AC152:
	movs r0, #0
	b _080AC164
_080AC156:
	subs r1, r2, #1
	lsls r1, r1, #0x18
	movs r0, #0xfe
	lsls r0, r0, #0x17
	ands r0, r1
	lsrs r2, r0, #0x18
	b _080AC11A
_080AC164:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_80AC16C
sub_80AC16C: @ 0x080AC16C
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r6, _080AC1A0 @ =0x0201EA9C
	lsls r1, r4, #1
	adds r0, r1, r4
	lsls r0, r0, #4
	adds r0, r0, r4
	adds r2, r0, r6
	movs r3, #0x2f
_080AC180:
	ldrb r0, [r2, #1]
	strb r0, [r2]
	adds r2, #1
	subs r3, #1
	cmp r3, #0
	bge _080AC180
	adds r0, r1, r4
	lsls r0, r0, #4
	adds r0, r0, r4
	adds r1, r6, #0
	adds r1, #0x30
	adds r0, r0, r1
	strb r5, [r0]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080AC1A0: .4byte 0x0201EA9C

	thumb_func_start sub_80AC1A4
sub_80AC1A4: @ 0x080AC1A4
	push {r4, r5, lr}
	movs r1, #0
	ldr r5, _080AC1DC @ =gUnk_08432D74
	ldr r3, _080AC1E0 @ =0x0201EA9C
	movs r2, #0
	adds r4, r3, #0
	adds r4, #0x31
_080AC1B2:
	adds r0, r1, r3
	strb r2, [r0]
	adds r0, r1, r4
	strb r2, [r0]
	adds r1, #1
	cmp r1, #0x30
	ble _080AC1B2
	ldr r1, _080AC1E4 @ =0x06010800
	adds r0, r5, #0
	bl Decompress
	ldr r0, _080AC1E8 @ =gUnk_08432DE4
	movs r1, #0xe8
	lsls r1, r1, #2
	movs r2, #0x60
	bl ApplyPaletteExt
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080AC1DC: .4byte gUnk_08432D74
_080AC1E0: .4byte 0x0201EA9C
_080AC1E4: .4byte 0x06010800
_080AC1E8: .4byte gUnk_08432DE4

	thumb_func_start sub_80AC1EC
sub_80AC1EC: @ 0x080AC1EC
	movs r1, #0
	str r1, [r0, #0x2c]
	bx lr
	.align 2, 0

	thumb_func_start nullsub_87
nullsub_87: @ 0x080AC1F4
	bx lr
	.align 2, 0

	thumb_func_start sub_80AC1F8
sub_80AC1F8: @ 0x080AC1F8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	adds r4, r0, #0
	movs r7, #0
	movs r5, #0
	movs r0, #0xff
	mov r8, r0
	mov ip, r0
	movs r6, #0
	ldr r1, _080AC2F8 @ =gUnk_08DAEC74
	mov sb, r1
	movs r2, #0xd4
	lsls r2, r2, #2
	mov sl, r2
_080AC21C:
	mov r0, sb
	ldr r2, [r0]
	lsls r3, r6, #1
	adds r2, r3, r2
	str r2, [sp]
	ldr r2, _080AC2FC @ =gUnk_08DAEC9C
	ldr r1, [r2]
	ldr r0, [r4, #0x2c]
	movs r2, #0xc6
	lsls r2, r2, #3
	adds r0, r0, r2
	add r1, sl
	adds r1, r1, r0
	ldrb r0, [r1]
	subs r0, #0x80
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x19
	ldr r1, [sp]
	strb r0, [r1]
	mov r0, sb
	ldr r2, [r0]
	adds r2, r3, r2
	ldr r1, _080AC2FC @ =gUnk_08DAEC9C
	ldr r0, [r1]
	add r0, sl
	ldr r1, [r4, #0x2c]
	adds r0, r0, r1
	ldrb r1, [r0]
	subs r1, #0x80
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x19
	movs r0, #0xf0
	subs r0, r0, r1
	strb r0, [r2, #1]
	mov r2, sb
	ldr r0, [r2]
	adds r3, r3, r0
	ldrb r0, [r3]
	cmp r0, r5
	bhs _080AC26E
	adds r0, r5, #0
_080AC26E:
	adds r5, r0, #0
	ldrb r0, [r3]
	cmp r0, ip
	bls _080AC278
	mov r0, ip
_080AC278:
	mov ip, r0
	ldrb r3, [r3, #1]
	adds r0, r3, #0
	cmp r3, r7
	bhs _080AC284
	adds r3, r7, #0
_080AC284:
	adds r7, r3, #0
	adds r1, r0, #0
	lsls r0, r1, #0x18
	lsrs r0, r0, #0x18
	cmp r0, r8
	bls _080AC292
	mov r1, r8
_080AC292:
	lsls r0, r1, #0x18
	lsrs r0, r0, #0x18
	mov r8, r0
	ldr r0, [r4, #0x2c]
	adds r1, r0, #1
	str r1, [r4, #0x2c]
	ldr r0, _080AC300 @ =0x0000062F
	cmp r1, r0
	ble _080AC2AC
	movs r2, #0xc6
	lsls r2, r2, #3
	subs r0, r1, r2
	str r0, [r4, #0x2c]
_080AC2AC:
	adds r6, #1
	cmp r6, #0xdf
	ble _080AC21C
	mov r1, ip
	subs r0, r5, r1
	cmp r0, #0x3f
	ble _080AC2BC
	movs r0, #0x3f
_080AC2BC:
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	mov r2, r8
	subs r0, r7, r2
	cmp r0, #0x3f
	ble _080AC2CA
	movs r0, #0x3f
_080AC2CA:
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	lsls r0, r5, #1
	adds r0, r0, r5
	asrs r1, r0, #2
	movs r0, #0
	bl sub_80AC16C
	lsls r0, r7, #1
	adds r0, r0, r7
	asrs r1, r0, #2
	movs r0, #1
	bl sub_80AC16C
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080AC2F8: .4byte gUnk_08DAEC74
_080AC2FC: .4byte gUnk_08DAEC9C
_080AC300: .4byte 0x0000062F

	thumb_func_start sub_80AC304
sub_80AC304: @ 0x080AC304
	asrs r3, r1, #5
	lsls r3, r3, #2
	adds r3, r3, r0
	movs r2, #0x1f
	ands r2, r1
	ldr r0, [r3, #0x50]
	lsrs r0, r2
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	bne _080AC31E
	movs r0, #0
	b _080AC320
_080AC31E:
	movs r0, #1
_080AC320:
	bx lr
	.align 2, 0

	thumb_func_start sub_80AC324
sub_80AC324: @ 0x080AC324
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #0x18
	adds r7, r0, #0
	add r0, sp, #0x14
	movs r1, #0
	strh r1, [r0]
	adds r1, r7, #0
	adds r1, #0x50
	ldr r2, _080AC3A0 @ =0x01000008
	bl CpuSet
	mov r0, sp
	bl sub_80A01EC
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080AC3BA
	movs r4, #0
	movs r0, #1
	mov ip, r0
	ldr r1, _080AC3A4 @ =gUnk_08DAEB78
	mov r8, r1
_080AC354:
	asrs r1, r4, #5
	lsls r1, r1, #2
	add r1, sp
	movs r0, #0x1f
	ands r0, r4
	ldr r1, [r1]
	lsrs r1, r0
	mov r0, ip
	ands r1, r0
	cmp r4, #0xa
	bgt _080AC36C
	movs r1, #1
_080AC36C:
	adds r6, r4, #1
	cmp r1, #0
	beq _080AC3B4
	movs r3, #0
	mov r1, r8
	ldr r0, [r1]
	ldr r1, _080AC3A4 @ =gUnk_08DAEB78
	cmp r0, #0
	blt _080AC3B4
	movs r5, #0x1f
	adds r2, r1, #0
	mov r1, r8
_080AC384:
	ldr r0, [r1]
	cmp r0, r4
	bne _080AC3A8
	asrs r2, r3, #5
	lsls r2, r2, #2
	adds r2, r2, r7
	ands r3, r5
	mov r1, ip
	lsls r1, r3
	ldr r0, [r2, #0x50]
	orrs r0, r1
	str r0, [r2, #0x50]
	b _080AC3B4
	.align 2, 0
_080AC3A0: .4byte 0x01000008
_080AC3A4: .4byte gUnk_08DAEB78
_080AC3A8:
	adds r2, #4
	adds r1, #4
	adds r3, #1
	ldr r0, [r2]
	cmp r0, #0
	bge _080AC384
_080AC3B4:
	adds r4, r6, #0
	cmp r4, #0x7f
	ble _080AC354
_080AC3BA:
	adds r1, r7, #0
	adds r1, #0x39
	movs r0, #0xff
	strb r0, [r1]
	add sp, #0x18
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_80AC3D0
sub_80AC3D0: @ 0x080AC3D0
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r4, r5, #0
	adds r4, #0x39
	ldrb r1, [r4]
	adds r3, r1, #1
	adds r0, r3, #0
	asrs r2, r0, #7
	lsls r0, r2, #7
	subs r2, r3, r0
	adds r3, r4, #0
	ldr r4, _080AC418 @ =gUnk_08DAEB78
_080AC3E8:
	asrs r0, r2, #5
	lsls r0, r0, #2
	adds r0, r0, r5
	movs r1, #0x1f
	ands r1, r2
	ldr r0, [r0, #0x50]
	lsrs r0, r1
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _080AC404
	ldrb r0, [r3]
	cmp r0, r2
	bne _080AC41C
_080AC404:
	adds r2, #1
	adds r0, r2, #0
	cmp r2, #0
	bge _080AC40E
	adds r0, #0x7f
_080AC40E:
	asrs r0, r0, #7
	lsls r0, r0, #7
	subs r2, r2, r0
	b _080AC3E8
	.align 2, 0
_080AC418: .4byte gUnk_08DAEB78
_080AC41C:
	strb r2, [r3]
	lsls r0, r2, #2
	adds r0, r0, r4
	ldr r0, [r0]
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_80AC42C
sub_80AC42C: @ 0x080AC42C
	push {r4, r5, lr}
	adds r4, r0, #0
	bl GetGameTime
	movs r1, #0xd
	muls r0, r1, r0
	adds r2, r0, #1
	movs r0, #0x7f
	ands r2, r0
	ldr r5, _080AC47C @ =gUnk_08DAEB78
_080AC440:
	asrs r0, r2, #5
	lsls r0, r0, #2
	adds r0, r0, r4
	movs r1, #0x1f
	ands r1, r2
	ldr r0, [r0, #0x50]
	lsrs r0, r1
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _080AC460
	adds r1, r4, #0
	adds r1, #0x39
	ldrb r0, [r1]
	cmp r0, r2
	bne _080AC480
_080AC460:
	movs r0, #0xd
	adds r1, r2, #0
	muls r1, r0, r1
	adds r3, r1, #1
	adds r0, r3, #0
	cmp r3, #0
	bge _080AC472
	adds r0, r1, #0
	adds r0, #0x80
_080AC472:
	asrs r2, r0, #7
	lsls r0, r2, #7
	subs r2, r3, r0
	b _080AC440
	.align 2, 0
_080AC47C: .4byte gUnk_08DAEB78
_080AC480:
	strb r2, [r1]
	lsls r0, r2, #2
	adds r0, r0, r5
	ldr r0, [r0]
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_80AC490
sub_80AC490: @ 0x080AC490
	push {lr}
	ldrh r2, [r0, #0x2a]
	rsbs r1, r2, #0
	orrs r1, r2
	lsrs r3, r1, #0x1f
	lsrs r1, r2, #4
	adds r1, #5
	adds r0, #0x36
	ldrb r2, [r0]
	subs r0, r2, #1
	cmp r0, #0
	bge _080AC4AA
	adds r0, r2, #2
_080AC4AA:
	asrs r0, r0, #2
	cmp r1, r0
	bgt _080AC4B4
	movs r0, #2
	orrs r3, r0
_080AC4B4:
	adds r0, r3, #0
	bl sub_80A9C68
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_80AC4C0
sub_80AC4C0: @ 0x080AC4C0
	push {lr}
	adds r2, r0, #0
	adds r0, #0x35
	ldrb r1, [r0]
	movs r0, #3
	ands r0, r1
	lsls r0, r0, #5
	adds r0, #0x60
	lsrs r1, r1, #2
	lsls r1, r1, #4
	ldrh r2, [r2, #0x2a]
	subs r2, #0x40
	subs r1, r1, r2
	movs r3, #0x80
	lsls r3, r3, #4
	movs r2, #2
	bl ShowSysHandCursor
	pop {r0}
	bx r0

	thumb_func_start sub_80AC4E8
sub_80AC4E8: @ 0x080AC4E8
	push {r4, lr}
	adds r2, r0, #0
	adds r0, #0x35
	ldrb r0, [r0]
	lsrs r0, r0, #2
	lsls r0, r0, #4
	ldrh r1, [r2, #0x2a]
	subs r0, r0, r1
	cmp r0, #0
	bge _080AC4FE
	adds r0, #0xf
_080AC4FE:
	asrs r4, r0, #4
	cmp r1, #0
	beq _080AC50E
	cmp r4, #0
	bgt _080AC50E
	movs r0, #1
	rsbs r0, r0, #0
	b _080AC532
_080AC50E:
	ldrh r1, [r2, #0x2a]
	lsrs r0, r1, #4
	adds r3, r0, #5
	adds r0, r2, #0
	adds r0, #0x36
	ldrb r1, [r0]
	subs r0, r1, #1
	cmp r0, #0
	bge _080AC522
	adds r0, r1, #2
_080AC522:
	asrs r0, r0, #2
	cmp r3, r0
	bgt _080AC530
	cmp r4, #3
	ble _080AC530
	movs r0, #1
	b _080AC532
_080AC530:
	movs r0, #0
_080AC532:
	pop {r4}
	pop {r1}
	bx r1

	thumb_func_start sub_80AC538
sub_80AC538: @ 0x080AC538
	push {r4, r5, r6, r7, lr}
	adds r6, r0, #0
	ldrh r1, [r6, #0x2a]
	lsrs r0, r1, #4
	subs r0, #1
	lsls r7, r0, #2
	ldr r0, _080AC554 @ =gBg2Tm
	movs r1, #0
	bl TmFill
	adds r4, r7, #0
	adds r0, r4, #0
	b _080AC618
	.align 2, 0
_080AC554: .4byte gBg2Tm
_080AC558:
	adds r0, r6, #0
	adds r1, r4, #0
	bl sub_80ABCB0
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080AC56A
	movs r5, #0
	b _080AC5B0
_080AC56A:
	ldr r0, _080AC5A8 @ =gUnk_08DAE514
	lsls r1, r4, #4
	adds r0, #8
	adds r1, r1, r0
	ldr r0, [r1]
	cmp r0, #0
	beq _080AC5B0
	adds r2, r4, #0
	cmp r4, #0
	bge _080AC580
	adds r2, r4, #3
_080AC580:
	asrs r2, r2, #2
	lsls r0, r2, #1
	adds r0, #8
	movs r1, #0x1f
	ands r0, r1
	lsls r0, r0, #5
	adds r0, #0xc
	lsls r2, r2, #2
	subs r2, r4, r2
	lsls r2, r2, #2
	adds r0, r0, r2
	lsls r0, r0, #1
	ldr r1, _080AC5AC @ =gBg2Tm
	adds r0, r0, r1
	movs r1, #1
	movs r2, #0x14
	movs r3, #0x14
	bl PutTwoSpecialChar
	b _080AC614
	.align 2, 0
_080AC5A8: .4byte gUnk_08DAE514
_080AC5AC: .4byte gBg2Tm
_080AC5B0:
	cmp r4, #0x62
	ble _080AC5E8
	adds r2, r4, #0
	cmp r4, #0
	bge _080AC5BC
	adds r2, r4, #3
_080AC5BC:
	asrs r2, r2, #2
	lsls r0, r2, #1
	adds r0, #8
	movs r1, #0x1f
	ands r0, r1
	lsls r0, r0, #5
	adds r0, #0xd
	lsls r2, r2, #2
	subs r2, r4, r2
	lsls r2, r2, #2
	adds r0, r0, r2
	lsls r0, r0, #1
	ldr r1, _080AC5E4 @ =gBg2Tm
	adds r0, r0, r1
	adds r2, r4, #1
	adds r1, r5, #0
	bl sub_8006068
	b _080AC614
	.align 2, 0
_080AC5E4: .4byte gBg2Tm
_080AC5E8:
	adds r2, r4, #0
	cmp r4, #0
	bge _080AC5F0
	adds r2, r4, #3
_080AC5F0:
	asrs r2, r2, #2
	lsls r0, r2, #1
	adds r0, #8
	movs r1, #0x1f
	ands r0, r1
	lsls r0, r0, #5
	adds r0, #0xd
	lsls r2, r2, #2
	subs r2, r4, r2
	lsls r2, r2, #2
	adds r0, r0, r2
	lsls r0, r0, #1
	ldr r1, _080AC63C @ =gBg2Tm
	adds r0, r0, r1
	adds r2, r4, #1
	adds r1, r5, #0
	bl sub_800625C
_080AC614:
	adds r4, #1
	adds r0, r7, #0
_080AC618:
	adds r0, #0x1c
	cmp r4, r0
	bge _080AC62E
	movs r5, #1
	cmp r4, #0
	blt _080AC614
	adds r0, r6, #0
	adds r0, #0x36
	ldrb r0, [r0]
	cmp r4, r0
	blt _080AC558
_080AC62E:
	movs r0, #4
	bl EnableBgSync
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080AC63C: .4byte gBg2Tm

	thumb_func_start sub_80AC640
sub_80AC640: @ 0x080AC640
	push {r4, lr}
	adds r4, r0, #0
	adds r0, r4, #6
	adds r1, #0x34
	movs r3, #2
	ldrb r2, [r1]
	cmp r2, #0x64
	bne _080AC652
	movs r3, #4
_080AC652:
	ldrb r2, [r1]
	adds r1, r3, #0
	bl sub_8006068
	ldr r0, _080AC66C @ =0x0201EA90
	adds r1, r4, #0
	adds r1, #8
	bl PutText
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080AC66C: .4byte 0x0201EA90

	thumb_func_start sub_80AC670
sub_80AC670: @ 0x080AC670
	adds r1, r0, #0
	ldrh r0, [r1, #0x2c]
	cmp r0, #0
	beq _080AC67C
	adds r0, #1
	strh r0, [r1, #0x2c]
_080AC67C:
	bx lr
	.align 2, 0

	thumb_func_start sub_80AC680
sub_80AC680: @ 0x080AC680
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	adds r4, r0, #0
	movs r0, #0
	bl InitBgs
	bl ResetTextFont
	bl ResetText
	bl ApplySystemObjectsGraphics
	bl UnpackUiWindowFrameGraphics
	bl InitSystemTextFont
	ldr r7, _080AC948 @ =gDispIo
	movs r6, #1
	ldrb r2, [r7, #1]
	orrs r2, r6
	movs r0, #2
	orrs r2, r0
	movs r1, #4
	orrs r2, r1
	movs r3, #8
	orrs r2, r3
	movs r0, #0x10
	orrs r2, r0
	subs r1, #8
	adds r0, r1, #0
	ldrb r3, [r7, #0xc]
	ands r0, r3
	strb r0, [r7, #0xc]
	adds r0, r1, #0
	ldrb r3, [r7, #0x10]
	ands r0, r3
	movs r3, #2
	orrs r0, r3
	strb r0, [r7, #0x10]
	ldrb r0, [r7, #0x14]
	ands r1, r0
	orrs r1, r6
	strb r1, [r7, #0x14]
	movs r0, #3
	ldrb r1, [r7, #0x18]
	orrs r0, r1
	strb r0, [r7, #0x18]
	movs r0, #0x21
	rsbs r0, r0, #0
	ands r2, r0
	subs r3, #0x43
	ands r2, r3
	movs r0, #0x7f
	ands r2, r0
	strb r2, [r7, #1]
	movs r0, #0
	bl SetBlankChr
	ldr r0, _080AC94C @ =gBg0Tm
	movs r1, #0
	bl TmFill
	ldr r1, _080AC950 @ =gBg1Tm
	mov sl, r1
	mov r0, sl
	movs r1, #0
	bl TmFill
	ldr r0, _080AC954 @ =gBg2Tm
	movs r1, #0
	bl TmFill
	ldr r0, _080AC958 @ =gBg3Tm
	movs r1, #0
	bl TmFill
	movs r0, #0xf
	bl EnableBgSync
	adds r0, r4, #0
	adds r0, #0x35
	movs r5, #0
	strb r5, [r0]
	adds r0, #2
	strb r5, [r0]
	movs r2, #0
	mov sb, r2
	strh r5, [r4, #0x2a]
	adds r0, #4
	mov r3, sb
	strb r3, [r0]
	adds r0, #1
	strb r3, [r0]
	adds r0, #1
	strb r3, [r0]
	adds r0, #1
	strb r3, [r0]
	subs r0, #0xf
	strb r3, [r0]
	adds r0, #1
	strb r3, [r0]
	adds r1, r4, #0
	adds r1, #0x32
	movs r0, #0xff
	strb r0, [r1]
	adds r0, r4, #0
	adds r0, #0x2e
	strb r3, [r0]
	strh r5, [r4, #0x2c]
	adds r0, #0x11
	strb r3, [r0]
	adds r0, r4, #0
	bl sub_80ABD24
	adds r0, r4, #0
	bl sub_80AC324
	bl sub_80AD1A4
	adds r0, r4, #0
	bl sub_80ACA1C
	adds r0, r4, #0
	bl ResetSysHandCursor
	movs r0, #0xa0
	lsls r0, r0, #2
	movs r1, #2
	bl DisplaySysHandCursorTextShadow
	adds r0, r4, #0
	bl sub_80A9BE8
	movs r1, #0xd0
	lsls r1, r1, #3
	movs r0, #1
	movs r2, #3
	bl sub_80A9BFC
	movs r0, #0x90
	movs r1, #0x38
	movs r2, #0x90
	movs r3, #0x90
	bl sub_80A9C84
	adds r0, r4, #0
	bl sub_80AC490
	adds r0, r4, #0
	bl sub_80AC4C0
	adds r0, r4, #0
	bl sub_80AC538
	ldr r0, _080AC95C @ =gUnk_08432E44
	ldr r1, _080AC960 @ =0x06004000
	bl Decompress
	ldr r0, _080AC964 @ =gUnk_0840364C
	movs r1, #0x80
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r0, _080AC968 @ =gUnk_0840366C
	movs r1, #0xa0
	movs r2, #0x20
	bl ApplyPaletteExt
	str r5, [sp]
	movs r0, #2
	movs r1, #1
	movs r2, #0x1a
	movs r3, #6
	bl sub_804A4CC
	str r5, [sp]
	movs r0, #0xb
	movs r1, #7
	movs r2, #0x11
	movs r3, #0xc
	bl sub_804A4CC
	str r5, [sp]
	movs r0, #2
	movs r1, #0xb
	movs r2, #9
	movs r3, #8
	bl sub_804A4CC
	movs r0, #0xb1
	lsls r0, r0, #2
	add r0, sl
	ldr r1, _080AC96C @ =gUnk_08433C0C
	movs r2, #0x80
	lsls r2, r2, #5
	mov r8, r2
	bl TmApplyTsa_thm
	str r5, [sp]
	movs r0, #2
	movs r1, #7
	movs r2, #9
	movs r3, #4
	bl sub_804A4CC
	movs r3, #0xb6
	lsls r3, r3, #1
	add sl, r3
	ldr r1, _080AC970 @ =gUnk_08433CA0
	mov r0, sl
	mov r2, r8
	bl TmApplyTsa_thm
	ldr r1, _080AC94C @ =gBg0Tm
	movs r2, #0xb6
	lsls r2, r2, #1
	adds r0, r1, r2
	adds r1, r4, #0
	bl sub_80AC640
	ldr r2, _080AC974 @ =0x0000FFFE
	movs r0, #0
	movs r1, #0
	bl SetBgOffset
	ldr r1, _080AC978 @ =0x0000FFFC
	movs r0, #2
	movs r2, #0
	bl SetBgOffset
	movs r0, #0x20
	ldrb r3, [r7, #1]
	orrs r0, r3
	movs r1, #0x41
	rsbs r1, r1, #0
	ands r0, r1
	movs r2, #0x7f
	ands r0, r2
	strb r0, [r7, #1]
	adds r1, r7, #0
	adds r1, #0x34
	ldrb r0, [r1]
	orrs r0, r6
	movs r3, #2
	orrs r0, r3
	movs r2, #4
	orrs r0, r2
	movs r3, #8
	orrs r0, r3
	movs r2, #0x10
	orrs r0, r2
	strb r0, [r1]
	subs r1, #7
	movs r0, #4
	strb r0, [r1]
	adds r1, #4
	movs r5, #0x40
	movs r0, #0x40
	strb r0, [r1]
	subs r1, #5
	movs r0, #0xf0
	strb r0, [r1]
	adds r1, #4
	movs r0, #0x90
	strb r0, [r1]
	adds r1, #6
	ldrb r3, [r1]
	orrs r6, r3
	movs r0, #2
	orrs r6, r0
	subs r0, #7
	ands r6, r0
	movs r2, #8
	orrs r6, r2
	movs r3, #0x10
	orrs r6, r3
	strb r6, [r1]
	adds r0, r4, #0
	bl sub_80AC42C
	movs r1, #0x80
	lsls r1, r1, #8
	str r0, [sp]
	ldr r0, _080AC958 @ =gBg3Tm
	movs r2, #8
	movs r3, #8
	bl sub_80B7980
	ldr r0, _080AC97C @ =gUnk_08432FF8
	ldr r1, _080AC980 @ =0x06012000
	bl Decompress
	ldr r0, _080AC984 @ =gUnk_08433A90
	movs r1, #0xa0
	lsls r1, r1, #2
	movs r2, #0x40
	bl ApplyPaletteExt
	adds r0, r4, #0
	bl sub_80AD664
	adds r1, r7, #0
	adds r1, #0x3c
	movs r0, #0x3f
	ldrb r2, [r1]
	ands r0, r2
	orrs r0, r5
	strb r0, [r1]
	adds r1, #8
	movs r0, #0xf
	strb r0, [r1]
	adds r1, #1
	movs r0, #3
	strb r0, [r1]
	adds r0, r7, #0
	adds r0, #0x46
	mov r3, sb
	strb r3, [r0]
	ldr r0, _080AC988 @ =0x0000FFE0
	ldrh r1, [r7, #0x3c]
	ands r0, r1
	movs r1, #2
	orrs r0, r1
	ldr r1, _080AC98C @ =0x0000E0FF
	ands r0, r1
	movs r2, #0x80
	lsls r2, r2, #4
	adds r1, r2, #0
	orrs r0, r1
	strh r0, [r7, #0x3c]
	adds r0, r4, #0
	bl sub_8005E88
	bl sub_80AC1A4
	ldr r0, _080AC990 @ =sub_80AC670
	adds r1, r4, #0
	bl StartParallelWorker
	ldr r0, _080AC994 @ =gUnk_08DAECA0
	adds r1, r4, #0
	bl Proc_Start
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080AC948: .4byte gDispIo
_080AC94C: .4byte gBg0Tm
_080AC950: .4byte gBg1Tm
_080AC954: .4byte gBg2Tm
_080AC958: .4byte gBg3Tm
_080AC95C: .4byte gUnk_08432E44
_080AC960: .4byte 0x06004000
_080AC964: .4byte gUnk_0840364C
_080AC968: .4byte gUnk_0840366C
_080AC96C: .4byte gUnk_08433C0C
_080AC970: .4byte gUnk_08433CA0
_080AC974: .4byte 0x0000FFFE
_080AC978: .4byte 0x0000FFFC
_080AC97C: .4byte gUnk_08432FF8
_080AC980: .4byte 0x06012000
_080AC984: .4byte gUnk_08433A90
_080AC988: .4byte 0x0000FFE0
_080AC98C: .4byte 0x0000E0FF
_080AC990: .4byte sub_80AC670
_080AC994: .4byte gUnk_08DAECA0

	thumb_func_start sub_80AC998
sub_80AC998: @ 0x080AC998
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r4, r0, #0
	adds r5, r1, #0
	adds r6, r2, #0
	bl sub_800409C
	lsls r0, r0, #0x18
	asrs r3, r0, #0x18
	cmp r3, #0
	bne _080AC9D8
	adds r0, r4, #0
	adds r0, #0x32
	strb r5, [r0]
	movs r0, #1
	strh r0, [r4, #0x2c]
	ldr r1, _080AC9D4 @ =gUnk_08DAE514
	lsls r0, r5, #4
	adds r0, r0, r1
	ldr r0, [r0]
	movs r2, #0x80
	lsls r2, r2, #1
	str r3, [sp]
	adds r1, r2, #0
	adds r3, r6, #0
	bl sub_8003FD4
	movs r0, #1
	b _080AC9DA
	.align 2, 0
_080AC9D4: .4byte gUnk_08DAE514
_080AC9D8:
	movs r0, #0
_080AC9DA:
	add sp, #4
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_80AC9E4
sub_80AC9E4: @ 0x080AC9E4
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	bl sub_800409C
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne _080ACA14
	movs r4, #0
	strh r0, [r5, #0x2c]
	movs r1, #0x80
	lsls r1, r1, #1
	str r0, [sp]
	movs r0, #0
	movs r2, #0
	movs r3, #0x18
	bl sub_8003FD4
	adds r0, r5, #0
	adds r0, #0x2f
	strb r4, [r0]
	adds r0, #1
	strb r4, [r0]
_080ACA14:
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start sub_80ACA1C
sub_80ACA1C: @ 0x080ACA1C
	push {r4, lr}
	adds r4, r0, #0
	adds r4, #0x35
	ldrb r1, [r4]
	bl sub_80ABCB0
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080ACA36
	ldrb r0, [r4]
	bl sub_80AD260
	b _080ACA3E
_080ACA36:
	movs r0, #1
	rsbs r0, r0, #0
	bl sub_80AD260
_080ACA3E:
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_80ACA44
sub_80ACA44: @ 0x080ACA44
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	movs r5, #0
	adds r0, #0x37
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne _080ACB38
	ldr r0, _080ACB20 @ =gpKeySt
	ldr r1, [r0]
	ldrh r2, [r1, #6]
	adds r3, r4, #0
	adds r3, #0x38
	movs r0, #4
	strb r0, [r3]
	movs r0, #0x80
	lsls r0, r0, #2
	ldrh r6, [r1, #4]
	ands r0, r6
	cmp r0, #0
	beq _080ACA76
	ldrh r2, [r1, #4]
	movs r0, #8
	strb r0, [r3]
_080ACA76:
	movs r0, #0x40
	ands r0, r2
	cmp r0, #0
	beq _080ACA82
	movs r5, #4
	rsbs r5, r5, #0
_080ACA82:
	movs r0, #0x80
	ands r0, r2
	cmp r0, #0
	beq _080ACA8C
	movs r5, #4
_080ACA8C:
	movs r0, #0x20
	ands r0, r2
	cmp r0, #0
	beq _080ACAA6
	adds r1, r4, #0
	adds r1, #0x35
	movs r0, #3
	ldrb r1, [r1]
	ands r0, r1
	cmp r0, #0
	beq _080ACAA6
	movs r5, #1
	rsbs r5, r5, #0
_080ACAA6:
	movs r0, #0x10
	ands r2, r0
	cmp r2, #0
	beq _080ACABE
	adds r1, r4, #0
	adds r1, #0x35
	movs r0, #3
	ldrb r1, [r1]
	ands r0, r1
	cmp r0, #2
	bhi _080ACABE
	movs r5, #1
_080ACABE:
	cmp r5, #0
	beq _080ACB2A
	adds r2, r4, #0
	adds r2, #0x35
	ldrb r1, [r2]
	adds r0, r1, r5
	cmp r0, #0
	bge _080ACAD0
	b _080ACC28
_080ACAD0:
	adds r1, r4, #0
	adds r1, #0x36
	ldrb r1, [r1]
	cmp r0, r1
	blt _080ACADC
	b _080ACC28
_080ACADC:
	strb r0, [r2]
	adds r0, r4, #0
	bl sub_80ACA1C
	adds r0, r4, #0
	bl sub_80AC4E8
	adds r5, r4, #0
	adds r5, #0x37
	strb r0, [r5]
	lsls r0, r0, #0x18
	asrs r1, r0, #0x18
	cmp r1, #0
	beq _080ACB24
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	bne _080ACB08
	adds r0, r4, #0
	movs r1, #0xa
	bl Proc_Goto
_080ACB08:
	ldrb r5, [r5]
	cmp r5, #1
	bne _080ACB16
	adds r0, r4, #0
	movs r1, #0xb
	bl Proc_Goto
_080ACB16:
	adds r0, r4, #0
	bl sub_80AC538
	b _080ACB2A
	.align 2, 0
_080ACB20: .4byte gpKeySt
_080ACB24:
	adds r0, r4, #0
	bl sub_80AC4C0
_080ACB2A:
	adds r0, r4, #0
	adds r0, #0x37
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _080ACB78
_080ACB38:
	adds r5, r4, #0
	adds r5, #0x37
	movs r1, #0
	ldrsb r1, [r5, r1]
	adds r0, r4, #0
	adds r0, #0x38
	ldrb r0, [r0]
	adds r2, r0, #0
	muls r2, r1, r2
	ldrh r6, [r4, #0x2a]
	adds r2, r6, r2
	strh r2, [r4, #0x2a]
	ldr r1, _080ACB74 @ =0x0000FFFC
	movs r0, #0xff
	ands r2, r0
	movs r0, #2
	bl SetBgOffset
	movs r0, #0xf
	ldrh r1, [r4, #0x2a]
	ands r0, r1
	cmp r0, #0
	bne _080ACB6A
	movs r0, #0
	strb r0, [r5]
_080ACB6A:
	adds r0, r4, #0
	bl sub_80AC490
	b _080ACC28
	.align 2, 0
_080ACB74: .4byte 0x0000FFFC
_080ACB78:
	ldr r0, _080ACB94 @ =gpKeySt
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r1
	cmp r0, #0
	beq _080ACB98
	adds r0, r4, #0
	movs r1, #1
	bl Proc_Goto
	b _080ACC28
	.align 2, 0
_080ACB94: .4byte gpKeySt
_080ACB98:
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _080ACBA8
	adds r0, r4, #0
	bl sub_80AC9E4
	b _080ACC28
_080ACBA8:
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _080ACBFC
	adds r5, r4, #0
	adds r5, #0x35
	ldrb r1, [r5]
	adds r0, r4, #0
	bl sub_80ABCB0
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080ACBE0
	ldrb r1, [r5]
	adds r0, r4, #0
	movs r2, #0x20
	bl sub_80AC998
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080ACC28
	adds r0, r4, #0
	bl sub_80AC3D0
	adds r1, r4, #0
	bl sub_80AD754
	b _080ACC28
_080ACBE0:
	ldr r0, _080ACBF8 @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080ACC28
	movs r0, #0xe3
	lsls r0, r0, #2
	bl m4aSongNumStart
	b _080ACC28
	.align 2, 0
_080ACBF8: .4byte gPlaySt
_080ACBFC:
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	beq _080ACC18
	bl sub_800409C
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080ACC28
	adds r0, r4, #0
	movs r1, #2
	bl Proc_Goto
	b _080ACC28
_080ACC18:
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	beq _080ACC28
	adds r0, r4, #0
	movs r1, #3
	bl Proc_Goto
_080ACC28:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_80ACC30
sub_80ACC30: @ 0x080ACC30
	push {r4, lr}
	sub sp, #4
	adds r4, r0, #0
	bl sub_800409C
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne _080ACC56
	str r0, [sp]
	movs r0, #0x5a
	movs r1, #0
	movs r2, #0xc0
	movs r3, #0x18
	bl sub_8003FD4
	adds r0, r4, #0
	bl Proc_Break
_080ACC56:
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_80ACC60
sub_80ACC60: @ 0x080ACC60
	push {lr}
	bl EndAllProcChildren
	ldr r0, _080ACC70 @ =gUnk_08DAECA0
	bl Proc_EndEach
	pop {r0}
	bx r0
	.align 2, 0
_080ACC70: .4byte gUnk_08DAECA0

	thumb_func_start sub_80ACC74
sub_80ACC74: @ 0x080ACC74
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x10
	adds r4, r0, #0
	adds r6, r4, #0
	adds r6, #0x3b
	ldrb r1, [r6]
	rsbs r0, r1, #0
	movs r1, #3
	mov sl, r1
	bl __divsi3
	adds r5, r4, #0
	adds r5, #0x3c
	strb r0, [r5]
	ldrb r1, [r6]
	rsbs r0, r1, #0
	lsls r0, r0, #1
	movs r1, #3
	bl __divsi3
	adds r7, r4, #0
	adds r7, #0x3d
	strb r0, [r7]
	ldrb r0, [r6]
	adds r6, #3
	strb r0, [r6]
	ldr r0, _080ACDC4 @ =gBg0Tm
	movs r1, #0
	bl TmFill
	ldr r0, _080ACDC8 @ =gBg1Tm
	movs r1, #0
	bl TmFill
	ldr r0, _080ACDCC @ =gBg2Tm
	movs r1, #0
	bl TmFill
	ldr r4, _080ACDD0 @ =gUnk_08DAEC6C
	ldr r0, [r4]
	movs r1, #1
	str r1, [sp]
	movs r1, #0
	ldrsb r1, [r5, r1]
	adds r1, #1
	str r1, [sp, #4]
	movs r1, #0x1a
	str r1, [sp, #8]
	movs r1, #6
	mov sb, r1
	str r1, [sp, #0xc]
	movs r1, #0
	movs r2, #0
	movs r3, #1
	bl sub_80A974C
	ldr r0, [r4]
	movs r1, #0
	ldrsb r1, [r7, r1]
	adds r1, #2
	str r1, [sp]
	movs r1, #7
	mov r8, r1
	str r1, [sp, #4]
	movs r5, #9
	str r5, [sp, #8]
	movs r1, #4
	str r1, [sp, #0xc]
	movs r1, #0
	movs r2, #7
	movs r3, #1
	bl sub_80A974C
	ldr r0, [r4]
	movs r1, #0
	ldrsb r1, [r7, r1]
	adds r1, #2
	str r1, [sp]
	movs r1, #0xb
	str r1, [sp, #4]
	str r5, [sp, #8]
	movs r1, #8
	str r1, [sp, #0xc]
	movs r1, #0
	movs r2, #0xb
	movs r3, #1
	bl sub_80A974C
	ldr r0, [r4]
	movs r1, #0
	ldrsb r1, [r6, r1]
	adds r1, #0xb
	str r1, [sp]
	mov r1, r8
	str r1, [sp, #4]
	movs r1, #0x11
	str r1, [sp, #8]
	movs r1, #0xc
	str r1, [sp, #0xc]
	movs r1, #0xa
	movs r2, #7
	movs r3, #1
	bl sub_80A974C
	ldr r0, [r4]
	movs r1, #0
	ldrsb r1, [r6, r1]
	adds r1, #0x16
	str r1, [sp]
	movs r5, #5
	str r5, [sp, #4]
	mov r1, sb
	str r1, [sp, #8]
	mov r1, sl
	str r1, [sp, #0xc]
	movs r1, #0xa
	movs r2, #0x13
	movs r3, #1
	bl sub_80A974C
	ldr r4, _080ACDD4 @ =gUnk_08DAEC70
	ldr r0, [r4]
	movs r1, #0
	ldrsb r1, [r6, r1]
	adds r1, #0xc
	str r1, [sp]
	movs r1, #0
	str r1, [sp, #4]
	movs r1, #0x10
	str r1, [sp, #8]
	movs r1, #0x20
	str r1, [sp, #0xc]
	movs r1, #0xc
	movs r2, #0
	movs r3, #2
	bl sub_80A974C
	ldr r0, [r4]
	movs r1, #0
	ldrsb r1, [r6, r1]
	adds r1, #0x16
	str r1, [sp]
	str r5, [sp, #4]
	mov r1, sb
	str r1, [sp, #8]
	movs r1, #2
	str r1, [sp, #0xc]
	movs r1, #0
	movs r2, #0
	movs r3, #0
	bl sub_80A974C
	movs r0, #7
	bl EnableBgSync
	add sp, #0x10
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080ACDC4: .4byte gBg0Tm
_080ACDC8: .4byte gBg1Tm
_080ACDCC: .4byte gBg2Tm
_080ACDD0: .4byte gUnk_08DAEC6C
_080ACDD4: .4byte gUnk_08DAEC70

	thumb_func_start sub_80ACDD8
sub_80ACDD8: @ 0x080ACDD8
	push {r4, r5, r6, lr}
	mov r6, sb
	mov r5, r8
	push {r5, r6}
	sub sp, #0xc
	mov sb, r0
	adds r0, #0x3b
	movs r5, #0
	strb r5, [r0]
	ldr r6, _080ACE90 @ =gUnk_08DAEC6C
	ldr r0, [r6]
	movs r1, #6
	str r1, [sp]
	str r5, [sp, #4]
	str r5, [sp, #8]
	movs r1, #0
	movs r2, #0
	movs r3, #0x1a
	bl sub_804A360
	ldr r0, [r6]
	movs r1, #4
	str r1, [sp]
	str r5, [sp, #4]
	str r5, [sp, #8]
	movs r1, #0
	movs r2, #7
	movs r3, #9
	bl sub_804A360
	ldr r0, [r6]
	movs r1, #0xb0
	lsls r1, r1, #2
	adds r0, r0, r1
	ldr r1, _080ACE94 @ =gUnk_08433C0C
	movs r2, #0x80
	lsls r2, r2, #5
	mov r8, r2
	bl TmApplyTsa_thm
	ldr r0, [r6]
	movs r1, #0xc
	str r1, [sp]
	str r5, [sp, #4]
	str r5, [sp, #8]
	movs r1, #0xa
	movs r2, #7
	movs r3, #0x11
	bl sub_804A360
	ldr r0, [r6]
	ldr r1, _080ACE98 @ =0x000004D4
	adds r0, r0, r1
	ldr r1, _080ACE9C @ =gUnk_08433CA0
	mov r2, r8
	bl TmApplyTsa_thm
	ldr r0, _080ACEA0 @ =gBg2Tm
	ldr r4, _080ACEA4 @ =gUnk_08DAEC70
	ldr r1, [r4]
	movs r2, #0x80
	lsls r2, r2, #2
	bl CpuFastSet
	ldr r0, [r4]
	mov r1, sb
	bl sub_80AC640
	ldr r0, [r6]
	movs r2, #0xc8
	lsls r2, r2, #3
	adds r0, r0, r2
	ldr r1, _080ACEA8 @ =gUnk_08432E88
	mov r2, r8
	bl TmApplyTsa_thm
	bl HideSysHandCursor
	movs r0, #0
	bl sub_80A9C68
	movs r0, #0x3a
	add sb, r0
	mov r1, sb
	strb r5, [r1]
	add sp, #0xc
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080ACE90: .4byte gUnk_08DAEC6C
_080ACE94: .4byte gUnk_08433C0C
_080ACE98: .4byte 0x000004D4
_080ACE9C: .4byte gUnk_08433CA0
_080ACEA0: .4byte gBg2Tm
_080ACEA4: .4byte gUnk_08DAEC70
_080ACEA8: .4byte gUnk_08432E88

	thumb_func_start sub_80ACEAC
sub_80ACEAC: @ 0x080ACEAC
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r1, r5, #0
	adds r1, #0x3a
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	ldrb r1, [r1]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #3
	muls r0, r1, r0
	asrs r0, r0, #6
	adds r4, r5, #0
	adds r4, #0x3b
	strb r0, [r4]
	adds r0, r5, #0
	bl sub_80ACC74
	ldrb r4, [r4]
	cmp r4, #0x18
	bne _080ACEDE
	adds r0, r5, #0
	bl Proc_Break
_080ACEDE:
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start sub_80ACEE4
sub_80ACEE4: @ 0x080ACEE4
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _080ACF04 @ =gpKeySt
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #5
	ands r0, r1
	cmp r0, #0
	beq _080ACF08
	adds r0, r4, #0
	bl sub_80AC3D0
	adds r1, r4, #0
	bl sub_80AD754
	b _080ACF4C
	.align 2, 0
_080ACF04: .4byte gpKeySt
_080ACF08:
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	beq _080ACF18
	adds r0, r4, #0
	bl sub_80AC0AC
	b _080ACF4C
_080ACF18:
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	beq _080ACF28
	adds r0, r4, #0
	bl sub_80AC10C
	b _080ACF4C
_080ACF28:
	ldr r0, _080ACF38 @ =0x00000302
	ands r0, r1
	cmp r0, #0
	beq _080ACF3C
	adds r0, r4, #0
	bl Proc_Break
	b _080ACF4C
	.align 2, 0
_080ACF38: .4byte 0x00000302
_080ACF3C:
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	beq _080ACF4C
	adds r0, r4, #0
	movs r1, #3
	bl Proc_Goto
_080ACF4C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_80ACF54
sub_80ACF54: @ 0x080ACF54
	push {r4, lr}
	adds r4, r0, #0
	bl sub_80ACA1C
	adds r4, #0x3a
	movs r0, #0
	strb r0, [r4]
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_80ACF68
sub_80ACF68: @ 0x080ACF68
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r2, r5, #0
	adds r2, #0x3a
	ldrb r0, [r2]
	adds r0, #1
	strb r0, [r2]
	movs r1, #8
	subs r1, r1, r0
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #3
	muls r0, r1, r0
	cmp r0, #0
	bge _080ACF88
	adds r0, #0x3f
_080ACF88:
	asrs r0, r0, #6
	adds r4, r5, #0
	adds r4, #0x3b
	strb r0, [r4]
	adds r0, r5, #0
	bl sub_80ACC74
	ldrb r0, [r4]
	cmp r0, #0
	bne _080ACFAE
	adds r0, r5, #0
	bl sub_80AC4C0
	adds r0, r5, #0
	bl sub_80AC490
	adds r0, r5, #0
	bl Proc_Break
_080ACFAE:
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start sub_80ACFB4
sub_80ACFB4: @ 0x080ACFB4
	push {lr}
	adds r2, r0, #0
	adds r2, #0x3a
	movs r1, #0
	strb r1, [r2]
	strh r1, [r0, #0x2c]
	bl sub_80ABF30
	pop {r0}
	bx r0

	thumb_func_start sub_80ACFC8
sub_80ACFC8: @ 0x080ACFC8
	push {r4, r5, r6, r7, lr}
	sub sp, #0x10
	adds r7, r0, #0
	adds r6, r7, #0
	adds r6, #0x3a
	ldrb r0, [r6]
	adds r0, #1
	strb r0, [r6]
	movs r1, #8
	subs r1, r1, r0
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #3
	muls r1, r0, r1
	cmp r1, #0
	bge _080ACFEA
	adds r1, #0x3f
_080ACFEA:
	asrs r1, r1, #6
	movs r0, #0x18
	subs r0, r0, r1
	adds r5, r7, #0
	adds r5, #0x3b
	strb r0, [r5]
	ldrb r0, [r5]
	movs r1, #3
	bl __udivsi3
	movs r1, #0x14
	subs r1, r1, r0
	adds r4, r7, #0
	adds r4, #0x3c
	strb r1, [r4]
	ldr r0, _080AD050 @ =gBg1Tm
	movs r1, #0
	bl TmFill
	ldr r0, _080AD054 @ =gUnk_08DAEC6C
	ldr r0, [r0]
	movs r1, #2
	str r1, [sp]
	movs r1, #0
	ldrsb r1, [r4, r1]
	adds r1, #1
	str r1, [sp, #4]
	movs r1, #0x1a
	str r1, [sp, #8]
	movs r1, #7
	str r1, [sp, #0xc]
	movs r1, #0
	movs r2, #0x19
	movs r3, #1
	bl sub_80A974C
	movs r0, #2
	bl EnableBgSync
	ldrb r5, [r5]
	cmp r5, #0x18
	bne _080AD048
	movs r0, #0
	strb r0, [r6]
	adds r0, r7, #0
	bl Proc_Break
_080AD048:
	add sp, #0x10
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080AD050: .4byte gBg1Tm
_080AD054: .4byte gUnk_08DAEC6C

	thumb_func_start sub_80AD058
sub_80AD058: @ 0x080AD058
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x3f
	ldrb r0, [r0]
	cmp r0, #0
	bne _080AD0FA
	adds r0, r4, #0
	adds r0, #0x30
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _080AD098
	ldr r0, _080AD094 @ =gUnk_08DAE514
	adds r1, r4, #0
	adds r1, #0x32
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	lsls r1, r1, #4
	adds r0, #4
	adds r1, r1, r0
	ldr r0, [r1]
	ldrh r1, [r4, #0x2c]
	cmp r1, r0
	blt _080AD098
	adds r0, r4, #0
	bl sub_80ABEF0
	b _080AD0FA
	.align 2, 0
_080AD094: .4byte gUnk_08DAE514
_080AD098:
	ldr r0, _080AD0B0 @ =gpKeySt
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	beq _080AD0B4
	adds r0, r4, #0
	bl sub_80AC0AC
	b _080AD0FA
	.align 2, 0
_080AD0B0: .4byte gpKeySt
_080AD0B4:
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	beq _080AD0C4
	adds r0, r4, #0
	bl sub_80AC10C
	b _080AD0FA
_080AD0C4:
	movs r0, #6
	ands r0, r1
	cmp r0, #0
	beq _080AD0D4
	adds r0, r4, #0
	bl Proc_Break
	b _080AD0FA
_080AD0D4:
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _080AD0EA
	adds r0, r4, #0
	bl sub_80AC3D0
	adds r1, r4, #0
	bl sub_80AD754
	b _080AD0FA
_080AD0EA:
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	beq _080AD0FA
	adds r0, r4, #0
	movs r1, #3
	bl Proc_Goto
_080AD0FA:
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_80AD100
sub_80AD100: @ 0x080AD100
	push {r4, r5, r6, lr}
	sub sp, #0x10
	adds r6, r0, #0
	adds r2, r6, #0
	adds r2, #0x3a
	ldrb r0, [r2]
	adds r0, #1
	strb r0, [r2]
	movs r1, #8
	subs r1, r1, r0
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #3
	muls r0, r1, r0
	cmp r0, #0
	bge _080AD122
	adds r0, #0x3f
_080AD122:
	asrs r0, r0, #6
	adds r5, r6, #0
	adds r5, #0x3b
	strb r0, [r5]
	ldrb r0, [r5]
	movs r1, #3
	bl __udivsi3
	movs r1, #0x14
	subs r1, r1, r0
	adds r4, r6, #0
	adds r4, #0x3c
	strb r1, [r4]
	ldr r0, _080AD188 @ =gBg1Tm
	movs r1, #0
	bl TmFill
	ldr r0, _080AD18C @ =gUnk_08DAEC6C
	ldr r0, [r0]
	movs r1, #2
	str r1, [sp]
	movs r1, #0
	ldrsb r1, [r4, r1]
	adds r1, #1
	str r1, [sp, #4]
	movs r1, #0x1a
	str r1, [sp, #8]
	movs r1, #7
	str r1, [sp, #0xc]
	movs r1, #0
	movs r2, #0x19
	movs r3, #1
	bl sub_80A974C
	movs r0, #2
	bl EnableBgSync
	ldrb r1, [r5]
	cmp r1, #0
	bne _080AD17E
	adds r0, r6, #0
	adds r0, #0x30
	strb r1, [r0]
	adds r0, r6, #0
	bl Proc_Break
_080AD17E:
	add sp, #0x10
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080AD188: .4byte gBg1Tm
_080AD18C: .4byte gUnk_08DAEC6C

	thumb_func_start sub_80AD190
sub_80AD190: @ 0x080AD190
	push {lr}
	adds r1, r0, #0
	ldr r0, _080AD1A0 @ =gUnk_08DAECD0
	bl Proc_StartBlocking
	pop {r1}
	bx r1
	.align 2, 0
_080AD1A0: .4byte gUnk_08DAECD0

	thumb_func_start sub_80AD1A4
sub_80AD1A4: @ 0x080AD1A4
	push {r4, r5, r6, lr}
	ldr r6, _080AD244 @ =0x06014000
	ldr r4, _080AD248 @ =0x0201EA50
	adds r0, r4, #0
	adds r1, r6, #0
	movs r2, #5
	bl InitSpriteTextFont
	ldr r0, _080AD24C @ =Pal_Text
	movs r5, #0xd0
	lsls r5, r5, #2
	adds r1, r5, #0
	movs r2, #0x40
	bl ApplyPaletteExt
	ldr r0, _080AD250 @ =gPal
	adds r0, r0, r5
	movs r1, #0
	strh r1, [r0]
	bl EnablePalSync
	adds r0, r4, #0
	bl SetTextFont
	adds r0, r4, #0
	adds r0, #0x18
	bl InitSpriteText
	adds r0, r4, #0
	adds r0, #0x20
	bl InitSpriteText
	adds r4, #0x28
	movs r5, #2
_080AD1E8:
	adds r0, r4, #0
	bl InitSpriteText
	adds r4, #8
	subs r5, #1
	cmp r5, #0
	bge _080AD1E8
	movs r0, #0
	bl SetTextFont
	ldr r4, _080AD248 @ =0x0201EA50
	ldr r0, _080AD254 @ =0x0001FFFF
	ands r0, r6
	lsrs r0, r0, #5
	ldr r2, _080AD258 @ =0x000003FF
	adds r1, r2, #0
	ands r0, r1
	movs r2, #0xa0
	lsls r2, r2, #8
	adds r1, r2, #0
	adds r0, r0, r1
	adds r1, r4, #0
	adds r1, #0x48
	strh r0, [r1]
	movs r0, #0
	bl SetTextFont
	movs r0, #0
	bl SetTextFontGlyphs
	adds r4, #0x40
	adds r0, r4, #0
	movs r1, #2
	bl InitText
	adds r0, r4, #0
	bl ClearText
	ldr r1, _080AD25C @ =gUnk_08439BE4
	adds r0, r4, #0
	bl Text_DrawString
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080AD244: .4byte 0x06014000
_080AD248: .4byte 0x0201EA50
_080AD24C: .4byte Pal_Text
_080AD250: .4byte gPal
_080AD254: .4byte 0x0001FFFF
_080AD258: .4byte 0x000003FF
_080AD25C: .4byte gUnk_08439BE4

	thumb_func_start sub_80AD260
sub_80AD260: @ 0x080AD260
	push {r4, r5, lr}
	adds r1, r0, #0
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	bne _080AD278
	ldr r0, _080AD274 @ =gUnk_08DAEB74
	ldr r5, [r0]
	b _080AD282
	.align 2, 0
_080AD274: .4byte gUnk_08DAEB74
_080AD278:
	ldr r0, _080AD2C8 @ =gUnk_08DAE514
	lsls r1, r1, #4
	adds r0, #0xc
	adds r1, r1, r0
	ldr r5, [r1]
_080AD282:
	ldr r4, _080AD2CC @ =0x0201EA50
	adds r0, r4, #0
	bl SetTextFont
	movs r0, #1
	bl SetTextFontGlyphs
	adds r4, #0x18
	adds r0, r4, #0
	movs r1, #0
	bl SpriteText_DrawBackgroundExt
	movs r0, #0xb0
	adds r1, r5, #0
	bl GetStringTextCenteredPos
	adds r1, r0, #0
	adds r0, r4, #0
	bl Text_SetCursor
	adds r0, r4, #0
	movs r1, #0
	bl Text_SetColor
	adds r0, r4, #0
	adds r1, r5, #0
	bl Text_DrawString
	movs r0, #0
	bl SetTextFont
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080AD2C8: .4byte gUnk_08DAE514
_080AD2CC: .4byte 0x0201EA50

	thumb_func_start sub_80AD2D0
sub_80AD2D0: @ 0x080AD2D0
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	mov sl, r0
	lsls r1, r1, #0x10
	lsrs r7, r1, #0x10
	cmp r7, #0x20
	bls _080AD380
	movs r0, #0xff
	mov r1, sl
	ands r1, r0
	mov sl, r1
	ldr r4, _080AD390 @ =gSinLut
	movs r2, #0x80
	adds r2, r2, r4
	mov sb, r2
	movs r1, #0
	ldrsh r0, [r2, r1]
	lsls r0, r0, #4
	movs r2, #0x80
	lsls r2, r2, #1
	mov r8, r2
	mov r1, r8
	bl Div
	adds r6, r0, #0
	lsls r6, r6, #0x10
	asrs r6, r6, #0x10
	movs r1, #0
	ldrsh r0, [r4, r1]
	rsbs r0, r0, #0
	lsls r0, r0, #4
	adds r1, r7, #0
	bl Div
	adds r5, r0, #0
	lsls r5, r5, #0x10
	asrs r5, r5, #0x10
	movs r2, #0
	ldrsh r0, [r4, r2]
	lsls r0, r0, #4
	mov r1, r8
	bl Div
	adds r4, r0, #0
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	mov r1, sb
	movs r2, #0
	ldrsh r0, [r1, r2]
	lsls r0, r0, #4
	adds r1, r7, #0
	bl Div
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	str r0, [sp]
	movs r0, #0
	adds r1, r6, #0
	adds r2, r5, #0
	adds r3, r4, #0
	bl SetObjAffine
	movs r4, #0
	ldr r6, _080AD394 @ =0x0201EA98
	movs r5, #0x20
_080AD35A:
	lsls r0, r4, #2
	ldrh r1, [r6]
	adds r0, r1, r0
	movs r2, #0x80
	lsls r2, r2, #5
	adds r0, r0, r2
	str r0, [sp]
	movs r0, #4
	adds r1, r5, #0
	movs r2, #0x80
	lsls r2, r2, #1
	add r2, sl
	ldr r3, _080AD398 @ =Sprite_32x16
	bl PutSpriteExt
	adds r5, #0x20
	adds r4, #1
	cmp r4, #4
	ble _080AD35A
_080AD380:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080AD390: .4byte gSinLut
_080AD394: .4byte 0x0201EA98
_080AD398: .4byte Sprite_32x16

	thumb_func_start sub_80AD39C
sub_80AD39C: @ 0x080AD39C
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #4
	mov sb, r0
	mov r8, r1
	adds r4, r2, #0
	movs r6, #0
	movs r7, #0xd
	cmp r3, #0
	beq _080AD40A
	movs r0, #0xff
	ands r1, r0
	mov r8, r1
	cmp r4, #7
	ble _080AD3EC
	mov r5, sb
_080AD3C0:
	subs r4, #8
	ldr r1, _080AD418 @ =0x000001FF
	ands r1, r5
	lsls r0, r7, #0xc
	ldr r2, _080AD41C @ =0x00000847
	adds r0, r0, r2
	str r0, [sp]
	movs r0, #0
	mov r2, r8
	ldr r3, _080AD420 @ =Sprite_8x8
	bl PutSpriteExt
	adds r5, #8
	adds r6, #1
	cmp r6, #2
	ble _080AD3E2
	movs r7, #0xe
_080AD3E2:
	cmp r6, #4
	ble _080AD3E8
	movs r7, #0xf
_080AD3E8:
	cmp r4, #7
	bgt _080AD3C0
_080AD3EC:
	lsls r1, r6, #3
	add r1, sb
	ldr r0, _080AD418 @ =0x000001FF
	ands r1, r0
	ldr r3, _080AD420 @ =Sprite_8x8
	lsls r0, r7, #0xc
	adds r0, r4, r0
	movs r2, #0x84
	lsls r2, r2, #4
	adds r0, r0, r2
	str r0, [sp]
	movs r0, #0
	mov r2, r8
	bl PutSpriteExt
_080AD40A:
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080AD418: .4byte 0x000001FF
_080AD41C: .4byte 0x00000847
_080AD420: .4byte Sprite_8x8

	thumb_func_start sub_80AD424
sub_80AD424: @ 0x080AD424
	push {r4, r5, r6, r7, lr}
	ldr r7, [r0, #0x14]
	ldr r0, _080AD45C @ =0x0201EA9C
	movs r6, #0x40
	adds r5, r0, #0
	adds r5, #0x30
	movs r4, #1
_080AD432:
	ldrb r3, [r5]
	adds r0, r7, #0
	adds r0, #0x3d
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r0, r0, #3
	adds r0, #0x18
	adds r1, r6, #0
	adds r2, r3, #0
	bl sub_80AD39C
	adds r6, #8
	adds r5, #0x31
	subs r4, #1
	cmp r4, #0
	bge _080AD432
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080AD45C: .4byte 0x0201EA9C

	thumb_func_start sub_80AD460
sub_80AD460: @ 0x080AD460
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #4
	adds r6, r0, #0
	adds r7, r1, #0
	adds r0, r2, #0
	movs r1, #0x3c
	bl __divsi3
	adds r5, r0, #0
	movs r1, #0x3c
	bl __divsi3
	adds r4, r0, #0
	adds r0, r5, #0
	movs r1, #0x3c
	bl __modsi3
	mov r8, r0
	ldr r3, _080AD4E8 @ =gUnk_08DAEE40
	movs r5, #0x80
	lsls r5, r5, #7
	str r5, [sp]
	movs r0, #0
	adds r1, r6, #0
	adds r2, r7, #0
	bl PutSpriteExt
	adds r1, r6, #0
	adds r1, #0x28
	ldr r0, _080AD4EC @ =gUnk_08DAEEA8
	mov sb, r0
	lsls r4, r4, #2
	add r4, sb
	ldr r3, [r4]
	str r5, [sp]
	movs r0, #0
	adds r2, r7, #0
	bl PutSpriteExt
	adds r1, r6, #0
	adds r1, #0x30
	ldr r3, _080AD4F0 @ =gUnk_08DAEE4E
	str r5, [sp]
	movs r0, #0
	adds r2, r7, #0
	bl PutSpriteExt
	mov r0, r8
	cmp r0, #9
	ble _080AD4F4
	adds r4, r6, #0
	adds r4, #0x38
	movs r1, #0xa
	bl __divsi3
	lsls r0, r0, #2
	add r0, sb
	ldr r3, [r0]
	str r5, [sp]
	movs r0, #0
	adds r1, r4, #0
	adds r2, r7, #0
	bl PutSpriteExt
	b _080AD506
	.align 2, 0
_080AD4E8: .4byte gUnk_08DAEE40
_080AD4EC: .4byte gUnk_08DAEEA8
_080AD4F0: .4byte gUnk_08DAEE4E
_080AD4F4:
	adds r1, r6, #0
	adds r1, #0x38
	mov r0, sb
	ldr r3, [r0]
	str r5, [sp]
	movs r0, #0
	adds r2, r7, #0
	bl PutSpriteExt
_080AD506:
	adds r5, r6, #0
	adds r5, #0x40
	ldr r4, _080AD538 @ =gUnk_08DAEEA8
	mov r0, r8
	movs r1, #0xa
	bl __modsi3
	lsls r0, r0, #2
	adds r0, r0, r4
	ldr r3, [r0]
	movs r0, #0x80
	lsls r0, r0, #7
	str r0, [sp]
	movs r0, #0
	adds r1, r5, #0
	adds r2, r7, #0
	bl PutSpriteExt
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080AD538: .4byte gUnk_08DAEEA8

	thumb_func_start sub_80AD53C
sub_80AD53C: @ 0x080AD53C
	movs r1, #0
	str r1, [r0, #0x2c]
	bx lr
	.align 2, 0

	thumb_func_start sub_80AD544
sub_80AD544: @ 0x080AD544
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r7, r0, #0
	ldr r6, [r7, #0x14]
	adds r4, r6, #0
	adds r4, #0x3c
	movs r0, #0
	ldrsb r0, [r4, r0]
	lsls r0, r0, #3
	adds r0, #0x18
	movs r1, #0x80
	lsls r1, r1, #1
	bl sub_80AD2D0
	adds r0, r6, #0
	adds r0, #0x30
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _080AD5EA
	movs r0, #0
	ldrsb r0, [r4, r0]
	lsls r4, r0, #3
	adds r4, #0x30
	movs r5, #0xff
	ands r4, r5
	movs r2, #0xc
	subs r2, r2, r0
	lsls r2, r2, #3
	adds r2, #4
	ands r2, r5
	movs r0, #0x80
	lsls r0, r0, #3
	adds r2, r2, r0
	ldr r3, _080AD644 @ =gUnk_08DAEDF8
	movs r0, #0xa0
	lsls r0, r0, #7
	str r0, [sp]
	movs r0, #0
	movs r1, #4
	bl PutSpriteExt
	adds r2, r4, #1
	ands r2, r5
	ldr r3, _080AD648 @ =gUnk_08DAEE18
	movs r5, #0x80
	lsls r5, r5, #7
	str r5, [sp]
	movs r0, #0
	movs r1, #0x88
	bl PutSpriteExt
	ldrh r1, [r6, #0x2c]
	lsls r0, r1, #5
	adds r0, r0, r1
	lsls r0, r0, #1
	ldr r2, _080AD64C @ =gUnk_08DAE514
	adds r1, r6, #0
	adds r1, #0x32
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	lsls r1, r1, #4
	adds r2, #4
	adds r1, r1, r2
	ldr r1, [r1]
	adds r1, #0x78
	bl __divsi3
	adds r1, r0, #0
	adds r1, #0x88
	ldr r3, _080AD650 @ =gUnk_08DAEE38
	str r5, [sp]
	movs r0, #0
	adds r2, r4, #0
	bl PutSpriteExt
	ldrh r2, [r6, #0x2c]
	movs r0, #0x3c
	adds r1, r4, #0
	bl sub_80AD460
_080AD5EA:
	adds r6, #0x3d
	movs r1, #0
	ldrsb r1, [r6, r1]
	lsls r1, r1, #3
	adds r1, #0x16
	ldr r5, _080AD654 @ =0x000001FF
	ands r1, r5
	ldr r3, _080AD658 @ =gUnk_08DAEDE0
	movs r4, #0x80
	lsls r4, r4, #7
	str r4, [sp]
	movs r0, #0xb
	movs r2, #0x58
	bl PutSprite
	movs r1, #0
	ldrsb r1, [r6, r1]
	lsls r1, r1, #3
	adds r1, #0x16
	ands r1, r5
	ldr r3, _080AD65C @ =gUnk_08DAEDE8
	str r4, [sp]
	movs r0, #0xb
	movs r2, #0x68
	bl PutSprite
	movs r1, #0
	ldrsb r1, [r6, r1]
	lsls r1, r1, #3
	adds r1, #0x16
	ands r1, r5
	ldr r3, _080AD660 @ =gUnk_08DAEDF0
	str r4, [sp]
	movs r0, #0xb
	movs r2, #0x78
	bl PutSprite
	adds r0, r7, #0
	bl sub_80AD424
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080AD644: .4byte gUnk_08DAEDF8
_080AD648: .4byte gUnk_08DAEE18
_080AD64C: .4byte gUnk_08DAE514
_080AD650: .4byte gUnk_08DAEE38
_080AD654: .4byte 0x000001FF
_080AD658: .4byte gUnk_08DAEDE0
_080AD65C: .4byte gUnk_08DAEDE8
_080AD660: .4byte gUnk_08DAEDF0

	thumb_func_start sub_80AD664
sub_80AD664: @ 0x080AD664
	push {lr}
	adds r1, r0, #0
	ldr r0, _080AD674 @ =gUnk_08DAEED0
	bl Proc_Start
	pop {r1}
	bx r1
	.align 2, 0
_080AD674: .4byte gUnk_08DAEED0

	thumb_func_start sub_80AD678
sub_80AD678: @ 0x080AD678
	push {lr}
	adds r0, #0x4c
	movs r1, #0
	strh r1, [r0]
	bl ArchiveCurrentPalettes
	pop {r0}
	bx r0

	thumb_func_start sub_80AD688
sub_80AD688: @ 0x080AD688
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r2, r5, #0
	adds r2, #0x4c
	ldrh r0, [r2]
	adds r1, r0, #1
	strh r1, [r2]
	lsls r0, r0, #0x10
	asrs r0, r0, #0xc
	movs r4, #0x80
	lsls r4, r4, #1
	subs r4, r4, r0
	movs r3, #0xff
	lsls r3, r3, #8
	adds r0, r4, #0
	adds r1, r4, #0
	adds r2, r4, #0
	bl WriteFadedPaletteFromArchive
	cmp r4, #0
	bne _080AD6B8
	adds r0, r5, #0
	bl Proc_Break
_080AD6B8:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_80AD6C0
sub_80AD6C0: @ 0x080AD6C0
	push {r4, lr}
	sub sp, #4
	adds r4, r0, #0
	ldr r0, _080AD700 @ =gBg3Tm
	movs r1, #0x80
	lsls r1, r1, #8
	ldr r2, [r4, #0x58]
	str r2, [sp]
	movs r2, #8
	movs r3, #8
	bl sub_80B7980
	bl ArchiveCurrentPalettes
	movs r3, #0xff
	lsls r3, r3, #8
	movs r0, #0
	movs r1, #0
	movs r2, #0
	bl WriteFadedPaletteFromArchive
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
_080AD700: .4byte gBg3Tm

	thumb_func_start sub_80AD704
sub_80AD704: @ 0x080AD704
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r1, r5, #0
	adds r1, #0x4c
	ldrh r4, [r1]
	adds r0, r4, #1
	strh r0, [r1]
	lsls r4, r4, #0x10
	asrs r4, r4, #0xc
	movs r3, #0xff
	lsls r3, r3, #8
	adds r0, r4, #0
	adds r1, r4, #0
	adds r2, r4, #0
	bl WriteFadedPaletteFromArchive
	movs r0, #0x80
	lsls r0, r0, #1
	cmp r4, r0
	bne _080AD732
	adds r0, r5, #0
	bl Proc_Break
_080AD732:
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start sub_80AD738
sub_80AD738: @ 0x080AD738
	push {lr}
	ldr r0, _080AD748 @ =gUnk_08DAEEF0
	bl Proc_Find
	cmp r0, #0
	bne _080AD74C
	movs r0, #0
	b _080AD74E
	.align 2, 0
_080AD748: .4byte gUnk_08DAEEF0
_080AD74C:
	movs r0, #1
_080AD74E:
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_80AD754
sub_80AD754: @ 0x080AD754
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	bl sub_80AD738
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080AD76E
	ldr r0, _080AD774 @ =gUnk_08DAEEF0
	adds r1, r4, #0
	bl Proc_Start
	str r5, [r0, #0x58]
_080AD76E:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080AD774: .4byte gUnk_08DAEEF0

	thumb_func_start sub_80AD778
sub_80AD778: @ 0x080AD778
	push {r4, lr}
	ldr r0, _080AD7B0 @ =0x04000006
	ldrh r0, [r0]
	adds r0, #1
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	cmp r2, #0xa0
	bls _080AD78A
	movs r2, #0
_080AD78A:
	movs r0, #1
	ands r0, r2
	cmp r0, #0
	bne _080AD7CE
	cmp r2, #0x63
	bhi _080AD7BC
	ldr r1, _080AD7B4 @ =0x04000050
	movs r0, #0xc1
	strh r0, [r1]
	ldr r4, _080AD7B8 @ =0x04000054
	movs r0, #0x64
	subs r0, r0, r2
	lsls r0, r0, #4
	movs r1, #0x64
	bl __divsi3
	strh r0, [r4]
	b _080AD7CE
	.align 2, 0
_080AD7B0: .4byte 0x04000006
_080AD7B4: .4byte 0x04000050
_080AD7B8: .4byte 0x04000054
_080AD7BC:
	ldr r1, _080AD7D4 @ =0x04000050
	movs r2, #0xa2
	lsls r2, r2, #1
	adds r0, r2, #0
	strh r0, [r1]
	adds r1, #2
	ldr r2, _080AD7D8 @ =0x0000100A
	adds r0, r2, #0
	strh r0, [r1]
_080AD7CE:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080AD7D4: .4byte 0x04000050
_080AD7D8: .4byte 0x0000100A

	thumb_func_start sub_80AD7DC
sub_80AD7DC: @ 0x080AD7DC
	push {lr}
	movs r1, #4
	str r1, [r0, #0x58]
	ldr r0, _080AD810 @ =gUnk_08DAEF20
	bl InitBgs
	ldr r2, _080AD814 @ =gDispIo
	movs r0, #8
	rsbs r0, r0, #0
	ldrb r1, [r2]
	ands r0, r1
	movs r1, #1
	orrs r0, r1
	strb r0, [r2]
	movs r0, #0x3f
	ldrb r1, [r2, #0x15]
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	movs r1, #0x21
	rsbs r1, r1, #0
	ands r0, r1
	strb r0, [r2, #0x15]
	pop {r0}
	bx r0
	.align 2, 0
_080AD810: .4byte gUnk_08DAEF20
_080AD814: .4byte gDispIo

	thumb_func_start sub_80AD818
sub_80AD818: @ 0x080AD818
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r0, _080AD8D8 @ =gUnk_0842D800
	movs r1, #0
	movs r2, #0x60
	bl ApplyPaletteExt
	ldr r0, _080AD8DC @ =gUnk_08439BF0
	ldr r1, _080AD8E0 @ =0x06001000
	bl Decompress
	ldr r0, _080AD8E4 @ =gBg0Tm
	ldr r1, _080AD8E8 @ =gUnk_0842D860
	movs r2, #0x80
	bl TmApplyTsa_thm
	movs r0, #1
	bl EnableBgSync
	ldr r0, _080AD8EC @ =gUnk_08432594
	movs r1, #0x88
	lsls r1, r1, #2
	movs r2, #0x80
	lsls r2, r2, #1
	bl ApplyPaletteExt
	ldr r0, _080AD8F0 @ =gUnk_0842FF00
	ldr r1, _080AD8F4 @ =0x06010800
	bl Decompress
	ldr r0, _080AD8F8 @ =gUnk_0843165C
	ldr r1, _080AD8FC @ =0x06013800
	bl Decompress
	ldr r0, _080AD900 @ =sub_80AD778
	bl SetOnHBlankA
	ldr r4, _080AD904 @ =gUnk_0842DD14
	movs r0, #2
	bl GetBgChrOffset
	adds r1, r0, #0
	movs r0, #0xc0
	lsls r0, r0, #0x13
	adds r1, r1, r0
	adds r0, r4, #0
	bl Decompress
	ldr r0, _080AD908 @ =gBg3Tm
	ldr r1, _080AD90C @ =gUnk_0842FD94
	movs r2, #0
	movs r3, #5
	bl sub_8001F14
	movs r0, #8
	bl EnableBgSync
	ldr r4, _080AD910 @ =gDispIo
	movs r0, #0x21
	rsbs r0, r0, #0
	ldrb r1, [r4, #1]
	ands r0, r1
	movs r1, #0x41
	rsbs r1, r1, #0
	ands r0, r1
	movs r1, #0x7f
	ands r0, r1
	strb r0, [r4, #1]
	adds r0, r5, #0
	bl sub_80A69A0
	str r0, [r5, #0x54]
	movs r0, #3
	ldrb r2, [r4, #0xc]
	orrs r0, r2
	strb r0, [r4, #0xc]
	movs r1, #4
	rsbs r1, r1, #0
	adds r0, r1, #0
	ldrb r2, [r4, #0x10]
	ands r0, r2
	strb r0, [r4, #0x10]
	adds r0, r1, #0
	ldrb r2, [r4, #0x14]
	ands r0, r2
	movs r2, #2
	orrs r0, r2
	strb r0, [r4, #0x14]
	ldrb r0, [r4, #0x18]
	ands r1, r0
	orrs r1, r2
	strb r1, [r4, #0x18]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080AD8D8: .4byte gUnk_0842D800
_080AD8DC: .4byte gUnk_08439BF0
_080AD8E0: .4byte 0x06001000
_080AD8E4: .4byte gBg0Tm
_080AD8E8: .4byte gUnk_0842D860
_080AD8EC: .4byte gUnk_08432594
_080AD8F0: .4byte gUnk_0842FF00
_080AD8F4: .4byte 0x06010800
_080AD8F8: .4byte gUnk_0843165C
_080AD8FC: .4byte 0x06013800
_080AD900: .4byte sub_80AD778
_080AD904: .4byte gUnk_0842DD14
_080AD908: .4byte gBg3Tm
_080AD90C: .4byte gUnk_0842FD94
_080AD910: .4byte gDispIo

	thumb_func_start sub_80AD914
sub_80AD914: @ 0x080AD914
	push {lr}
	ldr r0, [r0, #0x54]
	bl Proc_End
	pop {r0}
	bx r0

	thumb_func_start sub_80AD920
sub_80AD920: @ 0x080AD920
	push {r4, lr}
	sub sp, #4
	adds r4, r0, #0
	ldr r0, [r4, #0x58]
	cmp r0, #0
	blt _080AD958
	ldr r3, _080AD960 @ =gUnk_08DAD8A8
	movs r0, #0x80
	lsls r0, r0, #6
	str r0, [sp]
	movs r0, #4
	movs r1, #0x38
	movs r2, #8
	bl PutSpriteExt
	ldr r1, _080AD964 @ =gUnk_08DADD34
	ldr r0, [r4, #0x58]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r3, [r0]
	movs r0, #0xc0
	lsls r0, r0, #6
	str r0, [sp]
	movs r0, #4
	movs r1, #0x40
	movs r2, #0x10
	bl PutSpriteExt
_080AD958:
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080AD960: .4byte gUnk_08DAD8A8
_080AD964: .4byte gUnk_08DADD34

	thumb_func_start sub_80AD968
sub_80AD968: @ 0x080AD968
	push {lr}
	adds r1, r0, #0
	ldr r0, _080AD978 @ =gUnk_08DAEF38
	bl Proc_Start
	pop {r0}
	bx r0
	.align 2, 0
_080AD978: .4byte gUnk_08DAEF38

	thumb_func_start sub_80AD97C
sub_80AD97C: @ 0x080AD97C
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _080AD990 @ =gUnk_08DAEF38
	bl Proc_Find
	str r4, [r0, #0x58]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080AD990: .4byte gUnk_08DAEF38

	thumb_func_start sub_80AD994
sub_80AD994: @ 0x080AD994
	push {lr}
	sub sp, #4
	ldr r0, _080AD9C8 @ =gUnk_08DADD84
	ldr r3, [r0]
	movs r0, #0x80
	lsls r0, r0, #8
	str r0, [sp]
	movs r0, #4
	movs r1, #0xc
	movs r2, #8
	bl PutSpriteExt
	ldr r0, _080AD9CC @ =gUnk_08DADD78
	ldr r3, [r0]
	movs r0, #0x90
	lsls r0, r0, #8
	str r0, [sp]
	movs r0, #4
	movs r1, #0x18
	movs r2, #0x10
	bl PutSpriteExt
	add sp, #4
	pop {r0}
	bx r0
	.align 2, 0
_080AD9C8: .4byte gUnk_08DADD84
_080AD9CC: .4byte gUnk_08DADD78

	thumb_func_start sub_80AD9D0
sub_80AD9D0: @ 0x080AD9D0
	push {r4, r5, lr}
	ldr r5, _080ADA38 @ =gPlaySt
	movs r2, #0x40
	adds r0, r2, #0
	ldrb r1, [r5, #0x14]
	ands r0, r1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	rsbs r0, r0, #0
	asrs r4, r0, #0x1f
	movs r0, #4
	ands r4, r0
	ldrb r1, [r5, #0x1b]
	cmp r1, #1
	bne _080AD9F2
	movs r0, #0x10
	orrs r4, r0
_080AD9F2:
	cmp r1, #2
	bne _080AD9FA
	movs r0, #0x20
	orrs r4, r0
_080AD9FA:
	cmp r1, #3
	bne _080ADA00
	orrs r4, r2
_080ADA00:
	movs r0, #1
	orrs r0, r4
	movs r1, #0x18
	bl sub_8082DB8
	adds r0, r4, #0
	movs r1, #0x19
	bl sub_8082DB8
	bl EnablePalSync
	movs r0, #0xac
	lsls r0, r0, #4
	bl sub_8082E6C
	movs r4, #0xb4
	lsls r4, r4, #4
	adds r0, r5, #0
	bl sub_8082F30
	adds r1, r0, #0
	adds r0, r4, #0
	bl sub_8082E2C
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080ADA38: .4byte gPlaySt

	thumb_func_start sub_80ADA3C
sub_80ADA3C: @ 0x080ADA3C
	push {r4, r5, lr}
	ldr r0, _080ADA8C @ =0x04000006
	ldrh r0, [r0]
	adds r0, #1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	cmp r5, #0xa0
	bls _080ADA4E
	movs r5, #0
_080ADA4E:
	movs r0, #1
	ands r0, r5
	cmp r0, #0
	bne _080ADA86
	cmp r5, #0x63
	bhi _080ADA70
	ldr r1, _080ADA90 @ =0x04000050
	movs r0, #0xc8
	strh r0, [r1]
	ldr r4, _080ADA94 @ =0x04000054
	movs r0, #0x64
	subs r0, r0, r5
	lsls r0, r0, #4
	movs r1, #0x64
	bl __divsi3
	strh r0, [r4]
_080ADA70:
	cmp r5, #0
	bne _080ADA7C
	ldr r0, _080ADA98 @ =0x04000012
	ldr r1, _080ADA9C @ =gDispIo
	ldrh r1, [r1, #0x1e]
	strh r1, [r0]
_080ADA7C:
	cmp r5, #0x78
	bne _080ADA86
	ldr r1, _080ADA98 @ =0x04000012
	movs r0, #4
	strh r0, [r1]
_080ADA86:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080ADA8C: .4byte 0x04000006
_080ADA90: .4byte 0x04000050
_080ADA94: .4byte 0x04000054
_080ADA98: .4byte 0x04000012
_080ADA9C: .4byte gDispIo

	thumb_func_start sub_80ADAA0
sub_80ADAA0: @ 0x080ADAA0
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #8
	movs r0, #0
	mov r8, r0
	mov r0, sp
	mov r1, r8
	strh r1, [r0]
	ldr r0, _080ADB0C @ =gUnk_08DAEF68
	ldr r1, [r0]
	ldr r2, _080ADB10 @ =0x01000040
	mov r0, sp
	bl CpuSet
	mov r0, sp
	adds r0, #2
	mov r2, r8
	strh r2, [r0]
	ldr r4, _080ADB14 @ =gUnk_08DAEF60
	ldr r1, [r4]
	ldr r2, _080ADB18 @ =0x01000142
	bl CpuSet
	ldr r0, [r4]
	bl sub_809FB70
	cmp r0, #0
	beq _080ADBA6
	ldr r0, [r4]
	ldr r1, _080ADB1C @ =gUnk_08DAEF64
	ldr r1, [r1]
	movs r2, #0xa1
	bl CpuFastSet
	movs r3, #0
	movs r7, #0
_080ADAEA:
	ldr r0, _080ADB14 @ =gUnk_08DAEF60
	ldr r1, [r0]
	adds r2, r1, r7
	movs r1, #3
	ldrb r4, [r2]
	ands r1, r4
	cmp r1, #0
	beq _080ADB8E
	ldrb r1, [r2, #1]
	cmp r1, #1
	beq _080ADB26
	cmp r1, #1
	bgt _080ADB20
	cmp r1, #0
	beq _080ADB32
	b _080ADB70
	.align 2, 0
_080ADB0C: .4byte gUnk_08DAEF68
_080ADB10: .4byte 0x01000040
_080ADB14: .4byte gUnk_08DAEF60
_080ADB18: .4byte 0x01000142
_080ADB1C: .4byte gUnk_08DAEF64
_080ADB20:
	cmp r1, #2
	beq _080ADB32
	b _080ADB70
_080ADB26:
	ldr r0, _080ADB5C @ =gPlaySt
	adds r0, #0x2b
	ldrb r0, [r0]
	ands r1, r0
	cmp r1, #0
	beq _080ADB8E
_080ADB32:
	ldr r5, _080ADB60 @ =gUnk_08DAEF68
	ldr r0, [r5]
	mov r1, r8
	lsls r4, r1, #2
	adds r0, r4, r0
	movs r6, #0
	strb r3, [r0]
	str r3, [sp, #4]
	bl sub_80A0F08
	movs r2, #1
	adds r1, r2, #0
	ldr r3, [sp, #4]
	lsls r1, r3
	ands r1, r0
	cmp r1, #0
	beq _080ADB64
	ldr r0, [r5]
	adds r0, r4, r0
	strb r6, [r0, #1]
	b _080ADB6A
	.align 2, 0
_080ADB5C: .4byte gPlaySt
_080ADB60: .4byte gUnk_08DAEF68
_080ADB64:
	ldr r0, [r5]
	adds r0, r4, r0
	strb r2, [r0, #1]
_080ADB6A:
	movs r2, #1
	add r8, r2
	ldr r0, _080ADBB0 @ =gUnk_08DAEF60
_080ADB70:
	ldr r1, [r0]
	adds r1, r1, r7
	movs r0, #3
	ldrb r1, [r1]
	ands r0, r1
	cmp r0, #1
	bne _080ADB8E
	ldr r0, _080ADBB4 @ =gUnk_08DAEF64
	ldr r1, [r0]
	adds r1, r1, r7
	movs r0, #0xfc
	ldrb r4, [r1]
	ands r0, r4
	adds r0, #2
	strb r0, [r1]
_080ADB8E:
	adds r7, #0x14
	adds r3, #1
	cmp r3, #0x1f
	ble _080ADAEA
	ldr r0, _080ADBB8 @ =gUnk_08DAEF6C
	ldr r0, [r0]
	mov r1, r8
	str r1, [r0]
	ldr r0, _080ADBB4 @ =gUnk_08DAEF64
	ldr r0, [r0]
	bl SaveBonusContentData
_080ADBA6:
	mov r2, r8
	cmp r2, #0
	beq _080ADBBC
	movs r0, #1
	b _080ADBBE
	.align 2, 0
_080ADBB0: .4byte gUnk_08DAEF60
_080ADBB4: .4byte gUnk_08DAEF64
_080ADBB8: .4byte gUnk_08DAEF6C
_080ADBBC:
	movs r0, #0
_080ADBBE:
	add sp, #8
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_80ADBCC
sub_80ADBCC: @ 0x080ADBCC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x14
	adds r5, r0, #0
	ldr r4, _080ADC70 @ =gUnk_08DAEF70
	movs r1, #6
	bl __modsi3
	lsls r0, r0, #4
	ldr r1, [r4]
	adds r6, r1, r0
	lsls r0, r5, #1
	str r0, [sp, #8]
	movs r0, #0x1f
	ldr r1, [sp, #8]
	ands r1, r0
	str r1, [sp, #8]
	ldr r0, _080ADC74 @ =gUnk_08DAEF68
	ldr r1, [r0]
	lsls r0, r5, #2
	adds r0, r0, r1
	ldrb r2, [r0, #1]
	str r2, [sp, #0xc]
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	str r0, [sp, #0x10]
	ldr r3, _080ADC78 @ =gUnk_08DAEF60
	ldr r1, [r3]
	lsls r0, r0, #2
	ldr r2, [sp, #0x10]
	adds r0, r0, r2
	lsls r7, r0, #2
	adds r1, r1, r7
	ldrb r1, [r1, #2]
	mov r8, r1
	movs r3, #0
	mov sb, r3
	ldr r0, [sp, #8]
	lsls r4, r0, #6
	ldr r1, _080ADC7C @ =gBg2Tm
	adds r1, r1, r4
	mov sl, r1
	mov r0, sl
	movs r1, #0x14
	movs r2, #1
	bl TmFillRect_thm
	adds r0, r6, #0
	bl ClearText
	cmp r5, #0x1f
	ble _080ADC3E
	b _080ADD40
_080ADC3E:
	ldr r2, _080ADC78 @ =gUnk_08DAEF60
	ldr r0, [r2]
	adds r0, r0, r7
	movs r2, #3
	ldrb r3, [r0]
	ands r2, r3
	cmp r2, #0
	beq _080ADD40
	cmp r2, #1
	bne _080ADC56
	movs r1, #4
	mov sb, r1
_080ADC56:
	ldr r2, [sp, #0xc]
	cmp r2, #0
	bne _080ADC60
	movs r3, #1
	mov sb, r3
_080ADC60:
	ldrb r0, [r0, #1]
	cmp r0, #0
	blt _080ADD02
	cmp r0, #1
	ble _080ADC80
	cmp r0, #2
	beq _080ADCD4
	b _080ADD02
	.align 2, 0
_080ADC70: .4byte gUnk_08DAEF70
_080ADC74: .4byte gUnk_08DAEF68
_080ADC78: .4byte gUnk_08DAEF60
_080ADC7C: .4byte gBg2Tm
_080ADC80:
	mov r0, r8
	bl GetItemName
	ldr r1, _080ADCD0 @ =gBg2Tm
	adds r1, #4
	adds r1, r4, r1
	movs r2, #0
	str r2, [sp]
	str r0, [sp, #4]
	adds r0, r6, #0
	mov r2, sb
	movs r3, #0
	bl PutDrawText
	ldr r0, _080ADCD0 @ =gBg2Tm
	adds r0, #0x14
	adds r5, r4, r0
	mov r4, sb
	cmp r4, #0
	bne _080ADCAA
	movs r4, #2
_080ADCAA:
	mov r0, r8
	bl GetItemMaxUses
	adds r2, r0, #0
	adds r0, r5, #0
	adds r1, r4, #0
	bl PutNumberOrBlank
	mov r0, r8
	bl sub_8017808
	adds r1, r0, #0
	movs r2, #0x80
	lsls r2, r2, #7
	mov r0, sl
	bl PutIcon
	b _080ADD02
	.align 2, 0
_080ADCD0: .4byte gBg2Tm
_080ADCD4:
	mov r0, r8
	bl GetItemName
	ldr r1, _080ADD50 @ =gBg2Tm
	adds r1, #4
	adds r1, r4, r1
	movs r2, #0
	str r2, [sp]
	str r0, [sp, #4]
	adds r0, r6, #0
	mov r2, sb
	movs r3, #0
	bl PutDrawText
	mov r0, r8
	bl sub_8017808
	adds r1, r0, #0
	movs r2, #0x80
	lsls r2, r2, #7
	mov r0, sl
	bl PutIcon
_080ADD02:
	adds r6, #8
	adds r0, r6, #0
	bl ClearText
	ldr r0, [sp, #8]
	lsls r1, r0, #6
	ldr r0, _080ADD54 @ =gBg2Tm + 0x18
	adds r5, r1, r0
	mov r2, sb
	cmp r2, #0
	bne _080ADD1A
	movs r2, #3
_080ADD1A:
	movs r0, #0
	str r0, [sp]
	ldr r0, _080ADD58 @ =gUnk_08DAEF60
	ldr r3, [sp, #0x10]
	lsls r1, r3, #2
	adds r1, r1, r3
	lsls r1, r1, #2
	ldr r0, [r0]
	adds r0, r0, r1
	adds r0, #3
	str r0, [sp, #4]
	adds r0, r6, #0
	adds r1, r5, #0
	movs r3, #0
	bl PutDrawText
	movs r0, #4
	bl EnableBgSync
_080ADD40:
	add sp, #0x14
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080ADD50: .4byte gBg2Tm
_080ADD54: .4byte gBg2Tm + 0x18
_080ADD58: .4byte gUnk_08DAEF60

	thumb_func_start sub_80ADD5C
sub_80ADD5C: @ 0x080ADD5C
	push {r4, r5, lr}
	ldr r1, _080ADD84 @ =gUnk_08DAEF68
	lsls r0, r0, #2
	ldr r4, [r1]
	adds r4, r4, r0
	movs r5, #0
	ldrsb r5, [r4, r5]
	bl sub_80A0F08
	adds r1, r0, #0
	movs r0, #1
	lsls r0, r5
	orrs r0, r1
	bl sub_80A0F14
	movs r0, #0
	strb r0, [r4, #1]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080ADD84: .4byte gUnk_08DAEF68

	thumb_func_start sub_80ADD88
sub_80ADD88: @ 0x080ADD88
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r6, r0, #0
	movs r4, #0
	movs r7, #0
	ldr r0, _080ADDEC @ =gPlaySt
	ldrb r0, [r0, #0x1b]
	cmp r0, #2
	bne _080ADD9E
	movs r7, #1
_080ADD9E:
	cmp r0, #3
	bne _080ADDA4
	movs r7, #2
_080ADDA4:
	bl ResetUnitSprites
	movs r5, #1
	adds r6, #0x2b
	mov r8, r6
	ldr r6, _080ADDF0 @ =gUnk_08DAEF74
_080ADDB0:
	adds r0, r5, #0
	bl GetUnit
	adds r2, r0, #0
	cmp r2, #0
	beq _080ADE12
	ldr r3, [r2]
	cmp r3, #0
	beq _080ADE12
	ldr r0, [r2, #0xc]
	ldr r1, _080ADDF4 @ =0x00010004
	ands r0, r1
	cmp r0, #0
	bne _080ADE12
	cmp r7, #0
	beq _080ADDF8
	ldrb r0, [r3, #4]
	cmp r0, r7
	bne _080ADDF8
	ldr r0, [r6]
	lsls r1, r4, #3
	adds r1, r1, r0
	str r2, [r1, #4]
	adds r4, #1
	adds r0, r2, #0
	bl GetUnitSMSId
	bl sub_8025278
	b _080ADE12
	.align 2, 0
_080ADDEC: .4byte gPlaySt
_080ADDF0: .4byte gUnk_08DAEF74
_080ADDF4: .4byte 0x00010004
_080ADDF8:
	ldrb r3, [r3, #4]
	cmp r3, #0x28
	bne _080ADE12
	ldr r0, [r6]
	lsls r1, r4, #3
	adds r1, r1, r0
	str r2, [r1, #4]
	adds r4, #1
	adds r0, r2, #0
	bl GetUnitSMSId
	bl sub_8025278
_080ADE12:
	adds r5, #1
	cmp r5, #0x3f
	ble _080ADDB0
	mov r0, r8
	strb r4, [r0]
	bl ApplyUnitSpritePalettes
	bl sub_8025A0C
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_80ADE30
sub_80ADE30: @ 0x080ADE30
	push {r4, lr}
	sub sp, #4
	movs r0, #0
	str r0, [sp]
	movs r0, #3
	movs r1, #6
	movs r2, #0x18
	movs r3, #0xc
	bl sub_804A4CC
	movs r0, #1
	str r0, [sp]
	movs r0, #0x12
	movs r1, #0x11
	movs r2, #0xa
	movs r3, #3
	bl sub_804A4CC
	ldr r4, _080ADE80 @ =gBg0Tm + 0x4b2
	bl GetGold
	adds r2, r0, #0
	adds r0, r4, #0
	movs r1, #2
	bl sub_8006068
	adds r4, #2
	adds r0, r4, #0
	movs r1, #3
	movs r2, #0x1e
	bl sub_8005FEC
	movs r0, #3
	bl EnableBgSync
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080ADE80: .4byte gBg0Tm + 0x4b2

	thumb_func_start sub_80ADE84
sub_80ADE84: @ 0x080ADE84
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	adds r6, r0, #0
	movs r0, #0
	bl InitBgs
	ldr r0, _080AE0A4 @ =gUnk_0842D800
	movs r1, #0xc0
	lsls r1, r1, #1
	movs r2, #0x60
	bl ApplyPaletteExt
	ldr r0, _080AE0A8 @ =gUnk_08439BF0
	ldr r1, _080AE0AC @ =0x06008000
	bl Decompress
	ldr r0, _080AE0B0 @ =gBg3Tm
	ldr r1, _080AE0B4 @ =gUnk_0842D860
	movs r2, #0xc0
	lsls r2, r2, #8
	bl TmApplyTsa_thm
	movs r0, #8
	bl EnableBgSync
	bl UnpackUiWindowFrameGraphics
	bl ResetText
	bl InitIcons
	movs r0, #4
	bl ApplyIconPalettes
	bl ApplySystemObjectsGraphics
	bl sub_80AD9D0
	bl sub_80ADE30
	ldr r0, _080AE0B8 @ =gDispIo
	mov ip, r0
	movs r0, #0x21
	rsbs r0, r0, #0
	mov r1, ip
	ldrb r1, [r1, #1]
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	movs r1, #0x7f
	ands r0, r1
	mov r2, ip
	strb r0, [r2, #1]
	mov r5, ip
	adds r5, #0x35
	movs r1, #1
	ldrb r0, [r5]
	orrs r0, r1
	movs r4, #2
	orrs r0, r4
	movs r2, #4
	orrs r0, r2
	movs r3, #8
	orrs r0, r3
	movs r2, #0x10
	orrs r0, r2
	strb r0, [r5]
	adds r5, #1
	ldrb r0, [r5]
	orrs r1, r0
	orrs r1, r4
	movs r0, #5
	rsbs r0, r0, #0
	ands r1, r0
	orrs r1, r3
	orrs r1, r2
	strb r1, [r5]
	mov r1, ip
	adds r1, #0x2f
	movs r0, #0
	strb r0, [r1]
	adds r1, #4
	movs r0, #0x38
	strb r0, [r1]
	subs r1, #5
	movs r0, #0xf0
	strb r0, [r1]
	adds r1, #4
	movs r0, #0x88
	strb r0, [r1]
	movs r1, #4
	rsbs r1, r1, #0
	adds r0, r1, #0
	mov r2, ip
	ldrb r2, [r2, #0xc]
	ands r0, r2
	mov r3, ip
	strb r0, [r3, #0xc]
	adds r0, r1, #0
	ldrb r2, [r3, #0x10]
	ands r0, r2
	orrs r0, r4
	strb r0, [r3, #0x10]
	ldrb r3, [r3, #0x14]
	ands r1, r3
	mov r0, ip
	strb r1, [r0, #0x14]
	movs r0, #3
	mov r1, ip
	ldrb r1, [r1, #0x18]
	orrs r0, r1
	mov r2, ip
	strb r0, [r2, #0x18]
	bl sub_80ADAA0
	movs r5, #0
	ldr r0, _080AE0BC @ =gUnk_08DAEF6C
	ldr r0, [r0]
	ldr r0, [r0]
	cmp r5, r0
	bge _080ADFAE
	ldr r7, _080AE0C0 @ =gUnk_08DAEF70
_080ADF80:
	lsls r0, r5, #4
	ldr r4, [r7]
	adds r4, r4, r0
	adds r0, r4, #0
	movs r1, #7
	bl InitText
	adds r4, #8
	adds r0, r4, #0
	movs r1, #0xa
	bl InitText
	adds r0, r5, #0
	bl sub_80ADBCC
	adds r5, #1
	cmp r5, #5
	bgt _080ADFAE
	ldr r0, _080AE0BC @ =gUnk_08DAEF6C
	ldr r0, [r0]
	ldr r0, [r0]
	cmp r5, r0
	blt _080ADF80
_080ADFAE:
	adds r3, r6, #0
	adds r3, #0x29
	str r3, [sp]
	movs r0, #0x2e
	adds r0, r0, r6
	mov sl, r0
	movs r1, #0x2a
	adds r1, r1, r6
	mov r8, r1
	movs r2, #0x2b
	adds r2, r2, r6
	mov sb, r2
	ldr r7, _080AE0C0 @ =gUnk_08DAEF70
	movs r4, #0x60
	movs r5, #1
_080ADFCC:
	ldr r0, [r7]
	adds r0, r0, r4
	movs r1, #6
	bl InitText
	adds r4, #8
	subs r5, #1
	cmp r5, #0
	bge _080ADFCC
	movs r5, #2
	ldr r0, _080AE0C0 @ =gUnk_08DAEF70
	ldr r0, [r0]
	adds r0, #0x70
	movs r1, #0xf
	bl InitText
	ldr r0, _080AE0C4 @ =sub_80AD994
	adds r1, r6, #0
	bl StartParallelWorker
	movs r0, #2
	bl EnableBgSync
	ldr r0, _080AE0C8 @ =sub_80ADA3C
	bl SetOnHBlankA
	movs r0, #0
	ldr r3, [sp]
	strb r0, [r3]
	movs r1, #0
	strh r0, [r6, #0x2c]
	mov r2, sl
	strb r1, [r2]
	mov r3, r8
	strb r1, [r3]
	mov r1, sb
	strb r5, [r1]
	str r0, [r6, #0x34]
	ldr r1, _080AE0CC @ =0x0000FFD8
	ldrh r2, [r6, #0x2c]
	subs r2, #0x38
	movs r0, #0xff
	ands r2, r0
	movs r0, #2
	bl SetBgOffset
	adds r0, r6, #0
	bl ResetSysHandCursor
	movs r0, #0xc0
	lsls r0, r0, #3
	movs r1, #1
	bl DisplaySysHandCursorTextShadow
	ldr r2, [sp]
	ldrb r2, [r2]
	lsls r1, r2, #4
	movs r3, #0x2c
	ldrsh r0, [r6, r3]
	subs r0, #0x38
	subs r1, r1, r0
	movs r3, #0x80
	lsls r3, r3, #4
	movs r0, #0x28
	movs r2, #0x13
	bl ShowSysHandCursor
	adds r0, r6, #0
	bl sub_8005E88
	adds r0, r6, #0
	bl sub_8090DD0
	movs r0, #0xc8
	movs r1, #0x44
	bl sub_8090DE4
	movs r0, #0x80
	lsls r0, r0, #2
	movs r1, #2
	bl sub_8090E38
	ldrh r1, [r6, #0x2c]
	ldr r0, _080AE0BC @ =gUnk_08DAEF6C
	ldr r0, [r0]
	ldrh r2, [r0]
	movs r0, #7
	movs r3, #5
	bl sub_8090E04
	adds r0, r6, #0
	bl sub_80A98C8
	adds r0, r6, #0
	bl sub_80ADD88
	ldr r0, _080AE0D0 @ =0x06013800
	movs r1, #5
	bl LoadHelpBoxGfx
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080AE0A4: .4byte gUnk_0842D800
_080AE0A8: .4byte gUnk_08439BF0
_080AE0AC: .4byte 0x06008000
_080AE0B0: .4byte gBg3Tm
_080AE0B4: .4byte gUnk_0842D860
_080AE0B8: .4byte gDispIo
_080AE0BC: .4byte gUnk_08DAEF6C
_080AE0C0: .4byte gUnk_08DAEF70
_080AE0C4: .4byte sub_80AD994
_080AE0C8: .4byte sub_80ADA3C
_080AE0CC: .4byte 0x0000FFD8
_080AE0D0: .4byte 0x06013800

	thumb_func_start sub_80AE0D4
sub_80AE0D4: @ 0x080AE0D4
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r5, r0, #0
	adds r6, r5, #0
	adds r6, #0x29
	ldrb r4, [r6]
	movs r0, #0x2e
	adds r0, r0, r5
	mov r8, r0
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _080AE0F4
	b _080AE2DE
_080AE0F4:
	ldr r0, _080AE130 @ =gpKeySt
	ldr r2, [r0]
	ldrh r1, [r2, #8]
	movs r7, #1
	adds r0, r7, #0
	ands r0, r1
	cmp r0, #0
	beq _080AE1E8
	ldr r0, _080AE134 @ =gUnk_08DAEF68
	ldr r1, [r0]
	lsls r0, r4, #2
	adds r0, r0, r1
	movs r4, #0
	ldrsb r4, [r0, r4]
	bl sub_80A0F08
	adds r1, r7, #0
	lsls r1, r4
	ands r1, r0
	cmp r1, #0
	beq _080AE13C
	movs r1, #1
	rsbs r1, r1, #0
	ldr r2, _080AE138 @ =0x0000072F
	adds r0, r1, #0
	adds r3, r5, #0
	bl sub_80ABB94
	b _080AE32A
	.align 2, 0
_080AE130: .4byte gpKeySt
_080AE134: .4byte gUnk_08DAEF68
_080AE138: .4byte 0x0000072F
_080AE13C:
	adds r0, r5, #0
	adds r0, #0x2b
	ldrb r0, [r0]
	cmp r0, #0
	beq _080AE1CC
	ldr r7, _080AE164 @ =gUnk_08DAEF60
	ldr r1, [r7]
	lsls r0, r4, #2
	adds r0, r0, r4
	lsls r4, r0, #2
	adds r1, r1, r4
	ldrb r0, [r1, #1]
	cmp r0, #0
	bge _080AE15A
	b _080AE32A
_080AE15A:
	cmp r0, #1
	ble _080AE168
	cmp r0, #2
	beq _080AE190
	b _080AE32A
	.align 2, 0
_080AE164: .4byte gUnk_08DAEF60
_080AE168:
	adds r0, r5, #0
	movs r1, #1
	bl Proc_Goto
	ldr r0, _080AE188 @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	bge _080AE17E
	b _080AE32A
_080AE17E:
	ldr r0, _080AE18C @ =0x0000038A
	bl m4aSongNumStart
	b _080AE32A
	.align 2, 0
_080AE188: .4byte gPlaySt
_080AE18C: .4byte 0x0000038A
_080AE190:
	ldrb r1, [r1, #2]
	cmp r1, #0x97
	bne _080AE19C
	ldr r0, _080AE1C4 @ =0x00000BB8
	bl AddGold
_080AE19C:
	ldr r0, [r7]
	adds r0, r0, r4
	ldrb r0, [r0, #2]
	cmp r0, #0x98
	bne _080AE1AC
	ldr r0, _080AE1C8 @ =0x00001388
	bl AddGold
_080AE1AC:
	ldrb r0, [r6]
	bl sub_80ADD5C
	ldrb r0, [r6]
	bl sub_80ADBCC
	adds r0, r5, #0
	movs r1, #2
	bl Proc_Goto
	b _080AE32A
	.align 2, 0
_080AE1C4: .4byte 0x00000BB8
_080AE1C8: .4byte 0x00001388
_080AE1CC:
	ldr r0, _080AE1E4 @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	bge _080AE1DA
	b _080AE32A
_080AE1DA:
	movs r0, #0xe3
	lsls r0, r0, #2
	bl m4aSongNumStart
	b _080AE32A
	.align 2, 0
_080AE1E4: .4byte gPlaySt
_080AE1E8:
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _080AE214
	adds r0, r5, #0
	bl Proc_Break
	ldr r0, _080AE20C @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	bge _080AE204
	b _080AE32A
_080AE204:
	ldr r0, _080AE210 @ =0x0000038B
	bl m4aSongNumStart
	b _080AE32A
	.align 2, 0
_080AE20C: .4byte gPlaySt
_080AE210: .4byte 0x0000038B
_080AE214:
	ldrh r1, [r2, #6]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _080AE220
	subs r4, #1
_080AE220:
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _080AE22A
	adds r4, #1
_080AE22A:
	ldrb r0, [r6]
	cmp r0, r4
	beq _080AE2D0
	cmp r4, #0
	blt _080AE32A
	ldr r0, _080AE274 @ =gUnk_08DAEF6C
	ldr r0, [r0]
	ldr r0, [r0]
	cmp r4, r0
	bge _080AE32A
	ldr r0, _080AE278 @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080AE250
	ldr r0, _080AE27C @ =0x00000386
	bl m4aSongNumStart
_080AE250:
	strb r4, [r6]
	ldrb r2, [r6]
	lsls r1, r2, #4
	movs r3, #0x2c
	ldrsh r0, [r5, r3]
	cmp r1, r0
	bne _080AE280
	cmp r2, #0
	beq _080AE280
	movs r0, #0xff
	mov r4, r8
	strb r0, [r4]
	ldrb r0, [r6]
	subs r0, #1
	bl sub_80ADBCC
	b _080AE2D0
	.align 2, 0
_080AE274: .4byte gUnk_08DAEF6C
_080AE278: .4byte gPlaySt
_080AE27C: .4byte 0x00000386
_080AE280:
	adds r0, r5, #0
	adds r0, #0x29
	ldrb r3, [r0]
	lsls r1, r3, #4
	movs r4, #0x2c
	ldrsh r2, [r5, r4]
	subs r1, r1, r2
	adds r2, r0, #0
	cmp r1, #0x40
	bne _080AE2B8
	ldr r0, _080AE2B4 @ =gUnk_08DAEF6C
	ldr r0, [r0]
	ldr r0, [r0]
	subs r0, #1
	cmp r3, r0
	bge _080AE2B8
	adds r1, r5, #0
	adds r1, #0x2e
	movs r0, #1
	strb r0, [r1]
	ldrb r0, [r2]
	adds r0, #1
	bl sub_80ADBCC
	b _080AE2D0
	.align 2, 0
_080AE2B4: .4byte gUnk_08DAEF6C
_080AE2B8:
	ldrb r2, [r2]
	lsls r1, r2, #4
	movs r2, #0x2c
	ldrsh r0, [r5, r2]
	subs r0, #0x38
	subs r1, r1, r0
	movs r3, #0x80
	lsls r3, r3, #4
	movs r0, #0x28
	movs r2, #0x13
	bl ShowSysHandCursor
_080AE2D0:
	adds r0, r5, #0
	adds r0, #0x2e
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _080AE32A
_080AE2DE:
	adds r1, r5, #0
	adds r1, #0x2e
	movs r0, #0
	ldrsb r0, [r1, r0]
	cmp r0, #0
	bge _080AE2F0
	ldrh r0, [r5, #0x2c]
	subs r0, #4
	strh r0, [r5, #0x2c]
_080AE2F0:
	movs r0, #0
	ldrsb r0, [r1, r0]
	cmp r0, #0
	ble _080AE2FE
	ldrh r0, [r5, #0x2c]
	adds r0, #4
	strh r0, [r5, #0x2c]
_080AE2FE:
	movs r0, #0xf
	ldrh r3, [r5, #0x2c]
	ands r0, r3
	cmp r0, #0
	bne _080AE30A
	strb r0, [r1]
_080AE30A:
	ldr r1, _080AE334 @ =0x0000FFD8
	ldrh r2, [r5, #0x2c]
	subs r2, #0x38
	movs r0, #0xff
	ands r2, r0
	movs r0, #2
	bl SetBgOffset
	ldrh r1, [r5, #0x2c]
	ldr r0, _080AE338 @ =gUnk_08DAEF6C
	ldr r0, [r0]
	ldrh r2, [r0]
	movs r0, #7
	movs r3, #5
	bl sub_8090E04
_080AE32A:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080AE334: .4byte 0x0000FFD8
_080AE338: .4byte gUnk_08DAEF6C

	thumb_func_start sub_80AE33C
sub_80AE33C: @ 0x080AE33C
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r6, r0, #0
	movs r5, #0
	adds r0, #0x2b
	ldrb r0, [r0]
	cmp r5, r0
	bge _080AE39E
	movs r4, #0x30
_080AE34E:
	ldr r0, _080AE378 @ =gUnk_08DAEF74
	ldr r1, [r0]
	lsls r0, r5, #3
	adds r0, r0, r1
	ldr r1, [r0, #4]
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _080AE37C
	ldr r0, [r1, #4]
	ldrb r0, [r0, #4]
	str r0, [sp]
	movs r0, #0
	movs r1, #0x70
	adds r2, r4, #0
	movs r3, #0xc4
	lsls r3, r3, #8
	bl sub_8026628
	b _080AE390
	.align 2, 0
_080AE378: .4byte gUnk_08DAEF74
_080AE37C:
	ldr r0, [r1, #4]
	ldrb r0, [r0, #4]
	str r0, [sp]
	movs r0, #0
	movs r1, #0x70
	adds r2, r4, #0
	movs r3, #0xf4
	lsls r3, r3, #8
	bl sub_8026628
_080AE390:
	adds r4, #0x10
	adds r5, #1
	adds r0, r6, #0
	adds r0, #0x2b
	ldrb r0, [r0]
	cmp r5, r0
	blt _080AE34E
_080AE39E:
	bl sub_80259A4
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_80AE3AC
sub_80AE3AC: @ 0x080AE3AC
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x34]
	cmp r0, #0
	beq _080AE3BE
	bl Proc_End
	movs r0, #0
	str r0, [r4, #0x34]
_080AE3BE:
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_80AE3C4
sub_80AE3C4: @ 0x080AE3C4
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	str r0, [sp, #4]
	ldr r0, _080AE4D0 @ =gUnk_08DAEF70
	ldr r0, [r0]
	adds r6, r0, #0
	adds r6, #0x60
	ldr r0, [sp, #4]
	adds r0, #0x2b
	ldrb r5, [r0]
	lsls r4, r5, #1
	adds r3, r4, #2
	movs r0, #1
	str r0, [sp]
	movs r0, #0xd
	movs r1, #5
	movs r2, #0xc
	bl sub_804A4CC
	ldr r3, _080AE4D4 @ =gDispIo
	movs r0, #0x20
	ldrb r1, [r3, #1]
	orrs r0, r1
	movs r1, #0x40
	orrs r0, r1
	movs r1, #0x7f
	ands r0, r1
	strb r0, [r3, #1]
	adds r2, r3, #0
	adds r2, #0x34
	movs r0, #1
	ldrb r1, [r2]
	orrs r0, r1
	movs r1, #2
	orrs r0, r1
	movs r1, #5
	rsbs r1, r1, #0
	ands r0, r1
	movs r1, #8
	orrs r0, r1
	movs r1, #0x10
	orrs r0, r1
	strb r0, [r2]
	adds r1, r3, #0
	adds r1, #0x2d
	movs r0, #0x68
	strb r0, [r1]
	adds r1, #4
	movs r0, #0x28
	strb r0, [r1]
	subs r1, #5
	movs r0, #0xc8
	strb r0, [r1]
	adds r4, #7
	lsls r4, r4, #3
	adds r0, r3, #0
	adds r0, #0x30
	strb r4, [r0]
	ldr r0, [sp, #4]
	adds r0, #0x29
	ldrb r0, [r0]
	lsls r2, r0, #4
	ldr r3, [sp, #4]
	movs r1, #0x2c
	ldrsh r0, [r3, r1]
	subs r0, #0x38
	subs r2, r2, r0
	movs r0, #0
	movs r1, #0x28
	movs r3, #1
	bl sub_80A98DC
	ldr r0, [sp, #4]
	adds r0, #0x2a
	ldrb r0, [r0]
	lsls r1, r0, #4
	adds r1, #0x30
	movs r3, #0x80
	lsls r3, r3, #4
	movs r0, #0x70
	movs r2, #9
	bl ShowSysHandCursor
	cmp r5, #0
	beq _080AE55E
	ldr r0, _080AE4D8 @ =gBg0Tm + 0x20
	movs r3, #0xc6
	lsls r3, r3, #1
	adds r3, r0, r3
	str r3, [sp, #8]
	movs r1, #0xc0
	lsls r1, r1, #1
	adds r1, r1, r0
	mov sl, r1
	movs r3, #0
	mov r8, r3
	mov sb, r5
_080AE48E:
	movs r7, #0
	ldr r1, _080AE4DC @ =gUnk_08DAEF74
	ldr r0, [r1]
	add r0, r8
	ldr r4, [r0, #4]
	adds r0, r6, #0
	bl ClearText
	adds r0, r6, #0
	movs r1, #0
	bl Text_SetCursor
	ldr r0, [r4]
	ldrb r0, [r0, #4]
	cmp r0, #0x28
	bne _080AE4E4
	bl sub_802EC3C
	adds r5, r0, #0
	cmp r5, #0x64
	bne _080AE4BA
	movs r7, #1
_080AE4BA:
	adds r0, r6, #0
	movs r1, #0
	adds r2, r7, #0
	bl Text_SetParams
	adds r0, r6, #0
	ldr r1, _080AE4E0 @ =gUnk_08439BE8
	bl Text_DrawString
	b _080AE50C
	.align 2, 0
_080AE4D0: .4byte gUnk_08DAEF70
_080AE4D4: .4byte gDispIo
_080AE4D8: .4byte gBg0Tm + 0x20
_080AE4DC: .4byte gUnk_08DAEF74
_080AE4E0: .4byte gUnk_08439BE8
_080AE4E4:
	adds r0, r4, #0
	bl GetUnitItemCount
	adds r5, r0, #0
	cmp r5, #5
	bne _080AE4F2
	movs r7, #1
_080AE4F2:
	adds r0, r6, #0
	movs r1, #0
	adds r2, r7, #0
	bl Text_SetParams
	ldr r0, [r4]
	ldrh r0, [r0]
	bl DecodeMsg
	adds r1, r0, #0
	adds r0, r6, #0
	bl Text_DrawString
_080AE50C:
	cmp r7, #0
	bne _080AE520
	ldr r3, _080AE51C @ =gUnk_08DAEF74
	ldr r0, [r3]
	add r0, r8
	movs r1, #1
	b _080AE528
	.align 2, 0
_080AE51C: .4byte gUnk_08DAEF74
_080AE520:
	ldr r1, _080AE57C @ =gUnk_08DAEF74
	ldr r0, [r1]
	add r0, r8
	movs r1, #0
_080AE528:
	strb r1, [r0]
	adds r0, r6, #0
	mov r1, sl
	bl PutText
	movs r1, #1
	cmp r7, #0
	bne _080AE53A
	movs r1, #2
_080AE53A:
	ldr r0, [sp, #8]
	adds r2, r5, #0
	bl sub_8006068
	adds r6, #8
	ldr r3, [sp, #8]
	adds r3, #0x80
	str r3, [sp, #8]
	movs r0, #0x80
	add sl, r0
	movs r1, #8
	add r8, r1
	movs r3, #1
	rsbs r3, r3, #0
	add sb, r3
	mov r0, sb
	cmp r0, #0
	bne _080AE48E
_080AE55E:
	ldr r0, _080AE580 @ =sub_80AE33C
	ldr r1, [sp, #4]
	bl StartParallelWorker
	ldr r1, [sp, #4]
	str r0, [r1, #0x34]
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080AE57C: .4byte gUnk_08DAEF74
_080AE580: .4byte sub_80AE33C

	thumb_func_start sub_80AE584
sub_80AE584: @ 0x080AE584
	push {r4, r5, r6, r7, lr}
	adds r2, r0, #0
	adds r2, #0x2a
	ldr r1, _080AE5C4 @ =gUnk_08DAEF74
	ldr r1, [r1]
	ldrb r2, [r2]
	lsls r3, r2, #3
	adds r3, r3, r1
	ldr r7, [r3, #4]
	ldr r2, _080AE5C8 @ =gUnk_08DAEF68
	adds r6, r0, #0
	adds r6, #0x29
	ldrb r4, [r6]
	lsls r1, r4, #2
	ldr r0, [r2]
	adds r0, r0, r1
	movs r2, #0
	ldrsb r2, [r0, r2]
	ldr r0, _080AE5CC @ =gUnk_08DAEF60
	ldr r1, [r0]
	lsls r0, r2, #2
	adds r0, r0, r2
	lsls r0, r0, #2
	adds r1, r1, r0
	ldrb r5, [r1, #2]
	movs r0, #0
	ldrsb r0, [r3, r0]
	cmp r0, #0
	bne _080AE5D0
	movs r0, #0
	b _080AE600
	.align 2, 0
_080AE5C4: .4byte gUnk_08DAEF74
_080AE5C8: .4byte gUnk_08DAEF68
_080AE5CC: .4byte gUnk_08DAEF60
_080AE5D0:
	adds r0, r4, #0
	bl sub_80ADD5C
	ldrb r0, [r6]
	bl sub_80ADBCC
	ldr r0, [r7]
	ldrb r0, [r0, #4]
	cmp r0, #0x28
	bne _080AE5F0
	adds r0, r5, #0
	bl MakeNewItem
	bl AddItemToConvoy
	b _080AE5FE
_080AE5F0:
	adds r0, r5, #0
	bl MakeNewItem
	adds r1, r0, #0
	adds r0, r7, #0
	bl UnitAddItem
_080AE5FE:
	movs r0, #1
_080AE600:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_80AE608
sub_80AE608: @ 0x080AE608
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r6, r5, #0
	adds r6, #0x2a
	ldrb r4, [r6]
	ldr r0, _080AE638 @ =gpKeySt
	ldr r2, [r0]
	ldrh r1, [r2, #8]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _080AE64E
	adds r0, r5, #0
	bl sub_80AE584
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080AE63C
	adds r0, r5, #0
	movs r1, #2
	bl Proc_Goto
	b _080AE6C6
	.align 2, 0
_080AE638: .4byte gpKeySt
_080AE63C:
	movs r1, #1
	rsbs r1, r1, #0
	movs r2, #0xe6
	lsls r2, r2, #3
	adds r0, r1, #0
	adds r3, r5, #0
	bl sub_80ABB94
	b _080AE6C6
_080AE64E:
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _080AE678
	adds r0, r5, #0
	bl Proc_Break
	ldr r0, _080AE670 @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080AE6C6
	ldr r0, _080AE674 @ =0x0000038B
	bl m4aSongNumStart
	b _080AE6C6
	.align 2, 0
_080AE670: .4byte gPlaySt
_080AE674: .4byte 0x0000038B
_080AE678:
	ldrh r1, [r2, #6]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _080AE684
	subs r4, #1
_080AE684:
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _080AE68E
	adds r4, #1
_080AE68E:
	ldrb r0, [r6]
	cmp r4, r0
	beq _080AE6C6
	cmp r4, #0
	blt _080AE6C6
	adds r0, r5, #0
	adds r0, #0x2b
	ldrb r0, [r0]
	cmp r4, r0
	bge _080AE6C6
	ldr r0, _080AE6CC @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080AE6B4
	ldr r0, _080AE6D0 @ =0x00000386
	bl m4aSongNumStart
_080AE6B4:
	strb r4, [r6]
	lsls r1, r4, #4
	adds r1, #0x30
	movs r3, #0x80
	lsls r3, r3, #4
	movs r0, #0x70
	movs r2, #9
	bl ShowSysHandCursor
_080AE6C6:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080AE6CC: .4byte gPlaySt
_080AE6D0: .4byte 0x00000386

	thumb_func_start sub_80AE6D4
sub_80AE6D4: @ 0x080AE6D4
	push {r4, lr}
	adds r4, r0, #0
	bl sub_80AE3AC
	ldr r2, _080AE734 @ =gDispIo
	movs r0, #0x21
	rsbs r0, r0, #0
	ldrb r1, [r2, #1]
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	movs r1, #0x7f
	ands r0, r1
	strb r0, [r2, #1]
	ldr r0, _080AE738 @ =gBg1Tm
	movs r1, #0
	bl TmFill
	ldr r0, _080AE73C @ =gBg0Tm
	movs r1, #0
	bl TmFill
	bl sub_80ADE30
	movs r0, #3
	bl EnableBgSync
	movs r0, #0
	bl sub_80A998C
	adds r0, r4, #0
	adds r0, #0x29
	ldrb r0, [r0]
	lsls r1, r0, #4
	movs r2, #0x2c
	ldrsh r0, [r4, r2]
	subs r0, #0x38
	subs r1, r1, r0
	movs r3, #0x80
	lsls r3, r3, #4
	movs r0, #0x28
	movs r2, #0x13
	bl ShowSysHandCursor
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080AE734: .4byte gDispIo
_080AE738: .4byte gBg1Tm
_080AE73C: .4byte gBg0Tm

	thumb_func_start sub_80AE740
sub_80AE740: @ 0x080AE740
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x34
	adds r4, r0, #0
	adds r6, r4, #0
	adds r6, #0x29
	ldr r0, _080AE880 @ =gUnk_08DAEF68
	ldr r1, [r0]
	ldrb r2, [r6]
	lsls r0, r2, #2
	adds r0, r0, r1
	movs r2, #0
	ldrsb r2, [r0, r2]
	ldr r0, _080AE884 @ =gUnk_08DAEF60
	ldr r1, [r0]
	lsls r0, r2, #2
	adds r0, r0, r2
	lsls r0, r0, #2
	str r0, [sp, #0x30]
	adds r1, r1, r0
	ldrb r1, [r1, #2]
	str r1, [sp, #0x2c]
	ldr r0, _080AE888 @ =gUnk_08DAEF70
	ldr r0, [r0]
	adds r5, r0, #0
	adds r5, #0x70
	ldr r2, _080AE88C @ =gDispIo
	movs r0, #0x21
	rsbs r0, r0, #0
	ldrb r1, [r2, #1]
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	movs r1, #0x7f
	ands r0, r1
	strb r0, [r2, #1]
	ldr r2, _080AE890 @ =gBg0Tm
	mov sl, r2
	mov r0, sl
	movs r1, #0
	bl TmFill
	ldr r0, _080AE894 @ =gBg1Tm
	movs r1, #0
	bl TmFill
	bl sub_80ADE30
	movs r0, #3
	bl EnableBgSync
	adds r0, r4, #0
	bl sub_80AE3AC
	bl ReadLastGameSaveId
	bl WriteGameSave
	movs r0, #0
	str r0, [r4, #0x30]
	bl sub_80A998C
	ldrb r6, [r6]
	lsls r1, r6, #4
	movs r2, #0x2c
	ldrsh r0, [r4, r2]
	subs r0, #0x38
	subs r1, r1, r0
	movs r3, #0x80
	lsls r3, r3, #4
	movs r0, #0x28
	movs r2, #0x13
	bl ShowSysHandCursor
	adds r0, r5, #0
	bl ClearText
	adds r0, r5, #0
	movs r1, #0
	movs r2, #0
	bl Text_SetParams
	adds r0, r5, #0
	movs r1, #0
	bl Text_SetCursor
	ldr r0, [sp, #0x2c]
	bl GetItemName
	adds r7, r0, #0
	ldr r0, _080AE898 @ =0x000010A7
	add r1, sp, #0xc
	bl DecodeMsgInBuffer
	adds r6, r0, #0
	adds r0, r7, #0
	bl GetStringTextLen
	adds r4, r0, #0
	adds r0, r6, #0
	bl GetStringTextLen
	adds r4, r4, r0
	adds r0, r4, #7
	cmp r0, #0
	bge _080AE81C
	adds r0, #7
_080AE81C:
	asrs r0, r0, #3
	adds r0, #4
	mov sb, r0
	lsrs r0, r0, #0x1f
	add r0, sb
	asrs r0, r0, #1
	movs r1, #0xf
	subs r1, r1, r0
	mov r8, r1
	adds r0, r5, #0
	adds r1, r7, #0
	bl Text_DrawString
	adds r0, r5, #0
	adds r1, r6, #0
	bl Text_DrawString
	mov r0, r8
	lsls r4, r0, #1
	ldr r1, _080AE89C @ =0x00000286
	add r1, sl
	adds r1, r4, r1
	adds r0, r5, #0
	bl PutText
	ldr r0, _080AE8A0 @ =0x00000282
	add r0, sl
	adds r4, r4, r0
	ldr r0, [sp, #0x2c]
	bl sub_8017808
	adds r1, r0, #0
	movs r2, #0x80
	lsls r2, r2, #7
	adds r0, r4, #0
	bl PutIcon
	ldr r1, _080AE884 @ =gUnk_08DAEF60
	ldr r0, [r1]
	ldr r2, [sp, #0x30]
	adds r0, r0, r2
	ldrb r0, [r0, #1]
	cmp r0, #0
	blt _080AE8D2
	cmp r0, #1
	ble _080AE8A4
	cmp r0, #2
	beq _080AE8C0
	b _080AE8D2
	.align 2, 0
_080AE880: .4byte gUnk_08DAEF68
_080AE884: .4byte gUnk_08DAEF60
_080AE888: .4byte gUnk_08DAEF70
_080AE88C: .4byte gDispIo
_080AE890: .4byte gBg0Tm
_080AE894: .4byte gBg1Tm
_080AE898: .4byte 0x000010A7
_080AE89C: .4byte 0x00000286
_080AE8A0: .4byte 0x00000282
_080AE8A4:
	ldr r0, _080AE8B8 @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080AE8D2
	ldr r0, _080AE8BC @ =0x0000037A
	bl m4aSongNumStart
	b _080AE8D2
	.align 2, 0
_080AE8B8: .4byte gPlaySt
_080AE8BC: .4byte 0x0000037A
_080AE8C0:
	ldr r0, _080AE960 @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080AE8D2
	movs r0, #0xb9
	bl m4aSongNumStart
_080AE8D2:
	ldr r0, _080AE964 @ =gBg1Tm
	movs r1, #3
	str r1, [sp]
	movs r1, #0
	str r1, [sp, #4]
	movs r1, #1
	str r1, [sp, #8]
	mov r1, r8
	movs r2, #0xa
	mov r3, sb
	bl sub_804A360
	ldr r0, _080AE968 @ =gDispIo
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
	adds r2, #0x34
	movs r0, #1
	ldrb r1, [r2]
	orrs r0, r1
	movs r1, #2
	orrs r0, r1
	movs r1, #5
	rsbs r1, r1, #0
	ands r0, r1
	movs r1, #8
	orrs r0, r1
	movs r1, #0x11
	rsbs r1, r1, #0
	ands r0, r1
	strb r0, [r2]
	mov r2, r8
	lsls r0, r2, #3
	mov r1, ip
	adds r1, #0x2d
	strb r0, [r1]
	adds r1, #4
	movs r0, #0x50
	strb r0, [r1]
	mov r0, r8
	add r0, sb
	lsls r0, r0, #3
	subs r1, #5
	strb r0, [r1]
	adds r1, #4
	movs r0, #0x68
	strb r0, [r1]
	movs r0, #3
	bl EnableBgSync
	ldr r2, _080AE96C @ =0x0000FFFC
	movs r0, #0
	movs r1, #0
	bl SetBgOffset
	add sp, #0x34
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080AE960: .4byte gPlaySt
_080AE964: .4byte gBg1Tm
_080AE968: .4byte gDispIo
_080AE96C: .4byte 0x0000FFFC

	thumb_func_start sub_80AE970
sub_80AE970: @ 0x080AE970
	push {lr}
	adds r2, r0, #0
	ldr r0, [r2, #0x30]
	adds r0, #1
	str r0, [r2, #0x30]
	cmp r0, #0x1e
	ble _080AE998
	ldr r0, _080AE994 @ =gpKeySt
	ldr r1, [r0]
	movs r0, #3
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _080AE998
	adds r0, r2, #0
	bl Proc_Break
	b _080AE9A4
	.align 2, 0
_080AE994: .4byte gpKeySt
_080AE998:
	ldr r0, [r2, #0x30]
	cmp r0, #0x78
	ble _080AE9A4
	adds r0, r2, #0
	bl Proc_Break
_080AE9A4:
	pop {r0}
	bx r0

	thumb_func_start sub_80AE9A8
sub_80AE9A8: @ 0x080AE9A8
	push {lr}
	ldr r0, _080AE9E8 @ =gBg0Tm
	movs r1, #0
	bl TmFill
	ldr r0, _080AE9EC @ =gBg1Tm
	movs r1, #0
	bl TmFill
	bl sub_80ADE30
	movs r0, #3
	bl EnableBgSync
	ldr r2, _080AE9F0 @ =gDispIo
	movs r0, #0x21
	rsbs r0, r0, #0
	ldrb r1, [r2, #1]
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	movs r1, #0x7f
	ands r0, r1
	strb r0, [r2, #1]
	movs r0, #0
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	pop {r0}
	bx r0
	.align 2, 0
_080AE9E8: .4byte gBg0Tm
_080AE9EC: .4byte gBg1Tm
_080AE9F0: .4byte gDispIo

	thumb_func_start sub_80AE9F4
sub_80AE9F4: @ 0x080AE9F4
	push {r4, lr}
	adds r4, r0, #0
	bl sub_8005EAC
	adds r0, r4, #0
	bl EndAllProcChildren
	movs r0, #0
	bl SetOnHBlankA
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_80AEA10
sub_80AEA10: @ 0x080AEA10
	push {lr}
	adds r1, r0, #0
	ldr r0, _080AEA20 @ =gUnk_08DAEF78
	bl Proc_StartBlocking
	pop {r0}
	bx r0
	.align 2, 0
_080AEA20: .4byte gUnk_08DAEF78

	thumb_func_start sub_80AEA24
sub_80AEA24: @ 0x080AEA24
	ldr r3, _080AEA44 @ =0x020144F4
	ldr r0, _080AEA48 @ =gUnk_08DAF028
	ldr r0, [r0]
	movs r1, #0x32
	ldrsh r2, [r0, r1]
	ldr r1, _080AEA4C @ =gPlaySt
	movs r0, #0x40
	ldrb r1, [r1, #0x14]
	ands r0, r1
	cmp r0, #0
	beq _080AEA3C
	adds r2, #3
_080AEA3C:
	strh r2, [r3]
	movs r1, #0
	ldrsh r0, [r3, r1]
	bx lr
	.align 2, 0
_080AEA44: .4byte 0x020144F4
_080AEA48: .4byte gUnk_08DAF028
_080AEA4C: .4byte gPlaySt

	thumb_func_start sub_80AEA50
sub_80AEA50: @ 0x080AEA50
	ldr r0, _080AEA5C @ =gUnk_08DAF028
	ldr r0, [r0]
	ldrh r0, [r0, #0x2a]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bx lr
	.align 2, 0
_080AEA5C: .4byte gUnk_08DAF028

	thumb_func_start sub_80AEA60
sub_80AEA60: @ 0x080AEA60
	push {lr}
	bl sub_80AEA24
	ldr r1, _080AEA8C @ =gUnk_08DAF054
	lsls r0, r0, #0x10
	asrs r0, r0, #0xd
	adds r1, #4
	adds r0, r0, r1
	ldr r1, _080AEA90 @ =gUnk_08DAF028
	ldr r1, [r1]
	movs r2, #0x2a
	ldrsh r1, [r1, r2]
	ldr r0, [r0]
	adds r0, r0, r1
	ldrb r0, [r0]
	bl sub_80AF278
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	pop {r1}
	bx r1
	.align 2, 0
_080AEA8C: .4byte gUnk_08DAF054
_080AEA90: .4byte gUnk_08DAF028

	thumb_func_start sub_80AEA94
sub_80AEA94: @ 0x080AEA94
	push {lr}
	ldr r0, _080AEAA0 @ =gUnk_08DAF0AA
	bl InitBgs
	pop {r0}
	bx r0
	.align 2, 0
_080AEAA0: .4byte gUnk_08DAF0AA

	thumb_func_start sub_80AEAA4
sub_80AEAA4: @ 0x080AEAA4
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	adds r5, r1, #0
	adds r6, r2, #0
	ldr r4, _080AEB24 @ =gBg3Tm
	cmp r5, #0
	bne _080AEABE
	movs r0, #3
	bl GetBgChrOffset
	movs r1, #0xc0
	lsls r1, r1, #0x13
	adds r5, r0, r1
_080AEABE:
	cmp r6, #0
	bge _080AEAC4
	movs r6, #0xe
_080AEAC4:
	ldr r0, _080AEB28 @ =gUnk_08439BF0
	adds r1, r5, #0
	bl Decompress
	ldr r0, _080AEB2C @ =gUnk_0843F084
	lsls r1, r6, #5
	movs r2, #0x40
	bl ApplyPaletteExt
	movs r0, #3
	bl GetBgChrOffset
	subs r0, r5, r0
	lsls r0, r0, #0xf
	lsrs r0, r0, #0x14
	movs r1, #0xf
	ands r1, r6
	lsls r1, r1, #0xc
	adds r1, r0, r1
	movs r2, #0
	ldr r3, _080AEB30 @ =0x0000027F
_080AEAEE:
	adds r0, r2, r1
	strh r0, [r4]
	adds r4, #2
	adds r2, #1
	cmp r2, r3
	ble _080AEAEE
	ldr r4, _080AEB34 @ =gBg3Tm + 0xc0
	ldr r3, _080AEB38 @ =ProcScr_BackgroundSlide
	movs r5, #0x80
	lsls r5, r5, #5
	adds r1, r5, #0
	movs r2, #0xe0
	lsls r2, r2, #1
_080AEB08:
	ldrh r5, [r4]
	adds r0, r1, r5
	strh r0, [r4]
	adds r4, #2
	subs r2, #1
	cmp r2, #0
	bne _080AEB08
	adds r0, r3, #0
	adds r1, r7, #0
	bl Proc_Start
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080AEB24: .4byte gBg3Tm
_080AEB28: .4byte gUnk_08439BF0
_080AEB2C: .4byte gUnk_0843F084
_080AEB30: .4byte 0x0000027F
_080AEB34: .4byte gBg3Tm + 0xc0
_080AEB38: .4byte ProcScr_BackgroundSlide

	thumb_func_start sub_80AEB3C
sub_80AEB3C: @ 0x080AEB3C
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	adds r5, r0, #0
	lsls r4, r5, #1
	adds r4, r4, r1
	movs r0, #0x1f
	mov r8, r0
	ands r4, r0
	lsls r4, r4, #5
	ldr r6, _080AEBC4 @ =gUnk_08DAF0C4
	bl sub_80AEA24
	ldr r1, _080AEBC8 @ =gUnk_08DAF054
	lsls r0, r0, #0x10
	asrs r0, r0, #0xd
	adds r1, #4
	adds r0, r0, r1
	ldr r0, [r0]
	adds r0, r0, r5
	movs r1, #0x2c
	ldrb r0, [r0]
	muls r0, r1, r0
	adds r0, r0, r6
	adds r0, #0x24
	ldrb r1, [r0]
	adds r2, r1, #0
	mov r5, r8
	ands r2, r5
	lsls r0, r1, #1
	ldr r1, _080AEBCC @ =0x0000FFC0
	ands r0, r1
	movs r1, #0x80
	lsls r1, r1, #2
	adds r0, r0, r1
	adds r2, r2, r0
	movs r0, #0x80
	lsls r0, r0, #7
	adds r1, r2, r0
	ldr r3, _080AEBD0 @ =gBg2Tm
	adds r0, r4, #2
	lsls r0, r0, #1
	adds r0, r0, r3
	strh r1, [r0]
	adds r0, r4, #3
	lsls r0, r0, #1
	adds r0, r0, r3
	ldr r5, _080AEBD4 @ =0x00004001
	adds r1, r2, r5
	strh r1, [r0]
	adds r0, r4, #0
	adds r0, #0x22
	lsls r0, r0, #1
	adds r0, r0, r3
	adds r5, #0x1f
	adds r1, r2, r5
	strh r1, [r0]
	adds r4, #0x23
	lsls r4, r4, #1
	adds r4, r4, r3
	ldr r0, _080AEBD8 @ =0x00004021
	adds r2, r2, r0
	strh r2, [r4]
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080AEBC4: .4byte gUnk_08DAF0C4
_080AEBC8: .4byte gUnk_08DAF054
_080AEBCC: .4byte 0x0000FFC0
_080AEBD0: .4byte gBg2Tm
_080AEBD4: .4byte 0x00004001
_080AEBD8: .4byte 0x00004021

	thumb_func_start sub_80AEBDC
sub_80AEBDC: @ 0x080AEBDC
	push {r4, r5, r6, lr}
	sub sp, #8
	ldr r5, _080AEC3C @ =gUnk_08DAF028
	ldr r0, [r5]
	adds r0, #0xa8
	bl ClearText
	ldr r6, _080AEC40 @ =gUnk_08DAF0C4
	bl sub_80AEA60
	adds r4, r0, #0
	bl sub_80AEA24
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x15
	ldr r1, _080AEC44 @ =gUnk_08DAF054
	lsls r0, r0, #0x10
	asrs r0, r0, #0xd
	adds r1, #4
	adds r0, r0, r1
	ldr r1, [r5]
	movs r2, #0x2a
	ldrsh r1, [r1, r2]
	ldr r0, [r0]
	adds r0, r0, r1
	movs r1, #0x2c
	ldrb r0, [r0]
	muls r0, r1, r0
	adds r4, r4, r0
	adds r4, r4, r6
	ldrh r0, [r4, #4]
	bl DecodeMsg
	adds r3, r0, #0
	ldr r0, [r5]
	adds r0, #0xa8
	ldr r1, _080AEC48 @ =gBg0Tm + 0x448
	movs r2, #0x16
	str r2, [sp]
	str r3, [sp, #4]
	movs r2, #0
	movs r3, #0
	bl PutDrawText
	add sp, #8
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080AEC3C: .4byte gUnk_08DAF028
_080AEC40: .4byte gUnk_08DAF0C4
_080AEC44: .4byte gUnk_08DAF054
_080AEC48: .4byte gBg0Tm + 0x448

	thumb_func_start sub_80AEC4C
sub_80AEC4C: @ 0x080AEC4C
	push {r4, r5, r6, lr}
	mov r6, sb
	mov r5, r8
	push {r5, r6}
	sub sp, #8
	mov sb, r0
	adds r4, r1, #0
	adds r5, r2, #0
	ldr r0, _080AECBC @ =gUnk_08DAF028
	mov r8, r0
	lsls r4, r4, #3
	adds r4, #0x38
	ldr r0, [r0]
	adds r0, r0, r4
	bl ClearText
	ldr r6, _080AECC0 @ =gUnk_08DAF0C4
	bl sub_80AEA24
	ldr r1, _080AECC4 @ =gUnk_08DAF054
	lsls r0, r0, #0x10
	asrs r0, r0, #0xd
	adds r1, #4
	adds r0, r0, r1
	ldr r0, [r0]
	add r0, sb
	movs r1, #0x2c
	ldrb r0, [r0]
	muls r0, r1, r0
	adds r0, r0, r6
	ldrh r0, [r0]
	bl DecodeMsg
	adds r2, r0, #0
	mov r1, r8
	ldr r0, [r1]
	adds r0, r0, r4
	lsls r5, r5, #6
	ldr r1, _080AECC8 @ =gBg2Tm + 0x8
	adds r5, r5, r1
	movs r1, #9
	str r1, [sp]
	str r2, [sp, #4]
	adds r1, r5, #0
	movs r2, #0
	movs r3, #0
	bl PutDrawText
	add sp, #8
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080AECBC: .4byte gUnk_08DAF028
_080AECC0: .4byte gUnk_08DAF0C4
_080AECC4: .4byte gUnk_08DAF054
_080AECC8: .4byte gBg2Tm + 0x8

	thumb_func_start sub_80AECCC
sub_80AECCC: @ 0x080AECCC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	adds r4, r0, #0
	str r1, [sp]
	str r2, [sp, #4]
	bl sub_80AEA24
	ldr r1, _080AED98 @ =gUnk_08DAF054
	lsls r0, r0, #0x10
	asrs r0, r0, #0xd
	adds r1, #4
	adds r0, r0, r1
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r0, [r0]
	mov sb, r0
	ldr r1, _080AED9C @ =gUnk_08DAF0C4
	movs r0, #0x2c
	mov r2, sb
	muls r2, r0, r2
	adds r0, r2, #0
	adds r4, r0, r1
	ldrb r0, [r4, #8]
	lsrs r0, r0, #3
	str r0, [sp, #8]
	ldr r1, _080AEDA0 @ =gUnk_08DAF028
	ldr r2, [sp]
	lsls r0, r2, #3
	adds r5, r0, #0
	adds r5, #0x70
	ldr r0, [r1]
	adds r0, r0, r5
	bl ClearText
	movs r0, #0
	mov r8, r0
	ldrh r0, [r4, #6]
	cmp r0, #0
	beq _080AED6A
	mov sl, r5
_080AED24:
	ldr r0, _080AEDA0 @ =gUnk_08DAF028
	ldr r0, [r0]
	mov r1, sl
	adds r7, r0, r1
	ldrb r6, [r4, #8]
	subs r6, #0x78
	mov r2, sb
	lsls r0, r2, #0x18
	lsrs r0, r0, #0x18
	bl sub_80AF278
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r5, #1
	cmp r8, r0
	bne _080AED46
	movs r5, #2
_080AED46:
	ldrh r0, [r4, #6]
	bl DecodeMsg
	adds r3, r0, #0
	adds r0, r7, #0
	adds r1, r6, #0
	adds r2, r5, #0
	bl Text_InsertDrawString
	adds r4, #8
	movs r0, #1
	add r8, r0
	mov r1, r8
	cmp r1, #3
	bgt _080AED6A
	ldrh r0, [r4, #6]
	cmp r0, #0
	bne _080AED24
_080AED6A:
	ldr r0, _080AEDA0 @ =gUnk_08DAF028
	ldr r2, [sp]
	lsls r1, r2, #3
	adds r1, #0x70
	ldr r0, [r0]
	adds r0, r0, r1
	ldr r2, [sp, #4]
	lsls r1, r2, #5
	ldr r2, [sp, #8]
	adds r1, r1, r2
	lsls r1, r1, #1
	ldr r2, _080AEDA4 @ =gBg2Tm
	adds r1, r1, r2
	bl PutText
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080AED98: .4byte gUnk_08DAF054
_080AED9C: .4byte gUnk_08DAF0C4
_080AEDA0: .4byte gUnk_08DAF028
_080AEDA4: .4byte gBg2Tm

	thumb_func_start sub_80AEDA8
sub_80AEDA8: @ 0x080AEDA8
	push {lr}
	movs r0, #1
	movs r1, #0x12
	bl ApplyIconPalette
	movs r0, #0x80
	movs r1, #3
	bl sub_80B2D90
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_80AEDC0
sub_80AEDC0: @ 0x080AEDC0
	push {r4, r5, r6, r7, lr}
	bl sub_80AEA24
	ldr r1, _080AEEA0 @ =gUnk_08DAF054
	lsls r0, r0, #0x10
	asrs r0, r0, #0xd
	adds r1, #4
	adds r0, r0, r1
	ldr r6, _080AEEA4 @ =gUnk_08DAF028
	ldr r1, [r6]
	movs r2, #0x2a
	ldrsh r1, [r1, r2]
	ldr r0, [r0]
	adds r0, r0, r1
	ldrb r5, [r0]
	bl GetGameTime
	movs r1, #0xf
	ands r0, r1
	movs r1, #8
	ands r0, r1
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	ldr r2, _080AEEA8 @ =gUnk_08DAF084
	movs r3, #0x83
	lsls r3, r3, #6
	movs r0, #0x22
	movs r1, #8
	bl PutOamHiRam
	ldr r0, [r6]
	movs r1, #0x2a
	ldrsh r4, [r0, r1]
	movs r2, #0x2c
	ldrsh r0, [r0, r2]
	subs r4, r4, r0
	lsls r4, r4, #4
	adds r4, #0x20
	movs r0, #0x10
	adds r1, r4, #0
	bl sub_804A7EC
	adds r0, r5, #0
	bl sub_80AF278
	ldr r2, _080AEEAC @ =gUnk_08DAF0C4
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x15
	movs r1, #0x2c
	muls r1, r5, r1
	adds r0, r0, r1
	adds r0, r0, r2
	ldrb r0, [r0, #8]
	subs r0, #2
	adds r1, r4, #0
	bl DisplayUiHand
	ldr r1, [r6]
	movs r2, #0x34
	ldrsh r0, [r1, r2]
	cmp r0, #6
	ble _080AEE70
	movs r2, #0x2c
	ldrsh r0, [r1, r2]
	cmp r0, #0
	beq _080AEE52
	movs r2, #0xc2
	lsls r2, r2, #6
	movs r0, #0x64
	movs r1, #0x1d
	movs r3, #1
	bl sub_80B2DD4
_080AEE52:
	ldr r0, [r6]
	movs r2, #0x2c
	ldrsh r1, [r0, r2]
	movs r2, #0x34
	ldrsh r0, [r0, r2]
	subs r0, #6
	cmp r1, r0
	bge _080AEE70
	movs r2, #0xc2
	lsls r2, r2, #6
	movs r0, #0x64
	movs r1, #0x7d
	movs r3, #0
	bl sub_80B2DD4
_080AEE70:
	bl sub_80AEA50
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080AEE98
	bl sub_80AEA60
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #3
	bne _080AEE98
	ldr r2, _080AEEB0 @ =Sprite_16x16
	ldr r3, _080AEEB4 @ =0x000020CC
	cmp r7, #0
	beq _080AEE90
	adds r3, #2
_080AEE90:
	movs r0, #0xc0
	movs r1, #0x20
	bl PutOamHiRam
_080AEE98:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080AEEA0: .4byte gUnk_08DAF054
_080AEEA4: .4byte gUnk_08DAF028
_080AEEA8: .4byte gUnk_08DAF084
_080AEEAC: .4byte gUnk_08DAF0C4
_080AEEB0: .4byte Sprite_16x16
_080AEEB4: .4byte 0x000020CC

	thumb_func_start sub_80AEEB8
sub_80AEEB8: @ 0x080AEEB8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	mov sl, r0
	movs r5, #0
	ldr r0, _080AF0C8 @ =gPlaySt
	ldrb r0, [r0, #0x1b]
	cmp r0, #1
	beq _080AEED6
	movs r5, #1
	cmp r0, #2
	beq _080AEED6
	movs r5, #2
_080AEED6:
	ldr r1, _080AF0CC @ =gUnk_08DAF028
	ldr r0, [r1]
	movs r2, #0
	mov sb, r2
	movs r4, #0
	strh r5, [r0, #0x32]
	bl sub_80AEA24
	ldr r2, _080AF0CC @ =gUnk_08DAF028
	ldr r1, [r2]
	ldr r2, _080AF0D0 @ =gUnk_08DAF054
	lsls r0, r0, #0x10
	asrs r0, r0, #0xd
	adds r0, r0, r2
	ldrb r0, [r0]
	strh r0, [r1, #0x34]
	strh r4, [r1, #0x2a]
	strh r4, [r1, #0x2c]
	mov r0, sl
	strh r4, [r0, #0x2e]
	strh r4, [r0, #0x30]
	adds r0, #0x36
	mov r1, sb
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	bl UnpackUiWindowFrameGraphics
	ldr r7, _080AF0D4 @ =gDispIo
	movs r4, #1
	ldrb r0, [r7, #1]
	orrs r0, r4
	movs r2, #2
	mov r8, r2
	mov r1, r8
	orrs r0, r1
	movs r2, #4
	orrs r0, r2
	movs r6, #8
	orrs r0, r6
	movs r5, #0x10
	orrs r0, r5
	strb r0, [r7, #1]
	movs r0, #0
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	movs r0, #1
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	mov r0, sl
	ldrh r2, [r0, #0x2e]
	movs r0, #2
	movs r1, #0
	bl SetBgOffset
	movs r0, #3
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	movs r0, #0x20
	ldrb r1, [r7, #1]
	orrs r0, r1
	movs r1, #0x41
	rsbs r1, r1, #0
	ands r0, r1
	movs r1, #0x7f
	ands r0, r1
	strb r0, [r7, #1]
	adds r0, r7, #0
	adds r0, #0x2d
	mov r2, sb
	strb r2, [r0]
	adds r1, r7, #0
	adds r1, #0x31
	movs r0, #0x20
	strb r0, [r1]
	subs r1, #5
	movs r0, #0xf0
	strb r0, [r1]
	adds r1, #4
	movs r0, #0x80
	strb r0, [r1]
	adds r1, #4
	ldrb r0, [r1]
	orrs r0, r4
	mov r2, r8
	orrs r0, r2
	movs r2, #4
	orrs r0, r2
	orrs r0, r6
	orrs r0, r5
	strb r0, [r1]
	adds r1, #2
	ldrb r0, [r1]
	orrs r4, r0
	mov r2, r8
	orrs r4, r2
	movs r0, #5
	rsbs r0, r0, #0
	ands r4, r0
	orrs r4, r6
	orrs r4, r5
	strb r4, [r1]
	ldr r0, _080AF0D8 @ =gBg0Tm
	movs r1, #0
	bl TmFill
	ldr r5, _080AF0DC @ =gBg1Tm
	adds r0, r5, #0
	movs r1, #0
	bl TmFill
	ldr r0, _080AF0E0 @ =gBg2Tm
	movs r1, #0
	bl TmFill
	ldr r0, _080AF0E4 @ =gBg3Tm
	movs r1, #0
	bl TmFill
	ldr r4, _080AF0E8 @ =gUnk_0843F0E4
	adds r0, r4, #0
	movs r1, #0x80
	movs r2, #0x20
	bl ApplyPaletteExt
	movs r1, #0x90
	lsls r1, r1, #2
	adds r0, r4, #0
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r0, _080AF0EC @ =gUnk_0843E7EC
	ldr r1, _080AF0F0 @ =0x06011800
	bl Decompress
	ldr r0, _080AF0F4 @ =gUnk_0843EA50
	ldr r1, _080AF0F8 @ =0x06004000
	bl Decompress
	ldr r4, _080AF0FC @ =gUnk_0843EA3C
	movs r0, #2
	bl GetBgChrOffset
	adds r1, r0, #0
	ldr r0, _080AF100 @ =0x06005000
	adds r1, r1, r0
	adds r0, r4, #0
	bl Decompress
	ldr r1, _080AF104 @ =gUnk_0843EF2C
	movs r4, #0x80
	lsls r4, r4, #5
	adds r0, r5, #0
	adds r2, r4, #0
	bl TmApplyTsa_thm
	ldr r1, _080AF108 @ =0x00000404
	adds r5, r5, r1
	ldr r1, _080AF10C @ =gUnk_0843EFB0
	adds r0, r5, #0
	adds r2, r4, #0
	bl TmApplyTsa_thm
	bl ResetTextFont
	ldr r2, _080AF0CC @ =gUnk_08DAF028
	ldr r0, [r2]
	adds r0, #0xa8
	movs r1, #0x16
	bl InitText
	bl sub_80AEBDC
	ldr r1, _080AF0CC @ =gUnk_08DAF028
	ldr r0, [r1]
	adds r0, #0x68
	movs r1, #9
	bl InitText
	ldr r2, _080AF0CC @ =gUnk_08DAF028
	ldr r0, [r2]
	adds r0, #0xa0
	movs r1, #0xe
	bl InitText
	movs r5, #0
	ldr r0, _080AF0CC @ =gUnk_08DAF028
	mov r8, r0
	movs r7, #0x70
	movs r6, #0x38
	movs r4, #4
_080AF060:
	adds r0, r5, #0
	movs r1, #4
	bl sub_80AEB3C
	mov r1, r8
	ldr r0, [r1]
	adds r0, r0, r6
	movs r1, #9
	bl InitText
	mov r2, r8
	ldr r0, [r2]
	adds r0, r0, r7
	movs r1, #0xe
	bl InitText
	adds r0, r5, #0
	adds r1, r5, #0
	adds r2, r4, #0
	bl sub_80AEC4C
	adds r0, r5, #0
	adds r1, r5, #0
	adds r2, r4, #0
	bl sub_80AECCC
	adds r7, #8
	adds r6, #8
	adds r4, #2
	adds r5, #1
	cmp r5, #5
	ble _080AF060
	movs r2, #1
	rsbs r2, r2, #0
	mov r0, sl
	movs r1, #0
	bl sub_80AEAA4
	ldr r0, _080AF110 @ =gUnk_08DAF3D0
	mov r1, sl
	bl Proc_Start
	movs r0, #0xf
	bl EnableBgSync
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080AF0C8: .4byte gPlaySt
_080AF0CC: .4byte gUnk_08DAF028
_080AF0D0: .4byte gUnk_08DAF054
_080AF0D4: .4byte gDispIo
_080AF0D8: .4byte gBg0Tm
_080AF0DC: .4byte gBg1Tm
_080AF0E0: .4byte gBg2Tm
_080AF0E4: .4byte gBg3Tm
_080AF0E8: .4byte gUnk_0843F0E4
_080AF0EC: .4byte gUnk_0843E7EC
_080AF0F0: .4byte 0x06011800
_080AF0F4: .4byte gUnk_0843EA50
_080AF0F8: .4byte 0x06004000
_080AF0FC: .4byte gUnk_0843EA3C
_080AF100: .4byte 0x06005000
_080AF104: .4byte gUnk_0843EF2C
_080AF108: .4byte 0x00000404
_080AF10C: .4byte gUnk_0843EFB0
_080AF110: .4byte gUnk_08DAF3D0

	thumb_func_start sub_80AF114
sub_80AF114: @ 0x080AF114
	push {lr}
	bl sub_80AF194
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080AF128
	movs r0, #1
	rsbs r0, r0, #0
	bl sub_804A30C
_080AF128:
	movs r0, #0
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_80AF130
sub_80AF130: @ 0x080AF130
	push {r4, lr}
	adds r4, r0, #0
	bl sub_80AF194
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080AF18C
	bl sub_80AEA24
	ldr r1, _080AF16C @ =gUnk_08DAF054
	lsls r0, r0, #0x10
	asrs r0, r0, #0xd
	adds r1, #4
	adds r0, r0, r1
	ldr r1, _080AF170 @ =gUnk_08DAF028
	ldr r1, [r1]
	movs r2, #0x2a
	ldrsh r1, [r1, r2]
	ldr r0, [r0]
	adds r0, r0, r1
	ldrb r0, [r0]
	bl sub_80AF278
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080AF174
	movs r0, #1
	bl FadeBgmOut
	b _080AF18C
	.align 2, 0
_080AF16C: .4byte gUnk_08DAF054
_080AF170: .4byte gUnk_08DAF028
_080AF174:
	adds r0, r4, #0
	adds r0, #0x37
	ldrb r0, [r0]
	cmp r0, #0
	beq _080AF188
	movs r0, #0x49
	movs r1, #0
	bl sub_800376C
	b _080AF18C
_080AF188:
	bl sub_8016400
_080AF18C:
	movs r0, #0
	pop {r4}
	pop {r1}
	bx r1

	thumb_func_start sub_80AF194
sub_80AF194: @ 0x080AF194
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	mov r8, r0
	movs r7, #0
	ldr r0, _080AF1F0 @ =gUnk_08DAF028
	ldr r0, [r0]
	movs r1, #0x2a
	ldrsh r5, [r0, r1]
	bl sub_80AEA24
	ldr r1, _080AF1F4 @ =gUnk_08DAF054
	lsls r0, r0, #0x10
	asrs r0, r0, #0xd
	adds r1, #4
	adds r0, r0, r1
	ldr r0, [r0]
	adds r0, r0, r5
	ldrb r4, [r0]
	adds r6, r4, #0
	bl sub_80AEA60
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	ldr r0, _080AF1F8 @ =gpKeySt
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0x30
	ands r0, r1
	cmp r0, #0
	beq _080AF25A
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	beq _080AF1FC
	cmp r3, #0
	beq _080AF222
	subs r0, r3, #1
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	adds r0, r4, #0
	adds r1, r3, #0
	bl sub_80AF3F4
	movs r7, #1
	b _080AF226
	.align 2, 0
_080AF1F0: .4byte gUnk_08DAF028
_080AF1F4: .4byte gUnk_08DAF054
_080AF1F8: .4byte gpKeySt
_080AF1FC:
	ldr r2, _080AF268 @ =gUnk_08DAF0C4
	adds r4, r3, #1
	lsls r0, r4, #3
	movs r1, #0x2c
	muls r1, r6, r1
	adds r0, r0, r1
	adds r0, r0, r2
	ldrh r0, [r0, #6]
	cmp r0, #0
	beq _080AF222
	cmp r3, #2
	bhi _080AF222
	lsls r0, r4, #0x18
	lsrs r3, r0, #0x18
	adds r0, r6, #0
	adds r1, r3, #0
	bl sub_80AF3F4
	movs r7, #1
_080AF222:
	cmp r7, #0
	beq _080AF25A
_080AF226:
	ldr r0, _080AF26C @ =gUnk_08DAF3B0
	mov r1, r8
	bl Proc_Start
	adds r0, r5, #0
	movs r1, #7
	bl __modsi3
	adds r1, r0, #0
	lsls r2, r5, #1
	adds r2, #4
	adds r0, r5, #0
	bl sub_80AECCC
	movs r0, #5
	bl EnableBgSync
	ldr r0, _080AF270 @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080AF25A
	ldr r0, _080AF274 @ =0x00000387
	bl m4aSongNumStart
_080AF25A:
	adds r0, r7, #0
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_080AF268: .4byte gUnk_08DAF0C4
_080AF26C: .4byte gUnk_08DAF3B0
_080AF270: .4byte gPlaySt
_080AF274: .4byte 0x00000387

	thumb_func_start sub_80AF278
sub_80AF278: @ 0x080AF278
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r2, #0
	cmp r0, #0x10
	bls _080AF284
	b _080AF3EA
_080AF284:
	lsls r0, r0, #2
	ldr r1, _080AF290 @ =_080AF294
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080AF290: .4byte _080AF294
_080AF294: @ jump table
	.4byte _080AF2D8 @ case 0
	.4byte _080AF30E @ case 1
	.4byte _080AF31C @ case 2
	.4byte _080AF328 @ case 3
	.4byte _080AF338 @ case 4
	.4byte _080AF348 @ case 5
	.4byte _080AF354 @ case 6
	.4byte _080AF364 @ case 7
	.4byte _080AF374 @ case 8
	.4byte _080AF3EA @ case 9
	.4byte _080AF384 @ case 10
	.4byte _080AF394 @ case 11
	.4byte _080AF3A4 @ case 12
	.4byte _080AF3B0 @ case 13
	.4byte _080AF3C0 @ case 14
	.4byte _080AF3D0 @ case 15
	.4byte _080AF3E0 @ case 16
_080AF2D8:
	ldr r0, _080AF2F0 @ =gPlaySt
	adds r0, #0x42
	ldrb r0, [r0]
	lsls r0, r0, #0x1d
	lsrs r0, r0, #0x1e
	cmp r0, #1
	beq _080AF306
	cmp r0, #1
	bgt _080AF2F4
	cmp r0, #0
	beq _080AF2FE
	b _080AF30E
	.align 2, 0
_080AF2F0: .4byte gPlaySt
_080AF2F4:
	cmp r0, #2
	beq _080AF30A
	cmp r0, #3
	beq _080AF302
	b _080AF30E
_080AF2FE:
	movs r0, #0
	b _080AF3EC
_080AF302:
	movs r0, #1
	b _080AF3EC
_080AF306:
	movs r0, #2
	b _080AF3EC
_080AF30A:
	movs r0, #3
	b _080AF3EC
_080AF30E:
	ldr r0, _080AF318 @ =gPlaySt
	adds r0, #0x40
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	b _080AF3E8
	.align 2, 0
_080AF318: .4byte gPlaySt
_080AF31C:
	ldr r0, _080AF324 @ =gPlaySt
	adds r0, #0x40
	b _080AF378
	.align 2, 0
_080AF324: .4byte gPlaySt
_080AF328:
	ldr r0, _080AF334 @ =gPlaySt
	adds r0, #0x40
	ldrb r0, [r0]
	lsls r0, r0, #0x1b
	b _080AF3E8
	.align 2, 0
_080AF334: .4byte gPlaySt
_080AF338:
	ldr r0, _080AF344 @ =gPlaySt
	adds r0, #0x40
	ldrb r0, [r0]
	lsls r0, r0, #0x19
	lsrs r2, r0, #0x1e
	b _080AF3EA
	.align 2, 0
_080AF344: .4byte gPlaySt
_080AF348:
	ldr r0, _080AF350 @ =gPlaySt
	adds r0, #0x40
	b _080AF398
	.align 2, 0
_080AF350: .4byte gPlaySt
_080AF354:
	ldr r0, _080AF360 @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1f
	b _080AF3E8
	.align 2, 0
_080AF360: .4byte gPlaySt
_080AF364:
	ldr r0, _080AF370 @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	b _080AF3E8
	.align 2, 0
_080AF370: .4byte gPlaySt
_080AF374:
	ldr r0, _080AF380 @ =gPlaySt
	adds r0, #0x41
_080AF378:
	ldrb r0, [r0]
	lsls r0, r0, #0x1c
	lsrs r2, r0, #0x1e
	b _080AF3EA
	.align 2, 0
_080AF380: .4byte gPlaySt
_080AF384:
	ldr r0, _080AF390 @ =gPlaySt
	adds r0, #0x42
	ldrb r0, [r0]
	lsls r0, r0, #0x1b
	lsrs r2, r0, #0x1e
	b _080AF3EA
	.align 2, 0
_080AF390: .4byte gPlaySt
_080AF394:
	ldr r0, _080AF3A0 @ =gPlaySt
	adds r0, #0x41
_080AF398:
	ldrb r0, [r0]
	lsrs r2, r0, #7
	b _080AF3EA
	.align 2, 0
_080AF3A0: .4byte gPlaySt
_080AF3A4:
	ldr r0, _080AF3AC @ =gPlaySt
	adds r0, #0x41
	b _080AF3E4
	.align 2, 0
_080AF3AC: .4byte gPlaySt
_080AF3B0:
	ldr r0, _080AF3BC @ =gPlaySt
	adds r0, #0x40
	ldrb r0, [r0]
	lsls r0, r0, #0x1f
	b _080AF3E8
	.align 2, 0
_080AF3BC: .4byte gPlaySt
_080AF3C0:
	ldr r0, _080AF3CC @ =gPlaySt
	adds r0, #0x42
	ldrb r0, [r0]
	lsls r0, r0, #0x1f
	b _080AF3E8
	.align 2, 0
_080AF3CC: .4byte gPlaySt
_080AF3D0:
	ldr r0, _080AF3DC @ =gPlaySt
	adds r0, #0x42
	ldrb r0, [r0]
	lsls r0, r0, #0x1a
	b _080AF3E8
	.align 2, 0
_080AF3DC: .4byte gPlaySt
_080AF3E0:
	ldr r0, _080AF3F0 @ =gPlaySt
	adds r0, #0x42
_080AF3E4:
	ldrb r0, [r0]
	lsls r0, r0, #0x19
_080AF3E8:
	lsrs r2, r0, #0x1f
_080AF3EA:
	adds r0, r2, #0
_080AF3EC:
	bx lr
	.align 2, 0
_080AF3F0: .4byte gPlaySt

	thumb_func_start sub_80AF3F4
sub_80AF3F4: @ 0x080AF3F4
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r3, r1, #0x18
	cmp r0, #0x10
	bls _080AF402
	b _080AF600
_080AF402:
	lsls r0, r0, #2
	ldr r1, _080AF40C @ =_080AF410
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080AF40C: .4byte _080AF410
_080AF410: @ jump table
	.4byte _080AF454 @ case 0
	.4byte _080AF4BC @ case 1
	.4byte _080AF4D4 @ case 2
	.4byte _080AF4EC @ case 3
	.4byte _080AF504 @ case 4
	.4byte _080AF51C @ case 5
	.4byte _080AF528 @ case 6
	.4byte _080AF53C @ case 7
	.4byte _080AF554 @ case 8
	.4byte _080AF600 @ case 9
	.4byte _080AF56C @ case 10
	.4byte _080AF584 @ case 11
	.4byte _080AF59C @ case 12
	.4byte _080AF5A8 @ case 13
	.4byte _080AF5BC @ case 14
	.4byte _080AF5D0 @ case 15
	.4byte _080AF5E8 @ case 16
_080AF454:
	cmp r3, #1
	beq _080AF480
	cmp r3, #1
	bgt _080AF462
	cmp r3, #0
	beq _080AF46C
	b _080AF4BC
_080AF462:
	cmp r3, #2
	beq _080AF494
	cmp r3, #3
	beq _080AF4A8
	b _080AF4BC
_080AF46C:
	ldr r1, _080AF47C @ =gPlaySt
	adds r1, #0x42
	movs r0, #7
	rsbs r0, r0, #0
	ldrb r2, [r1]
	ands r0, r2
	strb r0, [r1]
	b _080AF600
	.align 2, 0
_080AF47C: .4byte gPlaySt
_080AF480:
	ldr r1, _080AF490 @ =gPlaySt
	adds r1, #0x42
	movs r0, #6
	ldrb r3, [r1]
	orrs r0, r3
	strb r0, [r1]
	b _080AF600
	.align 2, 0
_080AF490: .4byte gPlaySt
_080AF494:
	ldr r0, _080AF4A4 @ =gPlaySt
	adds r0, #0x42
	movs r1, #7
	rsbs r1, r1, #0
	ldrb r2, [r0]
	ands r1, r2
	movs r2, #2
	b _080AF590
	.align 2, 0
_080AF4A4: .4byte gPlaySt
_080AF4A8:
	ldr r0, _080AF4B8 @ =gPlaySt
	adds r0, #0x42
	movs r1, #7
	rsbs r1, r1, #0
	ldrb r3, [r0]
	ands r1, r3
	movs r2, #4
	b _080AF590
	.align 2, 0
_080AF4B8: .4byte gPlaySt
_080AF4BC:
	ldr r2, _080AF4D0 @ =gPlaySt
	adds r2, #0x40
	movs r0, #1
	adds r1, r3, #0
	ands r1, r0
	lsls r1, r1, #1
	movs r0, #3
	rsbs r0, r0, #0
	b _080AF5F8
	.align 2, 0
_080AF4D0: .4byte gPlaySt
_080AF4D4:
	ldr r2, _080AF4E8 @ =gPlaySt
	adds r2, #0x40
	movs r0, #3
	adds r1, r3, #0
	ands r1, r0
	lsls r1, r1, #2
	movs r0, #0xd
	rsbs r0, r0, #0
	b _080AF5F8
	.align 2, 0
_080AF4E8: .4byte gPlaySt
_080AF4EC:
	ldr r2, _080AF500 @ =gPlaySt
	adds r2, #0x40
	movs r0, #1
	adds r1, r3, #0
	ands r1, r0
	lsls r1, r1, #4
	movs r0, #0x11
	rsbs r0, r0, #0
	b _080AF5F8
	.align 2, 0
_080AF500: .4byte gPlaySt
_080AF504:
	ldr r2, _080AF518 @ =gPlaySt
	adds r2, #0x40
	movs r0, #3
	adds r1, r3, #0
	ands r1, r0
	lsls r1, r1, #5
	movs r0, #0x61
	rsbs r0, r0, #0
	b _080AF5F8
	.align 2, 0
_080AF518: .4byte gPlaySt
_080AF51C:
	ldr r0, _080AF524 @ =gPlaySt
	adds r0, #0x40
	b _080AF588
	.align 2, 0
_080AF524: .4byte gPlaySt
_080AF528:
	ldr r2, _080AF538 @ =gPlaySt
	adds r2, #0x41
	movs r0, #1
	adds r1, r3, #0
	ands r1, r0
	movs r0, #2
	rsbs r0, r0, #0
	b _080AF5F8
	.align 2, 0
_080AF538: .4byte gPlaySt
_080AF53C:
	ldr r2, _080AF550 @ =gPlaySt
	adds r2, #0x41
	movs r0, #1
	adds r1, r3, #0
	ands r1, r0
	lsls r1, r1, #1
	movs r0, #3
	rsbs r0, r0, #0
	b _080AF5F8
	.align 2, 0
_080AF550: .4byte gPlaySt
_080AF554:
	ldr r2, _080AF568 @ =gPlaySt
	adds r2, #0x41
	movs r0, #3
	adds r1, r3, #0
	ands r1, r0
	lsls r1, r1, #2
	movs r0, #0xd
	rsbs r0, r0, #0
	b _080AF5F8
	.align 2, 0
_080AF568: .4byte gPlaySt
_080AF56C:
	ldr r2, _080AF580 @ =gPlaySt
	adds r2, #0x42
	movs r0, #3
	adds r1, r3, #0
	ands r1, r0
	lsls r1, r1, #3
	movs r0, #0x19
	rsbs r0, r0, #0
	b _080AF5F8
	.align 2, 0
_080AF580: .4byte gPlaySt
_080AF584:
	ldr r0, _080AF598 @ =gPlaySt
	adds r0, #0x41
_080AF588:
	lsls r2, r3, #7
	movs r1, #0x7f
	ldrb r3, [r0]
	ands r1, r3
_080AF590:
	orrs r1, r2
	strb r1, [r0]
	b _080AF600
	.align 2, 0
_080AF598: .4byte gPlaySt
_080AF59C:
	ldr r2, _080AF5A4 @ =gPlaySt
	adds r2, #0x41
	b _080AF5EC
	.align 2, 0
_080AF5A4: .4byte gPlaySt
_080AF5A8:
	ldr r2, _080AF5B8 @ =gPlaySt
	adds r2, #0x40
	movs r0, #1
	adds r1, r3, #0
	ands r1, r0
	movs r0, #2
	rsbs r0, r0, #0
	b _080AF5F8
	.align 2, 0
_080AF5B8: .4byte gPlaySt
_080AF5BC:
	ldr r2, _080AF5CC @ =gPlaySt
	adds r2, #0x42
	movs r0, #1
	adds r1, r3, #0
	ands r1, r0
	movs r0, #2
	rsbs r0, r0, #0
	b _080AF5F8
	.align 2, 0
_080AF5CC: .4byte gPlaySt
_080AF5D0:
	ldr r2, _080AF5E4 @ =gPlaySt
	adds r2, #0x42
	movs r0, #1
	adds r1, r3, #0
	ands r1, r0
	lsls r1, r1, #5
	movs r0, #0x21
	rsbs r0, r0, #0
	b _080AF5F8
	.align 2, 0
_080AF5E4: .4byte gPlaySt
_080AF5E8:
	ldr r2, _080AF604 @ =gPlaySt
	adds r2, #0x42
_080AF5EC:
	movs r0, #1
	adds r1, r3, #0
	ands r1, r0
	lsls r1, r1, #6
	movs r0, #0x41
	rsbs r0, r0, #0
_080AF5F8:
	ldrb r3, [r2]
	ands r0, r3
	orrs r0, r1
	strb r0, [r2]
_080AF600:
	bx lr
	.align 2, 0
_080AF604: .4byte gPlaySt

	thumb_func_start sub_80AF608
sub_80AF608: @ 0x080AF608
	push {r4, r5, r6, r7, lr}
	adds r6, r1, #0
	adds r7, r2, #0
	lsls r0, r6, #1
	adds r5, r0, #4
	movs r0, #0x1f
	ands r5, r0
	lsls r0, r5, #5
	ldr r2, _080AF684 @ =gBg2Tm
	movs r4, #0
	adds r1, r0, #0
	adds r1, #0x22
	adds r0, #2
	movs r3, #0x1a
	lsls r0, r0, #1
	adds r0, r0, r2
	lsls r1, r1, #1
	adds r1, r1, r2
_080AF62C:
	strh r4, [r0]
	strh r4, [r1]
	adds r1, #2
	adds r0, #2
	subs r3, #1
	cmp r3, #0
	bge _080AF62C
	adds r0, r6, #0
	movs r1, #7
	bl __modsi3
	adds r4, r0, #0
	adds r0, r6, #0
	movs r1, #4
	bl sub_80AEB3C
	adds r0, r6, #0
	adds r1, r4, #0
	adds r2, r5, #0
	bl sub_80AEC4C
	adds r0, r6, #0
	adds r1, r4, #0
	adds r2, r5, #0
	bl sub_80AECCC
	ldr r1, _080AF688 @ =gBg0Tm
	movs r2, #0
	adds r0, r7, #0
	adds r0, #0x62
	movs r3, #0x1a
	lsls r0, r0, #1
	adds r0, r0, r1
_080AF66E:
	strh r2, [r0]
	adds r0, #2
	subs r3, #1
	cmp r3, #0
	bge _080AF66E
	movs r0, #5
	bl EnableBgSync
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080AF684: .4byte gBg2Tm
_080AF688: .4byte gBg0Tm

	thumb_func_start sub_80AF68C
sub_80AF68C: @ 0x080AF68C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r5, r0, #0
	movs r3, #0
	movs r1, #0x30
	ldrsh r0, [r5, r1]
	cmp r0, #6
	bls _080AF6A0
	b _080AF8E4
_080AF6A0:
	lsls r0, r0, #2
	ldr r1, _080AF6AC @ =_080AF6B0
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080AF6AC: .4byte _080AF6B0
_080AF6B0: @ jump table
	.4byte _080AF6CC @ case 0
	.4byte _080AF8C0 @ case 1
	.4byte _080AF8C0 @ case 2
	.4byte _080AF8C0 @ case 3
	.4byte _080AF8D0 @ case 4
	.4byte _080AF8D0 @ case 5
	.4byte _080AF8D0 @ case 6
_080AF6CC:
	ldr r0, _080AF6F0 @ =gpKeySt
	ldr r2, [r0]
	ldrh r1, [r2, #8]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _080AF6FC
	ldr r0, _080AF6F4 @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080AF752
	ldr r0, _080AF6F8 @ =0x0000038B
	bl m4aSongNumStart
	b _080AF752
	.align 2, 0
_080AF6F0: .4byte gpKeySt
_080AF6F4: .4byte gPlaySt
_080AF6F8: .4byte 0x0000038B
_080AF6FC:
	movs r4, #1
	adds r0, r4, #0
	ands r0, r1
	cmp r0, #0
	beq _080AF76C
	bl sub_80AEA24
	ldr r1, _080AF75C @ =gUnk_08DAF054
	lsls r0, r0, #0x10
	asrs r0, r0, #0xd
	adds r1, #4
	adds r0, r0, r1
	ldr r1, _080AF760 @ =gUnk_08DAF028
	ldr r1, [r1]
	movs r2, #0x2a
	ldrsh r1, [r1, r2]
	ldr r0, [r0]
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #0
	beq _080AF728
	b _080AF8E4
_080AF728:
	movs r0, #0
	bl sub_80AF278
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #3
	beq _080AF738
	b _080AF8E4
_080AF738:
	ldr r0, _080AF764 @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080AF74A
	ldr r0, _080AF768 @ =0x0000038A
	bl m4aSongNumStart
_080AF74A:
	adds r1, r5, #0
	adds r1, #0x36
	movs r0, #1
	strb r0, [r1]
_080AF752:
	adds r0, r5, #0
	bl Proc_Break
	b _080AF8E4
	.align 2, 0
_080AF75C: .4byte gUnk_08DAF054
_080AF760: .4byte gUnk_08DAF028
_080AF764: .4byte gPlaySt
_080AF768: .4byte 0x0000038A
_080AF76C:
	ldrh r1, [r2, #6]
	movs r0, #0xc0
	ands r0, r1
	cmp r0, #0
	beq _080AF850
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _080AF7CC
	ldr r0, _080AF7C8 @ =gUnk_08DAF028
	ldr r2, [r0]
	ldrh r1, [r2, #0x2a]
	movs r6, #0x2a
	ldrsh r0, [r2, r6]
	cmp r0, #0
	beq _080AF81A
	subs r0, r1, #1
	strh r0, [r2, #0x2a]
	movs r1, #0x2a
	ldrsh r0, [r2, r1]
	movs r3, #0x2c
	ldrsh r1, [r2, r3]
	subs r0, r0, r1
	cmp r0, #0
	bgt _080AF7C2
	ldrh r1, [r2, #0x2c]
	movs r6, #0x2c
	ldrsh r0, [r2, r6]
	cmp r0, #0
	beq _080AF7C2
	subs r0, r1, #1
	strh r0, [r2, #0x2c]
	movs r0, #0x2a
	ldrsh r1, [r2, r0]
	subs r1, #1
	adds r0, r5, #0
	movs r2, #0
	bl sub_80AF608
	ldrh r0, [r5, #0x2e]
	subs r0, #4
	strh r0, [r5, #0x2e]
	strh r4, [r5, #0x30]
_080AF7C2:
	movs r3, #1
	b _080AF81E
	.align 2, 0
_080AF7C8: .4byte gUnk_08DAF028
_080AF7CC:
	ldr r0, _080AF840 @ =gUnk_08DAF028
	ldr r2, [r0]
	movs r4, #0x2a
	ldrsh r1, [r2, r4]
	movs r6, #0x34
	ldrsh r0, [r2, r6]
	subs r0, #1
	cmp r1, r0
	bge _080AF81A
	ldrh r0, [r2, #0x2a]
	adds r0, #1
	strh r0, [r2, #0x2a]
	movs r0, #0x2a
	ldrsh r1, [r2, r0]
	movs r3, #0x2c
	ldrsh r0, [r2, r3]
	subs r0, r1, r0
	cmp r0, #4
	ble _080AF818
	movs r4, #0x34
	ldrsh r0, [r2, r4]
	subs r0, #1
	cmp r1, r0
	bge _080AF818
	ldrh r0, [r2, #0x2c]
	adds r0, #1
	strh r0, [r2, #0x2c]
	adds r1, #1
	movs r2, #0xa0
	lsls r2, r2, #1
	adds r0, r5, #0
	bl sub_80AF608
	ldrh r0, [r5, #0x2e]
	adds r0, #4
	strh r0, [r5, #0x2e]
	movs r0, #4
	strh r0, [r5, #0x30]
_080AF818:
	movs r3, #1
_080AF81A:
	cmp r3, #0
	beq _080AF850
_080AF81E:
	ldr r0, _080AF844 @ =gUnk_08DAF3B0
	adds r1, r5, #0
	bl Proc_Start
	movs r0, #5
	bl EnableBgSync
	ldr r0, _080AF848 @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080AF8E4
	ldr r0, _080AF84C @ =0x00000386
	bl m4aSongNumStart
	b _080AF8E4
	.align 2, 0
_080AF840: .4byte gUnk_08DAF028
_080AF844: .4byte gUnk_08DAF3B0
_080AF848: .4byte gPlaySt
_080AF84C: .4byte 0x00000386
_080AF850:
	ldr r0, _080AF8B0 @ =gpKeySt
	ldr r1, [r0]
	movs r0, #0x30
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _080AF8E4
	ldr r4, _080AF8B4 @ =gUnk_08DAF0C4
	bl sub_80AEA24
	ldr r1, _080AF8B8 @ =gUnk_08DAF054
	lsls r0, r0, #0x10
	asrs r0, r0, #0xd
	adds r1, #4
	mov r8, r1
	add r0, r8
	ldr r7, _080AF8BC @ =gUnk_08DAF028
	ldr r1, [r7]
	movs r2, #0x2a
	ldrsh r1, [r1, r2]
	ldr r0, [r0]
	adds r0, r0, r1
	movs r6, #0x2c
	ldrb r0, [r0]
	muls r0, r6, r0
	adds r4, #0x28
	adds r0, r0, r4
	ldr r0, [r0]
	cmp r0, #0
	beq _080AF8E4
	bl sub_80AEA24
	lsls r0, r0, #0x10
	asrs r0, r0, #0xd
	add r0, r8
	ldr r1, [r7]
	movs r3, #0x2a
	ldrsh r1, [r1, r3]
	ldr r0, [r0]
	adds r0, r0, r1
	ldrb r0, [r0]
	muls r0, r6, r0
	adds r0, r0, r4
	ldr r1, [r0]
	adds r0, r5, #0
	bl _call_via_r1
	b _080AF8E4
	.align 2, 0
_080AF8B0: .4byte gpKeySt
_080AF8B4: .4byte gUnk_08DAF0C4
_080AF8B8: .4byte gUnk_08DAF054
_080AF8BC: .4byte gUnk_08DAF028
_080AF8C0:
	ldrh r0, [r5, #0x2e]
	subs r0, #4
	strh r0, [r5, #0x2e]
	ldrh r0, [r5, #0x30]
	cmp r0, #3
	bne _080AF8E0
	movs r0, #0
	b _080AF8E2
_080AF8D0:
	ldrh r0, [r5, #0x2e]
	adds r0, #4
	strh r0, [r5, #0x2e]
	ldrh r0, [r5, #0x30]
	cmp r0, #6
	bne _080AF8E0
	movs r0, #0
	b _080AF8E2
_080AF8E0:
	adds r0, #1
_080AF8E2:
	strh r0, [r5, #0x30]
_080AF8E4:
	ldrh r2, [r5, #0x2e]
	movs r0, #2
	movs r1, #0
	bl SetBgOffset
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_80AF8F8
sub_80AF8F8: @ 0x080AF8F8
	push {r4, lr}
	adds r4, r0, #0
	bl EndMuralBackground
	ldr r0, _080AF91C @ =gUnk_08DAF3D0
	bl Proc_EndEach
	ldr r0, _080AF920 @ =gUnk_08DAF3B0
	bl Proc_EndEach
	adds r0, r4, #0
	adds r0, #0x36
	ldrb r0, [r0]
	cmp r0, #0
	bne _080AF924
	movs r0, #1
	b _080AF934
	.align 2, 0
_080AF91C: .4byte gUnk_08DAF3D0
_080AF920: .4byte gUnk_08DAF3B0
_080AF924:
	adds r0, r4, #0
	bl sub_808B4C0
	adds r0, r4, #0
	movs r1, #0
	bl Proc_Goto
	movs r0, #0
_080AF934:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_80AF93C
sub_80AF93C: @ 0x080AF93C
	adds r0, #0x37
	movs r1, #1
	strb r1, [r0]
	bx lr

	thumb_func_start sub_80AF944
sub_80AF944: @ 0x080AF944
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r3, [r5, #0x5c]
	ldr r0, [r5, #0x60]
	adds r0, r3, r0
	cmp r3, r0
	bge _080AF970
	ldr r2, _080AF978 @ =0x020144F8
	ldr r1, _080AF97C @ =gPal
	lsls r0, r3, #1
	adds r4, r0, r1
	adds r2, r0, r2
_080AF95C:
	ldrh r0, [r4]
	strh r0, [r2]
	adds r4, #2
	adds r2, #2
	adds r3, #1
	ldr r0, [r5, #0x5c]
	ldr r1, [r5, #0x60]
	adds r0, r0, r1
	cmp r3, r0
	blt _080AF95C
_080AF970:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080AF978: .4byte 0x020144F8
_080AF97C: .4byte gPal

	thumb_func_start nullsub_88
nullsub_88: @ 0x080AF980
	bx lr
	.align 2, 0

	thumb_func_start sub_80AF984
sub_80AF984: @ 0x080AF984
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	mov r8, r0
	mov r1, r8
	adds r1, #0x4e
	movs r2, #0x80
	lsls r2, r2, #1
	adds r0, r2, #0
	ldrh r1, [r1]
	subs r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov sb, r0
	mov r0, r8
	ldr r7, [r0, #0x5c]
	ldr r0, [r0, #0x60]
	adds r0, r7, r0
	cmp r7, r0
	bge _080AFA3A
	movs r1, #0xf8
	lsls r1, r1, #7
	mov sl, r1
_080AF9B6:
	lsls r2, r7, #1
	mov ip, r2
	ldr r0, _080AFA68 @ =0x020144F8
	add r0, ip
	ldrh r6, [r0]
	mov r1, sl
	ands r1, r6
	mov r0, r8
	ldr r4, [r0, #0x58]
	adds r0, r4, #0
	mov r2, sl
	ands r0, r2
	subs r0, r1, r0
	mov r1, sb
	muls r1, r0, r1
	adds r0, r1, #0
	cmp r0, #0
	bge _080AF9DC
	adds r0, #0xff
_080AF9DC:
	asrs r0, r0, #8
	adds r2, r0, r4
	mov r0, sl
	ands r2, r0
	movs r5, #0xf8
	lsls r5, r5, #2
	adds r1, r5, #0
	ands r1, r6
	adds r0, r4, #0
	ands r0, r5
	subs r0, r1, r0
	mov r1, sb
	muls r1, r0, r1
	adds r0, r1, #0
	cmp r0, #0
	bge _080AF9FE
	adds r0, #0xff
_080AF9FE:
	asrs r0, r0, #8
	adds r3, r0, r4
	ands r3, r5
	movs r5, #0x1f
	adds r1, r5, #0
	ands r1, r6
	adds r0, r4, #0
	ands r0, r5
	subs r0, r1, r0
	mov r1, sb
	muls r1, r0, r1
	adds r0, r1, #0
	cmp r0, #0
	bge _080AFA1C
	adds r0, #0xff
_080AFA1C:
	asrs r0, r0, #8
	adds r0, r0, r4
	ands r0, r5
	ldr r1, _080AFA6C @ =gPal
	add r1, ip
	orrs r2, r3
	orrs r2, r0
	strh r2, [r1]
	adds r7, #1
	mov r2, r8
	ldr r0, [r2, #0x5c]
	ldr r1, [r2, #0x60]
	adds r0, r0, r1
	cmp r7, r0
	blt _080AF9B6
_080AFA3A:
	bl EnablePalSync
	mov r1, r8
	adds r1, #0x4e
	mov r0, r8
	adds r0, #0x64
	ldrh r2, [r1]
	ldrh r0, [r0]
	adds r0, r2, r0
	strh r0, [r1]
	mov r0, sb
	cmp r0, #0
	bne _080AFA5A
	mov r0, r8
	bl Proc_Break
_080AFA5A:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080AFA68: .4byte 0x020144F8
_080AFA6C: .4byte gPal

	thumb_func_start sub_80AFA70
sub_80AFA70: @ 0x080AFA70
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	mov r8, r0
	mov r1, r8
	adds r1, #0x4e
	movs r2, #0x80
	lsls r2, r2, #1
	adds r0, r2, #0
	ldrh r1, [r1]
	subs r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov sb, r0
	cmp r0, #0
	beq _080AFB2A
	mov r3, r8
	ldr r6, [r3, #0x5c]
	ldr r0, [r3, #0x60]
	adds r0, r6, r0
	cmp r6, r0
	bge _080AFB2A
	movs r4, #0xf8
	lsls r4, r4, #7
	mov sl, r4
_080AFAA6:
	mov r0, r8
	ldr r5, [r0, #0x58]
	adds r1, r5, #0
	mov r2, sl
	ands r1, r2
	lsls r3, r6, #1
	mov ip, r3
	ldr r2, _080AFB8C @ =0x020144F8
	add r2, ip
	mov r0, sl
	ldrh r4, [r2]
	ands r0, r4
	subs r0, r1, r0
	mov r1, sb
	muls r1, r0, r1
	adds r0, r1, #0
	cmp r0, #0
	bge _080AFACC
	adds r0, #0xff
_080AFACC:
	asrs r0, r0, #8
	ldrh r4, [r2]
	adds r2, r0, r4
	mov r3, sl
	ands r2, r3
	movs r7, #0xf8
	lsls r7, r7, #2
	adds r1, r5, #0
	ands r1, r7
	adds r0, r4, #0
	ands r0, r7
	subs r0, r1, r0
	mov r1, sb
	muls r1, r0, r1
	adds r0, r1, #0
	cmp r0, #0
	bge _080AFAF0
	adds r0, #0xff
_080AFAF0:
	asrs r0, r0, #8
	adds r3, r0, r4
	ands r3, r7
	movs r1, #0x1f
	ands r5, r1
	adds r0, r4, #0
	ands r0, r1
	subs r0, r5, r0
	mov r5, sb
	muls r5, r0, r5
	adds r0, r5, #0
	cmp r0, #0
	bge _080AFB0C
	adds r0, #0xff
_080AFB0C:
	asrs r0, r0, #8
	adds r0, r0, r4
	ands r0, r1
	ldr r1, _080AFB90 @ =gPal
	add r1, ip
	orrs r2, r3
	orrs r2, r0
	strh r2, [r1]
	adds r6, #1
	mov r1, r8
	ldr r0, [r1, #0x5c]
	ldr r1, [r1, #0x60]
	adds r0, r0, r1
	cmp r6, r0
	blt _080AFAA6
_080AFB2A:
	bl EnablePalSync
	mov r1, r8
	adds r1, #0x4e
	mov r0, r8
	adds r0, #0x64
	ldrh r2, [r1]
	ldrh r0, [r0]
	adds r0, r2, r0
	strh r0, [r1]
	mov r3, sb
	cmp r3, #0
	bne _080AFB7E
	mov r4, r8
	ldr r6, [r4, #0x5c]
	ldr r0, [r4, #0x60]
	adds r0, r6, r0
	cmp r6, r0
	bge _080AFB78
	ldr r0, _080AFB90 @ =gPal
	ldr r2, _080AFB8C @ =0x020144F8
	lsls r1, r6, #1
	adds r3, r1, r0
	adds r2, r1, r2
_080AFB5A:
	ldrh r0, [r2]
	strh r0, [r3]
	ldrh r0, [r2]
	strh r0, [r3]
	ldrh r0, [r2]
	strh r0, [r3]
	adds r3, #2
	adds r2, #2
	adds r6, #1
	mov r5, r8
	ldr r0, [r5, #0x5c]
	ldr r1, [r5, #0x60]
	adds r0, r0, r1
	cmp r6, r0
	blt _080AFB5A
_080AFB78:
	mov r0, r8
	bl Proc_Break
_080AFB7E:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080AFB8C: .4byte 0x020144F8
_080AFB90: .4byte gPal

	thumb_func_start sub_80AFB94
sub_80AFB94: @ 0x080AFB94
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r6, r1, #0
	adds r4, r2, #0
	adds r1, r3, #0
	ldr r0, _080AFBC0 @ =gUnk_08DAF5FC
	bl Proc_StartBlocking
	adds r1, r0, #0
	adds r0, #0x64
	movs r2, #0
	strh r5, [r0]
	str r4, [r1, #0x58]
	subs r0, #0x16
	strh r2, [r0]
	cmp r6, #1
	beq _080AFBD0
	cmp r6, #1
	bgt _080AFBC4
	cmp r6, #0
	beq _080AFBCA
	b _080AFBE0
	.align 2, 0
_080AFBC0: .4byte gUnk_08DAF5FC
_080AFBC4:
	cmp r6, #2
	beq _080AFBD8
	b _080AFBE0
_080AFBCA:
	movs r0, #0x80
	str r0, [r1, #0x5c]
	b _080AFBDE
_080AFBD0:
	str r2, [r1, #0x5c]
	movs r0, #0x80
	lsls r0, r0, #2
	b _080AFBDE
_080AFBD8:
	str r2, [r1, #0x5c]
	movs r0, #0x80
	lsls r0, r0, #3
_080AFBDE:
	str r0, [r1, #0x60]
_080AFBE0:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_80AFBE8
sub_80AFBE8: @ 0x080AFBE8
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r6, r1, #0
	adds r4, r2, #0
	adds r1, r3, #0
	ldr r0, _080AFC14 @ =gUnk_08DAF62C
	bl Proc_StartBlocking
	adds r1, r0, #0
	adds r0, #0x64
	movs r2, #0
	strh r5, [r0]
	str r4, [r1, #0x58]
	subs r0, #0x16
	strh r2, [r0]
	cmp r6, #1
	beq _080AFC24
	cmp r6, #1
	bgt _080AFC18
	cmp r6, #0
	beq _080AFC1E
	b _080AFC34
	.align 2, 0
_080AFC14: .4byte gUnk_08DAF62C
_080AFC18:
	cmp r6, #2
	beq _080AFC2C
	b _080AFC34
_080AFC1E:
	movs r0, #0x80
	str r0, [r1, #0x5c]
	b _080AFC32
_080AFC24:
	str r2, [r1, #0x5c]
	movs r0, #0x80
	lsls r0, r0, #2
	b _080AFC32
_080AFC2C:
	str r2, [r1, #0x5c]
	movs r0, #0x80
	lsls r0, r0, #3
_080AFC32:
	str r0, [r1, #0x60]
_080AFC34:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_80AFC3C
sub_80AFC3C: @ 0x080AFC3C
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	ldr r4, _080AFCC0 @ =gDispIo
	movs r0, #8
	rsbs r0, r0, #0
	ldrb r1, [r4]
	ands r0, r1
	strb r0, [r4]
	movs r0, #0
	bl InitBgs
	bl sub_8055670
	bl sub_80647C8
	movs r5, #0
	str r5, [r6, #0x38]
	str r5, [r6, #0x3c]
	movs r0, #2
	rsbs r0, r0, #0
	ldrb r1, [r4, #1]
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
	strb r0, [r4, #1]
	movs r0, #0
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	movs r0, #1
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	movs r0, #2
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	movs r0, #3
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	adds r0, r6, #0
	adds r0, #0x34
	strb r5, [r0]
	adds r1, r6, #0
	adds r1, #0x2c
	movs r0, #2
	strb r0, [r1]
	adds r0, r6, #0
	adds r0, #0x32
	strb r5, [r0]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080AFCC0: .4byte gDispIo

	thumb_func_start sub_80AFCC4
sub_80AFCC4: @ 0x080AFCC4
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _080AFD1C @ =ProcScr_BmFadeIN
	bl Proc_Find
	bl Proc_End
	ldr r0, _080AFD20 @ =ProcScr_BmFadeOUT
	bl Proc_Find
	bl Proc_End
	adds r0, r4, #0
	bl EndAllProcChildren
	movs r0, #1
	bl FadeBgmOut
	ldr r2, _080AFD24 @ =gDispIo
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
	movs r0, #0
	bl SetNextGameAction
	adds r0, r4, #0
	movs r1, #5
	bl Proc_Goto
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080AFD1C: .4byte ProcScr_BmFadeIN
_080AFD20: .4byte ProcScr_BmFadeOUT
_080AFD24: .4byte gDispIo

	thumb_func_start sub_80AFD28
sub_80AFD28: @ 0x080AFD28
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r6, r4, #0
	adds r6, #0x2c
	ldrb r0, [r6]
	cmp r0, #2
	beq _080AFD46
	cmp r0, #2
	bgt _080AFD40
	cmp r0, #1
	beq _080AFD8E
	b _080AFDA2
_080AFD40:
	cmp r0, #3
	beq _080AFD80
	b _080AFDA2
_080AFD46:
	adds r0, r4, #0
	adds r0, #0x33
	ldrb r0, [r0]
	adds r5, r4, #0
	adds r5, #0x34
	ldrb r1, [r5]
	bl sub_80B10D4
	str r0, [r4, #0x4c]
	cmp r0, #0
	bne _080AFD6C
	movs r0, #1
	bl SetNextGameAction
	adds r0, r4, #0
	movs r1, #4
	bl Proc_Goto
	b _080AFDA2
_080AFD6C:
	ldrb r0, [r5]
	adds r0, #1
	strb r0, [r5]
	movs r0, #1
	strb r0, [r6]
	ldr r1, [r4, #0x4c]
	adds r0, r4, #0
	bl sub_80B0170
	b _080AFDA2
_080AFD80:
	ldr r1, [r4, #0x4c]
	adds r0, r4, #0
	bl sub_80B0EBC
	movs r0, #1
	strb r0, [r6]
	b _080AFDA2
_080AFD8E:
	ldr r0, _080AFDA8 @ =gpKeySt
	ldr r1, [r0]
	movs r0, #0xb
	ldrh r1, [r1, #4]
	ands r0, r1
	cmp r0, #0
	beq _080AFDA2
	adds r0, r4, #0
	bl sub_80AFCC4
_080AFDA2:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080AFDA8: .4byte gpKeySt

	thumb_func_start sub_80AFDAC
sub_80AFDAC: @ 0x080AFDAC
	push {lr}
	ldr r0, _080AFDD0 @ =gUnk_08DAF65C
	bl Proc_Find
	adds r1, r0, #0
	cmp r1, #0
	beq _080AFDD4
	adds r0, #0x33
	ldrb r0, [r0]
	adds r1, #0x34
	ldrb r1, [r1]
	bl sub_80B10D4
	cmp r0, #0
	bne _080AFDD4
	movs r0, #1
	b _080AFDD6
	.align 2, 0
_080AFDD0: .4byte gUnk_08DAF65C
_080AFDD4:
	movs r0, #0
_080AFDD6:
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_80AFDDC
sub_80AFDDC: @ 0x080AFDDC
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _080AFDF4 @ =gUnk_08DAF65C
	bl Proc_Find
	cmp r0, #0
	beq _080AFDEE
	adds r0, #0x2c
	strb r4, [r0]
_080AFDEE:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080AFDF4: .4byte gUnk_08DAF65C

	thumb_func_start sub_80AFDF8
sub_80AFDF8: @ 0x080AFDF8
	push {lr}
	movs r0, #3
	bl FadeBgmOut
	pop {r0}
	bx r0

	thumb_func_start sub_80AFE04
sub_80AFE04: @ 0x080AFE04
	push {lr}
	bl EndAllProcChildren
	bl sub_8055690
	movs r0, #0
	bl sub_8012D60
	bl sub_80647F8
	pop {r0}
	bx r0

	thumb_func_start sub_80AFE1C
sub_80AFE1C: @ 0x080AFE1C
	push {r4, lr}
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	ldr r0, _080AFE34 @ =gUnk_08DAF65C
	bl Proc_StartBlocking
	adds r0, #0x33
	strb r4, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080AFE34: .4byte gUnk_08DAF65C

	thumb_func_start sub_80AFE38
sub_80AFE38: @ 0x080AFE38
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x10
	str r2, [sp, #8]
	str r3, [sp, #0xc]
	ldr r2, [sp, #0x30]
	ldr r3, [sp, #0x34]
	ldr r4, [sp, #0x38]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp, #4]
	lsls r1, r1, #0x18
	lsrs r7, r1, #0x18
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	mov sl, r2
	lsls r3, r3, #0x10
	lsrs r3, r3, #0x10
	mov r8, r3
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	movs r5, #1
	ldr r2, _080AFE94 @ =gPal
	movs r0, #0x80
	lsls r0, r0, #1
	ldr r1, _080AFE98 @ =0x0000021E
	adds r6, r2, r1
	adds r0, r4, r0
	lsls r1, r7, #5
	lsls r0, r0, #1
	adds r0, r0, r2
	adds r3, r0, #2
	ldr r0, _080AFE9C @ =0x00000222
	adds r1, r1, r0
	adds r1, r1, r2
_080AFE84:
	adds r0, r5, r4
	cmp r0, #0xf
	ble _080AFEA0
	ldrh r0, [r6]
	strh r0, [r1]
	adds r2, r7, #1
	mov sb, r2
	b _080AFEA8
	.align 2, 0
_080AFE94: .4byte gPal
_080AFE98: .4byte 0x0000021E
_080AFE9C: .4byte 0x00000222
_080AFEA0:
	ldrh r0, [r3]
	strh r0, [r1]
	adds r0, r7, #1
	mov sb, r0
_080AFEA8:
	adds r1, #2
	adds r3, #2
	adds r5, #1
	cmp r5, #0xf
	ble _080AFE84
	bl EnablePalSync
	mov r1, sl
	cmp r1, #7
	bhi _080AFEC0
	movs r2, #8
	mov sl, r2
_080AFEC0:
	mov r4, r8
	cmp r4, #7
	bhi _080AFECA
	movs r0, #8
	mov r8, r0
_080AFECA:
	ldr r4, _080AFF64 @ =gSinLut
	ldr r1, _080AFF68 @ =gCosLut
	movs r2, #0
	ldrsh r0, [r1, r2]
	lsls r0, r0, #4
	mov r1, sl
	bl Div
	adds r6, r0, #0
	lsls r6, r6, #0x10
	asrs r6, r6, #0x10
	movs r1, #0
	ldrsh r0, [r4, r1]
	rsbs r0, r0, #0
	lsls r0, r0, #4
	mov r1, r8
	bl Div
	adds r5, r0, #0
	lsls r5, r5, #0x10
	asrs r5, r5, #0x10
	movs r2, #0
	ldrsh r0, [r4, r2]
	lsls r0, r0, #4
	mov r1, sl
	bl Div
	adds r4, r0, #0
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	ldr r1, _080AFF68 @ =gCosLut
	movs r2, #0
	ldrsh r0, [r1, r2]
	lsls r0, r0, #4
	mov r1, r8
	bl Div
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	str r0, [sp]
	adds r0, r7, #0
	adds r1, r6, #0
	adds r2, r5, #0
	adds r3, r4, #0
	bl SetObjAffine
	ldr r0, _080AFF6C @ =0x000001FF
	ldr r4, [sp, #8]
	ands r4, r0
	lsls r1, r7, #9
	adds r1, r4, r1
	ldr r2, [sp, #0xc]
	ands r2, r0
	str r2, [sp, #0xc]
	ldr r3, _080AFF70 @ =gUnk_08DAF6B4
	ldr r4, [sp, #4]
	adds r0, r4, r7
	lsls r0, r0, #2
	movs r2, #0xf
	mov r4, sb
	ands r4, r2
	lsls r2, r4, #0xc
	adds r0, r0, r2
	str r0, [sp]
	movs r0, #4
	ldr r2, [sp, #0xc]
	bl PutSpriteExt
	add sp, #0x10
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080AFF64: .4byte gSinLut
_080AFF68: .4byte gCosLut
_080AFF6C: .4byte 0x000001FF
_080AFF70: .4byte gUnk_08DAF6B4

	thumb_func_start sub_80AFF74
sub_80AFF74: @ 0x080AFF74
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r3, _080B0030 @ =gDispIo
	movs r0, #0x21
	rsbs r0, r0, #0
	ldrb r1, [r3, #1]
	ands r0, r1
	movs r1, #0x41
	rsbs r1, r1, #0
	ands r0, r1
	movs r1, #0x7f
	ands r0, r1
	strb r0, [r3, #1]
	adds r1, r3, #0
	adds r1, #0x3c
	movs r0, #0x3f
	ldrb r2, [r1]
	ands r0, r2
	strb r0, [r1]
	adds r2, r3, #0
	adds r2, #0x44
	movs r1, #0
	movs r0, #0x10
	strb r0, [r2]
	adds r0, r3, #0
	adds r0, #0x45
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	strh r1, [r5, #0x2a]
	movs r2, #0
	movs r1, #9
	adds r0, r5, #0
	adds r0, #0x58
_080AFFB8:
	str r2, [r0]
	subs r0, #4
	subs r1, #1
	cmp r1, #0
	bge _080AFFB8
	movs r0, #0
	str r0, [r5, #0x5c]
	ldr r0, [r5, #0x64]
	ldr r0, [r0, #8]
	ldr r1, _080B0034 @ =0x06010000
	bl Decompress
	ldr r0, _080B0038 @ =gUnk_0844186C
	movs r1, #0x80
	lsls r1, r1, #2
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r4, _080B003C @ =gUnk_0843FB60
	movs r1, #0xf0
	lsls r1, r1, #2
	adds r0, r4, #0
	movs r2, #0x20
	bl ApplyPaletteExt
	movs r1, #0xf8
	lsls r1, r1, #2
	adds r0, r4, #0
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r0, _080B0040 @ =gUnk_0843F1A4
	ldr r1, _080B0044 @ =0x06016000
	bl Decompress
	ldr r0, [r5, #0x64]
	ldrb r2, [r0, #0xd]
	lsls r1, r2, #3
	subs r1, r1, r2
	lsls r1, r1, #2
	movs r0, #0xf0
	subs r0, r0, r1
	asrs r0, r0, #1
	subs r0, #0x10
	strh r0, [r5, #0x2c]
	adds r0, r5, #0
	movs r1, #0
	bl sub_80B03B4
	str r0, [r5, #0x34]
	ldr r0, [r5, #0x64]
	ldrb r1, [r0, #0xf]
	adds r0, r5, #0
	bl sub_80B0694
	str r0, [r5, #0x5c]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080B0030: .4byte gDispIo
_080B0034: .4byte 0x06010000
_080B0038: .4byte gUnk_0844186C
_080B003C: .4byte gUnk_0843FB60
_080B0040: .4byte gUnk_0843F1A4
_080B0044: .4byte 0x06016000

	thumb_func_start sub_80B0048
sub_80B0048: @ 0x080B0048
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r0, _080B009C @ =gDispIo
	mov ip, r0
	mov r3, ip
	adds r3, #0x3c
	movs r2, #0x3f
	ldrb r0, [r3]
	ands r2, r0
	movs r0, #0x80
	orrs r2, r0
	mov r0, ip
	adds r0, #0x44
	movs r5, #0
	strb r5, [r0]
	adds r0, #1
	strb r5, [r0]
	ldrh r0, [r4, #0x2a]
	lsrs r1, r0, #1
	movs r0, #0x10
	subs r0, r0, r1
	mov r1, ip
	adds r1, #0x46
	strb r0, [r1]
	movs r0, #0x20
	orrs r2, r0
	strb r2, [r3]
	ldrh r0, [r4, #0x2a]
	adds r0, #1
	strh r0, [r4, #0x2a]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0x20
	bne _080B0094
	strh r5, [r4, #0x2a]
	adds r0, r4, #0
	bl Proc_Break
_080B0094:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080B009C: .4byte gDispIo

	thumb_func_start sub_80B00A0
sub_80B00A0: @ 0x080B00A0
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x2a]
	cmp r0, #0x5f
	bls _080B00B4
	adds r0, r4, #0
	bl Proc_Break
	movs r0, #0
	b _080B00F6
_080B00B4:
	cmp r0, #0xf
	bls _080B00F2
	ldrh r1, [r4, #0x2a]
	adds r6, r1, #0
	subs r6, #0x10
	movs r0, #3
	ands r0, r6
	cmp r0, #0
	bne _080B00F2
	adds r0, r6, #0
	cmp r6, #0
	bge _080B00D0
	adds r0, r1, #0
	subs r0, #0xd
_080B00D0:
	asrs r0, r0, #2
	adds r5, r0, #1
	ldr r0, [r4, #0x64]
	ldrb r0, [r0, #0xd]
	cmp r5, r0
	bge _080B00F2
	lsls r1, r5, #0x18
	lsrs r1, r1, #0x18
	adds r0, r4, #0
	bl sub_80B03B4
	adds r2, r0, #0
	lsls r1, r5, #2
	adds r0, r4, #0
	adds r0, #0x34
	adds r0, r0, r1
	str r2, [r0]
_080B00F2:
	ldrh r0, [r4, #0x2a]
	adds r0, #1
_080B00F6:
	strh r0, [r4, #0x2a]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_80B0100
sub_80B0100: @ 0x080B0100
	push {r4, r5, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x2a]
	cmp r0, #0x14
	bne _080B0112
	ldr r0, [r4, #0x5c]
	movs r1, #4
	bl Proc_Goto
_080B0112:
	ldrh r0, [r4, #0x2a]
	cmp r0, #0x4f
	bls _080B0122
	adds r0, r4, #0
	bl Proc_Break
	movs r0, #0
	b _080B0158
_080B0122:
	ldrh r5, [r4, #0x2a]
	adds r0, r5, #0
	movs r1, #6
	bl __umodsi3
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _080B0154
	adds r0, r5, #0
	movs r1, #6
	bl __udivsi3
	ldr r1, [r4, #0x64]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldrb r1, [r1, #0xd]
	cmp r0, r1
	bhs _080B0154
	lsls r0, r0, #2
	adds r1, r4, #0
	adds r1, #0x34
	adds r1, r1, r0
	ldr r0, [r1]
	bl Proc_Break
_080B0154:
	ldrh r0, [r4, #0x2a]
	adds r0, #1
_080B0158:
	strh r0, [r4, #0x2a]
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start sub_80B0160
sub_80B0160: @ 0x080B0160
	push {lr}
	bl EndAllProcChildren
	movs r0, #3
	bl sub_80AFDDC
	pop {r0}
	bx r0

	thumb_func_start sub_80B0170
sub_80B0170: @ 0x080B0170
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r0, _080B0188 @ =gUnk_08DAF6BC
	adds r1, r4, #0
	bl Proc_Start
	str r4, [r0, #0x60]
	str r5, [r0, #0x64]
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_080B0188: .4byte gUnk_08DAF6BC

	thumb_func_start sub_80B018C
sub_80B018C: @ 0x080B018C
	push {r4, lr}
	adds r3, r0, #0
	movs r0, #0
	strh r0, [r3, #0x2a]
	ldr r0, [r3, #0x14]
	ldr r0, [r0, #0x64]
	ldrb r1, [r0, #0xc]
	adds r0, r3, #0
	adds r0, #0x2c
	strb r1, [r0]
	ldr r1, [r3, #0x14]
	adds r2, r3, #0
	adds r2, #0x2d
	ldrb r4, [r2]
	lsls r0, r4, #3
	subs r0, r0, r4
	lsls r0, r0, #2
	ldrh r1, [r1, #0x2c]
	adds r0, r1, r0
	strh r0, [r3, #0x2e]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_80B01BC
sub_80B01BC: @ 0x080B01BC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x18
	adds r7, r0, #0
	movs r0, #0x2d
	adds r0, r0, r7
	mov sb, r0
	ldrb r1, [r0]
	str r1, [sp, #0xc]
	cmp r1, #0
	bne _080B029C
	ldr r3, _080B0294 @ =gSinLut
	movs r2, #0xa0
	lsls r2, r2, #1
	adds r0, r3, r2
	movs r1, #0
	ldrsh r4, [r0, r1]
	asrs r4, r4, #6
	mov sl, r4
	adds r0, r3, #0
	adds r0, #0xc0
	movs r2, #0
	ldrsh r0, [r0, r2]
	lsls r5, r0, #1
	adds r5, r5, r0
	asrs r5, r5, #9
	ldrh r0, [r7, #0x2a]
	movs r2, #0xc0
	subs r2, r2, r0
	movs r1, #0xff
	ands r2, r1
	adds r1, r2, #0
	adds r1, #0x40
	lsls r1, r1, #1
	adds r1, r1, r3
	movs r4, #0
	ldrsh r1, [r1, r4]
	asrs r6, r1, #6
	lsls r2, r2, #1
	adds r2, r2, r3
	movs r1, #0
	ldrsh r2, [r2, r1]
	lsls r1, r2, #1
	adds r1, r1, r2
	asrs r3, r1, #9
	lsls r0, r0, #8
	movs r1, #0x60
	str r3, [sp, #0x14]
	bl __divsi3
	movs r2, #0x80
	lsls r2, r2, #2
	adds r1, r2, #0
	subs r1, r1, r0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	adds r0, r7, #0
	adds r0, #0x2c
	ldrb r0, [r0]
	mov r8, r0
	mov r4, sb
	ldrb r4, [r4]
	mov sb, r4
	movs r0, #0x2e
	ldrsh r4, [r7, r0]
	adds r4, r4, r6
	mov r2, sl
	subs r4, r4, r2
	ldr r0, _080B0298 @ =0x000001FF
	ands r4, r0
	subs r5, #0x18
	ldr r3, [sp, #0x14]
	subs r5, r3, r5
	ands r5, r0
	str r1, [sp]
	str r1, [sp, #4]
	ldrh r0, [r7, #0x2a]
	movs r1, #0xc
	bl __divsi3
	movs r1, #8
	subs r1, r1, r0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	str r1, [sp, #8]
	mov r0, r8
	mov r1, sb
	adds r2, r4, #0
	adds r3, r5, #0
	bl sub_80AFE38
	ldrh r0, [r7, #0x2a]
	adds r0, #4
	strh r0, [r7, #0x2a]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0x60
	bne _080B02F0
	mov r4, sp
	ldrh r4, [r4, #0xc]
	strh r4, [r7, #0x2a]
	adds r0, r7, #0
	bl Proc_Break
	b _080B02F0
	.align 2, 0
_080B0294: .4byte gSinLut
_080B0298: .4byte 0x000001FF
_080B029C:
	ldrh r1, [r7, #0x2a]
	adds r0, r1, #0
	adds r2, r1, #0
	asrs r4, r0, #4
	movs r0, #0x10
	subs r6, r0, r4
	adds r3, r6, #0
	adds r0, r7, #0
	adds r0, #0x2c
	ldrb r5, [r0]
	mov r0, sb
	ldrb r6, [r0]
	movs r2, #0x2e
	ldrsh r0, [r7, r2]
	subs r2, r0, r3
	movs r0, #0x18
	subs r3, r0, r3
	str r1, [sp]
	adds r0, #0xe8
	mov r8, r0
	str r0, [sp, #4]
	movs r0, #0x10
	subs r0, r0, r4
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp, #8]
	adds r0, r5, #0
	adds r1, r6, #0
	bl sub_80AFE38
	ldrh r0, [r7, #0x2a]
	adds r0, #0x10
	strh r0, [r7, #0x2a]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, r8
	bne _080B02F0
	movs r0, #0
	strh r0, [r7, #0x2a]
	adds r0, r7, #0
	bl Proc_Break
_080B02F0:
	add sp, #0x18
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_80B0300
sub_80B0300: @ 0x080B0300
	push {r4, r5, lr}
	sub sp, #0xc
	adds r5, r0, #0
	adds r0, #0x2c
	ldrb r0, [r0]
	adds r1, r5, #0
	adds r1, #0x2d
	ldrb r1, [r1]
	movs r3, #0x2e
	ldrsh r2, [r5, r3]
	movs r3, #0x80
	lsls r3, r3, #1
	str r3, [sp]
	str r3, [sp, #4]
	movs r4, #0
	str r4, [sp, #8]
	movs r3, #0x18
	bl sub_80AFE38
	strh r4, [r5, #0x2a]
	add sp, #0xc
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start sub_80B0330
sub_80B0330: @ 0x080B0330
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #0xc
	adds r6, r0, #0
	ldrh r1, [r6, #0x2a]
	movs r7, #0x80
	lsls r7, r7, #1
	adds r2, r1, r7
	subs r3, r7, r1
	movs r0, #0x2e
	ldrsh r4, [r6, r0]
	adds r5, r4, #0
	subs r5, #0x58
	adds r0, r5, #0
	muls r0, r1, r0
	muls r0, r1, r0
	asrs r5, r0, #0xf
	adds r0, r6, #0
	adds r0, #0x2c
	ldrb r0, [r0]
	mov ip, r0
	movs r0, #0x2d
	adds r0, r0, r6
	mov r8, r0
	ldrb r1, [r0]
	adds r4, r4, r5
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	str r2, [sp]
	lsls r3, r3, #0x10
	lsrs r3, r3, #0x10
	str r3, [sp, #4]
	ldrh r0, [r6, #0x2a]
	asrs r0, r0, #4
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp, #8]
	mov r0, ip
	adds r2, r4, #0
	movs r3, #0x18
	bl sub_80AFE38
	ldrh r2, [r6, #0x2a]
	cmp r2, r7
	bne _080B03A2
	ldr r0, [r6, #0x14]
	mov r3, r8
	ldrb r3, [r3]
	lsls r1, r3, #2
	adds r0, #0x34
	adds r0, r0, r1
	movs r1, #0
	str r1, [r0]
	adds r0, r6, #0
	bl Proc_Break
_080B03A2:
	ldrh r0, [r6, #0x2a]
	adds r0, #8
	strh r0, [r6, #0x2a]
	add sp, #0xc
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_80B03B4
sub_80B03B4: @ 0x080B03B4
	push {r4, lr}
	adds r2, r0, #0
	lsls r4, r1, #0x18
	lsrs r4, r4, #0x18
	ldr r0, _080B03D0 @ =gUnk_08DAF70C
	adds r1, r2, #0
	bl Proc_Start
	adds r1, r0, #0
	adds r1, #0x2d
	strb r4, [r1]
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080B03D0: .4byte gUnk_08DAF70C

	thumb_func_start sub_80B03D4
sub_80B03D4: @ 0x080B03D4
	push {lr}
	bl EnablePalSync
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_80B03E0
sub_80B03E0: @ 0x080B03E0
	push {r4, r5, r6, r7, lr}
	adds r3, r0, #0
	movs r0, #0
	strh r0, [r3, #0x2a]
	ldr r0, _080B0444 @ =gPal
	movs r1, #0
	movs r4, #0xf
	ldr r2, _080B0448 @ =0x000003FE
	adds r0, r0, r2
_080B03F2:
	strh r1, [r0]
	subs r0, #2
	subs r4, #1
	cmp r4, #0
	bge _080B03F2
	adds r0, r3, #0
	adds r0, #0x2e
	movs r1, #0
	strb r1, [r0]
	adds r2, r3, #0
	adds r2, #0x2d
	strb r1, [r2]
	movs r4, #0
	adds r7, r3, #0
	adds r7, #0x2c
	adds r6, r0, #0
	adds r5, r2, #0
_080B0414:
	ldrb r0, [r7]
	bl GetClassData
	adds r0, #0x2c
	adds r0, r0, r4
	ldrb r0, [r0]
	cmp r0, #0
	beq _080B0434
	movs r0, #1
	lsls r0, r4
	ldrb r1, [r6]
	orrs r0, r1
	strb r0, [r6]
	ldrb r0, [r5]
	adds r0, #1
	strb r0, [r5]
_080B0434:
	adds r4, #1
	cmp r4, #7
	ble _080B0414
	bl EnablePalSync
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B0444: .4byte gPal
_080B0448: .4byte 0x000003FE

	thumb_func_start sub_80B044C
sub_80B044C: @ 0x080B044C
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #4
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r8, r0
	lsls r1, r1, #0x18
	movs r7, #0xe0
	lsls r7, r7, #8
	cmp r1, #0
	beq _080B046A
	movs r7, #0xf0
	lsls r7, r7, #8
_080B046A:
	ldr r4, _080B04AC @ =gUnk_08DAF900
	str r7, [sp]
	movs r0, #4
	movs r1, #0x74
	movs r2, #0x48
	adds r3, r4, #0
	bl PutSpriteExt
	movs r5, #0
	cmp r5, r8
	bge _080B04D6
	mov sb, r4
	movs r6, #0x74
	movs r4, #0x74
_080B0486:
	mov r0, r8
	subs r0, #1
	cmp r5, r0
	bge _080B04B0
	str r7, [sp]
	movs r0, #4
	adds r1, r4, #0
	movs r2, #0x48
	mov r3, sb
	bl PutSpriteExt
	str r7, [sp]
	movs r0, #4
	adds r1, r6, #0
	movs r2, #0x48
	mov r3, sb
	bl PutSpriteExt
	b _080B04CC
	.align 2, 0
_080B04AC: .4byte gUnk_08DAF900
_080B04B0:
	str r7, [sp]
	movs r0, #4
	adds r1, r4, #0
	movs r2, #0x48
	ldr r3, _080B04E4 @ =gUnk_08DAF8F8
	bl PutSpriteExt
	str r7, [sp]
	movs r0, #4
	adds r1, r6, #0
	movs r2, #0x48
	ldr r3, _080B04E8 @ =gUnk_08DAF908
	bl PutSpriteExt
_080B04CC:
	adds r6, #8
	subs r4, #8
	adds r5, #1
	cmp r5, r8
	blt _080B0486
_080B04D6:
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B04E4: .4byte gUnk_08DAF8F8
_080B04E8: .4byte gUnk_08DAF908

	thumb_func_start sub_80B04EC
sub_80B04EC: @ 0x080B04EC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	mov r8, r1
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	mov sb, r2
	movs r0, #0xe0
	lsls r0, r0, #8
	mov sl, r0
	cmp r5, #0
	beq _080B0518
	movs r1, #0xf0
	lsls r1, r1, #8
	mov sl, r1
_080B0518:
	movs r4, #0
	ldr r6, _080B05A8 @ =gPal
	movs r7, #0xf8
	lsls r7, r7, #2
	adds r3, r6, r7
	lsls r2, r5, #0x10
	movs r0, #0xf0
	lsls r0, r0, #1
	mov ip, r0
_080B052A:
	adds r0, r5, r4
	movs r1, #0xf
	cmp r0, #0xf
	bgt _080B0534
	lsrs r1, r2, #0x10
_080B0534:
	mov r7, ip
	adds r0, r1, r7
	lsls r0, r0, #1
	adds r0, r0, r6
	ldrh r0, [r0]
	strh r0, [r3]
	adds r3, #2
	movs r0, #0x80
	lsls r0, r0, #9
	adds r2, r2, r0
	adds r4, #1
	cmp r4, #0xf
	ble _080B052A
	bl EnablePalSync
	movs r4, #0
	mov r1, r8
	lsls r0, r1, #5
	subs r0, #0x88
	ldr r6, _080B05AC @ =gUnk_08DAF8C4
	rsbs r5, r0, #0
_080B055E:
	mov r0, sb
	asrs r0, r4
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _080B0580
	ldr r1, _080B05B0 @ =0x000001FF
	ands r1, r5
	ldr r3, [r6]
	movs r0, #0xf0
	lsls r0, r0, #8
	str r0, [sp]
	movs r0, #4
	movs r2, #0x50
	bl PutSpriteExt
	adds r5, #0x20
_080B0580:
	adds r6, #4
	adds r4, #1
	cmp r4, #7
	ble _080B055E
	ldr r3, _080B05B4 @ =gUnk_08DAF8E4
	mov r7, sl
	str r7, [sp]
	movs r0, #4
	movs r1, #0x90
	movs r2, #0x50
	bl PutSpriteExt
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B05A8: .4byte gPal
_080B05AC: .4byte gUnk_08DAF8C4
_080B05B0: .4byte 0x000001FF
_080B05B4: .4byte gUnk_08DAF8E4

	thumb_func_start sub_80B05B8
sub_80B05B8: @ 0x080B05B8
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x2a]
	adds r0, #1
	adds r1, r0, #0
	strh r0, [r4, #0x2a]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0xd
	bhi _080B05D8
	lsls r0, r1, #0x18
	lsrs r0, r0, #0x18
	movs r1, #0
	bl sub_80B044C
	b _080B05EA
_080B05D8:
	movs r0, #0xe
	movs r1, #0
	bl sub_80B044C
	movs r0, #0
	strh r0, [r4, #0x2a]
	adds r0, r4, #0
	bl Proc_Break
_080B05EA:
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_80B05F0
sub_80B05F0: @ 0x080B05F0
	push {r4, r5, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x2a]
	adds r0, #1
	adds r1, r0, #0
	strh r0, [r4, #0x2a]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0x10
	bls _080B060E
	movs r5, #0
	adds r0, r4, #0
	bl Proc_Break
	b _080B0616
_080B060E:
	movs r0, #0x10
	subs r0, r0, r1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
_080B0616:
	movs r0, #0xe
	movs r1, #0
	bl sub_80B044C
	adds r0, r4, #0
	adds r0, #0x2d
	ldrb r1, [r0]
	adds r0, #1
	ldrb r2, [r0]
	adds r0, r5, #0
	bl sub_80B04EC
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start sub_80B0634
sub_80B0634: @ 0x080B0634
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0xe
	movs r1, #0
	bl sub_80B044C
	adds r0, r4, #0
	adds r0, #0x2d
	ldrb r1, [r0]
	adds r0, #1
	ldrb r2, [r0]
	movs r0, #0
	bl sub_80B04EC
	movs r0, #0
	strh r0, [r4, #0x2a]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_80B065C
sub_80B065C: @ 0x080B065C
	push {lr}
	adds r2, r0, #0
	ldrh r0, [r2, #0x2a]
	adds r0, #1
	strh r0, [r2, #0x2a]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x11
	cmp r0, #0x10
	bls _080B0676
	adds r0, r2, #0
	bl Proc_Break
	b _080B0690
_080B0676:
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r1, r2, #0
	adds r1, #0x2d
	ldrb r1, [r1]
	adds r2, #0x2e
	ldrb r2, [r2]
	bl sub_80B04EC
	movs r0, #0xe
	movs r1, #1
	bl sub_80B044C
_080B0690:
	pop {r0}
	bx r0

	thumb_func_start sub_80B0694
sub_80B0694: @ 0x080B0694
	push {r4, lr}
	adds r2, r0, #0
	lsls r4, r1, #0x18
	lsrs r4, r4, #0x18
	ldr r0, _080B06B0 @ =gUnk_08DAF744
	adds r1, r2, #0
	bl Proc_Start
	adds r1, r0, #0
	adds r1, #0x2c
	strb r4, [r1]
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080B06B0: .4byte gUnk_08DAF744

	thumb_func_start sub_80B06B4
sub_80B06B4: @ 0x080B06B4
	ldr r0, _080B06DC @ =0x04000006
	ldrh r0, [r0]
	adds r0, #1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0x6d
	bhi _080B06EC
	ldr r3, _080B06E0 @ =0x04000008
	ldrh r2, [r3]
	ldr r1, _080B06E4 @ =0x0000FFFC
	adds r0, r1, #0
	ands r0, r2
	adds r0, #2
	strh r0, [r3]
	ldr r2, _080B06E8 @ =0x0400000C
	ldrh r0, [r2]
	ands r1, r0
	adds r1, #2
	b _080B0702
	.align 2, 0
_080B06DC: .4byte 0x04000006
_080B06E0: .4byte 0x04000008
_080B06E4: .4byte 0x0000FFFC
_080B06E8: .4byte 0x0400000C
_080B06EC:
	ldr r3, _080B0708 @ =0x04000008
	ldrh r2, [r3]
	ldr r1, _080B070C @ =0x0000FFFC
	adds r0, r1, #0
	ands r0, r2
	adds r0, #1
	strh r0, [r3]
	ldr r2, _080B0710 @ =0x0400000C
	ldrh r0, [r2]
	ands r1, r0
	adds r1, #1
_080B0702:
	strh r1, [r2]
	bx lr
	.align 2, 0
_080B0708: .4byte 0x04000008
_080B070C: .4byte 0x0000FFFC
_080B0710: .4byte 0x0400000C

	thumb_func_start sub_80B0714
sub_80B0714: @ 0x080B0714
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	ldr r0, _080B07E0 @ =gDispIo
	mov ip, r0
	mov r2, ip
	adds r2, #0x3c
	movs r0, #0x3f
	ldrb r1, [r2]
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r2]
	mov r1, ip
	adds r1, #0x44
	movs r2, #0
	movs r3, #0x10
	mov r8, r3
	movs r0, #0x10
	strb r0, [r1]
	adds r1, #1
	strb r0, [r1]
	mov r0, ip
	adds r0, #0x46
	strb r2, [r0]
	ldr r0, _080B07E4 @ =0x0000FFE0
	mov r1, ip
	ldrh r1, [r1, #0x3c]
	ands r0, r1
	movs r1, #2
	orrs r0, r1
	ldr r1, _080B07E8 @ =0x0000E0FF
	ands r0, r1
	movs r3, #0xe0
	lsls r3, r3, #5
	adds r1, r3, #0
	orrs r0, r1
	mov r1, ip
	strh r0, [r1, #0x3c]
	movs r5, #0x20
	ldrb r0, [r1, #1]
	orrs r0, r5
	movs r1, #0x41
	rsbs r1, r1, #0
	ands r0, r1
	movs r1, #0x7f
	ands r0, r1
	mov r3, ip
	strb r0, [r3, #1]
	mov r0, ip
	adds r0, #0x2d
	strb r2, [r0]
	adds r0, #4
	strb r2, [r0]
	mov r1, ip
	adds r1, #0x2c
	movs r0, #0xf0
	strb r0, [r1]
	adds r1, #4
	movs r0, #0xa0
	strb r0, [r1]
	mov r6, ip
	adds r6, #0x34
	movs r0, #1
	ldrb r1, [r6]
	orrs r1, r0
	movs r2, #2
	orrs r1, r2
	movs r4, #4
	orrs r1, r4
	movs r3, #8
	orrs r1, r3
	mov r2, r8
	orrs r1, r2
	mov r7, ip
	adds r7, #0x36
	ldrb r2, [r7]
	orrs r0, r2
	movs r2, #3
	rsbs r2, r2, #0
	ands r0, r2
	orrs r0, r4
	orrs r0, r3
	mov r3, r8
	orrs r0, r3
	orrs r1, r5
	strb r1, [r6]
	movs r1, #0x21
	rsbs r1, r1, #0
	ands r0, r1
	strb r0, [r7]
	mov r0, ip
	adds r0, #0x3d
	ldrb r1, [r0]
	orrs r5, r1
	strb r5, [r0]
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B07E0: .4byte gDispIo
_080B07E4: .4byte 0x0000FFE0
_080B07E8: .4byte 0x0000E0FF

	thumb_func_start sub_80B07EC
sub_80B07EC: @ 0x080B07EC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x24
	mov sb, r0
	movs r0, #0
	str r0, [sp, #0x1c]
	add r1, sp, #4
	ldr r0, _080B0818 @ =gUnk_0844BCB8
	ldm r0!, {r2, r3, r4}
	stm r1!, {r2, r3, r4}
	ldm r0!, {r2, r3, r4}
	stm r1!, {r2, r3, r4}
	mov r1, sb
	ldr r0, [r1, #0x34]
	ldr r0, [r0, #0x1c]
	str r0, [r1, #0x38]
	movs r7, #4
	b _080B081E
	.align 2, 0
_080B0818: .4byte gUnk_0844BCB8
_080B081C:
	adds r7, #1
_080B081E:
	cmp r7, #7
	bgt _080B083A
	mov r2, sb
	ldr r0, [r2, #0x34]
	ldrb r0, [r0, #0xf]
	bl GetClassData
	adds r0, #0x2c
	adds r0, r0, r7
	ldrb r0, [r0]
	cmp r0, #0
	beq _080B081C
	movs r3, #1
	str r3, [sp, #0x1c]
_080B083A:
	movs r4, #0
	movs r0, #0
	mov r1, sb
	strh r0, [r1, #0x2a]
	strh r0, [r1, #0x2c]
	adds r1, #0x46
	movs r0, #0xfa
	strb r0, [r1]
	ldr r6, _080B0A18 @ =gBg0Tm
	adds r0, r6, #0
	movs r1, #0
	bl TmFill
	ldr r0, _080B0A1C @ =gBg1Tm
	movs r1, #0
	bl TmFill
	ldr r2, _080B0A20 @ =gBg2Tm
	mov r8, r2
	mov r0, r8
	movs r1, #0
	bl TmFill
	ldr r5, _080B0A24 @ =gDispIo
	movs r0, #2
	rsbs r0, r0, #0
	ldrb r3, [r5, #1]
	ands r0, r3
	movs r1, #3
	rsbs r1, r1, #0
	ands r0, r1
	subs r1, #2
	ands r0, r1
	subs r1, #4
	ands r0, r1
	subs r1, #8
	ands r0, r1
	strb r0, [r5, #1]
	adds r1, r5, #0
	adds r1, #0x3c
	movs r0, #0x3f
	ldrb r2, [r1]
	ands r0, r2
	strb r0, [r1]
	adds r1, #8
	movs r0, #0x10
	strb r0, [r1]
	adds r0, r5, #0
	adds r0, #0x45
	strb r4, [r0]
	adds r0, #1
	strb r4, [r0]
	bl ResetTextFont
	bl ResetText
	movs r1, #4
	rsbs r1, r1, #0
	adds r0, r1, #0
	ldrb r3, [r5, #0xc]
	ands r0, r3
	movs r2, #2
	orrs r0, r2
	strb r0, [r5, #0xc]
	adds r0, r1, #0
	ldrb r4, [r5, #0x10]
	ands r0, r4
	orrs r0, r2
	strb r0, [r5, #0x10]
	ldrb r0, [r5, #0x14]
	ands r1, r0
	orrs r1, r2
	strb r1, [r5, #0x14]
	movs r0, #3
	ldrb r1, [r5, #0x18]
	orrs r0, r1
	strb r0, [r5, #0x18]
	movs r0, #0
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	movs r0, #1
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	movs r0, #2
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	movs r0, #3
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	ldr r4, _080B0A28 @ =gUnk_08421C64
	movs r0, #3
	bl GetBgChrOffset
	adds r1, r0, #0
	movs r5, #0xc0
	lsls r5, r5, #0x13
	adds r1, r1, r5
	adds r0, r4, #0
	bl Decompress
	ldr r0, _080B0A2C @ =gUnk_08440300
	movs r1, #0xa0
	lsls r1, r1, #1
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r0, _080B0A30 @ =gBg3Tm
	ldr r1, _080B0A34 @ =gUnk_08440320
	movs r2, #0xa0
	lsls r2, r2, #8
	bl TmApplyTsa_thm
	ldr r4, _080B0A38 @ =gUnk_0843FBE0
	movs r0, #2
	bl GetBgChrOffset
	adds r1, r0, #0
	adds r1, r1, r5
	adds r0, r4, #0
	bl Decompress
	ldr r0, _080B0A3C @ =gUnk_0843FDC8
	movs r1, #0x90
	lsls r1, r1, #1
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r1, _080B0A40 @ =gUnk_0843FDE8
	movs r2, #0x90
	lsls r2, r2, #8
	mov r0, r8
	bl TmApplyTsa_thm
	movs r0, #0xf
	bl EnableBgSync
	adds r0, r6, #0
	movs r1, #0
	bl TmFill
	mov r2, sb
	ldr r0, [r2, #0x34]
	ldrb r0, [r0, #0xf]
	bl GetClassData
	ldrb r0, [r0, #0xb]
	mov r4, sb
	adds r4, #0x40
	strb r0, [r4]
	mov r3, sb
	ldr r0, [r3, #0x34]
	ldrb r0, [r0, #0xf]
	bl GetClassData
	ldrb r0, [r0, #0xc]
	mov r1, sb
	adds r1, #0x41
	strb r0, [r1]
	mov r1, sb
	ldr r0, [r1, #0x34]
	ldrb r0, [r0, #0xf]
	bl GetClassData
	ldrb r0, [r0, #0xd]
	mov r1, sb
	adds r1, #0x42
	strb r0, [r1]
	mov r2, sb
	ldr r0, [r2, #0x34]
	ldrb r0, [r0, #0xf]
	bl GetClassData
	ldrb r0, [r0, #0xe]
	mov r1, sb
	adds r1, #0x43
	strb r0, [r1]
	mov r3, sb
	ldr r0, [r3, #0x34]
	ldrb r0, [r0, #0xf]
	bl GetClassData
	ldrb r1, [r0, #0xf]
	mov r0, sb
	adds r0, #0x44
	strb r1, [r0]
	mov r1, sb
	ldr r0, [r1, #0x34]
	ldrb r0, [r0, #0xf]
	bl GetClassData
	ldrb r0, [r0, #0x10]
	mov r1, sb
	adds r1, #0x45
	strb r0, [r1]
	movs r7, #0
	str r4, [sp, #0x20]
	ldr r2, _080B0A44 @ =0x0200FB28
	mov r8, r2
	movs r3, #0x4a
	adds r3, r3, r6
	mov sl, r3
	adds r6, #0x42
	mov r5, r8
	add r4, sp, #4
_080B09E2:
	adds r0, r5, #0
	movs r1, #3
	bl InitText
	adds r0, r5, #0
	bl ClearText
	adds r0, r5, #0
	movs r1, #3
	bl Text_SetColor
	adds r0, r5, #0
	movs r1, #0
	bl Text_SetCursor
	ldr r0, [sp, #0x1c]
	cmp r0, #0
	beq _080B0A4C
	cmp r7, #1
	bne _080B0A4C
	mov r0, r8
	adds r0, #8
	ldr r1, _080B0A48 @ =gUnk_0844BCD0
	bl Text_DrawString
	b _080B0A54
	.align 2, 0
_080B0A18: .4byte gBg0Tm
_080B0A1C: .4byte gBg1Tm
_080B0A20: .4byte gBg2Tm
_080B0A24: .4byte gDispIo
_080B0A28: .4byte gUnk_08421C64
_080B0A2C: .4byte gUnk_08440300
_080B0A30: .4byte gBg3Tm
_080B0A34: .4byte gUnk_08440320
_080B0A38: .4byte gUnk_0843FBE0
_080B0A3C: .4byte gUnk_0843FDC8
_080B0A40: .4byte gUnk_0843FDE8
_080B0A44: .4byte 0x0200FB28
_080B0A48: .4byte gUnk_0844BCD0
_080B0A4C:
	ldr r1, [r4]
	adds r0, r5, #0
	bl Text_DrawString
_080B0A54:
	adds r0, r5, #0
	adds r1, r6, #0
	bl PutText
	ldr r1, [sp, #0x20]
	adds r0, r1, r7
	ldrb r2, [r0]
	mov r0, sl
	movs r1, #0
	bl sub_8006068
	movs r2, #0x80
	add sl, r2
	adds r6, #0x80
	adds r5, #8
	adds r4, #4
	adds r7, #1
	cmp r7, #5
	ble _080B09E2
	movs r5, #0
	mov r0, sb
	bl sub_80B10B8
	mov r3, sb
	str r0, [r3, #0x3c]
	movs r0, #0x80
	lsls r0, r0, #1
	movs r1, #2
	movs r2, #0
	bl InitTalk
	bl sub_8007DF4
	bl sub_800968C
	bl sub_8007EF8
	mov r4, sb
	ldr r0, [r4, #0x34]
	ldr r2, [r0, #4]
	movs r0, #2
	movs r1, #0xf
	bl sub_8007EAC
	movs r0, #0
	bl sub_8007F84
	movs r0, #1
	bl sub_8007F24
	movs r0, #2
	bl sub_8007F24
	movs r0, #4
	bl sub_8007F24
	movs r0, #8
	bl sub_8007F24
	movs r0, #0x40
	bl sub_8007F24
	movs r0, #4
	bl sub_8007F68
	ldr r0, _080B0BB4 @ =gAnims
	ldr r3, [r4, #0x34]
	movs r1, #0xe
	ldrsb r1, [r3, r1]
	strh r1, [r0, #8]
	movs r1, #0x82
	lsls r1, r1, #1
	strh r1, [r0, #2]
	movs r1, #0x58
	strh r1, [r0, #4]
	ldrb r1, [r3, #0x11]
	strh r1, [r0, #6]
	movs r1, #6
	strh r1, [r0, #0xa]
	ldrb r1, [r3, #0x10]
	strb r1, [r0, #1]
	movs r4, #1
	strh r4, [r0, #0xc]
	movs r1, #0xc0
	lsls r1, r1, #1
	strh r1, [r0, #0xe]
	movs r1, #2
	strh r1, [r0, #0x10]
	ldr r1, _080B0BB8 @ =gEkrBg0QuakeVec
	str r1, [r0, #0x1c]
	ldr r1, _080B0BBC @ =0x02002038
	str r1, [r0, #0x24]
	ldr r1, _080B0BC0 @ =0x02007838
	str r1, [r0, #0x20]
	ldr r1, _080B0BC4 @ =0x020078D8
	str r1, [r0, #0x28]
	ldr r1, _080B0BC8 @ =0x0200A2D8
	str r1, [r0, #0x30]
	ldrb r2, [r3, #0x12]
	strh r2, [r1]
	ldrb r2, [r3, #0x13]
	strh r2, [r1, #2]
	ldrb r2, [r3, #0x14]
	strh r2, [r1, #4]
	ldrb r2, [r3, #0x15]
	strh r2, [r1, #6]
	ldrb r2, [r3, #0x16]
	strh r2, [r1, #8]
	movs r2, #0xa0
	lsls r2, r2, #2
	strh r2, [r1, #0xe]
	movs r3, #0xf
	strh r3, [r1, #0x10]
	subs r2, #0x80
	strh r2, [r1, #0xa]
	strh r3, [r1, #0xc]
	strh r4, [r1, #0x12]
	ldr r2, _080B0BCC @ =gBg1Tm
	str r2, [r1, #0x14]
	ldr r2, _080B0BD0 @ =0x0200A300
	str r2, [r1, #0x18]
	ldr r2, _080B0BD4 @ =0x0200C300
	str r2, [r1, #0x1c]
	ldr r2, _080B0BD8 @ =0x0200CB00
	str r2, [r1, #0x20]
	ldr r2, _080B0BDC @ =sub_80B0714
	str r2, [r1, #0x24]
	bl sub_80556B0
	ldr r4, _080B0BE0 @ =0x0200DB00
	mov r0, sb
	ldr r1, [r0, #0x34]
	ldrb r0, [r1, #0x17]
	strh r0, [r4]
	movs r0, #0xa
	strh r0, [r4, #2]
	movs r0, #0xe0
	lsls r0, r0, #2
	strh r0, [r4, #4]
	ldrb r0, [r1, #0x18]
	strh r0, [r4, #6]
	movs r0, #0xb
	strh r0, [r4, #8]
	movs r0, #0xf0
	lsls r0, r0, #2
	strh r0, [r4, #0xa]
	strh r5, [r4, #0xc]
	ldr r0, _080B0BE4 @ =0x0000FFFF
	strh r0, [r4, #0xe]
	ldr r0, _080B0BE8 @ =0x06010000
	str r0, [r4, #0x1c]
	ldr r0, _080B0BEC @ =0x0200DB28
	str r0, [r4, #0x20]
	adds r0, r4, #0
	bl sub_8055718
	movs r3, #0x98
	lsls r3, r3, #1
	movs r0, #0x68
	str r0, [sp]
	adds r0, r4, #0
	movs r1, #0xd0
	movs r2, #0x68
	bl sub_8055AF0
	ldr r0, _080B0BF0 @ =sub_80B06B4
	bl SetOnHBlankA
	add sp, #0x24
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B0BB4: .4byte gAnims
_080B0BB8: .4byte gEkrBg0QuakeVec
_080B0BBC: .4byte 0x02002038
_080B0BC0: .4byte 0x02007838
_080B0BC4: .4byte 0x020078D8
_080B0BC8: .4byte 0x0200A2D8
_080B0BCC: .4byte gBg1Tm
_080B0BD0: .4byte 0x0200A300
_080B0BD4: .4byte 0x0200C300
_080B0BD8: .4byte 0x0200CB00
_080B0BDC: .4byte sub_80B0714
_080B0BE0: .4byte 0x0200DB00
_080B0BE4: .4byte 0x0000FFFF
_080B0BE8: .4byte 0x06010000
_080B0BEC: .4byte 0x0200DB28
_080B0BF0: .4byte sub_80B06B4

	thumb_func_start sub_80B0BF4
sub_80B0BF4: @ 0x080B0BF4
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0xc8
	lsls r0, r0, #1
	ldrh r1, [r4, #0x2c]
	cmp r1, r0
	bne _080B0C24
	bl sub_80AFDAC
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080B0C1C
	movs r0, #0x3c
	bl FadeBgmOut
	adds r0, r4, #0
	movs r1, #7
	bl Proc_Goto
	b _080B0C24
_080B0C1C:
	adds r0, r4, #0
	movs r1, #4
	bl Proc_Goto
_080B0C24:
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_80B0C30
sub_80B0C30: @ 0x080B0C30
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	adds r7, r0, #0
	movs r0, #0x46
	adds r0, r0, r7
	mov sb, r0
	movs r0, #0x50
	ldrh r1, [r7, #0x2a]
	subs r0, r0, r1
	movs r1, #0xe
	bl __divsi3
	adds r0, #1
	mov r2, sb
	ldrb r2, [r2]
	subs r0, r2, r0
	mov r1, sb
	strb r0, [r1]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0xb3
	bhi _080B0C68
	movs r0, #0xb4
	strb r0, [r1]
_080B0C68:
	ldr r2, _080B0D18 @ =gDispIo
	mov ip, r2
	movs r2, #1
	mov r1, ip
	ldrb r0, [r1, #1]
	orrs r0, r2
	movs r1, #2
	mov r8, r1
	mov r1, r8
	orrs r0, r1
	movs r1, #4
	mov sl, r1
	mov r1, sl
	orrs r0, r1
	movs r5, #8
	orrs r0, r5
	movs r4, #0x10
	orrs r0, r4
	movs r1, #0x20
	orrs r0, r1
	movs r1, #0x41
	rsbs r1, r1, #0
	ands r0, r1
	movs r1, #0x7f
	ands r0, r1
	mov r1, ip
	strb r0, [r1, #1]
	mov r0, ip
	adds r0, #0x2d
	movs r1, #0
	strb r1, [r0]
	ldrh r6, [r7, #0x2a]
	adds r1, r6, #0
	movs r0, #0x50
	subs r0, r0, r1
	mov r3, ip
	adds r3, #0x31
	strb r0, [r3]
	subs r3, #5
	movs r0, #0xf0
	strb r0, [r3]
	adds r1, #0x50
	mov r0, ip
	adds r0, #0x30
	strb r1, [r0]
	adds r0, #4
	ldrb r1, [r0]
	orrs r2, r1
	mov r1, r8
	orrs r2, r1
	mov r1, sl
	orrs r2, r1
	orrs r2, r5
	orrs r2, r4
	strb r2, [r0]
	mov r2, ip
	adds r2, #0x36
	movs r0, #2
	rsbs r0, r0, #0
	ldrb r1, [r2]
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
	strb r0, [r2]
	lsls r0, r6, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0x50
	bne _080B0D20
	movs r0, #0xb4
	mov r2, sb
	strb r0, [r2]
	movs r0, #0
	strh r0, [r7, #0x2a]
	adds r0, r7, #0
	bl Proc_Break
	ldr r0, _080B0D1C @ =sub_80B0BF4
	adds r1, r7, #0
	bl StartParallelWorker
	b _080B0D24
	.align 2, 0
_080B0D18: .4byte gDispIo
_080B0D1C: .4byte sub_80B0BF4
_080B0D20:
	adds r0, r6, #4
	strh r0, [r7, #0x2a]
_080B0D24:
	ldr r0, _080B0D5C @ =gAnims
	adds r4, r7, #0
	adds r4, #0x46
	ldrb r1, [r4]
	movs r2, #0x58
	bl sub_80555F8
	ldr r0, _080B0D60 @ =0x0200DB00
	ldrb r3, [r4]
	adds r1, r3, #0
	subs r1, #0x30
	adds r3, #0x30
	movs r2, #0x68
	str r2, [sp]
	bl sub_8055AF0
	ldr r0, [r7, #0x3c]
	movs r1, #0x78
	bl sub_80B10CC
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B0D5C: .4byte gAnims
_080B0D60: .4byte 0x0200DB00

	thumb_func_start sub_80B0D64
sub_80B0D64: @ 0x080B0D64
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x38]
	ldrb r0, [r0]
	cmp r0, #8
	bhi _080B0DEA
	lsls r0, r0, #2
	ldr r1, _080B0D7C @ =_080B0D80
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080B0D7C: .4byte _080B0D80
_080B0D80: @ jump table
	.4byte _080B0DA4 @ case 0
	.4byte _080B0DAE @ case 1
	.4byte _080B0DB8 @ case 2
	.4byte _080B0DC4 @ case 3
	.4byte _080B0DD0 @ case 4
	.4byte _080B0DEA @ case 5
	.4byte _080B0DE0 @ case 6
	.4byte _080B0DC4 @ case 7
	.4byte _080B0DEA @ case 8
_080B0DA4:
	adds r0, r4, #0
	movs r1, #0xa
	bl Proc_Goto
	b _080B0DEA
_080B0DAE:
	ldr r0, _080B0DB4 @ =gAnims
	movs r1, #0
	b _080B0DD4
	.align 2, 0
_080B0DB4: .4byte gAnims
_080B0DB8:
	ldr r0, _080B0DC0 @ =gAnims
	movs r1, #1
	b _080B0DD4
	.align 2, 0
_080B0DC0: .4byte gAnims
_080B0DC4:
	ldr r0, _080B0DCC @ =gAnims
	bl sub_8055644
	b _080B0DEA
	.align 2, 0
_080B0DCC: .4byte gAnims
_080B0DD0:
	ldr r0, _080B0DDC @ =gAnims
	movs r1, #2
_080B0DD4:
	strh r1, [r0, #0xa]
	bl sub_8055474
	b _080B0DEA
	.align 2, 0
_080B0DDC: .4byte gAnims
_080B0DE0:
	ldr r0, _080B0DF4 @ =gAnims
	movs r1, #4
	strh r1, [r0, #0xa]
	bl sub_8055474
_080B0DEA:
	movs r0, #0
	strh r0, [r4, #0x2a]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080B0DF4: .4byte gAnims

	thumb_func_start sub_80B0DF8
sub_80B0DF8: @ 0x080B0DF8
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x38]
	ldrb r0, [r0]
	subs r0, #1
	cmp r0, #7
	bhi _080B0E70
	lsls r0, r0, #2
	ldr r1, _080B0E10 @ =_080B0E14
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080B0E10: .4byte _080B0E14
_080B0E14: @ jump table
	.4byte _080B0E34 @ case 0
	.4byte _080B0E34 @ case 1
	.4byte _080B0E34 @ case 2
	.4byte _080B0E34 @ case 3
	.4byte _080B0E3A @ case 4
	.4byte _080B0E34 @ case 5
	.4byte _080B0E34 @ case 6
	.4byte _080B0E58 @ case 7
_080B0E34:
	ldr r0, [r4, #0x38]
	adds r0, #2
	b _080B0E4E
_080B0E3A:
	ldrh r0, [r4, #0x2a]
	adds r0, #1
	strh r0, [r4, #0x2a]
	ldr r1, [r4, #0x38]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldrb r2, [r1, #1]
	cmp r0, r2
	blo _080B0E70
	adds r0, r1, #2
_080B0E4E:
	str r0, [r4, #0x38]
	adds r0, r4, #0
	bl Proc_Break
	b _080B0E70
_080B0E58:
	ldr r0, _080B0E78 @ =gAnims
	bl sub_8055624
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080B0E70
	ldr r0, [r4, #0x38]
	adds r0, #2
	str r0, [r4, #0x38]
	adds r0, r4, #0
	bl Proc_Break
_080B0E70:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080B0E78: .4byte gAnims

	thumb_func_start sub_80B0E7C
sub_80B0E7C: @ 0x080B0E7C
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0
	bl SetOnHBlankA
	bl sub_8007EF8
	bl sub_80647F8
	ldr r0, _080B0EB4 @ =0x0200DB00
	bl sub_8055AC4
	bl sub_80647DC
	ldr r0, _080B0EB8 @ =gAnims
	bl sub_80556D8
	ldr r0, [r4, #0x3c]
	cmp r0, #0
	beq _080B0EA8
	bl Proc_End
_080B0EA8:
	movs r0, #2
	bl sub_80AFDDC
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080B0EB4: .4byte 0x0200DB00
_080B0EB8: .4byte gAnims

	thumb_func_start sub_80B0EBC
sub_80B0EBC: @ 0x080B0EBC
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r0, _080B0ED8 @ =gUnk_08DAF78C
	adds r1, r4, #0
	bl Proc_Start
	str r4, [r0, #0x30]
	str r5, [r0, #0x34]
	movs r1, #0
	str r1, [r0, #0x3c]
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_080B0ED8: .4byte gUnk_08DAF78C

	thumb_func_start sub_80B0EDC
sub_80B0EDC: @ 0x080B0EDC
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x14]
	str r0, [r4, #0x30]
	movs r1, #0
	movs r0, #0
	strh r0, [r4, #0x2a]
	adds r2, r4, #0
	adds r2, #0x34
	strb r1, [r2]
	adds r1, r4, #0
	adds r1, #0x35
	movs r0, #0xfa
	strb r0, [r1]
	movs r5, #0
	ldr r0, [r4, #0x30]
	ldr r0, [r0, #0x34]
	ldr r0, [r0]
	ldrb r0, [r0]
	cmp r0, #0
	beq _080B0F36
	adds r6, r2, #0
_080B0F08:
	ldr r0, [r4, #0x30]
	ldr r0, [r0, #0x34]
	ldr r0, [r0]
	adds r0, r0, r5
	ldrb r0, [r0]
	bl sub_80B1110
	ldrb r1, [r0, #5]
	ldrb r2, [r0, #4]
	subs r0, r1, r2
	ldrb r1, [r6]
	adds r0, r1, r0
	strb r0, [r6]
	adds r5, #1
	cmp r5, #0xd
	bgt _080B0F36
	ldr r0, [r4, #0x30]
	ldr r0, [r0, #0x34]
	ldr r0, [r0]
	adds r0, r0, r5
	ldrb r0, [r0]
	cmp r0, #0
	bne _080B0F08
_080B0F36:
	ldr r0, _080B0F50 @ =gUnk_08440838
	ldr r1, _080B0F54 @ =0x06010000
	bl Decompress
	ldr r0, _080B0F58 @ =gUnk_0844182C
	movs r1, #0xa0
	lsls r1, r1, #2
	movs r2, #0x40
	bl ApplyPaletteExt
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080B0F50: .4byte gUnk_08440838
_080B0F54: .4byte 0x06010000
_080B0F58: .4byte gUnk_0844182C

	thumb_func_start sub_80B0F5C
sub_80B0F5C: @ 0x080B0F5C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x10
	mov sl, r0
	movs r0, #0
	mov sb, r0
_080B0F6E:
	mov r1, sl
	ldr r0, [r1, #0x30]
	adds r0, #0x40
	add r0, sb
	ldrb r5, [r0]
	cmp r5, #0x1d
	bls _080B0F7E
	movs r5, #0x1e
_080B0F7E:
	movs r2, #0
	mov r8, r2
	lsrs r0, r5, #2
	mov r3, sb
	adds r3, #1
	str r3, [sp, #0xc]
	mov r1, sl
	adds r1, #0x34
	str r1, [sp, #4]
	mov r2, sl
	adds r2, #0x35
	str r2, [sp, #8]
	cmp r8, r0
	bge _080B0FCA
	adds r7, r0, #0
	movs r4, #0x30
	mov r3, sb
	lsls r6, r3, #4
	mov r8, r7
_080B0FA4:
	ldr r0, _080B1020 @ =gUnk_08DAF874
	ldr r3, [r0, #0xc]
	movs r0, #0xa0
	lsls r0, r0, #7
	str r0, [sp]
	movs r0, #0xd
	adds r1, r4, #0
	adds r2, r6, #0
	adds r2, #0x10
	bl PutSpriteExt
	adds r4, #8
	movs r1, #1
	rsbs r1, r1, #0
	add r8, r1
	mov r2, r8
	cmp r2, #0
	bne _080B0FA4
	mov r8, r7
_080B0FCA:
	movs r0, #3
	ands r0, r5
	cmp r0, #0
	beq _080B0FF4
	mov r3, r8
	lsls r1, r3, #3
	adds r1, #0x30
	mov r3, sb
	lsls r2, r3, #4
	adds r2, #0x10
	subs r0, #1
	lsls r0, r0, #2
	ldr r3, _080B1020 @ =gUnk_08DAF874
	adds r0, r0, r3
	ldr r3, [r0]
	movs r0, #0xa0
	lsls r0, r0, #7
	str r0, [sp]
	movs r0, #0xd
	bl PutSpriteExt
_080B0FF4:
	ldr r0, [sp, #0xc]
	mov sb, r0
	cmp r0, #5
	ble _080B0F6E
	movs r0, #0x78
	ldr r1, [sp, #4]
	ldrb r1, [r1]
	subs r0, r0, r1
	lsrs r1, r0, #0x1f
	adds r0, r0, r1
	asrs r0, r0, #1
	ldr r2, [sp, #8]
	ldrb r3, [r2]
	adds r3, r3, r0
	mov r8, r3
	movs r0, #0
	mov sb, r0
	mov r2, sl
	ldr r1, [r2, #0x30]
	ldr r0, [r1, #0x34]
	ldr r0, [r0]
	b _080B1094
	.align 2, 0
_080B1020: .4byte gUnk_08DAF874
_080B1024:
	ldr r0, [r1, #0x34]
	ldr r0, [r0]
	add r0, sb
	ldrb r0, [r0]
	bl sub_80B1110
	adds r4, r0, #0
	ldr r3, [r4]
	cmp r3, #0
	beq _080B1080
	movs r1, #4
	ldrsb r1, [r4, r1]
	mov r0, r8
	subs r1, r0, r1
	movs r0, #6
	ldrsb r0, [r4, r0]
	movs r2, #8
	subs r2, r2, r0
	movs r0, #0xa0
	lsls r0, r0, #7
	str r0, [sp]
	movs r0, #4
	bl PutSpriteExt
	movs r1, #4
	ldrsb r1, [r4, r1]
	mov r2, r8
	subs r1, r2, r1
	subs r1, #2
	movs r0, #6
	ldrsb r0, [r4, r0]
	movs r2, #6
	subs r2, r2, r0
	ldr r3, [r4]
	movs r0, #0x80
	lsls r0, r0, #7
	str r0, [sp]
	movs r0, #4
	bl PutSpriteExt
	movs r0, #5
	ldrsb r0, [r4, r0]
	movs r1, #4
	ldrsb r1, [r4, r1]
	subs r0, r0, r1
	add r8, r0
_080B1080:
	movs r3, #1
	add sb, r3
	mov r0, sb
	cmp r0, #0xd
	bgt _080B109A
	mov r2, sl
	ldr r1, [r2, #0x30]
	ldr r0, [r1, #0x34]
	ldr r0, [r0]
	add r0, sb
_080B1094:
	ldrb r0, [r0]
	cmp r0, #0
	bne _080B1024
_080B109A:
	mov r3, sl
	ldrh r0, [r3, #0x2a]
	cmp r0, #0xfe
	bhi _080B10A6
	adds r0, #1
	strh r0, [r3, #0x2a]
_080B10A6:
	add sp, #0x10
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_80B10B8
sub_80B10B8: @ 0x080B10B8
	push {lr}
	adds r1, r0, #0
	ldr r0, _080B10C8 @ =gUnk_08DAF82C
	bl Proc_Start
	pop {r1}
	bx r1
	.align 2, 0
_080B10C8: .4byte gUnk_08DAF82C

	thumb_func_start sub_80B10CC
sub_80B10CC: @ 0x080B10CC
	adds r0, #0x35
	strb r1, [r0]
	bx lr
	.align 2, 0

	thumb_func_start sub_80B10D4
sub_80B10D4: @ 0x080B10D4
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r0, _080B1104 @ =gUnk_08DB0454
	lsls r4, r4, #2
	adds r4, r4, r0
	adds r0, r5, #0
	movs r1, #6
	bl __divsi3
	ldr r1, [r4]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r4, [r0]
	cmp r4, #0
	beq _080B1108
	adds r0, r5, #0
	movs r1, #6
	bl __modsi3
	lsls r0, r0, #2
	adds r0, r0, r4
	ldr r0, [r0]
	b _080B110A
	.align 2, 0
_080B1104: .4byte gUnk_08DB0454
_080B1108:
	movs r0, #0
_080B110A:
	pop {r4, r5}
	pop {r1}
	bx r1

	thumb_func_start sub_80B1110
sub_80B1110: @ 0x080B1110
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	adds r2, r1, #0
	adds r0, r1, #0
	subs r0, #0x61
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x19
	bhi _080B112C
	lsls r0, r1, #3
	ldr r1, _080B1128 @ =gUnk_08DB02D4
	b _080B1140
	.align 2, 0
_080B1128: .4byte gUnk_08DB02D4
_080B112C:
	adds r0, r1, #0
	subs r0, #0x41
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x19
	bls _080B113C
	movs r0, #0
	b _080B1142
_080B113C:
	lsls r0, r2, #3
	ldr r1, _080B1144 @ =gUnk_08DB04A4
_080B1140:
	adds r0, r0, r1
_080B1142:
	bx lr
	.align 2, 0
_080B1144: .4byte gUnk_08DB04A4

	thumb_func_start sub_80B1148
sub_80B1148: @ 0x080B1148
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, _080B1168 @ =gUnk_08DB0798
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x61
	ldrb r1, [r2]
	adds r2, r1, #0
	lsls r1, r2, #2
	adds r0, r0, r1
	ldr r1, [r0]
	adds r0, r1, #0
	b _080B116C
	.align 2, 0
_080B1168: .4byte gUnk_08DB0798
_080B116C:
	add sp, #4
	pop {r7}
	pop {r1}
	bx r1

	thumb_func_start sub_80B1174
sub_80B1174: @ 0x080B1174
	push {r7, lr}
	sub sp, #0xc
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	ldr r0, _080B11D8 @ =gUnk_08DB078C
	ldr r2, [r7, #4]
	adds r1, r2, #0
	adds r2, #0x61
	ldrb r1, [r2]
	adds r2, r1, #0
	lsls r1, r2, #2
	adds r0, r0, r1
	ldr r1, [r7]
	ldr r0, [r0]
	adds r1, r1, r0
	str r1, [r7, #8]
	bl sub_8007DF4
	bl sub_800968C
	ldr r1, [r7, #8]
	adds r0, r1, #0
	bl DecodeMsg
	adds r2, r0, #0
	ldr r3, [r7, #4]
	movs r0, #8
	movs r1, #2
	bl sub_8007E08
	movs r0, #0
	bl sub_8007F84
	movs r0, #1
	bl sub_8007F24
	movs r0, #2
	bl sub_8007F24
	movs r0, #4
	bl sub_8007F24
	movs r0, #1
	bl sub_8008CB8
	add sp, #0xc
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B11D8: .4byte gUnk_08DB078C

	thumb_func_start sub_80B11DC
sub_80B11DC: @ 0x080B11DC
	push {r7, lr}
	sub sp, #8
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	ldr r3, [r7, #4]
	ldr r0, [r7]
	movs r1, #0
	movs r2, #0
	bl sub_80B127C
	add sp, #8
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_80B11FC
sub_80B11FC: @ 0x080B11FC
	push {r7, lr}
	sub sp, #8
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	ldr r1, [r7, #4]
	ldr r0, [r7]
	movs r2, #0
	movs r3, #0
	bl sub_80B127C
	add sp, #8
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_80B121C
sub_80B121C: @ 0x080B121C
	push {r7, lr}
	sub sp, #8
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	ldr r1, [r7, #4]
	ldr r0, [r7]
	movs r2, #1
	movs r3, #0
	bl sub_80B127C
	add sp, #8
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_80B123C
sub_80B123C: @ 0x080B123C
	push {r7, lr}
	sub sp, #8
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	ldr r1, [r7, #4]
	ldr r0, [r7]
	movs r2, #2
	movs r3, #0
	bl sub_80B127C
	add sp, #8
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_80B125C
sub_80B125C: @ 0x080B125C
	push {r7, lr}
	sub sp, #8
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	ldr r1, [r7, #4]
	ldr r0, [r7]
	movs r2, #0
	movs r3, #0
	bl sub_80B127C
	add sp, #8
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_80B127C
sub_80B127C: @ 0x080B127C
	push {r7, lr}
	sub sp, #0x1c
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	adds r0, r2, #0
	str r3, [r7, #0xc]
	adds r1, r7, #0
	adds r1, #8
	strb r0, [r1]
	bl sub_808667C
	ldr r0, [r7, #0xc]
	cmp r0, #0
	beq _080B12AC
	ldr r0, _080B12A8 @ =gUnk_08DB081C
	ldr r1, [r7, #0xc]
	bl Proc_StartBlocking
	str r0, [r7, #0x10]
	b _080B12B8
	.align 2, 0
_080B12A8: .4byte gUnk_08DB081C
_080B12AC:
	ldr r1, _080B12E8 @ =gUnk_08DB081C
	adds r0, r1, #0
	movs r1, #3
	bl Proc_Start
	str r0, [r7, #0x10]
_080B12B8:
	ldr r0, [r7, #0x10]
	adds r1, r7, #0
	adds r1, #8
	adds r2, r0, #0
	adds r0, #0x61
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	ldrb r1, [r1]
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0]
	ldr r0, [r7, #0x10]
	ldr r1, [r7]
	str r1, [r0, #0x2c]
	ldr r0, [r7, #4]
	cmp r0, #0
	beq _080B12EC
	ldr r0, [r7, #4]
	str r0, [r7, #0x14]
	b _080B12F0
	.align 2, 0
_080B12E8: .4byte gUnk_08DB081C
_080B12EC:
	ldr r0, _080B12FC @ =gUnk_08DB077C
	str r0, [r7, #0x14]
_080B12F0:
	movs r0, #0
	str r0, [r7, #0x18]
_080B12F4:
	ldr r0, [r7, #0x18]
	cmp r0, #0x14
	ble _080B1300
	b _080B1338
	.align 2, 0
_080B12FC: .4byte gUnk_08DB077C
_080B1300:
	adds r0, r7, #0
	adds r0, #0x14
	ldr r1, [r0]
	ldrh r2, [r1]
	adds r1, #2
	str r1, [r0]
	adds r0, r2, #0
	bl MakeNewItem
	ldr r1, [r7, #0x10]
	ldr r2, [r7, #0x18]
	adds r3, r2, #0
	lsls r2, r3, #1
	adds r3, r1, #0
	adds r3, #0x30
	adds r1, r3, r2
	ldrh r2, [r1]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r0
	adds r0, r2, #0
	strh r0, [r1]
	ldr r0, [r7, #0x18]
	adds r1, r0, #1
	str r1, [r7, #0x18]
	b _080B12F4
_080B1338:
	ldr r1, [r7, #0x10]
	adds r0, r1, #0
	bl sub_80B1348
	add sp, #0x1c
	pop {r7}
	pop {r0}
	bx r0

	thumb_func_start sub_80B1348
sub_80B1348: @ 0x080B1348
	push {r7, lr}
	sub sp, #8
	mov r7, sp
	str r0, [r7]
	movs r0, #0
	str r0, [r7, #4]
_080B1354:
	ldr r0, [r7]
	ldr r1, [r7, #4]
	adds r2, r1, #0
	lsls r1, r2, #1
	adds r0, #0x30
	adds r1, r0, r1
	ldrh r0, [r1]
	cmp r0, #0
	bne _080B1368
	b _080B1370
_080B1368:
	ldr r0, [r7, #4]
	adds r1, r0, #1
	str r1, [r7, #4]
	b _080B1354
_080B1370:
	ldr r1, [r7]
	ldr r2, [r7, #4]
	adds r0, r2, #0
	adds r2, r1, #0
	adds r1, #0x5a
	ldrb r2, [r1]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	orrs r0, r3
	adds r2, r0, #0
	strb r2, [r1]
	ldr r0, [r7]
	ldr r1, [r0, #0x2c]
	adds r0, r1, #0
	bl GetUnitItemCount
	ldr r1, [r7]
	adds r2, r1, #0
	adds r1, #0x5b
	ldrb r2, [r1]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r0
	adds r0, r2, #0
	strb r0, [r1]
	add sp, #8
	pop {r7}
	pop {r0}
	bx r0

	thumb_func_start sub_80B13B0
sub_80B13B0: @ 0x080B13B0
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	ldr r1, _080B13D0 @ =gUnk_08DB081C
	adds r0, r1, #0
	bl Proc_Find
	str r0, [r7]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x60
	ldrb r0, [r1]
	cmp r0, #0
	bne _080B13D4
	b _080B13DA
	.align 2, 0
_080B13D0: .4byte gUnk_08DB081C
_080B13D4:
	ldr r0, [r7]
	bl sub_80B2714
_080B13DA:
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_80B13E4
sub_80B13E4: @ 0x080B13E4
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	ldr r1, _080B1404 @ =gUnk_08DB081C
	adds r0, r1, #0
	bl Proc_Find
	str r0, [r7]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x60
	ldrb r0, [r1]
	cmp r0, #1
	bne _080B1408
	b _080B140E
	.align 2, 0
_080B1404: .4byte gUnk_08DB081C
_080B1408:
	ldr r0, [r7]
	bl sub_80B2904
_080B140E:
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_80B1418
sub_80B1418: @ 0x080B1418
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0

	thumb_func_start sub_80B1428
sub_80B1428: @ 0x080B1428
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, [r7]
	ldr r1, [r0, #0x2c]
	cmp r1, #0
	bne _080B1442
	ldr r0, [r7]
	movs r1, #0xd
	bl Proc_Goto
	b _080B144A
_080B1442:
	movs r0, #9
	ldr r1, [r7]
	bl sub_80B1174
_080B144A:
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_80B1454
sub_80B1454: @ 0x080B1454
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	bl sub_8009E60
	cmp r0, #1
	beq _080B147E
	cmp r0, #1
	bgt _080B146E
	cmp r0, #0
	beq _080B1474
	b _080B1474
_080B146E:
	cmp r0, #2
	beq _080B1488
	b _080B1474
_080B1474:
	ldr r0, [r7]
	movs r1, #0xc
	bl Proc_Goto
	b _080B14B0
_080B147E:
	ldr r0, [r7]
	movs r1, #1
	bl Proc_Goto
	b _080B14B0
_080B1488:
	ldr r0, [r7]
	ldr r1, [r0, #0x2c]
	adds r0, r1, #0
	bl GetUnitItemCount
	cmp r0, #0
	bne _080B14A8
	movs r0, #0x1b
	ldr r1, [r7]
	bl sub_80B1174
	ldr r0, [r7]
	movs r1, #7
	bl Proc_Goto
	b _080B14B0
_080B14A8:
	ldr r0, [r7]
	movs r1, #4
	bl Proc_Goto
_080B14B0:
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0

	thumb_func_start sub_80B14B8
sub_80B14B8: @ 0x080B14B8
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	movs r0, #0x12
	ldr r1, [r7]
	bl sub_80B1174
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0

	thumb_func_start sub_80B14D0
sub_80B14D0: @ 0x080B14D0
	push {r4, r5, r7, lr}
	sub sp, #0x14
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	ldr r0, [r7]
	str r0, [r7, #8]
	ldr r1, [r7, #4]
	adds r0, r1, #0
	movs r1, #6
	bl DivRem
	str r0, [r7, #0xc]
	movs r0, #0
	bl SetTextFont
	bl InitSystemTextFont
	movs r0, #4
	bl EnableBgSync
	ldr r0, [r7, #0xc]
	adds r1, r0, #0
	lsls r0, r1, #3
	ldr r2, _080B1524 @ =0x0203EE48
	adds r1, r0, r2
	adds r0, r1, #0
	bl ClearText
	ldr r0, [r7, #8]
	ldr r1, [r7, #4]
	adds r2, r1, #0
	lsls r1, r2, #1
	adds r0, #0x30
	adds r1, r0, r1
	ldrh r0, [r1]
	str r0, [r7, #0x10]
	ldr r0, [r7, #0x10]
	cmp r0, #0
	bne _080B1528
	b _080B1550
	.align 2, 0
_080B1524: .4byte 0x0203EE48
_080B1528:
	ldr r0, [r7, #0xc]
	adds r1, r0, #0
	lsls r0, r1, #3
	ldr r1, _080B1558 @ =0x0203EE48
	adds r0, r0, r1
	ldr r1, [r7, #0x10]
	ldr r3, [r7, #8]
	ldr r2, [r3, #0x2c]
	ldr r3, [r7, #4]
	adds r4, r3, #0
	lsls r3, r4, #1
	movs r4, #0x1f
	ands r3, r4
	lsls r4, r3, #5
	adds r3, r4, #0
	lsls r4, r3, #1
	ldr r5, _080B155C @ =gBg2Tm + 0xe
	adds r3, r4, r5
	bl sub_80B2A9C
_080B1550:
	add sp, #0x14
	pop {r4, r5, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B1558: .4byte 0x0203EE48
_080B155C: .4byte gBg2Tm + 0xe

	thumb_func_start sub_80B1560
sub_80B1560: @ 0x080B1560
	push {r4, r5, r7, lr}
	sub sp, #0x14
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	ldr r0, [r7]
	str r0, [r7, #8]
	ldr r1, [r7, #4]
	adds r0, r1, #0
	movs r1, #6
	bl DivRem
	str r0, [r7, #0xc]
	movs r0, #0
	bl SetTextFont
	bl InitSystemTextFont
	movs r0, #4
	bl EnableBgSync
	ldr r0, [r7, #0xc]
	adds r1, r0, #0
	lsls r0, r1, #3
	ldr r2, _080B15B4 @ =0x0203EE48
	adds r1, r0, r2
	adds r0, r1, #0
	bl ClearText
	ldr r0, [r7, #8]
	ldr r1, [r7, #4]
	adds r2, r1, #0
	lsls r1, r2, #1
	adds r0, #0x30
	adds r1, r0, r1
	ldrh r0, [r1]
	str r0, [r7, #0x10]
	ldr r0, [r7, #0x10]
	cmp r0, #0
	bne _080B15B8
	b _080B15E0
	.align 2, 0
_080B15B4: .4byte 0x0203EE48
_080B15B8:
	ldr r0, [r7, #0xc]
	adds r1, r0, #0
	lsls r0, r1, #3
	ldr r1, _080B15E8 @ =0x0203EE48
	adds r0, r0, r1
	ldr r1, [r7, #0x10]
	ldr r3, [r7, #8]
	ldr r2, [r3, #0x2c]
	ldr r3, [r7, #4]
	adds r4, r3, #0
	lsls r3, r4, #1
	movs r4, #0x1f
	ands r3, r4
	lsls r4, r3, #5
	adds r3, r4, #0
	lsls r4, r3, #1
	ldr r5, _080B15EC @ =gBg2Tm + 0xe
	adds r3, r4, r5
	bl sub_80B2AF8
_080B15E0:
	add sp, #0x14
	pop {r4, r5, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B15E8: .4byte 0x0203EE48
_080B15EC: .4byte gBg2Tm + 0xe

	thumb_func_start sub_80B15F0
sub_80B15F0: @ 0x080B15F0
	push {r4, r7, lr}
	sub sp, #0x10
	add r7, sp, #0xc
	str r0, [r7]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x5e
	ldrb r0, [r1]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x5a
	ldrb r1, [r2]
	ldr r3, [r7]
	adds r2, r3, #0
	adds r4, r3, #0
	adds r4, #0x5f
	ldrb r3, [r4]
	movs r2, #0x48
	str r2, [sp]
	ldr r2, _080B162C @ =sub_80B14D0
	str r2, [sp, #4]
	ldr r2, [r7]
	str r2, [sp, #8]
	movs r2, #5
	bl sub_80B30E0
	add sp, #0x10
	pop {r4, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B162C: .4byte sub_80B14D0

	thumb_func_start sub_80B1630
sub_80B1630: @ 0x080B1630
	push {r4, r7, lr}
	sub sp, #0xc
	mov r7, sp
	str r0, [r7]
	adds r0, r7, #4
	movs r1, #0
	strb r1, [r0]
	bl sub_80B31DC
	bl sub_80B332C
	adds r1, r0, #0
	lsls r0, r1, #0x10
	lsrs r2, r0, #0x10
	movs r0, #2
	movs r1, #0
	bl SetBgOffset
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x5c
	ldrb r0, [r1]
	adds r4, r0, #0
	bl sub_80B3310
	lsls r2, r4, #0x10
	lsrs r1, r2, #0x10
	lsls r2, r0, #0x10
	lsrs r0, r2, #0x10
	cmp r1, r0
	beq _080B1674
	adds r0, r7, #4
	movs r1, #1
	strb r1, [r0]
_080B1674:
	bl sub_80B3310
	ldr r1, [r7]
	adds r2, r1, #0
	adds r1, #0x5c
	ldrb r2, [r1]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r0
	adds r0, r2, #0
	strb r0, [r1]
	bl sub_80B3350
	ldr r1, [r7]
	adds r2, r1, #0
	adds r1, #0x5d
	ldrb r2, [r1]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r0
	adds r0, r2, #0
	strb r0, [r1]
	ldr r0, [r7]
	ldr r1, [r7]
	adds r2, r1, #0
	adds r1, #0x5c
	adds r2, r0, #0
	adds r0, #0x5e
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	ldrb r1, [r1]
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0]
	ldr r0, [r7]
	ldr r1, [r7]
	adds r2, r1, #0
	adds r1, #0x5d
	adds r2, r0, #0
	adds r0, #0x5f
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	ldrb r1, [r1]
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x5c
	ldrb r0, [r1]
	adds r1, r0, #0
	lsls r0, r1, #4
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x5d
	ldrb r1, [r2]
	adds r2, r1, #0
	lsls r1, r2, #4
	adds r2, r1, #0
	subs r2, #0x48
	subs r1, r0, r2
	movs r0, #0x38
	bl DisplayUiHand
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x62
	ldrb r0, [r1]
	cmp r0, #0
	beq _080B1756
	adds r0, r7, #4
	movs r1, #0
	ldrsb r1, [r0, r1]
	cmp r1, #0
	beq _080B1756
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x5c
	ldrb r0, [r1]
	adds r1, r0, #0
	lsls r0, r1, #4
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x5d
	ldrb r1, [r2]
	adds r2, r1, #0
	lsls r1, r2, #4
	adds r2, r1, #0
	subs r2, #0x48
	subs r1, r0, r2
	ldr r0, [r7]
	ldr r3, [r7]
	adds r2, r3, #0
	adds r3, #0x5c
	ldrb r2, [r3]
	adds r3, r2, #0
	lsls r2, r3, #1
	adds r0, #0x30
	adds r3, r0, r2
	ldrh r2, [r3]
	movs r0, #0x38
	bl sub_80826EC
_080B1756:
	bl sub_80B2D50
	bl sub_80B33C4
	lsls r1, r0, #0x18
	asrs r0, r1, #0x18
	cmp r0, #0
	beq _080B1768
	b _080B18CC
_080B1768:
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x62
	ldrb r0, [r1]
	cmp r0, #0
	beq _080B17AA
	ldr r1, _080B17A4 @ =gpKeySt
	ldr r0, [r1]
	ldrh r1, [r0, #8]
	movs r2, #0x81
	lsls r2, r2, #1
	adds r0, r1, #0
	ands r0, r2
	adds r2, r0, #0
	lsls r1, r2, #0x10
	lsrs r0, r1, #0x10
	cmp r0, #0
	beq _080B17A0
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x62
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	bl CloseHelpBox
_080B17A0:
	b _080B18CC
	.align 2, 0
_080B17A4: .4byte gpKeySt
_080B17A8:
	b _080B1818
_080B17AA:
	ldr r1, _080B1814 @ =gpKeySt
	ldr r0, [r1]
	ldrh r1, [r0, #8]
	movs r2, #0x80
	lsls r2, r2, #1
	adds r0, r1, #0
	ands r0, r2
	adds r2, r0, #0
	lsls r1, r2, #0x10
	lsrs r0, r1, #0x10
	cmp r0, #0
	beq _080B1818
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x62
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #1
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x5c
	ldrb r0, [r1]
	adds r1, r0, #0
	lsls r0, r1, #4
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x5d
	ldrb r1, [r2]
	adds r2, r1, #0
	lsls r1, r2, #4
	adds r2, r1, #0
	subs r2, #0x48
	subs r1, r0, r2
	ldr r0, [r7]
	ldr r3, [r7]
	adds r2, r3, #0
	adds r3, #0x5c
	ldrb r2, [r3]
	adds r3, r2, #0
	lsls r2, r3, #1
	adds r0, #0x30
	adds r3, r0, r2
	ldrh r2, [r3]
	movs r0, #0x38
	bl sub_80826EC
	b _080B18CC
	.align 2, 0
_080B1814: .4byte gpKeySt
_080B1818:
	ldr r1, [r7]
	ldr r0, [r1, #0x2c]
	ldr r1, [r7]
	ldr r3, [r7]
	adds r2, r3, #0
	adds r3, #0x5c
	ldrb r2, [r3]
	adds r3, r2, #0
	lsls r2, r3, #1
	adds r1, #0x30
	adds r2, r1, r2
	ldrh r1, [r2]
	bl sub_80B2B64
	lsls r1, r0, #0x10
	lsrs r0, r1, #0x10
	str r0, [r7, #8]
	ldr r1, _080B186C @ =gpKeySt
	ldr r0, [r1]
	ldrh r1, [r0, #8]
	movs r2, #1
	adds r0, r1, #0
	ands r0, r2
	adds r2, r0, #0
	lsls r1, r2, #0x10
	lsrs r0, r1, #0x10
	cmp r0, #0
	beq _080B1888
	bl GetGold
	ldr r1, [r7, #8]
	cmp r1, r0
	ble _080B1870
	movs r0, #0x21
	ldr r1, [r7]
	bl sub_80B1174
	ldr r0, [r7]
	movs r1, #1
	bl Proc_Goto
	b _080B1886
	.align 2, 0
_080B186C: .4byte gpKeySt
_080B1870:
	ldr r1, [r7, #8]
	adds r0, r1, #0
	bl sub_8009E78
	movs r0, #0x24
	ldr r1, [r7]
	bl sub_80B1174
	ldr r0, [r7]
	bl Proc_Break
_080B1886:
	b _080B18CC
_080B1888:
	ldr r1, _080B18C0 @ =gpKeySt
	ldr r0, [r1]
	ldrh r1, [r0, #8]
	movs r2, #2
	adds r0, r1, #0
	ands r0, r2
	adds r2, r0, #0
	lsls r1, r2, #0x10
	lsrs r0, r1, #0x10
	cmp r0, #0
	beq _080B18CC
	ldr r1, _080B18C4 @ =gPlaySt
	adds r0, r1, #0
	adds r1, #0x41
	ldrb r0, [r1]
	lsls r1, r0, #0x1e
	lsrs r0, r1, #0x1f
	cmp r0, #0
	bne _080B18B6
	ldr r1, _080B18C8 @ =0x0000038B
	adds r0, r1, #0
	bl m4aSongNumStart
_080B18B6:
	ldr r0, [r7]
	movs r1, #7
	bl Proc_Goto
	b _080B18CC
	.align 2, 0
_080B18C0: .4byte gpKeySt
_080B18C4: .4byte gPlaySt
_080B18C8: .4byte 0x0000038B
_080B18CC:
	add sp, #0xc
	pop {r4, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_80B18D4
sub_80B18D4: @ 0x080B18D4
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	bl sub_8009E60
	cmp r0, #1
	beq _080B18F4
	cmp r0, #1
	bgt _080B18EE
	cmp r0, #0
	beq _080B18F6
	b _080B18F6
_080B18EE:
	cmp r0, #2
	beq _080B18F6
	b _080B18F6
_080B18F4:
	b _080B1900
_080B18F6:
	ldr r0, [r7]
	movs r1, #1
	bl Proc_Goto
	b _080B1900
_080B1900:
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0

	thumb_func_start sub_80B1908
sub_80B1908: @ 0x080B1908
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x5b
	ldrb r0, [r1]
	cmp r0, #4
	bls _080B1944
	bl sub_802ECE4
	lsls r1, r0, #0x18
	asrs r0, r1, #0x18
	cmp r0, #0
	beq _080B1932
	movs r0, #0x2d
	ldr r1, [r7]
	bl sub_80B1174
	b _080B1942
_080B1932:
	movs r0, #0x30
	ldr r1, [r7]
	bl sub_80B1174
	ldr r0, [r7]
	movs r1, #0xb
	bl Proc_Goto
_080B1942:
	b _080B196E
_080B1944:
	ldr r1, [r7]
	ldr r0, [r1, #0x2c]
	ldr r1, [r7]
	ldr r3, [r7]
	adds r2, r3, #0
	adds r3, #0x5c
	ldrb r2, [r3]
	adds r3, r2, #0
	lsls r2, r3, #1
	adds r1, #0x30
	adds r2, r1, r2
	ldrh r1, [r2]
	bl UnitAddItem
	ldr r0, [r7]
	bl sub_80B2E44
	ldr r0, [r7]
	movs r1, #3
	bl Proc_Goto
_080B196E:
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_80B1978
sub_80B1978: @ 0x080B1978
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	bl sub_8009E60
	cmp r0, #1
	beq _080B1998
	cmp r0, #1
	bgt _080B1992
	cmp r0, #0
	beq _080B199A
	b _080B199A
_080B1992:
	cmp r0, #2
	beq _080B199A
	b _080B199A
_080B1998:
	b _080B19A4
_080B199A:
	ldr r0, [r7]
	movs r1, #0xb
	bl Proc_Goto
	b _080B19A4
_080B19A4:
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0

	thumb_func_start sub_80B19AC
sub_80B19AC: @ 0x080B19AC
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	bl sub_802ECE4
	lsls r1, r0, #0x18
	asrs r0, r1, #0x18
	cmp r0, #0
	beq _080B19CA
	movs r0, #0x36
	ldr r1, [r7]
	bl sub_80B1174
	b _080B19D2
_080B19CA:
	movs r0, #0x39
	ldr r1, [r7]
	bl sub_80B1174
_080B19D2:
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_80B19DC
sub_80B19DC: @ 0x080B19DC
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, [r7]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x5c
	ldrb r1, [r2]
	adds r2, r1, #0
	lsls r1, r2, #1
	adds r0, #0x30
	adds r1, r0, r1
	ldrh r2, [r1]
	adds r0, r2, #0
	bl AddItemToConvoy
	ldr r0, [r7]
	bl sub_80B2E44
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0

	thumb_func_start sub_80B1A0C
sub_80B1A0C: @ 0x080B1A0C
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	movs r0, #0x33
	ldr r1, [r7]
	bl sub_80B1174
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0

	thumb_func_start sub_80B1A24
sub_80B1A24: @ 0x080B1A24
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	bl sub_802EC3C
	cmp r0, #0x63
	bgt _080B1A3C
	ldr r0, [r7]
	movs r1, #0xa
	bl Proc_Goto
_080B1A3C:
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0

	thumb_func_start sub_80B1A44
sub_80B1A44: @ 0x080B1A44
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	movs r0, #0x3c
	ldr r1, [r7]
	bl sub_80B1174
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0

	thumb_func_start sub_80B1A5C
sub_80B1A5C: @ 0x080B1A5C
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	movs r0, #0x15
	ldr r1, [r7]
	bl sub_80B1174
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0

	thumb_func_start sub_80B1A74
sub_80B1A74: @ 0x080B1A74
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	movs r0, #0x18
	ldr r1, [r7]
	bl sub_80B1174
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0

	thumb_func_start sub_80B1A8C
sub_80B1A8C: @ 0x080B1A8C
	push {r7, lr}
	sub sp, #0x10
	add r7, sp, #0xc
	str r0, [r7]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x5c
	ldrb r0, [r1]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x5b
	ldrb r1, [r2]
	movs r2, #0x48
	str r2, [sp]
	ldr r2, _080B1AC0 @ =sub_80B1560
	str r2, [sp, #4]
	ldr r2, [r7]
	str r2, [sp, #8]
	movs r2, #5
	movs r3, #0
	bl sub_80B30E0
	add sp, #0x10
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B1AC0: .4byte sub_80B1560

	thumb_func_start sub_80B1AC4
sub_80B1AC4: @ 0x080B1AC4
	push {r4, r7, lr}
	sub sp, #8
	mov r7, sp
	str r0, [r7]
	adds r0, r7, #4
	movs r1, #0
	strb r1, [r0]
	bl sub_80B31DC
	bl sub_80B332C
	adds r1, r0, #0
	lsls r0, r1, #0x10
	lsrs r2, r0, #0x10
	movs r0, #2
	movs r1, #0
	bl SetBgOffset
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x5c
	ldrb r0, [r1]
	adds r4, r0, #0
	bl sub_80B3310
	lsls r2, r4, #0x10
	lsrs r1, r2, #0x10
	lsls r2, r0, #0x10
	lsrs r0, r2, #0x10
	cmp r1, r0
	beq _080B1B08
	adds r0, r7, #4
	movs r1, #1
	strb r1, [r0]
_080B1B08:
	bl sub_80B3310
	ldr r1, [r7]
	adds r2, r1, #0
	adds r1, #0x5c
	ldrb r2, [r1]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r0
	adds r0, r2, #0
	strb r0, [r1]
	bl sub_80B3350
	ldr r1, [r7]
	adds r2, r1, #0
	adds r1, #0x5d
	ldrb r2, [r1]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r0
	adds r0, r2, #0
	strb r0, [r1]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x5c
	ldrb r0, [r1]
	adds r1, r0, #0
	lsls r0, r1, #4
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x5d
	ldrb r1, [r2]
	adds r2, r1, #0
	lsls r1, r2, #4
	adds r2, r1, #0
	subs r2, #0x48
	subs r1, r0, r2
	movs r0, #0x38
	bl DisplayUiHand
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x62
	ldrb r0, [r1]
	cmp r0, #0
	beq _080B1BB0
	adds r0, r7, #4
	movs r1, #0
	ldrsb r1, [r0, r1]
	cmp r1, #0
	beq _080B1BB0
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x5c
	ldrb r0, [r1]
	adds r1, r0, #0
	lsls r0, r1, #4
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x5d
	ldrb r1, [r2]
	adds r2, r1, #0
	lsls r1, r2, #4
	adds r2, r1, #0
	subs r2, #0x48
	subs r1, r0, r2
	ldr r2, [r7]
	ldr r0, [r2, #0x2c]
	ldr r3, [r7]
	adds r2, r3, #0
	adds r3, #0x5c
	ldrb r2, [r3]
	adds r3, r2, #0
	lsls r2, r3, #1
	adds r0, #0x1e
	adds r3, r0, r2
	ldrh r2, [r3]
	movs r0, #0x38
	bl sub_80826EC
_080B1BB0:
	bl sub_80B33C4
	lsls r1, r0, #0x18
	asrs r0, r1, #0x18
	cmp r0, #0
	beq _080B1BBE
	b _080B1D3C
_080B1BBE:
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x62
	ldrb r0, [r1]
	cmp r0, #0
	beq _080B1BFE
	ldr r1, _080B1BF8 @ =gpKeySt
	ldr r0, [r1]
	ldrh r1, [r0, #8]
	movs r2, #0x81
	lsls r2, r2, #1
	adds r0, r1, #0
	ands r0, r2
	adds r2, r0, #0
	lsls r1, r2, #0x10
	lsrs r0, r1, #0x10
	cmp r0, #0
	beq _080B1BF6
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x62
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	bl CloseHelpBox
_080B1BF6:
	b _080B1D3C
	.align 2, 0
_080B1BF8: .4byte gpKeySt
_080B1BFC:
	b _080B1C70
_080B1BFE:
	ldr r1, _080B1C6C @ =gpKeySt
	ldr r0, [r1]
	ldrh r1, [r0, #8]
	movs r2, #0x80
	lsls r2, r2, #1
	adds r0, r1, #0
	ands r0, r2
	adds r2, r0, #0
	lsls r1, r2, #0x10
	lsrs r0, r1, #0x10
	cmp r0, #0
	beq _080B1C70
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x62
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #1
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x5c
	ldrb r0, [r1]
	adds r1, r0, #0
	lsls r0, r1, #4
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x5d
	ldrb r1, [r2]
	adds r2, r1, #0
	lsls r1, r2, #4
	adds r2, r1, #0
	subs r2, #0x48
	subs r1, r0, r2
	ldr r2, [r7]
	ldr r0, [r2, #0x2c]
	ldr r3, [r7]
	adds r2, r3, #0
	adds r3, #0x5c
	ldrb r2, [r3]
	adds r3, r2, #0
	lsls r2, r3, #1
	adds r0, #0x1e
	adds r3, r0, r2
	ldrh r2, [r3]
	movs r0, #0x38
	bl sub_80826EC
	b _080B1D3C
	.align 2, 0
_080B1C6C: .4byte gpKeySt
_080B1C70:
	ldr r1, _080B1CBC @ =gpKeySt
	ldr r0, [r1]
	ldrh r1, [r0, #8]
	movs r2, #1
	adds r0, r1, #0
	ands r0, r2
	adds r2, r0, #0
	lsls r1, r2, #0x10
	lsrs r0, r1, #0x10
	cmp r0, #0
	beq _080B1CF6
	ldr r1, [r7]
	ldr r0, [r1, #0x2c]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x5c
	ldrb r1, [r2]
	adds r2, r1, #0
	lsls r1, r2, #1
	adds r0, #0x1e
	adds r1, r0, r1
	ldrh r2, [r1]
	adds r0, r2, #0
	bl sub_80B2BDC
	lsls r1, r0, #0x18
	asrs r0, r1, #0x18
	cmp r0, #0
	bne _080B1CC0
	movs r0, #0x2a
	ldr r1, [r7]
	bl sub_80B1174
	ldr r0, [r7]
	movs r1, #4
	bl Proc_Goto
	b _080B1CF4
	.align 2, 0
_080B1CBC: .4byte gpKeySt
_080B1CC0:
	ldr r1, [r7]
	ldr r0, [r1, #0x2c]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x5c
	ldrb r1, [r2]
	adds r2, r1, #0
	lsls r1, r2, #1
	adds r0, #0x1e
	adds r1, r0, r1
	ldrh r2, [r1]
	adds r0, r2, #0
	bl sub_80B2BB4
	lsls r2, r0, #0x10
	lsrs r1, r2, #0x10
	adds r0, r1, #0
	bl sub_8009E78
	movs r0, #0x24
	ldr r1, [r7]
	bl sub_80B1174
	ldr r0, [r7]
	bl Proc_Break
_080B1CF4:
	b _080B1D3C
_080B1CF6:
	ldr r1, _080B1D30 @ =gpKeySt
	ldr r0, [r1]
	ldrh r1, [r0, #8]
	movs r2, #2
	adds r0, r1, #0
	ands r0, r2
	adds r2, r0, #0
	lsls r1, r2, #0x10
	lsrs r0, r1, #0x10
	cmp r0, #0
	beq _080B1D3C
	ldr r1, _080B1D34 @ =gPlaySt
	adds r0, r1, #0
	adds r1, #0x41
	ldrb r0, [r1]
	lsls r1, r0, #0x1e
	lsrs r0, r1, #0x1f
	cmp r0, #0
	bne _080B1D24
	ldr r1, _080B1D38 @ =0x0000038B
	adds r0, r1, #0
	bl m4aSongNumStart
_080B1D24:
	ldr r0, [r7]
	movs r1, #8
	bl Proc_Goto
	b _080B1D3C
	.align 2, 0
_080B1D30: .4byte gpKeySt
_080B1D34: .4byte gPlaySt
_080B1D38: .4byte 0x0000038B
_080B1D3C:
	add sp, #8
	pop {r4, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_80B1D44
sub_80B1D44: @ 0x080B1D44
	push {r7, lr}
	sub sp, #8
	mov r7, sp
	str r0, [r7]
	bl sub_8009E60
	cmp r0, #1
	beq _080B1D64
	cmp r0, #1
	bgt _080B1D5E
	cmp r0, #0
	beq _080B1DFA
	b _080B1DFA
_080B1D5E:
	cmp r0, #2
	beq _080B1DFA
	b _080B1DFA
_080B1D64:
	movs r0, #0xb9
	movs r1, #8
	bl sub_801525C
	ldr r0, _080B1DF0 @ =gActionSt
	ldrb r1, [r0, #0x11]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x14
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0, #0x11]
	bl GetGold
	str r0, [r7, #4]
	ldr r1, [r7]
	ldr r0, [r1, #0x2c]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x5c
	ldrb r1, [r2]
	adds r2, r1, #0
	lsls r1, r2, #1
	adds r0, #0x1e
	adds r1, r0, r1
	ldrh r2, [r1]
	adds r0, r2, #0
	bl sub_80B2BB4
	lsls r1, r0, #0x10
	lsrs r0, r1, #0x10
	ldr r1, [r7, #4]
	adds r0, r1, r0
	str r0, [r7, #4]
	ldr r1, [r7, #4]
	adds r0, r1, #0
	bl SetGold
	ldr r1, [r7]
	ldr r0, [r1, #0x2c]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x5c
	ldrb r1, [r2]
	bl UnitRemoveItem
	ldr r0, [r7]
	bl sub_80B1348
	ldr r0, [r7]
	bl sub_80B2904
	ldr r1, _080B1DF4 @ =gBg0Tm + 0x1b6
	adds r0, r1, #0
	bl sub_80B26DC
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x5b
	ldrb r0, [r1]
	cmp r0, #0
	bne _080B1DF8
	ldr r0, [r7]
	movs r1, #7
	bl Proc_Goto
	b _080B1E04
	.align 2, 0
_080B1DF0: .4byte gActionSt
_080B1DF4: .4byte gBg0Tm + 0x1b6
_080B1DF8:
	b _080B1E04
_080B1DFA:
	ldr r0, [r7]
	movs r1, #4
	bl Proc_Goto
	b _080B1E04
_080B1E04:
	add sp, #8
	pop {r7}
	pop {r0}
	bx r0

	thumb_func_start sub_80B1E0C
sub_80B1E0C: @ 0x080B1E0C
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	movs r0, #0x1e
	ldr r1, [r7]
	bl sub_80B1174
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0

	thumb_func_start sub_80B1E24
sub_80B1E24: @ 0x080B1E24
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x5c
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	movs r0, #0xc
	ldr r1, [r7]
	bl sub_80B1174
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0

	thumb_func_start sub_80B1E4C
sub_80B1E4C: @ 0x080B1E4C
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	movs r0, #0xf
	ldr r1, [r7]
	bl sub_80B1174
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0

	thumb_func_start sub_80B1E64
sub_80B1E64: @ 0x080B1E64
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, [r7]
	ldr r1, [r0, #0x2c]
	cmp r1, #0
	bne _080B1E7E
	movs r0, #7
	ldr r1, [r7]
	bl sub_80B1174
	b _080B1E86
_080B1E7E:
	movs r0, #0x27
	ldr r1, [r7]
	bl sub_80B1174
_080B1E86:
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_80B1E90
sub_80B1E90: @ 0x080B1E90
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r1, _080B1EB0 @ =gUnk_08DB0ADC
	adds r0, r1, #0
	bl Proc_EndEach
	ldr r0, _080B1EB4 @ =gUnk_08D64F4C
	ldr r1, _080B1EB8 @ =sub_806E2C8
	bl Proc_ForEach
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B1EB0: .4byte gUnk_08DB0ADC
_080B1EB4: .4byte gUnk_08D64F4C
_080B1EB8: .4byte sub_806E2C8

	thumb_func_start sub_80B1EBC
sub_80B1EBC: @ 0x080B1EBC
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	movs r0, #5
	ldr r1, [r7]
	bl sub_80B1174
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0

	thumb_func_start sub_80B1ED4
sub_80B1ED4: @ 0x080B1ED4
	push {r4, r7, lr}
	sub sp, #8
	mov r7, sp
	str r0, [r7]
	adds r0, r7, #4
	movs r1, #0
	strb r1, [r0]
	bl sub_80B31DC
	bl sub_80B332C
	adds r1, r0, #0
	lsls r0, r1, #0x10
	lsrs r2, r0, #0x10
	movs r0, #2
	movs r1, #0
	bl SetBgOffset
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x5c
	ldrb r0, [r1]
	adds r4, r0, #0
	bl sub_80B3310
	lsls r2, r4, #0x10
	lsrs r1, r2, #0x10
	lsls r2, r0, #0x10
	lsrs r0, r2, #0x10
	cmp r1, r0
	beq _080B1F18
	adds r0, r7, #4
	movs r1, #1
	strb r1, [r0]
_080B1F18:
	bl sub_80B3310
	ldr r1, [r7]
	adds r2, r1, #0
	adds r1, #0x5c
	ldrb r2, [r1]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r0
	adds r0, r2, #0
	strb r0, [r1]
	bl sub_80B3350
	ldr r1, [r7]
	adds r2, r1, #0
	adds r1, #0x5d
	ldrb r2, [r1]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r0
	adds r0, r2, #0
	strb r0, [r1]
	ldr r0, [r7]
	ldr r1, [r7]
	adds r2, r1, #0
	adds r1, #0x5c
	adds r2, r0, #0
	adds r0, #0x5e
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	ldrb r1, [r1]
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0]
	ldr r0, [r7]
	ldr r1, [r7]
	adds r2, r1, #0
	adds r1, #0x5d
	adds r2, r0, #0
	adds r0, #0x5f
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	ldrb r1, [r1]
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x5c
	ldrb r0, [r1]
	adds r1, r0, #0
	lsls r0, r1, #4
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x5d
	ldrb r1, [r2]
	adds r2, r1, #0
	lsls r1, r2, #4
	adds r2, r1, #0
	subs r2, #0x48
	subs r1, r0, r2
	movs r0, #0x38
	bl DisplayUiHand
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x62
	ldrb r0, [r1]
	cmp r0, #0
	beq _080B1FFA
	adds r0, r7, #4
	movs r1, #0
	ldrsb r1, [r0, r1]
	cmp r1, #0
	beq _080B1FFA
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x5c
	ldrb r0, [r1]
	adds r1, r0, #0
	lsls r0, r1, #4
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x5d
	ldrb r1, [r2]
	adds r2, r1, #0
	lsls r1, r2, #4
	adds r2, r1, #0
	subs r2, #0x48
	subs r1, r0, r2
	ldr r0, [r7]
	ldr r3, [r7]
	adds r2, r3, #0
	adds r3, #0x5c
	ldrb r2, [r3]
	adds r3, r2, #0
	lsls r2, r3, #1
	adds r0, #0x30
	adds r3, r0, r2
	ldrh r2, [r3]
	movs r0, #0x38
	bl sub_80826EC
_080B1FFA:
	bl sub_80B2D50
	bl sub_80B33C4
	lsls r1, r0, #0x18
	asrs r0, r1, #0x18
	cmp r0, #0
	beq _080B200C
	b _080B2100
_080B200C:
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x62
	ldrb r0, [r1]
	cmp r0, #0
	beq _080B204E
	ldr r1, _080B2048 @ =gpKeySt
	ldr r0, [r1]
	ldrh r1, [r0, #8]
	movs r2, #0x81
	lsls r2, r2, #1
	adds r0, r1, #0
	ands r0, r2
	adds r2, r0, #0
	lsls r1, r2, #0x10
	lsrs r0, r1, #0x10
	cmp r0, #0
	beq _080B2044
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x62
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	bl CloseHelpBox
_080B2044:
	b _080B2100
	.align 2, 0
_080B2048: .4byte gpKeySt
_080B204C:
	b _080B20BC
_080B204E:
	ldr r1, _080B20B8 @ =gpKeySt
	ldr r0, [r1]
	ldrh r1, [r0, #8]
	movs r2, #0x80
	lsls r2, r2, #1
	adds r0, r1, #0
	ands r0, r2
	adds r2, r0, #0
	lsls r1, r2, #0x10
	lsrs r0, r1, #0x10
	cmp r0, #0
	beq _080B20BC
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x62
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #1
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x5c
	ldrb r0, [r1]
	adds r1, r0, #0
	lsls r0, r1, #4
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x5d
	ldrb r1, [r2]
	adds r2, r1, #0
	lsls r1, r2, #4
	adds r2, r1, #0
	subs r2, #0x48
	subs r1, r0, r2
	ldr r0, [r7]
	ldr r3, [r7]
	adds r2, r3, #0
	adds r3, #0x5c
	ldrb r2, [r3]
	adds r3, r2, #0
	lsls r2, r3, #1
	adds r0, #0x30
	adds r3, r0, r2
	ldrh r2, [r3]
	movs r0, #0x38
	bl sub_80826EC
	b _080B2100
	.align 2, 0
_080B20B8: .4byte gpKeySt
_080B20BC:
	ldr r1, _080B20F4 @ =gpKeySt
	ldr r0, [r1]
	ldrh r1, [r0, #8]
	movs r2, #3
	adds r0, r1, #0
	ands r0, r2
	adds r2, r0, #0
	lsls r1, r2, #0x10
	lsrs r0, r1, #0x10
	cmp r0, #0
	beq _080B2100
	ldr r1, _080B20F8 @ =gPlaySt
	adds r0, r1, #0
	adds r1, #0x41
	ldrb r0, [r1]
	lsls r1, r0, #0x1e
	lsrs r0, r1, #0x1f
	cmp r0, #0
	bne _080B20EA
	ldr r1, _080B20FC @ =0x0000038B
	adds r0, r1, #0
	bl m4aSongNumStart
_080B20EA:
	ldr r0, [r7]
	movs r1, #0xc
	bl Proc_Goto
	b _080B2100
	.align 2, 0
_080B20F4: .4byte gpKeySt
_080B20F8: .4byte gPlaySt
_080B20FC: .4byte 0x0000038B
_080B2100:
	add sp, #8
	pop {r4, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_80B2108
sub_80B2108: @ 0x080B2108
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, _080B2138 @ =gBmSt
	ldrb r1, [r0, #4]
	movs r2, #0x10
	adds r0, r1, #0
	ands r0, r2
	adds r2, r0, #0
	lsls r1, r2, #0x18
	lsrs r0, r1, #0x18
	cmp r0, #0
	bne _080B212E
	ldr r1, _080B213C @ =gUnk_08DB07A4
	adds r0, r1, #0
	ldr r1, [r7]
	bl Proc_StartBlocking
_080B212E:
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B2138: .4byte gBmSt
_080B213C: .4byte gUnk_08DB07A4

	thumb_func_start sub_80B2140
sub_80B2140: @ 0x080B2140
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, _080B2168 @ =gBmSt
	ldrb r1, [r0, #4]
	movs r2, #0x10
	adds r0, r1, #0
	ands r0, r2
	adds r2, r0, #0
	lsls r1, r2, #0x18
	lsrs r0, r1, #0x18
	cmp r0, #0
	bne _080B2170
	ldr r1, _080B216C @ =gUnk_08DB07DC
	adds r0, r1, #0
	ldr r1, [r7]
	bl Proc_StartBlocking
	b _080B2174
	.align 2, 0
_080B2168: .4byte gBmSt
_080B216C: .4byte gUnk_08DB07DC
_080B2170:
	bl sub_800EC08
_080B2174:
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0

	thumb_func_start sub_80B217C
sub_80B217C: @ 0x080B217C
	push {r4, r7, lr}
	sub sp, #0xc
	add r7, sp, #4
	str r0, [r7]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x61
	ldrb r0, [r1]
	cmp r0, #0
	bne _080B219A
	movs r0, #0x4d
	movs r1, #0
	bl sub_800376C
	b _080B21A2
_080B219A:
	movs r0, #0x46
	movs r1, #0
	bl sub_800376C
_080B21A2:
	ldr r0, _080B22B4 @ =gUnk_08D64F4C
	ldr r1, _080B22B8 @ =sub_806E2A0
	bl Proc_ForEach
	bl sub_80B2C4C
	ldr r0, _080B22BC @ =gDispIo
	ldrb r1, [r0, #0xc]
	movs r2, #0xfc
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0, #0xc]
	ldr r0, _080B22BC @ =gDispIo
	ldrb r1, [r0, #0x10]
	movs r2, #0xfc
	ands r1, r2
	adds r2, r1, #0
	movs r3, #2
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0, #0x10]
	ldr r0, _080B22BC @ =gDispIo
	ldrb r1, [r0, #0x14]
	movs r2, #0xfc
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0, #0x14]
	ldr r0, _080B22BC @ =gDispIo
	ldrb r1, [r0, #0x18]
	movs r2, #3
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0, #0x18]
	movs r1, #0x80
	lsls r1, r1, #2
	adds r0, r1, #0
	movs r1, #2
	movs r2, #0
	bl InitTalk
	bl InitFaces
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x5c
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x5e
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x5f
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x5d
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x60
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x62
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	movs r1, #0x90
	lsls r1, r1, #2
	adds r0, r1, #0
	movs r1, #3
	bl sub_80B2D90
	ldr r0, [r7]
	bl sub_80B1148
	movs r1, #1
	str r1, [sp]
	movs r1, #0x20
	movs r2, #8
	movs r3, #3
	bl sub_8008DA8
	ldr r0, _080B22C0 @ =gUnk_083FAD4C
	ldr r1, _080B22C4 @ =gBuf
	bl Decompress
	ldr r0, _080B22C8 @ =gBg1Tm
	ldr r1, _080B22C4 @ =gBuf
	movs r2, #0x80
	lsls r2, r2, #5
	bl TmApplyTsa_thm
	movs r0, #0
	str r0, [sp]
	movs r0, #6
	movs r1, #8
	movs r2, #0x14
	movs r3, #0xc
	bl sub_804A4CC
	movs r0, #2
	bl EnableBgSync
	ldr r0, [r7]
	bl sub_80B25C8
	movs r0, #0
	str r0, [r7, #4]
_080B22AC:
	ldr r0, [r7, #4]
	cmp r0, #5
	ble _080B22CC
	b _080B22EC
	.align 2, 0
_080B22B4: .4byte gUnk_08D64F4C
_080B22B8: .4byte sub_806E2A0
_080B22BC: .4byte gDispIo
_080B22C0: .4byte gUnk_083FAD4C
_080B22C4: .4byte gBuf
_080B22C8: .4byte gBg1Tm
_080B22CC:
	ldr r0, [r7, #4]
	adds r1, r0, #0
	lsls r0, r1, #3
	ldr r2, _080B22E8 @ =0x0203EE48
	adds r1, r0, r2
	adds r0, r1, #0
	movs r1, #0x14
	bl InitText
	ldr r0, [r7, #4]
	adds r1, r0, #1
	str r1, [r7, #4]
	b _080B22AC
	.align 2, 0
_080B22E8: .4byte 0x0203EE48
_080B22EC:
	ldr r0, [r7]
	bl sub_80B27D8
	ldr r0, _080B25A8 @ =gDispIo
	ldrb r1, [r0, #1]
	movs r2, #0x20
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0, #1]
	ldr r0, _080B25A8 @ =gDispIo
	ldrb r1, [r0, #1]
	movs r2, #0x40
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0, #1]
	ldr r0, _080B25A8 @ =gDispIo
	ldrb r1, [r0, #1]
	movs r2, #0x7f
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0, #1]
	ldr r0, _080B25A8 @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x34
	ldrb r1, [r0]
	movs r2, #1
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _080B25A8 @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x34
	ldrb r1, [r0]
	movs r2, #2
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _080B25A8 @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x34
	ldrb r1, [r0]
	movs r2, #4
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _080B25A8 @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x34
	ldrb r1, [r0]
	movs r2, #8
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _080B25A8 @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x34
	ldrb r1, [r0]
	movs r2, #0x10
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _080B25A8 @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x35
	ldrb r1, [r0]
	movs r2, #1
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _080B25A8 @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x35
	ldrb r1, [r0]
	movs r2, #2
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _080B25A8 @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x35
	ldrb r1, [r0]
	movs r2, #0xfb
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _080B25A8 @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x35
	ldrb r1, [r0]
	movs r2, #8
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _080B25A8 @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x35
	ldrb r1, [r0]
	movs r2, #0x10
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _080B25A8 @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x36
	ldrb r1, [r0]
	movs r2, #1
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _080B25A8 @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x36
	ldrb r1, [r0]
	movs r2, #2
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _080B25A8 @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x36
	ldrb r1, [r0]
	movs r2, #0xfb
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _080B25A8 @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x36
	ldrb r1, [r0]
	movs r2, #8
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _080B25A8 @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x36
	ldrb r1, [r0]
	movs r2, #0x10
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _080B25A8 @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x2d
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x38
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _080B25A8 @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x31
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x48
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _080B25A8 @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x2c
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0xf0
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _080B25A8 @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x30
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x98
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _080B25A8 @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x2f
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _080B25A8 @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x33
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #8
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _080B25A8 @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x2e
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0xf0
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _080B25A8 @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x32
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x38
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _080B25A8 @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x34
	ldrb r1, [r0]
	movs r2, #0xdf
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _080B25A8 @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x35
	ldrb r1, [r0]
	movs r2, #0x20
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _080B25A8 @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x36
	ldrb r1, [r0]
	movs r2, #0xdf
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _080B25A8 @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x3c
	ldrb r1, [r0]
	movs r2, #0xc0
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _080B25A8 @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x44
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _080B25A8 @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x45
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _080B25A8 @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x46
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #8
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _080B25AC @ =0x030027CC
	ldr r1, _080B25AC @ =0x030027CC
	ldrh r2, [r1]
	ldr r3, _080B25B0 @ =0x0000FFE0
	adds r1, r2, #0
	ands r1, r3
	adds r2, r1, #0
	strh r2, [r0]
	ldr r0, _080B25AC @ =0x030027CC
	ldr r1, _080B25AC @ =0x030027CC
	ldrh r2, [r1]
	movs r3, #8
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strh r2, [r0]
	ldr r0, _080B25AC @ =0x030027CC
	ldr r1, _080B25AC @ =0x030027CC
	ldrh r2, [r1]
	ldr r3, _080B25B4 @ =0x0000E0FF
	adds r1, r2, #0
	ands r1, r3
	adds r2, r1, #0
	strh r2, [r0]
	ldr r0, _080B25AC @ =0x030027CC
	ldr r1, _080B25AC @ =0x030027CC
	ldrh r2, [r1]
	strh r2, [r0]
	ldr r4, _080B25B8 @ =gUnk_08439BF0
	movs r0, #3
	bl GetBgChrOffset
	movs r2, #0xc0
	lsls r2, r2, #0x13
	adds r1, r0, r2
	adds r0, r4, #0
	bl Decompress
	ldr r0, _080B25BC @ =gBg3Tm
	ldr r1, _080B25C0 @ =gUnk_0842D860
	movs r2, #0xe0
	lsls r2, r2, #8
	bl TmApplyTsa_thm
	ldr r0, _080B25C4 @ =gUnk_0843F144
	movs r1, #0xe0
	lsls r1, r1, #1
	movs r2, #0x20
	bl ApplyPaletteExt
	movs r0, #8
	bl EnableBgSync
	add sp, #0xc
	pop {r4, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B25A8: .4byte gDispIo
_080B25AC: .4byte 0x030027CC
_080B25B0: .4byte 0x0000FFE0
_080B25B4: .4byte 0x0000E0FF
_080B25B8: .4byte gUnk_08439BF0
_080B25BC: .4byte gBg3Tm
_080B25C0: .4byte gUnk_0842D860
_080B25C4: .4byte gUnk_0843F144

	thumb_func_start sub_80B25C8
sub_80B25C8: @ 0x080B25C8
	push {r7, lr}
	sub sp, #8
	mov r7, sp
	str r0, [r7]
	ldr r0, _080B2650 @ =gUnk_083FAE28
	ldr r1, _080B2654 @ =0x06014C00
	bl Decompress
	ldr r1, _080B2658 @ =gUnk_08DB0ADC
	adds r0, r1, #0
	ldr r1, [r7]
	bl Proc_Start
	str r0, [r7, #4]
	ldr r0, [r7, #4]
	adds r1, r0, #0
	adds r0, #0x64
	ldrh r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0xac
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
	movs r3, #0x2c
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strh r2, [r0]
	ldr r0, [r7, #4]
	adds r1, r0, #0
	adds r0, #0x68
	ldrh r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	ldr r3, _080B265C @ =0x00004260
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strh r2, [r0]
	ldr r0, _080B2660 @ =gUnk_081DBD64
	movs r1, #0xa0
	lsls r1, r1, #2
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r1, _080B2664 @ =gBg0Tm + 0x1b8
	adds r0, r1, #0
	bl sub_80B266C
	ldr r1, _080B2668 @ =gBg0Tm + 0x1b6
	adds r0, r1, #0
	bl sub_80B26DC
	add sp, #8
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B2650: .4byte gUnk_083FAE28
_080B2654: .4byte 0x06014C00
_080B2658: .4byte gUnk_08DB0ADC
_080B265C: .4byte 0x00004260
_080B2660: .4byte gUnk_081DBD64
_080B2664: .4byte gBg0Tm + 0x1b8
_080B2668: .4byte gBg0Tm + 0x1b6

	thumb_func_start sub_80B266C
sub_80B266C: @ 0x080B266C
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	movs r0, #0
	bl SetTextFont
	bl InitSystemTextFont
	ldr r1, _080B269C @ =0x03001618
	adds r0, r1, #0
	movs r1, #1
	bl InitText
	ldr r2, _080B26A0 @ =gUnk_0844BF6C
	ldr r0, [r7]
	movs r1, #3
	bl sub_8014B14
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B269C: .4byte 0x03001618
_080B26A0: .4byte gUnk_0844BF6C

	thumb_func_start sub_80B26A4
sub_80B26A4: @ 0x080B26A4
	push {r7, lr}
	sub sp, #8
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
_080B26AE:
	ldr r0, [r7, #4]
	cmp r0, #0
	bgt _080B26B6
	b _080B26D4
_080B26B6:
	ldr r0, [r7]
	movs r1, #0
	strh r1, [r0]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r0, #0x40
	movs r1, #0
	strh r1, [r0]
	ldr r0, [r7]
	subs r1, r0, #2
	str r1, [r7]
	ldr r0, [r7, #4]
	subs r1, r0, #1
	str r1, [r7, #4]
	b _080B26AE
_080B26D4:
	add sp, #8
	pop {r7}
	pop {r0}
	bx r0

	thumb_func_start sub_80B26DC
sub_80B26DC: @ 0x080B26DC
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	movs r0, #0
	bl SetTextFont
	bl InitSystemTextFont
	ldr r0, [r7]
	movs r1, #6
	bl sub_80B26A4
	bl GetGold
	adds r2, r0, #0
	ldr r0, [r7]
	movs r1, #2
	bl sub_8006068
	movs r0, #1
	bl EnableBgSync
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_80B2714
sub_80B2714: @ 0x080B2714
	push {r7, lr}
	sub sp, #0x10
	mov r7, sp
	str r0, [r7]
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x60
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r1, _080B2764 @ =gUnk_08DB0A84
	adds r0, r1, #0
	movs r1, #3
	bl Proc_Start
	str r0, [r7, #0xc]
	ldr r0, [r7, #0xc]
	ldr r1, [r7]
	str r1, [r0, #0x54]
	movs r0, #0
	bl SetTextFont
	bl InitSystemTextFont
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x5f
	ldrb r0, [r1]
	str r0, [r7, #4]
_080B2752:
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x5f
	ldrb r0, [r1]
	adds r1, r0, #5
	ldr r0, [r7, #4]
	cmp r0, r1
	blt _080B2768
	b _080B27A8
	.align 2, 0
_080B2764: .4byte gUnk_08DB0A84
_080B2768:
	ldr r1, [r7, #4]
	adds r0, r1, #0
	movs r1, #6
	bl DivRem
	str r0, [r7, #8]
	ldr r0, [r7, #8]
	adds r1, r0, #0
	lsls r0, r1, #3
	ldr r1, _080B27A0 @ =0x0203EE48
	adds r0, r0, r1
	ldr r1, [r7, #4]
	adds r2, r1, #0
	lsls r1, r2, #1
	movs r2, #0x1f
	ands r1, r2
	lsls r2, r1, #5
	adds r1, r2, #0
	lsls r2, r1, #1
	ldr r3, _080B27A4 @ =gBg2Tm + 0xe
	adds r1, r2, r3
	bl PutBlankText
	ldr r0, [r7, #4]
	adds r1, r0, #1
	str r1, [r7, #4]
	b _080B2752
	.align 2, 0
_080B27A0: .4byte 0x0203EE48
_080B27A4: .4byte gBg2Tm + 0xe
_080B27A8:
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x5f
	ldrb r0, [r1]
	adds r1, r0, #0
	lsls r0, r1, #4
	adds r1, r0, #0
	adds r0, r1, #0
	subs r0, #0x48
	adds r1, r0, #0
	lsls r0, r1, #0x10
	lsrs r2, r0, #0x10
	movs r0, #2
	movs r1, #0
	bl SetBgOffset
	movs r0, #4
	bl EnableBgSync
	add sp, #0x10
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_80B27D8
sub_80B27D8: @ 0x080B27D8
	push {r4, r5, r7, lr}
	sub sp, #0x10
	mov r7, sp
	str r0, [r7]
	movs r0, #0
	bl SetTextFont
	bl InitSystemTextFont
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x5f
	ldrb r0, [r1]
	str r0, [r7, #4]
_080B27F4:
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x5f
	ldrb r0, [r1]
	adds r1, r0, #5
	ldr r0, [r7, #4]
	cmp r0, r1
	blt _080B2806
	b _080B2830
_080B2806:
	ldr r1, [r7, #4]
	adds r0, r1, #0
	movs r1, #6
	bl DivRem
	str r0, [r7, #0xc]
	ldr r0, [r7, #0xc]
	adds r1, r0, #0
	lsls r0, r1, #3
	ldr r2, _080B282C @ =0x0203EE48
	adds r1, r0, r2
	adds r0, r1, #0
	bl ClearText
	ldr r0, [r7, #4]
	adds r1, r0, #1
	str r1, [r7, #4]
	b _080B27F4
	.align 2, 0
_080B282C: .4byte 0x0203EE48
_080B2830:
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x5f
	ldrb r0, [r1]
	str r0, [r7, #4]
_080B283A:
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x5f
	ldrb r0, [r1]
	adds r1, r0, #5
	ldr r0, [r7, #4]
	cmp r0, r1
	blt _080B284C
	b _080B28A8
_080B284C:
	ldr r1, [r7, #4]
	adds r0, r1, #0
	movs r1, #6
	bl DivRem
	str r0, [r7, #0xc]
	ldr r0, [r7]
	ldr r1, [r7, #4]
	adds r2, r1, #0
	lsls r1, r2, #1
	adds r0, #0x30
	adds r1, r0, r1
	ldrh r0, [r1]
	str r0, [r7, #8]
	ldr r0, [r7, #8]
	cmp r0, #0
	bne _080B2870
	b _080B28A8
_080B2870:
	ldr r0, [r7, #0xc]
	adds r1, r0, #0
	lsls r0, r1, #3
	ldr r1, _080B28A0 @ =0x0203EE48
	adds r0, r0, r1
	ldr r1, [r7, #8]
	ldr r3, [r7]
	ldr r2, [r3, #0x2c]
	ldr r3, [r7, #4]
	adds r4, r3, #0
	lsls r3, r4, #1
	movs r4, #0x1f
	ands r3, r4
	lsls r4, r3, #5
	adds r3, r4, #0
	lsls r4, r3, #1
	ldr r5, _080B28A4 @ =gBg2Tm + 0xe
	adds r3, r4, r5
	bl sub_80B2A9C
	ldr r0, [r7, #4]
	adds r1, r0, #1
	str r1, [r7, #4]
	b _080B283A
	.align 2, 0
_080B28A0: .4byte 0x0203EE48
_080B28A4: .4byte gBg2Tm + 0xe
_080B28A8:
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x5f
	ldrb r0, [r1]
	adds r1, r0, #0
	lsls r0, r1, #4
	adds r1, r0, #0
	adds r0, r1, #0
	subs r0, #0x48
	adds r1, r0, #0
	lsls r0, r1, #0x10
	lsrs r2, r0, #0x10
	movs r0, #2
	movs r1, #0
	bl SetBgOffset
	movs r0, #4
	bl EnableBgSync
	add sp, #0x10
	pop {r4, r5, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_80B28D8
sub_80B28D8: @ 0x080B28D8
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, [r7]
	ldr r1, [r0, #0x54]
	adds r0, r1, #0
	bl sub_80B15F0
	ldr r0, [r7]
	ldr r1, [r0, #0x54]
	adds r0, r1, #0
	bl sub_80B27D8
	ldr r0, [r7]
	bl Proc_Break
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_80B2904
sub_80B2904: @ 0x080B2904
	push {r7, lr}
	sub sp, #0x10
	mov r7, sp
	str r0, [r7]
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x60
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #1
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	ldr r1, _080B294C @ =gUnk_08DB0A94
	adds r0, r1, #0
	movs r1, #3
	bl Proc_Start
	str r0, [r7, #0xc]
	ldr r0, [r7, #0xc]
	ldr r1, [r7]
	str r1, [r0, #0x54]
	movs r0, #0
	bl SetTextFont
	bl InitSystemTextFont
	movs r0, #0
	str r0, [r7, #4]
_080B2944:
	ldr r0, [r7, #4]
	cmp r0, #4
	ble _080B2950
	b _080B2990
	.align 2, 0
_080B294C: .4byte gUnk_08DB0A94
_080B2950:
	ldr r1, [r7, #4]
	adds r0, r1, #0
	movs r1, #6
	bl DivRem
	str r0, [r7, #8]
	ldr r0, [r7, #8]
	adds r1, r0, #0
	lsls r0, r1, #3
	ldr r1, _080B2988 @ =0x0203EE48
	adds r0, r0, r1
	ldr r1, [r7, #4]
	adds r2, r1, #0
	lsls r1, r2, #1
	movs r2, #0x1f
	ands r1, r2
	lsls r2, r1, #5
	adds r1, r2, #0
	lsls r2, r1, #1
	ldr r3, _080B298C @ =gBg2Tm + 0xe
	adds r1, r2, r3
	bl PutBlankText
	ldr r0, [r7, #4]
	adds r1, r0, #1
	str r1, [r7, #4]
	b _080B2944
	.align 2, 0
_080B2988: .4byte 0x0203EE48
_080B298C: .4byte gBg2Tm + 0xe
_080B2990:
	ldr r2, _080B29A8 @ =0x0000FFB8
	movs r0, #2
	movs r1, #0
	bl SetBgOffset
	movs r0, #4
	bl EnableBgSync
	add sp, #0x10
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B29A8: .4byte 0x0000FFB8

	thumb_func_start sub_80B29AC
sub_80B29AC: @ 0x080B29AC
	push {r4, r5, r7, lr}
	sub sp, #0x10
	mov r7, sp
	str r0, [r7]
	movs r0, #0
	bl SetTextFont
	bl InitSystemTextFont
	movs r0, #0
	str r0, [r7, #4]
_080B29C2:
	ldr r0, [r7, #4]
	cmp r0, #4
	ble _080B29CA
	b _080B29F4
_080B29CA:
	ldr r1, [r7, #4]
	adds r0, r1, #0
	movs r1, #6
	bl DivRem
	str r0, [r7, #0xc]
	ldr r0, [r7, #0xc]
	adds r1, r0, #0
	lsls r0, r1, #3
	ldr r2, _080B29F0 @ =0x0203EE48
	adds r1, r0, r2
	adds r0, r1, #0
	bl ClearText
	ldr r0, [r7, #4]
	adds r1, r0, #1
	str r1, [r7, #4]
	b _080B29C2
	.align 2, 0
_080B29F0: .4byte 0x0203EE48
_080B29F4:
	movs r0, #0
	str r0, [r7, #4]
_080B29F8:
	ldr r0, [r7, #4]
	cmp r0, #4
	ble _080B2A00
	b _080B2A60
_080B2A00:
	ldr r1, [r7, #4]
	adds r0, r1, #0
	movs r1, #6
	bl DivRem
	str r0, [r7, #0xc]
	ldr r1, [r7]
	ldr r0, [r1, #0x2c]
	ldr r1, [r7, #4]
	adds r2, r1, #0
	lsls r1, r2, #1
	adds r0, #0x1e
	adds r1, r0, r1
	ldrh r0, [r1]
	str r0, [r7, #8]
	ldr r0, [r7, #8]
	cmp r0, #0
	bne _080B2A26
	b _080B2A60
_080B2A26:
	ldr r0, [r7, #0xc]
	adds r1, r0, #0
	lsls r0, r1, #3
	ldr r1, _080B2A58 @ =0x0203EE48
	adds r0, r0, r1
	ldr r1, [r7, #8]
	ldr r3, [r7]
	ldr r2, [r3, #0x2c]
	ldr r3, [r7, #4]
	adds r4, r3, #0
	lsls r3, r4, #1
	movs r4, #0x1f
	ands r3, r4
	lsls r4, r3, #5
	adds r3, r4, #0
	lsls r4, r3, #1
	ldr r5, _080B2A5C @ =gBg2Tm + 0xe
	adds r3, r4, r5
	bl sub_80B2AF8
	ldr r0, [r7, #4]
	adds r1, r0, #1
	str r1, [r7, #4]
	b _080B29F8
	.align 2, 0
_080B2A58: .4byte 0x0203EE48
_080B2A5C: .4byte gBg2Tm + 0xe
_080B2A60:
	movs r0, #4
	bl EnableBgSync
	add sp, #0x10
	pop {r4, r5, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_80B2A70
sub_80B2A70: @ 0x080B2A70
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, [r7]
	ldr r1, [r0, #0x54]
	adds r0, r1, #0
	bl sub_80B1A8C
	ldr r0, [r7]
	ldr r1, [r0, #0x54]
	adds r0, r1, #0
	bl sub_80B29AC
	ldr r0, [r7]
	bl Proc_Break
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_80B2A9C
sub_80B2A9C: @ 0x080B2A9C
	push {r4, r7, lr}
	sub sp, #0x14
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	str r2, [r7, #8]
	str r3, [r7, #0xc]
	ldr r0, [r7, #8]
	ldr r1, [r7, #4]
	bl sub_80B2B64
	lsls r1, r0, #0x10
	lsrs r0, r1, #0x10
	str r0, [r7, #0x10]
	ldr r4, [r7, #4]
	ldr r0, [r7, #8]
	ldr r1, [r7, #4]
	bl sub_8016F04
	lsls r1, r0, #0x18
	asrs r2, r1, #0x18
	ldr r3, [r7, #0xc]
	ldr r0, [r7]
	adds r1, r4, #0
	bl sub_80168EC
	ldr r0, [r7, #0xc]
	adds r4, r0, #0
	adds r4, #0x22
	bl GetGold
	ldr r1, [r7, #0x10]
	cmp r0, r1
	blt _080B2AE4
	movs r1, #2
	b _080B2AE6
_080B2AE4:
	movs r1, #1
_080B2AE6:
	ldr r2, [r7, #0x10]
	adds r0, r4, #0
	bl sub_8006068
	add sp, #0x14
	pop {r4, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_80B2AF8
sub_80B2AF8: @ 0x080B2AF8
	push {r4, r7, lr}
	sub sp, #0x10
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	str r2, [r7, #8]
	str r3, [r7, #0xc]
	ldr r4, [r7, #4]
	ldr r0, [r7, #8]
	ldr r1, [r7, #4]
	bl sub_8016F04
	lsls r1, r0, #0x18
	asrs r2, r1, #0x18
	ldr r3, [r7, #0xc]
	ldr r0, [r7]
	adds r1, r4, #0
	bl sub_80168EC
	ldr r1, [r7, #4]
	adds r0, r1, #0
	bl sub_80B2BDC
	lsls r1, r0, #0x18
	asrs r0, r1, #0x18
	cmp r0, #0
	beq _080B2B4A
	ldr r0, [r7, #0xc]
	adds r4, r0, #0
	adds r4, #0x22
	ldr r1, [r7, #4]
	adds r0, r1, #0
	bl sub_80B2BB4
	lsls r1, r0, #0x10
	lsrs r2, r1, #0x10
	adds r0, r4, #0
	movs r1, #2
	bl sub_8006068
	b _080B2B56
_080B2B4A:
	ldr r3, _080B2B60 @ =gUnk_0844BFA0
	ldr r0, [r7]
	movs r1, #0x5c
	movs r2, #2
	bl Text_InsertDrawString
_080B2B56:
	add sp, #0x10
	pop {r4, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B2B60: .4byte gUnk_0844BFA0

	thumb_func_start sub_80B2B64
sub_80B2B64: @ 0x080B2B64
	push {r7, lr}
	sub sp, #0xc
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	ldr r1, [r7, #4]
	adds r0, r1, #0
	bl sub_8017748
	str r0, [r7, #8]
	ldr r0, [r7]
	movs r1, #0x72
	bl UnitHasItem
	lsls r1, r0, #0x18
	asrs r0, r1, #0x18
	cmp r0, #0
	beq _080B2B9E
	ldr r0, [r7, #8]
	asrs r1, r0, #0x1f
	lsrs r2, r1, #0x1f
	adds r1, r0, r2
	asrs r0, r1, #1
	adds r1, r0, #0
	lsls r0, r1, #0x10
	lsrs r1, r0, #0x10
	adds r0, r1, #0
	b _080B2BAA
_080B2B9C:
	b _080B2BAA
_080B2B9E:
	ldr r1, [r7, #8]
	adds r0, r1, #0
	lsls r2, r0, #0x10
	lsrs r1, r2, #0x10
	adds r0, r1, #0
	b _080B2BAA
_080B2BAA:
	add sp, #0xc
	pop {r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_80B2BB4
sub_80B2BB4: @ 0x080B2BB4
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, [r7]
	bl sub_8017748
	asrs r1, r0, #0x1f
	lsrs r2, r1, #0x1f
	adds r1, r0, r2
	asrs r0, r1, #1
	adds r1, r0, #0
	lsls r0, r1, #0x10
	lsrs r1, r0, #0x10
	adds r0, r1, #0
	b _080B2BD4
_080B2BD4:
	add sp, #4
	pop {r7}
	pop {r1}
	bx r1

	thumb_func_start sub_80B2BDC
sub_80B2BDC: @ 0x080B2BDC
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, [r7]
	bl GetItemAttributes
	movs r1, #0x10
	ands r0, r1
	cmp r0, #0
	beq _080B2BF6
	movs r0, #0
	b _080B2C0C
_080B2BF6:
	ldr r0, [r7]
	bl sub_80B2BB4
	lsls r1, r0, #0x10
	lsrs r0, r1, #0x10
	cmp r0, #0
	bne _080B2C08
	movs r0, #0
	b _080B2C0C
_080B2C08:
	movs r0, #1
	b _080B2C0C
_080B2C0C:
	add sp, #4
	pop {r7}
	pop {r1}
	bx r1

	thumb_func_start sub_80B2C14
sub_80B2C14: @ 0x080B2C14
	push {r4, r5, r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x64
	movs r2, #0
	ldrsh r0, [r1, r2]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x66
	movs r3, #0
	ldrsh r1, [r2, r3]
	ldr r2, _080B2C48 @ =gUnk_08DB0AA4
	ldr r4, [r7]
	adds r3, r4, #0
	adds r4, #0x68
	movs r5, #0
	ldrsh r3, [r4, r5]
	bl PutOamHiRam
	add sp, #4
	pop {r4, r5, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B2C48: .4byte gUnk_08DB0AA4

	thumb_func_start sub_80B2C4C
sub_80B2C4C: @ 0x080B2C4C
	push {r7, lr}
	mov r7, sp
	ldr r0, _080B2D28 @ =gDispIo
	ldrb r1, [r0, #1]
	movs r2, #1
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0, #1]
	ldr r0, _080B2D28 @ =gDispIo
	ldrb r1, [r0, #1]
	movs r2, #2
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0, #1]
	ldr r0, _080B2D28 @ =gDispIo
	ldrb r1, [r0, #1]
	movs r2, #4
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0, #1]
	ldr r0, _080B2D28 @ =gDispIo
	ldrb r1, [r0, #1]
	movs r2, #8
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0, #1]
	ldr r0, _080B2D28 @ =gDispIo
	ldrb r1, [r0, #1]
	movs r2, #0x10
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0, #1]
	ldr r0, _080B2D28 @ =gDispIo
	ldrb r1, [r0, #1]
	movs r2, #0xdf
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0, #1]
	ldr r0, _080B2D28 @ =gDispIo
	ldrb r1, [r0, #1]
	movs r2, #0xbf
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0, #1]
	ldr r0, _080B2D28 @ =gDispIo
	ldrb r1, [r0, #1]
	movs r2, #0x7f
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0, #1]
	movs r0, #0
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	movs r0, #1
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	movs r0, #2
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	movs r0, #3
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	ldr r1, _080B2D2C @ =gBg0Tm
	adds r0, r1, #0
	movs r1, #0
	bl TmFill
	ldr r1, _080B2D30 @ =gBg1Tm
	adds r0, r1, #0
	movs r1, #0
	bl TmFill
	ldr r1, _080B2D34 @ =gBg2Tm
	adds r0, r1, #0
	movs r1, #0
	bl TmFill
	ldr r1, _080B2D38 @ =gBg3Tm
	adds r0, r1, #0
	movs r1, #0
	bl TmFill
	movs r0, #0xf
	bl EnableBgSync
	bl ResetText
	bl UnpackUiWindowFrameGraphics
	bl InitIcons
	movs r0, #4
	bl ApplyIconPalettes
	movs r1, #1
	rsbs r1, r1, #0
	movs r0, #0
	bl LoadHelpBoxGfx
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B2D28: .4byte gDispIo
_080B2D2C: .4byte gBg0Tm
_080B2D30: .4byte gBg1Tm
_080B2D34: .4byte gBg2Tm
_080B2D38: .4byte gBg3Tm

	thumb_func_start sub_80B2D3C
sub_80B2D3C: @ 0x080B2D3C
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	bl sub_80B2D50
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0

	thumb_func_start sub_80B2D50
sub_80B2D50: @ 0x080B2D50
	push {r7, lr}
	mov r7, sp
	bl sub_80B33F4
	lsls r1, r0, #0x18
	asrs r0, r1, #0x18
	cmp r0, #0
	beq _080B2D6E
	movs r2, #0xc9
	lsls r2, r2, #6
	movs r0, #0x78
	movs r1, #0x40
	movs r3, #1
	bl sub_80B2DD4
_080B2D6E:
	bl sub_80B3418
	lsls r1, r0, #0x18
	asrs r0, r1, #0x18
	cmp r0, #0
	beq _080B2D88
	movs r2, #0xc9
	lsls r2, r2, #6
	movs r0, #0x78
	movs r1, #0x98
	movs r3, #0
	bl sub_80B2DD4
_080B2D88:
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_80B2D90
sub_80B2D90: @ 0x080B2D90
	push {r7, lr}
	sub sp, #8
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	ldr r0, _080B2DC8 @ =gUnk_08427974
	ldr r1, [r7]
	lsls r2, r1, #0x16
	lsrs r1, r2, #0x16
	lsls r2, r1, #5
	ldr r3, _080B2DCC @ =0x06010000
	adds r1, r2, r3
	bl Decompress
	ldr r0, _080B2DD0 @ =gUnk_0841E45C
	ldr r2, [r7, #4]
	adds r1, r2, #0
	adds r1, #0x10
	adds r2, r1, #0
	lsls r1, r2, #5
	movs r2, #0x20
	bl ApplyPaletteExt
	add sp, #8
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B2DC8: .4byte gUnk_08427974
_080B2DCC: .4byte 0x06010000
_080B2DD0: .4byte gUnk_0841E45C

	thumb_func_start sub_80B2DD4
sub_80B2DD4: @ 0x080B2DD4
	push {r4, r7, lr}
	sub sp, #0x1c
	add r7, sp, #4
	str r0, [r7]
	str r1, [r7, #4]
	adds r0, r2, #0
	str r3, [r7, #0xc]
	adds r1, r7, #0
	adds r1, #8
	strh r0, [r1]
	bl GetGameTime
	adds r1, r0, #0
	adds r0, r1, #0
	movs r1, #0x28
	bl DivRem
	str r0, [r7, #0x10]
	ldr r1, [r7, #0x10]
	adds r0, r1, #0
	movs r1, #8
	bl Div
	adds r1, r0, #0
	lsls r0, r1, #1
	str r0, [r7, #0x10]
	ldr r0, [r7, #0xc]
	cmp r0, #0
	bne _080B2E16
	movs r0, #0x80
	lsls r0, r0, #6
	str r0, [r7, #0x14]
	b _080B2E1A
_080B2E16:
	movs r0, #0
	str r0, [r7, #0x14]
_080B2E1A:
	ldr r0, [r7]
	ldr r2, [r7, #0x14]
	adds r1, r0, #0
	orrs r1, r2
	ldr r2, [r7, #4]
	ldr r3, _080B2E40 @ =Sprite_16x8
	adds r0, r7, #0
	adds r0, #8
	ldrh r4, [r0]
	ldr r0, [r7, #0x10]
	adds r4, r4, r0
	str r4, [sp]
	movs r0, #2
	bl PutSpriteExt
	add sp, #0x1c
	pop {r4, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B2E40: .4byte Sprite_16x8

	thumb_func_start sub_80B2E44
sub_80B2E44: @ 0x080B2E44
	push {r7, lr}
	sub sp, #8
	mov r7, sp
	str r0, [r7]
	movs r0, #0xb9
	movs r1, #8
	bl sub_801525C
	ldr r0, _080B2EB8 @ =gActionSt
	ldrb r1, [r0, #0x11]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x14
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0, #0x11]
	bl GetGold
	str r0, [r7, #4]
	ldr r1, [r7]
	ldr r0, [r1, #0x2c]
	ldr r1, [r7]
	ldr r3, [r7]
	adds r2, r3, #0
	adds r3, #0x5c
	ldrb r2, [r3]
	adds r3, r2, #0
	lsls r2, r3, #1
	adds r1, #0x30
	adds r2, r1, r2
	ldrh r1, [r2]
	bl sub_80B2B64
	lsls r1, r0, #0x10
	lsrs r0, r1, #0x10
	ldr r1, [r7, #4]
	subs r0, r1, r0
	str r0, [r7, #4]
	ldr r1, [r7, #4]
	adds r0, r1, #0
	bl SetGold
	ldr r0, [r7]
	bl sub_80B1348
	ldr r0, [r7]
	bl sub_80B27D8
	ldr r1, _080B2EBC @ =gBg0Tm + 0x1b6
	adds r0, r1, #0
	bl sub_80B26DC
	add sp, #8
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B2EB8: .4byte gActionSt
_080B2EBC: .4byte gBg0Tm + 0x1b6

	thumb_func_start sub_80B2EC0
sub_80B2EC0: @ 0x080B2EC0
	push {r7, lr}
	sub sp, #0x10
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	adds r0, r2, #0
	adds r1, r7, #0
	adds r1, #8
	strb r0, [r1]
	ldr r0, [r7]
	cmp r0, #0
	bge _080B2EDC
	movs r0, #0
	str r0, [r7]
_080B2EDC:
	ldr r0, [r7]
	ldr r1, [r7, #4]
	cmp r0, r1
	blt _080B2EEA
	ldr r0, [r7, #4]
	subs r1, r0, #1
	str r1, [r7]
_080B2EEA:
	ldr r0, [r7]
	str r0, [r7, #0xc]
	ldr r1, _080B2F34 @ =gpKeySt
	ldr r0, [r1]
	ldrh r1, [r0, #6]
	movs r2, #0x40
	adds r0, r1, #0
	ands r0, r2
	adds r2, r0, #0
	lsls r1, r2, #0x10
	lsrs r0, r1, #0x10
	cmp r0, #0
	beq _080B2F40
	ldr r0, [r7]
	cmp r0, #0
	bne _080B2F38
	adds r0, r7, #0
	adds r0, #8
	movs r1, #0
	ldrsb r1, [r0, r1]
	cmp r1, #0
	beq _080B2F32
	ldr r1, _080B2F34 @ =gpKeySt
	ldr r0, [r1]
	ldrh r1, [r0, #8]
	movs r2, #0x40
	adds r0, r1, #0
	ands r0, r2
	adds r2, r0, #0
	lsls r1, r2, #0x10
	lsrs r0, r1, #0x10
	cmp r0, #0
	beq _080B2F32
	ldr r0, [r7, #4]
	subs r1, r0, #1
	str r1, [r7]
_080B2F32:
	b _080B2F3E
	.align 2, 0
_080B2F34: .4byte gpKeySt
_080B2F38:
	ldr r0, [r7]
	subs r1, r0, #1
	str r1, [r7]
_080B2F3E:
	b _080B2F92
_080B2F40:
	ldr r1, _080B2F88 @ =gpKeySt
	ldr r0, [r1]
	ldrh r1, [r0, #6]
	movs r2, #0x80
	adds r0, r1, #0
	ands r0, r2
	adds r2, r0, #0
	lsls r1, r2, #0x10
	lsrs r0, r1, #0x10
	cmp r0, #0
	beq _080B2F92
	ldr r1, [r7, #4]
	subs r0, r1, #1
	ldr r1, [r7]
	cmp r1, r0
	bne _080B2F8C
	adds r0, r7, #0
	adds r0, #8
	movs r1, #0
	ldrsb r1, [r0, r1]
	cmp r1, #0
	beq _080B2F86
	ldr r1, _080B2F88 @ =gpKeySt
	ldr r0, [r1]
	ldrh r1, [r0, #8]
	movs r2, #0x80
	adds r0, r1, #0
	ands r0, r2
	adds r2, r0, #0
	lsls r1, r2, #0x10
	lsrs r0, r1, #0x10
	cmp r0, #0
	beq _080B2F86
	movs r0, #0
	str r0, [r7]
_080B2F86:
	b _080B2F92
	.align 2, 0
_080B2F88: .4byte gpKeySt
_080B2F8C:
	ldr r0, [r7]
	adds r1, r0, #1
	str r1, [r7]
_080B2F92:
	ldr r0, [r7, #0xc]
	ldr r1, [r7]
	cmp r0, r1
	beq _080B2FB2
	ldr r1, _080B2FB8 @ =gPlaySt
	adds r0, r1, #0
	adds r1, #0x41
	ldrb r0, [r1]
	lsls r1, r0, #0x1e
	lsrs r0, r1, #0x1f
	cmp r0, #0
	bne _080B2FB2
	ldr r1, _080B2FBC @ =0x00000386
	adds r0, r1, #0
	bl m4aSongNumStart
_080B2FB2:
	ldr r1, [r7]
	adds r0, r1, #0
	b _080B2FC0
	.align 2, 0
_080B2FB8: .4byte gPlaySt
_080B2FBC: .4byte 0x00000386
_080B2FC0:
	add sp, #0x10
	pop {r7}
	pop {r1}
	bx r1

	thumb_func_start sub_80B2FC8
sub_80B2FC8: @ 0x080B2FC8
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, _080B2FE0 @ =0x0203EE94
	ldr r1, [r7]
	str r1, [r0]
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B2FE0: .4byte 0x0203EE94

	thumb_func_start sub_80B2FE4
sub_80B2FE4: @ 0x080B2FE4
	push {r7, lr}
	sub sp, #0x14
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	str r2, [r7, #8]
	str r3, [r7, #0xc]
	ldr r0, _080B300C @ =0x0203EE94
	ldr r1, [r0]
	str r1, [r7, #0x10]
	ldr r0, _080B300C @ =0x0203EE94
	ldr r1, [r7]
	str r1, [r0]
	ldr r0, [r7]
	ldr r1, [r7, #0x10]
	cmp r0, r1
	bne _080B3010
	movs r0, #0
	b _080B3066
	.align 2, 0
_080B300C: .4byte 0x0203EE94
_080B3010:
	ldr r0, [r7, #8]
	ldr r1, [r7, #4]
	cmp r0, r1
	ble _080B301C
	movs r0, #0
	b _080B3066
_080B301C:
	ldr r0, [r7]
	ldr r1, [r7, #0x10]
	cmp r0, r1
	bge _080B3040
	ldr r0, [r7, #0xc]
	cmp r0, #0
	bne _080B302E
	movs r0, #0
	b _080B3066
_080B302E:
	ldr r0, [r7]
	ldr r1, [r7, #0xc]
	subs r0, r0, r1
	cmp r0, #0
	bgt _080B303E
	movs r0, #1
	rsbs r0, r0, #0
	b _080B3066
_080B303E:
	b _080B3062
_080B3040:
	ldr r0, [r7, #8]
	ldr r1, [r7, #0xc]
	adds r0, r0, r1
	ldr r1, [r7, #4]
	cmp r0, r1
	bne _080B3050
	movs r0, #0
	b _080B3066
_080B3050:
	ldr r0, [r7]
	ldr r1, [r7, #0xc]
	subs r0, r0, r1
	ldr r2, [r7, #8]
	subs r1, r2, #1
	cmp r0, r1
	blt _080B3062
	movs r0, #1
	b _080B3066
_080B3062:
	movs r0, #0
	b _080B3066
_080B3066:
	add sp, #0x14
	pop {r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_80B3070
sub_80B3070: @ 0x080B3070
	push {r7, lr}
	sub sp, #0xc
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	str r2, [r7, #8]
	ldr r0, [r7]
	ldr r1, [r7, #4]
	subs r0, r0, r1
	cmp r0, #0
	blt _080B3094
	ldr r0, [r7]
	ldr r1, [r7, #4]
	subs r0, r0, r1
	ldr r1, [r7, #8]
	cmp r0, r1
	blt _080B30A2
	b _080B30A8
_080B3094:
	ldr r0, [r7, #4]
	ldr r1, [r7]
	subs r0, r0, r1
	ldr r1, [r7, #8]
	cmp r0, r1
	blt _080B30A2
	b _080B30A8
_080B30A2:
	ldr r1, [r7, #4]
	adds r0, r1, #0
	b _080B30D6
_080B30A8:
	ldr r0, [r7, #4]
	ldr r1, [r7]
	subs r0, r0, r1
	cmp r0, #0
	bgt _080B30C8
	ldr r0, [r7]
	ldr r1, [r7, #4]
	ldr r2, [r7]
	subs r1, r1, r2
	cmp r1, #0
	bge _080B30C6
	ldr r1, [r7, #8]
	adds r2, r1, #0
	rsbs r1, r2, #0
	adds r0, r0, r1
_080B30C6:
	b _080B30CE
_080B30C8:
	ldr r1, [r7]
	ldr r2, [r7, #8]
	adds r0, r1, r2
_080B30CE:
	str r0, [r7]
	ldr r1, [r7]
	adds r0, r1, #0
	b _080B30D6
_080B30D6:
	add sp, #0xc
	pop {r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_80B30E0
sub_80B30E0: @ 0x080B30E0
	push {r4, r5, r7, lr}
	sub sp, #8
	mov r7, sp
	adds r5, r0, #0
	adds r4, r1, #0
	adds r1, r2, #0
	adds r0, r3, #0
	adds r2, r7, #0
	adds r3, r5, #0
	strh r3, [r2]
	adds r2, r7, #2
	adds r3, r4, #0
	strh r3, [r2]
	adds r2, r7, #4
	strh r1, [r2]
	adds r1, r7, #6
	strh r0, [r1]
	adds r0, r7, #0
	ldrh r1, [r0]
	adds r0, r1, #0
	bl sub_80B2FC8
	ldr r1, _080B31D8 @ =gUnk_08DB0AF4
	ldr r0, [r1]
	adds r1, r7, #0
	ldrh r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	ldrh r1, [r1]
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0]
	ldr r1, _080B31D8 @ =gUnk_08DB0AF4
	ldr r0, [r1]
	adds r1, r7, #2
	ldrh r2, [r0, #2]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	ldrh r1, [r1]
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0, #2]
	ldr r1, _080B31D8 @ =gUnk_08DB0AF4
	ldr r0, [r1]
	adds r1, r7, #4
	ldrh r2, [r0, #4]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	ldrh r1, [r1]
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0, #4]
	ldr r1, _080B31D8 @ =gUnk_08DB0AF4
	ldr r0, [r1]
	adds r1, r7, #6
	ldrh r2, [r0, #6]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	ldrh r1, [r1]
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0, #6]
	ldr r1, _080B31D8 @ =gUnk_08DB0AF4
	ldr r0, [r1]
	ldrh r1, [r0, #8]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x10
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strh r2, [r0, #8]
	ldr r1, _080B31D8 @ =gUnk_08DB0AF4
	ldr r0, [r1]
	ldrh r1, [r0, #0xa]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #4
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strh r2, [r0, #0xa]
	ldr r1, _080B31D8 @ =gUnk_08DB0AF4
	ldr r0, [r1]
	ldr r1, [r7, #0x1c]
	str r1, [r0, #0x14]
	ldr r1, _080B31D8 @ =gUnk_08DB0AF4
	ldr r0, [r1]
	ldr r1, [r7, #0x20]
	str r1, [r0, #0x18]
	ldr r1, _080B31D8 @ =gUnk_08DB0AF4
	ldr r0, [r1]
	ldr r1, [r7, #0x18]
	rsbs r2, r1, #0
	str r2, [r0, #0x10]
	ldr r1, _080B31D8 @ =gUnk_08DB0AF4
	ldr r0, [r1]
	adds r1, r7, #6
	ldrh r2, [r1]
	adds r3, r2, #0
	lsls r1, r3, #4
	ldrh r2, [r0, #0xc]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0, #0xc]
	add sp, #8
	pop {r4, r5, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B31D8: .4byte gUnk_08DB0AF4

	thumb_func_start sub_80B31DC
sub_80B31DC: @ 0x080B31DC
	push {r4, r7, lr}
	mov r7, sp
	ldr r0, _080B3238 @ =gUnk_08DB0AF4
	ldr r1, [r0]
	ldrh r0, [r1]
	ldr r2, _080B3238 @ =gUnk_08DB0AF4
	ldr r1, [r2]
	ldrh r2, [r1, #2]
	adds r1, r2, #0
	movs r2, #0
	bl sub_80B2EC0
	adds r1, r0, #0
	ldr r2, _080B3238 @ =gUnk_08DB0AF4
	ldr r0, [r2]
	ldrh r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0]
	ldr r0, _080B3238 @ =gUnk_08DB0AF4
	ldr r1, [r0]
	ldrh r0, [r1]
	ldr r1, _080B3238 @ =gUnk_08DB0AF4
	ldr r2, [r1]
	ldrh r1, [r2, #2]
	ldr r2, _080B3238 @ =gUnk_08DB0AF4
	ldr r3, [r2]
	ldrh r2, [r3, #4]
	ldr r3, _080B3238 @ =gUnk_08DB0AF4
	ldr r4, [r3]
	ldrh r3, [r4, #6]
	bl sub_80B2FE4
	cmp r0, #0
	beq _080B3242
	cmp r0, #0
	bgt _080B323C
	movs r1, #1
	cmn r0, r1
	beq _080B3290
	b _080B3242
	.align 2, 0
_080B3238: .4byte gUnk_08DB0AF4
_080B323C:
	cmp r0, #1
	beq _080B3244
	b _080B3242
_080B3242:
	b _080B32D0
_080B3244:
	ldr r1, _080B328C @ =gUnk_08DB0AF4
	ldr r0, [r1]
	ldr r1, _080B328C @ =gUnk_08DB0AF4
	ldr r0, [r1]
	ldr r2, _080B328C @ =gUnk_08DB0AF4
	ldr r1, [r2]
	ldrh r2, [r1, #6]
	adds r1, r2, #1
	ldrh r2, [r0, #6]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0, #6]
	ldr r1, _080B328C @ =gUnk_08DB0AF4
	ldr r0, [r1]
	ldr r1, _080B328C @ =gUnk_08DB0AF4
	ldr r2, [r1]
	ldr r1, [r2, #0x18]
	ldr r2, _080B328C @ =gUnk_08DB0AF4
	ldr r3, [r2]
	ldrh r2, [r3, #6]
	ldr r4, _080B328C @ =gUnk_08DB0AF4
	ldr r3, [r4]
	ldrh r4, [r3, #4]
	adds r3, r2, r4
	subs r2, r3, #1
	ldr r3, [r0, #0x14]
	adds r0, r1, #0
	adds r1, r2, #0
	bl _call_via_r3
	b _080B32D0
	.align 2, 0
_080B328C: .4byte gUnk_08DB0AF4
_080B3290:
	ldr r1, _080B32CC @ =gUnk_08DB0AF4
	ldr r0, [r1]
	ldr r1, _080B32CC @ =gUnk_08DB0AF4
	ldr r0, [r1]
	ldr r2, _080B32CC @ =gUnk_08DB0AF4
	ldr r1, [r2]
	ldrh r2, [r1, #6]
	subs r1, r2, #1
	ldrh r2, [r0, #6]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0, #6]
	ldr r1, _080B32CC @ =gUnk_08DB0AF4
	ldr r0, [r1]
	ldr r1, _080B32CC @ =gUnk_08DB0AF4
	ldr r2, [r1]
	ldr r1, [r2, #0x18]
	ldr r2, _080B32CC @ =gUnk_08DB0AF4
	ldr r3, [r2]
	ldrh r2, [r3, #6]
	ldr r3, [r0, #0x14]
	adds r0, r1, #0
	adds r1, r2, #0
	bl _call_via_r3
	b _080B32D0
	.align 2, 0
_080B32CC: .4byte gUnk_08DB0AF4
_080B32D0:
	ldr r0, _080B330C @ =gUnk_08DB0AF4
	ldr r1, [r0]
	ldrh r0, [r1, #0xc]
	ldr r1, _080B330C @ =gUnk_08DB0AF4
	ldr r2, [r1]
	ldrh r1, [r2, #6]
	ldr r3, _080B330C @ =gUnk_08DB0AF4
	ldr r2, [r3]
	ldrh r3, [r2, #8]
	muls r1, r3, r1
	ldr r2, _080B330C @ =gUnk_08DB0AF4
	ldr r3, [r2]
	ldrh r2, [r3, #0xa]
	bl sub_80B3070
	adds r1, r0, #0
	ldr r2, _080B330C @ =gUnk_08DB0AF4
	ldr r0, [r2]
	ldrh r2, [r0, #0xc]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0, #0xc]
	pop {r4, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B330C: .4byte gUnk_08DB0AF4

	thumb_func_start sub_80B3310
sub_80B3310: @ 0x080B3310
	push {r7, lr}
	mov r7, sp
	ldr r1, _080B3320 @ =gUnk_08DB0AF4
	ldr r0, [r1]
	ldrh r1, [r0]
	adds r0, r1, #0
	b _080B3324
	.align 2, 0
_080B3320: .4byte gUnk_08DB0AF4
_080B3324:
	pop {r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_80B332C
sub_80B332C: @ 0x080B332C
	push {r7, lr}
	mov r7, sp
	ldr r1, _080B3344 @ =gUnk_08DB0AF4
	ldr r0, [r1]
	ldr r2, _080B3344 @ =gUnk_08DB0AF4
	ldr r1, [r2]
	ldrh r2, [r1, #0xc]
	ldr r0, [r0, #0x10]
	adds r1, r2, r0
	adds r0, r1, #0
	b _080B3348
	.align 2, 0
_080B3344: .4byte gUnk_08DB0AF4
_080B3348:
	pop {r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_80B3350
sub_80B3350: @ 0x080B3350
	push {r7, lr}
	mov r7, sp
	ldr r1, _080B3360 @ =gUnk_08DB0AF4
	ldr r0, [r1]
	ldrh r1, [r0, #6]
	adds r0, r1, #0
	b _080B3364
	.align 2, 0
_080B3360: .4byte gUnk_08DB0AF4
_080B3364:
	pop {r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_80B336C
sub_80B336C: @ 0x080B336C
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r1, _080B3394 @ =gUnk_08DB0AF4
	ldr r0, [r1]
	ldr r2, [r7]
	adds r1, r2, #0
	ldrh r2, [r0, #8]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strh r2, [r0, #8]
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B3394: .4byte gUnk_08DB0AF4

	thumb_func_start sub_80B3398
sub_80B3398: @ 0x080B3398
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r1, _080B33C0 @ =gUnk_08DB0AF4
	ldr r0, [r1]
	ldr r2, [r7]
	adds r1, r2, #0
	ldrh r2, [r0, #0xa]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strh r2, [r0, #0xa]
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B33C0: .4byte gUnk_08DB0AF4

	thumb_func_start sub_80B33C4
sub_80B33C4: @ 0x080B33C4
	push {r7, lr}
	mov r7, sp
	ldr r0, _080B33E4 @ =gUnk_08DB0AF4
	ldr r1, [r0]
	ldrh r0, [r1, #0xc]
	ldr r1, _080B33E4 @ =gUnk_08DB0AF4
	ldr r2, [r1]
	ldrh r1, [r2, #6]
	ldr r3, _080B33E4 @ =gUnk_08DB0AF4
	ldr r2, [r3]
	ldrh r3, [r2, #8]
	muls r1, r3, r1
	cmp r0, r1
	beq _080B33E8
	movs r0, #1
	b _080B33EC
	.align 2, 0
_080B33E4: .4byte gUnk_08DB0AF4
_080B33E8:
	movs r0, #0
	b _080B33EC
_080B33EC:
	pop {r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_80B33F4
sub_80B33F4: @ 0x080B33F4
	push {r7, lr}
	mov r7, sp
	ldr r1, _080B3408 @ =gUnk_08DB0AF4
	ldr r0, [r1]
	ldrh r1, [r0, #6]
	cmp r1, #0
	beq _080B340C
	movs r0, #1
	b _080B3410
	.align 2, 0
_080B3408: .4byte gUnk_08DB0AF4
_080B340C:
	movs r0, #0
	b _080B3410
_080B3410:
	pop {r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_80B3418
sub_80B3418: @ 0x080B3418
	push {r7, lr}
	mov r7, sp
	ldr r0, _080B3438 @ =gUnk_08DB0AF4
	ldr r1, [r0]
	ldrh r0, [r1, #6]
	ldr r2, _080B3438 @ =gUnk_08DB0AF4
	ldr r1, [r2]
	ldrh r2, [r1, #4]
	adds r0, r0, r2
	ldr r2, _080B3438 @ =gUnk_08DB0AF4
	ldr r1, [r2]
	ldrh r2, [r1, #2]
	cmp r0, r2
	bge _080B343C
	movs r0, #1
	b _080B3440
	.align 2, 0
_080B3438: .4byte gUnk_08DB0AF4
_080B343C:
	movs r0, #0
	b _080B3440
_080B3440:
	pop {r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_80B3448
sub_80B3448: @ 0x080B3448
	push {r7, lr}
	sub sp, #8
	mov r7, sp
	str r0, [r7]
	ldr r0, _080B3488 @ =gUnk_086EA858
	ldr r2, _080B348C @ =gUnk_086EA8D0
	adds r1, r2, #0
	movs r1, #0x8f
	lsls r1, r1, #2
	adds r2, r2, r1
	ldrh r1, [r2]
	adds r3, r1, #0
	lsls r2, r3, #1
	adds r2, r2, r1
	lsls r1, r2, #2
	adds r0, r0, r1
	ldr r1, [r0]
	str r1, [r7, #4]
	ldr r0, [r7, #4]
	ldr r1, [r0, #4]
	lsls r2, r1, #0x10
	lsrs r0, r2, #0x10
	cmp r0, #0
	bne _080B3492
	ldr r0, [r7, #4]
	ldr r1, [r0, #4]
	lsrs r2, r1, #0x1f
	lsls r0, r2, #0x1f
	cmp r0, #0
	bne _080B3492
	movs r0, #0
	b _080B3496
	.align 2, 0
_080B3488: .4byte gUnk_086EA858
_080B348C: .4byte gUnk_086EA8D0
_080B3490:
	b _080B3496
_080B3492:
	movs r0, #1
	b _080B3496
_080B3496:
	add sp, #8
	pop {r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_80B34A0
sub_80B34A0: @ 0x080B34A0
	push {r7, lr}
	mov r7, sp
	ldr r0, _080B34C0 @ =gActiveUnit
	ldr r1, [r0]
	adds r0, r1, #0
	bl sub_802EF4C
	ldr r1, _080B34C4 @ =gUnk_08DB0AF8
	adds r0, r1, #0
	movs r1, #3
	bl Proc_Start
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B34C0: .4byte gActiveUnit
_080B34C4: .4byte gUnk_08DB0AF8

	thumb_func_start sub_80B34C8
sub_80B34C8: @ 0x080B34C8
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	ldr r1, _080B34E4 @ =gUnk_08DB0C58
	adds r0, r1, #0
	movs r1, #3
	bl Proc_Start
	str r0, [r7]
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B34E4: .4byte gUnk_08DB0C58

	thumb_func_start sub_80B34E8
sub_80B34E8: @ 0x080B34E8
	push {r4, r7, lr}
	sub sp, #8
	add r7, sp, #4
	str r0, [r7]
	ldr r0, _080B383C @ =gUnk_08D64F4C
	ldr r1, _080B3840 @ =sub_806E2A0
	bl Proc_ForEach
	bl sub_80B2C4C
	ldr r0, _080B3844 @ =gDispIo
	ldrb r1, [r0, #0xc]
	movs r2, #0xfc
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0, #0xc]
	ldr r0, _080B3844 @ =gDispIo
	ldrb r1, [r0, #0x10]
	movs r2, #0xfc
	ands r1, r2
	adds r2, r1, #0
	movs r3, #2
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0, #0x10]
	ldr r0, _080B3844 @ =gDispIo
	ldrb r1, [r0, #0x14]
	movs r2, #0xfc
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0, #0x14]
	ldr r0, _080B3844 @ =gDispIo
	ldrb r1, [r0, #0x18]
	movs r2, #3
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0, #0x18]
	movs r1, #0x80
	lsls r1, r1, #2
	adds r0, r1, #0
	movs r1, #2
	movs r2, #0
	bl InitTalk
	bl InitFaces
	movs r0, #1
	str r0, [sp]
	movs r0, #0xe2
	movs r1, #0x20
	movs r2, #8
	movs r3, #3
	bl sub_8008DA8
	ldr r0, _080B3848 @ =gUnk_083FAD4C
	ldr r1, _080B384C @ =gBuf
	bl Decompress
	ldr r0, _080B3850 @ =gBg1Tm
	ldr r1, _080B384C @ =gBuf
	movs r2, #0x80
	lsls r2, r2, #5
	bl TmApplyTsa_thm
	ldr r1, _080B3854 @ =gBg1Tm + 0x200
	adds r0, r1, #0
	movs r1, #0x1e
	movs r2, #0xc
	movs r3, #0
	bl TmFillRect_thm
	movs r0, #2
	bl EnableBgSync
	ldr r0, [r7]
	bl sub_80B25C8
	ldr r0, _080B3844 @ =gDispIo
	ldrb r1, [r0, #1]
	movs r2, #0x20
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0, #1]
	ldr r0, _080B3844 @ =gDispIo
	ldrb r1, [r0, #1]
	movs r2, #0x40
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0, #1]
	ldr r0, _080B3844 @ =gDispIo
	ldrb r1, [r0, #1]
	movs r2, #0x7f
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0, #1]
	ldr r0, _080B3844 @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x34
	ldrb r1, [r0]
	movs r2, #1
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _080B3844 @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x34
	ldrb r1, [r0]
	movs r2, #2
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _080B3844 @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x34
	ldrb r1, [r0]
	movs r2, #4
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _080B3844 @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x34
	ldrb r1, [r0]
	movs r2, #8
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _080B3844 @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x34
	ldrb r1, [r0]
	movs r2, #0x10
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _080B3844 @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x35
	ldrb r1, [r0]
	movs r2, #1
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _080B3844 @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x35
	ldrb r1, [r0]
	movs r2, #2
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _080B3844 @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x35
	ldrb r1, [r0]
	movs r2, #0xfb
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _080B3844 @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x35
	ldrb r1, [r0]
	movs r2, #8
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _080B3844 @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x35
	ldrb r1, [r0]
	movs r2, #0x10
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _080B3844 @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x36
	ldrb r1, [r0]
	movs r2, #1
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _080B3844 @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x36
	ldrb r1, [r0]
	movs r2, #2
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _080B3844 @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x36
	ldrb r1, [r0]
	movs r2, #0xfb
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _080B3844 @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x36
	ldrb r1, [r0]
	movs r2, #8
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _080B3844 @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x36
	ldrb r1, [r0]
	movs r2, #0x10
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _080B3844 @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x2d
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x58
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _080B3844 @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x31
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x48
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _080B3844 @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x2c
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0xf0
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _080B3844 @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x30
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x98
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _080B3844 @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x2f
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _080B3844 @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x33
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #8
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _080B3844 @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x2e
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0xf0
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _080B3844 @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x32
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x38
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _080B3844 @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x34
	ldrb r1, [r0]
	movs r2, #0xdf
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _080B3844 @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x35
	ldrb r1, [r0]
	movs r2, #0x20
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _080B3844 @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x36
	ldrb r1, [r0]
	movs r2, #0xdf
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _080B3844 @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x3c
	ldrb r1, [r0]
	movs r2, #0xc0
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _080B3844 @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x44
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _080B3844 @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x45
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _080B3844 @ =gDispIo
	adds r1, r0, #0
	adds r0, #0x46
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #8
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _080B3858 @ =0x030027CC
	ldr r1, _080B3858 @ =0x030027CC
	ldrh r2, [r1]
	ldr r3, _080B385C @ =0x0000FFE0
	adds r1, r2, #0
	ands r1, r3
	adds r2, r1, #0
	strh r2, [r0]
	ldr r0, _080B3858 @ =0x030027CC
	ldr r1, _080B3858 @ =0x030027CC
	ldrh r2, [r1]
	movs r3, #8
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strh r2, [r0]
	ldr r0, _080B3858 @ =0x030027CC
	ldr r1, _080B3858 @ =0x030027CC
	ldrh r2, [r1]
	ldr r3, _080B3860 @ =0x0000E0FF
	adds r1, r2, #0
	ands r1, r3
	adds r2, r1, #0
	strh r2, [r0]
	ldr r0, _080B3858 @ =0x030027CC
	ldr r1, _080B3858 @ =0x030027CC
	ldrh r2, [r1]
	strh r2, [r0]
	ldr r4, _080B3864 @ =gUnk_083F64B8
	movs r0, #3
	bl GetBgChrOffset
	movs r2, #0xc0
	lsls r2, r2, #0x13
	adds r1, r0, r2
	adds r0, r4, #0
	bl Decompress
	ldr r0, _080B3868 @ =gBg3Tm
	ldr r1, _080B386C @ =gUnk_083F9094
	movs r2, #0xc0
	lsls r2, r2, #8
	bl TmApplyTsa_thm
	ldr r0, _080B3870 @ =gUnk_083F9548
	movs r1, #0xc0
	lsls r1, r1, #1
	movs r2, #0x80
	bl ApplyPaletteExt
	movs r0, #8
	bl EnableBgSync
	add sp, #8
	pop {r4, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B383C: .4byte gUnk_08D64F4C
_080B3840: .4byte sub_806E2A0
_080B3844: .4byte gDispIo
_080B3848: .4byte gUnk_083FAD4C
_080B384C: .4byte gBuf
_080B3850: .4byte gBg1Tm
_080B3854: .4byte gBg1Tm + 0x200
_080B3858: .4byte 0x030027CC
_080B385C: .4byte 0x0000FFE0
_080B3860: .4byte 0x0000E0FF
_080B3864: .4byte gUnk_083F64B8
_080B3868: .4byte gBg3Tm
_080B386C: .4byte gUnk_083F9094
_080B3870: .4byte gUnk_083F9548

	thumb_func_start sub_80B3874
sub_80B3874: @ 0x080B3874
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, _080B38A0 @ =gArenaSt
	ldr r1, [r0]
	ldr r2, _080B38A4 @ =gBattleActor
	adds r0, r1, #0
	adds r1, r2, #0
	bl UpdateUnitFromBattle
	ldr r0, _080B38A8 @ =gActiveUnit
	ldr r1, [r0]
	adds r0, r1, #0
	bl StartMu
	bl sub_806C7CC
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B38A0: .4byte gArenaSt
_080B38A4: .4byte gBattleActor
_080B38A8: .4byte gActiveUnit

	thumb_func_start sub_80B38AC
sub_80B38AC: @ 0x080B38AC
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, _080B38D0 @ =gArenaSt
	ldr r1, [r0]
	ldr r2, [r1, #0xc]
	lsrs r0, r2, #0x11
	movs r1, #7
	ands r0, r1
	cmp r0, #4
	bhi _080B38D4
	movs r0, #0x3f
	ldr r1, [r7]
	bl sub_80B3BD0
	b _080B38DC
	.align 2, 0
_080B38D0: .4byte gArenaSt
_080B38D4:
	movs r0, #0x40
	ldr r1, [r7]
	bl sub_80B3BD0
_080B38DC:
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0

	thumb_func_start sub_80B38E4
sub_80B38E4: @ 0x080B38E4
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	bl sub_802F5A0
	adds r1, r0, #0
	adds r0, r1, #0
	bl sub_8009E78
	movs r0, #0x41
	ldr r1, [r7]
	bl sub_80B3BD0
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0

	thumb_func_start sub_80B3908
sub_80B3908: @ 0x080B3908
	push {r4, r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	bl sub_8009E60
	cmp r0, #1
	beq _080B393A
	cmp r0, #1
	bgt _080B3922
	cmp r0, #0
	beq _080B3928
	b _080B3928
_080B3922:
	cmp r0, #2
	beq _080B3928
	b _080B3928
_080B3928:
	movs r0, #0x43
	ldr r1, [r7]
	bl sub_80B3BD0
	ldr r0, [r7]
	movs r1, #2
	bl Proc_Goto
	b _080B395E
_080B393A:
	bl sub_802F5A0
	adds r4, r0, #0
	bl GetGold
	cmp r4, r0
	bgt _080B394C
	b _080B395E
_080B394A:
	b _080B395C
_080B394C:
	movs r0, #0x49
	ldr r1, [r7]
	bl sub_80B3BD0
	ldr r0, [r7]
	movs r1, #2
	bl Proc_Goto
_080B395C:
	b _080B395E
_080B395E:
	add sp, #4
	pop {r4, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_80B3968
sub_80B3968: @ 0x080B3968
	push {r7, lr}
	sub sp, #8
	mov r7, sp
	str r0, [r7]
	bl GetGold
	str r0, [r7, #4]
	bl sub_802F5A0
	ldr r1, [r7, #4]
	subs r0, r1, r0
	str r0, [r7, #4]
	ldr r1, [r7, #4]
	adds r0, r1, #0
	bl SetGold
	ldr r1, _080B39B4 @ =gPlaySt
	adds r0, r1, #0
	adds r1, #0x41
	ldrb r0, [r1]
	lsls r1, r0, #0x1e
	lsrs r0, r1, #0x1f
	cmp r0, #0
	bne _080B399E
	movs r0, #0xb9
	bl m4aSongNumStart
_080B399E:
	ldr r1, _080B39B8 @ =gBg0Tm + 0x1b6
	adds r0, r1, #0
	bl sub_80B26DC
	ldr r0, [r7]
	bl sub_80B3C1C
	add sp, #8
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B39B4: .4byte gPlaySt
_080B39B8: .4byte gBg0Tm + 0x1b6

	thumb_func_start sub_80B39BC
sub_80B39BC: @ 0x080B39BC
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	movs r0, #0x44
	ldr r1, [r7]
	bl sub_80B3BD0
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0

	thumb_func_start sub_80B39D4
sub_80B39D4: @ 0x080B39D4
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	movs r0, #0x42
	ldr r1, [r7]
	bl sub_80B3BD0
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0

	thumb_func_start sub_80B39EC
sub_80B39EC: @ 0x080B39EC
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	movs r1, #1
	rsbs r1, r1, #0
	adds r0, r1, #0
	bl FadeBgmOut
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_80B3A08
sub_80B3A08: @ 0x080B3A08
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, [r7]
	movs r1, #7
	bl sub_800463C
	bl sub_800EC08
	ldr r1, _080B3A78 @ =gUnk_08DB0ADC
	adds r0, r1, #0
	bl Proc_EndEach
	ldr r0, _080B3A7C @ =gActionSt
	ldrb r1, [r0, #0x11]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x16
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0, #0x11]
	ldr r1, _080B3A80 @ =gActiveUnit
	ldr r0, [r1]
	ldr r2, _080B3A80 @ =gActiveUnit
	ldr r1, [r2]
	ldr r2, [r1, #0xc]
	movs r1, #0x40
	orrs r2, r1
	str r2, [r0, #0xc]
	ldr r0, _080B3A80 @ =gActiveUnit
	ldr r1, [r0]
	adds r0, r1, #0
	bl PidStatsAddBattleAmt
	bl MU_EndAll
	ldr r0, _080B3A7C @ =gActionSt
	ldrb r1, [r0, #0x15]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0, #0x15]
	ldr r0, _080B3A80 @ =gActiveUnit
	ldr r1, [r0]
	adds r0, r1, #0
	bl BattleGenerateArena
	bl BeginBattleAnimations
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B3A78: .4byte gUnk_08DB0ADC
_080B3A7C: .4byte gActionSt
_080B3A80: .4byte gActiveUnit

	thumb_func_start sub_80B3A84
sub_80B3A84: @ 0x080B3A84
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, [r7]
	bl sub_8015020
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_80B3A9C
sub_80B3A9C: @ 0x080B3A9C
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, [r7]
	bl sub_80B34E8
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_80B3AB4
sub_80B3AB4: @ 0x080B3AB4
	push {r7, lr}
	sub sp, #8
	mov r7, sp
	str r0, [r7]
	bl GetGold
	str r0, [r7, #4]
	bl sub_802F5AC
	cmp r0, #2
	beq _080B3B0C
	cmp r0, #2
	bgt _080B3AD4
	cmp r0, #1
	beq _080B3ADE
	b _080B3B3C
_080B3AD4:
	cmp r0, #3
	beq _080B3B16
	cmp r0, #4
	beq _080B3B32
	b _080B3B3C
_080B3ADE:
	bl sub_802F5A0
	adds r1, r0, #0
	lsls r2, r1, #1
	adds r0, r2, #0
	bl sub_8009E78
	movs r0, #0x45
	ldr r1, [r7]
	bl sub_80B3BD0
	bl sub_802F5A0
	adds r1, r0, #0
	lsls r0, r1, #1
	ldr r1, [r7, #4]
	adds r0, r1, r0
	str r0, [r7, #4]
	ldr r1, [r7, #4]
	adds r0, r1, #0
	bl SetGold
	b _080B3B3C
_080B3B0C:
	movs r0, #0x46
	ldr r1, [r7]
	bl sub_80B3BD0
	b _080B3B3C
_080B3B16:
	movs r0, #0x48
	ldr r1, [r7]
	bl sub_80B3BD0
	bl sub_802F5A0
	ldr r1, [r7, #4]
	adds r0, r1, r0
	str r0, [r7, #4]
	ldr r1, [r7, #4]
	adds r0, r1, #0
	bl SetGold
	b _080B3B3C
_080B3B32:
	movs r0, #0x47
	ldr r1, [r7]
	bl sub_80B3BD0
	b _080B3B3C
_080B3B3C:
	add sp, #8
	pop {r7}
	pop {r0}
	bx r0

	thumb_func_start sub_80B3B44
sub_80B3B44: @ 0x080B3B44
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	bl sub_802F5AC
	cmp r0, #2
	beq _080B3B98
	cmp r0, #2
	bgt _080B3B5E
	cmp r0, #1
	beq _080B3B68
	b _080B3B9C
_080B3B5E:
	cmp r0, #3
	beq _080B3B68
	cmp r0, #4
	beq _080B3B9A
	b _080B3B9C
_080B3B68:
	ldr r1, _080B3B90 @ =gBg0Tm + 0x1b6
	adds r0, r1, #0
	bl sub_80B26DC
	ldr r1, _080B3B94 @ =gPlaySt
	adds r0, r1, #0
	adds r1, #0x41
	ldrb r0, [r1]
	lsls r1, r0, #0x1e
	lsrs r0, r1, #0x1f
	cmp r0, #0
	bne _080B3B86
	movs r0, #0xb9
	bl m4aSongNumStart
_080B3B86:
	ldr r0, [r7]
	movs r1, #0x3c
	bl sub_80149B4
	b _080B3B9C
	.align 2, 0
_080B3B90: .4byte gBg0Tm + 0x1b6
_080B3B94: .4byte gPlaySt
_080B3B98:
	b _080B3B9C
_080B3B9A:
	b _080B3B9C
_080B3B9C:
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0

	thumb_func_start sub_80B3BA4
sub_80B3BA4: @ 0x080B3BA4
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r1, _080B3BC4 @ =gUnk_08DB0ADC
	adds r0, r1, #0
	bl Proc_EndEach
	ldr r0, _080B3BC8 @ =gUnk_08D64F4C
	ldr r1, _080B3BCC @ =sub_806E2C8
	bl Proc_ForEach
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B3BC4: .4byte gUnk_08DB0ADC
_080B3BC8: .4byte gUnk_08D64F4C
_080B3BCC: .4byte sub_806E2C8

	thumb_func_start sub_80B3BD0
sub_80B3BD0: @ 0x080B3BD0
	push {r7, lr}
	sub sp, #8
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	bl sub_8007DF4
	bl sub_800968C
	ldr r0, [r7]
	bl DecodeMsg
	adds r2, r0, #0
	ldr r3, [r7, #4]
	movs r0, #8
	movs r1, #2
	bl sub_8007E08
	movs r0, #0
	bl sub_8007F84
	movs r0, #1
	bl sub_8007F24
	movs r0, #2
	bl sub_8007F24
	movs r0, #4
	bl sub_8007F24
	movs r0, #1
	bl sub_8008CB8
	add sp, #8
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_80B3C1C
sub_80B3C1C: @ 0x080B3C1C
	push {r4, r5, r7, lr}
	sub sp, #8
	add r7, sp, #4
	str r0, [r7]
	movs r0, #0
	str r0, [sp]
	movs r0, #7
	movs r1, #9
	movs r2, #0x10
	movs r3, #6
	bl sub_804A4CC
	movs r0, #0
	bl SetTextFont
	bl InitSystemTextFont
	ldr r4, _080B3CB8 @ =gBg0Tm + 0x290
	ldr r5, _080B3CBC @ =gUnk_08D8AC98
	bl GetLang
	adds r1, r0, #0
	lsls r0, r1, #2
	adds r1, r5, r0
	ldr r2, [r1]
	adds r0, r4, #0
	movs r1, #0
	bl sub_8014B14
	ldr r0, _080B3CC0 @ =gBg0Tm + 0x298
	ldr r1, _080B3CC4 @ =gArenaSt
	ldr r3, [r1, #4]
	movs r2, #8
	ldrsb r2, [r3, r2]
	movs r1, #2
	bl sub_8006068
	ldr r4, _080B3CC8 @ =gBg0Tm + 0x310
	ldr r0, _080B3CC4 @ =gArenaSt
	ldr r1, [r0, #4]
	ldr r0, [r1]
	ldrh r1, [r0]
	adds r0, r1, #0
	bl DecodeMsg
	adds r2, r0, #0
	adds r0, r4, #0
	movs r1, #0
	bl sub_8014B14
	ldr r4, _080B3CCC @ =gBg0Tm + 0x29e
	ldr r0, _080B3CC4 @ =gArenaSt
	ldr r1, [r0, #4]
	ldr r0, [r1, #4]
	ldrh r1, [r0]
	adds r0, r1, #0
	bl DecodeMsg
	adds r2, r0, #0
	adds r0, r4, #0
	movs r1, #0
	bl sub_8014B14
	ldr r4, _080B3CD0 @ =gBg0Tm + 0x31e
	ldr r0, _080B3CC4 @ =gArenaSt
	ldrh r1, [r0, #0x1c]
	adds r0, r1, #0
	bl GetItemName
	adds r2, r0, #0
	adds r0, r4, #0
	movs r1, #0
	bl sub_8014B14
	add sp, #8
	pop {r4, r5, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B3CB8: .4byte gBg0Tm + 0x290
_080B3CBC: .4byte gUnk_08D8AC98
_080B3CC0: .4byte gBg0Tm + 0x298
_080B3CC4: .4byte gArenaSt
_080B3CC8: .4byte gBg0Tm + 0x310
_080B3CCC: .4byte gBg0Tm + 0x29e
_080B3CD0: .4byte gBg0Tm + 0x31e

	thumb_func_start sub_80B3CD4
sub_80B3CD4: @ 0x080B3CD4
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	bl sub_802F5AC
	cmp r0, #1
	beq _080B3CE6
	b _080B3D04
_080B3CE6:
	ldr r1, _080B3D00 @ =gPlaySt
	adds r0, r1, #0
	adds r1, #0x41
	ldrb r0, [r1]
	lsls r1, r0, #0x1f
	lsrs r0, r1, #0x1f
	cmp r0, #0
	bne _080B3CFE
	movs r0, #0x2d
	movs r1, #0
	bl sub_8003684
_080B3CFE:
	b _080B3D28
	.align 2, 0
_080B3D00: .4byte gPlaySt
_080B3D04:
	ldr r1, _080B3D24 @ =gPlaySt
	adds r0, r1, #0
	adds r1, #0x41
	ldrb r0, [r1]
	lsls r1, r0, #0x1f
	lsrs r0, r1, #0x1f
	cmp r0, #0
	bne _080B3D1C
	movs r0, #0x47
	movs r1, #0
	bl sub_8003684
_080B3D1C:
	ldr r0, [r7]
	bl Proc_End
	b _080B3D28
	.align 2, 0
_080B3D24: .4byte gPlaySt
_080B3D28:
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0

	thumb_func_start sub_80B3D30
sub_80B3D30: @ 0x080B3D30
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	movs r0, #0x47
	movs r1, #0
	movs r2, #0
	bl sub_8003788
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_80B3D4C
sub_80B3D4C: @ 0x080B3D4C
	push {r7, lr}
	mov r7, sp
	ldr r1, _080B3D60 @ =gUnk_08DB0D68
	adds r0, r1, #0
	bl StartEvent
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B3D60: .4byte gUnk_08DB0D68

	thumb_func_start sub_80B3D64
sub_80B3D64: @ 0x080B3D64
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	bl sub_8009E60
	cmp r0, #1
	beq _080B3D84
	cmp r0, #1
	bgt _080B3D7E
	cmp r0, #0
	beq _080B3D8C
	b _080B3D8C
_080B3D7E:
	cmp r0, #2
	beq _080B3D88
	b _080B3D8C
_080B3D84:
	movs r0, #1
	b _080B3D90
_080B3D88:
	movs r0, #0
	b _080B3D90
_080B3D8C:
	movs r0, #0
	b _080B3D90
_080B3D90:
	add sp, #4
	pop {r7}
	pop {r1}
	bx r1

	thumb_func_start sub_80B3D98
sub_80B3D98: @ 0x080B3D98
	push {r7, lr}
	mov r7, sp
	ldr r0, _080B3DB4 @ =gActionSt
	ldrb r1, [r0, #0x16]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0, #0x16]
	movs r0, #3
	bl WriteSuspendSave
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B3DB4: .4byte gActionSt

	thumb_func_start sub_80B3DB8
sub_80B3DB8: @ 0x080B3DB8
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	movs r0, #0
	bl SetNextGameAction
	ldr r0, [r7]
	bl sub_800E43C
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0

	thumb_func_start sub_80B3DD4
sub_80B3DD4: @ 0x080B3DD4
	ldr r0, _080B3DE0 @ =gAnims
	ldrb r0, [r0, #2]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bx lr
	.align 2, 0
_080B3DE0: .4byte gAnims

	thumb_func_start sub_80B3DE4
sub_80B3DE4: @ 0x080B3DE4
	ldr r1, _080B3DEC @ =gAnims
	strb r0, [r1, #2]
	bx lr
	.align 2, 0
_080B3DEC: .4byte gAnims

	thumb_func_start sub_80B3DF0
sub_80B3DF0: @ 0x080B3DF0
	push {r4, r5, lr}
	sub sp, #8
	movs r0, #1
	rsbs r0, r0, #0
	str r0, [sp]
	ldr r4, _080B3E48 @ =0x0200000C
	ldr r2, _080B3E4C @ =0x01000200
	mov r0, sp
	adds r1, r4, #0
	bl CpuFastSet
	movs r5, #0
	str r5, [sp, #4]
	add r0, sp, #4
	ldr r1, _080B3E50 @ =0x06001000
	ldr r2, _080B3E54 @ =0x01001400
	bl CpuFastSet
	ldr r0, _080B3E58 @ =gBg2Tm
	movs r1, #0
	bl TmFill
	movs r1, #0x80
	lsls r1, r1, #4
	adds r0, r4, r1
	strh r5, [r0]
	adds r1, #2
	adds r0, r4, r1
	strh r5, [r0]
	ldr r0, _080B3E5C @ =0x00000804
	adds r4, r4, r0
	strh r5, [r4]
	movs r0, #2
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	movs r0, #4
	bl EnableBgSync
	add sp, #8
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080B3E48: .4byte 0x0200000C
_080B3E4C: .4byte 0x01000200
_080B3E50: .4byte 0x06001000
_080B3E54: .4byte 0x01001400
_080B3E58: .4byte gBg2Tm
_080B3E5C: .4byte 0x00000804

	thumb_func_start sub_80B3E60
sub_80B3E60: @ 0x080B3E60
	push {r4, lr}
	ldr r2, _080B3E88 @ =0x0200000C
	ldr r4, _080B3E8C @ =0x00000802
	adds r3, r2, r4
	ldrh r4, [r3]
	adds r0, r4, r0
	strh r0, [r3]
	ldr r0, _080B3E90 @ =0x00000804
	adds r2, r2, r0
	ldrh r4, [r2]
	adds r1, r4, r1
	strh r1, [r2]
	ldrh r1, [r3]
	ldrh r2, [r2]
	movs r0, #2
	bl SetBgOffset
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080B3E88: .4byte 0x0200000C
_080B3E8C: .4byte 0x00000802
_080B3E90: .4byte 0x00000804

	thumb_func_start sub_80B3E94
sub_80B3E94: @ 0x080B3E94
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	mov r8, r0
	adds r7, r1, #0
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	mov sb, r2
	ldr r2, _080B3F30 @ =0x0200000C
	ldr r1, _080B3F34 @ =0x00000802
	adds r0, r2, r1
	movs r3, #0
	ldrsh r0, [r0, r3]
	add r8, r0
	adds r1, #2
	adds r0, r2, r1
	movs r3, #0
	ldrsh r0, [r0, r3]
	adds r7, r7, r0
	mov r0, r8
	asrs r5, r0, #3
	asrs r4, r7, #3
	cmp r5, #0x1f
	bhi _080B3F24
	cmp r4, #0x1f
	bhi _080B3F24
	lsls r0, r5, #1
	lsls r1, r4, #6
	adds r0, r0, r1
	adds r6, r0, r2
	ldr r0, _080B3F38 @ =0x0000FFFF
	ldrh r1, [r6]
	cmp r1, r0
	bne _080B3F00
	movs r3, #0x80
	lsls r3, r3, #4
	adds r2, r2, r3
	ldrh r1, [r2]
	strh r1, [r6]
	ldr r3, _080B3F3C @ =gBg2Tm
	lsls r0, r4, #5
	adds r0, r0, r5
	lsls r0, r0, #1
	adds r0, r0, r3
	ldr r3, _080B3F40 @ =0x0000A080
	adds r1, r1, r3
	strh r1, [r0]
	ldrh r0, [r2]
	adds r0, #1
	strh r0, [r2]
	movs r0, #4
	bl EnableBgSync
_080B3F00:
	ldrh r6, [r6]
	lsls r0, r6, #5
	ldr r1, _080B3F44 @ =0x06001000
	adds r0, r0, r1
	movs r2, #7
	ands r7, r2
	lsls r1, r7, #2
	adds r1, r1, r0
	movs r0, #0xf
	mov r3, sb
	ands r3, r0
	mov r0, r8
	ands r0, r2
	lsls r0, r0, #2
	lsls r3, r0
	ldr r0, [r1]
	orrs r0, r3
	str r0, [r1]
_080B3F24:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B3F30: .4byte 0x0200000C
_080B3F34: .4byte 0x00000802
_080B3F38: .4byte 0x0000FFFF
_080B3F3C: .4byte gBg2Tm
_080B3F40: .4byte 0x0000A080
_080B3F44: .4byte 0x06001000

	thumb_func_start sub_80B3F48
sub_80B3F48: @ 0x080B3F48
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x20
	mov sl, r0
	mov sb, r1
	str r2, [sp, #0x10]
	str r3, [sp, #0x14]
	ldr r0, [sp, #0x50]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp, #0x18]
	cmp sb, r3
	ble _080B3F6A
	adds r1, r3, #0
_080B3F6A:
	ldr r0, [sp, #0x44]
	cmp r1, r0
	ble _080B3F72
	adds r1, r0, #0
_080B3F72:
	ldr r0, [sp, #0x4c]
	cmp r1, r0
	ble _080B3F7A
	adds r1, r0, #0
_080B3F7A:
	mov r7, sb
	ldr r0, [sp, #0x14]
	cmp r7, r0
	bge _080B3F84
	adds r7, r0, #0
_080B3F84:
	ldr r0, [sp, #0x44]
	cmp r7, r0
	bge _080B3F8C
	adds r7, r0, #0
_080B3F8C:
	ldr r0, [sp, #0x4c]
	cmp r7, r0
	bge _080B3F94
	adds r7, r0, #0
_080B3F94:
	mov r8, sl
	ldr r0, [sp, #0x10]
	cmp sl, r0
	ble _080B3F9E
	mov r8, r0
_080B3F9E:
	ldr r0, [sp, #0x40]
	cmp r8, r0
	ble _080B3FA6
	mov r8, r0
_080B3FA6:
	ldr r0, [sp, #0x48]
	cmp r8, r0
	ble _080B3FAE
	mov r8, r0
_080B3FAE:
	mov r6, sl
	ldr r0, [sp, #0x10]
	cmp r6, r0
	bge _080B3FB8
	adds r6, r0, #0
_080B3FB8:
	ldr r0, [sp, #0x40]
	cmp r6, r0
	bge _080B3FC0
	adds r6, r0, #0
_080B3FC0:
	ldr r0, [sp, #0x48]
	cmp r6, r0
	bge _080B3FC8
	adds r6, r0, #0
_080B3FC8:
	adds r5, r1, #0
	cmp r5, r7
	bgt _080B403E
_080B3FCE:
	mov r4, r8
	adds r0, r5, #1
	str r0, [sp, #0x1c]
	cmp r4, r6
	bgt _080B4038
_080B3FD8:
	ldr r0, [sp, #0x10]
	str r0, [sp]
	ldr r0, [sp, #0x14]
	str r0, [sp, #4]
	ldr r0, [sp, #0x40]
	str r0, [sp, #8]
	ldr r0, [sp, #0x44]
	str r0, [sp, #0xc]
	adds r0, r4, #0
	adds r1, r5, #0
	mov r2, sl
	mov r3, sb
	bl sub_80ABBB4
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080B4006
	adds r0, r4, #0
	adds r1, r5, #0
	ldr r2, [sp, #0x18]
	bl sub_80B3E94
	b _080B4032
_080B4006:
	ldr r0, [sp, #0x40]
	str r0, [sp]
	ldr r0, [sp, #0x44]
	str r0, [sp, #4]
	ldr r0, [sp, #0x48]
	str r0, [sp, #8]
	ldr r0, [sp, #0x4c]
	str r0, [sp, #0xc]
	adds r0, r4, #0
	adds r1, r5, #0
	mov r2, sl
	mov r3, sb
	bl sub_80ABBB4
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080B4032
	adds r0, r4, #0
	adds r1, r5, #0
	ldr r2, [sp, #0x18]
	bl sub_80B3E94
_080B4032:
	adds r4, #1
	cmp r4, r6
	ble _080B3FD8
_080B4038:
	ldr r5, [sp, #0x1c]
	cmp r5, r7
	ble _080B3FCE
_080B403E:
	add sp, #0x20
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_80B4050
sub_80B4050: @ 0x080B4050
	push {r4, r5, lr}
	adds r4, r1, #0
	adds r5, r2, #0
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r1, _080B40A4 @ =gAnims
	movs r3, #0
	strb r0, [r1]
	adds r2, r1, #0
	cmp r0, #1
	bne _080B40A8
	strh r4, [r2, #8]
	strh r5, [r2, #0xa]
	lsls r0, r4, #0x10
	cmp r0, #0
	bge _080B4072
	strh r3, [r2, #8]
_080B4072:
	movs r1, #8
	ldrsh r0, [r2, r1]
	movs r1, #0xc4
	lsls r1, r1, #2
	cmp r0, r1
	ble _080B4080
	strh r1, [r2, #8]
_080B4080:
	movs r4, #0xa
	ldrsh r0, [r2, r4]
	cmp r0, #0
	bge _080B408A
	strh r3, [r2, #0xa]
_080B408A:
	movs r1, #0xa
	ldrsh r0, [r2, r1]
	movs r1, #0x84
	lsls r1, r1, #2
	cmp r0, r1
	ble _080B4098
	strh r1, [r2, #0xa]
_080B4098:
	ldrh r0, [r2, #8]
	strh r0, [r2, #4]
	ldrh r0, [r2, #0xa]
	strh r0, [r2, #6]
	b _080B40B0
	.align 2, 0
_080B40A4: .4byte gAnims
_080B40A8:
	strh r3, [r2, #4]
	strh r3, [r2, #8]
	strh r3, [r2, #6]
	strh r3, [r2, #0xa]
_080B40B0:
	adds r0, r2, #0
	ldrb r3, [r0]
	movs r4, #4
	ldrsh r1, [r0, r4]
	cmp r1, #0
	bge _080B40BE
	adds r1, #7
_080B40BE:
	asrs r1, r1, #3
	movs r4, #6
	ldrsh r0, [r2, r4]
	cmp r0, #0
	bge _080B40CA
	adds r0, #7
_080B40CA:
	asrs r2, r0, #3
	adds r0, r3, #0
	bl sub_80B6BBC
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start sub_80B40D8
sub_80B40D8: @ 0x080B40D8
	push {lr}
	ldr r2, _080B4100 @ =gAnims
	ldrb r0, [r2]
	movs r3, #4
	ldrsh r1, [r2, r3]
	cmp r1, #0
	bge _080B40E8
	adds r1, #7
_080B40E8:
	asrs r1, r1, #3
	movs r3, #6
	ldrsh r2, [r2, r3]
	cmp r2, #0
	bge _080B40F4
	adds r2, #7
_080B40F4:
	asrs r2, r2, #3
	bl sub_80B6C8C
	pop {r0}
	bx r0
	.align 2, 0
_080B4100: .4byte gAnims

	thumb_func_start sub_80B4104
sub_80B4104: @ 0x080B4104
	push {r4, r5, lr}
	adds r3, r1, #0
	ldr r2, _080B416C @ =gAnims
	ldrb r1, [r2]
	cmp r1, #1
	bne _080B4164
	ldrh r4, [r2, #8]
	adds r1, r4, r0
	movs r4, #0
	strh r1, [r2, #8]
	ldrh r5, [r2, #0xa]
	adds r0, r5, r3
	strh r0, [r2, #0xa]
	lsls r1, r1, #0x10
	cmp r1, #0
	bge _080B4126
	strh r4, [r2, #8]
_080B4126:
	movs r1, #8
	ldrsh r0, [r2, r1]
	movs r1, #0xc4
	lsls r1, r1, #2
	cmp r0, r1
	ble _080B4134
	strh r1, [r2, #8]
_080B4134:
	movs r3, #0xa
	ldrsh r0, [r2, r3]
	cmp r0, #0
	bge _080B413E
	strh r4, [r2, #0xa]
_080B413E:
	movs r4, #0xa
	ldrsh r0, [r2, r4]
	movs r1, #0x84
	lsls r1, r1, #2
	cmp r0, r1
	ble _080B414C
	strh r1, [r2, #0xa]
_080B414C:
	movs r5, #8
	ldrsh r0, [r2, r5]
	movs r3, #4
	ldrsh r1, [r2, r3]
	subs r0, r0, r1
	movs r4, #0xa
	ldrsh r1, [r2, r4]
	movs r5, #6
	ldrsh r2, [r2, r5]
	subs r1, r1, r2
	bl sub_80B3E60
_080B4164:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080B416C: .4byte gAnims

	thumb_func_start sub_80B4170
sub_80B4170: @ 0x080B4170
	push {r4, r5, lr}
	adds r2, r0, #0
	ldr r0, _080B41EC @ =gAnims
	adds r4, r0, #0
	ldrb r0, [r4]
	cmp r0, #1
	bne _080B41E6
	movs r0, #1
	rsbs r0, r0, #0
	cmp r2, r0
	beq _080B418E
	cmp r1, r0
	beq _080B418E
	strh r2, [r4, #8]
	strh r1, [r4, #0xa]
_080B418E:
	adds r3, r4, #0
	ldr r1, [r3, #8]
	ldr r0, [r3, #4]
	cmp r1, r0
	beq _080B41E6
	movs r1, #4
	ldrsh r0, [r3, r1]
	cmp r0, #0
	bge _080B41A2
	adds r0, #7
_080B41A2:
	asrs r0, r0, #3
	movs r2, #6
	ldrsh r1, [r3, r2]
	cmp r1, #0
	bge _080B41AE
	adds r1, #7
_080B41AE:
	asrs r1, r1, #3
	movs r5, #8
	ldrsh r2, [r3, r5]
	cmp r2, #0
	bge _080B41BA
	adds r2, #7
_080B41BA:
	asrs r2, r2, #3
	movs r5, #0xa
	ldrsh r3, [r3, r5]
	cmp r3, #0
	bge _080B41C6
	adds r3, #7
_080B41C6:
	asrs r3, r3, #3
	bl sub_80B6A1C
	movs r2, #0xff
	adds r1, r2, #0
	ldrh r0, [r4, #8]
	ands r1, r0
	ldrh r5, [r4, #0xa]
	ands r2, r5
	movs r0, #3
	bl SetBgOffset
	ldrh r0, [r4, #8]
	strh r0, [r4, #4]
	ldrh r0, [r4, #0xa]
	strh r0, [r4, #6]
_080B41E6:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080B41EC: .4byte gAnims

	thumb_func_start sub_80B41F0
sub_80B41F0: @ 0x080B41F0
	ldr r0, _080B41F8 @ =gAnims
	movs r1, #4
	ldrsh r0, [r0, r1]
	bx lr
	.align 2, 0
_080B41F8: .4byte gAnims

	thumb_func_start sub_80B41FC
sub_80B41FC: @ 0x080B41FC
	ldr r0, _080B4204 @ =gAnims
	movs r1, #6
	ldrsh r0, [r0, r1]
	bx lr
	.align 2, 0
_080B4204: .4byte gAnims

	thumb_func_start sub_80B4208
sub_80B4208: @ 0x080B4208
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x18
	str r0, [sp, #4]
	str r1, [sp, #8]
	ldr r0, [sp, #0x38]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp, #0xc]
	cmp r2, #7
	bgt _080B4226
	b _080B44A2
_080B4226:
	cmp r3, #7
	bgt _080B422C
	b _080B44A2
_080B422C:
	ldr r5, [sp, #4]
	adds r5, #8
	ldr r0, [sp, #4]
	adds r1, r0, r2
	adds r0, r1, #0
	subs r0, #0x28
	str r1, [sp, #0x14]
	ldr r1, [sp, #8]
	adds r1, r1, r3
	mov sb, r1
	ldr r2, [sp, #8]
	adds r2, #8
	str r2, [sp, #0x10]
	cmp r5, r0
	bge _080B4296
	movs r3, #0xff
	mov r8, r3
	ldr r7, _080B44B4 @ =Sprite_32x8
	ldr r0, [sp, #0xc]
	ldr r1, _080B44B8 @ =0x00000806
	adds r6, r0, r1
	movs r2, #8
	rsbs r2, r2, #0
	add r2, sb
	mov sl, r2
_080B425E:
	ldr r4, _080B44BC @ =0x000001FF
	ands r4, r5
	str r6, [sp]
	movs r0, #2
	adds r1, r4, #0
	ldr r2, [sp, #8]
	mov r3, r8
	ands r2, r3
	adds r3, r7, #0
	bl PutSpriteExt
	movs r0, #0x80
	lsls r0, r0, #6
	adds r4, r4, r0
	str r6, [sp]
	movs r0, #2
	adds r1, r4, #0
	mov r2, sl
	mov r3, r8
	ands r2, r3
	adds r3, r7, #0
	bl PutSpriteExt
	adds r5, #0x20
	ldr r0, [sp, #0x14]
	subs r0, #0x28
	cmp r5, r0
	blt _080B425E
_080B4296:
	ldr r0, [sp, #0x14]
	subs r0, #0x18
	cmp r5, r0
	bge _080B42EA
	movs r0, #0xff
	mov r8, r0
	ldr r7, _080B44C0 @ =Sprite_16x8
	ldr r1, [sp, #0xc]
	ldr r2, _080B44B8 @ =0x00000806
	adds r6, r1, r2
	movs r3, #8
	rsbs r3, r3, #0
	add r3, sb
	mov sl, r3
_080B42B2:
	ldr r4, _080B44BC @ =0x000001FF
	ands r4, r5
	str r6, [sp]
	movs r0, #2
	adds r1, r4, #0
	ldr r2, [sp, #8]
	mov r3, r8
	ands r2, r3
	adds r3, r7, #0
	bl PutSpriteExt
	movs r0, #0x80
	lsls r0, r0, #6
	adds r4, r4, r0
	str r6, [sp]
	movs r0, #2
	adds r1, r4, #0
	mov r2, sl
	mov r3, r8
	ands r2, r3
	adds r3, r7, #0
	bl PutSpriteExt
	adds r5, #0x10
	ldr r0, [sp, #0x14]
	subs r0, #0x18
	cmp r5, r0
	blt _080B42B2
_080B42EA:
	ldr r0, [sp, #0x14]
	subs r0, #8
	cmp r5, r0
	bge _080B433E
	movs r0, #0xff
	mov r8, r0
	ldr r7, _080B44C4 @ =Sprite_8x8
	ldr r1, [sp, #0xc]
	ldr r2, _080B44B8 @ =0x00000806
	adds r6, r1, r2
	movs r3, #8
	rsbs r3, r3, #0
	add r3, sb
	mov sl, r3
_080B4306:
	ldr r4, _080B44BC @ =0x000001FF
	ands r4, r5
	str r6, [sp]
	movs r0, #2
	adds r1, r4, #0
	ldr r2, [sp, #8]
	mov r3, r8
	ands r2, r3
	adds r3, r7, #0
	bl PutSpriteExt
	movs r0, #0x80
	lsls r0, r0, #6
	adds r4, r4, r0
	str r6, [sp]
	movs r0, #2
	adds r1, r4, #0
	mov r2, sl
	mov r3, r8
	ands r2, r3
	adds r3, r7, #0
	bl PutSpriteExt
	adds r5, #8
	ldr r0, [sp, #0x14]
	subs r0, #8
	cmp r5, r0
	blt _080B4306
_080B433E:
	ldr r5, [sp, #0x10]
	mov r0, sb
	subs r0, #0x28
	cmp r5, r0
	bge _080B438E
	ldr r0, _080B44BC @ =0x000001FF
	mov sl, r0
	ldr r1, _080B44C8 @ =Sprite_8x32
	mov r8, r1
	ldr r2, [sp, #0xc]
	ldr r3, _080B44CC @ =0x00000804
	adds r7, r2, r3
	ldr r6, [sp, #0x14]
	subs r6, #8
	ands r6, r0
_080B435C:
	movs r4, #0xff
	ands r4, r5
	str r7, [sp]
	movs r0, #2
	ldr r1, [sp, #4]
	mov r2, sl
	ands r1, r2
	adds r2, r4, #0
	mov r3, r8
	bl PutSpriteExt
	str r7, [sp]
	movs r0, #2
	movs r3, #0x80
	lsls r3, r3, #5
	adds r1, r6, r3
	adds r2, r4, #0
	mov r3, r8
	bl PutSpriteExt
	adds r5, #0x20
	mov r0, sb
	subs r0, #0x28
	cmp r5, r0
	blt _080B435C
_080B438E:
	mov r0, sb
	subs r0, #0x18
	cmp r5, r0
	bge _080B43DC
	ldr r0, _080B44BC @ =0x000001FF
	mov sl, r0
	ldr r1, _080B44D0 @ =Sprite_8x16
	mov r8, r1
	ldr r2, [sp, #0xc]
	ldr r3, _080B44CC @ =0x00000804
	adds r7, r2, r3
	ldr r6, [sp, #0x14]
	subs r6, #8
	ands r6, r0
_080B43AA:
	movs r4, #0xff
	ands r4, r5
	str r7, [sp]
	movs r0, #2
	ldr r1, [sp, #4]
	mov r2, sl
	ands r1, r2
	adds r2, r4, #0
	mov r3, r8
	bl PutSpriteExt
	str r7, [sp]
	movs r0, #2
	movs r3, #0x80
	lsls r3, r3, #5
	adds r1, r6, r3
	adds r2, r4, #0
	mov r3, r8
	bl PutSpriteExt
	adds r5, #0x10
	mov r0, sb
	subs r0, #0x18
	cmp r5, r0
	blt _080B43AA
_080B43DC:
	mov r0, sb
	subs r0, #8
	cmp r5, r0
	bge _080B442A
	ldr r0, _080B44BC @ =0x000001FF
	mov sl, r0
	ldr r1, _080B44C4 @ =Sprite_8x8
	mov r8, r1
	ldr r2, [sp, #0xc]
	ldr r3, _080B44CC @ =0x00000804
	adds r7, r2, r3
	ldr r6, [sp, #0x14]
	subs r6, #8
	ands r6, r0
_080B43F8:
	movs r4, #0xff
	ands r4, r5
	str r7, [sp]
	movs r0, #2
	ldr r1, [sp, #4]
	mov r2, sl
	ands r1, r2
	adds r2, r4, #0
	mov r3, r8
	bl PutSpriteExt
	str r7, [sp]
	movs r0, #2
	movs r3, #0x80
	lsls r3, r3, #5
	adds r1, r6, r3
	adds r2, r4, #0
	mov r3, r8
	bl PutSpriteExt
	adds r5, #8
	mov r0, sb
	subs r0, #8
	cmp r5, r0
	blt _080B43F8
_080B442A:
	ldr r0, _080B44BC @ =0x000001FF
	mov sl, r0
	mov r6, sl
	ldr r1, [sp, #4]
	ands r6, r1
	movs r4, #0xff
	ldr r2, [sp, #8]
	ands r4, r2
	ldr r7, _080B44C4 @ =Sprite_8x8
	ldr r3, [sp, #0xc]
	ldr r0, _080B44D4 @ =0x00000805
	adds r3, r3, r0
	mov r8, r3
	str r3, [sp]
	movs r0, #2
	adds r1, r6, #0
	adds r2, r4, #0
	adds r3, r7, #0
	bl PutSpriteExt
	ldr r5, [sp, #0x14]
	subs r5, #8
	mov r1, sl
	ands r5, r1
	movs r1, #0x80
	lsls r1, r1, #5
	adds r1, r5, r1
	mov r2, r8
	str r2, [sp]
	movs r0, #2
	adds r2, r4, #0
	adds r3, r7, #0
	bl PutSpriteExt
	movs r0, #0x80
	lsls r0, r0, #6
	adds r6, r6, r0
	mov r4, sb
	subs r4, #8
	movs r3, #0xff
	ands r4, r3
	mov r0, r8
	str r0, [sp]
	movs r0, #2
	adds r1, r6, #0
	adds r2, r4, #0
	adds r3, r7, #0
	bl PutSpriteExt
	movs r0, #0xc0
	lsls r0, r0, #6
	adds r5, r5, r0
	mov r1, r8
	str r1, [sp]
	movs r0, #2
	adds r1, r5, #0
	adds r2, r4, #0
	adds r3, r7, #0
	bl PutSpriteExt
_080B44A2:
	add sp, #0x18
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B44B4: .4byte Sprite_32x8
_080B44B8: .4byte 0x00000806
_080B44BC: .4byte 0x000001FF
_080B44C0: .4byte Sprite_16x8
_080B44C4: .4byte Sprite_8x8
_080B44C8: .4byte Sprite_8x32
_080B44CC: .4byte 0x00000804
_080B44D0: .4byte Sprite_8x16
_080B44D4: .4byte 0x00000805

	thumb_func_start sub_80B44D8
sub_80B44D8: @ 0x080B44D8
	push {r4, r5, lr}
	adds r4, r0, #0
	bl sub_80B40D8
	ldr r3, _080B4528 @ =gDispIo
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
	movs r2, #0
	movs r0, #0x10
	strb r0, [r1]
	adds r0, r3, #0
	adds r0, #0x45
	strb r2, [r0]
	adds r0, #1
	strb r2, [r0]
	ldr r0, _080B452C @ =0x0000FFE0
	ldrh r5, [r3, #0x3c]
	ands r0, r5
	movs r1, #4
	orrs r0, r1
	ldr r1, _080B4530 @ =0x0000E0FF
	ands r0, r1
	movs r5, #0x80
	lsls r5, r5, #4
	adds r1, r5, #0
	orrs r0, r1
	strh r0, [r3, #0x3c]
	str r2, [r4, #0x2c]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080B4528: .4byte gDispIo
_080B452C: .4byte 0x0000FFE0
_080B4530: .4byte 0x0000E0FF

	thumb_func_start sub_80B4534
sub_80B4534: @ 0x080B4534
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x2c]
	cmp r0, #0
	bne _080B454C
	ldr r0, [r4, #0x30]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r1, [r4, #0x34]
	ldr r2, [r4, #0x38]
	bl sub_80B4050
_080B454C:
	adds r0, r4, #0
	bl Proc_Break
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_80B4558
sub_80B4558: @ 0x080B4558
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	adds r3, r0, #0
	ldr r0, [r3, #0x2c]
	adds r0, #1
	str r0, [r3, #0x2c]
	asrs r4, r0, #2
	ldr r2, _080B45D8 @ =gDispIo
	adds r6, r2, #0
	adds r6, #0x3c
	movs r0, #0x3f
	mov sl, r0
	ldrb r1, [r6]
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r6]
	movs r0, #0x10
	subs r0, r0, r4
	movs r1, #0x44
	adds r1, r1, r2
	mov sb, r1
	movs r5, #0
	strb r0, [r1]
	movs r0, #0x45
	adds r0, r0, r2
	mov r8, r0
	strb r4, [r0]
	adds r7, r2, #0
	adds r7, #0x46
	strb r5, [r7]
	cmp r4, #0x10
	bne _080B45CA
	adds r0, r3, #0
	bl Proc_Break
	movs r0, #2
	bl GetBgTilemap
	movs r1, #0
	bl TmFill
	movs r0, #4
	bl EnableBgSync
	mov r0, sl
	ldrb r1, [r6]
	ands r0, r1
	strb r0, [r6]
	mov r0, sb
	strb r4, [r0]
	mov r1, r8
	strb r5, [r1]
	strb r5, [r7]
_080B45CA:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B45D8: .4byte gDispIo

	thumb_func_start sub_80B45DC
sub_80B45DC: @ 0x080B45DC
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	adds r4, r1, #0
	adds r5, r2, #0
	adds r1, r3, #0
	ldr r0, _080B45F8 @ =gUnk_08DB0DC4
	bl Proc_StartBlocking
	str r4, [r0, #0x34]
	str r5, [r0, #0x38]
	str r6, [r0, #0x30]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080B45F8: .4byte gUnk_08DB0DC4

	thumb_func_start sub_80B45FC
sub_80B45FC: @ 0x080B45FC
	push {r4, lr}
	ldr r0, _080B4670 @ =0x04000006
	ldrh r0, [r0]
	adds r0, #1
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	cmp r3, #0xa0
	bls _080B460E
	movs r3, #0
_080B460E:
	movs r0, #1
	ands r0, r3
	cmp r0, #0
	bne _080B4668
	ldr r1, _080B4674 @ =0x02000814
	movs r0, #2
	ldrb r2, [r1]
	ands r0, r2
	adds r4, r1, #0
	cmp r0, #0
	beq _080B463C
	ldr r1, _080B4678 @ =0x0203E640
	cmp r3, #0
	bne _080B4630
	ldr r0, _080B467C @ =0x0203E638
	ldr r0, [r0]
	str r0, [r1]
_080B4630:
	ldr r2, _080B4680 @ =0x04000040
	ldr r1, [r1]
	lsls r0, r3, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	strh r0, [r2]
_080B463C:
	movs r0, #1
	ldrb r4, [r4]
	ands r0, r4
	cmp r0, #0
	beq _080B4668
	ldr r0, _080B4684 @ =0x02000815
	ldrb r1, [r0]
	cmp r3, r1
	blo _080B4668
	adds r0, r1, #0
	adds r0, #0x28
	cmp r3, r0
	bge _080B4668
	subs r0, r3, r1
	lsls r0, r0, #1
	ldr r1, _080B4688 @ =gPal + 0x280
	adds r0, r0, r1
	ldrh r1, [r0]
	ldr r0, _080B468C @ =0x05000268
	strh r1, [r0]
	subs r0, #0x20
	strh r1, [r0]
_080B4668:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080B4670: .4byte 0x04000006
_080B4674: .4byte 0x02000814
_080B4678: .4byte 0x0203E640
_080B467C: .4byte 0x0203E638
_080B4680: .4byte 0x04000040
_080B4684: .4byte 0x02000815
_080B4688: .4byte gPal + 0x280
_080B468C: .4byte 0x05000268

	thumb_func_start sub_80B4690
sub_80B4690: @ 0x080B4690
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x10
	adds r4, r0, #0
	adds r7, r1, #0
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	str r2, [sp]
	lsls r3, r3, #0x10
	lsrs r3, r3, #0x10
	mov sl, r3
	movs r2, #0
	cmp r2, r7
	bge _080B473E
	movs r0, #0x1f
	mov r1, sl
	ands r1, r0
	str r1, [sp, #4]
	movs r3, #0
	str r3, [sp, #8]
	mov r8, r4
	ldr r1, [sp]
	mov sb, r1
	mov r3, sb
	ands r3, r0
	mov sb, r3
_080B46CA:
	subs r6, r7, r2
	mov r0, sb
	muls r0, r6, r0
	ldr r1, [sp, #8]
	adds r0, r0, r1
	adds r1, r7, #0
	str r2, [sp, #0xc]
	bl __divsi3
	adds r4, r0, #0
	movs r3, #0x1f
	ands r4, r3
	ldr r0, [sp]
	movs r1, #0xf8
	lsls r1, r1, #2
	ands r0, r1
	muls r0, r6, r0
	mov r1, sl
	movs r3, #0xf8
	lsls r3, r3, #2
	ands r1, r3
	ldr r2, [sp, #0xc]
	muls r1, r2, r1
	adds r0, r0, r1
	adds r1, r7, #0
	bl __divsi3
	movs r1, #0xf8
	lsls r1, r1, #2
	ands r0, r1
	adds r4, r4, r0
	movs r5, #0xf8
	lsls r5, r5, #7
	ldr r0, [sp]
	ands r0, r5
	muls r0, r6, r0
	mov r1, sl
	ands r1, r5
	ldr r2, [sp, #0xc]
	muls r1, r2, r1
	adds r0, r0, r1
	adds r1, r7, #0
	bl __divsi3
	ands r0, r5
	adds r4, r4, r0
	mov r3, r8
	strh r4, [r3]
	ldr r0, [sp, #8]
	ldr r1, [sp, #4]
	adds r0, r0, r1
	str r0, [sp, #8]
	movs r3, #2
	add r8, r3
	ldr r2, [sp, #0xc]
	adds r2, #1
	cmp r2, r7
	blt _080B46CA
_080B473E:
	add sp, #0x10
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_80B4750
sub_80B4750: @ 0x080B4750
	adds r2, r0, #0
	adds r0, #0x2b
	movs r1, #0
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	subs r0, #2
	strb r1, [r0]
	subs r0, #1
	strb r1, [r0]
	strh r1, [r2, #0x2e]
	movs r3, #0
	movs r1, #3
	adds r0, #0x1f
_080B476C:
	str r3, [r0]
	subs r0, #8
	subs r1, #1
	cmp r1, #0
	bge _080B476C
	bx lr

	thumb_func_start sub_80B4778
sub_80B4778: @ 0x080B4778
	push {r4, lr}
	adds r2, r0, #0
	adds r0, #0x2b
	ldrb r0, [r0]
	cmp r0, #0
	beq _080B4806
	adds r0, r2, #0
	adds r0, #0x29
	ldrb r3, [r0]
	cmp r3, #0
	beq _080B47A4
	adds r0, #1
	ldrb r1, [r0]
	adds r4, r0, #0
	cmp r1, #0
	bne _080B479E
	bl sub_80B49A8
	b _080B47DE
_080B479E:
	subs r0, r1, #1
	strb r0, [r4]
	b _080B47DE
_080B47A4:
	adds r1, r2, #0
	adds r1, #0x2c
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x1b
	cmp r0, #0x10
	bne _080B47B8
	strb r3, [r1]
_080B47B8:
	ldrb r1, [r1]
	lsrs r1, r1, #3
	movs r0, #0xf
	ands r0, r1
	cmp r0, #7
	bls _080B47CE
	movs r0, #7
	ands r1, r0
	movs r0, #0xa
	subs r0, r0, r1
	b _080B47D4
_080B47CE:
	movs r0, #7
	ands r1, r0
	adds r0, r1, #2
_080B47D4:
	lsls r1, r0, #2
	adds r0, r2, #0
	adds r0, #0x2a
	strb r1, [r0]
	adds r4, r0, #0
_080B47DE:
	ldr r3, _080B480C @ =gDispIo
	adds r1, r3, #0
	adds r1, #0x3c
	movs r0, #0x3f
	ldrb r2, [r1]
	ands r0, r2
	strb r0, [r1]
	ldrb r4, [r4]
	lsrs r1, r4, #2
	adds r0, r3, #0
	adds r0, #0x44
	movs r2, #0
	strb r1, [r0]
	adds r1, r3, #0
	adds r1, #0x45
	movs r0, #0x10
	strb r0, [r1]
	adds r0, r3, #0
	adds r0, #0x46
	strb r2, [r0]
_080B4806:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080B480C: .4byte gDispIo

	thumb_func_start sub_80B4810
sub_80B4810: @ 0x080B4810
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	adds r4, r0, #0
	mov r8, r1
	ldr r0, _080B4914 @ =gUnk_08DB0E8C
	bl Proc_Find
	adds r7, r0, #0
	cmp r4, #3
	bhi _080B4902
	cmp r7, #0
	beq _080B4902
	lsls r4, r4, #3
	mov sl, r4
	adds r0, #0x30
	add r0, sl
	mov sb, r0
	ldr r0, [r0]
	cmp r0, #0
	bne _080B4902
	ldr r5, _080B4918 @ =gUnk_08622B38
	mov r0, r8
	lsls r4, r0, #2
	add r4, r8
	lsls r4, r4, #2
	adds r6, r4, r5
	ldr r0, [r6]
	ldr r1, _080B491C @ =0x06010000
	ldrh r2, [r7, #0x2e]
	orrs r1, r2
	bl Decompress
	movs r3, #0xe
	ldrsh r1, [r6, r3]
	ldr r3, _080B4920 @ =gAnims
	movs r2, #4
	ldrsh r0, [r3, r2]
	subs r1, r1, r0
	movs r2, #0x10
	ldrsh r0, [r6, r2]
	mov ip, r0
	movs r2, #6
	ldrsh r0, [r3, r2]
	mov r3, ip
	subs r2, r3, r0
	movs r0, #0x80
	lsls r0, r0, #3
	adds r0, r0, r2
	mov ip, r0
	adds r0, r5, #4
	adds r0, r4, r0
	ldr r0, [r0]
	ldrh r2, [r7, #0x2e]
	lsrs r2, r2, #5
	str r2, [sp, #8]
	movs r3, #0x9c
	lsls r3, r3, #8
	adds r3, r2, r3
	str r3, [sp, #8]
	adds r5, #8
	adds r4, r4, r5
	ldr r4, [r4]
	str r4, [sp]
	movs r4, #0xd
	str r4, [sp, #4]
	mov r2, ip
	bl StartSpriteAnimProc
	mov r5, sb
	str r0, [r5]
	mov r1, sl
	adds r0, r7, r1
	ldrh r1, [r7, #0x2e]
	movs r4, #0
	strh r1, [r0, #0x36]
	adds r0, #0x34
	mov r2, r8
	strb r2, [r0]
	ldrh r3, [r7, #0x2e]
	ldrh r6, [r6, #0xc]
	adds r0, r3, r6
	strh r0, [r7, #0x2e]
	adds r3, r7, #0
	adds r3, #0x2b
	ldrb r0, [r3]
	cmp r0, #0
	bne _080B48E6
	ldr r2, _080B4924 @ =gDispIo
	adds r1, r2, #0
	adds r1, #0x3c
	movs r0, #0x3f
	ldrb r5, [r1]
	ands r0, r5
	strb r0, [r1]
	adds r0, r2, #0
	adds r0, #0x44
	strb r4, [r0]
	adds r1, #9
	movs r0, #0x10
	strb r0, [r1]
	adds r0, r2, #0
	adds r0, #0x46
	strb r4, [r0]
_080B48E6:
	ldrb r0, [r3]
	adds r0, #1
	strb r0, [r3]
	ldr r2, _080B4928 @ =0x030027CC
	ldr r0, _080B492C @ =0x0000FFE0
	ldrh r1, [r2]
	ands r0, r1
	ldr r1, _080B4930 @ =0x0000E0FF
	ands r0, r1
	movs r3, #0x80
	lsls r3, r3, #4
	adds r1, r3, #0
	orrs r0, r1
	strh r0, [r2]
_080B4902:
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B4914: .4byte gUnk_08DB0E8C
_080B4918: .4byte gUnk_08622B38
_080B491C: .4byte 0x06010000
_080B4920: .4byte gAnims
_080B4924: .4byte gDispIo
_080B4928: .4byte 0x030027CC
_080B492C: .4byte 0x0000FFE0
_080B4930: .4byte 0x0000E0FF

	thumb_func_start sub_80B4934
sub_80B4934: @ 0x080B4934
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	ldr r0, _080B497C @ =gUnk_08DB0E8C
	bl Proc_Find
	adds r4, r0, #0
	cmp r5, #3
	bhi _080B499E
	cmp r4, #0
	beq _080B499E
	lsls r6, r5, #3
	adds r0, #0x30
	adds r5, r0, r6
	ldr r0, [r5]
	cmp r0, #0
	beq _080B499E
	bl EndSpriteAnimProc
	movs r0, #0
	str r0, [r5]
	adds r1, r4, #0
	adds r1, #0x2b
	ldrb r0, [r1]
	subs r0, #1
	strb r0, [r1]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0
	bne _080B4980
	movs r1, #0
	strh r0, [r4, #0x2e]
	adds r0, r4, #0
	adds r0, #0x2c
	strb r1, [r0]
	b _080B499E
	.align 2, 0
_080B497C: .4byte gUnk_08DB0E8C
_080B4980:
	ldrh r3, [r4, #0x2e]
	adds r1, r4, r6
	ldrh r5, [r1, #0x36]
	ldr r2, _080B49A4 @ =gUnk_08622B38
	adds r1, #0x34
	ldrb r6, [r1]
	lsls r0, r6, #2
	adds r0, r0, r6
	lsls r0, r0, #2
	adds r0, r0, r2
	ldrh r0, [r0, #0xc]
	adds r0, r0, r5
	cmp r3, r0
	bne _080B499E
	strh r5, [r4, #0x2e]
_080B499E:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080B49A4: .4byte gUnk_08622B38

	thumb_func_start sub_80B49A8
sub_80B49A8: @ 0x080B49A8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	ldr r0, _080B4A1C @ =gUnk_08DB0E8C
	bl Proc_Find
	adds r5, r0, #0
	cmp r5, #0
	beq _080B4A0A
	movs r0, #0x2b
	adds r0, r0, r5
	mov sl, r0
	adds r0, r5, #0
	adds r0, #0x2c
	str r0, [sp]
	movs r0, #0x2a
	adds r0, r0, r5
	mov sb, r0
	movs r0, #0x29
	adds r0, r0, r5
	mov r8, r0
	movs r7, #0
	adds r4, r5, #0
	adds r4, #0x30
	movs r6, #3
_080B49E0:
	ldr r0, [r4]
	cmp r0, #0
	beq _080B49EC
	bl EndSpriteAnimProc
	str r7, [r4]
_080B49EC:
	adds r4, #8
	subs r6, #1
	cmp r6, #0
	bge _080B49E0
	movs r1, #0
	movs r0, #0
	strh r0, [r5, #0x2e]
	mov r0, sl
	strb r1, [r0]
	ldr r0, [sp]
	strb r1, [r0]
	mov r0, sb
	strb r1, [r0]
	mov r0, r8
	strb r1, [r0]
_080B4A0A:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B4A1C: .4byte gUnk_08DB0E8C

	thumb_func_start sub_80B4A20
sub_80B4A20: @ 0x080B4A20
	push {lr}
	ldr r0, _080B4A38 @ =gUnk_08DB0E8C
	bl Proc_Find
	cmp r0, #0
	beq _080B4A34
	adds r1, r0, #0
	adds r1, #0x29
	movs r0, #1
	strb r0, [r1]
_080B4A34:
	pop {r0}
	bx r0
	.align 2, 0
_080B4A38: .4byte gUnk_08DB0E8C

	thumb_func_start sub_80B4A3C
sub_80B4A3C: @ 0x080B4A3C
	push {lr}
	adds r1, r0, #0
	ldr r0, _080B4A4C @ =gUnk_08DB0E8C
	bl Proc_Start
	pop {r1}
	bx r1
	.align 2, 0
_080B4A4C: .4byte gUnk_08DB0E8C

	thumb_func_start sub_80B4A50
sub_80B4A50: @ 0x080B4A50
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r6, r2, #0
	ldr r0, _080B4A88 @ =gUnk_08DB0E8C
	bl Proc_Find
	cmp r0, #0
	beq _080B4A80
	lsls r1, r4, #3
	adds r0, #0x30
	adds r0, r0, r1
	ldr r2, [r0]
	cmp r2, #0
	beq _080B4A80
	ldr r0, _080B4A8C @ =gAnims
	movs r3, #4
	ldrsh r1, [r0, r3]
	subs r1, r5, r1
	str r1, [r2, #0x54]
	movs r1, #6
	ldrsh r0, [r0, r1]
	subs r0, r6, r0
	str r0, [r2, #0x58]
_080B4A80:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080B4A88: .4byte gUnk_08DB0E8C
_080B4A8C: .4byte gAnims

	thumb_func_start sub_80B4A90
sub_80B4A90: @ 0x080B4A90
	push {r4, r5, r6, lr}
	sub sp, #4
	ldr r6, _080B4ABC @ =0x44444444
	ldr r5, _080B4AC0 @ =0x06014000
	movs r4, #3
_080B4A9A:
	str r6, [sp]
	mov r0, sp
	adds r1, r5, #0
	ldr r2, _080B4AC4 @ =0x010000D8
	bl CpuFastSet
	movs r0, #0x80
	lsls r0, r0, #3
	adds r5, r5, r0
	subs r4, #1
	cmp r4, #0
	bge _080B4A9A
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080B4ABC: .4byte 0x44444444
_080B4AC0: .4byte 0x06014000
_080B4AC4: .4byte 0x010000D8

	thumb_func_start sub_80B4AC8
sub_80B4AC8: @ 0x080B4AC8
	push {r4, lr}
	adds r3, r0, #0
	adds r3, #0x29
	movs r2, #0
	movs r4, #1
	movs r1, #1
	strb r1, [r3]
	adds r0, #0x2a
	strb r2, [r0]
	bl sub_80B4A90
	ldr r0, _080B4AF8 @ =0x02000814
	ldrb r1, [r0]
	eors r4, r1
	strb r4, [r0]
	ldr r0, _080B4AFC @ =gPal + 0x280
	ldr r2, _080B4B00 @ =0x000044C3
	ldr r3, _080B4B04 @ =0x00007247
	movs r1, #0x28
	bl sub_80B4690
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080B4AF8: .4byte 0x02000814
_080B4AFC: .4byte gPal + 0x280
_080B4B00: .4byte 0x000044C3
_080B4B04: .4byte 0x00007247

	thumb_func_start sub_80B4B08
sub_80B4B08: @ 0x080B4B08
	push {r4, lr}
	sub sp, #4
	adds r1, r0, #0
	adds r0, #0x2a
	ldrb r0, [r0]
	cmp r0, #0
	beq _080B4B48
	movs r4, #0
	adds r0, r1, #0
	adds r0, #0x29
	ldrb r0, [r0]
	cmp r0, #1
	bne _080B4B24
	movs r4, #0x70
_080B4B24:
	ldr r3, _080B4B50 @ =gUnk_08DB0DFC
	movs r0, #0xc0
	lsls r0, r0, #6
	str r0, [sp]
	movs r0, #2
	movs r1, #0
	adds r2, r4, #0
	bl PutSpriteExt
	ldr r3, _080B4B54 @ =gUnk_08DB0E6A
	movs r0, #0x80
	lsls r0, r0, #6
	str r0, [sp]
	movs r0, #1
	movs r1, #0
	adds r2, r4, #0
	bl PutSpriteExt
_080B4B48:
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080B4B50: .4byte gUnk_08DB0DFC
_080B4B54: .4byte gUnk_08DB0E6A

	thumb_func_start sub_80B4B58
sub_80B4B58: @ 0x080B4B58
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	adds r6, r4, #0
	ldr r0, _080B4BA4 @ =gUnk_08DB0EAC
	bl Proc_Find
	adds r5, r0, #0
	cmp r5, #0
	beq _080B4B9C
	bl sub_80B4A90
	cmp r4, #0
	bne _080B4B7A
	ldr r1, _080B4BA8 @ =0x02000815
	movs r0, #4
	strb r0, [r1]
_080B4B7A:
	cmp r4, #1
	bne _080B4B84
	ldr r1, _080B4BA8 @ =0x02000815
	movs r0, #0x74
	strb r0, [r1]
_080B4B84:
	ldr r1, _080B4BAC @ =0x02000814
	movs r0, #1
	ldrb r2, [r1]
	orrs r0, r2
	strb r0, [r1]
	adds r0, r5, #0
	adds r0, #0x29
	strb r6, [r0]
	adds r1, r5, #0
	adds r1, #0x2a
	movs r0, #1
	strb r0, [r1]
_080B4B9C:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080B4BA4: .4byte gUnk_08DB0EAC
_080B4BA8: .4byte 0x02000815
_080B4BAC: .4byte 0x02000814

	thumb_func_start sub_80B4BB0
sub_80B4BB0: @ 0x080B4BB0
	push {lr}
	ldr r0, _080B4BD4 @ =gUnk_08DB0EAC
	bl Proc_Find
	adds r2, r0, #0
	cmp r2, #0
	beq _080B4BD0
	ldr r1, _080B4BD8 @ =0x02000814
	movs r0, #1
	ldrb r3, [r1]
	eors r0, r3
	strb r0, [r1]
	adds r1, r2, #0
	adds r1, #0x2a
	movs r0, #0
	strb r0, [r1]
_080B4BD0:
	pop {r0}
	bx r0
	.align 2, 0
_080B4BD4: .4byte gUnk_08DB0EAC
_080B4BD8: .4byte 0x02000814

	thumb_func_start sub_80B4BDC
sub_80B4BDC: @ 0x080B4BDC
	push {lr}
	adds r1, r0, #0
	ldr r0, _080B4BEC @ =gUnk_08DB0EAC
	bl Proc_Start
	pop {r1}
	bx r1
	.align 2, 0
_080B4BEC: .4byte gUnk_08DB0EAC

	thumb_func_start sub_80B4BF0
sub_80B4BF0: @ 0x080B4BF0
	push {r4, lr}
	sub sp, #0xc
	movs r2, #0x2a
	ldrsh r1, [r0, r2]
	ldr r3, _080B4C2C @ =gAnims
	movs r4, #4
	ldrsh r2, [r3, r4]
	subs r1, r1, r2
	subs r1, #4
	movs r4, #0x2c
	ldrsh r2, [r0, r4]
	movs r4, #6
	ldrsh r0, [r3, r4]
	subs r2, r2, r0
	subs r2, #4
	ldr r3, _080B4C30 @ =gUnk_08DB0DF4
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	movs r0, #0x80
	lsls r0, r0, #5
	str r0, [sp, #8]
	movs r0, #0xb
	bl sub_80B4C58
	add sp, #0xc
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080B4C2C: .4byte gAnims
_080B4C30: .4byte gUnk_08DB0DF4

	thumb_func_start sub_80B4C34
sub_80B4C34: @ 0x080B4C34
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r6, r2, #0
	adds r1, r3, #0
	ldr r0, _080B4C54 @ =gUnk_08DB0ECC
	bl Proc_Start
	strh r4, [r0, #0x2a]
	strh r5, [r0, #0x2c]
	adds r0, #0x29
	strb r6, [r0]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080B4C54: .4byte gUnk_08DB0ECC

	thumb_func_start sub_80B4C58
sub_80B4C58: @ 0x080B4C58
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r4, r1, #0
	adds r5, r2, #0
	adds r7, r3, #0
	ldr r1, [sp, #0x18]
	ldr r2, [sp, #0x1c]
	ldr r3, [sp, #0x20]
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	lsls r1, r1, #0x10
	lsrs r0, r1, #0x10
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	lsls r3, r3, #0x10
	lsrs r3, r3, #0x10
	movs r1, #0x10
	rsbs r1, r1, #0
	cmp r4, r1
	blt _080B4CA2
	cmp r5, r1
	blt _080B4CA2
	cmp r4, #0xef
	bgt _080B4CA2
	cmp r5, #0x9f
	bgt _080B4CA2
	ldr r1, _080B4CAC @ =0x000001FF
	ands r1, r4
	adds r1, r1, r2
	movs r2, #0xff
	ands r2, r5
	adds r2, r2, r0
	str r3, [sp]
	adds r0, r6, #0
	adds r3, r7, #0
	bl PutSpriteExt
_080B4CA2:
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B4CAC: .4byte 0x000001FF

	thumb_func_start sub_80B4CB0
sub_80B4CB0: @ 0x080B4CB0
	adds r2, r0, #0
	adds r0, #0x2a
	movs r1, #0
	strb r1, [r0]
	str r1, [r2, #0x50]
	adds r0, #0x36
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	str r1, [r2, #0x5c]
	adds r1, r2, #0
	adds r1, #0x62
	movs r0, #1
	strb r0, [r1]
	bx lr
	.align 2, 0

	thumb_func_start sub_80B4CD0
sub_80B4CD0: @ 0x080B4CD0
	push {lr}
	adds r2, r0, #0
	adds r2, #0x29
	ldrb r3, [r2]
	cmp r1, r3
	beq _080B4CE6
	strb r1, [r2]
	ldr r0, [r0, #0x58]
	ldrb r1, [r2]
	bl sub_806C738
_080B4CE6:
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_80B4CEC
sub_80B4CEC: @ 0x080B4CEC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x24
	adds r4, r0, #0
	ldr r0, [r4, #0x50]
	lsrs r1, r0, #0x14
	str r1, [sp, #4]
	lsls r0, r0, #0xc
	lsrs r0, r0, #0x16
	str r0, [sp, #8]
	adds r1, r4, #0
	adds r1, #0x2a
	ldrb r0, [r1]
	cmp r0, #0
	bne _080B4D12
	b _080B50D0
_080B4D12:
	adds r0, r4, #0
	adds r0, #0x29
	ldrb r0, [r0]
	mov sl, r0
	ldrb r1, [r1]
	subs r1, #1
	ldr r2, [sp, #4]
	cmp r2, r1
	blt _080B4D26
	b _080B5010
_080B4D26:
	adds r0, r4, #0
	adds r0, #0x61
	ldrb r1, [r0]
	str r0, [sp, #0x20]
	adds r2, r4, #0
	adds r2, #0x60
	ldr r3, [sp, #4]
	cmp r1, r3
	beq _080B4D48
	ldr r0, [r4, #0x54]
	lsrs r0, r0, #0x15
	movs r1, #3
	ands r0, r1
	lsls r1, r0, #4
	subs r1, r1, r0
	lsls r1, r1, #1
	strb r1, [r2]
_080B4D48:
	ldrb r0, [r2]
	cmp r0, #0
	beq _080B4D6C
	subs r0, #1
	strb r0, [r2]
	adds r1, r4, #0
	adds r1, #0x4a
	movs r6, #0
	ldrsh r5, [r1, r6]
	str r5, [sp, #0xc]
	adds r0, r4, #0
	adds r0, #0x4c
	movs r2, #0
	ldrsh r7, [r0, r2]
	str r7, [sp, #0x10]
	mov sb, r1
	adds r6, r0, #0
	b _080B5098
_080B4D6C:
	ldr r3, [sp, #4]
	cmp r3, #0
	ble _080B4D8C
	adds r0, r3, #0
	subs r0, #1
	lsls r0, r0, #1
	adds r1, r4, #0
	adds r1, #0x2e
	adds r0, r1, r0
	movs r6, #0
	ldrsh r5, [r0, r6]
	str r5, [sp, #0x14]
	adds r3, r1, #0
	ldr r7, [sp, #4]
	lsls r5, r7, #1
	b _080B4DA0
_080B4D8C:
	ldr r0, [sp, #4]
	lsls r2, r0, #1
	adds r1, r4, #0
	adds r1, #0x2e
	adds r0, r1, r2
	movs r5, #0
	ldrsh r3, [r0, r5]
	str r3, [sp, #0x14]
	adds r3, r1, #0
	adds r5, r2, #0
_080B4DA0:
	adds r0, r3, r5
	movs r7, #0
	ldrsh r6, [r0, r7]
	str r6, [sp, #0x18]
	ldr r2, [sp, #4]
	adds r2, #1
	lsls r0, r2, #1
	adds r0, r3, r0
	movs r6, #0
	ldrsh r1, [r0, r6]
	mov sb, r1
	adds r0, r4, #0
	adds r0, #0x2a
	ldrb r1, [r0]
	subs r1, #2
	mov ip, r0
	ldr r7, [sp, #4]
	cmp r7, r1
	bge _080B4DD6
	adds r0, r7, #0
	adds r0, #2
	lsls r0, r0, #1
	adds r0, r3, r0
	movs r3, #0
	ldrsh r1, [r0, r3]
	mov r8, r1
	b _080B4DD8
_080B4DD6:
	mov r8, sb
_080B4DD8:
	ldr r6, [sp, #4]
	cmp r6, #0
	ble _080B4DF0
	adds r0, r6, #0
	subs r0, #1
	lsls r0, r0, #1
	adds r1, r4, #0
	adds r1, #0x3c
	adds r0, r1, r0
	movs r3, #0
	ldrsh r7, [r0, r3]
	b _080B4DFA
_080B4DF0:
	adds r1, r4, #0
	adds r1, #0x3c
	adds r0, r1, r5
	movs r6, #0
	ldrsh r7, [r0, r6]
_080B4DFA:
	adds r0, r1, r5
	movs r5, #0
	ldrsh r3, [r0, r5]
	str r3, [sp, #0x1c]
	lsls r0, r2, #1
	adds r0, r1, r0
	movs r2, #0
	ldrsh r6, [r0, r2]
	mov r3, ip
	ldrb r0, [r3]
	subs r0, #2
	ldr r5, [sp, #4]
	cmp r5, r0
	bge _080B4E24
	adds r0, r5, #0
	adds r0, #2
	lsls r0, r0, #1
	adds r0, r1, r0
	movs r1, #0
	ldrsh r5, [r0, r1]
	b _080B4E26
_080B4E24:
	adds r5, r6, #0
_080B4E26:
	ldr r2, [sp, #8]
	str r2, [sp]
	ldr r0, [sp, #0x14]
	ldr r1, [sp, #0x18]
	mov r2, sb
	mov r3, r8
	bl sub_80A95B4
	str r0, [sp, #0xc]
	ldr r3, [sp, #8]
	str r3, [sp]
	adds r0, r7, #0
	ldr r1, [sp, #0x1c]
	adds r2, r6, #0
	adds r3, r5, #0
	bl sub_80A95B4
	str r0, [sp, #0x10]
	ldr r0, [sp, #8]
	str r0, [sp]
	ldr r0, [sp, #0x14]
	ldr r1, [sp, #0x18]
	mov r2, sb
	mov r3, r8
	bl sub_80A968C
	mov r8, r0
	ldr r1, [sp, #8]
	str r1, [sp]
	adds r0, r7, #0
	ldr r1, [sp, #0x1c]
	adds r2, r6, #0
	adds r3, r5, #0
	bl sub_80A968C
	adds r6, r0, #0
	mov r2, r8
	mov r0, r8
	muls r0, r2, r0
	adds r1, r6, #0
	muls r1, r6, r1
	adds r0, r0, r1
	bl Sqrt
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	ldr r3, [r4, #0x5c]
	adds r2, r3, r5
	str r2, [r4, #0x5c]
	ldr r0, [r4, #0x54]
	movs r1, #0x80
	lsls r1, r1, #0x11
	ands r0, r1
	cmp r0, #0
	beq _080B4EA8
	lsrs r1, r2, #0xc
	lsrs r0, r3, #0xc
	cmp r1, r0
	bls _080B4EA8
	ldr r0, [sp, #0xc]
	ldr r1, [sp, #0x10]
	movs r2, #0
	adds r3, r4, #0
	bl sub_80B4C34
_080B4EA8:
	adds r1, r5, #1
	movs r0, #0x80
	lsls r0, r0, #0xb
	bl __divsi3
	adds r1, r0, #0
	ldr r0, _080B4F38 @ =0x000001FF
	cmp r1, r0
	bgt _080B4EBE
	movs r1, #0x80
	lsls r1, r1, #2
_080B4EBE:
	ldr r2, [r4, #0x54]
	movs r0, #0x80
	lsls r0, r0, #5
	ands r0, r2
	cmp r0, #0
	beq _080B4ECC
	lsls r1, r1, #1
_080B4ECC:
	movs r0, #0x80
	lsls r0, r0, #0xd
	ands r2, r0
	cmp r2, #0
	beq _080B4ED8
	asrs r1, r1, #1
_080B4ED8:
	ldr r0, [r4, #0x50]
	adds r0, r0, r1
	str r0, [r4, #0x50]
	mov r3, r8
	lsls r0, r3, #0x10
	asrs r0, r0, #0x10
	lsls r1, r6, #0x10
	asrs r1, r1, #0x10
	bl ArcTan2
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x18
	adds r2, r4, #0
	adds r2, #0x62
	ldrb r0, [r2]
	cmp r0, #0
	beq _080B4F3C
	adds r0, r1, #0
	subs r0, #0x21
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0xbf
	bls _080B4F0A
	movs r5, #1
	mov sl, r5
_080B4F0A:
	cmp r0, #0x3f
	bhi _080B4F12
	movs r6, #2
	mov sl, r6
_080B4F12:
	adds r0, r1, #0
	subs r0, #0x61
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x3f
	bhi _080B4F22
	movs r7, #0
	mov sl, r7
_080B4F22:
	adds r0, r1, #0
	adds r0, #0x5f
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x3f
	bhi _080B4F32
	movs r0, #3
	mov sl, r0
_080B4F32:
	movs r0, #0
	strb r0, [r2]
	b _080B4F7C
	.align 2, 0
_080B4F38: .4byte 0x000001FF
_080B4F3C:
	adds r0, r1, #0
	subs r0, #0x1d
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0xc7
	bls _080B4F4C
	movs r2, #1
	mov sl, r2
_080B4F4C:
	adds r0, r1, #0
	subs r0, #0x25
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x37
	bhi _080B4F5C
	movs r3, #2
	mov sl, r3
_080B4F5C:
	adds r0, r1, #0
	subs r0, #0x65
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x37
	bhi _080B4F6C
	movs r5, #0
	mov sl, r5
_080B4F6C:
	adds r0, r1, #0
	adds r0, #0x5b
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x37
	bhi _080B4F7C
	movs r6, #3
	mov sl, r6
_080B4F7C:
	adds r0, r4, #0
	mov r1, sl
	bl sub_80B4CD0
	ldr r1, [r4, #0x54]
	movs r0, #0x80
	lsls r0, r0, #8
	ands r1, r0
	movs r7, #0x4a
	adds r7, r7, r4
	mov sb, r7
	adds r6, r4, #0
	adds r6, #0x4c
	cmp r1, #0
	beq _080B4FF8
	ldr r1, _080B500C @ =gAnims
	movs r0, #4
	ldrsh r2, [r1, r0]
	ldr r3, [sp, #0xc]
	subs r0, r3, r2
	adds r5, r0, #0
	subs r5, #8
	movs r7, #6
	ldrsh r1, [r1, r7]
	ldr r3, [sp, #0x10]
	subs r0, r3, r1
	adds r3, r0, #0
	subs r3, #0xc
	mov r7, sb
	movs r0, #0
	ldrsh r7, [r7, r0]
	subs r2, r7, r2
	subs r2, #8
	movs r0, #0
	ldrsh r7, [r6, r0]
	subs r1, r7, r1
	subs r1, #0xc
	cmp r5, #0x6f
	bgt _080B4FCE
	cmp r5, r2
	blt _080B4FE6
_080B4FCE:
	cmp r5, #0x80
	ble _080B4FD6
	cmp r5, r2
	bgt _080B4FE6
_080B4FD6:
	cmp r3, #0x5f
	bgt _080B4FDE
	cmp r3, r1
	blt _080B4FE6
_080B4FDE:
	cmp r3, #0x40
	ble _080B4FF8
	cmp r3, r1
	ble _080B4FF8
_080B4FE6:
	subs r0, r5, r2
	subs r1, r3, r1
	bl sub_80B4104
	movs r1, #1
	rsbs r1, r1, #0
	adds r0, r1, #0
	bl sub_80B4170
_080B4FF8:
	ldr r0, [r4, #0x54]
	movs r1, #0x80
	lsls r1, r1, #0x12
	ands r0, r1
	cmp r0, #0
	beq _080B5098
	movs r0, #1
	bl sub_80B3DE4
	b _080B5098
	.align 2, 0
_080B500C: .4byte gAnims
_080B5010:
	lsls r1, r1, #1
	adds r0, r4, #0
	adds r0, #0x2e
	adds r0, r0, r1
	movs r3, #0
	ldrsh r2, [r0, r3]
	str r2, [sp, #0xc]
	adds r0, r4, #0
	adds r0, #0x3c
	adds r0, r0, r1
	movs r6, #0
	ldrsh r5, [r0, r6]
	str r5, [sp, #0x10]
	ldr r1, [r4, #0x54]
	movs r0, #0xc0
	lsls r0, r0, #2
	ands r1, r0
	movs r0, #0x80
	lsls r0, r0, #1
	cmp r1, r0
	beq _080B505E
	cmp r1, r0
	bhi _080B5044
	cmp r1, #0
	beq _080B5066
	b _080B5076
_080B5044:
	movs r0, #0x80
	lsls r0, r0, #2
	cmp r1, r0
	bne _080B5076
	adds r1, r4, #0
	adds r1, #0x62
	movs r0, #1
	strb r0, [r1]
	adds r0, r4, #0
	movs r1, #4
	bl sub_80B4CD0
	b _080B5076
_080B505E:
	ldr r0, [r4, #0x58]
	bl sub_806E2C8
	b _080B5076
_080B5066:
	adds r1, r4, #0
	adds r1, #0x62
	movs r0, #1
	strb r0, [r1]
	adds r0, r4, #0
	movs r1, #0xf
	bl sub_80B4CD0
_080B5076:
	ldr r1, [r4, #0x54]
	movs r0, #0x80
	lsls r0, r0, #0x12
	ands r1, r0
	adds r7, r4, #0
	adds r7, #0x61
	str r7, [sp, #0x20]
	movs r0, #0x4a
	adds r0, r0, r4
	mov sb, r0
	adds r6, r4, #0
	adds r6, #0x4c
	cmp r1, #0
	beq _080B5098
	movs r0, #0
	bl sub_80B3DE4
_080B5098:
	mov r1, sp
	ldrh r2, [r1, #0xc]
	mov r1, sb
	strh r2, [r1]
	mov r3, sp
	ldrh r3, [r3, #0x10]
	strh r3, [r6]
	ldr r0, [r4, #0x58]
	ldr r2, _080B50CC @ =gAnims
	movs r5, #4
	ldrsh r1, [r2, r5]
	ldr r6, [sp, #0xc]
	subs r1, r6, r1
	subs r1, #8
	movs r7, #6
	ldrsh r2, [r2, r7]
	ldr r3, [sp, #0x10]
	subs r2, r3, r2
	subs r2, #0xc
	bl sub_806E2E8
	ldr r0, [r4, #0x58]
	bl sub_806E2C8
	b _080B50DA
	.align 2, 0
_080B50CC: .4byte gAnims
_080B50D0:
	ldr r0, [r4, #0x58]
	bl sub_806E2A0
	adds r4, #0x61
	str r4, [sp, #0x20]
_080B50DA:
	mov r5, sp
	ldrb r6, [r5, #4]
	ldr r5, [sp, #0x20]
	strb r6, [r5]
	add sp, #0x24
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_80B50F4
sub_80B50F4: @ 0x080B50F4
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x58]
	cmp r0, #0
	beq _080B5102
	bl sub_806D4BC
_080B5102:
	ldr r0, [r4, #0x54]
	movs r1, #0x80
	lsls r1, r1, #0x12
	ands r0, r1
	cmp r0, #0
	beq _080B5114
	movs r0, #0
	bl sub_80B3DE4
_080B5114:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_80B511C
sub_80B511C: @ 0x080B511C
	push {lr}
	adds r1, r0, #0
	ldr r0, _080B512C @ =gUnk_08DB0EE4
	bl Proc_Start
	pop {r1}
	bx r1
	.align 2, 0
_080B512C: .4byte gUnk_08DB0EE4

	thumb_func_start sub_80B5130
sub_80B5130: @ 0x080B5130
	movs r1, #0
	adds r0, #0x2c
	movs r2, #4
_080B5136:
	str r1, [r0, #4]
	strb r1, [r0, #8]
	strh r1, [r0, #2]
	strh r1, [r0]
	adds r0, #0xc
	subs r2, #1
	cmp r2, #0
	bge _080B5136
	bx lr

	thumb_func_start sub_80B5148
sub_80B5148: @ 0x080B5148
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	movs r6, #0
	movs r0, #0
	strh r0, [r4, #0x30]
	ldr r5, _080B5198 @ =gUnk_08DB0F0C
	adds r0, r5, #0
	adds r1, r4, #0
	bl Proc_Start
	str r0, [r4, #0x34]
	adds r0, r5, #0
	adds r1, r4, #0
	bl Proc_Start
	str r0, [r4, #0x38]
	adds r0, r5, #0
	adds r1, r4, #0
	bl Proc_Start
	str r0, [r4, #0x3c]
	adds r0, r5, #0
	adds r1, r4, #0
	bl Proc_Start
	str r0, [r4, #0x40]
	ldr r0, [r4, #0x14]
	str r0, [r4, #0x2c]
	adds r0, r4, #0
	adds r0, #0x44
	strb r6, [r0]
	adds r0, #1
	strb r6, [r0]
	adds r0, #2
	strb r6, [r0]
	adds r4, #0x48
	strb r6, [r4]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080B5198: .4byte gUnk_08DB0F0C

	thumb_func_start sub_80B519C
sub_80B519C: @ 0x080B519C
	push {r4, r5, lr}
	adds r3, r1, #0
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r0, r3, #0
	adds r0, #0x30
	adds r0, r0, r1
	ldr r0, [r0]
	cmp r0, #0
	beq _080B5206
	adds r5, r0, #0
	adds r3, r3, r1
	movs r0, #0x2c
	ldrsh r1, [r3, r0]
	ldr r2, _080B51F4 @ =gAnims
	movs r4, #4
	ldrsh r0, [r2, r4]
	subs r4, r1, r0
	movs r0, #0x2e
	ldrsh r1, [r3, r0]
	movs r3, #6
	ldrsh r0, [r2, r3]
	subs r3, r1, r0
	adds r1, r4, #0
	adds r1, #0x1f
	movs r0, #0x97
	lsls r0, r0, #1
	cmp r1, r0
	bhi _080B51FC
	movs r0, #0x20
	rsbs r0, r0, #0
	cmp r3, r0
	ble _080B51FC
	cmp r3, #0xbf
	bgt _080B51FC
	ldr r0, _080B51F8 @ =0x000001FF
	ands r4, r0
	str r4, [r5, #0x54]
	movs r0, #0xff
	ands r3, r0
	str r3, [r5, #0x58]
	b _080B5206
	.align 2, 0
_080B51F4: .4byte gAnims
_080B51F8: .4byte 0x000001FF
_080B51FC:
	movs r0, #0x80
	lsls r0, r0, #1
	str r0, [r5, #0x54]
	movs r0, #0
	str r0, [r5, #0x58]
_080B5206:
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start sub_80B520C
sub_80B520C: @ 0x080B520C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	ldr r0, [r0, #0x40]
	mov sb, r0
	movs r0, #0xff
	mov r8, r0
	movs r1, #0x10
	mov ip, r1
	mov r6, sb
	adds r6, #0x2e
	mov r7, sb
	adds r7, #0x2c
	movs r0, #0
	str r0, [sp]
	movs r1, #3
	mov sl, r1
_080B5234:
	mov r0, sb
	adds r0, #0x30
	ldr r1, [sp]
	adds r0, r0, r1
	ldr r0, [r0]
	cmp r0, #0
	beq _080B530A
	adds r5, r0, #0
	movs r0, #0
	ldrsh r4, [r7, r0]
	adds r3, r6, #0
	ldrh r2, [r6]
	movs r0, #0x80
	lsls r0, r0, #4
	ands r0, r2
	cmp r0, #0
	beq _080B52A6
	mov r1, r8
	ands r1, r2
	cmp r1, #0xf
	bhi _080B52A6
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r2
	cmp r0, #0
	beq _080B527C
	mov r0, ip
	subs r1, r0, r1
	lsls r0, r1, #5
	muls r0, r1, r0
	cmp r0, #0
	bge _080B5276
	adds r0, #0xff
_080B5276:
	asrs r0, r0, #8
	adds r0, r4, r0
	strh r0, [r5, #0x34]
_080B527C:
	ldrh r1, [r3]
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r1
	cmp r0, #0
	beq _080B52A0
	mov r0, r8
	ands r0, r1
	mov r1, ip
	subs r0, r1, r0
	lsls r1, r0, #5
	muls r0, r1, r0
	cmp r0, #0
	bge _080B529A
	adds r0, #0xff
_080B529A:
	asrs r0, r0, #8
	subs r0, r4, r0
	strh r0, [r5, #0x34]
_080B52A0:
	ldrh r0, [r3]
	adds r0, #1
	strh r0, [r3]
_080B52A6:
	ldrh r2, [r3]
	movs r0, #0x80
	lsls r0, r0, #5
	ands r0, r2
	cmp r0, #0
	beq _080B530A
	mov r1, r8
	ands r1, r2
	cmp r1, #0xf
	bhi _080B530A
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r2
	cmp r0, #0
	beq _080B52DC
	adds r2, r4, #0
	subs r2, #0x20
	mov r0, ip
	subs r1, r0, r1
	lsls r0, r1, #5
	muls r0, r1, r0
	cmp r0, #0
	bge _080B52D6
	adds r0, #0xff
_080B52D6:
	asrs r0, r0, #8
	adds r0, r2, r0
	strh r0, [r5, #0x34]
_080B52DC:
	ldrh r1, [r3]
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r1
	cmp r0, #0
	beq _080B5304
	adds r2, r4, #0
	adds r2, #0x20
	mov r0, r8
	ands r0, r1
	mov r1, ip
	subs r0, r1, r0
	lsls r1, r0, #5
	muls r0, r1, r0
	cmp r0, #0
	bge _080B52FE
	adds r0, #0xff
_080B52FE:
	asrs r0, r0, #8
	subs r0, r2, r0
	strh r0, [r5, #0x34]
_080B5304:
	ldrh r0, [r3]
	adds r0, #1
	strh r0, [r3]
_080B530A:
	adds r6, #0xc
	adds r7, #0xc
	ldr r0, [sp]
	adds r0, #0xc
	str r0, [sp]
	movs r1, #1
	rsbs r1, r1, #0
	add sl, r1
	mov r0, sl
	cmp r0, #0
	bge _080B5234
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_80B5330
sub_80B5330: @ 0x080B5330
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	adds r7, r0, #0
	ldr r4, _080B5428 @ =gDispIo
	adds r1, r4, #0
	adds r1, #0x3c
	movs r0, #0x3f
	ldrb r2, [r1]
	ands r0, r2
	strb r0, [r1]
	adds r5, r7, #0
	adds r5, #0x45
	ldrb r1, [r5]
	lsrs r2, r1, #1
	adds r0, r4, #0
	adds r0, #0x44
	movs r3, #0
	strb r2, [r0]
	movs r0, #0x10
	subs r0, r0, r2
	adds r2, r4, #0
	adds r2, #0x45
	strb r0, [r2]
	adds r0, r4, #0
	adds r0, #0x46
	strb r3, [r0]
	adds r0, r7, #0
	adds r0, #0x44
	ldrb r2, [r0]
	adds r1, r2, r1
	strb r1, [r5]
	lsls r1, r1, #0x18
	cmp r1, #0
	bne _080B53C6
	movs r6, #0
	mov r8, r0
	movs r0, #1
	rsbs r0, r0, #0
	mov sb, r0
	movs r4, #0
	movs r5, #0
_080B5386:
	ldr r1, [r7, #0x40]
	adds r0, r1, #0
	adds r0, #0x30
	adds r0, r0, r4
	ldr r0, [r0]
	cmp r0, #0
	beq _080B53B8
	adds r0, r1, r4
	adds r0, #0x34
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, sb
	bne _080B53B8
	adds r0, r6, #0
	bl EndFaceById
	ldr r0, [r7, #0x40]
	adds r0, r0, r4
	adds r0, #0x34
	strb r5, [r0]
	ldr r0, [r7, #0x40]
	adds r0, #0x30
	adds r0, r0, r4
	str r5, [r0]
_080B53B8:
	adds r4, #0xc
	adds r6, #1
	cmp r6, #3
	ble _080B5386
	movs r0, #0
	mov r1, r8
	strb r0, [r1]
_080B53C6:
	adds r0, r7, #0
	adds r0, #0x45
	ldrb r0, [r0]
	cmp r0, #0x20
	bne _080B541A
	movs r2, #0x44
	adds r2, r2, r7
	mov r8, r2
	movs r5, #0
	movs r6, #3
_080B53DA:
	ldr r1, [r7, #0x40]
	adds r0, r1, #0
	adds r0, #0x30
	adds r0, r0, r5
	ldr r4, [r0]
	cmp r4, #0
	beq _080B540C
	adds r0, r1, r5
	adds r0, #0x34
	ldrb r0, [r0]
	cmp r0, #1
	bne _080B540C
	adds r0, r4, #0
	bl GetFaceDisp
	ldr r1, _080B542C @ =0xFFFFFBFF
	ands r1, r0
	adds r0, r4, #0
	bl SetFaceDisp
	ldr r0, [r7, #0x40]
	adds r0, r0, r5
	adds r0, #0x34
	movs r1, #0
	strb r1, [r0]
_080B540C:
	adds r5, #0xc
	subs r6, #1
	cmp r6, #0
	bge _080B53DA
	movs r0, #0
	mov r1, r8
	strb r0, [r1]
_080B541A:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B5428: .4byte gDispIo
_080B542C: .4byte 0xFFFFFBFF

	thumb_func_start sub_80B5430
sub_80B5430: @ 0x080B5430
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	adds r5, r0, #0
	adds r4, r1, #0
	lsls r2, r2, #0x18
	lsrs r3, r2, #0x18
	movs r0, #0x1f
	mov r8, r0
	movs r2, #0xf8
	lsls r2, r2, #2
	mov ip, r2
	movs r7, #0xf8
	lsls r7, r7, #7
	mov sb, r7
	movs r6, #0xf
_080B5452:
	ldrh r2, [r4]
	movs r0, #0x1f
	ands r0, r2
	adds r1, r0, #0
	muls r1, r3, r1
	asrs r1, r1, #5
	mov r0, r8
	ands r1, r0
	mov r0, ip
	ands r0, r2
	muls r0, r3, r0
	asrs r0, r0, #5
	mov r7, ip
	ands r0, r7
	adds r1, r1, r0
	mov r0, sb
	ands r0, r2
	muls r0, r3, r0
	asrs r0, r0, #5
	mov r2, sb
	ands r0, r2
	adds r1, r1, r0
	strh r1, [r5]
	adds r5, #2
	adds r4, #2
	subs r6, #1
	cmp r6, #0
	bge _080B5452
	bl EnablePalSync
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_80B549C
sub_80B549C: @ 0x080B549C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r6, r0, #0
	adds r4, r6, #0
	adds r4, #0x48
	adds r5, r6, #0
	adds r5, #0x47
	ldrb r1, [r4]
	ldrb r2, [r5]
	adds r0, r1, r2
	strb r0, [r4]
	ldr r0, _080B5550 @ =gPal + 0x340
	adds r1, r6, #0
	adds r1, #0x46
	ldrb r1, [r1]
	lsls r1, r1, #5
	ldr r3, _080B5554 @ =0xFFFFFEC0
	adds r2, r0, r3
	adds r1, r1, r2
	ldrb r2, [r4]
	bl sub_80B5430
	ldrb r0, [r4]
	cmp r0, #0
	bne _080B550A
	movs r4, #0
	adds r7, r5, #0
	movs r0, #1
	rsbs r0, r0, #0
	mov r8, r0
	movs r5, #0
_080B54DC:
	ldr r1, [r6, #0x34]
	adds r0, r1, #0
	adds r0, #0x30
	adds r0, r0, r5
	ldr r0, [r0]
	cmp r0, #0
	beq _080B54FE
	adds r0, r1, r5
	adds r0, #0x34
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, r8
	bne _080B54FE
	adds r0, r4, #0
	bl sub_80B58FC
_080B54FE:
	adds r5, #0xc
	adds r4, #1
	cmp r4, #3
	ble _080B54DC
	movs r0, #0
	strb r0, [r7]
_080B550A:
	adds r0, r6, #0
	adds r0, #0x48
	ldrb r0, [r0]
	cmp r0, #0x20
	bne _080B5544
	adds r7, r6, #0
	adds r7, #0x47
	movs r5, #0x2c
	movs r4, #3
_080B551C:
	ldr r0, [r6, #0x34]
	adds r1, r0, r5
	ldr r2, [r1, #4]
	cmp r2, #0
	beq _080B5538
	ldrb r3, [r1, #8]
	cmp r3, #1
	bne _080B5538
	movs r0, #0
	strb r0, [r1, #8]
	ldr r0, [r2, #0x58]
	ldrb r1, [r1, #9]
	bl sub_806EA0C
_080B5538:
	adds r5, #0xc
	subs r4, #1
	cmp r4, #0
	bge _080B551C
	movs r0, #0
	strb r0, [r7]
_080B5544:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B5550: .4byte gPal + 0x340
_080B5554: .4byte 0xFFFFFEC0

	thumb_func_start sub_80B5558
sub_80B5558: @ 0x080B5558
	push {r4, r5, r6, r7, lr}
	sub sp, #0x38
	adds r5, r0, #0
	ldr r1, _080B55F4 @ =gUnk_08622BEC
	mov r0, sp
	movs r2, #0x37
	bl memcpy
	ldrh r0, [r5, #0x30]
	adds r0, #1
	strh r0, [r5, #0x30]
	add r0, sp
	ldrb r0, [r0]
	cmp r0, #0xff
	bne _080B557A
	movs r0, #0
	strh r0, [r5, #0x30]
_080B557A:
	ldrh r0, [r5, #0x30]
	add r0, sp
	ldrb r0, [r0]
	lsls r4, r0, #5
	ldr r0, _080B55F8 @ =gUnk_0844F64C
	adds r0, r4, r0
	movs r1, #0x80
	lsls r1, r1, #2
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r0, _080B55FC @ =gUnk_0844F5CC
	adds r4, r4, r0
	movs r1, #0x88
	lsls r1, r1, #2
	adds r0, r4, #0
	movs r2, #0x20
	bl ApplyPaletteExt
	movs r4, #0
	adds r6, r5, #0
	adds r6, #0x44
	adds r7, r5, #0
	adds r7, #0x47
_080B55AA:
	ldr r1, [r5, #0x38]
	adds r0, r4, #0
	bl sub_80B519C
	adds r4, #1
	cmp r4, #3
	ble _080B55AA
	movs r4, #0
_080B55BA:
	ldr r1, [r5, #0x3c]
	adds r0, r4, #0
	bl sub_80B519C
	adds r4, #1
	cmp r4, #4
	ble _080B55BA
	adds r0, r5, #0
	bl sub_80B520C
	movs r0, #0
	ldrsb r0, [r6, r0]
	cmp r0, #0
	beq _080B55DC
	adds r0, r5, #0
	bl sub_80B5330
_080B55DC:
	movs r0, #0
	ldrsb r0, [r7, r0]
	cmp r0, #0
	beq _080B55EA
	adds r0, r5, #0
	bl sub_80B549C
_080B55EA:
	add sp, #0x38
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B55F4: .4byte gUnk_08622BEC
_080B55F8: .4byte gUnk_0844F64C
_080B55FC: .4byte gUnk_0844F5CC

	thumb_func_start sub_80B5600
sub_80B5600: @ 0x080B5600
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	movs r4, #0
	movs r5, #0
_080B5608:
	ldr r0, [r6, #0x38]
	adds r0, #0x30
	adds r0, r0, r5
	ldr r0, [r0]
	cmp r0, #0
	beq _080B561A
	adds r0, r4, #0
	bl sub_80B5A48
_080B561A:
	adds r5, #0xc
	adds r4, #1
	cmp r4, #3
	ble _080B5608
	movs r4, #0
	movs r5, #0
_080B5626:
	ldr r0, [r6, #0x3c]
	adds r0, #0x30
	adds r0, r0, r5
	ldr r0, [r0]
	cmp r0, #0
	beq _080B5638
	adds r0, r4, #0
	bl sub_80B5B34
_080B5638:
	adds r5, #0xc
	adds r4, #1
	cmp r4, #4
	ble _080B5626
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_80B5648
sub_80B5648: @ 0x080B5648
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r4, r0, #0
	ldr r0, _080B56A4 @ =gUnk_08DB0F24
	bl Proc_Find
	adds r5, r0, #0
	lsls r0, r4, #1
	adds r0, r0, r4
	lsls r0, r0, #2
	adds r0, #0x2c
	ldr r1, [r5, #0x34]
	adds r6, r1, r0
	cmp r5, #0
	beq _080B569C
	ldr r7, [r6, #4]
	cmp r7, #0
	beq _080B569C
	movs r4, #0
	str r4, [sp]
	ldr r1, _080B56A8 @ =gPal + 0x340
	ldr r2, _080B56AC @ =0x01000008
	mov r0, sp
	bl CpuFastSet
	bl EnablePalSync
	ldr r0, [r7, #0x58]
	movs r1, #0xa
	bl sub_806EA0C
	movs r1, #1
	strb r1, [r6, #8]
	ldrb r0, [r6, #9]
	adds r2, r5, #0
	adds r2, #0x46
	strb r0, [r2]
	adds r0, r5, #0
	adds r0, #0x47
	strb r1, [r0]
	adds r0, #1
	strb r4, [r0]
_080B569C:
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B56A4: .4byte gUnk_08DB0F24
_080B56A8: .4byte gPal + 0x340
_080B56AC: .4byte 0x01000008

	thumb_func_start sub_80B56B0
sub_80B56B0: @ 0x080B56B0
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	ldr r0, _080B571C @ =gUnk_08DB0F24
	bl Proc_Find
	adds r5, r0, #0
	lsls r0, r4, #1
	adds r0, r0, r4
	lsls r0, r0, #2
	adds r0, #0x2c
	ldr r1, [r5, #0x34]
	adds r4, r1, r0
	cmp r5, #0
	beq _080B5714
	ldr r6, [r4, #4]
	cmp r6, #0
	beq _080B5714
	ldrb r1, [r4, #9]
	lsls r0, r1, #5
	ldr r1, _080B5720 @ =gPal + 0x200
	adds r0, r0, r1
	movs r2, #0xa0
	lsls r2, r2, #1
	adds r1, r1, r2
	movs r2, #8
	bl CpuFastSet
	bl EnablePalSync
	ldr r0, [r6, #0x58]
	movs r1, #0xa
	bl sub_806EA0C
	movs r1, #0xff
	ldrb r0, [r4, #8]
	orrs r0, r1
	strb r0, [r4, #8]
	ldrb r0, [r4, #9]
	adds r2, r5, #0
	adds r2, #0x46
	strb r0, [r2]
	adds r0, r5, #0
	adds r0, #0x47
	ldrb r2, [r0]
	orrs r1, r2
	strb r1, [r0]
	adds r1, r5, #0
	adds r1, #0x48
	movs r0, #0x20
	strb r0, [r1]
_080B5714:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080B571C: .4byte gUnk_08DB0F24
_080B5720: .4byte gPal + 0x200

	thumb_func_start sub_80B5724
sub_80B5724: @ 0x080B5724
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	mov sb, r0
	adds r7, r1, #0
	mov r8, r2
	mov sl, r3
	ldr r0, _080B577C @ =gUnk_08DB0F24
	bl Proc_Find
	adds r4, r0, #0
	mov r1, sb
	lsls r0, r1, #1
	add r0, sb
	lsls r0, r0, #2
	adds r0, #0x2c
	ldr r1, [r4, #0x34]
	adds r1, r1, r0
	str r1, [sp, #4]
	movs r1, #0xf0
	lsls r1, r1, #0xc
	mov r2, sl
	ands r1, r2
	movs r0, #0x80
	lsls r0, r0, #0xb
	cmp r1, r0
	beq _080B57CC
	cmp r1, r0
	bhi _080B578A
	movs r0, #0x80
	lsls r0, r0, #0xa
	cmp r1, r0
	beq _080B57BA
	cmp r1, r0
	bhi _080B5780
	movs r0, #0x80
	lsls r0, r0, #9
	cmp r1, r0
	beq _080B57B2
	b _080B57EA
	.align 2, 0
_080B577C: .4byte gUnk_08DB0F24
_080B5780:
	movs r0, #0xc0
	lsls r0, r0, #0xa
	cmp r1, r0
	beq _080B57C2
	b _080B57EA
_080B578A:
	movs r0, #0xc0
	lsls r0, r0, #0xb
	cmp r1, r0
	beq _080B57DE
	cmp r1, r0
	bhi _080B57A0
	movs r0, #0xa0
	lsls r0, r0, #0xb
	cmp r1, r0
	beq _080B57D6
	b _080B57EA
_080B57A0:
	movs r0, #0xe0
	lsls r0, r0, #0xb
	cmp r1, r0
	beq _080B57E4
	movs r0, #0x80
	lsls r0, r0, #0xc
	cmp r1, r0
	beq _080B57E8
	b _080B57EA
_080B57B2:
	subs r7, #8
	movs r0, #8
	add r8, r0
	b _080B57EA
_080B57BA:
	adds r7, #8
	movs r1, #8
	add r8, r1
	b _080B57EA
_080B57C2:
	subs r7, #8
	movs r2, #8
	rsbs r2, r2, #0
	add r8, r2
	b _080B57EA
_080B57CC:
	adds r7, #8
	movs r0, #8
	rsbs r0, r0, #0
	add r8, r0
	b _080B57EA
_080B57D6:
	movs r1, #0xe
	rsbs r1, r1, #0
	add r8, r1
	b _080B57EA
_080B57DE:
	movs r2, #0xe
	add r8, r2
	b _080B57EA
_080B57E4:
	subs r7, #0xe
	b _080B57EA
_080B57E8:
	adds r7, #0xe
_080B57EA:
	ldr r1, [sp, #4]
	ldr r0, [r1, #4]
	cmp r0, #0
	bne _080B58A4
	ldr r0, _080B58A0 @ =gUnk_08DB0EE4
	adds r1, r4, #0
	bl Proc_Start
	adds r6, r0, #0
	ldr r1, [r4, #0x34]
	mov r2, sb
	lsls r0, r2, #1
	add r0, sb
	lsls r0, r0, #2
	adds r1, #0x30
	adds r1, r1, r0
	str r6, [r1]
	movs r0, #0xff
	mov r2, sl
	ands r2, r0
	movs r3, #0xa0
	lsls r3, r3, #2
	mov r0, sl
	lsrs r4, r0, #0xd
	movs r0, #3
	ands r0, r4
	adds r0, #0xc
	str r0, [sp]
	movs r0, #0
	movs r1, #0
	bl sub_806C4A0
	str r0, [r6, #0x58]
	bl sub_806E2A0
	adds r1, r6, #0
	adds r1, #0x29
	movs r0, #2
	strb r0, [r1]
	ldr r0, [r6, #0x58]
	movs r1, #2
	bl sub_806C738
	ldr r0, [r6, #0x58]
	bl sub_806C474
	adds r0, r6, #0
	adds r0, #0x2b
	mov r1, sl
	strb r1, [r0]
	movs r0, #3
	ands r4, r0
	adds r4, #0xc
	adds r5, r6, #0
	adds r5, #0x2c
	strb r4, [r5]
	ldr r0, [r6, #0x58]
	adds r0, #0x46
	movs r2, #0
	mov ip, r2
	movs r1, #0x80
	lsls r1, r1, #3
	strh r1, [r0]
	ldr r1, [r6, #0x58]
	ldr r3, [r1, #0x30]
	ldr r2, [r1, #0x34]
	movs r0, #0xf
	ldrb r4, [r2, #1]
	ands r0, r4
	lsls r0, r0, #0xc
	ldrh r2, [r2, #2]
	adds r0, r2, r0
	adds r1, #0x46
	ldrh r1, [r1]
	adds r0, r1, r0
	strh r0, [r3, #0x22]
	adds r0, r6, #0
	adds r0, #0x4a
	strh r7, [r0]
	adds r0, #2
	mov r1, r8
	strh r1, [r0]
	ldrb r0, [r5]
	ldr r2, [sp, #4]
	strb r0, [r2, #9]
	mov r4, ip
	strb r4, [r2, #8]
	mov r0, sb
	bl sub_80B5648
	b _080B58B4
	.align 2, 0
_080B58A0: .4byte gUnk_08DB0EE4
_080B58A4:
	ldr r1, [r4, #0x34]
	mov r2, sb
	lsls r0, r2, #1
	add r0, sb
	lsls r0, r0, #2
	adds r1, #0x30
	adds r1, r1, r0
	ldr r6, [r1]
_080B58B4:
	ldr r0, [r6, #0x58]
	ldr r2, [r0, #0x30]
	mov r4, sl
	lsrs r0, r4, #0xa
	movs r1, #3
	ands r0, r1
	adds r0, #6
	strh r0, [r2, #0x1e]
	str r4, [r6, #0x54]
	adds r2, r6, #0
	adds r2, #0x2a
	ldrb r0, [r2]
	lsls r1, r0, #1
	adds r0, r6, #0
	adds r0, #0x2e
	adds r0, r0, r1
	strh r7, [r0]
	ldrb r4, [r2]
	lsls r1, r4, #1
	adds r0, r6, #0
	adds r0, #0x3c
	adds r0, r0, r1
	mov r1, r8
	strh r1, [r0]
	ldrb r0, [r2]
	adds r0, #1
	strb r0, [r2]
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_80B58FC
sub_80B58FC: @ 0x080B58FC
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r0, _080B5930 @ =gUnk_08DB0F24
	bl Proc_Find
	adds r5, r0, #0
	ldr r1, [r5, #0x34]
	lsls r0, r4, #1
	adds r0, r0, r4
	lsls r4, r0, #2
	adds r1, #0x30
	adds r1, r1, r4
	ldr r0, [r1]
	cmp r0, #0
	beq _080B5928
	bl Proc_End
	ldr r0, [r5, #0x34]
	adds r0, #0x30
	adds r0, r0, r4
	movs r1, #0
	str r1, [r0]
_080B5928:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080B5930: .4byte gUnk_08DB0F24

	thumb_func_start sub_80B5934
sub_80B5934: @ 0x080B5934
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _080B596C @ =gUnk_08DB0F24
	bl Proc_Find
	cmp r0, #0
	beq _080B5964
	ldr r1, [r0, #0x34]
	lsls r0, r4, #1
	adds r0, r0, r4
	lsls r0, r0, #2
	adds r1, #0x30
	adds r1, r1, r0
	ldr r0, [r1]
	cmp r0, #0
	beq _080B5964
	ldr r0, [r0, #0x58]
	ldr r1, [r0, #0x30]
	movs r2, #0x80
	lsls r2, r2, #3
	adds r0, r2, #0
	ldrh r2, [r1, #0x22]
	orrs r0, r2
	strh r0, [r1, #0x22]
_080B5964:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080B596C: .4byte gUnk_08DB0F24

	thumb_func_start sub_80B5970
sub_80B5970: @ 0x080B5970
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _080B59A8 @ =gUnk_08DB0F24
	bl Proc_Find
	cmp r0, #0
	beq _080B59A0
	ldr r1, [r0, #0x34]
	lsls r0, r4, #1
	adds r0, r0, r4
	lsls r0, r0, #2
	adds r1, #0x30
	adds r1, r1, r0
	ldr r0, [r1]
	cmp r0, #0
	beq _080B59A0
	ldr r0, [r0, #0x58]
	ldr r1, [r0, #0x30]
	movs r2, #0x80
	lsls r2, r2, #3
	adds r0, r2, #0
	ldrh r2, [r1, #0x22]
	orrs r0, r2
	strh r0, [r1, #0x22]
_080B59A0:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080B59A8: .4byte gUnk_08DB0F24

	thumb_func_start sub_80B59AC
sub_80B59AC: @ 0x080B59AC
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #8
	adds r4, r0, #0
	lsls r1, r1, #0x10
	lsrs r7, r1, #0x10
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	mov r8, r2
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	mov sb, r3
	ldr r0, _080B5A3C @ =gUnk_08DB0F24
	bl Proc_Find
	adds r6, r0, #0
	ldr r1, [r6, #0x38]
	lsls r0, r4, #1
	adds r0, r0, r4
	lsls r5, r0, #2
	adds r1, r1, r5
	strh r7, [r1, #0x2c]
	ldr r0, [r6, #0x38]
	adds r0, r0, r5
	mov r1, r8
	strh r1, [r0, #0x2e]
	ldr r0, [r6, #0x38]
	adds r0, #0x30
	adds r0, r0, r5
	ldr r0, [r0]
	cmp r0, #0
	bne _080B5A2C
	lsls r1, r7, #0x10
	asrs r1, r1, #0x10
	ldr r3, _080B5A40 @ =gAnims
	movs r2, #4
	ldrsh r0, [r3, r2]
	subs r1, r1, r0
	mov r4, r8
	lsls r2, r4, #0x10
	asrs r2, r2, #0x10
	movs r4, #6
	ldrsh r0, [r3, r4]
	subs r2, r2, r0
	ldr r0, _080B5A44 @ =gUnk_0844C5A0
	movs r3, #0xf
	mov r4, sb
	ands r3, r4
	lsls r3, r3, #0xc
	movs r4, #0xe0
	lsls r4, r4, #4
	adds r3, r3, r4
	movs r4, #1
	str r4, [sp]
	movs r4, #7
	str r4, [sp, #4]
	bl StartSpriteAnimProc
	ldr r1, [r6, #0x38]
	adds r1, #0x30
	adds r1, r1, r5
	str r0, [r1]
_080B5A2C:
	add sp, #8
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B5A3C: .4byte gUnk_08DB0F24
_080B5A40: .4byte gAnims
_080B5A44: .4byte gUnk_0844C5A0

	thumb_func_start sub_80B5A48
sub_80B5A48: @ 0x080B5A48
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r0, _080B5A7C @ =gUnk_08DB0F24
	bl Proc_Find
	adds r5, r0, #0
	ldr r1, [r5, #0x38]
	lsls r0, r4, #1
	adds r0, r0, r4
	lsls r4, r0, #2
	adds r1, #0x30
	adds r1, r1, r4
	ldr r0, [r1]
	cmp r0, #0
	beq _080B5A6A
	bl EndSpriteAnimProc
_080B5A6A:
	ldr r0, [r5, #0x38]
	adds r0, #0x30
	adds r0, r0, r4
	movs r1, #0
	str r1, [r0]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080B5A7C: .4byte gUnk_08DB0F24

	thumb_func_start sub_80B5A80
sub_80B5A80: @ 0x080B5A80
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	adds r4, r0, #0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	mov r8, r1
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	mov sb, r2
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	mov sl, r3
	ldr r0, _080B5B28 @ =gUnk_08DB0F24
	bl Proc_Find
	adds r6, r0, #0
	ldr r1, [r6, #0x3c]
	lsls r0, r4, #1
	adds r0, r0, r4
	lsls r5, r0, #2
	adds r1, r1, r5
	mov r0, r8
	strh r0, [r1, #0x2c]
	ldr r0, [r6, #0x3c]
	adds r0, r0, r5
	mov r1, sb
	strh r1, [r0, #0x2e]
	ldr r0, [r6, #0x3c]
	adds r0, #0x30
	adds r0, r0, r5
	ldr r7, [r0]
	cmp r7, #0
	bne _080B5B16
	mov r2, r8
	lsls r1, r2, #0x10
	asrs r1, r1, #0x10
	ldr r3, _080B5B2C @ =gAnims
	movs r4, #4
	ldrsh r0, [r3, r4]
	subs r1, r1, r0
	mov r0, sb
	lsls r2, r0, #0x10
	asrs r2, r2, #0x10
	movs r4, #6
	ldrsh r0, [r3, r4]
	subs r2, r2, r0
	ldr r0, _080B5B30 @ =gUnk_0844C5A0
	movs r3, #0xf
	mov r4, sl
	ands r3, r4
	lsls r3, r3, #0xc
	movs r4, #0xe0
	lsls r4, r4, #4
	adds r3, r3, r4
	str r7, [sp]
	movs r4, #0xa
	str r4, [sp, #4]
	bl StartSpriteAnimProc
	ldr r1, [r6, #0x3c]
	adds r1, #0x30
	adds r1, r1, r5
	str r0, [r1]
	ldr r0, [r6, #0x38]
	adds r0, r0, r5
	mov r1, r8
	strh r1, [r0, #0x2c]
	ldr r0, [r6, #0x38]
	adds r0, r0, r5
	mov r2, sb
	strh r2, [r0, #0x2e]
_080B5B16:
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B5B28: .4byte gUnk_08DB0F24
_080B5B2C: .4byte gAnims
_080B5B30: .4byte gUnk_0844C5A0

	thumb_func_start sub_80B5B34
sub_80B5B34: @ 0x080B5B34
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r0, _080B5B68 @ =gUnk_08DB0F24
	bl Proc_Find
	adds r5, r0, #0
	ldr r1, [r5, #0x3c]
	lsls r0, r4, #1
	adds r0, r0, r4
	lsls r4, r0, #2
	adds r1, #0x30
	adds r1, r1, r4
	ldr r0, [r1]
	cmp r0, #0
	beq _080B5B56
	bl EndSpriteAnimProc
_080B5B56:
	ldr r0, [r5, #0x3c]
	adds r0, #0x30
	adds r0, r0, r4
	movs r1, #0
	str r1, [r0]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080B5B68: .4byte gUnk_08DB0F24

	thumb_func_start sub_80B5B6C
sub_80B5B6C: @ 0x080B5B6C
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #4
	adds r7, r0, #0
	mov sb, r1
	lsls r2, r2, #0x10
	lsrs r4, r2, #0x10
	adds r6, r4, #0
	ldr r0, _080B5C08 @ =gUnk_08DB0F24
	bl Proc_Find
	mov r8, r0
	lsls r0, r7, #1
	adds r0, r0, r7
	lsls r0, r0, #2
	adds r0, #0x2c
	mov r2, r8
	ldr r1, [r2, #0x40]
	adds r5, r1, r0
	ldr r2, _080B5C0C @ =0x030027CC
	ldr r0, _080B5C10 @ =0x0000FFE0
	ldrh r3, [r2]
	ands r0, r3
	ldr r1, _080B5C14 @ =0x0000E0FF
	ands r0, r1
	movs r3, #0x80
	lsls r3, r3, #4
	adds r1, r3, #0
	orrs r0, r1
	strh r0, [r2]
	ldr r0, [r5, #4]
	cmp r0, #0
	bne _080B5C96
	movs r0, #0xff
	ands r0, r4
	strh r0, [r5]
	movs r0, #0xff
	lsls r0, r0, #8
	ands r0, r4
	adds r0, r0, r1
	strh r0, [r5, #2]
	movs r0, #0
	ldrsh r2, [r5, r0]
	movs r0, #0x80
	lsls r0, r0, #3
	ands r0, r4
	ldr r1, _080B5C18 @ =0x00000442
	cmp r0, #0
	beq _080B5BD4
	adds r1, #1
_080B5BD4:
	movs r0, #0x80
	lsls r0, r0, #8
	ands r0, r4
	cmp r0, #0
	beq _080B5BE4
	movs r0, #0x80
	lsls r0, r0, #6
	orrs r1, r0
_080B5BE4:
	str r1, [sp]
	adds r0, r7, #0
	mov r1, sb
	movs r3, #0x28
	bl StartBmFace
	adds r2, r0, #0
	str r2, [r5, #4]
	movs r1, #0xc0
	lsls r1, r1, #7
	adds r0, r4, #0
	ands r0, r1
	cmp r0, r1
	bne _080B5C1C
	adds r1, r2, #0
	adds r1, #0x41
	movs r0, #6
	b _080B5C46
	.align 2, 0
_080B5C08: .4byte gUnk_08DB0F24
_080B5C0C: .4byte 0x030027CC
_080B5C10: .4byte 0x0000FFE0
_080B5C14: .4byte 0x0000E0FF
_080B5C18: .4byte 0x00000442
_080B5C1C:
	movs r0, #0x80
	lsls r0, r0, #7
	ands r0, r4
	cmp r0, #0
	beq _080B5C2E
	adds r1, r2, #0
	adds r1, #0x41
	movs r0, #5
	b _080B5C46
_080B5C2E:
	movs r0, #0x80
	lsls r0, r0, #6
	ands r6, r0
	cmp r6, #0
	beq _080B5C40
	adds r1, r2, #0
	adds r1, #0x41
	movs r0, #4
	b _080B5C46
_080B5C40:
	adds r1, r2, #0
	adds r1, #0x41
	movs r0, #3
_080B5C46:
	strb r0, [r1]
	adds r0, r7, #0
	movs r1, #5
	bl SetFaceBlinkControlById
	movs r6, #0
	movs r0, #1
	strb r0, [r5, #8]
	mov r1, r8
	adds r1, #0x44
	movs r0, #2
	strb r0, [r1]
	mov r4, r8
	adds r4, #0x45
	ldrb r1, [r4]
	cmp r1, #0x20
	bne _080B5C96
	strb r6, [r4]
	ldr r3, _080B5CA4 @ =gDispIo
	adds r2, r3, #0
	adds r2, #0x3c
	movs r0, #0x3f
	ldrb r1, [r2]
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r2]
	ldrb r1, [r4]
	adds r0, r3, #0
	adds r0, #0x44
	strb r1, [r0]
	movs r0, #0x10
	ldrb r4, [r4]
	subs r0, r0, r4
	adds r1, r3, #0
	adds r1, #0x45
	strb r0, [r1]
	adds r0, r3, #0
	adds r0, #0x46
	strb r6, [r0]
_080B5C96:
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B5CA4: .4byte gDispIo

	thumb_func_start sub_80B5CA8
sub_80B5CA8: @ 0x080B5CA8
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	adds r4, r0, #0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	mov sb, r1
	ldr r0, _080B5D54 @ =gUnk_08DB0F24
	bl Proc_Find
	adds r7, r0, #0
	lsls r0, r4, #1
	adds r0, r0, r4
	lsls r0, r0, #2
	adds r0, #0x2c
	ldr r1, [r7, #0x40]
	adds r5, r1, r0
	ldr r6, _080B5D58 @ =0x030027CC
	ldr r0, _080B5D5C @ =0x0000FFE0
	ldrh r1, [r6]
	ands r0, r1
	ldr r1, _080B5D60 @ =0x0000E0FF
	ands r0, r1
	movs r2, #0x80
	lsls r2, r2, #4
	adds r1, r2, #0
	orrs r0, r1
	strh r0, [r6]
	ldr r4, [r5, #4]
	cmp r4, #0
	beq _080B5D48
	movs r0, #0x80
	lsls r0, r0, #5
	mov r8, r0
	ldrh r1, [r5, #2]
	ands r0, r1
	cmp r0, #0
	bne _080B5D48
	adds r0, r4, #0
	bl GetFaceDisp
	movs r1, #0x80
	lsls r1, r1, #3
	orrs r1, r0
	adds r0, r4, #0
	bl SetFaceDisp
	movs r0, #0xff
	lsls r0, r0, #8
	mov r2, sb
	ands r0, r2
	add r0, r8
	strh r0, [r5, #2]
	movs r0, #0xff
	strb r0, [r5, #8]
	adds r1, r7, #0
	adds r1, #0x44
	movs r0, #0xfe
	strb r0, [r1]
	adds r1, #1
	ldrb r0, [r1]
	cmp r0, #0
	bne _080B5D48
	movs r0, #0x20
	strb r0, [r1]
	movs r0, #0x3f
	ldrb r2, [r6]
	ands r0, r2
	strb r0, [r6]
	ldrb r2, [r1]
	lsrs r0, r2, #1
	strb r0, [r6, #8]
	ldrb r1, [r1]
	lsrs r1, r1, #1
	movs r0, #0x10
	subs r0, r0, r1
	strb r0, [r6, #9]
	movs r0, #0
	strb r0, [r6, #0xa]
_080B5D48:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B5D54: .4byte gUnk_08DB0F24
_080B5D58: .4byte 0x030027CC
_080B5D5C: .4byte 0x0000FFE0
_080B5D60: .4byte 0x0000E0FF

	thumb_func_start sub_80B5D64
sub_80B5D64: @ 0x080B5D64
	push {lr}
	adds r1, r0, #0
	ldr r0, _080B5D74 @ =gUnk_08DB0F24
	bl Proc_Start
	pop {r1}
	bx r1
	.align 2, 0
_080B5D74: .4byte gUnk_08DB0F24

	thumb_func_start sub_80B5D78
sub_80B5D78: @ 0x080B5D78
	push {lr}
	ldr r0, _080B5D84 @ =gUnk_08DB0F24
	bl Proc_EndEach
	pop {r0}
	bx r0
	.align 2, 0
_080B5D84: .4byte gUnk_08DB0F24

	thumb_func_start nullsub_5
nullsub_5: @ 0x080B5D88
	bx lr
	.align 2, 0

	thumb_func_start nullsub_6
nullsub_6: @ 0x080B5D8C
	bx lr
	.align 2, 0

	thumb_func_start nullsub_4
nullsub_4: @ 0x080B5D90
	bx lr
	.align 2, 0

	thumb_func_start nullsub_3
nullsub_3: @ 0x080B5D94
	bx lr
	.align 2, 0

	thumb_func_start sub_80B5D98
sub_80B5D98: @ 0x080B5D98
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r6, r1, #0
	adds r4, r2, #0
	ldr r0, _080B5DB8 @ =gUnk_08DB0F44
	bl Proc_Find
	adds r3, r0, #0
	adds r0, r4, #0
	adds r1, r5, #0
	adds r2, r6, #0
	bl sub_80B45DC
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080B5DB8: .4byte gUnk_08DB0F44

	thumb_func_start sub_80B5DBC
sub_80B5DBC: @ 0x080B5DBC
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	adds r6, r1, #0
	adds r7, r2, #0
	ldr r0, _080B5E00 @ =gUnk_08DB0F44
	bl Proc_Find
	adds r4, r0, #0
	cmp r4, #0
	beq _080B5DF8
	bl sub_80B41F0
	adds r1, r4, #0
	adds r1, #0x4c
	strh r0, [r1]
	bl sub_80B41FC
	adds r1, r4, #0
	adds r1, #0x4e
	strh r0, [r1]
	adds r0, r4, #0
	adds r0, #0x50
	strh r5, [r0]
	adds r0, #2
	strh r6, [r0]
	strh r7, [r4, #0x34]
	adds r0, r4, #0
	movs r1, #2
	bl Proc_Goto
_080B5DF8:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B5E00: .4byte gUnk_08DB0F44

	thumb_func_start sub_80B5E04
sub_80B5E04: @ 0x080B5E04
	push {r4, lr}
	adds r4, r0, #0
	bl sub_8007EF8
	movs r0, #0x80
	lsls r0, r0, #2
	movs r1, #2
	movs r2, #2
	bl InitSpriteTalk
	ldr r0, _080B5E4C @ =0x02000815
	ldrb r0, [r0]
	lsrs r1, r0, #3
	adds r1, #1
	movs r0, #1
	adds r2, r4, #0
	bl sub_8007EAC
	movs r0, #4
	bl sub_8007F68
	movs r0, #0x20
	bl sub_8007F24
	movs r0, #0x80
	bl sub_8007F24
	movs r0, #4
	bl sub_8007F24
	movs r0, #1
	bl sub_8007F24
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080B5E4C: .4byte 0x02000815

	thumb_func_start sub_80B5E50
sub_80B5E50: @ 0x080B5E50
	push {r4, lr}
	sub sp, #0x20
	mov r1, sp
	ldr r0, _080B5ED8 @ =gUnk_08622C24
	ldm r0!, {r2, r3, r4}
	stm r1!, {r2, r3, r4}
	ldm r0!, {r2, r3, r4}
	stm r1!, {r2, r3, r4}
	ldm r0!, {r2, r3}
	stm r1!, {r2, r3}
	movs r0, #0
	bl InitBgs
	ldr r4, _080B5EDC @ =gDispIo
	movs r1, #4
	rsbs r1, r1, #0
	adds r0, r1, #0
	ldrb r2, [r4, #0xc]
	ands r0, r2
	strb r0, [r4, #0xc]
	ldrb r3, [r4, #0x10]
	ands r1, r3
	movs r0, #1
	orrs r1, r0
	strb r1, [r4, #0x10]
	movs r0, #3
	ldrb r1, [r4, #0x14]
	orrs r1, r0
	strb r1, [r4, #0x14]
	ldrb r1, [r4, #0x18]
	orrs r0, r1
	strb r0, [r4, #0x18]
	bl UnpackUiWindowFrameGraphics
	bl ResetText
	bl InitFaces
	mov r0, sp
	bl SetFaceConfig
	bl ResetUnitSprites
	bl MU_Init
	bl ApplyUnitSpritePalettes
	ldr r1, _080B5EE0 @ =gBmSt
	movs r0, #0
	strh r0, [r1, #0xc]
	strh r0, [r1, #0xe]
	subs r0, #2
	ldrb r2, [r4, #1]
	ands r0, r2
	movs r1, #3
	rsbs r1, r1, #0
	ands r0, r1
	subs r1, #2
	ands r0, r1
	subs r1, #4
	ands r0, r1
	subs r1, #8
	ands r0, r1
	strb r0, [r4, #1]
	add sp, #0x20
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080B5ED8: .4byte gUnk_08622C24
_080B5EDC: .4byte gDispIo
_080B5EE0: .4byte gBmSt

	thumb_func_start sub_80B5EE4
sub_80B5EE4: @ 0x080B5EE4
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	adds r4, r0, #0
	adds r0, #0x40
	movs r5, #0
	movs r1, #0
	strh r1, [r0]
	adds r0, #8
	strh r1, [r0]
	adds r0, #0xc
	strb r5, [r0]
	ldr r7, _080B6050 @ =gDispIo
	movs r0, #2
	rsbs r0, r0, #0
	ldrb r1, [r7, #1]
	ands r0, r1
	movs r1, #3
	rsbs r1, r1, #0
	ands r0, r1
	movs r2, #4
	orrs r0, r2
	subs r1, #6
	ands r0, r1
	movs r3, #0x10
	mov sb, r3
	mov r1, sb
	orrs r0, r1
	strb r0, [r7, #1]
	adds r0, r4, #0
	adds r0, #0x4a
	ldrb r0, [r0]
	movs r2, #0x30
	ldrsh r1, [r4, r2]
	movs r3, #0x32
	ldrsh r2, [r4, r3]
	bl sub_80B4050
	movs r0, #0x3c
	adds r0, r0, r7
	mov r8, r0
	movs r6, #0x3f
	adds r0, r6, #0
	mov r1, r8
	ldrb r1, [r1]
	ands r0, r1
	mov r2, r8
	strb r0, [r2]
	movs r0, #0x10
	ldr r3, _080B6054 @ =0x030027D4
	strb r0, [r3]
	ldr r0, _080B6058 @ =0x030027D5
	strb r5, [r0]
	movs r1, #0x46
	adds r1, r1, r7
	mov sl, r1
	strb r5, [r1]
	ldr r0, _080B605C @ =gUnk_0844C614
	movs r1, #0x98
	lsls r1, r1, #2
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r0, _080B6060 @ =gUnk_0844F1E8
	movs r1, #0x80
	lsls r1, r1, #2
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r0, _080B6064 @ =gUnk_0818FE70
	movs r1, #0xd8
	lsls r1, r1, #2
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r0, _080B6068 @ =gUnk_0844C9E8
	movs r1, #0xc8
	lsls r1, r1, #2
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r0, _080B606C @ =gUnk_0844C0B8
	ldr r1, _080B6070 @ =0x06015000
	bl Decompress
	movs r0, #0x21
	rsbs r0, r0, #0
	ldrb r2, [r7, #1]
	ands r0, r2
	movs r1, #0x41
	rsbs r1, r1, #0
	ands r0, r1
	movs r1, #0x7f
	ands r0, r1
	strb r0, [r7, #1]
	movs r3, #0x36
	adds r3, r3, r7
	mov ip, r3
	movs r0, #1
	ldrb r1, [r3]
	orrs r0, r1
	movs r1, #2
	orrs r0, r1
	movs r2, #4
	orrs r0, r2
	movs r1, #8
	orrs r0, r1
	mov r3, sb
	orrs r0, r3
	adds r3, r7, #0
	adds r3, #0x34
	movs r2, #0x20
	ldrb r1, [r3]
	orrs r1, r2
	strb r1, [r3]
	adds r3, #1
	ldrb r1, [r3]
	orrs r1, r2
	strb r1, [r3]
	orrs r0, r2
	mov r1, ip
	strb r0, [r1]
	movs r0, #0
	movs r1, #0
	movs r2, #0
	bl SetBlankBgColor
	mov r2, r8
	ldrb r2, [r2]
	ands r6, r2
	mov r3, r8
	strb r6, [r3]
	ldr r0, _080B6054 @ =0x030027D4
	strb r5, [r0]
	ldr r1, _080B6058 @ =0x030027D5
	strb r5, [r1]
	mov r2, sl
	strb r5, [r2]
	ldr r0, _080B6074 @ =0x0000FFE0
	ldrh r3, [r7, #0x3c]
	ands r0, r3
	ldr r1, _080B6078 @ =0x0000E0FF
	ands r0, r1
	movs r2, #0xc0
	lsls r2, r2, #5
	adds r1, r2, #0
	orrs r0, r1
	strh r0, [r7, #0x3c]
	ldr r0, _080B607C @ =0x02000814
	strb r5, [r0]
	movs r0, #0
	bl SetOnHBlankA
	ldr r0, _080B6080 @ =sub_80B45FC
	bl SetOnHBlankA
	adds r0, r4, #0
	bl sub_80B4A3C
	adds r0, r4, #0
	bl sub_80B4BDC
	adds r0, r4, #0
	bl sub_80B5D64
	ldr r1, [r4, #0x2c]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	beq _080B608C
	movs r0, #0x40
	ands r1, r0
	cmp r1, #0
	beq _080B6084
	movs r0, #1
	movs r1, #0
	bl NewFadeIn
	b _080B608C
	.align 2, 0
_080B6050: .4byte gDispIo
_080B6054: .4byte 0x030027D4
_080B6058: .4byte 0x030027D5
_080B605C: .4byte gUnk_0844C614
_080B6060: .4byte gUnk_0844F1E8
_080B6064: .4byte gUnk_0818FE70
_080B6068: .4byte gUnk_0844C9E8
_080B606C: .4byte gUnk_0844C0B8
_080B6070: .4byte 0x06015000
_080B6074: .4byte 0x0000FFE0
_080B6078: .4byte 0x0000E0FF
_080B607C: .4byte 0x02000814
_080B6080: .4byte sub_80B45FC
_080B6084:
	movs r0, #2
	movs r1, #0
	bl NewFadeIn
_080B608C:
	movs r0, #0
	bl sub_80B3DE4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_80B60A0
sub_80B60A0: @ 0x080B60A0
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0
	bl SetOnHBlankB
	movs r0, #0
	bl SetOnHBlankA
	bl sub_8007EF8
	bl sub_800968C
	bl ResetUnitSprites
	ldr r2, _080B60E8 @ =gDispIo
	adds r1, r2, #0
	adds r1, #0x3c
	movs r0, #0xc0
	ldrb r3, [r1]
	orrs r0, r3
	strb r0, [r1]
	adds r0, r2, #0
	adds r0, #0x44
	movs r1, #0
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r2, #0x46
	movs r0, #0x10
	strb r0, [r2]
	adds r4, #0x54
	strb r1, [r4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080B60E8: .4byte gDispIo

	thumb_func_start nullsub_89
nullsub_89: @ 0x080B60EC
	bx lr
	.align 2, 0

	thumb_func_start sub_80B60F0
sub_80B60F0: @ 0x080B60F0
	push {lr}
	ldr r0, [r0, #0x2c]
	movs r1, #8
	ands r0, r1
	cmp r0, #0
	beq _080B615A
	bl InitScanlineEffect
	ldr r0, _080B6160 @ =sub_8078030
	bl SetOnHBlankB
	movs r0, #0
	bl sub_8077E50
	ldr r0, _080B6164 @ =gDispIo
	mov ip, r0
	mov r2, ip
	adds r2, #0x3c
	movs r0, #0x3f
	ldrb r1, [r2]
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r2]
	mov r1, ip
	adds r1, #0x44
	movs r3, #0
	movs r0, #0x10
	strb r0, [r1]
	adds r1, #1
	strb r0, [r1]
	mov r0, ip
	adds r0, #0x46
	strb r3, [r0]
	ldr r0, _080B6168 @ =0x0000FFE0
	mov r3, ip
	ldrh r3, [r3, #0x3c]
	ands r0, r3
	movs r1, #8
	orrs r0, r1
	ldr r1, _080B616C @ =0x0000E0FF
	ands r0, r1
	mov r1, ip
	strh r0, [r1, #0x3c]
	movs r0, #0x20
	ldrb r1, [r2]
	orrs r1, r0
	strb r1, [r2]
	mov r1, ip
	adds r1, #0x3d
	ldrb r2, [r1]
	orrs r0, r2
	strb r0, [r1]
_080B615A:
	pop {r0}
	bx r0
	.align 2, 0
_080B6160: .4byte sub_8078030
_080B6164: .4byte gDispIo
_080B6168: .4byte 0x0000FFE0
_080B616C: .4byte 0x0000E0FF

	thumb_func_start sub_80B6170
sub_80B6170: @ 0x080B6170
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	movs r6, #0x30
	ldr r0, [r5, #0x2c]
	movs r1, #0x20
	ands r0, r1
	cmp r0, #0
	beq _080B618A
	adds r0, r5, #0
	adds r0, #0x48
	ldrh r1, [r0]
	adds r1, #2
	b _080B6192
_080B618A:
	adds r0, r5, #0
	adds r0, #0x48
	ldrh r1, [r0]
	adds r1, #1
_080B6192:
	strh r1, [r0]
	adds r2, r0, #0
	ldr r1, [r5, #0x2c]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _080B61A6
	ldrh r2, [r2]
	lsrs r4, r2, #1
	b _080B61A8
_080B61A6:
	ldrh r4, [r2]
_080B61A8:
	movs r7, #8
	ands r1, r7
	cmp r1, #0
	beq _080B61CC
	subs r1, r6, r4
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #4
	muls r0, r1, r0
	adds r1, r6, #0
	muls r1, r6, r1
	bl __divsi3
	adds r1, r0, #0
	movs r0, #0x70
	subs r0, r0, r1
	bl sub_8077E50
_080B61CC:
	cmp r4, r6
	bne _080B622C
	adds r0, r5, #0
	bl Proc_Break
	ldr r0, [r5, #0x2c]
	ands r0, r7
	cmp r0, #0
	beq _080B622C
	movs r0, #0
	bl SetOnHBlankB
	ldr r3, _080B6234 @ =gDispIo
	adds r2, r3, #0
	adds r2, #0x3c
	movs r0, #0x3f
	ldrb r1, [r2]
	ands r0, r1
	strb r0, [r2]
	adds r1, r3, #0
	adds r1, #0x44
	movs r0, #0
	strb r0, [r1]
	adds r1, #1
	strb r0, [r1]
	adds r1, #1
	strb r0, [r1]
	ldr r0, _080B6238 @ =0x0000FFE0
	ldrh r4, [r3, #0x3c]
	ands r0, r4
	ldr r1, _080B623C @ =0x0000E0FF
	ands r0, r1
	movs r4, #0x80
	lsls r4, r4, #3
	adds r1, r4, #0
	orrs r0, r1
	strh r0, [r3, #0x3c]
	movs r1, #0x21
	rsbs r1, r1, #0
	adds r0, r1, #0
	ldrb r4, [r2]
	ands r0, r4
	strb r0, [r2]
	adds r0, r3, #0
	adds r0, #0x3d
	ldrb r2, [r0]
	ands r1, r2
	strb r1, [r0]
_080B622C:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B6234: .4byte gDispIo
_080B6238: .4byte 0x0000FFE0
_080B623C: .4byte 0x0000E0FF

	thumb_func_start sub_80B6240
sub_80B6240: @ 0x080B6240
	adds r2, r0, #0
	adds r2, #0x40
	movs r1, #0
	strh r1, [r2]
	adds r0, #0x54
	movs r1, #1
	strb r1, [r0]
	bx lr

	thumb_func_start sub_80B6250
sub_80B6250: @ 0x080B6250
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r4, r0, #0
	bl sub_80B41F0
	mov r8, r0
	bl sub_80B41FC
	adds r7, r0, #0
	mov r5, r8
	adds r3, r7, #0
	adds r1, r4, #0
	adds r1, #0x40
	movs r2, #0
	ldrsh r0, [r1, r2]
	cmp r0, #0xff
	bgt _080B62F8
	movs r3, #0x80
	lsls r3, r3, #1
	mov ip, r3
	ldr r6, _080B6310 @ =0x0000FFFF
_080B627C:
	ldrh r2, [r1]
	ldrh r3, [r4, #0x34]
	adds r0, r2, r3
	strh r0, [r1]
	movs r2, #0
	ldrsh r0, [r1, r2]
	mov r3, ip
	subs r1, r3, r0
	adds r0, r4, #0
	adds r0, #0x50
	movs r2, #0
	ldrsh r3, [r0, r2]
	subs r0, #4
	movs r2, #0
	ldrsh r0, [r0, r2]
	subs r2, r3, r0
	cmp r2, #0
	bge _080B62A2
	subs r2, r0, r3
_080B62A2:
	adds r0, r2, #0
	muls r0, r1, r0
	muls r0, r1, r0
	cmp r0, #0
	bge _080B62AE
	adds r0, r0, r6
_080B62AE:
	asrs r0, r0, #0x10
	subs r5, r2, r0
	adds r0, r4, #0
	adds r0, #0x40
	movs r3, #0
	ldrsh r0, [r0, r3]
	mov r1, ip
	subs r2, r1, r0
	adds r0, r4, #0
	adds r0, #0x52
	movs r1, #0
	ldrsh r3, [r0, r1]
	subs r0, #4
	movs r1, #0
	ldrsh r0, [r0, r1]
	subs r1, r3, r0
	cmp r1, #0
	bge _080B62D4
	subs r1, r0, r3
_080B62D4:
	adds r0, r1, #0
	muls r0, r2, r0
	muls r0, r2, r0
	cmp r0, #0
	bge _080B62E0
	adds r0, r0, r6
_080B62E0:
	asrs r0, r0, #0x10
	subs r3, r1, r0
	adds r1, r4, #0
	adds r1, #0x40
	movs r2, #0
	ldrsh r0, [r1, r2]
	cmp r0, #0xff
	bgt _080B62F8
	cmp r5, r8
	bne _080B62F8
	cmp r3, r7
	beq _080B627C
_080B62F8:
	adds r0, r4, #0
	adds r0, #0x50
	adds r2, r4, #0
	adds r2, #0x4c
	movs r6, #0
	ldrsh r1, [r0, r6]
	movs r6, #0
	ldrsh r0, [r2, r6]
	cmp r1, r0
	ble _080B6314
	adds r5, r5, r0
	b _080B631A
	.align 2, 0
_080B6310: .4byte 0x0000FFFF
_080B6314:
	movs r6, #0
	ldrsh r0, [r2, r6]
	subs r5, r0, r5
_080B631A:
	adds r0, r4, #0
	adds r0, #0x52
	adds r2, r4, #0
	adds r2, #0x4e
	movs r6, #0
	ldrsh r1, [r0, r6]
	movs r6, #0
	ldrsh r0, [r2, r6]
	cmp r1, r0
	ble _080B6332
	adds r3, r3, r0
	b _080B6338
_080B6332:
	movs r6, #0
	ldrsh r0, [r2, r6]
	subs r3, r0, r3
_080B6338:
	mov r1, r8
	subs r0, r5, r1
	subs r1, r3, r7
	bl sub_80B4104
	movs r1, #1
	rsbs r1, r1, #0
	adds r0, r1, #0
	bl sub_80B4170
	adds r1, r4, #0
	adds r1, #0x40
	movs r0, #0x80
	lsls r0, r0, #1
	ldrh r1, [r1]
	cmp r1, r0
	bne _080B6368
	adds r0, r4, #0
	bl Proc_Break
	adds r1, r4, #0
	adds r1, #0x54
	movs r0, #0
	strb r0, [r1]
_080B6368:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_80B6374
sub_80B6374: @ 0x080B6374
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r6, r2, #0
	mov r8, r3
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	ldr r0, _080B63A8 @ =gUnk_08DB0F44
	movs r1, #3
	bl Proc_Start
	adds r1, r0, #0
	adds r1, #0x4a
	strb r4, [r1]
	strh r5, [r0, #0x30]
	strh r6, [r0, #0x32]
	mov r1, r8
	str r1, [r0, #0x2c]
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080B63A8: .4byte gUnk_08DB0F44

	thumb_func_start sub_80B63AC
sub_80B63AC: @ 0x080B63AC
	push {lr}
	ldr r0, _080B63D4 @ =ProcScr_BmFadeIN
	bl Proc_Find
	bl Proc_End
	ldr r0, _080B63D8 @ =gUnk_08DB0F44
	bl Proc_Find
	bl Proc_End
	bl sub_800EC08
	bl EndEachSpriteAnimProc
	movs r0, #0
	bl InitBgs
	pop {r0}
	bx r0
	.align 2, 0
_080B63D4: .4byte ProcScr_BmFadeIN
_080B63D8: .4byte gUnk_08DB0F44

	thumb_func_start sub_80B63DC
sub_80B63DC: @ 0x080B63DC
	push {lr}
	movs r1, #0x10
	ands r1, r0
	cmp r1, #0
	beq _080B63FA
	ldr r0, _080B6400 @ =gPlaySt
	ldrb r0, [r0, #0xe]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl GetROMChapterStruct
	ldrh r0, [r0, #0x26]
	movs r1, #0
	bl sub_800376C
_080B63FA:
	pop {r0}
	bx r0
	.align 2, 0
_080B6400: .4byte gPlaySt

	thumb_func_start sub_80B6404
sub_80B6404: @ 0x080B6404
	push {r4, r5, lr}
	ldr r5, _080B643C @ =gUnk_08D64CE4
	ldr r4, _080B6440 @ =gPlaySt
	movs r0, #0xe
	ldrsb r0, [r4, r0]
	bl GetROMChapterStruct
	adds r0, #0x75
	ldrb r0, [r0]
	lsls r0, r0, #2
	adds r0, r0, r5
	ldr r0, [r0]
	cmp r0, #0
	beq _080B6436
	movs r0, #0xe
	ldrsb r0, [r4, r0]
	bl GetROMChapterStruct
	adds r0, #0x75
	ldrb r0, [r0]
	lsls r0, r0, #2
	adds r0, r0, r5
	ldr r0, [r0]
	bl StartEvent
_080B6436:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080B643C: .4byte gUnk_08D64CE4
_080B6440: .4byte gPlaySt

	thumb_func_start sub_80B6444
sub_80B6444: @ 0x080B6444
	push {lr}
	movs r0, #4
	bl FadeBgmOut
	pop {r0}
	bx r0

	thumb_func_start sub_80B6450
sub_80B6450: @ 0x080B6450
	push {lr}
	bl sub_8004110
	bl sub_80B5D78
	movs r0, #0
	bl sub_80B3DE4
	pop {r0}
	bx r0

	thumb_func_start sub_80B6464
sub_80B6464: @ 0x080B6464
	push {lr}
	ldr r0, _080B6478 @ =gUnk_08DB0F44
	bl Proc_Find
	cmp r0, #0
	beq _080B6472
	movs r0, #1
_080B6472:
	pop {r1}
	bx r1
	.align 2, 0
_080B6478: .4byte gUnk_08DB0F44

	thumb_func_start sub_80B647C
sub_80B647C: @ 0x080B647C
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x2c]
	cmp r0, #0
	ble _080B648C
	subs r0, #1
	str r0, [r4, #0x2c]
	b _080B657A
_080B648C:
	adds r0, r4, #0
	adds r0, #0x30
	ldrb r0, [r0]
	cmp r0, #0xc
	bhi _080B6574
	lsls r0, r0, #2
	ldr r1, _080B64A0 @ =_080B64A4
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080B64A0: .4byte _080B64A4
_080B64A4: @ jump table
	.4byte _080B64D8 @ case 0
	.4byte _080B64E6 @ case 1
	.4byte _080B64EE @ case 2
	.4byte _080B64F8 @ case 3
	.4byte _080B6500 @ case 4
	.4byte _080B6516 @ case 5
	.4byte _080B652C @ case 6
	.4byte _080B653C @ case 7
	.4byte _080B654A @ case 8
	.4byte _080B655E @ case 9
	.4byte _080B6556 @ case 10
	.4byte _080B656E @ case 11
	.4byte _080B6566 @ case 12
_080B64D8:
	ldr r0, [r4, #0x34]
	ldr r1, [r4, #0x38]
	ldr r2, [r4, #0x3c]
	ldr r3, [r4, #0x44]
	bl sub_80B5724
	b _080B6574
_080B64E6:
	ldr r0, [r4, #0x34]
	bl sub_80B58FC
	b _080B6574
_080B64EE:
	ldr r0, [r4, #0x34]
	ldr r1, [r4, #0x40]
	bl sub_80B4810
	b _080B6574
_080B64F8:
	ldr r0, [r4, #0x34]
	bl sub_80B4934
	b _080B6574
_080B6500:
	ldr r0, [r4, #0x34]
	movs r2, #0x38
	ldrsh r1, [r4, r2]
	movs r3, #0x3c
	ldrsh r2, [r4, r3]
	ldr r3, [r4, #0x44]
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	bl sub_80B59AC
	b _080B6574
_080B6516:
	ldr r0, [r4, #0x34]
	movs r2, #0x38
	ldrsh r1, [r4, r2]
	movs r3, #0x3c
	ldrsh r2, [r4, r3]
	ldr r3, [r4, #0x44]
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	bl sub_80B5A80
	b _080B6574
_080B652C:
	ldr r0, [r4, #0x34]
	ldr r1, [r4, #0x40]
	ldr r2, [r4, #0x44]
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	bl sub_80B5B6C
	b _080B6574
_080B653C:
	ldr r0, [r4, #0x34]
	ldr r1, [r4, #0x44]
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	bl sub_80B5CA8
	b _080B6574
_080B654A:
	ldr r0, [r4, #0x38]
	ldr r1, [r4, #0x3c]
	ldr r2, [r4, #0x44]
	bl sub_80B5DBC
	b _080B6574
_080B6556:
	ldr r0, [r4, #0x44]
	bl sub_80B6664
	b _080B6574
_080B655E:
	ldr r0, [r4, #0x44]
	bl sub_80B6754
	b _080B6574
_080B6566:
	ldr r0, [r4, #0x44]
	bl sub_80B56B0
	b _080B6574
_080B656E:
	ldr r0, [r4, #0x44]
	bl sub_80B5648
_080B6574:
	adds r0, r4, #0
	bl Proc_Break
_080B657A:
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_80B6580
sub_80B6580: @ 0x080B6580
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r5, r0, #0
	adds r4, r1, #0
	adds r6, r2, #0
	mov r8, r3
	ldr r7, [sp, #0x18]
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	ldr r0, _080B65C4 @ =gUnk_08DB0F44
	bl Proc_Find
	adds r1, r0, #0
	ldr r0, _080B65C8 @ =gUnk_08DB1004
	bl Proc_Start
	str r5, [r0, #0x2c]
	adds r1, r0, #0
	adds r1, #0x30
	strb r4, [r1]
	str r6, [r0, #0x34]
	mov r1, r8
	str r1, [r0, #0x40]
	str r7, [r0, #0x38]
	ldr r1, [sp, #0x1c]
	str r1, [r0, #0x3c]
	ldr r1, [sp, #0x20]
	str r1, [r0, #0x44]
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B65C4: .4byte gUnk_08DB0F44
_080B65C8: .4byte gUnk_08DB1004

	thumb_func_start sub_80B65CC
sub_80B65CC: @ 0x080B65CC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	adds r6, r0, #0
	ldr r0, [r6, #0x30]
	lsls r0, r0, #5
	ldr r1, _080B6660 @ =gPal + 0x2
	adds r5, r0, r1
	adds r4, r6, #0
	adds r4, #0x34
	ldr r0, [r6, #0x2c]
	adds r0, #1
	str r0, [r6, #0x2c]
	movs r1, #0x1f
	mov sb, r1
	movs r1, #0x20
	subs r3, r1, r0
	movs r2, #0xf8
	lsls r2, r2, #2
	mov r8, r2
	movs r7, #0xf8
	lsls r7, r7, #7
	mov ip, r7
	movs r0, #0xe
	mov sl, r0
_080B6602:
	ldrh r2, [r4]
	movs r0, #0x1f
	ands r0, r2
	adds r1, r0, #0
	muls r1, r3, r1
	asrs r1, r1, #5
	mov r7, sb
	ands r1, r7
	mov r0, r8
	ands r0, r2
	muls r0, r3, r0
	asrs r0, r0, #5
	mov r7, r8
	ands r0, r7
	adds r1, r1, r0
	mov r0, ip
	ands r0, r2
	muls r0, r3, r0
	asrs r0, r0, #5
	mov r2, ip
	ands r0, r2
	adds r1, r1, r0
	strh r1, [r5]
	adds r4, #2
	adds r5, #2
	movs r7, #1
	rsbs r7, r7, #0
	add sl, r7
	mov r0, sl
	cmp r0, #0
	bge _080B6602
	bl EnablePalSync
	ldr r0, [r6, #0x2c]
	cmp r0, #0x20
	bne _080B6650
	adds r0, r6, #0
	bl Proc_Break
_080B6650:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B6660: .4byte gPal + 0x2

	thumb_func_start sub_80B6664
sub_80B6664: @ 0x080B6664
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r0, _080B66B0 @ =gUnk_08DB0F44
	bl Proc_Find
	adds r1, r0, #0
	ldr r0, _080B66B4 @ =gUnk_08DB101C
	bl Proc_Start
	adds r5, r0, #0
	movs r0, #0x1f
	ands r4, r0
	str r4, [r5, #0x30]
	movs r0, #0
	str r0, [r5, #0x2c]
	ldr r0, _080B66B8 @ =Pal_UnitSprites
	movs r1, #0xe0
	lsls r1, r1, #2
	movs r2, #0x80
	bl ApplyPaletteExt
	ldr r0, _080B66BC @ =gPal
	lsls r4, r4, #5
	adds r4, r4, r0
	adds r4, #2
	adds r5, #0x34
	movs r1, #0xe
_080B669A:
	ldrh r0, [r4]
	strh r0, [r5]
	adds r4, #2
	adds r5, #2
	subs r1, #1
	cmp r1, #0
	bge _080B669A
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080B66B0: .4byte gUnk_08DB0F44
_080B66B4: .4byte gUnk_08DB101C
_080B66B8: .4byte Pal_UnitSprites
_080B66BC: .4byte gPal

	thumb_func_start sub_80B66C0
sub_80B66C0: @ 0x080B66C0
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	adds r6, r0, #0
	ldr r0, [r6, #0x30]
	lsls r0, r0, #5
	ldr r1, _080B6750 @ =gPal + 0x2
	adds r5, r0, r1
	adds r4, r6, #0
	adds r4, #0x34
	ldr r0, [r6, #0x2c]
	adds r0, #1
	str r0, [r6, #0x2c]
	movs r1, #0x1f
	mov sb, r1
	adds r3, r0, #0
	movs r2, #0xf8
	lsls r2, r2, #2
	mov r8, r2
	movs r7, #0xf8
	lsls r7, r7, #7
	mov ip, r7
	movs r0, #0xe
	mov sl, r0
_080B66F4:
	ldrh r2, [r4]
	movs r0, #0x1f
	ands r0, r2
	adds r1, r0, #0
	muls r1, r3, r1
	asrs r1, r1, #5
	mov r7, sb
	ands r1, r7
	mov r0, r8
	ands r0, r2
	muls r0, r3, r0
	asrs r0, r0, #5
	mov r7, r8
	ands r0, r7
	adds r1, r1, r0
	mov r0, ip
	ands r0, r2
	muls r0, r3, r0
	asrs r0, r0, #5
	mov r2, ip
	ands r0, r2
	adds r1, r1, r0
	strh r1, [r5]
	adds r4, #2
	adds r5, #2
	movs r7, #1
	rsbs r7, r7, #0
	add sl, r7
	mov r0, sl
	cmp r0, #0
	bge _080B66F4
	bl EnablePalSync
	ldr r0, [r6, #0x2c]
	cmp r0, #0x20
	bne _080B6742
	adds r0, r6, #0
	bl Proc_Break
_080B6742:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B6750: .4byte gPal + 0x2

	thumb_func_start sub_80B6754
sub_80B6754: @ 0x080B6754
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r0, _080B67A0 @ =gUnk_08DB0F44
	bl Proc_Find
	adds r1, r0, #0
	ldr r0, _080B67A4 @ =gUnk_08DB1034
	bl Proc_Start
	adds r5, r0, #0
	movs r0, #0x1f
	ands r4, r0
	str r4, [r5, #0x30]
	movs r0, #0
	str r0, [r5, #0x2c]
	ldr r0, _080B67A8 @ =Pal_UnitSprites
	movs r1, #0xe0
	lsls r1, r1, #2
	movs r2, #0x80
	bl ApplyPaletteExt
	ldr r0, _080B67AC @ =gPal
	lsls r4, r4, #5
	adds r4, r4, r0
	adds r4, #2
	adds r5, #0x34
	movs r1, #0xe
_080B678A:
	ldrh r0, [r4]
	strh r0, [r5]
	adds r4, #2
	adds r5, #2
	subs r1, #1
	cmp r1, #0
	bge _080B678A
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080B67A0: .4byte gUnk_08DB0F44
_080B67A4: .4byte gUnk_08DB1034
_080B67A8: .4byte Pal_UnitSprites
_080B67AC: .4byte gPal

	thumb_func_start sub_80B67B0
sub_80B67B0: @ 0x080B67B0
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	movs r1, #0
	mov sb, r1
	str r1, [r0, #0x2c]
	bl InitScanlineEffect
	ldr r2, _080B6898 @ =0x030027CC
	mov ip, r2
	ldr r0, _080B689C @ =0x0000FFE0
	ldrh r3, [r2]
	ands r0, r3
	movs r1, #0xf
	orrs r0, r1
	strh r0, [r2]
	subs r2, #0x3c
	mov r0, ip
	subs r0, #0xf
	mov r5, sb
	strb r5, [r0]
	adds r0, #4
	strb r5, [r0]
	mov r1, ip
	subs r1, #0x10
	movs r0, #0xf0
	strb r0, [r1]
	adds r1, #4
	movs r0, #0xa0
	strb r0, [r1]
	movs r6, #0x20
	ldrb r0, [r2, #1]
	orrs r0, r6
	movs r1, #0x41
	rsbs r1, r1, #0
	ands r0, r1
	movs r1, #0x7f
	ands r0, r1
	strb r0, [r2, #1]
	movs r0, #8
	rsbs r0, r0, #0
	add r0, ip
	mov sl, r0
	ldrb r0, [r0]
	orrs r0, r6
	mov r1, sl
	strb r0, [r1]
	mov r7, ip
	subs r7, #6
	movs r2, #0x21
	rsbs r2, r2, #0
	adds r0, r2, #0
	ldrb r3, [r7]
	ands r0, r3
	strb r0, [r7]
	movs r1, #1
	mov r5, sl
	ldrb r0, [r5]
	orrs r0, r1
	movs r4, #2
	orrs r0, r4
	movs r3, #4
	mov r8, r3
	mov r5, r8
	orrs r0, r5
	movs r3, #8
	orrs r0, r3
	movs r3, #0x10
	orrs r0, r3
	mov r5, sl
	strb r0, [r5]
	ldrb r0, [r7]
	orrs r1, r0
	orrs r1, r4
	mov r5, r8
	orrs r1, r5
	movs r0, #8
	orrs r1, r0
	orrs r1, r3
	strb r1, [r7]
	mov r1, sl
	ldrb r1, [r1]
	orrs r6, r1
	mov r3, sl
	strb r6, [r3]
	ldrb r5, [r7]
	ands r2, r5
	strb r2, [r7]
	movs r0, #0x3f
	mov r1, ip
	ldrb r1, [r1]
	ands r0, r1
	movs r1, #0x80
	orrs r0, r1
	mov r2, ip
	strb r0, [r2]
	mov r3, sb
	strb r3, [r2, #8]
	strb r3, [r2, #9]
	strb r3, [r2, #0xa]
	bl sub_8077C1C
	ldr r0, _080B68A0 @ =0x02000814
	ldrb r5, [r0]
	orrs r4, r5
	strb r4, [r0]
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B6898: .4byte 0x030027CC
_080B689C: .4byte 0x0000FFE0
_080B68A0: .4byte 0x02000814

	thumb_func_start sub_80B68A4
sub_80B68A4: @ 0x080B68A4
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	movs r0, #0x18
	ldr r4, [r7, #0x2c]
	adds r4, #1
	str r4, [r7, #0x2c]
	muls r0, r4, r0
	muls r0, r4, r0
	movs r5, #0xe1
	lsls r5, r5, #4
	adds r1, r5, #0
	bl __divsi3
	adds r6, r0, #0
	lsls r0, r4, #4
	muls r0, r4, r0
	adds r1, r5, #0
	bl __divsi3
	movs r4, #0x10
	subs r4, r4, r0
	ldr r0, [r7, #0x30]
	ldr r2, _080B6918 @ =gAnims
	movs r3, #4
	ldrsh r1, [r2, r3]
	subs r0, r0, r1
	ldr r1, [r7, #0x34]
	subs r1, #1
	movs r3, #6
	ldrsh r2, [r2, r3]
	subs r1, r1, r2
	adds r2, r6, #0
	bl sub_8077E1C
	ldr r3, _080B691C @ =gDispIo
	adds r2, r3, #0
	adds r2, #0x3c
	movs r0, #0x3f
	ldrb r1, [r2]
	ands r0, r1
	movs r1, #0x80
	orrs r0, r1
	strb r0, [r2]
	adds r0, r3, #0
	adds r0, #0x44
	movs r1, #0
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r0, #1
	strb r4, [r0]
	ldr r0, [r7, #0x2c]
	cmp r0, #0x3c
	blt _080B6912
	str r1, [r7, #0x2c]
_080B6912:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B6918: .4byte gAnims
_080B691C: .4byte gDispIo

	thumb_func_start sub_80B6920
sub_80B6920: @ 0x080B6920
	ldr r1, _080B695C @ =0x02000814
	movs r0, #0xfd
	ldrb r2, [r1]
	ands r0, r2
	strb r0, [r1]
	ldr r2, _080B6960 @ =gDispIo
	adds r1, r2, #0
	adds r1, #0x3c
	movs r0, #0x3f
	ldrb r3, [r1]
	ands r0, r3
	strb r0, [r1]
	adds r1, #8
	movs r0, #0
	strb r0, [r1]
	adds r1, #1
	strb r0, [r1]
	adds r1, #1
	strb r0, [r1]
	subs r0, #0x21
	ldrb r1, [r2, #1]
	ands r0, r1
	movs r1, #0x41
	rsbs r1, r1, #0
	ands r0, r1
	movs r1, #0x7f
	ands r0, r1
	strb r0, [r2, #1]
	bx lr
	.align 2, 0
_080B695C: .4byte 0x02000814
_080B6960: .4byte gDispIo

	thumb_func_start sub_80B6964
sub_80B6964: @ 0x080B6964
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r6, r1, #0
	ldr r4, _080B6984 @ =gUnk_08DB104C
	ldr r0, _080B6988 @ =gUnk_08DB0F44
	bl Proc_Find
	adds r1, r0, #0
	adds r0, r4, #0
	bl Proc_Start
	str r5, [r0, #0x30]
	str r6, [r0, #0x34]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080B6984: .4byte gUnk_08DB104C
_080B6988: .4byte gUnk_08DB0F44

	thumb_func_start sub_80B698C
sub_80B698C: @ 0x080B698C
	push {lr}
	ldr r0, _080B699C @ =gUnk_08DB104C
	bl Proc_Find
	bl Proc_End
	pop {r0}
	bx r0
	.align 2, 0
_080B699C: .4byte gUnk_08DB104C

	thumb_func_start sub_80B69A0
sub_80B69A0: @ 0x080B69A0
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r6, r0, #0
	adds r5, r1, #0
	cmp r6, #0
	blt _080B6A04
	cmp r5, #0
	blt _080B6A04
	cmp r6, #0x7f
	bgt _080B6A04
	cmp r5, #0x55
	bgt _080B6A04
	ldr r1, _080B6A0C @ =gUnk_08DB10A4
	asrs r3, r6, #5
	lsls r3, r3, #2
	asrs r0, r5, #5
	lsls r0, r0, #4
	adds r3, r3, r0
	adds r1, r3, r1
	ldr r4, [r1]
	movs r2, #0x1f
	adds r1, r2, #0
	ands r1, r5
	subs r0, r2, r1
	lsls r0, r0, #6
	adds r0, #2
	adds r4, r4, r0
	ands r2, r6
	lsls r0, r2, #1
	adds r4, r4, r0
	ldr r5, _080B6A10 @ =gBg3Tm
	lsls r1, r1, #5
	adds r1, r1, r2
	lsls r0, r1, #1
	adds r0, r0, r5
	ldrh r2, [r4]
	strh r2, [r0]
	ldr r0, _080B6A14 @ =gUnk_08DB1074
	adds r3, r3, r0
	ldr r0, [r3]
	lsls r1, r1, #5
	adds r0, r0, r1
	ldr r2, _080B6A18 @ =0x06008000
	adds r1, r1, r2
	movs r2, #8
	bl CpuFastSet
	movs r0, #8
	bl EnableBgSync
_080B6A04:
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080B6A0C: .4byte gUnk_08DB10A4
_080B6A10: .4byte gBg3Tm
_080B6A14: .4byte gUnk_08DB1074
_080B6A18: .4byte 0x06008000

	thumb_func_start sub_80B6A1C
sub_80B6A1C: @ 0x080B6A1C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	mov sb, r0
	adds r7, r1, #0
	mov r8, r2
	str r3, [sp]
	cmp r0, #0
	bge _080B6A5A
	cmp r7, #0
	bge _080B6A5A
	movs r5, #0
_080B6A3A:
	movs r4, #0
	ldr r0, [sp]
	adds r7, r0, r5
	adds r6, r5, #1
_080B6A42:
	mov r1, r8
	adds r0, r1, r4
	adds r1, r7, #0
	bl sub_80B69A0
	adds r4, #1
	cmp r4, #0x1e
	ble _080B6A42
	adds r5, r6, #0
	cmp r5, #0x14
	ble _080B6A3A
	b _080B6B4E
_080B6A5A:
	ldr r0, [sp]
	cmp r0, r7
	bge _080B6AD0
	adds r5, r0, #0
	movs r1, #0x15
	adds r1, r1, r5
	mov sl, r1
_080B6A68:
	movs r4, #0
	adds r6, r5, #1
_080B6A6C:
	mov r1, r8
	adds r0, r1, r4
	adds r1, r5, #0
	bl sub_80B69A0
	adds r4, #1
	cmp r4, #0x1e
	ble _080B6A6C
	adds r5, r6, #0
	cmp r5, r7
	blt _080B6A68
	adds r5, r7, #0
	cmp r5, sl
	bge _080B6AA4
_080B6A88:
	mov r4, r8
	adds r6, r5, #1
	cmp r4, sb
	bge _080B6A9E
_080B6A90:
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_80B69A0
	adds r4, #1
	cmp r4, sb
	blt _080B6A90
_080B6A9E:
	adds r5, r6, #0
	cmp r5, sl
	blt _080B6A88
_080B6AA4:
	adds r5, r7, #0
	cmp r5, sl
	bge _080B6B4E
	mov r7, r8
	adds r7, #0x1f
	mov r8, r7
_080B6AB0:
	mov r4, sb
	adds r4, #0x1f
	adds r6, r5, #1
	cmp r4, r8
	bge _080B6AC8
_080B6ABA:
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_80B69A0
	adds r4, #1
	cmp r4, r7
	blt _080B6ABA
_080B6AC8:
	adds r5, r6, #0
	cmp r5, sl
	blt _080B6AB0
	b _080B6B4E
_080B6AD0:
	adds r5, r7, #0
	adds r5, #0x15
	ldr r0, [sp]
	adds r0, #0x15
	mov sl, r0
	str r5, [sp, #4]
	cmp r5, sl
	bge _080B6AFA
_080B6AE0:
	movs r4, #0
	adds r6, r5, #1
_080B6AE4:
	mov r1, r8
	adds r0, r1, r4
	adds r1, r5, #0
	bl sub_80B69A0
	adds r4, #1
	cmp r4, #0x1e
	ble _080B6AE4
	adds r5, r6, #0
	cmp r5, sl
	blt _080B6AE0
_080B6AFA:
	ldr r5, [sp]
	ldr r0, [sp, #4]
	cmp r5, r0
	bge _080B6B20
_080B6B02:
	mov r4, r8
	adds r6, r5, #1
	cmp r4, sb
	bge _080B6B18
_080B6B0A:
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_80B69A0
	adds r4, #1
	cmp r4, sb
	blt _080B6B0A
_080B6B18:
	adds r5, r6, #0
	ldr r1, [sp, #4]
	cmp r5, r1
	blt _080B6B02
_080B6B20:
	ldr r5, [sp]
	ldr r0, [sp, #4]
	cmp r5, r0
	bge _080B6B4E
	mov r7, r8
	adds r7, #0x1f
	mov r8, r7
_080B6B2E:
	mov r4, sb
	adds r4, #0x1f
	adds r6, r5, #1
	cmp r4, r8
	bge _080B6B46
_080B6B38:
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_80B69A0
	adds r4, #1
	cmp r4, r7
	blt _080B6B38
_080B6B46:
	adds r5, r6, #0
	ldr r1, [sp, #4]
	cmp r5, r1
	blt _080B6B2E
_080B6B4E:
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_80B6B60
sub_80B6B60: @ 0x080B6B60
	push {r4, r5, r6, lr}
	bl sub_80B7968
	adds r6, r0, #0
	ldr r0, [r6, #8]
	movs r2, #0x80
	lsls r2, r2, #1
	movs r1, #0
	bl ApplyPaletteExt
	movs r0, #3
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	movs r4, #0
	ldr r5, _080B6BB4 @ =0x06008000
_080B6B82:
	ldr r0, [r6]
	lsls r1, r4, #2
	adds r1, r1, r0
	ldr r0, [r1]
	adds r1, r5, #0
	bl Decompress
	movs r0, #0x80
	lsls r0, r0, #4
	adds r5, r5, r0
	adds r4, #1
	cmp r4, #9
	ble _080B6B82
	ldr r0, _080B6BB8 @ =gBg3Tm
	ldr r1, [r6, #4]
	movs r2, #0
	bl TmApplyTsa_thm
	movs r0, #8
	bl EnableBgSync
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080B6BB4: .4byte 0x06008000
_080B6BB8: .4byte gBg3Tm

	thumb_func_start sub_80B6BBC
sub_80B6BBC: @ 0x080B6BBC
	push {r4, r5, lr}
	adds r4, r1, #0
	adds r5, r2, #0
	cmp r0, #1
	beq _080B6BD6
	cmp r0, #1
	bgt _080B6BD0
	cmp r0, #0
	beq _080B6C04
	b _080B6C80
_080B6BD0:
	cmp r0, #2
	beq _080B6C3C
	b _080B6C80
_080B6BD6:
	ldr r0, _080B6C00 @ =gUnk_085AE7BC
	movs r1, #0
	movs r2, #0x80
	bl ApplyPaletteExt
	lsls r1, r4, #3
	movs r0, #0xff
	ands r1, r0
	lsls r2, r5, #3
	ands r2, r0
	movs r0, #3
	bl SetBgOffset
	movs r1, #1
	rsbs r1, r1, #0
	adds r0, r1, #0
	adds r2, r4, #0
	adds r3, r5, #0
	bl sub_80B6A1C
	b _080B6C86
	.align 2, 0
_080B6C00: .4byte gUnk_085AE7BC
_080B6C04:
	ldr r0, _080B6C28 @ =gUnk_0860A86C
	movs r1, #0
	movs r2, #0x80
	bl ApplyPaletteExt
	movs r0, #3
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	ldr r0, _080B6C2C @ =gUnk_0860A8EC
	ldr r1, _080B6C30 @ =0x06008000
	bl Decompress
	ldr r0, _080B6C34 @ =gBg3Tm
	ldr r1, _080B6C38 @ =gUnk_0860F964
	b _080B6C5C
	.align 2, 0
_080B6C28: .4byte gUnk_0860A86C
_080B6C2C: .4byte gUnk_0860A8EC
_080B6C30: .4byte 0x06008000
_080B6C34: .4byte gBg3Tm
_080B6C38: .4byte gUnk_0860F964
_080B6C3C:
	ldr r0, _080B6C6C @ =gUnk_0860FE18
	movs r1, #0
	movs r2, #0x80
	bl ApplyPaletteExt
	movs r0, #3
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	ldr r0, _080B6C70 @ =gUnk_0860FE98
	ldr r1, _080B6C74 @ =0x06008000
	bl Decompress
	ldr r0, _080B6C78 @ =gBg3Tm
	ldr r1, _080B6C7C @ =gUnk_086151B8
_080B6C5C:
	movs r2, #0
	bl TmApplyTsa_thm
	movs r0, #8
	bl EnableBgSync
	b _080B6C86
	.align 2, 0
_080B6C6C: .4byte gUnk_0860FE18
_080B6C70: .4byte gUnk_0860FE98
_080B6C74: .4byte 0x06008000
_080B6C78: .4byte gBg3Tm
_080B6C7C: .4byte gUnk_086151B8
_080B6C80:
	subs r0, #3
	bl sub_80B6B60
_080B6C86:
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start sub_80B6C8C
sub_80B6C8C: @ 0x080B6C8C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	adds r4, r0, #0
	mov sb, r1
	mov sl, r2
	ldr r0, _080B6D4C @ =gPal
	movs r2, #0x80
	lsls r2, r2, #1
	adds r1, r0, r2
	movs r2, #0x20
	bl CpuFastSet
	cmp r4, #1
	bne _080B6D64
	movs r7, #0
	movs r5, #0x1f
	mov r8, r5
	movs r3, #0
_080B6CB8:
	mov r0, sl
	adds r6, r0, r7
	mov r1, r8
	ands r6, r1
	movs r5, #0
	ldr r2, _080B6D50 @ =0x06001000
	adds r4, r3, r2
_080B6CC6:
	mov r1, sb
	adds r0, r1, r5
	mov r2, r8
	ands r0, r2
	lsls r1, r6, #5
	adds r0, r0, r1
	lsls r0, r0, #5
	ldr r1, _080B6D54 @ =0x06008000
	adds r0, r0, r1
	adds r1, r4, #0
	movs r2, #8
	str r3, [sp]
	bl CpuFastSet
	adds r4, #0x20
	adds r5, #1
	ldr r3, [sp]
	cmp r5, #0x1d
	ble _080B6CC6
	movs r2, #0x80
	lsls r2, r2, #3
	adds r3, r3, r2
	adds r7, #1
	cmp r7, #0x13
	ble _080B6CB8
	movs r7, #0
	movs r5, #0x1f
	mov r8, r5
_080B6CFE:
	mov r1, sl
	adds r0, r1, r7
	mov r2, r8
	ands r0, r2
	movs r5, #0
	adds r4, r7, #1
	lsls r1, r7, #5
	mov ip, r1
	lsls r6, r0, #5
	lsls r0, r7, #6
	ldr r2, _080B6D58 @ =gBg2Tm
	adds r3, r0, r2
_080B6D16:
	mov r7, sb
	adds r0, r7, r5
	mov r1, r8
	ands r0, r1
	mov r7, ip
	adds r2, r7, r5
	adds r0, r6, r0
	lsls r0, r0, #1
	ldr r1, _080B6D5C @ =gBg3Tm
	adds r0, r0, r1
	movs r1, #0xf0
	lsls r1, r1, #8
	ldrh r0, [r0]
	ands r1, r0
	adds r1, #0x80
	adds r2, r2, r1
	ldr r7, _080B6D60 @ =0xFFFF8000
	adds r2, r2, r7
	strh r2, [r3]
	adds r3, #2
	adds r5, #1
	cmp r5, #0x1d
	ble _080B6D16
	adds r7, r4, #0
	cmp r7, #0x13
	ble _080B6CFE
	b _080B6D9E
	.align 2, 0
_080B6D4C: .4byte gPal
_080B6D50: .4byte 0x06001000
_080B6D54: .4byte 0x06008000
_080B6D58: .4byte gBg2Tm
_080B6D5C: .4byte gBg3Tm
_080B6D60: .4byte 0xFFFF8000
_080B6D64:
	ldr r0, _080B6DB8 @ =0x06008000
	ldr r1, _080B6DBC @ =0x06001000
	movs r2, #0xa0
	lsls r2, r2, #5
	bl CpuFastSet
	movs r7, #0
	ldr r0, _080B6DC0 @ =gBg2Tm
	mov r8, r0
	ldr r6, _080B6DC4 @ =gBg3Tm
	ldr r1, _080B6DC8 @ =0x00008080
	adds r3, r1, #0
_080B6D7C:
	adds r4, r7, #1
	lsls r0, r7, #6
	adds r2, r0, r6
	mov r5, r8
	adds r1, r0, r5
	movs r5, #0x1d
_080B6D88:
	ldrh r7, [r2]
	adds r0, r3, r7
	strh r0, [r1]
	adds r2, #2
	adds r1, #2
	subs r5, #1
	cmp r5, #0
	bge _080B6D88
	adds r7, r4, #0
	cmp r7, #0x13
	ble _080B6D7C
_080B6D9E:
	bl EnablePalSync
	movs r0, #4
	bl EnableBgSync
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B6DB8: .4byte 0x06008000
_080B6DBC: .4byte 0x06001000
_080B6DC0: .4byte gBg2Tm
_080B6DC4: .4byte gBg3Tm
_080B6DC8: .4byte 0x00008080

	thumb_func_start sub_80B6DCC
sub_80B6DCC: @ 0x080B6DCC
	push {lr}
	ldr r0, _080B6DDC @ =gUnk_08DB0F44
	bl Proc_Find
	cmp r0, #0
	bne _080B6DE0
	movs r0, #0
	b _080B6DE8
	.align 2, 0
_080B6DDC: .4byte gUnk_08DB0F44
_080B6DE0:
	adds r0, #0x54
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
_080B6DE8:
	pop {r1}
	bx r1

	thumb_func_start sub_80B6DEC
sub_80B6DEC: @ 0x080B6DEC
	ldr r0, _080B6E2C @ =0x04000006
	ldrh r0, [r0]
	adds r0, #1
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	cmp r3, #0xa0
	bls _080B6DFC
	movs r3, #0
_080B6DFC:
	movs r0, #1
	ands r0, r3
	cmp r0, #0
	bne _080B6E28
	ldr r1, _080B6E30 @ =0x02000814
	movs r0, #2
	ldrb r1, [r1]
	ands r0, r1
	cmp r0, #0
	beq _080B6E28
	ldr r1, _080B6E34 @ =0x0203E640
	cmp r3, #0
	bne _080B6E1C
	ldr r0, _080B6E38 @ =0x0203E638
	ldr r0, [r0]
	str r0, [r1]
_080B6E1C:
	ldr r2, _080B6E3C @ =0x04000040
	ldr r1, [r1]
	lsls r0, r3, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	strh r0, [r2]
_080B6E28:
	bx lr
	.align 2, 0
_080B6E2C: .4byte 0x04000006
_080B6E30: .4byte 0x02000814
_080B6E34: .4byte 0x0203E640
_080B6E38: .4byte 0x0203E638
_080B6E3C: .4byte 0x04000040

	thumb_func_start sub_80B6E40
sub_80B6E40: @ 0x080B6E40
	push {r4, lr}
	adds r4, r0, #0
	bl sub_800EC08
	ldr r0, _080B6E84 @ =gUnk_0860A86C
	movs r1, #0
	movs r2, #0x80
	bl ApplyPaletteExt
	movs r0, #3
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	ldr r0, _080B6E88 @ =gUnk_0860A8EC
	ldr r1, _080B6E8C @ =0x06008000
	bl Decompress
	ldr r0, _080B6E90 @ =gBg3Tm
	ldr r1, _080B6E94 @ =gUnk_0860F964
	movs r2, #0
	bl TmApplyTsa_thm
	movs r0, #8
	bl EnableBgSync
	movs r0, #0xb4
	str r0, [r4, #0x30]
	movs r0, #0x60
	str r0, [r4, #0x34]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080B6E84: .4byte gUnk_0860A86C
_080B6E88: .4byte gUnk_0860A8EC
_080B6E8C: .4byte 0x06008000
_080B6E90: .4byte gBg3Tm
_080B6E94: .4byte gUnk_0860F964

	thumb_func_start sub_80B6E98
sub_80B6E98: @ 0x080B6E98
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	movs r1, #0
	str r1, [r0, #0x2c]
	bl InitScanlineEffect
	ldr r2, _080B6F84 @ =0x030027CC
	mov ip, r2
	ldr r0, _080B6F88 @ =0x0000FFE0
	ldrh r1, [r2]
	ands r0, r1
	movs r1, #0x1f
	orrs r0, r1
	strh r0, [r2]
	subs r2, #0x3c
	mov r0, ip
	subs r0, #0xf
	movs r1, #0
	strb r1, [r0]
	adds r0, #4
	strb r1, [r0]
	mov r1, ip
	subs r1, #0x10
	movs r0, #0xf0
	strb r0, [r1]
	adds r1, #4
	movs r0, #0xa0
	strb r0, [r1]
	movs r0, #0x20
	mov r8, r0
	mov r0, r8
	ldrb r1, [r2, #1]
	orrs r0, r1
	movs r1, #0x41
	rsbs r1, r1, #0
	ands r0, r1
	movs r1, #0x7f
	ands r0, r1
	strb r0, [r2, #1]
	movs r2, #8
	rsbs r2, r2, #0
	add r2, ip
	mov sb, r2
	mov r1, r8
	ldrb r0, [r2]
	orrs r1, r0
	mov r7, ip
	subs r7, #6
	movs r2, #0x21
	rsbs r2, r2, #0
	mov sl, r2
	mov r0, sl
	ldrb r2, [r7]
	ands r0, r2
	movs r6, #1
	orrs r1, r6
	movs r3, #2
	orrs r1, r3
	movs r5, #4
	orrs r1, r5
	movs r4, #8
	orrs r1, r4
	movs r2, #0x10
	orrs r1, r2
	orrs r0, r6
	orrs r0, r3
	orrs r0, r5
	orrs r0, r4
	orrs r0, r2
	mov r2, r8
	orrs r1, r2
	mov r2, sb
	strb r1, [r2]
	mov r1, sl
	ands r0, r1
	strb r0, [r7]
	movs r0, #0x3f
	mov r2, ip
	ldrb r2, [r2]
	ands r0, r2
	movs r1, #0x80
	orrs r0, r1
	mov r1, ip
	strb r0, [r1]
	movs r2, #0
	strb r2, [r1, #8]
	strb r2, [r1, #9]
	strb r2, [r1, #0xa]
	ldr r0, _080B6F8C @ =0x02000814
	ldrb r1, [r0]
	orrs r3, r1
	strb r3, [r0]
	movs r0, #0
	bl SetOnHBlankA
	ldr r0, _080B6F90 @ =sub_80B6DEC
	bl SetOnHBlankA
	ldr r0, _080B6F94 @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080B6F74
	ldr r0, _080B6F98 @ =0x00000269
	bl m4aSongNumStart
_080B6F74:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B6F84: .4byte 0x030027CC
_080B6F88: .4byte 0x0000FFE0
_080B6F8C: .4byte 0x02000814
_080B6F90: .4byte sub_80B6DEC
_080B6F94: .4byte gPlaySt
_080B6F98: .4byte 0x00000269

	thumb_func_start sub_80B6F9C
sub_80B6F9C: @ 0x080B6F9C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r7, r0, #0
	movs r5, #0x40
	movs r0, #0x96
	lsls r0, r0, #1
	ldr r4, [r7, #0x2c]
	adds r4, #1
	str r4, [r7, #0x2c]
	muls r0, r4, r0
	muls r0, r4, r0
	movs r6, #0x80
	lsls r6, r6, #5
	adds r1, r6, #0
	bl __divsi3
	mov r8, r0
	subs r5, r5, r4
	lsls r0, r5, #3
	muls r0, r5, r0
	adds r1, r6, #0
	bl __divsi3
	movs r4, #8
	subs r4, r4, r0
	ldr r0, [r7, #0x30]
	ldr r1, [r7, #0x34]
	mov r2, r8
	bl sub_8077E1C
	ldr r3, _080B7014 @ =gDispIo
	adds r2, r3, #0
	adds r2, #0x3c
	movs r0, #0x3f
	ldrb r1, [r2]
	ands r0, r1
	movs r1, #0x80
	orrs r0, r1
	strb r0, [r2]
	adds r0, r3, #0
	adds r0, #0x44
	movs r1, #0
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r4, #8
	adds r0, #1
	strb r4, [r0]
	ldr r0, [r7, #0x2c]
	cmp r0, #0x40
	blt _080B700A
	adds r0, r7, #0
	bl Proc_Break
_080B700A:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B7014: .4byte gDispIo

	thumb_func_start sub_80B7018
sub_80B7018: @ 0x080B7018
	push {lr}
	bl EndEachSpriteAnimProc
	ldr r3, _080B706C @ =gDispIo
	adds r2, r3, #0
	adds r2, #0x3c
	movs r0, #0x3f
	ldrb r1, [r2]
	ands r0, r1
	movs r1, #0x80
	orrs r0, r1
	strb r0, [r2]
	adds r0, r3, #0
	adds r0, #0x44
	movs r1, #0
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r1, r3, #0
	adds r1, #0x46
	movs r0, #0x10
	strb r0, [r1]
	subs r1, #0x10
	movs r0, #0x20
	ldrb r2, [r1]
	orrs r0, r2
	strb r0, [r1]
	movs r0, #0x21
	rsbs r0, r0, #0
	ldrb r1, [r3, #1]
	ands r0, r1
	movs r1, #0x41
	rsbs r1, r1, #0
	ands r0, r1
	movs r1, #0x7f
	ands r0, r1
	strb r0, [r3, #1]
	movs r0, #0
	bl SetOnHBlankA
	pop {r0}
	bx r0
	.align 2, 0
_080B706C: .4byte gDispIo

	thumb_func_start sub_80B7070
sub_80B7070: @ 0x080B7070
	push {lr}
	adds r1, r0, #0
	ldr r0, _080B7080 @ =gUnk_08DB10D4
	bl Proc_StartBlocking
	pop {r0}
	bx r0
	.align 2, 0
_080B7080: .4byte gUnk_08DB10D4

	thumb_func_start sub_80B7084
sub_80B7084: @ 0x080B7084
	ldr r1, _080B7090 @ =gAnims
	movs r2, #4
	ldrsh r1, [r1, r2]
	subs r0, r0, r1
	bx lr
	.align 2, 0
_080B7090: .4byte gAnims

	thumb_func_start sub_80B7094
sub_80B7094: @ 0x080B7094
	ldr r1, _080B70A0 @ =gAnims
	movs r2, #6
	ldrsh r1, [r1, r2]
	subs r0, r0, r1
	bx lr
	.align 2, 0
_080B70A0: .4byte gAnims

	thumb_func_start sub_80B70A4
sub_80B70A4: @ 0x080B70A4
	push {r4, lr}
	adds r3, r0, #0
	ldr r4, _080B70CC @ =gUnk_08DB1074
	asrs r0, r3, #5
	lsls r0, r0, #2
	asrs r2, r1, #5
	lsls r2, r2, #4
	adds r0, r0, r2
	adds r0, r0, r4
	ldr r0, [r0]
	movs r2, #0x1f
	ands r1, r2
	lsls r1, r1, #5
	ands r3, r2
	adds r1, r1, r3
	lsls r1, r1, #5
	adds r0, r0, r1
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080B70CC: .4byte gUnk_08DB1074

	thumb_func_start sub_80B70D0
sub_80B70D0: @ 0x080B70D0
	push {r4, lr}
	adds r3, r0, #0
	ldr r4, _080B70FC @ =gUnk_08DB10A4
	asrs r0, r3, #5
	lsls r0, r0, #2
	asrs r2, r1, #5
	lsls r2, r2, #4
	adds r0, r0, r2
	adds r0, r0, r4
	ldr r0, [r0]
	movs r4, #0x1f
	adds r2, r4, #0
	bics r2, r1
	lsls r2, r2, #6
	adds r2, #2
	adds r0, r0, r2
	ands r3, r4
	lsls r3, r3, #1
	adds r0, r0, r3
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080B70FC: .4byte gUnk_08DB10A4

	thumb_func_start sub_80B7100
sub_80B7100: @ 0x080B7100
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x10
	bl sub_80A06BC
	mov sb, r0
	movs r1, #0
	add r0, sp, #0xc
_080B7116:
	str r1, [r0]
	subs r0, #4
	cmp r0, r13
	bge _080B7116
	bl GetNextChapterStatsSlot
	mov r8, r0
	movs r5, #0
	cmp r5, r8
	bge _080B71CE
	ldr r6, _080B71F4 @ =gUnk_08D62110
	movs r7, #0x94
	movs r0, #0x2d
	adds r0, r0, r6
	mov sl, r0
_080B7134:
	adds r0, r5, #0
	bl GetChapterStats
	adds r4, r0, #0
	ldr r0, [r4]
	lsls r0, r0, #0x19
	lsrs r0, r0, #0x19
	bl sub_80A0654
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080B71C8
	bl sub_8031B54
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r1, [r4]
	lsls r1, r1, #0x19
	lsrs r1, r1, #0x19
	muls r1, r7, r1
	adds r0, r0, r1
	adds r1, r6, #0
	adds r1, #0x39
	adds r0, r0, r1
	ldr r1, [sp]
	ldrb r0, [r0]
	adds r1, r0, r1
	str r1, [sp]
	bl sub_8031B54
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r1, [r4]
	lsls r1, r1, #0x19
	lsrs r1, r1, #0x19
	muls r1, r7, r1
	adds r0, r0, r1
	adds r1, r6, #0
	adds r1, #0x35
	adds r0, r0, r1
	ldr r1, [sp, #4]
	ldrb r0, [r0]
	adds r1, r0, r1
	str r1, [sp, #4]
	bl sub_8031B54
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r1, [r4]
	lsls r1, r1, #0x19
	lsrs r1, r1, #0x19
	muls r1, r7, r1
	adds r0, r0, r1
	adds r1, r6, #0
	adds r1, #0x31
	adds r0, r0, r1
	ldr r1, [sp, #8]
	ldrb r0, [r0]
	adds r1, r0, r1
	str r1, [sp, #8]
	bl sub_8031B54
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r1, [r4]
	lsls r1, r1, #0x19
	lsrs r1, r1, #0x19
	muls r1, r7, r1
	adds r0, r0, r1
	add r0, sl
	ldr r1, [sp, #0xc]
	ldrb r0, [r0]
	adds r1, r0, r1
	str r1, [sp, #0xc]
_080B71C8:
	adds r5, #1
	cmp r5, r8
	blt _080B7134
_080B71CE:
	movs r5, #0
	mov r1, sp
_080B71D2:
	ldr r0, [r1]
	cmp sb, r0
	bgt _080B71E0
	adds r1, #4
	adds r5, #1
	cmp r5, #3
	ble _080B71D2
_080B71E0:
	adds r0, r5, #0
	add sp, #0x10
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_080B71F4: .4byte gUnk_08D62110

	thumb_func_start sub_80B71F8
sub_80B71F8: @ 0x080B71F8
	push {lr}
	sub sp, #4
	ldr r1, _080B722C @ =gUnk_08622C44
	mov r0, sp
	movs r2, #4
	bl memcpy
	bl sub_80B75A4
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	movs r1, #0
_080B7210:
	mov r3, sp
	adds r0, r3, r1
	ldrb r0, [r0]
	cmp r2, r0
	bge _080B7224
	adds r0, r1, #1
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	cmp r1, #3
	bls _080B7210
_080B7224:
	adds r0, r1, #0
	add sp, #4
	pop {r1}
	bx r1
	.align 2, 0
_080B722C: .4byte gUnk_08622C44

	thumb_func_start sub_80B7230
sub_80B7230: @ 0x080B7230
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x10
	bl sub_80A0B88
	mov sb, r0
	movs r1, #0
	add r0, sp, #0xc
_080B7246:
	str r1, [r0]
	subs r0, #4
	cmp r0, r13
	bge _080B7246
	bl GetNextChapterStatsSlot
	mov r8, r0
	movs r5, #0
	cmp r5, r8
	bge _080B72FE
	ldr r6, _080B7324 @ =gUnk_08D62110
	movs r7, #0x94
	movs r0, #0x3e
	adds r0, r0, r6
	mov sl, r0
_080B7264:
	adds r0, r5, #0
	bl GetChapterStats
	adds r4, r0, #0
	ldr r0, [r4]
	lsls r0, r0, #0x19
	lsrs r0, r0, #0x19
	bl sub_80A0654
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080B72F8
	bl sub_8031B54
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x17
	ldr r1, [r4]
	lsls r1, r1, #0x19
	lsrs r1, r1, #0x19
	muls r1, r7, r1
	adds r0, r0, r1
	adds r1, r6, #0
	adds r1, #0x56
	adds r0, r0, r1
	ldr r1, [sp]
	ldrh r0, [r0]
	adds r1, r0, r1
	str r1, [sp]
	bl sub_8031B54
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x17
	ldr r1, [r4]
	lsls r1, r1, #0x19
	lsrs r1, r1, #0x19
	muls r1, r7, r1
	adds r0, r0, r1
	adds r1, r6, #0
	adds r1, #0x4e
	adds r0, r0, r1
	ldr r1, [sp, #4]
	ldrh r0, [r0]
	adds r1, r0, r1
	str r1, [sp, #4]
	bl sub_8031B54
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x17
	ldr r1, [r4]
	lsls r1, r1, #0x19
	lsrs r1, r1, #0x19
	muls r1, r7, r1
	adds r0, r0, r1
	adds r1, r6, #0
	adds r1, #0x46
	adds r0, r0, r1
	ldr r1, [sp, #8]
	ldrh r0, [r0]
	adds r1, r0, r1
	str r1, [sp, #8]
	bl sub_8031B54
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x17
	ldr r1, [r4]
	lsls r1, r1, #0x19
	lsrs r1, r1, #0x19
	muls r1, r7, r1
	adds r0, r0, r1
	add r0, sl
	ldr r1, [sp, #0xc]
	ldrh r0, [r0]
	adds r1, r0, r1
	str r1, [sp, #0xc]
_080B72F8:
	adds r5, #1
	cmp r5, r8
	blt _080B7264
_080B72FE:
	movs r5, #0
	mov r1, sp
_080B7302:
	ldr r0, [r1]
	cmp sb, r0
	blt _080B7310
	adds r1, #4
	adds r5, #1
	cmp r5, #3
	ble _080B7302
_080B7310:
	adds r0, r5, #0
	add sp, #0x10
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_080B7324: .4byte gUnk_08D62110

	thumb_func_start sub_80B7328
sub_80B7328: @ 0x080B7328
	push {lr}
	sub sp, #4
	ldr r1, _080B7358 @ =gUnk_08622C48
	mov r0, sp
	movs r2, #4
	bl memcpy
	bl sub_80B75DC
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	movs r1, #0
_080B7340:
	mov r3, sp
	adds r0, r3, r1
	ldrb r0, [r0]
	cmp r2, r0
	blt _080B7350
	adds r1, #1
	cmp r1, #3
	ble _080B7340
_080B7350:
	adds r0, r1, #0
	add sp, #4
	pop {r1}
	bx r1
	.align 2, 0
_080B7358: .4byte gUnk_08622C48

	thumb_func_start sub_80B735C
sub_80B735C: @ 0x080B735C
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	bl sub_8017574
	mov r8, r0
	movs r6, #0
	bl GetNextChapterStatsSlot
	adds r7, r0, #0
	movs r5, #0
	cmp r6, r7
	bge _080B73B4
	ldr r0, _080B73C8 @ =gUnk_08D62170
	mov sb, r0
_080B737C:
	adds r0, r5, #0
	bl GetChapterStats
	adds r4, r0, #0
	ldr r0, [r4]
	lsls r0, r0, #0x19
	lsrs r0, r0, #0x19
	bl sub_80A0654
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080B73AE
	bl sub_8031B54
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x16
	ldr r1, [r4]
	lsls r1, r1, #0x19
	lsrs r1, r1, #0x19
	movs r2, #0x94
	muls r1, r2, r1
	adds r0, r0, r1
	add r0, sb
	ldr r0, [r0]
	adds r6, r6, r0
_080B73AE:
	adds r5, #1
	cmp r5, r7
	blt _080B737C
_080B73B4:
	movs r0, #0x64
	mov r1, r8
	muls r1, r0, r1
	lsls r0, r6, #2
	adds r2, r0, r6
	lsls r0, r2, #4
	cmp r1, r0
	blo _080B73CC
	movs r0, #4
	b _080B73F0
	.align 2, 0
_080B73C8: .4byte gUnk_08D62170
_080B73CC:
	lsls r0, r6, #4
	subs r0, r0, r6
	lsls r0, r0, #2
	cmp r1, r0
	blo _080B73DA
	movs r0, #3
	b _080B73F0
_080B73DA:
	lsls r0, r2, #3
	cmp r1, r0
	blo _080B73E4
	movs r0, #2
	b _080B73F0
_080B73E4:
	lsls r0, r2, #2
	cmp r1, r0
	bhs _080B73EE
	movs r0, #0
	b _080B73F0
_080B73EE:
	movs r0, #1
_080B73F0:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	thumb_func_start sub_80B73FC
sub_80B73FC: @ 0x080B73FC
	push {r4, r5, r6, lr}
	ldr r6, [sp, #0x10]
	ldr r4, _080B7440 @ =gUnk_08DB6EBC
	adds r0, r0, r4
	adds r5, r4, #5
	adds r1, r1, r5
	ldrb r0, [r0]
	ldrb r1, [r1]
	adds r1, r0, r1
	adds r0, r4, #0
	adds r0, #0xa
	adds r2, r2, r0
	ldrb r2, [r2]
	adds r1, r2, r1
	adds r0, #5
	adds r3, r3, r0
	ldrb r3, [r3]
	adds r1, r3, r1
	adds r4, #0x14
	adds r6, r6, r4
	ldrb r6, [r6]
	adds r1, r6, r1
	movs r0, #0
	ldr r2, _080B7444 @ =gUnk_08DB6ED6
_080B742C:
	ldrh r3, [r2]
	cmp r1, r3
	blo _080B743A
	adds r2, #2
	adds r0, #1
	cmp r0, #4
	ble _080B742C
_080B743A:
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_080B7440: .4byte gUnk_08DB6EBC
_080B7444: .4byte gUnk_08DB6ED6

	thumb_func_start sub_80B7448
sub_80B7448: @ 0x080B7448
	push {r4, lr}
	ldr r3, _080B7478 @ =gUnk_08DB6EE2
	adds r0, r0, r3
	adds r4, r3, #5
	adds r1, r1, r4
	ldrb r0, [r0]
	ldrb r1, [r1]
	adds r4, r0, r1
	adds r3, #0xa
	adds r2, r2, r3
	ldrb r2, [r2]
	adds r4, r2, r4
	movs r0, #0
	ldr r1, _080B747C @ =gUnk_08DB6EF2
_080B7464:
	ldrh r2, [r1]
	cmp r4, r2
	blo _080B7472
	adds r1, #2
	adds r0, #1
	cmp r0, #4
	ble _080B7464
_080B7472:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080B7478: .4byte gUnk_08DB6EE2
_080B747C: .4byte gUnk_08DB6EF2

	thumb_func_start sub_80B7480
sub_80B7480: @ 0x080B7480
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	sub sp, #4
	bl sub_80B7100
	mov r8, r0
	bl sub_80B71F8
	adds r6, r0, #0
	bl sub_80B735C
	adds r5, r0, #0
	bl sub_80B7230
	adds r4, r0, #0
	bl sub_80B7328
	str r0, [sp]
	mov r0, r8
	adds r1, r6, #0
	adds r2, r5, #0
	adds r3, r4, #0
	bl sub_80B73FC
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_80B74C0
sub_80B74C0: @ 0x080B74C0
	push {r4, r5, lr}
	sub sp, #0x10
	ldr r0, _080B7538 @ =gPlaySt
	ldrh r5, [r0, #0x10]
	movs r1, #0xe
	ldrsb r1, [r0, r1]
	movs r0, #0x94
	muls r1, r0, r1
	ldr r0, _080B753C @ =gUnk_08D62110
	adds r4, r1, r0
	bl sub_8031B54
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r1, r4, #0
	adds r1, #0x39
	adds r1, r1, r0
	ldrb r0, [r1]
	str r0, [sp]
	bl sub_8031B54
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r1, r4, #0
	adds r1, #0x35
	adds r1, r1, r0
	ldrb r0, [r1]
	str r0, [sp, #4]
	bl sub_8031B54
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r1, r4, #0
	adds r1, #0x31
	adds r1, r1, r0
	ldrb r0, [r1]
	str r0, [sp, #8]
	bl sub_8031B54
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r1, r4, #0
	adds r1, #0x2d
	adds r1, r1, r0
	ldrb r0, [r1]
	str r0, [sp, #0xc]
	movs r2, #0
	mov r1, sp
_080B7520:
	ldr r0, [r1]
	cmp r5, r0
	bgt _080B752E
	adds r1, #4
	adds r2, #1
	cmp r2, #3
	ble _080B7520
_080B752E:
	adds r0, r2, #0
	add sp, #0x10
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_080B7538: .4byte gPlaySt
_080B753C: .4byte gUnk_08D62110

	thumb_func_start sub_80B7540
sub_80B7540: @ 0x080B7540
	push {lr}
	sub sp, #4
	ldr r1, _080B7574 @ =gUnk_08622C4C
	mov r0, sp
	movs r2, #4
	bl memcpy
	bl sub_80B75FC
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	movs r1, #0
_080B7558:
	mov r3, sp
	adds r0, r3, r1
	ldrb r0, [r0]
	cmp r2, r0
	bge _080B756C
	adds r0, r1, #1
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	cmp r1, #3
	bls _080B7558
_080B756C:
	adds r0, r1, #0
	add sp, #4
	pop {r1}
	bx r1
	.align 2, 0
_080B7574: .4byte gUnk_08622C4C

	thumb_func_start sub_80B7578
sub_80B7578: @ 0x080B7578
	ldr r2, _080B759C @ =gUnk_08DB6EFE
	adds r0, r0, r2
	adds r2, #5
	adds r1, r1, r2
	ldrb r0, [r0]
	ldrb r1, [r1]
	adds r2, r0, r1
	movs r0, #0
	ldr r1, _080B75A0 @ =gUnk_08DB6F08
_080B758A:
	ldrh r3, [r1]
	cmp r2, r3
	blo _080B7598
	adds r1, #2
	adds r0, #1
	cmp r0, #4
	ble _080B758A
_080B7598:
	bx lr
	.align 2, 0
_080B759C: .4byte gUnk_08DB6EFE
_080B75A0: .4byte gUnk_08DB6F08

	thumb_func_start sub_80B75A4
sub_80B75A4: @ 0x080B75A4
	push {r4, r5, lr}
	movs r5, #0
	movs r4, #1
_080B75AA:
	adds r0, r4, #0
	bl GetUnit
	adds r1, r0, #0
	cmp r1, #0
	beq _080B75C8
	ldr r0, [r1]
	cmp r0, #0
	beq _080B75C8
	ldr r0, [r1, #0xc]
	ldr r1, _080B75D8 @ =0x00010004
	ands r0, r1
	cmp r0, #4
	bne _080B75C8
	adds r5, #1
_080B75C8:
	adds r4, #1
	cmp r4, #0x3f
	ble _080B75AA
	lsls r0, r5, #0x10
	lsrs r0, r0, #0x10
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_080B75D8: .4byte 0x00010004

	thumb_func_start sub_80B75DC
sub_80B75DC: @ 0x080B75DC
	push {r4, lr}
	bl sub_80A0AF0
	adds r4, r0, #0
	bl sub_80A0B14
	movs r1, #0x64
	muls r0, r1, r0
	adds r1, r4, #0
	bl __divsi3
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	pop {r4}
	pop {r1}
	bx r1

	thumb_func_start sub_80B75FC
sub_80B75FC: @ 0x080B75FC
	push {r4, r5, lr}
	movs r5, #0
	movs r4, #1
_080B7602:
	adds r0, r4, #0
	bl GetUnit
	cmp r0, #0
	beq _080B7636
	ldr r2, [r0]
	cmp r2, #0
	beq _080B7636
	ldr r0, [r0, #0xc]
	ldr r1, _080B7648 @ =0x00010004
	ands r0, r1
	cmp r0, #4
	bne _080B7636
	ldrb r0, [r2, #4]
	bl GetPidStats
	ldrb r0, [r0, #5]
	lsls r1, r0, #0x1a
	lsrs r1, r1, #0x1a
	ldr r0, _080B764C @ =gPlaySt
	ldrb r0, [r0, #0xe]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r1, r0
	bne _080B7636
	adds r5, #1
_080B7636:
	adds r4, #1
	cmp r4, #0x3f
	ble _080B7602
	lsls r0, r5, #0x10
	lsrs r0, r0, #0x10
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_080B7648: .4byte 0x00010004
_080B764C: .4byte gPlaySt

	thumb_func_start nullsub_90
nullsub_90: @ 0x080B7650
	bx lr
	.align 2, 0

	thumb_func_start sub_80B7654
sub_80B7654: @ 0x080B7654
	push {r4, r5, r6, lr}
	bl sub_8017574
	ldr r1, _080B769C @ =gPlaySt
	ldr r5, [r1, #0x30]
	subs r5, r0, r5
	str r0, [r1, #0x30]
	bl GetNextChapterStatsSlot
	subs r0, #1
	bl GetChapterStats
	adds r6, r0, #0
	ldr r4, _080B76A0 @ =gUnk_08D62110
	bl sub_8031B54
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x16
	ldr r1, [r6]
	lsls r1, r1, #0x19
	lsrs r1, r1, #0x19
	movs r2, #0x94
	muls r1, r2, r1
	adds r0, r0, r1
	adds r4, #0x60
	adds r0, r0, r4
	ldr r1, [r0]
	movs r0, #0x64
	muls r5, r0, r5
	lsls r0, r1, #2
	adds r2, r0, r1
	lsls r0, r2, #4
	cmp r5, r0
	blt _080B76A4
	movs r0, #4
	b _080B76C8
	.align 2, 0
_080B769C: .4byte gPlaySt
_080B76A0: .4byte gUnk_08D62110
_080B76A4:
	lsls r0, r1, #4
	subs r0, r0, r1
	lsls r0, r0, #2
	cmp r5, r0
	blt _080B76B2
	movs r0, #3
	b _080B76C8
_080B76B2:
	lsls r0, r2, #3
	cmp r5, r0
	blt _080B76BC
	movs r0, #2
	b _080B76C8
_080B76BC:
	lsls r0, r2, #2
	cmp r5, r0
	bge _080B76C6
	movs r0, #0
	b _080B76C8
_080B76C6:
	movs r0, #1
_080B76C8:
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_80B76D0
sub_80B76D0: @ 0x080B76D0
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	bl sub_80A0AF0
	adds r4, r0, #0
	bl sub_80A0B14
	adds r5, r0, #0
	ldr r7, _080B7704 @ =0x000FFFFF
	cmp r4, r7
	ble _080B76EC
	adds r4, r7, #0
_080B76EC:
	cmp r5, r7
	ble _080B76F2
	adds r5, r7, #0
_080B76F2:
	ldr r6, _080B7708 @ =gPlaySt
	ldr r0, [r6, #0x34]
	mov r8, r0
	lsls r0, r0, #0xc
	lsrs r2, r0, #0xc
	cmp r4, r2
	bne _080B770C
	movs r0, #0x28
	b _080B7758
	.align 2, 0
_080B7704: .4byte 0x000FFFFF
_080B7708: .4byte gPlaySt
_080B770C:
	ldrh r1, [r6, #0x36]
	lsrs r1, r1, #4
	mov ip, r1
	movs r3, #0x38
	adds r3, r3, r6
	mov sb, r3
	ldrb r1, [r3]
	lsls r0, r1, #0xc
	mov r3, ip
	orrs r0, r3
	subs r0, r5, r0
	movs r1, #0x64
	muls r0, r1, r0
	subs r1, r4, r2
	bl __divsi3
	adds r2, r0, #0
	cmp r2, #0x64
	ble _080B7734
	movs r2, #0x64
_080B7734:
	ands r4, r7
	ldr r0, _080B7764 @ =0xFFF00000
	mov r1, r8
	ands r0, r1
	orrs r0, r4
	str r0, [r6, #0x34]
	ldr r1, _080B7768 @ =0x00000FFF
	ands r1, r5
	lsls r1, r1, #4
	movs r0, #0xf
	ldrh r3, [r6, #0x36]
	ands r0, r3
	orrs r0, r1
	strh r0, [r6, #0x36]
	lsrs r0, r5, #0xc
	mov r1, sb
	strb r0, [r1]
	adds r0, r2, #0
_080B7758:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_080B7764: .4byte 0xFFF00000
_080B7768: .4byte 0x00000FFF

	thumb_func_start sub_80B776C
sub_80B776C: @ 0x080B776C
	push {lr}
	sub sp, #4
	ldr r1, _080B779C @ =gUnk_08622C48
	mov r0, sp
	movs r2, #4
	bl memcpy
	bl sub_80B76D0
	adds r2, r0, #0
	movs r1, #0
_080B7782:
	mov r3, sp
	adds r0, r3, r1
	ldrb r0, [r0]
	cmp r2, r0
	blt _080B7792
	adds r1, #1
	cmp r1, #3
	ble _080B7782
_080B7792:
	adds r0, r1, #0
	add sp, #4
	pop {r1}
	bx r1
	.align 2, 0
_080B779C: .4byte gUnk_08622C48

	thumb_func_start sub_80B77A0
sub_80B77A0: @ 0x080B77A0
	push {r4, r5, r6, r7, lr}
	sub sp, #0x10
	movs r1, #0
	add r0, sp, #0xc
_080B77A8:
	str r1, [r0]
	subs r0, #4
	cmp r0, r13
	bge _080B77A8
	bl sub_80A0B88
	adds r1, r0, #0
	ldr r4, _080B7870 @ =0x000FFFFF
	cmp r1, r4
	ble _080B77BE
	adds r1, r4, #0
_080B77BE:
	ldr r3, _080B7874 @ =gPlaySt
	ldr r2, [r3, #0x38]
	lsls r0, r2, #4
	lsrs r0, r0, #0xc
	subs r7, r1, r0
	ands r1, r4
	lsls r1, r1, #8
	ldr r0, _080B7878 @ =0xF00000FF
	ands r0, r2
	orrs r0, r1
	str r0, [r3, #0x38]
	bl GetNextChapterStatsSlot
	subs r0, #1
	bl GetChapterStats
	adds r5, r0, #0
	bl sub_8031B54
	ldr r6, _080B787C @ =gUnk_08D62110
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x17
	ldr r1, [r5]
	lsls r1, r1, #0x19
	lsrs r1, r1, #0x19
	movs r4, #0x94
	muls r1, r4, r1
	adds r0, r0, r1
	adds r1, r6, #0
	adds r1, #0x56
	adds r0, r0, r1
	ldrh r0, [r0]
	str r0, [sp]
	bl sub_8031B54
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x17
	ldr r1, [r5]
	lsls r1, r1, #0x19
	lsrs r1, r1, #0x19
	muls r1, r4, r1
	adds r0, r0, r1
	adds r1, r6, #0
	adds r1, #0x4e
	adds r0, r0, r1
	ldrh r0, [r0]
	str r0, [sp, #4]
	bl sub_8031B54
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x17
	ldr r1, [r5]
	lsls r1, r1, #0x19
	lsrs r1, r1, #0x19
	muls r1, r4, r1
	adds r0, r0, r1
	adds r1, r6, #0
	adds r1, #0x46
	adds r0, r0, r1
	ldrh r0, [r0]
	str r0, [sp, #8]
	bl sub_8031B54
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x17
	ldr r1, [r5]
	lsls r1, r1, #0x19
	lsrs r1, r1, #0x19
	muls r1, r4, r1
	adds r0, r0, r1
	adds r1, r6, #0
	adds r1, #0x3e
	adds r0, r0, r1
	ldrh r0, [r0]
	str r0, [sp, #0xc]
	movs r2, #0
	mov r1, sp
_080B7858:
	ldr r0, [r1]
	cmp r7, r0
	blt _080B7866
	adds r1, #4
	adds r2, #1
	cmp r2, #3
	ble _080B7858
_080B7866:
	adds r0, r2, #0
	add sp, #0x10
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_080B7870: .4byte 0x000FFFFF
_080B7874: .4byte gPlaySt
_080B7878: .4byte 0xF00000FF
_080B787C: .4byte gUnk_08D62110

	thumb_func_start sub_80B7880
sub_80B7880: @ 0x080B7880
	push {r4, r5, r6, lr}
	sub sp, #4
	bl GetNextChapterStatsSlot
	cmp r0, #0
	ble _080B794A
	ldr r6, _080B7954 @ =gPlaySt
	ldrb r0, [r6, #0x1b]
	cmp r0, #3
	bgt _080B7902
	cmp r0, #1
	blt _080B7902
	bl sub_80B74C0
	adds r5, r6, #0
	adds r5, #0x3e
	movs r4, #7
	ands r0, r4
	lsls r0, r0, #2
	movs r1, #0x1d
	rsbs r1, r1, #0
	ldrb r2, [r5]
	ands r1, r2
	orrs r1, r0
	strb r1, [r5]
	bl sub_80B7540
	lsls r0, r0, #5
	movs r1, #0x1f
	ldrb r3, [r5]
	ands r1, r3
	orrs r1, r0
	strb r1, [r5]
	bl sub_80B7654
	movs r1, #7
	ands r1, r0
	lsls r1, r1, #0xf
	ldr r0, [r6, #0x3c]
	ldr r2, _080B7958 @ =0xFFFC7FFF
	ands r0, r2
	orrs r0, r1
	str r0, [r6, #0x3c]
	bl sub_80B776C
	movs r1, #7
	ands r0, r1
	lsls r0, r0, #6
	ldr r1, _080B795C @ =0xFFFFFE3F
	ldrh r2, [r6, #0x3c]
	ands r1, r2
	orrs r1, r0
	strh r1, [r6, #0x3c]
	bl sub_80B77A0
	adds r2, r6, #0
	adds r2, #0x3d
	ands r0, r4
	lsls r0, r0, #1
	movs r1, #0xf
	rsbs r1, r1, #0
	ldrb r3, [r2]
	ands r1, r3
	orrs r1, r0
	strb r1, [r2]
_080B7902:
	ldr r5, _080B7954 @ =gPlaySt
	adds r0, r5, #0
	adds r0, #0x3e
	ldrb r1, [r0]
	lsls r0, r1, #0x1b
	lsrs r0, r0, #0x1d
	lsrs r1, r1, #5
	ldr r2, [r5, #0x3c]
	lsls r2, r2, #0xe
	lsrs r2, r2, #0x1d
	adds r3, r5, #0
	adds r3, #0x3d
	ldrb r3, [r3]
	lsls r3, r3, #0x1c
	lsrs r3, r3, #0x1d
	ldrh r6, [r5, #0x3c]
	lsls r4, r6, #0x17
	lsrs r4, r4, #0x1d
	str r4, [sp]
	bl sub_80B73FC
	ldrh r2, [r5, #0x2c]
	lsls r1, r2, #0x13
	lsrs r1, r1, #0x17
	adds r1, r1, r0
	cmp r1, #0xff
	ble _080B793A
	movs r1, #0xff
_080B793A:
	ldr r3, _080B7960 @ =0x000001FF
	adds r0, r3, #0
	ands r1, r0
	lsls r1, r1, #4
	ldr r0, _080B7964 @ =0xFFFFE00F
	ands r0, r2
	orrs r0, r1
	strh r0, [r5, #0x2c]
_080B794A:
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080B7954: .4byte gPlaySt
_080B7958: .4byte 0xFFFC7FFF
_080B795C: .4byte 0xFFFFFE3F
_080B7960: .4byte 0x000001FF
_080B7964: .4byte 0xFFFFE00F

	thumb_func_start sub_80B7968
sub_80B7968: @ 0x080B7968
	adds r1, r0, #0
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _080B7978 @ =gUnk_08DB793C
	adds r0, r0, r1
	bx lr
	.align 2, 0
_080B7978: .4byte gUnk_08DB793C

	thumb_func_start nullsub_91
nullsub_91: @ 0x080B797C
	bx lr
	.align 2, 0

	thumb_func_start sub_80B7980
sub_80B7980: @ 0x080B7980
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	mov sb, r0
	adds r7, r1, #0
	mov r8, r2
	mov sl, r3
	ldr r0, [sp, #0x20]
	bl sub_80B7968
	adds r6, r0, #0
	movs r5, #0
	movs r0, #0xc0
	lsls r0, r0, #0x13
	adds r4, r7, r0
_080B79A2:
	ldr r0, [r6]
	lsls r1, r5, #2
	adds r1, r1, r0
	ldr r0, [r1]
	adds r1, r4, #0
	bl Decompress
	movs r2, #0x80
	lsls r2, r2, #4
	adds r4, r4, r2
	adds r5, #1
	cmp r5, #9
	ble _080B79A2
	ldr r1, [r6, #4]
	mov r3, r8
	lsls r2, r3, #0xc
	lsls r0, r7, #0x11
	lsrs r0, r0, #0x16
	adds r2, r2, r0
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	mov r0, sb
	bl TmApplyTsa_thm
	ldr r0, [r6, #8]
	mov r2, r8
	lsls r1, r2, #5
	mov r3, sl
	lsls r2, r3, #5
	bl ApplyPaletteExt
	ldr r0, [sp, #0x20]
	cmp r0, #0x7f
	bgt _080B79EE
	movs r0, #0
	ldr r1, [sp, #0x20]
	bl sub_80A02A8
_080B79EE:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_80B79FC
sub_80B79FC: @ 0x080B79FC
	push {r4, lr}
	ldr r0, _080B7A68 @ =0x04000006
	ldrh r0, [r0]
	adds r0, #1
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	cmp r3, #0xa0
	bls _080B7A0E
	movs r3, #0
_080B7A0E:
	cmp r3, #0x1f
	bhi _080B7A2A
	lsrs r2, r3, #1
	ldr r1, _080B7A6C @ =0x04000050
	movs r4, #0xfd
	lsls r4, r4, #6
	adds r0, r4, #0
	strh r0, [r1]
	adds r1, #2
	movs r0, #0x10
	subs r0, r0, r2
	lsls r0, r0, #8
	adds r0, r0, r2
	strh r0, [r1]
_080B7A2A:
	cmp r3, #0x80
	bls _080B7A4A
	movs r1, #0xa0
	subs r1, r1, r3
	asrs r1, r1, #1
	ldr r2, _080B7A6C @ =0x04000050
	movs r4, #0xfd
	lsls r4, r4, #6
	adds r0, r4, #0
	strh r0, [r2]
	adds r2, #2
	movs r0, #0x10
	subs r0, r0, r1
	lsls r0, r0, #8
	adds r0, r0, r1
	strh r0, [r2]
_080B7A4A:
	cmp r3, #0x20
	bne _080B7A62
	ldr r2, _080B7A6C @ =0x04000050
	ldr r1, _080B7A70 @ =0x030027CC
	ldrh r0, [r1]
	strh r0, [r2]
	adds r2, #2
	ldrb r3, [r1, #9]
	lsls r0, r3, #8
	ldrb r1, [r1, #8]
	orrs r0, r1
	strh r0, [r2]
_080B7A62:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080B7A68: .4byte 0x04000006
_080B7A6C: .4byte 0x04000050
_080B7A70: .4byte 0x030027CC

	thumb_func_start sub_80B7A74
sub_80B7A74: @ 0x080B7A74
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	ldr r5, _080B7AA8 @ =gUnk_08DB7D14
	ldr r0, _080B7AAC @ =gUnk_08DB7DCC
	ldr r4, [r0]
	mov r1, sp
	movs r0, #0
	strh r0, [r1]
	ldr r2, _080B7AB0 @ =0x0100005A
	mov r0, sp
	adds r1, r4, #0
	bl CpuSet
	ldr r1, _080B7AB4 @ =0x02000888
	movs r0, #0
	str r0, [r1]
	ldr r0, [r5]
	cmp r0, #0
	beq _080B7B26
	adds r7, r1, #0
_080B7A9C:
	ldr r0, [r5]
	cmp r0, #0xcd
	bne _080B7AB8
	str r5, [r4, #8]
	b _080B7B16
	.align 2, 0
_080B7AA8: .4byte gUnk_08DB7D14
_080B7AAC: .4byte gUnk_08DB7DCC
_080B7AB0: .4byte 0x0100005A
_080B7AB4: .4byte 0x02000888
_080B7AB8:
	bl GetUnitFromCharId
	adds r6, r0, #0
	cmp r6, #0
	beq _080B7B1E
	ldrb r0, [r5]
	bl GetPidStats
	adds r2, r0, #0
	str r5, [r4, #8]
	movs r1, #3
	adds r0, r1, #0
	ldrb r3, [r2, #0xc]
	ands r0, r3
	lsls r0, r0, #8
	ldrb r3, [r2, #0xb]
	orrs r0, r3
	cmp r0, #0xff
	ble _080B7AE0
	movs r0, #0xff
_080B7AE0:
	strb r0, [r4, #2]
	ldrb r0, [r2]
	strb r0, [r4, #3]
	adds r0, r1, #0
	ldrb r1, [r2, #0xc]
	ands r0, r1
	lsls r0, r0, #8
	ldrb r3, [r2, #0xb]
	orrs r0, r3
	cmp r0, #0xff
	bgt _080B7AFC
	ldrh r1, [r2, #0xc]
	lsrs r0, r1, #2
	b _080B7AFE
_080B7AFC:
	movs r0, #0xff
_080B7AFE:
	strb r0, [r4, #1]
	ldr r0, [r6, #0xc]
	movs r1, #4
	ands r0, r1
	cmp r0, #0
	beq _080B7B12
	ldrb r2, [r2, #5]
	lsls r0, r2, #0x1a
	lsrs r0, r0, #0x1a
	b _080B7B14
_080B7B12:
	movs r0, #0xff
_080B7B14:
	strb r0, [r4]
_080B7B16:
	adds r4, #0xc
	ldr r0, [r7]
	adds r0, #1
	str r0, [r7]
_080B7B1E:
	adds r5, #0xc
	ldr r0, [r5]
	cmp r0, #0
	bne _080B7A9C
_080B7B26:
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_80B7B30
sub_80B7B30: @ 0x080B7B30
	movs r2, #0
_080B7B32:
	ldrb r1, [r0]
	cmp r1, #0
	beq _080B7B46
	cmp r1, #1
	bne _080B7B42
	adds r0, #1
	adds r2, #1
	b _080B7B32
_080B7B42:
	adds r0, #2
	b _080B7B32
_080B7B46:
	adds r0, r2, #3
	bx lr
	.align 2, 0

	thumb_func_start sub_80B7B4C
sub_80B7B4C: @ 0x080B7B4C
	push {r4, r5, lr}
	ldr r0, _080B7B74 @ =gUnk_08DB7DCC
	ldr r4, [r0]
	ldr r1, _080B7B78 @ =0x02000884
	movs r0, #0
	str r0, [r1]
	ldr r0, [r4, #8]
	cmp r0, #0
	beq _080B7BAA
	adds r5, r1, #0
_080B7B60:
	ldr r2, [r4, #8]
	ldr r0, [r2]
	cmp r0, #0xcd
	bne _080B7B7C
	movs r0, #9
	strb r0, [r4, #4]
	ldr r0, [r5]
	adds r0, #9
	str r0, [r5]
	b _080B7BA2
	.align 2, 0
_080B7B74: .4byte gUnk_08DB7DCC
_080B7B78: .4byte 0x02000884
_080B7B7C:
	cmp r0, #3
	beq _080B7BA2
	movs r0, #0
	ldrsb r0, [r4, r0]
	cmp r0, #0
	blt _080B7B8C
	ldr r0, [r2, #8]
	b _080B7B8E
_080B7B8C:
	ldr r0, [r2, #4]
_080B7B8E:
	bl DecodeMsg
	bl sub_80B7B30
	strb r0, [r4, #4]
	ldr r0, [r5]
	ldrb r1, [r4, #4]
	adds r0, r1, r0
	str r0, [r5]
	ldr r1, _080B7BB8 @ =0x02000884
_080B7BA2:
	adds r4, #0xc
	ldr r0, [r4, #8]
	cmp r0, #0
	bne _080B7B60
_080B7BAA:
	ldr r0, [r1]
	adds r0, #5
	str r0, [r1]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080B7BB8: .4byte 0x02000884

	thumb_func_start sub_80B7BBC
sub_80B7BBC: @ 0x080B7BBC
	push {lr}
	bl sub_80B7A74
	bl sub_80B7B4C
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_80B7BCC
sub_80B7BCC: @ 0x080B7BCC
	push {r4, r5, lr}
	ldr r4, _080B7C08 @ =0x02000818
	ldr r1, _080B7C0C @ =0x06011000
	adds r0, r4, #0
	movs r2, #0xa
	bl InitSpriteTextFont
	adds r0, r4, #0
	bl SetTextFont
	adds r4, #0x18
	movs r5, #9
_080B7BE4:
	adds r0, r4, #0
	bl InitSpriteText
	adds r0, r4, #0
	movs r1, #0
	bl SpriteText_DrawBackgroundExt
	adds r4, #8
	subs r5, #1
	cmp r5, #0
	bge _080B7BE4
	movs r0, #0
	bl SetTextFont
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080B7C08: .4byte 0x02000818
_080B7C0C: .4byte 0x06011000

	thumb_func_start sub_80B7C10
sub_80B7C10: @ 0x080B7C10
	push {r4, r5, lr}
	ldr r4, _080B7C3C @ =0x02000818
	adds r0, r4, #0
	bl SetTextFont
	adds r5, r4, #0
	adds r5, #0x18
	movs r4, #9
_080B7C20:
	adds r0, r5, #0
	movs r1, #0
	bl SpriteText_DrawBackgroundExt
	adds r5, #8
	subs r4, #1
	cmp r4, #0
	bge _080B7C20
	movs r0, #0
	bl SetTextFont
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080B7C3C: .4byte 0x02000818

	thumb_func_start sub_80B7C40
sub_80B7C40: @ 0x080B7C40
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r4, _080B7C68 @ =0x02000818
	adds r0, r4, #0
	bl SetTextFont
	lsls r5, r5, #3
	adds r4, #0x18
	adds r5, r5, r4
	adds r0, r5, #0
	movs r1, #0
	bl SpriteText_DrawBackgroundExt
	movs r0, #0
	bl SetTextFont
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080B7C68: .4byte 0x02000818

	thumb_func_start sub_80B7C6C
sub_80B7C6C: @ 0x080B7C6C
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	movs r4, #0
	str r4, [sp]
_080B7C76:
	ldrb r0, [r1]
	cmp r0, #0
	blt _080B7C88
	cmp r0, #1
	ble _080B7C98
	cmp r0, #4
	bne _080B7C88
	adds r1, #1
	b _080B7C76
_080B7C88:
	adds r0, r1, #0
	mov r1, sp
	bl GetCharTextLen
	adds r1, r0, #0
	ldr r0, [sp]
	adds r4, r4, r0
	b _080B7C76
_080B7C98:
	movs r1, #0xe0
	subs r1, r1, r4
	lsrs r0, r1, #0x1f
	adds r1, r1, r0
	asrs r1, r1, #1
	adds r0, r5, #0
	bl Text_SetCursor
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start sub_80B7CB0
sub_80B7CB0: @ 0x080B7CB0
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r6, r2, #0
	mov r8, r3
	movs r1, #2
	bl Text_SetColor
	adds r0, r4, #0
	movs r1, #0x50
	bl Text_SetCursor
	adds r0, r4, #0
	adds r1, r5, #0
	bl Text_DrawNumberOrBlank
	adds r0, r4, #0
	movs r1, #0x58
	bl Text_SetCursor
	adds r0, r4, #0
	movs r1, #3
	bl Text_SetColor
	ldr r1, _080B7D58 @ =gUnk_08622C50
	adds r0, r4, #0
	bl Text_DrawString
	adds r0, r4, #0
	movs r1, #2
	bl Text_SetColor
	adds r0, r4, #0
	movs r1, #0x70
	bl Text_SetCursor
	adds r0, r4, #0
	adds r1, r6, #0
	bl Text_DrawNumberOrBlank
	adds r0, r4, #0
	movs r1, #0x78
	bl Text_SetCursor
	adds r0, r4, #0
	movs r1, #3
	bl Text_SetColor
	ldr r1, _080B7D5C @ =gUnk_08622C54
	adds r0, r4, #0
	bl Text_DrawString
	adds r0, r4, #0
	movs r1, #2
	bl Text_SetColor
	adds r0, r4, #0
	movs r1, #0x90
	bl Text_SetCursor
	adds r0, r4, #0
	mov r1, r8
	bl Text_DrawNumberOrBlank
	adds r0, r4, #0
	movs r1, #0x98
	bl Text_SetCursor
	adds r0, r4, #0
	movs r1, #3
	bl Text_SetColor
	ldr r1, _080B7D60 @ =gUnk_08622C58
	adds r0, r4, #0
	bl Text_DrawString
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080B7D58: .4byte gUnk_08622C50
_080B7D5C: .4byte gUnk_08622C54
_080B7D60: .4byte gUnk_08622C58

	thumb_func_start sub_80B7D64
sub_80B7D64: @ 0x080B7D64
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #0x88
	adds r7, r0, #0
	mov r8, r1
	movs r0, #0
	mov sb, r0
	add r2, sp, #0x80
	str r1, [r2]
	ldr r0, _080B7DF8 @ =gUnk_08DB7DC8
	ldr r0, [r0]
	add r1, sp, #0x84
	str r0, [r1]
	adds r6, r2, #0
	adds r4, r1, #0
	adds r5, r4, #0
_080B7D88:
	ldr r0, [r6]
	ldrb r1, [r0]
	cmp r1, #0
	beq _080B7E04
	cmp r1, #1
	bne _080B7E18
	ldr r0, [r4]
	strb r1, [r0]
	ldr r0, [r6]
	adds r0, #1
	add r1, sp, #0x80
	str r0, [r1]
	ldr r0, [r5]
	adds r0, #1
	str r0, [r5]
	movs r0, #1
	add sb, r0
	mov r0, sb
	cmp r0, #2
	bne _080B7D88
	adds r0, r7, #0
	ldr r1, [r4]
	movs r2, #1
	bl sub_80AB970
	str r0, [r5]
	adds r0, r7, #0
	bl GetROMChapterStruct
	adds r2, r0, #0
	ldr r0, _080B7DFC @ =gPlaySt
	movs r1, #0
	ldrb r0, [r0, #0x1b]
	cmp r0, #3
	bne _080B7DD0
	movs r1, #2
_080B7DD0:
	adds r0, r2, #0
	adds r0, #0x70
	adds r0, r0, r1
	ldrh r0, [r0]
	mov r1, sp
	bl DecodeMsgInBuffer
	ldr r1, [r4]
	bl AppendString
	str r0, [r5]
	ldr r0, _080B7E00 @ =0x00001182
	mov r1, sp
	bl DecodeMsgInBuffer
	ldr r1, [r5]
	bl AppendString
	str r0, [r5]
	b _080B7D88
	.align 2, 0
_080B7DF8: .4byte gUnk_08DB7DC8
_080B7DFC: .4byte gPlaySt
_080B7E00: .4byte 0x00001182
_080B7E04:
	ldr r0, [r4]
	strb r1, [r0]
	mov r0, r8
	str r0, [r6]
	ldr r0, _080B7E14 @ =gUnk_08DB7DC8
	ldr r0, [r0]
	str r0, [r5]
	b _080B7E22
	.align 2, 0
_080B7E14: .4byte gUnk_08DB7DC8
_080B7E18:
	adds r0, r6, #0
	adds r1, r4, #0
	bl sub_80ABAAC
	b _080B7D88
_080B7E22:
	ldr r1, [r4]
	ldrb r2, [r1]
	cmp r2, #0
	beq _080B7E48
	cmp r2, #1
	bne _080B7E3E
	ldr r0, [r6]
	strb r2, [r0]
	adds r1, #1
	str r1, [r4]
	adds r0, #1
	add r1, sp, #0x80
	str r0, [r1]
	b _080B7E22
_080B7E3E:
	adds r0, r4, #0
	adds r1, r6, #0
	bl sub_80ABAAC
	b _080B7E22
_080B7E48:
	ldr r0, [r6]
	ldr r1, [r4]
	ldrb r1, [r1]
	strb r1, [r0]
	add sp, #0x88
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_80B7E60
sub_80B7E60: @ 0x080B7E60
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	mov r8, r2
	adds r6, r3, #0
	ldr r3, _080B7EA8 @ =gUnk_08DB7DCC
	lsls r2, r0, #1
	adds r2, r2, r0
	lsls r2, r2, #2
	ldr r0, [r3]
	adds r4, r0, r2
	ldr r5, [r4, #8]
	lsls r1, r1, #3
	ldr r0, _080B7EAC @ =0x02000830
	adds r7, r1, r0
	subs r0, #0x18
	bl SetTextFont
	movs r0, #1
	bl SetTextFontGlyphs
	adds r0, r7, #0
	movs r1, #0
	bl SpriteText_DrawBackgroundExt
	adds r0, r7, #0
	movs r1, #1
	bl Text_SetColor
	mov r0, r8
	cmp r0, #0
	beq _080B7EB0
	cmp r0, #1
	beq _080B7EF8
	b _080B7F1E
	.align 2, 0
_080B7EA8: .4byte gUnk_08DB7DCC
_080B7EAC: .4byte 0x02000830
_080B7EB0:
	ldr r0, [r5]
	cmp r0, #0xcd
	bne _080B7ECC
	ldr r0, _080B7EC8 @ =gPlaySt
	adds r0, #0x2c
	ldrb r0, [r0]
	lsls r0, r0, #0x1f
	cmp r0, #0
	beq _080B7EE8
	ldr r0, [r5, #8]
	b _080B7EEA
	.align 2, 0
_080B7EC8: .4byte gPlaySt
_080B7ECC:
	movs r0, #0
	ldrsb r0, [r4, r0]
	cmp r0, #0
	blt _080B7EE8
	ldr r0, [r5, #8]
	bl DecodeMsg
	adds r1, r0, #0
	str r1, [r6]
	movs r0, #0
	ldrsb r0, [r4, r0]
	bl sub_80B7D64
	b _080B7EF0
_080B7EE8:
	ldr r0, [r5, #4]
_080B7EEA:
	bl DecodeMsg
	str r0, [r6]
_080B7EF0:
	bl sub_8013374
	str r0, [r6]
	b _080B7F1E
_080B7EF8:
	ldr r0, [r5]
	cmp r0, #0xcd
	beq _080B7F1E
	movs r0, #0
	ldrsb r0, [r4, r0]
	cmp r0, #0
	bge _080B7F1E
	movs r0, #0
	bl SetTextFontGlyphs
	ldrb r1, [r4, #1]
	ldrb r2, [r4, #2]
	ldrb r3, [r4, #3]
	adds r0, r7, #0
	bl sub_80B7CB0
	movs r0, #1
	bl SetTextFontGlyphs
_080B7F1E:
	ldr r1, [r6]
	adds r0, r7, #0
	bl sub_80B7C6C
_080B7F26:
	ldr r0, [r6]
	ldrb r2, [r0]
	adds r1, r0, #0
	cmp r2, #0
	beq _080B7F42
	cmp r2, #1
	beq _080B7F3E
	adds r0, r7, #0
	bl Text_DrawCharacter
	str r0, [r6]
	b _080B7F26
_080B7F3E:
	adds r0, #1
	str r0, [r6]
_080B7F42:
	movs r0, #0
	bl SetTextFont
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_80B7F54
sub_80B7F54: @ 0x080B7F54
	push {r4, r5, r6, r7, lr}
	ldr r3, _080B7F9C @ =gPal
	movs r0, #0x1f
	mov ip, r0
	movs r6, #0xf8
	lsls r6, r6, #2
	movs r5, #0xf8
	lsls r5, r5, #7
	movs r4, #0x7f
	movs r7, #0x1f
_080B7F68:
	ldrh r2, [r3]
	adds r1, r7, #0
	ands r1, r2
	lsrs r1, r1, #1
	mov r0, ip
	ands r1, r0
	adds r0, r6, #0
	ands r0, r2
	lsrs r0, r0, #1
	ands r0, r6
	adds r1, r1, r0
	adds r0, r5, #0
	ands r0, r2
	lsrs r0, r0, #1
	ands r0, r5
	adds r1, r1, r0
	strh r1, [r3]
	adds r3, #2
	subs r4, #1
	cmp r4, #0
	bge _080B7F68
	bl EnablePalSync
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B7F9C: .4byte gPal

	thumb_func_start sub_80B7FA0
sub_80B7FA0: @ 0x080B7FA0
	push {lr}
	adds r2, r0, #0
	ldr r3, _080B7FC4 @ =gPal
	lsls r1, r1, #4
	cmp r1, #0
	ble _080B7FBA
_080B7FAC:
	ldrh r0, [r2]
	strh r0, [r3]
	adds r2, #2
	adds r3, #2
	subs r1, #1
	cmp r1, #0
	bne _080B7FAC
_080B7FBA:
	bl EnablePalSync
	pop {r0}
	bx r0
	.align 2, 0
_080B7FC4: .4byte gPal

	thumb_func_start sub_80B7FC8
sub_80B7FC8: @ 0x080B7FC8
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r0, #0x40
	movs r1, #0
	ldrsh r0, [r0, r1]
	bl sub_80B7968
	adds r4, r0, #0
	movs r0, #3
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	ldr r0, [r4, #8]
	movs r2, #0x80
	lsls r2, r2, #1
	movs r1, #0
	movs r3, #0x20
	bl sub_80010CC
	ldr r0, _080B800C @ =gBg3Tm
	ldr r1, [r4, #4]
	movs r2, #0
	bl TmApplyTsa_thm
	movs r0, #8
	bl EnableBgSync
	movs r0, #0
	strh r0, [r5, #0x3e]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080B800C: .4byte gBg3Tm

	thumb_func_start sub_80B8010
sub_80B8010: @ 0x080B8010
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x40
	movs r1, #0
	ldrsh r0, [r0, r1]
	bl sub_80B7968
	movs r2, #0x3e
	ldrsh r1, [r4, r2]
	ldr r2, [r0]
	lsls r0, r1, #2
	adds r0, r0, r2
	ldr r0, [r0]
	lsls r1, r1, #0xb
	ldr r2, _080B8050 @ =0x06008000
	adds r1, r1, r2
	bl Decompress
	ldrh r0, [r4, #0x3e]
	adds r0, #1
	strh r0, [r4, #0x3e]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0xa
	bne _080B8048
	adds r0, r4, #0
	bl Proc_Break
_080B8048:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080B8050: .4byte 0x06008000

	thumb_func_start sub_80B8054
sub_80B8054: @ 0x080B8054
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	adds r4, r1, #0
	ldr r5, _080B8078 @ =gUnk_08DB7DD0
	adds r0, r5, #0
	bl Proc_Find
	cmp r0, #0
	bne _080B807C
	adds r0, r5, #0
	adds r1, r4, #0
	bl Proc_Start
	adds r1, r0, #0
	adds r1, #0x40
	strh r6, [r1]
	b _080B807E
	.align 2, 0
_080B8078: .4byte gUnk_08DB7DD0
_080B807C:
	movs r0, #0
_080B807E:
	pop {r4, r5, r6}
	pop {r1}
	bx r1

	thumb_func_start sub_80B8084
sub_80B8084: @ 0x080B8084
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r3, r1, #0
	adds r6, r2, #0
	movs r5, #0
	lsls r4, r4, #1
	cmp r4, #0x1f
	ble _080B809C
	ldr r5, _080B8098 @ =0x0000FE80
	b _080B80A4
	.align 2, 0
_080B8098: .4byte 0x0000FE80
_080B809C:
	cmp r4, #0x13
	ble _080B80A4
	movs r5, #0xa0
	lsls r5, r5, #2
_080B80A4:
	lsls r1, r4, #0xa
	ldr r0, _080B80D4 @ =0x00007FFF
	ands r1, r0
	ldr r0, _080B80D8 @ =0x06008000
	adds r1, r1, r0
	adds r0, r3, #0
	bl Decompress
	movs r0, #0x1f
	ands r0, r4
	lsls r0, r0, #6
	ldr r1, _080B80DC @ =gBg3Tm
	adds r0, r0, r1
	adds r2, r5, #0
	adds r1, r6, #0
	bl TmApplyTsa_thm
	movs r0, #8
	bl EnableBgSync
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080B80D4: .4byte 0x00007FFF
_080B80D8: .4byte 0x06008000
_080B80DC: .4byte gBg3Tm

	thumb_func_start sub_80B80E0
sub_80B80E0: @ 0x080B80E0
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r1, r4, #0
	adds r1, #0x44
	movs r0, #0
	strh r0, [r1]
	adds r1, #6
	ldr r0, _080B8128 @ =0x0000FFFF
	strh r0, [r1]
	ldr r0, [r4, #0x38]
	ldr r0, [r0]
	movs r2, #0x80
	lsls r2, r2, #1
	movs r1, #0
	movs r3, #0x20
	bl sub_80010CC
	ldr r0, [r4, #0x38]
	adds r0, #4
	str r0, [r4, #0x38]
	movs r5, #0
_080B810A:
	ldr r0, [r4, #0x38]
	ldr r1, [r0]
	ldr r2, [r0, #4]
	adds r0, r5, #0
	bl sub_80B8084
	ldr r0, [r4, #0x38]
	adds r0, #8
	str r0, [r4, #0x38]
	adds r5, #1
	cmp r5, #9
	ble _080B810A
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080B8128: .4byte 0x0000FFFF

	thumb_func_start sub_80B812C
sub_80B812C: @ 0x080B812C
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r6, r4, #0
	adds r6, #0x44
	ldrh r1, [r6]
	lsls r0, r1, #0x10
	adds r5, r4, #0
	adds r5, #0x4a
	asrs r3, r0, #0x17
	movs r1, #0
	ldrsh r0, [r5, r1]
	cmp r3, r0
	beq _080B8174
	ldr r2, [r4, #0x38]
	ldr r1, [r2]
	cmp r1, #0
	bne _080B8156
	adds r0, r4, #0
	bl Proc_Break
	b _080B8190
_080B8156:
	adds r0, r3, #0
	adds r0, #0xa
	ldr r2, [r2, #4]
	bl sub_80B8084
	ldr r0, [r4, #0x38]
	adds r0, #8
	str r0, [r4, #0x38]
	movs r0, #8
	bl EnableBgSync
	ldrh r6, [r6]
	lsls r0, r6, #0x10
	asrs r0, r0, #0x17
	strh r0, [r5]
_080B8174:
	adds r0, r4, #0
	adds r0, #0x44
	ldrh r1, [r0]
	ldrh r4, [r4, #0x3c]
	adds r2, r1, r4
	strh r2, [r0]
	lsls r2, r2, #0x10
	asrs r2, r2, #0x13
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	movs r0, #3
	movs r1, #0
	bl SetBgOffset
_080B8190:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_80B8198
sub_80B8198: @ 0x080B8198
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r1, r2, #0
	ldr r0, _080B81B0 @ =gUnk_08DB7E28
	bl Proc_Start
	str r4, [r0, #0x38]
	strh r5, [r0, #0x3c]
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_080B81B0: .4byte gUnk_08DB7E28

	thumb_func_start sub_80B81B4
sub_80B81B4: @ 0x080B81B4
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	mov sl, r0
	movs r0, #0xf0
	mov sb, r0
	movs r5, #0
_080B81C8:
	lsls r0, r5, #1
	adds r0, r0, r5
	lsls r0, r0, #3
	mov r1, sl
	adds r1, #0x46
	movs r2, #0
	ldrsh r1, [r1, r2]
	subs r0, r0, r1
	adds r4, r0, #0
	adds r4, #0xa0
	cmp r4, #0
	bge _080B81FA
	rsbs r0, r4, #0
	mov r1, sb
	bl __modsi3
	adds r2, r0, #0
	cmp r2, #0x17
	bgt _080B81F6
	movs r0, #0x80
	lsls r0, r0, #1
	subs r4, r0, r2
	b _080B81FA
_080B81F6:
	mov r3, sb
	subs r4, r3, r2
_080B81FA:
	movs r0, #0xff
	ands r4, r0
	cmp r4, #0x9f
	ble _080B820A
	adds r0, r5, #1
	mov r8, r0
	cmp r4, #0xe8
	ble _080B8242
_080B820A:
	lsls r0, r5, #0xb
	adds r5, #1
	mov r8, r5
	movs r1, #0x80
	lsls r1, r1, #5
	adds r0, r0, r1
	ldr r1, _080B8258 @ =0x0001FFFF
	ands r0, r1
	lsrs r0, r0, #5
	movs r2, #0xa4
	lsls r2, r2, #8
	adds r5, r0, r2
	movs r7, #8
	movs r6, #6
_080B8226:
	str r5, [sp]
	movs r0, #4
	adds r1, r7, #0
	movs r3, #0x80
	lsls r3, r3, #3
	adds r2, r4, r3
	ldr r3, _080B825C @ =Sprite_32x16
	bl PutSpriteExt
	adds r5, #4
	adds r7, #0x20
	subs r6, #1
	cmp r6, #0
	bge _080B8226
_080B8242:
	mov r5, r8
	cmp r5, #9
	ble _080B81C8
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B8258: .4byte 0x0001FFFF
_080B825C: .4byte Sprite_32x16

	thumb_func_start sub_80B8260
sub_80B8260: @ 0x080B8260
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	movs r1, #0
	ldr r0, _080B82D4 @ =0x0001FFFF
	mov sl, r0
_080B8272:
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r4, r0, #0
	adds r4, #0x18
	lsls r0, r1, #0xb
	adds r1, #1
	mov sb, r1
	movs r1, #0xff
	ands r4, r1
	movs r3, #0x80
	lsls r3, r3, #5
	adds r0, r0, r3
	movs r7, #0xa4
	lsls r7, r7, #8
	movs r6, #8
	mov r1, sl
	ands r0, r1
	lsrs r0, r0, #5
	mov r8, r0
	movs r5, #6
_080B829C:
	mov r3, r8
	adds r0, r3, r7
	str r0, [sp]
	movs r0, #4
	adds r1, r6, #0
	movs r3, #0x80
	lsls r3, r3, #3
	adds r2, r4, r3
	ldr r3, _080B82D8 @ =Sprite_32x16
	bl PutSpriteExt
	adds r7, #4
	adds r6, #0x20
	subs r5, #1
	cmp r5, #0
	bge _080B829C
	mov r1, sb
	cmp r1, #7
	ble _080B8272
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B82D4: .4byte 0x0001FFFF
_080B82D8: .4byte Sprite_32x16

	thumb_func_start sub_80B82DC
sub_80B82DC: @ 0x080B82DC
	push {r4, r5, lr}
	adds r4, r0, #0
	bl sub_80B7C10
	ldr r0, _080B836C @ =gUnk_08190268
	movs r1, #0xd0
	lsls r1, r1, #2
	movs r2, #0x20
	bl ApplyPaletteExt
	adds r0, r4, #0
	adds r0, #0x42
	ldrh r1, [r0]
	adds r0, #2
	movs r5, #0
	strh r1, [r0]
	ldr r0, [r4, #0x34]
	ldr r0, [r0]
	bl DecodeMsg
	str r0, [r4, #0x2c]
	bl sub_8013374
	str r0, [r4, #0x2c]
	ldr r0, _080B8370 @ =0x02000830
	str r0, [r4, #0x30]
	movs r0, #1
	bl SetTextFontGlyphs
	ldr r0, [r4, #0x30]
	ldr r1, [r4, #0x2c]
	bl sub_80B7C6C
	ldr r2, _080B8374 @ =gDispIo
	adds r1, r2, #0
	adds r1, #0x3c
	movs r0, #0x3f
	ldrb r3, [r1]
	ands r0, r3
	strb r0, [r1]
	adds r1, #8
	movs r0, #0x10
	strb r0, [r1]
	adds r0, r2, #0
	adds r0, #0x45
	strb r5, [r0]
	adds r0, #1
	strb r5, [r0]
	ldr r0, _080B8378 @ =0x0000FFE0
	ldrh r1, [r2, #0x3c]
	ands r0, r1
	ldr r1, _080B837C @ =0x0000E0FF
	ands r0, r1
	movs r3, #0xf8
	lsls r3, r3, #5
	adds r1, r3, #0
	orrs r0, r1
	strh r0, [r2, #0x3c]
	adds r1, r2, #0
	adds r1, #0x3d
	movs r0, #0x20
	ldrb r2, [r1]
	orrs r0, r2
	strb r0, [r1]
	ldr r0, _080B8380 @ =sub_80B8260
	adds r1, r4, #0
	bl StartParallelWorker
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080B836C: .4byte gUnk_08190268
_080B8370: .4byte 0x02000830
_080B8374: .4byte gDispIo
_080B8378: .4byte 0x0000FFE0
_080B837C: .4byte 0x0000E0FF
_080B8380: .4byte sub_80B8260

	thumb_func_start sub_80B8384
sub_80B8384: @ 0x080B8384
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r4, r5, #0
	adds r4, #0x44
	ldrh r0, [r4]
	subs r0, #1
	strh r0, [r4]
	ldr r0, _080B83C0 @ =0x02000818
	bl SetTextFont
	movs r0, #1
	bl SetTextFontGlyphs
	movs r1, #0
	ldrsh r0, [r4, r1]
	cmp r0, #0
	bne _080B840A
	adds r0, r5, #0
	adds r0, #0x42
	ldrh r0, [r0]
	strh r0, [r4]
	ldr r0, [r5, #0x2c]
	ldrb r1, [r0]
	cmp r1, #1
	beq _080B83CA
	cmp r1, #1
	bgt _080B83C4
	cmp r1, #0
	beq _080B83E2
	b _080B83F8
	.align 2, 0
_080B83C0: .4byte 0x02000818
_080B83C4:
	cmp r1, #4
	beq _080B83EC
	b _080B83F8
_080B83CA:
	ldrh r1, [r4]
	lsls r0, r1, #1
	strh r0, [r4]
	ldr r1, [r5, #0x2c]
	adds r1, #1
	str r1, [r5, #0x2c]
	ldr r0, [r5, #0x30]
	adds r0, #8
	str r0, [r5, #0x30]
	bl sub_80B7C6C
	b _080B840A
_080B83E2:
	strh r1, [r4]
	adds r0, r5, #0
	bl Proc_Break
	b _080B840A
_080B83EC:
	adds r0, #1
	str r0, [r5, #0x2c]
	ldrh r1, [r4]
	lsls r0, r1, #3
	strh r0, [r4]
	b _080B840A
_080B83F8:
	ldr r0, [r5, #0x30]
	movs r1, #1
	bl Text_SetColor
	ldr r0, [r5, #0x30]
	ldr r1, [r5, #0x2c]
	bl Text_DrawCharacter
	str r0, [r5, #0x2c]
_080B840A:
	movs r0, #0
	bl SetTextFont
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_80B8418
sub_80B8418: @ 0x080B8418
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r0, #0x44
	ldrh r2, [r0]
	adds r2, #1
	movs r4, #0
	strh r2, [r0]
	ldr r0, _080B8460 @ =gDispIo
	mov ip, r0
	mov r1, ip
	adds r1, #0x3c
	movs r0, #0x3f
	ldrb r3, [r1]
	ands r0, r3
	strb r0, [r1]
	lsls r2, r2, #0x10
	asrs r3, r2, #0x11
	movs r0, #0x10
	subs r0, r0, r3
	adds r1, #8
	strb r0, [r1]
	mov r0, ip
	adds r0, #0x45
	strb r3, [r0]
	adds r0, #1
	strb r4, [r0]
	asrs r2, r2, #0x10
	cmp r2, #0x20
	bne _080B8458
	adds r0, r5, #0
	bl Proc_Break
_080B8458:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080B8460: .4byte gDispIo

	thumb_func_start sub_80B8464
sub_80B8464: @ 0x080B8464
	push {r4, lr}
	adds r4, r0, #0
	bl EndAllProcChildren
	ldr r0, [r4, #0x34]
	ldm r0!, {r1}
	str r0, [r4, #0x34]
	cmp r1, #0
	beq _080B847E
	adds r0, r4, #0
	movs r1, #0
	bl Proc_Goto
_080B847E:
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_80B8484
sub_80B8484: @ 0x080B8484
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r1, r2, #0
	ldr r0, _080B84A0 @ =gUnk_08DB7E70
	bl Proc_Start
	str r4, [r0, #0x34]
	adds r1, r0, #0
	adds r1, #0x42
	strh r5, [r1]
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_080B84A0: .4byte gUnk_08DB7E70

	thumb_func_start sub_80B84A4
sub_80B84A4: @ 0x080B84A4
	push {lr}
	ldr r0, _080B84B4 @ =gUnk_08DB7E70
	bl Proc_Find
	cmp r0, #0
	bne _080B84B8
	movs r0, #0
	b _080B84BA
	.align 2, 0
_080B84B4: .4byte gUnk_08DB7E70
_080B84B8:
	movs r0, #1
_080B84BA:
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_80B84C0
sub_80B84C0: @ 0x080B84C0
	push {r4, r5, r6, lr}
	sub sp, #8
	adds r5, r0, #0
	movs r0, #0
	bl InitBgs
	movs r4, #0
	str r4, [sp]
	movs r1, #0xc0
	lsls r1, r1, #0x13
	ldr r2, _080B8578 @ =0x01000008
	mov r0, sp
	bl CpuFastSet
	ldr r6, _080B857C @ =gDispIo
	movs r0, #8
	rsbs r0, r0, #0
	ldrb r1, [r6]
	ands r0, r1
	strb r0, [r6]
	adds r1, r6, #0
	adds r1, #0x3c
	movs r0, #0x3f
	ldrb r2, [r1]
	ands r0, r2
	strb r0, [r1]
	adds r1, #8
	movs r0, #0x10
	strb r0, [r1]
	adds r0, r6, #0
	adds r0, #0x45
	strb r4, [r0]
	adds r0, #1
	strb r4, [r0]
	movs r1, #4
	rsbs r1, r1, #0
	adds r0, r1, #0
	ldrb r2, [r6, #0xc]
	ands r0, r2
	strb r0, [r6, #0xc]
	adds r0, r1, #0
	ldrb r2, [r6, #0x10]
	ands r0, r2
	movs r2, #1
	orrs r0, r2
	strb r0, [r6, #0x10]
	ldrb r0, [r6, #0x14]
	ands r1, r0
	movs r0, #2
	orrs r1, r0
	strb r1, [r6, #0x14]
	movs r0, #3
	ldrb r1, [r6, #0x18]
	orrs r0, r1
	strb r0, [r6, #0x18]
	movs r0, #3
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	movs r0, #0x21
	rsbs r0, r0, #0
	ldrb r2, [r6, #1]
	ands r0, r2
	movs r1, #0x41
	rsbs r1, r1, #0
	ands r0, r1
	movs r1, #0x7f
	ands r0, r1
	strb r0, [r6, #1]
	str r4, [sp, #4]
	add r0, sp, #4
	ldr r1, _080B8580 @ =gPal
	ldr r2, _080B8584 @ =0x01000100
	bl CpuFastSet
	bl sub_80B7BCC
	movs r0, #0
	bl SetOnHBlankA
	adds r0, r5, #0
	adds r0, #0x4c
	strh r4, [r0]
	adds r5, #0x4e
	strh r4, [r5]
	bl sub_80B7BBC
	add sp, #8
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080B8578: .4byte 0x01000008
_080B857C: .4byte gDispIo
_080B8580: .4byte gPal
_080B8584: .4byte 0x01000100

	thumb_func_start sub_80B8588
sub_80B8588: @ 0x080B8588
	push {lr}
	adds r2, r0, #0
	ldr r3, _080B85B8 @ =gDispIo
	movs r0, #2
	rsbs r0, r0, #0
	ldrb r1, [r3, #1]
	ands r0, r1
	movs r1, #3
	rsbs r1, r1, #0
	ands r0, r1
	subs r1, #2
	ands r0, r1
	subs r1, #4
	ands r0, r1
	movs r1, #0x10
	orrs r0, r1
	strb r0, [r3, #1]
	ldr r0, _080B85BC @ =gUnk_08DB7CFC
	movs r1, #8
	bl sub_80B8484
	pop {r0}
	bx r0
	.align 2, 0
_080B85B8: .4byte gDispIo
_080B85BC: .4byte gUnk_08DB7CFC

	thumb_func_start sub_80B85C0
sub_80B85C0: @ 0x080B85C0
	push {lr}
	adds r3, r0, #0
	adds r2, r3, #0
	adds r2, #0x50
	movs r0, #0
	ldrsb r0, [r2, r0]
	cmp r0, #0
	beq _080B85EA
	ldr r0, _080B85F0 @ =gpKeySt
	ldr r1, [r0]
	movs r0, #8
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _080B85EA
	movs r0, #0
	strb r0, [r2]
	adds r0, r3, #0
	movs r1, #0x32
	bl Proc_Goto
_080B85EA:
	pop {r0}
	bx r0
	.align 2, 0
_080B85F0: .4byte gpKeySt

	thumb_func_start sub_80B85F4
sub_80B85F4: @ 0x080B85F4
	push {r4, r5, r6, lr}
	sub sp, #0x64
	adds r5, r0, #0
	adds r0, #0x44
	movs r4, #0
	movs r1, #0
	strh r1, [r0]
	adds r0, #2
	strh r1, [r0]
	subs r0, #6
	strh r1, [r0]
	strh r1, [r5, #0x3e]
	ldr r0, _080B86A4 @ =gUnk_08190268
	movs r1, #0xd0
	lsls r1, r1, #2
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r0, _080B86A8 @ =sub_80B79FC
	bl SetOnHBlankA
	ldr r2, _080B86AC @ =gDispIo
	adds r1, r2, #0
	adds r1, #0x3c
	movs r0, #0x3f
	ldrb r3, [r1]
	ands r0, r3
	strb r0, [r1]
	adds r1, #8
	movs r0, #0x10
	strb r0, [r1]
	adds r0, r2, #0
	adds r0, #0x45
	strb r4, [r0]
	adds r0, #1
	strb r4, [r0]
	ldr r0, _080B86B0 @ =0x0000FFE0
	ldrh r1, [r2, #0x3c]
	ands r0, r1
	ldr r1, _080B86B4 @ =0x0000E0FF
	ands r0, r1
	movs r3, #0xf8
	lsls r3, r3, #5
	adds r1, r3, #0
	orrs r0, r1
	strh r0, [r2, #0x3c]
	adds r1, r2, #0
	adds r1, #0x3d
	movs r0, #0x20
	ldrb r2, [r1]
	orrs r0, r2
	strb r0, [r1]
	bl sub_80B7C10
	ldr r0, _080B86B8 @ =sub_80B81B4
	adds r1, r5, #0
	bl StartParallelWorker
	adds r6, r5, #0
	adds r6, #0x51
	strb r4, [r6]
	mov r0, sp
	bl ReadGlobalSaveInfo
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080B868A
	mov r1, sp
	movs r0, #3
	ldrb r1, [r1, #0xe]
	ands r0, r1
	cmp r0, #0
	beq _080B868A
	movs r0, #1
	strb r0, [r6]
_080B868A:
	adds r0, r5, #0
	adds r0, #0x50
	movs r1, #0
	strb r1, [r0]
	ldr r0, _080B86BC @ =sub_80B85C0
	adds r1, r5, #0
	bl StartParallelWorker
	add sp, #0x64
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080B86A4: .4byte gUnk_08190268
_080B86A8: .4byte sub_80B79FC
_080B86AC: .4byte gDispIo
_080B86B0: .4byte 0x0000FFE0
_080B86B4: .4byte 0x0000E0FF
_080B86B8: .4byte sub_80B81B4
_080B86BC: .4byte sub_80B85C0

	thumb_func_start sub_80B86C0
sub_80B86C0: @ 0x080B86C0
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	adds r5, r0, #0
	adds r4, r5, #0
	adds r4, #0x44
	movs r0, #0
	ldrsh r6, [r4, r0]
	ldr r0, _080B86F0 @ =0x02000884
	ldr r1, [r0]
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #3
	cmp r6, r0
	blt _080B86F4
	adds r0, r5, #0
	bl Proc_Break
	mov r8, r4
	adds r5, #0x46
	mov sb, r5
	b _080B87CC
	.align 2, 0
_080B86F0: .4byte 0x02000884
_080B86F4:
	movs r1, #0x3e
	ldrsh r4, [r5, r1]
	cmp r4, #9
	bgt _080B8732
	movs r1, #0xa
	bl __divsi3
	adds r1, r0, #0
	adds r0, r6, #0
	bl __divsi3
	adds r1, r4, #0
	cmp r0, r1
	blt _080B8732
	cmp r4, #0
	bne _080B8724
	movs r0, #0
	adds r1, r5, #0
	bl sub_80B8054
	movs r1, #0
	bl Proc_Goto
	b _080B872C
_080B8724:
	adds r0, r1, #0
	adds r1, r5, #0
	bl sub_80B8054
_080B872C:
	ldrh r0, [r5, #0x3e]
	adds r0, #1
	strh r0, [r5, #0x3e]
_080B8732:
	adds r4, r5, #0
	adds r4, #0x44
	movs r1, #0
	ldrsh r0, [r4, r1]
	movs r1, #0x48
	bl __modsi3
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	mov sl, r0
	mov r8, r4
	movs r2, #0x46
	adds r2, r2, r5
	mov sb, r2
	cmp r0, #0
	bne _080B87CC
	movs r1, #0
	ldrsh r0, [r2, r1]
	movs r1, #0x18
	bl __divsi3
	lsls r0, r0, #0x10
	asrs r1, r0, #0x10
	adds r6, r5, #0
	adds r6, #0x4c
	movs r2, #0
	ldrsh r7, [r6, r2]
	ldr r0, _080B87B8 @ =0x02000888
	ldr r0, [r0]
	subs r0, #1
	cmp r7, r0
	bge _080B87C0
	adds r0, r1, #0
	movs r1, #0xa
	bl __modsi3
	adds r1, r0, #0
	adds r4, #0xa
	movs r0, #0
	ldrsh r2, [r4, r0]
	adds r3, r5, #0
	adds r3, #0x2c
	adds r0, r7, #0
	bl sub_80B7E60
	ldrh r0, [r4]
	adds r0, #1
	strh r0, [r4]
	movs r2, #0
	ldrsh r1, [r6, r2]
	ldr r0, _080B87BC @ =gUnk_08DB7DCC
	ldr r2, [r0]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldrb r1, [r0, #4]
	movs r2, #0
	ldrsh r0, [r4, r2]
	cmp r1, r0
	bne _080B87CC
	ldrh r0, [r6]
	adds r0, #1
	strh r0, [r6]
	mov r0, sl
	strh r0, [r4]
	b _080B87CC
	.align 2, 0
_080B87B8: .4byte 0x02000888
_080B87BC: .4byte gUnk_08DB7DCC
_080B87C0:
	adds r0, r1, #0
	movs r1, #0xa
	bl __modsi3
	bl sub_80B7C40
_080B87CC:
	mov r1, r8
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
	movs r2, #0
	ldrsh r0, [r1, r2]
	movs r1, #3
	bl __divsi3
	mov r1, sb
	strh r0, [r1]
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_80B87F0
sub_80B87F0: @ 0x080B87F0
	push {lr}
	adds r1, r0, #0
	adds r1, #0x44
	movs r2, #0
	strh r2, [r1]
	adds r0, #0x46
	strh r2, [r0]
	movs r0, #0
	bl SetOnHBlankA
	pop {r0}
	bx r0

	thumb_func_start sub_80B8808
sub_80B8808: @ 0x080B8808
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	adds r5, r6, #0
	adds r5, #0x44
	movs r1, #0
	ldrsh r0, [r5, r1]
	movs r1, #0x48
	bl __modsi3
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _080B884C
	adds r0, r6, #0
	adds r0, #0x46
	movs r2, #0
	ldrsh r0, [r0, r2]
	movs r1, #0x18
	bl __divsi3
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	ldr r1, _080B8874 @ =0x02000888
	ldr r4, [r1]
	subs r4, #1
	movs r1, #0xa
	bl __modsi3
	adds r2, r0, #0
	adds r3, r6, #0
	adds r3, #0x2c
	adds r0, r4, #0
	adds r1, r2, #0
	bl sub_80B7E60
_080B884C:
	ldr r0, _080B8878 @ =gpKeySt
	ldr r1, [r0]
	movs r0, #1
	ldrh r1, [r1, #4]
	ands r0, r1
	cmp r0, #0
	beq _080B887C
	movs r3, #0
	ldrsh r0, [r5, r3]
	movs r1, #3
	bl __modsi3
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _080B887C
	ldrh r0, [r5]
	adds r0, #3
	strh r0, [r5]
	adds r4, r5, #0
	b _080B8888
	.align 2, 0
_080B8874: .4byte 0x02000888
_080B8878: .4byte gpKeySt
_080B887C:
	adds r0, r6, #0
	adds r0, #0x44
	ldrh r1, [r0]
	adds r1, #1
	strh r1, [r0]
	adds r4, r0, #0
_080B8888:
	movs r5, #0
	ldrsh r0, [r4, r5]
	movs r1, #3
	bl __divsi3
	adds r1, r6, #0
	adds r1, #0x46
	movs r3, #0
	strh r0, [r1]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0xd8
	bne _080B88EA
	ldr r2, _080B88F0 @ =gDispIo
	adds r1, r2, #0
	adds r1, #0x3c
	movs r0, #0x3f
	ldrb r5, [r1]
	ands r0, r5
	strb r0, [r1]
	adds r1, #8
	movs r0, #0x10
	strb r0, [r1]
	adds r0, r2, #0
	adds r0, #0x45
	strb r3, [r0]
	adds r0, #1
	strb r3, [r0]
	ldr r0, _080B88F4 @ =0x0000FFE0
	ldrh r1, [r2, #0x3c]
	ands r0, r1
	ldr r1, _080B88F8 @ =0x0000E0FF
	ands r0, r1
	movs r3, #0xf8
	lsls r3, r3, #5
	adds r1, r3, #0
	orrs r0, r1
	strh r0, [r2, #0x3c]
	adds r1, r2, #0
	adds r1, #0x3d
	movs r0, #0x20
	ldrb r5, [r1]
	orrs r0, r5
	strb r0, [r1]
	adds r0, r6, #0
	bl Proc_Break
	movs r0, #0
	strh r0, [r4]
_080B88EA:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080B88F0: .4byte gDispIo
_080B88F4: .4byte 0x0000FFE0
_080B88F8: .4byte 0x0000E0FF

	thumb_func_start sub_80B88FC
sub_80B88FC: @ 0x080B88FC
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r0, #0x44
	ldrh r2, [r0]
	adds r2, #1
	movs r3, #0
	strh r2, [r0]
	ldr r0, _080B8950 @ =gDispIo
	mov ip, r0
	mov r1, ip
	adds r1, #0x3c
	movs r0, #0x3f
	ldrb r5, [r1]
	ands r0, r5
	strb r0, [r1]
	lsls r2, r2, #0x10
	asrs r2, r2, #0x12
	movs r0, #0x10
	subs r0, r0, r2
	adds r1, #8
	strb r0, [r1]
	mov r0, ip
	adds r0, #0x45
	strb r2, [r0]
	adds r0, #1
	strb r3, [r0]
	cmp r2, #0x10
	bne _080B8948
	adds r0, r4, #0
	bl EndAllProcChildren
	ldr r0, _080B8954 @ =sub_80B85C0
	adds r1, r4, #0
	bl StartParallelWorker
	adds r0, r4, #0
	bl Proc_Break
_080B8948:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080B8950: .4byte gDispIo
_080B8954: .4byte sub_80B85C0

	thumb_func_start sub_80B8958
sub_80B8958: @ 0x080B8958
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r0, _080B89A4 @ =gUnk_08DB7C54
	movs r1, #2
	adds r2, r4, #0
	bl sub_80B8198
	movs r1, #0
	bl Proc_Goto
	bl sub_80B7C10
	adds r4, #0x44
	movs r2, #0
	movs r3, #0
	ldr r0, _080B89A8 @ =gDispIo
	mov ip, r0
	mov r1, ip
	adds r1, #0x3c
	movs r0, #0x3f
	ldrb r5, [r1]
	ands r0, r5
	strb r0, [r1]
	adds r1, #8
	movs r0, #0x10
	strb r0, [r1]
	mov r0, ip
	adds r0, #0x45
	strb r2, [r0]
	adds r0, #1
	strb r2, [r0]
	strh r3, [r4]
	movs r0, #0
	bl SetOnHBlankA
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080B89A4: .4byte gUnk_08DB7C54
_080B89A8: .4byte gDispIo

	thumb_func_start sub_80B89AC
sub_80B89AC: @ 0x080B89AC
	push {lr}
	adds r2, r0, #0
	ldr r0, _080B89BC @ =gUnk_08DB7D0C
	movs r1, #0xc
	bl sub_80B8484
	pop {r0}
	bx r0
	.align 2, 0
_080B89BC: .4byte gUnk_08DB7D0C

	thumb_func_start sub_80B89C0
sub_80B89C0: @ 0x080B89C0
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r4, r5, #0
	adds r4, #0x44
	ldrh r3, [r4]
	adds r3, #1
	strh r3, [r4]
	movs r0, #1
	ands r0, r3
	cmp r0, #0
	bne _080B89EA
	ldr r0, _080B8A08 @ =gUnk_08DB7C54
	ldr r0, [r0]
	movs r2, #0x80
	lsls r2, r2, #1
	lsls r3, r3, #0x10
	asrs r3, r3, #0x11
	adds r3, #0x20
	movs r1, #0
	bl sub_80010CC
_080B89EA:
	ldrh r4, [r4]
	lsls r0, r4, #0x10
	asrs r0, r0, #0x11
	cmp r0, #0x20
	bne _080B8A02
	adds r1, r5, #0
	adds r1, #0x50
	movs r0, #0
	strb r0, [r1]
	adds r0, r5, #0
	bl Proc_Break
_080B8A02:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080B8A08: .4byte gUnk_08DB7C54

	thumb_func_start sub_80B8A0C
sub_80B8A0C: @ 0x080B8A0C
	push {lr}
	bl EndAllProcChildren
	movs r0, #0
	bl SetOnHBlankA
	bl WipeAllPalette
	pop {r0}
	bx r0

	thumb_func_start sub_80B8A20
sub_80B8A20: @ 0x080B8A20
	adds r1, r0, #0
	adds r0, #0x51
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _080B8A34
	adds r1, #0x50
	movs r0, #1
	strb r0, [r1]
_080B8A34:
	bx lr
	.align 2, 0

	thumb_func_start sub_80B8A38
sub_80B8A38: @ 0x080B8A38
	adds r0, #0x50
	movs r1, #0
	strb r1, [r0]
	bx lr

	thumb_func_start sub_80B8A40
sub_80B8A40: @ 0x080B8A40
	push {r4, r5, lr}
	adds r5, r0, #0
	movs r0, #0
	bl InitBgs
	ldr r2, _080B8A98 @ =gDispIo
	adds r1, r2, #0
	adds r1, #0x3c
	movs r0, #0x3f
	ldrb r3, [r1]
	ands r0, r3
	strb r0, [r1]
	adds r1, #8
	movs r4, #0
	movs r0, #0x10
	strb r0, [r1]
	adds r0, r2, #0
	adds r0, #0x45
	strb r4, [r0]
	adds r0, #1
	strb r4, [r0]
	ldr r0, _080B8A9C @ =gUnk_081C8610
	ldr r1, _080B8AA0 @ =0x06000800
	bl Decompress
	ldr r0, _080B8AA4 @ =gUnk_081C8AF8
	movs r1, #0xa0
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r0, _080B8AA8 @ =gBg0Tm
	ldr r1, _080B8AAC @ =gUnk_081C8B18
	ldr r2, _080B8AB0 @ =0x00005040
	bl TmApplyTsa_thm
	movs r0, #1
	bl EnableBgSync
	adds r5, #0x44
	strh r4, [r5]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080B8A98: .4byte gDispIo
_080B8A9C: .4byte gUnk_081C8610
_080B8AA0: .4byte 0x06000800
_080B8AA4: .4byte gUnk_081C8AF8
_080B8AA8: .4byte gBg0Tm
_080B8AAC: .4byte gUnk_081C8B18
_080B8AB0: .4byte 0x00005040

	thumb_func_start sub_80B8AB4
sub_80B8AB4: @ 0x080B8AB4
	push {lr}
	adds r2, r0, #0
	adds r1, r2, #0
	adds r1, #0x44
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x3c
	bne _080B8AD2
	adds r0, r2, #0
	bl Proc_Break
	b _080B8AE6
_080B8AD2:
	ldr r0, _080B8AEC @ =gpKeySt
	ldr r1, [r0]
	movs r0, #8
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _080B8AE6
	adds r0, r2, #0
	bl Proc_Break
_080B8AE6:
	pop {r0}
	bx r0
	.align 2, 0
_080B8AEC: .4byte gpKeySt

	thumb_func_start sub_80B8AF0
sub_80B8AF0: @ 0x080B8AF0
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	movs r0, #0xc
	bl SetNextGameAction
	movs r0, #0
	bl InitBgs
	ldr r6, _080B8B60 @ =gDispIo
	adds r1, r6, #0
	adds r1, #0x3c
	movs r0, #0x3f
	ldrb r2, [r1]
	ands r0, r2
	strb r0, [r1]
	adds r1, #8
	movs r2, #0
	movs r4, #0x10
	movs r0, #0x10
	strb r0, [r1]
	adds r0, r6, #0
	adds r0, #0x45
	strb r2, [r0]
	adds r0, #1
	strb r2, [r0]
	bl ApplySystemObjectsGraphics
	movs r0, #1
	ldrb r1, [r6, #1]
	orrs r0, r1
	movs r1, #2
	orrs r0, r1
	movs r1, #4
	orrs r0, r1
	movs r1, #8
	orrs r0, r1
	orrs r0, r4
	strb r0, [r6, #1]
	movs r1, #1
	rsbs r1, r1, #0
	movs r0, #0
	bl sub_8083C54
	movs r2, #0xa1
	lsls r2, r2, #4
	movs r0, #0x34
	movs r1, #0x20
	adds r3, r5, #0
	bl sub_8084000
	movs r0, #0x90
	bl sub_8083B9C
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080B8B60: .4byte gDispIo

	thumb_func_start sub_80B8B64
sub_80B8B64: @ 0x080B8B64
	push {r4, lr}
	adds r4, r0, #0
	bl sub_8009E60
	cmp r0, #2
	bne _080B8B7A
	adds r0, r4, #0
	movs r1, #1
	bl Proc_Goto
	b _080B8B82
_080B8B7A:
	adds r0, r4, #0
	movs r1, #0
	bl Proc_Goto
_080B8B82:
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_80B8B88
sub_80B8B88: @ 0x080B8B88
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	movs r0, #0
	bl InitBgs
	ldr r6, _080B8BF0 @ =gDispIo
	adds r1, r6, #0
	adds r1, #0x3c
	movs r0, #0x3f
	ldrb r2, [r1]
	ands r0, r2
	strb r0, [r1]
	adds r1, #8
	movs r2, #0
	movs r4, #0x10
	movs r0, #0x10
	strb r0, [r1]
	adds r0, r6, #0
	adds r0, #0x45
	strb r2, [r0]
	adds r0, #1
	strb r2, [r0]
	bl ApplySystemObjectsGraphics
	movs r0, #1
	ldrb r1, [r6, #1]
	orrs r0, r1
	movs r1, #2
	orrs r0, r1
	movs r1, #4
	orrs r0, r1
	movs r1, #8
	orrs r0, r1
	orrs r0, r4
	strb r0, [r6, #1]
	movs r1, #1
	rsbs r1, r1, #0
	movs r0, #0
	bl sub_8083C54
	ldr r2, _080B8BF4 @ =0x00000A11
	movs r0, #0x40
	movs r1, #0x20
	adds r3, r5, #0
	bl sub_8084000
	movs r0, #0x90
	bl sub_8083B9C
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080B8BF0: .4byte gDispIo
_080B8BF4: .4byte 0x00000A11

	thumb_func_start sub_80B8BF8
sub_80B8BF8: @ 0x080B8BF8
	push {lr}
	bl sub_8009E60
	cmp r0, #2
	bne _080B8C0A
	movs r0, #5
	bl SetNextGameAction
	b _080B8C10
_080B8C0A:
	movs r0, #0xc
	bl SetNextGameAction
_080B8C10:
	pop {r0}
	bx r0

	thumb_func_start sub_80B8C14
sub_80B8C14: @ 0x080B8C14
	adds r2, r0, #0
	ldr r1, _080B8C1C @ =gUnk_08DB85F4
	b _080B8C2C
	.align 2, 0
_080B8C1C: .4byte gUnk_08DB85F4
_080B8C20:
	ldrb r0, [r1]
	cmp r0, r2
	bne _080B8C2A
	ldr r0, [r1, #4]
	b _080B8C34
_080B8C2A:
	adds r1, #8
_080B8C2C:
	ldrb r0, [r1]
	cmp r0, #0
	bne _080B8C20
	movs r0, #0
_080B8C34:
	bx lr
	.align 2, 0

	thumb_func_start sub_80B8C38
sub_80B8C38: @ 0x080B8C38
	adds r2, r0, #0
	ldr r1, _080B8C40 @ =gUnk_08DB875C
	b _080B8C50
	.align 2, 0
_080B8C40: .4byte gUnk_08DB875C
_080B8C44:
	ldrb r0, [r1]
	cmp r0, r2
	bne _080B8C4E
	ldrb r0, [r1, #1]
	b _080B8C58
_080B8C4E:
	adds r1, #4
_080B8C50:
	ldrb r0, [r1]
	cmp r0, #0
	bne _080B8C44
	movs r0, #0
_080B8C58:
	bx lr
	.align 2, 0

	thumb_func_start sub_80B8C5C
sub_80B8C5C: @ 0x080B8C5C
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	ldr r0, _080B8CDC @ =gUnk_08DB8118
	ldr r4, [r0]
	adds r0, r5, #0
	bl sub_80B8C38
	adds r7, r0, #0
	cmp r7, #4
	bne _080B8C80
	movs r0, #0x7d
	bl CheckChapterFlag
	lsls r0, r0, #0x18
	movs r5, #0xf
	cmp r0, #0
	beq _080B8C80
	movs r5, #0x15
_080B8C80:
	lsls r0, r5, #0x18
	lsrs r0, r0, #0x18
	bl GetPidStats
	ldrb r0, [r0, #5]
	lsls r0, r0, #0x1a
	lsrs r6, r0, #0x1a
	adds r0, r6, #0
	adds r1, r4, #0
	movs r2, #1
	bl sub_80AB970
	adds r4, r0, #0
	adds r0, r6, #0
	bl GetROMChapterStruct
	adds r2, r0, #0
	ldr r0, _080B8CE0 @ =gPlaySt
	movs r1, #0
	ldrb r0, [r0, #0x1b]
	cmp r0, #3
	bne _080B8CAE
	movs r1, #2
_080B8CAE:
	adds r0, r2, #0
	adds r0, #0x70
	adds r0, r0, r1
	ldrh r0, [r0]
	bl DecodeMsg
	adds r1, r4, #0
	bl AppendString
	adds r4, r0, #0
	movs r0, #1
	adds r1, r4, #0
	bl AppendCharacter
	adds r4, r0, #0
	cmp r7, #5
	bhi _080B8D54
	lsls r0, r7, #2
	ldr r1, _080B8CE4 @ =_080B8CE8
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080B8CDC: .4byte gUnk_08DB8118
_080B8CE0: .4byte gPlaySt
_080B8CE4: .4byte _080B8CE8
_080B8CE8: @ jump table
	.4byte _080B8D00 @ case 0
	.4byte _080B8D08 @ case 1
	.4byte _080B8D10 @ case 2
	.4byte _080B8D18 @ case 3
	.4byte _080B8D30 @ case 4
	.4byte _080B8D50 @ case 5
_080B8D00:
	ldr r0, _080B8D04 @ =0x0000100F
	b _080B8D3E
	.align 2, 0
_080B8D04: .4byte 0x0000100F
_080B8D08:
	ldr r0, _080B8D0C @ =0x00001010
	b _080B8D3E
	.align 2, 0
_080B8D0C: .4byte 0x00001010
_080B8D10:
	ldr r0, _080B8D14 @ =0x00001011
	b _080B8D3E
	.align 2, 0
_080B8D14: .4byte 0x00001011
_080B8D18:
	adds r0, r6, #0
	subs r0, #0x1d
	cmp r0, #1
	bhi _080B8D28
	ldr r0, _080B8D24 @ =0x00001011
	b _080B8D3E
	.align 2, 0
_080B8D24: .4byte 0x00001011
_080B8D28:
	ldr r0, _080B8D2C @ =0x0000100F
	b _080B8D3E
	.align 2, 0
_080B8D2C: .4byte 0x0000100F
_080B8D30:
	cmp r5, #0x15
	bne _080B8D3C
	ldr r0, _080B8D38 @ =0x00001086
	b _080B8D3E
	.align 2, 0
_080B8D38: .4byte 0x00001086
_080B8D3C:
	ldr r0, _080B8D4C @ =0x00001087
_080B8D3E:
	bl DecodeMsg
	adds r1, r4, #0
	bl AppendString
	b _080B8D54
	.align 2, 0
_080B8D4C: .4byte 0x00001087
_080B8D50:
	movs r0, #0
	b _080B8D58
_080B8D54:
	ldr r0, _080B8D60 @ =gUnk_08DB8118
	ldr r0, [r0]
_080B8D58:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_080B8D60: .4byte gUnk_08DB8118

	thumb_func_start sub_80B8D64
sub_80B8D64: @ 0x080B8D64
	push {lr}
	ldr r0, _080B8D7C @ =gUnk_08615F80
	ldr r1, _080B8D80 @ =0x06005000
	bl Decompress
	ldr r0, _080B8D84 @ =gUnk_08421C64
	ldr r1, _080B8D88 @ =0x06008000
	bl Decompress
	pop {r0}
	bx r0
	.align 2, 0
_080B8D7C: .4byte gUnk_08615F80
_080B8D80: .4byte 0x06005000
_080B8D84: .4byte gUnk_08421C64
_080B8D88: .4byte 0x06008000

	thumb_func_start sub_80B8D8C
sub_80B8D8C: @ 0x080B8D8C
	push {r4, r5, lr}
	ldr r0, _080B8DDC @ =gUnk_08615F40
	movs r1, #0xc0
	lsls r1, r1, #1
	movs r2, #0x40
	bl ApplyPaletteExt
	ldr r0, _080B8DE0 @ =gUnk_08615F00
	movs r1, #0xe0
	lsls r1, r1, #1
	movs r2, #0x40
	bl ApplyPaletteExt
	ldr r0, _080B8DE4 @ =gBg3Tm
	ldr r1, _080B8DE8 @ =gUnk_08615A4C
	movs r2, #0xe0
	lsls r2, r2, #8
	bl TmApplyTsa_thm
	ldr r4, _080B8DEC @ =gBg2Tm
	ldr r1, _080B8DF0 @ =gUnk_086167D0
	ldr r5, _080B8DF4 @ =0x0000C280
	adds r0, r4, #0
	adds r2, r5, #0
	bl TmApplyTsa_thm
	movs r0, #0x90
	lsls r0, r0, #3
	adds r4, r4, r0
	ldr r1, _080B8DF8 @ =gUnk_0861684C
	adds r0, r4, #0
	adds r2, r5, #0
	bl TmApplyTsa_thm
	movs r0, #0xc
	bl EnableBgSync
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080B8DDC: .4byte gUnk_08615F40
_080B8DE0: .4byte gUnk_08615F00
_080B8DE4: .4byte gBg3Tm
_080B8DE8: .4byte gUnk_08615A4C
_080B8DEC: .4byte gBg2Tm
_080B8DF0: .4byte gUnk_086167D0
_080B8DF4: .4byte 0x0000C280
_080B8DF8: .4byte gUnk_0861684C

	thumb_func_start sub_80B8DFC
sub_80B8DFC: @ 0x080B8DFC
	push {r4, r5, r6, lr}
	mov r6, sb
	mov r5, r8
	push {r5, r6}
	sub sp, #0x10
	adds r6, r0, #0
	mov sb, r1
	ldr r0, _080B8E78 @ =gBg1Tm
	movs r1, #0
	bl TmFill
	ldr r5, _080B8E7C @ =gUnk_08DB8814
	ldr r0, [r5, #8]
	str r6, [sp]
	movs r1, #2
	add r1, sb
	mov r8, r1
	str r1, [sp, #4]
	movs r4, #0x1e
	str r4, [sp, #8]
	movs r1, #0x10
	str r1, [sp, #0xc]
	movs r1, #0
	movs r2, #1
	movs r3, #2
	bl sub_80A974C
	ldr r0, [r5, #4]
	str r6, [sp]
	mov r1, r8
	str r1, [sp, #4]
	str r4, [sp, #8]
	movs r1, #0x12
	str r1, [sp, #0xc]
	movs r1, #0
	movs r2, #1
	movs r3, #1
	bl sub_80A974C
	ldr r0, [r5]
	str r6, [sp]
	mov r1, sb
	str r1, [sp, #4]
	str r4, [sp, #8]
	movs r1, #0x14
	str r1, [sp, #0xc]
	movs r1, #0
	movs r2, #0
	movs r3, #0
	bl sub_80A974C
	movs r0, #7
	bl EnableBgSync
	add sp, #0x10
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080B8E78: .4byte gBg1Tm
_080B8E7C: .4byte gUnk_08DB8814

	thumb_func_start sub_80B8E80
sub_80B8E80: @ 0x080B8E80
	push {r4, r5, r6, r7, lr}
	bl ResetText
	ldr r7, _080B8EC8 @ =gUnk_08DB8824
	movs r6, #0x38
	movs r5, #0x28
	movs r4, #1
_080B8E8E:
	ldr r0, [r7]
	adds r0, r0, r5
	movs r1, #0xf
	bl InitText
	ldr r0, [r7]
	adds r0, r0, r6
	movs r1, #0xa
	bl InitText
	adds r6, #8
	adds r5, #8
	subs r4, #1
	cmp r4, #0
	bge _080B8E8E
	movs r4, #0
	ldr r5, _080B8EC8 @ =gUnk_08DB8824
_080B8EB0:
	lsls r1, r4, #3
	ldr r0, [r5]
	adds r0, r0, r1
	movs r1, #0x19
	bl InitText
	adds r4, #1
	cmp r4, #4
	ble _080B8EB0
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B8EC8: .4byte gUnk_08DB8824

	thumb_func_start sub_80B8ECC
sub_80B8ECC: @ 0x080B8ECC
	push {r4, lr}
	sub sp, #4
	adds r4, r0, #0
	movs r0, #0
	bl InitBgs
	bl InitFaces
	bl sub_80B8D64
	ldr r3, _080B8F20 @ =gDispIo
	adds r1, r3, #0
	adds r1, #0x3c
	movs r0, #0x3f
	ldrb r2, [r1]
	ands r0, r2
	strb r0, [r1]
	adds r2, r3, #0
	adds r2, #0x44
	movs r1, #0
	movs r0, #0x10
	strb r0, [r2]
	adds r0, r3, #0
	adds r0, #0x45
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	strh r1, [r4, #0x2e]
	mov r0, sp
	strh r1, [r0]
	adds r1, r4, #0
	adds r1, #0x40
	ldr r2, _080B8F24 @ =0x01000010
	bl CpuSet
	ldr r0, _080B8F28 @ =gPlaySt
	ldrb r0, [r0, #0x1b]
	cmp r0, #3
	bne _080B8F30
	ldr r0, _080B8F2C @ =gUnk_08DB85EC
	ldr r0, [r0, #4]
	b _080B8F34
	.align 2, 0
_080B8F20: .4byte gDispIo
_080B8F24: .4byte 0x01000010
_080B8F28: .4byte gPlaySt
_080B8F2C: .4byte gUnk_08DB85EC
_080B8F30:
	ldr r0, _080B8F44 @ =gUnk_08DB85EC
	ldr r0, [r0]
_080B8F34:
	str r0, [r4, #0x30]
	ldr r0, [r4, #0x30]
	str r0, [r4, #0x34]
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080B8F44: .4byte gUnk_08DB85EC

	thumb_func_start sub_80B8F48
sub_80B8F48: @ 0x080B8F48
	push {lr}
	ldr r0, _080B8F78 @ =gBg0Tm
	movs r1, #0
	bl TmFill
	ldr r0, _080B8F7C @ =gBg1Tm
	movs r1, #0
	bl TmFill
	ldr r0, _080B8F80 @ =gBg2Tm
	movs r1, #0
	bl TmFill
	bl sub_800EC08
	bl sub_80B99F8
	bl sub_80B8D8C
	movs r0, #7
	bl EnableBgSync
	pop {r0}
	bx r0
	.align 2, 0
_080B8F78: .4byte gBg0Tm
_080B8F7C: .4byte gBg1Tm
_080B8F80: .4byte gBg2Tm

	thumb_func_start sub_80B8F84
sub_80B8F84: @ 0x080B8F84
	push {r4, r5, lr}
	adds r5, r0, #0
	movs r4, #1
_080B8F8A:
	adds r0, r4, #0
	bl GetUnit
	adds r2, r0, #0
	cmp r2, #0
	beq _080B8FB2
	ldr r0, [r2]
	cmp r0, #0
	beq _080B8FB2
	ldrb r0, [r0, #4]
	cmp r0, r5
	bne _080B8FB2
	ldr r0, [r2, #0xc]
	movs r1, #0x80
	lsls r1, r1, #9
	ands r0, r1
	cmp r0, #0
	bne _080B8FB8
	adds r0, r2, #0
	b _080B8FBA
_080B8FB2:
	adds r4, #1
	cmp r4, #0x3f
	ble _080B8F8A
_080B8FB8:
	movs r0, #0
_080B8FBA:
	pop {r4, r5}
	pop {r1}
	bx r1

	thumb_func_start sub_80B8FC0
sub_80B8FC0: @ 0x080B8FC0
	push {r4, r5, lr}
	adds r5, r0, #0
	cmp r5, #0
	bne _080B8FD8
	b _080B8FEC
_080B8FCA:
	adds r0, r5, #0
	adds r1, r4, #0
	bl GetUnitSupportPid
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	b _080B8FEE
_080B8FD8:
	movs r4, #0
_080B8FDA:
	adds r0, r5, #0
	adds r1, r4, #0
	bl GetUnitSupportLevel
	cmp r0, #3
	beq _080B8FCA
	adds r4, #1
	cmp r4, #6
	ble _080B8FDA
_080B8FEC:
	movs r0, #0
_080B8FEE:
	pop {r4, r5}
	pop {r1}
	bx r1

	thumb_func_start sub_80B8FF4
sub_80B8FF4: @ 0x080B8FF4
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r0, r1, #0
	ldr r1, [r0]
	ldrb r5, [r1, #4]
	bl sub_80B8FC0
	adds r2, r0, #0
	cmp r2, #0
	bne _080B9028
	b _080B902E
_080B900A:
	movs r0, #1
	b _080B9030
_080B900E:
	ldrb r0, [r4, #1]
	adds r1, r0, #0
	cmp r1, r5
	bne _080B901C
	ldrb r0, [r4, #2]
	cmp r0, r2
	beq _080B900A
_080B901C:
	cmp r1, r2
	bne _080B9026
	ldrb r0, [r4, #2]
	cmp r0, r5
	beq _080B900A
_080B9026:
	adds r4, #8
_080B9028:
	ldrb r0, [r4, #1]
	cmp r0, #0
	bne _080B900E
_080B902E:
	movs r0, #0
_080B9030:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_80B9038
sub_80B9038: @ 0x080B9038
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	movs r0, #0
	str r0, [r4, #0x3c]
	str r0, [r4, #0x38]
_080B9042:
	ldr r5, [r4, #0x30]
	ldrb r0, [r5]
	cmp r0, #0
	bne _080B9054
	adds r0, r4, #0
	movs r1, #0x64
	bl Proc_Goto
	b _080B9166
_080B9054:
	ldrb r0, [r5, #1]
	lsls r1, r0, #0x18
	lsrs r2, r1, #0x18
	mov ip, r2
	lsrs r1, r1, #0x1d
	lsls r1, r1, #2
	adds r1, r1, r4
	movs r7, #0x1f
	adds r2, r7, #0
	ands r2, r0
	ldr r3, [r1, #0x40]
	lsrs r3, r2
	movs r6, #1
	ands r3, r6
	cmp r3, #0
	bne _080B915E
	ldrb r2, [r5, #2]
	lsls r0, r2, #0x18
	cmp r0, #0
	beq _080B9090
	lsrs r0, r0, #0x1d
	lsls r0, r0, #2
	adds r0, r0, r4
	adds r1, r7, #0
	ands r1, r2
	ldr r0, [r0, #0x40]
	lsrs r0, r1
	ands r0, r6
	cmp r0, #0
	bne _080B915E
_080B9090:
	mov r0, ip
	cmp r0, #0xcd
	bne _080B90AC
	ldr r1, _080B90A8 @ =gPlaySt
	adds r1, #0x2b
	adds r0, r6, #0
	ldrb r1, [r1]
	ands r0, r1
	cmp r0, #0
	beq _080B915E
	str r3, [r4, #0x38]
	b _080B9124
	.align 2, 0
_080B90A8: .4byte gPlaySt
_080B90AC:
	ldrb r0, [r5, #1]
	bl sub_80B8F84
	adds r1, r0, #0
	str r1, [r4, #0x38]
	cmp r1, #0
	beq _080B915E
	ldr r2, [r4, #0x30]
	ldrb r0, [r2]
	cmp r0, #2
	beq _080B90E4
	cmp r0, #2
	bgt _080B90CC
	cmp r0, #1
	beq _080B90D6
	b _080B9124
_080B90CC:
	cmp r0, #3
	beq _080B9100
	cmp r0, #4
	beq _080B9118
	b _080B9124
_080B90D6:
	ldr r0, [r4, #0x34]
	bl sub_80B8FF4
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080B915E
	b _080B9124
_080B90E4:
	ldrb r0, [r2, #2]
	bl sub_80B8F84
	str r0, [r4, #0x3c]
	cmp r0, #0
	beq _080B915E
	ldr r0, [r4, #0x38]
	bl sub_80B8FC0
	ldr r1, [r4, #0x30]
	ldrb r1, [r1, #2]
	cmp r0, r1
	bne _080B915E
	b _080B9124
_080B9100:
	movs r0, #1
	bl GetUnitFromCharId
	bl sub_80B8FC0
	cmp r0, #0x25
	beq _080B915E
	ldr r0, [r4, #0x30]
	ldrb r0, [r0, #2]
	bl sub_80B8F84
	b _080B911E
_080B9118:
	movs r0, #0xf
	bl GetUnitFromCharId
_080B911E:
	str r0, [r4, #0x3c]
	cmp r0, #0
	beq _080B915E
_080B9124:
	ldr r3, [r4, #0x30]
	ldrb r1, [r3, #1]
	lsrs r2, r1, #5
	lsls r2, r2, #2
	adds r2, r2, r4
	movs r6, #0x1f
	adds r0, r6, #0
	ands r0, r1
	movs r5, #1
	adds r1, r5, #0
	lsls r1, r0
	ldr r0, [r2, #0x40]
	orrs r0, r1
	str r0, [r2, #0x40]
	ldrb r1, [r3, #2]
	lsls r2, r1, #0x18
	cmp r2, #0
	beq _080B9166
	lsrs r2, r2, #0x1d
	lsls r2, r2, #2
	adds r2, r2, r4
	adds r0, r6, #0
	ands r0, r1
	adds r1, r5, #0
	lsls r1, r0
	ldr r0, [r2, #0x40]
	orrs r0, r1
	str r0, [r2, #0x40]
	b _080B9166
_080B915E:
	ldr r0, [r4, #0x30]
	adds r0, #8
	str r0, [r4, #0x30]
	b _080B9042
_080B9166:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_80B916C
sub_80B916C: @ 0x080B916C
	push {lr}
	adds r3, r0, #0
	ldr r0, [r3, #0x30]
	ldrb r0, [r0]
	subs r0, #1
	cmp r0, #4
	bhi _080B91BE
	lsls r0, r0, #2
	ldr r1, _080B9184 @ =_080B9188
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080B9184: .4byte _080B9188
_080B9188: @ jump table
	.4byte _080B919C @ case 0
	.4byte _080B91A8 @ case 1
	.4byte _080B91A8 @ case 2
	.4byte _080B91B4 @ case 3
	.4byte _080B919C @ case 4
_080B919C:
	ldr r0, [r3, #0x30]
	ldr r1, [r3, #0x38]
	adds r2, r3, #0
	bl sub_80B94EC
	b _080B91BE
_080B91A8:
	ldr r0, [r3, #0x30]
	ldr r1, [r3, #0x38]
	ldr r2, [r3, #0x3c]
	bl sub_80B97EC
	b _080B91BE
_080B91B4:
	ldr r0, [r3, #0x30]
	ldr r1, [r3, #0x38]
	ldr r2, [r3, #0x3c]
	bl sub_80B97EC
_080B91BE:
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_80B91C4
sub_80B91C4: @ 0x080B91C4
	push {lr}
	adds r3, r0, #0
	ldr r0, [r3, #0x30]
	ldr r1, [r3, #0x38]
	ldr r2, [r3, #0x3c]
	bl sub_80B99D8
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_80B91D8
sub_80B91D8: @ 0x080B91D8
	push {lr}
	movs r0, #0
	bl InitBgs
	bl sub_800EC08
	bl sub_80B99F8
	ldr r3, _080B9238 @ =gDispIo
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
	ldr r0, _080B923C @ =0x0000FFE0
	ldrh r1, [r3, #0x3c]
	ands r0, r1
	movs r1, #0x1f
	orrs r0, r1
	ldr r1, _080B9240 @ =0x0000E0FF
	ands r0, r1
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
	pop {r0}
	bx r0
	.align 2, 0
_080B9238: .4byte gDispIo
_080B923C: .4byte 0x0000FFE0
_080B9240: .4byte 0x0000E0FF

	thumb_func_start sub_80B9244
sub_80B9244: @ 0x080B9244
	push {lr}
	movs r0, #0xb
	bl FadeBgmOut
	pop {r0}
	bx r0

	thumb_func_start sub_80B9250
sub_80B9250: @ 0x080B9250
	push {lr}
	adds r2, r0, #0
	ldr r0, [r2, #0x30]
	adds r1, r0, #0
	adds r1, #8
	str r1, [r2, #0x30]
	ldrb r0, [r0, #8]
	cmp r0, #0
	bne _080B926A
	adds r0, r2, #0
	movs r1, #0x64
	bl Proc_Goto
_080B926A:
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_80B9270
sub_80B9270: @ 0x080B9270
	push {lr}
	adds r1, r0, #0
	ldr r0, _080B9280 @ =gUnk_08DB8828
	bl Proc_StartBlocking
	pop {r0}
	bx r0
	.align 2, 0
_080B9280: .4byte gUnk_08DB8828

	thumb_func_start sub_80B9284
sub_80B9284: @ 0x080B9284
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	movs r6, #0
_080B928A:
	lsls r1, r6, #2
	adds r0, r4, #0
	adds r0, #0x2c
	adds r0, r0, r1
	ldr r0, [r0]
	cmp r0, #0
	beq _080B92D8
	ldr r0, [r0]
	ldrb r0, [r0, #4]
	bl GetPidStats
	adds r2, r0, #0
	lsls r3, r6, #1
	adds r1, r4, #0
	adds r1, #0x3c
	adds r1, r1, r3
	ldrh r5, [r2, #0xc]
	lsls r0, r5, #0x12
	lsrs r0, r0, #0x14
	strh r0, [r1]
	adds r0, r4, #0
	adds r0, #0x40
	adds r5, r0, r3
	movs r0, #3
	ldrb r1, [r2, #0xc]
	ands r0, r1
	lsls r0, r0, #8
	ldrb r1, [r2, #0xb]
	orrs r0, r1
	ldr r1, _080B92E4 @ =0x000003E7
	cmp r0, r1
	ble _080B92CC
	adds r0, r1, #0
_080B92CC:
	strh r0, [r5]
	adds r0, r4, #0
	adds r0, #0x44
	adds r0, r0, r3
	ldrb r1, [r2]
	strh r1, [r0]
_080B92D8:
	adds r6, #1
	cmp r6, #1
	ble _080B928A
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080B92E4: .4byte 0x000003E7

	thumb_func_start sub_80B92E8
sub_80B92E8: @ 0x080B92E8
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #8
	mov r8, r0
	bl sub_80B8E80
	mov r0, r8
	bl sub_80B9284
	ldr r7, _080B9348 @ =gUnk_08DB8814
	ldr r0, [r7]
	movs r1, #0
	bl TmFill
	ldr r0, [r7, #4]
	movs r1, #0
	bl TmFill
	ldr r0, [r7, #8]
	movs r1, #0
	bl TmFill
	ldr r0, [r7, #8]
	ldr r1, _080B934C @ =gUnk_08616D7C
	ldr r4, _080B9350 @ =0x0000C280
	adds r2, r4, #0
	bl TmApplyTsa_thm
	ldr r0, [r7, #4]
	ldr r1, _080B9354 @ =gUnk_086168C8
	adds r2, r4, #0
	bl TmApplyTsa_thm
	mov r1, r8
	ldr r0, [r1, #0x38]
	ldrb r4, [r0, #1]
	cmp r4, #0xcd
	bne _080B93A8
	bl sub_80B7480
	cmp r0, #3
	ble _080B935C
	ldr r0, _080B9358 @ =0x00001069
	bl DecodeMsg
	b _080B9372
	.align 2, 0
_080B9348: .4byte gUnk_08DB8814
_080B934C: .4byte gUnk_08616D7C
_080B9350: .4byte 0x0000C280
_080B9354: .4byte gUnk_086168C8
_080B9358: .4byte 0x00001069
_080B935C:
	cmp r0, #1
	ble _080B936C
	ldr r0, _080B9368 @ =0x0000106B
	bl DecodeMsg
	b _080B9372
	.align 2, 0
_080B9368: .4byte 0x0000106B
_080B936C:
	ldr r0, _080B939C @ =0x0000106D
	bl DecodeMsg
_080B9372:
	bl sub_8013374
	adds r6, r0, #0
	movs r0, #0x78
	adds r1, r6, #0
	bl GetStringTextCenteredPos
	adds r3, r0, #0
	ldr r0, _080B93A0 @ =gUnk_08DB8824
	ldr r0, [r0]
	adds r0, #0x28
	ldr r1, _080B93A4 @ =gUnk_08DB8814
	ldr r1, [r1]
	adds r1, #0xc2
	movs r2, #0
	str r2, [sp]
	str r6, [sp, #4]
	bl PutDrawText
	b _080B945A
	.align 2, 0
_080B939C: .4byte 0x0000106D
_080B93A0: .4byte gUnk_08DB8824
_080B93A4: .4byte gUnk_08DB8814
_080B93A8:
	ldrb r0, [r0, #1]
	bl sub_80B8C14
	bl DecodeMsg
	adds r6, r0, #0
	movs r0, #0x78
	adds r1, r6, #0
	bl GetStringTextCenteredPos
	adds r3, r0, #0
	ldr r5, _080B948C @ =gUnk_08DB8824
	ldr r0, [r5]
	adds r0, #0x28
	ldr r1, [r7]
	adds r1, #0xc2
	movs r4, #0
	str r4, [sp]
	str r6, [sp, #4]
	movs r2, #0
	bl PutDrawText
	ldr r0, [r5]
	adds r0, #0x40
	ldr r1, [r7]
	adds r1, #0x68
	str r4, [sp]
	ldr r2, _080B9490 @ =gUnk_08622C5C
	str r2, [sp, #4]
	movs r2, #0
	movs r3, #0
	bl PutDrawText
	ldr r0, [r7]
	adds r0, #0x66
	mov r1, r8
	ldrh r2, [r1, #0x3c]
	movs r1, #2
	bl sub_8006068
	ldr r0, [r7]
	adds r0, #0x6e
	mov r1, r8
	adds r1, #0x40
	ldrh r2, [r1]
	movs r1, #2
	bl sub_8006068
	ldr r0, [r7]
	adds r0, #0x76
	mov r1, r8
	adds r1, #0x44
	ldrh r2, [r1]
	movs r1, #2
	bl sub_8006068
	ldr r2, _080B9494 @ =gCharacterData
	mov r4, r8
	ldr r0, [r4, #0x38]
	ldrb r1, [r0, #1]
	subs r1, #1
	movs r0, #0x34
	muls r0, r1, r0
	adds r0, r0, r2
	ldrh r1, [r0, #6]
	movs r2, #0xd0
	lsls r2, r2, #1
	ldr r0, _080B9498 @ =0x00000502
	str r0, [sp]
	movs r0, #0
	movs r3, #0x38
	bl StartBmFace
	ldr r0, [r4, #0x2c]
	ldr r0, [r0, #0xc]
	movs r1, #4
	ands r0, r1
	cmp r0, #0
	beq _080B945A
	movs r0, #0x16
	bl ArchivePalette
	movs r3, #0x80
	lsls r3, r3, #0xf
	movs r0, #0xc0
	movs r1, #0xc0
	movs r2, #0xc0
	bl WriteFadedPaletteFromArchive
_080B945A:
	movs r2, #0
	mov r0, r8
	str r2, [r0, #0x34]
	ldr r3, _080B949C @ =gDispIo
	adds r1, r3, #0
	adds r1, #0x3c
	movs r0, #0x3f
	ldrb r4, [r1]
	ands r0, r4
	strb r0, [r1]
	adds r1, #8
	movs r0, #0x10
	strb r0, [r1]
	adds r0, r3, #0
	adds r0, #0x45
	strb r2, [r0]
	adds r0, #1
	strb r2, [r0]
	add sp, #8
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B948C: .4byte gUnk_08DB8824
_080B9490: .4byte gUnk_08622C5C
_080B9494: .4byte gCharacterData
_080B9498: .4byte 0x00000502
_080B949C: .4byte gDispIo

	thumb_func_start sub_80B94A0
sub_80B94A0: @ 0x080B94A0
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	movs r6, #0x1e
	ldr r0, _080B94E4 @ =gUnk_08DB88D8
	ldr r1, [r5, #0x34]
	adds r0, r1, r0
	ldrb r4, [r0]
	adds r1, #1
	str r1, [r5, #0x34]
	ldr r0, [r5, #0x38]
	ldrb r0, [r0, #1]
	cmp r0, #0xcd
	beq _080B94CC
	subs r1, r6, r4
	lsls r1, r1, #3
	adds r1, #0xb0
	ldr r0, _080B94E8 @ =0x000001FF
	ands r1, r0
	movs r0, #0
	movs r2, #0x38
	bl sub_8007B80
_080B94CC:
	subs r0, r6, r4
	movs r1, #0
	bl sub_80B8DFC
	cmp r4, #0x1e
	bne _080B94DE
	adds r0, r5, #0
	bl Proc_Break
_080B94DE:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080B94E4: .4byte gUnk_08DB88D8
_080B94E8: .4byte 0x000001FF

	thumb_func_start sub_80B94EC
sub_80B94EC: @ 0x080B94EC
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	adds r1, r2, #0
	ldr r0, _080B9508 @ =gUnk_08DB88EC
	bl Proc_StartBlocking
	str r4, [r0, #0x2c]
	movs r1, #0
	str r1, [r0, #0x30]
	str r5, [r0, #0x38]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080B9508: .4byte gUnk_08DB88EC

	thumb_func_start sub_80B950C
sub_80B950C: @ 0x080B950C
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #8
	mov sb, r0
	bl sub_80B8E80
	mov r0, sb
	bl sub_80B9284
	ldr r4, _080B96B4 @ =gUnk_08DB8814
	ldr r0, [r4]
	movs r1, #0
	bl TmFill
	ldr r0, [r4, #4]
	movs r1, #0
	bl TmFill
	ldr r0, [r4, #8]
	movs r1, #0
	bl TmFill
	ldr r0, [r4, #8]
	ldr r1, _080B96B8 @ =gUnk_08617B20
	ldr r5, _080B96BC @ =0x0000C280
	adds r2, r5, #0
	bl TmApplyTsa_thm
	ldr r0, [r4, #4]
	ldr r1, _080B96C0 @ =gUnk_0861766C
	adds r2, r5, #0
	bl TmApplyTsa_thm
	mov r1, sb
	ldr r0, [r1, #0x38]
	ldrb r0, [r0, #1]
	bl sub_80B8C14
	bl DecodeMsg
	adds r7, r0, #0
	movs r0, #0x78
	adds r1, r7, #0
	bl GetStringTextCenteredPos
	adds r3, r0, #0
	ldr r6, _080B96C4 @ =gUnk_08DB8824
	ldr r0, [r6]
	adds r0, #0x28
	ldr r1, [r4]
	adds r1, #0xc2
	movs r5, #0
	str r5, [sp]
	str r7, [sp, #4]
	movs r2, #0
	bl PutDrawText
	ldr r0, [r6]
	adds r0, #0x38
	ldr r1, [r4]
	ldr r2, _080B96C8 @ =0x00000446
	adds r1, r1, r2
	str r5, [sp]
	ldr r3, _080B96CC @ =gUnk_08622C5C
	mov r8, r3
	str r3, [sp, #4]
	movs r2, #0
	movs r3, #0
	bl PutDrawText
	ldr r0, [r4]
	ldr r1, _080B96D0 @ =0x00000444
	adds r0, r0, r1
	mov r3, sb
	ldrh r2, [r3, #0x3c]
	movs r1, #2
	bl sub_8006068
	ldr r0, [r4]
	ldr r1, _080B96D4 @ =0x0000044C
	adds r0, r0, r1
	mov r1, sb
	adds r1, #0x40
	ldrh r2, [r1]
	movs r1, #2
	bl sub_8006068
	ldr r0, [r4]
	ldr r2, _080B96D8 @ =0x00000454
	adds r0, r0, r2
	mov r1, sb
	adds r1, #0x44
	ldrh r2, [r1]
	movs r1, #2
	bl sub_8006068
	mov r3, sb
	ldr r0, [r3, #0x38]
	ldrb r0, [r0, #2]
	bl sub_80B8C14
	bl DecodeMsg
	adds r7, r0, #0
	movs r0, #0x78
	adds r1, r7, #0
	bl GetStringTextCenteredPos
	adds r3, r0, #0
	ldr r0, [r6]
	adds r0, #0x30
	ldr r1, [r4]
	ldr r2, _080B96DC @ =0x0000045C
	adds r1, r1, r2
	str r5, [sp]
	str r7, [sp, #4]
	movs r2, #0
	bl PutDrawText
	ldr r0, [r6]
	adds r0, #0x40
	ldr r1, [r4]
	adds r1, #0x68
	str r5, [sp]
	mov r3, r8
	str r3, [sp, #4]
	movs r2, #0
	movs r3, #0
	bl PutDrawText
	ldr r0, [r4]
	adds r0, #0x66
	mov r1, sb
	ldrh r2, [r1, #0x3e]
	movs r1, #2
	bl sub_8006068
	ldr r0, [r4]
	adds r0, #0x6e
	mov r1, sb
	adds r1, #0x42
	ldrh r2, [r1]
	movs r1, #2
	bl sub_8006068
	ldr r0, [r4]
	adds r0, #0x76
	mov r1, sb
	adds r1, #0x46
	ldrh r2, [r1]
	movs r1, #2
	bl sub_8006068
	mov r2, sb
	str r5, [r2, #0x34]
	ldr r2, _080B96E0 @ =gDispIo
	adds r1, r2, #0
	adds r1, #0x3c
	movs r0, #0x3f
	ldrb r3, [r1]
	ands r0, r3
	strb r0, [r1]
	adds r1, #8
	movs r0, #0x10
	strb r0, [r1]
	adds r0, r2, #0
	adds r0, #0x45
	strb r5, [r0]
	adds r0, #1
	strb r5, [r0]
	ldr r5, _080B96E4 @ =gCharacterData
	mov r1, sb
	ldr r0, [r1, #0x38]
	ldrb r0, [r0, #1]
	subs r0, #1
	movs r4, #0x34
	muls r0, r4, r0
	adds r0, r0, r5
	ldrh r1, [r0, #6]
	movs r2, #0x98
	lsls r2, r2, #1
	ldr r0, _080B96E8 @ =0x00000503
	str r0, [sp]
	movs r0, #0
	movs r3, #0x30
	bl StartBmFace
	mov r2, sb
	ldr r0, [r2, #0x38]
	ldrb r0, [r0, #2]
	subs r0, #1
	muls r0, r4, r0
	adds r0, r0, r5
	ldrh r1, [r0, #6]
	movs r2, #0xd0
	lsls r2, r2, #1
	ldr r0, _080B96EC @ =0x00000502
	str r0, [sp]
	movs r0, #1
	movs r3, #0x30
	bl StartBmFace
	add sp, #8
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B96B4: .4byte gUnk_08DB8814
_080B96B8: .4byte gUnk_08617B20
_080B96BC: .4byte 0x0000C280
_080B96C0: .4byte gUnk_0861766C
_080B96C4: .4byte gUnk_08DB8824
_080B96C8: .4byte 0x00000446
_080B96CC: .4byte gUnk_08622C5C
_080B96D0: .4byte 0x00000444
_080B96D4: .4byte 0x0000044C
_080B96D8: .4byte 0x00000454
_080B96DC: .4byte 0x0000045C
_080B96E0: .4byte gDispIo
_080B96E4: .4byte gCharacterData
_080B96E8: .4byte 0x00000503
_080B96EC: .4byte 0x00000502

	thumb_func_start sub_80B96F0
sub_80B96F0: @ 0x080B96F0
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r7, r0, #0
	movs r5, #0x1e
	ldr r0, _080B9748 @ =gUnk_08DB88D8
	ldr r1, [r7, #0x34]
	adds r0, r1, r0
	ldrb r0, [r0]
	mov r8, r0
	adds r1, #1
	str r1, [r7, #0x34]
	subs r5, r5, r0
	lsls r4, r5, #3
	adds r1, r4, #0
	adds r1, #0x40
	ldr r6, _080B974C @ =0x000001FF
	ands r1, r6
	movs r0, #0
	movs r2, #0x30
	bl sub_8007B80
	adds r4, #0xb0
	ands r4, r6
	movs r0, #1
	adds r1, r4, #0
	movs r2, #0x30
	bl sub_8007B80
	adds r0, r5, #0
	movs r1, #0
	bl sub_80B8DFC
	mov r0, r8
	cmp r0, #0x1e
	bne _080B973E
	adds r0, r7, #0
	bl Proc_Break
_080B973E:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B9748: .4byte gUnk_08DB88D8
_080B974C: .4byte 0x000001FF

	thumb_func_start sub_80B9750
sub_80B9750: @ 0x080B9750
	movs r3, #0
	str r3, [r0, #0x34]
	ldr r0, _080B9794 @ =gDispIo
	mov ip, r0
	mov r2, ip
	adds r2, #0x3c
	movs r0, #0x3f
	ldrb r1, [r2]
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r2]
	mov r1, ip
	adds r1, #0x44
	movs r0, #0x10
	strb r0, [r1]
	mov r0, ip
	adds r0, #0x45
	strb r3, [r0]
	adds r0, #1
	strb r3, [r0]
	ldr r0, _080B9798 @ =0x0000FFE0
	mov r2, ip
	ldrh r2, [r2, #0x3c]
	ands r0, r2
	ldr r1, _080B979C @ =0x0000E0FF
	ands r0, r1
	movs r2, #0x80
	lsls r2, r2, #3
	adds r1, r2, #0
	orrs r0, r1
	mov r1, ip
	strh r0, [r1, #0x3c]
	bx lr
	.align 2, 0
_080B9794: .4byte gDispIo
_080B9798: .4byte 0x0000FFE0
_080B979C: .4byte 0x0000E0FF

	thumb_func_start sub_80B97A0
sub_80B97A0: @ 0x080B97A0
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x34]
	asrs r3, r0, #2
	adds r0, #1
	str r0, [r4, #0x34]
	ldr r0, _080B97E8 @ =gDispIo
	mov ip, r0
	mov r2, ip
	adds r2, #0x3c
	movs r0, #0x3f
	ldrb r1, [r2]
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r2]
	movs r0, #0x10
	subs r0, r0, r3
	mov r1, ip
	adds r1, #0x44
	movs r2, #0
	strb r0, [r1]
	mov r0, ip
	adds r0, #0x45
	strb r3, [r0]
	adds r0, #1
	strb r2, [r0]
	cmp r3, #8
	bne _080B97E0
	adds r0, r4, #0
	bl Proc_Break
_080B97E0:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080B97E8: .4byte gDispIo

	thumb_func_start sub_80B97EC
sub_80B97EC: @ 0x080B97EC
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	adds r4, r1, #0
	adds r5, r2, #0
	adds r1, r3, #0
	ldr r0, _080B9808 @ =gUnk_08DB890C
	bl Proc_StartBlocking
	str r4, [r0, #0x2c]
	str r5, [r0, #0x30]
	str r6, [r0, #0x38]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080B9808: .4byte gUnk_08DB890C

	thumb_func_start sub_80B980C
sub_80B980C: @ 0x080B980C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r6, r0, #0
	ldr r4, _080B9870 @ =gUnk_08DB8824
	ldr r0, [r4]
	str r0, [r6, #0x48]
	movs r1, #4
	str r1, [r6, #0x40]
	str r1, [r6, #0x3c]
	movs r1, #0
	bl Text_SetCursor
	ldr r0, [r6, #0x48]
	movs r1, #0
	bl Text_SetColor
	movs r5, #0
	mov r8, r4
	movs r7, #0xc0
	lsls r7, r7, #1
_080B9836:
	lsls r4, r5, #3
	mov r1, r8
	ldr r0, [r1]
	adds r0, r0, r4
	bl ClearText
	mov r1, r8
	ldr r0, [r1]
	adds r0, r0, r4
	ldr r1, _080B9874 @ =gBg0Tm + 0x4
	adds r1, r7, r1
	bl PutText
	adds r7, #0x80
	adds r5, #1
	cmp r5, #4
	ble _080B9836
	movs r0, #1
	bl EnableBgSync
	ldr r2, [r6, #0x2c]
	ldrb r1, [r2]
	cmp r1, #4
	beq _080B98A8
	cmp r1, #4
	bgt _080B9878
	cmp r1, #3
	beq _080B98A4
	b _080B98CA
	.align 2, 0
_080B9870: .4byte gUnk_08DB8824
_080B9874: .4byte gBg0Tm + 0x4
_080B9878:
	cmp r1, #5
	bne _080B98CA
	bl sub_80B7480
	adds r5, r0, #0
	cmp r5, #3
	ble _080B9890
	ldr r0, _080B988C @ =0x0000106A
	b _080B98E8
	.align 2, 0
_080B988C: .4byte 0x0000106A
_080B9890:
	cmp r5, #1
	ble _080B989C
	ldr r0, _080B9898 @ =0x0000106C
	b _080B98E8
	.align 2, 0
_080B9898: .4byte 0x0000106C
_080B989C:
	ldr r0, _080B98A0 @ =0x0000106E
	b _080B98E8
	.align 2, 0
_080B98A0: .4byte 0x0000106E
_080B98A4:
	ldr r0, [r2, #4]
	b _080B98E8
_080B98A8:
	ldr r3, [r6, #0x30]
	ldr r0, [r3, #0xc]
	ands r0, r1
	cmp r0, #0
	bne _080B98BC
	ldr r0, [r6, #0x34]
	ldr r0, [r0, #0xc]
	ands r0, r1
	cmp r0, #0
	beq _080B98C6
_080B98BC:
	ldr r0, [r3]
	ldrb r0, [r0, #4]
	bl sub_80B8C5C
	b _080B98EC
_080B98C6:
	ldr r0, [r2, #4]
	b _080B98E8
_080B98CA:
	ldr r2, [r6, #0x30]
	ldr r0, [r2, #0xc]
	movs r1, #4
	ands r0, r1
	cmp r0, #0
	beq _080B98E4
	ldr r0, [r2]
	ldrb r0, [r0, #4]
	bl sub_80B8C5C
	str r0, [r6, #0x44]
	cmp r0, #0
	bne _080B98EE
_080B98E4:
	ldr r0, [r6, #0x2c]
	ldr r0, [r0, #4]
_080B98E8:
	bl DecodeMsg
_080B98EC:
	str r0, [r6, #0x44]
_080B98EE:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_80B98F8
sub_80B98F8: @ 0x080B98F8
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _080B9924 @ =gpKeySt
	ldr r1, [r0]
	movs r0, #8
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _080B9928
	bl sub_809F9D0
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080B9928
	adds r0, r4, #0
	bl Proc_Break
	ldr r0, [r4, #0x14]
	movs r1, #0x64
	bl Proc_Goto
	b _080B99D0
	.align 2, 0
_080B9924: .4byte gpKeySt
_080B9928:
	ldr r0, [r4, #0x3c]
	cmp r0, #0
	beq _080B9932
	subs r0, #1
	b _080B99CE
_080B9932:
	movs r0, #0
	bl SetTextFont
	ldr r0, [r4, #0x44]
	ldrb r0, [r0]
	cmp r0, #7
	bhi _080B99C2
	lsls r0, r0, #2
	ldr r1, _080B994C @ =_080B9950
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080B994C: .4byte _080B9950
_080B9950: @ jump table
	.4byte _080B9970 @ case 0
	.4byte _080B9978 @ case 1
	.4byte _080B99C2 @ case 2
	.4byte _080B99C2 @ case 3
	.4byte _080B999A @ case 4
	.4byte _080B99A4 @ case 5
	.4byte _080B99AE @ case 6
	.4byte _080B99B8 @ case 7
_080B9970:
	adds r0, r4, #0
	bl Proc_Break
	b _080B99CC
_080B9978:
	ldr r0, [r4, #0x44]
	adds r0, #1
	str r0, [r4, #0x44]
	ldr r0, [r4, #0x48]
	adds r0, #8
	str r0, [r4, #0x48]
	ldr r1, [r4, #0x3c]
	adds r1, #0x10
	str r1, [r4, #0x3c]
	movs r1, #0
	bl Text_SetCursor
	ldr r0, [r4, #0x48]
	movs r1, #0
	bl Text_SetColor
	b _080B99CC
_080B999A:
	movs r0, #8
	str r0, [r4, #0x3c]
	ldr r0, [r4, #0x44]
	adds r0, #1
	b _080B99CA
_080B99A4:
	movs r0, #0x10
	str r0, [r4, #0x3c]
	ldr r0, [r4, #0x44]
	adds r0, #1
	b _080B99CA
_080B99AE:
	movs r0, #0x20
	str r0, [r4, #0x3c]
	ldr r0, [r4, #0x44]
	adds r0, #1
	b _080B99CA
_080B99B8:
	movs r0, #0x40
	str r0, [r4, #0x3c]
	ldr r0, [r4, #0x44]
	adds r0, #1
	b _080B99CA
_080B99C2:
	ldr r0, [r4, #0x48]
	ldr r1, [r4, #0x44]
	bl Text_DrawCharacter
_080B99CA:
	str r0, [r4, #0x44]
_080B99CC:
	ldr r0, [r4, #0x40]
_080B99CE:
	str r0, [r4, #0x3c]
_080B99D0:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_80B99D8
sub_80B99D8: @ 0x080B99D8
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r6, r2, #0
	adds r1, r3, #0
	ldr r0, _080B99F4 @ =gUnk_08DB8944
	bl Proc_StartBlocking
	str r4, [r0, #0x2c]
	str r5, [r0, #0x30]
	str r6, [r0, #0x34]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080B99F4: .4byte gUnk_08DB8944

	thumb_func_start sub_80B99F8
sub_80B99F8: @ 0x080B99F8
	push {lr}
	ldr r0, _080B9A04 @ =gUnk_08DB8944
	bl Proc_EndEach
	pop {r0}
	bx r0
	.align 2, 0
_080B9A04: .4byte gUnk_08DB8944

	thumb_func_start sub_80B9A08
sub_80B9A08: @ 0x080B9A08
	push {lr}
	ldr r0, _080B9A34 @ =gUnk_08618410
	movs r1, #0xe0
	lsls r1, r1, #1
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r0, _080B9A38 @ =gUnk_08618430
	ldr r1, _080B9A3C @ =0x06001000
	bl Decompress
	ldr r0, _080B9A40 @ =gBg2Tm
	ldr r1, _080B9A44 @ =gUnk_0861882C
	ldr r2, _080B9A48 @ =0x0000E080
	bl TmApplyTsa_thm
	movs r0, #4
	bl EnableBgSync
	pop {r0}
	bx r0
	.align 2, 0
_080B9A34: .4byte gUnk_08618410
_080B9A38: .4byte gUnk_08618430
_080B9A3C: .4byte 0x06001000
_080B9A40: .4byte gBg2Tm
_080B9A44: .4byte gUnk_0861882C
_080B9A48: .4byte 0x0000E080

	thumb_func_start sub_80B9A4C
sub_80B9A4C: @ 0x080B9A4C
	push {r4, lr}
	sub sp, #4
	adds r4, r0, #0
	adds r1, r4, #0
	adds r1, #0x4c
	movs r0, #0
	strh r0, [r1]
	str r0, [r4, #0x58]
	bl InitBgs
	movs r0, #0x86
	bl CheckFlag
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080B9A94
	ldr r0, _080B9A90 @ =gBg3Tm
	movs r1, #0x80
	lsls r1, r1, #8
	movs r2, #0x40
	str r2, [sp]
	movs r2, #1
	movs r3, #7
	bl sub_80B7980
	movs r0, #8
	bl EnableBgSync
	adds r0, r4, #0
	movs r1, #1
	bl Proc_Goto
	b _080B9A98
	.align 2, 0
_080B9A90: .4byte gBg3Tm
_080B9A94:
	bl sub_80B9A08
_080B9A98:
	ldr r3, _080B9AC0 @ =gDispIo
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
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080B9AC0: .4byte gDispIo

	thumb_func_start sub_80B9AC4
sub_80B9AC4: @ 0x080B9AC4
	push {lr}
	adds r2, r0, #0
	ldr r0, [r2, #0x58]
	adds r0, #1
	str r0, [r2, #0x58]
	ldr r0, _080B9AE4 @ =gpKeySt
	ldr r1, [r0]
	movs r0, #9
	ldrh r3, [r1, #8]
	ands r0, r3
	cmp r0, #0
	beq _080B9AE8
	adds r0, r2, #0
	bl Proc_Break
	b _080B9B18
	.align 2, 0
_080B9AE4: .4byte gpKeySt
_080B9AE8:
	movs r0, #4
	ldrh r1, [r1, #4]
	ands r0, r1
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	cmp r1, #0
	beq _080B9B12
	adds r1, r2, #0
	adds r1, #0x4c
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x77
	ble _080B9B18
	adds r0, r2, #0
	movs r1, #2
	bl Proc_Goto
	b _080B9B18
_080B9B12:
	adds r0, r2, #0
	adds r0, #0x4c
	strh r1, [r0]
_080B9B18:
	pop {r0}
	bx r0

	thumb_func_start sub_80B9B1C
sub_80B9B1C: @ 0x080B9B1C
	push {r4, lr}
	ldr r1, _080B9B74 @ =gDispIo
	mov ip, r1
	mov r3, ip
	adds r3, #0x3c
	movs r1, #0x3f
	ldrb r2, [r3]
	ands r1, r2
	movs r2, #0x40
	orrs r1, r2
	strb r1, [r3]
	mov r1, ip
	adds r1, #0x44
	movs r3, #0
	strb r3, [r1]
	mov r2, ip
	adds r2, #0x45
	movs r1, #0x10
	strb r1, [r2]
	mov r1, ip
	adds r1, #0x46
	strb r3, [r1]
	ldr r1, _080B9B78 @ =0x0000FFE0
	mov r4, ip
	ldrh r4, [r4, #0x3c]
	ands r1, r4
	movs r2, #4
	orrs r1, r2
	ldr r2, _080B9B7C @ =0x0000E0FF
	ands r1, r2
	movs r4, #0x80
	lsls r4, r4, #4
	adds r2, r4, #0
	orrs r1, r2
	mov r2, ip
	strh r1, [r2, #0x3c]
	adds r0, #0x4c
	strh r3, [r0]
	bl sub_80B9A08
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080B9B74: .4byte gDispIo
_080B9B78: .4byte 0x0000FFE0
_080B9B7C: .4byte 0x0000E0FF

	thumb_func_start sub_80B9B80
sub_80B9B80: @ 0x080B9B80
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	adds r4, r6, #0
	adds r4, #0x4c
	ldrh r2, [r4]
	adds r0, r2, #1
	strh r0, [r4]
	lsls r2, r2, #0x10
	asrs r2, r2, #0x12
	ldr r0, _080B9BD0 @ =gDispIo
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
	movs r5, #0
	strb r2, [r0]
	mov r1, ip
	adds r1, #0x45
	movs r0, #0x10
	strb r0, [r1]
	mov r0, ip
	adds r0, #0x46
	strb r5, [r0]
	cmp r2, #0x10
	bne _080B9BC8
	adds r0, r6, #0
	bl Proc_Break
	strh r5, [r4]
_080B9BC8:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080B9BD0: .4byte gDispIo

	thumb_func_start sub_80B9BD4
sub_80B9BD4: @ 0x080B9BD4
	ldr r2, _080B9C04 @ =gDispIo
	adds r1, r2, #0
	adds r1, #0x3c
	movs r0, #0xc0
	ldrb r3, [r1]
	orrs r0, r3
	strb r0, [r1]
	adds r0, r2, #0
	adds r0, #0x44
	movs r1, #0
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r1, r2, #0
	adds r1, #0x46
	movs r0, #0x10
	strb r0, [r1]
	ldr r0, _080B9C08 @ =0x0000FFE0
	ldrh r1, [r2, #0x3c]
	ands r0, r1
	movs r1, #0x1f
	orrs r0, r1
	strh r0, [r2, #0x3c]
	bx lr
	.align 2, 0
_080B9C04: .4byte gDispIo
_080B9C08: .4byte 0x0000FFE0

	thumb_func_start sub_80B9C0C
sub_80B9C0C: @ 0x080B9C0C
	push {lr}
	adds r1, r0, #0
	ldr r0, _080B9C1C @ =gUnk_08DB8964
	bl Proc_StartBlocking
	pop {r0}
	bx r0
	.align 2, 0
_080B9C1C: .4byte gUnk_08DB8964

	thumb_func_start sub_80B9C20
sub_80B9C20: @ 0x080B9C20
	push {r4, lr}
	adds r4, r0, #0
	ldr r2, _080B9C70 @ =gDispIo
	movs r0, #1
	ldrb r1, [r2, #1]
	orrs r0, r1
	movs r1, #2
	orrs r0, r1
	movs r1, #5
	rsbs r1, r1, #0
	ands r0, r1
	movs r1, #8
	orrs r0, r1
	movs r1, #0x10
	orrs r0, r1
	strb r0, [r2, #1]
	ldr r0, _080B9C74 @ =gUnk_08407E9C
	movs r1, #0xa0
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r0, _080B9C78 @ =Img_ChapterIntroFog
	ldr r1, _080B9C7C @ =0x06004000
	bl Decompress
	ldr r0, _080B9C80 @ =gBg2Tm
	ldr r1, _080B9C84 @ =Tsa_QuintessenceFx
	movs r2, #0xa4
	lsls r2, r2, #7
	bl TmApplyTsa_thm
	movs r0, #4
	bl EnableBgSync
	adds r4, #0x4c
	movs r0, #0
	strh r0, [r4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080B9C70: .4byte gDispIo
_080B9C74: .4byte gUnk_08407E9C
_080B9C78: .4byte Img_ChapterIntroFog
_080B9C7C: .4byte 0x06004000
_080B9C80: .4byte gBg2Tm
_080B9C84: .4byte Tsa_QuintessenceFx

	thumb_func_start sub_80B9C88
sub_80B9C88: @ 0x080B9C88
	push {lr}
	adds r0, #0x4c
	ldrh r1, [r0]
	adds r1, #1
	strh r1, [r0]
	movs r1, #0
	ldrsh r2, [r0, r1]
	lsls r0, r2, #1
	adds r0, r0, r2
	cmp r0, #0
	bge _080B9CA0
	adds r0, #7
_080B9CA0:
	lsls r0, r0, #0xd
	lsrs r1, r0, #0x10
	adds r0, r2, #0
	cmp r0, #0
	bge _080B9CAC
	adds r0, #3
_080B9CAC:
	lsls r2, r0, #0xe
	lsrs r2, r2, #0x10
	movs r0, #2
	bl SetBgOffset
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_80B9CBC
sub_80B9CBC: @ 0x080B9CBC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	adds r4, r0, #0
	movs r5, #0
	str r5, [r4, #0x30]
	movs r0, #0x20
	str r0, [r4, #0x34]
	adds r0, r4, #0
	adds r0, #0x39
	strb r5, [r0]
	str r5, [r4, #0x2c]
	bl GetNextChapterStatsSlot
	adds r4, #0x38
	strb r0, [r4]
	ldr r7, _080B9D94 @ =gDispIo
	movs r4, #2
	rsbs r4, r4, #0
	adds r0, r4, #0
	ldrb r1, [r7, #1]
	ands r0, r1
	movs r2, #3
	rsbs r2, r2, #0
	mov sl, r2
	ands r0, r2
	movs r1, #5
	rsbs r1, r1, #0
	mov sb, r1
	ands r0, r1
	subs r2, #6
	mov r8, r2
	ands r0, r2
	movs r6, #0x11
	rsbs r6, r6, #0
	ands r0, r6
	strb r0, [r7, #1]
	movs r0, #0
	bl SetOnHBlankA
	movs r0, #0
	bl InitBgs
	ldrb r0, [r7, #1]
	ands r4, r0
	mov r1, sl
	ands r4, r1
	mov r2, sb
	ands r4, r2
	mov r0, r8
	ands r4, r0
	ands r4, r6
	strb r4, [r7, #1]
	adds r1, r7, #0
	adds r1, #0x3c
	movs r0, #0x3f
	ldrb r2, [r1]
	ands r0, r2
	strb r0, [r1]
	adds r1, #8
	movs r0, #0x10
	strb r0, [r1]
	adds r0, r7, #0
	adds r0, #0x45
	strb r5, [r0]
	adds r0, #1
	strb r5, [r0]
	bl ResetText
	movs r0, #0x21
	rsbs r0, r0, #0
	ldrb r1, [r7, #1]
	ands r0, r1
	movs r1, #0x41
	rsbs r1, r1, #0
	ands r0, r1
	movs r1, #0x7f
	ands r0, r1
	strb r0, [r7, #1]
	ldr r0, _080B9D98 @ =gUnk_0861A420
	movs r1, #0xe0
	lsls r1, r1, #1
	movs r2, #0x40
	bl ApplyPaletteExt
	ldr r0, _080B9D9C @ =gUnk_086B7400
	ldr r1, _080B9DA0 @ =0x06008000
	bl Decompress
	ldr r0, _080B9DA4 @ =gBg3Tm
	ldr r1, _080B9DA8 @ =gUnk_0861A460
	movs r2, #0xe0
	lsls r2, r2, #8
	bl TmApplyTsa_thm
	movs r0, #8
	bl EnableBgSync
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B9D94: .4byte gDispIo
_080B9D98: .4byte gUnk_0861A420
_080B9D9C: .4byte gUnk_086B7400
_080B9DA0: .4byte 0x06008000
_080B9DA4: .4byte gBg3Tm
_080B9DA8: .4byte gUnk_0861A460

	thumb_func_start sub_80B9DAC
sub_80B9DAC: @ 0x080B9DAC
	push {r4, r5, r6, lr}
	ldr r2, _080B9E8C @ =0x0000FF78
	movs r0, #1
	movs r1, #0
	bl SetBgOffset
	ldr r0, _080B9E90 @ =gDispIo
	mov ip, r0
	movs r0, #0x20
	mov r1, ip
	ldrb r1, [r1, #1]
	orrs r0, r1
	movs r1, #0x41
	rsbs r1, r1, #0
	ands r0, r1
	movs r1, #0x7f
	ands r0, r1
	mov r2, ip
	strb r0, [r2, #1]
	mov r1, ip
	adds r1, #0x2d
	movs r0, #0
	strb r0, [r1]
	adds r1, #4
	movs r0, #0x18
	strb r0, [r1]
	subs r1, #5
	movs r0, #0xf0
	strb r0, [r1]
	adds r1, #4
	movs r0, #0x88
	strb r0, [r1]
	adds r2, #0x34
	movs r0, #1
	ldrb r1, [r2]
	orrs r0, r1
	movs r1, #2
	orrs r0, r1
	movs r5, #4
	orrs r0, r5
	movs r4, #8
	orrs r0, r4
	movs r3, #0x10
	orrs r0, r3
	strb r0, [r2]
	adds r2, #2
	movs r0, #2
	rsbs r0, r0, #0
	ldrb r1, [r2]
	ands r0, r1
	movs r1, #3
	rsbs r1, r1, #0
	ands r0, r1
	orrs r0, r5
	orrs r0, r4
	orrs r0, r3
	strb r0, [r2]
	movs r4, #0
	ldr r6, _080B9E94 @ =gUnk_08DB8B60
	movs r5, #0x48
_080B9E24:
	lsls r1, r4, #3
	ldr r0, [r6]
	adds r0, r0, r1
	movs r1, #3
	bl InitText
	ldr r0, [r6]
	adds r0, r0, r5
	movs r1, #9
	bl InitText
	adds r5, #8
	adds r4, #1
	cmp r4, #8
	ble _080B9E24
	ldr r5, _080B9E94 @ =gUnk_08DB8B60
	ldr r0, [r5]
	adds r0, #0x90
	movs r1, #3
	bl InitText
	ldr r0, [r5]
	adds r0, #0x98
	movs r1, #2
	bl InitText
	ldr r4, [r5]
	adds r4, #0x90
	ldr r0, _080B9E98 @ =0x00001181
	bl DecodeMsg
	adds r1, r0, #0
	adds r0, r4, #0
	bl Text_DrawString
	ldr r0, [r5]
	adds r0, #0x98
	movs r1, #3
	bl Text_SetColor
	ldr r4, [r5]
	adds r4, #0x98
	ldr r0, _080B9E9C @ =0x0000117A
	bl DecodeMsg
	adds r1, r0, #0
	adds r0, r4, #0
	bl Text_DrawString
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080B9E8C: .4byte 0x0000FF78
_080B9E90: .4byte gDispIo
_080B9E94: .4byte gUnk_08DB8B60
_080B9E98: .4byte 0x00001181
_080B9E9C: .4byte 0x0000117A

	thumb_func_start sub_80B9EA0
sub_80B9EA0: @ 0x080B9EA0
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x14
	str r0, [sp, #8]
	adds r4, r1, #0
	movs r0, #0
	str r0, [sp, #0x10]
	adds r0, r4, #0
	movs r1, #9
	bl __modsi3
	str r0, [sp, #0xc]
	lsls r7, r4, #1
	movs r0, #0x1f
	ands r7, r0
	lsls r6, r7, #5
	lsls r0, r7, #6
	ldr r1, _080B9F50 @ =gBg1Tm
	mov sl, r1
	add r0, sl
	movs r1, #0x1f
	movs r2, #1
	movs r3, #0
	bl TmFillRect_thm
	movs r0, #2
	bl EnableBgSync
	ldr r2, _080B9F54 @ =gUnk_08DB8B60
	mov sb, r2
	ldr r3, [sp, #0xc]
	lsls r4, r3, #3
	ldr r0, [r2]
	adds r0, r0, r4
	bl ClearText
	adds r5, r4, #0
	adds r5, #0x48
	mov r1, sb
	ldr r0, [r1]
	adds r0, r0, r5
	bl ClearText
	movs r0, #1
	rsbs r0, r0, #0
	ldr r2, [sp, #8]
	cmp r2, r0
	bne _080B9F5C
	bl sub_80A0628
	adds r4, r0, #0
	mov r3, sb
	ldr r0, [r3]
	adds r0, r0, r5
	adds r1, r6, #0
	adds r1, #0xb
	lsls r1, r1, #1
	add r1, sl
	ldr r2, [sp, #0x10]
	str r2, [sp]
	ldr r2, _080B9F58 @ =gUnk_08622C70
	str r2, [sp, #4]
	movs r2, #3
	movs r3, #0
	bl PutDrawText
	adds r0, r6, #0
	adds r0, #0x15
	lsls r0, r0, #1
	add r0, sl
	movs r1, #2
	adds r2, r4, #0
	bl sub_8006068
	mov r3, sb
	ldr r0, [r3]
	adds r0, #0x90
	adds r1, r6, #0
	adds r1, #0x16
	lsls r1, r1, #1
	add r1, sl
	bl PutText
	movs r0, #0
	b _080BA140
	.align 2, 0
_080B9F50: .4byte gBg1Tm
_080B9F54: .4byte gUnk_08DB8B60
_080B9F58: .4byte gUnk_08622C70
_080B9F5C:
	ldr r0, [sp, #8]
	cmp r0, #0
	bne _080B9F64
	b _080BA13E
_080B9F64:
	ldr r0, [r0]
	lsls r0, r0, #0x19
	lsrs r0, r0, #0x19
	mov r8, r0
	bl GetROMChapterStruct
	adds r1, r0, #0
	movs r2, #0
	ldr r0, _080B9F98 @ =gPlaySt
	ldrb r0, [r0, #0x1b]
	cmp r0, #3
	bne _080B9F7E
	movs r2, #1
_080B9F7E:
	adds r0, r1, #0
	adds r0, #0x80
	adds r0, r0, r2
	ldrb r0, [r0]
	lsrs r2, r0, #1
	mov r1, r8
	cmp r1, #0x19
	beq _080B9FE8
	cmp r1, #0x19
	bgt _080B9F9C
	cmp r1, #0
	beq _080B9FC8
	b _080BA012
	.align 2, 0
_080B9F98: .4byte gPlaySt
_080B9F9C:
	mov r3, r8
	cmp r3, #0x2f
	bgt _080BA012
	cmp r3, #0x2e
	blt _080BA012
	ldr r0, _080B9FC4 @ =0x0000117D
	bl DecodeMsg
	adds r2, r0, #0
	mov r1, sb
	ldr r0, [r1]
	adds r0, r0, r4
	adds r1, r6, #5
	lsls r1, r1, #1
	add r1, sl
	ldr r3, [sp, #0x10]
	str r3, [sp]
	str r2, [sp, #4]
	b _080BA068
	.align 2, 0
_080B9FC4: .4byte 0x0000117D
_080B9FC8:
	ldr r0, _080B9FE4 @ =0x0000117E
	bl DecodeMsg
	adds r2, r0, #0
	mov r1, sb
	ldr r0, [r1]
	adds r0, r0, r4
	adds r1, r6, #5
	lsls r1, r1, #1
	add r1, sl
	ldr r3, [sp, #0x10]
	str r3, [sp]
	str r2, [sp, #4]
	b _080BA068
	.align 2, 0
_080B9FE4: .4byte 0x0000117E
_080B9FE8:
	adds r0, r6, #5
	lsls r0, r0, #1
	add r0, sl
	movs r1, #2
	bl sub_8006068
	movs r0, #0x8c
	lsls r0, r0, #5
	bl DecodeMsg
	adds r2, r0, #0
	mov r1, sb
	ldr r0, [r1]
	adds r0, r0, r4
	adds r1, r6, #6
	lsls r1, r1, #1
	add r1, sl
	ldr r3, [sp, #0x10]
	str r3, [sp]
	str r2, [sp, #4]
	b _080BA068
_080BA012:
	lsls r4, r7, #5
	subs r0, r4, #1
	adds r0, #6
	lsls r0, r0, #1
	ldr r7, _080BA074 @ =gBg1Tm
	adds r0, r0, r7
	movs r1, #2
	bl sub_8006068
	mov r0, r8
	bl GetROMChapterStruct
	adds r1, r0, #0
	movs r2, #0
	ldr r0, _080BA078 @ =gPlaySt
	adds r6, r4, #0
	ldrb r0, [r0, #0x1b]
	cmp r0, #3
	bne _080BA03A
	movs r2, #1
_080BA03A:
	adds r0, r1, #0
	adds r0, #0x80
	adds r0, r0, r2
	movs r5, #1
	ldrb r0, [r0]
	ands r5, r0
	cmp r5, #0
	beq _080BA084
	ldr r0, _080BA07C @ =0x0000117F
	bl DecodeMsg
	adds r3, r0, #0
	ldr r0, _080BA080 @ =gUnk_08DB8B60
	ldr r1, [sp, #0xc]
	lsls r4, r1, #3
	ldr r0, [r0]
	adds r0, r0, r4
	adds r1, r6, #6
	lsls r1, r1, #1
	adds r1, r1, r7
	movs r2, #0
	str r2, [sp]
	str r3, [sp, #4]
_080BA068:
	movs r2, #3
	movs r3, #0
	bl PutDrawText
	b _080BA0A8
	.align 2, 0
_080BA074: .4byte gBg1Tm
_080BA078: .4byte gPlaySt
_080BA07C: .4byte 0x0000117F
_080BA080: .4byte gUnk_08DB8B60
_080BA084:
	ldr r0, _080BA0C8 @ =0x0000117B
	bl DecodeMsg
	adds r2, r0, #0
	ldr r0, _080BA0CC @ =gUnk_08DB8B60
	ldr r3, [sp, #0xc]
	lsls r4, r3, #3
	ldr r0, [r0]
	adds r0, r0, r4
	adds r1, r6, #6
	lsls r1, r1, #1
	adds r1, r1, r7
	str r5, [sp]
	str r2, [sp, #4]
	movs r2, #3
	movs r3, #0
	bl PutDrawText
_080BA0A8:
	mov r0, r8
	cmp r0, #0x2f
	bgt _080BA0D0
	cmp r0, #0x2e
	blt _080BA0D0
	ldr r1, [sp, #8]
	ldm r1!, {r0}
	lsls r0, r0, #0x10
	lsrs r7, r0, #0x17
	ldr r0, [r1]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x17
	adds r7, r7, r0
	movs r2, #1
	str r2, [sp, #0x10]
	b _080BA0D8
	.align 2, 0
_080BA0C8: .4byte 0x0000117B
_080BA0CC: .4byte gUnk_08DB8B60
_080BA0D0:
	ldr r3, [sp, #8]
	ldr r0, [r3]
	lsls r0, r0, #0x10
	lsrs r7, r0, #0x17
_080BA0D8:
	mov r0, r8
	bl GetROMChapterStruct
	adds r2, r0, #0
	ldr r0, _080BA150 @ =gPlaySt
	movs r1, #0
	ldrb r0, [r0, #0x1b]
	cmp r0, #3
	bne _080BA0EC
	movs r1, #2
_080BA0EC:
	adds r0, r2, #0
	adds r0, #0x70
	adds r0, r0, r1
	ldrh r0, [r0]
	bl DecodeMsg
	adds r3, r0, #0
	ldr r5, _080BA154 @ =gUnk_08DB8B60
	adds r1, r4, #0
	adds r1, #0x48
	ldr r0, [r5]
	adds r0, r0, r1
	adds r1, r6, #4
	adds r1, #6
	lsls r1, r1, #1
	ldr r4, _080BA158 @ =gBg1Tm
	adds r1, r1, r4
	movs r2, #0
	str r2, [sp]
	str r3, [sp, #4]
	movs r3, #0
	bl PutDrawText
	adds r0, r6, #0
	adds r0, #0xf
	adds r0, #6
	lsls r0, r0, #1
	adds r0, r0, r4
	movs r1, #2
	adds r2, r7, #0
	bl sub_8006068
	ldr r0, [r5]
	adds r0, #0x90
	adds r1, r6, #0
	adds r1, #0x10
	adds r1, #6
	lsls r1, r1, #1
	adds r1, r1, r4
	bl PutText
_080BA13E:
	ldr r0, [sp, #0x10]
_080BA140:
	add sp, #0x14
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_080BA150: .4byte gPlaySt
_080BA154: .4byte gUnk_08DB8B60
_080BA158: .4byte gBg1Tm

	thumb_func_start sub_80BA15C
sub_80BA15C: @ 0x080BA15C
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x30]
	asrs r5, r0, #6
	adds r2, r5, #0
	subs r2, #0x88
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	movs r0, #1
	movs r1, #0
	bl SetBgOffset
	movs r0, #0xf
	ands r0, r5
	cmp r0, #0
	bne _080BA1DE
	adds r0, r4, #0
	adds r0, #0x39
	ldrb r1, [r0]
	adds r2, r5, #0
	adds r5, r0, #0
	cmp r2, #0
	bge _080BA18C
	adds r2, #0xf
_080BA18C:
	asrs r0, r2, #4
	cmp r1, r0
	bne _080BA1DE
	adds r0, r4, #0
	adds r0, #0x38
	ldrb r2, [r0]
	ldr r0, [r4, #0x2c]
	cmp r0, r2
	blt _080BA1C2
	subs r0, r0, r2
	cmp r0, #1
	bne _080BA1AE
	movs r0, #1
	rsbs r0, r0, #0
	bl sub_80B9EA0
	b _080BA1D2
_080BA1AE:
	cmp r0, #2
	ble _080BA1BA
	adds r0, r4, #0
	bl Proc_Break
	b _080BA1D2
_080BA1BA:
	movs r0, #0
	bl sub_80B9EA0
	b _080BA1D2
_080BA1C2:
	bl GetChapterStats
	ldrb r1, [r5]
	bl sub_80B9EA0
	ldr r1, [r4, #0x2c]
	adds r1, r1, r0
	str r1, [r4, #0x2c]
_080BA1D2:
	ldr r0, [r4, #0x2c]
	adds r0, #1
	str r0, [r4, #0x2c]
	ldrb r0, [r5]
	adds r0, #1
	strb r0, [r5]
_080BA1DE:
	ldr r0, _080BA200 @ =gpKeySt
	ldr r1, [r0]
	movs r0, #1
	ldrh r1, [r1, #4]
	ands r0, r1
	ldr r1, [r4, #0x34]
	cmp r0, #0
	beq _080BA1F4
	ldr r0, [r4, #0x30]
	adds r0, r0, r1
	str r0, [r4, #0x30]
_080BA1F4:
	ldr r0, [r4, #0x30]
	adds r0, r0, r1
	str r0, [r4, #0x30]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080BA200: .4byte gpKeySt

	thumb_func_start sub_80BA204
sub_80BA204: @ 0x080BA204
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	str r0, [sp, #4]
	ldr r3, _080BA3F4 @ =gUnk_08DB8A2C
	ldr r0, _080BA3F8 @ =0x00009480
	str r0, [sp]
	movs r0, #2
	movs r1, #0x18
	movs r2, #0x14
	bl PutSpriteExt
	ldr r3, _080BA3FC @ =gUnk_08DB8AA0
	movs r0, #0xc9
	lsls r0, r0, #7
	str r0, [sp]
	movs r0, #2
	movs r1, #0x10
	movs r2, #0x80
	bl PutSpriteExt
	ldr r1, _080BA400 @ =gPlaySt
	movs r0, #0x80
	ldrb r1, [r1, #0x14]
	ands r0, r1
	cmp r0, #0
	bne _080BA242
	b _080BA42C
_080BA242:
	ldr r3, _080BA404 @ =gUnk_08DB8A4C
	ldr r4, _080BA408 @ =0x00008480
	str r4, [sp]
	movs r0, #2
	movs r1, #0x10
	movs r2, #0x38
	bl PutSpriteExt
	ldr r3, _080BA40C @ =gUnk_08DB8A5A
	str r4, [sp]
	movs r0, #2
	movs r1, #0x80
	movs r2, #0x38
	bl PutSpriteExt
	ldr r3, _080BA410 @ =gUnk_08DB8A76
	str r4, [sp]
	movs r0, #2
	movs r1, #0x10
	movs r2, #0x58
	bl PutSpriteExt
	ldr r3, _080BA414 @ =gUnk_08DB8A92
	movs r0, #0xe9
	lsls r0, r0, #7
	str r0, [sp]
	movs r0, #2
	movs r1, #0x80
	movs r2, #0x58
	bl PutSpriteExt
	movs r7, #0
	ldr r0, [sp, #4]
	adds r0, #0x4c
	mov sl, r0
	ldr r1, _080BA418 @ =gSinLut
	mov sb, r1
	mov r8, sl
_080BA28E:
	mov r2, r8
	ldrh r2, [r2]
	cmp r2, #0x10
	bls _080BA33C
	ldr r4, _080BA41C @ =gCosLut
	movs r1, #0
	ldrsh r0, [r4, r1]
	lsls r0, r0, #4
	mov r2, r8
	ldrh r1, [r2]
	bl Div
	adds r6, r0, #0
	lsls r6, r6, #0x10
	asrs r6, r6, #0x10
	mov r4, sb
	movs r1, #0
	ldrsh r0, [r4, r1]
	rsbs r0, r0, #0
	lsls r0, r0, #4
	movs r1, #0x80
	lsls r1, r1, #1
	bl Div
	adds r5, r0, #0
	lsls r5, r5, #0x10
	asrs r5, r5, #0x10
	movs r2, #0
	ldrsh r0, [r4, r2]
	lsls r0, r0, #4
	mov r4, r8
	ldrh r1, [r4]
	bl Div
	adds r4, r0, #0
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	ldr r1, _080BA41C @ =gCosLut
	movs r2, #0
	ldrsh r0, [r1, r2]
	lsls r0, r0, #4
	movs r1, #0x80
	lsls r1, r1, #1
	bl Div
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	str r0, [sp]
	adds r0, r7, #0
	adds r1, r6, #0
	adds r2, r5, #0
	adds r3, r4, #0
	bl SetObjAffine
	movs r0, #1
	ands r0, r7
	lsls r1, r0, #3
	subs r1, r1, r0
	lsls r1, r1, #4
	lsls r0, r7, #9
	adds r0, #0x50
	adds r1, r1, r0
	asrs r2, r7, #1
	lsls r2, r2, #5
	movs r4, #0x98
	lsls r4, r4, #1
	adds r2, r2, r4
	ldr r3, _080BA420 @ =gUnk_08DB8B10
	ldr r0, [sp, #4]
	adds r0, #0x40
	adds r0, r0, r7
	ldrb r0, [r0]
	lsls r0, r0, #2
	adds r0, r0, r3
	ldr r3, [r0]
	adds r0, r7, #0
	adds r0, #0xa
	movs r4, #0xf
	ands r0, r4
	lsls r0, r0, #0xc
	movs r4, #0x90
	lsls r4, r4, #3
	adds r0, r0, r4
	str r0, [sp]
	movs r0, #2
	bl PutSpriteExt
_080BA33C:
	movs r0, #2
	add r8, r0
	adds r7, #1
	cmp r7, #2
	ble _080BA28E
	lsls r0, r7, #1
	add sl, r0
	mov r1, sl
	ldrh r1, [r1]
	cmp r1, #0x10
	bhi _080BA354
	b _080BA5FE
_080BA354:
	ldr r4, _080BA418 @ =gSinLut
	movs r2, #0x80
	adds r2, r2, r4
	mov sb, r2
	movs r1, #0
	ldrsh r0, [r2, r1]
	lsls r0, r0, #4
	mov r2, sl
	ldrh r1, [r2]
	bl Div
	adds r6, r0, #0
	lsls r6, r6, #0x10
	asrs r6, r6, #0x10
	movs r1, #0
	ldrsh r0, [r4, r1]
	rsbs r0, r0, #0
	lsls r0, r0, #4
	movs r2, #0x80
	lsls r2, r2, #1
	mov r8, r2
	mov r1, r8
	bl Div
	adds r5, r0, #0
	lsls r5, r5, #0x10
	asrs r5, r5, #0x10
	movs r1, #0
	ldrsh r0, [r4, r1]
	lsls r0, r0, #4
	mov r2, sl
	ldrh r1, [r2]
	bl Div
	adds r4, r0, #0
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	mov r1, sb
	movs r2, #0
	ldrsh r0, [r1, r2]
	lsls r0, r0, #4
	mov r1, r8
	bl Div
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	str r0, [sp]
	adds r0, r7, #0
	adds r1, r6, #0
	adds r2, r5, #0
	adds r3, r4, #0
	bl SetObjAffine
	movs r0, #1
	ands r0, r7
	lsls r1, r0, #3
	subs r1, r1, r0
	lsls r1, r1, #4
	lsls r0, r7, #9
	adds r0, #0x50
	adds r1, r1, r0
	asrs r2, r7, #1
	lsls r2, r2, #5
	movs r4, #0x98
	lsls r4, r4, #1
	adds r2, r2, r4
	ldr r3, _080BA424 @ =gUnk_08DB8B28
	ldr r0, [sp, #4]
	adds r0, #0x40
	adds r0, r0, r7
	ldrb r0, [r0]
	lsls r0, r0, #2
	adds r0, r0, r3
	ldr r3, [r0]
	ldr r0, _080BA428 @ =0x0000F480
	str r0, [sp]
	movs r0, #2
	bl PutSpriteExt
	b _080BA5FE
	.align 2, 0
_080BA3F4: .4byte gUnk_08DB8A2C
_080BA3F8: .4byte 0x00009480
_080BA3FC: .4byte gUnk_08DB8AA0
_080BA400: .4byte gPlaySt
_080BA404: .4byte gUnk_08DB8A4C
_080BA408: .4byte 0x00008480
_080BA40C: .4byte gUnk_08DB8A5A
_080BA410: .4byte gUnk_08DB8A76
_080BA414: .4byte gUnk_08DB8A92
_080BA418: .4byte gSinLut
_080BA41C: .4byte gCosLut
_080BA420: .4byte gUnk_08DB8B10
_080BA424: .4byte gUnk_08DB8B28
_080BA428: .4byte 0x0000F480
_080BA42C:
	ldr r3, _080BA610 @ =gUnk_08DB8A4C
	ldr r4, _080BA614 @ =0x00008480
	str r4, [sp]
	movs r0, #2
	movs r1, #0x10
	movs r2, #0x30
	bl PutSpriteExt
	ldr r3, _080BA618 @ =gUnk_08DB8A5A
	str r4, [sp]
	movs r0, #2
	movs r1, #0x80
	movs r2, #0x30
	bl PutSpriteExt
	ldr r3, _080BA61C @ =gUnk_08DB8A84
	str r4, [sp]
	movs r0, #2
	movs r1, #0x10
	movs r2, #0x48
	bl PutSpriteExt
	ldr r3, _080BA620 @ =gUnk_08DB8A68
	str r4, [sp]
	movs r0, #2
	movs r1, #0x80
	movs r2, #0x48
	bl PutSpriteExt
	ldr r3, _080BA624 @ =gUnk_08DB8A76
	str r4, [sp]
	movs r0, #2
	movs r1, #0x10
	movs r2, #0x60
	bl PutSpriteExt
	ldr r3, _080BA628 @ =gUnk_08DB8A92
	movs r0, #0xe9
	lsls r0, r0, #7
	str r0, [sp]
	movs r0, #2
	movs r1, #0x80
	movs r2, #0x60
	bl PutSpriteExt
	movs r7, #0
	ldr r0, [sp, #4]
	adds r0, #0x4c
	mov sl, r0
	ldr r1, _080BA62C @ =gSinLut
	mov sb, r1
	mov r8, sl
_080BA494:
	mov r2, r8
	ldrh r2, [r2]
	cmp r2, #0x10
	bls _080BA546
	ldr r4, _080BA630 @ =gCosLut
	movs r1, #0
	ldrsh r0, [r4, r1]
	lsls r0, r0, #4
	mov r2, r8
	ldrh r1, [r2]
	bl Div
	adds r6, r0, #0
	lsls r6, r6, #0x10
	asrs r6, r6, #0x10
	mov r4, sb
	movs r1, #0
	ldrsh r0, [r4, r1]
	rsbs r0, r0, #0
	lsls r0, r0, #4
	movs r1, #0x80
	lsls r1, r1, #1
	bl Div
	adds r5, r0, #0
	lsls r5, r5, #0x10
	asrs r5, r5, #0x10
	movs r2, #0
	ldrsh r0, [r4, r2]
	lsls r0, r0, #4
	mov r4, r8
	ldrh r1, [r4]
	bl Div
	adds r4, r0, #0
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	ldr r1, _080BA630 @ =gCosLut
	movs r2, #0
	ldrsh r0, [r1, r2]
	lsls r0, r0, #4
	movs r1, #0x80
	lsls r1, r1, #1
	bl Div
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	str r0, [sp]
	adds r0, r7, #0
	adds r1, r6, #0
	adds r2, r5, #0
	adds r3, r4, #0
	bl SetObjAffine
	movs r0, #1
	ands r0, r7
	lsls r1, r0, #3
	subs r1, r1, r0
	lsls r1, r1, #4
	lsls r0, r7, #9
	adds r0, #0x50
	adds r1, r1, r0
	asrs r0, r7, #1
	lsls r2, r0, #1
	adds r2, r2, r0
	lsls r2, r2, #3
	movs r4, #0x94
	lsls r4, r4, #1
	adds r2, r2, r4
	ldr r3, _080BA634 @ =gUnk_08DB8B10
	ldr r0, [sp, #4]
	adds r0, #0x40
	adds r0, r0, r7
	ldrb r0, [r0]
	lsls r0, r0, #2
	adds r0, r0, r3
	ldr r3, [r0]
	adds r0, r7, #0
	adds r0, #0xa
	movs r4, #0xf
	ands r0, r4
	lsls r0, r0, #0xc
	movs r4, #0x90
	lsls r4, r4, #3
	adds r0, r0, r4
	str r0, [sp]
	movs r0, #2
	bl PutSpriteExt
_080BA546:
	movs r0, #2
	add r8, r0
	adds r7, #1
	cmp r7, #4
	ble _080BA494
	lsls r0, r7, #1
	add sl, r0
	mov r1, sl
	ldrh r1, [r1]
	cmp r1, #0x10
	bls _080BA5FE
	ldr r4, _080BA62C @ =gSinLut
	movs r2, #0x80
	adds r2, r2, r4
	mov sb, r2
	movs r1, #0
	ldrsh r0, [r2, r1]
	lsls r0, r0, #4
	mov r2, sl
	ldrh r1, [r2]
	bl Div
	adds r6, r0, #0
	lsls r6, r6, #0x10
	asrs r6, r6, #0x10
	movs r1, #0
	ldrsh r0, [r4, r1]
	rsbs r0, r0, #0
	lsls r0, r0, #4
	movs r2, #0x80
	lsls r2, r2, #1
	mov r8, r2
	mov r1, r8
	bl Div
	adds r5, r0, #0
	lsls r5, r5, #0x10
	asrs r5, r5, #0x10
	movs r1, #0
	ldrsh r0, [r4, r1]
	lsls r0, r0, #4
	mov r2, sl
	ldrh r1, [r2]
	bl Div
	adds r4, r0, #0
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	mov r1, sb
	movs r2, #0
	ldrsh r0, [r1, r2]
	lsls r0, r0, #4
	mov r1, r8
	bl Div
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	str r0, [sp]
	adds r0, r7, #0
	adds r1, r6, #0
	adds r2, r5, #0
	adds r3, r4, #0
	bl SetObjAffine
	movs r0, #1
	ands r0, r7
	lsls r1, r0, #3
	subs r1, r1, r0
	lsls r1, r1, #4
	lsls r0, r7, #9
	adds r0, #0x50
	adds r1, r1, r0
	asrs r0, r7, #1
	lsls r2, r0, #1
	adds r2, r2, r0
	lsls r2, r2, #3
	movs r4, #0x94
	lsls r4, r4, #1
	adds r2, r2, r4
	ldr r3, _080BA638 @ =gUnk_08DB8B28
	ldr r0, [sp, #4]
	adds r0, #0x40
	adds r0, r0, r7
	ldrb r0, [r0]
	lsls r0, r0, #2
	adds r0, r0, r3
	ldr r3, [r0]
	ldr r0, _080BA63C @ =0x0000F480
	str r0, [sp]
	movs r0, #2
	bl PutSpriteExt
_080BA5FE:
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080BA610: .4byte gUnk_08DB8A4C
_080BA614: .4byte 0x00008480
_080BA618: .4byte gUnk_08DB8A5A
_080BA61C: .4byte gUnk_08DB8A84
_080BA620: .4byte gUnk_08DB8A68
_080BA624: .4byte gUnk_08DB8A76
_080BA628: .4byte gUnk_08DB8A92
_080BA62C: .4byte gSinLut
_080BA630: .4byte gCosLut
_080BA634: .4byte gUnk_08DB8B10
_080BA638: .4byte gUnk_08DB8B28
_080BA63C: .4byte 0x0000F480

	thumb_func_start sub_80BA640
sub_80BA640: @ 0x080BA640
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x10
	adds r5, r0, #0
	movs r0, #0
	str r0, [r5, #0x30]
	str r0, [r5, #0x2c]
	bl UnpackUiWindowFrameGraphics
	ldr r0, _080BA71C @ =gBg1Tm
	ldr r1, _080BA720 @ =gUnk_0861A914
	movs r2, #0x80
	lsls r2, r2, #5
	bl TmApplyTsa_thm
	ldr r0, _080BA724 @ =gUnk_08618CE0
	movs r1, #0xc0
	lsls r1, r1, #2
	movs r2, #0x40
	bl ApplyPaletteExt
	ldr r0, _080BA728 @ =gUnk_08618D20
	ldr r1, _080BA72C @ =0x06011000
	bl Decompress
	movs r4, #0
	movs r0, #0xa
	add r0, sp
	mov sb, r0
	add r1, sp, #0xc
	mov sl, r1
_080BA684:
	adds r1, r4, #0
	adds r1, #0x1a
	lsls r1, r1, #5
	ldr r0, _080BA730 @ =gUnk_0861A360
	movs r2, #0x20
	bl ApplyPaletteExt
	adds r0, r4, #1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	cmp r4, #4
	bls _080BA684
	ldr r0, _080BA734 @ =gUnk_0861A3E0
	movs r1, #0xf8
	lsls r1, r1, #2
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r0, _080BA738 @ =gUnk_0861A380
	movs r1, #0xb0
	lsls r1, r1, #2
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r0, _080BA73C @ =gUnk_0861A3A0
	movs r1, #0xb8
	lsls r1, r1, #2
	movs r2, #0x20
	bl ApplyPaletteExt
	movs r0, #0xf
	bl EnableBgSync
	ldr r4, _080BA740 @ =gPlaySt
	movs r0, #0x80
	ldrb r6, [r4, #0x14]
	ands r0, r6
	cmp r0, #0
	beq _080BA744
	bl GetGameTime
	ldr r1, [r4, #4]
	subs r0, r0, r1
	add r1, sp, #8
	mov r2, sb
	mov r3, sl
	bl FormatTime
	bl sub_80B74C0
	adds r6, r5, #0
	adds r6, #0x3a
	strb r0, [r6]
	bl sub_80B7540
	adds r4, r5, #0
	adds r4, #0x3b
	strb r0, [r4]
	bl sub_80B776C
	adds r2, r5, #0
	adds r2, #0x3c
	strb r0, [r2]
	ldrb r0, [r6]
	ldrb r1, [r4]
	ldrb r2, [r2]
	bl sub_80B7448
	adds r1, r5, #0
	adds r1, #0x3d
	strb r0, [r1]
	movs r0, #0x29
	movs r1, #0
	bl sub_800376C
	b _080BA7AA
	.align 2, 0
_080BA71C: .4byte gBg1Tm
_080BA720: .4byte gUnk_0861A914
_080BA724: .4byte gUnk_08618CE0
_080BA728: .4byte gUnk_08618D20
_080BA72C: .4byte 0x06011000
_080BA730: .4byte gUnk_0861A360
_080BA734: .4byte gUnk_0861A3E0
_080BA738: .4byte gUnk_0861A380
_080BA73C: .4byte gUnk_0861A3A0
_080BA740: .4byte gPlaySt
_080BA744:
	bl sub_80A05FC
	add r1, sp, #8
	mov r2, sb
	mov r3, sl
	bl FormatTime
	bl sub_80B7100
	movs r7, #0x3a
	adds r7, r7, r5
	mov r8, r7
	strb r0, [r7]
	bl sub_80B71F8
	adds r7, r5, #0
	adds r7, #0x3b
	strb r0, [r7]
	bl sub_80B735C
	adds r4, r5, #0
	adds r4, #0x3c
	strb r0, [r4]
	bl sub_80B7230
	adds r6, r5, #0
	adds r6, #0x3d
	strb r0, [r6]
	bl sub_80B7328
	movs r1, #0x3e
	adds r1, r1, r5
	mov ip, r1
	strb r0, [r1]
	mov r1, r8
	ldrb r0, [r1]
	ldrb r1, [r7]
	ldrb r2, [r4]
	ldrb r3, [r6]
	mov r6, ip
	ldrb r4, [r6]
	str r4, [sp]
	bl sub_80B73FC
	adds r1, r5, #0
	adds r1, #0x3f
	strb r0, [r1]
	movs r0, #0x29
	movs r1, #0
	bl sub_800376C
_080BA7AA:
	ldr r4, _080BA850 @ =gBg0Tm + 0x440
	adds r0, r4, #0
	adds r0, #0xa
	add r1, sp, #8
	ldrh r2, [r1]
	movs r1, #2
	bl sub_8006068
	adds r0, r4, #0
	adds r0, #0xc
	movs r1, #2
	movs r2, #0x20
	bl sub_8005FEC
	adds r0, r4, #0
	adds r0, #0x10
	mov r7, sb
	ldrh r2, [r7]
	movs r1, #2
	bl sub_800625C
	adds r0, r4, #0
	adds r0, #0x12
	movs r1, #2
	movs r2, #0x20
	bl sub_8005FEC
	adds r0, r4, #0
	adds r0, #0x16
	mov r1, sl
	ldrh r2, [r1]
	movs r1, #2
	bl sub_800625C
	movs r4, #0
	adds r3, r5, #0
	adds r3, #0x4c
	movs r6, #0
	mov r8, r6
	movs r7, #0
	mov sb, r7
	adds r2, r5, #0
	adds r2, #0x46
	movs r6, #1
	adds r1, r5, #0
	adds r1, #0x40
_080BA806:
	lsls r0, r4, #1
	adds r0, r3, r0
	mov r7, sb
	strh r7, [r0]
	adds r0, r2, r4
	strb r6, [r0]
	adds r0, r1, r4
	mov r7, r8
	strb r7, [r0]
	adds r0, r4, #1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	cmp r4, #5
	bls _080BA806
	ldr r0, _080BA854 @ =sub_80BA204
	adds r1, r5, #0
	bl StartParallelWorker
	ldr r0, _080BA858 @ =gUnk_0861A3A0
	adds r1, r0, #0
	adds r1, #0x20
	movs r2, #1
	str r2, [sp]
	str r5, [sp, #4]
	movs r2, #2
	movs r3, #0x17
	bl StartMixPalette
	add sp, #0x10
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080BA850: .4byte gBg0Tm + 0x440
_080BA854: .4byte sub_80BA204
_080BA858: .4byte gUnk_0861A3A0

	thumb_func_start sub_80BA85C
sub_80BA85C: @ 0x080BA85C
	push {r4, r5, lr}
	adds r1, r0, #0
	ldr r0, _080BA8CC @ =gDispIo
	mov ip, r0
	mov r3, ip
	adds r3, #0x3c
	movs r0, #0x3f
	ldrb r2, [r3]
	ands r0, r2
	movs r2, #0x40
	orrs r0, r2
	strb r0, [r3]
	mov r2, ip
	adds r2, #0x44
	movs r3, #0
	movs r5, #8
	movs r0, #8
	strb r0, [r2]
	adds r2, #1
	movs r4, #0x10
	movs r0, #0x10
	strb r0, [r2]
	mov r0, ip
	adds r0, #0x46
	strb r3, [r0]
	ldr r0, _080BA8D0 @ =0x0000FFE0
	mov r3, ip
	ldrh r3, [r3, #0x3c]
	ands r0, r3
	movs r2, #4
	orrs r0, r2
	ldr r2, _080BA8D4 @ =0x0000E0FF
	ands r0, r2
	movs r3, #0xf8
	lsls r3, r3, #5
	adds r2, r3, #0
	orrs r0, r2
	mov r2, ip
	strh r0, [r2, #0x3c]
	movs r0, #1
	ldrb r3, [r2, #1]
	orrs r0, r3
	movs r2, #2
	orrs r0, r2
	movs r2, #4
	orrs r0, r2
	orrs r0, r5
	orrs r0, r4
	mov r2, ip
	strb r0, [r2, #1]
	ldr r0, _080BA8D8 @ =gUnk_08DB8B40
	bl Proc_Start
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080BA8CC: .4byte gDispIo
_080BA8D0: .4byte 0x0000FFE0
_080BA8D4: .4byte 0x0000E0FF
_080BA8D8: .4byte gUnk_08DB8B40

	thumb_func_start sub_80BA8DC
sub_80BA8DC: @ 0x080BA8DC
	push {r4, lr}
	sub sp, #0x14
	adds r4, r0, #0
	ldr r0, [r4, #0x58]
	adds r0, #0x10
	bl ArchivePalette
	movs r2, #0x80
	lsls r2, r2, #1
	movs r3, #0x80
	lsls r3, r3, #2
	str r3, [sp]
	str r3, [sp, #4]
	ldr r1, [r4, #0x58]
	adds r1, #0x10
	movs r0, #1
	lsls r0, r1
	str r0, [sp, #8]
	movs r0, #0x10
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

	thumb_func_start sub_80BA918
sub_80BA918: @ 0x080BA918
	push {r4, lr}
	sub sp, #0x14
	movs r2, #0x80
	lsls r2, r2, #2
	movs r3, #0x80
	lsls r3, r3, #1
	str r3, [sp]
	str r3, [sp, #4]
	ldr r4, [r0, #0x58]
	adds r4, #0x10
	movs r1, #1
	lsls r1, r4
	str r1, [sp, #8]
	movs r1, #0x10
	str r1, [sp, #0xc]
	str r0, [sp, #0x10]
	adds r0, r2, #0
	adds r1, r2, #0
	bl sub_8013EF8
	add sp, #0x14
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_80BA948
sub_80BA948: @ 0x080BA948
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _080BA95C @ =gUnk_08DB8B64
	bl Proc_Start
	str r4, [r0, #0x58]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080BA95C: .4byte gUnk_08DB8B64

	thumb_func_start sub_80BA960
sub_80BA960: @ 0x080BA960
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r3, [r4, #0x30]
	adds r2, r3, #0
	adds r2, #0x20
	str r2, [r4, #0x30]
	ldr r0, [r4, #0x2c]
	lsls r0, r0, #1
	adds r1, r4, #0
	adds r1, #0x4c
	adds r5, r1, r0
	adds r0, r2, #0
	cmp r2, #0
	bge _080BA980
	ldr r1, _080BA9A4 @ =0x0000021F
	adds r0, r3, r1
_080BA980:
	asrs r0, r0, #9
	lsls r0, r0, #9
	subs r0, r2, r0
	cmp r0, #0xff
	ble _080BA9AC
	adds r0, r2, #0
	cmp r2, #0
	bge _080BA994
	ldr r1, _080BA9A8 @ =0x0000011F
	adds r0, r3, r1
_080BA994:
	asrs r0, r0, #8
	lsls r0, r0, #8
	subs r0, r2, r0
	movs r2, #0x80
	lsls r2, r2, #1
	adds r1, r2, #0
	subs r1, r1, r0
	b _080BA9BC
	.align 2, 0
_080BA9A4: .4byte 0x0000021F
_080BA9A8: .4byte 0x0000011F
_080BA9AC:
	adds r0, r2, #0
	cmp r2, #0
	bge _080BA9B6
	ldr r1, _080BAA18 @ =0x0000011F
	adds r0, r3, r1
_080BA9B6:
	asrs r0, r0, #8
	lsls r0, r0, #8
	subs r1, r2, r0
_080BA9BC:
	strh r1, [r5]
	ldr r1, [r4, #0x2c]
	lsls r0, r1, #1
	adds r5, r4, #0
	adds r5, #0x4c
	adds r0, r5, r0
	ldrh r0, [r0]
	adds r2, r4, #0
	adds r2, #0x40
	cmp r0, #0
	bne _080BA9DA
	adds r1, r2, r1
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
_080BA9DA:
	ldr r3, [r4, #0x2c]
	adds r1, r2, r3
	adds r0, r4, #0
	adds r0, #0x3a
	adds r0, r0, r3
	ldrb r1, [r1]
	ldrb r0, [r0]
	cmp r1, r0
	bne _080BAA48
	lsls r0, r3, #1
	adds r0, r5, r0
	movs r1, #0x80
	lsls r1, r1, #1
	ldrh r0, [r0]
	cmp r0, r1
	bne _080BAA48
	movs r0, #0
	str r0, [r4, #0x30]
	ldr r1, _080BAA1C @ =gPlaySt
	movs r0, #0x80
	ldrb r1, [r1, #0x14]
	ands r0, r1
	cmp r0, #0
	beq _080BAA20
	cmp r3, #3
	bne _080BAA20
	movs r0, #0xf
	adds r1, r4, #0
	bl sub_80BA948
	b _080BAA2A
	.align 2, 0
_080BAA18: .4byte 0x0000011F
_080BAA1C: .4byte gPlaySt
_080BAA20:
	ldr r0, [r4, #0x2c]
	adds r0, #0xa
	adds r1, r4, #0
	bl sub_80BA948
_080BAA2A:
	ldr r0, [r4, #0x2c]
	adds r0, #1
	str r0, [r4, #0x2c]
	ldr r0, _080BAA50 @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080BAA42
	movs r0, #0x85
	bl m4aSongNumStart
_080BAA42:
	adds r0, r4, #0
	bl Proc_Break
_080BAA48:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080BAA50: .4byte gPlaySt

	thumb_func_start sub_80BAA54
sub_80BAA54: @ 0x080BAA54
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _080BAA7C @ =gpKeySt
	ldr r1, [r0]
	movs r0, #0xb
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _080BAA74
	movs r0, #1
	rsbs r0, r0, #0
	bl FadeBgmOut
	adds r0, r4, #0
	bl Proc_Break
_080BAA74:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080BAA7C: .4byte gpKeySt

	thumb_func_start sub_80BAA80
sub_80BAA80: @ 0x080BAA80
	push {lr}
	movs r0, #3
	bl FadeBgmOut
	pop {r0}
	bx r0

	thumb_func_start sub_80BAA8C
sub_80BAA8C: @ 0x080BAA8C
	push {lr}
	adds r2, r0, #0
	ldr r1, _080BAAA8 @ =gPlaySt
	movs r0, #0x80
	ldrb r1, [r1, #0x14]
	ands r0, r1
	cmp r0, #0
	beq _080BAAAC
	adds r0, r2, #0
	movs r1, #1
	bl Proc_Goto
	b _080BAAB4
	.align 2, 0
_080BAAA8: .4byte gPlaySt
_080BAAAC:
	adds r0, r2, #0
	movs r1, #0
	bl Proc_Goto
_080BAAB4:
	pop {r0}
	bx r0

	thumb_func_start sub_80BAAB8
sub_80BAAB8: @ 0x080BAAB8
	push {lr}
	adds r1, r0, #0
	ldr r0, _080BAAC8 @ =gUnk_08DB8B94
	bl Proc_StartBlocking
	pop {r0}
	bx r0
	.align 2, 0
_080BAAC8: .4byte gUnk_08DB8B94

	thumb_func_start sub_80BAACC
sub_80BAACC: @ 0x080BAACC
	push {lr}
	adds r1, r0, #0
	ldr r0, _080BAADC @ =gUnk_08DB8CBC
	bl Proc_StartBlocking
	pop {r0}
	bx r0
	.align 2, 0
_080BAADC: .4byte gUnk_08DB8CBC

	thumb_func_start sub_80BAAE0
sub_80BAAE0: @ 0x080BAAE0
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	movs r1, #0
	str r1, [r5, #0x2c]
	movs r0, #0x18
	str r0, [r5, #0x3c]
	movs r4, #0
	strh r1, [r5, #0x38]
	ldr r0, _080BABF8 @ =gUnk_08DB8D1C
	str r0, [r5, #0x30]
	adds r0, r5, #0
	adds r0, #0x34
	strb r4, [r0]
	adds r0, #1
	strb r4, [r0]
	adds r0, #1
	strb r4, [r0]
	movs r0, #0
	bl SetOnHBlankA
	movs r0, #0
	bl InitBgs
	bl ResetText
	ldr r2, _080BABFC @ =gDispIo
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
	adds r1, r2, #0
	adds r1, #0x3c
	movs r0, #0x3f
	ldrb r3, [r1]
	ands r0, r3
	strb r0, [r1]
	adds r1, #8
	movs r0, #0x10
	strb r0, [r1]
	adds r0, r2, #0
	adds r0, #0x45
	strb r4, [r0]
	adds r0, #1
	strb r4, [r0]
	ldr r0, _080BAC00 @ =gUnk_0861AB70
	movs r1, #0xa0
	lsls r1, r1, #1
	movs r2, #0x20
	bl ApplyPaletteExt
	movs r4, #0
	ldr r6, _080BAC04 @ =0x06008000
_080BAB5C:
	ldr r0, [r5, #0x30]
	lsls r1, r4, #2
	adds r0, r0, r1
	ldr r0, [r0]
	cmp r0, #0
	beq _080BAB7A
	adds r2, r5, #0
	adds r2, #0x36
	ldrb r3, [r2]
	lsls r1, r3, #1
	adds r1, r1, r3
	lsls r1, r1, #0xc
	adds r1, r1, r6
	bl Decompress
_080BAB7A:
	movs r0, #0x80
	lsls r0, r0, #4
	adds r6, r6, r0
	adds r4, #1
	cmp r4, #5
	ble _080BAB5C
	adds r1, r5, #0
	adds r1, #0x34
	movs r4, #0
	movs r0, #8
	strb r0, [r1]
	movs r0, #3
	movs r1, #0
	movs r2, #0x60
	bl SetBgOffset
	movs r0, #0x2a
	movs r1, #0
	bl sub_800376C
	ldr r3, _080BABFC @ =gDispIo
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
	movs r0, #0x10
	strb r0, [r1]
	adds r0, r3, #0
	adds r0, #0x45
	strb r4, [r0]
	adds r0, #1
	strb r4, [r0]
	ldr r0, _080BAC08 @ =0x0000FFE0
	ldrh r1, [r3, #0x3c]
	ands r0, r1
	movs r1, #8
	orrs r0, r1
	ldr r1, _080BAC0C @ =0x0000E0FF
	ands r0, r1
	strh r0, [r3, #0x3c]
	movs r0, #0x20
	ldrb r1, [r2]
	orrs r1, r0
	strb r1, [r2]
	adds r1, r3, #0
	adds r1, #0x3d
	ldrb r2, [r1]
	orrs r0, r2
	strb r0, [r1]
	bl sub_80BAE6C
	ldr r0, _080BAC10 @ =sub_80BAEA8
	bl SetOnHBlankA
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080BABF8: .4byte gUnk_08DB8D1C
_080BABFC: .4byte gDispIo
_080BAC00: .4byte gUnk_0861AB70
_080BAC04: .4byte 0x06008000
_080BAC08: .4byte 0x0000FFE0
_080BAC0C: .4byte 0x0000E0FF
_080BAC10: .4byte sub_80BAEA8

	thumb_func_start sub_80BAC14
sub_80BAC14: @ 0x080BAC14
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #4
	adds r4, r0, #0
	ldrh r0, [r4, #0x38]
	lsrs r7, r0, #3
	movs r0, #0x1f
	ands r7, r0
	ldr r0, [r4, #0x2c]
	asrs r2, r0, #6
	strh r2, [r4, #0x38]
	lsls r1, r2, #0x10
	ldr r0, _080BAC48 @ =0x061F0000
	cmp r1, r0
	bls _080BAC4C
	movs r0, #3
	movs r1, #0
	movs r2, #0x80
	bl SetBgOffset
	adds r0, r4, #0
	bl Proc_Break
	b _080BAD54
	.align 2, 0
_080BAC48: .4byte 0x061F0000
_080BAC4C:
	subs r2, #0xa0
	movs r0, #0xff
	ands r2, r0
	movs r0, #3
	movs r1, #0
	bl SetBgOffset
	adds r0, r4, #0
	adds r0, #0x34
	mov r8, r0
	ldrb r1, [r0]
	cmp r1, #5
	bhi _080BACAA
	ldr r0, [r4, #0x30]
	mov r5, r8
	ldrb r2, [r5]
	lsls r1, r2, #2
	adds r0, r0, r1
	ldr r3, [r0]
	adds r1, r4, #0
	adds r1, #0x36
	ldrb r5, [r1]
	lsls r0, r5, #1
	adds r0, r0, r5
	lsls r0, r0, #0xc
	lsls r2, r2, #0xb
	ldr r1, _080BAC94 @ =0x06008000
	adds r2, r2, r1
	adds r1, r0, r2
	cmp r3, #0
	beq _080BAC98
	adds r0, r3, #0
	bl Decompress
	b _080BACA2
	.align 2, 0
_080BAC94: .4byte 0x06008000
_080BAC98:
	str r3, [sp]
	ldr r2, _080BAD40 @ =0x01000200
	mov r0, sp
	bl CpuFastSet
_080BACA2:
	mov r5, r8
	ldrb r0, [r5]
	adds r0, #1
	strb r0, [r5]
_080BACAA:
	movs r0, #7
	mov sb, r0
	mov r1, sb
	ands r1, r7
	mov sb, r1
	cmp r1, #0
	bne _080BAD1E
	ldr r0, [r4, #0x30]
	adds r6, r4, #0
	adds r6, #0x35
	ldrb r2, [r6]
	lsls r1, r2, #2
	adds r0, #0x18
	adds r0, r0, r1
	ldr r3, [r0]
	adds r0, r7, #0
	asrs r0, r0, #3
	cmp r2, r0
	bne _080BAD1E
	cmp r3, #0
	beq _080BAD54
	adds r5, r4, #0
	adds r5, #0x36
	ldrb r0, [r5]
	lsls r2, r0, #1
	adds r2, r2, r0
	lsls r2, r2, #0x17
	movs r1, #0xa0
	lsls r1, r1, #0x18
	adds r2, r2, r1
	lsrs r2, r2, #0x10
	lsls r0, r7, #6
	ldr r1, _080BAD44 @ =gBg3Tm
	adds r0, r0, r1
	adds r1, r3, #0
	bl TmApplyTsa_thm
	movs r0, #8
	bl EnableBgSync
	ldrb r0, [r6]
	adds r0, #1
	strb r0, [r6]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #4
	bne _080BAD1E
	mov r0, sb
	strb r0, [r6]
	mov r1, r8
	strb r0, [r1]
	movs r0, #1
	ldrb r1, [r5]
	subs r0, r0, r1
	strb r0, [r5]
	ldr r0, [r4, #0x30]
	adds r0, #0x28
	str r0, [r4, #0x30]
_080BAD1E:
	ldr r0, _080BAD48 @ =gpKeySt
	ldr r1, [r0]
	movs r0, #8
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _080BAD4C
	bl sub_809F9D0
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080BAD54
	adds r0, r4, #0
	movs r1, #0
	bl Proc_Goto
	b _080BAD54
	.align 2, 0
_080BAD40: .4byte 0x01000200
_080BAD44: .4byte gBg3Tm
_080BAD48: .4byte gpKeySt
_080BAD4C:
	ldr r0, [r4, #0x2c]
	ldr r1, [r4, #0x3c]
	adds r0, r0, r1
	str r0, [r4, #0x2c]
_080BAD54:
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_80BAD64
sub_80BAD64: @ 0x080BAD64
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	ldr r0, _080BAE04 @ =gUnk_08DB8DE4
	str r0, [r5, #0x30]
	adds r1, r5, #0
	adds r1, #0x36
	movs r0, #1
	strb r0, [r1]
	ldr r0, _080BAE08 @ =gUnk_0861AB70
	movs r1, #0xa0
	lsls r1, r1, #1
	movs r2, #0x20
	bl ApplyPaletteExt
	movs r0, #3
	movs r1, #0
	movs r2, #0x80
	bl SetBgOffset
	ldr r0, _080BAE0C @ =gBg3Tm
	movs r1, #0
	bl TmFill
	movs r4, #0
	ldr r6, _080BAE10 @ =0x06008000
_080BAD96:
	ldr r0, [r5, #0x30]
	lsls r1, r4, #2
	adds r0, r0, r1
	ldr r0, [r0]
	cmp r0, #0
	beq _080BADB4
	adds r2, r5, #0
	adds r2, #0x36
	ldrb r3, [r2]
	lsls r1, r3, #1
	adds r1, r1, r3
	lsls r1, r1, #0xc
	adds r1, r1, r6
	bl Decompress
_080BADB4:
	movs r0, #0x80
	lsls r0, r0, #4
	adds r6, r6, r0
	adds r4, #1
	cmp r4, #5
	ble _080BAD96
	movs r4, #1
_080BADC2:
	ldr r0, [r5, #0x30]
	lsls r1, r4, #2
	adds r0, #0x18
	adds r0, r0, r1
	ldr r3, [r0]
	cmp r3, #0
	beq _080BADF0
	adds r0, r5, #0
	adds r0, #0x36
	ldrb r1, [r0]
	lsls r2, r1, #1
	adds r2, r2, r1
	lsls r2, r2, #0x17
	movs r0, #0xa0
	lsls r0, r0, #0x18
	adds r2, r2, r0
	lsrs r2, r2, #0x10
	lsls r0, r4, #9
	ldr r1, _080BAE0C @ =gBg3Tm
	adds r0, r0, r1
	adds r1, r3, #0
	bl TmApplyTsa_thm
_080BADF0:
	adds r4, #1
	cmp r4, #3
	ble _080BADC2
	movs r0, #8
	bl EnableBgSync
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080BAE04: .4byte gUnk_08DB8DE4
_080BAE08: .4byte gUnk_0861AB70
_080BAE0C: .4byte gBg3Tm
_080BAE10: .4byte 0x06008000

	thumb_func_start sub_80BAE14
sub_80BAE14: @ 0x080BAE14
	push {lr}
	movs r0, #0
	bl SetOnHBlankA
	ldr r2, _080BAE50 @ =gDispIo
	adds r1, r2, #0
	adds r1, #0x3c
	movs r0, #0xc0
	ldrb r3, [r1]
	orrs r0, r3
	strb r0, [r1]
	adds r0, r2, #0
	adds r0, #0x44
	movs r1, #0
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r1, r2, #0
	adds r1, #0x46
	movs r0, #0x10
	strb r0, [r1]
	ldr r0, _080BAE54 @ =0x0000FFE0
	ldrh r1, [r2, #0x3c]
	ands r0, r1
	movs r1, #0x1f
	orrs r0, r1
	strh r0, [r2, #0x3c]
	pop {r0}
	bx r0
	.align 2, 0
_080BAE50: .4byte gDispIo
_080BAE54: .4byte 0x0000FFE0

	thumb_func_start sub_80BAE58
sub_80BAE58: @ 0x080BAE58
	push {lr}
	adds r1, r0, #0
	ldr r0, _080BAE68 @ =gUnk_08DB8E34
	bl Proc_StartBlocking
	pop {r0}
	bx r0
	.align 2, 0
_080BAE68: .4byte gUnk_08DB8E34

	thumb_func_start sub_80BAE6C
sub_80BAE6C: @ 0x080BAE6C
	push {r4, r5, r6, lr}
	movs r2, #0
	ldr r3, _080BAEA4 @ =gUnk_08DB8ED4
	adds r6, r3, #0
	movs r5, #0x10
	movs r0, #0x60
	rsbs r0, r0, #0
	adds r4, r0, #0
_080BAE7C:
	ldr r0, [r3]
	adds r0, r0, r2
	strb r5, [r0]
	cmp r2, #0xf
	bgt _080BAE8C
	ldr r0, [r6]
	adds r0, r0, r2
	strb r2, [r0]
_080BAE8C:
	cmp r2, #0x90
	ble _080BAE98
	ldr r0, [r3]
	adds r0, r0, r2
	subs r1, r4, r2
	strb r1, [r0]
_080BAE98:
	adds r2, #1
	cmp r2, #0xa0
	ble _080BAE7C
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080BAEA4: .4byte gUnk_08DB8ED4

	thumb_func_start sub_80BAEA8
sub_80BAEA8: @ 0x080BAEA8
	ldr r0, _080BAEC8 @ =0x04000006
	ldrh r0, [r0]
	adds r0, #1
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	cmp r2, #0xa0
	bls _080BAEB8
	movs r2, #0
_080BAEB8:
	ldr r1, _080BAECC @ =0x04000052
	ldr r0, _080BAED0 @ =gUnk_08DB8ED4
	ldr r0, [r0]
	adds r0, r0, r2
	ldrb r0, [r0]
	strh r0, [r1]
	bx lr
	.align 2, 0
_080BAEC8: .4byte 0x04000006
_080BAECC: .4byte 0x04000052
_080BAED0: .4byte gUnk_08DB8ED4

	thumb_func_start sub_80BAED4
sub_80BAED4: @ 0x080BAED4
	ldr r0, _080BAEF4 @ =0x04000006
	ldrh r0, [r0]
	adds r0, #1
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	cmp r2, #0x9f
	bls _080BAEE4
	movs r2, #0
_080BAEE4:
	ldr r0, _080BAEF8 @ =0x04000012
	movs r1, #1
	ands r1, r2
	lsrs r2, r2, #1
	adds r1, r1, r2
	rsbs r1, r1, #0
	strh r1, [r0]
	bx lr
	.align 2, 0
_080BAEF4: .4byte 0x04000006
_080BAEF8: .4byte 0x04000012

	thumb_func_start sub_80BAEFC
sub_80BAEFC: @ 0x080BAEFC
	push {lr}
	sub sp, #0x14
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r3, #0
	str r3, [sp]
	str r3, [sp, #4]
	mov r1, sp
	strh r3, [r1, #8]
	strh r3, [r1, #0xa]
	movs r2, #0x80
	lsls r2, r2, #1
	strh r2, [r1, #0xc]
	strh r2, [r1, #0xe]
	strh r3, [r1, #0x10]
	ldr r1, _080BAF30 @ =gOpAnimBgAffineDstData + 0x10
	cmp r0, #2
	bne _080BAF22
	subs r1, #0x10
_080BAF22:
	mov r0, sp
	movs r2, #1
	bl BgAffineSet
	add sp, #0x14
	pop {r0}
	bx r0
	.align 2, 0
_080BAF30: .4byte gOpAnimBgAffineDstData + 0x10

	thumb_func_start sub_80BAF34
sub_80BAF34: @ 0x080BAF34
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #8
	adds r7, r0, #0
	lsls r1, r1, #0x18
	movs r4, #0
	cmp r1, #0
	bne _080BAF4A
	movs r4, #0x80
	lsls r4, r4, #1
_080BAF4A:
	ldr r0, _080BAFF0 @ =gUnk_086BC444
	movs r1, #0x80
	lsls r1, r1, #2
	movs r2, #0xa0
	bl ApplyPaletteExt
	ldr r0, _080BAFF4 @ =gUnk_086BC4E4
	ldr r1, _080BAFF8 @ =0x06010000
	bl Decompress
	ldr r6, _080BAFFC @ =gUnk_086BF118
	adds r4, #0x78
	mov r8, r4
	movs r3, #0x80
	lsls r3, r3, #4
	movs r0, #0
	str r0, [sp]
	movs r4, #0xa
	str r4, [sp, #4]
	adds r0, r6, #0
	mov r1, r8
	movs r2, #0x48
	bl StartSpriteAnimProc
	str r0, [r7, #0x30]
	movs r5, #0x80
	lsls r5, r5, #3
	movs r0, #1
	str r0, [sp]
	str r4, [sp, #4]
	adds r0, r6, #0
	mov r1, r8
	movs r2, #0x48
	adds r3, r5, #0
	bl StartSpriteAnimProc
	str r0, [r7, #0x34]
	movs r0, #3
	str r0, [sp]
	str r4, [sp, #4]
	adds r0, r6, #0
	mov r1, r8
	movs r2, #0x30
	adds r3, r5, #0
	bl StartSpriteAnimProc
	str r0, [r7, #0x38]
	movs r0, #4
	str r0, [sp]
	str r4, [sp, #4]
	adds r0, r6, #0
	mov r1, r8
	movs r2, #0x80
	adds r3, r5, #0
	bl StartSpriteAnimProc
	str r0, [r7, #0x3c]
	movs r0, #5
	str r0, [sp]
	str r4, [sp, #4]
	adds r0, r6, #0
	mov r1, r8
	movs r2, #0x68
	adds r3, r5, #0
	bl StartSpriteAnimProc
	str r0, [r7, #0x40]
	movs r0, #6
	str r0, [sp]
	str r4, [sp, #4]
	adds r0, r6, #0
	mov r1, r8
	movs r2, #0x90
	adds r3, r5, #0
	bl StartSpriteAnimProc
	str r0, [r7, #0x44]
	add sp, #8
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080BAFF0: .4byte gUnk_086BC444
_080BAFF4: .4byte gUnk_086BC4E4
_080BAFF8: .4byte 0x06010000
_080BAFFC: .4byte gUnk_086BF118

	thumb_func_start sub_80BB000
sub_80BB000: @ 0x080BB000
	push {lr}
	ldr r0, _080BB064 @ =gUnk_086B73E0
	movs r1, #0xf0
	lsls r1, r1, #1
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r0, _080BB068 @ =gUnk_086B7400
	ldr r1, _080BB06C @ =0x06008000
	bl Decompress
	ldr r0, _080BB070 @ =gBg3Tm
	ldr r1, _080BB074 @ =gUnk_086BB234
	movs r2, #0xf0
	lsls r2, r2, #8
	bl TmApplyTsa_thm
	ldr r0, _080BB078 @ =gUnk_086BB6E8
	movs r1, #0xe0
	lsls r1, r1, #1
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r0, _080BB07C @ =gUnk_086BB708
	ldr r1, _080BB080 @ =0x0600CC00
	bl Decompress
	ldr r0, _080BB084 @ =gBg2Tm + 0x40
	ldr r1, _080BB088 @ =gUnk_086BBF90
	ldr r2, _080BB08C @ =0x0000E260
	bl TmApplyTsa_thm
	ldr r0, _080BB090 @ =gUnk_086B6E70
	movs r1, #0xd0
	lsls r1, r1, #1
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r0, _080BB094 @ =gUnk_086B6E90
	ldr r1, _080BB098 @ =0x0600DE00
	bl Decompress
	ldr r0, _080BB09C @ =gBg1Tm
	ldr r1, _080BB0A0 @ =gUnk_086B7184
	ldr r2, _080BB0A4 @ =0x0000D2F0
	bl TmApplyTsa_thm
	pop {r0}
	bx r0
	.align 2, 0
_080BB064: .4byte gUnk_086B73E0
_080BB068: .4byte gUnk_086B7400
_080BB06C: .4byte 0x06008000
_080BB070: .4byte gBg3Tm
_080BB074: .4byte gUnk_086BB234
_080BB078: .4byte gUnk_086BB6E8
_080BB07C: .4byte gUnk_086BB708
_080BB080: .4byte 0x0600CC00
_080BB084: .4byte gBg2Tm + 0x40
_080BB088: .4byte gUnk_086BBF90
_080BB08C: .4byte 0x0000E260
_080BB090: .4byte gUnk_086B6E70
_080BB094: .4byte gUnk_086B6E90
_080BB098: .4byte 0x0600DE00
_080BB09C: .4byte gBg1Tm
_080BB0A0: .4byte gUnk_086B7184
_080BB0A4: .4byte 0x0000D2F0

	thumb_func_start Title_Init
Title_Init: @ 0x080BB0A8
	push {r4, r5, r6, r7, lr}
	sub sp, #0x18
	adds r6, r0, #0
	ldr r1, _080BB1CC @ =gUnk_086C44D4
	mov r0, sp
	movs r2, #0x18
	bl memcpy
	adds r0, r6, #0
	adds r0, #0x50
	movs r7, #0
	strb r7, [r0]
	ldr r5, _080BB1D0 @ =gDispIo
	movs r4, #0x21
	rsbs r4, r4, #0
	adds r0, r4, #0
	ldrb r1, [r5, #1]
	ands r0, r1
	movs r1, #0x41
	rsbs r1, r1, #0
	ands r0, r1
	movs r1, #0x7f
	ands r0, r1
	strb r0, [r5, #1]
	mov r0, sp
	bl InitBgs
	movs r0, #8
	rsbs r0, r0, #0
	ldrb r2, [r5]
	ands r0, r2
	strb r0, [r5]
	movs r0, #2
	rsbs r0, r0, #0
	ldrb r3, [r5, #1]
	ands r0, r3
	movs r1, #3
	rsbs r1, r1, #0
	ands r0, r1
	subs r1, #2
	ands r0, r1
	subs r1, #4
	ands r0, r1
	subs r1, #8
	ands r0, r1
	strb r0, [r5, #1]
	movs r3, #3
	ldrb r0, [r5, #0xc]
	orrs r0, r3
	strb r0, [r5, #0xc]
	adds r1, #0xd
	adds r0, r1, #0
	ldrb r2, [r5, #0x10]
	ands r0, r2
	movs r2, #1
	orrs r0, r2
	strb r0, [r5, #0x10]
	ldrb r0, [r5, #0x14]
	ands r1, r0
	movs r0, #2
	orrs r1, r0
	strb r1, [r5, #0x14]
	ldrb r1, [r5, #0x18]
	orrs r3, r1
	strb r3, [r5, #0x18]
	movs r0, #0
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	ldr r1, _080BB1D4 @ =0x0000FFF8
	ldr r2, _080BB1D8 @ =0x0000FFD0
	movs r0, #1
	bl SetBgOffset
	movs r0, #2
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	movs r0, #3
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	ldr r0, _080BB1DC @ =gBg0Tm
	movs r1, #0
	bl TmFill
	ldr r0, _080BB1E0 @ =gBg1Tm
	movs r1, #0
	bl TmFill
	ldr r0, _080BB1E4 @ =gBg2Tm
	movs r1, #0
	bl TmFill
	ldr r0, _080BB1E8 @ =gBg3Tm
	movs r1, #0
	bl TmFill
	movs r0, #2
	bl sub_80BAEFC
	adds r2, r5, #0
	adds r2, #0x3c
	adds r1, r4, #0
	ldrb r3, [r2]
	ands r1, r3
	adds r0, r5, #0
	adds r0, #0x3d
	ldrb r3, [r0]
	ands r4, r3
	strb r4, [r0]
	movs r0, #0x3f
	ands r1, r0
	strb r1, [r2]
	adds r1, r5, #0
	adds r1, #0x44
	movs r0, #0x10
	strb r0, [r1]
	adds r0, r5, #0
	adds r0, #0x45
	strb r7, [r0]
	adds r0, #1
	strb r7, [r0]
	movs r0, #0xf
	bl EnableBgSync
	adds r0, r6, #0
	adds r0, #0x51
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _080BB1C0
	adds r0, r6, #0
	movs r1, #0
	bl Proc_Goto
_080BB1C0:
	str r7, [r6, #0x54]
	add sp, #0x18
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080BB1CC: .4byte gUnk_086C44D4
_080BB1D0: .4byte gDispIo
_080BB1D4: .4byte 0x0000FFF8
_080BB1D8: .4byte 0x0000FFD0
_080BB1DC: .4byte gBg0Tm
_080BB1E0: .4byte gBg1Tm
_080BB1E4: .4byte gBg2Tm
_080BB1E8: .4byte gBg3Tm

	thumb_func_start Title_SetupMainGraphics
Title_SetupMainGraphics: @ 0x080BB1EC
	push {r4, lr}
	adds r4, r0, #0
	movs r1, #1
	bl sub_80BAF34
	adds r0, r4, #0
	bl sub_80BB000
	movs r0, #0xe
	bl EnableBgSync
	adds r0, r4, #0
	bl sub_80BB62C
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_80BB210
sub_80BB210: @ 0x080BB210
	push {r4, r5, lr}
	sub sp, #0x14
	adds r4, r0, #0
	ldr r0, _080BB28C @ =sub_80BAED4
	bl SetOnHBlankA
	adds r0, r4, #0
	movs r1, #0
	bl sub_80BAF34
	adds r0, r4, #0
	bl sub_80BB000
	ldr r0, _080BB290 @ =gUnk_08DB9A84
	movs r5, #0
	str r5, [sp]
	movs r1, #0xa0
	lsls r1, r1, #6
	str r1, [sp, #4]
	movs r1, #0xa
	str r1, [sp, #8]
	str r5, [sp, #0xc]
	str r4, [sp, #0x10]
	movs r1, #0
	movs r2, #0
	movs r3, #0
	bl StartBmBgfx
	ldr r2, _080BB294 @ =gDispIo
	movs r0, #1
	ldrb r1, [r2, #1]
	orrs r0, r1
	movs r1, #3
	rsbs r1, r1, #0
	ands r0, r1
	subs r1, #2
	ands r0, r1
	subs r1, #4
	ands r0, r1
	movs r1, #0x10
	orrs r0, r1
	strb r0, [r2, #1]
	movs r0, #0xe
	bl EnableBgSync
	ldr r0, _080BB298 @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080BB27C
	movs r0, #0x63
	bl m4aSongNumStart
_080BB27C:
	adds r0, r4, #0
	adds r0, #0x50
	strb r5, [r0]
	add sp, #0x14
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080BB28C: .4byte sub_80BAED4
_080BB290: .4byte gUnk_08DB9A84
_080BB294: .4byte gDispIo
_080BB298: .4byte gPlaySt

	thumb_func_start sub_80BB29C
sub_80BB29C: @ 0x080BB29C
	push {r4, r5, r6, r7, lr}
	sub sp, #0x10
	adds r5, r0, #0
	adds r4, r5, #0
	adds r4, #0x50
	ldrb r0, [r4]
	cmp r0, #8
	bne _080BB2C2
	ldr r0, [r5, #0x34]
	movs r1, #0x48
	str r1, [sp]
	movs r1, #0x10
	str r1, [sp, #4]
	str r5, [sp, #8]
	movs r1, #0x78
	movs r2, #0x38
	movs r3, #0x78
	bl sub_80BBA64
_080BB2C2:
	ldrb r0, [r4]
	subs r0, #0x30
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x20
	bhi _080BB380
	ldrb r0, [r4]
	adds r1, r0, #0
	subs r1, #0x30
	lsrs r2, r1, #0x1f
	adds r1, r1, r2
	asrs r6, r1, #1
	cmp r0, #0x30
	bne _080BB346
	ldr r3, _080BB3DC @ =gDispIo
	adds r2, r3, #0
	adds r2, #0x3c
	movs r0, #0x3f
	ldrb r1, [r2]
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r2]
	adds r0, r3, #0
	adds r0, #0x44
	movs r1, #0
	strb r1, [r0]
	movs r7, #0x45
	movs r2, #0x10
	movs r0, #0x10
	strb r0, [r7, r3]
	adds r0, r3, #0
	adds r0, #0x46
	strb r1, [r0]
	ldr r0, _080BB3E0 @ =0x0000FFE0
	ldrh r1, [r3, #0x3c]
	ands r0, r1
	movs r1, #4
	orrs r0, r1
	ldr r1, _080BB3E4 @ =0x0000E0FF
	ands r0, r1
	movs r7, #0xf8
	lsls r7, r7, #5
	adds r1, r7, #0
	orrs r0, r1
	strh r0, [r3, #0x3c]
	movs r0, #1
	ldrb r1, [r3, #1]
	orrs r0, r1
	movs r1, #3
	rsbs r1, r1, #0
	ands r0, r1
	movs r1, #4
	orrs r0, r1
	movs r1, #9
	rsbs r1, r1, #0
	ands r0, r1
	orrs r0, r2
	strb r0, [r3, #1]
	ldr r1, _080BB3E8 @ =gUnk_086BB6E8
	str r5, [sp]
	movs r0, #0
	movs r2, #0xe
	movs r3, #0x20
	bl sub_80BDC2C
_080BB346:
	ldr r3, _080BB3DC @ =gDispIo
	adds r2, r3, #0
	adds r2, #0x3c
	movs r0, #0x3f
	ldrb r7, [r2]
	ands r0, r7
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r2]
	adds r0, r3, #0
	adds r0, #0x44
	movs r1, #0
	strb r6, [r0]
	movs r0, #0x10
	subs r0, r0, r6
	adds r2, #9
	strb r0, [r2]
	adds r0, r3, #0
	adds r0, #0x46
	strb r1, [r0]
	ldrb r2, [r4]
	subs r2, #0x30
	asrs r2, r2, #1
	subs r2, #0x10
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	movs r0, #2
	bl SetBgOffset
_080BB380:
	adds r4, r5, #0
	adds r4, #0x50
	ldrb r0, [r4]
	cmp r0, #0x28
	bne _080BB3A2
	ldr r0, [r5, #0x30]
	movs r1, #0x48
	str r1, [sp]
	movs r1, #0x10
	str r1, [sp, #4]
	movs r1, #0
	str r1, [sp, #8]
	str r5, [sp, #0xc]
	movs r2, #0
	movs r3, #0x78
	bl sub_80BBAA4
_080BB3A2:
	ldrb r1, [r4]
	cmp r1, #0x50
	bne _080BB3BE
	ldr r0, [r5, #0x40]
	movs r1, #0x68
	str r1, [sp]
	movs r1, #0x10
	str r1, [sp, #4]
	str r5, [sp, #8]
	movs r1, #0x78
	movs r2, #0x78
	movs r3, #0x78
	bl sub_80BBA64
_080BB3BE:
	ldrb r0, [r4]
	adds r0, #1
	strb r0, [r4]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x64
	bne _080BB3D2
	adds r0, r5, #0
	bl Proc_Break
_080BB3D2:
	add sp, #0x10
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080BB3DC: .4byte gDispIo
_080BB3E0: .4byte 0x0000FFE0
_080BB3E4: .4byte 0x0000E0FF
_080BB3E8: .4byte gUnk_086BB6E8

	thumb_func_start sub_80BB3EC
sub_80BB3EC: @ 0x080BB3EC
	adds r0, #0x50
	movs r3, #0
	strb r3, [r0]
	ldr r0, _080BB460 @ =gDispIo
	mov ip, r0
	mov r2, ip
	adds r2, #0x3c
	movs r0, #0x3f
	ldrb r1, [r2]
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r2]
	mov r0, ip
	adds r0, #0x44
	strb r3, [r0]
	mov r1, ip
	adds r1, #0x45
	movs r2, #0x10
	movs r0, #0x10
	strb r0, [r1]
	mov r0, ip
	adds r0, #0x46
	strb r3, [r0]
	ldr r0, _080BB464 @ =0x0000FFE0
	mov r3, ip
	ldrh r3, [r3, #0x3c]
	ands r0, r3
	movs r1, #8
	orrs r0, r1
	ldr r1, _080BB468 @ =0x0000E0FF
	ands r0, r1
	movs r3, #0xf8
	lsls r3, r3, #5
	adds r1, r3, #0
	orrs r0, r1
	mov r1, ip
	strh r0, [r1, #0x3c]
	movs r0, #1
	ldrb r3, [r1, #1]
	orrs r0, r3
	movs r1, #3
	rsbs r1, r1, #0
	ands r0, r1
	movs r1, #4
	orrs r0, r1
	movs r1, #8
	orrs r0, r1
	orrs r0, r2
	mov r1, ip
	strb r0, [r1, #1]
	adds r1, #0x3d
	movs r0, #0x20
	ldrb r2, [r1]
	orrs r0, r2
	strb r0, [r1]
	bx lr
	.align 2, 0
_080BB460: .4byte gDispIo
_080BB464: .4byte 0x0000FFE0
_080BB468: .4byte 0x0000E0FF

	thumb_func_start sub_80BB46C
sub_80BB46C: @ 0x080BB46C
	push {r4, r5, lr}
	sub sp, #0xc
	adds r5, r0, #0
	adds r1, r5, #0
	adds r1, #0x50
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x20
	bhi _080BB4F4
	cmp r0, #0x20
	bne _080BB4C8
	ldr r0, [r5, #0x38]
	movs r1, #0x2c
	str r1, [sp]
	movs r4, #0x10
	str r4, [sp, #4]
	str r5, [sp, #8]
	movs r1, #0xa0
	movs r2, #0x2c
	movs r3, #0x78
	bl sub_80BBA64
	ldr r0, [r5, #0x3c]
	movs r1, #0x80
	str r1, [sp]
	str r4, [sp, #4]
	str r5, [sp, #8]
	movs r1, #0x78
	movs r2, #0x80
	movs r3, #0x78
	bl sub_80BBA64
	ldr r0, [r5, #0x44]
	movs r1, #0x90
	str r1, [sp]
	str r4, [sp, #4]
	str r5, [sp, #8]
	movs r1, #0x78
	movs r2, #0x90
	movs r3, #0x78
	bl sub_80BBA64
	b _080BB4F4
_080BB4C8:
	ldrb r1, [r1]
	lsrs r3, r1, #1
	ldr r4, _080BB50C @ =gDispIo
	adds r2, r4, #0
	adds r2, #0x3c
	movs r0, #0x3f
	ldrb r1, [r2]
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r2]
	adds r0, r4, #0
	adds r0, #0x44
	strb r3, [r0]
	movs r0, #0x10
	subs r0, r0, r3
	adds r1, r4, #0
	adds r1, #0x45
	strb r0, [r1]
	adds r1, #1
	movs r0, #0
	strb r0, [r1]
_080BB4F4:
	adds r0, r5, #0
	adds r0, #0x50
	ldrb r0, [r0]
	cmp r0, #0x3c
	bne _080BB504
	adds r0, r5, #0
	bl Proc_Break
_080BB504:
	add sp, #0xc
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080BB50C: .4byte gDispIo

	thumb_func_start sub_80BB510
sub_80BB510: @ 0x080BB510
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0
	bl SetOnHBlankA
	adds r0, r4, #0
	bl sub_80BB62C
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start Title_IDLE
Title_IDLE: @ 0x080BB528
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x54]
	adds r0, #1
	str r0, [r4, #0x54]
	adds r2, r4, #0
	adds r2, #0x50
	ldrb r0, [r2]
	adds r0, #1
	movs r1, #0xff
	ands r0, r1
	movs r1, #0x3f
	ands r0, r1
	strb r0, [r2]
	lsrs r0, r0, #2
	lsls r0, r0, #1
	ldr r1, _080BB584 @ =gUnk_086282F8
	adds r0, r0, r1
	movs r1, #0x8c
	lsls r1, r1, #2
	movs r2, #2
	bl ApplyPaletteExt
	ldr r0, _080BB588 @ =gpKeySt
	ldr r1, [r0]
	movs r0, #9
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _080BB594
	ldr r0, _080BB58C @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080BB576
	ldr r0, _080BB590 @ =0x0000038D
	bl m4aSongNumStart
_080BB576:
	movs r0, #0
	bl SetNextGameAction
	adds r0, r4, #0
	bl Proc_Break
	b _080BB5AA
	.align 2, 0
_080BB584: .4byte gUnk_086282F8
_080BB588: .4byte gpKeySt
_080BB58C: .4byte gPlaySt
_080BB590: .4byte 0x0000038D
_080BB594:
	ldr r1, [r4, #0x54]
	movs r0, #0xf0
	lsls r0, r0, #1
	cmp r1, r0
	bne _080BB5AA
	movs r0, #1
	bl SetNextGameAction
	adds r0, r4, #0
	bl Proc_Break
_080BB5AA:
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_80BB5B0
sub_80BB5B0: @ 0x080BB5B0
	push {r4, r5, lr}
	adds r4, r0, #0
	bl EndAllProcChildren
	adds r5, r4, #0
	adds r5, #0x30
	movs r4, #5
_080BB5BE:
	ldm r5!, {r0}
	bl EndSpriteAnimProc
	subs r4, #1
	cmp r4, #0
	bge _080BB5BE
	bl EndEachSpriteAnimProc
	movs r0, #0
	bl SetOnHBlankA
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start StartTitleScreen_WithMusic
StartTitleScreen_WithMusic: @ 0x080BB5DC
	push {lr}
	adds r1, r0, #0
	ldr r0, _080BB5F8 @ =ProcScr_TitleScreen
	bl Proc_StartBlocking
	adds r0, #0x51
	movs r1, #0
	strb r1, [r0]
	movs r0, #0x5a
	movs r2, #0
	bl sub_8003788
	pop {r0}
	bx r0
	.align 2, 0
_080BB5F8: .4byte ProcScr_TitleScreen

	thumb_func_start StartTitleScreen_FlagFalse
StartTitleScreen_FlagFalse: @ 0x080BB5FC
	push {lr}
	adds r1, r0, #0
	ldr r0, _080BB610 @ =ProcScr_TitleScreen
	bl Proc_StartBlocking
	adds r0, #0x51
	movs r1, #0
	strb r1, [r0]
	pop {r0}
	bx r0
	.align 2, 0
_080BB610: .4byte ProcScr_TitleScreen

	thumb_func_start StartTitleScreen_FlagTrue
StartTitleScreen_FlagTrue: @ 0x080BB614
	push {lr}
	adds r1, r0, #0
	ldr r0, _080BB628 @ =ProcScr_TitleScreen
	bl Proc_StartBlocking
	adds r0, #0x51
	movs r1, #1
	strb r1, [r0]
	pop {r0}
	bx r0
	.align 2, 0
_080BB628: .4byte ProcScr_TitleScreen

	thumb_func_start sub_80BB62C
sub_80BB62C: @ 0x080BB62C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	str r0, [sp, #8]
	ldr r7, _080BB79C @ =gDispIo
	movs r0, #1
	ldrb r1, [r7, #1]
	orrs r0, r1
	movs r2, #2
	orrs r0, r2
	movs r1, #4
	mov sb, r1
	mov r2, sb
	orrs r0, r2
	movs r1, #8
	mov sl, r1
	mov r2, sl
	orrs r0, r2
	movs r1, #0x10
	mov r8, r1
	mov r2, r8
	orrs r0, r2
	strb r0, [r7, #1]
	ldr r0, _080BB7A0 @ =gUnk_086BF118
	ldr r2, _080BB7A4 @ =0x00000848
	movs r1, #7
	str r1, [sp]
	movs r1, #0xa
	str r1, [sp, #4]
	movs r1, #0x78
	movs r3, #0
	bl StartSpriteAnimProc
	movs r0, #0x21
	rsbs r0, r0, #0
	ldrb r1, [r7, #1]
	ands r0, r1
	movs r1, #0x41
	rsbs r1, r1, #0
	ands r0, r1
	movs r1, #0x80
	orrs r0, r1
	strb r0, [r7, #1]
	adds r6, r7, #0
	adds r6, #0x34
	movs r1, #2
	rsbs r1, r1, #0
	adds r0, r1, #0
	ldrb r2, [r6]
	ands r0, r2
	movs r5, #3
	rsbs r5, r5, #0
	ands r0, r5
	movs r4, #5
	rsbs r4, r4, #0
	ands r0, r4
	movs r3, #9
	rsbs r3, r3, #0
	ands r0, r3
	movs r2, #0x11
	rsbs r2, r2, #0
	ands r0, r2
	strb r0, [r6]
	adds r6, #3
	movs r0, #1
	ldrb r2, [r6]
	orrs r0, r2
	ands r0, r5
	ands r0, r4
	ands r0, r3
	mov r2, r8
	orrs r0, r2
	adds r3, r7, #0
	adds r3, #0x36
	ldrb r2, [r3]
	ands r1, r2
	movs r2, #2
	orrs r1, r2
	mov r2, sb
	orrs r1, r2
	mov r2, sl
	orrs r1, r2
	mov r2, r8
	orrs r1, r2
	movs r2, #0x20
	orrs r0, r2
	strb r0, [r6]
	orrs r1, r2
	strb r1, [r3]
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
	ldr r0, _080BB7A8 @ =0x0000FFE0
	ldrh r2, [r7, #0x3c]
	ands r0, r2
	movs r1, #3
	orrs r0, r1
	ldr r1, _080BB7AC @ =0x0000E0FF
	ands r0, r1
	movs r2, #0xf8
	lsls r2, r2, #5
	adds r1, r2, #0
	orrs r0, r1
	strh r0, [r7, #0x3c]
	movs r1, #4
	rsbs r1, r1, #0
	adds r0, r1, #0
	ldrb r2, [r7, #0xc]
	ands r0, r2
	strb r0, [r7, #0xc]
	adds r0, r1, #0
	ldrb r2, [r7, #0x10]
	ands r0, r2
	movs r2, #1
	orrs r0, r2
	strb r0, [r7, #0x10]
	ldrb r0, [r7, #0x14]
	ands r1, r0
	movs r2, #2
	orrs r1, r2
	strb r1, [r7, #0x14]
	movs r0, #3
	ldrb r1, [r7, #0x18]
	orrs r0, r1
	strb r0, [r7, #0x18]
	ldr r1, _080BB7B0 @ =0x0000FFF8
	ldr r2, _080BB7B4 @ =0x0000FFD0
	movs r0, #1
	bl SetBgOffset
	ldr r0, _080BB7B8 @ =gUnk_086C3CF8
	movs r1, #0xc0
	lsls r1, r1, #1
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r0, _080BB7BC @ =gUnk_086C3D18
	ldr r1, _080BB7C0 @ =0x06005000
	bl Decompress
	ldr r0, _080BB7C4 @ =gBg0Tm
	ldr r1, _080BB7C8 @ =gUnk_086C40D0
	ldr r2, _080BB7CC @ =0x0000C280
	bl TmApplyTsa_thm
	movs r0, #1
	bl EnableBgSync
	bl InitScanlineEffect
	ldr r0, _080BB7D0 @ =sub_80782AC
	bl SetOnHBlankA
	ldr r0, _080BB7D4 @ =gUnk_08DB8F80
	ldr r1, [sp, #8]
	bl Proc_Start
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080BB79C: .4byte gDispIo
_080BB7A0: .4byte gUnk_086BF118
_080BB7A4: .4byte 0x00000848
_080BB7A8: .4byte 0x0000FFE0
_080BB7AC: .4byte 0x0000E0FF
_080BB7B0: .4byte 0x0000FFF8
_080BB7B4: .4byte 0x0000FFD0
_080BB7B8: .4byte gUnk_086C3CF8
_080BB7BC: .4byte gUnk_086C3D18
_080BB7C0: .4byte 0x06005000
_080BB7C4: .4byte gBg0Tm
_080BB7C8: .4byte gUnk_086C40D0
_080BB7CC: .4byte 0x0000C280
_080BB7D0: .4byte sub_80782AC
_080BB7D4: .4byte gUnk_08DB8F80

	thumb_func_start sub_80BB7D8
sub_80BB7D8: @ 0x080BB7D8
	adds r1, r0, #0
	adds r1, #0x64
	movs r2, #0
	strh r2, [r1]
	adds r0, #0x66
	strh r2, [r0]
	ldr r1, _080BB7F8 @ =gAnims
	movs r0, #3
	str r0, [r1]
	str r0, [r1, #4]
	str r0, [r1, #8]
	movs r0, #4
	str r0, [r1, #0xc]
	str r2, [r1, #0x10]
	bx lr
	.align 2, 0
_080BB7F8: .4byte gAnims

	thumb_func_start sub_80BB7FC
sub_80BB7FC: @ 0x080BB7FC
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r5, r0, #0
	adds r4, r5, #0
	adds r4, #0x66
	ldrh r1, [r4]
	lsls r0, r1, #0x10
	asrs r0, r0, #0x11
	cmp r0, #0x10
	bgt _080BB86E
	adds r0, r1, #1
	strh r0, [r4]
	lsls r2, r0, #0x10
	asrs r0, r2, #0x10
	cmp r0, #0x10
	bgt _080BB83E
	asrs r0, r2, #0x13
	movs r3, #8
	rsbs r3, r3, #0
	adds r1, r3, #0
	subs r1, r1, r0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	asrs r0, r2, #0x12
	movs r6, #0x30
	rsbs r6, r6, #0
	adds r2, r6, #0
	subs r2, r2, r0
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	movs r0, #1
	bl SetBgOffset
_080BB83E:
	ldr r3, _080BB8C4 @ =gDispIo
	adds r2, r3, #0
	adds r2, #0x3c
	movs r0, #0x3f
	ldrb r7, [r2]
	ands r0, r7
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r2]
	ldrh r4, [r4]
	lsls r1, r4, #0x10
	asrs r2, r1, #0x11
	adds r0, r3, #0
	adds r0, #0x44
	strb r2, [r0]
	asrs r1, r1, #0x12
	movs r0, #0x10
	subs r0, r0, r1
	adds r1, r3, #0
	adds r1, #0x45
	strb r0, [r1]
	adds r1, #1
	movs r0, #0
	strb r0, [r1]
_080BB86E:
	movs r0, #1
	movs r1, #0
	bl sub_8077CEC
	adds r5, #0x64
	movs r2, #0
	ldrsh r1, [r5, r2]
	ldr r4, _080BB8C8 @ =gAnims
	movs r3, #4
	ldrsh r2, [r4, r3]
	movs r6, #0
	ldrsh r3, [r4, r6]
	movs r6, #0
	str r6, [sp]
	bl sub_8077794
	movs r0, #1
	movs r1, #0xa0
	bl sub_8077CEC
	movs r7, #0
	ldrsh r1, [r5, r7]
	movs r3, #0xc
	ldrsh r2, [r4, r3]
	movs r7, #8
	ldrsh r3, [r4, r7]
	str r6, [sp]
	bl sub_8077794
	bl SwapScanlineBufs
	ldrh r2, [r4, #0x10]
	movs r0, #0
	movs r1, #0
	bl SetBgOffset
	ldrh r0, [r5]
	adds r0, #1
	strh r0, [r5]
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080BB8C4: .4byte gDispIo
_080BB8C8: .4byte gAnims

	thumb_func_start sub_80BB8CC
sub_80BB8CC: @ 0x080BB8CC
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r0, #0x4c
	ldrb r0, [r0]
	cmp r0, #0
	beq _080BB928
	ldr r3, _080BB934 @ =gDispIo
	adds r2, r3, #0
	adds r2, #0x3c
	movs r0, #0x3f
	ldrb r1, [r2]
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r2]
	adds r0, r3, #0
	adds r0, #0x44
	movs r1, #0
	strb r1, [r0]
	movs r5, #0x45
	movs r0, #0x10
	strb r0, [r5, r3]
	adds r0, r3, #0
	adds r0, #0x46
	strb r1, [r0]
	ldr r0, _080BB938 @ =0x0000FFE0
	ldrh r1, [r3, #0x3c]
	ands r0, r1
	ldr r1, _080BB93C @ =0x0000E0FF
	ands r0, r1
	movs r5, #0xf8
	lsls r5, r5, #5
	adds r1, r5, #0
	orrs r0, r1
	strh r0, [r3, #0x3c]
	movs r0, #0x21
	rsbs r0, r0, #0
	ldrb r1, [r2]
	ands r0, r1
	strb r0, [r2]
	adds r1, r3, #0
	adds r1, #0x3d
	movs r0, #0x20
	ldrb r2, [r1]
	orrs r0, r2
	strb r0, [r1]
_080BB928:
	movs r0, #0
	str r0, [r4, #0x30]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080BB934: .4byte gDispIo
_080BB938: .4byte 0x0000FFE0
_080BB93C: .4byte 0x0000E0FF

	thumb_func_start sub_80BB940
sub_80BB940: @ 0x080BB940
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	adds r5, r0, #0
	ldr r0, [r5, #0x30]
	adds r0, #1
	str r0, [r5, #0x30]
	ldr r1, [r5, #0x48]
	cmp r1, #0
	beq _080BB95C
	adds r0, r5, #0
	bl _call_via_r1
_080BB95C:
	ldr r6, [r5, #0x30]
	ldr r7, [r5, #0x34]
	cmp r6, r7
	blt _080BB97A
	adds r0, r5, #0
	bl Proc_Break
	ldr r0, [r5, #0x2c]
	ldr r1, [r5, #0x40]
	ldr r2, [r5, #0x44]
	movs r3, #1
	rsbs r3, r3, #0
	bl SetSpriteAnimProcParameters
	b _080BBA56
_080BB97A:
	subs r4, r7, r6
	ldr r0, [r5, #0x38]
	muls r0, r4, r0
	ldr r1, [r5, #0x40]
	muls r1, r6, r1
	adds r0, r0, r1
	adds r1, r7, #0
	bl __divsi3
	mov sb, r0
	ldr r0, _080BB9D0 @ =0x000001FF
	mov r1, sb
	ands r1, r0
	mov sb, r1
	ldr r0, [r5, #0x3c]
	muls r0, r4, r0
	ldr r1, [r5, #0x44]
	muls r1, r6, r1
	adds r0, r0, r1
	adds r1, r7, #0
	bl __divsi3
	mov r8, r0
	movs r0, #0xff
	mov r1, r8
	ands r1, r0
	mov r8, r1
	lsls r0, r6, #4
	adds r1, r7, #0
	bl __divsi3
	adds r4, r0, #0
	adds r0, r5, #0
	adds r0, #0x4c
	ldrb r0, [r0]
	cmp r0, #1
	beq _080BB9DA
	cmp r0, #1
	bgt _080BB9D4
	cmp r0, #0
	beq _080BBA48
	b _080BBA56
	.align 2, 0
_080BB9D0: .4byte 0x000001FF
_080BB9D4:
	cmp r0, #2
	beq _080BBA08
	b _080BBA56
_080BB9DA:
	ldr r3, _080BBA04 @ =gDispIo
	adds r2, r3, #0
	adds r2, #0x3c
	movs r0, #0x3f
	ldrb r1, [r2]
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r2]
	adds r0, r3, #0
	adds r0, #0x44
	movs r1, #0
	strb r4, [r0]
	movs r0, #0x10
	subs r0, r0, r4
	adds r2, #9
	strb r0, [r2]
	adds r0, r3, #0
	adds r0, #0x46
	strb r1, [r0]
	b _080BBA30
	.align 2, 0
_080BBA04: .4byte gDispIo
_080BBA08:
	ldr r3, _080BBA44 @ =gDispIo
	adds r2, r3, #0
	adds r2, #0x3c
	movs r0, #0x3f
	ldrb r1, [r2]
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r2]
	movs r0, #0x10
	subs r0, r0, r4
	adds r1, r3, #0
	adds r1, #0x44
	movs r2, #0
	strb r0, [r1]
	adds r0, r3, #0
	adds r0, #0x45
	strb r4, [r0]
	adds r0, #1
	strb r2, [r0]
_080BBA30:
	ldr r0, [r5, #0x2c]
	movs r2, #0x80
	lsls r2, r2, #3
	add r2, r8
	movs r3, #1
	rsbs r3, r3, #0
	mov r1, sb
	bl SetSpriteAnimProcParameters
	b _080BBA56
	.align 2, 0
_080BBA44: .4byte gDispIo
_080BBA48:
	ldr r0, [r5, #0x2c]
	movs r3, #1
	rsbs r3, r3, #0
	mov r1, sb
	mov r2, r8
	bl SetSpriteAnimProcParameters
_080BBA56:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_80BBA64
sub_80BBA64: @ 0x080BBA64
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r6, r2, #0
	mov r8, r3
	ldr r7, [sp, #0x18]
	ldr r1, [sp, #0x20]
	ldr r0, _080BBAA0 @ =gUnk_08DB8FA0
	bl Proc_Start
	str r4, [r0, #0x2c]
	str r5, [r0, #0x38]
	str r6, [r0, #0x3c]
	mov r1, r8
	str r1, [r0, #0x40]
	str r7, [r0, #0x44]
	ldr r1, [sp, #0x1c]
	str r1, [r0, #0x34]
	movs r1, #0
	str r1, [r0, #0x48]
	adds r0, #0x4c
	movs r1, #1
	strb r1, [r0]
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080BBAA0: .4byte gUnk_08DB8FA0

	thumb_func_start sub_80BBAA4
sub_80BBAA4: @ 0x080BBAA4
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	adds r5, r0, #0
	adds r6, r1, #0
	mov r8, r2
	mov sb, r3
	ldr r7, [sp, #0x1c]
	ldr r4, [sp, #0x24]
	ldr r1, [sp, #0x28]
	ldr r0, _080BBAE8 @ =gUnk_08DB8FA0
	bl Proc_Start
	str r5, [r0, #0x2c]
	str r6, [r0, #0x38]
	mov r1, r8
	str r1, [r0, #0x3c]
	mov r1, sb
	str r1, [r0, #0x40]
	str r7, [r0, #0x44]
	str r4, [r0, #0x48]
	ldr r1, [sp, #0x20]
	str r1, [r0, #0x34]
	adds r0, #0x4c
	movs r1, #0
	strb r1, [r0]
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080BBAE8: .4byte gUnk_08DB8FA0

	thumb_func_start sub_80BBAEC
sub_80BBAEC: @ 0x080BBAEC
	ldr r0, _080BBAF8 @ =0x02007508
	movs r1, #0xf8
	str r1, [r0]
	movs r1, #4
	str r1, [r0, #4]
	bx lr
	.align 2, 0
_080BBAF8: .4byte 0x02007508

	thumb_func_start sub_80BBAFC
sub_80BBAFC: @ 0x080BBAFC
	push {r4, r5, lr}
	sub sp, #4
	movs r5, #0
	str r5, [sp]
	ldr r4, _080BBB3C @ =0x02007030
	ldr r2, _080BBB40 @ =0x010000A0
	mov r0, sp
	adds r1, r4, #0
	bl CpuFastSet
	ldr r0, _080BBB44 @ =0x020072B0
	str r4, [r0]
	movs r1, #0xa0
	lsls r1, r1, #1
	adds r4, r4, r1
	str r4, [r0, #4]
	ldr r0, _080BBB48 @ =0x02007014
	str r5, [r0]
	movs r2, #0xc0
	lsls r2, r2, #2
	str r2, [r0, #4]
	adds r1, #0xc0
	str r1, [r0, #8]
	str r1, [r0, #0xc]
	str r2, [r0, #0x10]
	str r5, [r0, #0x18]
	str r5, [r0, #0x14]
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080BBB3C: .4byte 0x02007030
_080BBB40: .4byte 0x010000A0
_080BBB44: .4byte 0x020072B0
_080BBB48: .4byte 0x02007014

	thumb_func_start sub_80BBB4C
sub_80BBB4C: @ 0x080BBB4C
	ldr r0, _080BBB58 @ =0x020072B0
	ldr r2, [r0]
	ldr r1, [r0, #4]
	str r1, [r0]
	str r2, [r0, #4]
	bx lr
	.align 2, 0
_080BBB58: .4byte 0x020072B0

	thumb_func_start sub_80BBB5C
sub_80BBB5C: @ 0x080BBB5C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x28
	ldr r1, _080BBC18 @ =0x02007014
	ldr r0, [r1, #4]
	str r0, [sp]
	asrs r0, r0, #0x1f
	str r0, [sp, #4]
	ldr r0, [r1]
	str r0, [sp, #8]
	asrs r0, r0, #0x1f
	str r0, [sp, #0xc]
	ldr r0, [r1, #0xc]
	str r0, [sp, #0x10]
	asrs r0, r0, #0x1f
	str r0, [sp, #0x14]
	ldr r0, [r1, #0x10]
	str r0, [sp, #0x18]
	asrs r0, r0, #0x1f
	str r0, [sp, #0x1c]
	ldr r0, [r1, #0x18]
	cmp r0, #0
	bne _080BBC28
	movs r0, #1
	mov sb, r0
	ldr r1, _080BBC1C @ =gSinLut
	mov sl, r1
	ldr r2, _080BBC20 @ =0x00000FFF
	mov r8, r2
_080BBB9C:
	mov r0, sb
	asrs r1, r0, #0x1f
	ldr r2, [sp]
	ldr r3, [sp, #4]
	bl __muldi3
	ldr r2, [sp, #8]
	ldr r3, [sp, #0xc]
	adds r0, r0, r2
	adcs r1, r3
	lsls r3, r1, #0x18
	lsrs r2, r0, #8
	adds r6, r3, #0
	orrs r6, r2
	asrs r7, r1, #8
	ldr r3, _080BBC24 @ =0x020072B0
	ldr r5, [r3]
	add r5, sb
	movs r4, #0xff
	ands r4, r6
	lsls r0, r4, #1
	add r0, sl
	movs r1, #0
	ldrsh r0, [r0, r1]
	add r0, r8
	asrs r1, r0, #0x1f
	ldr r2, [sp, #0x10]
	ldr r3, [sp, #0x14]
	bl __muldi3
	lsls r3, r1, #0xc
	lsrs r2, r0, #0x14
	adds r0, r3, #0
	orrs r0, r2
	strb r0, [r5]
	ldr r2, _080BBC24 @ =0x020072B0
	ldr r5, [r2]
	add r5, sb
	adds r5, #0xa0
	adds r4, #0x40
	lsls r4, r4, #1
	add r4, sl
	movs r3, #0
	ldrsh r0, [r4, r3]
	add r0, r8
	asrs r1, r0, #0x1f
	ldr r2, [sp, #0x18]
	ldr r3, [sp, #0x1c]
	bl __muldi3
	lsls r3, r1, #0xc
	lsrs r2, r0, #0x14
	adds r0, r3, #0
	orrs r0, r2
	strb r0, [r5]
	movs r0, #2
	add sb, r0
	mov r1, sb
	cmp r1, #0x9f
	ble _080BBB9C
	b _080BBCFA
	.align 2, 0
_080BBC18: .4byte 0x02007014
_080BBC1C: .4byte gSinLut
_080BBC20: .4byte 0x00000FFF
_080BBC24: .4byte 0x020072B0
_080BBC28:
	adds r2, r0, #0
	muls r2, r0, r2
	mov sl, r2
	movs r3, #9
	mov sb, r3
_080BBC32:
	ldr r1, _080BBD18 @ =0x02007014
	ldr r0, [r1, #0x14]
	mov r2, sb
	subs r0, r0, r2
	adds r3, r0, #0
	muls r3, r0, r3
	adds r0, r3, #0
	mov r1, sl
	subs r0, r1, r0
	lsls r0, r0, #8
	bl __divsi3
	mov r8, r0
	cmp r0, #0
	ble _080BBCF0
	mov r0, sb
	asrs r1, r0, #0x1f
	ldr r2, [sp]
	ldr r3, [sp, #4]
	bl __muldi3
	ldr r2, [sp, #8]
	ldr r3, [sp, #0xc]
	adds r0, r0, r2
	adcs r1, r3
	lsls r3, r1, #0x18
	lsrs r2, r0, #8
	adds r6, r3, #0
	orrs r6, r2
	asrs r7, r1, #8
	movs r1, #0xff
	ands r1, r6
	adds r0, r1, #0
	adds r0, #0x40
	lsls r0, r0, #1
	ldr r3, _080BBD1C @ =gSinLut
	adds r0, r0, r3
	movs r2, #0
	ldrsh r0, [r0, r2]
	ldr r3, _080BBD20 @ =0x00000FFF
	adds r0, r0, r3
	adds r6, r0, #0
	asrs r7, r0, #0x1f
	lsls r1, r1, #1
	ldr r0, _080BBD1C @ =gSinLut
	adds r1, r1, r0
	movs r2, #0
	ldrsh r0, [r1, r2]
	adds r0, r0, r3
	str r0, [sp, #0x20]
	asrs r0, r0, #0x1f
	str r0, [sp, #0x24]
	adds r1, r7, #0
	adds r0, r6, #0
	ldr r2, [sp, #0x10]
	ldr r3, [sp, #0x14]
	bl __muldi3
	mov r4, r8
	asrs r5, r4, #0x1f
	adds r3, r5, #0
	adds r2, r4, #0
	bl __muldi3
	lsls r3, r1, #4
	lsrs r2, r0, #0x1c
	adds r6, r3, #0
	orrs r6, r2
	asrs r7, r1, #0x1c
	ldr r0, [sp, #0x20]
	ldr r1, [sp, #0x24]
	ldr r2, [sp, #0x18]
	ldr r3, [sp, #0x1c]
	bl __muldi3
	adds r3, r5, #0
	adds r2, r4, #0
	bl __muldi3
	lsls r3, r1, #4
	lsrs r2, r0, #0x1c
	orrs r3, r2
	str r3, [sp, #0x20]
	asrs r0, r1, #0x1c
	str r0, [sp, #0x24]
	ldr r1, _080BBD24 @ =0x020072B0
	ldr r0, [r1]
	add r0, sb
	strb r6, [r0]
	ldr r0, [r1]
	add r0, sb
	adds r0, #0xa0
	add r3, sp, #0x20
	ldrb r3, [r3]
	strb r3, [r0]
_080BBCF0:
	movs r0, #2
	add sb, r0
	mov r1, sb
	cmp r1, #0x7f
	ble _080BBC32
_080BBCFA:
	bl sub_80BBB4C
	ldr r0, _080BBD18 @ =0x02007014
	ldr r1, [r0]
	ldr r2, [r0, #8]
	adds r1, r1, r2
	str r1, [r0]
	add sp, #0x28
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080BBD18: .4byte 0x02007014
_080BBD1C: .4byte gSinLut
_080BBD20: .4byte 0x00000FFF
_080BBD24: .4byte 0x020072B0

	thumb_func_start sub_80BBD28
sub_80BBD28: @ 0x080BBD28
	push {r4, lr}
	sub sp, #4
	ldr r0, _080BBD78 @ =0x00100010
	str r0, [sp]
	ldr r4, _080BBD7C @ =0x020072FC
	ldr r2, _080BBD80 @ =0x01000080
	mov r0, sp
	adds r1, r4, #0
	bl CpuFastSet
	ldr r0, _080BBD84 @ =0x020074FC
	str r4, [r0]
	movs r1, #0x80
	lsls r1, r1, #1
	adds r4, r4, r1
	str r4, [r0, #4]
	ldr r0, _080BBD88 @ =0x02007504
	movs r4, #0
	str r4, [r0]
	bl sub_80BBAFC
	ldr r0, _080BBD8C @ =0x02007518
	movs r1, #0xa0
	str r1, [r0]
	ldr r0, _080BBD90 @ =0x0200751C
	str r1, [r0]
	ldr r1, _080BBD94 @ =0x02007014
	str r4, [r1, #0x18]
	movs r0, #0x50
	str r0, [r1, #0x14]
	movs r0, #0x80
	lsls r0, r0, #5
	str r0, [r1, #4]
	movs r0, #0x80
	lsls r0, r0, #3
	str r0, [r1, #8]
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080BBD78: .4byte 0x00100010
_080BBD7C: .4byte 0x020072FC
_080BBD80: .4byte 0x01000080
_080BBD84: .4byte 0x020074FC
_080BBD88: .4byte 0x02007504
_080BBD8C: .4byte 0x02007518
_080BBD90: .4byte 0x0200751C
_080BBD94: .4byte 0x02007014

	thumb_func_start sub_80BBD98
sub_80BBD98: @ 0x080BBD98
	ldr r0, _080BBDA4 @ =0x020074FC
	ldr r2, [r0]
	ldr r1, [r0, #4]
	str r1, [r0]
	str r2, [r0, #4]
	bx lr
	.align 2, 0
_080BBDA4: .4byte 0x020074FC

	thumb_func_start sub_80BBDA8
sub_80BBDA8: @ 0x080BBDA8
	push {lr}
	ldr r0, _080BBDC8 @ =0x02007504
	ldr r0, [r0]
	lsls r0, r0, #3
	asrs r0, r0, #6
	movs r1, #0x80
	lsls r1, r1, #5
	adds r0, r0, r1
	ldr r1, _080BBDCC @ =0x020074FC
	ldr r1, [r1]
	strh r0, [r1]
	bl sub_80BBD98
	pop {r0}
	bx r0
	.align 2, 0
_080BBDC8: .4byte 0x02007504
_080BBDCC: .4byte 0x020074FC

	thumb_func_start sub_80BBDD0
sub_80BBDD0: @ 0x080BBDD0
	push {r4, r5, r6, lr}
	ldr r0, _080BBF20 @ =0x04000006
	ldrh r0, [r0]
	adds r0, #1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	cmp r4, #0x9f
	bls _080BBDE2
	movs r4, #0
_080BBDE2:
	movs r1, #1
	adds r0, r4, #0
	ands r0, r1
	ldr r6, _080BBF24 @ =0x03001620
	cmp r0, #0
	beq _080BBE68
	ldr r0, [r6]
	ands r0, r1
	cmp r0, #0
	beq _080BBE0A
	ldr r2, _080BBF28 @ =0x04000010
	ldr r0, _080BBF2C @ =0x020072B0
	ldr r0, [r0, #4]
	adds r0, r0, r4
	ldrb r1, [r0]
	strh r1, [r2]
	ldr r1, _080BBF30 @ =0x04000012
	adds r0, #0xa0
	ldrb r0, [r0]
	strh r0, [r1]
_080BBE0A:
	ldr r5, [r6]
	movs r0, #2
	ands r0, r5
	adds r3, r5, #0
	cmp r0, #0
	beq _080BBE2A
	ldr r2, _080BBF34 @ =0x04000014
	ldr r0, _080BBF2C @ =0x020072B0
	ldr r0, [r0, #4]
	adds r0, r0, r4
	ldrb r1, [r0]
	strh r1, [r2]
	ldr r1, _080BBF38 @ =0x04000016
	adds r0, #0xa0
	ldrb r0, [r0]
	strh r0, [r1]
_080BBE2A:
	movs r0, #4
	ands r3, r0
	cmp r3, #0
	beq _080BBE4C
	ldr r2, _080BBF3C @ =0x04000018
	ldr r0, _080BBF2C @ =0x020072B0
	ldr r0, [r0, #4]
	adds r0, r0, r4
	ldrb r1, [r0]
	strh r1, [r2]
	adds r2, #2
	adds r0, #0xa0
	ldr r1, _080BBF40 @ =gDispIo
	ldrb r0, [r0]
	ldrh r1, [r1, #0x26]
	adds r0, r0, r1
	strh r0, [r2]
_080BBE4C:
	movs r0, #8
	ands r5, r0
	cmp r5, #0
	beq _080BBE68
	ldr r2, _080BBF44 @ =0x0400001C
	ldr r0, _080BBF2C @ =0x020072B0
	ldr r0, [r0, #4]
	adds r0, r0, r4
	ldrb r1, [r0]
	strh r1, [r2]
	ldr r1, _080BBF48 @ =0x0400001E
	adds r0, #0xa0
	ldrb r0, [r0]
	strh r0, [r1]
_080BBE68:
	ldr r0, [r6]
	movs r1, #0xc0
	lsls r1, r1, #1
	ands r0, r1
	cmp r0, #0
	beq _080BBEDE
	cmp r4, #0x83
	bne _080BBE8C
	ldr r1, _080BBF4C @ =0x04000050
	movs r2, #0xf4
	lsls r2, r2, #4
	adds r0, r2, #0
	strh r0, [r1]
	adds r1, #2
	movs r3, #0x80
	lsls r3, r3, #5
	adds r0, r3, #0
	strh r0, [r1]
_080BBE8C:
	cmp r4, #0x83
	bls _080BBEC0
	cmp r4, #0x93
	bhi _080BBEAC
	adds r1, r4, #0
	subs r1, #0x84
	ldr r0, _080BBF50 @ =0x020072B8
	ldr r0, [r0]
	muls r1, r0, r1
	asrs r1, r1, #4
	ldr r2, _080BBF54 @ =0x04000052
	movs r0, #0x10
	subs r0, r0, r1
	lsls r0, r0, #8
	adds r1, r1, r0
	strh r1, [r2]
_080BBEAC:
	cmp r4, #0x94
	bne _080BBEC0
	ldr r2, _080BBF54 @ =0x04000052
	ldr r0, _080BBF50 @ =0x020072B8
	ldr r1, [r0]
	movs r0, #0x10
	subs r0, r0, r1
	lsls r0, r0, #8
	adds r1, r1, r0
	strh r1, [r2]
_080BBEC0:
	cmp r4, #0
	bne _080BBEDE
	ldr r2, _080BBF4C @ =0x04000050
	ldr r1, _080BBF58 @ =0x030027CC
	ldrh r0, [r1]
	strh r0, [r2]
	adds r2, #2
	ldrb r3, [r1, #9]
	lsls r0, r3, #8
	ldrb r3, [r1, #8]
	orrs r0, r3
	strh r0, [r2]
	adds r2, #2
	ldrb r0, [r1, #0xa]
	strh r0, [r2]
_080BBEDE:
	ldr r0, [r6]
	movs r1, #0x10
	ands r0, r1
	cmp r0, #0
	beq _080BBEF6
	ldr r0, _080BBF38 @ =0x04000016
	movs r1, #1
	ands r1, r4
	lsrs r2, r4, #1
	adds r1, r1, r2
	rsbs r1, r1, #0
	strh r1, [r0]
_080BBEF6:
	ldr r0, [r6]
	movs r1, #0x60
	ands r0, r1
	cmp r0, #0
	beq _080BBF1A
	cmp r4, #0x9f
	bne _080BBF0C
	ldr r1, _080BBF4C @ =0x04000050
	ldr r2, _080BBF5C @ =0x00000441
	adds r0, r2, #0
	strh r0, [r1]
_080BBF0C:
	cmp r4, #1
	bne _080BBF1A
	ldr r1, _080BBF54 @ =0x04000052
	ldr r0, _080BBF60 @ =0x020074FC
	ldr r0, [r0, #4]
	ldrh r0, [r0]
	strh r0, [r1]
_080BBF1A:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080BBF20: .4byte 0x04000006
_080BBF24: .4byte 0x03001620
_080BBF28: .4byte 0x04000010
_080BBF2C: .4byte 0x020072B0
_080BBF30: .4byte 0x04000012
_080BBF34: .4byte 0x04000014
_080BBF38: .4byte 0x04000016
_080BBF3C: .4byte 0x04000018
_080BBF40: .4byte gDispIo
_080BBF44: .4byte 0x0400001C
_080BBF48: .4byte 0x0400001E
_080BBF4C: .4byte 0x04000050
_080BBF50: .4byte 0x020072B8
_080BBF54: .4byte 0x04000052
_080BBF58: .4byte 0x030027CC
_080BBF5C: .4byte 0x00000441
_080BBF60: .4byte 0x020074FC

	thumb_func_start sub_80BBF64
sub_80BBF64: @ 0x080BBF64
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r0, _080BBF94 @ =0x03001620
	movs r4, #0
	str r4, [r0]
	ldr r0, _080BBF98 @ =0x020072B8
	str r4, [r0]
	bl sub_80BBD28
	bl sub_80BBAFC
	bl sub_80BBAEC
	movs r0, #0
	bl SetOnHBlankA
	ldr r0, _080BBF9C @ =sub_80BBDD0
	bl SetOnHBlankA
	adds r5, #0x4c
	strh r4, [r5]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080BBF94: .4byte 0x03001620
_080BBF98: .4byte 0x020072B8
_080BBF9C: .4byte sub_80BBDD0

	thumb_func_start sub_80BBFA0
sub_80BBFA0: @ 0x080BBFA0
	push {lr}
	movs r0, #0
	bl SetOnHBlankA
	pop {r0}
	bx r0

	thumb_func_start sub_80BBFAC
sub_80BBFAC: @ 0x080BBFAC
	push {r4, r5, lr}
	sub sp, #0x28
	adds r4, r0, #0
	ldr r0, _080BBFCC @ =0x03001620
	ldr r1, [r0]
	movs r0, #0xe0
	lsls r0, r0, #4
	ands r1, r0
	cmp r1, #0
	beq _080BBFD0
	adds r0, r4, #0
	adds r0, #0x4c
	ldrh r1, [r0]
	adds r1, #1
	b _080BBFD4
	.align 2, 0
_080BBFCC: .4byte 0x03001620
_080BBFD0:
	adds r0, r4, #0
	adds r0, #0x4c
_080BBFD4:
	strh r1, [r0]
	adds r5, r0, #0
	ldr r0, _080BC01C @ =0x03001620
	ldr r1, [r0]
	movs r0, #0x80
	lsls r0, r0, #3
	ands r0, r1
	cmp r0, #0
	beq _080BC028
	ldrh r1, [r5]
	movs r0, #0xf
	ands r0, r1
	cmp r0, #0
	bne _080BC064
	ldr r3, _080BC020 @ =gUnk_08DB8FD0
	lsls r1, r1, #0x10
	asrs r1, r1, #0x14
	adds r0, r1, #0
	movs r2, #0xf
	ands r0, r2
	lsls r0, r0, #2
	adds r0, r0, r3
	ldr r0, [r0]
	ldr r3, _080BC024 @ =gUnk_08DB9010
	movs r2, #7
	ands r1, r2
	lsls r1, r1, #2
	adds r1, r1, r3
	ldr r2, [r1]
	str r4, [sp]
	movs r1, #0x70
	movs r3, #0x20
	bl sub_80BDF7C
	b _080BC064
	.align 2, 0
_080BC01C: .4byte 0x03001620
_080BC020: .4byte gUnk_08DB8FD0
_080BC024: .4byte gUnk_08DB9010
_080BC028:
	movs r0, #0x80
	lsls r0, r0, #2
	ands r1, r0
	cmp r1, #0
	beq _080BC064
	ldrh r1, [r5]
	movs r0, #0x1f
	ands r0, r1
	cmp r0, #0
	bne _080BC064
	ldr r3, _080BC0E8 @ =gUnk_08DB8FD0
	lsls r1, r1, #0x10
	asrs r0, r1, #0x15
	movs r2, #0xf
	ands r0, r2
	lsls r0, r0, #2
	adds r0, r0, r3
	ldr r0, [r0]
	ldr r3, _080BC0EC @ =gUnk_08DB9010
	asrs r1, r1, #0x14
	movs r2, #7
	ands r1, r2
	lsls r1, r1, #2
	adds r1, r1, r3
	ldr r2, [r1]
	str r4, [sp]
	movs r1, #0x70
	movs r3, #0x20
	bl sub_80BDF7C
_080BC064:
	ldr r0, _080BC0F0 @ =0x03001620
	ldr r0, [r0]
	movs r1, #0x80
	lsls r1, r1, #4
	ands r0, r1
	cmp r0, #0
	beq _080BC0B6
	add r0, sp, #8
	ldr r1, _080BC0F4 @ =gUnk_086C44EC
	ldm r1!, {r2, r3, r4}
	stm r0!, {r2, r3, r4}
	ldm r1!, {r2, r3, r4}
	stm r0!, {r2, r3, r4}
	ldm r1!, {r2, r3}
	stm r0!, {r2, r3}
	ldrh r2, [r5]
	movs r0, #0xf
	ands r0, r2
	cmp r0, #0
	bne _080BC0B6
	ldr r0, _080BC0F8 @ =gUnk_086C0C4C
	lsls r2, r2, #0x10
	asrs r2, r2, #0x14
	movs r3, #7
	adds r1, r2, #0
	ands r1, r3
	lsls r1, r1, #2
	add r1, sp
	adds r1, #8
	ldr r1, [r1]
	movs r3, #0xe6
	lsls r3, r3, #6
	movs r4, #1
	ands r2, r4
	adds r2, #1
	str r2, [sp]
	movs r2, #0xa
	str r2, [sp, #4]
	movs r2, #0x50
	bl StartSpriteAnimProc
_080BC0B6:
	ldr r4, _080BC0F0 @ =0x03001620
	ldr r0, [r4]
	movs r1, #0xf
	ands r0, r1
	cmp r0, #0
	beq _080BC0C6
	bl sub_80BBB5C
_080BC0C6:
	ldr r1, [r4]
	movs r0, #0xc0
	lsls r0, r0, #1
	ands r0, r1
	cmp r0, #0
	beq _080BC114
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r1
	cmp r0, #0
	beq _080BC100
	ldr r1, _080BC0FC @ =0x020072B8
	ldr r0, [r1]
	cmp r0, #0
	ble _080BC114
	subs r0, #1
	b _080BC112
	.align 2, 0
_080BC0E8: .4byte gUnk_08DB8FD0
_080BC0EC: .4byte gUnk_08DB9010
_080BC0F0: .4byte 0x03001620
_080BC0F4: .4byte gUnk_086C44EC
_080BC0F8: .4byte gUnk_086C0C4C
_080BC0FC: .4byte 0x020072B8
_080BC100:
	movs r0, #0x80
	ands r1, r0
	cmp r1, #0
	beq _080BC114
	ldr r1, _080BC13C @ =0x020072B8
	ldr r0, [r1]
	cmp r0, #0xf
	bgt _080BC114
	adds r0, #1
_080BC112:
	str r0, [r1]
_080BC114:
	ldr r3, _080BC140 @ =0x03001620
	ldr r1, [r3]
	movs r0, #0x60
	ands r0, r1
	cmp r0, #0
	beq _080BC1A0
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _080BC168
	ldr r2, _080BC144 @ =0x02007504
	ldr r0, [r2]
	cmp r0, #0
	bne _080BC148
	movs r0, #0x65
	rsbs r0, r0, #0
	ands r1, r0
	str r1, [r3]
	b _080BC182
	.align 2, 0
_080BC13C: .4byte 0x020072B8
_080BC140: .4byte 0x03001620
_080BC144: .4byte 0x02007504
_080BC148:
	cmp r0, #0
	ble _080BC182
	subs r0, #1
	str r0, [r2]
	cmp r0, #0
	bne _080BC182
	ldr r0, _080BC164 @ =gBg0Tm
	movs r1, #0
	bl TmFill
	movs r0, #1
	bl EnableBgSync
	b _080BC182
	.align 2, 0
_080BC164: .4byte gBg0Tm
_080BC168:
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	beq _080BC182
	movs r0, #4
	orrs r1, r0
	str r1, [r3]
	ldr r1, _080BC1D0 @ =0x02007504
	ldr r0, [r1]
	cmp r0, #0x3f
	bgt _080BC182
	adds r0, #1
	str r0, [r1]
_080BC182:
	ldr r2, _080BC1D4 @ =0x02007014
	ldr r0, _080BC1D8 @ =0x02007518
	ldr r1, _080BC1D0 @ =0x02007504
	ldr r0, [r0]
	ldr r1, [r1]
	muls r0, r1, r0
	asrs r0, r0, #6
	str r0, [r2, #0xc]
	ldr r0, _080BC1DC @ =0x0200751C
	ldr r0, [r0]
	muls r0, r1, r0
	asrs r0, r0, #6
	str r0, [r2, #0x10]
	bl sub_80BBDA8
_080BC1A0:
	ldr r2, _080BC1E0 @ =0x02007508
	ldr r4, _080BC1E4 @ =gSinLut
	ldrb r1, [r2]
	adds r0, r1, #0
	adds r0, #0x40
	lsls r0, r0, #1
	adds r0, r0, r4
	movs r3, #0
	ldrsh r0, [r0, r3]
	ldr r3, [r2, #4]
	muls r0, r3, r0
	asrs r0, r0, #4
	str r0, [r2, #8]
	lsls r1, r1, #1
	adds r1, r1, r4
	movs r4, #0
	ldrsh r0, [r1, r4]
	muls r0, r3, r0
	asrs r0, r0, #4
	str r0, [r2, #0xc]
	add sp, #0x28
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080BC1D0: .4byte 0x02007504
_080BC1D4: .4byte 0x02007014
_080BC1D8: .4byte 0x02007518
_080BC1DC: .4byte 0x0200751C
_080BC1E0: .4byte 0x02007508
_080BC1E4: .4byte gSinLut

	thumb_func_start sub_80BC1E8
sub_80BC1E8: @ 0x080BC1E8
	push {r4, r5, lr}
	sub sp, #4
	ldr r0, _080BC230 @ =0x03001620
	ldr r0, [r0]
	movs r1, #0xc0
	lsls r1, r1, #1
	ands r0, r1
	cmp r0, #0
	beq _080BC214
	movs r4, #0
	movs r5, #0xbc
	lsls r5, r5, #5
_080BC200:
	lsls r1, r4, #6
	str r5, [sp]
	movs r0, #4
	ldr r2, _080BC234 @ =0x00000484
	ldr r3, _080BC238 @ =Sprite_64x32
	bl PutSpriteExt
	adds r4, #1
	cmp r4, #3
	ble _080BC200
_080BC214:
	ldr r3, _080BC23C @ =gUnk_08DB941C
	movs r0, #0x90
	lsls r0, r0, #5
	str r0, [sp]
	movs r0, #4
	movs r1, #8
	movs r2, #0x90
	bl PutSpriteExt
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080BC230: .4byte 0x03001620
_080BC234: .4byte 0x00000484
_080BC238: .4byte Sprite_64x32
_080BC23C: .4byte gUnk_08DB941C

	thumb_func_start sub_80BC240
sub_80BC240: @ 0x080BC240
	push {r4, r5, r6, lr}
	sub sp, #0x24
	adds r6, r0, #0
	ldr r1, _080BC34C @ =gUnk_086C450C
	mov r0, sp
	movs r2, #0x18
	bl memcpy
	mov r0, sp
	bl InitBgs
	movs r0, #1
	bl FadeBgmOut
	movs r4, #0
	str r4, [sp, #0x18]
	add r0, sp, #0x18
	movs r1, #0xc0
	lsls r1, r1, #0x13
	ldr r5, _080BC350 @ =0x01000008
	adds r2, r5, #0
	bl CpuFastSet
	str r4, [sp, #0x1c]
	add r0, sp, #0x1c
	ldr r1, _080BC354 @ =0x06008000
	adds r2, r5, #0
	bl CpuFastSet
	str r4, [sp, #0x20]
	add r0, sp, #0x20
	ldr r1, _080BC358 @ =0x06010000
	adds r2, r5, #0
	bl CpuFastSet
	ldr r5, _080BC35C @ =gPal
	movs r4, #0x1f
_080BC28A:
	ldr r0, _080BC360 @ =gUnk_0864AD14
	adds r1, r5, #0
	movs r2, #8
	bl CpuFastSet
	adds r5, #0x20
	subs r4, #1
	cmp r4, #0
	bge _080BC28A
	bl EnablePalSync
	ldr r4, _080BC364 @ =gDispIo
	adds r3, r4, #0
	adds r3, #0x3c
	movs r1, #0x3f
	ldrb r0, [r3]
	ands r1, r0
	adds r2, r4, #0
	adds r2, #0x44
	movs r0, #0
	strb r0, [r2]
	adds r2, #1
	strb r0, [r2]
	adds r2, #1
	strb r0, [r2]
	movs r0, #0x20
	orrs r1, r0
	strb r1, [r3]
	adds r1, r4, #0
	adds r1, #0x3d
	ldrb r2, [r1]
	orrs r0, r2
	strb r0, [r1]
	movs r0, #2
	rsbs r0, r0, #0
	ldrb r1, [r4, #1]
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
	strb r0, [r4, #1]
	movs r0, #2
	bl sub_80BAEFC
	adds r0, r6, #0
	bl sub_80BCFC4
	ldr r4, _080BC368 @ =gUnk_08630288
	ldr r1, _080BC36C @ =0x06017000
	adds r0, r4, #0
	bl Decompress
	ldr r1, _080BC370 @ =0x06017400
	adds r0, r4, #0
	bl Decompress
	ldr r1, _080BC374 @ =0x06017800
	adds r0, r4, #0
	bl Decompress
	ldr r1, _080BC378 @ =0x06017C00
	adds r0, r4, #0
	bl Decompress
	ldr r0, _080BC37C @ =gUnk_086618E8
	ldr r1, _080BC380 @ =gUnk_08DB8FC4
	ldr r1, [r1]
	bl Decompress
	ldr r0, _080BC384 @ =gUnk_086C261C
	ldr r1, _080BC388 @ =gUnk_08DB8FC8
	ldr r1, [r1]
	bl Decompress
	ldr r0, _080BC38C @ =gUnk_086C10D4
	ldr r1, _080BC390 @ =gUnk_08DB8FCC
	ldr r1, [r1]
	bl Decompress
	ldr r0, _080BC394 @ =gUnk_08DB9030
	adds r1, r6, #0
	bl Proc_Start
	movs r0, #3
	bl SetNextGameAction
	add sp, #0x24
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080BC34C: .4byte gUnk_086C450C
_080BC350: .4byte 0x01000008
_080BC354: .4byte 0x06008000
_080BC358: .4byte 0x06010000
_080BC35C: .4byte gPal
_080BC360: .4byte gUnk_0864AD14
_080BC364: .4byte gDispIo
_080BC368: .4byte gUnk_08630288
_080BC36C: .4byte 0x06017000
_080BC370: .4byte 0x06017400
_080BC374: .4byte 0x06017800
_080BC378: .4byte 0x06017C00
_080BC37C: .4byte gUnk_086618E8
_080BC380: .4byte gUnk_08DB8FC4
_080BC384: .4byte gUnk_086C261C
_080BC388: .4byte gUnk_08DB8FC8
_080BC38C: .4byte gUnk_086C10D4
_080BC390: .4byte gUnk_08DB8FCC
_080BC394: .4byte gUnk_08DB9030

	thumb_func_start sub_80BC398
sub_80BC398: @ 0x080BC398
	push {r4, r5, lr}
	sub sp, #4
	adds r4, r0, #0
	ldr r1, _080BC420 @ =gDispIo
	movs r2, #4
	rsbs r2, r2, #0
	adds r0, r2, #0
	ldrb r3, [r1, #0xc]
	ands r0, r3
	movs r3, #2
	orrs r0, r3
	strb r0, [r1, #0xc]
	adds r0, r2, #0
	ldrb r5, [r1, #0x10]
	ands r0, r5
	orrs r0, r3
	strb r0, [r1, #0x10]
	movs r0, #3
	ldrb r3, [r1, #0x14]
	orrs r0, r3
	strb r0, [r1, #0x14]
	ldrb r5, [r1, #0x18]
	ands r2, r5
	strb r2, [r1, #0x18]
	ldr r0, _080BC424 @ =gUnk_0862E778
	movs r1, #0xa0
	lsls r1, r1, #1
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r0, _080BC428 @ =gUnk_0862E798
	ldr r1, _080BC42C @ =0x0600C000
	bl Decompress
	ldr r0, _080BC430 @ =gBg3Tm
	ldr r1, _080BC434 @ =gUnk_0862EA60
	movs r2, #0xa2
	lsls r2, r2, #8
	bl TmApplyTsa_thm
	movs r0, #8
	bl EnableBgSync
	movs r0, #0
	str r0, [r4, #0x2c]
	ldr r0, _080BC438 @ =gUnk_08DB9A7C
	movs r2, #1
	rsbs r2, r2, #0
	str r4, [sp]
	movs r1, #2
	movs r3, #0
	bl sub_80BE2A8
	str r0, [r4, #0x3c]
	ldr r0, _080BC43C @ =gUnk_086C08D0
	movs r1, #0x98
	lsls r1, r1, #2
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r0, _080BC440 @ =gUnk_086C08F0
	ldr r1, _080BC444 @ =0x06013000
	bl Decompress
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080BC420: .4byte gDispIo
_080BC424: .4byte gUnk_0862E778
_080BC428: .4byte gUnk_0862E798
_080BC42C: .4byte 0x0600C000
_080BC430: .4byte gBg3Tm
_080BC434: .4byte gUnk_0862EA60
_080BC438: .4byte gUnk_08DB9A7C
_080BC43C: .4byte gUnk_086C08D0
_080BC440: .4byte gUnk_086C08F0
_080BC444: .4byte 0x06013000

	thumb_func_start sub_80BC448
sub_80BC448: @ 0x080BC448
	push {r4, lr}
	adds r4, r0, #0
	ldr r2, [r4, #0x2c]
	adds r2, #1
	str r2, [r4, #0x2c]
	ldr r0, _080BC4C0 @ =gDispIo
	mov ip, r0
	mov r3, ip
	adds r3, #0x3c
	movs r0, #0x3f
	ldrb r1, [r3]
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r3]
	asrs r2, r2, #1
	movs r0, #0x10
	subs r0, r0, r2
	mov r1, ip
	adds r1, #0x44
	movs r3, #0
	strb r0, [r1]
	mov r0, ip
	adds r0, #0x45
	strb r2, [r0]
	adds r0, #1
	strb r3, [r0]
	ldr r0, _080BC4C4 @ =0x0000FFE0
	mov r3, ip
	ldrh r3, [r3, #0x3c]
	ands r0, r3
	movs r1, #8
	orrs r0, r1
	ldr r1, _080BC4C8 @ =0x0000E0FF
	ands r0, r1
	movs r3, #0x80
	lsls r3, r3, #1
	adds r1, r3, #0
	orrs r0, r1
	mov r1, ip
	strh r0, [r1, #0x3c]
	cmp r2, #0x10
	bne _080BC4B8
	ldr r0, _080BC4CC @ =gBg3Tm
	movs r1, #0
	bl TmFill
	movs r0, #8
	bl EnableBgSync
	adds r0, r4, #0
	bl Proc_Break
	adds r0, r4, #0
	bl sub_80BE0A0
_080BC4B8:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080BC4C0: .4byte gDispIo
_080BC4C4: .4byte 0x0000FFE0
_080BC4C8: .4byte 0x0000E0FF
_080BC4CC: .4byte gBg3Tm

	thumb_func_start sub_80BC4D0
sub_80BC4D0: @ 0x080BC4D0
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _080BC520 @ =gUnk_0864AC94
	movs r1, #0xe0
	lsls r1, r1, #1
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r0, _080BC524 @ =gUnk_086496C8
	ldr r1, _080BC528 @ =0x06008000
	bl Decompress
	ldr r0, _080BC52C @ =gBg0Tm
	ldr r1, _080BC530 @ =gUnk_0864A790
	movs r2, #0xe0
	lsls r2, r2, #8
	bl TmApplyTsa_thm
	ldr r2, _080BC534 @ =gDispIo
	movs r0, #0x3f
	ldrb r1, [r2, #0xd]
	ands r0, r1
	movs r1, #0x20
	orrs r0, r1
	strb r0, [r2, #0xd]
	movs r0, #1
	bl EnableBgSync
	bl sub_80BBAFC
	ldr r2, _080BC538 @ =0x03001620
	ldr r0, [r2]
	movs r1, #1
	orrs r0, r1
	str r0, [r2]
	movs r0, #0
	str r0, [r4, #0x2c]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080BC520: .4byte gUnk_0864AC94
_080BC524: .4byte gUnk_086496C8
_080BC528: .4byte 0x06008000
_080BC52C: .4byte gBg0Tm
_080BC530: .4byte gUnk_0864A790
_080BC534: .4byte gDispIo
_080BC538: .4byte 0x03001620

	thumb_func_start sub_80BC53C
sub_80BC53C: @ 0x080BC53C
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r2, [r4, #0x2c]
	adds r2, #1
	str r2, [r4, #0x2c]
	ldr r0, _080BC5A4 @ =gDispIo
	mov ip, r0
	mov r3, ip
	adds r3, #0x3c
	movs r0, #0x3f
	ldrb r1, [r3]
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r3]
	asrs r2, r2, #2
	mov r0, ip
	adds r0, #0x44
	movs r3, #0
	strb r2, [r0]
	movs r0, #0x10
	subs r0, r0, r2
	mov r1, ip
	adds r1, #0x45
	strb r0, [r1]
	mov r0, ip
	adds r0, #0x46
	strb r3, [r0]
	ldr r0, _080BC5A8 @ =0x0000FFE0
	mov r5, ip
	ldrh r5, [r5, #0x3c]
	ands r0, r5
	movs r1, #1
	orrs r0, r1
	ldr r1, _080BC5AC @ =0x0000E0FF
	ands r0, r1
	movs r5, #0xf8
	lsls r5, r5, #5
	adds r1, r5, #0
	orrs r0, r1
	mov r1, ip
	strh r0, [r1, #0x3c]
	cmp r2, #0x10
	bne _080BC59C
	str r3, [r4, #0x2c]
	adds r0, r4, #0
	bl Proc_Break
_080BC59C:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080BC5A4: .4byte gDispIo
_080BC5A8: .4byte 0x0000FFE0
_080BC5AC: .4byte 0x0000E0FF

	thumb_func_start sub_80BC5B0
sub_80BC5B0: @ 0x080BC5B0
	push {lr}
	ldr r0, _080BC5C0 @ =gUnk_0864ACF4
	movs r1, #0
	movs r2, #0x20
	bl ApplyPaletteExt
	pop {r0}
	bx r0
	.align 2, 0
_080BC5C0: .4byte gUnk_0864ACF4

	thumb_func_start sub_80BC5C4
sub_80BC5C4: @ 0x080BC5C4
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	movs r0, #0x5c
	movs r1, #0x1e
	movs r2, #0
	bl sub_8003788
	ldr r6, _080BC654 @ =gDispIo
	movs r0, #4
	rsbs r0, r0, #0
	ldrb r1, [r6, #0xc]
	ands r0, r1
	movs r1, #2
	orrs r0, r1
	strb r0, [r6, #0xc]
	movs r0, #3
	ldrb r1, [r6, #0x10]
	orrs r1, r0
	strb r1, [r6, #0x10]
	ldrb r1, [r6, #0x14]
	orrs r1, r0
	strb r1, [r6, #0x14]
	ldrb r2, [r6, #0x18]
	orrs r0, r2
	strb r0, [r6, #0x18]
	ldr r0, _080BC658 @ =gUnk_086284F8
	movs r1, #0x88
	lsls r1, r1, #2
	movs r2, #0x20
	bl ApplyPaletteExt
	movs r0, #4
	bl EnableBgSync
	movs r4, #0
	str r4, [r5, #0x2c]
	movs r0, #0
	bl sub_80BD4F4
	bl EndAllParallelWorkers
	ldr r0, _080BC65C @ =sub_80BC1E8
	adds r1, r5, #0
	bl StartParallelWorker
	adds r0, r5, #0
	bl sub_80BD83C
	adds r1, r6, #0
	adds r1, #0x3c
	movs r0, #0x3f
	ldrb r2, [r1]
	ands r0, r2
	strb r0, [r1]
	adds r0, r6, #0
	adds r0, #0x44
	strb r4, [r0]
	adds r0, #1
	strb r4, [r0]
	adds r0, #1
	strb r4, [r0]
	ldr r2, _080BC660 @ =0x03001620
	ldr r0, [r2]
	movs r1, #0x80
	orrs r0, r1
	str r0, [r2]
	str r4, [r5, #0x30]
	str r4, [r5, #0x38]
	str r4, [r5, #0x34]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080BC654: .4byte gDispIo
_080BC658: .4byte gUnk_086284F8
_080BC65C: .4byte sub_80BC1E8
_080BC660: .4byte 0x03001620

	thumb_func_start sub_80BC664
sub_80BC664: @ 0x080BC664
	push {lr}
	sub sp, #8
	ldr r0, _080BC684 @ =gUnk_086C0C4C
	movs r3, #0xe6
	lsls r3, r3, #6
	movs r1, #0
	str r1, [sp]
	movs r1, #0xa
	str r1, [sp, #4]
	movs r1, #0x78
	movs r2, #0x50
	bl StartSpriteAnimProc
	add sp, #8
	pop {r0}
	bx r0
	.align 2, 0
_080BC684: .4byte gUnk_086C0C4C

	thumb_func_start sub_80BC688
sub_80BC688: @ 0x080BC688
	push {r4, lr}
	movs r0, #0
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	ldr r4, _080BC710 @ =gBg0Tm
	adds r0, r4, #0
	movs r1, #0
	bl TmFill
	ldr r0, _080BC714 @ =gUnk_086C10B4
	movs r1, #0xd0
	lsls r1, r1, #1
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r0, _080BC718 @ =gUnk_08DB8FCC
	ldr r0, [r0]
	ldr r1, _080BC71C @ =0x06008000
	movs r2, #0x80
	lsls r2, r2, #4
	bl CpuFastSet
	ldr r1, _080BC720 @ =gUnk_086C2238
	movs r2, #0xd0
	lsls r2, r2, #8
	adds r0, r4, #0
	bl TmApplyTsa_thm
	movs r0, #1
	bl EnableBgSync
	ldr r3, _080BC724 @ =gDispIo
	adds r2, r3, #0
	adds r2, #0x3c
	movs r0, #0x3f
	ldrb r1, [r2]
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r2]
	adds r0, r3, #0
	adds r0, #0x44
	movs r1, #0
	strb r1, [r0]
	adds r2, #9
	movs r0, #0x10
	strb r0, [r2]
	adds r0, r3, #0
	adds r0, #0x46
	strb r1, [r0]
	ldr r0, _080BC728 @ =0x0000FFE0
	ldrh r2, [r3, #0x3c]
	ands r0, r2
	movs r1, #1
	orrs r0, r1
	ldr r1, _080BC72C @ =0x0000E0FF
	ands r0, r1
	movs r2, #0xf8
	lsls r2, r2, #5
	adds r1, r2, #0
	orrs r0, r1
	strh r0, [r3, #0x3c]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080BC710: .4byte gBg0Tm
_080BC714: .4byte gUnk_086C10B4
_080BC718: .4byte gUnk_08DB8FCC
_080BC71C: .4byte 0x06008000
_080BC720: .4byte gUnk_086C2238
_080BC724: .4byte gDispIo
_080BC728: .4byte 0x0000FFE0
_080BC72C: .4byte 0x0000E0FF

	thumb_func_start sub_80BC730
sub_80BC730: @ 0x080BC730
	push {r4, lr}
	movs r0, #0
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	ldr r4, _080BC7B8 @ =gBg0Tm
	adds r0, r4, #0
	movs r1, #0
	bl TmFill
	ldr r0, _080BC7BC @ =gUnk_086C25FC
	movs r1, #0xd0
	lsls r1, r1, #1
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r0, _080BC7C0 @ =gUnk_08DB8FC8
	ldr r0, [r0]
	ldr r1, _080BC7C4 @ =0x06008000
	movs r2, #0x80
	lsls r2, r2, #4
	bl CpuFastSet
	ldr r1, _080BC7C8 @ =gUnk_086C38F4
	movs r2, #0xd0
	lsls r2, r2, #8
	adds r0, r4, #0
	bl TmApplyTsa_thm
	movs r0, #1
	bl EnableBgSync
	ldr r3, _080BC7CC @ =gDispIo
	adds r2, r3, #0
	adds r2, #0x3c
	movs r0, #0x3f
	ldrb r1, [r2]
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r2]
	adds r0, r3, #0
	adds r0, #0x44
	movs r1, #0
	strb r1, [r0]
	adds r2, #9
	movs r0, #0x10
	strb r0, [r2]
	adds r0, r3, #0
	adds r0, #0x46
	strb r1, [r0]
	ldr r0, _080BC7D0 @ =0x0000FFE0
	ldrh r2, [r3, #0x3c]
	ands r0, r2
	movs r1, #1
	orrs r0, r1
	ldr r1, _080BC7D4 @ =0x0000E0FF
	ands r0, r1
	movs r2, #0xf8
	lsls r2, r2, #5
	adds r1, r2, #0
	orrs r0, r1
	strh r0, [r3, #0x3c]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080BC7B8: .4byte gBg0Tm
_080BC7BC: .4byte gUnk_086C25FC
_080BC7C0: .4byte gUnk_08DB8FC8
_080BC7C4: .4byte 0x06008000
_080BC7C8: .4byte gUnk_086C38F4
_080BC7CC: .4byte gDispIo
_080BC7D0: .4byte 0x0000FFE0
_080BC7D4: .4byte 0x0000E0FF

	thumb_func_start sub_80BC7D8
sub_80BC7D8: @ 0x080BC7D8
	push {r4, lr}
	movs r0, #0
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	bl sub_80BBD28
	ldr r4, _080BC830 @ =gBg0Tm
	adds r0, r4, #0
	movs r1, #0
	bl TmFill
	ldr r0, _080BC834 @ =gUnk_08661544
	movs r1, #0xd0
	lsls r1, r1, #1
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r0, _080BC838 @ =gUnk_08DB8FC4
	ldr r0, [r0]
	ldr r1, _080BC83C @ =0x06008000
	movs r2, #0x80
	lsls r2, r2, #3
	bl CpuFastSet
	adds r4, #0x80
	ldr r1, _080BC840 @ =gUnk_08661564
	movs r2, #0xd0
	lsls r2, r2, #8
	adds r0, r4, #0
	bl TmApplyTsa_thm
	ldr r2, _080BC844 @ =0x03001620
	ldr r0, [r2]
	movs r1, #0x20
	orrs r0, r1
	str r0, [r2]
	movs r0, #1
	bl EnableBgSync
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080BC830: .4byte gBg0Tm
_080BC834: .4byte gUnk_08661544
_080BC838: .4byte gUnk_08DB8FC4
_080BC83C: .4byte 0x06008000
_080BC840: .4byte gUnk_08661564
_080BC844: .4byte 0x03001620

	thumb_func_start sub_80BC848
sub_80BC848: @ 0x080BC848
	ldr r0, _080BC854 @ =0x03001620
	ldr r1, [r0]
	movs r2, #0x40
	orrs r1, r2
	str r1, [r0]
	bx lr
	.align 2, 0
_080BC854: .4byte 0x03001620

	thumb_func_start sub_80BC858
sub_80BC858: @ 0x080BC858
	push {lr}
	sub sp, #0xc
	movs r3, #1
	rsbs r3, r3, #0
	ldr r1, _080BC87C @ =gUnk_0864AD34
	ldr r2, _080BC880 @ =0x0000FFFF
	str r2, [sp]
	movs r2, #8
	str r2, [sp, #4]
	str r0, [sp, #8]
	adds r0, r3, #0
	movs r2, #0
	movs r3, #0x10
	bl sub_80BDD34
	add sp, #0xc
	pop {r0}
	bx r0
	.align 2, 0
_080BC87C: .4byte gUnk_0864AD34
_080BC880: .4byte 0x0000FFFF

	thumb_func_start sub_80BC884
sub_80BC884: @ 0x080BC884
	push {r4, lr}
	sub sp, #0xc
	adds r4, r0, #0
	bl sub_80BC664
	movs r0, #1
	rsbs r0, r0, #0
	ldr r1, _080BC8B0 @ =gUnk_0864AD54
	ldr r2, _080BC8B4 @ =0x0000FFFF
	str r2, [sp]
	movs r2, #8
	str r2, [sp, #4]
	str r4, [sp, #8]
	movs r2, #0
	movs r3, #0x10
	bl sub_80BDD34
	add sp, #0xc
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080BC8B0: .4byte gUnk_0864AD54
_080BC8B4: .4byte 0x0000FFFF

	thumb_func_start sub_80BC8B8
sub_80BC8B8: @ 0x080BC8B8
	push {r4, lr}
	sub sp, #4
	adds r4, r0, #0
	ldr r1, [r4, #0x38]
	ldr r2, [r4, #0x30]
	cmp r1, r2
	ble _080BC8DC
	ldr r0, [r4, #0x34]
	adds r0, r2, r0
	str r0, [r4, #0x30]
	cmp r0, r1
	ble _080BC8D2
	str r1, [r4, #0x30]
_080BC8D2:
	ldr r0, [r4, #0x3c]
	ldr r1, [r4, #0x30]
	rsbs r1, r1, #0
	bl sub_80BE1CC
_080BC8DC:
	ldr r1, [r4, #0x38]
	ldr r2, [r4, #0x30]
	cmp r1, r2
	bge _080BC8FA
	ldr r0, [r4, #0x34]
	subs r0, r2, r0
	str r0, [r4, #0x30]
	cmp r0, r1
	bge _080BC8F0
	str r1, [r4, #0x30]
_080BC8F0:
	ldr r0, [r4, #0x3c]
	ldr r1, [r4, #0x30]
	rsbs r1, r1, #0
	bl sub_80BE1CC
_080BC8FA:
	ldr r1, [r4, #0x2c]
	ldr r0, _080BC928 @ =0x000008A2
	cmp r1, r0
	bne _080BC904
	b _080BCA0E
_080BC904:
	cmp r1, r0
	bgt _080BC958
	movs r0, #0xaf
	lsls r0, r0, #3
	cmp r1, r0
	beq _080BC9E0
	cmp r1, r0
	bgt _080BC938
	subs r0, #0xb4
	cmp r1, r0
	beq _080BC9C4
	cmp r1, r0
	bgt _080BC92C
	movs r0, #0x96
	lsls r0, r0, #1
	cmp r1, r0
	beq _080BC9B8
	b _080BCA9C
	.align 2, 0
_080BC928: .4byte 0x000008A2
_080BC92C:
	ldr r0, _080BC934 @ =0x0000053C
	cmp r1, r0
	beq _080BC9D0
	b _080BCA9C
	.align 2, 0
_080BC934: .4byte 0x0000053C
_080BC938:
	movs r0, #0xdc
	lsls r0, r0, #3
	cmp r1, r0
	beq _080BCA04
	cmp r1, r0
	bgt _080BC94C
	subs r0, #0xb4
	cmp r1, r0
	beq _080BC9EC
	b _080BCA9C
_080BC94C:
	ldr r0, _080BC954 @ =0x0000080C
	cmp r1, r0
	beq _080BCA0E
	b _080BCA9C
	.align 2, 0
_080BC954: .4byte 0x0000080C
_080BC958:
	ldr r0, _080BC97C @ =0x00000B68
	cmp r1, r0
	bne _080BC960
	b _080BCA4C
_080BC960:
	cmp r1, r0
	bgt _080BC98C
	movs r0, #0xa0
	lsls r0, r0, #4
	cmp r1, r0
	bne _080BC96E
	b _080BCA84
_080BC96E:
	cmp r1, r0
	bgt _080BC980
	subs r0, #0xc8
	cmp r1, r0
	beq _080BCA16
	b _080BCA9C
	.align 2, 0
_080BC97C: .4byte 0x00000B68
_080BC980:
	ldr r0, _080BC988 @ =0x00000B2C
	cmp r1, r0
	beq _080BCA34
	b _080BCA9C
	.align 2, 0
_080BC988: .4byte 0x00000B2C
_080BC98C:
	ldr r0, _080BC9A0 @ =0x00000C58
	cmp r1, r0
	bne _080BC994
	b _080BCA84
_080BC994:
	cmp r1, r0
	bgt _080BC9A4
	subs r0, #0x64
	cmp r1, r0
	beq _080BCA6C
	b _080BCA9C
	.align 2, 0
_080BC9A0: .4byte 0x00000C58
_080BC9A4:
	ldr r0, _080BC9B4 @ =0x00000E74
	cmp r1, r0
	beq _080BCA8E
	movs r0, #0xfa
	lsls r0, r0, #4
	cmp r1, r0
	beq _080BCA96
	b _080BCA9C
	.align 2, 0
_080BC9B4: .4byte 0x00000E74
_080BC9B8:
	movs r0, #0xfa
	lsls r0, r0, #2
	adds r1, r4, #0
	bl sub_80BD464
	b _080BCA9C
_080BC9C4:
	ldr r0, _080BC9D8 @ =0x03001620
	ldr r1, [r0]
	movs r2, #0x80
	lsls r2, r2, #2
	orrs r1, r2
	str r1, [r0]
_080BC9D0:
	movs r0, #1
	rsbs r0, r0, #0
	ldr r1, _080BC9DC @ =gUnk_0864ACD4
	b _080BCA72
	.align 2, 0
_080BC9D8: .4byte 0x03001620
_080BC9DC: .4byte gUnk_0864ACD4
_080BC9E0:
	movs r0, #0x20
	str r0, [r4, #0x34]
	movs r0, #0x80
	lsls r0, r0, #2
	str r0, [r4, #0x38]
	b _080BCA9C
_080BC9EC:
	ldr r0, _080BCA00 @ =0x03001620
	ldr r1, [r0]
	movs r2, #0x80
	lsls r2, r2, #3
	orrs r1, r2
	str r1, [r0]
	bl sub_80BC7D8
	b _080BCA9C
	.align 2, 0
_080BCA00: .4byte 0x03001620
_080BCA04:
	movs r0, #0x20
	str r0, [r4, #0x34]
	movs r0, #0
	str r0, [r4, #0x38]
	b _080BCA9C
_080BCA0E:
	adds r0, r4, #0
	bl sub_80BC858
	b _080BCA9C
_080BCA16:
	adds r0, r4, #0
	bl sub_80BC884
	ldr r0, _080BCA2C @ =0x03001620
	ldr r1, [r0]
	ldr r2, _080BCA30 @ =0xFFFFF9FF
	ands r1, r2
	str r1, [r0]
	bl sub_80BC848
	b _080BCA9C
	.align 2, 0
_080BCA2C: .4byte 0x03001620
_080BCA30: .4byte 0xFFFFF9FF
_080BCA34:
	adds r0, r4, #0
	bl sub_80BC858
	ldr r0, _080BCA48 @ =0x03001620
	ldr r1, [r0]
	movs r2, #0x80
	lsls r2, r2, #4
	orrs r1, r2
	str r1, [r0]
	b _080BCA9C
	.align 2, 0
_080BCA48: .4byte 0x03001620
_080BCA4C:
	movs r0, #0x10
	str r0, [r4, #0x34]
	movs r0, #0xc0
	lsls r0, r0, #1
	str r0, [r4, #0x38]
	ldr r2, _080BCA64 @ =0x03001620
	ldr r0, [r2]
	ldr r1, _080BCA68 @ =0xFFFFF7FF
	ands r0, r1
	str r0, [r2]
	b _080BCA9C
	.align 2, 0
_080BCA64: .4byte 0x03001620
_080BCA68: .4byte 0xFFFFF7FF
_080BCA6C:
	movs r0, #1
	rsbs r0, r0, #0
	ldr r1, _080BCA80 @ =gUnk_0864ACB4
_080BCA72:
	str r4, [sp]
	movs r2, #0
	movs r3, #1
	bl sub_80BDC2C
	b _080BCA9C
	.align 2, 0
_080BCA80: .4byte gUnk_0864ACB4
_080BCA84:
	movs r0, #0x10
	str r0, [r4, #0x34]
	adds r0, #0xf0
	str r0, [r4, #0x38]
	b _080BCA9C
_080BCA8E:
	adds r0, r4, #0
	bl sub_80BD4E0
	b _080BCA9C
_080BCA96:
	adds r0, r4, #0
	bl Proc_Break
_080BCA9C:
	ldr r0, [r4, #0x2c]
	adds r0, #1
	str r0, [r4, #0x2c]
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_80BCAAC
sub_80BCAAC: @ 0x080BCAAC
	push {lr}
	movs r1, #0
	str r1, [r0, #0x2c]
	ldr r2, _080BCAC8 @ =0x03001620
	ldr r0, [r2]
	movs r1, #0x80
	lsls r1, r1, #1
	orrs r0, r1
	str r0, [r2]
	bl ArchiveCurrentPalettes
	pop {r0}
	bx r0
	.align 2, 0
_080BCAC8: .4byte 0x03001620

	thumb_func_start sub_80BCACC
sub_80BCACC: @ 0x080BCACC
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r0, [r5, #0x2c]
	lsls r4, r0, #3
	movs r1, #0x80
	lsls r1, r1, #1
	adds r4, r4, r1
	adds r0, #1
	str r0, [r5, #0x2c]
	adds r0, r4, #0
	adds r1, r4, #0
	adds r2, r4, #0
	movs r3, #1
	bl WriteFadedPaletteFromArchive
	movs r0, #0x80
	lsls r0, r0, #2
	cmp r4, r0
	bne _080BCAF8
	adds r0, r5, #0
	bl Proc_Break
_080BCAF8:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_80BCB00
sub_80BCB00: @ 0x080BCB00
	push {lr}
	movs r0, #2
	bl EnableBgSync
	pop {r0}
	bx r0

	thumb_func_start sub_80BCB0C
sub_80BCB0C: @ 0x080BCB0C
	push {lr}
	sub sp, #4
	movs r0, #0
	bl SetOnHBlankA
	bl sub_80BCFD8
	bl EndFadeInOut
	movs r0, #0
	str r0, [sp]
	ldr r1, _080BCB60 @ =gPal
	ldr r2, _080BCB64 @ =0x01000008
	mov r0, sp
	bl CpuFastSet
	bl EnablePalSync
	ldr r2, _080BCB68 @ =gDispIo
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
	movs r0, #2
	bl sub_80BAEFC
	bl EndEachSpriteAnimProc
	add sp, #4
	pop {r0}
	bx r0
	.align 2, 0
_080BCB60: .4byte gPal
_080BCB64: .4byte 0x01000008
_080BCB68: .4byte gDispIo

	thumb_func_start sub_80BCB6C
sub_80BCB6C: @ 0x080BCB6C
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r5, r0, #0
	ldr r6, _080BCBEC @ =gDispIo
	adds r1, r6, #0
	adds r1, #0x3c
	movs r0, #0x3f
	ldrb r2, [r1]
	ands r0, r2
	strb r0, [r1]
	adds r0, r6, #0
	adds r0, #0x44
	movs r4, #0
	strb r4, [r0]
	adds r0, #1
	strb r4, [r0]
	adds r0, #1
	strb r4, [r0]
	ldr r2, _080BCBF0 @ =0x03001620
	ldr r0, [r2]
	ldr r1, _080BCBF4 @ =0xFFFFFE1E
	ands r0, r1
	str r0, [r2]
	str r4, [sp]
	ldr r1, _080BCBF8 @ =0x06017000
	ldr r2, _080BCBFC @ =0x01000400
	mov r0, sp
	bl CpuFastSet
	movs r0, #2
	rsbs r0, r0, #0
	ldrb r1, [r6, #1]
	ands r0, r1
	movs r1, #3
	rsbs r1, r1, #0
	ands r0, r1
	subs r1, #2
	ands r0, r1
	subs r1, #4
	ands r0, r1
	movs r1, #0x10
	orrs r0, r1
	strb r0, [r6, #1]
	ldr r0, _080BCC00 @ =gUnk_086284F8
	movs r1, #0x88
	lsls r1, r1, #2
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r0, _080BCC04 @ =gUnk_0862B5B4
	movs r1, #0
	bl sub_80BD534
	ldr r0, _080BCC08 @ =gUnk_0862E4D0
	movs r1, #0x80
	lsls r1, r1, #4
	bl sub_80BD534
	str r4, [r5, #0x2c]
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080BCBEC: .4byte gDispIo
_080BCBF0: .4byte 0x03001620
_080BCBF4: .4byte 0xFFFFFE1E
_080BCBF8: .4byte 0x06017000
_080BCBFC: .4byte 0x01000400
_080BCC00: .4byte gUnk_086284F8
_080BCC04: .4byte gUnk_0862B5B4
_080BCC08: .4byte gUnk_0862E4D0

	thumb_func_start sub_80BCC0C
sub_80BCC0C: @ 0x080BCC0C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	adds r6, r0, #0
	ldr r7, [r6, #0x2c]
	adds r0, r7, #0
	movs r1, #0x78
	bl __modsi3
	cmp r0, #0
	bge _080BCC2A
	adds r0, #7
_080BCC2A:
	asrs r4, r0, #3
	lsls r0, r4, #1
	mov sb, r0
	adds r0, r7, #0
	movs r1, #0x78
	bl __divsi3
	adds r5, r0, #0
	lsls r0, r5, #1
	mov r8, r0
	movs r0, #8
	mov sl, r0
	str r0, [sp]
	lsls r4, r4, #6
	str r4, [sp, #4]
	str r7, [sp, #8]
	mov r0, sb
	mov r1, r8
	movs r2, #2
	movs r3, #2
	bl sub_80BD54C
	mov r0, sl
	str r0, [sp]
	lsls r5, r5, #0xb
	movs r0, #0x80
	lsls r0, r0, #4
	adds r5, r5, r0
	adds r4, r4, r5
	str r4, [sp, #4]
	ldr r0, [r6, #0x2c]
	str r0, [sp, #8]
	mov r0, sb
	mov r1, r8
	movs r2, #2
	movs r3, #2
	bl sub_80BD54C
	ldr r0, [r6, #0x2c]
	cmp r0, #0x78
	bne _080BCC88
	movs r0, #0
	str r0, [r6, #0x2c]
	adds r0, r6, #0
	bl Proc_Break
	b _080BCC8C
_080BCC88:
	adds r0, #1
	str r0, [r6, #0x2c]
_080BCC8C:
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_80BCC9C
sub_80BCC9C: @ 0x080BCC9C
	push {r4, r5, lr}
	sub sp, #0xc
	adds r5, r0, #0
	ldr r0, [r5, #0x2c]
	cmp r0, #0
	bne _080BCCB2
	movs r0, #0x5f
	movs r1, #0
	movs r2, #0
	bl sub_8003788
_080BCCB2:
	ldr r1, [r5, #0x2c]
	cmp r1, #0x1f
	bgt _080BCCEC
	movs r4, #2
	str r4, [sp]
	movs r0, #0
	str r0, [sp, #4]
	str r1, [sp, #8]
	movs r1, #0
	movs r2, #0x20
	movs r3, #2
	bl sub_80BD614
	str r4, [sp]
	movs r0, #0x80
	lsls r0, r0, #4
	str r0, [sp, #4]
	ldr r0, [r5, #0x2c]
	str r0, [sp, #8]
	movs r0, #0
	movs r1, #0
	movs r2, #0x20
	movs r3, #2
	bl sub_80BD614
	ldr r0, [r5, #0x2c]
	adds r0, #1
	str r0, [r5, #0x2c]
	b _080BCCF2
_080BCCEC:
	adds r0, r5, #0
	bl Proc_Break
_080BCCF2:
	add sp, #0xc
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start nullsub_92
nullsub_92: @ 0x080BCCFC
	bx lr
	.align 2, 0

	thumb_func_start sub_80BCD00
sub_80BCD00: @ 0x080BCD00
	push {lr}
	sub sp, #4
	adds r2, r0, #0
	adds r0, #0x39
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _080BCD28
	ldr r0, [r2, #0x54]
	cmp r0, #1
	bne _080BCD28
	ldr r0, _080BCD30 @ =gUnk_086A511C
	adds r1, r0, #0
	adds r1, #0x20
	str r2, [sp]
	movs r2, #0xa
	movs r3, #0x10
	bl sub_80BDC2C
_080BCD28:
	movs r0, #0
	add sp, #4
	pop {r1}
	bx r1
	.align 2, 0
_080BCD30: .4byte gUnk_086A511C

	thumb_func_start sub_80BCD34
sub_80BCD34: @ 0x080BCD34
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #0x14
	mov r8, r0
	ldr r7, _080BCE5C @ =gDispIo
	movs r0, #2
	rsbs r0, r0, #0
	ldrb r1, [r7, #1]
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
	strb r0, [r7, #1]
	ldr r0, _080BCE60 @ =gBg0Tm
	movs r1, #0
	bl TmFill
	ldr r6, _080BCE64 @ =gBg1Tm
	adds r0, r6, #0
	movs r1, #0
	bl TmFill
	ldr r0, _080BCE68 @ =gBg2Tm
	movs r1, #0
	bl TmFill
	ldr r0, _080BCE6C @ =gBg3Tm
	movs r1, #0
	bl TmFill
	bl EndAllParallelWorkers
	movs r2, #4
	rsbs r2, r2, #0
	adds r0, r2, #0
	ldrb r1, [r7, #0xc]
	ands r0, r1
	strb r0, [r7, #0xc]
	adds r0, r2, #0
	ldrb r1, [r7, #0x10]
	ands r0, r1
	movs r1, #1
	orrs r0, r1
	strb r0, [r7, #0x10]
	movs r0, #3
	ldrb r1, [r7, #0x14]
	orrs r0, r1
	strb r0, [r7, #0x14]
	ldrb r0, [r7, #0x18]
	ands r2, r0
	movs r0, #2
	orrs r2, r0
	strb r2, [r7, #0x18]
	ldr r0, _080BCE70 @ =gUnk_08DBA048
	movs r5, #0
	str r5, [sp]
	movs r1, #0x80
	lsls r1, r1, #7
	str r1, [sp, #4]
	movs r1, #0xa
	str r1, [sp, #8]
	ldr r1, _080BCE74 @ =sub_80BCD00
	str r1, [sp, #0xc]
	mov r1, r8
	str r1, [sp, #0x10]
	movs r1, #0
	movs r2, #0
	movs r3, #0
	bl StartBmBgfx
	ldr r1, _080BCE78 @ =0x03001620
	ldr r0, [r1]
	movs r4, #0x10
	orrs r0, r4
	str r0, [r1]
	ldr r0, _080BCE7C @ =gUnk_086BF37C
	movs r1, #0xe0
	lsls r1, r1, #1
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r0, _080BCE80 @ =gUnk_086BF39C
	movs r1, #0xc0
	lsls r1, r1, #0x13
	bl Decompress
	ldr r1, _080BCE84 @ =gUnk_086C0674
	movs r2, #0xe0
	lsls r2, r2, #8
	adds r0, r6, #0
	bl TmApplyTsa_thm
	ldr r0, _080BCE88 @ =gUnk_0862F448
	movs r1, #0xc0
	lsls r1, r1, #2
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r0, _080BCE8C @ =gUnk_0862F468
	ldr r1, _080BCE90 @ =0x06010000
	bl Decompress
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
	strb r4, [r0]
	adds r0, #1
	strb r4, [r0]
	adds r0, #1
	strb r5, [r0]
	ldr r0, _080BCE94 @ =0x0000FFE0
	ldrh r2, [r7, #0x3c]
	ands r0, r2
	movs r1, #1
	orrs r0, r1
	ldr r1, _080BCE98 @ =0x0000E0FF
	ands r0, r1
	movs r2, #0x80
	lsls r2, r2, #2
	adds r1, r2, #0
	orrs r0, r1
	strh r0, [r7, #0x3c]
	mov r0, r8
	str r5, [r0, #0x2c]
	movs r0, #0xf
	bl EnableBgSync
	add sp, #0x14
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080BCE5C: .4byte gDispIo
_080BCE60: .4byte gBg0Tm
_080BCE64: .4byte gBg1Tm
_080BCE68: .4byte gBg2Tm
_080BCE6C: .4byte gBg3Tm
_080BCE70: .4byte gUnk_08DBA048
_080BCE74: .4byte sub_80BCD00
_080BCE78: .4byte 0x03001620
_080BCE7C: .4byte gUnk_086BF37C
_080BCE80: .4byte gUnk_086BF39C
_080BCE84: .4byte gUnk_086C0674
_080BCE88: .4byte gUnk_0862F448
_080BCE8C: .4byte gUnk_0862F468
_080BCE90: .4byte 0x06010000
_080BCE94: .4byte 0x0000FFE0
_080BCE98: .4byte 0x0000E0FF

	thumb_func_start sub_80BCE9C
sub_80BCE9C: @ 0x080BCE9C
	ldr r2, _080BCEB8 @ =gDispIo
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
_080BCEB8: .4byte gDispIo

	thumb_func_start sub_80BCEBC
sub_80BCEBC: @ 0x080BCEBC
	push {r4, r5, r6, lr}
	sub sp, #0x20
	adds r5, r0, #0
	mov r0, sp
	ldr r1, _080BCF88 @ =gUnk_086C4524
	ldm r1!, {r2, r3, r4}
	stm r0!, {r2, r3, r4}
	ldm r1!, {r2, r3, r4}
	stm r0!, {r2, r3, r4}
	ldm r1!, {r2, r3}
	stm r0!, {r2, r3}
	ldr r0, [r5, #0x2c]
	movs r1, #0xa
	bl __divsi3
	adds r6, r0, #0
	cmp r6, #0xf
	bgt _080BCF08
	ldr r4, _080BCF8C @ =gDispIo
	adds r2, r4, #0
	adds r2, #0x3c
	movs r0, #0x3f
	ldrb r1, [r2]
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r2]
	adds r2, #8
	movs r3, #0
	movs r1, #0x10
	movs r0, #0x10
	strb r0, [r2]
	subs r1, r1, r6
	adds r0, r4, #0
	adds r0, #0x45
	strb r1, [r0]
	adds r0, #1
	strb r3, [r0]
_080BCF08:
	ldr r4, [r5, #0x2c]
	adds r0, r4, #0
	movs r1, #0x10
	bl __modsi3
	cmp r0, #0
	bne _080BCF32
	adds r0, r4, #0
	movs r1, #0x10
	bl __divsi3
	adds r2, r0, #0
	cmp r2, #7
	bgt _080BCF32
	lsls r0, r2, #2
	add r0, sp
	ldr r1, [r0]
	adds r0, r2, #0
	adds r2, r5, #0
	bl sub_80BDB24
_080BCF32:
	ldr r0, [r5, #0x2c]
	cmp r0, #0xa0
	bne _080BCF78
	ldr r0, _080BCF90 @ =gBg1Tm
	movs r1, #0
	bl TmFill
	movs r0, #2
	bl EnableBgSync
	ldr r2, _080BCF8C @ =gDispIo
	adds r1, r2, #0
	adds r1, #0x3c
	movs r0, #0x3f
	ldrb r3, [r1]
	ands r0, r3
	strb r0, [r1]
	adds r0, r2, #0
	adds r0, #0x44
	movs r4, #0
	strb r4, [r0]
	adds r0, #1
	strb r4, [r0]
	adds r0, #1
	strb r4, [r0]
	movs r0, #0
	bl BmBgfxSetLoopEN
	adds r0, r5, #0
	bl Proc_Break
	ldr r0, _080BCF94 @ =gPal
	strh r4, [r0]
	bl EnablePalSync
_080BCF78:
	ldr r0, [r5, #0x2c]
	adds r0, #1
	str r0, [r5, #0x2c]
	add sp, #0x20
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080BCF88: .4byte gUnk_086C4524
_080BCF8C: .4byte gDispIo
_080BCF90: .4byte gBg1Tm
_080BCF94: .4byte gPal

	thumb_func_start sub_80BCF98
sub_80BCF98: @ 0x080BCF98
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _080BCFC0 @ =gpKeySt
	ldr r1, [r0]
	movs r0, #0xb
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _080BCFB8
	movs r0, #2
	bl SetNextGameAction
	ldr r0, [r4, #0x14]
	movs r1, #0x63
	bl Proc_Goto
_080BCFB8:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080BCFC0: .4byte gpKeySt

	thumb_func_start sub_80BCFC4
sub_80BCFC4: @ 0x080BCFC4
	push {lr}
	adds r1, r0, #0
	ldr r0, _080BCFD4 @ =ProcScr_08DB91A8
	bl Proc_Start
	pop {r0}
	bx r0
	.align 2, 0
_080BCFD4: .4byte ProcScr_08DB91A8

	thumb_func_start sub_80BCFD8
sub_80BCFD8: @ 0x080BCFD8
	push {lr}
	ldr r0, _080BCFE8 @ =ProcScr_08DB91A8
	bl Proc_Find
	bl Proc_End
	pop {r0}
	bx r0
	.align 2, 0
_080BCFE8: .4byte ProcScr_08DB91A8

	thumb_func_start sub_80BCFEC
sub_80BCFEC: @ 0x080BCFEC
	adds r1, r0, #0
	movs r2, #0
	b _080BCFF6
_080BCFF2:
	adds r2, #1
	adds r1, #0xc
_080BCFF6:
	ldr r0, [r1]
	cmp r0, #0
	bne _080BCFF2
	adds r0, r2, #0
	bx lr

	thumb_func_start sub_80BD000
sub_80BD000: @ 0x080BD000
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	ldr r0, _080BD098 @ =gUnk_08630338
	movs r1, #0xf0
	lsls r1, r1, #1
	movs r2, #0x20
	bl ApplyPaletteExt
	movs r4, #0
	str r4, [sp]
	ldr r1, _080BD09C @ =0x0600C000
	ldr r2, _080BD0A0 @ =0x01001000
	mov r0, sp
	bl CpuFastSet
	ldr r3, _080BD0A4 @ =gDispIo
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
	movs r0, #0x10
	strb r0, [r1]
	adds r0, r3, #0
	adds r0, #0x45
	strb r4, [r0]
	adds r0, #1
	strb r4, [r0]
	ldr r0, _080BD0A8 @ =0x0000FFE0
	ldrh r2, [r3, #0x3c]
	ands r0, r2
	movs r1, #1
	orrs r0, r1
	ldr r1, _080BD0AC @ =0x0000E0FF
	ands r0, r1
	movs r2, #0x80
	lsls r2, r2, #4
	adds r1, r2, #0
	orrs r0, r1
	strh r0, [r3, #0x3c]
	ldr r0, _080BD0B0 @ =gUnk_08DB95D8
	str r0, [r5, #0x3c]
	str r4, [r5, #0x2c]
	movs r1, #1
	str r1, [r5, #0x30]
	bl sub_80BCFEC
	str r0, [r5, #0x34]
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080BD098: .4byte gUnk_08630338
_080BD09C: .4byte 0x0600C000
_080BD0A0: .4byte 0x01001000
_080BD0A4: .4byte gDispIo
_080BD0A8: .4byte 0x0000FFE0
_080BD0AC: .4byte 0x0000E0FF
_080BD0B0: .4byte gUnk_08DB95D8

	thumb_func_start sub_80BD0B4
sub_80BD0B4: @ 0x080BD0B4
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x2c]
	movs r1, #3
	bl __modsi3
	cmp r0, #1
	beq _080BD0EC
	cmp r0, #1
	bgt _080BD0CE
	cmp r0, #0
	beq _080BD0D4
	b _080BD128
_080BD0CE:
	cmp r0, #2
	beq _080BD104
	b _080BD128
_080BD0D4:
	ldr r0, [r4, #0x3c]
	ldr r0, [r0]
	ldr r1, [r4, #0x30]
	lsls r1, r1, #0xd
	ldr r2, _080BD0E8 @ =0x0600C000
	adds r1, r1, r2
	bl Decompress
	b _080BD128
	.align 2, 0
_080BD0E8: .4byte 0x0600C000
_080BD0EC:
	ldr r0, [r4, #0x3c]
	ldr r0, [r0, #4]
	ldr r1, [r4, #0x30]
	lsls r1, r1, #0xd
	ldr r3, _080BD100 @ =0x0600D000
	adds r1, r1, r3
	bl Decompress
	b _080BD128
	.align 2, 0
_080BD100: .4byte 0x0600D000
_080BD104:
	ldr r0, _080BD18C @ =gBg3Tm
	ldr r1, [r4, #0x3c]
	ldr r1, [r1, #8]
	ldr r2, [r4, #0x30]
	lsls r2, r2, #0x18
	movs r3, #0xf2
	lsls r3, r3, #0x18
	adds r2, r2, r3
	lsrs r2, r2, #0x10
	bl TmApplyTsa_thm
	ldr r1, [r4, #0x30]
	movs r0, #1
	subs r0, r0, r1
	str r0, [r4, #0x30]
	movs r0, #8
	bl EnableBgSync
_080BD128:
	ldr r0, [r4, #0x2c]
	adds r5, r0, #1
	str r5, [r4, #0x2c]
	lsls r0, r5, #4
	ldr r6, [r4, #0x34]
	lsls r1, r6, #1
	adds r1, r1, r6
	bl __divsi3
	adds r7, r0, #0
	ldr r3, _080BD190 @ =gDispIo
	adds r2, r3, #0
	adds r2, #0x3c
	movs r0, #0x3f
	ldrb r1, [r2]
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r2]
	movs r0, #0x10
	subs r0, r0, r7
	lsls r2, r0, #1
	cmp r2, #0x10
	ble _080BD15A
	movs r2, #0x10
_080BD15A:
	adds r0, r3, #0
	adds r0, #0x44
	movs r1, #0
	strb r2, [r0]
	adds r0, #1
	strb r7, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r0, r5, #0
	movs r1, #3
	bl __modsi3
	cmp r0, #0
	bne _080BD194
	adds r0, r5, #0
	movs r1, #3
	bl __divsi3
	ldr r1, [r4, #0x3c]
	adds r1, #0xc
	str r1, [r4, #0x3c]
	cmp r0, r6
	bne _080BD194
	movs r0, #1
	b _080BD196
	.align 2, 0
_080BD18C: .4byte gBg3Tm
_080BD190: .4byte gDispIo
_080BD194:
	movs r0, #0
_080BD196:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	thumb_func_start sub_80BD19C
sub_80BD19C: @ 0x080BD19C
	push {r4, lr}
	adds r4, r0, #0
	ldr r2, _080BD1E4 @ =0x02007014
	ldr r0, [r2, #8]
	ldr r1, _080BD1E8 @ =0x000005FF
	cmp r0, r1
	bgt _080BD1B2
	movs r3, #0x80
	lsls r3, r3, #1
	adds r0, r0, r3
	str r0, [r2, #8]
_080BD1B2:
	ldr r0, [r2, #0xc]
	cmp r0, r1
	bgt _080BD1BC
	adds r0, #0x20
	str r0, [r2, #0xc]
_080BD1BC:
	ldr r1, [r2, #0x10]
	ldr r0, _080BD1EC @ =0x000008FF
	cmp r1, r0
	bgt _080BD1CA
	adds r0, r1, #0
	adds r0, #0x20
	str r0, [r2, #0x10]
_080BD1CA:
	adds r0, r4, #0
	bl sub_80BD0B4
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080BD1DC
	adds r0, r4, #0
	bl Proc_Break
_080BD1DC:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080BD1E4: .4byte 0x02007014
_080BD1E8: .4byte 0x000005FF
_080BD1EC: .4byte 0x000008FF

	thumb_func_start sub_80BD1F0
sub_80BD1F0: @ 0x080BD1F0
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	movs r6, #0
	str r6, [r5, #0x2c]
	ldr r0, _080BD2B0 @ =gUnk_08DB9674
	str r0, [r5, #0x3c]
	bl sub_80BCFEC
	str r0, [r5, #0x34]
	ldr r7, _080BD2B4 @ =gDispIo
	movs r2, #4
	rsbs r2, r2, #0
	adds r0, r2, #0
	ldrb r1, [r7, #0xc]
	ands r0, r1
	movs r1, #2
	orrs r0, r1
	strb r0, [r7, #0xc]
	movs r0, #3
	ldrb r1, [r7, #0x10]
	orrs r1, r0
	strb r1, [r7, #0x10]
	ldrb r1, [r7, #0x14]
	orrs r0, r1
	strb r0, [r7, #0x14]
	ldrb r0, [r7, #0x18]
	ands r2, r0
	movs r0, #1
	orrs r2, r0
	strb r2, [r7, #0x18]
	ldr r0, _080BD2B8 @ =gBg0Tm
	movs r1, #0
	bl TmFill
	movs r0, #1
	bl EnableBgSync
	ldr r4, _080BD2BC @ =0x03001620
	ldr r0, [r4]
	movs r1, #2
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r4]
	adds r2, r7, #0
	adds r2, #0x3c
	movs r0, #0x3f
	ldrb r1, [r2]
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r2]
	adds r1, r7, #0
	adds r1, #0x44
	movs r0, #0x10
	strb r0, [r1]
	adds r0, r7, #0
	adds r0, #0x45
	strb r6, [r0]
	adds r0, #1
	strb r6, [r0]
	ldr r0, _080BD2C0 @ =0x0000FFE0
	ldrh r2, [r7, #0x3c]
	ands r0, r2
	movs r1, #8
	orrs r0, r1
	ldr r1, _080BD2C4 @ =0x0000E0FF
	ands r0, r1
	movs r2, #0xf8
	lsls r2, r2, #5
	adds r1, r2, #0
	orrs r0, r1
	strh r0, [r7, #0x3c]
	ldr r0, [r5, #0x14]
	movs r1, #0
	bl Proc_Goto
	bl sub_80BBAFC
	ldr r1, _080BD2C8 @ =0x02007014
	movs r0, #0xc0
	lsls r0, r0, #2
	str r0, [r1, #8]
	str r0, [r1, #4]
	movs r0, #0xc8
	lsls r0, r0, #1
	str r0, [r1, #0xc]
	movs r0, #0xc8
	lsls r0, r0, #2
	str r0, [r1, #0x10]
	ldr r0, [r4]
	movs r1, #4
	orrs r0, r1
	str r0, [r4]
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080BD2B0: .4byte gUnk_08DB9674
_080BD2B4: .4byte gDispIo
_080BD2B8: .4byte gBg0Tm
_080BD2BC: .4byte 0x03001620
_080BD2C0: .4byte 0x0000FFE0
_080BD2C4: .4byte 0x0000E0FF
_080BD2C8: .4byte 0x02007014

	thumb_func_start sub_80BD2CC
sub_80BD2CC: @ 0x080BD2CC
	push {r4, lr}
	adds r4, r0, #0
	bl sub_80BD0B4
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080BD2FA
	movs r0, #0
	str r0, [r4, #0x2c]
	adds r0, r4, #0
	bl Proc_Break
	ldr r0, _080BD300 @ =gBg3Tm
	movs r1, #0
	bl TmFill
	movs r0, #8
	bl EnableBgSync
	ldr r0, [r4, #0x14]
	movs r1, #1
	bl Proc_Goto
_080BD2FA:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080BD300: .4byte gBg3Tm

	thumb_func_start sub_80BD304
sub_80BD304: @ 0x080BD304
	push {r4, r5, r6, lr}
	adds r1, r0, #0
	ldr r2, [r1, #0x2c]
	movs r0, #0xc8
	lsls r0, r0, #1
	cmp r2, r0
	bne _080BD31A
	adds r0, r1, #0
	bl Proc_Break
	b _080BD34E
_080BD31A:
	adds r0, r2, #1
	str r0, [r1, #0x2c]
	cmp r0, #0x8c
	ble _080BD34E
	subs r0, #0x8c
	movs r6, #0x80
	lsls r6, r6, #1
	cmp r0, r6
	bgt _080BD34E
	ldr r5, _080BD354 @ =0x02007014
	subs r0, r6, r0
	lsls r4, r0, #1
	adds r4, r4, r0
	lsls r4, r4, #3
	adds r4, r4, r0
	lsls r0, r4, #5
	adds r1, r6, #0
	bl __divsi3
	str r0, [r5, #0x10]
	lsls r4, r4, #4
	adds r0, r4, #0
	adds r1, r6, #0
	bl __divsi3
	str r0, [r5, #0xc]
_080BD34E:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080BD354: .4byte 0x02007014

	thumb_func_start sub_80BD358
sub_80BD358: @ 0x080BD358
	ldr r0, _080BD368 @ =0x03001620
	ldr r1, [r0]
	movs r2, #5
	rsbs r2, r2, #0
	ands r1, r2
	str r1, [r0]
	bx lr
	.align 2, 0
_080BD368: .4byte 0x03001620

	thumb_func_start sub_80BD36C
sub_80BD36C: @ 0x080BD36C
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #8
	bl sub_8003E68
	ldr r0, _080BD398 @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080BD388
	movs r0, #0x62
	bl m4aSongNumStart
_080BD388:
	ldr r0, _080BD39C @ =ProcScr_08DB91C0
	adds r1, r4, #0
	bl Proc_Start
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080BD398: .4byte gPlaySt
_080BD39C: .4byte ProcScr_08DB91C0

	thumb_func_start sub_80BD3A0
sub_80BD3A0: @ 0x080BD3A0
	push {lr}
	movs r1, #0
	str r1, [r0, #0x2c]
	bl sub_80BC730
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_80BD3B0
sub_80BD3B0: @ 0x080BD3B0
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r5, [r4, #0x2c]
	adds r3, r5, #1
	str r3, [r4, #0x2c]
	cmp r3, #0x40
	bgt _080BD3F2
	ldr r0, _080BD45C @ =gDispIo
	mov ip, r0
	adds r0, #0x3c
	movs r1, #0x3f
	ldrb r2, [r0]
	ands r1, r2
	movs r2, #0x40
	orrs r1, r2
	strb r1, [r0]
	adds r1, r3, #0
	cmp r1, #0
	bge _080BD3DA
	adds r1, r5, #0
	adds r1, #8
_080BD3DA:
	asrs r1, r1, #3
	mov r0, ip
	adds r0, #0x44
	movs r2, #0
	strb r1, [r0]
	mov r1, ip
	adds r1, #0x45
	movs r0, #0x10
	strb r0, [r1]
	mov r0, ip
	adds r0, #0x46
	strb r2, [r0]
_080BD3F2:
	ldr r1, [r4, #0x2c]
	lsls r1, r1, #0xf
	lsrs r1, r1, #0x10
	movs r0, #0
	movs r2, #0
	bl SetBgOffset
	ldr r1, [r4, #0x2c]
	ldr r0, [r4, #0x30]
	cmp r1, r0
	ble _080BD456
	subs r0, r1, r0
	cmp r0, #0
	bge _080BD410
	adds r0, #7
_080BD410:
	asrs r0, r0, #3
	movs r3, #8
	subs r3, r3, r0
	ldr r0, _080BD45C @ =gDispIo
	mov ip, r0
	mov r2, ip
	adds r2, #0x3c
	movs r0, #0x3f
	ldrb r1, [r2]
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r2]
	mov r0, ip
	adds r0, #0x44
	movs r1, #0
	strb r3, [r0]
	adds r2, #9
	movs r0, #0x10
	strb r0, [r2]
	mov r0, ip
	adds r0, #0x46
	strb r1, [r0]
	cmp r3, #0
	bne _080BD456
	adds r0, r4, #0
	bl Proc_Break
	ldr r0, _080BD460 @ =gBg0Tm
	movs r1, #0
	bl TmFill
	movs r0, #1
	bl EnableBgSync
_080BD456:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080BD45C: .4byte gDispIo
_080BD460: .4byte gBg0Tm

	thumb_func_start sub_80BD464
sub_80BD464: @ 0x080BD464
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _080BD478 @ =ProcScr_08DB9208
	bl Proc_Start
	str r4, [r0, #0x30]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080BD478: .4byte ProcScr_08DB9208

	thumb_func_start sub_80BD47C
sub_80BD47C: @ 0x080BD47C
	push {lr}
	movs r1, #0
	str r1, [r0, #0x2c]
	bl sub_80BC688
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_80BD48C
sub_80BD48C: @ 0x080BD48C
	push {r4, lr}
	ldr r4, [r0, #0x2c]
	adds r3, r4, #1
	str r3, [r0, #0x2c]
	cmp r3, #0x80
	bgt _080BD4D4
	ldr r0, _080BD4D0 @ =gDispIo
	mov ip, r0
	adds r0, #0x3c
	movs r1, #0x3f
	ldrb r2, [r0]
	ands r1, r2
	movs r2, #0x40
	orrs r1, r2
	strb r1, [r0]
	adds r1, r3, #0
	cmp r1, #0
	bge _080BD4B4
	adds r1, r4, #0
	adds r1, #8
_080BD4B4:
	asrs r1, r1, #3
	mov r0, ip
	adds r0, #0x44
	movs r2, #0
	strb r1, [r0]
	mov r1, ip
	adds r1, #0x45
	movs r0, #0x10
	strb r0, [r1]
	mov r0, ip
	adds r0, #0x46
	strb r2, [r0]
	b _080BD4D8
	.align 2, 0
_080BD4D0: .4byte gDispIo
_080BD4D4:
	bl Proc_Break
_080BD4D8:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_80BD4E0
sub_80BD4E0: @ 0x080BD4E0
	push {lr}
	adds r1, r0, #0
	ldr r0, _080BD4F0 @ =gUnk_08DB9228
	bl Proc_Start
	pop {r0}
	bx r0
	.align 2, 0
_080BD4F0: .4byte gUnk_08DB9228

	thumb_func_start sub_80BD4F4
sub_80BD4F4: @ 0x080BD4F4
	push {lr}
	sub sp, #8
	cmp r0, #0
	beq _080BD502
	cmp r0, #1
	beq _080BD518
	b _080BD526
_080BD502:
	str r0, [sp]
	ldr r1, _080BD510 @ =0x06014000
	ldr r2, _080BD514 @ =0x01000200
	mov r0, sp
	bl CpuFastSet
	b _080BD526
	.align 2, 0
_080BD510: .4byte 0x06014000
_080BD514: .4byte 0x01000200
_080BD518:
	movs r0, #0
	str r0, [sp, #4]
	add r0, sp, #4
	ldr r1, _080BD52C @ =0x06014800
	ldr r2, _080BD530 @ =0x01000600
	bl CpuFastSet
_080BD526:
	add sp, #8
	pop {r0}
	bx r0
	.align 2, 0
_080BD52C: .4byte 0x06014800
_080BD530: .4byte 0x01000600

	thumb_func_start sub_80BD534
sub_80BD534: @ 0x080BD534
	push {lr}
	adds r2, r1, #0
	ldr r1, _080BD548 @ =gUnk_08DB8FC0
	ldr r1, [r1]
	adds r1, r1, r2
	bl Decompress
	pop {r0}
	bx r0
	.align 2, 0
_080BD548: .4byte gUnk_08DB8FC0

	thumb_func_start sub_80BD54C
sub_80BD54C: @ 0x080BD54C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x14
	str r2, [sp]
	str r3, [sp, #4]
	ldr r4, [sp, #0x3c]
	ldr r0, [sp, #0x34]
	muls r4, r0, r4
	movs r1, #0
	mov sb, r1
	cmp sb, r3
	bge _080BD5F6
_080BD56A:
	movs r3, #0
	mov r0, sb
	adds r0, #1
	str r0, [sp, #8]
	ldr r1, [sp]
	cmp r3, r1
	bge _080BD5EC
	ldr r0, _080BD608 @ =gUnk_08DB9248
	str r0, [sp, #0xc]
	ldr r1, _080BD60C @ =gUnk_08DB8FC0
	str r1, [sp, #0x10]
_080BD580:
	adds r0, r3, #1
	mov sl, r0
	ldr r1, [sp, #0x34]
	cmp r1, #0
	ble _080BD5E4
	movs r0, #0x3f
	mov ip, r0
	lsls r7, r3, #5
	mov r1, sb
	lsls r6, r1, #0xa
	ldr r0, [sp, #0x10]
	mov r8, r0
	ldr r5, [sp, #0x34]
_080BD59A:
	mov r1, ip
	ands r4, r1
	mov r0, r8
	ldr r2, [r0]
	ldr r1, [sp, #0x38]
	adds r2, r2, r1
	adds r2, r2, r7
	adds r2, r2, r6
	adds r3, r7, r1
	adds r3, r3, r6
	ldr r0, _080BD610 @ =0x06014000
	adds r3, r3, r0
	adds r0, r4, #0
	mov r1, ip
	ands r0, r1
	lsls r0, r0, #1
	ldr r1, _080BD608 @ =gUnk_08DB9248
	adds r0, r0, r1
	ldrh r1, [r0]
	lsrs r0, r1, #3
	lsls r0, r0, #2
	adds r2, r2, r0
	adds r3, r3, r0
	movs r0, #7
	ands r0, r1
	lsls r0, r0, #2
	movs r1, #0xf
	lsls r1, r0
	ldr r2, [r2]
	ands r2, r1
	ldr r0, [r3]
	orrs r0, r2
	str r0, [r3]
	adds r4, #1
	subs r5, #1
	cmp r5, #0
	bne _080BD59A
_080BD5E4:
	mov r3, sl
	ldr r0, [sp]
	cmp r3, r0
	blt _080BD580
_080BD5EC:
	ldr r1, [sp, #8]
	mov sb, r1
	ldr r0, [sp, #4]
	cmp sb, r0
	blt _080BD56A
_080BD5F6:
	add sp, #0x14
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080BD608: .4byte gUnk_08DB9248
_080BD60C: .4byte gUnk_08DB8FC0
_080BD610: .4byte 0x06014000

	thumb_func_start sub_80BD614
sub_80BD614: @ 0x080BD614
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x14
	str r2, [sp]
	str r3, [sp, #4]
	ldr r4, [sp, #0x3c]
	ldr r0, [sp, #0x34]
	muls r4, r0, r4
	movs r1, #0
	mov sb, r1
	cmp sb, r3
	bge _080BD6BE
_080BD632:
	movs r3, #0
	mov r0, sb
	adds r0, #1
	str r0, [sp, #8]
	ldr r1, [sp]
	cmp r3, r1
	bge _080BD6B4
	ldr r0, _080BD6D0 @ =gUnk_08DB9248
	str r0, [sp, #0xc]
	ldr r1, _080BD6D4 @ =gUnk_08DB8FC0
	str r1, [sp, #0x10]
_080BD648:
	adds r0, r3, #1
	mov sl, r0
	ldr r1, [sp, #0x34]
	cmp r1, #0
	ble _080BD6AC
	movs r0, #0x3f
	mov ip, r0
	lsls r7, r3, #5
	mov r1, sb
	lsls r6, r1, #0xa
	ldr r0, [sp, #0x10]
	mov r8, r0
	ldr r5, [sp, #0x34]
_080BD662:
	mov r1, ip
	ands r4, r1
	mov r0, r8
	ldr r2, [r0]
	ldr r1, [sp, #0x38]
	adds r2, r2, r1
	adds r2, r2, r7
	adds r2, r2, r6
	adds r3, r7, r1
	adds r3, r3, r6
	ldr r0, _080BD6D8 @ =0x06014000
	adds r3, r3, r0
	adds r0, r4, #0
	mov r1, ip
	ands r0, r1
	lsls r0, r0, #1
	ldr r1, _080BD6D0 @ =gUnk_08DB9248
	adds r0, r0, r1
	ldrh r1, [r0]
	lsrs r0, r1, #3
	lsls r0, r0, #2
	adds r2, r2, r0
	adds r3, r3, r0
	movs r0, #7
	ands r0, r1
	lsls r0, r0, #2
	movs r1, #0xf
	lsls r1, r0
	ldr r2, [r2]
	bics r2, r1
	ldr r0, [r3]
	ands r0, r2
	str r0, [r3]
	adds r4, #1
	subs r5, #1
	cmp r5, #0
	bne _080BD662
_080BD6AC:
	mov r3, sl
	ldr r0, [sp]
	cmp r3, r0
	blt _080BD648
_080BD6B4:
	ldr r1, [sp, #8]
	mov sb, r1
	ldr r0, [sp, #4]
	cmp sb, r0
	blt _080BD632
_080BD6BE:
	add sp, #0x14
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080BD6D0: .4byte gUnk_08DB9248
_080BD6D4: .4byte gUnk_08DB8FC0
_080BD6D8: .4byte 0x06014000

	thumb_func_start sub_80BD6DC
sub_80BD6DC: @ 0x080BD6DC
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r0, _080BD704 @ =gUnk_086284F8
	movs r1, #0x88
	lsls r1, r1, #2
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r0, _080BD708 @ =gUnk_08DB947C
	str r0, [r5, #0x2c]
	movs r4, #0
	str r4, [r5, #0x38]
	movs r0, #0
	bl sub_80BD4F4
	str r4, [r5, #0x3c]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080BD704: .4byte gUnk_086284F8
_080BD708: .4byte gUnk_08DB947C

	thumb_func_start sub_80BD70C
sub_80BD70C: @ 0x080BD70C
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #0xc
	adds r4, r0, #0
	ldr r0, [r4, #0x3c]
	cmp r0, #0
	bne _080BD744
	ldr r0, [r4, #0x2c]
	bl sub_80BE0B4
	str r0, [r4, #0x30]
	cmp r0, #0
	bne _080BD744
	ldr r0, [r4, #0x2c]
	ldr r0, [r0, #8]
	cmp r0, #0
	bne _080BD73C
	adds r0, r4, #0
	movs r1, #0x63
	bl Proc_Goto
	b _080BD7BA
_080BD73C:
	adds r0, r4, #0
	bl Proc_Break
	b _080BD7BA
_080BD744:
	movs r0, #0xe0
	ldr r1, [r4, #0x30]
	muls r0, r1, r0
	ldr r6, [r4, #0x3c]
	cmp r6, r0
	bge _080BD7B4
	adds r0, r6, #0
	movs r1, #0xe0
	bl __modsi3
	adds r5, r0, #0
	adds r1, r5, #0
	cmp r5, #0
	bge _080BD762
	adds r1, #0xf
_080BD762:
	asrs r7, r1, #4
	lsls r0, r7, #1
	mov sb, r0
	adds r0, r6, #0
	movs r1, #0xe0
	bl __divsi3
	adds r6, r0, #0
	lsls r0, r6, #1
	mov r8, r0
	cmp r5, #0
	bne _080BD78C
	ldr r0, [r4, #0x2c]
	lsls r1, r6, #2
	adds r0, r0, r1
	ldr r0, [r0]
	lsls r2, r6, #0xb
	ldr r1, [r4, #0x38]
	adds r1, r1, r2
	bl sub_80BD534
_080BD78C:
	movs r0, #4
	str r0, [sp]
	lsls r1, r7, #6
	ldr r0, [r4, #0x38]
	adds r0, r0, r1
	lsls r1, r6, #0xb
	adds r0, r0, r1
	str r0, [sp, #4]
	ldr r0, [r4, #0x3c]
	str r0, [sp, #8]
	mov r0, sb
	mov r1, r8
	movs r2, #2
	movs r3, #2
	bl sub_80BD54C
	ldr r0, [r4, #0x3c]
	adds r0, #1
	str r0, [r4, #0x3c]
	b _080BD7BA
_080BD7B4:
	adds r0, r4, #0
	bl Proc_Break
_080BD7BA:
	add sp, #0xc
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_80BD7C8
sub_80BD7C8: @ 0x080BD7C8
	push {lr}
	adds r2, r0, #0
	ldr r1, [r2, #0x3c]
	adds r1, #1
	str r1, [r2, #0x3c]
	ldr r0, [r2, #0x2c]
	ldr r0, [r0, #8]
	subs r0, #0x20
	cmp r1, r0
	blt _080BD7E6
	movs r0, #0
	str r0, [r2, #0x3c]
	adds r0, r2, #0
	bl Proc_Break
_080BD7E6:
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_80BD7EC
sub_80BD7EC: @ 0x080BD7EC
	push {r4, lr}
	sub sp, #0xc
	adds r4, r0, #0
	ldr r1, [r4, #0x3c]
	cmp r1, #0x1f
	bgt _080BD818
	ldr r3, [r4, #0x30]
	lsls r3, r3, #1
	movs r0, #2
	str r0, [sp]
	ldr r0, [r4, #0x38]
	str r0, [sp, #4]
	str r1, [sp, #8]
	movs r0, #0
	movs r1, #0
	movs r2, #0x1e
	bl sub_80BD614
	ldr r0, [r4, #0x3c]
	adds r0, #1
	str r0, [r4, #0x3c]
	b _080BD828
_080BD818:
	movs r0, #0
	str r0, [r4, #0x3c]
	ldr r0, [r4, #0x2c]
	adds r0, #0xc
	str r0, [r4, #0x2c]
	adds r0, r4, #0
	bl Proc_Break
_080BD828:
	add sp, #0xc
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_80BD830
sub_80BD830: @ 0x080BD830
	push {lr}
	movs r0, #0
	bl sub_80BD4F4
	pop {r0}
	bx r0

	thumb_func_start sub_80BD83C
sub_80BD83C: @ 0x080BD83C
	push {lr}
	adds r1, r0, #0
	ldr r0, _080BD84C @ =gUnk_08DB92C8
	bl Proc_Start
	pop {r0}
	bx r0
	.align 2, 0
_080BD84C: .4byte gUnk_08DB92C8

	thumb_func_start sub_80BD850
sub_80BD850: @ 0x080BD850
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _080BD87C @ =gUnk_086284F8
	movs r1, #0x88
	lsls r1, r1, #2
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r0, _080BD880 @ =gUnk_08DB9548
	str r0, [r4, #0x2c]
	movs r0, #0x80
	lsls r0, r0, #4
	str r0, [r4, #0x38]
	movs r0, #1
	bl sub_80BD4F4
	movs r0, #0
	str r0, [r4, #0x3c]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080BD87C: .4byte gUnk_086284F8
_080BD880: .4byte gUnk_08DB9548

	thumb_func_start sub_80BD884
sub_80BD884: @ 0x080BD884
	push {r4, r5, lr}
	sub sp, #0xc
	adds r4, r0, #0
	ldr r0, [r4, #0x3c]
	cmp r0, #0
	bne _080BD8CE
	ldr r0, [r4, #0x2c]
	bl sub_80BE0B4
	str r0, [r4, #0x30]
	cmp r0, #0
	bne _080BD8AE
	ldr r0, [r4, #0x2c]
	ldr r0, [r0, #8]
	cmp r0, #0
	bne _080BD8D4
	adds r0, r4, #0
	movs r1, #0x63
	bl Proc_Goto
	b _080BD8FA
_080BD8AE:
	movs r5, #0
	cmp r5, r0
	bge _080BD8CE
_080BD8B4:
	ldr r0, [r4, #0x2c]
	lsls r1, r5, #2
	adds r0, r0, r1
	ldr r0, [r0]
	lsls r2, r5, #0xb
	ldr r1, [r4, #0x38]
	adds r1, r1, r2
	bl sub_80BD534
	adds r5, #1
	ldr r0, [r4, #0x30]
	cmp r5, r0
	blt _080BD8B4
_080BD8CE:
	ldr r1, [r4, #0x3c]
	cmp r1, #0x3f
	ble _080BD8DC
_080BD8D4:
	adds r0, r4, #0
	bl Proc_Break
	b _080BD8FA
_080BD8DC:
	ldr r3, [r4, #0x30]
	lsls r3, r3, #1
	movs r0, #1
	str r0, [sp]
	ldr r0, [r4, #0x38]
	str r0, [sp, #4]
	str r1, [sp, #8]
	movs r0, #0
	movs r1, #0
	movs r2, #0x1e
	bl sub_80BD54C
	ldr r0, [r4, #0x3c]
	adds r0, #1
	str r0, [r4, #0x3c]
_080BD8FA:
	add sp, #0xc
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_80BD904
sub_80BD904: @ 0x080BD904
	push {lr}
	adds r2, r0, #0
	ldr r1, [r2, #0x3c]
	adds r1, #1
	str r1, [r2, #0x3c]
	ldr r0, [r2, #0x2c]
	ldr r0, [r0, #8]
	subs r0, #0x20
	cmp r1, r0
	blt _080BD922
	movs r0, #0
	str r0, [r2, #0x3c]
	adds r0, r2, #0
	bl Proc_Break
_080BD922:
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_80BD928
sub_80BD928: @ 0x080BD928
	push {r4, lr}
	sub sp, #0xc
	adds r4, r0, #0
	ldr r1, [r4, #0x3c]
	cmp r1, #0x1f
	bgt _080BD954
	ldr r3, [r4, #0x30]
	lsls r3, r3, #1
	movs r0, #2
	str r0, [sp]
	ldr r0, [r4, #0x38]
	str r0, [sp, #4]
	str r1, [sp, #8]
	movs r0, #0
	movs r1, #0
	movs r2, #0x1e
	bl sub_80BD614
	ldr r0, [r4, #0x3c]
	adds r0, #1
	str r0, [r4, #0x3c]
	b _080BD964
_080BD954:
	movs r0, #0
	str r0, [r4, #0x3c]
	ldr r0, [r4, #0x2c]
	adds r0, #0xc
	str r0, [r4, #0x2c]
	adds r0, r4, #0
	bl Proc_Break
_080BD964:
	add sp, #0xc
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_80BD96C
sub_80BD96C: @ 0x080BD96C
	push {lr}
	movs r0, #1
	bl sub_80BD4F4
	pop {r0}
	bx r0

	thumb_func_start sub_80BD978
sub_80BD978: @ 0x080BD978
	push {lr}
	adds r1, r0, #0
	ldr r0, _080BD988 @ =gUnk_08DB9320
	bl Proc_Start
	pop {r0}
	bx r0
	.align 2, 0
_080BD988: .4byte gUnk_08DB9320

	thumb_func_start sub_80BD98C
sub_80BD98C: @ 0x080BD98C
	movs r1, #0
	strh r1, [r0, #0x2e]
	ldrh r1, [r0, #0x2c]
	lsrs r2, r1, #2
	lsls r2, r2, #0xd
	movs r3, #3
	ands r1, r3
	lsls r1, r1, #8
	adds r2, r2, r1
	strh r2, [r0, #0x30]
	movs r2, #0xff
	lsls r2, r2, #8
	adds r0, #0x32
	movs r1, #3
_080BD9A8:
	strh r2, [r0]
	strh r2, [r0, #8]
	adds r0, #2
	subs r1, #1
	cmp r1, #0
	bge _080BD9A8
	bx lr
	.align 2, 0

	thumb_func_start sub_80BD9B8
sub_80BD9B8: @ 0x080BD9B8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	str r0, [sp, #4]
	movs r0, #0x40
	movs r4, #0x80
	ldr r1, [sp, #4]
	ldrh r1, [r1, #0x2e]
	subs r0, r0, r1
	lsls r1, r0, #7
	muls r0, r1, r0
	movs r1, #0x80
	lsls r1, r1, #5
	bl __divsi3
	subs r4, r4, r0
	lsls r0, r4, #9
	movs r1, #0x80
	bl __divsi3
	movs r1, #0x80
	lsls r1, r1, #2
	subs r7, r1, r0
	ldr r0, [sp, #4]
	ldrh r0, [r0, #0x2a]
	adds r2, r0, r4
	movs r4, #0xff
	adds r0, r2, #0
	ands r0, r4
	movs r1, #0x80
	lsls r1, r1, #1
	subs r1, r1, r0
	mov sl, r1
	movs r0, #0xb4
	muls r0, r7, r0
	cmp r0, #0
	bge _080BDA0C
	ldr r1, _080BDA28 @ =0x000001FF
	adds r0, r0, r1
_080BDA0C:
	asrs r3, r0, #9
	movs r0, #0x64
	muls r0, r7, r0
	cmp r0, #0
	bge _080BDA1A
	ldr r1, _080BDA28 @ =0x000001FF
	adds r0, r0, r1
_080BDA1A:
	asrs r6, r0, #9
	cmp r7, #7
	bgt _080BDA2C
	ldr r0, [sp, #4]
	bl Proc_Break
	b _080BDB08
	.align 2, 0
_080BDA28: .4byte 0x000001FF
_080BDA2C:
	ldr r5, _080BDB18 @ =gSinLut
	adds r1, r2, #0
	subs r1, #0x40
	ands r1, r4
	lsls r0, r1, #1
	adds r0, r0, r5
	movs r2, #0
	ldrsh r0, [r0, r2]
	adds r2, r0, #0
	muls r2, r3, r2
	asrs r2, r2, #0xc
	mov r8, r2
	movs r0, #0x38
	add r8, r0
	ldr r0, _080BDB1C @ =0x000001FF
	mov r2, r8
	ands r2, r0
	mov r8, r2
	adds r1, #0x40
	lsls r1, r1, #1
	adds r1, r1, r5
	movs r2, #0
	ldrsh r0, [r1, r2]
	muls r0, r6, r0
	asrs r0, r0, #0xc
	movs r1, #0x10
	mov sb, r1
	mov r2, sb
	subs r2, r2, r0
	ands r2, r4
	mov sb, r2
	mov r0, sl
	ands r4, r0
	adds r6, r4, #0
	adds r6, #0x40
	lsls r6, r6, #1
	adds r6, r6, r5
	movs r1, #0
	ldrsh r0, [r6, r1]
	lsls r0, r0, #4
	adds r1, r7, #0
	bl Div
	mov sl, r0
	mov r2, sl
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	mov sl, r2
	lsls r4, r4, #1
	adds r4, r4, r5
	movs r1, #0
	ldrsh r0, [r4, r1]
	rsbs r0, r0, #0
	lsls r0, r0, #4
	adds r1, r7, #0
	bl Div
	adds r5, r0, #0
	lsls r5, r5, #0x10
	asrs r5, r5, #0x10
	movs r2, #0
	ldrsh r0, [r4, r2]
	lsls r0, r0, #4
	adds r1, r7, #0
	bl Div
	adds r4, r0, #0
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	movs r1, #0
	ldrsh r0, [r6, r1]
	lsls r0, r0, #4
	adds r1, r7, #0
	bl Div
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	ldr r2, [sp, #4]
	ldrh r1, [r2, #0x2c]
	str r0, [sp]
	adds r0, r1, #0
	mov r1, sl
	adds r2, r5, #0
	adds r3, r4, #0
	bl SetObjAffine
	ldr r1, [sp, #4]
	ldrh r1, [r1, #0x2c]
	lsls r0, r1, #9
	add r8, r0
	movs r0, #0xc0
	lsls r0, r0, #2
	add sb, r0
	ldr r3, _080BDB20 @ =Sprite_64x64
	ldr r2, [sp, #4]
	ldrh r2, [r2, #0x30]
	lsrs r0, r2, #5
	movs r1, #0x80
	lsls r1, r1, #8
	adds r0, r0, r1
	str r0, [sp]
	movs r0, #4
	mov r1, r8
	mov r2, sb
	bl PutSpriteExt
	ldr r1, [sp, #4]
	ldrh r0, [r1, #0x2e]
	adds r0, #1
	strh r0, [r1, #0x2e]
_080BDB08:
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080BDB18: .4byte gSinLut
_080BDB1C: .4byte 0x000001FF
_080BDB20: .4byte Sprite_64x64

	thumb_func_start sub_80BDB24
sub_80BDB24: @ 0x080BDB24
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r1, r2, #0
	ldr r0, _080BDB3C @ =gUnk_08DB9378
	bl Proc_Start
	strh r4, [r0, #0x2c]
	strh r5, [r0, #0x2a]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080BDB3C: .4byte gUnk_08DB9378

	thumb_func_start sub_80BDB40
sub_80BDB40: @ 0x080BDB40
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	mov r8, r0
	mov ip, r1
	adds r5, r3, #0
	lsls r2, r2, #5
	ldr r0, _080BDBE0 @ =gPal
	adds r7, r2, r0
	movs r0, #0x80
	lsls r0, r0, #1
	subs r6, r0, r5
	movs r0, #0xf8
	lsls r0, r0, #7
	mov sl, r0
	movs r0, #0xf
	mov sb, r0
_080BDB66:
	mov r0, r8
	ldrh r4, [r0]
	movs r0, #0x1f
	ands r0, r4
	adds r2, r0, #0
	muls r2, r5, r2
	mov r0, ip
	ldrh r3, [r0]
	movs r0, #0x1f
	ands r0, r3
	muls r0, r6, r0
	adds r2, r2, r0
	asrs r2, r2, #8
	movs r0, #0x1f
	ands r2, r0
	movs r0, #0xf8
	lsls r0, r0, #2
	ands r0, r4
	adds r1, r0, #0
	muls r1, r5, r1
	movs r0, #0xf8
	lsls r0, r0, #2
	ands r0, r3
	muls r0, r6, r0
	adds r1, r1, r0
	asrs r1, r1, #8
	movs r0, #0xf8
	lsls r0, r0, #2
	ands r1, r0
	adds r2, r2, r1
	mov r0, sl
	ands r0, r4
	adds r1, r0, #0
	muls r1, r5, r1
	mov r0, sl
	ands r0, r3
	muls r0, r6, r0
	adds r1, r1, r0
	asrs r1, r1, #8
	mov r0, sl
	ands r1, r0
	adds r2, r2, r1
	strh r2, [r7]
	adds r7, #2
	movs r0, #2
	add r8, r0
	add ip, r0
	subs r0, #3
	add sb, r0
	mov r0, sb
	cmp r0, #0
	bge _080BDB66
	bl EnablePalSync
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080BDBE0: .4byte gPal

	thumb_func_start sub_80BDBE4
sub_80BDBE4: @ 0x080BDBE4
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x30]
	ldr r1, [r4, #0x2c]
	adds r0, r0, r1
	str r0, [r4, #0x30]
	movs r5, #0x80
	lsls r5, r5, #1
	cmp r0, r5
	ble _080BDBFA
	str r5, [r4, #0x30]
_080BDBFA:
	ldr r0, [r4, #0x30]
	cmp r0, #0
	bge _080BDC04
	movs r0, #0
	str r0, [r4, #0x30]
_080BDC04:
	ldr r0, _080BDC28 @ =0x020072DC
	adds r1, r0, #0
	subs r1, #0x20
	ldr r2, [r4, #0x34]
	ldr r3, [r4, #0x30]
	bl sub_80BDB40
	ldr r0, [r4, #0x30]
	cmp r0, r5
	beq _080BDC1C
	cmp r0, #0
	bne _080BDC22
_080BDC1C:
	adds r0, r4, #0
	bl Proc_Break
_080BDC22:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080BDC28: .4byte 0x020072DC

	thumb_func_start sub_80BDC2C
sub_80BDC2C: @ 0x080BDC2C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	adds r4, r0, #0
	adds r7, r1, #0
	adds r6, r2, #0
	mov r8, r3
	ldr r1, [sp, #0x1c]
	ldr r0, _080BDC60 @ =gUnk_08DB9398
	bl Proc_Start
	adds r5, r0, #0
	movs r0, #1
	rsbs r0, r0, #0
	cmp r4, r0
	bne _080BDC6C
	lsls r0, r6, #5
	ldr r1, _080BDC64 @ =gPal
	adds r0, r0, r1
	ldr r1, _080BDC68 @ =0x020072BC
	movs r2, #8
	bl CpuFastSet
	b _080BDC92
	.align 2, 0
_080BDC60: .4byte gUnk_08DB9398
_080BDC64: .4byte gPal
_080BDC68: .4byte 0x020072BC
_080BDC6C:
	cmp r4, #0
	bne _080BDC88
	str r4, [sp]
	ldr r1, _080BDC80 @ =0x020072BC
	ldr r2, _080BDC84 @ =0x01000008
	mov r0, sp
	bl CpuFastSet
	b _080BDC92
	.align 2, 0
_080BDC80: .4byte 0x020072BC
_080BDC84: .4byte 0x01000008
_080BDC88:
	ldr r1, _080BDCB8 @ =0x020072BC
	adds r0, r4, #0
	movs r2, #8
	bl CpuFastSet
_080BDC92:
	ldr r1, _080BDCBC @ =0x020072DC
	adds r0, r7, #0
	movs r2, #8
	bl CpuFastSet
	movs r0, #0
	str r0, [r5, #0x30]
	str r6, [r5, #0x34]
	mov r0, r8
	str r0, [r5, #0x2c]
	bl EnablePalSync
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080BDCB8: .4byte 0x020072BC
_080BDCBC: .4byte 0x020072DC

	thumb_func_start sub_80BDCC0
sub_80BDCC0: @ 0x080BDCC0
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x2c]
	lsls r0, r0, #2
	ldr r1, [r4, #0x30]
	adds r1, r1, r0
	str r1, [r4, #0x30]
	movs r5, #0x80
	lsls r5, r5, #1
	cmp r1, r5
	ble _080BDCD8
	str r5, [r4, #0x30]
_080BDCD8:
	ldr r0, _080BDCF8 @ =0x020072DC
	adds r1, r0, #0
	subs r1, #0x20
	ldr r2, [r4, #0x34]
	ldr r3, [r4, #0x30]
	bl sub_80BDB40
	ldr r0, [r4, #0x30]
	cmp r0, r5
	bne _080BDCF2
	adds r0, r4, #0
	bl Proc_Break
_080BDCF2:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080BDCF8: .4byte 0x020072DC

	thumb_func_start sub_80BDCFC
sub_80BDCFC: @ 0x080BDCFC
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x30]
	ldr r1, [r4, #0x2c]
	subs r0, r0, r1
	str r0, [r4, #0x30]
	cmp r0, #0
	bge _080BDD10
	movs r0, #0
	str r0, [r4, #0x30]
_080BDD10:
	ldr r0, _080BDD30 @ =0x020072DC
	adds r1, r0, #0
	subs r1, #0x20
	ldr r2, [r4, #0x34]
	ldr r3, [r4, #0x30]
	bl sub_80BDB40
	ldr r0, [r4, #0x30]
	cmp r0, #0
	bne _080BDD2A
	adds r0, r4, #0
	bl Proc_Break
_080BDD2A:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080BDD30: .4byte 0x020072DC

	thumb_func_start sub_80BDD34
sub_80BDD34: @ 0x080BDD34
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	adds r6, r0, #0
	adds r7, r1, #0
	adds r5, r2, #0
	mov r8, r3
	ldr r0, [sp, #0x2c]
	ldr r4, [sp, #0x30]
	ldr r1, [sp, #0x34]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp]
	ldr r0, _080BDD80 @ =gUnk_08DB93B0
	bl Proc_Start
	movs r1, #0
	str r1, [r0, #0x30]
	str r5, [r0, #0x34]
	str r4, [r0, #0x2c]
	bl EnablePalSync
	movs r0, #1
	rsbs r0, r0, #0
	cmp r6, r0
	bne _080BDD8C
	lsls r0, r5, #5
	ldr r1, _080BDD84 @ =gPal
	adds r0, r0, r1
	ldr r1, _080BDD88 @ =0x020072BC
	movs r2, #8
	bl CpuFastSet
	b _080BDD96
	.align 2, 0
_080BDD80: .4byte gUnk_08DB93B0
_080BDD84: .4byte gPal
_080BDD88: .4byte 0x020072BC
_080BDD8C:
	ldr r1, _080BDE18 @ =0x020072BC
	adds r0, r6, #0
	movs r2, #8
	bl CpuFastSet
_080BDD96:
	movs r0, #1
	rsbs r0, r0, #0
	cmp r7, r0
	bne _080BDE32
	movs r0, #0
	mov ip, r0
	ldr r0, _080BDE18 @ =0x020072BC
	movs r1, #0x1f
	mov sl, r1
	mov r6, sl
	mov r5, r8
	ands r6, r5
	lsls r1, r6, #0xa
	str r1, [sp, #4]
	adds r7, r0, #0
	movs r5, #0x20
	adds r5, r5, r7
	mov sb, r5
_080BDDBA:
	ldr r0, [sp]
	mov r1, ip
	asrs r0, r1
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _080BDE1C
	ldrh r2, [r7]
	movs r5, #0x1f
	mov r8, r5
	mov r3, sl
	ands r3, r2
	movs r4, #0xf8
	lsls r4, r4, #2
	adds r0, r4, #0
	ands r0, r2
	lsls r1, r6, #5
	adds r0, r0, r1
	str r0, [sp, #8]
	movs r1, #0xf8
	lsls r1, r1, #7
	adds r0, r1, #0
	ands r0, r2
	ldr r5, [sp, #4]
	adds r2, r0, r5
	adds r3, r3, r6
	cmp r3, #0x1f
	ble _080BDDF4
	movs r3, #0x1f
_080BDDF4:
	mov r0, r8
	ands r3, r0
	ldr r0, [sp, #8]
	cmp r0, r4
	ble _080BDE00
	adds r0, r4, #0
_080BDE00:
	ands r0, r4
	adds r3, r3, r0
	adds r0, r2, #0
	cmp r0, r1
	ble _080BDE0C
	adds r0, r1, #0
_080BDE0C:
	ands r0, r1
	adds r0, r3, r0
	mov r1, sb
	strh r0, [r1]
	b _080BDE20
	.align 2, 0
_080BDE18: .4byte 0x020072BC
_080BDE1C:
	ldrh r0, [r7]
	strh r0, [r7, #0x20]
_080BDE20:
	adds r7, #2
	movs r5, #2
	add sb, r5
	movs r0, #1
	add ip, r0
	mov r1, ip
	cmp r1, #0xf
	ble _080BDDBA
	b _080BDE50
_080BDE32:
	ldr r4, _080BDE60 @ =0x020072DC
	adds r0, r7, #0
	adds r1, r4, #0
	movs r2, #8
	bl CpuFastSet
	lsls r1, r5, #5
	ldr r0, _080BDE64 @ =gPal
	adds r1, r1, r0
	adds r0, r4, #0
	movs r2, #8
	bl CpuFastSet
	bl EnablePalSync
_080BDE50:
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080BDE60: .4byte 0x020072DC
_080BDE64: .4byte gPal

	thumb_func_start sub_80BDE68
sub_80BDE68: @ 0x080BDE68
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	sub sp, #8
	adds r4, r0, #0
	ldr r6, _080BDEB8 @ =gUnk_086C0C4C
	movs r0, #0x36
	ldrsh r1, [r4, r0]
	movs r0, #0x3e
	ldrsh r2, [r4, r0]
	movs r0, #0xe6
	lsls r0, r0, #6
	mov r8, r0
	movs r0, #5
	str r0, [sp]
	movs r5, #0xa
	str r5, [sp, #4]
	adds r0, r6, #0
	mov r3, r8
	bl StartSpriteAnimProc
	str r0, [r4, #0x2c]
	movs r0, #0x3a
	ldrsh r1, [r4, r0]
	ldr r2, [r4, #0x40]
	asrs r2, r2, #0x10
	movs r0, #6
	str r0, [sp]
	str r5, [sp, #4]
	adds r0, r6, #0
	mov r3, r8
	bl StartSpriteAnimProc
	str r0, [r4, #0x30]
	add sp, #8
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080BDEB8: .4byte gUnk_086C0C4C

	thumb_func_start sub_80BDEBC
sub_80BDEBC: @ 0x080BDEBC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	adds r6, r0, #0
	movs r0, #0
	mov sb, r0
	ldr r1, _080BDF38 @ =0x02007508
	mov sl, r1
_080BDED0:
	mov r3, sb
	lsls r5, r3, #2
	adds r0, r6, #0
	adds r0, #0x2c
	adds r0, r0, r5
	mov r8, r0
	ldr r7, [r0]
	cmp r7, #0
	beq _080BDF4E
	adds r2, r6, #0
	adds r2, #0x44
	adds r2, r2, r5
	ldr r0, [r2]
	mov r3, sl
	ldr r1, [r3, #8]
	adds r0, r0, r1
	str r0, [r2]
	adds r4, r6, #0
	adds r4, #0x4c
	adds r4, r4, r5
	ldr r0, [r4]
	ldr r1, [r3, #0xc]
	adds r0, r0, r1
	str r0, [r4]
	adds r3, r6, #0
	adds r3, #0x34
	adds r3, r3, r5
	ldr r0, [r3]
	ldr r1, [r2]
	adds r0, r0, r1
	str r0, [r3]
	adds r1, r6, #0
	adds r1, #0x3c
	adds r1, r1, r5
	ldr r2, [r1]
	ldr r0, [r4]
	adds r2, r2, r0
	str r2, [r1]
	movs r0, #2
	ldrsh r1, [r3, r0]
	asrs r2, r2, #0x10
	cmp r1, #0xf0
	bhi _080BDF2A
	cmp r2, #0
	bge _080BDF3C
_080BDF2A:
	adds r0, r7, #0
	bl EndSpriteAnimProc
	movs r0, #0
	mov r1, r8
	str r0, [r1]
	b _080BDF4E
	.align 2, 0
_080BDF38: .4byte 0x02007508
_080BDF3C:
	ldr r0, _080BDF78 @ =0x000001FF
	ands r1, r0
	movs r0, #0xff
	ands r2, r0
	adds r0, r7, #0
	movs r3, #0xe6
	lsls r3, r3, #6
	bl SetSpriteAnimProcParameters
_080BDF4E:
	movs r3, #1
	add sb, r3
	mov r0, sb
	cmp r0, #1
	ble _080BDED0
	ldr r0, [r6, #0x2c]
	cmp r0, #0
	bne _080BDF6A
	ldr r0, [r6, #0x30]
	cmp r0, #0
	bne _080BDF6A
	adds r0, r6, #0
	bl Proc_Break
_080BDF6A:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080BDF78: .4byte 0x000001FF

	thumb_func_start sub_80BDF7C
sub_80BDF7C: @ 0x080BDF7C
	push {r4, r5, r6, lr}
	mov r6, sb
	mov r5, r8
	push {r5, r6}
	adds r4, r0, #0
	adds r6, r1, #0
	adds r5, r2, #0
	mov sb, r3
	ldr r1, [sp, #0x18]
	ldr r0, _080BE014 @ =gUnk_08DB93D0
	bl Proc_Start
	lsls r1, r4, #0x10
	str r1, [r0, #0x34]
	lsls r6, r6, #0x10
	str r6, [r0, #0x3c]
	adds r4, #0x80
	movs r1, #0xff
	mov r8, r1
	ands r4, r1
	lsls r4, r4, #0x10
	str r4, [r0, #0x38]
	adds r6, #0x20
	str r6, [r0, #0x40]
	ldr r3, _080BE018 @ =gSinLut
	adds r2, r5, #0
	ands r2, r1
	adds r1, r2, #0
	adds r1, #0x40
	lsls r1, r1, #1
	adds r1, r1, r3
	movs r4, #0
	ldrsh r1, [r1, r4]
	mov r4, sb
	muls r4, r1, r4
	adds r1, r4, #0
	str r1, [r0, #0x44]
	lsls r2, r2, #1
	adds r2, r2, r3
	movs r4, #0
	ldrsh r1, [r2, r4]
	mov r2, sb
	muls r2, r1, r2
	adds r1, r2, #0
	str r1, [r0, #0x4c]
	adds r5, #4
	mov r4, r8
	ands r5, r4
	adds r1, r5, #0
	adds r1, #0x40
	lsls r1, r1, #1
	adds r1, r1, r3
	movs r2, #0
	ldrsh r1, [r1, r2]
	mov r4, sb
	muls r4, r1, r4
	adds r1, r4, #0
	str r1, [r0, #0x48]
	lsls r5, r5, #1
	adds r5, r5, r3
	movs r2, #0
	ldrsh r1, [r5, r2]
	mov r4, sb
	muls r4, r1, r4
	adds r1, r4, #0
	str r1, [r0, #0x50]
	movs r1, #0
	str r1, [r0, #0x2c]
	str r1, [r0, #0x30]
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080BE014: .4byte gUnk_08DB93D0
_080BE018: .4byte gSinLut

	thumb_func_start sub_80BE01C
sub_80BE01C: @ 0x080BE01C
	push {lr}
	movs r1, #0x74
	str r1, [r0, #0x2c]
	movs r1, #0
	str r1, [r0, #0x30]
	str r1, [r0, #0x38]
	ldr r0, _080BE040 @ =gUnk_08622C7C
	movs r1, #0xa0
	lsls r1, r1, #2
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r0, _080BE044 @ =gUnk_08622C9C
	ldr r1, _080BE048 @ =0x06010000
	bl Decompress
	pop {r0}
	bx r0
	.align 2, 0
_080BE040: .4byte gUnk_08622C7C
_080BE044: .4byte gUnk_08622C9C
_080BE048: .4byte 0x06010000

	thumb_func_start sub_80BE04C
sub_80BE04C: @ 0x080BE04C
	push {r4, r5, lr}
	sub sp, #4
	adds r4, r0, #0
	ldr r0, [r4, #0x38]
	adds r0, #1
	str r0, [r4, #0x38]
	ldr r1, [r4, #0x30]
	adds r5, r1, r0
	str r5, [r4, #0x30]
	cmp r5, #0x4f
	ble _080BE072
	adds r0, r4, #0
	bl Proc_Break
	ldr r0, [r4, #0x14]
	movs r1, #2
	bl Proc_Goto
	b _080BE08C
_080BE072:
	ldr r1, [r4, #0x2c]
	ldr r3, _080BE09C @ =Sprite_8x8
	ldr r0, [r4, #0x34]
	movs r2, #1
	ands r0, r2
	movs r2, #0x88
	lsls r2, r2, #7
	adds r0, r0, r2
	str r0, [sp]
	movs r0, #4
	adds r2, r5, #0
	bl PutSpriteExt
_080BE08C:
	ldr r0, [r4, #0x34]
	adds r0, #1
	str r0, [r4, #0x34]
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080BE09C: .4byte Sprite_8x8

	thumb_func_start sub_80BE0A0
sub_80BE0A0: @ 0x080BE0A0
	push {lr}
	adds r1, r0, #0
	ldr r0, _080BE0B0 @ =gUnk_08DB93F0
	bl Proc_Start
	pop {r0}
	bx r0
	.align 2, 0
_080BE0B0: .4byte gUnk_08DB93F0

	thumb_func_start sub_80BE0B4
sub_80BE0B4: @ 0x080BE0B4
	movs r2, #0
	adds r1, r0, #0
_080BE0B8:
	ldr r0, [r1]
	cmp r0, #0
	beq _080BE0C6
	adds r1, #4
	adds r2, #1
	cmp r2, #1
	ble _080BE0B8
_080BE0C6:
	adds r0, r2, #0
	bx lr
	.align 2, 0

	thumb_func_start sub_80BE0CC
sub_80BE0CC: @ 0x080BE0CC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	adds r6, r0, #0
	mov sb, r1
	mov r8, r2
	ldr r1, [r1, #4]
	lsls r0, r2, #3
	adds r0, r0, r1
	ldr r1, [r0]
	mov sl, r1
	ldr r7, [r0, #4]
	cmp r2, #0
	blt _080BE1BC
	cmp r1, #0
	beq _080BE11E
	adds r0, r6, #0
	bl GetBgChrOffset
	adds r4, r0, #0
	mov r2, sb
	ldr r2, [r2]
	ldr r1, [r2, #0x14]
	mov r0, r8
	bl __modsi3
	lsls r0, r0, #0xa
	movs r3, #0xc0
	lsls r3, r3, #0x13
	adds r0, r0, r3
	adds r4, r4, r0
	mov r1, sb
	ldr r1, [r1]
	ldr r0, [r1, #0x10]
	adds r4, r4, r0
	mov r0, sl
	adds r1, r4, #0
	bl Decompress
_080BE11E:
	cmp r7, #0
	beq _080BE17C
	ldrb r2, [r7]
	mov sl, r2
	ldrh r3, [r7]
	lsrs r4, r3, #8
	adds r7, #2
	adds r0, r6, #0
	bl GetBgTilemap
	movs r1, #0x1f
	mov r2, r8
	ands r1, r2
	lsls r1, r1, #6
	adds r6, r0, r1
	mov r3, sb
	ldr r5, [r3]
	ldr r1, [r5, #0x14]
	mov r0, r8
	bl __modsi3
	subs r4, r4, r0
	mov r3, sl
	adds r3, #1
	adds r0, r4, #0
	muls r0, r3, r0
	lsls r0, r0, #1
	adds r7, r7, r0
	movs r2, #0
	cmp r2, sl
	bgt _080BE1BC
	ldr r0, [r5, #4]
	lsls r4, r0, #0xc
	ldr r0, [r5, #0x10]
	lsls r0, r0, #0xf
	lsrs r1, r0, #0x14
	adds r2, r3, #0
_080BE168:
	ldrh r3, [r7]
	adds r0, r3, r4
	adds r0, r0, r1
	strh r0, [r6]
	adds r6, #2
	adds r7, #2
	subs r2, #1
	cmp r2, #0
	bne _080BE168
	b _080BE1BC
_080BE17C:
	mov r1, sb
	ldr r0, [r1]
	ldr r1, [r0, #0x14]
	mov r0, r8
	bl __modsi3
	adds r4, r0, #0
	lsls r4, r4, #5
	adds r0, r6, #0
	bl GetBgTilemap
	movs r1, #0x1f
	mov r2, r8
	ands r1, r2
	lsls r1, r1, #6
	adds r6, r0, r1
	mov r3, sb
	ldr r0, [r3]
	ldr r1, [r0, #4]
	ldr r0, [r0, #0x10]
	lsls r0, r0, #0xf
	lsrs r0, r0, #0x14
	lsls r1, r1, #0xc
	adds r4, r4, r1
	adds r0, r4, r0
	movs r2, #0x1f
_080BE1B0:
	strh r0, [r6]
	adds r6, #2
	adds r0, #1
	subs r2, #1
	cmp r2, #0
	bge _080BE1B0
_080BE1BC:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_80BE1CC
sub_80BE1CC: @ 0x080BE1CC
	str r1, [r0, #0x3c]
	bx lr

	thumb_func_start sub_80BE1D0
sub_80BE1D0: @ 0x080BE1D0
	movs r1, #0
	str r1, [r0, #0x3c]
	str r1, [r0, #0x34]
	str r1, [r0, #0x30]
	str r1, [r0, #0x2c]
	bx lr

	thumb_func_start sub_80BE1DC
sub_80BE1DC: @ 0x080BE1DC
	push {r4, r5, r6, r7, lr}
	sub sp, #0x10
	adds r4, r0, #0
	ldr r2, [r4, #0x38]
	asrs r6, r2, #0xa
	mov r1, sp
	ldr r0, _080BE2A4 @ =gUnk_086C4544
	ldm r0!, {r3, r5, r7}
	stm r1!, {r3, r5, r7}
	ldr r0, [r0]
	str r0, [r1]
	ldr r0, [r4, #0x2c]
	cmp r0, #0
	beq _080BE29A
	ldr r0, [r4, #0x3c]
	adds r0, r2, r0
	str r0, [r4, #0x38]
	cmp r0, #0
	bge _080BE20C
	movs r0, #0
	str r0, [r4, #0x38]
	adds r0, r4, #0
	bl Proc_Break
_080BE20C:
	ldr r1, [r4, #0x38]
	asrs r1, r1, #0xa
	ldr r0, [r4, #0x34]
	subs r0, #0x14
	lsls r0, r0, #3
	cmp r1, r0
	ble _080BE220
	adds r0, r4, #0
	bl Proc_Break
_080BE220:
	ldr r0, [r4, #0x38]
	asrs r5, r0, #0xa
	cmp r6, r5
	beq _080BE29A
	cmp r6, r5
	ble _080BE24E
	adds r2, r6, #0
	cmp r6, #0
	bge _080BE234
	adds r2, r6, #7
_080BE234:
	asrs r2, r2, #3
	adds r0, r5, #0
	cmp r5, #0
	bge _080BE23E
	adds r0, r5, #7
_080BE23E:
	asrs r0, r0, #3
	cmp r2, r0
	beq _080BE24E
	ldr r0, [r4, #0x30]
	ldr r1, [r4, #0x2c]
	subs r2, #1
	bl sub_80BE0CC
_080BE24E:
	cmp r6, r5
	bge _080BE282
	adds r3, r6, #7
	adds r0, r3, #0
	cmp r3, #0
	bge _080BE25E
	adds r0, r6, #0
	adds r0, #0xe
_080BE25E:
	asrs r1, r0, #3
	adds r0, r5, #7
	cmp r0, #0
	bge _080BE268
	adds r0, #7
_080BE268:
	asrs r0, r0, #3
	cmp r1, r0
	beq _080BE282
	ldr r0, [r4, #0x30]
	ldr r1, [r4, #0x2c]
	adds r2, r6, #0
	cmp r2, #0
	bge _080BE27A
	adds r2, r3, #0
_080BE27A:
	asrs r2, r2, #3
	adds r2, #0x14
	bl sub_80BE0CC
_080BE282:
	ldr r0, [r4, #0x30]
	lsls r0, r0, #2
	add r0, sp
	ldr r0, [r0]
	bl EnableBgSync
	ldrh r0, [r4, #0x30]
	lsls r2, r5, #0x10
	lsrs r2, r2, #0x10
	movs r1, #0
	bl SetBgOffset
_080BE29A:
	add sp, #0x10
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080BE2A4: .4byte gUnk_086C4544

	thumb_func_start sub_80BE2A8
sub_80BE2A8: @ 0x080BE2A8
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #0x10
	adds r6, r0, #0
	mov r8, r1
	mov sb, r2
	adds r4, r3, #0
	ldr r1, [sp, #0x2c]
	mov r2, sp
	ldr r0, _080BE38C @ =gUnk_086C4544
	ldm r0!, {r3, r5, r7}
	stm r2!, {r3, r5, r7}
	ldr r0, [r0]
	str r0, [r2]
	ldr r0, _080BE390 @ =gUnk_08DB9794
	bl Proc_Start
	adds r5, r0, #0
	movs r0, #0
	str r0, [r5, #0x34]
	ldr r2, [r6, #4]
	ldr r0, [r2]
	movs r1, #1
	rsbs r1, r1, #0
	cmp r0, r1
	beq _080BE2F2
	adds r3, r1, #0
	movs r1, #0
_080BE2E4:
	adds r1, #1
	lsls r0, r1, #3
	adds r0, r0, r2
	ldr r0, [r0]
	cmp r0, r3
	bne _080BE2E4
	str r1, [r5, #0x34]
_080BE2F2:
	movs r0, #1
	rsbs r0, r0, #0
	cmp sb, r0
	bne _080BE300
	ldr r0, [r5, #0x34]
	subs r0, #0x14
	mov sb, r0
_080BE300:
	mov r0, sb
	lsls r2, r0, #0xd
	str r2, [r5, #0x38]
	str r6, [r5, #0x2c]
	mov r1, r8
	str r1, [r5, #0x30]
	str r4, [r5, #0x3c]
	lsls r0, r1, #0x10
	lsrs r0, r0, #0x10
	lsls r2, r2, #6
	lsrs r2, r2, #0x10
	movs r1, #0
	bl SetBgOffset
	ldr r0, [r6]
	ldr r4, [r0, #0xc]
	cmp r4, #0
	beq _080BE33E
	mov r0, r8
	bl GetBgChrOffset
	adds r1, r0, #0
	ldr r0, [r6]
	ldr r0, [r0, #0x10]
	movs r2, #0xc0
	lsls r2, r2, #0x13
	adds r0, r0, r2
	adds r1, r1, r0
	adds r0, r4, #0
	bl Decompress
_080BE33E:
	ldr r1, [r6]
	ldr r0, [r1]
	cmp r0, #0
	beq _080BE356
	ldr r2, [r1, #8]
	cmp r2, #0
	beq _080BE356
	ldr r1, [r1, #4]
	lsls r1, r1, #5
	lsls r2, r2, #5
	bl ApplyPaletteExt
_080BE356:
	movs r4, #1
	rsbs r4, r4, #0
	mov r3, r8
	lsls r7, r3, #2
_080BE35E:
	mov r0, sb
	adds r2, r0, r4
	mov r0, r8
	adds r1, r6, #0
	bl sub_80BE0CC
	adds r4, #1
	cmp r4, #0x13
	ble _080BE35E
	mov r1, sp
	adds r0, r1, r7
	ldr r0, [r0]
	bl EnableBgSync
	adds r0, r5, #0
	add sp, #0x10
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_080BE38C: .4byte gUnk_086C4544
_080BE390: .4byte gUnk_08DB9794
