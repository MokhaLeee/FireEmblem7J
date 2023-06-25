	.include "macro.inc"
	.syntax unified

	thumb_func_start CanUnitUseItem
CanUnitUseItem: @ 0x08027158
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r0, r5, #0
	bl GetItemAttributes
	movs r1, #4
	ands r1, r0
	cmp r1, #0
	beq _0802717C
	adds r0, r4, #0
	adds r1, r5, #0
	bl CanUnitUseStaff
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0802717C
	b _080273CC
_0802717C:
	adds r0, r5, #0
	bl GetItemIndex
	subs r0, #0x4a
	cmp r0, #0x50
	bls _0802718A
	b _080273CC
_0802718A:
	lsls r0, r0, #2
	ldr r1, _08027194 @ =_08027198
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08027194: .4byte _08027198
_08027198: @ jump table
	.4byte _080272DC @ case 0
	.4byte _080272DC @ case 1
	.4byte _080272DC @ case 2
	.4byte _080272E4 @ case 3
	.4byte _080272EC @ case 4
	.4byte _080272F4 @ case 5
	.4byte _0802730C @ case 6
	.4byte _08027314 @ case 7
	.4byte _0802731C @ case 8
	.4byte _08027324 @ case 9
	.4byte _080272FC @ case 10
	.4byte _08027398 @ case 11
	.4byte _0802732C @ case 12
	.4byte _08027334 @ case 13
	.4byte _08027304 @ case 14
	.4byte _080273CC @ case 15
	.4byte _0802733C @ case 16
	.4byte _0802733C @ case 17
	.4byte _0802733C @ case 18
	.4byte _0802733C @ case 19
	.4byte _0802733C @ case 20
	.4byte _0802733C @ case 21
	.4byte _0802733C @ case 22
	.4byte _0802733C @ case 23
	.4byte _0802733C @ case 24
	.4byte _08027346 @ case 25
	.4byte _08027346 @ case 26
	.4byte _08027346 @ case 27
	.4byte _08027346 @ case 28
	.4byte _08027346 @ case 29
	.4byte _08027370 @ case 30
	.4byte _08027378 @ case 31
	.4byte _08027380 @ case 32
	.4byte _08027350 @ case 33
	.4byte _08027350 @ case 34
	.4byte _08027358 @ case 35
	.4byte _08027368 @ case 36
	.4byte _08027360 @ case 37
	.4byte _080273CC @ case 38
	.4byte _080273CC @ case 39
	.4byte _080273CC @ case 40
	.4byte _080273CC @ case 41
	.4byte _080273CC @ case 42
	.4byte _080273CC @ case 43
	.4byte _080273CC @ case 44
	.4byte _080273CC @ case 45
	.4byte _08027370 @ case 46
	.4byte _08027388 @ case 47
	.4byte _08027390 @ case 48
	.4byte _080273CC @ case 49
	.4byte _080273A8 @ case 50
	.4byte _080273A8 @ case 51
	.4byte _080273A8 @ case 52
	.4byte _080273A8 @ case 53
	.4byte _080273CC @ case 54
	.4byte _080273CC @ case 55
	.4byte _080273CC @ case 56
	.4byte _080273CC @ case 57
	.4byte _080273CC @ case 58
	.4byte _080273CC @ case 59
	.4byte _080273CC @ case 60
	.4byte _08027346 @ case 61
	.4byte _080273BC @ case 62
	.4byte _08027346 @ case 63
	.4byte _080273CC @ case 64
	.4byte _08027346 @ case 65
	.4byte _080273CC @ case 66
	.4byte _080273CC @ case 67
	.4byte _080273CC @ case 68
	.4byte _080273CC @ case 69
	.4byte _080273CC @ case 70
	.4byte _080273CC @ case 71
	.4byte _080273CC @ case 72
	.4byte _080273CC @ case 73
	.4byte _080273CC @ case 74
	.4byte _080273CC @ case 75
	.4byte _08027346 @ case 76
	.4byte _080273CC @ case 77
	.4byte _080273CC @ case 78
	.4byte _080273CC @ case 79
	.4byte _08027350 @ case 80
_080272DC:
	ldr r1, _080272E0 @ =sub_08024A18
	b _080273AA
	.align 2, 0
_080272E0: .4byte sub_08024A18
_080272E4:
	ldr r1, _080272E8 @ =sub_08024A4C
	b _080273AA
	.align 2, 0
_080272E8: .4byte sub_08024A4C
_080272EC:
	ldr r1, _080272F0 @ =sub_08024A4C
	b _080273AA
	.align 2, 0
_080272F0: .4byte sub_08024A4C
_080272F4:
	ldr r1, _080272F8 @ =sub_08024AE8
	b _080273AA
	.align 2, 0
_080272F8: .4byte sub_08024AE8
_080272FC:
	ldr r1, _08027300 @ =sub_08024BD8
	b _080273AA
	.align 2, 0
_08027300: .4byte sub_08024BD8
_08027304:
	ldr r1, _08027308 @ =sub_08024B6C
	b _080273AA
	.align 2, 0
_08027308: .4byte sub_08024B6C
_0802730C:
	ldr r1, _08027310 @ =sub_08024CE4
	b _080273AA
	.align 2, 0
_08027310: .4byte sub_08024CE4
_08027314:
	ldr r1, _08027318 @ =sub_08024D0C
	b _080273AA
	.align 2, 0
_08027318: .4byte sub_08024D0C
_0802731C:
	ldr r1, _08027320 @ =sub_08024D34
	b _080273AA
	.align 2, 0
_08027320: .4byte sub_08024D34
_08027324:
	ldr r1, _08027328 @ =sub_08024D94
	b _080273AA
	.align 2, 0
_08027328: .4byte sub_08024D94
_0802732C:
	ldr r1, _08027330 @ =sub_08024E54
	b _080273AA
	.align 2, 0
_08027330: .4byte sub_08024E54
_08027334:
	ldr r1, _08027338 @ =sub_08024DC8
	b _080273AA
	.align 2, 0
_08027338: .4byte sub_08024DC8
_0802733C:
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_08027A04
	b _080273B0
_08027346:
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_0802788C
	b _080273B0
_08027350:
	adds r0, r4, #0
	bl sub_08027770
	b _080273B0
_08027358:
	adds r0, r4, #0
	bl sub_08027794
	b _080273B0
_08027360:
	adds r0, r4, #0
	bl sub_080277A8
	b _080273B0
_08027368:
	adds r0, r4, #0
	bl sub_080277CC
	b _080273B0
_08027370:
	adds r0, r4, #0
	bl sub_080277E0
	b _080273B0
_08027378:
	adds r0, r4, #0
	bl sub_0802781C
	b _080273B0
_08027380:
	adds r0, r4, #0
	bl sub_08027844
	b _080273B0
_08027388:
	ldr r1, _0802738C @ =MakeTargetListForDanceRing
	b _080273AA
	.align 2, 0
_0802738C: .4byte MakeTargetListForDanceRing
_08027390:
	ldr r1, _08027394 @ =MakeTargetListForMine
	b _080273AA
	.align 2, 0
