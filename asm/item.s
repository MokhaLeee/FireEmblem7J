	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08016470
sub_08016470: @ 0x08016470
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r6, r2, #0
	adds r7, r3, #0
	cmp r4, #0
	beq _0801648C
	ldr r0, _08016488 @ =0x08C0212C
	adds r1, r4, #0
	bl Proc_StartBlocking
	b _08016494
	.align 2, 0
_08016488: .4byte 0x08C0212C
_0801648C:
	ldr r0, _080164B4 @ =0x08C0212C
	movs r1, #3
	bl Proc_Start
_08016494:
	adds r3, r0, #0
	ldr r1, _080164B8 @ =0x0202BBB4
	ldrh r0, [r1, #0xc]
	movs r2, #0
	strh r0, [r3, #0x30]
	ldrh r0, [r1, #0xe]
	strh r0, [r3, #0x32]
	lsls r0, r5, #4
	strh r0, [r3, #0x2c]
	lsls r0, r6, #4
	strh r0, [r3, #0x2e]
	strh r7, [r3, #0x3a]
	str r2, [r3, #0x3c]
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080164B4: .4byte 0x08C0212C
_080164B8: .4byte 0x0202BBB4

	thumb_func_start GetItemHpBonus
GetItemHpBonus: @ 0x080164BC
	adds r1, r0, #0
	cmp r1, #0
	beq _080164D6
	movs r0, #0xff
	ands r0, r1
	lsls r1, r0, #3
	adds r1, r1, r0
	lsls r1, r1, #2
	ldr r0, _080164DC @ =0x08C51538
	adds r1, r1, r0
	ldr r0, [r1, #0xc]
	cmp r0, #0
	bne _080164E0
_080164D6:
	movs r0, #0
	b _080164E6
	.align 2, 0
_080164DC: .4byte 0x08C51538
_080164E0:
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
_080164E6:
	bx lr

	thumb_func_start sub_080164E8
sub_080164E8: @ 0x080164E8
	adds r1, r0, #0
	cmp r1, #0
	beq _08016502
	movs r0, #0xff
	ands r0, r1
	lsls r1, r0, #3
	adds r1, r1, r0
	lsls r1, r1, #2
	ldr r0, _08016508 @ =0x08C51538
	adds r1, r1, r0
	ldr r0, [r1, #0xc]
	cmp r0, #0
	bne _0801650C
_08016502:
	movs r0, #0
	b _08016512
	.align 2, 0
_08016508: .4byte 0x08C51538
_0801650C:
	ldrb r0, [r0, #1]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
_08016512:
	bx lr

	thumb_func_start sub_08016514
sub_08016514: @ 0x08016514
	adds r1, r0, #0
	cmp r1, #0
	beq _0801652E
	movs r0, #0xff
	ands r0, r1
	lsls r1, r0, #3
	adds r1, r1, r0
	lsls r1, r1, #2
	ldr r0, _08016534 @ =0x08C51538
	adds r1, r1, r0
	ldr r0, [r1, #0xc]
	cmp r0, #0
	bne _08016538
_0801652E:
	movs r0, #0
	b _0801653E
	.align 2, 0
_08016534: .4byte 0x08C51538
_08016538:
	ldrb r0, [r0, #2]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
_0801653E:
	bx lr

	thumb_func_start sub_08016540
sub_08016540: @ 0x08016540
	adds r1, r0, #0
	cmp r1, #0
	beq _0801655A
	movs r0, #0xff
	ands r0, r1
	lsls r1, r0, #3
	adds r1, r1, r0
	lsls r1, r1, #2
	ldr r0, _08016560 @ =0x08C51538
	adds r1, r1, r0
	ldr r0, [r1, #0xc]
	cmp r0, #0
	bne _08016564
_0801655A:
	movs r0, #0
	b _0801656A
	.align 2, 0
_08016560: .4byte 0x08C51538
_08016564:
	ldrb r0, [r0, #3]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
_0801656A:
	bx lr

	thumb_func_start sub_0801656C
sub_0801656C: @ 0x0801656C
	adds r1, r0, #0
	cmp r1, #0
	beq _08016586
	movs r0, #0xff
	ands r0, r1
	lsls r1, r0, #3
	adds r1, r1, r0
	lsls r1, r1, #2
	ldr r0, _0801658C @ =0x08C51538
	adds r1, r1, r0
	ldr r0, [r1, #0xc]
	cmp r0, #0
	bne _08016590
_08016586:
	movs r0, #0
	b _08016596
	.align 2, 0
_0801658C: .4byte 0x08C51538
_08016590:
	ldrb r0, [r0, #4]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
_08016596:
	bx lr

	thumb_func_start sub_08016598
sub_08016598: @ 0x08016598
	adds r1, r0, #0
	cmp r1, #0
	beq _080165B2
	movs r0, #0xff
	ands r0, r1
	lsls r1, r0, #3
	adds r1, r1, r0
	lsls r1, r1, #2
	ldr r0, _080165B8 @ =0x08C51538
	adds r1, r1, r0
	ldr r0, [r1, #0xc]
	cmp r0, #0
	bne _080165BC
_080165B2:
	movs r0, #0
	b _080165C2
	.align 2, 0
_080165B8: .4byte 0x08C51538
_080165BC:
	ldrb r0, [r0, #5]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
_080165C2:
	bx lr

	thumb_func_start sub_080165C4
sub_080165C4: @ 0x080165C4
	adds r1, r0, #0
	cmp r1, #0
	beq _080165DE
	movs r0, #0xff
	ands r0, r1
	lsls r1, r0, #3
	adds r1, r1, r0
	lsls r1, r1, #2
	ldr r0, _080165E4 @ =0x08C51538
	adds r1, r1, r0
	ldr r0, [r1, #0xc]
	cmp r0, #0
	bne _080165E8
_080165DE:
	movs r0, #0
	b _080165EE
	.align 2, 0
_080165E4: .4byte 0x08C51538
_080165E8:
	ldrb r0, [r0, #6]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
_080165EE:
	bx lr

	thumb_func_start MakeNewItem
MakeNewItem: @ 0x080165F0
	adds r2, r0, #0
	movs r0, #0xff
	ands r2, r0
	lsls r0, r2, #3
	adds r0, r0, r2
	lsls r0, r0, #2
	ldr r1, _0801661C @ =0x08C51538
	adds r3, r0, r1
	ldr r1, [r3, #8]
	movs r0, #8
	ands r1, r0
	movs r0, #0xff
	cmp r1, #0
	bne _0801660E
	ldrb r0, [r3, #0x14]
_0801660E:
	cmp r1, #0
	beq _08016614
	movs r0, #0
_08016614:
	lsls r0, r0, #8
	adds r0, r0, r2
	bx lr
	.align 2, 0
_0801661C: .4byte 0x08C51538

	thumb_func_start sub_08016620
sub_08016620: @ 0x08016620
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	cmp r5, #0
	bne _0801662C
	b _080167C2
_0801662C:
	movs r1, #0xff
	ands r1, r5
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _0801677C @ =0x08C51538
	adds r0, r0, r1
	ldr r2, [r0, #8]
	movs r0, #1
	ands r0, r2
	adds r3, r1, #0
	cmp r0, #0
	bne _08016648
	b _080167C2
_08016648:
	ldr r0, _08016780 @ =0x003D3C00
	ands r0, r2
	cmp r0, #0
	bne _08016652
	b _0801679C
_08016652:
	movs r0, #0x80
	lsls r0, r0, #4
	ands r2, r0
	cmp r2, #0
	beq _08016672
	ldr r0, [r4]
	ldr r1, [r4, #4]
	ldr r0, [r0, #0x28]
	ldr r1, [r1, #0x28]
	orrs r0, r1
	movs r1, #0x80
	lsls r1, r1, #9
	ands r0, r1
	cmp r0, #0
	bne _08016672
	b _080167C2
_08016672:
	movs r1, #0xff
	ands r1, r5
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r3
	ldr r0, [r0, #8]
	movs r1, #0x80
	lsls r1, r1, #0xb
	ands r0, r1
	cmp r0, #0
	beq _080166A0
	ldr r0, [r4]
	ldr r1, [r4, #4]
	ldr r0, [r0, #0x28]
	ldr r1, [r1, #0x28]
	orrs r0, r1
	movs r1, #0x80
	lsls r1, r1, #0x15
	ands r0, r1
	cmp r0, #0
	bne _080166A0
	b _080167C2
_080166A0:
	movs r1, #0xff
	ands r1, r5
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r3
	ldr r0, [r0, #8]
	movs r1, #0x80
	lsls r1, r1, #0xc
	ands r0, r1
	cmp r0, #0
	beq _080166CC
	ldr r0, [r4]
	ldr r1, [r4, #4]
	ldr r0, [r0, #0x28]
	ldr r1, [r1, #0x28]
	orrs r0, r1
	movs r1, #0x80
	lsls r1, r1, #0x16
	ands r0, r1
	cmp r0, #0
	beq _080167C2
_080166CC:
	movs r1, #0xff
	ands r1, r5
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r3
	ldr r0, [r0, #8]
	movs r1, #0x80
	lsls r1, r1, #0xd
	ands r0, r1
	cmp r0, #0
	beq _080166F8
	ldr r0, [r4]
	ldr r1, [r4, #4]
	ldr r0, [r0, #0x28]
	ldr r1, [r1, #0x28]
	orrs r0, r1
	movs r1, #0x80
	lsls r1, r1, #0x17
	ands r0, r1
	cmp r0, #0
	beq _080167C2
_080166F8:
	movs r1, #0xff
	ands r1, r5
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r3
	ldr r0, [r0, #8]
	movs r1, #0x80
	lsls r1, r1, #0xe
	ands r0, r1
	cmp r0, #0
	beq _0801671E
	ldr r0, [r4]
	ldr r1, [r4, #4]
	ldr r0, [r0, #0x28]
	ldr r1, [r1, #0x28]
	orrs r0, r1
	cmp r0, #0
	bge _080167C2
_0801671E:
	movs r1, #0xff
	ands r1, r5
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r3
	ldr r0, [r0, #8]
	movs r1, #0x80
	lsls r1, r1, #5
	ands r0, r1
	cmp r0, #0
	beq _0801674A
	ldr r0, [r4]
	ldr r1, [r4, #4]
	ldr r0, [r0, #0x28]
	ldr r1, [r1, #0x28]
	orrs r0, r1
	movs r1, #0x80
	lsls r1, r1, #0xa
	ands r0, r1
	cmp r0, #0
	beq _080167C2
_0801674A:
	movs r0, #0xff
	ands r0, r5
	lsls r1, r0, #3
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r3
	ldr r1, [r1, #8]
	movs r0, #0x80
	lsls r0, r0, #3
	ands r0, r1
	cmp r0, #0
	beq _08016784
	ldr r0, [r4]
	ldr r1, [r4, #4]
	ldr r0, [r0, #0x28]
	ldr r1, [r1, #0x28]
	orrs r0, r1
	movs r1, #0x80
	lsls r1, r1, #0xb
	ands r0, r1
	cmp r0, #0
	beq _080167C2
	movs r0, #1
	b _080167F4
	.align 2, 0
_0801677C: .4byte 0x08C51538
_08016780: .4byte 0x003D3C00
_08016784:
	movs r0, #0x80
	lsls r0, r0, #9
	ands r1, r0
	cmp r1, #0
	beq _0801679C
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_080175CC
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080167C2
_0801679C:
	adds r1, r4, #0
	adds r1, #0x30
	movs r0, #0xf
	ldrb r1, [r1]
	ands r0, r1
	ldr r3, _080167C8 @ =0x08C51538
	cmp r0, #3
	bne _080167CC
	movs r1, #0xff
	ands r1, r5
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r3
	ldr r0, [r0, #8]
	movs r1, #2
	ands r0, r1
	cmp r0, #0
	beq _080167CC
_080167C2:
	movs r0, #0
	b _080167F4
	.align 2, 0
_080167C8: .4byte 0x08C51538
_080167CC:
	movs r1, #0xff
	ands r1, r5
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r3
	ldrb r2, [r0, #0x1c]
	movs r1, #0xff
	cmp r5, #0
	beq _080167E2
	ldrb r1, [r0, #7]
_080167E2:
	adds r0, r4, #0
	adds r0, #0x28
	adds r0, r0, r1
	movs r1, #0
	ldrb r0, [r0]
	cmp r0, r2
	blt _080167F2
	movs r1, #1
_080167F2:
	adds r0, r1, #0
_080167F4:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_080167FC
sub_080167FC: @ 0x080167FC
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	cmp r4, #0
	beq _08016832
	movs r1, #0xff
	ands r1, r4
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _08016838 @ =0x08C51538
	adds r0, r0, r1
	ldr r1, [r0, #8]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _08016832
	movs r0, #2
	ands r1, r0
	cmp r1, #0
	beq _0801683C
	adds r0, r5, #0
	bl IsUnitMagicSealed
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0801683C
_08016832:
	movs r0, #0
	b _08016848
	.align 2, 0
_08016838: .4byte 0x08C51538
_0801683C:
	adds r0, r5, #0
	adds r1, r4, #0
	bl sub_08016620
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
_08016848:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_08016850
sub_08016850: @ 0x08016850
	adds r3, r0, #0
	cmp r1, #0
	beq _08016884
	movs r0, #0xff
	ands r0, r1
	lsls r1, r0, #3
	adds r1, r1, r0
	lsls r1, r1, #2
	ldr r0, _08016888 @ =0x08C51538
	adds r2, r1, r0
	ldr r0, [r2, #8]
	movs r1, #4
	ands r0, r1
	cmp r0, #0
	beq _08016884
	adds r0, r3, #0
	adds r0, #0x30
	movs r1, #0xf
	ldrb r0, [r0]
	ands r1, r0
	cmp r1, #2
	beq _08016884
	cmp r1, #4
	beq _08016884
	cmp r1, #3
	bne _0801688C
_08016884:
	movs r0, #0
	b _080168A2
	.align 2, 0
_08016888: .4byte 0x08C51538
_0801688C:
	adds r0, r3, #0
	adds r0, #0x28
	ldrb r1, [r2, #7]
	adds r0, r1, r0
	movs r1, #0
	ldrb r0, [r0]
	ldrb r2, [r2, #0x1c]
	cmp r0, r2
	blt _080168A0
	movs r1, #1
_080168A0:
	adds r0, r1, #0
_080168A2:
	bx lr

	thumb_func_start sub_080168A4
sub_080168A4: @ 0x080168A4
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	cmp r4, #0
	beq _080168E4
	movs r1, #0xff
	ands r1, r4
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _080168E0 @ =0x08C51538
	adds r0, r0, r1
	ldr r0, [r0, #8]
	movs r1, #4
	ands r0, r1
	cmp r0, #0
	beq _080168E4
	adds r0, r5, #0
	bl IsUnitMagicSealed
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080168E4
	adds r0, r5, #0
	adds r1, r4, #0
	bl sub_08016850
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	b _080168E6
	.align 2, 0
_080168E0: .4byte 0x08C51538
_080168E4:
	movs r0, #0
_080168E6:
	pop {r4, r5}
	pop {r1}
	bx r1

	thumb_func_start sub_080168EC
sub_080168EC: @ 0x080168EC
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r5, r0, #0
	adds r6, r1, #0
	adds r7, r3, #0
	movs r3, #0
	lsls r2, r2, #0x18
	asrs r2, r2, #0x18
	mov r8, r2
	cmp r2, #0
	bne _08016906
	movs r3, #1
_08016906:
	adds r0, r5, #0
	movs r1, #0
	adds r2, r3, #0
	bl sub_08005458
	movs r0, #0xff
	ands r0, r6
	lsls r1, r0, #3
	adds r1, r1, r0
	lsls r1, r1, #2
	ldr r0, _08016968 @ =0x08C51538
	adds r4, r1, r0
	ldrh r0, [r4]
	bl sub_08013318
	bl sub_08013488
	adds r1, r0, #0
	adds r0, r5, #0
	bl sub_080055DC
	adds r1, r7, #4
	adds r0, r5, #0
	bl sub_08005460
	adds r3, r7, #0
	adds r3, #0x16
	movs r5, #1
	mov r0, r8
	cmp r0, #0
	beq _08016946
	movs r5, #2
_08016946:
	ldr r0, [r4, #8]
	movs r1, #8
	ands r0, r1
	asrs r2, r6, #8
	cmp r0, #0
	beq _08016954
	movs r2, #0xff
_08016954:
	adds r0, r3, #0
	adds r1, r5, #0
	bl sub_08006074
	cmp r6, #0
	bne _0801696C
	movs r1, #1
	rsbs r1, r1, #0
	b _0801696E
	.align 2, 0
_08016968: .4byte 0x08C51538
_0801696C:
	ldrb r1, [r4, #0x1d]
_0801696E:
	movs r2, #0x80
	lsls r2, r2, #7
	adds r0, r7, #0
	bl sub_08004D04
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_08016984
sub_08016984: @ 0x08016984
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r4, r0, #0
	mov r8, r1
	adds r7, r3, #0
	movs r3, #0
	lsls r2, r2, #0x18
	asrs r6, r2, #0x18
	cmp r6, #0
	bne _0801699C
	movs r3, #1
_0801699C:
	adds r0, r4, #0
	movs r1, #0
	adds r2, r3, #0
	bl sub_08005458
	movs r0, #0xff
	mov r1, r8
	ands r0, r1
	lsls r1, r0, #3
	adds r1, r1, r0
	lsls r1, r1, #2
	ldr r0, _08016A30 @ =0x08C51538
	adds r5, r1, r0
	ldrh r0, [r5]
	bl sub_08013318
	bl sub_08013488
	adds r1, r0, #0
	adds r0, r4, #0
	bl sub_080055DC
	adds r1, r7, #4
	adds r0, r4, #0
	bl sub_08005460
	movs r3, #0x14
	adds r3, r3, r7
	mov ip, r3
	movs r1, #1
	cmp r6, #0
	beq _080169DE
	movs r1, #2
_080169DE:
	ldr r0, [r5, #8]
	movs r4, #8
	ands r0, r4
	mov r3, r8
	asrs r2, r3, #8
	cmp r0, #0
	beq _080169EE
	movs r2, #0xff
_080169EE:
	mov r0, ip
	bl sub_08006074
	adds r3, r7, #0
	adds r3, #0x1a
	movs r1, #1
	cmp r6, #0
	beq _08016A00
	movs r1, #2
_08016A00:
	ldr r0, [r5, #8]
	ands r0, r4
	movs r2, #0xff
	cmp r0, #0
	bne _08016A0C
	ldrb r2, [r5, #0x14]
_08016A0C:
	adds r0, r3, #0
	bl sub_08006074
	adds r0, r7, #0
	adds r0, #0x16
	movs r1, #0
	cmp r6, #0
	bne _08016A1E
	movs r1, #1
_08016A1E:
	movs r2, #0x16
	bl sub_08005FEC
	mov r0, r8
	cmp r0, #0
	bne _08016A34
	movs r1, #1
	rsbs r1, r1, #0
	b _08016A36
	.align 2, 0
_08016A30: .4byte 0x08C51538
_08016A34:
	ldrb r1, [r5, #0x1d]
_08016A36:
	movs r2, #0x80
	lsls r2, r2, #7
	adds r0, r7, #0
	bl sub_08004D04
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_08016A4C
sub_08016A4C: @ 0x08016A4C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r4, r0, #0
	adds r6, r1, #0
	adds r7, r2, #0
	movs r1, #0
	bl sub_08005444
	movs r0, #0xff
	ands r0, r6
	lsls r1, r0, #3
	adds r1, r1, r0
	lsls r1, r1, #2
	ldr r0, _08016AB4 @ =0x08C51538
	adds r5, r1, r0
	ldrh r0, [r5]
	bl sub_08013318
	bl sub_08013488
	adds r1, r0, #0
	adds r0, r4, #0
	bl sub_080055DC
	adds r1, r7, #4
	adds r0, r4, #0
	bl sub_08005460
	movs r0, #0x16
	adds r0, r0, r7
	mov r8, r0
	adds r0, r4, #0
	bl sub_08005454
	adds r3, r0, #0
	ldr r0, [r5, #8]
	movs r1, #8
	ands r0, r1
	asrs r2, r6, #8
	cmp r0, #0
	beq _08016AA2
	movs r2, #0xff
_08016AA2:
	mov r0, r8
	adds r1, r3, #0
	bl sub_08006074
	cmp r6, #0
	bne _08016AB8
	movs r1, #1
	rsbs r1, r1, #0
	b _08016ABA
	.align 2, 0
_08016AB4: .4byte 0x08C51538
_08016AB8:
	ldrb r1, [r5, #0x1d]
_08016ABA:
	movs r2, #0x80
	lsls r2, r2, #7
	adds r0, r7, #0
	bl sub_08004D04
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_08016AD0
sub_08016AD0: @ 0x08016AD0
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	mov r8, r0
	mov sb, r1
	adds r5, r2, #0
	adds r7, r3, #0
	bl sub_080053B0
	adds r4, r5, #0
	mov r0, r8
	adds r1, r4, #0
	bl sub_08005450
	movs r0, #0xff
	mov r1, sb
	ands r0, r1
	lsls r1, r0, #3
	adds r1, r1, r0
	lsls r1, r1, #2
	ldr r0, _08016B74 @ =0x08C51538
	adds r6, r1, r0
	ldrh r0, [r6]
	bl sub_08013318
	bl sub_08013488
	adds r1, r0, #0
	mov r0, r8
	bl sub_080055DC
	movs r4, #0
	cmp r5, #1
	bne _08016B18
	movs r4, #1
_08016B18:
	adds r0, r7, #0
	adds r0, #0x18
	adds r1, r4, #0
	movs r2, #0x16
	bl sub_08005FEC
	movs r4, #1
	cmp r5, #1
	beq _08016B2C
	movs r4, #2
_08016B2C:
	adds r1, r7, #0
	adds r1, #0x16
	ldr r0, [r6, #8]
	movs r5, #8
	ands r0, r5
	mov r3, sb
	asrs r2, r3, #8
	cmp r0, #0
	beq _08016B40
	movs r2, #0xff
_08016B40:
	adds r0, r1, #0
	adds r1, r4, #0
	bl sub_08006074
	adds r1, r7, #0
	adds r1, #0x1c
	ldr r0, [r6, #8]
	ands r0, r5
	movs r2, #0xff
	cmp r0, #0
	bne _08016B58
	ldrb r2, [r6, #0x14]
_08016B58:
	adds r0, r1, #0
	adds r1, r4, #0
	bl sub_08006074
	adds r1, r7, #4
	mov r0, r8
	bl sub_08005460
	mov r0, sb
	cmp r0, #0
	bne _08016B78
	movs r1, #1
	rsbs r1, r1, #0
	b _08016B7A
	.align 2, 0
_08016B74: .4byte 0x08C51538
_08016B78:
	ldrb r1, [r6, #0x1d]
_08016B7A:
	movs r2, #0x80
	lsls r2, r2, #7
	adds r0, r7, #0
	bl sub_08004D04
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_08016B90
sub_08016B90: @ 0x08016B90
	adds r2, r0, #0
	movs r1, #0xff
	ands r1, r2
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _08016BB8 @ =0x08C51538
	adds r0, r0, r1
	ldr r0, [r0, #8]
	movs r1, #8
	ands r0, r1
	cmp r0, #0
	bne _08016BB2
	ldr r0, _08016BBC @ =0xFFFFFF00
	adds r2, r2, r0
	cmp r2, #0xff
	ble _08016BC0
_08016BB2:
	lsls r0, r2, #0x10
	lsrs r0, r0, #0x10
	b _08016BC2
	.align 2, 0
_08016BB8: .4byte 0x08C51538
_08016BBC: .4byte 0xFFFFFF00
_08016BC0:
	movs r0, #0
_08016BC2:
	bx lr

	thumb_func_start GetUnitEquippedWeapon
GetUnitEquippedWeapon: @ 0x08016BC4
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	movs r5, #0
_08016BCA:
	lsls r1, r5, #1
	adds r0, r6, #0
	adds r0, #0x1e
	adds r4, r0, r1
	ldrh r1, [r4]
	adds r0, r6, #0
	bl sub_08016620
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne _08016BE6
	ldrh r0, [r4]
	b _08016BEE
_08016BE6:
	adds r5, #1
	cmp r5, #4
	ble _08016BCA
	movs r0, #0
_08016BEE:
	pop {r4, r5, r6}
	pop {r1}
	bx r1

	thumb_func_start GetUnitEquippedWeaponSlot
GetUnitEquippedWeaponSlot: @ 0x08016BF4
	push {r4, r5, lr}
	adds r5, r0, #0
	movs r4, #0
_08016BFA:
	lsls r1, r4, #1
	adds r0, r5, #0
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r1, [r0]
	adds r0, r5, #0
	bl sub_080167FC
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne _08016C16
	adds r0, r4, #0
	b _08016C20
_08016C16:
	adds r4, #1
	cmp r4, #4
	ble _08016BFA
	movs r0, #1
	rsbs r0, r0, #0
_08016C20:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_08016C28
sub_08016C28: @ 0x08016C28
	adds r3, r1, #0
	movs r1, #0xff
	ands r0, r1
	lsls r1, r0, #3
	adds r1, r1, r0
	lsls r1, r1, #2
	ldr r0, _08016C4C @ =0x08C51538
	adds r1, r1, r0
	ldrb r0, [r1, #0x19]
	lsrs r1, r0, #4
	movs r2, #0xf
	ands r2, r0
	cmp r1, r3
	bgt _08016C50
	cmp r3, r2
	bgt _08016C50
	movs r0, #1
	b _08016C52
	.align 2, 0
_08016C4C: .4byte 0x08C51538
_08016C50:
	movs r0, #0
_08016C52:
	bx lr

	thumb_func_start sub_08016C54
sub_08016C54: @ 0x08016C54
	push {r4, r5, lr}
	adds r3, r0, #0
	lsls r4, r1, #1
	adds r0, #0x1e
	adds r0, r0, r4
	ldrh r5, [r0]
	adds r2, r1, #0
	cmp r2, #0
	beq _08016C78
	adds r0, r4, #0
	adds r0, #0x1c
	adds r1, r0, r3
_08016C6C:
	ldrh r0, [r1]
	strh r0, [r1, #2]
	subs r1, #2
	subs r2, #1
	cmp r2, #0
	bne _08016C6C
_08016C78:
	strh r5, [r3, #0x1e]
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start sub_08016C80
sub_08016C80: @ 0x08016C80
	push {r4, r5, r6, r7, lr}
	adds r7, r1, #0
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	ldr r0, [r7, #4]
	ldrb r3, [r0, #4]
	movs r1, #0xff
	ands r1, r4
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _08016CA4 @ =0x08C51538
	adds r0, r0, r1
	ldr r2, [r0, #0x10]
	adds r5, r1, #0
	cmp r2, #0
	beq _08016D04
	b _08016CB0
	.align 2, 0
_08016CA4: .4byte 0x08C51538
_08016CA8:
	ldrb r0, [r2]
	cmp r0, r3
	beq _08016CB8
	adds r2, #1
_08016CB0:
	ldrb r0, [r2]
	cmp r0, #0
	bne _08016CA8
	b _08016D04
_08016CB8:
	movs r1, #0xff
	ands r1, r4
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r5
	ldr r1, [r0, #0x10]
	ldr r0, _08016D00 @ =0x08D5FB8A
	cmp r1, r0
	bne _08016CFA
	movs r3, #0
	movs r6, #0xff
	adds r2, r7, #0
	adds r2, #0x1e
	movs r4, #4
_08016CD6:
	adds r0, r6, #0
	ldrh r1, [r2]
	ands r0, r1
	lsls r1, r0, #3
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r5
	ldr r0, [r1, #8]
	orrs r3, r0
	adds r2, #2
	subs r4, #1
	cmp r4, #0
	bge _08016CD6
	movs r0, #0x80
	lsls r0, r0, #7
	ands r3, r0
	cmp r3, #0
	bne _08016D04
_08016CFA:
	movs r0, #1
	b _08016D06
	.align 2, 0
_08016D00: .4byte 0x08D5FB8A
_08016D04:
	movs r0, #0
_08016D06:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	thumb_func_start sub_08016D0C
sub_08016D0C: @ 0x08016D0C
	push {r4, r5, lr}
	sub sp, #0x28
	mov r2, sp
	ldr r1, _08016D4C @ =0x081C9108
	ldm r1!, {r3, r4, r5}
	stm r2!, {r3, r4, r5}
	ldm r1!, {r3, r4, r5}
	stm r2!, {r3, r4, r5}
	ldm r1!, {r3, r4, r5}
	stm r2!, {r3, r4, r5}
	ldr r1, [r1]
	str r1, [r2]
	movs r1, #0xff
	ands r0, r1
	lsls r1, r0, #3
	adds r1, r1, r0
	lsls r1, r1, #2
	ldr r0, _08016D50 @ =0x08C51538
	adds r1, r1, r0
	ldrb r0, [r1, #0x19]
	adds r1, r0, #0
	cmp r0, #0x22
	beq _08016D86
	cmp r0, #0x22
	bgt _08016D5E
	cmp r0, #0x11
	beq _08016D7A
	cmp r0, #0x11
	bgt _08016D54
	cmp r0, #0x10
	beq _08016D76
	b _08016D9A
	.align 2, 0
_08016D4C: .4byte 0x081C9108
_08016D50: .4byte 0x08C51538
_08016D54:
	cmp r0, #0x12
	beq _08016D7E
	cmp r0, #0x13
	beq _08016D82
	b _08016D9A
_08016D5E:
	cmp r0, #0x3a
	beq _08016D8E
	cmp r0, #0x3a
	bgt _08016D6C
	cmp r0, #0x23
	beq _08016D8A
	b _08016D9A
_08016D6C:
	cmp r1, #0x3f
	beq _08016D92
	cmp r1, #0xff
	beq _08016D96
	b _08016D9A
_08016D76:
	ldr r0, [sp]
	b _08016D9C
_08016D7A:
	ldr r0, [sp, #4]
	b _08016D9C
_08016D7E:
	ldr r0, [sp, #8]
	b _08016D9C
_08016D82:
	ldr r0, [sp, #0xc]
	b _08016D9C
_08016D86:
	ldr r0, [sp, #0x10]
	b _08016D9C
_08016D8A:
	ldr r0, [sp, #0x14]
	b _08016D9C
_08016D8E:
	ldr r0, [sp, #0x18]
	b _08016D9C
_08016D92:
	ldr r0, [sp, #0x1c]
	b _08016D9C
_08016D96:
	ldr r0, [sp, #0x20]
	b _08016D9C
_08016D9A:
	ldr r0, [sp, #0x24]
_08016D9C:
	add sp, #0x28
	pop {r4, r5}
	pop {r1}
	bx r1

	thumb_func_start sub_08016DA4
sub_08016DA4: @ 0x08016DA4
	cmp r0, #0
	bgt _08016DAC
	movs r0, #0
	b _08016DD6
_08016DAC:
	cmp r0, #0x1e
	bgt _08016DB4
	movs r0, #1
	b _08016DD6
_08016DB4:
	cmp r0, #0x46
	bgt _08016DBC
	movs r0, #2
	b _08016DD6
_08016DBC:
	cmp r0, #0x78
	bgt _08016DC4
	movs r0, #3
	b _08016DD6
_08016DC4:
	cmp r0, #0xb4
	bgt _08016DCC
	movs r0, #4
	b _08016DD6
_08016DCC:
	cmp r0, #0xfa
	ble _08016DD4
	movs r0, #6
	b _08016DD6
_08016DD4:
	movs r0, #5
_08016DD6:
	bx lr

	thumb_func_start sub_08016DD8
sub_08016DD8: @ 0x08016DD8
	push {r4, r5, lr}
	sub sp, #0x20
	mov r2, sp
	ldr r1, _08016E14 @ =0x081C9150
	ldm r1!, {r3, r4, r5}
	stm r2!, {r3, r4, r5}
	ldm r1!, {r3, r4, r5}
	stm r2!, {r3, r4, r5}
	ldm r1!, {r3, r4}
	stm r2!, {r3, r4}
	movs r1, #0xff
	ands r0, r1
	lsls r1, r0, #3
	adds r1, r1, r0
	lsls r1, r1, #2
	ldr r0, _08016E18 @ =0x08C51538
	adds r1, r1, r0
	ldrb r4, [r1, #0x1c]
	ldr r0, [r1, #8]
	ldr r1, _08016E1C @ =0x003D3C00
	ands r0, r1
	cmp r0, #0
	beq _08016E20
	adds r0, r4, #0
	bl sub_08016DA4
	cmp r0, #0
	bne _08016E20
	movs r4, #7
	b _08016E28
	.align 2, 0
_08016E14: .4byte 0x081C9150
_08016E18: .4byte 0x08C51538
_08016E1C: .4byte 0x003D3C00
_08016E20:
	adds r0, r4, #0
	bl sub_08016DA4
	adds r4, r0, #0
_08016E28:
	lsls r0, r4, #2
	add r0, sp
	ldr r0, [r0]
	add sp, #0x20
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_08016E38
sub_08016E38: @ 0x08016E38
	push {r4, lr}
	sub sp, #8
	adds r4, r0, #0
	ldr r1, _08016E5C @ =0x081C9170
	mov r0, sp
	movs r2, #7
	bl memcpy
	adds r0, r4, #0
	bl sub_08016DA4
	add r0, sp
	ldrb r0, [r0]
	add sp, #8
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08016E5C: .4byte 0x081C9170

	thumb_func_start sub_08016E60
sub_08016E60: @ 0x08016E60
	push {r4, r5, lr}
	sub sp, #0x2c
	mov r2, sp
	ldr r1, _08016E88 @ =0x081C91A4
	ldm r1!, {r3, r4, r5}
	stm r2!, {r3, r4, r5}
	ldm r1!, {r3, r4, r5}
	stm r2!, {r3, r4, r5}
	ldm r1!, {r3, r4, r5}
	stm r2!, {r3, r4, r5}
	ldm r1!, {r3, r4}
	stm r2!, {r3, r4}
	lsls r0, r0, #2
	add r0, sp
	ldr r0, [r0]
	add sp, #0x2c
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_08016E88: .4byte 0x081C91A4

	thumb_func_start sub_08016E8C
sub_08016E8C: @ 0x08016E8C
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	adds r6, r2, #0
	bl sub_08016DA4
	cmp r0, #6
	bhi _08016EFE
	lsls r0, r0, #2
	ldr r1, _08016EA8 @ =_08016EAC
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08016EA8: .4byte _08016EAC
_08016EAC: @ jump table
	.4byte _08016EF8 @ case 0
	.4byte _08016EC8 @ case 1
	.4byte _08016ED0 @ case 2
	.4byte _08016EDA @ case 3
	.4byte _08016EE4 @ case 4
	.4byte _08016EEE @ case 5
	.4byte _08016EF8 @ case 6
_08016EC8:
	subs r0, r5, #1
	str r0, [r4]
	movs r0, #0x1e
	b _08016EFC
_08016ED0:
	adds r0, r5, #0
	subs r0, #0x1f
	str r0, [r4]
	movs r0, #0x28
	b _08016EFC
_08016EDA:
	adds r0, r5, #0
	subs r0, #0x47
	str r0, [r4]
	movs r0, #0x32
	b _08016EFC
_08016EE4:
	adds r0, r5, #0
	subs r0, #0x79
	str r0, [r4]
	movs r0, #0x3c
	b _08016EFC
_08016EEE:
	adds r0, r5, #0
	subs r0, #0xb5
	str r0, [r4]
	movs r0, #0x46
	b _08016EFC
_08016EF8:
	movs r0, #0
	str r0, [r4]
_08016EFC:
	str r0, [r6]
_08016EFE:
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	thumb_func_start sub_08016F04
sub_08016F04: @ 0x08016F04
	push {r4, r5, lr}
	adds r3, r0, #0
	adds r2, r1, #0
	movs r5, #0xff
	ands r5, r2
	lsls r0, r5, #3
	adds r0, r0, r5
	lsls r0, r0, #2
	ldr r1, _08016F2C @ =0x08C51538
	adds r4, r0, r1
	ldr r1, [r4, #8]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _08016F30
	adds r0, r3, #0
	adds r1, r2, #0
	bl sub_08016620
	b _08016F40
	.align 2, 0
_08016F2C: .4byte 0x08C51538
_08016F30:
	movs r0, #4
	ands r1, r0
	cmp r1, #0
	beq _08016F46
	adds r0, r3, #0
	adds r1, r2, #0
	bl sub_08016850
_08016F40:
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	b _08016F7A
_08016F46:
	ldrb r0, [r4, #0x1e]
	cmp r0, #0
	beq _08016F78
	adds r0, r3, #0
	adds r0, #0x30
	movs r1, #0xf
	ldrb r0, [r0]
	ands r1, r0
	cmp r1, #2
	beq _08016F74
	cmp r1, #4
	beq _08016F74
	ldr r0, [r3]
	ldr r1, [r3, #4]
	ldr r0, [r0, #0x28]
	ldr r1, [r1, #0x28]
	orrs r0, r1
	movs r1, #8
	ands r0, r1
	cmp r0, #0
	bne _08016F78
	cmp r5, #0x6a
	bne _08016F78
_08016F74:
	movs r0, #0
	b _08016F7A
_08016F78:
	movs r0, #1
_08016F7A:
	pop {r4, r5}
	pop {r1}
	bx r1

	thumb_func_start sub_08016F80
sub_08016F80: @ 0x08016F80
	push {lr}
	adds r3, r0, #0
	adds r2, r1, #0
	movs r1, #0xff
	ands r1, r2
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _08016FA8 @ =0x08C51538
	adds r0, r0, r1
	ldr r0, [r0, #8]
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	bne _08016FAC
	adds r0, r3, #0
	adds r1, r2, #0
	bl CanUnitUseItem
	b _08016FB4
	.align 2, 0
_08016FA8: .4byte 0x08C51538
_08016FAC:
	adds r0, r3, #0
	adds r1, r2, #0
	bl sub_08016620
_08016FB4:
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	pop {r1}
	bx r1

	thumb_func_start sub_08016FBC
sub_08016FBC: @ 0x08016FBC
	push {r4, lr}
	adds r3, r0, #0
	adds r2, r1, #0
	movs r4, #0
	movs r0, #0xff
	ands r0, r2
	subs r0, #0x4a
	cmp r0, #0x50
	bls _08016FD0
	b _0801712E
_08016FD0:
	lsls r0, r0, #2
	ldr r1, _08016FDC @ =_08016FE0
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08016FDC: .4byte _08016FE0
_08016FE0: @ jump table
	.4byte _08017124 @ case 0
	.4byte _08017128 @ case 1
	.4byte _0801712C @ case 2
	.4byte _08017124 @ case 3
	.4byte _08017124 @ case 4
	.4byte _0801712E @ case 5
	.4byte _0801712E @ case 6
	.4byte _0801712E @ case 7
	.4byte _0801712E @ case 8
	.4byte _0801712E @ case 9
	.4byte _0801712E @ case 10
	.4byte _0801712E @ case 11
	.4byte _0801712E @ case 12
	.4byte _0801712E @ case 13
	.4byte _0801712E @ case 14
	.4byte _0801712E @ case 15
	.4byte _0801712E @ case 16
	.4byte _0801712E @ case 17
	.4byte _0801712E @ case 18
	.4byte _0801712E @ case 19
	.4byte _0801712E @ case 20
	.4byte _0801712E @ case 21
	.4byte _0801712E @ case 22
	.4byte _0801712E @ case 23
	.4byte _0801712E @ case 24
	.4byte _0801712E @ case 25
	.4byte _0801712E @ case 26
	.4byte _0801712E @ case 27
	.4byte _0801712E @ case 28
	.4byte _0801712E @ case 29
	.4byte _0801712E @ case 30
	.4byte _0801712E @ case 31
	.4byte _0801712E @ case 32
	.4byte _08017124 @ case 33
	.4byte _0801712C @ case 34
	.4byte _0801712E @ case 35
	.4byte _0801712E @ case 36
	.4byte _0801712E @ case 37
	.4byte _0801712E @ case 38
	.4byte _0801712E @ case 39
	.4byte _0801712E @ case 40
	.4byte _0801712E @ case 41
	.4byte _0801712E @ case 42
	.4byte _0801712E @ case 43
	.4byte _0801712E @ case 44
	.4byte _0801712E @ case 45
	.4byte _0801712E @ case 46
	.4byte _0801712E @ case 47
	.4byte _0801712E @ case 48
	.4byte _0801712E @ case 49
	.4byte _0801712E @ case 50
	.4byte _0801712E @ case 51
	.4byte _0801712E @ case 52
	.4byte _0801712E @ case 53
	.4byte _0801712E @ case 54
	.4byte _0801712E @ case 55
	.4byte _0801712E @ case 56
	.4byte _0801712E @ case 57
	.4byte _0801712E @ case 58
	.4byte _0801712E @ case 59
	.4byte _0801712E @ case 60
	.4byte _0801712E @ case 61
	.4byte _0801712E @ case 62
	.4byte _0801712E @ case 63
	.4byte _0801712E @ case 64
	.4byte _0801712E @ case 65
	.4byte _0801712E @ case 66
	.4byte _0801712E @ case 67
	.4byte _0801712E @ case 68
	.4byte _0801712E @ case 69
	.4byte _0801712E @ case 70
	.4byte _0801712E @ case 71
	.4byte _0801712E @ case 72
	.4byte _0801712E @ case 73
	.4byte _0801712E @ case 74
	.4byte _0801712E @ case 75
	.4byte _0801712E @ case 76
	.4byte _0801712E @ case 77
	.4byte _0801712E @ case 78
	.4byte _0801712E @ case 79
	.4byte _08017124 @ case 80
_08017124:
	movs r4, #0xa
	b _0801712E
_08017128:
	movs r4, #0x14
	b _0801712E
_0801712C:
	movs r4, #0x50
_0801712E:
	movs r1, #0xff
	ands r1, r2
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _0801715C @ =0x08C51538
	adds r0, r0, r1
	ldr r0, [r0, #8]
	movs r1, #4
	ands r0, r1
	cmp r0, #0
	beq _08017154
	adds r0, r3, #0
	bl sub_08018EC0
	adds r4, r4, r0
	cmp r4, #0x50
	ble _08017154
	movs r4, #0x50
_08017154:
	adds r0, r4, #0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0801715C: .4byte 0x08C51538

	thumb_func_start sub_08017160
sub_08017160: @ 0x08017160
	push {r4, r5, lr}
	movs r3, #0
	movs r4, #0xff
	adds r2, r0, #0
	adds r2, #0x1e
_0801716A:
	adds r0, r4, #0
	ldrh r5, [r2]
	ands r0, r5
	cmp r0, r1
	bne _08017178
	adds r0, r3, #0
	b _08017184
_08017178:
	adds r2, #2
	adds r3, #1
	cmp r3, #4
	ble _0801716A
	movs r0, #1
	rsbs r0, r0, #0
_08017184:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_0801718C
sub_0801718C: @ 0x0801718C
	adds r1, r0, #0
	cmp r1, #0
	bne _08017196
	movs r1, #0xff
	b _080171A6
_08017196:
	movs r0, #0xff
	ands r0, r1
	lsls r1, r0, #3
	adds r1, r1, r0
	lsls r1, r1, #2
	ldr r0, _080171B0 @ =0x08C51538
	adds r1, r1, r0
	ldrb r1, [r1, #7]
_080171A6:
	movs r0, #0
	cmp r1, #9
	bne _080171AE
	movs r0, #1
_080171AE:
	bx lr
	.align 2, 0
_080171B0: .4byte 0x08C51538

	thumb_func_start sub_080171B4
sub_080171B4: @ 0x080171B4
	push {r4, lr}
	adds r4, r0, #0
	cmp r4, #0
	beq _08017200
	movs r0, #0xff
	ands r0, r4
	lsls r1, r0, #3
	adds r1, r1, r0
	lsls r1, r1, #2
	ldr r0, _080171FC @ =0x08C51538
	adds r1, r1, r0
	ldr r2, [r1, #8]
	movs r0, #5
	ands r0, r2
	cmp r0, #0
	beq _08017200
	movs r0, #0xc1
	lsls r0, r0, #3
	ands r0, r2
	cmp r0, #0
	bne _08017200
	movs r3, #8
	ands r3, r2
	asrs r0, r4, #8
	cmp r3, #0
	beq _080171EA
	movs r0, #0xff
_080171EA:
	movs r2, #0xff
	cmp r3, #0
	bne _080171F2
	ldrb r2, [r1, #0x14]
_080171F2:
	cmp r0, r2
	beq _08017200
	movs r0, #1
	b _08017202
	.align 2, 0
_080171FC: .4byte 0x08C51538
_08017200:
	movs r0, #0
_08017202:
	pop {r4}
	pop {r1}
	bx r1

	thumb_func_start sub_08017208
sub_08017208: @ 0x08017208
	movs r1, #0xff
	ands r0, r1
	lsls r1, r0, #3
	adds r1, r1, r0
	lsls r1, r1, #2
	ldr r0, _08017228 @ =0x08C51538
	adds r1, r1, r0
	ldrb r0, [r1, #0x19]
	subs r0, #0x11
	cmp r0, #0x2e
	bhi _0801730C
	lsls r0, r0, #2
	ldr r1, _0801722C @ =_08017230
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08017228: .4byte 0x08C51538
_0801722C: .4byte _08017230
_08017230: @ jump table
	.4byte _080172EC @ case 0
	.4byte _080172F0 @ case 1
	.4byte _080172F4 @ case 2
	.4byte _0801730C @ case 3
	.4byte _0801730C @ case 4
	.4byte _0801730C @ case 5
	.4byte _0801730C @ case 6
	.4byte _0801730C @ case 7
	.4byte _0801730C @ case 8
	.4byte _0801730C @ case 9
	.4byte _0801730C @ case 10
	.4byte _0801730C @ case 11
	.4byte _0801730C @ case 12
	.4byte _0801730C @ case 13
	.4byte _0801730C @ case 14
	.4byte _0801730C @ case 15
	.4byte _0801730C @ case 16
	.4byte _080172F8 @ case 17
	.4byte _080172FC @ case 18
	.4byte _0801730C @ case 19
	.4byte _0801730C @ case 20
	.4byte _0801730C @ case 21
	.4byte _0801730C @ case 22
	.4byte _0801730C @ case 23
	.4byte _0801730C @ case 24
	.4byte _0801730C @ case 25
	.4byte _0801730C @ case 26
	.4byte _0801730C @ case 27
	.4byte _0801730C @ case 28
	.4byte _0801730C @ case 29
	.4byte _0801730C @ case 30
	.4byte _0801730C @ case 31
	.4byte _0801730C @ case 32
	.4byte _0801730C @ case 33
	.4byte _08017300 @ case 34
	.4byte _0801730C @ case 35
	.4byte _0801730C @ case 36
	.4byte _0801730C @ case 37
	.4byte _0801730C @ case 38
	.4byte _0801730C @ case 39
	.4byte _0801730C @ case 40
	.4byte _08017304 @ case 41
	.4byte _0801730C @ case 42
	.4byte _0801730C @ case 43
	.4byte _0801730C @ case 44
	.4byte _0801730C @ case 45
	.4byte _08017308 @ case 46
_080172EC:
	movs r0, #1
	b _0801730E
_080172F0:
	movs r0, #3
	b _0801730E
_080172F4:
	movs r0, #7
	b _0801730E
_080172F8:
	movs r0, #2
	b _0801730E
_080172FC:
	movs r0, #6
	b _0801730E
_08017300:
	movs r0, #4
	b _0801730E
_08017304:
	movs r0, #0xc
	b _0801730E
_08017308:
	movs r0, #0x14
	b _0801730E
_0801730C:
	movs r0, #0
_0801730E:
	bx lr

	thumb_func_start sub_08017310
sub_08017310: @ 0x08017310
	push {r4, r5, r6, r7, lr}
	adds r6, r0, #0
	movs r7, #0
	cmp r1, #0
	blt _08017328
	lsls r1, r1, #1
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r0, [r0]
	bl sub_08017208
	b _0801735C
_08017328:
	movs r5, #0
	ldrh r4, [r6, #0x1e]
	cmp r4, #0
	beq _0801735A
_08017330:
	adds r0, r6, #0
	adds r1, r4, #0
	bl sub_08016620
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08017346
	adds r0, r4, #0
	bl sub_08017208
	orrs r7, r0
_08017346:
	adds r5, #1
	cmp r5, #4
	bgt _0801735A
	lsls r1, r5, #1
	adds r0, r6, #0
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r4, [r0]
	cmp r4, #0
	bne _08017330
_0801735A:
	adds r0, r7, #0
_0801735C:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_08017364
sub_08017364: @ 0x08017364
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	movs r6, #0
	cmp r1, #0
	blt _080173A8
	lsls r0, r1, #1
	adds r1, r5, #0
	adds r1, #0x1e
	adds r1, r1, r0
	ldrh r4, [r1]
	adds r0, r5, #0
	adds r1, r4, #0
	bl CanUnitUseItem
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08017416
	movs r0, #0xff
	ands r0, r4
	lsls r1, r0, #3
	adds r1, r1, r0
	lsls r1, r1, #2
	ldr r0, _080173A4 @ =0x08C51538
	adds r1, r1, r0
	movs r6, #0xf
	ldrb r1, [r1, #0x19]
	ands r6, r1
	cmp r6, #0
	bne _080173F2
	movs r6, #0x63
	b _080173F2
	.align 2, 0
_080173A4: .4byte 0x08C51538
_080173A8:
	movs r7, #0
	ldrh r4, [r5, #0x1e]
	cmp r4, #0
	beq _080173F2
_080173B0:
	adds r0, r5, #0
	adds r1, r4, #0
	bl CanUnitUseItem
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080173DE
	movs r0, #0xff
	ands r0, r4
	lsls r1, r0, #3
	adds r1, r1, r0
	lsls r1, r1, #2
	ldr r0, _08017400 @ =0x08C51538
	adds r1, r1, r0
	movs r4, #0xf
	ldrb r1, [r1, #0x19]
	ands r4, r1
	cmp r4, #0
	bne _080173D8
	movs r4, #0x63
_080173D8:
	cmp r6, r4
	bge _080173DE
	adds r6, r4, #0
_080173DE:
	adds r7, #1
	cmp r7, #4
	bgt _080173F2
	lsls r1, r7, #1
	adds r0, r5, #0
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r4, [r0]
	cmp r4, #0
	bne _080173B0
_080173F2:
	cmp r6, #2
	beq _0801740E
	cmp r6, #2
	bgt _08017404
	cmp r6, #1
	beq _0801740A
	b _08017416
	.align 2, 0
_08017400: .4byte 0x08C51538
_08017404:
	cmp r6, #0x63
	beq _08017412
	b _08017416
_0801740A:
	movs r0, #1
	b _08017418
_0801740E:
	movs r0, #3
	b _08017418
_08017412:
	movs r0, #0x20
	b _08017418
_08017416:
	movs r0, #0
_08017418:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_08017420
sub_08017420: @ 0x08017420
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	movs r6, #0
	movs r5, #0
	ldrh r4, [r7, #0x1e]
	cmp r4, #0
	beq _08017470
_0801742E:
	adds r0, r7, #0
	adds r1, r4, #0
	bl sub_08016850
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0801745C
	movs r0, #0xff
	ands r0, r4
	lsls r1, r0, #3
	adds r1, r1, r0
	lsls r1, r1, #2
	ldr r0, _08017480 @ =0x08C51538
	adds r1, r1, r0
	movs r4, #0xf
	ldrb r1, [r1, #0x19]
	ands r4, r1
	cmp r4, #0
	bne _08017456
	movs r4, #0x63
_08017456:
	cmp r6, r4
	bge _0801745C
	adds r6, r4, #0
_0801745C:
	adds r5, #1
	cmp r5, #4
	bgt _08017470
	lsls r1, r5, #1
	adds r0, r7, #0
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r4, [r0]
	cmp r4, #0
	bne _0801742E
_08017470:
	cmp r6, #2
	beq _0801748E
	cmp r6, #2
	bgt _08017484
	cmp r6, #1
	beq _0801748A
	b _08017496
	.align 2, 0
_08017480: .4byte 0x08C51538
_08017484:
	cmp r6, #0x63
	beq _08017492
	b _08017496
_0801748A:
	movs r0, #1
	b _08017498
_0801748E:
	movs r0, #3
	b _08017498
_08017492:
	movs r0, #0x20
	b _08017498
_08017496:
	movs r0, #0
_08017498:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_080174A0
sub_080174A0: @ 0x080174A0
	push {r4, r5, r6, r7, lr}
	movs r6, #0
	bl sub_0802EBCC
	adds r3, r0, #0
	movs r5, #0
	ldrh r0, [r3]
	cmp r0, #0
	beq _080174EA
	ldr r7, _080174D0 @ =0x08C51538
_080174B4:
	ldrh r4, [r3]
	ldrb r1, [r3]
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r2, r0, r7
	ldr r0, [r2, #8]
	movs r1, #8
	ands r0, r1
	cmp r0, #0
	beq _080174D4
	ldrh r0, [r2, #0x1a]
	b _080174DA
	.align 2, 0
_080174D0: .4byte 0x08C51538
_080174D4:
	asrs r0, r4, #8
	ldrh r2, [r2, #0x1a]
	muls r0, r2, r0
_080174DA:
	adds r6, r6, r0
	adds r3, #2
	adds r5, #1
	cmp r5, #0x63
	bgt _080174EA
	ldrh r0, [r3]
	cmp r0, #0
	bne _080174B4
_080174EA:
	adds r0, r6, #0
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_080174F4
sub_080174F4: @ 0x080174F4
	push {r4, r5, r6, r7, lr}
	movs r5, #0
	movs r4, #1
_080174FA:
	adds r0, r4, #0
	bl GetUnit
	mov ip, r0
	adds r6, r4, #1
	cmp r0, #0
	beq _08017564
	ldr r0, [r0]
	cmp r0, #0
	beq _08017564
	mov r1, ip
	ldr r0, [r1, #0xc]
	ldr r1, _08017540 @ =0x00010004
	ands r0, r1
	cmp r0, #0
	bne _08017564
	movs r4, #0
	mov r0, ip
	ldrh r3, [r0, #0x1e]
	cmp r3, #0
	beq _08017564
	ldr r7, _08017544 @ =0x08C51538
_08017526:
	movs r1, #0xff
	ands r1, r3
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r2, r0, r7
	ldr r0, [r2, #8]
	movs r1, #8
	ands r0, r1
	cmp r0, #0
	beq _08017548
	ldrh r0, [r2, #0x1a]
	b _0801754E
	.align 2, 0
_08017540: .4byte 0x00010004
_08017544: .4byte 0x08C51538
_08017548:
	asrs r0, r3, #8
	ldrh r2, [r2, #0x1a]
	muls r0, r2, r0
_0801754E:
	adds r5, r5, r0
	adds r4, #1
	cmp r4, #4
	bgt _08017564
	lsls r1, r4, #1
	mov r0, ip
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r3, [r0]
	cmp r3, #0
	bne _08017526
_08017564:
	adds r4, r6, #0
	cmp r4, #0x3f
	ble _080174FA
	adds r0, r5, #0
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_08017574
sub_08017574: @ 0x08017574
	push {r4, lr}
	bl sub_080174A0
	adds r4, r0, #0
	bl sub_080174F4
	adds r4, r4, r0
	bl GetGold
	adds r4, r4, r0
	ldr r0, _08017598 @ =0x0098967F
	cmp r4, r0
	ble _08017590
	adds r4, r0, #0
_08017590:
	adds r0, r4, #0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08017598: .4byte 0x0098967F

	thumb_func_start sub_0801759C
sub_0801759C: @ 0x0801759C
	adds r2, r0, #0
	lsls r1, r1, #0x18
	lsrs r3, r1, #0x18
	cmp r2, #0
	bne _080175AA
	movs r1, #0xff
	b _080175BA
_080175AA:
	movs r0, #0xff
	ands r0, r2
	lsls r1, r0, #3
	adds r1, r1, r0
	lsls r1, r1, #2
	ldr r0, _080175C4 @ =0x08C51538
	adds r1, r1, r0
	ldrb r1, [r1, #7]
_080175BA:
	ldr r0, _080175C8 @ =gPlaySt
	adds r0, #0x1c
	adds r0, r1, r0
	strb r3, [r0]
	bx lr
	.align 2, 0
_080175C4: .4byte 0x08C51538
_080175C8: .4byte gPlaySt

	thumb_func_start sub_080175CC
sub_080175CC: @ 0x080175CC
	adds r3, r0, #0
	cmp r1, #0
	bne _080175D6
	movs r1, #0xff
	b _080175E6
_080175D6:
	movs r0, #0xff
	ands r0, r1
	lsls r1, r0, #3
	adds r1, r1, r0
	lsls r1, r1, #2
	ldr r0, _08017600 @ =0x08C51538
	adds r1, r1, r0
	ldrb r1, [r1, #7]
_080175E6:
	ldr r0, _08017604 @ =gPlaySt
	adds r0, #0x1c
	adds r0, r1, r0
	movs r2, #0
	ldr r1, [r3]
	ldrb r0, [r0]
	ldrb r1, [r1, #4]
	cmp r0, r1
	bne _080175FA
	movs r2, #1
_080175FA:
	adds r0, r2, #0
	bx lr
	.align 2, 0
_08017600: .4byte 0x08C51538
_08017604: .4byte gPlaySt

	thumb_func_start GetItemIndex
GetItemIndex: @ 0x08017608
	adds r1, r0, #0
	movs r0, #0xff
	ands r0, r1
	bx lr

	thumb_func_start sub_08017610
sub_08017610: @ 0x08017610
	push {lr}
	movs r1, #0xff
	ands r0, r1
	lsls r1, r0, #3
	adds r1, r1, r0
	lsls r1, r1, #2
	ldr r0, _08017630 @ =0x08C51538
	adds r1, r1, r0
	ldrh r0, [r1]
	bl sub_08013318
	bl sub_08013488
	pop {r1}
	bx r1
	.align 2, 0
_08017630: .4byte 0x08C51538

	thumb_func_start sub_08017634
sub_08017634: @ 0x08017634
	movs r1, #0xff
	ands r0, r1
	lsls r1, r0, #3
	adds r1, r1, r0
	lsls r1, r1, #2
	ldr r0, _08017648 @ =0x08C51538
	adds r1, r1, r0
	ldrh r0, [r1, #2]
	bx lr
	.align 2, 0
_08017648: .4byte 0x08C51538

	thumb_func_start sub_0801764C
sub_0801764C: @ 0x0801764C
	movs r1, #0xff
	ands r0, r1
	lsls r1, r0, #3
	adds r1, r1, r0
	lsls r1, r1, #2
	ldr r0, _08017660 @ =0x08C51538
	adds r1, r1, r0
	ldrh r0, [r1, #4]
	bx lr
	.align 2, 0
_08017660: .4byte 0x08C51538

	thumb_func_start sub_08017664
sub_08017664: @ 0x08017664
	cmp r0, #0
	beq _08017680
	movs r1, #0xff
	ands r1, r0
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _0801767C @ =0x08C51538
	adds r0, r0, r1
	ldrb r0, [r0, #7]
	b _08017682
	.align 2, 0
_0801767C: .4byte 0x08C51538
_08017680:
	movs r0, #0xff
_08017682:
	bx lr

	thumb_func_start sub_08017684
sub_08017684: @ 0x08017684
	movs r1, #0xff
	ands r0, r1
	lsls r1, r0, #3
	adds r1, r1, r0
	lsls r1, r1, #2
	ldr r0, _08017698 @ =0x08C51538
	adds r1, r1, r0
	ldr r0, [r1, #8]
	bx lr
	.align 2, 0
_08017698: .4byte 0x08C51538

	thumb_func_start sub_0801769C
sub_0801769C: @ 0x0801769C
	adds r2, r0, #0
	movs r1, #0xff
	ands r1, r2
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _080176BC @ =0x08C51538
	adds r0, r0, r1
	ldr r0, [r0, #8]
	movs r1, #8
	ands r0, r1
	cmp r0, #0
	bne _080176C0
	asrs r0, r2, #8
	b _080176C2
	.align 2, 0
_080176BC: .4byte 0x08C51538
_080176C0:
	movs r0, #0xff
_080176C2:
	bx lr

	thumb_func_start sub_080176C4
sub_080176C4: @ 0x080176C4
	movs r1, #0xff
	ands r0, r1
	lsls r1, r0, #3
	adds r1, r1, r0
	lsls r1, r1, #2
	ldr r0, _080176E0 @ =0x08C51538
	adds r2, r1, r0
	ldr r0, [r2, #8]
	movs r1, #8
	ands r0, r1
	cmp r0, #0
	bne _080176E4
	ldrb r0, [r2, #0x14]
	b _080176E6
	.align 2, 0
_080176E0: .4byte 0x08C51538
_080176E4:
	movs r0, #0xff
_080176E6:
	bx lr

	thumb_func_start sub_080176E8
sub_080176E8: @ 0x080176E8
	movs r1, #0xff
	ands r0, r1
	lsls r1, r0, #3
	adds r1, r1, r0
	lsls r1, r1, #2
	ldr r0, _080176FC @ =0x08C51538
	adds r1, r1, r0
	ldrb r0, [r1, #0x15]
	bx lr
	.align 2, 0
_080176FC: .4byte 0x08C51538

	thumb_func_start sub_08017700
sub_08017700: @ 0x08017700
	movs r1, #0xff
	ands r0, r1
	lsls r1, r0, #3
	adds r1, r1, r0
	lsls r1, r1, #2
	ldr r0, _08017714 @ =0x08C51538
	adds r1, r1, r0
	ldrb r0, [r1, #0x16]
	bx lr
	.align 2, 0
_08017714: .4byte 0x08C51538

	thumb_func_start sub_08017718
sub_08017718: @ 0x08017718
	movs r1, #0xff
	ands r0, r1
	lsls r1, r0, #3
	adds r1, r1, r0
	lsls r1, r1, #2
	ldr r0, _0801772C @ =0x08C51538
	adds r1, r1, r0
	ldrb r0, [r1, #0x17]
	bx lr
	.align 2, 0
_0801772C: .4byte 0x08C51538

	thumb_func_start sub_08017730
sub_08017730: @ 0x08017730
	movs r1, #0xff
	ands r0, r1
	lsls r1, r0, #3
	adds r1, r1, r0
	lsls r1, r1, #2
	ldr r0, _08017744 @ =0x08C51538
	adds r1, r1, r0
	ldrb r0, [r1, #0x18]
	bx lr
	.align 2, 0
_08017744: .4byte 0x08C51538

	thumb_func_start sub_08017748
sub_08017748: @ 0x08017748
	adds r3, r0, #0
	movs r0, #0xff
	ands r0, r3
	lsls r1, r0, #3
	adds r1, r1, r0
	lsls r1, r1, #2
	ldr r0, _08017768 @ =0x08C51538
	adds r2, r1, r0
	ldr r0, [r2, #8]
	movs r1, #8
	ands r0, r1
	cmp r0, #0
	beq _0801776C
	ldrh r0, [r2, #0x1a]
	b _08017772
	.align 2, 0
_08017768: .4byte 0x08C51538
_0801776C:
	asrs r0, r3, #8
	ldrh r2, [r2, #0x1a]
	muls r0, r2, r0
_08017772:
	bx lr

	thumb_func_start sub_08017774
sub_08017774: @ 0x08017774
	movs r1, #0xff
	ands r0, r1
	lsls r1, r0, #3
	adds r1, r1, r0
	lsls r1, r1, #2
	ldr r0, _08017788 @ =0x08C51538
	adds r1, r1, r0
	ldrb r1, [r1, #0x19]
	lsrs r0, r1, #4
	bx lr
	.align 2, 0
_08017788: .4byte 0x08C51538

	thumb_func_start sub_0801778C
sub_0801778C: @ 0x0801778C
	movs r1, #0xff
	ands r0, r1
	lsls r1, r0, #3
	adds r1, r1, r0
	lsls r1, r1, #2
	ldr r0, _080177A4 @ =0x08C51538
	adds r1, r1, r0
	movs r0, #0xf
	ldrb r1, [r1, #0x19]
	ands r0, r1
	bx lr
	.align 2, 0
_080177A4: .4byte 0x08C51538

	thumb_func_start sub_080177A8
sub_080177A8: @ 0x080177A8
	movs r1, #0xff
	ands r0, r1
	lsls r1, r0, #3
	adds r1, r1, r0
	lsls r1, r1, #2
	ldr r0, _080177BC @ =0x08C51538
	adds r1, r1, r0
	ldrb r0, [r1, #0x19]
	bx lr
	.align 2, 0
_080177BC: .4byte 0x08C51538

	thumb_func_start sub_080177C0
sub_080177C0: @ 0x080177C0
	movs r1, #0xff
	ands r0, r1
	lsls r1, r0, #3
	adds r1, r1, r0
	lsls r1, r1, #2
	ldr r0, _080177D4 @ =0x08C51538
	adds r1, r1, r0
	ldrb r0, [r1, #0x1c]
	bx lr
	.align 2, 0
_080177D4: .4byte 0x08C51538

	thumb_func_start sub_080177D8
sub_080177D8: @ 0x080177D8
	movs r1, #0xff
	ands r0, r1
	lsls r1, r0, #3
	adds r1, r1, r0
	lsls r1, r1, #2
	ldr r0, _080177EC @ =0x08C51538
	adds r1, r1, r0
	ldr r0, [r1, #0x10]
	bx lr
	.align 2, 0
_080177EC: .4byte 0x08C51538

	thumb_func_start sub_080177F0
sub_080177F0: @ 0x080177F0
	movs r1, #0xff
	ands r0, r1
	lsls r1, r0, #3
	adds r1, r1, r0
	lsls r1, r1, #2
	ldr r0, _08017804 @ =0x08C51538
	adds r1, r1, r0
	ldr r0, [r1, #0xc]
	bx lr
	.align 2, 0
_08017804: .4byte 0x08C51538

	thumb_func_start sub_08017808
sub_08017808: @ 0x08017808
	cmp r0, #0
	beq _08017824
	movs r1, #0xff
	ands r1, r0
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _08017820 @ =0x08C51538
	adds r0, r0, r1
	ldrb r0, [r0, #0x1d]
	b _08017828
	.align 2, 0
_08017820: .4byte 0x08C51538
_08017824:
	movs r0, #1
	rsbs r0, r0, #0
_08017828:
	bx lr
	.align 2, 0

	thumb_func_start sub_0801782C
sub_0801782C: @ 0x0801782C
	movs r1, #0xff
	ands r0, r1
	lsls r1, r0, #3
	adds r1, r1, r0
	lsls r1, r1, #2
	ldr r0, _08017840 @ =0x08C51538
	adds r1, r1, r0
	ldrb r0, [r1, #0x1f]
	bx lr
	.align 2, 0
_08017840: .4byte 0x08C51538

	thumb_func_start sub_08017844
sub_08017844: @ 0x08017844
	movs r1, #0xff
	ands r0, r1
	lsls r1, r0, #3
	adds r1, r1, r0
	lsls r1, r1, #2
	ldr r0, _08017858 @ =0x08C51538
	adds r1, r1, r0
	ldrb r0, [r1, #0x1e]
	bx lr
	.align 2, 0
_08017858: .4byte 0x08C51538

	thumb_func_start sub_0801785C
sub_0801785C: @ 0x0801785C
	movs r1, #0xff
	ands r0, r1
	lsls r1, r0, #3
	adds r1, r1, r0
	lsls r1, r1, #2
	ldr r0, _08017870 @ =0x08C51538
	adds r1, r1, r0
	ldrh r0, [r1, #0x1a]
	bx lr
	.align 2, 0
_08017870: .4byte 0x08C51538

	thumb_func_start sub_08017874
sub_08017874: @ 0x08017874
	movs r1, #0xff
	ands r0, r1
	lsls r1, r0, #3
	adds r1, r1, r0
	lsls r1, r1, #2
	ldr r0, _08017898 @ =0x08C51538
	adds r2, r1, r0
	ldr r0, [r2, #8]
	movs r1, #8
	ands r0, r1
	movs r1, #0xff
	cmp r0, #0
	bne _08017890
	ldrb r1, [r2, #0x14]
_08017890:
	ldrh r2, [r2, #0x1a]
	adds r0, r2, #0
	muls r0, r1, r0
	bx lr
	.align 2, 0
_08017898: .4byte 0x08C51538

	thumb_func_start GetItemAwardedExp
GetItemAwardedExp: @ 0x0801789C
	movs r1, #0xff
	ands r0, r1
	lsls r1, r0, #3
	adds r1, r1, r0
	lsls r1, r1, #2
	ldr r0, _080178B0 @ =0x08C51538
	adds r1, r1, r0
	adds r1, #0x20
	ldrb r0, [r1]
	bx lr
	.align 2, 0
_080178B0: .4byte 0x08C51538

	thumb_func_start GetItemData
GetItemData: @ 0x080178B4
	adds r1, r0, #0
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _080178C4 @ =0x08C51538
	adds r0, r0, r1
	bx lr
	.align 2, 0
_080178C4: .4byte 0x08C51538
