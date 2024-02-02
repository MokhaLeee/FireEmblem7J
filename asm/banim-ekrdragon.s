	.include "macro.inc"
	.syntax unified

	thumb_func_start EkrDragonStatusFlashing_Loop
EkrDragonStatusFlashing_Loop: @ 0x08066118
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x5c]
	bl GetEkrDragonStatusAttr
	movs r1, #2
	ands r1, r0
	cmp r1, #0
	beq _08066134
	ldr r0, [r4, #0x5c]
	bl GetUnitEfxDebuff
	cmp r0, #0
	bne _080661FA
_08066134:
	adds r0, r4, #0
	adds r0, #0x29
	ldrb r1, [r0]
	adds r5, r0, #0
	cmp r1, #0
	beq _08066146
	cmp r1, #1
	beq _08066160
	b _0806617C
_08066146:
	strh r1, [r4, #0x2c]
	str r1, [r4, #0x44]
	ldr r0, _08066158 @ =gUnk_082E420C
	str r0, [r4, #0x48]
	ldr r0, _0806615C @ =Pal_EkrDragon_082E6C60
	str r0, [r4, #0x4c]
	movs r0, #0x64
	strb r0, [r5]
	b _0806617C
	.align 2, 0
_08066158: .4byte gUnk_082E420C
_0806615C: .4byte Pal_EkrDragon_082E6C60
_08066160:
	movs r0, #0
	strh r0, [r4, #0x2c]
	str r0, [r4, #0x44]
	ldr r0, _080661A8 @ =gUnk_082E421E
	str r0, [r4, #0x48]
	ldr r0, _080661AC @ =Pal_EkrDragon_082E6C60
	str r0, [r4, #0x4c]
	movs r0, #0x64
	strb r0, [r5]
	ldr r0, [r4, #0x5c]
	movs r1, #0x3c
	movs r2, #0xa
	bl sub_080569B8
_0806617C:
	adds r0, r4, #0
	adds r0, #0x2c
	adds r1, r4, #0
	adds r1, #0x44
	ldr r2, [r4, #0x48]
	bl EfxAdvanceFrameLut
	lsls r0, r0, #0x10
	asrs r1, r0, #0x10
	cmp r1, #0
	blt _080661B4
	ldr r0, [r4, #0x4c]
	lsls r1, r1, #5
	adds r0, r0, r1
	ldr r1, _080661B0 @ =gPal + 0xc0
	movs r2, #8
	bl CpuFastSet
	bl EnablePalSync
	b _080661D8
	.align 2, 0
_080661A8: .4byte gUnk_082E421E
_080661AC: .4byte Pal_EkrDragon_082E6C60
_080661B0: .4byte gPal + 0xc0
_080661B4:
	movs r0, #6
	rsbs r0, r0, #0
	cmp r1, r0
	bne _080661C2
	movs r0, #0
	strb r0, [r5]
	b _080661D8
_080661C2:
	movs r0, #5
	rsbs r0, r0, #0
	cmp r1, r0
	bne _080661D8
	ldr r0, [r4, #0x5c]
	movs r1, #5
	bl NewEfxFlashBgWhite
	ldr r0, [r4, #0x44]
	adds r0, #1
	str r0, [r4, #0x44]
_080661D8:
	ldr r0, [r4, #0x5c]
	ldrb r1, [r0, #0x12]
	ldr r0, [r4, #0x54]
	cmp r1, r0
	beq _080661F4
	adds r0, r1, #0
	cmp r0, #1
	beq _080661EC
	cmp r0, #3
	bne _080661F0
_080661EC:
	movs r0, #1
	b _080661F2
_080661F0:
	movs r0, #0
_080661F2:
	strb r0, [r5]
_080661F4:
	ldr r0, [r4, #0x5c]
	ldrb r0, [r0, #0x12]
	str r0, [r4, #0x54]
_080661FA:
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start sub_08066200
sub_08066200: @ 0x08066200
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08066220 @ =gUnk_08C487B4
	movs r1, #4
	bl Proc_Start
	adds r2, r0, #0
	adds r2, #0x29
	movs r1, #0
	strb r1, [r2]
	str r4, [r0, #0x5c]
	ldrb r1, [r4, #0x12]
	str r1, [r0, #0x54]
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08066220: .4byte gUnk_08C487B4

	thumb_func_start sub_08066224
sub_08066224: @ 0x08066224
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x5c]
	bl GetEkrDragonStatusAttr
	movs r1, #2
	ands r1, r0
	cmp r1, #0
	beq _08066240
	ldr r0, [r4, #0x5c]
	bl GetUnitEfxDebuff
	cmp r0, #0
	bne _080662EE
_08066240:
	adds r0, r4, #0
	adds r0, #0x29
	ldrb r1, [r0]
	adds r5, r0, #0
	cmp r1, #0
	beq _08066252
	cmp r1, #1
	beq _08066260
	b _08066272
_08066252:
	strh r1, [r4, #0x2c]
	str r1, [r4, #0x44]
	ldr r0, _0806625C @ =gUnk_082E4318
	b _08066268
	.align 2, 0
_0806625C: .4byte gUnk_082E4318
_08066260:
	movs r0, #0
	strh r0, [r4, #0x2c]
	str r0, [r4, #0x44]
	ldr r0, _0806629C @ =gUnk_082E431E
_08066268:
	str r0, [r4, #0x48]
	ldr r0, _080662A0 @ =gUnk_082E9CF8
	str r0, [r4, #0x4c]
	movs r0, #0x64
	strb r0, [r5]
_08066272:
	adds r0, r4, #0
	adds r0, #0x2c
	adds r1, r4, #0
	adds r1, #0x44
	ldr r2, [r4, #0x48]
	bl EfxAdvanceFrameLut
	lsls r0, r0, #0x10
	asrs r1, r0, #0x10
	cmp r1, #0
	blt _080662A8
	ldr r0, [r4, #0x4c]
	lsls r1, r1, #5
	adds r0, r0, r1
	ldr r1, _080662A4 @ =gPal + 0x2e0
	movs r2, #8
	bl CpuFastSet
	bl EnablePalSync
	b _080662CC
	.align 2, 0
_0806629C: .4byte gUnk_082E431E
_080662A0: .4byte gUnk_082E9CF8
_080662A4: .4byte gPal + 0x2e0
_080662A8:
	movs r0, #6
	rsbs r0, r0, #0
	cmp r1, r0
	bne _080662B6
	movs r0, #0
	strb r0, [r5]
	b _080662CC
_080662B6:
	movs r0, #5
	rsbs r0, r0, #0
	cmp r1, r0
	bne _080662CC
	ldr r0, [r4, #0x5c]
	movs r1, #5
	bl NewEfxFlashBgWhite
	ldr r0, [r4, #0x44]
	adds r0, #1
	str r0, [r4, #0x44]
_080662CC:
	ldr r0, [r4, #0x5c]
	ldrb r1, [r0, #0x12]
	ldr r0, [r4, #0x54]
	cmp r1, r0
	beq _080662E8
	adds r0, r1, #0
	cmp r0, #1
	beq _080662E0
	cmp r0, #3
	bne _080662E4
_080662E0:
	movs r0, #1
	b _080662E6
_080662E4:
	movs r0, #0
_080662E6:
	strb r0, [r5]
_080662E8:
	ldr r0, [r4, #0x5c]
	ldrb r0, [r0, #0x12]
	str r0, [r4, #0x54]
_080662EE:
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start sub_080662F4
sub_080662F4: @ 0x080662F4
	push {r4, r5, r6, lr}
	sub sp, #8
	adds r4, r0, #0
	ldr r0, _08066358 @ =gUnk_08C487CC
	movs r1, #3
	bl Proc_Start
	adds r5, r0, #0
	str r4, [r5, #0x5c]
	movs r0, #0
	strh r0, [r5, #0x2c]
	ldr r0, _0806635C @ =gUnk_082EA9A4
	ldr r1, _08066360 @ =0x06005000
	bl LZ77UnCompVram
	ldr r0, _08066364 @ =gUnk_082EB530
	ldr r6, _08066368 @ =gEkrTsaBuffer
	adds r1, r6, #0
	bl LZ77UnCompWram
	ldr r0, _0806636C @ =Pal_EkrDragon_082EB510
	ldr r1, _08066370 @ =gPal + 0x80
	movs r2, #8
	bl CpuFastSet
	ldr r4, _08066374 @ =gBg2Tm
	adds r0, r4, #0
	movs r1, #0x1f
	bl TmFill
	movs r0, #4
	str r0, [sp]
	movs r0, #0xa0
	lsls r0, r0, #2
	str r0, [sp, #4]
	adds r0, r6, #0
	adds r1, r4, #0
	movs r2, #0x20
	movs r3, #0x20
	bl EfxTmCpyBG
	movs r0, #4
	bl EnableBgSync
	adds r0, r5, #0
	add sp, #8
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_08066358: .4byte gUnk_08C487CC
_0806635C: .4byte gUnk_082EA9A4
_08066360: .4byte 0x06005000
_08066364: .4byte gUnk_082EB530
_08066368: .4byte gEkrTsaBuffer
_0806636C: .4byte Pal_EkrDragon_082EB510
_08066370: .4byte gPal + 0x80
_08066374: .4byte gBg2Tm

	thumb_func_start nullsub_53
nullsub_53: @ 0x08066378
	bx lr
	.align 2, 0

	thumb_func_start nullsub_54
nullsub_54: @ 0x0806637C
	bx lr
	.align 2, 0

	thumb_func_start sub_08066380
sub_08066380: @ 0x08066380
	push {lr}
	ldr r0, _08066394 @ =gUnk_08C487EC
	movs r1, #3
	bl Proc_Start
	movs r1, #0
	strh r1, [r0, #0x2c]
	pop {r1}
	bx r1
	.align 2, 0
_08066394: .4byte gUnk_08C487EC

	thumb_func_start sub_08066398
sub_08066398: @ 0x08066398
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	ldr r0, _080663DC @ =gEkrBg2ScrollFlip
	ldr r0, [r0]
	ldr r3, _080663E0 @ =gpEkrLvupBg2ScrollOffsetTable2
	cmp r0, #0
	bne _080663A8
	ldr r3, _080663E4 @ =gpEkrLvupBg2ScrollOffsetTable1
_080663A8:
	movs r2, #0
	ldr r6, _080663E8 @ =gSinLut
	movs r5, #0xff
_080663AE:
	lsls r0, r2, #1
	movs r7, #0x2c
	ldrsh r1, [r4, r7]
	adds r0, r0, r1
	ands r0, r5
	lsls r0, r0, #1
	adds r0, r0, r6
	movs r1, #0
	ldrsh r0, [r0, r1]
	asrs r0, r0, #0xa
	adds r0, #4
	strh r0, [r3]
	adds r3, #2
	adds r2, #1
	cmp r2, #0x9f
	bls _080663AE
	ldrh r0, [r4, #0x2c]
	adds r0, #2
	strh r0, [r4, #0x2c]
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080663DC: .4byte gEkrBg2ScrollFlip
_080663E0: .4byte gpEkrLvupBg2ScrollOffsetTable2
_080663E4: .4byte gpEkrLvupBg2ScrollOffsetTable1
_080663E8: .4byte gSinLut

	thumb_func_start sub_080663EC
sub_080663EC: @ 0x080663EC
	ldr r0, _08066408 @ =0x04000004
	ldrh r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	bne _08066406
	ldr r3, _0806640C @ =0x0400001A
	ldr r2, _08066410 @ =gpEkrLvupBg2ScrollOffset
	ldr r0, [r2]
	ldrh r1, [r0]
	strh r1, [r3]
	adds r0, #2
	str r0, [r2]
_08066406:
	bx lr
	.align 2, 0
_08066408: .4byte 0x04000004
_0806640C: .4byte 0x0400001A
_08066410: .4byte gpEkrLvupBg2ScrollOffset

	thumb_func_start sub_08066414
sub_08066414: @ 0x08066414
	push {r4, r5, r6, r7, lr}
	ldr r2, _08066464 @ =gpEkrLvupBg2ScrollOffsetTable2
	movs r1, #0
	adds r0, r2, #0
	ldr r4, _08066468 @ =gpEkrLvupBg2ScrollOffsetTable1
	ldr r5, _0806646C @ =gEkrBg2ScrollFlip
	ldr r6, _08066470 @ =gpEkrLvupBg2ScrollOffsetStart
	ldr r7, _08066474 @ =gpEkrLvupBg2ScrollOffset
	ldr r3, _08066478 @ =sub_080663EC
	mov ip, r3
	movs r3, #0
_0806642A:
	strh r3, [r2]
	adds r2, #2
	adds r1, #1
	cmp r1, #0x9f
	bls _0806642A
	adds r2, r4, #0
	movs r1, #0
	movs r3, #0
_0806643A:
	strh r3, [r2]
	adds r2, #2
	adds r1, #1
	cmp r1, #0x9f
	bls _0806643A
	movs r4, #0
	str r4, [r5]
	str r0, [r6]
	str r0, [r7]
	mov r0, ip
	bl SetOnHBlankA
	ldr r0, _0806647C @ =gUnk_08C48804
	movs r1, #0
	bl Proc_Start
	strh r4, [r0, #0x2c]
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_08066464: .4byte gpEkrLvupBg2ScrollOffsetTable2
_08066468: .4byte gpEkrLvupBg2ScrollOffsetTable1
_0806646C: .4byte gEkrBg2ScrollFlip
_08066470: .4byte gpEkrLvupBg2ScrollOffsetStart
_08066474: .4byte gpEkrLvupBg2ScrollOffset
_08066478: .4byte sub_080663EC
_0806647C: .4byte gUnk_08C48804

	thumb_func_start sub_08066480
sub_08066480: @ 0x08066480
	push {lr}
	movs r0, #0
	bl SetOnHBlankA
	pop {r0}
	bx r0

	thumb_func_start sub_0806648C
sub_0806648C: @ 0x0806648C
	ldr r1, _080664A0 @ =gEkrBg2ScrollFlip
	ldr r0, [r1]
	cmp r0, #1
	bne _080664AC
	movs r0, #0
	str r0, [r1]
	ldr r1, _080664A4 @ =gpEkrLvupBg2ScrollOffsetStart
	ldr r0, _080664A8 @ =gpEkrLvupBg2ScrollOffsetTable2
	b _080664B4
	.align 2, 0
_080664A0: .4byte gEkrBg2ScrollFlip
_080664A4: .4byte gpEkrLvupBg2ScrollOffsetStart
_080664A8: .4byte gpEkrLvupBg2ScrollOffsetTable2
_080664AC:
	movs r0, #1
	str r0, [r1]
	ldr r1, _080664C0 @ =gpEkrLvupBg2ScrollOffsetStart
	ldr r0, _080664C4 @ =gpEkrLvupBg2ScrollOffsetTable1
_080664B4:
	str r0, [r1]
	adds r0, r1, #0
	ldr r1, _080664C8 @ =gpEkrLvupBg2ScrollOffset
	ldr r0, [r0]
	str r0, [r1]
	bx lr
	.align 2, 0
_080664C0: .4byte gpEkrLvupBg2ScrollOffsetStart
_080664C4: .4byte gpEkrLvupBg2ScrollOffsetTable1
_080664C8: .4byte gpEkrLvupBg2ScrollOffset

	thumb_func_start EkrDragonFxHandler_OnIntro
EkrDragonFxHandler_OnIntro: @ 0x080664CC
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r6, r2, #0
	mov r8, r3
	ldr r0, _080664FC @ =gUnk_08C48824
	movs r1, #3
	bl Proc_Start
	movs r1, #0
	strh r1, [r0, #0x2c]
	strh r1, [r0, #0x2e]
	str r4, [r0, #0x44]
	str r5, [r0, #0x48]
	str r6, [r0, #0x4c]
	mov r1, r8
	str r1, [r0, #0x50]
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_080664FC: .4byte gUnk_08C48824

	thumb_func_start sub_08066500
sub_08066500: @ 0x08066500
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	adds r1, r0, #0
	ldr r0, _0806657C @ =gEkrBg1ScrollFlip
	ldr r0, [r0]
	ldr r2, _08066580 @ =gpEkrLvupBg1ScrollOffsetList2
	cmp r0, #0
	bne _08066518
	ldr r2, _08066584 @ =gpEkrLvupBg1ScrollOffsetList1
_08066518:
	ldr r0, [r1, #0x50]
	ldrh r3, [r1, #0x2e]
	adds r0, r3, r0
	strh r0, [r1, #0x2e]
	movs r4, #0
	movs r3, #0
	ldr r6, [r1, #0x44]
	mov r8, r6
	ldr r7, [r1, #0x48]
	mov sl, r7
	ldr r0, _08066588 @ =gUnk_08C4A008
	mov ip, r0
	ldr r5, [r1, #0x4c]
	ldr r6, _0806658C @ =gDispIo
	mov sb, r6
_08066536:
	add r4, sl
	lsrs r0, r4, #8
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x17
	add r0, ip
	movs r7, #0
	ldrsh r0, [r0, r7]
	muls r0, r5, r0
	asrs r0, r0, #8
	adds r0, #4
	mov r6, sb
	ldrh r6, [r6, #0x28]
	adds r0, r6, r0
	strh r0, [r2]
	adds r2, #2
	adds r3, #1
	cmp r3, #0x77
	bls _08066536
	ldrh r0, [r1, #0x2c]
	adds r0, #1
	strh r0, [r1, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, r8
	bne _0806656E
	adds r0, r1, #0
	bl Proc_End
_0806656E:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806657C: .4byte gEkrBg1ScrollFlip
_08066580: .4byte gpEkrLvupBg1ScrollOffsetList2
_08066584: .4byte gpEkrLvupBg1ScrollOffsetList1
_08066588: .4byte gUnk_08C4A008
_0806658C: .4byte gDispIo

	thumb_func_start sub_08066590
sub_08066590: @ 0x08066590
	ldr r0, _080665AC @ =0x04000004
	ldrh r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	bne _080665AA
	ldr r3, _080665B0 @ =0x0400001C
	ldr r2, _080665B4 @ =gpEkrLvupBg1ScrollOffset
	ldr r0, [r2]
	ldrh r1, [r0]
	strh r1, [r3]
	adds r0, #2
	str r0, [r2]
_080665AA:
	bx lr
	.align 2, 0
_080665AC: .4byte 0x04000004
_080665B0: .4byte 0x0400001C
_080665B4: .4byte gpEkrLvupBg1ScrollOffset

	thumb_func_start sub_080665B8
sub_080665B8: @ 0x080665B8
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	mov r8, r0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	ldr r3, _08066618 @ =gpEkrLvupBg1ScrollOffsetList2
	movs r2, #0
	adds r0, r3, #0
	ldr r4, _0806661C @ =gpEkrLvupBg1ScrollOffsetList1
	ldr r7, _08066620 @ =gEkrBg1ScrollFlip
	ldr r5, _08066624 @ =gpEkrLvupBg1ScrollOffsetStart
	mov ip, r5
	ldr r5, _08066628 @ =gpEkrLvupBg1ScrollOffset
	ldr r6, _0806662C @ =sub_08066590
_080665D6:
	strh r1, [r3]
	adds r3, #2
	adds r2, #1
	cmp r2, #0x9f
	bls _080665D6
	adds r3, r4, #0
	movs r2, #0
_080665E4:
	strh r1, [r3]
	adds r3, #2
	adds r2, #1
	cmp r2, #0x9f
	bls _080665E4
	movs r4, #0
	str r4, [r7]
	mov r1, ip
	str r0, [r1]
	str r0, [r5]
	adds r0, r6, #0
	bl SetOnHBlankA
	ldr r0, _08066630 @ =gUnk_08C4883C
	movs r1, #0
	bl Proc_Start
	strh r4, [r0, #0x2c]
	mov r5, r8
	str r5, [r0, #0x44]
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08066618: .4byte gpEkrLvupBg1ScrollOffsetList2
_0806661C: .4byte gpEkrLvupBg1ScrollOffsetList1
_08066620: .4byte gEkrBg1ScrollFlip
_08066624: .4byte gpEkrLvupBg1ScrollOffsetStart
_08066628: .4byte gpEkrLvupBg1ScrollOffset
_0806662C: .4byte sub_08066590
_08066630: .4byte gUnk_08C4883C

	thumb_func_start sub_08066634
sub_08066634: @ 0x08066634
	push {lr}
	bl Proc_Break
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_08066640
sub_08066640: @ 0x08066640
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, _08066658 @ =gEkrBg1ScrollFlip
	ldr r0, [r1]
	cmp r0, #1
	bne _08066664
	movs r0, #0
	str r0, [r1]
	ldr r1, _0806665C @ =gpEkrLvupBg1ScrollOffsetStart
	ldr r0, _08066660 @ =gpEkrLvupBg1ScrollOffsetList2
	b _0806666C
	.align 2, 0
_08066658: .4byte gEkrBg1ScrollFlip
_0806665C: .4byte gpEkrLvupBg1ScrollOffsetStart
_08066660: .4byte gpEkrLvupBg1ScrollOffsetList2
_08066664:
	movs r0, #1
	str r0, [r1]
	ldr r1, _08066698 @ =gpEkrLvupBg1ScrollOffsetStart
	ldr r0, _0806669C @ =gpEkrLvupBg1ScrollOffsetList1
_0806666C:
	str r0, [r1]
	adds r0, r1, #0
	ldr r1, _080666A0 @ =gpEkrLvupBg1ScrollOffset
	ldr r0, [r0]
	str r0, [r1]
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	ldr r1, [r4, #0x44]
	cmp r0, r1
	bne _08066692
	movs r0, #0
	bl SetOnHBlankA
	adds r0, r4, #0
	bl Proc_Break
_08066692:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08066698: .4byte gpEkrLvupBg1ScrollOffsetStart
_0806669C: .4byte gpEkrLvupBg1ScrollOffsetList1
_080666A0: .4byte gpEkrLvupBg1ScrollOffset

	thumb_func_start sub_080666A4
sub_080666A4: @ 0x080666A4
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _080666CC @ =gUnk_08C4885C
	movs r1, #3
	bl Proc_Start
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	strh r1, [r0, #0x2e]
	str r1, [r0, #0x44]
	str r1, [r0, #0x48]
	ldr r1, _080666D0 @ =gUnk_08C48874
	str r1, [r0, #0x4c]
	movs r1, #0x80
	lsls r1, r1, #5
	str r1, [r0, #0x54]
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080666CC: .4byte gUnk_08C4885C
_080666D0: .4byte gUnk_08C48874

	thumb_func_start sub_080666D4
sub_080666D4: @ 0x080666D4
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x5c]
	ldrb r1, [r0, #0x12]
	ldr r0, [r4, #0x54]
	cmp r0, r1
	beq _08066744
	str r1, [r4, #0x54]
	movs r0, #0
	strh r0, [r4, #0x2c]
	strh r0, [r4, #0x2e]
	str r0, [r4, #0x44]
	cmp r1, #9
	bhi _08066744
	lsls r0, r1, #2
	ldr r1, _080666FC @ =_08066700
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080666FC: .4byte _08066700
_08066700: @ jump table
	.4byte _08066728 @ case 0
	.4byte _08066730 @ case 1
	.4byte _08066728 @ case 2
	.4byte _08066730 @ case 3
	.4byte _08066738 @ case 4
	.4byte _08066738 @ case 5
	.4byte _08066740 @ case 6
	.4byte _08066740 @ case 7
	.4byte _08066740 @ case 8
	.4byte _08066728 @ case 9
_08066728:
	ldr r0, _0806672C @ =gUnk_082E441E
	b _08066742
	.align 2, 0
_0806672C: .4byte gUnk_082E441E
_08066730:
	ldr r0, _08066734 @ =gUnk_082E4430
	b _08066742
	.align 2, 0
_08066734: .4byte gUnk_082E4430
_08066738:
	ldr r0, _0806673C @ =gUnk_082E4442
	b _08066742
	.align 2, 0
_0806673C: .4byte gUnk_082E4442
_08066740:
	ldr r0, _08066778 @ =gUnk_082E4418
_08066742:
	str r0, [r4, #0x48]
_08066744:
	adds r0, r4, #0
	adds r0, #0x2c
	adds r1, r4, #0
	adds r1, #0x44
	ldr r2, [r4, #0x48]
	bl EfxAdvanceFrameLut
	lsls r0, r0, #0x10
	asrs r2, r0, #0x10
	cmp r2, #0
	blt _08066784
	ldr r1, [r4, #0x4c]
	lsls r0, r2, #2
	adds r0, r0, r1
	ldr r0, [r0]
	ldr r1, _0806677C @ =gEkrTsaBuffer
	bl LZ77UnCompWram
	bl EkrDragonTmCpyWithDistance
	ldr r0, _08066780 @ =gEkrBgPosition
	ldr r0, [r0]
	movs r1, #0
	bl EkrDragonTmCpyExt
	b _080667F8
	.align 2, 0
_08066778: .4byte gUnk_082E4418
_0806677C: .4byte gEkrTsaBuffer
_08066780: .4byte gEkrBgPosition
_08066784:
	movs r0, #6
	rsbs r0, r0, #0
	cmp r2, r0
	bne _080667B2
	movs r1, #0x2e
	ldrsh r0, [r4, r1]
	cmp r0, #0
	bne _080667A8
	ldr r0, [r4, #0x5c]
	bl GetAnimAnotherSide
	adds r1, r0, #0
	movs r0, #8
	ldrh r1, [r1, #0x10]
	ands r0, r1
	cmp r0, #0
	beq _080667F8
	b _080667C2
_080667A8:
	bl sub_0804DD50
	cmp r0, #1
	bne _080667F8
	b _080667EC
_080667B2:
	movs r0, #5
	rsbs r0, r0, #0
	cmp r2, r0
	bne _080667D6
	movs r1, #0x2e
	ldrsh r0, [r4, r1]
	cmp r0, #0
	bne _080667C8
_080667C2:
	movs r0, #1
	strh r0, [r4, #0x2e]
	b _080667F8
_080667C8:
	ldr r1, [r4, #0x5c]
	movs r0, #8
	ldrh r1, [r1, #0x10]
	ands r0, r1
	cmp r0, #0
	beq _080667F8
	b _080667EC
_080667D6:
	movs r0, #4
	rsbs r0, r0, #0
	cmp r2, r0
	bne _080667F8
	ldr r0, _08066800 @ =0x000002F2
	movs r1, #0x80
	lsls r1, r1, #1
	movs r2, #0x78
	movs r3, #0
	bl PlaySFX
_080667EC:
	movs r0, #0
	strh r0, [r4, #0x2c]
	strh r0, [r4, #0x2e]
	ldr r0, [r4, #0x44]
	adds r0, #1
	str r0, [r4, #0x44]
_080667F8:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08066800: .4byte 0x000002F2

	thumb_func_start NewEkrDragonBodyBlack
NewEkrDragonBodyBlack: @ 0x08066804
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08066824 @ =gUnk_08C4887C
	movs r1, #3
	bl Proc_Start
	str r4, [r0, #0x5c]
	movs r2, #0
	movs r1, #0
	strh r1, [r0, #0x2c]
	adds r1, r0, #0
	adds r1, #0x29
	strb r2, [r1]
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08066824: .4byte gUnk_08C4887C

	thumb_func_start sub_08066828
sub_08066828: @ 0x08066828
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r6, r0, #0
	movs r0, #0x2c
	ldrsh r3, [r6, r0]
	movs r0, #8
	str r0, [sp]
	movs r0, #4
	movs r1, #0
	movs r2, #0x10
	bl Interpolate
	adds r5, r0, #0
	ldr r0, _080668A8 @ =Pal_EkrDragon_082E6C60
	ldr r4, _080668AC @ =gPal + 0xc0
	adds r1, r4, #0
	movs r2, #8
	bl CpuFastSet
	ldr r0, _080668B0 @ =gpEfxUnitPaletteBackup
	ldr r0, [r0]
	movs r2, #0x88
	lsls r2, r2, #2
	adds r1, r4, r2
	movs r2, #8
	bl CpuFastSet
	subs r4, #0xc0
	adds r0, r4, #0
	movs r1, #6
	movs r2, #1
	adds r3, r5, #0
	bl EfxPalBlackInOut
	adds r0, r4, #0
	movs r1, #0x17
	movs r2, #1
	adds r3, r5, #0
	bl EfxPalBlackInOut
	adds r0, r5, #0
	bl EkrDragonUpdatePal_08065510
	bl EnablePalSync
	ldrh r0, [r6, #0x2c]
	adds r0, #1
	strh r0, [r6, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #9
	bne _0806689E
	adds r1, r6, #0
	adds r1, #0x29
	movs r0, #1
	strb r0, [r1]
	adds r0, r6, #0
	bl Proc_Break
_0806689E:
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080668A8: .4byte Pal_EkrDragon_082E6C60
_080668AC: .4byte gPal + 0xc0
_080668B0: .4byte gpEfxUnitPaletteBackup

	thumb_func_start nullsub_55
nullsub_55: @ 0x080668B4
	bx lr
	.align 2, 0

	thumb_func_start sub_080668B8
sub_080668B8: @ 0x080668B8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x10
	adds r5, r0, #0
	adds r4, r1, #0
	asrs r5, r5, #3
	asrs r4, r4, #3
	ldr r0, _08066944 @ =gUnk_082E7418
	ldr r6, _08066948 @ =gEkrTsaBuffer
	adds r1, r6, #0
	bl LZ77UnCompWram
	movs r1, #0xf0
	lsls r1, r1, #3
	adds r0, r6, r1
	lsls r5, r5, #1
	lsls r2, r4, #5
	adds r2, r2, r4
	lsls r2, r2, #2
	ldr r7, _0806694C @ =gEfxFrameTmap
	adds r2, r2, r7
	adds r2, r5, r2
	movs r1, #0x20
	mov sl, r1
	str r1, [sp]
	movs r1, #2
	str r1, [sp, #4]
	movs r1, #6
	mov sb, r1
	str r1, [sp, #8]
	movs r1, #0
	mov r8, r1
	str r1, [sp, #0xc]
	subs r1, #1
	movs r3, #0x42
	bl EfxTmCpyExtHFlip
	adds r4, #2
	lsls r0, r4, #5
	adds r0, r0, r4
	lsls r0, r0, #2
	adds r0, r0, r7
	adds r5, r5, r0
	mov r0, sl
	str r0, [sp]
	movs r0, #0x1e
	str r0, [sp, #4]
	mov r1, sb
	str r1, [sp, #8]
	mov r0, r8
	str r0, [sp, #0xc]
	adds r0, r6, #0
	movs r1, #1
	rsbs r1, r1, #0
	adds r2, r5, #0
	movs r3, #0x42
	bl EfxTmCpyExtHFlip
	add sp, #0x10
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08066944: .4byte gUnk_082E7418
_08066948: .4byte gEkrTsaBuffer
_0806694C: .4byte gEfxFrameTmap

	thumb_func_start sub_08066950
sub_08066950: @ 0x08066950
	push {r4, r5, lr}
	sub sp, #0x10
	adds r3, r0, #0
	adds r2, r1, #0
	asrs r4, r3, #3
	movs r1, #7
	asrs r5, r2, #3
	ands r2, r1
	movs r0, #3
	ands r1, r3
	bl SetBgOffset
	lsls r4, r4, #1
	lsls r0, r5, #5
	adds r0, r0, r5
	lsls r0, r0, #2
	ldr r1, _0806699C @ =gEfxFrameTmap
	adds r0, r0, r1
	adds r4, r4, r0
	ldr r2, _080669A0 @ =gBg3Tm
	movs r0, #0x20
	str r0, [sp]
	str r0, [sp, #4]
	subs r0, #0x21
	str r0, [sp, #8]
	str r0, [sp, #0xc]
	adds r0, r4, #0
	movs r1, #0x42
	movs r3, #0x20
	bl EfxTmCpyExt
	movs r0, #8
	bl EnableBgSync
	add sp, #0x10
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0806699C: .4byte gEfxFrameTmap
_080669A0: .4byte gBg3Tm

	thumb_func_start NewEkrDragonTunk
NewEkrDragonTunk: @ 0x080669A4
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r0, _080669DC @ =ProcScr_EkrDragon_08C4889C
	movs r1, #3
	bl Proc_Start
	adds r5, r0, #0
	str r4, [r5, #0x5c]
	adds r1, r5, #0
	adds r1, #0x29
	movs r0, #0
	strb r0, [r1]
	strh r0, [r5, #0x2c]
	ldr r0, _080669E0 @ =gEkrDistanceType
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	beq _080669CA
	ldr r0, _080669E4 @ =0x0000FFE0
_080669CA:
	strh r0, [r5, #0x32]
	movs r0, #1
	bl sub_080034C8
	adds r0, r5, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_080669DC: .4byte ProcScr_EkrDragon_08C4889C
_080669E0: .4byte gEkrDistanceType
_080669E4: .4byte 0x0000FFE0

	thumb_func_start sub_080669E8
sub_080669E8: @ 0x080669E8
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	ldrh r0, [r5, #0x2c]
	adds r0, #1
	movs r6, #0
	strh r0, [r5, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	bne _08066A14
	movs r0, #3
	movs r1, #2
	movs r2, #3
	bl sub_08066F80
	ldr r0, _08066ACC @ =0x00000147
	movs r1, #0x80
	lsls r1, r1, #1
	movs r2, #0x78
	movs r3, #0
	bl PlaySFX
_08066A14:
	ldrh r0, [r5, #0x2c]
	cmp r0, #0x23
	bne _08066A32
	movs r0, #3
	movs r1, #2
	movs r2, #3
	bl sub_08066F80
	ldr r0, _08066ACC @ =0x00000147
	movs r1, #0x80
	lsls r1, r1, #1
	movs r2, #0x78
	movs r3, #0
	bl PlaySFX
_08066A32:
	ldrh r1, [r5, #0x2c]
	cmp r1, #0x32
	bne _08066A50
	movs r0, #3
	movs r1, #2
	movs r2, #3
	bl sub_08066F80
	ldr r0, _08066ACC @ =0x00000147
	movs r1, #0x80
	lsls r1, r1, #1
	movs r2, #0x78
	movs r3, #0
	bl PlaySFX
_08066A50:
	ldrh r2, [r5, #0x2c]
	cmp r2, #0x36
	bne _08066AAE
	ldr r0, [r5, #0x5c]
	bl GetAnimPosition
	bl SetAnimStateHidden
	movs r4, #0x80
	lsls r4, r4, #1
	strh r4, [r5, #0x3a]
	strh r6, [r5, #0x3c]
	ldr r0, [r5, #0x5c]
	bl NewEfxDragonDeadFallHeadFx
	str r0, [r5, #0x64]
	ldr r1, [r5, #0x5c]
	ldrh r1, [r1, #2]
	subs r1, #0x16
	strh r1, [r0, #0x32]
	ldr r1, [r5, #0x64]
	ldr r0, [r5, #0x5c]
	ldrh r0, [r0, #4]
	ldrh r2, [r5, #0x3a]
	subs r0, r0, r2
	adds r0, #0xd8
	strh r0, [r1, #0x3a]
	ldr r0, _08066AD0 @ =Tsa_EkrDragon_MainBg
	ldr r1, _08066AD4 @ =gEkrTsaBuffer
	bl LZ77UnCompWram
	ldr r0, _08066AD8 @ =0x001F001F
	bl EfxTmFill
	ldr r0, _08066ADC @ =gBg3Tm
	movs r1, #0x1f
	bl TmFill
	movs r1, #0x32
	ldrsh r0, [r5, r1]
	movs r1, #0xf0
	bl sub_080668B8
	movs r0, #0
	adds r1, r4, #0
	bl sub_08066950
_08066AAE:
	ldrh r2, [r5, #0x2c]
	cmp r2, #0x64
	bne _08066AC4
	strh r6, [r5, #0x2c]
	movs r0, #0xc0
	lsls r0, r0, #1
	strh r0, [r5, #0x2e]
	strh r6, [r5, #0x30]
	adds r0, r5, #0
	bl Proc_Break
_08066AC4:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08066ACC: .4byte 0x00000147
_08066AD0: .4byte Tsa_EkrDragon_MainBg
_08066AD4: .4byte gEkrTsaBuffer
_08066AD8: .4byte 0x001F001F
_08066ADC: .4byte gBg3Tm

	thumb_func_start sub_08066AE0
sub_08066AE0: @ 0x08066AE0
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r4, r0, #0
	movs r0, #0x3a
	ldrsh r1, [r4, r0]
	movs r3, #0x3c
	ldrsh r2, [r4, r3]
	movs r5, #0x2c
	ldrsh r3, [r4, r5]
	movs r6, #0x2e
	ldrsh r0, [r4, r6]
	str r0, [sp]
	movs r0, #0
	bl Interpolate
	adds r1, r0, #0
	ldr r2, [r4, #0x64]
	ldr r0, [r4, #0x5c]
	ldrh r0, [r0, #2]
	subs r0, #0x16
	movs r7, #0
	strh r0, [r2, #0x32]
	ldr r2, [r4, #0x64]
	ldr r0, [r4, #0x5c]
	ldrh r0, [r0, #4]
	subs r0, r0, r1
	adds r0, #0xd8
	strh r0, [r2, #0x3a]
	ldr r2, [r4, #0x64]
	ldr r5, _08066C9C @ =gEkrBg2QuakeVec
	ldrh r3, [r2, #0x32]
	ldrh r6, [r5]
	subs r0, r3, r6
	strh r0, [r2, #0x32]
	ldr r2, [r4, #0x64]
	ldrh r3, [r2, #0x3a]
	ldrh r6, [r5, #2]
	subs r0, r3, r6
	strh r0, [r2, #0x3a]
	movs r2, #0
	ldrsh r0, [r5, r2]
	movs r3, #2
	ldrsh r2, [r5, r3]
	adds r1, r1, r2
	bl sub_08066950
	ldrh r1, [r5]
	ldrh r2, [r5, #2]
	movs r0, #2
	bl SetBgOffset
	ldr r6, _08066CA0 @ =gEkrBg0QuakeVec
	ldrh r0, [r5]
	ldrh r2, [r6]
	adds r1, r0, r2
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	ldrh r3, [r5, #2]
	ldrh r0, [r6, #2]
	adds r2, r3, r0
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	movs r0, #0
	bl SetBgOffset
	ldrh r1, [r5]
	ldrh r2, [r6]
	adds r0, r1, r2
	rsbs r0, r0, #0
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	ldrh r3, [r5, #2]
	ldrh r2, [r6, #2]
	adds r1, r3, r2
	rsbs r1, r1, #0
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	bl EkrGauge_0804CC8C
	ldrh r3, [r5]
	ldrh r1, [r6]
	adds r0, r3, r1
	rsbs r0, r0, #0
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldrh r2, [r5, #2]
	ldrh r3, [r6, #2]
	adds r1, r2, r3
	rsbs r1, r1, #0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	bl EkrDispUP_SetPositionSync
	ldrh r1, [r4, #0x2c]
	adds r1, #1
	strh r1, [r4, #0x2c]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	movs r2, #0x2e
	ldrsh r0, [r4, r2]
	adds r0, #1
	cmp r1, r0
	bne _08066BB2
	ldrh r0, [r4, #0x2e]
	strh r0, [r4, #0x2c]
_08066BB2:
	ldrh r0, [r4, #0x30]
	adds r0, #1
	strh r0, [r4, #0x30]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	bne _08066BD8
	movs r0, #8
	movs r1, #0
	bl NewEfxQuakePure
	str r0, [r4, #0x54]
	ldr r0, _08066CA4 @ =0x000002F3
	movs r1, #0x80
	lsls r1, r1, #1
	movs r2, #0x78
	movs r3, #0
	bl PlaySFX
_08066BD8:
	ldrh r3, [r4, #0x30]
	cmp r3, #0x3c
	bne _08066BEE
	ldr r0, [r4, #0x54]
	bl Proc_End
	movs r0, #9
	movs r1, #0
	bl NewEfxQuakePure
	str r0, [r4, #0x54]
_08066BEE:
	ldrh r0, [r4, #0x30]
	cmp r0, #0x5a
	bne _08066C04
	ldr r0, [r4, #0x54]
	bl Proc_End
	movs r0, #0xa
	movs r1, #0
	bl NewEfxQuakePure
	str r0, [r4, #0x54]
_08066C04:
	ldrh r1, [r4, #0x30]
	cmp r1, #0x87
	bne _08066C14
	movs r0, #0x3c
	movs r1, #0x1e
	movs r2, #0x78
	bl sub_08066F80
_08066C14:
	ldrh r2, [r4, #0x30]
	cmp r2, #0xc8
	bne _08066C7A
	ldrh r0, [r4, #0x2e]
	strh r0, [r4, #0x2c]
	ldr r0, [r4, #0x64]
	bl Proc_End
	ldr r0, [r4, #0x54]
	bl Proc_End
	strh r7, [r5]
	strh r7, [r5, #2]
	movs r3, #0x3c
	ldrsh r1, [r4, r3]
	movs r0, #0
	bl sub_08066950
	movs r0, #2
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	ldrh r1, [r6]
	ldrh r2, [r6, #2]
	movs r0, #0
	bl SetBgOffset
	ldrh r5, [r6]
	rsbs r0, r5, #0
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	ldrh r2, [r6, #2]
	rsbs r1, r2, #0
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	bl EkrGauge_0804CC8C
	ldrh r3, [r6]
	rsbs r0, r3, #0
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldrh r6, [r6, #2]
	rsbs r1, r6, #0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	bl EkrDispUP_SetPositionSync
	movs r0, #0x10
	bl EkrDragonUpdatePal_08065510
_08066C7A:
	movs r0, #0xc8
	lsls r0, r0, #1
	ldrh r5, [r4, #0x30]
	cmp r5, r0
	bne _08066C92
	adds r1, r4, #0
	adds r1, #0x29
	movs r0, #1
	strb r0, [r1]
	adds r0, r4, #0
	bl Proc_Break
_08066C92:
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08066C9C: .4byte gEkrBg2QuakeVec
_08066CA0: .4byte gEkrBg0QuakeVec
_08066CA4: .4byte 0x000002F3

	thumb_func_start nullsub_56
nullsub_56: @ 0x08066CA8
	bx lr
	.align 2, 0

	thumb_func_start sub_08066CAC
sub_08066CAC: @ 0x08066CAC
	push {r4, r5, lr}
	sub sp, #8
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r0, _08066D18 @ =ProcScr_EkrDragon_08C488C4
	movs r1, #3
	bl Proc_Start
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	strh r5, [r0, #0x2e]
	str r1, [r0, #0x44]
	ldr r0, _08066D1C @ =gUnk_082E9DD8
	movs r1, #0x80
	lsls r1, r1, #6
	bl SpellFx_RegisterBgGfx
	ldr r0, _08066D20 @ =gUnk_082EA7C8
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
	bl SpellFx_ClearBG1
	ldr r0, _08066D24 @ =gUnk_082EA7E8
	ldr r4, _08066D28 @ =gEkrTsaBuffer
	adds r1, r4, #0
	bl LZ77UnCompWram
	ldr r1, _08066D2C @ =gBg1Tm
	movs r0, #1
	str r0, [sp]
	adds r0, #0xff
	str r0, [sp, #4]
	adds r0, r4, #0
	movs r2, #0x20
	movs r3, #0x20
	bl EfxTmCpyBgHFlip
	movs r0, #2
	bl EnableBgSync
	bl SpellFx_SetSomeColorEffect
	movs r0, #1
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	add sp, #8
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08066D18: .4byte ProcScr_EkrDragon_08C488C4
_08066D1C: .4byte gUnk_082E9DD8
_08066D20: .4byte gUnk_082EA7C8
_08066D24: .4byte gUnk_082EA7E8
_08066D28: .4byte gEkrTsaBuffer
_08066D2C: .4byte gBg1Tm

	thumb_func_start sub_08066D30
sub_08066D30: @ 0x08066D30
	push {lr}
	bl SpellFx_ClearBG1
	bl SpellFx_ClearColorEffects
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_08066D40
sub_08066D40: @ 0x08066D40
	push {r4, lr}
	sub sp, #8
	adds r2, r0, #0
	ldr r0, [r2, #0x44]
	movs r1, #0x80
	lsls r1, r1, #1
	adds r0, r0, r1
	str r0, [r2, #0x44]
	ldr r1, _08066D80 @ =gDispIo
	asrs r0, r0, #8
	movs r3, #0
	strh r0, [r1, #0x20]
	ldrh r0, [r2, #0x2c]
	adds r0, #1
	strh r0, [r2, #0x2c]
	lsls r0, r0, #0x10
	asrs r1, r0, #0x10
	cmp r1, #1
	beq _08066D98
	movs r4, #0x2e
	ldrsh r0, [r2, r4]
	cmp r1, r0
	bne _08066D84
	ldr r0, [r2, #0x5c]
	str r3, [sp]
	str r3, [sp, #4]
	movs r1, #0
	movs r2, #0x1e
	movs r3, #0x10
	bl NewEfxALPHA
	b _08066D98
	.align 2, 0
_08066D80: .4byte gDispIo
_08066D84:
	movs r0, #0x2c
	ldrsh r1, [r2, r0]
	movs r3, #0x2e
	ldrsh r0, [r2, r3]
	adds r0, #0x1e
	cmp r1, r0
	bne _08066D98
	adds r0, r2, #0
	bl Proc_Break
_08066D98:
	add sp, #8
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_08066DA0
sub_08066DA0: @ 0x08066DA0
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	adds r6, r0, #0
	mov r8, r1
	adds r5, r2, #0
	ldr r0, _08066DD4 @ =ProcScr_EkrDragon_08C488E4
	movs r1, #3
	bl Proc_Start
	adds r4, r0, #0
	str r6, [r4, #0x5c]
	adds r0, r5, #0
	movs r1, #0
	bl NewEfxQuakePure
	str r0, [r4, #0x60]
	movs r0, #0
	strh r0, [r4, #0x2c]
	mov r0, r8
	strh r0, [r4, #0x2e]
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08066DD4: .4byte ProcScr_EkrDragon_08C488E4

	thumb_func_start sub_08066DD8
sub_08066DD8: @ 0x08066DD8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	mov sb, r0
	ldr r0, [r0, #0x5c]
	str r0, [sp]
	ldr r4, _08066F6C @ =gEkrBg2QuakeVec
	ldrh r1, [r4]
	ldrh r2, [r4, #2]
	movs r0, #2
	bl SetBgOffset
	ldr r7, _08066F70 @ =gEkrBg0QuakeVec
	ldrh r2, [r4]
	ldrh r3, [r7]
	adds r1, r2, r3
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	ldrh r6, [r4, #2]
	ldrh r0, [r7, #2]
	adds r2, r6, r0
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	movs r0, #0
	bl SetBgOffset
	ldrh r1, [r4]
	ldrh r2, [r7]
	adds r0, r1, r2
	rsbs r0, r0, #0
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	ldrh r3, [r4, #2]
	ldrh r6, [r7, #2]
	adds r1, r3, r6
	rsbs r1, r1, #0
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	bl EkrGauge_0804CC8C
	ldrh r1, [r4]
	ldrh r2, [r7]
	adds r0, r1, r2
	rsbs r0, r0, #0
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldrh r3, [r4, #2]
	ldrh r6, [r7, #2]
	adds r1, r3, r6
	rsbs r1, r1, #0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	bl EkrDispUP_SetPositionSync
	ldrh r1, [r4]
	ldrh r2, [r4, #2]
	movs r0, #3
	bl SetBgOffset
	ldrh r5, [r4]
	ldr r0, _08066F74 @ =gEkrXPosReal
	ldrh r0, [r0]
	subs r1, r0, r5
	ldr r2, _08066F78 @ =gEkrBgPosition
	ldr r0, [r2]
	subs r1, r1, r0
	lsls r1, r1, #0x10
	ldr r3, _08066F7C @ =gEkrYPosReal
	mov sl, r3
	ldrh r4, [r4, #2]
	ldrh r6, [r3]
	subs r2, r6, r4
	lsls r2, r2, #0x10
	ldr r3, _08066F74 @ =gEkrXPosReal
	ldrh r3, [r3, #2]
	adds r5, r5, r3
	subs r5, r5, r0
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	mov r6, sl
	ldrh r6, [r6, #2]
	subs r4, r6, r4
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	lsrs r0, r1, #0x10
	mov r8, r0
	asrs r1, r1, #0x10
	lsrs r6, r2, #0x10
	asrs r2, r2, #0x10
	movs r0, #0
	bl SetEkrFrontAnimPostion
	lsls r5, r5, #0x10
	asrs r5, r5, #0x10
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	movs r0, #1
	adds r1, r5, #0
	adds r2, r4, #0
	bl SetEkrFrontAnimPostion
	mov r2, r8
	ldr r1, [sp]
	strh r2, [r1, #0x32]
	strh r6, [r1, #0x3a]
	mov r3, sb
	ldrh r0, [r3, #0x2c]
	adds r0, #1
	strh r0, [r3, #0x2c]
	lsls r0, r0, #0x10
	ldrh r6, [r3, #0x2e]
	lsls r1, r6, #0x10
	cmp r0, r1
	ble _08066F5C
	movs r0, #2
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	ldrh r1, [r7]
	ldrh r2, [r7, #2]
	movs r0, #0
	bl SetBgOffset
	ldrh r1, [r7]
	rsbs r0, r1, #0
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	ldrh r2, [r7, #2]
	rsbs r1, r2, #0
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	bl EkrGauge_0804CC8C
	ldrh r3, [r7]
	rsbs r0, r3, #0
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldrh r7, [r7, #2]
	rsbs r1, r7, #0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	bl EkrDispUP_SetPositionSync
	movs r0, #3
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	ldr r6, _08066F78 @ =gEkrBgPosition
	ldr r4, [r6]
	ldr r0, _08066F74 @ =gEkrXPosReal
	ldrh r0, [r0]
	subs r1, r0, r4
	lsls r1, r1, #0x10
	ldr r2, _08066F74 @ =gEkrXPosReal
	ldrh r2, [r2, #2]
	subs r4, r2, r4
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	mov r3, sl
	ldrh r5, [r3, #2]
	lsrs r6, r1, #0x10
	mov r8, r6
	asrs r1, r1, #0x10
	ldrh r6, [r3]
	movs r0, #0
	ldrsh r2, [r3, r0]
	movs r0, #0
	bl SetEkrFrontAnimPostion
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	lsls r5, r5, #0x10
	asrs r5, r5, #0x10
	movs r0, #1
	adds r1, r4, #0
	adds r2, r5, #0
	bl SetEkrFrontAnimPostion
	mov r2, r8
	ldr r1, [sp]
	strh r2, [r1, #0x32]
	strh r6, [r1, #0x3a]
	mov r3, sb
	ldr r0, [r3, #0x60]
	bl Proc_End
	mov r0, sb
	bl Proc_Break
_08066F5C:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08066F6C: .4byte gEkrBg2QuakeVec
_08066F70: .4byte gEkrBg0QuakeVec
_08066F74: .4byte gEkrXPosReal
_08066F78: .4byte gEkrBgPosition
_08066F7C: .4byte gEkrYPosReal

	thumb_func_start sub_08066F80
sub_08066F80: @ 0x08066F80
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r6, r2, #0
	ldr r0, _08066FB8 @ =ProcScr_EkrDragon_08C488FC
	movs r1, #0
	bl Proc_Start
	movs r1, #0
	strh r1, [r0, #0x2c]
	str r4, [r0, #0x44]
	str r5, [r0, #0x48]
	str r6, [r0, #0x4c]
	ldr r2, _08066FBC @ =gDispIo
	adds r3, r2, #0
	adds r3, #0x3c
	subs r1, #0x21
	adds r0, r1, #0
	ldrb r4, [r3]
	ands r0, r4
	strb r0, [r3]
	adds r2, #0x3d
	ldrb r0, [r2]
	ands r1, r0
	strb r1, [r2]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08066FB8: .4byte ProcScr_EkrDragon_08C488FC
_08066FBC: .4byte gDispIo

	thumb_func_start sub_08066FC0
sub_08066FC0: @ 0x08066FC0
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r7, r0, #0
	movs r0, #0x2c
	ldrsh r3, [r7, r0]
	ldr r0, [r7, #0x44]
	str r0, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #0x10
	bl Interpolate
	adds r6, r0, #0
	ldr r0, _08067028 @ =gPal
	ldr r4, _0806702C @ =gEfxPal
	movs r5, #0x80
	lsls r5, r5, #1
	adds r1, r4, #0
	adds r2, r5, #0
	bl CpuFastSet
	adds r0, r4, #0
	movs r1, #0
	movs r2, #0x20
	adds r3, r6, #0
	bl EfxPalWhiteInOut
	movs r1, #0xa0
	lsls r1, r1, #0x13
	adds r0, r4, #0
	adds r2, r5, #0
	bl CpuFastSet
	bl DisablePalSync
	ldrh r0, [r7, #0x2c]
	adds r0, #1
	strh r0, [r7, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	ldr r1, [r7, #0x44]
	cmp r0, r1
	ble _08067020
	movs r0, #0
	strh r0, [r7, #0x2c]
	adds r0, r7, #0
	bl Proc_Break
_08067020:
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08067028: .4byte gPal
_0806702C: .4byte gEfxPal

	thumb_func_start sub_08067030
sub_08067030: @ 0x08067030
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	ldr r0, _08067080 @ =gPal
	ldr r4, _08067084 @ =gEfxPal
	movs r5, #0x80
	lsls r5, r5, #1
	adds r1, r4, #0
	adds r2, r5, #0
	bl CpuFastSet
	adds r0, r4, #0
	movs r1, #0
	movs r2, #0x20
	movs r3, #0x10
	bl EfxPalWhiteInOut
	movs r1, #0xa0
	lsls r1, r1, #0x13
	adds r0, r4, #0
	adds r2, r5, #0
	bl CpuFastSet
	bl DisablePalSync
	ldrh r0, [r6, #0x2c]
	adds r0, #1
	strh r0, [r6, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	ldr r1, [r6, #0x48]
	cmp r0, r1
	ble _0806707A
	movs r0, #0
	strh r0, [r6, #0x2c]
	adds r0, r6, #0
	bl Proc_Break
_0806707A:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08067080: .4byte gPal
_08067084: .4byte gEfxPal

	thumb_func_start sub_08067088
sub_08067088: @ 0x08067088
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r7, r0, #0
	movs r0, #0x2c
	ldrsh r3, [r7, r0]
	ldr r0, [r7, #0x4c]
	str r0, [sp]
	movs r0, #0
	movs r1, #0x10
	movs r2, #0
	bl Interpolate
	adds r6, r0, #0
	ldr r0, _080670F0 @ =gPal
	ldr r4, _080670F4 @ =gEfxPal
	movs r5, #0x80
	lsls r5, r5, #1
	adds r1, r4, #0
	adds r2, r5, #0
	bl CpuFastSet
	adds r0, r4, #0
	movs r1, #0
	movs r2, #0x20
	adds r3, r6, #0
	bl EfxPalWhiteInOut
	movs r1, #0xa0
	lsls r1, r1, #0x13
	adds r0, r4, #0
	adds r2, r5, #0
	bl CpuFastSet
	bl DisablePalSync
	ldrh r0, [r7, #0x2c]
	adds r0, #1
	strh r0, [r7, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	ldr r1, [r7, #0x4c]
	cmp r0, r1
	ble _080670E8
	movs r0, #0
	strh r0, [r7, #0x2c]
	adds r0, r7, #0
	bl Proc_Break
_080670E8:
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080670F0: .4byte gPal
_080670F4: .4byte gEfxPal

	thumb_func_start sub_080670F8
sub_080670F8: @ 0x080670F8
	push {r4, lr}
	adds r4, r0, #0
	ldr r2, _08067124 @ =gDispIo
	adds r3, r2, #0
	adds r3, #0x3c
	movs r0, #0x20
	ldrb r1, [r3]
	orrs r1, r0
	strb r1, [r3]
	adds r2, #0x3d
	ldrb r1, [r2]
	orrs r0, r1
	strb r0, [r2]
	bl EnablePalSync
	adds r0, r4, #0
	bl Proc_Break
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08067124: .4byte gDispIo
