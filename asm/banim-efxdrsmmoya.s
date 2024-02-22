	.include "macro.inc"
	.syntax unified

	thumb_func_start EfxDrsmmoya_Loop
EfxDrsmmoya_Loop: @ 0x08064478
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r6, r0, #0
	ldr r0, [r6, #0x5c]
	bl GetAnimAnotherSide
	adds r1, r0, #0
	ldrh r0, [r6, #0x2c]
	adds r0, #1
	strh r0, [r6, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	bne _080644C4
	adds r0, r1, #0
	bl NewEfxDrsmmoyaBG
	ldr r0, [r6, #0x5c]
	bl CheckRoundCrit
	cmp r0, #1
	bne _080644AA
	movs r0, #0xba
	lsls r0, r0, #2
	b _080644AC
_080644AA:
	ldr r0, _080644C0 @ =0x000002E3
_080644AC:
	movs r1, #0x80
	lsls r1, r1, #1
	ldr r2, [r6, #0x5c]
	movs r3, #2
	ldrsh r2, [r2, r3]
	movs r3, #1
	bl PlaySFX
	b _08064520
	.align 2, 0
_080644C0: .4byte 0x000002E3
_080644C4:
	cmp r0, #0x1a
	bne _080644EA
	ldr r0, [r6, #0x5c]
	movs r1, #0x41
	bl sub_8064644
	adds r1, r0, #0
	ldr r0, [r6, #0x5c]
	movs r2, #0xa
	str r2, [sp]
	movs r3, #0x2d
	bl sub_80646EC
	ldr r0, [r6, #0x5c]
	movs r1, #0x41
	movs r2, #1
	bl NewEfxRestWINH_
	b _08064520
_080644EA:
	cmp r0, #0x6f
	bne _08064520
	ldr r5, _08064528 @ =gAnims
	ldr r0, [r6, #0x5c]
	bl GetAnimPosition
	lsls r0, r0, #3
	adds r0, r0, r5
	ldr r4, [r0]
	ldr r0, [r6, #0x5c]
	bl GetAnimPosition
	lsls r0, r0, #1
	adds r0, #1
	lsls r0, r0, #2
	adds r0, r0, r5
	ldr r2, [r0]
	movs r0, #0x40
	ldrh r1, [r4, #0x10]
	orrs r1, r0
	strh r1, [r4, #0x10]
	ldrh r1, [r2, #0x10]
	orrs r0, r1
	strh r0, [r2, #0x10]
	adds r0, r6, #0
	bl Proc_Break
_08064520:
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08064528: .4byte gAnims

	thumb_func_start NewEfxDrsmmoyaBG
NewEfxDrsmmoyaBG: @ 0x0806452C
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r0, _080645A8 @ =ProcScr_EfxDrsmmoyaBG
	movs r1, #3
	bl Proc_Start
	adds r5, r0, #0
	str r4, [r5, #0x5c]
	movs r4, #0
	movs r1, #0
	strh r1, [r5, #0x2c]
	str r1, [r5, #0x44]
	ldr r0, _080645AC @ =gUnk_081EF406
	str r0, [r5, #0x48]
	ldr r0, _080645B0 @ =gUnk_08C13A7C
	str r0, [r5, #0x4c]
	str r0, [r5, #0x50]
	ldr r0, _080645B4 @ =gUnk_08C13AB0
	str r0, [r5, #0x54]
	str r1, [r5, #0x58]
	ldr r0, _080645B8 @ =gUnk_082BE028
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
	bl SpellFx_SetSomeColorEffect
	ldr r3, _080645BC @ =gDispIo
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
	movs r0, #0xb
	strb r0, [r1]
	adds r1, #1
	movs r0, #7
	strb r0, [r1]
	adds r0, r3, #0
	adds r0, #0x46
	strb r4, [r0]
	ldr r0, _080645C0 @ =gEkrDistanceType
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	beq _080645CE
	ldr r0, [r5, #0x5c]
	bl GetAnimPosition
	cmp r0, #0
	bne _080645C4
	movs r0, #1
	movs r1, #0xe8
	movs r2, #0
	bl SetBgOffset
	b _080645CE
	.align 2, 0
_080645A8: .4byte ProcScr_EfxDrsmmoyaBG
_080645AC: .4byte gUnk_081EF406
_080645B0: .4byte gUnk_08C13A7C
_080645B4: .4byte gUnk_08C13AB0
_080645B8: .4byte gUnk_082BE028
_080645BC: .4byte gDispIo
_080645C0: .4byte gEkrDistanceType
_080645C4:
	movs r0, #1
	movs r1, #0x18
	movs r2, #0
	bl SetBgOffset
_080645CE:
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start sub_80645D4
sub_80645D4: @ 0x080645D4
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r4, r0, #0
	adds r0, #0x2c
	adds r1, r4, #0
	adds r1, #0x44
	ldr r2, [r4, #0x48]
	bl EfxAdvanceFrameLut
	lsls r0, r0, #0x10
	asrs r1, r0, #0x10
	cmp r1, #0
	blt _08064624
	ldr r7, [r4, #0x4c]
	ldr r0, [r4, #0x50]
	mov r8, r0
	ldr r0, [r4, #0x54]
	lsls r5, r1, #2
	adds r6, r5, r0
	ldr r0, [r4, #0x58]
	ldr r2, [r6]
	cmp r0, r2
	beq _0806460E
	movs r1, #0x80
	lsls r1, r1, #6
	adds r0, r2, #0
	bl SpellFx_RegisterBgGfx
_0806460E:
	ldr r0, [r6]
	str r0, [r4, #0x58]
	ldr r0, [r4, #0x5c]
	adds r1, r5, r7
	ldr r1, [r1]
	mov r3, r8
	adds r2, r5, r3
	ldr r2, [r2]
	bl SpellFx_WriteBgMap
	b _0806463A
_08064624:
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	bne _0806463A
	bl SpellFx_ClearBG1
	bl SpellFx_ClearColorEffects
	adds r0, r4, #0
	bl Proc_Break
_0806463A:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_8064644
sub_8064644: @ 0x08064644
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r0, _08064668 @ =gUnk_08C13AE4
	movs r1, #3
	bl Proc_Start
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	strh r1, [r0, #0x2e]
	str r5, [r0, #0x44]
	movs r1, #0x80
	lsls r1, r1, #1
	str r1, [r0, #0x48]
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_08064668: .4byte gUnk_08C13AE4

	thumb_func_start sub_806466C
sub_806466C: @ 0x0806466C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r2, r0, #0
	ldr r0, _080646DC @ =gEkrBg1ScrollFlip
	ldr r0, [r0]
	ldr r4, _080646E0 @ =gpBg1ScrollOffsetList2
	cmp r0, #0
	bne _08064680
	ldr r4, _080646E4 @ =gpBg1ScrollOffsetList1
_08064680:
	movs r3, #0
	ldr r0, [r2, #0x44]
	mov ip, r0
	ldr r1, _080646E8 @ =gSinLut
	mov r8, r1
	movs r6, #0xff
	ldr r5, [r2, #0x48]
_0806468E:
	lsls r0, r3, #1
	movs r7, #0x2e
	ldrsh r1, [r2, r7]
	adds r0, r0, r1
	ands r0, r6
	lsls r0, r0, #1
	add r0, r8
	movs r1, #0
	ldrsh r0, [r0, r1]
	asrs r0, r0, #9
	adds r0, #4
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	muls r0, r5, r0
	asrs r0, r0, #8
	strh r0, [r4]
	adds r4, #2
	adds r3, #1
	cmp r3, #0x4f
	bls _0806468E
	ldrh r0, [r2, #0x2e]
	adds r0, #2
	strh r0, [r2, #0x2e]
	ldrh r0, [r2, #0x2c]
	adds r0, #1
	strh r0, [r2, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, ip
	bne _080646D0
	adds r0, r2, #0
	bl Proc_End
_080646D0:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080646DC: .4byte gEkrBg1ScrollFlip
_080646E0: .4byte gpBg1ScrollOffsetList2
_080646E4: .4byte gpBg1ScrollOffsetList1
_080646E8: .4byte gSinLut

	thumb_func_start sub_80646EC
sub_80646EC: @ 0x080646EC
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r4, r0, #0
	mov r8, r1
	adds r5, r2, #0
	adds r6, r3, #0
	ldr r7, [sp, #0x18]
	ldr r0, _08064720 @ =gUnk_08C13AFC
	movs r1, #3
	bl Proc_Start
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	str r5, [r0, #0x44]
	str r6, [r0, #0x48]
	str r7, [r0, #0x4c]
	mov r1, r8
	str r1, [r0, #0x64]
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08064720: .4byte gUnk_08C13AFC

	thumb_func_start sub_8064724
sub_8064724: @ 0x08064724
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	ldr r4, [r5, #0x64]
	movs r2, #0x80
	lsls r2, r2, #1
	movs r0, #0x2c
	ldrsh r3, [r5, r0]
	ldr r0, [r5, #0x44]
	str r0, [sp]
	movs r0, #0
	movs r1, #0
	bl Interpolate
	str r0, [r4, #0x48]
	ldrh r0, [r5, #0x2c]
	adds r0, #1
	strh r0, [r5, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	ldr r1, [r5, #0x44]
	cmp r0, r1
	ble _0806475C
	movs r0, #0
	strh r0, [r5, #0x2c]
	adds r0, r5, #0
	bl Proc_Break
_0806475C:
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start sub_8064764
sub_8064764: @ 0x08064764
	push {lr}
	adds r2, r0, #0
	ldrh r0, [r2, #0x2c]
	adds r0, #1
	strh r0, [r2, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	ldr r1, [r2, #0x48]
	cmp r0, r1
	ble _08064782
	movs r0, #0
	strh r0, [r2, #0x2c]
	adds r0, r2, #0
	bl Proc_Break
_08064782:
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_8064788
sub_8064788: @ 0x08064788
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	ldr r4, [r5, #0x64]
	movs r1, #0x80
	lsls r1, r1, #1
	movs r0, #0x2c
	ldrsh r3, [r5, r0]
	ldr r0, [r5, #0x4c]
	str r0, [sp]
	movs r0, #0
	movs r2, #0
	bl Interpolate
	str r0, [r4, #0x48]
	ldrh r0, [r5, #0x2c]
	adds r0, #1
	strh r0, [r5, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	ldr r1, [r5, #0x4c]
	cmp r0, r1
	ble _080647C0
	movs r0, #0
	strh r0, [r5, #0x2c]
	adds r0, r5, #0
	bl Proc_Break
_080647C0:
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
