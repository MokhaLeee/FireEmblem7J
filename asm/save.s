	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_809F344
sub_809F344: @ 0x0809F344
	push {r4, r5, lr}
	adds r4, r0, #0
	bl sub_807A100
	adds r5, r0, #0
	bl sub_807A108
	adds r2, r0, #0
	adds r0, r5, #0
	adds r1, r4, #0
	bl WriteAndVerifySramFast
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_809F364
sub_809F364: @ 0x0809F364
	push {r4, r5, lr}
	adds r4, r0, #0
	bl GetPermanentFlagBits
	adds r5, r0, #0
	bl sub_807A0FC
	adds r2, r0, #0
	adds r0, r5, #0
	adds r1, r4, #0
	bl WriteAndVerifySramFast
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_809F384
sub_809F384: @ 0x0809F384
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	ldr r4, _0809F3A8 @ =ReadSramFast
	bl sub_807A100
	adds r5, r0, #0
	bl sub_807A108
	adds r2, r0, #0
	ldr r3, [r4]
	adds r0, r6, #0
	adds r1, r5, #0
	bl _call_via_r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0809F3A8: .4byte ReadSramFast

	thumb_func_start sub_809F3AC
sub_809F3AC: @ 0x0809F3AC
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	ldr r4, _0809F3D0 @ =ReadSramFast
	bl GetPermanentFlagBits
	adds r5, r0, #0
	bl sub_807A0FC
	adds r2, r0, #0
	ldr r3, [r4]
	adds r0, r6, #0
	adds r1, r5, #0
	bl _call_via_r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0809F3D0: .4byte ReadSramFast

	thumb_func_start sub_809F3D4
sub_809F3D4: @ 0x0809F3D4
	push {r4, lr}
	adds r4, r0, #0
	bl sub_802EBCC
	adds r1, r4, #0
	movs r2, #0xc8
	bl WriteAndVerifySramFast
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_809F3EC
sub_809F3EC: @ 0x0809F3EC
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r4, _0809F408 @ =ReadSramFast
	bl sub_802EBCC
	adds r1, r0, #0
	ldr r3, [r4]
	adds r0, r5, #0
	movs r2, #0xc8
	bl _call_via_r3
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0809F408: .4byte ReadSramFast

	thumb_func_start sub_809F40C
