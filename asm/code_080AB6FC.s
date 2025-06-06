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
	bl GetChapterInfo
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
	bl GetChapterInfo
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
	bl CallSomeSoundMaybe
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
	bl CallSomeSoundMaybe
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
	bl StartHelpBox_Unk
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
	bl LoadAndVerifySoundRoomData
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
	bl CallSomeSoundMaybe
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
	bl SetUiSpinningArrowConfig
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
	bl PutNumber
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
	bl PutNumber
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
	bl StartUiSpinningArrows
	movs r1, #0xd0
	lsls r1, r1, #3
	movs r0, #1
	movs r2, #3
	bl LoadUiSpinningArrowGfx
	movs r0, #0x90
	movs r1, #0x38
	movs r2, #0x90
	movs r3, #0x90
	bl SetUiSpinningArrowPositions
	adds r0, r4, #0
	bl sub_80AC490
	adds r0, r4, #0
	bl sub_80AC4C0
	adds r0, r4, #0
	bl sub_80AC538
	ldr r0, _080AC95C @ =gUnk_08432E44
	ldr r1, _080AC960 @ =0x06004000
	bl Decompress
	ldr r0, _080AC964 @ =Pal_StatScreenFaceDefault
	movs r1, #0x80
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r0, _080AC968 @ =Pal_StatScreenFaceGeneric
	movs r1, #0xa0
	movs r2, #0x20
	bl ApplyPaletteExt
	str r5, [sp]
	movs r0, #2
	movs r1, #1
	movs r2, #0x1a
	movs r3, #6
	bl DrawUiFrame2
	str r5, [sp]
	movs r0, #0xb
	movs r1, #7
	movs r2, #0x11
	movs r3, #0xc
	bl DrawUiFrame2
	str r5, [sp]
	movs r0, #2
	movs r1, #0xb
	movs r2, #9
	movs r3, #8
	bl DrawUiFrame2
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
	bl DrawUiFrame2
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
	bl StartGreenText
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
_080AC964: .4byte Pal_StatScreenFaceDefault
_080AC968: .4byte Pal_StatScreenFaceGeneric
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
	bl MusicProc4Exists
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
	bl CallSomeSoundMaybe
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
	bl MusicProc4Exists
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
	bl CallSomeSoundMaybe
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
	bl MusicProc4Exists
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
	bl MusicProc4Exists
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne _080ACC56
	str r0, [sp]
	movs r0, #0x5a
	movs r1, #0
	movs r2, #0xc0
	movs r3, #0x18
	bl CallSomeSoundMaybe
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
	bl PutUiWindowFrame
	ldr r0, [r6]
	movs r1, #4
	str r1, [sp]
	str r5, [sp, #4]
	str r5, [sp, #8]
	movs r1, #0
	movs r2, #7
	movs r3, #9
	bl PutUiWindowFrame
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
	bl PutUiWindowFrame
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
	bl SetUiSpinningArrowConfig
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
	ldr r0, _080AD8D8 @ =Pal_SaveMenuBackground
	movs r1, #0
	movs r2, #0x60
	bl ApplyPaletteExt
	ldr r0, _080AD8DC @ =Img_MuralBackground
	ldr r1, _080AD8E0 @ =0x06001000
	bl Decompress
	ldr r0, _080AD8E4 @ =gBg0Tm
	ldr r1, _080AD8E8 @ =Tsa_SaveMenuBackground
	movs r2, #0x80
	bl TmApplyTsa_thm
	movs r0, #1
	bl EnableBgSync
	ldr r0, _080AD8EC @ =Pal_SaveMenuWindow
	movs r1, #0x88
	lsls r1, r1, #2
	movs r2, #0x80
	lsls r2, r2, #1
	bl ApplyPaletteExt
	ldr r0, _080AD8F0 @ =Img_SaveMenuSprits
	ldr r1, _080AD8F4 @ =0x06010800
	bl Decompress
	ldr r0, _080AD8F8 @ =gUnk_0843165C
	ldr r1, _080AD8FC @ =0x06013800
	bl Decompress
	ldr r0, _080AD900 @ =sub_80AD778
	bl SetOnHBlankA
	ldr r4, _080AD904 @ =Img_SpinRotation
	movs r0, #2
	bl GetBgChrOffset
	adds r1, r0, #0
	movs r0, #0xc0
	lsls r0, r0, #0x13
	adds r1, r1, r0
	adds r0, r4, #0
	bl Decompress
	ldr r0, _080AD908 @ =gBg3Tm
	ldr r1, _080AD90C @ =Tsa_SpinRotation
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
	bl StartSpinRotation
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
_080AD8D8: .4byte Pal_SaveMenuBackground
_080AD8DC: .4byte Img_MuralBackground
_080AD8E0: .4byte 0x06001000
_080AD8E4: .4byte gBg0Tm
_080AD8E8: .4byte Tsa_SaveMenuBackground
_080AD8EC: .4byte Pal_SaveMenuWindow
_080AD8F0: .4byte Img_SaveMenuSprits
_080AD8F4: .4byte 0x06010800
_080AD8F8: .4byte gUnk_0843165C
_080AD8FC: .4byte 0x06013800
_080AD900: .4byte sub_80AD778
_080AD904: .4byte Img_SpinRotation
_080AD908: .4byte gBg3Tm
_080AD90C: .4byte Tsa_SpinRotation
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
	bl PutChapterTitlePalette
	adds r0, r4, #0
	movs r1, #0x19
	bl PutChapterTitlePalette
	bl EnablePalSync
	movs r0, #0xac
	lsls r0, r0, #4
	bl PutChapterTitleBG
	movs r4, #0xb4
	lsls r4, r4, #4
	adds r0, r5, #0
	bl GetChapterTitle
	adds r1, r0, #0
	adds r0, r4, #0
	bl PutChapterTitleGfx
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
	bl LoadBonusContentData
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
	bl GetItemIconId
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
	bl GetItemIconId
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
	bl UseUnitSprite
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
	bl UseUnitSprite
_080ADE12:
	adds r5, #1
	cmp r5, #0x3f
	ble _080ADDB0
	mov r0, r8
	strb r4, [r0]
	bl ApplyUnitSpritePalettes
	bl ForceSyncUnitSpriteSheet
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
	bl DrawUiFrame2
	movs r0, #1
	str r0, [sp]
	movs r0, #0x12
	movs r1, #0x11
	movs r2, #0xa
	movs r3, #3
	bl DrawUiFrame2
	ldr r4, _080ADE80 @ =gBg0Tm + 0x4b2
	bl GetGold
	adds r2, r0, #0
	adds r0, r4, #0
	movs r1, #2
	bl PutNumber
	adds r4, #2
	adds r0, r4, #0
	movs r1, #3
	movs r2, #0x1e
	bl PutSpecialChar
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
	ldr r0, _080AE0A4 @ =Pal_SaveMenuBackground
	movs r1, #0xc0
	lsls r1, r1, #1
	movs r2, #0x60
	bl ApplyPaletteExt
	ldr r0, _080AE0A8 @ =Img_MuralBackground
	ldr r1, _080AE0AC @ =0x06008000
	bl Decompress
	ldr r0, _080AE0B0 @ =gBg3Tm
	ldr r1, _080AE0B4 @ =Tsa_SaveMenuBackground
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
	bl StartGreenText
	adds r0, r6, #0
	bl StartMenuScrollBar
	movs r0, #0xc8
	movs r1, #0x44
	bl PutMenuScrollBarAt
	movs r0, #0x80
	lsls r0, r0, #2
	movs r1, #2
	bl InitMenuScrollBarImg
	ldrh r1, [r6, #0x2c]
	ldr r0, _080AE0BC @ =gUnk_08DAEF6C
	ldr r0, [r0]
	ldrh r2, [r0]
	movs r0, #7
	movs r3, #5
	bl UpdateMenuScrollBarConfig
	adds r0, r6, #0
	bl StartUiCursorHand
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
_080AE0A4: .4byte Pal_SaveMenuBackground
_080AE0A8: .4byte Img_MuralBackground
_080AE0AC: .4byte 0x06008000
_080AE0B0: .4byte gBg3Tm
_080AE0B4: .4byte Tsa_SaveMenuBackground
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
	bl UpdateMenuScrollBarConfig
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
	bl SyncUnitSpriteSheet
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
	bl DrawUiFrame2
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
	bl SetUiCursorHandConfig
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
	bl GetConvoyItemCount
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
	bl PutNumber
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
	bl DisableUiCursorHand
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
	bl DisableUiCursorHand
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
	bl GetItemIconId
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
	bl PutUiWindowFrame
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
	bl EndGreenText
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
	ldr r0, _080AEB28 @ =Img_MuralBackground
	adds r1, r5, #0
	bl Decompress
	ldr r0, _080AEB2C @ =Pal_MuralBackground
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
_080AEB28: .4byte Img_MuralBackground
_080AEB2C: .4byte Pal_MuralBackground
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
	bl DisplayFrozenUiHand
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
	bl PutUiHand
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
	bl UnpackUiWindowFrameGraphics2
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
	bl StartBgm
	b _080AF18C
_080AF188:
	bl StartMapSongBgm
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
	ldr r0, _080AFBC0 @ =ProcScr_08DAF5FC
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
_080AFBC0: .4byte ProcScr_08DAF5FC
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