_08027394: .4byte MakeTargetListForMine
_08027398:
	ldr r1, _080273A4 @ =gPlaySt
	ldrb r2, [r1, #0xd]
	rsbs r0, r2, #0
	orrs r0, r2
	lsrs r0, r0, #0x1f
	b _080273CE
	.align 2, 0
_080273A4: .4byte gPlaySt
_080273A8:
	ldr r1, _080273B8 @ =sub_080250E0
_080273AA:
	adds r0, r4, #0
	bl sub_0802775C
_080273B0:
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	b _080273CE
	.align 2, 0
_080273B8: .4byte sub_080250E0
_080273BC:
	ldr r0, [r4, #0xc]
	movs r1, #0x80
	lsls r1, r1, #6
	ands r0, r1
	cmp r0, #0
	bne _080273CC
	movs r0, #1
	b _080273CE
_080273CC:
	movs r0, #0
_080273CE:
	pop {r4, r5}
	pop {r1}
	bx r1

	thumb_func_start GetItemCantUseMsgid
GetItemCantUseMsgid: @ 0x080273D4
	push {r4, r5, r6, lr}
	adds r6, r1, #0
	adds r0, r6, #0
	bl GetItemIndex
	subs r0, #0x55
	cmp r0, #0x45
	bls _080273E6
	b _08027578
_080273E6:
	lsls r0, r0, #2
	ldr r1, _080273F0 @ =_080273F4
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080273F0: .4byte _080273F4
_080273F4: @ jump table
	.4byte _0802750C @ case 0
	.4byte _08027578 @ case 1
	.4byte _08027578 @ case 2
	.4byte _08027578 @ case 3
	.4byte _08027578 @ case 4
	.4byte _0802750C @ case 5
	.4byte _0802750C @ case 6
	.4byte _0802750C @ case 7
	.4byte _0802750C @ case 8
	.4byte _0802750C @ case 9
	.4byte _0802750C @ case 10
	.4byte _0802750C @ case 11
	.4byte _0802750C @ case 12
	.4byte _0802750C @ case 13
	.4byte _0802754C @ case 14
	.4byte _0802754C @ case 15
	.4byte _0802754C @ case 16
	.4byte _0802754C @ case 17
	.4byte _0802754C @ case 18
	.4byte _08027514 @ case 19
	.4byte _0802751C @ case 20
	.4byte _08027522 @ case 21
	.4byte _0802750C @ case 22
	.4byte _0802750C @ case 23
	.4byte _0802750C @ case 24
	.4byte _0802750C @ case 25
	.4byte _0802750C @ case 26
	.4byte _08027578 @ case 27
	.4byte _08027578 @ case 28
	.4byte _08027578 @ case 29
	.4byte _08027578 @ case 30
	.4byte _08027578 @ case 31
	.4byte _08027578 @ case 32
	.4byte _08027578 @ case 33
	.4byte _08027578 @ case 34
	.4byte _08027514 @ case 35
	.4byte _08027578 @ case 36
	.4byte _08027578 @ case 37
	.4byte _08027578 @ case 38
	.4byte _08027578 @ case 39
	.4byte _08027578 @ case 40
	.4byte _08027578 @ case 41
	.4byte _08027578 @ case 42
	.4byte _08027578 @ case 43
	.4byte _08027578 @ case 44
	.4byte _08027578 @ case 45
	.4byte _08027578 @ case 46
	.4byte _08027578 @ case 47
	.4byte _08027578 @ case 48
	.4byte _08027578 @ case 49
	.4byte _0802754C @ case 50
	.4byte _08027578 @ case 51
	.4byte _0802754C @ case 52
	.4byte _08027578 @ case 53
	.4byte _0802754C @ case 54
	.4byte _08027578 @ case 55
	.4byte _08027578 @ case 56
	.4byte _08027578 @ case 57
	.4byte _08027578 @ case 58
	.4byte _08027578 @ case 59
	.4byte _08027578 @ case 60
	.4byte _08027578 @ case 61
	.4byte _08027578 @ case 62
	.4byte _08027578 @ case 63
	.4byte _08027578 @ case 64
	.4byte _0802754C @ case 65
	.4byte _08027578 @ case 66
	.4byte _08027578 @ case 67
	.4byte _08027578 @ case 68
	.4byte _0802750C @ case 69
_0802750C:
	ldr r0, _08027510 @ =0x0000070D
	b _0802757A
	.align 2, 0
_08027510: .4byte 0x0000070D
_08027514:
	ldr r0, _08027518 @ =0x00000711
	b _0802757A
	.align 2, 0
_08027518: .4byte 0x00000711
_0802751C:
	movs r0, #0xe2
	lsls r0, r0, #3
	b _0802757A
_08027522:
	ldr r0, _0802753C @ =gActiveUnit
	ldr r0, [r0]
	ldr r1, [r0]
	ldr r2, [r0, #4]
	ldr r0, [r1, #0x28]
	ldr r1, [r2, #0x28]
	orrs r0, r1
	movs r1, #8
	ands r0, r1
	cmp r0, #0
	beq _08027544
	ldr r0, _08027540 @ =0x00000714
	b _0802757A
	.align 2, 0
_0802753C: .4byte gActiveUnit
_08027540: .4byte 0x00000714
_08027544:
	ldr r0, _08027548 @ =0x00000712
	b _0802757A
	.align 2, 0
_08027548: .4byte 0x00000712
_0802754C:
	ldr r4, _08027570 @ =gActiveUnit
	ldr r1, [r4]
	movs r5, #8
	ldrsb r5, [r1, r5]
	movs r0, #0xa
	strb r0, [r1, #8]
	ldr r0, [r4]
	adds r1, r6, #0
	bl sub_0802788C
	ldr r1, [r4]
	strb r5, [r1, #8]
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08027578
	ldr r0, _08027574 @ =0x0000070F
	b _0802757A
	.align 2, 0
_08027570: .4byte gActiveUnit
_08027574: .4byte 0x0000070F
_08027578:
	ldr r0, _08027580 @ =0x0000070E
_0802757A:
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_08027580: .4byte 0x0000070E

	thumb_func_start DoItemUse
DoItemUse: @ 0x08027584
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	bl ClearBg0Bg1
	movs r0, #0
	bl EndFaceById
	adds r0, r4, #0
	bl GetItemIndex
	subs r0, #0x4a
	cmp r0, #0x35
	bls _080275A2
	b _08027750
_080275A2:
	lsls r0, r0, #2
	ldr r1, _080275AC @ =_080275B0
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080275AC: .4byte _080275B0
_080275B0: @ jump table
	.4byte _08027688 @ case 0
	.4byte _08027688 @ case 1
	.4byte _08027688 @ case 2
	.4byte _08027690 @ case 3
	.4byte _08027708 @ case 4
	.4byte _080276B0 @ case 5
	.4byte _080276C0 @ case 6
	.4byte _080276C8 @ case 7
	.4byte _080276D0 @ case 8
	.4byte _080276F8 @ case 9
	.4byte _080276A0 @ case 10
	.4byte _08027734 @ case 11
	.4byte _08027700 @ case 12
	.4byte _080276E8 @ case 13
	.4byte _080276E0 @ case 14
	.4byte _08027750 @ case 15
	.4byte _08027750 @ case 16
	.4byte _08027750 @ case 17
	.4byte _08027750 @ case 18
	.4byte _08027750 @ case 19
	.4byte _08027750 @ case 20
	.4byte _08027750 @ case 21
	.4byte _08027750 @ case 22
	.4byte _08027750 @ case 23
	.4byte _08027750 @ case 24
	.4byte _08027750 @ case 25
	.4byte _08027750 @ case 26
	.4byte _08027750 @ case 27
	.4byte _08027750 @ case 28
	.4byte _08027750 @ case 29
	.4byte _08027750 @ case 30
	.4byte _08027750 @ case 31
	.4byte _08027750 @ case 32
	.4byte _08027750 @ case 33
	.4byte _08027750 @ case 34
	.4byte _08027750 @ case 35
	.4byte _08027750 @ case 36
	.4byte _08027750 @ case 37
	.4byte _08027750 @ case 38
	.4byte _08027750 @ case 39
	.4byte _08027750 @ case 40
	.4byte _08027750 @ case 41
	.4byte _08027750 @ case 42
	.4byte _08027750 @ case 43
	.4byte _08027750 @ case 44
	.4byte _08027750 @ case 45
	.4byte _08027750 @ case 46
	.4byte _08027710 @ case 47
	.4byte _08027720 @ case 48
	.4byte _08027750 @ case 49
	.4byte _0802773C @ case 50
	.4byte _0802773C @ case 51
	.4byte _0802773C @ case 52
	.4byte _0802773C @ case 53
_08027688:
	ldr r1, _0802768C @ =sub_08024A18
	b _08027692
	.align 2, 0
_0802768C: .4byte sub_08024A18
_08027690:
	ldr r1, _0802769C @ =sub_08024A4C
_08027692:
	adds r0, r5, #0
	bl sub_0802814C
	b _08027756
	.align 2, 0
_0802769C: .4byte sub_08024A4C
_080276A0:
	ldr r1, _080276AC @ =sub_08024BD8
	adds r0, r5, #0
	bl sub_08027B24
	b _08027756
	.align 2, 0
_080276AC: .4byte sub_08024BD8
_080276B0:
	ldr r1, _080276BC @ =sub_08024AE8
	adds r0, r5, #0
	bl sub_08028184
	b _08027756
	.align 2, 0
_080276BC: .4byte sub_08024AE8
_080276C0:
	ldr r1, _080276C4 @ =sub_08024CE4
	b _080276D2
	.align 2, 0
_080276C4: .4byte sub_08024CE4
_080276C8:
	ldr r1, _080276CC @ =sub_08024D0C
	b _080276D2
	.align 2, 0
_080276CC: .4byte sub_08024D0C
_080276D0:
	ldr r1, _080276DC @ =sub_08024D34
_080276D2:
	adds r0, r5, #0
	bl sub_0802825C
	b _08027756
	.align 2, 0
_080276DC: .4byte sub_08024D34
_080276E0:
	adds r0, r5, #0
	bl sub_080281F0
	b _08027756
_080276E8:
	ldr r1, _080276F0 @ =sub_08024DC8
	ldr r2, _080276F4 @ =0x000006FE
	b _08027724
	.align 2, 0
_080276F0: .4byte sub_08024DC8
_080276F4: .4byte 0x000006FE
_080276F8:
	adds r0, r5, #0
	bl sub_08027E44
	b _08027756
_08027700:
	adds r0, r5, #0
	bl sub_08027F74
	b _08027756
_08027708:
	adds r0, r5, #0
	bl sub_08027AD8
	b _08027756
_08027710:
	ldr r1, _08027718 @ =MakeTargetListForDanceRing
	ldr r2, _0802771C @ =0x0000072B
	b _08027724
	.align 2, 0
_08027718: .4byte MakeTargetListForDanceRing
_0802771C: .4byte 0x0000072B
_08027720:
	ldr r1, _0802772C @ =MakeTargetListForMine
	ldr r2, _08027730 @ =0x0000072C
_08027724:
	adds r0, r5, #0
	bl sub_08027EBC
	b _08027756
	.align 2, 0
_0802772C: .4byte MakeTargetListForMine
_08027730: .4byte 0x0000072C
_08027734:
	adds r0, r5, #0
	bl sub_0802849C
	b _08027756
_0802773C:
	ldr r1, _08027748 @ =sub_080250E0
	ldr r2, _0802774C @ =0x0000072D
	adds r0, r5, #0
	bl sub_08027B64
	b _08027756
	.align 2, 0
_08027748: .4byte sub_080250E0
_0802774C: .4byte 0x0000072D
_08027750:
	adds r0, r5, #0
	bl sub_08027B00
_08027756:
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start sub_0802775C
sub_0802775C: @ 0x0802775C
	push {lr}
	bl _call_via_r1
	bl sub_0804B950
	cmp r0, #0
	beq _0802776C
	movs r0, #1
_0802776C:
	pop {r1}
	bx r1

	thumb_func_start sub_08027770
sub_08027770: @ 0x08027770
	push {r4, r5, lr}
	adds r4, r0, #0
	bl GetUnitCurrentHp
	adds r5, r0, #0
	adds r0, r4, #0
	bl GetUnitMaxHp
	cmp r5, r0
	beq _08027788
	movs r0, #1
	b _0802778A
_08027788:
	movs r0, #0
_0802778A:
	pop {r4, r5}
	pop {r1}
	bx r1

	thumb_func_start sub_08027790
sub_08027790: @ 0x08027790
	movs r0, #0
	bx lr

	thumb_func_start sub_08027794
sub_08027794: @ 0x08027794
	adds r0, #0x31
	movs r1, #0xf0
	ldrb r0, [r0]
	ands r1, r0
	cmp r1, #0x70
	beq _080277A4
	movs r0, #1
	b _080277A6
_080277A4:
	movs r0, #0
_080277A6:
	bx lr

	thumb_func_start sub_080277A8
sub_080277A8: @ 0x080277A8
	adds r1, r0, #0
	ldr r0, _080277C4 @ =gPlaySt
	ldrb r0, [r0, #0xd]
	cmp r0, #0
	beq _080277C8
	adds r1, #0x31
	movs r0, #0xf
	ldrb r1, [r1]
	ands r0, r1
	cmp r0, #4
	beq _080277C8
	movs r0, #1
	b _080277CA
	.align 2, 0
_080277C4: .4byte gPlaySt
_080277C8:
	movs r0, #0
_080277CA:
	bx lr

	thumb_func_start sub_080277CC
sub_080277CC: @ 0x080277CC
	adds r0, #0x30
	movs r1, #0xf
	ldrb r0, [r0]
	ands r1, r0
	cmp r1, #1
	bne _080277DC
	movs r0, #1
	b _080277DE
_080277DC:
	movs r0, #0
_080277DE:
	bx lr

	thumb_func_start sub_080277E0
sub_080277E0: @ 0x080277E0
	push {lr}
	movs r3, #0x11
	ldrsb r3, [r0, r3]
	ldr r1, _08027810 @ =gBmMapTerrain
	ldr r2, [r1]
	lsls r1, r3, #2
	adds r1, r1, r2
	movs r2, #0x10
	ldrsb r2, [r0, r2]
	ldr r0, [r1]
	adds r0, r0, r2
	ldrb r0, [r0]
	cmp r0, #0x21
	bne _08027814
	adds r0, r2, #0
	adds r1, r3, #0
	bl sub_080796B0
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08027814
	movs r0, #1
	b _08027816
	.align 2, 0
_08027810: .4byte gBmMapTerrain
_08027814:
	movs r0, #0
_08027816:
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_0802781C
sub_0802781C: @ 0x0802781C
	push {lr}
	movs r1, #0x1e
	bl sub_08024724
	bl sub_0804B950
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	pop {r1}
	bx r1

	thumb_func_start sub_08027830
sub_08027830: @ 0x08027830
	push {lr}
	movs r1, #0x14
	bl sub_08024724
	bl sub_0804B950
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	pop {r1}
	bx r1

	thumb_func_start sub_08027844
sub_08027844: @ 0x08027844
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4]
	ldr r1, [r4, #4]
	ldr r0, [r0, #0x28]
	ldr r1, [r1, #0x28]
	orrs r0, r1
	movs r1, #8
	ands r0, r1
	cmp r0, #0
	beq _0802787E
	adds r0, r4, #0
	bl sub_080277E0
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08027882
	adds r0, r4, #0
	bl sub_0802781C
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08027882
	adds r0, r4, #0
	bl sub_08027830
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08027882
_0802787E:
	movs r0, #0
	b _08027884
_08027882:
	movs r0, #1
_08027884:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_0802788C
sub_0802788C: @ 0x0802788C
	push {r4, r5, lr}
	adds r5, r0, #0
	movs r4, #0
	movs r0, #8
	ldrsb r0, [r5, r0]
	cmp r0, #9
	bgt _0802789C
	b _080279F8
_0802789C:
	adds r0, r1, #0
	bl GetItemIndex
	subs r0, #0x63
	cmp r0, #0x33
	bls _080278AA
	b _080279E2
_080278AA:
	lsls r0, r0, #2
	ldr r1, _080278B4 @ =_080278B8
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080278B4: .4byte _080278B8
_080278B8: @ jump table
	.4byte _08027988 @ case 0
	.4byte _08027990 @ case 1
	.4byte _08027998 @ case 2
	.4byte _080279A0 @ case 3
	.4byte _080279A8 @ case 4
	.4byte _080279E2 @ case 5
	.4byte _080279E2 @ case 6
	.4byte _080279E2 @ case 7
	.4byte _080279E2 @ case 8
	.4byte _080279E2 @ case 9
	.4byte _080279E2 @ case 10
	.4byte _080279E2 @ case 11
	.4byte _080279E2 @ case 12
	.4byte _080279E2 @ case 13
	.4byte _080279E2 @ case 14
	.4byte _080279E2 @ case 15
	.4byte _080279E2 @ case 16
	.4byte _080279E2 @ case 17
	.4byte _080279E2 @ case 18
	.4byte _080279E2 @ case 19
	.4byte _080279E2 @ case 20
	.4byte _080279E2 @ case 21
	.4byte _080279E2 @ case 22
	.4byte _080279E2 @ case 23
	.4byte _080279E2 @ case 24
	.4byte _080279E2 @ case 25
	.4byte _080279E2 @ case 26
	.4byte _080279E2 @ case 27
	.4byte _080279E2 @ case 28
	.4byte _080279E2 @ case 29
	.4byte _080279E2 @ case 30
	.4byte _080279E2 @ case 31
	.4byte _080279E2 @ case 32
	.4byte _080279E2 @ case 33
	.4byte _080279E2 @ case 34
	.4byte _080279E2 @ case 35
	.4byte _080279B0 @ case 36
	.4byte _080279E2 @ case 37
	.4byte _080279B8 @ case 38
	.4byte _080279E2 @ case 39
	.4byte _080279D4 @ case 40
	.4byte _080279E2 @ case 41
	.4byte _080279E2 @ case 42
	.4byte _080279E2 @ case 43
	.4byte _080279E2 @ case 44
	.4byte _080279E2 @ case 45
	.4byte _080279E2 @ case 46
	.4byte _080279E2 @ case 47
	.4byte _080279E2 @ case 48
	.4byte _080279E2 @ case 49
	.4byte _080279E2 @ case 50
	.4byte _080279E0 @ case 51
_08027988:
	ldr r4, _0802798C @ =0x08D5FB95
	b _080279E2
	.align 2, 0
_0802798C: .4byte 0x08D5FB95
_08027990:
	ldr r4, _08027994 @ =0x08D5FB9B
	b _080279E2
	.align 2, 0
_08027994: .4byte 0x08D5FB9B
_08027998:
	ldr r4, _0802799C @ =0x08D5FBA0
	b _080279E2
	.align 2, 0
_0802799C: .4byte 0x08D5FBA0
_080279A0:
	ldr r4, _080279A4 @ =0x08D5FBA5
	b _080279E2
	.align 2, 0
_080279A4: .4byte 0x08D5FBA5
_080279A8:
	ldr r4, _080279AC @ =0x08D5FBA9
	b _080279E2
	.align 2, 0
_080279AC: .4byte 0x08D5FBA9
_080279B0:
	ldr r4, _080279B4 @ =0x08D5FBB5
	b _080279E2
	.align 2, 0
_080279B4: .4byte 0x08D5FBB5
_080279B8:
	ldr r0, _080279C8 @ =gPlaySt
	ldr r4, _080279CC @ =0x08D5FBCE
	ldrb r0, [r0, #0x1b]
	cmp r0, #3
	bne _080279E2
	ldr r4, _080279D0 @ =0x08D5FBD9
	b _080279E2
	.align 2, 0
_080279C8: .4byte gPlaySt
_080279CC: .4byte 0x08D5FBCE
_080279D0: .4byte 0x08D5FBD9
_080279D4:
	ldr r4, _080279D8 @ =0x08D5FBE1
	b _080279E2
	.align 2, 0
_080279D8: .4byte 0x08D5FBE1
_080279DC:
	movs r0, #1
	b _080279FA
_080279E0:
	ldr r4, _08027A00 @ =0x08D5FBDC
_080279E2:
	ldrb r1, [r4]
	cmp r1, #0
	beq _080279F8
	ldr r0, [r5, #4]
	ldrb r0, [r0, #4]
_080279EC:
	cmp r0, r1
	beq _080279DC
	adds r4, #1
	ldrb r1, [r4]
	cmp r1, #0
	bne _080279EC
_080279F8:
	movs r0, #0
_080279FA:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_08027A00: .4byte 0x08D5FBDC

	thumb_func_start sub_08027A04
sub_08027A04: @ 0x08027A04
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r0, r1, #0
	bl sub_080177F0
	adds r4, r0, #0
	ldr r6, _08027AD4 @ =0x03004360
	adds r0, r6, #0
	bl ClearUnit
	ldr r0, [r5]
	str r0, [r6]
	ldr r0, [r5, #4]
	str r0, [r6, #4]
	ldrb r1, [r5, #0x12]
	ldrb r2, [r4]
	adds r0, r1, r2
	strb r0, [r6, #0x12]
	ldrb r1, [r5, #0x14]
	ldrb r2, [r4, #1]
	adds r0, r1, r2
	strb r0, [r6, #0x14]
	ldrb r1, [r5, #0x15]
	ldrb r2, [r4, #2]
	adds r0, r1, r2
	strb r0, [r6, #0x15]
	ldrb r1, [r5, #0x16]
	ldrb r2, [r4, #3]
	adds r0, r1, r2
	strb r0, [r6, #0x16]
	ldrb r1, [r5, #0x17]
	ldrb r2, [r4, #4]
	adds r0, r1, r2
	strb r0, [r6, #0x17]
	ldrb r1, [r5, #0x18]
	ldrb r2, [r4, #5]
	adds r0, r1, r2
	strb r0, [r6, #0x18]
	ldrb r1, [r5, #0x19]
	ldrb r2, [r4, #6]
	adds r0, r1, r2
	strb r0, [r6, #0x19]
	ldrb r1, [r5, #0x1d]
	ldrb r2, [r4, #7]
	adds r0, r1, r2
	strb r0, [r6, #0x1d]
	ldrb r1, [r5, #0x1a]
	ldrb r4, [r4, #8]
	adds r0, r1, r4
	strb r0, [r6, #0x1a]
	adds r0, r6, #0
	bl UnitCheckStatCaps
	movs r1, #0x12
	ldrsb r1, [r6, r1]
	movs r0, #0x12
	ldrsb r0, [r5, r0]
	eors r1, r0
	rsbs r0, r1, #0
	orrs r0, r1
	lsrs r0, r0, #0x1f
	ldrb r2, [r6, #0x14]
	ldrb r1, [r5, #0x14]
	cmp r2, r1
	beq _08027A88
	movs r0, #1
_08027A88:
	ldrb r2, [r6, #0x15]
	ldrb r1, [r5, #0x15]
	cmp r2, r1
	beq _08027A92
	movs r0, #1
_08027A92:
	ldrb r2, [r6, #0x16]
	ldrb r1, [r5, #0x16]
	cmp r2, r1
	beq _08027A9C
	movs r0, #1
_08027A9C:
	ldrb r2, [r6, #0x17]
	ldrb r1, [r5, #0x17]
	cmp r2, r1
	beq _08027AA6
	movs r0, #1
_08027AA6:
	ldrb r2, [r6, #0x18]
	ldrb r1, [r5, #0x18]
	cmp r2, r1
	beq _08027AB0
	movs r0, #1
_08027AB0:
	ldrb r2, [r6, #0x19]
	ldrb r1, [r5, #0x19]
	cmp r2, r1
	beq _08027ABA
	movs r0, #1
_08027ABA:
	ldrb r2, [r6, #0x1d]
	ldrb r1, [r5, #0x1d]
	cmp r2, r1
	beq _08027AC4
	movs r0, #1
_08027AC4:
	ldrb r6, [r6, #0x1a]
	ldrb r5, [r5, #0x1a]
	cmp r6, r5
	beq _08027ACE
	movs r0, #1
_08027ACE:
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_08027AD4: .4byte 0x03004360

	thumb_func_start sub_08027AD8
sub_08027AD8: @ 0x08027AD8
	push {lr}
	bl sub_0801D6D8
	ldr r0, _08027AF8 @ =gBg2Tm
	movs r1, #0
	bl BG_Fill
	movs r0, #4
	bl EnableBgSync
	ldr r1, _08027AFC @ =gActionSt
	movs r0, #3
	strb r0, [r1, #0x11]
	pop {r0}
	bx r0
	.align 2, 0
_08027AF8: .4byte gBg2Tm
_08027AFC: .4byte gActionSt

	thumb_func_start sub_08027B00
sub_08027B00: @ 0x08027B00
	ldr r1, _08027B08 @ =gActionSt
	movs r0, #0x17
	strb r0, [r1, #0x11]
	bx lr
	.align 2, 0
_08027B08: .4byte gActionSt

	thumb_func_start sub_08027B0C
sub_08027B0C: @ 0x08027B0C
	push {lr}
	ldr r2, _08027B20 @ =gActionSt
	ldrb r0, [r1, #2]
	strb r0, [r2, #0xd]
	movs r0, #0
	bl sub_08027AD8
	movs r0, #0x17
	pop {r1}
	bx r1
	.align 2, 0
_08027B20: .4byte gActionSt

	thumb_func_start sub_08027B24
sub_08027B24: @ 0x08027B24
	push {r4, lr}
	bl _call_via_r1
	ldr r0, _08027B54 @ =gBmMapMovement
	ldr r0, [r0]
	movs r1, #1
	rsbs r1, r1, #0
	bl BmMapFillg
	ldr r0, _08027B58 @ =0x08C04E94
	ldr r1, _08027B5C @ =sub_08027B0C
	bl sub_0804B6CC
	adds r4, r0, #0
	ldr r0, _08027B60 @ =0x000006FA
	bl DecodeMsg
	adds r1, r0, #0
	adds r0, r4, #0
	bl sub_08032A90
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08027B54: .4byte gBmMapMovement
_08027B58: .4byte 0x08C04E94
_08027B5C: .4byte sub_08027B0C
_08027B60: .4byte 0x000006FA

	thumb_func_start sub_08027B64
sub_08027B64: @ 0x08027B64
	push {r4, r5, lr}
	adds r5, r2, #0
	bl _call_via_r1
	ldr r0, _08027B98 @ =gBmMapMovement
	ldr r0, [r0]
	movs r1, #1
	rsbs r1, r1, #0
	bl BmMapFillg
	ldr r0, _08027B9C @ =0x08C04E94
	ldr r1, _08027BA0 @ =sub_08027B0C
	bl sub_0804B6CC
	adds r4, r0, #0
	adds r0, r5, #0
	bl DecodeMsg
	adds r1, r0, #0
	adds r0, r4, #0
	bl sub_08032A90
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08027B98: .4byte gBmMapMovement
_08027B9C: .4byte 0x08C04E94
_08027BA0: .4byte sub_08027B0C

	thumb_func_start sub_08027BA4
sub_08027BA4: @ 0x08027BA4
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	adds r6, r0, #0
	ldr r0, _08027C44 @ =0x000006F3
	bl DecodeMsg
	adds r1, r0, #0
	adds r0, r6, #0
	bl sub_08032A90
	ldr r5, _08027C48 @ =gActionSt
	ldrb r0, [r5, #0xd]
	bl GetUnit
	movs r4, #0x10
	ldrsb r4, [r0, r4]
	ldrb r0, [r5, #0xd]
	bl GetUnit
	movs r2, #0x11
	ldrsb r2, [r0, r2]
	adds r0, r6, #0
	adds r1, r4, #0
	bl sub_0801615C
	bl sub_0801D6D8
	ldr r0, _08027C4C @ =gActiveUnit
	ldr r4, [r0]
	ldrb r0, [r5, #0xd]
	bl GetUnit
	adds r1, r0, #0
	adds r0, r4, #0
	bl sub_0801DF68
	ldr r1, _08027C50 @ =gBmSt
	movs r0, #0xfd
	ldrb r2, [r1, #4]
	ands r0, r2
	movs r2, #0
	mov r8, r2
	strb r0, [r1, #4]
	movs r0, #1
	bl sub_0801D6A4
	ldrb r0, [r5, #0xd]
	bl GetUnit
	movs r4, #0x10
	ldrsb r4, [r0, r4]
	ldrb r0, [r5, #0xd]
	bl GetUnit
	movs r1, #0x11
	ldrsb r1, [r0, r1]
	adds r0, r4, #0
	bl sub_08015F0C
	ldr r0, _08027C54 @ =0x08191D7C
	movs r1, #0
	bl StartSpriteAnim
	adds r4, r0, #0
	mov r0, r8
	strh r0, [r4, #0x22]
	adds r0, r4, #0
	movs r1, #0
	bl sub_080128F0
	str r4, [r6, #0x54]
	adds r6, #0x4a
	movs r0, #2
	strh r0, [r6]
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08027C44: .4byte 0x000006F3
_08027C48: .4byte gActionSt
_08027C4C: .4byte gActiveUnit
_08027C50: .4byte gBmSt
_08027C54: .4byte 0x08191D7C

	thumb_func_start sub_08027C58
sub_08027C58: @ 0x08027C58
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	ldr r4, _08027CD0 @ =gBmSt
	movs r1, #0x16
	ldrsh r0, [r4, r1]
	ldr r1, _08027CD4 @ =gBmMapMovement
	ldr r1, [r1]
	lsls r0, r0, #2
	adds r0, r0, r1
	movs r2, #0x14
	ldrsh r1, [r4, r2]
	ldr r0, [r0]
	adds r0, r0, r1
	movs r1, #0
	ldrsb r1, [r0, r1]
	mvns r1, r1
	rsbs r0, r1, #0
	orrs r0, r1
	lsrs r6, r0, #0x1f
	bl sub_0801C584
	ldr r0, _08027CD8 @ =gpKeySt
	ldr r1, [r0]
	movs r0, #1
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _08027D04
	cmp r6, #0
	beq _08027CF0
	adds r0, r5, #0
	bl Proc_Break
	ldr r1, _08027CDC @ =gActionSt
	ldrh r0, [r4, #0x14]
	strb r0, [r1, #0x13]
	ldrh r0, [r4, #0x16]
	strb r0, [r1, #0x14]
	ldr r0, _08027CE0 @ =gActiveUnit
	ldr r0, [r0]
	bl sub_08027AD8
	ldr r0, _08027CE4 @ =gBg2Tm
	movs r1, #0
	bl BG_Fill
	movs r0, #4
	bl EnableBgSync
	ldr r0, _08027CE8 @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08027D7C
	ldr r0, _08027CEC @ =0x0000038A
	bl m4aSongNumStart
	b _08027D7C
	.align 2, 0
_08027CD0: .4byte gBmSt
_08027CD4: .4byte gBmMapMovement
_08027CD8: .4byte gpKeySt
_08027CDC: .4byte gActionSt
_08027CE0: .4byte gActiveUnit
_08027CE4: .4byte gBg2Tm
_08027CE8: .4byte gPlaySt
_08027CEC: .4byte 0x0000038A
_08027CF0:
	ldr r0, _08027D84 @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08027D04
	movs r0, #0xe3
	lsls r0, r0, #2
	bl m4aSongNumStart
_08027D04:
	ldr r0, _08027D88 @ =gpKeySt
	ldr r1, [r0]
	movs r0, #2
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _08027D3A
	adds r0, r5, #0
	movs r1, #0x63
	bl Proc_Goto
	ldr r0, _08027D8C @ =gBg2Tm
	movs r1, #0
	bl BG_Fill
	movs r0, #4
	bl EnableBgSync
	ldr r0, _08027D84 @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08027D3A
	ldr r0, _08027D90 @ =0x0000038B
	bl m4aSongNumStart
_08027D3A:
	lsls r0, r6, #0x18
	asrs r3, r0, #0x18
	adds r1, r5, #0
	adds r1, #0x4a
	movs r4, #0
	ldrsh r2, [r1, r4]
	adds r4, r0, #0
	adds r6, r1, #0
	cmp r3, r2
	beq _08027D5C
	ldr r0, [r5, #0x54]
	movs r1, #0
	cmp r3, #0
	bne _08027D58
	movs r1, #1
_08027D58:
	bl sub_080128F0
_08027D5C:
	ldr r0, [r5, #0x54]
	ldr r3, _08027D94 @ =gBmSt
	movs r5, #0x20
	ldrsh r1, [r3, r5]
	movs r5, #0xc
	ldrsh r2, [r3, r5]
	subs r1, r1, r2
	movs r5, #0x22
	ldrsh r2, [r3, r5]
	movs r5, #0xe
	ldrsh r3, [r3, r5]
	subs r2, r2, r3
	bl sub_08012694
	asrs r0, r4, #0x18
	strh r0, [r6]
_08027D7C:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08027D84: .4byte gPlaySt
_08027D88: .4byte gpKeySt
_08027D8C: .4byte gBg2Tm
_08027D90: .4byte 0x0000038B
_08027D94: .4byte gBmSt

	thumb_func_start sub_08027D98
sub_08027D98: @ 0x08027D98
	push {r4, r5, lr}
	adds r5, r0, #0
	bl sub_08005308
	bl sub_0801D6D8
	bl sub_08032CCC
	ldr r4, _08027DD0 @ =gActiveUnit
	ldr r1, [r4]
	movs r0, #0x10
	ldrsb r0, [r1, r0]
	ldrb r1, [r1, #0x11]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	bl sub_08015F0C
	ldr r0, [r4]
	movs r1, #0x10
	ldrsb r1, [r0, r1]
	movs r2, #0x11
	ldrsb r2, [r0, r2]
	adds r0, r5, #0
	bl sub_0801615C
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08027DD0: .4byte gActiveUnit

	thumb_func_start sub_08027DD4
sub_08027DD4: @ 0x08027DD4
	push {lr}
	bl sub_08005308
	bl sub_0801D6D8
	bl sub_08032CCC
	ldr r0, _08027E00 @ =gActiveUnit
	ldr r1, [r0]
	movs r0, #0x10
	ldrsb r0, [r1, r0]
	ldrb r1, [r1, #0x11]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	bl sub_08015F0C
	ldr r0, _08027E04 @ =0x08C03098
	movs r1, #3
	bl Proc_Start
	pop {r0}
	bx r0
	.align 2, 0
_08027E00: .4byte gActiveUnit
_08027E04: .4byte 0x08C03098

	thumb_func_start sub_08027E08
sub_08027E08: @ 0x08027E08
	push {r4, lr}
	adds r4, r0, #0
	bl sub_0801D6D8
	ldr r0, [r4, #0x54]
	bl sub_08012680
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_08027E1C
sub_08027E1C: @ 0x08027E1C
	push {r4, lr}
	adds r4, r1, #0
	bl sub_0804B6DC
	ldr r1, _08027E3C @ =gActionSt
	ldrb r0, [r4, #2]
	strb r0, [r1, #0xd]
	ldr r0, _08027E40 @ =0x08C03450
	movs r1, #3
	bl Proc_Start
	movs r0, #4
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08027E3C: .4byte gActionSt
_08027E40: .4byte 0x08C03450

	thumb_func_start sub_08027E44
sub_08027E44: @ 0x08027E44
	push {r4, lr}
	bl sub_08024D94
	ldr r0, _08027E88 @ =gBmMapMovement
	ldr r0, [r0]
	movs r1, #1
	rsbs r1, r1, #0
	bl BmMapFillg
	ldr r0, _08027E8C @ =0x08C04E94
	ldr r1, _08027E90 @ =sub_08027E1C
	bl sub_0804B6CC
	adds r4, r0, #0
	ldr r0, _08027E94 @ =0x000006F9
	bl DecodeMsg
	adds r1, r0, #0
	adds r0, r4, #0
	bl sub_08032A90
	ldr r0, _08027E98 @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08027E80
	ldr r0, _08027E9C @ =0x0000038A
	bl m4aSongNumStart
_08027E80:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08027E88: .4byte gBmMapMovement
_08027E8C: .4byte 0x08C04E94
_08027E90: .4byte sub_08027E1C
_08027E94: .4byte 0x000006F9
_08027E98: .4byte gPlaySt
_08027E9C: .4byte 0x0000038A

	thumb_func_start sub_08027EA0
sub_08027EA0: @ 0x08027EA0
	push {lr}
	ldr r2, _08027EB8 @ =gActionSt
	ldrb r0, [r1]
	strb r0, [r2, #0x13]
	ldrb r0, [r1, #1]
	strb r0, [r2, #0x14]
	movs r0, #0
	bl sub_08027AD8
	movs r0, #0x17
	pop {r1}
	bx r1
	.align 2, 0
_08027EB8: .4byte gActionSt

	thumb_func_start sub_08027EBC
sub_08027EBC: @ 0x08027EBC
	push {r4, r5, lr}
	adds r5, r2, #0
	bl _call_via_r1
	ldr r0, _08027F00 @ =gBmMapMovement
	ldr r0, [r0]
	movs r1, #1
	rsbs r1, r1, #0
	bl BmMapFillg
	ldr r0, _08027F04 @ =0x08C04E74
	ldr r1, _08027F08 @ =sub_08027EA0
	bl sub_0804B6CC
	adds r4, r0, #0
	adds r0, r5, #0
	bl DecodeMsg
	adds r1, r0, #0
	adds r0, r4, #0
	bl sub_08032A90
	ldr r0, _08027F0C @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08027EFA
	ldr r0, _08027F10 @ =0x0000038A
	bl m4aSongNumStart
_08027EFA:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08027F00: .4byte gBmMapMovement
_08027F04: .4byte 0x08C04E74
_08027F08: .4byte sub_08027EA0
_08027F0C: .4byte gPlaySt
_08027F10: .4byte 0x0000038A

	thumb_func_start sub_08027F14
sub_08027F14: @ 0x08027F14
	push {r4, r5, lr}
	sub sp, #4
	adds r4, r1, #0
	bl sub_08005308
	ldr r5, _08027F6C @ =gActionSt
	ldrb r0, [r4, #2]
	strb r0, [r5, #0xd]
	ldr r0, _08027F70 @ =0x08C04BB8
	bl StartMenu
	adds r4, r0, #0
	ldrb r0, [r5, #0xd]
	bl GetUnit
	adds r1, r0, #0
	adds r0, r4, #0
	movs r2, #0x10
	movs r3, #0xb
	bl sub_0801E2A0
	ldrb r0, [r5, #0xd]
	bl GetUnit
	bl GetUnitPortraitId
	adds r1, r0, #0
	movs r0, #2
	str r0, [sp]
	movs r0, #0
	movs r2, #0xb8
	movs r3, #0xc
	bl sub_08006AC4
	movs r0, #0
	movs r1, #5
	bl sub_080078F4
	movs r0, #0x17
	add sp, #4
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_08027F6C: .4byte gActionSt
_08027F70: .4byte 0x08C04BB8

	thumb_func_start sub_08027F74
sub_08027F74: @ 0x08027F74
	push {r4, lr}
	bl sub_08024E54
	ldr r0, _08027FB4 @ =gBmMapMovement
	ldr r0, [r0]
	movs r1, #1
	rsbs r1, r1, #0
	bl BmMapFillg
	ldr r0, _08027FB8 @ =0x08C04F14
	bl sub_0804B664
	adds r4, r0, #0
	ldr r0, _08027FBC @ =0x000006FC
	bl DecodeMsg
	adds r1, r0, #0
	adds r0, r4, #0
	bl sub_08032A90
	ldr r0, _08027FC0 @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08027FAE
	ldr r0, _08027FC4 @ =0x0000038A
	bl m4aSongNumStart
_08027FAE:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08027FB4: .4byte gBmMapMovement
_08027FB8: .4byte 0x08C04F14
_08027FBC: .4byte 0x000006FC
_08027FC0: .4byte gPlaySt
_08027FC4: .4byte 0x0000038A

	thumb_func_start sub_08027FC8
sub_08027FC8: @ 0x08027FC8
	push {r4, lr}
	adds r4, r1, #0
	movs r0, #0
	ldrsb r0, [r4, r0]
	movs r1, #1
	ldrsb r1, [r4, r1]
	bl sub_0801EF94
	movs r0, #2
	ldrsb r0, [r4, r0]
	bl GetUnit
	bl sub_080321EC
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_08027FEC
sub_08027FEC: @ 0x08027FEC
	push {lr}
	bl sub_08031FAC
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_08027FF8
sub_08027FF8: @ 0x08027FF8
	push {lr}
	adds r1, #0x3c
	movs r0, #0
	ldrsb r0, [r1, r0]
	bl sub_0801E364
	pop {r1}
	bx r1

	thumb_func_start nullsub_17
nullsub_17: @ 0x08028008
	bx lr
	.align 2, 0

	thumb_func_start sub_0802800C
sub_0802800C: @ 0x0802800C
	push {r4, lr}
	adds r4, r1, #0
	ldr r0, _08028028 @ =gActionSt
	ldrb r0, [r0, #0xd]
	bl GetUnit
	lsls r4, r4, #1
	adds r0, #0x1e
	adds r0, r0, r4
	ldrh r0, [r0]
	cmp r0, #0
	bne _0802802C
	movs r0, #3
	b _0802803C
	.align 2, 0
_08028028: .4byte gActionSt
_0802802C:
	bl sub_080171B4
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0802803A
	movs r0, #1
	b _0802803C
_0802803A:
	movs r0, #2
_0802803C:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_08028044
sub_08028044: @ 0x08028044
	push {r4, r5, r6, lr}
	adds r5, r1, #0
	ldr r0, _08028098 @ =gActionSt
	ldrb r0, [r0, #0xd]
	bl GetUnit
	adds r1, r5, #0
	adds r1, #0x3c
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	lsls r1, r1, #1
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r4, [r0]
	adds r0, r4, #0
	bl sub_080171B4
	adds r2, r0, #0
	adds r0, r5, #0
	adds r0, #0x34
	lsls r2, r2, #0x18
	asrs r2, r2, #0x18
	movs r1, #0x2c
	ldrsh r3, [r5, r1]
	lsls r3, r3, #5
	movs r6, #0x2a
	ldrsh r1, [r5, r6]
	adds r3, r3, r1
	lsls r3, r3, #1
	ldr r1, _0802809C @ =0x02022C60
	adds r3, r3, r1
	adds r1, r4, #0
	bl sub_08016984
	movs r0, #1
	bl EnableBgSync
	movs r0, #0
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_08028098: .4byte gActionSt
_0802809C: .4byte 0x02022C60

	thumb_func_start sub_080280A0
sub_080280A0: @ 0x080280A0
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	adds r4, r1, #0
	adds r0, r4, #0
	adds r0, #0x3d
	ldrb r0, [r0]
	cmp r0, #2
	bne _08028128
	movs r6, #0
	ldr r0, _080280E0 @ =gActionSt
	ldrb r0, [r0, #0xd]
	bl GetUnit
	adds r1, r4, #0
	adds r1, #0x3c
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	lsls r1, r1, #1
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r5, [r0]
	adds r0, r5, #0
	bl GetItemAttributes
	movs r1, #0xc1
	lsls r1, r1, #3
	ands r1, r0
	cmp r1, #0
	beq _080280E8
	ldr r6, _080280E4 @ =0x00000716
	b _08028118
	.align 2, 0
_080280E0: .4byte gActionSt
_080280E4: .4byte 0x00000716
_080280E8:
	adds r0, r5, #0
	bl GetItemAttributes
	movs r1, #5
	ands r1, r0
	cmp r1, #0
	bne _08028100
	ldr r6, _080280FC @ =0x0000070B
	b _08028118
	.align 2, 0
_080280FC: .4byte 0x0000070B
_08028100:
	adds r0, r5, #0
	bl GetItemUses
	adds r4, r0, #0
	adds r0, r5, #0
	bl GetItemMaxUses
	cmp r4, r0
	bne _08028114
	ldr r6, _08028124 @ =0x0000070A
_08028114:
	cmp r6, #0
	beq _08028120
_08028118:
	adds r0, r7, #0
	adds r1, r6, #0
	bl sub_0804B210
_08028120:
	movs r0, #8
	b _0802813C
	.align 2, 0
_08028124: .4byte 0x0000070A
_08028128:
	ldr r1, _08028144 @ =gActionSt
	adds r0, r4, #0
	adds r0, #0x3c
	ldrb r0, [r0]
	strb r0, [r1, #0x15]
	ldr r0, _08028148 @ =gActiveUnit
	ldr r0, [r0]
	bl sub_08027AD8
	movs r0, #0x37
_0802813C:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_08028144: .4byte gActionSt
_08028148: .4byte gActiveUnit

	thumb_func_start sub_0802814C
sub_0802814C: @ 0x0802814C
	push {r4, lr}
	bl _call_via_r1
	ldr r0, _0802817C @ =gBmMapMovement
	ldr r0, [r0]
	movs r1, #1
	rsbs r1, r1, #0
	bl BmMapFillg
	ldr r0, _08028180 @ =0x08C04E34
	bl sub_0804B664
	adds r4, r0, #0
	movs r0, #0xdf
	lsls r0, r0, #3
	bl DecodeMsg
	adds r1, r0, #0
	adds r0, r4, #0
	bl sub_08032A90
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0802817C: .4byte gBmMapMovement
_08028180: .4byte 0x08C04E34

	thumb_func_start sub_08028184
sub_08028184: @ 0x08028184
	push {r4, lr}
	bl _call_via_r1
	ldr r0, _080281B4 @ =gBmMapMovement
	ldr r0, [r0]
	movs r1, #1
	rsbs r1, r1, #0
	bl BmMapFillg
	ldr r0, _080281B8 @ =0x08C04E14
	bl sub_0804B664
	adds r4, r0, #0
	ldr r0, _080281BC @ =0x000006FB
	bl DecodeMsg
	adds r1, r0, #0
	adds r0, r4, #0
	bl sub_08032A90
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080281B4: .4byte gBmMapMovement
_080281B8: .4byte 0x08C04E14
_080281BC: .4byte 0x000006FB

	thumb_func_start sub_080281C0
sub_080281C0: @ 0x080281C0
	push {lr}
	bl sub_0803238C
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_080281CC
sub_080281CC: @ 0x080281CC
	push {r4, lr}
	adds r4, r1, #0
	movs r0, #0
	ldrsb r0, [r4, r0]
	movs r1, #1
	ldrsb r1, [r4, r1]
	bl sub_0801EF94
	movs r0, #2
	ldrsb r0, [r4, r0]
	bl GetUnit
	bl sub_080323AC
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_080281F0
sub_080281F0: @ 0x080281F0
	push {r4, lr}
	bl sub_08024B6C
	ldr r0, _08028220 @ =gBmMapMovement
	ldr r0, [r0]
	movs r1, #1
	rsbs r1, r1, #0
	bl BmMapFillg
	ldr r0, _08028224 @ =0x08C04DF4
	bl sub_0804B664
	adds r4, r0, #0
	ldr r0, _08028228 @ =0x000006FD
	bl DecodeMsg
	adds r1, r0, #0
	adds r0, r4, #0
	bl sub_08032A90
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08028220: .4byte gBmMapMovement
_08028224: .4byte 0x08C04DF4
_08028228: .4byte 0x000006FD

	thumb_func_start sub_0802822C
sub_0802822C: @ 0x0802822C
	push {lr}
	bl sub_08032420
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_08028238
sub_08028238: @ 0x08028238
	push {r4, lr}
	adds r4, r1, #0
	movs r0, #0
	ldrsb r0, [r4, r0]
	movs r1, #1
	ldrsb r1, [r4, r1]
	bl sub_0801EF94
	movs r0, #2
	ldrsb r0, [r4, r0]
	bl GetUnit
	bl sub_08032434
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_0802825C
sub_0802825C: @ 0x0802825C
	push {r4, lr}
	bl _call_via_r1
	ldr r0, _0802828C @ =gBmMapMovement
	ldr r0, [r0]
	movs r1, #1
	rsbs r1, r1, #0
	bl BmMapFillg
	ldr r0, _08028290 @ =0x08C04DD4
	bl sub_0804B664
	adds r4, r0, #0
	ldr r0, _08028294 @ =0x000006FF
	bl DecodeMsg
	adds r1, r0, #0
	adds r0, r4, #0
	bl sub_08032A90
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0802828C: .4byte gBmMapMovement
_08028290: .4byte 0x08C04DD4
_08028294: .4byte 0x000006FF

	thumb_func_start sub_08028298
sub_08028298: @ 0x08028298
	push {lr}
	bl sub_0803248C
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_080282A4
sub_080282A4: @ 0x080282A4
	push {r4, r5, r6, lr}
	adds r4, r1, #0
	movs r0, #0
	ldrsb r0, [r4, r0]
	movs r1, #1
	ldrsb r1, [r4, r1]
	bl sub_0801EF94
	movs r0, #2
	ldrsb r0, [r4, r0]
	bl GetUnit
	adds r6, r0, #0
	ldr r0, _080282E0 @ =gActiveUnit
	ldr r5, [r0]
	movs r0, #2
	ldrsb r0, [r4, r0]
	bl GetUnit
	adds r1, r0, #0
	adds r0, r5, #0
	bl GetOffensiveStaffAccuracy
	adds r1, r0, #0
	adds r0, r6, #0
	bl sub_080324AC
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_080282E0: .4byte gActiveUnit

	thumb_func_start sub_080282E4
sub_080282E4: @ 0x080282E4
	push {lr}
	bl sub_08032CCC
	bl ClearBg0Bg1
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_080282F4
sub_080282F4: @ 0x080282F4
	push {lr}
	adds r2, r0, #0
	ldr r0, [r2]
	ldr r1, [r2, #4]
	ldr r0, [r0, #0x28]
	ldr r1, [r1, #0x28]
	orrs r0, r1
	movs r1, #0x80
	lsls r1, r1, #0x12
	ands r0, r1
	cmp r0, #0
	beq _08028320
	movs r0, #0x10
	ldrsb r0, [r2, r0]
	movs r1, #0x11
	ldrsb r1, [r2, r1]
	bl GetTrapAt
	cmp r0, #0
	bne _08028320
	movs r0, #1
	b _08028322
_08028320:
	movs r0, #0
_08028322:
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_08028328
sub_08028328: @ 0x08028328
	push {r4, lr}
	ldr r0, _08028348 @ =0x08C04E94
	ldr r1, _0802834C @ =sub_08027B0C
	bl sub_0804B6CC
	adds r4, r0, #0
	ldr r0, _08028350 @ =0x000006FA
	bl DecodeMsg
	adds r1, r0, #0
	adds r0, r4, #0
	bl sub_08032A90
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08028348: .4byte 0x08C04E94
_0802834C: .4byte sub_08027B0C
_08028350: .4byte 0x000006FA

	thumb_func_start sub_08028354
sub_08028354: @ 0x08028354
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r1, _080283A0 @ =gBmSt
	movs r0, #1
	ldrb r2, [r1, #4]
	orrs r0, r2
	strb r0, [r1, #4]
	ldr r0, _080283A4 @ =0x0000072E
	bl DecodeMsg
	adds r1, r0, #0
	adds r0, r5, #0
	bl sub_08032A90
	ldr r4, _080283A8 @ =gActiveUnit
	ldr r1, [r4]
	movs r0, #0x10
	ldrsb r0, [r1, r0]
	ldrb r1, [r1, #0x11]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	bl sub_080161EC
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08028398
	ldr r0, [r4]
	movs r1, #0x10
	ldrsb r1, [r0, r1]
	movs r2, #0x11
	ldrsb r2, [r0, r2]
	adds r0, r5, #0
	bl sub_0801615C
_08028398:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080283A0: .4byte gBmSt
_080283A4: .4byte 0x0000072E
_080283A8: .4byte gActiveUnit

	thumb_func_start sub_080283AC
sub_080283AC: @ 0x080283AC
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	ldr r5, _0802840C @ =gBmSt
	movs r0, #0x14
	ldrsh r2, [r5, r0]
	movs r1, #0x16
	ldrsh r0, [r5, r1]
	ldr r1, _08028410 @ =0x0202E3E4
	ldr r1, [r1]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	adds r0, r0, r2
	ldrb r4, [r0]
	bl sub_0801C584
	ldr r0, _08028414 @ =gpKeySt
	ldr r1, [r0]
	movs r0, #1
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _0802843C
	cmp r4, #0
	beq _08028428
	ldr r0, _08028418 @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080283F0
	ldr r0, _0802841C @ =0x0000038A
	bl m4aSongNumStart
_080283F0:
	adds r0, r6, #0
	bl Proc_Break
	ldr r1, _08028420 @ =gActionSt
	ldrh r0, [r5, #0x14]
	strb r0, [r1, #0x13]
	ldrh r0, [r5, #0x16]
	strb r0, [r1, #0x14]
	ldr r0, _08028424 @ =gActiveUnit
	ldr r0, [r0]
	bl sub_08027AD8
	b _08028482
	.align 2, 0
_0802840C: .4byte gBmSt
_08028410: .4byte 0x0202E3E4
_08028414: .4byte gpKeySt
_08028418: .4byte gPlaySt
_0802841C: .4byte 0x0000038A
_08028420: .4byte gActionSt
_08028424: .4byte gActiveUnit
_08028428:
	ldr r0, _08028488 @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0802843C
	movs r0, #0xe3
	lsls r0, r0, #2
	bl m4aSongNumStart
_0802843C:
	ldr r0, _0802848C @ =gpKeySt
	ldr r1, [r0]
	movs r0, #2
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _08028472
	ldr r0, _08028490 @ =gBg2Tm
	movs r1, #0
	bl BG_Fill
	movs r0, #4
	bl EnableBgSync
	adds r0, r6, #0
	movs r1, #0x63
	bl Proc_Goto
	ldr r0, _08028488 @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08028472
	ldr r0, _08028494 @ =0x0000038B
	bl m4aSongNumStart
_08028472:
	ldr r1, _08028498 @ =gBmSt
	movs r2, #0x20
	ldrsh r0, [r1, r2]
	movs r2, #0x22
	ldrsh r1, [r1, r2]
	movs r2, #1
	bl sub_08015DE8
_08028482:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08028488: .4byte gPlaySt
_0802848C: .4byte gpKeySt
_08028490: .4byte gBg2Tm
_08028494: .4byte 0x0000038B
_08028498: .4byte gBmSt

	thumb_func_start sub_0802849C
sub_0802849C: @ 0x0802849C
	push {lr}
	ldr r0, _080284BC @ =0x08C034D0
	movs r1, #3
	bl Proc_Start
	ldr r0, _080284C0 @ =gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080284B8
	ldr r0, _080284C4 @ =0x0000038A
	bl m4aSongNumStart
_080284B8:
	pop {r0}
	bx r0
	.align 2, 0
_080284BC: .4byte 0x08C034D0
_080284C0: .4byte gPlaySt
_080284C4: .4byte 0x0000038A

	thumb_func_start sub_080284C8
sub_080284C8: @ 0x080284C8
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	adds r0, r4, #0
	bl GetItemAttributes
	movs r1, #4
	ands r1, r0
	cmp r1, #0
	beq _080284DE
	b _08028618
_080284DE:
	adds r0, r4, #0
	bl GetItemIndex
	subs r0, #0x5a
	cmp r0, #0x3c
	bls _080284EC
	b _08028618
_080284EC:
	lsls r0, r0, #2
	ldr r1, _080284F8 @ =_080284FC
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080284F8: .4byte _080284FC
_080284FC: @ jump table
	.4byte _080285F0 @ case 0
	.4byte _080285F0 @ case 1
	.4byte _080285F0 @ case 2
	.4byte _080285F0 @ case 3
	.4byte _080285F0 @ case 4
	.4byte _080285F0 @ case 5
	.4byte _080285F0 @ case 6
	.4byte _080285F0 @ case 7
	.4byte _080285F0 @ case 8
	.4byte _080285FA @ case 9
	.4byte _080285FA @ case 10
	.4byte _080285FA @ case 11
	.4byte _080285FA @ case 12
	.4byte _080285FA @ case 13
	.4byte _08028618 @ case 14
	.4byte _08028618 @ case 15
	.4byte _08028618 @ case 16
	.4byte _08028618 @ case 17
	.4byte _08028618 @ case 18
	.4byte _08028618 @ case 19
	.4byte _08028618 @ case 20
	.4byte _08028618 @ case 21
	.4byte _08028618 @ case 22
	.4byte _08028618 @ case 23
	.4byte _08028618 @ case 24
	.4byte _08028618 @ case 25
	.4byte _08028618 @ case 26
	.4byte _08028618 @ case 27
	.4byte _08028618 @ case 28
	.4byte _08028618 @ case 29
	.4byte _08028618 @ case 30
	.4byte _08028618 @ case 31
	.4byte _08028618 @ case 32
	.4byte _08028618 @ case 33
	.4byte _08028618 @ case 34
	.4byte _08028618 @ case 35
	.4byte _08028618 @ case 36
	.4byte _08028618 @ case 37
	.4byte _08028618 @ case 38
	.4byte _08028618 @ case 39
	.4byte _08028618 @ case 40
	.4byte _08028618 @ case 41
	.4byte _08028618 @ case 42
	.4byte _08028618 @ case 43
	.4byte _08028618 @ case 44
	.4byte _080285FA @ case 45
	.4byte _08028608 @ case 46
	.4byte _080285FA @ case 47
	.4byte _08028618 @ case 48
	.4byte _080285FA @ case 49
	.4byte _08028618 @ case 50
	.4byte _08028618 @ case 51
	.4byte _08028618 @ case 52
	.4byte _08028618 @ case 53
	.4byte _08028618 @ case 54
	.4byte _08028618 @ case 55
	.4byte _08028618 @ case 56
	.4byte _08028618 @ case 57
	.4byte _08028618 @ case 58
	.4byte _08028618 @ case 59
	.4byte _080285FA @ case 60
_080285F0:
	adds r0, r5, #0
	adds r1, r4, #0
	bl sub_08027A04
	b _08028602
_080285FA:
	adds r0, r5, #0
	adds r1, r4, #0
	bl sub_0802788C
_08028602:
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	b _0802861A
_08028608:
	ldr r0, [r5, #0xc]
	movs r1, #0x80
	lsls r1, r1, #6
	ands r0, r1
	cmp r0, #0
	bne _08028618
	movs r0, #1
	b _0802861A
_08028618:
	movs r0, #0
_0802861A:
	pop {r4, r5}
	pop {r1}
	bx r1

	thumb_func_start sub_08028620
sub_08028620: @ 0x08028620
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	bl GetUnitItemCount
	adds r5, r0, #0
	movs r4, #0
	cmp r4, r5
	bge _0802864C
_08028630:
	lsls r1, r4, #1
	adds r0, r6, #0
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r0, [r0]
	bl GetItemIndex
	cmp r0, #0x8a
	bne _08028646
	movs r0, #1
	b _0802864E
_08028646:
	adds r4, #1
	cmp r4, r5
	blt _08028630
_0802864C:
	movs r0, #0
_0802864E:
	pop {r4, r5, r6}
	pop {r1}
	bx r1