sub_809F40C: @ 0x0809F40C
	push {r4, r5, lr}
	sub sp, #0x64
	movs r4, #0
	mov r0, sp
	bl ReadGlobalSaveInfo
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0809F45C
	mov r0, sp
	bl GetGlobalCompletionCntByInfo
	adds r5, r0, #0
	bl sub_809F9F8
	rsbs r1, r0, #0
	orrs r1, r0
	asrs r4, r1, #0x1f
	movs r0, #2
	ands r4, r0
	mov r0, sp
	ldrb r1, [r0, #0xe]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0809F45C
	movs r0, #0xc
	ands r0, r1
	cmp r0, #0
	beq _0809F44A
	movs r4, #0xf
_0809F44A:
	movs r2, #0x10
	adds r0, r2, #0
	ands r0, r1
	cmp r0, #0
	beq _0809F456
	orrs r4, r2
_0809F456:
	cmp r5, #4
	ble _0809F45C
	orrs r4, r2
_0809F45C:
	adds r0, r4, #0
	add sp, #0x64
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_809F468
sub_809F468: @ 0x0809F468
	push {lr}
	sub sp, #0x64
	mov r0, sp
	bl ReadGlobalSaveInfo
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0809F47C
	movs r0, #0
	b _0809F484
_0809F47C:
	mov r0, sp
	ldrb r0, [r0, #0xe]
	lsls r0, r0, #0x1b
	lsrs r0, r0, #0x1f
_0809F484:
	add sp, #0x64
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_809F48C
sub_809F48C: @ 0x0809F48C
	movs r0, #1
	bx lr

	thumb_func_start sub_809F490
sub_809F490: @ 0x0809F490
	push {r4, lr}
	bl IsSramWorking
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0809F4A4
	movs r0, #0
	b _0809F4C0
_0809F4A0:
	movs r0, #1
	b _0809F4C0
_0809F4A4:
	movs r4, #0
_0809F4A6:
	adds r0, r4, #0
	bl sub_80A13B8
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0809F4A0
	adds r4, #1
	cmp r4, #2
	ble _0809F4A6
	bl sub_80A294C
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
_0809F4C0:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_809F4C8
sub_809F4C8: @ 0x0809F4C8
	push {lr}
	sub sp, #0x64
	mov r0, sp
	bl ReadGlobalSaveInfo
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0809F4E8
	mov r1, sp
	movs r0, #3
	ldrb r1, [r1, #0xe]
	ands r0, r1
	cmp r0, #0
	beq _0809F4E8
	movs r0, #1
	b _0809F4EA
_0809F4E8:
	movs r0, #0
_0809F4EA:
	add sp, #0x64
	pop {r1}
	bx r1

	thumb_func_start sub_809F4F0
sub_809F4F0: @ 0x0809F4F0
	push {r4, lr}
	movs r0, #0
	bl sub_809F994
	adds r4, r0, #0
	bl IsGamePlayedThrough
	ands r0, r4
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_809F50C
sub_809F50C: @ 0x0809F50C
	push {r4, lr}
	sub sp, #0x94
	movs r4, #0
	bl IsGamePlayedThrough
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0809F520
	movs r0, #0
	b _0809F580
_0809F520:
	mov r0, sp
	bl LoadAndVerfyRankData
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0809F57E
	mov r0, sp
	ldrb r0, [r0]
	lsls r0, r0, #0x1f
	cmp r0, #0
	beq _0809F538
	movs r4, #1
_0809F538:
	mov r0, sp
	ldrb r0, [r0, #0x18]
	lsls r0, r0, #0x1f
	cmp r0, #0
	beq _0809F546
	movs r0, #2
	orrs r4, r0
_0809F546:
	add r0, sp, #0x30
	ldrb r0, [r0]
	lsls r0, r0, #0x1f
	cmp r0, #0
	beq _0809F554
	movs r0, #4
	orrs r4, r0
_0809F554:
	add r0, sp, #0x48
	ldrb r0, [r0]
	lsls r0, r0, #0x1f
	cmp r0, #0
	beq _0809F562
	movs r0, #8
	orrs r4, r0
_0809F562:
	add r0, sp, #0x60
	ldrb r0, [r0]
	lsls r0, r0, #0x1f
	cmp r0, #0
	beq _0809F570
	movs r0, #0x10
	orrs r4, r0
_0809F570:
	add r0, sp, #0x78
	ldrb r0, [r0]
	lsls r0, r0, #0x1f
	cmp r0, #0
	beq _0809F57E
	movs r0, #0x20
	orrs r4, r0
_0809F57E:
	adds r0, r4, #0
_0809F580:
	add sp, #0x94
	pop {r4}
	pop {r1}
	bx r1

	thumb_func_start sub_809F588
sub_809F588: @ 0x0809F588
	push {lr}
	sub sp, #0x64
	mov r0, sp
	bl ReadGlobalSaveInfo
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0809F5A6
	bl IsExtraMapAvailable
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0809F5A6
	movs r0, #1
	b _0809F5A8
_0809F5A6:
	movs r0, #0
_0809F5A8:
	add sp, #0x64
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_809F5B0
sub_809F5B0: @ 0x0809F5B0
	push {r4, lr}
	sub sp, #0x48
	ldr r4, _0809F5EC @ =gBuf
	adds r0, r4, #0
	bl LoadBonusContentData
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0809F5F0
	movs r3, #0
	adds r1, r4, #0
	movs r2, #0x1f
_0809F5C8:
	ldrb r0, [r1]
	cmp r0, #0
	beq _0809F5DC
	ldrb r0, [r1, #1]
	cmp r0, #0
	bne _0809F5D6
	movs r3, #1
_0809F5D6:
	cmp r0, #2
	bne _0809F5DC
	movs r3, #1
_0809F5DC:
	adds r1, #0x14
	subs r2, #1
	cmp r2, #0
	bge _0809F5C8
	cmp r3, #0
	beq _0809F5F0
	movs r0, #1
	b _0809F5F2
	.align 2, 0
_0809F5EC: .4byte gBuf
_0809F5F0:
	movs r0, #0
_0809F5F2:
	add sp, #0x48
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_809F5FC
sub_809F5FC: @ 0x0809F5FC
	push {r4, r5, r6, r7, lr}
	adds r2, r0, #0
	ldr r7, _0809F62C @ =gUnk_08DAD284
	ldr r0, [r7]
	cmp r0, #0
	beq _0809F658
	movs r6, #0
	adds r5, r7, #0
	adds r3, r7, #4
	adds r4, r7, #0
_0809F610:
	ldr r0, [r4]
	cmp r0, r2
	bne _0809F61C
	ldr r0, [r3]
	cmp r0, r1
	bne _0809F628
_0809F61C:
	ldr r0, [r4]
	cmp r0, r1
	bne _0809F630
	ldr r0, [r3]
	cmp r0, r2
	beq _0809F636
_0809F628:
	movs r0, #2
	b _0809F65A
	.align 2, 0
_0809F62C: .4byte gUnk_08DAD284
_0809F630:
	ldr r0, [r3]
	cmp r0, r2
	bne _0809F63C
_0809F636:
	ldr r0, [r4]
	cmp r0, r1
	bne _0809F628
_0809F63C:
	ldr r0, [r3]
	cmp r0, r1
	bne _0809F648
	ldr r0, [r5]
	cmp r0, r2
	bne _0809F628
_0809F648:
	adds r6, #8
	adds r5, #8
	adds r3, #8
	adds r4, #8
	adds r0, r6, r7
	ldr r0, [r0]
	cmp r0, #0
	bne _0809F610
_0809F658:
	movs r0, #3
_0809F65A:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	thumb_func_start sub_809F660
sub_809F660: @ 0x0809F660
	push {r4, r5, lr}
	movs r5, #0
	ldr r4, _0809F668 @ =gUnk_08D67934
	b _0809F678
	.align 2, 0
_0809F668: .4byte gUnk_08D67934
_0809F66C:
	ldrb r0, [r4]
	ldrb r1, [r4, #1]
	bl sub_809F5FC
	adds r5, r5, r0
	adds r4, #0x14
_0809F678:
	ldrb r0, [r4]
	cmp r0, #0
	bne _0809F66C
	adds r0, r5, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_809F688
sub_809F688: @ 0x0809F688
	push {r4, r5, r6, r7, lr}
	sub sp, #0x64
	adds r4, r0, #0
	movs r5, #0
	cmp r4, #0
	bne _0809F69C
	mov r4, sp
	mov r0, sp
	bl ReadGlobalSaveInfo
_0809F69C:
	movs r0, #0
	adds r7, r4, #0
	adds r7, #0x20
	movs r6, #3
_0809F6A4:
	movs r2, #0
	adds r4, r0, #1
	adds r0, r7, r0
	ldrb r3, [r0]
_0809F6AC:
	lsls r1, r2, #1
	adds r0, r3, #0
	asrs r0, r1
	ands r0, r6
	adds r5, r5, r0
	adds r2, #1
	cmp r2, #3
	ble _0809F6AC
	adds r0, r4, #0
	cmp r0, #0x1f
	ble _0809F6A4
	adds r0, r5, #0
	add sp, #0x64
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	thumb_func_start sub_809F6CC
sub_809F6CC: @ 0x0809F6CC
	push {r4, r5, lr}
	movs r0, #0
	bl sub_809F688
	adds r4, r0, #0
	bl sub_809F660
	adds r5, r0, #0
	cmp r4, #0
	ble _0809F6F2
	movs r0, #0x64
	muls r0, r4, r0
	adds r1, r5, #0
	bl __divsi3
	cmp r0, #0
	bne _0809F6F2
	movs r4, #1
	b _0809F6FE
_0809F6F2:
	movs r0, #0x64
	muls r0, r4, r0
	adds r1, r5, #0
	bl __divsi3
	adds r4, r0, #0
_0809F6FE:
	cmp r4, #0x64
	ble _0809F704
	movs r4, #0x64
_0809F704:
	adds r0, r4, #0
	pop {r4, r5}
	pop {r1}
	bx r1

	thumb_func_start sub_809F70C
sub_809F70C: @ 0x0809F70C
	push {r4, r5, r6, r7, lr}
	sub sp, #0x68
	adds r3, r0, #0
	adds r7, r1, #0
	adds r4, r2, #0
	movs r6, #0
	ldr r5, _0809F730 @ =gUnk_08D67934
	cmp r4, #0
	bne _0809F72A
	mov r4, sp
	mov r0, sp
	str r3, [sp, #0x64]
	bl ReadGlobalSaveInfo
	ldr r3, [sp, #0x64]
_0809F72A:
	adds r4, #0x20
	b _0809F738
	.align 2, 0
_0809F730: .4byte gUnk_08D67934
_0809F734:
	adds r6, #1
	adds r5, #0x14
_0809F738:
	ldrb r0, [r5]
	cmp r0, #0
	beq _0809F754
	adds r1, r0, #0
	cmp r1, r3
	bne _0809F74A
	ldrb r0, [r5, #1]
	cmp r0, r7
	beq _0809F754
_0809F74A:
	cmp r1, r7
	bne _0809F734
	ldrb r0, [r5, #1]
	cmp r0, r3
	bne _0809F734
_0809F754:
	asrs r1, r6, #2
	movs r2, #3
	ands r6, r2
	lsls r0, r6, #1
	adds r1, r4, r1
	ldrb r1, [r1]
	asrs r1, r0
	adds r0, r1, #0
	ands r0, r2
	add sp, #0x68
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_809F770
sub_809F770: @ 0x0809F770
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x78
	mov sb, r0
	adds r6, r1, #0
	mov sl, r2
	ldr r1, _0809F7B0 @ =gCharacterData
	mov r7, sb
	subs r7, #1
	movs r0, #0x34
	adds r2, r7, #0
	muls r2, r0, r2
	str r2, [sp, #0x64]
	adds r0, r1, #0
	adds r0, #0x2c
	adds r2, r2, r0
	mov r8, r2
	ldr r0, [r2]
	cmp r0, #0
	bne _0809F7B4
	movs r0, #0
	movs r1, #6
_0809F7A2:
	strb r0, [r6]
	adds r6, #1
	subs r1, #1
	cmp r1, #0
	bge _0809F7A2
	b _0809F876
	.align 2, 0
_0809F7B0: .4byte gCharacterData
_0809F7B4:
	movs r5, #0
	ldr r4, _0809F83C @ =gUnk_08D67934
	mov r3, sl
	cmp r3, #0
	bne _0809F7C6
	mov sl, sp
	mov r0, sp
	bl ReadGlobalSaveInfo
_0809F7C6:
	ldrb r0, [r4]
	str r7, [sp, #0x70]
	cmp r0, #0
	beq _0809F856
	mov r7, r8
	str r7, [sp, #0x6c]
	ldr r0, [sp, #0x64]
	str r0, [sp, #0x68]
_0809F7D6:
	ldrb r0, [r4]
	cmp r0, sb
	beq _0809F7EC
	ldrb r0, [r4, #1]
	adds r1, r5, #1
	mov ip, r1
	adds r2, r4, #0
	adds r2, #0x14
	str r2, [sp, #0x74]
	cmp r0, sb
	bne _0809F84C
_0809F7EC:
	asrs r2, r5, #2
	adds r0, r5, #0
	movs r3, #3
	ands r0, r3
	lsls r0, r0, #1
	mov r8, r0
	movs r1, #0
	ldr r7, [sp, #0x6c]
	ldr r0, [r7]
	adds r5, #1
	mov ip, r5
	adds r3, r4, #0
	adds r3, #0x14
	str r3, [sp, #0x74]
	ldrb r0, [r0, #0x15]
	cmp r1, r0
	bge _0809F84C
	ldr r0, _0809F840 @ =0x08C4C184
	ldr r5, [sp, #0x68]
	adds r3, r5, r0
	mov r0, sl
	adds r0, #0x20
	adds r5, r0, r2
_0809F81A:
	ldr r2, [r3]
	adds r0, r2, r1
	ldrb r0, [r0]
	ldrb r7, [r4]
	cmp r7, r0
	beq _0809F82C
	ldrb r7, [r4, #1]
	cmp r7, r0
	bne _0809F844
_0809F82C:
	adds r1, r6, r1
	ldrb r0, [r5]
	mov r2, r8
	asrs r0, r2
	movs r3, #3
	ands r0, r3
	strb r0, [r1]
	b _0809F84C
	.align 2, 0
_0809F83C: .4byte gUnk_08D67934
_0809F840: .4byte 0x08C4C184
_0809F844:
	adds r1, #1
	ldrb r2, [r2, #0x15]
	cmp r1, r2
	blt _0809F81A
_0809F84C:
	mov r5, ip
	ldr r4, [sp, #0x74]
	ldrb r0, [r4]
	cmp r0, #0
	bne _0809F7D6
_0809F856:
	movs r0, #0x34
	ldr r5, [sp, #0x70]
	muls r0, r5, r0
	ldr r1, _0809F888 @ =gCharacterData
	adds r1, #0x2c
	adds r0, r0, r1
	ldr r0, [r0]
	ldrb r1, [r0, #0x15]
	cmp r1, #6
	bgt _0809F876
	movs r2, #0
_0809F86C:
	adds r0, r6, r1
	strb r2, [r0]
	adds r1, #1
	cmp r1, #6
	ble _0809F86C
_0809F876:
	add sp, #0x78
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0809F888: .4byte gCharacterData

	thumb_func_start sub_809F88C
sub_809F88C: @ 0x0809F88C
	push {r4, r5, r6, r7, lr}
	sub sp, #0x64
	adds r5, r0, #0
	adds r4, r1, #0
	movs r6, #3
	ands r6, r2
	mov r0, sp
	bl ReadGlobalSaveInfo
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0809F8FC
	movs r3, #0
	ldr r2, _0809F8AC @ =gUnk_08D67934
	add r7, sp, #0x20
	b _0809F8B4
	.align 2, 0
_0809F8AC: .4byte gUnk_08D67934
_0809F8B0:
	adds r3, #1
	adds r2, #0x14
_0809F8B4:
	ldrb r0, [r2]
	cmp r0, #0
	beq _0809F8D0
	adds r1, r0, #0
	cmp r1, r5
	bne _0809F8C6
	ldrb r0, [r2, #1]
	cmp r0, r4
	beq _0809F8D0
_0809F8C6:
	cmp r1, r4
	bne _0809F8B0
	ldrb r0, [r2, #1]
	cmp r0, r5
	bne _0809F8B0
_0809F8D0:
	asrs r0, r3, #2
	movs r4, #3
	ands r3, r4
	lsls r1, r3, #1
	adds r3, r7, r0
	ldrb r2, [r3]
	adds r0, r2, #0
	asrs r0, r1
	ands r0, r4
	cmp r0, r6
	bge _0809F8FC
	adds r0, r4, #0
	lsls r0, r1
	bics r2, r0
	lsls r6, r1
	adds r0, r2, r6
	strb r0, [r3]
	mov r0, sp
	bl WriteGlobalSaveInfo
	movs r0, #1
	b _0809F8FE
_0809F8FC:
	movs r0, #0
_0809F8FE:
	add sp, #0x64
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_809F908
sub_809F908: @ 0x0809F908
	push {r4, r5, lr}
	sub sp, #0x64
	adds r4, r0, #0
	adds r5, r1, #0
	movs r3, #0
	movs r0, #0x80
	lsls r0, r0, #1
	cmp r4, r0
	bgt _0809F948
	cmp r5, #0
	bne _0809F928
	mov r5, sp
	mov r0, sp
	bl ReadGlobalSaveInfo
	movs r3, #1
_0809F928:
	asrs r0, r4, #3
	adds r2, r5, #0
	adds r2, #0x40
	adds r2, r2, r0
	movs r1, #7
	ands r1, r4
	movs r0, #1
	lsls r0, r1
	ldrb r1, [r2]
	orrs r0, r1
	strb r0, [r2]
	cmp r3, #0
	beq _0809F948
	adds r0, r5, #0
	bl WriteGlobalSaveInfo
_0809F948:
	add sp, #0x64
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start sub_809F950
sub_809F950: @ 0x0809F950
	push {r4, r5, lr}
	sub sp, #0x64
	adds r5, r0, #0
	adds r4, r1, #0
	movs r0, #0x80
	lsls r0, r0, #1
	cmp r5, r0
	bgt _0809F986
	cmp r4, #0
	bne _0809F96C
	mov r4, sp
	mov r0, sp
	bl ReadGlobalSaveInfo
_0809F96C:
	asrs r0, r5, #3
	adds r1, r4, #0
	adds r1, #0x40
	adds r1, r1, r0
	movs r0, #7
	ands r0, r5
	ldrb r1, [r1]
	asrs r1, r0
	adds r0, r1, #0
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	bne _0809F98A
_0809F986:
	movs r0, #0
	b _0809F98C
_0809F98A:
	movs r0, #1
_0809F98C:
	add sp, #0x64
	pop {r4, r5}
	pop {r1}
	bx r1

	thumb_func_start sub_809F994
sub_809F994: @ 0x0809F994
	push {r4, lr}
	sub sp, #0x64
	adds r4, r0, #0
	cmp r4, #0
	bne _0809F9A6
	mov r4, sp
	mov r0, sp
	bl ReadGlobalSaveInfo
_0809F9A6:
	movs r1, #0
	adds r2, r4, #0
	adds r2, #0x40
_0809F9AC:
	adds r0, r2, r1
	ldrb r0, [r0]
	cmp r0, #0
	beq _0809F9B8
	movs r0, #1
	b _0809F9C0
_0809F9B8:
	adds r1, #1
	cmp r1, #0x1f
	ble _0809F9AC
	movs r0, #0
_0809F9C0:
	add sp, #0x64
	pop {r4}
	pop {r1}
	bx r1

	thumb_func_start nullsub_82
nullsub_82: @ 0x0809F9C8
	bx lr
	.align 2, 0

	thumb_func_start nullsub_83
nullsub_83: @ 0x0809F9CC
	bx lr
	.align 2, 0

	thumb_func_start IsGamePlayedThrough
IsGamePlayedThrough: @ 0x0809F9D0
	push {lr}
	sub sp, #0x64
	mov r0, sp
	bl ReadGlobalSaveInfo
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0809F9F0
	mov r1, sp
	movs r0, #1
	ldrb r1, [r1, #0xe]
	ands r0, r1
	cmp r0, #0
	beq _0809F9F0
	movs r0, #1
	b _0809F9F2
_0809F9F0:
	movs r0, #0
_0809F9F2:
	add sp, #0x64
	pop {r1}
	bx r1

	thumb_func_start sub_809F9F8
sub_809F9F8: @ 0x0809F9F8
	push {r4, lr}
	sub sp, #0x88
	add r4, sp, #0x24
	adds r0, r4, #0
	bl ReadGlobalSaveInfo
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0809FA20
	adds r0, r4, #0
	bl GetGlobalCompletionCntByInfo
	cmp r0, #9
	ble _0809FA18
	movs r0, #2
	b _0809FA34
_0809FA18:
	cmp r0, #7
	ble _0809FA20
	movs r0, #1
	b _0809FA34
_0809FA20:
	mov r0, sp
	bl sub_809FA3C
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0809FA30
	movs r0, #0
	b _0809FA34
_0809FA30:
	mov r0, sp
	ldrh r0, [r0, #0x20]
_0809FA34:
	add sp, #0x88
	pop {r4}
	pop {r1}
	bx r1

	thumb_func_start sub_809FA3C
sub_809FA3C: @ 0x0809FA3C
	push {r4, lr}
	sub sp, #0x24
	adds r4, r0, #0
	bl IsSramWorking
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0809FA88
	cmp r4, #0
	bne _0809FA52
	mov r4, sp
_0809FA52:
	ldr r1, _0809FA7C @ =ReadSramFast
	ldr r0, _0809FA80 @ =gSramMain
	ldr r0, [r0]
	ldr r2, _0809FA84 @ =0x000070D8
	adds r0, r0, r2
	ldr r3, [r1]
	adds r1, r4, #0
	movs r2, #0x24
	bl _call_via_r3
	adds r0, r4, #0
	movs r1, #0x22
	bl Checksum16
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldrh r4, [r4, #0x22]
	cmp r4, r0
	bne _0809FA88
	movs r0, #1
	b _0809FA8A
	.align 2, 0
_0809FA7C: .4byte ReadSramFast
_0809FA80: .4byte gSramMain
_0809FA84: .4byte 0x000070D8
_0809FA88:
	movs r0, #0
_0809FA8A:
	add sp, #0x24
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_809FA94
sub_809FA94: @ 0x0809FA94
	push {r4, lr}
	adds r4, r0, #0
	movs r1, #0x22
	bl Checksum16
	strh r0, [r4, #0x22]
	ldr r0, _0809FAB8 @ =gSramMain
	ldr r1, [r0]
	ldr r0, _0809FABC @ =0x000070D8
	adds r1, r1, r0
	adds r0, r4, #0
	movs r2, #0x24
	bl WriteAndVerifySramFast
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0809FAB8: .4byte gSramMain
_0809FABC: .4byte 0x000070D8

	thumb_func_start sub_809FAC0
sub_809FAC0: @ 0x0809FAC0
	push {lr}
	sub sp, #4
	adds r1, r0, #0
	movs r0, #0
	str r0, [sp]
	ldr r2, _0809FAD8 @ =0x01000009
	mov r0, sp
	bl CpuFastSet
	add sp, #4
	pop {r0}
	bx r0
	.align 2, 0
_0809FAD8: .4byte 0x01000009

	thumb_func_start sub_809FADC
sub_809FADC: @ 0x0809FADC
	asrs r2, r1, #5
	lsls r2, r2, #2
	adds r0, r0, r2
	ldr r0, [r0]
	movs r2, #0x1f
	ands r2, r1
	movs r1, #1
	lsls r1, r2
	ands r0, r1
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bx lr

	thumb_func_start sub_809FAF4
sub_809FAF4: @ 0x0809FAF4
	asrs r2, r1, #5
	lsls r2, r2, #2
	adds r0, r0, r2
	movs r2, #0x1f
	ands r2, r1
	movs r3, #1
	lsls r3, r2
	ldr r1, [r0]
	orrs r1, r3
	str r1, [r0]
	bx lr
	.align 2, 0

	thumb_func_start sub_809FB0C
sub_809FB0C: @ 0x0809FB0C
	strh r1, [r0, #0x20]
	bx lr

	thumb_func_start sub_809FB10
sub_809FB10: @ 0x0809FB10
	ldrh r0, [r0, #0x20]
	bx lr

	thumb_func_start LoadAndVerfyRankData
LoadAndVerfyRankData: @ 0x0809FB14
	push {r4, r5, lr}
	adds r5, r0, #0
	bl IsSramWorking
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0809FB68
	cmp r5, #0
	bne _0809FB28
	ldr r5, _0809FB58 @ =gBuf
_0809FB28:
	ldr r1, _0809FB5C @ =ReadSramFast
	ldr r0, _0809FB60 @ =gSramMain
	ldr r0, [r0]
	ldr r2, _0809FB64 @ =0x00007044
	adds r0, r0, r2
	ldr r3, [r1]
	adds r1, r5, #0
	movs r2, #0x94
	bl _call_via_r3
	adds r4, r5, #0
	adds r4, #0x90
	adds r0, r5, #0
	movs r1, #0x90
	bl Checksum16
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldrh r4, [r4]
	cmp r4, r0
	bne _0809FB68
	movs r0, #1
	b _0809FB6A
	.align 2, 0
_0809FB58: .4byte gBuf
_0809FB5C: .4byte ReadSramFast
_0809FB60: .4byte gSramMain
_0809FB64: .4byte 0x00007044
_0809FB68:
	movs r0, #0
_0809FB6A:
	pop {r4, r5}
	pop {r1}
	bx r1

	thumb_func_start LoadBonusContentData
LoadBonusContentData: @ 0x0809FB70
	push {r4, r5, lr}
	adds r5, r0, #0
	bl IsSramWorking
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0809FBC4
	cmp r5, #0
	bne _0809FB84
	ldr r5, _0809FBB4 @ =gBuf
_0809FB84:
	ldr r1, _0809FBB8 @ =ReadSramFast
	ldr r0, _0809FBBC @ =gSramMain
	ldr r0, [r0]
	ldr r2, _0809FBC0 @ =0x00007134
	adds r0, r0, r2
	movs r2, #0xa1
	lsls r2, r2, #2
	ldr r3, [r1]
	adds r1, r5, #0
	bl _call_via_r3
	movs r1, #0xa0
	lsls r1, r1, #2
	adds r4, r5, r1
	adds r0, r5, #0
	bl Checksum16
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldrh r4, [r4]
	cmp r4, r0
	bne _0809FBC4
	movs r0, #1
	b _0809FBC6
	.align 2, 0
_0809FBB4: .4byte gBuf
_0809FBB8: .4byte ReadSramFast
_0809FBBC: .4byte gSramMain
_0809FBC0: .4byte 0x00007134
_0809FBC4:
	movs r0, #0
_0809FBC6:
	pop {r4, r5}
	pop {r1}
	bx r1

	thumb_func_start SaveBonusContentData
SaveBonusContentData: @ 0x0809FBCC
	push {r4, r5, lr}
	adds r5, r0, #0
	movs r4, #0xa0
	lsls r4, r4, #2
	adds r1, r4, #0
	bl Checksum16
	adds r4, r5, r4
	strh r0, [r4]
	ldr r0, _0809FBF8 @ =gSramMain
	ldr r1, [r0]
	ldr r0, _0809FBFC @ =0x00007134
	adds r1, r1, r0
	movs r2, #0xa1
	lsls r2, r2, #2
	adds r0, r5, #0
	bl WriteAndVerifySramFast
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0809FBF8: .4byte gSramMain
_0809FBFC: .4byte 0x00007134

	thumb_func_start sub_809FC00
sub_809FC00: @ 0x0809FC00
	push {r4, lr}
	adds r4, r0, #0
	movs r1, #0x90
	bl Checksum16
	adds r1, r4, #0
	adds r1, #0x90
	strh r0, [r1]
	ldr r0, _0809FC28 @ =gSramMain
	ldr r1, [r0]
	ldr r0, _0809FC2C @ =0x00007044
	adds r1, r1, r0
	adds r0, r4, #0
	movs r2, #0x94
	bl WriteAndVerifySramFast
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0809FC28: .4byte gSramMain
_0809FC2C: .4byte 0x00007044

	thumb_func_start sub_809FC30
sub_809FC30: @ 0x0809FC30
	push {lr}
	sub sp, #0x98
	add r0, sp, #0x94
	movs r1, #0
	strh r1, [r0]
	ldr r2, _0809FC50 @ =0x0100004A
	mov r1, sp
	bl CpuSet
	mov r0, sp
	bl sub_809FC00
	add sp, #0x98
	pop {r0}
	bx r0
	.align 2, 0
_0809FC50: .4byte 0x0100004A

	thumb_func_start sub_809FC54
sub_809FC54: @ 0x0809FC54
	ldr r0, _0809FC5C @ =gPlaySt
	ldrb r0, [r0, #0x1b]
	subs r0, #1
	bx lr
	.align 2, 0
_0809FC5C: .4byte gPlaySt

	thumb_func_start sub_809FC60
sub_809FC60: @ 0x0809FC60
	push {r4, r5, r6, r7, lr}
	sub sp, #0x98
	adds r6, r0, #0
	adds r7, r1, #0
	adds r5, r2, #0
	add r0, sp, #0x94
	movs r4, #0
	strh r4, [r0]
	ldr r2, _0809FC98 @ =0x0100000C
	adds r1, r6, #0
	bl CpuSet
	mov r0, sp
	adds r0, #0x96
	strh r4, [r0]
	ldr r2, _0809FC9C @ =0x0100004A
	mov r1, sp
	bl CpuSet
	mov r0, sp
	bl LoadAndVerfyRankData
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0809FCA0
	movs r0, #0
	b _0809FCBC
	.align 2, 0
_0809FC98: .4byte 0x0100000C
_0809FC9C: .4byte 0x0100004A
_0809FCA0:
	lsls r0, r5, #1
	adds r0, r0, r5
	adds r0, r7, r0
	lsls r2, r0, #1
	adds r2, r2, r0
	lsls r2, r2, #3
	adds r1, r6, #0
	mov r3, sp
	adds r0, r3, r2
	ldm r0!, {r2, r3, r4}
	stm r1!, {r2, r3, r4}
	ldm r0!, {r2, r3, r4}
	stm r1!, {r2, r3, r4}
	movs r0, #1
_0809FCBC:
	add sp, #0x98
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	thumb_func_start sub_809FCC4
sub_809FCC4: @ 0x0809FCC4
	push {r4, r5, r6, lr}
	sub sp, #0x94
	adds r6, r0, #0
	adds r5, r1, #0
	adds r4, r2, #0
	mov r0, sp
	bl LoadAndVerfyRankData
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0809FCFA
	lsls r1, r4, #1
	adds r1, r1, r4
	adds r1, r5, r1
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #3
	mov r2, sp
	adds r1, r2, r0
	adds r0, r6, #0
	ldm r0!, {r2, r3, r4}
	stm r1!, {r2, r3, r4}
	ldm r0!, {r2, r3, r4}
	stm r1!, {r2, r3, r4}
	mov r0, sp
	bl sub_809FC00
_0809FCFA:
	add sp, #0x94
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_809FD04
sub_809FD04: @ 0x0809FD04
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	ldrb r2, [r5]
	lsls r0, r2, #0x1f
	cmp r0, #0
	beq _0809FDB2
	ldrb r1, [r4]
	lsls r0, r1, #0x1c
	lsrs r1, r0, #0x1d
	lsls r0, r2, #0x1c
	lsrs r0, r0, #0x1d
	cmp r1, r0
	bgt _0809FDB2
	cmp r1, r0
	bne _0809FDBC
	ldrb r0, [r4, #0x17]
	cmp r0, #0
	beq _0809FD30
	ldrb r2, [r5, #0x17]
	cmp r0, r2
	bne _0809FDB2
_0809FD30:
	ldrh r0, [r4, #2]
	lsls r1, r0, #0x11
	lsrs r1, r1, #0x18
	ldrh r2, [r5, #2]
	lsls r0, r2, #0x11
	lsrs r0, r0, #0x18
	cmp r1, r0
	bgt _0809FDB2
	ldrb r0, [r4, #7]
	lsrs r2, r0, #5
	ldr r0, [r4, #8]
	ldr r1, _0809FDB8 @ =0x001FFFFF
	ands r0, r1
	lsls r3, r0, #3
	orrs r3, r2
	ldrb r0, [r5, #7]
	lsrs r2, r0, #5
	ldr r0, [r5, #8]
	ands r0, r1
	lsls r0, r0, #3
	orrs r0, r2
	cmp r3, r0
	bgt _0809FDB2
	cmp r3, r0
	bne _0809FDBC
	ldr r0, [r4, #4]
	lsls r0, r0, #0xf
	lsrs r0, r0, #0x16
	lsls r3, r0, #3
	subs r3, r3, r0
	lsls r3, r3, #5
	adds r3, r3, r0
	lsls r3, r3, #4
	ldrb r2, [r4, #6]
	lsls r1, r2, #0x19
	lsrs r1, r1, #0x1a
	lsls r0, r1, #4
	subs r0, r0, r1
	lsls r0, r0, #2
	adds r3, r3, r0
	ldrh r4, [r4, #6]
	lsls r0, r4, #0x13
	lsrs r0, r0, #0x1a
	adds r3, r3, r0
	ldr r0, [r5, #4]
	lsls r0, r0, #0xf
	lsrs r0, r0, #0x16
	lsls r2, r0, #3
	subs r2, r2, r0
	lsls r2, r2, #5
	adds r2, r2, r0
	lsls r2, r2, #4
	ldrb r0, [r5, #6]
	lsls r1, r0, #0x19
	lsrs r1, r1, #0x1a
	lsls r0, r1, #4
	subs r0, r0, r1
	lsls r0, r0, #2
	adds r2, r2, r0
	ldrh r5, [r5, #6]
	lsls r0, r5, #0x13
	lsrs r0, r0, #0x1a
	adds r2, r2, r0
	cmp r3, r2
	bge _0809FDBC
_0809FDB2:
	movs r0, #1
	b _0809FDBE
	.align 2, 0
_0809FDB8: .4byte 0x001FFFFF
_0809FDBC:
	movs r0, #0
_0809FDBE:
	pop {r4, r5}
	pop {r1}
	bx r1

	thumb_func_start sub_809FDC4
sub_809FDC4: @ 0x0809FDC4
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	adds r7, r0, #0
	adds r4, r1, #0
	adds r5, r2, #0
	movs r0, #0
	mov sb, r0
	add r0, sp, #4
	movs r1, #0
	mov r8, r1
	mov r2, sb
	strh r2, [r0]
	ldr r2, _0809FED0 @ =0x0100000C
	adds r1, r7, #0
	bl CpuSet
	movs r6, #1
	ldrb r0, [r7]
	orrs r0, r6
	strb r0, [r7]
	movs r0, #3
	ands r4, r0
	lsls r4, r4, #3
	movs r0, #0x19
	rsbs r0, r0, #0
	ldrb r3, [r7, #2]
	ands r0, r3
	orrs r0, r4
	ands r5, r6
	lsls r5, r5, #5
	movs r1, #0x21
	rsbs r1, r1, #0
	ands r0, r1
	orrs r0, r5
	strb r0, [r7, #2]
	bl sub_8017574
	movs r2, #7
	ands r2, r0
	lsls r2, r2, #5
	movs r1, #0x1f
	ldrb r3, [r7, #7]
	ands r1, r3
	orrs r1, r2
	strb r1, [r7, #7]
	lsls r0, r0, #8
	lsrs r0, r0, #0xb
	ldr r1, [r7, #8]
	ldr r2, _0809FED4 @ =0xFFE00000
	ands r1, r2
	orrs r1, r0
	str r1, [r7, #8]
	ldr r2, _0809FED8 @ =gPlaySt
	adds r0, r2, #0
	adds r0, #0x2b
	ldrb r0, [r0]
	lsls r0, r0, #0x1f
	lsrs r0, r0, #0x1f
	ands r0, r6
	lsls r0, r0, #6
	movs r1, #0x41
	rsbs r1, r1, #0
	ldrb r3, [r7, #2]
	ands r1, r3
	orrs r1, r0
	strb r1, [r7, #2]
	ldrh r2, [r2, #0x2c]
	lsls r1, r2, #0x13
	lsrs r1, r1, #0x17
	movs r0, #0xff
	ands r1, r0
	lsls r1, r1, #7
	ldr r0, _0809FEDC @ =0xFFFF807F
	ldrh r2, [r7, #2]
	ands r0, r2
	orrs r0, r1
	strh r0, [r7, #2]
	bl sub_80A067C
	mov r4, sp
	adds r4, #6
	add r5, sp, #8
	mov r6, sp
	adds r6, #0xa
	adds r1, r4, #0
	adds r2, r5, #0
	adds r3, r6, #0
	bl FormatTime
	ldr r1, _0809FEE0 @ =0x000003FF
	ldrh r4, [r4]
	ands r1, r4
	lsls r1, r1, #7
	ldr r0, [r7, #4]
	ldr r2, _0809FEE4 @ =0xFFFE007F
	ands r0, r2
	orrs r0, r1
	str r0, [r7, #4]
	movs r1, #0x3f
	ldrh r5, [r5]
	ands r1, r5
	lsls r1, r1, #1
	movs r0, #0x7f
	rsbs r0, r0, #0
	ldrb r3, [r7, #6]
	ands r0, r3
	orrs r0, r1
	strb r0, [r7, #6]
	movs r1, #0x3f
	ldrh r6, [r6]
	ands r1, r6
	lsls r1, r1, #7
	ldr r0, _0809FEE8 @ =0xFFFFE07F
	ldrh r2, [r7, #6]
	ands r0, r2
	orrs r0, r1
	strh r0, [r7, #6]
	movs r0, #0x7f
	ldrb r3, [r7, #3]
	ands r0, r3
	strb r0, [r7, #3]
	movs r0, #0x80
	rsbs r0, r0, #0
	ldrb r1, [r7, #4]
	ands r0, r1
	strb r0, [r7, #4]
	mov r2, r8
	strb r2, [r7, #0x17]
	movs r4, #1
	b _0809FEF4
	.align 2, 0
_0809FED0: .4byte 0x0100000C
_0809FED4: .4byte 0xFFE00000
_0809FED8: .4byte gPlaySt
_0809FEDC: .4byte 0xFFFF807F
_0809FEE0: .4byte 0x000003FF
_0809FEE4: .4byte 0xFFFE007F
_0809FEE8: .4byte 0xFFFFE07F
_0809FEEC:
	ldrb r0, [r2, #4]
	strb r0, [r7, #0x17]
	b _0809FF1C
_0809FEF2:
	adds r4, #1
_0809FEF4:
	cmp r4, #0x3f
	bgt _0809FF1C
	adds r0, r4, #0
	bl GetUnit
	cmp r0, #0
	beq _0809FEF2
	ldr r2, [r0]
	cmp r2, #0
	beq _0809FEF2
	ldr r1, [r0, #0xc]
	movs r0, #0x80
	lsls r0, r0, #6
	ands r0, r1
	cmp r0, #0
	beq _0809FEF2
	movs r0, #4
	ands r1, r0
	cmp r1, #0
	beq _0809FEEC
_0809FF1C:
	movs r5, #1
	movs r3, #0xc
	adds r3, r3, r7
	mov sl, r3
	movs r0, #0x7f
	mov r8, r0
	movs r6, #0x7f
_0809FF2A:
	adds r0, r5, #0
	bl GetUnit
	adds r4, r0, #0
	cmp r4, #0
	beq _0809FF84
	ldr r2, [r4]
	cmp r2, #0
	beq _0809FF84
	ldr r0, [r4, #0xc]
	ldr r1, _080A0048 @ =0x00010004
	ands r0, r1
	cmp r0, #0
	bne _0809FF84
	ldrb r0, [r2, #4]
	bl sub_80A0BDC
	cmp r0, sb
	ble _0809FF84
	ldr r0, [r4]
	ldrb r0, [r0, #4]
	bl sub_80A0BDC
	mov sb, r0
	ldr r0, [r4]
	ldrb r2, [r0, #4]
	movs r1, #1
	ands r1, r2
	lsls r1, r1, #7
	adds r0, r6, #0
	ldrb r3, [r7, #3]
	ands r0, r3
	orrs r0, r1
	strb r0, [r7, #3]
	lsrs r2, r2, #1
	ands r2, r6
	mov r0, r8
	ands r2, r0
	movs r1, #0x80
	rsbs r1, r1, #0
	adds r0, r1, #0
	ldrb r3, [r7, #4]
	ands r0, r3
	orrs r0, r2
	strb r0, [r7, #4]
_0809FF84:
	adds r5, #1
	cmp r5, #0x3f
	ble _0809FF2A
	bl sub_80B7100
	movs r5, #7
	ands r0, r5
	lsls r0, r0, #4
	movs r1, #0x71
	rsbs r1, r1, #0
	ldrb r2, [r7]
	ands r1, r2
	orrs r1, r0
	strb r1, [r7]
	bl sub_80B735C
	ands r0, r5
	lsls r0, r0, #2
	movs r1, #0x1d
	rsbs r1, r1, #0
	ldrb r3, [r7, #1]
	ands r1, r3
	orrs r1, r0
	strb r1, [r7, #1]
	bl sub_80B71F8
	movs r1, #7
	ands r0, r1
	lsls r0, r0, #7
	ldr r1, _080A004C @ =0xFFFFFC7F
	ldrh r2, [r7]
	ands r1, r2
	orrs r1, r0
	strh r1, [r7]
	bl sub_80B7230
	lsls r0, r0, #5
	movs r1, #0x1f
	ldrb r3, [r7, #1]
	ands r1, r3
	orrs r1, r0
	strb r1, [r7, #1]
	bl sub_80B7328
	ands r0, r5
	movs r4, #8
	rsbs r4, r4, #0
	ldrb r1, [r7, #2]
	ands r4, r1
	orrs r4, r0
	strb r4, [r7, #2]
	ldrb r2, [r7]
	lsls r0, r2, #0x19
	lsrs r0, r0, #0x1d
	ldrh r3, [r7]
	lsls r1, r3, #0x16
	lsrs r1, r1, #0x1d
	ldrb r3, [r7, #1]
	lsls r2, r3, #0x1b
	lsrs r2, r2, #0x1d
	lsrs r3, r3, #5
	lsls r4, r4, #0x1d
	lsrs r4, r4, #0x1d
	str r4, [sp]
	bl sub_80B73FC
	ands r0, r5
	lsls r0, r0, #1
	movs r1, #0xf
	rsbs r1, r1, #0
	ldrb r2, [r7]
	ands r1, r2
	orrs r1, r0
	strb r1, [r7]
	bl sub_80A053C
	movs r1, #0x3f
	ands r0, r1
	lsls r0, r0, #5
	ldr r1, _080A0050 @ =0xFFFFF81F
	ldrh r3, [r7, #0xa]
	ands r1, r3
	orrs r1, r0
	strh r1, [r7, #0xa]
	bl GetTacticianName
	adds r1, r0, #0
	mov r0, sl
	bl strcpy
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A0048: .4byte 0x00010004
_080A004C: .4byte 0xFFFFFC7F
_080A0050: .4byte 0xFFFFF81F

	thumb_func_start sub_80A0054
sub_80A0054: @ 0x080A0054
	push {r4, r5, r6, lr}
	sub sp, #0x30
	bl sub_809FC54
	adds r6, r0, #0
	ldr r0, _080A00A0 @ =gPlaySt
	ldrb r0, [r0, #0x14]
	lsrs r4, r0, #6
	movs r0, #1
	ands r4, r0
	add r5, sp, #0x18
	adds r0, r5, #0
	adds r1, r6, #0
	adds r2, r4, #0
	bl sub_809FDC4
	mov r0, sp
	adds r1, r6, #0
	adds r2, r4, #0
	bl sub_809FC60
	mov r0, sp
	adds r1, r5, #0
	bl sub_809FD04
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080A0096
	adds r0, r5, #0
	adds r1, r6, #0
	adds r2, r4, #0
	bl sub_809FCC4
_080A0096:
	add sp, #0x30
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080A00A0: .4byte gPlaySt

	thumb_func_start sub_80A00A4
sub_80A00A4: @ 0x080A00A4
	push {lr}
	sub sp, #0x28
	add r0, sp, #0x24
	movs r1, #0
	strh r1, [r0]
	ldr r2, _080A00C4 @ =0x01000012
	mov r1, sp
	bl CpuSet
	mov r0, sp
	bl WriteSoundRoomSaveData
	add sp, #0x28
	pop {r0}
	bx r0
	.align 2, 0
_080A00C4: .4byte 0x01000012

	thumb_func_start LoadAndVerifySoundRoomData
LoadAndVerifySoundRoomData: @ 0x080A00C8
	push {r4, lr}
	sub sp, #0x24
	adds r4, r0, #0
	bl IsSramWorking
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080A0114
	cmp r4, #0
	bne _080A00DE
	mov r4, sp
_080A00DE:
	ldr r1, _080A0108 @ =ReadSramFast
	ldr r0, _080A010C @ =gSramMain
	ldr r0, [r0]
	ldr r2, _080A0110 @ =0x000070FC
	adds r0, r0, r2
	ldr r3, [r1]
	adds r1, r4, #0
	movs r2, #0x24
	bl _call_via_r3
	adds r0, r4, #0
	movs r1, #0x20
	bl Checksum16
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldrh r4, [r4, #0x20]
	cmp r4, r0
	bne _080A0114
	movs r0, #1
	b _080A0116
	.align 2, 0
_080A0108: .4byte ReadSramFast
_080A010C: .4byte gSramMain
_080A0110: .4byte 0x000070FC
_080A0114:
	movs r0, #0
_080A0116:
	add sp, #0x24
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start WriteSoundRoomSaveData
WriteSoundRoomSaveData: @ 0x080A0120
	push {r4, lr}
	adds r4, r0, #0
	movs r1, #0x20
	bl Checksum16
	strh r0, [r4, #0x20]
	ldr r0, _080A0144 @ =gSramMain
	ldr r1, [r0]
	ldr r0, _080A0148 @ =0x000070FC
	adds r1, r1, r0
	adds r0, r4, #0
	movs r2, #0x24
	bl WriteAndVerifySramFast
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A0144: .4byte gSramMain
_080A0148: .4byte 0x000070FC

	thumb_func_start IsSoundRoomSongUnlocked
IsSoundRoomSongUnlocked: @ 0x080A014C
	push {r4, r5, lr}
	sub sp, #0x24
	adds r4, r0, #0
	adds r5, r1, #0
	cmp r4, #0
	bne _080A0160
	mov r4, sp
	mov r0, sp
	bl LoadAndVerifySoundRoomData
_080A0160:
	asrs r0, r5, #5
	lsls r0, r0, #2
	adds r0, r4, r0
	movs r1, #0x1f
	ands r1, r5
	ldr r0, [r0]
	lsrs r0, r1
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	bne _080A017A
	movs r0, #0
	b _080A017C
_080A017A:
	movs r0, #1
_080A017C:
	add sp, #0x24
	pop {r4, r5}
	pop {r1}
	bx r1

	thumb_func_start UnlockSoundRoomSong
UnlockSoundRoomSong: @ 0x080A0184
	push {r4, r5, lr}
	sub sp, #0x24
	adds r4, r0, #0
	adds r5, r1, #0
	cmp r4, #0
	bne _080A019E
	mov r4, sp
	mov r0, sp
	bl LoadAndVerifySoundRoomData
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080A01C0
_080A019E:
	asrs r0, r5, #5
	lsls r0, r0, #2
	adds r3, r4, r0
	movs r0, #0x1f
	ands r0, r5
	movs r2, #1
	lsls r2, r0
	ldr r1, [r3]
	adds r0, r1, #0
	ands r0, r2
	cmp r0, #0
	bne _080A01C0
	orrs r1, r2
	str r1, [r3]
	adds r0, r4, #0
	bl WriteSoundRoomSaveData
_080A01C0:
	add sp, #0x24
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start sub_80A01C8
sub_80A01C8: @ 0x080A01C8
	push {lr}
	sub sp, #0x18
	add r0, sp, #0x14
	movs r1, #0
	strh r1, [r0]
	ldr r2, _080A01E8 @ =0x0100000A
	mov r1, sp
	bl CpuSet
	mov r0, sp
	bl sub_80A0244
	add sp, #0x18
	pop {r0}
	bx r0
	.align 2, 0
_080A01E8: .4byte 0x0100000A

	thumb_func_start sub_80A01EC
sub_80A01EC: @ 0x080A01EC
	push {r4, lr}
	sub sp, #0x14
	adds r4, r0, #0
	bl IsSramWorking
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080A0238
	cmp r4, #0
	bne _080A0202
	mov r4, sp
_080A0202:
	ldr r1, _080A022C @ =ReadSramFast
	ldr r0, _080A0230 @ =gSramMain
	ldr r0, [r0]
	ldr r2, _080A0234 @ =0x00007120
	adds r0, r0, r2
	ldr r3, [r1]
	adds r1, r4, #0
	movs r2, #0x14
	bl _call_via_r3
	adds r0, r4, #0
	movs r1, #0x10
	bl Checksum16
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldrh r4, [r4, #0x10]
	cmp r4, r0
	bne _080A0238
	movs r0, #1
	b _080A023A
	.align 2, 0
_080A022C: .4byte ReadSramFast
_080A0230: .4byte gSramMain
_080A0234: .4byte 0x00007120
_080A0238:
	movs r0, #0
_080A023A:
	add sp, #0x14
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_80A0244
sub_80A0244: @ 0x080A0244
	push {r4, lr}
	adds r4, r0, #0
	movs r1, #0x10
	bl Checksum16
	strh r0, [r4, #0x10]
	ldr r0, _080A0268 @ =gSramMain
	ldr r1, [r0]
	ldr r0, _080A026C @ =0x00007120
	adds r1, r1, r0
	adds r0, r4, #0
	movs r2, #0x14
	bl WriteAndVerifySramFast
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A0268: .4byte gSramMain
_080A026C: .4byte 0x00007120

	thumb_func_start sub_80A0270
sub_80A0270: @ 0x080A0270
	push {r4, r5, lr}
	sub sp, #0x14
	adds r4, r0, #0
	adds r5, r1, #0
	cmp r4, #0
	bne _080A0284
	mov r4, sp
	mov r0, sp
	bl sub_80A01EC
_080A0284:
	asrs r0, r5, #5
	lsls r0, r0, #2
	adds r0, r4, r0
	movs r1, #0x1f
	ands r1, r5
	ldr r0, [r0]
	lsrs r0, r1
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	bne _080A029E
	movs r0, #0
	b _080A02A0
_080A029E:
	movs r0, #1
_080A02A0:
	add sp, #0x14
	pop {r4, r5}
	pop {r1}
	bx r1

	thumb_func_start sub_80A02A8
sub_80A02A8: @ 0x080A02A8
	push {r4, r5, lr}
	sub sp, #0x14
	adds r4, r0, #0
	adds r5, r1, #0
	cmp r4, #0
	bne _080A02C2
	mov r4, sp
	mov r0, sp
	bl sub_80A01EC
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080A02E4
_080A02C2:
	asrs r0, r5, #5
	lsls r0, r0, #2
	adds r3, r4, r0
	movs r0, #0x1f
	ands r0, r5
	movs r2, #1
	lsls r2, r0
	ldr r1, [r3]
	adds r0, r1, #0
	ands r0, r2
	cmp r0, #0
	bne _080A02E4
	orrs r1, r2
	str r1, [r3]
	adds r0, r4, #0
	bl sub_80A0244
_080A02E4:
	add sp, #0x14
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start LoadAndVerifySramSaveData
LoadAndVerifySramSaveData: @ 0x080A02EC
	push {lr}
	movs r0, #0
	bl ReadGlobalSaveInfo
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080A02FE
	bl InitGlobalSaveInfo
_080A02FE:
	movs r0, #0
	bl LoadBonusContentData
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080A030E
	bl EraseBonusContentData
_080A030E:
	movs r0, #0
	bl sub_809FA3C
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080A031E
	bl sub_809F098
_080A031E:
	movs r0, #0
	bl LoadAndVerfyRankData
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080A032E
	bl sub_809FC30
_080A032E:
	movs r0, #0
	bl LoadAndVerifySoundRoomData
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080A033E
	bl sub_80A00A4
_080A033E:
	movs r0, #0
	bl sub_80A01EC
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080A034E
	bl sub_80A01C8
_080A034E:
	bl LoadAndVerfySuspendSave
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start ClearPidChStatsSaveData
ClearPidChStatsSaveData: @ 0x080A0358
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	mov r8, r0
	mov r0, sp
	movs r4, #0
	strh r4, [r0]
	ldr r5, _080A03E0 @ =0x0203E778
	ldr r2, _080A03E4 @ =0x01000230
	adds r1, r5, #0
	bl CpuSet
	mov r0, sp
	adds r0, #2
	strh r4, [r0]
	ldr r1, _080A03E8 @ =0x0203EBD8
	ldr r2, _080A03EC @ =0x01000060
	bl CpuSet
	adds r7, r5, #0
	movs r6, #0x86
	lsls r6, r6, #4
	add r6, r8
	adds r4, r7, #0
	movs r5, #0x45
_080A038C:
	ldr r0, [r4]
	ldr r1, _080A03F0 @ =0xFF0000FF
	ands r0, r1
	movs r1, #0x80
	lsls r1, r1, #0xe
	orrs r0, r1
	str r0, [r4]
	adds r0, r7, #0
	adds r1, r6, #0
	movs r2, #0x10
	bl WriteAndVerifySramFast
	adds r6, #0x10
	adds r4, #0x10
	subs r5, #1
	cmp r5, #0
	bge _080A038C
	movs r4, #0xcc
	lsls r4, r4, #4
	add r4, r8
	movs r5, #0x2f
_080A03B6:
	ldr r0, _080A03E8 @ =0x0203EBD8
	adds r1, r4, #0
	movs r2, #4
	bl WriteAndVerifySramFast
	adds r4, #4
	subs r5, #1
	cmp r5, #0
	bge _080A03B6
	ldr r1, _080A03F4 @ =0x0203E774
	movs r0, #0x86
	lsls r0, r0, #4
	add r0, r8
	str r0, [r1]
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A03E0: .4byte 0x0203E778
_080A03E4: .4byte 0x01000230
_080A03E8: .4byte 0x0203EBD8
_080A03EC: .4byte 0x01000060
_080A03F0: .4byte 0xFF0000FF
_080A03F4: .4byte 0x0203E774

	thumb_func_start ClearPidStats_ret
ClearPidStats_ret: @ 0x080A03F8
	push {lr}
	ldr r1, _080A0414 @ =gPlaySt
	ldr r0, _080A0418 @ =0xFFFFE00F
	ldrh r2, [r1, #0x2c]
	ands r0, r2
	strh r0, [r1, #0x2c]
	movs r0, #0
	bl SetGold
	bl ClearPidStats
	pop {r0}
	bx r0
	.align 2, 0
_080A0414: .4byte gPlaySt
_080A0418: .4byte 0xFFFFE00F

	thumb_func_start ClearPidStats
ClearPidStats: @ 0x080A041C
	push {r4, r5, lr}
	sub sp, #4
	mov r0, sp
	movs r5, #0
	strh r5, [r0]
	ldr r1, _080A045C @ =0x0203E778
	ldr r2, _080A0460 @ =0x01000230
	bl CpuSet
	ldr r4, _080A0464 @ =gPlaySt
	ldr r0, [r4, #0x38]
	ldr r1, _080A0468 @ =0xF00000FF
	ands r0, r1
	str r0, [r4, #0x38]
	movs r0, #0xf
	ldrh r1, [r4, #0x36]
	ands r0, r1
	strh r0, [r4, #0x36]
	adds r0, r4, #0
	adds r0, #0x38
	strb r5, [r0]
	ldr r0, [r4, #0x34]
	ldr r1, _080A046C @ =0xFFF00000
	ands r0, r1
	str r0, [r4, #0x34]
	bl sub_8017574
	str r0, [r4, #0x30]
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080A045C: .4byte 0x0203E778
_080A0460: .4byte 0x01000230
_080A0464: .4byte gPlaySt
_080A0468: .4byte 0xF00000FF
_080A046C: .4byte 0xFFF00000

	thumb_func_start ReadPidStats
ReadPidStats: @ 0x080A0470
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _080A0490 @ =ReadSramFast
	ldr r1, _080A0494 @ =0x0203E778
	movs r2, #0x8c
	lsls r2, r2, #3
	ldr r3, [r0]
	adds r0, r4, #0
	bl _call_via_r3
	ldr r0, _080A0498 @ =0x0203E774
	str r4, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A0490: .4byte ReadSramFast
_080A0494: .4byte 0x0203E778
_080A0498: .4byte 0x0203E774

	thumb_func_start ReadChapterStats
ReadChapterStats: @ 0x080A049C
	push {lr}
	ldr r2, _080A04B0 @ =ReadSramFast
	ldr r1, _080A04B4 @ =0x0203EBD8
	ldr r3, [r2]
	movs r2, #0xc0
	bl _call_via_r3
	pop {r0}
	bx r0
	.align 2, 0
_080A04B0: .4byte ReadSramFast
_080A04B4: .4byte 0x0203EBD8

	thumb_func_start WritePidStats
WritePidStats: @ 0x080A04B8
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _080A04D4 @ =0x0203E778
	movs r2, #0x8c
	lsls r2, r2, #3
	adds r1, r4, #0
	bl WriteAndVerifySramFast
	ldr r0, _080A04D8 @ =0x0203E774
	str r4, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A04D4: .4byte 0x0203E778
_080A04D8: .4byte 0x0203E774

	thumb_func_start WriteChapterStats
WriteChapterStats: @ 0x080A04DC
	push {lr}
	adds r1, r0, #0
	ldr r0, _080A04EC @ =0x0203EBD8
	movs r2, #0xc0
	bl WriteAndVerifySramFast
	pop {r0}
	bx r0
	.align 2, 0
_080A04EC: .4byte 0x0203EBD8

	thumb_func_start GetChapterStats
GetChapterStats: @ 0x080A04F0
	lsls r0, r0, #2
	ldr r1, _080A04F8 @ =0x0203EBD8
	adds r0, r0, r1
	bx lr
	.align 2, 0
_080A04F8: .4byte 0x0203EBD8

	thumb_func_start IsChapterStatsValid
IsChapterStatsValid: @ 0x080A04FC
	ldr r1, _080A050C @ =0x0000FF80
	ldrh r0, [r0]
	ands r1, r0
	rsbs r0, r1, #0
	orrs r0, r1
	lsrs r0, r0, #0x1f
	bx lr
	.align 2, 0
_080A050C: .4byte 0x0000FF80

	thumb_func_start GetNextChapterStatsSlot
GetNextChapterStatsSlot: @ 0x080A0510
	push {r4, lr}
	movs r0, #0
	bl GetChapterStats
	adds r1, r0, #0
	movs r2, #0
	ldr r3, _080A0520 @ =0x0000FF80
	b _080A0528
	.align 2, 0
_080A0520: .4byte 0x0000FF80
_080A0524:
	adds r2, #1
	adds r1, #4
_080A0528:
	adds r0, r3, #0
	ldrh r4, [r1]
	ands r0, r4
	cmp r0, #0
	bne _080A0524
	adds r0, r2, #0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_80A053C
sub_80A053C: @ 0x080A053C
	push {r4, r5, r6, lr}
	movs r0, #0
	bl GetChapterStats
	adds r4, r0, #0
	movs r5, #0
	ldr r1, _080A057C @ =0x0000FF80
	adds r0, r1, #0
	ldrh r2, [r4]
	ands r0, r2
	cmp r0, #0
	beq _080A0572
	adds r6, r1, #0
_080A0556:
	ldr r0, [r4]
	lsls r0, r0, #0x19
	lsrs r0, r0, #0x19
	bl sub_80A0654
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080A0568
	adds r5, #1
_080A0568:
	adds r4, #4
	ldrh r0, [r4]
	ands r0, r6
	cmp r0, #0
	bne _080A0556
_080A0572:
	adds r0, r5, #0
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_080A057C: .4byte 0x0000FF80

	thumb_func_start sub_80A0580
sub_80A0580: @ 0x080A0580
	push {lr}
	bl GetNextChapterStatsSlot
	cmp r0, #0
	beq _080A0598
	subs r0, #1
	bl GetChapterStats
	ldr r0, [r0]
	lsls r0, r0, #0x19
	lsrs r0, r0, #0x19
	b _080A059C
_080A0598:
	movs r0, #1
	rsbs r0, r0, #0
_080A059C:
	pop {r1}
	bx r1

	thumb_func_start RegisterChapterStats
RegisterChapterStats: @ 0x080A05A0
	push {r4, r5, lr}
	adds r4, r0, #0
	bl GetNextChapterStatsSlot
	bl GetChapterStats
	adds r5, r0, #0
	bl GetGameTime
	ldr r1, [r4, #4]
	subs r0, r0, r1
	movs r1, #0xb4
	bl __udivsi3
	adds r3, r0, #0
	ldr r0, _080A05F8 @ =0x0000EA60
	cmp r3, r0
	ble _080A05C6
	adds r3, r0, #0
_080A05C6:
	ldrh r2, [r4, #0x10]
	movs r0, #0xfa
	lsls r0, r0, #1
	cmp r2, r0
	ble _080A05D2
	adds r2, r0, #0
_080A05D2:
	movs r1, #0x7f
	ldrb r4, [r4, #0xe]
	ands r1, r4
	movs r0, #0x80
	rsbs r0, r0, #0
	ldrb r4, [r5]
	ands r0, r4
	orrs r0, r1
	strb r0, [r5]
	lsls r1, r2, #7
	movs r0, #0x7f
	ldrh r2, [r5]
	ands r0, r2
	orrs r0, r1
	strh r0, [r5]
	strh r3, [r5, #2]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080A05F8: .4byte 0x0000EA60

	thumb_func_start sub_80A05FC
sub_80A05FC: @ 0x080A05FC
	push {r4, r5, r6, r7, lr}
	movs r6, #0
	bl GetNextChapterStatsSlot
	adds r5, r0, #0
	movs r4, #0
	cmp r6, r5
	bge _080A0620
	movs r7, #0xb4
_080A060E:
	adds r0, r4, #0
	bl GetChapterStats
	ldrh r0, [r0, #2]
	muls r0, r7, r0
	adds r6, r6, r0
	adds r4, #1
	cmp r4, r5
	blt _080A060E
_080A0620:
	adds r0, r6, #0
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	thumb_func_start sub_80A0628
sub_80A0628: @ 0x080A0628
	push {r4, r5, r6, lr}
	movs r6, #0
	bl GetNextChapterStatsSlot
	adds r5, r0, #0
	movs r4, #0
	cmp r6, r5
	bge _080A064C
_080A0638:
	adds r0, r4, #0
	bl GetChapterStats
	ldr r0, [r0]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x17
	adds r6, r6, r0
	adds r4, #1
	cmp r4, r5
	blt _080A0638
_080A064C:
	adds r0, r6, #0
	pop {r4, r5, r6}
	pop {r1}
	bx r1

	thumb_func_start sub_80A0654
sub_80A0654: @ 0x080A0654
	adds r1, r0, #0
	ldr r0, _080A0668 @ =gPlaySt
	ldrb r0, [r0, #0x1b]
	cmp r0, #1
	bne _080A066C
	cmp r1, #0xb
	bgt _080A0678
_080A0662:
	movs r0, #1
	b _080A067A
	.align 2, 0
_080A0668: .4byte gPlaySt
_080A066C:
	cmp r0, #1
	blt _080A0678
	cmp r0, #3
	bgt _080A0678
	cmp r1, #0xb
	bgt _080A0662
_080A0678:
	movs r0, #0
_080A067A:
	bx lr

	thumb_func_start sub_80A067C
sub_80A067C: @ 0x080A067C
	push {r4, r5, r6, r7, lr}
	movs r7, #0
	bl GetNextChapterStatsSlot
	adds r6, r0, #0
	movs r5, #0
	cmp r7, r6
	bge _080A06B2
_080A068C:
	adds r0, r5, #0
	bl GetChapterStats
	adds r4, r0, #0
	ldr r0, [r4]
	lsls r0, r0, #0x19
	lsrs r0, r0, #0x19
	bl sub_80A0654
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080A06AC
	movs r0, #0xb4
	ldrh r4, [r4, #2]
	muls r0, r4, r0
	adds r7, r7, r0
_080A06AC:
	adds r5, #1
	cmp r5, r6
	blt _080A068C
_080A06B2:
	adds r0, r7, #0
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_80A06BC
sub_80A06BC: @ 0x080A06BC
	push {r4, r5, r6, r7, lr}
	movs r7, #0
	bl GetNextChapterStatsSlot
	adds r6, r0, #0
	movs r5, #0
	cmp r7, r6
	bge _080A06F2
_080A06CC:
	adds r0, r5, #0
	bl GetChapterStats
	adds r4, r0, #0
	ldr r0, [r4]
	lsls r0, r0, #0x19
	lsrs r0, r0, #0x19
	bl sub_80A0654
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080A06EC
	ldr r0, [r4]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x17
	adds r7, r7, r0
_080A06EC:
	adds r5, #1
	cmp r5, r6
	blt _080A06CC
_080A06F2:
	adds r0, r7, #0
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start PidStatsAddBattleAmt
PidStatsAddBattleAmt: @ 0x080A06FC
	push {r4, r5, lr}
	adds r4, r0, #0
	movs r0, #0xc0
	ldrb r1, [r4, #0xb]
	ands r0, r1
	cmp r0, #0
	bne _080A0750
	ldr r0, [r4]
	ldrb r0, [r0, #4]
	adds r5, r0, #0
	cmp r0, #0x45
	bhi _080A0750
	bl GetCharacterData
	ldrb r0, [r0, #9]
	cmp r0, #0
	beq _080A0750
	lsls r1, r5, #4
	ldr r0, _080A0758 @ =0x0203E768
	adds r2, r1, r0
	cmp r2, #0
	beq _080A0750
	ldrh r3, [r2, #0xc]
	lsls r0, r3, #0x12
	lsrs r1, r0, #0x14
	ldr r0, _080A075C @ =0x00000F9F
	cmp r1, r0
	bgt _080A0746
	adds r0, r1, #1
	ldr r5, _080A0760 @ =0x00000FFF
	adds r1, r5, #0
	ands r0, r1
	lsls r0, r0, #2
	ldr r1, _080A0764 @ =0xFFFFC003
	ands r1, r3
	orrs r1, r0
	strh r1, [r2, #0xc]
_080A0746:
	ldr r0, [r4]
	ldrb r0, [r0, #4]
	movs r1, #4
	bl sub_80A0C14
_080A0750:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080A0758: .4byte 0x0203E768
_080A075C: .4byte 0x00000F9F
_080A0760: .4byte 0x00000FFF
_080A0764: .4byte 0xFFFFC003

	thumb_func_start sub_80A0768
sub_80A0768: @ 0x080A0768
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	adds r5, r4, #0
	cmp r4, #0x45
	bhi _080A07BA
	adds r0, r4, #0
	bl GetCharacterData
	ldrb r0, [r0, #9]
	cmp r0, #0
	beq _080A07BA
	lsls r1, r4, #4
	ldr r0, _080A07C0 @ =0x0203E768
	adds r2, r1, r0
	cmp r2, #0
	beq _080A07BA
	movs r3, #3
	adds r0, r3, #0
	ldrb r1, [r2, #0xc]
	ands r0, r1
	lsls r1, r0, #8
	ldrb r0, [r2, #0xb]
	orrs r1, r0
	ldr r0, _080A07C4 @ =0x000003E7
	cmp r1, r0
	bgt _080A07B2
	adds r1, #1
	strb r1, [r2, #0xb]
	lsrs r1, r1, #8
	ands r1, r3
	movs r0, #4
	rsbs r0, r0, #0
	ldrb r3, [r2, #0xc]
	ands r0, r3
	orrs r0, r1
	strb r0, [r2, #0xc]
_080A07B2:
	adds r0, r5, #0
	movs r1, #0x10
	bl sub_80A0C14
_080A07BA:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080A07C0: .4byte 0x0203E768
_080A07C4: .4byte 0x000003E7

	thumb_func_start sub_80A07C8
sub_80A07C8: @ 0x080A07C8
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #0x10
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	mov r8, r4
	bl IsSramWorking
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080A0898
	cmp r4, #0x45
	bhi _080A0898
	adds r0, r4, #0
	bl GetCharacterData
	ldrb r0, [r0, #9]
	cmp r0, #0
	beq _080A0898
	mov r0, r8
	lsls r6, r0, #4
	ldr r0, _080A08A4 @ =0x0203E768
	adds r5, r6, r0
	cmp r5, #0
	beq _080A0898
	ldr r1, _080A08A8 @ =gBmSt
	adds r0, r1, #0
	adds r0, #0x3c
	ldrb r0, [r0]
	cmp r0, #1
	beq _080A0898
	ldr r7, _080A08AC @ =gPlaySt
	ldrb r2, [r7, #0x14]
	movs r0, #8
	ands r0, r2
	cmp r0, #0
	bne _080A0898
	ldrb r1, [r1, #4]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	bne _080A0898
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	bne _080A0898
	movs r0, #0x80
	ands r0, r2
	cmp r0, #0
	bne _080A0898
	ldrb r0, [r5]
	cmp r0, #0xc7
	bhi _080A0898
	adds r0, #1
	strb r0, [r5]
	movs r1, #0x80
	rsbs r1, r1, #0
	mov r0, r8
	bl sub_80A0C14
	bl sub_80A22AC
	adds r4, r0, #0
	adds r4, #3
	adds r0, r4, #0
	bl GetSaveWriteAddr
	adds r1, r0, #0
	ldr r2, _080A08B0 @ =0x000019DC
	adds r0, r6, r2
	adds r1, r1, r0
	adds r0, r5, #0
	movs r2, #1
	bl WriteAndVerifySramFast
	mov r0, sp
	adds r1, r4, #0
	bl ReadSaveBlockInfo
	mov r0, sp
	adds r1, r4, #0
	bl WriteSaveBlockInfo
	ldrb r0, [r7, #0xc]
	bl GetSaveWriteAddr
	adds r1, r0, #0
	movs r2, #0x85
	lsls r2, r2, #4
	adds r0, r6, r2
	adds r1, r1, r0
	adds r0, r5, #0
	movs r2, #3
	bl WriteAndVerifySramFast
	ldrb r1, [r7, #0xc]
	mov r0, sp
	bl ReadSaveBlockInfo
	ldrb r1, [r7, #0xc]
	mov r0, sp
	bl WriteSaveBlockInfo
_080A0898:
	add sp, #0x10
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A08A4: .4byte 0x0203E768
_080A08A8: .4byte gBmSt
_080A08AC: .4byte gPlaySt
_080A08B0: .4byte 0x000019DC

	thumb_func_start sub_80A08B4
sub_80A08B4: @ 0x080A08B4
	push {r4, r5, r6, lr}
	adds r4, r2, #0
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r5, r0, #0
	lsls r1, r1, #0x18
	lsrs r6, r1, #0x18
	cmp r0, #0x45
	bhi _080A091E
	bl GetCharacterData
	ldrb r0, [r0, #9]
	cmp r0, #0
	beq _080A091E
	lsls r1, r5, #4
	ldr r0, _080A0924 @ =0x0203E768
	adds r3, r1, r0
	cmp r3, #0
	beq _080A091E
	ldr r2, _080A0928 @ =gPlaySt
	movs r1, #0xe
	ldrsb r1, [r2, r1]
	movs r0, #0x3f
	ands r1, r0
	movs r0, #0x40
	rsbs r0, r0, #0
	ldrb r5, [r3, #5]
	ands r0, r5
	orrs r0, r1
	strb r0, [r3, #5]
	ldr r1, _080A092C @ =0x000003FF
	ldrh r2, [r2, #0x10]
	ands r1, r2
	lsls r1, r1, #0xe
	ldr r0, [r3, #4]
	ldr r2, _080A0930 @ =0xFF003FFF
	ands r0, r2
	orrs r0, r1
	str r0, [r3, #4]
	lsls r2, r6, #0xe
	ldr r0, [r3, #0xc]
	ldr r1, _080A0934 @ =0xFF803FFF
	ands r0, r1
	orrs r0, r2
	str r0, [r3, #0xc]
	movs r0, #0xf
	ands r4, r0
	movs r0, #0x10
	rsbs r0, r0, #0
	ldrb r1, [r3, #9]
	ands r0, r1
	orrs r0, r4
	strb r0, [r3, #9]
_080A091E:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080A0924: .4byte 0x0203E768
_080A0928: .4byte gPlaySt
_080A092C: .4byte 0x000003FF
_080A0930: .4byte 0xFF003FFF
_080A0934: .4byte 0xFF803FFF

	thumb_func_start sub_80A0938
sub_80A0938: @ 0x080A0938
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	adds r5, r4, #0
	cmp r4, #0x45
	bhi _080A096C
	adds r0, r4, #0
	bl GetCharacterData
	ldrb r0, [r0, #9]
	cmp r0, #0
	beq _080A096C
	lsls r1, r4, #4
	ldr r0, _080A0974 @ =0x0203E768
	adds r1, r1, r0
	cmp r1, #0
	beq _080A096C
	ldrb r0, [r1, #3]
	cmp r0, #0xc7
	bhi _080A0964
	adds r0, #1
	strb r0, [r1, #3]
_080A0964:
	adds r0, r5, #0
	movs r1, #2
	bl sub_80A0C14
_080A096C:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080A0974: .4byte 0x0203E768

	thumb_func_start PidStatsAddStatView
PidStatsAddStatView: @ 0x080A0978
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	adds r5, r4, #0
	cmp r4, #0x45
	bhi _080A09AC
	adds r0, r4, #0
	bl GetCharacterData
	ldrb r0, [r0, #9]
	cmp r0, #0
	beq _080A09AC
	lsls r1, r4, #4
	ldr r0, _080A09B4 @ =0x0203E768
	adds r1, r1, r0
	cmp r1, #0
	beq _080A09AC
	ldrb r0, [r1, #4]
	cmp r0, #0xc7
	bhi _080A09A4
	adds r0, #1
	strb r0, [r1, #4]
_080A09A4:
	adds r0, r5, #0
	movs r1, #2
	bl sub_80A0C14
_080A09AC:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080A09B4: .4byte 0x0203E768

	thumb_func_start sub_80A09B8
sub_80A09B8: @ 0x080A09B8
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	adds r5, r4, #0
	cmp r4, #0x45
	bhi _080A09FC
	adds r0, r4, #0
	bl GetCharacterData
	ldrb r0, [r0, #9]
	cmp r0, #0
	beq _080A09FC
	lsls r1, r4, #4
	ldr r0, _080A0A04 @ =0x0203E768
	adds r2, r1, r0
	cmp r2, #0
	beq _080A09FC
	ldrb r3, [r2, #7]
	lsls r0, r3, #0x1a
	lsrs r0, r0, #0x1a
	cmp r0, #0x3b
	bgt _080A09F4
	adds r1, r0, #1
	movs r0, #0x3f
	ands r1, r0
	movs r0, #0x40
	rsbs r0, r0, #0
	ands r0, r3
	orrs r0, r1
	strb r0, [r2, #7]
_080A09F4:
	adds r0, r5, #0
	movs r1, #0x40
	bl sub_80A0C14
_080A09FC:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080A0A04: .4byte 0x0203E768

	thumb_func_start PidStatsAddMove
PidStatsAddMove: @ 0x080A0A08
	push {r4, r5, r6, lr}
	adds r5, r1, #0
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	adds r6, r4, #0
	cmp r4, #0x45
	bhi _080A0A5C
	adds r0, r4, #0
	bl GetCharacterData
	ldrb r0, [r0, #9]
	cmp r0, #0
	beq _080A0A5C
	lsls r1, r4, #4
	ldr r0, _080A0A64 @ =0x0203E768
	adds r3, r1, r0
	cmp r3, #0
	beq _080A0A5C
	ldrb r4, [r3, #7]
	lsrs r1, r4, #6
	ldrb r2, [r3, #8]
	lsls r0, r2, #2
	orrs r0, r1
	adds r2, r0, r5
	movs r0, #0xfa
	lsls r0, r0, #2
	cmp r2, r0
	ble _080A0A42
	adds r2, r0, #0
_080A0A42:
	movs r0, #3
	ands r0, r2
	lsls r0, r0, #6
	movs r1, #0x3f
	ands r1, r4
	orrs r1, r0
	strb r1, [r3, #7]
	lsrs r0, r2, #2
	strb r0, [r3, #8]
	adds r0, r6, #0
	movs r1, #2
	bl sub_80A0C14
_080A0A5C:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080A0A64: .4byte 0x0203E768

	thumb_func_start PidStatsAddExpGained
PidStatsAddExpGained: @ 0x080A0A68
	push {r4, r5, r6, lr}
	adds r5, r1, #0
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	adds r6, r4, #0
	cmp r4, #0x45
	bhi _080A0AB4
	adds r0, r4, #0
	bl GetCharacterData
	ldrb r0, [r0, #9]
	cmp r0, #0
	beq _080A0AB4
	lsls r1, r4, #4
	ldr r0, _080A0ABC @ =0x0203E768
	adds r2, r1, r0
	cmp r2, #0
	beq _080A0AB4
	ldr r3, [r2, #8]
	lsls r0, r3, #8
	lsrs r0, r0, #0x14
	adds r0, r0, r5
	movs r1, #0xfa
	lsls r1, r1, #4
	cmp r0, r1
	ble _080A0A9E
	adds r0, r1, #0
_080A0A9E:
	ldr r1, _080A0AC0 @ =0x00000FFF
	ands r1, r0
	lsls r1, r1, #0xc
	ldr r0, _080A0AC4 @ =0xFF000FFF
	ands r0, r3
	orrs r0, r1
	str r0, [r2, #8]
	adds r0, r6, #0
	adds r1, r5, #0
	bl sub_80A0C14
_080A0AB4:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080A0ABC: .4byte 0x0203E768
_080A0AC0: .4byte 0x00000FFF
_080A0AC4: .4byte 0xFF000FFF

	thumb_func_start PidStatsSubFavval08
PidStatsSubFavval08: @ 0x080A0AC8
	push {lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r1, #8
	rsbs r1, r1, #0
	bl sub_80A0C14
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_80A0ADC
sub_80A0ADC: @ 0x080A0ADC
	push {lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r1, _080A0AEC @ =0xFFFFFF00
	bl sub_80A0C14
	pop {r0}
	bx r0
	.align 2, 0
_080A0AEC: .4byte 0xFFFFFF00

	thumb_func_start sub_80A0AF0
sub_80A0AF0: @ 0x080A0AF0
	push {r4, lr}
	movs r3, #0
	ldr r2, _080A0B10 @ =0x0203E778
	movs r1, #0x45
_080A0AF8:
	ldrh r4, [r2, #0xc]
	lsls r0, r4, #0x12
	lsrs r0, r0, #0x14
	adds r3, r3, r0
	adds r2, #0x10
	subs r1, #1
	cmp r1, #0
	bge _080A0AF8
	adds r0, r3, #0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080A0B10: .4byte 0x0203E778

	thumb_func_start sub_80A0B14
sub_80A0B14: @ 0x080A0B14
	push {r4, r5, lr}
	movs r3, #0
	ldr r0, _080A0B40 @ =0x0203E778
	movs r4, #3
	adds r1, r0, #0
	adds r1, #0xb
	movs r2, #0x45
_080A0B22:
	adds r0, r4, #0
	ldrb r5, [r1, #1]
	ands r0, r5
	lsls r0, r0, #8
	ldrb r5, [r1]
	orrs r0, r5
	adds r3, r3, r0
	adds r1, #0x10
	subs r2, #1
	cmp r2, #0
	bge _080A0B22
	adds r0, r3, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_080A0B40: .4byte 0x0203E778

	thumb_func_start sub_80A0B44
sub_80A0B44: @ 0x080A0B44
	movs r0, #0
	ldr r2, _080A0B58 @ =0x0203E778
	movs r1, #0x45
_080A0B4A:
	ldrb r3, [r2]
	adds r0, r3, r0
	adds r2, #0x10
	subs r1, #1
	cmp r1, #0
	bge _080A0B4A
	bx lr
	.align 2, 0
_080A0B58: .4byte 0x0203E778

	thumb_func_start sub_80A0B5C
sub_80A0B5C: @ 0x080A0B5C
	push {r4, r5, r6, lr}
	movs r6, #0
	ldr r5, _080A0B84 @ =0x0203E778
	movs r4, #0x45
_080A0B64:
	ldr r0, [r5, #8]
	lsls r0, r0, #8
	lsrs r0, r0, #0x14
	movs r1, #0x64
	bl __divsi3
	adds r6, r6, r0
	adds r5, #0x10
	subs r4, #1
	cmp r4, #0
	bge _080A0B64
	adds r0, r6, #0
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_080A0B84: .4byte 0x0203E778

	thumb_func_start sub_80A0B88
sub_80A0B88: @ 0x080A0B88
	movs r3, #0
	ldr r2, _080A0BA4 @ =0x0203E778
	movs r1, #0x45
_080A0B8E:
	ldr r0, [r2, #8]
	lsls r0, r0, #8
	lsrs r0, r0, #0x14
	adds r3, r3, r0
	adds r2, #0x10
	subs r1, #1
	cmp r1, #0
	bge _080A0B8E
	adds r0, r3, #0
	bx lr
	.align 2, 0
_080A0BA4: .4byte 0x0203E778

	thumb_func_start sub_80A0BA8
sub_80A0BA8: @ 0x080A0BA8
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r4, r0, #0
	cmp r0, #0x45
	bhi _080A0BC8
	bl GetCharacterData
	ldrb r0, [r0, #9]
	cmp r0, #0
	beq _080A0BC8
	lsls r1, r4, #4
	ldr r0, _080A0BCC @ =0x0203E768
	adds r1, r1, r0
	cmp r1, #0
	bne _080A0BD0
_080A0BC8:
	movs r0, #0
	b _080A0BD6
	.align 2, 0
_080A0BCC: .4byte 0x0203E768
_080A0BD0:
	ldr r0, [r1, #8]
	lsls r0, r0, #8
	lsrs r0, r0, #0x14
_080A0BD6:
	pop {r4}
	pop {r1}
	bx r1

	thumb_func_start sub_80A0BDC
sub_80A0BDC: @ 0x080A0BDC
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r4, r0, #0
	cmp r0, #0x45
	bhi _080A0BFC
	bl GetCharacterData
	ldrb r0, [r0, #9]
	cmp r0, #0
	beq _080A0BFC
	lsls r1, r4, #4
	ldr r0, _080A0C04 @ =0x0203E768
	adds r0, r1, r0
	cmp r0, #0
	bne _080A0C08
_080A0BFC:
	movs r0, #0x80
	lsls r0, r0, #6
	b _080A0C0E
	.align 2, 0
_080A0C04: .4byte 0x0203E768
_080A0C08:
	ldr r0, [r0]
	lsls r0, r0, #8
	lsrs r0, r0, #0x16
_080A0C0E:
	pop {r4}
	pop {r1}
	bx r1

	thumb_func_start sub_80A0C14
sub_80A0C14: @ 0x080A0C14
	push {r4, r5, lr}
	adds r5, r1, #0
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r4, r0, #0
	cmp r0, #0x45
	bhi _080A0C76
	bl GetCharacterData
	ldrb r0, [r0, #9]
	cmp r0, #0
	beq _080A0C76
	lsls r1, r4, #4
	ldr r0, _080A0C50 @ =0x0203E768
	adds r3, r1, r0
	cmp r3, #0
	beq _080A0C76
	ldr r2, [r3]
	lsls r0, r2, #8
	lsrs r0, r0, #0x10
	adds r1, r0, r5
	movs r0, #0x80
	lsls r0, r0, #7
	cmp r1, r0
	ble _080A0C58
	ldr r0, _080A0C54 @ =0xFF0000FF
	ands r0, r2
	movs r1, #0x80
	lsls r1, r1, #0xf
	b _080A0C72
	.align 2, 0
_080A0C50: .4byte 0x0203E768
_080A0C54: .4byte 0xFF0000FF
_080A0C58:
	cmp r1, #0
	bge _080A0C68
	ldr r0, _080A0C64 @ =0xFF0000FF
	ands r2, r0
	str r2, [r3]
	b _080A0C76
	.align 2, 0
_080A0C64: .4byte 0xFF0000FF
_080A0C68:
	ldr r0, _080A0C7C @ =0x0000FFFF
	ands r1, r0
	lsls r1, r1, #8
	ldr r0, _080A0C80 @ =0xFF0000FF
	ands r0, r2
_080A0C72:
	orrs r0, r1
	str r0, [r3]
_080A0C76:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080A0C7C: .4byte 0x0000FFFF
_080A0C80: .4byte 0xFF0000FF

	thumb_func_start PidStatsRecordBattleRes
PidStatsRecordBattleRes: @ 0x080A0C84
	push {r4, r5, r6, r7, lr}
	movs r7, #0
	movs r5, #0
	ldr r4, _080A0CE0 @ =gBattleActor
	adds r0, r4, #0
	bl GetUnitCurrentHp
	cmp r0, #0
	bne _080A0C9A
	adds r7, r4, #0
	ldr r5, _080A0CE4 @ =gBattleTarget
_080A0C9A:
	ldr r6, _080A0CE4 @ =gBattleTarget
	adds r0, r6, #0
	bl GetUnitCurrentHp
	cmp r0, #0
	bne _080A0CAA
	adds r7, r6, #0
	adds r5, r4, #0
_080A0CAA:
	cmp r7, #0
	beq _080A0CDA
	cmp r5, #0
	beq _080A0CC4
	movs r0, #0xc0
	ldrb r1, [r5, #0xb]
	ands r0, r1
	cmp r0, #0
	bne _080A0CC4
	ldr r0, [r5]
	ldrb r0, [r0, #4]
	bl sub_80A0768
_080A0CC4:
	cmp r7, #0
	beq _080A0CDA
	movs r0, #0xc0
	ldrb r1, [r7, #0xb]
	ands r0, r1
	cmp r0, #0
	bne _080A0CDA
	ldr r0, [r7]
	ldrb r0, [r0, #4]
	bl sub_80A07C8
_080A0CDA:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A0CE0: .4byte gBattleActor
_080A0CE4: .4byte gBattleTarget

	thumb_func_start IsPlaythroughIdUnique
IsPlaythroughIdUnique: @ 0x080A0CE8
	push {r4, r5, r6, lr}
	sub sp, #0xac
	adds r6, r0, #0
	mov r0, sp
	bl ReadGlobalSaveInfo
	movs r4, #0
	add r1, sp, #0x14
_080A0CF8:
	adds r0, r1, r4
	ldrb r0, [r0]
	cmp r0, r6
	beq _080A0D24
	adds r4, #1
	cmp r4, #0xb
	ble _080A0CF8
	movs r4, #0
	add r5, sp, #0x64
_080A0D0A:
	adds r0, r4, #0
	bl IsSaveValid
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080A0D28
	adds r0, r4, #0
	adds r1, r5, #0
	bl ReadGameSavePlaySt
	ldrb r0, [r5, #0x18]
	cmp r0, r6
	bne _080A0D28
_080A0D24:
	movs r0, #0
	b _080A0D30
_080A0D28:
	adds r4, #1
	cmp r4, #2
	ble _080A0D0A
	movs r0, #1
_080A0D30:
	add sp, #0xac
	pop {r4, r5, r6}
	pop {r1}
	bx r1

	thumb_func_start GetNewPlaythroughId
GetNewPlaythroughId: @ 0x080A0D38
	push {r4, lr}
	movs r4, #1
_080A0D3C:
	adds r0, r4, #0
	bl IsPlaythroughIdUnique
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080A0D4C
	adds r0, r4, #0
	b _080A0D52
_080A0D4C:
	adds r4, #1
	cmp r4, #0xff
	ble _080A0D3C
_080A0D52:
	pop {r4}
	pop {r1}
	bx r1

	thumb_func_start GetGlobalCompletionCntByInfo
GetGlobalCompletionCntByInfo: @ 0x080A0D58
	movs r2, #0
	movs r1, #0
	adds r3, r0, #0
	adds r3, #0x14
_080A0D60:
	adds r0, r3, r1
	ldrb r0, [r0]
	cmp r0, #0
	beq _080A0D6A
	adds r2, #1
_080A0D6A:
	adds r1, #1
	cmp r1, #0xb
	ble _080A0D60
	adds r0, r2, #0
	bx lr

	thumb_func_start GetGlobalCompletionCount
GetGlobalCompletionCount: @ 0x080A0D74
	push {lr}
	sub sp, #0x64
	mov r0, sp
	bl ReadGlobalSaveInfo
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080A0D8C
	mov r0, sp
	bl GetGlobalCompletionCntByInfo
	b _080A0D8E
_080A0D8C:
	movs r0, #0
_080A0D8E:
	add sp, #0x64
	pop {r1}
	bx r1

	thumb_func_start RegisterCompletedPlaythrough
RegisterCompletedPlaythrough: @ 0x080A0D94
	push {r4, lr}
	movs r3, #0
	adds r4, r0, #0
	adds r4, #0x14
	adds r2, r4, #0
_080A0D9E:
	adds r0, r2, r3
	ldrb r0, [r0]
	cmp r0, r1
	beq _080A0DC2
	adds r3, #1
	cmp r3, #0xb
	ble _080A0D9E
	movs r3, #0
_080A0DAE:
	adds r2, r4, r3
	ldrb r0, [r2]
	cmp r0, #0
	bne _080A0DBC
	strb r1, [r2]
	movs r0, #1
	b _080A0DC4
_080A0DBC:
	adds r3, #1
	cmp r3, #0xb
	ble _080A0DAE
_080A0DC2:
	movs r0, #0
_080A0DC4:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start SavePlayThroughData
SavePlayThroughData: @ 0x080A0DCC
	push {lr}
	sub sp, #0x64
	mov r0, sp
	bl ReadGlobalSaveInfo
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080A0DE6
	bl InitGlobalSaveInfo
	mov r0, sp
	bl ReadGlobalSaveInfo
_080A0DE6:
	mov r1, sp
	movs r0, #2
	ldrb r2, [r1, #0xe]
	orrs r0, r2
	strb r0, [r1, #0xe]
	mov r0, sp
	bl WriteGlobalSaveInfo
	add sp, #0x64
	pop {r0}
	bx r0

	thumb_func_start sub_80A0DFC
sub_80A0DFC: @ 0x080A0DFC
	push {lr}
	movs r0, #0
	bl GetChapterStats
	movs r1, #0x7f
	ldrb r0, [r0]
	ands r1, r0
	cmp r1, #0
	bne _080A0E28
	ldr r0, _080A0E1C @ =gPlaySt
	ldrb r0, [r0, #0x1b]
	cmp r0, #2
	bne _080A0E20
	movs r0, #0
	b _080A0E42
	.align 2, 0
_080A0E1C: .4byte gPlaySt
_080A0E20:
	cmp r0, #3
	bne _080A0E28
	movs r0, #2
	b _080A0E42
_080A0E28:
	ldr r0, _080A0E34 @ =gPlaySt
	ldrb r0, [r0, #0x1b]
	cmp r0, #2
	bne _080A0E38
	movs r0, #1
	b _080A0E42
	.align 2, 0
_080A0E34: .4byte gPlaySt
_080A0E38:
	cmp r0, #3
	beq _080A0E40
	movs r0, #4
	b _080A0E42
_080A0E40:
	movs r0, #3
_080A0E42:
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start WriteCompletedPlaythroughSaveData
WriteCompletedPlaythroughSaveData: @ 0x080A0E48
	push {r4, r5, r6, r7, lr}
	sub sp, #0x64
	bl sub_80A0DFC
	adds r5, r0, #0
	ldr r7, _080A0E94 @ =gPlaySt
	ldrb r0, [r7, #0x14]
	lsrs r4, r0, #6
	movs r0, #1
	ands r4, r0
	adds r6, r4, #0
	mov r0, sp
	bl ReadGlobalSaveInfo
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080A0E74
	bl InitGlobalSaveInfo
	mov r0, sp
	bl ReadGlobalSaveInfo
_080A0E74:
	ldrb r1, [r7, #0x18]
	mov r0, sp
	bl RegisterCompletedPlaythrough
	mov r1, sp
	movs r0, #1
	ldrb r2, [r1, #0xe]
	orrs r2, r0
	strb r2, [r1, #0xe]
	cmp r5, #1
	beq _080A0EB6
	cmp r5, #1
	bgt _080A0E98
	cmp r5, #0
	beq _080A0EA6
	b _080A0ECE
	.align 2, 0
_080A0E94: .4byte gPlaySt
_080A0E98:
	cmp r5, #3
	bgt _080A0ECE
	cmp r4, #0
	beq _080A0EC6
	mov r1, sp
	movs r0, #0x80
	b _080A0ECA
_080A0EA6:
	cmp r4, #0
	beq _080A0EB0
	mov r1, sp
	movs r0, #0x20
	b _080A0ECA
_080A0EB0:
	mov r1, sp
	movs r0, #4
	b _080A0ECA
_080A0EB6:
	cmp r6, #0
	beq _080A0EC0
	mov r1, sp
	movs r0, #0x40
	b _080A0ECA
_080A0EC0:
	mov r1, sp
	movs r0, #8
	b _080A0ECA
_080A0EC6:
	mov r1, sp
	movs r0, #0x10
_080A0ECA:
	orrs r2, r0
	strb r2, [r1, #0xe]
_080A0ECE:
	mov r0, sp
	bl WriteGlobalSaveInfo
	add sp, #0x64
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start GetPidStats
GetPidStats: @ 0x080A0EDC
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r4, r0, #0
	cmp r4, #0x45
	bhi _080A0F00
	adds r0, r4, #0
	bl GetCharacterData
	ldrb r0, [r0, #9]
	cmp r0, #0
	beq _080A0F00
	lsls r0, r4, #4
	ldr r1, _080A0EFC @ =0x0203E768
	adds r0, r0, r1
	b _080A0F02
	.align 2, 0
_080A0EFC: .4byte 0x0203E768
_080A0F00:
	movs r0, #0
_080A0F02:
	pop {r4}
	pop {r1}
	bx r1

	thumb_func_start sub_80A0F08
sub_80A0F08: @ 0x080A0F08
	ldr r0, _080A0F10 @ =0x0203EC98
	ldr r0, [r0]
	bx lr
	.align 2, 0
_080A0F10: .4byte 0x0203EC98

	thumb_func_start sub_80A0F14
sub_80A0F14: @ 0x080A0F14
	ldr r1, _080A0F1C @ =0x0203EC98
	str r0, [r1]
	bx lr
	.align 2, 0
_080A0F1C: .4byte 0x0203EC98

	thumb_func_start sub_80A0F20
sub_80A0F20: @ 0x080A0F20
	push {lr}
	adds r1, r0, #0
	ldr r0, _080A0F34 @ =0x0203EC98
	ldr r2, _080A0F38 @ =0x00000D88
	adds r1, r1, r2
	movs r2, #4
	bl WriteAndVerifySramFast
	pop {r0}
	bx r0
	.align 2, 0
_080A0F34: .4byte 0x0203EC98
_080A0F38: .4byte 0x00000D88

	thumb_func_start sub_80A0F3C
sub_80A0F3C: @ 0x080A0F3C
	push {lr}
	ldr r2, _080A0F54 @ =ReadSramFast
	ldr r1, _080A0F58 @ =0x00000D88
	adds r0, r0, r1
	ldr r1, _080A0F5C @ =0x0203EC98
	ldr r3, [r2]
	movs r2, #4
	bl _call_via_r3
	pop {r0}
	bx r0
	.align 2, 0
_080A0F54: .4byte ReadSramFast
_080A0F58: .4byte 0x00000D88
_080A0F5C: .4byte 0x0203EC98

	thumb_func_start WriteLastGameSaveId
WriteLastGameSaveId: @ 0x080A0F60
	push {r4, lr}
	sub sp, #0x64
	adds r4, r0, #0
	mov r0, sp
	bl ReadGlobalSaveInfo
	mov r0, sp
	adds r0, #0x62
	strb r4, [r0]
	mov r0, sp
	bl WriteGlobalSaveInfoNoChecksum
	add sp, #0x64
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start ReadLastGameSaveId
ReadLastGameSaveId: @ 0x080A0F80
	push {lr}
	sub sp, #0x64
	mov r0, sp
	bl ReadGlobalSaveInfo
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080A0F9E
	mov r0, sp
	adds r0, #0x62
	ldrb r0, [r0]
	cmp r0, #2
	bgt _080A0F9E
	cmp r0, #0
	bge _080A0FA0
_080A0F9E:
	movs r0, #0
_080A0FA0:
	add sp, #0x64
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_80A0FA8
sub_80A0FA8: @ 0x080A0FA8
	push {r4, r5, lr}
	sub sp, #0x58
	adds r5, r0, #0
	movs r0, #3
	bl IsValidSuspendSave
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080A0FD0
	add r4, sp, #0x10
	movs r0, #3
	adds r1, r4, #0
	bl ReadSuspendSavePlaySt
	ldrb r0, [r4, #0xc]
	cmp r0, r5
	bne _080A0FD0
	movs r0, #3
	bl InvalidateSuspendSave
_080A0FD0:
	mov r1, sp
	movs r0, #0xff
	strb r0, [r1, #6]
	mov r0, sp
	adds r1, r5, #0
	bl WriteSaveBlockInfo
	add sp, #0x58
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start CopyGameSave
CopyGameSave: @ 0x080A0FE8
	push {r4, r5, r6, lr}
	mov r6, sb
	mov r5, r8
	push {r5, r6}
	sub sp, #0x10
	mov sb, r1
	bl GetSaveReadAddr
	adds r6, r0, #0
	mov r0, sb
	bl GetSaveWriteAddr
	mov r8, r0
	ldr r0, _080A1040 @ =ReadSramFast
	ldr r4, _080A1044 @ =gBuf
	ldr r5, _080A1048 @ =0x00000D8C
	ldr r3, [r0]
	adds r0, r6, #0
	adds r1, r4, #0
	adds r2, r5, #0
	bl _call_via_r3
	adds r0, r4, #0
	mov r1, r8
	adds r2, r5, #0
	bl WriteAndVerifySramFast
	ldr r0, _080A104C @ =0x00011217
	str r0, [sp]
	mov r1, sp
	movs r0, #0
	strb r0, [r1, #6]
	mov r0, sp
	mov r1, sb
	bl WriteSaveBlockInfo
	add sp, #0x10
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080A1040: .4byte ReadSramFast
_080A1044: .4byte gBuf
_080A1048: .4byte 0x00000D8C
_080A104C: .4byte 0x00011217

	thumb_func_start WriteNewGameSave
WriteNewGameSave: @ 0x080A1050
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #0x38
	mov r8, r0
	adds r4, r1, #0
	adds r5, r2, #0
	bl GetSaveWriteAddr
	adds r7, r0, #0
	cmp r5, #0
	bne _080A106C
	ldr r0, _080A1180 @ =gPlaySt
	ldrb r5, [r0, #0x1b]
_080A106C:
	movs r0, #0
	bl SetGameTime
	adds r0, r4, #0
	bl InitPlayConfig
	bl InitUnits
	bl sub_802EBD4
	bl sub_807A0A0
	movs r0, #3
	bl InvalidateSuspendSave
	ldr r4, _080A1180 @ =gPlaySt
	adds r1, r4, #0
	adds r1, #0x2c
	movs r0, #2
	rsbs r0, r0, #0
	ldrb r2, [r1]
	ands r0, r2
	strb r0, [r1]
	ldr r0, _080A1184 @ =0xFFFFE00F
	ldrh r1, [r4, #0x2c]
	ands r0, r1
	strh r0, [r4, #0x2c]
	add r0, sp, #0x34
	movs r6, #0
	strh r6, [r0]
	adds r1, r4, #0
	adds r1, #0x30
	ldr r2, _080A1188 @ =0x01000008
	bl CpuSet
	ldr r0, [r4, #0x2c]
	ldr r1, _080A118C @ =0xFF801FFF
	ands r0, r1
	str r0, [r4, #0x2c]
	strb r5, [r4, #0x1b]
	adds r1, r4, #0
	adds r1, #0x2b
	movs r0, #1
	ldrb r2, [r1]
	orrs r0, r2
	strb r0, [r1]
	adds r0, r4, #0
	adds r0, #0x20
	strb r6, [r0]
	cmp r5, #1
	bne _080A10D4
	strb r6, [r4, #0xe]
_080A10D4:
	cmp r5, #2
	bne _080A10DC
	movs r0, #0xc
	strb r0, [r4, #0xe]
_080A10DC:
	cmp r5, #3
	bne _080A10E4
	movs r0, #0xd
	strb r0, [r4, #0xe]
_080A10E4:
	bl GetNewPlaythroughId
	strb r0, [r4, #0x18]
	mov r0, r8
	strb r0, [r4, #0xc]
	bl GetGlobalCompletionCount
	movs r1, #0x1f
	ands r0, r1
	lsls r0, r0, #7
	ldr r1, _080A1190 @ =0xFFFFF07F
	ldrh r2, [r4, #0x2e]
	ands r1, r2
	orrs r1, r0
	strh r1, [r4, #0x2e]
	adds r0, r4, #0
	adds r1, r7, #0
	movs r2, #0x48
	bl WriteAndVerifySramFast
	movs r0, #0
	bl sub_80A0F14
	adds r0, r7, #0
	bl sub_80A0F20
	mov r0, sp
	adds r0, #0x36
	movs r1, #0
	strh r1, [r0]
	add r4, sp, #0x10
	ldr r2, _080A1194 @ =0x01000012
	adds r1, r4, #0
	bl CpuSet
	adds r6, r4, #0
	adds r4, r7, #0
	adds r4, #0x48
	movs r5, #0x33
_080A1132:
	adds r0, r6, #0
	adds r1, r4, #0
	movs r2, #0x24
	bl WriteAndVerifySramFast
	adds r4, #0x24
	subs r5, #1
	cmp r5, #0
	bge _080A1132
	movs r4, #0
	movs r1, #0xf3
	lsls r1, r1, #3
	adds r0, r7, r1
	bl sub_809F3D4
	adds r0, r7, #0
	bl ClearPidChStatsSaveData
	movs r2, #0xd8
	lsls r2, r2, #4
	adds r0, r7, r2
	bl sub_809F364
	ldr r0, _080A1198 @ =0x00011217
	str r0, [sp]
	mov r0, sp
	strb r4, [r0, #6]
	mov r1, r8
	bl WriteSaveBlockInfo
	mov r0, r8
	bl WriteLastGameSaveId
	add sp, #0x38
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A1180: .4byte gPlaySt
_080A1184: .4byte 0xFFFFE00F
_080A1188: .4byte 0x01000008
_080A118C: .4byte 0xFF801FFF
_080A1190: .4byte 0xFFFFF07F
_080A1194: .4byte 0x01000012
_080A1198: .4byte 0x00011217

	thumb_func_start WriteGameSave
WriteGameSave: @ 0x080A119C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x74
	mov sb, r0
	bl GetSaveWriteAddr
	adds r7, r0, #0
	movs r0, #3
	bl InvalidateSuspendSave
	ldr r4, _080A126C @ =gPlaySt
	mov r0, sb
	strb r0, [r4, #0xc]
	bl GetGameTime
	str r0, [r4]
	adds r0, r4, #0
	adds r1, r7, #0
	movs r2, #0x48
	bl WriteAndVerifySramFast
	add r1, sp, #0x10
	mov r8, r1
	adds r4, r7, #0
	adds r4, #0x48
	movs r6, #0
	ldr r0, _080A1270 @ =gUnitArrayBlue
	mov sl, r0
	movs r5, #0x33
_080A11DC:
	mov r1, sl
	adds r0, r6, r1
	adds r1, r4, #0
	bl WriteGameSavePackedUnit
	adds r4, #0x24
	adds r6, #0x48
	subs r5, #1
	cmp r5, #0
	bge _080A11DC
	mov r0, r8
	bl ReadGlobalSaveInfo
	movs r4, #0
	ldr r6, _080A1270 @ =gUnitArrayBlue
	movs r5, #0x33
_080A11FC:
	adds r0, r4, r6
	ldr r0, [r0]
	ldrb r0, [r0, #4]
	mov r1, r8
	bl sub_809F908
	adds r4, #0x48
	subs r5, #1
	cmp r5, #0
	bge _080A11FC
	movs r4, #0
	mov r0, r8
	bl WriteGlobalSaveInfo
	movs r1, #0xf3
	lsls r1, r1, #3
	adds r0, r7, r1
	bl sub_809F3D4
	movs r1, #0x86
	lsls r1, r1, #4
	adds r0, r7, r1
	bl WritePidStats
	movs r1, #0xcc
	lsls r1, r1, #4
	adds r0, r7, r1
	bl WriteChapterStats
	adds r0, r7, #0
	bl sub_80A0F20
	movs r1, #0xd8
	lsls r1, r1, #4
	adds r0, r7, r1
	bl sub_809F364
	ldr r0, _080A1274 @ =0x00011217
	str r0, [sp]
	mov r0, sp
	strb r4, [r0, #6]
	mov r1, sb
	bl WriteSaveBlockInfo
	mov r0, sb
	bl WriteLastGameSaveId
	add sp, #0x74
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A126C: .4byte gPlaySt
_080A1270: .4byte gUnitArrayBlue
_080A1274: .4byte 0x00011217

	thumb_func_start ReadGameSave
ReadGameSave: @ 0x080A1278
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	mov sb, r0
	bl GetSaveReadAddr
	adds r7, r0, #0
	ldr r1, _080A1318 @ =gBmSt
	movs r0, #0x40
	ldrb r1, [r1, #4]
	ands r0, r1
	cmp r0, #0
	bne _080A129A
	movs r0, #3
	bl InvalidateSuspendSave
_080A129A:
	ldr r0, _080A131C @ =ReadSramFast
	ldr r4, _080A1320 @ =gPlaySt
	ldr r3, [r0]
	adds r0, r7, #0
	adds r1, r4, #0
	movs r2, #0x48
	bl _call_via_r3
	ldr r0, [r4]
	bl SetGameTime
	mov r0, sb
	strb r0, [r4, #0xc]
	bl InitUnits
	movs r6, #0
	adds r4, r7, #0
	adds r4, #0x48
	ldr r1, _080A1324 @ =gUnitArrayBlue
	mov r8, r1
	movs r5, #0x33
_080A12C4:
	mov r0, r8
	adds r1, r6, r0
	adds r0, r4, #0
	bl LoadSavedUnit
	adds r6, #0x48
	adds r4, #0x24
	subs r5, #1
	cmp r5, #0
	bge _080A12C4
	movs r1, #0xf3
	lsls r1, r1, #3
	adds r0, r7, r1
	bl sub_809F3EC
	movs r1, #0xd8
	lsls r1, r1, #4
	adds r0, r7, r1
	bl sub_809F3AC
	movs r1, #0x86
	lsls r1, r1, #4
	adds r0, r7, r1
	bl ReadPidStats
	movs r1, #0xcc
	lsls r1, r1, #4
	adds r0, r7, r1
	bl ReadChapterStats
	adds r0, r7, #0
	bl sub_80A0F3C
	mov r0, sb
	bl WriteLastGameSaveId
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A1318: .4byte gBmSt
_080A131C: .4byte ReadSramFast
_080A1320: .4byte gPlaySt
_080A1324: .4byte gUnitArrayBlue

	thumb_func_start IsSaveValid
IsSaveValid: @ 0x080A1328
	push {lr}
	adds r1, r0, #0
	movs r0, #0
	bl ReadSaveBlockInfo
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start ReadGameSavePlaySt
ReadGameSavePlaySt: @ 0x080A133C
	push {r4, lr}
	adds r4, r1, #0
	bl GetSaveReadAddr
	ldr r1, _080A1358 @ =ReadSramFast
	ldr r3, [r1]
	adds r1, r4, #0
	movs r2, #0x48
	bl _call_via_r3
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A1358: .4byte ReadSramFast

	thumb_func_start sub_80A135C
sub_80A135C: @ 0x080A135C
	push {lr}
	sub sp, #4
	bl GetSaveReadAddr
	ldr r1, _080A137C @ =ReadSramFast
	ldr r2, _080A1380 @ =0x00000D88
	adds r0, r0, r2
	ldr r3, [r1]
	mov r1, sp
	movs r2, #4
	bl _call_via_r3
	ldr r0, [sp]
	add sp, #4
	pop {r1}
	bx r1
	.align 2, 0
_080A137C: .4byte ReadSramFast
_080A1380: .4byte 0x00000D88

	thumb_func_start sub_80A1384
sub_80A1384: @ 0x080A1384
	ldrb r0, [r0, #0xe]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0xd
	bgt _080A1392
	movs r0, #0
	b _080A1394
_080A1392:
	movs r0, #1
_080A1394:
	bx lr
	.align 2, 0

	thumb_func_start sub_80A1398
sub_80A1398: @ 0x080A1398
	ldrb r0, [r0, #0xe]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0xb
	bgt _080A13AA
	cmp r0, #0
	ble _080A13B2
	movs r0, #1
	b _080A13B4
_080A13AA:
	cmp r0, #0xd
	ble _080A13B2
	movs r0, #1
	b _080A13B4
_080A13B2:
	movs r0, #0
_080A13B4:
	bx lr
	.align 2, 0

	thumb_func_start sub_80A13B8
sub_80A13B8: @ 0x080A13B8
	push {r4, lr}
	sub sp, #0x48
	adds r4, r0, #0
	bl IsSaveValid
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080A13DC
	adds r0, r4, #0
	mov r1, sp
	bl ReadGameSavePlaySt
	mov r0, sp
	bl sub_80A1398
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	b _080A13DE
_080A13DC:
	movs r0, #0
_080A13DE:
	add sp, #0x48
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start WriteGameSavePackedUnit
WriteGameSavePackedUnit: @ 0x080A13E8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x70
	adds r7, r0, #0
	str r1, [sp, #0x6c]
	mov r1, sp
	ldr r0, [r7]
	ldrb r0, [r0, #4]
	strb r0, [r1, #0x14]
	mov r2, sp
	ldr r0, [r7, #4]
	movs r1, #0x7f
	ldrb r0, [r0, #4]
	ands r1, r0
	movs r5, #0x80
	rsbs r5, r5, #0
	adds r0, r5, #0
	ldrb r3, [r2]
	ands r0, r3
	orrs r0, r1
	strb r0, [r2]
	ldr r4, [r7]
	cmp r4, #0
	bne _080A1434
	add r7, sp, #0x24
	adds r0, r7, #0
	bl ClearUnit
	mov r0, sp
	strb r4, [r0, #0x14]
	mov r1, sp
	adds r0, r5, #0
	ldrb r4, [r1]
	ands r0, r4
	strb r0, [r1]
_080A1434:
	mov r2, sp
	movs r1, #8
	ldrsb r1, [r7, r1]
	movs r5, #0x1f
	mov r8, r5
	mov r6, r8
	ands r1, r6
	lsls r1, r1, #7
	ldr r3, _080A17F4 @ =0xFFFFF07F
	adds r0, r3, #0
	ldrh r4, [r2]
	ands r0, r4
	orrs r0, r1
	strh r0, [r2]
	movs r5, #0x7f
	mov sb, r5
	mov r1, sb
	ldrb r6, [r7, #9]
	ands r1, r6
	lsls r1, r1, #0xc
	ldr r0, [sp]
	ldr r2, _080A17F8 @ =0xFFF80FFF
	ands r0, r2
	orrs r0, r1
	str r0, [sp]
	mov r4, sp
	movs r1, #0x10
	ldrsb r1, [r7, r1]
	movs r0, #0x3f
	ands r1, r0
	lsls r1, r1, #3
	ldrh r2, [r4, #2]
	ldr r0, _080A17FC @ =0xFFFFFE07
	ands r0, r2
	orrs r0, r1
	strh r0, [r4, #2]
	movs r1, #0x11
	ldrsb r1, [r7, r1]
	movs r0, #0x3f
	ands r1, r0
	lsls r1, r1, #1
	ldrb r2, [r4, #3]
	movs r0, #0x7f
	rsbs r0, r0, #0
	ands r0, r2
	orrs r0, r1
	strb r0, [r4, #3]
	movs r2, #0x12
	ldrsb r2, [r7, r2]
	movs r5, #0x3f
	ands r2, r5
	lsls r2, r2, #0xc
	ldr r0, [sp, #4]
	ldr r1, _080A1800 @ =0xFFFC0FFF
	ands r0, r1
	orrs r0, r2
	str r0, [sp, #4]
	mov r2, sp
	movs r1, #0x14
	ldrsb r1, [r7, r1]
	movs r4, #0x1f
	ands r1, r4
	lsls r1, r1, #2
	movs r0, #0x7d
	rsbs r0, r0, #0
	ldrb r6, [r2, #6]
	ands r0, r6
	orrs r0, r1
	strb r0, [r2, #6]
	mov r1, sp
	movs r0, #0x15
	ldrsb r0, [r7, r0]
	mov r2, r8
	ands r0, r2
	lsls r0, r0, #7
	ldrh r6, [r1, #6]
	ands r3, r6
	orrs r3, r0
	strh r3, [r1, #6]
	mov r3, sp
	movs r2, #0x16
	ldrsb r2, [r7, r2]
	movs r6, #0xf
	adds r1, r2, #0
	ands r1, r6
	lsls r1, r1, #4
	mov sl, r1
	adds r0, r6, #0
	ldrb r1, [r3, #7]
	ands r0, r1
	mov r1, sl
	orrs r0, r1
	strb r0, [r3, #7]
	lsrs r2, r2, #4
	movs r0, #1
	mov ip, r0
	ands r2, r0
	subs r0, #3
	ldrb r1, [r3, #8]
	ands r0, r1
	orrs r0, r2
	strb r0, [r3, #8]
	movs r1, #0x17
	ldrsb r1, [r7, r1]
	ands r1, r4
	lsls r1, r1, #1
	movs r2, #0x3f
	rsbs r2, r2, #0
	ands r0, r2
	orrs r0, r1
	strb r0, [r3, #8]
	mov r2, sp
	movs r1, #0x18
	ldrsb r1, [r7, r1]
	mov r3, r8
	ands r1, r3
	lsls r1, r1, #6
	ldr r0, _080A1804 @ =0xFFFFF83F
	ldrh r3, [r2, #8]
	ands r0, r3
	orrs r0, r1
	strh r0, [r2, #8]
	movs r1, #0x19
	ldrsb r1, [r7, r1]
	lsls r1, r1, #3
	movs r0, #7
	ldrb r3, [r2, #9]
	ands r0, r3
	orrs r0, r1
	strb r0, [r2, #9]
	movs r1, #0x1a
	ldrsb r1, [r7, r1]
	ands r1, r4
	movs r0, #0x20
	rsbs r0, r0, #0
	ldrb r4, [r2, #0xa]
	ands r0, r4
	orrs r0, r1
	strb r0, [r2, #0xa]
	movs r1, #0x1d
	ldrsb r1, [r7, r1]
	mov r0, r8
	ands r1, r0
	lsls r1, r1, #5
	ldr r0, _080A1808 @ =0xFFFFFC1F
	ldrh r3, [r2, #0xa]
	ands r0, r3
	orrs r0, r1
	strh r0, [r2, #0xa]
	mov r3, sp
	ldrh r2, [r7, #0x1e]
	adds r1, r2, #0
	ands r1, r5
	lsls r1, r1, #2
	mov r8, r1
	movs r4, #3
	adds r0, r4, #0
	ldrb r1, [r3, #0xb]
	ands r0, r1
	mov r1, r8
	orrs r0, r1
	strb r0, [r3, #0xb]
	lsrs r2, r2, #6
	strb r2, [r3, #0xc]
	ldr r3, _080A180C @ =0x00003FFF
	adds r1, r3, #0
	ldrh r2, [r7, #0x20]
	ands r1, r2
	lsls r1, r1, #8
	ldr r0, [sp, #0xc]
	ldr r2, _080A1810 @ =0xFFC000FF
	ands r0, r2
	orrs r0, r1
	str r0, [sp, #0xc]
	mov r2, sp
	ldrh r1, [r7, #0x22]
	ldr r0, _080A1814 @ =0x000003FF
	ands r0, r1
	lsls r0, r0, #6
	mov r8, r0
	ldrh r0, [r2, #0xe]
	ands r5, r0
	mov r0, r8
	orrs r5, r0
	strh r5, [r2, #0xe]
	lsrs r1, r1, #0xa
	ands r1, r6
	movs r0, #0x10
	rsbs r0, r0, #0
	ldrb r5, [r2, #0x10]
	ands r0, r5
	orrs r0, r1
	strb r0, [r2, #0x10]
	ldrh r6, [r7, #0x24]
	ands r3, r6
	lsls r3, r3, #4
	ldr r0, [sp, #0x10]
	ldr r1, _080A1818 @ =0xFFFC000F
	ands r0, r1
	orrs r0, r3
	str r0, [sp, #0x10]
	mov r1, sp
	ldrh r2, [r7, #0x26]
	lsls r0, r2, #2
	ldrh r3, [r1, #0x12]
	ands r4, r3
	orrs r4, r0
	strh r4, [r1, #0x12]
	ldrb r0, [r1, #3]
	mov r5, sb
	ands r5, r0
	strb r5, [r1, #3]
	ldr r6, _080A181C @ =0xFFFFF000
	adds r0, r6, #0
	ldrh r4, [r1, #4]
	ands r0, r4
	strh r0, [r1, #4]
	ldr r0, [r7, #0xc]
	movs r1, #4
	mov r8, r1
	ands r0, r1
	cmp r0, #0
	beq _080A1618
	mov r3, sp
	mov r0, sp
	ldr r2, _080A1820 @ =0x00000FFF
	mov sl, r2
	ldrh r0, [r0, #4]
	ands r2, r0
	mov r4, ip
	lsrs r1, r4, #1
	lsls r0, r4, #7
	orrs r0, r5
	strb r0, [r3, #3]
	orrs r1, r2
	mov r5, sl
	ands r1, r5
	adds r0, r6, #0
	ldrh r2, [r3, #4]
	ands r0, r2
	orrs r0, r1
	strh r0, [r3, #4]
_080A1618:
	ldr r0, [r7, #0xc]
	movs r3, #8
	mov sl, r3
	ands r0, r3
	cmp r0, #0
	beq _080A165A
	mov r3, sp
	mov r0, sp
	ldrb r4, [r0, #3]
	lsrs r2, r4, #7
	ldr r5, _080A1820 @ =0x00000FFF
	adds r1, r5, #0
	ldrh r0, [r0, #4]
	ands r1, r0
	lsls r1, r1, #1
	orrs r1, r2
	movs r0, #2
	orrs r1, r0
	adds r2, r1, #0
	mov r0, ip
	ands r2, r0
	lsls r2, r2, #7
	mov r0, sb
	ands r0, r4
	orrs r0, r2
	strb r0, [r3, #3]
	lsrs r1, r1, #1
	ands r1, r5
	adds r0, r6, #0
	ldrh r2, [r3, #4]
	ands r0, r2
	orrs r0, r1
	strh r0, [r3, #4]
_080A165A:
	ldr r0, [r7, #0xc]
	movs r1, #0x80
	lsls r1, r1, #7
	ands r0, r1
	cmp r0, #0
	beq _080A169C
	mov r3, sp
	mov r0, sp
	ldrb r4, [r0, #3]
	lsrs r2, r4, #7
	ldr r5, _080A1820 @ =0x00000FFF
	adds r1, r5, #0
	ldrh r0, [r0, #4]
	ands r1, r0
	lsls r1, r1, #1
	orrs r1, r2
	mov r0, r8
	orrs r1, r0
	adds r2, r1, #0
	mov r0, ip
	ands r2, r0
	lsls r2, r2, #7
	mov r0, sb
	ands r0, r4
	orrs r0, r2
	strb r0, [r3, #3]
	lsrs r1, r1, #1
	ands r1, r5
	adds r0, r6, #0
	ldrh r2, [r3, #4]
	ands r0, r2
	orrs r0, r1
	strh r0, [r3, #4]
_080A169C:
	ldr r0, [r7, #0xc]
	movs r1, #0x80
	lsls r1, r1, #8
	ands r0, r1
	cmp r0, #0
	beq _080A16DE
	mov r3, sp
	mov r0, sp
	ldrb r4, [r0, #3]
	lsrs r2, r4, #7
	ldr r5, _080A1820 @ =0x00000FFF
	adds r1, r5, #0
	ldrh r0, [r0, #4]
	ands r1, r0
	lsls r1, r1, #1
	orrs r1, r2
	mov r0, sl
	orrs r1, r0
	adds r2, r1, #0
	mov r0, ip
	ands r2, r0
	lsls r2, r2, #7
	mov r0, sb
	ands r0, r4
	orrs r0, r2
	strb r0, [r3, #3]
	lsrs r1, r1, #1
	ands r1, r5
	adds r0, r6, #0
	ldrh r2, [r3, #4]
	ands r0, r2
	orrs r0, r1
	strh r0, [r3, #4]
_080A16DE:
	ldr r0, [r7, #0xc]
	movs r1, #0x80
	lsls r1, r1, #6
	ands r0, r1
	cmp r0, #0
	beq _080A1720
	mov r3, sp
	mov r0, sp
	ldrb r4, [r0, #3]
	lsrs r2, r4, #7
	ldr r5, _080A1820 @ =0x00000FFF
	adds r1, r5, #0
	ldrh r0, [r0, #4]
	ands r1, r0
	lsls r1, r1, #1
	orrs r1, r2
	movs r0, #0x10
	orrs r1, r0
	adds r2, r1, #0
	mov r0, ip
	ands r2, r0
	lsls r2, r2, #7
	mov r0, sb
	ands r0, r4
	orrs r0, r2
	strb r0, [r3, #3]
	lsrs r1, r1, #1
	ands r1, r5
	adds r0, r6, #0
	ldrh r2, [r3, #4]
	ands r0, r2
	orrs r0, r1
	strh r0, [r3, #4]
_080A1720:
	ldr r0, [r7, #0xc]
	movs r1, #0x80
	lsls r1, r1, #9
	ands r0, r1
	cmp r0, #0
	beq _080A1762
	mov r3, sp
	mov r0, sp
	ldrb r4, [r0, #3]
	lsrs r2, r4, #7
	ldr r5, _080A1820 @ =0x00000FFF
	adds r1, r5, #0
	ldrh r0, [r0, #4]
	ands r1, r0
	lsls r1, r1, #1
	orrs r1, r2
	movs r0, #0x20
	orrs r1, r0
	adds r2, r1, #0
	mov r0, ip
	ands r2, r0
	lsls r2, r2, #7
	mov r0, sb
	ands r0, r4
	orrs r0, r2
	strb r0, [r3, #3]
	lsrs r1, r1, #1
	ands r1, r5
	adds r0, r6, #0
	ldrh r2, [r3, #4]
	ands r0, r2
	orrs r0, r1
	strh r0, [r3, #4]
_080A1762:
	ldr r0, [r7, #0xc]
	movs r1, #0x80
	lsls r1, r1, #0x12
	ands r0, r1
	cmp r0, #0
	beq _080A17A4
	mov r3, sp
	mov r0, sp
	ldrb r4, [r0, #3]
	lsrs r2, r4, #7
	ldr r5, _080A1820 @ =0x00000FFF
	adds r1, r5, #0
	ldrh r0, [r0, #4]
	ands r1, r0
	lsls r1, r1, #1
	orrs r1, r2
	movs r0, #0x40
	orrs r1, r0
	adds r2, r1, #0
	mov r0, ip
	ands r2, r0
	lsls r2, r2, #7
	mov r0, sb
	ands r0, r4
	orrs r0, r2
	strb r0, [r3, #3]
	lsrs r1, r1, #1
	ands r1, r5
	adds r0, r6, #0
	ldrh r2, [r3, #4]
	ands r0, r2
	orrs r0, r1
	strh r0, [r3, #4]
_080A17A4:
	movs r2, #0
	mov r5, sp
	adds r5, #0x1d
	adds r6, r7, #0
	adds r6, #0x32
	mov r4, sp
	adds r4, #0x15
	adds r3, r7, #0
	adds r3, #0x28
_080A17B6:
	adds r0, r4, r2
	adds r1, r3, r2
	ldrb r1, [r1]
	strb r1, [r0]
	adds r2, #1
	cmp r2, #7
	ble _080A17B6
	movs r2, #0
	adds r4, r5, #0
	adds r3, r6, #0
_080A17CA:
	adds r0, r4, r2
	adds r1, r3, r2
	ldrb r1, [r1]
	strb r1, [r0]
	adds r2, #1
	cmp r2, #6
	ble _080A17CA
	mov r0, sp
	ldr r1, [sp, #0x6c]
	movs r2, #0x24
	bl WriteAndVerifySramFast
	add sp, #0x70
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
_080A17F2:
	.byte 0x17, 0xE0
_080A17F4: .4byte 0xFFFFF07F
_080A17F8: .4byte 0xFFF80FFF
_080A17FC: .4byte 0xFFFFFE07
_080A1800: .4byte 0xFFFC0FFF
_080A1804: .4byte 0xFFFFF83F
_080A1808: .4byte 0xFFFFFC1F
_080A180C: .4byte 0x00003FFF
_080A1810: .4byte 0xFFC000FF
_080A1814: .4byte 0x000003FF
_080A1818: .4byte 0xFFFC000F
_080A181C: .4byte 0xFFFFF000
_080A1820: .4byte 0x00000FFF

	thumb_func_start LoadSavedUnit
LoadSavedUnit: @ 0x080A1824
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #0x24
	adds r4, r1, #0
	ldr r1, _080A1A58 @ =ReadSramFast
	ldr r3, [r1]
	mov r1, sp
	movs r2, #0x24
	bl _call_via_r3
	mov r0, sp
	ldrb r0, [r0, #0x14]
	bl GetCharacterData
	str r0, [r4]
	mov r0, sp
	ldrb r0, [r0]
	lsls r0, r0, #0x19
	lsrs r0, r0, #0x19
	bl GetClassData
	str r0, [r4, #4]
	mov r0, sp
	ldrh r0, [r0]
	lsls r0, r0, #0x14
	lsrs r0, r0, #0x1b
	strb r0, [r4, #8]
	ldr r0, [sp]
	lsls r0, r0, #0xd
	lsrs r3, r0, #0x19
	strb r3, [r4, #9]
	mov r0, sp
	ldrh r0, [r0, #2]
	lsls r0, r0, #0x17
	lsrs r0, r0, #0x1a
	strb r0, [r4, #0x10]
	mov r0, sp
	ldrb r0, [r0, #3]
	lsls r0, r0, #0x19
	lsrs r0, r0, #0x1a
	strb r0, [r4, #0x11]
	ldr r0, [sp, #4]
	lsls r0, r0, #0xe
	lsrs r0, r0, #0x1a
	strb r0, [r4, #0x12]
	mov r0, sp
	ldrb r0, [r0, #6]
	lsls r0, r0, #0x19
	lsrs r0, r0, #0x1b
	strb r0, [r4, #0x14]
	mov r0, sp
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x14
	lsrs r0, r0, #0x1b
	strb r0, [r4, #0x15]
	mov r1, sp
	ldrb r0, [r1, #7]
	lsrs r2, r0, #4
	movs r5, #1
	adds r0, r5, #0
	ldrb r1, [r1, #8]
	ands r0, r1
	lsls r0, r0, #4
	orrs r0, r2
	strb r0, [r4, #0x16]
	mov r0, sp
	ldrb r0, [r0, #8]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1b
	strb r0, [r4, #0x17]
	mov r0, sp
	ldrh r0, [r0, #8]
	lsls r0, r0, #0x15
	lsrs r0, r0, #0x1b
	strb r0, [r4, #0x18]
	mov r0, sp
	ldrb r0, [r0, #9]
	lsrs r0, r0, #3
	strb r0, [r4, #0x19]
	mov r0, sp
	ldrb r0, [r0, #0xa]
	lsls r0, r0, #0x1b
	lsrs r0, r0, #0x1b
	strb r0, [r4, #0x1a]
	mov r0, sp
	ldrh r0, [r0, #0xa]
	lsls r0, r0, #0x16
	lsrs r0, r0, #0x1b
	strb r0, [r4, #0x1d]
	mov r0, sp
	ldrb r2, [r0, #0xb]
	lsrs r1, r2, #2
	ldrb r0, [r0, #0xc]
	lsls r0, r0, #6
	orrs r0, r1
	strh r0, [r4, #0x1e]
	ldr r0, [sp, #0xc]
	lsls r0, r0, #0xa
	lsrs r0, r0, #0x12
	strh r0, [r4, #0x20]
	mov r1, sp
	ldrh r0, [r1, #0xe]
	lsrs r2, r0, #6
	movs r0, #0xf
	ldrb r1, [r1, #0x10]
	ands r0, r1
	lsls r0, r0, #0xa
	orrs r0, r2
	strh r0, [r4, #0x22]
	ldr r0, [sp, #0x10]
	lsls r0, r0, #0xe
	lsrs r0, r0, #0x12
	strh r0, [r4, #0x24]
	mov r0, sp
	ldrh r0, [r0, #0x12]
	lsrs r0, r0, #2
	strh r0, [r4, #0x26]
	cmp r3, #0x63
	bls _080A1918
	movs r0, #0xff
	strb r0, [r4, #9]
_080A1918:
	movs r0, #0
	str r0, [r4, #0xc]
	mov r2, sp
	ldrb r1, [r2, #3]
	lsrs r1, r1, #7
	ldr r3, _080A1A5C @ =0x00000FFF
	adds r0, r3, #0
	ldrh r2, [r2, #4]
	ands r0, r2
	lsls r0, r0, #1
	orrs r0, r1
	ands r0, r5
	cmp r0, #0
	beq _080A1938
	movs r0, #5
	str r0, [r4, #0xc]
_080A1938:
	mov r0, sp
	adds r1, r3, #0
	ldrh r0, [r0, #4]
	ands r1, r0
	lsls r1, r1, #1
	movs r0, #2
	ands r1, r0
	cmp r1, #0
	beq _080A1952
	ldr r0, [r4, #0xc]
	movs r1, #9
	orrs r0, r1
	str r0, [r4, #0xc]
_080A1952:
	mov r0, sp
	adds r1, r3, #0
	ldrh r0, [r0, #4]
	ands r1, r0
	lsls r1, r1, #1
	movs r0, #4
	ands r1, r0
	cmp r1, #0
	beq _080A196E
	ldr r0, [r4, #0xc]
	movs r1, #0x80
	lsls r1, r1, #7
	orrs r0, r1
	str r0, [r4, #0xc]
_080A196E:
	mov r0, sp
	adds r1, r3, #0
	ldrh r0, [r0, #4]
	ands r1, r0
	lsls r1, r1, #1
	movs r0, #8
	ands r1, r0
	cmp r1, #0
	beq _080A198A
	ldr r0, [r4, #0xc]
	movs r1, #0x80
	lsls r1, r1, #8
	orrs r0, r1
	str r0, [r4, #0xc]
_080A198A:
	mov r0, sp
	adds r1, r3, #0
	ldrh r0, [r0, #4]
	ands r1, r0
	lsls r1, r1, #1
	movs r0, #0x10
	ands r1, r0
	cmp r1, #0
	beq _080A19A6
	ldr r0, [r4, #0xc]
	movs r1, #0x80
	lsls r1, r1, #6
	orrs r0, r1
	str r0, [r4, #0xc]
_080A19A6:
	mov r0, sp
	adds r1, r3, #0
	ldrh r0, [r0, #4]
	ands r1, r0
	lsls r1, r1, #1
	movs r0, #0x20
	ands r1, r0
	cmp r1, #0
	beq _080A19C2
	ldr r0, [r4, #0xc]
	movs r1, #0x80
	lsls r1, r1, #9
	orrs r0, r1
	str r0, [r4, #0xc]
_080A19C2:
	mov r0, sp
	adds r1, r3, #0
	ldrh r0, [r0, #4]
	ands r1, r0
	lsls r1, r1, #1
	movs r0, #0x40
	ands r1, r0
	cmp r1, #0
	beq _080A19DE
	ldr r0, [r4, #0xc]
	movs r1, #0x80
	lsls r1, r1, #0x12
	orrs r0, r1
	str r0, [r4, #0xc]
_080A19DE:
	movs r2, #0
	adds r6, r4, #0
	adds r6, #0x32
	mov r7, sp
	adds r7, #0x1d
	movs r1, #0x39
	adds r1, r1, r4
	mov r8, r1
	adds r5, r4, #0
	adds r5, #0x28
	mov r3, sp
	adds r3, #0x15
_080A19F6:
	adds r0, r5, r2
	adds r1, r3, r2
	ldrb r1, [r1]
	strb r1, [r0]
	adds r2, #1
	cmp r2, #7
	ble _080A19F6
	movs r2, #0
	adds r5, r6, #0
	adds r3, r7, #0
_080A1A0A:
	adds r0, r5, r2
	adds r1, r3, r2
	ldrb r1, [r1]
	strb r1, [r0]
	adds r2, #1
	cmp r2, #6
	ble _080A1A0A
	adds r0, r4, #0
	bl GetUnitMaxHp
	adds r1, r0, #0
	adds r0, r4, #0
	bl SetUnitHp
	movs r0, #0
	mov r2, r8
	strb r0, [r2]
	ldrb r0, [r4, #9]
	cmp r0, #0x7f
	bne _080A1A36
	movs r0, #0xff
	strb r0, [r4, #9]
_080A1A36:
	ldrb r0, [r4, #0x10]
	cmp r0, #0x3f
	bne _080A1A40
	movs r0, #0xff
	strb r0, [r4, #0x10]
_080A1A40:
	ldrb r0, [r4, #0x11]
	cmp r0, #0x3f
	bne _080A1A4A
	movs r0, #0xff
	strb r0, [r4, #0x11]
_080A1A4A:
	add sp, #0x24
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A1A58: .4byte ReadSramFast
_080A1A5C: .4byte 0x00000FFF

	thumb_func_start InvalidateSuspendSave
InvalidateSuspendSave: @ 0x080A1A60
	push {r4, lr}
	sub sp, #0x10
	adds r4, r0, #0
	mov r1, sp
	movs r0, #0xff
	strb r0, [r1, #6]
	mov r0, sp
	adds r1, r4, #0
	bl WriteSaveBlockInfo
	cmp r4, #3
	bne _080A1A80
	mov r0, sp
	movs r1, #4
	bl WriteSaveBlockInfo
_080A1A80:
	add sp, #0x10
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start WriteSuspendSave
WriteSuspendSave: @ 0x080A1A88
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x20
	mov r8, r0
	bl sub_8031B40
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080A1AA2
	b _080A1BA0
_080A1AA2:
	ldr r4, _080A1BB0 @ =gPlaySt
	movs r0, #8
	ldrb r1, [r4, #0x14]
	ands r0, r1
	cmp r0, #0
	bne _080A1BA0
	bl IsSramWorking
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080A1BA0
	bl sub_80A22CC
	add r8, r0
	mov r0, r8
	bl GetSaveWriteAddr
	adds r7, r0, #0
	bl GetGameTime
	str r0, [r4]
	adds r0, r4, #0
	adds r1, r7, #0
	movs r2, #0x48
	bl WriteAndVerifySramFast
	bl sub_802F6C4
	ldr r0, _080A1BB4 @ =gActionSt
	adds r1, r7, #0
	adds r1, #0x48
	movs r2, #0x1c
	bl WriteAndVerifySramFast
	ldr r5, _080A1BB8 @ =gBuf
	add r0, sp, #0x10
	mov sl, r0
	ldr r6, _080A1BBC @ =gUnitArrayBlue
	movs r4, #0x33
_080A1AF0:
	adds r1, r5, #0
	adds r5, #0x34
	adds r0, r6, #0
	bl EncodeSuspendSavePackedUnit
	adds r6, #0x48
	subs r4, #1
	cmp r4, #0
	bge _080A1AF0
	movs r1, #0x64
	adds r1, r1, r7
	mov sb, r1
	ldr r6, _080A1BC0 @ =gUnitArrayRed
	movs r4, #0x31
_080A1B0C:
	adds r1, r5, #0
	adds r5, #0x34
	adds r0, r6, #0
	bl EncodeSuspendSavePackedUnit
	adds r6, #0x48
	subs r4, #1
	cmp r4, #0
	bge _080A1B0C
	ldr r6, _080A1BC4 @ =gUnitArrayGreen
	movs r4, #9
_080A1B22:
	adds r1, r5, #0
	adds r5, #0x34
	adds r0, r6, #0
	bl EncodeSuspendSavePackedUnit
	adds r6, #0x48
	subs r4, #1
	cmp r4, #0
	bge _080A1B22
	movs r4, #0
	ldr r0, _080A1BB8 @ =gBuf
	movs r2, #0xb6
	lsls r2, r2, #5
	mov r1, sb
	bl WriteSramFast
	ldr r1, _080A1BC8 @ =0x00001F1C
	adds r0, r7, r1
	bl sub_809F364
	ldr r1, _080A1BCC @ =0x00001F24
	adds r0, r7, r1
	bl sub_809F344
	ldr r1, _080A1BD0 @ =0x00001924
	adds r0, r7, r1
	bl sub_809F3D4
	ldr r1, _080A1BD4 @ =0x000019EC
	adds r0, r7, r1
	bl WritePidStats
	ldr r1, _080A1BD8 @ =0x00001E4C
	adds r0, r7, r1
	bl WriteChapterStats
	ldr r1, _080A1BDC @ =0x00001724
	adds r0, r7, r1
	bl WriteTraps
	mov r0, sl
	bl sub_804B390
	ldr r0, _080A1BE0 @ =0x00001F0C
	adds r1, r7, r0
	mov r0, sl
	movs r2, #0x10
	bl WriteAndVerifySramFast
	ldr r0, _080A1BE4 @ =0x00020509
	str r0, [sp]
	mov r1, sp
	movs r0, #1
	strb r0, [r1, #6]
	mov r0, sp
	mov r1, r8
	bl WriteSaveBlockInfo
	ldr r0, _080A1BE8 @ =gBmSt
	adds r0, #0x3c
	strb r4, [r0]
	bl WriteSwappedSuspendSaveId
_080A1BA0:
	add sp, #0x20
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A1BB0: .4byte gPlaySt
_080A1BB4: .4byte gActionSt
_080A1BB8: .4byte gBuf
_080A1BBC: .4byte gUnitArrayBlue
_080A1BC0: .4byte gUnitArrayRed
_080A1BC4: .4byte gUnitArrayGreen
_080A1BC8: .4byte 0x00001F1C
_080A1BCC: .4byte 0x00001F24
_080A1BD0: .4byte 0x00001924
_080A1BD4: .4byte 0x000019EC
_080A1BD8: .4byte 0x00001E4C
_080A1BDC: .4byte 0x00001724
_080A1BE0: .4byte 0x00001F0C
_080A1BE4: .4byte 0x00020509
_080A1BE8: .4byte gBmSt

	thumb_func_start ReadSuspendSave
ReadSuspendSave: @ 0x080A1BEC
	push {r4, r5, r6, lr}
	sub sp, #0x10
	ldr r1, _080A1CD8 @ =0x0203EC9C
	ldrb r1, [r1]
	adds r0, r1, r0
	bl GetSaveReadAddr
	adds r6, r0, #0
	ldr r5, _080A1CDC @ =ReadSramFast
	ldr r4, _080A1CE0 @ =gPlaySt
	ldr r3, [r5]
	adds r1, r4, #0
	movs r2, #0x48
	bl _call_via_r3
	ldr r0, [r4]
	bl SetGameTime
	adds r0, r6, #0
	adds r0, #0x48
	ldr r1, _080A1CE4 @ =gActionSt
	ldr r3, [r5]
	movs r2, #0x1c
	bl _call_via_r3
	bl sub_802F6D4
	bl InitUnits
	movs r4, #0
	movs r5, #0
_080A1C2A:
	movs r0, #0x34
	muls r0, r4, r0
	adds r0, #0x64
	adds r0, r6, r0
	ldr r1, _080A1CE8 @ =gUnitArrayBlue
	adds r1, r5, r1
	bl ReadSuspendSavePackedUnit
	adds r5, #0x48
	adds r4, #1
	cmp r4, #0x33
	ble _080A1C2A
	movs r4, #0
	movs r5, #0
_080A1C46:
	movs r0, #0x34
	muls r0, r4, r0
	ldr r1, _080A1CEC @ =0x00000AF4
	adds r0, r0, r1
	adds r0, r6, r0
	ldr r1, _080A1CF0 @ =gUnitArrayRed
	adds r1, r5, r1
	bl ReadSuspendSavePackedUnit
	adds r5, #0x48
	adds r4, #1
	cmp r4, #0x31
	ble _080A1C46
	movs r4, #0
	movs r5, #0
_080A1C64:
	movs r0, #0x34
	muls r0, r4, r0
	ldr r2, _080A1CF4 @ =0x0000151C
	adds r0, r0, r2
	adds r0, r6, r0
	ldr r1, _080A1CF8 @ =gUnitArrayGreen
	adds r1, r5, r1
	bl ReadSuspendSavePackedUnit
	adds r5, #0x48
	adds r4, #1
	cmp r4, #9
	ble _080A1C64
	ldr r1, _080A1CFC @ =0x000019EC
	adds r0, r6, r1
	bl ReadPidStats
	ldr r2, _080A1D00 @ =0x00001E4C
	adds r0, r6, r2
	bl ReadChapterStats
	ldr r1, _080A1D04 @ =0x00001924
	adds r0, r6, r1
	bl sub_809F3EC
	ldr r2, _080A1D08 @ =0x00001F1C
	adds r0, r6, r2
	bl sub_809F3AC
	ldr r1, _080A1D0C @ =0x00001F24
	adds r0, r6, r1
	bl sub_809F384
	ldr r2, _080A1D10 @ =0x00001724
	adds r0, r6, r2
	bl ReadTraps
	ldr r1, _080A1CDC @ =ReadSramFast
	ldr r2, _080A1D14 @ =0x00001F0C
	adds r0, r6, r2
	ldr r3, [r1]
	mov r1, sp
	movs r2, #0x10
	bl _call_via_r3
	mov r0, sp
	bl sub_804B3D0
	ldr r0, _080A1CE0 @ =gPlaySt
	ldrb r0, [r0, #0xc]
	bl sub_80A135C
	bl sub_80A0F14
	add sp, #0x10
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080A1CD8: .4byte 0x0203EC9C
_080A1CDC: .4byte ReadSramFast
_080A1CE0: .4byte gPlaySt
_080A1CE4: .4byte gActionSt
_080A1CE8: .4byte gUnitArrayBlue
_080A1CEC: .4byte 0x00000AF4
_080A1CF0: .4byte gUnitArrayRed
_080A1CF4: .4byte 0x0000151C
_080A1CF8: .4byte gUnitArrayGreen
_080A1CFC: .4byte 0x000019EC
_080A1D00: .4byte 0x00001E4C
_080A1D04: .4byte 0x00001924
_080A1D08: .4byte 0x00001F1C
_080A1D0C: .4byte 0x00001F24
_080A1D10: .4byte 0x00001724
_080A1D14: .4byte 0x00001F0C

	thumb_func_start IsValidSuspendSave
IsValidSuspendSave: @ 0x080A1D18
	push {r4, lr}
	adds r4, r0, #0
	bl IsSramWorking
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080A1D5C
	cmp r4, #3
	bne _080A1D5C
	ldr r4, _080A1D60 @ =0x0203EC9C
	bl sub_80A22AC
	strb r0, [r4]
	adds r1, r0, #0
	adds r1, #3
	movs r0, #0
	bl ReadSaveBlockInfo
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080A1D64
	bl sub_80A22CC
	strb r0, [r4]
	adds r1, r0, #0
	adds r1, #3
	movs r0, #0
	bl ReadSaveBlockInfo
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080A1D64
	movs r0, #0x7f
	strb r0, [r4]
_080A1D5C:
	movs r0, #0
	b _080A1D66
	.align 2, 0
_080A1D60: .4byte 0x0203EC9C
_080A1D64:
	movs r0, #1
_080A1D66:
	pop {r4}
	pop {r1}
	bx r1

	thumb_func_start ReadSuspendSavePlaySt
ReadSuspendSavePlaySt: @ 0x080A1D6C
	push {lr}
	ldr r2, _080A1D7C @ =0x0203EC9C
	ldrb r2, [r2]
	adds r0, r2, r0
	bl ReadGameSavePlaySt
	pop {r0}
	bx r0
	.align 2, 0
_080A1D7C: .4byte 0x0203EC9C

	thumb_func_start EncodeSuspendSavePackedUnit
EncodeSuspendSavePackedUnit: @ 0x080A1D80
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x20
	adds r6, r0, #0
	mov ip, r1
	ldr r0, [r6]
	cmp r0, #0
	bne _080A1D9A
	strb r0, [r1]
	b _080A2024
_080A1D9A:
	ldrb r0, [r0, #4]
	mov r1, ip
	strb r0, [r1]
	ldr r0, [r6, #4]
	ldrb r0, [r0, #4]
	strb r0, [r1, #1]
	movs r1, #8
	ldrsb r1, [r6, r1]
	mov r2, ip
	adds r2, #0x24
	movs r4, #0x1f
	ands r1, r4
	movs r3, #0x20
	rsbs r3, r3, #0
	adds r0, r3, #0
	ldrb r5, [r2]
	ands r0, r5
	orrs r0, r1
	strb r0, [r2]
	ldrb r0, [r6, #9]
	mov r7, ip
	strb r0, [r7, #0x10]
	ldr r0, [r6, #0xc]
	str r0, [r7, #4]
	movs r1, #0x10
	ldrsb r1, [r6, r1]
	movs r0, #0x3f
	ands r1, r0
	lsls r1, r1, #5
	ldr r0, _080A2034 @ =0xFFFFF81F
	ldrh r2, [r7, #0x24]
	ands r0, r2
	orrs r0, r1
	strh r0, [r7, #0x24]
	movs r1, #0x3f
	ldrb r5, [r6, #0x11]
	ands r1, r5
	lsls r1, r1, #0xb
	ldr r0, [r7, #0x24]
	ldr r2, _080A2038 @ =0xFFFE07FF
	ands r0, r2
	orrs r0, r1
	str r0, [r7, #0x24]
	ldrb r0, [r6, #0x12]
	strb r0, [r7, #0xe]
	ldrb r0, [r6, #0x13]
	strb r0, [r7, #0xf]
	movs r1, #0x14
	ldrsb r1, [r6, r1]
	mov r2, ip
	adds r2, #0x26
	ands r1, r4
	lsls r1, r1, #1
	movs r0, #0x3f
	rsbs r0, r0, #0
	ldrb r7, [r2]
	ands r0, r7
	orrs r0, r1
	strb r0, [r2]
	movs r1, #0x15
	ldrsb r1, [r6, r1]
	movs r2, #0x1f
	ands r1, r2
	lsls r1, r1, #6
	ldr r0, _080A203C @ =0xFFFFF83F
	mov r5, ip
	ldrh r5, [r5, #0x26]
	ands r0, r5
	orrs r0, r1
	mov r7, ip
	strh r0, [r7, #0x26]
	movs r1, #0x16
	ldrsb r1, [r6, r1]
	movs r0, #0x27
	add r0, ip
	mov r8, r0
	lsls r1, r1, #3
	movs r5, #7
	mov sb, r5
	movs r0, #7
	mov r7, r8
	ldrb r7, [r7]
	ands r0, r7
	orrs r0, r1
	mov r1, r8
	strb r0, [r1]
	movs r0, #0x17
	ldrsb r0, [r6, r0]
	mov r1, ip
	adds r1, #0x28
	ands r0, r4
	ldrb r5, [r1]
	ands r3, r5
	orrs r3, r0
	strb r3, [r1]
	movs r1, #0x18
	ldrsb r1, [r6, r1]
	ands r1, r2
	lsls r1, r1, #5
	ldr r0, _080A2040 @ =0xFFFFFC1F
	mov r7, ip
	ldrh r7, [r7, #0x28]
	ands r0, r7
	orrs r0, r1
	mov r1, ip
	strh r0, [r1, #0x28]
	movs r1, #0x19
	ldrsb r1, [r6, r1]
	mov r2, ip
	adds r2, #0x29
	ands r1, r4
	lsls r1, r1, #2
	movs r0, #0x7d
	rsbs r0, r0, #0
	ldrb r3, [r2]
	ands r0, r3
	orrs r0, r1
	strb r0, [r2]
	movs r2, #0x1a
	ldrsb r2, [r6, r2]
	movs r3, #0x1f
	ands r2, r3
	lsls r2, r2, #0xf
	mov r4, ip
	ldr r0, [r4, #0x28]
	ldr r1, _080A2044 @ =0xFFF07FFF
	ands r0, r1
	orrs r0, r2
	str r0, [r4, #0x28]
	adds r0, r6, #0
	adds r0, #0x30
	ldrb r2, [r0]
	lsls r1, r2, #0x1c
	lsrs r1, r1, #0x1c
	adds r4, #0x2a
	mov r5, sb
	ands r1, r5
	lsls r1, r1, #4
	movs r0, #0x71
	rsbs r0, r0, #0
	ldrb r7, [r4]
	ands r0, r7
	orrs r0, r1
	strb r0, [r4]
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x1c
	movs r0, #7
	ands r2, r0
	lsls r2, r2, #7
	ldr r0, _080A2048 @ =0xFFFFFC7F
	mov r1, ip
	ldrh r1, [r1, #0x2a]
	ands r0, r1
	orrs r0, r2
	mov r2, ip
	strh r0, [r2, #0x2a]
	adds r0, r6, #0
	adds r0, #0x31
	ldrb r2, [r0]
	lsls r1, r2, #0x1c
	lsrs r1, r1, #0x1c
	adds r4, #1
	ands r1, r5
	lsls r1, r1, #2
	movs r0, #0x1d
	rsbs r0, r0, #0
	ldrb r5, [r4]
	ands r0, r5
	orrs r0, r1
	lsrs r2, r2, #4
	lsls r2, r2, #5
	ands r0, r3
	orrs r0, r2
	strb r0, [r4]
	ldrb r0, [r6, #0x1b]
	mov r7, ip
	strb r0, [r7, #3]
	movs r1, #0x1d
	ldrsb r1, [r6, r1]
	mov r2, ip
	adds r2, #0x2c
	movs r0, #0xf
	ands r1, r0
	movs r0, #0x10
	rsbs r0, r0, #0
	ldrb r3, [r2]
	ands r0, r3
	orrs r0, r1
	strb r0, [r2]
	movs r1, #0x7f
	ldrb r4, [r6, #0x1c]
	ands r1, r4
	adds r0, r6, #0
	adds r0, #0x39
	ldrb r3, [r0]
	movs r0, #1
	ands r0, r3
	lsls r0, r0, #7
	orrs r1, r0
	mov r0, ip
	adds r0, #0x30
	strb r1, [r0]
	ldr r2, _080A204C @ =0x00003FFF
	adds r1, r2, #0
	ldrh r5, [r6, #0x1e]
	ands r1, r5
	movs r0, #6
	ands r0, r3
	lsls r0, r0, #0xd
	orrs r1, r0
	strh r1, [r7, #8]
	adds r1, r2, #0
	ldrh r7, [r6, #0x20]
	ands r1, r7
	movs r0, #0x18
	ands r0, r3
	lsls r0, r0, #0xb
	orrs r1, r0
	mov r0, ip
	strh r1, [r0, #0xa]
	adds r1, r2, #0
	ldrh r4, [r6, #0x22]
	ands r1, r4
	movs r0, #0x60
	ands r0, r3
	lsls r0, r0, #9
	orrs r1, r0
	mov r5, ip
	strh r1, [r5, #0xc]
	ldrh r7, [r6, #0x24]
	ands r2, r7
	lsls r2, r2, #4
	ldr r0, [r5, #0x2c]
	ldr r1, _080A2050 @ =0xFFFC000F
	ands r0, r1
	orrs r0, r2
	str r0, [r5, #0x2c]
	ldrh r0, [r6, #0x26]
	lsls r1, r0, #2
	movs r0, #3
	ldrh r2, [r5, #0x2e]
	ands r0, r2
	orrs r0, r1
	strh r0, [r5, #0x2e]
	movs r2, #0
	adds r5, #0x1a
	adds r7, r6, #0
	adds r7, #0x32
	movs r3, #0x42
	adds r3, r3, r6
	mov r8, r3
	adds r4, r6, #0
	adds r4, #0x43
	str r4, [sp, #0xc]
	movs r0, #0x21
	add r0, ip
	mov sb, r0
	adds r1, r6, #0
	adds r1, #0x44
	str r1, [sp, #0x10]
	movs r3, #0x22
	add r3, ip
	mov sl, r3
	adds r4, #2
	str r4, [sp, #0x14]
	mov r0, ip
	adds r0, #0x23
	str r0, [sp]
	subs r1, #4
	str r1, [sp, #8]
	adds r3, r6, #0
	adds r3, #0x46
	str r3, [sp, #0x18]
	mov r4, ip
	adds r4, #0x31
	str r4, [sp, #4]
	ldrb r1, [r6, #0xa]
	mov r0, sp
	strb r1, [r0, #0x1c]
	subs r4, #0x1f
	subs r3, #0x1e
_080A1FCC:
	adds r0, r4, r2
	adds r1, r3, r2
	ldrb r1, [r1]
	strb r1, [r0]
	adds r2, #1
	cmp r2, #7
	ble _080A1FCC
	movs r2, #0
	adds r4, r5, #0
	adds r3, r7, #0
_080A1FE0:
	adds r0, r4, r2
	adds r1, r3, r2
	ldrb r1, [r1]
	strb r1, [r0]
	adds r2, #1
	cmp r2, #6
	ble _080A1FE0
	mov r2, r8
	ldrb r0, [r2]
	mov r3, ip
	strb r0, [r3, #2]
	ldr r4, [sp, #0xc]
	ldrb r0, [r4]
	mov r5, sb
	strb r0, [r5]
	ldr r7, [sp, #0x10]
	ldrb r0, [r7]
	mov r1, sl
	strb r0, [r1]
	ldr r2, [sp, #0x14]
	ldrb r0, [r2]
	ldr r3, [sp]
	strb r0, [r3]
	ldr r4, [sp, #8]
	ldrh r0, [r4]
	mov r5, ip
	strh r0, [r5, #0x32]
	ldr r7, [sp, #0x18]
	ldrb r0, [r7]
	ldr r1, [sp, #4]
	strb r0, [r1]
	mov r2, sp
	ldrb r2, [r2, #0x1c]
	strb r2, [r5, #0x11]
_080A2024:
	add sp, #0x20
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A2034: .4byte 0xFFFFF81F
_080A2038: .4byte 0xFFFE07FF
_080A203C: .4byte 0xFFFFF83F
_080A2040: .4byte 0xFFFFFC1F
_080A2044: .4byte 0xFFF07FFF
_080A2048: .4byte 0xFFFFFC7F
_080A204C: .4byte 0x00003FFF
_080A2050: .4byte 0xFFFC000F

	thumb_func_start ReadSuspendSavePackedUnit
ReadSuspendSavePackedUnit: @ 0x080A2054
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x48
	adds r6, r1, #0
	ldr r1, _080A2264 @ =ReadSramFast
	ldr r3, [r1]
	mov r1, sp
	movs r2, #0x34
	bl _call_via_r3
	mov r0, sp
	ldrb r0, [r0]
	bl GetCharacterData
	str r0, [r6]
	mov r0, sp
	ldrb r0, [r0, #1]
	bl GetClassData
	str r0, [r6, #4]
	add r0, sp, #0x24
	ldrb r0, [r0]
	lsls r0, r0, #0x1b
	lsrs r0, r0, #0x1b
	strb r0, [r6, #8]
	mov r0, sp
	ldrb r0, [r0, #0x10]
	strb r0, [r6, #9]
	ldr r0, [sp, #4]
	str r0, [r6, #0xc]
	mov r0, sp
	ldrh r0, [r0, #0x24]
	lsls r0, r0, #0x15
	lsrs r0, r0, #0x1a
	strb r0, [r6, #0x10]
	ldr r0, [sp, #0x24]
	lsls r0, r0, #0xf
	lsrs r0, r0, #0x1a
	strb r0, [r6, #0x11]
	mov r0, sp
	ldrb r0, [r0, #0xe]
	strb r0, [r6, #0x12]
	mov r0, sp
	ldrb r0, [r0, #0xf]
	strb r0, [r6, #0x13]
	mov r0, sp
	adds r0, #0x26
	ldrb r0, [r0]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1b
	strb r0, [r6, #0x14]
	mov r0, sp
	ldrh r0, [r0, #0x26]
	lsls r0, r0, #0x15
	lsrs r0, r0, #0x1b
	strb r0, [r6, #0x15]
	mov r0, sp
	adds r0, #0x27
	ldrb r0, [r0]
	lsrs r0, r0, #3
	strb r0, [r6, #0x16]
	add r0, sp, #0x28
	ldrb r0, [r0]
	lsls r0, r0, #0x1b
	lsrs r0, r0, #0x1b
	strb r0, [r6, #0x17]
	mov r0, sp
	ldrh r0, [r0, #0x28]
	lsls r0, r0, #0x16
	lsrs r0, r0, #0x1b
	strb r0, [r6, #0x18]
	mov r0, sp
	adds r0, #0x29
	ldrb r0, [r0]
	lsls r0, r0, #0x19
	lsrs r0, r0, #0x1b
	strb r0, [r6, #0x19]
	ldr r0, [sp, #0x28]
	lsls r0, r0, #0xc
	lsrs r0, r0, #0x1b
	strb r0, [r6, #0x1a]
	mov r0, sp
	adds r0, #0x2a
	ldrb r0, [r0]
	lsls r1, r0, #0x19
	adds r2, r6, #0
	adds r2, #0x30
	mov r0, sp
	ldrh r0, [r0, #0x2a]
	lsls r0, r0, #0x16
	lsrs r0, r0, #0x1d
	lsls r0, r0, #4
	lsrs r1, r1, #0x1d
	orrs r1, r0
	strb r1, [r2]
	mov r0, sp
	adds r0, #0x2b
	ldrb r0, [r0]
	lsls r1, r0, #0x1b
	adds r2, #1
	lsrs r0, r0, #5
	lsls r0, r0, #4
	lsrs r1, r1, #0x1d
	orrs r1, r0
	strb r1, [r2]
	mov r0, sp
	ldrb r0, [r0, #3]
	strb r0, [r6, #0x1b]
	add r0, sp, #0x2c
	ldrb r0, [r0]
	lsls r0, r0, #0x1c
	lsrs r0, r0, #0x1c
	strb r0, [r6, #0x1d]
	add r0, sp, #0x30
	ldrb r2, [r0]
	movs r0, #0x7f
	ands r0, r2
	strb r0, [r6, #0x1c]
	mov r0, sp
	ldrh r5, [r0, #8]
	ldr r1, _080A2268 @ =0x00003FFF
	adds r0, r1, #0
	ands r0, r5
	strh r0, [r6, #0x1e]
	mov r0, sp
	ldrh r4, [r0, #0xa]
	adds r0, r1, #0
	ands r0, r4
	strh r0, [r6, #0x20]
	mov r0, sp
	ldrh r3, [r0, #0xc]
	ands r1, r3
	strh r1, [r6, #0x22]
	ldr r0, [sp, #0x2c]
	lsls r0, r0, #0xe
	lsrs r0, r0, #0x12
	strh r0, [r6, #0x24]
	mov r0, sp
	ldrh r1, [r0, #0x2e]
	lsrs r0, r1, #2
	strh r0, [r6, #0x26]
	movs r1, #0x80
	ands r1, r2
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x1f
	movs r2, #0xc0
	lsls r2, r2, #8
	adds r0, r2, #0
	ands r0, r5
	lsrs r0, r0, #0xd
	orrs r0, r1
	adds r1, r2, #0
	ands r1, r4
	lsrs r1, r1, #0xb
	orrs r1, r0
	ands r2, r3
	lsrs r2, r2, #9
	orrs r2, r1
	adds r0, r6, #0
	adds r0, #0x39
	strb r2, [r0]
	movs r2, #0
	movs r0, #0x1a
	add r0, sp
	mov sl, r0
	mov r1, sp
	adds r1, #0x21
	str r1, [sp, #0x34]
	mov r0, sp
	adds r0, #0x22
	str r0, [sp, #0x38]
	adds r1, #2
	str r1, [sp, #0x3c]
	adds r0, #0xf
	str r0, [sp, #0x40]
	adds r4, r6, #0
	adds r4, #0x28
	mov r3, sp
	adds r3, #0x12
_080A21C0:
	adds r0, r4, r2
	adds r1, r3, r2
	ldrb r1, [r1]
	strb r1, [r0]
	adds r2, #1
	cmp r2, #7
	ble _080A21C0
	movs r2, #0
	adds r5, r6, #0
	adds r5, #0x42
	movs r1, #0x43
	adds r1, r1, r6
	mov ip, r1
	adds r7, r6, #0
	adds r7, #0x44
	movs r0, #0x45
	adds r0, r0, r6
	mov r8, r0
	movs r1, #0x40
	adds r1, r1, r6
	mov sb, r1
	adds r0, r6, #0
	adds r0, #0x46
	str r0, [sp, #0x44]
	adds r4, r6, #0
	adds r4, #0x32
	mov r3, sl
_080A21F6:
	adds r0, r4, r2
	adds r1, r3, r2
	ldrb r1, [r1]
	strb r1, [r0]
	adds r2, #1
	cmp r2, #6
	ble _080A21F6
	mov r0, sp
	ldrb r0, [r0, #2]
	strb r0, [r5]
	ldr r1, [sp, #0x34]
	ldrb r0, [r1]
	mov r1, ip
	strb r0, [r1]
	ldr r1, [sp, #0x38]
	ldrb r0, [r1]
	strb r0, [r7]
	ldr r1, [sp, #0x3c]
	ldrb r0, [r1]
	mov r1, r8
	strb r0, [r1]
	mov r0, sp
	ldrh r0, [r0, #0x32]
	mov r1, sb
	strh r0, [r1]
	ldr r1, [sp, #0x40]
	ldrb r0, [r1]
	ldr r1, [sp, #0x44]
	strb r0, [r1]
	mov r0, sp
	ldrb r0, [r0, #0x11]
	strb r0, [r6, #0xa]
	ldrb r0, [r6, #9]
	cmp r0, #0x7f
	bne _080A2240
	movs r0, #0xff
	strb r0, [r6, #9]
_080A2240:
	ldrb r0, [r6, #0x10]
	cmp r0, #0x3f
	bne _080A224A
	movs r0, #0xff
	strb r0, [r6, #0x10]
_080A224A:
	ldrb r0, [r6, #0x11]
	cmp r0, #0x3f
	bne _080A2254
	movs r0, #0xff
	strb r0, [r6, #0x11]
_080A2254:
	add sp, #0x48
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A2264: .4byte ReadSramFast
_080A2268: .4byte 0x00003FFF

	thumb_func_start WriteTraps
WriteTraps: @ 0x080A226C
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0
	bl GetTrap
	movs r2, #0x80
	lsls r2, r2, #2
	adds r1, r4, #0
	bl WriteAndVerifySramFast
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start ReadTraps
ReadTraps: @ 0x080A2288
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r4, _080A22A8 @ =ReadSramFast
	movs r0, #0
	bl GetTrap
	adds r1, r0, #0
	movs r2, #0x80
	lsls r2, r2, #2
	ldr r3, [r4]
	adds r0, r5, #0
	bl _call_via_r3
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080A22A8: .4byte ReadSramFast

	thumb_func_start sub_80A22AC
sub_80A22AC: @ 0x080A22AC
	push {lr}
	sub sp, #0x64
	mov r0, sp
	bl ReadGlobalSaveInfo
	mov r0, sp
	adds r0, #0x63
	ldrb r0, [r0]
	cmp r0, #1
	beq _080A22C4
	movs r0, #0
	b _080A22C6
_080A22C4:
	movs r0, #1
_080A22C6:
	add sp, #0x64
	pop {r1}
	bx r1

	thumb_func_start sub_80A22CC
sub_80A22CC: @ 0x080A22CC
	push {lr}
	bl sub_80A22AC
	adds r1, r0, #0
	movs r0, #1
	subs r0, r0, r1
	pop {r1}
	bx r1

	thumb_func_start WriteSwappedSuspendSaveId
WriteSwappedSuspendSaveId: @ 0x080A22DC
	push {lr}
	sub sp, #0x64
	mov r0, sp
	bl ReadGlobalSaveInfo
	movs r2, #0
	mov r1, sp
	adds r1, #0x63
	ldrb r0, [r1]
	cmp r0, #0
	bne _080A22F4
	movs r2, #1
_080A22F4:
	strb r2, [r1]
	mov r0, sp
	bl WriteGlobalSaveInfoNoChecksum
	add sp, #0x64
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start SramChecksum32
SramChecksum32: @ 0x080A2304
	push {r4, r5, lr}
	adds r5, r1, #0
	ldr r1, _080A2324 @ =ReadSramFast
	ldr r4, _080A2328 @ =gBuf
	ldr r3, [r1]
	adds r1, r4, #0
	adds r2, r5, #0
	bl _call_via_r3
	adds r0, r4, #0
	adds r1, r5, #0
	bl Checksum32_thm
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_080A2324: .4byte ReadSramFast
_080A2328: .4byte gBuf

	thumb_func_start VerifySaveBlockChecksum
VerifySaveBlockChecksum: @ 0x080A232C
	push {r4, r5, lr}
	adds r4, r0, #0
	ldrh r5, [r4, #0xa]
	ldrh r0, [r4, #8]
	bl SramOffsetToAddr
	adds r1, r5, #0
	bl SramChecksum32
	ldr r1, [r4, #0xc]
	cmp r1, r0
	bne _080A2348
	movs r0, #1
	b _080A234A
_080A2348:
	movs r0, #0
_080A234A:
	pop {r4, r5}
	pop {r1}
	bx r1

	thumb_func_start PopulateSaveBlockChecksum
PopulateSaveBlockChecksum: @ 0x080A2350
	push {r4, r5, lr}
	adds r4, r0, #0
	ldrh r5, [r4, #0xa]
	ldrh r0, [r4, #8]
	bl SramOffsetToAddr
	adds r1, r5, #0
	bl SramChecksum32
	str r0, [r4, #0xc]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_80A236C
sub_80A236C: @ 0x080A236C
	push {r4, r5, r6, lr}
	movs r6, #0
	ldr r4, _080A2434 @ =gUnitArrayBlue
	movs r5, #0x33
_080A2374:
	ldr r0, [r4]
	cmp r0, #0
	beq _080A238C
	movs r0, #0
	str r0, [r4, #0x3c]
	adds r0, r4, #0
	movs r1, #0x24
	bl SramChecksum32
	adds r0, r6, r0
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
_080A238C:
	adds r4, #0x48
	subs r5, #1
	cmp r5, #0
	bge _080A2374
	ldr r4, _080A2438 @ =gUnitArrayRed
	movs r5, #0x31
_080A2398:
	ldr r0, [r4]
	cmp r0, #0
	beq _080A23B0
	movs r0, #0
	str r0, [r4, #0x3c]
	adds r0, r4, #0
	movs r1, #0x24
	bl SramChecksum32
	adds r0, r6, r0
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
_080A23B0:
	adds r4, #0x48
	subs r5, #1
	cmp r5, #0
	bge _080A2398
	ldr r4, _080A243C @ =gUnitArrayGreen
	movs r5, #9
_080A23BC:
	ldr r0, [r4]
	cmp r0, #0
	beq _080A23D4
	movs r0, #0
	str r0, [r4, #0x3c]
	adds r0, r4, #0
	movs r1, #0x24
	bl SramChecksum32
	adds r0, r6, r0
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
_080A23D4:
	adds r4, #0x48
	subs r5, #1
	cmp r5, #0
	bge _080A23BC
	bl GetPermanentFlagBits
	adds r4, r0, #0
	bl sub_807A0FC
	adds r1, r0, #0
	lsrs r0, r1, #0x1f
	adds r1, r1, r0
	asrs r1, r1, #1
	adds r0, r4, #0
	bl SramChecksum32
	adds r0, r6, r0
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	bl sub_807A100
	adds r4, r0, #0
	bl sub_807A108
	adds r1, r0, #0
	lsrs r0, r1, #0x1f
	adds r1, r1, r0
	asrs r1, r1, #1
	adds r0, r4, #0
	bl SramChecksum32
	adds r0, r6, r0
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	movs r0, #0
	bl GetTrap
	movs r1, #0x80
	lsls r1, r1, #1
	bl SramChecksum32
	adds r0, r6, r0
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	adds r0, r6, #0
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_080A2434: .4byte gUnitArrayBlue
_080A2438: .4byte gUnitArrayRed
_080A243C: .4byte gUnitArrayGreen

	thumb_func_start sub_80A2440
sub_80A2440: @ 0x080A2440
	sub sp, #8
	add sp, #8
	bx lr
	.align 2, 0

	thumb_func_start sub_80A2448
sub_80A2448: @ 0x080A2448
	push {lr}
	adds r1, r0, #0
	movs r0, #0
	bl ReadSaveBlockInfo
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_80A245C
sub_80A245C: @ 0x080A245C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x68
	movs r0, #5
	bl GetSaveWriteAddr
	mov r8, r0
	add r0, sp, #0x58
	movs r4, #0
	strh r4, [r0]
	add r5, sp, #0x10
	ldr r2, _080A2590 @ =0x01000012
	adds r1, r5, #0
	bl CpuSet
	mov r0, sp
	adds r0, #0x5a
	strh r4, [r0]
	add r4, sp, #0x34
	ldr r2, _080A2594 @ =0x01000007
	adds r1, r4, #0
	bl CpuSet
	movs r7, #0
	mov sb, r5
	add r0, sp, #0x5c
	mov sl, r0
	mov r1, sp
	adds r1, #0x44
	str r1, [sp, #0x60]
	mov r3, sp
	adds r3, #0x48
	str r3, [sp, #0x64]
	mov r6, r8
_080A24A6:
	movs r0, #0xc4
	muls r0, r7, r0
	adds r0, #0x10
	mov r1, r8
	adds r4, r1, r0
	movs r5, #4
_080A24B2:
	mov r0, sb
	adds r1, r4, #0
	movs r2, #0x24
	bl WriteAndVerifySramFast
	adds r4, #0x24
	subs r5, #1
	cmp r5, #0
	bge _080A24B2
	add r0, sp, #0x34
	adds r1, r6, #0
	movs r2, #0xf
	bl WriteAndVerifySramFast
	adds r6, #0xc4
	adds r7, #1
	cmp r7, #9
	ble _080A24A6
	movs r0, #7
	mov r3, sl
	strh r0, [r3]
	movs r1, #0xf5
	lsls r1, r1, #3
	add r1, r8
	mov r0, sl
	movs r2, #2
	bl WriteAndVerifySramFast
	ldr r6, [sp, #0x60]
	mov sl, r6
	ldr r0, _080A2598 @ =gUnk_0842D270
	movs r1, #3
	mov sb, r1
	ldr r5, _080A259C @ =0x000007AC
	add r5, r8
	adds r3, r0, #4
	mov r8, r3
	adds r4, r0, #0
	movs r7, #9
_080A2500:
	ldrb r3, [r4]
	lsls r0, r3, #0x1e
	lsrs r0, r0, #0x1e
	mov r6, sb
	ands r0, r6
	movs r1, #4
	rsbs r1, r1, #0
	adds r2, r1, #0
	mov r6, sl
	ldrb r6, [r6]
	ands r2, r6
	orrs r2, r0
	lsls r0, r3, #0x1c
	lsrs r0, r0, #0x1e
	mov r1, sb
	ands r0, r1
	lsls r0, r0, #2
	movs r6, #0xd
	rsbs r6, r6, #0
	adds r1, r6, #0
	ands r2, r1
	orrs r2, r0
	movs r1, #0x10
	ands r1, r3
	movs r3, #0x11
	rsbs r3, r3, #0
	adds r0, r3, #0
	ands r2, r0
	orrs r2, r1
	mov r6, sl
	strb r2, [r6]
	ldr r2, [r4]
	lsrs r2, r2, #5
	lsls r2, r2, #5
	ldr r0, [sp, #0x44]
	movs r1, #0x1f
	ands r0, r1
	orrs r0, r2
	str r0, [sp, #0x44]
	mov r0, r8
	ldr r1, [sp, #0x64]
	bl SioStrCpy
	mov r0, sl
	adds r1, r5, #0
	movs r2, #0x14
	bl WriteAndVerifySramFast
	adds r5, #0x14
	movs r0, #0x14
	add r8, r0
	adds r4, #0x14
	subs r7, #1
	cmp r7, #0
	bge _080A2500
	ldr r0, _080A25A0 @ =0x00020112
	str r0, [sp]
	mov r1, sp
	movs r0, #2
	strb r0, [r1, #6]
	mov r0, sp
	movs r1, #5
	bl WriteSaveBlockInfo
	add sp, #0x68
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A2590: .4byte 0x01000012
_080A2594: .4byte 0x01000007
_080A2598: .4byte gUnk_0842D270
_080A259C: .4byte 0x000007AC
_080A25A0: .4byte 0x00020112

	thumb_func_start sub_80A25A4
sub_80A25A4: @ 0x080A25A4
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	movs r0, #5
	bl GetSaveReadAddr
	ldr r2, _080A25CC @ =ReadSramFast
	movs r1, #0xc4
	muls r1, r4, r1
	adds r0, r0, r1
	ldr r3, [r2]
	adds r1, r5, #0
	movs r2, #0xc4
	bl _call_via_r3
	ldrb r0, [r5]
	cmp r0, #0
	beq _080A25D0
	movs r0, #1
	b _080A25D2
	.align 2, 0
_080A25CC: .4byte ReadSramFast
_080A25D0:
	movs r0, #0
_080A25D2:
	pop {r4, r5}
	pop {r1}
	bx r1

	thumb_func_start sub_80A25D8
sub_80A25D8: @ 0x080A25D8
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	movs r0, #5
	bl GetSaveReadAddr
	ldr r2, _080A260C @ =ReadSramFast
	movs r1, #0xc4
	muls r1, r4, r1
	adds r0, r0, r1
	ldr r4, _080A2610 @ =0x0203ECA0
	ldr r3, [r2]
	adds r1, r4, #0
	movs r2, #0xc4
	bl _call_via_r3
	ldrb r0, [r4]
	cmp r0, #0
	beq _080A2614
	adds r0, r4, #0
	adds r1, r5, #0
	bl SioStrCpy
	movs r0, #1
	b _080A2616
	.align 2, 0
_080A260C: .4byte ReadSramFast
_080A2610: .4byte 0x0203ECA0
_080A2614:
	movs r0, #0
_080A2616:
	pop {r4, r5}
	pop {r1}
	bx r1

	thumb_func_start sub_80A261C
sub_80A261C: @ 0x080A261C
	push {r4, r5, lr}
	sub sp, #0x10
	adds r4, r0, #0
	adds r5, r1, #0
	movs r0, #5
	bl GetSaveWriteAddr
	adds r1, r0, #0
	movs r0, #0xc4
	muls r0, r4, r0
	adds r1, r1, r0
	adds r0, r5, #0
	movs r2, #0xf
	bl WriteAndVerifySramFast
	ldr r0, _080A2654 @ =0x00020112
	str r0, [sp]
	mov r1, sp
	movs r0, #2
	strb r0, [r1, #6]
	mov r0, sp
	movs r1, #5
	bl WriteSaveBlockInfo
	add sp, #0x10
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080A2654: .4byte 0x00020112

	thumb_func_start sub_80A2658
sub_80A2658: @ 0x080A2658
	push {r4, r5, r6, lr}
	sub sp, #0x14
	adds r6, r0, #0
	movs r0, #5
	bl GetSaveWriteAddr
	adds r4, r0, #0
	add r0, sp, #0x10
	movs r1, #0
	strh r1, [r0]
	ldr r5, _080A26A0 @ =0x0203ECA0
	ldr r2, _080A26A4 @ =0x01000062
	adds r1, r5, #0
	bl CpuSet
	movs r0, #0xc4
	muls r0, r6, r0
	adds r4, r4, r0
	adds r0, r5, #0
	adds r1, r4, #0
	movs r2, #0xc4
	bl WriteAndVerifySramFast
	ldr r0, _080A26A8 @ =0x00020112
	str r0, [sp]
	mov r1, sp
	movs r0, #2
	strb r0, [r1, #6]
	mov r0, sp
	movs r1, #5
	bl WriteSaveBlockInfo
	add sp, #0x14
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080A26A0: .4byte 0x0203ECA0
_080A26A4: .4byte 0x01000062
_080A26A8: .4byte 0x00020112

	thumb_func_start sub_80A26AC
sub_80A26AC: @ 0x080A26AC
	push {r4, r5, r6, lr}
	mov r6, sb
	mov r5, r8
	push {r5, r6}
	sub sp, #0x10
	adds r6, r0, #0
	mov sb, r1
	movs r0, #5
	bl GetSaveReadAddr
	adds r4, r0, #0
	movs r0, #5
	bl GetSaveWriteAddr
	adds r5, r0, #0
	ldr r1, _080A2718 @ =ReadSramFast
	movs r0, #0xc4
	mov r8, r0
	mov r0, r8
	muls r0, r6, r0
	adds r4, r4, r0
	ldr r6, _080A271C @ =0x0203ECA0
	ldr r3, [r1]
	adds r0, r4, #0
	adds r1, r6, #0
	movs r2, #0xc4
	bl _call_via_r3
	mov r1, r8
	mov r0, sb
	muls r0, r1, r0
	adds r5, r5, r0
	adds r0, r6, #0
	adds r1, r5, #0
	movs r2, #0xc4
	bl WriteAndVerifySramFast
	ldr r0, _080A2720 @ =0x00020112
	str r0, [sp]
	mov r1, sp
	movs r0, #2
	strb r0, [r1, #6]
	mov r0, sp
	movs r1, #5
	bl WriteSaveBlockInfo
	add sp, #0x10
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080A2718: .4byte ReadSramFast
_080A271C: .4byte 0x0203ECA0
_080A2720: .4byte 0x00020112

	thumb_func_start sub_80A2724
sub_80A2724: @ 0x080A2724
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x10
	mov r8, r0
	mov sl, r1
	movs r0, #5
	bl GetSaveReadAddr
	adds r5, r0, #0
	movs r0, #5
	bl GetSaveWriteAddr
	adds r6, r0, #0
	ldr r0, _080A27B0 @ =ReadSramFast
	mov sb, r0
	movs r4, #0xc4
	mov r7, r8
	muls r7, r4, r7
	adds r0, r5, r7
	mov r1, sb
	ldr r3, [r1]
	ldr r1, _080A27B4 @ =0x0203ECA0
	movs r2, #0xc4
	bl _call_via_r3
	mov r0, sl
	muls r0, r4, r0
	adds r4, r0, #0
	adds r5, r5, r4
	ldr r1, _080A27B8 @ =0x0203ED64
	mov r8, r1
	mov r0, sb
	ldr r3, [r0]
	adds r0, r5, #0
	movs r2, #0xc4
	bl _call_via_r3
	adds r4, r6, r4
	ldr r0, _080A27B4 @ =0x0203ECA0
	adds r1, r4, #0
	movs r2, #0xc4
	bl WriteAndVerifySramFast
	adds r6, r6, r7
	mov r0, r8
	adds r1, r6, #0
	movs r2, #0xc4
	bl WriteAndVerifySramFast
	ldr r0, _080A27BC @ =0x00020112
	str r0, [sp]
	mov r1, sp
	movs r0, #2
	strb r0, [r1, #6]
	mov r0, sp
	movs r1, #5
	bl WriteSaveBlockInfo
	add sp, #0x10
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A27B0: .4byte ReadSramFast
_080A27B4: .4byte 0x0203ECA0
_080A27B8: .4byte 0x0203ED64
_080A27BC: .4byte 0x00020112

	thumb_func_start sub_80A27C0
sub_80A27C0: @ 0x080A27C0
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	sub sp, #0x10
	adds r4, r0, #0
	mov r8, r1
	adds r6, r2, #0
	movs r0, #5
	bl GetSaveWriteAddr
	adds r5, r0, #0
	movs r0, #0xc4
	muls r4, r0, r4
	adds r1, r5, r4
	adds r0, r6, #0
	movs r2, #0xf
	bl WriteAndVerifySramFast
	adds r4, #0x10
	adds r5, r5, r4
	mov r4, r8
	movs r6, #4
_080A27EC:
	adds r0, r4, #0
	adds r1, r5, #0
	bl WriteGameSavePackedUnit
	adds r5, #0x24
	adds r4, #0x48
	subs r6, #1
	cmp r6, #0
	bge _080A27EC
	ldr r0, _080A281C @ =0x00020112
	str r0, [sp]
	mov r1, sp
	movs r0, #2
	strb r0, [r1, #6]
	mov r0, sp
	movs r1, #5
	bl WriteSaveBlockInfo
	add sp, #0x10
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080A281C: .4byte 0x00020112

	thumb_func_start sub_80A2820
sub_80A2820: @ 0x080A2820
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	mov r8, r0
	adds r6, r1, #0
	adds r5, r2, #0
	movs r0, #5
	bl GetSaveReadAddr
	adds r7, r0, #0
	ldr r1, _080A2874 @ =ReadSramFast
	movs r0, #0xc4
	mov r4, r8
	muls r4, r0, r4
	adds r0, r7, r4
	ldr r3, [r1]
	adds r1, r5, #0
	movs r2, #0xf
	bl _call_via_r3
	adds r4, #0x10
	adds r4, r7, r4
	movs r5, #4
_080A284E:
	adds r0, r4, #0
	adds r1, r6, #0
	bl LoadSavedUnit
	adds r6, #0x48
	adds r4, #0x24
	subs r5, #1
	cmp r5, #0
	bge _080A284E
	movs r0, #0xc4
	mov r1, r8
	muls r1, r0, r1
	adds r0, r1, #0
	adds r0, r7, r0
	ldrb r0, [r0]
	cmp r0, #0
	beq _080A2878
	movs r0, #1
	b _080A287A
	.align 2, 0
_080A2874: .4byte ReadSramFast
_080A2878:
	movs r0, #0
_080A287A:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	thumb_func_start sub_80A2884
sub_80A2884: @ 0x080A2884
	push {r4, lr}
	sub sp, #0x10
	adds r4, r0, #0
	movs r0, #5
	bl GetSaveWriteAddr
	adds r1, r0, #0
	ldr r0, _080A28B8 @ =0x000007AC
	adds r1, r1, r0
	adds r0, r4, #0
	movs r2, #0xc8
	bl WriteAndVerifySramFast
	ldr r0, _080A28BC @ =0x00020112
	str r0, [sp]
	mov r1, sp
	movs r0, #2
	strb r0, [r1, #6]
	mov r0, sp
	movs r1, #5
	bl WriteSaveBlockInfo
	add sp, #0x10
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A28B8: .4byte 0x000007AC
_080A28BC: .4byte 0x00020112

	thumb_func_start sub_80A28C0
sub_80A28C0: @ 0x080A28C0
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #5
	bl GetSaveReadAddr
	ldr r1, _080A28E0 @ =ReadSramFast
	ldr r2, _080A28E4 @ =0x000007AC
	adds r0, r0, r2
	ldr r3, [r1]
	adds r1, r4, #0
	movs r2, #0xc8
	bl _call_via_r3
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A28E0: .4byte ReadSramFast
_080A28E4: .4byte 0x000007AC

	thumb_func_start sub_80A28E8
sub_80A28E8: @ 0x080A28E8
	push {r4, lr}
	sub sp, #0x10
	adds r4, r0, #0
	movs r0, #5
	bl GetSaveWriteAddr
	adds r1, r0, #0
	movs r0, #0xf5
	lsls r0, r0, #3
	adds r1, r1, r0
	adds r0, r4, #0
	movs r2, #2
	bl WriteAndVerifySramFast
	ldr r0, _080A2920 @ =0x00020112
	str r0, [sp]
	mov r1, sp
	movs r0, #2
	strb r0, [r1, #6]
	mov r0, sp
	movs r1, #5
	bl WriteSaveBlockInfo
	add sp, #0x10
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A2920: .4byte 0x00020112

	thumb_func_start sub_80A2924
sub_80A2924: @ 0x080A2924
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #5
	bl GetSaveReadAddr
	ldr r1, _080A2948 @ =ReadSramFast
	movs r2, #0xf5
	lsls r2, r2, #3
	adds r0, r0, r2
	ldr r3, [r1]
	adds r1, r4, #0
	movs r2, #2
	bl _call_via_r3
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A2948: .4byte ReadSramFast

	thumb_func_start sub_80A294C
sub_80A294C: @ 0x080A294C
	push {r4, lr}
	sub sp, #0x10
	movs r0, #5
	bl sub_80A2448
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080A2962
	b _080A297A
_080A295E:
	movs r0, #1
	b _080A297C
_080A2962:
	movs r4, #0
_080A2964:
	adds r0, r4, #0
	mov r1, sp
	bl sub_80A25D8
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	beq _080A295E
	adds r4, #1
	cmp r4, #9
	ble _080A2964
_080A297A:
	movs r0, #0
_080A297C:
	add sp, #0x10
	pop {r4}
	pop {r1}
	bx r1

	thumb_func_start LoadAndVerfySuspendSave
LoadAndVerfySuspendSave: @ 0x080A2984
	push {r4, lr}
	sub sp, #0x48
	movs r0, #3
	bl IsValidSuspendSave
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080A29C8
	movs r0, #3
	mov r1, sp
	bl ReadSuspendSavePlaySt
	mov r0, sp
	ldrb r0, [r0, #0xe]
	cmp r0, #0x30
	bne _080A29C8
	ldr r1, _080A29D0 @ =ReadSramFast
	ldr r0, _080A29D4 @ =gpSramExtraData
	ldr r0, [r0]
	ldr r4, _080A29D8 @ =gExtraMapSaveHead
	ldr r3, [r1]
	adds r1, r4, #0
	movs r2, #0x1c
	bl _call_via_r3
	ldr r0, [sp, #0x2c]
	lsls r0, r0, #9
	lsrs r0, r0, #0x16
	ldrb r4, [r4, #0xf]
	cmp r0, r4
	beq _080A29C8
	movs r0, #3
	bl InvalidateSuspendSave
_080A29C8:
	add sp, #0x48
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A29D0: .4byte ReadSramFast
_080A29D4: .4byte gpSramExtraData
_080A29D8: .4byte gExtraMapSaveHead

	thumb_func_start ReadExtraMapSaveHead
ReadExtraMapSaveHead: @ 0x080A29DC
	push {r4, r5, lr}
	ldr r1, _080A2A2C @ =ReadSramFast
	ldr r5, _080A2A30 @ =gpSramExtraData
	ldr r0, [r5]
	ldr r4, _080A2A34 @ =gExtraMapSaveHead
	ldr r3, [r1]
	adds r1, r4, #0
	movs r2, #0x1c
	bl _call_via_r3
	ldr r1, [r4]
	ldr r0, _080A2A38 @ =0x50414D58
	cmp r1, r0
	bne _080A2A48
	bl GetLang
	lsls r0, r0, #0x18
	ldr r1, _080A2A3C @ =0x00020223
	adds r0, r0, r1
	ldr r1, [r4, #8]
	cmp r1, r0
	bne _080A2A48
	ldr r0, [r4, #0x10]
	ldr r1, [r5]
	adds r0, r0, r1
	str r0, [r4, #0x10]
	ldr r0, [r4, #0x18]
	adds r0, r0, r1
	str r0, [r4, #0x18]
	ldr r2, _080A2A40 @ =gPlaySt
	ldrb r4, [r4, #0xf]
	lsls r3, r4, #0xd
	ldr r0, [r2, #0x2c]
	ldr r1, _080A2A44 @ =0xFF801FFF
	ands r0, r1
	orrs r0, r3
	str r0, [r2, #0x2c]
	movs r0, #1
	b _080A2A4A
	.align 2, 0
_080A2A2C: .4byte ReadSramFast
_080A2A30: .4byte gpSramExtraData
_080A2A34: .4byte gExtraMapSaveHead
_080A2A38: .4byte 0x50414D58
_080A2A3C: .4byte 0x00020223
_080A2A40: .4byte gPlaySt
_080A2A44: .4byte 0xFF801FFF
_080A2A48:
	movs r0, #0
_080A2A4A:
	pop {r4, r5}
	pop {r1}
	bx r1

	thumb_func_start GetExtraMapMapReadAddr
GetExtraMapMapReadAddr: @ 0x080A2A50
	ldr r2, _080A2A60 @ =gExtraMapSaveHead
	ldr r1, [r2]
	ldr r0, _080A2A64 @ =0x50414D58
	cmp r1, r0
	bne _080A2A68
	ldr r0, [r2, #0x10]
	b _080A2A6A
	.align 2, 0
_080A2A60: .4byte gExtraMapSaveHead
_080A2A64: .4byte 0x50414D58
_080A2A68:
	movs r0, #0
_080A2A6A:
	bx lr

	thumb_func_start GetExtraMapMapSize
GetExtraMapMapSize: @ 0x080A2A6C
	ldr r2, _080A2A7C @ =gExtraMapSaveHead
	ldr r1, [r2]
	ldr r0, _080A2A80 @ =0x50414D58
	cmp r1, r0
	bne _080A2A84
	movs r1, #0x14
	ldrsh r0, [r2, r1]
	b _080A2A86
	.align 2, 0
_080A2A7C: .4byte gExtraMapSaveHead
_080A2A80: .4byte 0x50414D58
_080A2A84:
	movs r0, #0
_080A2A86:
	bx lr

	thumb_func_start GetExtraMapInfoReadAddr
GetExtraMapInfoReadAddr: @ 0x080A2A88
	ldr r2, _080A2A98 @ =gExtraMapSaveHead
	ldr r1, [r2]
	ldr r0, _080A2A9C @ =0x50414D58
	cmp r1, r0
	bne _080A2AA0
	ldr r0, [r2, #0x18]
	b _080A2AA2
	.align 2, 0
_080A2A98: .4byte gExtraMapSaveHead
_080A2A9C: .4byte 0x50414D58
_080A2AA0:
	movs r0, #0
_080A2AA2:
	bx lr

	thumb_func_start GetExtraMapInfoSize
GetExtraMapInfoSize: @ 0x080A2AA4
	ldr r2, _080A2AB4 @ =gExtraMapSaveHead
	ldr r1, [r2]
	ldr r0, _080A2AB8 @ =0x50414D58
	cmp r1, r0
	bne _080A2ABC
	movs r1, #0x16
	ldrsh r0, [r2, r1]
	b _080A2ABE
	.align 2, 0
_080A2AB4: .4byte gExtraMapSaveHead
_080A2AB8: .4byte 0x50414D58
_080A2ABC:
	movs r0, #0
_080A2ABE:
	bx lr

	thumb_func_start ExtraMapChecksum
ExtraMapChecksum: @ 0x080A2AC0
	adds r2, r0, #0
	movs r3, #0
	lsrs r0, r1, #0x1f
	adds r1, r1, r0
	asrs r1, r1, #1
	cmp r3, r1
	bge _080A2ADA
_080A2ACE:
	ldrh r0, [r2]
	adds r3, r0, r3
	adds r2, #2
	subs r1, #1
	cmp r1, #0
	bne _080A2ACE
_080A2ADA:
	lsls r0, r3, #0x10
	lsrs r0, r0, #0x10
	bx lr

	thumb_func_start IsExtraMapAvailable
IsExtraMapAvailable: @ 0x080A2AE0
	push {r4, lr}
	ldr r4, _080A2B34 @ =gBuf
	bl IsSramWorking
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080A2B48
	ldr r1, _080A2B38 @ =ReadSramFast
	ldr r0, _080A2B3C @ =0x0E007400
	movs r2, #0xc0
	lsls r2, r2, #4
	ldr r3, [r1]
	adds r1, r4, #0
	bl _call_via_r3
	ldr r1, [r4]
	ldr r0, _080A2B40 @ =0x50414D58
	cmp r1, r0
	bne _080A2B48
	bl GetLang
	lsls r0, r0, #0x18
	ldr r1, _080A2B44 @ =0x00020223
	adds r0, r0, r1
	ldr r1, [r4, #8]
	cmp r1, r0
	bne _080A2B48
	ldrh r0, [r4, #4]
	cmp r0, #0
	beq _080A2B48
	adds r0, r4, #0
	adds r0, #8
	ldrh r1, [r4, #4]
	bl ExtraMapChecksum
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldrh r4, [r4, #6]
	cmp r4, r0
	bne _080A2B48
	movs r0, #1
	b _080A2B4A
	.align 2, 0
_080A2B34: .4byte gBuf
_080A2B38: .4byte ReadSramFast
_080A2B3C: .4byte 0x0E007400
_080A2B40: .4byte 0x50414D58
_080A2B44: .4byte 0x00020223
_080A2B48:
	movs r0, #0
_080A2B4A:
	pop {r4}
	pop {r1}
	bx r1

	thumb_func_start ReadExtraMapInfo
ReadExtraMapInfo: @ 0x080A2B50
	push {r4, r5, r6, lr}
	bl ReadExtraMapSaveHead
	ldr r5, _080A2BB8 @ =ReadSramFast
	bl GetExtraMapInfoReadAddr
	adds r4, r0, #0
	ldr r6, _080A2BBC @ =gBuf
	bl GetExtraMapInfoSize
	adds r2, r0, #0
	ldr r3, [r5]
	adds r0, r4, #0
	adds r1, r6, #0
	bl _call_via_r3
	ldr r4, _080A2BC0 @ =gExtraMapInfo
	ldr r1, [r4]
	adds r0, r6, #0
	bl Decompress
	ldr r1, [r4]
	ldr r0, _080A2BC4 @ =gPlaySt
	str r0, [r1, #0x18]
	ldr r0, _080A2BC8 @ =gBmSt
	str r0, [r1, #0x1c]
	ldr r0, _080A2BCC @ =gActiveUnit
	str r0, [r1, #0x20]
	ldr r0, _080A2BD0 @ =gUnitLut
	str r0, [r1, #0x24]
	ldr r0, _080A2BD4 @ =gBattleActor
	str r0, [r1, #0x28]
	ldr r0, _080A2BD8 @ =gBattleTarget
	str r0, [r1, #0x2c]
	ldr r0, _080A2BDC @ =gBattleHitArray
	str r0, [r1, #0x30]
	movs r0, #0
	bl GetTrap
	ldr r1, [r4]
	str r0, [r1, #0x34]
	bl GetPermanentFlagBits
	ldr r1, [r4]
	str r0, [r1, #0x38]
	bl sub_807A100
	ldr r1, [r4]
	str r0, [r1, #0x3c]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080A2BB8: .4byte ReadSramFast
_080A2BBC: .4byte gBuf
_080A2BC0: .4byte gExtraMapInfo
_080A2BC4: .4byte gPlaySt
_080A2BC8: .4byte gBmSt
_080A2BCC: .4byte gActiveUnit
_080A2BD0: .4byte gUnitLut
_080A2BD4: .4byte gBattleActor
_080A2BD8: .4byte gBattleTarget
_080A2BDC: .4byte gBattleHitArray

	thumb_func_start sub_80A2BE0
sub_80A2BE0: @ 0x080A2BE0
	movs r1, #0
	strb r1, [r0]
	movs r0, #1
	bx lr

	thumb_func_start sub_80A2BE8
sub_80A2BE8: @ 0x080A2BE8
	push {lr}
	bl sub_8031B1C
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_80A2BF4
sub_80A2BF4: @ 0x080A2BF4
	movs r0, #0
	bx lr

	thumb_func_start sub_80A2BF8
sub_80A2BF8: @ 0x080A2BF8
	movs r0, #0
	bx lr

	thumb_func_start sub_80A2BFC
sub_80A2BFC: @ 0x080A2BFC
	push {lr}
	bl GetGlobalCompletionCount
	ldr r1, _080A2C0C @ =gBmMapHidden
	movs r0, #0
	str r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_080A2C0C: .4byte gBmMapHidden

	thumb_func_start sub_80A2C10
sub_80A2C10: @ 0x080A2C10
	push {r4, r5, lr}
	bl GetGameTime
	ldr r4, _080A2C58 @ =gPlaySt
	ldr r1, [r4, #4]
	subs r0, r0, r1
	movs r1, #0xb4
	bl __udivsi3
	adds r3, r0, #0
	ldr r0, _080A2C5C @ =0x0000EA60
	cmp r3, r0
	ble _080A2C2C
	adds r3, r0, #0
_080A2C2C:
	ldr r0, _080A2C60 @ =0x0203EE44
	movs r2, #0x7f
	ldrb r1, [r4, #0xe]
	ands r2, r1
	movs r1, #0x80
	rsbs r1, r1, #0
	ldrb r5, [r0]
	ands r1, r5
	orrs r1, r2
	strb r1, [r0]
	ldrh r4, [r4, #0x10]
	lsls r2, r4, #7
	movs r1, #0x7f
	ldrh r4, [r0]
	ands r1, r4
	orrs r1, r2
	strh r1, [r0]
	strh r3, [r0, #2]
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_080A2C58: .4byte gPlaySt
_080A2C5C: .4byte 0x0000EA60
_080A2C60: .4byte 0x0203EE44

	thumb_func_start sub_80A2C64
sub_80A2C64: @ 0x080A2C64
	push {r4, r5, lr}
	adds r4, r0, #0
	movs r2, #0
	ldr r0, _080A2CB4 @ =gBmMapTerrain
	ldr r0, [r0]
	lsls r1, r1, #2
	adds r1, r1, r0
	ldr r0, [r1]
	adds r5, r0, r4
	ldrb r3, [r5]
	ldr r0, [r1, #4]
	adds r0, r0, r4
	ldrb r0, [r0]
	cmp r0, r3
	bne _080A2C84
	movs r2, #1
_080A2C84:
	lsls r2, r2, #1
	subs r0, r1, #4
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r0, [r0]
	cmp r0, r3
	bne _080A2C94
	adds r2, #1
_080A2C94:
	lsls r2, r2, #1
	ldrb r0, [r5, #1]
	cmp r0, r3
	bne _080A2C9E
	adds r2, #1
_080A2C9E:
	lsls r2, r2, #1
	subs r0, r5, #1
	ldrb r0, [r0]
	cmp r0, r3
	bne _080A2CAA
	adds r2, #1
_080A2CAA:
	adds r0, r2, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_080A2CB4: .4byte gBmMapTerrain

	thumb_func_start sub_80A2CB8
sub_80A2CB8: @ 0x080A2CB8
	cmp r0, #0x36
	beq _080A2CCA
	cmp r0, #0x36
	bgt _080A2CC6
	cmp r0, #0
	beq _080A2CCA
	b _080A2CCC
_080A2CC6:
	cmp r0, #0x3d
	bne _080A2CCC
_080A2CCA:
	movs r0, #0x15
_080A2CCC:
	bx lr
	.align 2, 0

	thumb_func_start sub_80A2CD0
sub_80A2CD0: @ 0x080A2CD0
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r6, r0, #0
	movs r4, #0
	ldr r0, _080A2D60 @ =gBmMapTerrain
	mov r8, r0
	ldr r0, [r0]
	lsls r5, r1, #2
	adds r0, r5, r0
	ldr r0, [r0]
	adds r0, r0, r6
	ldrb r0, [r0]
	bl sub_80A2CB8
	adds r7, r0, #0
	mov r1, r8
	ldr r0, [r1]
	adds r0, r5, r0
	ldr r0, [r0, #4]
	adds r0, r0, r6
	ldrb r0, [r0]
	bl sub_80A2CB8
	cmp r0, r7
	bne _080A2D06
	movs r4, #1
_080A2D06:
	lsls r4, r4, #1
	mov r2, r8
	ldr r0, [r2]
	adds r0, r5, r0
	subs r0, #4
	ldr r0, [r0]
	adds r0, r0, r6
	ldrb r0, [r0]
	bl sub_80A2CB8
	cmp r0, r7
	bne _080A2D20
	adds r4, #1
_080A2D20:
	lsls r4, r4, #1
	mov r1, r8
	ldr r0, [r1]
	adds r0, r5, r0
	ldr r0, [r0]
	adds r0, r6, r0
	ldrb r0, [r0, #1]
	bl sub_80A2CB8
	cmp r0, r7
	bne _080A2D38
	adds r4, #1
_080A2D38:
	lsls r4, r4, #1
	mov r2, r8
	ldr r0, [r2]
	adds r0, r5, r0
	ldr r0, [r0]
	adds r0, r6, r0
	subs r0, #1
	ldrb r0, [r0]
	bl sub_80A2CB8
	cmp r0, r7
	bne _080A2D52
	adds r4, #1
_080A2D52:
	adds r0, r4, #0
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_080A2D60: .4byte gBmMapTerrain

	thumb_func_start sub_80A2D64
sub_80A2D64: @ 0x080A2D64
	cmp r0, #0x17
	beq _080A2D7A
	cmp r0, #0x17
	bgt _080A2D72
	cmp r0, #0
	beq _080A2D7A
	b _080A2D7C
_080A2D72:
	cmp r0, #0x1a
	beq _080A2D7A
	cmp r0, #0x3f
	bne _080A2D7C
_080A2D7A:
	movs r0, #0x3c
_080A2D7C:
	bx lr
	.align 2, 0

	thumb_func_start sub_80A2D80
sub_80A2D80: @ 0x080A2D80
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r6, r0, #0
	movs r4, #0
	ldr r0, _080A2E10 @ =gBmMapTerrain
	mov r8, r0
	ldr r0, [r0]
	lsls r5, r1, #2
	adds r0, r5, r0
	ldr r0, [r0]
	adds r0, r0, r6
	ldrb r0, [r0]
	bl sub_80A2D64
	adds r7, r0, #0
	mov r1, r8
	ldr r0, [r1]
	adds r0, r5, r0
	ldr r0, [r0, #4]
	adds r0, r0, r6
	ldrb r0, [r0]
	bl sub_80A2D64
	cmp r0, r7
	bne _080A2DB6
	movs r4, #1
_080A2DB6:
	lsls r4, r4, #1
	mov r2, r8
	ldr r0, [r2]
	adds r0, r5, r0
	subs r0, #4
	ldr r0, [r0]
	adds r0, r0, r6
	ldrb r0, [r0]
	bl sub_80A2D64
	cmp r0, r7
	bne _080A2DD0
	adds r4, #1
_080A2DD0:
	lsls r4, r4, #1
	mov r1, r8
	ldr r0, [r1]
	adds r0, r5, r0
	ldr r0, [r0]
	adds r0, r6, r0
	ldrb r0, [r0, #1]
	bl sub_80A2D64
	cmp r0, r7
	bne _080A2DE8
	adds r4, #1
_080A2DE8:
	lsls r4, r4, #1
	mov r2, r8
	ldr r0, [r2]
	adds r0, r5, r0
	ldr r0, [r0]
	adds r0, r6, r0
	subs r0, #1
	ldrb r0, [r0]
	bl sub_80A2D64
	cmp r0, r7
	bne _080A2E02
	adds r4, #1
_080A2E02:
	adds r0, r4, #0
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_080A2E10: .4byte gBmMapTerrain

	thumb_func_start sub_80A2E14
sub_80A2E14: @ 0x080A2E14
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	movs r3, #0
	ldr r2, _080A2EB4 @ =gBmMapTerrain
	ldr r1, [r2]
	lsls r0, r5, #2
	adds r0, r0, r1
	ldr r0, [r0, #4]
	adds r0, r0, r4
	ldrb r0, [r0]
	cmp r0, #0x10
	beq _080A2E3E
	cmp r0, #0x15
	beq _080A2E3E
	cmp r0, #0x36
	beq _080A2E3E
	cmp r0, #0x16
	beq _080A2E3E
	cmp r0, #0x13
	bne _080A2E40
_080A2E3E:
	adds r3, #1
_080A2E40:
	lsls r3, r3, #1
	ldr r0, [r2]
	lsls r1, r5, #2
	adds r0, r1, r0
	subs r0, #4
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r0, [r0]
	cmp r0, #0x10
	beq _080A2E64
	cmp r0, #0x15
	beq _080A2E64
	cmp r0, #0x36
	beq _080A2E64
	cmp r0, #0x16
	beq _080A2E64
	cmp r0, #0x13
	bne _080A2E66
_080A2E64:
	adds r3, #1
_080A2E66:
	lsls r3, r3, #1
	ldr r0, [r2]
	adds r0, r1, r0
	ldr r0, [r0]
	adds r0, r4, r0
	ldrb r0, [r0, #1]
	cmp r0, #0x10
	beq _080A2E86
	cmp r0, #0x15
	beq _080A2E86
	cmp r0, #0x36
	beq _080A2E86
	cmp r0, #0x16
	beq _080A2E86
	cmp r0, #0x13
	bne _080A2E88
_080A2E86:
	adds r3, #1
_080A2E88:
	lsls r3, r3, #1
	ldr r0, [r2]
	adds r0, r1, r0
	ldr r0, [r0]
	adds r0, r4, r0
	subs r0, #1
	ldrb r0, [r0]
	cmp r0, #0x10
	beq _080A2EAA
	cmp r0, #0x15
	beq _080A2EAA
	cmp r0, #0x36
	beq _080A2EAA
	cmp r0, #0x16
	beq _080A2EAA
	cmp r0, #0x13
	bne _080A2EAC
_080A2EAA:
	adds r3, #1
_080A2EAC:
	adds r0, r3, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_080A2EB4: .4byte gBmMapTerrain

	thumb_func_start sub_80A2EB8
sub_80A2EB8: @ 0x080A2EB8
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	ldr r0, _080A2EF0 @ =gBmMapTerrain
	ldr r0, [r0]
	lsls r1, r1, #2
	adds r1, r1, r0
	ldr r0, [r1]
	adds r2, r0, r4
	ldrb r3, [r2]
	subs r0, r2, #1
	ldrb r6, [r0]
	cmp r6, r3
	beq _080A2ED8
	ldrb r5, [r2, #1]
	cmp r5, r3
	bne _080A2F12
_080A2ED8:
	subs r0, r1, #4
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r2, [r0]
	cmp r2, #0x15
	beq _080A2EEC
	cmp r2, #0x36
	beq _080A2EEC
	cmp r2, #0x16
	bne _080A2EF4
_080A2EEC:
	movs r0, #4
	b _080A2FD8
	.align 2, 0
_080A2EF0: .4byte gBmMapTerrain
_080A2EF4:
	ldr r0, [r1, #4]
	adds r0, r0, r4
	ldrb r0, [r0]
	cmp r0, #0x15
	beq _080A2F06
	cmp r0, #0x36
	beq _080A2F06
	cmp r0, #0x16
	bne _080A2F0A
_080A2F06:
	movs r0, #0
	b _080A2FD8
_080A2F0A:
	cmp r2, #0xf
	bne _080A2FD6
	movs r0, #0xc
	b _080A2FD8
_080A2F12:
	subs r0, r1, #4
	ldr r0, [r0]
	adds r2, r0, r4
	ldrb r0, [r2]
	cmp r0, r3
	beq _080A2F28
	ldr r0, [r1, #4]
	adds r1, r0, r4
	ldrb r0, [r1]
	cmp r0, r3
	bne _080A2F58
_080A2F28:
	adds r0, r5, #0
	cmp r0, #0x15
	beq _080A2F36
	cmp r0, #0x36
	beq _080A2F36
	cmp r0, #0x16
	bne _080A2F3A
_080A2F36:
	movs r0, #2
	b _080A2FD8
_080A2F3A:
	adds r1, r6, #0
	cmp r1, #0x15
	beq _080A2F48
	cmp r1, #0x36
	beq _080A2F48
	cmp r1, #0x16
	bne _080A2F4C
_080A2F48:
	movs r0, #6
	b _080A2FD8
_080A2F4C:
	cmp r0, #0xf
	bne _080A2F54
	movs r0, #0xd
	b _080A2FD8
_080A2F54:
	movs r0, #9
	b _080A2FD8
_080A2F58:
	subs r0, r1, #1
	ldrb r5, [r0]
	cmp r5, r3
	beq _080A2F66
	ldrb r4, [r2, #1]
	cmp r4, r3
	bne _080A2F98
_080A2F66:
	subs r0, r2, #1
	ldrb r2, [r0]
	cmp r2, #0x15
	beq _080A2F76
	cmp r2, #0x36
	beq _080A2F76
	cmp r2, #0x16
	bne _080A2F7A
_080A2F76:
	movs r0, #5
	b _080A2FD8
_080A2F7A:
	ldrb r0, [r1, #1]
	cmp r0, #0x15
	beq _080A2F88
	cmp r0, #0x36
	beq _080A2F88
	cmp r0, #0x16
	bne _080A2F8C
_080A2F88:
	movs r0, #1
	b _080A2FD8
_080A2F8C:
	cmp r2, #0xf
	bne _080A2F94
	movs r0, #0xe
	b _080A2FD8
_080A2F94:
	movs r0, #0xa
	b _080A2FD8
_080A2F98:
	ldrb r1, [r1, #1]
	cmp r1, r3
	beq _080A2FA6
	subs r0, r2, #1
	ldrb r0, [r0]
	cmp r0, r3
	bne _080A2FD6
_080A2FA6:
	adds r1, r4, #0
	cmp r1, #0x15
	beq _080A2FB4
	cmp r1, #0x36
	beq _080A2FB4
	cmp r1, #0x16
	bne _080A2FB8
_080A2FB4:
	movs r0, #3
	b _080A2FD8
_080A2FB8:
	adds r0, r5, #0
	cmp r0, #0x15
	beq _080A2FC6
	cmp r0, #0x36
	beq _080A2FC6
	cmp r0, #0x16
	bne _080A2FCA
_080A2FC6:
	movs r0, #7
	b _080A2FD8
_080A2FCA:
	cmp r1, #0xf
	bne _080A2FD2
	movs r0, #0xf
	b _080A2FD8
_080A2FD2:
	movs r0, #0xb
	b _080A2FD8
_080A2FD6:
	movs r0, #8
_080A2FD8:
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_80A2FE0
sub_80A2FE0: @ 0x080A2FE0
	adds r2, r0, #0
	ldr r0, _080A3018 @ =gBmMapTerrain
	ldr r0, [r0]
	lsls r1, r1, #2
	adds r1, r1, r0
	subs r0, r1, #4
	ldr r0, [r0]
	adds r0, r0, r2
	ldrb r0, [r0]
	cmp r0, #0x2d
	beq _080A3012
	ldr r0, [r1, #4]
	adds r0, r0, r2
	ldrb r0, [r0]
	cmp r0, #0x2d
	beq _080A3012
	ldr r0, [r1]
	adds r1, r2, r0
	subs r0, r1, #1
	ldrb r0, [r0]
	cmp r0, #0x2d
	beq _080A3012
	ldrb r1, [r1, #1]
	cmp r1, #0x2d
	bne _080A301C
_080A3012:
	movs r0, #0x12
	b _080A301E
	.align 2, 0
_080A3018: .4byte gBmMapTerrain
_080A301C:
	movs r0, #0x11
_080A301E:
	bx lr

	thumb_func_start sub_80A3020
sub_80A3020: @ 0x080A3020
	ldr r2, _080A3038 @ =gBmMapTerrain
	ldr r2, [r2]
	lsls r1, r1, #2
	adds r1, r1, r2
	ldr r1, [r1]
	adds r0, r0, r1
	ldrb r1, [r0, #1]
	cmp r1, #0x1e
	bne _080A303C
	movs r0, #0x16
	b _080A304A
	.align 2, 0
_080A3038: .4byte gBmMapTerrain
_080A303C:
	subs r0, #1
	ldrb r0, [r0]
	cmp r0, #0x1e
	beq _080A3048
	movs r0, #7
	b _080A304A
_080A3048:
	movs r0, #0x17
_080A304A:
	bx lr

	thumb_func_start sub_80A304C
sub_80A304C: @ 0x080A304C
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	ldr r7, _080A3094 @ =gBmMapTerrain
	ldr r0, [r7]
	lsls r6, r1, #2
	adds r2, r6, r0
	ldr r0, [r2]
	adds r0, r4, r0
	ldrb r1, [r0, #1]
	cmp r1, #0x13
	beq _080A3090
	subs r0, #1
	ldrb r3, [r0]
	cmp r3, #0x13
	beq _080A3090
	ldr r0, [r2, #4]
	adds r0, r0, r4
	ldrb r5, [r0]
	cmp r5, #0x13
	beq _080A30A0
	subs r0, r2, #4
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r0, [r0]
	cmp r0, #0x13
	beq _080A30A0
	cmp r1, #0x10
	beq _080A30A0
	cmp r3, #0x10
	beq _080A30A0
	cmp r5, #0x10
	beq _080A3090
	cmp r0, #0x10
	bne _080A3098
_080A3090:
	movs r0, #0x10
	b _080A30C0
	.align 2, 0
_080A3094: .4byte gBmMapTerrain
_080A3098:
	cmp r1, #0x16
	beq _080A30A0
	cmp r3, #0x16
	bne _080A30A4
_080A30A0:
	movs r0, #0x18
	b _080A30C0
_080A30A4:
	ldr r0, [r7]
	adds r1, r6, r0
	ldr r0, [r1, #4]
	adds r0, r0, r4
	ldrb r0, [r0]
	cmp r0, #0x16
	beq _080A30BE
	subs r0, r1, #4
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r0, [r0]
	cmp r0, #0x16
	bne _080A30C0
_080A30BE:
	movs r0, #0x10
_080A30C0:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_80A30C8
sub_80A30C8: @ 0x080A30C8
	push {lr}
	adds r2, r0, #0
	adds r3, r1, #0
	ldr r0, _080A30EC @ =gBmMapTerrain
	ldr r1, [r0]
	lsls r0, r3, #2
	adds r0, r0, r1
	ldr r0, [r0]
	adds r0, r0, r2
	ldrb r0, [r0]
	cmp r0, #0x40
	bls _080A30E2
	b _080A32AE
_080A30E2:
	lsls r0, r0, #2
	ldr r1, _080A30F0 @ =_080A30F4
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080A30EC: .4byte gBmMapTerrain
_080A30F0: .4byte _080A30F4
_080A30F4: @ jump table
	.4byte _080A32AE @ case 0
	.4byte _080A31F8 @ case 1
	.4byte _080A31FC @ case 2
	.4byte _080A3208 @ case 3
	.4byte _080A3208 @ case 4
	.4byte _080A3208 @ case 5
	.4byte _080A320C @ case 6
	.4byte _080A320C @ case 7
	.4byte _080A3210 @ case 8
	.4byte _080A32AE @ case 9
	.4byte _080A3214 @ case 10
	.4byte _080A3218 @ case 11
	.4byte _080A321C @ case 12
	.4byte _080A3220 @ case 13
	.4byte _080A3224 @ case 14
	.4byte _080A3224 @ case 15
	.4byte _080A3228 @ case 16
	.4byte _080A3234 @ case 17
	.4byte _080A3238 @ case 18
	.4byte _080A323C @ case 19
	.4byte _080A32AE @ case 20
	.4byte _080A3252 @ case 21
	.4byte _080A3252 @ case 22
	.4byte _080A325E @ case 23
	.4byte _080A325E @ case 24
	.4byte _080A329E @ case 25
	.4byte _080A329E @ case 26
	.4byte _080A329E @ case 27
	.4byte _080A329E @ case 28
	.4byte _080A3262 @ case 29
	.4byte _080A3266 @ case 30
	.4byte _080A3270 @ case 31
	.4byte _080A3274 @ case 32
	.4byte _080A3274 @ case 33
	.4byte _080A329E @ case 34
	.4byte _080A32AE @ case 35
	.4byte _080A32AE @ case 36
	.4byte _080A3278 @ case 37
	.4byte _080A3280 @ case 38
	.4byte _080A328C @ case 39
	.4byte _080A328C @ case 40
	.4byte _080A328C @ case 41
	.4byte _080A3290 @ case 42
	.4byte _080A329E @ case 43
	.4byte _080A329E @ case 44
	.4byte _080A3294 @ case 45
	.4byte _080A329E @ case 46
	.4byte _080A3252 @ case 47
	.4byte _080A32AE @ case 48
	.4byte _080A32AA @ case 49
	.4byte _080A32AE @ case 50
	.4byte _080A321C @ case 51
	.4byte _080A323C @ case 52
	.4byte _080A3252 @ case 53
	.4byte _080A3252 @ case 54
	.4byte _080A3218 @ case 55
	.4byte _080A3208 @ case 56
	.4byte _080A329E @ case 57
	.4byte _080A3280 @ case 58
	.4byte _080A327C @ case 59
	.4byte _080A3246 @ case 60
	.4byte _080A329E @ case 61
	.4byte _080A325E @ case 62
	.4byte _080A329E @ case 63
	.4byte _080A329E @ case 64
_080A31F8:
	movs r0, #1
	b _080A32B0
_080A31FC:
	adds r0, r2, #0
	adds r1, r3, #0
	bl sub_80A2C64
	adds r0, #0x40
	b _080A32B0
_080A3208:
	movs r0, #2
	b _080A32B0
_080A320C:
	movs r0, #3
	b _080A32B0
_080A3210:
	movs r0, #4
	b _080A32B0
_080A3214:
	movs r0, #5
	b _080A32B0
_080A3218:
	movs r0, #6
	b _080A32B0
_080A321C:
	movs r0, #8
	b _080A32B0
_080A3220:
	movs r0, #9
	b _080A32B0
_080A3224:
	movs r0, #0xa
	b _080A32B0
_080A3228:
	adds r0, r2, #0
	adds r1, r3, #0
	bl sub_80A2E14
	adds r0, #0x60
	b _080A32B0
_080A3234:
	movs r0, #0xb
	b _080A32B0
_080A3238:
	movs r0, #0x14
	b _080A32B0
_080A323C:
	adds r0, r2, #0
	adds r1, r3, #0
	bl sub_80A304C
	b _080A32B0
_080A3246:
	adds r0, r2, #0
	adds r1, r3, #0
	bl sub_80A2D80
	adds r0, #0x30
	b _080A32B0
_080A3252:
	adds r0, r2, #0
	adds r1, r3, #0
	bl sub_80A2CD0
	adds r0, #0x30
	b _080A32B0
_080A325E:
	movs r0, #0xc
	b _080A32B0
_080A3262:
	movs r0, #0xd
	b _080A32B0
_080A3266:
	adds r0, r2, #0
	adds r1, r3, #0
	bl sub_80A3020
	b _080A32B0
_080A3270:
	movs r0, #0xe
	b _080A32B0
_080A3274:
	movs r0, #0xf
	b _080A32B0
_080A3278:
	movs r0, #0x1a
	b _080A32B0
_080A327C:
	movs r0, #0x1b
	b _080A32B0
_080A3280:
	adds r0, r2, #0
	adds r1, r3, #0
	bl sub_80A2EB8
	adds r0, #0x50
	b _080A32B0
_080A328C:
	movs r0, #0x13
	b _080A32B0
_080A3290:
	movs r0, #0x3a
	b _080A32B0
_080A3294:
	adds r0, r2, #0
	adds r1, r3, #0
	bl sub_80A2FE0
	b _080A32B0
_080A329E:
	adds r0, r2, #0
	adds r1, r3, #0
	bl sub_80A2C64
	adds r0, #0x20
	b _080A32B0
_080A32AA:
	movs r0, #0x19
	b _080A32B0
_080A32AE:
	movs r0, #0
_080A32B0:
	pop {r1}
	bx r1

	thumb_func_start sub_80A32B4
sub_80A32B4: @ 0x080A32B4
	push {lr}
	bl sub_80A30C8
	lsls r0, r0, #5
	ldr r1, _080A32C4 @ =gBuf
	adds r0, r0, r1
	pop {r1}
	bx r1
	.align 2, 0
_080A32C4: .4byte gBuf

	thumb_func_start sub_80A32C8
sub_80A32C8: @ 0x080A32C8
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	adds r4, r1, #0
	ldr r1, _080A32FC @ =gUnk_0842D7B0
	mov r0, sp
	movs r2, #3
	bl memcpy
	ldr r0, _080A3300 @ =gBmMapUnit
	ldr r0, [r0]
	lsls r4, r4, #2
	adds r4, r4, r0
	ldr r0, [r4]
	adds r0, r0, r5
	ldrb r0, [r0]
	cmp r0, #0
	beq _080A3308
	asrs r0, r0, #6
	add r0, sp
	ldrb r0, [r0]
	lsls r0, r0, #5
	ldr r1, _080A3304 @ =gBuf
	adds r0, r0, r1
	b _080A330A
	.align 2, 0
_080A32FC: .4byte gUnk_0842D7B0
_080A3300: .4byte gBmMapUnit
_080A3304: .4byte gBuf
_080A3308:
	ldr r0, _080A3314 @ =gBuf
_080A330A:
	add sp, #4
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_080A3314: .4byte gBuf

	thumb_func_start sub_80A3318
sub_80A3318: @ 0x080A3318
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x10
	adds r4, r0, #0
	str r1, [sp]
	cmp r4, #0
	bne _080A332E
	ldr r4, _080A3340 @ =0x06000020
_080A332E:
	lsls r0, r4, #0xf
	lsrs r7, r0, #0x14
	ldr r0, [sp]
	cmp r0, #0
	bge _080A333C
	movs r1, #3
	str r1, [sp]
_080A333C:
	movs r2, #0
	b _080A3512
	.align 2, 0
_080A3340: .4byte 0x06000020
_080A3344:
	movs r6, #0
	movs r2, #0
	ldrsh r0, [r1, r2]
	mov r3, r8
	adds r3, #2
	str r3, [sp, #0xc]
	cmp r6, r0
	blt _080A3356
	b _080A3510
_080A3356:
	movs r0, #1
	add r0, r8
	mov sb, r0
	mov r1, r8
	lsrs r0, r1, #0x1f
	add r0, r8
	asrs r0, r0, #1
	lsls r0, r0, #5
	str r0, [sp, #4]
	movs r2, #1
	mov sl, r2
_080A336C:
	adds r0, r6, #0
	mov r1, r8
	bl sub_80A32B4
	adds r5, r0, #0
	mov r0, sl
	mov r1, r8
	bl sub_80A32B4
	adds r1, r0, #0
	ldrh r0, [r5]
	strh r0, [r4]
	adds r4, #2
	adds r5, #4
	ldrh r0, [r1]
	strh r0, [r4]
	adds r4, #2
	adds r1, #4
	ldrh r0, [r5]
	strh r0, [r4]
	adds r4, #2
	adds r5, #4
	ldrh r0, [r1]
	strh r0, [r4]
	adds r4, #2
	adds r1, #4
	ldrh r0, [r5]
	strh r0, [r4]
	adds r4, #2
	ldrh r0, [r1]
	strh r0, [r4]
	adds r4, #2
	ldrh r0, [r5, #4]
	strh r0, [r4]
	adds r4, #2
	ldrh r0, [r1, #4]
	strh r0, [r4]
	adds r4, #2
	adds r0, r6, #0
	mov r1, sb
	bl sub_80A32B4
	adds r5, r0, #0
	mov r0, sl
	mov r1, sb
	bl sub_80A32B4
	adds r1, r0, #0
	ldrh r0, [r5]
	strh r0, [r4]
	adds r4, #2
	adds r5, #4
	ldrh r0, [r1]
	strh r0, [r4]
	adds r4, #2
	adds r1, #4
	ldrh r0, [r5]
	strh r0, [r4]
	adds r4, #2
	adds r5, #4
	ldrh r0, [r1]
	strh r0, [r4]
	adds r4, #2
	adds r1, #4
	ldrh r0, [r5]
	strh r0, [r4]
	adds r4, #2
	ldrh r0, [r1]
	strh r0, [r4]
	adds r4, #2
	ldrh r0, [r5, #4]
	strh r0, [r4]
	adds r4, #2
	ldrh r0, [r1, #4]
	strh r0, [r4]
	adds r4, #2
	ldr r0, _080A3530 @ =gBg1Tm
	asrs r2, r6, #0x1f
	subs r1, r6, r2
	asrs r1, r1, #1
	ldr r3, [sp, #4]
	adds r1, r3, r1
	lsls r1, r1, #1
	adds r1, r1, r0
	ldr r3, [sp]
	lsls r0, r3, #0xc
	adds r0, r7, r0
	strh r0, [r1]
	adds r7, #1
	ldr r0, _080A3534 @ =gBmMapUnit
	ldr r1, [r0]
	mov r3, r8
	lsls r0, r3, #2
	adds r3, r0, r1
	ldr r0, [r3]
	adds r1, r0, r6
	ldrb r0, [r1]
	str r2, [sp, #8]
	cmp r0, #0
	bne _080A344A
	ldrb r0, [r1, #1]
	cmp r0, #0
	bne _080A344A
	ldr r0, [r3, #4]
	adds r1, r0, r6
	ldrb r0, [r1]
	cmp r0, #0
	bne _080A344A
	ldrb r0, [r1, #1]
	cmp r0, #0
	beq _080A34FE
_080A344A:
	adds r0, r6, #0
	mov r1, r8
	bl sub_80A32C8
	adds r5, r0, #0
	mov r0, sl
	mov r1, r8
	bl sub_80A32C8
	adds r1, r0, #0
	ldrh r0, [r5]
	strh r0, [r4]
	adds r4, #2
	adds r5, #4
	ldrh r0, [r1]
	strh r0, [r4]
	adds r4, #2
	adds r1, #4
	ldrh r0, [r5]
	strh r0, [r4]
	adds r4, #2
	adds r5, #4
	ldrh r0, [r1]
	strh r0, [r4]
	adds r4, #2
	adds r1, #4
	ldrh r0, [r5]
	strh r0, [r4]
	adds r4, #2
	ldrh r0, [r1]
	strh r0, [r4]
	adds r4, #2
	ldrh r0, [r5, #4]
	strh r0, [r4]
	adds r4, #2
	ldrh r0, [r1, #4]
	strh r0, [r4]
	adds r4, #2
	adds r0, r6, #0
	mov r1, sb
	bl sub_80A32C8
	adds r5, r0, #0
	mov r0, sl
	mov r1, sb
	bl sub_80A32C8
	adds r1, r0, #0
	ldrh r0, [r5]
	strh r0, [r4]
	adds r4, #2
	adds r5, #4
	ldrh r0, [r1]
	strh r0, [r4]
	adds r4, #2
	adds r1, #4
	ldrh r0, [r5]
	strh r0, [r4]
	adds r4, #2
	adds r5, #4
	ldrh r0, [r1]
	strh r0, [r4]
	adds r4, #2
	adds r1, #4
	ldrh r0, [r5]
	strh r0, [r4]
	adds r4, #2
	ldrh r0, [r1]
	strh r0, [r4]
	adds r4, #2
	ldrh r0, [r5, #4]
	strh r0, [r4]
	adds r4, #2
	ldrh r0, [r1, #4]
	strh r0, [r4]
	adds r4, #2
	ldr r0, _080A3538 @ =gBg0Tm
	ldr r2, [sp, #8]
	subs r1, r6, r2
	asrs r1, r1, #1
	ldr r3, [sp, #4]
	adds r1, r3, r1
	lsls r1, r1, #1
	adds r1, r1, r0
	ldr r0, [sp]
	adds r0, #1
	lsls r0, r0, #0xc
	adds r0, r7, r0
	strh r0, [r1]
	adds r7, #1
_080A34FE:
	movs r0, #2
	add sl, r0
	adds r6, #2
	ldr r0, _080A353C @ =gBmMapSize
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r6, r0
	bge _080A3510
	b _080A336C
_080A3510:
	ldr r2, [sp, #0xc]
_080A3512:
	mov r8, r2
	ldr r1, _080A353C @ =gBmMapSize
	movs r3, #2
	ldrsh r0, [r1, r3]
	cmp r8, r0
	bge _080A3520
	b _080A3344
_080A3520:
	add sp, #0x10
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A3530: .4byte gBg1Tm
_080A3534: .4byte gBmMapUnit
_080A3538: .4byte gBg0Tm
_080A353C: .4byte gBmMapSize

	thumb_func_start sub_80A3540
sub_80A3540: @ 0x080A3540
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _080A357C @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080A3558
	movs r0, #0xe6
	lsls r0, r0, #2
	bl m4aSongNumStart
_080A3558:
	adds r0, r4, #0
	bl sub_80A3DBC
	movs r4, #1
	rsbs r4, r4, #0
	adds r0, r4, #0
	bl sub_80A3AE0
	movs r0, #0
	adds r1, r4, #0
	bl sub_80A3318
	movs r0, #3
	bl EnableBgSync
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A357C: .4byte gPlaySt

	thumb_func_start sub_80A3580
sub_80A3580: @ 0x080A3580
	ldr r0, _080A35AC @ =0x04000006
	ldrh r0, [r0]
	adds r0, #1
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	ldr r3, _080A35B0 @ =0x02000508
	cmp r1, #0xa0
	bls _080A3598
	ldr r0, _080A35B4 @ =0x02000500
	ldr r0, [r0]
	str r0, [r3]
	movs r1, #0
_080A3598:
	ldr r2, _080A35B8 @ =0x04000040
	ldr r0, [r3]
	lsls r1, r1, #2
	adds r1, r1, r0
	ldrh r3, [r1]
	lsls r0, r3, #8
	ldrh r1, [r1, #2]
	adds r0, r1, r0
	strh r0, [r2]
	bx lr
	.align 2, 0
_080A35AC: .4byte 0x04000006
_080A35B0: .4byte 0x02000508
_080A35B4: .4byte 0x02000500
_080A35B8: .4byte 0x04000040

	thumb_func_start sub_80A35BC
sub_80A35BC: @ 0x080A35BC
	ldr r2, _080A35CC @ =0x02000500
	ldr r3, [r2]
	ldr r1, _080A35D0 @ =0x02000504
	ldr r0, [r1]
	str r0, [r2]
	str r3, [r1]
	bx lr
	.align 2, 0
_080A35CC: .4byte 0x02000500
_080A35D0: .4byte 0x02000504

	thumb_func_start sub_80A35D4
sub_80A35D4: @ 0x080A35D4
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	ldr r1, _080A36D4 @ =0x02000500
	ldr r2, _080A36D8 @ =0x02000280
	str r2, [r1]
	ldr r3, _080A36DC @ =0x02000504
	ldr r4, _080A36E0 @ =0xFFFFFD80
	adds r1, r2, r4
	str r1, [r3]
	ldr r1, _080A36E4 @ =0x02000508
	str r2, [r1]
	ldr r7, _080A36E8 @ =gDispIo
	mov ip, r7
	movs r1, #0x20
	mov r8, r1
	mov r1, r8
	mov r2, ip
	ldrb r2, [r2, #1]
	orrs r1, r2
	movs r2, #0x41
	rsbs r2, r2, #0
	ands r1, r2
	movs r2, #0x7f
	ands r1, r2
	mov r3, ip
	strb r1, [r3, #1]
	movs r4, #0x34
	add r4, ip
	mov sb, r4
	movs r4, #1
	mov r7, sb
	ldrb r7, [r7]
	orrs r4, r7
	movs r1, #2
	orrs r4, r1
	movs r6, #4
	orrs r4, r6
	movs r5, #8
	orrs r4, r5
	movs r2, #0x10
	orrs r4, r2
	movs r1, #0x36
	add r1, ip
	mov sl, r1
	movs r3, #2
	rsbs r3, r3, #0
	ldrb r7, [r1]
	ands r3, r7
	movs r1, #3
	rsbs r1, r1, #0
	ands r3, r1
	orrs r3, r6
	orrs r3, r5
	orrs r3, r2
	mov r2, ip
	adds r2, #0x2d
	movs r5, #0
	movs r1, #0xf0
	strb r1, [r2]
	mov r1, ip
	adds r1, #0x31
	strb r5, [r1]
	subs r1, #5
	strb r5, [r1]
	adds r2, #3
	movs r1, #0xa0
	strb r1, [r2]
	mov r6, ip
	adds r6, #0x3c
	ldr r1, _080A36EC @ =0x0000FFE0
	mov r2, ip
	ldrh r2, [r2, #0x3c]
	ands r1, r2
	movs r2, #0xc
	orrs r1, r2
	ldr r2, _080A36F0 @ =0x0000E0FF
	ands r1, r2
	movs r7, #0xf8
	lsls r7, r7, #5
	adds r2, r7, #0
	orrs r1, r2
	mov r2, ip
	strh r1, [r2, #0x3c]
	adds r2, #0x3d
	mov r1, r8
	ldrb r7, [r2]
	orrs r1, r7
	strb r1, [r2]
	movs r1, #0xc0
	ldrb r2, [r6]
	orrs r1, r2
	strb r1, [r6]
	mov r2, ip
	adds r2, #0x44
	movs r1, #0x10
	strb r1, [r2]
	mov r1, ip
	adds r1, #0x45
	strb r5, [r1]
	adds r1, #1
	strb r5, [r1]
	mov r7, r8
	orrs r4, r7
	mov r1, sb
	strb r4, [r1]
	subs r2, #0xf
	mov r1, r8
	ldrb r4, [r2]
	orrs r1, r4
	strb r1, [r2]
	orrs r3, r7
	mov r1, sl
	strb r3, [r1]
	adds r0, #0x4c
	strh r5, [r0]
	ldr r0, _080A36F4 @ =sub_80A3580
	bl SetOnHBlankA
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A36D4: .4byte 0x02000500
_080A36D8: .4byte 0x02000280
_080A36DC: .4byte 0x02000504
_080A36E0: .4byte 0xFFFFFD80
_080A36E4: .4byte 0x02000508
_080A36E8: .4byte gDispIo
_080A36EC: .4byte 0x0000FFE0
_080A36F0: .4byte 0x0000E0FF
_080A36F4: .4byte sub_80A3580

	thumb_func_start sub_80A36F8
sub_80A36F8: @ 0x080A36F8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x1c
	str r0, [sp, #0x14]
	ldr r2, _080A3898 @ =gDispIo
	adds r1, r2, #0
	adds r1, #0x3c
	movs r0, #0xc0
	ldrb r3, [r1]
	orrs r0, r3
	strb r0, [r1]
	adds r0, r2, #0
	adds r0, #0x44
	movs r1, #0
	movs r4, #0x10
	strb r4, [r0]
	adds r0, #1
	strb r1, [r0]
	ldr r6, [sp, #0x14]
	adds r6, #0x4c
	movs r5, #0
	ldrsh r1, [r6, r5]
	cmp r1, #0
	bge _080A3730
	adds r1, #3
_080A3730:
	asrs r1, r1, #2
	adds r0, r2, #0
	adds r0, #0x46
	strb r1, [r0]
	movs r2, #0x80
	lsls r2, r2, #1
	movs r0, #0
	ldrsh r3, [r6, r0]
	str r4, [sp]
	movs r0, #5
	movs r1, #0
	bl Interpolate
	adds r7, r0, #0
	adds r1, r7, #0
	cmp r7, #0
	bge _080A3754
	adds r1, r7, #3
_080A3754:
	asrs r1, r1, #2
	subs r1, #0x40
	add r0, sp, #4
	ldr r3, [sp, #0x14]
	ldr r2, [r3, #0x34]
	rsbs r5, r2, #0
	strh r5, [r0]
	ldr r4, [r3, #0x38]
	rsbs r3, r4, #0
	strh r3, [r0, #2]
	strh r2, [r0, #4]
	strh r3, [r0, #6]
	strh r2, [r0, #8]
	strh r4, [r0, #0xa]
	strh r5, [r0, #0xc]
	strh r4, [r0, #0xe]
	str r6, [sp, #0x18]
	ldr r4, _080A389C @ =0x02000504
	mov sl, r4
	ldr r2, _080A38A0 @ =gSinLut
	movs r0, #0xff
	ands r1, r0
	adds r0, r1, #0
	adds r0, #0x40
	lsls r0, r0, #1
	adds r0, r0, r2
	mov sb, r0
	lsls r1, r1, #1
	adds r1, r1, r2
	mov r8, r1
	add r6, sp, #4
	movs r5, #3
	mov ip, r5
_080A3796:
	mov r0, sb
	movs r1, #0
	ldrsh r5, [r0, r1]
	movs r2, #0
	ldrsh r4, [r6, r2]
	adds r2, r5, #0
	muls r2, r4, r2
	mov r3, r8
	movs r0, #0
	ldrsh r1, [r3, r0]
	movs r0, #2
	ldrsh r3, [r6, r0]
	adds r0, r1, #0
	muls r0, r3, r0
	subs r2, r2, r0
	muls r1, r4, r1
	adds r0, r5, #0
	muls r0, r3, r0
	adds r1, r1, r0
	adds r0, r2, #0
	muls r0, r7, r0
	asrs r0, r0, #0x14
	adds r0, #0x78
	strh r0, [r6]
	adds r0, r1, #0
	muls r0, r7, r0
	asrs r0, r0, #0x14
	adds r0, #0x50
	strh r0, [r6, #2]
	adds r6, #4
	movs r1, #1
	rsbs r1, r1, #0
	add ip, r1
	mov r2, ip
	cmp r2, #0
	bge _080A3796
	mov r3, sl
	ldr r0, [r3]
	bl sub_80138C8
	mov r4, sl
	ldr r0, [r4]
	add r1, sp, #4
	movs r5, #0
	ldrsh r1, [r1, r5]
	add r2, sp, #4
	movs r3, #2
	ldrsh r2, [r2, r3]
	add r3, sp, #4
	movs r4, #4
	ldrsh r3, [r3, r4]
	add r4, sp, #4
	movs r5, #6
	ldrsh r4, [r4, r5]
	str r4, [sp]
	bl sub_80138E8
	mov r1, sl
	ldr r0, [r1]
	add r1, sp, #4
	movs r2, #4
	ldrsh r1, [r1, r2]
	add r2, sp, #4
	movs r3, #6
	ldrsh r2, [r2, r3]
	add r3, sp, #4
	movs r4, #8
	ldrsh r3, [r3, r4]
	add r4, sp, #4
	movs r5, #0xa
	ldrsh r4, [r4, r5]
	str r4, [sp]
	bl sub_80138E8
	mov r1, sl
	ldr r0, [r1]
	add r1, sp, #4
	movs r2, #8
	ldrsh r1, [r1, r2]
	add r2, sp, #4
	movs r3, #0xa
	ldrsh r2, [r2, r3]
	add r3, sp, #4
	movs r4, #0xc
	ldrsh r3, [r3, r4]
	add r4, sp, #4
	movs r5, #0xe
	ldrsh r4, [r4, r5]
	str r4, [sp]
	bl sub_80138E8
	mov r1, sl
	ldr r0, [r1]
	add r1, sp, #4
	movs r2, #0xc
	ldrsh r1, [r1, r2]
	add r2, sp, #4
	movs r3, #0xe
	ldrsh r2, [r2, r3]
	add r3, sp, #4
	movs r4, #0
	ldrsh r3, [r3, r4]
	add r4, sp, #4
	movs r5, #2
	ldrsh r4, [r4, r5]
	str r4, [sp]
	bl sub_80138E8
	bl sub_80A35BC
	ldr r1, [sp, #0x18]
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x10
	ble _080A3888
	ldr r0, [sp, #0x14]
	bl Proc_Break
_080A3888:
	add sp, #0x1c
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A3898: .4byte gDispIo
_080A389C: .4byte 0x02000504
_080A38A0: .4byte gSinLut

	thumb_func_start sub_80A38A4
sub_80A38A4: @ 0x080A38A4
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r0, _080A3908 @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080A38BA
	ldr r0, _080A390C @ =0x00000399
	bl m4aSongNumStart
_080A38BA:
	ldr r2, _080A3910 @ =0x030027CC
	ldr r0, _080A3914 @ =0x0000FFE0
	ldrh r1, [r2]
	ands r0, r1
	movs r1, #0xc
	orrs r0, r1
	ldr r1, _080A3918 @ =0x0000E0FF
	ands r0, r1
	movs r3, #0xf8
	lsls r3, r3, #5
	adds r1, r3, #0
	orrs r0, r1
	strh r0, [r2]
	movs r0, #0xc0
	ldrb r5, [r2]
	orrs r0, r5
	strb r0, [r2]
	movs r3, #0
	movs r0, #0x10
	strb r0, [r2, #8]
	strb r3, [r2, #9]
	movs r0, #4
	strb r0, [r2, #0xa]
	ldr r0, _080A391C @ =0x02000500
	ldr r1, _080A3920 @ =0x02000280
	str r1, [r0]
	ldr r2, _080A3924 @ =0x02000504
	ldr r5, _080A3928 @ =0xFFFFFD80
	adds r0, r1, r5
	str r0, [r2]
	ldr r0, _080A392C @ =0x02000508
	str r1, [r0]
	adds r0, r4, #0
	adds r0, #0x4c
	strh r3, [r0]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080A3908: .4byte gPlaySt
_080A390C: .4byte 0x00000399
_080A3910: .4byte 0x030027CC
_080A3914: .4byte 0x0000FFE0
_080A3918: .4byte 0x0000E0FF
_080A391C: .4byte 0x02000500
_080A3920: .4byte 0x02000280
_080A3924: .4byte 0x02000504
_080A3928: .4byte 0xFFFFFD80
_080A392C: .4byte 0x02000508

	thumb_func_start sub_80A3930
sub_80A3930: @ 0x080A3930
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x1c
	str r0, [sp, #0x14]
	ldr r2, _080A3AD4 @ =gDispIo
	adds r1, r2, #0
	adds r1, #0x3c
	movs r0, #0xc0
	ldrb r3, [r1]
	orrs r0, r3
	strb r0, [r1]
	adds r0, r2, #0
	adds r0, #0x44
	movs r1, #0
	movs r4, #0x10
	strb r4, [r0]
	adds r0, #1
	strb r1, [r0]
	ldr r6, [sp, #0x14]
	adds r6, #0x4c
	movs r5, #0
	ldrsh r1, [r6, r5]
	cmp r1, #0
	bge _080A3968
	adds r1, #3
_080A3968:
	asrs r1, r1, #2
	movs r0, #4
	subs r0, r0, r1
	adds r1, r2, #0
	adds r1, #0x46
	strb r0, [r1]
	movs r1, #0x80
	lsls r1, r1, #1
	movs r0, #0
	ldrsh r3, [r6, r0]
	str r4, [sp]
	movs r0, #2
	movs r2, #0
	bl Interpolate
	adds r7, r0, #0
	cmp r7, #0
	bge _080A398E
	adds r0, r7, #3
_080A398E:
	asrs r0, r0, #2
	movs r1, #0x40
	subs r1, r1, r0
	add r0, sp, #4
	ldr r3, [sp, #0x14]
	ldr r2, [r3, #0x34]
	rsbs r5, r2, #0
	strh r5, [r0]
	ldr r4, [r3, #0x38]
	rsbs r3, r4, #0
	strh r3, [r0, #2]
	strh r2, [r0, #4]
	strh r3, [r0, #6]
	strh r2, [r0, #8]
	strh r4, [r0, #0xa]
	strh r5, [r0, #0xc]
	strh r4, [r0, #0xe]
	str r6, [sp, #0x18]
	ldr r4, _080A3AD8 @ =0x02000504
	mov sl, r4
	ldr r2, _080A3ADC @ =gSinLut
	movs r0, #0xff
	ands r1, r0
	adds r0, r1, #0
	adds r0, #0x40
	lsls r0, r0, #1
	adds r0, r0, r2
	mov sb, r0
	lsls r1, r1, #1
	adds r1, r1, r2
	mov r8, r1
	add r6, sp, #4
	movs r5, #3
	mov ip, r5
_080A39D2:
	mov r0, sb
	movs r1, #0
	ldrsh r5, [r0, r1]
	movs r2, #0
	ldrsh r4, [r6, r2]
	adds r2, r5, #0
	muls r2, r4, r2
	mov r3, r8
	movs r0, #0
	ldrsh r1, [r3, r0]
	movs r0, #2
	ldrsh r3, [r6, r0]
	adds r0, r1, #0
	muls r0, r3, r0
	subs r2, r2, r0
	muls r1, r4, r1
	adds r0, r5, #0
	muls r0, r3, r0
	adds r1, r1, r0
	adds r0, r2, #0
	muls r0, r7, r0
	asrs r0, r0, #0x14
	adds r0, #0x78
	strh r0, [r6]
	adds r0, r1, #0
	muls r0, r7, r0
	asrs r0, r0, #0x14
	adds r0, #0x50
	strh r0, [r6, #2]
	adds r6, #4
	movs r1, #1
	rsbs r1, r1, #0
	add ip, r1
	mov r2, ip
	cmp r2, #0
	bge _080A39D2
	mov r3, sl
	ldr r0, [r3]
	bl sub_80138C8
	mov r4, sl
	ldr r0, [r4]
	add r1, sp, #4
	movs r5, #0
	ldrsh r1, [r1, r5]
	add r2, sp, #4
	movs r3, #2
	ldrsh r2, [r2, r3]
	add r3, sp, #4
	movs r4, #4
	ldrsh r3, [r3, r4]
	add r4, sp, #4
	movs r5, #6
	ldrsh r4, [r4, r5]
	str r4, [sp]
	bl sub_80138E8
	mov r1, sl
	ldr r0, [r1]
	add r1, sp, #4
	movs r2, #4
	ldrsh r1, [r1, r2]
	add r2, sp, #4
	movs r3, #6
	ldrsh r2, [r2, r3]
	add r3, sp, #4
	movs r4, #8
	ldrsh r3, [r3, r4]
	add r4, sp, #4
	movs r5, #0xa
	ldrsh r4, [r4, r5]
	str r4, [sp]
	bl sub_80138E8
	mov r1, sl
	ldr r0, [r1]
	add r1, sp, #4
	movs r2, #8
	ldrsh r1, [r1, r2]
	add r2, sp, #4
	movs r3, #0xa
	ldrsh r2, [r2, r3]
	add r3, sp, #4
	movs r4, #0xc
	ldrsh r3, [r3, r4]
	add r4, sp, #4
	movs r5, #0xe
	ldrsh r4, [r4, r5]
	str r4, [sp]
	bl sub_80138E8
	mov r1, sl
	ldr r0, [r1]
	add r1, sp, #4
	movs r2, #0xc
	ldrsh r1, [r1, r2]
	add r2, sp, #4
	movs r3, #0xe
	ldrsh r2, [r2, r3]
	add r3, sp, #4
	movs r4, #0
	ldrsh r3, [r3, r4]
	add r4, sp, #4
	movs r5, #2
	ldrsh r4, [r4, r5]
	str r4, [sp]
	bl sub_80138E8
	bl sub_80A35BC
	ldr r1, [sp, #0x18]
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x10
	ble _080A3AC4
	ldr r0, [sp, #0x14]
	bl Proc_Break
_080A3AC4:
	add sp, #0x1c
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A3AD4: .4byte gDispIo
_080A3AD8: .4byte 0x02000504
_080A3ADC: .4byte gSinLut

	thumb_func_start sub_80A3AE0
sub_80A3AE0: @ 0x080A3AE0
	push {r4, lr}
	adds r4, r0, #0
	cmp r4, #0
	bge _080A3AEA
	movs r4, #3
_080A3AEA:
	ldr r0, _080A3B10 @ =gUnk_0842D338
	ldr r1, _080A3B14 @ =gBuf
	bl Decompress
	ldr r0, _080A3B18 @ =gUnk_0842D710
	lsls r1, r4, #5
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r0, _080A3B1C @ =gUnk_0842D730
	adds r1, r4, #1
	lsls r1, r1, #5
	movs r2, #0x20
	bl ApplyPaletteExt
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A3B10: .4byte gUnk_0842D338
_080A3B14: .4byte gBuf
_080A3B18: .4byte gUnk_0842D710
_080A3B1C: .4byte gUnk_0842D730

	thumb_func_start sub_80A3B20
sub_80A3B20: @ 0x080A3B20
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	ldr r1, _080A3BA0 @ =0x0200050C
	ldr r0, _080A3BA4 @ =gBuf
	str r0, [r1]
	movs r2, #1
	ldr r0, _080A3BA8 @ =gPal
	mov sl, r0
	movs r0, #0x1f
	mov r8, r0
	mov sb, r1
_080A3B3C:
	adds r0, r2, #0
	adds r0, #0x40
	lsls r0, r0, #1
	add r0, sl
	ldrh r0, [r0]
	adds r5, r0, #0
	mov r1, r8
	ands r5, r1
	asrs r4, r0, #5
	ands r4, r1
	asrs r3, r0, #0xa
	ands r3, r1
	adds r0, r2, #1
	mov ip, r0
	lsls r6, r2, #1
	movs r7, #7
_080A3B5C:
	mov r1, sb
	ldr r0, [r1]
	adds r0, r6, r0
	lsls r1, r3, #0xa
	lsls r2, r4, #5
	adds r1, r1, r2
	adds r1, r1, r5
	strh r1, [r0]
	adds r5, #3
	cmp r5, #0x1f
	ble _080A3B74
	movs r5, #0x1f
_080A3B74:
	adds r4, #3
	cmp r4, #0x1f
	ble _080A3B7C
	movs r4, #0x1f
_080A3B7C:
	adds r3, #3
	cmp r3, #0x1f
	ble _080A3B84
	movs r3, #0x1f
_080A3B84:
	adds r6, #0x20
	subs r7, #1
	cmp r7, #0
	bge _080A3B5C
	mov r2, ip
	cmp r2, #0xf
	ble _080A3B3C
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A3BA0: .4byte 0x0200050C
_080A3BA4: .4byte gBuf
_080A3BA8: .4byte gPal

	thumb_func_start sub_80A3BAC
sub_80A3BAC: @ 0x080A3BAC
	push {lr}
	sub sp, #0x10
	ldr r1, _080A3BE0 @ =gUnk_0842D7B3
	mov r0, sp
	movs r2, #0x10
	bl memcpy
	bl GetGameTime
	lsrs r0, r0, #2
	movs r1, #0xf
	ands r0, r1
	add r0, sp
	ldr r1, _080A3BE4 @ =0x0200050C
	ldrb r0, [r0]
	lsls r2, r0, #5
	ldr r0, [r1]
	adds r0, r0, r2
	movs r1, #0x80
	movs r2, #0x20
	bl ApplyPaletteExt
	add sp, #0x10
	pop {r0}
	bx r0
	.align 2, 0
_080A3BE0: .4byte gUnk_0842D7B3
_080A3BE4: .4byte 0x0200050C

	thumb_func_start sub_80A3BE8
sub_80A3BE8: @ 0x080A3BE8
	push {lr}
	sub sp, #0x20
	ldr r1, _080A3C24 @ =gUnk_0842D7C3
	mov r0, sp
	movs r2, #0x20
	bl memcpy
	bl GetGameTime
	movs r1, #0x1f
	ands r1, r0
	mov r2, sp
	adds r0, r2, r1
	ldrb r3, [r0]
	adds r3, #0x10
	ldr r2, _080A3C28 @ =gPal
	lsls r0, r3, #0xa
	lsls r1, r3, #5
	adds r0, r0, r1
	adds r0, r0, r3
	movs r1, #0x87
	lsls r1, r1, #2
	adds r2, r2, r1
	strh r0, [r2]
	bl EnablePalSync
	add sp, #0x20
	pop {r0}
	bx r0
	.align 2, 0
_080A3C24: .4byte gUnk_0842D7C3
_080A3C28: .4byte gPal

	thumb_func_start sub_80A3C2C
sub_80A3C2C: @ 0x080A3C2C
	push {r4, lr}
	sub sp, #0x1c
	adds r4, r0, #0
	ldr r1, _080A3C70 @ =gUnk_0842D7E4
	mov r0, sp
	movs r2, #0x1a
	bl memcpy
	ldr r3, _080A3C74 @ =gBmSt
	movs r0, #0xc
	ldrsh r1, [r3, r0]
	cmp r1, #0
	bge _080A3C48
	adds r1, #3
_080A3C48:
	asrs r1, r1, #2
	ldr r0, [r4, #0x3c]
	adds r2, r0, r1
	movs r1, #0xe
	ldrsh r0, [r3, r1]
	cmp r0, #0
	bge _080A3C58
	adds r0, #3
_080A3C58:
	asrs r0, r0, #2
	ldr r1, [r4, #0x40]
	adds r1, r1, r0
	adds r0, r2, #0
	mov r2, sp
	movs r3, #0
	bl PutOamHiRam
	add sp, #0x1c
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A3C70: .4byte gUnk_0842D7E4
_080A3C74: .4byte gBmSt

	thumb_func_start sub_80A3C78
sub_80A3C78: @ 0x080A3C78
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	ldr r2, _080A3CE8 @ =gBmMapSize
	movs r0, #0
	ldrsh r1, [r2, r0]
	lsls r1, r1, #2
	movs r0, #0xf0
	subs r0, r0, r1
	asrs r5, r0, #1
	movs r1, #2
	ldrsh r0, [r2, r1]
	lsls r1, r0, #2
	movs r0, #0xa0
	subs r0, r0, r1
	asrs r4, r0, #1
	cmp r1, #0x90
	ble _080A3CBC
	adds r4, r1, #0
	subs r4, #0x90
	ldr r1, _080A3CEC @ =gBmSt
	ldrh r2, [r1, #0xe]
	lsls r0, r2, #0x10
	movs r2, #0x2a
	ldrsh r1, [r1, r2]
	bl __divsi3
	muls r0, r4, r0
	cmp r0, #0
	bge _080A3CB6
	ldr r1, _080A3CF0 @ =0x0000FFFF
	adds r0, r0, r1
_080A3CB6:
	asrs r4, r0, #0x10
	movs r0, #8
	subs r4, r0, r4
_080A3CBC:
	str r5, [r6, #0x3c]
	str r4, [r6, #0x40]
	rsbs r5, r5, #0
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	rsbs r4, r4, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	movs r0, #0
	adds r1, r5, #0
	adds r2, r4, #0
	bl SetBgOffset
	movs r0, #1
	adds r1, r5, #0
	adds r2, r4, #0
	bl SetBgOffset
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080A3CE8: .4byte gBmMapSize
_080A3CEC: .4byte gBmSt
_080A3CF0: .4byte 0x0000FFFF

	thumb_func_start sub_80A3CF4
sub_80A3CF4: @ 0x080A3CF4
	push {r4, r5, r6, r7, lr}
	adds r3, r0, #0
	ldr r1, _080A3DB4 @ =gBmSt
	movs r0, #0xc
	ldrsh r4, [r1, r0]
	movs r2, #0xe
	ldrsh r5, [r1, r2]
	movs r2, #0xf
	adds r0, r4, #0
	ands r0, r2
	adds r7, r1, #0
	cmp r0, #0
	bne _080A3D7E
	adds r0, r5, #0
	ands r0, r2
	cmp r0, #0
	bne _080A3D7E
	str r0, [r3, #0x2c]
	str r0, [r3, #0x30]
	ldr r2, _080A3DB8 @ =gpKeySt
	ldr r1, [r2]
	movs r0, #0x20
	ldrh r1, [r1, #4]
	ands r0, r1
	cmp r0, #0
	beq _080A3D36
	movs r0, #8
	rsbs r0, r0, #0
	str r0, [r3, #0x2c]
	adds r1, r3, #0
	adds r1, #0x4a
	movs r0, #1
	strh r0, [r1]
_080A3D36:
	ldr r1, [r2]
	movs r0, #0x10
	ldrh r2, [r1, #4]
	ands r0, r2
	adds r6, r1, #0
	cmp r0, #0
	beq _080A3D50
	movs r0, #8
	str r0, [r3, #0x2c]
	adds r2, r3, #0
	adds r2, #0x4a
	movs r0, #1
	strh r0, [r2]
_080A3D50:
	movs r0, #0x40
	ldrh r6, [r6, #4]
	ands r0, r6
	cmp r0, #0
	beq _080A3D68
	movs r0, #8
	rsbs r0, r0, #0
	str r0, [r3, #0x30]
	adds r2, r3, #0
	adds r2, #0x4a
	movs r0, #1
	strh r0, [r2]
_080A3D68:
	movs r0, #0x80
	ldrh r1, [r1, #4]
	ands r0, r1
	cmp r0, #0
	beq _080A3D7E
	movs r0, #8
	str r0, [r3, #0x30]
	adds r1, r3, #0
	adds r1, #0x4a
	movs r0, #1
	strh r0, [r1]
_080A3D7E:
	ldr r0, [r3, #0x2c]
	adds r4, r4, r0
	ldr r0, [r3, #0x30]
	adds r5, r5, r0
	cmp r4, #0
	bge _080A3D8C
	movs r4, #0
_080A3D8C:
	adds r1, r7, #0
	movs r2, #0x28
	ldrsh r0, [r1, r2]
	cmp r4, r0
	ble _080A3D98
	adds r4, r0, #0
_080A3D98:
	cmp r5, #0
	bge _080A3D9E
	movs r5, #0
_080A3D9E:
	movs r2, #0x2a
	ldrsh r0, [r1, r2]
	cmp r5, r0
	ble _080A3DA8
	adds r5, r0, #0
_080A3DA8:
	strh r4, [r7, #0xc]
	strh r5, [r7, #0xe]
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A3DB4: .4byte gBmSt
_080A3DB8: .4byte gpKeySt

	thumb_func_start sub_80A3DBC
sub_80A3DBC: @ 0x080A3DBC
	adds r2, r0, #0
	adds r2, #0x4a
	movs r1, #0
	strh r1, [r2]
	ldr r2, _080A3DD8 @ =gBmMapSize
	movs r3, #0
	ldrsh r1, [r2, r3]
	lsls r1, r1, #1
	str r1, [r0, #0x34]
	movs r3, #2
	ldrsh r1, [r2, r3]
	lsls r1, r1, #1
	str r1, [r0, #0x38]
	bx lr
	.align 2, 0
_080A3DD8: .4byte gBmMapSize

	thumb_func_start sub_80A3DDC
sub_80A3DDC: @ 0x080A3DDC
	push {lr}
	adds r0, #0x4a
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	beq _080A3E0A
	ldr r1, _080A3E14 @ =gBmSt
	movs r2, #0xc
	ldrsh r0, [r1, r2]
	cmp r0, #0
	bge _080A3DF4
	adds r0, #0xf
_080A3DF4:
	asrs r0, r0, #4
	adds r0, #7
	movs r2, #0xe
	ldrsh r1, [r1, r2]
	cmp r1, #0
	bge _080A3E02
	adds r1, #0xf
_080A3E02:
	asrs r1, r1, #4
	adds r1, #5
	bl SetMapCursorPosition
_080A3E0A:
	movs r0, #0
	bl SetOnHBlankA
	pop {r0}
	bx r0
	.align 2, 0
_080A3E14: .4byte gBmSt

	thumb_func_start sub_80A3E18
sub_80A3E18: @ 0x080A3E18
	push {r4, r5, lr}
	adds r4, r0, #0
	bl sub_80A3BAC
	adds r0, r4, #0
	bl sub_80A3BE8
	adds r0, r4, #0
	bl sub_80A3C78
	adds r0, r4, #0
	bl sub_80A3C2C
	adds r0, r4, #0
	bl sub_80A3CF4
	ldr r0, _080A3E7C @ =gpKeySt
	ldr r0, [r0]
	movs r3, #0xc0
	lsls r3, r3, #2
	ldrh r0, [r0, #4]
	ands r3, r0
	cmp r3, #0
	beq _080A3E8C
	ldr r2, _080A3E80 @ =0x030027CC
	ldr r0, _080A3E84 @ =0x0000FFE0
	ldrh r1, [r2]
	ands r0, r1
	movs r1, #2
	orrs r0, r1
	ldr r1, _080A3E88 @ =0x0000E0FF
	ands r0, r1
	movs r3, #0xe0
	lsls r3, r3, #5
	adds r1, r3, #0
	orrs r0, r1
	strh r0, [r2]
	movs r0, #0x3f
	ldrb r5, [r2]
	ands r0, r5
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r2]
	movs r1, #0
	movs r0, #8
	strb r0, [r2, #8]
	strb r0, [r2, #9]
	strb r1, [r2, #0xa]
	b _080A3EB8
	.align 2, 0
_080A3E7C: .4byte gpKeySt
_080A3E80: .4byte 0x030027CC
_080A3E84: .4byte 0x0000FFE0
_080A3E88: .4byte 0x0000E0FF
_080A3E8C:
	ldr r2, _080A3EE0 @ =0x030027CC
	ldr r0, _080A3EE4 @ =0x0000FFE0
	ldrh r1, [r2]
	ands r0, r1
	movs r1, #0xc
	orrs r0, r1
	ldr r1, _080A3EE8 @ =0x0000E0FF
	ands r0, r1
	movs r5, #0xf8
	lsls r5, r5, #5
	adds r1, r5, #0
	orrs r0, r1
	strh r0, [r2]
	movs r0, #0xc0
	ldrb r1, [r2]
	orrs r0, r1
	strb r0, [r2]
	movs r0, #0x10
	strb r0, [r2, #8]
	strb r3, [r2, #9]
	movs r0, #4
	strb r0, [r2, #0xa]
_080A3EB8:
	ldr r0, _080A3EEC @ =gBmSt
	ldr r0, [r0, #0xc]
	ldr r1, _080A3EF0 @ =0x000F000F
	ands r0, r1
	cmp r0, #0
	bne _080A3ED8
	ldr r0, _080A3EF4 @ =gpKeySt
	ldr r1, [r0]
	movs r0, #0xa
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _080A3ED8
	adds r0, r4, #0
	bl Proc_Break
_080A3ED8:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080A3EE0: .4byte 0x030027CC
_080A3EE4: .4byte 0x0000FFE0
_080A3EE8: .4byte 0x0000E0FF
_080A3EEC: .4byte gBmSt
_080A3EF0: .4byte 0x000F000F
_080A3EF4: .4byte gpKeySt

	thumb_func_start sub_80A3EF8
sub_80A3EF8: @ 0x080A3EF8
	push {lr}
	ldr r0, _080A3F08 @ =gUnk_08DAD29C
	movs r1, #3
	bl Proc_Start
	pop {r0}
	bx r0
	.align 2, 0
_080A3F08: .4byte gUnk_08DAD29C

	thumb_func_start sub_80A3F0C
sub_80A3F0C: @ 0x080A3F0C
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r6, r1, #0
	adds r4, r2, #0
	ldr r0, _080A3F40 @ =gBg0Tm
	movs r1, #0
	bl TmFill
	ldr r0, _080A3F44 @ =gBg1Tm
	movs r1, #0
	bl TmFill
	adds r0, r5, #0
	bl InitChapterPreviewMap
	adds r0, r4, #0
	bl sub_80A3AE0
	adds r0, r6, #0
	adds r1, r4, #0
	bl sub_80A3318
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080A3F40: .4byte gBg0Tm
_080A3F44: .4byte gBg1Tm
