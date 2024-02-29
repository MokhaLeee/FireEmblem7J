	.include "macro.inc"
	.syntax unified

	thumb_func_start EventSpriteAnimfx_Loop
EventSpriteAnimfx_Loop: @ 0x0807F258
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x10
	mov r8, r0
	movs r5, #0
	movs r0, #0
	str r0, [sp]
	mov sl, r0
	mov r1, r8
	adds r1, #0x2c
	str r1, [sp, #0xc]
_0807F274:
	ldr r2, [sp, #0xc]
	ldr r0, [r2]
	cmp r0, #0
	bne _0807F27E
	b _0807F396
_0807F27E:
	mov r0, r8
	adds r0, #0x38
	add r0, sl
	mov sb, r0
	mov r0, r8
	adds r0, #0x44
	add r0, sl
	str r0, [sp, #4]
	mov r4, r8
	adds r4, #0x3e
	mov r3, r8
	adds r3, #0x4a
	str r3, [sp, #8]
	mov r6, sb
	ldrh r6, [r6]
	ldrh r7, [r0]
	cmp r6, r7
	bne _0807F2B2
	mov r0, sl
	adds r1, r4, r0
	adds r0, r3, #0
	add r0, sl
	ldrh r2, [r1]
	ldrh r0, [r0]
	cmp r2, r0
	beq _0807F354
_0807F2B2:
	mov r0, r8
	adds r0, #0x56
	mov r3, sl
	adds r5, r0, r3
	subs r0, #6
	adds r1, r0, r3
	ldrh r6, [r5]
	ldrh r7, [r1]
	adds r0, r6, r7
	strh r0, [r5]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r2, #0x80
	lsls r2, r2, #1
	mov ip, r2
	cmp r0, ip
	ble _0807F2D8
	mov r3, ip
	strh r3, [r5]
_0807F2D8:
	movs r6, #0
	ldrsh r0, [r1, r6]
	cmp r0, #0
	bne _0807F2E4
	mov r7, ip
	strh r7, [r5]
_0807F2E4:
	mov r1, sb
	movs r2, #0
	ldrsh r0, [r1, r2]
	movs r3, #0
	ldrsh r2, [r5, r3]
	mov r6, ip
	subs r3, r6, r2
	adds r1, r0, #0
	muls r1, r3, r1
	ldr r7, [sp, #4]
	movs r6, #0
	ldrsh r0, [r7, r6]
	muls r0, r2, r0
	adds r1, r1, r0
	cmp r1, #0
	bge _0807F306
	adds r1, #0xff
_0807F306:
	asrs r6, r1, #8
	mov r0, sl
	adds r7, r4, r0
	movs r1, #0
	ldrsh r0, [r7, r1]
	adds r1, r0, #0
	muls r1, r3, r1
	ldr r3, [sp, #8]
	add r3, sl
	movs r4, #0
	ldrsh r0, [r3, r4]
	muls r0, r2, r0
	adds r1, r1, r0
	cmp r1, #0
	bge _0807F326
	adds r1, #0xff
_0807F326:
	asrs r4, r1, #8
	movs r1, #0
	ldrsh r0, [r5, r1]
	cmp r0, ip
	bne _0807F350
	ldr r2, [sp, #4]
	ldrh r0, [r2]
	mov r1, sb
	strh r0, [r1]
	ldrh r0, [r3]
	strh r0, [r7]
	ldr r2, [sp, #0xc]
	ldr r0, [r2]
	ldr r0, [r0, #0x50]
	mov r1, r8
	adds r1, #0x62
	ldr r3, [sp]
	adds r1, r1, r3
	ldrb r1, [r1]
	bl SetSpriteAnimId
_0807F350:
	movs r5, #1
	b _0807F35E
_0807F354:
	mov r4, sb
	movs r7, #0
	ldrsh r6, [r4, r7]
	movs r0, #0
	ldrsh r4, [r1, r0]
_0807F35E:
	ldr r1, _0807F3F0 @ =gBmSt
	movs r2, #0xc
	ldrsh r0, [r1, r2]
	subs r6, r6, r0
	movs r3, #0xe
	ldrsh r0, [r1, r3]
	subs r4, r4, r0
	movs r0, #0x40
	rsbs r0, r0, #0
	cmp r4, r0
	bge _0807F376
	movs r4, #0xcc
_0807F376:
	ldr r0, _0807F3F4 @ =0x000001FF
	ands r6, r0
	movs r0, #0xff
	ands r4, r0
	ldr r7, [sp, #0xc]
	ldr r0, [r7]
	mov r1, r8
	adds r1, #0x5c
	add r1, sl
	ldrh r1, [r1]
	adds r2, r1, r4
	adds r1, r6, #0
	movs r3, #1
	rsbs r3, r3, #0
	bl SetSpriteAnimProcParameters
_0807F396:
	movs r0, #2
	add sl, r0
	ldr r1, [sp, #0xc]
	adds r1, #4
	str r1, [sp, #0xc]
	ldr r2, [sp]
	adds r2, #1
	str r2, [sp]
	cmp r2, #2
	bgt _0807F3AC
	b _0807F274
_0807F3AC:
	cmp r5, #0
	beq _0807F3DE
	mov r2, r8
	adds r2, #0x6b
	ldrb r0, [r2]
	adds r1, r0, #1
	strb r1, [r2]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r1, #0x18
	bl __umodsi3
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0807F3DE
	ldr r0, _0807F3F8 @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0807F3DE
	movs r0, #0xb8
	lsls r0, r0, #2
	bl m4aSongNumStart
_0807F3DE:
	add sp, #0x10
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0807F3F0: .4byte gBmSt
_0807F3F4: .4byte 0x000001FF
_0807F3F8: .4byte gPlaySt

	thumb_func_start sub_807F3FC
sub_807F3FC: @ 0x0807F3FC
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0807F428 @ =ProcScr_EventSpriteAnimfx
	bl Proc_Start
	adds r0, #0x6a
	strb r4, [r0]
	cmp r4, #0
	bne _0807F416
	ldr r0, _0807F42C @ =gUnk_081C3850
	ldr r1, _0807F430 @ =0x06013000
	bl Decompress
_0807F416:
	cmp r4, #1
	bne _0807F422
	ldr r0, _0807F434 @ =gUnk_081C564C
	ldr r1, _0807F430 @ =0x06013000
	bl Decompress
_0807F422:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0807F428: .4byte ProcScr_EventSpriteAnimfx
_0807F42C: .4byte gUnk_081C3850
_0807F430: .4byte 0x06013000
_0807F434: .4byte gUnk_081C564C

	thumb_func_start sub_807F438
sub_807F438: @ 0x0807F438
	push {lr}
	ldr r0, _0807F444 @ =ProcScr_EventSpriteAnimfx
	bl Proc_EndEach
	pop {r0}
	bx r0
	.align 2, 0
_0807F444: .4byte ProcScr_EventSpriteAnimfx

	thumb_func_start sub_807F448
sub_807F448: @ 0x0807F448
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #0x10
	adds r6, r0, #0
	mov r8, r1
	adds r7, r2, #0
	mov sb, r3
	ldr r5, [sp, #0x2c]
	ldr r0, _0807F4D8 @ =gUnk_08403434
	ldr r1, [r0, #4]
	ldr r0, [r0]
	str r0, [sp, #8]
	str r1, [sp, #0xc]
	ldr r0, _0807F4DC @ =ProcScr_EventSpriteAnimfx
	bl Proc_Find
	adds r4, r0, #0
	cmp r4, #0
	beq _0807F542
	adds r0, #0x62
	adds r0, r0, r6
	mov r1, r8
	strb r1, [r0]
	lsls r0, r5, #1
	mov r2, r8
	adds r5, r0, r2
	lsls r1, r6, #2
	adds r0, r4, #0
	adds r0, #0x2c
	adds r0, r0, r1
	mov r8, r0
	ldr r0, [r0]
	cmp r0, #0
	bne _0807F4E4
	adds r0, r4, #0
	adds r0, #0x6a
	ldrb r0, [r0]
	lsls r0, r0, #2
	add r0, sp
	adds r0, #8
	ldr r0, [r0]
	ldr r3, _0807F4E0 @ =0x0000A980
	str r5, [sp]
	movs r1, #0xd
	str r1, [sp, #4]
	adds r1, r7, #0
	mov r2, sb
	bl StartSpriteAnimProc
	mov r3, r8
	str r0, [r3]
	lsls r2, r6, #1
	adds r1, r4, #0
	adds r1, #0x38
	adds r1, r1, r2
	adds r0, r4, #0
	adds r0, #0x44
	adds r0, r0, r2
	strh r7, [r0]
	strh r7, [r1]
	adds r1, r4, #0
	adds r1, #0x3e
	adds r1, r1, r2
	adds r0, r4, #0
	adds r0, #0x4a
	adds r0, r0, r2
	mov r2, sb
	strh r2, [r0]
	strh r2, [r1]
	b _0807F542
	.align 2, 0
_0807F4D8: .4byte gUnk_08403434
_0807F4DC: .4byte ProcScr_EventSpriteAnimfx
_0807F4E0: .4byte 0x0000A980
_0807F4E4:
	ldr r3, [sp, #0x30]
	cmp r3, #0
	bne _0807F4F4
	ldr r0, [r0, #0x50]
	adds r1, r5, #0
	bl SetSpriteAnimId
	b _0807F542
_0807F4F4:
	ldr r0, [r0, #0x50]
	adds r1, r5, #0
	bl SetSpriteAnimId
	lsls r2, r6, #1
	adds r0, r4, #0
	adds r0, #0x38
	adds r0, r0, r2
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, r7
	bne _0807F51A
	adds r0, r4, #0
	adds r0, #0x3e
	adds r0, r0, r2
	movs r3, #0
	ldrsh r0, [r0, r3]
	cmp r0, sb
	beq _0807F542
_0807F51A:
	adds r0, r4, #0
	adds r0, #0x56
	adds r0, r0, r2
	movs r1, #0
	strh r1, [r0]
	adds r0, r4, #0
	adds r0, #0x50
	adds r0, r0, r2
	mov r1, sp
	ldrh r1, [r1, #0x30]
	strh r1, [r0]
	adds r0, r4, #0
	adds r0, #0x44
	adds r0, r0, r2
	strh r7, [r0]
	adds r0, r4, #0
	adds r0, #0x4a
	adds r0, r0, r2
	mov r2, sb
	strh r2, [r0]
_0807F542:
	add sp, #0x10
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_807F550
sub_807F550: @ 0x0807F550
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	ldr r0, _0807F588 @ =ProcScr_EventSpriteAnimfx
	bl Proc_Find
	adds r4, r0, #0
	cmp r4, #0
	beq _0807F580
	lsls r1, r6, #2
	adds r0, #0x2c
	adds r5, r0, r1
	ldr r0, [r5]
	cmp r0, #0
	beq _0807F580
	bl EndSpriteAnimProc
	lsls r1, r6, #1
	adds r0, r4, #0
	adds r0, #0x38
	adds r0, r0, r1
	ldr r1, _0807F58C @ =0x0000FFFF
	strh r1, [r0]
	movs r0, #0
	str r0, [r5]
_0807F580:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0807F588: .4byte ProcScr_EventSpriteAnimfx
_0807F58C: .4byte 0x0000FFFF

	thumb_func_start sub_807F590
sub_807F590: @ 0x0807F590
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0807F5C4 @ =ProcScr_EventSpriteAnimfx
	bl Proc_Find
	adds r2, r0, #0
	cmp r2, #0
	beq _0807F5BC
	lsls r0, r4, #2
	adds r1, r2, #0
	adds r1, #0x2c
	adds r1, r1, r0
	ldr r0, [r1]
	cmp r0, #0
	beq _0807F5BC
	lsls r0, r4, #1
	adds r1, r2, #0
	adds r1, #0x5c
	adds r1, r1, r0
	movs r0, #0x80
	lsls r0, r0, #3
	strh r0, [r1]
_0807F5BC:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0807F5C4: .4byte ProcScr_EventSpriteAnimfx

	thumb_func_start sub_807F5C8
sub_807F5C8: @ 0x0807F5C8
	push {r4, lr}
	sub sp, #8
	adds r1, r0, #0
	movs r0, #0
	bl sub_807F3FC
	movs r4, #0
	str r4, [sp]
	str r4, [sp, #4]
	movs r0, #0
	movs r1, #0
	movs r2, #0xc8
	movs r3, #0x48
	bl sub_807F448
	str r4, [sp]
	str r4, [sp, #4]
	movs r0, #1
	movs r1, #1
	movs r2, #0x98
	movs r3, #0x58
	bl sub_807F448
	str r4, [sp]
	str r4, [sp, #4]
	movs r0, #2
	movs r1, #0
	movs r2, #0xf8
	movs r3, #0x58
	bl sub_807F448
	add sp, #8
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_807F610
sub_807F610: @ 0x0807F610
	push {lr}
	sub sp, #8
	movs r0, #2
	str r0, [sp]
	str r0, [sp, #4]
	movs r0, #1
	movs r1, #1
	movs r2, #0xa8
	movs r3, #0x80
	bl sub_807F448
	add sp, #8
	pop {r0}
	bx r0

	thumb_func_start sub_807F62C
sub_807F62C: @ 0x0807F62C
	push {lr}
	sub sp, #8
	movs r0, #2
	str r0, [sp]
	str r0, [sp, #4]
	movs r1, #0
	movs r2, #0xe8
	movs r3, #0x80
	bl sub_807F448
	add sp, #8
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_807F648
sub_807F648: @ 0x0807F648
	push {r4, lr}
	sub sp, #8
	adds r1, r0, #0
	movs r0, #0
	bl sub_807F3FC
	movs r4, #0
	str r4, [sp]
	str r4, [sp, #4]
	movs r0, #0
	movs r1, #0
	movs r2, #0xc8
	movs r3, #0x48
	bl sub_807F448
	str r4, [sp]
	str r4, [sp, #4]
	movs r0, #1
	movs r1, #1
	movs r2, #0xa8
	movs r3, #0x80
	bl sub_807F448
	str r4, [sp]
	str r4, [sp, #4]
	movs r0, #2
	movs r1, #0
	movs r2, #0xe8
	movs r3, #0x80
	bl sub_807F448
	add sp, #8
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_807F690
sub_807F690: @ 0x0807F690
	push {lr}
	sub sp, #8
	movs r0, #3
	str r0, [sp]
	movs r0, #8
	str r0, [sp, #4]
	movs r0, #1
	movs r1, #1
	movs r2, #0xa8
	movs r3, #0x68
	bl sub_807F448
	add sp, #8
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_807F6B0
sub_807F6B0: @ 0x0807F6B0
	push {lr}
	sub sp, #8
	movs r0, #3
	str r0, [sp]
	movs r0, #8
	str r0, [sp, #4]
	movs r0, #2
	movs r1, #0
	movs r2, #0xe8
	movs r3, #0x68
	bl sub_807F448
	add sp, #8
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_807F6D0
sub_807F6D0: @ 0x0807F6D0
	push {r4, lr}
	sub sp, #8
	adds r1, r0, #0
	movs r0, #1
	bl sub_807F3FC
	movs r4, #0
	str r4, [sp]
	str r4, [sp, #4]
	movs r0, #0
	movs r1, #0
	movs r2, #0xc8
	movs r3, #0x48
	bl sub_807F448
	str r4, [sp]
	str r4, [sp, #4]
	movs r0, #1
	movs r1, #1
	movs r2, #0xa8
	movs r3, #0x70
	bl sub_807F448
	str r4, [sp]
	str r4, [sp, #4]
	movs r0, #2
	movs r1, #0
	movs r2, #0xe8
	movs r3, #0x70
	bl sub_807F448
	add sp, #8
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_807F718
sub_807F718: @ 0x0807F718
	push {lr}
	sub sp, #8
	movs r0, #1
	str r0, [sp]
	movs r0, #0
	str r0, [sp, #4]
	movs r0, #1
	movs r1, #1
	movs r2, #0
	movs r3, #0
	bl sub_807F448
	add sp, #8
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_807F738
sub_807F738: @ 0x0807F738
	push {lr}
	sub sp, #8
	movs r0, #1
	str r0, [sp]
	movs r0, #0
	str r0, [sp, #4]
	movs r0, #2
	movs r1, #0
	movs r2, #0
	movs r3, #0
	bl sub_807F448
	add sp, #8
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_807F758
sub_807F758: @ 0x0807F758
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0807F784 @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0807F76E
	ldr r0, _0807F788 @ =0x000002FB
	bl m4aSongNumStart
_0807F76E:
	movs r1, #6
	rsbs r1, r1, #0
	movs r0, #0
	movs r2, #8
	adds r3, r4, #0
	bl sub_807D120
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0807F784: .4byte gPlaySt
_0807F788: .4byte 0x000002FB

	thumb_func_start sub_807F78C
sub_807F78C: @ 0x0807F78C
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0807F7B8 @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0807F7A4
	movs r0, #0xbf
	lsls r0, r0, #2
	bl m4aSongNumStart
_0807F7A4:
	movs r0, #1
	movs r1, #2
	movs r2, #8
	adds r3, r4, #0
	bl sub_807D120
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0807F7B8: .4byte gPlaySt

	thumb_func_start sub_807F7BC
sub_807F7BC: @ 0x0807F7BC
	push {r4, lr}
	sub sp, #8
	movs r4, #0
	str r4, [sp]
	str r4, [sp, #4]
	movs r0, #1
	movs r1, #1
	movs r2, #0
	movs r3, #0
	bl sub_807F448
	str r4, [sp]
	str r4, [sp, #4]
	movs r0, #2
	movs r1, #0
	movs r2, #0
	movs r3, #0
	bl sub_807F448
	add sp, #8
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_807F7EC
sub_807F7EC: @ 0x0807F7EC
	push {r4, r5, lr}
	movs r1, #0xc0
	str r1, [r0, #0x2c]
	movs r1, #0x98
	str r1, [r0, #0x30]
	adds r0, #0x4c
	movs r1, #0
	strh r1, [r0]
	ldr r0, _0807F884 @ =gUnk_081C6BAC
	ldr r1, _0807F888 @ =0x06005000
	bl Decompress
	ldr r0, _0807F88C @ =gUnk_081C6C34
	movs r1, #0x80
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r0, _0807F890 @ =gBg2Tm
	ldr r1, _0807F894 @ =gUnk_081C6E34
	movs r2, #0x85
	lsls r2, r2, #7
	bl TmApplyTsa_thm
	movs r0, #4
	bl EnableBgSync
	movs r0, #2
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	ldr r3, _0807F898 @ =gDispIo
	movs r0, #0x21
	rsbs r0, r0, #0
	ldrb r1, [r3, #1]
	ands r0, r1
	movs r1, #0x41
	rsbs r1, r1, #0
	ands r0, r1
	movs r1, #0x7f
	ands r0, r1
	movs r1, #0x80
	orrs r0, r1
	strb r0, [r3, #1]
	movs r2, #0x36
	adds r2, r2, r3
	mov ip, r2
	movs r1, #1
	ldrb r0, [r2]
	orrs r0, r1
	movs r5, #2
	orrs r0, r5
	movs r2, #5
	rsbs r2, r2, #0
	ands r0, r2
	movs r4, #8
	orrs r0, r4
	movs r2, #0x10
	orrs r0, r2
	mov r2, ip
	strb r0, [r2]
	adds r3, #0x37
	ldrb r0, [r3]
	orrs r1, r0
	orrs r1, r5
	movs r0, #4
	orrs r1, r0
	orrs r1, r4
	movs r0, #0x11
	rsbs r0, r0, #0
	ands r1, r0
	strb r1, [r3]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0807F884: .4byte gUnk_081C6BAC
_0807F888: .4byte 0x06005000
_0807F88C: .4byte gUnk_081C6C34
_0807F890: .4byte gBg2Tm
_0807F894: .4byte gUnk_081C6E34
_0807F898: .4byte gDispIo

	thumb_func_start sub_807F89C
sub_807F89C: @ 0x0807F89C
	push {r4, r5, lr}
	ldr r2, _0807F8D8 @ =gBmSt
	movs r3, #0xc
	ldrsh r1, [r2, r3]
	ldr r5, [r0, #0x2c]
	subs r5, r5, r1
	movs r3, #0xe
	ldrsh r1, [r2, r3]
	ldr r4, [r0, #0x30]
	subs r4, r4, r1
	adds r4, #8
	adds r0, #0x4c
	ldrh r1, [r0]
	adds r1, #2
	strh r1, [r0]
	ldrh r2, [r0]
	movs r0, #2
	movs r1, #0
	bl SetBgOffset
	movs r0, #0xd
	adds r1, r5, #0
	adds r2, r4, #0
	movs r3, #0x42
	bl sub_80266DC
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0807F8D8: .4byte gBmSt

	thumb_func_start sub_807F8DC
sub_807F8DC: @ 0x0807F8DC
	push {lr}
	ldr r0, _0807F8F0 @ =gBg2Tm
	movs r1, #0
	bl TmFill
	movs r0, #4
	bl EnableBgSync
	pop {r0}
	bx r0
	.align 2, 0
_0807F8F0: .4byte gBg2Tm

	thumb_func_start sub_807F8F4
sub_807F8F4: @ 0x0807F8F4
	push {lr}
	adds r1, r0, #0
	ldr r0, _0807F904 @ =gUnk_08D87F48
	bl Proc_Start
	pop {r0}
	bx r0
	.align 2, 0
_0807F904: .4byte gUnk_08D87F48

	thumb_func_start sub_807F908
sub_807F908: @ 0x0807F908
	push {lr}
	ldr r0, _0807F914 @ =gUnk_08D87F48
	bl Proc_EndEach
	pop {r0}
	bx r0
	.align 2, 0
_0807F914: .4byte gUnk_08D87F48

	thumb_func_start EventCall_Ch31x_NinianPrayEffect1
EventCall_Ch31x_NinianPrayEffect1: @ 0x0807F918
	push {r4, r5, lr}
	sub sp, #8
	movs r5, #1
	str r5, [sp]
	movs r4, #0
	str r4, [sp, #4]
	movs r0, #0
	movs r1, #0
	movs r2, #0
	movs r3, #0
	bl sub_807F448
	str r5, [sp]
	str r4, [sp, #4]
	movs r0, #1
	movs r1, #1
	movs r2, #0
	movs r3, #0
	bl sub_807F448
	str r5, [sp]
	str r4, [sp, #4]
	movs r0, #2
	movs r1, #0
	movs r2, #0
	movs r3, #0
	bl sub_807F448
	add sp, #8
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start sub_807F958
sub_807F958: @ 0x0807F958
	push {r4, r5, r6, lr}
	sub sp, #8
	adds r6, r0, #0
	movs r5, #2
	str r5, [sp]
	movs r4, #0
	str r4, [sp, #4]
	movs r0, #0
	movs r1, #0
	movs r2, #0
	movs r3, #0
	bl sub_807F448
	str r5, [sp]
	str r4, [sp, #4]
	movs r0, #1
	movs r1, #1
	movs r2, #0
	movs r3, #0
	bl sub_807F448
	str r5, [sp]
	str r4, [sp, #4]
	movs r0, #2
	movs r1, #0
	movs r2, #0
	movs r3, #0
	bl sub_807F448
	adds r0, r6, #0
	bl StartEventQuakefx
	add sp, #8
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	thumb_func_start sub_807F9A0
sub_807F9A0: @ 0x0807F9A0
	push {r4, r5, lr}
	sub sp, #8
	movs r5, #3
	str r5, [sp]
	movs r4, #0
	str r4, [sp, #4]
	movs r0, #1
	movs r1, #1
	movs r2, #0
	movs r3, #0
	bl sub_807F448
	str r5, [sp]
	str r4, [sp, #4]
	movs r0, #2
	movs r1, #0
	movs r2, #0
	movs r3, #0
	bl sub_807F448
	add sp, #8
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start sub_807F9D0
sub_807F9D0: @ 0x0807F9D0
	push {lr}
	sub sp, #8
	movs r0, #4
	str r0, [sp]
	movs r0, #0
	str r0, [sp, #4]
	movs r1, #0
	movs r2, #0
	movs r3, #0
	bl sub_807F448
	add sp, #8
	pop {r0}
	bx r0
