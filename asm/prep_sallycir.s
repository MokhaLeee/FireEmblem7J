	.include "macro.inc"
	.syntax unified

	thumb_func_start PrepMuralBackground_Init
PrepMuralBackground_Init: @ 0x08090F14
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	adds r6, r0, #0
	ldr r4, _08090FC8 @ =gBg3Tm
	adds r0, r4, #0
	movs r1, #0
	bl TmFill
	bl GetGameTime
	movs r0, #0
	strh r0, [r6, #0x2a]
	movs r7, #0
	mov sl, r4
	movs r0, #0x2d
	adds r0, r0, r6
	mov sb, r0
	adds r1, r6, #0
	adds r1, #0x2c
	str r1, [sp]
_08090F44:
	movs r5, #0
	adds r3, r7, #1
	mov r8, r3
_08090F4A:
	ldrh r0, [r6, #0x2a]
	lsrs r4, r0, #3
	adds r4, r7, r4
	adds r0, r4, #0
	movs r1, #0x28
	bl __modsi3
	movs r1, #0x27
	subs r1, r1, r0
	movs r0, #0x1f
	ands r4, r0
	lsls r4, r4, #6
	lsls r2, r5, #1
	adds r4, r4, r2
	add r4, sl
	lsls r0, r1, #4
	subs r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _08090FCC @ =TsaConfig_PrepMuralBackground
	adds r0, r0, r1
	adds r2, r2, r0
	mov r3, sb
	ldrb r3, [r3]
	lsls r0, r3, #0xc
	ldrh r2, [r2]
	adds r0, r2, r0
	strh r0, [r4]
	adds r0, r5, #1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	cmp r5, #0x1d
	bls _08090F4A
	mov r1, r8
	lsls r0, r1, #0x10
	lsrs r7, r0, #0x10
	cmp r7, #0x1f
	bls _08090F44
	movs r0, #8
	bl EnableBgSync
	movs r0, #0
	ldr r3, [sp]
	strb r0, [r3]
	movs r4, #0xff
	adds r2, r4, #0
	ldrh r0, [r6, #0x2a]
	ands r2, r0
	movs r0, #3
	movs r1, #0
	bl SetBgOffset
	ldr r0, _08090FD0 @ =0x0400001E
	ldrh r6, [r6, #0x2a]
	ands r4, r6
	strh r4, [r0]
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08090FC8: .4byte gBg3Tm
_08090FCC: .4byte TsaConfig_PrepMuralBackground
_08090FD0: .4byte 0x0400001E

	thumb_func_start PrepMuralBackground_Loop
PrepMuralBackground_Loop: @ 0x08090FD4
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	adds r6, r0, #0
	adds r5, r6, #0
	adds r5, #0x2c
	ldrb r0, [r5]
	cmp r0, #3
	bne _08091018
	ldrh r0, [r6, #0x2a]
	adds r0, #1
	strh r0, [r6, #0x2a]
	lsls r0, r0, #0x10
	movs r1, #0xa0
	lsls r1, r1, #0x13
	cmp r0, r1
	bne _08090FFC
	movs r0, #0
	strh r0, [r6, #0x2a]
_08090FFC:
	movs r4, #0xff
	adds r2, r4, #0
	ldrh r1, [r6, #0x2a]
	ands r2, r1
	movs r0, #3
	movs r1, #0
	bl SetBgOffset
	ldr r0, _080910A4 @ =0x0400001E
	ldrh r7, [r6, #0x2a]
	ands r4, r7
	strh r4, [r0]
	movs r0, #0
	strb r0, [r5]
_08091018:
	adds r1, r6, #0
	adds r1, #0x2c
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	ldrh r1, [r6, #0x2a]
	movs r0, #7
	ands r0, r1
	cmp r0, #0
	bne _08091098
	ldr r5, _080910A8 @ =TsaConfig_PrepMuralBackground
	lsrs r0, r1, #3
	subs r4, r0, #1
	movs r1, #0x1f
	ands r4, r1
	adds r0, #0x1f
	movs r1, #0x28
	bl __modsi3
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r3, #0
	ldr r1, _080910AC @ =gBg3Tm
	mov r8, r1
	lsls r4, r4, #6
	movs r1, #0x27
	subs r1, r1, r0
	lsls r0, r1, #4
	subs r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r5
	mov sb, r0
	mov ip, r8
	adds r5, r6, #0
	adds r5, #0x2d
	adds r6, r4, #0
_08091060:
	lsls r1, r3, #1
	adds r2, r4, r1
	add r2, ip
	add r1, sb
	ldrb r7, [r5]
	lsls r0, r7, #0xc
	ldrh r1, [r1]
	adds r0, r1, r0
	strh r0, [r2]
	adds r0, r3, #1
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	cmp r3, #0x1d
	bls _08091060
	mov r0, r8
	adds r4, r6, r0
	movs r0, #3
	bl GetBgTilemapOffset
	adds r1, r0, #0
	movs r0, #0xc0
	lsls r0, r0, #0x13
	adds r0, r6, r0
	adds r1, r1, r0
	adds r0, r4, #0
	movs r2, #0xf
	bl CpuFastSet
_08091098:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080910A4: .4byte 0x0400001E
_080910A8: .4byte TsaConfig_PrepMuralBackground
_080910AC: .4byte gBg3Tm

	thumb_func_start StartPrepMuralBackground
StartPrepMuralBackground: @ 0x080910B0
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	adds r5, r1, #0
	ldr r4, _080910F8 @ =Img_PrepMuralBackground
	movs r0, #3
	bl GetBgChrOffset
	adds r1, r0, #0
	movs r0, #0xc0
	lsls r0, r0, #0x13
	adds r1, r1, r0
	adds r0, r4, #0
	bl Decompress
	ldr r0, _080910FC @ =Pal_PrepMuralBackground
	lsls r1, r5, #5
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r4, _08091100 @ =ProcScr_PrepMuralBackground
	adds r0, r4, #0
	bl Proc_Find
	bl Proc_End
	adds r0, r4, #0
	adds r1, r6, #0
	bl Proc_Start
	adds r1, r0, #0
	adds r1, #0x2d
	strb r5, [r1]
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_080910F8: .4byte Img_PrepMuralBackground
_080910FC: .4byte Pal_PrepMuralBackground
_08091100: .4byte ProcScr_PrepMuralBackground

	thumb_func_start EndPrepMuralBackground
EndPrepMuralBackground: @ 0x08091104
	push {lr}
	ldr r0, _08091114 @ =ProcScr_PrepMuralBackground
	bl Proc_Find
	bl Proc_End
	pop {r0}
	bx r0
	.align 2, 0
_08091114: .4byte ProcScr_PrepMuralBackground

	thumb_func_start sub_8091118
sub_8091118: @ 0x08091118
	ldr r0, _08091130 @ =0x04000006
	ldrh r0, [r0]
	adds r3, r0, #0
	cmp r3, #0xa0
	bne _08091138
	movs r3, #0
	ldr r0, _08091134 @ =0x02012968
	ldr r2, [r0]
	ldr r1, [r0, #4]
	str r1, [r0]
	str r2, [r0, #4]
	b _08091140
	.align 2, 0
_08091130: .4byte 0x04000006
_08091134: .4byte 0x02012968
_08091138:
	ldr r0, _08091154 @ =0x02012968
	cmp r3, #0xa0
	bls _08091140
	movs r3, #0
_08091140:
	ldr r2, _08091158 @ =0x04000042
	ldr r0, [r0]
	lsls r1, r3, #2
	adds r1, r1, r0
	ldrb r3, [r1]
	lsls r0, r3, #8
	ldrb r1, [r1, #1]
	orrs r0, r1
	strh r0, [r2]
	bx lr
	.align 2, 0
_08091154: .4byte 0x02012968
_08091158: .4byte 0x04000042

	thumb_func_start SallyCir_Init
SallyCir_Init: @ 0x0809115C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	adds r4, r0, #0
	ldr r2, _080911D8 @ =gDispIo
	movs r0, #0x21
	rsbs r0, r0, #0
	ldrb r1, [r2, #1]
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	movs r1, #0x7f
	ands r0, r1
	strb r0, [r2, #1]
	adds r0, r4, #0
	adds r0, #0x2a
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	mov ip, r2
	cmp r0, #0
	bge _080911E8
	movs r0, #0x96
	str r0, [r4, #0x2c]
	movs r3, #0
	ldr r0, _080911DC @ =0x02012468
	mov sb, r0
	adds r4, #0x29
	mov r8, r4
	ldr r1, _080911E0 @ =0x02012968
	mov sl, r1
	mov r7, sb
	movs r4, #0
	movs r2, #0xf0
	movs r6, #0xa0
	lsls r6, r6, #2
	ldr r5, _080911E4 @ =0x00000281
_080911AA:
	lsls r0, r3, #2
	adds r0, r0, r7
	strb r4, [r0]
	strb r2, [r0, #1]
	adds r1, r0, r6
	strb r4, [r1]
	adds r0, r0, r5
	strb r2, [r0]
	adds r0, r3, #1
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	cmp r3, #0x9f
	bls _080911AA
	mov r1, ip
	adds r1, #0x2f
	movs r0, #0
	strb r0, [r1]
	adds r1, #4
	strb r0, [r1]
	subs r1, #5
	movs r0, #0xf0
	b _08091230
	.align 2, 0
_080911D8: .4byte gDispIo
_080911DC: .4byte 0x02012468
_080911E0: .4byte 0x02012968
_080911E4: .4byte 0x00000281
_080911E8:
	movs r0, #0
	str r0, [r4, #0x2c]
	movs r3, #0
	ldr r0, _0809129C @ =0x02012468
	mov sb, r0
	adds r4, #0x29
	mov r8, r4
	ldr r1, _080912A0 @ =0x02012968
	mov sl, r1
	mov r6, sb
	movs r2, #0x78
	movs r5, #0xa0
	lsls r5, r5, #2
	ldr r4, _080912A4 @ =0x00000281
_08091204:
	lsls r0, r3, #2
	adds r0, r0, r6
	strb r2, [r0]
	strb r2, [r0, #1]
	adds r1, r0, r5
	strb r2, [r1]
	adds r0, r0, r4
	strb r2, [r0]
	adds r0, r3, #1
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	cmp r3, #0x9f
	bls _08091204
	mov r2, ip
	adds r2, #0x2f
	movs r1, #0
	movs r0, #0x78
	strb r0, [r2]
	adds r2, #4
	strb r1, [r2]
	mov r1, ip
	adds r1, #0x2e
_08091230:
	strb r0, [r1]
	adds r1, #4
	movs r0, #0xa0
	strb r0, [r1]
	mov r2, ip
	adds r2, #0x35
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
	strb r0, [r2]
	adds r2, #1
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
	movs r0, #0
	mov r1, r8
	strb r0, [r1]
	mov r0, sb
	mov r1, sl
	str r0, [r1]
	movs r0, #0xa0
	lsls r0, r0, #2
	add r0, sb
	str r0, [r1, #4]
	ldr r0, _080912A8 @ =sub_8091118
	bl SetOnHBlankA
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0809129C: .4byte 0x02012468
_080912A0: .4byte 0x02012968
_080912A4: .4byte 0x00000281
_080912A8: .4byte sub_8091118

	thumb_func_start SallyCir_Loop
SallyCir_Loop: @ 0x080912AC
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	adds r6, r0, #0
	adds r0, #0x2a
	movs r1, #0
	ldrsb r1, [r0, r1]
	ldr r0, [r6, #0x2c]
	adds r0, r0, r1
	str r0, [r6, #0x2c]
	cmp r0, #0x96
	ble _080912CA
	movs r0, #0x96
	str r0, [r6, #0x2c]
_080912CA:
	ldr r0, [r6, #0x2c]
	cmp r0, #0
	bge _080912D4
	movs r0, #0
	str r0, [r6, #0x2c]
_080912D4:
	movs r1, #0
	movs r0, #0x29
	adds r0, r0, r6
	mov sb, r0
	ldr r7, _08091314 @ =0x02012968
	movs r2, #0x78
	mov r8, r2
_080912E2:
	ldr r0, [r6, #0x2c]
	lsls r5, r1, #0x10
	cmp r0, #0
	ble _08091302
	adds r4, r0, #0
	muls r4, r0, r4
	adds r0, r4, #0
	asrs r4, r5, #0x10
	adds r1, r4, #0
	subs r1, #0x50
	adds r2, r1, #0
	muls r2, r1, r2
	adds r1, r2, #0
	subs r0, r0, r1
	cmp r0, #0
	bge _08091318
_08091302:
	ldr r0, [r7, #4]
	asrs r1, r5, #0xe
	adds r0, r1, r0
	mov r4, r8
	strb r4, [r0]
	ldr r0, [r7, #4]
	adds r1, r1, r0
	strb r4, [r1, #1]
	b _0809133E
	.align 2, 0
_08091314: .4byte 0x02012968
_08091318:
	bl Sqrt
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x78
	ble _08091328
	movs r3, #0x78
_08091328:
	ldr r1, [r7, #4]
	lsls r2, r4, #2
	adds r1, r2, r1
	mov r4, r8
	subs r0, r4, r3
	strb r0, [r1]
	ldr r0, [r7, #4]
	adds r2, r2, r0
	adds r0, r3, #0
	adds r0, #0x78
	strb r0, [r2, #1]
_0809133E:
	movs r1, #0x80
	lsls r1, r1, #9
	adds r0, r5, r1
	lsrs r1, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x9f
	ble _080912E2
	mov r2, sb
	ldrb r0, [r2]
	adds r0, #1
	strb r0, [r2]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x28
	bne _08091362
	adds r0, r6, #0
	bl Proc_Break
_08091362:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start SallyCir_OnEnd
SallyCir_OnEnd: @ 0x08091370
	push {lr}
	movs r0, #0
	bl SetOnHBlankA
	pop {r0}
	bx r0

	thumb_func_start StartSallyCirProc
StartSallyCirProc: @ 0x0809137C
	push {r4, lr}
	adds r2, r0, #0
	lsls r4, r1, #0x18
	lsrs r4, r4, #0x18
	ldr r0, _08091398 @ =ProcScr_SallyCir
	adds r1, r2, #0
	bl Proc_StartBlocking
	adds r1, r0, #0
	adds r1, #0x2a
	strb r4, [r1]
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08091398: .4byte ProcScr_SallyCir

	thumb_func_start sub_809139C
sub_809139C: @ 0x0809139C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r1, r0, #0
	adds r1, #0x29
	movs r7, #0
	strb r7, [r1]
	ldr r1, _08091434 @ =gDispIo
	mov ip, r1
	movs r3, #1
	ldrb r1, [r1, #1]
	orrs r1, r3
	movs r2, #2
	mov r8, r2
	mov r2, r8
	orrs r1, r2
	movs r6, #4
	orrs r1, r6
	movs r5, #8
	orrs r1, r5
	movs r4, #0x10
	orrs r1, r4
	movs r2, #0x21
	rsbs r2, r2, #0
	ands r1, r2
	movs r2, #0x40
	orrs r1, r2
	movs r2, #0x7f
	ands r1, r2
	mov r2, ip
	strb r1, [r2, #1]
	mov r1, ip
	adds r1, #0x35
	ldrb r2, [r1]
	orrs r3, r2
	mov r2, r8
	orrs r3, r2
	orrs r3, r6
	orrs r3, r5
	orrs r3, r4
	strb r3, [r1]
	mov r3, ip
	adds r3, #0x36
	movs r1, #2
	rsbs r1, r1, #0
	ldrb r2, [r3]
	ands r1, r2
	movs r2, #3
	rsbs r2, r2, #0
	ands r1, r2
	subs r2, #2
	ands r1, r2
	subs r2, #4
	ands r1, r2
	subs r2, #8
	ands r1, r2
	strb r1, [r3]
	adds r0, #0x2a
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	ble _08091438
	mov r0, ip
	adds r0, #0x2f
	strb r7, [r0]
	adds r0, #4
	strb r7, [r0]
	mov r1, ip
	adds r1, #0x2e
	movs r0, #0xf0
	strb r0, [r1]
	adds r1, #4
	movs r0, #0xa0
	strb r0, [r1]
	b _08091452
	.align 2, 0
_08091434: .4byte gDispIo
_08091438:
	mov r1, ip
	adds r1, #0x2f
	movs r0, #0x78
	strb r0, [r1]
	mov r2, ip
	adds r2, #0x33
	movs r1, #0x50
	strb r1, [r2]
	subs r2, #5
	strb r0, [r2]
	mov r0, ip
	adds r0, #0x32
	strb r1, [r0]
_08091452:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_809145C
sub_809145C: @ 0x0809145C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	adds r6, r0, #0
	adds r2, r6, #0
	adds r2, #0x29
	ldrb r0, [r2]
	adds r0, #1
	strb r0, [r2]
	ldr r4, _080914DC @ =gDispIo
	movs r0, #0x21
	rsbs r0, r0, #0
	ldrb r1, [r4, #1]
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	movs r1, #0x7f
	ands r0, r1
	strb r0, [r4, #1]
	movs r1, #0xf
	ldrb r2, [r2]
	subs r1, r1, r2
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #7
	muls r0, r1, r0
	movs r1, #0xe1
	bl __divsi3
	movs r1, #0xa0
	lsls r1, r1, #2
	subs r1, r1, r0
	asrs r5, r1, #4
	adds r0, r6, #0
	adds r0, #0x2a
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	ble _080914E0
	lsls r1, r5, #1
	adds r2, r1, r5
	adds r0, r4, #0
	adds r0, #0x2f
	strb r2, [r0]
	adds r0, #4
	strb r1, [r0]
	movs r3, #0x10
	rsbs r3, r3, #0
	adds r0, r3, #0
	subs r0, r0, r2
	adds r2, r4, #0
	adds r2, #0x2e
	strb r0, [r2]
	movs r2, #0x60
	rsbs r2, r2, #0
	adds r0, r2, #0
	subs r0, r0, r1
	adds r1, r4, #0
	adds r1, #0x32
	strb r0, [r1]
	b _08091504
	.align 2, 0
_080914DC: .4byte gDispIo
_080914E0:
	lsls r2, r5, #1
	adds r1, r2, r5
	movs r0, #0x78
	subs r0, r0, r1
	adds r3, r4, #0
	adds r3, #0x2f
	strb r0, [r3]
	movs r0, #0x50
	subs r0, r0, r2
	adds r3, #4
	strb r0, [r3]
	adds r1, #0x78
	adds r0, r4, #0
	adds r0, #0x2e
	strb r1, [r0]
	adds r2, #0x50
	adds r0, #4
	strb r2, [r0]
_08091504:
	adds r2, r4, #0
	adds r2, #0x35
	movs r0, #1
	ldrb r3, [r2]
	orrs r0, r3
	movs r1, #2
	orrs r0, r1
	movs r1, #4
	orrs r0, r1
	movs r1, #8
	orrs r0, r1
	movs r1, #0x10
	orrs r0, r1
	strb r0, [r2]
	adds r1, r4, #0
	adds r1, #0x36
	movs r0, #2
	rsbs r0, r0, #0
	ldrb r2, [r1]
	ands r0, r2
	movs r3, #3
	rsbs r3, r3, #0
	mov sl, r3
	ands r0, r3
	movs r2, #5
	rsbs r2, r2, #0
	mov sb, r2
	ands r0, r2
	subs r3, #6
	mov r8, r3
	ands r0, r3
	movs r7, #0x11
	rsbs r7, r7, #0
	ands r0, r7
	strb r0, [r1]
	cmp r5, #0x27
	ble _0809157A
	adds r0, r6, #0
	bl Proc_Break
	adds r0, r6, #0
	adds r0, #0x2a
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	ble _0809157A
	movs r0, #2
	rsbs r0, r0, #0
	ldrb r1, [r4, #1]
	ands r0, r1
	mov r2, sl
	ands r0, r2
	mov r3, sb
	ands r0, r3
	mov r1, r8
	ands r0, r1
	ands r0, r7
	strb r0, [r4, #1]
_0809157A:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
