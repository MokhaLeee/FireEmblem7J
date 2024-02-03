	.include "macro.inc"

	.syntax unified

	thumb_func_start MulByQ32
MulByQ32: @ 0x080BE394
	add r2, pc, #0x0 @ =sub_80BE398
	bx r2

	arm_func_start sub_80BE398
sub_80BE398: @ 0x080BE398
	umull r2, r3, r0, r1
	add r0, r3, #0
	bx lr

	thumb_func_start SoundMain
SoundMain: @ 0x080BE3A4
	ldr r0, _080BE410 @ =0x03007FF0
	ldr r0, [r0]
	ldr r2, _080BE414 @ =0x68736D53
	ldr r3, [r0]
	cmp r2, r3
	beq _080BE3B2
	bx lr
_080BE3B2:
	adds r3, #1
	str r3, [r0]
	push {r4, r5, r6, r7, lr}
	mov r1, r8
	mov r2, sb
	mov r3, sl
	mov r4, fp
	push {r0, r1, r2, r3, r4}
	sub sp, #0x18
	ldrb r1, [r0, #0xc]
	cmp r1, #0
	beq _080BE3D6
	ldr r2, _080BE41C @ =0x04000006
	ldrb r2, [r2]
	cmp r2, #0xa0
	bhs _080BE3D4
	adds r2, #0xe4
_080BE3D4:
	adds r1, r1, r2
_080BE3D6:
	str r1, [sp, #0x14]
	ldr r3, [r0, #0x20]
	cmp r3, #0
	beq _080BE3E6
	ldr r0, [r0, #0x24]
	bl _080BE7C6
	ldr r0, [sp, #0x18]
_080BE3E6:
	ldr r3, [r0, #0x28]
	bl _080BE7C6
	ldr r0, [sp, #0x18]
	ldr r3, [r0, #0x10]
	mov r8, r3
	ldr r5, _080BE420 @ =0x00000350
	adds r5, r5, r0
	ldrb r4, [r0, #4]
	subs r7, r4, #1
	bls _080BE406
	ldrb r1, [r0, #0xb]
	subs r1, r1, r7
	mov r2, r8
	muls r2, r1, r2
	adds r5, r5, r2
_080BE406:
	str r5, [sp, #8]
	ldr r6, _080BE424 @ =0x00000630
	ldr r3, _080BE418 @ =0x03002379
	bx r3
	.align 2, 0
_080BE410: .4byte 0x03007FF0
_080BE414: .4byte 0x68736D53
_080BE418: .4byte 0x03002379
_080BE41C: .4byte 0x04000006
_080BE420: .4byte 0x00000350
_080BE424: .4byte 0x00000630

	thumb_func_start SoundMainRAM
SoundMainRAM: @ 0x080BE428
	ldrb r3, [r0, #5]
	cmp r3, #0
	beq sub_80BE488
	add r1, pc, #0x4 @ =sub_80BE434
	bx r1
	.align 2, 0

	arm_func_start sub_80BE434
sub_80BE434: @ 0x080BE434
	cmp r4, #2
	addeq r7, r0, #0x350
	addne r7, r5, r8
	mov r4, r8
_080BE444:
	ldrsb r0, [r5, r6]
	ldrsb r1, [r5]
	add r0, r0, r1
	ldrsb r1, [r7, r6]
	add r0, r0, r1
	ldrsb r1, [r7], #1
	add r0, r0, r1
	mul r1, r0, r3
	asr r0, r1, #9
	tst r0, #0x80
	addne r0, r0, #1
	strb r0, [r5, r6]
	strb r0, [r5], #1
	subs r4, r4, #1
	bgt _080BE444
	add r0, pc, #0x2F @ =sub_80BE4B6
	bx r0

	thumb_func_start sub_80BE488
sub_80BE488: @ 0x080BE488
	movs r0, #0
	mov r1, r8
	adds r6, r6, r5
	lsrs r1, r1, #3
	blo _080BE496
	stm r5!, {r0}
	stm r6!, {r0}
_080BE496:
	lsrs r1, r1, #1
	blo _080BE4A2
	stm r5!, {r0}
	stm r6!, {r0}
	stm r5!, {r0}
	stm r6!, {r0}
_080BE4A2:
	stm r5!, {r0}
	stm r6!, {r0}
	stm r5!, {r0}
	stm r6!, {r0}
	stm r5!, {r0}
	stm r6!, {r0}
	stm r5!, {r0}
	stm r6!, {r0}
	subs r1, #1
	bgt _080BE4A2

	non_word_aligned_thumb_func_start sub_80BE4B6
sub_80BE4B6: @ 0x080BE4B6
	ldr r4, [sp, #0x18]
	ldr r0, [r4, #0x18]
	mov ip, r0
	ldrb r0, [r4, #6]
	adds r4, #0x50
_080BE4C0:
	str r0, [sp, #4]
	ldr r3, [r4, #0x24]
	ldr r0, [sp, #0x14]
	cmp r0, #0
	beq _080BE4E0
	ldr r1, _080BE4DC @ =0x04000006
	ldrb r1, [r1]
	cmp r1, #0xa0
	bhs _080BE4D4
	adds r1, #0xe4
_080BE4D4:
	cmp r1, r0
	blo _080BE4E0
	b _080BE7B2
	.align 2, 0
_080BE4DC: .4byte 0x04000006
_080BE4E0:
	ldrb r6, [r4]
	movs r0, #0xc7
	tst r0, r6
	bne _080BE4EA
	b sub_80BE7A8
_080BE4EA:
	movs r0, #0x80
	tst r0, r6
	beq _080BE51A
	movs r0, #0x40
	tst r0, r6
	bne _080BE52A
	movs r6, #3
	strb r6, [r4]
	adds r0, r3, #0
	adds r0, #0x10
	str r0, [r4, #0x28]
	ldr r0, [r3, #0xc]
	str r0, [r4, #0x18]
	movs r5, #0
	strb r5, [r4, #9]
	str r5, [r4, #0x1c]
	ldrb r2, [r3, #3]
	movs r0, #0xc0
	tst r0, r2
	beq _080BE572
	movs r0, #0x10
	orrs r6, r0
	strb r6, [r4]
	b _080BE572
_080BE51A:
	ldrb r5, [r4, #9]
	movs r0, #4
	tst r0, r6
	beq _080BE530
	ldrb r0, [r4, #0xd]
	subs r0, #1
	strb r0, [r4, #0xd]
	bhi _080BE580
_080BE52A:
	movs r0, #0
	strb r0, [r4]
	b sub_80BE7A8
_080BE530:
	movs r0, #0x40
	tst r0, r6
	beq _080BE550
	ldrb r0, [r4, #7]
	muls r5, r0, r5
	lsrs r5, r5, #8
	ldrb r0, [r4, #0xc]
	cmp r5, r0
	bhi _080BE580
_080BE542:
	ldrb r5, [r4, #0xc]
	cmp r5, #0
	beq _080BE52A
	movs r0, #4
	orrs r6, r0
	strb r6, [r4]
	b _080BE580
_080BE550:
	movs r2, #3
	ands r2, r6
	cmp r2, #2
	bne _080BE56E
	ldrb r0, [r4, #5]
	muls r5, r0, r5
	lsrs r5, r5, #8
	ldrb r0, [r4, #6]
	cmp r5, r0
	bhi _080BE580
	adds r5, r0, #0
	beq _080BE542
	subs r6, #1
	strb r6, [r4]
	b _080BE580
_080BE56E:
	cmp r2, #3
	bne _080BE580
_080BE572:
	ldrb r0, [r4, #4]
	adds r5, r5, r0
	cmp r5, #0xff
	blo _080BE580
	movs r5, #0xff
	subs r6, #1
	strb r6, [r4]
_080BE580:
	strb r5, [r4, #9]
	ldr r0, [sp, #0x18]
	ldrb r0, [r0, #7]
	adds r0, #1
	muls r0, r5, r0
	lsrs r5, r0, #4
	ldrb r0, [r4, #2]
	muls r0, r5, r0
	lsrs r0, r0, #8
	strb r0, [r4, #0xa]
	ldrb r0, [r4, #3]
	muls r0, r5, r0
	lsrs r0, r0, #8
	strb r0, [r4, #0xb]
	movs r0, #0x10
	ands r0, r6
	str r0, [sp, #0x10]
	beq _080BE5B4
	adds r0, r3, #0
	adds r0, #0x10
	ldr r1, [r3, #8]
	adds r0, r0, r1
	str r0, [sp, #0xc]
	ldr r0, [r3, #0xc]
	subs r0, r0, r1
	str r0, [sp, #0x10]
_080BE5B4:
	ldr r5, [sp, #8]
	ldr r2, [r4, #0x18]
	ldr r3, [r4, #0x28]
	add r0, pc, #0x4 @ =sub_80BE5C0
	bx r0
	.align 2, 0

	arm_func_start sub_80BE5C0
sub_80BE5C0: @ 0x080BE5C0
	str r8, [sp]
	ldrb sl, [r4, #0xa]
	ldrb fp, [r4, #0xb]
	lsl sl, sl, #0x10
	lsl fp, fp, #0x10
	ldrb r0, [r4, #1]
	tst r0, #8
	beq _080BE700
_080BE5E0:
	cmp r2, #4
	ble _080BE650
	subs r2, r2, r8
	movgt lr, #0
	bgt _080BE60C
	mov lr, r8
	add r2, r2, r8
	sub r8, r2, #4
	sub lr, lr, r8
	ands r2, r2, #3
	moveq r2, #4
_080BE60C:
	ldr r6, [r5]
	ldr r7, [r5, #0x630]
_080BE614:
	ldrsb r0, [r3], #1
	mul r1, sl, r0
	bic r1, r1, #0xff0000
	add r6, r1, r6, ror #8
	mul r1, fp, r0
	bic r1, r1, #0xff0000
	add r7, r1, r7, ror #8
	adds r5, r5, #0x40000000
	blo _080BE614
	str r7, [r5, #0x630]
	str r6, [r5], #4
	subs r8, r8, #4
	bgt _080BE60C
	adds r8, r8, lr
	beq _080BE794
_080BE650:
	ldr r6, [r5]
	ldr r7, [r5, #0x630]
_080BE658:
	ldrsb r0, [r3], #1
	mul r1, sl, r0
	bic r1, r1, #0xff0000
	add r6, r1, r6, ror #8
	mul r1, fp, r0
	bic r1, r1, #0xff0000
	add r7, r1, r7, ror #8
	subs r2, r2, #1
	beq _080BE6C8
_080BE67C:
	adds r5, r5, #0x40000000
	blo _080BE658
	str r7, [r5, #0x630]
	str r6, [r5], #4
	subs r8, r8, #4
	bgt _080BE5E0
	b _080BE794
_080BE698:
	ldr r0, [sp, #0x18]
	cmp r0, #0
	beq _080BE6BC
	ldr r3, [sp, #0x14]
	rsb sb, r2, #0
_080BE6AC:
	adds r2, r0, r2
	bgt _080BE764
	sub sb, sb, r0
	b _080BE6AC
_080BE6BC:
	pop {r4, ip}
	mov r2, #0
	b _080BE6D8
_080BE6C8:
	ldr r2, [sp, #0x10]
	cmp r2, #0
	ldrne r3, [sp, #0xc]
	bne _080BE67C
_080BE6D8:
	strb r2, [r4]
	lsr r0, r5, #0x1e
	bic r5, r5, #0xc0000000
	rsb r0, r0, #3
	lsl r0, r0, #3
	ror r6, r6, r0
	ror r7, r7, r0
	str r7, [r5, #0x630]
	str r6, [r5], #4
	b _080BE79C
_080BE700:
	push {r4, ip}
	ldr lr, [r4, #0x1c]
	ldr r1, [r4, #0x20]
	mul r4, ip, r1
	ldrsb r0, [r3]
	ldrsb r1, [r3, #1]!
	sub r1, r1, r0
_080BE71C:
	ldr r6, [r5]
	ldr r7, [r5, #0x630]
_080BE724:
	mul sb, lr, r1
	add sb, r0, sb, asr #23
	mul ip, sl, sb
	bic ip, ip, #0xff0000
	add r6, ip, r6, ror #8
	mul ip, fp, sb
	bic ip, ip, #0xff0000
	add r7, ip, r7, ror #8
	add lr, lr, r4
	lsrs sb, lr, #0x17
	beq _080BE770
	bic lr, lr, #0x3f800000
	subs r2, r2, sb
	ble _080BE698
	subs sb, sb, #1
	addeq r0, r0, r1
_080BE764:
	ldrsbne r0, [r3, sb]!
	ldrsb r1, [r3, #1]!
	sub r1, r1, r0
_080BE770:
	adds r5, r5, #0x40000000
	blo _080BE724
	str r7, [r5, #0x630]
	str r6, [r5], #4
	subs r8, r8, #4
	bgt _080BE71C
	sub r3, r3, #1
	pop {r4, ip}
	str lr, [r4, #0x1c]
_080BE794:
	str r2, [r4, #0x18]
	str r3, [r4, #0x28]
_080BE79C:
	ldr r8, [sp]
	add r0, pc, #0x1 @ =sub_80BE7A8
	bx r0

	thumb_func_start sub_80BE7A8
sub_80BE7A8: @ 0x080BE7A8
	ldr r0, [sp, #4]
	subs r0, #1
	ble _080BE7B2
	adds r4, #0x40
	b _080BE4C0
_080BE7B2:
	ldr r0, [sp, #0x18]
	ldr r3, _080BE7C8 @ =0x68736D53
	str r3, [r0]
	add sp, #0x1c
	pop {r0, r1, r2, r3, r4, r5, r6, r7}
	mov r8, r0
	mov sb, r1
	mov sl, r2
	mov fp, r3
	pop {r3}
_080BE7C6: @ 0x080BE7C6
	bx r3
	.align 2, 0
_080BE7C8: .4byte 0x68736D53

	thumb_func_start SoundMainBTM
SoundMainBTM: @ 0x080BE7CC
	mov ip, r4
	movs r1, #0
	movs r2, #0
	movs r3, #0
	movs r4, #0
	stm r0!, {r1, r2, r3, r4}
	stm r0!, {r1, r2, r3, r4}
	stm r0!, {r1, r2, r3, r4}
	stm r0!, {r1, r2, r3, r4}
	mov r4, ip
	bx lr
	.align 2, 0

	thumb_func_start ClearChain
ClearChain: @ 0x080BE7E4
	ldr r3, [r0, #0x2c]
	cmp r3, #0
	beq _080BE802
	ldr r1, [r0, #0x34]
	ldr r2, [r0, #0x30]
	cmp r2, #0
	beq _080BE7F6
	str r1, [r2, #0x34]
	b _080BE7F8
_080BE7F6:
	str r1, [r3, #0x20]
_080BE7F8:
	cmp r1, #0
	beq _080BE7FE
	str r2, [r1, #0x30]
_080BE7FE:
	movs r1, #0
	str r1, [r0, #0x2c]
_080BE802:
	bx lr
_080BE804:
	push {r4, r5, lr}
	adds r5, r1, #0
	ldr r4, [r5, #0x20]
	cmp r4, #0
	beq _080BE828
_080BE80E:
	ldrb r1, [r4]
	movs r0, #0xc7
	tst r0, r1
	beq _080BE81C
	movs r0, #0x40
	orrs r1, r0
	strb r1, [r4]
_080BE81C:
	adds r0, r4, #0
	bl ClearChain
	ldr r4, [r4, #0x34]
	cmp r4, #0
	bne _080BE80E
_080BE828:
	movs r0, #0
	strb r0, [r5]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start MPlyJmpTblCopy
MPlyJmpTblCopy: @ 0x080BE834
	mov ip, lr
	movs r1, #0x24
	ldr r2, _080BE864 @ =gUnk_086C4560
_080BE83A:
	ldr r3, [r2]
	bl _080BE84E
	stm r0!, {r3}
	adds r2, #4
	subs r1, #1
	bgt _080BE83A
	bx ip
	.align 2, 0

	thumb_func_start ldrb_r3_r2
ldrb_r3_r2: @ 0x080BE84C
	ldrb r3, [r2]
_080BE84E:
	push {r0}
	lsrs r0, r2, #0x19
	bne _080BE860
	ldr r0, _080BE864 @ =gUnk_086C4560
	cmp r2, r0
	blo _080BE85E
	lsrs r0, r2, #0xe
	beq _080BE860
_080BE85E:
	movs r3, #0
_080BE860:
	pop {r0}
	bx lr
	.align 2, 0
_080BE864: .4byte gUnk_086C4560

	thumb_func_start ld_r3_tp_adr_i
ld_r3_tp_adr_i: @ 0x080BE868
	ldr r2, [r1, #0x40]

	non_word_aligned_thumb_func_start sub_80BE86A
sub_80BE86A: @ 0x080BE86A
	adds r3, r2, #1
	str r3, [r1, #0x40]
	ldrb r3, [r2]
	b _080BE84E
	.align 2, 0
_080BE874:
	push {lr}
_080BE876:
	ldr r2, [r1, #0x40]
	ldrb r0, [r2, #3]
	lsls r0, r0, #8
	ldrb r3, [r2, #2]
	orrs r0, r3
	lsls r0, r0, #8
	ldrb r3, [r2, #1]
	orrs r0, r3
	lsls r0, r0, #8
	bl ldrb_r3_r2
	orrs r0, r3
	str r0, [r1, #0x40]
	pop {r0}
	bx r0

	thumb_func_start ply_patt
ply_patt: @ 0x080BE894
	ldrb r2, [r1, #2]
	cmp r2, #3
	bhs _080BE8AC
	lsls r2, r2, #2
	adds r3, r1, r2
	ldr r2, [r1, #0x40]
	adds r2, #4
	str r2, [r3, #0x44]
	ldrb r2, [r1, #2]
	adds r2, #1
	strb r2, [r1, #2]
	b _080BE874
_080BE8AC:
	b _080BE804
	.align 2, 0

	thumb_func_start ply_pend
ply_pend: @ 0x080BE8B0
	ldrb r2, [r1, #2]
	cmp r2, #0
	beq _080BE8C2
	subs r2, #1
	strb r2, [r1, #2]
	lsls r2, r2, #2
	adds r3, r1, r2
	ldr r2, [r3, #0x44]
	str r2, [r1, #0x40]
_080BE8C2:
	bx lr

	thumb_func_start ply_rept
ply_rept: @ 0x080BE8C4
	push {lr}
	ldr r2, [r1, #0x40]
	ldrb r3, [r2]
	cmp r3, #0
	bne _080BE8D4
	adds r2, #1
	str r2, [r1, #0x40]
	b _080BE876
_080BE8D4:
	ldrb r3, [r1, #3]
	adds r3, #1
	strb r3, [r1, #3]
	mov ip, r3
	bl ld_r3_tp_adr_i
	cmp ip, r3
	bhs _080BE8E6
	b _080BE876
_080BE8E6:
	movs r3, #0
	strb r3, [r1, #3]
	adds r2, #5
	str r2, [r1, #0x40]
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start ply_prio
ply_prio: @ 0x080BE8F4
	mov ip, lr
	bl ld_r3_tp_adr_i
	strb r3, [r1, #0x1d]
	bx ip
	.align 2, 0

	thumb_func_start ply_tempo
ply_tempo: @ 0x080BE900
	mov ip, lr
	bl ld_r3_tp_adr_i
	lsls r3, r3, #1
	strh r3, [r0, #0x1c]
	ldrh r2, [r0, #0x1e]
	muls r3, r2, r3
	lsrs r3, r3, #8
	strh r3, [r0, #0x20]
	bx ip

	thumb_func_start ply_keysh
ply_keysh: @ 0x080BE914
	mov ip, lr
	bl ld_r3_tp_adr_i
	strb r3, [r1, #0xa]
	ldrb r3, [r1]
	movs r2, #0xc
	orrs r3, r2
	strb r3, [r1]
	bx ip
	.align 2, 0

	thumb_func_start ply_voice
ply_voice: @ 0x080BE928
	mov ip, lr
	ldr r2, [r1, #0x40]
	ldrb r3, [r2]
	adds r2, #1
	str r2, [r1, #0x40]
	lsls r2, r3, #1
	adds r2, r2, r3
	lsls r2, r2, #2
	ldr r3, [r0, #0x30]
	adds r2, r2, r3
	ldr r3, [r2]
	bl _080BE84E
	str r3, [r1, #0x24]
	ldr r3, [r2, #4]
	bl _080BE84E
	str r3, [r1, #0x28]
	ldr r3, [r2, #8]
	bl _080BE84E
	str r3, [r1, #0x2c]
	bx ip
	.align 2, 0

	thumb_func_start ply_vol
ply_vol: @ 0x080BE958
	mov ip, lr
	bl ld_r3_tp_adr_i
	strb r3, [r1, #0x12]
	ldrb r3, [r1]
	movs r2, #3
	orrs r3, r2
	strb r3, [r1]
	bx ip
	.align 2, 0

	thumb_func_start ply_pan
ply_pan: @ 0x080BE96C
	mov ip, lr
	bl ld_r3_tp_adr_i
	subs r3, #0x40
	strb r3, [r1, #0x14]
	ldrb r3, [r1]
	movs r2, #3
	orrs r3, r2
	strb r3, [r1]
	bx ip

	thumb_func_start ply_bend
ply_bend: @ 0x080BE980
	mov ip, lr
	bl ld_r3_tp_adr_i
	subs r3, #0x40
	strb r3, [r1, #0xe]
	ldrb r3, [r1]
	movs r2, #0xc
	orrs r3, r2
	strb r3, [r1]
	bx ip

	thumb_func_start ply_bendr
ply_bendr: @ 0x080BE994
	mov ip, lr
	bl ld_r3_tp_adr_i
	strb r3, [r1, #0xf]
	ldrb r3, [r1]
	movs r2, #0xc
	orrs r3, r2
	strb r3, [r1]
	bx ip
	.align 2, 0

	thumb_func_start ply_lfodl
ply_lfodl: @ 0x080BE9A8
	mov ip, lr
	bl ld_r3_tp_adr_i
	strb r3, [r1, #0x1b]
	bx ip
	.align 2, 0

	thumb_func_start ply_modt
ply_modt: @ 0x080BE9B4
	mov ip, lr
	bl ld_r3_tp_adr_i
	ldrb r0, [r1, #0x18]
	cmp r0, r3
	beq _080BE9CA
	strb r3, [r1, #0x18]
	ldrb r3, [r1]
	movs r2, #0xf
	orrs r3, r2
	strb r3, [r1]
_080BE9CA:
	bx ip

	thumb_func_start ply_tune
ply_tune: @ 0x080BE9CC
	mov ip, lr
	bl ld_r3_tp_adr_i
	subs r3, #0x40
	strb r3, [r1, #0xc]
	ldrb r3, [r1]
	movs r2, #0xc
	orrs r3, r2
	strb r3, [r1]
	bx ip

	thumb_func_start ply_port
ply_port: @ 0x080BE9E0
	mov ip, lr
	ldr r2, [r1, #0x40]
	ldrb r3, [r2]
	adds r2, #1
	ldr r0, _080BE9F4 @ =0x04000060
	adds r0, r0, r3
	bl sub_80BE86A

	thumb_func_start sub_80BE9F0
sub_80BE9F0: @ 0x080BE9F0
	strb r3, [r0]
	bx ip
	.align 2, 0
_080BE9F4: .4byte 0x04000060

	thumb_func_start SoundVSync_rev01
SoundVSync_rev01: @ 0x080BE9F8
	ldr r0, _080BECA4 @ =0x03007FF0
	ldr r0, [r0]
	ldr r2, _080BECA8 @ =0x68736D53
	ldr r3, [r0]
	subs r3, r3, r2
	cmp r3, #1
	bhi _080BEA38
	ldrb r1, [r0, #4]
	subs r1, #1
	strb r1, [r0, #4]
	bgt _080BEA38
	ldrb r1, [r0, #0xb]
	strb r1, [r0, #4]
	ldr r2, _080BEA3C @ =0x040000BC
	ldr r1, [r2, #8]
	lsls r1, r1, #7
	blo _080BEA1E
	ldr r1, _080BEA40 @ =0x84400004
	str r1, [r2, #8]
_080BEA1E:
	ldr r1, [r2, #0x14]
	lsls r1, r1, #7
	blo _080BEA28
	ldr r1, _080BEA40 @ =0x84400004
	str r1, [r2, #0x14]
_080BEA28:
	movs r1, #4
	lsls r1, r1, #8
	strh r1, [r2, #0xa]
	strh r1, [r2, #0x16]
	movs r1, #0xb6
	lsls r1, r1, #8
	strh r1, [r2, #0xa]
	strh r1, [r2, #0x16]
_080BEA38:
	bx lr
	.align 2, 0
_080BEA3C: .4byte 0x040000BC
_080BEA40: .4byte 0x84400004

	thumb_func_start MPlayMain_rev01
MPlayMain_rev01: @ 0x080BEA44
	ldr r2, _080BECA8 @ =0x68736D53
	ldr r3, [r0, #0x34]
	cmp r2, r3
	beq _080BEA4E
	bx lr
_080BEA4E:
	adds r3, #1
	str r3, [r0, #0x34]
	push {r0, lr}
	ldr r3, [r0, #0x38]
	cmp r3, #0
	beq _080BEA60
	ldr r0, [r0, #0x3c]
	bl sub_80BEC9C
_080BEA60:
	pop {r0}
	push {r4, r5, r6, r7}
	mov r4, r8
	mov r5, sb
	mov r6, sl
	mov r7, fp
	push {r4, r5, r6, r7}
	adds r7, r0, #0
	ldr r0, [r7, #4]
	cmp r0, #0
	bge _080BEA78
	b _080BEC8C
_080BEA78:
	ldr r0, _080BECA4 @ =0x03007FF0
	ldr r0, [r0]
	mov r8, r0
	adds r0, r7, #0
	bl FadeOutBody_rev01
	ldr r0, [r7, #4]
	cmp r0, #0
	bge _080BEA8C
	b _080BEC8C
_080BEA8C:
	ldrh r0, [r7, #0x22]
	ldrh r1, [r7, #0x20]
	adds r0, r0, r1
	b _080BEBDC
_080BEA94:
	ldrb r6, [r7, #8]
	ldr r5, [r7, #0x2c]
	movs r3, #1
	movs r4, #0
_080BEA9C:
	ldrb r0, [r5]
	movs r1, #0x80
	tst r1, r0
	bne _080BEAA6
	b _080BEBB8
_080BEAA6:
	mov sl, r3
	orrs r4, r3
	mov fp, r4
	ldr r4, [r5, #0x20]
	cmp r4, #0
	beq _080BEADA
_080BEAB2:
	ldrb r1, [r4]
	movs r0, #0xc7
	tst r0, r1
	beq _080BEACE
	ldrb r0, [r4, #0x10]
	cmp r0, #0
	beq _080BEAD4
	subs r0, #1
	strb r0, [r4, #0x10]
	bne _080BEAD4
	movs r0, #0x40
	orrs r1, r0
	strb r1, [r4]
	b _080BEAD4
_080BEACE:
	adds r0, r4, #0
	bl ClearChain_rev
_080BEAD4:
	ldr r4, [r4, #0x34]
	cmp r4, #0
	bne _080BEAB2
_080BEADA:
	ldrb r3, [r5]
	movs r0, #0x40
	tst r0, r3
	beq _080BEB58
	adds r0, r5, #0
	bl Clear64byte_rev
	movs r0, #0x80
	strb r0, [r5]
	movs r0, #2
	strb r0, [r5, #0xf]
	movs r0, #0x40
	strb r0, [r5, #0x13]
	movs r0, #0x16
	strb r0, [r5, #0x19]
	movs r0, #1
	adds r1, r5, #6
	strb r0, [r1, #0x1e]
	b _080BEB58
_080BEB00:
	ldr r2, [r5, #0x40]
	ldrb r1, [r2]
	cmp r1, #0x80
	bhs _080BEB0C
	ldrb r1, [r5, #7]
	b _080BEB16
_080BEB0C:
	adds r2, #1
	str r2, [r5, #0x40]
	cmp r1, #0xbd
	blo _080BEB16
	strb r1, [r5, #7]
_080BEB16:
	cmp r1, #0xcf
	blo _080BEB2C
	mov r0, r8
	ldr r3, [r0, #0x38]
	adds r0, r1, #0
	subs r0, #0xcf
	adds r1, r7, #0
	adds r2, r5, #0
	bl sub_80BEC9C
	b _080BEB58
_080BEB2C:
	cmp r1, #0xb0
	bls _080BEB4E
	adds r0, r1, #0
	subs r0, #0xb1
	strb r0, [r7, #0xa]
	mov r3, r8
	ldr r3, [r3, #0x34]
	lsls r0, r0, #2
	ldr r3, [r3, r0]
	adds r0, r7, #0
	adds r1, r5, #0
	bl sub_80BEC9C
	ldrb r0, [r5]
	cmp r0, #0
	beq _080BEBB4
	b _080BEB58
_080BEB4E:
	ldr r0, _080BECA0 @ =gUnk_086C47D4
	subs r1, #0x80
	adds r1, r1, r0
	ldrb r0, [r1]
	strb r0, [r5, #1]
_080BEB58:
	ldrb r0, [r5, #1]
	cmp r0, #0
	beq _080BEB00
	subs r0, #1
	strb r0, [r5, #1]
	ldrb r1, [r5, #0x19]
	cmp r1, #0
	beq _080BEBB4
	ldrb r0, [r5, #0x17]
	cmp r0, #0
	beq _080BEBB4
	ldrb r0, [r5, #0x1c]
	cmp r0, #0
	beq _080BEB7A
	subs r0, #1
	strb r0, [r5, #0x1c]
	b _080BEBB4
_080BEB7A:
	ldrb r0, [r5, #0x1a]
	adds r0, r0, r1
	strb r0, [r5, #0x1a]
	adds r1, r0, #0
	subs r0, #0x40
	lsls r0, r0, #0x18
	bpl _080BEB8E
	lsls r2, r1, #0x18
	asrs r2, r2, #0x18
	b _080BEB92
_080BEB8E:
	movs r0, #0x80
	subs r2, r0, r1
_080BEB92:
	ldrb r0, [r5, #0x17]
	muls r0, r2, r0
	asrs r2, r0, #6
	ldrb r0, [r5, #0x16]
	eors r0, r2
	lsls r0, r0, #0x18
	beq _080BEBB4
	strb r2, [r5, #0x16]
	ldrb r0, [r5]
	ldrb r1, [r5, #0x18]
	cmp r1, #0
	bne _080BEBAE
	movs r1, #0xc
	b _080BEBB0
_080BEBAE:
	movs r1, #3
_080BEBB0:
	orrs r0, r1
	strb r0, [r5]
_080BEBB4:
	mov r3, sl
	mov r4, fp
_080BEBB8:
	subs r6, #1
	ble _080BEBC4
	movs r0, #0x50
	adds r5, r5, r0
	lsls r3, r3, #1
	b _080BEA9C
_080BEBC4:
	ldr r0, [r7, #0xc]
	adds r0, #1
	str r0, [r7, #0xc]
	cmp r4, #0
	bne _080BEBD6
	movs r0, #0x80
	lsls r0, r0, #0x18
	str r0, [r7, #4]
	b _080BEC8C
_080BEBD6:
	str r4, [r7, #4]
	ldrh r0, [r7, #0x22]
	subs r0, #0x96
_080BEBDC:
	strh r0, [r7, #0x22]
	cmp r0, #0x96
	blo _080BEBE4
	b _080BEA94
_080BEBE4:
	ldrb r2, [r7, #8]
	ldr r5, [r7, #0x2c]
_080BEBE8:
	ldrb r0, [r5]
	movs r1, #0x80
	tst r1, r0
	beq _080BEC82
	movs r1, #0xf
	tst r1, r0
	beq _080BEC82
	mov sb, r2
	adds r0, r7, #0
	adds r1, r5, #0
	bl TrkVolPitSet_rev01
	ldr r4, [r5, #0x20]
	cmp r4, #0
	beq _080BEC78
_080BEC06:
	ldrb r1, [r4]
	movs r0, #0xc7
	tst r0, r1
	bne _080BEC16
	adds r0, r4, #0
	bl ClearChain_rev
	b _080BEC72
_080BEC16:
	ldrb r0, [r4, #1]
	movs r6, #7
	ands r6, r0
	ldrb r3, [r5]
	movs r0, #3
	tst r0, r3
	beq _080BEC34
	bl ChnVolSetAsm
	cmp r6, #0
	beq _080BEC34
	ldrb r0, [r4, #0x1d]
	movs r1, #1
	orrs r0, r1
	strb r0, [r4, #0x1d]
_080BEC34:
	ldrb r3, [r5]
	movs r0, #0xc
	tst r0, r3
	beq _080BEC72
	ldrb r1, [r4, #8]
	movs r0, #8
	ldrsb r0, [r5, r0]
	adds r2, r1, r0
	bpl _080BEC48
	movs r2, #0
_080BEC48:
	cmp r6, #0
	beq _080BEC66
	mov r0, r8
	ldr r3, [r0, #0x30]
	adds r1, r2, #0
	ldrb r2, [r5, #9]
	adds r0, r6, #0
	bl sub_80BEC9C
	str r0, [r4, #0x20]
	ldrb r0, [r4, #0x1d]
	movs r1, #2
	orrs r0, r1
	strb r0, [r4, #0x1d]
	b _080BEC72
_080BEC66:
	adds r1, r2, #0
	ldrb r2, [r5, #9]
	ldr r0, [r4, #0x24]
	bl MidiKey2fr
	str r0, [r4, #0x20]
_080BEC72:
	ldr r4, [r4, #0x34]
	cmp r4, #0
	bne _080BEC06
_080BEC78:
	ldrb r0, [r5]
	movs r1, #0xf0
	ands r0, r1
	strb r0, [r5]
	mov r2, sb
_080BEC82:
	subs r2, #1
	ble _080BEC8C
	movs r0, #0x50
	adds r5, r5, r0
	bgt _080BEBE8
_080BEC8C:
	ldr r0, _080BECA8 @ =0x68736D53
	str r0, [r7, #0x34]
	pop {r0, r1, r2, r3, r4, r5, r6, r7}
	mov r8, r0
	mov sb, r1
	mov sl, r2
	mov fp, r3
	pop {r3}

	thumb_func_start sub_80BEC9C
sub_80BEC9C: @ 0x080BEC9C
	bx r3
	.align 2, 0
_080BECA0: .4byte gUnk_086C47D4
_080BECA4: .4byte 0x03007FF0
_080BECA8: .4byte 0x68736D53

	thumb_func_start TrackStop_rev01
TrackStop_rev01: @ 0x080BECAC
	push {r4, r5, r6, lr}
	adds r5, r1, #0
	ldrb r1, [r5]
	movs r0, #0x80
	tst r0, r1
	beq _080BECE4
	ldr r4, [r5, #0x20]
	cmp r4, #0
	beq _080BECE2
	movs r6, #0
_080BECC0:
	ldrb r0, [r4]
	cmp r0, #0
	beq _080BECDA
	ldrb r0, [r4, #1]
	movs r3, #7
	ands r0, r3
	beq _080BECD8
	ldr r3, _080BECEC @ =0x03007FF0
	ldr r3, [r3]
	ldr r3, [r3, #0x2c]
	bl sub_80BEC9C
_080BECD8:
	strb r6, [r4]
_080BECDA:
	str r6, [r4, #0x2c]
	ldr r4, [r4, #0x34]
	cmp r4, #0
	bne _080BECC0
_080BECE2:
	str r4, [r5, #0x20]
_080BECE4:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080BECEC: .4byte 0x03007FF0

	thumb_func_start ChnVolSetAsm
ChnVolSetAsm: @ 0x080BECF0
	ldrb r1, [r4, #0x12]
	movs r0, #0x14
	ldrsb r2, [r4, r0]
	movs r3, #0x80
	adds r3, r3, r2
	muls r3, r1, r3
	ldrb r0, [r5, #0x10]
	muls r0, r3, r0
	asrs r0, r0, #0xe
	cmp r0, #0xff
	bls _080BED08
	movs r0, #0xff
_080BED08:
	strb r0, [r4, #2]
	movs r3, #0x7f
	subs r3, r3, r2
	muls r3, r1, r3
	ldrb r0, [r5, #0x11]
	muls r0, r3, r0
	asrs r0, r0, #0xe
	cmp r0, #0xff
	bls _080BED1C
	movs r0, #0xff
_080BED1C:
	strb r0, [r4, #3]
	bx lr

	thumb_func_start ply_note_rev01
ply_note_rev01: @ 0x080BED20
	push {r4, r5, r6, r7, lr}
	mov r4, r8
	mov r5, sb
	mov r6, sl
	mov r7, fp
	push {r4, r5, r6, r7}
	sub sp, #0x18
	str r1, [sp]
	adds r5, r2, #0
	ldr r1, _080BEF18 @ =0x03007FF0
	ldr r1, [r1]
	str r1, [sp, #4]
	ldr r1, _080BEF1C @ =gUnk_086C47D4
	adds r0, r0, r1
	ldrb r0, [r0]
	strb r0, [r5, #4]
	ldr r3, [r5, #0x40]
	ldrb r0, [r3]
	cmp r0, #0x80
	bhs _080BED66
	strb r0, [r5, #5]
	adds r3, #1
	ldrb r0, [r3]
	cmp r0, #0x80
	bhs _080BED64
	strb r0, [r5, #6]
	adds r3, #1
	ldrb r0, [r3]
	cmp r0, #0x80
	bhs _080BED64
	ldrb r1, [r5, #4]
	adds r1, r1, r0
	strb r1, [r5, #4]
	adds r3, #1
_080BED64:
	str r3, [r5, #0x40]
_080BED66:
	movs r0, #0
	str r0, [sp, #0x14]
	adds r4, r5, #0
	adds r4, #0x24
	ldrb r2, [r4]
	movs r0, #0xc0
	tst r0, r2
	beq _080BEDB8
	ldrb r3, [r5, #5]
	movs r0, #0x40
	tst r0, r2
	beq _080BED86
	ldr r1, [r5, #0x2c]
	adds r1, r1, r3
	ldrb r0, [r1]
	b _080BED88
_080BED86:
	adds r0, r3, #0
_080BED88:
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #2
	ldr r0, [r5, #0x28]
	adds r1, r1, r0
	mov sb, r1
	mov r6, sb
	ldrb r1, [r6]
	movs r0, #0xc0
	tst r0, r1
	beq _080BEDA0
	b _080BEF06
_080BEDA0:
	movs r0, #0x80
	tst r0, r2
	beq _080BEDBC
	ldrb r1, [r6, #3]
	movs r0, #0x80
	tst r0, r1
	beq _080BEDB4
	subs r1, #0xc0
	lsls r1, r1, #1
	str r1, [sp, #0x14]
_080BEDB4:
	ldrb r3, [r6, #1]
	b _080BEDBC
_080BEDB8:
	mov sb, r4
	ldrb r3, [r5, #5]
_080BEDBC:
	str r3, [sp, #8]
	ldr r6, [sp]
	ldrb r1, [r6, #9]
	ldrb r0, [r5, #0x1d]
	adds r0, r0, r1
	cmp r0, #0xff
	bls _080BEDCC
	movs r0, #0xff
_080BEDCC:
	str r0, [sp, #0x10]
	mov r6, sb
	ldrb r0, [r6]
	movs r6, #7
	ands r6, r0
	str r6, [sp, #0xc]
	beq _080BEE0C
	ldr r0, [sp, #4]
	ldr r4, [r0, #0x1c]
	cmp r4, #0
	bne _080BEDE4
	b _080BEF06
_080BEDE4:
	subs r6, #1
	lsls r0, r6, #6
	adds r4, r4, r0
	ldrb r1, [r4]
	movs r0, #0xc7
	tst r0, r1
	beq _080BEE60
	movs r0, #0x40
	tst r0, r1
	bne _080BEE60
	ldrb r1, [r4, #0x13]
	ldr r0, [sp, #0x10]
	cmp r1, r0
	blo _080BEE60
	beq _080BEE04
	b _080BEF06
_080BEE04:
	ldr r0, [r4, #0x2c]
	cmp r0, r5
	bhs _080BEE60
	b _080BEF06
_080BEE0C:
	ldr r6, [sp, #0x10]
	adds r7, r5, #0
	movs r2, #0
	mov r8, r2
	ldr r4, [sp, #4]
	ldrb r3, [r4, #6]
	adds r4, #0x50
_080BEE1A:
	ldrb r1, [r4]
	movs r0, #0xc7
	tst r0, r1
	beq _080BEE60
	movs r0, #0x40
	tst r0, r1
	beq _080BEE34
	cmp r2, #0
	bne _080BEE38
	adds r2, #1
	ldrb r6, [r4, #0x13]
	ldr r7, [r4, #0x2c]
	b _080BEE52
_080BEE34:
	cmp r2, #0
	bne _080BEE54
_080BEE38:
	ldrb r0, [r4, #0x13]
	cmp r0, r6
	bhs _080BEE44
	adds r6, r0, #0
	ldr r7, [r4, #0x2c]
	b _080BEE52
_080BEE44:
	bhi _080BEE54
	ldr r0, [r4, #0x2c]
	cmp r0, r7
	bls _080BEE50
	adds r7, r0, #0
	b _080BEE52
_080BEE50:
	blo _080BEE54
_080BEE52:
	mov r8, r4
_080BEE54:
	adds r4, #0x40
	subs r3, #1
	bgt _080BEE1A
	mov r4, r8
	cmp r4, #0
	beq _080BEF06
_080BEE60:
	adds r0, r4, #0
	bl ClearChain_rev
	movs r1, #0
	str r1, [r4, #0x30]
	ldr r3, [r5, #0x20]
	str r3, [r4, #0x34]
	cmp r3, #0
	beq _080BEE74
	str r4, [r3, #0x30]
_080BEE74:
	str r4, [r5, #0x20]
	str r5, [r4, #0x2c]
	ldrb r0, [r5, #0x1b]
	strb r0, [r5, #0x1c]
	cmp r0, r1
	beq _080BEE86
	adds r1, r5, #0
	bl clear_modM
_080BEE86:
	ldr r0, [sp]
	adds r1, r5, #0
	bl TrkVolPitSet_rev01
	ldr r0, [r5, #4]
	str r0, [r4, #0x10]
	ldr r0, [sp, #0x10]
	strb r0, [r4, #0x13]
	ldr r0, [sp, #8]
	strb r0, [r4, #8]
	ldr r0, [sp, #0x14]
	strb r0, [r4, #0x14]
	mov r6, sb
	ldrb r0, [r6]
	strb r0, [r4, #1]
	ldr r7, [r6, #4]
	str r7, [r4, #0x24]
	ldr r0, [r6, #8]
	str r0, [r4, #4]
	ldrh r0, [r5, #0x1e]
	strh r0, [r4, #0xc]
	bl ChnVolSetAsm
	ldrb r1, [r4, #8]
	movs r0, #8
	ldrsb r0, [r5, r0]
	adds r3, r1, r0
	bpl _080BEEC0
	movs r3, #0
_080BEEC0:
	ldr r6, [sp, #0xc]
	cmp r6, #0
	beq _080BEEEE
	mov r6, sb
	ldrb r0, [r6, #2]
	strb r0, [r4, #0x1e]
	ldrb r1, [r6, #3]
	movs r0, #0x80
	tst r0, r1
	bne _080BEEDA
	movs r0, #0x70
	tst r0, r1
	bne _080BEEDC
_080BEEDA:
	movs r1, #8
_080BEEDC:
	strb r1, [r4, #0x1f]
	ldrb r2, [r5, #9]
	adds r1, r3, #0
	ldr r0, [sp, #0xc]
	ldr r3, [sp, #4]
	ldr r3, [r3, #0x30]
	bl sub_80BEC9C
	b _080BEEF8
_080BEEEE:
	ldrb r2, [r5, #9]
	adds r1, r3, #0
	adds r0, r7, #0
	bl MidiKey2fr
_080BEEF8:
	str r0, [r4, #0x20]
	movs r0, #0x80
	strb r0, [r4]
	ldrb r1, [r5]
	movs r0, #0xf0
	ands r0, r1
	strb r0, [r5]
_080BEF06:
	add sp, #0x18
	pop {r0, r1, r2, r3, r4, r5, r6, r7}
	mov r8, r0
	mov sb, r1
	mov sl, r2
	mov fp, r3
	pop {r0}
	bx r0
	.align 2, 0
_080BEF18: .4byte 0x03007FF0
_080BEF1C: .4byte gUnk_086C47D4

	thumb_func_start ply_endtie_rev01
ply_endtie_rev01: @ 0x080BEF20
	push {r4, r5}
	ldr r2, [r1, #0x40]
	ldrb r3, [r2]
	cmp r3, #0x80
	bhs _080BEF32
	strb r3, [r1, #5]
	adds r2, #1
	str r2, [r1, #0x40]
	b _080BEF34
_080BEF32:
	ldrb r3, [r1, #5]
_080BEF34:
	ldr r1, [r1, #0x20]
	cmp r1, #0
	beq _080BEF5C
	movs r4, #0x83
	movs r5, #0x40
_080BEF3E:
	ldrb r2, [r1]
	tst r2, r4
	beq _080BEF56
	tst r2, r5
	bne _080BEF56
	ldrb r0, [r1, #0x11]
	cmp r0, r3
	bne _080BEF56
	movs r0, #0x40
	orrs r2, r0
	strb r2, [r1]
	b _080BEF5C
_080BEF56:
	ldr r1, [r1, #0x34]
	cmp r1, #0
	bne _080BEF3E
_080BEF5C:
	pop {r4, r5}
	bx lr

	thumb_func_start clear_modM
clear_modM: @ 0x080BEF60
	movs r2, #0
	strb r2, [r1, #0x16]
	strb r2, [r1, #0x1a]
	ldrb r2, [r1, #0x18]
	cmp r2, #0
	bne _080BEF70
	movs r2, #0xc
	b _080BEF72
_080BEF70:
	movs r2, #3
_080BEF72:
	ldrb r3, [r1]
	orrs r3, r2
	strb r3, [r1]
	bx lr
	.align 2, 0

	thumb_func_start ld_r3_tp_adr_i_rev
ld_r3_tp_adr_i_rev: @ 0x080BEF7C
	ldr r2, [r1, #0x40]
	adds r3, r2, #1
	str r3, [r1, #0x40]
	ldrb r3, [r2]
	bx lr
	.align 2, 0

	thumb_func_start ply_lfos_rev01
ply_lfos_rev01: @ 0x080BEF88
	mov ip, lr
	bl ld_r3_tp_adr_i_rev
	strb r3, [r1, #0x19]
	cmp r3, #0
	bne _080BEF98
	bl clear_modM
_080BEF98:
	bx ip
	.align 2, 0

	thumb_func_start ply_mod_rev01
ply_mod_rev01: @ 0x080BEF9C
	mov ip, lr
	bl ld_r3_tp_adr_i_rev
	strb r3, [r1, #0x17]
	cmp r3, #0
	bne _080BEFAC
	bl clear_modM
_080BEFAC:
	bx ip
	.align 2, 0
