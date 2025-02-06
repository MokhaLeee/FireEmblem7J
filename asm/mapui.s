	.include "macro.inc"
	.syntax unified

	thumb_func_start PutMapUiHpBarLeft
PutMapUiHpBarLeft: @ 0x08085170
	adds r3, r0, #0
	lsls r1, r1, #0x10
	lsrs r0, r1, #0x10
	asrs r1, r1, #0x10
	cmp r1, #5
	ble _0808517E
	movs r0, #5
_0808517E:
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	adds r0, r0, r2
	strh r0, [r3]
	bx lr

	thumb_func_start PutMapUiHpBarMid
PutMapUiHpBarMid: @ 0x08085188
	push {r4, r5, lr}
	adds r3, r0, #0
	lsls r1, r1, #0x10
	asrs r4, r1, #0x13
	movs r0, #0xe0
	lsls r0, r0, #0xb
	ands r0, r1
	asrs r0, r0, #0x10
	movs r1, #0
	adds r5, r2, #0
	adds r5, #0xe
	adds r2, #6
	adds r0, r2, r0
_080851A2:
	cmp r1, r4
	bge _080851AA
	strh r5, [r3]
	b _080851B4
_080851AA:
	cmp r1, r4
	bne _080851B2
	strh r0, [r3]
	b _080851B4
_080851B2:
	strh r2, [r3]
_080851B4:
	adds r3, #2
	adds r1, #1
	cmp r1, #3
	ble _080851A2
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start PutMapUiHpBarRight
PutMapUiHpBarRight: @ 0x080851C4
	push {r4, lr}
	adds r4, r0, #0
	lsls r1, r1, #0x10
	lsrs r3, r1, #0x10
	asrs r1, r1, #0x10
	cmp r1, #4
	ble _080851D4
	movs r3, #5
_080851D4:
	lsls r0, r3, #0x10
	cmp r0, #0
	bge _080851DC
	movs r3, #0
_080851DC:
	adds r1, r2, #0
	adds r1, #0xf
	lsls r0, r3, #0x10
	asrs r0, r0, #0x10
	adds r0, r0, r1
	strh r0, [r4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start PutMapUiHpBar
PutMapUiHpBar: @ 0x080851F0
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	adds r5, r0, #0
	adds r6, r1, #0
	mov r8, r2
	adds r0, r6, #0
	bl GetUnitCurrentHp
	movs r1, #0x2a
	adds r4, r0, #0
	muls r4, r1, r4
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	adds r0, r6, #0
	bl GetUnitMaxHp
	adds r1, r0, #0
	adds r0, r4, #0
	bl Div
	adds r4, r0, #0
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	adds r0, r5, #0
	adds r1, r4, #0
	mov r2, r8
	bl PutMapUiHpBarLeft
	adds r0, r5, #2
	subs r1, r4, #5
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	mov r2, r8
	bl PutMapUiHpBarMid
	adds r5, #0xa
	subs r4, #0x25
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	adds r0, r5, #0
	adds r1, r4, #0
	mov r2, r8
	bl PutMapUiHpBarRight
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	thumb_func_start sub_8085254
sub_8085254: @ 0x08085254
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r7, r0, #0
	ldr r1, _080852A0 @ =gUnk_08D8B134
	adds r0, #0x50
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r0, r0, #3
	adds r1, r0, r1
	movs r0, #3
	ldrsb r0, [r1, r0]
	movs r4, #0
	cmp r0, #0
	blt _08085276
	movs r4, #0xe
_08085276:
	movs r0, #2
	ldrsb r0, [r1, r0]
	cmp r0, #0
	bge _080852AC
	lsls r5, r4, #5
	lsls r4, r4, #6
	ldr r0, _080852A4 @ =gBg0Tm
	adds r0, r4, r0
	movs r1, #0xc
	movs r2, #6
	movs r3, #0
	bl TmFillRect_thm
	ldr r0, _080852A8 @ =gBg1Tm
	adds r0, r4, r0
	movs r1, #0xc
	movs r2, #6
	movs r3, #0
	bl TmFillRect_thm
	b _080852CC
	.align 2, 0
_080852A0: .4byte gUnk_08D8B134
_080852A4: .4byte gBg0Tm
_080852A8: .4byte gBg1Tm
_080852AC:
	lsls r5, r4, #5
	lsls r4, r4, #6
	ldr r0, _08085324 @ =gBg0Tm + 0x24
	adds r0, r4, r0
	movs r1, #0xc
	movs r2, #6
	movs r3, #0
	bl TmFillRect_thm
	ldr r0, _08085328 @ =gBg1Tm + 0x24
	adds r0, r4, r0
	movs r1, #0xc
	movs r2, #6
	movs r3, #0
	bl TmFillRect_thm
_080852CC:
	mov r8, r5
	adds r6, r4, #0
	movs r0, #3
	bl EnableBgSync
	ldr r1, _0808532C @ =gUnk_08D8B190
	ldr r0, [r7, #0x58]
	adds r0, r0, r1
	movs r5, #0
	ldrsb r5, [r0, r5]
	ldr r1, _08085330 @ =gUnk_08D8B134
	adds r0, r7, #0
	adds r0, #0x50
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r0, r0, #3
	adds r0, r0, r1
	ldrb r0, [r0, #2]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bge _08085344
	movs r4, #0xc
	subs r4, r4, r5
	lsls r4, r4, #1
	ldr r0, _08085334 @ =gUiTmScratchA
	adds r0, r4, r0
	ldr r1, _08085338 @ =gBg0Tm
	adds r1, r6, r1
	adds r2, r5, #0
	movs r3, #6
	bl TmCopyRect_thm
	ldr r0, _0808533C @ =gUiTmScratchB
	adds r4, r4, r0
	ldr r1, _08085340 @ =gBg1Tm
	adds r1, r6, r1
	adds r0, r4, #0
	adds r2, r5, #0
	movs r3, #6
	bl TmCopyRect_thm
	b _0808536A
	.align 2, 0
_08085324: .4byte gBg0Tm + 0x24
_08085328: .4byte gBg1Tm + 0x24
_0808532C: .4byte gUnk_08D8B190
_08085330: .4byte gUnk_08D8B134
_08085334: .4byte gUiTmScratchA
_08085338: .4byte gBg0Tm
_0808533C: .4byte gUiTmScratchB
_08085340: .4byte gBg1Tm
_08085344:
	ldr r0, _080853B4 @ =gUiTmScratchA
	mov r4, r8
	adds r4, #0x1e
	subs r4, r4, r5
	lsls r4, r4, #1
	ldr r1, _080853B8 @ =gBg0Tm
	adds r1, r4, r1
	adds r2, r5, #0
	movs r3, #6
	bl TmCopyRect_thm
	ldr r0, _080853BC @ =gUiTmScratchB
	ldr r1, _080853C0 @ =gBg1Tm
	adds r4, r4, r1
	adds r1, r4, #0
	adds r2, r5, #0
	movs r3, #6
	bl TmCopyRect_thm
_0808536A:
	ldr r0, [r7, #0x58]
	adds r0, #1
	str r0, [r7, #0x58]
	cmp r0, #4
	bne _080853A8
	adds r1, r7, #0
	adds r1, #0x55
	movs r0, #0
	strb r0, [r1]
	str r0, [r7, #0x58]
	adds r0, r7, #0
	bl Proc_Break
	ldr r2, _080853C4 @ =gBmSt
	movs r1, #0x16
	ldrsh r0, [r2, r1]
	ldr r1, _080853C8 @ =gBmMapUnit
	ldr r1, [r1]
	lsls r0, r0, #2
	adds r0, r0, r1
	movs r3, #0x14
	ldrsh r1, [r2, r3]
	ldr r0, [r0]
	adds r0, r0, r1
	ldrb r0, [r0]
	bl GetUnit
	adds r1, r0, #0
	adds r0, r7, #0
	bl sub_80859B0
_080853A8:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080853B4: .4byte gUiTmScratchA
_080853B8: .4byte gBg0Tm
_080853BC: .4byte gUiTmScratchB
_080853C0: .4byte gBg1Tm
_080853C4: .4byte gBmSt
_080853C8: .4byte gBmMapUnit

	thumb_func_start sub_80853CC
sub_80853CC: @ 0x080853CC
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r6, r0, #0
	ldr r3, _0808542C @ =gUnk_08D8B134
	adds r2, r6, #0
	adds r2, #0x50
	movs r0, #0
	ldrsb r0, [r2, r0]
	lsls r0, r0, #3
	adds r0, r0, r3
	ldrb r0, [r0, #3]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	movs r4, #0
	cmp r0, #0
	blt _080853F0
	movs r4, #0xe
_080853F0:
	adds r1, r6, #0
	adds r1, #0x55
	movs r0, #1
	strb r0, [r1]
	movs r0, #0
	ldrsb r0, [r2, r0]
	lsls r0, r0, #3
	adds r0, r0, r3
	ldrb r0, [r0, #2]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bge _08085438
	lsls r5, r4, #5
	lsls r4, r4, #6
	ldr r0, _08085430 @ =gBg0Tm
	adds r0, r4, r0
	movs r1, #0xc
	movs r2, #6
	movs r3, #0
	bl TmFillRect_thm
	ldr r0, _08085434 @ =gBg1Tm
	adds r0, r4, r0
	movs r1, #0xc
	movs r2, #6
	movs r3, #0
	bl TmFillRect_thm
	b _08085458
	.align 2, 0
_0808542C: .4byte gUnk_08D8B134
_08085430: .4byte gBg0Tm
_08085434: .4byte gBg1Tm
_08085438:
	lsls r5, r4, #5
	lsls r4, r4, #6
	ldr r0, _080854B0 @ =gBg0Tm + 0x24
	adds r0, r4, r0
	movs r1, #0xc
	movs r2, #6
	movs r3, #0
	bl TmFillRect_thm
	ldr r0, _080854B4 @ =gBg1Tm + 0x24
	adds r0, r4, r0
	movs r1, #0xc
	movs r2, #6
	movs r3, #0
	bl TmFillRect_thm
_08085458:
	mov r8, r5
	adds r7, r4, #0
	movs r0, #3
	bl EnableBgSync
	ldr r1, _080854B8 @ =gUnk_08D8B194
	ldr r0, [r6, #0x58]
	adds r0, r0, r1
	movs r5, #0
	ldrsb r5, [r0, r5]
	ldr r1, _080854BC @ =gUnk_08D8B134
	adds r0, r6, #0
	adds r0, #0x50
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r0, r0, #3
	adds r0, r0, r1
	ldrb r0, [r0, #2]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bge _080854D0
	movs r4, #0xc
	subs r4, r4, r5
	lsls r4, r4, #1
	ldr r0, _080854C0 @ =gUiTmScratchA
	adds r0, r4, r0
	ldr r1, _080854C4 @ =gBg0Tm
	adds r1, r7, r1
	adds r2, r5, #0
	movs r3, #6
	bl TmCopyRect_thm
	ldr r0, _080854C8 @ =gUiTmScratchB
	adds r4, r4, r0
	ldr r1, _080854CC @ =gBg1Tm
	adds r1, r7, r1
	adds r0, r4, #0
	adds r2, r5, #0
	movs r3, #6
	bl TmCopyRect_thm
	b _080854F6
	.align 2, 0
_080854B0: .4byte gBg0Tm + 0x24
_080854B4: .4byte gBg1Tm + 0x24
_080854B8: .4byte gUnk_08D8B194
_080854BC: .4byte gUnk_08D8B134
_080854C0: .4byte gUiTmScratchA
_080854C4: .4byte gBg0Tm
_080854C8: .4byte gUiTmScratchB
_080854CC: .4byte gBg1Tm
_080854D0:
	ldr r0, _08085520 @ =gUiTmScratchA
	mov r4, r8
	adds r4, #0x1e
	subs r4, r4, r5
	lsls r4, r4, #1
	ldr r1, _08085524 @ =gBg0Tm
	adds r1, r4, r1
	adds r2, r5, #0
	movs r3, #6
	bl TmCopyRect_thm
	ldr r0, _08085528 @ =gUiTmScratchB
	ldr r1, _0808552C @ =gBg1Tm
	adds r4, r4, r1
	adds r1, r4, #0
	adds r2, r5, #0
	movs r3, #6
	bl TmCopyRect_thm
_080854F6:
	ldr r0, [r6, #0x58]
	adds r0, #1
	str r0, [r6, #0x58]
	cmp r0, #3
	bne _08085516
	adds r1, r6, #0
	adds r1, #0x56
	movs r0, #0
	strb r0, [r1]
	str r0, [r6, #0x58]
	adds r1, #1
	movs r0, #0xff
	strb r0, [r1]
	adds r0, r6, #0
	bl Proc_Break
_08085516:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08085520: .4byte gUiTmScratchA
_08085524: .4byte gBg0Tm
_08085528: .4byte gUiTmScratchB
_0808552C: .4byte gBg1Tm

	thumb_func_start sub_8085530
sub_8085530: @ 0x08085530
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	ldr r1, _08085568 @ =gUnk_08D8B134
	adds r0, #0x50
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r0, r0, #3
	adds r0, r0, r1
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bge _08085574
	ldr r0, _0808556C @ =gBg0Tm + 0x340
	movs r1, #6
	movs r2, #7
	movs r3, #0
	bl TmFillRect_thm
	ldr r0, _08085570 @ =gBg1Tm + 0x340
	movs r1, #6
	movs r2, #7
	movs r3, #0
	bl TmFillRect_thm
	b _0808558C
	.align 2, 0
_08085568: .4byte gUnk_08D8B134
_0808556C: .4byte gBg0Tm + 0x340
_08085570: .4byte gBg1Tm + 0x340
_08085574:
	ldr r0, _080855E0 @ =gBg0Tm + 0x370
	movs r1, #6
	movs r2, #7
	movs r3, #0
	bl TmFillRect_thm
	ldr r0, _080855E4 @ =gBg1Tm + 0x370
	movs r1, #6
	movs r2, #7
	movs r3, #0
	bl TmFillRect_thm
_0808558C:
	movs r0, #3
	bl EnableBgSync
	ldr r1, _080855E8 @ =gUnk_08D8B197
	ldr r0, [r6, #0x58]
	adds r0, r0, r1
	movs r5, #0
	ldrsb r5, [r0, r5]
	ldr r1, _080855EC @ =gUnk_08D8B134
	adds r0, r6, #0
	adds r0, #0x50
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r0, r0, #3
	adds r0, r0, r1
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bge _08085600
	movs r4, #0xa3
	lsls r4, r4, #1
	subs r4, r4, r5
	lsls r4, r4, #1
	ldr r0, _080855F0 @ =gUiTmScratchA
	adds r0, r4, r0
	ldr r1, _080855F4 @ =gBg0Tm + 0x340
	adds r2, r5, #0
	movs r3, #7
	bl TmCopyRect_thm
	ldr r0, _080855F8 @ =gUiTmScratchB
	adds r4, r4, r0
	ldr r1, _080855FC @ =gBg1Tm + 0x340
	adds r0, r4, #0
	adds r2, r5, #0
	movs r3, #7
	bl TmCopyRect_thm
	b _08085626
	.align 2, 0
_080855E0: .4byte gBg0Tm + 0x370
_080855E4: .4byte gBg1Tm + 0x370
_080855E8: .4byte gUnk_08D8B197
_080855EC: .4byte gUnk_08D8B134
_080855F0: .4byte gUiTmScratchA
_080855F4: .4byte gBg0Tm + 0x340
_080855F8: .4byte gUiTmScratchB
_080855FC: .4byte gBg1Tm + 0x340
_08085600:
	ldr r0, _08085648 @ =0x020034BC
	movs r4, #0xdf
	lsls r4, r4, #1
	subs r4, r4, r5
	lsls r4, r4, #1
	ldr r1, _0808564C @ =gBg0Tm
	adds r1, r4, r1
	adds r2, r5, #0
	movs r3, #7
	bl TmCopyRect_thm
	ldr r0, _08085650 @ =0x020039BC
	ldr r1, _08085654 @ =gBg1Tm
	adds r4, r4, r1
	adds r1, r4, #0
	adds r2, r5, #0
	movs r3, #7
	bl TmCopyRect_thm
_08085626:
	ldr r0, [r6, #0x58]
	adds r0, #1
	str r0, [r6, #0x58]
	cmp r0, #3
	bne _08085640
	movs r0, #0
	str r0, [r6, #0x58]
	adds r1, r6, #0
	adds r1, #0x55
	strb r0, [r1]
	adds r0, r6, #0
	bl Proc_Break
_08085640:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08085648: .4byte 0x020034BC
_0808564C: .4byte gBg0Tm
_08085650: .4byte 0x020039BC
_08085654: .4byte gBg1Tm

	thumb_func_start sub_8085658
sub_8085658: @ 0x08085658
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	adds r1, r6, #0
	adds r1, #0x55
	movs r0, #1
	strb r0, [r1]
	ldr r1, _08085698 @ =gUnk_08D8B134
	adds r0, r6, #0
	adds r0, #0x50
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r0, r0, #3
	adds r0, r0, r1
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bge _080856A4
	ldr r0, _0808569C @ =gBg0Tm + 0x340
	movs r1, #6
	movs r2, #7
	movs r3, #0
	bl TmFillRect_thm
	ldr r0, _080856A0 @ =gBg1Tm + 0x340
	movs r1, #6
	movs r2, #7
	movs r3, #0
	bl TmFillRect_thm
	b _080856BC
	.align 2, 0
_08085698: .4byte gUnk_08D8B134
_0808569C: .4byte gBg0Tm + 0x340
_080856A0: .4byte gBg1Tm + 0x340
_080856A4:
	ldr r0, _08085710 @ =gBg0Tm + 0x370
	movs r1, #6
	movs r2, #7
	movs r3, #0
	bl TmFillRect_thm
	ldr r0, _08085714 @ =gBg1Tm + 0x370
	movs r1, #6
	movs r2, #7
	movs r3, #0
	bl TmFillRect_thm
_080856BC:
	movs r0, #3
	bl EnableBgSync
	ldr r1, _08085718 @ =gUnk_08D8B19A
	ldr r0, [r6, #0x58]
	adds r0, r0, r1
	movs r5, #0
	ldrsb r5, [r0, r5]
	ldr r1, _0808571C @ =gUnk_08D8B134
	adds r0, r6, #0
	adds r0, #0x50
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r0, r0, #3
	adds r0, r0, r1
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bge _08085730
	movs r4, #0xa3
	lsls r4, r4, #1
	subs r4, r4, r5
	lsls r4, r4, #1
	ldr r0, _08085720 @ =gUiTmScratchA
	adds r0, r4, r0
	ldr r1, _08085724 @ =gBg0Tm + 0x340
	adds r2, r5, #0
	movs r3, #7
	bl TmCopyRect_thm
	ldr r0, _08085728 @ =gUiTmScratchB
	adds r4, r4, r0
	ldr r1, _0808572C @ =gBg1Tm + 0x340
	adds r0, r4, #0
	adds r2, r5, #0
	movs r3, #7
	bl TmCopyRect_thm
	b _08085756
	.align 2, 0
_08085710: .4byte gBg0Tm + 0x370
_08085714: .4byte gBg1Tm + 0x370
_08085718: .4byte gUnk_08D8B19A
_0808571C: .4byte gUnk_08D8B134
_08085720: .4byte gUiTmScratchA
_08085724: .4byte gBg0Tm + 0x340
_08085728: .4byte gUiTmScratchB
_0808572C: .4byte gBg1Tm + 0x340
_08085730:
	ldr r0, _0808577C @ =0x020034BC
	movs r4, #0xdf
	lsls r4, r4, #1
	subs r4, r4, r5
	lsls r4, r4, #1
	ldr r1, _08085780 @ =gBg0Tm
	adds r1, r4, r1
	adds r2, r5, #0
	movs r3, #7
	bl TmCopyRect_thm
	ldr r0, _08085784 @ =0x020039BC
	ldr r1, _08085788 @ =gBg1Tm
	adds r4, r4, r1
	adds r1, r4, #0
	adds r2, r5, #0
	movs r3, #7
	bl TmCopyRect_thm
_08085756:
	ldr r0, [r6, #0x58]
	adds r0, #1
	str r0, [r6, #0x58]
	cmp r0, #3
	bne _08085774
	movs r0, #0
	str r0, [r6, #0x58]
	adds r1, r6, #0
	adds r1, #0x55
	strb r0, [r1]
	adds r1, #1
	strb r0, [r1]
	adds r0, r6, #0
	bl Proc_Break
_08085774:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0808577C: .4byte 0x020034BC
_08085780: .4byte gBg0Tm
_08085784: .4byte 0x020039BC
_08085788: .4byte gBg1Tm

	thumb_func_start sub_808578C
sub_808578C: @ 0x0808578C
	push {lr}
	ldr r1, _080857D4 @ =gUnk_08D8B134
	adds r0, #0x50
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r0, r0, #3
	adds r1, r0, r1
	movs r0, #2
	ldrsb r0, [r1, r0]
	movs r2, #0x12
	cmp r0, #0
	bge _080857A8
	movs r2, #0
_080857A8:
	movs r0, #3
	ldrsb r0, [r1, r0]
	movs r1, #0xe
	cmp r0, #0
	bge _080857B4
	movs r1, #0
_080857B4:
	ldr r0, _080857D8 @ =gUiTmScratchA
	lsls r1, r1, #5
	adds r1, r1, r2
	lsls r1, r1, #1
	ldr r2, _080857DC @ =gBg0Tm
	adds r1, r1, r2
	movs r2, #0xc
	movs r3, #6
	bl TmCopyRect_thm
	movs r0, #3
	bl EnableBgSync
	pop {r0}
	bx r0
	.align 2, 0
_080857D4: .4byte gUnk_08D8B134
_080857D8: .4byte gUiTmScratchA
_080857DC: .4byte gBg0Tm

	thumb_func_start sub_80857E0
sub_80857E0: @ 0x080857E0
	push {lr}
	ldr r1, _08085818 @ =gUnk_08D8B134
	adds r0, #0x50
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r0, r0, #3
	adds r0, r0, r1
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	movs r1, #0x18
	cmp r0, #0
	bge _080857FE
	movs r1, #0
_080857FE:
	ldr r0, _0808581C @ =0x020034BC
	lsls r1, r1, #1
	ldr r2, _08085820 @ =gBg0Tm + 0x340
	adds r1, r1, r2
	movs r2, #6
	movs r3, #7
	bl TmCopyRect_thm
	movs r0, #3
	bl EnableBgSync
	pop {r0}
	bx r0
	.align 2, 0
_08085818: .4byte gUnk_08D8B134
_0808581C: .4byte 0x020034BC
_08085820: .4byte gBg0Tm + 0x340

	thumb_func_start sub_8085824
sub_8085824: @ 0x08085824
	push {r4, r5, lr}
	adds r5, r1, #0
	movs r4, #0
	cmp r0, #0x40
	beq _08085850
	cmp r0, #0x40
	bgt _08085838
	cmp r0, #0
	beq _0808583E
	b _08085858
_08085838:
	cmp r0, #0x80
	beq _08085848
	b _08085858
_0808583E:
	ldr r4, _08085844 @ =gUnk_0841C754
	b _0808585C
	.align 2, 0
_08085844: .4byte gUnk_0841C754
_08085848:
	ldr r4, _0808584C @ =gUnk_0841C774
	b _0808585C
	.align 2, 0
_0808584C: .4byte gUnk_0841C774
_08085850:
	ldr r4, _08085854 @ =gUnk_0841C794
	b _0808585C
	.align 2, 0
_08085854: .4byte gUnk_0841C794
_08085858:
	bl nullsub_7
_0808585C:
	lsls r1, r5, #5
	adds r0, r4, #0
	movs r2, #0x20
	bl ApplyPaletteExt
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start sub_808586C
sub_808586C: @ 0x0808586C
	ldr r0, _08085884 @ =gBmSt
	movs r2, #0x14
	ldrsh r1, [r0, r2]
	lsls r1, r1, #4
	movs r2, #0xc
	ldrsh r0, [r0, r2]
	subs r1, r1, r0
	cmp r1, #0x6f
	ble _08085888
	movs r0, #1
	rsbs r0, r0, #0
	b _0808588A
	.align 2, 0
_08085884: .4byte gBmSt
_08085888:
	movs r0, #1
_0808588A:
	bx lr

	thumb_func_start sub_808588C
sub_808588C: @ 0x0808588C
	ldr r0, _080858A4 @ =gBmSt
	movs r2, #0x14
	ldrsh r1, [r0, r2]
	lsls r1, r1, #4
	movs r2, #0xc
	ldrsh r0, [r0, r2]
	subs r1, r1, r0
	cmp r1, #0x70
	bgt _080858A8
	movs r0, #1
	b _080858AC
	.align 2, 0
_080858A4: .4byte gBmSt
_080858A8:
	movs r0, #1
	rsbs r0, r0, #0
_080858AC:
	bx lr
	.align 2, 0

	thumb_func_start sub_80858B0
sub_80858B0: @ 0x080858B0
	movs r2, #0x90
	lsls r2, r2, #1
	adds r1, r2, #0
	strh r1, [r0]
	ldr r3, _080858D4 @ =0x00000121
	adds r1, r3, #0
	strh r1, [r0, #2]
	movs r2, #0
	strh r2, [r0, #4]
	adds r3, #0x1d
	adds r1, r3, #0
	strh r1, [r0, #6]
	adds r3, #1
	adds r1, r3, #0
	strh r1, [r0, #8]
	strh r2, [r0, #0xa]
	bx lr
	.align 2, 0
_080858D4: .4byte 0x00000121

	thumb_func_start sub_80858D8
sub_80858D8: @ 0x080858D8
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	movs r4, #0x80
	lsls r4, r4, #1
	cmp r1, #0
	beq _080859A0
	adds r1, #0x30
	ldrb r2, [r1]
	lsls r0, r2, #0x1c
	lsrs r0, r0, #0x1c
	adds r6, r1, #0
	cmp r0, #8
	bhi _08085936
	lsls r0, r0, #2
	ldr r1, _080858FC @ =_08085900
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080858FC: .4byte _08085900
_08085900: @ jump table
	.4byte _080859A0 @ case 0
	.4byte _08085928 @ case 1
	.4byte _08085924 @ case 2
	.4byte _08085930 @ case 3
	.4byte _0808592C @ case 4
	.4byte _08085934 @ case 5
	.4byte _08085934 @ case 6
	.4byte _08085934 @ case 7
	.4byte _08085934 @ case 8
_08085924:
	adds r4, #0x60
	b _08085936
_08085928:
	adds r4, #0x64
	b _08085936
_0808592C:
	adds r4, #0x68
	b _08085936
_08085930:
	adds r4, #0x6c
	b _08085936
_08085934:
	adds r4, #0x70
_08085936:
	ldrb r1, [r6]
	lsls r0, r1, #0x1c
	lsrs r0, r0, #0x1c
	cmp r0, #6
	beq _0808595C
	cmp r0, #6
	bgt _0808594A
	cmp r0, #5
	beq _08085954
	b _08085982
_0808594A:
	cmp r0, #7
	beq _08085964
	cmp r0, #8
	beq _08085978
	b _08085982
_08085954:
	ldr r0, _08085958 @ =gUnk_0841C554
	b _08085966
	.align 2, 0
_08085958: .4byte gUnk_0841C554
_0808595C:
	ldr r0, _08085960 @ =gUnk_0841C5D4
	b _08085966
	.align 2, 0
_08085960: .4byte gUnk_0841C5D4
_08085964:
	ldr r0, _08085970 @ =gUnk_0841C654
_08085966:
	ldr r1, _08085974 @ =0x06002E00
	movs r2, #0x20
	bl CpuFastSet
	b _08085982
	.align 2, 0
_08085970: .4byte gUnk_0841C654
_08085974: .4byte 0x06002E00
_08085978:
	ldr r0, _080859A8 @ =gUnk_0841C6D4
	ldr r1, _080859AC @ =0x06002E00
	movs r2, #0x20
	bl CpuFastSet
_08085982:
	strh r4, [r5]
	adds r4, #1
	strh r4, [r5, #2]
	adds r4, #1
	strh r4, [r5, #4]
	adds r4, #1
	strh r4, [r5, #6]
	movs r0, #0
	strh r0, [r5, #8]
	ldrb r6, [r6]
	lsrs r0, r6, #4
	movs r2, #0x94
	lsls r2, r2, #1
	adds r0, r0, r2
	strh r0, [r5, #0xa]
_080859A0:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080859A8: .4byte gUnk_0841C6D4
_080859AC: .4byte 0x06002E00

	thumb_func_start sub_80859B0
sub_80859B0: @ 0x080859B0
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r6, r0, #0
	adds r4, r1, #0
	adds r0, #0x44
	ldrh r1, [r0]
	movs r0, #0x3f
	ands r0, r1
	cmp r0, #0
	bne _08085A54
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _080859DE
	ldr r0, [r6, #0x40]
	adds r1, r4, #0
	bl sub_80858D8
	movs r0, #1
	bl EnableBgSync
	b _08085A54
_080859DE:
	ldr r0, [r6, #0x40]
	adds r1, r4, #0
	bl sub_80858B0
	movs r0, #1
	bl EnableBgSync
	adds r0, r4, #0
	bl GetUnitCurrentHp
	cmp r0, #0x63
	ble _080859FE
	movs r0, #0xff
	bl sub_8004F5C
	b _08085A08
_080859FE:
	adds r0, r4, #0
	bl GetUnitCurrentHp
	bl sub_8004F5C
_08085A08:
	ldr r1, _08085A30 @ =0x02028D3C
	ldrb r0, [r1, #6]
	subs r0, #0x30
	adds r2, r6, #0
	adds r2, #0x51
	strb r0, [r2]
	ldrb r0, [r1, #7]
	subs r0, #0x30
	adds r1, r6, #0
	adds r1, #0x52
	strb r0, [r1]
	adds r0, r4, #0
	bl GetUnitMaxHp
	cmp r0, #0x63
	ble _08085A34
	movs r0, #0xff
	bl sub_8004F5C
	b _08085A3E
	.align 2, 0
_08085A30: .4byte 0x02028D3C
_08085A34:
	adds r0, r4, #0
	bl GetUnitMaxHp
	bl sub_8004F5C
_08085A3E:
	ldr r1, _08085B00 @ =0x02028D3C
	ldrb r0, [r1, #6]
	subs r0, #0x30
	adds r2, r6, #0
	adds r2, #0x53
	strb r0, [r2]
	ldrb r1, [r1, #7]
	subs r1, #0x30
	adds r0, r6, #0
	adds r0, #0x54
	strb r1, [r0]
_08085A54:
	adds r0, r6, #0
	adds r0, #0x55
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne _08085AF4
	adds r1, r6, #0
	adds r1, #0x44
	movs r0, #0x40
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	beq _08085A7E
	adds r1, r4, #0
	adds r1, #0x30
	movs r0, #0xf
	ldrb r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _08085AF4
_08085A7E:
	adds r0, r6, #0
	adds r0, #0x46
	movs r1, #0
	ldrsh r0, [r0, r1]
	lsls r7, r0, #3
	adds r1, r7, #0
	adds r1, #0x10
	adds r0, r6, #0
	adds r0, #0x48
	movs r2, #0
	ldrsh r0, [r0, r2]
	lsls r5, r0, #3
	adds r0, r6, #0
	adds r0, #0x51
	ldrb r4, [r0]
	cmp r4, #0xf0
	beq _08085AB0
	ldr r2, _08085B04 @ =Sprite_8x8
	adds r0, r4, #0
	ldr r4, _08085B08 @ =0x000082E0
	adds r3, r0, r4
	adds r0, r1, #0
	adds r1, r5, #0
	bl PutOamHiRam
_08085AB0:
	adds r0, r7, #0
	adds r0, #0x17
	ldr r1, _08085B04 @ =Sprite_8x8
	mov r8, r1
	adds r1, r6, #0
	adds r1, #0x52
	ldr r4, _08085B08 @ =0x000082E0
	ldrb r1, [r1]
	adds r3, r1, r4
	adds r1, r5, #0
	mov r2, r8
	bl PutOamHiRam
	adds r0, r7, #0
	adds r0, #0x22
	adds r1, r6, #0
	adds r1, #0x53
	ldrb r1, [r1]
	adds r3, r1, r4
	adds r1, r5, #0
	mov r2, r8
	bl PutOamHiRam
	adds r0, r7, #0
	adds r0, #0x29
	adds r1, r6, #0
	adds r1, #0x54
	ldrb r1, [r1]
	adds r4, r1, r4
	adds r1, r5, #0
	mov r2, r8
	adds r3, r4, #0
	bl PutOamHiRam
_08085AF4:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08085B00: .4byte 0x02028D3C
_08085B04: .4byte Sprite_8x8
_08085B08: .4byte 0x000082E0

	thumb_func_start sub_8085B0C
sub_8085B0C: @ 0x08085B0C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	adds r7, r0, #0
	mov r8, r1
	movs r0, #0
	mov sl, r0
	str r0, [sp, #4]
	ldr r1, _08085BC4 @ =gUiTmScratchA
	mov sb, r1
	ldr r2, _08085BC8 @ =0x01000060
	add r0, sp, #4
	bl CpuFastSet
	mov r2, r8
	ldr r0, [r2]
	ldrh r0, [r0]
	bl DecodeMsg
	adds r6, r0, #0
	movs r0, #0x30
	adds r1, r6, #0
	bl GetStringTextCenteredPos
	adds r5, r0, #0
	adds r4, r7, #0
	adds r4, #0x2c
	adds r0, r4, #0
	bl ClearText
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #5
	bl Text_SetParams
	adds r0, r4, #0
	adds r1, r6, #0
	bl Text_DrawString
	mov r1, sb
	adds r1, #0x4a
	adds r0, r4, #0
	bl PutText
	mov r0, r8
	bl GetUnitMiniPortraitId
	adds r2, r0, #0
	mov r1, r8
	ldr r0, [r1, #0xc]
	movs r1, #0x80
	lsls r1, r1, #0x10
	ands r0, r1
	cmp r0, #0
	beq _08085B82
	adds r2, #1
_08085B82:
	mov r1, sb
	adds r1, #0x42
	mov r0, sl
	str r0, [sp]
	adds r0, r2, #0
	movs r2, #0xf0
	movs r3, #4
	bl PutFaceChibi
	mov r0, sb
	adds r0, #0xca
	str r0, [r7, #0x40]
	adds r0, r7, #0
	adds r0, #0x44
	mov r1, sl
	strh r1, [r0]
	ldr r2, _08085BCC @ =gUnk_08D8B134
	adds r1, r7, #0
	adds r1, #0x50
	movs r0, #0
	ldrsb r0, [r1, r0]
	lsls r0, r0, #3
	adds r0, r0, r2
	ldrb r0, [r0, #2]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bge _08085BD0
	adds r2, r7, #0
	adds r2, #0x46
	movs r0, #5
	b _08085BD6
	.align 2, 0
_08085BC4: .4byte gUiTmScratchA
_08085BC8: .4byte 0x01000060
_08085BCC: .4byte gUnk_08D8B134
_08085BD0:
	adds r2, r7, #0
	adds r2, #0x46
	movs r0, #0x17
_08085BD6:
	strh r0, [r2]
	ldr r0, _08085BF4 @ =gUnk_08D8B134
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	lsls r1, r1, #3
	adds r1, r1, r0
	movs r0, #3
	ldrsb r0, [r1, r0]
	cmp r0, #0
	bge _08085BF8
	adds r1, r7, #0
	adds r1, #0x48
	movs r0, #3
	b _08085BFE
	.align 2, 0
_08085BF4: .4byte gUnk_08D8B134
_08085BF8:
	adds r1, r7, #0
	adds r1, #0x48
	movs r0, #0x11
_08085BFE:
	strh r0, [r1]
	adds r0, r7, #0
	mov r1, r8
	bl sub_80859B0
	ldr r0, _08085C40 @ =0x02003346
	movs r2, #0xc5
	lsls r2, r2, #6
	mov r1, r8
	bl PutMapUiHpBar
	ldr r0, _08085C44 @ =gUiTmScratchB
	ldr r1, _08085C48 @ =gUnk_0841C80C
	movs r2, #0xc4
	lsls r2, r2, #6
	bl TmApplyTsa_thm
	movs r0, #0xc0
	mov r2, r8
	ldrb r2, [r2, #0xb]
	ands r0, r2
	movs r1, #3
	bl sub_8085824
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08085C40: .4byte 0x02003346
_08085C44: .4byte gUiTmScratchB
_08085C48: .4byte gUnk_0841C80C

	thumb_func_start sub_8085C4C
sub_8085C4C: @ 0x08085C4C
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	bl sub_808512C
	adds r1, r0, #0
	movs r2, #1
	cmp r4, #5
	ble _08085C70
	cmp r4, #0xb
	bgt _08085C72
	ldr r0, _08085C88 @ =gUnk_08D8B134
	lsls r1, r1, #3
	adds r1, r1, r0
	movs r0, #5
	ldrsb r0, [r1, r0]
	cmp r0, #0
	bge _08085C72
_08085C70:
	movs r2, #4
_08085C72:
	cmp r5, #1
	bgt _08085C78
	subs r2, #1
_08085C78:
	cmp r5, #0x16
	ble _08085C7E
	adds r2, #1
_08085C7E:
	adds r0, r2, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_08085C88: .4byte gUnk_08D8B134

	thumb_func_start sub_8085C8C
sub_8085C8C: @ 0x08085C8C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	adds r7, r0, #0
	str r1, [sp]
	movs r0, #0x10
	ldrsb r0, [r1, r0]
	lsls r0, r0, #4
	ldr r2, _08085DD4 @ =gBmSt
	movs r3, #0xc
	ldrsh r1, [r2, r3]
	subs r0, r0, r1
	cmp r0, #0
	bge _08085CB0
	adds r0, #7
_08085CB0:
	asrs r0, r0, #3
	mov sl, r0
	ldr r1, [sp]
	movs r0, #0x11
	ldrsb r0, [r1, r0]
	lsls r0, r0, #4
	movs r3, #0xe
	ldrsh r1, [r2, r3]
	subs r0, r0, r1
	cmp r0, #0
	bge _08085CC8
	adds r0, #7
_08085CC8:
	asrs r4, r0, #3
	mov r0, sl
	adds r1, r4, #0
	bl sub_8085C4C
	mov r8, r0
	ldr r0, _08085DD8 @ =gUnk_08D8B16C
	add r0, r8
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	add sl, r0
	ldr r0, _08085DDC @ =gUnk_08D8B172
	add r0, r8
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r4, r4, r0
	adds r0, r7, #0
	adds r0, #0x3c
	mov r1, sl
	strb r1, [r0]
	adds r0, #1
	strb r4, [r0]
	adds r1, r7, #0
	adds r1, #0x3e
	movs r0, #8
	strb r0, [r1]
	adds r1, #1
	movs r0, #5
	strb r0, [r1]
	ldr r2, [sp]
	ldr r0, [r2]
	ldrh r0, [r0]
	bl DecodeMsg
	mov sb, r0
	movs r0, #0x30
	mov r1, sb
	bl GetStringTextCenteredPos
	adds r6, r0, #0
	adds r5, r7, #0
	adds r5, #0x2c
	adds r0, r5, #0
	bl ClearText
	adds r0, r5, #0
	adds r1, r6, #0
	movs r2, #5
	bl Text_SetParams
	adds r0, r5, #0
	mov r1, sb
	bl Text_DrawString
	ldr r0, _08085DE0 @ =gUnk_08D8B15A
	add r0, r8
	movs r1, #0
	ldrsb r1, [r0, r1]
	adds r1, r4, r1
	lsls r1, r1, #5
	ldr r0, _08085DE4 @ =gUnk_08D8B154
	add r0, r8
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	add r0, sl
	adds r1, r1, r0
	lsls r1, r1, #1
	ldr r6, _08085DE8 @ =gBg0Tm
	adds r1, r1, r6
	adds r0, r5, #0
	bl PutText
	adds r1, r4, #3
	lsls r0, r1, #5
	adds r0, #1
	add r0, sl
	lsls r0, r0, #1
	adds r0, r0, r6
	str r0, [r7, #0x40]
	adds r0, r7, #0
	adds r0, #0x44
	movs r3, #0
	strh r3, [r0]
	mov r0, sl
	adds r0, #1
	adds r2, r7, #0
	adds r2, #0x46
	strh r0, [r2]
	adds r0, r7, #0
	adds r0, #0x48
	strh r1, [r0]
	adds r0, r7, #0
	ldr r1, [sp]
	bl sub_80859B0
	lsls r4, r4, #5
	add r4, sl
	lsls r4, r4, #1
	ldr r0, _08085DEC @ =gBg1Tm
	adds r4, r4, r0
	ldr r0, _08085DF0 @ =gUnk_08D8B178
	mov r1, r8
	lsls r1, r1, #2
	mov r8, r1
	add r8, r0
	mov r2, r8
	ldr r1, [r2]
	movs r2, #0xc4
	lsls r2, r2, #6
	adds r0, r4, #0
	bl TmApplyTsa_thm
	movs r0, #3
	bl EnableBgSync
	movs r0, #0xc0
	ldr r3, [sp]
	ldrb r3, [r3, #0xb]
	ands r0, r3
	movs r1, #3
	bl sub_8085824
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08085DD4: .4byte gBmSt
_08085DD8: .4byte gUnk_08D8B16C
_08085DDC: .4byte gUnk_08D8B172
_08085DE0: .4byte gUnk_08D8B15A
_08085DE4: .4byte gUnk_08D8B154
_08085DE8: .4byte gBg0Tm
_08085DEC: .4byte gBg1Tm
_08085DF0: .4byte gUnk_08D8B178

	thumb_func_start sub_8085DF4
sub_8085DF4: @ 0x08085DF4
	push {r4, r5, r6, r7, lr}
	adds r2, r0, #0
	movs r0, #0xa1
	lsls r0, r0, #3
	ldrh r1, [r2, #0x3e]
	cmp r1, r0
	bne _08085E5E
	adds r7, r2, #0
	adds r7, #0x3d
	movs r0, #0
	ldrsb r0, [r7, r0]
	lsls r0, r0, #5
	adds r5, r2, #0
	adds r5, #0x3c
	movs r1, #0
	ldrsb r1, [r5, r1]
	adds r0, r0, r1
	lsls r0, r0, #1
	ldr r1, _08085E64 @ =gBg0Tm
	adds r0, r0, r1
	adds r6, r2, #0
	adds r6, #0x3e
	movs r1, #0
	ldrsb r1, [r6, r1]
	adds r4, r2, #0
	adds r4, #0x3f
	movs r2, #0
	ldrsb r2, [r4, r2]
	movs r3, #0
	bl TmFillRect_thm
	movs r0, #0
	ldrsb r0, [r7, r0]
	lsls r0, r0, #5
	movs r1, #0
	ldrsb r1, [r5, r1]
	adds r0, r0, r1
	lsls r0, r0, #1
	ldr r1, _08085E68 @ =gBg1Tm
	adds r0, r0, r1
	movs r1, #0
	ldrsb r1, [r6, r1]
	movs r2, #0
	ldrsb r2, [r4, r2]
	movs r3, #0
	bl TmFillRect_thm
	movs r0, #3
	bl EnableBgSync
	movs r0, #0
	strb r0, [r6]
	strb r0, [r4]
_08085E5E:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08085E64: .4byte gBg0Tm
_08085E68: .4byte gBg1Tm

	thumb_func_start sub_8085E6C
sub_8085E6C: @ 0x08085E6C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	adds r4, r0, #0
	ldr r0, _08085F64 @ =gBmSt
	mov sb, r0
	movs r1, #0x16
	ldrsh r0, [r0, r1]
	ldr r1, _08085F68 @ =gBmMapTerrain
	ldr r1, [r1]
	lsls r0, r0, #2
	adds r0, r0, r1
	mov r2, sb
	movs r3, #0x14
	ldrsh r1, [r2, r3]
	ldr r0, [r0]
	adds r0, r0, r1
	ldrb r7, [r0]
	bl sub_8031B40
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08085EA0
	b _08086026
_08085EA0:
	ldr r0, _08085F6C @ =0x020034BC
	mov r8, r0
	movs r1, #0xe
	movs r2, #7
	movs r3, #0
	bl TmFillRect_thm
	ldr r0, _08085F70 @ =0x020039BC
	movs r1, #0xe
	movs r2, #7
	movs r3, #0
	bl TmFillRect_thm
	adds r0, r7, #0
	bl sub_8019EF0
	adds r5, r0, #0
	movs r0, #0x20
	adds r1, r5, #0
	bl GetStringTextCenteredPos
	adds r6, r0, #0
	adds r4, #0x2c
	adds r0, r4, #0
	bl ClearText
	adds r0, r4, #0
	adds r1, r6, #0
	movs r2, #0
	bl Text_SetParams
	adds r0, r4, #0
	adds r1, r5, #0
	bl Text_DrawString
	mov r1, r8
	adds r1, #0x82
	adds r0, r4, #0
	bl PutText
	movs r6, #0x81
	lsls r6, r6, #1
	add r6, r8
	ldr r1, _08085F74 @ =gUnk_0841CA98
	movs r2, #0x80
	lsls r2, r2, #1
	mov sl, r2
	adds r0, r6, #0
	bl TmApplyTsa_thm
	ldr r0, _08085F78 @ =gUnk_08C52C98
	adds r0, r7, r0
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	ble _08085F54
	ldr r0, _08085F7C @ =gUnk_08C53846
	adds r0, r7, r0
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl sub_8004F20
	movs r0, #0x84
	lsls r0, r0, #1
	add r0, r8
	ldr r4, _08085F80 @ =0x02028D43
	movs r5, #0x94
	lsls r5, r5, #1
	adds r1, r4, #0
	adds r2, r5, #0
	movs r3, #2
	bl PutDigits
	ldr r0, _08085F84 @ =gUnk_08C53805
	adds r0, r7, r0
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl sub_8004F20
	movs r0, #0xa4
	lsls r0, r0, #1
	add r0, r8
	adds r1, r4, #0
	adds r2, r5, #0
	movs r3, #2
	bl PutDigits
_08085F54:
	cmp r7, #0x29
	bgt _08085F88
	cmp r7, #0x27
	bge _08085FEC
	cmp r7, #0x1b
	beq _08085F8C
	b _0808601A
	.align 2, 0
_08085F64: .4byte gBmSt
_08085F68: .4byte gBmMapTerrain
_08085F6C: .4byte 0x020034BC
_08085F70: .4byte 0x020039BC
_08085F74: .4byte gUnk_0841CA98
_08085F78: .4byte gUnk_08C52C98
_08085F7C: .4byte gUnk_08C53846
_08085F80: .4byte 0x02028D43
_08085F84: .4byte gUnk_08C53805
_08085F88:
	cmp r7, #0x33
	bne _0808601A
_08085F8C:
	ldr r4, _08085FC0 @ =0x020035BE
	ldr r1, _08085FC4 @ =gUnk_0841CAAC
	movs r2, #0x84
	lsls r2, r2, #6
	adds r0, r4, #0
	bl TmApplyTsa_thm
	ldr r1, _08085FC8 @ =gBmSt
	movs r3, #0x14
	ldrsh r0, [r1, r3]
	movs r2, #0x16
	ldrsh r1, [r1, r2]
	bl sub_802C17C
	adds r6, r0, #0
	cmp r6, #0x64
	bne _08085FD0
	adds r0, r4, #0
	adds r0, #0x44
	ldr r1, _08085FCC @ =gUnk_0841CAB8
	movs r2, #0x80
	lsls r2, r2, #1
	bl TmApplyTsa_thm
	b _0808601A
	.align 2, 0
_08085FC0: .4byte 0x020035BE
_08085FC4: .4byte gUnk_0841CAAC
_08085FC8: .4byte gBmSt
_08085FCC: .4byte gUnk_0841CAB8
_08085FD0:
	adds r0, r6, #0
	bl sub_8004F20
	adds r0, r4, #0
	adds r0, #0x46
	ldr r1, _08085FE8 @ =0x02028D43
	movs r2, #0x94
	lsls r2, r2, #1
	movs r3, #2
	bl PutDigits
	b _0808601A
	.align 2, 0
_08085FE8: .4byte 0x02028D43
_08085FEC:
	ldr r1, _08086034 @ =gUnk_0841CAA4
	adds r0, r6, #0
	mov r2, sl
	bl TmApplyTsa_thm
	mov r3, sb
	movs r1, #0x14
	ldrsh r0, [r3, r1]
	movs r2, #0x16
	ldrsh r1, [r3, r2]
	bl sub_802C17C
	bl sub_8004F20
	movs r0, #0x84
	lsls r0, r0, #1
	add r0, r8
	ldr r1, _08086038 @ =0x02028D43
	movs r2, #0x94
	lsls r2, r2, #1
	movs r3, #2
	bl PutDigits
_0808601A:
	ldr r0, _0808603C @ =0x020039BC
	ldr r1, _08086040 @ =gUnk_0841C7B4
	movs r2, #0x88
	lsls r2, r2, #5
	bl TmApplyTsa_thm
_08086026:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08086034: .4byte gUnk_0841CAA4
_08086038: .4byte 0x02028D43
_0808603C: .4byte 0x020039BC
_08086040: .4byte gUnk_0841C7B4

	thumb_func_start sub_8086044
sub_8086044: @ 0x08086044
	push {lr}
	adds r2, r0, #0
	adds r1, r2, #0
	adds r1, #0x57
	movs r0, #0xff
	strb r0, [r1]
	subs r1, #1
	movs r0, #0
	strb r0, [r1]
	str r0, [r2, #0x58]
	subs r1, #6
	movs r0, #1
	strb r0, [r1]
	adds r0, r2, #0
	adds r0, #0x2c
	movs r1, #4
	bl sub_800536C
	pop {r0}
	bx r0

	thumb_func_start sub_808606C
sub_808606C: @ 0x0808606C
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r1, r5, #0
	adds r1, #0x55
	movs r0, #1
	strb r0, [r1]
	bl sub_808512C
	adds r1, r5, #0
	adds r1, #0x50
	strb r0, [r1]
	ldr r0, _08086100 @ =gUnk_08D8B134
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	lsls r1, r1, #3
	adds r1, r1, r0
	movs r0, #0
	ldrsb r0, [r1, r0]
	ldrb r1, [r1, #1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	bl sub_8085110
	adds r6, r0, #0
	ldr r0, _08086104 @ =gUnk_08D8B200
	bl Proc_Find
	adds r4, r0, #0
	cmp r4, #0
	beq _080860BA
	adds r1, r4, #0
	adds r1, #0x57
	movs r0, #0
	ldrsb r0, [r1, r0]
	cmp r0, #0
	blt _080860BA
	cmp r0, r6
	beq _080860F8
_080860BA:
	ldr r0, _08086108 @ =gUnk_08D8B2D8
	bl Proc_Find
	cmp r4, #0
	beq _080860D4
	adds r1, r0, #0
	adds r1, #0x57
	movs r0, #0
	ldrsb r0, [r1, r0]
	cmp r0, #0
	blt _080860D4
	cmp r0, r6
	beq _080860F8
_080860D4:
	adds r0, r5, #0
	adds r0, #0x57
	strb r6, [r0]
	adds r0, r5, #0
	bl sub_8085E6C
	ldr r0, _0808610C @ =gBmSt
	ldrh r1, [r0, #0x14]
	adds r2, r5, #0
	adds r2, #0x4e
	strb r1, [r2]
	ldrh r0, [r0, #0x16]
	adds r1, r5, #0
	adds r1, #0x4f
	strb r0, [r1]
	adds r0, r5, #0
	bl Proc_Break
_080860F8:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08086100: .4byte gUnk_08D8B134
_08086104: .4byte gUnk_08D8B200
_08086108: .4byte gUnk_08D8B2D8
_0808610C: .4byte gBmSt

	thumb_func_start sub_8086110
sub_8086110: @ 0x08086110
	push {r4, lr}
	adds r4, r0, #0
	adds r3, r4, #0
	adds r3, #0x4e
	ldrb r0, [r3]
	adds r2, r4, #0
	adds r2, #0x4c
	strb r0, [r2]
	movs r0, #0x4f
	adds r0, r0, r4
	mov ip, r0
	ldrb r0, [r0]
	adds r1, r4, #0
	adds r1, #0x4d
	strb r0, [r1]
	ldr r1, _08086190 @ =gBmSt
	ldrh r0, [r1, #0x14]
	strb r0, [r3]
	ldrh r0, [r1, #0x16]
	mov r1, ip
	strb r0, [r1]
	ldr r0, _08086194 @ =0x0000FFFF
	adds r1, r0, #0
	ldrh r3, [r3]
	ands r1, r3
	ldrh r2, [r2]
	ands r0, r2
	cmp r1, r0
	beq _080861AE
	ldr r0, _08086198 @ =ProcScr_CamMove
	bl Proc_Find
	cmp r0, #0
	bne _080861A0
	bl sub_808512C
	adds r1, r0, #0
	adds r0, r4, #0
	adds r0, #0x50
	movs r2, #0
	ldrsb r2, [r0, r2]
	cmp r1, r2
	beq _08086180
	ldr r0, _0808619C @ =gUnk_08D8B134
	lsls r1, r1, #3
	adds r3, r1, r0
	lsls r1, r2, #3
	adds r1, r1, r0
	ldrb r2, [r3]
	ldrb r0, [r1]
	cmp r2, r0
	bne _080861A0
	ldrb r3, [r3, #1]
	ldrb r1, [r1, #1]
	cmp r3, r1
	bne _080861A0
_08086180:
	adds r0, r4, #0
	bl sub_8085E6C
	adds r0, r4, #0
	bl sub_80857E0
	b _080861AE
	.align 2, 0
_08086190: .4byte gBmSt
_08086194: .4byte 0x0000FFFF
_08086198: .4byte ProcScr_CamMove
_0808619C: .4byte gUnk_08D8B134
_080861A0:
	adds r1, r4, #0
	adds r1, #0x56
	movs r0, #1
	strb r0, [r1]
	adds r0, r4, #0
	bl Proc_Break
_080861AE:
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_80861B4
sub_80861B4: @ 0x080861B4
	push {r4, lr}
	adds r4, r0, #0
	adds r1, r4, #0
	adds r1, #0x57
	movs r0, #0xff
	strb r0, [r1]
	adds r0, r4, #0
	adds r0, #0x2c
	movs r1, #6
	bl sub_800536C
	movs r1, #0
	str r1, [r4, #0x58]
	adds r0, r4, #0
	adds r0, #0x56
	strb r1, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_80861DC
sub_80861DC: @ 0x080861DC
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	ldr r2, _08086278 @ =gBmSt
	movs r1, #0x16
	ldrsh r0, [r2, r1]
	ldr r1, _0808627C @ =gBmMapUnit
	ldr r1, [r1]
	lsls r0, r0, #2
	adds r0, r0, r1
	movs r3, #0x14
	ldrsh r1, [r2, r3]
	ldr r0, [r0]
	adds r0, r0, r1
	ldrb r0, [r0]
	bl GetUnit
	adds r6, r0, #0
	cmp r6, #0
	beq _08086270
	adds r1, r4, #0
	adds r1, #0x55
	movs r0, #1
	strb r0, [r1]
	bl sub_808512C
	adds r1, r4, #0
	adds r1, #0x50
	strb r0, [r1]
	ldr r0, _08086280 @ =gUnk_08D8B134
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	lsls r1, r1, #3
	adds r1, r1, r0
	movs r0, #2
	ldrsb r0, [r1, r0]
	ldrb r1, [r1, #3]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	bl sub_8085110
	adds r5, r0, #0
	ldr r0, _08086284 @ =gUnk_08D8B1A0
	bl Proc_Find
	cmp r0, #0
	beq _0808624A
	adds r1, r0, #0
	adds r1, #0x57
	movs r0, #0
	ldrsb r0, [r1, r0]
	cmp r0, #0
	blt _0808624A
	cmp r0, r5
	beq _08086270
_0808624A:
	adds r0, r4, #0
	adds r0, #0x57
	strb r5, [r0]
	ldr r0, _08086278 @ =gBmSt
	ldrh r1, [r0, #0x14]
	adds r2, r4, #0
	adds r2, #0x4e
	strb r1, [r2]
	ldrh r0, [r0, #0x16]
	adds r1, r4, #0
	adds r1, #0x4f
	strb r0, [r1]
	adds r0, r4, #0
	adds r1, r6, #0
	bl sub_8085B0C
	adds r0, r4, #0
	bl Proc_Break
_08086270:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08086278: .4byte gBmSt
_0808627C: .4byte gBmMapUnit
_08086280: .4byte gUnk_08D8B134
_08086284: .4byte gUnk_08D8B1A0

	thumb_func_start sub_8086288
sub_8086288: @ 0x08086288
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	ldr r6, _08086340 @ =gBmSt
	movs r1, #0x16
	ldrsh r0, [r6, r1]
	ldr r1, _08086344 @ =gBmMapUnit
	ldr r1, [r1]
	lsls r0, r0, #2
	adds r0, r0, r1
	movs r2, #0x14
	ldrsh r1, [r6, r2]
	ldr r0, [r0]
	adds r0, r0, r1
	ldrb r0, [r0]
	bl GetUnit
	adds r7, r0, #0
	adds r4, r5, #0
	adds r4, #0x44
	ldrh r0, [r4]
	adds r0, #1
	strh r0, [r4]
	adds r0, r5, #0
	adds r1, r7, #0
	bl sub_80859B0
	movs r0, #0x3f
	ldrh r4, [r4]
	ands r0, r4
	cmp r0, #0
	bne _080862CC
	adds r0, r5, #0
	bl sub_808578C
_080862CC:
	adds r3, r5, #0
	adds r3, #0x4e
	ldrb r0, [r3]
	adds r2, r5, #0
	adds r2, #0x4c
	strb r0, [r2]
	adds r4, r5, #0
	adds r4, #0x4f
	ldrb r0, [r4]
	adds r1, r5, #0
	adds r1, #0x4d
	strb r0, [r1]
	ldrh r0, [r6, #0x14]
	strb r0, [r3]
	ldrh r0, [r6, #0x16]
	strb r0, [r4]
	ldr r0, _08086348 @ =0x0000FFFF
	adds r1, r0, #0
	ldrh r3, [r3]
	ands r1, r3
	ldrh r2, [r2]
	ands r0, r2
	cmp r1, r0
	beq _08086362
	cmp r7, #0
	beq _08086354
	ldr r0, _0808634C @ =ProcScr_CamMove
	bl Proc_Find
	cmp r0, #0
	bne _08086354
	bl sub_808512C
	adds r1, r0, #0
	adds r0, r5, #0
	adds r0, #0x50
	movs r2, #0
	ldrsb r2, [r0, r2]
	cmp r1, r2
	beq _08086336
	ldr r0, _08086350 @ =gUnk_08D8B134
	lsls r1, r1, #3
	adds r3, r1, r0
	lsls r1, r2, #3
	adds r1, r1, r0
	ldrb r0, [r3, #2]
	ldrb r2, [r1, #2]
	cmp r0, r2
	bne _08086354
	ldrb r3, [r3, #3]
	ldrb r1, [r1, #3]
	cmp r3, r1
	bne _08086354
_08086336:
	adds r0, r5, #0
	movs r1, #1
	bl Proc_Goto
	b _08086362
	.align 2, 0
_08086340: .4byte gBmSt
_08086344: .4byte gBmMapUnit
_08086348: .4byte 0x0000FFFF
_0808634C: .4byte ProcScr_CamMove
_08086350: .4byte gUnk_08D8B134
_08086354:
	adds r1, r5, #0
	adds r1, #0x56
	movs r0, #1
	strb r0, [r1]
	adds r0, r5, #0
	bl Proc_Break
_08086362:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_8086368
sub_8086368: @ 0x08086368
	push {r4, lr}
	adds r4, r0, #0
	ldr r2, _08086398 @ =gBmSt
	movs r1, #0x16
	ldrsh r0, [r2, r1]
	ldr r1, _0808639C @ =gBmMapUnit
	ldr r1, [r1]
	lsls r0, r0, #2
	adds r0, r0, r1
	movs r3, #0x14
	ldrsh r1, [r2, r3]
	ldr r0, [r0]
	adds r0, r0, r1
	ldrb r0, [r0]
	bl GetUnit
	adds r1, r0, #0
	cmp r1, #0
	bne _080863A0
	adds r0, r4, #0
	movs r1, #3
	bl Proc_Goto
	b _080863AC
	.align 2, 0
_08086398: .4byte gBmSt
_0808639C: .4byte gBmMapUnit
_080863A0:
	adds r0, r4, #0
	bl sub_8085B0C
	adds r0, r4, #0
	bl sub_808578C
_080863AC:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_80863B4
sub_80863B4: @ 0x080863B4
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x2c
	movs r1, #6
	bl sub_800536C
	adds r0, r4, #0
	adds r0, #0x4b
	movs r1, #0
	strb r1, [r0]
	adds r0, #0xa
	strb r1, [r0]
	str r1, [r4, #0x58]
	subs r0, #0x17
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r0, #0x17
	strb r1, [r0]
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_80863E0
sub_80863E0: @ 0x080863E0
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r5, r4, #0
	adds r5, #0x4b
	ldrb r0, [r5]
	adds r3, r4, #0
	adds r3, #0x4a
	strb r0, [r3]
	ldr r2, _08086424 @ =gBmSt
	movs r1, #0x16
	ldrsh r0, [r2, r1]
	ldr r1, _08086428 @ =gBmMapUnit
	ldr r1, [r1]
	lsls r0, r0, #2
	adds r0, r0, r1
	movs r6, #0x14
	ldrsh r1, [r2, r6]
	ldr r0, [r0]
	adds r0, r0, r1
	ldrb r0, [r0]
	strb r0, [r5]
	ldrb r1, [r3]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r1, r0
	beq _0808642C
	cmp r1, #0
	beq _0808642C
	adds r0, r4, #0
	bl sub_8085DF4
	movs r0, #0
	str r0, [r4, #0x58]
	b _080864D4
	.align 2, 0
_08086424: .4byte gBmSt
_08086428: .4byte gBmMapUnit
_0808642C:
	adds r0, r4, #0
	adds r0, #0x4b
	ldrb r1, [r0]
	adds r6, r0, #0
	cmp r1, #0
	beq _080864D4
	ldr r0, _0808647C @ =ProcScr_CamMove
	bl Proc_Find
	cmp r0, #0
	bne _080864D4
	ldr r0, _08086480 @ =gUnk_08D8B1A0
	bl Proc_Find
	adds r5, r0, #0
	cmp r5, #0
	beq _0808645A
	adds r0, #0x55
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne _08086470
_0808645A:
	ldr r0, _08086484 @ =gUnk_08D8B2D8
	bl Proc_Find
	cmp r0, #0
	beq _08086488
	adds r0, #0x55
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _08086488
_08086470:
	ldr r0, [r4, #0x58]
	cmp r0, #3
	bgt _080864D4
	adds r0, #1
	str r0, [r4, #0x58]
	b _080864D4
	.align 2, 0
_0808647C: .4byte ProcScr_CamMove
_08086480: .4byte gUnk_08D8B1A0
_08086484: .4byte gUnk_08D8B2D8
_08086488:
	ldr r0, [r4, #0x58]
	adds r0, #1
	str r0, [r4, #0x58]
	cmp r0, #7
	ble _080864D4
	cmp r0, #8
	bne _080864A6
	ldrb r0, [r6]
	bl GetUnit
	adds r1, r0, #0
	adds r0, r4, #0
	bl sub_8085C8C
	b _080864D4
_080864A6:
	adds r1, r4, #0
	adds r1, #0x44
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
	cmp r5, #0
	beq _080864BE
	adds r0, r5, #0
	adds r0, #0x55
	ldrb r0, [r0]
	adds r1, #0x11
	b _080864C4
_080864BE:
	adds r1, r4, #0
	adds r1, #0x55
	movs r0, #0
_080864C4:
	strb r0, [r1]
	ldrb r0, [r6]
	bl GetUnit
	adds r1, r0, #0
	adds r0, r4, #0
	bl sub_80859B0
_080864D4:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_80864DC
sub_80864DC: @ 0x080864DC
	push {r4, r5, lr}
	ldr r5, _080865DC @ =gDispIo
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
	adds r2, r5, #0
	adds r2, #0x36
	movs r0, #1
	ldrb r1, [r2]
	orrs r0, r1
	movs r1, #2
	orrs r0, r1
	movs r1, #4
	orrs r0, r1
	movs r1, #8
	orrs r0, r1
	movs r1, #0x10
	orrs r0, r1
	movs r1, #0x20
	orrs r0, r1
	strb r0, [r2]
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
	adds r2, r5, #0
	adds r2, #0x3c
	movs r0, #0x3f
	ldrb r1, [r2]
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r2]
	adds r1, r5, #0
	adds r1, #0x44
	movs r3, #0
	movs r0, #0xf
	strb r0, [r1]
	adds r1, #1
	movs r0, #4
	strb r0, [r1]
	adds r0, r5, #0
	adds r0, #0x46
	strb r3, [r0]
	ldr r0, _080865E0 @ =0x0000FFE0
	ldrh r1, [r5, #0x3c]
	ands r0, r1
	movs r1, #2
	orrs r0, r1
	strh r0, [r5, #0x3c]
	ldrb r0, [r2]
	ands r4, r0
	strb r4, [r2]
	ldr r0, _080865E4 @ =0x0000E0FF
	ldrh r1, [r5, #0x3c]
	ands r0, r1
	movs r2, #0xe0
	lsls r2, r2, #5
	adds r1, r2, #0
	orrs r0, r1
	strh r0, [r5, #0x3c]
	ldr r0, _080865E8 @ =gUnk_0841BE00
	ldr r1, _080865EC @ =0x06002000
	bl Decompress
	ldr r0, _080865F0 @ =0x06002500
	ldr r1, _080865F4 @ =0x06015C00
	movs r2, #0x50
	bl CpuFastSet
	ldr r0, _080865F8 @ =0x06002EA0
	ldr r1, _080865FC @ =0x06015D40
	movs r2, #8
	bl CpuFastSet
	ldr r0, _08086600 @ =gPal
	movs r1, #0xc0
	lsls r1, r1, #2
	movs r2, #0x20
	bl ApplyPaletteExt
	movs r0, #1
	movs r1, #2
	bl ApplyIconPalette
	bl ResetTextFont
	ldr r4, _08086604 @ =gPlaySt
	adds r0, r4, #0
	adds r0, #0x40
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080865C6
	ldr r0, _08086608 @ =gUnk_08D8B1A0
	movs r1, #3
	bl Proc_Start
_080865C6:
	ldr r1, _0808660C @ =gBmSt
	movs r0, #0x10
	ldrb r1, [r1, #4]
	ands r0, r1
	cmp r0, #0
	beq _08086614
	ldr r0, _08086610 @ =gUnk_08D8B338
	movs r1, #3
	bl Proc_Start
	b _08086628
	.align 2, 0
_080865DC: .4byte gDispIo
_080865E0: .4byte 0x0000FFE0
_080865E4: .4byte 0x0000E0FF
_080865E8: .4byte gUnk_0841BE00
_080865EC: .4byte 0x06002000
_080865F0: .4byte 0x06002500
_080865F4: .4byte 0x06015C00
_080865F8: .4byte 0x06002EA0
_080865FC: .4byte 0x06015D40
_08086600: .4byte gPal
_08086604: .4byte gPlaySt
_08086608: .4byte gUnk_08D8B1A0
_0808660C: .4byte gBmSt
_08086610: .4byte gUnk_08D8B338
_08086614:
	adds r0, r4, #0
	adds r0, #0x42
	ldrb r0, [r0]
	lsls r0, r0, #0x1f
	cmp r0, #0
	bne _08086628
	ldr r0, _08086658 @ =gUnk_08D8B2D8
	movs r1, #3
	bl Proc_Start
_08086628:
	ldr r0, _0808665C @ =gPlaySt
	adds r4, r0, #0
	adds r4, #0x40
	ldrb r1, [r4]
	lsls r0, r1, #0x1c
	lsrs r0, r0, #0x1e
	cmp r0, #0
	bne _08086640
	ldr r0, _08086660 @ =gUnk_08D8B200
	movs r1, #3
	bl Proc_Start
_08086640:
	ldrb r4, [r4]
	lsls r0, r4, #0x1c
	lsrs r0, r0, #0x1e
	cmp r0, #1
	bne _08086652
	ldr r0, _08086664 @ =gUnk_08D8B288
	movs r1, #3
	bl Proc_Start
_08086652:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08086658: .4byte gUnk_08D8B2D8
_0808665C: .4byte gPlaySt
_08086660: .4byte gUnk_08D8B200
_08086664: .4byte gUnk_08D8B288

	thumb_func_start sub_8086668
sub_8086668: @ 0x08086668
	push {lr}
	ldr r0, _08086678 @ =gUnk_08D8B2B8
	movs r1, #3
	bl Proc_Start
	pop {r0}
	bx r0
	.align 2, 0
_08086678: .4byte gUnk_08D8B2B8

	thumb_func_start EndPlayerPhaseSideWindows
EndPlayerPhaseSideWindows: @ 0x0808667C
	push {lr}
	ldr r0, _080866C4 @ =gUnk_08D8B200
	bl Proc_EndEach
	ldr r0, _080866C8 @ =gUnk_08D8B288
	bl Proc_EndEach
	ldr r0, _080866CC @ =gUnk_08D8B1A0
	bl Proc_EndEach
	ldr r0, _080866D0 @ =gUnk_08D8B2D8
	bl Proc_EndEach
	ldr r0, _080866D4 @ =gUnk_08D8B338
	bl Proc_EndEach
	ldr r3, _080866D8 @ =gDispIo
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
	bl ClearUi
	pop {r0}
	bx r0
	.align 2, 0
_080866C4: .4byte gUnk_08D8B200
_080866C8: .4byte gUnk_08D8B288
_080866CC: .4byte gUnk_08D8B1A0
_080866D0: .4byte gUnk_08D8B2D8
_080866D4: .4byte gUnk_08D8B338
_080866D8: .4byte gDispIo

	thumb_func_start sub_80866DC
sub_80866DC: @ 0x080866DC
	ldr r0, _080866F4 @ =gBmSt
	movs r2, #0x16
	ldrsh r1, [r0, r2]
	lsls r1, r1, #4
	movs r2, #0xe
	ldrsh r0, [r0, r2]
	subs r1, r1, r0
	cmp r1, #0x40
	bgt _080866F8
	movs r0, #0
	b _080866FA
	.align 2, 0
_080866F4: .4byte gBmSt
_080866F8:
	movs r0, #1
_080866FA:
	bx lr

	thumb_func_start sub_80866FC
sub_80866FC: @ 0x080866FC
	push {lr}
	bl sub_80866DC
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08086724
	bl sub_808586C
	movs r1, #1
	rsbs r1, r1, #0
	cmp r0, r1
	bne _08086718
	movs r0, #2
	b _08086742
_08086718:
	bl sub_808586C
	cmp r0, #1
	bne _08086740
	movs r0, #1
	b _08086742
_08086724:
	bl sub_808588C
	movs r1, #1
	rsbs r1, r1, #0
	cmp r0, r1
	bne _08086734
	movs r0, #4
	b _08086742
_08086734:
	bl sub_808588C
	cmp r0, #1
	bne _08086740
	movs r0, #3
	b _08086742
_08086740:
	movs r0, #0
_08086742:
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_8086748
sub_8086748: @ 0x08086748
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	bl sub_8031B40
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080867C0
	ldr r7, _080867C8 @ =0x020039E4
	adds r0, r7, #0
	movs r1, #0xb
	movs r2, #9
	movs r3, #0
	bl TmFillRect_thm
	ldr r6, _080867CC @ =0x02003564
	adds r0, r6, #0
	movs r1, #0xb
	movs r2, #9
	movs r3, #0
	bl TmFillRect_thm
	adds r5, r4, #0
	adds r5, #0x44
	movs r1, #0
	ldrsh r0, [r5, r1]
	cmp r0, #0
	bne _08086796
	ldr r1, _080867D0 @ =gUnk_0841CB54
	movs r2, #0x88
	lsls r2, r2, #5
	adds r0, r7, #0
	bl TmApplyTsa_thm
	adds r0, r4, #0
	adds r0, #0x2c
	adds r1, r6, #0
	adds r1, #0x42
	bl PutText
_08086796:
	ldrh r5, [r5]
	cmp r5, #1
	bne _080867C0
	ldr r1, _080867D4 @ =gUnk_0841CACC
	movs r2, #0x88
	lsls r2, r2, #5
	adds r0, r7, #0
	bl TmApplyTsa_thm
	adds r0, r4, #0
	adds r0, #0x2c
	adds r1, r6, #0
	adds r1, #0x42
	bl PutText
	adds r0, r4, #0
	adds r0, #0x34
	adds r1, r6, #0
	adds r1, #0xc2
	bl PutText
_080867C0:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080867C8: .4byte 0x020039E4
_080867CC: .4byte 0x02003564
_080867D0: .4byte gUnk_0841CB54
_080867D4: .4byte gUnk_0841CACC

	thumb_func_start sub_80867D8
sub_80867D8: @ 0x080867D8
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	movs r1, #0
	str r1, [r7, #0x58]
	adds r0, #0x56
	strb r1, [r0]
	subs r0, #6
	strb r1, [r0]
	adds r1, r7, #0
	adds r1, #0x57
	movs r0, #0xff
	strb r0, [r1]
	adds r5, r7, #0
	adds r5, #0x2c
	adds r0, r5, #0
	movs r1, #8
	bl InitText
	adds r4, r7, #0
	adds r4, #0x34
	adds r0, r4, #0
	movs r1, #8
	bl InitText
	adds r0, r7, #0
	bl StartGreenText
	adds r0, r5, #0
	bl ClearText
	adds r0, r4, #0
	bl ClearText
	ldr r6, _08086860 @ =gPlaySt
	movs r0, #0xe
	ldrsb r0, [r6, r0]
	bl GetChapterInfo
	adds r0, #0x8a
	ldrh r0, [r0]
	bl DecodeMsg
	adds r4, r0, #0
	movs r0, #0x40
	adds r1, r4, #0
	bl GetStringTextCenteredPos
	adds r1, r0, #0
	adds r0, r5, #0
	movs r2, #0
	adds r3, r4, #0
	bl Text_InsertDrawString
	movs r0, #0xe
	ldrsb r0, [r6, r0]
	bl GetChapterInfo
	adds r0, #0x8c
	ldrb r0, [r0]
	cmp r0, #4
	bls _08086854
	b _08086950
_08086854:
	lsls r0, r0, #2
	ldr r1, _08086864 @ =_08086868
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08086860: .4byte gPlaySt
_08086864: .4byte _08086868
_08086868: @ jump table
	.4byte _0808687C @ case 0
	.4byte _08086884 @ case 1
	.4byte _080868CC @ case 2
	.4byte _0808687C @ case 3
	.4byte _0808687C @ case 4
_0808687C:
	adds r1, r7, #0
	adds r1, #0x44
	movs r0, #0
	b _0808694E
_08086884:
	adds r4, r7, #0
	adds r4, #0x34
	ldr r3, _080868AC @ =gUnk_0841D0CC
	adds r0, r4, #0
	movs r1, #0x14
	movs r2, #0
	bl Text_InsertDrawString
	ldr r0, _080868B0 @ =gPlaySt
	ldrb r0, [r0, #0xd]
	cmp r0, #0
	beq _080868B8
	ldr r3, _080868B4 @ =gUnk_0841D0D4
	adds r0, r4, #0
	movs r1, #0x24
	movs r2, #1
	bl Text_InsertDrawString
	b _08086948
	.align 2, 0
_080868AC: .4byte gUnk_0841D0CC
_080868B0: .4byte gPlaySt
_080868B4: .4byte gUnk_0841D0D4
_080868B8:
	movs r0, #0x80
	bl sub_80872A4
	adds r3, r0, #0
	adds r0, r4, #0
	movs r1, #0x2c
	movs r2, #2
	bl Text_InsertDrawNumberOrBlank
	b _08086948
_080868CC:
	ldr r5, _08086900 @ =gPlaySt
	ldrh r4, [r5, #0x10]
	movs r0, #0xe
	ldrsb r0, [r5, r0]
	bl GetChapterInfo
	adds r0, #0x8d
	ldrb r0, [r0]
	subs r0, #1
	cmp r4, r0
	blt _08086908
	ldr r5, _08086904 @ =gUnk_0841D0DC
	adds r4, r7, #0
	adds r4, #0x34
	movs r0, #0x40
	adds r1, r5, #0
	bl GetStringTextCenteredPos
	adds r1, r0, #0
	adds r0, r4, #0
	movs r2, #4
	adds r3, r5, #0
	bl Text_InsertDrawString
	b _08086948
	.align 2, 0
_08086900: .4byte gPlaySt
_08086904: .4byte gUnk_0841D0DC
_08086908:
	adds r4, r7, #0
	adds r4, #0x34
	ldrh r3, [r5, #0x10]
	adds r0, r4, #0
	movs r1, #0xa
	movs r2, #2
	bl Text_InsertDrawNumberOrBlank
	ldr r3, _08086958 @ =gUnk_0841D0E8
	adds r0, r4, #0
	movs r1, #0x12
	movs r2, #0
	bl Text_InsertDrawString
	movs r0, #0xe
	ldrsb r0, [r5, r0]
	bl GetChapterInfo
	adds r0, #0x8d
	ldrb r3, [r0]
	subs r3, #1
	adds r0, r4, #0
	movs r1, #0x22
	movs r2, #2
	bl Text_InsertDrawNumberOrBlank
	ldr r3, _0808695C @ =gUnk_0841D0EC
	adds r0, r4, #0
	movs r1, #0x2a
	movs r2, #0
	bl Text_InsertDrawString
_08086948:
	adds r1, r7, #0
	adds r1, #0x44
	movs r0, #1
_0808694E:
	strh r0, [r1]
_08086950:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08086958: .4byte gUnk_0841D0E8
_0808695C: .4byte gUnk_0841D0EC

	thumb_func_start sub_8086960
sub_8086960: @ 0x08086960
	push {r4, r5, lr}
	adds r4, r0, #0
	movs r0, #0
	str r0, [r4, #0x58]
	adds r1, r4, #0
	adds r1, #0x55
	movs r0, #1
	strb r0, [r1]
	bl sub_808512C
	adds r1, r4, #0
	adds r1, #0x50
	strb r0, [r1]
	ldr r0, _080869EC @ =gUnk_08D8B134
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	lsls r1, r1, #3
	adds r1, r1, r0
	movs r0, #4
	ldrsb r0, [r1, r0]
	ldrb r1, [r1, #5]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	bl sub_8085110
	adds r5, r0, #0
	ldr r0, _080869F0 @ =gUnk_08D8B1A0
	bl Proc_Find
	cmp r0, #0
	beq _080869B0
	adds r1, r0, #0
	adds r1, #0x57
	movs r0, #0
	ldrsb r0, [r1, r0]
	cmp r0, #0
	blt _080869B0
	cmp r0, r5
	beq _080869E4
_080869B0:
	adds r0, r4, #0
	adds r0, #0x57
	strb r5, [r0]
	adds r0, r4, #0
	bl sub_8086748
	ldr r1, _080869F4 @ =gBmSt
	ldrh r0, [r1, #0x14]
	adds r2, r4, #0
	adds r2, #0x4e
	strb r0, [r2]
	ldrh r0, [r1, #0x16]
	adds r3, r4, #0
	adds r3, #0x4f
	strb r0, [r3]
	ldrb r1, [r2]
	adds r0, r4, #0
	adds r0, #0x4c
	strb r1, [r0]
	ldrb r0, [r3]
	adds r1, r4, #0
	adds r1, #0x4d
	strb r0, [r1]
	adds r0, r4, #0
	bl Proc_Break
_080869E4:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080869EC: .4byte gUnk_08D8B134
_080869F0: .4byte gUnk_08D8B1A0
_080869F4: .4byte gBmSt

	thumb_func_start sub_80869F8
sub_80869F8: @ 0x080869F8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	adds r7, r1, #0
	mov sl, r2
	ldr r1, _08086B80 @ =gUnk_08D8B134
	lsls r0, r0, #3
	adds r0, r0, r1
	movs r1, #4
	ldrsb r1, [r0, r1]
	mov r8, r1
	ldrb r0, [r0, #5]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	mov sb, r0
	cmp r1, #0
	bge _08086A66
	cmp r0, #0
	bge _08086A66
	ldr r4, _08086B84 @ =gBg1Tm
	adds r0, r4, #0
	movs r1, #0xc
	movs r2, #6
	movs r3, #0
	bl TmFillRect_thm
	ldr r5, _08086B88 @ =gBg0Tm
	adds r0, r5, #0
	movs r1, #0xc
	movs r2, #6
	movs r3, #0
	bl TmFillRect_thm
	movs r0, #0x10
	subs r0, r0, r7
	lsls r0, r0, #6
	ldr r1, _08086B8C @ =0x02003764
	adds r0, r0, r1
	adds r1, r4, #0
	movs r2, #0xc
	adds r3, r7, #0
	bl TmCopyRect_thm
	movs r0, #0x12
	subs r0, r0, r7
	lsls r0, r0, #6
	ldr r1, _08086B90 @ =0x02003264
	adds r0, r0, r1
	adds r1, r5, #0
	movs r2, #0xc
	adds r3, r7, #0
	bl TmCopyRect_thm
_08086A66:
	mov r0, r8
	cmp r0, #0
	ble _08086AB6
	mov r1, sb
	cmp r1, #0
	bge _08086AB6
	ldr r4, _08086B94 @ =gBg1Tm + 0x26
	adds r0, r4, #0
	movs r1, #0xc
	movs r2, #6
	movs r3, #0
	bl TmFillRect_thm
	ldr r5, _08086B98 @ =gBg0Tm + 0x26
	adds r0, r5, #0
	movs r1, #0xc
	movs r2, #6
	movs r3, #0
	bl TmFillRect_thm
	movs r0, #0x10
	subs r0, r0, r7
	lsls r0, r0, #6
	ldr r1, _08086B8C @ =0x02003764
	adds r0, r0, r1
	adds r1, r4, #0
	movs r2, #0xc
	adds r3, r7, #0
	bl TmCopyRect_thm
	movs r0, #0x12
	subs r0, r0, r7
	lsls r0, r0, #6
	ldr r1, _08086B90 @ =0x02003264
	adds r0, r0, r1
	adds r1, r5, #0
	movs r2, #0xc
	adds r3, r7, #0
	bl TmCopyRect_thm
_08086AB6:
	mov r0, r8
	cmp r0, #0
	bge _08086B10
	mov r1, sb
	cmp r1, #0
	ble _08086B10
	ldr r5, _08086B9C @ =gBg1Tm + 0x380
	adds r0, r5, #0
	movs r1, #0xc
	movs r2, #6
	movs r3, #0
	bl TmFillRect_thm
	ldr r6, _08086BA0 @ =gBg0Tm + 0x380
	adds r0, r6, #0
	movs r1, #0xc
	movs r2, #6
	movs r3, #0
	bl TmFillRect_thm
	ldr r0, _08086BA4 @ =0x020039E4
	movs r4, #1
	mov r1, sl
	subs r4, r4, r1
	lsls r4, r4, #1
	adds r4, #0x14
	subs r4, r4, r7
	lsls r4, r4, #6
	ldr r1, _08086BA8 @ =0xFFFFFC80
	adds r5, r5, r1
	adds r5, r4, r5
	adds r1, r5, #0
	movs r2, #0xc
	adds r3, r7, #0
	bl TmCopyRect_thm
	ldr r0, _08086BAC @ =0x02003564
	ldr r1, _08086BA8 @ =0xFFFFFC80
	adds r6, r6, r1
	adds r4, r4, r6
	adds r1, r4, #0
	movs r2, #0xc
	adds r3, r7, #0
	bl TmCopyRect_thm
_08086B10:
	mov r0, r8
	cmp r0, #0
	ble _08086B6A
	mov r1, sb
	cmp r1, #0
	ble _08086B6A
	ldr r5, _08086BB0 @ =gBg1Tm + 0x3a6
	adds r0, r5, #0
	movs r1, #0xc
	movs r2, #6
	movs r3, #0
	bl TmFillRect_thm
	ldr r6, _08086BB4 @ =gBg0Tm + 0x3a6
	adds r0, r6, #0
	movs r1, #0xc
	movs r2, #6
	movs r3, #0
	bl TmFillRect_thm
	ldr r0, _08086BA4 @ =0x020039E4
	movs r4, #1
	mov r1, sl
	subs r4, r4, r1
	lsls r4, r4, #1
	adds r4, #0x14
	subs r4, r4, r7
	lsls r4, r4, #6
	ldr r1, _08086BA8 @ =0xFFFFFC80
	adds r5, r5, r1
	adds r5, r4, r5
	adds r1, r5, #0
	movs r2, #0xc
	adds r3, r7, #0
	bl TmCopyRect_thm
	ldr r0, _08086BAC @ =0x02003564
	ldr r1, _08086BA8 @ =0xFFFFFC80
	adds r6, r6, r1
	adds r4, r4, r6
	adds r1, r4, #0
	movs r2, #0xc
	adds r3, r7, #0
	bl TmCopyRect_thm
_08086B6A:
	movs r0, #3
	bl EnableBgSync
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08086B80: .4byte gUnk_08D8B134
_08086B84: .4byte gBg1Tm
_08086B88: .4byte gBg0Tm
_08086B8C: .4byte 0x02003764
_08086B90: .4byte 0x02003264
_08086B94: .4byte gBg1Tm + 0x26
_08086B98: .4byte gBg0Tm + 0x26
_08086B9C: .4byte gBg1Tm + 0x380
_08086BA0: .4byte gBg0Tm + 0x380
_08086BA4: .4byte 0x020039E4
_08086BA8: .4byte 0xFFFFFC80
_08086BAC: .4byte 0x02003564
_08086BB0: .4byte gBg1Tm + 0x3a6
_08086BB4: .4byte gBg0Tm + 0x3a6

	thumb_func_start sub_8086BB8
sub_8086BB8: @ 0x08086BB8
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, _08086BFC @ =gUnk_08D8B2D0
	ldr r0, [r4, #0x58]
	adds r0, r0, r1
	movs r1, #0
	ldrsb r1, [r0, r1]
	adds r0, r4, #0
	adds r0, #0x50
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r2, r4, #0
	adds r2, #0x44
	movs r3, #0
	ldrsh r2, [r2, r3]
	bl sub_80869F8
	ldr r0, [r4, #0x58]
	adds r0, #1
	str r0, [r4, #0x58]
	cmp r0, #5
	bne _08086BF6
	movs r0, #0
	str r0, [r4, #0x58]
	adds r1, r4, #0
	adds r1, #0x55
	strb r0, [r1]
	adds r0, r4, #0
	bl Proc_Break
_08086BF6:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08086BFC: .4byte gUnk_08D8B2D0

	thumb_func_start sub_8086C00
sub_8086C00: @ 0x08086C00
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r6, r4, #0
	adds r6, #0x55
	movs r5, #0
	movs r0, #1
	strb r0, [r6]
	ldr r1, _08086C58 @ =gUnk_08D8B2D5
	ldr r0, [r4, #0x58]
	adds r0, r0, r1
	movs r1, #0
	ldrsb r1, [r0, r1]
	adds r0, r4, #0
	adds r0, #0x50
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r2, r4, #0
	adds r2, #0x44
	movs r3, #0
	ldrsh r2, [r2, r3]
	bl sub_80869F8
	ldr r0, [r4, #0x58]
	adds r0, #1
	str r0, [r4, #0x58]
	cmp r0, #3
	bne _08086C50
	str r5, [r4, #0x58]
	strb r5, [r6]
	adds r0, r4, #0
	adds r0, #0x56
	strb r5, [r0]
	adds r1, r4, #0
	adds r1, #0x57
	movs r0, #0xff
	strb r0, [r1]
	adds r0, r4, #0
	bl Proc_Break
_08086C50:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08086C58: .4byte gUnk_08D8B2D5

	thumb_func_start nullsub_71
nullsub_71: @ 0x08086C5C
	bx lr
	.align 2, 0

	thumb_func_start nullsub_72
nullsub_72: @ 0x08086C60
	bx lr
	.align 2, 0

	thumb_func_start nullsub_73
nullsub_73: @ 0x08086C64
	bx lr
	.align 2, 0

	thumb_func_start sub_8086C68
sub_8086C68: @ 0x08086C68
	push {r4, lr}
	adds r4, r0, #0
	adds r3, r4, #0
	adds r3, #0x4e
	ldrb r0, [r3]
	adds r2, r4, #0
	adds r2, #0x4c
	strb r0, [r2]
	movs r0, #0x4f
	adds r0, r0, r4
	mov ip, r0
	ldrb r0, [r0]
	adds r1, r4, #0
	adds r1, #0x4d
	strb r0, [r1]
	ldr r1, _08086CEC @ =gBmSt
	ldrh r0, [r1, #0x14]
	strb r0, [r3]
	ldrh r0, [r1, #0x16]
	mov r1, ip
	strb r0, [r1]
	ldr r0, _08086CF0 @ =0x0000FFFF
	adds r1, r0, #0
	ldrh r3, [r3]
	ands r1, r3
	ldrh r2, [r2]
	ands r0, r2
	cmp r1, r0
	beq _08086CE6
	ldr r0, _08086CF4 @ =ProcScr_CamMove
	bl Proc_Find
	cmp r0, #0
	bne _08086CD8
	bl sub_808512C
	adds r1, r0, #0
	adds r0, r4, #0
	adds r0, #0x50
	movs r2, #0
	ldrsb r2, [r0, r2]
	cmp r1, r2
	beq _08086CE6
	ldr r0, _08086CF8 @ =gUnk_08D8B134
	lsls r1, r1, #3
	adds r3, r1, r0
	lsls r1, r2, #3
	adds r1, r1, r0
	ldrb r2, [r3, #4]
	ldrb r0, [r1, #4]
	cmp r2, r0
	bne _08086CD8
	ldrb r3, [r3, #5]
	ldrb r1, [r1, #5]
	cmp r3, r1
	beq _08086CE6
_08086CD8:
	adds r1, r4, #0
	adds r1, #0x56
	movs r0, #1
	strb r0, [r1]
	adds r0, r4, #0
	bl Proc_Break
_08086CE6:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08086CEC: .4byte gBmSt
_08086CF0: .4byte 0x0000FFFF
_08086CF4: .4byte ProcScr_CamMove
_08086CF8: .4byte gUnk_08D8B134

	thumb_func_start sub_8086CFC
sub_8086CFC: @ 0x08086CFC
	push {lr}
	ldr r0, _08086D44 @ =gUnk_08D8B200
	bl Proc_Find
	cmp r0, #0
	beq _08086D14
	adds r0, #0x56
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne _08086D40
_08086D14:
	ldr r0, _08086D48 @ =gUnk_08D8B1A0
	bl Proc_Find
	cmp r0, #0
	beq _08086D2A
	adds r0, #0x56
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne _08086D40
_08086D2A:
	ldr r0, _08086D4C @ =gUnk_08D8B2D8
	bl Proc_Find
	cmp r0, #0
	beq _08086D50
	adds r0, #0x56
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _08086D50
_08086D40:
	movs r0, #1
	b _08086D52
	.align 2, 0
_08086D44: .4byte gUnk_08D8B200
_08086D48: .4byte gUnk_08D8B1A0
_08086D4C: .4byte gUnk_08D8B2D8
_08086D50:
	movs r0, #0
_08086D52:
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_8086D58
sub_8086D58: @ 0x08086D58
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08086D80 @ =gUnk_0841D838
	ldr r1, _08086D84 @ =0x06015000
	bl Decompress
	adds r1, r4, #0
	adds r1, #0x46
	movs r2, #0
	movs r0, #0x88
	strh r0, [r1]
	adds r1, #2
	movs r0, #0x8c
	strh r0, [r1]
	adds r0, r4, #0
	adds r0, #0x56
	strb r2, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08086D80: .4byte gUnk_0841D838
_08086D84: .4byte 0x06015000

	thumb_func_start sub_8086D88
sub_8086D88: @ 0x08086D88
	push {r4, r5, lr}
	adds r3, r0, #0
	adds r5, r2, #0
	ldr r0, _08086E08 @ =gUnk_08D8B134
	lsls r1, r1, #3
	adds r1, r1, r0
	movs r2, #4
	ldrsb r2, [r1, r2]
	movs r4, #5
	ldrsb r4, [r1, r4]
	cmp r2, #0
	bge _08086DB6
	cmp r4, #0
	bge _08086DB6
	adds r1, r3, #0
	adds r1, #0x46
	movs r0, #8
	strh r0, [r1]
	adds r1, r5, #0
	subs r1, #0x18
	adds r0, r3, #0
	adds r0, #0x48
	strh r1, [r0]
_08086DB6:
	cmp r2, #0
	ble _08086DD0
	cmp r4, #0
	bge _08086DD0
	adds r1, r3, #0
	adds r1, #0x46
	movs r0, #0x88
	strh r0, [r1]
	adds r1, r5, #0
	subs r1, #0x18
	adds r0, r3, #0
	adds r0, #0x48
	strh r1, [r0]
_08086DD0:
	cmp r2, #0
	bge _08086DE8
	cmp r4, #0
	ble _08086DE8
	adds r1, r3, #0
	adds r1, #0x46
	movs r0, #8
	strh r0, [r1]
	movs r0, #0xa0
	subs r0, r0, r5
	adds r1, #2
	strh r0, [r1]
_08086DE8:
	cmp r2, #0
	ble _08086E00
	cmp r4, #0
	ble _08086E00
	adds r1, r3, #0
	adds r1, #0x46
	movs r0, #0x88
	strh r0, [r1]
	movs r0, #0xa0
	subs r0, r0, r5
	adds r1, #2
	strh r0, [r1]
_08086E00:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08086E08: .4byte gUnk_08D8B134

	thumb_func_start sub_8086E0C
sub_8086E0C: @ 0x08086E0C
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	sub sp, #4
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r0, _08086E8C @ =0x000001FF
	mov r8, r0
	adds r1, r4, #0
	ands r1, r0
	movs r0, #0xff
	ands r5, r0
	ldr r6, _08086E90 @ =Sprite_32x16
	movs r0, #0xa0
	lsls r0, r0, #2
	str r0, [sp]
	movs r0, #4
	adds r2, r5, #0
	adds r3, r6, #0
	bl PutSprite
	adds r1, r4, #0
	adds r1, #0x20
	mov r0, r8
	ands r1, r0
	movs r0, #0xa1
	lsls r0, r0, #2
	str r0, [sp]
	movs r0, #4
	adds r2, r5, #0
	adds r3, r6, #0
	bl PutSprite
	adds r1, r4, #0
	adds r1, #0x40
	mov r0, r8
	ands r1, r0
	movs r0, #0xa2
	lsls r0, r0, #2
	str r0, [sp]
	movs r0, #4
	adds r2, r5, #0
	adds r3, r6, #0
	bl PutSprite
	adds r4, #0x60
	mov r0, r8
	ands r4, r0
	ldr r3, _08086E94 @ =Sprite_8x16
	movs r0, #0xa3
	lsls r0, r0, #2
	str r0, [sp]
	movs r0, #4
	adds r1, r4, #0
	adds r2, r5, #0
	bl PutSprite
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08086E8C: .4byte 0x000001FF
_08086E90: .4byte Sprite_32x16
_08086E94: .4byte Sprite_8x16

	thumb_func_start sub_8086E98
sub_8086E98: @ 0x08086E98
	push {r4, r5, lr}
	adds r4, r0, #0
	bl sub_808512C
	adds r1, r4, #0
	adds r1, #0x50
	movs r5, #0
	strb r0, [r1]
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	ldr r2, [r4, #0x58]
	adds r0, r4, #0
	bl sub_8086D88
	str r5, [r4, #0x58]
	ldr r1, _08086ED0 @ =gBmSt
	ldrh r0, [r1, #0x14]
	adds r2, r4, #0
	adds r2, #0x4e
	strb r0, [r2]
	ldrh r0, [r1, #0x16]
	adds r4, #0x4f
	strb r0, [r4]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08086ED0: .4byte gBmSt

	thumb_func_start sub_8086ED4
sub_8086ED4: @ 0x08086ED4
	push {r4, lr}
	adds r4, r0, #0
	ldr r2, [r4, #0x58]
	adds r2, #4
	str r2, [r4, #0x58]
	adds r0, #0x50
	movs r1, #0
	ldrsb r1, [r0, r1]
	adds r0, r4, #0
	bl sub_8086D88
	adds r0, r4, #0
	adds r0, #0x46
	movs r1, #0
	ldrsh r0, [r0, r1]
	adds r1, r4, #0
	adds r1, #0x48
	movs r2, #0
	ldrsh r1, [r1, r2]
	bl sub_8086E0C
	ldr r0, [r4, #0x58]
	cmp r0, #0x18
	bne _08086F12
	adds r0, r4, #0
	bl Proc_Break
	adds r1, r4, #0
	adds r1, #0x56
	movs r0, #0
	strb r0, [r1]
_08086F12:
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_8086F18
sub_8086F18: @ 0x08086F18
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x46
	movs r1, #0
	ldrsh r0, [r0, r1]
	adds r1, r4, #0
	adds r1, #0x48
	movs r2, #0
	ldrsh r1, [r1, r2]
	bl sub_8086E0C
	adds r3, r4, #0
	adds r3, #0x4e
	ldrb r0, [r3]
	adds r2, r4, #0
	adds r2, #0x4c
	strb r0, [r2]
	movs r0, #0x4f
	adds r0, r0, r4
	mov ip, r0
	ldrb r0, [r0]
	adds r1, r4, #0
	adds r1, #0x4d
	strb r0, [r1]
	ldr r1, _08086FB0 @ =gBmSt
	ldrh r0, [r1, #0x14]
	strb r0, [r3]
	ldrh r0, [r1, #0x16]
	mov r1, ip
	strb r0, [r1]
	ldr r0, _08086FB4 @ =0x0000FFFF
	adds r1, r0, #0
	ldrh r3, [r3]
	ands r1, r3
	ldrh r2, [r2]
	ands r0, r2
	cmp r1, r0
	beq _08086FA8
	ldr r0, _08086FB8 @ =ProcScr_CamMove
	bl Proc_Find
	cmp r0, #0
	bne _08086F9A
	bl sub_808512C
	adds r1, r0, #0
	adds r0, r4, #0
	adds r0, #0x50
	movs r2, #0
	ldrsb r2, [r0, r2]
	cmp r1, r2
	beq _08086FA8
	ldr r0, _08086FBC @ =gUnk_08D8B134
	lsls r1, r1, #3
	adds r3, r1, r0
	lsls r1, r2, #3
	adds r1, r1, r0
	ldrb r2, [r3, #4]
	ldrb r0, [r1, #4]
	cmp r2, r0
	bne _08086F9A
	ldrb r3, [r3, #5]
	ldrb r1, [r1, #5]
	cmp r3, r1
	beq _08086FA8
_08086F9A:
	adds r1, r4, #0
	adds r1, #0x56
	movs r0, #1
	strb r0, [r1]
	adds r0, r4, #0
	bl Proc_Break
_08086FA8:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08086FB0: .4byte gBmSt
_08086FB4: .4byte 0x0000FFFF
_08086FB8: .4byte ProcScr_CamMove
_08086FBC: .4byte gUnk_08D8B134

	thumb_func_start sub_8086FC0
sub_8086FC0: @ 0x08086FC0
	push {r4, lr}
	adds r4, r0, #0
	ldr r2, [r4, #0x58]
	subs r2, #4
	str r2, [r4, #0x58]
	adds r0, #0x50
	movs r1, #0
	ldrsb r1, [r0, r1]
	adds r0, r4, #0
	bl sub_8086D88
	adds r0, r4, #0
	adds r0, #0x46
	movs r1, #0
	ldrsh r0, [r0, r1]
	adds r1, r4, #0
	adds r1, #0x48
	movs r2, #0
	ldrsh r1, [r1, r2]
	bl sub_8086E0C
	ldr r1, [r4, #0x58]
	cmp r1, #0
	bne _08086FFC
	adds r0, r4, #0
	adds r0, #0x56
	strb r1, [r0]
	adds r0, r4, #0
	bl Proc_Break
_08086FFC:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
